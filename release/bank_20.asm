.segment "BANK_20"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file




; bzk this byte must be placed at 8000
    .byte con_prg_bank + $20   ; 
















.out .sprintf("Free bytes in bank 20: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_20b"
    .byte con_prg_bank + $21   ; 
