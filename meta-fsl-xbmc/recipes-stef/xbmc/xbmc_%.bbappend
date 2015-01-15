# Copyright (C) 2015 Freescale Semiconductor

# Add the path for the addtional patch
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://fix_ffmpeg_SDL_configure_issue.patch \
"
