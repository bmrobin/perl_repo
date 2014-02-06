# THIS SCRIPT SENDS EMAILS WITH OR WITHOUT ATTACHMENTS
use Mail::Sender;
my $recipient = $ARGV[0];my $subject = $ARGV[1];my $message = $ARGV[2];my $attachment = $ARGV[3];
if($recipient eq '') {	print "Error: Please specify a recipient\n";	exit -1;} elsif($subject eq '') {	print "Error: Please specify a subject\n";	exit -1;} elsif($message eq '') {	print "Error: Please specify a message\n";	exit -1;}
$sender = new Mail::Sender {	smtp => 'YOUR.SMTP.HERE',	from => 'your.address@mail.com',	};
if($attachment ne ''){	$sender->MailFile({		to=>$recipient,		subject=>$subject,		msg=>$message,		file=>$attachment,		debug=>'email_log.log'	});} else {	$sender->MailMsg({		to=>$recipient,		subject=>$subject,		msg=>$message,		debug=>'email_log.log'	});}