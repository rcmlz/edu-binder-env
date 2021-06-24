#!/bin/bash
# https://github.com/SpencerPark/IJava/releases/latest
ITMP_DIR=$HOME/Ijava
mkdir $ITMP_DIR
cd $ITMP_DIR
curl -Lo IJava.zip https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip
unzip IJava.zip
python3 install.py --sys-prefix
cd $HOME
rm -rf $ITMP_DIR

mv $HOME/ressources/java/logo-* /srv/conda/envs/notebook/share/jupyter/kernels/java/
