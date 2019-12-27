SECTIONS
{
    . = 0x40080000;
    .text : { *(.text) }
    .data : { *(.data) }
    .bss : { *(.bss COMMON) }
}
