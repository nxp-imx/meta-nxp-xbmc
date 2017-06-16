# Copyright (C) 2016 Freescale Semiconductor
# Copyright 2017 NXP
# Released under the MIT license (see COPYING.MIT for the terms)
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Add patch for i.MX6 XBMC specific only
SRC_URI_append_mx6 = " file://0001-DCIC-Add-get-vsync-support-for-XBMC.patch"
