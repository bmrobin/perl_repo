# THIS SCRIPT FINDS THE 3 LARGEST FILES ON A WINDOWS SERVER 
# IN THE SPECIFIED FOLDERS TO REDUCE TIME SPENT LOOKING 
# FOR LARGE FILES TO DELETE

use strict;
use warnings;

my @directories = (
	'"C:\Documents and Settings\bmrobins\Desktop\Downloads"',
	'"C:\Documents and Settings\bmrobins\Desktop\ffx_files"'
	);

my $message = "\n\t*** 3 Largest Files ***\n\t-----------------------\n";

foreach my $each (@directories) {
	$message = $message . "$each\n";
	largest_files($each);
}

print $message;

sub largest_files {
	my $dir = shift();
	
	my @dirlist = `dir /o-s/-c $dir`;
	my @size1 = split(' ',$dirlist[5]);
	my @size2 = split(' ',$dirlist[6]);
	my @size3 = split(' ',$dirlist[7]);
	my $size_1 = $size1[3]/1024/1024/1024;
	my $size_2 = $size2[3]/1024/1024/1024;
	my $size_3 = $size3[3]/1024/1024/1024;
	
	format_output($size_1, $size_2, $size_3);
}

sub format_output {
	my $s1 = shift();
	my $s2 = shift();
	my $s3 = shift();
	
	$message = $message . "\t" . sprintf("%.2f", $s1) . " Gb" . "\n";
	$message = $message . "\t" . sprintf("%.2f", $s2) . " Gb" . "\n";
	$message = $message . "\t" . sprintf("%.2f", $s3) . " Gb" . "\n\n";
}