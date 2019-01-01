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

   ansible-playbook devsetup.yml \
        -e "devuser=mccjmcc virtual_env=${VIRTUAL_ENV}" \
        -t base-development
```

Next, setup dotfiles as the target user.
   For just Vim development:

```
#!bash

   ansible-playbook dotfiles.yml \
        -e "devuser=mccjmcc virtual_env=${VIRTUAL_ENV}" \
        -t vim-development
```

For everything else.
   run without tag:

```
#!bash
   ansible-playbook dotfiles.yml \
        -e "devuser=mccjmcc virtual_env=${VIRTUAL_ENV}" \
```

Available tags:

  * zsh-development
  * tmux-development
  * vim-development
  * base-development
