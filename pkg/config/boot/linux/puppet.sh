#!/usr/bin/sh

    puppet module install puppetlabs-stdlib --modulepath=modules
    puppet module install puppetlabs/concat --modulepath=modules
    puppet module install puppetlabs/firewall --modulepath=modules
    puppet module install puppetlabs/gcc --modulepath=modules
    puppet module install puppetlabs/vcsrepo --modulepath=modules
    puppet module install puppetlabs/mongodb --modulepath=modules
    puppet module install puppetlabs/postgresql --modulepath=modules
    puppet module install puppetlabs/rabbitmq --modulepath=modules
    puppet module install puppetlabs/git --modulepath=modules

    puppet module install stahnma/epel --modulepath=modules
    puppet module install garethr/erlang --modulepath=modules
    
    puppet module install jordan/spec --modulepath=modules
    puppet module install maestrodev/avahi --modulepath=modules 
    puppet module install spantree/java7 --modulepath=modules
    puppet module install jdowning/rbenv --modulepath=modules
    puppet module install maestrodev/wget--modulepath=modules
    
