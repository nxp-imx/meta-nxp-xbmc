DESCRIPTION = "software media player and entertainment hub"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://copying.txt;md5=8c8473d035f42f5883d82c5f6828eba7"
DEPENDS = "ffmpeg mysql5 libsamplerate0 udev pulseaudio libvorbis boost libass libmodplug tiff yajl libtinyxml taglib libcdio jasper libmicrohttpd libssh samba rtmpdump samba swig-native libxslt libplist flac lzo lsb shairplay libdvdcss libdvdread libdvdnav"
DEPENDS_append_mx6 = " virtual/kernel libcec"

PACKAGECONFIG ?= "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial_libmad", "libmad", "", d)} \
                  ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial_mpeg2dec", "mpeg2dec", "", d)}"
PACKAGECONFIG_append_mx6 = " mx6"
PACKAGECONFIG_append_mx8 = " mx8"

PACKAGECONFIG[libmad] = ",,libmad,libmad"
PACKAGECONFIG[mpeg2dec] = ",,mpeg2dec,mpeg2dec"
PACKAGECONFIG[mx6] = "--enable-codec=imxvpu,, virtual/libgles2 virtual/egl virtual/libg2d imx-vpuwrap,"
PACKAGECONFIG[mx8] = "--enable-codec=imx8vpu,, virtual/libgles2 virtual/egl virtual/libg2d,"


INC_PR = "r1"

SRC_URI = "git://github.com/xbmc/xbmc.git"

S = "${WORKDIR}/git"

inherit autotools lib_package pkgconfig gettext python-dir

EXTRA_OECONF="ac_cv_path_JAVA_EXE=/usr/bin/java \
--prefix=/imx6/kodi --disable-x11 --disable-sdl --disable-xrandr --disable-gl --disable-vdpau --disable-vaapi --disable-openmax --enable-neon --enable-gles --enable-udev --disable-debug --disable-texturepacker --enable-airplay --enable-airtunes --with-ffmpeg=shared"

CPPFLAGS += " -I${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include "
CXXFLAGS += " -I${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include "
CFLAGS += " -I${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include "
do_configure() {
  export PYTHON_EXTRA_LDFLAGS=""
  export PYTHON_EXTRA_LIBS="-lz"
  export PYTHON_VERSION="${PYTHON_BASEVERSION}"
  export PYTHON_NOVERSIONCHECK="no-check"
  export PYTHON_CPPFLAGS="-I/${STAGING_INCDIR}/${PYTHON_DIR}"
  export PYTHON_LDFLAGS="-L${STAGING_LIBDIR} -lpython${PYTHON_BASEVERSION}"

  #We will use the host java during build because there is no native recipe for full openjdk and jamvm is not able to build xbmc
  export JAVA="/usr/bin/java"

  cd ../git
  CXX=g++ sh bootstrap
  make -C tools/depends/target/crossguid PREFIX=${STAGING_DIR_TARGET}/usr
  # oe_runconf
  # Call manually configure instead of oe_runconf because of specific prefix /imx6/xbmc...
  ${S}/configure  --build=${BUILD_SYS} \
                  --host=${HOST_SYS} \
                  --target=${TARGET_SYS} \
                  ${@append_libtool_sysroot(d)} \
                  ${EXTRA_OECONF}
}

do_compile() {
  cd ../git
  oe_runmake
}
do_install() {
  cd ../git
  autotools_do_install
}

# XBMC plugins requires python modules and dynamically loaded libraries
RRECOMMENDS_${PN} = " python-stringold \
                      python-mime \
                      python-logging \
                      python-crypt \
                      python-netclient \
                      python-threading \
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
                      glibc-gconv-cp1252 \
                      libcurl \
                      rtmpdump \
                      libass \
                      libcec \
                      kernel \
                      glibc-gconv-ibm850 \
                      glibc-gconv-utf-32 \
                      lirc \
                      jasper \
                      libcec \
                      udev \
                      pulseaudio \
                      shairplay \
                      libdvdcss \
                      libdvdread \
                      libdvdnav \
                      tzdata \
                      libvorbis \
                      flac \
                      lzo \
                      lsb \
                    "

FILES_${PN} += "/imx6 /usr/share/icons/hicolor"
FILES_${PN}-dbg += " \
                    /imx6/kodi/lib/kodi/*/*/*/.debug/ \
                    /imx6/kodi/lib/kodi/*/.debug/ \
                    /imx6/kodi/lib/kodi/*/*/.debug/ \
                    /imx6/kodi/lib/kodi/.debug/ \
                   "

