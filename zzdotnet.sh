#!/bin/bash
# install dotnet
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="dotnet"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://dotnetcli.azureedge.net/dotnet/Sdk/3.1.102/dotnet-sdk-3.1.102-linux-x64.tar.gz"
echo $NAME will be installed in "$ROOTDIR"

mkdir -p "$ROOTDIR/downloads"
cd "$ROOTDIR"

if [ -f "downloads/$FILE" ]; then
    echo "downloads/$FILE exist"
else
    echo "$FILE does not exist, downloading from $DOWNLOADURL"
    wget $DOWNLOADURL -O $FILE
    mv $FILE downloads/
fi

tar zxf downloads/$FILE -C $ROOTDIR/dotnet

echo $NAME installed on "$ROOTDIR", put the following lines into .zshrc or .bashrc
echo "export DOTNET_ROOT=$ROOTDIR/dotnet"
echo "export PATH=\$PATH:$ROOTDIR/dotnet"
echo "export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true"
echo "export MSBuildSDKsPath=$ROOTDIR/dotnet/sdk/3.1.102/Sdks"
