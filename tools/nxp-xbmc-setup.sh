#!/bin/sh
# The script will hook the Yocto XBMC layer into the image build

# Hook the layer into the bblayers.conf
echo "Start to enable the XBMC layer "
echo "# For XBMC" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-nxp-xbmc \"" >> conf/bblayers.conf
echo >> conf/bblayers.conf

# Add the license permission into local.conf
echo "Start to add license permission"
echo "# for XBMC" >> conf/local.conf
echo "LICENSE_FLAGS_WHITELIST += \" commercial_mpeg2dec \"" >> conf/local.conf
echo "LICENSE_FLAGS_WHITELIST += \" commercial_libmad \"" >> conf/local.conf
echo >> conf/local.conf

echo "XBMC layer is enabled. Check details in conf/bblayers.conf and conf/local.conf"

echo "Done"
