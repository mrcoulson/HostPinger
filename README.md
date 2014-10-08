HostPinger
==========

Pings hosts, records results, and emails an alert if a host is down.  

Files
=====

* hostmon.sh: A shell script that does the work.
* hostmonconfig.cfg: A configuration file with hosts to ping and recipients to email.  We didn't want to have to touch our script to add hosts or recipients.
* hostmonlog.txt: A tab-delimited text file where the ping results are recorded.
