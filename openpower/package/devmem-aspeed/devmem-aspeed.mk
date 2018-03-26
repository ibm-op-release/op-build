################################################################################
#
# devmem-aspeed
#
################################################################################

DEVMEM_ASPEED_VERSION ?= c5f5878cb37be6457fdffc0998fbd04ffef9803d
DEVMEM_ASPEED_SITE = https://scm.raptorcs.com/scm/git/devmem-aspeed
DEVMEM_ASPEED_SITE_METHOD = git
DEVMEM_ASPEED_DEPENDENCIES = pciutils

DEVMEM_ASPEED_LICENSE = GPL-2.0+
DEVMEM_ASPEED_LICENSE_FILES = devmem-aspeed.c.license

define DEVMEM_ASPEED_EXTRACT_LICENSE
	head -n 38 $(@D)/devmem-aspeed.c >$(@D)/devmem-aspeed.c.license
endef
DEVMEM_ASPEED_PRE_PATCH_HOOKS += DEVMEM_ASPEED_EXTRACT_LICENSE

define DEVMEM_ASPEED_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CFLAGS="-lpci" -C $(@D) devmem-aspeed
endef

define DEVMEM_ASPEED_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/devmem-aspeed $(TARGET_DIR)/sbin/devmem-aspeed
endef

$(eval $(generic-package))
