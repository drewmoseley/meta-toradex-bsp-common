LICENSE_${PN}-rtl8188eu = "Firmware-rtlwifi_firmware"
LICENSE_${PN}-sd8997 = "Firmware-Marvell"

FILESEXTRAPATHS_append_toradex := "${THISDIR}/files:"

SRC_URI_append_toradex = "\
		file://sd8997_uapsta.bin \
		"

PACKAGES_prepend_toradex = "\
                     ${PN}-rtl8188eu \
                     ${PN}-sd8997 \
                   "
do_install_append_toradex() {
    cp ${WORKDIR}/sd8997_uapsta.bin ${D}${nonarch_base_libdir}/firmware/mrvl/
}

FILES_${PN}-rtl8188eu_toradex = " \
  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8188eufw.bin \
"
FILES_${PN}-sd8997_toradex = " \
  ${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin \
"
RDEPENDS_${PN}-rtl8188eu_append_toradex = " ${PN}-rtl-license "
RDEPENDS_${PN}-sd8997_append_toradex = " ${PN}-marvell-license "
