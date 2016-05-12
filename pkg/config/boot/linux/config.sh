#!/usr/bin/sh

chmod +x /home/vagrant/repo/linux/boot/config.sh
chmod +x /home/vagrant/repo/linux/boot/master.sh
chmod +x /home/vagrant/repo/linux/boot/agent.sh

yum update 
yum upgrade

#rpm -ivh /software/linux/vagrant_1.8.1_x86_64.rpm
#yum -y localinstall /software/linux/VirtualBox-5.0-5.0.16_105871_el7-1.x86_64.rpm

#yum groupinstall kde-desktop

#vagrant plugin install oscar
#vagrant plugin install vagrant-auto_network
#vagrant plugin install vagrant-config_builder
#vagrant plugin install vagrant-hosts
#vagrant plugin install vagrant-norequiretty
#vagrant plugin install vagrant-pe_build

