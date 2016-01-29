include recipes-core/images/core-image-base.bb

IMAGE_FEATURES += "debug-tweaks"

# SOC_EXTRA_IMAGE_FEATURES ?= "tools-testapps"
SOC_EXTRA_IMAGE_FEATURES=""

# Add extra image features
EXTRA_IMAGE_FEATURES += " \
    ${SOC_EXTRA_IMAGE_FEATURES} \
    nfs-server \
"

IMAGE_INSTALL += " \
    dropbear \
    xbmc \
    xbmc-nm-addon \
    procps \
    util-linux-mount \
    libntfs-3g \
    ntfsprogs \
    ntfs-3g \
    ntp \
    ntp-utils \
    util-linux \
    firmware-imx-vpu-imx6d \
    fsl-rc-local \
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

export IMAGE_BASENAME = "xbmc-image"

