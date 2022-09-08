#!/bin/bash
cd /home/marcos/Documentos/GitHub/curso-devops/ansible-lab/app01 # change to the directory where you have your vagrantfile
vagrant reload # inicia o ambiente virtual e recarrega os provisions
cd /home/marcos/Documentos/GitHub/curso-devops/ansible-lab/control-node # change to the directory where you have your vagrantfile
vagrant reload # inicia o ambiente virtual e recarrega os provisions
cd /home/marcos/Documentos/GitHub/curso-devops/ansible-lab/db01 # change to the directory where you have your vagrantfile
vagrant reload # inicia o ambiente virtual e recarrega os provisions