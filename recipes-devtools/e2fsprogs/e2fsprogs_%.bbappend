FILESEXTRAPATHS_prepend_toradex-bsp := "${THISDIR}/e2fsprogs:"
SRC_URI_append_toradex-bsp = " file://e2fsck.conf "

do_install_append_toradex-bsp() {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/e2fsck.conf ${D}${sysconfdir}/e2fsck.conf
}

FILES_e2fsprogs-e2fsck_append_toradex-bsp = " ${sysconfdir}/e2fsck.conf "
