#!/bin/bash
# mountIMG.sh
# mount an img file for analysis
# Last Edited: 6/21/18 Julian Thies


# check if we have the privs we need
if [ "$(whoami)" != "root" ] ; then
	echo "Script must be run as root or with sudo privileges"
	exit
fi

# check if anything was passed in to the script
if [ -z "$1" ] ; then
	echo "No IMG file passed in"
	exit
else
	printf "Mount the .img file? (y/n) -> "
	read A
	if [ "$A" == "n" ] ; then
		exit
	elif [ "$A" == "y" ] ; then
		echo "Mounting..."
		userName="$(id -un)"
		mount -t "$1"
		echo "/media/$userName ====="
		ls -lR /media/$userName
	else
		echo "Invalid input"
		exit
	fi
fi