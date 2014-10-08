HostPinger
==========

Pings hosts, records results, and emails an alert if a host is down.  My coworker Brett came up with the idea and the magic for piping `ping` results to `grep` and then `wc` to count lines.  I merely scripted his desires into reality. 

Files
-----

* hostmon.sh: A shell script that does the work.
* hostmonconfig.cfg: A configuration file with hosts to ping and recipients to email.  We didn't want to have to touch our script to add hosts or recipients.
* hostmonlog.txt: A tab-delimited text file where the ping results are recorded.

Instructions
------------

1) Copy all three files to the same directory on your machine.
2) Run `chmod u+x ./hostmon.sh` to make the script executable.
3) Run `./hostmon.sh`.
4) Maybe attach it to a cron job and amaze your boss when you fix dead hosts before he even knows they're down.

Caveat
------

This is tested to run on Ubuntu Server's Bash.  I first began to work out the code on OS X and Raspbian, so I am aware that some syntax massaging may be required on different systems.
