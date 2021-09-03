# Summary:

Use this project for setting up dotfiles for Linux development.  Uses ansible 
to install .dotfiles on target user account.  There are four parts to the setup:

  *  base-development-sudo: installs requires packages (requires root(sudo) access)
  *  base-development: installs required packages (does not require sudo access)
  *  tmux-development: tumux configuration
  *  zsh-development: zsh setup including (oh-my-zsh)
  *  vim-development: vim setup with lots of plugins

Provides a nice development environment on Linux virtual machines consisting of 
Tmux, Zsh and Vim.  The ZSH shell environment is based on 
[robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).  The Vim 
environment is enhanced by plugins intended to support Vim-As-A-Python-IDE.  Tmux
is useful for pair programming, builds and a other useful parallelisms.

#### TMUX

TBD

#### ZSH

The ZSH environemt is based on 
[robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

The following Zshrc files are provided
  * Zsh start runtime command file
    * `~/.zshrc`
  * Zsh specialization (oh-my-zsh directory contents)
    * `~/.oh-my-zsh`

#### VIM

The Vim environment includes the following plugins:
  * [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
  * [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
  * [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
  * [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
  * [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
  * [bling/vim-airline](https://github.com/bling/vim-airline)
  * [tmhedberg/SimpylFold](https://github.com/tmhedberg/SimpylFold)
  * [jlanzarotta/bufexplorer](https://github.com/jlanzarotta/bufexplorer)
  * [vim-syntastic/syntastic](https://github.com/vim-syntastic/syntastic)
  * [tpope/vim-surround](https://github.com/tpope/vim-surround)
  * [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
  * [tomtom/tlib_vim](https://github.com/tomtom/tlib_vim)
  * [garbas/vim-snipmate](https://github.com/garbas/vim-snipmate)
  * [mattn/emmet-vim](https://github.com/mattn/emmet-vim)
  * [vim-scripts/YankRing.vim](https://github.com/vim-scripts/YankRing.vim)
  * [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)
  * [MarcWeber/vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils)
  * [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
  * [godlygeek/tabular](https://github.com/godlygeek/tabular)
  * [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)
  * [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
  * [groenewege/vim-less](https://github.com/groenewege/vim-less)
  * [othree/html5.vim](https://github.com/othree/html5.vim)
  * [elzr/vim-json](https://github.com/elzr/vim-json)
  * [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)
  * [mbbill/undotree](https://github.com/mbbill/undotree)
  * [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
  * [vim-scripts/EasyGrep](https://github.com/vim-scripts/EasyGrep)
  * [jistr/vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
  * [vim-scripts/taglist.vim](https://github.com/vim-scripts/taglist.vim)
  * [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)
  * [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
  * [fatih/vim-go](https://github.com/fatih/vim-go)
  * [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)
  * [michaeljsmith/vim-indent-object](https://github.com/michaeljsmith/vim-indent-object)
  * [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
  * [vim-scripts/mru.vim](https://github.com/vim-scripts/mru.vim)
  * [tpope/vim-haml](https://github.com/tpope/vim-haml)
  * [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
  * [honza/vim-snippets](https://github.com/honza/vim-snippets)
  * [derekwyatt/vim-scala](https://github.com/derekwyatt/vim-scala)
  * [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
  * [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
  * [ekalinin/Dockerfile.vim](https://github.com/ekalinin/Dockerfile.vim)

The following Vimrc files are provided:
  * Vim start runtime command file
    * `~/.vimrc`
  * Vim basic settings
    * `~/.vim/vimrcs/basic.vim`
  * Vim addvanced(hacker) settings
    * `~/.vim/vimrcs/extended.vim`
  * Vim plugin settings
    * `~/.vim/vimrcs/plugins_config.vim`
  * Vim settings and special handling for filetypes (python, javascript, coffeescript, etc)
    * `~/.vim/vimrcs/filetypes.vim`
  * Vim user specific settings (specifically toward plugins)
    * *optional* `~/.vim/my_configs.vim`

# Prerequisites:

All of the steps in this guide require a python virutal env minimally 
configured with the following packages:

```
ansible (2.4.1.0)
cpplint (1.3.0)
flawfinder (2.0.4)
powerline-status (2.6)
pyflakes (1.6.0)
pip (9.0.1)
setuptools (36.7.0)
```

To create a new virtualenv:

```
$ virtualenv mypyenv
$ source mypyenv/bin/activate
```

Create a requirements.txt file:

```
pip
ansible
cpplint
powerline-status
pyflakes
setuptools
```

Install the requirements:

```
$ pip install -U -r requirements.txt
```

If flawfinder is unable to install, remove it from the requirements.txt file,
re-install the requirements and add flawfinder manually.  

```
$ wget https://www.dwheeler.com/flawfinder/flawfinder-2.0.4.tar.gz
$ tar -zxvf flawfinder-*.tar.gz
$ cd flawfinder-*
$ python setup.py install
```


Beyond that, this guide sets up a vim development environment targeted primarily
at python and C/C++ development.  It requires a recent version ov Vim 
(Vim 7.4.1568+).  Several Vim plugins are installed including the 
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
plugin.  In order for the YouCompleteMe plugin to function properly, your 
systems need to have a version of Clang installed.  Use the following guides
for upgrade your systems:

[Use this guide for building and installing the latest version of VIM](BuildVimFromSource.md) 
on RHEL7.

[Use this guide for building and installing the latest version of LLVM](BuildLLVMFromSource.md) 
on RHEL7.

Another very useful ssh-client application is 
the Multi-Remote Next Generation desktop application.  It integrates nicely with 
Putty or Kitty and enable tabbed sessions.  It is very useful for user that 
typically establish multiple ssh sessions among many different servers:

[Use this guide for installing and setting up the latest version of mRemoteNG](SetupmRemoteNG.md) 
on Windows.



# Installation

Clone the .dotfiles repository into your home directory:

```bash
cd ~
git clone https://github.com/mccmmj/dotfiles.git  ~/.dotfiles
cd ~/.dotfiles
```
   
Run privileged playbook first to install the necessary development packages:

**_Note_**: this next step is *optional* and can typically be skipped.  It 
installs the system's Vim package and a few other development related packages.
Most likely, Vim is already installed on your system in one of two ways.  You may
have previously installed the *vim-enhanced* package on your RHEL7 machine and 
simply want to improve your Zsh and Vim environments.  In this case, you can 
utilize all of the Vim plugins provided here except for the YouCompleteMe 
plugin.  It requires a more recent version of Vim than what is supported on 
RHEL7 by default (as of 11/8/2017). If, on the other hand, you compiled and 
installed a more recent version of Vim as requested above in the *prerequisites* 
section, then you should skip this step as well (Note: with the newer Vim 
version you may also include the YCM plugin as described in the instuctions 
further below).

    ansible-playbook devsetup.yml -i "localhost," -K -c local \
      -e "logname=$LOGNAME virtual_env=$VIRTUAL_ENV" \
      -t base-development

Next, setup dotfiles as the target user.  Here, you should be logged in as 
the target user referred below as `logname`.

   * To setup Zsh, run the following
         
    ```bash
    ansible-playbook dotfiles.yml -i "localhost," -c local \
        -e "logname=$LOGNAME virtual_env=$VIRTUAL_ENV" -t zsh-development
    ```
   * For just Vim development
     - Exclude YCM (this is the fastest and easiest option):
        
        ```bash
        ansible-playbook dotfiles.yml -i "localhost," -c local \
            -e "logname=$LOGNAME virtual_env=$VIRTUAL_ENV" -t vim-development
        ```
     - Include YCM *without* LLVM & Clang (no symantic checking for C-languages):
         
        ```bash
        ansible-playbook dotfiles.yml -i "localhost," -c local \
            -e "include_ycm=True logname=$LOGNAME virtual_env=$VIRTUAL_ENV" -t vim-development
        ```
     - Include YCM *with* LLVM & Clang (this option requires the lenght build of LLVM & Clang):
        
        ```bash
        ansible-playbook dotfiles.yml -i "localhost," -c local \
            -e "include_ycm=True llvm_root=/path/to/llvm/root logname=$LOGNAME virtual_env=$VIRTUAL_ENV" -t vim-development
        ```
   * For everything else, run without tag:
     - Include/Exclude YCM *with* or *without* the llvm_root variable as above:
         
        ```bash
        ansible-playbook dotfiles.yml -i "localhost," -c local \
            -e "... logname=$LOGNAME virtual_env=$VIRTUAL_ENV"
        ```
   * Available tags:
     * zsh-development
     * tmux-development
     * vim-development
     * base-development

# Post-installation

This section applies only to C-language files (e.g, C/C++).  In order to get 
semantic auto-completion, real-time diagnostics, etc, the YCM
plugin needs to know various compiler flags and settings.  There are a few ways
to provide this information to be summarized here.  Check 
[here](https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion)
for more detailed instructions.

First, if you just build your project, using 
CMake, it can produce a database capable of being used by YCM.  This requires 
running CMake with the `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON` command line option 
or by adding the `set( CMAKE_EXPORT_COMPILE_COMMANDS ON )` to `CMakeLists.txt` and 
copy or symlink the generated database to the root of your project.

Alternatively, you can use the 
[YCM-Generator](https://github.com/rdnetto/YCM-Generator.git).  This Vim plugin 
is already installed and ready for operation.  It can be used to generate 
a `.ycm_extra_conf.py` for use with YCM.  It builds your project with a fake
toolchain to produce the necessary compiler flags for your project.  Successful
operation of this command requires that all of your projects dependencies are
installed and available to the build system.  

##### Special instructions for generating *.ycm_extra_conf.py* for EPS

For the eps-core project, it is required that the dependencies installed by the 
`eps-baseline` ansible playbook have completed.  With that in place, the 
following commands will create the necessary database for YCM:

- Setup your environment:
    
    ```bash
    export PYTHON_HOME=/usr
    export PYTHON_INCLUDE_DIR=${PYTHON_HOME}/include/python2.7
    export PYTHON_LIBRARY=${PYTHON_HOME}/lib/python2.7
    export BOOST_LIBRARYDIR=/usr/lib64
    export JSONCPP_ROOT=/usr
    export JSONCPP_ROOT=/usr/lib64
    export YAMLCPP_ROOT=/usr/lib64
    export ORACLE_HOME=/usr/lib/oracle/12.1/client64
    ```
- Generate the ycm_extra_conf.py file:
    
    ```bash        
    cd /path/to/your/eps-core    
    ~/.vim/bundle/YCM-Generator/config_gen.py \
        --compiler=/path/to/llvm/root/bin/clang --verbose -e .
    ```
    

