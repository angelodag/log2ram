#!/bin/sh

if [ `id -u` -eq 0 ]
then
  cp log2ram.service /etc/systemd/system/log2ram.service
  chmod 644 /etc/systemd/system/log2ram.service
  cp log2ram /usr/local/bin/log2ram
  chmod a+x /usr/local/bin/log2ram
  cp log2ram.conf /etc/log2ram.conf
  chmod 644 /etc/log2ram.conf
  systemctl enable log2ram
  cp log2ram.crontab /etc/cron.daily/log2ram
  chmod +x /etc/cron.daily/log2ram
  
  if [ -d /var/log.hdd ]; then
    rm -r /var/log.hdd
  fi

  echo "##### Reboot to activate log2ram #####"
else
  echo "You need to be ROOT (sudo can be used)"
fi
