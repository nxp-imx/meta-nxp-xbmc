#!/bin/sh
#
# NXP Build Enviroment Setup Script
#
# Copyright (C) 2015-2016 Freescale Semiconductor
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

echo -e "\n----------------\n"
kodi_exit_message()
{
   echo "Kodi setup complete"
}

kodi_usage()
{
    echo -e "\nDescription: nxp-setup-kodi.sh will setup the bblayers and local.conf for an Kodi (formerly XBMC) build."
    echo -e "\nUsage: source nxp-setup-kodi.sh
    Optional parameters: [-b build-dir] [-h]"
    echo "
    * [-b build-dir]: Build directory, if unspecified, script uses 'bld-kodi' as the output directory
    * [-h]: help
"
}

kodi_cleanup()
{
    echo "Cleaning up variables"
    unset BUILD_DIR OPTIND Kodi_DISTRO
    unset nxp_setup_help nxp_setup_error nxp_setup_flag
    unset kodi_usage kodi_cleanup kodi_exit_message
}

echo Reading command line parameters
# Read command line parameters
while getopts "k:r:t:b:e:g:h" nxp_setup_flag
do
    case $nxp_setup_flag in
        b) BUILD_DIR="$OPTARG";
           echo -e "\n Build directory is $BUILD_DIR" ;
           ;;
        h) nxp_setup_help='true';
           ;;
        ?) nxp_setup_error='true';
           ;;
    esac
done

RELEASEPROGNAME="./fsl-setup-release.sh"

# get command line options
OLD_OPTIND=$OPTIND


if [ -z "$BUILD_DIR" ]; then
    BUILD_DIR=bld-kodi
fi

# XBMC only supports FB back-end
unset Kodi_DISTRO
Kodi_DISTRO="nxp-imx-kodi-fb"

echo EULA=1 DISTRO=$Kodi_DISTRO source $RELEASEPROGNAME -b $BUILD_DIR
EULA=1 DISTRO=$Kodi_DISTRO source $RELEASEPROGNAME -b $BUILD_DIR

# Statements
echo -e "\n=============================================================================="
echo " This is a demostration setup for Kodi (formerly XBMC) on i.MX6 which has a GPU hardware."
echo " The Demo shows XBMC user interface with Frame Buffer graphical backend."
echo " This setup integrates the COMMERCAIL_WHITE_LIST for ffmpeg/libmad/mpeg2dec,"
echo " the build is limited for evaluation only and has No Support."
echo -e "===============================================================================\n "

# Hook the layer into the bblayers.conf
echo "Start to enable the Kodi (formerly XBMC) layer "
echo "# For XBMC" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-nxp-xbmc \"" >> conf/bblayers.conf
echo >> conf/bblayers.conf

# Add the license permission into local.conf
echo "Start to add license permission"
echo "# for XBMC" >> conf/local.conf
echo "LICENSE_FLAGS_WHITELIST += \" commercial_mpeg2dec \"" >> conf/local.conf
echo "LICENSE_FLAGS_WHITELIST += \" commercial_libmad \"" >> conf/local.conf
echo "LICENSE_FLAGS_WHITELIST += \" commercial_ffmpeg \"" >> conf/local.conf
echo "LICENSE_FLAGS_WHITELIST += \" commercial_x264 \"" >> conf/local.conf
echo >> conf/local.conf

echo "XBMC layer is enabled. Check details in conf/bblayers.conf and conf/local.conf"

echo done except for cleanup

kodi_exit_message
kodi_cleanup
