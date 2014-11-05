NAME           = sdsc-mono
VERSION        = 3.10.0
RELEASE        = 1
PKGROOT        = /opt/mono

SRC_SUBDIR     = mono

SOURCE_NAME    = mono
SOURCE_SUFFIX  = tar.bz2
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_BZ2_PKGS   = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
