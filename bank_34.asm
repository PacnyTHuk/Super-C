.segment "BANK_34"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x028010-0x02C00F

.export ofs_044_0x00D3B9_00_area_1
.export ofs_044_0x00D4A2_01_area_2
.export ofs_044_0x00D557_02_area_3
.export ofs_044_0x00D610_03_area_4
.export ofs_044_0x00D703_04_area_5
.export ofs_044_0x00D82A_05_area_6
.export ofs_044_0x00D8F3_06_area_7
.export ofs_044_0x00D977_07_area_8

; bzk this byte must be placed at 8000
    .byte con_prg_bank + $34   ; 


ofs_044_0x00D3B9_00_area_1:
C - - J - - 0x00D3B9 03:93A9: A5 39     LDA ram_пауза
C - - - - - 0x00D3BB 03:93AB: F0 01     BEQ bra_93AE_игра
C - - - - - 0x00D3BD 03:93AD: 60        RTS ; Пауза
bra_93AE_игра:
C - - - - - 0x00D3BE 03:93AE: 20 55 94  JSR sub_9455
C - - - - - 0x00D3C1 03:93B1: A5 61     LDA ram_0061_конфиг_уровня
C - - - - - 0x00D3C3 03:93B3: D0 1A     BNE bra_93CF_RTS
C - - - - - 0x00D3C5 03:93B5: A5 8C     LDA ram_008C
C - - - - - 0x00D3C7 03:93B7: 0A        ASL
C - - - - - 0x00D3C8 03:93B8: A8        TAY
C - - - - - 0x00D3C9 03:93B9: B9 D0 93  LDA tbl_93D0,Y
C - - - - - 0x00D3CC 03:93BC: C5 63     CMP ram_0063
C - - - - - 0x00D3CE 03:93BE: 90 0B     BCC bra_93CB
C - - - - - 0x00D3D0 03:93C0: D0 0D     BNE bra_93CF_RTS
C - - - - - 0x00D3D2 03:93C2: B9 D1 93  LDA tbl_93D0 + $01,Y
C - - - - - 0x00D3D5 03:93C5: C5 FD     CMP ram_scroll_X
C - - - - - 0x00D3D7 03:93C7: F0 02     BEQ bra_93CB
C - - - - - 0x00D3D9 03:93C9: B0 04     BCS bra_93CF_RTS
bra_93CB:
C - - - - - 0x00D3DB 03:93CB: 20 E9 93  JSR sub_93E9
C - - - - - 0x00D3DE 03:93CE: 18        CLC
bra_93CF_RTS:
C - - - - - 0x00D3DF 03:93CF: 60        RTS



tbl_93D0:
;                                              +---------- 
;                                              |    +----- scroll_X
;                                              |    |
- D 0 - - - 0x00D3E0 03:93D0: 03        .byte $03, $00   ; 00 
- D 0 - - - 0x00D3E2 03:93D2: 03        .byte $03, $80   ; 01 
- D 0 - - - 0x00D3E4 03:93D4: 03        .byte $03, $C0   ; 02 
- D 0 - - - 0x00D3E6 03:93D6: 05        .byte $05, $70   ; 03 
- D 0 - - - 0x00D3E8 03:93D8: 05        .byte $05, $B0   ; 04 
- D 0 - - - 0x00D3EA 03:93DA: 07        .byte $07, $80   ; 05 
- D 0 - - - 0x00D3EC 03:93DC: 07        .byte $07, $C0   ; 06 
- D 0 - - - 0x00D3EE 03:93DE: 0A        .byte $0A, $70   ; 07 
- D 0 - - - 0x00D3F0 03:93E0: 0A        .byte $0A, $B0   ; 08 
- D 0 - - - 0x00D3F2 03:93E2: 0C        .byte $0C, $00   ; 09 
- D 0 - - - 0x00D3F4 03:93E4: 0C        .byte $0C, $02   ; 0A 
- D 0 - - - 0x00D3F6 03:93E6: 0C        .byte $0C, $FE   ; 0B 
- - - - - - 0x00D3F8 03:93E8: FF        .byte $FF   ; 0C final



sub_93E9:
; 1путин опт
                                        LDY ram_008C
                                        LDA tbl_93EE_lo,Y
                                        STA ram_0000
                                        LDA tbl_93EE_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)

tbl_93EE_lo:
- D 0 - I - 0x00D3FE 03:93EE: 08 94     .byte < ofs_019_9408_00
- D 0 - I - 0x00D400 03:93F0: 0F 94     .byte < ofs_019_940F_01
- D 0 - I - 0x00D402 03:93F2: 19 94     .byte < ofs_019_9419_02
- D 0 - I - 0x00D404 03:93F4: 23 94     .byte < ofs_019_9423_03
- D 0 - I - 0x00D406 03:93F6: 2D 94     .byte < ofs_019_942D_04
- D 0 - I - 0x00D408 03:93F8: 13 94     .byte < ofs_019_9413_05
- D 0 - I - 0x00D40A 03:93FA: 1D 94     .byte < ofs_019_941D_06
- D 0 - I - 0x00D40C 03:93FC: 27 94     .byte < ofs_019_9427_07
- D 0 - I - 0x00D40E 03:93FE: 31 94     .byte < ofs_019_9431_08
- D 0 - I - 0x00D410 03:9400: 3B 94     .byte < ofs_019_943B_09
- D 0 - I - 0x00D412 03:9402: 47 94     .byte < ofs_019_9447_0A
- D 0 - I - 0x00D414 03:9404: 41 94     .byte < ofs_019_9441_0B
- - - - - - 0x00D416 03:9406: 54 94     .byte < _общий_RTS ; 0C
tbl_93EE_hi:
- D 0 - I - 0x00D3FE 03:93EE: 08 94     .byte > ofs_019_9408_00
- D 0 - I - 0x00D400 03:93F0: 0F 94     .byte > ofs_019_940F_01
- D 0 - I - 0x00D402 03:93F2: 19 94     .byte > ofs_019_9419_02
- D 0 - I - 0x00D404 03:93F4: 23 94     .byte > ofs_019_9423_03
- D 0 - I - 0x00D406 03:93F6: 2D 94     .byte > ofs_019_942D_04
- D 0 - I - 0x00D408 03:93F8: 13 94     .byte > ofs_019_9413_05
- D 0 - I - 0x00D40A 03:93FA: 1D 94     .byte > ofs_019_941D_06
- D 0 - I - 0x00D40C 03:93FC: 27 94     .byte > ofs_019_9427_07
- D 0 - I - 0x00D40E 03:93FE: 31 94     .byte > ofs_019_9431_08
- D 0 - I - 0x00D410 03:9400: 3B 94     .byte > ofs_019_943B_09
- D 0 - I - 0x00D412 03:9402: 47 94     .byte > ofs_019_9447_0A
- D 0 - I - 0x00D414 03:9404: 41 94     .byte > ofs_019_9441_0B
- - - - - - 0x00D416 03:9406: 54 94     .byte > _общий_RTS ; 0C



ofs_019_9408_00:
C - - J - - 0x00D418 03:9408: A9 3A     LDA #con_chr_bank + $3A
C - - - - - 0x00D41A 03:940A: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x00D41D 03:940D: D0 42     BNE bra_9451    ; jmp



ofs_019_940F_01:
C - - J - - 0x00D41F 03:940F: A0 02     LDY #$02
C - - - - - 0x00D421 03:9411: D0 02     BNE bra_9415    ; jmp



ofs_019_9413_05:
C - - J - - 0x00D423 03:9413: A0 01     LDY #$01
bra_9415:
C - - - - - 0x00D425 03:9415: A9 90     LDA #$90
C - - - - - 0x00D427 03:9417: D0 1C     BNE bra_9435    ; jmp



ofs_019_9419_02:
C - - J - - 0x00D429 03:9419: A0 02     LDY #$02
C - - - - - 0x00D42B 03:941B: D0 02     BNE bra_941F    ; jmp



ofs_019_941D_06:
C - - J - - 0x00D42D 03:941D: A0 01     LDY #$01
bra_941F:
C - - - - - 0x00D42F 03:941F: A9 60     LDA #$60
C - - - - - 0x00D431 03:9421: D0 12     BNE bra_9435    ; jmp



ofs_019_9423_03:
C - - J - - 0x00D433 03:9423: A0 02     LDY #$02
C - - - - - 0x00D435 03:9425: D0 02     BNE bra_9429    ; jmp



ofs_019_9427_07:
C - - J - - 0x00D437 03:9427: A0 01     LDY #$01
bra_9429:
C - - - - - 0x00D439 03:9429: A9 20     LDA #$20
C - - - - - 0x00D43B 03:942B: D0 08     BNE bra_9435    ; jmp



ofs_019_942D_04:
C - - J - - 0x00D43D 03:942D: A0 01     LDY #$01
C - - - - - 0x00D43F 03:942F: D0 02     BNE bra_9433    ; jmp



ofs_019_9431_08:
C - - J - - 0x00D441 03:9431: A0 00     LDY #$00
bra_9433:
C - - - - - 0x00D443 03:9433: A9 E0     LDA #$E0
bra_9435:
C - - - - - 0x00D445 03:9435: 20 10 F8  JSR sub_0x01F820
C - - - - - 0x00D448 03:9438: 4C 51 94  JMP loc_9451



ofs_019_943B_09:
C - - J - - 0x00D44B 03:943B: A9 C0     LDA #$C0
C - - - - - 0x00D44D 03:943D: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00D44F 03:943F: 85 71     STA ram_0071_тип_скролла
ofs_019_9441_0B:
C - - - - - 0x00D451 03:9441: A9 01     LDA #$01
C - - - - - 0x00D453 03:9443: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00D455 03:9445: D0 0A     BNE bra_9451    ; jmp



ofs_019_9447_0A:
C - - J - - 0x00D457 03:9447: A0 80     LDY #con_F97C_colors + $20 * $04
C - - - - - 0x00D459 03:9449: 20 68 F9  JSR sub_0x01F978_запись_3х_цветов
C - - - - - 0x00D45C 03:944C: A0 84     LDY #con_F97C_colors + $21 * $04
C - - - - - 0x00D45E 03:944E: 20 68 F9  JSR sub_0x01F978_запись_3х_цветов
bra_9451:
loc_9451:
C D 0 - - - 0x00D461 03:9451: E6 8C     INC ram_008C
C - - - - - 0x00D463 03:9453: 60        RTS



sub_9455:
C - - - - - 0x00D465 03:9455: A5 8D     LDA ram_событие_на_уровне
C - - - - - 0x00D467 03:9457: 0A        ASL
C - - - - - 0x00D468 03:9458: A8        TAY
C - - - - - 0x00D469 03:9459: B9 6E 94  LDA tbl_946E,Y
C - - - - - 0x00D46C 03:945C: C5 82     CMP ram_0082_конфиг_уровня
C - - - - - 0x00D46E 03:945E: 90 09     BCC bra_9469
C - - - - - 0x00D470 03:9460: D0 0B     BNE bra_946D_RTS
C - - - - - 0x00D472 03:9462: B9 6F 94  LDA tbl_946E + $01,Y
C - - - - - 0x00D475 03:9465: C5 FC     CMP ram_scroll_Y
C - - - - - 0x00D477 03:9467: B0 04     BCS bra_946D_RTS
bra_9469:
C - - - - - 0x00D479 03:9469: 20 73 94  JSR sub_9473
C - - - - - 0x00D47C 03:946C: 18        CLC
bra_946D_RTS:
C - - - - - 0x00D47D 03:946D: 60        RTS



tbl_946E:
;                                              +---------- 
;                                              |    +----- scroll_Y
;                                              |    |
- D 0 - - - 0x00D47E 03:946E: 02        .byte $02, $80   ; 00 
- D 0 - - - 0x00D480 03:9470: 02        .byte $02, $E0   ; 01 
- D 0 - - - 0x00D482 03:9472: FF        .byte $FF   ; 02 final



sub_9473:
; 1путин опт
                                        LDY ram_событие_на_уровне
                                        LDA tbl_9478_lo,Y
                                        STA ram_0000
                                        LDA tbl_9478_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9478_lo:
- D 0 - I - 0x00D488 03:9478: 7E 94     .byte < ofs_020_947E_00
- D 0 - I - 0x00D48A 03:947A: 86 94     .byte < ofs_020_9486_01
- - - - - - 0x00D48C 03:947C: 91 94     .byte < _общий_RTS ; 02
tbl_9478_hi:
- D 0 - I - 0x00D488 03:9478: 7E 94     .byte > ofs_020_947E_00
- D 0 - I - 0x00D48A 03:947A: 86 94     .byte > ofs_020_9486_01
- - - - - - 0x00D48C 03:947C: 91 94     .byte > _общий_RTS ; 02



ofs_020_947E_00:
C - - J - - 0x00D48E 03:947E: A0 64     LDY #con_F97C_colors + $19 * $04
C - - - - - 0x00D490 03:9480: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
bra_9483:
C - - - - - 0x00D493 03:9483: E6 8D     INC ram_событие_на_уровне
C - - - - - 0x00D495 03:9485: 60        RTS



ofs_020_9486_01:
C - - J - - 0x00D496 03:9486: A9 38     LDA #con_chr_bank + $38
C - - - - - 0x00D498 03:9488: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x00D49B 03:948B: A9 40     LDA #$40
C - - - - - 0x00D49D 03:948D: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00D49F 03:948F: D0 F2     BNE bra_9483    ; jmp



ofs_044_0x00D4A2_01_area_2:
C - - J - - 0x00D4A2 03:9492: A5 39     LDA ram_пауза
C - - - - - 0x00D4A4 03:9494: F0 01     BEQ bra_9497_игра
C - - - - - 0x00D4A6 03:9496: 60        RTS ; пауза
bra_9497_игра:
C - - - - - 0x00D4A7 03:9497: A5 8D     LDA ram_событие_на_уровне
C - - - - - 0x00D4A9 03:9499: 0A        ASL
C - - - - - 0x00D4AA 03:949A: A8        TAY
C - - - - - 0x00D4AB 03:949B: B9 B2 94  LDA tbl_94B2,Y
C - - - - - 0x00D4AE 03:949E: C5 82     CMP ram_0082_конфиг_уровня
C - - - - - 0x00D4B0 03:94A0: 90 0F     BCC bra_94B1_RTS
C - - - - - 0x00D4B2 03:94A2: F0 02     BEQ bra_94A6
C - - - - - 0x00D4B4 03:94A4: B0 07     BCS bra_94AD    ; jmp
bra_94A6:
C - - - - - 0x00D4B6 03:94A6: B9 B3 94  LDA tbl_94B2 + $01,Y
C - - - - - 0x00D4B9 03:94A9: C5 FC     CMP ram_scroll_Y
C - - - - - 0x00D4BB 03:94AB: 90 04     BCC bra_94B1_RTS
bra_94AD:
C - - - - - 0x00D4BD 03:94AD: 20 CD 94  JSR sub_94CD
C - - - - - 0x00D4C0 03:94B0: 18        CLC
bra_94B1_RTS:
C - - - - - 0x00D4C1 03:94B1: 60        RTS



tbl_94B2:
;                                              +---------- 
;                                              |    +----- scroll_Y
;                                              |    |
- D 0 - - - 0x00D4C2 03:94B2: 0A        .byte $0A, $00   ; 00 
- D 0 - - - 0x00D4C4 03:94B4: 09        .byte $09, $E0   ; 01 
- D 0 - - - 0x00D4C6 03:94B6: 09        .byte $09, $8E   ; 02 
- D 0 - - - 0x00D4C8 03:94B8: 08        .byte $08, $D0   ; 03 
- D 0 - - - 0x00D4CA 03:94BA: 08        .byte $08, $8E   ; 04 
- D 0 - - - 0x00D4CC 03:94BC: 08        .byte $08, $80   ; 05 
- D 0 - - - 0x00D4CE 03:94BE: 07        .byte $07, $90   ; 06 
- D 0 - - - 0x00D4D0 03:94C0: 03        .byte $03, $00   ; 07 
- D 0 - - - 0x00D4D2 03:94C2: 02        .byte $02, $18   ; 08 
- D 0 - - - 0x00D4D4 03:94C4: 02        .byte $02, $00   ; 09 
- D 0 - - - 0x00D4D6 03:94C6: 01        .byte $01, $60   ; 0A 
- D 0 - - - 0x00D4D8 03:94C8: 01        .byte $01, $00   ; 0B 
- D 0 - - - 0x00D4DA 03:94CA: 00        .byte $00, $80   ; 0C 
- D 0 - - - 0x00D4DC 03:94CC: FF        .byte $FF   ; 0D final



sub_94CD:
; 1путин опт
                                        LDY ram_событие_на_уровне
                                        LDA tbl_94D2_lo,Y
                                        STA ram_0000
                                        LDA tbl_94D2_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)

tbl_94D2_lo:
- D 0 - I - 0x00D4E2 03:94D2: EE 94     .byte < ofs_021_94EE_00
- D 0 - I - 0x00D4E4 03:94D4: 2B 95     .byte < ofs_021_952B_01
- D 0 - I - 0x00D4E6 03:94D6: 3A 95     .byte < ofs_021_953A_02
- D 0 - I - 0x00D4E8 03:94D8: 2B 95     .byte < ofs_021_952B_03
- D 0 - I - 0x00D4EA 03:94DA: 3A 95     .byte < ofs_021_953A_04
- D 0 - I - 0x00D4EC 03:94DC: FC 94     .byte < ofs_021_94FC_05
- D 0 - I - 0x00D4EE 03:94DE: 04 95     .byte < ofs_021_9504_06
- D 0 - I - 0x00D4F0 03:94E0: 1C 95     .byte < ofs_021_951C_07
- D 0 - I - 0x00D4F2 03:94E2: 33 95     .byte < ofs_021_9533_08
- D 0 - I - 0x00D4F4 03:94E4: 20 95     .byte < ofs_021_9520_09
- D 0 - I - 0x00D4F6 03:94E6: 33 95     .byte < ofs_021_9533_0A
- D 0 - I - 0x00D4F8 03:94E8: 3A 95     .byte < ofs_021_953A_0B
- D 0 - I - 0x00D4FA 03:94EA: 3A 95     .byte < ofs_021_953A_0C
- D 0 - I - 0x00D4FC 03:94EC: 46 95     .byte < _общий_RTS ; 0D
tbl_94D2_hi:
- D 0 - I - 0x00D4E2 03:94D2: EE 94     .byte > ofs_021_94EE_00
- D 0 - I - 0x00D4E4 03:94D4: 2B 95     .byte > ofs_021_952B_01
- D 0 - I - 0x00D4E6 03:94D6: 3A 95     .byte > ofs_021_953A_02
- D 0 - I - 0x00D4E8 03:94D8: 2B 95     .byte > ofs_021_952B_03
- D 0 - I - 0x00D4EA 03:94DA: 3A 95     .byte > ofs_021_953A_04
- D 0 - I - 0x00D4EC 03:94DC: FC 94     .byte > ofs_021_94FC_05
- D 0 - I - 0x00D4EE 03:94DE: 04 95     .byte > ofs_021_9504_06
- D 0 - I - 0x00D4F0 03:94E0: 1C 95     .byte > ofs_021_951C_07
- D 0 - I - 0x00D4F2 03:94E2: 33 95     .byte > ofs_021_9533_08
- D 0 - I - 0x00D4F4 03:94E4: 20 95     .byte > ofs_021_9520_09
- D 0 - I - 0x00D4F6 03:94E6: 33 95     .byte > ofs_021_9533_0A
- D 0 - I - 0x00D4F8 03:94E8: 3A 95     .byte > ofs_021_953A_0B
- D 0 - I - 0x00D4FA 03:94EA: 3A 95     .byte > ofs_021_953A_0C
- D 0 - I - 0x00D4FC 03:94EC: 46 95     .byte > _общий_RTS ; 0D



ofs_021_94EE_00:
C - - J - - 0x00D4FE 03:94EE: A0 68     LDY #con_F97C_colors + $1A * $04
C - - - - - 0x00D500 03:94F0: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D503 03:94F3: A0 6C     LDY #con_F97C_colors + $1B * $04
C - - - - - 0x00D505 03:94F5: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D508 03:94F8: A0 70     LDY #con_F97C_colors + $1C * $04
C - - - - - 0x00D50A 03:94FA: D0 02     BNE bra_94FE    ; jmp
ofs_021_94FC_05:
C - - J - - 0x00D50C 03:94FC: A0 74     LDY #con_F97C_colors + $1D * $04
bra_94FE:
C - - - - - 0x00D50E 03:94FE: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
bra_9501:
loc_9501:
C D 0 - - - 0x00D511 03:9501: E6 8D     INC ram_событие_на_уровне
C - - - - - 0x00D513 03:9503: 60        RTS



ofs_021_9504_06:
C - - J - - 0x00D514 03:9504: A0 78     LDY #con_F97C_colors + $1E * $04
C - - - - - 0x00D516 03:9506: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D519 03:9509: A0 20     LDY #$20
C - - - - - 0x00D51B 03:950B: 20 30 FA  JSR sub_0x01FA40
C - - - - - 0x00D51E 03:950E: A0 7C     LDY #con_F97C_colors + $1F * $04
C - - - - - 0x00D520 03:9510: A9 5C     LDA #con_chr_bank + $5C
C - - - - - 0x00D522 03:9512: A2 5E     LDX #con_chr_bank + $5E
C - - - - - 0x00D524 03:9514: 8D F0 07  STA ram_bg_bank_1
bra_9517:
C - - - - - 0x00D527 03:9517: 8E F1 07  STX ram_bg_bank_2
C - - - - - 0x00D52A 03:951A: D0 E2     BNE bra_94FE    ; jmp



ofs_021_951C_07:
C - - J - - 0x00D52C 03:951C: A0 88     LDY #con_F97C_colors + $22 * $04
C - - - - - 0x00D52E 03:951E: D0 DE     BNE bra_94FE    ; jmp



ofs_021_9520_09:
C - - J - - 0x00D530 03:9520: A0 8C     LDY #con_F97C_colors + $23 * $04
C - - - - - 0x00D532 03:9522: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D535 03:9525: A0 90     LDY #con_F97C_colors + $24 * $04
C - - - - - 0x00D537 03:9527: A2 32     LDX #con_chr_bank + $32
C - - - - - 0x00D539 03:9529: D0 EC     BNE bra_9517    ; jmp



ofs_021_952B_01:
ofs_021_952B_03:
C - - J - - 0x00D53B 03:952B: A9 88     LDA #$88
C - - - - - 0x00D53D 03:952D: A0 00     LDY #$00
C - - - - - 0x00D53F 03:952F: 84 9F     STY ram_009F
C - - - - - 0x00D541 03:9531: F0 02     BEQ bra_9535    ; jmp



ofs_021_9533_08:
ofs_021_9533_0A:
C - - J - - 0x00D543 03:9533: A9 EE     LDA #$EE
bra_9535:
C - - - - - 0x00D545 03:9535: 85 98     STA ram_0098
C - - - - - 0x00D547 03:9537: 4C 01 95  JMP loc_9501



ofs_021_953A_02:
ofs_021_953A_04:
ofs_021_953A_0B:
ofs_021_953A_0C:
C - - J - - 0x00D54A 03:953A: A9 00     LDA #$00
C - - - - - 0x00D54C 03:953C: 85 98     STA ram_0098
C - - - - - 0x00D54E 03:953E: A9 C0     LDA #$C0
C - - - - - 0x00D550 03:9540: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00D552 03:9542: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00D554 03:9544: D0 BB     BNE bra_9501    ; jmp



ofs_044_0x00D557_02_area_3:
C - - J - - 0x00D557 03:9547: AD CD 03  LDA ram_03CD
C - - - - - 0x00D55A 03:954A: 30 1B     BMI bra_9567
C - - - - - 0x00D55C 03:954C: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00D55E 03:954E: 29 07     AND #$07
C - - - - - 0x00D560 03:9550: D0 15     BNE bra_9567
C - - - - - 0x00D562 03:9552: EE CD 03  INC ram_03CD
C - - - - - 0x00D565 03:9555: AC CD 03  LDY ram_03CD
C - - - - - 0x00D568 03:9558: C0 09     CPY #$09
C - - - - - 0x00D56A 03:955A: 90 02     BCC bra_955E_not_overflow
C - - - - - 0x00D56C 03:955C: A0 00     LDY #$00
bra_955E_not_overflow:
C - - - - - 0x00D56E 03:955E: 8C CD 03  STY ram_03CD
C - - - - - 0x00D571 03:9561: B9 6C 95  LDA tbl_956C_color,Y
C - - - - - 0x00D574 03:9564: 8D E3 03  STA ram_pal_buffer + $03
bra_9567:
C - - - - - 0x00D577 03:9567: A5 39     LDA ram_пауза
C - - - - - 0x00D579 03:9569: F0 0A     BEQ bra_9575
C - - - - - 0x00D57B 03:956B: 60        RTS



tbl_956C_color:
- D 0 - - - 0x00D57C 03:956C: 0F        .byte $0F   ; 00 
- D 0 - - - 0x00D57D 03:956D: 0F        .byte $0F   ; 01 
- D 0 - - - 0x00D57E 03:956E: 06        .byte $06   ; 02 
- D 0 - - - 0x00D57F 03:956F: 16        .byte $16   ; 03 
- D 0 - - - 0x00D580 03:9570: 26        .byte $26   ; 04 
- D 0 - - - 0x00D581 03:9571: 16        .byte $16   ; 05 
- D 0 - - - 0x00D582 03:9572: 06        .byte $06   ; 06 
- D 0 - - - 0x00D583 03:9573: 0F        .byte $0F   ; 07 
- D 0 - - - 0x00D584 03:9574: 0F        .byte $0F   ; 08



bra_9575:
C - - - - - 0x00D585 03:9575: A5 8C     LDA ram_008C
C - - - - - 0x00D587 03:9577: 0A        ASL
C - - - - - 0x00D588 03:9578: A8        TAY
C - - - - - 0x00D589 03:9579: B9 90 95  LDA tbl_9590,Y
C - - - - - 0x00D58C 03:957C: C5 63     CMP ram_0063
C - - - - - 0x00D58E 03:957E: 90 0B     BCC bra_958B
C - - - - - 0x00D590 03:9580: D0 0D     BNE bra_958F_RTS
C - - - - - 0x00D592 03:9582: B9 91 95  LDA tbl_9590 + $01,Y
C - - - - - 0x00D595 03:9585: C5 FD     CMP ram_scroll_X
C - - - - - 0x00D597 03:9587: F0 02     BEQ bra_958B
C - - - - - 0x00D599 03:9589: B0 04     BCS bra_958F_RTS
bra_958B:
C - - - - - 0x00D59B 03:958B: 20 9D 95  JSR sub_959D
C - - - - - 0x00D59E 03:958E: 18        CLC
bra_958F_RTS:
C - - - - - 0x00D59F 03:958F: 60        RTS



tbl_9590:
;                                              +---------- 
;                                              |    +----- scroll_X
;                                              |    |
- D 0 - - - 0x00D5A0 03:9590: 06        .byte $06, $00   ; 00 
- D 0 - - - 0x00D5A2 03:9592: 0C        .byte $0C, $00   ; 01 
- D 0 - - - 0x00D5A4 03:9594: 0E        .byte $0E, $00   ; 02 
- D 0 - - - 0x00D5A6 03:9596: 0E        .byte $0E, $02   ; 03 
- D 0 - - - 0x00D5A8 03:9598: 10        .byte $10, $00   ; 04 
- D 0 - - - 0x00D5AA 03:959A: 13        .byte $13, $00   ; 05 
- D 0 - - - 0x00D5AC 03:959C: FF        .byte $FF   ; 06 final



sub_959D:
C - - - - - 0x00D5AD 03:959D: A6 8C     LDX ram_008C
C - - - - - 0x00D5AF 03:959F: D0 0E     BNE bra_95AF
; 00 
C - - - - - 0x00D5B1 03:95A1: A9 10     LDA #con_chr_bank + $10
C - - - - - 0x00D5B3 03:95A3: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x00D5B6 03:95A6: A0 08     LDY #con_F97C_colors + $02 * $04
C - - - - - 0x00D5B8 03:95A8: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D5BB 03:95AB: A0 0C     LDY #con_F97C_colors + $03 * $04
C - - - - - 0x00D5BD 03:95AD: D0 0A     BNE bra_95B9    ; jmp
bra_95AF:
C - - - - - 0x00D5BF 03:95AF: CA        DEX
C - - - - - 0x00D5C0 03:95B0: D0 0D     BNE bra_95BF
; 01 
C - - - - - 0x00D5C2 03:95B2: A0 10     LDY #con_F97C_colors + $04 * $04
C - - - - - 0x00D5C4 03:95B4: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D5C7 03:95B7: A0 14     LDY #con_F97C_colors + $05 * $04
bra_95B9:
C - - - - - 0x00D5C9 03:95B9: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
bra_95BC:
C - - - - - 0x00D5CC 03:95BC: E6 8C     INC ram_008C
C - - - - - 0x00D5CE 03:95BE: 60        RTS
bra_95BF:
C - - - - - 0x00D5CF 03:95BF: CA        DEX
C - - - - - 0x00D5D0 03:95C0: D0 17     BNE bra_95D9
; 02 
C - - - - - 0x00D5D2 03:95C2: A9 01     LDA #$01
C - - - - - 0x00D5D4 03:95C4: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00D5D6 03:95C6: A9 12     LDA #con_chr_bank + $12
C - - - - - 0x00D5D8 03:95C8: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x00D5DB 03:95CB: A9 14     LDA #con_chr_bank + $14
C - - - - - 0x00D5DD 03:95CD: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x00D5E0 03:95D0: A0 18     LDY #con_F97C_colors + $06 * $04
C - - - - - 0x00D5E2 03:95D2: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D5E5 03:95D5: A0 1C     LDY #con_F97C_colors + $07 * $04
C - - - - - 0x00D5E7 03:95D7: D0 E0     BNE bra_95B9    ; jmp
bra_95D9:
C - - - - - 0x00D5E9 03:95D9: CA        DEX
C - - - - - 0x00D5EA 03:95DA: D0 0E     BNE bra_95EA
; 03 
C - - - - - 0x00D5EC 03:95DC: A9 10     LDA #con_chr_bank + $10
C - - - - - 0x00D5EE 03:95DE: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x00D5F1 03:95E1: A0 20     LDY #con_F97C_colors + $08 * $04
C - - - - - 0x00D5F3 03:95E3: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D5F6 03:95E6: A0 24     LDY #con_F97C_colors + $09 * $04
C - - - - - 0x00D5F8 03:95E8: D0 CF     BNE bra_95B9    ; jmp
bra_95EA:
C - - - - - 0x00D5FA 03:95EA: CA        DEX
C - - - - - 0x00D5FB 03:95EB: D0 09     BNE bra_95F6
; 04 
C - - - - - 0x00D5FD 03:95ED: A0 44     LDY #con_F97C_colors + $11 * $04
C - - - - - 0x00D5FF 03:95EF: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D602 03:95F2: A0 48     LDY #con_F97C_colors + $12 * $04
C - - - - - 0x00D604 03:95F4: D0 C3     BNE bra_95B9    ; jmp
bra_95F6:
C - - - - - 0x00D606 03:95F6: CA        DEX
C - - - - - 0x00D607 03:95F7: D0 06     BNE bra_95FF_RTS
; 05 
C - - - - - 0x00D609 03:95F9: A9 02     LDA #$02
C - - - - - 0x00D60B 03:95FB: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00D60D 03:95FD: D0 BD     BNE bra_95BC    ; jmp
bra_95FF_RTS:
- - - - - - 0x00D60F 03:95FF: 60        RTS



ofs_044_0x00D610_03_area_4:
C - - J - - 0x00D610 03:9600: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00D612 03:9602: 29 07     AND #$07
C - - - - - 0x00D614 03:9604: D0 15     BNE bra_961B
C - - - - - 0x00D616 03:9606: EE CD 03  INC ram_03CD
C - - - - - 0x00D619 03:9609: AC CD 03  LDY ram_03CD
C - - - - - 0x00D61C 03:960C: C0 09     CPY #$09
C - - - - - 0x00D61E 03:960E: 90 02     BCC bra_9612_not_overflow
C - - - - - 0x00D620 03:9610: A0 00     LDY #$00
bra_9612_not_overflow:
C - - - - - 0x00D622 03:9612: 8C CD 03  STY ram_03CD
C - - - - - 0x00D625 03:9615: B9 20 96  LDA tbl_9620_color,Y
C - - - - - 0x00D628 03:9618: 8D EF 03  STA ram_pal_buffer + $0F
bra_961B:
C - - - - - 0x00D62B 03:961B: A5 39     LDA ram_пауза
C - - - - - 0x00D62D 03:961D: F0 0A     BEQ bra_9629
C - - - - - 0x00D62F 03:961F: 60        RTS



tbl_9620_color:
- D 0 - - - 0x00D630 03:9620: 0F        .byte $0F   ; 00 
- D 0 - - - 0x00D631 03:9621: 0F        .byte $0F   ; 01 
- D 0 - - - 0x00D632 03:9622: 06        .byte $06   ; 02 
- D 0 - - - 0x00D633 03:9623: 16        .byte $16   ; 03 
- D 0 - - - 0x00D634 03:9624: 26        .byte $26   ; 04 
- D 0 - - - 0x00D635 03:9625: 16        .byte $16   ; 05 
- D 0 - - - 0x00D636 03:9626: 06        .byte $06   ; 06 
- D 0 - - - 0x00D637 03:9627: 0F        .byte $0F   ; 07 
- D 0 - - - 0x00D638 03:9628: 0F        .byte $0F   ; 08 



bra_9629:
C - - - - - 0x00D639 03:9629: 20 6F 96  JSR sub_966F
C - - - - - 0x00D63C 03:962C: A5 8C     LDA ram_008C
C - - - - - 0x00D63E 03:962E: 0A        ASL
C - - - - - 0x00D63F 03:962F: A8        TAY
C - - - - - 0x00D640 03:9630: B9 47 96  LDA tbl_9647,Y
C - - - - - 0x00D643 03:9633: C5 63     CMP ram_0063
C - - - - - 0x00D645 03:9635: 90 0B     BCC bra_9642
C - - - - - 0x00D647 03:9637: D0 0D     BNE bra_9646_RTS
C - - - - - 0x00D649 03:9639: B9 48 96  LDA tbl_9647 + $01,Y
C - - - - - 0x00D64C 03:963C: C5 FD     CMP ram_scroll_X
C - - - - - 0x00D64E 03:963E: F0 02     BEQ bra_9642
C - - - - - 0x00D650 03:9640: B0 04     BCS bra_9646_RTS
bra_9642:
C - - - - - 0x00D652 03:9642: 20 4E 96  JSR sub_964E
C - - - - - 0x00D655 03:9645: 18        CLC
bra_9646_RTS:
C - - - - - 0x00D656 03:9646: 60        RTS



tbl_9647:
;                                              +---------- 
;                                              |    +----- scroll_X
;                                              |    |
- D 0 - - - 0x00D657 03:9647: 02        .byte $02, $A0   ; 00 
- D 0 - - - 0x00D659 03:9649: 03        .byte $03, $00   ; 01 
- D 0 - - - 0x00D65B 03:964B: 03        .byte $03, $C0   ; 02 
- D 0 - - - 0x00D65D 03:964D: FF        .byte $FF   ; 03 final



sub_964E:
; 1путин опт
                                        LDY ram_008C
                                        LDA tbl_9653_lo,Y
                                        STA ram_0000
                                        LDA tbl_9653_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9653_lo:
- D 0 - I - 0x00D663 03:9653: 5B 96     .byte < ofs_022_965B_00
- D 0 - I - 0x00D665 03:9655: 61 96     .byte < ofs_022_9661_01
- D 0 - I - 0x00D667 03:9657: 68 96     .byte < ofs_022_9668_02
- - - - - - 0x00D669 03:9659: 6E 96     .byte < _общий_RTS ; 03
tbl_9653_hi:
- D 0 - I - 0x00D663 03:9653: 5B 96     .byte > ofs_022_965B_00
- D 0 - I - 0x00D665 03:9655: 61 96     .byte > ofs_022_9661_01
- D 0 - I - 0x00D667 03:9657: 68 96     .byte > ofs_022_9668_02
- - - - - - 0x00D669 03:9659: 6E 96     .byte > _общий_RTS ; 03



ofs_022_965B_00:
C - - J - - 0x00D66B 03:965B: A9 01     LDA #$01
C - - - - - 0x00D66D 03:965D: 85 6F     STA ram_006F
C - - - - - 0x00D66F 03:965F: D0 04     BNE bra_9665    ; jmp



ofs_022_9661_01:
C - - J - - 0x00D671 03:9661: A9 01     LDA #$01
C - - - - - 0x00D673 03:9663: 85 61     STA ram_0061_конфиг_уровня
bra_9665:
C - - - - - 0x00D675 03:9665: E6 8C     INC ram_008C
C - - - - - 0x00D677 03:9667: 60        RTS



ofs_022_9668_02:
C - - J - - 0x00D678 03:9668: A9 01     LDA #$01
C - - - - - 0x00D67A 03:966A: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00D67C 03:966C: D0 F7     BNE bra_9665    ; jmp



sub_966F:
C - - - - - 0x00D67F 03:966F: A5 8D     LDA ram_событие_на_уровне
C - - - - - 0x00D681 03:9671: 0A        ASL
C - - - - - 0x00D682 03:9672: A8        TAY
C - - - - - 0x00D683 03:9673: B9 8A 96  LDA tbl_968A,Y
C - - - - - 0x00D686 03:9676: C5 82     CMP ram_0082_конфиг_уровня
C - - - - - 0x00D688 03:9678: 90 0F     BCC bra_9689_RTS
C - - - - - 0x00D68A 03:967A: F0 02     BEQ bra_967E
C - - - - - 0x00D68C 03:967C: B0 07     BCS bra_9685    ; jmp
bra_967E:
C - - - - - 0x00D68E 03:967E: B9 8B 96  LDA tbl_968A + $01,Y
C - - - - - 0x00D691 03:9681: C5 FC     CMP ram_scroll_Y
C - - - - - 0x00D693 03:9683: 90 04     BCC bra_9689_RTS
bra_9685:
C - - - - - 0x00D695 03:9685: 20 9D 96  JSR sub_969D
C - - - - - 0x00D698 03:9688: 18        CLC
bra_9689_RTS:
C - - - - - 0x00D699 03:9689: 60        RTS



tbl_968A:
;                                              +---------- 
;                                              |    +----- scroll_Y
;                                              |    |
- D 0 - - - 0x00D69A 03:968A: 0B        .byte $0B, $E0   ; 00 
- D 0 - - - 0x00D69C 03:968C: 09        .byte $09, $30   ; 01 
- D 0 - - - 0x00D69E 03:968E: 09        .byte $09, $00   ; 02 
- D 0 - - - 0x00D6A0 03:9690: 08        .byte $08, $40   ; 03 
- D 0 - - - 0x00D6A2 03:9692: 06        .byte $06, $00   ; 04 
- D 0 - - - 0x00D6A4 03:9694: 05        .byte $05, $40   ; 05 
- D 0 - - - 0x00D6A6 03:9696: 04        .byte $04, $C0   ; 06 
- D 0 - - - 0x00D6A8 03:9698: 02        .byte $02, $D0   ; 07 
- D 0 - - - 0x00D6AA 03:969A: 01        .byte $01, $00   ; 08 
- D 0 - - - 0x00D6AC 03:969C: FF        .byte $FF   ; 09 final



sub_969D:
; 1путин опт
                                        LDY ram_событие_на_уровне
                                        LDA tbl_96A2_lo,Y
                                        STA ram_0000
                                        LDA tbl_96A2_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_96A2_lo:
- D 0 - I - 0x00D6B2 03:96A2: B6 96     .byte < ofs_023_96B6_00
- D 0 - I - 0x00D6B4 03:96A4: BD 96     .byte < ofs_023_96BD_01
- D 0 - I - 0x00D6B6 03:96A6: C3 96     .byte < ofs_023_96C3_02
- D 0 - I - 0x00D6B8 03:96A8: CF 96     .byte < ofs_023_96CF_03
- D 0 - I - 0x00D6BA 03:96AA: DD 96     .byte < ofs_023_96DD_04
- D 0 - I - 0x00D6BC 03:96AC: CF 96     .byte < ofs_023_96CF_05
- D 0 - I - 0x00D6BE 03:96AE: E7 96     .byte < ofs_023_96E7_06
- D 0 - I - 0x00D6C0 03:96B0: EB 96     .byte < ofs_023_96EB_07
- D 0 - I - 0x00D6C2 03:96B2: DD 96     .byte < ofs_023_96DD_08
- D 0 - I - 0x00D6C4 03:96B4: F2 96     .byte < _общий_RTS ; 09
tbl_96A2_hi:
- D 0 - I - 0x00D6B2 03:96A2: B6 96     .byte > ofs_023_96B6_00
- D 0 - I - 0x00D6B4 03:96A4: BD 96     .byte > ofs_023_96BD_01
- D 0 - I - 0x00D6B6 03:96A6: C3 96     .byte > ofs_023_96C3_02
- D 0 - I - 0x00D6B8 03:96A8: CF 96     .byte > ofs_023_96CF_03
- D 0 - I - 0x00D6BA 03:96AA: DD 96     .byte > ofs_023_96DD_04
- D 0 - I - 0x00D6BC 03:96AC: CF 96     .byte > ofs_023_96CF_05
- D 0 - I - 0x00D6BE 03:96AE: E7 96     .byte > ofs_023_96E7_06
- D 0 - I - 0x00D6C0 03:96B0: EB 96     .byte > ofs_023_96EB_07
- D 0 - I - 0x00D6C2 03:96B2: DD 96     .byte > ofs_023_96DD_08
- D 0 - I - 0x00D6C4 03:96B4: F2 96     .byte > _общий_RTS ; 09



ofs_023_96B6_00:
; 1путин: 4й лвл - начало подъема, выбор банка
                                        LDY ram_option_регион
C - - J - - 0x00D6C6 03:96B6: A9 1B     LDA tbl_96BC_chr_bank,Y
C - - - - - 0x00D6C8 03:96B8: 8D F5 07  STA ram_spr_bank_4
C - - - - - 0x00D6CB 03:96BB: D0 32     BNE bra_96EF    ; jmp


tbl_96BC_chr_bank:
                                        .byte con_chr_bank + $1B    ; 00 US 
                                        .byte con_chr_bank + $9D    ; 01 EU


ofs_023_96BD_01:
C - - J - - 0x00D6CD 03:96BD: A9 EE     LDA #$EE
C - - - - - 0x00D6CF 03:96BF: 85 98     STA ram_0098
C - - - - - 0x00D6D1 03:96C1: D0 2C     BNE bra_96EF    ; jmp



ofs_023_96C3_02:
C - - J - - 0x00D6D3 03:96C3: A9 00     LDA #$00
C - - - - - 0x00D6D5 03:96C5: 85 98     STA ram_0098
C - - - - - 0x00D6D7 03:96C7: A9 C0     LDA #$C0
C - - - - - 0x00D6D9 03:96C9: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00D6DB 03:96CB: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00D6DD 03:96CD: D0 20     BNE bra_96EF    ; jmp



ofs_023_96CF_03:
ofs_023_96CF_05:
C - - J - - 0x00D6DF 03:96CF: A9 80     LDA #$80
C - - - - - 0x00D6E1 03:96D1: 85 7E     STA ram_007E
C - - - - - 0x00D6E3 03:96D3: A9 00     LDA #$00
C - - - - - 0x00D6E5 03:96D5: 85 7F     STA ram_007F
C - - - - - 0x00D6E7 03:96D7: A9 FF     LDA #$FF
C - - - - - 0x00D6E9 03:96D9: 85 80     STA ram_номер_анимации_логотипа
C - - - - - 0x00D6EB 03:96DB: D0 12     BNE bra_96EF    ; jmp



ofs_023_96DD_04:
ofs_023_96DD_08:
C - - J - - 0x00D6ED 03:96DD: A9 C0     LDA #$C0
C - - - - - 0x00D6EF 03:96DF: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00D6F1 03:96E1: A9 00     LDA #$00
C - - - - - 0x00D6F3 03:96E3: 85 7E     STA ram_007E
C - - - - - 0x00D6F5 03:96E5: F0 08     BEQ bra_96EF    ; jmp



ofs_023_96E7_06:
C - - J - - 0x00D6F7 03:96E7: A9 01     LDA #$01
C - - - - - 0x00D6F9 03:96E9: D0 02     BNE bra_96ED    ; jmp



ofs_023_96EB_07:
C - - J - - 0x00D6FB 03:96EB: A9 00     LDA #$00
bra_96ED:
C - - - - - 0x00D6FD 03:96ED: 85 9F     STA ram_009F
bra_96EF:
C - - - - - 0x00D6FF 03:96EF: E6 8D     INC ram_событие_на_уровне
C - - - - - 0x00D701 03:96F1: 60        RTS



ofs_044_0x00D703_04_area_5:
C - - J - - 0x00D703 03:96F3: AD CD 03  LDA ram_03CD
C - - - - - 0x00D706 03:96F6: 30 1C     BMI bra_9714
C - - - - - 0x00D708 03:96F8: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00D70A 03:96FA: 29 07     AND #$07
C - - - - - 0x00D70C 03:96FC: D0 16     BNE bra_9714
C - - - - - 0x00D70E 03:96FE: EE CD 03  INC ram_03CD
C - - - - - 0x00D711 03:9701: AC CD 03  LDY ram_03CD
C - - - - - 0x00D714 03:9704: C0 06     CPY #$06
C - - - - - 0x00D716 03:9706: 90 02     BCC bra_970A
C - - - - - 0x00D718 03:9708: A0 00     LDY #$00
bra_970A:
C - - - - - 0x00D71A 03:970A: 8C CD 03  STY ram_03CD
C - - - - - 0x00D71D 03:970D: B9 4E 97  LDA tbl_974E,Y
C - - - - - 0x00D720 03:9710: A8        TAY
C - - - - - 0x00D721 03:9711: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
bra_9714:
C - - - - - 0x00D724 03:9714: AD CF 03  LDA ram_03CF
C - - - - - 0x00D727 03:9717: 30 30     BMI bra_9749
C - - - - - 0x00D729 03:9719: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00D72B 03:971B: 29 03     AND #$03
C - - - - - 0x00D72D 03:971D: D0 2A     BNE bra_9749
C - - - - - 0x00D72F 03:971F: EE CF 03  INC ram_03CF
C - - - - - 0x00D732 03:9722: AD CF 03  LDA ram_03CF
C - - - - - 0x00D735 03:9725: 29 40     AND #$40
C - - - - - 0x00D737 03:9727: 85 00     STA ram_0000
C - - - - - 0x00D739 03:9729: AD CF 03  LDA ram_03CF
C - - - - - 0x00D73C 03:972C: 29 3F     AND #$3F
C - - - - - 0x00D73E 03:972E: C9 09     CMP #$09
C - - - - - 0x00D740 03:9730: 90 02     BCC bra_9734_not_overflow
C - - - - - 0x00D742 03:9732: A9 00     LDA #$00
bra_9734_not_overflow:
C - - - - - 0x00D744 03:9734: A8        TAY
C - - - - - 0x00D745 03:9735: 05 00     ORA ram_0000
C - - - - - 0x00D747 03:9737: 8D CF 03  STA ram_03CF
C - - - - - 0x00D74A 03:973A: 0A        ASL
C - - - - - 0x00D74B 03:973B: 0A        ASL
C - - - - - 0x00D74C 03:973C: B9 54 97  LDA tbl_9754_color,Y
C - - - - - 0x00D74F 03:973F: B0 05     BCS bra_9746
C - - - - - 0x00D751 03:9741: 8D EF 03  STA ram_pal_buffer + $0F
C - - - - - 0x00D754 03:9744: 90 03     BCC bra_9749    ; jmp
bra_9746:
C - - - - - 0x00D756 03:9746: 8D EB 03  STA ram_pal_buffer + $0B
bra_9749:
C - - - - - 0x00D759 03:9749: A5 39     LDA ram_пауза
C - - - - - 0x00D75B 03:974B: F0 10     BEQ bra_975D_игра
C - - - - - 0x00D75D 03:974D: 60        RTS



tbl_974E:
- D 0 - - - 0x00D75E 03:974E: 38        .byte con_F97C_colors + $0E * $04   ; 
- D 0 - - - 0x00D75F 03:974F: 3C        .byte con_F97C_colors + $0F * $04   ; 
- D 0 - - - 0x00D760 03:9750: 40        .byte con_F97C_colors + $10 * $04   ; 
- D 0 - - - 0x00D761 03:9751: 40        .byte con_F97C_colors + $10 * $04   ; 
- D 0 - - - 0x00D762 03:9752: 3C        .byte con_F97C_colors + $0F * $04   ; 
- D 0 - - - 0x00D763 03:9753: 38        .byte con_F97C_colors + $0E * $04   ; 



tbl_9754_color:
- D 0 - - - 0x00D764 03:9754: 0F        .byte $0F   ; 00 
- D 0 - - - 0x00D765 03:9755: 0F        .byte $0F   ; 01 
- D 0 - - - 0x00D766 03:9756: 06        .byte $06   ; 02 
- D 0 - - - 0x00D767 03:9757: 16        .byte $16   ; 03 
- D 0 - - - 0x00D768 03:9758: 26        .byte $26   ; 04 
- D 0 - - - 0x00D769 03:9759: 16        .byte $16   ; 05 
- D 0 - - - 0x00D76A 03:975A: 06        .byte $06   ; 06 
- D 0 - - - 0x00D76B 03:975B: 0F        .byte $0F   ; 07 
- D 0 - - - 0x00D76C 03:975C: 0F        .byte $0F   ; 08 



bra_975D_игра:
C - - - - - 0x00D76D 03:975D: 20 E1 97  JSR sub_97E1
C - - - - - 0x00D770 03:9760: A5 61     LDA ram_0061_конфиг_уровня
C - - - - - 0x00D772 03:9762: D0 1A     BNE bra_977E_RTS
C - - - - - 0x00D774 03:9764: A5 8C     LDA ram_008C
C - - - - - 0x00D776 03:9766: 0A        ASL
C - - - - - 0x00D777 03:9767: A8        TAY
C - - - - - 0x00D778 03:9768: B9 7F 97  LDA tbl_977F,Y
C - - - - - 0x00D77B 03:976B: C5 63     CMP ram_0063
C - - - - - 0x00D77D 03:976D: 90 0B     BCC bra_977A
C - - - - - 0x00D77F 03:976F: D0 0D     BNE bra_977E_RTS
C - - - - - 0x00D781 03:9771: B9 80 97  LDA tbl_977F + $01,Y
C - - - - - 0x00D784 03:9774: C5 FD     CMP ram_scroll_X
C - - - - - 0x00D786 03:9776: F0 02     BEQ bra_977A
C - - - - - 0x00D788 03:9778: B0 04     BCS bra_977E_RTS    ; jmp
bra_977A:
C - - - - - 0x00D78A 03:977A: 20 8A 97  JSR sub_978A
C - - - - - 0x00D78D 03:977D: 18        CLC
bra_977E_RTS:
C - - - - - 0x00D78E 03:977E: 60        RTS



tbl_977F:
;                                              +---------- 
;                                              |    +----- scroll_X
;                                              |    |
- D 0 - - - 0x00D78F 03:977F: 00        .byte $00, $02   ; 00 
- D 0 - - - 0x00D791 03:9781: 01        .byte $01, $00   ; 01 
- D 0 - - - 0x00D793 03:9783: 01        .byte $01, $80   ; 02 
- D 0 - - - 0x00D795 03:9785: 05        .byte $05, $00   ; 03 
- D 0 - - - 0x00D797 03:9787: 05        .byte $05, $E0   ; 04 
- - - - - - 0x00D799 03:9789: FF        .byte $FF   ; 05 final



sub_978A:
; 1путин опт
                                        LDY ram_008C
                                        LDA tbl_978F_lo,Y
                                        STA ram_0000
                                        LDA tbl_978F_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_978F_lo:
- D 0 - I - 0x00D79F 03:978F: 9B 97     .byte < ofs_024_979B_00
- D 0 - I - 0x00D7A1 03:9791: B2 97     .byte < ofs_024_97B2_01
- D 0 - I - 0x00D7A3 03:9793: BB 97     .byte < ofs_024_97BB_02
- D 0 - I - 0x00D7A5 03:9795: C3 97     .byte < ofs_024_97C3_03
- D 0 - I - 0x00D7A7 03:9797: DA 97     .byte < ofs_024_97DA_04
- - - - - - 0x00D7A9 03:9799: E0 97     .byte < _общий_RTS ; 05
tbl_978F_hi:
- D 0 - I - 0x00D79F 03:978F: 9B 97     .byte > ofs_024_979B_00
- D 0 - I - 0x00D7A1 03:9791: B2 97     .byte > ofs_024_97B2_01
- D 0 - I - 0x00D7A3 03:9793: BB 97     .byte > ofs_024_97BB_02
- D 0 - I - 0x00D7A5 03:9795: C3 97     .byte > ofs_024_97C3_03
- D 0 - I - 0x00D7A7 03:9797: DA 97     .byte > ofs_024_97DA_04
- - - - - - 0x00D7A9 03:9799: E0 97     .byte > _общий_RTS ; 05



ofs_024_979B_00:
C - - J - - 0x00D7AB 03:979B: A0 00     LDY #$00
C - - - - - 0x00D7AD 03:979D: 20 30 FA  JSR sub_0x01FA40
C - - - - - 0x00D7B0 03:97A0: A9 20     LDA #con_chr_bank + $20
C - - - - - 0x00D7B2 03:97A2: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x00D7B5 03:97A5: A9 22     LDA #con_chr_bank + $22
C - - - - - 0x00D7B7 03:97A7: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x00D7BA 03:97AA: A0 28     LDY #con_F97C_colors + $0A * $04
bra_97AC:
C - - - - - 0x00D7BC 03:97AC: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
bra_97AF:
C - - - - - 0x00D7BF 03:97AF: E6 8C     INC ram_008C
C - - - - - 0x00D7C1 03:97B1: 60        RTS



ofs_024_97B2_01:
C - - J - - 0x00D7C2 03:97B2: A9 FF     LDA #$FF
C - - - - - 0x00D7C4 03:97B4: 8D CD 03  STA ram_03CD
C - - - - - 0x00D7C7 03:97B7: A0 2C     LDY #con_F97C_colors + $0B * $04
C - - - - - 0x00D7C9 03:97B9: D0 F1     BNE bra_97AC    ; jmp



ofs_024_97BB_02:
C - - J - - 0x00D7CB 03:97BB: A9 80     LDA #$80
bra_97BD:
C - - - - - 0x00D7CD 03:97BD: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00D7CF 03:97BF: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00D7D1 03:97C1: D0 EC     BNE bra_97AF    ; jmp



ofs_024_97C3_03:
C - - J - - 0x00D7D3 03:97C3: A9 40     LDA #$40
C - - - - - 0x00D7D5 03:97C5: 8D CF 03  STA ram_03CF
C - - - - - 0x00D7D8 03:97C8: A0 A4     LDY #con_F97C_colors + $29 * $04
C - - - - - 0x00D7DA 03:97CA: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D7DD 03:97CD: A0 A8     LDY #con_F97C_colors + $2A * $04
C - - - - - 0x00D7DF 03:97CF: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D7E2 03:97D2: A9 02     LDA #$02
C - - - - - 0x00D7E4 03:97D4: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00D7E6 03:97D6: A9 C0     LDA #$C0
C - - - - - 0x00D7E8 03:97D8: D0 E3     BNE bra_97BD    ; jmp



ofs_024_97DA_04:
C - - J - - 0x00D7EA 03:97DA: A9 01     LDA #$01
C - - - - - 0x00D7EC 03:97DC: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00D7EE 03:97DE: D0 CF     BNE bra_97AF    ; jmp



sub_97E1:
C - - - - - 0x00D7F1 03:97E1: A5 8D     LDA ram_событие_на_уровне
C - - - - - 0x00D7F3 03:97E3: 0A        ASL
C - - - - - 0x00D7F4 03:97E4: A8        TAY
C - - - - - 0x00D7F5 03:97E5: B9 FC 97  LDA tbl_97FC,Y
C - - - - - 0x00D7F8 03:97E8: C5 82     CMP ram_0082_конфиг_уровня
C - - - - - 0x00D7FA 03:97EA: 90 0F     BCC bra_97FB_RTS
C - - - - - 0x00D7FC 03:97EC: F0 02     BEQ bra_97F0
C - - - - - 0x00D7FE 03:97EE: B0 07     BCS bra_97F7    ; jmp
bra_97F0:
C - - - - - 0x00D800 03:97F0: B9 FD 97  LDA tbl_97FC + $01,Y
C - - - - - 0x00D803 03:97F3: C5 FC     CMP ram_scroll_Y
C - - - - - 0x00D805 03:97F5: 90 04     BCC bra_97FB_RTS
bra_97F7:
C - - - - - 0x00D807 03:97F7: 20 01 98  JSR sub_9801
C - - - - - 0x00D80A 03:97FA: 18        CLC
bra_97FB_RTS:
C - - - - - 0x00D80B 03:97FB: 60        RTS



tbl_97FC:
;                                              +---------- 
;                                              |    +----- scroll_Y
;                                              |    |
- D 0 - - - 0x00D80C 03:97FC: 01        .byte $01, $00   ; 00 
- D 0 - - - 0x00D80E 03:97FE: 00        .byte $00, $80   ; 01 
- D 0 - - - 0x00D810 03:9800: FF        .byte $FF   ; 02 final



sub_9801:
C - - - - - 0x00D811 03:9801: A6 8D     LDX ram_событие_на_уровне
C - - - - - 0x00D813 03:9803: D0 07     BNE bra_980C
C - - - - - 0x00D815 03:9805: A9 FF     LDA #$FF
C - - - - - 0x00D817 03:9807: 8D CF 03  STA ram_03CF
C - - - - - 0x00D81A 03:980A: D0 0A     BNE bra_9816    ; jmp
bra_980C:
C - - - - - 0x00D81C 03:980C: CA        DEX
C - - - - - 0x00D81D 03:980D: D0 0A     BNE bra_9818_RTS
C - - - - - 0x00D81F 03:980F: 20 90 F1  JSR sub_0x01F1A0
C - - - - - 0x00D822 03:9812: A9 00     LDA #$00
C - - - - - 0x00D824 03:9814: 85 61     STA ram_0061_конфиг_уровня
bra_9816:
C - - - - - 0x00D826 03:9816: E6 8D     INC ram_событие_на_уровне
bra_9818_RTS:
C - - - - - 0x00D828 03:9818: 60        RTS



ofs_044_0x00D82A_05_area_6:
C - - J - - 0x00D82A 03:981A: AC CD 03  LDY ram_03CD
C - - - - - 0x00D82D 03:981D: 30 1B     BMI bra_983A
C - - - - - 0x00D82F 03:981F: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00D831 03:9821: 29 0F     AND #$0F
C - - - - - 0x00D833 03:9823: D0 15     BNE bra_983A
C - - - - - 0x00D835 03:9825: EE CD 03  INC ram_03CD
C - - - - - 0x00D838 03:9828: AC CD 03  LDY ram_03CD
C - - - - - 0x00D83B 03:982B: B9 5E 98  LDA tbl_985F - $01,Y
C - - - - - 0x00D83E 03:982E: 8D E7 03  STA ram_pal_buffer + $07
C - - - - - 0x00D841 03:9831: C0 04     CPY #$04
C - - - - - 0x00D843 03:9833: 90 05     BCC bra_983A
C - - - - - 0x00D845 03:9835: A9 FF     LDA #$FF
C - - - - - 0x00D847 03:9837: 8D CD 03  STA ram_03CD
bra_983A:
C - - - - - 0x00D84A 03:983A: AD CF 03  LDA ram_03CF
C - - - - - 0x00D84D 03:983D: 30 1B     BMI bra_985A
C - - - - - 0x00D84F 03:983F: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00D851 03:9841: 29 07     AND #$07
C - - - - - 0x00D853 03:9843: D0 15     BNE bra_985A
C - - - - - 0x00D855 03:9845: EE CF 03  INC ram_03CF
C - - - - - 0x00D858 03:9848: AC CF 03  LDY ram_03CF
C - - - - - 0x00D85B 03:984B: C0 07     CPY #$07
C - - - - - 0x00D85D 03:984D: 90 02     BCC bra_9851_not_overflow
C - - - - - 0x00D85F 03:984F: A0 00     LDY #$00
bra_9851_not_overflow:
C - - - - - 0x00D861 03:9851: 8C CF 03  STY ram_03CF
C - - - - - 0x00D864 03:9854: B9 63 98  LDA tbl_9863_color,Y
C - - - - - 0x00D867 03:9857: 8D EF 03  STA ram_pal_buffer + $0F
bra_985A:
C - - - - - 0x00D86A 03:985A: A5 39     LDA ram_пауза
C - - - - - 0x00D86C 03:985C: F0 0C     BEQ bra_986A
C - - - - - 0x00D86E 03:985E: 60        RTS



tbl_985F:
- D 0 - - - 0x00D86F 03:985F: 03        .byte $03   ; 01 
- D 0 - - - 0x00D870 03:9860: 04        .byte $04   ; 02 
- D 0 - - - 0x00D871 03:9861: 05        .byte $05   ; 03 
- D 0 - - - 0x00D872 03:9862: 06        .byte $06   ; 04 



tbl_9863_color:
- D 0 - - - 0x00D873 03:9863: 0F        .byte $0F   ; 00 
- D 0 - - - 0x00D874 03:9864: 06        .byte $06   ; 01 
- D 0 - - - 0x00D875 03:9865: 16        .byte $16   ; 02 
- D 0 - - - 0x00D876 03:9866: 26        .byte $26   ; 03 
- D 0 - - - 0x00D877 03:9867: 16        .byte $16   ; 04 
- D 0 - - - 0x00D878 03:9868: 06        .byte $06   ; 05 
- D 0 - - - 0x00D879 03:9869: 0F        .byte $0F   ; 06 



bra_986A:
C - - - - - 0x00D87A 03:986A: A5 8D     LDA ram_событие_на_уровне
C - - - - - 0x00D87C 03:986C: 0A        ASL
C - - - - - 0x00D87D 03:986D: A8        TAY
C - - - - - 0x00D87E 03:986E: B9 85 98  LDA tbl_9885,Y
C - - - - - 0x00D881 03:9871: C5 82     CMP ram_0082_конфиг_уровня
C - - - - - 0x00D883 03:9873: 90 0F     BCC bra_9884_RTS
C - - - - - 0x00D885 03:9875: F0 02     BEQ bra_9879
C - - - - - 0x00D887 03:9877: B0 07     BCS bra_9880    ; jmp
bra_9879:
C - - - - - 0x00D889 03:9879: B9 86 98  LDA tbl_9885 + $01,Y
C - - - - - 0x00D88C 03:987C: C5 FC     CMP ram_scroll_Y
C - - - - - 0x00D88E 03:987E: 90 04     BCC bra_9884_RTS
bra_9880:
C - - - - - 0x00D890 03:9880: 20 94 98  JSR sub_9894
C - - - - - 0x00D893 03:9883: 18        CLC
bra_9884_RTS:
C - - - - - 0x00D894 03:9884: 60        RTS



tbl_9885:
;                                              +---------- 
;                                              |    +----- scroll_Y
;                                              |    |
- D 0 - - - 0x00D895 03:9885: 09        .byte $09, $00   ; 00 
- D 0 - - - 0x00D897 03:9887: 06        .byte $06, $00   ; 01 
- D 0 - - - 0x00D899 03:9889: 04        .byte $04, $00   ; 02 
- D 0 - - - 0x00D89B 03:988B: 03        .byte $03, $C0   ; 03 
- D 0 - - - 0x00D89D 03:988D: 02        .byte $02, $C0   ; 04 
- D 0 - - - 0x00D89F 03:988F: 01        .byte $01, $60   ; 05 
- D 0 - - - 0x00D8A1 03:9891: 01        .byte $01, $00   ; 06 
- D 0 - - - 0x00D8A3 03:9893: FF        .byte $FF   ; 07 final



sub_9894:
; 1путин опт
                                        LDY ram_событие_на_уровне
                                        LDA tbl_9899_lo,Y
                                        STA ram_0000
                                        LDA tbl_9899_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9899_lo:
- D 0 - I - 0x00D8A9 03:9899: A9 98     .byte < ofs_025_98A9_00
- D 0 - I - 0x00D8AB 03:989B: B1 98     .byte < ofs_025_98B1_01
- D 0 - I - 0x00D8AD 03:989D: B8 98     .byte < ofs_025_98B8_02
- D 0 - I - 0x00D8AF 03:989F: C0 98     .byte < ofs_025_98C0_03
- D 0 - I - 0x00D8B1 03:98A1: C7 98     .byte < ofs_025_98C7_04
- D 0 - I - 0x00D8B3 03:98A3: CB 98     .byte < ofs_025_98CB_05
- D 0 - I - 0x00D8B5 03:98A5: D1 98     .byte < ofs_025_98D1_06
- D 0 - I - 0x00D8B7 03:98A7: E2 98     .byte < _общий_RTS ; 07
tbl_9899_hi:
- D 0 - I - 0x00D8A9 03:9899: A9 98     .byte > ofs_025_98A9_00
- D 0 - I - 0x00D8AB 03:989B: B1 98     .byte > ofs_025_98B1_01
- D 0 - I - 0x00D8AD 03:989D: B8 98     .byte > ofs_025_98B8_02
- D 0 - I - 0x00D8AF 03:989F: C0 98     .byte > ofs_025_98C0_03
- D 0 - I - 0x00D8B1 03:98A1: C7 98     .byte > ofs_025_98C7_04
- D 0 - I - 0x00D8B3 03:98A3: CB 98     .byte > ofs_025_98CB_05
- D 0 - I - 0x00D8B5 03:98A5: D1 98     .byte > ofs_025_98D1_06
- D 0 - I - 0x00D8B7 03:98A7: E2 98     .byte > _общий_RTS ; 07



ofs_025_98A9_00:
C - - J - - 0x00D8B9 03:98A9: A0 94     LDY #con_F97C_colors + $25 * $04
C - - - - - 0x00D8BB 03:98AB: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
bra_98AE:
loc_98AE:
C D 0 - - - 0x00D8BE 03:98AE: E6 8D     INC ram_событие_на_уровне
C - - - - - 0x00D8C0 03:98B0: 60        RTS



ofs_025_98B1_01:
C - - J - - 0x00D8C1 03:98B1: A9 52     LDA #con_chr_bank + $52
C - - - - - 0x00D8C3 03:98B3: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x00D8C6 03:98B6: D0 F6     BNE bra_98AE    ; jmp



ofs_025_98B8_02:
C - - J - - 0x00D8C8 03:98B8: A0 30     LDY #$30
C - - - - - 0x00D8CA 03:98BA: 20 30 FA  JSR sub_0x01FA40
C - - - - - 0x00D8CD 03:98BD: 4C AE 98  JMP loc_98AE



ofs_025_98C0_03:
C - - J - - 0x00D8D0 03:98C0: A9 00     LDA #$00
C - - - - - 0x00D8D2 03:98C2: 8D CD 03  STA ram_03CD
C - - - - - 0x00D8D5 03:98C5: F0 E7     BEQ bra_98AE    ; jmp



ofs_025_98C7_04:
C - - J - - 0x00D8D7 03:98C7: A9 70     LDA #$70
C - - - - - 0x00D8D9 03:98C9: D0 02     BNE bra_98CD    ; jmp



ofs_025_98CB_05:
C - - J - - 0x00D8DB 03:98CB: A9 EE     LDA #$EE
bra_98CD:
C - - - - - 0x00D8DD 03:98CD: 85 98     STA ram_0098
C - - - - - 0x00D8DF 03:98CF: D0 DD     BNE bra_98AE    ; jmp



ofs_025_98D1_06:
C - - J - - 0x00D8E1 03:98D1: A0 98     LDY #con_F97C_colors + $26 * $04
C - - - - - 0x00D8E3 03:98D3: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D8E6 03:98D6: A9 00     LDA #$00
C - - - - - 0x00D8E8 03:98D8: 85 98     STA ram_0098
C - - - - - 0x00D8EA 03:98DA: A9 C0     LDA #$C0
C - - - - - 0x00D8EC 03:98DC: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00D8EE 03:98DE: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00D8F0 03:98E0: D0 CC     BNE bra_98AE    ; jmp



ofs_044_0x00D8F3_06_area_7:
C - - J - - 0x00D8F3 03:98E3: A5 39     LDA ram_пауза
C - - - - - 0x00D8F5 03:98E5: F0 01     BEQ bra_98E8
C - - - - - 0x00D8F7 03:98E7: 60        RTS
bra_98E8:
C - - - - - 0x00D8F8 03:98E8: A5 8D     LDA ram_событие_на_уровне
C - - - - - 0x00D8FA 03:98EA: 0A        ASL
C - - - - - 0x00D8FB 03:98EB: A8        TAY
C - - - - - 0x00D8FC 03:98EC: B9 01 99  LDA tbl_9901,Y
C - - - - - 0x00D8FF 03:98EF: C5 82     CMP ram_0082_конфиг_уровня
C - - - - - 0x00D901 03:98F1: 90 09     BCC bra_98FC
C - - - - - 0x00D903 03:98F3: D0 0B     BNE bra_9900_RTS
C - - - - - 0x00D905 03:98F5: B9 02 99  LDA tbl_9901 + $01,Y
C - - - - - 0x00D908 03:98F8: C5 FC     CMP ram_scroll_Y
C - - - - - 0x00D90A 03:98FA: B0 04     BCS bra_9900_RTS
bra_98FC:
C - - - - - 0x00D90C 03:98FC: 20 0C 99  JSR sub_990C
C - - - - - 0x00D90F 03:98FF: 18        CLC
bra_9900_RTS:
C - - - - - 0x00D910 03:9900: 60        RTS



tbl_9901:
;                                              +---------- 
;                                              |    +----- scroll_Y
;                                              |    |
- D 0 - - - 0x00D911 03:9901: 00        .byte $00, $10   ; 00 
- D 0 - - - 0x00D913 03:9903: 05        .byte $05, $00   ; 01 
- D 0 - - - 0x00D915 03:9905: 08        .byte $08, $00   ; 02 
- D 0 - - - 0x00D917 03:9907: 0C        .byte $0C, $00   ; 03 
- D 0 - - - 0x00D919 03:9909: 0C        .byte $0C, $D8   ; 04 
- D 0 - - - 0x00D91B 03:990B: FF        .byte $FF   ; 05 final



sub_990C:
C - - - - - 0x00D91C 03:990C: A6 8D     LDX ram_событие_на_уровне
C - - - - - 0x00D91E 03:990E: D0 0C     BNE bra_991C
C - - - - - 0x00D920 03:9910: A9 33     LDA #$33
C - - - - - 0x00D922 03:9912: A0 7F     LDY #$7F
bra_9914_loop:
C - - - - - 0x00D924 03:9914: 99 80 04  STA ram_0480,Y
C - - - - - 0x00D927 03:9917: 88        DEY
C - - - - - 0x00D928 03:9918: 10 FA     BPL bra_9914_loop
C - - - - - 0x00D92A 03:991A: 30 0D     BMI bra_9929    ; jmp
bra_991C:
C - - - - - 0x00D92C 03:991C: CA        DEX
C - - - - - 0x00D92D 03:991D: D0 0D     BNE bra_992C
C - - - - - 0x00D92F 03:991F: A9 28     LDA #con_chr_bank + $28
C - - - - - 0x00D931 03:9921: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x00D934 03:9924: A0 30     LDY #con_F97C_colors + $0C * $04
bra_9926:
C - - - - - 0x00D936 03:9926: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
bra_9929:
C - - - - - 0x00D939 03:9929: E6 8D     INC ram_событие_на_уровне
C - - - - - 0x00D93B 03:992B: 60        RTS
bra_992C:
C - - - - - 0x00D93C 03:992C: CA        DEX
C - - - - - 0x00D93D 03:992D: D0 0E     BNE bra_993D
C - - - - - 0x00D93F 03:992F: A9 2A     LDA #con_chr_bank + $2A
C - - - - - 0x00D941 03:9931: 8D F1 07  STA ram_bg_bank_2
; 1путин: 7й лвл - спуск после шаров, смена банка
                                        LDY ram_option_регион
C - - - - - 0x00D944 03:9934: A9 65     LDA tbl_D976_chr_bank,Y
C - - - - - 0x00D946 03:9936: 8D F5 07  STA ram_spr_bank_4
C - - - - - 0x00D949 03:9939: A0 34     LDY #con_F97C_colors + $0D * $04
C - - - - - 0x00D94B 03:993B: D0 E9     BNE bra_9926    ; jmp
bra_993D:
C - - - - - 0x00D94D 03:993D: CA        DEX
C - - - - - 0x00D94E 03:993E: D0 1D     BNE bra_995D
C - - - - - 0x00D950 03:9940: A0 10     LDY #$10
C - - - - - 0x00D952 03:9942: 20 30 FA  JSR sub_0x01FA40
C - - - - - 0x00D955 03:9945: A9 2C     LDA #con_chr_bank + $2C
C - - - - - 0x00D957 03:9947: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x00D95A 03:994A: A9 2E     LDA #con_chr_bank + $2E
C - - - - - 0x00D95C 03:994C: 8D F1 07  STA ram_bg_bank_2
; 1путин: 7й лвл - спуск к боссу, смена банка
                                        LDY ram_option_регион
C - - - - - 0x00D95F 03:994F: A9 66     LDA tbl_D977_chr_bank,Y
C - - - - - 0x00D961 03:9951: 8D F4 07  STA ram_spr_bank_3
C - - - - - 0x00D964 03:9954: A0 50     LDY #con_F97C_colors + $14 * $04
C - - - - - 0x00D966 03:9956: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
C - - - - - 0x00D969 03:9959: A0 54     LDY #con_F97C_colors + $15 * $04
C - - - - - 0x00D96B 03:995B: D0 C9     BNE bra_9926    ; jmp
bra_995D:
C - - - - - 0x00D96D 03:995D: CA        DEX
C - - - - - 0x00D96E 03:995E: D0 06     BNE bra_9966_RTS
C - - - - - 0x00D970 03:9960: A9 C0     LDA #$C0
C - - - - - 0x00D972 03:9962: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00D974 03:9964: D0 C3     BNE bra_9929    ; jmp
bra_9966_RTS:
- - - - - - 0x00D976 03:9966: 60        RTS


tbl_D976_chr_bank:
                                        .byte con_chr_bank + $65   ; 00 US
                                        .byte con_chr_bank + $A4   ; 01 EU

tbl_D977_chr_bank:
                                        .byte con_chr_bank + $66   ; 00 US
                                        .byte con_chr_bank + $A0   ; 01 EU


ofs_044_0x00D977_07_area_8:
C - - J - - 0x00D977 03:9967: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00D979 03:9969: 29 07     AND #$07
C - - - - - 0x00D97B 03:996B: D0 16     BNE bra_9983
C - - - - - 0x00D97D 03:996D: EE CD 03  INC ram_03CD
C - - - - - 0x00D980 03:9970: AC CD 03  LDY ram_03CD
C - - - - - 0x00D983 03:9973: C0 06     CPY #$06
C - - - - - 0x00D985 03:9975: 90 02     BCC bra_9979
C - - - - - 0x00D987 03:9977: A0 00     LDY #$00
bra_9979:
C - - - - - 0x00D989 03:9979: 8C CD 03  STY ram_03CD
C - - - - - 0x00D98C 03:997C: B9 88 99  LDA tbl_9988,Y
C - - - - - 0x00D98F 03:997F: A8        TAY
C - - - - - 0x00D990 03:9980: 20 64 F9  JSR sub_0x01F974_запись_3х_цветов_с_условием
bra_9983:
C - - - - - 0x00D993 03:9983: A5 39     LDA ram_пауза
C - - - - - 0x00D995 03:9985: F0 07     BEQ bra_998E_игра
C - - - - - 0x00D997 03:9987: 60        RTS



tbl_9988:
- D 0 - - - 0x00D998 03:9988: 58        .byte con_F97C_colors + $16 * $04   ; 
- D 0 - - - 0x00D999 03:9989: 5C        .byte con_F97C_colors + $17 * $04   ; 
- D 0 - - - 0x00D99A 03:998A: 60        .byte con_F97C_colors + $18 * $04   ; 
- D 0 - - - 0x00D99B 03:998B: 60        .byte con_F97C_colors + $18 * $04   ; 
- D 0 - - - 0x00D99C 03:998C: 5C        .byte con_F97C_colors + $17 * $04   ; 
- D 0 - - - 0x00D99D 03:998D: 58        .byte con_F97C_colors + $16 * $04   ; 



bra_998E_игра:
C - - - - - 0x00D99E 03:998E: 20 3A 9A  JSR sub_9A3A
C - - - - - 0x00D9A1 03:9991: A5 8C     LDA ram_008C
C - - - - - 0x00D9A3 03:9993: 0A        ASL
C - - - - - 0x00D9A4 03:9994: A8        TAY
C - - - - - 0x00D9A5 03:9995: B9 AC 99  LDA tbl_99AC,Y
C - - - - - 0x00D9A8 03:9998: C5 63     CMP ram_0063
C - - - - - 0x00D9AA 03:999A: 90 0B     BCC bra_99A7
C - - - - - 0x00D9AC 03:999C: D0 0D     BNE bra_99AB_RTS
C - - - - - 0x00D9AE 03:999E: B9 AD 99  LDA tbl_99AC + $01,Y
C - - - - - 0x00D9B1 03:99A1: C5 FD     CMP ram_scroll_X
C - - - - - 0x00D9B3 03:99A3: F0 02     BEQ bra_99A7
C - - - - - 0x00D9B5 03:99A5: B0 04     BCS bra_99AB_RTS
bra_99A7:
C - - - - - 0x00D9B7 03:99A7: 20 C5 99  JSR sub_99C5
C - - - - - 0x00D9BA 03:99AA: 18        CLC
bra_99AB_RTS:
C - - - - - 0x00D9BB 03:99AB: 60        RTS



tbl_99AC:
;                                              +---------- 
;                                              |    +----- scroll_X
;                                              |    |
- D 0 - - - 0x00D9BC 03:99AC: 03        .byte $03, $80   ; 00 
- D 0 - - - 0x00D9BE 03:99AE: 05        .byte $05, $01   ; 01 
- D 0 - - - 0x00D9C0 03:99B0: 05        .byte $05, $20   ; 02 
- D 0 - - - 0x00D9C2 03:99B2: 05        .byte $05, $B0   ; 03 
- D 0 - - - 0x00D9C4 03:99B4: 05        .byte $05, $E0   ; 04 
- D 0 - - - 0x00D9C6 03:99B6: 06        .byte $06, $90   ; 05 
- D 0 - - - 0x00D9C8 03:99B8: 07        .byte $07, $80   ; 06 
- D 0 - - - 0x00D9CA 03:99BA: 0B        .byte $0B, $C0   ; 07 
- D 0 - - - 0x00D9CC 03:99BC: 0C        .byte $0C, $80   ; 08 
- D 0 - - - 0x00D9CE 03:99BE: 0C        .byte $0C, $80   ; 09 
- D 0 - - - 0x00D9D0 03:99C0: 0D        .byte $0D, $A0   ; 0A 
- D 0 - - - 0x00D9D2 03:99C2: 0E        .byte $0E, $00   ; 0B 
- D 0 - - - 0x00D9D4 03:99C4: FF        .byte $FF   ; 0C final



sub_99C5:
; 1путин опт
                                        LDY ram_008C
                                        LDA tbl_99CA_lo,Y
                                        STA ram_0000
                                        LDA tbl_99CA_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_99CA_lo:
- D 0 - I - 0x00D9DA 03:99CA: E4 99     .byte < ofs_026_99E4_00
- D 0 - I - 0x00D9DC 03:99CC: 2D 9A     .byte < ofs_026_9A2D_01
- D 0 - I - 0x00D9DE 03:99CE: EC 99     .byte < ofs_026_99EC_02
- D 0 - I - 0x00D9E0 03:99D0: 2D 9A     .byte < ofs_026_9A2D_03
- D 0 - I - 0x00D9E2 03:99D2: EC 99     .byte < ofs_026_99EC_04
- D 0 - I - 0x00D9E4 03:99D4: F7 99     .byte < ofs_026_99F7_05
- D 0 - I - 0x00D9E6 03:99D6: 0A 9A     .byte < ofs_026_9A0A_06
- D 0 - I - 0x00D9E8 03:99D8: 1B 9A     .byte < ofs_026_9A1B_07
- D 0 - I - 0x00D9EA 03:99DA: F7 99     .byte < ofs_026_99F7_08
- D 0 - I - 0x00D9EC 03:99DC: 23 9A     .byte < ofs_026_9A23_09
- D 0 - I - 0x00D9EE 03:99DE: 2D 9A     .byte < ofs_026_9A2D_0A
- D 0 - I - 0x00D9F0 03:99E0: 33 9A     .byte < ofs_026_9A33_0B
- - - - - - 0x00D9F2 03:99E2: 39 9A     .byte < _общий_RTS ; 0C
tbl_99CA_hi:
- D 0 - I - 0x00D9DA 03:99CA: E4 99     .byte > ofs_026_99E4_00
- D 0 - I - 0x00D9DC 03:99CC: 2D 9A     .byte > ofs_026_9A2D_01
- D 0 - I - 0x00D9DE 03:99CE: EC 99     .byte > ofs_026_99EC_02
- D 0 - I - 0x00D9E0 03:99D0: 2D 9A     .byte > ofs_026_9A2D_03
- D 0 - I - 0x00D9E2 03:99D2: EC 99     .byte > ofs_026_99EC_04
- D 0 - I - 0x00D9E4 03:99D4: F7 99     .byte > ofs_026_99F7_05
- D 0 - I - 0x00D9E6 03:99D6: 0A 9A     .byte > ofs_026_9A0A_06
- D 0 - I - 0x00D9E8 03:99D8: 1B 9A     .byte > ofs_026_9A1B_07
- D 0 - I - 0x00D9EA 03:99DA: F7 99     .byte > ofs_026_99F7_08
- D 0 - I - 0x00D9EC 03:99DC: 23 9A     .byte > ofs_026_9A23_09
- D 0 - I - 0x00D9EE 03:99DE: 2D 9A     .byte > ofs_026_9A2D_0A
- D 0 - I - 0x00D9F0 03:99E0: 33 9A     .byte > ofs_026_9A33_0B
- - - - - - 0x00D9F2 03:99E2: 39 9A     .byte > _общий_RTS ; 0C



ofs_026_99E4_00:
C - - J - - 0x00D9F4 03:99E4: A9 40     LDA #$40
C - - - - - 0x00D9F6 03:99E6: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00D9F8 03:99E8: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00D9FA 03:99EA: D0 08     BNE bra_99F4    ; jmp



ofs_026_99EC_02:
ofs_026_99EC_04:
C - - J - - 0x00D9FC 03:99EC: A9 02     LDA #$02
C - - - - - 0x00D9FE 03:99EE: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00DA00 03:99F0: A9 00     LDA #$00
C - - - - - 0x00DA02 03:99F2: 85 6F     STA ram_006F
bra_99F4:
loc_99F4:
C D 0 - - - 0x00DA04 03:99F4: E6 8C     INC ram_008C
C - - - - - 0x00DA06 03:99F6: 60        RTS



ofs_026_99F7_05:
ofs_026_99F7_08:
C - - J - - 0x00DA07 03:99F7: A9 C0     LDA #$C0
C - - - - - 0x00DA09 03:99F9: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00DA0B 03:99FB: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00DA0D 03:99FD: A9 01     LDA #$01
C - - - - - 0x00DA0F 03:99FF: A4 FC     LDY ram_scroll_Y
C - - - - - 0x00DA11 03:9A01: 30 02     BMI bra_9A05
C - - - - - 0x00DA13 03:9A03: A9 EE     LDA #$EE
bra_9A05:
C - - - - - 0x00DA15 03:9A05: 85 98     STA ram_0098
C - - - - - 0x00DA17 03:9A07: 4C F4 99  JMP loc_99F4



ofs_026_9A0A_06:
C - - J - - 0x00DA1A 03:9A0A: A0 40     LDY #$40
C - - - - - 0x00DA1C 03:9A0C: 20 30 FA  JSR sub_0x01FA40
C - - - - - 0x00DA1F 03:9A0F: A9 6C     LDA #con_chr_bank + $6C
C - - - - - 0x00DA21 03:9A11: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x00DA24 03:9A14: A9 6E     LDA #con_chr_bank + $6E
C - - - - - 0x00DA26 03:9A16: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x00DA29 03:9A19: D0 D9     BNE bra_99F4    ; jmp



ofs_026_9A1B_07:
C - - J - - 0x00DA2B 03:9A1B: A9 80     LDA #$80
C - - - - - 0x00DA2D 03:9A1D: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x00DA2F 03:9A1F: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00DA31 03:9A21: D0 D1     BNE bra_99F4    ; jmp



ofs_026_9A23_09:
C - - J - - 0x00DA33 03:9A23: A5 FC     LDA ram_scroll_Y
C - - - - - 0x00DA35 03:9A25: D0 12     BNE bra_9A39_RTS
C - - - - - 0x00DA37 03:9A27: A9 00     LDA #$00
C - - - - - 0x00DA39 03:9A29: 85 98     STA ram_0098
C - - - - - 0x00DA3B 03:9A2B: F0 C7     BEQ bra_99F4    ; jmp
bra_9A39_RTS:
C - - - - - 0x00DA49 03:9A39: 60        RTS



ofs_026_9A2D_01:
ofs_026_9A2D_03:
ofs_026_9A2D_0A:
C - - J - - 0x00DA3D 03:9A2D: A9 01     LDA #$01
C - - - - - 0x00DA3F 03:9A2F: 85 6F     STA ram_006F
C - - - - - 0x00DA41 03:9A31: D0 C1     BNE bra_99F4    ; jmp



ofs_026_9A33_0B:
C - - J - - 0x00DA43 03:9A33: A9 01     LDA #$01
C - - - - - 0x00DA45 03:9A35: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00DA47 03:9A37: D0 BB     BNE bra_99F4    ; jmp



sub_9A3A:
C - - - - - 0x00DA4A 03:9A3A: A5 8D     LDA ram_событие_на_уровне
C - - - - - 0x00DA4C 03:9A3C: 0A        ASL
C - - - - - 0x00DA4D 03:9A3D: A8        TAY
C - - - - - 0x00DA4E 03:9A3E: B9 55 9A  LDA tbl_9A55,Y
C - - - - - 0x00DA51 03:9A41: C5 82     CMP ram_0082_конфиг_уровня
C - - - - - 0x00DA53 03:9A43: 90 0F     BCC bra_9A54_RTS
C - - - - - 0x00DA55 03:9A45: F0 02     BEQ bra_9A49
C - - - - - 0x00DA57 03:9A47: B0 07     BCS bra_9A50    ; jmp
bra_9A49:
C - - - - - 0x00DA59 03:9A49: B9 56 9A  LDA tbl_9A55 + $01,Y
C - - - - - 0x00DA5C 03:9A4C: C5 FC     CMP ram_scroll_Y
C - - - - - 0x00DA5E 03:9A4E: 90 04     BCC bra_9A54_RTS
bra_9A50:
C - - - - - 0x00DA60 03:9A50: 20 5C 9A  JSR sub_9A5C
C - - - - - 0x00DA63 03:9A53: 18        CLC
bra_9A54_RTS:
C - - - - - 0x00DA64 03:9A54: 60        RTS



tbl_9A55:
;                                              +---------- 
;                                              |    +----- scroll_Y
;                                              |    |
- D 0 - - - 0x00DA65 03:9A55: 01        .byte $01, $D0   ; 00 
- D 0 - - - 0x00DA67 03:9A57: 01        .byte $01, $20   ; 01 
- D 0 - - - 0x00DA69 03:9A59: 00        .byte $00, $C0   ; 02 
- D 0 - - - 0x00DA6B 03:9A5B: FF        .byte $FF   ; 03 final



sub_9A5C:
; 1путин опт
                                        LDY ram_событие_на_уровне
                                        LDA tbl_9A61_lo,Y
                                        STA ram_0000
                                        LDA tbl_9A61_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9A61_lo:
- D 0 - I - 0x00DA71 03:9A61: 69 9A     .byte < ofs_027_9A69_00
- D 0 - I - 0x00DA73 03:9A63: 69 9A     .byte < ofs_027_9A69_01
- D 0 - I - 0x00DA75 03:9A65: 70 9A     .byte < ofs_027_9A70_02
- D 0 - I - 0x00DA77 03:9A67: 76 9A     .byte < _общий_RTS ; 03
tbl_9A61_hi:
- D 0 - I - 0x00DA71 03:9A61: 69 9A     .byte > ofs_027_9A69_00
- D 0 - I - 0x00DA73 03:9A63: 69 9A     .byte > ofs_027_9A69_01
- D 0 - I - 0x00DA75 03:9A65: 70 9A     .byte > ofs_027_9A70_02
- D 0 - I - 0x00DA77 03:9A67: 76 9A     .byte > _общий_RTS ; 03



ofs_027_9A69_00:
ofs_027_9A69_01:
C - - J - - 0x00DA79 03:9A69: A9 00     LDA #$00
C - - - - - 0x00DA7B 03:9A6B: 85 61     STA ram_0061_конфиг_уровня
bra_9A6D:
C - - - - - 0x00DA7D 03:9A6D: E6 8D     INC ram_событие_на_уровне
C - - - - - 0x00DA7F 03:9A6F: 60        RTS



ofs_027_9A70_02:
C - - J - - 0x00DA80 03:9A70: A9 C0     LDA #$C0
C - - - - - 0x00DA82 03:9A72: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00DA84 03:9A74: D0 F7     BNE bra_9A6D    ; jmp



.out .sprintf("Free bytes in bank 34: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_34b"
- D 1 - - - 0x00C00F 02:BFFF: 35        .byte con_prg_bank + $35   ; 



