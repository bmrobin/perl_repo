#	REGEX PROGRAM TO IDENTIFY CREDIT CARD TYPES
use strict;
use warnings;
use Switch;

my $cc_number = "";

while ($cc_number ne "exit") {
	
	print "Enter credit card number:";
	$cc_number = <>;
	chomp($cc_number);
	
	switch ($cc_number) {
		case /[^\d]/ {print "credit card must contain numbers only\n";}
		case /^34|^37/ {print "American Express\n";}
		case /^(6011|622(12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[0-2][0-5])|64[4-9]|65)/ {print "Discover Card\n";}
		case /^62|^88/ {print "China UnionPay\n";}
		case /^30[0-5]|^309|^36|^38|^39/ {print "Diners Club [something]\n";}
		case /^54|^55/ {print "Diners Club US & Canada\n";}
		else {print "unrecognized card\n";}
	}
}