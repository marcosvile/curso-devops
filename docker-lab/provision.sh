#!/bin/bash
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
cat <<EOT >> /etc/hosts
192.168.56.2 control-node
192.168.56.3 app01
192.168.56.4 db01
192.168.56.5 docker01
EOT
cat <<EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmaqSMEkXlqcGw55caPYyHHzsk1OWyH9xjwH74TLDaKiCqOJ8lpJu3a7t6Q8Vb/6BapusCU7yZJNhu4LVKszy8SozbImCsCjs747UHfDO/GLNz/pdgDAVVejXOXOg/lxD549geOVgI5w/GMF525/xIJqumznQNkXDP7+cIROA4OXavodKCK06ctTEPAXyLDB9FLtB8pp4y57EF8EskLWAtDAYr62owgeFne54lCMkBBH7e9m6O7fDXeL+f5E22oltFAHRLqu8qBZ0oyxdjeg/v9uZft5WxpDE+AcwaTXI1bcnBzQU9WqpfRnZ5GLfBa1H09im2hHYuRaiNBct6KW7V vagrant@control-node
EOT
