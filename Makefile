AS = nasm
CC = gcc
LD = ld

CFLAGS = -m32 -g -O0 -ffreestanding -fno-stack-protector -fno-pie -no-pie -Wall -Wextra
LDFLAGS = -m elf_i386 -T linker.ld -nostdlib

all: iso

kernel.bin: boot/boot.asm kernel/kernel.c kernel/vga.h kernel/keyboard_scan_code.h kernel/strutils.h kernel/mouse.h
	$(AS) -f elf32 boot/boot.asm -o boot.o
	$(CC) $(CFLAGS) -c kernel/kernel.c -o kernel.o
	$(LD) $(LDFLAGS) boot.o kernel.o -o kernel.bin

iso: kernel.bin
	mkdir -p iso/boot/grub
	cp kernel.bin iso/boot/
	cp grub.cfg iso/boot/grub/
	grub-mkrescue -o ogrizokOS.iso iso

run: iso
	qemu-system-i386 -cdrom ogrizokOS.iso -no-reboot -d int

clean:
	rm -rf *.o *.bin iso ogrizokOS.iso
