#!/bin/bash

#configure based on the env variables
sed -r -i "s/^[# ]*gmysql-host=.*/gmysql-host=${MYSQL_HOST}/g" /etc/pdns/pdns.conf
sed -r -i "s/^[# ]*gmysql-port=.*/gmysql-port=${MYSQL_PORT}/g" /etc/pdns/pdns.conf
sed -r -i "s/^[# ]*gmysql-user=.*/gmysql-user=${MYSQL_USER}/g" /etc/pdns/pdns.conf
sed -r -i "s/^[# ]*gmysql-password=.*/gmysql-password=${MYSQL_PASS}/g" /etc/pdns/pdns.conf
sed -r -i "s/^[# ]*gmysql-dbname=.*/gmysql-dbname=${MYSQL_DB}/g" /etc/pdns/pdns.conf
sed -r -i "s/^[# ]*gmysql-dnssec=.*/gmysql-dnssec=${MYSQL_DNSSEC}/g" /etc/pdns/pdns.conf


#initialize db
/dim/manage_db init
#start dim
/dim/manage_dim runserver --host 0.0.0.0
