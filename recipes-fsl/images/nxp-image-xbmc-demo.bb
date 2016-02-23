include recipes-core/images/core-image-base.bb

IMAGE_FEATURES += "debug-tweaks"

SOC_EXTRA_IMAGE_FEATURES=""

# Add extra image features
EXTRA_IMAGE_FEATURES += " \
    ${SOC_EXTRA_IMAGE_FEATURES} \
    nfs-server \
"

IMAGE_INSTALL += " \
    fsl-rc-local \
    packagegroup-nxp-xbmc \
"

export IMAGE_BASENAME = "nxp-image-xbmc-demo"

