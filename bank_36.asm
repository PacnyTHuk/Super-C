.segment "BANK_36"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x00C010-0x01000F



.export ofs_044_0x00D3B9_00_area_1
.export ofs_044_0x00D4A2_01_area_2
.export ofs_044_0x00D557_02_area_3
.export ofs_044_0x00D610_03_area_4
.export ofs_044_0x00D703_04_area_5
.export ofs_044_0x00D82A_05_area_6
.export ofs_044_0x00D8F3_06_area_7
.export ofs_044_0x00D977_07_area_8
.export _off004_0x00DA87_03_area_4
.export _off005_0x00DAE4_03_area_4
.export _off006_0x00DFCA_03_area_4
.export _off007_0x00EACA_03_area_4
.export _off004_0x00EB7A_02_area_3
.export _off005_0x00EB92_02_area_3
.export _off006_0x00EFF4_02_area_3
.export _off007_0x00F804_02_area_3



; bzk this byte must be placed at 8000
- D 0 - - - 0x00C010 03:8000: 36        .byte con_prg_bank + $36   ; 



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
;                                              ----------- 
;                                              |    ------ scroll_X
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
C - - - - - 0x00D459 03:9449: 20 68 F9  JSR sub_0x01F978_write_3_colors
C - - - - - 0x00D45C 03:944C: A0 84     LDY #con_F97C_colors + $21 * $04
C - - - - - 0x00D45E 03:944E: 20 68 F9  JSR sub_0x01F978_write_3_colors
bra_9451:
loc_9451:
C D 0 - - - 0x00D461 03:9451: E6 8C     INC ram_008C
C - - - - - 0x00D463 03:9453: 60        RTS



sub_9455:
C - - - - - 0x00D465 03:9455: A5 8D     LDA ram_008D_событие_на_уровне
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
;                                              ----------- 
;                                              |    ------ scroll_Y
;                                              |    |
- D 0 - - - 0x00D47E 03:946E: 02        .byte $02, $80   ; 00 
- D 0 - - - 0x00D480 03:9470: 02        .byte $02, $E0   ; 01 
- D 0 - - - 0x00D482 03:9472: FF        .byte $FF   ; 02 final



sub_9473:
; 1путин опт
                                        LDY ram_008D_событие_на_уровне
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
C - - - - - 0x00D490 03:9480: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_9483:
C - - - - - 0x00D493 03:9483: E6 8D     INC ram_008D_событие_на_уровне
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
C - - - - - 0x00D4A7 03:9497: A5 8D     LDA ram_008D_событие_на_уровне
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
;                                              ----------- 
;                                              |    ------ scroll_Y
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
                                        LDY ram_008D_событие_на_уровне
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
C - - - - - 0x00D500 03:94F0: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D503 03:94F3: A0 6C     LDY #con_F97C_colors + $1B * $04
C - - - - - 0x00D505 03:94F5: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D508 03:94F8: A0 70     LDY #con_F97C_colors + $1C * $04
C - - - - - 0x00D50A 03:94FA: D0 02     BNE bra_94FE    ; jmp
ofs_021_94FC_05:
C - - J - - 0x00D50C 03:94FC: A0 74     LDY #con_F97C_colors + $1D * $04
bra_94FE:
C - - - - - 0x00D50E 03:94FE: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_9501:
loc_9501:
C D 0 - - - 0x00D511 03:9501: E6 8D     INC ram_008D_событие_на_уровне
C - - - - - 0x00D513 03:9503: 60        RTS



ofs_021_9504_06:
C - - J - - 0x00D514 03:9504: A0 78     LDY #con_F97C_colors + $1E * $04
C - - - - - 0x00D516 03:9506: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
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
C - - - - - 0x00D532 03:9522: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
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
C - - - - - 0x00D55C 03:954C: A5 1B     LDA ram_счетчик_кадров_1
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
;                                              ----------- 
;                                              |    ------ scroll_X
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
C - - - - - 0x00D5B8 03:95A8: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D5BB 03:95AB: A0 0C     LDY #con_F97C_colors + $03 * $04
C - - - - - 0x00D5BD 03:95AD: D0 0A     BNE bra_95B9    ; jmp
bra_95AF:
C - - - - - 0x00D5BF 03:95AF: CA        DEX
C - - - - - 0x00D5C0 03:95B0: D0 0D     BNE bra_95BF
; 01 
C - - - - - 0x00D5C2 03:95B2: A0 10     LDY #con_F97C_colors + $04 * $04
C - - - - - 0x00D5C4 03:95B4: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D5C7 03:95B7: A0 14     LDY #con_F97C_colors + $05 * $04
bra_95B9:
C - - - - - 0x00D5C9 03:95B9: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
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
C - - - - - 0x00D5E2 03:95D2: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D5E5 03:95D5: A0 1C     LDY #con_F97C_colors + $07 * $04
C - - - - - 0x00D5E7 03:95D7: D0 E0     BNE bra_95B9    ; jmp
bra_95D9:
C - - - - - 0x00D5E9 03:95D9: CA        DEX
C - - - - - 0x00D5EA 03:95DA: D0 0E     BNE bra_95EA
; 03 
C - - - - - 0x00D5EC 03:95DC: A9 10     LDA #con_chr_bank + $10
C - - - - - 0x00D5EE 03:95DE: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x00D5F1 03:95E1: A0 20     LDY #con_F97C_colors + $08 * $04
C - - - - - 0x00D5F3 03:95E3: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D5F6 03:95E6: A0 24     LDY #con_F97C_colors + $09 * $04
C - - - - - 0x00D5F8 03:95E8: D0 CF     BNE bra_95B9    ; jmp
bra_95EA:
C - - - - - 0x00D5FA 03:95EA: CA        DEX
C - - - - - 0x00D5FB 03:95EB: D0 09     BNE bra_95F6
; 04 
C - - - - - 0x00D5FD 03:95ED: A0 44     LDY #con_F97C_colors + $11 * $04
C - - - - - 0x00D5FF 03:95EF: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
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
C - - J - - 0x00D610 03:9600: A5 1B     LDA ram_счетчик_кадров_1
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
;                                              ----------- 
;                                              |    ------ scroll_X
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
C - - - - - 0x00D67F 03:966F: A5 8D     LDA ram_008D_событие_на_уровне
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
;                                              ----------- 
;                                              |    ------ scroll_Y
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
                                        LDY ram_008D_событие_на_уровне
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
C - - J - - 0x00D6C6 03:96B6: A9 1B     LDA #con_chr_bank + $1B
C - - - - - 0x00D6C8 03:96B8: 8D F5 07  STA ram_spr_bank_4
C - - - - - 0x00D6CB 03:96BB: D0 32     BNE bra_96EF    ; jmp



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
C - - - - - 0x00D6FF 03:96EF: E6 8D     INC ram_008D_событие_на_уровне
C - - - - - 0x00D701 03:96F1: 60        RTS



ofs_044_0x00D703_04_area_5:
C - - J - - 0x00D703 03:96F3: AD CD 03  LDA ram_03CD
C - - - - - 0x00D706 03:96F6: 30 1C     BMI bra_9714
C - - - - - 0x00D708 03:96F8: A5 1B     LDA ram_счетчик_кадров_1
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
C - - - - - 0x00D721 03:9711: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_9714:
C - - - - - 0x00D724 03:9714: AD CF 03  LDA ram_03CF
C - - - - - 0x00D727 03:9717: 30 30     BMI bra_9749
C - - - - - 0x00D729 03:9719: A5 1B     LDA ram_счетчик_кадров_1
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
;                                              ----------- 
;                                              |    ------ scroll_X
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
C - - - - - 0x00D7BC 03:97AC: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
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
C - - - - - 0x00D7DA 03:97CA: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D7DD 03:97CD: A0 A8     LDY #con_F97C_colors + $2A * $04
C - - - - - 0x00D7DF 03:97CF: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D7E2 03:97D2: A9 02     LDA #$02
C - - - - - 0x00D7E4 03:97D4: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00D7E6 03:97D6: A9 C0     LDA #$C0
C - - - - - 0x00D7E8 03:97D8: D0 E3     BNE bra_97BD    ; jmp



ofs_024_97DA_04:
C - - J - - 0x00D7EA 03:97DA: A9 01     LDA #$01
C - - - - - 0x00D7EC 03:97DC: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x00D7EE 03:97DE: D0 CF     BNE bra_97AF    ; jmp



sub_97E1:
C - - - - - 0x00D7F1 03:97E1: A5 8D     LDA ram_008D_событие_на_уровне
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
;                                              ----------- 
;                                              |    ------ scroll_Y
;                                              |    |
- D 0 - - - 0x00D80C 03:97FC: 01        .byte $01, $00   ; 00 
- D 0 - - - 0x00D80E 03:97FE: 00        .byte $00, $80   ; 01 
- D 0 - - - 0x00D810 03:9800: FF        .byte $FF   ; 02 final



sub_9801:
C - - - - - 0x00D811 03:9801: A6 8D     LDX ram_008D_событие_на_уровне
C - - - - - 0x00D813 03:9803: D0 07     BNE bra_980C
C - - - - - 0x00D815 03:9805: A9 FF     LDA #$FF
C - - - - - 0x00D817 03:9807: 8D CF 03  STA ram_03CF
C - - - - - 0x00D81A 03:980A: D0 0A     BNE bra_9816    ; jmp
bra_980C:
C - - - - - 0x00D81C 03:980C: CA        DEX
C - - - - - 0x00D81D 03:980D: D0 0A     BNE bra_9819_RTS
C - - - - - 0x00D81F 03:980F: 20 90 F1  JSR sub_0x01F1A0
C - - - - - 0x00D822 03:9812: A9 00     LDA #$00
C - - - - - 0x00D824 03:9814: 85 61     STA ram_0061_конфиг_уровня
bra_9816:
C - - - - - 0x00D826 03:9816: E6 8D     INC ram_008D_событие_на_уровне
C - - - - - 0x00D828 03:9818: 60        RTS
bra_9819_RTS:   ; bzk optimize
C - - - - - 0x00D829 03:9819: 60        RTS



ofs_044_0x00D82A_05_area_6:
C - - J - - 0x00D82A 03:981A: AC CD 03  LDY ram_03CD
C - - - - - 0x00D82D 03:981D: 30 1B     BMI bra_983A
C - - - - - 0x00D82F 03:981F: A5 1B     LDA ram_счетчик_кадров_1
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
C - - - - - 0x00D84F 03:983F: A5 1B     LDA ram_счетчик_кадров_1
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
C - - - - - 0x00D87A 03:986A: A5 8D     LDA ram_008D_событие_на_уровне
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
;                                              ----------- 
;                                              |    ------ scroll_Y
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
                                        LDY ram_008D_событие_на_уровне
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
C - - - - - 0x00D8BB 03:98AB: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_98AE:
loc_98AE:
C D 0 - - - 0x00D8BE 03:98AE: E6 8D     INC ram_008D_событие_на_уровне
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
C - - - - - 0x00D8E3 03:98D3: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
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
C - - - - - 0x00D8F8 03:98E8: A5 8D     LDA ram_008D_событие_на_уровне
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
;                                              ----------- 
;                                              |    ------ scroll_Y
;                                              |    |
- D 0 - - - 0x00D911 03:9901: 00        .byte $00, $10   ; 00 
- D 0 - - - 0x00D913 03:9903: 05        .byte $05, $00   ; 01 
- D 0 - - - 0x00D915 03:9905: 08        .byte $08, $00   ; 02 
- D 0 - - - 0x00D917 03:9907: 0C        .byte $0C, $00   ; 03 
- D 0 - - - 0x00D919 03:9909: 0C        .byte $0C, $D8   ; 04 
- D 0 - - - 0x00D91B 03:990B: FF        .byte $FF   ; 05 final



sub_990C:
C - - - - - 0x00D91C 03:990C: A6 8D     LDX ram_008D_событие_на_уровне
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
C - - - - - 0x00D936 03:9926: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_9929:
C - - - - - 0x00D939 03:9929: E6 8D     INC ram_008D_событие_на_уровне
C - - - - - 0x00D93B 03:992B: 60        RTS
bra_992C:
C - - - - - 0x00D93C 03:992C: CA        DEX
C - - - - - 0x00D93D 03:992D: D0 0E     BNE bra_993D
C - - - - - 0x00D93F 03:992F: A9 2A     LDA #con_chr_bank + $2A
C - - - - - 0x00D941 03:9931: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x00D944 03:9934: A9 65     LDA #con_chr_bank + $65
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
C - - - - - 0x00D95F 03:994F: A9 66     LDA #con_chr_bank + $66
C - - - - - 0x00D961 03:9951: 8D F4 07  STA ram_spr_bank_3
C - - - - - 0x00D964 03:9954: A0 50     LDY #con_F97C_colors + $14 * $04
C - - - - - 0x00D966 03:9956: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
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



ofs_044_0x00D977_07_area_8:
C - - J - - 0x00D977 03:9967: A5 1B     LDA ram_счетчик_кадров_1
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
C - - - - - 0x00D990 03:9980: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_9983:
C - - - - - 0x00D993 03:9983: A5 39     LDA ram_пауза
C - - - - - 0x00D995 03:9985: F0 07     BEQ bra_998E_игра
C - - - - - 0x00D997 03:9987: 60        RTS



tbl_9988:
- D 0 - - - 0x00D998 03:9988: 58        .byte con_F97C_colors + $16 * $04   ; 
- D 0 - - - 0x00D999 03:9989: 5C        .byte con_F97C_colors + $17 * $04   ; 
- D 0 - - - 0x00D99A 03:998A: 60        .byte con_F97C_colors + $06 * $04 * $04   ; 
- D 0 - - - 0x00D99B 03:998B: 60        .byte con_F97C_colors + $06 * $04 * $04   ; 
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
;                                              ----------- 
;                                              |    ------ scroll_X
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



bra_9A39_RTS:
; bzk optimize
C - - - - - 0x00DA49 03:9A39: 60        RTS



sub_9A3A:
C - - - - - 0x00DA4A 03:9A3A: A5 8D     LDA ram_008D_событие_на_уровне
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
;                                              ----------- 
;                                              |    ------ scroll_Y
;                                              |    |
- D 0 - - - 0x00DA65 03:9A55: 01        .byte $01, $D0   ; 00 
- D 0 - - - 0x00DA67 03:9A57: 01        .byte $01, $20   ; 01 
- D 0 - - - 0x00DA69 03:9A59: 00        .byte $00, $C0   ; 02 
- D 0 - - - 0x00DA6B 03:9A5B: FF        .byte $FF   ; 03 final



sub_9A5C:
; 1путин опт
                                        LDY ram_008D_событие_на_уровне
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
C - - - - - 0x00DA7D 03:9A6D: E6 8D     INC ram_008D_событие_на_уровне
C - - - - - 0x00DA7F 03:9A6F: 60        RTS



ofs_027_9A70_02:
C - - J - - 0x00DA80 03:9A70: A9 C0     LDA #$C0
C - - - - - 0x00DA82 03:9A72: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00DA84 03:9A74: D0 F7     BNE bra_9A6D    ; jmp



_off004_0x00DA87_03_area_4:
- D 0 - I - 0x00DA87 03:9A77: 07        .byte $07   ; столбцы
- D 0 - I - 0x00DA88 03:9A78: 0D        .byte $0D   ; строки

;                                              00   01   02   03   04   05   06
- - - - - - 0x00DA89 03:9A79: 00        .byte $00, $00, $00, $0E, $12, $00, $10   ; 00 
- - - - - - 0x00DA90 03:9A80: 00        .byte $00, $00, $00, $0D, $11, $00, $0F   ; 01 
- - - - - - 0x00DA97 03:9A87: 00        .byte $00, $00, $00, $0C, $00, $00, $00   ; 02 
- - - - - - 0x00DA9E 03:9A8E: 00        .byte $00, $00, $00, $0B, $00, $00, $00   ; 03 
- - - - - - 0x00DAA5 03:9A95: 00        .byte $00, $00, $00, $0A, $00, $00, $00   ; 04 
- - - - - - 0x00DAAC 03:9A9C: 00        .byte $00, $00, $00, $09, $00, $00, $00   ; 05 
- - - - - - 0x00DAB3 03:9AA3: 00        .byte $00, $00, $00, $08, $00, $00, $00   ; 06 
- - - - - - 0x00DABA 03:9AAA: 00        .byte $00, $00, $00, $07, $00, $00, $00   ; 07 
- - - - - - 0x00DAC1 03:9AB1: 00        .byte $00, $00, $00, $06, $00, $00, $00   ; 08 
- - - - - - 0x00DAC8 03:9AB8: 00        .byte $00, $00, $00, $05, $00, $00, $00   ; 09 
- - - - - - 0x00DACF 03:9ABF: 00        .byte $00, $00, $00, $04, $00, $00, $00   ; 0A 
- - - - - - 0x00DAD6 03:9AC6: 00        .byte $00, $00, $00, $03, $00, $00, $00   ; 0B 
- D 0 - I - 0x00DADD 03:9ACD: 01        .byte $01, $01, $01, $02, $00, $00, $00   ; 0C 



_off005_0x00DAE4_03_area_4:
- D 0 - I - 0x00DAE4 03:9AD4: FA 9A     .word _off018_03_9AFA_00
- D 0 - I - 0x00DAE6 03:9AD6: 3A 9B     .word _off018_03_9B3A_01
- D 0 - I - 0x00DAE8 03:9AD8: 7A 9B     .word _off018_03_9B7A_02
- D 0 - I - 0x00DAEA 03:9ADA: BA 9B     .word _off018_03_9BBA_03
- D 0 - I - 0x00DAEC 03:9ADC: FA 9B     .word _off018_03_9BFA_04
- D 0 - I - 0x00DAEE 03:9ADE: 3A 9C     .word _off018_03_9C3A_05
- D 0 - I - 0x00DAF0 03:9AE0: 7A 9C     .word _off018_03_9C7A_06
- D 0 - I - 0x00DAF2 03:9AE2: BA 9C     .word _off018_03_9CBA_07
- D 0 - I - 0x00DAF4 03:9AE4: FA 9C     .word _off018_03_9CFA_08
- D 0 - I - 0x00DAF6 03:9AE6: 3A 9D     .word _off018_03_9D3A_09
- D 0 - I - 0x00DAF8 03:9AE8: 7A 9D     .word _off018_03_9D7A_0A
- D 0 - I - 0x00DAFA 03:9AEA: BA 9D     .word _off018_03_9DBA_0B
- D 0 - I - 0x00DAFC 03:9AEC: FA 9D     .word _off018_03_9DFA_0C
- D 0 - I - 0x00DAFE 03:9AEE: 3A 9E     .word _off018_03_9E3A_0D
- D 0 - I - 0x00DB00 03:9AF0: 7A 9E     .word _off018_03_9E7A_0E
- D 0 - I - 0x00DB02 03:9AF2: BA 9E     .word _off018_03_9EBA_0F
- D 0 - I - 0x00DB04 03:9AF4: FA 9E     .word _off018_03_9EFA_10
- D 0 - I - 0x00DB06 03:9AF6: 3A 9F     .word _off018_03_9F3A_11
- D 0 - I - 0x00DB08 03:9AF8: 7A 9F     .word _off018_03_9F7A_12



_off018_03_9AFA_00:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DB0A 03:9AFA: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 0 - I - 0x00DB12 03:9B02: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- D 0 - I - 0x00DB1A 03:9B0A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 0 - I - 0x00DB22 03:9B12: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- D 0 - I - 0x00DB2A 03:9B1A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- D 0 - I - 0x00DB32 03:9B22: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 05 
- D 0 - I - 0x00DB3A 03:9B2A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 06 
- D 0 - I - 0x00DB42 03:9B32: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_03_9B3A_01:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DB4A 03:9B3A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 0 - I - 0x00DB52 03:9B42: 8B        .byte $8B, $12, $8B, $12, $8B, $12, $8B, $12   ; 01 
- D 0 - I - 0x00DB5A 03:9B4A: 78        .byte $78, $79, $7A, $7B, $7A, $7C, $7A, $88   ; 02 
- D 0 - I - 0x00DB62 03:9B52: 81        .byte $81, $82, $00, $86, $86, $86, $86, $2B   ; 03 
- D 0 - I - 0x00DB6A 03:9B5A: 62        .byte $62, $27, $00, $87, $87, $87, $87, $00   ; 04 
- D 0 - I - 0x00DB72 03:9B62: 7D        .byte $7D, $7E, $7F, $80, $7D, $7E, $7F, $80   ; 05 
- D 0 - I - 0x00DB7A 03:9B6A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 06 
- D 0 - I - 0x00DB82 03:9B72: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_03_9B7A_02:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DB8A 03:9B7A: 30        .byte $30, $41, $10, $10, $10, $10, $42, $31   ; 00 
- D 0 - I - 0x00DB92 03:9B82: 18        .byte $18, $40, $00, $81, $82, $00, $32, $1B   ; 01 
- D 0 - I - 0x00DB9A 03:9B8A: 89        .byte $89, $2B, $3C, $62, $27, $3C, $2B, $1A   ; 02 
- D 0 - I - 0x00DBA2 03:9B92: 00        .byte $00, $2B, $00, $00, $00, $00, $2B, $1B   ; 03 
- D 0 - I - 0x00DBAA 03:9B9A: 00        .byte $00, $00, $15, $15, $15, $15, $00, $19   ; 04 
- D 0 - I - 0x00DBB2 03:9BA2: 7D        .byte $7D, $7E, $7F, $80, $8A, $7E, $8A, $13   ; 05 
- D 0 - I - 0x00DBBA 03:9BAA: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 06 
- D 0 - I - 0x00DBC2 03:9BB2: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_03_9BBA_03:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DBCA 03:9BBA: 5E        .byte $5E, $36, $37, $00, $63, $68, $15, $23   ; 00 
- D 0 - I - 0x00DBD2 03:9BC2: 4D        .byte $4D, $2E, $15, $68, $66, $15, $15, $19   ; 01 
- D 0 - I - 0x00DBDA 03:9BCA: 44        .byte $44, $01, $63, $64, $4F, $01, $00, $1B   ; 02 
- D 0 - I - 0x00DBE2 03:9BD2: 45        .byte $45, $26, $66, $65, $2B, $3C, $63, $84   ; 03 
- D 0 - I - 0x00DBEA 03:9BDA: 16        .byte $16, $26, $14, $14, $63, $68, $6A, $5F   ; 04 
- D 0 - I - 0x00DBF2 03:9BE2: 20        .byte $20, $14, $3C, $67, $66, $15, $6B, $23   ; 05 
- D 0 - I - 0x00DBFA 03:9BEA: 1C        .byte $1C, $68, $64, $3C, $3C, $3C, $67, $19   ; 06 
- D 0 - I - 0x00DC02 03:9BF2: 1E        .byte $1E, $00, $00, $00, $00, $00, $00, $1F   ; 07 



_off018_03_9BFA_04:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DC0A 03:9BFA: 16        .byte $16, $00, $3C, $8C, $01, $15, $32, $19   ; 00 
- D 0 - I - 0x00DC12 03:9C02: 50        .byte $50, $4F, $01, $8D, $8E, $68, $15, $23   ; 01 
- D 0 - I - 0x00DC1A 03:9C0A: 49        .byte $49, $6C, $68, $8F, $11, $64, $2B, $5D   ; 02 
- D 0 - I - 0x00DC22 03:9C12: 44        .byte $44, $26, $15, $0E, $0F, $3C, $3C, $5B   ; 03 
- D 0 - I - 0x00DC2A 03:9C1A: 20        .byte $20, $14, $33, $2B, $67, $68, $68, $1D   ; 04 
- D 0 - I - 0x00DC32 03:9C22: 50        .byte $50, $3C, $72, $73, $71, $2C, $2D, $4E   ; 05 
- D 0 - I - 0x00DC3A 03:9C2A: 3A        .byte $3A, $2F, $2F, $73, $70, $14, $14, $21   ; 06 
- D 0 - I - 0x00DC42 03:9C32: 34        .byte $34, $15, $15, $00, $00, $00, $00, $1D   ; 07 



_off018_03_9C3A_05:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DC4A 03:9C3A: 30        .byte $30, $41, $10, $10, $10, $10, $42, $31   ; 00 
- D 0 - I - 0x00DC52 03:9C42: 83        .byte $83, $40, $00, $00, $00, $00, $32, $19   ; 01 
- D 0 - I - 0x00DC5A 03:9C4A: 5A        .byte $5A, $3C, $3C, $71, $01, $38, $00, $1A   ; 02 
- D 0 - I - 0x00DC62 03:9C52: 49        .byte $49, $6C, $68, $6E, $69, $4F, $63, $1B   ; 03 
- D 0 - I - 0x00DC6A 03:9C5A: 44        .byte $44, $26, $68, $15, $6A, $69, $65, $19   ; 04 
- D 0 - I - 0x00DC72 03:9C62: 45        .byte $45, $26, $15, $15, $6B, $67, $6A, $1B   ; 05 
- D 0 - I - 0x00DC7A 03:9C6A: 20        .byte $20, $14, $14, $14, $67, $14, $14, $21   ; 06 
- D 0 - I - 0x00DC82 03:9C72: 1C        .byte $1C, $00, $00, $00, $00, $00, $00, $1D   ; 07 



_off018_03_9C7A_06:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DC8A 03:9C7A: 3A        .byte $3A, $2F, $65, $00, $72, $71, $6F, $19   ; 00 
- D 0 - I - 0x00DC92 03:9C82: 4D        .byte $4D, $2E, $66, $63, $68, $6E, $6E, $1B   ; 01 
- D 0 - I - 0x00DC9A 03:9C8A: 44        .byte $44, $26, $69, $65, $63, $64, $14, $21   ; 02 
- D 0 - I - 0x00DCA2 03:9C92: 45        .byte $45, $26, $6A, $6A, $66, $67, $6D, $4A   ; 03 
- D 0 - I - 0x00DCAA 03:9C9A: 43        .byte $43, $26, $66, $67, $68, $68, $24, $46   ; 04 
- D 0 - I - 0x00DCB2 03:9CA2: 75        .byte $75, $76, $76, $76, $76, $76, $76, $77   ; 05 
- D 0 - I - 0x00DCBA 03:9CAA: 20        .byte $20, $14, $14, $3C, $3C, $3C, $14, $21   ; 06 
- D 0 - I - 0x00DCC2 03:9CB2: 1E        .byte $1E, $00, $00, $00, $00, $00, $00, $1F   ; 07 



_off018_03_9CBA_07:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DCCA 03:9CBA: 83        .byte $83, $73, $70, $65, $67, $6E, $68, $5F   ; 00 
- D 0 - I - 0x00DCD2 03:9CC2: 5E        .byte $5E, $68, $68, $66, $2B, $72, $71, $1B   ; 01 
- D 0 - I - 0x00DCDA 03:9CCA: 18        .byte $18, $71, $01, $00, $00, $01, $74, $1A   ; 02 
- D 0 - I - 0x00DCE2 03:9CD2: 83        .byte $83, $6E, $68, $68, $69, $63, $6E, $84   ; 03 
- D 0 - I - 0x00DCEA 03:9CDA: 5E        .byte $5E, $72, $73, $71, $67, $66, $74, $5F   ; 04 
- D 0 - I - 0x00DCF2 03:9CE2: 17        .byte $17, $73, $73, $70, $00, $00, $72, $1A   ; 05 
- D 0 - I - 0x00DCFA 03:9CEA: 18        .byte $18, $68, $68, $69, $6F, $73, $73, $1B   ; 06 
- D 0 - I - 0x00DD02 03:9CF2: 1E        .byte $1E, $68, $69, $67, $6E, $68, $68, $1F   ; 07 



_off018_03_9CFA_08:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DD0A 03:9CFA: 5E        .byte $5E, $68, $68, $69, $15, $15, $15, $61   ; 00 
- D 0 - I - 0x00DD12 03:9D02: 22        .byte $22, $15, $15, $6B, $6B, $15, $68, $5F   ; 01 
- D 0 - I - 0x00DD1A 03:9D0A: 17        .byte $17, $73, $71, $65, $67, $69, $14, $21   ; 02 
- D 0 - I - 0x00DD22 03:9D12: 18        .byte $18, $68, $6E, $14, $00, $67, $68, $1D   ; 03 
- D 0 - I - 0x00DD2A 03:9D1A: 17        .byte $17, $00, $74, $00, $00, $15, $00, $19   ; 04 
- D 0 - I - 0x00DD32 03:9D22: 20        .byte $20, $14, $72, $73, $73, $71, $2B, $1B   ; 05 
- D 0 - I - 0x00DD3A 03:9D2A: 16        .byte $16, $00, $71, $63, $68, $6E, $68, $1A   ; 06 
- D 0 - I - 0x00DD42 03:9D32: 1E        .byte $1E, $68, $6E, $6A, $69, $74, $00, $1F   ; 07 



_off018_03_9D3A_09:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DD4A 03:9D3A: 16        .byte $16, $68, $68, $68, $68, $68, $68, $19   ; 00 
- D 0 - I - 0x00DD52 03:9D42: 56        .byte $56, $59, $59, $59, $59, $59, $59, $57   ; 01 
- D 0 - I - 0x00DD5A 03:9D4A: 17        .byte $17, $73, $71, $63, $69, $63, $68, $1A   ; 02 
- D 0 - I - 0x00DD62 03:9D52: 18        .byte $18, $68, $6E, $66, $67, $6A, $68, $1B   ; 03 
- D 0 - I - 0x00DD6A 03:9D5A: 16        .byte $16, $73, $70, $2B, $2B, $67, $68, $19   ; 04 
- D 0 - I - 0x00DD72 03:9D62: 75        .byte $75, $76, $76, $76, $76, $76, $76, $77   ; 05 
- D 0 - I - 0x00DD7A 03:9D6A: 18        .byte $18, $2B, $3C, $00, $00, $00, $00, $1B   ; 06 
- D 0 - I - 0x00DD82 03:9D72: 85        .byte $85, $00, $00, $00, $00, $00, $00, $1F   ; 07 



_off018_03_9D7A_0A:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DD8A 03:9D7A: 16        .byte $16, $00, $00, $00, $00, $00, $00, $19   ; 00 
- D 0 - I - 0x00DD92 03:9D82: 54        .byte $54, $58, $58, $58, $58, $58, $58, $55   ; 01 
- D 0 - I - 0x00DD9A 03:9D8A: 17        .byte $17, $68, $69, $00, $00, $00, $00, $1A   ; 02 
- D 0 - I - 0x00DDA2 03:9D92: 18        .byte $18, $01, $65, $00, $00, $00, $01, $1B   ; 03 
- D 0 - I - 0x00DDAA 03:9D9A: 16        .byte $16, $00, $67, $68, $68, $68, $68, $19   ; 04 
- D 0 - I - 0x00DDB2 03:9DA2: 54        .byte $54, $58, $58, $58, $58, $58, $58, $55   ; 05 
- D 0 - I - 0x00DDBA 03:9DAA: 17        .byte $17, $68, $68, $68, $68, $68, $68, $1A   ; 06 
- D 0 - I - 0x00DDC2 03:9DB2: 54        .byte $54, $58, $58, $58, $58, $58, $58, $55   ; 07 



_off018_03_9DBA_0B:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DDCA 03:9DBA: 16        .byte $16, $73, $71, $2B, $00, $63, $68, $19   ; 00 
- D 0 - I - 0x00DDD2 03:9DC2: 18        .byte $18, $68, $6E, $68, $69, $65, $63, $1B   ; 01 
- D 0 - I - 0x00DDDA 03:9DCA: 17        .byte $17, $71, $70, $63, $6A, $6A, $66, $1A   ; 02 
- D 0 - I - 0x00DDE2 03:9DD2: 18        .byte $18, $6E, $68, $6A, $6A, $66, $2B, $1B   ; 03 
- D 0 - I - 0x00DDEA 03:9DDA: 16        .byte $16, $70, $00, $65, $67, $69, $00, $19   ; 04 
- D 0 - I - 0x00DDF2 03:9DE2: 18        .byte $18, $68, $68, $66, $00, $67, $68, $1B   ; 05 
- D 0 - I - 0x00DDFA 03:9DEA: 54        .byte $54, $58, $58, $58, $58, $58, $58, $55   ; 06 
- D 0 - I - 0x00DE02 03:9DF2: 54        .byte $54, $58, $58, $58, $58, $58, $58, $55   ; 07 



_off018_03_9DFA_0C:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DE0A 03:9DFA: 3A        .byte $3A, $2F, $2F, $2F, $2F, $2F, $00, $19   ; 00 
- D 0 - I - 0x00DE12 03:9E02: 60        .byte $60, $15, $15, $15, $15, $15, $00, $1B   ; 01 
- D 0 - I - 0x00DE1A 03:9E0A: 5A        .byte $5A, $3C, $3C, $00, $15, $15, $15, $23   ; 02 
- D 0 - I - 0x00DE22 03:9E12: 3A        .byte $3A, $2F, $2F, $2F, $00, $15, $2F, $3B   ; 03 
- D 0 - I - 0x00DE2A 03:9E1A: 22        .byte $22, $15, $15, $15, $00, $00, $15, $61   ; 04 
- D 0 - I - 0x00DE32 03:9E22: 20        .byte $20, $14, $14, $14, $14, $3C, $3C, $5B   ; 05 
- D 0 - I - 0x00DE3A 03:9E2A: 1C        .byte $1C, $00, $00, $00, $00, $00, $00, $1D   ; 06 
- D 0 - I - 0x00DE42 03:9E32: 1E        .byte $1E, $00, $00, $00, $00, $00, $00, $1F   ; 07 



_off018_03_9E3A_0D:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DE4A 03:9E3A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 0 - I - 0x00DE52 03:9E42: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- D 0 - I - 0x00DE5A 03:9E4A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 0 - I - 0x00DE62 03:9E52: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- D 0 - I - 0x00DE6A 03:9E5A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- D 0 - I - 0x00DE72 03:9E62: 17        .byte $17, $00, $00, $00, $00, $00, $00, $1A   ; 05 
- D 0 - I - 0x00DE7A 03:9E6A: 18        .byte $18, $00, $00, $00, $00, $00, $00, $1B   ; 06 
- D 0 - I - 0x00DE82 03:9E72: 1E        .byte $1E, $00, $00, $00, $00, $00, $00, $1F   ; 07 



_off018_03_9E7A_0E:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x00DE8A 03:9E7A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x00DE92 03:9E82: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x00DE9A 03:9E8A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- - - - - - 0x00DEA2 03:9E92: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- - - - - - 0x00DEAA 03:9E9A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- - - - - - 0x00DEB2 03:9EA2: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 05 
- D 0 - I - 0x00DEBA 03:9EAA: 90        .byte $90, $91, $92, $90, $91, $92, $90, $91   ; 06 
- D 0 - I - 0x00DEC2 03:9EB2: A0        .byte $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0   ; 07 



_off018_03_9EBA_0F:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DECA 03:9EBA: 00        .byte $00, $00, $00, $00, $94, $AD, $AD, $AD   ; 00 
- D 0 - I - 0x00DED2 03:9EC2: 00        .byte $00, $00, $00, $00, $95, $AE, $AE, $AE   ; 01 
- D 0 - I - 0x00DEDA 03:9ECA: 00        .byte $00, $00, $00, $00, $96, $AC, $AC, $AC   ; 02 
- D 0 - I - 0x00DEE2 03:9ED2: 00        .byte $00, $00, $00, $00, $97, $AF, $AF, $AF   ; 03 
- D 0 - I - 0x00DEEA 03:9EDA: 00        .byte $00, $00, $00, $00, $9F, $AF, $AF, $AF   ; 04 
- D 0 - I - 0x00DEF2 03:9EE2: 98        .byte $98, $99, $99, $9A, $9B, $AC, $AC, $AC   ; 05 
- D 0 - I - 0x00DEFA 03:9EEA: 9C        .byte $9C, $7B, $9E, $79, $7A, $9C, $9D, $9C   ; 06 
- - - - - - 0x00DF02 03:9EF2: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_03_9EFA_10:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x00DF0A 03:9EFA: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x00DF12 03:9F02: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x00DF1A 03:9F0A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- - - - - - 0x00DF22 03:9F12: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- - - - - - 0x00DF2A 03:9F1A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- - - - - - 0x00DF32 03:9F22: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 05 
- D 0 - I - 0x00DF3A 03:9F2A: 92        .byte $92, $90, $91, $92, $93, $90, $91, $92   ; 06 
- D 0 - I - 0x00DF42 03:9F32: A0        .byte $A0, $A0, $A0, $A0, $A1, $AE, $AE, $AE   ; 07 



_off018_03_9F3A_11:
;                                              00   01   02   03   04   05   06   07
- D 0 - I - 0x00DF4A 03:9F3A: 00        .byte $00, $A5, $A6, $A7, $A8, $A9, $AA, $00   ; 00 
- D 0 - I - 0x00DF52 03:9F42: 00        .byte $00, $AB, $A2, $A2, $A2, $A2, $00, $00   ; 01 
- D 0 - I - 0x00DF5A 03:9F4A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 0 - I - 0x00DF62 03:9F52: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- D 0 - I - 0x00DF6A 03:9F5A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- D 0 - I - 0x00DF72 03:9F62: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 05 
- D 0 - I - 0x00DF7A 03:9F6A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 06 
- - - - - - 0x00DF82 03:9F72: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_03_9F7A_12:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x00DF8A 03:9F7A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x00DF92 03:9F82: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x00DF9A 03:9F8A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- - - - - - 0x00DFA2 03:9F92: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- - - - - - 0x00DFAA 03:9F9A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- - - - - - 0x00DFB2 03:9FA2: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 05 
- D 0 - I - 0x00DFBA 03:9FAA: 90        .byte $90, $91, $92, $90, $91, $92, $90, $91   ; 06 
- D 0 - I - 0x00DFC2 03:9FB2: A0        .byte $A0, $A0, $A0, $A3, $A4, $A0, $A0, $A0   ; 07 



_off006_0x00DFCA_03_area_4:
; 00 
- D 0 - I - 0x00DFCA 03:9FBA: 00        .byte $00, $00, $00, $00   ; 
- D 0 - I - 0x00DFCE 03:9FBE: 00        .byte $00, $00, $00, $00   ; 
- D 0 - I - 0x00DFD2 03:9FC2: 00        .byte $00, $00, $00, $00   ; 
- D 0 - I - 0x00DFD6 03:9FC6: 00        .byte $00, $00, $00, $00   ; 
; 01 
- D 0 - I - 0x00DFDA 03:9FCA: 12        .byte $12, $75, $13, $76   ; 
- D 0 - I - 0x00DFDE 03:9FCE: 77        .byte $77, $78, $79, $7A   ; 
- D 0 - I - 0x00DFE2 03:9FD2: 14        .byte $14, $7B, $15, $7C   ; 
- D 0 - I - 0x00DFE6 03:9FD6: 7D        .byte $7D, $7E, $7F, $80   ; 
; 02 
- D 0 - I - 0x00DFEA 03:9FDA: 81        .byte $81, $82, $83, $84   ; 
- D 0 - I - 0x00DFEE 03:9FDE: 85        .byte $85, $86, $87, $88   ; 
- D 0 - I - 0x00DFF2 03:9FE2: 89        .byte $89, $8A, $8B, $8C   ; 
- D 0 - I - 0x00DFF6 03:9FE6: 8D        .byte $8D, $8E, $8F, $90   ; 
; 03 
- D 0 - I - 0x00DFFA 03:9FEA: 91        .byte $91, $92, $93, $94   ; 
- D 0 - I - 0x00DFFE 03:9FEE: 95        .byte $95, $96, $97, $98   ; 
- D 0 - I - 0x00E002 03:9FF2: 99        .byte $99, $9A, $9B, $9C   ; 
- D 0 - I - 0x00E006 03:9FF6: 9D        .byte $9D, $9E, $9F, $A0   ; 
; 04 
- D 0 - I - 0x00E00A 03:9FFA: 12        .byte $12, $75, $13, $76   ; 
- D 0 - I - 0x00E00E 03:9FFE: 77        .byte $77, $78, $79, $7A   ; 
- D 1 - I - 0x00E012 03:A002: 14        .byte $14, $7B, $15, $7C   ; 
- D 1 - I - 0x00E016 03:A006: 7D        .byte $7D, $7E, $7F, $80   ; 
; 05 
- D 1 - I - 0x00E01A 03:A00A: 81        .byte $81, $82, $83, $84   ; 
- D 1 - I - 0x00E01E 03:A00E: 85        .byte $85, $86, $87, $88   ; 
- D 1 - I - 0x00E022 03:A012: 89        .byte $89, $8A, $8B, $8C   ; 
- D 1 - I - 0x00E026 03:A016: 8D        .byte $8D, $8E, $8F, $90   ; 
; 06 
- D 1 - I - 0x00E02A 03:A01A: 91        .byte $91, $92, $93, $94   ; 
- D 1 - I - 0x00E02E 03:A01E: 95        .byte $95, $96, $97, $98   ; 
- D 1 - I - 0x00E032 03:A022: 99        .byte $99, $9A, $9B, $9C   ; 
- D 1 - I - 0x00E036 03:A026: 9D        .byte $9D, $9E, $9F, $A0   ; 
; 07 
- - - - - - 0x00E03A 03:A02A: 12        .byte $12, $75, $13, $76   ; 
- - - - - - 0x00E03E 03:A02E: 77        .byte $77, $78, $79, $7A   ; 
- - - - - - 0x00E042 03:A032: 14        .byte $14, $7B, $15, $7C   ; 
- - - - - - 0x00E046 03:A036: 7D        .byte $7D, $7E, $7F, $80   ; 
; 08 
- D 1 - I - 0x00E04A 03:A03A: 81        .byte $81, $82, $83, $84   ; 
- D 1 - I - 0x00E04E 03:A03E: 85        .byte $85, $86, $87, $88   ; 
- D 1 - I - 0x00E052 03:A042: 89        .byte $89, $8A, $8B, $8C   ; 
- D 1 - I - 0x00E056 03:A046: 8D        .byte $8D, $8E, $8F, $90   ; 
; 09 
- D 1 - I - 0x00E05A 03:A04A: 91        .byte $91, $92, $93, $94   ; 
- D 1 - I - 0x00E05E 03:A04E: 95        .byte $95, $96, $97, $98   ; 
- D 1 - I - 0x00E062 03:A052: 99        .byte $99, $9A, $9B, $9C   ; 
- D 1 - I - 0x00E066 03:A056: 9D        .byte $9D, $9E, $9F, $A0   ; 
; 0A 
- D 1 - I - 0x00E06A 03:A05A: 12        .byte $12, $75, $13, $76   ; 
- D 1 - I - 0x00E06E 03:A05E: 77        .byte $77, $78, $79, $7A   ; 
- D 1 - I - 0x00E072 03:A062: 14        .byte $14, $7B, $15, $7C   ; 
- D 1 - I - 0x00E076 03:A066: 7D        .byte $7D, $7E, $7F, $80   ; 
; 0B 
- D 1 - I - 0x00E07A 03:A06A: 81        .byte $81, $82, $83, $84   ; 
- D 1 - I - 0x00E07E 03:A06E: 85        .byte $85, $86, $87, $88   ; 
- D 1 - I - 0x00E082 03:A072: 89        .byte $89, $8A, $8B, $8C   ; 
- D 1 - I - 0x00E086 03:A076: 8D        .byte $8D, $8E, $8F, $90   ; 
; 0C 
- D 1 - I - 0x00E08A 03:A07A: 91        .byte $91, $92, $93, $94   ; 
- D 1 - I - 0x00E08E 03:A07E: 95        .byte $95, $96, $97, $98   ; 
- D 1 - I - 0x00E092 03:A082: 99        .byte $99, $9A, $9B, $9C   ; 
- D 1 - I - 0x00E096 03:A086: 9D        .byte $9D, $9E, $9F, $A0   ; 
; 0D 
- D 1 - I - 0x00E09A 03:A08A: 91        .byte $91, $82, $83, $84   ; 
- D 1 - I - 0x00E09E 03:A08E: 85        .byte $85, $90, $A3, $88   ; 
- D 1 - I - 0x00E0A2 03:A092: 89        .byte $89, $A4, $31, $8C   ; 
- D 1 - I - 0x00E0A6 03:A096: 9D        .byte $9D, $8E, $8F, $80   ; 
; 0E 
- D 1 - I - 0x00E0AA 03:A09A: 42        .byte $42, $48, $43, $3A   ; 
- D 1 - I - 0x00E0AE 03:A09E: 42        .byte $42, $57, $44, $3A   ; 
- D 1 - I - 0x00E0B2 03:A0A2: 42        .byte $42, $3A, $3A, $3A   ; 
- D 1 - I - 0x00E0B6 03:A0A6: 60        .byte $60, $D2, $61, $D2   ; 
; 0F 
- D 1 - I - 0x00E0BA 03:A0AA: 48        .byte $48, $43, $3A, $56   ; 
- D 1 - I - 0x00E0BE 03:A0AE: 57        .byte $57, $44, $3A, $56   ; 
- D 1 - I - 0x00E0C2 03:A0B2: 3A        .byte $3A, $3A, $3A, $56   ; 
- D 1 - I - 0x00E0C6 03:A0B6: 61        .byte $61, $D2, $61, $62   ; 
; 10 
- D 1 - I - 0x00E0CA 03:A0BA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E0CE 03:A0BE: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E0D2 03:A0C2: 49        .byte $49, $51, $49, $51   ; 
- D 1 - I - 0x00E0D6 03:A0C6: 52        .byte $52, $53, $52, $53   ; 
; 11 
- D 1 - I - 0x00E0DA 03:A0CA: 46        .byte $46, $46, $46, $5D   ; 
- D 1 - I - 0x00E0DE 03:A0CE: 3A        .byte $3A, $3A, $3A, $56   ; 
- D 1 - I - 0x00E0E2 03:A0D2: 46        .byte $46, $46, $46, $5D   ; 
- D 1 - I - 0x00E0E6 03:A0D6: 3A        .byte $3A, $3A, $3A, $56   ; 
; 12 
- D 1 - I - 0x00E0EA 03:A0DA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E0EE 03:A0DE: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E0F2 03:A0E2: 32        .byte $32, $32, $32, $32   ; 
- D 1 - I - 0x00E0F6 03:A0E6: DC        .byte $DC, $DC, $DC, $DC   ; 
; 13 
- D 1 - I - 0x00E0FA 03:A0EA: 32        .byte $32, $D3, $3F, $3A   ; 
- D 1 - I - 0x00E0FE 03:A0EE: DC        .byte $DC, $D4, $3D, $3A   ; 
- D 1 - I - 0x00E102 03:A0F2: 34        .byte $34, $34, $3A, $3A   ; 
- D 1 - I - 0x00E106 03:A0F6: C5        .byte $C5, $C5, $C5, $C5   ; 
; 14 
- D 1 - I - 0x00E10A 03:A0FA: 0D        .byte $0D, $0F, $0D, $0F   ; 
- D 1 - I - 0x00E10E 03:A0FE: E7        .byte $E7, $E8, $E7, $E8   ; 
- D 1 - I - 0x00E112 03:A102: 2B        .byte $2B, $2B, $2B, $2B   ; 
- D 1 - I - 0x00E116 03:A106: DD        .byte $DD, $DE, $DE, $DF   ; 
; 15 
- D 1 - I - 0x00E11A 03:A10A: 2B        .byte $2B, $2B, $2B, $2B   ; 
- D 1 - I - 0x00E11E 03:A10E: DD        .byte $DD, $DE, $DE, $DF   ; 
- D 1 - I - 0x00E122 03:A112: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E126 03:A116: 00        .byte $00, $00, $00, $00   ; 
; 16 
- D 1 - I - 0x00E12A 03:A11A: 34        .byte $34, $EF, $0C, $00   ; 
- D 1 - I - 0x00E12E 03:A11E: 3A        .byte $3A, $F0, $0C, $00   ; 
- D 1 - I - 0x00E132 03:A122: 37        .byte $37, $37, $0C, $00   ; 
- D 1 - I - 0x00E136 03:A126: 3A        .byte $3A, $F8, $0C, $00   ; 
; 17 
- D 1 - I - 0x00E13A 03:A12A: 38        .byte $38, $EF, $0C, $00   ; 
- D 1 - I - 0x00E13E 03:A12E: F2        .byte $F2, $F3, $0C, $00   ; 
- D 1 - I - 0x00E142 03:A132: 39        .byte $39, $F4, $0C, $00   ; 
- D 1 - I - 0x00E146 03:A136: 3A        .byte $3A, $F0, $0C, $00   ; 
; 18 
- D 1 - I - 0x00E14A 03:A13A: 3A        .byte $3A, $F0, $0C, $00   ; 
- D 1 - I - 0x00E14E 03:A13E: F5        .byte $F5, $F6, $0C, $00   ; 
- D 1 - I - 0x00E152 03:A142: 3B        .byte $3B, $F7, $0C, $00   ; 
- D 1 - I - 0x00E156 03:A146: C5        .byte $C5, $F1, $1B, $00   ; 
; 19 
- D 1 - I - 0x00E15A 03:A14A: 00        .byte $00, $D5, $33, $EA   ; 
- D 1 - I - 0x00E15E 03:A14E: 00        .byte $00, $D5, $EB, $EC   ; 
- D 1 - I - 0x00E162 03:A152: 00        .byte $00, $D5, $3C, $ED   ; 
- D 1 - I - 0x00E166 03:A156: 00        .byte $00, $D5, $3D, $3A   ; 
; 1A 
- D 1 - I - 0x00E16A 03:A15A: 00        .byte $00, $D5, $33, $34   ; 
- D 1 - I - 0x00E16E 03:A15E: 00        .byte $00, $D5, $3D, $3A   ; 
- D 1 - I - 0x00E172 03:A162: 00        .byte $00, $D5, $37, $37   ; 
- D 1 - I - 0x00E176 03:A166: 00        .byte $00, $D5, $3F, $3A   ; 
; 1B 
- D 1 - I - 0x00E17A 03:A16A: 00        .byte $00, $D5, $3D, $3A   ; 
- D 1 - I - 0x00E17E 03:A16E: 00        .byte $00, $D5, $EE, $43   ; 
- D 1 - I - 0x00E182 03:A172: 00        .byte $00, $D5, $3E, $44   ; 
- D 1 - I - 0x00E186 03:A176: 00        .byte $00, $D6, $E9, $C5   ; 
; 1C 
- D 1 - I - 0x00E18A 03:A17A: 34        .byte $34, $EF, $0E, $00   ; 
- D 1 - I - 0x00E18E 03:A17E: 37        .byte $37, $37, $0C, $00   ; 
- D 1 - I - 0x00E192 03:A182: 3A        .byte $3A, $F0, $0C, $00   ; 
- D 1 - I - 0x00E196 03:A186: C5        .byte $C5, $F1, $1B, $00   ; 
; 1D 
- D 1 - I - 0x00E19A 03:A18A: 00        .byte $00, $D9, $33, $34   ; 
- D 1 - I - 0x00E19E 03:A18E: 00        .byte $00, $D5, $37, $37   ; 
- D 1 - I - 0x00E1A2 03:A192: 00        .byte $00, $D5, $3D, $3A   ; 
- D 1 - I - 0x00E1A6 03:A196: 00        .byte $00, $D6, $E9, $C5   ; 
; 1E 
- D 1 - I - 0x00E1AA 03:A19A: 3A        .byte $3A, $F8, $0C, $00   ; 
- D 1 - I - 0x00E1AE 03:A19E: C5        .byte $C5, $F1, $0C, $00   ; 
- - - - - - 0x00E1B2 03:A1A2: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E1B6 03:A1A6: 00        .byte $00, $00, $00, $00   ; 
; 1F 
- D 1 - I - 0x00E1BA 03:A1AA: 00        .byte $00, $D5, $3F, $3A   ; 
- D 1 - I - 0x00E1BE 03:A1AE: 00        .byte $00, $D5, $E9, $C5   ; 
- - - - - - 0x00E1C2 03:A1B2: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E1C6 03:A1B6: 00        .byte $00, $00, $00, $00   ; 
; 20 
- D 1 - I - 0x00E1CA 03:A1BA: 34        .byte $34, $EF, $0C, $0F   ; 
- D 1 - I - 0x00E1CE 03:A1BE: F5        .byte $F5, $F6, $0C, $E8   ; 
- D 1 - I - 0x00E1D2 03:A1C2: 3B        .byte $3B, $F7, $28, $2B   ; 
- D 1 - I - 0x00E1D6 03:A1C6: C5        .byte $C5, $F1, $DE, $DF   ; 
; 21 
- D 1 - I - 0x00E1DA 03:A1CA: 0F        .byte $0F, $D5, $33, $EA   ; 
- D 1 - I - 0x00E1DE 03:A1CE: E8        .byte $E8, $D5, $EB, $EC   ; 
- D 1 - I - 0x00E1E2 03:A1D2: 2B        .byte $2B, $D7, $3C, $ED   ; 
- D 1 - I - 0x00E1E6 03:A1D6: DD        .byte $DD, $DF, $E9, $C5   ; 
; 22 
- D 1 - I - 0x00E1EA 03:A1DA: 38        .byte $38, $EF, $28, $2B   ; 
- D 1 - I - 0x00E1EE 03:A1DE: F2        .byte $F2, $F3, $DE, $DE   ; 
- D 1 - I - 0x00E1F2 03:A1E2: 39        .byte $39, $F4, $0E, $00   ; 
- D 1 - I - 0x00E1F6 03:A1E6: C5        .byte $C5, $F1, $1B, $00   ; 
; 23 
- D 1 - I - 0x00E1FA 03:A1EA: 2B        .byte $2B, $D7, $33, $34   ; 
- D 1 - I - 0x00E1FE 03:A1EE: DE        .byte $DE, $DF, $EE, $43   ; 
- D 1 - I - 0x00E202 03:A1F2: 00        .byte $00, $D9, $3E, $44   ; 
- D 1 - I - 0x00E206 03:A1F6: 00        .byte $00, $D6, $E9, $C5   ; 
; 24 
- D 1 - I - 0x00E20A 03:A1FA: 00        .byte $00, $BF, $10, $10   ; 
- D 1 - I - 0x00E20E 03:A1FE: 00        .byte $00, $BF, $10, $10   ; 
- D 1 - I - 0x00E212 03:A202: 00        .byte $00, $BF, $10, $10   ; 
- D 1 - I - 0x00E216 03:A206: 00        .byte $00, $BF, $10, $10   ; 
; 25 
- - - - - - 0x00E21A 03:A20A: 10        .byte $10, $10, $10, $10   ; 
- - - - - - 0x00E21E 03:A20E: 10        .byte $10, $10, $10, $10   ; 
- - - - - - 0x00E222 03:A212: 10        .byte $10, $10, $10, $10   ; 
- - - - - - 0x00E226 03:A216: 10        .byte $10, $10, $10, $10   ; 
; 26 
- D 1 - I - 0x00E22A 03:A21A: 10        .byte $10, $10, $11, $00   ; 
- D 1 - I - 0x00E22E 03:A21E: 10        .byte $10, $10, $11, $00   ; 
- D 1 - I - 0x00E232 03:A222: 10        .byte $10, $10, $11, $00   ; 
- D 1 - I - 0x00E236 03:A226: 10        .byte $10, $10, $11, $00   ; 
; 27 
- D 1 - I - 0x00E23A 03:A22A: 06        .byte $06, $B2, $07, $00   ; 
- D 1 - I - 0x00E23E 03:A22E: B6        .byte $B6, $B7, $B8, $00   ; 
- D 1 - I - 0x00E242 03:A232: 09        .byte $09, $BA, $00, $00   ; 
- D 1 - I - 0x00E246 03:A236: 00        .byte $00, $00, $00, $00   ; 
; 28 
- - - - - - 0x00E24A 03:A23A: 00        .byte $00, $BF, $10, $10   ; 
- - - - - - 0x00E24E 03:A23E: 00        .byte $00, $BF, $10, $10   ; 
- - - - - - 0x00E252 03:A242: 00        .byte $00, $BF, $10, $10   ; 
- - - - - - 0x00E256 03:A246: 00        .byte $00, $BF, $10, $10   ; 
; 29 
- - - - - - 0x00E25A 03:A24A: 10        .byte $10, $10, $10, $10   ; 
- - - - - - 0x00E25E 03:A24E: 10        .byte $10, $10, $10, $10   ; 
- - - - - - 0x00E262 03:A252: 10        .byte $10, $10, $10, $10   ; 
- - - - - - 0x00E266 03:A256: 10        .byte $10, $10, $10, $10   ; 
; 2A 
- - - - - - 0x00E26A 03:A25A: 10        .byte $10, $10, $11, $00   ; 
- - - - - - 0x00E26E 03:A25E: 10        .byte $10, $10, $11, $00   ; 
- - - - - - 0x00E272 03:A262: 10        .byte $10, $10, $11, $00   ; 
- - - - - - 0x00E276 03:A266: 10        .byte $10, $10, $11, $00   ; 
; 2B 
- D 1 - I - 0x00E27A 03:A26A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E27E 03:A26E: 00        .byte $00, $BC, $BD, $00   ; 
- D 1 - I - 0x00E282 03:A272: 00        .byte $00, $BE, $16, $00   ; 
- D 1 - I - 0x00E286 03:A276: 00        .byte $00, $00, $00, $00   ; 
; 2C 
- D 1 - I - 0x00E28A 03:A27A: 2B        .byte $2B, $2B, $2B, $2B   ; 
- D 1 - I - 0x00E28E 03:A27E: DD        .byte $DD, $DE, $DE, $DF   ; 
- D 1 - I - 0x00E292 03:A282: 00        .byte $00, $C0, $17, $17   ; 
- D 1 - I - 0x00E296 03:A286: 00        .byte $00, $BF, $10, $10   ; 
; 2D 
- D 1 - I - 0x00E29A 03:A28A: 2B        .byte $2B, $2B, $2B, $2B   ; 
- D 1 - I - 0x00E29E 03:A28E: DD        .byte $DD, $DE, $DE, $DF   ; 
- D 1 - I - 0x00E2A2 03:A292: 17        .byte $17, $17, $17, $17   ; 
- D 1 - I - 0x00E2A6 03:A296: 10        .byte $10, $10, $10, $10   ; 
; 2E 
- D 1 - I - 0x00E2AA 03:A29A: 2B        .byte $2B, $2B, $2B, $2B   ; 
- D 1 - I - 0x00E2AE 03:A29E: DD        .byte $DD, $DE, $DE, $DF   ; 
- D 1 - I - 0x00E2B2 03:A2A2: 17        .byte $17, $17, $18, $00   ; 
- D 1 - I - 0x00E2B6 03:A2A6: 10        .byte $10, $10, $11, $00   ; 
; 2F 
- D 1 - I - 0x00E2BA 03:A2AA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E2BE 03:A2AE: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E2C2 03:A2B2: 0D        .byte $0D, $0F, $0D, $0F   ; 
- D 1 - I - 0x00E2C6 03:A2B6: E7        .byte $E7, $E8, $E7, $E8   ; 
; 30 
- D 1 - I - 0x00E2CA 03:A2BA: 34        .byte $34, $EF, $2C, $2B   ; 
- D 1 - I - 0x00E2CE 03:A2BE: 3A        .byte $3A, $3A, $22, $22   ; 
- D 1 - I - 0x00E2D2 03:A2C2: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00E2D6 03:A2C6: C5        .byte $C5, $C5, $C5, $C5   ; 
; 31 
- D 1 - I - 0x00E2DA 03:A2CA: 4A        .byte $4A, $D7, $33, $34   ; 
- D 1 - I - 0x00E2DE 03:A2CE: 22        .byte $22, $22, $3A, $3A   ; 
- D 1 - I - 0x00E2E2 03:A2D2: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00E2E6 03:A2D6: C5        .byte $C5, $C5, $C5, $C5   ; 
; 32 
- D 1 - I - 0x00E2EA 03:A2DA: 2B        .byte $2B, $2B, $00, $00   ; 
- D 1 - I - 0x00E2EE 03:A2DE: DE        .byte $DE, $DF, $00, $00   ; 
- D 1 - I - 0x00E2F2 03:A2E2: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E2F6 03:A2E6: 00        .byte $00, $00, $00, $00   ; 
; 33 
- D 1 - I - 0x00E2FA 03:A2EA: 0D        .byte $0D, $0F, $00, $00   ; 
- D 1 - I - 0x00E2FE 03:A2EE: E7        .byte $E7, $E8, $00, $00   ; 
- D 1 - I - 0x00E302 03:A2F2: 2B        .byte $2B, $2B, $00, $00   ; 
- D 1 - I - 0x00E306 03:A2F6: DD        .byte $DD, $DF, $00, $00   ; 
; 34 
- D 1 - I - 0x00E30A 03:A2FA: 34        .byte $34, $EF, $28, $2B   ; 
- D 1 - I - 0x00E30E 03:A2FE: 3A        .byte $3A, $3A, $DE, $DE   ; 
- - - - - - 0x00E312 03:A302: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E316 03:A306: 00        .byte $00, $00, $00, $00   ; 
; 35 
- - - - - - 0x00E31A 03:A30A: 00        .byte $00, $BF, $10, $10   ; 
- - - - - - 0x00E31E 03:A30E: 00        .byte $00, $BF, $10, $10   ; 
- - - - - - 0x00E322 03:A312: 0D        .byte $0D, $0F, $0D, $0F   ; 
- - - - - - 0x00E326 03:A316: E7        .byte $E7, $E8, $E7, $E8   ; 
; 36 
- D 1 - I - 0x00E32A 03:A31A: 10        .byte $10, $10, $10, $10   ; 
- D 1 - I - 0x00E32E 03:A31E: 10        .byte $10, $10, $10, $10   ; 
- D 1 - I - 0x00E332 03:A322: 0D        .byte $0D, $0F, $0D, $0F   ; 
- D 1 - I - 0x00E336 03:A326: E7        .byte $E7, $E8, $E7, $E8   ; 
; 37 
- D 1 - I - 0x00E33A 03:A32A: 10        .byte $10, $10, $11, $00   ; 
- D 1 - I - 0x00E33E 03:A32E: 10        .byte $10, $10, $11, $00   ; 
- D 1 - I - 0x00E342 03:A332: 0D        .byte $0D, $0F, $0D, $0F   ; 
- D 1 - I - 0x00E346 03:A336: E7        .byte $E7, $E8, $E7, $E8   ; 
; 38 
- D 1 - I - 0x00E34A 03:A33A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E34E 03:A33E: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E352 03:A342: 00        .byte $00, $00, $2B, $2B   ; 
- D 1 - I - 0x00E356 03:A346: 00        .byte $00, $00, $DD, $DF   ; 
; 39 
- - - - - - 0x00E35A 03:A34A: 2B        .byte $2B, $2B, $2B, $2B   ; 
- - - - - - 0x00E35E 03:A34E: DD        .byte $DD, $DE, $DE, $DF   ; 
- - - - - - 0x00E362 03:A352: 0D        .byte $0D, $0F, $0D, $0F   ; 
- - - - - - 0x00E366 03:A356: E7        .byte $E7, $E8, $E7, $E8   ; 
; 3A 
- D 1 - I - 0x00E36A 03:A35A: 34        .byte $34, $EF, $0C, $00   ; 
- D 1 - I - 0x00E36E 03:A35E: 37        .byte $37, $37, $0C, $00   ; 
- D 1 - I - 0x00E372 03:A362: 3A        .byte $3A, $F0, $0C, $0F   ; 
- D 1 - I - 0x00E376 03:A366: C5        .byte $C5, $F1, $0C, $E8   ; 
; 3B 
- D 1 - I - 0x00E37A 03:A36A: 00        .byte $00, $D5, $33, $34   ; 
- D 1 - I - 0x00E37E 03:A36E: 00        .byte $00, $D5, $37, $37   ; 
- D 1 - I - 0x00E382 03:A372: 0F        .byte $0F, $D5, $3D, $3A   ; 
- D 1 - I - 0x00E386 03:A376: E8        .byte $E8, $D5, $3D, $3A   ; 
; 3C 
- D 1 - I - 0x00E38A 03:A37A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E38E 03:A37E: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E392 03:A382: 2B        .byte $2B, $2B, $2B, $2B   ; 
- D 1 - I - 0x00E396 03:A386: DD        .byte $DD, $DE, $DE, $DF   ; 
; 3D 
- - - - - - 0x00E39A 03:A38A: 34        .byte $34, $EF, $28, $2B   ; 
- - - - - - 0x00E39E 03:A38E: 37        .byte $37, $37, $34, $34   ; 
- - - - - - 0x00E3A2 03:A392: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E3A6 03:A396: 00        .byte $00, $00, $00, $00   ; 
; 3E 
- - - - - - 0x00E3AA 03:A39A: 2B        .byte $2B, $D7, $33, $34   ; 
- - - - - - 0x00E3AE 03:A39E: 34        .byte $34, $34, $37, $37   ; 
- - - - - - 0x00E3B2 03:A3A2: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E3B6 03:A3A6: 00        .byte $00, $00, $00, $00   ; 
; 3F 
- - - - - - 0x00E3BA 03:A3AA: 2B        .byte $2B, $2B, $00, $00   ; 
- - - - - - 0x00E3BE 03:A3AE: 34        .byte $34, $EF, $00, $00   ; 
- - - - - - 0x00E3C2 03:A3B2: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E3C6 03:A3B6: 00        .byte $00, $00, $00, $00   ; 
; 40 
- D 1 - I - 0x00E3CA 03:A3BA: 00        .byte $00, $00, $2B, $2B   ; 
- D 1 - I - 0x00E3CE 03:A3BE: 00        .byte $00, $00, $DD, $DE   ; 
- D 1 - I - 0x00E3D2 03:A3C2: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E3D6 03:A3C6: 00        .byte $00, $00, $00, $00   ; 
; 41 
- D 1 - I - 0x00E3DA 03:A3CA: 4A        .byte $4A, $4A, $00, $00   ; 
- D 1 - I - 0x00E3DE 03:A3CE: 22        .byte $22, $EF, $00, $00   ; 
- D 1 - I - 0x00E3E2 03:A3D2: 3A        .byte $3A, $F0, $49, $51   ; 
- D 1 - I - 0x00E3E6 03:A3D6: C5        .byte $C5, $F1, $52, $53   ; 
; 42 
- D 1 - I - 0x00E3EA 03:A3DA: 00        .byte $00, $00, $4A, $4A   ; 
- D 1 - I - 0x00E3EE 03:A3DE: 00        .byte $00, $00, $21, $34   ; 
- D 1 - I - 0x00E3F2 03:A3E2: 49        .byte $49, $51, $3D, $3A   ; 
- D 1 - I - 0x00E3F6 03:A3E6: 52        .byte $52, $53, $C4, $C5   ; 
; 43 
- D 1 - I - 0x00E3FA 03:A3EA: 34        .byte $34, $EF, $0C, $17   ; 
- D 1 - I - 0x00E3FE 03:A3EE: 3A        .byte $3A, $F0, $0C, $17   ; 
- D 1 - I - 0x00E402 03:A3F2: 37        .byte $37, $37, $0C, $17   ; 
- D 1 - I - 0x00E406 03:A3F6: 3A        .byte $3A, $F8, $0C, $17   ; 
; 44 
- D 1 - I - 0x00E40A 03:A3FA: 38        .byte $38, $EF, $0C, $17   ; 
- D 1 - I - 0x00E40E 03:A3FE: F2        .byte $F2, $F3, $0C, $17   ; 
- D 1 - I - 0x00E412 03:A402: 39        .byte $39, $F4, $0C, $17   ; 
- D 1 - I - 0x00E416 03:A406: 3A        .byte $3A, $F0, $0C, $17   ; 
; 45 
- D 1 - I - 0x00E41A 03:A40A: 3A        .byte $3A, $F0, $0C, $17   ; 
- D 1 - I - 0x00E41E 03:A40E: F5        .byte $F5, $F6, $0C, $17   ; 
- D 1 - I - 0x00E422 03:A412: 3B        .byte $3B, $F7, $0C, $17   ; 
- D 1 - I - 0x00E426 03:A416: C5        .byte $C5, $F1, $1B, $17   ; 
; 46 
- D 1 - I - 0x00E42A 03:A41A: 17        .byte $17, $D5, $33, $EA   ; 
- D 1 - I - 0x00E42E 03:A41E: 17        .byte $17, $D5, $EB, $EC   ; 
- D 1 - I - 0x00E432 03:A422: 17        .byte $17, $D5, $3C, $ED   ; 
- D 1 - I - 0x00E436 03:A426: 17        .byte $17, $D5, $3D, $3A   ; 
; 47 
- - - - - - 0x00E43A 03:A42A: 17        .byte $17, $D5, $33, $34   ; 
- - - - - - 0x00E43E 03:A42E: 17        .byte $17, $D5, $3D, $3A   ; 
- - - - - - 0x00E442 03:A432: 17        .byte $17, $D5, $37, $37   ; 
- - - - - - 0x00E446 03:A436: 17        .byte $17, $D5, $3F, $3A   ; 
; 48 
- - - - - - 0x00E44A 03:A43A: 17        .byte $17, $D5, $3D, $3A   ; 
- - - - - - 0x00E44E 03:A43E: 17        .byte $17, $D5, $EE, $43   ; 
- - - - - - 0x00E452 03:A442: 17        .byte $17, $D5, $3E, $44   ; 
- - - - - - 0x00E456 03:A446: 17        .byte $17, $D6, $E9, $C5   ; 
; 49 
- D 1 - I - 0x00E45A 03:A44A: 34        .byte $34, $EF, $0E, $17   ; 
- D 1 - I - 0x00E45E 03:A44E: 37        .byte $37, $37, $0C, $17   ; 
- D 1 - I - 0x00E462 03:A452: 3A        .byte $3A, $F0, $0C, $17   ; 
- D 1 - I - 0x00E466 03:A456: C5        .byte $C5, $F1, $1B, $17   ; 
; 4A 
- D 1 - I - 0x00E46A 03:A45A: 17        .byte $17, $D9, $33, $34   ; 
- D 1 - I - 0x00E46E 03:A45E: 17        .byte $17, $D5, $37, $37   ; 
- D 1 - I - 0x00E472 03:A462: 17        .byte $17, $D5, $3D, $3A   ; 
- D 1 - I - 0x00E476 03:A466: 17        .byte $17, $D6, $E9, $C5   ; 
; 4B 
- - - - - - 0x00E47A 03:A46A: 3A        .byte $3A, $F8, $0C, $17   ; 
- - - - - - 0x00E47E 03:A46E: C5        .byte $C5, $F1, $0C, $17   ; 
- - - - - - 0x00E482 03:A472: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E486 03:A476: 00        .byte $00, $00, $00, $00   ; 
; 4C 
- - - - - - 0x00E48A 03:A47A: 17        .byte $17, $D5, $3F, $3A   ; 
- - - - - - 0x00E48E 03:A47E: 17        .byte $17, $D5, $E9, $C5   ; 
- - - - - - 0x00E492 03:A482: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E496 03:A486: 00        .byte $00, $00, $00, $00   ; 
; 4D 
- D 1 - I - 0x00E49A 03:A48A: 38        .byte $38, $EF, $28, $2B   ; 
- D 1 - I - 0x00E49E 03:A48E: F2        .byte $F2, $F3, $DE, $DE   ; 
- D 1 - I - 0x00E4A2 03:A492: 39        .byte $39, $F4, $0E, $17   ; 
- D 1 - I - 0x00E4A6 03:A496: C5        .byte $C5, $F1, $1B, $17   ; 
; 4E 
- D 1 - I - 0x00E4AA 03:A49A: 2B        .byte $2B, $D7, $33, $34   ; 
- D 1 - I - 0x00E4AE 03:A49E: DE        .byte $DE, $DF, $EE, $43   ; 
- D 1 - I - 0x00E4B2 03:A4A2: 17        .byte $17, $D9, $3E, $44   ; 
- D 1 - I - 0x00E4B6 03:A4A6: 17        .byte $17, $D6, $E9, $C5   ; 
; 4F 
- D 1 - I - 0x00E4BA 03:A4AA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E4BE 03:A4AE: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E4C2 03:A4B2: 2B        .byte $2B, $2B, $00, $00   ; 
- D 1 - I - 0x00E4C6 03:A4B6: DD        .byte $DD, $DF, $00, $00   ; 
; 50 
- D 1 - I - 0x00E4CA 03:A4BA: 34        .byte $34, $EF, $0C, $00   ; 
- D 1 - I - 0x00E4CE 03:A4BE: F5        .byte $F5, $F6, $0C, $00   ; 
- D 1 - I - 0x00E4D2 03:A4C2: 3B        .byte $3B, $F7, $28, $2B   ; 
- D 1 - I - 0x00E4D6 03:A4C6: C5        .byte $C5, $F1, $DE, $DF   ; 
; 51 
- - - - - - 0x00E4DA 03:A4CA: 00        .byte $00, $D5, $33, $EA   ; 
- - - - - - 0x00E4DE 03:A4CE: 00        .byte $00, $D5, $EB, $EC   ; 
- - - - - - 0x00E4E2 03:A4D2: 2B        .byte $2B, $D7, $3C, $ED   ; 
- - - - - - 0x00E4E6 03:A4D6: DD        .byte $DD, $DF, $E9, $C5   ; 
; 52 
- - - - - - 0x00E4EA 03:A4DA: 10        .byte $10, $10, $11, $00   ; 
- - - - - - 0x00E4EE 03:A4DE: 10        .byte $10, $10, $11, $00   ; 
- - - - - - 0x00E4F2 03:A4E2: 2B        .byte $2B, $2B, $2B, $2B   ; 
- - - - - - 0x00E4F6 03:A4E6: DD        .byte $DD, $DE, $DE, $DF   ; 
; 53 
- - - - - - 0x00E4FA 03:A4EA: 00        .byte $00, $BF, $10, $10   ; 
- - - - - - 0x00E4FE 03:A4EE: 00        .byte $00, $BF, $10, $10   ; 
- - - - - - 0x00E502 03:A4F2: 2B        .byte $2B, $2B, $2B, $2B   ; 
- - - - - - 0x00E506 03:A4F6: DD        .byte $DD, $DE, $DE, $DF   ; 
; 54 
- D 1 - I - 0x00E50A 03:A4FA: 3A        .byte $3A, $F0, $19, $1A   ; 
- D 1 - I - 0x00E50E 03:A4FE: 3A        .byte $3A, $F0, $0C, $00   ; 
- D 1 - I - 0x00E512 03:A502: 3A        .byte $3A, $F0, $0C, $00   ; 
- D 1 - I - 0x00E516 03:A506: C5        .byte $C5, $F1, $1B, $00   ; 
; 55 
- D 1 - I - 0x00E51A 03:A50A: 1A        .byte $1A, $E1, $3D, $3A   ; 
- D 1 - I - 0x00E51E 03:A50E: 00        .byte $00, $D5, $3D, $3A   ; 
- D 1 - I - 0x00E522 03:A512: 00        .byte $00, $D5, $3D, $3A   ; 
- D 1 - I - 0x00E526 03:A516: 00        .byte $00, $D6, $E9, $C5   ; 
; 56 
- D 1 - I - 0x00E52A 03:A51A: 3A        .byte $3A, $F0, $0C, $00   ; 
- D 1 - I - 0x00E52E 03:A51E: C5        .byte $C5, $F1, $1B, $00   ; 
- D 1 - I - 0x00E532 03:A522: 34        .byte $34, $EF, $19, $1A   ; 
- D 1 - I - 0x00E536 03:A526: 3A        .byte $3A, $F0, $0C, $00   ; 
; 57 
- D 1 - I - 0x00E53A 03:A52A: 00        .byte $00, $D5, $3D, $3A   ; 
- D 1 - I - 0x00E53E 03:A52E: 00        .byte $00, $D6, $E9, $C5   ; 
- D 1 - I - 0x00E542 03:A532: 1A        .byte $1A, $E1, $33, $34   ; 
- D 1 - I - 0x00E546 03:A536: 00        .byte $00, $D5, $3D, $3A   ; 
; 58 
- D 1 - I - 0x00E54A 03:A53A: 1A        .byte $1A, $1A, $1A, $1A   ; 
- D 1 - I - 0x00E54E 03:A53E: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E552 03:A542: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E556 03:A546: 00        .byte $00, $00, $00, $00   ; 
; 59 
- D 1 - I - 0x00E55A 03:A54A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E55E 03:A54E: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E562 03:A552: 1A        .byte $1A, $1A, $1A, $1A   ; 
- D 1 - I - 0x00E566 03:A556: 00        .byte $00, $00, $00, $00   ; 
; 5A 
- D 1 - I - 0x00E56A 03:A55A: 3A        .byte $3A, $F0, $1D, $00   ; 
- D 1 - I - 0x00E56E 03:A55E: F5        .byte $F5, $F6, $1D, $00   ; 
- D 1 - I - 0x00E572 03:A562: 3B        .byte $3B, $F7, $27, $2B   ; 
- D 1 - I - 0x00E576 03:A566: C5        .byte $C5, $F1, $DE, $DE   ; 
; 5B 
- D 1 - I - 0x00E57A 03:A56A: 00        .byte $00, $E3, $3D, $3A   ; 
- D 1 - I - 0x00E57E 03:A56E: 00        .byte $00, $E3, $EE, $43   ; 
- D 1 - I - 0x00E582 03:A572: 2B        .byte $2B, $E4, $3E, $44   ; 
- D 1 - I - 0x00E586 03:A576: DE        .byte $DE, $DE, $3D, $C5   ; 
; 5C 
- - - - - - 0x00E58A 03:A57A: 38        .byte $38, $EF, $0C, $00   ; 
- - - - - - 0x00E58E 03:A57E: F2        .byte $F2, $F3, $0C, $00   ; 
- - - - - - 0x00E592 03:A582: 39        .byte $39, $F4, $1C, $00   ; 
- - - - - - 0x00E596 03:A586: C5        .byte $C5, $F1, $1D, $00   ; 
; 5D 
- D 1 - I - 0x00E59A 03:A58A: 00        .byte $00, $D5, $33, $34   ; 
- D 1 - I - 0x00E59E 03:A58E: 00        .byte $00, $D5, $37, $37   ; 
- D 1 - I - 0x00E5A2 03:A592: 00        .byte $00, $E2, $3D, $3A   ; 
- D 1 - I - 0x00E5A6 03:A596: 00        .byte $00, $E3, $E9, $C5   ; 
; 5E 
- D 1 - I - 0x00E5AA 03:A59A: 34        .byte $34, $EF, $1D, $00   ; 
- D 1 - I - 0x00E5AE 03:A59E: 3A        .byte $3A, $F0, $1D, $00   ; 
- D 1 - I - 0x00E5B2 03:A5A2: 37        .byte $37, $37, $1D, $00   ; 
- D 1 - I - 0x00E5B6 03:A5A6: 3A        .byte $3A, $F8, $E5, $00   ; 
; 5F 
- D 1 - I - 0x00E5BA 03:A5AA: 00        .byte $00, $E3, $33, $EA   ; 
- D 1 - I - 0x00E5BE 03:A5AE: 00        .byte $00, $E3, $EB, $EC   ; 
- D 1 - I - 0x00E5C2 03:A5B2: 00        .byte $00, $E3, $3C, $ED   ; 
- D 1 - I - 0x00E5C6 03:A5B6: 00        .byte $00, $E6, $3D, $3A   ; 
; 60 
- D 1 - I - 0x00E5CA 03:A5BA: 38        .byte $38, $EF, $28, $2B   ; 
- D 1 - I - 0x00E5CE 03:A5BE: F2        .byte $F2, $F3, $DE, $DE   ; 
- D 1 - I - 0x00E5D2 03:A5C2: 39        .byte $39, $F4, $1C, $00   ; 
- D 1 - I - 0x00E5D6 03:A5C6: C5        .byte $C5, $F1, $1D, $00   ; 
; 61 
- D 1 - I - 0x00E5DA 03:A5CA: 2B        .byte $2B, $D7, $33, $34   ; 
- D 1 - I - 0x00E5DE 03:A5CE: DE        .byte $DE, $DF, $EE, $43   ; 
- D 1 - I - 0x00E5E2 03:A5D2: 00        .byte $00, $E2, $3E, $44   ; 
- D 1 - I - 0x00E5E6 03:A5D6: 00        .byte $00, $E3, $E9, $C5   ; 
; 62 
- D 1 - I - 0x00E5EA 03:A5DA: 00        .byte $00, $B0, $05, $B1   ; 
- D 1 - I - 0x00E5EE 03:A5DE: 00        .byte $00, $B3, $B4, $B5   ; 
- D 1 - I - 0x00E5F2 03:A5E2: 00        .byte $00, $00, $08, $B9   ; 
- D 1 - I - 0x00E5F6 03:A5E6: 00        .byte $00, $00, $00, $00   ; 
; 63 
- D 1 - I - 0x00E5FA 03:A5EA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E5FE 03:A5EE: 00        .byte $00, $00, $FA, $F9   ; 
- D 1 - I - 0x00E602 03:A5F2: 00        .byte $00, $A5, $1F, $00   ; 
- D 1 - I - 0x00E606 03:A5F6: 00        .byte $00, $00, $1F, $00   ; 
; 64 
- D 1 - I - 0x00E60A 03:A5FA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E60E 03:A5FE: F9        .byte $F9, $F9, $FB, $00   ; 
- D 1 - I - 0x00E612 03:A602: 2B        .byte $2B, $2B, $2B, $2B   ; 
- D 1 - I - 0x00E616 03:A606: DD        .byte $DD, $DE, $DE, $DF   ; 
; 65 
- D 1 - I - 0x00E61A 03:A60A: 00        .byte $00, $00, $1F, $00   ; 
- D 1 - I - 0x00E61E 03:A60E: 69        .byte $69, $00, $1F, $00   ; 
- D 1 - I - 0x00E622 03:A612: 00        .byte $00, $00, $1F, $00   ; 
- D 1 - I - 0x00E626 03:A616: A5        .byte $A5, $00, $1F, $00   ; 
; 66 
- D 1 - I - 0x00E62A 03:A61A: 00        .byte $00, $00, $1F, $00   ; 
- D 1 - I - 0x00E62E 03:A61E: F9        .byte $F9, $F9, $FD, $00   ; 
- D 1 - I - 0x00E632 03:A622: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E636 03:A626: 00        .byte $00, $A5, $00, $00   ; 
; 67 
- D 1 - I - 0x00E63A 03:A62A: 00        .byte $00, $00, $1F, $00   ; 
- D 1 - I - 0x00E63E 03:A62E: A5        .byte $A5, $00, $FC, $F9   ; 
- D 1 - I - 0x00E642 03:A632: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E646 03:A636: 00        .byte $00, $A5, $00, $00   ; 
; 68 
- D 1 - I - 0x00E64A 03:A63A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E64E 03:A63E: F9        .byte $F9, $F9, $F9, $F9   ; 
- D 1 - I - 0x00E652 03:A642: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E656 03:A646: 00        .byte $00, $00, $A5, $00   ; 
; 69 
- D 1 - I - 0x00E65A 03:A64A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E65E 03:A64E: F9        .byte $F9, $F9, $FB, $00   ; 
- D 1 - I - 0x00E662 03:A652: 00        .byte $00, $00, $1F, $00   ; 
- D 1 - I - 0x00E666 03:A656: A5        .byte $A5, $00, $1F, $00   ; 
; 6A 
- D 1 - I - 0x00E66A 03:A65A: 00        .byte $00, $00, $1F, $00   ; 
- D 1 - I - 0x00E66E 03:A65E: F9        .byte $F9, $F9, $1F, $F9   ; 
- D 1 - I - 0x00E672 03:A662: 00        .byte $00, $00, $1F, $00   ; 
- D 1 - I - 0x00E676 03:A666: 00        .byte $00, $00, $1F, $00   ; 
; 6B 
- D 1 - I - 0x00E67A 03:A66A: 2B        .byte $2B, $2B, $2B, $2B   ; 
- D 1 - I - 0x00E67E 03:A66E: DD        .byte $DD, $DE, $DE, $DF   ; 
- D 1 - I - 0x00E682 03:A672: 00        .byte $00, $00, $1F, $00   ; 
- D 1 - I - 0x00E686 03:A676: 00        .byte $00, $00, $1F, $00   ; 
; 6C 
- D 1 - I - 0x00E68A 03:A67A: 17        .byte $17, $17, $18, $00   ; 
- D 1 - I - 0x00E68E 03:A67E: 10        .byte $10, $10, $11, $00   ; 
- D 1 - I - 0x00E692 03:A682: 10        .byte $10, $10, $11, $00   ; 
- D 1 - I - 0x00E696 03:A686: 10        .byte $10, $10, $11, $00   ; 
; 6D 
- D 1 - I - 0x00E69A 03:A68A: 00        .byte $00, $C0, $17, $17   ; 
- D 1 - I - 0x00E69E 03:A68E: 00        .byte $00, $BF, $10, $10   ; 
- D 1 - I - 0x00E6A2 03:A692: 00        .byte $00, $BF, $10, $10   ; 
- D 1 - I - 0x00E6A6 03:A696: 00        .byte $00, $BF, $10, $10   ; 
; 6E 
- D 1 - I - 0x00E6AA 03:A69A: 00        .byte $00, $6A, $00, $00   ; 
- D 1 - I - 0x00E6AE 03:A69E: F9        .byte $F9, $F9, $F9, $F9   ; 
- D 1 - I - 0x00E6B2 03:A6A2: 00        .byte $00, $6A, $00, $00   ; 
- D 1 - I - 0x00E6B6 03:A6A6: 00        .byte $00, $6A, $00, $00   ; 
; 6F 
- D 1 - I - 0x00E6BA 03:A6AA: 00        .byte $00, $00, $00, $A5   ; 
- D 1 - I - 0x00E6BE 03:A6AE: 00        .byte $00, $A5, $00, $69   ; 
- D 1 - I - 0x00E6C2 03:A6B2: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E6C6 03:A6B6: 00        .byte $00, $64, $65, $65   ; 
; 70 
- D 1 - I - 0x00E6CA 03:A6BA: 00        .byte $00, $6A, $00, $00   ; 
- D 1 - I - 0x00E6CE 03:A6BE: 00        .byte $00, $6A, $00, $00   ; 
- D 1 - I - 0x00E6D2 03:A6C2: 00        .byte $00, $6A, $00, $00   ; 
- D 1 - I - 0x00E6D6 03:A6C6: 65        .byte $65, $68, $00, $00   ; 
; 71 
- D 1 - I - 0x00E6DA 03:A6CA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E6DE 03:A6CE: 00        .byte $00, $A5, $00, $00   ; 
- D 1 - I - 0x00E6E2 03:A6D2: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E6E6 03:A6D6: 65        .byte $65, $66, $00, $A5   ; 
; 72 
- D 1 - I - 0x00E6EA 03:A6DA: 00        .byte $00, $6A, $00, $00   ; 
- D 1 - I - 0x00E6EE 03:A6DE: 00        .byte $00, $6A, $00, $A5   ; 
- D 1 - I - 0x00E6F2 03:A6E2: 00        .byte $00, $6A, $00, $00   ; 
- D 1 - I - 0x00E6F6 03:A6E6: 00        .byte $00, $67, $65, $65   ; 
; 73 
- D 1 - I - 0x00E6FA 03:A6EA: 00        .byte $00, $A5, $00, $00   ; 
- D 1 - I - 0x00E6FE 03:A6EE: 00        .byte $00, $00, $00, $69   ; 
- D 1 - I - 0x00E702 03:A6F2: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E706 03:A6F6: 65        .byte $65, $65, $65, $65   ; 
; 74 
- D 1 - I - 0x00E70A 03:A6FA: 00        .byte $00, $6A, $00, $A5   ; 
- D 1 - I - 0x00E70E 03:A6FE: 00        .byte $00, $6A, $69, $00   ; 
- D 1 - I - 0x00E712 03:A702: 00        .byte $00, $6A, $00, $A5   ; 
- D 1 - I - 0x00E716 03:A706: 00        .byte $00, $6A, $00, $00   ; 
; 75 
- D 1 - I - 0x00E71A 03:A70A: 40        .byte $40, $40, $29, $6E   ; 
- D 1 - I - 0x00E71E 03:A70E: 6B        .byte $6B, $6C, $70, $71   ; 
- D 1 - I - 0x00E722 03:A712: 30        .byte $30, $6D, $1E, $74   ; 
- D 1 - I - 0x00E726 03:A716: 00        .byte $00, $00, $00, $00   ; 
; 76 
- D 1 - I - 0x00E72A 03:A71A: 2B        .byte $2B, $2B, $2B, $2B   ; 
- D 1 - I - 0x00E72E 03:A71E: 72        .byte $72, $71, $72, $71   ; 
- D 1 - I - 0x00E732 03:A722: 1E        .byte $1E, $74, $1E, $74   ; 
- D 1 - I - 0x00E736 03:A726: 00        .byte $00, $00, $00, $00   ; 
; 77 
- D 1 - I - 0x00E73A 03:A72A: 2A        .byte $2A, $6F, $40, $40   ; 
- D 1 - I - 0x00E73E 03:A72E: 72        .byte $72, $73, $6B, $6C   ; 
- D 1 - I - 0x00E742 03:A732: 1E        .byte $1E, $74, $30, $6D   ; 
- D 1 - I - 0x00E746 03:A736: 00        .byte $00, $00, $00, $00   ; 
; 78 
- D 1 - I - 0x00E74A 03:A73A: 33        .byte $33, $34, $34, $34   ; 
- D 1 - I - 0x00E74E 03:A73E: C4        .byte $C4, $C5, $D1, $D1   ; 
- D 1 - I - 0x00E752 03:A742: 00        .byte $00, $00, $01, $A1   ; 
- D 1 - I - 0x00E756 03:A746: 00        .byte $00, $00, $00, $00   ; 
; 79 
- D 1 - I - 0x00E75A 03:A74A: 34        .byte $34, $34, $34, $C7   ; 
- D 1 - I - 0x00E75E 03:A74E: D1        .byte $D1, $D1, $C5, $C6   ; 
- D 1 - I - 0x00E762 03:A752: 20        .byte $20, $A2, $00, $00   ; 
- D 1 - I - 0x00E766 03:A756: 00        .byte $00, $00, $00, $00   ; 
; 7A 
- D 1 - I - 0x00E76A 03:A75A: 33        .byte $33, $C8, $35, $34   ; 
- D 1 - I - 0x00E76E 03:A75E: C4        .byte $C4, $C9, $CA, $C5   ; 
- D 1 - I - 0x00E772 03:A762: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E776 03:A766: 00        .byte $00, $00, $00, $00   ; 
; 7B 
- D 1 - I - 0x00E77A 03:A76A: 34        .byte $34, $CB, $36, $CE   ; 
- D 1 - I - 0x00E77E 03:A76E: C5        .byte $C5, $CC, $CD, $CF   ; 
- D 1 - I - 0x00E782 03:A772: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E786 03:A776: 00        .byte $00, $00, $00, $00   ; 
; 7C 
- D 1 - I - 0x00E78A 03:A77A: 34        .byte $34, $34, $34, $C7   ; 
- D 1 - I - 0x00E78E 03:A77E: D2        .byte $D2, $C5, $D2, $C6   ; 
- D 1 - I - 0x00E792 03:A782: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E796 03:A786: 00        .byte $00, $00, $00, $00   ; 
; 7D 
- D 1 - I - 0x00E79A 03:A78A: 32        .byte $32, $FE, $32, $32   ; 
- D 1 - I - 0x00E79E 03:A78E: DA        .byte $DA, $DB, $DC, $DC   ; 
- D 1 - I - 0x00E7A2 03:A792: 33        .byte $33, $E0, $34, $E0   ; 
- D 1 - I - 0x00E7A6 03:A796: C4        .byte $C4, $C5, $C5, $C5   ; 
; 7E 
- D 1 - I - 0x00E7AA 03:A79A: 32        .byte $32, $32, $32, $32   ; 
- D 1 - I - 0x00E7AE 03:A79E: DC        .byte $DC, $DC, $DC, $DC   ; 
- D 1 - I - 0x00E7B2 03:A7A2: 34        .byte $34, $CB, $36, $CE   ; 
- D 1 - I - 0x00E7B6 03:A7A6: C5        .byte $C5, $CC, $CD, $CF   ; 
; 7F 
- D 1 - I - 0x00E7BA 03:A7AA: 32        .byte $32, $FE, $32, $32   ; 
- D 1 - I - 0x00E7BE 03:A7AE: DA        .byte $DA, $DB, $DC, $DC   ; 
- D 1 - I - 0x00E7C2 03:A7B2: 33        .byte $33, $D0, $34, $D0   ; 
- D 1 - I - 0x00E7C6 03:A7B6: C4        .byte $C4, $C5, $C5, $C5   ; 
; 80 
- D 1 - I - 0x00E7CA 03:A7BA: 32        .byte $32, $32, $32, $32   ; 
- D 1 - I - 0x00E7CE 03:A7BE: DC        .byte $DC, $DC, $DC, $DC   ; 
- D 1 - I - 0x00E7D2 03:A7C2: 33        .byte $33, $C8, $35, $C7   ; 
- D 1 - I - 0x00E7D6 03:A7C6: C4        .byte $C4, $C9, $CA, $C6   ; 
; 81 
- D 1 - I - 0x00E7DA 03:A7CA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E7DE 03:A7CE: 00        .byte $00, $00, $C1, $C2   ; 
- D 1 - I - 0x00E7E2 03:A7D2: 00        .byte $00, $A7, $02, $A8   ; 
- D 1 - I - 0x00E7E6 03:A7D6: 00        .byte $00, $AA, $AB, $AC   ; 
; 82 
- D 1 - I - 0x00E7EA 03:A7DA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E7EE 03:A7DE: C3        .byte $C3, $A6, $00, $00   ; 
- D 1 - I - 0x00E7F2 03:A7E2: 03        .byte $03, $A9, $04, $00   ; 
- D 1 - I - 0x00E7F6 03:A7E6: AD        .byte $AD, $AE, $AF, $00   ; 
; 83 
- D 1 - I - 0x00E7FA 03:A7EA: 3A        .byte $3A, $F0, $0C, $00   ; 
- D 1 - I - 0x00E7FE 03:A7EE: F5        .byte $F5, $F6, $0C, $00   ; 
- D 1 - I - 0x00E802 03:A7F2: 3B        .byte $3B, $F7, $0C, $00   ; 
- D 1 - I - 0x00E806 03:A7F6: C5        .byte $C5, $F1, $1C, $00   ; 
; 84 
- D 1 - I - 0x00E80A 03:A7FA: 00        .byte $00, $D5, $3D, $3A   ; 
- D 1 - I - 0x00E80E 03:A7FE: 00        .byte $00, $D5, $EE, $43   ; 
- D 1 - I - 0x00E812 03:A802: 00        .byte $00, $D5, $3E, $44   ; 
- D 1 - I - 0x00E816 03:A806: 00        .byte $00, $E2, $E9, $C5   ; 
; 85 
- D 1 - I - 0x00E81A 03:A80A: 3A        .byte $3A, $F8, $0C, $00   ; 
- D 1 - I - 0x00E81E 03:A80E: C5        .byte $C5, $F1, $1C, $00   ; 
- - - - - - 0x00E822 03:A812: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E826 03:A816: 00        .byte $00, $00, $00, $00   ; 
; 86 
- D 1 - I - 0x00E82A 03:A81A: 00        .byte $00, $0A, $0A, $0A   ; 
- D 1 - I - 0x00E82E 03:A81E: 00        .byte $00, $0B, $0B, $0B   ; 
- D 1 - I - 0x00E832 03:A822: 00        .byte $00, $0B, $0B, $0B   ; 
- D 1 - I - 0x00E836 03:A826: 00        .byte $00, $0B, $0B, $0B   ; 
; 87 
- D 1 - I - 0x00E83A 03:A82A: 00        .byte $00, $0B, $0B, $0B   ; 
- D 1 - I - 0x00E83E 03:A82E: 00        .byte $00, $BB, $BB, $BB   ; 
- D 1 - I - 0x00E842 03:A832: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E846 03:A836: 00        .byte $00, $00, $00, $00   ; 
; 88 
- D 1 - I - 0x00E84A 03:A83A: 34        .byte $34, $CB, $36, $34   ; 
- D 1 - I - 0x00E84E 03:A83E: C5        .byte $C5, $CC, $CD, $C5   ; 
- D 1 - I - 0x00E852 03:A842: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E856 03:A846: 00        .byte $00, $00, $00, $00   ; 
; 89 
- D 1 - I - 0x00E85A 03:A84A: 34        .byte $34, $C7, $0C, $00   ; 
- D 1 - I - 0x00E85E 03:A84E: C5        .byte $C5, $C6, $D8, $00   ; 
- D 1 - I - 0x00E862 03:A852: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E866 03:A856: 00        .byte $00, $00, $00, $00   ; 
; 8A 
- D 1 - I - 0x00E86A 03:A85A: 32        .byte $32, $32, $32, $32   ; 
- D 1 - I - 0x00E86E 03:A85E: DC        .byte $DC, $DC, $DC, $DC   ; 
- D 1 - I - 0x00E872 03:A862: 33        .byte $33, $D0, $34, $D0   ; 
- D 1 - I - 0x00E876 03:A866: C4        .byte $C4, $C5, $C5, $C5   ; 
; 8B 
- D 1 - I - 0x00E87A 03:A86A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E87E 03:A86E: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E882 03:A872: 32        .byte $32, $FE, $32, $32   ; 
- D 1 - I - 0x00E886 03:A876: DA        .byte $DA, $DC, $DC, $DC   ; 
; 8C 
- D 1 - I - 0x00E88A 03:A87A: 41        .byte $41, $41, $41, $63   ; 
- D 1 - I - 0x00E88E 03:A87E: 54        .byte $54, $22, $22, $55   ; 
- D 1 - I - 0x00E892 03:A882: 42        .byte $42, $48, $43, $56   ; 
- D 1 - I - 0x00E896 03:A886: 42        .byte $42, $57, $44, $56   ; 
; 8D 
- D 1 - I - 0x00E89A 03:A88A: 42        .byte $42, $3A, $3A, $58   ; 
- D 1 - I - 0x00E89E 03:A88E: 42        .byte $42, $48, $43, $59   ; 
- D 1 - I - 0x00E8A2 03:A892: 42        .byte $42, $57, $44, $3A   ; 
- D 1 - I - 0x00E8A6 03:A896: 42        .byte $42, $3A, $3A, $3A   ; 
; 8E 
- D 1 - I - 0x00E8AA 03:A89A: 41        .byte $41, $41, $41, $63   ; 
- D 1 - I - 0x00E8AE 03:A89E: 34        .byte $34, $5A, $34, $55   ; 
- D 1 - I - 0x00E8B2 03:A8A2: 45        .byte $45, $EC, $3A, $56   ; 
- D 1 - I - 0x00E8B6 03:A8A6: 5B        .byte $5B, $ED, $3A, $56   ; 
; 8F 
- D 1 - I - 0x00E8BA 03:A8AA: 42        .byte $42, $48, $43, $5C   ; 
- D 1 - I - 0x00E8BE 03:A8AE: 42        .byte $42, $57, $44, $5E   ; 
- D 1 - I - 0x00E8C2 03:A8B2: 47        .byte $47, $46, $46, $5F   ; 
- D 1 - I - 0x00E8C6 03:A8B6: 42        .byte $42, $3A, $3A, $3A   ; 
; 90 
- - - - - - 0x00E8CA 03:A8BA: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E8CE 03:A8BE: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E8D2 03:A8C2: 34        .byte $34, $34, $34, $C8   ; 
- D 1 - I - 0x00E8D6 03:A8C6: D1        .byte $D1, $D1, $D1, $C9   ; 
; 91 
- - - - - - 0x00E8DA 03:A8CA: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E8DE 03:A8CE: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E8E2 03:A8D2: 35        .byte $35, $C7, $33, $CB   ; 
- D 1 - I - 0x00E8E6 03:A8D6: CA        .byte $CA, $C6, $C4, $CC   ; 
; 92 
- - - - - - 0x00E8EA 03:A8DA: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E8EE 03:A8DE: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E8F2 03:A8E2: 36        .byte $36, $CE, $33, $34   ; 
- D 1 - I - 0x00E8F6 03:A8E6: CD        .byte $CD, $CF, $C4, $D1   ; 
; 93 
- - - - - - 0x00E8FA 03:A8EA: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E8FE 03:A8EE: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E902 03:A8F2: 34        .byte $34, $34, $34, $34   ; 
- D 1 - I - 0x00E906 03:A8F6: D1        .byte $D1, $C5, $C5, $C5   ; 
; 94 
- D 1 - I - 0x00E90A 03:A8FA: 25        .byte $25, $25, $3C, $ED   ; 
- D 1 - I - 0x00E90E 03:A8FE: 25        .byte $25, $25, $3D, $3A   ; 
- D 1 - I - 0x00E912 03:A902: 25        .byte $25, $25, $3F, $3A   ; 
- D 1 - I - 0x00E916 03:A906: 25        .byte $25, $25, $C4, $C5   ; 
; 95 
- D 1 - I - 0x00E91A 03:A90A: 24        .byte $24, $24, $33, $34   ; 
- D 1 - I - 0x00E91E 03:A90E: 25        .byte $25, $25, $37, $37   ; 
- D 1 - I - 0x00E922 03:A912: 25        .byte $25, $25, $3D, $3A   ; 
- D 1 - I - 0x00E926 03:A916: 25        .byte $25, $25, $3D, $3A   ; 
; 96 
- D 1 - I - 0x00E92A 03:A91A: 25        .byte $25, $25, $3F, $3A   ; 
- D 1 - I - 0x00E92E 03:A91E: 4C        .byte $4C, $4D, $C4, $C5   ; 
- D 1 - I - 0x00E932 03:A922: 26        .byte $26, $4E, $21, $34   ; 
- D 1 - I - 0x00E936 03:A926: 26        .byte $26, $4E, $3D, $3A   ; 
; 97 
- D 1 - I - 0x00E93A 03:A92A: 26        .byte $26, $4E, $23, $3A   ; 
- D 1 - I - 0x00E93E 03:A92E: 26        .byte $26, $4E, $3D, $3A   ; 
- D 1 - I - 0x00E942 03:A932: 26        .byte $26, $4E, $23, $3A   ; 
- D 1 - I - 0x00E946 03:A936: 26        .byte $26, $4E, $3F, $3A   ; 
; 98 
- D 1 - I - 0x00E94A 03:A93A: 2D        .byte $2D, $32, $32, $32   ; 
- D 1 - I - 0x00E94E 03:A93E: 50        .byte $50, $FF, $DC, $DC   ; 
- D 1 - I - 0x00E952 03:A942: 2E        .byte $2E, $25, $34, $D0   ; 
- D 1 - I - 0x00E956 03:A946: 00        .byte $00, $25, $3A, $3A   ; 
; 99 
- D 1 - I - 0x00E95A 03:A94A: 32        .byte $32, $32, $32, $32   ; 
- D 1 - I - 0x00E95E 03:A94E: DC        .byte $DC, $DC, $DC, $DC   ; 
- D 1 - I - 0x00E962 03:A952: 34        .byte $34, $D0, $34, $D0   ; 
- D 1 - I - 0x00E966 03:A956: 3A        .byte $3A, $3A, $3A, $3A   ; 
; 9A 
- D 1 - I - 0x00E96A 03:A95A: 32        .byte $32, $32, $32, $32   ; 
- D 1 - I - 0x00E96E 03:A95E: DC        .byte $DC, $DC, $DC, $DC   ; 
- D 1 - I - 0x00E972 03:A962: 34        .byte $34, $D0, $34, $34   ; 
- D 1 - I - 0x00E976 03:A966: 3A        .byte $3A, $3A, $37, $37   ; 
; 9B 
- D 1 - I - 0x00E97A 03:A96A: 2F        .byte $2F, $4E, $3D, $3A   ; 
- D 1 - I - 0x00E97E 03:A96E: DC        .byte $DC, $4F, $C4, $C5   ; 
- D 1 - I - 0x00E982 03:A972: 34        .byte $34, $34, $34, $34   ; 
- D 1 - I - 0x00E986 03:A976: 37        .byte $37, $37, $37, $37   ; 
; 9C 
- D 1 - I - 0x00E98A 03:A97A: 33        .byte $33, $34, $34, $34   ; 
- D 1 - I - 0x00E98E 03:A97E: C4        .byte $C4, $C5, $C5, $C5   ; 
- - - - - - 0x00E992 03:A982: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E996 03:A986: 00        .byte $00, $00, $00, $00   ; 
; 9D 
- D 1 - I - 0x00E99A 03:A98A: 34        .byte $34, $CB, $36, $CE   ; 
- D 1 - I - 0x00E99E 03:A98E: C5        .byte $C5, $CC, $CD, $CF   ; 
- - - - - - 0x00E9A2 03:A992: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E9A6 03:A996: 00        .byte $00, $00, $00, $00   ; 
; 9E 
- D 1 - I - 0x00E9AA 03:A99A: 3A        .byte $3A, $3A, $33, $34   ; 
- D 1 - I - 0x00E9AE 03:A99E: 3A        .byte $3A, $3A, $C4, $D1   ; 
- - - - - - 0x00E9B2 03:A9A2: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E9B6 03:A9A6: 00        .byte $00, $00, $00, $00   ; 
; 9F 
- D 1 - I - 0x00E9BA 03:A9AA: 26        .byte $26, $4E, $23, $3A   ; 
- D 1 - I - 0x00E9BE 03:A9AE: 26        .byte $26, $4E, $3F, $3A   ; 
- D 1 - I - 0x00E9C2 03:A9B2: 26        .byte $26, $4E, $23, $3A   ; 
- D 1 - I - 0x00E9C6 03:A9B6: 26        .byte $26, $4E, $3F, $3A   ; 
; A0 
- D 1 - I - 0x00E9CA 03:A9BA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E9CE 03:A9BE: 1A        .byte $1A, $1A, $1A, $1A   ; 
- - - - - - 0x00E9D2 03:A9C2: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E9D6 03:A9C6: 00        .byte $00, $00, $00, $00   ; 
; A1 
- D 1 - I - 0x00E9DA 03:A9CA: 00        .byte $00, $4B, $33, $EA   ; 
- D 1 - I - 0x00E9DE 03:A9CE: E1        .byte $E1, $25, $EB, $EC   ; 
- - - - - - 0x00E9E2 03:A9D2: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00E9E6 03:A9D6: 00        .byte $00, $00, $00, $00   ; 
; A2 
- D 1 - I - 0x00E9EA 03:A9DA: 00        .byte $00, $FB, $00, $FB   ; 
- D 1 - I - 0x00E9EE 03:A9DE: 00        .byte $00, $FD, $00, $FD   ; 
- D 1 - I - 0x00E9F2 03:A9E2: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E9F6 03:A9E6: 00        .byte $00, $00, $00, $00   ; 
; A3 
- D 1 - I - 0x00E9FA 03:A9EA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00E9FE 03:A9EE: FF        .byte $FF, $FF, $D3, $D4   ; 
- - - - - - 0x00EA02 03:A9F2: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00EA06 03:A9F6: 00        .byte $00, $00, $00, $00   ; 
; A4 
- D 1 - I - 0x00EA0A 03:A9FA: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EA0E 03:A9FE: D5        .byte $D5, $FF, $FF, $FF   ; 
- - - - - - 0x00EA12 03:AA02: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00EA16 03:AA06: 00        .byte $00, $00, $00, $00   ; 
; A5 
- D 1 - I - 0x00EA1A 03:AA0A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EA1E 03:AA0E: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EA22 03:AA12: 00        .byte $00, $00, $E4, $E5   ; 
- D 1 - I - 0x00EA26 03:AA16: 00        .byte $00, $00, $F1, $F2   ; 
; A6 
- D 1 - I - 0x00EA2A 03:AA1A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EA2E 03:AA1E: 00        .byte $00, $DD, $DE, $DE   ; 
- D 1 - I - 0x00EA32 03:AA22: E6        .byte $E6, $E7, $EF, $F0   ; 
- D 1 - I - 0x00EA36 03:AA26: F3        .byte $F3, $F4, $F9, $FA   ; 
; A7 
- D 1 - I - 0x00EA3A 03:AA2A: D6        .byte $D6, $D7, $D8, $D9   ; 
- D 1 - I - 0x00EA3E 03:AA2E: DE        .byte $DE, $DE, $DF, $E0   ; 
- D 1 - I - 0x00EA42 03:AA32: F0        .byte $F0, $F0, $E8, $E9   ; 
- D 1 - I - 0x00EA46 03:AA36: F9        .byte $F9, $FA, $F9, $FA   ; 
; A8 
- D 1 - I - 0x00EA4A 03:AA3A: DA        .byte $DA, $DB, $DC, $00   ; 
- D 1 - I - 0x00EA4E 03:AA3E: E1        .byte $E1, $E2, $DE, $DE   ; 
- D 1 - I - 0x00EA52 03:AA42: EA        .byte $EA, $F0, $F0, $F0   ; 
- D 1 - I - 0x00EA56 03:AA46: F9        .byte $F9, $FA, $F9, $FA   ; 
; A9 
- D 1 - I - 0x00EA5A 03:AA4A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EA5E 03:AA4E: DE        .byte $DE, $E3, $00, $00   ; 
- D 1 - I - 0x00EA62 03:AA52: EF        .byte $EF, $EB, $EC, $ED   ; 
- D 1 - I - 0x00EA66 03:AA56: F9        .byte $F9, $F5, $F6, $F7   ; 
; AA 
- D 1 - I - 0x00EA6A 03:AA5A: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EA6E 03:AA5E: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EA72 03:AA62: EE        .byte $EE, $00, $00, $00   ; 
- D 1 - I - 0x00EA76 03:AA66: F8        .byte $F8, $00, $00, $00   ; 
; AB 
- D 1 - I - 0x00EA7A 03:AA6A: 00        .byte $00, $00, $00, $FB   ; 
- D 1 - I - 0x00EA7E 03:AA6E: 00        .byte $00, $00, $00, $FD   ; 
- D 1 - I - 0x00EA82 03:AA72: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EA86 03:AA76: 00        .byte $00, $00, $00, $00   ; 
; AC 
- D 1 - I - 0x00EA8A 03:AA7A: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00EA8E 03:AA7E: C5        .byte $C5, $C5, $C5, $C5   ; 
- D 1 - I - 0x00EA92 03:AA82: 34        .byte $34, $34, $34, $34   ; 
- D 1 - I - 0x00EA96 03:AA86: 3A        .byte $3A, $3A, $3A, $3A   ; 
; AD 
- D 1 - I - 0x00EA9A 03:AA8A: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00EA9E 03:AA8E: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00EAA2 03:AA92: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00EAA6 03:AA96: C5        .byte $C5, $C5, $C5, $C5   ; 
; AE 
- D 1 - I - 0x00EAAA 03:AA9A: 34        .byte $34, $34, $34, $34   ; 
- D 1 - I - 0x00EAAE 03:AA9E: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00EAB2 03:AAA2: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00EAB6 03:AAA6: 3A        .byte $3A, $3A, $3A, $3A   ; 
; AF
- D 1 - I - 0x00EABA 03:AAAA: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00EABE 03:AAAE: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00EAC2 03:AAB2: 3A        .byte $3A, $3A, $3A, $3A   ; 
- D 1 - I - 0x00EAC6 03:AAB6: 3A        .byte $3A, $3A, $3A, $3A   ; 



_off007_0x00EACA_03_area_4:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
- D 1 - I - 0x00EACA 03:AABA: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 00
- D 1 - I - 0x00EADA 03:AACA: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 10
- D 1 - I - 0x00EAEA 03:AADA: 00        .byte $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F0, $F0, $F0, $00   ; 20
- D 1 - I - 0x00EAFA 03:AAEA: 00        .byte $00, $00, $00, $00, $00, $0F, $0F, $0F, $00, $00, $00, $00, $00, $00, $00, $00   ; 30
- D 1 - I - 0x00EB0A 03:AAFA: 00        .byte $00, $00, $00, $88, $88, $88, $22, $22, $22, $88, $22, $08, $02, $80, $20, $00   ; 40
- D 1 - I - 0x00EB1A 03:AB0A: 00        .byte $00, $00, $0F, $0F, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 50
- D 1 - I - 0x00EB2A 03:AB1A: 00        .byte $00, $00, $CF, $FC, $0F, $FF, $3F, $3F, $CF, $FF, $CF, $C0, $FF, $FF, $3F, $FF   ; 60
- D 1 - I - 0x00EB3A 03:AB2A: 33        .byte $33, $F3, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 70
- D 1 - I - 0x00EB4A 03:AB3A: 00        .byte $00, $FC, $F3, $00, $00, $00, $FF, $0F, $00, $00, $00, $00, $00, $00, $00, $00   ; 80
- D 1 - I - 0x00EB5A 03:AB4A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 90
- D 1 - I - 0x00EB6A 03:AB5A: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; A0



_off004_0x00EB7A_02_area_3:
- D 1 - I - 0x00EB7A 03:AB6A: 16        .byte $16   ; столбцы
- D 1 - I - 0x00EB7B 03:AB6B: 01        .byte $01   ; строки

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15
- D 1 - I - 0x00EB7C 03:AB6C: 01        .byte $01, $02, $01, $03, $01, $04, $01, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0E, $0E, $0E, $0F, $10   ; 



_off005_0x00EB92_02_area_3:
- - - - - - 0x00EB92 03:AB82: A4 AB     .word _off018_02_ABA4_00
- D 1 - I - 0x00EB94 03:AB84: E4 AB     .word _off018_02_ABE4_01
- D 1 - I - 0x00EB96 03:AB86: 24 AC     .word _off018_02_AC24_02
- D 1 - I - 0x00EB98 03:AB88: 64 AC     .word _off018_02_AC64_03
- D 1 - I - 0x00EB9A 03:AB8A: A4 AC     .word _off018_02_ACA4_04
- D 1 - I - 0x00EB9C 03:AB8C: E4 AC     .word _off018_02_ACE4_05
- D 1 - I - 0x00EB9E 03:AB8E: 24 AD     .word _off018_02_AD24_06
- D 1 - I - 0x00EBA0 03:AB90: 64 AD     .word _off018_02_AD64_07
- D 1 - I - 0x00EBA2 03:AB92: A4 AD     .word _off018_02_ADA4_08
- D 1 - I - 0x00EBA4 03:AB94: E4 AD     .word _off018_02_ADE4_09
- D 1 - I - 0x00EBA6 03:AB96: 24 AE     .word _off018_02_AE24_0A
- D 1 - I - 0x00EBA8 03:AB98: 64 AE     .word _off018_02_AE64_0B
- D 1 - I - 0x00EBAA 03:AB9A: A4 AE     .word _off018_02_AEA4_0C
- D 1 - I - 0x00EBAC 03:AB9C: E4 AE     .word _off018_02_AEE4_0D
- D 1 - I - 0x00EBAE 03:AB9E: 24 AF     .word _off018_02_AF24_0E
- D 1 - I - 0x00EBB0 03:ABA0: 64 AF     .word _off018_02_AF64_0F
- D 1 - I - 0x00EBB2 03:ABA2: A4 AF     .word _off018_02_AFA4_10



_off018_02_ABA4_00:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x00EBB4 03:ABA4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x00EBBC 03:ABAC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x00EBC4 03:ABB4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- - - - - - 0x00EBCC 03:ABBC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- - - - - - 0x00EBD4 03:ABC4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- - - - - - 0x00EBDC 03:ABCC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 05 
- - - - - - 0x00EBE4 03:ABD4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 06 
- - - - - - 0x00EBEC 03:ABDC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_ABE4_01:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EBF4 03:ABE4: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00EBFC 03:ABEC: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00EC04 03:ABF4: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00EC0C 03:ABFC: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00EC14 03:AC04: 10        .byte $10, $11, $12, $13, $10, $11, $12, $13   ; 04 
- D 1 - I - 0x00EC1C 03:AC0C: 15        .byte $15, $15, $15, $15, $15, $15, $15, $15   ; 05 
- D 1 - I - 0x00EC24 03:AC14: 16        .byte $16, $16, $16, $16, $16, $16, $16, $16   ; 06 
- D 1 - I - 0x00EC2C 03:AC1C: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_AC24_02:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EC34 03:AC24: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00EC3C 03:AC2C: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00EC44 03:AC34: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00EC4C 03:AC3C: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00EC54 03:AC44: 10        .byte $10, $11, $12, $13, $10, $11, $12, $13   ; 04 
- D 1 - I - 0x00EC5C 03:AC4C: 15        .byte $15, $15, $15, $42, $43, $15, $15, $15   ; 05 
- D 1 - I - 0x00EC64 03:AC54: 16        .byte $16, $16, $16, $16, $16, $16, $16, $16   ; 06 
- D 1 - I - 0x00EC6C 03:AC5C: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_AC64_03:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EC74 03:AC64: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00EC7C 03:AC6C: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00EC84 03:AC74: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00EC8C 03:AC7C: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00EC94 03:AC84: 10        .byte $10, $11, $12, $13, $10, $11, $12, $13   ; 04 
- D 1 - I - 0x00EC9C 03:AC8C: 15        .byte $15, $42, $43, $15, $15, $42, $43, $15   ; 05 
- D 1 - I - 0x00ECA4 03:AC94: 16        .byte $16, $16, $16, $16, $16, $16, $16, $16   ; 06 
- D 1 - I - 0x00ECAC 03:AC9C: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_ACA4_04:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00ECB4 03:ACA4: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00ECBC 03:ACAC: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00ECC4 03:ACB4: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00ECCC 03:ACBC: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00ECD4 03:ACC4: 10        .byte $10, $11, $12, $13, $10, $3E, $12, $13   ; 04 
- D 1 - I - 0x00ECDC 03:ACCC: 15        .byte $15, $15, $15, $15, $3F, $40, $41, $15   ; 05 
- D 1 - I - 0x00ECE4 03:ACD4: 16        .byte $16, $16, $16, $16, $16, $16, $16, $16   ; 06 
- D 1 - I - 0x00ECEC 03:ACDC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_ACE4_05:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00ECF4 03:ACE4: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00ECFC 03:ACEC: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00ED04 03:ACF4: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00ED0C 03:ACFC: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00ED14 03:AD04: 10        .byte $10, $11, $12, $13, $10, $18, $19, $1A   ; 04 
- D 1 - I - 0x00ED1C 03:AD0C: 15        .byte $15, $15, $15, $15, $15, $1E, $1F, $1F   ; 05 
- D 1 - I - 0x00ED24 03:AD14: 16        .byte $16, $16, $16, $16, $22, $23, $24, $24   ; 06 
- D 1 - I - 0x00ED2C 03:AD1C: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_AD24_06:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00ED34 03:AD24: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00ED3C 03:AD2C: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00ED44 03:AD34: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00ED4C 03:AD3C: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00ED54 03:AD44: 1C        .byte $1C, $1A, $19, $1A, $1C, $1A, $1B, $13   ; 04 
- D 1 - I - 0x00ED5C 03:AD4C: 1F        .byte $1F, $1F, $1F, $1F, $1F, $1F, $20, $21   ; 05 
- D 1 - I - 0x00ED64 03:AD54: 24        .byte $24, $24, $24, $24, $24, $24, $25, $26   ; 06 
- D 1 - I - 0x00ED6C 03:AD5C: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_AD64_07:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00ED74 03:AD64: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00ED7C 03:AD6C: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00ED84 03:AD74: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00ED8C 03:AD7C: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00ED94 03:AD84: 10        .byte $10, $18, $19, $1A, $1C, $1A, $19, $1A   ; 04 
- D 1 - I - 0x00ED9C 03:AD8C: 1D        .byte $1D, $1E, $1F, $1F, $1F, $1F, $1F, $1F   ; 05 
- D 1 - I - 0x00EDA4 03:AD94: 22        .byte $22, $23, $24, $24, $24, $24, $24, $24   ; 06 
- D 1 - I - 0x00EDAC 03:AD9C: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_ADA4_08:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EDB4 03:ADA4: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00EDBC 03:ADAC: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00EDC4 03:ADB4: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00EDCC 03:ADBC: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00EDD4 03:ADC4: 1C        .byte $1C, $1A, $19, $1A, $1C, $1A, $19, $1A   ; 04 
- D 1 - I - 0x00EDDC 03:ADCC: 1F        .byte $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F   ; 05 
- D 1 - I - 0x00EDE4 03:ADD4: 24        .byte $24, $24, $24, $24, $24, $24, $24, $24   ; 06 
- D 1 - I - 0x00EDEC 03:ADDC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_ADE4_09:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EDF4 03:ADE4: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00EDFC 03:ADEC: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00EE04 03:ADF4: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00EE0C 03:ADFC: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00EE14 03:AE04: 1C        .byte $1C, $1A, $1B, $13, $10, $11, $12, $13   ; 04 
- D 1 - I - 0x00EE1C 03:AE0C: 1F        .byte $1F, $1F, $20, $21, $15, $15, $15, $15   ; 05 
- D 1 - I - 0x00EE24 03:AE14: 24        .byte $24, $24, $25, $26, $16, $16, $16, $16   ; 06 
- D 1 - I - 0x00EE2C 03:AE1C: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_02_AE24_0A:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EE34 03:AE24: 14        .byte $14, $01, $02, $03, $14, $01, $02, $03   ; 00 
- D 1 - I - 0x00EE3C 03:AE2C: 04        .byte $04, $05, $06, $07, $04, $05, $06, $07   ; 01 
- D 1 - I - 0x00EE44 03:AE34: 08        .byte $08, $09, $0A, $0B, $08, $09, $0A, $0B   ; 02 
- D 1 - I - 0x00EE4C 03:AE3C: 0C        .byte $0C, $0D, $0E, $0F, $0C, $0D, $0E, $0F   ; 03 
- D 1 - I - 0x00EE54 03:AE44: 10        .byte $10, $11, $12, $13, $10, $11, $12, $13   ; 04 
- D 1 - I - 0x00EE5C 03:AE4C: 15        .byte $15, $15, $15, $15, $15, $15, $15, $15   ; 05 
- D 1 - I - 0x00EE64 03:AE54: 16        .byte $16, $16, $16, $16, $16, $44, $35, $35   ; 06 
- D 1 - I - 0x00EE6C 03:AE5C: 00        .byte $00, $00, $00, $00, $00, $45, $39, $39   ; 07 



_off018_02_AE64_0B:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EE74 03:AE64: 14        .byte $14, $01, $02, $34, $00, $00, $00, $00   ; 00 
- D 1 - I - 0x00EE7C 03:AE6C: 04        .byte $04, $05, $06, $38, $00, $00, $00, $00   ; 01 
- D 1 - I - 0x00EE84 03:AE74: 08        .byte $08, $09, $0A, $00, $00, $00, $00, $00   ; 02 
- D 1 - I - 0x00EE8C 03:AE7C: 0C        .byte $0C, $0D, $0E, $00, $00, $00, $00, $00   ; 03 
- D 1 - I - 0x00EE94 03:AE84: 10        .byte $10, $11, $12, $00, $00, $00, $00, $00   ; 04 
- D 1 - I - 0x00EE9C 03:AE8C: 15        .byte $15, $15, $15, $27, $31, $32, $33, $3C   ; 05 
- D 1 - I - 0x00EEA4 03:AE94: 17        .byte $17, $29, $2A, $2B, $30, $00, $36, $37   ; 06 
- D 1 - I - 0x00EEAC 03:AE9C: 2C        .byte $2C, $2D, $2E, $2F, $28, $00, $3A, $3B   ; 07 



_off018_02_AEA4_0C:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EEB4 03:AEA4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 1 - I - 0x00EEBC 03:AEAC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- D 1 - I - 0x00EEC4 03:AEB4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 1 - I - 0x00EECC 03:AEBC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- D 1 - I - 0x00EED4 03:AEC4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- D 1 - I - 0x00EEDC 03:AECC: 3C        .byte $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C   ; 05 
- D 1 - I - 0x00EEE4 03:AED4: 3D        .byte $3D, $3D, $3D, $3D, $3D, $3D, $3D, $3D   ; 06 
- D 1 - I - 0x00EEEC 03:AEDC: 3B        .byte $3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B   ; 07 



_off018_02_AEE4_0D:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EEF4 03:AEE4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 1 - I - 0x00EEFC 03:AEEC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- D 1 - I - 0x00EF04 03:AEF4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 1 - I - 0x00EF0C 03:AEFC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- D 1 - I - 0x00EF14 03:AF04: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- D 1 - I - 0x00EF1C 03:AF0C: 51        .byte $51, $52, $53, $54, $53, $54, $53, $54   ; 05 
- D 1 - I - 0x00EF24 03:AF14: 57        .byte $57, $55, $56, $55, $56, $55, $56, $55   ; 06 
- D 1 - I - 0x00EF2C 03:AF1C: 58        .byte $58, $59, $5A, $59, $5A, $59, $5A, $59   ; 07 



_off018_02_AF24_0E:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EF34 03:AF24: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 1 - I - 0x00EF3C 03:AF2C: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- D 1 - I - 0x00EF44 03:AF34: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 1 - I - 0x00EF4C 03:AF3C: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- D 1 - I - 0x00EF54 03:AF44: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- D 1 - I - 0x00EF5C 03:AF4C: 53        .byte $53, $54, $53, $54, $53, $54, $53, $54   ; 05 
- D 1 - I - 0x00EF64 03:AF54: 56        .byte $56, $55, $56, $55, $56, $55, $56, $55   ; 06 
- D 1 - I - 0x00EF6C 03:AF5C: 5A        .byte $5A, $59, $5A, $59, $5A, $59, $5A, $59   ; 07 



_off018_02_AF64_0F:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EF74 03:AF64: 60        .byte $60, $67, $68, $69, $6A, $6B, $6C, $66   ; 00 
- D 1 - I - 0x00EF7C 03:AF6C: 6D        .byte $6D, $6E, $6F, $70, $71, $72, $6E, $73   ; 01 
- D 1 - I - 0x00EF84 03:AF74: 60        .byte $60, $74, $74, $75, $76, $74, $74, $66   ; 02 
- D 1 - I - 0x00EF8C 03:AF7C: 77        .byte $77, $78, $79, $7A, $7B, $7A, $7C, $7D   ; 03 
- D 1 - I - 0x00EF94 03:AF84: 7E        .byte $7E, $7F, $7F, $7F, $7F, $7F, $7F, $80   ; 04 
- D 1 - I - 0x00EF9C 03:AF8C: 53        .byte $53, $54, $53, $54, $53, $54, $53, $54   ; 05 
- D 1 - I - 0x00EFA4 03:AF94: 56        .byte $56, $55, $56, $55, $56, $55, $56, $55   ; 06 
- D 1 - I - 0x00EFAC 03:AF9C: 5A        .byte $5A, $59, $5A, $59, $5A, $59, $5A, $59   ; 07 



_off018_02_AFA4_10:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00EFB4 03:AFA4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 1 - I - 0x00EFBC 03:AFAC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- D 1 - I - 0x00EFC4 03:AFB4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 1 - I - 0x00EFCC 03:AFBC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- D 1 - I - 0x00EFD4 03:AFC4: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- D 1 - I - 0x00EFDC 03:AFCC: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 05 
- D 1 - I - 0x00EFE4 03:AFD4: 5B        .byte $5B, $5C, $5C, $5D, $5E, $5C, $5C, $5F   ; 06 
- D 1 - I - 0x00EFEC 03:AFDC: 60        .byte $60, $61, $62, $63, $64, $65, $61, $66   ; 07 



_off006_0x00EFF4_02_area_3:
; 00
- D 1 - I - 0x00EFF4 03:AFE4: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EFF8 03:AFE8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00EFFC 03:AFEC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F000 03:AFF0: 00        .byte $00, $00, $00, $00   ; 
; 01 
- D 1 - I - 0x00F004 03:AFF4: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F008 03:AFF8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F00C 03:AFFC: 00        .byte $00, $6D, $0D, $6F   ; 
- D 1 - I - 0x00F010 03:B000: 4C        .byte $4C, $4D, $6E, $70   ; 
; 02 
- D 1 - I - 0x00F014 03:B004: 00        .byte $00, $00, $01, $47   ; 
- D 1 - I - 0x00F018 03:B008: 48        .byte $48, $49, $4A, $4B   ; 
- D 1 - I - 0x00F01C 03:B00C: 02        .byte $02, $4E, $03, $4F   ; 
- D 1 - I - 0x00F020 03:B010: 51        .byte $51, $52, $53, $54   ; 
; 03 
- D 1 - I - 0x00F024 03:B014: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F028 03:B018: 4C        .byte $4C, $4D, $00, $00   ; 
- D 1 - I - 0x00F02C 03:B01C: 04        .byte $04, $50, $05, $72   ; 
- D 1 - I - 0x00F030 03:B020: 55        .byte $55, $56, $57, $73   ; 
; 04 
- D 1 - I - 0x00F034 03:B024: 02        .byte $02, $4E, $03, $4F   ; 
- D 1 - I - 0x00F038 03:B028: 51        .byte $51, $52, $53, $54   ; 
- D 1 - I - 0x00F03C 03:B02C: 06        .byte $06, $59, $07, $5A   ; 
- D 1 - I - 0x00F040 03:B030: 5D        .byte $5D, $5E, $5F, $60   ; 
; 05 
- D 1 - I - 0x00F044 03:B034: 04        .byte $04, $50, $05, $58   ; 
- D 1 - I - 0x00F048 03:B038: 55        .byte $55, $56, $57, $5C   ; 
- D 1 - I - 0x00F04C 03:B03C: 08        .byte $08, $5B, $0F, $64   ; 
- D 1 - I - 0x00F050 03:B040: 61        .byte $61, $62, $63, $70   ; 
; 06 
- D 1 - I - 0x00F054 03:B044: 06        .byte $06, $59, $07, $5A   ; 
- D 1 - I - 0x00F058 03:B048: 5D        .byte $5D, $5E, $5F, $60   ; 
- D 1 - I - 0x00F05C 03:B04C: 09        .byte $09, $65, $0A, $66   ; 
- D 1 - I - 0x00F060 03:B050: 68        .byte $68, $69, $6A, $6B   ; 
; 07 
- D 1 - I - 0x00F064 03:B054: 08        .byte $08, $5B, $0F, $74   ; 
- D 1 - I - 0x00F068 03:B058: 61        .byte $61, $62, $63, $70   ; 
- D 1 - I - 0x00F06C 03:B05C: 0B        .byte $0B, $67, $0C, $58   ; 
- D 1 - I - 0x00F070 03:B060: 6C        .byte $6C, $75, $76, $5C   ; 
; 08 
- D 1 - I - 0x00F074 03:B064: 11        .byte $11, $65, $0A, $66   ; 
- D 1 - I - 0x00F078 03:B068: 68        .byte $68, $69, $6A, $6B   ; 
- D 1 - I - 0x00F07C 03:B06C: 00        .byte $00, $13, $13, $82   ; 
- D 1 - I - 0x00F080 03:B070: 00        .byte $00, $83, $15, $85   ; 
; 09 
- D 1 - I - 0x00F084 03:B074: 0B        .byte $0B, $67, $0C, $77   ; 
- D 1 - I - 0x00F088 03:B078: 6C        .byte $6C, $75, $76, $7D   ; 
- D 1 - I - 0x00F08C 03:B07C: 12        .byte $12, $79, $10, $7A   ; 
- D 1 - I - 0x00F090 03:B080: 70        .byte $70, $00, $7B, $7C   ; 
; 0A 
- D 1 - I - 0x00F094 03:B084: 00        .byte $00, $78, $13, $82   ; 
- D 1 - I - 0x00F098 03:B088: 7E        .byte $7E, $7F, $15, $86   ; 
- D 1 - I - 0x00F09C 03:B08C: 13        .byte $13, $00, $15, $86   ; 
- D 1 - I - 0x00F0A0 03:B090: 83        .byte $83, $00, $15, $86   ; 
; 0B 
- D 1 - I - 0x00F0A4 03:B094: 12        .byte $12, $79, $10, $7A   ; 
- D 1 - I - 0x00F0A8 03:B098: 70        .byte $70, $00, $7B, $7C   ; 
- D 1 - I - 0x00F0AC 03:B09C: 14        .byte $14, $82, $14, $82   ; 
- D 1 - I - 0x00F0B0 03:B0A0: 18        .byte $18, $84, $17, $86   ; 
; 0C 
- D 1 - I - 0x00F0B4 03:B0A4: 00        .byte $00, $83, $15, $86   ; 
- D 1 - I - 0x00F0B8 03:B0A8: 00        .byte $00, $83, $15, $85   ; 
- D 1 - I - 0x00F0BC 03:B0AC: 00        .byte $00, $16, $15, $85   ; 
- D 1 - I - 0x00F0C0 03:B0B0: 00        .byte $00, $83, $19, $85   ; 
; 0D 
- D 1 - I - 0x00F0C4 03:B0B4: 14        .byte $14, $82, $14, $82   ; 
- D 1 - I - 0x00F0C8 03:B0B8: 18        .byte $18, $84, $17, $86   ; 
- D 1 - I - 0x00F0CC 03:B0BC: 18        .byte $18, $84, $17, $86   ; 
- D 1 - I - 0x00F0D0 03:B0C0: 18        .byte $18, $84, $17, $86   ; 
; 0E 
- D 1 - I - 0x00F0D4 03:B0C4: 16        .byte $16, $00, $15, $86   ; 
- D 1 - I - 0x00F0D8 03:B0C8: 83        .byte $83, $00, $19, $85   ; 
- D 1 - I - 0x00F0DC 03:B0CC: 16        .byte $16, $00, $19, $85   ; 
- D 1 - I - 0x00F0E0 03:B0D0: 83        .byte $83, $00, $19, $85   ; 
; 0F 
- D 1 - I - 0x00F0E4 03:B0D4: 18        .byte $18, $84, $17, $86   ; 
- D 1 - I - 0x00F0E8 03:B0D8: 18        .byte $18, $84, $17, $86   ; 
- D 1 - I - 0x00F0EC 03:B0DC: 18        .byte $18, $84, $17, $86   ; 
- D 1 - I - 0x00F0F0 03:B0E0: 18        .byte $18, $84, $17, $86   ; 
; 10 
- D 1 - I - 0x00F0F4 03:B0E4: 00        .byte $00, $16, $19, $85   ; 
- D 1 - I - 0x00F0F8 03:B0E8: 00        .byte $00, $83, $19, $87   ; 
- D 1 - I - 0x00F0FC 03:B0EC: 00        .byte $00, $83, $19, $87   ; 
- D 1 - I - 0x00F100 03:B0F0: 00        .byte $00, $00, $88, $80   ; 
; 11 
- D 1 - I - 0x00F104 03:B0F4: 18        .byte $18, $84, $17, $86   ; 
- D 1 - I - 0x00F108 03:B0F8: 18        .byte $18, $84, $17, $85   ; 
- D 1 - I - 0x00F10C 03:B0FC: 18        .byte $18, $84, $17, $85   ; 
- D 1 - I - 0x00F110 03:B100: 1C        .byte $1C, $81, $88, $81   ; 
; 12 
- D 1 - I - 0x00F114 03:B104: 16        .byte $16, $00, $19, $85   ; 
- D 1 - I - 0x00F118 03:B108: 83        .byte $83, $00, $19, $87   ; 
- D 1 - I - 0x00F11C 03:B10C: 16        .byte $16, $00, $19, $87   ; 
- D 1 - I - 0x00F120 03:B110: 83        .byte $83, $00, $88, $80   ; 
; 13 
- D 1 - I - 0x00F124 03:B114: 18        .byte $18, $84, $17, $85   ; 
- D 1 - I - 0x00F128 03:B118: 18        .byte $18, $84, $17, $85   ; 
- D 1 - I - 0x00F12C 03:B11C: 1C        .byte $1C, $81, $17, $85   ; 
- D 1 - I - 0x00F130 03:B120: 00        .byte $00, $00, $88, $81   ; 
; 14 
- D 1 - I - 0x00F134 03:B124: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F138 03:B128: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F13C 03:B12C: 0E        .byte $0E, $71, $01, $47   ; 
- D 1 - I - 0x00F140 03:B130: 48        .byte $48, $49, $4A, $4B   ; 
; 15 
- D 1 - I - 0x00F144 03:B134: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F148 03:B138: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F14C 03:B13C: 28        .byte $28, $28, $28, $28   ; 
- D 1 - I - 0x00F150 03:B140: 8B        .byte $8B, $28, $8B, $28   ; 
; 16 
- D 1 - I - 0x00F154 03:B144: 2F        .byte $2F, $8B, $2F, $8B   ; 
- D 1 - I - 0x00F158 03:B148: 8C        .byte $8C, $2F, $8C, $2F   ; 
- D 1 - I - 0x00F15C 03:B14C: 2F        .byte $2F, $8D, $2F, $8C   ; 
- D 1 - I - 0x00F160 03:B150: 35        .byte $35, $8E, $35, $35   ; 
; 17 
- D 1 - I - 0x00F164 03:B154: 2F        .byte $2F, $8B, $2F, $8B   ; 
- D 1 - I - 0x00F168 03:B158: 8C        .byte $8C, $2F, $8C, $2F   ; 
- D 1 - I - 0x00F16C 03:B15C: 2F        .byte $2F, $8C, $2F, $8C   ; 
- D 1 - I - 0x00F170 03:B160: 8C        .byte $8C, $2F, $8C, $2F   ; 
; 18 
- D 1 - I - 0x00F174 03:B164: 1C        .byte $1C, $81, $17, $84   ; 
- D 1 - I - 0x00F178 03:B168: 00        .byte $00, $00, $17, $81   ; 
- D 1 - I - 0x00F17C 03:B16C: 1D        .byte $1D, $1D, $1A, $1D   ; 
- D 1 - I - 0x00F180 03:B170: 1B        .byte $1B, $1B, $1D, $26   ; 
; 19 
- D 1 - I - 0x00F184 03:B174: 16        .byte $16, $00, $19, $87   ; 
- D 1 - I - 0x00F188 03:B178: 83        .byte $83, $00, $88, $80   ; 
- D 1 - I - 0x00F18C 03:B17C: 1A        .byte $1A, $1D, $1A, $1A   ; 
- D 1 - I - 0x00F190 03:B180: 96        .byte $96, $3A, $96, $3A   ; 
; 1A 
- D 1 - I - 0x00F194 03:B184: 1C        .byte $1C, $81, $17, $85   ; 
- D 1 - I - 0x00F198 03:B188: 00        .byte $00, $00, $88, $81   ; 
- D 1 - I - 0x00F19C 03:B18C: 1D        .byte $1D, $1D, $1A, $1D   ; 
- D 1 - I - 0x00F1A0 03:B190: 96        .byte $96, $3A, $96, $3A   ; 
; 1B 
- D 1 - I - 0x00F1A4 03:B194: 16        .byte $16, $00, $19, $87   ; 
- D 1 - I - 0x00F1A8 03:B198: 83        .byte $83, $00, $88, $80   ; 
- D 1 - I - 0x00F1AC 03:B19C: 1A        .byte $1A, $1A, $1A, $1A   ; 
- D 1 - I - 0x00F1B0 03:B1A0: 1E        .byte $1E, $1B, $1D, $1B   ; 
; 1C 
- D 1 - I - 0x00F1B4 03:B1A4: 00        .byte $00, $83, $19, $87   ; 
- D 1 - I - 0x00F1B8 03:B1A8: 00        .byte $00, $83, $88, $80   ; 
- D 1 - I - 0x00F1BC 03:B1AC: 1A        .byte $1A, $1A, $1A, $1A   ; 
- D 1 - I - 0x00F1C0 03:B1B0: 96        .byte $96, $3A, $96, $3A   ; 
; 1D 
- D 1 - I - 0x00F1C4 03:B1B4: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F1C8 03:B1B8: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F1CC 03:B1BC: 28        .byte $28, $28, $28, $91   ; 
- D 1 - I - 0x00F1D0 03:B1C0: 8B        .byte $8B, $28, $28, $91   ; 
; 1E 
- D 1 - I - 0x00F1D4 03:B1C4: 1B        .byte $1B, $26, $1F, $3B   ; 
- D 1 - I - 0x00F1D8 03:B1C8: 8F        .byte $8F, $1F, $3C, $3D   ; 
- D 1 - I - 0x00F1DC 03:B1CC: 26        .byte $26, $3C, $24, $3F   ; 
- D 1 - I - 0x00F1E0 03:B1D0: 43        .byte $43, $42, $37, $3F   ; 
; 1F 
- D 1 - I - 0x00F1E4 03:B1D4: 20        .byte $20, $3B, $20, $3B   ; 
- D 1 - I - 0x00F1E8 03:B1D8: 3E        .byte $3E, $3D, $3E, $3D   ; 
- D 1 - I - 0x00F1EC 03:B1DC: 24        .byte $24, $3F, $24, $3F   ; 
- D 1 - I - 0x00F1F0 03:B1E0: 3F        .byte $3F, $24, $3F, $24   ; 
; 20 
- D 1 - I - 0x00F1F4 03:B1E4: 20        .byte $20, $97, $1E, $1B   ; 
- D 1 - I - 0x00F1F8 03:B1E8: 3E        .byte $3E, $25, $97, $90   ; 
- D 1 - I - 0x00F1FC 03:B1EC: 24        .byte $24, $3F, $25, $1E   ; 
- D 1 - I - 0x00F200 03:B1F0: 3F        .byte $3F, $3F, $42, $40   ; 
; 21 
- D 1 - I - 0x00F204 03:B1F4: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F208 03:B1F8: 90        .byte $90, $8A, $89, $8A   ; 
- D 1 - I - 0x00F20C 03:B1FC: 29        .byte $29, $28, $28, $28   ; 
- D 1 - I - 0x00F210 03:B200: 29        .byte $29, $8C, $8B, $2F   ; 
; 22 
- D 1 - I - 0x00F214 03:B204: 2F        .byte $2F, $8B, $28, $91   ; 
- D 1 - I - 0x00F218 03:B208: 8C        .byte $8C, $2F, $8C, $28   ; 
- D 1 - I - 0x00F21C 03:B20C: 2F        .byte $2F, $8D, $2F, $8C   ; 
- D 1 - I - 0x00F220 03:B210: 35        .byte $35, $8E, $35, $35   ; 
; 23 
- D 1 - I - 0x00F224 03:B214: 43        .byte $43, $42, $42, $3F   ; 
- D 1 - I - 0x00F228 03:B218: 95        .byte $95, $42, $37, $44   ; 
- D 1 - I - 0x00F22C 03:B21C: 2E        .byte $2E, $95, $37, $37   ; 
- D 1 - I - 0x00F230 03:B220: 35        .byte $35, $35, $94, $94   ; 
; 24 
- D 1 - I - 0x00F234 03:B224: 44        .byte $44, $3F, $44, $3F   ; 
- D 1 - I - 0x00F238 03:B228: 37        .byte $37, $44, $3F, $37   ; 
- D 1 - I - 0x00F23C 03:B22C: 37        .byte $37, $92, $37, $37   ; 
- D 1 - I - 0x00F240 03:B230: 94        .byte $94, $93, $94, $94   ; 
; 25 
- D 1 - I - 0x00F244 03:B234: 44        .byte $44, $3F, $42, $40   ; 
- D 1 - I - 0x00F248 03:B238: 3F        .byte $3F, $44, $42, $41   ; 
- D 1 - I - 0x00F24C 03:B23C: 37        .byte $37, $92, $41, $2E   ; 
- D 1 - I - 0x00F250 03:B240: 94        .byte $94, $93, $35, $35   ; 
; 26 
- D 1 - I - 0x00F254 03:B244: 29        .byte $29, $28, $2F, $8C   ; 
- D 1 - I - 0x00F258 03:B248: 2F        .byte $2F, $2F, $8C, $2F   ; 
- D 1 - I - 0x00F25C 03:B24C: 2F        .byte $2F, $8D, $2F, $8C   ; 
- D 1 - I - 0x00F260 03:B250: 35        .byte $35, $8E, $35, $35   ; 
; 27 
- D 1 - I - 0x00F264 03:B254: 1A        .byte $1A, $1A, $00, $00   ; 
- D 1 - I - 0x00F268 03:B258: B9        .byte $B9, $B9, $BA, $BB   ; 
- D 1 - I - 0x00F26C 03:B25C: 28        .byte $28, $2F, $28, $29   ; 
- D 1 - I - 0x00F270 03:B260: 8B        .byte $8B, $28, $8B, $28   ; 
; 28 
- D 1 - I - 0x00F274 03:B264: 30        .byte $30, $A4, $2D, $00   ; 
- D 1 - I - 0x00F278 03:B268: 9C        .byte $9C, $A0, $00, $00   ; 
- - - - - - 0x00F27C 03:B26C: 2D        .byte $2D, $00, $2D, $00   ; 
- - - - - - 0x00F280 03:B270: 00        .byte $00, $00, $00, $00   ; 
; 29 
- D 1 - I - 0x00F284 03:B274: 2F        .byte $2F, $8B, $2F, $8B   ; 
- D 1 - I - 0x00F288 03:B278: 8C        .byte $8C, $2F, $8C, $2F   ; 
- D 1 - I - 0x00F28C 03:B27C: 2F        .byte $2F, $8B, $2F, $8B   ; 
- D 1 - I - 0x00F290 03:B280: 9E        .byte $9E, $31, $9E, $31   ; 
; 2A 
- D 1 - I - 0x00F294 03:B284: 2F        .byte $2F, $8B, $2F, $8B   ; 
- D 1 - I - 0x00F298 03:B288: 8C        .byte $8C, $2F, $8C, $2F   ; 
- D 1 - I - 0x00F29C 03:B28C: 2F        .byte $2F, $8B, $2F, $9E   ; 
- D 1 - I - 0x00F2A0 03:B290: 9E        .byte $9E, $31, $9F, $00   ; 
; 2B 
- D 1 - I - 0x00F2A4 03:B294: 2F        .byte $2F, $8B, $2F, $8B   ; 
- D 1 - I - 0x00F2A8 03:B298: 8C        .byte $8C, $2F, $9E, $31   ; 
- D 1 - I - 0x00F2AC 03:B29C: 31        .byte $31, $9F, $2D, $A1   ; 
- D 1 - I - 0x00F2B0 03:B2A0: A2        .byte $A2, $A2, $98, $9A   ; 
; 2C 
- D 1 - I - 0x00F2B4 03:B2A4: 28        .byte $28, $28, $31, $9F   ; 
- D 1 - I - 0x00F2B8 03:B2A8: 35        .byte $35, $9F, $00, $A2   ; 
- - - - - - 0x00F2BC 03:B2AC: 2D        .byte $2D, $00, $2D, $00   ; 
- - - - - - 0x00F2C0 03:B2B0: 00        .byte $00, $00, $00, $00   ; 
; 2D 
- D 1 - I - 0x00F2C4 03:B2B4: 32        .byte $32, $A1, $32, $32   ; 
- D 1 - I - 0x00F2C8 03:B2B8: 99        .byte $99, $9A, $9C, $99   ; 
- - - - - - 0x00F2CC 03:B2BC: 2D        .byte $2D, $00, $2D, $00   ; 
- - - - - - 0x00F2D0 03:B2C0: 00        .byte $00, $00, $00, $00   ; 
; 2E 
- D 1 - I - 0x00F2D4 03:B2C4: 32        .byte $32, $A1, $32, $9B   ; 
- D 1 - I - 0x00F2D8 03:B2C8: 99        .byte $99, $9A, $9C, $9D   ; 
- - - - - - 0x00F2DC 03:B2CC: 2D        .byte $2D, $00, $2D, $00   ; 
- - - - - - 0x00F2E0 03:B2D0: 00        .byte $00, $00, $00, $00   ; 
; 2F 
- D 1 - I - 0x00F2E4 03:B2D4: 30        .byte $30, $98, $30, $9B   ; 
- D 1 - I - 0x00F2E8 03:B2D8: 9C        .byte $9C, $9A, $9C, $9D   ; 
- - - - - - 0x00F2EC 03:B2DC: 2D        .byte $2D, $00, $2D, $00   ; 
- - - - - - 0x00F2F0 03:B2E0: 00        .byte $00, $00, $00, $00   ; 
; 30 
- D 1 - I - 0x00F2F4 03:B2E4: 2F        .byte $2F, $9F, $2D, $00   ; 
- D 1 - I - 0x00F2F8 03:B2E8: 9F        .byte $9F, $A3, $00, $00   ; 
- D 1 - I - 0x00F2FC 03:B2EC: 32        .byte $32, $A4, $2D, $00   ; 
- D 1 - I - 0x00F300 03:B2F0: 9A        .byte $9A, $A0, $00, $00   ; 
; 31 
- D 1 - I - 0x00F304 03:B2F4: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F308 03:B2F8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F30C 03:B2FC: 2A        .byte $2A, $2B, $2B, $A5   ; 
- D 1 - I - 0x00F310 03:B300: A7        .byte $A7, $A9, $A8, $A9   ; 
; 32 
- D 1 - I - 0x00F314 03:B304: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F318 03:B308: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F31C 03:B30C: 2C        .byte $2C, $A5, $2C, $A5   ; 
- D 1 - I - 0x00F320 03:B310: A8        .byte $A8, $A9, $A8, $A9   ; 
; 33 
- D 1 - I - 0x00F324 03:B314: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F328 03:B318: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F32C 03:B31C: 2C        .byte $2C, $A5, $2C, $A6   ; 
- D 1 - I - 0x00F330 03:B320: A8        .byte $A8, $A9, $A8, $AA   ; 
; 34 
- D 1 - I - 0x00F334 03:B324: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F338 03:B328: 4C        .byte $4C, $4D, $00, $00   ; 
- D 1 - I - 0x00F33C 03:B32C: 04        .byte $04, $50, $05, $00   ; 
- D 1 - I - 0x00F340 03:B330: 55        .byte $55, $56, $57, $00   ; 
; 35 
- D 1 - I - 0x00F344 03:B334: 2F        .byte $2F, $8B, $2F, $8B   ; 
- D 1 - I - 0x00F348 03:B338: 8C        .byte $8C, $2F, $8C, $2F   ; 
- D 1 - I - 0x00F34C 03:B33C: 2F        .byte $2F, $8C, $2F, $8C   ; 
- D 1 - I - 0x00F350 03:B340: 28        .byte $28, $2F, $28, $2F   ; 
; 36 
- D 1 - I - 0x00F354 03:B344: 2D        .byte $2D, $00, $33, $AD   ; 
- D 1 - I - 0x00F358 03:B348: 00        .byte $00, $AE, $AF, $B0   ; 
- D 1 - I - 0x00F35C 03:B34C: 2D        .byte $2D, $B3, $B8, $B5   ; 
- D 1 - I - 0x00F360 03:B350: B6        .byte $B6, $B7, $B8, $B5   ; 
; 37 
- D 1 - I - 0x00F364 03:B354: 34        .byte $34, $34, $34, $34   ; 
- D 1 - I - 0x00F368 03:B358: B1        .byte $B1, $B1, $B2, $B2   ; 
- D 1 - I - 0x00F36C 03:B35C: 34        .byte $34, $34, $34, $34   ; 
- D 1 - I - 0x00F370 03:B360: 34        .byte $34, $34, $34, $34   ; 
; 38 
- D 1 - I - 0x00F374 03:B364: 08        .byte $08, $5B, $00, $00   ; 
- D 1 - I - 0x00F378 03:B368: 61        .byte $61, $62, $45, $00   ; 
- D 1 - I - 0x00F37C 03:B36C: 0B        .byte $0B, $46, $0C, $00   ; 
- D 1 - I - 0x00F380 03:B370: 6C        .byte $6C, $00, $00, $00   ; 
; 39 
- D 1 - I - 0x00F384 03:B374: 35        .byte $35, $8D, $2F, $28   ; 
- D 1 - I - 0x00F388 03:B378: 00        .byte $00, $8E, $35, $35   ; 
- - - - - - 0x00F38C 03:B37C: 2D        .byte $2D, $00, $2D, $00   ; 
- - - - - - 0x00F390 03:B380: 00        .byte $00, $00, $00, $00   ; 
; 3A 
- D 1 - I - 0x00F394 03:B384: 36        .byte $36, $B7, $B8, $B5   ; 
- D 1 - I - 0x00F398 03:B388: AB        .byte $AB, $B7, $B8, $B5   ; 
- - - - - - 0x00F39C 03:B38C: 2D        .byte $2D, $00, $2D, $00   ; 
- - - - - - 0x00F3A0 03:B390: 00        .byte $00, $00, $00, $00   ; 
; 3B 
- D 1 - I - 0x00F3A4 03:B394: 34        .byte $34, $34, $34, $34   ; 
- D 1 - I - 0x00F3A8 03:B398: 34        .byte $34, $34, $34, $34   ; 
- - - - - - 0x00F3AC 03:B39C: 2D        .byte $2D, $2D, $2D, $2D   ; 
- - - - - - 0x00F3B0 03:B3A0: 00        .byte $00, $00, $00, $00   ; 
; 3C 
- D 1 - I - 0x00F3B4 03:B3A4: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F3B8 03:B3A8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F3BC 03:B3AC: 2D        .byte $2D, $2D, $2D, $2D   ; 
- D 1 - I - 0x00F3C0 03:B3B0: AC        .byte $AC, $AC, $AC, $AC   ; 
; 3D 
- D 1 - I - 0x00F3C4 03:B3B4: 34        .byte $34, $34, $34, $34   ; 
- D 1 - I - 0x00F3C8 03:B3B8: B2        .byte $B2, $B2, $B2, $B2   ; 
- D 1 - I - 0x00F3CC 03:B3BC: 34        .byte $34, $34, $34, $34   ; 
- D 1 - I - 0x00F3D0 03:B3C0: 34        .byte $34, $34, $34, $34   ; 
; 3E 
- D 1 - I - 0x00F3D4 03:B3C4: 18        .byte $18, $84, $17, $86   ; 
- D 1 - I - 0x00F3D8 03:B3C8: 00        .byte $00, $00, $98, $85   ; 
- D 1 - I - 0x00F3DC 03:B3CC: 21        .byte $21, $99, $00, $00   ; 
- D 1 - I - 0x00F3E0 03:B3D0: 9A        .byte $9A, $9B, $9C, $00   ; 
; 3F 
- D 1 - I - 0x00F3E4 03:B3D4: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F3E8 03:B3D8: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F3EC 03:B3DC: 28        .byte $28, $28, $28, $A3   ; 
- D 1 - I - 0x00F3F0 03:B3E0: 8B        .byte $8B, $28, $8B, $A7   ; 
; 40 
- D 1 - I - 0x00F3F4 03:B3E4: 22        .byte $22, $9D, $23, $9E   ; 
- D 1 - I - 0x00F3F8 03:B3E8: 9F        .byte $9F, $A0, $A1, $A2   ; 
- D 1 - I - 0x00F3FC 03:B3EC: 38        .byte $38, $A4, $39, $A5   ; 
- D 1 - I - 0x00F400 03:B3F0: A8        .byte $A8, $A9, $AA, $AB   ; 
; 41 
- D 1 - I - 0x00F404 03:B3F4: 1A        .byte $1A, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F408 03:B3F8: 8F        .byte $8F, $8A, $89, $8A   ; 
- D 1 - I - 0x00F40C 03:B3FC: 27        .byte $27, $A6, $28, $28   ; 
- D 1 - I - 0x00F410 03:B400: AC        .byte $AC, $AD, $8B, $28   ; 
; 42 
- D 1 - I - 0x00F414 03:B404: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F418 03:B408: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F41C 03:B40C: 28        .byte $28, $28, $28, $28   ; 
- D 1 - I - 0x00F420 03:B410: 8B        .byte $8B, $28, $8B, $BB   ; 
; 43 
- D 1 - I - 0x00F424 03:B414: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F428 03:B418: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F42C 03:B41C: 28        .byte $28, $28, $28, $28   ; 
- D 1 - I - 0x00F430 03:B420: BC        .byte $BC, $BD, $BE, $BF   ; 
; 44 
- D 1 - I - 0x00F434 03:B424: 2F        .byte $2F, $8B, $2F, $8B   ; 
- D 1 - I - 0x00F438 03:B428: 8C        .byte $8C, $2F, $8C, $2F   ; 
- D 1 - I - 0x00F43C 03:B42C: 2F        .byte $2F, $8D, $2F, $8C   ; 
- D 1 - I - 0x00F440 03:B430: 35        .byte $35, $8E, $35, $8D   ; 
; 45 
- D 1 - I - 0x00F444 03:B434: 2D        .byte $2D, $00, $2D, $8E   ; 
- D 1 - I - 0x00F448 03:B438: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00F44C 03:B43C: 2D        .byte $2D, $00, $2D, $00   ; 
- - - - - - 0x00F450 03:B440: 00        .byte $00, $00, $00, $00   ; 
; 46 
- D 1 - I - 0x00F454 03:B444: 18        .byte $18, $84, $17, $86   ; 
- D 1 - I - 0x00F458 03:B448: 00        .byte $00, $00, $98, $85   ; 
- D 1 - I - 0x00F45C 03:B44C: AE        .byte $AE, $AF, $00, $00   ; 
- D 1 - I - 0x00F460 03:B450: 9A        .byte $9A, $B0, $B1, $00   ; 
; 47 
- D 1 - I - 0x00F464 03:B454: 22        .byte $22, $B2, $B3, $9E   ; 
- D 1 - I - 0x00F468 03:B458: 9F        .byte $9F, $A0, $A1, $A2   ; 
- D 1 - I - 0x00F46C 03:B45C: 38        .byte $38, $A4, $39, $B4   ; 
- D 1 - I - 0x00F470 03:B460: A8        .byte $A8, $A9, $AA, $B5   ; 
; 48 
- D 1 - I - 0x00F474 03:B464: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F478 03:B468: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F47C 03:B46C: B6        .byte $B6, $B7, $B8, $B9   ; 
- D 1 - I - 0x00F480 03:B470: A8        .byte $A8, $A9, $AA, $BA   ; 
; 49 
- D 1 - I - 0x00F484 03:B474: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F488 03:B478: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F48C 03:B47C: 28        .byte $28, $28, $C0, $C1   ; 
- D 1 - I - 0x00F490 03:B480: 8B        .byte $8B, $28, $C5, $C6   ; 
; 4A 
- D 1 - I - 0x00F494 03:B484: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F498 03:B488: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F49C 03:B48C: C2        .byte $C2, $C3, $C4, $28   ; 
- D 1 - I - 0x00F4A0 03:B490: C7        .byte $C7, $C7, $C8, $C9   ; 
; 4B 
- D 1 - I - 0x00F4A4 03:B494: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F4A8 03:B498: 89        .byte $89, $8A, $CA, $CB   ; 
- D 1 - I - 0x00F4AC 03:B49C: 28        .byte $28, $28, $D0, $D1   ; 
- D 1 - I - 0x00F4B0 03:B4A0: 8B        .byte $8B, $D5, $00, $D6   ; 
; 4C 
- D 1 - I - 0x00F4B4 03:B4A4: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F4B8 03:B4A8: CC        .byte $CC, $CD, $CE, $8A   ; 
- D 1 - I - 0x00F4BC 03:B4AC: D2        .byte $D2, $D3, $D4, $28   ; 
- D 1 - I - 0x00F4C0 03:B4B0: D7        .byte $D7, $D8, $D9, $DA   ; 
; 4D 
- D 1 - I - 0x00F4C4 03:B4B4: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F4C8 03:B4B8: 89        .byte $89, $8A, $DB, $DC   ; 
- D 1 - I - 0x00F4CC 03:B4BC: 28        .byte $28, $28, $E0, $E1   ; 
- D 1 - I - 0x00F4D0 03:B4C0: 8B        .byte $8B, $D5, $00, $E5   ; 
; 4E 
- D 1 - I - 0x00F4D4 03:B4C4: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F4D8 03:B4C8: DD        .byte $DD, $DE, $DF, $8A   ; 
- D 1 - I - 0x00F4DC 03:B4CC: E2        .byte $E2, $E3, $E4, $28   ; 
- D 1 - I - 0x00F4E0 03:B4D0: E6        .byte $E6, $E7, $E8, $DA   ; 
; 4F 
- D 1 - I - 0x00F4E4 03:B4D4: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F4E8 03:B4D8: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F4EC 03:B4DC: 28        .byte $28, $28, $E9, $EA   ; 
- D 1 - I - 0x00F4F0 03:B4E0: 8B        .byte $8B, $28, $ED, $EE   ; 
; 50 
- D 1 - I - 0x00F4F4 03:B4E4: 1B        .byte $1B, $1B, $1B, $1B   ; 
- D 1 - I - 0x00F4F8 03:B4E8: 89        .byte $89, $8A, $89, $8A   ; 
- D 1 - I - 0x00F4FC 03:B4EC: EB        .byte $EB, $EB, $EC, $28   ; 
- D 1 - I - 0x00F500 03:B4F0: EF        .byte $EF, $EF, $F0, $F1   ; 
; 51 
- D 1 - I - 0x00F504 03:B4F4: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F508 03:B4F8: 00        .byte $00, $00, $00, $BC   ; 
- D 1 - I - 0x00F50C 03:B4FC: 2D        .byte $2D, $00, $27, $BD   ; 
- D 1 - I - 0x00F510 03:B500: AC        .byte $AC, $AC, $BE, $BF   ; 
; 52 
- D 1 - I - 0x00F514 03:B504: 28        .byte $28, $C3, $29, $C4   ; 
- D 1 - I - 0x00F518 03:B508: C5        .byte $C5, $C6, $C7, $C8   ; 
- D 1 - I - 0x00F51C 03:B50C: 2E        .byte $2E, $C9, $2F, $CA   ; 
- D 1 - I - 0x00F520 03:B510: CB        .byte $CB, $CC, $CD, $CE   ; 
; 53 
- D 1 - I - 0x00F524 03:B514: 2A        .byte $2A, $2A, $2B, $2B   ; 
- D 1 - I - 0x00F528 03:B518: C5        .byte $C5, $C6, $C5, $C6   ; 
- D 1 - I - 0x00F52C 03:B51C: 2E        .byte $2E, $C9, $30, $CF   ; 
- D 1 - I - 0x00F530 03:B520: CB        .byte $CB, $CC, $D1, $D2   ; 
; 54 
- D 1 - I - 0x00F534 03:B524: 2C        .byte $2C, $2B, $2B, $2C   ; 
- D 1 - I - 0x00F538 03:B528: C5        .byte $C5, $C6, $C7, $C8   ; 
- D 1 - I - 0x00F53C 03:B52C: 2E        .byte $2E, $C9, $2F, $CA   ; 
- D 1 - I - 0x00F540 03:B530: CB        .byte $CB, $CC, $CD, $CE   ; 
; 55 
- D 1 - I - 0x00F544 03:B534: 30        .byte $30, $CF, $31, $D0   ; 
- D 1 - I - 0x00F548 03:B538: D1        .byte $D1, $D2, $D3, $D4   ; 
- D 1 - I - 0x00F54C 03:B53C: 2F        .byte $2F, $CA, $2E, $C9   ; 
- D 1 - I - 0x00F550 03:B540: CD        .byte $CD, $CE, $CB, $CC   ; 
; 56 
- D 1 - I - 0x00F554 03:B544: 30        .byte $30, $D0, $2F, $CA   ; 
- D 1 - I - 0x00F558 03:B548: CB        .byte $CB, $CC, $CD, $CE   ; 
- D 1 - I - 0x00F55C 03:B54C: 30        .byte $30, $CF, $31, $D0   ; 
- D 1 - I - 0x00F560 03:B550: D1        .byte $D1, $D2, $D3, $D4   ; 
; 57 
- D 1 - I - 0x00F564 03:B554: 34        .byte $34, $34, $34, $C0   ; 
- D 1 - I - 0x00F568 03:B558: B2        .byte $B2, $B2, $B2, $C1   ; 
- D 1 - I - 0x00F56C 03:B55C: 34        .byte $34, $34, $34, $C2   ; 
- D 1 - I - 0x00F570 03:B560: 34        .byte $34, $34, $34, $C2   ; 
; 58 
- D 1 - I - 0x00F574 03:B564: 34        .byte $34, $34, $34, $C2   ; 
- D 1 - I - 0x00F578 03:B568: 34        .byte $34, $34, $34, $C2   ; 
- - - - - - 0x00F57C 03:B56C: 34        .byte $34, $34, $34, $C2   ; 
- - - - - - 0x00F580 03:B570: 34        .byte $34, $34, $34, $C2   ; 
; 59 
- D 1 - I - 0x00F584 03:B574: 31        .byte $31, $D0, $30, $D0   ; 
- D 1 - I - 0x00F588 03:B578: D3        .byte $D3, $D4, $CB, $CC   ; 
- - - - - - 0x00F58C 03:B57C: 2E        .byte $2E, $C9, $30, $CF   ; 
- - - - - - 0x00F590 03:B580: CB        .byte $CB, $CC, $D1, $D2   ; 
; 5A 
- D 1 - I - 0x00F594 03:B584: 2F        .byte $2F, $CA, $2E, $C9   ; 
- D 1 - I - 0x00F598 03:B588: CD        .byte $CD, $CE, $CB, $CC   ; 
- - - - - - 0x00F59C 03:B58C: 31        .byte $31, $D0, $30, $D0   ; 
- - - - - - 0x00F5A0 03:B590: D3        .byte $D3, $D4, $CB, $CC   ; 
; 5B 
- D 1 - I - 0x00F5A4 03:B594: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5A8 03:B598: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5AC 03:B59C: 00        .byte $00, $00, $01, $02   ; 
- D 1 - I - 0x00F5B0 03:B5A0: 00        .byte $00, $00, $11, $12   ; 
; 5C 
- D 1 - I - 0x00F5B4 03:B5A4: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5B8 03:B5A8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5BC 03:B5AC: 20        .byte $20, $20, $20, $20   ; 
- D 1 - I - 0x00F5C0 03:B5B0: 26        .byte $26, $26, $26, $26   ; 
; 5D 
- D 1 - I - 0x00F5C4 03:B5B4: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5C8 03:B5B8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5CC 03:B5BC: 21        .byte $21, $22, $23, $23   ; 
- D 1 - I - 0x00F5D0 03:B5C0: 27        .byte $27, $28, $07, $17   ; 
; 5E 
- D 1 - I - 0x00F5D4 03:B5C4: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5D8 03:B5C8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5DC 03:B5CC: 23        .byte $23, $23, $24, $25   ; 
- D 1 - I - 0x00F5E0 03:B5D0: 18        .byte $18, $09, $29, $2A   ; 
; 5F 
- D 1 - I - 0x00F5E4 03:B5D4: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5E8 03:B5D8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00F5EC 03:B5DC: 03        .byte $03, $04, $00, $00   ; 
- D 1 - I - 0x00F5F0 03:B5E0: 13        .byte $13, $14, $00, $00   ; 
; 60 
- D 1 - I - 0x00F5F4 03:B5E4: 00        .byte $00, $00, $11, $12   ; 
- D 1 - I - 0x00F5F8 03:B5E8: 00        .byte $00, $00, $11, $12   ; 
- D 1 - I - 0x00F5FC 03:B5EC: 00        .byte $00, $00, $11, $12   ; 
- D 1 - I - 0x00F600 03:B5F0: 00        .byte $00, $00, $11, $12   ; 
; 61 
- D 1 - I - 0x00F604 03:B5F4: 26        .byte $26, $0C, $0D, $26   ; 
- D 1 - I - 0x00F608 03:B5F8: 26        .byte $26, $1C, $1D, $26   ; 
- - - - - - 0x00F60C 03:B5FC: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00F610 03:B600: 00        .byte $00, $00, $00, $00   ; 
; 62 
- D 1 - I - 0x00F614 03:B604: 26        .byte $26, $0C, $0D, $26   ; 
- D 1 - I - 0x00F618 03:B608: 26        .byte $26, $1C, $1D, $2F   ; 
- - - - - - 0x00F61C 03:B60C: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00F620 03:B610: 00        .byte $00, $00, $00, $00   ; 
; 63 
- D 1 - I - 0x00F624 03:B614: 2B        .byte $2B, $2C, $08, $18   ; 
- D 1 - I - 0x00F628 03:B618: 30        .byte $30, $31, $00, $19   ; 
- - - - - - 0x00F62C 03:B61C: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00F630 03:B620: 00        .byte $00, $00, $00, $00   ; 
; 64 
- D 1 - I - 0x00F634 03:B624: 0B        .byte $0B, $00, $2D, $2E   ; 
- D 1 - I - 0x00F638 03:B628: 00        .byte $00, $10, $32, $33   ; 
- - - - - - 0x00F63C 03:B62C: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00F640 03:B630: 00        .byte $00, $00, $00, $00   ; 
; 65 
- D 1 - I - 0x00F644 03:B634: 26        .byte $26, $0C, $0D, $26   ; 
- D 1 - I - 0x00F648 03:B638: 34        .byte $34, $1C, $1D, $26   ; 
- - - - - - 0x00F64C 03:B63C: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00F650 03:B640: 00        .byte $00, $00, $00, $00   ; 
; 66 
- D 1 - I - 0x00F654 03:B644: 13        .byte $13, $14, $00, $00   ; 
- D 1 - I - 0x00F658 03:B648: 13        .byte $13, $14, $00, $00   ; 
- D 1 - I - 0x00F65C 03:B64C: 13        .byte $13, $14, $00, $00   ; 
- D 1 - I - 0x00F660 03:B650: 13        .byte $13, $14, $00, $00   ; 
; 67 
- D 1 - I - 0x00F664 03:B654: 35        .byte $35, $35, $35, $35   ; 
- D 1 - I - 0x00F668 03:B658: 3C        .byte $3C, $3C, $3C, $3C   ; 
- D 1 - I - 0x00F66C 03:B65C: 0E        .byte $0E, $00, $10, $1A   ; 
- D 1 - I - 0x00F670 03:B660: 0E        .byte $0E, $1A, $08, $19   ; 
; 68 
- D 1 - I - 0x00F674 03:B664: 35        .byte $35, $35, $36, $37   ; 
- D 1 - I - 0x00F678 03:B668: 3C        .byte $3C, $3C, $3D, $31   ; 
- D 1 - I - 0x00F67C 03:B66C: 08        .byte $08, $08, $08, $0B   ; 
- D 1 - I - 0x00F680 03:B670: 08        .byte $08, $08, $0B, $00   ; 
; 69 
- D 1 - I - 0x00F684 03:B674: 38        .byte $38, $80, $00, $68   ; 
- D 1 - I - 0x00F688 03:B678: 80        .byte $80, $00, $6A, $6B   ; 
- D 1 - I - 0x00F68C 03:B67C: 00        .byte $00, $6E, $6F, $70   ; 
- D 1 - I - 0x00F690 03:B680: 00        .byte $00, $74, $75, $76   ; 
; 6A 
- D 1 - I - 0x00F694 03:B684: 69        .byte $69, $00, $81, $39   ; 
- D 1 - I - 0x00F698 03:B688: 6C        .byte $6C, $6D, $00, $81   ; 
- D 1 - I - 0x00F69C 03:B68C: 71        .byte $71, $72, $73, $00   ; 
- D 1 - I - 0x00F6A0 03:B690: 77        .byte $77, $78, $79, $00   ; 
; 6B 
- D 1 - I - 0x00F6A4 03:B694: 3A        .byte $3A, $3B, $35, $35   ; 
- D 1 - I - 0x00F6A8 03:B698: 32        .byte $32, $3E, $3C, $3C   ; 
- D 1 - I - 0x00F6AC 03:B69C: 00        .byte $00, $10, $1A, $08   ; 
- D 1 - I - 0x00F6B0 03:B6A0: 1A        .byte $1A, $08, $19, $08   ; 
; 6C 
- D 1 - I - 0x00F6B4 03:B6A4: 35        .byte $35, $35, $35, $35   ; 
- D 1 - I - 0x00F6B8 03:B6A8: 3C        .byte $3C, $3C, $3C, $3C   ; 
- D 1 - I - 0x00F6BC 03:B6AC: 18        .byte $18, $08, $0B, $0F   ; 
- D 1 - I - 0x00F6C0 03:B6B0: 0B        .byte $0B, $10, $00, $0F   ; 
; 6D 
- D 1 - I - 0x00F6C4 03:B6B4: 00        .byte $00, $00, $05, $06   ; 
- D 1 - I - 0x00F6C8 03:B6B8: 00        .byte $00, $00, $11, $12   ; 
- D 1 - I - 0x00F6CC 03:B6BC: 00        .byte $00, $00, $11, $12   ; 
- D 1 - I - 0x00F6D0 03:B6C0: 00        .byte $00, $00, $05, $06   ; 
; 6E 
- D 1 - I - 0x00F6D4 03:B6C4: 3F        .byte $3F, $3F, $3F, $3F   ; 
- D 1 - I - 0x00F6D8 03:B6C8: 44        .byte $44, $44, $44, $44   ; 
- D 1 - I - 0x00F6DC 03:B6CC: 26        .byte $26, $26, $26, $26   ; 
- D 1 - I - 0x00F6E0 03:B6D0: 26        .byte $26, $0C, $0D, $26   ; 
; 6F 
- D 1 - I - 0x00F6E4 03:B6D4: 3F        .byte $3F, $3F, $40, $41   ; 
- D 1 - I - 0x00F6E8 03:B6D8: 44        .byte $44, $44, $45, $46   ; 
- D 1 - I - 0x00F6EC 03:B6DC: 26        .byte $26, $26, $26, $4B   ; 
- D 1 - I - 0x00F6F0 03:B6E0: 26        .byte $26, $0C, $0D, $26   ; 
; 70 
- D 1 - I - 0x00F6F4 03:B6E4: 82        .byte $82, $00, $7A, $7B   ; 
- D 1 - I - 0x00F6F8 03:B6E8: 47        .byte $47, $82, $00, $7E   ; 
- D 1 - I - 0x00F6FC 03:B6EC: 4C        .byte $4C, $41, $00, $17   ; 
- D 1 - I - 0x00F700 03:B6F0: 4F        .byte $4F, $50, $00, $18   ; 
; 71 
- D 1 - I - 0x00F704 03:B6F4: 7C        .byte $7C, $7D, $00, $83   ; 
- D 1 - I - 0x00F708 03:B6F8: 7F        .byte $7F, $00, $83, $48   ; 
- D 1 - I - 0x00F70C 03:B6FC: 00        .byte $00, $00, $42, $4D   ; 
- D 1 - I - 0x00F710 03:B700: 1A        .byte $1A, $08, $51, $52   ; 
; 72 
- D 1 - I - 0x00F714 03:B704: 42        .byte $42, $43, $3F, $3F   ; 
- D 1 - I - 0x00F718 03:B708: 49        .byte $49, $4A, $44, $44   ; 
- D 1 - I - 0x00F71C 03:B70C: 4E        .byte $4E, $26, $26, $26   ; 
- D 1 - I - 0x00F720 03:B710: 26        .byte $26, $0C, $0D, $26   ; 
; 73 
- D 1 - I - 0x00F724 03:B714: 15        .byte $15, $16, $00, $00   ; 
- D 1 - I - 0x00F728 03:B718: 13        .byte $13, $14, $00, $00   ; 
- D 1 - I - 0x00F72C 03:B71C: 13        .byte $13, $14, $00, $00   ; 
- D 1 - I - 0x00F730 03:B720: 15        .byte $15, $16, $00, $00   ; 
; 74 
- D 1 - I - 0x00F734 03:B724: 26        .byte $26, $1C, $1D, $26   ; 
- D 1 - I - 0x00F738 03:B728: 26        .byte $26, $26, $26, $26   ; 
- D 1 - I - 0x00F73C 03:B72C: 57        .byte $57, $57, $57, $57   ; 
- D 1 - I - 0x00F740 03:B730: 57        .byte $57, $57, $57, $57   ; 
; 75 
- D 1 - I - 0x00F744 03:B734: 53        .byte $53, $54, $08, $08   ; 
- D 1 - I - 0x00F748 03:B738: 53        .byte $53, $54, $07, $0B   ; 
- D 1 - I - 0x00F74C 03:B73C: 57        .byte $57, $58, $59, $59   ; 
- D 1 - I - 0x00F750 03:B740: 57        .byte $57, $57, $57, $57   ; 
; 76 
- D 1 - I - 0x00F754 03:B744: 0B        .byte $0B, $00, $55, $56   ; 
- D 1 - I - 0x00F758 03:B748: 07        .byte $07, $08, $55, $56   ; 
- D 1 - I - 0x00F75C 03:B74C: 59        .byte $59, $59, $5A, $57   ; 
- D 1 - I - 0x00F760 03:B750: 57        .byte $57, $57, $57, $57   ; 
; 77 
- D 1 - I - 0x00F764 03:B754: 00        .byte $00, $00, $11, $12   ; 
- D 1 - I - 0x00F768 03:B758: 00        .byte $00, $00, $11, $12   ; 
- D 1 - I - 0x00F76C 03:B75C: 00        .byte $00, $00, $11, $12   ; 
- D 1 - I - 0x00F770 03:B760: 00        .byte $00, $5D, $5E, $12   ; 
; 78 
- D 1 - I - 0x00F774 03:B764: 5B        .byte $5B, $5B, $5B, $5B   ; 
- D 1 - I - 0x00F778 03:B768: 5C        .byte $5C, $5C, $5C, $5C   ; 
- D 1 - I - 0x00F77C 03:B76C: 1E        .byte $1E, $07, $08, $18   ; 
- D 1 - I - 0x00F780 03:B770: 1E        .byte $1E, $00, $1A, $0A   ; 
; 79 
- D 1 - I - 0x00F784 03:B774: 5B        .byte $5B, $5B, $5B, $5B   ; 
- D 1 - I - 0x00F788 03:B778: 5C        .byte $5C, $5C, $5C, $5C   ; 
- D 1 - I - 0x00F78C 03:B77C: 08        .byte $08, $1B, $19, $10   ; 
- D 1 - I - 0x00F790 03:B780: 0A        .byte $0A, $08, $0A, $09   ; 
; 7A 
- D 1 - I - 0x00F794 03:B784: 5B        .byte $5B, $5B, $5B, $5B   ; 
- D 1 - I - 0x00F798 03:B788: 5C        .byte $5C, $5C, $5C, $5C   ; 
- D 1 - I - 0x00F79C 03:B78C: 1A        .byte $1A, $08, $08, $18   ; 
- D 1 - I - 0x00F7A0 03:B790: 18        .byte $18, $07, $08, $0B   ; 
; 7B 
- D 1 - I - 0x00F7A4 03:B794: 5B        .byte $5B, $5B, $5B, $5B   ; 
- D 1 - I - 0x00F7A8 03:B798: 5C        .byte $5C, $5C, $5C, $5C   ; 
- D 1 - I - 0x00F7AC 03:B79C: 1A        .byte $1A, $0A, $0B, $10   ; 
- D 1 - I - 0x00F7B0 03:B7A0: 84        .byte $84, $07, $0A, $08   ; 
; 7C 
- D 1 - I - 0x00F7B4 03:B7A4: 5B        .byte $5B, $5B, $5B, $5B   ; 
- D 1 - I - 0x00F7B8 03:B7A8: 5C        .byte $5C, $5C, $5C, $5C   ; 
- D 1 - I - 0x00F7BC 03:B7AC: 0A        .byte $0A, $08, $09, $1F   ; 
- D 1 - I - 0x00F7C0 03:B7B0: 0A        .byte $0A, $08, $1B, $1F   ; 
; 7D 
- D 1 - I - 0x00F7C4 03:B7B4: 13        .byte $13, $14, $00, $00   ; 
- D 1 - I - 0x00F7C8 03:B7B8: 13        .byte $13, $14, $00, $00   ; 
- D 1 - I - 0x00F7CC 03:B7BC: 13        .byte $13, $14, $00, $00   ; 
- D 1 - I - 0x00F7D0 03:B7C0: 13        .byte $13, $5F, $60, $00   ; 
; 7E 
- D 1 - I - 0x00F7D4 03:B7C4: 00        .byte $00, $61, $62, $63   ; 
- D 1 - I - 0x00F7D8 03:B7C8: 00        .byte $00, $85, $86, $87   ; 
- D 1 - I - 0x00F7DC 03:B7CC: 00        .byte $00, $85, $86, $87   ; 
- D 1 - I - 0x00F7E0 03:B7D0: 00        .byte $00, $85, $86, $87   ; 
; 7F 
- D 1 - I - 0x00F7E4 03:B7D4: 64        .byte $64, $64, $64, $64   ; 
- D 1 - I - 0x00F7E8 03:B7D8: 26        .byte $26, $26, $26, $26   ; 
- D 1 - I - 0x00F7EC 03:B7DC: 26        .byte $26, $26, $26, $26   ; 
- D 1 - I - 0x00F7F0 03:B7E0: 26        .byte $26, $26, $26, $26   ; 
; 80 
- D 1 - I - 0x00F7F4 03:B7E4: 65        .byte $65, $66, $67, $00   ; 
- D 1 - I - 0x00F7F8 03:B7E8: 88        .byte $88, $89, $8A, $00   ; 
- D 1 - I - 0x00F7FC 03:B7EC: 88        .byte $88, $89, $8A, $00   ; 
- D 1 - I - 0x00F800 03:B7F0: 88        .byte $88, $89, $8A, $00   ; 



_off007_0x00F804_02_area_3:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
- D 1 - I - 0x00F804 03:B7F4: C0        .byte $C0, $00, $00, $00, $00, $00, $00, $00, $50, $00, $54, $50, $55, $55, $55, $55   ; 00
- D 1 - I - 0x00F814 03:B804: 55        .byte $55, $55, $55, $55, $00, $00, $00, $00, $C5, $F5, $F5, $35, $F5, $00, $BB, $AA   ; 10
- D 1 - I - 0x00F824 03:B814: EE        .byte $EE, $00, $00, $BB, $AA, $EE, $00, $00, $01, $00, $00, $60, $08, $05, $05, $05   ; 20
- D 1 - I - 0x00F834 03:B824: 12        .byte $12, $50, $50, $50, $00, $00, $FF, $FF, $00, $00, $0F, $FF, $FF, $FF, $F5, $00   ; 30
- D 1 - I - 0x00F844 03:B834: FF        .byte $FF, $20, $88, $A2, $00, $00, $F5, $FF, $F0, $88, $A2, $C8, $B2, $C8, $B2, $88   ; 40
- D 1 - I - 0x00F854 03:B844: 00        .byte $00, $B4, $55, $55, $55, $55, $55, $FB, $FF, $55, $55, $FF, $FF, $BF, $EF, $FF   ; 50
- D 1 - I - 0x00F864 03:B854: FF        .byte $FF, $FF, $FF, $FB, $FE, $FF, $FF, $AF, $AF, $3C, $C3, $AF, $AF, $FF, $FF, $FF   ; 60
- D 1 - I - 0x00F874 03:B864: BC        .byte $BC, $E3, $FF, $FF, $FF, $FB, $FE, $FF, $AF, $AF, $AF, $AF, $AF, $FF, $FF, $FF   ; 70
- D 1 - I - 0x00F884 03:B874: FF        .byte $FF                                                                              ; 80





.out .sprintf("Free bytes in bank 36: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_36b"
- D 1 - - - 0x01000F 03:BFFF: 37        .byte con_prg_bank + $37   ; 



