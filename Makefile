hello: hello.o
	ld $< -o $@

%.o:%.asm
	nasm -f elf64 $< -o $@

.PHONY: gen_info

gen_info: hello
	readelf -a $< >> $<.readelf.dump
	objdump -D -M intel $< >> $<.objdump.dump
	hexdump $< >> $<.hexdump.dump

.PHONY: clean 

clean:
	rm -f *.o *.dump hello
