#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
     
wget https://downloads.plex.tv/plex-media-server-new/1.22.0.4163-d8c4875dd/debian/plexmediaserver_1.22.0.4163-d8c4875dd_amd64.deb
     
sudo dpkg -i plexmediaserver_1.22.0.4163-d8c4875dd_amd64.deb
     
sudo systemctl enable plexmediaserver.service
sudo systemctl start plexmediaserver.service
sudo systemctl status plexmediaserver.service

#Firewall rules
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 32400
sudo ufw allow 80
sudo ufw allow 8080
sudo ufw --force enable


#Port Scanner

sudo apt-get install nmap -y

#Status Abfragen:
sudo systemctl status plexmediaserver.service
sudo ufw --force status verbose
sudo nmap 127.0.0.1
sudo nmap -sU 127.0.0.1
