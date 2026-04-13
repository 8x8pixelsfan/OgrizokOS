AS = nasm
CC = gcc
LD = ld

CFLAGS = -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -T linker.ld -nostdlib

all: iso

kernel.bin: boot/boot.asm kernel/kernel.c kernel/vga.h kernel/keyboard_scan_code.h kernel/strutils.h
	$(AS) -f elf32 boot/boot.asm -o boot.o
	$(CC) $(CFLAGS) -c kernel/kernel.c -o kernel.o
	$(LD) $(LDFLAGS) boot.o kernel.o -o kernel.bin

iso: kernel.bin
	mkdir -p iso/boot/grub
	cp kernel.bin iso/boot/
	cp grub.cfg iso/boot/grub/
	grub-mkrescue -o ogrizok.iso iso

run: iso
	qemu-system-i386 -cdrom ogrizok.iso

clean:
	rm -rf *.o *.bin iso ogrizok.iso
