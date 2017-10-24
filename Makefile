boot.bin: boot.o
	ld -Ttext 0x7c00 --oformat=binary $? -o $@

boot.o: boot.s
	as $? -o $@ 

clean:
	rm -f boot.o boot.bin
