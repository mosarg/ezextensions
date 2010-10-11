#!/usr/bin/perl
use strict;
use warnings;
use Cwd;

my $current_dir=getcwd;
my $extension_name='linussio';
my $database='m2000';
my $dir_base='';
my $command='';

print "$current_dir\n";

$current_dir=~m/(\/var\/.*\/extension\/)$extension_name.*/;
my $work_dir=$1;




my @table_groups=('contentclasses','sections','roles','states');

foreach my $table_group (@table_groups){


$dir_base="$extension_name/sql/$table_group";
unless (-d $work_dir.$dir_base){
    mkdir $work_dir.$dir_base or die "Can't create dir";}
#dump classes
$command='perl '.$work_dir."scuola/bin/perl/dump_$table_group.pl --db $database --user ez --pwd sambackett --dir ".$work_dir.$extension_name."  --lang ita ";
system($command);
}