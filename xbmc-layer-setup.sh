#!/bin/sh
# The script will hook the Yocto XBMC layer into the image build

# Hook the layer into the bblayers.conf
echo "Start to enable the XBMC layer "
echo "# For XBMC" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-nxp-xbmc \"" >> conf/bblayers.conf
echo >> conf/bblayers.conf

echo "XBMC layer is enabled. Check details in conf/bblayers.conf "

echo "Done"
