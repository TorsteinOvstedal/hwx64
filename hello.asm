; Platform: x86-64, Linux.
; No-PIE.


; Linux Syscall table
%define SYS_WRITE       1
%define SYS_EXIT        60

; Unix file descriptors
%define STDOUT          1

; Unix exit codes
%define EXIT_SUCCESS    0

; ASCII TABLE
%define NULL 0
%define LF 10
%define CR 13


section .text
global _start

_start:
	
    ; -------------------- 
    ; Write msg to stdout.
    ; --------------------

    ; MOV r64, imm64.
	db 0b01001000		; REX.W
	db 0xB8 + 0b0000	; mov rax
	dq SYS_WRITE

    ; MOV r64, imm64.
	db 0b01001000		; REX.W
	db 0xB8 + 0b0111	; mov rdi
	dq STDOUT 

    ; LEA r32, m
	db 0x8D				; lea
	db 0b00110100		; ModR/M: rsi, SIB follows.	
	db 0b00100101 		; SIB: no index, disp32 with no base.
	dd msg

    ; MOV r64, r/m64.	
	db 0b01001000		; REX.W
    db 0x8B             ; mov
    db 0b00010100       ; ModR/M: rdx, SIB follows.
    db 0b00100101       ; SIB: no index, disp32 with no base.
	dd msg.length
	
    dw 0x050f 			; syscall

    ; -----
	; Exit.
    ; -----

    ; MOV r64, imm64.
	db 0b01001000		; REX.W
	db 0xB8 + 0b0000	; mov rax
	dq SYS_EXIT

    ; MOV r64, imm64.
	; db 0b01001000		; REX.W
	; db 0xB8 + 0b0111	; mov rdi
	; dq EXIT_SUCCESS
	
    ; XOR r64, r/m64
	db 0b01001000		; REX.W
    db 0x33             ; xor
    db 0b11111111       ; ModR/M reg=edi, mod=11->r/m=edi
	
    dw 0x050f			; syscall


section .data

msg:
	.buffer: db "Hello World!", CR, LF, NULL
    .length: dd $ - msg.buffer
