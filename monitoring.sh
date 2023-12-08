#!/bin/bash
arc=$(uname -a)
pcpu=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
vcpu=$(grep "^processor" /proc/cpuinfo | wc -l)
fram=$(free --mega | awk '$1 == "Mem:" {print $2}')
uram=$(free --mega | awk '$1 == "Mem:" {print $3}')
pram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')
fdisk=$(df -BG | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}')
udisk=$(df -BM | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}')
pdisk=$(df -BM | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} {ut += $3} END {printf("%d"), ut/ft*100}')
cpul=$(mpstat | grep all | awk '{printf("%.1f%%"), 100-$13}')
lb=$(who -b | awk '{print $3 " " $4}')
lvm=$(if [$(lsblk | grep "lvm" | wc -l) -eq 0]; then echo no; else echo yes; fi)
ctcp=$(ss -at | grep ESTAB | wc -l)
ulog=$(users | wc -w)
ip=$(hostname -I)
mac=$(ip link show | grep "ether" | awk '{print $2}')
cmds=$(journalctl _COMM=sudo | grep COMMAND | wc -l)
wall "	#Architecture: $arc
		#CPU physical : $pcpu
		#vCPU : $vcpu
		#Memory Usage: $uram/${fram}MB ($pram%)
		#Disk Usage: $udisk/${fdisk}Gb ($pdisk%)
		#CPU load: $cpul%
		#Last boot: $lb
		#LVM use: $lvm
		#Connections TCP : $ctcp ESTABLISHED
		#User log: $ulog
		#Network: IP $ip ($mac)
		#Sudo : $cmds cmd"
