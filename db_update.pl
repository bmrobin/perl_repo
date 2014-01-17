###################################################
# db_update($)
#	Used to run update statement and
#	return number of rows updated
###################################################

sub db_update($@) {
	my $ssql=shift(@_);
	my $db = shift(@_);
	$rows = $db->do($ssql);
	$db->commit; 
	print "db_update:$rows rows updated\n" if $logging <= 1;
	return $rows;
}