NAME               = mono
VERSION            = 3.2.6
RELEASE            = 0
PKGROOT            = /opt/mono
RPM.EXTRAS         = AutoReq:No

SRC_SUBDIR         = mono

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.bz2
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_BZ2_PKGS        = $(SOURCE_PKG)
