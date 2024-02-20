if [ -e "$NIX_ATTRS_SH_FILE" ]; then . "$NIX_ATTRS_SH_FILE"; elif [ -f .attrs.sh ]; then . .attrs.sh; fi
source $stdenv/setup

tar xf $src

tarballdir=$(pwd)

echo "Deploying binaries.."
mkdir $out
mv bin lib $out
