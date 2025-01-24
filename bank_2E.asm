.segment "BANK_2E"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $A000 ; for listing file
; 0x01C010-0x01E00F



.out .sprintf("Free bytes in bank 2E: %Xh [%d]", ($C000 - *), ($C000 - *))
