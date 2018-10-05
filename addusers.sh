#!/usr/bin/expect -f

for {set i 2} {$i <= 40} {incr i} { 
	
	if { $i < 10 } {
		spawn pveum useradd student0$i@pam -group Students
		expect EOF
		spawn pveum passwd student0$i@pam
		expect "Enter new password"
		send -- "student0$i\r"
		expect "Retype new password"
		send -- "student0$i\r"
		set x [ expr $i - 1 ]
		spawn pveum aclmod /vms/20$x -user student0$i@pam -role PVEVMUser
		expect EOF
		spawn adduser student0$i
		expect "Enter new UNIX password"
		send -- "student0$i\r"
		expect "Retype new UNIX password"
		send -- "student0$i\r"
		expect "Enter the new"
		send -- "\r"
		expect "Room Number"
		send -- "\r"
		expect "Work Phone"
		send -- "\r"
		expect "Home Phone"
		send -- "\r"
		expect "Other"
		send -- "\r"
		expect "Is the information correct"
		send -- "\r"	
	} else {
		spawn pveum useradd student$i@pam -group Students
		expect EOF
		spawn pveum passwd student$i@pam
		expect "Enter new password"
		send -- "student$i\r"
		expect "Retype new password"
		send -- "student$i\r"
		set x [ expr $i - 1 ]
		spawn pveum aclmod /vms/2$x -user student$i@pam -role PVEVMUser
		expect EOF
		spawn adduser student$i
		expect "Enter new UNIX password"
		send -- "student$i\r"
		expect "Retype new UNIX password"
		send -- "student$i\r"
		expect "Enter the new"
		send -- "\r"
		expect "Room Number"
		send -- "\r"
		expect "Work Phone"
		send -- "\r"
		expect "Home Phone"
		send -- "\r"
		expect "Other"
		send -- "\r"
		expect "Is the information correct"
		send -- "\r"	
	}

}
