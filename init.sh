#!/usr/bin/env bash

pip3 install -r ./requirements/requirements.txt -q
git submodule update --init
export PATH="$PATH:/opt/homebrew/bin:/Users/$(whoami)/Library/Python/3.9/bin"
ansible-galaxy install -r ./requirements/requirements.yml 
ansible-playbook setup.yml --ask-become-pass
