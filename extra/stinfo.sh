#!/bin/bash

#This will send the 'st.info' file to another machine so that it can understand
#the Suckless Terminal.


#Make some vars
con=""
file=`dirname $0`/../st.info


function help {
	echo "$0 [user@host]"
	exit 1
}
if [[ $# -eq 0 ]]; then help; fi


#Go through the arguments.
while [[ $# -gt 0 ]]; do
	case "$1" in
	'-h'|'--help')
		help
		;;
	*)
		con="$1"
		;;
	esac
	shift
done


#Send the file over
scp "$file" "$con":/tmp/
#Install the file
ssh "$con" 'tic -sx /tmp/st.info'
