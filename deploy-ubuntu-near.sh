#!/bin/bash
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart
runsvdir -P /etc/service &
nodepid=0
t=1
sleep 5

apt update && apt upgrade -y

sleep 20

done
