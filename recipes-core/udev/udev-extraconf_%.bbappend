FILESEXTRAPATHS_prepend_toradex-bsp := "${THISDIR}/files/:"

SRC_URI_append_toradex-bsp = " file://hotplug.rules \
                   file://hotplug.sh \
"

do_install_append_toradex-bsp() {
    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/hotplug.rules    ${D}${sysconfdir}/udev/rules.d/hotplug.rules

    install -d ${D}${sysconfdir}/udev/scripts/
    install -m 0755 ${WORKDIR}/hotplug.sh ${D}${sysconfdir}/udev/scripts/hotplug.sh
}
