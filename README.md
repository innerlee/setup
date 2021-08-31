# Setup a New Machine without `sudo`!

Download, compile and install commonly used software to a custom path.

<div style="align:center">
    <img src="https://img.devrant.com/devrant/rant/r_54040_zGEQB.jpg" height=128 />
<!--     <img src="https://www.leadingagile.com/wp-content/uploads/2017/03/works-on-my-machine.jpg" height=128 /> -->
</div>

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

**NOTE2:**
If you compile from source, please make sure that they are compiled using the same gcc version!

**NOTE3:**
If you **DO** have root privilate on your machine/server, then basic tools such as `libtool`, `ccache`, `git`, etc. might be better installed by OS's package manager. Such as `apt` in Ubuntu. Only install software that are not available on the OS's packaging system.

## Supported Softwares

Verified on Ubuntu 18.04

Updated: July 8, 2020

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
    -   post install: `export TERMINFO=$ZZROOT/share/terminfo`
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
    -   post install: for cmake `export OPENSSL_ROOT_DIR=$ZZROOT/ssl`, and for configure `--with-ssl=$ZZROOT/ssl` (the flag may be different in different configure scripts)
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
    -   install script: [`./zzlibjpeg-turbo.sh`](zzlibjpeg-turbo.sh)
-   [libpng](http://www.libpng.org/pub/png/libpng.html) (1.6.37)
    -   install script: [`./zzlibpng.sh`](zzlibpng.sh)
-   [libtiff](http://www.simplesystems.org/libtiff/) (4.1.0)
    -   install script: [`./zzlibtiff.sh`](zzlibtiff.sh)
-   [libwebp](https://developers.google.com/speed/webp/download) (1.0.3)
    -   install script: [`./zzlibwebp.sh`](zzlibwebp.sh)
-   [giflib](http://giflib.sourceforge.net/) (5.2.1)
    -   install script: [`./zzgiflib.sh`](zzgiflib.sh)
-   [libopenjp2](https://www.openjpeg.org/) (2.3.1)
    -   install script: [`./zzlibopenjp2.sh`](zzlibopenjp2.sh)

### tools

-   [autoconf](https://www.gnu.org/software/autoconf/) (2.69)
    -   depends on: `m4`, `perl`
    -   install script: [`./zzautoconf.sh`](zzautoconf.sh)
-   [ccache](https://ccache.dev/) (3.7.6)
    -   install script: [`./zzccache.sh`](zzccache.sh)
    -   post install: customize cache dir by `export CCACHE_DIR=~/.ccache` to avoid permission issue
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
    -   depends on: `freetype`, `libjpeg-turbo`, `libpng`, `libtool`, `perl`
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
-   [ruby](https://www.ruby-lang.org/en/) (2.7.0)
    -   depends on: `openssl (with libssl installed)`
    -   install script: [`./zzruby.sh`](zzruby.sh)
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
-   [denseflow](https://github.com/open-mmlab/denseflow) (extract frames, optical flow, resize, and more!)
    -   depends on: `boost`, `opencv`, `cmake`
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
-   [`.zshrc`](.zshrc) (zsh configuration)
-   [`.netrc`](.netrc) (lftp password-less configuration)
-   [`.ssh/config`](.ssh/config) (suppress git clone warnings)
-   [`.lftp/rc`](.lftp/rc) (suppress lftp ssl warning)

### misc

- [opengl on remote machine](https://www.scm.com/doc/Installation/Remote_GUI.html)
- useful Julia packages: ArgParse Glob Images FileIO StatsBase Shell UnicodePlots PyCall PyPlot Plots ImageFiltering ImageMagick Interpolations Revise OhMyREPL DataFrames ProgressMeter JLD2 Distances ImageTransformations JuMP HDF5 ImageInTerminal ImageView DataStructures JSON3 JuliaFormatter NNlib
- free JuMP solvers: Cbc Clp COSMO CSDP ECOS GLPK Juniper OSQP ProxSDP SCS SDPA
- good reference: http://www.linuxfromscratch.org/lfs/view/development/index.html and http://www.linuxfromscratch.org/blfs/view/svn/index.html and https://pkgs.org/
- [CUDA arch and CUDA gencode list](https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/)
- Instruction on how to load jpeg faster. https://github.com/innerlee/cvbenchmark#setup
- View image in terminal: [viu](https://github.com/atanunq/viu) and [tiv](https://github.com/stefanhaustein/TerminalImageViewer)
- image lossless optimization: jpegtran optipng
- image lossy optimization: pngquant
- ffmpeg tricks
  * silent: `ffmpeg -hide_banner -loglevel panic`
  * get resolution `ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 input.mp4`
  * count frames `ffmpeg -i input.mp4 -map 0:v:0 -c copy -f null - 2>&1 | grep frame`
  * remove duplicated frames `ffmpeg -i input.mp4 -vf mpdecimate -vsync vfr out.mp4`
- cool rust tools:
  * bottom https://github.com/ClementTsang/bottom
  * ripgrep https://github.com/BurntSushi/ripgrep
  * fd https://github.com/sharkdp/fd
  * dust https://github.com/bootandy/dust
  * zenith https://github.com/bvaisvil/zenith

### faq

- **Q**: My boost segfaluts :( <br/>
**A**: Make sure they the boost are comipiled and linked using the same gcc/g++ version

- **Q**: `Cert verify failed: BADCERT_NOT_TRUSTED` :( <br/>
**A**: Try `export SSL_CERT_DIR=/etc/ssl/certs`

- **Q**: `warning: templates not found in /workspace/destdir/share/git-core/templates` :( <br/>
**A**: Add the following to `$HOME/.gitconfig`
```
[init]
        templatedir = $HOME/app/share/git-core/templates
```

- **Q**: `fatal: unable to find remote helper for 'https'` :( <br/>
**A**: Add the following to `$HOME/.zshrc` (or `.bashrc` of course)
```
export GIT_EXEC_PATH=$ZZROOT/libexec/git-core
export GIT_SSL_CAINFO=/etc/ssl/certs/ca-bundle.crt
```

- **Q**: `Using the 'memory' GSettings backend.  Your settings will not be saved or shared with other applications.` :( <br/>
**A**: Add the following to `$HOME/.zshrc` (or `.bashrc` of course)
```
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/
```

- **Q**: `import pyvips` segfault :( <br/>
**A**: Make sure `gstreamer-orc <0.4.30`, `imagemagick <7.0.9`.
```
conda install -c conda-forge imagemagick=7.0.8
conda install -c conda-forge gstreamer-orc=0.4.29
```

- **Q**: GitError(Code:ECERTIFICATE, Class:SSL, the SSL certificate is invalid: 0x08 - The certificate is not correctly signed by the trusted CA) :( <br/>
**A**: Run the following
```julia
julia> import LibGit2
julia> LibGit2.set_ssl_cert_locations("/etc/ssl/certs/ca-certificates.crt")
```

- **Q**: dotnet error :( <br/>
**A**: Add the following to `$HOME/.zshrc` (or `.bashrc` of course)
```bash
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true
export MSBuildSDKsPath=$DOTNET_ROOT/sdk/3.1.102/Sdks
```

- **Q**: Install OpenCV: CUDA Version wrong:( <br/>
**A**: Add the path of the correct version CUDA to `zzopencv.sh` when runing cmake
```bash
cmake   ......
        -DCUDA_TOOLKIT_ROOT_DIR=/mnt/lustre/share/cuda-9.0/ \
        ......
```

- **Q**: Install Denseflow: OpenCV Version wrong, can't find customized path for opencv:( <br/>
**A**: Add the path of the correct version opencv and corresponding cuda version to `zzdenseflow.sh` when runing cmake
```bash
cmake -DCMAKE_INSTALL_PREFIX=$ROOTDIR \
      -DOpenCV_DIR=$ROOT_DIR/lib64/cmake/opencv4 \
      -gencode=arch=compute_61,code=sm_61 \
      -DCUDA_TOOLKIT_ROOT_DIR=/mnt/lustre/share/cuda-9.0/ ..
```

- **Q**: Unzip filenames looks messy when there are unicodes :( <br/>
**A**: Specify the encoding of filenames.
```bash
$ unzip -h
UnZip 6.00 of 20 April 2009, by Debian. Original by Info-ZIP.
  ...
  -O CHARSET  specify a character encoding for DOS, Windows and OS/2 archives
  -I CHARSET  specify a character encoding for UNIX and other archives
  ...

unzip -O GB18030 gb18030.zip -d target_dir
```

- **Q**: Get locale warnings :( <br/>
**A**: Run
```bash
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales
```

- **Q**: moov atom not found :( <br/>
**A**: Use https://github.com/anthwlock/untrunc to fix it.


- **Q**: you must add /ou=globalsign root ca ... :( <br/>
**A**: Set env var.
```bash
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
```

---

### jlinstall

`jlinstall` is another way to install softwares.
It uses pre-built binaries so that no compilation is needed.
The default install path of `jlinstall` is `JLROOT=$ZZROOT/jl`.

```
export ZZROOT=$HOME/app
export JLROOT=$ZZROOT/jl
export PATH=$ZZROOT/bin:$JLROOT/bin:$PATH
export LD_LIBRARY_PATH=$ZZROOT/lib:$ZZROOT/lib64:$JLROOT/lib:$JLROOT/lib64:$LD_LIBRARY_PATH
```
