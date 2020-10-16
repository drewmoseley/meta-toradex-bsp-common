FILESEXTRAPATHS_prepend_toradex := "${THISDIR}/e2fsprogs:"
SRC_URI_append_toradex = " file://e2fsck.conf "

do_install_append_toradex() {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/e2fsck.conf ${D}${sysconfdir}/e2fsck.conf
}

FILES_e2fsprogs-e2fsck_append_toradex = " ${sysconfdir}/e2fsck.conf "
