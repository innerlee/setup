ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://julialang-s3.julialang.org/bin/linux/x64/1.2/julia-1.2.0-linux-x86_64.tar.gz -O julia.tar.gz

mkdir julia
tar xf julia.tar.gz -C julia --strip-components 1

cd julia
echo $(pwd)
