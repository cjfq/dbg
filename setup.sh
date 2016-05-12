#!/bin/bash

#http://lzone.de/cheat-sheet/Puppet
#http://www.craigdunn.org/2012/05/239/
#http://www.slideshare.net/PuppetLabs/roles-talk
#https://docs.puppet.com/guides/augeas.html

#vagrant up --provider virtualbox --provision --debug

#$ cd path/to/your/module
#$ rspec-puppet-init
#https://github.com/bbatsov/rubocop
#https://github.com/cucumber/cucumber-ruby

#https://github.com/readevalprintlove/ulithp
#http://pt.slideshare.net/antoniogarrote/lisp-vs-ruby-metaprogramming-3222908
#http://blog.jacius.info/2012/04/04/a-rubyists-impressions-of-common-lisp/

#~/.emacs.d
sudo rm -rf .vagrant/
sudo rm -rf .pe_build/
sudo rm -rf ~/.vagrant/
sudo rm -rf ~/.vagrant.d/
sudo rm -rf ~/.bundle
sudo rm -rf ~/.benv
sudo rm -rf ~/.gem

chmod 777 tmp
chmod 777 pkg

cp pkg/config/Vagranfile ~/.vagrant.d/Vagrantfile
cp pkg/config/launch.json ~/vscode

#git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

#export http_proxy=http://localhost:3128

#sudo su
#gem install bundler
#npm install --no-bin-links
#exit
#cat ../tmp/Puppetfile | grep URL | awk -F "/" '{ print $4"/"$5}' > config/plugins/modules

dir=pkg/config/plugins

while read gem; do    
    gem install $gem
done < $dir/gem

while read plugin; do
        vagrant plugin install $plugin
done < $dir/vagrant

#vagrant box add \
#    --name linux \
#    packer_virtualbox-iso_virtualbox.box
    
#git config --global color.ui true
#git config --global user.name ""
#git config --global user.email ""
#ssh-keygen -t rsa -C ""
#cat ~/.ssh/id_rsa.pub
#ssh -T git@github.com

#cd -

#DIRECTORY=/software/modules/vagrant-puppet-install
#cd /Users/cassio/\@GIT/ppt/repo/config/plugins/
vagrant pe-build copy pkg/os/linux/puppet-enterprise-2016.1.2-el-7-x86_64.tar.gz
#git clone https://github.com/Sharpie/puppet-debugging-kit.git
#puppet module install puppetlabs/xyconf
#puppet resource package xyconf provider=gem
#bundle install --path .bundle/gems
#bundle exec rake spec
#bundle update
#cd modules/puppet-debugging-kit
#rake setup:global
#rake setup:sandboxed
#rake setup:poss
#poss-apt-repos
#poss-yum-repos
#gem install bundler
# run these commands, and then get hacking!
# this requires the rhel-7-server-optional-rpms repo enabled
#sudo subscription-manager repos --enable rhel-7-server-optional-rpms
#sudo yum install -y gcc ruby-devel libvirt-devel libvirt qemu-kvm
#sudo systemctl start libvirtd.service
#wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.rpm
#sudo yum install -y vagrant_1.7.4_x86_64.rpm
#vagrant plugin install vagrant-libvirt
#wget https://copr.fedoraproject.org/coprs/purpleidea/vagrant-libvirt/repo/epel-7/purpleidea-vagrant-libvirt-epel-7.repo
#sudo cp -a purpleidea-vagrant-libvirt-epel-7.repo /etc/yum.repos.d/
#sudo yum install -y vagrant-libvirt    # noop plugin for oh-my-vagrant dependency
#wget https://copr.fedoraproject.org/coprs/purpleidea/oh-my-vagrant/repo/epel-7/purpleidea-oh-my-vagrant-epel-7.repo
#sudo cp -a purpleidea-oh-my-vagrant-epel-7.repo /etc/yum.repos.d/
#sudo yum install -y oh-my-vagrant
#. /etc/profile.d/oh-my-vagrant.sh # logout/login or source

#if [ ! -d "$DIRECTORY" ]; then
#  cd /software/modules/
#  git clone https://github.com/petems/vagrant-puppet-install.git
#fi

#vagrant oscar init-vms \
#  --master master=puppetlabs/centos-7.2-64-nocm \
#  --agent first=puppetlabs/centos-6.6-64-nocm  \
#  --agent second=puppetlabs/ubuntu-14.04-64-nocm

#gem install vagrant-screenshot
#vagrant gem install vagrant-hostmaster
#https://github.com/catedrasaes-umu/vagrantweb
#https://github.com/muteldar/vagrant-status
#https://github.com/mat128/vagrant-openstack


#git clone https://github.com/oscar-stack/oscar
# oscar

#git clone https://github.com/oscar-stack/vagrant-auto_network
#vagrant plugin install vagrant-auto_network

#git clone https://github.com/oscar-stack/vagrant-config_builder
#vagrant plugin install vagrant-config_builder

#git clone https://github.com/oscar-stack/vagrant-hosts
#vagrant plugin install vagrant-hosts

#git clone https://github.com/oscar-stack/vagrant-norequiretty
#vagrant plugin install vagrant-norequiretty

#git clone https://github.com/oscar-stack/vagrant-pe_build
#vagrant plugin install vagrant-pe_build

#puppet module puppetlabs-apache --modulepath .

#https://opsmatic.com/app/docs/getting-started

#https://github.com/mhahn/vagrant-librarian-puppet.git
#vagrant plugin install vagrant-librarian-puppet

#https://github.com/petems/vagrant-puppet-install.git
#vagrant plugin install vagrant-puppet-install

#https://github.com/jantman/vagrant-r10k.git
#vagrant plugin install vagrant-r10k

#https://github.com/BerlinVagrant/vagrant-dns.git
#vagrant plugin install vagrant-dns

#https://github.com/acostamosaicgroup/vagrant-hostmaster.git
#vagrant gem install vagrant-hostmaster

#https://github.com/devopsgroup-io/vagrant-hostmanager.git
#vagrant plugin install vagrant-hostmanager

#https://github.com/mdkholy/vagrant-hosts-provisioner.git
#vagrant plugin install vagrant-hosts-provisioner

#https://github.com/oscar-stack/vagrant-hosts.git
#vagrant plugin install vagrant-hosts

#https://github.com/DemandCube/vagrant-flow

#vagrant plugin install vagrant-config_builder
#https://github.com/bltavares/vagrant-baseline.git

#vagrant plugin install rubber

#https://github.com/jaugustin/vagrant-ansible-local.git
#vagrant plugin install vagrant-ansible-local

#https://github.com/aidanns/vagrant-reload
#vagrant plugin install vagrant-reload

#https://github.com/leighmcculloch/vagrant-docker-compose.git
#vagrant plugin install vagrant-docker-compose

#https://github.com/smerrill/vagrant-gatling-rsync.git
#vagrant plugin install vagrant-gatling-rsync

#vagrant plugin install vagrant-vbguest
#vagrant plugin install vagrant-timezone
#vagrant plugin install vagrant-rekey-ssh
#vagrant plugin install vagrant-rdp
#vagrant plugin install vagrant-vmware-dhcp
#vagrant plugin install sahara
#vagrant plugin install vagrant-serverspec
#vagrant plugin install vagrant-sparseimage.gem
#vagrant plugin install vagrant-nfs_guest
#vagrant plugin install vagrant-winnfsd
#vagrant plugin install vagrant-faster
#vagrant plugin install vagrant-persistent-storage
#plugin install vagrant-proxyconf
#vagrant plugin install vagrant-cachier


