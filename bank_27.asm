.segment "BANK_27"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x00E010-0x01000F

; bzk this byte must be placed at 8000
    .byte con_prg_bank + $27   ; 

.out .sprintf("Free bytes in bank 27: %Xh [%d]", ($A000 - *), ($A000 - *))
