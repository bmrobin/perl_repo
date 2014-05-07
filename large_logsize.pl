# THIS SCRIPT FINDS THE 3 LARGEST FILES ON A WINDOWS SERVER 
# IN THE SPECIFIED FOLDERS TO REDUCE TIME SPENT LOOKING 
# FOR LARGE FILES TO DELETE

use strict;
use warnings;
use Data::Dumper;

if ($^O ne "MSWin32") {
	die "Invalid operating system detected. This program is written for Windows";
}

my @directories = (
	'C:\Users\bmrobins\Desktop\Downloads',
	'C:\Users\bmrobins\Desktop\code'
	);

foreach my $each (@directories) {
	my $message = "\n\t*** 3 Largest Files ***\n\t-----------------------\n";
	$message = $message . "\t$each\n\n";
	print $message;
	largest_files($each);
	print "\n";
}

sub largest_files {
	my $dir = shift();
	my %logs;
	
	unless (-d $dir) {
		print "$dir is not a directory or could not be accessed\n";
		return;
	}
	my @dirlist = `dir /o-s/-c $dir`;
	my @size1 = split(' ',$dirlist[5]);
	my @size2 = split(' ',$dirlist[6]);
	my @size3 = split(' ',$dirlist[7]);
	
	my $size_1 = $size1[3]/1024/1024/1024;
	my $file_1 = $size1[4];
	my $size_2 = $size2[3]/1024/1024/1024;
	my $file_2 = $size2[4];
	my $size_3 = $size3[3]/1024/1024/1024;
	my $file_3 = $size3[4];
	
	$logs{$file_1} = $size_1;
	$logs{$file_2} = $size_2;
	$logs{$file_3} = $size_3;
	
	format_output(%logs);
}

sub format_output {
	my %hash = @_;
	
	my $max = 0;
	foreach (keys %hash) {
		if (length($_) > $max ){
			$max = length($_);
		}
	}
	
	foreach (sort keys %hash) {
		printf("%-*s\t= %.2fGb\n", $max, $_, $hash{$_});
	}
}