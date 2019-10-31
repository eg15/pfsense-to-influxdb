#!/bin/sh

case "$1" in
start)
  /root/bin/pfsense_to_influxdb -u http://1.2.3.4:8086 -d office_lan -n 192.168.0.0/16 -i igb0 >/dev/null 2>&1 &
  ;;
stop)
  ppid=`pgrep -d, -f pfsense_to_influxdb`
  [ -n "$ppid" ] && /bin/pkill -P $ppid rate
  ;;
*)
  echo "Usage: `basename $0` {start|stop}" >&2
  exit 1
  ;;
esac

exit 0
