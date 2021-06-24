#!/bin/bash

# https://gap-packages.github.io/

GAP_VERSION=4.11.1
Jupyter_Kernel_VERSION=1.3
GAP_HOME=$HOME/.gap
GAP_PKG=$GAP_HOME/pkg

PATH=$GAP_HOME/bin:$PATH

echo "export PATH=$GAP_HOME/bin:$GAP_PKG/JupyterKernel-$Jupyter_Kernel_VERSION/bin:\$PATH" >> $HOME/start
echo "export GAP_HOME=$GAP_HOME" >> $HOME/start

#SetInfoLevel(InfoPackageLoading,4);LoadPackage("JupyterKernel");

cd /tmp
wget --quiet https://github.com/gap-system/gap/releases/download/v$GAP_VERSION/gap-$GAP_VERSION.tar.gz \
&& tar xfz gap-$GAP_VERSION.tar.gz \
&& mv gap-$GAP_VERSION $GAP_HOME \
&& cd $GAP_HOME \
&& ./configure; make \
&& bin/BuildPackages.sh --with-gaproot=$GAP_HOME

ln -s $GAP_HOME/bin/gap.sh $GAP_HOME/bin/gap

gap --nointeract -c 'LoadPackage("PackageManager");InstallPackage("io",false);InstallPackage("json",false);InstallPackage("zeromqinterface",false);InstallPackage("crypting",false);'

cd $GAP_PKG/JupyterKernel-$Jupyter_Kernel_VERSION \
&& python setup.py install --user

# TO DO: Francy

# cd $GAP_PKG
# git clone https://github.com/mcmartins/subgroup-lattice \
# && git clone https://github.com/gap-packages/francy \
# && git clone https://github.com/gap-packages/FrancyMonoids
#
# cd $GAP_PKG/francy/js && npm install --unsafe-perm && npm run bootstrap && npm run build:jupyter \
#   && cd $GAP_PKG/francy/js/packages/francy-extension-jupyter && pip3 install -e . \
#   && jupyter nbextension install --symlink --py --sys-prefix jupyter_francy \
#   && jupyter nbextension enable --py --sys-prefix jupyter_francy \
#   && cd $GAP_PKG/francy/js/packages/francy-extension-jupyter/jupyter_francy/labextension && jupyter labextension install
