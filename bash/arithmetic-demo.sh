#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

echo 'Hi, Please choose first number: '
read fn
echo 'Choose second number: '
read sn
echo 'Choose third number: '
read tn

sum=$((fn + sn + tn))
product=$(($sum/3))
cat <<EOF
$fn plus $sn is $sum
The product of three number is $product
EOF
