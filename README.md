# Setup a New Machine without `sudo`!

Download, compile and install commonly used software to a custom path.

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

Updated: Dec 7, 2019

### libs

* [boost](https://www.boost.org/) (1.71.0)
* [gmp](https://gmplib.org/) (6.1.2)
* [mpc](https://ftp.gnu.org/gnu/mpc/) (1.1.0)
* [mpfr](https://www.mpfr.org/) (4.0.2)
* [nasm](https://www.nasm.us/) (2.14.02)
* [yasm](https://yasm.tortall.net/) (1.3.0)
* [ncurses](https://invisible-island.net/ncurses/) (6.1)
* [freetype](https://www.freetype.org/) (2.10.1)
* [opencv](https://opencv.org/) (4.1.2)
* [openssl](https://www.openssl.org/) (1.1.1d)
* [libcurl](https://curl.haxx.se/libcurl/) (7.67.0)
* [libevent](https://libevent.org/) (2.1.11)
* [libvpx](https://www.webmproject.org/code/) (master)
* [libx264](https://www.videolan.org/developers/x264.html) (master)
* [libx265](http://x265.org/) (3.2.1)
* [libz](https://www.zlib.net/) (1.2.11)
* [libzip](https://libzip.org/) (1.5.2)
* [libjpeg-turbo](https://libjpeg-turbo.org/) (2.0.3)
* [libpng](http://www.libpng.org/pub/png/libpng.html) (1.6.37)

### tools

* [ccache](https://ccache.dev/) (3.7.6)
* [cmake](https://cmake.org/) (3.16.0)
* [anaconda3](https://www.anaconda.com/) (2019.10)
* [ffmpeg](https://www.ffmpeg.org/) (4.2.1)
* [gcc](https://gcc.gnu.org/) (7.5.0)
* [git](https://github.com/git/git) (2.24.0)
* [hdf5](https://www.hdfgroup.org/solutions/hdf5/) (1.10.5)
* [htop](https://hisham.hm/htop/) (2.2.0)
* [julia](https://julialang.org/) (1.3.0)
* [autojump](https://github.com/wting/autojump) (master)
* [imagemagick](https://imagemagick.org/) (latest)
* [nmon](http://nmon.sourceforge.net/pmwiki.php) (16j)
* [zsh](http://zsh.sourceforge.net/) (5.7.1)
* [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) (latest)
* [perl](https://www.perl.org/) (5.30.1)
* [tmux](https://github.com/tmux/tmux) (3.0a)
* [unrar](https://www.rarlab.com/rar_add.htm) (5.8.4)
* [vmtouch](https://hoytech.com/vmtouch/) (1.3.1)

### zz scripts & customized tools

* [sshpass](https://github.com/innerlee/sshpass) (support 2-step verification)
* [denseflow](https://github.com/innerlee/denseflow) (extract frames, optical flow, resize, and more!)
* [wslssh.bat](wslssh.bat) (use ssh of wsl in win10, no installation, `.bat` script as is)
* [sshkey.sh](zzkey.sh) (gen an ssh key)
* [zshplugin](zshplugin.sh) (completions, autosuggestions, syntax-highlighting)


### zz configures

* [`.tmux.conf`](.tmux.conf) (tmux configuration)
* [`.zshrc`](.tmux.conf) (zsh configuration)
* [`.netrc`](.netrc) (lftp password-less configuration)
* [`.ssh/config`](.ssh/config) (suppress git clone warnings)
* [`.lftp/rc](.lftp/rc) (suppress lftp ssl warning)
