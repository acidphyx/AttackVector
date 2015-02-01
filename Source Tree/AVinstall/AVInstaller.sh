#!/bin/bash

# AttackVector Installation Script v1.0b
# Created by Acidphyx
# http://www.elitehackertech.com

export USER=$(whoami)

function SystemCheck {
	clear
	echo " Welcome to the AttackVector Installer."
	echo "v1.0b"
	sleep 1
	echo
	echo "Running System Check..."
	if [ "$USER" = "root" ]; then
		echo
		echo "Running as $USER!"
	else
		echo "You are not running as root!"
		echo "AttackVector was designed for use"
		echo "in a root environment!"
		sleep 2
		echo
		echo "Login as root and then install again!"
		sleep 1
		exit
	fi
	echo
	echo "Checking for Install Directory..."
	if [ -e /root/attackvector/ ]; then
		export AV=TRUE
			InstallType
	else
		export AV=FALSE
			InstallType
	fi
}

function InstallType {
	if [ "$AV" = "TRUE" ]; then
		echo
		echo "---> Install Directory Detected!"
		echo
		echo "---> AttackVector directory."
		echo "---> /root/attackvector/ seems to exist."
		echo
		echo "---> What would you like todo?"
		echo
		echo "---> Overwrite - Will just extract the archive and replace program files!"
		echo "---> Destroy-Overwrite - Will remove /root/attackvector/ and recreate it before installation!"
		 OPTIONS="Overwrite Fresh-Install Quit"
		select opt in $OPTIONS; do
			if [ "$opt" = "Quit" ]; then
				echo
				echo "Quitting Installer!"
				sleep 2
				exit
			elif [ "$opt" = "$opt" ]; then
				echo
				echo "You have selected $opt!"
				export METHOD=$opt
				sleep 1
					DOWNDEP
			else
				echo
				echo "Invalid Selection!"
			fi
		done
	else
		echo "No Default previous installation detected!"
		sleep 2
		export METHOD=Fresh-Install
			DOWNDEP
	fi
}

function DOWNDEP {
	echo "Downloading required applications!"
	echo
	echo "-Fragrouter"
	echo
	echo "Press enter to continue, or enter [q] to quit, or enter [s] to skip!"
	read A
	if [ "$A" = "$(cat /dev/null)" ]; then
		echo
		clear
		echo "Starting Download..."
		apt-get -q -y install fragrouter > ./fragrouter.log
			DOWNCHECK
	elif [ "$A" = "q" ]; then
		echo
		echo "Quitting Installer!"
		sleep 2
		exit
	elif [ "$A" = "s" ]; then
		echo
		echo "---> Skipping..."
		sleep 1
			AVINST
	else
		echo
		echo "Invalid Selection!"
	fi
}

function DOWNCHECK {
	clear
	echo "Downloading Complete!"
	echo
	echo "Checking for successful installation..."
	export FROUTE=$(cat ./fragrouter.log |grep 'Setting up')
	if [ "$FROUTE" != "$(cat /dev/null)" ]; then
		echo 
		echo "Fragrouter installation successful!"
		sleep 1
			AVINST
	else
		echo
		echo "---> It appears that the installation of Fragrouter was unsuccessful!"
		echo "---> Press Enter to quit the program and verify the installation of fragrouter."
		echo
		echo "---> If you are sure it is installed then please type 'continue', and press enter."
		echo "---> Enter Below:"
		read Q
		if [ "$Q" = "continue" ]; then
			echo
			echo "---> Continuing anyway..."
			sleep 1
				AVINST
		elif [ "$Q" = "$(cat /dev/null)" ]; then
			echo
			echo "---> Exiting Installer..."
			sleep 2
				exit
		else
			echo
			echo "---> Invalid Selection!"
			echo "---> Exiting Installer..."
			sleep 2
				exit
		fi
	fi
}
		
function AVINST {
	clear
	echo "---> Initalizing installation of AttackVector..."
	if [ "$METHOD" = "Overwrite" ]; then
		echo "---> Preparing Previous installation for overwrite..."
		mkdir /tmp/AVbackup
		echo "---> Backuping up old data..."
		mv /root/attackvector/logs /tmp/AVbackup/
		mv /root/attackvector/pmkdb /tmp/AVbackup/
		mv /root/attackvector/databases /tmp/AVbackup/
		mv /root/attackvector/certificates /tmp/AVbackup/
		echo
		echo "---> Would you like to keep the old 'Output' directory?"
		echo "---> [y/n]"
		read Q
		if [ "$Q" = "y" ]; then
			echo
			echo "---> Backing up old output directory..."
			mv /root/attackvector/output /root/attackvector/backup/
				AVINST1
		elif [ "$Q" = "n" ]; then
			echo
			echo "---> Old output folder set for destruction..."
				AVINST1
		else
			echo "---> Invalid Selection!"
			echo "---> Try Again!"
		fi
	elif [ "$METHOD" = "Fresh-Install" ]; then
		echo
		echo "---> Fresh Installation."
		echo "---> Any files contained in /root/attackvector/ will be DESTROYED!"
		echo
		echo "---> Press Enter to Continue!"
		read Q
		if [ "$Q" = "$(cat /dev/null)" ]; then
			AVINST1
		elif [ "$Q" = "quit" ]; then
			echo
			echo "---> Installer Quitting..."
			sleep 1
				exit
		else
			echo
			echo "---> Invalid Entry!"
			echo "---> Try Again!"
			sleep 2
				AVINST
		fi
	fi		
}

function AVINST1 {
	echo
	echo "---> Installing Attack Vector...."
	if [ "$METHOD" = "Overwrite" ]; then
		rm -rf /root/attackvector/*
		cp -R --preserve ./preinst/* /root/attackvector/
		rm -rf /root/attackvector/logs
		rm -rf /root/attackvector/databases
		rm -rf /root/attackvector/output
		rm -rf /root/attackvector/certificates
		rm -rf /root/attackvector/pmkdb
		mv /tmp/AVbackup/* /root/attackvector/
		echo "---> Attack Vector Installation Complete!"
		sleep 1
		echo "---> You may run the program via /root/attackvector/attack.sh"
		echo "---> Installer will now exit!"
		sleep 2
			exit
	elif [ "$METHOD" = "Fresh-Install" ]; then
		rm -rf /root/attackvector/
		mkdir /root/attackvector
		cp -R --preserve ./preinst/* /root/attackvector/
		echo "---> Installation Complete!"
		echo "---> You may run the program via /root/attackvector/attack.sh"
		sleep 1
		echo "--> Installer will now exit!"
		sleep 2
			exit
	else
		mkdir /root/attackvector
		cp -R --preserve ./preinst/* /root/attackvector/
		echo "---> Installation Complete!"
		echo "---> You may run the program via /root/attackvector/attack.sh"
		sleep 1
		echo "---> Installer will now exit!"
		sleep 2
			exit
	fi
}
		
SystemCheck
