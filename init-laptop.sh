#!/bin/bash

WHOAMI=$(whoami)

sudo apt update
sudo apt install git python-pip -y
sudo pip install ansible
mkdir -p $HOME/git
cd $HOME/git
if [[ -d init-laptop ]]; then
  cd init-laptop && git pull origin master
else
  git clone https://github.com/bpetit/init-laptop.git && cd init-laptop
fi
cp host_vars/localhost.yml.sample host_vars/localhost.yml
sed -i "s/johndoe/${WHOAMI}/" host_vars/localhost.yml
wget https://files.pythonhosted.org/packages/source/m/mitogen/mitogen-0.2.3.tar.gz
tar xzvf mitogen-0.2.3.tar.gz
ansible-playbook --ask-become-pass init-laptop.yml
