#!/usr/bin/expect -f

set timeout -1
set segfaultToken $env(SEGFAULT_TOKEN)

# Check if SEGFAULT_INSTANCE is set and not empty
if {[info exists env(SEGFAULT_INSTANCE)] && $env(SEGFAULT_INSTANCE) ne ""} {
    # If SEGFAULT_INSTANCE is set and not empty, use its value
    set SEGFAULT_INSTANCE $env(SEGFAULT_INSTANCE)
} else {
    # If SEGFAULT_INSTANCE is not set or empty, set it to the default value
    set SEGFAULT_INSTANCE "lulz.segfault.net"
}

spawn ssh -o "SetEnv SECRET=$segfaultToken" root@$SEGFAULT_INSTANCE
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
# credit to PugzAreCute for script