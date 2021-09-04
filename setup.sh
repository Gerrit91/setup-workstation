#!/bin/bash
set -eo pipefail

sudo apt update
sudo apt install python3-pip
sudo pip3 install --upgrade pip virtualenv

virtualenv venv --python=python3
. venv/bin/activate

python -m pip install --upgrade pip ansible
ansible-galaxy install geerlingguy.docker gantsign.oh-my-zsh
ansible-playbook setup.yaml "$@"
