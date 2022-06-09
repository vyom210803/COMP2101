#!/bin/bash
# My fourth script - sysinfo.sh
# This script displays different strings

#############
##Variable###
#############

hn=$(hostname --fqdn)
sv=$(uname -a)
ia=$(ip a s enp0s3 | awk '/inet /{print$2}')
fs=$(df -h | awk '/1.5M /{print $4}')

#############
##Main Body##
#############
echo '                                   '
echo 'Report for Virtual Machine'
#In next steps we will consider some basic variables

echo '=========================='
echo "FQDN: $hn"
echo "Full details of Operating System: $sv" 
echo "LAN IP ADDRESS: $ia"
echo "Root File Status: $fs"
echo '=========================='
