.segment "BANK_26"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file




; bzk this byte must be placed at 8000
    .byte con_prg_bank + $26   ; 



sub_8789:
; US 0x0047A9
- - - - - - 0x004799 01:8789: A9 21     LDA #$21    ; колво байтов в таблице
- - - - - - 0x00479B 01:878B: 85 08     STA ram_0008
- - - - - - 0x00479D 01:878D: A0 00     LDY #$00
- - - - - - 0x00479F 01:878F: A6 1E     LDX ram_001E
- - - - - - 0x0047A1 01:8791: E0 40     CPX #$40
- - - - - - 0x0047A3 01:8793: B0 0F     BCS bra_87A4
bra_8795_loop:
- - - - - - 0x0047A5 01:8795: B9 A7 87  LDA tbl_87A7,Y
- - - - - - 0x0047A8 01:8798: 9D 00 03  STA ram_0300,X
- - - - - - 0x0047AB 01:879B: E8        INX
- - - - - - 0x0047AC 01:879C: C8        INY
- - - - - - 0x0047AD 01:879D: C6 08     DEC ram_0008
- - - - - - 0x0047AF 01:879F: D0 F4     BNE bra_8795_loop
- - - - - - 0x0047B1 01:87A1: 86 1E     STX ram_001E
- - - - - - 0x0047B3 01:87A3: 18        CLC
bra_87A4:
- - - - - - 0x0047B4 01:87A4: A6 10     LDX ram_0010
- - - - - - 0x0047B6 01:87A6: 60        RTS



tbl_87A7:
- - - - - - 0x0047B7 01:87A7: 03        .byte con_buf_mode_03   ; 

- - - - - - 0x0047B8 01:87A8: 2B D8     .dbyt $2BD8 ; ppu address
- - - - - - 0x0047BA 01:87AA: 09        .byte $09, $AA   ; counter + fill tile

- - - - - - 0x0047BC 01:87AC: 06        .byte con_buf_mode_06   ; 

- - - - - - 0x0047BD 01:87AD: 2B E1     .dbyt $2BE1 ; ppu address
- - - - - - 0x0047BF 01:87AF: 17        .byte $17   ; counter
- - - - - - 0x0047C0 01:87B0: EA        .byte $EA, $FA, $EA, $FA, $FA, $BA, $EA, $FB, $FB, $0F, $EB, $FA, $AA, $EA, $FB, $00   ; 
- - - - - - 0x0047D0 01:87C0: 00        .byte $00, $00, $EF, $AA, $AA, $AA, $AA   ; 

- - - - - - 0x0047D7 01:87C7: FF        .byte $FF   ; close buffer



bra_87C8_RTS:
- - - - - - 0x0047D8 01:87C8: 60        RTS

































.out .sprintf("Free bytes in bank 26: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_26b"
    .byte con_prg_bank + $27   ; 
