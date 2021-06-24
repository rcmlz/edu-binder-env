#!/bin/bash
cd $HOME
install_c_kernel
install_c_kernel --user
cp $HOME/ressources/c/logo-* $HOME/.local/share/jupyter/kernels/c/
mv $HOME/ressources/c/logo-* /srv/conda/envs/notebook/share/jupyter/kernels/c/
