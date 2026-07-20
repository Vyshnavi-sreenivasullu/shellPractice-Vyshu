#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] ; then
 echo "Print you are not root user"
 exit 12
else 
 echo "You are running as root user"
fi

dnf install python3

if [ $? -eq 0 ] ; then
 echo " Installing Python 3"
else
 echo " Not installed Python 3"
 exit 12
fi

dnf list installed python3 nginx 
 if [ $? -eq 0 ] ; then
  echo " installing python3...."
 else 
 echo " python3 is not installled.."
 exit 13
fi





   