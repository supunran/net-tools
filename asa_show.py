import netmiko
import re

print ('''
###################################################################
-------------- Welcome to ASA Configuration Fetcher ---------------
-------------------------------------------------------------------
 You can collect configuration using this Script and use a tool to 
              compare before and after configuration.
                        Version 1.0
###################################################################
''')
commands = ['show int ip bri', 'show failover', 'show access-list | i name hash', 'show shun', 'show run all']
print ("""Please create a file named \"devices.txt\" consisting the 
IPs/Names you want this script to run against. You may need to rename the output file after
running the script once, and delete the output.txt since it will use the same name to capture the
after configuration as well\n""")
user = input ("Enter your username : ")
pw = input("Enter your password : ")
f = open ("devices.txt", "r")
g = open ("output.txt", "a+")
devices = f.read().split("\n")
f.close()
for device in devices:
    print (f'-------- Connecting to {device} ----------')
    g.write(f'---------------- Connecting to {device} ------------------\n')
    asa = netmiko.ConnectHandler(host=device, username=user, password=pw, device_type="cisco_asa")
    for command in commands:
        print (f'-------- Sending Command {command} ----------')
        g.write(f'-------- Sending Command {command} ----------\n')
        output = asa.send_command(command)
        print (output)
        g.write(output)
g.close()
