#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "User is running with root access"
else
 echo "User is not running with root access"
 exit 12
fi

dnf  install mysql 

if [ $? -ne 0 ]
then
 echo "if mysql is not installed install"

else
echo "show as mysql is not present"
 exit 12
 fi



   