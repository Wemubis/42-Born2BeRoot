#!/bin/bash

MAC_ADR=$(ip address show | grep -oP '(?<=ether ).*(?= brd)')
CONNECTION_TCP=$(cat /proc/net/tcp | wc -l)

#CPU + vCPU
CPU=$(lscpu | egrep 'CPU\(s\)|Thread|Socket' -m 1 | awk 'END{print $NF}')
THREADS=$(lscpu | egrep 'CPU\(s\)|Thread|Socket' -m 3 | awk 'END{print $NF}')
CORES=$(lscpu | egrep 'CPU\(s\)|Thread|Socket' -m 4 | awk 'END{print $NF}')
VCPU=$(($CPU * $THREADS * $CORES))
CPU_IDLE=$(mpstat | tail -n 1 | awk '{print $NF}')
CPU_LOAD=$(echo 100 - $CPU_IDLE | bc)

#MEMORY USAGE
TOTAL_MEM=$(vmstat -s | grep memory -m 1 | awk '{print $1}')
USED_MEM=$(vmstat -s | grep memory -m 2 | awk '{print $1}' | tail -n 1)
PERCENTAGE_MEM_USED=$(($USED_MEM * 100 / $TOTAL_MEM))

#DISK USAGE
TOTAL_DISK_KB=$(df --total --output=size | awk 'END{print $NF}')
TOTAL_DISK_GB=$(df -h --total --output=size | awk 'END{print $NF}')
USED_DISK=$(df --total --output=used | awk 'END{print $NF}')
PERCENTAGE_DISK_USED=$(($USED_DISK * 100 / $TOTAL_DISK_KB))

#CONDITION
if [[ ${CPU_LOAD::1} == "." ]]
	then
		ZERO=0
	else
		ZERO=''
fi

if [[ `lsblk | grep lvm` ]]
	then
		ANSWER="yes"
	else
		ANSWER="no"
fi

#PRINT IN EVERY TERMINAL
wall "
	#Architecture	 : `uname -a`
	#CPU physical 	 : $CPU
	#vCPU 			 : $VCPU
	#Memory Usage	 : `expr $USED_MEM / 1024`/`echo $TOTAL_MEM / 1024 | bc`MB (${PERCENTAGE_MEM_USED}%)
	#Disk Usage		 : `echo $USED_DISK / 1024 | bc`/${TOTAL_DISK_GB}B (${PERCENTAGE_DISK_USED}%)
	#CPU load		 : ${ZERO}${CPU_LOAD}%
	#Last boot		 : `who -b | grep -oE '....-..-.. ..:..'`
	#LVM use		 : $ANSWER
	#Connections TCP : `echo $CONNECTION_TCP - 1 | bc` ESTABLISHED
	#User log		 : `who | wc -l`
	#Network		 : IP `hostname -I` ($MAC_ADR)
	#Sudo 			 : `sudo cat /var/log/sudo/sudo.log | grep COMMAND | wc -l`cmd"