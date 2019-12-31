#!/bin/sh


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/sd/lib:/sd/usr/lib
export PATH=$PATH:/sd/usr/bin:/sd/usr/sbin

[[ -f /tmp/PMKIDAttack.progress ]] && {
  exit 0
}

touch /tmp/PMKIDAttack.progress

if [ "$1" = "install" ]; then
  if [ "$2" = "internal" ]; then
	opkg update
    opkg install hcxdumptool
  elif [ "$2" = "sd" ]; then
    opkg update
    opkg install hcxdumptool

  fi

  touch /etc/config/PMKIDAttack
  echo "config PMKIDAttack 'run'" > /etc/config/PMKIDAttack
  echo "config PMKIDAttack 'settings'" >> /etc/config/PMKIDAttack
  echo "config PMKIDAttack 'autostart'" >> /etc/config/PMKIDAttack
  echo "config PMKIDAttack 'module'" >> /etc/config/PMKIDAttack

  uci set PMKIDAttack.settings.mode='normal'
  uci commit PMKIDAttack.settings.mode

  uci set PMKIDAttack.module.installed=1
  uci commit PMKIDAttack.module.installed

elif [ "$1" = "remove" ]; then
	opkg remove hcxdumptool
	opkg remove hcxtools
    rm -rf /etc/config/PMKIDAttack
fi

rm /tmp/PMKIDAttack.progress
