.segment "BANK_22"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file



.export loc_0x00C0CE_спрайтовый_движок



; bzk this byte must be placed at 8000
    .byte con_prg_bank + $22   ; 



sub_8001_отображение_жизней_игроков:
C - - - - - 0x00C011 03:8001: A5 87     LDA ram_game_over_flag
C - - - - - 0x00C013 03:8003: F0 48     BEQ bra_804D_RTS
C - - - - - 0x00C015 03:8005: A4 20     LDY ram_колво_игроков
bra_8007_loop:
C - - - - - 0x00C017 03:8007: 84 02     STY ram_0002    ; player index
C - - - - - 0x00C019 03:8009: B9 CA 00  LDA ram_plr_game_over,Y
C - - - - - 0x00C01C 03:800C: A0 04     LDY #$04
C - - - - - 0x00C01E 03:800E: 05 1F     ORA ram_001F_flag
C - - - - - 0x00C020 03:8010: D0 0B     BNE bra_801D
C - - - - - 0x00C022 03:8012: A4 02     LDY ram_0002    ; player index
C - - - - - 0x00C024 03:8014: B9 53 00  LDA ram_жизни,Y
C - - - - - 0x00C027 03:8017: A0 00     LDY #$00
C - - - - - 0x00C029 03:8019: C9 04     CMP #$04
C - - - - - 0x00C02B 03:801B: 90 02     BCC bra_801F_not_overflow
bra_801D:
C - - - - - 0x00C02D 03:801D: A9 04     LDA #$04
bra_801F_not_overflow:
C - - - - - 0x00C02F 03:801F: 85 01     STA ram_0001
bra_8021_loop:
C - - - - - 0x00C031 03:8021: C6 01     DEC ram_0001
C - - - - - 0x00C033 03:8023: 30 23     BMI bra_8048
C - - - - - 0x00C035 03:8025: A9 10     LDA #$10
C - - - - - 0x00C037 03:8027: 9D 00 02  STA ram_spr_Y,X
C - - - - - 0x00C03A 03:802A: B9 4E 80  LDA tbl_804E_spr_T,Y
C - - - - - 0x00C03D 03:802D: 9D 01 02  STA ram_spr_T,X
C - - - - - 0x00C040 03:8030: A5 02     LDA ram_0002    ; player index
C - - - - - 0x00C042 03:8032: 9D 02 02  STA ram_spr_A,X
C - - - - - 0x00C045 03:8035: 4A        LSR
C - - - - - 0x00C046 03:8036: B9 56 80  LDA tbl_8056_spr_X,Y
C - - - - - 0x00C049 03:8039: 90 03     BCC bra_803E
C - - - - - 0x00C04B 03:803B: 69 AF     ADC #$AF
C - - - - - 0x00C04D 03:803D: 18        CLC
bra_803E:
C - - - - - 0x00C04E 03:803E: 9D 03 02  STA ram_spr_X,X
C - - - - - 0x00C051 03:8041: 8A        TXA
C - - - - - 0x00C052 03:8042: 69 C4     ADC #$C4
C - - - - - 0x00C054 03:8044: AA        TAX
C - - - - - 0x00C055 03:8045: C8        INY
C - - - - - 0x00C056 03:8046: D0 D9     BNE bra_8021_loop
bra_8048:
C - - - - - 0x00C058 03:8048: A4 02     LDY ram_0002    ; player index
C - - - - - 0x00C05A 03:804A: 88        DEY
C - - - - - 0x00C05B 03:804B: 10 BA     BPL bra_8007_loop
bra_804D_RTS:
C - - - - - 0x00C05D 03:804D: 60        RTS



tbl_804E_spr_T:
- D 0 - - - 0x00C05E 03:804E: 8D        .byte $8D   ; 00 
- D 0 - - - 0x00C05F 03:804F: 8D        .byte $8D   ; 01 
- D 0 - - - 0x00C060 03:8050: 8D        .byte $8D   ; 02 
- D 0 - - - 0x00C061 03:8051: 8D        .byte $8D   ; 03 
- D 0 - - - 0x00C062 03:8052: 83        .byte $83   ; 04 
- D 0 - - - 0x00C063 03:8053: 85        .byte $85   ; 05 
- D 0 - - - 0x00C064 03:8054: 87        .byte $87   ; 06 
- D 0 - - - 0x00C065 03:8055: 89        .byte $89   ; 07 



tbl_8056_spr_X:
- D 0 - - - 0x00C066 03:8056: 10        .byte $10   ; 00 
- D 0 - - - 0x00C067 03:8057: 1C        .byte $1C   ; 01 
- D 0 - - - 0x00C068 03:8058: 28        .byte $28   ; 02 
- D 0 - - - 0x00C069 03:8059: 34        .byte $34   ; 03 
- D 0 - - - 0x00C06A 03:805A: 10        .byte $10   ; 04 
- D 0 - - - 0x00C06B 03:805B: 1C        .byte $1C   ; 05 
- D 0 - - - 0x00C06C 03:805C: 28        .byte $28   ; 06 
- D 0 - - - 0x00C06D 03:805D: 34        .byte $34   ; 07 



sub_805E_обработчик_анимации_спрайтов_игроков:
C - - - - - 0x00C06E 03:805E: 0A        ASL
C - - - - - 0x00C06F 03:805F: A8        TAY
C - - - - - 0x00C070 03:8060: B9 2F 8F  LDA tbl_8F31_игроки_US - $02,Y
C - - - - - 0x00C073 03:8063: 85 08     STA ram_0008
C - - - - - 0x00C075 03:8065: B9 30 8F  LDA tbl_8F31_игроки_US - $02 + $01,Y
C - - - - - 0x00C078 03:8068: 85 09     STA ram_0009
C - - - - - 0x00C07A 03:806A: A0 00     LDY #$00
C - - - - - 0x00C07C 03:806C: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C07E 03:806E: 85 03     STA ram_0003    ; counter
C - - - - - 0x00C080 03:8070: C8        INY
bra_8071_loop:
C - - - - - 0x00C081 03:8071: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C083 03:8073: C9 80     CMP #$80
C - - - - - 0x00C085 03:8075: D0 12     BNE bra_8089_not_jump
; 80 jump control byte
C - - - - - 0x00C087 03:8077: C8        INY
C - - - - - 0x00C088 03:8078: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C08A 03:807A: 85 04     STA ram_0004
C - - - - - 0x00C08C 03:807C: C8        INY
C - - - - - 0x00C08D 03:807D: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C08F 03:807F: 85 09     STA ram_0009
C - - - - - 0x00C091 03:8081: A5 04     LDA ram_0004
C - - - - - 0x00C093 03:8083: 85 08     STA ram_0008
C - - - - - 0x00C095 03:8085: A0 00     LDY #$00
C - - - - - 0x00C097 03:8087: B1 08     LDA (ram_0008),Y
bra_8089_not_jump:
C - - - - - 0x00C099 03:8089: 18        CLC
C - - - - - 0x00C09A 03:808A: 65 01     ADC ram_0001
C - - - - - 0x00C09C 03:808C: 9D 00 02  STA ram_spr_Y,X
C - - - - - 0x00C09F 03:808F: C8        INY
C - - - - - 0x00C0A0 03:8090: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C0A2 03:8092: 9D 01 02  STA ram_spr_T,X
C - - - - - 0x00C0A5 03:8095: C8        INY
C - - - - - 0x00C0A6 03:8096: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C0A8 03:8098: 25 0B     AND ram_000B
C - - - - - 0x00C0AA 03:809A: 05 00     ORA ram_0000
C - - - - - 0x00C0AC 03:809C: 45 0A     EOR ram_000A
C - - - - - 0x00C0AE 03:809E: 9D 02 02  STA ram_spr_A,X
C - - - - - 0x00C0B1 03:80A1: C8        INY
C - - - - - 0x00C0B2 03:80A2: 24 0A     BIT ram_000A
C - - - - - 0x00C0B4 03:80A4: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C0B6 03:80A6: 50 05     BVC bra_80AD
C - - - - - 0x00C0B8 03:80A8: 49 FF     EOR #$FF
C - - - - - 0x00C0BA 03:80AA: 18        CLC
C - - - - - 0x00C0BB 03:80AB: 69 F9     ADC #$F9
bra_80AD:
C - - - - - 0x00C0BD 03:80AD: 18        CLC
C - - - - - 0x00C0BE 03:80AE: 65 02     ADC ram_0002
C - - - - - 0x00C0C0 03:80B0: 9D 03 02  STA ram_spr_X,X
C - - - - - 0x00C0C3 03:80B3: 8A        TXA
C - - - - - 0x00C0C4 03:80B4: 18        CLC
C - - - - - 0x00C0C5 03:80B5: 69 C4     ADC #$C4
C - - - - - 0x00C0C7 03:80B7: AA        TAX
C - - - - - 0x00C0C8 03:80B8: C8        INY
C - - - - - 0x00C0C9 03:80B9: C6 03     DEC ram_0003    ; counter
C - - - - - 0x00C0CB 03:80BB: D0 B4     BNE bra_8071_loop
C - - - - - 0x00C0CD 03:80BD: 60        RTS



loc_0x00C0CE_спрайтовый_движок:
C D 0 - - - 0x00C0CE 03:80BE: A5 24     LDA ram_начальный_индекс_спрайтов
C - - - - - 0x00C0D0 03:80C0: 18        CLC
C - - - - - 0x00C0D1 03:80C1: 69 4C     ADC #$4C
C - - - - - 0x00C0D3 03:80C3: 85 24     STA ram_начальный_индекс_спрайтов
C - - - - - 0x00C0D5 03:80C5: AA        TAX
C - - - - - 0x00C0D6 03:80C6: 38        SEC
C - - - - - 0x00C0D7 03:80C7: E9 C4     SBC #$C4
C - - - - - 0x00C0D9 03:80C9: A8        TAY
C - - - - - 0x00C0DA 03:80CA: 84 07     STY ram_0007
C - - - - - 0x00C0DC 03:80CC: A9 00     LDA #$00
C - - - - - 0x00C0DE 03:80CE: 99 01 02  STA ram_spr_T,Y
C - - - - - 0x00C0E1 03:80D1: 20 01 80  JSR sub_8001_отображение_жизней_игроков
; 1путин, опт
                                        LDY ram_колво_игроков
bra_80D0_loop:
                                        LDA ram_кадр_игрока,Y
                                        BEQ bra_8100_skip
C - - - - - 0x00C0E6 03:80D6: A4 D4     LDA ram_бессмертие_игрока,Y
C - - - - - 0x00C0E8 03:80D8: F0 02     BEQ bra_80DC
C - - - - - 0x00C0EA 03:80DA: A9 FC     LDA #$FC
                                        BNE bra_80DE    ; jmp
bra_80DC:
                                        LDA #$FF
bra_80DE:	
C - - - - - 0x00C0EC 03:80DC: 85 0B     STA ram_000B
C - - - - - 0x00C0EE 03:80DE: AD 66 05  LDA ram_атрибуты_спрайта_игрока,Y
C - - - - - 0x00C0F1 03:80E1: 29 03     AND #$03
C - - - - - 0x00C0F3 03:80E3: 85 00     STA ram_0000
C - - - - - 0x00C0F5 03:80E5: AD 66 05  LDA ram_атрибуты_спрайта_игрока,Y
C - - - - - 0x00C0F8 03:80E8: 29 E0     AND #$E0
C - - - - - 0x00C0FA 03:80EA: 85 0A     STA ram_000A
C - - - - - 0x00C0FC 03:80EC: AD 32 05  LDA ram_позиция_y_спрайта_игрока,Y
C - - - - - 0x00C0FF 03:80EF: 85 01     STA ram_0001
C - - - - - 0x00C101 03:80F1: AD 4C 05  LDA ram_позиция_x_спрайта_игрока,Y
C - - - - - 0x00C104 03:80F4: 85 02     STA ram_0002
C - - - - - 0x00C106 03:80F6: AD 18 05  LDA ram_кадр_игрока,Y
                                        STY ram_0005
C - - - - - 0x00C10B 03:80FB: 20 5E 80  JSR sub_805E_обработчик_анимации_спрайтов_игроков
                                        LDY ram_0005
bra_8100_skip:	
                                        DEY
                                        BPL bra_80D0_loop 
; 1путин: считывание игроков и врагов отдельно
; игроки                                    
C - - - - - 0x00C138 03:8128: A0 17     LDY #$07
bra_812A_loop:
                                        LDA ram_кадр_анимации,Y
                                        BEQ bra_8152_skip
C - - - - - 0x00C13A 03:812A: B9 4E 05  LDA ram_атрибуты_спрайта,Y
C - - - - - 0x00C13D 03:812D: 29 3F     AND #$3F
C - - - - - 0x00C13F 03:812F: 85 00     STA ram_0000
C - - - - - 0x00C141 03:8131: 4A        LSR
C - - - - - 0x00C142 03:8132: 4A        LSR
C - - - - - 0x00C143 03:8133: 85 0B     STA ram_000B
C - - - - - 0x00C145 03:8135: B9 4E 05  LDA ram_атрибуты_спрайта,Y
C - - - - - 0x00C148 03:8138: 29 C0     AND #$C0
C - - - - - 0x00C14A 03:813A: 85 0A     STA ram_000A
C - - - - - 0x00C14C 03:813C: B9 1A 05  LDA ram_позиция_y_спрайта,Y
C - - - - - 0x00C14F 03:813F: 85 01     STA ram_0001
C - - - - - 0x00C151 03:8141: B9 34 05  LDA ram_позиция_x_спрайта,Y
C - - - - - 0x00C154 03:8144: 85 02     STA ram_0002
C - - - - - 0x00C156 03:8146: B9 00 05  LDA ram_кадр_анимации,Y
C - - - - - 0x00C15B 03:814B: 84 05     STY ram_0005
C - - - - - 0x00C15D 03:814D: 20 6B 81  JSR sub_816B_обработчик_анимации_спрайтов_врагов
C - - - - - 0x00C160 03:8150: A4 05     LDY ram_0005
bra_8152_skip:
C - - - - - 0x00C162 03:8152: 88        DEY
C - - - - - 0x00C163 03:8153: 10 D5     BPL bra_812A_loop
; враги
                                        LDY #$0D
bra_8157_loop:
                                        LDA ram_кадр_анимации + $10,Y
                                        BEQ bra_815A_skip
                                        LDA ram_атрибуты_спрайта + $10,Y
                                        AND #$3F
                                        STA ram_0000
                                        LSR
                                        LSR
                                        STA ram_000B
                                        LDA ram_атрибуты_спрайта + $10,Y
                                        AND #$C0
                                        STA ram_000A
                                        LDA ram_позиция_y_спрайта + $10,Y
                                        STA ram_0001
                                        LDA ram_позиция_x_спрайта + $10,Y
                                        STA ram_0002
                                        LDA ram_кадр_анимации + $10,Y
                                        STY ram_0005
                                        JSR sub_816B_обработчик_анимации_спрайтов_врагов
                                        LDY ram_0005
bra_815A_skip:
                                        DEY
                                        BPL bra_8157_loop
C - - - - - 0x00C165 03:8155: A4 07     LDY ram_0007
C - - - - - 0x00C167 03:8157: B9 01 02  LDA ram_spr_T,Y
C - - - - - 0x00C16A 03:815A: D0 0E     BNE bra_816A_RTS
bra_815C_loop:
C - - - - - 0x00C16C 03:815C: A9 F4     LDA #$F4
C - - - - - 0x00C16E 03:815E: 9D 00 02  STA ram_spr_Y,X
C - - - - - 0x00C171 03:8161: 8A        TXA
C - - - - - 0x00C172 03:8162: 18        CLC
C - - - - - 0x00C173 03:8163: 69 C4     ADC #$C4
C - - - - - 0x00C175 03:8165: AA        TAX
C - - - - - 0x00C176 03:8166: E4 24     CPX ram_начальный_индекс_спрайтов
C - - - - - 0x00C178 03:8168: D0 F2     BNE bra_815C_loop
bra_816A_RTS:
C - - - - - 0x00C17A 03:816A: 60        RTS


sub_816B_обработчик_анимации_спрайтов_врагов:
C - - - - - 0x00C17B 03:816B: 0A        ASL
C - - - - - 0x00C17C 03:816C: A8        TAY
C - - - - - 0x00C17D 03:816D: 90 0A     BCC bra_8179
C - - - - - 0x00C17F 03:816F: B9 05 83  LDA tbl_8205_враги_US + $100,Y
C - - - - - 0x00C182 03:8172: 85 08     STA ram_0008
C - - - - - 0x00C184 03:8174: B9 06 83  LDA tbl_8205_враги_US + $100 + $01,Y
C - - - - - 0x00C187 03:8177: B0 08     BCS bra_8181    ; jmp
bra_8179:
C - - - - - 0x00C189 03:8179: B9 05 82  LDA tbl_8205_враги_US,Y
C - - - - - 0x00C18C 03:817C: 85 08     STA ram_0008
C - - - - - 0x00C18E 03:817E: B9 06 82  LDA tbl_8205_враги_US + $01,Y
bra_8181:
C - - - - - 0x00C191 03:8181: 85 09     STA ram_0009
C - - - - - 0x00C193 03:8183: A0 00     LDY #$00
C - - - - - 0x00C195 03:8185: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C197 03:8187: 30 5A     BMI bra_81E3_80_FF
C - - - - - 0x00C199 03:8189: A8        TAY
C - - - - - 0x00C19A 03:818A: D0 09     BNE bra_8195    ; jmp



bra_818C_loop:
C - - - - - 0x00C19C 03:818C: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C19E 03:818E: C9 80     CMP #$80
C - - - - - 0x00C1A0 03:8190: D0 03     BNE bra_8195
; 80
C - - - - - 0x00C1A2 03:8192: 85 0B     STA ram_000B
C - - - - - 0x00C1A4 03:8194: 88        DEY
bra_8195:
C - - - - - 0x00C1A5 03:8195: 24 0A     BIT ram_000A
C - - - - - 0x00C1A7 03:8197: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C1A9 03:8199: 50 05     BVC bra_81A0
C - - - - - 0x00C1AB 03:819B: 49 FF     EOR #$FF
C - - - - - 0x00C1AD 03:819D: 18        CLC
C - - - - - 0x00C1AE 03:819E: 69 F9     ADC #$F9
bra_81A0:
C - - - - - 0x00C1B0 03:81A0: 18        CLC
C - - - - - 0x00C1B1 03:81A1: 10 37     BPL bra_81DA
C - - - - - 0x00C1B3 03:81A3: 65 02     ADC ram_0002
C - - - - - 0x00C1B5 03:81A5: 90 37     BCC bra_81DE
bra_81A7:
C - - - - - 0x00C1B7 03:81A7: 9D 03 02  STA ram_spr_X,X
C - - - - - 0x00C1BA 03:81AA: 88        DEY
C - - - - - 0x00C1BB 03:81AB: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C1BD 03:81AD: 05 00     ORA ram_0000
C - - - - - 0x00C1BF 03:81AF: 45 0A     EOR ram_000A
C - - - - - 0x00C1C1 03:81B1: 9D 02 02  STA ram_spr_A,X
C - - - - - 0x00C1C4 03:81B4: 88        DEY
C - - - - - 0x00C1C5 03:81B5: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C1C7 03:81B7: 9D 01 02  STA ram_spr_T,X
C - - - - - 0x00C1CA 03:81BA: 88        DEY
C - - - - - 0x00C1CB 03:81BB: A5 0B     LDA ram_000B
C - - - - - 0x00C1CD 03:81BD: 4A        LSR
C - - - - - 0x00C1CE 03:81BE: B1 08     LDA (ram_0008),Y
C - - - - - 0x00C1D0 03:81C0: 10 10     BPL bra_81D2
C - - - - - 0x00C1D2 03:81C2: 65 01     ADC ram_0001
C - - - - - 0x00C1D4 03:81C4: 90 08     BCC bra_81CE
C - - - - - 0x00C1D6 03:81C6: 18        CLC
bra_81C7:
C - - - - - 0x00C1D7 03:81C7: 9D 00 02  STA ram_spr_Y,X
C - - - - - 0x00C1DA 03:81CA: 8A        TXA
C - - - - - 0x00C1DB 03:81CB: 69 C4     ADC #$C4
C - - - - - 0x00C1DD 03:81CD: AA        TAX
bra_81CE:
C - - - - - 0x00C1DE 03:81CE: 88        DEY
C - - - - - 0x00C1DF 03:81CF: D0 BB     BNE bra_818C_loop
bra_81D1_RTS:
C - - - - - 0x00C1E1 03:81D1: 60        RTS
bra_81D2:
C - - - - - 0x00C1E2 03:81D2: 65 01     ADC ram_0001
C - - - - - 0x00C1E4 03:81D4: 90 F1     BCC bra_81C7
C - - - - - 0x00C1E6 03:81D6: 88        DEY
C - - - - - 0x00C1E7 03:81D7: D0 B3     BNE bra_818C_loop
- - - - - - 0x00C1E9 03:81D9: 60        RTS
bra_81DA:
C - - - - - 0x00C1EA 03:81DA: 65 02     ADC ram_0002
C - - - - - 0x00C1EC 03:81DC: 90 C9     BCC bra_81A7
bra_81DE:
C - - - - - 0x00C1EE 03:81DE: 88        DEY
C - - - - - 0x00C1EF 03:81DF: 88        DEY
C - - - - - 0x00C1F0 03:81E0: 88        DEY
C - - - - - 0x00C1F1 03:81E1: D0 EB     BNE bra_81CE    ; jmp



bra_81E3_80_FF:
C - - - - - 0x00C1F3 03:81E3: C9 FF     CMP #$FF
C - - - - - 0x00C1F5 03:81E5: F0 EA     BEQ bra_81D1_RTS    ; FF
; 80-FE
C - - - - - 0x00C1F7 03:81E7: 38        SEC
C - - - - - 0x00C1F8 03:81E8: 2A        ROL
C - - - - - 0x00C1F9 03:81E9: 9D 01 02  STA ram_spr_T,X
C - - - - - 0x00C1FC 03:81EC: A5 00     LDA ram_0000
C - - - - - 0x00C1FE 03:81EE: 9D 02 02  STA ram_spr_A,X
C - - - - - 0x00C201 03:81F1: A5 01     LDA ram_0001
C - - - - - 0x00C203 03:81F3: E9 08     SBC #$08
C - - - - - 0x00C205 03:81F5: 9D 00 02  STA ram_spr_Y,X
C - - - - - 0x00C208 03:81F8: A5 02     LDA ram_0002
C - - - - - 0x00C20A 03:81FA: E9 04     SBC #$04
C - - - - - 0x00C20C 03:81FC: 9D 03 02  STA ram_spr_X,X
C - - - - - 0x00C20F 03:81FF: 8A        TXA
C - - - - - 0x00C210 03:8200: 18        CLC
C - - - - - 0x00C211 03:8201: 69 C4     ADC #$C4
C - - - - - 0x00C213 03:8203: AA        TAX
C - - - - - 0x00C214 03:8204: 60        RTS



tbl_8205_враги_US:
- - - - - - 0x00C215 03:8205: 05 84     .word _off028_8405_00
- D 0 - - - 0x00C217 03:8207: 05 84     .word _off028_8405_01
- D 0 - - - 0x00C219 03:8209: 06 84     .word _off028_8406_02
- D 0 - - - 0x00C21B 03:820B: 0F 84     .word _off028_840F_03
- D 0 - - - 0x00C21D 03:820D: 18 84     .word _off028_8418_04
- D 0 - - - 0x00C21F 03:820F: 19 84     .word _off028_8419_05
- D 0 - - - 0x00C221 03:8211: 1A 84     .word _off028_841A_06
- D 0 - - - 0x00C223 03:8213: 1B 84     .word _off028_841B_07
- D 0 - - - 0x00C225 03:8215: 28 84     .word _off028_8428_08
- D 0 - - - 0x00C227 03:8217: 35 84     .word _off028_8435_09
- D 0 - - - 0x00C229 03:8219: 42 84     .word _off028_8442_0A
- D 0 - - - 0x00C22B 03:821B: 4F 84     .word _off028_844F_0B
- D 0 - - - 0x00C22D 03:821D: 5C 84     .word _off028_845C_0C
- D 0 - - - 0x00C22F 03:821F: 69 84     .word _off028_8469_0D
- D 0 - - - 0x00C231 03:8221: 76 84     .word _off028_8476_0E
- D 0 - - - 0x00C233 03:8223: 83 84     .word _off028_8483_0F
- D 0 - - - 0x00C235 03:8225: 9C 84     .word _off028_849C_10
- D 0 - - - 0x00C237 03:8227: BD 84     .word _off028_84BD_11
- D 0 - - - 0x00C239 03:8229: D6 84     .word _off028_84D6_12
- D 0 - - - 0x00C23B 03:822B: EF 84     .word _off028_84EF_13
- D 0 - - - 0x00C23D 03:822D: 10 85     .word _off028_8510_14
- D 0 - - - 0x00C23F 03:822F: 31 85     .word _off028_8531_15
- D 0 - - - 0x00C241 03:8231: 32 85     .word _off028_8532_16
- D 0 - - - 0x00C243 03:8233: 33 85     .word _off028_8533_17
- D 0 - - - 0x00C245 03:8235: 38 85     .word _off028_8538_18
- D 0 - - - 0x00C247 03:8237: 3D 85     .word _off028_853D_19
- D 0 - - - 0x00C249 03:8239: 3E 85     .word _off028_853E_1A
- D 0 - - - 0x00C24B 03:823B: 57 85     .word _off028_8557_1B
- D 0 - - - 0x00C24D 03:823D: 68 85     .word _off028_8568_1C
- D 0 - - - 0x00C24F 03:823F: 75 85     .word _off028_8575_1D
- D 0 - - - 0x00C251 03:8241: 82 85     .word _off028_8582_1E
- D 0 - - - 0x00C253 03:8243: 93 85     .word _off028_8593_1F
- D 0 - - - 0x00C255 03:8245: A0 85     .word _off028_85A0_20
- D 0 - - - 0x00C257 03:8247: B1 85     .word _off028_85B1_21
- - - - - - 0x00C259 03:8249: BF 85     .word _off028_85BF_22
- D 0 - - - 0x00C25B 03:824B: D0 85     .word _off028_85D0_23
- D 0 - - - 0x00C25D 03:824D: E2 85     .word _off028_85E2_24
- D 0 - - - 0x00C25F 03:824F: F4 85     .word _off028_85F4_25
- D 0 - - - 0x00C261 03:8251: 06 86     .word _off028_8606_26
- D 0 - - - 0x00C263 03:8253: 17 86     .word _off028_8617_27
- D 0 - - - 0x00C265 03:8255: 2C 86     .word _off028_862C_28
- D 0 - - - 0x00C267 03:8257: 41 86     .word _off028_8641_29
- D 0 - - - 0x00C269 03:8259: 46 86     .word _off028_8646_2A
- D 0 - - - 0x00C26B 03:825B: 47 86     .word _off028_8647_2B
- D 0 - - - 0x00C26D 03:825D: 48 86     .word _off028_8648_2C
- D 0 - - - 0x00C26F 03:825F: 4D 86     .word _off028_864D_2D
- D 0 - - - 0x00C271 03:8261: 52 86     .word _off028_8652_2E
- D 0 - - - 0x00C273 03:8263: 57 86     .word _off028_8657_2F
- D 0 - - - 0x00C275 03:8265: 58 86     .word _off028_8658_30
- D 0 - - - 0x00C277 03:8267: 59 86     .word _off028_8659_31
- D 0 - - - 0x00C279 03:8269: 72 86     .word _off028_8672_32
- D 0 - - - 0x00C27B 03:826B: 87 86     .word _off028_8687_33
- D 0 - - - 0x00C27D 03:826D: 9C 86     .word _off028_869C_34
- D 0 - - - 0x00C27F 03:826F: B1 86     .word _off028_86B1_35
- D 0 - - - 0x00C281 03:8271: CA 86     .word _off028_86CA_36
- D 0 - - - 0x00C283 03:8273: E3 86     .word _off028_86E3_37
- D 0 - - - 0x00C285 03:8275: EC 86     .word _off028_86EC_38
- D 0 - - - 0x00C287 03:8277: F5 86     .word _off028_86F5_39
- D 0 - - - 0x00C289 03:8279: FE 86     .word _off028_86FE_3A
- - - - - - 0x00C28B 03:827B: FF 86     .word _off028_86FF_3B
- D 0 - - - 0x00C28D 03:827D: FF 86     .word _off028_86FF_3C
- D 0 - - - 0x00C28F 03:827F: 11 87     .word _off028_8711_3D
- D 0 - - - 0x00C291 03:8281: 23 87     .word _off028_8723_3E
- D 0 - - - 0x00C293 03:8283: 35 87     .word _off028_8735_3F
- D 0 - - - 0x00C295 03:8285: 47 87     .word _off028_8747_40
- D 0 - - - 0x00C297 03:8287: 55 87     .word _off028_8755_41
- D 0 - - - 0x00C299 03:8289: 67 87     .word _off028_8767_42
- D 0 - - - 0x00C29B 03:828B: 79 87     .word _off028_8779_43
- D 0 - - - 0x00C29D 03:828D: 87 87     .word _off028_8787_44
- D 0 - - - 0x00C29F 03:828F: 95 87     .word _off028_8795_45
- D 0 - - - 0x00C2A1 03:8291: A7 87     .word _off028_87A7_46
- D 0 - - - 0x00C2A3 03:8293: B5 87     .word _off028_87B5_47
- D 0 - - - 0x00C2A5 03:8295: C7 87     .word _off028_87C7_48
- D 0 - - - 0x00C2A7 03:8297: D5 87     .word _off028_87D5_49
- D 0 - - - 0x00C2A9 03:8299: E3 87     .word _off028_87E3_4A
- D 0 - - - 0x00C2AB 03:829B: F1 87     .word _off028_87F1_4B
- D 0 - - - 0x00C2AD 03:829D: 06 88     .word _off028_8806_4C
- D 0 - - - 0x00C2AF 03:829F: 1B 88     .word _off028_881B_4D
- D 0 - - - 0x00C2B1 03:82A1: 30 88     .word _off028_8830_4E
- D 0 - - - 0x00C2B3 03:82A3: 45 88     .word _off028_8845_4F
- D 0 - - - 0x00C2B5 03:82A5: 5A 88     .word _off028_885A_50
- D 0 - - - 0x00C2B7 03:82A7: 6F 88     .word _off028_886F_51
- D 0 - - - 0x00C2B9 03:82A9: 84 88     .word _off028_8884_52
- D 0 - - - 0x00C2BB 03:82AB: 99 88     .word _off028_8899_53
- D 0 - - - 0x00C2BD 03:82AD: AE 88     .word _off028_88AE_54
- D 0 - - - 0x00C2BF 03:82AF: B7 88     .word _off028_88B7_55
- D 0 - - - 0x00C2C1 03:82B1: D4 88     .word _off028_88D4_56
- D 0 - - - 0x00C2C3 03:82B3: F1 88     .word _off028_88F1_57
- D 0 - - - 0x00C2C5 03:82B5: 0E 89     .word _off028_890E_58
- D 0 - - - 0x00C2C7 03:82B7: 2B 89     .word _off028_892B_59
- D 0 - - - 0x00C2C9 03:82B9: 30 89     .word _off028_8930_5A
- D 0 - - - 0x00C2CB 03:82BB: 3D 89     .word _off028_893D_5B
- D 0 - - - 0x00C2CD 03:82BD: 46 89     .word _off028_8946_5C
- D 0 - - - 0x00C2CF 03:82BF: 4F 89     .word _off028_894F_5D
- D 0 - - - 0x00C2D1 03:82C1: 58 89     .word _off028_8958_5E
- D 0 - - - 0x00C2D3 03:82C3: 59 89     .word _off028_8959_5F
- D 0 - - - 0x00C2D5 03:82C5: 5E 89     .word _off028_895E_60
- D 0 - - - 0x00C2D7 03:82C7: 67 89     .word _off028_8967_61
- D 0 - - - 0x00C2D9 03:82C9: 70 89     .word _off028_8970_62
- D 0 - - - 0x00C2DB 03:82CB: 79 89     .word _off028_8979_63
- D 0 - - - 0x00C2DD 03:82CD: 7A 89     .word _off028_897A_64
- D 0 - - - 0x00C2DF 03:82CF: 87 89     .word _off028_8987_65
- D 0 - - - 0x00C2E1 03:82D1: 94 89     .word _off028_8994_66
- D 0 - - - 0x00C2E3 03:82D3: A5 89     .word _off028_89A5_67
- D 0 - - - 0x00C2E5 03:82D5: B2 89     .word _off028_89B2_68
- D 0 - - - 0x00C2E7 03:82D7: BF 89     .word _off028_89BF_69
- D 0 - - - 0x00C2E9 03:82D9: D0 89     .word _off028_89D0_6A
- D 0 - - - 0x00C2EB 03:82DB: DD 89     .word _off028_89DD_6B
- D 0 - - - 0x00C2ED 03:82DD: EE 89     .word _off028_89EE_6C
- D 0 - - - 0x00C2EF 03:82DF: 03 8A     .word _off028_8A03_6D
- D 0 - - - 0x00C2F1 03:82E1: 14 8A     .word _off028_8A14_6E
- D 0 - - - 0x00C2F3 03:82E3: 25 8A     .word _off028_8A25_6F
- D 0 - - - 0x00C2F5 03:82E5: 3E 8A     .word _off028_8A3E_70
- D 0 - - - 0x00C2F7 03:82E7: 57 8A     .word _off028_8A57_71
- D 0 - - - 0x00C2F9 03:82E9: 70 8A     .word _off028_8A70_72
- D 0 - - - 0x00C2FB 03:82EB: 89 8A     .word _off028_8A89_73
- D 0 - - - 0x00C2FD 03:82ED: 92 8A     .word _off028_8A92_74
- D 0 - - - 0x00C2FF 03:82EF: 9B 8A     .word _off028_8A9B_75
- D 0 - - - 0x00C301 03:82F1: A4 8A     .word _off028_8AA4_76
- D 0 - - - 0x00C303 03:82F3: AD 8A     .word _off028_8AAD_77
- D 0 - - - 0x00C305 03:82F5: B6 8A     .word _off028_8AB6_78
- D 0 - - - 0x00C307 03:82F7: C3 8A     .word _off028_8AC3_79
- D 0 - - - 0x00C309 03:82F9: D0 8A     .word _off028_8AD0_7A
- D 0 - - - 0x00C30B 03:82FB: E1 8A     .word _off028_8AE1_7B
- D 0 - - - 0x00C30D 03:82FD: F2 8A     .word _off028_8AF2_7C
- D 0 - - - 0x00C30F 03:82FF: 03 8B     .word _off028_8B03_7D
- D 0 - - - 0x00C311 03:8301: 14 8B     .word _off028_8B14_7E
- D 0 - - - 0x00C313 03:8303: 25 8B     .word _off028_8B25_7F
- D 0 - - - 0x00C315 03:8305: 36 8B     .word _off028_8B36_80
- D 0 - - - 0x00C317 03:8307: 43 8B     .word _off028_8B43_81
- D 0 - - - 0x00C319 03:8309: 50 8B     .word _off028_8B50_82
- D 0 - - - 0x00C31B 03:830B: 59 8B     .word _off028_8B59_83
- D 0 - - - 0x00C31D 03:830D: 62 8B     .word _off028_8B62_84
- D 0 - - - 0x00C31F 03:830F: 83 8B     .word _off028_8B83_85
- D 0 - - - 0x00C321 03:8311: A4 8B     .word _off028_8BA4_86
- D 0 - - - 0x00C323 03:8313: C5 8B     .word _off028_8BC5_87
- D 0 - - - 0x00C325 03:8315: E6 8B     .word _off028_8BE6_88
- D 0 - - - 0x00C327 03:8317: 07 8C     .word _off028_8C07_89
- D 0 - - - 0x00C329 03:8319: 28 8C     .word _off028_8C28_8A
- D 0 - - - 0x00C32B 03:831B: 49 8C     .word _off028_8C49_8B
- D 0 - - - 0x00C32D 03:831D: 6A 8C     .word _off028_8C6A_8C
- D 0 - - - 0x00C32F 03:831F: 8B 8C     .word _off028_8C8B_8D
- D 0 - - - 0x00C331 03:8321: AC 8C     .word _off028_8CAC_8E
- D 0 - - - 0x00C333 03:8323: C5 8C     .word _off028_8CC5_8F
- D 0 - - - 0x00C335 03:8325: C6 8C     .word _off028_8CC6_90
- D 0 - - - 0x00C337 03:8327: FF 8C     .word _off028_8CFF_91
- D 0 - - - 0x00C339 03:8329: 38 8D     .word _off028_8D38_92
- D 0 - - - 0x00C33B 03:832B: 39 8D     .word _off028_8D39_93
- D 0 - - - 0x00C33D 03:832D: 3A 8D     .word _off028_8D3A_94
- D 0 - - - 0x00C33F 03:832F: 3F 8D     .word _off028_8D3F_95
- D 0 - - - 0x00C341 03:8331: 44 8D     .word _off028_8D44_96
- D 0 - - - 0x00C343 03:8333: 49 8D     .word _off028_8D49_97
- D 0 - - - 0x00C345 03:8335: 4E 8D     .word _off028_8D4E_98
- D 0 - - - 0x00C347 03:8337: 57 8D     .word _off028_8D57_99
- D 0 - - - 0x00C349 03:8339: 60 8D     .word _off028_8D60_9A
- D 0 - - - 0x00C34B 03:833B: 69 8D     .word _off028_8D69_9B
- D 0 - - - 0x00C34D 03:833D: 72 8D     .word _off028_8D72_9C
- D 0 - - - 0x00C34F 03:833F: 77 8D     .word _off028_8D77_9D
- D 0 - - - 0x00C351 03:8341: 80 8D     .word _off028_8D80_9E
- D 0 - - - 0x00C353 03:8343: 8D 8D     .word _off028_8D8D_9F
- D 0 - - - 0x00C355 03:8345: 9A 8D     .word _off028_8D9A_A0
- D 0 - - - 0x00C357 03:8347: A7 8D     .word _off028_8DA7_A1
- D 0 - - - 0x00C359 03:8349: C8 8D     .word _off028_8DC8_A2
- D 0 - - - 0x00C35B 03:834B: E9 8D     .word _off028_8DE9_A3
- D 0 - - - 0x00C35D 03:834D: 0A 8E     .word _off028_8E0A_A4
- D 0 - - - 0x00C35F 03:834F: 2B 8E     .word _off028_8E2B_A5
- D 0 - - - 0x00C361 03:8351: 34 8E     .word _off028_8E34_A6
- D 0 - - - 0x00C363 03:8353: 3D 8E     .word _off028_8E3D_A7
- D 0 - - - 0x00C365 03:8355: 56 8E     .word _off028_8E56_A8
- D 0 - - - 0x00C367 03:8357: 5F 8E     .word _off028_8E5F_A9
- D 0 - - - 0x00C369 03:8359: 68 8E     .word _off028_8E68_AA
- D 0 - - - 0x00C36B 03:835B: 71 8E     .word _off028_8E71_AB
- D 0 - - - 0x00C36D 03:835D: 7A 8E     .word _off028_8E7A_AC
- D 0 - - - 0x00C36F 03:835F: 7B 8E     .word _off028_8E7B_AD
- D 0 - - - 0x00C371 03:8361: 7C 8E     .word _off028_8E7C_AE
- D 0 - - - 0x00C373 03:8363: 81 8E     .word _off028_8E81_AF
- D 0 - - - 0x00C375 03:8365: 86 8E     .word _off028_8E86_B0
- D 0 - - - 0x00C377 03:8367: 87 8E     .word _off028_8E87_B1
- D 0 - - - 0x00C379 03:8369: 88 8E     .word _off028_8E88_B2
- D 0 - - - 0x00C37B 03:836B: 8D 8E     .word _off028_8E8D_B3
- D 0 - - - 0x00C37D 03:836D: 92 8E     .word _off028_8E92_B4
- D 0 - - - 0x00C37F 03:836F: 9B 8E     .word _off028_8E9B_B5
- D 0 - - - 0x00C381 03:8371: A4 8E     .word _off028_8EA4_B6
- D 0 - - - 0x00C383 03:8373: AD 8E     .word _off028_8EAD_B7
- D 0 - - - 0x00C385 03:8375: B6 8E     .word _off028_8EB6_B8
- D 0 - - - 0x00C387 03:8377: E3 8E     .word _off028_8EE3_B9
- D 0 - - - 0x00C389 03:8379: E8 8E     .word _off028_8EE8_BA
- D 0 - - - 0x00C38B 03:837B: 0D 8F     .word _off028_8F0D_BB
- - - - - - 0x00C38D 03:837D: 2E 8F     .word _off028_8F2E_BC
- - - - - - 0x00C38F 03:837F: 2E 8F     .word _off028_8F2E_BD
- - - - - - 0x00C391 03:8381: 2E 8F     .word _off028_8F2E_BE
- - - - - - 0x00C393 03:8383: 2E 8F     .word _off028_8F2E_BF
- - - - - - 0x00C395 03:8385: 2E 8F     .word _off028_8F2E_C0
- - - - - - 0x00C397 03:8387: 2E 8F     .word _off028_8F2E_C1
- - - - - - 0x00C399 03:8389: 2E 8F     .word _off028_8F2E_C2
- - - - - - 0x00C39B 03:838B: 2E 8F     .word _off028_8F2E_C3
- - - - - - 0x00C39D 03:838D: 2E 8F     .word _off028_8F2E_C4
- - - - - - 0x00C39F 03:838F: 2E 8F     .word _off028_8F2E_C5
- - - - - - 0x00C3A1 03:8391: 2E 8F     .word _off028_8F2E_C6
- - - - - - 0x00C3A3 03:8393: 2E 8F     .word _off028_8F2E_C7
- - - - - - 0x00C3A5 03:8395: 2E 8F     .word _off028_8F2E_C8
- - - - - - 0x00C3A7 03:8397: 2E 8F     .word _off028_8F2E_C9
- - - - - - 0x00C3A9 03:8399: 2E 8F     .word _off028_8F2E_CA
- - - - - - 0x00C3AB 03:839B: 2E 8F     .word _off028_8F2E_CB
- - - - - - 0x00C3AD 03:839D: 2E 8F     .word _off028_8F2E_CC
- - - - - - 0x00C3AF 03:839F: 2E 8F     .word _off028_8F2E_CD
- - - - - - 0x00C3B1 03:83A1: 2E 8F     .word _off028_8F2E_CE
- - - - - - 0x00C3B3 03:83A3: 2E 8F     .word _off028_8F2E_CF
- - - - - - 0x00C3B5 03:83A5: 2E 8F     .word _off028_8F2E_D0
- - - - - - 0x00C3B7 03:83A7: 2E 8F     .word _off028_8F2E_D1
- - - - - - 0x00C3B9 03:83A9: 2E 8F     .word _off028_8F2E_D2
- - - - - - 0x00C3BB 03:83AB: 2E 8F     .word _off028_8F2E_D3
- - - - - - 0x00C3BD 03:83AD: 2E 8F     .word _off028_8F2E_D4
- - - - - - 0x00C3BF 03:83AF: 2E 8F     .word _off028_8F2E_D5
- - - - - - 0x00C3C1 03:83B1: 2E 8F     .word _off028_8F2E_D6
- - - - - - 0x00C3C3 03:83B3: 2E 8F     .word _off028_8F2E_D7
- - - - - - 0x00C3C5 03:83B5: 2E 8F     .word _off028_8F2E_D8
- - - - - - 0x00C3C7 03:83B7: 2E 8F     .word _off028_8F2E_D9
- - - - - - 0x00C3C9 03:83B9: 2E 8F     .word _off028_8F2E_DA
- - - - - - 0x00C3CB 03:83BB: 2E 8F     .word _off028_8F2E_DB
- - - - - - 0x00C3CD 03:83BD: 2E 8F     .word _off028_8F2E_DC
- - - - - - 0x00C3CF 03:83BF: 2E 8F     .word _off028_8F2E_DD
- - - - - - 0x00C3D1 03:83C1: 2E 8F     .word _off028_8F2E_DE
- - - - - - 0x00C3D3 03:83C3: 2E 8F     .word _off028_8F2E_DF
- - - - - - 0x00C3D5 03:83C5: 2E 8F     .word _off028_8F2E_E0
- - - - - - 0x00C3D7 03:83C7: 2E 8F     .word _off028_8F2E_E1
- - - - - - 0x00C3D9 03:83C9: 2E 8F     .word _off028_8F2E_E2
- - - - - - 0x00C3DB 03:83CB: 2E 8F     .word _off028_8F2E_E3
- - - - - - 0x00C3DD 03:83CD: 2E 8F     .word _off028_8F2E_E4
- - - - - - 0x00C3DF 03:83CF: 2E 8F     .word _off028_8F2E_E5
- - - - - - 0x00C3E1 03:83D1: 2E 8F     .word _off028_8F2E_E6
- - - - - - 0x00C3E3 03:83D3: 2E 8F     .word _off028_8F2E_E7
- - - - - - 0x00C3E5 03:83D5: 2E 8F     .word _off028_8F2E_E8
- - - - - - 0x00C3E7 03:83D7: 2E 8F     .word _off028_8F2E_E9
- - - - - - 0x00C3E9 03:83D9: 2E 8F     .word _off028_8F2E_EA
- - - - - - 0x00C3EB 03:83DB: 2E 8F     .word _off028_8F2E_EB
- - - - - - 0x00C3ED 03:83DD: 2E 8F     .word _off028_8F2E_EC
- - - - - - 0x00C3EF 03:83DF: 2E 8F     .word _off028_8F2E_ED
- - - - - - 0x00C3F1 03:83E1: 2E 8F     .word _off028_8F2E_EE
- - - - - - 0x00C3F3 03:83E3: 2E 8F     .word _off028_8F2E_EF
- - - - - - 0x00C3F5 03:83E5: 2E 8F     .word _off028_8F2E_F0
- - - - - - 0x00C3F7 03:83E7: 2E 8F     .word _off028_8F2E_F1
- - - - - - 0x00C3F9 03:83E9: 2E 8F     .word _off028_8F2E_F2
- - - - - - 0x00C3FB 03:83EB: 2E 8F     .word _off028_8F2E_F3
- - - - - - 0x00C3FD 03:83ED: 2E 8F     .word _off028_8F2E_F4
- - - - - - 0x00C3FF 03:83EF: 2E 8F     .word _off028_8F2E_F5
- - - - - - 0x00C401 03:83F1: 2E 8F     .word _off028_8F2E_F6
- - - - - - 0x00C403 03:83F3: 2E 8F     .word _off028_8F2E_F7
- - - - - - 0x00C405 03:83F5: 2E 8F     .word _off028_8F2E_F8
- - - - - - 0x00C407 03:83F7: 2E 8F     .word _off028_8F2E_F9
- - - - - - 0x00C409 03:83F9: 2E 8F     .word _off028_8F2E_FA
- - - - - - 0x00C40B 03:83FB: 2E 8F     .word _off028_8F2E_FB
- - - - - - 0x00C40D 03:83FD: 2E 8F     .word _off028_8F2E_FC
- - - - - - 0x00C40F 03:83FF: 2E 8F     .word _off028_8F2E_FD
- - - - - - 0x00C411 03:8401: 2E 8F     .word _off028_8F2E_FE
- - - - - - 0x00C413 03:8403: 2E 8F     .word _off028_8F2E_FF



_off028_8405_00:
_off028_8405_01:
- D 0 - I - 0x00C415 03:8405: FF        .byte $FF   ; end token



_off028_8406_02:
- D 0 - I - 0x00C416 03:8406: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C417 03:8407: F8        .byte $F8, $59, $00, $F8   ; 
- D 0 - I - 0x00C41B 03:840B: F8        .byte $F8, $59, $C0, $00   ; 
@end:



_off028_840F_03:
- D 0 - I - 0x00C41F 03:840F: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C420 03:8410: F8        .byte $F8, $7D, $00, $F8   ; 
- D 0 - I - 0x00C424 03:8414: F8        .byte $F8, $7D, $C0, $00   ; 
@end:



_off028_8418_04:
- D 0 - I - 0x00C428 03:8418: C7        .byte $C7   ; 



_off028_8419_05:
- D 0 - I - 0x00C429 03:8419: 80        .byte $80   ; 



_off028_841A_06:
- D 0 - I - 0x00C42A 03:841A: D1        .byte $D1   ; 



_off028_841B_07:
- D 0 - I - 0x00C42B 03:841B: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C42C 03:841C: F8        .byte $F8, $55, $00, $F4   ; 
- D 0 - I - 0x00C430 03:8420: F8        .byte $F8, $57, $00, $FC   ; 
- D 0 - I - 0x00C434 03:8424: F8        .byte $F8, $55, $40, $04   ; 
@end:



_off028_8428_08:
- D 0 - I - 0x00C438 03:8428: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C439 03:8429: F8        .byte $F8, $93, $00, $FC   ; 
- D 0 - I - 0x00C43D 03:842D: F8        .byte $F8, $91, $00, $F4   ; 
- D 0 - I - 0x00C441 03:8431: F8        .byte $F8, $91, $40, $04   ; 
@end:



_off028_8435_09:
- D 0 - I - 0x00C445 03:8435: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C446 03:8436: F8        .byte $F8, $95, $00, $FC   ; 
- D 0 - I - 0x00C44A 03:843A: F8        .byte $F8, $91, $00, $F4   ; 
- D 0 - I - 0x00C44E 03:843E: F8        .byte $F8, $91, $40, $04   ; 
@end:



_off028_8442_0A:
- D 0 - I - 0x00C452 03:8442: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C453 03:8443: F8        .byte $F8, $97, $00, $FC   ; 
- D 0 - I - 0x00C457 03:8447: F8        .byte $F8, $91, $00, $F4   ; 
- D 0 - I - 0x00C45B 03:844B: F8        .byte $F8, $91, $40, $04   ; 
@end:



_off028_844F_0B:
- D 0 - I - 0x00C45F 03:844F: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C460 03:8450: F8        .byte $F8, $99, $00, $FC   ; 
- D 0 - I - 0x00C464 03:8454: F8        .byte $F8, $91, $00, $F4   ; 
- D 0 - I - 0x00C468 03:8458: F8        .byte $F8, $91, $40, $04   ; 
@end:



_off028_845C_0C:
- D 0 - I - 0x00C46C 03:845C: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C46D 03:845D: F8        .byte $F8, $9B, $00, $FC   ; 
- D 0 - I - 0x00C471 03:8461: F8        .byte $F8, $91, $00, $F4   ; 
- D 0 - I - 0x00C475 03:8465: F8        .byte $F8, $91, $40, $04   ; 
@end:



_off028_8469_0D:
- D 0 - I - 0x00C479 03:8469: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C47A 03:846A: F8        .byte $F8, $9D, $00, $FC   ; 
- D 0 - I - 0x00C47E 03:846E: F8        .byte $F8, $91, $00, $F4   ; 
- D 0 - I - 0x00C482 03:8472: F8        .byte $F8, $91, $40, $04   ; 
@end:



_off028_8476_0E:
- D 0 - I - 0x00C486 03:8476: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C487 03:8477: F8        .byte $F8, $9F, $00, $FC   ; 
- D 0 - I - 0x00C48B 03:847B: F8        .byte $F8, $91, $00, $F4   ; 
- D 0 - I - 0x00C48F 03:847F: F8        .byte $F8, $91, $40, $04   ; 
@end:



_off028_8483_0F:
- D 0 - I - 0x00C493 03:8483: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C494 03:8484: F4        .byte $F4, $5D, $00, $F0   ; 
- D 0 - I - 0x00C498 03:8488: F0        .byte $F0, $5F, $00, $F8   ; 
- D 0 - I - 0x00C49C 03:848C: F0        .byte $F0, $61, $C0, $00   ; 
- D 0 - I - 0x00C4A0 03:8490: 00        .byte $00, $61, $00, $F8   ; 
- D 0 - I - 0x00C4A4 03:8494: 00        .byte $00, $5F, $C0, $00   ; 
- D 0 - I - 0x00C4A8 03:8498: FC        .byte $FC, $5D, $C0, $08   ; 
@end:



_off028_849C_10:
- D 0 - I - 0x00C4AC 03:849C: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C4AD 03:849D: F0        .byte $F0, $63, $00, $F0   ; 
- D 0 - I - 0x00C4B1 03:84A1: F0        .byte $F0, $65, $00, $F8   ; 
- D 0 - I - 0x00C4B5 03:84A5: F0        .byte $F0, $69, $C0, $00   ; 
- D 0 - I - 0x00C4B9 03:84A9: F0        .byte $F0, $67, $C0, $08   ; 
- D 0 - I - 0x00C4BD 03:84AD: 00        .byte $00, $67, $00, $F0   ; 
- D 0 - I - 0x00C4C1 03:84B1: 00        .byte $00, $69, $00, $F8   ; 
- D 0 - I - 0x00C4C5 03:84B5: 00        .byte $00, $65, $C0, $00   ; 
- D 0 - I - 0x00C4C9 03:84B9: 00        .byte $00, $63, $C0, $08   ; 
@end:



_off028_84BD_11:
- D 0 - I - 0x00C4CD 03:84BD: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C4CE 03:84BE: F8        .byte $F8, $6B, $00, $F0   ; 
- D 0 - I - 0x00C4D2 03:84C2: F0        .byte $F0, $6D, $00, $F8   ; 
- D 0 - I - 0x00C4D6 03:84C6: F0        .byte $F0, $6B, $C0, $00   ; 
- D 0 - I - 0x00C4DA 03:84CA: F8        .byte $F8, $6D, $40, $08   ; 
- D 0 - I - 0x00C4DE 03:84CE: 00        .byte $00, $6B, $00, $F8   ; 
- D 0 - I - 0x00C4E2 03:84D2: 00        .byte $00, $6D, $C0, $08   ; 
@end:



_off028_84D6_12:
- D 0 - I - 0x00C4E6 03:84D6: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C4E7 03:84D7: F0        .byte $F0, $7F, $00, $F4   ; 
- D 0 - I - 0x00C4EB 03:84DB: F0        .byte $F0, $81, $00, $FC   ; 
- D 0 - I - 0x00C4EF 03:84DF: F0        .byte $F0, $7F, $40, $04   ; 
- D 0 - I - 0x00C4F3 03:84E3: 00        .byte $00, $7F, $80, $F4   ; 
- D 0 - I - 0x00C4F7 03:84E7: 00        .byte $00, $81, $C0, $FC   ; 
- D 0 - I - 0x00C4FB 03:84EB: 00        .byte $00, $7F, $C0, $04   ; 
@end:



_off028_84EF_13:
- D 0 - I - 0x00C4FF 03:84EF: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C500 03:84F0: F0        .byte $F0, $71, $00, $F0   ; 
- D 0 - I - 0x00C504 03:84F4: F0        .byte $F0, $73, $00, $F8   ; 
- D 0 - I - 0x00C508 03:84F8: F0        .byte $F0, $73, $40, $00   ; 
- D 0 - I - 0x00C50C 03:84FC: F0        .byte $F0, $71, $40, $08   ; 
- D 0 - I - 0x00C510 03:8500: 00        .byte $00, $71, $80, $F0   ; 
- D 0 - I - 0x00C514 03:8504: 00        .byte $00, $73, $80, $F8   ; 
- D 0 - I - 0x00C518 03:8508: 00        .byte $00, $73, $C0, $00   ; 
- D 0 - I - 0x00C51C 03:850C: 00        .byte $00, $71, $C0, $08   ; 
@end:



_off028_8510_14:
- D 0 - I - 0x00C520 03:8510: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C521 03:8511: F0        .byte $F0, $75, $00, $F0   ; 
- D 0 - I - 0x00C525 03:8515: F0        .byte $F0, $77, $00, $F8   ; 
- D 0 - I - 0x00C529 03:8519: F0        .byte $F0, $77, $40, $00   ; 
- D 0 - I - 0x00C52D 03:851D: F0        .byte $F0, $75, $40, $08   ; 
- D 0 - I - 0x00C531 03:8521: 00        .byte $00, $75, $80, $F0   ; 
- D 0 - I - 0x00C535 03:8525: 00        .byte $00, $77, $80, $F8   ; 
- D 0 - I - 0x00C539 03:8529: 00        .byte $00, $77, $C0, $00   ; 
- D 0 - I - 0x00C53D 03:852D: 00        .byte $00, $75, $C0, $08   ; 
@end:



_off028_8531_15:
- D 0 - I - 0x00C541 03:8531: C5        .byte $C5   ; 



_off028_8532_16:
- D 0 - I - 0x00C542 03:8532: BC        .byte $BC   ; 



_off028_8533_17:
- D 0 - I - 0x00C543 03:8533: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C544 03:8534: F8        .byte $F8, $7B, $00, $FC   ; 
@end:



_off028_8538_18:
- D 0 - I - 0x00C548 03:8538: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C549 03:8539: F8        .byte $F8, $7B, $80, $FC   ; 
@end:



_off028_853D_19:
- D 0 - I - 0x00C54D 03:853D: D0        .byte $D0   ; 



_off028_853E_1A:
- D 0 - I - 0x00C54E 03:853E: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C54F 03:853F: F0        .byte $F0, $7F, $00, $F4   ; 
- D 0 - I - 0x00C553 03:8543: F0        .byte $F0, $81, $00, $FC   ; 
- D 0 - I - 0x00C557 03:8547: F0        .byte $F0, $7F, $40, $04   ; 
- D 0 - I - 0x00C55B 03:854B: 00        .byte $00, $7F, $80, $F4   ; 
- D 0 - I - 0x00C55F 03:854F: 00        .byte $00, $81, $C0, $FC   ; 
- D 0 - I - 0x00C563 03:8553: 00        .byte $00, $7F, $C0, $04   ; 
@end:



_off028_8557_1B:
- D 0 - I - 0x00C567 03:8557: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C568 03:8558: F0        .byte $F0, $A9, $00, $F8   ; 
- D 0 - I - 0x00C56C 03:855C: EE        .byte $EE, $AB, $00, $00   ; 
- D 0 - I - 0x00C570 03:8560: 00        .byte $00, $AD, $00, $F4   ; 
- D 0 - I - 0x00C574 03:8564: FE        .byte $FE, $AF, $00, $FC   ; 
@end:



_off028_8568_1C:
- D 0 - I - 0x00C578 03:8568: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C579 03:8569: F1        .byte $F1, $B1, $00, $FC   ; 
- D 0 - I - 0x00C57D 03:856D: F8        .byte $F8, $B3, $00, $F5   ; 
- D 0 - I - 0x00C581 03:8571: 01        .byte $01, $B5, $00, $FD   ; 
@end:



_off028_8575_1D:
- D 0 - I - 0x00C585 03:8575: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C586 03:8576: F0        .byte $F0, $B9, $00, $FF   ; 
- D 0 - I - 0x00C58A 03:857A: F0        .byte $F0, $B7, $00, $F7   ; 
- D 0 - I - 0x00C58E 03:857E: 00        .byte $00, $BB, $00, $FA   ; 
@end:



_off028_8582_1E:
- D 0 - I - 0x00C592 03:8582: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C593 03:8583: F0        .byte $F0, $B9, $00, $FF   ; 
- D 0 - I - 0x00C597 03:8587: F0        .byte $F0, $B7, $00, $F7   ; 
- D 0 - I - 0x00C59B 03:858B: 00        .byte $00, $AD, $00, $F4   ; 
- D 0 - I - 0x00C59F 03:858F: FE        .byte $FE, $AF, $00, $FC   ; 
@end:



_off028_8593_1F:
- D 0 - I - 0x00C5A3 03:8593: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C5A4 03:8594: F0        .byte $F0, $A9, $00, $F8   ; 
- D 0 - I - 0x00C5A8 03:8598: EE        .byte $EE, $AB, $00, $00   ; 
- D 0 - I - 0x00C5AC 03:859C: 00        .byte $00, $BB, $00, $FA   ; 
@end:



_off028_85A0_20:
- D 0 - I - 0x00C5B0 03:85A0: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C5B1 03:85A1: EE        .byte $EE, $BD, $00, $F8   ; 
- D 0 - I - 0x00C5B5 03:85A5: EE        .byte $EE, $BF, $00, $00   ; 
- D 0 - I - 0x00C5B9 03:85A9: FE        .byte $FE, $C1, $00, $F6   ; 
- D 0 - I - 0x00C5BD 03:85AD: FE        .byte $FE, $C3, $00, $FE   ; 
@end:



_off028_85B1_21:
- D 0 - I - 0x00C5C1 03:85B1: 0D        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C5C2 03:85B2: 00        .byte $00, $BB, $00, $FA   ; 
- D 0 - I - 0x00C5C6 03:85B6: 80        .byte $80   ; 80
- D 0 - I - 0x00C5C7 03:85B7: F0        .byte $F0, $C7, $00, $00   ; 
- D 0 - I - 0x00C5CB 03:85BB: F0        .byte $F0, $C5, $00, $F8   ; 
@end:



_off028_85BF_22:
- - - - - - 0x00C5CF 03:85BF: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- - - - - - 0x00C5D0 03:85C0: 00        .byte $00, $DD, $00, $F0   ; 
- - - - - - 0x00C5D4 03:85C4: 00        .byte $00, $D7, $00, $F8   ; 
- - - - - - 0x00C5D8 03:85C8: 00        .byte $00, $D9, $00, $00   ; 
- - - - - - 0x00C5DC 03:85CC: 00        .byte $00, $DB, $00, $08   ; 
@end:



_off028_85D0_23:
- D 0 - I - 0x00C5E0 03:85D0: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C5E1 03:85D1: 00        .byte $00, $D3, $00, $F7   ; 
- D 0 - I - 0x00C5E5 03:85D5: 00        .byte $00, $D5, $00, $FF   ; 
- D 0 - I - 0x00C5E9 03:85D9: 80        .byte $80   ; 80
- D 0 - I - 0x00C5EA 03:85DA: F0        .byte $F0, $CB, $00, $00   ; 
- D 0 - I - 0x00C5EE 03:85DE: F0        .byte $F0, $C9, $00, $F8   ; 
@end:



_off028_85E2_24:
- D 0 - I - 0x00C5F2 03:85E2: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C5F3 03:85E3: 00        .byte $00, $D3, $00, $F7   ; 
- D 0 - I - 0x00C5F7 03:85E7: 00        .byte $00, $D5, $00, $FF   ; 
- D 0 - I - 0x00C5FB 03:85EB: 80        .byte $80   ; 80
- D 0 - I - 0x00C5FC 03:85EC: F0        .byte $F0, $C7, $00, $00   ; 
- D 0 - I - 0x00C600 03:85F0: F0        .byte $F0, $CD, $00, $F8   ; 
@end:



_off028_85F4_25:
- D 0 - I - 0x00C604 03:85F4: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C605 03:85F5: 00        .byte $00, $D3, $00, $F7   ; 
- D 0 - I - 0x00C609 03:85F9: 00        .byte $00, $D5, $00, $FF   ; 
- D 0 - I - 0x00C60D 03:85FD: 80        .byte $80   ; 80
- D 0 - I - 0x00C60E 03:85FE: F2        .byte $F2, $D1, $00, $00   ; 
- D 0 - I - 0x00C612 03:8602: F0        .byte $F0, $CF, $00, $F8   ; 
@end:



_off028_8606_26:
- D 0 - I - 0x00C616 03:8606: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C617 03:8607: 00        .byte $00, $DD, $00, $F0   ; 
- D 0 - I - 0x00C61B 03:860B: 00        .byte $00, $DF, $00, $F8   ; 
- D 0 - I - 0x00C61F 03:860F: FF        .byte $FF, $E1, $00, $00   ; 
- D 0 - I - 0x00C623 03:8613: 00        .byte $00, $E3, $00, $08   ; 
@end:



_off028_8617_27:
- D 0 - I - 0x00C627 03:8617: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C628 03:8618: F0        .byte $F0, $E9, $00, $F6   ; 
- D 0 - I - 0x00C62C 03:861C: F0        .byte $F0, $EB, $00, $FE   ; 
- D 0 - I - 0x00C630 03:8620: F1        .byte $F1, $ED, $00, $06   ; 
- D 0 - I - 0x00C634 03:8624: 00        .byte $00, $D3, $00, $F7   ; 
- D 0 - I - 0x00C638 03:8628: 00        .byte $00, $D5, $00, $FF   ; 
@end:



_off028_862C_28:
- D 0 - I - 0x00C63C 03:862C: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C63D 03:862D: E0        .byte $E0, $EF, $00, $FB   ; 
- D 0 - I - 0x00C641 03:8631: F0        .byte $F0, $F1, $00, $F6   ; 
- D 0 - I - 0x00C645 03:8635: F0        .byte $F0, $F3, $00, $FE   ; 
- D 0 - I - 0x00C649 03:8639: 00        .byte $00, $D3, $00, $F7   ; 
- D 0 - I - 0x00C64D 03:863D: 00        .byte $00, $D5, $00, $FF   ; 
@end:



_off028_8641_29:
- D 0 - I - 0x00C651 03:8641: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C652 03:8642: F8        .byte $F8, $F5, $00, $FB   ; 
@end:



_off028_8646_2A:
- D 0 - I - 0x00C656 03:8646: FB        .byte $FB   ; 



_off028_8647_2B:
- D 0 - I - 0x00C657 03:8647: FC        .byte $FC   ; 



_off028_8648_2C:
- D 0 - I - 0x00C658 03:8648: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C659 03:8649: F8        .byte $F8, $F7, $C0, $FC   ; 
@end:



_off028_864D_2D:
- D 0 - I - 0x00C65D 03:864D: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C65E 03:864E: F8        .byte $F8, $F5, $C0, $FD   ; 
@end:



_off028_8652_2E:
- D 0 - I - 0x00C662 03:8652: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C663 03:8653: F8        .byte $F8, $F7, $C0, $FC   ; 
@end:



_off028_8657_2F:
- D 0 - I - 0x00C667 03:8657: FC        .byte $FC   ; 



_off028_8658_30:
- D 0 - I - 0x00C668 03:8658: FB        .byte $FB   ; 



_off028_8659_31:
- D 0 - I - 0x00C669 03:8659: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C66A 03:865A: F0        .byte $F0, $A9, $03, $F9   ; 
- D 0 - I - 0x00C66E 03:865E: EF        .byte $EF, $AB, $03, $FE   ; 
- D 0 - I - 0x00C672 03:8662: EF        .byte $EF, $AD, $03, $06   ; 
- D 0 - I - 0x00C676 03:8666: 02        .byte $02, $AF, $03, $F0   ; 
- D 0 - I - 0x00C67A 03:866A: 00        .byte $00, $B1, $03, $F8   ; 
- D 0 - I - 0x00C67E 03:866E: FF        .byte $FF, $B3, $03, $00   ; 
@end:



_off028_8672_32:
- D 0 - I - 0x00C682 03:8672: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C683 03:8673: EF        .byte $EF, $B5, $03, $FA   ; 
- D 0 - I - 0x00C687 03:8677: EF        .byte $EF, $B7, $03, $02   ; 
- D 0 - I - 0x00C68B 03:867B: FF        .byte $FF, $B9, $03, $F4   ; 
- D 0 - I - 0x00C68F 03:867F: FF        .byte $FF, $BB, $03, $FC   ; 
- D 0 - I - 0x00C693 03:8683: FF        .byte $FF, $BD, $03, $04   ; 
@end:



_off028_8687_33:
- D 0 - I - 0x00C697 03:8687: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C698 03:8688: F0        .byte $F0, $BF, $03, $F9   ; 
- D 0 - I - 0x00C69C 03:868C: F0        .byte $F0, $C1, $03, $01   ; 
- D 0 - I - 0x00C6A0 03:8690: 04        .byte $04, $C3, $03, $EE   ; 
- D 0 - I - 0x00C6A4 03:8694: 00        .byte $00, $C5, $03, $F4   ; 
- D 0 - I - 0x00C6A8 03:8698: 00        .byte $00, $C7, $03, $FC   ; 
@end:



_off028_869C_34:
- D 0 - I - 0x00C6AC 03:869C: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C6AD 03:869D: F0        .byte $F0, $BF, $03, $F9   ; 
- D 0 - I - 0x00C6B1 03:86A1: F0        .byte $F0, $C1, $03, $01   ; 
- D 0 - I - 0x00C6B5 03:86A5: 02        .byte $02, $C3, $03, $EF   ; 
- D 0 - I - 0x00C6B9 03:86A9: 00        .byte $00, $C9, $03, $F7   ; 
- D 0 - I - 0x00C6BD 03:86AD: 00        .byte $00, $CB, $03, $FF   ; 
@end:



_off028_86B1_35:
- D 0 - I - 0x00C6C1 03:86B1: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C6C2 03:86B2: F0        .byte $F0, $A9, $03, $F9   ; 
- D 0 - I - 0x00C6C6 03:86B6: EF        .byte $EF, $AB, $03, $FE   ; 
- D 0 - I - 0x00C6CA 03:86BA: EF        .byte $EF, $AD, $03, $06   ; 
- D 0 - I - 0x00C6CE 03:86BE: 04        .byte $04, $C3, $03, $EF   ; 
- D 0 - I - 0x00C6D2 03:86C2: 00        .byte $00, $C5, $03, $F5   ; 
- D 0 - I - 0x00C6D6 03:86C6: 00        .byte $00, $CD, $03, $FD   ; 
@end:



_off028_86CA_36:
- D 0 - I - 0x00C6DA 03:86CA: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C6DB 03:86CB: F0        .byte $F0, $CF, $03, $F9   ; 
- D 0 - I - 0x00C6DF 03:86CF: ED        .byte $ED, $D1, $03, $FE   ; 
- D 0 - I - 0x00C6E3 03:86D3: EB        .byte $EB, $D3, $03, $06   ; 
- D 0 - I - 0x00C6E7 03:86D7: 02        .byte $02, $AF, $03, $F0   ; 
- D 0 - I - 0x00C6EB 03:86DB: 00        .byte $00, $B1, $03, $F8   ; 
- D 0 - I - 0x00C6EF 03:86DF: FF        .byte $FF, $B3, $03, $00   ; 
@end:



_off028_86E3_37:
- D 0 - I - 0x00C6F3 03:86E3: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C6F4 03:86E4: F0        .byte $F0, $D9, $00, $F8   ; 
- D 0 - I - 0x00C6F8 03:86E8: F0        .byte $F0, $DB, $00, $00   ; 
@end:



_off028_86EC_38:
- D 0 - I - 0x00C6FC 03:86EC: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C6FD 03:86ED: F1        .byte $F1, $E9, $00, $F8   ; 
- D 0 - I - 0x00C701 03:86F1: F1        .byte $F1, $EB, $00, $00   ; 
@end:



_off028_86F5_39:
- D 0 - I - 0x00C705 03:86F5: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C706 03:86F6: F0        .byte $F0, $ED, $00, $F8   ; 
- D 0 - I - 0x00C70A 03:86FA: F0        .byte $F0, $EF, $00, $00   ; 
@end:



_off028_86FE_3A:
- D 0 - I - 0x00C70E 03:86FE: F8        .byte $F8   ; 



_off028_86FF_3B:
_off028_86FF_3C:
- D 0 - I - 0x00C70F 03:86FF: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C710 03:8700: 03        .byte $03, $07, $01, $F7   ; 
- D 0 - I - 0x00C714 03:8704: 00        .byte $00, $09, $01, $FF   ; 
- D 0 - I - 0x00C718 03:8708: 80        .byte $80   ; 80
- D 0 - I - 0x00C719 03:8709: F3        .byte $F3, $AB, $01, $F9   ; 
- D 0 - I - 0x00C71D 03:870D: F0        .byte $F0, $AD, $01, $FF   ; 
@end:



_off028_8711_3D:
- D 0 - I - 0x00C721 03:8711: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C722 03:8712: 04        .byte $04, $0B, $01, $F7   ; 
- D 0 - I - 0x00C726 03:8716: 01        .byte $01, $0D, $01, $FF   ; 
- D 0 - I - 0x00C72A 03:871A: 80        .byte $80   ; 80
- D 0 - I - 0x00C72B 03:871B: F4        .byte $F4, $AB, $01, $F9   ; 
- D 0 - I - 0x00C72F 03:871F: F1        .byte $F1, $AD, $01, $FF   ; 
@end:



_off028_8723_3E:
- D 0 - I - 0x00C733 03:8723: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C734 03:8724: 03        .byte $03, $0F, $01, $F7   ; 
- D 0 - I - 0x00C738 03:8728: 00        .byte $00, $11, $01, $FF   ; 
- D 0 - I - 0x00C73C 03:872C: 80        .byte $80   ; 80
- D 0 - I - 0x00C73D 03:872D: F3        .byte $F3, $AB, $01, $F9   ; 
- D 0 - I - 0x00C741 03:8731: F0        .byte $F0, $AD, $01, $FF   ; 
@end:



_off028_8735_3F:
- D 0 - I - 0x00C745 03:8735: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C746 03:8736: 02        .byte $02, $17, $01, $F7   ; 
- D 0 - I - 0x00C74A 03:873A: 01        .byte $01, $19, $01, $FF   ; 
- D 0 - I - 0x00C74E 03:873E: 80        .byte $80   ; 80
- D 0 - I - 0x00C74F 03:873F: F2        .byte $F2, $AF, $01, $F7   ; 
- D 0 - I - 0x00C753 03:8743: F1        .byte $F1, $B1, $01, $FF   ; 
@end:



_off028_8747_40:
- D 0 - I - 0x00C757 03:8747: 0D        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C758 03:8748: 02        .byte $02, $1B, $01, $FD   ; 
- D 0 - I - 0x00C75C 03:874C: 80        .byte $80   ; 80
- D 0 - I - 0x00C75D 03:874D: F3        .byte $F3, $AF, $01, $F7   ; 
- D 0 - I - 0x00C761 03:8751: F2        .byte $F2, $B1, $01, $FF   ; 
@end:



_off028_8755_41:
- D 0 - I - 0x00C765 03:8755: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C766 03:8756: 02        .byte $02, $1D, $01, $F7   ; 
- D 0 - I - 0x00C76A 03:875A: 01        .byte $01, $1F, $01, $FF   ; 
- D 0 - I - 0x00C76E 03:875E: 80        .byte $80   ; 80
- D 0 - I - 0x00C76F 03:875F: F2        .byte $F2, $AF, $01, $F7   ; 
- D 0 - I - 0x00C773 03:8763: F1        .byte $F1, $B1, $01, $FF   ; 
@end:



_off028_8767_42:
- D 0 - I - 0x00C777 03:8767: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C778 03:8768: FF        .byte $FF, $35, $01, $F8   ; 
- D 0 - I - 0x00C77C 03:876C: FF        .byte $FF, $37, $01, $00   ; 
- D 0 - I - 0x00C780 03:8770: 80        .byte $80   ; 80
- D 0 - I - 0x00C781 03:8771: EF        .byte $EF, $B7, $01, $F8   ; 
- D 0 - I - 0x00C785 03:8775: EF        .byte $EF, $B9, $01, $00   ; 
@end:



_off028_8779_43:
- D 0 - I - 0x00C789 03:8779: 0D        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C78A 03:877A: 00        .byte $00, $39, $01, $FD   ; 
- D 0 - I - 0x00C78E 03:877E: 80        .byte $80   ; 80
- D 0 - I - 0x00C78F 03:877F: F0        .byte $F0, $B7, $01, $F8   ; 
- D 0 - I - 0x00C793 03:8783: F0        .byte $F0, $B9, $01, $00   ; 
@end:



_off028_8787_44:
- D 0 - I - 0x00C797 03:8787: 0D        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C798 03:8788: FF        .byte $FF, $3B, $01, $FE   ; 
- D 0 - I - 0x00C79C 03:878C: 80        .byte $80   ; 80
- D 0 - I - 0x00C79D 03:878D: EF        .byte $EF, $B7, $01, $F8   ; 
- D 0 - I - 0x00C7A1 03:8791: EF        .byte $EF, $B9, $01, $00   ; 
@end:



_off028_8795_45:
- D 0 - I - 0x00C7A5 03:8795: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C7A6 03:8796: FF        .byte $FF, $25, $01, $F9   ; 
- D 0 - I - 0x00C7AA 03:879A: FF        .byte $FF, $27, $01, $01   ; 
- D 0 - I - 0x00C7AE 03:879E: 80        .byte $80   ; 80
- D 0 - I - 0x00C7AF 03:879F: EF        .byte $EF, $B3, $01, $F7   ; 
- D 0 - I - 0x00C7B3 03:87A3: EF        .byte $EF, $B5, $01, $FF   ; 
@end:



_off028_87A7_46:
- D 0 - I - 0x00C7B7 03:87A7: 0D        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C7B8 03:87A8: 00        .byte $00, $29, $01, $FD   ; 
- D 0 - I - 0x00C7BC 03:87AC: 80        .byte $80   ; 80
- D 0 - I - 0x00C7BD 03:87AD: F0        .byte $F0, $B3, $01, $F7   ; 
- D 0 - I - 0x00C7C1 03:87B1: F0        .byte $F0, $B5, $01, $FF   ; 
@end:



_off028_87B5_47:
- D 0 - I - 0x00C7C5 03:87B5: 11        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C7C6 03:87B6: FF        .byte $FF, $2B, $01, $FA   ; 
- D 0 - I - 0x00C7CA 03:87BA: FF        .byte $FF, $2D, $01, $02   ; 
- D 0 - I - 0x00C7CE 03:87BE: 80        .byte $80   ; 80
- D 0 - I - 0x00C7CF 03:87BF: EF        .byte $EF, $B3, $01, $F7   ; 
- D 0 - I - 0x00C7D3 03:87C3: EF        .byte $EF, $B5, $01, $FF   ; 
@end:



_off028_87C7_48:
- D 0 - I - 0x00C7D7 03:87C7: 0D        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C7D8 03:87C8: 00        .byte $00, $3D, $01, $FC   ; 
- D 0 - I - 0x00C7DC 03:87CC: 80        .byte $80   ; 80
- D 0 - I - 0x00C7DD 03:87CD: F0        .byte $F0, $BB, $01, $F9   ; 
- D 0 - I - 0x00C7E1 03:87D1: F0        .byte $F0, $BD, $01, $01   ; 
@end:



_off028_87D5_49:
- D 0 - I - 0x00C7E5 03:87D5: 0D        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C7E6 03:87D6: 01        .byte $01, $43, $01, $FC   ; 
- D 0 - I - 0x00C7EA 03:87DA: 80        .byte $80   ; 80
- D 0 - I - 0x00C7EB 03:87DB: F1        .byte $F1, $BB, $01, $F9   ; 
- D 0 - I - 0x00C7EF 03:87DF: F1        .byte $F1, $BD, $01, $01   ; 
@end:



_off028_87E3_4A:
- D 0 - I - 0x00C7F3 03:87E3: 0D        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C7F4 03:87E4: 00        .byte $00, $3D, $41, $FC   ; 
- D 0 - I - 0x00C7F8 03:87E8: 80        .byte $80   ; 80
- D 0 - I - 0x00C7F9 03:87E9: F0        .byte $F0, $BB, $01, $F9   ; 
- D 0 - I - 0x00C7FD 03:87ED: F0        .byte $F0, $BD, $01, $01   ; 
@end:



_off028_87F1_4B:
- D 0 - I - 0x00C801 03:87F1: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C802 03:87F2: EA        .byte $EA, $E5, $00, $F9   ; 
- D 0 - I - 0x00C806 03:87F6: EA        .byte $EA, $E5, $40, $00   ; 
- D 0 - I - 0x00C80A 03:87FA: FA        .byte $FA, $E7, $00, $F9   ; 
- D 0 - I - 0x00C80E 03:87FE: FA        .byte $FA, $E7, $40, $00   ; 
- D 0 - I - 0x00C812 03:8802: 0A        .byte $0A, $E9, $00, $FD   ; 
@end:



_off028_8806_4C:
- D 0 - I - 0x00C816 03:8806: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C817 03:8807: EA        .byte $EA, $ED, $00, $02   ; 
- D 0 - I - 0x00C81B 03:880B: F1        .byte $F1, $EB, $00, $FA   ; 
- D 0 - I - 0x00C81F 03:880F: FA        .byte $FA, $F1, $00, $02   ; 
- D 0 - I - 0x00C823 03:8813: 01        .byte $01, $EF, $00, $FA   ; 
- D 0 - I - 0x00C827 03:8817: 0A        .byte $0A, $F3, $00, $F3   ; 
@end:



_off028_881B_4D:
- D 0 - I - 0x00C82B 03:881B: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C82C 03:881C: F2        .byte $F2, $F5, $00, $FC   ; 
- D 0 - I - 0x00C830 03:8820: F2        .byte $F2, $F7, $00, $04   ; 
- D 0 - I - 0x00C834 03:8824: 02        .byte $02, $F9, $00, $F3   ; 
- D 0 - I - 0x00C838 03:8828: 02        .byte $02, $FB, $00, $FB   ; 
- D 0 - I - 0x00C83C 03:882C: 02        .byte $02, $FD, $00, $03   ; 
@end:



_off028_8830_4E:
- D 0 - I - 0x00C840 03:8830: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C841 03:8831: D2        .byte $D2, $E5, $00, $F9   ; 
- D 0 - I - 0x00C845 03:8835: D2        .byte $D2, $E5, $40, $00   ; 
- D 0 - I - 0x00C849 03:8839: E2        .byte $E2, $E7, $00, $F9   ; 
- D 0 - I - 0x00C84D 03:883D: E2        .byte $E2, $E7, $40, $00   ; 
- D 0 - I - 0x00C851 03:8841: F2        .byte $F2, $E9, $00, $FD   ; 
@end:



_off028_8845_4F:
- D 0 - I - 0x00C855 03:8845: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C856 03:8846: D2        .byte $D2, $ED, $00, $02   ; 
- D 0 - I - 0x00C85A 03:884A: D9        .byte $D9, $EB, $00, $FA   ; 
- D 0 - I - 0x00C85E 03:884E: E2        .byte $E2, $F1, $00, $02   ; 
- D 0 - I - 0x00C862 03:8852: E9        .byte $E9, $EF, $00, $FA   ; 
- D 0 - I - 0x00C866 03:8856: F2        .byte $F2, $F3, $00, $F3   ; 
@end:



_off028_885A_50:
- D 0 - I - 0x00C86A 03:885A: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C86B 03:885B: DA        .byte $DA, $F5, $00, $FC   ; 
- D 0 - I - 0x00C86F 03:885F: DA        .byte $DA, $F7, $00, $04   ; 
- D 0 - I - 0x00C873 03:8863: EA        .byte $EA, $F9, $00, $F3   ; 
- D 0 - I - 0x00C877 03:8867: EA        .byte $EA, $FB, $00, $FB   ; 
- D 0 - I - 0x00C87B 03:886B: EA        .byte $EA, $FD, $00, $03   ; 
@end:



_off028_886F_51:
- D 0 - I - 0x00C87F 03:886F: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C880 03:8870: D8        .byte $D8, $E5, $00, $F9   ; 
- D 0 - I - 0x00C884 03:8874: D8        .byte $D8, $E5, $40, $00   ; 
- D 0 - I - 0x00C888 03:8878: E8        .byte $E8, $E7, $00, $F9   ; 
- D 0 - I - 0x00C88C 03:887C: E8        .byte $E8, $E7, $40, $00   ; 
- D 0 - I - 0x00C890 03:8880: F8        .byte $F8, $E9, $00, $FD   ; 
@end:



_off028_8884_52:
- D 0 - I - 0x00C894 03:8884: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C895 03:8885: D8        .byte $D8, $ED, $00, $02   ; 
- D 0 - I - 0x00C899 03:8889: DF        .byte $DF, $EB, $00, $FA   ; 
- D 0 - I - 0x00C89D 03:888D: E8        .byte $E8, $F1, $00, $02   ; 
- D 0 - I - 0x00C8A1 03:8891: EF        .byte $EF, $EF, $00, $FA   ; 
- D 0 - I - 0x00C8A5 03:8895: F8        .byte $F8, $F3, $00, $F3   ; 
@end:



_off028_8899_53:
- D 0 - I - 0x00C8A9 03:8899: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C8AA 03:889A: E0        .byte $E0, $F5, $00, $FC   ; 
- D 0 - I - 0x00C8AE 03:889E: E0        .byte $E0, $F7, $00, $04   ; 
- D 0 - I - 0x00C8B2 03:88A2: F0        .byte $F0, $F9, $00, $F3   ; 
- D 0 - I - 0x00C8B6 03:88A6: F0        .byte $F0, $FB, $00, $FB   ; 
- D 0 - I - 0x00C8BA 03:88AA: F0        .byte $F0, $FD, $00, $03   ; 
@end:



_off028_88AE_54:
- D 0 - I - 0x00C8BE 03:88AE: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C8BF 03:88AF: 1F        .byte $1F, $E1, $00, $E0   ; 
- D 0 - I - 0x00C8C3 03:88B3: 1F        .byte $1F, $E1, $00, $18   ; 
@end:



_off028_88B7_55:
- D 0 - I - 0x00C8C7 03:88B7: 1C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C8C8 03:88B8: 1F        .byte $1F, $E1, $00, $E0   ; 
- D 0 - I - 0x00C8CC 03:88BC: 1F        .byte $1F, $E1, $00, $18   ; 
- D 0 - I - 0x00C8D0 03:88C0: 2F        .byte $2F, $E3, $00, $E0   ; 
- D 0 - I - 0x00C8D4 03:88C4: 2F        .byte $2F, $DF, $00, $E8   ; 
- D 0 - I - 0x00C8D8 03:88C8: 2F        .byte $2F, $DF, $00, $F8   ; 
- D 0 - I - 0x00C8DC 03:88CC: 2F        .byte $2F, $DF, $00, $08   ; 
- D 0 - I - 0x00C8E0 03:88D0: 2F        .byte $2F, $E3, $00, $18   ; 
@end:



_off028_88D4_56:
- D 0 - I - 0x00C8E4 03:88D4: 1C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C8E5 03:88D5: 1F        .byte $1F, $E1, $00, $E0   ; 
- D 0 - I - 0x00C8E9 03:88D9: 1F        .byte $1F, $E1, $00, $18   ; 
- D 0 - I - 0x00C8ED 03:88DD: 2F        .byte $2F, $E3, $00, $E0   ; 
- D 0 - I - 0x00C8F1 03:88E1: 2F        .byte $2F, $DF, $00, $F0   ; 
- D 0 - I - 0x00C8F5 03:88E5: 2F        .byte $2F, $DF, $00, $00   ; 
- D 0 - I - 0x00C8F9 03:88E9: 2F        .byte $2F, $DF, $00, $10   ; 
- D 0 - I - 0x00C8FD 03:88ED: 2F        .byte $2F, $E3, $00, $18   ; 
@end:



_off028_88F1_57:
- D 0 - I - 0x00C901 03:88F1: 1C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C902 03:88F2: 1F        .byte $1F, $E1, $00, $E0   ; 
- D 0 - I - 0x00C906 03:88F6: 1F        .byte $1F, $E1, $00, $18   ; 
- D 0 - I - 0x00C90A 03:88FA: 2F        .byte $2F, $E3, $00, $E0   ; 
- D 0 - I - 0x00C90E 03:88FE: 2F        .byte $2F, $DF, $80, $E8   ; 
- D 0 - I - 0x00C912 03:8902: 2F        .byte $2F, $DF, $80, $F8   ; 
- D 0 - I - 0x00C916 03:8906: 2F        .byte $2F, $DF, $80, $08   ; 
- D 0 - I - 0x00C91A 03:890A: 2F        .byte $2F, $E3, $00, $18   ; 
@end:



_off028_890E_58:
- D 0 - I - 0x00C91E 03:890E: 1C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C91F 03:890F: 1F        .byte $1F, $E1, $00, $E0   ; 
- D 0 - I - 0x00C923 03:8913: 1F        .byte $1F, $E1, $00, $18   ; 
- D 0 - I - 0x00C927 03:8917: 2F        .byte $2F, $E3, $00, $E0   ; 
- D 0 - I - 0x00C92B 03:891B: 2F        .byte $2F, $DF, $80, $F0   ; 
- D 0 - I - 0x00C92F 03:891F: 2F        .byte $2F, $DF, $80, $00   ; 
- D 0 - I - 0x00C933 03:8923: 2F        .byte $2F, $DF, $80, $10   ; 
- D 0 - I - 0x00C937 03:8927: 2F        .byte $2F, $E3, $00, $18   ; 
@end:



_off028_892B_59:
- D 0 - I - 0x00C93B 03:892B: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C93C 03:892C: F0        .byte $F0, $F3, $00, $00   ; 
@end:



_off028_8930_5A:
- D 0 - I - 0x00C940 03:8930: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C941 03:8931: FE        .byte $FE, $F9, $00, $F1   ; 
- D 0 - I - 0x00C945 03:8935: F1        .byte $F1, $F5, $00, $F8   ; 
- D 0 - I - 0x00C949 03:8939: F1        .byte $F1, $F7, $00, $00   ; 
@end:



_off028_893D_5B:
- D 0 - I - 0x00C94D 03:893D: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C94E 03:893E: F0        .byte $F0, $FB, $00, $F8   ; 
- D 0 - I - 0x00C952 03:8942: F0        .byte $F0, $FD, $00, $00   ; 
@end:



_off028_8946_5C:
- D 0 - I - 0x00C956 03:8946: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C957 03:8947: F8        .byte $F8, $F9, $00, $F8   ; 
- D 0 - I - 0x00C95B 03:894B: F8        .byte $F8, $FD, $01, $FE   ; 
@end:



_off028_894F_5D:
- D 0 - I - 0x00C95F 03:894F: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C960 03:8950: F8        .byte $F8, $FD, $00, $FA   ; 
- D 0 - I - 0x00C964 03:8954: F8        .byte $F8, $F7, $01, $00   ; 
@end:



_off028_8958_5E:
- D 0 - I - 0x00C968 03:8958: FE        .byte $FE   ; 



_off028_8959_5F:
- D 0 - I - 0x00C969 03:8959: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C96A 03:895A: F8        .byte $F8, $FD, $01, $FC   ; 
@end:



_off028_895E_60:
- D 0 - I - 0x00C96E 03:895E: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C96F 03:895F: F8        .byte $F8, $FD, $01, $FA   ; 
- D 0 - I - 0x00C973 03:8963: F8        .byte $F8, $F7, $00, $00   ; 
@end:



_off028_8967_61:
- D 0 - I - 0x00C977 03:8967: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C978 03:8968: F8        .byte $F8, $F9, $01, $F8   ; 
- D 0 - I - 0x00C97C 03:896C: F8        .byte $F8, $FD, $00, $FE   ; 
@end:



_off028_8970_62:
- D 0 - I - 0x00C980 03:8970: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C981 03:8971: F8        .byte $F8, $FB, $03, $F8   ; 
- D 0 - I - 0x00C985 03:8975: F8        .byte $F8, $FB, $43, $00   ; 
@end:



_off028_8979_63:
- D 0 - I - 0x00C989 03:8979: FA        .byte $FA   ; 



_off028_897A_64:
- D 0 - I - 0x00C98A 03:897A: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C98B 03:897B: F8        .byte $F8, $F1, $03, $F8   ; 
- D 0 - I - 0x00C98F 03:897F: F8        .byte $F8, $F3, $03, $00   ; 
- D 0 - I - 0x00C993 03:8983: 05        .byte $05, $EF, $03, $F3   ; 
@end:



_off028_8987_65:
- D 0 - I - 0x00C997 03:8987: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C998 03:8988: F8        .byte $F8, $C5, $03, $F8   ; 
- D 0 - I - 0x00C99C 03:898C: F8        .byte $F8, $C5, $43, $00   ; 
- D 0 - I - 0x00C9A0 03:8990: 08        .byte $08, $DB, $03, $FC   ; 
@end:



_off028_8994_66:
- D 0 - I - 0x00C9A4 03:8994: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C9A5 03:8995: F0        .byte $F0, $D7, $00, $F8   ; 
- D 0 - I - 0x00C9A9 03:8999: EE        .byte $EE, $D9, $00, $00   ; 
- D 0 - I - 0x00C9AD 03:899D: 00        .byte $00, $AD, $00, $F4   ; 
- D 0 - I - 0x00C9B1 03:89A1: FE        .byte $FE, $AF, $00, $FC   ; 
@end:



_off028_89A5_67:
- D 0 - I - 0x00C9B5 03:89A5: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C9B6 03:89A6: F1        .byte $F1, $DD, $00, $FC   ; 
- D 0 - I - 0x00C9BA 03:89AA: F8        .byte $F8, $B3, $00, $F5   ; 
- D 0 - I - 0x00C9BE 03:89AE: 01        .byte $01, $B5, $00, $FD   ; 
@end:



_off028_89B2_68:
- D 0 - I - 0x00C9C2 03:89B2: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C9C3 03:89B3: F0        .byte $F0, $E1, $00, $FF   ; 
- D 0 - I - 0x00C9C7 03:89B7: F0        .byte $F0, $DF, $00, $F7   ; 
- D 0 - I - 0x00C9CB 03:89BB: 00        .byte $00, $BB, $00, $FA   ; 
@end:



_off028_89BF_69:
- D 0 - I - 0x00C9CF 03:89BF: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C9D0 03:89C0: F0        .byte $F0, $E1, $00, $FF   ; 
- D 0 - I - 0x00C9D4 03:89C4: F0        .byte $F0, $DF, $00, $F7   ; 
- D 0 - I - 0x00C9D8 03:89C8: 00        .byte $00, $AD, $00, $F4   ; 
- D 0 - I - 0x00C9DC 03:89CC: FE        .byte $FE, $AF, $00, $FC   ; 
@end:



_off028_89D0_6A:
- D 0 - I - 0x00C9E0 03:89D0: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C9E1 03:89D1: F0        .byte $F0, $D7, $00, $F8   ; 
- D 0 - I - 0x00C9E5 03:89D5: EE        .byte $EE, $D9, $00, $00   ; 
- D 0 - I - 0x00C9E9 03:89D9: 00        .byte $00, $BB, $00, $FA   ; 
@end:



_off028_89DD_6B:
- D 0 - I - 0x00C9ED 03:89DD: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C9EE 03:89DE: F0        .byte $F0, $E3, $00, $F8   ; 
- D 0 - I - 0x00C9F2 03:89E2: F0        .byte $F0, $E3, $40, $00   ; 
- D 0 - I - 0x00C9F6 03:89E6: 00        .byte $00, $E5, $00, $F8   ; 
- D 0 - I - 0x00C9FA 03:89EA: 00        .byte $00, $E5, $40, $00   ; 
@end:



_off028_89EE_6C:
- D 0 - I - 0x00C9FE 03:89EE: 14        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00C9FF 03:89EF: EE        .byte $EE, $E7, $00, $F4   ; 
- D 0 - I - 0x00CA03 03:89F3: EE        .byte $EE, $E7, $40, $04   ; 
- D 0 - I - 0x00CA07 03:89F7: F5        .byte $F5, $E9, $00, $FC   ; 
- D 0 - I - 0x00CA0B 03:89FB: FE        .byte $FE, $EB, $00, $F7   ; 
- D 0 - I - 0x00CA0F 03:89FF: 05        .byte $05, $ED, $00, $00   ; 
@end:



_off028_8A03_6D:
- D 0 - I - 0x00CA13 03:8A03: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CA14 03:8A04: F1        .byte $F1, $F7, $00, $F7   ; 
- D 0 - I - 0x00CA18 03:8A08: F1        .byte $F1, $F9, $00, $FF   ; 
- D 0 - I - 0x00CA1C 03:8A0C: F5        .byte $F5, $FB, $00, $07   ; 
- D 0 - I - 0x00CA20 03:8A10: 01        .byte $01, $FD, $00, $FE   ; 
@end:



_off028_8A14_6E:
- D 0 - I - 0x00CA24 03:8A14: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CA25 03:8A15: F1        .byte $F1, $F7, $00, $F7   ; 
- D 0 - I - 0x00CA29 03:8A19: F1        .byte $F1, $F9, $00, $FF   ; 
- D 0 - I - 0x00CA2D 03:8A1D: F5        .byte $F5, $EB, $00, $07   ; 
- D 0 - I - 0x00CA31 03:8A21: 01        .byte $01, $FD, $00, $FE   ; 
@end:



_off028_8A25_6F:
- D 0 - I - 0x00CA35 03:8A25: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CA36 03:8A26: F0        .byte $F0, $EF, $00, $F4   ; 
- D 0 - I - 0x00CA3A 03:8A2A: F0        .byte $F0, $F1, $00, $FC   ; 
- D 0 - I - 0x00CA3E 03:8A2E: F0        .byte $F0, $F3, $C0, $04   ; 
- D 0 - I - 0x00CA42 03:8A32: 00        .byte $00, $F3, $00, $F4   ; 
- D 0 - I - 0x00CA46 03:8A36: 00        .byte $00, $F5, $00, $FC   ; 
- D 0 - I - 0x00CA4A 03:8A3A: 00        .byte $00, $EF, $C0, $04   ; 
@end:



_off028_8A3E_70:
- D 0 - I - 0x00CA4E 03:8A3E: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CA4F 03:8A3F: F0        .byte $F0, $F3, $80, $F4   ; 
- D 0 - I - 0x00CA53 03:8A43: F0        .byte $F0, $F1, $40, $FC   ; 
- D 0 - I - 0x00CA57 03:8A47: F0        .byte $F0, $EF, $40, $04   ; 
- D 0 - I - 0x00CA5B 03:8A4B: 00        .byte $00, $EF, $80, $F4   ; 
- D 0 - I - 0x00CA5F 03:8A4F: 00        .byte $00, $F5, $40, $FC   ; 
- D 0 - I - 0x00CA63 03:8A53: 00        .byte $00, $F3, $40, $04   ; 
@end:



_off028_8A57_71:
- D 0 - I - 0x00CA67 03:8A57: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CA68 03:8A58: F0        .byte $F0, $EF, $00, $F4   ; 
- D 0 - I - 0x00CA6C 03:8A5C: F0        .byte $F0, $F5, $C0, $FC   ; 
- D 0 - I - 0x00CA70 03:8A60: F0        .byte $F0, $F3, $C0, $04   ; 
- D 0 - I - 0x00CA74 03:8A64: 00        .byte $00, $F3, $00, $F4   ; 
- D 0 - I - 0x00CA78 03:8A68: 00        .byte $00, $F1, $C0, $FC   ; 
- D 0 - I - 0x00CA7C 03:8A6C: 00        .byte $00, $EF, $C0, $04   ; 
@end:



_off028_8A70_72:
- D 0 - I - 0x00CA80 03:8A70: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CA81 03:8A71: F0        .byte $F0, $F3, $80, $F4   ; 
- D 0 - I - 0x00CA85 03:8A75: F0        .byte $F0, $F5, $80, $FC   ; 
- D 0 - I - 0x00CA89 03:8A79: F0        .byte $F0, $EF, $40, $04   ; 
- D 0 - I - 0x00CA8D 03:8A7D: 00        .byte $00, $EF, $80, $F4   ; 
- D 0 - I - 0x00CA91 03:8A81: 00        .byte $00, $F1, $80, $FC   ; 
- D 0 - I - 0x00CA95 03:8A85: 00        .byte $00, $F3, $40, $04   ; 
@end:



_off028_8A89_73:
- D 0 - I - 0x00CA99 03:8A89: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CA9A 03:8A8A: F8        .byte $F8, $D7, $00, $F8   ; 
- D 0 - I - 0x00CA9E 03:8A8E: F8        .byte $F8, $D7, $40, $00   ; 
@end:



_off028_8A92_74:
- D 0 - I - 0x00CAA2 03:8A92: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CAA3 03:8A93: F8        .byte $F8, $D9, $00, $F8   ; 
- D 0 - I - 0x00CAA7 03:8A97: F8        .byte $F8, $D9, $40, $00   ; 
@end:



_off028_8A9B_75:
- D 0 - I - 0x00CAAB 03:8A9B: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CAAC 03:8A9C: F8        .byte $F8, $DB, $00, $F8   ; 
- D 0 - I - 0x00CAB0 03:8AA0: F8        .byte $F8, $DD, $00, $00   ; 
@end:



_off028_8AA4_76:
- D 0 - I - 0x00CAB4 03:8AA4: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CAB5 03:8AA5: F7        .byte $F7, $DF, $00, $F8   ; 
- D 0 - I - 0x00CAB9 03:8AA9: F7        .byte $F7, $E1, $00, $00   ; 
@end:



_off028_8AAD_77:
- D 0 - I - 0x00CABD 03:8AAD: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CABE 03:8AAE: F7        .byte $F7, $E3, $00, $F8   ; 
- D 0 - I - 0x00CAC2 03:8AB2: F7        .byte $F7, $E9, $00, $00   ; 
@end:



_off028_8AB6_78:
- D 0 - I - 0x00CAC6 03:8AB6: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CAC7 03:8AB7: F9        .byte $F9, $BB, $00, $F4   ; 
- D 0 - I - 0x00CACB 03:8ABB: F8        .byte $F8, $BD, $00, $FC   ; 
- D 0 - I - 0x00CACF 03:8ABF: F6        .byte $F6, $BF, $00, $04   ; 
@end:



_off028_8AC3_79:
- D 0 - I - 0x00CAD3 03:8AC3: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CAD4 03:8AC4: F6        .byte $F6, $BF, $40, $F4   ; 
- D 0 - I - 0x00CAD8 03:8AC8: F8        .byte $F8, $ED, $00, $FC   ; 
- D 0 - I - 0x00CADC 03:8ACC: F9        .byte $F9, $BB, $40, $04   ; 
@end:



_off028_8AD0_7A:
- D 0 - I - 0x00CAE0 03:8AD0: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CAE1 03:8AD1: F0        .byte $F0, $EF, $00, $F3   ; 
- D 0 - I - 0x00CAE5 03:8AD5: F7        .byte $F7, $F1, $00, $F8   ; 
- D 0 - I - 0x00CAE9 03:8AD9: F8        .byte $F8, $F3, $00, $00   ; 
- D 0 - I - 0x00CAED 03:8ADD: 00        .byte $00, $F5, $00, $07   ; 
@end:



_off028_8AE1_7B:
- D 0 - I - 0x00CAF1 03:8AE1: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CAF2 03:8AE2: F2        .byte $F2, $F7, $00, $F6   ; 
- D 0 - I - 0x00CAF6 03:8AE6: F2        .byte $F2, $F9, $00, $FE   ; 
- D 0 - I - 0x00CAFA 03:8AEA: 02        .byte $02, $FB, $00, $F9   ; 
- D 0 - I - 0x00CAFE 03:8AEE: FC        .byte $FC, $FD, $00, $01   ; 
@end:



_off028_8AF2_7C:
- D 0 - I - 0x00CB02 03:8AF2: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB03 03:8AF3: F4        .byte $F4, $AB, $00, $F7   ; 
- D 0 - I - 0x00CB07 03:8AF7: EC        .byte $EC, $AD, $00, $FF   ; 
- D 0 - I - 0x00CB0B 03:8AFB: FC        .byte $FC, $AF, $00, $FA   ; 
- D 0 - I - 0x00CB0F 03:8AFF: FC        .byte $FC, $B1, $00, $02   ; 
@end:



_off028_8B03_7D:
- D 0 - I - 0x00CB13 03:8B03: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB14 03:8B04: F4        .byte $F4, $B3, $00, $FA   ; 
- D 0 - I - 0x00CB18 03:8B08: F4        .byte $F4, $B5, $00, $02   ; 
- D 0 - I - 0x00CB1C 03:8B0C: FC        .byte $FC, $B7, $00, $F7   ; 
- D 0 - I - 0x00CB20 03:8B10: 04        .byte $04, $B9, $00, $FF   ; 
@end:



_off028_8B14_7E:
- D 0 - I - 0x00CB24 03:8B14: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB25 03:8B15: 00        .byte $00, $EF, $80, $F3   ; 
- D 0 - I - 0x00CB29 03:8B19: F9        .byte $F9, $F1, $80, $F7   ; 
- D 0 - I - 0x00CB2D 03:8B1D: F8        .byte $F8, $F3, $80, $FF   ; 
- D 0 - I - 0x00CB31 03:8B21: F0        .byte $F0, $F5, $80, $07   ; 
@end:



_off028_8B25_7F:
- D 0 - I - 0x00CB35 03:8B25: 10        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB36 03:8B26: FE        .byte $FE, $F7, $80, $F6   ; 
- D 0 - I - 0x00CB3A 03:8B2A: FE        .byte $FE, $F9, $80, $FE   ; 
- D 0 - I - 0x00CB3E 03:8B2E: EE        .byte $EE, $FB, $80, $F9   ; 
- D 0 - I - 0x00CB42 03:8B32: F4        .byte $F4, $FD, $80, $01   ; 
@end:



_off028_8B36_80:
- D 0 - I - 0x00CB46 03:8B36: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB47 03:8B37: F7        .byte $F7, $BB, $80, $F4   ; 
- D 0 - I - 0x00CB4B 03:8B3B: F8        .byte $F8, $BD, $80, $FC   ; 
- D 0 - I - 0x00CB4F 03:8B3F: FA        .byte $FA, $BF, $80, $04   ; 
@end:



_off028_8B43_81:
- D 0 - I - 0x00CB53 03:8B43: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB54 03:8B44: FA        .byte $FA, $BF, $C0, $F4   ; 
- D 0 - I - 0x00CB58 03:8B48: F8        .byte $F8, $ED, $80, $FC   ; 
- D 0 - I - 0x00CB5C 03:8B4C: F7        .byte $F7, $BB, $C0, $04   ; 
@end:



_off028_8B50_82:
- D 0 - I - 0x00CB60 03:8B50: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB61 03:8B51: F8        .byte $F8, $E5, $00, $F8   ; 
- D 0 - I - 0x00CB65 03:8B55: F8        .byte $F8, $E7, $00, $00   ; 
@end:



_off028_8B59_83:
- D 0 - I - 0x00CB69 03:8B59: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB6A 03:8B5A: F8        .byte $F8, $E9, $00, $F8   ; 
- D 0 - I - 0x00CB6E 03:8B5E: F8        .byte $F8, $EB, $00, $00   ; 
@end:



_off028_8B62_84:
- D 0 - I - 0x00CB72 03:8B62: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB73 03:8B63: F0        .byte $F0, $C1, $00, $F0   ; 
- D 0 - I - 0x00CB77 03:8B67: F0        .byte $F0, $C3, $00, $F8   ; 
- D 0 - I - 0x00CB7B 03:8B6B: F0        .byte $F0, $C3, $40, $00   ; 
- D 0 - I - 0x00CB7F 03:8B6F: F0        .byte $F0, $C1, $40, $08   ; 
- D 0 - I - 0x00CB83 03:8B73: 00        .byte $00, $C5, $00, $F0   ; 
- D 0 - I - 0x00CB87 03:8B77: 00        .byte $00, $C7, $00, $F8   ; 
- D 0 - I - 0x00CB8B 03:8B7B: 00        .byte $00, $C7, $40, $00   ; 
- D 0 - I - 0x00CB8F 03:8B7F: 00        .byte $00, $C5, $40, $08   ; 
@end:



_off028_8B83_85:
- D 0 - I - 0x00CB93 03:8B83: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CB94 03:8B84: F0        .byte $F0, $C9, $00, $F0   ; 
- D 0 - I - 0x00CB98 03:8B88: F0        .byte $F0, $CB, $00, $F8   ; 
- D 0 - I - 0x00CB9C 03:8B8C: F0        .byte $F0, $CD, $00, $00   ; 
- D 0 - I - 0x00CBA0 03:8B90: F0        .byte $F0, $CF, $00, $08   ; 
- D 0 - I - 0x00CBA4 03:8B94: 00        .byte $00, $D1, $00, $F0   ; 
- D 0 - I - 0x00CBA8 03:8B98: 00        .byte $00, $D3, $00, $F8   ; 
- D 0 - I - 0x00CBAC 03:8B9C: 00        .byte $00, $D5, $00, $00   ; 
- D 0 - I - 0x00CBB0 03:8BA0: 00        .byte $00, $D7, $00, $08   ; 
@end:



_off028_8BA4_86:
- D 0 - I - 0x00CBB4 03:8BA4: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CBB5 03:8BA5: F0        .byte $F0, $D9, $00, $F0   ; 
- D 0 - I - 0x00CBB9 03:8BA9: F0        .byte $F0, $DB, $00, $F8   ; 
- D 0 - I - 0x00CBBD 03:8BAD: F0        .byte $F0, $DD, $00, $00   ; 
- D 0 - I - 0x00CBC1 03:8BB1: F0        .byte $F0, $DF, $00, $08   ; 
- D 0 - I - 0x00CBC5 03:8BB5: 00        .byte $00, $D9, $80, $F0   ; 
- D 0 - I - 0x00CBC9 03:8BB9: 00        .byte $00, $DB, $80, $F8   ; 
- D 0 - I - 0x00CBCD 03:8BBD: 00        .byte $00, $DD, $80, $00   ; 
- D 0 - I - 0x00CBD1 03:8BC1: 00        .byte $00, $DF, $80, $08   ; 
@end:



_off028_8BC5_87:
- D 0 - I - 0x00CBD5 03:8BC5: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CBD6 03:8BC6: F0        .byte $F0, $D1, $80, $F0   ; 
- D 0 - I - 0x00CBDA 03:8BCA: F0        .byte $F0, $D3, $80, $F8   ; 
- D 0 - I - 0x00CBDE 03:8BCE: F0        .byte $F0, $D5, $80, $00   ; 
- D 0 - I - 0x00CBE2 03:8BD2: F0        .byte $F0, $D7, $80, $08   ; 
- D 0 - I - 0x00CBE6 03:8BD6: 00        .byte $00, $C9, $80, $F0   ; 
- D 0 - I - 0x00CBEA 03:8BDA: 00        .byte $00, $CB, $80, $F8   ; 
- D 0 - I - 0x00CBEE 03:8BDE: 00        .byte $00, $CD, $80, $00   ; 
- D 0 - I - 0x00CBF2 03:8BE2: 00        .byte $00, $CF, $80, $08   ; 
@end:



_off028_8BE6_88:
- D 0 - I - 0x00CBF6 03:8BE6: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CBF7 03:8BE7: F0        .byte $F0, $C5, $80, $F0   ; 
- D 0 - I - 0x00CBFB 03:8BEB: F0        .byte $F0, $C7, $80, $F8   ; 
- D 0 - I - 0x00CBFF 03:8BEF: F0        .byte $F0, $C7, $C0, $00   ; 
- D 0 - I - 0x00CC03 03:8BF3: F0        .byte $F0, $C5, $C0, $08   ; 
- D 0 - I - 0x00CC07 03:8BF7: 00        .byte $00, $C1, $80, $F0   ; 
- D 0 - I - 0x00CC0B 03:8BFB: 00        .byte $00, $C3, $80, $F8   ; 
- D 0 - I - 0x00CC0F 03:8BFF: 00        .byte $00, $C3, $C0, $00   ; 
- D 0 - I - 0x00CC13 03:8C03: 00        .byte $00, $C1, $C0, $08   ; 
@end:



_off028_8C07_89:
- D 0 - I - 0x00CC17 03:8C07: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CC18 03:8C08: F0        .byte $F0, $D9, $00, $F0   ; 
- D 0 - I - 0x00CC1C 03:8C0C: F0        .byte $F0, $DB, $00, $F8   ; 
- D 0 - I - 0x00CC20 03:8C10: F0        .byte $F0, $DB, $40, $00   ; 
- D 0 - I - 0x00CC24 03:8C14: F0        .byte $F0, $D9, $40, $08   ; 
- D 0 - I - 0x00CC28 03:8C18: 00        .byte $00, $DD, $00, $F0   ; 
- D 0 - I - 0x00CC2C 03:8C1C: 00        .byte $00, $DF, $00, $F8   ; 
- D 0 - I - 0x00CC30 03:8C20: 00        .byte $00, $DF, $40, $00   ; 
- D 0 - I - 0x00CC34 03:8C24: 00        .byte $00, $DD, $40, $08   ; 
@end:



_off028_8C28_8A:
- D 0 - I - 0x00CC38 03:8C28: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CC39 03:8C29: EE        .byte $EE, $E1, $00, $F2   ; 
- D 0 - I - 0x00CC3D 03:8C2D: EE        .byte $EE, $E3, $00, $FA   ; 
- D 0 - I - 0x00CC41 03:8C31: EE        .byte $EE, $E5, $00, $02   ; 
- D 0 - I - 0x00CC45 03:8C35: EE        .byte $EE, $E7, $00, $0A   ; 
- D 0 - I - 0x00CC49 03:8C39: FE        .byte $FE, $E9, $00, $F2   ; 
- D 0 - I - 0x00CC4D 03:8C3D: FE        .byte $FE, $EB, $00, $FA   ; 
- D 0 - I - 0x00CC51 03:8C41: FE        .byte $FE, $ED, $00, $02   ; 
- D 0 - I - 0x00CC55 03:8C45: FE        .byte $FE, $EF, $00, $0A   ; 
@end:



_off028_8C49_8B:
- D 0 - I - 0x00CC59 03:8C49: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CC5A 03:8C4A: F0        .byte $F0, $F1, $00, $F0   ; 
- D 0 - I - 0x00CC5E 03:8C4E: F0        .byte $F0, $F3, $00, $F8   ; 
- D 0 - I - 0x00CC62 03:8C52: F0        .byte $F0, $F5, $00, $00   ; 
- D 0 - I - 0x00CC66 03:8C56: F0        .byte $F0, $F7, $00, $08   ; 
- D 0 - I - 0x00CC6A 03:8C5A: 00        .byte $00, $F1, $80, $F0   ; 
- D 0 - I - 0x00CC6E 03:8C5E: 00        .byte $00, $F3, $80, $F8   ; 
- D 0 - I - 0x00CC72 03:8C62: 00        .byte $00, $F5, $80, $00   ; 
- D 0 - I - 0x00CC76 03:8C66: 00        .byte $00, $F7, $80, $08   ; 
@end:



_off028_8C6A_8C:
- D 0 - I - 0x00CC7A 03:8C6A: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CC7B 03:8C6B: F2        .byte $F2, $E9, $80, $F2   ; 
- D 0 - I - 0x00CC7F 03:8C6F: F2        .byte $F2, $EB, $80, $FA   ; 
- D 0 - I - 0x00CC83 03:8C73: F2        .byte $F2, $ED, $80, $02   ; 
- D 0 - I - 0x00CC87 03:8C77: F2        .byte $F2, $EF, $80, $0A   ; 
- D 0 - I - 0x00CC8B 03:8C7B: 02        .byte $02, $E1, $80, $F2   ; 
- D 0 - I - 0x00CC8F 03:8C7F: 02        .byte $02, $E3, $80, $FA   ; 
- D 0 - I - 0x00CC93 03:8C83: 02        .byte $02, $E5, $80, $02   ; 
- D 0 - I - 0x00CC97 03:8C87: 02        .byte $02, $E7, $80, $0A   ; 
@end:



_off028_8C8B_8D:
- D 0 - I - 0x00CC9B 03:8C8B: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CC9C 03:8C8C: F0        .byte $F0, $DD, $80, $F0   ; 
- D 0 - I - 0x00CCA0 03:8C90: F0        .byte $F0, $DF, $80, $F8   ; 
- D 0 - I - 0x00CCA4 03:8C94: F0        .byte $F0, $DF, $C0, $00   ; 
- D 0 - I - 0x00CCA8 03:8C98: F0        .byte $F0, $DD, $C0, $08   ; 
- D 0 - I - 0x00CCAC 03:8C9C: 00        .byte $00, $D9, $80, $F0   ; 
- D 0 - I - 0x00CCB0 03:8CA0: 00        .byte $00, $DB, $80, $F8   ; 
- D 0 - I - 0x00CCB4 03:8CA4: 00        .byte $00, $DB, $C0, $00   ; 
- D 0 - I - 0x00CCB8 03:8CA8: 00        .byte $00, $D9, $C0, $08   ; 
@end:



_off028_8CAC_8E:
- D 0 - I - 0x00CCBC 03:8CAC: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CCBD 03:8CAD: F0        .byte $F0, $F9, $00, $F4   ; 
- D 0 - I - 0x00CCC1 03:8CB1: F0        .byte $F0, $FB, $00, $FC   ; 
- D 0 - I - 0x00CCC5 03:8CB5: F0        .byte $F0, $FD, $00, $04   ; 
- D 0 - I - 0x00CCC9 03:8CB9: 00        .byte $00, $FD, $C0, $F4   ; 
- D 0 - I - 0x00CCCD 03:8CBD: 00        .byte $00, $FB, $C0, $FC   ; 
- D 0 - I - 0x00CCD1 03:8CC1: 00        .byte $00, $F9, $C0, $04   ; 
@end:



_off028_8CC5_8F:
- D 0 - I - 0x00CCD5 03:8CC5: EB        .byte $EB   ; 



_off028_8CC6_90:
- D 0 - I - 0x00CCD6 03:8CC6: 38        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CCD7 03:8CC7: E0        .byte $E0, $C5, $00, $F0   ; 
- D 0 - I - 0x00CCDB 03:8CCB: E0        .byte $E0, $C7, $00, $F8   ; 
- D 0 - I - 0x00CCDF 03:8CCF: E0        .byte $E0, $C9, $00, $00   ; 
- D 0 - I - 0x00CCE3 03:8CD3: E0        .byte $E0, $CB, $00, $08   ; 
- D 0 - I - 0x00CCE7 03:8CD7: F0        .byte $F0, $CD, $00, $F1   ; 
- D 0 - I - 0x00CCEB 03:8CDB: F0        .byte $F0, $CF, $00, $F9   ; 
- D 0 - I - 0x00CCEF 03:8CDF: F0        .byte $F0, $D1, $00, $01   ; 
- D 0 - I - 0x00CCF3 03:8CE3: F0        .byte $F0, $D3, $00, $07   ; 
- D 0 - I - 0x00CCF7 03:8CE7: 00        .byte $00, $D5, $00, $F0   ; 
- D 0 - I - 0x00CCFB 03:8CEB: 00        .byte $00, $D7, $00, $F8   ; 
- D 0 - I - 0x00CCFF 03:8CEF: 00        .byte $00, $D9, $00, $00   ; 
- D 0 - I - 0x00CD03 03:8CF3: 00        .byte $00, $DB, $00, $08   ; 
- D 0 - I - 0x00CD07 03:8CF7: 10        .byte $10, $DD, $00, $F2   ; 
- D 0 - I - 0x00CD0B 03:8CFB: 10        .byte $10, $DF, $00, $FA   ; 
@end:



_off028_8CFF_91:
- D 0 - I - 0x00CD0F 03:8CFF: 38        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD10 03:8D00: E0        .byte $E0, $E1, $00, $EF   ; 
- D 0 - I - 0x00CD14 03:8D04: E0        .byte $E0, $E3, $00, $F7   ; 
- D 0 - I - 0x00CD18 03:8D08: E0        .byte $E0, $E9, $00, $FF   ; 
- D 0 - I - 0x00CD1C 03:8D0C: E0        .byte $E0, $EB, $00, $07   ; 
- D 0 - I - 0x00CD20 03:8D10: F0        .byte $F0, $ED, $00, $F0   ; 
- D 0 - I - 0x00CD24 03:8D14: F0        .byte $F0, $EF, $00, $F8   ; 
- D 0 - I - 0x00CD28 03:8D18: F0        .byte $F0, $F1, $00, $00   ; 
- D 0 - I - 0x00CD2C 03:8D1C: F0        .byte $F0, $F3, $00, $08   ; 
- D 0 - I - 0x00CD30 03:8D20: 00        .byte $00, $D5, $00, $EF   ; 
- D 0 - I - 0x00CD34 03:8D24: 00        .byte $00, $D7, $00, $F7   ; 
- D 0 - I - 0x00CD38 03:8D28: 00        .byte $00, $F5, $00, $FF   ; 
- D 0 - I - 0x00CD3C 03:8D2C: 00        .byte $00, $F7, $00, $07   ; 
- D 0 - I - 0x00CD40 03:8D30: 10        .byte $10, $F9, $00, $F2   ; 
- D 0 - I - 0x00CD44 03:8D34: 10        .byte $10, $DF, $00, $FA   ; 
@end:



_off028_8D38_92:
- D 0 - I - 0x00CD48 03:8D38: FD        .byte $FD   ; 



_off028_8D39_93:
- D 0 - I - 0x00CD49 03:8D39: FE        .byte $FE   ; 



_off028_8D3A_94:
- D 0 - I - 0x00CD4A 03:8D3A: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD4B 03:8D3B: F8        .byte $F8, $DD, $00, $FC   ; 
@end:



_off028_8D3F_95:
- D 0 - I - 0x00CD4F 03:8D3F: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD50 03:8D40: F8        .byte $F8, $DF, $00, $FC   ; 
@end:



_off028_8D44_96:
- D 0 - I - 0x00CD54 03:8D44: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD55 03:8D45: F8        .byte $F8, $E1, $00, $FC   ; 
@end:



_off028_8D49_97:
- D 0 - I - 0x00CD59 03:8D49: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD5A 03:8D4A: F8        .byte $F8, $E3, $00, $FC   ; 
@end:



_off028_8D4E_98:
- D 0 - I - 0x00CD5E 03:8D4E: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD5F 03:8D4F: F8        .byte $F8, $E9, $00, $F8   ; 
- D 0 - I - 0x00CD63 03:8D53: F8        .byte $F8, $EB, $00, $00   ; 
@end:



_off028_8D57_99:
- D 0 - I - 0x00CD67 03:8D57: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD68 03:8D58: F8        .byte $F8, $ED, $00, $F8   ; 
- D 0 - I - 0x00CD6C 03:8D5C: F8        .byte $F8, $EF, $00, $00   ; 
@end:



_off028_8D60_9A:
- D 0 - I - 0x00CD70 03:8D60: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD71 03:8D61: F8        .byte $F8, $F1, $00, $F8   ; 
- D 0 - I - 0x00CD75 03:8D65: F8        .byte $F8, $F3, $00, $00   ; 
@end:



_off028_8D69_9B:
- D 0 - I - 0x00CD79 03:8D69: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD7A 03:8D6A: F8        .byte $F8, $F5, $00, $F8   ; 
- D 0 - I - 0x00CD7E 03:8D6E: F8        .byte $F8, $F7, $00, $00   ; 
@end:



_off028_8D72_9C:
- D 0 - I - 0x00CD82 03:8D72: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD83 03:8D73: F8        .byte $F8, $F9, $00, $FC   ; 
@end:



_off028_8D77_9D:
- D 0 - I - 0x00CD87 03:8D77: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD88 03:8D78: F8        .byte $F8, $FB, $00, $F8   ; 
- D 0 - I - 0x00CD8C 03:8D7C: F8        .byte $F8, $FD, $00, $00   ; 
@end:



_off028_8D80_9E:
- D 0 - I - 0x00CD90 03:8D80: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD91 03:8D81: F8        .byte $F8, $CB, $00, $F5   ; 
- D 0 - I - 0x00CD95 03:8D85: F8        .byte $F8, $CD, $00, $FD   ; 
- D 0 - I - 0x00CD99 03:8D89: F0        .byte $F0, $CF, $00, $04   ; 
@end:



_off028_8D8D_9F:
- D 0 - I - 0x00CD9D 03:8D8D: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CD9E 03:8D8E: F8        .byte $F8, $D1, $00, $F7   ; 
- D 0 - I - 0x00CDA2 03:8D92: F9        .byte $F9, $D3, $00, $FF   ; 
- D 0 - I - 0x00CDA6 03:8D96: F0        .byte $F0, $D5, $00, $05   ; 
@end:



_off028_8D9A_A0:
- D 0 - I - 0x00CDAA 03:8D9A: 0C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CDAB 03:8D9B: F8        .byte $F8, $D7, $00, $F8   ; 
- D 0 - I - 0x00CDAF 03:8D9F: F8        .byte $F8, $D9, $00, $00   ; 
- D 0 - I - 0x00CDB3 03:8DA3: F4        .byte $F4, $DB, $00, $08   ; 
@end:



_off028_8DA7_A1:
- D 0 - I - 0x00CDB7 03:8DA7: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CDB8 03:8DA8: F0        .byte $F0, $B9, $00, $F0   ; 
- D 0 - I - 0x00CDBC 03:8DAC: F0        .byte $F0, $BB, $00, $F8   ; 
- D 0 - I - 0x00CDC0 03:8DB0: F0        .byte $F0, $BD, $00, $00   ; 
- D 0 - I - 0x00CDC4 03:8DB4: F0        .byte $F0, $BF, $00, $08   ; 
- D 0 - I - 0x00CDC8 03:8DB8: 00        .byte $00, $C5, $00, $F0   ; 
- D 0 - I - 0x00CDCC 03:8DBC: 00        .byte $00, $C7, $00, $F8   ; 
- D 0 - I - 0x00CDD0 03:8DC0: 00        .byte $00, $BB, $C0, $00   ; 
- D 0 - I - 0x00CDD4 03:8DC4: 00        .byte $00, $C9, $00, $08   ; 
@end:



_off028_8DC8_A2:
- D 0 - I - 0x00CDD8 03:8DC8: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CDD9 03:8DC9: F0        .byte $F0, $C5, $80, $F0   ; 
- D 0 - I - 0x00CDDD 03:8DCD: F0        .byte $F0, $C7, $80, $F8   ; 
- D 0 - I - 0x00CDE1 03:8DD1: F0        .byte $F0, $BB, $40, $00   ; 
- D 0 - I - 0x00CDE5 03:8DD5: F0        .byte $F0, $C9, $80, $08   ; 
- D 0 - I - 0x00CDE9 03:8DD9: 00        .byte $00, $B9, $80, $F0   ; 
- D 0 - I - 0x00CDED 03:8DDD: 00        .byte $00, $BB, $80, $F8   ; 
- D 0 - I - 0x00CDF1 03:8DE1: 00        .byte $00, $BD, $80, $00   ; 
- D 0 - I - 0x00CDF5 03:8DE5: 00        .byte $00, $BF, $80, $08   ; 
@end:



_off028_8DE9_A3:
- D 0 - I - 0x00CDF9 03:8DE9: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CDFA 03:8DEA: F0        .byte $F0, $C9, $C0, $F0   ; 
- D 0 - I - 0x00CDFE 03:8DEE: F0        .byte $F0, $BB, $00, $F8   ; 
- D 0 - I - 0x00CE02 03:8DF2: F0        .byte $F0, $C7, $C0, $00   ; 
- D 0 - I - 0x00CE06 03:8DF6: F0        .byte $F0, $C5, $C0, $08   ; 
- D 0 - I - 0x00CE0A 03:8DFA: 00        .byte $00, $BF, $C0, $F0   ; 
- D 0 - I - 0x00CE0E 03:8DFE: 00        .byte $00, $BD, $C0, $F8   ; 
- D 0 - I - 0x00CE12 03:8E02: 00        .byte $00, $BB, $C0, $00   ; 
- D 0 - I - 0x00CE16 03:8E06: 00        .byte $00, $B9, $C0, $08   ; 
@end:



_off028_8E0A_A4:
- D 0 - I - 0x00CE1A 03:8E0A: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE1B 03:8E0B: F0        .byte $F0, $BF, $40, $F0   ; 
- D 0 - I - 0x00CE1F 03:8E0F: F0        .byte $F0, $BD, $40, $F8   ; 
- D 0 - I - 0x00CE23 03:8E13: F0        .byte $F0, $BB, $40, $00   ; 
- D 0 - I - 0x00CE27 03:8E17: F0        .byte $F0, $B9, $40, $08   ; 
- D 0 - I - 0x00CE2B 03:8E1B: 00        .byte $00, $C9, $40, $F0   ; 
- D 0 - I - 0x00CE2F 03:8E1F: 00        .byte $00, $BB, $80, $F8   ; 
- D 0 - I - 0x00CE33 03:8E23: 00        .byte $00, $C7, $40, $00   ; 
- D 0 - I - 0x00CE37 03:8E27: 00        .byte $00, $C5, $40, $08   ; 
@end:



_off028_8E2B_A5:
- D 0 - I - 0x00CE3B 03:8E2B: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE3C 03:8E2C: F8        .byte $F8, $B5, $00, $F8   ; 
- D 0 - I - 0x00CE40 03:8E30: F8        .byte $F8, $B5, $40, $00   ; 
@end:



_off028_8E34_A6:
- D 0 - I - 0x00CE44 03:8E34: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE45 03:8E35: F8        .byte $F8, $B7, $00, $F8   ; 
- D 0 - I - 0x00CE49 03:8E39: F8        .byte $F8, $B7, $40, $00   ; 
@end:



_off028_8E3D_A7:
- D 0 - I - 0x00CE4D 03:8E3D: 18        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE4E 03:8E3E: F0        .byte $F0, $D7, $00, $F4   ; 
- D 0 - I - 0x00CE52 03:8E42: F0        .byte $F0, $D9, $00, $FC   ; 
- D 0 - I - 0x00CE56 03:8E46: F0        .byte $F0, $DB, $00, $04   ; 
- D 0 - I - 0x00CE5A 03:8E4A: 00        .byte $00, $DB, $C0, $F4   ; 
- D 0 - I - 0x00CE5E 03:8E4E: 00        .byte $00, $D9, $C0, $FC   ; 
- D 0 - I - 0x00CE62 03:8E52: 00        .byte $00, $D7, $C0, $04   ; 
@end:



_off028_8E56_A8:
- D 0 - I - 0x00CE66 03:8E56: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE67 03:8E57: F8        .byte $F8, $D5, $00, $F8   ; 
- D 0 - I - 0x00CE6B 03:8E5B: F8        .byte $F8, $D7, $00, $00   ; 
@end:



_off028_8E5F_A9:
- D 0 - I - 0x00CE6F 03:8E5F: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE70 03:8E60: F8        .byte $F8, $D9, $00, $F8   ; 
- D 0 - I - 0x00CE74 03:8E64: F8        .byte $F8, $DB, $00, $00   ; 
@end:



_off028_8E68_AA:
- D 0 - I - 0x00CE78 03:8E68: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE79 03:8E69: F8        .byte $F8, $DD, $00, $F8   ; 
- D 0 - I - 0x00CE7D 03:8E6D: F8        .byte $F8, $DD, $40, $00   ; 
@end:



_off028_8E71_AB:
- D 0 - I - 0x00CE81 03:8E71: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE82 03:8E72: F8        .byte $F8, $DF, $00, $F8   ; 
- D 0 - I - 0x00CE86 03:8E76: F8        .byte $F8, $DF, $40, $00   ; 
@end:



_off028_8E7A_AC:
- D 0 - I - 0x00CE8A 03:8E7A: F0        .byte $F0   ; 



_off028_8E7B_AD:
- D 0 - I - 0x00CE8B 03:8E7B: F1        .byte $F1   ; 



_off028_8E7C_AE:
- D 0 - I - 0x00CE8C 03:8E7C: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE8D 03:8E7D: F8        .byte $F8, $E3, $80, $FC   ; 
@end:



_off028_8E81_AF:
- D 0 - I - 0x00CE91 03:8E81: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE92 03:8E82: F8        .byte $F8, $E1, $80, $FC   ; 
@end:



_off028_8E86_B0:
- D 0 - I - 0x00CE96 03:8E86: F4        .byte $F4   ; 



_off028_8E87_B1:
- D 0 - I - 0x00CE97 03:8E87: F5        .byte $F5   ; 



_off028_8E88_B2:
- D 0 - I - 0x00CE98 03:8E88: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE99 03:8E89: F8        .byte $F8, $EB, $80, $FC   ; 
@end:



_off028_8E8D_B3:
- D 0 - I - 0x00CE9D 03:8E8D: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CE9E 03:8E8E: F8        .byte $F8, $E9, $80, $FC   ; 
@end:



_off028_8E92_B4:
- D 0 - I - 0x00CEA2 03:8E92: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CEA3 03:8E93: F8        .byte $F8, $D7, $00, $F8   ; 
- D 0 - I - 0x00CEA7 03:8E97: F8        .byte $F8, $D7, $40, $00   ; 
@end:



_off028_8E9B_B5:
- D 0 - I - 0x00CEAB 03:8E9B: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CEAC 03:8E9C: F8        .byte $F8, $D9, $00, $F8   ; 
- D 0 - I - 0x00CEB0 03:8EA0: F8        .byte $F8, $D9, $40, $00   ; 
@end:



_off028_8EA4_B6:
- D 0 - I - 0x00CEB4 03:8EA4: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CEB5 03:8EA5: F8        .byte $F8, $DB, $00, $F8   ; 
- D 0 - I - 0x00CEB9 03:8EA9: F8        .byte $F8, $DB, $40, $00   ; 
@end:



_off028_8EAD_B7:
- D 0 - I - 0x00CEBD 03:8EAD: 08        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CEBE 03:8EAE: F8        .byte $F8, $DD, $00, $F8   ; 
- D 0 - I - 0x00CEC2 03:8EB2: F8        .byte $F8, $DD, $40, $00   ; 
@end:



_off028_8EB6_B8:
- D 0 - I - 0x00CEC6 03:8EB6: 2C        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CEC7 03:8EB7: 00        .byte $00, $CB, $00, $00   ; 
- D 0 - I - 0x00CECB 03:8EBB: 10        .byte $10, $CD, $00, $00   ; 
- D 0 - I - 0x00CECF 03:8EBF: 20        .byte $20, $CF, $00, $00   ; 
- D 0 - I - 0x00CED3 03:8EC3: 2E        .byte $2E, $D1, $00, $08   ; 
- D 0 - I - 0x00CED7 03:8EC7: 2E        .byte $2E, $D3, $00, $10   ; 
- D 0 - I - 0x00CEDB 03:8ECB: 2E        .byte $2E, $D5, $00, $18   ; 
- D 0 - I - 0x00CEDF 03:8ECF: 2E        .byte $2E, $D7, $00, $20   ; 
- D 0 - I - 0x00CEE3 03:8ED3: 30        .byte $30, $DB, $00, $28   ; 
- D 0 - I - 0x00CEE7 03:8ED7: 30        .byte $30, $DD, $00, $30   ; 
- D 0 - I - 0x00CEEB 03:8EDB: 30        .byte $30, $DF, $00, $38   ; 
- D 0 - I - 0x00CEEF 03:8EDF: 2E        .byte $2E, $E1, $00, $40   ; 
@end:



_off028_8EE3_B9:
- D 0 - I - 0x00CEF3 03:8EE3: 04        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CEF4 03:8EE4: 00        .byte $00, $D9, $00, $00   ; 
@end:



_off028_8EE8_BA:
- D 0 - I - 0x00CEF8 03:8EE8: 24        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CEF9 03:8EE9: F5        .byte $F5, $C1, $00, $E7   ; 
- D 0 - I - 0x00CEFD 03:8EED: F0        .byte $F0, $C3, $00, $EF   ; 
- D 0 - I - 0x00CF01 03:8EF1: F0        .byte $F0, $C5, $00, $F7   ; 
- D 0 - I - 0x00CF05 03:8EF5: F0        .byte $F0, $C7, $00, $FF   ; 
- D 0 - I - 0x00CF09 03:8EF9: F0        .byte $F0, $C9, $00, $07   ; 
- D 0 - I - 0x00CF0D 03:8EFD: 00        .byte $00, $CB, $00, $EF   ; 
- D 0 - I - 0x00CF11 03:8F01: 00        .byte $00, $CD, $00, $F7   ; 
- D 0 - I - 0x00CF15 03:8F05: 00        .byte $00, $CF, $00, $FF   ; 
- D 0 - I - 0x00CF19 03:8F09: 00        .byte $00, $D1, $00, $07   ; 
@end:



_off028_8F0D_BB:
- D 0 - I - 0x00CF1D 03:8F0D: 20        .byte @end - * - $01   ; total data size
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00CF1E 03:8F0E: F8        .byte $F8, $D3, $00, $E5   ; 
- D 0 - I - 0x00CF22 03:8F12: F8        .byte $F8, $D5, $00, $ED   ; 
- D 0 - I - 0x00CF26 03:8F16: F0        .byte $F0, $D7, $00, $F5   ; 
- D 0 - I - 0x00CF2A 03:8F1A: F0        .byte $F0, $D9, $00, $FD   ; 
- D 0 - I - 0x00CF2E 03:8F1E: F0        .byte $F0, $DB, $00, $05   ; 
- D 0 - I - 0x00CF32 03:8F22: 00        .byte $00, $DD, $00, $F5   ; 
- D 0 - I - 0x00CF36 03:8F26: 00        .byte $00, $DF, $00, $FD   ; 
- D 0 - I - 0x00CF3A 03:8F2A: 00        .byte $00, $E1, $00, $05   ; 
@end:



_off028_8F2E_BC:
_off028_8F2E_BD:
_off028_8F2E_BE:
_off028_8F2E_BF:
_off028_8F2E_C0:
_off028_8F2E_C1:
_off028_8F2E_C2:
_off028_8F2E_C3:
_off028_8F2E_C4:
_off028_8F2E_C5:
_off028_8F2E_C6:
_off028_8F2E_C7:
_off028_8F2E_C8:
_off028_8F2E_C9:
_off028_8F2E_CA:
_off028_8F2E_CB:
_off028_8F2E_CC:
_off028_8F2E_CD:
_off028_8F2E_CE:
_off028_8F2E_CF:
_off028_8F2E_D0:
_off028_8F2E_D1:
_off028_8F2E_D2:
_off028_8F2E_D3:
_off028_8F2E_D4:
_off028_8F2E_D5:
_off028_8F2E_D6:
_off028_8F2E_D7:
_off028_8F2E_D8:
_off028_8F2E_D9:
_off028_8F2E_DA:
_off028_8F2E_DB:
_off028_8F2E_DC:
_off028_8F2E_DD:
_off028_8F2E_DE:
_off028_8F2E_DF:
_off028_8F2E_E0:
_off028_8F2E_E1:
_off028_8F2E_E2:
_off028_8F2E_E3:
_off028_8F2E_E4:
_off028_8F2E_E5:
_off028_8F2E_E6:
_off028_8F2E_E7:
_off028_8F2E_E8:
_off028_8F2E_E9:
_off028_8F2E_EA:
_off028_8F2E_EB:
_off028_8F2E_EC:
_off028_8F2E_ED:
_off028_8F2E_EE:
_off028_8F2E_EF:
_off028_8F2E_F0:
_off028_8F2E_F1:
_off028_8F2E_F2:
_off028_8F2E_F3:
_off028_8F2E_F4:
_off028_8F2E_F5:
_off028_8F2E_F6:
_off028_8F2E_F7:
_off028_8F2E_F8:
_off028_8F2E_F9:
_off028_8F2E_FA:
_off028_8F2E_FB:
_off028_8F2E_FC:
_off028_8F2E_FD:
_off028_8F2E_FE:
_off028_8F2E_FF:
- - - - - - 0x00CF3E 03:8F2E: FF        .byte $FF   ; end token

 



tbl_8F31_игроки_US:
- D 0 - - - 0x00CF41 03:8F31: 2F 90     .word _off020_902F_01
- D 0 - - - 0x00CF43 03:8F33: 44 90     .word _off020_9044_02
- D 0 - - - 0x00CF45 03:8F35: 59 90     .word _off020_9059_03
- D 0 - - - 0x00CF47 03:8F37: 6E 90     .word _off020_906E_04
- D 0 - - - 0x00CF49 03:8F39: 7A 90     .word _off020_907A_05
- D 0 - - - 0x00CF4B 03:8F3B: 86 90     .word _off020_9086_06
- D 0 - - - 0x00CF4D 03:8F3D: 96 90     .word _off020_9096_07
- D 0 - - - 0x00CF4F 03:8F3F: A6 90     .word _off020_90A6_08
- D 0 - - - 0x00CF51 03:8F41: B6 90     .word _off020_90B6_09
- D 0 - - - 0x00CF53 03:8F43: C6 90     .word _off020_90C6_0A
- D 0 - - - 0x00CF55 03:8F45: D6 90     .word _off020_90D6_0B
- D 0 - - - 0x00CF57 03:8F47: E6 90     .word _off020_90E6_0C
- D 0 - - - 0x00CF59 03:8F49: F2 90     .word _off020_90F2_0D
- D 0 - - - 0x00CF5B 03:8F4B: FE 90     .word _off020_90FE_0E
- D 0 - - - 0x00CF5D 03:8F4D: 0A 91     .word _off020_910A_0F
- D 0 - - - 0x00CF5F 03:8F4F: 16 91     .word _off020_9116_10
- D 0 - - - 0x00CF61 03:8F51: 22 91     .word _off020_9122_11
- D 0 - - - 0x00CF63 03:8F53: 32 91     .word _off020_9132_12
- D 0 - - - 0x00CF65 03:8F55: 42 91     .word _off020_9142_13
- D 0 - - - 0x00CF67 03:8F57: 52 91     .word _off020_9152_14
- D 0 - - - 0x00CF69 03:8F59: 62 91     .word _off020_9162_15
- D 0 - - - 0x00CF6B 03:8F5B: 72 91     .word _off020_9172_16
- D 0 - - - 0x00CF6D 03:8F5D: 83 91     .word _off020_9183_17
- D 0 - - - 0x00CF6F 03:8F5F: 94 91     .word _off020_9194_18
- D 0 - - - 0x00CF71 03:8F61: A4 91     .word _off020_91A4_19
- D 0 - - - 0x00CF73 03:8F63: B4 91     .word _off020_91B4_1A
- D 0 - - - 0x00CF75 03:8F65: C5 91     .word _off020_91C5_1B
- D 0 - - - 0x00CF77 03:8F67: CE 91     .word _off020_91CE_1C
- D 0 - - - 0x00CF79 03:8F69: DF 91     .word _off020_91DF_1D
- D 0 - - - 0x00CF7B 03:8F6B: E8 91     .word _off020_91E8_1E
- D 0 - - - 0x00CF7D 03:8F6D: F9 91     .word _off020_91F9_1F
- D 0 - - - 0x00CF7F 03:8F6F: 06 92     .word _off020_9206_20
- D 0 - - - 0x00CF81 03:8F71: 17 92     .word _off020_9217_21
- D 0 - - - 0x00CF83 03:8F73: 24 92     .word _off020_9224_22
- D 0 - - - 0x00CF85 03:8F75: 35 92     .word _off020_9235_23
- D 0 - - - 0x00CF87 03:8F77: 4A 92     .word _off020_924A_24
- D 0 - - - 0x00CF89 03:8F79: 5F 92     .word _off020_925F_25
- - - - - - 0x00CF8B 03:8F7B: 70 92     .word _off020_9270_26
- D 0 - - - 0x00CF8D 03:8F7D: 70 92     .word _off020_9270_27
- - - - - - 0x00CF8F 03:8F7F: 79 92     .word _off020_9279_28
- D 0 - - - 0x00CF91 03:8F81: 79 92     .word _off020_9279_29
- D 0 - - - 0x00CF93 03:8F83: 89 92     .word _off020_9289_2A
- D 0 - - - 0x00CF95 03:8F85: 95 92     .word _off020_9295_2B
- D 0 - - - 0x00CF97 03:8F87: A5 92     .word _off020_92A5_2C
- D 0 - - - 0x00CF99 03:8F89: B6 92     .word _off020_92B6_2D
- D 0 - - - 0x00CF9B 03:8F8B: C7 92     .word _off020_92C7_2E
- D 0 - - - 0x00CF9D 03:8F8D: D3 92     .word _off020_92D3_2F
- D 0 - - - 0x00CF9F 03:8F8F: E4 92     .word _off020_92E4_30
- D 0 - - - 0x00CFA1 03:8F91: F1 92     .word _off020_92F1_31
- D 0 - - - 0x00CFA3 03:8F93: FD 92     .word _off020_92FD_32
- D 0 - - - 0x00CFA5 03:8F95: 0E 93     .word _off020_930E_33
- D 0 - - - 0x00CFA7 03:8F97: 1B 93     .word _off020_931B_34
- D 0 - - - 0x00CFA9 03:8F99: 23 93     .word _off020_9323_35
- D 0 - - - 0x00CFAB 03:8F9B: 34 93     .word _off020_9334_36
- D 0 - - - 0x00CFAD 03:8F9D: 41 93     .word _off020_9341_37
- D 0 - - - 0x00CFAF 03:8F9F: 4D 93     .word _off020_934D_38
- D 0 - - - 0x00CFB1 03:8FA1: 5A 93     .word _off020_935A_39
- D 0 - - - 0x00CFB3 03:8FA3: 67 93     .word _off020_9367_3A
- D 0 - - - 0x00CFB5 03:8FA5: 6F 93     .word _off020_936F_3B
- D 0 - - - 0x00CFB7 03:8FA7: 80 93     .word _off020_9380_3C
- D 0 - - - 0x00CFB9 03:8FA9: 91 93     .word _off020_9391_3D
- - - - - - 0x00CFBB 03:8FAB: A6 93     .word _off020_93A6_3E
- - - - - - 0x00CFBD 03:8FAD: A6 93     .word _off020_93A6_3F
- - - - - - 0x00CFBF 03:8FAF: A6 93     .word _off020_93A6_40
- - - - - - 0x00CFC1 03:8FB1: A6 93     .word _off020_93A6_41
- - - - - - 0x00CFC3 03:8FB3: A6 93     .word _off020_93A6_42
- - - - - - 0x00CFC5 03:8FB5: A6 93     .word _off020_93A6_43
- - - - - - 0x00CFC7 03:8FB7: A6 93     .word _off020_93A6_44
- - - - - - 0x00CFC9 03:8FB9: A6 93     .word _off020_93A6_45
- - - - - - 0x00CFCB 03:8FBB: A6 93     .word _off020_93A6_46
- - - - - - 0x00CFCD 03:8FBD: A6 93     .word _off020_93A6_47
- - - - - - 0x00CFCF 03:8FBF: A6 93     .word _off020_93A6_48
- - - - - - 0x00CFD1 03:8FC1: A6 93     .word _off020_93A6_49
- - - - - - 0x00CFD3 03:8FC3: A6 93     .word _off020_93A6_4A
- - - - - - 0x00CFD5 03:8FC5: A6 93     .word _off020_93A6_4B
- - - - - - 0x00CFD7 03:8FC7: A6 93     .word _off020_93A6_4C
- - - - - - 0x00CFD9 03:8FC9: A6 93     .word _off020_93A6_4D
- - - - - - 0x00CFDB 03:8FCB: A6 93     .word _off020_93A6_4E
- - - - - - 0x00CFDD 03:8FCD: A6 93     .word _off020_93A6_4F
- - - - - - 0x00CFDF 03:8FCF: A6 93     .word _off020_93A6_50
- - - - - - 0x00CFE1 03:8FD1: A6 93     .word _off020_93A6_51
- - - - - - 0x00CFE3 03:8FD3: A6 93     .word _off020_93A6_52
- - - - - - 0x00CFE5 03:8FD5: A6 93     .word _off020_93A6_53
- - - - - - 0x00CFE7 03:8FD7: A6 93     .word _off020_93A6_54
- - - - - - 0x00CFE9 03:8FD9: A6 93     .word _off020_93A6_55
- - - - - - 0x00CFEB 03:8FDB: A6 93     .word _off020_93A6_56
- - - - - - 0x00CFED 03:8FDD: A6 93     .word _off020_93A6_57
- - - - - - 0x00CFEF 03:8FDF: A6 93     .word _off020_93A6_58
- - - - - - 0x00CFF1 03:8FE1: A6 93     .word _off020_93A6_59
- - - - - - 0x00CFF3 03:8FE3: A6 93     .word _off020_93A6_5A
- - - - - - 0x00CFF5 03:8FE5: A6 93     .word _off020_93A6_5B
- - - - - - 0x00CFF7 03:8FE7: A6 93     .word _off020_93A6_5C
- - - - - - 0x00CFF9 03:8FE9: A6 93     .word _off020_93A6_5D
- - - - - - 0x00CFFB 03:8FEB: A6 93     .word _off020_93A6_5E
- - - - - - 0x00CFFD 03:8FED: A6 93     .word _off020_93A6_5F
- - - - - - 0x00CFFF 03:8FEF: A6 93     .word _off020_93A6_60
- - - - - - 0x00D001 03:8FF1: A6 93     .word _off020_93A6_61
- - - - - - 0x00D003 03:8FF3: A6 93     .word _off020_93A6_62
- - - - - - 0x00D005 03:8FF5: A6 93     .word _off020_93A6_63
- - - - - - 0x00D007 03:8FF7: A6 93     .word _off020_93A6_64
- - - - - - 0x00D009 03:8FF9: A6 93     .word _off020_93A6_65
- - - - - - 0x00D00B 03:8FFB: A6 93     .word _off020_93A6_66
- - - - - - 0x00D00D 03:8FFD: A6 93     .word _off020_93A6_67
- - - - - - 0x00D00F 03:8FFF: A6 93     .word _off020_93A6_68
- - - - - - 0x00D011 03:9001: A6 93     .word _off020_93A6_69
- - - - - - 0x00D013 03:9003: A6 93     .word _off020_93A6_6A
- - - - - - 0x00D015 03:9005: A6 93     .word _off020_93A6_6B
- - - - - - 0x00D017 03:9007: A6 93     .word _off020_93A6_6C
- - - - - - 0x00D019 03:9009: A6 93     .word _off020_93A6_6D
- - - - - - 0x00D01B 03:900B: A6 93     .word _off020_93A6_6E
- - - - - - 0x00D01D 03:900D: A6 93     .word _off020_93A6_6F
- - - - - - 0x00D01F 03:900F: A6 93     .word _off020_93A6_70
- - - - - - 0x00D021 03:9011: A6 93     .word _off020_93A6_71
- - - - - - 0x00D023 03:9013: A6 93     .word _off020_93A6_72
- - - - - - 0x00D025 03:9015: A6 93     .word _off020_93A6_73
- - - - - - 0x00D027 03:9017: A6 93     .word _off020_93A6_74
- - - - - - 0x00D029 03:9019: A6 93     .word _off020_93A6_75
- - - - - - 0x00D02B 03:901B: A6 93     .word _off020_93A6_76
- - - - - - 0x00D02D 03:901D: A6 93     .word _off020_93A6_77
- - - - - - 0x00D02F 03:901F: A6 93     .word _off020_93A6_78
- - - - - - 0x00D031 03:9021: A6 93     .word _off020_93A6_79
- - - - - - 0x00D033 03:9023: A6 93     .word _off020_93A6_7A
- - - - - - 0x00D035 03:9025: A6 93     .word _off020_93A6_7B
- - - - - - 0x00D037 03:9027: A6 93     .word _off020_93A6_7C
- - - - - - 0x00D039 03:9029: A6 93     .word _off020_93A6_7D
- - - - - - 0x00D03B 03:902B: A6 93     .word _off020_93A6_7E
- - - - - - 0x00D03D 03:902D: A6 93     .word _off020_93A6_7F



_off020_902F_01:
- D 0 - I - 0x00D03F 03:902F: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D040 03:9030: F0        .byte $F0, $03, $01, $FA   ; 01 
- D 0 - I - 0x00D044 03:9034: EF        .byte $EF, $05, $01, $02   ; 02 
ofs_9038_04:
ofs_9038_06:
ofs_9038_09:
ofs_9038_0C:
ofs_9038_0F:
ofs_9038_11:
ofs_9038_14:
- D 0 - I - 0x00D048 03:9038: FF        .byte $FF, $0F, $00, $F6   ; 03 (04) 
- D 0 - I - 0x00D04C 03:903C: 00        .byte $00, $11, $00, $FE   ; 04 (05) 
- D 0 - I - 0x00D050 03:9040: 0F        .byte $0F, $13, $00, $F4   ; 05 (06) 



_off020_9044_02:
- D 0 - I - 0x00D054 03:9044: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D055 03:9045: F1        .byte $F1, $07, $01, $FC   ; 01 
- D 0 - I - 0x00D059 03:9049: F0        .byte $F0, $09, $01, $04   ; 02 
ofs_904D_07:
ofs_904D_0D:
ofs_904D_12:
- D 0 - I - 0x00D05D 03:904D: 00        .byte $00, $15, $00, $F6   ; 03 (04) 
- D 0 - I - 0x00D061 03:9051: 01        .byte $01, $17, $00, $FE   ; 04 (05) 
- D 0 - I - 0x00D065 03:9055: 11        .byte $11, $13, $00, $01   ; 05 (06) 



_off020_9059_03:
- D 0 - I - 0x00D069 03:9059: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D06A 03:905A: EF        .byte $EF, $0B, $01, $F8   ; 01 
- D 0 - I - 0x00D06E 03:905E: F0        .byte $F0, $0D, $01, $00   ; 02 
ofs_9062_05:
ofs_9062_08:
ofs_9062_0A:
ofs_9062_0B:
ofs_9062_0E:
ofs_9062_10:
ofs_9062_13:
ofs_9062_15:
ofs_9062_18:
ofs_9062_19:
- D 0 - I - 0x00D072 03:9062: FF        .byte $FF, $19, $00, $F9   ; 03 (04) 
- D 0 - I - 0x00D076 03:9066: 00        .byte $00, $1B, $00, $01   ; 04 (05) 
- D 0 - I - 0x00D07A 03:906A: 0F        .byte $0F, $13, $00, $FB   ; 05 (06) 



_off020_906E_04:
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D07E 03:906E: 05        .byte $05   ; counter
- D 0 - I - 0x00D07F 03:906F: EF        .byte $EF, $0B, $01, $F8   ; 01 
- D 0 - I - 0x00D083 03:9073: F0        .byte $F0, $0D, $01, $00   ; 02 
- D 0 - I - 0x00D087 03:9077: 80        .byte $80   ; jump
- D 0 - I - 0x00D088 03:9078: 38 90     .word ofs_9038_04



_off020_907A_05:
- D 0 - I - 0x00D08A 03:907A: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D08B 03:907B: F0        .byte $F0, $03, $01, $F9   ; 01 
- D 0 - I - 0x00D08F 03:907F: EF        .byte $EF, $05, $01, $01   ; 02 
- D 0 - I - 0x00D093 03:9083: 80        .byte $80   ; jump
- D 0 - I - 0x00D094 03:9084: 62 90     .word ofs_9062_05



_off020_9086_06:
- D 0 - I - 0x00D096 03:9086: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D097 03:9087: F0        .byte $F0, $1D, $01, $F7   ; 01 
- D 0 - I - 0x00D09B 03:908B: F0        .byte $F0, $1F, $01, $FF   ; 02 
- D 0 - I - 0x00D09F 03:908F: EF        .byte $EF, $21, $01, $07   ; 03 
- D 0 - I - 0x00D0A3 03:9093: 80        .byte $80   ; jump
- D 0 - I - 0x00D0A4 03:9094: 38 90     .word ofs_9038_06



_off020_9096_07:
- D 0 - I - 0x00D0A6 03:9096: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D0A7 03:9097: F1        .byte $F1, $1D, $01, $F7   ; 01 
- D 0 - I - 0x00D0AB 03:909B: F1        .byte $F1, $1F, $01, $FF   ; 02 
- D 0 - I - 0x00D0AF 03:909F: F0        .byte $F0, $21, $01, $07   ; 03 
- D 0 - I - 0x00D0B3 03:90A3: 80        .byte $80   ; jump
- D 0 - I - 0x00D0B4 03:90A4: 4D 90     .word ofs_904D_07



_off020_90A6_08:
- D 0 - I - 0x00D0B6 03:90A6: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D0B7 03:90A7: F0        .byte $F0, $1D, $01, $F7   ; 01 
- D 0 - I - 0x00D0BB 03:90AB: F0        .byte $F0, $1F, $01, $FF   ; 02 
- D 0 - I - 0x00D0BF 03:90AF: EF        .byte $EF, $21, $01, $07   ; 03 
- D 0 - I - 0x00D0C3 03:90B3: 80        .byte $80   ; jump
- D 0 - I - 0x00D0C4 03:90B4: 62 90     .word ofs_9062_08



_off020_90B6_09:
- D 0 - I - 0x00D0C6 03:90B6: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D0C7 03:90B7: F0        .byte $F0, $1D, $01, $F7   ; 01 
- D 0 - I - 0x00D0CB 03:90BB: F0        .byte $F0, $1F, $01, $FF   ; 02 
- D 0 - I - 0x00D0CF 03:90BF: EF        .byte $EF, $21, $01, $07   ; 03 
- D 0 - I - 0x00D0D3 03:90C3: 80        .byte $80   ; jump
- D 0 - I - 0x00D0D4 03:90C4: 38 90     .word ofs_9038_09



_off020_90C6_0A:
- D 0 - I - 0x00D0D6 03:90C6: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D0D7 03:90C7: F0        .byte $F0, $1D, $01, $F7   ; 01 
- D 0 - I - 0x00D0DB 03:90CB: F0        .byte $F0, $1F, $01, $FF   ; 02 
- D 0 - I - 0x00D0DF 03:90CF: EF        .byte $EF, $21, $01, $07   ; 03 
- D 0 - I - 0x00D0E3 03:90D3: 80        .byte $80   ; jump
- D 0 - I - 0x00D0E4 03:90D4: 62 90     .word ofs_9062_0A



_off020_90D6_0B:
- D 0 - I - 0x00D0E6 03:90D6: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D0E7 03:90D7: F1        .byte $F1, $1D, $01, $F7   ; 01 
- D 0 - I - 0x00D0EB 03:90DB: F1        .byte $F1, $1F, $01, $FF   ; 02 
- D 0 - I - 0x00D0EF 03:90DF: F0        .byte $F0, $21, $01, $07   ; 03 
- D 0 - I - 0x00D0F3 03:90E3: 80        .byte $80   ; jump
- D 0 - I - 0x00D0F4 03:90E4: 62 90     .word ofs_9062_0B



_off020_90E6_0C:
- D 0 - I - 0x00D0F6 03:90E6: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D0F7 03:90E7: F0        .byte $F0, $2B, $01, $FA   ; 01 
- D 0 - I - 0x00D0FB 03:90EB: EF        .byte $EF, $2D, $01, $02   ; 02 
- D 0 - I - 0x00D0FF 03:90EF: 80        .byte $80   ; jump
- D 0 - I - 0x00D100 03:90F0: 38 90     .word ofs_9038_0C



_off020_90F2_0D:
- D 0 - I - 0x00D102 03:90F2: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D103 03:90F3: F1        .byte $F1, $2B, $01, $FA   ; 01 
- D 0 - I - 0x00D107 03:90F7: F0        .byte $F0, $2D, $01, $02   ; 02 
- D 0 - I - 0x00D10B 03:90FB: 80        .byte $80   ; jump
- D 0 - I - 0x00D10C 03:90FC: 4D 90     .word ofs_904D_0D



_off020_90FE_0E:
- D 0 - I - 0x00D10E 03:90FE: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D10F 03:90FF: F0        .byte $F0, $2B, $01, $FA   ; 01 
- D 0 - I - 0x00D113 03:9103: EF        .byte $EF, $2D, $01, $02   ; 02 
- D 0 - I - 0x00D117 03:9107: 80        .byte $80   ; jump
- D 0 - I - 0x00D118 03:9108: 62 90     .word ofs_9062_0E



_off020_910A_0F:
- D 0 - I - 0x00D11A 03:910A: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D11B 03:910B: F0        .byte $F0, $2B, $01, $FA   ; 01 
- D 0 - I - 0x00D11F 03:910F: EF        .byte $EF, $2D, $01, $02   ; 02 
- D 0 - I - 0x00D123 03:9113: 80        .byte $80   ; jump
- D 0 - I - 0x00D124 03:9114: 38 90     .word ofs_9038_0F



_off020_9116_10:
- D 0 - I - 0x00D126 03:9116: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D127 03:9117: F0        .byte $F0, $2B, $01, $FA   ; 01 
- D 0 - I - 0x00D12B 03:911B: EF        .byte $EF, $2D, $01, $02   ; 02 
- D 0 - I - 0x00D12F 03:911F: 80        .byte $80   ; jump
- D 0 - I - 0x00D130 03:9120: 62 90     .word ofs_9062_10



_off020_9122_11:
- D 0 - I - 0x00D132 03:9122: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D133 03:9123: EF        .byte $EF, $2F, $01, $F6   ; 01 
- D 0 - I - 0x00D137 03:9127: F0        .byte $F0, $31, $01, $FE   ; 02 
- D 0 - I - 0x00D13B 03:912B: F8        .byte $F8, $33, $01, $03   ; 03 
- D 0 - I - 0x00D13F 03:912F: 80        .byte $80   ; jump
- D 0 - I - 0x00D140 03:9130: 38 90     .word ofs_9038_11



_off020_9132_12:
- D 0 - I - 0x00D142 03:9132: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D143 03:9133: F0        .byte $F0, $2F, $01, $F6   ; 01 
- D 0 - I - 0x00D147 03:9137: F1        .byte $F1, $31, $01, $FE   ; 02 
- D 0 - I - 0x00D14B 03:913B: F9        .byte $F9, $33, $01, $03   ; 03 
- D 0 - I - 0x00D14F 03:913F: 80        .byte $80   ; jump
- D 0 - I - 0x00D150 03:9140: 4D 90     .word ofs_904D_12



_off020_9142_13:
- D 0 - I - 0x00D152 03:9142: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D153 03:9143: EF        .byte $EF, $2F, $01, $F6   ; 01 
- D 0 - I - 0x00D157 03:9147: F0        .byte $F0, $31, $01, $FE   ; 02 
- D 0 - I - 0x00D15B 03:914B: F8        .byte $F8, $33, $01, $03   ; 03 
- D 0 - I - 0x00D15F 03:914F: 80        .byte $80   ; jump
- D 0 - I - 0x00D160 03:9150: 62 90     .word ofs_9062_13



_off020_9152_14:
- D 0 - I - 0x00D162 03:9152: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D163 03:9153: EF        .byte $EF, $2F, $01, $F6   ; 01 
- D 0 - I - 0x00D167 03:9157: F0        .byte $F0, $31, $01, $FE   ; 02 
- D 0 - I - 0x00D16B 03:915B: F8        .byte $F8, $33, $01, $03   ; 03 
- D 0 - I - 0x00D16F 03:915F: 80        .byte $80   ; jump
- D 0 - I - 0x00D170 03:9160: 38 90     .word ofs_9038_14



_off020_9162_15:
- D 0 - I - 0x00D172 03:9162: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D173 03:9163: EF        .byte $EF, $2F, $01, $F6   ; 01 
- D 0 - I - 0x00D177 03:9167: F0        .byte $F0, $31, $01, $FE   ; 02 
- D 0 - I - 0x00D17B 03:916B: F8        .byte $F8, $33, $01, $03   ; 03 
- D 0 - I - 0x00D17F 03:916F: 80        .byte $80   ; jump
- D 0 - I - 0x00D180 03:9170: 62 90     .word ofs_9062_15



_off020_9172_16:
- D 0 - I - 0x00D182 03:9172: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D183 03:9173: 02        .byte $02, $23, $00, $F0   ; 01 
- D 0 - I - 0x00D187 03:9177: 02        .byte $02, $25, $00, $F8   ; 02 
- D 0 - I - 0x00D18B 03:917B: 02        .byte $02, $27, $01, $00   ; 03 
- D 0 - I - 0x00D18F 03:917F: 02        .byte $02, $29, $01, $08   ; 04 



_off020_9183_17:
- D 0 - I - 0x00D193 03:9183: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D194 03:9184: 03        .byte $03, $23, $00, $F0   ; 01 
- D 0 - I - 0x00D198 03:9188: 03        .byte $03, $25, $00, $F8   ; 02 
- D 0 - I - 0x00D19C 03:918C: 03        .byte $03, $27, $01, $00   ; 03 
- D 0 - I - 0x00D1A0 03:9190: 03        .byte $03, $29, $01, $08   ; 04 



_off020_9194_18:
- D 0 - I - 0x00D1A4 03:9194: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D1A5 03:9195: E0        .byte $E0, $35, $01, $FF   ; 01 
- D 0 - I - 0x00D1A9 03:9199: EF        .byte $EF, $37, $01, $F6   ; 02 
- D 0 - I - 0x00D1AD 03:919D: F0        .byte $F0, $39, $01, $FE   ; 03 
- D 0 - I - 0x00D1B1 03:91A1: 80        .byte $80   ; jump
- D 0 - I - 0x00D1B2 03:91A2: 62 90     .word ofs_9062_18



_off020_91A4_19:
- D 0 - I - 0x00D1B4 03:91A4: 06        .byte $06   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D1B5 03:91A5: E1        .byte $E1, $35, $01, $FF   ; 01 
- D 0 - I - 0x00D1B9 03:91A9: F0        .byte $F0, $37, $01, $F6   ; 02 
- D 0 - I - 0x00D1BD 03:91AD: F1        .byte $F1, $39, $01, $FE   ; 03 
- D 0 - I - 0x00D1C1 03:91B1: 80        .byte $80   ; jump
- D 0 - I - 0x00D1C2 03:91B2: 62 90     .word ofs_9062_19



_off020_91B4_1A:
- D 0 - I - 0x00D1C4 03:91B4: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D1C5 03:91B5: F1        .byte $F1, $3B, $01, $F8   ; 01 
- D 0 - I - 0x00D1C9 03:91B9: F1        .byte $F1, $3D, $01, $00   ; 02 
- D 0 - I - 0x00D1CD 03:91BD: 01        .byte $01, $3F, $00, $F8   ; 03 
- D 0 - I - 0x00D1D1 03:91C1: 01        .byte $01, $41, $00, $00   ; 04 



_off020_91C5_1B:
- D 0 - I - 0x00D1D5 03:91C5: 02        .byte $02   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D1D6 03:91C6: F8        .byte $F8, $43, $00, $F7   ; 01 
- D 0 - I - 0x00D1DA 03:91CA: F8        .byte $F8, $45, $01, $FF   ; 02 



_off020_91CE_1C:
- D 0 - I - 0x00D1DE 03:91CE: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D1DF 03:91CF: EF        .byte $EF, $41, $C0, $F8   ; 01 
- D 0 - I - 0x00D1E3 03:91D3: EF        .byte $EF, $3F, $C0, $00   ; 02 
- D 0 - I - 0x00D1E7 03:91D7: FF        .byte $FF, $3D, $C1, $F8   ; 03 
- D 0 - I - 0x00D1EB 03:91DB: FF        .byte $FF, $3B, $C1, $00   ; 04 



_off020_91DF_1D:
- D 0 - I - 0x00D1EF 03:91DF: 02        .byte $02   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D1F0 03:91E0: F8        .byte $F8, $45, $C1, $F9   ; 01 
- D 0 - I - 0x00D1F4 03:91E4: F8        .byte $F8, $43, $C0, $01   ; 02 



_off020_91E8_1E:
- D 0 - I - 0x00D1F8 03:91E8: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D1F9 03:91E9: F2        .byte $F2, $47, $01, $F6   ; 01 
- D 0 - I - 0x00D1FD 03:91ED: F2        .byte $F2, $49, $01, $FE   ; 02 
- D 0 - I - 0x00D201 03:91F1: 02        .byte $02, $4B, $00, $F8   ; 03 
- D 0 - I - 0x00D205 03:91F5: 02        .byte $02, $4D, $00, $00   ; 04 



_off020_91F9_1F:
- D 0 - I - 0x00D209 03:91F9: 03        .byte $03   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D20A 03:91FA: FB        .byte $FB, $4F, $01, $F5   ; 01 
- D 0 - I - 0x00D20E 03:91FE: FB        .byte $FB, $51, $00, $FD   ; 02 
- D 0 - I - 0x00D212 03:9202: F9        .byte $F9, $53, $00, $05   ; 03 



_off020_9206_20:
- D 0 - I - 0x00D216 03:9206: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D217 03:9207: F4        .byte $F4, $4D, $C0, $F8   ; 01 
- D 0 - I - 0x00D21B 03:920B: F4        .byte $F4, $4B, $C0, $00   ; 02 
- D 0 - I - 0x00D21F 03:920F: 04        .byte $04, $49, $C1, $FA   ; 03 
- D 0 - I - 0x00D223 03:9213: 04        .byte $04, $47, $C1, $02   ; 04 



_off020_9217_21:
- D 0 - I - 0x00D227 03:9217: 03        .byte $03   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D228 03:9218: FD        .byte $FD, $53, $C0, $F3   ; 01 
- D 0 - I - 0x00D22C 03:921C: FB        .byte $FB, $51, $C0, $FB   ; 02 
- D 0 - I - 0x00D230 03:9220: FB        .byte $FB, $4F, $C1, $03   ; 03 



_off020_9224_22:
- D 0 - I - 0x00D234 03:9224: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D235 03:9225: 03        .byte $03, $A5, $01, $F0   ; 01 
- D 0 - I - 0x00D239 03:9229: 03        .byte $03, $A7, $01, $F8   ; 02 
- D 0 - I - 0x00D23D 03:922D: 03        .byte $03, $5B, $00, $00   ; 03 
- D 0 - I - 0x00D241 03:9231: 03        .byte $03, $6F, $00, $08   ; 04 



_off020_9235_23:
- D 0 - I - 0x00D245 03:9235: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D246 03:9236: F8        .byte $F8, $1D, $01, $F7   ; 01 
- D 0 - I - 0x00D24A 03:923A: F8        .byte $F8, $1F, $01, $FF   ; 02 
- D 0 - I - 0x00D24E 03:923E: F7        .byte $F7, $21, $01, $07   ; 03 
- D 0 - I - 0x00D252 03:9242: 08        .byte $08, $E5, $00, $F7   ; 04 
- D 0 - I - 0x00D256 03:9246: 07        .byte $07, $E7, $00, $FF   ; 05 



_off020_924A_24:
- D 0 - I - 0x00D25A 03:924A: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D25B 03:924B: F9        .byte $F9, $1D, $01, $F7   ; 01 
- D 0 - I - 0x00D25F 03:924F: F9        .byte $F9, $1F, $01, $FF   ; 02 
- D 0 - I - 0x00D263 03:9253: F8        .byte $F8, $21, $01, $07   ; 03 
- D 0 - I - 0x00D267 03:9257: 08        .byte $08, $E5, $00, $F7   ; 04 
- D 0 - I - 0x00D26B 03:925B: 07        .byte $07, $E7, $00, $FF   ; 05 



_off020_925F_25:
- D 0 - I - 0x00D26F 03:925F: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D270 03:9260: F0        .byte $F0, $07, $01, $FC   ; 01 
- D 0 - I - 0x00D274 03:9264: EF        .byte $EF, $09, $01, $04   ; 02 
ofs_9268_29:
ofs_9268_2A:
ofs_9268_2B:
- D 0 - I - 0x00D278 03:9268: 00        .byte $00, $E5, $01, $F8   ; 03 (04) 
- D 0 - I - 0x00D27C 03:926C: FF        .byte $FF, $E7, $01, $00   ; 04 (05) 



_off020_9270_26:
_off020_9270_27:
- D 0 - I - 0x00D280 03:9270: 02        .byte $02   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D281 03:9271: 00        .byte $00, $E5, $01, $F8   ; 01 
- D 0 - I - 0x00D285 03:9275: FF        .byte $FF, $E7, $01, $00   ; 02 



_off020_9279_28:
_off020_9279_29:
- D 0 - I - 0x00D289 03:9279: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D28A 03:927A: F0        .byte $F0, $1D, $01, $F7   ; 01 
- D 0 - I - 0x00D28E 03:927E: F0        .byte $F0, $1F, $01, $FF   ; 02 
- D 0 - I - 0x00D292 03:9282: EF        .byte $EF, $21, $01, $07   ; 03 
- D 0 - I - 0x00D296 03:9286: 80        .byte $80   ; jump
- D 0 - I - 0x00D297 03:9287: 68 92     .word ofs_9268_29



_off020_9289_2A:
- D 0 - I - 0x00D299 03:9289: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D29A 03:928A: F0        .byte $F0, $2B, $01, $FA   ; 01 
- D 0 - I - 0x00D29E 03:928E: EF        .byte $EF, $2D, $01, $02   ; 02 
- D 0 - I - 0x00D2A2 03:9292: 80        .byte $80   ; jump
- D 0 - I - 0x00D2A3 03:9293: 68 92     .word ofs_9268_2A



_off020_9295_2B:
- D 0 - I - 0x00D2A5 03:9295: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D2A6 03:9296: E0        .byte $E0, $35, $01, $FF   ; 01 
- D 0 - I - 0x00D2AA 03:929A: EF        .byte $EF, $37, $01, $F6   ; 02 
- D 0 - I - 0x00D2AE 03:929E: F0        .byte $F0, $39, $01, $FE   ; 03 
- D 0 - I - 0x00D2B2 03:92A2: 80        .byte $80   ; jump
- D 0 - I - 0x00D2B3 03:92A3: 68 92     .word ofs_9268_2B



_off020_92A5_2C:
- D 0 - I - 0x00D2B5 03:92A5: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D2B6 03:92A6: 03        .byte $03, $07, $00, $F7   ; 01 
- D 0 - I - 0x00D2BA 03:92AA: 00        .byte $00, $09, $00, $FF   ; 02 
ofs_92AE_2E:
- D 0 - I - 0x00D2BE 03:92AE: F3        .byte $F3, $03, $01, $F9   ; 03 
- D 0 - I - 0x00D2C2 03:92B2: F0        .byte $F0, $05, $01, $FF   ; 04 



_off020_92B6_2D:
- D 0 - I - 0x00D2C6 03:92B6: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D2C7 03:92B7: F4        .byte $F4, $03, $01, $F9   ; 01 
- D 0 - I - 0x00D2CB 03:92BB: F1        .byte $F1, $05, $01, $FF   ; 02 
- D 0 - I - 0x00D2CF 03:92BF: 04        .byte $04, $0B, $00, $F7   ; 03 
- D 0 - I - 0x00D2D3 03:92C3: 01        .byte $01, $0D, $00, $FF   ; 04 



_off020_92C7_2E:
- D 0 - I - 0x00D2D7 03:92C7: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D2D8 03:92C8: 03        .byte $03, $0F, $00, $F7   ; 01 
- D 0 - I - 0x00D2DC 03:92CC: 00        .byte $00, $11, $00, $FF   ; 02 
- D 0 - I - 0x00D2E0 03:92D0: 80        .byte $80   ; jump
- D 0 - I - 0x00D2E1 03:92D1: AE 92     .word ofs_92AE_2E



_off020_92D3_2F:
- D 0 - I - 0x00D2E3 03:92D3: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D2E4 03:92D4: 02        .byte $02, $17, $00, $F7   ; 01 
- D 0 - I - 0x00D2E8 03:92D8: 01        .byte $01, $19, $00, $FF   ; 02 
ofs_92DC_31:
- D 0 - I - 0x00D2EC 03:92DC: F2        .byte $F2, $13, $01, $F7   ; 03 
- D 0 - I - 0x00D2F0 03:92E0: F1        .byte $F1, $15, $01, $FF   ; 04 



_off020_92E4_30:
- D 0 - I - 0x00D2F4 03:92E4: 03        .byte $03   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D2F5 03:92E5: 02        .byte $02, $1B, $00, $FD   ; 01 
- D 0 - I - 0x00D2F9 03:92E9: F3        .byte $F3, $13, $01, $F7   ; 02 
- D 0 - I - 0x00D2FD 03:92ED: F2        .byte $F2, $15, $01, $FF   ; 03 



_off020_92F1_31:
- D 0 - I - 0x00D301 03:92F1: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D302 03:92F2: 02        .byte $02, $1D, $00, $F7   ; 01 
- D 0 - I - 0x00D306 03:92F6: 01        .byte $01, $1F, $00, $FF   ; 02 
- D 0 - I - 0x00D30A 03:92FA: 80        .byte $80   ; jump
- D 0 - I - 0x00D30B 03:92FB: DC 92     .word ofs_92DC_31



_off020_92FD_32:
- D 0 - I - 0x00D30D 03:92FD: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D30E 03:92FE: FF        .byte $FF, $35, $00, $F8   ; 01 
- D 0 - I - 0x00D312 03:9302: FF        .byte $FF, $37, $00, $00   ; 02 
ofs_9306_34:
- D 0 - I - 0x00D316 03:9306: EF        .byte $EF, $31, $01, $F8   ; 03 (02) 
- D 0 - I - 0x00D31A 03:930A: EF        .byte $EF, $33, $01, $00   ; 04 (03) 



_off020_930E_33:
- D 0 - I - 0x00D31E 03:930E: 03        .byte $03   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D31F 03:930F: 00        .byte $00, $39, $00, $FD   ; 01 
- D 0 - I - 0x00D323 03:9313: F0        .byte $F0, $31, $01, $F8   ; 02 
- D 0 - I - 0x00D327 03:9317: F0        .byte $F0, $33, $01, $00   ; 03 



_off020_931B_34:
- D 0 - I - 0x00D32B 03:931B: 03        .byte $03   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D32C 03:931C: FF        .byte $FF, $3B, $00, $FE   ; 01 
- D 0 - I - 0x00D330 03:9320: 80        .byte $80   ; jump
- D 0 - I - 0x00D331 03:9321: 06 93     .word ofs_9306_34



_off020_9323_35:
- D 0 - I - 0x00D333 03:9323: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D334 03:9324: FF        .byte $FF, $25, $00, $F9   ; 01 
- D 0 - I - 0x00D338 03:9328: FF        .byte $FF, $27, $00, $01   ; 02 
ofs_932C_37:
- D 0 - I - 0x00D33C 03:932C: EF        .byte $EF, $21, $01, $F7   ; 03 
- D 0 - I - 0x00D340 03:9330: EF        .byte $EF, $23, $01, $FF   ; 04 



_off020_9334_36:
- D 0 - I - 0x00D344 03:9334: 03        .byte $03   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D345 03:9335: 00        .byte $00, $29, $00, $FD   ; 01 
- D 0 - I - 0x00D349 03:9339: F0        .byte $F0, $21, $01, $F7   ; 02 
- D 0 - I - 0x00D34D 03:933D: F0        .byte $F0, $23, $01, $FF   ; 03 



_off020_9341_37:
- D 0 - I - 0x00D351 03:9341: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D352 03:9342: FF        .byte $FF, $2B, $00, $FA   ; 01 
- D 0 - I - 0x00D356 03:9346: FF        .byte $FF, $2D, $00, $02   ; 02 
- D 0 - I - 0x00D35A 03:934A: 80        .byte $80   ; jump
- D 0 - I - 0x00D35B 03:934B: 2C 93     .word ofs_932C_37



_off020_934D_38:
- D 0 - I - 0x00D35D 03:934D: 03        .byte $03   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D35E 03:934E: 00        .byte $00, $3D, $00, $FC   ; 01 
ofs_9352_3A:
- D 0 - I - 0x00D362 03:9352: F0        .byte $F0, $3F, $01, $F9   ; 02 
- D 0 - I - 0x00D366 03:9356: F0        .byte $F0, $41, $01, $01   ; 03 



_off020_935A_39:
- D 0 - I - 0x00D36A 03:935A: 03        .byte $03   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D36B 03:935B: 01        .byte $01, $43, $00, $FC   ; 01 
- D 0 - I - 0x00D36F 03:935F: F1        .byte $F1, $3F, $01, $F9   ; 02 
- D 0 - I - 0x00D373 03:9363: F1        .byte $F1, $41, $01, $01   ; 03 



_off020_9367_3A:
- D 0 - I - 0x00D377 03:9367: 03        .byte $03   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D378 03:9368: 00        .byte $00, $3D, $40, $FC   ; 01 
- D 0 - I - 0x00D37C 03:936C: 80        .byte $80   ; jump
- D 0 - I - 0x00D37D 03:936D: 52 93     .word ofs_9352_3A



_off020_936F_3B:
- D 0 - I - 0x00D37F 03:936F: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D380 03:9370: F0        .byte $F0, $4B, $01, $F6   ; 01 
- D 0 - I - 0x00D384 03:9374: F0        .byte $F0, $4D, $01, $FE   ; 02 
- D 0 - I - 0x00D388 03:9378: F3        .byte $F3, $4F, $01, $06   ; 03 
- D 0 - I - 0x00D38C 03:937C: 00        .byte $00, $51, $00, $FC   ; 04 



_off020_9380_3C:
- D 0 - I - 0x00D390 03:9380: 04        .byte $04   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D391 03:9381: FB        .byte $FB, $53, $01, $F4   ; 01 
- D 0 - I - 0x00D395 03:9385: F9        .byte $F9, $5B, $01, $FA   ; 02 
- D 0 - I - 0x00D399 03:9389: F2        .byte $F2, $6F, $00, $FE   ; 03 
- D 0 - I - 0x00D39D 03:938D: 02        .byte $02, $A5, $01, $02   ; 04 



_off020_9391_3D:
- D 0 - I - 0x00D3A1 03:9391: 05        .byte $05   ; counter
;                                              --------------------- spr_Y
;                                              |    ---------------- spr_T
;                                              |    |    ----------- spr_A
;                                              |    |    |    ------ spr_X
;                                              |    |    |    |
- D 0 - I - 0x00D3A2 03:9392: EF        .byte $EF, $A7, $00, $FA   ; 01 
- D 0 - I - 0x00D3A6 03:9396: F3        .byte $F3, $45, $00, $02   ; 02 
- D 0 - I - 0x00D3AA 03:939A: 00        .byte $00, $2F, $01, $F2   ; 03 
- D 0 - I - 0x00D3AE 03:939E: FF        .byte $FF, $47, $01, $FA   ; 04 
- D 0 - I - 0x00D3B2 03:93A2: 03        .byte $03, $49, $01, $02   ; 05 



_off020_93A6_3E:
_off020_93A6_3F:
_off020_93A6_40:
_off020_93A6_41:
_off020_93A6_42:
_off020_93A6_43:
_off020_93A6_44:
_off020_93A6_45:
_off020_93A6_46:
_off020_93A6_47:
_off020_93A6_48:
_off020_93A6_49:
_off020_93A6_4A:
_off020_93A6_4B:
_off020_93A6_4C:
_off020_93A6_4D:
_off020_93A6_4E:
_off020_93A6_4F:
_off020_93A6_50:
_off020_93A6_51:
_off020_93A6_52:
_off020_93A6_53:
_off020_93A6_54:
_off020_93A6_55:
_off020_93A6_56:
_off020_93A6_57:
_off020_93A6_58:
_off020_93A6_59:
_off020_93A6_5A:
_off020_93A6_5B:
_off020_93A6_5C:
_off020_93A6_5D:
_off020_93A6_5E:
_off020_93A6_5F:
_off020_93A6_60:
_off020_93A6_61:
_off020_93A6_62:
_off020_93A6_63:
_off020_93A6_64:
_off020_93A6_65:
_off020_93A6_66:
_off020_93A6_67:
_off020_93A6_68:
_off020_93A6_69:
_off020_93A6_6A:
_off020_93A6_6B:
_off020_93A6_6C:
_off020_93A6_6D:
_off020_93A6_6E:
_off020_93A6_6F:
_off020_93A6_70:
_off020_93A6_71:
_off020_93A6_72:
_off020_93A6_73:
_off020_93A6_74:
_off020_93A6_75:
_off020_93A6_76:
_off020_93A6_77:
_off020_93A6_78:
_off020_93A6_79:
_off020_93A6_7A:
_off020_93A6_7B:
_off020_93A6_7C:
_off020_93A6_7D:
_off020_93A6_7E:
_off020_93A6_7F:
- - - - - - 0x00D3B6 03:93A6: 80        .byte $80   ; jump
- - - - - - 0x00D3B7 03:93A7: 01 00     .word $0001 ; location












.out .sprintf("Free bytes in bank 22: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_22b"
    .byte con_prg_bank + $23   ; 
