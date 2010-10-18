#!/usr/bin/perl
use strict;
use warnings;
use Cwd;

my $extension_name='linussio';
my $current_dir=getcwd;
my $dir_base='';
my $command='';

print "$current_dir\n";

$current_dir=~m/(\/var\/.*\/extension\/)$extension_name.*/;
my $work_dir=$1;



#my @table_groups=('contentclasses','sections','roles','states');


my @table_groups=('contentclasses','sections','states');

foreach my $table_group (@table_groups){


$dir_base="$extension_name/sql/$table_group";
unless (-d $work_dir.$dir_base){
    mkdir $work_dir.$dir_base or die "Can't create dir";}
#dump classes
$command='perl '.$work_dir."scuola/bin/perl/deploy_$table_group.pl --db ezlinussio --user ez --pwd sambackett --dir ".$work_dir.$extension_name;
system($command);
}