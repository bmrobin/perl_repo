use DBI;

###################################################
# db_select_all_ar_ref($)
#	Used to query multiple rows and make an
#	array of array references for returning
#
#	Data Storage Example:
#		ROW1a	ROW1b	ROW1c
#		ROW2a	ROW2b	ROW2c
#		...	...	...
#	
#	pass DB handler like:
#	$db = DBI->connect("dbi:Oracle:[server]", "user", "pass");
#	
#	Usage:
#	$result = db_select_all_ar_ref('some sql', $db)
#	for $i ( 0 .. (@{$result} - 1) ) {
#		$resultSet->[$i][0]
#		...etc...
#	}
#
#	close handler:
#	$db->disconnect()
###################################################
sub db_select_all_ar_ref($@) {
	my $ar_ref;
	my $ssql=shift(@_);
	my $db=shift(@_);
	my $sth1 = $db->prepare($ssql);
	$sth1->execute();
	$ar_ref = $sth1->fetchall_arrayref;
	return $ar_ref;
}