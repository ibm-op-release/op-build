################################################################################
#
# common-p8-xml
#
################################################################################

COMMON_P8_XML_VERSION ?= dc15d115bffca490e96a440195fca2c90920b3ca
COMMON_P8_XML_SITE ?= https://scm.raptorcs.com/scm/git/common-op-xml
COMMON_P8_XML_SITE_METHOD = git

COMMON_P8_XML_LICENSE = Apache-2.0
COMMON_P8_XML_LICENSE_FILES = LICENSE
COMMON_P8_XML_DEPENDENCIES =

COMMON_P8_XML_INSTALL_IMAGES = YES
COMMON_P8_XML_INSTALL_TARGET = NO

XML_INSTALL_DIRECTORY=$(STAGING_DIR)/openpower_mrw_scratch/

define COMMON_P8_XML_INSTALL_IMAGES_CMDS
        bash -c 'mkdir -p $(XML_INSTALL_DIRECTORY) && cp -r $(@D)/* $(XML_INSTALL_DIRECTORY)'
endef

$(eval $(generic-package))
