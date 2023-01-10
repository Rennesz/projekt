#Description: This script is for monitoring your system the output of script will be send to your email
#Author: Rene Masaryk
#Contact: Rene.Masaryk

	

#AVAIABLE DISK SPACE
rm ~/Monitoring/HTML/DISKSPACE.txt 2>/dev/null
DS=$(df -h)
		
	echo "$DS" >> ~/Monitoring/HTML/DISKSPACE.txt 
	cat ~/Monitoring/HTML/"DISKSPACE.txt" | { cat ;} | ./tabulate.sh -d " " -t "Disk Space" -h "Avaialbe Disk Space" > ~/Monitoring/HTML/"DISKSPACE.html"
 

#COUNTING PROCCESES
rm ~/Monitoring/HTML/Processes.txt 2>/dev/null

PSC=$(ps -aux | wc -l)

	echo "$PSC RUNNING_PROCCESES" >> ~/Monitoring/HTML/Processes.txt

#PROCESSES

PS=$(ps -aux)

	echo "$PS" >> ~/Monitoring/HTML/Processes.txt
	cat ~/Monitoring/HTML/"Processes.txt" | { cat ;} | ./tabulate.sh -d " " -t "PROCESSES" -h "PROCCESES" > ~/Monitoring/HTML/"Processes.html"



#THIS COMMAND WILL COUNT USERS
rm ~/Monitoring/HTML/Users.txt 2>/dev/null

UC=$(who | cut -d " " -f 1 | sort -u | wc -w)
	echo "$UC Logged in users" >> ~/Monitoring/HTML/Users.txt

	
#THIS COMMAND WILL SHOW LOGGED IN USERS		             
US=$(who)

	echo "$US" >> ~/Monitoring/HTML/Users.txt
	cat ~/Monitoring/HTML/"Users.txt" | { cat ;} | ./tabulate.sh -d " " -t "USERS" -h "USERS" > ~/Monitoring/HTML/"USERS.html"

#THIS WILL DISPALY NETWORK CONFIGURATION
rm ~/Monitoring/HTML/Networkconfiguration.txt 2>/dev/null
CONF=$(ifconfig)

	echo "$CONF" >> ~/Monitoring/HTML/Networkconfiguration.txt
	cat ~/Monitoring/HTML/"Networkconfiguration.txt" | { cat ; } | ./tabulate.sh -d " " -t "Network" -h "Network Configuration" > ~/Monitoring/HTML/"Network_Configuration.html"

#THIS WILL DISPLAY
rm ~/Monitoring/HTML/Hostnamectl.txt 2>/dev/null
host=$(hostnamectl)

	echo "$host" >> ~/Monitoring/HTML/Hostnamectl.txt
	cat  ~/Monitoring/HTML/"Hostnamectl.txt" | { cat ;} | ./tabulate.sh -d ":" -t "Hostnamectl" -h "Hostnamectl" > ~/Monitoring/HTML/"Hostnamectl.html"


#
FREE=$(free -h -t)

	echo "$FREE" >> ~/Monitoring/HTML/Free.txt
	cat ~/Monitoring/HTML/"Free.txt" | { cat ;} | ./tabulate.sh -d " " -t "Used Memory" -h "Used Memory in System" > ~/Monitoring/HTML/"Free.html"
