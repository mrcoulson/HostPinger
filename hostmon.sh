#!/bin/bash

# Load recipients and hosts from config file.
source hostmonconfig.cfg

# Get now.
now="$(date)"

# Iterate through hosts.
for i in "${hosts[@]}"
do
	# Add timestamp.
	status="$now"
	# Add host.
	status="$status \t $i"
	# Create count and set to results of ping piped to grep piped to line count.
	count=$(ping -c 1 $i | grep icmp* | wc -l)
	# If there are no lines (no returned pings)...
	if [[ $count -eq 0 ]]
	then
		status="$status \t Down"
		echo "$i is down. Please advise." | mail -s "$i is down!" $recipients
	else
		status="$status \t Alive"
	fi
	# Echo concatenated status to txt file.
	echo -e $status >> hostmonlog.txt
done
