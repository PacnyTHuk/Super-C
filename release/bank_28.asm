.segment "BANK_28"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file




; bzk this byte must be placed at 8000
    .byte con_prg_bank + $28   ; 
















.out .sprintf("Free bytes in bank 28: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_28b"
    .byte con_prg_bank + $29   ; 
