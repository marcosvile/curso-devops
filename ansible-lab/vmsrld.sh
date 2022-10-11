#!/bin/bash
cd ../ansible-lab/app01 # change to the directory where you have your vagrantfile
vagrant reload --provision # inicia o ambiente virtual e recarrega os provisions
cd ..
cd ../ansible-lab/control-node # change to the directory where you have your vagrantfile
vagrant reload --provision # inicia o ambiente virtual e recarrega os provisions
cd ..
cd ../ansible-lab/db01 # change to the directory where you have your vagrantfile
vagrant reload --provision # inicia o ambiente virtual e recarrega os provisions
