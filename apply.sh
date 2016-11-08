#!/bin/bash
# Copyright (c) 2016 Malicious Genius
#

if [ ! -f /etc/mothership ]; then
    useradd -m -d /home/system -g sys -G wheel -s /bin/bash system
    echo 'Enter "system" user password'
    passwd system
    cd /opt/microarch-custom & git pull
    echo 'mothership ansible_connection=local' > /etc/ansible/hosts
    ansible-playbook ./germination.yml
    ln -s '/opt/microarch-custom/mothership-startup.service' '/etc/systemd/system/mothership-startup.service'
    systemctl daemon-reload
    systemctl enable mothership-startup.service
    touch /etc/mothership
    sleep 3m
    systemctl reboot
fi

cd /opt/microarch-custom
ansible-playbook ./mothership.yml

