# Documentação do laboratório Docker

## Inicio

* Docker é um processo executado no sistema operacional, porém isolado de todos os
outros processos (cpu, memória, rede, disco, etc).<p>
* Este isolamento permite também a separação das dependências da aplicação
(versão do Java, libs de S.O, etc)<p>
* Images: Pacote com um sistema de arquivos com todas as suas dependências (libs de S.O, processos
que serão executados, kernel, etc)<p>
* Container: é um processo que executa uma imagem. A imagem é imutável mesmo após um container
ser iniciado.<p>
* Registry: Repositório de imagens

* Dockerfile: Arquivo texto simples com formato de script<p>
utilizado para criar uma imagem docker.
* docker build: Comando executado para criar uma imagem de<p>
container. Necessário criar um DockerFile.
docker build -t getting-started .
* docker run: Comando executado para iniciar um container.<p>
docker run -dp 3000:3000 getting-started
* docker pull: download da imagem docker do registry.<p>
docker pull debian


## Laboratório - How To

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
