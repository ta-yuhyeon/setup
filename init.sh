#!/usr/bin/env bash

pip3 install -r ./requirements/requirements.txt -q
git submodule update --init
ansible-galaxy install -r ./requirements/requirements.yml 
ansible-playbook setup.yml --ask-become-pass
