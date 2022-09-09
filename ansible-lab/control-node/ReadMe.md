# Documentação do Playbook para o Control-Node | Lab-Ansible

## Inicio

Os playbooks são configurados no diretorio principal: /playbooks

> O playbook é construído com um arquivo YAML

` name  : ` este é tag de identificação do playbook

` hosts: ` este é tag de atribuição de qual host (máquina) você vai utilizar

` vars:` tag para descrever variaveis para configurar o bando de dados, onde vai conter o usuario, nome do banco e password

` usuario: ` este é a tag de dizer qual o usuario irá executar as atividades, atribuindo o root para execução dos scrips.

` tasks:` tag que descreve as tarefas a serem executadas neste playbook, onde vai conter, nome, roles, endereços ips dos hosts que vão se comunicar com o control node.

```
- name: Instalação do Maven
      yum:
        name: maven
        state: latest
```

`role: ` tag que indica a imagem/template/função do que será implementado na vm, neste caso, uma imagem de um banco de dados buscado automaticamente no hub do ansible (galaxy). O ansible busca a roles para execução, dentro do diretorio configuracao-default-so, pasta padrão para inserir a role padrão para executar os comandos.

```
- name: Upgrade dos pacotes do s.o
  yum:
    name: "*"
    state: latest
- name: Instalação do git client
  yum:
    name: git
    state: latest
```

`Handlers:` Handlers são tarefas, mas são executados no final do manual. Poderia dizer que os manipuladores são tarefas adicionais que são anexadas à lista de tarefas, não executadas entre duas outras tarefas.

```
handlers:
    - name: reload app
      systemd:
        state: restarted
        daemon_reload: yes
        name: 'notes'
    - name: reload daemon
      systemd:
        daemon_reexec: yes
```


`Detalhes:` A ordem de execução então se parece com esta:
Task -> Roles -> Handlers

Existem várias maneiras de executar tarefas com Ansible: Tasks, Roles e Handlers. Todos eles têm um caso de uso diferente e cada um tem suas vantagens e desvantagens.

Tarefas: visão geral clara das tarefas a serem executadas, mas pode ficar difícil de entender com scripts mais longas.
Roles: tarefas reutilizáveis que podem agendar outras tarefas, mas é mais difícil descobrir quais tarefas são executadas.
Handlers: Tarefas simples a serem executadas no final, mas você não pode dar-lhes um identificador agradável e descritivo.


# Executando o playbook:

- inicie as máquinas virtuais no vagrant e acesse o control node via vagrant ssh

user@debian:~/raiz do projeto $
```
$ vagrant ssh
```

- Dentro do control node vá até o diretório onde está armazenado os playbooks


### Para executaro playbook do banco de dados:<p>
[vagrant@control-node playbooks]$
```
$ ansible-playbook db.yaml
```

### Para executaro playbook da aplicação:<p>
[vagrant@control-node playbooks]$
```
$ ansible-playbook app01.yaml
```

> Voce pode checar a integridade do seu scrip passando o comando:<p>
> ``` $ ansible-playbook <playbook>.yaml --check ```<p><p>
> Quando o ansible-playbook é executado com --check, ele não fará nenhuma alteração nos sistemas remotos. O modo de verificação é apenas uma simulação e, se você tiver etapas que usam condicionais que dependem dos resultados de comandos anteriores, pode ser menos útil para você. No entanto, é ótimo para casos de uso de gerenciamento de configuração básica de um nó por vez.