# Add needed Freescale packages and definitions

SOC_TOOLS_TESTAPPS_mx6 += " ${@base_contains('DISTRO_FEATURES', 'x11', \
                            'xbmc xbmc-nm-addon networkmanager xbmc-image-custom-rfs', \
                            'xbmc', d)} "
