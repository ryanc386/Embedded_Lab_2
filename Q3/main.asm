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
	mov.w #0000b, R10
	mov.w #0000b, R9
	mov.w #0101b, R4
	mov.w #0011b, R5
	mov.w #0001b, R6
	and R6, R4
	and R6, R5
Compare:
	cmp R6, R4
	jeq Compare2
	cmp R6, R5
	jeq SetRegSingle
	jmp $
Compare2:
	cmp R6, R5
	jeq SetRegBoth
	jmp SetRegSingle
	jmp $
SetRegSingle:
	inv R9
	mov.w R9, R10
	jmp $
SetRegBoth:
	mov.w #0FF0h, R9
	jmp $

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
            
