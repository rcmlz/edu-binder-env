#!/bin/bash
source $HOME/start
python -m kernels.intel.install

cp $HOME/ressources/assembler/logo-* $HOME/.local/share/jupyter/kernels/intel/
cp -r $HOME/.local/share/jupyter/kernels/intel /srv/conda/envs/notebook/share/jupyter/kernels/
mv $HOME/ressources/assembler/logo-* /srv/conda/envs/notebook/share/jupyter/kernels/intel/
