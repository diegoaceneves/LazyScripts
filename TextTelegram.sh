#!/bin/bash

#====================================================================#
# TextTelegram.sh - Send Text Messages 
# 
# Diego Neves  - <diego@diegoenves.eti.br - github.com/diegoaceneves/
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <phk@FreeBSD.ORG> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return Poul-Henning Kamp
# ----------------------------------------------------------------------------

# TOKEN = create a bot with @BotFather and paste the token here:
TOKEN="1234567897:ABCDEFGHIJKLMNOPQRDS_TUVWXYZ1234545"

# CHATID = Id user/group chat;
#	1) Send a simple message to bot:
#	2) Access https://api.telegram.org/bot<YourBOTToken>/getUpdates
# 	3) Look for the "chat" object
#	4) use "id" of the "chat" object to send your messages.
CHATID=32541444


APIURL="https://api.telegram.org/bot"
FILE=$(/bin/date +\%Y\%m\%d\%H\%M)

CURL="/usr/bin/curl"

$CURL  -K -s -X POST $APIURL$TOKEN/sendMessage?chat_id=$CHATID --data-urlencode "text=$1"

echo ""
