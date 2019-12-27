CROSS_COMPILE ?= aarch64-linux-gnu-

kernel.elf: boot.o
	$(CROSS_COMPILE)ld -T linker.ld -static boot.o -o kernel.elf

boot.o: boot.S
	$(CROSS_COMPILE)gcc -nostdlib -nostartfiles -c boot.S -o boot.o

.PHONY: clean
clean:
	rm *.o kernel.elf kernel.bin
