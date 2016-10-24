#!/bin/bash

apt-get update
apt-get install vim ansible -y
ansible-playbook init-laptop.yml
