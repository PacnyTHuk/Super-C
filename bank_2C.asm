.segment "BANK_2C"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $A000 ; for listing file
; 0x018010-0x01A00F



.out .sprintf("Free bytes in bank 2C: %Xh [%d]", ($C000 - *), ($C000 - *))
