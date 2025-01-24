.segment "BANK_2D"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $A000 ; for listing file
; 0x01A010-0x01C00F



.out .sprintf("Free bytes in bank 2D: %Xh [%d]", ($C000 - *), ($C000 - *))
