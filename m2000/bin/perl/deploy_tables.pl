#!/usr/bin/perl
use strict;
use warnings;
use Cwd;

my $current_dir=getcwd;
my $dir_base='';
my $command='';

#print "$current_dir\n";

#$current_dir=~m/(\/var\/.*\/extension\/)m2000.*/;
#my $work_dir=$1;

my $work_dir="/var/www/ez2/extension/";

my @table_groups=('contentclasses');

foreach my $table_group (@table_groups){


$dir_base="m2000/sql/$table_group";
unless (-d $work_dir.$dir_base){
    mkdir $work_dir.$dir_base or die "Can't create dir";}
#dump classes
$command='perl '.$work_dir."scuola/bin/perl/deploy_$table_group.pl --db eztest2 --user ez --pwd sambackett --dir ".$work_dir.'m2000';
system($command);
}