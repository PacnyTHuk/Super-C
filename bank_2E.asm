.segment "BANK_2E"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x01C010-0x01E00F
; перенесен с 31 банка, музыка/звуки разделен на 2E-2F


















.out .sprintf("Free bytes in bank 2E: %Xh [%d]", ($A000 - *), ($A000 - *))
