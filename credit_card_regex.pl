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
		case /^30[0-5]|^309|^36|^3[8-9]/ {print "Diners Club International\n";}
		case /^54|^55/ {print "Diners Club US & Canada\n";}
		case /^35(2[8-9]|[3-8][0-9])/ {print "JCB\n";}
		case /^(6304|6706|6771|6709)/ {print "Laser\n";}
		case /^(5018|5020|5038|5612|5893|6304|6759|6761|6762|6763|0604|6390)/ {print "Maestro\n";}
		case /^5019/ {print "Dankort\n";}
		case /^5[0-5]/ {print "Mastercard\n";}
		case /^(4026|417500|4405|4508|4844|4913|4917)/ {print "Visa Electron\n";}
		case /^4/ {print "Visa\n";}
		else {print "unrecognized card\n";}
	}
}