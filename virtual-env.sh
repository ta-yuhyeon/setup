#! /bin/bash
pip install --upgrade pip 
pip3 install --upgrade pip

pip install virtualenv 
pip3 install virtualenv

virtualenv ansible
source ./ansible/bin/activate
deactivate