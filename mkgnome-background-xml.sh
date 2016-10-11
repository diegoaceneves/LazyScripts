#!/bin/bash
#====================================================================#
# mkgnome-background-xml - Create a background.xml for gnome-shell 
# 
# Diego Neves  - <diego@diegoenves.eti.br - github.com/diegoaceneves/
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <phk@FreeBSD.ORG> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return Poul-Henning Kamp
# ----------------------------------------------------------------------------
#

array=(`ls -d $1/*`)
sizeof=${#array[@]}
i=1
TIME="600.0"
#TIME="6.0"
echo "<background>"

echo " <static>"
echo "  <duration>$TIME</duration>"
echo "  <file>${array[$i]}</file>"
echo " </static>"

while [[ $i -lt $sizeof ]] ;do
	echo " "
	echo " <transition type=\"overlay\">"
	echo "  <duration>$TIME</duration>"
	echo "  <from>${array[$i]}</from>"

	echo "  <to>${array[$i]}</to>"
	(( i++ ))
	echo " </transition>"


done

echo "</background>"
