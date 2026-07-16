#!/bin/bash

TIMESTAMP=$(date)
echo "Today is : $TIMESTAMP"

NUMBER1=100
NUMBER2=200

SUM=$(($NUMBER1+$NUMBER2))
echo of the numbers is :$SUM

read -s PIN

echo "your pin is $PIN"