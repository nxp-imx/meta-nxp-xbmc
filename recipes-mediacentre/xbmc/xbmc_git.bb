require xbmc.inc

SRC_URI = "git://github.com/xbmc/xbmc.git;branch=master"
SRCREV = "654f233fdeae3402749578b1d1b7d8f1b82a37a8"

IMX_PATCHES = ""
IMX_PATCHES_mx6 = " \
              file://0001-imx6-Don-t-set-FB_MULTI_BUFFER-GPU-driver-will-handl.patch \
              file://0002-Upgrade-to-git-version.patch \
              file://0003-RendererIMX-Add-GPU-3D-render-support.patch \
              file://0004-application-Don-t-release-texture-when-video-playbac.patch \
"
SRC_URI += " ${IMX_PATCHES} "

PR = "${INC_PR}.0"

