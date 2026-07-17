#!/bin/bash

USERID= $(id -u)

if [ $USERID -eq 0 ]
then
 echo "User is running with root access"
else
 echo "User is not running with root access"
fi

   