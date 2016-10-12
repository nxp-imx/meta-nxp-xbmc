require xbmc.inc

SRC_URI = "git://github.com/xbmc/xbmc.git;branch=master"
SRCREV = "5c75efa812bfdd6aa530c1bfbcfbc21eb7835658"

IMX_PATCHES = " \
              file://0001-imx6-Don-t-set-FB_MULTI_BUFFER-GPU-driver-will-handl.patch \
              file://0005-Reslove-compile-fail.patch \
              file://0006-Enable-Kodi-on-MX8DV.patch \
"
SRC_URI += " ${IMX_PATCHES} "

PR = "${INC_PR}.0"

