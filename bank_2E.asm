.segment "BANK_2E"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file




; bzk this byte must be placed at 8000
    .byte con_prg_bank + $2E   ; 
















.out .sprintf("Free bytes in bank 2E: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_2Eb"
    .byte con_prg_bank + $2F   ; 
