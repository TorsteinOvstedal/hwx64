# Hello x64

"Hello World" implemented in x86-64 machine code for Linux.

Goal: Explore x86-64 (instruction encoding) & System V (executables).

## Build
```
make hello
```

## Resources

Tools
- [NASM manual](https://www.nasm.us/doc/nasmdoc4.html)
- [GNU Make manual](https://www.gnu.org/software/make/manual/)

x86 & AMD64
- [Intel 64 and IA-32 manuals](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
- [AMD64 Architecture Programmer's Manual Volume 3](https://www.amd.com/system/files/TechDocs/24594.pdf)
- [x86 and AMD64 Instruction Reference](https://www.felixcloutier.com/x86/)

System V
- [System V Specification](https://www.intel.com/content/dam/develop/external/us/en/documents/mpx-linux64-abi.pdf)
- [ELF](https://man7.org/linux/man-pages/man5/elf.5.html)
- [elf.h](https://github.com/torvalds/linux/blob/master/include/uapi/linux/elf.h)

Linux
- [Linux System calls](https://man7.org/linux/man-pages/man2/syscall.2.html)
- [Linux System call Table](https://filippo.io/linux-syscall-table/)

Relocation
- System V ABI Specification
- [Linker and Libraries Guide: Object File Format](https://docs.oracle.com/cd/E19683-01/817-3677/chapter6-46512/index.html)
- [R_X86_64_32S and R_X86_64_64](https://stackoverflow.com/a/6093910) 

Virtual Address 0x00400000
- [Why is 0x00400000 the default base address for an executable?](https://devblogs.microsoft.com/oldnewthing/20141003-00/?p=43923)
- [Why is address 0x400000 chosen as a start of text segment in x86_64 ABI?](https://stackoverflow.com/questions/39689516/why-is-address-0x400000-chosen-as-a-start-of-text-segment-in-x86-64-abi)
