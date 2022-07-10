# Hello x64

Hello World implemented in x86-64 *machine code* for Linux.

The goal of this project is to explore *x86-64* (instruction encoding), 
*System V* and the different parts of an *executable binary*.

## Build
```
make hello
```

## Rules
- Can use labels for addresses.
- Can use macros for immediate operands.
- The resulting binary does not need to be optimal.
- The resulting binary does not need to be position independent.

## Resources
x86 / AMD64
- [Intel 64 and IA-32 manuals](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
- [AMD64 Architecture Programmer's Manual Volume 3](https://www.amd.com/system/files/TechDocs/24594.pdf)
- [x86 and AMD64 Instruction Reference](https://www.felixcloutier.com/x86/)

System V
- [System V Specification](https://www.intel.com/content/dam/develop/external/us/en/documents/mpx-linux64-abi.pdf)
- [ELF](https://man7.org/linux/man-pages/man5/elf.5.html)

Linux
- [Linux System calls](https://man7.org/linux/man-pages/man2/syscall.2.html)
- [Linux System call Table](https://filippo.io/linux-syscall-table/)

Tools
- [NASM manual](https://www.nasm.us/doc/nasmdoc4.html)
- [GNU Make manual](https://www.gnu.org/software/make/manual/)
