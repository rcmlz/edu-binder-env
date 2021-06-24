#!/bin/bash
# https://github.com/abingham/jupyter-elm-kernel
python -m elm_kernel.install

mv $HOME/ressources/elm/logo-* $HOME/.local/share/jupyter/kernels/elm/
mv $HOME/ressources/elm/logo-* /srv/conda/envs/notebook/share/jupyter/kernels/elm/
