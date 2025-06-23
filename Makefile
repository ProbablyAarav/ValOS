TARGET = bootx64.efi
SRC = hello.c
ARCH = x86_64
EFIINC = /usr/include/efi
EFILIB = /usr/lib

CFLAGS = -I$(EFIINC) -I$(EFIINC)/$(ARCH) -fPIC -fshort-wchar -mno-red-zone -Wall
LDFLAGS = -nostdlib -T elf_$(ARCH)_efi.lds -shared -Bsymbolic -L$(EFILIB) -lefi -lgnuefi

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -c $< -o hello.o
	ld $(LDFLAGS) hello.o -o $@
	objcopy -j .text -j .sdata -j .data -j .dynamic -j .dynsym \
		-j .rel -j .rela -j .reloc --target=efi-app-$(ARCH) $@ $@

clean:
	rm -f *.o *.efi

