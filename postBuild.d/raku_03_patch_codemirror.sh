#!/bin/bash
source $HOME/start

HIGHLIGHTING=ressources/codemirror/raku.js

CM_RAKU="/srv/conda/envs/notebook/lib/$PYTHON_VERSION/site-packages/notebook/static/components/codemirror/mode/raku"
mkdir $CM_RAKU

cp $HIGHLIGHTING $CM_RAKU/raku.js

patch /srv/conda/envs/*/lib/python*/site-packages/notebook/static/components/codemirror/mode/meta.js $HOME/ressources/codemirror/codemirror_mode_meta_raku.patch
