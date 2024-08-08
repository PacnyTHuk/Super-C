.segment "BANK_2A"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x014010-0x01800F
; тут будут строения всех уровней





.out .sprintf("Free bytes in bank 2A: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_2Ab"
                                    .byte con_prg_bank + $2A   ; 
