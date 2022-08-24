# Documentação do Playbook para o Control-Node | Lab-Ansible

## Inicio

Os playbooks são configurados no diretorio principal: /playbooks

> O playbook é construído com um arquivo YAML

` name  : ` este é tag de identificação do playbook

` hosts: ` este é tag de atribuição de qual host (máquina) você vai utilizar

` vars:` tag para descrever variaveis para configurar o bando de dados, onde vai conter o usuario, nome do bando e password

` usuario: ` este é a tag de dizer qual o usuario irá executar as atividades, atribuindo o root para execução dos scrips.

` tasks:` tag que descreve as tarefas a serem executadas neste playbook, onde vai conter, nome, roles, endereços ips dos hosts que vão se comunicar com o control node.

`role: ` tag que indica a imagem/template do que será implementado na vm, neste caso, uma imagem de um banco de dados buscado automaticamente no hub do ansible (galaxy). O ansible busca a roles para execução, dentro do diretorio configuracao-default-so, pasta padrão para inserir a role padrão para instalar o so.