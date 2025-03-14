#!/usr/bin/env bash
MAC_OS_BANNER="[SETUP INSTALLATION FOR MACOS]"
ANSIBLE_REQUIREMENTS_BANNER="[INSTALLATION OF ANSIBLE REQUIREMENTS]"
PYTHON_REQUIREMENTS_BANNER="[INSTALLATION OF PYTHON REQUIREMENTS]"
ANSIBLE_COMMAND_BANNER="[LAUNCHING ANSIBLE COMMAND]"
GITHUB_SETUP_URL="https://github.com/ta-yuhyeon/setup"
RAW_GITHUB_SETUP_URL="https://raw.githubusercontent.com/ta-yuhyeon/setup/refs/heads/devel"
PY_REQUIREMENTS_PATH="/requirements/requirements.txt"
ANSIBLE_REQUIREMENTS_PATH="/requirements/requirements.yml"
ANSIBLE_PLAYBOOK_PATH="local.yml"
DOTFILES_FOLDER="files"
GITHUB_FOLDER_PATH="github"
SPACER=$(echo -e "\n \n")

if [[ -f /usr/bin/sw_vers ]];
then
    echo -e $MAC_OS_BANNER
    xcode-select --install
    $SPACER

    echo -e $PYTHON_REQUIREMENTS_BANNER
    pip3 install -r <(curl -s $RAW_GITHUB_SETUP_URL$PY_REQUIREMENTS_PATH) -q
    export PATH="$PATH:/opt/homebrew/bin:/Users/$(whoami)/Library/Python/3.9/bin"
    $SPACER

    echo -e $ANSIBLE_REQUIREMENTS_BANNER
    curl -s "${RAW_GITHUB_SETUP_URL}${ANSIBLE_REQUIREMENTS_PATH}" -o /tmp/requirements.yml
    ansible-galaxy install -r /tmp/requirements.yml; rm /tmp/requirements.yml
    $SPACER

    echo -e $ANSIBLE_COMMAND_BANNER
    # ansible-pull -U $GITHUB_SETUP_URL -C devel --ask-become-pass -v
    if [[ -d $HOME/$GITHUB_FOLDER_PATH ]];
    then
        echo -e "DIRECTORY AND REPO ALREADY CLONED"
        $SPACER
        echo -e "REMAINING COMMAND TO LAUNCH"
        $SPACER
        cd $HOME/$GITHUB_FOLDER_PATH/setup && git submodule update --init
        echo -e ansible-playbook ${HOME}/${GITHUB_FOLDER_PATH}/${ANSIBLE_PLAYBOOK_PATH} --ask-become-pass
        exit 1
    else
        mkdir $HOME/$GITHUB_FOLDER_PATH
        git clone $GITHUB_SETUP_URL $HOME/$GITHUB_FOLDER_PATH
        (cd $HOME/$GITHUB_FOLDER_PATH/setup && git submodule update --init)
    fi
fi
