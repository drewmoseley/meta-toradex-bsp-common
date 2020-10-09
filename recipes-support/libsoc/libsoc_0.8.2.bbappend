FILESEXTRAPATHS_prepend_toradex-bsp := "${THISDIR}/libsoc:"

PACKAGE_ARCH_toradex-bsp = "${MACHINE_ARCH}"

SRCREV_toradex-bsp = "9a97d260379856940a5de9862ef06803de82cca8"

SRC_URI_append_toradex-bsp = " \
        file://0001-libsoc-use-sane-board-naming.patch \
"

BOARD_apalis-imx6 = "apalis-imx6"
BOARD_apalis-tk1 = "apalis-tk1"
BOARD_colibri-imx6 = "colibri-imx6"
BOARD_colibri-imx6ull = "colibri-imx6ull"
BOARD_colibri-imx7 = "colibri-imx7"
BOARD_colibri-imx7-emmc = "colibri-imx7-emmc"

PACKAGECONFIG_apalis-imx6 = "allboardconfigs enableboardconfig python"
PACKAGECONFIG_apalis-tk1 = "allboardconfigs enableboardconfig python"
PACKAGECONFIG_colibri-imx6 = "allboardconfigs enableboardconfig python"
PACKAGECONFIG_colibri-imx6ull = "allboardconfigs enableboardconfig python"
PACKAGECONFIG_colibri-imx7 = "allboardconfigs enableboardconfig python"
PACKAGECONFIG_colibri-imx7-emmc = "allboardconfigs enableboardconfig python"

pkg_postinst_ontarget_${PN}_colibri-imx6ull () {
    IS_WIFI_DTB=`grep -c toradex,colibri_imx6ull-wifi /proc/device-tree/compatible`
    if [ $IS_WIFI_DTB -gt 0 ]; then
        mv -f ${datadir}/libsoc/colibri-imx6ull.conf ${datadir}/libsoc/colibri-imx6ull.conf.bak
        # SODIMM pins missing on Wi-Fi SKU
	cat ${datadir}/libsoc/colibri-imx6ull.conf.bak | grep -E -v "(SODIMM_79|SODIMM_81|SODIMM_89|SODIMM_93|SODIMM_94|SODIMM_97|SODIMM_101|SODIMM_103|SODIMM_127|SODIMM_138)" > ${datadir}/libsoc/colibri-imx6ull.conf
        rm -f ${datadir}/libsoc/colibri-imx6ull.conf.bak
    fi
}
