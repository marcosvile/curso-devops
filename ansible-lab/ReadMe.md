# Documentação do laboratório Ansible

## Inicio

***
> A arquitetura do laboratório é dividido em 3 VMs, uma para o banco, aplicação e control-node.

> primeiro criamos um diretorio para cada VM (db01, app01, control-node) e crie o arquivo vagrant file para configurar e subir cada VM.

~~~ 
$ vagrant init (criando um arquivo para cada VM em seu respectivo diretório)
~~~
<br>

## Configurando o db01:
### Configuração dos parametros do VagrantFile da VM de banco de dados do laboratório:
<br>

> Configuração no nome (hostname) da vm do banco - db01

~~~
  config.vm.hostname = "db01"
~~~

> Configuração do SO/distro a ser utilizada
~~~
  config.vm.box = "centos/7"
~~~

> Configuração do ip local da vm
~~~
  config.vm.network "private_network", ip: "192.168.56.4"
~~~

> Mapeamento de portas do banco - portas padrão para o mysql

~~~  
config.vm.network "forwarded_port", guest: 3306, host: 3306
~~~

> Mapeamento dos comandos bash para instalação configuração de relacao de confiança entre a VM e o control-node utilizando o provision.sh

~~~
  config.vm.provision "shell", path: "provision.sh"

  # configuração para habilitação do plugin vbox para integrar com o vagrant
  config.vbguest.auto_update = false
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
end
~~~
<br>

## Configuração do provision.sh

> O provision.sh é o arquivo onde contém o script de comandos de configuração da sua vm, onde pode atualizar pacotes, instalar serviços e configurar parâmentros

~~~
#! /usr/bin/env bash
cat << EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeOhrktMMW8t9E7rqOMMwaYLYJ8wyP30bY0bYOK2yzZE+sdoMY4rcm+L3IYkIOCrT4rDpSRSU1T2FcgeZ9ZnYdhfudV47RwwmTMx/su3AhaxDueBLDQVM5IjzFz0VRM6U5P4fytxnACp8ZCngSSWgVMZAzRla49ns9Ryq8g1+Bol2QSwGSxE69G8sM3d0VndevWZGl9bewqmszS73hXSp+P7O4qlf20ZgMCl1COkWYbd0aTYd9GXPKemUMFG3CcTI86lLiqtHUnVzE7d6XLF129PQLs6xLmWuN78JR9wGnw3k60E/II46R9agZV/XR2ekxyJSNh1X5f0NbaYyO8G29 vagrant@control-node
EOT
~~~

> Nesta instrução, o script está dizendo que:
  * O interpretador shell padrão é o bash (da própria distribuição)
  * E prossegue com a inserção da chave ssh do control-node na vm para criar a relação de confiança entre as vms, possibilitando assim a mobilidade e comunicação entre as máquinas da infraestrutura.

<br>

## Configurando o APP01:
### Configuração dos parametros do VagrantFile da VM de aplicação do laboratório:
<br>

> Configuração no nome (hostname) da vm da aplicação - APP01

~~~
  config.vm.hostname = "app01"
~~~

> Configuração do SO/distro a ser utilizada
~~~
  config.vm.box = "centos/7"
~~~

> Mapeamento de portas da aplicação que ira rodar em http
~~~
  config.vm.network "forwarded_port", guest: 8080, host: 8080
~~~

> Configuração do ip local da vm
~~~
  config.vm.network "private_network", ip: "192.168.56.3"
~~~

> Mapeamento dos comandos bash para instalação configuração de relacao de confiança entre a VM e o control-node utilizando o provision.sh

~~~
  config.vm.provision "shell", path: "provision.sh"

  # configuração para habilitação do plugin vbox para integrar com o vagrant
  config.vbguest.auto_update = false
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
end
~~~

<br>

## Configuração do provision.sh

> O provision.sh é o arquivo onde contém o script de comandos de configuração da sua vm, onde pode atualizar pacotes, instalar serviços e configurar parâmentros

~~~
#! /usr/bin/env bash
cat << EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeOhrktMMW8t9E7rqOMMwaYLYJ8wyP30bY0bYOK2yzZE+sdoMY4rcm+L3IYkIOCrT4rDpSRSU1T2FcgeZ9ZnYdhfudV47RwwmTMx/su3AhaxDueBLDQVM5IjzFz0VRM6U5P4fytxnACp8ZCngSSWgVMZAzRla49ns9Ryq8g1+Bol2QSwGSxE69G8sM3d0VndevWZGl9bewqmszS73hXSp+P7O4qlf20ZgMCl1COkWYbd0aTYd9GXPKemUMFG3CcTI86lLiqtHUnVzE7d6XLF129PQLs6xLmWuN78JR9wGnw3k60E/II46R9agZV/XR2ekxyJSNh1X5f0NbaYyO8G29 vagrant@control-node
EOT
~~~

> Nesta instrução, o script está dizendo que:
  * O interpretador shell padrão é o bash (da própria distribuição)
  * E prossegue com a inserção da chave ssh do control-node na vm para criar a relação de confiança entre as vms, possibilitando assim a mobilidade e comunicação entre as máquinas da infraestrutura.

<br>

## Configurando o Control-Node
### O control-node, é o nó central onde controla os deploys e automações/script nas demais VMs da infraestrutura utilizando os playbooks:
<br>

### Configuração dos parametros do VagrantFile da VM de Control-Node do laboratório:
<br>

> Configuração do SO/distro a ser utilizada
~~~
  config.vm.box = "centos/7"
~~~

> Configuração no nome (hostname) da vm do 
ansible - controlnode
~~~
  config.vm.hostname = "control-node"
~~~

> Configuração do ip local da vm
~~~
  config.vm.network "private_network", ip: "192.168.56.2"
~~~


> Mapeamento de pasta que será compartilhada via nfs

~~~
  config.vm.synced_folder ".","/vagrant", type: "nfs" 
~~~

> Mapeamento dos comandos bash para instalação configuração de relacao de confiança entre a VM e o control-node utilizando o provision.sh

~~~
  config.vm.provision "shell", path: "provision.sh"

  # configuração para habilitação do plugin vbox para integrar com o vagrant
  config.vbguest.auto_update = false
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
end
~~~
<br>

## Configuração do provision.sh

> O provision.sh é o arquivo onde contém o script de comandos de configuração da sua vm, onde pode atualizar pacotes, instalar serviços e configurar parâmentros

~~~
#! /usr/bin/env bash
cat << EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeOhrktMMW8t9E7rqOMMwaYLYJ8wyP30bY0bYOK2yzZE+sdoMY4rcm+L3IYkIOCrT4rDpSRSU1T2FcgeZ9ZnYdhfudV47RwwmTMx/su3AhaxDueBLDQVM5IjzFz0VRM6U5P4fytxnACp8ZCngSSWgVMZAzRla49ns9Ryq8g1+Bol2QSwGSxE69G8sM3d0VndevWZGl9bewqmszS73hXSp+P7O4qlf20ZgMCl1COkWYbd0aTYd9GXPKemUMFG3CcTI86lLiqtHUnVzE7d6XLF129PQLs6xLmWuN78JR9wGnw3k60E/II46R9agZV/XR2ekxyJSNh1X5f0NbaYyO8G29 vagrant@control-node
EOT
~~~

> Nesta instrução, o script está dizendo que:
  * O interpretador shell padrão é o bash (da própria distribuição)
  * E prossegue com a inserção da chave ssh do control-node na vm para criar a relação de confiança entre as vms, possibilitando assim a mobilidade e comunicação entre as máquinas da infraestrutura.