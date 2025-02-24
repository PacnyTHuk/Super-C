.segment "BANK_32"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x024010-0x02600F

; bzk this byte must be placed at 8000
- D 0 - - - 0x004010 01:8000: 32        .byte con_prg_bank + $32   ; 



.out .sprintf("Free bytes in bank 32: %Xh [%d]", ($A000 - *), ($A000 - *))

