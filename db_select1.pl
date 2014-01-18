use DBI;

###################################################
# db_select1($)
#	Used to query 1 column, 1 row and return value
#
#	pass DB handler like:
#	$db = DBI->connect("dbi:Oracle:[server]", "user", "pass");
#
#	usage:
#	$result = db_select('some sql', $db)
#
#	close handler:
#	$db->disconnect()
###################################################

sub db_select1($@) {
	my $ssql=shift(@_);
	my $db = shift(@_);
	@results = $db->selectrow_array($ssql);
	my $answer = $results[0];

	# NOTE - remove this line if you want your program to check for NULL
	$answer=-100 if $answer eq '';

	return $answer;	
}