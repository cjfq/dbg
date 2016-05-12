#!/usr/bin/sh
 
# Run on VM to bootstrap Puppet Agent nodes
# http://blog.kloudless.com/2013/07/01/automating-development-environments-with-vagrant-and-puppet/
 
if ps aux | grep "puppet agent" | grep -v grep 2> /dev/null
then
    echo "Puppet Agent is already installed. Moving on..."
else
    sudo yum install puppet
    sudo yum update
    sudo yum upgrade
    #bash /software/linux/puppet-enterprise-2016.1.1-el-7-x86_64/puppet-enterprise-installer -a /software/boot/agent.answer
fi
 
if cat /etc/crontab | grep puppet 2> /dev/null
then
    echo "Puppet Agent is already configured. Exiting..."
else
    
    sudo puppet resource cron puppet-agent ensure=present user=root minute=30 \
        command='/usr/bin/puppet agent --onetime --no-daemonize --splay'
 
    sudo puppet resource service puppet ensure=running enable=true
 
    # Configure /etc/hosts file
    #echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
    #echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
    #echo "192.168.32.5    puppet.example.com  puppet" | sudo tee --append /etc/hosts 2> /dev/null && \
    #echo "192.168.32.10   node01.example.com  node01" | sudo tee --append /etc/hosts 2> /dev/null && \
    #echo "192.168.32.20   node02.example.com  node02" | sudo tee --append /etc/hosts 2> /dev/null
    hostname=`hostname`
    # Add agent section to /etc/puppet/puppet.conf
    echo "" && echo "[agent]\nserver=${hostname}" | sudo tee --append /etc/puppet/puppet.conf 2> /dev/null
 
    sudo puppet agent --enable
fi

