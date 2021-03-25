# Dokuementation M300 LB02 Plex Meda Server 
## M300 TBZ LB 02

## Inhaltsverzeichnis:
____
### 1.1 Einführung
### 2.1 Vagrant FIle
### 3.1 Code Dokumentation
### 4.1 Installation von Plex Server
### 5.1 Installation und Konfiguration von der Firewall
### 6.1 Testing
### 7.1 Quellenverzeichnis
___ 

<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 

## 1.1 Einführung:
> Das Ziel dieses Projektes ist es, dass man mit einem Vagrantfile einen Plex Media Server vollautomatisch aufsetzten kann. Zusätzlich wird mit einer Firewall dafür gesorgt, dass nur gewisse Ports nach aussen geöffnet sind, damit man auf das Webinterface von
> Plex zugreifen kann.
> Plex ist ein Media Server über welchen man Filme, Serien, Musik und auch andere Inhalte streamen kann. Man muss die Filme usw. zuerst herunterladen, bevor man diese dann streamen kann.

<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 

## 2.1 Vagrant File:
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


___
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br>

## 3.1 Code Dokumentation:

> <span style="color:blue">config.vm.box = "generic/ubuntu2004"</span>
>> Hier wird definiert, welches Image für die VM verwendet werden soll.
>
> <span style="color:blue">config.vm.provider "virtualbox" do |vb|</span>
>> Es wird definiert, welcher Provider verwendet wird.In diesem Fall wird Virtualbox definiert
>
> <span style="color:blue">vb.name = "Plex-VM-M300-LB02"</span>
>> Der Name der VM wird hier definiert
>> * <span style="color:red">Es sollte darauf geachtet werden, dass es nicht schon eine VM mit diesem Namen gibt</span>
>
> <span style="color:blue">vb.gui = true"</span>
>> Hier kann man definieren, ob die VM ein GUI haben soll. Wenn man kein GUI möchte sollte man es auf "false" setzen
>
> <span style="color:blue">vb.memory = "4096"</span>
>> Hier wird definiert, wie viel Arbeitsspeicher die VM haben soll
>> * <span style="color:red">Man kann auch noch zusätzliche Dinge definieren, wie z.B. die Anzahl an Prozessorkernen</span>
>
> <span style="color:blue">config.vm.network "forwarded_port", guest: 32400, host: 32400</span>
>> Der Port 32400 wird verwendet, um auf das Webinterface zuzugreifen
>
> <span style="color:blue">config.vm.network "forwarded_port", guest: 80, host: 8080</span>
>>Damit man später auf die VM zugreifen kann, muss man Ports definieren, welche offen sind. Da man auf den Plex Server über 32400 zugreifft, muss man diesen öffnen
>
> <span style="color:blue">config.vm.provision :shell, path: "Setupplex.sh"</span>
>>Nach der Installation soll ein Script ausgeführt werden. Dieses wird weiter unten noch beschrieben.
>> * <span style="color:red">Mann kann die Befehle auch direkt in ein Script schreiben, welches dann nach dem Starten ausgeführt wird</span>
___
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 

## 4.1 Installation vom Plex-Media Server:
            apt-get update
            apt-get upgrade -y
     
            wget https://downloads.plex.tv/plex-media-server-new/1.22.0.4163-d8c4875dd/debian/plexmediaserver_1.22.0.4163-d8c4875dd_amd64.deb
     
            sudo dpkg -i plexmediaserver_1.22.0.4163-d8c4875dd_amd64.deb
     
            sudo systemctl enable plexmediaserver.service
            sudo systemctl start plexmediaserver.service
            sudo systemctl status plexmediaserver.service
>
>Als erstes werden Updates gemacht, damit die VM aktuell ist
>
>Anschliessend wird das .deb File welches für die Installation benötig wird heruntergeladen und anschliessend installiert
>
>Anschliessend wird der Service "Plexmediaserver" aktiviert und gestartet
>
>Mit dem Befehl "Status plexmediaserver.service" wird dann noch getestet, ob der Service am laufen ist.
___
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br>
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 

## 5.1 Installation und Konfiguration der Firewall:
            sudo apt install ufw
            sudo ufw default deny incoming
            sudo ufw default allow outgoing
            sudo ufw allow ssh
            sudo ufw allow 32400
            sudo ufw allow 80
            sudo ufw allow 8080
            sudo ufw --force enable
            sudo ufw --force status verbose

>Als erstes wird die Firewall UFW installiert.
>
>Anschliessend wird definiert, dass alle eingehenden Verbindungen blockiert werden und alle ausgehenden durchgehen sollen
>
>Anschliessend wird definiert, dass der Dienst SSH durchgehen darf
>
>Anschliessend werden die Ports derfiniert welche benötigt werden um auf den Dienst zuzugreifen.
>
>Am Ende wird die Firewall noch aktiviert und es wird getestet, wie der Status ist.

<br> </br> 
<br> </br> 
<br> </br> 
<br> </br>
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 


## 6.1 Testing:
>Nachdem der Befehl "Vagrant up" durchgeführt wurde, wird nun automatisch der Plex Media Server aufgesetzt.
>Man kann auf diesen mit der folgenen URL zugreifen:
>>http://127.0.0.1:32400/web
Danach sollte folgendes Bild erscheinen:
 ![Plex Media]("E:\Schule\M300\M300-Philipp\LB2\M300_LB02\Plex_Image.png")

<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br>
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br>
<br> </br> 
<br> </br> 
<br> </br> 
<br> </br> 

## 7.1 Quellenverzeichnis:
> Plex installation:
>> https://linuxhint.com/install_plex_ubuntu-2/S
>
> Firewall Konfiguration & Installation:
>> https://wiki.ubuntuusers.de/ufw/