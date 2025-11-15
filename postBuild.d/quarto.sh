#!/bin/bash

QUARTO_VERSION=1.8.26
cd /tmp
curl https://github.com/quarto-dev/quarto-cli/releases/download/v$QUARTO_VERSION/quarto-$QUARTO_VERSION-linux-amd64.deb
sudo dpkg -i quarto-$QUARTO_VERSION-linux-amd64.deb
quarto version
