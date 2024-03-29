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
## Need root priviledge to run the devsetup playbook
## To just perfom the devsetup (installs pacakges required for dev environment):
##    ansible-playbook devsetup.yml -i "localhost," -K -c local \
##       -e "logname=${LOGNAME} virtual_env=${VIRTUAL_ENV}"
##
## Examples
## Base development 
ansible-playbook dotfiles.yml -i "localhost," -c local \
   -e "logname=${LOGNAME} virtual_env=${VIRTUAL_ENV}" -t base-development
## For other parts,
##    -t zsh-development
##    -t tmux-development
##    -t vim-development
