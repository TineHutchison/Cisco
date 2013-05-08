#!/bin/sh
#
# This script takes a file with "show interface" information.
# It outputs a list of ports that have not been used since the last reboot.
#
# Created by Tine Hutchison (tine@tine.us) 2013-05-08.
# (and yes, this is incredibly basic)
#
# Example Usages:
# unused_ports.sh GigabitE infile
# unused_ports.sh FastE infile



interface_type=$1
in_file=$2

echo $interface_type
echo $in_file

egrep "($interface_type|Last input)" $in_file | egrep -B1 "output never" | egrep -A1 $interface_type | egrep -v '\-\-'
