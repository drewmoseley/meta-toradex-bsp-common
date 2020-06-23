FILESEXTRAPATHS_prepend_toradex-bsp := "${THISDIR}/python3-docutils/:"

SRC_URI_append_toradex-bsp = " \
file://rst2man_using_python3.patch \
"
 
