.segment "BANK_20"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x000010-0x00800F



.export loc_0x00231A_обработчик_главного_экрана
.export loc_0x00189E_отрисовка_экранов



; bzk this byte must be placed at 8000
    .byte con_prg_bank + $20   ; 






loc_0x00231A_обработчик_главного_экрана:
; leon опт
                                        LDY ram_0080
                                        LDA tbl_A30F_lo,y
                                        STA ram_0000
                                        LDA tbl_A30F_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_A30F_lo:
- D 1 - I - 0x00231F 00:A30F: 17 A3     .byte < ofs_010_A317_00
- D 1 - I - 0x002321 00:A311: 3C A3     .byte < ofs_010_A33C_01
- D 1 - I - 0x002323 00:A313: 6D A3     .byte < ofs_010_A36D_02
- D 1 - I - 0x002325 00:A315: B1 A3     .byte < ofs_010_A3B1_03
tbl_A30F_hi:
- D 1 - I - 0x00231F 00:A30F: 17 A3     .byte > ofs_010_A317_00
- D 1 - I - 0x002321 00:A311: 3C A3     .byte > ofs_010_A33C_01
- D 1 - I - 0x002323 00:A313: 6D A3     .byte > ofs_010_A36D_02
- D 1 - I - 0x002325 00:A315: B1 A3     .byte > ofs_010_A3B1_03


ofs_010_A317_00:
C - - J - - 0x002327 00:A317: A0 0F     LDY #$0F
; clear 0080-008F
C - - - - - 0x002329 00:A319: A9 00     LDA #$00
bra_A31B_loop:
C - - - - - 0x00232B 00:A31B: 99 80 00  STA $00 + $80,Y
C - - - - - 0x00232E 00:A31E: 88        DEY
C - - - - - 0x00232F 00:A31F: 10 FA     BPL bra_A31B_loop
C - - - - - 0x002331 00:A321: A9 00     LDA #con_mirroring_V
C - - - - - 0x002333 00:A323: 85 26     STA ram_for_A000
C - - - - - 0x002335 00:A325: A9 A9     LDA #$A9
C - - - - - 0x002337 00:A327: 85 FF     STA ram_for_2000
C - - - - - 0x002339 00:A329: 85 85     STA ram_0085
C - - - - - 0x00233B 00:A32B: 85 86     STA ram_0085 + $01
C - - - - - 0x00233D 00:A32D: A9 00     LDA #$00
C - - - - - 0x00233F 00:A32F: 85 FD     STA ram_scroll_X
C - - - - - 0x002341 00:A331: 85 FC     STA ram_scroll_Y
C - - - - - 0x002343 00:A333: A2 02     LDX #$02    ; title screen
C - - - - - 0x002345 00:A335: 20 8E 98  JSR sub_988E_отрисовка_экранов
loc_A338:
C D 1 - - - 0x002348 00:A338: E6 80     INC ram_0080
C - - - - - 0x00234A 00:A33A: 18        CLC
C - - - - - 0x00234B 00:A33B: 60        RTS



ofs_010_A33C_01:
C - - J - - 0x00234C 00:A33C: A5 1B     LDA ram_счетчик_кадров_1
C - - - - - 0x00234E 00:A33E: 29 01     AND #$01
C - - - - - 0x002350 00:A340: AA        TAX
C - - - - - 0x002351 00:A341: BD 6B A3  LDA tbl_A36B,X
C - - - - - 0x002354 00:A344: 18        CLC
C - - - - - 0x002355 00:A345: 75 83     ADC ram_0083,X
C - - - - - 0x002357 00:A347: 95 83     STA ram_0083,X
C - - - - - 0x002359 00:A349: 6A        ROR
C - - - - - 0x00235A 00:A34A: 5D 6B A3  EOR tbl_A36B,X
C - - - - - 0x00235D 00:A34D: 10 06     BPL bra_A355
C - - - - - 0x00235F 00:A34F: B5 85     LDA ram_0085,X
C - - - - - 0x002361 00:A351: 49 01     EOR #$01
C - - - - - 0x002363 00:A353: 95 85     STA ram_0085,X
bra_A355:
C - - - - - 0x002365 00:A355: B5 85     LDA ram_0085,X
C - - - - - 0x002367 00:A357: 85 FF     STA ram_for_2000
C - - - - - 0x002369 00:A359: B5 83     LDA ram_0083,X
C - - - - - 0x00236B 00:A35B: 85 FD     STA ram_scroll_X
C - - - - - 0x00236D 00:A35D: D0 0A     BNE bra_A369
C - - - - - 0x00236F 00:A35F: 20 42 E5  JSR sub_0x01E552
C - - - - - 0x002372 00:A362: A9 40     LDA #$40
loc_A364:
C D 1 - - - 0x002374 00:A364: 85 81     STA ram_0081
C - - - - - 0x002376 00:A366: 4C 38 A3  JMP loc_A338
bra_A369:
C - - - - - 0x002379 00:A369: 18        CLC
C - - - - - 0x00237A 00:A36A: 60        RTS



tbl_A36B:
- D 1 - - - 0x00237B 00:A36B: 02        .byte $02   ; 00 
- D 1 - - - 0x00237C 00:A36C: FE        .byte $FE   ; 01 



ofs_010_A36D_02:
C - - J - - 0x00237D 00:A36D: C6 81     DEC ram_0081
C - - - - - 0x00237F 00:A36F: D0 F8     BNE bra_A369
C - - - - - 0x002381 00:A371: A9 08     LDA #$08
C - - - - - 0x002383 00:A373: 85 81     STA ram_0081
C - - - - - 0x002385 00:A375: A5 82     LDA ram_0082_конфиг_уровня
C - - - - - 0x002387 00:A377: 0A        ASL
C - - - - - 0x002388 00:A378: 65 82     ADC ram_0082_конфиг_уровня
C - - - - - 0x00238A 00:A37A: A8        TAY
C - - - - - 0x00238B 00:A37B: A2 00     LDX #$00
bra_A37D_loop:
C - - - - - 0x00238D 00:A37D: B9 9F A3  LDA tbl_A39F_colors_bg,Y
C - - - - - 0x002390 00:A380: 9D ED 03  STA ram_pal_buffer + $0D,X
C - - - - - 0x002393 00:A383: B9 A8 A3  LDA tbl_A3A8_colors_spr,Y
C - - - - - 0x002396 00:A386: 9D F1 03  STA ram_pal_buffer + $11,X
C - - - - - 0x002399 00:A389: C8        INY
C - - - - - 0x00239A 00:A38A: E8        INX
C - - - - - 0x00239B 00:A38B: E0 03     CPX #$03
C - - - - - 0x00239D 00:A38D: 90 EE     BCC bra_A37D_loop
; leon
C - - - - - 0x00239F 00:A38F: 20 BE F7  JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
C - - - - - 0x0023A2 00:A392: E6 82     INC ram_0082_конфиг_уровня
C - - - - - 0x0023A4 00:A394: A5 82     LDA ram_0082_конфиг_уровня
C - - - - - 0x0023A6 00:A396: C9 03     CMP #$03
C - - - - - 0x0023A8 00:A398: 90 CF     BCC bra_A369
C - - - - - 0x0023AA 00:A39A: A9 70     LDA #$70
C - - - - - 0x0023AC 00:A39C: 4C 64 A3  JMP loc_A364



tbl_A39F_colors_bg:
- D 1 - - - 0x0023AF 00:A39F: 07        .byte $07, $06, $06   ; 00 
- D 1 - - - 0x0023B2 00:A3A2: 17        .byte $17, $16, $06   ; 01 
- D 1 - - - 0x0023B5 00:A3A5: 27        .byte $27, $16, $06   ; 02 



tbl_A3A8_colors_spr:
- D 1 - - - 0x0023B8 00:A3A8: 06        .byte $06, $06, $0F   ; 00 
- D 1 - - - 0x0023BB 00:A3AB: 16        .byte $16, $06, $0F   ; 01 
- D 1 - - - 0x0023BE 00:A3AE: 16        .byte $16, $06, $0F   ; 02 



ofs_010_A3B1_03:
C - - J - - 0x0023C1 00:A3B1: C6 81     DEC ram_0081
C - - - - - 0x0023C3 00:A3B3: D0 B4     BNE bra_A369
C - - - - - 0x0023C5 00:A3B5: 38        SEC
C - - - - - 0x0023C6 00:A3B6: 60        RTS





sub_988E_отрисовка_экранов:
loc_0x00189E_отрисовка_экранов:
C D 0 - - - 0x00189E 00:988E: A9 04     LDA #$04
C - - - - - 0x0018A0 00:9890: 85 1D     STA ram_001D
C - - - - - 0x0018A2 00:9892: BD 05 99  LDA tbl_9905_screen_data,X
C - - - - - 0x0018A5 00:9895: 85 00     STA ram_0000
C - - - - - 0x0018A7 00:9897: BD 06 99  LDA tbl_9905_screen_data + $01,X
C - - - - - 0x0018AA 00:989A: 85 01     STA ram_0001
C - - - - - 0x0018AC 00:989C: 20 E9 FC  JSR sub_FCC4
C - - - - - 0x0018AF 00:989F: A9 00     LDA #$00
C - - - - - 0x0018B1 00:98A1: 85 FD     STA ram_scroll_X
C - - - - - 0x0018B3 00:98A3: 85 FC     STA ram_scroll_Y
loc_98A5_loop:
C D 0 - - - 0x0018B5 00:98A5: AD 02 20  LDA $2002
C - - - - - 0x0018B8 00:98A8: A0 01     LDY #$01
C - - - - - 0x0018BA 00:98AA: B1 00     LDA (ram_0000),Y
C - - - - - 0x0018BC 00:98AC: 8D 06 20  STA $2006
C - - - - - 0x0018BF 00:98AF: 88        DEY
C - - - - - 0x0018C0 00:98B0: B1 00     LDA (ram_0000),Y
C - - - - - 0x0018C2 00:98B2: 8D 06 20  STA $2006
C - - - - - 0x0018C5 00:98B5: A2 00     LDX #$00
C - - - - - 0x0018C7 00:98B7: A9 02     LDA #$02
C - - - - - 0x0018C9 00:98B9: 20 22 E6  JSR sub_E622_inc_pointer_by_A
loc_98BC_loop:
C D 0 - - - 0x0018CC 00:98BC: A0 00     LDY #$00
C - - - - - 0x0018CE 00:98BE: B1 00     LDA (ram_0000),Y
C - - - - - 0x0018D0 00:98C0: C9 FF     CMP #$FF
C - - - - - 0x0018D2 00:98C2: F0 3E     BEQ bra_9902_FF_end_token
C - - - - - 0x0018D4 00:98C4: C9 7F     CMP #$7F
C - - - - - 0x0018D6 00:98C6: F0 32     BEQ bra_98FA_7F
C - - - - - 0x0018D8 00:98C8: A8        TAY
C - - - - - 0x0018D9 00:98C9: 10 1D     BPL bra_98E8_00_7E
; 80-FE
C - - - - - 0x0018DB 00:98CB: 29 7F     AND #$7F
C - - - - - 0x0018DD 00:98CD: 85 02     STA ram_0002
C - - - - - 0x0018DF 00:98CF: A0 01     LDY #$01
bra_98D1_loop:
C - - - - - 0x0018E1 00:98D1: B1 00     LDA (ram_0000),Y
C - - - - - 0x0018E3 00:98D3: 8D 07 20  STA $2007
C - - - - - 0x0018E6 00:98D6: C4 02     CPY ram_0002
C - - - - - 0x0018E8 00:98D8: F0 03     BEQ bra_98DD
C - - - - - 0x0018EA 00:98DA: C8        INY
C - - - - - 0x0018EB 00:98DB: D0 F4     BNE bra_98D1_loop
bra_98DD:
C - - - - - 0x0018ED 00:98DD: A9 01     LDA #$01
C - - - - - 0x0018EF 00:98DF: 18        CLC
C - - - - - 0x0018F0 00:98E0: 65 02     ADC ram_0002
bra_98E2:
C - - - - - 0x0018F2 00:98E2: 20 22 E6  JSR sub_E622_inc_pointer_by_A
C - - - - - 0x0018F5 00:98E5: 4C BC 98  JMP loc_98BC_loop
bra_98E8_00_7E:
C - - - - - 0x0018F8 00:98E8: A0 01     LDY #$01
C - - - - - 0x0018FA 00:98EA: 85 02     STA ram_0002
C - - - - - 0x0018FC 00:98EC: B1 00     LDA (ram_0000),Y
C - - - - - 0x0018FE 00:98EE: A4 02     LDY ram_0002
bra_98F0_loop:
C - - - - - 0x001900 00:98F0: 8D 07 20  STA $2007
C - - - - - 0x001903 00:98F3: 88        DEY
C - - - - - 0x001904 00:98F4: D0 FA     BNE bra_98F0_loop
C - - - - - 0x001906 00:98F6: A9 02     LDA #$02
C - - - - - 0x001908 00:98F8: D0 E8     BNE bra_98E2    ; jmp
bra_98FA_7F:
C - - - - - 0x00190A 00:98FA: A9 01     LDA #$01
C - - - - - 0x00190C 00:98FC: 20 22 E6  JSR sub_E622_inc_pointer_by_A
C - - - - - 0x00190F 00:98FF: 4C A5 98  JMP loc_98A5_loop
bra_9902_FF_end_token:
C - - - - - 0x001912 00:9902: 4C BA FC  JMP loc_0x01FCCA_enable_nmi

; 1путин перенесен с фикс банка 3E
sub_E622_inc_pointer_by_A:
C - - - - - 0x01E632 07:E622: 18        CLC
C - - - - - 0x01E633 07:E623: 75 00     ADC ram_0000
C - - - - - 0x01E635 07:E625: 95 00     STA ram_0000
C - - - - - 0x01E637 07:E627: 90 02     BCC bra_E62B_RTS
C - - - - - 0x01E639 07:E629: F6 01     INC ram_0001
bra_E62B_RTS:
C - - - - - 0x01E63B 07:E62B: 60        RTS

; 1путин перенесен с фикс банка 3E
sub_FCC4:
C - - - - - 0x01FCD4 07:FCC4: A5 FF     LDA ram_for_2000
C - - - - - 0x01FCD6 07:FCC6: 29 7F     AND #$7F
C - - - - - 0x01FCD8 07:FCC8: 8D 00 20  STA $2000
C - - - - - 0x01FCDB 07:FCCB: 85 FF     STA ram_for_2000
C - - - - - 0x01FCFC 07:FCEC: A9 00     LDA #$00
C - - - - - 0x01FCFE 07:FCEE: 8D 06 20  STA $2006
C - - - - - 0x01FD01 07:FCF1: 8D 06 20  STA $2006
C - - - - - 0x01FD04 07:FCF4: A5 FE     LDA ram_for_2001
C - - - - - 0x01FD06 07:FCF6: 29 E7     AND #$E7
C - - - - - 0x01FD08 07:FCF8: 8D 01 20  STA $2001
C - - - - - 0x01FD0B 07:FCFB: 60        RTS

tbl_9905_screen_data:
- D 0 - - - 0x001915 00:9905: 0B 99     .word _off010_990B_x00_обнуление_ppu
- D 0 - - - 0x001917 00:9907: 35 99     .word _off010_9935_x02_главный_экран
- D 0 - - - 0x001919 00:9909: B3 9A     .word _off010_9AB3_x04_заставка



_off010_990B_x00_обнуление_ppu:
- D 0 - I - 0x00191B 00:990B: 00 20     .word $2000 ; ppu address

- D 0 - I - 0x00191D 00:990D: 78        .byte $78, $00   ; 
- D 0 - I - 0x00191F 00:990F: 78        .byte $78, $00   ; 
- D 0 - I - 0x001921 00:9911: 78        .byte $78, $00   ; 
- D 0 - I - 0x001923 00:9913: 78        .byte $78, $00   ; 
- D 0 - I - 0x001925 00:9915: 78        .byte $78, $00   ; 
- D 0 - I - 0x001927 00:9917: 78        .byte $78, $00   ; 
- D 0 - I - 0x001929 00:9919: 78        .byte $78, $00   ; 
- D 0 - I - 0x00192B 00:991B: 78        .byte $78, $00   ; 
- D 0 - I - 0x00192D 00:991D: 40        .byte $40, $00   ; 

- D 0 - I - 0x00192F 00:991F: 7F        .byte $7F   ; set new ppu address

- D 0 - I - 0x001930 00:9920: 00 2C     .word $2C00 ; ppu address

- D 0 - I - 0x001932 00:9922: 78        .byte $78, $00   ; 
- D 0 - I - 0x001934 00:9924: 78        .byte $78, $00   ; 
- D 0 - I - 0x001936 00:9926: 78        .byte $78, $00   ; 
- D 0 - I - 0x001938 00:9928: 78        .byte $78, $00   ; 
- D 0 - I - 0x00193A 00:992A: 78        .byte $78, $00   ; 
- D 0 - I - 0x00193C 00:992C: 78        .byte $78, $00   ; 
- D 0 - I - 0x00193E 00:992E: 78        .byte $78, $00   ; 
- D 0 - I - 0x001940 00:9930: 78        .byte $78, $00   ; 
- D 0 - I - 0x001942 00:9932: 40        .byte $40, $00   ; 

- D 0 - I - 0x001944 00:9934: FF        .byte $FF   ; end token



_off010_9935_x02_главный_экран:
- D 0 - I - 0x001945 00:9935: 00 20     .word $2000 ; 

- D 0 - I - 0x001947 00:9937: 6B        .byte $6B, $00   ; 

- D 0 - I - 0x001949 00:9939: 8B        .byte $80 + $0B   ; print following tiles
- D 0 - I - 0x00194A 00:993A: 2E        .byte $2E, $2F, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D   ; 

- D 0 - I - 0x001955 00:9945: 14        .byte $14, $00   ; 

- D 0 - I - 0x001957 00:9947: 8C        .byte $80 + $0C   ; print following tiles
- D 0 - I - 0x001958 00:9948: 30        .byte $30, $31, $32, $3E, $3F, $40, $41, $42, $43, $44, $45, $46   ; 

- D 0 - I - 0x001964 00:9954: 14        .byte $14, $00   ; 

- D 0 - I - 0x001966 00:9956: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001967 00:9957: 33        .byte $33, $34   ; 

- D 0 - I - 0x001969 00:9959: 27        .byte $27, $00   ; 

- D 0 - I - 0x00196B 00:995B: 88        .byte $80 + $08   ; print following tiles
- D 0 - I - 0x00196C 00:995C: 47        .byte $47, $48, $49, $4A, $4B, $4C, $4D, $4E   ; 

- D 0 - I - 0x001974 00:9964: 17        .byte $17, $00   ; 

- D 0 - I - 0x001976 00:9966: 8A        .byte $80 + $0A   ; print following tiles
- D 0 - I - 0x001977 00:9967: 4F        .byte $4F, $50, $51, $52, $53, $54, $55, $55, $56, $57   ; 

- D 0 - I - 0x001981 00:9971: 15        .byte $15, $00   ; 

- D 0 - I - 0x001983 00:9973: 83        .byte $80 + $03   ; print following tiles
- D 0 - I - 0x001984 00:9974: 58        .byte $58, $59, $5A   ; 

- D 0 - I - 0x001987 00:9977: 04        .byte $04, $00   ; 

- D 0 - I - 0x001989 00:9979: 84        .byte $80 + $04   ; print following tiles
- D 0 - I - 0x00198A 00:997A: 5B        .byte $5B, $5C, $5D, $5E   ; 

- D 0 - I - 0x00198E 00:997E: 14        .byte $14, $00   ; 

- D 0 - I - 0x001990 00:9980: 84        .byte $80 + $04   ; print following tiles
- D 0 - I - 0x001991 00:9981: 5F        .byte $5F, $60, $61, $62   ; 

- D 0 - I - 0x001995 00:9985: 06        .byte $06, $00   ; 

- D 0 - I - 0x001997 00:9987: 81        .byte $80 + $01   ; print following tiles
- D 0 - I - 0x001998 00:9988: 72        .byte $72   ; 

- D 0 - I - 0x001999 00:9989: 0B        .byte $0B, $00   ; 

- D 0 - I - 0x00199B 00:998B: 93        .byte $80 + $13   ; print following tiles
- D 0 - I - 0x00199C 00:998C: 73        .byte $73, $74, $75, $76, $77, $78, $79, $7A, $7B, $7C, $7D, $7E, $7F, $80, $81, $82   ; 
- D 0 - I - 0x0019AC 00:999C: 83        .byte $83, $84, $85   ; 

- D 0 - I - 0x0019AF 00:999F: 0D        .byte $0D, $00   ; 

- D 0 - I - 0x0019B1 00:99A1: 93        .byte $80 + $13   ; print following tiles
- D 0 - I - 0x0019B2 00:99A2: 86        .byte $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, $00, $90, $91, $92, $93, $94   ; 
- D 0 - I - 0x0019C2 00:99B2: 95        .byte $95, $96, $97   ; 

- D 0 - I - 0x0019C5 00:99B5: 0D        .byte $0D, $00   ; 

- D 0 - I - 0x0019C7 00:99B7: 93        .byte $80 + $13   ; print following tiles
- D 0 - I - 0x0019C8 00:99B8: 98        .byte $98, $99, $9A, $9B, $9C, $9D, $9E, $9F, $A0, $A1, $A2, $A3, $A4, $A5, $A6, $A7   ; 
- D 0 - I - 0x0019D8 00:99C8: A8        .byte $A8, $A9, $AA   ; 

- D 0 - I - 0x0019DB 00:99CB: 0D        .byte $0D, $00   ; 

- D 0 - I - 0x0019DD 00:99CD: 93        .byte $80 + $13   ; print following tiles
- D 0 - I - 0x0019DE 00:99CE: AB        .byte $AB, $AC, $AD, $9F, $AE, $AF, $B0, $9F, $B1, $B2, $00, $B3, $00, $B4, $B5, $B6   ; 
- D 0 - I - 0x0019EE 00:99DE: B7        .byte $B7, $B8, $97   ; 

- D 0 - I - 0x0019F1 00:99E1: 0D        .byte $0D, $00   ; 

- D 0 - I - 0x0019F3 00:99E3: 97        .byte $80 + $17   ; print following tiles
- D 0 - I - 0x0019F4 00:99E4: B9        .byte $B9, $BA, $BB, $BC, $BD, $BE, $BB, $BF, $C0, $C1, $00, $C2, $C3, $C4, $C5, $C6   ; 
- D 0 - I - 0x001A04 00:99F4: C7        .byte $C7, $C8, $C9, $00, $63, $64, $65   ; 

- D 0 - I - 0x001A0B 00:99FB: 1D        .byte $1D, $00   ; 

- D 0 - I - 0x001A0D 00:99FD: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001A0E 00:99FE: 66        .byte $66, $67   ; 

- D 0 - I - 0x001A10 00:9A00: 16        .byte $16, $00   ; 

- D 0 - I - 0x001A12 00:9A02: 8B        .byte $80 + $0B   ; print following tiles
- D 0 - I - 0x001A13 00:9A03: 68        .byte $68, $69, $6A, $6B, $6C, $6D, $6E, $6F, $00, $70, $71   ; 

- D 0 - I - 0x001A1E 00:9A0E: 19        .byte $19, $00   ; 

- D 0 - I - 0x001A20 00:9A10: 81        .byte $80 + $01   ; print following tiles
- D 0 - I - 0x001A21 00:9A11: 72        .byte $72   ; 

- D 0 - I - 0x001A22 00:9A12: 33        .byte $33, $00   ; 

- D 0 - I - 0x001A24 00:9A14: 8B        .byte $80 + $0B   ; print following tiles
- D 0 - I - 0x001A25 00:9A15: 1A        .byte $1A, $16, $0B, $23, $00, $1D, $0F, $16, $0F, $0D, $1E   ; "PLAY SELECT"

- D 0 - I - 0x001A30 00:9A20: 31        .byte $31, $00   ; 

- D 0 - I - 0x001A32 00:9A22: 88        .byte $80 + $08   ; print following tiles
- D 0 - I - 0x001A33 00:9A23: 02        .byte $02, $00, $1A, $16, $0B, $23, $0F, $1C   ; "1 PLAYER"

- D 0 - I - 0x001A3B 00:9A2B: 04        .byte $04, $00   ; 

- D 0 - I - 0x001A3D 00:9A2D: 89        .byte $80 + $09   ; print following tiles
- D 0 - I - 0x001A3E 00:9A2E: 03        .byte $03, $00, $1A, $16, $0B, $23, $0F, $1C, $1D   ; "2 PLAYERS"

- D 0 - I - 0x001A47 00:9A37: 2E        .byte $2E, $00   ; 

- D 0 - I - 0x001A49 00:9A39: 8D        .byte $80 + $0D   ; print following tiles
- D 0 - I - 0x001A4A 00:9A3A: 1E        .byte $1E, $17, $00, $0B, $18, $0E, $00, $27, $00, $02, $0A, $0A, $01   ; "TM AND @ 1990"

- D 0 - I - 0x001A57 00:9A47: 0E        .byte $0E, $00   ; 

- D 0 - I - 0x001A59 00:9A49: 98        .byte $80 + $18   ; print following tiles
- D 0 - I - 0x001A5A 00:9A4A: 15        .byte $15, $19, $18, $0B, $17, $13, $00, $13, $18, $0E, $1F, $1D, $1E, $1C, $23, $00   ; 
- D 0 - I - 0x001A6A 00:9A5A: 0D        .byte $0D, $19, $26, $CA, $16, $1E, $0E, $26   ; "KONAMI INDUSTRY CO.,LTD."

- D 0 - I - 0x001A72 00:9A62: 0E        .byte $0E, $00   ; 

- D 0 - I - 0x001A74 00:9A64: 8B        .byte $80 + $0B   ; print following tiles
- D 0 - I - 0x001A75 00:9A65: 16        .byte $16, $13, $0D, $0F, $18, $1D, $0F, $0E, $00, $0C, $23   ; "LICENSED BY"

- D 0 - I - 0x001A80 00:9A70: 0F        .byte $0F, $00   ; 

- D 0 - I - 0x001A82 00:9A72: 98        .byte $80 + $18   ; print following tiles
- D 0 - I - 0x001A83 00:9A73: 18        .byte $18, $13, $18, $1E, $0F, $18, $0E, $19, $00, $19, $10, $00, $0B, $17, $0F, $1C   ; 
- D 0 - I - 0x001A93 00:9A83: 13        .byte $13, $0D, $0B, $00, $13, $18, $0D, $26   ; "NINTENDO OF AMERICA INC."

- D 0 - I - 0x001A9B 00:9A8B: 70        .byte $70, $00   ; 
- D 0 - I - 0x001A9D 00:9A8D: 03        .byte $03, $F0   ; 

- D 0 - I - 0x001A9F 00:9A8F: 8B        .byte $80 + $0B   ; print following tiles
- D 0 - I - 0x001AA0 00:9A90: 00        .byte $00, $00, $40, $50, $50, $5F, $5F, $1F, $00, $00, $44   ; 

- D 0 - I - 0x001AAB 00:9A9B: 04        .byte $04, $55   ; 

- D 0 - I - 0x001AAD 00:9A9D: 83        .byte $80 + $03   ; print following tiles
- D 0 - I - 0x001AAE 00:9A9E: D1        .byte $D1, $30, $00   ; 

- D 0 - I - 0x001AB1 00:9AA1: 03        .byte $03, $A0   ; 

- D 0 - I - 0x001AB3 00:9AA3: 85        .byte $80 + $05   ; print following tiles
- D 0 - I - 0x001AB4 00:9AA4: AC        .byte $AC, $AF, $AF, $03, $00   ; 

- D 0 - I - 0x001AB9 00:9AA9: 06        .byte $06, $AA   ; 

- D 0 - I - 0x001ABB 00:9AAB: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001ABC 00:9AAC: 00        .byte $00, $00   ; 

- D 0 - I - 0x001ABE 00:9AAE: 06        .byte $06, $AA   ; 
- D 0 - I - 0x001AC0 00:9AB0: 09        .byte $09, $00   ; 

- D 0 - I - 0x001AC2 00:9AB2: FF        .byte $FF   ; end token



_off010_9AB3_x04_заставка:
- D 0 - I - 0x001AC3 00:9AB3: 00 20     .word $2000 ; 

- D 0 - I - 0x001AC5 00:9AB5: 61        .byte $61, $8B   ; 

- D 0 - I - 0x001AC7 00:9AB7: 90        .byte $80 + $10   ; print following tiles
- D 0 - I - 0x001AC8 00:9AB8: 9D        .byte $9D, $8B, $8B, $9E, $9F, $A0, $9E, $A0, $8B, $A1, $A2, $A2, $A3, $A4, $A5, $A6   ; 

- D 0 - I - 0x001AD8 00:9AC8: 03        .byte $03, $8B   ; 

- D 0 - I - 0x001ADA 00:9ACA: 88        .byte $80 + $08   ; print following tiles
- D 0 - I - 0x001ADB 00:9ACB: 9D        .byte $9D, $8B, $8B, $8C, $8B, $9F, $9E, $A0   ; 

- D 0 - I - 0x001AE3 00:9AD3: 05        .byte $05, $8B   ; 

- D 0 - I - 0x001AE5 00:9AD5: 88        .byte $80 + $08   ; print following tiles
- D 0 - I - 0x001AE6 00:9AD6: A1        .byte $A1, $A2, $A3, $A4, $A5, $A4, $A5, $A6   ; 

- D 0 - I - 0x001AEE 00:9ADE: 04        .byte $04, $8B   ; 

- D 0 - I - 0x001AF0 00:9AE0: 94        .byte $80 + $14   ; print following tiles
- D 0 - I - 0x001AF1 00:9AE1: 9D        .byte $9D, $8B, $8B, $9E, $9E, $A0, $8B, $A1, $A7, $A5, $A2, $A3, $A4, $A5, $A6, $A1   ; 
- D 0 - I - 0x001B01 00:9AF1: A5        .byte $A5, $8B, $8B, $A0   ; 

- D 0 - I - 0x001B05 00:9AF5: 03        .byte $03, $8B   ; 

- D 0 - I - 0x001B07 00:9AF7: 83        .byte $80 + $03   ; print following tiles
- D 0 - I - 0x001B08 00:9AF8: 9D        .byte $9D, $8B, $8B   ; 

- D 0 - I - 0x001B0B 00:9AFB: 03        .byte $03, $9E   ; 

- D 0 - I - 0x001B0D 00:9AFD: 89        .byte $80 + $09   ; print following tiles
- D 0 - I - 0x001B0E 00:9AFE: A0        .byte $A0, $8B, $8B, $A1, $A2, $A3, $A4, $A5, $A6   ; 

- D 0 - I - 0x001B17 00:9B07: 04        .byte $04, $8B   ; 

- D 0 - I - 0x001B19 00:9B09: 83        .byte $80 + $03   ; print following tiles
- D 0 - I - 0x001B1A 00:9B0A: 9E        .byte $9E, $9E, $A0   ; 

- D 0 - I - 0x001B1D 00:9B0D: 06        .byte $06, $8B   ; 

- D 0 - I - 0x001B1F 00:9B0F: 81        .byte $80 + $01   ; print following tiles
- D 0 - I - 0x001B20 00:9B10: A6        .byte $A6   ; 

- D 0 - I - 0x001B21 00:9B11: 03        .byte $03, $8B   ; 

- D 0 - I - 0x001B23 00:9B13: 87        .byte $80 + $07   ; print following tiles
- D 0 - I - 0x001B24 00:9B14: A1        .byte $A1, $A7, $A5, $A2, $A3, $A5, $A6   ; 

- D 0 - I - 0x001B2B 00:9B1B: 07        .byte $07, $8B   ; 

- D 0 - I - 0x001B2D 00:9B1D: 8E        .byte $80 + $0E   ; print following tiles
- D 0 - I - 0x001B2E 00:9B1E: A1        .byte $A1, $A2, $A5, $A2, $A5, $A5, $A6, $A6, $8B, $A1, $A2, $A2, $A3, $A5   ; 

- D 0 - I - 0x001B3C 00:9B2C: 0D        .byte $0D, $8B   ; 

- D 0 - I - 0x001B3E 00:9B2E: 86        .byte $80 + $06   ; print following tiles
- D 0 - I - 0x001B3F 00:9B2F: 9D        .byte $9D, $8B, $8C, $8B, $9E, $A0   ; 

- D 0 - I - 0x001B45 00:9B35: 06        .byte $06, $8B   ; 

- D 0 - I - 0x001B47 00:9B37: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001B48 00:9B38: 9E        .byte $9E, $A0   ; 

- D 0 - I - 0x001B4A 00:9B3A: 07        .byte $07, $8B   ; 

- D 0 - I - 0x001B4C 00:9B3C: 84        .byte $80 + $04   ; print following tiles
- D 0 - I - 0x001B4D 00:9B3D: 9D        .byte $9D, $8B, $8C, $A0   ; 

- D 0 - I - 0x001B51 00:9B41: 05        .byte $05, $8B   ; 

- D 0 - I - 0x001B53 00:9B43: 88        .byte $80 + $08   ; print following tiles
- D 0 - I - 0x001B54 00:9B44: 9E        .byte $9E, $8B, $A1, $A2, $A2, $A3, $A5, $A6   ; 

- D 0 - I - 0x001B5C 00:9B4C: 03        .byte $03, $8B   ; 

- D 0 - I - 0x001B5E 00:9B4E: 88        .byte $80 + $08   ; print following tiles
- D 0 - I - 0x001B5F 00:9B4F: A1        .byte $A1, $A2, $A5, $A5, $A6, $8B, $9E, $A0   ; 

- D 0 - I - 0x001B67 00:9B57: 04        .byte $04, $8B   ; 

- D 0 - I - 0x001B69 00:9B59: 8B        .byte $80 + $0B   ; print following tiles
- D 0 - I - 0x001B6A 00:9B5A: A1        .byte $A1, $A2, $A5, $A6, $8B, $8B, $A1, $A2, $A3, $A5, $A5   ; 

- D 0 - I - 0x001B75 00:9B65: 0D        .byte $0D, $8B   ; 

- D 0 - I - 0x001B77 00:9B67: 86        .byte $80 + $06   ; print following tiles
- D 0 - I - 0x001B78 00:9B68: A1        .byte $A1, $A2, $A5, $A6, $8B, $8B   ; 

- D 0 - I - 0x001B7E 00:9B6E: 20        .byte $20, $8D   ; 
- D 0 - I - 0x001B80 00:9B70: 05        .byte $05, $8E   ; 

- D 0 - I - 0x001B82 00:9B72: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001B83 00:9B73: 8F        .byte $8F, $90   ; 

- D 0 - I - 0x001B85 00:9B75: 04        .byte $04, $8E   ; 

- D 0 - I - 0x001B87 00:9B77: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001B88 00:9B78: 8F        .byte $8F, $90   ; 

- D 0 - I - 0x001B8A 00:9B7A: 13        .byte $13, $8E   ; 

- D 0 - I - 0x001B8C 00:9B7C: 91        .byte $80 + $11   ; print following tiles
- D 0 - I - 0x001B8D 00:9B7D: 91        .byte $91, $92, $93, $92, $94, $8B, $95, $93, $92, $96, $94, $8B, $95, $93, $92, $96   ; 
- D 0 - I - 0x001B9D 00:9B8D: 91        .byte $91   ; 

- D 0 - I - 0x001B9E 00:9B8E: 06        .byte $06, $97   ; 

- D 0 - I - 0x001BA0 00:9B90: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001BA1 00:9B91: 92        .byte $92, $91   ; 

- D 0 - I - 0x001BA3 00:9B93: 06        .byte $06, $97   ; 

- D 0 - I - 0x001BA5 00:9B95: A0        .byte $80 + $20   ; print following tiles
- D 0 - I - 0x001BA6 00:9B96: 92        .byte $92, $00, $00, $A8, $A9, $00, $8B, $00, $A8, $A9, $00, $00, $8B, $00, $A8, $A9   ; 
- D 0 - I - 0x001BB6 00:9BA6: 00        .byte $00, $95, $98, $99, $9A, $99, $9B, $9C, $8B, $95, $98, $99, $9A, $99, $9B, $9C   ; 

- D 0 - I - 0x001BC6 00:9BB6: 03        .byte $03, $8B   ; 

- D 0 - I - 0x001BC8 00:9BB8: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001BC9 00:9BB9: 00        .byte $00, $00   ; 

- D 0 - I - 0x001BCB 00:9BBB: 03        .byte $03, $8B   ; 

- D 0 - I - 0x001BCD 00:9BBD: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001BCE 00:9BBE: 00        .byte $00, $00   ; 

- D 0 - I - 0x001BD0 00:9BC0: 04        .byte $04, $8B   ; 

- D 0 - I - 0x001BD2 00:9BC2: 87        .byte $80 + $07   ; print following tiles
- D 0 - I - 0x001BD3 00:9BC3: 00        .byte $00, $00, $8B, $00, $8B, $8B, $00   ; 

- D 0 - I - 0x001BDA 00:9BCA: 05        .byte $05, $8B   ; 

- D 0 - I - 0x001BDC 00:9BCC: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001BDD 00:9BCD: A8        .byte $A8, $A9   ; 

- D 0 - I - 0x001BDF 00:9BCF: 16        .byte $16, $8B   ; 

- D 0 - I - 0x001BE1 00:9BD1: 82        .byte $80 + $02   ; print following tiles
- D 0 - I - 0x001BE2 00:9BD2: 00        .byte $00, $00   ; 

- D 0 - I - 0x001BE4 00:9BD4: 7E        .byte $7E, $8B   ; 
- D 0 - I - 0x001BE6 00:9BD6: 7E        .byte $7E, $8B   ; 
- D 0 - I - 0x001BE8 00:9BD8: 7E        .byte $7E, $8B   ; 
- D 0 - I - 0x001BEA 00:9BDA: 53        .byte $53, $8B   ; 
- D 0 - I - 0x001BEC 00:9BDC: 04        .byte $04, $FA   ; 

- D 0 - I - 0x001BEE 00:9BDE: 8C        .byte $80 + $0C   ; print following tiles
- D 0 - I - 0x001BEF 00:9BDF: BA        .byte $BA, $FA, $FA, $BA, $EF, $FF, $FF, $AA, $EA, $FF, $BF, $AB   ; 

- D 0 - I - 0x001BFB 00:9BEB: 08        .byte $08, $5A   ; 
- D 0 - I - 0x001BFD 00:9BED: 08        .byte $08, $05   ; 
- D 0 - I - 0x001BFF 00:9BEF: 20        .byte $20, $00   ; 

- D 0 - I - 0x001C01 00:9BF1: FF        .byte $FF   ; end token











.out .sprintf("Free bytes in bank 20: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_20b"
    .byte con_prg_bank + $21   ; 
