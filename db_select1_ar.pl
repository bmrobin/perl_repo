use DBI;

###################################################
# db_select1_ar($)
#	Used to query 1 columns, multiple rows
#	and return array
#	
#	pass DB handler like:
#	$db = DBI->connect("dbi:Oracle:[server]", "user", "pass");
#
#	usage:
#	@result = db_select1_ar('some sql', $db)
#
#	close handler:
#	$db->disconnect()
###################################################

sub db_select1_ar($@) {
	my @rows;
	my $ssql=shift(@_);
	my $db = shift(@_);
	my $num1;
	my $sth1 = $db->prepare($ssql);
	$sth1->execute();
	$sth1->bind_columns(\$rowVal);
	while( $sth1->fetch() ) {
		$num1 = push(@rows, $rowVal);
	}
	return @rows;
}