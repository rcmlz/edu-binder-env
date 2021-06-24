#!/bin/bash
# instruction taken from see https://rakudo.org/star/source
INSTALL_DIR=$HOME/.rakudo-star

PATH=$INSTALL_DIR/bin/:$INSTALL_DIR/share/perl6/site/bin:$INSTALL_DIR/share/perl6/vendor/bin:$INSTALL_DIR/share/perl6/core/bin:$PATH

# ensure jupyter-kernel.raku is in path at startup of jupyter
echo "export PATH=$INSTALL_DIR/bin/:$INSTALL_DIR/share/perl6/site/bin:$INSTALL_DIR/share/perl6/vendor/bin:$INSTALL_DIR/share/perl6/core/bin:\$PATH" >> ~/start

mkdir $INSTALL_DIR && cd $INSTALL_DIR
curl -LJO https://rakudo.org/latest/star/src
tar -xzf rakudo-star-*.tar.gz
mv rakudo-star-*/* .
rm -fr rakudo-star-*

./bin/rstar install

# instruction taken from https://github.com/bduggan/p6-jupyter-kernel
zef install Jupyter::Kernel
jupyter-kernel.raku --generate-config --location=/srv/conda/envs/notebook/share/jupyter/kernels/raku

# some modules
zef install Physics::Measure Physics::Unit Physics::Constants SVG::Plot::Pie Metropolis Telemetry Log::Async Test::Fuzz

# color logo
mv $HOME/ressources/raku/logo-* /srv/conda/envs/notebook/share/jupyter/kernels/raku/

# clean up
rm -rf $HOME/.raku
rm -rf $INSTALL_DIR/tmp
rm -rf $HOME/.zef
