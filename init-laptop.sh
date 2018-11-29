#!/bin/bash

apt install git ansible -y
mkdir -p $HOME/git
cd $HOME/git
git clone https://github.com/bpetit/init-laptop.git
cd init-laptop
cp host_vars/localhost.yml.sample host_vars/localhost.yml
sed -i "s/johndoe/${WHOAMI}/" host_vars/localhost.yml
ansible-playbook init-laptop.yml
