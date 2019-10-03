# # install zsh on /home/lizz/app/zsh

# ROOTDIR=/home/lizz/app
# mkdir -p $ROOTDIR

wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir src && unxz zsh.tar.xz && tar -xvf zsh.tar -C src --strip-components 1

# mv zsh.tar.xz $ROOTDIR/

# cd $ROOTDIR
# mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
# rm zsh.tar zlib.tar.gz

# cd zsh

# export C_INCLUDE_PATH=/home/lizz/app/ncurses/include:$C_INCLUDE_PATH
# export LD_LIBRARY_PATH=/home/lizz/app/ncurses/lib:LD_LIBRARY_PATH
# export LIBRARY_PATH=/home/lizz/app/ncurses/lib:$LIBRARY_PATH

# make configure
# ./configure --prefix=$ROOTDIR/zsh && make -j && make install
# # ./configure --prefix=$ROOTDIR/zsh --enable-shared && make -j && make install

# cd bin
# echo zsh installed on `pwd`
# echo put this in .profile
# echo [ -f $HOME/bin/zsh ] && exec $HOME/bin/zsh -l
# Installs Zsh with Oh-My-Zsh without root privileges
# on Stanford's Sherlock (https://sherlock.stanford.edu) for use in tmux
#
# Instructions
# 1) bash install_zsh.sh
# 2) edit .zshrc and add the path to your Zsh binary to the PATH variable
# 3) add `set-option -g default-shell <path to zsh>/bin/zsh` to `~/.tmux.conf`
#
# References: https://www.drewsilcock.co.uk/compiling-zsh
#
# # Notes:
#
# ## Man pages
#
# We are not installing the man pages. This causes Zsh's make to complain and exit with an error. Ignore this!
# If you want man pages, you should probably follow Drews instructions (https://www.drewsilcock.co.uk/compiling-zsh).
# However, when I tried there were some errors which I did not bother to look at. I got pretty far though using the
# following notes:
#   * make sure to use a current gcc: `ml gcc/8.1.0`
#   * use an "old" icmake; I used the one mentioned by Drew: 7.21.00 (https://gitlab.com/fbb-git/icmake/tags)
#   * use an "old" yodl; I used 3.04.00 (https://gitlab.com/fbb-git/yodl/tags)
#   * for icmake run the following (in addition to changing the log files):
#     * ./icm_prepare /
#     * ./icm_bootstrap x
#     * ./icm_install strip all
# This actually got my to compile icmake correctly. For yodl latex was still missing.
#
# ## Ncruses
#
# Ncurses is not only required for compilation. If you delete it after the installation
# the the prompt will constantly break, e.g., when using any of the arrow keys :)
# Thus, it is integrated into the Zsh installation.
#
# ## Weird prompt and Oh-My-Zsh
#
# When you run Zsh after installing by this script. The shell is not able to parse the default prompt
# showing a bunch of color encodings and whatnot. I have no idea why this happens.
# Any other prompt than the default one seems to work fine.
# Using Oh-My-Zsh also fixes this issue.
#

ZSH_INSTALL_DIR=$HOME/app/zsh

# switch to tmp folder
mkdir tmp; cd tmp

# get ncurses
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.1.tar.gz
tar -xf ncurses-6.1.tar.gz
cd ncurses-6.1

# Set cflags and c++ flags to compile with Position Independent Code enabled which we need for compiling zsh
export CXXFLAGS=' -fPIC'
export CFLAGS=' -fPIC'

./configure --prefix=$ZSH_INSTALL_DIR --enable-shared
make -j
make install
cd ..

# Tell environment where ncurses is
INSTALL_PATH="$ZSH_INSTALL_DIR"
export PATH=$INSTALL_PATH/bin:$PATH
export LD_LIBRARY_PATH=$INSTALL_PATH/lib:$LD_LIBRARY_PATH
export CFLAGS=-I$INSTALL_PATH/include
export CPPFLAGS="-I$INSTALL_PATH/include"
export LDFLAGS="-L$INSTALL_PATH/lib"


# Zsh

# Get zsh
git clone git://github.com/zsh-users/zsh.git

# Move into root zsh source directory
cd zsh

# Produce config.h.in, needed to produce config.status from ./configure
autoheader

# Produce the configure file from aclocal.m4 and configure.ac
autoconf

# Produce Makefile and config.h via config.status
./configure --prefix=$ZSH_INSTALL_DIR --enable-shared

make -j
make install

cd ..

# oh-my-zsh

# clone repository into local dotfiles
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# copy template file into home directory
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

cd ..

# delete tmp folder
#rm -rf tmp
