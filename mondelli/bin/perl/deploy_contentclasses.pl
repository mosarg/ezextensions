#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
use Getopt::Long;

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


my $dir_base='/sql/contentclasses';

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

#tables to deploy
my @deploy_tables=('ezcontentclass','ezcontentclass_attribute','ezcontentclass_classgroup','ezcontentclassgroup','ezcontentclass_name');


foreach my $table (@deploy_tables){
		system("mysql --user=$database_user --password=$database_password $current_database <$current_migration_folder/$table.sql");
	}