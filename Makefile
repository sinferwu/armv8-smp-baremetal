CROSS_COMPILE ?= aarch64-linux-gnu-

asm-objs = boot.o el0_entry.o

kernel.elf: $(asm-objs)
	$(CROSS_COMPILE)ld -T linker.ld -static $(asm-objs) -o kernel.elf

$(asm-objs): %.o: %.S
	$(CROSS_COMPILE)gcc -nostdlib -nostartfiles -c $< -o $@

.PHONY: clean
clean:
	rm -f *.o kernel.elf kernel.bin
