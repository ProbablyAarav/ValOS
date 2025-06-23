#include <efi.h>
#include <efilib.h>

EFI_STATUS efi_main(EFI_HANDLE Image, EFI_SYSTEM_TABLE *table) {
	InitializeLib(Image, table);
	Print(L"Hi\n");

	return EFI_SUCCESS;
}
