#!/usr/bin/env bash

pip3 install -r ./requirements/requirements.txt
export PATH=$PATH:/Users/$(whoami)/Library/Python/3.9/bin
ansible-galaxy install -r ./requirements/requirements.yml
ansible-playbook setup.yml --ask-become-pass