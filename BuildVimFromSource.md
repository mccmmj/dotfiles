# Building Vim from source
###### [Addapted from Valloric/YouCompleteMe for RHEL7](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)


Compiling Vim from source is actually not that difficult. Here's what you should do:

#### First, install all the prerequisite libraries (some of these may already be installed)

```  
sudo yum install -y \
     ctags git python python-devel ncurses-devel \
     perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp \
     perl-ExtUtils-CBuilder perl-ExtUtils-Embed
```

#### Remove vim if you have it already:

```bash
sudo yum erase -y vim-enhanced vim-common
```
  
#### Once everything is installed, getting the source is easy.

Download the latest VIM from source and configure:

```bash
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib64/python2.7/config \
            --enable-perlinterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
```

Next, use make to install:

```bash
cd ~/vim
sudo make install
```

Set vim as your default editor with `update-alternatives`:

```bash
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
```

Note: likely need to move /usr/bin/vi out of the way:

```bash
sudo mv /usr/bin/vi /usr/bin/vi74
```

Double check that you are in fact running the new Vim binary by looking at
the output of vim --version.

If you have problems, double check that you configured using the correct
Python config directory, as noted at the beginning of Step 3.

If you get stuck, here's some [other useful information on building 
Vim.](http://vim.wikia.com/wiki/Building_Vim)

