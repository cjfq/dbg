#!/usr/bin/sh
 
# Run on VM to bootstrap Puppet Master server
 
if ps aux | grep "puppet master" | grep -v grep 2> /dev/null
then
    echo "Puppet Master is already installed. Exiting..."
else
    # Install Puppet Master
    #wget https://apt.puppetlabs.com/puppetlabs-release-el.deb && \
    #sudo dpkg -i puppetlabs-release-el.deb && \

    #bash /software/linux/puppet-enterprise-2016.1.1-el-7-x86_64/puppet-enterprise-installer -a /software/boot/master.answer

    su -c '/sbin/chkconfig --level 345 yum on; /sbin/service yum start'
    
    sudo yum update -yq
    sudo yum upgrade -yq
    yum update
    yum upgrade
    sudo yum install puppetmaster
 
    # Configure /etc/hosts file
    #echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
    #echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
    #echo "192.168.32.5    puppet.example.com  puppet" | sudo tee --append /etc/hosts 2> /dev/null && \
    #echo "192.168.32.10   node01.example.com  node01" | sudo tee --append /etc/hosts 2> /dev/null && \
    #echo "192.168.32.20   node02.example.com  node02" | sudo tee --append /etc/hosts 2> /dev/null
 
    # Add optional alternate DNS names to /etc/puppet/puppet.conf
    sed -i 's/.*\[main\].*/&\ndns_alt_names = master,master.domain.com/' /etc/puppet/puppet.conf
 
    # Install some initial puppet modules on Puppet Master server
    
    #cd /software/mod
    while read module; do
        puppet module install $module  --target-dir --modulepath=modules
    done < /software/linux/plugins/puppet
    
    puppet module install puppetlabs-git 
    puppet module install puppetlabs-inifile
    puppet module install puppetlabs-stdlib
    puppet module install puppetlabs-concat
    puppet module install puppetlabs-ntp
    puppet module install puppetlabs-powershell
    puppet module install puppetlabs-registry

    #sudo puppet module install garethr-docker
    #sudo puppet module install puppetlabs-vcsrepo
    #sudo puppet module install garystafford-fig
    #sudo puppet module install liamjbennett/puppet-win_facts
    #sudo puppet module install example42/puppi
    #sudo puppet module install example42/timezone
    #sudo puppet module install razorsedge/puppet-network
    #sudo puppet module install saz/puppet-rsyslog
    #sudo puppet module install ptierno/windowspagefile
    #sudo puppet module install rismoney/puppet-windowsnetwork
    #sudo puppet module install voxpupuli/puppet-windows_firewall
    #bash Puppetfile
    # symlink manifest from Vagrant synced folder location
    #ln -s /vagrant/site.pp /etc/puppet/manifests/site.pp

fi
