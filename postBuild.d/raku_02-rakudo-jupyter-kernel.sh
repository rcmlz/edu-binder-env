#!/bin/bash
source $HOME/start

# instruction taken from https://github.com/bduggan/p6-jupyter-kernel
zef install Jupyter::Kernel
jupyter-kernel.raku --generate-config --location=/srv/conda/envs/notebook/share/jupyter/kernels/raku
