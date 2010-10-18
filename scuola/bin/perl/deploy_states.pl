#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
use Getopt::Long;
use DBI;
use DBD::mysql;
use Array::Diff;

my @states_to_update;
my @new_states;
my $current_database='ezlinussio';
my $database_user='ez';
my $database_password='sambackett';
my $operations_dir='';
my $work_dir='';

GetOptions('db=s'=>\$current_database,'user=s'=>\$database_user,'pwd=s'=>\$database_password,'dir=s'=>\$operations_dir);

sub get_last_migration{
    my @migrations=@_;
    my $last_migration_number=0;
    foreach (@migrations){
        $_=~m/.*_(\d*)/;
        $last_migration_number=$1  if ($1>$last_migration_number);
    }
    return $last_migration_number;
}


my $dir_base='/sql/states';
if($operations_dir ne ''){
    $work_dir=$operations_dir;
}else{
my $current_dir=getcwd;
$current_dir=~m/(\/var\/.*\/extension\/scuola).*/;
$work_dir=$1;

}

my @migrations=`ls $work_dir$dir_base`;
chop(@migrations);
my $migration_to_deploy=get_last_migration(@migrations);
my $current_migration_folder=$work_dir.$dir_base."/migration_".$migration_to_deploy;
print "Migrations $current_migration_folder\n";

#get old states
my $dsn = "dbi:mysql:$current_database:db:3306";
my $dbh = DBI->connect($dsn, $database_user, $database_password) or die "Can’t connect to the DB: $DBI::errstr\n";
my $statesh = $dbh->prepare('SELECT id FROM ezcobj_state WHERE priority=0');
$statesh->execute();
while  (my $state=$statesh->fetchrow_array() ){
    push(@states_to_update,$state);
    print "$state\n";
}


#deploy tables
my @deploy_tables=('ezcobj_state','ezcobj_state_group','ezcobj_state_group_language','ezcobj_state_language');
foreach my $table (@deploy_tables){
	system("mysql --user=$database_user --password=$database_password $current_database <$current_migration_folder/$table.sql");
}

#get new states
$statesh->execute();
while  (my $state=$statesh->fetchrow_array() ){
    push(@new_states,$state);
    print "$state\n";
}

#get states diff
my $diff= Array::Diff->diff( \@states_to_update, \@new_states);

#update db
my $add_query;
print "Added states @{$diff->added}\n";
foreach my $added_state (@{$diff->added}){
    $add_query=$dbh->prepare("INSERT INTO ezcobj_state_link (contentobject_id,
                            contentobject_state_id) SELECT id,$added_state FROM ezcontentobject");
    $add_query->execute();
}

my $remove_query;
print "Removed states @{$diff->deleted}\n";
foreach my $removed_state (@{$diff->deleted}){
    $remove_query=$dbh->prepare("DELETE FROM ezcobj_state_link WHERE contentobject_state_id=$removed_state");
    $remove_query->execute();
}
