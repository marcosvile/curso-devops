# Documentação do laboratório Docker

## Inicio

***

> Criar o arquivo vagrant file para configurar e subir a VM.

~~~ 
$ vagrant init
~~~

> Configurando o host

> parâmetro para informar a distribuição/versão da VM:

~~~
config.vm.box = "centos/7"
~~~

> parâmetro para indicar onde buscar o script de ações internas para a VM:

~~~
config.vm.provision "shell", path: "provision.sh"
~~~

> parâmetro para conexão do plugin VMBox:

~~~
config.vbguest.auto_update = false
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
~~~


## Configuração do provision.sh

> O provision.sh é o arquivo onde contém o script de comandos de configuração da sua vm, onde pode atualizar pacotes, instalar serviços e configurar parâmentros

~~~
#!/bin/bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable docker 
~~~

> Nesta instrução, o script está dizendo que:
  * O interpretador shell padrão é o bash (da própria distribuição)
  * E prossegue com instalações de pacotes e dependências necessárias como:
    - o yum-utils 
    - configuração do repositorio docker
    - instalação 