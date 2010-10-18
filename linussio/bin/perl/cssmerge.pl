#!/usr/bin/perl
use strict;
use warnings;
use CSS::Minifier qw(minify);


my @css_files_content=("survey.css","video.css","generics.css","dipendenti.css","misc.css","boxes.css","tables.css","authnavigator.css","headers.css",
                "icons.css","maps.css","forum.css","image.css","article.css","blog.css",
                "doclinkeditfile.css","infogalleryfactbox.css","profpersonalpage.css","frontpage.css","ufficio.css","circolari.css",
                "gruppi.css","user.css","embed.css","poll.css","quotes.css","agenda.css","contentstructure.css","diff.css");

my @css_files_ezflow=("headers.css","zones.css","blocks.css","columns.css","boxes.css");

my @css_files_pagelayout=("extracontent.css","misc.css","registration.css","mainarea.css","menu.css","columns.css",
                            "breadcrumbs.css","pageheader.css","registration.css","footer.css");


my @css_files_core=("body.css","headings.css","paragraphs.css","links.css","tables.css",
                    "lists.css","forms.css","messages.css","position.css");

my @css_elements=(\@css_files_content,\@css_files_ezflow,\@css_files_pagelayout,
                    \@css_files_core);


my $dest_path="/var/www/linussio/extension/linussio/design/ezflow/stylesheets/";



my @css_files=("core","pagelayout","ezflow","content");

foreach my $dest_file (@css_files) {
    print "$dest_file\n";


open(CONTENT ,"+>$dest_path$dest_file.cssclear") or die "Can't create file";

print CONTENT "/*DO NOT EDIT THIS FILE IS AUTOMATICALLY GENERATED*/\n";

my @file_list=@{pop(@css_elements)};
foreach my $file (@file_list){
    print "$file\n";
    open PART, $dest_path.$dest_file.'/'.$file or die "Can't open $file";
    print CONTENT "/* $file */\n";
    print CONTENT while (<PART>);
    close PART;
}
close CONTENT;
open(CONTENT ,"$dest_path$dest_file.cssclear") or die "Can't create file";
open(MINCONTENT ,">$dest_path$dest_file.css") or die "Can't create file";
minify(input => *CONTENT, outfile => *MINCONTENT);
close MINCONTENT;
close CONTENT;
unlink("$dest_path$dest_file.cssclear");
}


