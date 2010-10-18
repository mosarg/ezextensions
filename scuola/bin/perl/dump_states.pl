#!/usr/bin/perl
use strict;
use warnings;
use  Cwd;
use Getopt::Long;

my $current_database='m2000';
my $database_user='ez';
my $database_password='sambackett';
my $operations_dir='';
my $work_dir='';
my $languages='';

GetOptions('db=s'=>\$current_database,'user=s'=>\$database_user,'pwd=s'=>\$database_password,'dir=s'=>\$operations_dir,,'lang=s'=>\$languages);

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
unless (-d $work_dir.$dir_base){
		mkdir $work_dir.$dir_base or die "Can't create dir";
	}

}


my @migrations=`ls $work_dir$dir_base`;
chop(@migrations);

my $last_migration=get_last_migration(@migrations);

#Create new migration folder
my $current_migration_folder=$work_dir.$dir_base."/migration_".($last_migration+1);
mkdir $current_migration_folder or die "Can't create migration folder";

#tables to dump
my @dump_tables=('ezcobj_state','ezcobj_state_group','ezcobj_state_group_language','ezcobj_state_language');

foreach  my $table (@dump_tables ){
	
	system("mysqldump  --user=$database_user --password=$database_password --add-drop-table -h localhost $current_database $table >$current_migration_folder/$table.sql");
	}