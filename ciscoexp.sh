#!/usr/bin/expect -f
set username [lindex $argv 0]
set password [lindex $argv 1]
set host [lindex $argv 2]
set commands [lindex $argv 3]
#set timeout 10 

set f [open "$commands"]
set COMMAND [split [read $f] "\n"]
close $f

# SSH'ng the Host
spawn ssh -q -o StrictHostKeyChecking=no $username@$host

expect {
  timeout { send_user "\nFailed to get password prompt\n"; exit 1 }
  eof { send_user "\nSSH failure for $host\n"; exit 1 }
  "*assword"
}

# Send Password if SSH is Successful
send "$password\r"

# If Prompts *# not found, Return Login Failed
expect {
  timeout { send_user "\nLogin failed. Password incorrect.\n"; exit 1}
  "*#"
 }

#Shun List
foreach cmd $COMMAND {
        send "$cmd\r"
        expect "#"
}

send "end\r"
send "exit\r"
expect eof { send_user "\nCommands Run Successfully\n"}
