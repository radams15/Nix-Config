#!$SHELL

source $stdenv/setup

# curl https://downloads.sourceforge.net/project/xtrkcad-fork/XTrackCad/Version%205.3.1/xtrkcad-setup-5.3.1GA-1.x86_64.sh?ts=gAAAAABpOIABCfkytFfAvBdSQ1REP-Fap_LG9tdL9v32G22XgBWo-_mdXnghqvlnoeXw74WPI79pLUGEDKsXhPvEog1n0lc2Zg%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fxtrkcad-fork%2Ffiles%2FXTrackCad%2FVersion%25205.3.1%2Fxtrkcad-setup-5.3.1GA-1.x86_64.sh%2Fdownload -O setup.sh

chmod +x setup.sh

mkdir -p $out

./setup.sh --skip-license --prefix=$out
