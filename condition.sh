#!/bin/bash

USERID=$(id -u)
R="\e[31m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
 echo -e " ${R} Print you are not root user ${N}"
 exit 12
else 
 echo -e "${Y} You are running as root user ${N}"
fi

VALIDATE() {
     if [ $1 -eq 0 ] ; then
       echo " installing $2...."
     else 
       echo " $2 is not installled.."
     exit 13
    fi

}

dnf list  installed python3

if [ $? -eq 0 ]; then
 echo " Installing Python "
 dnf  install  python3
 VALIDATE $? "python3"
else
 echo " Not installed Python3 "
 exit 12
fi

dnf list installed nginx
if [ $? -eq 0 ]; then 
 echo " nginx going to install  tooo."
 dnf install nginx
 VALIDATE $? "nginx"
else
  echo " not installed ."
  exit 12
fi




   