#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] then
 echo " you are running with root access "
fi

dnf install mysql

if [ $? -eq 0 ] then
 echo "Myqsl is getting installed"

fi


   