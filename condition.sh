#!/bin/bash

USERID=$(id -u)
R="\e[31m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ] ; then
 echo -e " ${R} Print you are not root user ${N}"
 exit 12
else 
 echo "${Y} You are running as root user ${N}"
fi

VALIDATE() {
     if [ $1 -eq 0 ] ; then
       echo " installing python3...."
     else 
       echo " python3 is not installled.."
     exit 13
fi

}

dnf list  installed python3X

if [ $? -eq 0 ] ; then
 echo " Installing Python 3"
 dnf  install  python3 
 VALIDATE $? $1
else
 echo " Not installed Python 3"
 exit 12
fi

# dnf list installed python3 
#  if [ $? -eq 0 ] ; then
#   echo " installing python3...."
#  else 
#  echo " python3 is not installled.."
#  exit 13
# fi

dnf list installed nginx
 if [ $? -eq 0 ] ; then 
 echo " nginx going to install  tooo."
dnf install nginx
VALIDATE $? $2

 else
  echo " not installed ."
  exit 12
fi




   