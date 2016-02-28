#!/bin/sh
##
## Notes:
## This script attempts to fully setup a development environment for python using VIM
## The entire environment is provisioned using ansible.  There are four parts to the
## setup:
##    base-development: installs requires packages (requires root(sudo) access)
##    tmux-development: tumux configuration
##    zsh-development: zsh setup including (oh-my-zsh)
##    vim-development: vim setup with lots of plugins
## Prerequisites:
##    A python virutal env for installing some of the required packages
##
## Script can be run manually to run or rerun any of the parts.
## To just perfom the base development build
##    ansible-playbook devsetup.yml -i inventory.local -K -c local \
##       -e "hosts=local devuser=${LOGNAME} virtual_env=${VIRTUAL_ENV}" \
##       -t vim-development
## For other parts,
##    -t zsh-development
##    -t tmux-development
##    -t vim-development
##
ansible-playbook devsetup.yml -i inventory.local -K -c local -e "hosts=local devuser=${LOGNAME} virtual_env=${VIRTUAL_ENV}"
