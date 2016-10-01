#!/bin/sh

sed -ie "s/export JAVA_HOME/#export JAVA_HOME/" apache-drill-1.8.0/bin/drill-config.sh

if [ ! -z "$1" ] ; then
	sed -ie "s/drillbits1/$1/" apache-drill-1.8.0/conf/drill-override.conf
fi;

if [ ! -z "$2" ] ; then
	sed -ie "s/localhost:2181/$2/" apache-drill-1.8.0/conf/drill-override.conf
fi;
apache-drill-1.8.0/bin/drillbit.sh --config apache-drill-1.8.0/conf start
tail -f apache-drill-1.8.0/log/drillbit.out
