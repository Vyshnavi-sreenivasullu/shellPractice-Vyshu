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
       echo -e " ${Y} $2 iinstalled successfully....${N}"
     else 
       echo -e " ${Y} $2 installation failed..${N}"
     exit 13
    fi

}

dnf list  installed python3

if [ $? -ne 0 ]; then
 echo -e " ${Y} Installing Python ${N} "
 dnf  install  python3
 VALIDATE $? "python3"
else
 echo -e "${R} already installed  ${N} "
 exit 12
fi

dnf list installed nginx
if [ $? -ne 0 ]; then 
 echo -e "${Y} nginx going to install  tooo.${N}"
 dnf install nginx
 VALIDATE $? "nginx"
else
  echo -e "${R} already installed ${N} ."
  exit 12
fi




   