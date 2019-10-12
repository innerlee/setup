ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

git clone git://github.com/wting/autojump.git
cd autojump
./install.py
