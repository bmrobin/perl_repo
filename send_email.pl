# THIS SCRIPT SENDS EMAILS WITH OR WITHOUT ATTACHMENTS

my $recipient = $ARGV[0];
if($recipient eq '') {
$sender = new Mail::Sender {
if($attachment ne ''){