#!/bin/bash

WHOAMI=$(whoami)

sudo apt update
sudo apt install git python3-pip -y
sudo pip3 install ansible mat2 --break-system-packages
mkdir -p $HOME/git
cd $HOME/git
if [[ -d init-laptop ]]; then
  cd init-laptop && git pull origin master
else
  git clone https://github.com/bpetit/init-laptop.git && cd init-laptop
fi
cp host_vars/localhost.yml.sample host_vars/localhost.yml
sed -i "s/johndoe/${WHOAMI}/" host_vars/localhost.yml
ansible-playbook --ask-become-pass init-laptop.yml
