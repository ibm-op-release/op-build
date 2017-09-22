################################################################################
#
# arcconf
#
################################################################################

ARCCONF_VERSION = 2.05-22907
ARCCONF_SITE = /home/smc/p9dsu/arcconf
ARCCONF_SITE_METHOD = local
ARCCONF_LICENSE = Apache-2.0
ARCCONF_LICENSE_FILES = COPYING

#define ARCCONF_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
#		INCLUDEDIR="-I." all
#endef

define ARCCONF_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/arcconf $(TARGET_DIR)/sbin/arcconf
endef

$(eval $(generic-package))
