# THIS SCRIPT BEHAVES LIKE 'indexOf' IN OTHER PROGRAMMING LANUAGES
# 	If given substring matches given string exactly, returns zero-based start position
# 	If substr doesn't match, returns -1
# 	If Nth is specified, returns zero-based start position of the Nth occurrence
# 	If Nth is specified but is out of scope, returns -1
#
#  USAGE:
#  indexof(string, substr [,nth])
#    string: the string to search in
#    substr: the substring to find position of in string
#    nth   : if specified, searches for the Nth occurrence of substring in string

use strict;
use warnings;

# TESTING
my $string = "This string tests my string index of sub";
print "Pass\n" if (&indexof($string, "str", 1) == 5);
print "Pass\n" if (&indexof($string, "str", 2) == 21);
print "Pass\n" if (&indexof($string, "str")    == 5);
print "Pass\n" if (&indexof($string, "non")    == -1);

sub indexof {
	my $str = shift();
	my $substr = shift();
	my $nth = shift();
	my $i=0;
	my $j=0;
	my $t=0;
	my $count=0;
	my $found=0;
	
	# test if string is found
	if ($str =~ m/$substr/) {
		
		# if =1 char
		if (length($substr) == 1) {
			while ($i < length($str)) {
				if (substr($str, $i, 1) eq $substr) {
					$j++;
					if (!defined($nth)) {
						# we have a winner!
						return $i;
					}
					elsif ($j == $nth) {
						# we have a winner!
						return $i;
					}
				}
				$i++;
			}
		}
		
		# if >1 char
		while ($i < length($str)) {
		
			# if first char matches, check substr
			if (substr($str, $i, 1) eq substr($substr, $j, 1)) {
				$found = $i;
				$j++;
				$i++;
				# check each char in substr
				while ($t < length($substr)) {
					$t++;
					if (substr($str, $i, 1) eq substr($substr, $j, 1)) {
						# check if at end of substr
						if ($t == length($substr)-1) {
							$count++;
							# substr match, but is it the Nth?
							if (!defined($nth)) {
								# we have a winner!
								return $found;
							}
							elsif ($count == $nth) {
								# we have a winner!
								return $found;
							}
							else {
								$i++;
								$j++;
								next;
							}
						}
						# we still match, check next char
						else {
							$j++;
							$i++;
							next;
						}
					}
					# substr didn't match
					else {
						$t = 0;
						last;
					}
					
				}
			}
			# char didn't match - advance and reset
			$i++;
			$j = 0;
			$found = 0;
		}
		return -1;
	}
	else {
		# string was not found
		return -1;
	}
	
	
}

