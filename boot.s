.code16
.text
	.globl _start;
_start:
	leaw s1, %si
	call puts

idle:
	jmp idle

puts:
	lodsb
	test %al, %al
	jz puts_end
	movb $0x0e, %ah
	int  $0x10
	jmp puts
puts_end:
	movb $13, %al
	movb $0x0e, %ah
	int  $0x10
	movb $10, %al
	movb $0x0e, %ah
	int  $0x10
	ret

s1:
	.string "Hello World!"
	. = _start + 510
	.byte 0x55
	.byte 0xaa
