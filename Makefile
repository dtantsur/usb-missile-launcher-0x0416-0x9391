ifneq ($(KERNELRELEASE),)
obj-m := missile_launcher.o
else
KDIR := /usr/src/kernels/`uname -r`
all:
	$(MAKE) -C $(KDIR) M=`pwd` modules
endif

clean:
	rm -f *.ko* *.o* *.mod* Module.symvers
	rm -rf .??*
