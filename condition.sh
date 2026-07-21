#!/bin/bash

USERID=$(id -u)
R="\e[31m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(basename "$0" .sh)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
# SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
# LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo -e "${Y} script executed time $(date) ${N}" &>>$LOG_FILE

if [ $USERID -ne 0 ]; then
 echo -e " ${R} Print you are not root user ${N}" &>>$LOG_FILE
 exit 12
else 
 echo -e "${Y} You are running as root user ${N}" &>>$LOG_FILE
fi

VALIDATE() {
     if [ $1 -eq 0 ] ; then
       echo -e " ${Y} $2 iinstalled successfully....${N}" &>>$LOG_FILE
     else 
       echo -e " ${Y} $2 installation failed..${N}" &>>$LOG_FILE
     exit 13
    fi

}

dnf list  installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]; then
 echo -e " ${Y} Installing Python ${N} " &>>$LOG_FILE
 dnf  install  python3 &>>$LOG_FILE
 VALIDATE $? "python3"
else
 echo -e "${R} already installed  ${N} " &>>$LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then 
 echo -e "${Y} nginx going to install  tooo.${N}" &>>$LOG_FILE
 dnf install nginx &>>$LOG_FILE
 VALIDATE $? "nginx"
else
  echo -e "${R} already installed ${N} ." &>>$LOG_FILE
  exit 12
fi




   