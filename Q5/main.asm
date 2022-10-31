;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
Initial:
	mov.w #
Main:
	cmp R4, R5;
	jl Less;
	jeq Main;
	jge Greater;
Greater:
	mov.b #0001, &2000h;
	mov.b #0002, &2002h;
	mov.b #0003, &2004h;
	mov.b #0004, &2006h;
	mov.b #0005, &2008h;
	dec R4;
	jmp Main;
Less:
	mov.b #0010, &2000h;
	mov.b #0009, &2002h;
	mov.b #0008, &2004h;
	mov.b #0007, &2006h;
	mov.b #0006, &2008h;
	dec R4;
	jmp Main;
;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
