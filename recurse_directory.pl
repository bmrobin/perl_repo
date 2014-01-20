# RECURSIVELY GATHER ALL FILES IN A GIVEN DIRECTORY
# AND RETURN AN ARRAY OF THE CONTENTS
# perl equivalent of "dir /s /b"

use strict;
use warnings;

sub recurse_directory {
	my $path = shift();
	my @return;
	
	# if no path specified use current directory
	if (!defined($path)) {
		$path = ".";
	}
	
	opendir (DIR, $path) || die "Unable to open $path";
	# ignore '.' and '..', ignore archive folders, add path to filename
	# 	i ignore these - add any other exclusions here
	my @files = map {$path . '/' . $_} grep { !/^\.{1,2}$|[Aa]rchive/ } readdir (DIR);
	closedir (DIR);
	
	foreach my $obj (@files) {
		if (-d $obj) {
			# get contents of directory
			recurse_directory ($obj);
		} else {
			# save filename
			push(@return, $obj);
		}
	}
	return @return;
}