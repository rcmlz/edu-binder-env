#!/bin/bash
PERL_PATH=$HOME/.perl5
echo "export PERL_PATH=$PERL_PATH" >> $HOME/start
echo "export PATH=$PERL_PATH/bin:\$PATH" >> $HOME/start

PERL5LIB=$PERL_PATH:$PERL_PATH/lib/perl5
echo "export PERL5LIB=$PERL5LIB:\$PERL5LIB" >> $HOME/start

source $HOME/start

PATH="$PERL_PATH/bin:$PATH"

#cpanm --sudo --local-lib=$PERL_PATH local::lib && eval $(perl -I$PERL5LIB -Mlocal::lib)
cpanm --local-lib=$PERL_PATH Devel::IPerl

# make sure that kernel.json is created
iperl --help
