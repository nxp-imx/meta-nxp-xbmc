#!/bin/sh
# The script will hook the i.MX XBMC layer into the image build

# Statements
echo -e "\n=============================================================================="
echo " This is a demostration setup for XBMC on i.MX6 which has a GPU hardware."
echo " The Demo shows XBMC user interface with Frame Buffer graphical backend."
echo " This setup integrates the COMMERCAIL_WHITE_LIST for ffmpeg/libmad/mpeg2dec,"
echo " the build is limited for evaluation only and has No Support."
echo -e "===============================================================================\n "

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
