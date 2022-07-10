; Platform: x86-64, Linux.
; No-PIE.

; Linux Syscall table
%define SYS_WRITE 1
%define SYS_EXIT  60

; Unix file descriptors
%define STDOUT 1

; Unix exit codes
%define EXIT_SUCCESS 0

; ASCII table
%define NULL 0
%define LF   10
%define CR   13

%define V_ADDR 0x40000

elf_header:
    db 0x7F, "ELF"          ; e_ident[EI_MAG0, EI_MAG3]
    db 0x01                 ; e_ident[EI_CLASS]      = 64bit
    db 0x01                 ; e_ident[EI_DATA]       = Little Endian
    db 0x01                 ; e_ident[EI_VERSION]    = Current ELF version
    db 0x00                 ; e_ident[EI_OSABI]      = System V
    db 0x00                 ; e_ident[EI_ABIVERSION] = Undefined, i.e. padding
    db 0,0,0,0,0,0,0        ; e_ident[EI_PAD]
    dw 0x02                 ; e_type                 = EXEC
    dw 0x3E                 ; e_machine              = x64
    dd 0x01                 ; e_version              = Current version
    dq _start + V_ADDR      ; e_entry
    dq elf_program_header   ; e_phoff
    dq 0x00                 ; e_shoff
    dd 0x00                 ; e_flags                = Undefined.
    dw 0x40                 ; e_ehsize
    dw 0x38                 ; e_phentsize
    dw 0x01                 ; e_phnum
    dw 0x00                 ; e_shentsize
    dw 0x00                 ; e_shnum
    dw 0x00                 ; e_shstrndx

elf_program_header:
    dd 0x01                 ; p_type  = Loadable
    dd 0x4 | 0x1            ; p_flags = Readable | Executable
    dq 0                    ; p_offset
    dq V_ADDR               ; p_vaddr
    dq V_ADDR               ; p_paddr
    dq file_size            ; p_filesz
    dq file_size            ; p_memsz
    dq 0x1000               ; p_align

; Dont have any 
; - Section headers, 
; - Relocation information
; - Symbol table
; - String table
; - ...

; elf_section_header:
;     dd 0x00 ; sh_name
;     dd 0x00 ; sh_type
;     dq 0x00 ; sh_flags
;     dq 0x00 ; sh_addr
;     dq 0x00 ; sh_offset
;     dq 0x00 ; sh_size
;     dw 0x00 ; sh_link
;     dw 0x00 ; sh_info
;     dq 0x00 ; sh_addralign
;     dq 0x00 ; sh_entsize


; section .text
; global _start

_start:
    ; Write msg to stdout

    ; MOV r64, imm64.
    db 0b01001000       ; REX.W
    db 0xB8 + 0b0000    ; mov rax
    dq SYS_WRITE

    ; MOV r64, imm64.
    db 0b01001000       ; REX.W
    db 0xB8 + 0b0111    ; mov rdi
    dq STDOUT 

    ; LEA r32, m
    db 0x8D             ; lea
    db 0b00110100       ; ModR/M: rsi, SIB follows.	
    db 0b00100101       ; SIB: no index, disp32 with no base.
    dd msg + V_ADDR

    ; MOV r64, r/m64.	
    db 0b01001000       ; REX.W
    db 0x8B             ; mov
    db 0b00010100       ; ModR/M: rdx, SIB follows.
    db 0b00100101       ; SIB: no index, disp32 with no base.
    dd msg.length + V_ADDR
    
    dw 0x050f           ; syscall

    ; Exit

    ; MOV r64, imm64.
    db 0b01001000       ; REX.W
    db 0xB8 + 0b0000    ; mov rax
    dq SYS_EXIT

    ; MOV r64, imm64.
    ; db 0b01001000     ; REX.W
    ; db 0xB8 + 0b0111  ; mov rdi
    ; dq EXIT_SUCCESS
    
    ; XOR r64, r/m64
    db 0b01001000       ; REX.W
    db 0x33             ; xor
    db 0b11111111       ; ModR/M reg=edi, mod=11->r/m=edi
    
    dw 0x050f           ; syscall


; section .data

msg:
    .buffer: db "Hello World!", CR, LF
    .length: dd $ - msg.buffer

file_size: equ $ - $$