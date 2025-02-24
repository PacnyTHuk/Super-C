.segment "BANK_29"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x012010-0x01400F

; bzk this byte must be placed at 8000
    .byte con_prg_bank + $29   ; 


.out .sprintf("Free bytes in bank 29: %Xh [%d]", ($A000 - *), ($A000 - *))
