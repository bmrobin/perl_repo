# THIS SCRIPT FINDS THE 3 LARGEST FILES ON A WINDOWS SERVER 
# IN THE SPECIFIED FOLDERS TO REDUCE TIME SPENT LOOKING 
# FOR LARGE FILES TO DELETE

use Mail::Sender;

##########INITIALIZE DRIVE & FOLDERS########
$drive=$ARGV[0]."\:";
$environment=$ARGV[1];
$binlog="$drive\\Momentum\\$environment\\bin\\log";
$binarc="$drive\\Momentum\\$environment\\bin\\archive";
$batchlog="$drive\\Momentum\\$environment\\bin\\batch\\log";
$batcharc="$drive\\Momentum\\$environment\\bin\\batch\\archive";
############################################

##########CHECK IN \bin\log#################
my @dirlist = `dir /o-s/-c $binlog`;
my @size1 = split(' ',@dirlist[5]);
my @size2 = split(' ',@dirlist[6]);
my @size3 = split(' ',@dirlist[7]);
$size_1 = @size1[3]/1024/1024/1024;
$size_2 = @size2[3]/1024/1024/1024;
$size_3 = @size3[3]/1024/1024/1024;
my $message = "\n" . "$binlog"."\n";
my $message = $message . "------------------------------------------------------"."\n";
my $message = $message . sprintf("%.2f", $size_1)." GB" . "\n";
my $message = $message . sprintf("%.2f", $size_2)." GB" . "\n";
my $message = $message . sprintf("%.2f", $size_3)." GB" . "\n" . "\n";
############################################

##########CHECK IN \bin\archive#############
my @dirlist = `dir /o-s/-c $binarc`;
my @size1 = split(' ',@dirlist[5]);
my @size2 = split(' ',@dirlist[6]);
my @size3 = split(' ',@dirlist[7]);
$size_1 = @size1[3]/1024/1024/1024;
$size_2 = @size2[3]/1024/1024/1024;
$size_3 = @size3[3]/1024/1024/1024;
my $message = $message . "$binarc"."\n";
my $message = $message . "------------------------------------------------------"."\n";
my $message = $message . sprintf("%.2f", $size_1)." GB" . "\n";
my $message = $message . sprintf("%.2f", $size_2)." GB" . "\n";
my $message = $message . sprintf("%.2f", $size_3)." GB" . "\n" . "\n";
############################################

##########CHECK IN \bin\batch\log###########
my @dirlist = `dir /o-s/-c $batchlog`;
my @size1 = split(' ',@dirlist[5]);
my @size2 = split(' ',@dirlist[6]);
my @size3 = split(' ',@dirlist[7]);
$size_1 = @size1[3]/1024/1024/1024;
$size_2 = @size2[3]/1024/1024/1024;
$size_3 = @size3[3]/1024/1024/1024;
my $message = $message . "$batchlog"."\n";
my $message = $message . "------------------------------------------------------"."\n";
my $message = $message . sprintf("%.2f", $size_1)." GB" . "\n";
my $message = $message . sprintf("%.2f", $size_2)." GB" . "\n";
my $message = $message . sprintf("%.2f", $size_3)." GB" . "\n" . "\n";
############################################

##########CHECK IN \bin\batch\archive#######
my @dirlist = `dir /o-s/-c $batcharc`;
my @size1 = split(' ',@dirlist[5]);
my @size2 = split(' ',@dirlist[6]);
my @size3 = split(' ',@dirlist[7]);
$size_1 = @size1[3]/1024/1024/1024;
$size_2 = @size2[3]/1024/1024/1024;
$size_3 = @size3[3]/1024/1024/1024;
my $message = $message . "$batcharc"."\n";
my $message = $message . "------------------------------------------------------"."\n";
my $message = $message . sprintf("%.2f", $size_1)." GB" . "\n";
my $message = $message . sprintf("%.2f", $size_2)." GB" . "\n";
my $message = $message . sprintf("%.2f", $size_3)." GB" . "\n" . "\n";

###################################################
## SEND REPORT EMAIL
###################################################
my $subject = "Largest Logs in $environment";
my $maillist = "brobinson\@USAID.GOV";

sendemail($maillist, $subject, $message);
#print $message;

####################################################################################################
#				SUBROUTINES							   #
####################################################################################################

####################################################
# sendemail($@)
#	Used to a variety of emails, including
#	with attachments and to multiple people
#
#	@Param	recipient(s), subject, message, attachment(s)
####################################################
sub sendemail($@)
{
	#send emails with attachment option
	my $recipient = shift();
	my $subject = shift();
	my $message = shift();
	my $attachment = shift();

	if($recipient eq '')
	{
		print "Error: Please specify a recipient\n Usage: perl send_email.pl <recipient> <subject> <message> <attachment path>\n";
		exit -1;
	}
	elsif($subject eq '')
	{
		print "Error: Please specify a subject\n Usage: perl send_email.pl <recipient> <subject> <message> <attachment path>\n";
		exit -1;
	}
	elsif($message eq '')
	{
		print "Error: Please specify a message\n Usage: perl send_email.pl <recipient> <subject> <message> <attachment path>\n";
		exit -1;
	}

	$sender = new Mail::Sender {
		smtp => 'AUS2K3BHSWASH04.US.USAID.GOV',
		from => 'CGITechMailList@USAID.GOV'
		};

	if($attachment ne '')
	{
		$sender->MailFile({
			to=>$recipient,
			subject=>$subject,
			msg=>$message,
			file=>$attachment
		});
	}
	else
	{
		$sender->MailMsg({
			to=>$recipient,
			subject=>$subject,
			msg=>$message
		});
	}
}