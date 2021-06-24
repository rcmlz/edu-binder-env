#!/bin/bash
export PERL_PATH=$HOME/.perl5
export PATH="$PERL_PATH/bin:$PATH"
export PERL5LIB=$PERL_PATH/lib/perl5

echo "export PERL_PATH=$PERL_PATH" >> $HOME/start
echo "export PATH=$PERL_PATH/bin:\$PATH" >> $HOME/start
echo "export PERL5LIB=$PERL5LIB" >> $HOME/start

cd $HOME
cpanm --notest --local-lib=$PERL_PATH --installdeps .

# moved to cpanfile
cpanm --local-lib=$PERL_PATH Devel::IPerl

# make sure that kernel.json is created
iperl --help
