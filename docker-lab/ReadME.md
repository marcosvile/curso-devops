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


> parâmetro para buscar o scrip de ações internas para a VM:

~~~
config.vm.provision "shell", path: "provision.sh"
~~~


> parâmetro para conexão do plugin VMBox:

~~~
config.vbguest.auto_update = false
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
~~~

