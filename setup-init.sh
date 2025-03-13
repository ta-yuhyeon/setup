#!/usr/bin/env bash
MAC_OS_BANNER="[SETUP INSTALLATION FOR MACOS] \n"
RAW_GITHUB_SETUP_URL="https://raw.githubusercontent.com/ta-yuhyeon/setup/refs/heads/devel"
PY_REQUIREMENTS_PATH="/requirements/requirements.txt"
ANSIBLE_REQUIREMENTS_PATH="/requirements/requirements.yml"
ANSIBLE_PLAYBOOK_PATH="/setup.yml"
if [[ -f /usr/bin/sw_vers ]];
then
    echo -e $MAC_OS_BANNER
    xcode-select --install
    pip3 install -r <(curl -s $RAW_GITHUB_SETUP_URL$PY_REQUIREMENTS_PATH) -q
    # git submodule update --init
    export PATH="$PATH:/opt/homebrew/bin:/Users/$(whoami)/Library/Python/3.9/bin"
    curl -s "${RAW_GITHUB_SETUP_URL}${ANSIBLE_REQUIREMENTS_PATH}" -o /tmp/requirements.yml
    ansible-galaxy install -r /tmp/requirements.yml; rm /tmp/requirements.yml
    ansible-playbook setup.yml --ask-become-pass
fi
