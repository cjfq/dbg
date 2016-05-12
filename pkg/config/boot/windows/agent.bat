@echo off

msiexec /qn /norestart /i puppet.msi PUPPET_MASTER_SERVER=master.domain.com
