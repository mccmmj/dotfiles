Summary:
=======
Project for setting up dotfiles for Linux development.  Uses ansible to install .dotfiles on target user account.  There are four parts to the setup:

  *  base-development-sudo: installs requires packages (requires root(sudo) access)
  *  base-development: installs requires packages (does not require sudo access)
  *  tmux-development: tumux configuration
  *  zsh-development: zsh setup including (oh-my-zsh)
  *  vim-development: vim setup with lots of plugins
 
Prerequisites:
==============
   A python virutal env for installing some of the required packages

Installation
==============


```
#!bash

  cd ~
  git clone https://mccjmcc@bitbucket.org/mccjmcc/dotfiles.git .dotfiles
  cd ~/.dotfiles

```
   
  Run privileged playbook first to install the necessary development packages:


```
#!bash

   ansible-playbook devsetup.yml -i inventory.local -K -c local \
         -e "hosts=local devuser=<target user> virtual_env=${VIRTUAL_ENV}" \
         -t base-development
```

  Next, setup dotfiles as the target user:
    For just Vim devlopment:

```
#!bash

    ansible-playbook dotfiles.yml -i inventory.local -K -c local \
        -e "hosts=local devuser=<devuser> virtual_env=${VIRTUAL_ENV}" -t vim-development
```

    OR, for everything:

```
#!bash
    ansible-playbook dotfiles.yml -i inventory.local -K -c local \
        -e "hosts=local devuser=<devuser> virtual_env=${VIRTUAL_ENV}"
```