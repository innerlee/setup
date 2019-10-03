# Installs Zsh

# dependency ncurses
sh zzncurses.sh

ZSH_INSTALL_DIR=$HOME/app/zsh
mkdir -p $ZSH_INSTALL_DIR

# Set cflags and c++ flags to compile with Position Independent Code enabled which we need for compiling zsh
export CXXFLAGS=' -fPIC'
export CFLAGS=' -fPIC'

# Tell environment where ncurses is
INSTALL_PATH="$HOME/app/ncurses"
export PATH=$INSTALL_PATH/bin:$PATH
export LD_LIBRARY_PATH=$INSTALL_PATH/lib:$LD_LIBRARY_PATH
export CFLAGS=-I$INSTALL_PATH/include
export CPPFLAGS="-I$INSTALL_PATH/include" LDFLAGS="-L$INSTALL_PATH/lib"

# Zsh
cd $ZSH_INSTALL_DIR

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

echo put this in .bashrc
echo '[ -f $HOME/app/zsh/bin/zsh ] && exec $HOME/app/zsh/bin/zsh -l'
