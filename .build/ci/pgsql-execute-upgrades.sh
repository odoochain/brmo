#!/usr/bin/env bash
CURSNAPSHOT=$(grep "<version>.*<.version>" -m1 pom.xml | sed -e "s/^.*<version/<version/" | cut -f2 -d">"| cut -f1 -d"<")
NEXTRELEASE="${CURSNAPSHOT%-SNAPSHOT}"
MAJOR="${CURSNAPSHOT%.*}"
MINOR="${NEXTRELEASE##*.}"
PREVMINOR=$(($MINOR-1))
PREVRELEASE=$MAJOR.$PREVMINOR

#if [ $CURSNAPSHOT = "2.0.0-SNAPSHOT" ]
#then
#    PREVRELEASE="1.6.3"
#fi

echo "Huidige snapshot:" $CURSNAPSHOT", vorige release: "$PREVRELEASE", komende release: "$NEXTRELEASE
echo "Verwerk upgrade script voor: " $1

psql -U postgres -h localhost -d $1 -f ./datamodel/upgrade_scripts/$PREVRELEASE-$NEXTRELEASE/postgresql/$1.sql