# Copyright (C) 2015 Freescale Semiconductor

# Add the path for the addtional patch
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://fix_ffmpeg_SDL_configure_issue.patch \
"

# Overwrite RRECOMMENDS: XBMC plugins requires python modules and dynamically loaded libraries
RRECOMMENDS_${PN} = " python-stringold \
                      python-mime \
                      python-logging \
                      python-crypt \
                      python-netclient \
                      python-threading \
                      python-elementtree \
                      python-xml \
                      python-dbus \
                      python-html \
                      python-netserver \
                      python-zlib \
                      python-sqlite3 \
                      python-pydoc \
                      python-textutils \
                      python-shell \
                      python-image \
                      python-robotparser \
                      python-compression \ 
                      python-audio \
                      python-email \
                      python-numbers \
                      python-json \
                      python-subprocess \
                      python-xmlrpc \
                      python-misc \
                      eglibc-gconv-cp1252 \
                      libcurl \
                      libnfs \
                      rtmpdump \
                      libbluray \ 
                      libmad \
                      libass \
                      mpeg2dec \
                      libcec \
                      kernel \
                      eglibc-gconv-ibm850 \
                      eglibc-gconv-utf-32 \
                      lirc \
                      jasper \
                      libcec \
                      udev \
                      alsa-lib \
                      alsa-dev \
                      tzdata \
                      xbmc-pvr-addons \
		      shairplay \
                      libvorbis \
                      flac \
                    "

