# Copyright (C) 2016 Freescale Semiconductor
# Copyright 2017 NXP
# Copyright 2018 NXP
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "Package group to add the packages providing KODI support."
SUMMARY = "Package group - kodi"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

KODI_APPS = " \
    kodi-imx \
    xbmc-nm-addon \
"

KODI_MISC = " \
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

SOC_KODI_MISC = ""

RDEPENDS_${PN} = " \
    ${KODI_APPS} \
    ${KODI_MISC} \
    ${SOC_KODI_MISC} \
"
