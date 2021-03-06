SUMMARY = "Backported kernel drivers"
HOMEPAGE = "https://backports.wiki.kernel.org"
SECTION = "kernel/modules"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
INC_PR = "r1"

SRCREV = "ad615b7c1f2bfdb766f225805569f0a1495edc69"
SRC_URI = " \
    git://git.toradex.com/backports-toradex.git;protocol=git;branch=toradex-${PV} \
    file://makefile.patch \
    file://config \
    "

S = "${WORKDIR}/git"

inherit module

MAKE_TARGETS = "modules"
MODULES_INSTALL_TARGET = "modules_install"

KERNEL_MODULE_PACKAGE_PREFIX = "${BPN}-"

EXTRA_OEMAKE = " KLIB=${STAGING_KERNEL_DIR} KLIB_BUILD=${STAGING_KERNEL_BUILDDIR} "

do_configure() {

    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
    make CC="${BUILD_CC}" LD="${BUILD_LD}" AR="${BUILD_AR}" \
         -C ${S}/kconf  O=${S}/kconf conf

    cp ${WORKDIR}/config ${S}/.config
    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
    oe_runmake oldconfig
}

