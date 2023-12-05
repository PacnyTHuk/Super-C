.segment "BANK_2C"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x018010-0x01C00F




; bzk this byte must be placed at 8000
    .byte con_prg_bank + $2C   ; 
















.out .sprintf("Free bytes in bank 2C: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_2Cb"
    .byte con_prg_bank + $2D   ; 
