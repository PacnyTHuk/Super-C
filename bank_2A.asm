.segment "BANK_2A"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x014010-0x01600F

; bzk this byte must be placed at 8000
    .byte con_prg_bank + $2A   ; 


.out .sprintf("Free bytes in bank 2A: %Xh [%d]", ($A000 - *), ($A000 - *))
