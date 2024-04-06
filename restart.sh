#!/usr/bin/expect -f

set timeout -1

 spawn ssh -o "SetEnv SECRET=$SEGFAULT_TOKEN" root@lulz.segfault.net
expect {
    -re "Are you sure you want to continue connecting \\(yes\\/no\\/\\\[fingerprint\\\]\\)\\? " {
        send "yes\n"
        exp_continue
    }
    "root@lulz.segfault.net's password: " {
        send "segfault\n"
        exp_continue
    }
    -re "Would you like to see your .*SECRET.* now\\? \\(y\\/N\\) " {
        send -- "N"
        exp_continue
    }
    -re ".*└─.*" {
        send "echo Restarting segfault!; "
        send "echo Automated Action by PugzAreCute to start OkBuddyGSI dumper bot. For any complaints regarding bugs/abuse contact t.me/pugzarecute, t.me/sounddrill or me@pugzarecute.com; "
        send "sudo reboot \n"
        exp_continue
    }
    eof
}
# credit to Pugzarecute for script