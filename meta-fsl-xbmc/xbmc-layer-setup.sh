#!/bin/sh
# The script will fetch the Yocto XBMC layer and add the layer into the image build

# Get the Yocto layer meta-stef
CWD=`pwd`
echo "$CWD"

cd ..
if [ -e sources ]; then
   #git clone the layer
   echo "OK"
   cd sources
   if [ ! -e meta-stef ]; then
      git clone git://github.com/wolfgar/meta-stef.git -b daisy
      echo "clone done"
   fi
else
   echo "Cannot find the folder sources"
fi
cd $CWD

# Hook the layer into the bblayers.conf
echo "Start to enable the XBMC layer "
echo "# For XBMC" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-stef \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-fsl-mpu-internal/meta-fsl-xbmc \"" >> conf/bblayers.conf
echo >> conf/bblayers.conf

echo "XBMC layer is enabled. Check details in conf/bblayers.conf "

echo "Done"
