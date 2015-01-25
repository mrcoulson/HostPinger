#!/bin/bash

# Load recipients and hosts from config file.
source ./hostmonconfig.cfg

# Get now.
now="$(date)"

function getStatus {
	# Iterate through hosts.
	for i in "${hosts[@]}"
	do
		# Add timestamp.
		status="$now"
		# Add host.
		status="$status \t $i"
		# Create count and set to results of ping piped to grep piped to line count.
		count=$(ping -c $pings $i | grep icmp* | wc -l)
		# If there are no lines (no returned pings)...
		if [[ $count -eq 0 ]]
		then
			status="$status \t Down"
			sendEmail
		else
			status="$status \t Alive"
		fi
		# Echo concatenated status txt to file.
		echo -e $status >> hostmonlog.txt
	done
}

function sendEmail {
	echo "$i is down at $now. Please advise." | mail -s "$i is down!" $recipients
}

getStatus
