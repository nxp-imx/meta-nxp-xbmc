# Copyright (C) 2016 Freescale Semiconductor
# Copyright 2017 NXP
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "Package group to add the packages providing XBMC support."
SUMMARY = "Package group - xbmc"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

XBMC_APPS = " \
    xbmc \
    xbmc-nm-addon \
"

XBMC_MISC = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'networkmanager', '', d)} \
    dropbear \
    procps \
    util-linux \
    util-linux-mount \
    libntfs-3g \
    ntfsprogs \
    ntfs-3g \
    ntp \
    ntp-utils \
    joe \
    nano \
    rsync \
    ethtool \
    samba \
    oscam \
    pulseaudio \
    pulseaudio-server \
    pulseaudio-module-cli \
    pulseaudio-misc \
    pulseaudio-module-device-manager \
"

SOC_XBMC_MISC = ""

RDEPENDS_${PN} = " \
    ${XBMC_APPS} \
    ${XBMC_MISC} \
    ${SOC_XBMC_MISC} \
"
