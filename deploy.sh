#!/bin/bash

#add folder for datbase files
mkdir oradata
mkdir ords_secrets

cp conn_string.txt ords_secrets/

#Chmodding
sudo chmod 777 oradata
sudo chmod -R 777 ords_secrets
sudo chmod 777 ords_config


#Docker Compose (-d to start in background)
sudo docker compose up