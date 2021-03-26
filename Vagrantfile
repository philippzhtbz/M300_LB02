# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # Box Settings
  config.vm.box = "generic/ubuntu2004"
  
  
  # Provider Settings
   config.vm.provider "virtualbox" do |vb|
     vb.name = "Plex-VM-M300-LB02"
     vb.gui = true
     vb.memory = "4096"
     
     
  end
  #Port Settings
  config.vm.network "forwarded_port", guest: 32400, host: 32400
  config.vm.network "forwarded_port", guest: 80, host: 8080


  
  # Folder Settings
  # config.vm.synced_folder "../data", "/vagrant_data"


   #Provision Settings
    config.vm.provision :shell, path: "Setupplex.sh"
   

     
     
     
     
    
  end