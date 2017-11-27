NAME           = sdsc-fsharp
VERSION        = 3.1.2.5
RELEASE        = 1
# Although not required, the fsharp installation process assumes that it is
# installed in the same location as mono itself.
PKGROOT        = /opt/mono

SRC_SUBDIR     = fsharp

SOURCE_NAME    = fsharp
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
