#!/bin/bash

#configure based on the env variables
sed -i "s+sqlalchemy+${SQLALCHEMY_DATABASE_URI}+g" /etc/dim/dim.cfg
sed -i "s+authmethod+${AUTHENTICATION_METHOD}+g" /etc/dim/dim.cfg
sed -i "s+testkey+${SECRET_KEY}+g" /etc/dim/dim.cfg
#sed -r -i "s/^[# ]*gmysql-user=.*/gmysql-user=${MYSQL_USER}/g" /etc/pdns/pdns.conf
#sed -r -i "s/^[# ]*gmysql-password=.*/gmysql-password=${MYSQL_PASS}/g" /etc/pdns/pdns.conf
#sed -r -i "s/^[# ]*gmysql-dbname=.*/gmysql-dbname=${MYSQL_DB}/g" /etc/pdns/pdns.conf
#sed -r -i "s/^[# ]*gmysql-dnssec=.*/gmysql-dnssec=${MYSQL_DNSSEC}/g" /etc/pdns/pdns.conf

cat /etc/dim/dim.cfg
#initialize db
/dim/manage_db init
#start dim
/dim/manage_dim runserver --host 0.0.0.0
