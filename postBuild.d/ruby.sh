#!/bin/bash
export GEM_HOME=$HOME/.ruby

gem install ffi-rzmq
gem install iruby --pre

PATH=$GEM_HOME/bin:$PATH
iruby register

#mkdir -p $HOME/.local/bin
#ln -s /usr/bin/libtoolize $HOME/.local/bin/libtool # See https://github.com/zeromq/libzmq/issues/1385
#gem install rbczmq
#gem install sciruby-full

echo "export PATH=$GEM_HOME/bin:\$PATH" >> ~/start
echo "export GEM_HOME=\$HOME/.ruby" >> ~/start
