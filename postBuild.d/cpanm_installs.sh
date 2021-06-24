#!/bin/bash
PERL_PATH=$HOME/.perl5
export PERL_DATA_TESTIMAGE_INSTALL="USC::SIPI=miscellaneous,sequences"
cd $HOME
cpanm --local-lib=$PERL_PATH --installdeps .
cpanm --local-lib=$PERL_PATH Math::Units Math::Calc::Units Data::TestImage PDL DDP Path::Class PDL::Graphics::Gnuplot Math::Trig PDL::Constants feature JSON::MaybeXS MIME::Base64
