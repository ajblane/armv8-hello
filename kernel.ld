OUTPUT_FORMAT("elf64-littleaarch64")
OUTPUT_ARCH(aarch64)
TARGET(binary)

STACKTOP = 0x51000000;

SECTIONS
{
	. = 0x40010000;
	.text : { *(.text) }
	.data : { *(.data) }
	.bss : { *(.bss) }

	. = STACKTOP;
	.el1_stack :
	{
		PROVIDE(stackstart = .);
		. = . + 4096 * 4;
		. = ALIGN(8);
		PROVIDE(stackend = .);
	}
	
	
}
