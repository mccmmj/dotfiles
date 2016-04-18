Summary:
=======
This project setting up dotfiles for linux development.  Uses ansible to install .dotfiles for target user account.  There are four parts to the setup:
*    base-development-sudo: installs requires packages (requires root(sudo) access)
*    base-development: installs requires packages (does not require sudo access)
*    tmux-development: tumux configuration
*    zsh-development: zsh setup including (oh-my-zsh)
*    vim-development: vim setup with lots of plugins
 
Prerequisites:
==============
   A python virutal env for installing some of the required packages

Run playbooks as follows.
Need root priviledge to run the base-development portion
To just perfom the base development build
   ansible-playbook dotfiles.yml -i inventory.local -K -c local \
      -e "hosts=local devuser=${LOGNAME} virtual_env=${VIRTUAL_ENV}" \
      -t base-development
For other parts,
   -t zsh-development
   -t tmux-development
   -t vim-development

Examples
-----------------------
Start with installing required packages from an account capable of sudo access:
    ansible-playbook devsetup.yml -i inventory.local -K -c local \
        -e "hosts=local devuser=<devuser> virtual_env=${VIRTUAL_ENV}" -t base-development-sudo
Next, setup dotfiles as the target user:
    For just Vim devlopment:
    ansible-playbook dotfiles.yml -i inventory.local -K -c local \
        -e "hosts=local devuser=<devuser> virtual_env=${VIRTUAL_ENV}" -t vim-development
    OR, for everything:
    ansible-playbook dotfiles.yml -i inventory.local -K -c local \
        -e "hosts=local devuser=<devuser> virtual_env=${VIRTUAL_ENV}"