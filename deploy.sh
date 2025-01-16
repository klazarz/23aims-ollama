#!/bin/bash

#Let's flush iptables 
sudo iptables -F

#add folder for datbase files
mkdir oradata

#Chmodding
chmod 777 oradata
chmod 777 ords_secrets
chmod 777 ords_config


#Docker Compose (-d to start in background)
sudo docker compose up