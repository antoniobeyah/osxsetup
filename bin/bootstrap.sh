#!/bin/sh
set -ex

xcode-select --install || true
python3 -m pip install --upgrade pip
which ansible || pip3 install --user ansible


## install oh-my-zsh
[[ ! -d ~/.oh-my-zsh ]] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## /install oh-my-zsh

PIP_BIN_DIR=$(python3 -c 'import site; print(site.USER_BASE)')/bin

$PIP_BIN_DIR/ansible-galaxy install -r requirements.yml
./bin/apply
