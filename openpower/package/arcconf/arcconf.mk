################################################################################
#
# arcconf
#
################################################################################

ARCCONF_VERSION ?= cbf40a719bb7bee5521c2616ddb5bd6bdc7ce1a8
ARCCONF_SITE ?= $(call github,supermicro,arcconf,$(ARCCONF_VERSION))

ARCCONF_LICENSE = Apache-2.0
ARCCONF_LICENSE_FILES = COPYING

define ARCCONF_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/arcconf $(TARGET_DIR)/sbin/arcconf
endef

$(eval $(generic-package))
