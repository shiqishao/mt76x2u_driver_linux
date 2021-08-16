KVER  := $(shell uname -r)
KSRC := /lib/modules/$(KVER)/build
MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/net/wireless/
MAKEDIR := $(shell pwd)/mt76x2
MODULE_NAME = mt76x2u


all: modules

modules:
	make -C $(KSRC) M=$(MAKEDIR)  modules


install:
	install -p -m 644 $(MODULE_NAME).ko  $(MODDESTDIR)
	/sbin/depmod -a ${KVER}
	modprobe $(MODULE_NAME)

uninstall:
	rm -f $(MODDESTDIR)/$(MODULE_NAME).ko
	/sbin/depmod -a ${KVER}
