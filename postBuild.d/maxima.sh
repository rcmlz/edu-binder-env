#!/bin/bash

# taken from https://github.com/robert-dodier/maxima-jupyter/blob/master/Dockerfile

PREFIX=$HOME/.local
MAXIMA_PREFIX=$HOME/.maxima
PATH=$MAXIMA_PREFIX/bin:$PATH
MAXIMA_VERSION=5.45.1

# Prepare
mkdir -p $PREFIX $MAXIMA_PREFIX &&
#open file limit
ulimit -s 16384 &&

# Install Maxima
curl -L https://sourceforge.net/projects/maxima/files/Maxima-source/$MAXIMA_VERSION-source/maxima-$MAXIMA_VERSION.tar.gz \
    | tar -C /tmp -xzf - &&
cd /tmp/maxima-$MAXIMA_VERSION &&
CFLAGS="-Os" ./configure --prefix=$MAXIMA_PREFIX --enable-sbcl &&
make &&
make install

PATH=$MAXIMA_PREFIX/bin:$PATH
echo "export PATH=$MAXIMA_PREFIX/bin:\$PATH" >> ~/start
echo "export PATH=$PREFIX/bin:\$PATH" >> ~/start

# Install Quicklisp
cd $HOME
curl -kLO https://beta.quicklisp.org/quicklisp.lisp; \
sbcl --non-interactive --load quicklisp.lisp \
     --eval "(quicklisp-quickstart:install)" \
     --eval "(ql-util:without-prompting (ql:add-to-init-file))"

# Install Maxima-Jupyter Kernel
cd $MAXIMA_PREFIX
git clone https://github.com/robert-dodier/maxima-jupyter
cd maxima-jupyter && maxima --batch-string="load(\"load-maxima-jupyter.lisp\");jupyter_install();"

#mkdir -p /srv/conda/envs/notebook/share/jupyter/kernels/
cp -r $HOME/.local/share/jupyter/kernels/maxima /srv/conda/envs/notebook/share/jupyter/kernels/
