#!/usr/bin/env bash
CURSNAPSHOT=$(grep "<version>.*<.version>" -m1 pom.xml | sed -e "s/^.*<version/<version/" | cut -f2 -d">"| cut -f1 -d"<")

echo "Huidige snapshot:" $CURSNAPSHOT
echo "Verwerk extra upgrade script voor: " $1

export SQLPATH=./.jenkins

if [ $CURSNAPSHOT = "1.6.4-SNAPSHOT" ] && [ $1 = "rsgb" ]
then
    sqlplus -l -S jenkins_$1/jenkins_$1@192.168.1.11:1521/ORCL < ./datamodel/extra_scripts/oracle/206_bag_views.sql
    sqlplus -l -S jenkins_$1/jenkins_$1@192.168.1.11:1521/ORCL < ./datamodel/extra_scripts/oracle/207_brk_views.sql
fi