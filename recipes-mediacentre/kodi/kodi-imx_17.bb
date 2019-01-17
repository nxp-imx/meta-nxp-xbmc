require kodi.inc

SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton"
SRCREV = "6abeebd5ba371547c8f04272296433f5e4e28e86"

IMX_PATCHES = " \
              file://0001-imx6-Don-t-set-FB_MULTI_BUFFER-GPU-driver-will-handl.patch \
              file://0005-Reslove-compile-fail.patch \
              file://0008-AE-missing-declaration-for-function-avcodec_fill_aud.patch \
              file://0009-FTPParse.cpp-using-namespace-std-for-string-declarat.patch \
"
SRC_URI += " ${IMX_PATCHES} "

PR = "${INC_PR}.0"

