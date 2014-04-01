#	REGEX PROGRAM TO IDENTIFY CREDIT CARD TYPES
use strict;
use warnings;
use Switch;

print "Enter credit card number:";
my $cc_number = <>;
chomp($cc_number);

switch ($cc_number) {
	case /^34|^37/ {print "American Express\n";}
	case /^62|^88/ {print "China UnionPay\n";}
	
	else {print "unrecognized card\n";}
}