NAME        = mono-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/compilers/mono

VERSION_SRC = $(REDHAT.ROOT)/src/mono/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
