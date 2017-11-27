#!/bin/bash

apt-get update
apt-get install vim python-pip -y
pip install ansible
ansible-playbook init-laptop.yml
