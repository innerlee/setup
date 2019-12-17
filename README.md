# Setup a New Machine without `sudo`!

Download, compile and install commonly used software to a custom path.

## Term of Usage

-  Star the repo before clone
-  File issue if it does not work
-  Unstar if you feel it is unmaintained

## Usage

```bash
# configure setup path, you can put them into your `.bashrc` or `.zshrc`
export ZZROOT=$HOME/app
export PATH=$ZZROOT/bin:$PATH
export LD_LIBRARY_PATH=$ZZROOT/lib:$ZZROOT/lib64:$LD_LIBRARY_PATH

# e.g. install git
sh zzgit.sh
```

**NOTE:**
If the download speed of the machine is too slow, you can put the `git.tar.gz` (using git as an example) into `$ZZROOT/downloads` before running the script.
For the download link, check the `DOWNLOADURL` variable in its script; for the exact name of the software, check the `NAME` variable.

## Supported Softwares

Verified on Ubuntu 18.04

Updated: Dec 17, 2019

### libs

-   [boost](https://www.boost.org/) (1.71.0)
    -   install script: [`./zzboost.sh`](zzboost.sh)
    -   post install: `export BOOST_ROOT=$ZZROOT`
-   [gmp](https://gmplib.org/) (6.1.2)
    -   install script: [`./zzgmp.sh`](zzgmp.sh)
-   [mpc](https://ftp.gnu.org/gnu/mpc/) (1.1.0)
    -   depends on: `gmp`, `mpfr`
    -   install script: [`./zzmpc.sh`](zzmpc.sh)
-   [mpfr](https://www.mpfr.org/) (4.0.2)
    -   depends on: `gmp`
    -   install script: [`./zzmpfr.sh`](zzmpfr.sh)
-   [nasm](https://www.nasm.us/) (2.14.02)
    -   install script: [`./zznasm.sh`](zznasm.sh)
-   [yasm](https://yasm.tortall.net/) (1.3.0)
    -   install script: [`./zzyasm.sh`](zzyasm.sh)
-   [ncurses](https://invisible-island.net/ncurses/) (6.1)
    -   install script: [`./zzncurses.sh`](zzncurses.sh)
-   [freetype](https://www.freetype.org/) (2.10.1)
    -   install script: [`./zzfreetype.sh`](zzfreetype.sh)
-   [opencv](https://opencv.org/) (4.1.2)
    -   note: this config is designed for [denseflow](https://github.com/innerlee/denseflow).
        Please modify the cmake flags for your needs.
    -   depends on: `ccache`, `ffmpeg`
    -   install script: [`./zzopencv.sh`](zzopencv.sh)
    -   post install: `export OpenCV_DIR=$ZZROOT`
-   [openssl](https://www.openssl.org/) (1.1.1d)
    -   note: both `PREFIX` and `OPENSSLDIR` are set to `$ZZROOT/ssl`
    -   install script: [`./zzopenssl.sh`](zzopenssl.sh)
    -   post install: for cmake `export OPENSSL_ROOT_DIR=$ZZROOT/ssl`, and for configure `--with-ssl=$ZZROOT/ssl`
-   [libcurl](https://curl.haxx.se/libcurl/) (7.67.0)
    -   depends on: `autoconf`, `automake`, `libtool`, `m4`, `nroff`, `perl`, `openssl`
    -   install script: [`./zzlibcurl.sh`](zzlibcurl.sh)
-   [libevent](https://libevent.org/) (2.1.11)
    -   install script: [`./zzlibevent.sh`](zzlibevent.sh)
-   [libvpx](https://www.webmproject.org/code/) (master)
    -   install script: [`./zzlibvpx.sh`](zzlibvpx.sh)
-   [libx264](https://www.videolan.org/developers/x264.html) (master)
    -   install script: [`./zzlibx264.sh`](zzlibx264.sh)
-   [libx265](http://x265.org/) (3.2.1)
    -   install script: [`./zzlibx265.sh`](zzlibx265.sh)
-   [libz](https://www.zlib.net/) (1.2.11)
    -   install script: [`./zzlibz.sh`](zzlibz.sh)
-   [libzstd](https://facebook.github.io/zstd/) (1.4.4)
    -   install script: [`./zzlibzstd.sh`](zzlibzstd.sh)
-   [libzip](https://libzip.org/) (1.5.2)
    -   install script: [`./zzlibzip.sh`](zzlibzip.sh)
-   [libtool](https://www.gnu.org/software/libtool/) (2.4.6)
    -   install script: [`./zzlibtool.sh`](zzlibtool.sh)
-   [libjpeg](http://www.ijg.org/) (6b)
    -   depends on: `libtool`
    -   install script: [`./zzlibjpeg.sh`](zzlibjpeg.sh)
-   [libjpeg-turbo](https://libjpeg-turbo.org/) (2.0.3)
    -   depends on: `nasm`, `yasm`
    -   install script: [`./zzlibjpegturbo.sh`](zzlibjpegturbo.sh)
-   [libpng](http://www.libpng.org/pub/png/libpng.html) (1.6.37)
    -   install script: [`./zzlibpng.sh`](zzlibpng.sh)
-   [libtiff](http://www.simplesystems.org/libtiff/) (4.1.0)
    -   install script: [`./zzlibtiff.sh`](zzlibtiff.sh)
-   [libwebp](https://developers.google.com/speed/webp/download) (1.0.3)
    -   install script: [`./zzlibwebp.sh`](zzlibwebp.sh)
-   [libgif](http://giflib.sourceforge.net/) (5.2.1)
    -   install script: [`./zzlibgif.sh`](zzlibgif.sh)
-   [libopenjp2](https://www.openjpeg.org/) (2.3.1)
    -   install script: [`./zzlibopenjp2.sh`](zzlibopenjp2.sh)

### tools

-   [ccache](https://ccache.dev/) (3.7.6)
    -   install script: [`./zzccache.sh`](zzccache.sh)
-   [cmake](https://cmake.org/) (3.16.0)
    -   install script: [`./zzcmake.sh`](zzcmake.sh)
-   [anaconda3](https://www.anaconda.com/) (2019.10)
    -   note: anaconda is installed default on `$HOME/anaconda3`
    -   install script: [`./zzconda.sh`](zzconda.sh)
    -   post install: `export PATH=$HOME/anaconda3/bin:$PATH`
-   [ffmpeg](https://www.ffmpeg.org/) (4.2.1)
    -   depends on: `nasm`, `yasm`, `libx264`, `libx265`, `libvpx`
    -   install script: [`./zzffmpeg.sh`](zzffmpeg.sh)
-   [gcc](https://gcc.gnu.org/) (7.5.0)
    -   note: CUDA 10 support up to gcc 7, CUDA 9 support up to gcc 5.
    -   depends on: `gmp`, `mpfr`, `mpc`
    -   install script: [`./zzgcc.sh`](zzgcc.sh)
-   [git](https://github.com/git/git) (2.24.0)
    -   depends on: `libcurl`, `libz`
    -   install script: [`./zzgit.sh`](zzgit.sh)
-   [hdf5](https://www.hdfgroup.org/solutions/hdf5/) (1.10.5)
    -   install script: [`./zzhdf5.sh`](zzhdf5.sh)
-   [htop](https://hisham.hm/htop/) (2.2.0)
    -   depends on: `ncurses`
    -   install script: [`./zzhtop.sh`](zzhtop.sh)
-   [julia](https://julialang.org/) (1.3.0)
    -   install script: [`./zzjulia.sh`](zzjulia.sh)
-   [autojump](https://github.com/wting/autojump) (master)
    -   install script: [`./zzautojump.sh`](zzautojump.sh)
    -   post install: put [lines of configs](.zshrc#L17) in `.zshrc`
-   [imagemagick](https://imagemagick.org/) (latest)
    -   depends on: `freetype`, `libjpeg-turbo`, `libpng`, `perl`
    -   install script: [`./zzimagemagick.sh`](zzimagemagick.sh)
-   [nmon](http://nmon.sourceforge.net/pmwiki.php) (16j)
    -   depends on: `ncurses`
    -   install script: [`./zznmon.sh`](zznmon.sh)
-   [zsh](http://zsh.sourceforge.net/) (5.7.1)
    -   depends on: `ncurses`
    -   install script: [`./zzzsh.sh`](zzzsh.sh)
    -   post install: to set `zsh` as default shell without root, add `exec $ZZROOT/bin/zsh -l` to `.bashrc` ([example](https://github.com/innerlee/setup/blob/master/.bashrc))
-   [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) (latest)
    -   depends on: `zsh`
    -   install script: [`./zzohmyzsh.sh`](zzohmyzsh.sh)
-   [perl](https://www.perl.org/) (5.30.1)
    -   install script: [`./zzperl.sh`](zzperl.sh)
-   [tmux](https://github.com/tmux/tmux) (3.0a)
    -   depends on: `libevent`
    -   install script: [`./zztmux.sh`](zztmux.sh)
-   [unrar](https://www.rarlab.com/rar_add.htm) (5.8.4)
    -   install script: [`./zzunrar.sh`](zzunrar.sh)
-   [vmtouch](https://hoytech.com/vmtouch/) (1.3.1)
    -   install script: [`./zzvmtouch.sh`](zzvmtouch.sh)

### zz scripts & customized tools

-   [sshpass](https://github.com/innerlee/sshpass) (support 2-step verification)
    -   depends on: `oathtool`, `autoconf`
    -   install script: [`./zzsshpass.sh`](zzsshpass.sh)
-   [denseflow](https://github.com/innerlee/denseflow) (extract frames, optical flow, resize, and more!)
    -   depends on: `boost`, `opencv`
    -   install script: [`./zzdenseflow.sh`](zzdenseflow.sh)
-   [wslssh.bat](wslssh.bat) (use ssh of wsl in win10, no installation, `.bat` script as is)
    -   depends on: `sshpass`
    -   you can set `vscode` ssh path to this `wslssh.bat`, work together with `sshpass` (installed in wsl)
-   [sshkey.sh](sshkey.sh) (gen an ssh key)
    -   run script: `./sshkey.sh`
-   [zshplugin.sh](zshplugin.sh) (completions, autosuggestions, syntax-highlighting)
    -   depends on: `git`
    -   install script: [`./zshplugin.sh`](zshplugin.sh)
    -   post install: put [lines of configs](.zshrc#L6-L15) in `.zshrc`
-   [nordtmux.sh](nordtmux.sh) (nord theme for tmux)
    -   depends on: `git`, `tmux`
    -   install script: [`./nordtmux.sh`](nordtmux.sh)
-   [dircolor.sh](dircolor.sh) (nord theme for zsh)
    -   install script: [`./dircolor.sh`](dircolor.sh)
    -   post install: put [lines of configs](.zshrc#L1-L2) in `.zshrc`

### zz configures

-   [`.tmux.conf`](.tmux.conf) (tmux configuration)
-   [`.zshrc`](.tmux.conf) (zsh configuration)
-   [`.netrc`](.netrc) (lftp password-less configuration)
-   [`.ssh/config`](.ssh/config) (suppress git clone warnings)
-   [`.lftp/rc`](.lftp/rc) (suppress lftp ssl warning)

### useful articles
-   [opengl on remote machine](https://www.scm.com/doc/Installation/Remote_GUI.html)
