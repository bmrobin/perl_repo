Perl Code Snippet Repository
============================
This repository is for generic Perl scripts and code snippets. I created this as a way to quickly access
frequently used (and reused) scripts for work and home.

DBI examples
------------
Database perl scripts that use the ```DBI``` module for selecting and upating data. See each file for more info. I use the Oracle driver

indexof
-------
This is my implementation of a common indexof function. Perl has its own ```indexof``` function, I wrote this purely for educational and entertainment purposes.

large_logsize
-------------
Finds the 3 largest files in specified directories. I used to spend a lot of time digging through Windows servers looking for big log files. While I have disk usage alerts, this helps me quickly find which log files are the culprits in taking up a lot of space.

pangram
-------
Written for the /r/dailyprogrammer subreddit - [Challenge #139](http://www.reddit.com/r/dailyprogrammer/comments/1pwl73/11413_challenge_139_easy_pangrams/)

send_email
----------
An implementation of the ```Mail::Sender``` module

config_file
-----------
This reads a standard configuration text file of format
```
# comment line
key=value
```
It returns a hash of all the keys/values and has a subroutine for neatly printing them all out.

recurse_directory
-----------------
Perl equivalent of Windows command 
```dir /s /b```
