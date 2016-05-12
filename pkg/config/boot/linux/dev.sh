#!/bin/bash

#sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
#sudo mount -t vboxsf vagrant /vagrant

wget -O /etc/yum.repos.d/public-yum-ol7.repo http://public-yum.oracle.com/public-yum-ol7.repo

sudo yum -y update
#sudo yum upgrade
yum install ibutils 

#yum groupinstall 'X Window System' 'KDE' --skip-broken
#yum groupinstall 'X Window System' 'xterm' 'vim' 'vim-puppet'

cd /home/vagrant/

#   INSTALL X
#sudo yum install -y kernel-devel.x86_64
sudo yum -y install xorg-x11-server-Xorg xorg-x11-drivers.x86_64 xorg-x11-xauth.x86_64
sudo yum -y install xorg-x11-xinit vim-X11.x86_64 xterm xclock unzip git gnome-session.x86_64
#   dev enviornment to build vscode
#sudo yum -y install libX11-devel.x86_64 npm  pgadmin3.x86_64

#sudo yum groups install "Server with GUI"
#sudo yum -y install yum openbox-kde
#sudo yum -y install openbox
gnome-terminal.x86_64
gconf-editor
ksh

# Generate a new .Xauthority file by running the following command: 
xauth generate :0 . trusted 
# At the command line, create a new magic-cookie key by entering the following: 
randomkey=`/usr/bin/ksh -c 'echo $(( $RANDOM * $RANDOM * 2 ))'` 
# Add a new entry for another server by running the following command: 
xauth add ${HOST}:0 . $randomkey 
# To view a listing of the .Xauthority file, enter the following 
xauth list 


#   SETUP X
sudo Xorg :0 -configure
sudo cp /root/xorg.conf.new /etc/X11/xorg.conf
sudo Xorg -config /etc/X11/xorg.conf & sudo pkill X
sudo rm /etc/X11/xorg.conf

HOST=`dev`
key=`perl -e 'srand; printf int(rand(100000000000000000))'`
key=$key$key
xauth add ${HOST}/unix:0 . $key

#sudo echo "export DISPLAY=:0.0" >> /home/vagrant/.bash_profile
#sudo echo "export DISPLAY=:0.0" >> /root/.bash_profile
#sudo X -query localhost :1
#sudo echo "id:5:initdefault:" >> /etc/inittab
#sudo echo "DESKTOP=\"GNOME\"
#DISPLAYMANAGER=\"GNOME\"" >> /etc/sysconfig/desktop

sudo systemctl set-default graphical.target
sudo systemctl start graphical.target

#sudo yum install ruby emacs make plint cabal-install gcc gcc-c++ libxml2-devel libxslt-devel ruby-devel ruby-libs.x86_64 ruby-irb.noarch ruby-augeas.x86_64

#sudo cabal update 
#sudo pip install pylint
#sudo npm install eslint

#git clone https://github.com/microsoft/vscode
#cd vscode
#./scripts/npm.sh install --arch=x64

#   INSTALL VSCODE
#sudo wget 'https://az764295.vo.msecnd.net/public/0.10.1-release/VSCode-linux64.zip'
sudo unzip /home/vagrant/repo/pkg/os/linux/VSCode-linux-x64-stable.zip -d /usr/local/
sudo mkdir -p /home/vagrant/.vscode
sudo mkdir -p /home/vagrant/.config/Code/User/
sudo chown -R vagrant:vagrant /home/vagrant/.vscode/
sudo chown -R vagrant:vagrant /home/vagrant/.config/
sudo cp /home/vagrant/repo/pkg/os/launch.json /home/vagrant/.vscode/
chmod +x /home/vagrant/.vscode/launch.json
chmod +x  /usr/local/VSCode-linux-x64/code
ln -s /usr/local/VSCode-linux-x64/code /usr/local/bin/vs
ln -s /usr/local/VSCode-linux-x64/code /usr/bin/vs

echo "// Place your settings in this file to overwrite the default settings
{	// Controls the font family.
	\"editor.fontFamily\": \"Monaco\",
	// Controls the font size.
	\"editor.fontSize\": 10,
	// Controls the line height.
	\"editor.lineHeight\": 0,
}" > /home/vagrant/.config/Code/User/settings.json

echo "// Place your settings in this file to overwrite the default settings
{	// Controls the font family.
	\"editor.fontFamily\": \"Monaco\",
	// Controls the font size.
	\"editor.fontSize\": 10,
	// Controls the line height.
	\"editor.lineHeight\": 0,
}" > /root/.config/Code/User/settings.json

mkdir -p /usr/share/fonts/truetype/ttf-monaco
sudo mkdir 
cd ttf-monaco/
sudo wget http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf
sudo mkfontdir
#go to parent folder /usr/share/fonts/truetype
cd ..
fc-cache

chown -R vagrant:vagrant /home/vagrant/repo

#chmod +x  /usr/local/bin/vs
#chmod +x  /usr/bin/vs

#git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

#echo "X11Forwarding yes" >> /etc/ssh/ssh_config
#echo "X11UseForwarding yes" >> /etc/ssh/ssh_config
#service sshd restart          
            
#'tint2' 'synapse' 'gmrun' \
#  'thunar' 'thunar-thumbnailers' 'thunar-archive-plugin' 'thunar-media-tags-plugin' \
#   'openbox-kde'
#systemctl enable graphical.target --force
#yum groupinstall 'KDE' --skip-broken
#rpm -ivh /software/os/linux/vscode-x86_64.rpm

#mkdir -p ~/.config/openbox/
#cp /etc/xdg/openbox/rc.xml ~/.config/openbox/rc.xml
#cp /etc/xdg/openbox/menu.xml ~/.config/openbox/menu.xml
#cp /etc/xdg/openbox/autostart.sh ~/.config/openbox/autostart.sh
