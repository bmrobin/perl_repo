#	REGEX PROGRAM TO IDENTIFY CREDIT CARD TYPES
use strict;
use warnings;
use Switch;

print "Enter credit card number:";
my $cc_number = <>;
chomp($cc_number);

switch ($cc_number) {
	case /[^\d]/ {print "credit card must contain numbers only";}
	case /^34|^37/ {print "American Express\n";}
	#case /^(6011|622[126]|64[4-9]|65)/ {print "Discover Card";}
	case /^62{1}|^88/ {print "China UnionPay\n";}
	case /^30[0-5]|^309|^36|^38|^39/ {print "Diners Club [something]\n";}
	case /^54|^55/ {print "Diners Club US & Canada";}
	else {print "unrecognized card\n";}
}