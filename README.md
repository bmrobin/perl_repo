#	BMROBIN PERL_REPO	#

# this repository is for generic perl scripts. i created this as a way to quickly access
# frequently used (and reused) scripts for work and home

# these subroutines perform various database tasks using the Perl DBI module
# see each file for info. i use the Oracle db driver connection
db_select1.pl
db_select1_ar.pl
db_select_all_ar_ref.pl
db_update.pl

# custom implementation of a common 'indexof' function - just for fun
indexof.pl

# i used to spend a lot of time digging through Windows servers looking for big log files
# while i have disk usage alerts, this helps me quickly find which log files
# are the culprits in taking up a lot of space.
large_logsize.pl

# written for the /r/dailyprogrammer subreddit - just for fun
pangram.pl

# this script leverages the Perl Mail::Sender module to send emails
send_email.pl
