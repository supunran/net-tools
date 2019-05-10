This particular repository consists of scripts that are being used for tasks like making changes on devices, gettting backups and performing validations after upgrades.
# Cisco IOS, IOS-XE
<b><i>ciscoshell.sh</i></b> and <b><i>ciscoexp.sh</i></b> are scripts you can use together for running show commands or making config changes on cisco devices. Moreover you can use these scripts tweaking a little bit for any other vendors as well. (You run only the ciscoshell.sh script ; it will call ciscoexp.sh and run the commands from a file on a list of devices from a file). So you have to have a list of commands and a list of devices in two seperate files handy, which the script will prompt you to enter the names of those files. </br> 1. ~# chmod 744 ciscoshell.sh </br> 2. ~# chmod 744 ciscoexp.sh </br> 3. ~#  ./ciscoshell.sh
# Ansible scripts for ASA upgrade validations
<b><i>asa_show_before.yml</i></b> and <b><i>asa_show_after.yml</i></b> scripts are used to collect useful information from ASA devices before and after upgrading them to perform validation. You need to create the inventory file for this (host.txt) </br>
1. ~# ansible-playbook -i host.txt -u username -k asa_show_before.yml </br>
After the upgrade;
2. ~# ansible-playbook -i host.txt -u username -k asa_show_after.yml </br>
