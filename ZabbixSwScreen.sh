#!/bin/bash

#====================================================================#
# ZabbixSwScreen - Create a screen from all ports on Zabbix 3.0.* 
# 
# Diego Neves  - <diego@diegoenves.eti.br - github.com/diegoaceneves/
# 
# LICENSE - GPL3.0
#
# 2016


if [ $# != 3  ] ; then
	echo "Use: $0 HOSTNAME TYPE PORTS"
	echo "$0 SWITCH01 1 48"
	echo "TYPE: 1 = FastEthernet0"
	echo "TYPE: 2 = GigabitEthernet0"
	echo "TYPE: 3 = GigabitEthernet1/0"
	exit 1
fi


HOSTNAME=$1
PREFIX=$2
PORTS=$3

vsize=$((PORTS /3))
IP=`host $HOSTNAME | cut -d" " -f4`

case $PREFIX in
	1)
		P="FastEthernet0"
	;;
	2)
		P="GigabitEthernet0"
	;;
	3)
		P="GigabitEthernet1/0"
	;;
	*)
		echo "Digite 1 para FastEthernet0, 2 Para GigabitEthernet0 ou 3 Para GigabitEthernet1/0"
		exit 1
	;;
esac

echo -e "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > $HOSTNAME.xml
echo -e "<zabbix_export>" >> $HOSTNAME.xml
echo -e "    <version>3.0</version>" >> $HOSTNAME.xml
echo -e "    <date>2016-06-07T12:21:50Z</date>" >> $HOSTNAME.xml
echo -e "    <screens>" >> $HOSTNAME.xml
echo -e "        <screen>" >> $HOSTNAME.xml
echo -e "            <name>$HOSTNAME</name>" >> $HOSTNAME.xml
echo -e "            <hsize>3</hsize>" >> $HOSTNAME.xml
echo -e "            <vsize>$vsize</vsize>" >> $HOSTNAME.xml
echo -e "            <screen_items>" >> $HOSTNAME.xml

i=1
x=0
y=0
while [ $i -le $PORTS ];do
    echo -e "                <screen_item>" >> $HOSTNAME.xml
    echo -e "                    <resourcetype>0</resourcetype>" >> $HOSTNAME.xml
    echo -e "                    <width>500</width>" >> $HOSTNAME.xml
    echo -e "                    <height>100</height>" >> $HOSTNAME.xml
    echo -e "                    <x>$x</x>" >> $HOSTNAME.xml
    echo -e "                    <y>$y</y>" >> $HOSTNAME.xml
    echo -e "                    <colspan>1</colspan>" >> $HOSTNAME.xml
    echo -e "                    <rowspan>1</rowspan>" >> $HOSTNAME.xml
    echo -e "                    <elements>0</elements>" >> $HOSTNAME.xml
    echo -e "                    <valign>0</valign>" >> $HOSTNAME.xml
    echo -e "                    <halign>0</halign>" >> $HOSTNAME.xml
    echo -e "                    <style>0</style>" >> $HOSTNAME.xml
    echo -e "                    <url/>" >> $HOSTNAME.xml
    echo -e "                    <dynamic>0</dynamic>" >> $HOSTNAME.xml
    echo -e "                    <sort_triggers>0</sort_triggers>" >> $HOSTNAME.xml
    echo -e "                    <resource>" >> $HOSTNAME.xml
    echo -e "                        <name>Network traffic on $P/$i</name>" >> $HOSTNAME.xml
    echo -e "                        <host>$IP</host>" >> $HOSTNAME.xml
    echo -e "                    </resource>" >> $HOSTNAME.xml
    echo -e "                    <max_columns>3</max_columns>" >> $HOSTNAME.xml
    echo -e "                    <application/>" >> $HOSTNAME.xml
    echo -e "                </screen_item>" >> $HOSTNAME.xml
    (( x++ ))
    if [ $x -lt 3 ] ; then
	echo "">/dev/null
    else
	x=0
        (( y++ ))
    fi
    (( i++ ))
done

echo -e "            </screen_items>" >> $HOSTNAME.xml
echo -e "        </screen>" >> $HOSTNAME.xml
echo -e "    </screens>" >> $HOSTNAME.xml
echo -e "</zabbix_export>" >> $HOSTNAME.xml
