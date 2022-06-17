#!/bin/bash
#In the following script we are going to make Virtual Webserver

#If we don't have lxd in Ubuntu, we have to install
#we will use snap command to install lxd
$(sudo snap install lxd)

#Try to find lxdbr0
ip addr

#If lxdbr0 is not exists, try the following command
lxd init --auto

#First we will check os system by following command
lsb_release -a

#We can also check how many container we have
lxc list

#Now we will launch a container COMP2101-S22 running Ubuntu server
lxc launch ubuntu:20.04 COMP2101-S22

#In next step we will find Ip address of COMP2101
lxc list
lxc list | awk '/COMP2101-S22/ {print $6}'

#Now we will install apache2 in container
lxc restart COMP2101-S22
lxc exec COMP2101-S22 -- apt install apache2

#we are in container's shell
#sudo apt install apache2

#We will curl command to retrive the default web page from the web service  and we also notify the user that process is successed or not
curl http://10.19.15.139 && echo "Success! we are getting responce from the webserver" || echo "Oops! Something Wrong"

