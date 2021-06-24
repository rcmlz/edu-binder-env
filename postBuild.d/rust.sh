#!/bin/bash
source $HOME/start

#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl https://sh.rustup.rs -sSf | sh -s -- -y

echo "export PATH=$HOME/.cargo/bin:\$PATH" >> ~/start
echo "source $HOME/.cargo/env" >> ~/start

source $HOME/start
source $HOME/.cargo/env

cargo install evcxr_jupyter --no-default-features
evcxr_jupyter --install
cp -r .local/share/jupyter/kernels/rust /srv/conda/envs/notebook/share/jupyter/kernels/
