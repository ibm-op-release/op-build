################################################################################
#
# HCODE
#
################################################################################

HCODE_VERSION ?= 37069e1756e2b8e70e8e185d28609414033dbc02
HCODE_SITE ?= https://scm.raptorcs.com/scm/git/talos-hcode
HCODE_SITE_METHOD = git

HCODE_LICENSE = Apache-2.0
HCODE_DEPENDENCIES = host-ppe42-gcc

HCODE_INSTALL_IMAGES = YES
HCODE_INSTALL_TARGET = NO

define HCODE_BUILD_CMDS
	HCODE_COMMIT_ID=$(HCODE_VERSION) \
		PPE_TOOL_PATH=$(PPE42_GCC_BIN)/ HOST_PREFIX=/usr/bin/ TARGET_PREFIX=$(HOST_DIR)/usr/bin/ \
		TARGET_CC=powerpc64le-buildroot-linux-gnu-gcc TARGET_CXX=powerpc64le-buildroot-linux-gnu-g++ \
		TARGET_AR=powerpc64le-buildroot-linux-gnu-ar TARGET_LD=powerpc64le-buildroot-linux-gnu-ld \
		$(MAKE1) -C $(@D) \
		LD_LIBRARY_PATH=$(HOST_DIR)/usr/lib \
		CROSS_COMPILER_PATH=$(PPE42_GCC_BIN) \
		all
endef

define HCODE_INSTALL_IMAGES_CMDS
	mkdir -p $(STAGING_DIR)/hostboot_binaries
	cp $(@D)/output/images/hw_image/p9n.hw_image.bin $(STAGING_DIR)/hostboot_binaries/p9n.ref_image.bin
endef

$(eval $(generic-package))
