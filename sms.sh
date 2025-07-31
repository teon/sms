#!/bin/bash
#
# Simple sms tool using Modem Manager
#
# Copyright (C) 2025 Robert Olejnik <teon@build.sh>
#

function usage() {
    echo "`basename $0` <option> [arg] [argX]..."
    echo ""
    echo "send [number] [text]    - send message"
    echo "ls                      - show messages"
    echo "read [number]           - read sms num X"
    echo "del  [number X]         - delete sms X, if not given ALL!"
    echo "all                     - show ALL smseses"
}

function check_arg() {
  local name=$1
  local arg="$2"

  if [[ -z "$arg" ]]; then
    echo "ERROR: $name is empty..."
    usage
    exit 1
  fi
}


# get modem number
MODEMNO=$(mmcli -L | grep -o "Modem/[0-9]" | grep -o [0-9]$)

case $1 in
	"send")

	    NUMBER=$2
	    TEXT=$3

	    check_arg "number" $NUMBER 
	    check_arg "text message" $TEXT

	    #create sms in modem and get number
	    SMSNO=$(mmcli -m ${MODEMNO} --messaging-create-sms="text='$TEXT',number=$NUMBER" |  grep -o [0-9]*$)
	    #send message
	    mmcli -s ${SMSNO} --send

	    # delete all sent messages
	    for i in $(mmcli -m ${MODEMNO} --messaging-list-sms | grep " (sent)" | cut -f5 -d' ') ; do
		mmcli -m ${MODEMNO} --messaging-delete-sms=$i
	    done
	;;

	"read")
	
	    SMS=$2
	    check_arg "SMS number" $SMS
	    mmcli -m ${MODEMNO} --sms $SMS
	
	;;

	"del")

	    SMS=$2
	    check_arg "SMS number" $SMS

	    if [ "X${SMS}" == "X" ]; then
		echo "Deleging ALL..."

		for i in $(mmcli -m ${MODEMNO} --messaging-list-sms | cut -f5 -d' ') ; do
			mmcli -m ${MODEMNO} --messaging-delete-sms=$i
		done
	    else
		mmcli -m ${MODEMNO} --messaging-delete-sms=${SMS}
	    fi
	;;

	"all")
		for i in $(mmcli -m ${MODEMNO} --messaging-list-sms | cut -f5 -d' ') ; do
			mmcli -m ${MODEMNO} --sms $i
		done
		;;
	
	"ls")
		mmcli -m ${MODEMNO} --messaging-list-sms
		;;

        "help")
                usage
        	exit 0
    		;;
    	*)
        	usage
		exit 1
	;;
esac


