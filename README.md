This particular repository consists of scripts that are being used for tasks like making changes on devices, gettting backups and performing validations after upgrades.
# Cisco IOS, IOS-XE
ciscoshell.sh and cisco_exp.sh are scripts you can use together for running show commands or making config changes on cisco devices. Moreover you can use these scripts tweaking a little bit for any other vendors as well. (You run only the ciscoshell.sh script ; it will call ciscoexp.sh and run the commands)
# Ansible scripts for ASA upgrade validations
asa_show_before.yml and asa_show_after.yml scripts are used to collect useful information from ASA devices before and after upgrading them to perform validation.
