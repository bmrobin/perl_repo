	BMROBIN PERL_REPO

this repository is for generic perl scripts. i created this as a way to quickly access
frequently used (and reused) scripts for work and home

    DBI examples
database perl scripts that use the DBI module for selecting and upating data. see each file for more info. i use the Oracle db driver

    indexof
this is my implementation of a common indexof function. i wrote this for fun because i found myself using many nested substring functions to return what i wanted.

    large_logsize
finds 3 largest files in specified directories. i used to spend a lot of time digging through Windows servers looking for big log files. while i have disk usage alerts, this helps me quickly find which log files are the culprits in taking up a lot of space.

    pangram
written for the /r/dailyprogrammer subreddit. just out here for fun

    send_email
an implementation of the Mail::Sender module

    config_file
this reads a config text file of format
```
# comment line
key=value
```
it returns a hash of all the keys/values and has a subroutine for printing them all out

    recurse_directory
perl equivalent of windows command "dir /s /b"