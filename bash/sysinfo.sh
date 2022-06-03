#!/bin/bash
# My fourth script - sysinfo.sh
# This script displays different strings

echo 'Host Name:'
hostname
echo 'Domain Name: ubuntu'
echo 'Operating System name and version: ' 
echo "LAN IP ADDRESS:"
ip a s enp0s3 | awk '/inet /{print$2}'
echo "Root File Status:"
df -h
