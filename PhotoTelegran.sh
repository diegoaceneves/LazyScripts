#!/bin/bash

#====================================================================#
# PhotoTelegram.sh - Send Photo take with webcam to telegram 
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
TOKEN="123456789:ASDFGHJKLQERTYUIOPZXCVBNM1234567890"

# CHATID = Id user/group chat;
#	1) Send a simple message to bot:
#	2) Access https://api.telegram.org/bot<YourBOTToken>/getUpdates
# 	3) Look for the "chat" object
#	4) use "id" of the "chat" object to send your messages.
CHATID=12345678

# PATH = Path where the pics are saved
PATH="/home/joedoe/photos"

# CAM = Device of webcam
CAM="/dev/video0"

APIURL="https://api.telegram.org/bot"
FILE=$(/bin/date +\%Y\%m\%d\%H\%M)

FFMPEG="/usr/bin/ffmpeg"
CURL="/usr/bin/curl"


$FFMPEG -i $CAM -vframes 1 $PATH/$FILE.jpg
$CURL -K -s -X POST  $APIURL$TOKEN/sendPhoto -F chat_id="$CHATID" -F photo="@$PATH/$FILE.jpg"
echo ""
