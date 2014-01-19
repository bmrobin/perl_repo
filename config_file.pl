# THIS SCRIPT CONTAINS SUBROUTINES FOR
# HANDLING A MOMENTUM CONFIG FILE

use strict;
use warnings;

# READ A CONFIG FILE FROM FILEPATH AND RETURN A HASH OF THE VALUES	
sub parse_config {
	my $file = shift();
	my %conf;
	open (CONFIGFILE, "<$file") || die ("\nERROR - Could not open config file!\n\tEnsure $file exists\n");
	my @temp = <CONFIGFILE>;
	close CONFIGFILE;
	
	foreach my $line (@temp) {
		chomp($line);
		
		# skip comments and empty lines
		if (($line =~ m/^#/) || ($line =~ /^$/) ){
			next;
		}
		
		my ($key, $value) = split("=", $line);
		$conf{$key} = $value;
	}
	return %conf;
}

# NEATLY PRINT OUT THE HASH OF CONFIG FILES VALUES
sub print_config {
	my %config = @_;
	
	my $max = 0;
	foreach (keys %config) {
		if (length($_) > $max ){
			$max = length($_);
		}
	}
	
	foreach (sort keys %config) {
		printf("%-*s\t=\t%s\n", $max, $_, $config{$_});
	}
}

1;