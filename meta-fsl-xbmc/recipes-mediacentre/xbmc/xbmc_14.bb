require xbmc.inc

SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Helix"
SRCREV = "7cc53a9a3da77869d1d5d3d3d9971b4bd1641b50"

IMX_PATCHES = ""
IMX_PATCHES_mx6 = " \
              file://0001-imx6-Don-t-set-FB_MULTI_BUFFER-GPU-driver-will-handl.patch \
"
SRC_URI += " ${IMX_PATCHES} "

PR = "${INC_PR}.2"

