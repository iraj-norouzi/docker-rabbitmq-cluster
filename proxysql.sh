#!/bin/bash
. constants
printf "$YELLOW[$(date)] Waiting for ProxySQL service to initialize"
RC=1
while [ $RC -eq 1 ]
do
  sleep 1
  printf "."
  mysqladmin ping -h127.0.0.1 -P6032 -uadmin -padmin  > /dev/null 2>&1
  RC=$?
done
printf "$LIME_YELLOW\n"

printf "$POWDER_BLUE[$(date)] Configuring ProxySQL...$LIME_YELLOW\n"

mysql -uadmin -padmin -h127.0.0.1 -P6032 < /root/mysql_failover/config.sql
