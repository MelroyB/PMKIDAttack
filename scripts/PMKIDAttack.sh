#!/bin/sh


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/sd/lib:/sd/usr/lib
export PATH=$PATH:/sd/usr/bin:/sd/usr/sbin

MYTIME=`date +%s`
MYCMD=`cat /tmp/PMKIDAttack.run`

if [ "$1" = "start" ]; then
	eval ${MYCMD}
	#chmod +x /tmp/PMKIDAttack.run
	#/tmp/./PMKIDAttack.run
	rm -rf /tmp/PMKIDAttack.run
elif [ "$1" = "stop" ]; then
  	killall -9 hcxdumptool
	rm -rf /tmp/PMKIDAttack.run
fi
