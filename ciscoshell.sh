#!/bin/bash
echo -n "Enter your username: " ; read username
echo -n "Enter your password: " ; read -s password
printf "\n"
echo -n "Enter your Device List: " ; read device
echo -n "Enter your COMMANDS file: " ; read commands

for hosts in $(cat $device)
do
printf "Connecting to $hosts\n"
./shunexp.sh $username $password $hosts $commands
done | tee -a Log_$(date +%m%d%Y-%T).txt
