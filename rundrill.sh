#! /bin/sh
slp=$(( $RANDOM % 20 + 15 ));
echo "Sleeping for $slp seconds"
sleep $[ $slp ]s

echo "Drillbit on host $HOSTNAME is starting ... "
#mv /root/apache-drill-1.8.0/conf/drill-override.conf  /root/apache-drill-1.8.0/conf/drill-override.conf.bak
#mv /root/apache-drill-1.8.0/conf/drill-override-example.conf  /root/apache-drill-1.8.0/conf/drill-override.conf
sed -ie "s/export JAVA_HOME/#export JAVA_HOME/" /root/apache-drill-1.8.0/bin/drill-config.sh

if [ ! -z "$1" ] ; then
	echo "Setting cluster name to $1... "
	sed -ie "s/drillbits1/$1/" /root/apache-drill-1.8.0/conf/drill-override.conf
fi;

if [ ! -z "$2" ] ; then
	echo "Setting ZK quorum  to $2... "
	sed -ie "s/localhost:2181/$2/" /root/apache-drill-1.8.0/conf/drill-override.conf
fi;

/root/apache-drill-1.8.0/bin/drillbit.sh restart
tail -f /root/apache-drill-1.8.0/log/drillbit.out
