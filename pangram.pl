# THIS SCRIPT IDENTIFIES WHETHER OR NOT A GIVEN
# STRING IS A PANGRAM
# http://www.reddit.com/r/dailyprogrammer/comments/1pwl73/11413_challenge_139_easy_pangrams/

use strict;
use Data::Dumper;
use warnings;

my ($num_lines, $iter, $line);
my @string;
my @letters;

$num_lines = <>;
$iter = 0;

while ($iter < $num_lines) {
	$line = lc(<>);
	chomp($line);
	@string = $line =~ /./sg;
	for (my $i=0; $i < scalar(@string); $i++) {
		if (! ($string[$i] ~~ @letters) && ($string[$i] =~ /[a-z]/) && ($string[$i] ne "")){
			push(@letters, $string[$i]);
		}
	}
	@letters = sort @letters;
	print Dumper @letters;
	if (scalar(@letters) == 26) {
		print "True\n";
	}
	else {
		print "False\n";
	}
	$iter++;
	undef @letters;
}

