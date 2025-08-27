# setup

 setup is a repository used to install my own setup for every kind of OS in its core it uses ansible and python virtual environment to maintain a pure environment.

## commands
##### xcode commands
```bash
xcode-select --install
```
##### path commands
for UNIX
```bash
export PATH=$PATH:/Users/$(whoami)/Library/Python/3.9/bin
```
for LINUX
```bash
export PATH=$PATH:/home/$(whoami)/Library/Python/3.9/binexport PATH=$PATH:/home/$(whoami)/Library/Python/3.9/bin
```

##### pip commands
```bash
pip install --upgrade pip
pip install virtualenv
pip install -r ./requirements/requirements.txt
```
##### pip3 commands
```bash
pip3 install --upgrade pip
pip3 install -r ./requirements/requirements.txt
pip3 install virtualenv
```

##### virtualenv commands
```bash
virtualenv ansible
source ./ansible/bin/activate
deactivate
```

##### ansible commands
```bash
ansible-galaxy install -r ./requirements/requirements.yml
ansible-playbook setup.yml --ask-become-pass
```

##### Inspirations
for this project i got inspired by the mac-dev-playbook from gerlingguy
