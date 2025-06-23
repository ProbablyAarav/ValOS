OUTPUT_FORMAT(elf64-x86-64)
ENTRY(_start)

SECTIONS
{
    . = ALIGN(CONSTANT(MAXPAGESIZE));

    .text : {
        *(.text*)
    } :text
    . = ALIGN(CONSTANT(MAXPAGESIZE));
    .rodata : {
        *(.rodata*)
    } :rodata
    
    .init_array : {
        __init_array = .;
        KEEP(*(SORT_BY_INIT_PRIORITY(.init_array.*) SORT_BY_INIT_PRIORITY(.ctors.*)))
        KEEP(*(.init_array .ctors))
        __init_array_end = .;
    } :rodata
    
    .data : {
        *(.data*)
    } :data

    .bss : {
        *(.bss*)
        *(COMMON)
    } :data
    _kernelVirtualEnd = ALIGN(CONSTANT(MAXPAGESIZE));

    /DISCARD/ : {
	    *(.eh_frame*)
	    *(.note*)
    }
}

