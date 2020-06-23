SRC_URI_append_toradex-bsp = " file://g1.schema.in "

MACHINE_NAME ?= "${MACHINE}"
do_compile_append_toradex-bsp () {
    sed -e "s:@@PRODUCT_NAME@@:${MACHINE_NAME}:" ${WORKDIR}/g1.schema.in > ${WORKDIR}/g1.schema
}

do_install_append_toradex-bsp () {
    install -d ${D}${sysconfdir}/usbg/
    install -m 0644 ${WORKDIR}/g1.schema ${D}${sysconfdir}/usbg/g1.schema
}

PACKAGES_append_toradex-bsp = " ${PN}-examples "

FILES_${PN}-examples = " \
    ${bindir}/gadget-* \
    ${bindir}/show-gadgets \
    ${bindir}/show-udcs \
    ${sysconfdir}/usbg/g1.schema \
"
