# Building LLVM from source
###### [Addapted from Valloric/YouCompleteMe for RHEL7](https://github.com/Valloric/YouCompleteMe/wiki/Full-installation-on-CentOS)

Note: refer to the guide [Getting Started: Building and Running Clang](http://clang.llvm.org/get_started.html)
form more guidance on working with Clang.


#### Overview

This page details the steps for building and installing Clang on our RHEL7
virtual machines.  Clang is required for the
[Valloric/YouCompletMe](https://github.com/Valloric/YouCompleteMe) vim 
plugin used for our Vim development environemt.  YouCompleteMe is a fast, 
as-you-type, fuzzy-search code completion engine for Vim.

#### RHEL7 Installation

1. Checkout LLVM from source [llvm getting started](http://clang.llvm.org/get_started.html):
   * Change directory to where you want the llvm directory placed (e.g, /var/ueg/llvm)
   * `svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm`
2. Checkout Clang
   * `cd llvm/tools`
   * `svn co http://llvm.org/svn/llvm-project/cfe/trunk clang`
   * `cd ../..`
3. Build LLVM and CLang
   * `yum install cmake3`
   * `cd llvm`
   * `mkdir build`
   * `cd build`
   * `cmake3 -G "Unix Makefiles" \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=`pwd`/../root ../`
   * `make -j 8 ;# wait another lifetime`
   * `make install`
4. Record your installation root, it will be needed later (e.g, `PATH_TO_LLVM_ROOT=/var/ueg/llvm/root`)


