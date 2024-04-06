#!/usr/bin/expect -f

set timeout -1
set segfaultToken $env(SEGFAULT_TOKEN)
 spawn ssh -o "SetEnv SECRET=$segfaultToken" root@lulz.segfault.net
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
        send "echo Thanks for hosting OkBuddyGSI Dumper!; "
        send "echo Automated Action by PugzAreCute to start OkBuddyGSI dumper bot. For any complaints regarding bugs/abuse contact t.me/pugzarecute, t.me/sounddrill or me@pugzarecute.com; "
        send "exit \n"
        exp_continue
    }
    eof
}
# credit to Pugzarecute for script