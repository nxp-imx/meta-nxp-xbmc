require xbmc.inc

SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton"
SRCREV = "6abeebd5ba371547c8f04272296433f5e4e28e86"

IMX_PATCHES = " \
              file://0001-imx6-Don-t-set-FB_MULTI_BUFFER-GPU-driver-will-handl.patch \
              file://0005-Reslove-compile-fail.patch \
"
SRC_URI += " ${IMX_PATCHES} "

PR = "${INC_PR}.0"

