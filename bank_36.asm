.segment "BANK_36"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x00C010-0x01000F



.export loc_0x00C0CE_sprite_engine
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
.export loc_0x00F894_set_palette_for_area
.export loc_0x00F896_set_palette



; bzk this byte must be placed at 8000
- D 0 - - - 0x00C010 03:8000: 36        .byte con_prg_bank + $36   ; 



sub_8001_display_lives_with_sprites:
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



sub_805E_player_animation_sprite_data_handler:
C - - - - - 0x00C06E 03:805E: 0A        ASL
C - - - - - 0x00C06F 03:805F: A8        TAY
C - - - - - 0x00C070 03:8060: B9 2F 8F  LDA tbl_8F31 - $02,Y
C - - - - - 0x00C073 03:8063: 85 08     STA ram_0008
C - - - - - 0x00C075 03:8065: B9 30 8F  LDA tbl_8F31 - $02 + $01,Y
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



loc_0x00C0CE_sprite_engine:
C D 0 - - - 0x00C0CE 03:80BE: A5 24     LDA ram_рандом_байт_2
C - - - - - 0x00C0D0 03:80C0: 18        CLC
C - - - - - 0x00C0D1 03:80C1: 69 4C     ADC #$4C
C - - - - - 0x00C0D3 03:80C3: 85 24     STA ram_рандом_байт_2
C - - - - - 0x00C0D5 03:80C5: AA        TAX
C - - - - - 0x00C0D6 03:80C6: 38        SEC
C - - - - - 0x00C0D7 03:80C7: E9 C4     SBC #$C4
C - - - - - 0x00C0D9 03:80C9: A8        TAY
C - - - - - 0x00C0DA 03:80CA: 84 07     STY ram_0007
C - - - - - 0x00C0DC 03:80CC: A9 00     LDA #$00
C - - - - - 0x00C0DE 03:80CE: 99 01 02  STA ram_spr_T,Y
C - - - - - 0x00C0E1 03:80D1: 20 01 80  JSR sub_8001_display_lives_with_sprites
C - - - - - 0x00C0E4 03:80D4: A9 FF     LDA #$FF
C - - - - - 0x00C0E6 03:80D6: A4 D4     LDY ram_бессмертие_игрока
C - - - - - 0x00C0E8 03:80D8: F0 02     BEQ bra_80DC
C - - - - - 0x00C0EA 03:80DA: A9 FC     LDA #$FC
bra_80DC:
C - - - - - 0x00C0EC 03:80DC: 85 0B     STA ram_000B
C - - - - - 0x00C0EE 03:80DE: AD 66 05  LDA ram_attr_spr_plr
C - - - - - 0x00C0F1 03:80E1: 29 03     AND #$03
C - - - - - 0x00C0F3 03:80E3: 85 00     STA ram_0000
C - - - - - 0x00C0F5 03:80E5: AD 66 05  LDA ram_attr_spr_plr
C - - - - - 0x00C0F8 03:80E8: 29 E0     AND #$E0
C - - - - - 0x00C0FA 03:80EA: 85 0A     STA ram_000A
C - - - - - 0x00C0FC 03:80EC: AD 32 05  LDA ram_pos_Y_hi_plr
C - - - - - 0x00C0FF 03:80EF: 85 01     STA ram_0001
C - - - - - 0x00C101 03:80F1: AD 4C 05  LDA ram_pos_X_hi_plr
C - - - - - 0x00C104 03:80F4: 85 02     STA ram_0002
C - - - - - 0x00C106 03:80F6: AD 18 05  LDA ram_anim_id_plr
C - - - - - 0x00C109 03:80F9: F0 03     BEQ bra_80FE_skip
C - - - - - 0x00C10B 03:80FB: 20 5E 80  JSR sub_805E_player_animation_sprite_data_handler
bra_80FE_skip:
C - - - - - 0x00C10E 03:80FE: A9 FF     LDA #$FF
C - - - - - 0x00C110 03:8100: A4 D5     LDY ram_бессмертие_игрока + $01
C - - - - - 0x00C112 03:8102: F0 02     BEQ bra_8106
C - - - - - 0x00C114 03:8104: A9 FC     LDA #$FC
bra_8106:
C - - - - - 0x00C116 03:8106: 85 0B     STA ram_000B
C - - - - - 0x00C118 03:8108: AD 67 05  LDA ram_attr_spr_plr + $01
C - - - - - 0x00C11B 03:810B: 29 03     AND #$03
C - - - - - 0x00C11D 03:810D: 85 00     STA ram_0000
C - - - - - 0x00C11F 03:810F: AD 67 05  LDA ram_attr_spr_plr + $01
C - - - - - 0x00C122 03:8112: 29 E0     AND #$E0
C - - - - - 0x00C124 03:8114: 85 0A     STA ram_000A
C - - - - - 0x00C126 03:8116: AD 33 05  LDA ram_pos_Y_hi_plr + $01
C - - - - - 0x00C129 03:8119: 85 01     STA ram_0001
C - - - - - 0x00C12B 03:811B: AD 4D 05  LDA ram_pos_X_hi_plr + $01
C - - - - - 0x00C12E 03:811E: 85 02     STA ram_0002
C - - - - - 0x00C130 03:8120: AD 19 05  LDA ram_anim_id_plr + $01
C - - - - - 0x00C133 03:8123: F0 03     BEQ bra_8128_skip
C - - - - - 0x00C135 03:8125: 20 5E 80  JSR sub_805E_player_animation_sprite_data_handler
bra_8128_skip:
C - - - - - 0x00C138 03:8128: A0 17     LDY #$17
bra_812A_loop:
C - - - - - 0x00C13A 03:812A: B9 4E 05  LDA ram_attr_spr_obj,Y
C - - - - - 0x00C13D 03:812D: 29 3F     AND #$3F
C - - - - - 0x00C13F 03:812F: 85 00     STA ram_0000
C - - - - - 0x00C141 03:8131: 4A        LSR
C - - - - - 0x00C142 03:8132: 4A        LSR
C - - - - - 0x00C143 03:8133: 85 0B     STA ram_000B
C - - - - - 0x00C145 03:8135: B9 4E 05  LDA ram_attr_spr_obj,Y
C - - - - - 0x00C148 03:8138: 29 C0     AND #$C0
C - - - - - 0x00C14A 03:813A: 85 0A     STA ram_000A
C - - - - - 0x00C14C 03:813C: B9 1A 05  LDA ram_pos_Y_hi_obj,Y
C - - - - - 0x00C14F 03:813F: 85 01     STA ram_0001
C - - - - - 0x00C151 03:8141: B9 34 05  LDA ram_pos_X_hi_obj,Y
C - - - - - 0x00C154 03:8144: 85 02     STA ram_0002
; bzk optimize, check ram_anim_id_obj first
C - - - - - 0x00C156 03:8146: B9 00 05  LDA ram_anim_id_obj,Y
C - - - - - 0x00C159 03:8149: F0 07     BEQ bra_8152_skip
C - - - - - 0x00C15B 03:814B: 84 05     STY ram_0005
C - - - - - 0x00C15D 03:814D: 20 6B 81  JSR sub_816B_enemy_animation_sprite_data_handler
C - - - - - 0x00C160 03:8150: A4 05     LDY ram_0005
bra_8152_skip:
C - - - - - 0x00C162 03:8152: 88        DEY
C - - - - - 0x00C163 03:8153: 10 D5     BPL bra_812A_loop
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
C - - - - - 0x00C176 03:8166: E4 24     CPX ram_рандом_байт_2
C - - - - - 0x00C178 03:8168: D0 F2     BNE bra_815C_loop
bra_816A_RTS:
C - - - - - 0x00C17A 03:816A: 60        RTS



sub_816B_enemy_animation_sprite_data_handler:
C - - - - - 0x00C17B 03:816B: 0A        ASL
C - - - - - 0x00C17C 03:816C: A8        TAY
C - - - - - 0x00C17D 03:816D: 90 0A     BCC bra_8179
C - - - - - 0x00C17F 03:816F: B9 05 83  LDA tbl_8305,Y
C - - - - - 0x00C182 03:8172: 85 08     STA ram_0008
C - - - - - 0x00C184 03:8174: B9 06 83  LDA tbl_8305 + $01,Y
C - - - - - 0x00C187 03:8177: B0 08     BCS bra_8181    ; jmp
bra_8179:
C - - - - - 0x00C189 03:8179: B9 05 82  LDA tbl_8205,Y
C - - - - - 0x00C18C 03:817C: 85 08     STA ram_0008
C - - - - - 0x00C18E 03:817E: B9 06 82  LDA tbl_8205 + $01,Y
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



tbl_8205:
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



tbl_8305:
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


; bzk garbage
- - - - - - 0x00CF3F 03:8F2F: 2F        .byte $2F   ; 
- - - - - - 0x00CF40 03:8F30: 90        .byte $90   ; 



tbl_8F31:
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



ofs_044_0x00D3B9_00_area_1:
C - - J - - 0x00D3B9 03:93A9: A5 39     LDA ram_пауза
C - - - - - 0x00D3BB 03:93AB: F0 01     BEQ bra_93AE
C - - - - - 0x00D3BD 03:93AD: 60        RTS
bra_93AE:
C - - - - - 0x00D3BE 03:93AE: 20 55 94  JSR sub_9455
C - - - - - 0x00D3C1 03:93B1: A5 61     LDA ram_0061
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
C - - - - - 0x00D3F9 03:93E9: A5 8C     LDA ram_008C
C - - - - - 0x00D3FB 03:93EB: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00D3FE 03:93EE: 08 94     .word ofs_019_9408_00
- D 0 - I - 0x00D400 03:93F0: 0F 94     .word ofs_019_940F_01
- D 0 - I - 0x00D402 03:93F2: 19 94     .word ofs_019_9419_02
- D 0 - I - 0x00D404 03:93F4: 23 94     .word ofs_019_9423_03
- D 0 - I - 0x00D406 03:93F6: 2D 94     .word ofs_019_942D_04
- D 0 - I - 0x00D408 03:93F8: 13 94     .word ofs_019_9413_05
- D 0 - I - 0x00D40A 03:93FA: 1D 94     .word ofs_019_941D_06
- D 0 - I - 0x00D40C 03:93FC: 27 94     .word ofs_019_9427_07
- D 0 - I - 0x00D40E 03:93FE: 31 94     .word ofs_019_9431_08
- D 0 - I - 0x00D410 03:9400: 3B 94     .word ofs_019_943B_09
- D 0 - I - 0x00D412 03:9402: 47 94     .word ofs_019_9447_0A
- D 0 - I - 0x00D414 03:9404: 41 94     .word ofs_019_9441_0B
- - - - - - 0x00D416 03:9406: 54 94     .word ofs_019_9454_0C_RTS



ofs_019_9408_00:
C - - J - - 0x00D418 03:9408: A9 3A     LDA #con_chr_bank + $3A
C - - - - - 0x00D41A 03:940A: 8D F1 07  STA ram_chr_bank + $01
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
C - - - - - 0x00D44D 03:943D: 85 7D     STA ram_007D_flag
C - - - - - 0x00D44F 03:943F: 85 71     STA ram_0071_flag
ofs_019_9441_0B:
C - - - - - 0x00D451 03:9441: A9 01     LDA #$01
C - - - - - 0x00D453 03:9443: 85 61     STA ram_0061
C - - - - - 0x00D455 03:9445: D0 0A     BNE bra_9451    ; jmp



ofs_019_9447_0A:
C - - J - - 0x00D457 03:9447: A0 80     LDY #con_F97C_colors + $80
C - - - - - 0x00D459 03:9449: 20 68 F9  JSR sub_0x01F978_write_3_colors
C - - - - - 0x00D45C 03:944C: A0 84     LDY #con_F97C_colors + $84
C - - - - - 0x00D45E 03:944E: 20 68 F9  JSR sub_0x01F978_write_3_colors
bra_9451:
loc_9451:
C D 0 - - - 0x00D461 03:9451: E6 8C     INC ram_008C
C - - - - - 0x00D463 03:9453: 60        RTS



ofs_019_9454_0C_RTS:
- - - - - - 0x00D464 03:9454: 60        RTS



sub_9455:
C - - - - - 0x00D465 03:9455: A5 8D     LDA ram_008D
C - - - - - 0x00D467 03:9457: 0A        ASL
C - - - - - 0x00D468 03:9458: A8        TAY
C - - - - - 0x00D469 03:9459: B9 6E 94  LDA tbl_946E,Y
C - - - - - 0x00D46C 03:945C: C5 82     CMP ram_0082
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
C - - - - - 0x00D483 03:9473: A5 8D     LDA ram_008D
C - - - - - 0x00D485 03:9475: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00D488 03:9478: 7E 94     .word ofs_020_947E_00
- D 0 - I - 0x00D48A 03:947A: 86 94     .word ofs_020_9486_01
- - - - - - 0x00D48C 03:947C: 91 94     .word ofs_020_9491_02_RTS



ofs_020_947E_00:
C - - J - - 0x00D48E 03:947E: A0 64     LDY #con_F97C_colors + $64
C - - - - - 0x00D490 03:9480: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_9483:
C - - - - - 0x00D493 03:9483: E6 8D     INC ram_008D
C - - - - - 0x00D495 03:9485: 60        RTS



ofs_020_9486_01:
C - - J - - 0x00D496 03:9486: A9 38     LDA #con_chr_bank + $38
C - - - - - 0x00D498 03:9488: 8D F0 07  STA ram_chr_bank
C - - - - - 0x00D49B 03:948B: A9 40     LDA #$40
C - - - - - 0x00D49D 03:948D: 85 7D     STA ram_007D_flag
C - - - - - 0x00D49F 03:948F: D0 F2     BNE bra_9483    ; jmp



ofs_020_9491_02_RTS:
- - - - - - 0x00D4A1 03:9491: 60        RTS



ofs_044_0x00D4A2_01_area_2:
C - - J - - 0x00D4A2 03:9492: A5 39     LDA ram_пауза
C - - - - - 0x00D4A4 03:9494: F0 01     BEQ bra_9497
C - - - - - 0x00D4A6 03:9496: 60        RTS
bra_9497:
C - - - - - 0x00D4A7 03:9497: A5 8D     LDA ram_008D
C - - - - - 0x00D4A9 03:9499: 0A        ASL
C - - - - - 0x00D4AA 03:949A: A8        TAY
C - - - - - 0x00D4AB 03:949B: B9 B2 94  LDA tbl_94B2,Y
C - - - - - 0x00D4AE 03:949E: C5 82     CMP ram_0082
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
C - - - - - 0x00D4DD 03:94CD: A5 8D     LDA ram_008D
C - - - - - 0x00D4DF 03:94CF: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00D4E2 03:94D2: EE 94     .word ofs_021_94EE_00
- D 0 - I - 0x00D4E4 03:94D4: 2B 95     .word ofs_021_952B_01
- D 0 - I - 0x00D4E6 03:94D6: 3A 95     .word ofs_021_953A_02
- D 0 - I - 0x00D4E8 03:94D8: 2B 95     .word ofs_021_952B_03
- D 0 - I - 0x00D4EA 03:94DA: 3A 95     .word ofs_021_953A_04
- D 0 - I - 0x00D4EC 03:94DC: FC 94     .word ofs_021_94FC_05
- D 0 - I - 0x00D4EE 03:94DE: 04 95     .word ofs_021_9504_06
- D 0 - I - 0x00D4F0 03:94E0: 1C 95     .word ofs_021_951C_07
- D 0 - I - 0x00D4F2 03:94E2: 33 95     .word ofs_021_9533_08
- D 0 - I - 0x00D4F4 03:94E4: 20 95     .word ofs_021_9520_09
- D 0 - I - 0x00D4F6 03:94E6: 33 95     .word ofs_021_9533_0A
- D 0 - I - 0x00D4F8 03:94E8: 3A 95     .word ofs_021_953A_0B
- D 0 - I - 0x00D4FA 03:94EA: 3A 95     .word ofs_021_953A_0C
- D 0 - I - 0x00D4FC 03:94EC: 46 95     .word ofs_021_9546_0D_RTS



ofs_021_94EE_00:
C - - J - - 0x00D4FE 03:94EE: A0 68     LDY #con_F97C_colors + $68
C - - - - - 0x00D500 03:94F0: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D503 03:94F3: A0 6C     LDY #con_F97C_colors + $6C
C - - - - - 0x00D505 03:94F5: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D508 03:94F8: A0 70     LDY #con_F97C_colors + $70
C - - - - - 0x00D50A 03:94FA: D0 02     BNE bra_94FE    ; jmp
ofs_021_94FC_05:
C - - J - - 0x00D50C 03:94FC: A0 74     LDY #con_F97C_colors + $74
bra_94FE:
C - - - - - 0x00D50E 03:94FE: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_9501:
loc_9501:
C D 0 - - - 0x00D511 03:9501: E6 8D     INC ram_008D
C - - - - - 0x00D513 03:9503: 60        RTS



ofs_021_9504_06:
C - - J - - 0x00D514 03:9504: A0 78     LDY #con_F97C_colors + $78
C - - - - - 0x00D516 03:9506: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D519 03:9509: A0 20     LDY #$20
C - - - - - 0x00D51B 03:950B: 20 30 FA  JSR sub_0x01FA40
C - - - - - 0x00D51E 03:950E: A0 7C     LDY #con_F97C_colors + $7C
C - - - - - 0x00D520 03:9510: A9 5C     LDA #con_chr_bank + $5C
C - - - - - 0x00D522 03:9512: A2 5E     LDX #con_chr_bank + $5E
C - - - - - 0x00D524 03:9514: 8D F0 07  STA ram_chr_bank
bra_9517:
C - - - - - 0x00D527 03:9517: 8E F1 07  STX ram_chr_bank + $01
C - - - - - 0x00D52A 03:951A: D0 E2     BNE bra_94FE    ; jmp



ofs_021_951C_07:
C - - J - - 0x00D52C 03:951C: A0 88     LDY #con_F97C_colors + $88
C - - - - - 0x00D52E 03:951E: D0 DE     BNE bra_94FE    ; jmp



ofs_021_9520_09:
C - - J - - 0x00D530 03:9520: A0 8C     LDY #con_F97C_colors + $8C
C - - - - - 0x00D532 03:9522: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D535 03:9525: A0 90     LDY #con_F97C_colors + $90
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
C - - - - - 0x00D550 03:9540: 85 7D     STA ram_007D_flag
C - - - - - 0x00D552 03:9542: 85 71     STA ram_0071_flag
C - - - - - 0x00D554 03:9544: D0 BB     BNE bra_9501    ; jmp



ofs_021_9546_0D_RTS:
C - - J - - 0x00D556 03:9546: 60        RTS



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
C - - - - - 0x00D5B3 03:95A3: 8D F1 07  STA ram_chr_bank + $01
C - - - - - 0x00D5B6 03:95A6: A0 08     LDY #con_F97C_colors + $08
C - - - - - 0x00D5B8 03:95A8: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D5BB 03:95AB: A0 0C     LDY #con_F97C_colors + $0C
C - - - - - 0x00D5BD 03:95AD: D0 0A     BNE bra_95B9    ; jmp
bra_95AF:
C - - - - - 0x00D5BF 03:95AF: CA        DEX
C - - - - - 0x00D5C0 03:95B0: D0 0D     BNE bra_95BF
; 01 
C - - - - - 0x00D5C2 03:95B2: A0 10     LDY #con_F97C_colors + $10
C - - - - - 0x00D5C4 03:95B4: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D5C7 03:95B7: A0 14     LDY #con_F97C_colors + $14
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
C - - - - - 0x00D5D4 03:95C4: 85 61     STA ram_0061
C - - - - - 0x00D5D6 03:95C6: A9 12     LDA #con_chr_bank + $12
C - - - - - 0x00D5D8 03:95C8: 8D F0 07  STA ram_chr_bank
C - - - - - 0x00D5DB 03:95CB: A9 14     LDA #con_chr_bank + $14
C - - - - - 0x00D5DD 03:95CD: 8D F1 07  STA ram_chr_bank + $01
C - - - - - 0x00D5E0 03:95D0: A0 18     LDY #con_F97C_colors + $18
C - - - - - 0x00D5E2 03:95D2: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D5E5 03:95D5: A0 1C     LDY #con_F97C_colors + $1C
C - - - - - 0x00D5E7 03:95D7: D0 E0     BNE bra_95B9    ; jmp
bra_95D9:
C - - - - - 0x00D5E9 03:95D9: CA        DEX
C - - - - - 0x00D5EA 03:95DA: D0 0E     BNE bra_95EA
; 03 
C - - - - - 0x00D5EC 03:95DC: A9 10     LDA #con_chr_bank + $10
C - - - - - 0x00D5EE 03:95DE: 8D F1 07  STA ram_chr_bank + $01
C - - - - - 0x00D5F1 03:95E1: A0 20     LDY #con_F97C_colors + $20
C - - - - - 0x00D5F3 03:95E3: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D5F6 03:95E6: A0 24     LDY #con_F97C_colors + $24
C - - - - - 0x00D5F8 03:95E8: D0 CF     BNE bra_95B9    ; jmp
bra_95EA:
C - - - - - 0x00D5FA 03:95EA: CA        DEX
C - - - - - 0x00D5FB 03:95EB: D0 09     BNE bra_95F6
; 04 
C - - - - - 0x00D5FD 03:95ED: A0 44     LDY #con_F97C_colors + $44
C - - - - - 0x00D5FF 03:95EF: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D602 03:95F2: A0 48     LDY #con_F97C_colors + $48
C - - - - - 0x00D604 03:95F4: D0 C3     BNE bra_95B9    ; jmp
bra_95F6:
C - - - - - 0x00D606 03:95F6: CA        DEX
C - - - - - 0x00D607 03:95F7: D0 06     BNE bra_95FF_RTS
; 05 
C - - - - - 0x00D609 03:95F9: A9 02     LDA #$02
C - - - - - 0x00D60B 03:95FB: 85 61     STA ram_0061
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
;                                              ----------- 
;                                              |    ------ scroll_X
;                                              |    |
- D 0 - - - 0x00D657 03:9647: 02        .byte $02, $A0   ; 00 
- D 0 - - - 0x00D659 03:9649: 03        .byte $03, $00   ; 01 
- D 0 - - - 0x00D65B 03:964B: 03        .byte $03, $C0   ; 02 
- D 0 - - - 0x00D65D 03:964D: FF        .byte $FF   ; 03 final



sub_964E:
C - - - - - 0x00D65E 03:964E: A5 8C     LDA ram_008C
C - - - - - 0x00D660 03:9650: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00D663 03:9653: 5B 96     .word ofs_022_965B_00
- D 0 - I - 0x00D665 03:9655: 61 96     .word ofs_022_9661_01
- D 0 - I - 0x00D667 03:9657: 68 96     .word ofs_022_9668_02
- - - - - - 0x00D669 03:9659: 6E 96     .word ofs_022_966E_03_RTS



ofs_022_965B_00:
C - - J - - 0x00D66B 03:965B: A9 01     LDA #$01
C - - - - - 0x00D66D 03:965D: 85 6F     STA ram_006F
C - - - - - 0x00D66F 03:965F: D0 04     BNE bra_9665    ; jmp



ofs_022_9661_01:
C - - J - - 0x00D671 03:9661: A9 01     LDA #$01
C - - - - - 0x00D673 03:9663: 85 61     STA ram_0061
bra_9665:
C - - - - - 0x00D675 03:9665: E6 8C     INC ram_008C
C - - - - - 0x00D677 03:9667: 60        RTS



ofs_022_9668_02:
C - - J - - 0x00D678 03:9668: A9 01     LDA #$01
C - - - - - 0x00D67A 03:966A: 85 61     STA ram_0061
C - - - - - 0x00D67C 03:966C: D0 F7     BNE bra_9665    ; jmp



ofs_022_966E_03_RTS:
- - - - - - 0x00D67E 03:966E: 60        RTS



sub_966F:
C - - - - - 0x00D67F 03:966F: A5 8D     LDA ram_008D
C - - - - - 0x00D681 03:9671: 0A        ASL
C - - - - - 0x00D682 03:9672: A8        TAY
C - - - - - 0x00D683 03:9673: B9 8A 96  LDA tbl_968A,Y
C - - - - - 0x00D686 03:9676: C5 82     CMP ram_0082
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
C - - - - - 0x00D6AD 03:969D: A5 8D     LDA ram_008D
C - - - - - 0x00D6AF 03:969F: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00D6B2 03:96A2: B6 96     .word ofs_023_96B6_00
- D 0 - I - 0x00D6B4 03:96A4: BD 96     .word ofs_023_96BD_01
- D 0 - I - 0x00D6B6 03:96A6: C3 96     .word ofs_023_96C3_02
- D 0 - I - 0x00D6B8 03:96A8: CF 96     .word ofs_023_96CF_03
- D 0 - I - 0x00D6BA 03:96AA: DD 96     .word ofs_023_96DD_04
- D 0 - I - 0x00D6BC 03:96AC: CF 96     .word ofs_023_96CF_05
- D 0 - I - 0x00D6BE 03:96AE: E7 96     .word ofs_023_96E7_06
- D 0 - I - 0x00D6C0 03:96B0: EB 96     .word ofs_023_96EB_07
- D 0 - I - 0x00D6C2 03:96B2: DD 96     .word ofs_023_96DD_08
- D 0 - I - 0x00D6C4 03:96B4: F2 96     .word ofs_023_96F2_09_RTS



ofs_023_96B6_00:
C - - J - - 0x00D6C6 03:96B6: A9 1B     LDA #con_chr_bank + $1B
C - - - - - 0x00D6C8 03:96B8: 8D F5 07  STA ram_chr_bank + $05
C - - - - - 0x00D6CB 03:96BB: D0 32     BNE bra_96EF    ; jmp



ofs_023_96BD_01:
C - - J - - 0x00D6CD 03:96BD: A9 EE     LDA #$EE
C - - - - - 0x00D6CF 03:96BF: 85 98     STA ram_0098
C - - - - - 0x00D6D1 03:96C1: D0 2C     BNE bra_96EF    ; jmp



ofs_023_96C3_02:
C - - J - - 0x00D6D3 03:96C3: A9 00     LDA #$00
C - - - - - 0x00D6D5 03:96C5: 85 98     STA ram_0098
C - - - - - 0x00D6D7 03:96C7: A9 C0     LDA #$C0
C - - - - - 0x00D6D9 03:96C9: 85 7D     STA ram_007D_flag
C - - - - - 0x00D6DB 03:96CB: 85 71     STA ram_0071_flag
C - - - - - 0x00D6DD 03:96CD: D0 20     BNE bra_96EF    ; jmp



ofs_023_96CF_03:
ofs_023_96CF_05:
C - - J - - 0x00D6DF 03:96CF: A9 80     LDA #$80
C - - - - - 0x00D6E1 03:96D1: 85 7E     STA ram_007E
C - - - - - 0x00D6E3 03:96D3: A9 00     LDA #$00
C - - - - - 0x00D6E5 03:96D5: 85 7F     STA ram_007F
C - - - - - 0x00D6E7 03:96D7: A9 FF     LDA #$FF
C - - - - - 0x00D6E9 03:96D9: 85 80     STA ram_0080
C - - - - - 0x00D6EB 03:96DB: D0 12     BNE bra_96EF    ; jmp



ofs_023_96DD_04:
ofs_023_96DD_08:
C - - J - - 0x00D6ED 03:96DD: A9 C0     LDA #$C0
C - - - - - 0x00D6EF 03:96DF: 85 71     STA ram_0071_flag
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
C - - - - - 0x00D6FF 03:96EF: E6 8D     INC ram_008D
C - - - - - 0x00D701 03:96F1: 60        RTS



ofs_023_96F2_09_RTS:
C - - J - - 0x00D702 03:96F2: 60        RTS



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
C - - - - - 0x00D721 03:9711: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
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
C - - - - - 0x00D75B 03:974B: F0 10     BEQ bra_975D
C - - - - - 0x00D75D 03:974D: 60        RTS



tbl_974E:
- D 0 - - - 0x00D75E 03:974E: 38        .byte con_F97C_colors + $38   ; 
- D 0 - - - 0x00D75F 03:974F: 3C        .byte con_F97C_colors + $3C   ; 
- D 0 - - - 0x00D760 03:9750: 40        .byte con_F97C_colors + $40   ; 
- D 0 - - - 0x00D761 03:9751: 40        .byte con_F97C_colors + $40   ; 
- D 0 - - - 0x00D762 03:9752: 3C        .byte con_F97C_colors + $3C   ; 
- D 0 - - - 0x00D763 03:9753: 38        .byte con_F97C_colors + $38   ; 



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



bra_975D:
C - - - - - 0x00D76D 03:975D: 20 E1 97  JSR sub_97E1
C - - - - - 0x00D770 03:9760: A5 61     LDA ram_0061
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
C - - - - - 0x00D79A 03:978A: A5 8C     LDA ram_008C
C - - - - - 0x00D79C 03:978C: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00D79F 03:978F: 9B 97     .word ofs_024_979B_00
- D 0 - I - 0x00D7A1 03:9791: B2 97     .word ofs_024_97B2_01
- D 0 - I - 0x00D7A3 03:9793: BB 97     .word ofs_024_97BB_02
- D 0 - I - 0x00D7A5 03:9795: C3 97     .word ofs_024_97C3_03
- D 0 - I - 0x00D7A7 03:9797: DA 97     .word ofs_024_97DA_04
- - - - - - 0x00D7A9 03:9799: E0 97     .word ofs_024_97E0_05_RTS



ofs_024_979B_00:
C - - J - - 0x00D7AB 03:979B: A0 00     LDY #$00
C - - - - - 0x00D7AD 03:979D: 20 30 FA  JSR sub_0x01FA40
C - - - - - 0x00D7B0 03:97A0: A9 20     LDA #con_chr_bank + $20
C - - - - - 0x00D7B2 03:97A2: 8D F0 07  STA ram_chr_bank
C - - - - - 0x00D7B5 03:97A5: A9 22     LDA #con_chr_bank + $22
C - - - - - 0x00D7B7 03:97A7: 8D F1 07  STA ram_chr_bank + $01
C - - - - - 0x00D7BA 03:97AA: A0 28     LDY #con_F97C_colors + $28
bra_97AC:
C - - - - - 0x00D7BC 03:97AC: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_97AF:
C - - - - - 0x00D7BF 03:97AF: E6 8C     INC ram_008C
C - - - - - 0x00D7C1 03:97B1: 60        RTS



ofs_024_97B2_01:
C - - J - - 0x00D7C2 03:97B2: A9 FF     LDA #$FF
C - - - - - 0x00D7C4 03:97B4: 8D CD 03  STA ram_03CD
C - - - - - 0x00D7C7 03:97B7: A0 2C     LDY #con_F97C_colors + $2C
C - - - - - 0x00D7C9 03:97B9: D0 F1     BNE bra_97AC    ; jmp



ofs_024_97BB_02:
C - - J - - 0x00D7CB 03:97BB: A9 80     LDA #$80
bra_97BD:
C - - - - - 0x00D7CD 03:97BD: 85 7D     STA ram_007D_flag
C - - - - - 0x00D7CF 03:97BF: 85 71     STA ram_0071_flag
C - - - - - 0x00D7D1 03:97C1: D0 EC     BNE bra_97AF    ; jmp



ofs_024_97C3_03:
C - - J - - 0x00D7D3 03:97C3: A9 40     LDA #$40
C - - - - - 0x00D7D5 03:97C5: 8D CF 03  STA ram_03CF
C - - - - - 0x00D7D8 03:97C8: A0 A4     LDY #con_F97C_colors + $A4
C - - - - - 0x00D7DA 03:97CA: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D7DD 03:97CD: A0 A8     LDY #con_F97C_colors + $A8
C - - - - - 0x00D7DF 03:97CF: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D7E2 03:97D2: A9 02     LDA #$02
C - - - - - 0x00D7E4 03:97D4: 85 61     STA ram_0061
C - - - - - 0x00D7E6 03:97D6: A9 C0     LDA #$C0
C - - - - - 0x00D7E8 03:97D8: D0 E3     BNE bra_97BD    ; jmp



ofs_024_97DA_04:
C - - J - - 0x00D7EA 03:97DA: A9 01     LDA #$01
C - - - - - 0x00D7EC 03:97DC: 85 61     STA ram_0061
C - - - - - 0x00D7EE 03:97DE: D0 CF     BNE bra_97AF    ; jmp



ofs_024_97E0_05_RTS:
- - - - - - 0x00D7F0 03:97E0: 60        RTS



sub_97E1:
C - - - - - 0x00D7F1 03:97E1: A5 8D     LDA ram_008D
C - - - - - 0x00D7F3 03:97E3: 0A        ASL
C - - - - - 0x00D7F4 03:97E4: A8        TAY
C - - - - - 0x00D7F5 03:97E5: B9 FC 97  LDA tbl_97FC,Y
C - - - - - 0x00D7F8 03:97E8: C5 82     CMP ram_0082
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
C - - - - - 0x00D811 03:9801: A6 8D     LDX ram_008D
C - - - - - 0x00D813 03:9803: D0 07     BNE bra_980C
C - - - - - 0x00D815 03:9805: A9 FF     LDA #$FF
C - - - - - 0x00D817 03:9807: 8D CF 03  STA ram_03CF
C - - - - - 0x00D81A 03:980A: D0 0A     BNE bra_9816    ; jmp
bra_980C:
C - - - - - 0x00D81C 03:980C: CA        DEX
C - - - - - 0x00D81D 03:980D: D0 0A     BNE bra_9819_RTS
C - - - - - 0x00D81F 03:980F: 20 90 F1  JSR sub_0x01F1A0
C - - - - - 0x00D822 03:9812: A9 00     LDA #$00
C - - - - - 0x00D824 03:9814: 85 61     STA ram_0061
bra_9816:
C - - - - - 0x00D826 03:9816: E6 8D     INC ram_008D
C - - - - - 0x00D828 03:9818: 60        RTS
bra_9819_RTS:   ; bzk optimize
C - - - - - 0x00D829 03:9819: 60        RTS



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
C - - - - - 0x00D87A 03:986A: A5 8D     LDA ram_008D
C - - - - - 0x00D87C 03:986C: 0A        ASL
C - - - - - 0x00D87D 03:986D: A8        TAY
C - - - - - 0x00D87E 03:986E: B9 85 98  LDA tbl_9885,Y
C - - - - - 0x00D881 03:9871: C5 82     CMP ram_0082
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
C - - - - - 0x00D8A4 03:9894: A5 8D     LDA ram_008D
C - - - - - 0x00D8A6 03:9896: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00D8A9 03:9899: A9 98     .word ofs_025_98A9_00
- D 0 - I - 0x00D8AB 03:989B: B1 98     .word ofs_025_98B1_01
- D 0 - I - 0x00D8AD 03:989D: B8 98     .word ofs_025_98B8_02
- D 0 - I - 0x00D8AF 03:989F: C0 98     .word ofs_025_98C0_03
- D 0 - I - 0x00D8B1 03:98A1: C7 98     .word ofs_025_98C7_04
- D 0 - I - 0x00D8B3 03:98A3: CB 98     .word ofs_025_98CB_05
- D 0 - I - 0x00D8B5 03:98A5: D1 98     .word ofs_025_98D1_06
- D 0 - I - 0x00D8B7 03:98A7: E2 98     .word ofs_025_98E2_07_RTS



ofs_025_98A9_00:
C - - J - - 0x00D8B9 03:98A9: A0 94     LDY #con_F97C_colors + $94
C - - - - - 0x00D8BB 03:98AB: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_98AE:
loc_98AE:
C D 0 - - - 0x00D8BE 03:98AE: E6 8D     INC ram_008D
C - - - - - 0x00D8C0 03:98B0: 60        RTS



ofs_025_98B1_01:
C - - J - - 0x00D8C1 03:98B1: A9 52     LDA #con_chr_bank + $52
C - - - - - 0x00D8C3 03:98B3: 8D F1 07  STA ram_chr_bank + $01
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
C - - J - - 0x00D8E1 03:98D1: A0 98     LDY #con_F97C_colors + $98
C - - - - - 0x00D8E3 03:98D3: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D8E6 03:98D6: A9 00     LDA #$00
C - - - - - 0x00D8E8 03:98D8: 85 98     STA ram_0098
C - - - - - 0x00D8EA 03:98DA: A9 C0     LDA #$C0
C - - - - - 0x00D8EC 03:98DC: 85 7D     STA ram_007D_flag
C - - - - - 0x00D8EE 03:98DE: 85 71     STA ram_0071_flag
C - - - - - 0x00D8F0 03:98E0: D0 CC     BNE bra_98AE    ; jmp



ofs_025_98E2_07_RTS:
C - - J - - 0x00D8F2 03:98E2: 60        RTS



ofs_044_0x00D8F3_06_area_7:
C - - J - - 0x00D8F3 03:98E3: A5 39     LDA ram_пауза
C - - - - - 0x00D8F5 03:98E5: F0 01     BEQ bra_98E8
C - - - - - 0x00D8F7 03:98E7: 60        RTS
bra_98E8:
C - - - - - 0x00D8F8 03:98E8: A5 8D     LDA ram_008D
C - - - - - 0x00D8FA 03:98EA: 0A        ASL
C - - - - - 0x00D8FB 03:98EB: A8        TAY
C - - - - - 0x00D8FC 03:98EC: B9 01 99  LDA tbl_9901,Y
C - - - - - 0x00D8FF 03:98EF: C5 82     CMP ram_0082
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
C - - - - - 0x00D91C 03:990C: A6 8D     LDX ram_008D
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
C - - - - - 0x00D931 03:9921: 8D F0 07  STA ram_chr_bank
C - - - - - 0x00D934 03:9924: A0 30     LDY #con_F97C_colors + $30
bra_9926:
C - - - - - 0x00D936 03:9926: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_9929:
C - - - - - 0x00D939 03:9929: E6 8D     INC ram_008D
C - - - - - 0x00D93B 03:992B: 60        RTS
bra_992C:
C - - - - - 0x00D93C 03:992C: CA        DEX
C - - - - - 0x00D93D 03:992D: D0 0E     BNE bra_993D
C - - - - - 0x00D93F 03:992F: A9 2A     LDA #con_chr_bank + $2A
C - - - - - 0x00D941 03:9931: 8D F1 07  STA ram_chr_bank + $01
C - - - - - 0x00D944 03:9934: A9 65     LDA #con_chr_bank + $65
C - - - - - 0x00D946 03:9936: 8D F5 07  STA ram_chr_bank + $05
C - - - - - 0x00D949 03:9939: A0 34     LDY #con_F97C_colors + $34
C - - - - - 0x00D94B 03:993B: D0 E9     BNE bra_9926    ; jmp
bra_993D:
C - - - - - 0x00D94D 03:993D: CA        DEX
C - - - - - 0x00D94E 03:993E: D0 1D     BNE bra_995D
C - - - - - 0x00D950 03:9940: A0 10     LDY #$10
C - - - - - 0x00D952 03:9942: 20 30 FA  JSR sub_0x01FA40
C - - - - - 0x00D955 03:9945: A9 2C     LDA #con_chr_bank + $2C
C - - - - - 0x00D957 03:9947: 8D F0 07  STA ram_chr_bank
C - - - - - 0x00D95A 03:994A: A9 2E     LDA #con_chr_bank + $2E
C - - - - - 0x00D95C 03:994C: 8D F1 07  STA ram_chr_bank + $01
C - - - - - 0x00D95F 03:994F: A9 66     LDA #con_chr_bank + $66
C - - - - - 0x00D961 03:9951: 8D F4 07  STA ram_chr_bank + $04
C - - - - - 0x00D964 03:9954: A0 50     LDY #con_F97C_colors + $50
C - - - - - 0x00D966 03:9956: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x00D969 03:9959: A0 54     LDY #con_F97C_colors + $54
C - - - - - 0x00D96B 03:995B: D0 C9     BNE bra_9926    ; jmp
bra_995D:
C - - - - - 0x00D96D 03:995D: CA        DEX
C - - - - - 0x00D96E 03:995E: D0 06     BNE bra_9966_RTS
C - - - - - 0x00D970 03:9960: A9 C0     LDA #$C0
C - - - - - 0x00D972 03:9962: 85 7D     STA ram_007D_flag
C - - - - - 0x00D974 03:9964: D0 C3     BNE bra_9929    ; jmp
bra_9966_RTS:
- - - - - - 0x00D976 03:9966: 60        RTS



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
C - - - - - 0x00D990 03:9980: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
bra_9983:
C - - - - - 0x00D993 03:9983: A5 39     LDA ram_пауза
C - - - - - 0x00D995 03:9985: F0 07     BEQ bra_998E
C - - - - - 0x00D997 03:9987: 60        RTS



tbl_9988:
- D 0 - - - 0x00D998 03:9988: 58        .byte con_F97C_colors + $58   ; 
- D 0 - - - 0x00D999 03:9989: 5C        .byte con_F97C_colors + $5C   ; 
- D 0 - - - 0x00D99A 03:998A: 60        .byte con_F97C_colors + $60   ; 
- D 0 - - - 0x00D99B 03:998B: 60        .byte con_F97C_colors + $60   ; 
- D 0 - - - 0x00D99C 03:998C: 5C        .byte con_F97C_colors + $5C   ; 
- D 0 - - - 0x00D99D 03:998D: 58        .byte con_F97C_colors + $58   ; 



bra_998E:
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
C - - - - - 0x00D9D5 03:99C5: A5 8C     LDA ram_008C
C - - - - - 0x00D9D7 03:99C7: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00D9DA 03:99CA: E4 99     .word ofs_026_99E4_00
- D 0 - I - 0x00D9DC 03:99CC: 2D 9A     .word ofs_026_9A2D_01
- D 0 - I - 0x00D9DE 03:99CE: EC 99     .word ofs_026_99EC_02
- D 0 - I - 0x00D9E0 03:99D0: 2D 9A     .word ofs_026_9A2D_03
- D 0 - I - 0x00D9E2 03:99D2: EC 99     .word ofs_026_99EC_04
- D 0 - I - 0x00D9E4 03:99D4: F7 99     .word ofs_026_99F7_05
- D 0 - I - 0x00D9E6 03:99D6: 0A 9A     .word ofs_026_9A0A_06
- D 0 - I - 0x00D9E8 03:99D8: 1B 9A     .word ofs_026_9A1B_07
- D 0 - I - 0x00D9EA 03:99DA: F7 99     .word ofs_026_99F7_08
- D 0 - I - 0x00D9EC 03:99DC: 23 9A     .word ofs_026_9A23_09
- D 0 - I - 0x00D9EE 03:99DE: 2D 9A     .word ofs_026_9A2D_0A
- D 0 - I - 0x00D9F0 03:99E0: 33 9A     .word ofs_026_9A33_0B
- - - - - - 0x00D9F2 03:99E2: 39 9A     .word ofs_026_9A39_0C_RTS



ofs_026_99E4_00:
C - - J - - 0x00D9F4 03:99E4: A9 40     LDA #$40
C - - - - - 0x00D9F6 03:99E6: 85 7D     STA ram_007D_flag
C - - - - - 0x00D9F8 03:99E8: 85 71     STA ram_0071_flag
C - - - - - 0x00D9FA 03:99EA: D0 08     BNE bra_99F4    ; jmp



ofs_026_99EC_02:
ofs_026_99EC_04:
C - - J - - 0x00D9FC 03:99EC: A9 02     LDA #$02
C - - - - - 0x00D9FE 03:99EE: 85 61     STA ram_0061
C - - - - - 0x00DA00 03:99F0: A9 00     LDA #$00
C - - - - - 0x00DA02 03:99F2: 85 6F     STA ram_006F
bra_99F4:
loc_99F4:
C D 0 - - - 0x00DA04 03:99F4: E6 8C     INC ram_008C
C - - - - - 0x00DA06 03:99F6: 60        RTS



ofs_026_99F7_05:
ofs_026_99F7_08:
C - - J - - 0x00DA07 03:99F7: A9 C0     LDA #$C0
C - - - - - 0x00DA09 03:99F9: 85 7D     STA ram_007D_flag
C - - - - - 0x00DA0B 03:99FB: 85 71     STA ram_0071_flag
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
C - - - - - 0x00DA21 03:9A11: 8D F0 07  STA ram_chr_bank
C - - - - - 0x00DA24 03:9A14: A9 6E     LDA #con_chr_bank + $6E
C - - - - - 0x00DA26 03:9A16: 8D F1 07  STA ram_chr_bank + $01
C - - - - - 0x00DA29 03:9A19: D0 D9     BNE bra_99F4    ; jmp



ofs_026_9A1B_07:
C - - J - - 0x00DA2B 03:9A1B: A9 80     LDA #$80
C - - - - - 0x00DA2D 03:9A1D: 85 7D     STA ram_007D_flag
C - - - - - 0x00DA2F 03:9A1F: 85 71     STA ram_0071_flag
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
C - - - - - 0x00DA45 03:9A35: 85 61     STA ram_0061
C - - - - - 0x00DA47 03:9A37: D0 BB     BNE bra_99F4    ; jmp



bra_9A39_RTS:
ofs_026_9A39_0C_RTS:
C - - - - - 0x00DA49 03:9A39: 60        RTS



sub_9A3A:
C - - - - - 0x00DA4A 03:9A3A: A5 8D     LDA ram_008D
C - - - - - 0x00DA4C 03:9A3C: 0A        ASL
C - - - - - 0x00DA4D 03:9A3D: A8        TAY
C - - - - - 0x00DA4E 03:9A3E: B9 55 9A  LDA tbl_9A55,Y
C - - - - - 0x00DA51 03:9A41: C5 82     CMP ram_0082
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
C - - - - - 0x00DA6C 03:9A5C: A5 8D     LDA ram_008D
C - - - - - 0x00DA6E 03:9A5E: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00DA71 03:9A61: 69 9A     .word ofs_027_9A69_00
- D 0 - I - 0x00DA73 03:9A63: 69 9A     .word ofs_027_9A69_01
- D 0 - I - 0x00DA75 03:9A65: 70 9A     .word ofs_027_9A70_02
- D 0 - I - 0x00DA77 03:9A67: 76 9A     .word ofs_027_9A76_03_RTS



ofs_027_9A69_00:
ofs_027_9A69_01:
C - - J - - 0x00DA79 03:9A69: A9 00     LDA #$00
C - - - - - 0x00DA7B 03:9A6B: 85 61     STA ram_0061
bra_9A6D:
C - - - - - 0x00DA7D 03:9A6D: E6 8D     INC ram_008D
C - - - - - 0x00DA7F 03:9A6F: 60        RTS



ofs_027_9A70_02:
C - - J - - 0x00DA80 03:9A70: A9 C0     LDA #$C0
C - - - - - 0x00DA82 03:9A72: 85 71     STA ram_0071_flag
C - - - - - 0x00DA84 03:9A74: D0 F7     BNE bra_9A6D    ; jmp



ofs_027_9A76_03_RTS:
C - - J - - 0x00DA86 03:9A76: 60        RTS



_off004_0x00DA87_03_area_4:
- D 0 - I - 0x00DA87 03:9A77: 07        .byte $07   ; config
- D 0 - I - 0x00DA88 03:9A78: 0D        .byte $0D   ; config

- - - - - - 0x00DA89 03:9A79: 00        .byte $00   ; 
- - - - - - 0x00DA8A 03:9A7A: 00        .byte $00   ; 
- - - - - - 0x00DA8B 03:9A7B: 00        .byte $00   ; 
- D 0 - I - 0x00DA8C 03:9A7C: 0E        .byte $0E   ; 
- D 0 - I - 0x00DA8D 03:9A7D: 12        .byte $12   ; 
- - - - - - 0x00DA8E 03:9A7E: 00        .byte $00   ; 
- D 0 - I - 0x00DA8F 03:9A7F: 10        .byte $10   ; 
- - - - - - 0x00DA90 03:9A80: 00        .byte $00   ; 
- - - - - - 0x00DA91 03:9A81: 00        .byte $00   ; 
- - - - - - 0x00DA92 03:9A82: 00        .byte $00   ; 
- D 0 - I - 0x00DA93 03:9A83: 0D        .byte $0D   ; 
- D 0 - I - 0x00DA94 03:9A84: 11        .byte $11   ; 
- - - - - - 0x00DA95 03:9A85: 00        .byte $00   ; 
- D 0 - I - 0x00DA96 03:9A86: 0F        .byte $0F   ; 
- - - - - - 0x00DA97 03:9A87: 00        .byte $00   ; 
- - - - - - 0x00DA98 03:9A88: 00        .byte $00   ; 
- - - - - - 0x00DA99 03:9A89: 00        .byte $00   ; 
- D 0 - I - 0x00DA9A 03:9A8A: 0C        .byte $0C   ; 
- - - - - - 0x00DA9B 03:9A8B: 00        .byte $00   ; 
- - - - - - 0x00DA9C 03:9A8C: 00        .byte $00   ; 
- - - - - - 0x00DA9D 03:9A8D: 00        .byte $00   ; 
- - - - - - 0x00DA9E 03:9A8E: 00        .byte $00   ; 
- - - - - - 0x00DA9F 03:9A8F: 00        .byte $00   ; 
- - - - - - 0x00DAA0 03:9A90: 00        .byte $00   ; 
- D 0 - I - 0x00DAA1 03:9A91: 0B        .byte $0B   ; 
- - - - - - 0x00DAA2 03:9A92: 00        .byte $00   ; 
- - - - - - 0x00DAA3 03:9A93: 00        .byte $00   ; 
- - - - - - 0x00DAA4 03:9A94: 00        .byte $00   ; 
- - - - - - 0x00DAA5 03:9A95: 00        .byte $00   ; 
- - - - - - 0x00DAA6 03:9A96: 00        .byte $00   ; 
- - - - - - 0x00DAA7 03:9A97: 00        .byte $00   ; 
- D 0 - I - 0x00DAA8 03:9A98: 0A        .byte $0A   ; 
- - - - - - 0x00DAA9 03:9A99: 00        .byte $00   ; 
- - - - - - 0x00DAAA 03:9A9A: 00        .byte $00   ; 
- - - - - - 0x00DAAB 03:9A9B: 00        .byte $00   ; 
- - - - - - 0x00DAAC 03:9A9C: 00        .byte $00   ; 
- - - - - - 0x00DAAD 03:9A9D: 00        .byte $00   ; 
- - - - - - 0x00DAAE 03:9A9E: 00        .byte $00   ; 
- D 0 - I - 0x00DAAF 03:9A9F: 09        .byte $09   ; 
- - - - - - 0x00DAB0 03:9AA0: 00        .byte $00   ; 
- - - - - - 0x00DAB1 03:9AA1: 00        .byte $00   ; 
- - - - - - 0x00DAB2 03:9AA2: 00        .byte $00   ; 
- - - - - - 0x00DAB3 03:9AA3: 00        .byte $00   ; 
- - - - - - 0x00DAB4 03:9AA4: 00        .byte $00   ; 
- - - - - - 0x00DAB5 03:9AA5: 00        .byte $00   ; 
- D 0 - I - 0x00DAB6 03:9AA6: 08        .byte $08   ; 
- - - - - - 0x00DAB7 03:9AA7: 00        .byte $00   ; 
- - - - - - 0x00DAB8 03:9AA8: 00        .byte $00   ; 
- - - - - - 0x00DAB9 03:9AA9: 00        .byte $00   ; 
- - - - - - 0x00DABA 03:9AAA: 00        .byte $00   ; 
- - - - - - 0x00DABB 03:9AAB: 00        .byte $00   ; 
- - - - - - 0x00DABC 03:9AAC: 00        .byte $00   ; 
- D 0 - I - 0x00DABD 03:9AAD: 07        .byte $07   ; 
- - - - - - 0x00DABE 03:9AAE: 00        .byte $00   ; 
- - - - - - 0x00DABF 03:9AAF: 00        .byte $00   ; 
- - - - - - 0x00DAC0 03:9AB0: 00        .byte $00   ; 
- - - - - - 0x00DAC1 03:9AB1: 00        .byte $00   ; 
- - - - - - 0x00DAC2 03:9AB2: 00        .byte $00   ; 
- - - - - - 0x00DAC3 03:9AB3: 00        .byte $00   ; 
- D 0 - I - 0x00DAC4 03:9AB4: 06        .byte $06   ; 
- - - - - - 0x00DAC5 03:9AB5: 00        .byte $00   ; 
- - - - - - 0x00DAC6 03:9AB6: 00        .byte $00   ; 
- - - - - - 0x00DAC7 03:9AB7: 00        .byte $00   ; 
- - - - - - 0x00DAC8 03:9AB8: 00        .byte $00   ; 
- - - - - - 0x00DAC9 03:9AB9: 00        .byte $00   ; 
- - - - - - 0x00DACA 03:9ABA: 00        .byte $00   ; 
- D 0 - I - 0x00DACB 03:9ABB: 05        .byte $05   ; 
- - - - - - 0x00DACC 03:9ABC: 00        .byte $00   ; 
- - - - - - 0x00DACD 03:9ABD: 00        .byte $00   ; 
- - - - - - 0x00DACE 03:9ABE: 00        .byte $00   ; 
- - - - - - 0x00DACF 03:9ABF: 00        .byte $00   ; 
- - - - - - 0x00DAD0 03:9AC0: 00        .byte $00   ; 
- - - - - - 0x00DAD1 03:9AC1: 00        .byte $00   ; 
- D 0 - I - 0x00DAD2 03:9AC2: 04        .byte $04   ; 
- - - - - - 0x00DAD3 03:9AC3: 00        .byte $00   ; 
- - - - - - 0x00DAD4 03:9AC4: 00        .byte $00   ; 
- - - - - - 0x00DAD5 03:9AC5: 00        .byte $00   ; 
- - - - - - 0x00DAD6 03:9AC6: 00        .byte $00   ; 
- - - - - - 0x00DAD7 03:9AC7: 00        .byte $00   ; 
- - - - - - 0x00DAD8 03:9AC8: 00        .byte $00   ; 
- D 0 - I - 0x00DAD9 03:9AC9: 03        .byte $03   ; 
- - - - - - 0x00DADA 03:9ACA: 00        .byte $00   ; 
- - - - - - 0x00DADB 03:9ACB: 00        .byte $00   ; 
- - - - - - 0x00DADC 03:9ACC: 00        .byte $00   ; 
- D 0 - I - 0x00DADD 03:9ACD: 01        .byte $01   ; 
- D 0 - I - 0x00DADE 03:9ACE: 01        .byte $01   ; 
- D 0 - I - 0x00DADF 03:9ACF: 01        .byte $01   ; 
- D 0 - I - 0x00DAE0 03:9AD0: 02        .byte $02   ; 
- D 0 - I - 0x00DAE1 03:9AD1: 00        .byte $00   ; 
- - - - - - 0x00DAE2 03:9AD2: 00        .byte $00   ; 
- - - - - - 0x00DAE3 03:9AD3: 00        .byte $00   ; 



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
- D 0 - I - 0x00DB0A 03:9AFA: 00        .byte $00   ; 
- D 0 - I - 0x00DB0B 03:9AFB: 00        .byte $00   ; 
- - - - - - 0x00DB0C 03:9AFC: 00        .byte $00   ; 
- - - - - - 0x00DB0D 03:9AFD: 00        .byte $00   ; 
- - - - - - 0x00DB0E 03:9AFE: 00        .byte $00   ; 
- - - - - - 0x00DB0F 03:9AFF: 00        .byte $00   ; 
- - - - - - 0x00DB10 03:9B00: 00        .byte $00   ; 
- - - - - - 0x00DB11 03:9B01: 00        .byte $00   ; 
- D 0 - I - 0x00DB12 03:9B02: 00        .byte $00   ; 
- D 0 - I - 0x00DB13 03:9B03: 00        .byte $00   ; 
- - - - - - 0x00DB14 03:9B04: 00        .byte $00   ; 
- - - - - - 0x00DB15 03:9B05: 00        .byte $00   ; 
- - - - - - 0x00DB16 03:9B06: 00        .byte $00   ; 
- - - - - - 0x00DB17 03:9B07: 00        .byte $00   ; 
- - - - - - 0x00DB18 03:9B08: 00        .byte $00   ; 
- - - - - - 0x00DB19 03:9B09: 00        .byte $00   ; 
- D 0 - I - 0x00DB1A 03:9B0A: 00        .byte $00   ; 
- D 0 - I - 0x00DB1B 03:9B0B: 00        .byte $00   ; 
- - - - - - 0x00DB1C 03:9B0C: 00        .byte $00   ; 
- - - - - - 0x00DB1D 03:9B0D: 00        .byte $00   ; 
- - - - - - 0x00DB1E 03:9B0E: 00        .byte $00   ; 
- - - - - - 0x00DB1F 03:9B0F: 00        .byte $00   ; 
- - - - - - 0x00DB20 03:9B10: 00        .byte $00   ; 
- - - - - - 0x00DB21 03:9B11: 00        .byte $00   ; 
- D 0 - I - 0x00DB22 03:9B12: 00        .byte $00   ; 
- D 0 - I - 0x00DB23 03:9B13: 00        .byte $00   ; 
- - - - - - 0x00DB24 03:9B14: 00        .byte $00   ; 
- - - - - - 0x00DB25 03:9B15: 00        .byte $00   ; 
- - - - - - 0x00DB26 03:9B16: 00        .byte $00   ; 
- - - - - - 0x00DB27 03:9B17: 00        .byte $00   ; 
- - - - - - 0x00DB28 03:9B18: 00        .byte $00   ; 
- - - - - - 0x00DB29 03:9B19: 00        .byte $00   ; 
- D 0 - I - 0x00DB2A 03:9B1A: 00        .byte $00   ; 
- D 0 - I - 0x00DB2B 03:9B1B: 00        .byte $00   ; 
- - - - - - 0x00DB2C 03:9B1C: 00        .byte $00   ; 
- - - - - - 0x00DB2D 03:9B1D: 00        .byte $00   ; 
- - - - - - 0x00DB2E 03:9B1E: 00        .byte $00   ; 
- - - - - - 0x00DB2F 03:9B1F: 00        .byte $00   ; 
- - - - - - 0x00DB30 03:9B20: 00        .byte $00   ; 
- - - - - - 0x00DB31 03:9B21: 00        .byte $00   ; 
- D 0 - I - 0x00DB32 03:9B22: 00        .byte $00   ; 
- D 0 - I - 0x00DB33 03:9B23: 00        .byte $00   ; 
- - - - - - 0x00DB34 03:9B24: 00        .byte $00   ; 
- - - - - - 0x00DB35 03:9B25: 00        .byte $00   ; 
- - - - - - 0x00DB36 03:9B26: 00        .byte $00   ; 
- - - - - - 0x00DB37 03:9B27: 00        .byte $00   ; 
- - - - - - 0x00DB38 03:9B28: 00        .byte $00   ; 
- - - - - - 0x00DB39 03:9B29: 00        .byte $00   ; 
- D 0 - I - 0x00DB3A 03:9B2A: 00        .byte $00   ; 
- D 0 - I - 0x00DB3B 03:9B2B: 00        .byte $00   ; 
- - - - - - 0x00DB3C 03:9B2C: 00        .byte $00   ; 
- - - - - - 0x00DB3D 03:9B2D: 00        .byte $00   ; 
- - - - - - 0x00DB3E 03:9B2E: 00        .byte $00   ; 
- - - - - - 0x00DB3F 03:9B2F: 00        .byte $00   ; 
- - - - - - 0x00DB40 03:9B30: 00        .byte $00   ; 
- - - - - - 0x00DB41 03:9B31: 00        .byte $00   ; 
- D 0 - I - 0x00DB42 03:9B32: 00        .byte $00   ; 
- D 0 - I - 0x00DB43 03:9B33: 00        .byte $00   ; 
- - - - - - 0x00DB44 03:9B34: 00        .byte $00   ; 
- - - - - - 0x00DB45 03:9B35: 00        .byte $00   ; 
- - - - - - 0x00DB46 03:9B36: 00        .byte $00   ; 
- - - - - - 0x00DB47 03:9B37: 00        .byte $00   ; 
- - - - - - 0x00DB48 03:9B38: 00        .byte $00   ; 
- - - - - - 0x00DB49 03:9B39: 00        .byte $00   ; 



_off018_03_9B3A_01:
- D 0 - I - 0x00DB4A 03:9B3A: 00        .byte $00   ; 
- D 0 - I - 0x00DB4B 03:9B3B: 00        .byte $00   ; 
- D 0 - I - 0x00DB4C 03:9B3C: 00        .byte $00   ; 
- D 0 - I - 0x00DB4D 03:9B3D: 00        .byte $00   ; 
- D 0 - I - 0x00DB4E 03:9B3E: 00        .byte $00   ; 
- D 0 - I - 0x00DB4F 03:9B3F: 00        .byte $00   ; 
- D 0 - I - 0x00DB50 03:9B40: 00        .byte $00   ; 
- D 0 - I - 0x00DB51 03:9B41: 00        .byte $00   ; 
- D 0 - I - 0x00DB52 03:9B42: 8B        .byte $8B   ; 
- D 0 - I - 0x00DB53 03:9B43: 12        .byte $12   ; 
- D 0 - I - 0x00DB54 03:9B44: 8B        .byte $8B   ; 
- D 0 - I - 0x00DB55 03:9B45: 12        .byte $12   ; 
- D 0 - I - 0x00DB56 03:9B46: 8B        .byte $8B   ; 
- D 0 - I - 0x00DB57 03:9B47: 12        .byte $12   ; 
- D 0 - I - 0x00DB58 03:9B48: 8B        .byte $8B   ; 
- D 0 - I - 0x00DB59 03:9B49: 12        .byte $12   ; 
- D 0 - I - 0x00DB5A 03:9B4A: 78        .byte $78   ; 
- D 0 - I - 0x00DB5B 03:9B4B: 79        .byte $79   ; 
- D 0 - I - 0x00DB5C 03:9B4C: 7A        .byte $7A   ; 
- D 0 - I - 0x00DB5D 03:9B4D: 7B        .byte $7B   ; 
- D 0 - I - 0x00DB5E 03:9B4E: 7A        .byte $7A   ; 
- D 0 - I - 0x00DB5F 03:9B4F: 7C        .byte $7C   ; 
- D 0 - I - 0x00DB60 03:9B50: 7A        .byte $7A   ; 
- D 0 - I - 0x00DB61 03:9B51: 88        .byte $88   ; 
- D 0 - I - 0x00DB62 03:9B52: 81        .byte $81   ; 
- D 0 - I - 0x00DB63 03:9B53: 82        .byte $82   ; 
- D 0 - I - 0x00DB64 03:9B54: 00        .byte $00   ; 
- D 0 - I - 0x00DB65 03:9B55: 86        .byte $86   ; 
- D 0 - I - 0x00DB66 03:9B56: 86        .byte $86   ; 
- D 0 - I - 0x00DB67 03:9B57: 86        .byte $86   ; 
- D 0 - I - 0x00DB68 03:9B58: 86        .byte $86   ; 
- D 0 - I - 0x00DB69 03:9B59: 2B        .byte $2B   ; 
- D 0 - I - 0x00DB6A 03:9B5A: 62        .byte $62   ; 
- D 0 - I - 0x00DB6B 03:9B5B: 27        .byte $27   ; 
- D 0 - I - 0x00DB6C 03:9B5C: 00        .byte $00   ; 
- D 0 - I - 0x00DB6D 03:9B5D: 87        .byte $87   ; 
- D 0 - I - 0x00DB6E 03:9B5E: 87        .byte $87   ; 
- D 0 - I - 0x00DB6F 03:9B5F: 87        .byte $87   ; 
- D 0 - I - 0x00DB70 03:9B60: 87        .byte $87   ; 
- D 0 - I - 0x00DB71 03:9B61: 00        .byte $00   ; 
- D 0 - I - 0x00DB72 03:9B62: 7D        .byte $7D   ; 
- D 0 - I - 0x00DB73 03:9B63: 7E        .byte $7E   ; 
- D 0 - I - 0x00DB74 03:9B64: 7F        .byte $7F   ; 
- D 0 - I - 0x00DB75 03:9B65: 80        .byte $80   ; 
- D 0 - I - 0x00DB76 03:9B66: 7D        .byte $7D   ; 
- D 0 - I - 0x00DB77 03:9B67: 7E        .byte $7E   ; 
- D 0 - I - 0x00DB78 03:9B68: 7F        .byte $7F   ; 
- D 0 - I - 0x00DB79 03:9B69: 80        .byte $80   ; 
- D 0 - I - 0x00DB7A 03:9B6A: 00        .byte $00   ; 
- D 0 - I - 0x00DB7B 03:9B6B: 00        .byte $00   ; 
- D 0 - I - 0x00DB7C 03:9B6C: 00        .byte $00   ; 
- D 0 - I - 0x00DB7D 03:9B6D: 00        .byte $00   ; 
- D 0 - I - 0x00DB7E 03:9B6E: 00        .byte $00   ; 
- D 0 - I - 0x00DB7F 03:9B6F: 00        .byte $00   ; 
- D 0 - I - 0x00DB80 03:9B70: 00        .byte $00   ; 
- D 0 - I - 0x00DB81 03:9B71: 00        .byte $00   ; 
- D 0 - I - 0x00DB82 03:9B72: 00        .byte $00   ; 
- D 0 - I - 0x00DB83 03:9B73: 00        .byte $00   ; 
- D 0 - I - 0x00DB84 03:9B74: 00        .byte $00   ; 
- D 0 - I - 0x00DB85 03:9B75: 00        .byte $00   ; 
- D 0 - I - 0x00DB86 03:9B76: 00        .byte $00   ; 
- D 0 - I - 0x00DB87 03:9B77: 00        .byte $00   ; 
- D 0 - I - 0x00DB88 03:9B78: 00        .byte $00   ; 
- D 0 - I - 0x00DB89 03:9B79: 00        .byte $00   ; 



_off018_03_9B7A_02:
- D 0 - I - 0x00DB8A 03:9B7A: 30        .byte $30   ; 
- D 0 - I - 0x00DB8B 03:9B7B: 41        .byte $41   ; 
- D 0 - I - 0x00DB8C 03:9B7C: 10        .byte $10   ; 
- D 0 - I - 0x00DB8D 03:9B7D: 10        .byte $10   ; 
- D 0 - I - 0x00DB8E 03:9B7E: 10        .byte $10   ; 
- D 0 - I - 0x00DB8F 03:9B7F: 10        .byte $10   ; 
- D 0 - I - 0x00DB90 03:9B80: 42        .byte $42   ; 
- D 0 - I - 0x00DB91 03:9B81: 31        .byte $31   ; 
- D 0 - I - 0x00DB92 03:9B82: 18        .byte $18   ; 
- D 0 - I - 0x00DB93 03:9B83: 40        .byte $40   ; 
- D 0 - I - 0x00DB94 03:9B84: 00        .byte $00   ; 
- D 0 - I - 0x00DB95 03:9B85: 81        .byte $81   ; 
- D 0 - I - 0x00DB96 03:9B86: 82        .byte $82   ; 
- D 0 - I - 0x00DB97 03:9B87: 00        .byte $00   ; 
- D 0 - I - 0x00DB98 03:9B88: 32        .byte $32   ; 
- D 0 - I - 0x00DB99 03:9B89: 1B        .byte $1B   ; 
- D 0 - I - 0x00DB9A 03:9B8A: 89        .byte $89   ; 
- D 0 - I - 0x00DB9B 03:9B8B: 2B        .byte $2B   ; 
- D 0 - I - 0x00DB9C 03:9B8C: 3C        .byte $3C   ; 
- D 0 - I - 0x00DB9D 03:9B8D: 62        .byte $62   ; 
- D 0 - I - 0x00DB9E 03:9B8E: 27        .byte $27   ; 
- D 0 - I - 0x00DB9F 03:9B8F: 3C        .byte $3C   ; 
- D 0 - I - 0x00DBA0 03:9B90: 2B        .byte $2B   ; 
- D 0 - I - 0x00DBA1 03:9B91: 1A        .byte $1A   ; 
- D 0 - I - 0x00DBA2 03:9B92: 00        .byte $00   ; 
- D 0 - I - 0x00DBA3 03:9B93: 2B        .byte $2B   ; 
- D 0 - I - 0x00DBA4 03:9B94: 00        .byte $00   ; 
- D 0 - I - 0x00DBA5 03:9B95: 00        .byte $00   ; 
- D 0 - I - 0x00DBA6 03:9B96: 00        .byte $00   ; 
- D 0 - I - 0x00DBA7 03:9B97: 00        .byte $00   ; 
- D 0 - I - 0x00DBA8 03:9B98: 2B        .byte $2B   ; 
- D 0 - I - 0x00DBA9 03:9B99: 1B        .byte $1B   ; 
- D 0 - I - 0x00DBAA 03:9B9A: 00        .byte $00   ; 
- D 0 - I - 0x00DBAB 03:9B9B: 00        .byte $00   ; 
- D 0 - I - 0x00DBAC 03:9B9C: 15        .byte $15   ; 
- D 0 - I - 0x00DBAD 03:9B9D: 15        .byte $15   ; 
- D 0 - I - 0x00DBAE 03:9B9E: 15        .byte $15   ; 
- D 0 - I - 0x00DBAF 03:9B9F: 15        .byte $15   ; 
- D 0 - I - 0x00DBB0 03:9BA0: 00        .byte $00   ; 
- D 0 - I - 0x00DBB1 03:9BA1: 19        .byte $19   ; 
- D 0 - I - 0x00DBB2 03:9BA2: 7D        .byte $7D   ; 
- D 0 - I - 0x00DBB3 03:9BA3: 7E        .byte $7E   ; 
- D 0 - I - 0x00DBB4 03:9BA4: 7F        .byte $7F   ; 
- D 0 - I - 0x00DBB5 03:9BA5: 80        .byte $80   ; 
- D 0 - I - 0x00DBB6 03:9BA6: 8A        .byte $8A   ; 
- D 0 - I - 0x00DBB7 03:9BA7: 7E        .byte $7E   ; 
- D 0 - I - 0x00DBB8 03:9BA8: 8A        .byte $8A   ; 
- D 0 - I - 0x00DBB9 03:9BA9: 13        .byte $13   ; 
- D 0 - I - 0x00DBBA 03:9BAA: 00        .byte $00   ; 
- D 0 - I - 0x00DBBB 03:9BAB: 00        .byte $00   ; 
- D 0 - I - 0x00DBBC 03:9BAC: 00        .byte $00   ; 
- D 0 - I - 0x00DBBD 03:9BAD: 00        .byte $00   ; 
- D 0 - I - 0x00DBBE 03:9BAE: 00        .byte $00   ; 
- D 0 - I - 0x00DBBF 03:9BAF: 00        .byte $00   ; 
- D 0 - I - 0x00DBC0 03:9BB0: 00        .byte $00   ; 
- D 0 - I - 0x00DBC1 03:9BB1: 00        .byte $00   ; 
- D 0 - I - 0x00DBC2 03:9BB2: 00        .byte $00   ; 
- D 0 - I - 0x00DBC3 03:9BB3: 00        .byte $00   ; 
- D 0 - I - 0x00DBC4 03:9BB4: 00        .byte $00   ; 
- D 0 - I - 0x00DBC5 03:9BB5: 00        .byte $00   ; 
- D 0 - I - 0x00DBC6 03:9BB6: 00        .byte $00   ; 
- D 0 - I - 0x00DBC7 03:9BB7: 00        .byte $00   ; 
- D 0 - I - 0x00DBC8 03:9BB8: 00        .byte $00   ; 
- D 0 - I - 0x00DBC9 03:9BB9: 00        .byte $00   ; 



_off018_03_9BBA_03:
- D 0 - I - 0x00DBCA 03:9BBA: 5E        .byte $5E   ; 
- D 0 - I - 0x00DBCB 03:9BBB: 36        .byte $36   ; 
- D 0 - I - 0x00DBCC 03:9BBC: 37        .byte $37   ; 
- D 0 - I - 0x00DBCD 03:9BBD: 00        .byte $00   ; 
- D 0 - I - 0x00DBCE 03:9BBE: 63        .byte $63   ; 
- D 0 - I - 0x00DBCF 03:9BBF: 68        .byte $68   ; 
- D 0 - I - 0x00DBD0 03:9BC0: 15        .byte $15   ; 
- D 0 - I - 0x00DBD1 03:9BC1: 23        .byte $23   ; 
- D 0 - I - 0x00DBD2 03:9BC2: 4D        .byte $4D   ; 
- D 0 - I - 0x00DBD3 03:9BC3: 2E        .byte $2E   ; 
- D 0 - I - 0x00DBD4 03:9BC4: 15        .byte $15   ; 
- D 0 - I - 0x00DBD5 03:9BC5: 68        .byte $68   ; 
- D 0 - I - 0x00DBD6 03:9BC6: 66        .byte $66   ; 
- D 0 - I - 0x00DBD7 03:9BC7: 15        .byte $15   ; 
- D 0 - I - 0x00DBD8 03:9BC8: 15        .byte $15   ; 
- D 0 - I - 0x00DBD9 03:9BC9: 19        .byte $19   ; 
- D 0 - I - 0x00DBDA 03:9BCA: 44        .byte $44   ; 
- D 0 - I - 0x00DBDB 03:9BCB: 01        .byte $01   ; 
- D 0 - I - 0x00DBDC 03:9BCC: 63        .byte $63   ; 
- D 0 - I - 0x00DBDD 03:9BCD: 64        .byte $64   ; 
- D 0 - I - 0x00DBDE 03:9BCE: 4F        .byte $4F   ; 
- D 0 - I - 0x00DBDF 03:9BCF: 01        .byte $01   ; 
- D 0 - I - 0x00DBE0 03:9BD0: 00        .byte $00   ; 
- D 0 - I - 0x00DBE1 03:9BD1: 1B        .byte $1B   ; 
- D 0 - I - 0x00DBE2 03:9BD2: 45        .byte $45   ; 
- D 0 - I - 0x00DBE3 03:9BD3: 26        .byte $26   ; 
- D 0 - I - 0x00DBE4 03:9BD4: 66        .byte $66   ; 
- D 0 - I - 0x00DBE5 03:9BD5: 65        .byte $65   ; 
- D 0 - I - 0x00DBE6 03:9BD6: 2B        .byte $2B   ; 
- D 0 - I - 0x00DBE7 03:9BD7: 3C        .byte $3C   ; 
- D 0 - I - 0x00DBE8 03:9BD8: 63        .byte $63   ; 
- D 0 - I - 0x00DBE9 03:9BD9: 84        .byte $84   ; 
- D 0 - I - 0x00DBEA 03:9BDA: 16        .byte $16   ; 
- D 0 - I - 0x00DBEB 03:9BDB: 26        .byte $26   ; 
- D 0 - I - 0x00DBEC 03:9BDC: 14        .byte $14   ; 
- D 0 - I - 0x00DBED 03:9BDD: 14        .byte $14   ; 
- D 0 - I - 0x00DBEE 03:9BDE: 63        .byte $63   ; 
- D 0 - I - 0x00DBEF 03:9BDF: 68        .byte $68   ; 
- D 0 - I - 0x00DBF0 03:9BE0: 6A        .byte $6A   ; 
- D 0 - I - 0x00DBF1 03:9BE1: 5F        .byte $5F   ; 
- D 0 - I - 0x00DBF2 03:9BE2: 20        .byte $20   ; 
- D 0 - I - 0x00DBF3 03:9BE3: 14        .byte $14   ; 
- D 0 - I - 0x00DBF4 03:9BE4: 3C        .byte $3C   ; 
- D 0 - I - 0x00DBF5 03:9BE5: 67        .byte $67   ; 
- D 0 - I - 0x00DBF6 03:9BE6: 66        .byte $66   ; 
- D 0 - I - 0x00DBF7 03:9BE7: 15        .byte $15   ; 
- D 0 - I - 0x00DBF8 03:9BE8: 6B        .byte $6B   ; 
- D 0 - I - 0x00DBF9 03:9BE9: 23        .byte $23   ; 
- D 0 - I - 0x00DBFA 03:9BEA: 1C        .byte $1C   ; 
- D 0 - I - 0x00DBFB 03:9BEB: 68        .byte $68   ; 
- D 0 - I - 0x00DBFC 03:9BEC: 64        .byte $64   ; 
- D 0 - I - 0x00DBFD 03:9BED: 3C        .byte $3C   ; 
- D 0 - I - 0x00DBFE 03:9BEE: 3C        .byte $3C   ; 
- D 0 - I - 0x00DBFF 03:9BEF: 3C        .byte $3C   ; 
- D 0 - I - 0x00DC00 03:9BF0: 67        .byte $67   ; 
- D 0 - I - 0x00DC01 03:9BF1: 19        .byte $19   ; 
- D 0 - I - 0x00DC02 03:9BF2: 1E        .byte $1E   ; 
- D 0 - I - 0x00DC03 03:9BF3: 00        .byte $00   ; 
- D 0 - I - 0x00DC04 03:9BF4: 00        .byte $00   ; 
- D 0 - I - 0x00DC05 03:9BF5: 00        .byte $00   ; 
- D 0 - I - 0x00DC06 03:9BF6: 00        .byte $00   ; 
- D 0 - I - 0x00DC07 03:9BF7: 00        .byte $00   ; 
- D 0 - I - 0x00DC08 03:9BF8: 00        .byte $00   ; 
- D 0 - I - 0x00DC09 03:9BF9: 1F        .byte $1F   ; 



_off018_03_9BFA_04:
- D 0 - I - 0x00DC0A 03:9BFA: 16        .byte $16   ; 
- D 0 - I - 0x00DC0B 03:9BFB: 00        .byte $00   ; 
- D 0 - I - 0x00DC0C 03:9BFC: 3C        .byte $3C   ; 
- D 0 - I - 0x00DC0D 03:9BFD: 8C        .byte $8C   ; 
- D 0 - I - 0x00DC0E 03:9BFE: 01        .byte $01   ; 
- D 0 - I - 0x00DC0F 03:9BFF: 15        .byte $15   ; 
- D 0 - I - 0x00DC10 03:9C00: 32        .byte $32   ; 
- D 0 - I - 0x00DC11 03:9C01: 19        .byte $19   ; 
- D 0 - I - 0x00DC12 03:9C02: 50        .byte $50   ; 
- D 0 - I - 0x00DC13 03:9C03: 4F        .byte $4F   ; 
- D 0 - I - 0x00DC14 03:9C04: 01        .byte $01   ; 
- D 0 - I - 0x00DC15 03:9C05: 8D        .byte $8D   ; 
- D 0 - I - 0x00DC16 03:9C06: 8E        .byte $8E   ; 
- D 0 - I - 0x00DC17 03:9C07: 68        .byte $68   ; 
- D 0 - I - 0x00DC18 03:9C08: 15        .byte $15   ; 
- D 0 - I - 0x00DC19 03:9C09: 23        .byte $23   ; 
- D 0 - I - 0x00DC1A 03:9C0A: 49        .byte $49   ; 
- D 0 - I - 0x00DC1B 03:9C0B: 6C        .byte $6C   ; 
- D 0 - I - 0x00DC1C 03:9C0C: 68        .byte $68   ; 
- D 0 - I - 0x00DC1D 03:9C0D: 8F        .byte $8F   ; 
- D 0 - I - 0x00DC1E 03:9C0E: 11        .byte $11   ; 
- D 0 - I - 0x00DC1F 03:9C0F: 64        .byte $64   ; 
- D 0 - I - 0x00DC20 03:9C10: 2B        .byte $2B   ; 
- D 0 - I - 0x00DC21 03:9C11: 5D        .byte $5D   ; 
- D 0 - I - 0x00DC22 03:9C12: 44        .byte $44   ; 
- D 0 - I - 0x00DC23 03:9C13: 26        .byte $26   ; 
- D 0 - I - 0x00DC24 03:9C14: 15        .byte $15   ; 
- D 0 - I - 0x00DC25 03:9C15: 0E        .byte $0E   ; 
- D 0 - I - 0x00DC26 03:9C16: 0F        .byte $0F   ; 
- D 0 - I - 0x00DC27 03:9C17: 3C        .byte $3C   ; 
- D 0 - I - 0x00DC28 03:9C18: 3C        .byte $3C   ; 
- D 0 - I - 0x00DC29 03:9C19: 5B        .byte $5B   ; 
- D 0 - I - 0x00DC2A 03:9C1A: 20        .byte $20   ; 
- D 0 - I - 0x00DC2B 03:9C1B: 14        .byte $14   ; 
- D 0 - I - 0x00DC2C 03:9C1C: 33        .byte $33   ; 
- D 0 - I - 0x00DC2D 03:9C1D: 2B        .byte $2B   ; 
- D 0 - I - 0x00DC2E 03:9C1E: 67        .byte $67   ; 
- D 0 - I - 0x00DC2F 03:9C1F: 68        .byte $68   ; 
- D 0 - I - 0x00DC30 03:9C20: 68        .byte $68   ; 
- D 0 - I - 0x00DC31 03:9C21: 1D        .byte $1D   ; 
- D 0 - I - 0x00DC32 03:9C22: 50        .byte $50   ; 
- D 0 - I - 0x00DC33 03:9C23: 3C        .byte $3C   ; 
- D 0 - I - 0x00DC34 03:9C24: 72        .byte $72   ; 
- D 0 - I - 0x00DC35 03:9C25: 73        .byte $73   ; 
- D 0 - I - 0x00DC36 03:9C26: 71        .byte $71   ; 
- D 0 - I - 0x00DC37 03:9C27: 2C        .byte $2C   ; 
- D 0 - I - 0x00DC38 03:9C28: 2D        .byte $2D   ; 
- D 0 - I - 0x00DC39 03:9C29: 4E        .byte $4E   ; 
- D 0 - I - 0x00DC3A 03:9C2A: 3A        .byte $3A   ; 
- D 0 - I - 0x00DC3B 03:9C2B: 2F        .byte $2F   ; 
- D 0 - I - 0x00DC3C 03:9C2C: 2F        .byte $2F   ; 
- D 0 - I - 0x00DC3D 03:9C2D: 73        .byte $73   ; 
- D 0 - I - 0x00DC3E 03:9C2E: 70        .byte $70   ; 
- D 0 - I - 0x00DC3F 03:9C2F: 14        .byte $14   ; 
- D 0 - I - 0x00DC40 03:9C30: 14        .byte $14   ; 
- D 0 - I - 0x00DC41 03:9C31: 21        .byte $21   ; 
- D 0 - I - 0x00DC42 03:9C32: 34        .byte $34   ; 
- D 0 - I - 0x00DC43 03:9C33: 15        .byte $15   ; 
- D 0 - I - 0x00DC44 03:9C34: 15        .byte $15   ; 
- D 0 - I - 0x00DC45 03:9C35: 00        .byte $00   ; 
- D 0 - I - 0x00DC46 03:9C36: 00        .byte $00   ; 
- D 0 - I - 0x00DC47 03:9C37: 00        .byte $00   ; 
- D 0 - I - 0x00DC48 03:9C38: 00        .byte $00   ; 
- D 0 - I - 0x00DC49 03:9C39: 1D        .byte $1D   ; 



_off018_03_9C3A_05:
- D 0 - I - 0x00DC4A 03:9C3A: 30        .byte $30   ; 
- D 0 - I - 0x00DC4B 03:9C3B: 41        .byte $41   ; 
- D 0 - I - 0x00DC4C 03:9C3C: 10        .byte $10   ; 
- D 0 - I - 0x00DC4D 03:9C3D: 10        .byte $10   ; 
- D 0 - I - 0x00DC4E 03:9C3E: 10        .byte $10   ; 
- D 0 - I - 0x00DC4F 03:9C3F: 10        .byte $10   ; 
- D 0 - I - 0x00DC50 03:9C40: 42        .byte $42   ; 
- D 0 - I - 0x00DC51 03:9C41: 31        .byte $31   ; 
- D 0 - I - 0x00DC52 03:9C42: 83        .byte $83   ; 
- D 0 - I - 0x00DC53 03:9C43: 40        .byte $40   ; 
- D 0 - I - 0x00DC54 03:9C44: 00        .byte $00   ; 
- D 0 - I - 0x00DC55 03:9C45: 00        .byte $00   ; 
- D 0 - I - 0x00DC56 03:9C46: 00        .byte $00   ; 
- D 0 - I - 0x00DC57 03:9C47: 00        .byte $00   ; 
- D 0 - I - 0x00DC58 03:9C48: 32        .byte $32   ; 
- D 0 - I - 0x00DC59 03:9C49: 19        .byte $19   ; 
- D 0 - I - 0x00DC5A 03:9C4A: 5A        .byte $5A   ; 
- D 0 - I - 0x00DC5B 03:9C4B: 3C        .byte $3C   ; 
- D 0 - I - 0x00DC5C 03:9C4C: 3C        .byte $3C   ; 
- D 0 - I - 0x00DC5D 03:9C4D: 71        .byte $71   ; 
- D 0 - I - 0x00DC5E 03:9C4E: 01        .byte $01   ; 
- D 0 - I - 0x00DC5F 03:9C4F: 38        .byte $38   ; 
- D 0 - I - 0x00DC60 03:9C50: 00        .byte $00   ; 
- D 0 - I - 0x00DC61 03:9C51: 1A        .byte $1A   ; 
- D 0 - I - 0x00DC62 03:9C52: 49        .byte $49   ; 
- D 0 - I - 0x00DC63 03:9C53: 6C        .byte $6C   ; 
- D 0 - I - 0x00DC64 03:9C54: 68        .byte $68   ; 
- D 0 - I - 0x00DC65 03:9C55: 6E        .byte $6E   ; 
- D 0 - I - 0x00DC66 03:9C56: 69        .byte $69   ; 
- D 0 - I - 0x00DC67 03:9C57: 4F        .byte $4F   ; 
- D 0 - I - 0x00DC68 03:9C58: 63        .byte $63   ; 
- D 0 - I - 0x00DC69 03:9C59: 1B        .byte $1B   ; 
- D 0 - I - 0x00DC6A 03:9C5A: 44        .byte $44   ; 
- D 0 - I - 0x00DC6B 03:9C5B: 26        .byte $26   ; 
- D 0 - I - 0x00DC6C 03:9C5C: 68        .byte $68   ; 
- D 0 - I - 0x00DC6D 03:9C5D: 15        .byte $15   ; 
- D 0 - I - 0x00DC6E 03:9C5E: 6A        .byte $6A   ; 
- D 0 - I - 0x00DC6F 03:9C5F: 69        .byte $69   ; 
- D 0 - I - 0x00DC70 03:9C60: 65        .byte $65   ; 
- D 0 - I - 0x00DC71 03:9C61: 19        .byte $19   ; 
- D 0 - I - 0x00DC72 03:9C62: 45        .byte $45   ; 
- D 0 - I - 0x00DC73 03:9C63: 26        .byte $26   ; 
- D 0 - I - 0x00DC74 03:9C64: 15        .byte $15   ; 
- D 0 - I - 0x00DC75 03:9C65: 15        .byte $15   ; 
- D 0 - I - 0x00DC76 03:9C66: 6B        .byte $6B   ; 
- D 0 - I - 0x00DC77 03:9C67: 67        .byte $67   ; 
- D 0 - I - 0x00DC78 03:9C68: 6A        .byte $6A   ; 
- D 0 - I - 0x00DC79 03:9C69: 1B        .byte $1B   ; 
- D 0 - I - 0x00DC7A 03:9C6A: 20        .byte $20   ; 
- D 0 - I - 0x00DC7B 03:9C6B: 14        .byte $14   ; 
- D 0 - I - 0x00DC7C 03:9C6C: 14        .byte $14   ; 
- D 0 - I - 0x00DC7D 03:9C6D: 14        .byte $14   ; 
- D 0 - I - 0x00DC7E 03:9C6E: 67        .byte $67   ; 
- D 0 - I - 0x00DC7F 03:9C6F: 14        .byte $14   ; 
- D 0 - I - 0x00DC80 03:9C70: 14        .byte $14   ; 
- D 0 - I - 0x00DC81 03:9C71: 21        .byte $21   ; 
- D 0 - I - 0x00DC82 03:9C72: 1C        .byte $1C   ; 
- D 0 - I - 0x00DC83 03:9C73: 00        .byte $00   ; 
- D 0 - I - 0x00DC84 03:9C74: 00        .byte $00   ; 
- D 0 - I - 0x00DC85 03:9C75: 00        .byte $00   ; 
- D 0 - I - 0x00DC86 03:9C76: 00        .byte $00   ; 
- D 0 - I - 0x00DC87 03:9C77: 00        .byte $00   ; 
- D 0 - I - 0x00DC88 03:9C78: 00        .byte $00   ; 
- D 0 - I - 0x00DC89 03:9C79: 1D        .byte $1D   ; 



_off018_03_9C7A_06:
- D 0 - I - 0x00DC8A 03:9C7A: 3A        .byte $3A   ; 
- D 0 - I - 0x00DC8B 03:9C7B: 2F        .byte $2F   ; 
- D 0 - I - 0x00DC8C 03:9C7C: 65        .byte $65   ; 
- D 0 - I - 0x00DC8D 03:9C7D: 00        .byte $00   ; 
- D 0 - I - 0x00DC8E 03:9C7E: 72        .byte $72   ; 
- D 0 - I - 0x00DC8F 03:9C7F: 71        .byte $71   ; 
- D 0 - I - 0x00DC90 03:9C80: 6F        .byte $6F   ; 
- D 0 - I - 0x00DC91 03:9C81: 19        .byte $19   ; 
- D 0 - I - 0x00DC92 03:9C82: 4D        .byte $4D   ; 
- D 0 - I - 0x00DC93 03:9C83: 2E        .byte $2E   ; 
- D 0 - I - 0x00DC94 03:9C84: 66        .byte $66   ; 
- D 0 - I - 0x00DC95 03:9C85: 63        .byte $63   ; 
- D 0 - I - 0x00DC96 03:9C86: 68        .byte $68   ; 
- D 0 - I - 0x00DC97 03:9C87: 6E        .byte $6E   ; 
- D 0 - I - 0x00DC98 03:9C88: 6E        .byte $6E   ; 
- D 0 - I - 0x00DC99 03:9C89: 1B        .byte $1B   ; 
- D 0 - I - 0x00DC9A 03:9C8A: 44        .byte $44   ; 
- D 0 - I - 0x00DC9B 03:9C8B: 26        .byte $26   ; 
- D 0 - I - 0x00DC9C 03:9C8C: 69        .byte $69   ; 
- D 0 - I - 0x00DC9D 03:9C8D: 65        .byte $65   ; 
- D 0 - I - 0x00DC9E 03:9C8E: 63        .byte $63   ; 
- D 0 - I - 0x00DC9F 03:9C8F: 64        .byte $64   ; 
- D 0 - I - 0x00DCA0 03:9C90: 14        .byte $14   ; 
- D 0 - I - 0x00DCA1 03:9C91: 21        .byte $21   ; 
- D 0 - I - 0x00DCA2 03:9C92: 45        .byte $45   ; 
- D 0 - I - 0x00DCA3 03:9C93: 26        .byte $26   ; 
- D 0 - I - 0x00DCA4 03:9C94: 6A        .byte $6A   ; 
- D 0 - I - 0x00DCA5 03:9C95: 6A        .byte $6A   ; 
- D 0 - I - 0x00DCA6 03:9C96: 66        .byte $66   ; 
- D 0 - I - 0x00DCA7 03:9C97: 67        .byte $67   ; 
- D 0 - I - 0x00DCA8 03:9C98: 6D        .byte $6D   ; 
- D 0 - I - 0x00DCA9 03:9C99: 4A        .byte $4A   ; 
- D 0 - I - 0x00DCAA 03:9C9A: 43        .byte $43   ; 
- D 0 - I - 0x00DCAB 03:9C9B: 26        .byte $26   ; 
- D 0 - I - 0x00DCAC 03:9C9C: 66        .byte $66   ; 
- D 0 - I - 0x00DCAD 03:9C9D: 67        .byte $67   ; 
- D 0 - I - 0x00DCAE 03:9C9E: 68        .byte $68   ; 
- D 0 - I - 0x00DCAF 03:9C9F: 68        .byte $68   ; 
- D 0 - I - 0x00DCB0 03:9CA0: 24        .byte $24   ; 
- D 0 - I - 0x00DCB1 03:9CA1: 46        .byte $46   ; 
- D 0 - I - 0x00DCB2 03:9CA2: 75        .byte $75   ; 
- D 0 - I - 0x00DCB3 03:9CA3: 76        .byte $76   ; 
- D 0 - I - 0x00DCB4 03:9CA4: 76        .byte $76   ; 
- D 0 - I - 0x00DCB5 03:9CA5: 76        .byte $76   ; 
- D 0 - I - 0x00DCB6 03:9CA6: 76        .byte $76   ; 
- D 0 - I - 0x00DCB7 03:9CA7: 76        .byte $76   ; 
- D 0 - I - 0x00DCB8 03:9CA8: 76        .byte $76   ; 
- D 0 - I - 0x00DCB9 03:9CA9: 77        .byte $77   ; 
- D 0 - I - 0x00DCBA 03:9CAA: 20        .byte $20   ; 
- D 0 - I - 0x00DCBB 03:9CAB: 14        .byte $14   ; 
- D 0 - I - 0x00DCBC 03:9CAC: 14        .byte $14   ; 
- D 0 - I - 0x00DCBD 03:9CAD: 3C        .byte $3C   ; 
- D 0 - I - 0x00DCBE 03:9CAE: 3C        .byte $3C   ; 
- D 0 - I - 0x00DCBF 03:9CAF: 3C        .byte $3C   ; 
- D 0 - I - 0x00DCC0 03:9CB0: 14        .byte $14   ; 
- D 0 - I - 0x00DCC1 03:9CB1: 21        .byte $21   ; 
- D 0 - I - 0x00DCC2 03:9CB2: 1E        .byte $1E   ; 
- D 0 - I - 0x00DCC3 03:9CB3: 00        .byte $00   ; 
- D 0 - I - 0x00DCC4 03:9CB4: 00        .byte $00   ; 
- D 0 - I - 0x00DCC5 03:9CB5: 00        .byte $00   ; 
- D 0 - I - 0x00DCC6 03:9CB6: 00        .byte $00   ; 
- D 0 - I - 0x00DCC7 03:9CB7: 00        .byte $00   ; 
- D 0 - I - 0x00DCC8 03:9CB8: 00        .byte $00   ; 
- D 0 - I - 0x00DCC9 03:9CB9: 1F        .byte $1F   ; 



_off018_03_9CBA_07:
- D 0 - I - 0x00DCCA 03:9CBA: 83        .byte $83   ; 
- D 0 - I - 0x00DCCB 03:9CBB: 73        .byte $73   ; 
- D 0 - I - 0x00DCCC 03:9CBC: 70        .byte $70   ; 
- D 0 - I - 0x00DCCD 03:9CBD: 65        .byte $65   ; 
- D 0 - I - 0x00DCCE 03:9CBE: 67        .byte $67   ; 
- D 0 - I - 0x00DCCF 03:9CBF: 6E        .byte $6E   ; 
- D 0 - I - 0x00DCD0 03:9CC0: 68        .byte $68   ; 
- D 0 - I - 0x00DCD1 03:9CC1: 5F        .byte $5F   ; 
- D 0 - I - 0x00DCD2 03:9CC2: 5E        .byte $5E   ; 
- D 0 - I - 0x00DCD3 03:9CC3: 68        .byte $68   ; 
- D 0 - I - 0x00DCD4 03:9CC4: 68        .byte $68   ; 
- D 0 - I - 0x00DCD5 03:9CC5: 66        .byte $66   ; 
- D 0 - I - 0x00DCD6 03:9CC6: 2B        .byte $2B   ; 
- D 0 - I - 0x00DCD7 03:9CC7: 72        .byte $72   ; 
- D 0 - I - 0x00DCD8 03:9CC8: 71        .byte $71   ; 
- D 0 - I - 0x00DCD9 03:9CC9: 1B        .byte $1B   ; 
- D 0 - I - 0x00DCDA 03:9CCA: 18        .byte $18   ; 
- D 0 - I - 0x00DCDB 03:9CCB: 71        .byte $71   ; 
- D 0 - I - 0x00DCDC 03:9CCC: 01        .byte $01   ; 
- D 0 - I - 0x00DCDD 03:9CCD: 00        .byte $00   ; 
- D 0 - I - 0x00DCDE 03:9CCE: 00        .byte $00   ; 
- D 0 - I - 0x00DCDF 03:9CCF: 01        .byte $01   ; 
- D 0 - I - 0x00DCE0 03:9CD0: 74        .byte $74   ; 
- D 0 - I - 0x00DCE1 03:9CD1: 1A        .byte $1A   ; 
- D 0 - I - 0x00DCE2 03:9CD2: 83        .byte $83   ; 
- D 0 - I - 0x00DCE3 03:9CD3: 6E        .byte $6E   ; 
- D 0 - I - 0x00DCE4 03:9CD4: 68        .byte $68   ; 
- D 0 - I - 0x00DCE5 03:9CD5: 68        .byte $68   ; 
- D 0 - I - 0x00DCE6 03:9CD6: 69        .byte $69   ; 
- D 0 - I - 0x00DCE7 03:9CD7: 63        .byte $63   ; 
- D 0 - I - 0x00DCE8 03:9CD8: 6E        .byte $6E   ; 
- D 0 - I - 0x00DCE9 03:9CD9: 84        .byte $84   ; 
- D 0 - I - 0x00DCEA 03:9CDA: 5E        .byte $5E   ; 
- D 0 - I - 0x00DCEB 03:9CDB: 72        .byte $72   ; 
- D 0 - I - 0x00DCEC 03:9CDC: 73        .byte $73   ; 
- D 0 - I - 0x00DCED 03:9CDD: 71        .byte $71   ; 
- D 0 - I - 0x00DCEE 03:9CDE: 67        .byte $67   ; 
- D 0 - I - 0x00DCEF 03:9CDF: 66        .byte $66   ; 
- D 0 - I - 0x00DCF0 03:9CE0: 74        .byte $74   ; 
- D 0 - I - 0x00DCF1 03:9CE1: 5F        .byte $5F   ; 
- D 0 - I - 0x00DCF2 03:9CE2: 17        .byte $17   ; 
- D 0 - I - 0x00DCF3 03:9CE3: 73        .byte $73   ; 
- D 0 - I - 0x00DCF4 03:9CE4: 73        .byte $73   ; 
- D 0 - I - 0x00DCF5 03:9CE5: 70        .byte $70   ; 
- D 0 - I - 0x00DCF6 03:9CE6: 00        .byte $00   ; 
- D 0 - I - 0x00DCF7 03:9CE7: 00        .byte $00   ; 
- D 0 - I - 0x00DCF8 03:9CE8: 72        .byte $72   ; 
- D 0 - I - 0x00DCF9 03:9CE9: 1A        .byte $1A   ; 
- D 0 - I - 0x00DCFA 03:9CEA: 18        .byte $18   ; 
- D 0 - I - 0x00DCFB 03:9CEB: 68        .byte $68   ; 
- D 0 - I - 0x00DCFC 03:9CEC: 68        .byte $68   ; 
- D 0 - I - 0x00DCFD 03:9CED: 69        .byte $69   ; 
- D 0 - I - 0x00DCFE 03:9CEE: 6F        .byte $6F   ; 
- D 0 - I - 0x00DCFF 03:9CEF: 73        .byte $73   ; 
- D 0 - I - 0x00DD00 03:9CF0: 73        .byte $73   ; 
- D 0 - I - 0x00DD01 03:9CF1: 1B        .byte $1B   ; 
- D 0 - I - 0x00DD02 03:9CF2: 1E        .byte $1E   ; 
- D 0 - I - 0x00DD03 03:9CF3: 68        .byte $68   ; 
- D 0 - I - 0x00DD04 03:9CF4: 69        .byte $69   ; 
- D 0 - I - 0x00DD05 03:9CF5: 67        .byte $67   ; 
- D 0 - I - 0x00DD06 03:9CF6: 6E        .byte $6E   ; 
- D 0 - I - 0x00DD07 03:9CF7: 68        .byte $68   ; 
- D 0 - I - 0x00DD08 03:9CF8: 68        .byte $68   ; 
- D 0 - I - 0x00DD09 03:9CF9: 1F        .byte $1F   ; 



_off018_03_9CFA_08:
- D 0 - I - 0x00DD0A 03:9CFA: 5E        .byte $5E   ; 
- D 0 - I - 0x00DD0B 03:9CFB: 68        .byte $68   ; 
- D 0 - I - 0x00DD0C 03:9CFC: 68        .byte $68   ; 
- D 0 - I - 0x00DD0D 03:9CFD: 69        .byte $69   ; 
- D 0 - I - 0x00DD0E 03:9CFE: 15        .byte $15   ; 
- D 0 - I - 0x00DD0F 03:9CFF: 15        .byte $15   ; 
- D 0 - I - 0x00DD10 03:9D00: 15        .byte $15   ; 
- D 0 - I - 0x00DD11 03:9D01: 61        .byte $61   ; 
- D 0 - I - 0x00DD12 03:9D02: 22        .byte $22   ; 
- D 0 - I - 0x00DD13 03:9D03: 15        .byte $15   ; 
- D 0 - I - 0x00DD14 03:9D04: 15        .byte $15   ; 
- D 0 - I - 0x00DD15 03:9D05: 6B        .byte $6B   ; 
- D 0 - I - 0x00DD16 03:9D06: 6B        .byte $6B   ; 
- D 0 - I - 0x00DD17 03:9D07: 15        .byte $15   ; 
- D 0 - I - 0x00DD18 03:9D08: 68        .byte $68   ; 
- D 0 - I - 0x00DD19 03:9D09: 5F        .byte $5F   ; 
- D 0 - I - 0x00DD1A 03:9D0A: 17        .byte $17   ; 
- D 0 - I - 0x00DD1B 03:9D0B: 73        .byte $73   ; 
- D 0 - I - 0x00DD1C 03:9D0C: 71        .byte $71   ; 
- D 0 - I - 0x00DD1D 03:9D0D: 65        .byte $65   ; 
- D 0 - I - 0x00DD1E 03:9D0E: 67        .byte $67   ; 
- D 0 - I - 0x00DD1F 03:9D0F: 69        .byte $69   ; 
- D 0 - I - 0x00DD20 03:9D10: 14        .byte $14   ; 
- D 0 - I - 0x00DD21 03:9D11: 21        .byte $21   ; 
- D 0 - I - 0x00DD22 03:9D12: 18        .byte $18   ; 
- D 0 - I - 0x00DD23 03:9D13: 68        .byte $68   ; 
- D 0 - I - 0x00DD24 03:9D14: 6E        .byte $6E   ; 
- D 0 - I - 0x00DD25 03:9D15: 14        .byte $14   ; 
- D 0 - I - 0x00DD26 03:9D16: 00        .byte $00   ; 
- D 0 - I - 0x00DD27 03:9D17: 67        .byte $67   ; 
- D 0 - I - 0x00DD28 03:9D18: 68        .byte $68   ; 
- D 0 - I - 0x00DD29 03:9D19: 1D        .byte $1D   ; 
- D 0 - I - 0x00DD2A 03:9D1A: 17        .byte $17   ; 
- D 0 - I - 0x00DD2B 03:9D1B: 00        .byte $00   ; 
- D 0 - I - 0x00DD2C 03:9D1C: 74        .byte $74   ; 
- D 0 - I - 0x00DD2D 03:9D1D: 00        .byte $00   ; 
- D 0 - I - 0x00DD2E 03:9D1E: 00        .byte $00   ; 
- D 0 - I - 0x00DD2F 03:9D1F: 15        .byte $15   ; 
- D 0 - I - 0x00DD30 03:9D20: 00        .byte $00   ; 
- D 0 - I - 0x00DD31 03:9D21: 19        .byte $19   ; 
- D 0 - I - 0x00DD32 03:9D22: 20        .byte $20   ; 
- D 0 - I - 0x00DD33 03:9D23: 14        .byte $14   ; 
- D 0 - I - 0x00DD34 03:9D24: 72        .byte $72   ; 
- D 0 - I - 0x00DD35 03:9D25: 73        .byte $73   ; 
- D 0 - I - 0x00DD36 03:9D26: 73        .byte $73   ; 
- D 0 - I - 0x00DD37 03:9D27: 71        .byte $71   ; 
- D 0 - I - 0x00DD38 03:9D28: 2B        .byte $2B   ; 
- D 0 - I - 0x00DD39 03:9D29: 1B        .byte $1B   ; 
- D 0 - I - 0x00DD3A 03:9D2A: 16        .byte $16   ; 
- D 0 - I - 0x00DD3B 03:9D2B: 00        .byte $00   ; 
- D 0 - I - 0x00DD3C 03:9D2C: 71        .byte $71   ; 
- D 0 - I - 0x00DD3D 03:9D2D: 63        .byte $63   ; 
- D 0 - I - 0x00DD3E 03:9D2E: 68        .byte $68   ; 
- D 0 - I - 0x00DD3F 03:9D2F: 6E        .byte $6E   ; 
- D 0 - I - 0x00DD40 03:9D30: 68        .byte $68   ; 
- D 0 - I - 0x00DD41 03:9D31: 1A        .byte $1A   ; 
- D 0 - I - 0x00DD42 03:9D32: 1E        .byte $1E   ; 
- D 0 - I - 0x00DD43 03:9D33: 68        .byte $68   ; 
- D 0 - I - 0x00DD44 03:9D34: 6E        .byte $6E   ; 
- D 0 - I - 0x00DD45 03:9D35: 6A        .byte $6A   ; 
- D 0 - I - 0x00DD46 03:9D36: 69        .byte $69   ; 
- D 0 - I - 0x00DD47 03:9D37: 74        .byte $74   ; 
- D 0 - I - 0x00DD48 03:9D38: 00        .byte $00   ; 
- D 0 - I - 0x00DD49 03:9D39: 1F        .byte $1F   ; 



_off018_03_9D3A_09:
- D 0 - I - 0x00DD4A 03:9D3A: 16        .byte $16   ; 
- D 0 - I - 0x00DD4B 03:9D3B: 68        .byte $68   ; 
- D 0 - I - 0x00DD4C 03:9D3C: 68        .byte $68   ; 
- D 0 - I - 0x00DD4D 03:9D3D: 68        .byte $68   ; 
- D 0 - I - 0x00DD4E 03:9D3E: 68        .byte $68   ; 
- D 0 - I - 0x00DD4F 03:9D3F: 68        .byte $68   ; 
- D 0 - I - 0x00DD50 03:9D40: 68        .byte $68   ; 
- D 0 - I - 0x00DD51 03:9D41: 19        .byte $19   ; 
- D 0 - I - 0x00DD52 03:9D42: 56        .byte $56   ; 
- D 0 - I - 0x00DD53 03:9D43: 59        .byte $59   ; 
- D 0 - I - 0x00DD54 03:9D44: 59        .byte $59   ; 
- D 0 - I - 0x00DD55 03:9D45: 59        .byte $59   ; 
- D 0 - I - 0x00DD56 03:9D46: 59        .byte $59   ; 
- D 0 - I - 0x00DD57 03:9D47: 59        .byte $59   ; 
- D 0 - I - 0x00DD58 03:9D48: 59        .byte $59   ; 
- D 0 - I - 0x00DD59 03:9D49: 57        .byte $57   ; 
- D 0 - I - 0x00DD5A 03:9D4A: 17        .byte $17   ; 
- D 0 - I - 0x00DD5B 03:9D4B: 73        .byte $73   ; 
- D 0 - I - 0x00DD5C 03:9D4C: 71        .byte $71   ; 
- D 0 - I - 0x00DD5D 03:9D4D: 63        .byte $63   ; 
- D 0 - I - 0x00DD5E 03:9D4E: 69        .byte $69   ; 
- D 0 - I - 0x00DD5F 03:9D4F: 63        .byte $63   ; 
- D 0 - I - 0x00DD60 03:9D50: 68        .byte $68   ; 
- D 0 - I - 0x00DD61 03:9D51: 1A        .byte $1A   ; 
- D 0 - I - 0x00DD62 03:9D52: 18        .byte $18   ; 
- D 0 - I - 0x00DD63 03:9D53: 68        .byte $68   ; 
- D 0 - I - 0x00DD64 03:9D54: 6E        .byte $6E   ; 
- D 0 - I - 0x00DD65 03:9D55: 66        .byte $66   ; 
- D 0 - I - 0x00DD66 03:9D56: 67        .byte $67   ; 
- D 0 - I - 0x00DD67 03:9D57: 6A        .byte $6A   ; 
- D 0 - I - 0x00DD68 03:9D58: 68        .byte $68   ; 
- D 0 - I - 0x00DD69 03:9D59: 1B        .byte $1B   ; 
- D 0 - I - 0x00DD6A 03:9D5A: 16        .byte $16   ; 
- D 0 - I - 0x00DD6B 03:9D5B: 73        .byte $73   ; 
- D 0 - I - 0x00DD6C 03:9D5C: 70        .byte $70   ; 
- D 0 - I - 0x00DD6D 03:9D5D: 2B        .byte $2B   ; 
- D 0 - I - 0x00DD6E 03:9D5E: 2B        .byte $2B   ; 
- D 0 - I - 0x00DD6F 03:9D5F: 67        .byte $67   ; 
- D 0 - I - 0x00DD70 03:9D60: 68        .byte $68   ; 
- D 0 - I - 0x00DD71 03:9D61: 19        .byte $19   ; 
- D 0 - I - 0x00DD72 03:9D62: 75        .byte $75   ; 
- D 0 - I - 0x00DD73 03:9D63: 76        .byte $76   ; 
- D 0 - I - 0x00DD74 03:9D64: 76        .byte $76   ; 
- D 0 - I - 0x00DD75 03:9D65: 76        .byte $76   ; 
- D 0 - I - 0x00DD76 03:9D66: 76        .byte $76   ; 
- D 0 - I - 0x00DD77 03:9D67: 76        .byte $76   ; 
- D 0 - I - 0x00DD78 03:9D68: 76        .byte $76   ; 
- D 0 - I - 0x00DD79 03:9D69: 77        .byte $77   ; 
- D 0 - I - 0x00DD7A 03:9D6A: 18        .byte $18   ; 
- D 0 - I - 0x00DD7B 03:9D6B: 2B        .byte $2B   ; 
- D 0 - I - 0x00DD7C 03:9D6C: 3C        .byte $3C   ; 
- D 0 - I - 0x00DD7D 03:9D6D: 00        .byte $00   ; 
- D 0 - I - 0x00DD7E 03:9D6E: 00        .byte $00   ; 
- D 0 - I - 0x00DD7F 03:9D6F: 00        .byte $00   ; 
- D 0 - I - 0x00DD80 03:9D70: 00        .byte $00   ; 
- D 0 - I - 0x00DD81 03:9D71: 1B        .byte $1B   ; 
- D 0 - I - 0x00DD82 03:9D72: 85        .byte $85   ; 
- D 0 - I - 0x00DD83 03:9D73: 00        .byte $00   ; 
- D 0 - I - 0x00DD84 03:9D74: 00        .byte $00   ; 
- D 0 - I - 0x00DD85 03:9D75: 00        .byte $00   ; 
- D 0 - I - 0x00DD86 03:9D76: 00        .byte $00   ; 
- D 0 - I - 0x00DD87 03:9D77: 00        .byte $00   ; 
- D 0 - I - 0x00DD88 03:9D78: 00        .byte $00   ; 
- D 0 - I - 0x00DD89 03:9D79: 1F        .byte $1F   ; 



_off018_03_9D7A_0A:
- D 0 - I - 0x00DD8A 03:9D7A: 16        .byte $16   ; 
- D 0 - I - 0x00DD8B 03:9D7B: 00        .byte $00   ; 
- D 0 - I - 0x00DD8C 03:9D7C: 00        .byte $00   ; 
- D 0 - I - 0x00DD8D 03:9D7D: 00        .byte $00   ; 
- D 0 - I - 0x00DD8E 03:9D7E: 00        .byte $00   ; 
- D 0 - I - 0x00DD8F 03:9D7F: 00        .byte $00   ; 
- D 0 - I - 0x00DD90 03:9D80: 00        .byte $00   ; 
- D 0 - I - 0x00DD91 03:9D81: 19        .byte $19   ; 
- D 0 - I - 0x00DD92 03:9D82: 54        .byte $54   ; 
- D 0 - I - 0x00DD93 03:9D83: 58        .byte $58   ; 
- D 0 - I - 0x00DD94 03:9D84: 58        .byte $58   ; 
- D 0 - I - 0x00DD95 03:9D85: 58        .byte $58   ; 
- D 0 - I - 0x00DD96 03:9D86: 58        .byte $58   ; 
- D 0 - I - 0x00DD97 03:9D87: 58        .byte $58   ; 
- D 0 - I - 0x00DD98 03:9D88: 58        .byte $58   ; 
- D 0 - I - 0x00DD99 03:9D89: 55        .byte $55   ; 
- D 0 - I - 0x00DD9A 03:9D8A: 17        .byte $17   ; 
- D 0 - I - 0x00DD9B 03:9D8B: 68        .byte $68   ; 
- D 0 - I - 0x00DD9C 03:9D8C: 69        .byte $69   ; 
- D 0 - I - 0x00DD9D 03:9D8D: 00        .byte $00   ; 
- D 0 - I - 0x00DD9E 03:9D8E: 00        .byte $00   ; 
- D 0 - I - 0x00DD9F 03:9D8F: 00        .byte $00   ; 
- D 0 - I - 0x00DDA0 03:9D90: 00        .byte $00   ; 
- D 0 - I - 0x00DDA1 03:9D91: 1A        .byte $1A   ; 
- D 0 - I - 0x00DDA2 03:9D92: 18        .byte $18   ; 
- D 0 - I - 0x00DDA3 03:9D93: 01        .byte $01   ; 
- D 0 - I - 0x00DDA4 03:9D94: 65        .byte $65   ; 
- D 0 - I - 0x00DDA5 03:9D95: 00        .byte $00   ; 
- D 0 - I - 0x00DDA6 03:9D96: 00        .byte $00   ; 
- D 0 - I - 0x00DDA7 03:9D97: 00        .byte $00   ; 
- D 0 - I - 0x00DDA8 03:9D98: 01        .byte $01   ; 
- D 0 - I - 0x00DDA9 03:9D99: 1B        .byte $1B   ; 
- D 0 - I - 0x00DDAA 03:9D9A: 16        .byte $16   ; 
- D 0 - I - 0x00DDAB 03:9D9B: 00        .byte $00   ; 
- D 0 - I - 0x00DDAC 03:9D9C: 67        .byte $67   ; 
- D 0 - I - 0x00DDAD 03:9D9D: 68        .byte $68   ; 
- D 0 - I - 0x00DDAE 03:9D9E: 68        .byte $68   ; 
- D 0 - I - 0x00DDAF 03:9D9F: 68        .byte $68   ; 
- D 0 - I - 0x00DDB0 03:9DA0: 68        .byte $68   ; 
- D 0 - I - 0x00DDB1 03:9DA1: 19        .byte $19   ; 
- D 0 - I - 0x00DDB2 03:9DA2: 54        .byte $54   ; 
- D 0 - I - 0x00DDB3 03:9DA3: 58        .byte $58   ; 
- D 0 - I - 0x00DDB4 03:9DA4: 58        .byte $58   ; 
- D 0 - I - 0x00DDB5 03:9DA5: 58        .byte $58   ; 
- D 0 - I - 0x00DDB6 03:9DA6: 58        .byte $58   ; 
- D 0 - I - 0x00DDB7 03:9DA7: 58        .byte $58   ; 
- D 0 - I - 0x00DDB8 03:9DA8: 58        .byte $58   ; 
- D 0 - I - 0x00DDB9 03:9DA9: 55        .byte $55   ; 
- D 0 - I - 0x00DDBA 03:9DAA: 17        .byte $17   ; 
- D 0 - I - 0x00DDBB 03:9DAB: 68        .byte $68   ; 
- D 0 - I - 0x00DDBC 03:9DAC: 68        .byte $68   ; 
- D 0 - I - 0x00DDBD 03:9DAD: 68        .byte $68   ; 
- D 0 - I - 0x00DDBE 03:9DAE: 68        .byte $68   ; 
- D 0 - I - 0x00DDBF 03:9DAF: 68        .byte $68   ; 
- D 0 - I - 0x00DDC0 03:9DB0: 68        .byte $68   ; 
- D 0 - I - 0x00DDC1 03:9DB1: 1A        .byte $1A   ; 
- D 0 - I - 0x00DDC2 03:9DB2: 54        .byte $54   ; 
- D 0 - I - 0x00DDC3 03:9DB3: 58        .byte $58   ; 
- D 0 - I - 0x00DDC4 03:9DB4: 58        .byte $58   ; 
- D 0 - I - 0x00DDC5 03:9DB5: 58        .byte $58   ; 
- D 0 - I - 0x00DDC6 03:9DB6: 58        .byte $58   ; 
- D 0 - I - 0x00DDC7 03:9DB7: 58        .byte $58   ; 
- D 0 - I - 0x00DDC8 03:9DB8: 58        .byte $58   ; 
- D 0 - I - 0x00DDC9 03:9DB9: 55        .byte $55   ; 



_off018_03_9DBA_0B:
- D 0 - I - 0x00DDCA 03:9DBA: 16        .byte $16   ; 
- D 0 - I - 0x00DDCB 03:9DBB: 73        .byte $73   ; 
- D 0 - I - 0x00DDCC 03:9DBC: 71        .byte $71   ; 
- D 0 - I - 0x00DDCD 03:9DBD: 2B        .byte $2B   ; 
- D 0 - I - 0x00DDCE 03:9DBE: 00        .byte $00   ; 
- D 0 - I - 0x00DDCF 03:9DBF: 63        .byte $63   ; 
- D 0 - I - 0x00DDD0 03:9DC0: 68        .byte $68   ; 
- D 0 - I - 0x00DDD1 03:9DC1: 19        .byte $19   ; 
- D 0 - I - 0x00DDD2 03:9DC2: 18        .byte $18   ; 
- D 0 - I - 0x00DDD3 03:9DC3: 68        .byte $68   ; 
- D 0 - I - 0x00DDD4 03:9DC4: 6E        .byte $6E   ; 
- D 0 - I - 0x00DDD5 03:9DC5: 68        .byte $68   ; 
- D 0 - I - 0x00DDD6 03:9DC6: 69        .byte $69   ; 
- D 0 - I - 0x00DDD7 03:9DC7: 65        .byte $65   ; 
- D 0 - I - 0x00DDD8 03:9DC8: 63        .byte $63   ; 
- D 0 - I - 0x00DDD9 03:9DC9: 1B        .byte $1B   ; 
- D 0 - I - 0x00DDDA 03:9DCA: 17        .byte $17   ; 
- D 0 - I - 0x00DDDB 03:9DCB: 71        .byte $71   ; 
- D 0 - I - 0x00DDDC 03:9DCC: 70        .byte $70   ; 
- D 0 - I - 0x00DDDD 03:9DCD: 63        .byte $63   ; 
- D 0 - I - 0x00DDDE 03:9DCE: 6A        .byte $6A   ; 
- D 0 - I - 0x00DDDF 03:9DCF: 6A        .byte $6A   ; 
- D 0 - I - 0x00DDE0 03:9DD0: 66        .byte $66   ; 
- D 0 - I - 0x00DDE1 03:9DD1: 1A        .byte $1A   ; 
- D 0 - I - 0x00DDE2 03:9DD2: 18        .byte $18   ; 
- D 0 - I - 0x00DDE3 03:9DD3: 6E        .byte $6E   ; 
- D 0 - I - 0x00DDE4 03:9DD4: 68        .byte $68   ; 
- D 0 - I - 0x00DDE5 03:9DD5: 6A        .byte $6A   ; 
- D 0 - I - 0x00DDE6 03:9DD6: 6A        .byte $6A   ; 
- D 0 - I - 0x00DDE7 03:9DD7: 66        .byte $66   ; 
- D 0 - I - 0x00DDE8 03:9DD8: 2B        .byte $2B   ; 
- D 0 - I - 0x00DDE9 03:9DD9: 1B        .byte $1B   ; 
- D 0 - I - 0x00DDEA 03:9DDA: 16        .byte $16   ; 
- D 0 - I - 0x00DDEB 03:9DDB: 70        .byte $70   ; 
- D 0 - I - 0x00DDEC 03:9DDC: 00        .byte $00   ; 
- D 0 - I - 0x00DDED 03:9DDD: 65        .byte $65   ; 
- D 0 - I - 0x00DDEE 03:9DDE: 67        .byte $67   ; 
- D 0 - I - 0x00DDEF 03:9DDF: 69        .byte $69   ; 
- D 0 - I - 0x00DDF0 03:9DE0: 00        .byte $00   ; 
- D 0 - I - 0x00DDF1 03:9DE1: 19        .byte $19   ; 
- D 0 - I - 0x00DDF2 03:9DE2: 18        .byte $18   ; 
- D 0 - I - 0x00DDF3 03:9DE3: 68        .byte $68   ; 
- D 0 - I - 0x00DDF4 03:9DE4: 68        .byte $68   ; 
- D 0 - I - 0x00DDF5 03:9DE5: 66        .byte $66   ; 
- D 0 - I - 0x00DDF6 03:9DE6: 00        .byte $00   ; 
- D 0 - I - 0x00DDF7 03:9DE7: 67        .byte $67   ; 
- D 0 - I - 0x00DDF8 03:9DE8: 68        .byte $68   ; 
- D 0 - I - 0x00DDF9 03:9DE9: 1B        .byte $1B   ; 
- D 0 - I - 0x00DDFA 03:9DEA: 54        .byte $54   ; 
- D 0 - I - 0x00DDFB 03:9DEB: 58        .byte $58   ; 
- D 0 - I - 0x00DDFC 03:9DEC: 58        .byte $58   ; 
- D 0 - I - 0x00DDFD 03:9DED: 58        .byte $58   ; 
- D 0 - I - 0x00DDFE 03:9DEE: 58        .byte $58   ; 
- D 0 - I - 0x00DDFF 03:9DEF: 58        .byte $58   ; 
- D 0 - I - 0x00DE00 03:9DF0: 58        .byte $58   ; 
- D 0 - I - 0x00DE01 03:9DF1: 55        .byte $55   ; 
- D 0 - I - 0x00DE02 03:9DF2: 54        .byte $54   ; 
- D 0 - I - 0x00DE03 03:9DF3: 58        .byte $58   ; 
- D 0 - I - 0x00DE04 03:9DF4: 58        .byte $58   ; 
- D 0 - I - 0x00DE05 03:9DF5: 58        .byte $58   ; 
- D 0 - I - 0x00DE06 03:9DF6: 58        .byte $58   ; 
- D 0 - I - 0x00DE07 03:9DF7: 58        .byte $58   ; 
- D 0 - I - 0x00DE08 03:9DF8: 58        .byte $58   ; 
- D 0 - I - 0x00DE09 03:9DF9: 55        .byte $55   ; 



_off018_03_9DFA_0C:
- D 0 - I - 0x00DE0A 03:9DFA: 3A        .byte $3A   ; 
- D 0 - I - 0x00DE0B 03:9DFB: 2F        .byte $2F   ; 
- D 0 - I - 0x00DE0C 03:9DFC: 2F        .byte $2F   ; 
- D 0 - I - 0x00DE0D 03:9DFD: 2F        .byte $2F   ; 
- D 0 - I - 0x00DE0E 03:9DFE: 2F        .byte $2F   ; 
- D 0 - I - 0x00DE0F 03:9DFF: 2F        .byte $2F   ; 
- D 0 - I - 0x00DE10 03:9E00: 00        .byte $00   ; 
- D 0 - I - 0x00DE11 03:9E01: 19        .byte $19   ; 
- D 0 - I - 0x00DE12 03:9E02: 60        .byte $60   ; 
- D 0 - I - 0x00DE13 03:9E03: 15        .byte $15   ; 
- D 0 - I - 0x00DE14 03:9E04: 15        .byte $15   ; 
- D 0 - I - 0x00DE15 03:9E05: 15        .byte $15   ; 
- D 0 - I - 0x00DE16 03:9E06: 15        .byte $15   ; 
- D 0 - I - 0x00DE17 03:9E07: 15        .byte $15   ; 
- D 0 - I - 0x00DE18 03:9E08: 00        .byte $00   ; 
- D 0 - I - 0x00DE19 03:9E09: 1B        .byte $1B   ; 
- D 0 - I - 0x00DE1A 03:9E0A: 5A        .byte $5A   ; 
- D 0 - I - 0x00DE1B 03:9E0B: 3C        .byte $3C   ; 
- D 0 - I - 0x00DE1C 03:9E0C: 3C        .byte $3C   ; 
- D 0 - I - 0x00DE1D 03:9E0D: 00        .byte $00   ; 
- D 0 - I - 0x00DE1E 03:9E0E: 15        .byte $15   ; 
- D 0 - I - 0x00DE1F 03:9E0F: 15        .byte $15   ; 
- D 0 - I - 0x00DE20 03:9E10: 15        .byte $15   ; 
- D 0 - I - 0x00DE21 03:9E11: 23        .byte $23   ; 
- D 0 - I - 0x00DE22 03:9E12: 3A        .byte $3A   ; 
- D 0 - I - 0x00DE23 03:9E13: 2F        .byte $2F   ; 
- D 0 - I - 0x00DE24 03:9E14: 2F        .byte $2F   ; 
- D 0 - I - 0x00DE25 03:9E15: 2F        .byte $2F   ; 
- D 0 - I - 0x00DE26 03:9E16: 00        .byte $00   ; 
- D 0 - I - 0x00DE27 03:9E17: 15        .byte $15   ; 
- D 0 - I - 0x00DE28 03:9E18: 2F        .byte $2F   ; 
- D 0 - I - 0x00DE29 03:9E19: 3B        .byte $3B   ; 
- D 0 - I - 0x00DE2A 03:9E1A: 22        .byte $22   ; 
- D 0 - I - 0x00DE2B 03:9E1B: 15        .byte $15   ; 
- D 0 - I - 0x00DE2C 03:9E1C: 15        .byte $15   ; 
- D 0 - I - 0x00DE2D 03:9E1D: 15        .byte $15   ; 
- D 0 - I - 0x00DE2E 03:9E1E: 00        .byte $00   ; 
- D 0 - I - 0x00DE2F 03:9E1F: 00        .byte $00   ; 
- D 0 - I - 0x00DE30 03:9E20: 15        .byte $15   ; 
- D 0 - I - 0x00DE31 03:9E21: 61        .byte $61   ; 
- D 0 - I - 0x00DE32 03:9E22: 20        .byte $20   ; 
- D 0 - I - 0x00DE33 03:9E23: 14        .byte $14   ; 
- D 0 - I - 0x00DE34 03:9E24: 14        .byte $14   ; 
- D 0 - I - 0x00DE35 03:9E25: 14        .byte $14   ; 
- D 0 - I - 0x00DE36 03:9E26: 14        .byte $14   ; 
- D 0 - I - 0x00DE37 03:9E27: 3C        .byte $3C   ; 
- D 0 - I - 0x00DE38 03:9E28: 3C        .byte $3C   ; 
- D 0 - I - 0x00DE39 03:9E29: 5B        .byte $5B   ; 
- D 0 - I - 0x00DE3A 03:9E2A: 1C        .byte $1C   ; 
- D 0 - I - 0x00DE3B 03:9E2B: 00        .byte $00   ; 
- D 0 - I - 0x00DE3C 03:9E2C: 00        .byte $00   ; 
- D 0 - I - 0x00DE3D 03:9E2D: 00        .byte $00   ; 
- D 0 - I - 0x00DE3E 03:9E2E: 00        .byte $00   ; 
- D 0 - I - 0x00DE3F 03:9E2F: 00        .byte $00   ; 
- D 0 - I - 0x00DE40 03:9E30: 00        .byte $00   ; 
- D 0 - I - 0x00DE41 03:9E31: 1D        .byte $1D   ; 
- D 0 - I - 0x00DE42 03:9E32: 1E        .byte $1E   ; 
- D 0 - I - 0x00DE43 03:9E33: 00        .byte $00   ; 
- D 0 - I - 0x00DE44 03:9E34: 00        .byte $00   ; 
- D 0 - I - 0x00DE45 03:9E35: 00        .byte $00   ; 
- D 0 - I - 0x00DE46 03:9E36: 00        .byte $00   ; 
- D 0 - I - 0x00DE47 03:9E37: 00        .byte $00   ; 
- D 0 - I - 0x00DE48 03:9E38: 00        .byte $00   ; 
- D 0 - I - 0x00DE49 03:9E39: 1F        .byte $1F   ; 



_off018_03_9E3A_0D:
- D 0 - I - 0x00DE4A 03:9E3A: 00        .byte $00   ; 
- D 0 - I - 0x00DE4B 03:9E3B: 00        .byte $00   ; 
- D 0 - I - 0x00DE4C 03:9E3C: 00        .byte $00   ; 
- D 0 - I - 0x00DE4D 03:9E3D: 00        .byte $00   ; 
- D 0 - I - 0x00DE4E 03:9E3E: 00        .byte $00   ; 
- D 0 - I - 0x00DE4F 03:9E3F: 00        .byte $00   ; 
- D 0 - I - 0x00DE50 03:9E40: 00        .byte $00   ; 
- D 0 - I - 0x00DE51 03:9E41: 00        .byte $00   ; 
- D 0 - I - 0x00DE52 03:9E42: 00        .byte $00   ; 
- D 0 - I - 0x00DE53 03:9E43: 00        .byte $00   ; 
- D 0 - I - 0x00DE54 03:9E44: 00        .byte $00   ; 
- D 0 - I - 0x00DE55 03:9E45: 00        .byte $00   ; 
- D 0 - I - 0x00DE56 03:9E46: 00        .byte $00   ; 
- D 0 - I - 0x00DE57 03:9E47: 00        .byte $00   ; 
- D 0 - I - 0x00DE58 03:9E48: 00        .byte $00   ; 
- D 0 - I - 0x00DE59 03:9E49: 00        .byte $00   ; 
- D 0 - I - 0x00DE5A 03:9E4A: 00        .byte $00   ; 
- D 0 - I - 0x00DE5B 03:9E4B: 00        .byte $00   ; 
- D 0 - I - 0x00DE5C 03:9E4C: 00        .byte $00   ; 
- D 0 - I - 0x00DE5D 03:9E4D: 00        .byte $00   ; 
- D 0 - I - 0x00DE5E 03:9E4E: 00        .byte $00   ; 
- D 0 - I - 0x00DE5F 03:9E4F: 00        .byte $00   ; 
- D 0 - I - 0x00DE60 03:9E50: 00        .byte $00   ; 
- D 0 - I - 0x00DE61 03:9E51: 00        .byte $00   ; 
- D 0 - I - 0x00DE62 03:9E52: 00        .byte $00   ; 
- D 0 - I - 0x00DE63 03:9E53: 00        .byte $00   ; 
- D 0 - I - 0x00DE64 03:9E54: 00        .byte $00   ; 
- D 0 - I - 0x00DE65 03:9E55: 00        .byte $00   ; 
- D 0 - I - 0x00DE66 03:9E56: 00        .byte $00   ; 
- D 0 - I - 0x00DE67 03:9E57: 00        .byte $00   ; 
- D 0 - I - 0x00DE68 03:9E58: 00        .byte $00   ; 
- D 0 - I - 0x00DE69 03:9E59: 00        .byte $00   ; 
- D 0 - I - 0x00DE6A 03:9E5A: 00        .byte $00   ; 
- D 0 - I - 0x00DE6B 03:9E5B: 00        .byte $00   ; 
- D 0 - I - 0x00DE6C 03:9E5C: 00        .byte $00   ; 
- D 0 - I - 0x00DE6D 03:9E5D: 00        .byte $00   ; 
- D 0 - I - 0x00DE6E 03:9E5E: 00        .byte $00   ; 
- D 0 - I - 0x00DE6F 03:9E5F: 00        .byte $00   ; 
- D 0 - I - 0x00DE70 03:9E60: 00        .byte $00   ; 
- D 0 - I - 0x00DE71 03:9E61: 00        .byte $00   ; 
- D 0 - I - 0x00DE72 03:9E62: 17        .byte $17   ; 
- D 0 - I - 0x00DE73 03:9E63: 00        .byte $00   ; 
- D 0 - I - 0x00DE74 03:9E64: 00        .byte $00   ; 
- D 0 - I - 0x00DE75 03:9E65: 00        .byte $00   ; 
- D 0 - I - 0x00DE76 03:9E66: 00        .byte $00   ; 
- D 0 - I - 0x00DE77 03:9E67: 00        .byte $00   ; 
- D 0 - I - 0x00DE78 03:9E68: 00        .byte $00   ; 
- D 0 - I - 0x00DE79 03:9E69: 1A        .byte $1A   ; 
- D 0 - I - 0x00DE7A 03:9E6A: 18        .byte $18   ; 
- D 0 - I - 0x00DE7B 03:9E6B: 00        .byte $00   ; 
- D 0 - I - 0x00DE7C 03:9E6C: 00        .byte $00   ; 
- D 0 - I - 0x00DE7D 03:9E6D: 00        .byte $00   ; 
- D 0 - I - 0x00DE7E 03:9E6E: 00        .byte $00   ; 
- D 0 - I - 0x00DE7F 03:9E6F: 00        .byte $00   ; 
- D 0 - I - 0x00DE80 03:9E70: 00        .byte $00   ; 
- D 0 - I - 0x00DE81 03:9E71: 1B        .byte $1B   ; 
- D 0 - I - 0x00DE82 03:9E72: 1E        .byte $1E   ; 
- D 0 - I - 0x00DE83 03:9E73: 00        .byte $00   ; 
- D 0 - I - 0x00DE84 03:9E74: 00        .byte $00   ; 
- D 0 - I - 0x00DE85 03:9E75: 00        .byte $00   ; 
- D 0 - I - 0x00DE86 03:9E76: 00        .byte $00   ; 
- D 0 - I - 0x00DE87 03:9E77: 00        .byte $00   ; 
- D 0 - I - 0x00DE88 03:9E78: 00        .byte $00   ; 
- D 0 - I - 0x00DE89 03:9E79: 1F        .byte $1F   ; 



_off018_03_9E7A_0E:
- - - - - - 0x00DE8A 03:9E7A: 00        .byte $00   ; 
- - - - - - 0x00DE8B 03:9E7B: 00        .byte $00   ; 
- - - - - - 0x00DE8C 03:9E7C: 00        .byte $00   ; 
- - - - - - 0x00DE8D 03:9E7D: 00        .byte $00   ; 
- - - - - - 0x00DE8E 03:9E7E: 00        .byte $00   ; 
- - - - - - 0x00DE8F 03:9E7F: 00        .byte $00   ; 
- - - - - - 0x00DE90 03:9E80: 00        .byte $00   ; 
- - - - - - 0x00DE91 03:9E81: 00        .byte $00   ; 
- - - - - - 0x00DE92 03:9E82: 00        .byte $00   ; 
- - - - - - 0x00DE93 03:9E83: 00        .byte $00   ; 
- - - - - - 0x00DE94 03:9E84: 00        .byte $00   ; 
- - - - - - 0x00DE95 03:9E85: 00        .byte $00   ; 
- - - - - - 0x00DE96 03:9E86: 00        .byte $00   ; 
- - - - - - 0x00DE97 03:9E87: 00        .byte $00   ; 
- - - - - - 0x00DE98 03:9E88: 00        .byte $00   ; 
- - - - - - 0x00DE99 03:9E89: 00        .byte $00   ; 
- - - - - - 0x00DE9A 03:9E8A: 00        .byte $00   ; 
- - - - - - 0x00DE9B 03:9E8B: 00        .byte $00   ; 
- - - - - - 0x00DE9C 03:9E8C: 00        .byte $00   ; 
- - - - - - 0x00DE9D 03:9E8D: 00        .byte $00   ; 
- - - - - - 0x00DE9E 03:9E8E: 00        .byte $00   ; 
- - - - - - 0x00DE9F 03:9E8F: 00        .byte $00   ; 
- - - - - - 0x00DEA0 03:9E90: 00        .byte $00   ; 
- - - - - - 0x00DEA1 03:9E91: 00        .byte $00   ; 
- - - - - - 0x00DEA2 03:9E92: 00        .byte $00   ; 
- - - - - - 0x00DEA3 03:9E93: 00        .byte $00   ; 
- - - - - - 0x00DEA4 03:9E94: 00        .byte $00   ; 
- - - - - - 0x00DEA5 03:9E95: 00        .byte $00   ; 
- - - - - - 0x00DEA6 03:9E96: 00        .byte $00   ; 
- - - - - - 0x00DEA7 03:9E97: 00        .byte $00   ; 
- - - - - - 0x00DEA8 03:9E98: 00        .byte $00   ; 
- - - - - - 0x00DEA9 03:9E99: 00        .byte $00   ; 
- - - - - - 0x00DEAA 03:9E9A: 00        .byte $00   ; 
- - - - - - 0x00DEAB 03:9E9B: 00        .byte $00   ; 
- - - - - - 0x00DEAC 03:9E9C: 00        .byte $00   ; 
- - - - - - 0x00DEAD 03:9E9D: 00        .byte $00   ; 
- - - - - - 0x00DEAE 03:9E9E: 00        .byte $00   ; 
- - - - - - 0x00DEAF 03:9E9F: 00        .byte $00   ; 
- - - - - - 0x00DEB0 03:9EA0: 00        .byte $00   ; 
- - - - - - 0x00DEB1 03:9EA1: 00        .byte $00   ; 
- - - - - - 0x00DEB2 03:9EA2: 00        .byte $00   ; 
- - - - - - 0x00DEB3 03:9EA3: 00        .byte $00   ; 
- - - - - - 0x00DEB4 03:9EA4: 00        .byte $00   ; 
- - - - - - 0x00DEB5 03:9EA5: 00        .byte $00   ; 
- - - - - - 0x00DEB6 03:9EA6: 00        .byte $00   ; 
- - - - - - 0x00DEB7 03:9EA7: 00        .byte $00   ; 
- - - - - - 0x00DEB8 03:9EA8: 00        .byte $00   ; 
- - - - - - 0x00DEB9 03:9EA9: 00        .byte $00   ; 
- D 0 - I - 0x00DEBA 03:9EAA: 90        .byte $90   ; 
- D 0 - I - 0x00DEBB 03:9EAB: 91        .byte $91   ; 
- D 0 - I - 0x00DEBC 03:9EAC: 92        .byte $92   ; 
- D 0 - I - 0x00DEBD 03:9EAD: 90        .byte $90   ; 
- D 0 - I - 0x00DEBE 03:9EAE: 91        .byte $91   ; 
- D 0 - I - 0x00DEBF 03:9EAF: 92        .byte $92   ; 
- D 0 - I - 0x00DEC0 03:9EB0: 90        .byte $90   ; 
- D 0 - I - 0x00DEC1 03:9EB1: 91        .byte $91   ; 
- D 0 - I - 0x00DEC2 03:9EB2: A0        .byte $A0   ; 
- D 0 - I - 0x00DEC3 03:9EB3: A0        .byte $A0   ; 
- D 0 - I - 0x00DEC4 03:9EB4: A0        .byte $A0   ; 
- D 0 - I - 0x00DEC5 03:9EB5: A0        .byte $A0   ; 
- D 0 - I - 0x00DEC6 03:9EB6: A0        .byte $A0   ; 
- D 0 - I - 0x00DEC7 03:9EB7: A0        .byte $A0   ; 
- D 0 - I - 0x00DEC8 03:9EB8: A0        .byte $A0   ; 
- D 0 - I - 0x00DEC9 03:9EB9: A0        .byte $A0   ; 



_off018_03_9EBA_0F:
- D 0 - I - 0x00DECA 03:9EBA: 00        .byte $00   ; 
- D 0 - I - 0x00DECB 03:9EBB: 00        .byte $00   ; 
- D 0 - I - 0x00DECC 03:9EBC: 00        .byte $00   ; 
- D 0 - I - 0x00DECD 03:9EBD: 00        .byte $00   ; 
- D 0 - I - 0x00DECE 03:9EBE: 94        .byte $94   ; 
- D 0 - I - 0x00DECF 03:9EBF: AD        .byte $AD   ; 
- D 0 - I - 0x00DED0 03:9EC0: AD        .byte $AD   ; 
- D 0 - I - 0x00DED1 03:9EC1: AD        .byte $AD   ; 
- D 0 - I - 0x00DED2 03:9EC2: 00        .byte $00   ; 
- D 0 - I - 0x00DED3 03:9EC3: 00        .byte $00   ; 
- D 0 - I - 0x00DED4 03:9EC4: 00        .byte $00   ; 
- D 0 - I - 0x00DED5 03:9EC5: 00        .byte $00   ; 
- D 0 - I - 0x00DED6 03:9EC6: 95        .byte $95   ; 
- D 0 - I - 0x00DED7 03:9EC7: AE        .byte $AE   ; 
- D 0 - I - 0x00DED8 03:9EC8: AE        .byte $AE   ; 
- D 0 - I - 0x00DED9 03:9EC9: AE        .byte $AE   ; 
- D 0 - I - 0x00DEDA 03:9ECA: 00        .byte $00   ; 
- D 0 - I - 0x00DEDB 03:9ECB: 00        .byte $00   ; 
- D 0 - I - 0x00DEDC 03:9ECC: 00        .byte $00   ; 
- D 0 - I - 0x00DEDD 03:9ECD: 00        .byte $00   ; 
- D 0 - I - 0x00DEDE 03:9ECE: 96        .byte $96   ; 
- D 0 - I - 0x00DEDF 03:9ECF: AC        .byte $AC   ; 
- D 0 - I - 0x00DEE0 03:9ED0: AC        .byte $AC   ; 
- D 0 - I - 0x00DEE1 03:9ED1: AC        .byte $AC   ; 
- D 0 - I - 0x00DEE2 03:9ED2: 00        .byte $00   ; 
- D 0 - I - 0x00DEE3 03:9ED3: 00        .byte $00   ; 
- D 0 - I - 0x00DEE4 03:9ED4: 00        .byte $00   ; 
- D 0 - I - 0x00DEE5 03:9ED5: 00        .byte $00   ; 
- D 0 - I - 0x00DEE6 03:9ED6: 97        .byte $97   ; 
- D 0 - I - 0x00DEE7 03:9ED7: AF        .byte $AF   ; 
- D 0 - I - 0x00DEE8 03:9ED8: AF        .byte $AF   ; 
- D 0 - I - 0x00DEE9 03:9ED9: AF        .byte $AF   ; 
- D 0 - I - 0x00DEEA 03:9EDA: 00        .byte $00   ; 
- D 0 - I - 0x00DEEB 03:9EDB: 00        .byte $00   ; 
- D 0 - I - 0x00DEEC 03:9EDC: 00        .byte $00   ; 
- D 0 - I - 0x00DEED 03:9EDD: 00        .byte $00   ; 
- D 0 - I - 0x00DEEE 03:9EDE: 9F        .byte $9F   ; 
- D 0 - I - 0x00DEEF 03:9EDF: AF        .byte $AF   ; 
- D 0 - I - 0x00DEF0 03:9EE0: AF        .byte $AF   ; 
- D 0 - I - 0x00DEF1 03:9EE1: AF        .byte $AF   ; 
- D 0 - I - 0x00DEF2 03:9EE2: 98        .byte $98   ; 
- D 0 - I - 0x00DEF3 03:9EE3: 99        .byte $99   ; 
- D 0 - I - 0x00DEF4 03:9EE4: 99        .byte $99   ; 
- D 0 - I - 0x00DEF5 03:9EE5: 9A        .byte $9A   ; 
- D 0 - I - 0x00DEF6 03:9EE6: 9B        .byte $9B   ; 
- D 0 - I - 0x00DEF7 03:9EE7: AC        .byte $AC   ; 
- D 0 - I - 0x00DEF8 03:9EE8: AC        .byte $AC   ; 
- D 0 - I - 0x00DEF9 03:9EE9: AC        .byte $AC   ; 
- D 0 - I - 0x00DEFA 03:9EEA: 9C        .byte $9C   ; 
- D 0 - I - 0x00DEFB 03:9EEB: 7B        .byte $7B   ; 
- D 0 - I - 0x00DEFC 03:9EEC: 9E        .byte $9E   ; 
- D 0 - I - 0x00DEFD 03:9EED: 79        .byte $79   ; 
- D 0 - I - 0x00DEFE 03:9EEE: 7A        .byte $7A   ; 
- D 0 - I - 0x00DEFF 03:9EEF: 9C        .byte $9C   ; 
- D 0 - I - 0x00DF00 03:9EF0: 9D        .byte $9D   ; 
- D 0 - I - 0x00DF01 03:9EF1: 9C        .byte $9C   ; 
- - - - - - 0x00DF02 03:9EF2: 00        .byte $00   ; 
- - - - - - 0x00DF03 03:9EF3: 00        .byte $00   ; 
- - - - - - 0x00DF04 03:9EF4: 00        .byte $00   ; 
- - - - - - 0x00DF05 03:9EF5: 00        .byte $00   ; 
- - - - - - 0x00DF06 03:9EF6: 00        .byte $00   ; 
- - - - - - 0x00DF07 03:9EF7: 00        .byte $00   ; 
- - - - - - 0x00DF08 03:9EF8: 00        .byte $00   ; 
- - - - - - 0x00DF09 03:9EF9: 00        .byte $00   ; 



_off018_03_9EFA_10:
- - - - - - 0x00DF0A 03:9EFA: 00        .byte $00   ; 
- - - - - - 0x00DF0B 03:9EFB: 00        .byte $00   ; 
- - - - - - 0x00DF0C 03:9EFC: 00        .byte $00   ; 
- - - - - - 0x00DF0D 03:9EFD: 00        .byte $00   ; 
- - - - - - 0x00DF0E 03:9EFE: 00        .byte $00   ; 
- - - - - - 0x00DF0F 03:9EFF: 00        .byte $00   ; 
- - - - - - 0x00DF10 03:9F00: 00        .byte $00   ; 
- - - - - - 0x00DF11 03:9F01: 00        .byte $00   ; 
- - - - - - 0x00DF12 03:9F02: 00        .byte $00   ; 
- - - - - - 0x00DF13 03:9F03: 00        .byte $00   ; 
- - - - - - 0x00DF14 03:9F04: 00        .byte $00   ; 
- - - - - - 0x00DF15 03:9F05: 00        .byte $00   ; 
- - - - - - 0x00DF16 03:9F06: 00        .byte $00   ; 
- - - - - - 0x00DF17 03:9F07: 00        .byte $00   ; 
- - - - - - 0x00DF18 03:9F08: 00        .byte $00   ; 
- - - - - - 0x00DF19 03:9F09: 00        .byte $00   ; 
- - - - - - 0x00DF1A 03:9F0A: 00        .byte $00   ; 
- - - - - - 0x00DF1B 03:9F0B: 00        .byte $00   ; 
- - - - - - 0x00DF1C 03:9F0C: 00        .byte $00   ; 
- - - - - - 0x00DF1D 03:9F0D: 00        .byte $00   ; 
- - - - - - 0x00DF1E 03:9F0E: 00        .byte $00   ; 
- - - - - - 0x00DF1F 03:9F0F: 00        .byte $00   ; 
- - - - - - 0x00DF20 03:9F10: 00        .byte $00   ; 
- - - - - - 0x00DF21 03:9F11: 00        .byte $00   ; 
- - - - - - 0x00DF22 03:9F12: 00        .byte $00   ; 
- - - - - - 0x00DF23 03:9F13: 00        .byte $00   ; 
- - - - - - 0x00DF24 03:9F14: 00        .byte $00   ; 
- - - - - - 0x00DF25 03:9F15: 00        .byte $00   ; 
- - - - - - 0x00DF26 03:9F16: 00        .byte $00   ; 
- - - - - - 0x00DF27 03:9F17: 00        .byte $00   ; 
- - - - - - 0x00DF28 03:9F18: 00        .byte $00   ; 
- - - - - - 0x00DF29 03:9F19: 00        .byte $00   ; 
- - - - - - 0x00DF2A 03:9F1A: 00        .byte $00   ; 
- - - - - - 0x00DF2B 03:9F1B: 00        .byte $00   ; 
- - - - - - 0x00DF2C 03:9F1C: 00        .byte $00   ; 
- - - - - - 0x00DF2D 03:9F1D: 00        .byte $00   ; 
- - - - - - 0x00DF2E 03:9F1E: 00        .byte $00   ; 
- - - - - - 0x00DF2F 03:9F1F: 00        .byte $00   ; 
- - - - - - 0x00DF30 03:9F20: 00        .byte $00   ; 
- - - - - - 0x00DF31 03:9F21: 00        .byte $00   ; 
- - - - - - 0x00DF32 03:9F22: 00        .byte $00   ; 
- - - - - - 0x00DF33 03:9F23: 00        .byte $00   ; 
- - - - - - 0x00DF34 03:9F24: 00        .byte $00   ; 
- - - - - - 0x00DF35 03:9F25: 00        .byte $00   ; 
- - - - - - 0x00DF36 03:9F26: 00        .byte $00   ; 
- - - - - - 0x00DF37 03:9F27: 00        .byte $00   ; 
- - - - - - 0x00DF38 03:9F28: 00        .byte $00   ; 
- - - - - - 0x00DF39 03:9F29: 00        .byte $00   ; 
- D 0 - I - 0x00DF3A 03:9F2A: 92        .byte $92   ; 
- D 0 - I - 0x00DF3B 03:9F2B: 90        .byte $90   ; 
- D 0 - I - 0x00DF3C 03:9F2C: 91        .byte $91   ; 
- D 0 - I - 0x00DF3D 03:9F2D: 92        .byte $92   ; 
- D 0 - I - 0x00DF3E 03:9F2E: 93        .byte $93   ; 
- D 0 - I - 0x00DF3F 03:9F2F: 90        .byte $90   ; 
- D 0 - I - 0x00DF40 03:9F30: 91        .byte $91   ; 
- D 0 - I - 0x00DF41 03:9F31: 92        .byte $92   ; 
- D 0 - I - 0x00DF42 03:9F32: A0        .byte $A0   ; 
- D 0 - I - 0x00DF43 03:9F33: A0        .byte $A0   ; 
- D 0 - I - 0x00DF44 03:9F34: A0        .byte $A0   ; 
- D 0 - I - 0x00DF45 03:9F35: A0        .byte $A0   ; 
- D 0 - I - 0x00DF46 03:9F36: A1        .byte $A1   ; 
- D 0 - I - 0x00DF47 03:9F37: AE        .byte $AE   ; 
- D 0 - I - 0x00DF48 03:9F38: AE        .byte $AE   ; 
- D 0 - I - 0x00DF49 03:9F39: AE        .byte $AE   ; 



_off018_03_9F3A_11:
- D 0 - I - 0x00DF4A 03:9F3A: 00        .byte $00   ; 
- D 0 - I - 0x00DF4B 03:9F3B: A5        .byte $A5   ; 
- D 0 - I - 0x00DF4C 03:9F3C: A6        .byte $A6   ; 
- D 0 - I - 0x00DF4D 03:9F3D: A7        .byte $A7   ; 
- D 0 - I - 0x00DF4E 03:9F3E: A8        .byte $A8   ; 
- D 0 - I - 0x00DF4F 03:9F3F: A9        .byte $A9   ; 
- D 0 - I - 0x00DF50 03:9F40: AA        .byte $AA   ; 
- D 0 - I - 0x00DF51 03:9F41: 00        .byte $00   ; 
- D 0 - I - 0x00DF52 03:9F42: 00        .byte $00   ; 
- D 0 - I - 0x00DF53 03:9F43: AB        .byte $AB   ; 
- D 0 - I - 0x00DF54 03:9F44: A2        .byte $A2   ; 
- D 0 - I - 0x00DF55 03:9F45: A2        .byte $A2   ; 
- D 0 - I - 0x00DF56 03:9F46: A2        .byte $A2   ; 
- D 0 - I - 0x00DF57 03:9F47: A2        .byte $A2   ; 
- D 0 - I - 0x00DF58 03:9F48: 00        .byte $00   ; 
- D 0 - I - 0x00DF59 03:9F49: 00        .byte $00   ; 
- D 0 - I - 0x00DF5A 03:9F4A: 00        .byte $00   ; 
- D 0 - I - 0x00DF5B 03:9F4B: 00        .byte $00   ; 
- D 0 - I - 0x00DF5C 03:9F4C: 00        .byte $00   ; 
- D 0 - I - 0x00DF5D 03:9F4D: 00        .byte $00   ; 
- D 0 - I - 0x00DF5E 03:9F4E: 00        .byte $00   ; 
- D 0 - I - 0x00DF5F 03:9F4F: 00        .byte $00   ; 
- D 0 - I - 0x00DF60 03:9F50: 00        .byte $00   ; 
- D 0 - I - 0x00DF61 03:9F51: 00        .byte $00   ; 
- D 0 - I - 0x00DF62 03:9F52: 00        .byte $00   ; 
- D 0 - I - 0x00DF63 03:9F53: 00        .byte $00   ; 
- D 0 - I - 0x00DF64 03:9F54: 00        .byte $00   ; 
- D 0 - I - 0x00DF65 03:9F55: 00        .byte $00   ; 
- D 0 - I - 0x00DF66 03:9F56: 00        .byte $00   ; 
- D 0 - I - 0x00DF67 03:9F57: 00        .byte $00   ; 
- D 0 - I - 0x00DF68 03:9F58: 00        .byte $00   ; 
- D 0 - I - 0x00DF69 03:9F59: 00        .byte $00   ; 
- D 0 - I - 0x00DF6A 03:9F5A: 00        .byte $00   ; 
- D 0 - I - 0x00DF6B 03:9F5B: 00        .byte $00   ; 
- D 0 - I - 0x00DF6C 03:9F5C: 00        .byte $00   ; 
- D 0 - I - 0x00DF6D 03:9F5D: 00        .byte $00   ; 
- D 0 - I - 0x00DF6E 03:9F5E: 00        .byte $00   ; 
- D 0 - I - 0x00DF6F 03:9F5F: 00        .byte $00   ; 
- D 0 - I - 0x00DF70 03:9F60: 00        .byte $00   ; 
- D 0 - I - 0x00DF71 03:9F61: 00        .byte $00   ; 
- D 0 - I - 0x00DF72 03:9F62: 00        .byte $00   ; 
- D 0 - I - 0x00DF73 03:9F63: 00        .byte $00   ; 
- D 0 - I - 0x00DF74 03:9F64: 00        .byte $00   ; 
- D 0 - I - 0x00DF75 03:9F65: 00        .byte $00   ; 
- D 0 - I - 0x00DF76 03:9F66: 00        .byte $00   ; 
- D 0 - I - 0x00DF77 03:9F67: 00        .byte $00   ; 
- D 0 - I - 0x00DF78 03:9F68: 00        .byte $00   ; 
- D 0 - I - 0x00DF79 03:9F69: 00        .byte $00   ; 
- D 0 - I - 0x00DF7A 03:9F6A: 00        .byte $00   ; 
- D 0 - I - 0x00DF7B 03:9F6B: 00        .byte $00   ; 
- D 0 - I - 0x00DF7C 03:9F6C: 00        .byte $00   ; 
- D 0 - I - 0x00DF7D 03:9F6D: 00        .byte $00   ; 
- D 0 - I - 0x00DF7E 03:9F6E: 00        .byte $00   ; 
- D 0 - I - 0x00DF7F 03:9F6F: 00        .byte $00   ; 
- D 0 - I - 0x00DF80 03:9F70: 00        .byte $00   ; 
- D 0 - I - 0x00DF81 03:9F71: 00        .byte $00   ; 
- - - - - - 0x00DF82 03:9F72: 00        .byte $00   ; 
- - - - - - 0x00DF83 03:9F73: 00        .byte $00   ; 
- - - - - - 0x00DF84 03:9F74: 00        .byte $00   ; 
- - - - - - 0x00DF85 03:9F75: 00        .byte $00   ; 
- - - - - - 0x00DF86 03:9F76: 00        .byte $00   ; 
- - - - - - 0x00DF87 03:9F77: 00        .byte $00   ; 
- - - - - - 0x00DF88 03:9F78: 00        .byte $00   ; 
- - - - - - 0x00DF89 03:9F79: 00        .byte $00   ; 



_off018_03_9F7A_12:
- - - - - - 0x00DF8A 03:9F7A: 00        .byte $00   ; 
- - - - - - 0x00DF8B 03:9F7B: 00        .byte $00   ; 
- - - - - - 0x00DF8C 03:9F7C: 00        .byte $00   ; 
- - - - - - 0x00DF8D 03:9F7D: 00        .byte $00   ; 
- - - - - - 0x00DF8E 03:9F7E: 00        .byte $00   ; 
- - - - - - 0x00DF8F 03:9F7F: 00        .byte $00   ; 
- - - - - - 0x00DF90 03:9F80: 00        .byte $00   ; 
- - - - - - 0x00DF91 03:9F81: 00        .byte $00   ; 
- - - - - - 0x00DF92 03:9F82: 00        .byte $00   ; 
- - - - - - 0x00DF93 03:9F83: 00        .byte $00   ; 
- - - - - - 0x00DF94 03:9F84: 00        .byte $00   ; 
- - - - - - 0x00DF95 03:9F85: 00        .byte $00   ; 
- - - - - - 0x00DF96 03:9F86: 00        .byte $00   ; 
- - - - - - 0x00DF97 03:9F87: 00        .byte $00   ; 
- - - - - - 0x00DF98 03:9F88: 00        .byte $00   ; 
- - - - - - 0x00DF99 03:9F89: 00        .byte $00   ; 
- - - - - - 0x00DF9A 03:9F8A: 00        .byte $00   ; 
- - - - - - 0x00DF9B 03:9F8B: 00        .byte $00   ; 
- - - - - - 0x00DF9C 03:9F8C: 00        .byte $00   ; 
- - - - - - 0x00DF9D 03:9F8D: 00        .byte $00   ; 
- - - - - - 0x00DF9E 03:9F8E: 00        .byte $00   ; 
- - - - - - 0x00DF9F 03:9F8F: 00        .byte $00   ; 
- - - - - - 0x00DFA0 03:9F90: 00        .byte $00   ; 
- - - - - - 0x00DFA1 03:9F91: 00        .byte $00   ; 
- - - - - - 0x00DFA2 03:9F92: 00        .byte $00   ; 
- - - - - - 0x00DFA3 03:9F93: 00        .byte $00   ; 
- - - - - - 0x00DFA4 03:9F94: 00        .byte $00   ; 
- - - - - - 0x00DFA5 03:9F95: 00        .byte $00   ; 
- - - - - - 0x00DFA6 03:9F96: 00        .byte $00   ; 
- - - - - - 0x00DFA7 03:9F97: 00        .byte $00   ; 
- - - - - - 0x00DFA8 03:9F98: 00        .byte $00   ; 
- - - - - - 0x00DFA9 03:9F99: 00        .byte $00   ; 
- - - - - - 0x00DFAA 03:9F9A: 00        .byte $00   ; 
- - - - - - 0x00DFAB 03:9F9B: 00        .byte $00   ; 
- - - - - - 0x00DFAC 03:9F9C: 00        .byte $00   ; 
- - - - - - 0x00DFAD 03:9F9D: 00        .byte $00   ; 
- - - - - - 0x00DFAE 03:9F9E: 00        .byte $00   ; 
- - - - - - 0x00DFAF 03:9F9F: 00        .byte $00   ; 
- - - - - - 0x00DFB0 03:9FA0: 00        .byte $00   ; 
- - - - - - 0x00DFB1 03:9FA1: 00        .byte $00   ; 
- - - - - - 0x00DFB2 03:9FA2: 00        .byte $00   ; 
- - - - - - 0x00DFB3 03:9FA3: 00        .byte $00   ; 
- - - - - - 0x00DFB4 03:9FA4: 00        .byte $00   ; 
- - - - - - 0x00DFB5 03:9FA5: 00        .byte $00   ; 
- - - - - - 0x00DFB6 03:9FA6: 00        .byte $00   ; 
- - - - - - 0x00DFB7 03:9FA7: 00        .byte $00   ; 
- - - - - - 0x00DFB8 03:9FA8: 00        .byte $00   ; 
- - - - - - 0x00DFB9 03:9FA9: 00        .byte $00   ; 
- D 0 - I - 0x00DFBA 03:9FAA: 90        .byte $90   ; 
- D 0 - I - 0x00DFBB 03:9FAB: 91        .byte $91   ; 
- D 0 - I - 0x00DFBC 03:9FAC: 92        .byte $92   ; 
- D 0 - I - 0x00DFBD 03:9FAD: 90        .byte $90   ; 
- D 0 - I - 0x00DFBE 03:9FAE: 91        .byte $91   ; 
- D 0 - I - 0x00DFBF 03:9FAF: 92        .byte $92   ; 
- D 0 - I - 0x00DFC0 03:9FB0: 90        .byte $90   ; 
- D 0 - I - 0x00DFC1 03:9FB1: 91        .byte $91   ; 
- D 0 - I - 0x00DFC2 03:9FB2: A0        .byte $A0   ; 
- D 0 - I - 0x00DFC3 03:9FB3: A0        .byte $A0   ; 
- D 0 - I - 0x00DFC4 03:9FB4: A0        .byte $A0   ; 
- D 0 - I - 0x00DFC5 03:9FB5: A3        .byte $A3   ; 
- D 0 - I - 0x00DFC6 03:9FB6: A4        .byte $A4   ; 
- D 0 - I - 0x00DFC7 03:9FB7: A0        .byte $A0   ; 
- D 0 - I - 0x00DFC8 03:9FB8: A0        .byte $A0   ; 
- D 0 - I - 0x00DFC9 03:9FB9: A0        .byte $A0   ; 



_off006_0x00DFCA_03_area_4:
- D 0 - I - 0x00DFCA 03:9FBA: 00        .byte $00   ; 
- D 0 - I - 0x00DFCB 03:9FBB: 00        .byte $00   ; 
- D 0 - I - 0x00DFCC 03:9FBC: 00        .byte $00   ; 
- D 0 - I - 0x00DFCD 03:9FBD: 00        .byte $00   ; 
- D 0 - I - 0x00DFCE 03:9FBE: 00        .byte $00   ; 
- D 0 - I - 0x00DFCF 03:9FBF: 00        .byte $00   ; 
- D 0 - I - 0x00DFD0 03:9FC0: 00        .byte $00   ; 
- D 0 - I - 0x00DFD1 03:9FC1: 00        .byte $00   ; 
- D 0 - I - 0x00DFD2 03:9FC2: 00        .byte $00   ; 
- D 0 - I - 0x00DFD3 03:9FC3: 00        .byte $00   ; 
- D 0 - I - 0x00DFD4 03:9FC4: 00        .byte $00   ; 
- D 0 - I - 0x00DFD5 03:9FC5: 00        .byte $00   ; 
- D 0 - I - 0x00DFD6 03:9FC6: 00        .byte $00   ; 
- D 0 - I - 0x00DFD7 03:9FC7: 00        .byte $00   ; 
- D 0 - I - 0x00DFD8 03:9FC8: 00        .byte $00   ; 
- D 0 - I - 0x00DFD9 03:9FC9: 00        .byte $00   ; 
- D 0 - I - 0x00DFDA 03:9FCA: 12        .byte $12   ; 
- D 0 - I - 0x00DFDB 03:9FCB: 75        .byte $75   ; 
- D 0 - I - 0x00DFDC 03:9FCC: 13        .byte $13   ; 
- D 0 - I - 0x00DFDD 03:9FCD: 76        .byte $76   ; 
- D 0 - I - 0x00DFDE 03:9FCE: 77        .byte $77   ; 
- D 0 - I - 0x00DFDF 03:9FCF: 78        .byte $78   ; 
- D 0 - I - 0x00DFE0 03:9FD0: 79        .byte $79   ; 
- D 0 - I - 0x00DFE1 03:9FD1: 7A        .byte $7A   ; 
- D 0 - I - 0x00DFE2 03:9FD2: 14        .byte $14   ; 
- D 0 - I - 0x00DFE3 03:9FD3: 7B        .byte $7B   ; 
- D 0 - I - 0x00DFE4 03:9FD4: 15        .byte $15   ; 
- D 0 - I - 0x00DFE5 03:9FD5: 7C        .byte $7C   ; 
- D 0 - I - 0x00DFE6 03:9FD6: 7D        .byte $7D   ; 
- D 0 - I - 0x00DFE7 03:9FD7: 7E        .byte $7E   ; 
- D 0 - I - 0x00DFE8 03:9FD8: 7F        .byte $7F   ; 
- D 0 - I - 0x00DFE9 03:9FD9: 80        .byte $80   ; 
- D 0 - I - 0x00DFEA 03:9FDA: 81        .byte $81   ; 
- D 0 - I - 0x00DFEB 03:9FDB: 82        .byte $82   ; 
- D 0 - I - 0x00DFEC 03:9FDC: 83        .byte $83   ; 
- D 0 - I - 0x00DFED 03:9FDD: 84        .byte $84   ; 
- D 0 - I - 0x00DFEE 03:9FDE: 85        .byte $85   ; 
- D 0 - I - 0x00DFEF 03:9FDF: 86        .byte $86   ; 
- D 0 - I - 0x00DFF0 03:9FE0: 87        .byte $87   ; 
- D 0 - I - 0x00DFF1 03:9FE1: 88        .byte $88   ; 
- D 0 - I - 0x00DFF2 03:9FE2: 89        .byte $89   ; 
- D 0 - I - 0x00DFF3 03:9FE3: 8A        .byte $8A   ; 
- D 0 - I - 0x00DFF4 03:9FE4: 8B        .byte $8B   ; 
- D 0 - I - 0x00DFF5 03:9FE5: 8C        .byte $8C   ; 
- D 0 - I - 0x00DFF6 03:9FE6: 8D        .byte $8D   ; 
- D 0 - I - 0x00DFF7 03:9FE7: 8E        .byte $8E   ; 
- D 0 - I - 0x00DFF8 03:9FE8: 8F        .byte $8F   ; 
- D 0 - I - 0x00DFF9 03:9FE9: 90        .byte $90   ; 
- D 0 - I - 0x00DFFA 03:9FEA: 91        .byte $91   ; 
- D 0 - I - 0x00DFFB 03:9FEB: 92        .byte $92   ; 
- D 0 - I - 0x00DFFC 03:9FEC: 93        .byte $93   ; 
- D 0 - I - 0x00DFFD 03:9FED: 94        .byte $94   ; 
- D 0 - I - 0x00DFFE 03:9FEE: 95        .byte $95   ; 
- D 0 - I - 0x00DFFF 03:9FEF: 96        .byte $96   ; 
- D 0 - I - 0x00E000 03:9FF0: 97        .byte $97   ; 
- D 0 - I - 0x00E001 03:9FF1: 98        .byte $98   ; 
- D 0 - I - 0x00E002 03:9FF2: 99        .byte $99   ; 
- D 0 - I - 0x00E003 03:9FF3: 9A        .byte $9A   ; 
- D 0 - I - 0x00E004 03:9FF4: 9B        .byte $9B   ; 
- D 0 - I - 0x00E005 03:9FF5: 9C        .byte $9C   ; 
- D 0 - I - 0x00E006 03:9FF6: 9D        .byte $9D   ; 
- D 0 - I - 0x00E007 03:9FF7: 9E        .byte $9E   ; 
- D 0 - I - 0x00E008 03:9FF8: 9F        .byte $9F   ; 
- D 0 - I - 0x00E009 03:9FF9: A0        .byte $A0   ; 
- D 0 - I - 0x00E00A 03:9FFA: 12        .byte $12   ; 
- D 0 - I - 0x00E00B 03:9FFB: 75        .byte $75   ; 
- D 0 - I - 0x00E00C 03:9FFC: 13        .byte $13   ; 
- D 0 - I - 0x00E00D 03:9FFD: 76        .byte $76   ; 
- D 0 - I - 0x00E00E 03:9FFE: 77        .byte $77   ; 
- D 0 - I - 0x00E00F 03:9FFF: 78        .byte $78   ; 
- - - - - - 0x00E010 03:A000: 79        .byte $79   ; 
- D 1 - I - 0x00E011 03:A001: 7A        .byte $7A   ; 
- D 1 - I - 0x00E012 03:A002: 14        .byte $14   ; 
- D 1 - I - 0x00E013 03:A003: 7B        .byte $7B   ; 
- D 1 - I - 0x00E014 03:A004: 15        .byte $15   ; 
- D 1 - I - 0x00E015 03:A005: 7C        .byte $7C   ; 
- D 1 - I - 0x00E016 03:A006: 7D        .byte $7D   ; 
- D 1 - I - 0x00E017 03:A007: 7E        .byte $7E   ; 
- D 1 - I - 0x00E018 03:A008: 7F        .byte $7F   ; 
- D 1 - I - 0x00E019 03:A009: 80        .byte $80   ; 
- D 1 - I - 0x00E01A 03:A00A: 81        .byte $81   ; 
- D 1 - I - 0x00E01B 03:A00B: 82        .byte $82   ; 
- D 1 - I - 0x00E01C 03:A00C: 83        .byte $83   ; 
- D 1 - I - 0x00E01D 03:A00D: 84        .byte $84   ; 
- D 1 - I - 0x00E01E 03:A00E: 85        .byte $85   ; 
- D 1 - I - 0x00E01F 03:A00F: 86        .byte $86   ; 
- D 1 - I - 0x00E020 03:A010: 87        .byte $87   ; 
- D 1 - I - 0x00E021 03:A011: 88        .byte $88   ; 
- D 1 - I - 0x00E022 03:A012: 89        .byte $89   ; 
- D 1 - I - 0x00E023 03:A013: 8A        .byte $8A   ; 
- D 1 - I - 0x00E024 03:A014: 8B        .byte $8B   ; 
- D 1 - I - 0x00E025 03:A015: 8C        .byte $8C   ; 
- D 1 - I - 0x00E026 03:A016: 8D        .byte $8D   ; 
- D 1 - I - 0x00E027 03:A017: 8E        .byte $8E   ; 
- D 1 - I - 0x00E028 03:A018: 8F        .byte $8F   ; 
- D 1 - I - 0x00E029 03:A019: 90        .byte $90   ; 
- D 1 - I - 0x00E02A 03:A01A: 91        .byte $91   ; 
- D 1 - I - 0x00E02B 03:A01B: 92        .byte $92   ; 
- D 1 - I - 0x00E02C 03:A01C: 93        .byte $93   ; 
- D 1 - I - 0x00E02D 03:A01D: 94        .byte $94   ; 
- D 1 - I - 0x00E02E 03:A01E: 95        .byte $95   ; 
- D 1 - I - 0x00E02F 03:A01F: 96        .byte $96   ; 
- D 1 - I - 0x00E030 03:A020: 97        .byte $97   ; 
- D 1 - I - 0x00E031 03:A021: 98        .byte $98   ; 
- D 1 - I - 0x00E032 03:A022: 99        .byte $99   ; 
- D 1 - I - 0x00E033 03:A023: 9A        .byte $9A   ; 
- D 1 - I - 0x00E034 03:A024: 9B        .byte $9B   ; 
- D 1 - I - 0x00E035 03:A025: 9C        .byte $9C   ; 
- D 1 - I - 0x00E036 03:A026: 9D        .byte $9D   ; 
- D 1 - I - 0x00E037 03:A027: 9E        .byte $9E   ; 
- D 1 - I - 0x00E038 03:A028: 9F        .byte $9F   ; 
- D 1 - I - 0x00E039 03:A029: A0        .byte $A0   ; 
- - - - - - 0x00E03A 03:A02A: 12        .byte $12   ; 
- - - - - - 0x00E03B 03:A02B: 75        .byte $75   ; 
- - - - - - 0x00E03C 03:A02C: 13        .byte $13   ; 
- - - - - - 0x00E03D 03:A02D: 76        .byte $76   ; 
- - - - - - 0x00E03E 03:A02E: 77        .byte $77   ; 
- - - - - - 0x00E03F 03:A02F: 78        .byte $78   ; 
- - - - - - 0x00E040 03:A030: 79        .byte $79   ; 
- - - - - - 0x00E041 03:A031: 7A        .byte $7A   ; 
- - - - - - 0x00E042 03:A032: 14        .byte $14   ; 
- - - - - - 0x00E043 03:A033: 7B        .byte $7B   ; 
- - - - - - 0x00E044 03:A034: 15        .byte $15   ; 
- - - - - - 0x00E045 03:A035: 7C        .byte $7C   ; 
- - - - - - 0x00E046 03:A036: 7D        .byte $7D   ; 
- - - - - - 0x00E047 03:A037: 7E        .byte $7E   ; 
- - - - - - 0x00E048 03:A038: 7F        .byte $7F   ; 
- - - - - - 0x00E049 03:A039: 80        .byte $80   ; 
- D 1 - I - 0x00E04A 03:A03A: 81        .byte $81   ; 
- D 1 - I - 0x00E04B 03:A03B: 82        .byte $82   ; 
- D 1 - I - 0x00E04C 03:A03C: 83        .byte $83   ; 
- D 1 - I - 0x00E04D 03:A03D: 84        .byte $84   ; 
- D 1 - I - 0x00E04E 03:A03E: 85        .byte $85   ; 
- D 1 - I - 0x00E04F 03:A03F: 86        .byte $86   ; 
- D 1 - I - 0x00E050 03:A040: 87        .byte $87   ; 
- D 1 - I - 0x00E051 03:A041: 88        .byte $88   ; 
- D 1 - I - 0x00E052 03:A042: 89        .byte $89   ; 
- D 1 - I - 0x00E053 03:A043: 8A        .byte $8A   ; 
- D 1 - I - 0x00E054 03:A044: 8B        .byte $8B   ; 
- D 1 - I - 0x00E055 03:A045: 8C        .byte $8C   ; 
- D 1 - I - 0x00E056 03:A046: 8D        .byte $8D   ; 
- D 1 - I - 0x00E057 03:A047: 8E        .byte $8E   ; 
- D 1 - I - 0x00E058 03:A048: 8F        .byte $8F   ; 
- D 1 - I - 0x00E059 03:A049: 90        .byte $90   ; 
- D 1 - I - 0x00E05A 03:A04A: 91        .byte $91   ; 
- D 1 - I - 0x00E05B 03:A04B: 92        .byte $92   ; 
- D 1 - I - 0x00E05C 03:A04C: 93        .byte $93   ; 
- D 1 - I - 0x00E05D 03:A04D: 94        .byte $94   ; 
- D 1 - I - 0x00E05E 03:A04E: 95        .byte $95   ; 
- D 1 - I - 0x00E05F 03:A04F: 96        .byte $96   ; 
- D 1 - I - 0x00E060 03:A050: 97        .byte $97   ; 
- D 1 - I - 0x00E061 03:A051: 98        .byte $98   ; 
- D 1 - I - 0x00E062 03:A052: 99        .byte $99   ; 
- D 1 - I - 0x00E063 03:A053: 9A        .byte $9A   ; 
- D 1 - I - 0x00E064 03:A054: 9B        .byte $9B   ; 
- D 1 - I - 0x00E065 03:A055: 9C        .byte $9C   ; 
- D 1 - I - 0x00E066 03:A056: 9D        .byte $9D   ; 
- D 1 - I - 0x00E067 03:A057: 9E        .byte $9E   ; 
- D 1 - I - 0x00E068 03:A058: 9F        .byte $9F   ; 
- D 1 - I - 0x00E069 03:A059: A0        .byte $A0   ; 
- D 1 - I - 0x00E06A 03:A05A: 12        .byte $12   ; 
- D 1 - I - 0x00E06B 03:A05B: 75        .byte $75   ; 
- D 1 - I - 0x00E06C 03:A05C: 13        .byte $13   ; 
- D 1 - I - 0x00E06D 03:A05D: 76        .byte $76   ; 
- D 1 - I - 0x00E06E 03:A05E: 77        .byte $77   ; 
- D 1 - I - 0x00E06F 03:A05F: 78        .byte $78   ; 
- D 1 - I - 0x00E070 03:A060: 79        .byte $79   ; 
- D 1 - I - 0x00E071 03:A061: 7A        .byte $7A   ; 
- D 1 - I - 0x00E072 03:A062: 14        .byte $14   ; 
- D 1 - I - 0x00E073 03:A063: 7B        .byte $7B   ; 
- D 1 - I - 0x00E074 03:A064: 15        .byte $15   ; 
- D 1 - I - 0x00E075 03:A065: 7C        .byte $7C   ; 
- D 1 - I - 0x00E076 03:A066: 7D        .byte $7D   ; 
- D 1 - I - 0x00E077 03:A067: 7E        .byte $7E   ; 
- D 1 - I - 0x00E078 03:A068: 7F        .byte $7F   ; 
- D 1 - I - 0x00E079 03:A069: 80        .byte $80   ; 
- D 1 - I - 0x00E07A 03:A06A: 81        .byte $81   ; 
- D 1 - I - 0x00E07B 03:A06B: 82        .byte $82   ; 
- D 1 - I - 0x00E07C 03:A06C: 83        .byte $83   ; 
- D 1 - I - 0x00E07D 03:A06D: 84        .byte $84   ; 
- D 1 - I - 0x00E07E 03:A06E: 85        .byte $85   ; 
- D 1 - I - 0x00E07F 03:A06F: 86        .byte $86   ; 
- D 1 - I - 0x00E080 03:A070: 87        .byte $87   ; 
- D 1 - I - 0x00E081 03:A071: 88        .byte $88   ; 
- D 1 - I - 0x00E082 03:A072: 89        .byte $89   ; 
- D 1 - I - 0x00E083 03:A073: 8A        .byte $8A   ; 
- D 1 - I - 0x00E084 03:A074: 8B        .byte $8B   ; 
- D 1 - I - 0x00E085 03:A075: 8C        .byte $8C   ; 
- D 1 - I - 0x00E086 03:A076: 8D        .byte $8D   ; 
- D 1 - I - 0x00E087 03:A077: 8E        .byte $8E   ; 
- D 1 - I - 0x00E088 03:A078: 8F        .byte $8F   ; 
- D 1 - I - 0x00E089 03:A079: 90        .byte $90   ; 
- D 1 - I - 0x00E08A 03:A07A: 91        .byte $91   ; 
- D 1 - I - 0x00E08B 03:A07B: 92        .byte $92   ; 
- D 1 - I - 0x00E08C 03:A07C: 93        .byte $93   ; 
- D 1 - I - 0x00E08D 03:A07D: 94        .byte $94   ; 
- D 1 - I - 0x00E08E 03:A07E: 95        .byte $95   ; 
- D 1 - I - 0x00E08F 03:A07F: 96        .byte $96   ; 
- D 1 - I - 0x00E090 03:A080: 97        .byte $97   ; 
- D 1 - I - 0x00E091 03:A081: 98        .byte $98   ; 
- D 1 - I - 0x00E092 03:A082: 99        .byte $99   ; 
- D 1 - I - 0x00E093 03:A083: 9A        .byte $9A   ; 
- D 1 - I - 0x00E094 03:A084: 9B        .byte $9B   ; 
- D 1 - I - 0x00E095 03:A085: 9C        .byte $9C   ; 
- D 1 - I - 0x00E096 03:A086: 9D        .byte $9D   ; 
- D 1 - I - 0x00E097 03:A087: 9E        .byte $9E   ; 
- D 1 - I - 0x00E098 03:A088: 9F        .byte $9F   ; 
- D 1 - I - 0x00E099 03:A089: A0        .byte $A0   ; 
- D 1 - I - 0x00E09A 03:A08A: 91        .byte $91   ; 
- D 1 - I - 0x00E09B 03:A08B: 82        .byte $82   ; 
- D 1 - I - 0x00E09C 03:A08C: 83        .byte $83   ; 
- D 1 - I - 0x00E09D 03:A08D: 84        .byte $84   ; 
- D 1 - I - 0x00E09E 03:A08E: 85        .byte $85   ; 
- D 1 - I - 0x00E09F 03:A08F: 90        .byte $90   ; 
- D 1 - I - 0x00E0A0 03:A090: A3        .byte $A3   ; 
- D 1 - I - 0x00E0A1 03:A091: 88        .byte $88   ; 
- D 1 - I - 0x00E0A2 03:A092: 89        .byte $89   ; 
- D 1 - I - 0x00E0A3 03:A093: A4        .byte $A4   ; 
- D 1 - I - 0x00E0A4 03:A094: 31        .byte $31   ; 
- D 1 - I - 0x00E0A5 03:A095: 8C        .byte $8C   ; 
- D 1 - I - 0x00E0A6 03:A096: 9D        .byte $9D   ; 
- D 1 - I - 0x00E0A7 03:A097: 8E        .byte $8E   ; 
- D 1 - I - 0x00E0A8 03:A098: 8F        .byte $8F   ; 
- D 1 - I - 0x00E0A9 03:A099: 80        .byte $80   ; 
- D 1 - I - 0x00E0AA 03:A09A: 42        .byte $42   ; 
- D 1 - I - 0x00E0AB 03:A09B: 48        .byte $48   ; 
- D 1 - I - 0x00E0AC 03:A09C: 43        .byte $43   ; 
- D 1 - I - 0x00E0AD 03:A09D: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0AE 03:A09E: 42        .byte $42   ; 
- D 1 - I - 0x00E0AF 03:A09F: 57        .byte $57   ; 
- D 1 - I - 0x00E0B0 03:A0A0: 44        .byte $44   ; 
- D 1 - I - 0x00E0B1 03:A0A1: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0B2 03:A0A2: 42        .byte $42   ; 
- D 1 - I - 0x00E0B3 03:A0A3: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0B4 03:A0A4: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0B5 03:A0A5: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0B6 03:A0A6: 60        .byte $60   ; 
- D 1 - I - 0x00E0B7 03:A0A7: D2        .byte $D2   ; 
- D 1 - I - 0x00E0B8 03:A0A8: 61        .byte $61   ; 
- D 1 - I - 0x00E0B9 03:A0A9: D2        .byte $D2   ; 
- D 1 - I - 0x00E0BA 03:A0AA: 48        .byte $48   ; 
- D 1 - I - 0x00E0BB 03:A0AB: 43        .byte $43   ; 
- D 1 - I - 0x00E0BC 03:A0AC: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0BD 03:A0AD: 56        .byte $56   ; 
- D 1 - I - 0x00E0BE 03:A0AE: 57        .byte $57   ; 
- D 1 - I - 0x00E0BF 03:A0AF: 44        .byte $44   ; 
- D 1 - I - 0x00E0C0 03:A0B0: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0C1 03:A0B1: 56        .byte $56   ; 
- D 1 - I - 0x00E0C2 03:A0B2: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0C3 03:A0B3: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0C4 03:A0B4: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0C5 03:A0B5: 56        .byte $56   ; 
- D 1 - I - 0x00E0C6 03:A0B6: 61        .byte $61   ; 
- D 1 - I - 0x00E0C7 03:A0B7: D2        .byte $D2   ; 
- D 1 - I - 0x00E0C8 03:A0B8: 61        .byte $61   ; 
- D 1 - I - 0x00E0C9 03:A0B9: 62        .byte $62   ; 
- D 1 - I - 0x00E0CA 03:A0BA: 00        .byte $00   ; 
- D 1 - I - 0x00E0CB 03:A0BB: 00        .byte $00   ; 
- D 1 - I - 0x00E0CC 03:A0BC: 00        .byte $00   ; 
- D 1 - I - 0x00E0CD 03:A0BD: 00        .byte $00   ; 
- D 1 - I - 0x00E0CE 03:A0BE: 00        .byte $00   ; 
- D 1 - I - 0x00E0CF 03:A0BF: 00        .byte $00   ; 
- D 1 - I - 0x00E0D0 03:A0C0: 00        .byte $00   ; 
- D 1 - I - 0x00E0D1 03:A0C1: 00        .byte $00   ; 
- D 1 - I - 0x00E0D2 03:A0C2: 49        .byte $49   ; 
- D 1 - I - 0x00E0D3 03:A0C3: 51        .byte $51   ; 
- D 1 - I - 0x00E0D4 03:A0C4: 49        .byte $49   ; 
- D 1 - I - 0x00E0D5 03:A0C5: 51        .byte $51   ; 
- D 1 - I - 0x00E0D6 03:A0C6: 52        .byte $52   ; 
- D 1 - I - 0x00E0D7 03:A0C7: 53        .byte $53   ; 
- D 1 - I - 0x00E0D8 03:A0C8: 52        .byte $52   ; 
- D 1 - I - 0x00E0D9 03:A0C9: 53        .byte $53   ; 
- D 1 - I - 0x00E0DA 03:A0CA: 46        .byte $46   ; 
- D 1 - I - 0x00E0DB 03:A0CB: 46        .byte $46   ; 
- D 1 - I - 0x00E0DC 03:A0CC: 46        .byte $46   ; 
- D 1 - I - 0x00E0DD 03:A0CD: 5D        .byte $5D   ; 
- D 1 - I - 0x00E0DE 03:A0CE: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0DF 03:A0CF: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0E0 03:A0D0: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0E1 03:A0D1: 56        .byte $56   ; 
- D 1 - I - 0x00E0E2 03:A0D2: 46        .byte $46   ; 
- D 1 - I - 0x00E0E3 03:A0D3: 46        .byte $46   ; 
- D 1 - I - 0x00E0E4 03:A0D4: 46        .byte $46   ; 
- D 1 - I - 0x00E0E5 03:A0D5: 5D        .byte $5D   ; 
- D 1 - I - 0x00E0E6 03:A0D6: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0E7 03:A0D7: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0E8 03:A0D8: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0E9 03:A0D9: 56        .byte $56   ; 
- D 1 - I - 0x00E0EA 03:A0DA: 00        .byte $00   ; 
- D 1 - I - 0x00E0EB 03:A0DB: 00        .byte $00   ; 
- D 1 - I - 0x00E0EC 03:A0DC: 00        .byte $00   ; 
- D 1 - I - 0x00E0ED 03:A0DD: 00        .byte $00   ; 
- D 1 - I - 0x00E0EE 03:A0DE: 00        .byte $00   ; 
- D 1 - I - 0x00E0EF 03:A0DF: 00        .byte $00   ; 
- D 1 - I - 0x00E0F0 03:A0E0: 00        .byte $00   ; 
- D 1 - I - 0x00E0F1 03:A0E1: 00        .byte $00   ; 
- D 1 - I - 0x00E0F2 03:A0E2: 32        .byte $32   ; 
- D 1 - I - 0x00E0F3 03:A0E3: 32        .byte $32   ; 
- D 1 - I - 0x00E0F4 03:A0E4: 32        .byte $32   ; 
- D 1 - I - 0x00E0F5 03:A0E5: 32        .byte $32   ; 
- D 1 - I - 0x00E0F6 03:A0E6: DC        .byte $DC   ; 
- D 1 - I - 0x00E0F7 03:A0E7: DC        .byte $DC   ; 
- D 1 - I - 0x00E0F8 03:A0E8: DC        .byte $DC   ; 
- D 1 - I - 0x00E0F9 03:A0E9: DC        .byte $DC   ; 
- D 1 - I - 0x00E0FA 03:A0EA: 32        .byte $32   ; 
- D 1 - I - 0x00E0FB 03:A0EB: D3        .byte $D3   ; 
- D 1 - I - 0x00E0FC 03:A0EC: 3F        .byte $3F   ; 
- D 1 - I - 0x00E0FD 03:A0ED: 3A        .byte $3A   ; 
- D 1 - I - 0x00E0FE 03:A0EE: DC        .byte $DC   ; 
- D 1 - I - 0x00E0FF 03:A0EF: D4        .byte $D4   ; 
- D 1 - I - 0x00E100 03:A0F0: 3D        .byte $3D   ; 
- D 1 - I - 0x00E101 03:A0F1: 3A        .byte $3A   ; 
- D 1 - I - 0x00E102 03:A0F2: 34        .byte $34   ; 
- D 1 - I - 0x00E103 03:A0F3: 34        .byte $34   ; 
- D 1 - I - 0x00E104 03:A0F4: 3A        .byte $3A   ; 
- D 1 - I - 0x00E105 03:A0F5: 3A        .byte $3A   ; 
- D 1 - I - 0x00E106 03:A0F6: C5        .byte $C5   ; 
- D 1 - I - 0x00E107 03:A0F7: C5        .byte $C5   ; 
- D 1 - I - 0x00E108 03:A0F8: C5        .byte $C5   ; 
- D 1 - I - 0x00E109 03:A0F9: C5        .byte $C5   ; 
- D 1 - I - 0x00E10A 03:A0FA: 0D        .byte $0D   ; 
- D 1 - I - 0x00E10B 03:A0FB: 0F        .byte $0F   ; 
- D 1 - I - 0x00E10C 03:A0FC: 0D        .byte $0D   ; 
- D 1 - I - 0x00E10D 03:A0FD: 0F        .byte $0F   ; 
- D 1 - I - 0x00E10E 03:A0FE: E7        .byte $E7   ; 
- D 1 - I - 0x00E10F 03:A0FF: E8        .byte $E8   ; 
- D 1 - I - 0x00E110 03:A100: E7        .byte $E7   ; 
- D 1 - I - 0x00E111 03:A101: E8        .byte $E8   ; 
- D 1 - I - 0x00E112 03:A102: 2B        .byte $2B   ; 
- D 1 - I - 0x00E113 03:A103: 2B        .byte $2B   ; 
- D 1 - I - 0x00E114 03:A104: 2B        .byte $2B   ; 
- D 1 - I - 0x00E115 03:A105: 2B        .byte $2B   ; 
- D 1 - I - 0x00E116 03:A106: DD        .byte $DD   ; 
- D 1 - I - 0x00E117 03:A107: DE        .byte $DE   ; 
- D 1 - I - 0x00E118 03:A108: DE        .byte $DE   ; 
- D 1 - I - 0x00E119 03:A109: DF        .byte $DF   ; 
- D 1 - I - 0x00E11A 03:A10A: 2B        .byte $2B   ; 
- D 1 - I - 0x00E11B 03:A10B: 2B        .byte $2B   ; 
- D 1 - I - 0x00E11C 03:A10C: 2B        .byte $2B   ; 
- D 1 - I - 0x00E11D 03:A10D: 2B        .byte $2B   ; 
- D 1 - I - 0x00E11E 03:A10E: DD        .byte $DD   ; 
- D 1 - I - 0x00E11F 03:A10F: DE        .byte $DE   ; 
- D 1 - I - 0x00E120 03:A110: DE        .byte $DE   ; 
- D 1 - I - 0x00E121 03:A111: DF        .byte $DF   ; 
- D 1 - I - 0x00E122 03:A112: 00        .byte $00   ; 
- D 1 - I - 0x00E123 03:A113: 00        .byte $00   ; 
- D 1 - I - 0x00E124 03:A114: 00        .byte $00   ; 
- D 1 - I - 0x00E125 03:A115: 00        .byte $00   ; 
- D 1 - I - 0x00E126 03:A116: 00        .byte $00   ; 
- D 1 - I - 0x00E127 03:A117: 00        .byte $00   ; 
- D 1 - I - 0x00E128 03:A118: 00        .byte $00   ; 
- D 1 - I - 0x00E129 03:A119: 00        .byte $00   ; 
- D 1 - I - 0x00E12A 03:A11A: 34        .byte $34   ; 
- D 1 - I - 0x00E12B 03:A11B: EF        .byte $EF   ; 
- D 1 - I - 0x00E12C 03:A11C: 0C        .byte $0C   ; 
- D 1 - I - 0x00E12D 03:A11D: 00        .byte $00   ; 
- D 1 - I - 0x00E12E 03:A11E: 3A        .byte $3A   ; 
- D 1 - I - 0x00E12F 03:A11F: F0        .byte $F0   ; 
- D 1 - I - 0x00E130 03:A120: 0C        .byte $0C   ; 
- D 1 - I - 0x00E131 03:A121: 00        .byte $00   ; 
- D 1 - I - 0x00E132 03:A122: 37        .byte $37   ; 
- D 1 - I - 0x00E133 03:A123: 37        .byte $37   ; 
- D 1 - I - 0x00E134 03:A124: 0C        .byte $0C   ; 
- D 1 - I - 0x00E135 03:A125: 00        .byte $00   ; 
- D 1 - I - 0x00E136 03:A126: 3A        .byte $3A   ; 
- D 1 - I - 0x00E137 03:A127: F8        .byte $F8   ; 
- D 1 - I - 0x00E138 03:A128: 0C        .byte $0C   ; 
- D 1 - I - 0x00E139 03:A129: 00        .byte $00   ; 
- D 1 - I - 0x00E13A 03:A12A: 38        .byte $38   ; 
- D 1 - I - 0x00E13B 03:A12B: EF        .byte $EF   ; 
- D 1 - I - 0x00E13C 03:A12C: 0C        .byte $0C   ; 
- D 1 - I - 0x00E13D 03:A12D: 00        .byte $00   ; 
- D 1 - I - 0x00E13E 03:A12E: F2        .byte $F2   ; 
- D 1 - I - 0x00E13F 03:A12F: F3        .byte $F3   ; 
- D 1 - I - 0x00E140 03:A130: 0C        .byte $0C   ; 
- D 1 - I - 0x00E141 03:A131: 00        .byte $00   ; 
- D 1 - I - 0x00E142 03:A132: 39        .byte $39   ; 
- D 1 - I - 0x00E143 03:A133: F4        .byte $F4   ; 
- D 1 - I - 0x00E144 03:A134: 0C        .byte $0C   ; 
- D 1 - I - 0x00E145 03:A135: 00        .byte $00   ; 
- D 1 - I - 0x00E146 03:A136: 3A        .byte $3A   ; 
- D 1 - I - 0x00E147 03:A137: F0        .byte $F0   ; 
- D 1 - I - 0x00E148 03:A138: 0C        .byte $0C   ; 
- D 1 - I - 0x00E149 03:A139: 00        .byte $00   ; 
- D 1 - I - 0x00E14A 03:A13A: 3A        .byte $3A   ; 
- D 1 - I - 0x00E14B 03:A13B: F0        .byte $F0   ; 
- D 1 - I - 0x00E14C 03:A13C: 0C        .byte $0C   ; 
- D 1 - I - 0x00E14D 03:A13D: 00        .byte $00   ; 
- D 1 - I - 0x00E14E 03:A13E: F5        .byte $F5   ; 
- D 1 - I - 0x00E14F 03:A13F: F6        .byte $F6   ; 
- D 1 - I - 0x00E150 03:A140: 0C        .byte $0C   ; 
- D 1 - I - 0x00E151 03:A141: 00        .byte $00   ; 
- D 1 - I - 0x00E152 03:A142: 3B        .byte $3B   ; 
- D 1 - I - 0x00E153 03:A143: F7        .byte $F7   ; 
- D 1 - I - 0x00E154 03:A144: 0C        .byte $0C   ; 
- D 1 - I - 0x00E155 03:A145: 00        .byte $00   ; 
- D 1 - I - 0x00E156 03:A146: C5        .byte $C5   ; 
- D 1 - I - 0x00E157 03:A147: F1        .byte $F1   ; 
- D 1 - I - 0x00E158 03:A148: 1B        .byte $1B   ; 
- D 1 - I - 0x00E159 03:A149: 00        .byte $00   ; 
- D 1 - I - 0x00E15A 03:A14A: 00        .byte $00   ; 
- D 1 - I - 0x00E15B 03:A14B: D5        .byte $D5   ; 
- D 1 - I - 0x00E15C 03:A14C: 33        .byte $33   ; 
- D 1 - I - 0x00E15D 03:A14D: EA        .byte $EA   ; 
- D 1 - I - 0x00E15E 03:A14E: 00        .byte $00   ; 
- D 1 - I - 0x00E15F 03:A14F: D5        .byte $D5   ; 
- D 1 - I - 0x00E160 03:A150: EB        .byte $EB   ; 
- D 1 - I - 0x00E161 03:A151: EC        .byte $EC   ; 
- D 1 - I - 0x00E162 03:A152: 00        .byte $00   ; 
- D 1 - I - 0x00E163 03:A153: D5        .byte $D5   ; 
- D 1 - I - 0x00E164 03:A154: 3C        .byte $3C   ; 
- D 1 - I - 0x00E165 03:A155: ED        .byte $ED   ; 
- D 1 - I - 0x00E166 03:A156: 00        .byte $00   ; 
- D 1 - I - 0x00E167 03:A157: D5        .byte $D5   ; 
- D 1 - I - 0x00E168 03:A158: 3D        .byte $3D   ; 
- D 1 - I - 0x00E169 03:A159: 3A        .byte $3A   ; 
- D 1 - I - 0x00E16A 03:A15A: 00        .byte $00   ; 
- D 1 - I - 0x00E16B 03:A15B: D5        .byte $D5   ; 
- D 1 - I - 0x00E16C 03:A15C: 33        .byte $33   ; 
- D 1 - I - 0x00E16D 03:A15D: 34        .byte $34   ; 
- D 1 - I - 0x00E16E 03:A15E: 00        .byte $00   ; 
- D 1 - I - 0x00E16F 03:A15F: D5        .byte $D5   ; 
- D 1 - I - 0x00E170 03:A160: 3D        .byte $3D   ; 
- D 1 - I - 0x00E171 03:A161: 3A        .byte $3A   ; 
- D 1 - I - 0x00E172 03:A162: 00        .byte $00   ; 
- D 1 - I - 0x00E173 03:A163: D5        .byte $D5   ; 
- D 1 - I - 0x00E174 03:A164: 37        .byte $37   ; 
- D 1 - I - 0x00E175 03:A165: 37        .byte $37   ; 
- D 1 - I - 0x00E176 03:A166: 00        .byte $00   ; 
- D 1 - I - 0x00E177 03:A167: D5        .byte $D5   ; 
- D 1 - I - 0x00E178 03:A168: 3F        .byte $3F   ; 
- D 1 - I - 0x00E179 03:A169: 3A        .byte $3A   ; 
- D 1 - I - 0x00E17A 03:A16A: 00        .byte $00   ; 
- D 1 - I - 0x00E17B 03:A16B: D5        .byte $D5   ; 
- D 1 - I - 0x00E17C 03:A16C: 3D        .byte $3D   ; 
- D 1 - I - 0x00E17D 03:A16D: 3A        .byte $3A   ; 
- D 1 - I - 0x00E17E 03:A16E: 00        .byte $00   ; 
- D 1 - I - 0x00E17F 03:A16F: D5        .byte $D5   ; 
- D 1 - I - 0x00E180 03:A170: EE        .byte $EE   ; 
- D 1 - I - 0x00E181 03:A171: 43        .byte $43   ; 
- D 1 - I - 0x00E182 03:A172: 00        .byte $00   ; 
- D 1 - I - 0x00E183 03:A173: D5        .byte $D5   ; 
- D 1 - I - 0x00E184 03:A174: 3E        .byte $3E   ; 
- D 1 - I - 0x00E185 03:A175: 44        .byte $44   ; 
- D 1 - I - 0x00E186 03:A176: 00        .byte $00   ; 
- D 1 - I - 0x00E187 03:A177: D6        .byte $D6   ; 
- D 1 - I - 0x00E188 03:A178: E9        .byte $E9   ; 
- D 1 - I - 0x00E189 03:A179: C5        .byte $C5   ; 
- D 1 - I - 0x00E18A 03:A17A: 34        .byte $34   ; 
- D 1 - I - 0x00E18B 03:A17B: EF        .byte $EF   ; 
- D 1 - I - 0x00E18C 03:A17C: 0E        .byte $0E   ; 
- D 1 - I - 0x00E18D 03:A17D: 00        .byte $00   ; 
- D 1 - I - 0x00E18E 03:A17E: 37        .byte $37   ; 
- D 1 - I - 0x00E18F 03:A17F: 37        .byte $37   ; 
- D 1 - I - 0x00E190 03:A180: 0C        .byte $0C   ; 
- D 1 - I - 0x00E191 03:A181: 00        .byte $00   ; 
- D 1 - I - 0x00E192 03:A182: 3A        .byte $3A   ; 
- D 1 - I - 0x00E193 03:A183: F0        .byte $F0   ; 
- D 1 - I - 0x00E194 03:A184: 0C        .byte $0C   ; 
- D 1 - I - 0x00E195 03:A185: 00        .byte $00   ; 
- D 1 - I - 0x00E196 03:A186: C5        .byte $C5   ; 
- D 1 - I - 0x00E197 03:A187: F1        .byte $F1   ; 
- D 1 - I - 0x00E198 03:A188: 1B        .byte $1B   ; 
- D 1 - I - 0x00E199 03:A189: 00        .byte $00   ; 
- D 1 - I - 0x00E19A 03:A18A: 00        .byte $00   ; 
- D 1 - I - 0x00E19B 03:A18B: D9        .byte $D9   ; 
- D 1 - I - 0x00E19C 03:A18C: 33        .byte $33   ; 
- D 1 - I - 0x00E19D 03:A18D: 34        .byte $34   ; 
- D 1 - I - 0x00E19E 03:A18E: 00        .byte $00   ; 
- D 1 - I - 0x00E19F 03:A18F: D5        .byte $D5   ; 
- D 1 - I - 0x00E1A0 03:A190: 37        .byte $37   ; 
- D 1 - I - 0x00E1A1 03:A191: 37        .byte $37   ; 
- D 1 - I - 0x00E1A2 03:A192: 00        .byte $00   ; 
- D 1 - I - 0x00E1A3 03:A193: D5        .byte $D5   ; 
- D 1 - I - 0x00E1A4 03:A194: 3D        .byte $3D   ; 
- D 1 - I - 0x00E1A5 03:A195: 3A        .byte $3A   ; 
- D 1 - I - 0x00E1A6 03:A196: 00        .byte $00   ; 
- D 1 - I - 0x00E1A7 03:A197: D6        .byte $D6   ; 
- D 1 - I - 0x00E1A8 03:A198: E9        .byte $E9   ; 
- D 1 - I - 0x00E1A9 03:A199: C5        .byte $C5   ; 
- D 1 - I - 0x00E1AA 03:A19A: 3A        .byte $3A   ; 
- D 1 - I - 0x00E1AB 03:A19B: F8        .byte $F8   ; 
- D 1 - I - 0x00E1AC 03:A19C: 0C        .byte $0C   ; 
- D 1 - I - 0x00E1AD 03:A19D: 00        .byte $00   ; 
- D 1 - I - 0x00E1AE 03:A19E: C5        .byte $C5   ; 
- D 1 - I - 0x00E1AF 03:A19F: F1        .byte $F1   ; 
- D 1 - I - 0x00E1B0 03:A1A0: 0C        .byte $0C   ; 
- D 1 - I - 0x00E1B1 03:A1A1: 00        .byte $00   ; 
- - - - - - 0x00E1B2 03:A1A2: 00        .byte $00   ; 
- - - - - - 0x00E1B3 03:A1A3: 00        .byte $00   ; 
- - - - - - 0x00E1B4 03:A1A4: 00        .byte $00   ; 
- - - - - - 0x00E1B5 03:A1A5: 00        .byte $00   ; 
- - - - - - 0x00E1B6 03:A1A6: 00        .byte $00   ; 
- - - - - - 0x00E1B7 03:A1A7: 00        .byte $00   ; 
- - - - - - 0x00E1B8 03:A1A8: 00        .byte $00   ; 
- - - - - - 0x00E1B9 03:A1A9: 00        .byte $00   ; 
- D 1 - I - 0x00E1BA 03:A1AA: 00        .byte $00   ; 
- D 1 - I - 0x00E1BB 03:A1AB: D5        .byte $D5   ; 
- D 1 - I - 0x00E1BC 03:A1AC: 3F        .byte $3F   ; 
- D 1 - I - 0x00E1BD 03:A1AD: 3A        .byte $3A   ; 
- D 1 - I - 0x00E1BE 03:A1AE: 00        .byte $00   ; 
- D 1 - I - 0x00E1BF 03:A1AF: D5        .byte $D5   ; 
- D 1 - I - 0x00E1C0 03:A1B0: E9        .byte $E9   ; 
- D 1 - I - 0x00E1C1 03:A1B1: C5        .byte $C5   ; 
- - - - - - 0x00E1C2 03:A1B2: 00        .byte $00   ; 
- - - - - - 0x00E1C3 03:A1B3: 00        .byte $00   ; 
- - - - - - 0x00E1C4 03:A1B4: 00        .byte $00   ; 
- - - - - - 0x00E1C5 03:A1B5: 00        .byte $00   ; 
- - - - - - 0x00E1C6 03:A1B6: 00        .byte $00   ; 
- - - - - - 0x00E1C7 03:A1B7: 00        .byte $00   ; 
- - - - - - 0x00E1C8 03:A1B8: 00        .byte $00   ; 
- - - - - - 0x00E1C9 03:A1B9: 00        .byte $00   ; 
- D 1 - I - 0x00E1CA 03:A1BA: 34        .byte $34   ; 
- D 1 - I - 0x00E1CB 03:A1BB: EF        .byte $EF   ; 
- D 1 - I - 0x00E1CC 03:A1BC: 0C        .byte $0C   ; 
- D 1 - I - 0x00E1CD 03:A1BD: 0F        .byte $0F   ; 
- D 1 - I - 0x00E1CE 03:A1BE: F5        .byte $F5   ; 
- D 1 - I - 0x00E1CF 03:A1BF: F6        .byte $F6   ; 
- D 1 - I - 0x00E1D0 03:A1C0: 0C        .byte $0C   ; 
- D 1 - I - 0x00E1D1 03:A1C1: E8        .byte $E8   ; 
- D 1 - I - 0x00E1D2 03:A1C2: 3B        .byte $3B   ; 
- D 1 - I - 0x00E1D3 03:A1C3: F7        .byte $F7   ; 
- D 1 - I - 0x00E1D4 03:A1C4: 28        .byte $28   ; 
- D 1 - I - 0x00E1D5 03:A1C5: 2B        .byte $2B   ; 
- D 1 - I - 0x00E1D6 03:A1C6: C5        .byte $C5   ; 
- D 1 - I - 0x00E1D7 03:A1C7: F1        .byte $F1   ; 
- D 1 - I - 0x00E1D8 03:A1C8: DE        .byte $DE   ; 
- D 1 - I - 0x00E1D9 03:A1C9: DF        .byte $DF   ; 
- D 1 - I - 0x00E1DA 03:A1CA: 0F        .byte $0F   ; 
- D 1 - I - 0x00E1DB 03:A1CB: D5        .byte $D5   ; 
- D 1 - I - 0x00E1DC 03:A1CC: 33        .byte $33   ; 
- D 1 - I - 0x00E1DD 03:A1CD: EA        .byte $EA   ; 
- D 1 - I - 0x00E1DE 03:A1CE: E8        .byte $E8   ; 
- D 1 - I - 0x00E1DF 03:A1CF: D5        .byte $D5   ; 
- D 1 - I - 0x00E1E0 03:A1D0: EB        .byte $EB   ; 
- D 1 - I - 0x00E1E1 03:A1D1: EC        .byte $EC   ; 
- D 1 - I - 0x00E1E2 03:A1D2: 2B        .byte $2B   ; 
- D 1 - I - 0x00E1E3 03:A1D3: D7        .byte $D7   ; 
- D 1 - I - 0x00E1E4 03:A1D4: 3C        .byte $3C   ; 
- D 1 - I - 0x00E1E5 03:A1D5: ED        .byte $ED   ; 
- D 1 - I - 0x00E1E6 03:A1D6: DD        .byte $DD   ; 
- D 1 - I - 0x00E1E7 03:A1D7: DF        .byte $DF   ; 
- D 1 - I - 0x00E1E8 03:A1D8: E9        .byte $E9   ; 
- D 1 - I - 0x00E1E9 03:A1D9: C5        .byte $C5   ; 
- D 1 - I - 0x00E1EA 03:A1DA: 38        .byte $38   ; 
- D 1 - I - 0x00E1EB 03:A1DB: EF        .byte $EF   ; 
- D 1 - I - 0x00E1EC 03:A1DC: 28        .byte $28   ; 
- D 1 - I - 0x00E1ED 03:A1DD: 2B        .byte $2B   ; 
- D 1 - I - 0x00E1EE 03:A1DE: F2        .byte $F2   ; 
- D 1 - I - 0x00E1EF 03:A1DF: F3        .byte $F3   ; 
- D 1 - I - 0x00E1F0 03:A1E0: DE        .byte $DE   ; 
- D 1 - I - 0x00E1F1 03:A1E1: DE        .byte $DE   ; 
- D 1 - I - 0x00E1F2 03:A1E2: 39        .byte $39   ; 
- D 1 - I - 0x00E1F3 03:A1E3: F4        .byte $F4   ; 
- D 1 - I - 0x00E1F4 03:A1E4: 0E        .byte $0E   ; 
- D 1 - I - 0x00E1F5 03:A1E5: 00        .byte $00   ; 
- D 1 - I - 0x00E1F6 03:A1E6: C5        .byte $C5   ; 
- D 1 - I - 0x00E1F7 03:A1E7: F1        .byte $F1   ; 
- D 1 - I - 0x00E1F8 03:A1E8: 1B        .byte $1B   ; 
- D 1 - I - 0x00E1F9 03:A1E9: 00        .byte $00   ; 
- D 1 - I - 0x00E1FA 03:A1EA: 2B        .byte $2B   ; 
- D 1 - I - 0x00E1FB 03:A1EB: D7        .byte $D7   ; 
- D 1 - I - 0x00E1FC 03:A1EC: 33        .byte $33   ; 
- D 1 - I - 0x00E1FD 03:A1ED: 34        .byte $34   ; 
- D 1 - I - 0x00E1FE 03:A1EE: DE        .byte $DE   ; 
- D 1 - I - 0x00E1FF 03:A1EF: DF        .byte $DF   ; 
- D 1 - I - 0x00E200 03:A1F0: EE        .byte $EE   ; 
- D 1 - I - 0x00E201 03:A1F1: 43        .byte $43   ; 
- D 1 - I - 0x00E202 03:A1F2: 00        .byte $00   ; 
- D 1 - I - 0x00E203 03:A1F3: D9        .byte $D9   ; 
- D 1 - I - 0x00E204 03:A1F4: 3E        .byte $3E   ; 
- D 1 - I - 0x00E205 03:A1F5: 44        .byte $44   ; 
- D 1 - I - 0x00E206 03:A1F6: 00        .byte $00   ; 
- D 1 - I - 0x00E207 03:A1F7: D6        .byte $D6   ; 
- D 1 - I - 0x00E208 03:A1F8: E9        .byte $E9   ; 
- D 1 - I - 0x00E209 03:A1F9: C5        .byte $C5   ; 
- D 1 - I - 0x00E20A 03:A1FA: 00        .byte $00   ; 
- D 1 - I - 0x00E20B 03:A1FB: BF        .byte $BF   ; 
- D 1 - I - 0x00E20C 03:A1FC: 10        .byte $10   ; 
- D 1 - I - 0x00E20D 03:A1FD: 10        .byte $10   ; 
- D 1 - I - 0x00E20E 03:A1FE: 00        .byte $00   ; 
- D 1 - I - 0x00E20F 03:A1FF: BF        .byte $BF   ; 
- D 1 - I - 0x00E210 03:A200: 10        .byte $10   ; 
- D 1 - I - 0x00E211 03:A201: 10        .byte $10   ; 
- D 1 - I - 0x00E212 03:A202: 00        .byte $00   ; 
- D 1 - I - 0x00E213 03:A203: BF        .byte $BF   ; 
- D 1 - I - 0x00E214 03:A204: 10        .byte $10   ; 
- D 1 - I - 0x00E215 03:A205: 10        .byte $10   ; 
- D 1 - I - 0x00E216 03:A206: 00        .byte $00   ; 
- D 1 - I - 0x00E217 03:A207: BF        .byte $BF   ; 
- D 1 - I - 0x00E218 03:A208: 10        .byte $10   ; 
- D 1 - I - 0x00E219 03:A209: 10        .byte $10   ; 
- - - - - - 0x00E21A 03:A20A: 10        .byte $10   ; 
- - - - - - 0x00E21B 03:A20B: 10        .byte $10   ; 
- - - - - - 0x00E21C 03:A20C: 10        .byte $10   ; 
- - - - - - 0x00E21D 03:A20D: 10        .byte $10   ; 
- - - - - - 0x00E21E 03:A20E: 10        .byte $10   ; 
- - - - - - 0x00E21F 03:A20F: 10        .byte $10   ; 
- - - - - - 0x00E220 03:A210: 10        .byte $10   ; 
- - - - - - 0x00E221 03:A211: 10        .byte $10   ; 
- - - - - - 0x00E222 03:A212: 10        .byte $10   ; 
- - - - - - 0x00E223 03:A213: 10        .byte $10   ; 
- - - - - - 0x00E224 03:A214: 10        .byte $10   ; 
- - - - - - 0x00E225 03:A215: 10        .byte $10   ; 
- - - - - - 0x00E226 03:A216: 10        .byte $10   ; 
- - - - - - 0x00E227 03:A217: 10        .byte $10   ; 
- - - - - - 0x00E228 03:A218: 10        .byte $10   ; 
- - - - - - 0x00E229 03:A219: 10        .byte $10   ; 
- D 1 - I - 0x00E22A 03:A21A: 10        .byte $10   ; 
- D 1 - I - 0x00E22B 03:A21B: 10        .byte $10   ; 
- D 1 - I - 0x00E22C 03:A21C: 11        .byte $11   ; 
- D 1 - I - 0x00E22D 03:A21D: 00        .byte $00   ; 
- D 1 - I - 0x00E22E 03:A21E: 10        .byte $10   ; 
- D 1 - I - 0x00E22F 03:A21F: 10        .byte $10   ; 
- D 1 - I - 0x00E230 03:A220: 11        .byte $11   ; 
- D 1 - I - 0x00E231 03:A221: 00        .byte $00   ; 
- D 1 - I - 0x00E232 03:A222: 10        .byte $10   ; 
- D 1 - I - 0x00E233 03:A223: 10        .byte $10   ; 
- D 1 - I - 0x00E234 03:A224: 11        .byte $11   ; 
- D 1 - I - 0x00E235 03:A225: 00        .byte $00   ; 
- D 1 - I - 0x00E236 03:A226: 10        .byte $10   ; 
- D 1 - I - 0x00E237 03:A227: 10        .byte $10   ; 
- D 1 - I - 0x00E238 03:A228: 11        .byte $11   ; 
- D 1 - I - 0x00E239 03:A229: 00        .byte $00   ; 
- D 1 - I - 0x00E23A 03:A22A: 06        .byte $06   ; 
- D 1 - I - 0x00E23B 03:A22B: B2        .byte $B2   ; 
- D 1 - I - 0x00E23C 03:A22C: 07        .byte $07   ; 
- D 1 - I - 0x00E23D 03:A22D: 00        .byte $00   ; 
- D 1 - I - 0x00E23E 03:A22E: B6        .byte $B6   ; 
- D 1 - I - 0x00E23F 03:A22F: B7        .byte $B7   ; 
- D 1 - I - 0x00E240 03:A230: B8        .byte $B8   ; 
- D 1 - I - 0x00E241 03:A231: 00        .byte $00   ; 
- D 1 - I - 0x00E242 03:A232: 09        .byte $09   ; 
- D 1 - I - 0x00E243 03:A233: BA        .byte $BA   ; 
- D 1 - I - 0x00E244 03:A234: 00        .byte $00   ; 
- D 1 - I - 0x00E245 03:A235: 00        .byte $00   ; 
- D 1 - I - 0x00E246 03:A236: 00        .byte $00   ; 
- D 1 - I - 0x00E247 03:A237: 00        .byte $00   ; 
- D 1 - I - 0x00E248 03:A238: 00        .byte $00   ; 
- D 1 - I - 0x00E249 03:A239: 00        .byte $00   ; 
- - - - - - 0x00E24A 03:A23A: 00        .byte $00   ; 
- - - - - - 0x00E24B 03:A23B: BF        .byte $BF   ; 
- - - - - - 0x00E24C 03:A23C: 10        .byte $10   ; 
- - - - - - 0x00E24D 03:A23D: 10        .byte $10   ; 
- - - - - - 0x00E24E 03:A23E: 00        .byte $00   ; 
- - - - - - 0x00E24F 03:A23F: BF        .byte $BF   ; 
- - - - - - 0x00E250 03:A240: 10        .byte $10   ; 
- - - - - - 0x00E251 03:A241: 10        .byte $10   ; 
- - - - - - 0x00E252 03:A242: 00        .byte $00   ; 
- - - - - - 0x00E253 03:A243: BF        .byte $BF   ; 
- - - - - - 0x00E254 03:A244: 10        .byte $10   ; 
- - - - - - 0x00E255 03:A245: 10        .byte $10   ; 
- - - - - - 0x00E256 03:A246: 00        .byte $00   ; 
- - - - - - 0x00E257 03:A247: BF        .byte $BF   ; 
- - - - - - 0x00E258 03:A248: 10        .byte $10   ; 
- - - - - - 0x00E259 03:A249: 10        .byte $10   ; 
- - - - - - 0x00E25A 03:A24A: 10        .byte $10   ; 
- - - - - - 0x00E25B 03:A24B: 10        .byte $10   ; 
- - - - - - 0x00E25C 03:A24C: 10        .byte $10   ; 
- - - - - - 0x00E25D 03:A24D: 10        .byte $10   ; 
- - - - - - 0x00E25E 03:A24E: 10        .byte $10   ; 
- - - - - - 0x00E25F 03:A24F: 10        .byte $10   ; 
- - - - - - 0x00E260 03:A250: 10        .byte $10   ; 
- - - - - - 0x00E261 03:A251: 10        .byte $10   ; 
- - - - - - 0x00E262 03:A252: 10        .byte $10   ; 
- - - - - - 0x00E263 03:A253: 10        .byte $10   ; 
- - - - - - 0x00E264 03:A254: 10        .byte $10   ; 
- - - - - - 0x00E265 03:A255: 10        .byte $10   ; 
- - - - - - 0x00E266 03:A256: 10        .byte $10   ; 
- - - - - - 0x00E267 03:A257: 10        .byte $10   ; 
- - - - - - 0x00E268 03:A258: 10        .byte $10   ; 
- - - - - - 0x00E269 03:A259: 10        .byte $10   ; 
- - - - - - 0x00E26A 03:A25A: 10        .byte $10   ; 
- - - - - - 0x00E26B 03:A25B: 10        .byte $10   ; 
- - - - - - 0x00E26C 03:A25C: 11        .byte $11   ; 
- - - - - - 0x00E26D 03:A25D: 00        .byte $00   ; 
- - - - - - 0x00E26E 03:A25E: 10        .byte $10   ; 
- - - - - - 0x00E26F 03:A25F: 10        .byte $10   ; 
- - - - - - 0x00E270 03:A260: 11        .byte $11   ; 
- - - - - - 0x00E271 03:A261: 00        .byte $00   ; 
- - - - - - 0x00E272 03:A262: 10        .byte $10   ; 
- - - - - - 0x00E273 03:A263: 10        .byte $10   ; 
- - - - - - 0x00E274 03:A264: 11        .byte $11   ; 
- - - - - - 0x00E275 03:A265: 00        .byte $00   ; 
- - - - - - 0x00E276 03:A266: 10        .byte $10   ; 
- - - - - - 0x00E277 03:A267: 10        .byte $10   ; 
- - - - - - 0x00E278 03:A268: 11        .byte $11   ; 
- - - - - - 0x00E279 03:A269: 00        .byte $00   ; 
- D 1 - I - 0x00E27A 03:A26A: 00        .byte $00   ; 
- D 1 - I - 0x00E27B 03:A26B: 00        .byte $00   ; 
- D 1 - I - 0x00E27C 03:A26C: 00        .byte $00   ; 
- D 1 - I - 0x00E27D 03:A26D: 00        .byte $00   ; 
- D 1 - I - 0x00E27E 03:A26E: 00        .byte $00   ; 
- D 1 - I - 0x00E27F 03:A26F: BC        .byte $BC   ; 
- D 1 - I - 0x00E280 03:A270: BD        .byte $BD   ; 
- D 1 - I - 0x00E281 03:A271: 00        .byte $00   ; 
- D 1 - I - 0x00E282 03:A272: 00        .byte $00   ; 
- D 1 - I - 0x00E283 03:A273: BE        .byte $BE   ; 
- D 1 - I - 0x00E284 03:A274: 16        .byte $16   ; 
- D 1 - I - 0x00E285 03:A275: 00        .byte $00   ; 
- D 1 - I - 0x00E286 03:A276: 00        .byte $00   ; 
- D 1 - I - 0x00E287 03:A277: 00        .byte $00   ; 
- D 1 - I - 0x00E288 03:A278: 00        .byte $00   ; 
- D 1 - I - 0x00E289 03:A279: 00        .byte $00   ; 
- D 1 - I - 0x00E28A 03:A27A: 2B        .byte $2B   ; 
- D 1 - I - 0x00E28B 03:A27B: 2B        .byte $2B   ; 
- D 1 - I - 0x00E28C 03:A27C: 2B        .byte $2B   ; 
- D 1 - I - 0x00E28D 03:A27D: 2B        .byte $2B   ; 
- D 1 - I - 0x00E28E 03:A27E: DD        .byte $DD   ; 
- D 1 - I - 0x00E28F 03:A27F: DE        .byte $DE   ; 
- D 1 - I - 0x00E290 03:A280: DE        .byte $DE   ; 
- D 1 - I - 0x00E291 03:A281: DF        .byte $DF   ; 
- D 1 - I - 0x00E292 03:A282: 00        .byte $00   ; 
- D 1 - I - 0x00E293 03:A283: C0        .byte $C0   ; 
- D 1 - I - 0x00E294 03:A284: 17        .byte $17   ; 
- D 1 - I - 0x00E295 03:A285: 17        .byte $17   ; 
- D 1 - I - 0x00E296 03:A286: 00        .byte $00   ; 
- D 1 - I - 0x00E297 03:A287: BF        .byte $BF   ; 
- D 1 - I - 0x00E298 03:A288: 10        .byte $10   ; 
- D 1 - I - 0x00E299 03:A289: 10        .byte $10   ; 
- D 1 - I - 0x00E29A 03:A28A: 2B        .byte $2B   ; 
- D 1 - I - 0x00E29B 03:A28B: 2B        .byte $2B   ; 
- D 1 - I - 0x00E29C 03:A28C: 2B        .byte $2B   ; 
- D 1 - I - 0x00E29D 03:A28D: 2B        .byte $2B   ; 
- D 1 - I - 0x00E29E 03:A28E: DD        .byte $DD   ; 
- D 1 - I - 0x00E29F 03:A28F: DE        .byte $DE   ; 
- D 1 - I - 0x00E2A0 03:A290: DE        .byte $DE   ; 
- D 1 - I - 0x00E2A1 03:A291: DF        .byte $DF   ; 
- D 1 - I - 0x00E2A2 03:A292: 17        .byte $17   ; 
- D 1 - I - 0x00E2A3 03:A293: 17        .byte $17   ; 
- D 1 - I - 0x00E2A4 03:A294: 17        .byte $17   ; 
- D 1 - I - 0x00E2A5 03:A295: 17        .byte $17   ; 
- D 1 - I - 0x00E2A6 03:A296: 10        .byte $10   ; 
- D 1 - I - 0x00E2A7 03:A297: 10        .byte $10   ; 
- D 1 - I - 0x00E2A8 03:A298: 10        .byte $10   ; 
- D 1 - I - 0x00E2A9 03:A299: 10        .byte $10   ; 
- D 1 - I - 0x00E2AA 03:A29A: 2B        .byte $2B   ; 
- D 1 - I - 0x00E2AB 03:A29B: 2B        .byte $2B   ; 
- D 1 - I - 0x00E2AC 03:A29C: 2B        .byte $2B   ; 
- D 1 - I - 0x00E2AD 03:A29D: 2B        .byte $2B   ; 
- D 1 - I - 0x00E2AE 03:A29E: DD        .byte $DD   ; 
- D 1 - I - 0x00E2AF 03:A29F: DE        .byte $DE   ; 
- D 1 - I - 0x00E2B0 03:A2A0: DE        .byte $DE   ; 
- D 1 - I - 0x00E2B1 03:A2A1: DF        .byte $DF   ; 
- D 1 - I - 0x00E2B2 03:A2A2: 17        .byte $17   ; 
- D 1 - I - 0x00E2B3 03:A2A3: 17        .byte $17   ; 
- D 1 - I - 0x00E2B4 03:A2A4: 18        .byte $18   ; 
- D 1 - I - 0x00E2B5 03:A2A5: 00        .byte $00   ; 
- D 1 - I - 0x00E2B6 03:A2A6: 10        .byte $10   ; 
- D 1 - I - 0x00E2B7 03:A2A7: 10        .byte $10   ; 
- D 1 - I - 0x00E2B8 03:A2A8: 11        .byte $11   ; 
- D 1 - I - 0x00E2B9 03:A2A9: 00        .byte $00   ; 
- D 1 - I - 0x00E2BA 03:A2AA: 00        .byte $00   ; 
- D 1 - I - 0x00E2BB 03:A2AB: 00        .byte $00   ; 
- D 1 - I - 0x00E2BC 03:A2AC: 00        .byte $00   ; 
- D 1 - I - 0x00E2BD 03:A2AD: 00        .byte $00   ; 
- D 1 - I - 0x00E2BE 03:A2AE: 00        .byte $00   ; 
- D 1 - I - 0x00E2BF 03:A2AF: 00        .byte $00   ; 
- D 1 - I - 0x00E2C0 03:A2B0: 00        .byte $00   ; 
- D 1 - I - 0x00E2C1 03:A2B1: 00        .byte $00   ; 
- D 1 - I - 0x00E2C2 03:A2B2: 0D        .byte $0D   ; 
- D 1 - I - 0x00E2C3 03:A2B3: 0F        .byte $0F   ; 
- D 1 - I - 0x00E2C4 03:A2B4: 0D        .byte $0D   ; 
- D 1 - I - 0x00E2C5 03:A2B5: 0F        .byte $0F   ; 
- D 1 - I - 0x00E2C6 03:A2B6: E7        .byte $E7   ; 
- D 1 - I - 0x00E2C7 03:A2B7: E8        .byte $E8   ; 
- D 1 - I - 0x00E2C8 03:A2B8: E7        .byte $E7   ; 
- D 1 - I - 0x00E2C9 03:A2B9: E8        .byte $E8   ; 
- D 1 - I - 0x00E2CA 03:A2BA: 34        .byte $34   ; 
- D 1 - I - 0x00E2CB 03:A2BB: EF        .byte $EF   ; 
- D 1 - I - 0x00E2CC 03:A2BC: 2C        .byte $2C   ; 
- D 1 - I - 0x00E2CD 03:A2BD: 2B        .byte $2B   ; 
- D 1 - I - 0x00E2CE 03:A2BE: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2CF 03:A2BF: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2D0 03:A2C0: 22        .byte $22   ; 
- D 1 - I - 0x00E2D1 03:A2C1: 22        .byte $22   ; 
- D 1 - I - 0x00E2D2 03:A2C2: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2D3 03:A2C3: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2D4 03:A2C4: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2D5 03:A2C5: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2D6 03:A2C6: C5        .byte $C5   ; 
- D 1 - I - 0x00E2D7 03:A2C7: C5        .byte $C5   ; 
- D 1 - I - 0x00E2D8 03:A2C8: C5        .byte $C5   ; 
- D 1 - I - 0x00E2D9 03:A2C9: C5        .byte $C5   ; 
- D 1 - I - 0x00E2DA 03:A2CA: 4A        .byte $4A   ; 
- D 1 - I - 0x00E2DB 03:A2CB: D7        .byte $D7   ; 
- D 1 - I - 0x00E2DC 03:A2CC: 33        .byte $33   ; 
- D 1 - I - 0x00E2DD 03:A2CD: 34        .byte $34   ; 
- D 1 - I - 0x00E2DE 03:A2CE: 22        .byte $22   ; 
- D 1 - I - 0x00E2DF 03:A2CF: 22        .byte $22   ; 
- D 1 - I - 0x00E2E0 03:A2D0: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2E1 03:A2D1: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2E2 03:A2D2: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2E3 03:A2D3: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2E4 03:A2D4: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2E5 03:A2D5: 3A        .byte $3A   ; 
- D 1 - I - 0x00E2E6 03:A2D6: C5        .byte $C5   ; 
- D 1 - I - 0x00E2E7 03:A2D7: C5        .byte $C5   ; 
- D 1 - I - 0x00E2E8 03:A2D8: C5        .byte $C5   ; 
- D 1 - I - 0x00E2E9 03:A2D9: C5        .byte $C5   ; 
- D 1 - I - 0x00E2EA 03:A2DA: 2B        .byte $2B   ; 
- D 1 - I - 0x00E2EB 03:A2DB: 2B        .byte $2B   ; 
- D 1 - I - 0x00E2EC 03:A2DC: 00        .byte $00   ; 
- D 1 - I - 0x00E2ED 03:A2DD: 00        .byte $00   ; 
- D 1 - I - 0x00E2EE 03:A2DE: DE        .byte $DE   ; 
- D 1 - I - 0x00E2EF 03:A2DF: DF        .byte $DF   ; 
- D 1 - I - 0x00E2F0 03:A2E0: 00        .byte $00   ; 
- D 1 - I - 0x00E2F1 03:A2E1: 00        .byte $00   ; 
- D 1 - I - 0x00E2F2 03:A2E2: 00        .byte $00   ; 
- D 1 - I - 0x00E2F3 03:A2E3: 00        .byte $00   ; 
- D 1 - I - 0x00E2F4 03:A2E4: 00        .byte $00   ; 
- D 1 - I - 0x00E2F5 03:A2E5: 00        .byte $00   ; 
- D 1 - I - 0x00E2F6 03:A2E6: 00        .byte $00   ; 
- D 1 - I - 0x00E2F7 03:A2E7: 00        .byte $00   ; 
- D 1 - I - 0x00E2F8 03:A2E8: 00        .byte $00   ; 
- D 1 - I - 0x00E2F9 03:A2E9: 00        .byte $00   ; 
- D 1 - I - 0x00E2FA 03:A2EA: 0D        .byte $0D   ; 
- D 1 - I - 0x00E2FB 03:A2EB: 0F        .byte $0F   ; 
- D 1 - I - 0x00E2FC 03:A2EC: 00        .byte $00   ; 
- D 1 - I - 0x00E2FD 03:A2ED: 00        .byte $00   ; 
- D 1 - I - 0x00E2FE 03:A2EE: E7        .byte $E7   ; 
- D 1 - I - 0x00E2FF 03:A2EF: E8        .byte $E8   ; 
- D 1 - I - 0x00E300 03:A2F0: 00        .byte $00   ; 
- D 1 - I - 0x00E301 03:A2F1: 00        .byte $00   ; 
- D 1 - I - 0x00E302 03:A2F2: 2B        .byte $2B   ; 
- D 1 - I - 0x00E303 03:A2F3: 2B        .byte $2B   ; 
- D 1 - I - 0x00E304 03:A2F4: 00        .byte $00   ; 
- D 1 - I - 0x00E305 03:A2F5: 00        .byte $00   ; 
- D 1 - I - 0x00E306 03:A2F6: DD        .byte $DD   ; 
- D 1 - I - 0x00E307 03:A2F7: DF        .byte $DF   ; 
- D 1 - I - 0x00E308 03:A2F8: 00        .byte $00   ; 
- D 1 - I - 0x00E309 03:A2F9: 00        .byte $00   ; 
- D 1 - I - 0x00E30A 03:A2FA: 34        .byte $34   ; 
- D 1 - I - 0x00E30B 03:A2FB: EF        .byte $EF   ; 
- D 1 - I - 0x00E30C 03:A2FC: 28        .byte $28   ; 
- D 1 - I - 0x00E30D 03:A2FD: 2B        .byte $2B   ; 
- D 1 - I - 0x00E30E 03:A2FE: 3A        .byte $3A   ; 
- D 1 - I - 0x00E30F 03:A2FF: 3A        .byte $3A   ; 
- D 1 - I - 0x00E310 03:A300: DE        .byte $DE   ; 
- D 1 - I - 0x00E311 03:A301: DE        .byte $DE   ; 
- - - - - - 0x00E312 03:A302: 00        .byte $00   ; 
- - - - - - 0x00E313 03:A303: 00        .byte $00   ; 
- - - - - - 0x00E314 03:A304: 00        .byte $00   ; 
- - - - - - 0x00E315 03:A305: 00        .byte $00   ; 
- - - - - - 0x00E316 03:A306: 00        .byte $00   ; 
- - - - - - 0x00E317 03:A307: 00        .byte $00   ; 
- - - - - - 0x00E318 03:A308: 00        .byte $00   ; 
- - - - - - 0x00E319 03:A309: 00        .byte $00   ; 
- - - - - - 0x00E31A 03:A30A: 00        .byte $00   ; 
- - - - - - 0x00E31B 03:A30B: BF        .byte $BF   ; 
- - - - - - 0x00E31C 03:A30C: 10        .byte $10   ; 
- - - - - - 0x00E31D 03:A30D: 10        .byte $10   ; 
- - - - - - 0x00E31E 03:A30E: 00        .byte $00   ; 
- - - - - - 0x00E31F 03:A30F: BF        .byte $BF   ; 
- - - - - - 0x00E320 03:A310: 10        .byte $10   ; 
- - - - - - 0x00E321 03:A311: 10        .byte $10   ; 
- - - - - - 0x00E322 03:A312: 0D        .byte $0D   ; 
- - - - - - 0x00E323 03:A313: 0F        .byte $0F   ; 
- - - - - - 0x00E324 03:A314: 0D        .byte $0D   ; 
- - - - - - 0x00E325 03:A315: 0F        .byte $0F   ; 
- - - - - - 0x00E326 03:A316: E7        .byte $E7   ; 
- - - - - - 0x00E327 03:A317: E8        .byte $E8   ; 
- - - - - - 0x00E328 03:A318: E7        .byte $E7   ; 
- - - - - - 0x00E329 03:A319: E8        .byte $E8   ; 
- D 1 - I - 0x00E32A 03:A31A: 10        .byte $10   ; 
- D 1 - I - 0x00E32B 03:A31B: 10        .byte $10   ; 
- D 1 - I - 0x00E32C 03:A31C: 10        .byte $10   ; 
- D 1 - I - 0x00E32D 03:A31D: 10        .byte $10   ; 
- D 1 - I - 0x00E32E 03:A31E: 10        .byte $10   ; 
- D 1 - I - 0x00E32F 03:A31F: 10        .byte $10   ; 
- D 1 - I - 0x00E330 03:A320: 10        .byte $10   ; 
- D 1 - I - 0x00E331 03:A321: 10        .byte $10   ; 
- D 1 - I - 0x00E332 03:A322: 0D        .byte $0D   ; 
- D 1 - I - 0x00E333 03:A323: 0F        .byte $0F   ; 
- D 1 - I - 0x00E334 03:A324: 0D        .byte $0D   ; 
- D 1 - I - 0x00E335 03:A325: 0F        .byte $0F   ; 
- D 1 - I - 0x00E336 03:A326: E7        .byte $E7   ; 
- D 1 - I - 0x00E337 03:A327: E8        .byte $E8   ; 
- D 1 - I - 0x00E338 03:A328: E7        .byte $E7   ; 
- D 1 - I - 0x00E339 03:A329: E8        .byte $E8   ; 
- D 1 - I - 0x00E33A 03:A32A: 10        .byte $10   ; 
- D 1 - I - 0x00E33B 03:A32B: 10        .byte $10   ; 
- D 1 - I - 0x00E33C 03:A32C: 11        .byte $11   ; 
- D 1 - I - 0x00E33D 03:A32D: 00        .byte $00   ; 
- D 1 - I - 0x00E33E 03:A32E: 10        .byte $10   ; 
- D 1 - I - 0x00E33F 03:A32F: 10        .byte $10   ; 
- D 1 - I - 0x00E340 03:A330: 11        .byte $11   ; 
- D 1 - I - 0x00E341 03:A331: 00        .byte $00   ; 
- D 1 - I - 0x00E342 03:A332: 0D        .byte $0D   ; 
- D 1 - I - 0x00E343 03:A333: 0F        .byte $0F   ; 
- D 1 - I - 0x00E344 03:A334: 0D        .byte $0D   ; 
- D 1 - I - 0x00E345 03:A335: 0F        .byte $0F   ; 
- D 1 - I - 0x00E346 03:A336: E7        .byte $E7   ; 
- D 1 - I - 0x00E347 03:A337: E8        .byte $E8   ; 
- D 1 - I - 0x00E348 03:A338: E7        .byte $E7   ; 
- D 1 - I - 0x00E349 03:A339: E8        .byte $E8   ; 
- D 1 - I - 0x00E34A 03:A33A: 00        .byte $00   ; 
- D 1 - I - 0x00E34B 03:A33B: 00        .byte $00   ; 
- D 1 - I - 0x00E34C 03:A33C: 00        .byte $00   ; 
- D 1 - I - 0x00E34D 03:A33D: 00        .byte $00   ; 
- D 1 - I - 0x00E34E 03:A33E: 00        .byte $00   ; 
- D 1 - I - 0x00E34F 03:A33F: 00        .byte $00   ; 
- D 1 - I - 0x00E350 03:A340: 00        .byte $00   ; 
- D 1 - I - 0x00E351 03:A341: 00        .byte $00   ; 
- D 1 - I - 0x00E352 03:A342: 00        .byte $00   ; 
- D 1 - I - 0x00E353 03:A343: 00        .byte $00   ; 
- D 1 - I - 0x00E354 03:A344: 2B        .byte $2B   ; 
- D 1 - I - 0x00E355 03:A345: 2B        .byte $2B   ; 
- D 1 - I - 0x00E356 03:A346: 00        .byte $00   ; 
- D 1 - I - 0x00E357 03:A347: 00        .byte $00   ; 
- D 1 - I - 0x00E358 03:A348: DD        .byte $DD   ; 
- D 1 - I - 0x00E359 03:A349: DF        .byte $DF   ; 
- - - - - - 0x00E35A 03:A34A: 2B        .byte $2B   ; 
- - - - - - 0x00E35B 03:A34B: 2B        .byte $2B   ; 
- - - - - - 0x00E35C 03:A34C: 2B        .byte $2B   ; 
- - - - - - 0x00E35D 03:A34D: 2B        .byte $2B   ; 
- - - - - - 0x00E35E 03:A34E: DD        .byte $DD   ; 
- - - - - - 0x00E35F 03:A34F: DE        .byte $DE   ; 
- - - - - - 0x00E360 03:A350: DE        .byte $DE   ; 
- - - - - - 0x00E361 03:A351: DF        .byte $DF   ; 
- - - - - - 0x00E362 03:A352: 0D        .byte $0D   ; 
- - - - - - 0x00E363 03:A353: 0F        .byte $0F   ; 
- - - - - - 0x00E364 03:A354: 0D        .byte $0D   ; 
- - - - - - 0x00E365 03:A355: 0F        .byte $0F   ; 
- - - - - - 0x00E366 03:A356: E7        .byte $E7   ; 
- - - - - - 0x00E367 03:A357: E8        .byte $E8   ; 
- - - - - - 0x00E368 03:A358: E7        .byte $E7   ; 
- - - - - - 0x00E369 03:A359: E8        .byte $E8   ; 
- D 1 - I - 0x00E36A 03:A35A: 34        .byte $34   ; 
- D 1 - I - 0x00E36B 03:A35B: EF        .byte $EF   ; 
- D 1 - I - 0x00E36C 03:A35C: 0C        .byte $0C   ; 
- D 1 - I - 0x00E36D 03:A35D: 00        .byte $00   ; 
- D 1 - I - 0x00E36E 03:A35E: 37        .byte $37   ; 
- D 1 - I - 0x00E36F 03:A35F: 37        .byte $37   ; 
- D 1 - I - 0x00E370 03:A360: 0C        .byte $0C   ; 
- D 1 - I - 0x00E371 03:A361: 00        .byte $00   ; 
- D 1 - I - 0x00E372 03:A362: 3A        .byte $3A   ; 
- D 1 - I - 0x00E373 03:A363: F0        .byte $F0   ; 
- D 1 - I - 0x00E374 03:A364: 0C        .byte $0C   ; 
- D 1 - I - 0x00E375 03:A365: 0F        .byte $0F   ; 
- D 1 - I - 0x00E376 03:A366: C5        .byte $C5   ; 
- D 1 - I - 0x00E377 03:A367: F1        .byte $F1   ; 
- D 1 - I - 0x00E378 03:A368: 0C        .byte $0C   ; 
- D 1 - I - 0x00E379 03:A369: E8        .byte $E8   ; 
- D 1 - I - 0x00E37A 03:A36A: 00        .byte $00   ; 
- D 1 - I - 0x00E37B 03:A36B: D5        .byte $D5   ; 
- D 1 - I - 0x00E37C 03:A36C: 33        .byte $33   ; 
- D 1 - I - 0x00E37D 03:A36D: 34        .byte $34   ; 
- D 1 - I - 0x00E37E 03:A36E: 00        .byte $00   ; 
- D 1 - I - 0x00E37F 03:A36F: D5        .byte $D5   ; 
- D 1 - I - 0x00E380 03:A370: 37        .byte $37   ; 
- D 1 - I - 0x00E381 03:A371: 37        .byte $37   ; 
- D 1 - I - 0x00E382 03:A372: 0F        .byte $0F   ; 
- D 1 - I - 0x00E383 03:A373: D5        .byte $D5   ; 
- D 1 - I - 0x00E384 03:A374: 3D        .byte $3D   ; 
- D 1 - I - 0x00E385 03:A375: 3A        .byte $3A   ; 
- D 1 - I - 0x00E386 03:A376: E8        .byte $E8   ; 
- D 1 - I - 0x00E387 03:A377: D5        .byte $D5   ; 
- D 1 - I - 0x00E388 03:A378: 3D        .byte $3D   ; 
- D 1 - I - 0x00E389 03:A379: 3A        .byte $3A   ; 
- D 1 - I - 0x00E38A 03:A37A: 00        .byte $00   ; 
- D 1 - I - 0x00E38B 03:A37B: 00        .byte $00   ; 
- D 1 - I - 0x00E38C 03:A37C: 00        .byte $00   ; 
- D 1 - I - 0x00E38D 03:A37D: 00        .byte $00   ; 
- D 1 - I - 0x00E38E 03:A37E: 00        .byte $00   ; 
- D 1 - I - 0x00E38F 03:A37F: 00        .byte $00   ; 
- D 1 - I - 0x00E390 03:A380: 00        .byte $00   ; 
- D 1 - I - 0x00E391 03:A381: 00        .byte $00   ; 
- D 1 - I - 0x00E392 03:A382: 2B        .byte $2B   ; 
- D 1 - I - 0x00E393 03:A383: 2B        .byte $2B   ; 
- D 1 - I - 0x00E394 03:A384: 2B        .byte $2B   ; 
- D 1 - I - 0x00E395 03:A385: 2B        .byte $2B   ; 
- D 1 - I - 0x00E396 03:A386: DD        .byte $DD   ; 
- D 1 - I - 0x00E397 03:A387: DE        .byte $DE   ; 
- D 1 - I - 0x00E398 03:A388: DE        .byte $DE   ; 
- D 1 - I - 0x00E399 03:A389: DF        .byte $DF   ; 
- - - - - - 0x00E39A 03:A38A: 34        .byte $34   ; 
- - - - - - 0x00E39B 03:A38B: EF        .byte $EF   ; 
- - - - - - 0x00E39C 03:A38C: 28        .byte $28   ; 
- - - - - - 0x00E39D 03:A38D: 2B        .byte $2B   ; 
- - - - - - 0x00E39E 03:A38E: 37        .byte $37   ; 
- - - - - - 0x00E39F 03:A38F: 37        .byte $37   ; 
- - - - - - 0x00E3A0 03:A390: 34        .byte $34   ; 
- - - - - - 0x00E3A1 03:A391: 34        .byte $34   ; 
- - - - - - 0x00E3A2 03:A392: 00        .byte $00   ; 
- - - - - - 0x00E3A3 03:A393: 00        .byte $00   ; 
- - - - - - 0x00E3A4 03:A394: 00        .byte $00   ; 
- - - - - - 0x00E3A5 03:A395: 00        .byte $00   ; 
- - - - - - 0x00E3A6 03:A396: 00        .byte $00   ; 
- - - - - - 0x00E3A7 03:A397: 00        .byte $00   ; 
- - - - - - 0x00E3A8 03:A398: 00        .byte $00   ; 
- - - - - - 0x00E3A9 03:A399: 00        .byte $00   ; 
- - - - - - 0x00E3AA 03:A39A: 2B        .byte $2B   ; 
- - - - - - 0x00E3AB 03:A39B: D7        .byte $D7   ; 
- - - - - - 0x00E3AC 03:A39C: 33        .byte $33   ; 
- - - - - - 0x00E3AD 03:A39D: 34        .byte $34   ; 
- - - - - - 0x00E3AE 03:A39E: 34        .byte $34   ; 
- - - - - - 0x00E3AF 03:A39F: 34        .byte $34   ; 
- - - - - - 0x00E3B0 03:A3A0: 37        .byte $37   ; 
- - - - - - 0x00E3B1 03:A3A1: 37        .byte $37   ; 
- - - - - - 0x00E3B2 03:A3A2: 00        .byte $00   ; 
- - - - - - 0x00E3B3 03:A3A3: 00        .byte $00   ; 
- - - - - - 0x00E3B4 03:A3A4: 00        .byte $00   ; 
- - - - - - 0x00E3B5 03:A3A5: 00        .byte $00   ; 
- - - - - - 0x00E3B6 03:A3A6: 00        .byte $00   ; 
- - - - - - 0x00E3B7 03:A3A7: 00        .byte $00   ; 
- - - - - - 0x00E3B8 03:A3A8: 00        .byte $00   ; 
- - - - - - 0x00E3B9 03:A3A9: 00        .byte $00   ; 
- - - - - - 0x00E3BA 03:A3AA: 2B        .byte $2B   ; 
- - - - - - 0x00E3BB 03:A3AB: 2B        .byte $2B   ; 
- - - - - - 0x00E3BC 03:A3AC: 00        .byte $00   ; 
- - - - - - 0x00E3BD 03:A3AD: 00        .byte $00   ; 
- - - - - - 0x00E3BE 03:A3AE: 34        .byte $34   ; 
- - - - - - 0x00E3BF 03:A3AF: EF        .byte $EF   ; 
- - - - - - 0x00E3C0 03:A3B0: 00        .byte $00   ; 
- - - - - - 0x00E3C1 03:A3B1: 00        .byte $00   ; 
- - - - - - 0x00E3C2 03:A3B2: 00        .byte $00   ; 
- - - - - - 0x00E3C3 03:A3B3: 00        .byte $00   ; 
- - - - - - 0x00E3C4 03:A3B4: 00        .byte $00   ; 
- - - - - - 0x00E3C5 03:A3B5: 00        .byte $00   ; 
- - - - - - 0x00E3C6 03:A3B6: 00        .byte $00   ; 
- - - - - - 0x00E3C7 03:A3B7: 00        .byte $00   ; 
- - - - - - 0x00E3C8 03:A3B8: 00        .byte $00   ; 
- - - - - - 0x00E3C9 03:A3B9: 00        .byte $00   ; 
- D 1 - I - 0x00E3CA 03:A3BA: 00        .byte $00   ; 
- D 1 - I - 0x00E3CB 03:A3BB: 00        .byte $00   ; 
- D 1 - I - 0x00E3CC 03:A3BC: 2B        .byte $2B   ; 
- D 1 - I - 0x00E3CD 03:A3BD: 2B        .byte $2B   ; 
- D 1 - I - 0x00E3CE 03:A3BE: 00        .byte $00   ; 
- D 1 - I - 0x00E3CF 03:A3BF: 00        .byte $00   ; 
- D 1 - I - 0x00E3D0 03:A3C0: DD        .byte $DD   ; 
- D 1 - I - 0x00E3D1 03:A3C1: DE        .byte $DE   ; 
- D 1 - I - 0x00E3D2 03:A3C2: 00        .byte $00   ; 
- D 1 - I - 0x00E3D3 03:A3C3: 00        .byte $00   ; 
- D 1 - I - 0x00E3D4 03:A3C4: 00        .byte $00   ; 
- D 1 - I - 0x00E3D5 03:A3C5: 00        .byte $00   ; 
- D 1 - I - 0x00E3D6 03:A3C6: 00        .byte $00   ; 
- D 1 - I - 0x00E3D7 03:A3C7: 00        .byte $00   ; 
- D 1 - I - 0x00E3D8 03:A3C8: 00        .byte $00   ; 
- D 1 - I - 0x00E3D9 03:A3C9: 00        .byte $00   ; 
- D 1 - I - 0x00E3DA 03:A3CA: 4A        .byte $4A   ; 
- D 1 - I - 0x00E3DB 03:A3CB: 4A        .byte $4A   ; 
- D 1 - I - 0x00E3DC 03:A3CC: 00        .byte $00   ; 
- D 1 - I - 0x00E3DD 03:A3CD: 00        .byte $00   ; 
- D 1 - I - 0x00E3DE 03:A3CE: 22        .byte $22   ; 
- D 1 - I - 0x00E3DF 03:A3CF: EF        .byte $EF   ; 
- D 1 - I - 0x00E3E0 03:A3D0: 00        .byte $00   ; 
- D 1 - I - 0x00E3E1 03:A3D1: 00        .byte $00   ; 
- D 1 - I - 0x00E3E2 03:A3D2: 3A        .byte $3A   ; 
- D 1 - I - 0x00E3E3 03:A3D3: F0        .byte $F0   ; 
- D 1 - I - 0x00E3E4 03:A3D4: 49        .byte $49   ; 
- D 1 - I - 0x00E3E5 03:A3D5: 51        .byte $51   ; 
- D 1 - I - 0x00E3E6 03:A3D6: C5        .byte $C5   ; 
- D 1 - I - 0x00E3E7 03:A3D7: F1        .byte $F1   ; 
- D 1 - I - 0x00E3E8 03:A3D8: 52        .byte $52   ; 
- D 1 - I - 0x00E3E9 03:A3D9: 53        .byte $53   ; 
- D 1 - I - 0x00E3EA 03:A3DA: 00        .byte $00   ; 
- D 1 - I - 0x00E3EB 03:A3DB: 00        .byte $00   ; 
- D 1 - I - 0x00E3EC 03:A3DC: 4A        .byte $4A   ; 
- D 1 - I - 0x00E3ED 03:A3DD: 4A        .byte $4A   ; 
- D 1 - I - 0x00E3EE 03:A3DE: 00        .byte $00   ; 
- D 1 - I - 0x00E3EF 03:A3DF: 00        .byte $00   ; 
- D 1 - I - 0x00E3F0 03:A3E0: 21        .byte $21   ; 
- D 1 - I - 0x00E3F1 03:A3E1: 34        .byte $34   ; 
- D 1 - I - 0x00E3F2 03:A3E2: 49        .byte $49   ; 
- D 1 - I - 0x00E3F3 03:A3E3: 51        .byte $51   ; 
- D 1 - I - 0x00E3F4 03:A3E4: 3D        .byte $3D   ; 
- D 1 - I - 0x00E3F5 03:A3E5: 3A        .byte $3A   ; 
- D 1 - I - 0x00E3F6 03:A3E6: 52        .byte $52   ; 
- D 1 - I - 0x00E3F7 03:A3E7: 53        .byte $53   ; 
- D 1 - I - 0x00E3F8 03:A3E8: C4        .byte $C4   ; 
- D 1 - I - 0x00E3F9 03:A3E9: C5        .byte $C5   ; 
- D 1 - I - 0x00E3FA 03:A3EA: 34        .byte $34   ; 
- D 1 - I - 0x00E3FB 03:A3EB: EF        .byte $EF   ; 
- D 1 - I - 0x00E3FC 03:A3EC: 0C        .byte $0C   ; 
- D 1 - I - 0x00E3FD 03:A3ED: 17        .byte $17   ; 
- D 1 - I - 0x00E3FE 03:A3EE: 3A        .byte $3A   ; 
- D 1 - I - 0x00E3FF 03:A3EF: F0        .byte $F0   ; 
- D 1 - I - 0x00E400 03:A3F0: 0C        .byte $0C   ; 
- D 1 - I - 0x00E401 03:A3F1: 17        .byte $17   ; 
- D 1 - I - 0x00E402 03:A3F2: 37        .byte $37   ; 
- D 1 - I - 0x00E403 03:A3F3: 37        .byte $37   ; 
- D 1 - I - 0x00E404 03:A3F4: 0C        .byte $0C   ; 
- D 1 - I - 0x00E405 03:A3F5: 17        .byte $17   ; 
- D 1 - I - 0x00E406 03:A3F6: 3A        .byte $3A   ; 
- D 1 - I - 0x00E407 03:A3F7: F8        .byte $F8   ; 
- D 1 - I - 0x00E408 03:A3F8: 0C        .byte $0C   ; 
- D 1 - I - 0x00E409 03:A3F9: 17        .byte $17   ; 
- D 1 - I - 0x00E40A 03:A3FA: 38        .byte $38   ; 
- D 1 - I - 0x00E40B 03:A3FB: EF        .byte $EF   ; 
- D 1 - I - 0x00E40C 03:A3FC: 0C        .byte $0C   ; 
- D 1 - I - 0x00E40D 03:A3FD: 17        .byte $17   ; 
- D 1 - I - 0x00E40E 03:A3FE: F2        .byte $F2   ; 
- D 1 - I - 0x00E40F 03:A3FF: F3        .byte $F3   ; 
- D 1 - I - 0x00E410 03:A400: 0C        .byte $0C   ; 
- D 1 - I - 0x00E411 03:A401: 17        .byte $17   ; 
- D 1 - I - 0x00E412 03:A402: 39        .byte $39   ; 
- D 1 - I - 0x00E413 03:A403: F4        .byte $F4   ; 
- D 1 - I - 0x00E414 03:A404: 0C        .byte $0C   ; 
- D 1 - I - 0x00E415 03:A405: 17        .byte $17   ; 
- D 1 - I - 0x00E416 03:A406: 3A        .byte $3A   ; 
- D 1 - I - 0x00E417 03:A407: F0        .byte $F0   ; 
- D 1 - I - 0x00E418 03:A408: 0C        .byte $0C   ; 
- D 1 - I - 0x00E419 03:A409: 17        .byte $17   ; 
- D 1 - I - 0x00E41A 03:A40A: 3A        .byte $3A   ; 
- D 1 - I - 0x00E41B 03:A40B: F0        .byte $F0   ; 
- D 1 - I - 0x00E41C 03:A40C: 0C        .byte $0C   ; 
- D 1 - I - 0x00E41D 03:A40D: 17        .byte $17   ; 
- D 1 - I - 0x00E41E 03:A40E: F5        .byte $F5   ; 
- D 1 - I - 0x00E41F 03:A40F: F6        .byte $F6   ; 
- D 1 - I - 0x00E420 03:A410: 0C        .byte $0C   ; 
- D 1 - I - 0x00E421 03:A411: 17        .byte $17   ; 
- D 1 - I - 0x00E422 03:A412: 3B        .byte $3B   ; 
- D 1 - I - 0x00E423 03:A413: F7        .byte $F7   ; 
- D 1 - I - 0x00E424 03:A414: 0C        .byte $0C   ; 
- D 1 - I - 0x00E425 03:A415: 17        .byte $17   ; 
- D 1 - I - 0x00E426 03:A416: C5        .byte $C5   ; 
- D 1 - I - 0x00E427 03:A417: F1        .byte $F1   ; 
- D 1 - I - 0x00E428 03:A418: 1B        .byte $1B   ; 
- D 1 - I - 0x00E429 03:A419: 17        .byte $17   ; 
- D 1 - I - 0x00E42A 03:A41A: 17        .byte $17   ; 
- D 1 - I - 0x00E42B 03:A41B: D5        .byte $D5   ; 
- D 1 - I - 0x00E42C 03:A41C: 33        .byte $33   ; 
- D 1 - I - 0x00E42D 03:A41D: EA        .byte $EA   ; 
- D 1 - I - 0x00E42E 03:A41E: 17        .byte $17   ; 
- D 1 - I - 0x00E42F 03:A41F: D5        .byte $D5   ; 
- D 1 - I - 0x00E430 03:A420: EB        .byte $EB   ; 
- D 1 - I - 0x00E431 03:A421: EC        .byte $EC   ; 
- D 1 - I - 0x00E432 03:A422: 17        .byte $17   ; 
- D 1 - I - 0x00E433 03:A423: D5        .byte $D5   ; 
- D 1 - I - 0x00E434 03:A424: 3C        .byte $3C   ; 
- D 1 - I - 0x00E435 03:A425: ED        .byte $ED   ; 
- D 1 - I - 0x00E436 03:A426: 17        .byte $17   ; 
- D 1 - I - 0x00E437 03:A427: D5        .byte $D5   ; 
- D 1 - I - 0x00E438 03:A428: 3D        .byte $3D   ; 
- D 1 - I - 0x00E439 03:A429: 3A        .byte $3A   ; 
- - - - - - 0x00E43A 03:A42A: 17        .byte $17   ; 
- - - - - - 0x00E43B 03:A42B: D5        .byte $D5   ; 
- - - - - - 0x00E43C 03:A42C: 33        .byte $33   ; 
- - - - - - 0x00E43D 03:A42D: 34        .byte $34   ; 
- - - - - - 0x00E43E 03:A42E: 17        .byte $17   ; 
- - - - - - 0x00E43F 03:A42F: D5        .byte $D5   ; 
- - - - - - 0x00E440 03:A430: 3D        .byte $3D   ; 
- - - - - - 0x00E441 03:A431: 3A        .byte $3A   ; 
- - - - - - 0x00E442 03:A432: 17        .byte $17   ; 
- - - - - - 0x00E443 03:A433: D5        .byte $D5   ; 
- - - - - - 0x00E444 03:A434: 37        .byte $37   ; 
- - - - - - 0x00E445 03:A435: 37        .byte $37   ; 
- - - - - - 0x00E446 03:A436: 17        .byte $17   ; 
- - - - - - 0x00E447 03:A437: D5        .byte $D5   ; 
- - - - - - 0x00E448 03:A438: 3F        .byte $3F   ; 
- - - - - - 0x00E449 03:A439: 3A        .byte $3A   ; 
- - - - - - 0x00E44A 03:A43A: 17        .byte $17   ; 
- - - - - - 0x00E44B 03:A43B: D5        .byte $D5   ; 
- - - - - - 0x00E44C 03:A43C: 3D        .byte $3D   ; 
- - - - - - 0x00E44D 03:A43D: 3A        .byte $3A   ; 
- - - - - - 0x00E44E 03:A43E: 17        .byte $17   ; 
- - - - - - 0x00E44F 03:A43F: D5        .byte $D5   ; 
- - - - - - 0x00E450 03:A440: EE        .byte $EE   ; 
- - - - - - 0x00E451 03:A441: 43        .byte $43   ; 
- - - - - - 0x00E452 03:A442: 17        .byte $17   ; 
- - - - - - 0x00E453 03:A443: D5        .byte $D5   ; 
- - - - - - 0x00E454 03:A444: 3E        .byte $3E   ; 
- - - - - - 0x00E455 03:A445: 44        .byte $44   ; 
- - - - - - 0x00E456 03:A446: 17        .byte $17   ; 
- - - - - - 0x00E457 03:A447: D6        .byte $D6   ; 
- - - - - - 0x00E458 03:A448: E9        .byte $E9   ; 
- - - - - - 0x00E459 03:A449: C5        .byte $C5   ; 
- D 1 - I - 0x00E45A 03:A44A: 34        .byte $34   ; 
- D 1 - I - 0x00E45B 03:A44B: EF        .byte $EF   ; 
- D 1 - I - 0x00E45C 03:A44C: 0E        .byte $0E   ; 
- D 1 - I - 0x00E45D 03:A44D: 17        .byte $17   ; 
- D 1 - I - 0x00E45E 03:A44E: 37        .byte $37   ; 
- D 1 - I - 0x00E45F 03:A44F: 37        .byte $37   ; 
- D 1 - I - 0x00E460 03:A450: 0C        .byte $0C   ; 
- D 1 - I - 0x00E461 03:A451: 17        .byte $17   ; 
- D 1 - I - 0x00E462 03:A452: 3A        .byte $3A   ; 
- D 1 - I - 0x00E463 03:A453: F0        .byte $F0   ; 
- D 1 - I - 0x00E464 03:A454: 0C        .byte $0C   ; 
- D 1 - I - 0x00E465 03:A455: 17        .byte $17   ; 
- D 1 - I - 0x00E466 03:A456: C5        .byte $C5   ; 
- D 1 - I - 0x00E467 03:A457: F1        .byte $F1   ; 
- D 1 - I - 0x00E468 03:A458: 1B        .byte $1B   ; 
- D 1 - I - 0x00E469 03:A459: 17        .byte $17   ; 
- D 1 - I - 0x00E46A 03:A45A: 17        .byte $17   ; 
- D 1 - I - 0x00E46B 03:A45B: D9        .byte $D9   ; 
- D 1 - I - 0x00E46C 03:A45C: 33        .byte $33   ; 
- D 1 - I - 0x00E46D 03:A45D: 34        .byte $34   ; 
- D 1 - I - 0x00E46E 03:A45E: 17        .byte $17   ; 
- D 1 - I - 0x00E46F 03:A45F: D5        .byte $D5   ; 
- D 1 - I - 0x00E470 03:A460: 37        .byte $37   ; 
- D 1 - I - 0x00E471 03:A461: 37        .byte $37   ; 
- D 1 - I - 0x00E472 03:A462: 17        .byte $17   ; 
- D 1 - I - 0x00E473 03:A463: D5        .byte $D5   ; 
- D 1 - I - 0x00E474 03:A464: 3D        .byte $3D   ; 
- D 1 - I - 0x00E475 03:A465: 3A        .byte $3A   ; 
- D 1 - I - 0x00E476 03:A466: 17        .byte $17   ; 
- D 1 - I - 0x00E477 03:A467: D6        .byte $D6   ; 
- D 1 - I - 0x00E478 03:A468: E9        .byte $E9   ; 
- D 1 - I - 0x00E479 03:A469: C5        .byte $C5   ; 
- - - - - - 0x00E47A 03:A46A: 3A        .byte $3A   ; 
- - - - - - 0x00E47B 03:A46B: F8        .byte $F8   ; 
- - - - - - 0x00E47C 03:A46C: 0C        .byte $0C   ; 
- - - - - - 0x00E47D 03:A46D: 17        .byte $17   ; 
- - - - - - 0x00E47E 03:A46E: C5        .byte $C5   ; 
- - - - - - 0x00E47F 03:A46F: F1        .byte $F1   ; 
- - - - - - 0x00E480 03:A470: 0C        .byte $0C   ; 
- - - - - - 0x00E481 03:A471: 17        .byte $17   ; 
- - - - - - 0x00E482 03:A472: 00        .byte $00   ; 
- - - - - - 0x00E483 03:A473: 00        .byte $00   ; 
- - - - - - 0x00E484 03:A474: 00        .byte $00   ; 
- - - - - - 0x00E485 03:A475: 00        .byte $00   ; 
- - - - - - 0x00E486 03:A476: 00        .byte $00   ; 
- - - - - - 0x00E487 03:A477: 00        .byte $00   ; 
- - - - - - 0x00E488 03:A478: 00        .byte $00   ; 
- - - - - - 0x00E489 03:A479: 00        .byte $00   ; 
- - - - - - 0x00E48A 03:A47A: 17        .byte $17   ; 
- - - - - - 0x00E48B 03:A47B: D5        .byte $D5   ; 
- - - - - - 0x00E48C 03:A47C: 3F        .byte $3F   ; 
- - - - - - 0x00E48D 03:A47D: 3A        .byte $3A   ; 
- - - - - - 0x00E48E 03:A47E: 17        .byte $17   ; 
- - - - - - 0x00E48F 03:A47F: D5        .byte $D5   ; 
- - - - - - 0x00E490 03:A480: E9        .byte $E9   ; 
- - - - - - 0x00E491 03:A481: C5        .byte $C5   ; 
- - - - - - 0x00E492 03:A482: 00        .byte $00   ; 
- - - - - - 0x00E493 03:A483: 00        .byte $00   ; 
- - - - - - 0x00E494 03:A484: 00        .byte $00   ; 
- - - - - - 0x00E495 03:A485: 00        .byte $00   ; 
- - - - - - 0x00E496 03:A486: 00        .byte $00   ; 
- - - - - - 0x00E497 03:A487: 00        .byte $00   ; 
- - - - - - 0x00E498 03:A488: 00        .byte $00   ; 
- - - - - - 0x00E499 03:A489: 00        .byte $00   ; 
- D 1 - I - 0x00E49A 03:A48A: 38        .byte $38   ; 
- D 1 - I - 0x00E49B 03:A48B: EF        .byte $EF   ; 
- D 1 - I - 0x00E49C 03:A48C: 28        .byte $28   ; 
- D 1 - I - 0x00E49D 03:A48D: 2B        .byte $2B   ; 
- D 1 - I - 0x00E49E 03:A48E: F2        .byte $F2   ; 
- D 1 - I - 0x00E49F 03:A48F: F3        .byte $F3   ; 
- D 1 - I - 0x00E4A0 03:A490: DE        .byte $DE   ; 
- D 1 - I - 0x00E4A1 03:A491: DE        .byte $DE   ; 
- D 1 - I - 0x00E4A2 03:A492: 39        .byte $39   ; 
- D 1 - I - 0x00E4A3 03:A493: F4        .byte $F4   ; 
- D 1 - I - 0x00E4A4 03:A494: 0E        .byte $0E   ; 
- D 1 - I - 0x00E4A5 03:A495: 17        .byte $17   ; 
- D 1 - I - 0x00E4A6 03:A496: C5        .byte $C5   ; 
- D 1 - I - 0x00E4A7 03:A497: F1        .byte $F1   ; 
- D 1 - I - 0x00E4A8 03:A498: 1B        .byte $1B   ; 
- D 1 - I - 0x00E4A9 03:A499: 17        .byte $17   ; 
- D 1 - I - 0x00E4AA 03:A49A: 2B        .byte $2B   ; 
- D 1 - I - 0x00E4AB 03:A49B: D7        .byte $D7   ; 
- D 1 - I - 0x00E4AC 03:A49C: 33        .byte $33   ; 
- D 1 - I - 0x00E4AD 03:A49D: 34        .byte $34   ; 
- D 1 - I - 0x00E4AE 03:A49E: DE        .byte $DE   ; 
- D 1 - I - 0x00E4AF 03:A49F: DF        .byte $DF   ; 
- D 1 - I - 0x00E4B0 03:A4A0: EE        .byte $EE   ; 
- D 1 - I - 0x00E4B1 03:A4A1: 43        .byte $43   ; 
- D 1 - I - 0x00E4B2 03:A4A2: 17        .byte $17   ; 
- D 1 - I - 0x00E4B3 03:A4A3: D9        .byte $D9   ; 
- D 1 - I - 0x00E4B4 03:A4A4: 3E        .byte $3E   ; 
- D 1 - I - 0x00E4B5 03:A4A5: 44        .byte $44   ; 
- D 1 - I - 0x00E4B6 03:A4A6: 17        .byte $17   ; 
- D 1 - I - 0x00E4B7 03:A4A7: D6        .byte $D6   ; 
- D 1 - I - 0x00E4B8 03:A4A8: E9        .byte $E9   ; 
- D 1 - I - 0x00E4B9 03:A4A9: C5        .byte $C5   ; 
- D 1 - I - 0x00E4BA 03:A4AA: 00        .byte $00   ; 
- D 1 - I - 0x00E4BB 03:A4AB: 00        .byte $00   ; 
- D 1 - I - 0x00E4BC 03:A4AC: 00        .byte $00   ; 
- D 1 - I - 0x00E4BD 03:A4AD: 00        .byte $00   ; 
- D 1 - I - 0x00E4BE 03:A4AE: 00        .byte $00   ; 
- D 1 - I - 0x00E4BF 03:A4AF: 00        .byte $00   ; 
- D 1 - I - 0x00E4C0 03:A4B0: 00        .byte $00   ; 
- D 1 - I - 0x00E4C1 03:A4B1: 00        .byte $00   ; 
- D 1 - I - 0x00E4C2 03:A4B2: 2B        .byte $2B   ; 
- D 1 - I - 0x00E4C3 03:A4B3: 2B        .byte $2B   ; 
- D 1 - I - 0x00E4C4 03:A4B4: 00        .byte $00   ; 
- D 1 - I - 0x00E4C5 03:A4B5: 00        .byte $00   ; 
- D 1 - I - 0x00E4C6 03:A4B6: DD        .byte $DD   ; 
- D 1 - I - 0x00E4C7 03:A4B7: DF        .byte $DF   ; 
- D 1 - I - 0x00E4C8 03:A4B8: 00        .byte $00   ; 
- D 1 - I - 0x00E4C9 03:A4B9: 00        .byte $00   ; 
- D 1 - I - 0x00E4CA 03:A4BA: 34        .byte $34   ; 
- D 1 - I - 0x00E4CB 03:A4BB: EF        .byte $EF   ; 
- D 1 - I - 0x00E4CC 03:A4BC: 0C        .byte $0C   ; 
- D 1 - I - 0x00E4CD 03:A4BD: 00        .byte $00   ; 
- D 1 - I - 0x00E4CE 03:A4BE: F5        .byte $F5   ; 
- D 1 - I - 0x00E4CF 03:A4BF: F6        .byte $F6   ; 
- D 1 - I - 0x00E4D0 03:A4C0: 0C        .byte $0C   ; 
- D 1 - I - 0x00E4D1 03:A4C1: 00        .byte $00   ; 
- D 1 - I - 0x00E4D2 03:A4C2: 3B        .byte $3B   ; 
- D 1 - I - 0x00E4D3 03:A4C3: F7        .byte $F7   ; 
- D 1 - I - 0x00E4D4 03:A4C4: 28        .byte $28   ; 
- D 1 - I - 0x00E4D5 03:A4C5: 2B        .byte $2B   ; 
- D 1 - I - 0x00E4D6 03:A4C6: C5        .byte $C5   ; 
- D 1 - I - 0x00E4D7 03:A4C7: F1        .byte $F1   ; 
- D 1 - I - 0x00E4D8 03:A4C8: DE        .byte $DE   ; 
- D 1 - I - 0x00E4D9 03:A4C9: DF        .byte $DF   ; 
- - - - - - 0x00E4DA 03:A4CA: 00        .byte $00   ; 
- - - - - - 0x00E4DB 03:A4CB: D5        .byte $D5   ; 
- - - - - - 0x00E4DC 03:A4CC: 33        .byte $33   ; 
- - - - - - 0x00E4DD 03:A4CD: EA        .byte $EA   ; 
- - - - - - 0x00E4DE 03:A4CE: 00        .byte $00   ; 
- - - - - - 0x00E4DF 03:A4CF: D5        .byte $D5   ; 
- - - - - - 0x00E4E0 03:A4D0: EB        .byte $EB   ; 
- - - - - - 0x00E4E1 03:A4D1: EC        .byte $EC   ; 
- - - - - - 0x00E4E2 03:A4D2: 2B        .byte $2B   ; 
- - - - - - 0x00E4E3 03:A4D3: D7        .byte $D7   ; 
- - - - - - 0x00E4E4 03:A4D4: 3C        .byte $3C   ; 
- - - - - - 0x00E4E5 03:A4D5: ED        .byte $ED   ; 
- - - - - - 0x00E4E6 03:A4D6: DD        .byte $DD   ; 
- - - - - - 0x00E4E7 03:A4D7: DF        .byte $DF   ; 
- - - - - - 0x00E4E8 03:A4D8: E9        .byte $E9   ; 
- - - - - - 0x00E4E9 03:A4D9: C5        .byte $C5   ; 
- - - - - - 0x00E4EA 03:A4DA: 10        .byte $10   ; 
- - - - - - 0x00E4EB 03:A4DB: 10        .byte $10   ; 
- - - - - - 0x00E4EC 03:A4DC: 11        .byte $11   ; 
- - - - - - 0x00E4ED 03:A4DD: 00        .byte $00   ; 
- - - - - - 0x00E4EE 03:A4DE: 10        .byte $10   ; 
- - - - - - 0x00E4EF 03:A4DF: 10        .byte $10   ; 
- - - - - - 0x00E4F0 03:A4E0: 11        .byte $11   ; 
- - - - - - 0x00E4F1 03:A4E1: 00        .byte $00   ; 
- - - - - - 0x00E4F2 03:A4E2: 2B        .byte $2B   ; 
- - - - - - 0x00E4F3 03:A4E3: 2B        .byte $2B   ; 
- - - - - - 0x00E4F4 03:A4E4: 2B        .byte $2B   ; 
- - - - - - 0x00E4F5 03:A4E5: 2B        .byte $2B   ; 
- - - - - - 0x00E4F6 03:A4E6: DD        .byte $DD   ; 
- - - - - - 0x00E4F7 03:A4E7: DE        .byte $DE   ; 
- - - - - - 0x00E4F8 03:A4E8: DE        .byte $DE   ; 
- - - - - - 0x00E4F9 03:A4E9: DF        .byte $DF   ; 
- - - - - - 0x00E4FA 03:A4EA: 00        .byte $00   ; 
- - - - - - 0x00E4FB 03:A4EB: BF        .byte $BF   ; 
- - - - - - 0x00E4FC 03:A4EC: 10        .byte $10   ; 
- - - - - - 0x00E4FD 03:A4ED: 10        .byte $10   ; 
- - - - - - 0x00E4FE 03:A4EE: 00        .byte $00   ; 
- - - - - - 0x00E4FF 03:A4EF: BF        .byte $BF   ; 
- - - - - - 0x00E500 03:A4F0: 10        .byte $10   ; 
- - - - - - 0x00E501 03:A4F1: 10        .byte $10   ; 
- - - - - - 0x00E502 03:A4F2: 2B        .byte $2B   ; 
- - - - - - 0x00E503 03:A4F3: 2B        .byte $2B   ; 
- - - - - - 0x00E504 03:A4F4: 2B        .byte $2B   ; 
- - - - - - 0x00E505 03:A4F5: 2B        .byte $2B   ; 
- - - - - - 0x00E506 03:A4F6: DD        .byte $DD   ; 
- - - - - - 0x00E507 03:A4F7: DE        .byte $DE   ; 
- - - - - - 0x00E508 03:A4F8: DE        .byte $DE   ; 
- - - - - - 0x00E509 03:A4F9: DF        .byte $DF   ; 
- D 1 - I - 0x00E50A 03:A4FA: 3A        .byte $3A   ; 
- D 1 - I - 0x00E50B 03:A4FB: F0        .byte $F0   ; 
- D 1 - I - 0x00E50C 03:A4FC: 19        .byte $19   ; 
- D 1 - I - 0x00E50D 03:A4FD: 1A        .byte $1A   ; 
- D 1 - I - 0x00E50E 03:A4FE: 3A        .byte $3A   ; 
- D 1 - I - 0x00E50F 03:A4FF: F0        .byte $F0   ; 
- D 1 - I - 0x00E510 03:A500: 0C        .byte $0C   ; 
- D 1 - I - 0x00E511 03:A501: 00        .byte $00   ; 
- D 1 - I - 0x00E512 03:A502: 3A        .byte $3A   ; 
- D 1 - I - 0x00E513 03:A503: F0        .byte $F0   ; 
- D 1 - I - 0x00E514 03:A504: 0C        .byte $0C   ; 
- D 1 - I - 0x00E515 03:A505: 00        .byte $00   ; 
- D 1 - I - 0x00E516 03:A506: C5        .byte $C5   ; 
- D 1 - I - 0x00E517 03:A507: F1        .byte $F1   ; 
- D 1 - I - 0x00E518 03:A508: 1B        .byte $1B   ; 
- D 1 - I - 0x00E519 03:A509: 00        .byte $00   ; 
- D 1 - I - 0x00E51A 03:A50A: 1A        .byte $1A   ; 
- D 1 - I - 0x00E51B 03:A50B: E1        .byte $E1   ; 
- D 1 - I - 0x00E51C 03:A50C: 3D        .byte $3D   ; 
- D 1 - I - 0x00E51D 03:A50D: 3A        .byte $3A   ; 
- D 1 - I - 0x00E51E 03:A50E: 00        .byte $00   ; 
- D 1 - I - 0x00E51F 03:A50F: D5        .byte $D5   ; 
- D 1 - I - 0x00E520 03:A510: 3D        .byte $3D   ; 
- D 1 - I - 0x00E521 03:A511: 3A        .byte $3A   ; 
- D 1 - I - 0x00E522 03:A512: 00        .byte $00   ; 
- D 1 - I - 0x00E523 03:A513: D5        .byte $D5   ; 
- D 1 - I - 0x00E524 03:A514: 3D        .byte $3D   ; 
- D 1 - I - 0x00E525 03:A515: 3A        .byte $3A   ; 
- D 1 - I - 0x00E526 03:A516: 00        .byte $00   ; 
- D 1 - I - 0x00E527 03:A517: D6        .byte $D6   ; 
- D 1 - I - 0x00E528 03:A518: E9        .byte $E9   ; 
- D 1 - I - 0x00E529 03:A519: C5        .byte $C5   ; 
- D 1 - I - 0x00E52A 03:A51A: 3A        .byte $3A   ; 
- D 1 - I - 0x00E52B 03:A51B: F0        .byte $F0   ; 
- D 1 - I - 0x00E52C 03:A51C: 0C        .byte $0C   ; 
- D 1 - I - 0x00E52D 03:A51D: 00        .byte $00   ; 
- D 1 - I - 0x00E52E 03:A51E: C5        .byte $C5   ; 
- D 1 - I - 0x00E52F 03:A51F: F1        .byte $F1   ; 
- D 1 - I - 0x00E530 03:A520: 1B        .byte $1B   ; 
- D 1 - I - 0x00E531 03:A521: 00        .byte $00   ; 
- D 1 - I - 0x00E532 03:A522: 34        .byte $34   ; 
- D 1 - I - 0x00E533 03:A523: EF        .byte $EF   ; 
- D 1 - I - 0x00E534 03:A524: 19        .byte $19   ; 
- D 1 - I - 0x00E535 03:A525: 1A        .byte $1A   ; 
- D 1 - I - 0x00E536 03:A526: 3A        .byte $3A   ; 
- D 1 - I - 0x00E537 03:A527: F0        .byte $F0   ; 
- D 1 - I - 0x00E538 03:A528: 0C        .byte $0C   ; 
- D 1 - I - 0x00E539 03:A529: 00        .byte $00   ; 
- D 1 - I - 0x00E53A 03:A52A: 00        .byte $00   ; 
- D 1 - I - 0x00E53B 03:A52B: D5        .byte $D5   ; 
- D 1 - I - 0x00E53C 03:A52C: 3D        .byte $3D   ; 
- D 1 - I - 0x00E53D 03:A52D: 3A        .byte $3A   ; 
- D 1 - I - 0x00E53E 03:A52E: 00        .byte $00   ; 
- D 1 - I - 0x00E53F 03:A52F: D6        .byte $D6   ; 
- D 1 - I - 0x00E540 03:A530: E9        .byte $E9   ; 
- D 1 - I - 0x00E541 03:A531: C5        .byte $C5   ; 
- D 1 - I - 0x00E542 03:A532: 1A        .byte $1A   ; 
- D 1 - I - 0x00E543 03:A533: E1        .byte $E1   ; 
- D 1 - I - 0x00E544 03:A534: 33        .byte $33   ; 
- D 1 - I - 0x00E545 03:A535: 34        .byte $34   ; 
- D 1 - I - 0x00E546 03:A536: 00        .byte $00   ; 
- D 1 - I - 0x00E547 03:A537: D5        .byte $D5   ; 
- D 1 - I - 0x00E548 03:A538: 3D        .byte $3D   ; 
- D 1 - I - 0x00E549 03:A539: 3A        .byte $3A   ; 
- D 1 - I - 0x00E54A 03:A53A: 1A        .byte $1A   ; 
- D 1 - I - 0x00E54B 03:A53B: 1A        .byte $1A   ; 
- D 1 - I - 0x00E54C 03:A53C: 1A        .byte $1A   ; 
- D 1 - I - 0x00E54D 03:A53D: 1A        .byte $1A   ; 
- D 1 - I - 0x00E54E 03:A53E: 00        .byte $00   ; 
- D 1 - I - 0x00E54F 03:A53F: 00        .byte $00   ; 
- D 1 - I - 0x00E550 03:A540: 00        .byte $00   ; 
- D 1 - I - 0x00E551 03:A541: 00        .byte $00   ; 
- D 1 - I - 0x00E552 03:A542: 00        .byte $00   ; 
- D 1 - I - 0x00E553 03:A543: 00        .byte $00   ; 
- D 1 - I - 0x00E554 03:A544: 00        .byte $00   ; 
- D 1 - I - 0x00E555 03:A545: 00        .byte $00   ; 
- D 1 - I - 0x00E556 03:A546: 00        .byte $00   ; 
- D 1 - I - 0x00E557 03:A547: 00        .byte $00   ; 
- D 1 - I - 0x00E558 03:A548: 00        .byte $00   ; 
- D 1 - I - 0x00E559 03:A549: 00        .byte $00   ; 
- D 1 - I - 0x00E55A 03:A54A: 00        .byte $00   ; 
- D 1 - I - 0x00E55B 03:A54B: 00        .byte $00   ; 
- D 1 - I - 0x00E55C 03:A54C: 00        .byte $00   ; 
- D 1 - I - 0x00E55D 03:A54D: 00        .byte $00   ; 
- D 1 - I - 0x00E55E 03:A54E: 00        .byte $00   ; 
- D 1 - I - 0x00E55F 03:A54F: 00        .byte $00   ; 
- D 1 - I - 0x00E560 03:A550: 00        .byte $00   ; 
- D 1 - I - 0x00E561 03:A551: 00        .byte $00   ; 
- D 1 - I - 0x00E562 03:A552: 1A        .byte $1A   ; 
- D 1 - I - 0x00E563 03:A553: 1A        .byte $1A   ; 
- D 1 - I - 0x00E564 03:A554: 1A        .byte $1A   ; 
- D 1 - I - 0x00E565 03:A555: 1A        .byte $1A   ; 
- D 1 - I - 0x00E566 03:A556: 00        .byte $00   ; 
- D 1 - I - 0x00E567 03:A557: 00        .byte $00   ; 
- D 1 - I - 0x00E568 03:A558: 00        .byte $00   ; 
- D 1 - I - 0x00E569 03:A559: 00        .byte $00   ; 
- D 1 - I - 0x00E56A 03:A55A: 3A        .byte $3A   ; 
- D 1 - I - 0x00E56B 03:A55B: F0        .byte $F0   ; 
- D 1 - I - 0x00E56C 03:A55C: 1D        .byte $1D   ; 
- D 1 - I - 0x00E56D 03:A55D: 00        .byte $00   ; 
- D 1 - I - 0x00E56E 03:A55E: F5        .byte $F5   ; 
- D 1 - I - 0x00E56F 03:A55F: F6        .byte $F6   ; 
- D 1 - I - 0x00E570 03:A560: 1D        .byte $1D   ; 
- D 1 - I - 0x00E571 03:A561: 00        .byte $00   ; 
- D 1 - I - 0x00E572 03:A562: 3B        .byte $3B   ; 
- D 1 - I - 0x00E573 03:A563: F7        .byte $F7   ; 
- D 1 - I - 0x00E574 03:A564: 27        .byte $27   ; 
- D 1 - I - 0x00E575 03:A565: 2B        .byte $2B   ; 
- D 1 - I - 0x00E576 03:A566: C5        .byte $C5   ; 
- D 1 - I - 0x00E577 03:A567: F1        .byte $F1   ; 
- D 1 - I - 0x00E578 03:A568: DE        .byte $DE   ; 
- D 1 - I - 0x00E579 03:A569: DE        .byte $DE   ; 
- D 1 - I - 0x00E57A 03:A56A: 00        .byte $00   ; 
- D 1 - I - 0x00E57B 03:A56B: E3        .byte $E3   ; 
- D 1 - I - 0x00E57C 03:A56C: 3D        .byte $3D   ; 
- D 1 - I - 0x00E57D 03:A56D: 3A        .byte $3A   ; 
- D 1 - I - 0x00E57E 03:A56E: 00        .byte $00   ; 
- D 1 - I - 0x00E57F 03:A56F: E3        .byte $E3   ; 
- D 1 - I - 0x00E580 03:A570: EE        .byte $EE   ; 
- D 1 - I - 0x00E581 03:A571: 43        .byte $43   ; 
- D 1 - I - 0x00E582 03:A572: 2B        .byte $2B   ; 
- D 1 - I - 0x00E583 03:A573: E4        .byte $E4   ; 
- D 1 - I - 0x00E584 03:A574: 3E        .byte $3E   ; 
- D 1 - I - 0x00E585 03:A575: 44        .byte $44   ; 
- D 1 - I - 0x00E586 03:A576: DE        .byte $DE   ; 
- D 1 - I - 0x00E587 03:A577: DE        .byte $DE   ; 
- D 1 - I - 0x00E588 03:A578: 3D        .byte $3D   ; 
- D 1 - I - 0x00E589 03:A579: C5        .byte $C5   ; 
- - - - - - 0x00E58A 03:A57A: 38        .byte $38   ; 
- - - - - - 0x00E58B 03:A57B: EF        .byte $EF   ; 
- - - - - - 0x00E58C 03:A57C: 0C        .byte $0C   ; 
- - - - - - 0x00E58D 03:A57D: 00        .byte $00   ; 
- - - - - - 0x00E58E 03:A57E: F2        .byte $F2   ; 
- - - - - - 0x00E58F 03:A57F: F3        .byte $F3   ; 
- - - - - - 0x00E590 03:A580: 0C        .byte $0C   ; 
- - - - - - 0x00E591 03:A581: 00        .byte $00   ; 
- - - - - - 0x00E592 03:A582: 39        .byte $39   ; 
- - - - - - 0x00E593 03:A583: F4        .byte $F4   ; 
- - - - - - 0x00E594 03:A584: 1C        .byte $1C   ; 
- - - - - - 0x00E595 03:A585: 00        .byte $00   ; 
- - - - - - 0x00E596 03:A586: C5        .byte $C5   ; 
- - - - - - 0x00E597 03:A587: F1        .byte $F1   ; 
- - - - - - 0x00E598 03:A588: 1D        .byte $1D   ; 
- - - - - - 0x00E599 03:A589: 00        .byte $00   ; 
- D 1 - I - 0x00E59A 03:A58A: 00        .byte $00   ; 
- D 1 - I - 0x00E59B 03:A58B: D5        .byte $D5   ; 
- D 1 - I - 0x00E59C 03:A58C: 33        .byte $33   ; 
- D 1 - I - 0x00E59D 03:A58D: 34        .byte $34   ; 
- D 1 - I - 0x00E59E 03:A58E: 00        .byte $00   ; 
- D 1 - I - 0x00E59F 03:A58F: D5        .byte $D5   ; 
- D 1 - I - 0x00E5A0 03:A590: 37        .byte $37   ; 
- D 1 - I - 0x00E5A1 03:A591: 37        .byte $37   ; 
- D 1 - I - 0x00E5A2 03:A592: 00        .byte $00   ; 
- D 1 - I - 0x00E5A3 03:A593: E2        .byte $E2   ; 
- D 1 - I - 0x00E5A4 03:A594: 3D        .byte $3D   ; 
- D 1 - I - 0x00E5A5 03:A595: 3A        .byte $3A   ; 
- D 1 - I - 0x00E5A6 03:A596: 00        .byte $00   ; 
- D 1 - I - 0x00E5A7 03:A597: E3        .byte $E3   ; 
- D 1 - I - 0x00E5A8 03:A598: E9        .byte $E9   ; 
- D 1 - I - 0x00E5A9 03:A599: C5        .byte $C5   ; 
- D 1 - I - 0x00E5AA 03:A59A: 34        .byte $34   ; 
- D 1 - I - 0x00E5AB 03:A59B: EF        .byte $EF   ; 
- D 1 - I - 0x00E5AC 03:A59C: 1D        .byte $1D   ; 
- D 1 - I - 0x00E5AD 03:A59D: 00        .byte $00   ; 
- D 1 - I - 0x00E5AE 03:A59E: 3A        .byte $3A   ; 
- D 1 - I - 0x00E5AF 03:A59F: F0        .byte $F0   ; 
- D 1 - I - 0x00E5B0 03:A5A0: 1D        .byte $1D   ; 
- D 1 - I - 0x00E5B1 03:A5A1: 00        .byte $00   ; 
- D 1 - I - 0x00E5B2 03:A5A2: 37        .byte $37   ; 
- D 1 - I - 0x00E5B3 03:A5A3: 37        .byte $37   ; 
- D 1 - I - 0x00E5B4 03:A5A4: 1D        .byte $1D   ; 
- D 1 - I - 0x00E5B5 03:A5A5: 00        .byte $00   ; 
- D 1 - I - 0x00E5B6 03:A5A6: 3A        .byte $3A   ; 
- D 1 - I - 0x00E5B7 03:A5A7: F8        .byte $F8   ; 
- D 1 - I - 0x00E5B8 03:A5A8: E5        .byte $E5   ; 
- D 1 - I - 0x00E5B9 03:A5A9: 00        .byte $00   ; 
- D 1 - I - 0x00E5BA 03:A5AA: 00        .byte $00   ; 
- D 1 - I - 0x00E5BB 03:A5AB: E3        .byte $E3   ; 
- D 1 - I - 0x00E5BC 03:A5AC: 33        .byte $33   ; 
- D 1 - I - 0x00E5BD 03:A5AD: EA        .byte $EA   ; 
- D 1 - I - 0x00E5BE 03:A5AE: 00        .byte $00   ; 
- D 1 - I - 0x00E5BF 03:A5AF: E3        .byte $E3   ; 
- D 1 - I - 0x00E5C0 03:A5B0: EB        .byte $EB   ; 
- D 1 - I - 0x00E5C1 03:A5B1: EC        .byte $EC   ; 
- D 1 - I - 0x00E5C2 03:A5B2: 00        .byte $00   ; 
- D 1 - I - 0x00E5C3 03:A5B3: E3        .byte $E3   ; 
- D 1 - I - 0x00E5C4 03:A5B4: 3C        .byte $3C   ; 
- D 1 - I - 0x00E5C5 03:A5B5: ED        .byte $ED   ; 
- D 1 - I - 0x00E5C6 03:A5B6: 00        .byte $00   ; 
- D 1 - I - 0x00E5C7 03:A5B7: E6        .byte $E6   ; 
- D 1 - I - 0x00E5C8 03:A5B8: 3D        .byte $3D   ; 
- D 1 - I - 0x00E5C9 03:A5B9: 3A        .byte $3A   ; 
- D 1 - I - 0x00E5CA 03:A5BA: 38        .byte $38   ; 
- D 1 - I - 0x00E5CB 03:A5BB: EF        .byte $EF   ; 
- D 1 - I - 0x00E5CC 03:A5BC: 28        .byte $28   ; 
- D 1 - I - 0x00E5CD 03:A5BD: 2B        .byte $2B   ; 
- D 1 - I - 0x00E5CE 03:A5BE: F2        .byte $F2   ; 
- D 1 - I - 0x00E5CF 03:A5BF: F3        .byte $F3   ; 
- D 1 - I - 0x00E5D0 03:A5C0: DE        .byte $DE   ; 
- D 1 - I - 0x00E5D1 03:A5C1: DE        .byte $DE   ; 
- D 1 - I - 0x00E5D2 03:A5C2: 39        .byte $39   ; 
- D 1 - I - 0x00E5D3 03:A5C3: F4        .byte $F4   ; 
- D 1 - I - 0x00E5D4 03:A5C4: 1C        .byte $1C   ; 
- D 1 - I - 0x00E5D5 03:A5C5: 00        .byte $00   ; 
- D 1 - I - 0x00E5D6 03:A5C6: C5        .byte $C5   ; 
- D 1 - I - 0x00E5D7 03:A5C7: F1        .byte $F1   ; 
- D 1 - I - 0x00E5D8 03:A5C8: 1D        .byte $1D   ; 
- D 1 - I - 0x00E5D9 03:A5C9: 00        .byte $00   ; 
- D 1 - I - 0x00E5DA 03:A5CA: 2B        .byte $2B   ; 
- D 1 - I - 0x00E5DB 03:A5CB: D7        .byte $D7   ; 
- D 1 - I - 0x00E5DC 03:A5CC: 33        .byte $33   ; 
- D 1 - I - 0x00E5DD 03:A5CD: 34        .byte $34   ; 
- D 1 - I - 0x00E5DE 03:A5CE: DE        .byte $DE   ; 
- D 1 - I - 0x00E5DF 03:A5CF: DF        .byte $DF   ; 
- D 1 - I - 0x00E5E0 03:A5D0: EE        .byte $EE   ; 
- D 1 - I - 0x00E5E1 03:A5D1: 43        .byte $43   ; 
- D 1 - I - 0x00E5E2 03:A5D2: 00        .byte $00   ; 
- D 1 - I - 0x00E5E3 03:A5D3: E2        .byte $E2   ; 
- D 1 - I - 0x00E5E4 03:A5D4: 3E        .byte $3E   ; 
- D 1 - I - 0x00E5E5 03:A5D5: 44        .byte $44   ; 
- D 1 - I - 0x00E5E6 03:A5D6: 00        .byte $00   ; 
- D 1 - I - 0x00E5E7 03:A5D7: E3        .byte $E3   ; 
- D 1 - I - 0x00E5E8 03:A5D8: E9        .byte $E9   ; 
- D 1 - I - 0x00E5E9 03:A5D9: C5        .byte $C5   ; 
- D 1 - I - 0x00E5EA 03:A5DA: 00        .byte $00   ; 
- D 1 - I - 0x00E5EB 03:A5DB: B0        .byte $B0   ; 
- D 1 - I - 0x00E5EC 03:A5DC: 05        .byte $05   ; 
- D 1 - I - 0x00E5ED 03:A5DD: B1        .byte $B1   ; 
- D 1 - I - 0x00E5EE 03:A5DE: 00        .byte $00   ; 
- D 1 - I - 0x00E5EF 03:A5DF: B3        .byte $B3   ; 
- D 1 - I - 0x00E5F0 03:A5E0: B4        .byte $B4   ; 
- D 1 - I - 0x00E5F1 03:A5E1: B5        .byte $B5   ; 
- D 1 - I - 0x00E5F2 03:A5E2: 00        .byte $00   ; 
- D 1 - I - 0x00E5F3 03:A5E3: 00        .byte $00   ; 
- D 1 - I - 0x00E5F4 03:A5E4: 08        .byte $08   ; 
- D 1 - I - 0x00E5F5 03:A5E5: B9        .byte $B9   ; 
- D 1 - I - 0x00E5F6 03:A5E6: 00        .byte $00   ; 
- D 1 - I - 0x00E5F7 03:A5E7: 00        .byte $00   ; 
- D 1 - I - 0x00E5F8 03:A5E8: 00        .byte $00   ; 
- D 1 - I - 0x00E5F9 03:A5E9: 00        .byte $00   ; 
- D 1 - I - 0x00E5FA 03:A5EA: 00        .byte $00   ; 
- D 1 - I - 0x00E5FB 03:A5EB: 00        .byte $00   ; 
- D 1 - I - 0x00E5FC 03:A5EC: 00        .byte $00   ; 
- D 1 - I - 0x00E5FD 03:A5ED: 00        .byte $00   ; 
- D 1 - I - 0x00E5FE 03:A5EE: 00        .byte $00   ; 
- D 1 - I - 0x00E5FF 03:A5EF: 00        .byte $00   ; 
- D 1 - I - 0x00E600 03:A5F0: FA        .byte $FA   ; 
- D 1 - I - 0x00E601 03:A5F1: F9        .byte $F9   ; 
- D 1 - I - 0x00E602 03:A5F2: 00        .byte $00   ; 
- D 1 - I - 0x00E603 03:A5F3: A5        .byte $A5   ; 
- D 1 - I - 0x00E604 03:A5F4: 1F        .byte $1F   ; 
- D 1 - I - 0x00E605 03:A5F5: 00        .byte $00   ; 
- D 1 - I - 0x00E606 03:A5F6: 00        .byte $00   ; 
- D 1 - I - 0x00E607 03:A5F7: 00        .byte $00   ; 
- D 1 - I - 0x00E608 03:A5F8: 1F        .byte $1F   ; 
- D 1 - I - 0x00E609 03:A5F9: 00        .byte $00   ; 
- D 1 - I - 0x00E60A 03:A5FA: 00        .byte $00   ; 
- D 1 - I - 0x00E60B 03:A5FB: 00        .byte $00   ; 
- D 1 - I - 0x00E60C 03:A5FC: 00        .byte $00   ; 
- D 1 - I - 0x00E60D 03:A5FD: 00        .byte $00   ; 
- D 1 - I - 0x00E60E 03:A5FE: F9        .byte $F9   ; 
- D 1 - I - 0x00E60F 03:A5FF: F9        .byte $F9   ; 
- D 1 - I - 0x00E610 03:A600: FB        .byte $FB   ; 
- D 1 - I - 0x00E611 03:A601: 00        .byte $00   ; 
- D 1 - I - 0x00E612 03:A602: 2B        .byte $2B   ; 
- D 1 - I - 0x00E613 03:A603: 2B        .byte $2B   ; 
- D 1 - I - 0x00E614 03:A604: 2B        .byte $2B   ; 
- D 1 - I - 0x00E615 03:A605: 2B        .byte $2B   ; 
- D 1 - I - 0x00E616 03:A606: DD        .byte $DD   ; 
- D 1 - I - 0x00E617 03:A607: DE        .byte $DE   ; 
- D 1 - I - 0x00E618 03:A608: DE        .byte $DE   ; 
- D 1 - I - 0x00E619 03:A609: DF        .byte $DF   ; 
- D 1 - I - 0x00E61A 03:A60A: 00        .byte $00   ; 
- D 1 - I - 0x00E61B 03:A60B: 00        .byte $00   ; 
- D 1 - I - 0x00E61C 03:A60C: 1F        .byte $1F   ; 
- D 1 - I - 0x00E61D 03:A60D: 00        .byte $00   ; 
- D 1 - I - 0x00E61E 03:A60E: 69        .byte $69   ; 
- D 1 - I - 0x00E61F 03:A60F: 00        .byte $00   ; 
- D 1 - I - 0x00E620 03:A610: 1F        .byte $1F   ; 
- D 1 - I - 0x00E621 03:A611: 00        .byte $00   ; 
- D 1 - I - 0x00E622 03:A612: 00        .byte $00   ; 
- D 1 - I - 0x00E623 03:A613: 00        .byte $00   ; 
- D 1 - I - 0x00E624 03:A614: 1F        .byte $1F   ; 
- D 1 - I - 0x00E625 03:A615: 00        .byte $00   ; 
- D 1 - I - 0x00E626 03:A616: A5        .byte $A5   ; 
- D 1 - I - 0x00E627 03:A617: 00        .byte $00   ; 
- D 1 - I - 0x00E628 03:A618: 1F        .byte $1F   ; 
- D 1 - I - 0x00E629 03:A619: 00        .byte $00   ; 
- D 1 - I - 0x00E62A 03:A61A: 00        .byte $00   ; 
- D 1 - I - 0x00E62B 03:A61B: 00        .byte $00   ; 
- D 1 - I - 0x00E62C 03:A61C: 1F        .byte $1F   ; 
- D 1 - I - 0x00E62D 03:A61D: 00        .byte $00   ; 
- D 1 - I - 0x00E62E 03:A61E: F9        .byte $F9   ; 
- D 1 - I - 0x00E62F 03:A61F: F9        .byte $F9   ; 
- D 1 - I - 0x00E630 03:A620: FD        .byte $FD   ; 
- D 1 - I - 0x00E631 03:A621: 00        .byte $00   ; 
- D 1 - I - 0x00E632 03:A622: 00        .byte $00   ; 
- D 1 - I - 0x00E633 03:A623: 00        .byte $00   ; 
- D 1 - I - 0x00E634 03:A624: 00        .byte $00   ; 
- D 1 - I - 0x00E635 03:A625: 00        .byte $00   ; 
- D 1 - I - 0x00E636 03:A626: 00        .byte $00   ; 
- D 1 - I - 0x00E637 03:A627: A5        .byte $A5   ; 
- D 1 - I - 0x00E638 03:A628: 00        .byte $00   ; 
- D 1 - I - 0x00E639 03:A629: 00        .byte $00   ; 
- D 1 - I - 0x00E63A 03:A62A: 00        .byte $00   ; 
- D 1 - I - 0x00E63B 03:A62B: 00        .byte $00   ; 
- D 1 - I - 0x00E63C 03:A62C: 1F        .byte $1F   ; 
- D 1 - I - 0x00E63D 03:A62D: 00        .byte $00   ; 
- D 1 - I - 0x00E63E 03:A62E: A5        .byte $A5   ; 
- D 1 - I - 0x00E63F 03:A62F: 00        .byte $00   ; 
- D 1 - I - 0x00E640 03:A630: FC        .byte $FC   ; 
- D 1 - I - 0x00E641 03:A631: F9        .byte $F9   ; 
- D 1 - I - 0x00E642 03:A632: 00        .byte $00   ; 
- D 1 - I - 0x00E643 03:A633: 00        .byte $00   ; 
- D 1 - I - 0x00E644 03:A634: 00        .byte $00   ; 
- D 1 - I - 0x00E645 03:A635: 00        .byte $00   ; 
- D 1 - I - 0x00E646 03:A636: 00        .byte $00   ; 
- D 1 - I - 0x00E647 03:A637: A5        .byte $A5   ; 
- D 1 - I - 0x00E648 03:A638: 00        .byte $00   ; 
- D 1 - I - 0x00E649 03:A639: 00        .byte $00   ; 
- D 1 - I - 0x00E64A 03:A63A: 00        .byte $00   ; 
- D 1 - I - 0x00E64B 03:A63B: 00        .byte $00   ; 
- D 1 - I - 0x00E64C 03:A63C: 00        .byte $00   ; 
- D 1 - I - 0x00E64D 03:A63D: 00        .byte $00   ; 
- D 1 - I - 0x00E64E 03:A63E: F9        .byte $F9   ; 
- D 1 - I - 0x00E64F 03:A63F: F9        .byte $F9   ; 
- D 1 - I - 0x00E650 03:A640: F9        .byte $F9   ; 
- D 1 - I - 0x00E651 03:A641: F9        .byte $F9   ; 
- D 1 - I - 0x00E652 03:A642: 00        .byte $00   ; 
- D 1 - I - 0x00E653 03:A643: 00        .byte $00   ; 
- D 1 - I - 0x00E654 03:A644: 00        .byte $00   ; 
- D 1 - I - 0x00E655 03:A645: 00        .byte $00   ; 
- D 1 - I - 0x00E656 03:A646: 00        .byte $00   ; 
- D 1 - I - 0x00E657 03:A647: 00        .byte $00   ; 
- D 1 - I - 0x00E658 03:A648: A5        .byte $A5   ; 
- D 1 - I - 0x00E659 03:A649: 00        .byte $00   ; 
- D 1 - I - 0x00E65A 03:A64A: 00        .byte $00   ; 
- D 1 - I - 0x00E65B 03:A64B: 00        .byte $00   ; 
- D 1 - I - 0x00E65C 03:A64C: 00        .byte $00   ; 
- D 1 - I - 0x00E65D 03:A64D: 00        .byte $00   ; 
- D 1 - I - 0x00E65E 03:A64E: F9        .byte $F9   ; 
- D 1 - I - 0x00E65F 03:A64F: F9        .byte $F9   ; 
- D 1 - I - 0x00E660 03:A650: FB        .byte $FB   ; 
- D 1 - I - 0x00E661 03:A651: 00        .byte $00   ; 
- D 1 - I - 0x00E662 03:A652: 00        .byte $00   ; 
- D 1 - I - 0x00E663 03:A653: 00        .byte $00   ; 
- D 1 - I - 0x00E664 03:A654: 1F        .byte $1F   ; 
- D 1 - I - 0x00E665 03:A655: 00        .byte $00   ; 
- D 1 - I - 0x00E666 03:A656: A5        .byte $A5   ; 
- D 1 - I - 0x00E667 03:A657: 00        .byte $00   ; 
- D 1 - I - 0x00E668 03:A658: 1F        .byte $1F   ; 
- D 1 - I - 0x00E669 03:A659: 00        .byte $00   ; 
- D 1 - I - 0x00E66A 03:A65A: 00        .byte $00   ; 
- D 1 - I - 0x00E66B 03:A65B: 00        .byte $00   ; 
- D 1 - I - 0x00E66C 03:A65C: 1F        .byte $1F   ; 
- D 1 - I - 0x00E66D 03:A65D: 00        .byte $00   ; 
- D 1 - I - 0x00E66E 03:A65E: F9        .byte $F9   ; 
- D 1 - I - 0x00E66F 03:A65F: F9        .byte $F9   ; 
- D 1 - I - 0x00E670 03:A660: 1F        .byte $1F   ; 
- D 1 - I - 0x00E671 03:A661: F9        .byte $F9   ; 
- D 1 - I - 0x00E672 03:A662: 00        .byte $00   ; 
- D 1 - I - 0x00E673 03:A663: 00        .byte $00   ; 
- D 1 - I - 0x00E674 03:A664: 1F        .byte $1F   ; 
- D 1 - I - 0x00E675 03:A665: 00        .byte $00   ; 
- D 1 - I - 0x00E676 03:A666: 00        .byte $00   ; 
- D 1 - I - 0x00E677 03:A667: 00        .byte $00   ; 
- D 1 - I - 0x00E678 03:A668: 1F        .byte $1F   ; 
- D 1 - I - 0x00E679 03:A669: 00        .byte $00   ; 
- D 1 - I - 0x00E67A 03:A66A: 2B        .byte $2B   ; 
- D 1 - I - 0x00E67B 03:A66B: 2B        .byte $2B   ; 
- D 1 - I - 0x00E67C 03:A66C: 2B        .byte $2B   ; 
- D 1 - I - 0x00E67D 03:A66D: 2B        .byte $2B   ; 
- D 1 - I - 0x00E67E 03:A66E: DD        .byte $DD   ; 
- D 1 - I - 0x00E67F 03:A66F: DE        .byte $DE   ; 
- D 1 - I - 0x00E680 03:A670: DE        .byte $DE   ; 
- D 1 - I - 0x00E681 03:A671: DF        .byte $DF   ; 
- D 1 - I - 0x00E682 03:A672: 00        .byte $00   ; 
- D 1 - I - 0x00E683 03:A673: 00        .byte $00   ; 
- D 1 - I - 0x00E684 03:A674: 1F        .byte $1F   ; 
- D 1 - I - 0x00E685 03:A675: 00        .byte $00   ; 
- D 1 - I - 0x00E686 03:A676: 00        .byte $00   ; 
- D 1 - I - 0x00E687 03:A677: 00        .byte $00   ; 
- D 1 - I - 0x00E688 03:A678: 1F        .byte $1F   ; 
- D 1 - I - 0x00E689 03:A679: 00        .byte $00   ; 
- D 1 - I - 0x00E68A 03:A67A: 17        .byte $17   ; 
- D 1 - I - 0x00E68B 03:A67B: 17        .byte $17   ; 
- D 1 - I - 0x00E68C 03:A67C: 18        .byte $18   ; 
- D 1 - I - 0x00E68D 03:A67D: 00        .byte $00   ; 
- D 1 - I - 0x00E68E 03:A67E: 10        .byte $10   ; 
- D 1 - I - 0x00E68F 03:A67F: 10        .byte $10   ; 
- D 1 - I - 0x00E690 03:A680: 11        .byte $11   ; 
- D 1 - I - 0x00E691 03:A681: 00        .byte $00   ; 
- D 1 - I - 0x00E692 03:A682: 10        .byte $10   ; 
- D 1 - I - 0x00E693 03:A683: 10        .byte $10   ; 
- D 1 - I - 0x00E694 03:A684: 11        .byte $11   ; 
- D 1 - I - 0x00E695 03:A685: 00        .byte $00   ; 
- D 1 - I - 0x00E696 03:A686: 10        .byte $10   ; 
- D 1 - I - 0x00E697 03:A687: 10        .byte $10   ; 
- D 1 - I - 0x00E698 03:A688: 11        .byte $11   ; 
- D 1 - I - 0x00E699 03:A689: 00        .byte $00   ; 
- D 1 - I - 0x00E69A 03:A68A: 00        .byte $00   ; 
- D 1 - I - 0x00E69B 03:A68B: C0        .byte $C0   ; 
- D 1 - I - 0x00E69C 03:A68C: 17        .byte $17   ; 
- D 1 - I - 0x00E69D 03:A68D: 17        .byte $17   ; 
- D 1 - I - 0x00E69E 03:A68E: 00        .byte $00   ; 
- D 1 - I - 0x00E69F 03:A68F: BF        .byte $BF   ; 
- D 1 - I - 0x00E6A0 03:A690: 10        .byte $10   ; 
- D 1 - I - 0x00E6A1 03:A691: 10        .byte $10   ; 
- D 1 - I - 0x00E6A2 03:A692: 00        .byte $00   ; 
- D 1 - I - 0x00E6A3 03:A693: BF        .byte $BF   ; 
- D 1 - I - 0x00E6A4 03:A694: 10        .byte $10   ; 
- D 1 - I - 0x00E6A5 03:A695: 10        .byte $10   ; 
- D 1 - I - 0x00E6A6 03:A696: 00        .byte $00   ; 
- D 1 - I - 0x00E6A7 03:A697: BF        .byte $BF   ; 
- D 1 - I - 0x00E6A8 03:A698: 10        .byte $10   ; 
- D 1 - I - 0x00E6A9 03:A699: 10        .byte $10   ; 
- D 1 - I - 0x00E6AA 03:A69A: 00        .byte $00   ; 
- D 1 - I - 0x00E6AB 03:A69B: 6A        .byte $6A   ; 
- D 1 - I - 0x00E6AC 03:A69C: 00        .byte $00   ; 
- D 1 - I - 0x00E6AD 03:A69D: 00        .byte $00   ; 
- D 1 - I - 0x00E6AE 03:A69E: F9        .byte $F9   ; 
- D 1 - I - 0x00E6AF 03:A69F: F9        .byte $F9   ; 
- D 1 - I - 0x00E6B0 03:A6A0: F9        .byte $F9   ; 
- D 1 - I - 0x00E6B1 03:A6A1: F9        .byte $F9   ; 
- D 1 - I - 0x00E6B2 03:A6A2: 00        .byte $00   ; 
- D 1 - I - 0x00E6B3 03:A6A3: 6A        .byte $6A   ; 
- D 1 - I - 0x00E6B4 03:A6A4: 00        .byte $00   ; 
- D 1 - I - 0x00E6B5 03:A6A5: 00        .byte $00   ; 
- D 1 - I - 0x00E6B6 03:A6A6: 00        .byte $00   ; 
- D 1 - I - 0x00E6B7 03:A6A7: 6A        .byte $6A   ; 
- D 1 - I - 0x00E6B8 03:A6A8: 00        .byte $00   ; 
- D 1 - I - 0x00E6B9 03:A6A9: 00        .byte $00   ; 
- D 1 - I - 0x00E6BA 03:A6AA: 00        .byte $00   ; 
- D 1 - I - 0x00E6BB 03:A6AB: 00        .byte $00   ; 
- D 1 - I - 0x00E6BC 03:A6AC: 00        .byte $00   ; 
- D 1 - I - 0x00E6BD 03:A6AD: A5        .byte $A5   ; 
- D 1 - I - 0x00E6BE 03:A6AE: 00        .byte $00   ; 
- D 1 - I - 0x00E6BF 03:A6AF: A5        .byte $A5   ; 
- D 1 - I - 0x00E6C0 03:A6B0: 00        .byte $00   ; 
- D 1 - I - 0x00E6C1 03:A6B1: 69        .byte $69   ; 
- D 1 - I - 0x00E6C2 03:A6B2: 00        .byte $00   ; 
- D 1 - I - 0x00E6C3 03:A6B3: 00        .byte $00   ; 
- D 1 - I - 0x00E6C4 03:A6B4: 00        .byte $00   ; 
- D 1 - I - 0x00E6C5 03:A6B5: 00        .byte $00   ; 
- D 1 - I - 0x00E6C6 03:A6B6: 00        .byte $00   ; 
- D 1 - I - 0x00E6C7 03:A6B7: 64        .byte $64   ; 
- D 1 - I - 0x00E6C8 03:A6B8: 65        .byte $65   ; 
- D 1 - I - 0x00E6C9 03:A6B9: 65        .byte $65   ; 
- D 1 - I - 0x00E6CA 03:A6BA: 00        .byte $00   ; 
- D 1 - I - 0x00E6CB 03:A6BB: 6A        .byte $6A   ; 
- D 1 - I - 0x00E6CC 03:A6BC: 00        .byte $00   ; 
- D 1 - I - 0x00E6CD 03:A6BD: 00        .byte $00   ; 
- D 1 - I - 0x00E6CE 03:A6BE: 00        .byte $00   ; 
- D 1 - I - 0x00E6CF 03:A6BF: 6A        .byte $6A   ; 
- D 1 - I - 0x00E6D0 03:A6C0: 00        .byte $00   ; 
- D 1 - I - 0x00E6D1 03:A6C1: 00        .byte $00   ; 
- D 1 - I - 0x00E6D2 03:A6C2: 00        .byte $00   ; 
- D 1 - I - 0x00E6D3 03:A6C3: 6A        .byte $6A   ; 
- D 1 - I - 0x00E6D4 03:A6C4: 00        .byte $00   ; 
- D 1 - I - 0x00E6D5 03:A6C5: 00        .byte $00   ; 
- D 1 - I - 0x00E6D6 03:A6C6: 65        .byte $65   ; 
- D 1 - I - 0x00E6D7 03:A6C7: 68        .byte $68   ; 
- D 1 - I - 0x00E6D8 03:A6C8: 00        .byte $00   ; 
- D 1 - I - 0x00E6D9 03:A6C9: 00        .byte $00   ; 
- D 1 - I - 0x00E6DA 03:A6CA: 00        .byte $00   ; 
- D 1 - I - 0x00E6DB 03:A6CB: 00        .byte $00   ; 
- D 1 - I - 0x00E6DC 03:A6CC: 00        .byte $00   ; 
- D 1 - I - 0x00E6DD 03:A6CD: 00        .byte $00   ; 
- D 1 - I - 0x00E6DE 03:A6CE: 00        .byte $00   ; 
- D 1 - I - 0x00E6DF 03:A6CF: A5        .byte $A5   ; 
- D 1 - I - 0x00E6E0 03:A6D0: 00        .byte $00   ; 
- D 1 - I - 0x00E6E1 03:A6D1: 00        .byte $00   ; 
- D 1 - I - 0x00E6E2 03:A6D2: 00        .byte $00   ; 
- D 1 - I - 0x00E6E3 03:A6D3: 00        .byte $00   ; 
- D 1 - I - 0x00E6E4 03:A6D4: 00        .byte $00   ; 
- D 1 - I - 0x00E6E5 03:A6D5: 00        .byte $00   ; 
- D 1 - I - 0x00E6E6 03:A6D6: 65        .byte $65   ; 
- D 1 - I - 0x00E6E7 03:A6D7: 66        .byte $66   ; 
- D 1 - I - 0x00E6E8 03:A6D8: 00        .byte $00   ; 
- D 1 - I - 0x00E6E9 03:A6D9: A5        .byte $A5   ; 
- D 1 - I - 0x00E6EA 03:A6DA: 00        .byte $00   ; 
- D 1 - I - 0x00E6EB 03:A6DB: 6A        .byte $6A   ; 
- D 1 - I - 0x00E6EC 03:A6DC: 00        .byte $00   ; 
- D 1 - I - 0x00E6ED 03:A6DD: 00        .byte $00   ; 
- D 1 - I - 0x00E6EE 03:A6DE: 00        .byte $00   ; 
- D 1 - I - 0x00E6EF 03:A6DF: 6A        .byte $6A   ; 
- D 1 - I - 0x00E6F0 03:A6E0: 00        .byte $00   ; 
- D 1 - I - 0x00E6F1 03:A6E1: A5        .byte $A5   ; 
- D 1 - I - 0x00E6F2 03:A6E2: 00        .byte $00   ; 
- D 1 - I - 0x00E6F3 03:A6E3: 6A        .byte $6A   ; 
- D 1 - I - 0x00E6F4 03:A6E4: 00        .byte $00   ; 
- D 1 - I - 0x00E6F5 03:A6E5: 00        .byte $00   ; 
- D 1 - I - 0x00E6F6 03:A6E6: 00        .byte $00   ; 
- D 1 - I - 0x00E6F7 03:A6E7: 67        .byte $67   ; 
- D 1 - I - 0x00E6F8 03:A6E8: 65        .byte $65   ; 
- D 1 - I - 0x00E6F9 03:A6E9: 65        .byte $65   ; 
- D 1 - I - 0x00E6FA 03:A6EA: 00        .byte $00   ; 
- D 1 - I - 0x00E6FB 03:A6EB: A5        .byte $A5   ; 
- D 1 - I - 0x00E6FC 03:A6EC: 00        .byte $00   ; 
- D 1 - I - 0x00E6FD 03:A6ED: 00        .byte $00   ; 
- D 1 - I - 0x00E6FE 03:A6EE: 00        .byte $00   ; 
- D 1 - I - 0x00E6FF 03:A6EF: 00        .byte $00   ; 
- D 1 - I - 0x00E700 03:A6F0: 00        .byte $00   ; 
- D 1 - I - 0x00E701 03:A6F1: 69        .byte $69   ; 
- D 1 - I - 0x00E702 03:A6F2: 00        .byte $00   ; 
- D 1 - I - 0x00E703 03:A6F3: 00        .byte $00   ; 
- D 1 - I - 0x00E704 03:A6F4: 00        .byte $00   ; 
- D 1 - I - 0x00E705 03:A6F5: 00        .byte $00   ; 
- D 1 - I - 0x00E706 03:A6F6: 65        .byte $65   ; 
- D 1 - I - 0x00E707 03:A6F7: 65        .byte $65   ; 
- D 1 - I - 0x00E708 03:A6F8: 65        .byte $65   ; 
- D 1 - I - 0x00E709 03:A6F9: 65        .byte $65   ; 
- D 1 - I - 0x00E70A 03:A6FA: 00        .byte $00   ; 
- D 1 - I - 0x00E70B 03:A6FB: 6A        .byte $6A   ; 
- D 1 - I - 0x00E70C 03:A6FC: 00        .byte $00   ; 
- D 1 - I - 0x00E70D 03:A6FD: A5        .byte $A5   ; 
- D 1 - I - 0x00E70E 03:A6FE: 00        .byte $00   ; 
- D 1 - I - 0x00E70F 03:A6FF: 6A        .byte $6A   ; 
- D 1 - I - 0x00E710 03:A700: 69        .byte $69   ; 
- D 1 - I - 0x00E711 03:A701: 00        .byte $00   ; 
- D 1 - I - 0x00E712 03:A702: 00        .byte $00   ; 
- D 1 - I - 0x00E713 03:A703: 6A        .byte $6A   ; 
- D 1 - I - 0x00E714 03:A704: 00        .byte $00   ; 
- D 1 - I - 0x00E715 03:A705: A5        .byte $A5   ; 
- D 1 - I - 0x00E716 03:A706: 00        .byte $00   ; 
- D 1 - I - 0x00E717 03:A707: 6A        .byte $6A   ; 
- D 1 - I - 0x00E718 03:A708: 00        .byte $00   ; 
- D 1 - I - 0x00E719 03:A709: 00        .byte $00   ; 
- D 1 - I - 0x00E71A 03:A70A: 40        .byte $40   ; 
- D 1 - I - 0x00E71B 03:A70B: 40        .byte $40   ; 
- D 1 - I - 0x00E71C 03:A70C: 29        .byte $29   ; 
- D 1 - I - 0x00E71D 03:A70D: 6E        .byte $6E   ; 
- D 1 - I - 0x00E71E 03:A70E: 6B        .byte $6B   ; 
- D 1 - I - 0x00E71F 03:A70F: 6C        .byte $6C   ; 
- D 1 - I - 0x00E720 03:A710: 70        .byte $70   ; 
- D 1 - I - 0x00E721 03:A711: 71        .byte $71   ; 
- D 1 - I - 0x00E722 03:A712: 30        .byte $30   ; 
- D 1 - I - 0x00E723 03:A713: 6D        .byte $6D   ; 
- D 1 - I - 0x00E724 03:A714: 1E        .byte $1E   ; 
- D 1 - I - 0x00E725 03:A715: 74        .byte $74   ; 
- D 1 - I - 0x00E726 03:A716: 00        .byte $00   ; 
- D 1 - I - 0x00E727 03:A717: 00        .byte $00   ; 
- D 1 - I - 0x00E728 03:A718: 00        .byte $00   ; 
- D 1 - I - 0x00E729 03:A719: 00        .byte $00   ; 
- D 1 - I - 0x00E72A 03:A71A: 2B        .byte $2B   ; 
- D 1 - I - 0x00E72B 03:A71B: 2B        .byte $2B   ; 
- D 1 - I - 0x00E72C 03:A71C: 2B        .byte $2B   ; 
- D 1 - I - 0x00E72D 03:A71D: 2B        .byte $2B   ; 
- D 1 - I - 0x00E72E 03:A71E: 72        .byte $72   ; 
- D 1 - I - 0x00E72F 03:A71F: 71        .byte $71   ; 
- D 1 - I - 0x00E730 03:A720: 72        .byte $72   ; 
- D 1 - I - 0x00E731 03:A721: 71        .byte $71   ; 
- D 1 - I - 0x00E732 03:A722: 1E        .byte $1E   ; 
- D 1 - I - 0x00E733 03:A723: 74        .byte $74   ; 
- D 1 - I - 0x00E734 03:A724: 1E        .byte $1E   ; 
- D 1 - I - 0x00E735 03:A725: 74        .byte $74   ; 
- D 1 - I - 0x00E736 03:A726: 00        .byte $00   ; 
- D 1 - I - 0x00E737 03:A727: 00        .byte $00   ; 
- D 1 - I - 0x00E738 03:A728: 00        .byte $00   ; 
- D 1 - I - 0x00E739 03:A729: 00        .byte $00   ; 
- D 1 - I - 0x00E73A 03:A72A: 2A        .byte $2A   ; 
- D 1 - I - 0x00E73B 03:A72B: 6F        .byte $6F   ; 
- D 1 - I - 0x00E73C 03:A72C: 40        .byte $40   ; 
- D 1 - I - 0x00E73D 03:A72D: 40        .byte $40   ; 
- D 1 - I - 0x00E73E 03:A72E: 72        .byte $72   ; 
- D 1 - I - 0x00E73F 03:A72F: 73        .byte $73   ; 
- D 1 - I - 0x00E740 03:A730: 6B        .byte $6B   ; 
- D 1 - I - 0x00E741 03:A731: 6C        .byte $6C   ; 
- D 1 - I - 0x00E742 03:A732: 1E        .byte $1E   ; 
- D 1 - I - 0x00E743 03:A733: 74        .byte $74   ; 
- D 1 - I - 0x00E744 03:A734: 30        .byte $30   ; 
- D 1 - I - 0x00E745 03:A735: 6D        .byte $6D   ; 
- D 1 - I - 0x00E746 03:A736: 00        .byte $00   ; 
- D 1 - I - 0x00E747 03:A737: 00        .byte $00   ; 
- D 1 - I - 0x00E748 03:A738: 00        .byte $00   ; 
- D 1 - I - 0x00E749 03:A739: 00        .byte $00   ; 
- D 1 - I - 0x00E74A 03:A73A: 33        .byte $33   ; 
- D 1 - I - 0x00E74B 03:A73B: 34        .byte $34   ; 
- D 1 - I - 0x00E74C 03:A73C: 34        .byte $34   ; 
- D 1 - I - 0x00E74D 03:A73D: 34        .byte $34   ; 
- D 1 - I - 0x00E74E 03:A73E: C4        .byte $C4   ; 
- D 1 - I - 0x00E74F 03:A73F: C5        .byte $C5   ; 
- D 1 - I - 0x00E750 03:A740: D1        .byte $D1   ; 
- D 1 - I - 0x00E751 03:A741: D1        .byte $D1   ; 
- D 1 - I - 0x00E752 03:A742: 00        .byte $00   ; 
- D 1 - I - 0x00E753 03:A743: 00        .byte $00   ; 
- D 1 - I - 0x00E754 03:A744: 01        .byte $01   ; 
- D 1 - I - 0x00E755 03:A745: A1        .byte $A1   ; 
- D 1 - I - 0x00E756 03:A746: 00        .byte $00   ; 
- D 1 - I - 0x00E757 03:A747: 00        .byte $00   ; 
- D 1 - I - 0x00E758 03:A748: 00        .byte $00   ; 
- D 1 - I - 0x00E759 03:A749: 00        .byte $00   ; 
- D 1 - I - 0x00E75A 03:A74A: 34        .byte $34   ; 
- D 1 - I - 0x00E75B 03:A74B: 34        .byte $34   ; 
- D 1 - I - 0x00E75C 03:A74C: 34        .byte $34   ; 
- D 1 - I - 0x00E75D 03:A74D: C7        .byte $C7   ; 
- D 1 - I - 0x00E75E 03:A74E: D1        .byte $D1   ; 
- D 1 - I - 0x00E75F 03:A74F: D1        .byte $D1   ; 
- D 1 - I - 0x00E760 03:A750: C5        .byte $C5   ; 
- D 1 - I - 0x00E761 03:A751: C6        .byte $C6   ; 
- D 1 - I - 0x00E762 03:A752: 20        .byte $20   ; 
- D 1 - I - 0x00E763 03:A753: A2        .byte $A2   ; 
- D 1 - I - 0x00E764 03:A754: 00        .byte $00   ; 
- D 1 - I - 0x00E765 03:A755: 00        .byte $00   ; 
- D 1 - I - 0x00E766 03:A756: 00        .byte $00   ; 
- D 1 - I - 0x00E767 03:A757: 00        .byte $00   ; 
- D 1 - I - 0x00E768 03:A758: 00        .byte $00   ; 
- D 1 - I - 0x00E769 03:A759: 00        .byte $00   ; 
- D 1 - I - 0x00E76A 03:A75A: 33        .byte $33   ; 
- D 1 - I - 0x00E76B 03:A75B: C8        .byte $C8   ; 
- D 1 - I - 0x00E76C 03:A75C: 35        .byte $35   ; 
- D 1 - I - 0x00E76D 03:A75D: 34        .byte $34   ; 
- D 1 - I - 0x00E76E 03:A75E: C4        .byte $C4   ; 
- D 1 - I - 0x00E76F 03:A75F: C9        .byte $C9   ; 
- D 1 - I - 0x00E770 03:A760: CA        .byte $CA   ; 
- D 1 - I - 0x00E771 03:A761: C5        .byte $C5   ; 
- D 1 - I - 0x00E772 03:A762: 00        .byte $00   ; 
- D 1 - I - 0x00E773 03:A763: 00        .byte $00   ; 
- D 1 - I - 0x00E774 03:A764: 00        .byte $00   ; 
- D 1 - I - 0x00E775 03:A765: 00        .byte $00   ; 
- D 1 - I - 0x00E776 03:A766: 00        .byte $00   ; 
- D 1 - I - 0x00E777 03:A767: 00        .byte $00   ; 
- D 1 - I - 0x00E778 03:A768: 00        .byte $00   ; 
- D 1 - I - 0x00E779 03:A769: 00        .byte $00   ; 
- D 1 - I - 0x00E77A 03:A76A: 34        .byte $34   ; 
- D 1 - I - 0x00E77B 03:A76B: CB        .byte $CB   ; 
- D 1 - I - 0x00E77C 03:A76C: 36        .byte $36   ; 
- D 1 - I - 0x00E77D 03:A76D: CE        .byte $CE   ; 
- D 1 - I - 0x00E77E 03:A76E: C5        .byte $C5   ; 
- D 1 - I - 0x00E77F 03:A76F: CC        .byte $CC   ; 
- D 1 - I - 0x00E780 03:A770: CD        .byte $CD   ; 
- D 1 - I - 0x00E781 03:A771: CF        .byte $CF   ; 
- D 1 - I - 0x00E782 03:A772: 00        .byte $00   ; 
- D 1 - I - 0x00E783 03:A773: 00        .byte $00   ; 
- D 1 - I - 0x00E784 03:A774: 00        .byte $00   ; 
- D 1 - I - 0x00E785 03:A775: 00        .byte $00   ; 
- D 1 - I - 0x00E786 03:A776: 00        .byte $00   ; 
- D 1 - I - 0x00E787 03:A777: 00        .byte $00   ; 
- D 1 - I - 0x00E788 03:A778: 00        .byte $00   ; 
- D 1 - I - 0x00E789 03:A779: 00        .byte $00   ; 
- D 1 - I - 0x00E78A 03:A77A: 34        .byte $34   ; 
- D 1 - I - 0x00E78B 03:A77B: 34        .byte $34   ; 
- D 1 - I - 0x00E78C 03:A77C: 34        .byte $34   ; 
- D 1 - I - 0x00E78D 03:A77D: C7        .byte $C7   ; 
- D 1 - I - 0x00E78E 03:A77E: D2        .byte $D2   ; 
- D 1 - I - 0x00E78F 03:A77F: C5        .byte $C5   ; 
- D 1 - I - 0x00E790 03:A780: D2        .byte $D2   ; 
- D 1 - I - 0x00E791 03:A781: C6        .byte $C6   ; 
- D 1 - I - 0x00E792 03:A782: 00        .byte $00   ; 
- D 1 - I - 0x00E793 03:A783: 00        .byte $00   ; 
- D 1 - I - 0x00E794 03:A784: 00        .byte $00   ; 
- D 1 - I - 0x00E795 03:A785: 00        .byte $00   ; 
- D 1 - I - 0x00E796 03:A786: 00        .byte $00   ; 
- D 1 - I - 0x00E797 03:A787: 00        .byte $00   ; 
- D 1 - I - 0x00E798 03:A788: 00        .byte $00   ; 
- D 1 - I - 0x00E799 03:A789: 00        .byte $00   ; 
- D 1 - I - 0x00E79A 03:A78A: 32        .byte $32   ; 
- D 1 - I - 0x00E79B 03:A78B: FE        .byte $FE   ; 
- D 1 - I - 0x00E79C 03:A78C: 32        .byte $32   ; 
- D 1 - I - 0x00E79D 03:A78D: 32        .byte $32   ; 
- D 1 - I - 0x00E79E 03:A78E: DA        .byte $DA   ; 
- D 1 - I - 0x00E79F 03:A78F: DB        .byte $DB   ; 
- D 1 - I - 0x00E7A0 03:A790: DC        .byte $DC   ; 
- D 1 - I - 0x00E7A1 03:A791: DC        .byte $DC   ; 
- D 1 - I - 0x00E7A2 03:A792: 33        .byte $33   ; 
- D 1 - I - 0x00E7A3 03:A793: E0        .byte $E0   ; 
- D 1 - I - 0x00E7A4 03:A794: 34        .byte $34   ; 
- D 1 - I - 0x00E7A5 03:A795: E0        .byte $E0   ; 
- D 1 - I - 0x00E7A6 03:A796: C4        .byte $C4   ; 
- D 1 - I - 0x00E7A7 03:A797: C5        .byte $C5   ; 
- D 1 - I - 0x00E7A8 03:A798: C5        .byte $C5   ; 
- D 1 - I - 0x00E7A9 03:A799: C5        .byte $C5   ; 
- D 1 - I - 0x00E7AA 03:A79A: 32        .byte $32   ; 
- D 1 - I - 0x00E7AB 03:A79B: 32        .byte $32   ; 
- D 1 - I - 0x00E7AC 03:A79C: 32        .byte $32   ; 
- D 1 - I - 0x00E7AD 03:A79D: 32        .byte $32   ; 
- D 1 - I - 0x00E7AE 03:A79E: DC        .byte $DC   ; 
- D 1 - I - 0x00E7AF 03:A79F: DC        .byte $DC   ; 
- D 1 - I - 0x00E7B0 03:A7A0: DC        .byte $DC   ; 
- D 1 - I - 0x00E7B1 03:A7A1: DC        .byte $DC   ; 
- D 1 - I - 0x00E7B2 03:A7A2: 34        .byte $34   ; 
- D 1 - I - 0x00E7B3 03:A7A3: CB        .byte $CB   ; 
- D 1 - I - 0x00E7B4 03:A7A4: 36        .byte $36   ; 
- D 1 - I - 0x00E7B5 03:A7A5: CE        .byte $CE   ; 
- D 1 - I - 0x00E7B6 03:A7A6: C5        .byte $C5   ; 
- D 1 - I - 0x00E7B7 03:A7A7: CC        .byte $CC   ; 
- D 1 - I - 0x00E7B8 03:A7A8: CD        .byte $CD   ; 
- D 1 - I - 0x00E7B9 03:A7A9: CF        .byte $CF   ; 
- D 1 - I - 0x00E7BA 03:A7AA: 32        .byte $32   ; 
- D 1 - I - 0x00E7BB 03:A7AB: FE        .byte $FE   ; 
- D 1 - I - 0x00E7BC 03:A7AC: 32        .byte $32   ; 
- D 1 - I - 0x00E7BD 03:A7AD: 32        .byte $32   ; 
- D 1 - I - 0x00E7BE 03:A7AE: DA        .byte $DA   ; 
- D 1 - I - 0x00E7BF 03:A7AF: DB        .byte $DB   ; 
- D 1 - I - 0x00E7C0 03:A7B0: DC        .byte $DC   ; 
- D 1 - I - 0x00E7C1 03:A7B1: DC        .byte $DC   ; 
- D 1 - I - 0x00E7C2 03:A7B2: 33        .byte $33   ; 
- D 1 - I - 0x00E7C3 03:A7B3: D0        .byte $D0   ; 
- D 1 - I - 0x00E7C4 03:A7B4: 34        .byte $34   ; 
- D 1 - I - 0x00E7C5 03:A7B5: D0        .byte $D0   ; 
- D 1 - I - 0x00E7C6 03:A7B6: C4        .byte $C4   ; 
- D 1 - I - 0x00E7C7 03:A7B7: C5        .byte $C5   ; 
- D 1 - I - 0x00E7C8 03:A7B8: C5        .byte $C5   ; 
- D 1 - I - 0x00E7C9 03:A7B9: C5        .byte $C5   ; 
- D 1 - I - 0x00E7CA 03:A7BA: 32        .byte $32   ; 
- D 1 - I - 0x00E7CB 03:A7BB: 32        .byte $32   ; 
- D 1 - I - 0x00E7CC 03:A7BC: 32        .byte $32   ; 
- D 1 - I - 0x00E7CD 03:A7BD: 32        .byte $32   ; 
- D 1 - I - 0x00E7CE 03:A7BE: DC        .byte $DC   ; 
- D 1 - I - 0x00E7CF 03:A7BF: DC        .byte $DC   ; 
- D 1 - I - 0x00E7D0 03:A7C0: DC        .byte $DC   ; 
- D 1 - I - 0x00E7D1 03:A7C1: DC        .byte $DC   ; 
- D 1 - I - 0x00E7D2 03:A7C2: 33        .byte $33   ; 
- D 1 - I - 0x00E7D3 03:A7C3: C8        .byte $C8   ; 
- D 1 - I - 0x00E7D4 03:A7C4: 35        .byte $35   ; 
- D 1 - I - 0x00E7D5 03:A7C5: C7        .byte $C7   ; 
- D 1 - I - 0x00E7D6 03:A7C6: C4        .byte $C4   ; 
- D 1 - I - 0x00E7D7 03:A7C7: C9        .byte $C9   ; 
- D 1 - I - 0x00E7D8 03:A7C8: CA        .byte $CA   ; 
- D 1 - I - 0x00E7D9 03:A7C9: C6        .byte $C6   ; 
- D 1 - I - 0x00E7DA 03:A7CA: 00        .byte $00   ; 
- D 1 - I - 0x00E7DB 03:A7CB: 00        .byte $00   ; 
- D 1 - I - 0x00E7DC 03:A7CC: 00        .byte $00   ; 
- D 1 - I - 0x00E7DD 03:A7CD: 00        .byte $00   ; 
- D 1 - I - 0x00E7DE 03:A7CE: 00        .byte $00   ; 
- D 1 - I - 0x00E7DF 03:A7CF: 00        .byte $00   ; 
- D 1 - I - 0x00E7E0 03:A7D0: C1        .byte $C1   ; 
- D 1 - I - 0x00E7E1 03:A7D1: C2        .byte $C2   ; 
- D 1 - I - 0x00E7E2 03:A7D2: 00        .byte $00   ; 
- D 1 - I - 0x00E7E3 03:A7D3: A7        .byte $A7   ; 
- D 1 - I - 0x00E7E4 03:A7D4: 02        .byte $02   ; 
- D 1 - I - 0x00E7E5 03:A7D5: A8        .byte $A8   ; 
- D 1 - I - 0x00E7E6 03:A7D6: 00        .byte $00   ; 
- D 1 - I - 0x00E7E7 03:A7D7: AA        .byte $AA   ; 
- D 1 - I - 0x00E7E8 03:A7D8: AB        .byte $AB   ; 
- D 1 - I - 0x00E7E9 03:A7D9: AC        .byte $AC   ; 
- D 1 - I - 0x00E7EA 03:A7DA: 00        .byte $00   ; 
- D 1 - I - 0x00E7EB 03:A7DB: 00        .byte $00   ; 
- D 1 - I - 0x00E7EC 03:A7DC: 00        .byte $00   ; 
- D 1 - I - 0x00E7ED 03:A7DD: 00        .byte $00   ; 
- D 1 - I - 0x00E7EE 03:A7DE: C3        .byte $C3   ; 
- D 1 - I - 0x00E7EF 03:A7DF: A6        .byte $A6   ; 
- D 1 - I - 0x00E7F0 03:A7E0: 00        .byte $00   ; 
- D 1 - I - 0x00E7F1 03:A7E1: 00        .byte $00   ; 
- D 1 - I - 0x00E7F2 03:A7E2: 03        .byte $03   ; 
- D 1 - I - 0x00E7F3 03:A7E3: A9        .byte $A9   ; 
- D 1 - I - 0x00E7F4 03:A7E4: 04        .byte $04   ; 
- D 1 - I - 0x00E7F5 03:A7E5: 00        .byte $00   ; 
- D 1 - I - 0x00E7F6 03:A7E6: AD        .byte $AD   ; 
- D 1 - I - 0x00E7F7 03:A7E7: AE        .byte $AE   ; 
- D 1 - I - 0x00E7F8 03:A7E8: AF        .byte $AF   ; 
- D 1 - I - 0x00E7F9 03:A7E9: 00        .byte $00   ; 
- D 1 - I - 0x00E7FA 03:A7EA: 3A        .byte $3A   ; 
- D 1 - I - 0x00E7FB 03:A7EB: F0        .byte $F0   ; 
- D 1 - I - 0x00E7FC 03:A7EC: 0C        .byte $0C   ; 
- D 1 - I - 0x00E7FD 03:A7ED: 00        .byte $00   ; 
- D 1 - I - 0x00E7FE 03:A7EE: F5        .byte $F5   ; 
- D 1 - I - 0x00E7FF 03:A7EF: F6        .byte $F6   ; 
- D 1 - I - 0x00E800 03:A7F0: 0C        .byte $0C   ; 
- D 1 - I - 0x00E801 03:A7F1: 00        .byte $00   ; 
- D 1 - I - 0x00E802 03:A7F2: 3B        .byte $3B   ; 
- D 1 - I - 0x00E803 03:A7F3: F7        .byte $F7   ; 
- D 1 - I - 0x00E804 03:A7F4: 0C        .byte $0C   ; 
- D 1 - I - 0x00E805 03:A7F5: 00        .byte $00   ; 
- D 1 - I - 0x00E806 03:A7F6: C5        .byte $C5   ; 
- D 1 - I - 0x00E807 03:A7F7: F1        .byte $F1   ; 
- D 1 - I - 0x00E808 03:A7F8: 1C        .byte $1C   ; 
- D 1 - I - 0x00E809 03:A7F9: 00        .byte $00   ; 
- D 1 - I - 0x00E80A 03:A7FA: 00        .byte $00   ; 
- D 1 - I - 0x00E80B 03:A7FB: D5        .byte $D5   ; 
- D 1 - I - 0x00E80C 03:A7FC: 3D        .byte $3D   ; 
- D 1 - I - 0x00E80D 03:A7FD: 3A        .byte $3A   ; 
- D 1 - I - 0x00E80E 03:A7FE: 00        .byte $00   ; 
- D 1 - I - 0x00E80F 03:A7FF: D5        .byte $D5   ; 
- D 1 - I - 0x00E810 03:A800: EE        .byte $EE   ; 
- D 1 - I - 0x00E811 03:A801: 43        .byte $43   ; 
- D 1 - I - 0x00E812 03:A802: 00        .byte $00   ; 
- D 1 - I - 0x00E813 03:A803: D5        .byte $D5   ; 
- D 1 - I - 0x00E814 03:A804: 3E        .byte $3E   ; 
- D 1 - I - 0x00E815 03:A805: 44        .byte $44   ; 
- D 1 - I - 0x00E816 03:A806: 00        .byte $00   ; 
- D 1 - I - 0x00E817 03:A807: E2        .byte $E2   ; 
- D 1 - I - 0x00E818 03:A808: E9        .byte $E9   ; 
- D 1 - I - 0x00E819 03:A809: C5        .byte $C5   ; 
- D 1 - I - 0x00E81A 03:A80A: 3A        .byte $3A   ; 
- D 1 - I - 0x00E81B 03:A80B: F8        .byte $F8   ; 
- D 1 - I - 0x00E81C 03:A80C: 0C        .byte $0C   ; 
- D 1 - I - 0x00E81D 03:A80D: 00        .byte $00   ; 
- D 1 - I - 0x00E81E 03:A80E: C5        .byte $C5   ; 
- D 1 - I - 0x00E81F 03:A80F: F1        .byte $F1   ; 
- D 1 - I - 0x00E820 03:A810: 1C        .byte $1C   ; 
- D 1 - I - 0x00E821 03:A811: 00        .byte $00   ; 
- - - - - - 0x00E822 03:A812: 00        .byte $00   ; 
- - - - - - 0x00E823 03:A813: 00        .byte $00   ; 
- - - - - - 0x00E824 03:A814: 00        .byte $00   ; 
- - - - - - 0x00E825 03:A815: 00        .byte $00   ; 
- - - - - - 0x00E826 03:A816: 00        .byte $00   ; 
- - - - - - 0x00E827 03:A817: 00        .byte $00   ; 
- - - - - - 0x00E828 03:A818: 00        .byte $00   ; 
- - - - - - 0x00E829 03:A819: 00        .byte $00   ; 
- D 1 - I - 0x00E82A 03:A81A: 00        .byte $00   ; 
- D 1 - I - 0x00E82B 03:A81B: 0A        .byte $0A   ; 
- D 1 - I - 0x00E82C 03:A81C: 0A        .byte $0A   ; 
- D 1 - I - 0x00E82D 03:A81D: 0A        .byte $0A   ; 
- D 1 - I - 0x00E82E 03:A81E: 00        .byte $00   ; 
- D 1 - I - 0x00E82F 03:A81F: 0B        .byte $0B   ; 
- D 1 - I - 0x00E830 03:A820: 0B        .byte $0B   ; 
- D 1 - I - 0x00E831 03:A821: 0B        .byte $0B   ; 
- D 1 - I - 0x00E832 03:A822: 00        .byte $00   ; 
- D 1 - I - 0x00E833 03:A823: 0B        .byte $0B   ; 
- D 1 - I - 0x00E834 03:A824: 0B        .byte $0B   ; 
- D 1 - I - 0x00E835 03:A825: 0B        .byte $0B   ; 
- D 1 - I - 0x00E836 03:A826: 00        .byte $00   ; 
- D 1 - I - 0x00E837 03:A827: 0B        .byte $0B   ; 
- D 1 - I - 0x00E838 03:A828: 0B        .byte $0B   ; 
- D 1 - I - 0x00E839 03:A829: 0B        .byte $0B   ; 
- D 1 - I - 0x00E83A 03:A82A: 00        .byte $00   ; 
- D 1 - I - 0x00E83B 03:A82B: 0B        .byte $0B   ; 
- D 1 - I - 0x00E83C 03:A82C: 0B        .byte $0B   ; 
- D 1 - I - 0x00E83D 03:A82D: 0B        .byte $0B   ; 
- D 1 - I - 0x00E83E 03:A82E: 00        .byte $00   ; 
- D 1 - I - 0x00E83F 03:A82F: BB        .byte $BB   ; 
- D 1 - I - 0x00E840 03:A830: BB        .byte $BB   ; 
- D 1 - I - 0x00E841 03:A831: BB        .byte $BB   ; 
- D 1 - I - 0x00E842 03:A832: 00        .byte $00   ; 
- D 1 - I - 0x00E843 03:A833: 00        .byte $00   ; 
- D 1 - I - 0x00E844 03:A834: 00        .byte $00   ; 
- D 1 - I - 0x00E845 03:A835: 00        .byte $00   ; 
- D 1 - I - 0x00E846 03:A836: 00        .byte $00   ; 
- D 1 - I - 0x00E847 03:A837: 00        .byte $00   ; 
- D 1 - I - 0x00E848 03:A838: 00        .byte $00   ; 
- D 1 - I - 0x00E849 03:A839: 00        .byte $00   ; 
- D 1 - I - 0x00E84A 03:A83A: 34        .byte $34   ; 
- D 1 - I - 0x00E84B 03:A83B: CB        .byte $CB   ; 
- D 1 - I - 0x00E84C 03:A83C: 36        .byte $36   ; 
- D 1 - I - 0x00E84D 03:A83D: 34        .byte $34   ; 
- D 1 - I - 0x00E84E 03:A83E: C5        .byte $C5   ; 
- D 1 - I - 0x00E84F 03:A83F: CC        .byte $CC   ; 
- D 1 - I - 0x00E850 03:A840: CD        .byte $CD   ; 
- D 1 - I - 0x00E851 03:A841: C5        .byte $C5   ; 
- D 1 - I - 0x00E852 03:A842: 00        .byte $00   ; 
- D 1 - I - 0x00E853 03:A843: 00        .byte $00   ; 
- D 1 - I - 0x00E854 03:A844: 00        .byte $00   ; 
- D 1 - I - 0x00E855 03:A845: 00        .byte $00   ; 
- D 1 - I - 0x00E856 03:A846: 00        .byte $00   ; 
- D 1 - I - 0x00E857 03:A847: 00        .byte $00   ; 
- D 1 - I - 0x00E858 03:A848: 00        .byte $00   ; 
- D 1 - I - 0x00E859 03:A849: 00        .byte $00   ; 
- D 1 - I - 0x00E85A 03:A84A: 34        .byte $34   ; 
- D 1 - I - 0x00E85B 03:A84B: C7        .byte $C7   ; 
- D 1 - I - 0x00E85C 03:A84C: 0C        .byte $0C   ; 
- D 1 - I - 0x00E85D 03:A84D: 00        .byte $00   ; 
- D 1 - I - 0x00E85E 03:A84E: C5        .byte $C5   ; 
- D 1 - I - 0x00E85F 03:A84F: C6        .byte $C6   ; 
- D 1 - I - 0x00E860 03:A850: D8        .byte $D8   ; 
- D 1 - I - 0x00E861 03:A851: 00        .byte $00   ; 
- D 1 - I - 0x00E862 03:A852: 00        .byte $00   ; 
- D 1 - I - 0x00E863 03:A853: 00        .byte $00   ; 
- D 1 - I - 0x00E864 03:A854: 00        .byte $00   ; 
- D 1 - I - 0x00E865 03:A855: 00        .byte $00   ; 
- D 1 - I - 0x00E866 03:A856: 00        .byte $00   ; 
- D 1 - I - 0x00E867 03:A857: 00        .byte $00   ; 
- D 1 - I - 0x00E868 03:A858: 00        .byte $00   ; 
- D 1 - I - 0x00E869 03:A859: 00        .byte $00   ; 
- D 1 - I - 0x00E86A 03:A85A: 32        .byte $32   ; 
- D 1 - I - 0x00E86B 03:A85B: 32        .byte $32   ; 
- D 1 - I - 0x00E86C 03:A85C: 32        .byte $32   ; 
- D 1 - I - 0x00E86D 03:A85D: 32        .byte $32   ; 
- D 1 - I - 0x00E86E 03:A85E: DC        .byte $DC   ; 
- D 1 - I - 0x00E86F 03:A85F: DC        .byte $DC   ; 
- D 1 - I - 0x00E870 03:A860: DC        .byte $DC   ; 
- D 1 - I - 0x00E871 03:A861: DC        .byte $DC   ; 
- D 1 - I - 0x00E872 03:A862: 33        .byte $33   ; 
- D 1 - I - 0x00E873 03:A863: D0        .byte $D0   ; 
- D 1 - I - 0x00E874 03:A864: 34        .byte $34   ; 
- D 1 - I - 0x00E875 03:A865: D0        .byte $D0   ; 
- D 1 - I - 0x00E876 03:A866: C4        .byte $C4   ; 
- D 1 - I - 0x00E877 03:A867: C5        .byte $C5   ; 
- D 1 - I - 0x00E878 03:A868: C5        .byte $C5   ; 
- D 1 - I - 0x00E879 03:A869: C5        .byte $C5   ; 
- D 1 - I - 0x00E87A 03:A86A: 00        .byte $00   ; 
- D 1 - I - 0x00E87B 03:A86B: 00        .byte $00   ; 
- D 1 - I - 0x00E87C 03:A86C: 00        .byte $00   ; 
- D 1 - I - 0x00E87D 03:A86D: 00        .byte $00   ; 
- D 1 - I - 0x00E87E 03:A86E: 00        .byte $00   ; 
- D 1 - I - 0x00E87F 03:A86F: 00        .byte $00   ; 
- D 1 - I - 0x00E880 03:A870: 00        .byte $00   ; 
- D 1 - I - 0x00E881 03:A871: 00        .byte $00   ; 
- D 1 - I - 0x00E882 03:A872: 32        .byte $32   ; 
- D 1 - I - 0x00E883 03:A873: FE        .byte $FE   ; 
- D 1 - I - 0x00E884 03:A874: 32        .byte $32   ; 
- D 1 - I - 0x00E885 03:A875: 32        .byte $32   ; 
- D 1 - I - 0x00E886 03:A876: DA        .byte $DA   ; 
- D 1 - I - 0x00E887 03:A877: DC        .byte $DC   ; 
- D 1 - I - 0x00E888 03:A878: DC        .byte $DC   ; 
- D 1 - I - 0x00E889 03:A879: DC        .byte $DC   ; 
- D 1 - I - 0x00E88A 03:A87A: 41        .byte $41   ; 
- D 1 - I - 0x00E88B 03:A87B: 41        .byte $41   ; 
- D 1 - I - 0x00E88C 03:A87C: 41        .byte $41   ; 
- D 1 - I - 0x00E88D 03:A87D: 63        .byte $63   ; 
- D 1 - I - 0x00E88E 03:A87E: 54        .byte $54   ; 
- D 1 - I - 0x00E88F 03:A87F: 22        .byte $22   ; 
- D 1 - I - 0x00E890 03:A880: 22        .byte $22   ; 
- D 1 - I - 0x00E891 03:A881: 55        .byte $55   ; 
- D 1 - I - 0x00E892 03:A882: 42        .byte $42   ; 
- D 1 - I - 0x00E893 03:A883: 48        .byte $48   ; 
- D 1 - I - 0x00E894 03:A884: 43        .byte $43   ; 
- D 1 - I - 0x00E895 03:A885: 56        .byte $56   ; 
- D 1 - I - 0x00E896 03:A886: 42        .byte $42   ; 
- D 1 - I - 0x00E897 03:A887: 57        .byte $57   ; 
- D 1 - I - 0x00E898 03:A888: 44        .byte $44   ; 
- D 1 - I - 0x00E899 03:A889: 56        .byte $56   ; 
- D 1 - I - 0x00E89A 03:A88A: 42        .byte $42   ; 
- D 1 - I - 0x00E89B 03:A88B: 3A        .byte $3A   ; 
- D 1 - I - 0x00E89C 03:A88C: 3A        .byte $3A   ; 
- D 1 - I - 0x00E89D 03:A88D: 58        .byte $58   ; 
- D 1 - I - 0x00E89E 03:A88E: 42        .byte $42   ; 
- D 1 - I - 0x00E89F 03:A88F: 48        .byte $48   ; 
- D 1 - I - 0x00E8A0 03:A890: 43        .byte $43   ; 
- D 1 - I - 0x00E8A1 03:A891: 59        .byte $59   ; 
- D 1 - I - 0x00E8A2 03:A892: 42        .byte $42   ; 
- D 1 - I - 0x00E8A3 03:A893: 57        .byte $57   ; 
- D 1 - I - 0x00E8A4 03:A894: 44        .byte $44   ; 
- D 1 - I - 0x00E8A5 03:A895: 3A        .byte $3A   ; 
- D 1 - I - 0x00E8A6 03:A896: 42        .byte $42   ; 
- D 1 - I - 0x00E8A7 03:A897: 3A        .byte $3A   ; 
- D 1 - I - 0x00E8A8 03:A898: 3A        .byte $3A   ; 
- D 1 - I - 0x00E8A9 03:A899: 3A        .byte $3A   ; 
- D 1 - I - 0x00E8AA 03:A89A: 41        .byte $41   ; 
- D 1 - I - 0x00E8AB 03:A89B: 41        .byte $41   ; 
- D 1 - I - 0x00E8AC 03:A89C: 41        .byte $41   ; 
- D 1 - I - 0x00E8AD 03:A89D: 63        .byte $63   ; 
- D 1 - I - 0x00E8AE 03:A89E: 34        .byte $34   ; 
- D 1 - I - 0x00E8AF 03:A89F: 5A        .byte $5A   ; 
- D 1 - I - 0x00E8B0 03:A8A0: 34        .byte $34   ; 
- D 1 - I - 0x00E8B1 03:A8A1: 55        .byte $55   ; 
- D 1 - I - 0x00E8B2 03:A8A2: 45        .byte $45   ; 
- D 1 - I - 0x00E8B3 03:A8A3: EC        .byte $EC   ; 
- D 1 - I - 0x00E8B4 03:A8A4: 3A        .byte $3A   ; 
- D 1 - I - 0x00E8B5 03:A8A5: 56        .byte $56   ; 
- D 1 - I - 0x00E8B6 03:A8A6: 5B        .byte $5B   ; 
- D 1 - I - 0x00E8B7 03:A8A7: ED        .byte $ED   ; 
- D 1 - I - 0x00E8B8 03:A8A8: 3A        .byte $3A   ; 
- D 1 - I - 0x00E8B9 03:A8A9: 56        .byte $56   ; 
- D 1 - I - 0x00E8BA 03:A8AA: 42        .byte $42   ; 
- D 1 - I - 0x00E8BB 03:A8AB: 48        .byte $48   ; 
- D 1 - I - 0x00E8BC 03:A8AC: 43        .byte $43   ; 
- D 1 - I - 0x00E8BD 03:A8AD: 5C        .byte $5C   ; 
- D 1 - I - 0x00E8BE 03:A8AE: 42        .byte $42   ; 
- D 1 - I - 0x00E8BF 03:A8AF: 57        .byte $57   ; 
- D 1 - I - 0x00E8C0 03:A8B0: 44        .byte $44   ; 
- D 1 - I - 0x00E8C1 03:A8B1: 5E        .byte $5E   ; 
- D 1 - I - 0x00E8C2 03:A8B2: 47        .byte $47   ; 
- D 1 - I - 0x00E8C3 03:A8B3: 46        .byte $46   ; 
- D 1 - I - 0x00E8C4 03:A8B4: 46        .byte $46   ; 
- D 1 - I - 0x00E8C5 03:A8B5: 5F        .byte $5F   ; 
- D 1 - I - 0x00E8C6 03:A8B6: 42        .byte $42   ; 
- D 1 - I - 0x00E8C7 03:A8B7: 3A        .byte $3A   ; 
- D 1 - I - 0x00E8C8 03:A8B8: 3A        .byte $3A   ; 
- D 1 - I - 0x00E8C9 03:A8B9: 3A        .byte $3A   ; 
- - - - - - 0x00E8CA 03:A8BA: 00        .byte $00   ; 
- - - - - - 0x00E8CB 03:A8BB: 00        .byte $00   ; 
- - - - - - 0x00E8CC 03:A8BC: 00        .byte $00   ; 
- - - - - - 0x00E8CD 03:A8BD: 00        .byte $00   ; 
- - - - - - 0x00E8CE 03:A8BE: 00        .byte $00   ; 
- - - - - - 0x00E8CF 03:A8BF: 00        .byte $00   ; 
- - - - - - 0x00E8D0 03:A8C0: 00        .byte $00   ; 
- - - - - - 0x00E8D1 03:A8C1: 00        .byte $00   ; 
- D 1 - I - 0x00E8D2 03:A8C2: 34        .byte $34   ; 
- D 1 - I - 0x00E8D3 03:A8C3: 34        .byte $34   ; 
- D 1 - I - 0x00E8D4 03:A8C4: 34        .byte $34   ; 
- D 1 - I - 0x00E8D5 03:A8C5: C8        .byte $C8   ; 
- D 1 - I - 0x00E8D6 03:A8C6: D1        .byte $D1   ; 
- D 1 - I - 0x00E8D7 03:A8C7: D1        .byte $D1   ; 
- D 1 - I - 0x00E8D8 03:A8C8: D1        .byte $D1   ; 
- D 1 - I - 0x00E8D9 03:A8C9: C9        .byte $C9   ; 
- - - - - - 0x00E8DA 03:A8CA: 00        .byte $00   ; 
- - - - - - 0x00E8DB 03:A8CB: 00        .byte $00   ; 
- - - - - - 0x00E8DC 03:A8CC: 00        .byte $00   ; 
- - - - - - 0x00E8DD 03:A8CD: 00        .byte $00   ; 
- - - - - - 0x00E8DE 03:A8CE: 00        .byte $00   ; 
- - - - - - 0x00E8DF 03:A8CF: 00        .byte $00   ; 
- - - - - - 0x00E8E0 03:A8D0: 00        .byte $00   ; 
- - - - - - 0x00E8E1 03:A8D1: 00        .byte $00   ; 
- D 1 - I - 0x00E8E2 03:A8D2: 35        .byte $35   ; 
- D 1 - I - 0x00E8E3 03:A8D3: C7        .byte $C7   ; 
- D 1 - I - 0x00E8E4 03:A8D4: 33        .byte $33   ; 
- D 1 - I - 0x00E8E5 03:A8D5: CB        .byte $CB   ; 
- D 1 - I - 0x00E8E6 03:A8D6: CA        .byte $CA   ; 
- D 1 - I - 0x00E8E7 03:A8D7: C6        .byte $C6   ; 
- D 1 - I - 0x00E8E8 03:A8D8: C4        .byte $C4   ; 
- D 1 - I - 0x00E8E9 03:A8D9: CC        .byte $CC   ; 
- - - - - - 0x00E8EA 03:A8DA: 00        .byte $00   ; 
- - - - - - 0x00E8EB 03:A8DB: 00        .byte $00   ; 
- - - - - - 0x00E8EC 03:A8DC: 00        .byte $00   ; 
- - - - - - 0x00E8ED 03:A8DD: 00        .byte $00   ; 
- - - - - - 0x00E8EE 03:A8DE: 00        .byte $00   ; 
- - - - - - 0x00E8EF 03:A8DF: 00        .byte $00   ; 
- - - - - - 0x00E8F0 03:A8E0: 00        .byte $00   ; 
- - - - - - 0x00E8F1 03:A8E1: 00        .byte $00   ; 
- D 1 - I - 0x00E8F2 03:A8E2: 36        .byte $36   ; 
- D 1 - I - 0x00E8F3 03:A8E3: CE        .byte $CE   ; 
- D 1 - I - 0x00E8F4 03:A8E4: 33        .byte $33   ; 
- D 1 - I - 0x00E8F5 03:A8E5: 34        .byte $34   ; 
- D 1 - I - 0x00E8F6 03:A8E6: CD        .byte $CD   ; 
- D 1 - I - 0x00E8F7 03:A8E7: CF        .byte $CF   ; 
- D 1 - I - 0x00E8F8 03:A8E8: C4        .byte $C4   ; 
- D 1 - I - 0x00E8F9 03:A8E9: D1        .byte $D1   ; 
- - - - - - 0x00E8FA 03:A8EA: 00        .byte $00   ; 
- - - - - - 0x00E8FB 03:A8EB: 00        .byte $00   ; 
- - - - - - 0x00E8FC 03:A8EC: 00        .byte $00   ; 
- - - - - - 0x00E8FD 03:A8ED: 00        .byte $00   ; 
- - - - - - 0x00E8FE 03:A8EE: 00        .byte $00   ; 
- - - - - - 0x00E8FF 03:A8EF: 00        .byte $00   ; 
- - - - - - 0x00E900 03:A8F0: 00        .byte $00   ; 
- - - - - - 0x00E901 03:A8F1: 00        .byte $00   ; 
- D 1 - I - 0x00E902 03:A8F2: 34        .byte $34   ; 
- D 1 - I - 0x00E903 03:A8F3: 34        .byte $34   ; 
- D 1 - I - 0x00E904 03:A8F4: 34        .byte $34   ; 
- D 1 - I - 0x00E905 03:A8F5: 34        .byte $34   ; 
- D 1 - I - 0x00E906 03:A8F6: D1        .byte $D1   ; 
- D 1 - I - 0x00E907 03:A8F7: C5        .byte $C5   ; 
- D 1 - I - 0x00E908 03:A8F8: C5        .byte $C5   ; 
- D 1 - I - 0x00E909 03:A8F9: C5        .byte $C5   ; 
- D 1 - I - 0x00E90A 03:A8FA: 25        .byte $25   ; 
- D 1 - I - 0x00E90B 03:A8FB: 25        .byte $25   ; 
- D 1 - I - 0x00E90C 03:A8FC: 3C        .byte $3C   ; 
- D 1 - I - 0x00E90D 03:A8FD: ED        .byte $ED   ; 
- D 1 - I - 0x00E90E 03:A8FE: 25        .byte $25   ; 
- D 1 - I - 0x00E90F 03:A8FF: 25        .byte $25   ; 
- D 1 - I - 0x00E910 03:A900: 3D        .byte $3D   ; 
- D 1 - I - 0x00E911 03:A901: 3A        .byte $3A   ; 
- D 1 - I - 0x00E912 03:A902: 25        .byte $25   ; 
- D 1 - I - 0x00E913 03:A903: 25        .byte $25   ; 
- D 1 - I - 0x00E914 03:A904: 3F        .byte $3F   ; 
- D 1 - I - 0x00E915 03:A905: 3A        .byte $3A   ; 
- D 1 - I - 0x00E916 03:A906: 25        .byte $25   ; 
- D 1 - I - 0x00E917 03:A907: 25        .byte $25   ; 
- D 1 - I - 0x00E918 03:A908: C4        .byte $C4   ; 
- D 1 - I - 0x00E919 03:A909: C5        .byte $C5   ; 
- D 1 - I - 0x00E91A 03:A90A: 24        .byte $24   ; 
- D 1 - I - 0x00E91B 03:A90B: 24        .byte $24   ; 
- D 1 - I - 0x00E91C 03:A90C: 33        .byte $33   ; 
- D 1 - I - 0x00E91D 03:A90D: 34        .byte $34   ; 
- D 1 - I - 0x00E91E 03:A90E: 25        .byte $25   ; 
- D 1 - I - 0x00E91F 03:A90F: 25        .byte $25   ; 
- D 1 - I - 0x00E920 03:A910: 37        .byte $37   ; 
- D 1 - I - 0x00E921 03:A911: 37        .byte $37   ; 
- D 1 - I - 0x00E922 03:A912: 25        .byte $25   ; 
- D 1 - I - 0x00E923 03:A913: 25        .byte $25   ; 
- D 1 - I - 0x00E924 03:A914: 3D        .byte $3D   ; 
- D 1 - I - 0x00E925 03:A915: 3A        .byte $3A   ; 
- D 1 - I - 0x00E926 03:A916: 25        .byte $25   ; 
- D 1 - I - 0x00E927 03:A917: 25        .byte $25   ; 
- D 1 - I - 0x00E928 03:A918: 3D        .byte $3D   ; 
- D 1 - I - 0x00E929 03:A919: 3A        .byte $3A   ; 
- D 1 - I - 0x00E92A 03:A91A: 25        .byte $25   ; 
- D 1 - I - 0x00E92B 03:A91B: 25        .byte $25   ; 
- D 1 - I - 0x00E92C 03:A91C: 3F        .byte $3F   ; 
- D 1 - I - 0x00E92D 03:A91D: 3A        .byte $3A   ; 
- D 1 - I - 0x00E92E 03:A91E: 4C        .byte $4C   ; 
- D 1 - I - 0x00E92F 03:A91F: 4D        .byte $4D   ; 
- D 1 - I - 0x00E930 03:A920: C4        .byte $C4   ; 
- D 1 - I - 0x00E931 03:A921: C5        .byte $C5   ; 
- D 1 - I - 0x00E932 03:A922: 26        .byte $26   ; 
- D 1 - I - 0x00E933 03:A923: 4E        .byte $4E   ; 
- D 1 - I - 0x00E934 03:A924: 21        .byte $21   ; 
- D 1 - I - 0x00E935 03:A925: 34        .byte $34   ; 
- D 1 - I - 0x00E936 03:A926: 26        .byte $26   ; 
- D 1 - I - 0x00E937 03:A927: 4E        .byte $4E   ; 
- D 1 - I - 0x00E938 03:A928: 3D        .byte $3D   ; 
- D 1 - I - 0x00E939 03:A929: 3A        .byte $3A   ; 
- D 1 - I - 0x00E93A 03:A92A: 26        .byte $26   ; 
- D 1 - I - 0x00E93B 03:A92B: 4E        .byte $4E   ; 
- D 1 - I - 0x00E93C 03:A92C: 23        .byte $23   ; 
- D 1 - I - 0x00E93D 03:A92D: 3A        .byte $3A   ; 
- D 1 - I - 0x00E93E 03:A92E: 26        .byte $26   ; 
- D 1 - I - 0x00E93F 03:A92F: 4E        .byte $4E   ; 
- D 1 - I - 0x00E940 03:A930: 3D        .byte $3D   ; 
- D 1 - I - 0x00E941 03:A931: 3A        .byte $3A   ; 
- D 1 - I - 0x00E942 03:A932: 26        .byte $26   ; 
- D 1 - I - 0x00E943 03:A933: 4E        .byte $4E   ; 
- D 1 - I - 0x00E944 03:A934: 23        .byte $23   ; 
- D 1 - I - 0x00E945 03:A935: 3A        .byte $3A   ; 
- D 1 - I - 0x00E946 03:A936: 26        .byte $26   ; 
- D 1 - I - 0x00E947 03:A937: 4E        .byte $4E   ; 
- D 1 - I - 0x00E948 03:A938: 3F        .byte $3F   ; 
- D 1 - I - 0x00E949 03:A939: 3A        .byte $3A   ; 
- D 1 - I - 0x00E94A 03:A93A: 2D        .byte $2D   ; 
- D 1 - I - 0x00E94B 03:A93B: 32        .byte $32   ; 
- D 1 - I - 0x00E94C 03:A93C: 32        .byte $32   ; 
- D 1 - I - 0x00E94D 03:A93D: 32        .byte $32   ; 
- D 1 - I - 0x00E94E 03:A93E: 50        .byte $50   ; 
- D 1 - I - 0x00E94F 03:A93F: FF        .byte $FF   ; 
- D 1 - I - 0x00E950 03:A940: DC        .byte $DC   ; 
- D 1 - I - 0x00E951 03:A941: DC        .byte $DC   ; 
- D 1 - I - 0x00E952 03:A942: 2E        .byte $2E   ; 
- D 1 - I - 0x00E953 03:A943: 25        .byte $25   ; 
- D 1 - I - 0x00E954 03:A944: 34        .byte $34   ; 
- D 1 - I - 0x00E955 03:A945: D0        .byte $D0   ; 
- D 1 - I - 0x00E956 03:A946: 00        .byte $00   ; 
- D 1 - I - 0x00E957 03:A947: 25        .byte $25   ; 
- D 1 - I - 0x00E958 03:A948: 3A        .byte $3A   ; 
- D 1 - I - 0x00E959 03:A949: 3A        .byte $3A   ; 
- D 1 - I - 0x00E95A 03:A94A: 32        .byte $32   ; 
- D 1 - I - 0x00E95B 03:A94B: 32        .byte $32   ; 
- D 1 - I - 0x00E95C 03:A94C: 32        .byte $32   ; 
- D 1 - I - 0x00E95D 03:A94D: 32        .byte $32   ; 
- D 1 - I - 0x00E95E 03:A94E: DC        .byte $DC   ; 
- D 1 - I - 0x00E95F 03:A94F: DC        .byte $DC   ; 
- D 1 - I - 0x00E960 03:A950: DC        .byte $DC   ; 
- D 1 - I - 0x00E961 03:A951: DC        .byte $DC   ; 
- D 1 - I - 0x00E962 03:A952: 34        .byte $34   ; 
- D 1 - I - 0x00E963 03:A953: D0        .byte $D0   ; 
- D 1 - I - 0x00E964 03:A954: 34        .byte $34   ; 
- D 1 - I - 0x00E965 03:A955: D0        .byte $D0   ; 
- D 1 - I - 0x00E966 03:A956: 3A        .byte $3A   ; 
- D 1 - I - 0x00E967 03:A957: 3A        .byte $3A   ; 
- D 1 - I - 0x00E968 03:A958: 3A        .byte $3A   ; 
- D 1 - I - 0x00E969 03:A959: 3A        .byte $3A   ; 
- D 1 - I - 0x00E96A 03:A95A: 32        .byte $32   ; 
- D 1 - I - 0x00E96B 03:A95B: 32        .byte $32   ; 
- D 1 - I - 0x00E96C 03:A95C: 32        .byte $32   ; 
- D 1 - I - 0x00E96D 03:A95D: 32        .byte $32   ; 
- D 1 - I - 0x00E96E 03:A95E: DC        .byte $DC   ; 
- D 1 - I - 0x00E96F 03:A95F: DC        .byte $DC   ; 
- D 1 - I - 0x00E970 03:A960: DC        .byte $DC   ; 
- D 1 - I - 0x00E971 03:A961: DC        .byte $DC   ; 
- D 1 - I - 0x00E972 03:A962: 34        .byte $34   ; 
- D 1 - I - 0x00E973 03:A963: D0        .byte $D0   ; 
- D 1 - I - 0x00E974 03:A964: 34        .byte $34   ; 
- D 1 - I - 0x00E975 03:A965: 34        .byte $34   ; 
- D 1 - I - 0x00E976 03:A966: 3A        .byte $3A   ; 
- D 1 - I - 0x00E977 03:A967: 3A        .byte $3A   ; 
- D 1 - I - 0x00E978 03:A968: 37        .byte $37   ; 
- D 1 - I - 0x00E979 03:A969: 37        .byte $37   ; 
- D 1 - I - 0x00E97A 03:A96A: 2F        .byte $2F   ; 
- D 1 - I - 0x00E97B 03:A96B: 4E        .byte $4E   ; 
- D 1 - I - 0x00E97C 03:A96C: 3D        .byte $3D   ; 
- D 1 - I - 0x00E97D 03:A96D: 3A        .byte $3A   ; 
- D 1 - I - 0x00E97E 03:A96E: DC        .byte $DC   ; 
- D 1 - I - 0x00E97F 03:A96F: 4F        .byte $4F   ; 
- D 1 - I - 0x00E980 03:A970: C4        .byte $C4   ; 
- D 1 - I - 0x00E981 03:A971: C5        .byte $C5   ; 
- D 1 - I - 0x00E982 03:A972: 34        .byte $34   ; 
- D 1 - I - 0x00E983 03:A973: 34        .byte $34   ; 
- D 1 - I - 0x00E984 03:A974: 34        .byte $34   ; 
- D 1 - I - 0x00E985 03:A975: 34        .byte $34   ; 
- D 1 - I - 0x00E986 03:A976: 37        .byte $37   ; 
- D 1 - I - 0x00E987 03:A977: 37        .byte $37   ; 
- D 1 - I - 0x00E988 03:A978: 37        .byte $37   ; 
- D 1 - I - 0x00E989 03:A979: 37        .byte $37   ; 
- D 1 - I - 0x00E98A 03:A97A: 33        .byte $33   ; 
- D 1 - I - 0x00E98B 03:A97B: 34        .byte $34   ; 
- D 1 - I - 0x00E98C 03:A97C: 34        .byte $34   ; 
- D 1 - I - 0x00E98D 03:A97D: 34        .byte $34   ; 
- D 1 - I - 0x00E98E 03:A97E: C4        .byte $C4   ; 
- D 1 - I - 0x00E98F 03:A97F: C5        .byte $C5   ; 
- D 1 - I - 0x00E990 03:A980: C5        .byte $C5   ; 
- D 1 - I - 0x00E991 03:A981: C5        .byte $C5   ; 
- - - - - - 0x00E992 03:A982: 00        .byte $00   ; 
- - - - - - 0x00E993 03:A983: 00        .byte $00   ; 
- - - - - - 0x00E994 03:A984: 00        .byte $00   ; 
- - - - - - 0x00E995 03:A985: 00        .byte $00   ; 
- - - - - - 0x00E996 03:A986: 00        .byte $00   ; 
- - - - - - 0x00E997 03:A987: 00        .byte $00   ; 
- - - - - - 0x00E998 03:A988: 00        .byte $00   ; 
- - - - - - 0x00E999 03:A989: 00        .byte $00   ; 
- D 1 - I - 0x00E99A 03:A98A: 34        .byte $34   ; 
- D 1 - I - 0x00E99B 03:A98B: CB        .byte $CB   ; 
- D 1 - I - 0x00E99C 03:A98C: 36        .byte $36   ; 
- D 1 - I - 0x00E99D 03:A98D: CE        .byte $CE   ; 
- D 1 - I - 0x00E99E 03:A98E: C5        .byte $C5   ; 
- D 1 - I - 0x00E99F 03:A98F: CC        .byte $CC   ; 
- D 1 - I - 0x00E9A0 03:A990: CD        .byte $CD   ; 
- D 1 - I - 0x00E9A1 03:A991: CF        .byte $CF   ; 
- - - - - - 0x00E9A2 03:A992: 00        .byte $00   ; 
- - - - - - 0x00E9A3 03:A993: 00        .byte $00   ; 
- - - - - - 0x00E9A4 03:A994: 00        .byte $00   ; 
- - - - - - 0x00E9A5 03:A995: 00        .byte $00   ; 
- - - - - - 0x00E9A6 03:A996: 00        .byte $00   ; 
- - - - - - 0x00E9A7 03:A997: 00        .byte $00   ; 
- - - - - - 0x00E9A8 03:A998: 00        .byte $00   ; 
- - - - - - 0x00E9A9 03:A999: 00        .byte $00   ; 
- D 1 - I - 0x00E9AA 03:A99A: 3A        .byte $3A   ; 
- D 1 - I - 0x00E9AB 03:A99B: 3A        .byte $3A   ; 
- D 1 - I - 0x00E9AC 03:A99C: 33        .byte $33   ; 
- D 1 - I - 0x00E9AD 03:A99D: 34        .byte $34   ; 
- D 1 - I - 0x00E9AE 03:A99E: 3A        .byte $3A   ; 
- D 1 - I - 0x00E9AF 03:A99F: 3A        .byte $3A   ; 
- D 1 - I - 0x00E9B0 03:A9A0: C4        .byte $C4   ; 
- D 1 - I - 0x00E9B1 03:A9A1: D1        .byte $D1   ; 
- - - - - - 0x00E9B2 03:A9A2: 00        .byte $00   ; 
- - - - - - 0x00E9B3 03:A9A3: 00        .byte $00   ; 
- - - - - - 0x00E9B4 03:A9A4: 00        .byte $00   ; 
- - - - - - 0x00E9B5 03:A9A5: 00        .byte $00   ; 
- - - - - - 0x00E9B6 03:A9A6: 00        .byte $00   ; 
- - - - - - 0x00E9B7 03:A9A7: 00        .byte $00   ; 
- - - - - - 0x00E9B8 03:A9A8: 00        .byte $00   ; 
- - - - - - 0x00E9B9 03:A9A9: 00        .byte $00   ; 
- D 1 - I - 0x00E9BA 03:A9AA: 26        .byte $26   ; 
- D 1 - I - 0x00E9BB 03:A9AB: 4E        .byte $4E   ; 
- D 1 - I - 0x00E9BC 03:A9AC: 23        .byte $23   ; 
- D 1 - I - 0x00E9BD 03:A9AD: 3A        .byte $3A   ; 
- D 1 - I - 0x00E9BE 03:A9AE: 26        .byte $26   ; 
- D 1 - I - 0x00E9BF 03:A9AF: 4E        .byte $4E   ; 
- D 1 - I - 0x00E9C0 03:A9B0: 3F        .byte $3F   ; 
- D 1 - I - 0x00E9C1 03:A9B1: 3A        .byte $3A   ; 
- D 1 - I - 0x00E9C2 03:A9B2: 26        .byte $26   ; 
- D 1 - I - 0x00E9C3 03:A9B3: 4E        .byte $4E   ; 
- D 1 - I - 0x00E9C4 03:A9B4: 23        .byte $23   ; 
- D 1 - I - 0x00E9C5 03:A9B5: 3A        .byte $3A   ; 
- D 1 - I - 0x00E9C6 03:A9B6: 26        .byte $26   ; 
- D 1 - I - 0x00E9C7 03:A9B7: 4E        .byte $4E   ; 
- D 1 - I - 0x00E9C8 03:A9B8: 3F        .byte $3F   ; 
- D 1 - I - 0x00E9C9 03:A9B9: 3A        .byte $3A   ; 
- D 1 - I - 0x00E9CA 03:A9BA: 00        .byte $00   ; 
- D 1 - I - 0x00E9CB 03:A9BB: 00        .byte $00   ; 
- D 1 - I - 0x00E9CC 03:A9BC: 00        .byte $00   ; 
- D 1 - I - 0x00E9CD 03:A9BD: 00        .byte $00   ; 
- D 1 - I - 0x00E9CE 03:A9BE: 1A        .byte $1A   ; 
- D 1 - I - 0x00E9CF 03:A9BF: 1A        .byte $1A   ; 
- D 1 - I - 0x00E9D0 03:A9C0: 1A        .byte $1A   ; 
- D 1 - I - 0x00E9D1 03:A9C1: 1A        .byte $1A   ; 
- - - - - - 0x00E9D2 03:A9C2: 00        .byte $00   ; 
- - - - - - 0x00E9D3 03:A9C3: 00        .byte $00   ; 
- - - - - - 0x00E9D4 03:A9C4: 00        .byte $00   ; 
- - - - - - 0x00E9D5 03:A9C5: 00        .byte $00   ; 
- - - - - - 0x00E9D6 03:A9C6: 00        .byte $00   ; 
- - - - - - 0x00E9D7 03:A9C7: 00        .byte $00   ; 
- - - - - - 0x00E9D8 03:A9C8: 00        .byte $00   ; 
- - - - - - 0x00E9D9 03:A9C9: 00        .byte $00   ; 
- D 1 - I - 0x00E9DA 03:A9CA: 00        .byte $00   ; 
- D 1 - I - 0x00E9DB 03:A9CB: 4B        .byte $4B   ; 
- D 1 - I - 0x00E9DC 03:A9CC: 33        .byte $33   ; 
- D 1 - I - 0x00E9DD 03:A9CD: EA        .byte $EA   ; 
- D 1 - I - 0x00E9DE 03:A9CE: E1        .byte $E1   ; 
- D 1 - I - 0x00E9DF 03:A9CF: 25        .byte $25   ; 
- D 1 - I - 0x00E9E0 03:A9D0: EB        .byte $EB   ; 
- D 1 - I - 0x00E9E1 03:A9D1: EC        .byte $EC   ; 
- - - - - - 0x00E9E2 03:A9D2: 00        .byte $00   ; 
- - - - - - 0x00E9E3 03:A9D3: 00        .byte $00   ; 
- - - - - - 0x00E9E4 03:A9D4: 00        .byte $00   ; 
- - - - - - 0x00E9E5 03:A9D5: 00        .byte $00   ; 
- - - - - - 0x00E9E6 03:A9D6: 00        .byte $00   ; 
- - - - - - 0x00E9E7 03:A9D7: 00        .byte $00   ; 
- - - - - - 0x00E9E8 03:A9D8: 00        .byte $00   ; 
- - - - - - 0x00E9E9 03:A9D9: 00        .byte $00   ; 
- D 1 - I - 0x00E9EA 03:A9DA: 00        .byte $00   ; 
- D 1 - I - 0x00E9EB 03:A9DB: FB        .byte $FB   ; 
- D 1 - I - 0x00E9EC 03:A9DC: 00        .byte $00   ; 
- D 1 - I - 0x00E9ED 03:A9DD: FB        .byte $FB   ; 
- D 1 - I - 0x00E9EE 03:A9DE: 00        .byte $00   ; 
- D 1 - I - 0x00E9EF 03:A9DF: FD        .byte $FD   ; 
- D 1 - I - 0x00E9F0 03:A9E0: 00        .byte $00   ; 
- D 1 - I - 0x00E9F1 03:A9E1: FD        .byte $FD   ; 
- D 1 - I - 0x00E9F2 03:A9E2: 00        .byte $00   ; 
- D 1 - I - 0x00E9F3 03:A9E3: 00        .byte $00   ; 
- D 1 - I - 0x00E9F4 03:A9E4: 00        .byte $00   ; 
- D 1 - I - 0x00E9F5 03:A9E5: 00        .byte $00   ; 
- D 1 - I - 0x00E9F6 03:A9E6: 00        .byte $00   ; 
- D 1 - I - 0x00E9F7 03:A9E7: 00        .byte $00   ; 
- D 1 - I - 0x00E9F8 03:A9E8: 00        .byte $00   ; 
- D 1 - I - 0x00E9F9 03:A9E9: 00        .byte $00   ; 
- D 1 - I - 0x00E9FA 03:A9EA: 00        .byte $00   ; 
- D 1 - I - 0x00E9FB 03:A9EB: 00        .byte $00   ; 
- D 1 - I - 0x00E9FC 03:A9EC: 00        .byte $00   ; 
- D 1 - I - 0x00E9FD 03:A9ED: 00        .byte $00   ; 
- D 1 - I - 0x00E9FE 03:A9EE: FF        .byte $FF   ; 
- D 1 - I - 0x00E9FF 03:A9EF: FF        .byte $FF   ; 
- D 1 - I - 0x00EA00 03:A9F0: D3        .byte $D3   ; 
- D 1 - I - 0x00EA01 03:A9F1: D4        .byte $D4   ; 
- - - - - - 0x00EA02 03:A9F2: 00        .byte $00   ; 
- - - - - - 0x00EA03 03:A9F3: 00        .byte $00   ; 
- - - - - - 0x00EA04 03:A9F4: 00        .byte $00   ; 
- - - - - - 0x00EA05 03:A9F5: 00        .byte $00   ; 
- - - - - - 0x00EA06 03:A9F6: 00        .byte $00   ; 
- - - - - - 0x00EA07 03:A9F7: 00        .byte $00   ; 
- - - - - - 0x00EA08 03:A9F8: 00        .byte $00   ; 
- - - - - - 0x00EA09 03:A9F9: 00        .byte $00   ; 
- D 1 - I - 0x00EA0A 03:A9FA: 00        .byte $00   ; 
- D 1 - I - 0x00EA0B 03:A9FB: 00        .byte $00   ; 
- D 1 - I - 0x00EA0C 03:A9FC: 00        .byte $00   ; 
- D 1 - I - 0x00EA0D 03:A9FD: 00        .byte $00   ; 
- D 1 - I - 0x00EA0E 03:A9FE: D5        .byte $D5   ; 
- D 1 - I - 0x00EA0F 03:A9FF: FF        .byte $FF   ; 
- D 1 - I - 0x00EA10 03:AA00: FF        .byte $FF   ; 
- D 1 - I - 0x00EA11 03:AA01: FF        .byte $FF   ; 
- - - - - - 0x00EA12 03:AA02: 00        .byte $00   ; 
- - - - - - 0x00EA13 03:AA03: 00        .byte $00   ; 
- - - - - - 0x00EA14 03:AA04: 00        .byte $00   ; 
- - - - - - 0x00EA15 03:AA05: 00        .byte $00   ; 
- - - - - - 0x00EA16 03:AA06: 00        .byte $00   ; 
- - - - - - 0x00EA17 03:AA07: 00        .byte $00   ; 
- - - - - - 0x00EA18 03:AA08: 00        .byte $00   ; 
- - - - - - 0x00EA19 03:AA09: 00        .byte $00   ; 
- D 1 - I - 0x00EA1A 03:AA0A: 00        .byte $00   ; 
- D 1 - I - 0x00EA1B 03:AA0B: 00        .byte $00   ; 
- D 1 - I - 0x00EA1C 03:AA0C: 00        .byte $00   ; 
- D 1 - I - 0x00EA1D 03:AA0D: 00        .byte $00   ; 
- D 1 - I - 0x00EA1E 03:AA0E: 00        .byte $00   ; 
- D 1 - I - 0x00EA1F 03:AA0F: 00        .byte $00   ; 
- D 1 - I - 0x00EA20 03:AA10: 00        .byte $00   ; 
- D 1 - I - 0x00EA21 03:AA11: 00        .byte $00   ; 
- D 1 - I - 0x00EA22 03:AA12: 00        .byte $00   ; 
- D 1 - I - 0x00EA23 03:AA13: 00        .byte $00   ; 
- D 1 - I - 0x00EA24 03:AA14: E4        .byte $E4   ; 
- D 1 - I - 0x00EA25 03:AA15: E5        .byte $E5   ; 
- D 1 - I - 0x00EA26 03:AA16: 00        .byte $00   ; 
- D 1 - I - 0x00EA27 03:AA17: 00        .byte $00   ; 
- D 1 - I - 0x00EA28 03:AA18: F1        .byte $F1   ; 
- D 1 - I - 0x00EA29 03:AA19: F2        .byte $F2   ; 
- D 1 - I - 0x00EA2A 03:AA1A: 00        .byte $00   ; 
- D 1 - I - 0x00EA2B 03:AA1B: 00        .byte $00   ; 
- D 1 - I - 0x00EA2C 03:AA1C: 00        .byte $00   ; 
- D 1 - I - 0x00EA2D 03:AA1D: 00        .byte $00   ; 
- D 1 - I - 0x00EA2E 03:AA1E: 00        .byte $00   ; 
- D 1 - I - 0x00EA2F 03:AA1F: DD        .byte $DD   ; 
- D 1 - I - 0x00EA30 03:AA20: DE        .byte $DE   ; 
- D 1 - I - 0x00EA31 03:AA21: DE        .byte $DE   ; 
- D 1 - I - 0x00EA32 03:AA22: E6        .byte $E6   ; 
- D 1 - I - 0x00EA33 03:AA23: E7        .byte $E7   ; 
- D 1 - I - 0x00EA34 03:AA24: EF        .byte $EF   ; 
- D 1 - I - 0x00EA35 03:AA25: F0        .byte $F0   ; 
- D 1 - I - 0x00EA36 03:AA26: F3        .byte $F3   ; 
- D 1 - I - 0x00EA37 03:AA27: F4        .byte $F4   ; 
- D 1 - I - 0x00EA38 03:AA28: F9        .byte $F9   ; 
- D 1 - I - 0x00EA39 03:AA29: FA        .byte $FA   ; 
- D 1 - I - 0x00EA3A 03:AA2A: D6        .byte $D6   ; 
- D 1 - I - 0x00EA3B 03:AA2B: D7        .byte $D7   ; 
- D 1 - I - 0x00EA3C 03:AA2C: D8        .byte $D8   ; 
- D 1 - I - 0x00EA3D 03:AA2D: D9        .byte $D9   ; 
- D 1 - I - 0x00EA3E 03:AA2E: DE        .byte $DE   ; 
- D 1 - I - 0x00EA3F 03:AA2F: DE        .byte $DE   ; 
- D 1 - I - 0x00EA40 03:AA30: DF        .byte $DF   ; 
- D 1 - I - 0x00EA41 03:AA31: E0        .byte $E0   ; 
- D 1 - I - 0x00EA42 03:AA32: F0        .byte $F0   ; 
- D 1 - I - 0x00EA43 03:AA33: F0        .byte $F0   ; 
- D 1 - I - 0x00EA44 03:AA34: E8        .byte $E8   ; 
- D 1 - I - 0x00EA45 03:AA35: E9        .byte $E9   ; 
- D 1 - I - 0x00EA46 03:AA36: F9        .byte $F9   ; 
- D 1 - I - 0x00EA47 03:AA37: FA        .byte $FA   ; 
- D 1 - I - 0x00EA48 03:AA38: F9        .byte $F9   ; 
- D 1 - I - 0x00EA49 03:AA39: FA        .byte $FA   ; 
- D 1 - I - 0x00EA4A 03:AA3A: DA        .byte $DA   ; 
- D 1 - I - 0x00EA4B 03:AA3B: DB        .byte $DB   ; 
- D 1 - I - 0x00EA4C 03:AA3C: DC        .byte $DC   ; 
- D 1 - I - 0x00EA4D 03:AA3D: 00        .byte $00   ; 
- D 1 - I - 0x00EA4E 03:AA3E: E1        .byte $E1   ; 
- D 1 - I - 0x00EA4F 03:AA3F: E2        .byte $E2   ; 
- D 1 - I - 0x00EA50 03:AA40: DE        .byte $DE   ; 
- D 1 - I - 0x00EA51 03:AA41: DE        .byte $DE   ; 
- D 1 - I - 0x00EA52 03:AA42: EA        .byte $EA   ; 
- D 1 - I - 0x00EA53 03:AA43: F0        .byte $F0   ; 
- D 1 - I - 0x00EA54 03:AA44: F0        .byte $F0   ; 
- D 1 - I - 0x00EA55 03:AA45: F0        .byte $F0   ; 
- D 1 - I - 0x00EA56 03:AA46: F9        .byte $F9   ; 
- D 1 - I - 0x00EA57 03:AA47: FA        .byte $FA   ; 
- D 1 - I - 0x00EA58 03:AA48: F9        .byte $F9   ; 
- D 1 - I - 0x00EA59 03:AA49: FA        .byte $FA   ; 
- D 1 - I - 0x00EA5A 03:AA4A: 00        .byte $00   ; 
- D 1 - I - 0x00EA5B 03:AA4B: 00        .byte $00   ; 
- D 1 - I - 0x00EA5C 03:AA4C: 00        .byte $00   ; 
- D 1 - I - 0x00EA5D 03:AA4D: 00        .byte $00   ; 
- D 1 - I - 0x00EA5E 03:AA4E: DE        .byte $DE   ; 
- D 1 - I - 0x00EA5F 03:AA4F: E3        .byte $E3   ; 
- D 1 - I - 0x00EA60 03:AA50: 00        .byte $00   ; 
- D 1 - I - 0x00EA61 03:AA51: 00        .byte $00   ; 
- D 1 - I - 0x00EA62 03:AA52: EF        .byte $EF   ; 
- D 1 - I - 0x00EA63 03:AA53: EB        .byte $EB   ; 
- D 1 - I - 0x00EA64 03:AA54: EC        .byte $EC   ; 
- D 1 - I - 0x00EA65 03:AA55: ED        .byte $ED   ; 
- D 1 - I - 0x00EA66 03:AA56: F9        .byte $F9   ; 
- D 1 - I - 0x00EA67 03:AA57: F5        .byte $F5   ; 
- D 1 - I - 0x00EA68 03:AA58: F6        .byte $F6   ; 
- D 1 - I - 0x00EA69 03:AA59: F7        .byte $F7   ; 
- D 1 - I - 0x00EA6A 03:AA5A: 00        .byte $00   ; 
- D 1 - I - 0x00EA6B 03:AA5B: 00        .byte $00   ; 
- D 1 - I - 0x00EA6C 03:AA5C: 00        .byte $00   ; 
- D 1 - I - 0x00EA6D 03:AA5D: 00        .byte $00   ; 
- D 1 - I - 0x00EA6E 03:AA5E: 00        .byte $00   ; 
- D 1 - I - 0x00EA6F 03:AA5F: 00        .byte $00   ; 
- D 1 - I - 0x00EA70 03:AA60: 00        .byte $00   ; 
- D 1 - I - 0x00EA71 03:AA61: 00        .byte $00   ; 
- D 1 - I - 0x00EA72 03:AA62: EE        .byte $EE   ; 
- D 1 - I - 0x00EA73 03:AA63: 00        .byte $00   ; 
- D 1 - I - 0x00EA74 03:AA64: 00        .byte $00   ; 
- D 1 - I - 0x00EA75 03:AA65: 00        .byte $00   ; 
- D 1 - I - 0x00EA76 03:AA66: F8        .byte $F8   ; 
- D 1 - I - 0x00EA77 03:AA67: 00        .byte $00   ; 
- D 1 - I - 0x00EA78 03:AA68: 00        .byte $00   ; 
- D 1 - I - 0x00EA79 03:AA69: 00        .byte $00   ; 
- D 1 - I - 0x00EA7A 03:AA6A: 00        .byte $00   ; 
- D 1 - I - 0x00EA7B 03:AA6B: 00        .byte $00   ; 
- D 1 - I - 0x00EA7C 03:AA6C: 00        .byte $00   ; 
- D 1 - I - 0x00EA7D 03:AA6D: FB        .byte $FB   ; 
- D 1 - I - 0x00EA7E 03:AA6E: 00        .byte $00   ; 
- D 1 - I - 0x00EA7F 03:AA6F: 00        .byte $00   ; 
- D 1 - I - 0x00EA80 03:AA70: 00        .byte $00   ; 
- D 1 - I - 0x00EA81 03:AA71: FD        .byte $FD   ; 
- D 1 - I - 0x00EA82 03:AA72: 00        .byte $00   ; 
- D 1 - I - 0x00EA83 03:AA73: 00        .byte $00   ; 
- D 1 - I - 0x00EA84 03:AA74: 00        .byte $00   ; 
- D 1 - I - 0x00EA85 03:AA75: 00        .byte $00   ; 
- D 1 - I - 0x00EA86 03:AA76: 00        .byte $00   ; 
- D 1 - I - 0x00EA87 03:AA77: 00        .byte $00   ; 
- D 1 - I - 0x00EA88 03:AA78: 00        .byte $00   ; 
- D 1 - I - 0x00EA89 03:AA79: 00        .byte $00   ; 
- D 1 - I - 0x00EA8A 03:AA7A: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA8B 03:AA7B: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA8C 03:AA7C: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA8D 03:AA7D: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA8E 03:AA7E: C5        .byte $C5   ; 
- D 1 - I - 0x00EA8F 03:AA7F: C5        .byte $C5   ; 
- D 1 - I - 0x00EA90 03:AA80: C5        .byte $C5   ; 
- D 1 - I - 0x00EA91 03:AA81: C5        .byte $C5   ; 
- D 1 - I - 0x00EA92 03:AA82: 34        .byte $34   ; 
- D 1 - I - 0x00EA93 03:AA83: 34        .byte $34   ; 
- D 1 - I - 0x00EA94 03:AA84: 34        .byte $34   ; 
- D 1 - I - 0x00EA95 03:AA85: 34        .byte $34   ; 
- D 1 - I - 0x00EA96 03:AA86: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA97 03:AA87: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA98 03:AA88: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA99 03:AA89: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA9A 03:AA8A: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA9B 03:AA8B: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA9C 03:AA8C: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA9D 03:AA8D: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA9E 03:AA8E: 3A        .byte $3A   ; 
- D 1 - I - 0x00EA9F 03:AA8F: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAA0 03:AA90: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAA1 03:AA91: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAA2 03:AA92: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAA3 03:AA93: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAA4 03:AA94: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAA5 03:AA95: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAA6 03:AA96: C5        .byte $C5   ; 
- D 1 - I - 0x00EAA7 03:AA97: C5        .byte $C5   ; 
- D 1 - I - 0x00EAA8 03:AA98: C5        .byte $C5   ; 
- D 1 - I - 0x00EAA9 03:AA99: C5        .byte $C5   ; 
- D 1 - I - 0x00EAAA 03:AA9A: 34        .byte $34   ; 
- D 1 - I - 0x00EAAB 03:AA9B: 34        .byte $34   ; 
- D 1 - I - 0x00EAAC 03:AA9C: 34        .byte $34   ; 
- D 1 - I - 0x00EAAD 03:AA9D: 34        .byte $34   ; 
- D 1 - I - 0x00EAAE 03:AA9E: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAAF 03:AA9F: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB0 03:AAA0: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB1 03:AAA1: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB2 03:AAA2: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB3 03:AAA3: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB4 03:AAA4: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB5 03:AAA5: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB6 03:AAA6: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB7 03:AAA7: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB8 03:AAA8: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAB9 03:AAA9: 3A        .byte $3A   ; 
- D 1 - I - 0x00EABA 03:AAAA: 3A        .byte $3A   ; 
- D 1 - I - 0x00EABB 03:AAAB: 3A        .byte $3A   ; 
- D 1 - I - 0x00EABC 03:AAAC: 3A        .byte $3A   ; 
- D 1 - I - 0x00EABD 03:AAAD: 3A        .byte $3A   ; 
- D 1 - I - 0x00EABE 03:AAAE: 3A        .byte $3A   ; 
- D 1 - I - 0x00EABF 03:AAAF: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC0 03:AAB0: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC1 03:AAB1: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC2 03:AAB2: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC3 03:AAB3: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC4 03:AAB4: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC5 03:AAB5: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC6 03:AAB6: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC7 03:AAB7: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC8 03:AAB8: 3A        .byte $3A   ; 
- D 1 - I - 0x00EAC9 03:AAB9: 3A        .byte $3A   ; 



_off007_0x00EACA_03_area_4:
- D 1 - I - 0x00EACA 03:AABA: 00        .byte $00   ; 
- D 1 - I - 0x00EACB 03:AABB: 00        .byte $00   ; 
- D 1 - I - 0x00EACC 03:AABC: 00        .byte $00   ; 
- D 1 - I - 0x00EACD 03:AABD: 00        .byte $00   ; 
- D 1 - I - 0x00EACE 03:AABE: 00        .byte $00   ; 
- D 1 - I - 0x00EACF 03:AABF: 00        .byte $00   ; 
- D 1 - I - 0x00EAD0 03:AAC0: 00        .byte $00   ; 
- - - - - - 0x00EAD1 03:AAC1: 00        .byte $00   ; 
- D 1 - I - 0x00EAD2 03:AAC2: 00        .byte $00   ; 
- D 1 - I - 0x00EAD3 03:AAC3: 00        .byte $00   ; 
- D 1 - I - 0x00EAD4 03:AAC4: 00        .byte $00   ; 
- D 1 - I - 0x00EAD5 03:AAC5: 00        .byte $00   ; 
- D 1 - I - 0x00EAD6 03:AAC6: 00        .byte $00   ; 
- D 1 - I - 0x00EAD7 03:AAC7: 00        .byte $00   ; 
- D 1 - I - 0x00EAD8 03:AAC8: 00        .byte $00   ; 
- D 1 - I - 0x00EAD9 03:AAC9: 00        .byte $00   ; 
- D 1 - I - 0x00EADA 03:AACA: 00        .byte $00   ; 
- D 1 - I - 0x00EADB 03:AACB: 00        .byte $00   ; 
- D 1 - I - 0x00EADC 03:AACC: 00        .byte $00   ; 
- D 1 - I - 0x00EADD 03:AACD: 00        .byte $00   ; 
- D 1 - I - 0x00EADE 03:AACE: 00        .byte $00   ; 
- D 1 - I - 0x00EADF 03:AACF: 00        .byte $00   ; 
- D 1 - I - 0x00EAE0 03:AAD0: 00        .byte $00   ; 
- D 1 - I - 0x00EAE1 03:AAD1: 00        .byte $00   ; 
- D 1 - I - 0x00EAE2 03:AAD2: 00        .byte $00   ; 
- D 1 - I - 0x00EAE3 03:AAD3: 00        .byte $00   ; 
- D 1 - I - 0x00EAE4 03:AAD4: 00        .byte $00   ; 
- D 1 - I - 0x00EAE5 03:AAD5: 00        .byte $00   ; 
- D 1 - I - 0x00EAE6 03:AAD6: 00        .byte $00   ; 
- D 1 - I - 0x00EAE7 03:AAD7: 00        .byte $00   ; 
- D 1 - I - 0x00EAE8 03:AAD8: 00        .byte $00   ; 
- D 1 - I - 0x00EAE9 03:AAD9: 00        .byte $00   ; 
- D 1 - I - 0x00EAEA 03:AADA: 00        .byte $00   ; 
- D 1 - I - 0x00EAEB 03:AADB: 00        .byte $00   ; 
- D 1 - I - 0x00EAEC 03:AADC: 00        .byte $00   ; 
- D 1 - I - 0x00EAED 03:AADD: 00        .byte $00   ; 
- D 1 - I - 0x00EAEE 03:AADE: FF        .byte $FF   ; 
- - - - - - 0x00EAEF 03:AADF: FF        .byte $FF   ; 
- D 1 - I - 0x00EAF0 03:AAE0: FF        .byte $FF   ; 
- D 1 - I - 0x00EAF1 03:AAE1: FF        .byte $FF   ; 
- - - - - - 0x00EAF2 03:AAE2: FF        .byte $FF   ; 
- - - - - - 0x00EAF3 03:AAE3: FF        .byte $FF   ; 
- - - - - - 0x00EAF4 03:AAE4: FF        .byte $FF   ; 
- D 1 - I - 0x00EAF5 03:AAE5: FF        .byte $FF   ; 
- D 1 - I - 0x00EAF6 03:AAE6: F0        .byte $F0   ; 
- D 1 - I - 0x00EAF7 03:AAE7: F0        .byte $F0   ; 
- D 1 - I - 0x00EAF8 03:AAE8: F0        .byte $F0   ; 
- D 1 - I - 0x00EAF9 03:AAE9: 00        .byte $00   ; 
- D 1 - I - 0x00EAFA 03:AAEA: 00        .byte $00   ; 
- D 1 - I - 0x00EAFB 03:AAEB: 00        .byte $00   ; 
- D 1 - I - 0x00EAFC 03:AAEC: 00        .byte $00   ; 
- D 1 - I - 0x00EAFD 03:AAED: 00        .byte $00   ; 
- D 1 - I - 0x00EAFE 03:AAEE: 00        .byte $00   ; 
- - - - - - 0x00EAFF 03:AAEF: 0F        .byte $0F   ; 
- D 1 - I - 0x00EB00 03:AAF0: 0F        .byte $0F   ; 
- D 1 - I - 0x00EB01 03:AAF1: 0F        .byte $0F   ; 
- D 1 - I - 0x00EB02 03:AAF2: 00        .byte $00   ; 
- - - - - - 0x00EB03 03:AAF3: 00        .byte $00   ; 
- D 1 - I - 0x00EB04 03:AAF4: 00        .byte $00   ; 
- D 1 - I - 0x00EB05 03:AAF5: 00        .byte $00   ; 
- D 1 - I - 0x00EB06 03:AAF6: 00        .byte $00   ; 
- - - - - - 0x00EB07 03:AAF7: 00        .byte $00   ; 
- - - - - - 0x00EB08 03:AAF8: 00        .byte $00   ; 
- - - - - - 0x00EB09 03:AAF9: 00        .byte $00   ; 
- D 1 - I - 0x00EB0A 03:AAFA: 00        .byte $00   ; 
- D 1 - I - 0x00EB0B 03:AAFB: 00        .byte $00   ; 
- D 1 - I - 0x00EB0C 03:AAFC: 00        .byte $00   ; 
- D 1 - I - 0x00EB0D 03:AAFD: 88        .byte $88   ; 
- D 1 - I - 0x00EB0E 03:AAFE: 88        .byte $88   ; 
- D 1 - I - 0x00EB0F 03:AAFF: 88        .byte $88   ; 
- D 1 - I - 0x00EB10 03:AB00: 22        .byte $22   ; 
- - - - - - 0x00EB11 03:AB01: 22        .byte $22   ; 
- - - - - - 0x00EB12 03:AB02: 22        .byte $22   ; 
- D 1 - I - 0x00EB13 03:AB03: 88        .byte $88   ; 
- D 1 - I - 0x00EB14 03:AB04: 22        .byte $22   ; 
- - - - - - 0x00EB15 03:AB05: 08        .byte $08   ; 
- - - - - - 0x00EB16 03:AB06: 02        .byte $02   ; 
- D 1 - I - 0x00EB17 03:AB07: 80        .byte $80   ; 
- D 1 - I - 0x00EB18 03:AB08: 20        .byte $20   ; 
- D 1 - I - 0x00EB19 03:AB09: 00        .byte $00   ; 
- D 1 - I - 0x00EB1A 03:AB0A: 00        .byte $00   ; 
- - - - - - 0x00EB1B 03:AB0B: 00        .byte $00   ; 
- - - - - - 0x00EB1C 03:AB0C: 0F        .byte $0F   ; 
- - - - - - 0x00EB1D 03:AB0D: 0F        .byte $0F   ; 
- D 1 - I - 0x00EB1E 03:AB0E: 00        .byte $00   ; 
- D 1 - I - 0x00EB1F 03:AB0F: 00        .byte $00   ; 
- D 1 - I - 0x00EB20 03:AB10: 00        .byte $00   ; 
- D 1 - I - 0x00EB21 03:AB11: 00        .byte $00   ; 
- D 1 - I - 0x00EB22 03:AB12: 00        .byte $00   ; 
- D 1 - I - 0x00EB23 03:AB13: 00        .byte $00   ; 
- D 1 - I - 0x00EB24 03:AB14: 00        .byte $00   ; 
- D 1 - I - 0x00EB25 03:AB15: 00        .byte $00   ; 
- - - - - - 0x00EB26 03:AB16: 00        .byte $00   ; 
- D 1 - I - 0x00EB27 03:AB17: 00        .byte $00   ; 
- D 1 - I - 0x00EB28 03:AB18: 00        .byte $00   ; 
- D 1 - I - 0x00EB29 03:AB19: 00        .byte $00   ; 
- D 1 - I - 0x00EB2A 03:AB1A: 00        .byte $00   ; 
- D 1 - I - 0x00EB2B 03:AB1B: 00        .byte $00   ; 
- D 1 - I - 0x00EB2C 03:AB1C: CF        .byte $CF   ; 
- D 1 - I - 0x00EB2D 03:AB1D: FC        .byte $FC   ; 
- D 1 - I - 0x00EB2E 03:AB1E: 0F        .byte $0F   ; 
- D 1 - I - 0x00EB2F 03:AB1F: FF        .byte $FF   ; 
- D 1 - I - 0x00EB30 03:AB20: 3F        .byte $3F   ; 
- D 1 - I - 0x00EB31 03:AB21: 3F        .byte $3F   ; 
- D 1 - I - 0x00EB32 03:AB22: CF        .byte $CF   ; 
- D 1 - I - 0x00EB33 03:AB23: FF        .byte $FF   ; 
- D 1 - I - 0x00EB34 03:AB24: CF        .byte $CF   ; 
- D 1 - I - 0x00EB35 03:AB25: C0        .byte $C0   ; 
- D 1 - I - 0x00EB36 03:AB26: FF        .byte $FF   ; 
- D 1 - I - 0x00EB37 03:AB27: FF        .byte $FF   ; 
- D 1 - I - 0x00EB38 03:AB28: 3F        .byte $3F   ; 
- D 1 - I - 0x00EB39 03:AB29: FF        .byte $FF   ; 
- D 1 - I - 0x00EB3A 03:AB2A: 33        .byte $33   ; 
- D 1 - I - 0x00EB3B 03:AB2B: F3        .byte $F3   ; 
- D 1 - I - 0x00EB3C 03:AB2C: FF        .byte $FF   ; 
- D 1 - I - 0x00EB3D 03:AB2D: FF        .byte $FF   ; 
- D 1 - I - 0x00EB3E 03:AB2E: FF        .byte $FF   ; 
- D 1 - I - 0x00EB3F 03:AB2F: 00        .byte $00   ; 
- D 1 - I - 0x00EB40 03:AB30: 00        .byte $00   ; 
- D 1 - I - 0x00EB41 03:AB31: 00        .byte $00   ; 
- D 1 - I - 0x00EB42 03:AB32: 00        .byte $00   ; 
- D 1 - I - 0x00EB43 03:AB33: 00        .byte $00   ; 
- D 1 - I - 0x00EB44 03:AB34: 00        .byte $00   ; 
- D 1 - I - 0x00EB45 03:AB35: 00        .byte $00   ; 
- D 1 - I - 0x00EB46 03:AB36: 00        .byte $00   ; 
- D 1 - I - 0x00EB47 03:AB37: 00        .byte $00   ; 
- D 1 - I - 0x00EB48 03:AB38: 00        .byte $00   ; 
- D 1 - I - 0x00EB49 03:AB39: 00        .byte $00   ; 
- D 1 - I - 0x00EB4A 03:AB3A: 00        .byte $00   ; 
- D 1 - I - 0x00EB4B 03:AB3B: FC        .byte $FC   ; 
- D 1 - I - 0x00EB4C 03:AB3C: F3        .byte $F3   ; 
- D 1 - I - 0x00EB4D 03:AB3D: 00        .byte $00   ; 
- D 1 - I - 0x00EB4E 03:AB3E: 00        .byte $00   ; 
- D 1 - I - 0x00EB4F 03:AB3F: 00        .byte $00   ; 
- D 1 - I - 0x00EB50 03:AB40: FF        .byte $FF   ; 
- D 1 - I - 0x00EB51 03:AB41: 0F        .byte $0F   ; 
- D 1 - I - 0x00EB52 03:AB42: 00        .byte $00   ; 
- D 1 - I - 0x00EB53 03:AB43: 00        .byte $00   ; 
- D 1 - I - 0x00EB54 03:AB44: 00        .byte $00   ; 
- D 1 - I - 0x00EB55 03:AB45: 00        .byte $00   ; 
- D 1 - I - 0x00EB56 03:AB46: 00        .byte $00   ; 
- D 1 - I - 0x00EB57 03:AB47: 00        .byte $00   ; 
- D 1 - I - 0x00EB58 03:AB48: 00        .byte $00   ; 
- D 1 - I - 0x00EB59 03:AB49: 00        .byte $00   ; 
- D 1 - I - 0x00EB5A 03:AB4A: 00        .byte $00   ; 
- D 1 - I - 0x00EB5B 03:AB4B: 00        .byte $00   ; 
- D 1 - I - 0x00EB5C 03:AB4C: 00        .byte $00   ; 
- D 1 - I - 0x00EB5D 03:AB4D: 00        .byte $00   ; 
- D 1 - I - 0x00EB5E 03:AB4E: 00        .byte $00   ; 
- D 1 - I - 0x00EB5F 03:AB4F: 00        .byte $00   ; 
- D 1 - I - 0x00EB60 03:AB50: 00        .byte $00   ; 
- D 1 - I - 0x00EB61 03:AB51: 00        .byte $00   ; 
- D 1 - I - 0x00EB62 03:AB52: 00        .byte $00   ; 
- D 1 - I - 0x00EB63 03:AB53: 00        .byte $00   ; 
- D 1 - I - 0x00EB64 03:AB54: 00        .byte $00   ; 
- D 1 - I - 0x00EB65 03:AB55: 00        .byte $00   ; 
- D 1 - I - 0x00EB66 03:AB56: 00        .byte $00   ; 
- D 1 - I - 0x00EB67 03:AB57: 00        .byte $00   ; 
- D 1 - I - 0x00EB68 03:AB58: 00        .byte $00   ; 
- D 1 - I - 0x00EB69 03:AB59: 00        .byte $00   ; 
- D 1 - I - 0x00EB6A 03:AB5A: 00        .byte $00   ; 
- D 1 - I - 0x00EB6B 03:AB5B: 00        .byte $00   ; 
- D 1 - I - 0x00EB6C 03:AB5C: 00        .byte $00   ; 
- D 1 - I - 0x00EB6D 03:AB5D: 00        .byte $00   ; 
- D 1 - I - 0x00EB6E 03:AB5E: 00        .byte $00   ; 
- D 1 - I - 0x00EB6F 03:AB5F: 00        .byte $00   ; 
- D 1 - I - 0x00EB70 03:AB60: 00        .byte $00   ; 
- D 1 - I - 0x00EB71 03:AB61: 00        .byte $00   ; 
- D 1 - I - 0x00EB72 03:AB62: 00        .byte $00   ; 
- D 1 - I - 0x00EB73 03:AB63: 00        .byte $00   ; 
- D 1 - I - 0x00EB74 03:AB64: 00        .byte $00   ; 
- D 1 - I - 0x00EB75 03:AB65: 00        .byte $00   ; 
- D 1 - I - 0x00EB76 03:AB66: 00        .byte $00   ; 
- D 1 - I - 0x00EB77 03:AB67: 00        .byte $00   ; 
- D 1 - I - 0x00EB78 03:AB68: 00        .byte $00   ; 
- D 1 - I - 0x00EB79 03:AB69: 00        .byte $00   ; 



_off004_0x00EB7A_02_area_3:
- D 1 - I - 0x00EB7A 03:AB6A: 16        .byte $16   ; config
- D 1 - I - 0x00EB7B 03:AB6B: 01        .byte $01   ; config

- D 1 - I - 0x00EB7C 03:AB6C: 01        .byte $01   ; 
- D 1 - I - 0x00EB7D 03:AB6D: 02        .byte $02   ; 
- D 1 - I - 0x00EB7E 03:AB6E: 01        .byte $01   ; 
- D 1 - I - 0x00EB7F 03:AB6F: 03        .byte $03   ; 
- D 1 - I - 0x00EB80 03:AB70: 01        .byte $01   ; 
- D 1 - I - 0x00EB81 03:AB71: 04        .byte $04   ; 
- D 1 - I - 0x00EB82 03:AB72: 01        .byte $01   ; 
- D 1 - I - 0x00EB83 03:AB73: 05        .byte $05   ; 
- D 1 - I - 0x00EB84 03:AB74: 06        .byte $06   ; 
- D 1 - I - 0x00EB85 03:AB75: 07        .byte $07   ; 
- D 1 - I - 0x00EB86 03:AB76: 08        .byte $08   ; 
- D 1 - I - 0x00EB87 03:AB77: 09        .byte $09   ; 
- D 1 - I - 0x00EB88 03:AB78: 0A        .byte $0A   ; 
- D 1 - I - 0x00EB89 03:AB79: 0B        .byte $0B   ; 
- D 1 - I - 0x00EB8A 03:AB7A: 0C        .byte $0C   ; 
- D 1 - I - 0x00EB8B 03:AB7B: 0D        .byte $0D   ; 
- D 1 - I - 0x00EB8C 03:AB7C: 0E        .byte $0E   ; 
- D 1 - I - 0x00EB8D 03:AB7D: 0E        .byte $0E   ; 
- D 1 - I - 0x00EB8E 03:AB7E: 0E        .byte $0E   ; 
- D 1 - I - 0x00EB8F 03:AB7F: 0E        .byte $0E   ; 
- D 1 - I - 0x00EB90 03:AB80: 0F        .byte $0F   ; 
- D 1 - I - 0x00EB91 03:AB81: 10        .byte $10   ; 



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
- - - - - - 0x00EBB4 03:ABA4: 00        .byte $00   ; 
- - - - - - 0x00EBB5 03:ABA5: 00        .byte $00   ; 
- - - - - - 0x00EBB6 03:ABA6: 00        .byte $00   ; 
- - - - - - 0x00EBB7 03:ABA7: 00        .byte $00   ; 
- - - - - - 0x00EBB8 03:ABA8: 00        .byte $00   ; 
- - - - - - 0x00EBB9 03:ABA9: 00        .byte $00   ; 
- - - - - - 0x00EBBA 03:ABAA: 00        .byte $00   ; 
- - - - - - 0x00EBBB 03:ABAB: 00        .byte $00   ; 
- - - - - - 0x00EBBC 03:ABAC: 00        .byte $00   ; 
- - - - - - 0x00EBBD 03:ABAD: 00        .byte $00   ; 
- - - - - - 0x00EBBE 03:ABAE: 00        .byte $00   ; 
- - - - - - 0x00EBBF 03:ABAF: 00        .byte $00   ; 
- - - - - - 0x00EBC0 03:ABB0: 00        .byte $00   ; 
- - - - - - 0x00EBC1 03:ABB1: 00        .byte $00   ; 
- - - - - - 0x00EBC2 03:ABB2: 00        .byte $00   ; 
- - - - - - 0x00EBC3 03:ABB3: 00        .byte $00   ; 
- - - - - - 0x00EBC4 03:ABB4: 00        .byte $00   ; 
- - - - - - 0x00EBC5 03:ABB5: 00        .byte $00   ; 
- - - - - - 0x00EBC6 03:ABB6: 00        .byte $00   ; 
- - - - - - 0x00EBC7 03:ABB7: 00        .byte $00   ; 
- - - - - - 0x00EBC8 03:ABB8: 00        .byte $00   ; 
- - - - - - 0x00EBC9 03:ABB9: 00        .byte $00   ; 
- - - - - - 0x00EBCA 03:ABBA: 00        .byte $00   ; 
- - - - - - 0x00EBCB 03:ABBB: 00        .byte $00   ; 
- - - - - - 0x00EBCC 03:ABBC: 00        .byte $00   ; 
- - - - - - 0x00EBCD 03:ABBD: 00        .byte $00   ; 
- - - - - - 0x00EBCE 03:ABBE: 00        .byte $00   ; 
- - - - - - 0x00EBCF 03:ABBF: 00        .byte $00   ; 
- - - - - - 0x00EBD0 03:ABC0: 00        .byte $00   ; 
- - - - - - 0x00EBD1 03:ABC1: 00        .byte $00   ; 
- - - - - - 0x00EBD2 03:ABC2: 00        .byte $00   ; 
- - - - - - 0x00EBD3 03:ABC3: 00        .byte $00   ; 
- - - - - - 0x00EBD4 03:ABC4: 00        .byte $00   ; 
- - - - - - 0x00EBD5 03:ABC5: 00        .byte $00   ; 
- - - - - - 0x00EBD6 03:ABC6: 00        .byte $00   ; 
- - - - - - 0x00EBD7 03:ABC7: 00        .byte $00   ; 
- - - - - - 0x00EBD8 03:ABC8: 00        .byte $00   ; 
- - - - - - 0x00EBD9 03:ABC9: 00        .byte $00   ; 
- - - - - - 0x00EBDA 03:ABCA: 00        .byte $00   ; 
- - - - - - 0x00EBDB 03:ABCB: 00        .byte $00   ; 
- - - - - - 0x00EBDC 03:ABCC: 00        .byte $00   ; 
- - - - - - 0x00EBDD 03:ABCD: 00        .byte $00   ; 
- - - - - - 0x00EBDE 03:ABCE: 00        .byte $00   ; 
- - - - - - 0x00EBDF 03:ABCF: 00        .byte $00   ; 
- - - - - - 0x00EBE0 03:ABD0: 00        .byte $00   ; 
- - - - - - 0x00EBE1 03:ABD1: 00        .byte $00   ; 
- - - - - - 0x00EBE2 03:ABD2: 00        .byte $00   ; 
- - - - - - 0x00EBE3 03:ABD3: 00        .byte $00   ; 
- - - - - - 0x00EBE4 03:ABD4: 00        .byte $00   ; 
- - - - - - 0x00EBE5 03:ABD5: 00        .byte $00   ; 
- - - - - - 0x00EBE6 03:ABD6: 00        .byte $00   ; 
- - - - - - 0x00EBE7 03:ABD7: 00        .byte $00   ; 
- - - - - - 0x00EBE8 03:ABD8: 00        .byte $00   ; 
- - - - - - 0x00EBE9 03:ABD9: 00        .byte $00   ; 
- - - - - - 0x00EBEA 03:ABDA: 00        .byte $00   ; 
- - - - - - 0x00EBEB 03:ABDB: 00        .byte $00   ; 
- - - - - - 0x00EBEC 03:ABDC: 00        .byte $00   ; 
- - - - - - 0x00EBED 03:ABDD: 00        .byte $00   ; 
- - - - - - 0x00EBEE 03:ABDE: 00        .byte $00   ; 
- - - - - - 0x00EBEF 03:ABDF: 00        .byte $00   ; 
- - - - - - 0x00EBF0 03:ABE0: 00        .byte $00   ; 
- - - - - - 0x00EBF1 03:ABE1: 00        .byte $00   ; 
- - - - - - 0x00EBF2 03:ABE2: 00        .byte $00   ; 
- - - - - - 0x00EBF3 03:ABE3: 00        .byte $00   ; 



_off018_02_ABE4_01:
- D 1 - I - 0x00EBF4 03:ABE4: 14        .byte $14   ; 
- D 1 - I - 0x00EBF5 03:ABE5: 01        .byte $01   ; 
- D 1 - I - 0x00EBF6 03:ABE6: 02        .byte $02   ; 
- D 1 - I - 0x00EBF7 03:ABE7: 03        .byte $03   ; 
- D 1 - I - 0x00EBF8 03:ABE8: 14        .byte $14   ; 
- D 1 - I - 0x00EBF9 03:ABE9: 01        .byte $01   ; 
- D 1 - I - 0x00EBFA 03:ABEA: 02        .byte $02   ; 
- D 1 - I - 0x00EBFB 03:ABEB: 03        .byte $03   ; 
- D 1 - I - 0x00EBFC 03:ABEC: 04        .byte $04   ; 
- D 1 - I - 0x00EBFD 03:ABED: 05        .byte $05   ; 
- D 1 - I - 0x00EBFE 03:ABEE: 06        .byte $06   ; 
- D 1 - I - 0x00EBFF 03:ABEF: 07        .byte $07   ; 
- D 1 - I - 0x00EC00 03:ABF0: 04        .byte $04   ; 
- D 1 - I - 0x00EC01 03:ABF1: 05        .byte $05   ; 
- D 1 - I - 0x00EC02 03:ABF2: 06        .byte $06   ; 
- D 1 - I - 0x00EC03 03:ABF3: 07        .byte $07   ; 
- D 1 - I - 0x00EC04 03:ABF4: 08        .byte $08   ; 
- D 1 - I - 0x00EC05 03:ABF5: 09        .byte $09   ; 
- D 1 - I - 0x00EC06 03:ABF6: 0A        .byte $0A   ; 
- D 1 - I - 0x00EC07 03:ABF7: 0B        .byte $0B   ; 
- D 1 - I - 0x00EC08 03:ABF8: 08        .byte $08   ; 
- D 1 - I - 0x00EC09 03:ABF9: 09        .byte $09   ; 
- D 1 - I - 0x00EC0A 03:ABFA: 0A        .byte $0A   ; 
- D 1 - I - 0x00EC0B 03:ABFB: 0B        .byte $0B   ; 
- D 1 - I - 0x00EC0C 03:ABFC: 0C        .byte $0C   ; 
- D 1 - I - 0x00EC0D 03:ABFD: 0D        .byte $0D   ; 
- D 1 - I - 0x00EC0E 03:ABFE: 0E        .byte $0E   ; 
- D 1 - I - 0x00EC0F 03:ABFF: 0F        .byte $0F   ; 
- D 1 - I - 0x00EC10 03:AC00: 0C        .byte $0C   ; 
- D 1 - I - 0x00EC11 03:AC01: 0D        .byte $0D   ; 
- D 1 - I - 0x00EC12 03:AC02: 0E        .byte $0E   ; 
- D 1 - I - 0x00EC13 03:AC03: 0F        .byte $0F   ; 
- D 1 - I - 0x00EC14 03:AC04: 10        .byte $10   ; 
- D 1 - I - 0x00EC15 03:AC05: 11        .byte $11   ; 
- D 1 - I - 0x00EC16 03:AC06: 12        .byte $12   ; 
- D 1 - I - 0x00EC17 03:AC07: 13        .byte $13   ; 
- D 1 - I - 0x00EC18 03:AC08: 10        .byte $10   ; 
- D 1 - I - 0x00EC19 03:AC09: 11        .byte $11   ; 
- D 1 - I - 0x00EC1A 03:AC0A: 12        .byte $12   ; 
- D 1 - I - 0x00EC1B 03:AC0B: 13        .byte $13   ; 
- D 1 - I - 0x00EC1C 03:AC0C: 15        .byte $15   ; 
- D 1 - I - 0x00EC1D 03:AC0D: 15        .byte $15   ; 
- D 1 - I - 0x00EC1E 03:AC0E: 15        .byte $15   ; 
- D 1 - I - 0x00EC1F 03:AC0F: 15        .byte $15   ; 
- D 1 - I - 0x00EC20 03:AC10: 15        .byte $15   ; 
- D 1 - I - 0x00EC21 03:AC11: 15        .byte $15   ; 
- D 1 - I - 0x00EC22 03:AC12: 15        .byte $15   ; 
- D 1 - I - 0x00EC23 03:AC13: 15        .byte $15   ; 
- D 1 - I - 0x00EC24 03:AC14: 16        .byte $16   ; 
- D 1 - I - 0x00EC25 03:AC15: 16        .byte $16   ; 
- D 1 - I - 0x00EC26 03:AC16: 16        .byte $16   ; 
- D 1 - I - 0x00EC27 03:AC17: 16        .byte $16   ; 
- D 1 - I - 0x00EC28 03:AC18: 16        .byte $16   ; 
- D 1 - I - 0x00EC29 03:AC19: 16        .byte $16   ; 
- D 1 - I - 0x00EC2A 03:AC1A: 16        .byte $16   ; 
- D 1 - I - 0x00EC2B 03:AC1B: 16        .byte $16   ; 
- D 1 - I - 0x00EC2C 03:AC1C: 00        .byte $00   ; 
- D 1 - I - 0x00EC2D 03:AC1D: 00        .byte $00   ; 
- D 1 - I - 0x00EC2E 03:AC1E: 00        .byte $00   ; 
- D 1 - I - 0x00EC2F 03:AC1F: 00        .byte $00   ; 
- D 1 - I - 0x00EC30 03:AC20: 00        .byte $00   ; 
- D 1 - I - 0x00EC31 03:AC21: 00        .byte $00   ; 
- D 1 - I - 0x00EC32 03:AC22: 00        .byte $00   ; 
- D 1 - I - 0x00EC33 03:AC23: 00        .byte $00   ; 



_off018_02_AC24_02:
- D 1 - I - 0x00EC34 03:AC24: 14        .byte $14   ; 
- D 1 - I - 0x00EC35 03:AC25: 01        .byte $01   ; 
- D 1 - I - 0x00EC36 03:AC26: 02        .byte $02   ; 
- D 1 - I - 0x00EC37 03:AC27: 03        .byte $03   ; 
- D 1 - I - 0x00EC38 03:AC28: 14        .byte $14   ; 
- D 1 - I - 0x00EC39 03:AC29: 01        .byte $01   ; 
- D 1 - I - 0x00EC3A 03:AC2A: 02        .byte $02   ; 
- D 1 - I - 0x00EC3B 03:AC2B: 03        .byte $03   ; 
- D 1 - I - 0x00EC3C 03:AC2C: 04        .byte $04   ; 
- D 1 - I - 0x00EC3D 03:AC2D: 05        .byte $05   ; 
- D 1 - I - 0x00EC3E 03:AC2E: 06        .byte $06   ; 
- D 1 - I - 0x00EC3F 03:AC2F: 07        .byte $07   ; 
- D 1 - I - 0x00EC40 03:AC30: 04        .byte $04   ; 
- D 1 - I - 0x00EC41 03:AC31: 05        .byte $05   ; 
- D 1 - I - 0x00EC42 03:AC32: 06        .byte $06   ; 
- D 1 - I - 0x00EC43 03:AC33: 07        .byte $07   ; 
- D 1 - I - 0x00EC44 03:AC34: 08        .byte $08   ; 
- D 1 - I - 0x00EC45 03:AC35: 09        .byte $09   ; 
- D 1 - I - 0x00EC46 03:AC36: 0A        .byte $0A   ; 
- D 1 - I - 0x00EC47 03:AC37: 0B        .byte $0B   ; 
- D 1 - I - 0x00EC48 03:AC38: 08        .byte $08   ; 
- D 1 - I - 0x00EC49 03:AC39: 09        .byte $09   ; 
- D 1 - I - 0x00EC4A 03:AC3A: 0A        .byte $0A   ; 
- D 1 - I - 0x00EC4B 03:AC3B: 0B        .byte $0B   ; 
- D 1 - I - 0x00EC4C 03:AC3C: 0C        .byte $0C   ; 
- D 1 - I - 0x00EC4D 03:AC3D: 0D        .byte $0D   ; 
- D 1 - I - 0x00EC4E 03:AC3E: 0E        .byte $0E   ; 
- D 1 - I - 0x00EC4F 03:AC3F: 0F        .byte $0F   ; 
- D 1 - I - 0x00EC50 03:AC40: 0C        .byte $0C   ; 
- D 1 - I - 0x00EC51 03:AC41: 0D        .byte $0D   ; 
- D 1 - I - 0x00EC52 03:AC42: 0E        .byte $0E   ; 
- D 1 - I - 0x00EC53 03:AC43: 0F        .byte $0F   ; 
- D 1 - I - 0x00EC54 03:AC44: 10        .byte $10   ; 
- D 1 - I - 0x00EC55 03:AC45: 11        .byte $11   ; 
- D 1 - I - 0x00EC56 03:AC46: 12        .byte $12   ; 
- D 1 - I - 0x00EC57 03:AC47: 13        .byte $13   ; 
- D 1 - I - 0x00EC58 03:AC48: 10        .byte $10   ; 
- D 1 - I - 0x00EC59 03:AC49: 11        .byte $11   ; 
- D 1 - I - 0x00EC5A 03:AC4A: 12        .byte $12   ; 
- D 1 - I - 0x00EC5B 03:AC4B: 13        .byte $13   ; 
- D 1 - I - 0x00EC5C 03:AC4C: 15        .byte $15   ; 
- D 1 - I - 0x00EC5D 03:AC4D: 15        .byte $15   ; 
- D 1 - I - 0x00EC5E 03:AC4E: 15        .byte $15   ; 
- D 1 - I - 0x00EC5F 03:AC4F: 42        .byte $42   ; 
- D 1 - I - 0x00EC60 03:AC50: 43        .byte $43   ; 
- D 1 - I - 0x00EC61 03:AC51: 15        .byte $15   ; 
- D 1 - I - 0x00EC62 03:AC52: 15        .byte $15   ; 
- D 1 - I - 0x00EC63 03:AC53: 15        .byte $15   ; 
- D 1 - I - 0x00EC64 03:AC54: 16        .byte $16   ; 
- D 1 - I - 0x00EC65 03:AC55: 16        .byte $16   ; 
- D 1 - I - 0x00EC66 03:AC56: 16        .byte $16   ; 
- D 1 - I - 0x00EC67 03:AC57: 16        .byte $16   ; 
- D 1 - I - 0x00EC68 03:AC58: 16        .byte $16   ; 
- D 1 - I - 0x00EC69 03:AC59: 16        .byte $16   ; 
- D 1 - I - 0x00EC6A 03:AC5A: 16        .byte $16   ; 
- D 1 - I - 0x00EC6B 03:AC5B: 16        .byte $16   ; 
- D 1 - I - 0x00EC6C 03:AC5C: 00        .byte $00   ; 
- D 1 - I - 0x00EC6D 03:AC5D: 00        .byte $00   ; 
- D 1 - I - 0x00EC6E 03:AC5E: 00        .byte $00   ; 
- D 1 - I - 0x00EC6F 03:AC5F: 00        .byte $00   ; 
- D 1 - I - 0x00EC70 03:AC60: 00        .byte $00   ; 
- D 1 - I - 0x00EC71 03:AC61: 00        .byte $00   ; 
- D 1 - I - 0x00EC72 03:AC62: 00        .byte $00   ; 
- D 1 - I - 0x00EC73 03:AC63: 00        .byte $00   ; 



_off018_02_AC64_03:
- D 1 - I - 0x00EC74 03:AC64: 14        .byte $14   ; 
- D 1 - I - 0x00EC75 03:AC65: 01        .byte $01   ; 
- D 1 - I - 0x00EC76 03:AC66: 02        .byte $02   ; 
- D 1 - I - 0x00EC77 03:AC67: 03        .byte $03   ; 
- D 1 - I - 0x00EC78 03:AC68: 14        .byte $14   ; 
- D 1 - I - 0x00EC79 03:AC69: 01        .byte $01   ; 
- D 1 - I - 0x00EC7A 03:AC6A: 02        .byte $02   ; 
- D 1 - I - 0x00EC7B 03:AC6B: 03        .byte $03   ; 
- D 1 - I - 0x00EC7C 03:AC6C: 04        .byte $04   ; 
- D 1 - I - 0x00EC7D 03:AC6D: 05        .byte $05   ; 
- D 1 - I - 0x00EC7E 03:AC6E: 06        .byte $06   ; 
- D 1 - I - 0x00EC7F 03:AC6F: 07        .byte $07   ; 
- D 1 - I - 0x00EC80 03:AC70: 04        .byte $04   ; 
- D 1 - I - 0x00EC81 03:AC71: 05        .byte $05   ; 
- D 1 - I - 0x00EC82 03:AC72: 06        .byte $06   ; 
- D 1 - I - 0x00EC83 03:AC73: 07        .byte $07   ; 
- D 1 - I - 0x00EC84 03:AC74: 08        .byte $08   ; 
- D 1 - I - 0x00EC85 03:AC75: 09        .byte $09   ; 
- D 1 - I - 0x00EC86 03:AC76: 0A        .byte $0A   ; 
- D 1 - I - 0x00EC87 03:AC77: 0B        .byte $0B   ; 
- D 1 - I - 0x00EC88 03:AC78: 08        .byte $08   ; 
- D 1 - I - 0x00EC89 03:AC79: 09        .byte $09   ; 
- D 1 - I - 0x00EC8A 03:AC7A: 0A        .byte $0A   ; 
- D 1 - I - 0x00EC8B 03:AC7B: 0B        .byte $0B   ; 
- D 1 - I - 0x00EC8C 03:AC7C: 0C        .byte $0C   ; 
- D 1 - I - 0x00EC8D 03:AC7D: 0D        .byte $0D   ; 
- D 1 - I - 0x00EC8E 03:AC7E: 0E        .byte $0E   ; 
- D 1 - I - 0x00EC8F 03:AC7F: 0F        .byte $0F   ; 
- D 1 - I - 0x00EC90 03:AC80: 0C        .byte $0C   ; 
- D 1 - I - 0x00EC91 03:AC81: 0D        .byte $0D   ; 
- D 1 - I - 0x00EC92 03:AC82: 0E        .byte $0E   ; 
- D 1 - I - 0x00EC93 03:AC83: 0F        .byte $0F   ; 
- D 1 - I - 0x00EC94 03:AC84: 10        .byte $10   ; 
- D 1 - I - 0x00EC95 03:AC85: 11        .byte $11   ; 
- D 1 - I - 0x00EC96 03:AC86: 12        .byte $12   ; 
- D 1 - I - 0x00EC97 03:AC87: 13        .byte $13   ; 
- D 1 - I - 0x00EC98 03:AC88: 10        .byte $10   ; 
- D 1 - I - 0x00EC99 03:AC89: 11        .byte $11   ; 
- D 1 - I - 0x00EC9A 03:AC8A: 12        .byte $12   ; 
- D 1 - I - 0x00EC9B 03:AC8B: 13        .byte $13   ; 
- D 1 - I - 0x00EC9C 03:AC8C: 15        .byte $15   ; 
- D 1 - I - 0x00EC9D 03:AC8D: 42        .byte $42   ; 
- D 1 - I - 0x00EC9E 03:AC8E: 43        .byte $43   ; 
- D 1 - I - 0x00EC9F 03:AC8F: 15        .byte $15   ; 
- D 1 - I - 0x00ECA0 03:AC90: 15        .byte $15   ; 
- D 1 - I - 0x00ECA1 03:AC91: 42        .byte $42   ; 
- D 1 - I - 0x00ECA2 03:AC92: 43        .byte $43   ; 
- D 1 - I - 0x00ECA3 03:AC93: 15        .byte $15   ; 
- D 1 - I - 0x00ECA4 03:AC94: 16        .byte $16   ; 
- D 1 - I - 0x00ECA5 03:AC95: 16        .byte $16   ; 
- D 1 - I - 0x00ECA6 03:AC96: 16        .byte $16   ; 
- D 1 - I - 0x00ECA7 03:AC97: 16        .byte $16   ; 
- D 1 - I - 0x00ECA8 03:AC98: 16        .byte $16   ; 
- D 1 - I - 0x00ECA9 03:AC99: 16        .byte $16   ; 
- D 1 - I - 0x00ECAA 03:AC9A: 16        .byte $16   ; 
- D 1 - I - 0x00ECAB 03:AC9B: 16        .byte $16   ; 
- D 1 - I - 0x00ECAC 03:AC9C: 00        .byte $00   ; 
- D 1 - I - 0x00ECAD 03:AC9D: 00        .byte $00   ; 
- D 1 - I - 0x00ECAE 03:AC9E: 00        .byte $00   ; 
- D 1 - I - 0x00ECAF 03:AC9F: 00        .byte $00   ; 
- D 1 - I - 0x00ECB0 03:ACA0: 00        .byte $00   ; 
- D 1 - I - 0x00ECB1 03:ACA1: 00        .byte $00   ; 
- D 1 - I - 0x00ECB2 03:ACA2: 00        .byte $00   ; 
- D 1 - I - 0x00ECB3 03:ACA3: 00        .byte $00   ; 



_off018_02_ACA4_04:
- D 1 - I - 0x00ECB4 03:ACA4: 14        .byte $14   ; 
- D 1 - I - 0x00ECB5 03:ACA5: 01        .byte $01   ; 
- D 1 - I - 0x00ECB6 03:ACA6: 02        .byte $02   ; 
- D 1 - I - 0x00ECB7 03:ACA7: 03        .byte $03   ; 
- D 1 - I - 0x00ECB8 03:ACA8: 14        .byte $14   ; 
- D 1 - I - 0x00ECB9 03:ACA9: 01        .byte $01   ; 
- D 1 - I - 0x00ECBA 03:ACAA: 02        .byte $02   ; 
- D 1 - I - 0x00ECBB 03:ACAB: 03        .byte $03   ; 
- D 1 - I - 0x00ECBC 03:ACAC: 04        .byte $04   ; 
- D 1 - I - 0x00ECBD 03:ACAD: 05        .byte $05   ; 
- D 1 - I - 0x00ECBE 03:ACAE: 06        .byte $06   ; 
- D 1 - I - 0x00ECBF 03:ACAF: 07        .byte $07   ; 
- D 1 - I - 0x00ECC0 03:ACB0: 04        .byte $04   ; 
- D 1 - I - 0x00ECC1 03:ACB1: 05        .byte $05   ; 
- D 1 - I - 0x00ECC2 03:ACB2: 06        .byte $06   ; 
- D 1 - I - 0x00ECC3 03:ACB3: 07        .byte $07   ; 
- D 1 - I - 0x00ECC4 03:ACB4: 08        .byte $08   ; 
- D 1 - I - 0x00ECC5 03:ACB5: 09        .byte $09   ; 
- D 1 - I - 0x00ECC6 03:ACB6: 0A        .byte $0A   ; 
- D 1 - I - 0x00ECC7 03:ACB7: 0B        .byte $0B   ; 
- D 1 - I - 0x00ECC8 03:ACB8: 08        .byte $08   ; 
- D 1 - I - 0x00ECC9 03:ACB9: 09        .byte $09   ; 
- D 1 - I - 0x00ECCA 03:ACBA: 0A        .byte $0A   ; 
- D 1 - I - 0x00ECCB 03:ACBB: 0B        .byte $0B   ; 
- D 1 - I - 0x00ECCC 03:ACBC: 0C        .byte $0C   ; 
- D 1 - I - 0x00ECCD 03:ACBD: 0D        .byte $0D   ; 
- D 1 - I - 0x00ECCE 03:ACBE: 0E        .byte $0E   ; 
- D 1 - I - 0x00ECCF 03:ACBF: 0F        .byte $0F   ; 
- D 1 - I - 0x00ECD0 03:ACC0: 0C        .byte $0C   ; 
- D 1 - I - 0x00ECD1 03:ACC1: 0D        .byte $0D   ; 
- D 1 - I - 0x00ECD2 03:ACC2: 0E        .byte $0E   ; 
- D 1 - I - 0x00ECD3 03:ACC3: 0F        .byte $0F   ; 
- D 1 - I - 0x00ECD4 03:ACC4: 10        .byte $10   ; 
- D 1 - I - 0x00ECD5 03:ACC5: 11        .byte $11   ; 
- D 1 - I - 0x00ECD6 03:ACC6: 12        .byte $12   ; 
- D 1 - I - 0x00ECD7 03:ACC7: 13        .byte $13   ; 
- D 1 - I - 0x00ECD8 03:ACC8: 10        .byte $10   ; 
- D 1 - I - 0x00ECD9 03:ACC9: 3E        .byte $3E   ; 
- D 1 - I - 0x00ECDA 03:ACCA: 12        .byte $12   ; 
- D 1 - I - 0x00ECDB 03:ACCB: 13        .byte $13   ; 
- D 1 - I - 0x00ECDC 03:ACCC: 15        .byte $15   ; 
- D 1 - I - 0x00ECDD 03:ACCD: 15        .byte $15   ; 
- D 1 - I - 0x00ECDE 03:ACCE: 15        .byte $15   ; 
- D 1 - I - 0x00ECDF 03:ACCF: 15        .byte $15   ; 
- D 1 - I - 0x00ECE0 03:ACD0: 3F        .byte $3F   ; 
- D 1 - I - 0x00ECE1 03:ACD1: 40        .byte $40   ; 
- D 1 - I - 0x00ECE2 03:ACD2: 41        .byte $41   ; 
- D 1 - I - 0x00ECE3 03:ACD3: 15        .byte $15   ; 
- D 1 - I - 0x00ECE4 03:ACD4: 16        .byte $16   ; 
- D 1 - I - 0x00ECE5 03:ACD5: 16        .byte $16   ; 
- D 1 - I - 0x00ECE6 03:ACD6: 16        .byte $16   ; 
- D 1 - I - 0x00ECE7 03:ACD7: 16        .byte $16   ; 
- D 1 - I - 0x00ECE8 03:ACD8: 16        .byte $16   ; 
- D 1 - I - 0x00ECE9 03:ACD9: 16        .byte $16   ; 
- D 1 - I - 0x00ECEA 03:ACDA: 16        .byte $16   ; 
- D 1 - I - 0x00ECEB 03:ACDB: 16        .byte $16   ; 
- D 1 - I - 0x00ECEC 03:ACDC: 00        .byte $00   ; 
- D 1 - I - 0x00ECED 03:ACDD: 00        .byte $00   ; 
- D 1 - I - 0x00ECEE 03:ACDE: 00        .byte $00   ; 
- D 1 - I - 0x00ECEF 03:ACDF: 00        .byte $00   ; 
- D 1 - I - 0x00ECF0 03:ACE0: 00        .byte $00   ; 
- D 1 - I - 0x00ECF1 03:ACE1: 00        .byte $00   ; 
- D 1 - I - 0x00ECF2 03:ACE2: 00        .byte $00   ; 
- D 1 - I - 0x00ECF3 03:ACE3: 00        .byte $00   ; 



_off018_02_ACE4_05:
- D 1 - I - 0x00ECF4 03:ACE4: 14        .byte $14   ; 
- D 1 - I - 0x00ECF5 03:ACE5: 01        .byte $01   ; 
- D 1 - I - 0x00ECF6 03:ACE6: 02        .byte $02   ; 
- D 1 - I - 0x00ECF7 03:ACE7: 03        .byte $03   ; 
- D 1 - I - 0x00ECF8 03:ACE8: 14        .byte $14   ; 
- D 1 - I - 0x00ECF9 03:ACE9: 01        .byte $01   ; 
- D 1 - I - 0x00ECFA 03:ACEA: 02        .byte $02   ; 
- D 1 - I - 0x00ECFB 03:ACEB: 03        .byte $03   ; 
- D 1 - I - 0x00ECFC 03:ACEC: 04        .byte $04   ; 
- D 1 - I - 0x00ECFD 03:ACED: 05        .byte $05   ; 
- D 1 - I - 0x00ECFE 03:ACEE: 06        .byte $06   ; 
- D 1 - I - 0x00ECFF 03:ACEF: 07        .byte $07   ; 
- D 1 - I - 0x00ED00 03:ACF0: 04        .byte $04   ; 
- D 1 - I - 0x00ED01 03:ACF1: 05        .byte $05   ; 
- D 1 - I - 0x00ED02 03:ACF2: 06        .byte $06   ; 
- D 1 - I - 0x00ED03 03:ACF3: 07        .byte $07   ; 
- D 1 - I - 0x00ED04 03:ACF4: 08        .byte $08   ; 
- D 1 - I - 0x00ED05 03:ACF5: 09        .byte $09   ; 
- D 1 - I - 0x00ED06 03:ACF6: 0A        .byte $0A   ; 
- D 1 - I - 0x00ED07 03:ACF7: 0B        .byte $0B   ; 
- D 1 - I - 0x00ED08 03:ACF8: 08        .byte $08   ; 
- D 1 - I - 0x00ED09 03:ACF9: 09        .byte $09   ; 
- D 1 - I - 0x00ED0A 03:ACFA: 0A        .byte $0A   ; 
- D 1 - I - 0x00ED0B 03:ACFB: 0B        .byte $0B   ; 
- D 1 - I - 0x00ED0C 03:ACFC: 0C        .byte $0C   ; 
- D 1 - I - 0x00ED0D 03:ACFD: 0D        .byte $0D   ; 
- D 1 - I - 0x00ED0E 03:ACFE: 0E        .byte $0E   ; 
- D 1 - I - 0x00ED0F 03:ACFF: 0F        .byte $0F   ; 
- D 1 - I - 0x00ED10 03:AD00: 0C        .byte $0C   ; 
- D 1 - I - 0x00ED11 03:AD01: 0D        .byte $0D   ; 
- D 1 - I - 0x00ED12 03:AD02: 0E        .byte $0E   ; 
- D 1 - I - 0x00ED13 03:AD03: 0F        .byte $0F   ; 
- D 1 - I - 0x00ED14 03:AD04: 10        .byte $10   ; 
- D 1 - I - 0x00ED15 03:AD05: 11        .byte $11   ; 
- D 1 - I - 0x00ED16 03:AD06: 12        .byte $12   ; 
- D 1 - I - 0x00ED17 03:AD07: 13        .byte $13   ; 
- D 1 - I - 0x00ED18 03:AD08: 10        .byte $10   ; 
- D 1 - I - 0x00ED19 03:AD09: 18        .byte $18   ; 
- D 1 - I - 0x00ED1A 03:AD0A: 19        .byte $19   ; 
- D 1 - I - 0x00ED1B 03:AD0B: 1A        .byte $1A   ; 
- D 1 - I - 0x00ED1C 03:AD0C: 15        .byte $15   ; 
- D 1 - I - 0x00ED1D 03:AD0D: 15        .byte $15   ; 
- D 1 - I - 0x00ED1E 03:AD0E: 15        .byte $15   ; 
- D 1 - I - 0x00ED1F 03:AD0F: 15        .byte $15   ; 
- D 1 - I - 0x00ED20 03:AD10: 15        .byte $15   ; 
- D 1 - I - 0x00ED21 03:AD11: 1E        .byte $1E   ; 
- D 1 - I - 0x00ED22 03:AD12: 1F        .byte $1F   ; 
- D 1 - I - 0x00ED23 03:AD13: 1F        .byte $1F   ; 
- D 1 - I - 0x00ED24 03:AD14: 16        .byte $16   ; 
- D 1 - I - 0x00ED25 03:AD15: 16        .byte $16   ; 
- D 1 - I - 0x00ED26 03:AD16: 16        .byte $16   ; 
- D 1 - I - 0x00ED27 03:AD17: 16        .byte $16   ; 
- D 1 - I - 0x00ED28 03:AD18: 22        .byte $22   ; 
- D 1 - I - 0x00ED29 03:AD19: 23        .byte $23   ; 
- D 1 - I - 0x00ED2A 03:AD1A: 24        .byte $24   ; 
- D 1 - I - 0x00ED2B 03:AD1B: 24        .byte $24   ; 
- D 1 - I - 0x00ED2C 03:AD1C: 00        .byte $00   ; 
- D 1 - I - 0x00ED2D 03:AD1D: 00        .byte $00   ; 
- D 1 - I - 0x00ED2E 03:AD1E: 00        .byte $00   ; 
- D 1 - I - 0x00ED2F 03:AD1F: 00        .byte $00   ; 
- D 1 - I - 0x00ED30 03:AD20: 00        .byte $00   ; 
- D 1 - I - 0x00ED31 03:AD21: 00        .byte $00   ; 
- D 1 - I - 0x00ED32 03:AD22: 00        .byte $00   ; 
- D 1 - I - 0x00ED33 03:AD23: 00        .byte $00   ; 



_off018_02_AD24_06:
- D 1 - I - 0x00ED34 03:AD24: 14        .byte $14   ; 
- D 1 - I - 0x00ED35 03:AD25: 01        .byte $01   ; 
- D 1 - I - 0x00ED36 03:AD26: 02        .byte $02   ; 
- D 1 - I - 0x00ED37 03:AD27: 03        .byte $03   ; 
- D 1 - I - 0x00ED38 03:AD28: 14        .byte $14   ; 
- D 1 - I - 0x00ED39 03:AD29: 01        .byte $01   ; 
- D 1 - I - 0x00ED3A 03:AD2A: 02        .byte $02   ; 
- D 1 - I - 0x00ED3B 03:AD2B: 03        .byte $03   ; 
- D 1 - I - 0x00ED3C 03:AD2C: 04        .byte $04   ; 
- D 1 - I - 0x00ED3D 03:AD2D: 05        .byte $05   ; 
- D 1 - I - 0x00ED3E 03:AD2E: 06        .byte $06   ; 
- D 1 - I - 0x00ED3F 03:AD2F: 07        .byte $07   ; 
- D 1 - I - 0x00ED40 03:AD30: 04        .byte $04   ; 
- D 1 - I - 0x00ED41 03:AD31: 05        .byte $05   ; 
- D 1 - I - 0x00ED42 03:AD32: 06        .byte $06   ; 
- D 1 - I - 0x00ED43 03:AD33: 07        .byte $07   ; 
- D 1 - I - 0x00ED44 03:AD34: 08        .byte $08   ; 
- D 1 - I - 0x00ED45 03:AD35: 09        .byte $09   ; 
- D 1 - I - 0x00ED46 03:AD36: 0A        .byte $0A   ; 
- D 1 - I - 0x00ED47 03:AD37: 0B        .byte $0B   ; 
- D 1 - I - 0x00ED48 03:AD38: 08        .byte $08   ; 
- D 1 - I - 0x00ED49 03:AD39: 09        .byte $09   ; 
- D 1 - I - 0x00ED4A 03:AD3A: 0A        .byte $0A   ; 
- D 1 - I - 0x00ED4B 03:AD3B: 0B        .byte $0B   ; 
- D 1 - I - 0x00ED4C 03:AD3C: 0C        .byte $0C   ; 
- D 1 - I - 0x00ED4D 03:AD3D: 0D        .byte $0D   ; 
- D 1 - I - 0x00ED4E 03:AD3E: 0E        .byte $0E   ; 
- D 1 - I - 0x00ED4F 03:AD3F: 0F        .byte $0F   ; 
- D 1 - I - 0x00ED50 03:AD40: 0C        .byte $0C   ; 
- D 1 - I - 0x00ED51 03:AD41: 0D        .byte $0D   ; 
- D 1 - I - 0x00ED52 03:AD42: 0E        .byte $0E   ; 
- D 1 - I - 0x00ED53 03:AD43: 0F        .byte $0F   ; 
- D 1 - I - 0x00ED54 03:AD44: 1C        .byte $1C   ; 
- D 1 - I - 0x00ED55 03:AD45: 1A        .byte $1A   ; 
- D 1 - I - 0x00ED56 03:AD46: 19        .byte $19   ; 
- D 1 - I - 0x00ED57 03:AD47: 1A        .byte $1A   ; 
- D 1 - I - 0x00ED58 03:AD48: 1C        .byte $1C   ; 
- D 1 - I - 0x00ED59 03:AD49: 1A        .byte $1A   ; 
- D 1 - I - 0x00ED5A 03:AD4A: 1B        .byte $1B   ; 
- D 1 - I - 0x00ED5B 03:AD4B: 13        .byte $13   ; 
- D 1 - I - 0x00ED5C 03:AD4C: 1F        .byte $1F   ; 
- D 1 - I - 0x00ED5D 03:AD4D: 1F        .byte $1F   ; 
- D 1 - I - 0x00ED5E 03:AD4E: 1F        .byte $1F   ; 
- D 1 - I - 0x00ED5F 03:AD4F: 1F        .byte $1F   ; 
- D 1 - I - 0x00ED60 03:AD50: 1F        .byte $1F   ; 
- D 1 - I - 0x00ED61 03:AD51: 1F        .byte $1F   ; 
- D 1 - I - 0x00ED62 03:AD52: 20        .byte $20   ; 
- D 1 - I - 0x00ED63 03:AD53: 21        .byte $21   ; 
- D 1 - I - 0x00ED64 03:AD54: 24        .byte $24   ; 
- D 1 - I - 0x00ED65 03:AD55: 24        .byte $24   ; 
- D 1 - I - 0x00ED66 03:AD56: 24        .byte $24   ; 
- D 1 - I - 0x00ED67 03:AD57: 24        .byte $24   ; 
- D 1 - I - 0x00ED68 03:AD58: 24        .byte $24   ; 
- D 1 - I - 0x00ED69 03:AD59: 24        .byte $24   ; 
- D 1 - I - 0x00ED6A 03:AD5A: 25        .byte $25   ; 
- D 1 - I - 0x00ED6B 03:AD5B: 26        .byte $26   ; 
- D 1 - I - 0x00ED6C 03:AD5C: 00        .byte $00   ; 
- D 1 - I - 0x00ED6D 03:AD5D: 00        .byte $00   ; 
- D 1 - I - 0x00ED6E 03:AD5E: 00        .byte $00   ; 
- D 1 - I - 0x00ED6F 03:AD5F: 00        .byte $00   ; 
- D 1 - I - 0x00ED70 03:AD60: 00        .byte $00   ; 
- D 1 - I - 0x00ED71 03:AD61: 00        .byte $00   ; 
- D 1 - I - 0x00ED72 03:AD62: 00        .byte $00   ; 
- D 1 - I - 0x00ED73 03:AD63: 00        .byte $00   ; 



_off018_02_AD64_07:
- D 1 - I - 0x00ED74 03:AD64: 14        .byte $14   ; 
- D 1 - I - 0x00ED75 03:AD65: 01        .byte $01   ; 
- D 1 - I - 0x00ED76 03:AD66: 02        .byte $02   ; 
- D 1 - I - 0x00ED77 03:AD67: 03        .byte $03   ; 
- D 1 - I - 0x00ED78 03:AD68: 14        .byte $14   ; 
- D 1 - I - 0x00ED79 03:AD69: 01        .byte $01   ; 
- D 1 - I - 0x00ED7A 03:AD6A: 02        .byte $02   ; 
- D 1 - I - 0x00ED7B 03:AD6B: 03        .byte $03   ; 
- D 1 - I - 0x00ED7C 03:AD6C: 04        .byte $04   ; 
- D 1 - I - 0x00ED7D 03:AD6D: 05        .byte $05   ; 
- D 1 - I - 0x00ED7E 03:AD6E: 06        .byte $06   ; 
- D 1 - I - 0x00ED7F 03:AD6F: 07        .byte $07   ; 
- D 1 - I - 0x00ED80 03:AD70: 04        .byte $04   ; 
- D 1 - I - 0x00ED81 03:AD71: 05        .byte $05   ; 
- D 1 - I - 0x00ED82 03:AD72: 06        .byte $06   ; 
- D 1 - I - 0x00ED83 03:AD73: 07        .byte $07   ; 
- D 1 - I - 0x00ED84 03:AD74: 08        .byte $08   ; 
- D 1 - I - 0x00ED85 03:AD75: 09        .byte $09   ; 
- D 1 - I - 0x00ED86 03:AD76: 0A        .byte $0A   ; 
- D 1 - I - 0x00ED87 03:AD77: 0B        .byte $0B   ; 
- D 1 - I - 0x00ED88 03:AD78: 08        .byte $08   ; 
- D 1 - I - 0x00ED89 03:AD79: 09        .byte $09   ; 
- D 1 - I - 0x00ED8A 03:AD7A: 0A        .byte $0A   ; 
- D 1 - I - 0x00ED8B 03:AD7B: 0B        .byte $0B   ; 
- D 1 - I - 0x00ED8C 03:AD7C: 0C        .byte $0C   ; 
- D 1 - I - 0x00ED8D 03:AD7D: 0D        .byte $0D   ; 
- D 1 - I - 0x00ED8E 03:AD7E: 0E        .byte $0E   ; 
- D 1 - I - 0x00ED8F 03:AD7F: 0F        .byte $0F   ; 
- D 1 - I - 0x00ED90 03:AD80: 0C        .byte $0C   ; 
- D 1 - I - 0x00ED91 03:AD81: 0D        .byte $0D   ; 
- D 1 - I - 0x00ED92 03:AD82: 0E        .byte $0E   ; 
- D 1 - I - 0x00ED93 03:AD83: 0F        .byte $0F   ; 
- D 1 - I - 0x00ED94 03:AD84: 10        .byte $10   ; 
- D 1 - I - 0x00ED95 03:AD85: 18        .byte $18   ; 
- D 1 - I - 0x00ED96 03:AD86: 19        .byte $19   ; 
- D 1 - I - 0x00ED97 03:AD87: 1A        .byte $1A   ; 
- D 1 - I - 0x00ED98 03:AD88: 1C        .byte $1C   ; 
- D 1 - I - 0x00ED99 03:AD89: 1A        .byte $1A   ; 
- D 1 - I - 0x00ED9A 03:AD8A: 19        .byte $19   ; 
- D 1 - I - 0x00ED9B 03:AD8B: 1A        .byte $1A   ; 
- D 1 - I - 0x00ED9C 03:AD8C: 1D        .byte $1D   ; 
- D 1 - I - 0x00ED9D 03:AD8D: 1E        .byte $1E   ; 
- D 1 - I - 0x00ED9E 03:AD8E: 1F        .byte $1F   ; 
- D 1 - I - 0x00ED9F 03:AD8F: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDA0 03:AD90: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDA1 03:AD91: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDA2 03:AD92: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDA3 03:AD93: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDA4 03:AD94: 22        .byte $22   ; 
- D 1 - I - 0x00EDA5 03:AD95: 23        .byte $23   ; 
- D 1 - I - 0x00EDA6 03:AD96: 24        .byte $24   ; 
- D 1 - I - 0x00EDA7 03:AD97: 24        .byte $24   ; 
- D 1 - I - 0x00EDA8 03:AD98: 24        .byte $24   ; 
- D 1 - I - 0x00EDA9 03:AD99: 24        .byte $24   ; 
- D 1 - I - 0x00EDAA 03:AD9A: 24        .byte $24   ; 
- D 1 - I - 0x00EDAB 03:AD9B: 24        .byte $24   ; 
- D 1 - I - 0x00EDAC 03:AD9C: 00        .byte $00   ; 
- D 1 - I - 0x00EDAD 03:AD9D: 00        .byte $00   ; 
- D 1 - I - 0x00EDAE 03:AD9E: 00        .byte $00   ; 
- D 1 - I - 0x00EDAF 03:AD9F: 00        .byte $00   ; 
- D 1 - I - 0x00EDB0 03:ADA0: 00        .byte $00   ; 
- D 1 - I - 0x00EDB1 03:ADA1: 00        .byte $00   ; 
- D 1 - I - 0x00EDB2 03:ADA2: 00        .byte $00   ; 
- D 1 - I - 0x00EDB3 03:ADA3: 00        .byte $00   ; 



_off018_02_ADA4_08:
- D 1 - I - 0x00EDB4 03:ADA4: 14        .byte $14   ; 
- D 1 - I - 0x00EDB5 03:ADA5: 01        .byte $01   ; 
- D 1 - I - 0x00EDB6 03:ADA6: 02        .byte $02   ; 
- D 1 - I - 0x00EDB7 03:ADA7: 03        .byte $03   ; 
- D 1 - I - 0x00EDB8 03:ADA8: 14        .byte $14   ; 
- D 1 - I - 0x00EDB9 03:ADA9: 01        .byte $01   ; 
- D 1 - I - 0x00EDBA 03:ADAA: 02        .byte $02   ; 
- D 1 - I - 0x00EDBB 03:ADAB: 03        .byte $03   ; 
- D 1 - I - 0x00EDBC 03:ADAC: 04        .byte $04   ; 
- D 1 - I - 0x00EDBD 03:ADAD: 05        .byte $05   ; 
- D 1 - I - 0x00EDBE 03:ADAE: 06        .byte $06   ; 
- D 1 - I - 0x00EDBF 03:ADAF: 07        .byte $07   ; 
- D 1 - I - 0x00EDC0 03:ADB0: 04        .byte $04   ; 
- D 1 - I - 0x00EDC1 03:ADB1: 05        .byte $05   ; 
- D 1 - I - 0x00EDC2 03:ADB2: 06        .byte $06   ; 
- D 1 - I - 0x00EDC3 03:ADB3: 07        .byte $07   ; 
- D 1 - I - 0x00EDC4 03:ADB4: 08        .byte $08   ; 
- D 1 - I - 0x00EDC5 03:ADB5: 09        .byte $09   ; 
- D 1 - I - 0x00EDC6 03:ADB6: 0A        .byte $0A   ; 
- D 1 - I - 0x00EDC7 03:ADB7: 0B        .byte $0B   ; 
- D 1 - I - 0x00EDC8 03:ADB8: 08        .byte $08   ; 
- D 1 - I - 0x00EDC9 03:ADB9: 09        .byte $09   ; 
- D 1 - I - 0x00EDCA 03:ADBA: 0A        .byte $0A   ; 
- D 1 - I - 0x00EDCB 03:ADBB: 0B        .byte $0B   ; 
- D 1 - I - 0x00EDCC 03:ADBC: 0C        .byte $0C   ; 
- D 1 - I - 0x00EDCD 03:ADBD: 0D        .byte $0D   ; 
- D 1 - I - 0x00EDCE 03:ADBE: 0E        .byte $0E   ; 
- D 1 - I - 0x00EDCF 03:ADBF: 0F        .byte $0F   ; 
- D 1 - I - 0x00EDD0 03:ADC0: 0C        .byte $0C   ; 
- D 1 - I - 0x00EDD1 03:ADC1: 0D        .byte $0D   ; 
- D 1 - I - 0x00EDD2 03:ADC2: 0E        .byte $0E   ; 
- D 1 - I - 0x00EDD3 03:ADC3: 0F        .byte $0F   ; 
- D 1 - I - 0x00EDD4 03:ADC4: 1C        .byte $1C   ; 
- D 1 - I - 0x00EDD5 03:ADC5: 1A        .byte $1A   ; 
- D 1 - I - 0x00EDD6 03:ADC6: 19        .byte $19   ; 
- D 1 - I - 0x00EDD7 03:ADC7: 1A        .byte $1A   ; 
- D 1 - I - 0x00EDD8 03:ADC8: 1C        .byte $1C   ; 
- D 1 - I - 0x00EDD9 03:ADC9: 1A        .byte $1A   ; 
- D 1 - I - 0x00EDDA 03:ADCA: 19        .byte $19   ; 
- D 1 - I - 0x00EDDB 03:ADCB: 1A        .byte $1A   ; 
- D 1 - I - 0x00EDDC 03:ADCC: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDDD 03:ADCD: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDDE 03:ADCE: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDDF 03:ADCF: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDE0 03:ADD0: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDE1 03:ADD1: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDE2 03:ADD2: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDE3 03:ADD3: 1F        .byte $1F   ; 
- D 1 - I - 0x00EDE4 03:ADD4: 24        .byte $24   ; 
- D 1 - I - 0x00EDE5 03:ADD5: 24        .byte $24   ; 
- D 1 - I - 0x00EDE6 03:ADD6: 24        .byte $24   ; 
- D 1 - I - 0x00EDE7 03:ADD7: 24        .byte $24   ; 
- D 1 - I - 0x00EDE8 03:ADD8: 24        .byte $24   ; 
- D 1 - I - 0x00EDE9 03:ADD9: 24        .byte $24   ; 
- D 1 - I - 0x00EDEA 03:ADDA: 24        .byte $24   ; 
- D 1 - I - 0x00EDEB 03:ADDB: 24        .byte $24   ; 
- D 1 - I - 0x00EDEC 03:ADDC: 00        .byte $00   ; 
- D 1 - I - 0x00EDED 03:ADDD: 00        .byte $00   ; 
- D 1 - I - 0x00EDEE 03:ADDE: 00        .byte $00   ; 
- D 1 - I - 0x00EDEF 03:ADDF: 00        .byte $00   ; 
- D 1 - I - 0x00EDF0 03:ADE0: 00        .byte $00   ; 
- D 1 - I - 0x00EDF1 03:ADE1: 00        .byte $00   ; 
- D 1 - I - 0x00EDF2 03:ADE2: 00        .byte $00   ; 
- D 1 - I - 0x00EDF3 03:ADE3: 00        .byte $00   ; 



_off018_02_ADE4_09:
- D 1 - I - 0x00EDF4 03:ADE4: 14        .byte $14   ; 
- D 1 - I - 0x00EDF5 03:ADE5: 01        .byte $01   ; 
- D 1 - I - 0x00EDF6 03:ADE6: 02        .byte $02   ; 
- D 1 - I - 0x00EDF7 03:ADE7: 03        .byte $03   ; 
- D 1 - I - 0x00EDF8 03:ADE8: 14        .byte $14   ; 
- D 1 - I - 0x00EDF9 03:ADE9: 01        .byte $01   ; 
- D 1 - I - 0x00EDFA 03:ADEA: 02        .byte $02   ; 
- D 1 - I - 0x00EDFB 03:ADEB: 03        .byte $03   ; 
- D 1 - I - 0x00EDFC 03:ADEC: 04        .byte $04   ; 
- D 1 - I - 0x00EDFD 03:ADED: 05        .byte $05   ; 
- D 1 - I - 0x00EDFE 03:ADEE: 06        .byte $06   ; 
- D 1 - I - 0x00EDFF 03:ADEF: 07        .byte $07   ; 
- D 1 - I - 0x00EE00 03:ADF0: 04        .byte $04   ; 
- D 1 - I - 0x00EE01 03:ADF1: 05        .byte $05   ; 
- D 1 - I - 0x00EE02 03:ADF2: 06        .byte $06   ; 
- D 1 - I - 0x00EE03 03:ADF3: 07        .byte $07   ; 
- D 1 - I - 0x00EE04 03:ADF4: 08        .byte $08   ; 
- D 1 - I - 0x00EE05 03:ADF5: 09        .byte $09   ; 
- D 1 - I - 0x00EE06 03:ADF6: 0A        .byte $0A   ; 
- D 1 - I - 0x00EE07 03:ADF7: 0B        .byte $0B   ; 
- D 1 - I - 0x00EE08 03:ADF8: 08        .byte $08   ; 
- D 1 - I - 0x00EE09 03:ADF9: 09        .byte $09   ; 
- D 1 - I - 0x00EE0A 03:ADFA: 0A        .byte $0A   ; 
- D 1 - I - 0x00EE0B 03:ADFB: 0B        .byte $0B   ; 
- D 1 - I - 0x00EE0C 03:ADFC: 0C        .byte $0C   ; 
- D 1 - I - 0x00EE0D 03:ADFD: 0D        .byte $0D   ; 
- D 1 - I - 0x00EE0E 03:ADFE: 0E        .byte $0E   ; 
- D 1 - I - 0x00EE0F 03:ADFF: 0F        .byte $0F   ; 
- D 1 - I - 0x00EE10 03:AE00: 0C        .byte $0C   ; 
- D 1 - I - 0x00EE11 03:AE01: 0D        .byte $0D   ; 
- D 1 - I - 0x00EE12 03:AE02: 0E        .byte $0E   ; 
- D 1 - I - 0x00EE13 03:AE03: 0F        .byte $0F   ; 
- D 1 - I - 0x00EE14 03:AE04: 1C        .byte $1C   ; 
- D 1 - I - 0x00EE15 03:AE05: 1A        .byte $1A   ; 
- D 1 - I - 0x00EE16 03:AE06: 1B        .byte $1B   ; 
- D 1 - I - 0x00EE17 03:AE07: 13        .byte $13   ; 
- D 1 - I - 0x00EE18 03:AE08: 10        .byte $10   ; 
- D 1 - I - 0x00EE19 03:AE09: 11        .byte $11   ; 
- D 1 - I - 0x00EE1A 03:AE0A: 12        .byte $12   ; 
- D 1 - I - 0x00EE1B 03:AE0B: 13        .byte $13   ; 
- D 1 - I - 0x00EE1C 03:AE0C: 1F        .byte $1F   ; 
- D 1 - I - 0x00EE1D 03:AE0D: 1F        .byte $1F   ; 
- D 1 - I - 0x00EE1E 03:AE0E: 20        .byte $20   ; 
- D 1 - I - 0x00EE1F 03:AE0F: 21        .byte $21   ; 
- D 1 - I - 0x00EE20 03:AE10: 15        .byte $15   ; 
- D 1 - I - 0x00EE21 03:AE11: 15        .byte $15   ; 
- D 1 - I - 0x00EE22 03:AE12: 15        .byte $15   ; 
- D 1 - I - 0x00EE23 03:AE13: 15        .byte $15   ; 
- D 1 - I - 0x00EE24 03:AE14: 24        .byte $24   ; 
- D 1 - I - 0x00EE25 03:AE15: 24        .byte $24   ; 
- D 1 - I - 0x00EE26 03:AE16: 25        .byte $25   ; 
- D 1 - I - 0x00EE27 03:AE17: 26        .byte $26   ; 
- D 1 - I - 0x00EE28 03:AE18: 16        .byte $16   ; 
- D 1 - I - 0x00EE29 03:AE19: 16        .byte $16   ; 
- D 1 - I - 0x00EE2A 03:AE1A: 16        .byte $16   ; 
- D 1 - I - 0x00EE2B 03:AE1B: 16        .byte $16   ; 
- D 1 - I - 0x00EE2C 03:AE1C: 00        .byte $00   ; 
- D 1 - I - 0x00EE2D 03:AE1D: 00        .byte $00   ; 
- D 1 - I - 0x00EE2E 03:AE1E: 00        .byte $00   ; 
- D 1 - I - 0x00EE2F 03:AE1F: 00        .byte $00   ; 
- D 1 - I - 0x00EE30 03:AE20: 00        .byte $00   ; 
- D 1 - I - 0x00EE31 03:AE21: 00        .byte $00   ; 
- D 1 - I - 0x00EE32 03:AE22: 00        .byte $00   ; 
- D 1 - I - 0x00EE33 03:AE23: 00        .byte $00   ; 



_off018_02_AE24_0A:
- D 1 - I - 0x00EE34 03:AE24: 14        .byte $14   ; 
- D 1 - I - 0x00EE35 03:AE25: 01        .byte $01   ; 
- D 1 - I - 0x00EE36 03:AE26: 02        .byte $02   ; 
- D 1 - I - 0x00EE37 03:AE27: 03        .byte $03   ; 
- D 1 - I - 0x00EE38 03:AE28: 14        .byte $14   ; 
- D 1 - I - 0x00EE39 03:AE29: 01        .byte $01   ; 
- D 1 - I - 0x00EE3A 03:AE2A: 02        .byte $02   ; 
- D 1 - I - 0x00EE3B 03:AE2B: 03        .byte $03   ; 
- D 1 - I - 0x00EE3C 03:AE2C: 04        .byte $04   ; 
- D 1 - I - 0x00EE3D 03:AE2D: 05        .byte $05   ; 
- D 1 - I - 0x00EE3E 03:AE2E: 06        .byte $06   ; 
- D 1 - I - 0x00EE3F 03:AE2F: 07        .byte $07   ; 
- D 1 - I - 0x00EE40 03:AE30: 04        .byte $04   ; 
- D 1 - I - 0x00EE41 03:AE31: 05        .byte $05   ; 
- D 1 - I - 0x00EE42 03:AE32: 06        .byte $06   ; 
- D 1 - I - 0x00EE43 03:AE33: 07        .byte $07   ; 
- D 1 - I - 0x00EE44 03:AE34: 08        .byte $08   ; 
- D 1 - I - 0x00EE45 03:AE35: 09        .byte $09   ; 
- D 1 - I - 0x00EE46 03:AE36: 0A        .byte $0A   ; 
- D 1 - I - 0x00EE47 03:AE37: 0B        .byte $0B   ; 
- D 1 - I - 0x00EE48 03:AE38: 08        .byte $08   ; 
- D 1 - I - 0x00EE49 03:AE39: 09        .byte $09   ; 
- D 1 - I - 0x00EE4A 03:AE3A: 0A        .byte $0A   ; 
- D 1 - I - 0x00EE4B 03:AE3B: 0B        .byte $0B   ; 
- D 1 - I - 0x00EE4C 03:AE3C: 0C        .byte $0C   ; 
- D 1 - I - 0x00EE4D 03:AE3D: 0D        .byte $0D   ; 
- D 1 - I - 0x00EE4E 03:AE3E: 0E        .byte $0E   ; 
- D 1 - I - 0x00EE4F 03:AE3F: 0F        .byte $0F   ; 
- D 1 - I - 0x00EE50 03:AE40: 0C        .byte $0C   ; 
- D 1 - I - 0x00EE51 03:AE41: 0D        .byte $0D   ; 
- D 1 - I - 0x00EE52 03:AE42: 0E        .byte $0E   ; 
- D 1 - I - 0x00EE53 03:AE43: 0F        .byte $0F   ; 
- D 1 - I - 0x00EE54 03:AE44: 10        .byte $10   ; 
- D 1 - I - 0x00EE55 03:AE45: 11        .byte $11   ; 
- D 1 - I - 0x00EE56 03:AE46: 12        .byte $12   ; 
- D 1 - I - 0x00EE57 03:AE47: 13        .byte $13   ; 
- D 1 - I - 0x00EE58 03:AE48: 10        .byte $10   ; 
- D 1 - I - 0x00EE59 03:AE49: 11        .byte $11   ; 
- D 1 - I - 0x00EE5A 03:AE4A: 12        .byte $12   ; 
- D 1 - I - 0x00EE5B 03:AE4B: 13        .byte $13   ; 
- D 1 - I - 0x00EE5C 03:AE4C: 15        .byte $15   ; 
- D 1 - I - 0x00EE5D 03:AE4D: 15        .byte $15   ; 
- D 1 - I - 0x00EE5E 03:AE4E: 15        .byte $15   ; 
- D 1 - I - 0x00EE5F 03:AE4F: 15        .byte $15   ; 
- D 1 - I - 0x00EE60 03:AE50: 15        .byte $15   ; 
- D 1 - I - 0x00EE61 03:AE51: 15        .byte $15   ; 
- D 1 - I - 0x00EE62 03:AE52: 15        .byte $15   ; 
- D 1 - I - 0x00EE63 03:AE53: 15        .byte $15   ; 
- D 1 - I - 0x00EE64 03:AE54: 16        .byte $16   ; 
- D 1 - I - 0x00EE65 03:AE55: 16        .byte $16   ; 
- D 1 - I - 0x00EE66 03:AE56: 16        .byte $16   ; 
- D 1 - I - 0x00EE67 03:AE57: 16        .byte $16   ; 
- D 1 - I - 0x00EE68 03:AE58: 16        .byte $16   ; 
- D 1 - I - 0x00EE69 03:AE59: 44        .byte $44   ; 
- D 1 - I - 0x00EE6A 03:AE5A: 35        .byte $35   ; 
- D 1 - I - 0x00EE6B 03:AE5B: 35        .byte $35   ; 
- D 1 - I - 0x00EE6C 03:AE5C: 00        .byte $00   ; 
- D 1 - I - 0x00EE6D 03:AE5D: 00        .byte $00   ; 
- D 1 - I - 0x00EE6E 03:AE5E: 00        .byte $00   ; 
- D 1 - I - 0x00EE6F 03:AE5F: 00        .byte $00   ; 
- D 1 - I - 0x00EE70 03:AE60: 00        .byte $00   ; 
- D 1 - I - 0x00EE71 03:AE61: 45        .byte $45   ; 
- D 1 - I - 0x00EE72 03:AE62: 39        .byte $39   ; 
- D 1 - I - 0x00EE73 03:AE63: 39        .byte $39   ; 



_off018_02_AE64_0B:
- D 1 - I - 0x00EE74 03:AE64: 14        .byte $14   ; 
- D 1 - I - 0x00EE75 03:AE65: 01        .byte $01   ; 
- D 1 - I - 0x00EE76 03:AE66: 02        .byte $02   ; 
- D 1 - I - 0x00EE77 03:AE67: 34        .byte $34   ; 
- D 1 - I - 0x00EE78 03:AE68: 00        .byte $00   ; 
- D 1 - I - 0x00EE79 03:AE69: 00        .byte $00   ; 
- D 1 - I - 0x00EE7A 03:AE6A: 00        .byte $00   ; 
- D 1 - I - 0x00EE7B 03:AE6B: 00        .byte $00   ; 
- D 1 - I - 0x00EE7C 03:AE6C: 04        .byte $04   ; 
- D 1 - I - 0x00EE7D 03:AE6D: 05        .byte $05   ; 
- D 1 - I - 0x00EE7E 03:AE6E: 06        .byte $06   ; 
- D 1 - I - 0x00EE7F 03:AE6F: 38        .byte $38   ; 
- D 1 - I - 0x00EE80 03:AE70: 00        .byte $00   ; 
- D 1 - I - 0x00EE81 03:AE71: 00        .byte $00   ; 
- D 1 - I - 0x00EE82 03:AE72: 00        .byte $00   ; 
- D 1 - I - 0x00EE83 03:AE73: 00        .byte $00   ; 
- D 1 - I - 0x00EE84 03:AE74: 08        .byte $08   ; 
- D 1 - I - 0x00EE85 03:AE75: 09        .byte $09   ; 
- D 1 - I - 0x00EE86 03:AE76: 0A        .byte $0A   ; 
- D 1 - I - 0x00EE87 03:AE77: 00        .byte $00   ; 
- D 1 - I - 0x00EE88 03:AE78: 00        .byte $00   ; 
- D 1 - I - 0x00EE89 03:AE79: 00        .byte $00   ; 
- D 1 - I - 0x00EE8A 03:AE7A: 00        .byte $00   ; 
- D 1 - I - 0x00EE8B 03:AE7B: 00        .byte $00   ; 
- D 1 - I - 0x00EE8C 03:AE7C: 0C        .byte $0C   ; 
- D 1 - I - 0x00EE8D 03:AE7D: 0D        .byte $0D   ; 
- D 1 - I - 0x00EE8E 03:AE7E: 0E        .byte $0E   ; 
- D 1 - I - 0x00EE8F 03:AE7F: 00        .byte $00   ; 
- D 1 - I - 0x00EE90 03:AE80: 00        .byte $00   ; 
- D 1 - I - 0x00EE91 03:AE81: 00        .byte $00   ; 
- D 1 - I - 0x00EE92 03:AE82: 00        .byte $00   ; 
- D 1 - I - 0x00EE93 03:AE83: 00        .byte $00   ; 
- D 1 - I - 0x00EE94 03:AE84: 10        .byte $10   ; 
- D 1 - I - 0x00EE95 03:AE85: 11        .byte $11   ; 
- D 1 - I - 0x00EE96 03:AE86: 12        .byte $12   ; 
- D 1 - I - 0x00EE97 03:AE87: 00        .byte $00   ; 
- D 1 - I - 0x00EE98 03:AE88: 00        .byte $00   ; 
- D 1 - I - 0x00EE99 03:AE89: 00        .byte $00   ; 
- D 1 - I - 0x00EE9A 03:AE8A: 00        .byte $00   ; 
- D 1 - I - 0x00EE9B 03:AE8B: 00        .byte $00   ; 
- D 1 - I - 0x00EE9C 03:AE8C: 15        .byte $15   ; 
- D 1 - I - 0x00EE9D 03:AE8D: 15        .byte $15   ; 
- D 1 - I - 0x00EE9E 03:AE8E: 15        .byte $15   ; 
- D 1 - I - 0x00EE9F 03:AE8F: 27        .byte $27   ; 
- D 1 - I - 0x00EEA0 03:AE90: 31        .byte $31   ; 
- D 1 - I - 0x00EEA1 03:AE91: 32        .byte $32   ; 
- D 1 - I - 0x00EEA2 03:AE92: 33        .byte $33   ; 
- D 1 - I - 0x00EEA3 03:AE93: 3C        .byte $3C   ; 
- D 1 - I - 0x00EEA4 03:AE94: 17        .byte $17   ; 
- D 1 - I - 0x00EEA5 03:AE95: 29        .byte $29   ; 
- D 1 - I - 0x00EEA6 03:AE96: 2A        .byte $2A   ; 
- D 1 - I - 0x00EEA7 03:AE97: 2B        .byte $2B   ; 
- D 1 - I - 0x00EEA8 03:AE98: 30        .byte $30   ; 
- D 1 - I - 0x00EEA9 03:AE99: 00        .byte $00   ; 
- D 1 - I - 0x00EEAA 03:AE9A: 36        .byte $36   ; 
- D 1 - I - 0x00EEAB 03:AE9B: 37        .byte $37   ; 
- D 1 - I - 0x00EEAC 03:AE9C: 2C        .byte $2C   ; 
- D 1 - I - 0x00EEAD 03:AE9D: 2D        .byte $2D   ; 
- D 1 - I - 0x00EEAE 03:AE9E: 2E        .byte $2E   ; 
- D 1 - I - 0x00EEAF 03:AE9F: 2F        .byte $2F   ; 
- D 1 - I - 0x00EEB0 03:AEA0: 28        .byte $28   ; 
- D 1 - I - 0x00EEB1 03:AEA1: 00        .byte $00   ; 
- D 1 - I - 0x00EEB2 03:AEA2: 3A        .byte $3A   ; 
- D 1 - I - 0x00EEB3 03:AEA3: 3B        .byte $3B   ; 



_off018_02_AEA4_0C:
- D 1 - I - 0x00EEB4 03:AEA4: 00        .byte $00   ; 
- D 1 - I - 0x00EEB5 03:AEA5: 00        .byte $00   ; 
- D 1 - I - 0x00EEB6 03:AEA6: 00        .byte $00   ; 
- D 1 - I - 0x00EEB7 03:AEA7: 00        .byte $00   ; 
- D 1 - I - 0x00EEB8 03:AEA8: 00        .byte $00   ; 
- D 1 - I - 0x00EEB9 03:AEA9: 00        .byte $00   ; 
- D 1 - I - 0x00EEBA 03:AEAA: 00        .byte $00   ; 
- D 1 - I - 0x00EEBB 03:AEAB: 00        .byte $00   ; 
- D 1 - I - 0x00EEBC 03:AEAC: 00        .byte $00   ; 
- D 1 - I - 0x00EEBD 03:AEAD: 00        .byte $00   ; 
- D 1 - I - 0x00EEBE 03:AEAE: 00        .byte $00   ; 
- D 1 - I - 0x00EEBF 03:AEAF: 00        .byte $00   ; 
- D 1 - I - 0x00EEC0 03:AEB0: 00        .byte $00   ; 
- D 1 - I - 0x00EEC1 03:AEB1: 00        .byte $00   ; 
- D 1 - I - 0x00EEC2 03:AEB2: 00        .byte $00   ; 
- D 1 - I - 0x00EEC3 03:AEB3: 00        .byte $00   ; 
- D 1 - I - 0x00EEC4 03:AEB4: 00        .byte $00   ; 
- D 1 - I - 0x00EEC5 03:AEB5: 00        .byte $00   ; 
- D 1 - I - 0x00EEC6 03:AEB6: 00        .byte $00   ; 
- D 1 - I - 0x00EEC7 03:AEB7: 00        .byte $00   ; 
- D 1 - I - 0x00EEC8 03:AEB8: 00        .byte $00   ; 
- D 1 - I - 0x00EEC9 03:AEB9: 00        .byte $00   ; 
- D 1 - I - 0x00EECA 03:AEBA: 00        .byte $00   ; 
- D 1 - I - 0x00EECB 03:AEBB: 00        .byte $00   ; 
- D 1 - I - 0x00EECC 03:AEBC: 00        .byte $00   ; 
- D 1 - I - 0x00EECD 03:AEBD: 00        .byte $00   ; 
- D 1 - I - 0x00EECE 03:AEBE: 00        .byte $00   ; 
- D 1 - I - 0x00EECF 03:AEBF: 00        .byte $00   ; 
- D 1 - I - 0x00EED0 03:AEC0: 00        .byte $00   ; 
- D 1 - I - 0x00EED1 03:AEC1: 00        .byte $00   ; 
- D 1 - I - 0x00EED2 03:AEC2: 00        .byte $00   ; 
- D 1 - I - 0x00EED3 03:AEC3: 00        .byte $00   ; 
- D 1 - I - 0x00EED4 03:AEC4: 00        .byte $00   ; 
- D 1 - I - 0x00EED5 03:AEC5: 00        .byte $00   ; 
- D 1 - I - 0x00EED6 03:AEC6: 00        .byte $00   ; 
- D 1 - I - 0x00EED7 03:AEC7: 00        .byte $00   ; 
- D 1 - I - 0x00EED8 03:AEC8: 00        .byte $00   ; 
- D 1 - I - 0x00EED9 03:AEC9: 00        .byte $00   ; 
- D 1 - I - 0x00EEDA 03:AECA: 00        .byte $00   ; 
- D 1 - I - 0x00EEDB 03:AECB: 00        .byte $00   ; 
- D 1 - I - 0x00EEDC 03:AECC: 3C        .byte $3C   ; 
- D 1 - I - 0x00EEDD 03:AECD: 3C        .byte $3C   ; 
- D 1 - I - 0x00EEDE 03:AECE: 3C        .byte $3C   ; 
- D 1 - I - 0x00EEDF 03:AECF: 3C        .byte $3C   ; 
- D 1 - I - 0x00EEE0 03:AED0: 3C        .byte $3C   ; 
- D 1 - I - 0x00EEE1 03:AED1: 3C        .byte $3C   ; 
- D 1 - I - 0x00EEE2 03:AED2: 3C        .byte $3C   ; 
- D 1 - I - 0x00EEE3 03:AED3: 3C        .byte $3C   ; 
- D 1 - I - 0x00EEE4 03:AED4: 3D        .byte $3D   ; 
- D 1 - I - 0x00EEE5 03:AED5: 3D        .byte $3D   ; 
- D 1 - I - 0x00EEE6 03:AED6: 3D        .byte $3D   ; 
- D 1 - I - 0x00EEE7 03:AED7: 3D        .byte $3D   ; 
- D 1 - I - 0x00EEE8 03:AED8: 3D        .byte $3D   ; 
- D 1 - I - 0x00EEE9 03:AED9: 3D        .byte $3D   ; 
- D 1 - I - 0x00EEEA 03:AEDA: 3D        .byte $3D   ; 
- D 1 - I - 0x00EEEB 03:AEDB: 3D        .byte $3D   ; 
- D 1 - I - 0x00EEEC 03:AEDC: 3B        .byte $3B   ; 
- D 1 - I - 0x00EEED 03:AEDD: 3B        .byte $3B   ; 
- D 1 - I - 0x00EEEE 03:AEDE: 3B        .byte $3B   ; 
- D 1 - I - 0x00EEEF 03:AEDF: 3B        .byte $3B   ; 
- D 1 - I - 0x00EEF0 03:AEE0: 3B        .byte $3B   ; 
- D 1 - I - 0x00EEF1 03:AEE1: 3B        .byte $3B   ; 
- D 1 - I - 0x00EEF2 03:AEE2: 3B        .byte $3B   ; 
- D 1 - I - 0x00EEF3 03:AEE3: 3B        .byte $3B   ; 



_off018_02_AEE4_0D:
- D 1 - I - 0x00EEF4 03:AEE4: 00        .byte $00   ; 
- D 1 - I - 0x00EEF5 03:AEE5: 00        .byte $00   ; 
- D 1 - I - 0x00EEF6 03:AEE6: 00        .byte $00   ; 
- D 1 - I - 0x00EEF7 03:AEE7: 00        .byte $00   ; 
- D 1 - I - 0x00EEF8 03:AEE8: 00        .byte $00   ; 
- D 1 - I - 0x00EEF9 03:AEE9: 00        .byte $00   ; 
- D 1 - I - 0x00EEFA 03:AEEA: 00        .byte $00   ; 
- D 1 - I - 0x00EEFB 03:AEEB: 00        .byte $00   ; 
- D 1 - I - 0x00EEFC 03:AEEC: 00        .byte $00   ; 
- D 1 - I - 0x00EEFD 03:AEED: 00        .byte $00   ; 
- D 1 - I - 0x00EEFE 03:AEEE: 00        .byte $00   ; 
- D 1 - I - 0x00EEFF 03:AEEF: 00        .byte $00   ; 
- D 1 - I - 0x00EF00 03:AEF0: 00        .byte $00   ; 
- D 1 - I - 0x00EF01 03:AEF1: 00        .byte $00   ; 
- D 1 - I - 0x00EF02 03:AEF2: 00        .byte $00   ; 
- D 1 - I - 0x00EF03 03:AEF3: 00        .byte $00   ; 
- D 1 - I - 0x00EF04 03:AEF4: 00        .byte $00   ; 
- D 1 - I - 0x00EF05 03:AEF5: 00        .byte $00   ; 
- D 1 - I - 0x00EF06 03:AEF6: 00        .byte $00   ; 
- D 1 - I - 0x00EF07 03:AEF7: 00        .byte $00   ; 
- D 1 - I - 0x00EF08 03:AEF8: 00        .byte $00   ; 
- D 1 - I - 0x00EF09 03:AEF9: 00        .byte $00   ; 
- D 1 - I - 0x00EF0A 03:AEFA: 00        .byte $00   ; 
- D 1 - I - 0x00EF0B 03:AEFB: 00        .byte $00   ; 
- D 1 - I - 0x00EF0C 03:AEFC: 00        .byte $00   ; 
- D 1 - I - 0x00EF0D 03:AEFD: 00        .byte $00   ; 
- D 1 - I - 0x00EF0E 03:AEFE: 00        .byte $00   ; 
- D 1 - I - 0x00EF0F 03:AEFF: 00        .byte $00   ; 
- D 1 - I - 0x00EF10 03:AF00: 00        .byte $00   ; 
- D 1 - I - 0x00EF11 03:AF01: 00        .byte $00   ; 
- D 1 - I - 0x00EF12 03:AF02: 00        .byte $00   ; 
- D 1 - I - 0x00EF13 03:AF03: 00        .byte $00   ; 
- D 1 - I - 0x00EF14 03:AF04: 00        .byte $00   ; 
- D 1 - I - 0x00EF15 03:AF05: 00        .byte $00   ; 
- D 1 - I - 0x00EF16 03:AF06: 00        .byte $00   ; 
- D 1 - I - 0x00EF17 03:AF07: 00        .byte $00   ; 
- D 1 - I - 0x00EF18 03:AF08: 00        .byte $00   ; 
- D 1 - I - 0x00EF19 03:AF09: 00        .byte $00   ; 
- D 1 - I - 0x00EF1A 03:AF0A: 00        .byte $00   ; 
- D 1 - I - 0x00EF1B 03:AF0B: 00        .byte $00   ; 
- D 1 - I - 0x00EF1C 03:AF0C: 51        .byte $51   ; 
- D 1 - I - 0x00EF1D 03:AF0D: 52        .byte $52   ; 
- D 1 - I - 0x00EF1E 03:AF0E: 53        .byte $53   ; 
- D 1 - I - 0x00EF1F 03:AF0F: 54        .byte $54   ; 
- D 1 - I - 0x00EF20 03:AF10: 53        .byte $53   ; 
- D 1 - I - 0x00EF21 03:AF11: 54        .byte $54   ; 
- D 1 - I - 0x00EF22 03:AF12: 53        .byte $53   ; 
- D 1 - I - 0x00EF23 03:AF13: 54        .byte $54   ; 
- D 1 - I - 0x00EF24 03:AF14: 57        .byte $57   ; 
- D 1 - I - 0x00EF25 03:AF15: 55        .byte $55   ; 
- D 1 - I - 0x00EF26 03:AF16: 56        .byte $56   ; 
- D 1 - I - 0x00EF27 03:AF17: 55        .byte $55   ; 
- D 1 - I - 0x00EF28 03:AF18: 56        .byte $56   ; 
- D 1 - I - 0x00EF29 03:AF19: 55        .byte $55   ; 
- D 1 - I - 0x00EF2A 03:AF1A: 56        .byte $56   ; 
- D 1 - I - 0x00EF2B 03:AF1B: 55        .byte $55   ; 
- D 1 - I - 0x00EF2C 03:AF1C: 58        .byte $58   ; 
- D 1 - I - 0x00EF2D 03:AF1D: 59        .byte $59   ; 
- D 1 - I - 0x00EF2E 03:AF1E: 5A        .byte $5A   ; 
- D 1 - I - 0x00EF2F 03:AF1F: 59        .byte $59   ; 
- D 1 - I - 0x00EF30 03:AF20: 5A        .byte $5A   ; 
- D 1 - I - 0x00EF31 03:AF21: 59        .byte $59   ; 
- D 1 - I - 0x00EF32 03:AF22: 5A        .byte $5A   ; 
- D 1 - I - 0x00EF33 03:AF23: 59        .byte $59   ; 



_off018_02_AF24_0E:
- D 1 - I - 0x00EF34 03:AF24: 00        .byte $00   ; 
- D 1 - I - 0x00EF35 03:AF25: 00        .byte $00   ; 
- D 1 - I - 0x00EF36 03:AF26: 00        .byte $00   ; 
- D 1 - I - 0x00EF37 03:AF27: 00        .byte $00   ; 
- D 1 - I - 0x00EF38 03:AF28: 00        .byte $00   ; 
- D 1 - I - 0x00EF39 03:AF29: 00        .byte $00   ; 
- D 1 - I - 0x00EF3A 03:AF2A: 00        .byte $00   ; 
- D 1 - I - 0x00EF3B 03:AF2B: 00        .byte $00   ; 
- D 1 - I - 0x00EF3C 03:AF2C: 00        .byte $00   ; 
- D 1 - I - 0x00EF3D 03:AF2D: 00        .byte $00   ; 
- D 1 - I - 0x00EF3E 03:AF2E: 00        .byte $00   ; 
- D 1 - I - 0x00EF3F 03:AF2F: 00        .byte $00   ; 
- D 1 - I - 0x00EF40 03:AF30: 00        .byte $00   ; 
- D 1 - I - 0x00EF41 03:AF31: 00        .byte $00   ; 
- D 1 - I - 0x00EF42 03:AF32: 00        .byte $00   ; 
- D 1 - I - 0x00EF43 03:AF33: 00        .byte $00   ; 
- D 1 - I - 0x00EF44 03:AF34: 00        .byte $00   ; 
- D 1 - I - 0x00EF45 03:AF35: 00        .byte $00   ; 
- D 1 - I - 0x00EF46 03:AF36: 00        .byte $00   ; 
- D 1 - I - 0x00EF47 03:AF37: 00        .byte $00   ; 
- D 1 - I - 0x00EF48 03:AF38: 00        .byte $00   ; 
- D 1 - I - 0x00EF49 03:AF39: 00        .byte $00   ; 
- D 1 - I - 0x00EF4A 03:AF3A: 00        .byte $00   ; 
- D 1 - I - 0x00EF4B 03:AF3B: 00        .byte $00   ; 
- D 1 - I - 0x00EF4C 03:AF3C: 00        .byte $00   ; 
- D 1 - I - 0x00EF4D 03:AF3D: 00        .byte $00   ; 
- D 1 - I - 0x00EF4E 03:AF3E: 00        .byte $00   ; 
- D 1 - I - 0x00EF4F 03:AF3F: 00        .byte $00   ; 
- D 1 - I - 0x00EF50 03:AF40: 00        .byte $00   ; 
- D 1 - I - 0x00EF51 03:AF41: 00        .byte $00   ; 
- D 1 - I - 0x00EF52 03:AF42: 00        .byte $00   ; 
- D 1 - I - 0x00EF53 03:AF43: 00        .byte $00   ; 
- D 1 - I - 0x00EF54 03:AF44: 00        .byte $00   ; 
- D 1 - I - 0x00EF55 03:AF45: 00        .byte $00   ; 
- D 1 - I - 0x00EF56 03:AF46: 00        .byte $00   ; 
- D 1 - I - 0x00EF57 03:AF47: 00        .byte $00   ; 
- D 1 - I - 0x00EF58 03:AF48: 00        .byte $00   ; 
- D 1 - I - 0x00EF59 03:AF49: 00        .byte $00   ; 
- D 1 - I - 0x00EF5A 03:AF4A: 00        .byte $00   ; 
- D 1 - I - 0x00EF5B 03:AF4B: 00        .byte $00   ; 
- D 1 - I - 0x00EF5C 03:AF4C: 53        .byte $53   ; 
- D 1 - I - 0x00EF5D 03:AF4D: 54        .byte $54   ; 
- D 1 - I - 0x00EF5E 03:AF4E: 53        .byte $53   ; 
- D 1 - I - 0x00EF5F 03:AF4F: 54        .byte $54   ; 
- D 1 - I - 0x00EF60 03:AF50: 53        .byte $53   ; 
- D 1 - I - 0x00EF61 03:AF51: 54        .byte $54   ; 
- D 1 - I - 0x00EF62 03:AF52: 53        .byte $53   ; 
- D 1 - I - 0x00EF63 03:AF53: 54        .byte $54   ; 
- D 1 - I - 0x00EF64 03:AF54: 56        .byte $56   ; 
- D 1 - I - 0x00EF65 03:AF55: 55        .byte $55   ; 
- D 1 - I - 0x00EF66 03:AF56: 56        .byte $56   ; 
- D 1 - I - 0x00EF67 03:AF57: 55        .byte $55   ; 
- D 1 - I - 0x00EF68 03:AF58: 56        .byte $56   ; 
- D 1 - I - 0x00EF69 03:AF59: 55        .byte $55   ; 
- D 1 - I - 0x00EF6A 03:AF5A: 56        .byte $56   ; 
- D 1 - I - 0x00EF6B 03:AF5B: 55        .byte $55   ; 
- D 1 - I - 0x00EF6C 03:AF5C: 5A        .byte $5A   ; 
- D 1 - I - 0x00EF6D 03:AF5D: 59        .byte $59   ; 
- D 1 - I - 0x00EF6E 03:AF5E: 5A        .byte $5A   ; 
- D 1 - I - 0x00EF6F 03:AF5F: 59        .byte $59   ; 
- D 1 - I - 0x00EF70 03:AF60: 5A        .byte $5A   ; 
- D 1 - I - 0x00EF71 03:AF61: 59        .byte $59   ; 
- D 1 - I - 0x00EF72 03:AF62: 5A        .byte $5A   ; 
- D 1 - I - 0x00EF73 03:AF63: 59        .byte $59   ; 



_off018_02_AF64_0F:
- D 1 - I - 0x00EF74 03:AF64: 60        .byte $60   ; 
- D 1 - I - 0x00EF75 03:AF65: 67        .byte $67   ; 
- D 1 - I - 0x00EF76 03:AF66: 68        .byte $68   ; 
- D 1 - I - 0x00EF77 03:AF67: 69        .byte $69   ; 
- D 1 - I - 0x00EF78 03:AF68: 6A        .byte $6A   ; 
- D 1 - I - 0x00EF79 03:AF69: 6B        .byte $6B   ; 
- D 1 - I - 0x00EF7A 03:AF6A: 6C        .byte $6C   ; 
- D 1 - I - 0x00EF7B 03:AF6B: 66        .byte $66   ; 
- D 1 - I - 0x00EF7C 03:AF6C: 6D        .byte $6D   ; 
- D 1 - I - 0x00EF7D 03:AF6D: 6E        .byte $6E   ; 
- D 1 - I - 0x00EF7E 03:AF6E: 6F        .byte $6F   ; 
- D 1 - I - 0x00EF7F 03:AF6F: 70        .byte $70   ; 
- D 1 - I - 0x00EF80 03:AF70: 71        .byte $71   ; 
- D 1 - I - 0x00EF81 03:AF71: 72        .byte $72   ; 
- D 1 - I - 0x00EF82 03:AF72: 6E        .byte $6E   ; 
- D 1 - I - 0x00EF83 03:AF73: 73        .byte $73   ; 
- D 1 - I - 0x00EF84 03:AF74: 60        .byte $60   ; 
- D 1 - I - 0x00EF85 03:AF75: 74        .byte $74   ; 
- D 1 - I - 0x00EF86 03:AF76: 74        .byte $74   ; 
- D 1 - I - 0x00EF87 03:AF77: 75        .byte $75   ; 
- D 1 - I - 0x00EF88 03:AF78: 76        .byte $76   ; 
- D 1 - I - 0x00EF89 03:AF79: 74        .byte $74   ; 
- D 1 - I - 0x00EF8A 03:AF7A: 74        .byte $74   ; 
- D 1 - I - 0x00EF8B 03:AF7B: 66        .byte $66   ; 
- D 1 - I - 0x00EF8C 03:AF7C: 77        .byte $77   ; 
- D 1 - I - 0x00EF8D 03:AF7D: 78        .byte $78   ; 
- D 1 - I - 0x00EF8E 03:AF7E: 79        .byte $79   ; 
- D 1 - I - 0x00EF8F 03:AF7F: 7A        .byte $7A   ; 
- D 1 - I - 0x00EF90 03:AF80: 7B        .byte $7B   ; 
- D 1 - I - 0x00EF91 03:AF81: 7A        .byte $7A   ; 
- D 1 - I - 0x00EF92 03:AF82: 7C        .byte $7C   ; 
- D 1 - I - 0x00EF93 03:AF83: 7D        .byte $7D   ; 
- D 1 - I - 0x00EF94 03:AF84: 7E        .byte $7E   ; 
- D 1 - I - 0x00EF95 03:AF85: 7F        .byte $7F   ; 
- D 1 - I - 0x00EF96 03:AF86: 7F        .byte $7F   ; 
- D 1 - I - 0x00EF97 03:AF87: 7F        .byte $7F   ; 
- D 1 - I - 0x00EF98 03:AF88: 7F        .byte $7F   ; 
- D 1 - I - 0x00EF99 03:AF89: 7F        .byte $7F   ; 
- D 1 - I - 0x00EF9A 03:AF8A: 7F        .byte $7F   ; 
- D 1 - I - 0x00EF9B 03:AF8B: 80        .byte $80   ; 
- D 1 - I - 0x00EF9C 03:AF8C: 53        .byte $53   ; 
- D 1 - I - 0x00EF9D 03:AF8D: 54        .byte $54   ; 
- D 1 - I - 0x00EF9E 03:AF8E: 53        .byte $53   ; 
- D 1 - I - 0x00EF9F 03:AF8F: 54        .byte $54   ; 
- D 1 - I - 0x00EFA0 03:AF90: 53        .byte $53   ; 
- D 1 - I - 0x00EFA1 03:AF91: 54        .byte $54   ; 
- D 1 - I - 0x00EFA2 03:AF92: 53        .byte $53   ; 
- D 1 - I - 0x00EFA3 03:AF93: 54        .byte $54   ; 
- D 1 - I - 0x00EFA4 03:AF94: 56        .byte $56   ; 
- D 1 - I - 0x00EFA5 03:AF95: 55        .byte $55   ; 
- D 1 - I - 0x00EFA6 03:AF96: 56        .byte $56   ; 
- D 1 - I - 0x00EFA7 03:AF97: 55        .byte $55   ; 
- D 1 - I - 0x00EFA8 03:AF98: 56        .byte $56   ; 
- D 1 - I - 0x00EFA9 03:AF99: 55        .byte $55   ; 
- D 1 - I - 0x00EFAA 03:AF9A: 56        .byte $56   ; 
- D 1 - I - 0x00EFAB 03:AF9B: 55        .byte $55   ; 
- D 1 - I - 0x00EFAC 03:AF9C: 5A        .byte $5A   ; 
- D 1 - I - 0x00EFAD 03:AF9D: 59        .byte $59   ; 
- D 1 - I - 0x00EFAE 03:AF9E: 5A        .byte $5A   ; 
- D 1 - I - 0x00EFAF 03:AF9F: 59        .byte $59   ; 
- D 1 - I - 0x00EFB0 03:AFA0: 5A        .byte $5A   ; 
- D 1 - I - 0x00EFB1 03:AFA1: 59        .byte $59   ; 
- D 1 - I - 0x00EFB2 03:AFA2: 5A        .byte $5A   ; 
- D 1 - I - 0x00EFB3 03:AFA3: 59        .byte $59   ; 



_off018_02_AFA4_10:
- D 1 - I - 0x00EFB4 03:AFA4: 00        .byte $00   ; 
- D 1 - I - 0x00EFB5 03:AFA5: 00        .byte $00   ; 
- D 1 - I - 0x00EFB6 03:AFA6: 00        .byte $00   ; 
- D 1 - I - 0x00EFB7 03:AFA7: 00        .byte $00   ; 
- D 1 - I - 0x00EFB8 03:AFA8: 00        .byte $00   ; 
- D 1 - I - 0x00EFB9 03:AFA9: 00        .byte $00   ; 
- D 1 - I - 0x00EFBA 03:AFAA: 00        .byte $00   ; 
- D 1 - I - 0x00EFBB 03:AFAB: 00        .byte $00   ; 
- D 1 - I - 0x00EFBC 03:AFAC: 00        .byte $00   ; 
- D 1 - I - 0x00EFBD 03:AFAD: 00        .byte $00   ; 
- D 1 - I - 0x00EFBE 03:AFAE: 00        .byte $00   ; 
- D 1 - I - 0x00EFBF 03:AFAF: 00        .byte $00   ; 
- D 1 - I - 0x00EFC0 03:AFB0: 00        .byte $00   ; 
- D 1 - I - 0x00EFC1 03:AFB1: 00        .byte $00   ; 
- D 1 - I - 0x00EFC2 03:AFB2: 00        .byte $00   ; 
- D 1 - I - 0x00EFC3 03:AFB3: 00        .byte $00   ; 
- D 1 - I - 0x00EFC4 03:AFB4: 00        .byte $00   ; 
- D 1 - I - 0x00EFC5 03:AFB5: 00        .byte $00   ; 
- D 1 - I - 0x00EFC6 03:AFB6: 00        .byte $00   ; 
- D 1 - I - 0x00EFC7 03:AFB7: 00        .byte $00   ; 
- D 1 - I - 0x00EFC8 03:AFB8: 00        .byte $00   ; 
- D 1 - I - 0x00EFC9 03:AFB9: 00        .byte $00   ; 
- D 1 - I - 0x00EFCA 03:AFBA: 00        .byte $00   ; 
- D 1 - I - 0x00EFCB 03:AFBB: 00        .byte $00   ; 
- D 1 - I - 0x00EFCC 03:AFBC: 00        .byte $00   ; 
- D 1 - I - 0x00EFCD 03:AFBD: 00        .byte $00   ; 
- D 1 - I - 0x00EFCE 03:AFBE: 00        .byte $00   ; 
- D 1 - I - 0x00EFCF 03:AFBF: 00        .byte $00   ; 
- D 1 - I - 0x00EFD0 03:AFC0: 00        .byte $00   ; 
- D 1 - I - 0x00EFD1 03:AFC1: 00        .byte $00   ; 
- D 1 - I - 0x00EFD2 03:AFC2: 00        .byte $00   ; 
- D 1 - I - 0x00EFD3 03:AFC3: 00        .byte $00   ; 
- D 1 - I - 0x00EFD4 03:AFC4: 00        .byte $00   ; 
- D 1 - I - 0x00EFD5 03:AFC5: 00        .byte $00   ; 
- D 1 - I - 0x00EFD6 03:AFC6: 00        .byte $00   ; 
- D 1 - I - 0x00EFD7 03:AFC7: 00        .byte $00   ; 
- D 1 - I - 0x00EFD8 03:AFC8: 00        .byte $00   ; 
- D 1 - I - 0x00EFD9 03:AFC9: 00        .byte $00   ; 
- D 1 - I - 0x00EFDA 03:AFCA: 00        .byte $00   ; 
- D 1 - I - 0x00EFDB 03:AFCB: 00        .byte $00   ; 
- D 1 - I - 0x00EFDC 03:AFCC: 00        .byte $00   ; 
- D 1 - I - 0x00EFDD 03:AFCD: 00        .byte $00   ; 
- D 1 - I - 0x00EFDE 03:AFCE: 00        .byte $00   ; 
- D 1 - I - 0x00EFDF 03:AFCF: 00        .byte $00   ; 
- D 1 - I - 0x00EFE0 03:AFD0: 00        .byte $00   ; 
- D 1 - I - 0x00EFE1 03:AFD1: 00        .byte $00   ; 
- D 1 - I - 0x00EFE2 03:AFD2: 00        .byte $00   ; 
- D 1 - I - 0x00EFE3 03:AFD3: 00        .byte $00   ; 
- D 1 - I - 0x00EFE4 03:AFD4: 5B        .byte $5B   ; 
- D 1 - I - 0x00EFE5 03:AFD5: 5C        .byte $5C   ; 
- D 1 - I - 0x00EFE6 03:AFD6: 5C        .byte $5C   ; 
- D 1 - I - 0x00EFE7 03:AFD7: 5D        .byte $5D   ; 
- D 1 - I - 0x00EFE8 03:AFD8: 5E        .byte $5E   ; 
- D 1 - I - 0x00EFE9 03:AFD9: 5C        .byte $5C   ; 
- D 1 - I - 0x00EFEA 03:AFDA: 5C        .byte $5C   ; 
- D 1 - I - 0x00EFEB 03:AFDB: 5F        .byte $5F   ; 
- D 1 - I - 0x00EFEC 03:AFDC: 60        .byte $60   ; 
- D 1 - I - 0x00EFED 03:AFDD: 61        .byte $61   ; 
- D 1 - I - 0x00EFEE 03:AFDE: 62        .byte $62   ; 
- D 1 - I - 0x00EFEF 03:AFDF: 63        .byte $63   ; 
- D 1 - I - 0x00EFF0 03:AFE0: 64        .byte $64   ; 
- D 1 - I - 0x00EFF1 03:AFE1: 65        .byte $65   ; 
- D 1 - I - 0x00EFF2 03:AFE2: 61        .byte $61   ; 
- D 1 - I - 0x00EFF3 03:AFE3: 66        .byte $66   ; 



_off006_0x00EFF4_02_area_3:
- D 1 - I - 0x00EFF4 03:AFE4: 00        .byte $00   ; 
- D 1 - I - 0x00EFF5 03:AFE5: 00        .byte $00   ; 
- D 1 - I - 0x00EFF6 03:AFE6: 00        .byte $00   ; 
- D 1 - I - 0x00EFF7 03:AFE7: 00        .byte $00   ; 
- D 1 - I - 0x00EFF8 03:AFE8: 00        .byte $00   ; 
- D 1 - I - 0x00EFF9 03:AFE9: 00        .byte $00   ; 
- D 1 - I - 0x00EFFA 03:AFEA: 00        .byte $00   ; 
- D 1 - I - 0x00EFFB 03:AFEB: 00        .byte $00   ; 
- D 1 - I - 0x00EFFC 03:AFEC: 00        .byte $00   ; 
- D 1 - I - 0x00EFFD 03:AFED: 00        .byte $00   ; 
- D 1 - I - 0x00EFFE 03:AFEE: 00        .byte $00   ; 
- D 1 - I - 0x00EFFF 03:AFEF: 00        .byte $00   ; 
- D 1 - I - 0x00F000 03:AFF0: 00        .byte $00   ; 
- D 1 - I - 0x00F001 03:AFF1: 00        .byte $00   ; 
- D 1 - I - 0x00F002 03:AFF2: 00        .byte $00   ; 
- D 1 - I - 0x00F003 03:AFF3: 00        .byte $00   ; 
- D 1 - I - 0x00F004 03:AFF4: 00        .byte $00   ; 
- D 1 - I - 0x00F005 03:AFF5: 00        .byte $00   ; 
- D 1 - I - 0x00F006 03:AFF6: 00        .byte $00   ; 
- D 1 - I - 0x00F007 03:AFF7: 00        .byte $00   ; 
- D 1 - I - 0x00F008 03:AFF8: 00        .byte $00   ; 
- D 1 - I - 0x00F009 03:AFF9: 00        .byte $00   ; 
- D 1 - I - 0x00F00A 03:AFFA: 00        .byte $00   ; 
- D 1 - I - 0x00F00B 03:AFFB: 00        .byte $00   ; 
- D 1 - I - 0x00F00C 03:AFFC: 00        .byte $00   ; 
- D 1 - I - 0x00F00D 03:AFFD: 6D        .byte $6D   ; 
- D 1 - I - 0x00F00E 03:AFFE: 0D        .byte $0D   ; 
- D 1 - I - 0x00F00F 03:AFFF: 6F        .byte $6F   ; 
- D 1 - I - 0x00F010 03:B000: 4C        .byte $4C   ; 
- D 1 - I - 0x00F011 03:B001: 4D        .byte $4D   ; 
- D 1 - I - 0x00F012 03:B002: 6E        .byte $6E   ; 
- D 1 - I - 0x00F013 03:B003: 70        .byte $70   ; 
- D 1 - I - 0x00F014 03:B004: 00        .byte $00   ; 
- D 1 - I - 0x00F015 03:B005: 00        .byte $00   ; 
- D 1 - I - 0x00F016 03:B006: 01        .byte $01   ; 
- D 1 - I - 0x00F017 03:B007: 47        .byte $47   ; 
- D 1 - I - 0x00F018 03:B008: 48        .byte $48   ; 
- D 1 - I - 0x00F019 03:B009: 49        .byte $49   ; 
- D 1 - I - 0x00F01A 03:B00A: 4A        .byte $4A   ; 
- D 1 - I - 0x00F01B 03:B00B: 4B        .byte $4B   ; 
- D 1 - I - 0x00F01C 03:B00C: 02        .byte $02   ; 
- D 1 - I - 0x00F01D 03:B00D: 4E        .byte $4E   ; 
- D 1 - I - 0x00F01E 03:B00E: 03        .byte $03   ; 
- D 1 - I - 0x00F01F 03:B00F: 4F        .byte $4F   ; 
- D 1 - I - 0x00F020 03:B010: 51        .byte $51   ; 
- D 1 - I - 0x00F021 03:B011: 52        .byte $52   ; 
- D 1 - I - 0x00F022 03:B012: 53        .byte $53   ; 
- D 1 - I - 0x00F023 03:B013: 54        .byte $54   ; 
- D 1 - I - 0x00F024 03:B014: 00        .byte $00   ; 
- D 1 - I - 0x00F025 03:B015: 00        .byte $00   ; 
- D 1 - I - 0x00F026 03:B016: 00        .byte $00   ; 
- D 1 - I - 0x00F027 03:B017: 00        .byte $00   ; 
- D 1 - I - 0x00F028 03:B018: 4C        .byte $4C   ; 
- D 1 - I - 0x00F029 03:B019: 4D        .byte $4D   ; 
- D 1 - I - 0x00F02A 03:B01A: 00        .byte $00   ; 
- D 1 - I - 0x00F02B 03:B01B: 00        .byte $00   ; 
- D 1 - I - 0x00F02C 03:B01C: 04        .byte $04   ; 
- D 1 - I - 0x00F02D 03:B01D: 50        .byte $50   ; 
- D 1 - I - 0x00F02E 03:B01E: 05        .byte $05   ; 
- D 1 - I - 0x00F02F 03:B01F: 72        .byte $72   ; 
- D 1 - I - 0x00F030 03:B020: 55        .byte $55   ; 
- D 1 - I - 0x00F031 03:B021: 56        .byte $56   ; 
- D 1 - I - 0x00F032 03:B022: 57        .byte $57   ; 
- D 1 - I - 0x00F033 03:B023: 73        .byte $73   ; 
- D 1 - I - 0x00F034 03:B024: 02        .byte $02   ; 
- D 1 - I - 0x00F035 03:B025: 4E        .byte $4E   ; 
- D 1 - I - 0x00F036 03:B026: 03        .byte $03   ; 
- D 1 - I - 0x00F037 03:B027: 4F        .byte $4F   ; 
- D 1 - I - 0x00F038 03:B028: 51        .byte $51   ; 
- D 1 - I - 0x00F039 03:B029: 52        .byte $52   ; 
- D 1 - I - 0x00F03A 03:B02A: 53        .byte $53   ; 
- D 1 - I - 0x00F03B 03:B02B: 54        .byte $54   ; 
- D 1 - I - 0x00F03C 03:B02C: 06        .byte $06   ; 
- D 1 - I - 0x00F03D 03:B02D: 59        .byte $59   ; 
- D 1 - I - 0x00F03E 03:B02E: 07        .byte $07   ; 
- D 1 - I - 0x00F03F 03:B02F: 5A        .byte $5A   ; 
- D 1 - I - 0x00F040 03:B030: 5D        .byte $5D   ; 
- D 1 - I - 0x00F041 03:B031: 5E        .byte $5E   ; 
- D 1 - I - 0x00F042 03:B032: 5F        .byte $5F   ; 
- D 1 - I - 0x00F043 03:B033: 60        .byte $60   ; 
- D 1 - I - 0x00F044 03:B034: 04        .byte $04   ; 
- D 1 - I - 0x00F045 03:B035: 50        .byte $50   ; 
- D 1 - I - 0x00F046 03:B036: 05        .byte $05   ; 
- D 1 - I - 0x00F047 03:B037: 58        .byte $58   ; 
- D 1 - I - 0x00F048 03:B038: 55        .byte $55   ; 
- D 1 - I - 0x00F049 03:B039: 56        .byte $56   ; 
- D 1 - I - 0x00F04A 03:B03A: 57        .byte $57   ; 
- D 1 - I - 0x00F04B 03:B03B: 5C        .byte $5C   ; 
- D 1 - I - 0x00F04C 03:B03C: 08        .byte $08   ; 
- D 1 - I - 0x00F04D 03:B03D: 5B        .byte $5B   ; 
- D 1 - I - 0x00F04E 03:B03E: 0F        .byte $0F   ; 
- D 1 - I - 0x00F04F 03:B03F: 64        .byte $64   ; 
- D 1 - I - 0x00F050 03:B040: 61        .byte $61   ; 
- D 1 - I - 0x00F051 03:B041: 62        .byte $62   ; 
- D 1 - I - 0x00F052 03:B042: 63        .byte $63   ; 
- D 1 - I - 0x00F053 03:B043: 70        .byte $70   ; 
- D 1 - I - 0x00F054 03:B044: 06        .byte $06   ; 
- D 1 - I - 0x00F055 03:B045: 59        .byte $59   ; 
- D 1 - I - 0x00F056 03:B046: 07        .byte $07   ; 
- D 1 - I - 0x00F057 03:B047: 5A        .byte $5A   ; 
- D 1 - I - 0x00F058 03:B048: 5D        .byte $5D   ; 
- D 1 - I - 0x00F059 03:B049: 5E        .byte $5E   ; 
- D 1 - I - 0x00F05A 03:B04A: 5F        .byte $5F   ; 
- D 1 - I - 0x00F05B 03:B04B: 60        .byte $60   ; 
- D 1 - I - 0x00F05C 03:B04C: 09        .byte $09   ; 
- D 1 - I - 0x00F05D 03:B04D: 65        .byte $65   ; 
- D 1 - I - 0x00F05E 03:B04E: 0A        .byte $0A   ; 
- D 1 - I - 0x00F05F 03:B04F: 66        .byte $66   ; 
- D 1 - I - 0x00F060 03:B050: 68        .byte $68   ; 
- D 1 - I - 0x00F061 03:B051: 69        .byte $69   ; 
- D 1 - I - 0x00F062 03:B052: 6A        .byte $6A   ; 
- D 1 - I - 0x00F063 03:B053: 6B        .byte $6B   ; 
- D 1 - I - 0x00F064 03:B054: 08        .byte $08   ; 
- D 1 - I - 0x00F065 03:B055: 5B        .byte $5B   ; 
- D 1 - I - 0x00F066 03:B056: 0F        .byte $0F   ; 
- D 1 - I - 0x00F067 03:B057: 74        .byte $74   ; 
- D 1 - I - 0x00F068 03:B058: 61        .byte $61   ; 
- D 1 - I - 0x00F069 03:B059: 62        .byte $62   ; 
- D 1 - I - 0x00F06A 03:B05A: 63        .byte $63   ; 
- D 1 - I - 0x00F06B 03:B05B: 70        .byte $70   ; 
- D 1 - I - 0x00F06C 03:B05C: 0B        .byte $0B   ; 
- D 1 - I - 0x00F06D 03:B05D: 67        .byte $67   ; 
- D 1 - I - 0x00F06E 03:B05E: 0C        .byte $0C   ; 
- D 1 - I - 0x00F06F 03:B05F: 58        .byte $58   ; 
- D 1 - I - 0x00F070 03:B060: 6C        .byte $6C   ; 
- D 1 - I - 0x00F071 03:B061: 75        .byte $75   ; 
- D 1 - I - 0x00F072 03:B062: 76        .byte $76   ; 
- D 1 - I - 0x00F073 03:B063: 5C        .byte $5C   ; 
- D 1 - I - 0x00F074 03:B064: 11        .byte $11   ; 
- D 1 - I - 0x00F075 03:B065: 65        .byte $65   ; 
- D 1 - I - 0x00F076 03:B066: 0A        .byte $0A   ; 
- D 1 - I - 0x00F077 03:B067: 66        .byte $66   ; 
- D 1 - I - 0x00F078 03:B068: 68        .byte $68   ; 
- D 1 - I - 0x00F079 03:B069: 69        .byte $69   ; 
- D 1 - I - 0x00F07A 03:B06A: 6A        .byte $6A   ; 
- D 1 - I - 0x00F07B 03:B06B: 6B        .byte $6B   ; 
- D 1 - I - 0x00F07C 03:B06C: 00        .byte $00   ; 
- D 1 - I - 0x00F07D 03:B06D: 13        .byte $13   ; 
- D 1 - I - 0x00F07E 03:B06E: 13        .byte $13   ; 
- D 1 - I - 0x00F07F 03:B06F: 82        .byte $82   ; 
- D 1 - I - 0x00F080 03:B070: 00        .byte $00   ; 
- D 1 - I - 0x00F081 03:B071: 83        .byte $83   ; 
- D 1 - I - 0x00F082 03:B072: 15        .byte $15   ; 
- D 1 - I - 0x00F083 03:B073: 85        .byte $85   ; 
- D 1 - I - 0x00F084 03:B074: 0B        .byte $0B   ; 
- D 1 - I - 0x00F085 03:B075: 67        .byte $67   ; 
- D 1 - I - 0x00F086 03:B076: 0C        .byte $0C   ; 
- D 1 - I - 0x00F087 03:B077: 77        .byte $77   ; 
- D 1 - I - 0x00F088 03:B078: 6C        .byte $6C   ; 
- D 1 - I - 0x00F089 03:B079: 75        .byte $75   ; 
- D 1 - I - 0x00F08A 03:B07A: 76        .byte $76   ; 
- D 1 - I - 0x00F08B 03:B07B: 7D        .byte $7D   ; 
- D 1 - I - 0x00F08C 03:B07C: 12        .byte $12   ; 
- D 1 - I - 0x00F08D 03:B07D: 79        .byte $79   ; 
- D 1 - I - 0x00F08E 03:B07E: 10        .byte $10   ; 
- D 1 - I - 0x00F08F 03:B07F: 7A        .byte $7A   ; 
- D 1 - I - 0x00F090 03:B080: 70        .byte $70   ; 
- D 1 - I - 0x00F091 03:B081: 00        .byte $00   ; 
- D 1 - I - 0x00F092 03:B082: 7B        .byte $7B   ; 
- D 1 - I - 0x00F093 03:B083: 7C        .byte $7C   ; 
- D 1 - I - 0x00F094 03:B084: 00        .byte $00   ; 
- D 1 - I - 0x00F095 03:B085: 78        .byte $78   ; 
- D 1 - I - 0x00F096 03:B086: 13        .byte $13   ; 
- D 1 - I - 0x00F097 03:B087: 82        .byte $82   ; 
- D 1 - I - 0x00F098 03:B088: 7E        .byte $7E   ; 
- D 1 - I - 0x00F099 03:B089: 7F        .byte $7F   ; 
- D 1 - I - 0x00F09A 03:B08A: 15        .byte $15   ; 
- D 1 - I - 0x00F09B 03:B08B: 86        .byte $86   ; 
- D 1 - I - 0x00F09C 03:B08C: 13        .byte $13   ; 
- D 1 - I - 0x00F09D 03:B08D: 00        .byte $00   ; 
- D 1 - I - 0x00F09E 03:B08E: 15        .byte $15   ; 
- D 1 - I - 0x00F09F 03:B08F: 86        .byte $86   ; 
- D 1 - I - 0x00F0A0 03:B090: 83        .byte $83   ; 
- D 1 - I - 0x00F0A1 03:B091: 00        .byte $00   ; 
- D 1 - I - 0x00F0A2 03:B092: 15        .byte $15   ; 
- D 1 - I - 0x00F0A3 03:B093: 86        .byte $86   ; 
- D 1 - I - 0x00F0A4 03:B094: 12        .byte $12   ; 
- D 1 - I - 0x00F0A5 03:B095: 79        .byte $79   ; 
- D 1 - I - 0x00F0A6 03:B096: 10        .byte $10   ; 
- D 1 - I - 0x00F0A7 03:B097: 7A        .byte $7A   ; 
- D 1 - I - 0x00F0A8 03:B098: 70        .byte $70   ; 
- D 1 - I - 0x00F0A9 03:B099: 00        .byte $00   ; 
- D 1 - I - 0x00F0AA 03:B09A: 7B        .byte $7B   ; 
- D 1 - I - 0x00F0AB 03:B09B: 7C        .byte $7C   ; 
- D 1 - I - 0x00F0AC 03:B09C: 14        .byte $14   ; 
- D 1 - I - 0x00F0AD 03:B09D: 82        .byte $82   ; 
- D 1 - I - 0x00F0AE 03:B09E: 14        .byte $14   ; 
- D 1 - I - 0x00F0AF 03:B09F: 82        .byte $82   ; 
- D 1 - I - 0x00F0B0 03:B0A0: 18        .byte $18   ; 
- D 1 - I - 0x00F0B1 03:B0A1: 84        .byte $84   ; 
- D 1 - I - 0x00F0B2 03:B0A2: 17        .byte $17   ; 
- D 1 - I - 0x00F0B3 03:B0A3: 86        .byte $86   ; 
- D 1 - I - 0x00F0B4 03:B0A4: 00        .byte $00   ; 
- D 1 - I - 0x00F0B5 03:B0A5: 83        .byte $83   ; 
- D 1 - I - 0x00F0B6 03:B0A6: 15        .byte $15   ; 
- D 1 - I - 0x00F0B7 03:B0A7: 86        .byte $86   ; 
- D 1 - I - 0x00F0B8 03:B0A8: 00        .byte $00   ; 
- D 1 - I - 0x00F0B9 03:B0A9: 83        .byte $83   ; 
- D 1 - I - 0x00F0BA 03:B0AA: 15        .byte $15   ; 
- D 1 - I - 0x00F0BB 03:B0AB: 85        .byte $85   ; 
- D 1 - I - 0x00F0BC 03:B0AC: 00        .byte $00   ; 
- D 1 - I - 0x00F0BD 03:B0AD: 16        .byte $16   ; 
- D 1 - I - 0x00F0BE 03:B0AE: 15        .byte $15   ; 
- D 1 - I - 0x00F0BF 03:B0AF: 85        .byte $85   ; 
- D 1 - I - 0x00F0C0 03:B0B0: 00        .byte $00   ; 
- D 1 - I - 0x00F0C1 03:B0B1: 83        .byte $83   ; 
- D 1 - I - 0x00F0C2 03:B0B2: 19        .byte $19   ; 
- D 1 - I - 0x00F0C3 03:B0B3: 85        .byte $85   ; 
- D 1 - I - 0x00F0C4 03:B0B4: 14        .byte $14   ; 
- D 1 - I - 0x00F0C5 03:B0B5: 82        .byte $82   ; 
- D 1 - I - 0x00F0C6 03:B0B6: 14        .byte $14   ; 
- D 1 - I - 0x00F0C7 03:B0B7: 82        .byte $82   ; 
- D 1 - I - 0x00F0C8 03:B0B8: 18        .byte $18   ; 
- D 1 - I - 0x00F0C9 03:B0B9: 84        .byte $84   ; 
- D 1 - I - 0x00F0CA 03:B0BA: 17        .byte $17   ; 
- D 1 - I - 0x00F0CB 03:B0BB: 86        .byte $86   ; 
- D 1 - I - 0x00F0CC 03:B0BC: 18        .byte $18   ; 
- D 1 - I - 0x00F0CD 03:B0BD: 84        .byte $84   ; 
- D 1 - I - 0x00F0CE 03:B0BE: 17        .byte $17   ; 
- D 1 - I - 0x00F0CF 03:B0BF: 86        .byte $86   ; 
- D 1 - I - 0x00F0D0 03:B0C0: 18        .byte $18   ; 
- D 1 - I - 0x00F0D1 03:B0C1: 84        .byte $84   ; 
- D 1 - I - 0x00F0D2 03:B0C2: 17        .byte $17   ; 
- D 1 - I - 0x00F0D3 03:B0C3: 86        .byte $86   ; 
- D 1 - I - 0x00F0D4 03:B0C4: 16        .byte $16   ; 
- D 1 - I - 0x00F0D5 03:B0C5: 00        .byte $00   ; 
- D 1 - I - 0x00F0D6 03:B0C6: 15        .byte $15   ; 
- D 1 - I - 0x00F0D7 03:B0C7: 86        .byte $86   ; 
- D 1 - I - 0x00F0D8 03:B0C8: 83        .byte $83   ; 
- D 1 - I - 0x00F0D9 03:B0C9: 00        .byte $00   ; 
- D 1 - I - 0x00F0DA 03:B0CA: 19        .byte $19   ; 
- D 1 - I - 0x00F0DB 03:B0CB: 85        .byte $85   ; 
- D 1 - I - 0x00F0DC 03:B0CC: 16        .byte $16   ; 
- D 1 - I - 0x00F0DD 03:B0CD: 00        .byte $00   ; 
- D 1 - I - 0x00F0DE 03:B0CE: 19        .byte $19   ; 
- D 1 - I - 0x00F0DF 03:B0CF: 85        .byte $85   ; 
- D 1 - I - 0x00F0E0 03:B0D0: 83        .byte $83   ; 
- D 1 - I - 0x00F0E1 03:B0D1: 00        .byte $00   ; 
- D 1 - I - 0x00F0E2 03:B0D2: 19        .byte $19   ; 
- D 1 - I - 0x00F0E3 03:B0D3: 85        .byte $85   ; 
- D 1 - I - 0x00F0E4 03:B0D4: 18        .byte $18   ; 
- D 1 - I - 0x00F0E5 03:B0D5: 84        .byte $84   ; 
- D 1 - I - 0x00F0E6 03:B0D6: 17        .byte $17   ; 
- D 1 - I - 0x00F0E7 03:B0D7: 86        .byte $86   ; 
- D 1 - I - 0x00F0E8 03:B0D8: 18        .byte $18   ; 
- D 1 - I - 0x00F0E9 03:B0D9: 84        .byte $84   ; 
- D 1 - I - 0x00F0EA 03:B0DA: 17        .byte $17   ; 
- D 1 - I - 0x00F0EB 03:B0DB: 86        .byte $86   ; 
- D 1 - I - 0x00F0EC 03:B0DC: 18        .byte $18   ; 
- D 1 - I - 0x00F0ED 03:B0DD: 84        .byte $84   ; 
- D 1 - I - 0x00F0EE 03:B0DE: 17        .byte $17   ; 
- D 1 - I - 0x00F0EF 03:B0DF: 86        .byte $86   ; 
- D 1 - I - 0x00F0F0 03:B0E0: 18        .byte $18   ; 
- D 1 - I - 0x00F0F1 03:B0E1: 84        .byte $84   ; 
- D 1 - I - 0x00F0F2 03:B0E2: 17        .byte $17   ; 
- D 1 - I - 0x00F0F3 03:B0E3: 86        .byte $86   ; 
- D 1 - I - 0x00F0F4 03:B0E4: 00        .byte $00   ; 
- D 1 - I - 0x00F0F5 03:B0E5: 16        .byte $16   ; 
- D 1 - I - 0x00F0F6 03:B0E6: 19        .byte $19   ; 
- D 1 - I - 0x00F0F7 03:B0E7: 85        .byte $85   ; 
- D 1 - I - 0x00F0F8 03:B0E8: 00        .byte $00   ; 
- D 1 - I - 0x00F0F9 03:B0E9: 83        .byte $83   ; 
- D 1 - I - 0x00F0FA 03:B0EA: 19        .byte $19   ; 
- D 1 - I - 0x00F0FB 03:B0EB: 87        .byte $87   ; 
- D 1 - I - 0x00F0FC 03:B0EC: 00        .byte $00   ; 
- D 1 - I - 0x00F0FD 03:B0ED: 83        .byte $83   ; 
- D 1 - I - 0x00F0FE 03:B0EE: 19        .byte $19   ; 
- D 1 - I - 0x00F0FF 03:B0EF: 87        .byte $87   ; 
- D 1 - I - 0x00F100 03:B0F0: 00        .byte $00   ; 
- D 1 - I - 0x00F101 03:B0F1: 00        .byte $00   ; 
- D 1 - I - 0x00F102 03:B0F2: 88        .byte $88   ; 
- D 1 - I - 0x00F103 03:B0F3: 80        .byte $80   ; 
- D 1 - I - 0x00F104 03:B0F4: 18        .byte $18   ; 
- D 1 - I - 0x00F105 03:B0F5: 84        .byte $84   ; 
- D 1 - I - 0x00F106 03:B0F6: 17        .byte $17   ; 
- D 1 - I - 0x00F107 03:B0F7: 86        .byte $86   ; 
- D 1 - I - 0x00F108 03:B0F8: 18        .byte $18   ; 
- D 1 - I - 0x00F109 03:B0F9: 84        .byte $84   ; 
- D 1 - I - 0x00F10A 03:B0FA: 17        .byte $17   ; 
- D 1 - I - 0x00F10B 03:B0FB: 85        .byte $85   ; 
- D 1 - I - 0x00F10C 03:B0FC: 18        .byte $18   ; 
- D 1 - I - 0x00F10D 03:B0FD: 84        .byte $84   ; 
- D 1 - I - 0x00F10E 03:B0FE: 17        .byte $17   ; 
- D 1 - I - 0x00F10F 03:B0FF: 85        .byte $85   ; 
- D 1 - I - 0x00F110 03:B100: 1C        .byte $1C   ; 
- D 1 - I - 0x00F111 03:B101: 81        .byte $81   ; 
- D 1 - I - 0x00F112 03:B102: 88        .byte $88   ; 
- D 1 - I - 0x00F113 03:B103: 81        .byte $81   ; 
- D 1 - I - 0x00F114 03:B104: 16        .byte $16   ; 
- D 1 - I - 0x00F115 03:B105: 00        .byte $00   ; 
- D 1 - I - 0x00F116 03:B106: 19        .byte $19   ; 
- D 1 - I - 0x00F117 03:B107: 85        .byte $85   ; 
- D 1 - I - 0x00F118 03:B108: 83        .byte $83   ; 
- D 1 - I - 0x00F119 03:B109: 00        .byte $00   ; 
- D 1 - I - 0x00F11A 03:B10A: 19        .byte $19   ; 
- D 1 - I - 0x00F11B 03:B10B: 87        .byte $87   ; 
- D 1 - I - 0x00F11C 03:B10C: 16        .byte $16   ; 
- D 1 - I - 0x00F11D 03:B10D: 00        .byte $00   ; 
- D 1 - I - 0x00F11E 03:B10E: 19        .byte $19   ; 
- D 1 - I - 0x00F11F 03:B10F: 87        .byte $87   ; 
- D 1 - I - 0x00F120 03:B110: 83        .byte $83   ; 
- D 1 - I - 0x00F121 03:B111: 00        .byte $00   ; 
- D 1 - I - 0x00F122 03:B112: 88        .byte $88   ; 
- D 1 - I - 0x00F123 03:B113: 80        .byte $80   ; 
- D 1 - I - 0x00F124 03:B114: 18        .byte $18   ; 
- D 1 - I - 0x00F125 03:B115: 84        .byte $84   ; 
- D 1 - I - 0x00F126 03:B116: 17        .byte $17   ; 
- D 1 - I - 0x00F127 03:B117: 85        .byte $85   ; 
- D 1 - I - 0x00F128 03:B118: 18        .byte $18   ; 
- D 1 - I - 0x00F129 03:B119: 84        .byte $84   ; 
- D 1 - I - 0x00F12A 03:B11A: 17        .byte $17   ; 
- D 1 - I - 0x00F12B 03:B11B: 85        .byte $85   ; 
- D 1 - I - 0x00F12C 03:B11C: 1C        .byte $1C   ; 
- D 1 - I - 0x00F12D 03:B11D: 81        .byte $81   ; 
- D 1 - I - 0x00F12E 03:B11E: 17        .byte $17   ; 
- D 1 - I - 0x00F12F 03:B11F: 85        .byte $85   ; 
- D 1 - I - 0x00F130 03:B120: 00        .byte $00   ; 
- D 1 - I - 0x00F131 03:B121: 00        .byte $00   ; 
- D 1 - I - 0x00F132 03:B122: 88        .byte $88   ; 
- D 1 - I - 0x00F133 03:B123: 81        .byte $81   ; 
- D 1 - I - 0x00F134 03:B124: 00        .byte $00   ; 
- D 1 - I - 0x00F135 03:B125: 00        .byte $00   ; 
- D 1 - I - 0x00F136 03:B126: 00        .byte $00   ; 
- D 1 - I - 0x00F137 03:B127: 00        .byte $00   ; 
- D 1 - I - 0x00F138 03:B128: 00        .byte $00   ; 
- D 1 - I - 0x00F139 03:B129: 00        .byte $00   ; 
- D 1 - I - 0x00F13A 03:B12A: 00        .byte $00   ; 
- D 1 - I - 0x00F13B 03:B12B: 00        .byte $00   ; 
- D 1 - I - 0x00F13C 03:B12C: 0E        .byte $0E   ; 
- D 1 - I - 0x00F13D 03:B12D: 71        .byte $71   ; 
- D 1 - I - 0x00F13E 03:B12E: 01        .byte $01   ; 
- D 1 - I - 0x00F13F 03:B12F: 47        .byte $47   ; 
- D 1 - I - 0x00F140 03:B130: 48        .byte $48   ; 
- D 1 - I - 0x00F141 03:B131: 49        .byte $49   ; 
- D 1 - I - 0x00F142 03:B132: 4A        .byte $4A   ; 
- D 1 - I - 0x00F143 03:B133: 4B        .byte $4B   ; 
- D 1 - I - 0x00F144 03:B134: 1B        .byte $1B   ; 
- D 1 - I - 0x00F145 03:B135: 1B        .byte $1B   ; 
- D 1 - I - 0x00F146 03:B136: 1B        .byte $1B   ; 
- D 1 - I - 0x00F147 03:B137: 1B        .byte $1B   ; 
- D 1 - I - 0x00F148 03:B138: 89        .byte $89   ; 
- D 1 - I - 0x00F149 03:B139: 8A        .byte $8A   ; 
- D 1 - I - 0x00F14A 03:B13A: 89        .byte $89   ; 
- D 1 - I - 0x00F14B 03:B13B: 8A        .byte $8A   ; 
- D 1 - I - 0x00F14C 03:B13C: 28        .byte $28   ; 
- D 1 - I - 0x00F14D 03:B13D: 28        .byte $28   ; 
- D 1 - I - 0x00F14E 03:B13E: 28        .byte $28   ; 
- D 1 - I - 0x00F14F 03:B13F: 28        .byte $28   ; 
- D 1 - I - 0x00F150 03:B140: 8B        .byte $8B   ; 
- D 1 - I - 0x00F151 03:B141: 28        .byte $28   ; 
- D 1 - I - 0x00F152 03:B142: 8B        .byte $8B   ; 
- D 1 - I - 0x00F153 03:B143: 28        .byte $28   ; 
- D 1 - I - 0x00F154 03:B144: 2F        .byte $2F   ; 
- D 1 - I - 0x00F155 03:B145: 8B        .byte $8B   ; 
- D 1 - I - 0x00F156 03:B146: 2F        .byte $2F   ; 
- D 1 - I - 0x00F157 03:B147: 8B        .byte $8B   ; 
- D 1 - I - 0x00F158 03:B148: 8C        .byte $8C   ; 
- D 1 - I - 0x00F159 03:B149: 2F        .byte $2F   ; 
- D 1 - I - 0x00F15A 03:B14A: 8C        .byte $8C   ; 
- D 1 - I - 0x00F15B 03:B14B: 2F        .byte $2F   ; 
- D 1 - I - 0x00F15C 03:B14C: 2F        .byte $2F   ; 
- D 1 - I - 0x00F15D 03:B14D: 8D        .byte $8D   ; 
- D 1 - I - 0x00F15E 03:B14E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F15F 03:B14F: 8C        .byte $8C   ; 
- D 1 - I - 0x00F160 03:B150: 35        .byte $35   ; 
- D 1 - I - 0x00F161 03:B151: 8E        .byte $8E   ; 
- D 1 - I - 0x00F162 03:B152: 35        .byte $35   ; 
- D 1 - I - 0x00F163 03:B153: 35        .byte $35   ; 
- D 1 - I - 0x00F164 03:B154: 2F        .byte $2F   ; 
- D 1 - I - 0x00F165 03:B155: 8B        .byte $8B   ; 
- D 1 - I - 0x00F166 03:B156: 2F        .byte $2F   ; 
- D 1 - I - 0x00F167 03:B157: 8B        .byte $8B   ; 
- D 1 - I - 0x00F168 03:B158: 8C        .byte $8C   ; 
- D 1 - I - 0x00F169 03:B159: 2F        .byte $2F   ; 
- D 1 - I - 0x00F16A 03:B15A: 8C        .byte $8C   ; 
- D 1 - I - 0x00F16B 03:B15B: 2F        .byte $2F   ; 
- D 1 - I - 0x00F16C 03:B15C: 2F        .byte $2F   ; 
- D 1 - I - 0x00F16D 03:B15D: 8C        .byte $8C   ; 
- D 1 - I - 0x00F16E 03:B15E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F16F 03:B15F: 8C        .byte $8C   ; 
- D 1 - I - 0x00F170 03:B160: 8C        .byte $8C   ; 
- D 1 - I - 0x00F171 03:B161: 2F        .byte $2F   ; 
- D 1 - I - 0x00F172 03:B162: 8C        .byte $8C   ; 
- D 1 - I - 0x00F173 03:B163: 2F        .byte $2F   ; 
- D 1 - I - 0x00F174 03:B164: 1C        .byte $1C   ; 
- D 1 - I - 0x00F175 03:B165: 81        .byte $81   ; 
- D 1 - I - 0x00F176 03:B166: 17        .byte $17   ; 
- D 1 - I - 0x00F177 03:B167: 84        .byte $84   ; 
- D 1 - I - 0x00F178 03:B168: 00        .byte $00   ; 
- D 1 - I - 0x00F179 03:B169: 00        .byte $00   ; 
- D 1 - I - 0x00F17A 03:B16A: 17        .byte $17   ; 
- D 1 - I - 0x00F17B 03:B16B: 81        .byte $81   ; 
- D 1 - I - 0x00F17C 03:B16C: 1D        .byte $1D   ; 
- D 1 - I - 0x00F17D 03:B16D: 1D        .byte $1D   ; 
- D 1 - I - 0x00F17E 03:B16E: 1A        .byte $1A   ; 
- D 1 - I - 0x00F17F 03:B16F: 1D        .byte $1D   ; 
- D 1 - I - 0x00F180 03:B170: 1B        .byte $1B   ; 
- D 1 - I - 0x00F181 03:B171: 1B        .byte $1B   ; 
- D 1 - I - 0x00F182 03:B172: 1D        .byte $1D   ; 
- D 1 - I - 0x00F183 03:B173: 26        .byte $26   ; 
- D 1 - I - 0x00F184 03:B174: 16        .byte $16   ; 
- D 1 - I - 0x00F185 03:B175: 00        .byte $00   ; 
- D 1 - I - 0x00F186 03:B176: 19        .byte $19   ; 
- D 1 - I - 0x00F187 03:B177: 87        .byte $87   ; 
- D 1 - I - 0x00F188 03:B178: 83        .byte $83   ; 
- D 1 - I - 0x00F189 03:B179: 00        .byte $00   ; 
- D 1 - I - 0x00F18A 03:B17A: 88        .byte $88   ; 
- D 1 - I - 0x00F18B 03:B17B: 80        .byte $80   ; 
- D 1 - I - 0x00F18C 03:B17C: 1A        .byte $1A   ; 
- D 1 - I - 0x00F18D 03:B17D: 1D        .byte $1D   ; 
- D 1 - I - 0x00F18E 03:B17E: 1A        .byte $1A   ; 
- D 1 - I - 0x00F18F 03:B17F: 1A        .byte $1A   ; 
- D 1 - I - 0x00F190 03:B180: 96        .byte $96   ; 
- D 1 - I - 0x00F191 03:B181: 3A        .byte $3A   ; 
- D 1 - I - 0x00F192 03:B182: 96        .byte $96   ; 
- D 1 - I - 0x00F193 03:B183: 3A        .byte $3A   ; 
- D 1 - I - 0x00F194 03:B184: 1C        .byte $1C   ; 
- D 1 - I - 0x00F195 03:B185: 81        .byte $81   ; 
- D 1 - I - 0x00F196 03:B186: 17        .byte $17   ; 
- D 1 - I - 0x00F197 03:B187: 85        .byte $85   ; 
- D 1 - I - 0x00F198 03:B188: 00        .byte $00   ; 
- D 1 - I - 0x00F199 03:B189: 00        .byte $00   ; 
- D 1 - I - 0x00F19A 03:B18A: 88        .byte $88   ; 
- D 1 - I - 0x00F19B 03:B18B: 81        .byte $81   ; 
- D 1 - I - 0x00F19C 03:B18C: 1D        .byte $1D   ; 
- D 1 - I - 0x00F19D 03:B18D: 1D        .byte $1D   ; 
- D 1 - I - 0x00F19E 03:B18E: 1A        .byte $1A   ; 
- D 1 - I - 0x00F19F 03:B18F: 1D        .byte $1D   ; 
- D 1 - I - 0x00F1A0 03:B190: 96        .byte $96   ; 
- D 1 - I - 0x00F1A1 03:B191: 3A        .byte $3A   ; 
- D 1 - I - 0x00F1A2 03:B192: 96        .byte $96   ; 
- D 1 - I - 0x00F1A3 03:B193: 3A        .byte $3A   ; 
- D 1 - I - 0x00F1A4 03:B194: 16        .byte $16   ; 
- D 1 - I - 0x00F1A5 03:B195: 00        .byte $00   ; 
- D 1 - I - 0x00F1A6 03:B196: 19        .byte $19   ; 
- D 1 - I - 0x00F1A7 03:B197: 87        .byte $87   ; 
- D 1 - I - 0x00F1A8 03:B198: 83        .byte $83   ; 
- D 1 - I - 0x00F1A9 03:B199: 00        .byte $00   ; 
- D 1 - I - 0x00F1AA 03:B19A: 88        .byte $88   ; 
- D 1 - I - 0x00F1AB 03:B19B: 80        .byte $80   ; 
- D 1 - I - 0x00F1AC 03:B19C: 1A        .byte $1A   ; 
- D 1 - I - 0x00F1AD 03:B19D: 1A        .byte $1A   ; 
- D 1 - I - 0x00F1AE 03:B19E: 1A        .byte $1A   ; 
- D 1 - I - 0x00F1AF 03:B19F: 1A        .byte $1A   ; 
- D 1 - I - 0x00F1B0 03:B1A0: 1E        .byte $1E   ; 
- D 1 - I - 0x00F1B1 03:B1A1: 1B        .byte $1B   ; 
- D 1 - I - 0x00F1B2 03:B1A2: 1D        .byte $1D   ; 
- D 1 - I - 0x00F1B3 03:B1A3: 1B        .byte $1B   ; 
- D 1 - I - 0x00F1B4 03:B1A4: 00        .byte $00   ; 
- D 1 - I - 0x00F1B5 03:B1A5: 83        .byte $83   ; 
- D 1 - I - 0x00F1B6 03:B1A6: 19        .byte $19   ; 
- D 1 - I - 0x00F1B7 03:B1A7: 87        .byte $87   ; 
- D 1 - I - 0x00F1B8 03:B1A8: 00        .byte $00   ; 
- D 1 - I - 0x00F1B9 03:B1A9: 83        .byte $83   ; 
- D 1 - I - 0x00F1BA 03:B1AA: 88        .byte $88   ; 
- D 1 - I - 0x00F1BB 03:B1AB: 80        .byte $80   ; 
- D 1 - I - 0x00F1BC 03:B1AC: 1A        .byte $1A   ; 
- D 1 - I - 0x00F1BD 03:B1AD: 1A        .byte $1A   ; 
- D 1 - I - 0x00F1BE 03:B1AE: 1A        .byte $1A   ; 
- D 1 - I - 0x00F1BF 03:B1AF: 1A        .byte $1A   ; 
- D 1 - I - 0x00F1C0 03:B1B0: 96        .byte $96   ; 
- D 1 - I - 0x00F1C1 03:B1B1: 3A        .byte $3A   ; 
- D 1 - I - 0x00F1C2 03:B1B2: 96        .byte $96   ; 
- D 1 - I - 0x00F1C3 03:B1B3: 3A        .byte $3A   ; 
- D 1 - I - 0x00F1C4 03:B1B4: 1B        .byte $1B   ; 
- D 1 - I - 0x00F1C5 03:B1B5: 1B        .byte $1B   ; 
- D 1 - I - 0x00F1C6 03:B1B6: 1B        .byte $1B   ; 
- D 1 - I - 0x00F1C7 03:B1B7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F1C8 03:B1B8: 89        .byte $89   ; 
- D 1 - I - 0x00F1C9 03:B1B9: 8A        .byte $8A   ; 
- D 1 - I - 0x00F1CA 03:B1BA: 89        .byte $89   ; 
- D 1 - I - 0x00F1CB 03:B1BB: 8A        .byte $8A   ; 
- D 1 - I - 0x00F1CC 03:B1BC: 28        .byte $28   ; 
- D 1 - I - 0x00F1CD 03:B1BD: 28        .byte $28   ; 
- D 1 - I - 0x00F1CE 03:B1BE: 28        .byte $28   ; 
- D 1 - I - 0x00F1CF 03:B1BF: 91        .byte $91   ; 
- D 1 - I - 0x00F1D0 03:B1C0: 8B        .byte $8B   ; 
- D 1 - I - 0x00F1D1 03:B1C1: 28        .byte $28   ; 
- D 1 - I - 0x00F1D2 03:B1C2: 28        .byte $28   ; 
- D 1 - I - 0x00F1D3 03:B1C3: 91        .byte $91   ; 
- D 1 - I - 0x00F1D4 03:B1C4: 1B        .byte $1B   ; 
- D 1 - I - 0x00F1D5 03:B1C5: 26        .byte $26   ; 
- D 1 - I - 0x00F1D6 03:B1C6: 1F        .byte $1F   ; 
- D 1 - I - 0x00F1D7 03:B1C7: 3B        .byte $3B   ; 
- D 1 - I - 0x00F1D8 03:B1C8: 8F        .byte $8F   ; 
- D 1 - I - 0x00F1D9 03:B1C9: 1F        .byte $1F   ; 
- D 1 - I - 0x00F1DA 03:B1CA: 3C        .byte $3C   ; 
- D 1 - I - 0x00F1DB 03:B1CB: 3D        .byte $3D   ; 
- D 1 - I - 0x00F1DC 03:B1CC: 26        .byte $26   ; 
- D 1 - I - 0x00F1DD 03:B1CD: 3C        .byte $3C   ; 
- D 1 - I - 0x00F1DE 03:B1CE: 24        .byte $24   ; 
- D 1 - I - 0x00F1DF 03:B1CF: 3F        .byte $3F   ; 
- D 1 - I - 0x00F1E0 03:B1D0: 43        .byte $43   ; 
- D 1 - I - 0x00F1E1 03:B1D1: 42        .byte $42   ; 
- D 1 - I - 0x00F1E2 03:B1D2: 37        .byte $37   ; 
- D 1 - I - 0x00F1E3 03:B1D3: 3F        .byte $3F   ; 
- D 1 - I - 0x00F1E4 03:B1D4: 20        .byte $20   ; 
- D 1 - I - 0x00F1E5 03:B1D5: 3B        .byte $3B   ; 
- D 1 - I - 0x00F1E6 03:B1D6: 20        .byte $20   ; 
- D 1 - I - 0x00F1E7 03:B1D7: 3B        .byte $3B   ; 
- D 1 - I - 0x00F1E8 03:B1D8: 3E        .byte $3E   ; 
- D 1 - I - 0x00F1E9 03:B1D9: 3D        .byte $3D   ; 
- D 1 - I - 0x00F1EA 03:B1DA: 3E        .byte $3E   ; 
- D 1 - I - 0x00F1EB 03:B1DB: 3D        .byte $3D   ; 
- D 1 - I - 0x00F1EC 03:B1DC: 24        .byte $24   ; 
- D 1 - I - 0x00F1ED 03:B1DD: 3F        .byte $3F   ; 
- D 1 - I - 0x00F1EE 03:B1DE: 24        .byte $24   ; 
- D 1 - I - 0x00F1EF 03:B1DF: 3F        .byte $3F   ; 
- D 1 - I - 0x00F1F0 03:B1E0: 3F        .byte $3F   ; 
- D 1 - I - 0x00F1F1 03:B1E1: 24        .byte $24   ; 
- D 1 - I - 0x00F1F2 03:B1E2: 3F        .byte $3F   ; 
- D 1 - I - 0x00F1F3 03:B1E3: 24        .byte $24   ; 
- D 1 - I - 0x00F1F4 03:B1E4: 20        .byte $20   ; 
- D 1 - I - 0x00F1F5 03:B1E5: 97        .byte $97   ; 
- D 1 - I - 0x00F1F6 03:B1E6: 1E        .byte $1E   ; 
- D 1 - I - 0x00F1F7 03:B1E7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F1F8 03:B1E8: 3E        .byte $3E   ; 
- D 1 - I - 0x00F1F9 03:B1E9: 25        .byte $25   ; 
- D 1 - I - 0x00F1FA 03:B1EA: 97        .byte $97   ; 
- D 1 - I - 0x00F1FB 03:B1EB: 90        .byte $90   ; 
- D 1 - I - 0x00F1FC 03:B1EC: 24        .byte $24   ; 
- D 1 - I - 0x00F1FD 03:B1ED: 3F        .byte $3F   ; 
- D 1 - I - 0x00F1FE 03:B1EE: 25        .byte $25   ; 
- D 1 - I - 0x00F1FF 03:B1EF: 1E        .byte $1E   ; 
- D 1 - I - 0x00F200 03:B1F0: 3F        .byte $3F   ; 
- D 1 - I - 0x00F201 03:B1F1: 3F        .byte $3F   ; 
- D 1 - I - 0x00F202 03:B1F2: 42        .byte $42   ; 
- D 1 - I - 0x00F203 03:B1F3: 40        .byte $40   ; 
- D 1 - I - 0x00F204 03:B1F4: 1B        .byte $1B   ; 
- D 1 - I - 0x00F205 03:B1F5: 1B        .byte $1B   ; 
- D 1 - I - 0x00F206 03:B1F6: 1B        .byte $1B   ; 
- D 1 - I - 0x00F207 03:B1F7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F208 03:B1F8: 90        .byte $90   ; 
- D 1 - I - 0x00F209 03:B1F9: 8A        .byte $8A   ; 
- D 1 - I - 0x00F20A 03:B1FA: 89        .byte $89   ; 
- D 1 - I - 0x00F20B 03:B1FB: 8A        .byte $8A   ; 
- D 1 - I - 0x00F20C 03:B1FC: 29        .byte $29   ; 
- D 1 - I - 0x00F20D 03:B1FD: 28        .byte $28   ; 
- D 1 - I - 0x00F20E 03:B1FE: 28        .byte $28   ; 
- D 1 - I - 0x00F20F 03:B1FF: 28        .byte $28   ; 
- D 1 - I - 0x00F210 03:B200: 29        .byte $29   ; 
- D 1 - I - 0x00F211 03:B201: 8C        .byte $8C   ; 
- D 1 - I - 0x00F212 03:B202: 8B        .byte $8B   ; 
- D 1 - I - 0x00F213 03:B203: 2F        .byte $2F   ; 
- D 1 - I - 0x00F214 03:B204: 2F        .byte $2F   ; 
- D 1 - I - 0x00F215 03:B205: 8B        .byte $8B   ; 
- D 1 - I - 0x00F216 03:B206: 28        .byte $28   ; 
- D 1 - I - 0x00F217 03:B207: 91        .byte $91   ; 
- D 1 - I - 0x00F218 03:B208: 8C        .byte $8C   ; 
- D 1 - I - 0x00F219 03:B209: 2F        .byte $2F   ; 
- D 1 - I - 0x00F21A 03:B20A: 8C        .byte $8C   ; 
- D 1 - I - 0x00F21B 03:B20B: 28        .byte $28   ; 
- D 1 - I - 0x00F21C 03:B20C: 2F        .byte $2F   ; 
- D 1 - I - 0x00F21D 03:B20D: 8D        .byte $8D   ; 
- D 1 - I - 0x00F21E 03:B20E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F21F 03:B20F: 8C        .byte $8C   ; 
- D 1 - I - 0x00F220 03:B210: 35        .byte $35   ; 
- D 1 - I - 0x00F221 03:B211: 8E        .byte $8E   ; 
- D 1 - I - 0x00F222 03:B212: 35        .byte $35   ; 
- D 1 - I - 0x00F223 03:B213: 35        .byte $35   ; 
- D 1 - I - 0x00F224 03:B214: 43        .byte $43   ; 
- D 1 - I - 0x00F225 03:B215: 42        .byte $42   ; 
- D 1 - I - 0x00F226 03:B216: 42        .byte $42   ; 
- D 1 - I - 0x00F227 03:B217: 3F        .byte $3F   ; 
- D 1 - I - 0x00F228 03:B218: 95        .byte $95   ; 
- D 1 - I - 0x00F229 03:B219: 42        .byte $42   ; 
- D 1 - I - 0x00F22A 03:B21A: 37        .byte $37   ; 
- D 1 - I - 0x00F22B 03:B21B: 44        .byte $44   ; 
- D 1 - I - 0x00F22C 03:B21C: 2E        .byte $2E   ; 
- D 1 - I - 0x00F22D 03:B21D: 95        .byte $95   ; 
- D 1 - I - 0x00F22E 03:B21E: 37        .byte $37   ; 
- D 1 - I - 0x00F22F 03:B21F: 37        .byte $37   ; 
- D 1 - I - 0x00F230 03:B220: 35        .byte $35   ; 
- D 1 - I - 0x00F231 03:B221: 35        .byte $35   ; 
- D 1 - I - 0x00F232 03:B222: 94        .byte $94   ; 
- D 1 - I - 0x00F233 03:B223: 94        .byte $94   ; 
- D 1 - I - 0x00F234 03:B224: 44        .byte $44   ; 
- D 1 - I - 0x00F235 03:B225: 3F        .byte $3F   ; 
- D 1 - I - 0x00F236 03:B226: 44        .byte $44   ; 
- D 1 - I - 0x00F237 03:B227: 3F        .byte $3F   ; 
- D 1 - I - 0x00F238 03:B228: 37        .byte $37   ; 
- D 1 - I - 0x00F239 03:B229: 44        .byte $44   ; 
- D 1 - I - 0x00F23A 03:B22A: 3F        .byte $3F   ; 
- D 1 - I - 0x00F23B 03:B22B: 37        .byte $37   ; 
- D 1 - I - 0x00F23C 03:B22C: 37        .byte $37   ; 
- D 1 - I - 0x00F23D 03:B22D: 92        .byte $92   ; 
- D 1 - I - 0x00F23E 03:B22E: 37        .byte $37   ; 
- D 1 - I - 0x00F23F 03:B22F: 37        .byte $37   ; 
- D 1 - I - 0x00F240 03:B230: 94        .byte $94   ; 
- D 1 - I - 0x00F241 03:B231: 93        .byte $93   ; 
- D 1 - I - 0x00F242 03:B232: 94        .byte $94   ; 
- D 1 - I - 0x00F243 03:B233: 94        .byte $94   ; 
- D 1 - I - 0x00F244 03:B234: 44        .byte $44   ; 
- D 1 - I - 0x00F245 03:B235: 3F        .byte $3F   ; 
- D 1 - I - 0x00F246 03:B236: 42        .byte $42   ; 
- D 1 - I - 0x00F247 03:B237: 40        .byte $40   ; 
- D 1 - I - 0x00F248 03:B238: 3F        .byte $3F   ; 
- D 1 - I - 0x00F249 03:B239: 44        .byte $44   ; 
- D 1 - I - 0x00F24A 03:B23A: 42        .byte $42   ; 
- D 1 - I - 0x00F24B 03:B23B: 41        .byte $41   ; 
- D 1 - I - 0x00F24C 03:B23C: 37        .byte $37   ; 
- D 1 - I - 0x00F24D 03:B23D: 92        .byte $92   ; 
- D 1 - I - 0x00F24E 03:B23E: 41        .byte $41   ; 
- D 1 - I - 0x00F24F 03:B23F: 2E        .byte $2E   ; 
- D 1 - I - 0x00F250 03:B240: 94        .byte $94   ; 
- D 1 - I - 0x00F251 03:B241: 93        .byte $93   ; 
- D 1 - I - 0x00F252 03:B242: 35        .byte $35   ; 
- D 1 - I - 0x00F253 03:B243: 35        .byte $35   ; 
- D 1 - I - 0x00F254 03:B244: 29        .byte $29   ; 
- D 1 - I - 0x00F255 03:B245: 28        .byte $28   ; 
- D 1 - I - 0x00F256 03:B246: 2F        .byte $2F   ; 
- D 1 - I - 0x00F257 03:B247: 8C        .byte $8C   ; 
- D 1 - I - 0x00F258 03:B248: 2F        .byte $2F   ; 
- D 1 - I - 0x00F259 03:B249: 2F        .byte $2F   ; 
- D 1 - I - 0x00F25A 03:B24A: 8C        .byte $8C   ; 
- D 1 - I - 0x00F25B 03:B24B: 2F        .byte $2F   ; 
- D 1 - I - 0x00F25C 03:B24C: 2F        .byte $2F   ; 
- D 1 - I - 0x00F25D 03:B24D: 8D        .byte $8D   ; 
- D 1 - I - 0x00F25E 03:B24E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F25F 03:B24F: 8C        .byte $8C   ; 
- D 1 - I - 0x00F260 03:B250: 35        .byte $35   ; 
- D 1 - I - 0x00F261 03:B251: 8E        .byte $8E   ; 
- D 1 - I - 0x00F262 03:B252: 35        .byte $35   ; 
- D 1 - I - 0x00F263 03:B253: 35        .byte $35   ; 
- D 1 - I - 0x00F264 03:B254: 1A        .byte $1A   ; 
- D 1 - I - 0x00F265 03:B255: 1A        .byte $1A   ; 
- D 1 - I - 0x00F266 03:B256: 00        .byte $00   ; 
- D 1 - I - 0x00F267 03:B257: 00        .byte $00   ; 
- D 1 - I - 0x00F268 03:B258: B9        .byte $B9   ; 
- D 1 - I - 0x00F269 03:B259: B9        .byte $B9   ; 
- D 1 - I - 0x00F26A 03:B25A: BA        .byte $BA   ; 
- D 1 - I - 0x00F26B 03:B25B: BB        .byte $BB   ; 
- D 1 - I - 0x00F26C 03:B25C: 28        .byte $28   ; 
- D 1 - I - 0x00F26D 03:B25D: 2F        .byte $2F   ; 
- D 1 - I - 0x00F26E 03:B25E: 28        .byte $28   ; 
- D 1 - I - 0x00F26F 03:B25F: 29        .byte $29   ; 
- D 1 - I - 0x00F270 03:B260: 8B        .byte $8B   ; 
- D 1 - I - 0x00F271 03:B261: 28        .byte $28   ; 
- D 1 - I - 0x00F272 03:B262: 8B        .byte $8B   ; 
- D 1 - I - 0x00F273 03:B263: 28        .byte $28   ; 
- D 1 - I - 0x00F274 03:B264: 30        .byte $30   ; 
- D 1 - I - 0x00F275 03:B265: A4        .byte $A4   ; 
- D 1 - I - 0x00F276 03:B266: 2D        .byte $2D   ; 
- D 1 - I - 0x00F277 03:B267: 00        .byte $00   ; 
- D 1 - I - 0x00F278 03:B268: 9C        .byte $9C   ; 
- D 1 - I - 0x00F279 03:B269: A0        .byte $A0   ; 
- D 1 - I - 0x00F27A 03:B26A: 00        .byte $00   ; 
- D 1 - I - 0x00F27B 03:B26B: 00        .byte $00   ; 
- - - - - - 0x00F27C 03:B26C: 2D        .byte $2D   ; 
- - - - - - 0x00F27D 03:B26D: 00        .byte $00   ; 
- - - - - - 0x00F27E 03:B26E: 2D        .byte $2D   ; 
- - - - - - 0x00F27F 03:B26F: 00        .byte $00   ; 
- - - - - - 0x00F280 03:B270: 00        .byte $00   ; 
- - - - - - 0x00F281 03:B271: 00        .byte $00   ; 
- - - - - - 0x00F282 03:B272: 00        .byte $00   ; 
- - - - - - 0x00F283 03:B273: 00        .byte $00   ; 
- D 1 - I - 0x00F284 03:B274: 2F        .byte $2F   ; 
- D 1 - I - 0x00F285 03:B275: 8B        .byte $8B   ; 
- D 1 - I - 0x00F286 03:B276: 2F        .byte $2F   ; 
- D 1 - I - 0x00F287 03:B277: 8B        .byte $8B   ; 
- D 1 - I - 0x00F288 03:B278: 8C        .byte $8C   ; 
- D 1 - I - 0x00F289 03:B279: 2F        .byte $2F   ; 
- D 1 - I - 0x00F28A 03:B27A: 8C        .byte $8C   ; 
- D 1 - I - 0x00F28B 03:B27B: 2F        .byte $2F   ; 
- D 1 - I - 0x00F28C 03:B27C: 2F        .byte $2F   ; 
- D 1 - I - 0x00F28D 03:B27D: 8B        .byte $8B   ; 
- D 1 - I - 0x00F28E 03:B27E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F28F 03:B27F: 8B        .byte $8B   ; 
- D 1 - I - 0x00F290 03:B280: 9E        .byte $9E   ; 
- D 1 - I - 0x00F291 03:B281: 31        .byte $31   ; 
- D 1 - I - 0x00F292 03:B282: 9E        .byte $9E   ; 
- D 1 - I - 0x00F293 03:B283: 31        .byte $31   ; 
- D 1 - I - 0x00F294 03:B284: 2F        .byte $2F   ; 
- D 1 - I - 0x00F295 03:B285: 8B        .byte $8B   ; 
- D 1 - I - 0x00F296 03:B286: 2F        .byte $2F   ; 
- D 1 - I - 0x00F297 03:B287: 8B        .byte $8B   ; 
- D 1 - I - 0x00F298 03:B288: 8C        .byte $8C   ; 
- D 1 - I - 0x00F299 03:B289: 2F        .byte $2F   ; 
- D 1 - I - 0x00F29A 03:B28A: 8C        .byte $8C   ; 
- D 1 - I - 0x00F29B 03:B28B: 2F        .byte $2F   ; 
- D 1 - I - 0x00F29C 03:B28C: 2F        .byte $2F   ; 
- D 1 - I - 0x00F29D 03:B28D: 8B        .byte $8B   ; 
- D 1 - I - 0x00F29E 03:B28E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F29F 03:B28F: 9E        .byte $9E   ; 
- D 1 - I - 0x00F2A0 03:B290: 9E        .byte $9E   ; 
- D 1 - I - 0x00F2A1 03:B291: 31        .byte $31   ; 
- D 1 - I - 0x00F2A2 03:B292: 9F        .byte $9F   ; 
- D 1 - I - 0x00F2A3 03:B293: 00        .byte $00   ; 
- D 1 - I - 0x00F2A4 03:B294: 2F        .byte $2F   ; 
- D 1 - I - 0x00F2A5 03:B295: 8B        .byte $8B   ; 
- D 1 - I - 0x00F2A6 03:B296: 2F        .byte $2F   ; 
- D 1 - I - 0x00F2A7 03:B297: 8B        .byte $8B   ; 
- D 1 - I - 0x00F2A8 03:B298: 8C        .byte $8C   ; 
- D 1 - I - 0x00F2A9 03:B299: 2F        .byte $2F   ; 
- D 1 - I - 0x00F2AA 03:B29A: 9E        .byte $9E   ; 
- D 1 - I - 0x00F2AB 03:B29B: 31        .byte $31   ; 
- D 1 - I - 0x00F2AC 03:B29C: 31        .byte $31   ; 
- D 1 - I - 0x00F2AD 03:B29D: 9F        .byte $9F   ; 
- D 1 - I - 0x00F2AE 03:B29E: 2D        .byte $2D   ; 
- D 1 - I - 0x00F2AF 03:B29F: A1        .byte $A1   ; 
- D 1 - I - 0x00F2B0 03:B2A0: A2        .byte $A2   ; 
- D 1 - I - 0x00F2B1 03:B2A1: A2        .byte $A2   ; 
- D 1 - I - 0x00F2B2 03:B2A2: 98        .byte $98   ; 
- D 1 - I - 0x00F2B3 03:B2A3: 9A        .byte $9A   ; 
- D 1 - I - 0x00F2B4 03:B2A4: 28        .byte $28   ; 
- D 1 - I - 0x00F2B5 03:B2A5: 28        .byte $28   ; 
- D 1 - I - 0x00F2B6 03:B2A6: 31        .byte $31   ; 
- D 1 - I - 0x00F2B7 03:B2A7: 9F        .byte $9F   ; 
- D 1 - I - 0x00F2B8 03:B2A8: 35        .byte $35   ; 
- D 1 - I - 0x00F2B9 03:B2A9: 9F        .byte $9F   ; 
- D 1 - I - 0x00F2BA 03:B2AA: 00        .byte $00   ; 
- D 1 - I - 0x00F2BB 03:B2AB: A2        .byte $A2   ; 
- - - - - - 0x00F2BC 03:B2AC: 2D        .byte $2D   ; 
- - - - - - 0x00F2BD 03:B2AD: 00        .byte $00   ; 
- - - - - - 0x00F2BE 03:B2AE: 2D        .byte $2D   ; 
- - - - - - 0x00F2BF 03:B2AF: 00        .byte $00   ; 
- - - - - - 0x00F2C0 03:B2B0: 00        .byte $00   ; 
- - - - - - 0x00F2C1 03:B2B1: 00        .byte $00   ; 
- - - - - - 0x00F2C2 03:B2B2: 00        .byte $00   ; 
- - - - - - 0x00F2C3 03:B2B3: 00        .byte $00   ; 
- D 1 - I - 0x00F2C4 03:B2B4: 32        .byte $32   ; 
- D 1 - I - 0x00F2C5 03:B2B5: A1        .byte $A1   ; 
- D 1 - I - 0x00F2C6 03:B2B6: 32        .byte $32   ; 
- D 1 - I - 0x00F2C7 03:B2B7: 32        .byte $32   ; 
- D 1 - I - 0x00F2C8 03:B2B8: 99        .byte $99   ; 
- D 1 - I - 0x00F2C9 03:B2B9: 9A        .byte $9A   ; 
- D 1 - I - 0x00F2CA 03:B2BA: 9C        .byte $9C   ; 
- D 1 - I - 0x00F2CB 03:B2BB: 99        .byte $99   ; 
- - - - - - 0x00F2CC 03:B2BC: 2D        .byte $2D   ; 
- - - - - - 0x00F2CD 03:B2BD: 00        .byte $00   ; 
- - - - - - 0x00F2CE 03:B2BE: 2D        .byte $2D   ; 
- - - - - - 0x00F2CF 03:B2BF: 00        .byte $00   ; 
- - - - - - 0x00F2D0 03:B2C0: 00        .byte $00   ; 
- - - - - - 0x00F2D1 03:B2C1: 00        .byte $00   ; 
- - - - - - 0x00F2D2 03:B2C2: 00        .byte $00   ; 
- - - - - - 0x00F2D3 03:B2C3: 00        .byte $00   ; 
- D 1 - I - 0x00F2D4 03:B2C4: 32        .byte $32   ; 
- D 1 - I - 0x00F2D5 03:B2C5: A1        .byte $A1   ; 
- D 1 - I - 0x00F2D6 03:B2C6: 32        .byte $32   ; 
- D 1 - I - 0x00F2D7 03:B2C7: 9B        .byte $9B   ; 
- D 1 - I - 0x00F2D8 03:B2C8: 99        .byte $99   ; 
- D 1 - I - 0x00F2D9 03:B2C9: 9A        .byte $9A   ; 
- D 1 - I - 0x00F2DA 03:B2CA: 9C        .byte $9C   ; 
- D 1 - I - 0x00F2DB 03:B2CB: 9D        .byte $9D   ; 
- - - - - - 0x00F2DC 03:B2CC: 2D        .byte $2D   ; 
- - - - - - 0x00F2DD 03:B2CD: 00        .byte $00   ; 
- - - - - - 0x00F2DE 03:B2CE: 2D        .byte $2D   ; 
- - - - - - 0x00F2DF 03:B2CF: 00        .byte $00   ; 
- - - - - - 0x00F2E0 03:B2D0: 00        .byte $00   ; 
- - - - - - 0x00F2E1 03:B2D1: 00        .byte $00   ; 
- - - - - - 0x00F2E2 03:B2D2: 00        .byte $00   ; 
- - - - - - 0x00F2E3 03:B2D3: 00        .byte $00   ; 
- D 1 - I - 0x00F2E4 03:B2D4: 30        .byte $30   ; 
- D 1 - I - 0x00F2E5 03:B2D5: 98        .byte $98   ; 
- D 1 - I - 0x00F2E6 03:B2D6: 30        .byte $30   ; 
- D 1 - I - 0x00F2E7 03:B2D7: 9B        .byte $9B   ; 
- D 1 - I - 0x00F2E8 03:B2D8: 9C        .byte $9C   ; 
- D 1 - I - 0x00F2E9 03:B2D9: 9A        .byte $9A   ; 
- D 1 - I - 0x00F2EA 03:B2DA: 9C        .byte $9C   ; 
- D 1 - I - 0x00F2EB 03:B2DB: 9D        .byte $9D   ; 
- - - - - - 0x00F2EC 03:B2DC: 2D        .byte $2D   ; 
- - - - - - 0x00F2ED 03:B2DD: 00        .byte $00   ; 
- - - - - - 0x00F2EE 03:B2DE: 2D        .byte $2D   ; 
- - - - - - 0x00F2EF 03:B2DF: 00        .byte $00   ; 
- - - - - - 0x00F2F0 03:B2E0: 00        .byte $00   ; 
- - - - - - 0x00F2F1 03:B2E1: 00        .byte $00   ; 
- - - - - - 0x00F2F2 03:B2E2: 00        .byte $00   ; 
- - - - - - 0x00F2F3 03:B2E3: 00        .byte $00   ; 
- D 1 - I - 0x00F2F4 03:B2E4: 2F        .byte $2F   ; 
- D 1 - I - 0x00F2F5 03:B2E5: 9F        .byte $9F   ; 
- D 1 - I - 0x00F2F6 03:B2E6: 2D        .byte $2D   ; 
- D 1 - I - 0x00F2F7 03:B2E7: 00        .byte $00   ; 
- D 1 - I - 0x00F2F8 03:B2E8: 9F        .byte $9F   ; 
- D 1 - I - 0x00F2F9 03:B2E9: A3        .byte $A3   ; 
- D 1 - I - 0x00F2FA 03:B2EA: 00        .byte $00   ; 
- D 1 - I - 0x00F2FB 03:B2EB: 00        .byte $00   ; 
- D 1 - I - 0x00F2FC 03:B2EC: 32        .byte $32   ; 
- D 1 - I - 0x00F2FD 03:B2ED: A4        .byte $A4   ; 
- D 1 - I - 0x00F2FE 03:B2EE: 2D        .byte $2D   ; 
- D 1 - I - 0x00F2FF 03:B2EF: 00        .byte $00   ; 
- D 1 - I - 0x00F300 03:B2F0: 9A        .byte $9A   ; 
- D 1 - I - 0x00F301 03:B2F1: A0        .byte $A0   ; 
- D 1 - I - 0x00F302 03:B2F2: 00        .byte $00   ; 
- D 1 - I - 0x00F303 03:B2F3: 00        .byte $00   ; 
- D 1 - I - 0x00F304 03:B2F4: 00        .byte $00   ; 
- D 1 - I - 0x00F305 03:B2F5: 00        .byte $00   ; 
- D 1 - I - 0x00F306 03:B2F6: 00        .byte $00   ; 
- D 1 - I - 0x00F307 03:B2F7: 00        .byte $00   ; 
- D 1 - I - 0x00F308 03:B2F8: 00        .byte $00   ; 
- D 1 - I - 0x00F309 03:B2F9: 00        .byte $00   ; 
- D 1 - I - 0x00F30A 03:B2FA: 00        .byte $00   ; 
- D 1 - I - 0x00F30B 03:B2FB: 00        .byte $00   ; 
- D 1 - I - 0x00F30C 03:B2FC: 2A        .byte $2A   ; 
- D 1 - I - 0x00F30D 03:B2FD: 2B        .byte $2B   ; 
- D 1 - I - 0x00F30E 03:B2FE: 2B        .byte $2B   ; 
- D 1 - I - 0x00F30F 03:B2FF: A5        .byte $A5   ; 
- D 1 - I - 0x00F310 03:B300: A7        .byte $A7   ; 
- D 1 - I - 0x00F311 03:B301: A9        .byte $A9   ; 
- D 1 - I - 0x00F312 03:B302: A8        .byte $A8   ; 
- D 1 - I - 0x00F313 03:B303: A9        .byte $A9   ; 
- D 1 - I - 0x00F314 03:B304: 00        .byte $00   ; 
- D 1 - I - 0x00F315 03:B305: 00        .byte $00   ; 
- D 1 - I - 0x00F316 03:B306: 00        .byte $00   ; 
- D 1 - I - 0x00F317 03:B307: 00        .byte $00   ; 
- D 1 - I - 0x00F318 03:B308: 00        .byte $00   ; 
- D 1 - I - 0x00F319 03:B309: 00        .byte $00   ; 
- D 1 - I - 0x00F31A 03:B30A: 00        .byte $00   ; 
- D 1 - I - 0x00F31B 03:B30B: 00        .byte $00   ; 
- D 1 - I - 0x00F31C 03:B30C: 2C        .byte $2C   ; 
- D 1 - I - 0x00F31D 03:B30D: A5        .byte $A5   ; 
- D 1 - I - 0x00F31E 03:B30E: 2C        .byte $2C   ; 
- D 1 - I - 0x00F31F 03:B30F: A5        .byte $A5   ; 
- D 1 - I - 0x00F320 03:B310: A8        .byte $A8   ; 
- D 1 - I - 0x00F321 03:B311: A9        .byte $A9   ; 
- D 1 - I - 0x00F322 03:B312: A8        .byte $A8   ; 
- D 1 - I - 0x00F323 03:B313: A9        .byte $A9   ; 
- D 1 - I - 0x00F324 03:B314: 00        .byte $00   ; 
- D 1 - I - 0x00F325 03:B315: 00        .byte $00   ; 
- D 1 - I - 0x00F326 03:B316: 00        .byte $00   ; 
- D 1 - I - 0x00F327 03:B317: 00        .byte $00   ; 
- D 1 - I - 0x00F328 03:B318: 00        .byte $00   ; 
- D 1 - I - 0x00F329 03:B319: 00        .byte $00   ; 
- D 1 - I - 0x00F32A 03:B31A: 00        .byte $00   ; 
- D 1 - I - 0x00F32B 03:B31B: 00        .byte $00   ; 
- D 1 - I - 0x00F32C 03:B31C: 2C        .byte $2C   ; 
- D 1 - I - 0x00F32D 03:B31D: A5        .byte $A5   ; 
- D 1 - I - 0x00F32E 03:B31E: 2C        .byte $2C   ; 
- D 1 - I - 0x00F32F 03:B31F: A6        .byte $A6   ; 
- D 1 - I - 0x00F330 03:B320: A8        .byte $A8   ; 
- D 1 - I - 0x00F331 03:B321: A9        .byte $A9   ; 
- D 1 - I - 0x00F332 03:B322: A8        .byte $A8   ; 
- D 1 - I - 0x00F333 03:B323: AA        .byte $AA   ; 
- D 1 - I - 0x00F334 03:B324: 00        .byte $00   ; 
- D 1 - I - 0x00F335 03:B325: 00        .byte $00   ; 
- D 1 - I - 0x00F336 03:B326: 00        .byte $00   ; 
- D 1 - I - 0x00F337 03:B327: 00        .byte $00   ; 
- D 1 - I - 0x00F338 03:B328: 4C        .byte $4C   ; 
- D 1 - I - 0x00F339 03:B329: 4D        .byte $4D   ; 
- D 1 - I - 0x00F33A 03:B32A: 00        .byte $00   ; 
- D 1 - I - 0x00F33B 03:B32B: 00        .byte $00   ; 
- D 1 - I - 0x00F33C 03:B32C: 04        .byte $04   ; 
- D 1 - I - 0x00F33D 03:B32D: 50        .byte $50   ; 
- D 1 - I - 0x00F33E 03:B32E: 05        .byte $05   ; 
- D 1 - I - 0x00F33F 03:B32F: 00        .byte $00   ; 
- D 1 - I - 0x00F340 03:B330: 55        .byte $55   ; 
- D 1 - I - 0x00F341 03:B331: 56        .byte $56   ; 
- D 1 - I - 0x00F342 03:B332: 57        .byte $57   ; 
- D 1 - I - 0x00F343 03:B333: 00        .byte $00   ; 
- D 1 - I - 0x00F344 03:B334: 2F        .byte $2F   ; 
- D 1 - I - 0x00F345 03:B335: 8B        .byte $8B   ; 
- D 1 - I - 0x00F346 03:B336: 2F        .byte $2F   ; 
- D 1 - I - 0x00F347 03:B337: 8B        .byte $8B   ; 
- D 1 - I - 0x00F348 03:B338: 8C        .byte $8C   ; 
- D 1 - I - 0x00F349 03:B339: 2F        .byte $2F   ; 
- D 1 - I - 0x00F34A 03:B33A: 8C        .byte $8C   ; 
- D 1 - I - 0x00F34B 03:B33B: 2F        .byte $2F   ; 
- D 1 - I - 0x00F34C 03:B33C: 2F        .byte $2F   ; 
- D 1 - I - 0x00F34D 03:B33D: 8C        .byte $8C   ; 
- D 1 - I - 0x00F34E 03:B33E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F34F 03:B33F: 8C        .byte $8C   ; 
- D 1 - I - 0x00F350 03:B340: 28        .byte $28   ; 
- D 1 - I - 0x00F351 03:B341: 2F        .byte $2F   ; 
- D 1 - I - 0x00F352 03:B342: 28        .byte $28   ; 
- D 1 - I - 0x00F353 03:B343: 2F        .byte $2F   ; 
- D 1 - I - 0x00F354 03:B344: 2D        .byte $2D   ; 
- D 1 - I - 0x00F355 03:B345: 00        .byte $00   ; 
- D 1 - I - 0x00F356 03:B346: 33        .byte $33   ; 
- D 1 - I - 0x00F357 03:B347: AD        .byte $AD   ; 
- D 1 - I - 0x00F358 03:B348: 00        .byte $00   ; 
- D 1 - I - 0x00F359 03:B349: AE        .byte $AE   ; 
- D 1 - I - 0x00F35A 03:B34A: AF        .byte $AF   ; 
- D 1 - I - 0x00F35B 03:B34B: B0        .byte $B0   ; 
- D 1 - I - 0x00F35C 03:B34C: 2D        .byte $2D   ; 
- D 1 - I - 0x00F35D 03:B34D: B3        .byte $B3   ; 
- D 1 - I - 0x00F35E 03:B34E: B8        .byte $B8   ; 
- D 1 - I - 0x00F35F 03:B34F: B5        .byte $B5   ; 
- D 1 - I - 0x00F360 03:B350: B6        .byte $B6   ; 
- D 1 - I - 0x00F361 03:B351: B7        .byte $B7   ; 
- D 1 - I - 0x00F362 03:B352: B8        .byte $B8   ; 
- D 1 - I - 0x00F363 03:B353: B5        .byte $B5   ; 
- D 1 - I - 0x00F364 03:B354: 34        .byte $34   ; 
- D 1 - I - 0x00F365 03:B355: 34        .byte $34   ; 
- D 1 - I - 0x00F366 03:B356: 34        .byte $34   ; 
- D 1 - I - 0x00F367 03:B357: 34        .byte $34   ; 
- D 1 - I - 0x00F368 03:B358: B1        .byte $B1   ; 
- D 1 - I - 0x00F369 03:B359: B1        .byte $B1   ; 
- D 1 - I - 0x00F36A 03:B35A: B2        .byte $B2   ; 
- D 1 - I - 0x00F36B 03:B35B: B2        .byte $B2   ; 
- D 1 - I - 0x00F36C 03:B35C: 34        .byte $34   ; 
- D 1 - I - 0x00F36D 03:B35D: 34        .byte $34   ; 
- D 1 - I - 0x00F36E 03:B35E: 34        .byte $34   ; 
- D 1 - I - 0x00F36F 03:B35F: 34        .byte $34   ; 
- D 1 - I - 0x00F370 03:B360: 34        .byte $34   ; 
- D 1 - I - 0x00F371 03:B361: 34        .byte $34   ; 
- D 1 - I - 0x00F372 03:B362: 34        .byte $34   ; 
- D 1 - I - 0x00F373 03:B363: 34        .byte $34   ; 
- D 1 - I - 0x00F374 03:B364: 08        .byte $08   ; 
- D 1 - I - 0x00F375 03:B365: 5B        .byte $5B   ; 
- D 1 - I - 0x00F376 03:B366: 00        .byte $00   ; 
- D 1 - I - 0x00F377 03:B367: 00        .byte $00   ; 
- D 1 - I - 0x00F378 03:B368: 61        .byte $61   ; 
- D 1 - I - 0x00F379 03:B369: 62        .byte $62   ; 
- D 1 - I - 0x00F37A 03:B36A: 45        .byte $45   ; 
- D 1 - I - 0x00F37B 03:B36B: 00        .byte $00   ; 
- D 1 - I - 0x00F37C 03:B36C: 0B        .byte $0B   ; 
- D 1 - I - 0x00F37D 03:B36D: 46        .byte $46   ; 
- D 1 - I - 0x00F37E 03:B36E: 0C        .byte $0C   ; 
- D 1 - I - 0x00F37F 03:B36F: 00        .byte $00   ; 
- D 1 - I - 0x00F380 03:B370: 6C        .byte $6C   ; 
- D 1 - I - 0x00F381 03:B371: 00        .byte $00   ; 
- D 1 - I - 0x00F382 03:B372: 00        .byte $00   ; 
- D 1 - I - 0x00F383 03:B373: 00        .byte $00   ; 
- D 1 - I - 0x00F384 03:B374: 35        .byte $35   ; 
- D 1 - I - 0x00F385 03:B375: 8D        .byte $8D   ; 
- D 1 - I - 0x00F386 03:B376: 2F        .byte $2F   ; 
- D 1 - I - 0x00F387 03:B377: 28        .byte $28   ; 
- D 1 - I - 0x00F388 03:B378: 00        .byte $00   ; 
- D 1 - I - 0x00F389 03:B379: 8E        .byte $8E   ; 
- D 1 - I - 0x00F38A 03:B37A: 35        .byte $35   ; 
- D 1 - I - 0x00F38B 03:B37B: 35        .byte $35   ; 
- - - - - - 0x00F38C 03:B37C: 2D        .byte $2D   ; 
- - - - - - 0x00F38D 03:B37D: 00        .byte $00   ; 
- - - - - - 0x00F38E 03:B37E: 2D        .byte $2D   ; 
- - - - - - 0x00F38F 03:B37F: 00        .byte $00   ; 
- - - - - - 0x00F390 03:B380: 00        .byte $00   ; 
- - - - - - 0x00F391 03:B381: 00        .byte $00   ; 
- - - - - - 0x00F392 03:B382: 00        .byte $00   ; 
- - - - - - 0x00F393 03:B383: 00        .byte $00   ; 
- D 1 - I - 0x00F394 03:B384: 36        .byte $36   ; 
- D 1 - I - 0x00F395 03:B385: B7        .byte $B7   ; 
- D 1 - I - 0x00F396 03:B386: B8        .byte $B8   ; 
- D 1 - I - 0x00F397 03:B387: B5        .byte $B5   ; 
- D 1 - I - 0x00F398 03:B388: AB        .byte $AB   ; 
- D 1 - I - 0x00F399 03:B389: B7        .byte $B7   ; 
- D 1 - I - 0x00F39A 03:B38A: B8        .byte $B8   ; 
- D 1 - I - 0x00F39B 03:B38B: B5        .byte $B5   ; 
- - - - - - 0x00F39C 03:B38C: 2D        .byte $2D   ; 
- - - - - - 0x00F39D 03:B38D: 00        .byte $00   ; 
- - - - - - 0x00F39E 03:B38E: 2D        .byte $2D   ; 
- - - - - - 0x00F39F 03:B38F: 00        .byte $00   ; 
- - - - - - 0x00F3A0 03:B390: 00        .byte $00   ; 
- - - - - - 0x00F3A1 03:B391: 00        .byte $00   ; 
- - - - - - 0x00F3A2 03:B392: 00        .byte $00   ; 
- - - - - - 0x00F3A3 03:B393: 00        .byte $00   ; 
- D 1 - I - 0x00F3A4 03:B394: 34        .byte $34   ; 
- D 1 - I - 0x00F3A5 03:B395: 34        .byte $34   ; 
- D 1 - I - 0x00F3A6 03:B396: 34        .byte $34   ; 
- D 1 - I - 0x00F3A7 03:B397: 34        .byte $34   ; 
- D 1 - I - 0x00F3A8 03:B398: 34        .byte $34   ; 
- D 1 - I - 0x00F3A9 03:B399: 34        .byte $34   ; 
- D 1 - I - 0x00F3AA 03:B39A: 34        .byte $34   ; 
- D 1 - I - 0x00F3AB 03:B39B: 34        .byte $34   ; 
- - - - - - 0x00F3AC 03:B39C: 2D        .byte $2D   ; 
- - - - - - 0x00F3AD 03:B39D: 2D        .byte $2D   ; 
- - - - - - 0x00F3AE 03:B39E: 2D        .byte $2D   ; 
- - - - - - 0x00F3AF 03:B39F: 2D        .byte $2D   ; 
- - - - - - 0x00F3B0 03:B3A0: 00        .byte $00   ; 
- - - - - - 0x00F3B1 03:B3A1: 00        .byte $00   ; 
- - - - - - 0x00F3B2 03:B3A2: 00        .byte $00   ; 
- - - - - - 0x00F3B3 03:B3A3: 00        .byte $00   ; 
- D 1 - I - 0x00F3B4 03:B3A4: 00        .byte $00   ; 
- D 1 - I - 0x00F3B5 03:B3A5: 00        .byte $00   ; 
- D 1 - I - 0x00F3B6 03:B3A6: 00        .byte $00   ; 
- D 1 - I - 0x00F3B7 03:B3A7: 00        .byte $00   ; 
- D 1 - I - 0x00F3B8 03:B3A8: 00        .byte $00   ; 
- D 1 - I - 0x00F3B9 03:B3A9: 00        .byte $00   ; 
- D 1 - I - 0x00F3BA 03:B3AA: 00        .byte $00   ; 
- D 1 - I - 0x00F3BB 03:B3AB: 00        .byte $00   ; 
- D 1 - I - 0x00F3BC 03:B3AC: 2D        .byte $2D   ; 
- D 1 - I - 0x00F3BD 03:B3AD: 2D        .byte $2D   ; 
- D 1 - I - 0x00F3BE 03:B3AE: 2D        .byte $2D   ; 
- D 1 - I - 0x00F3BF 03:B3AF: 2D        .byte $2D   ; 
- D 1 - I - 0x00F3C0 03:B3B0: AC        .byte $AC   ; 
- D 1 - I - 0x00F3C1 03:B3B1: AC        .byte $AC   ; 
- D 1 - I - 0x00F3C2 03:B3B2: AC        .byte $AC   ; 
- D 1 - I - 0x00F3C3 03:B3B3: AC        .byte $AC   ; 
- D 1 - I - 0x00F3C4 03:B3B4: 34        .byte $34   ; 
- D 1 - I - 0x00F3C5 03:B3B5: 34        .byte $34   ; 
- D 1 - I - 0x00F3C6 03:B3B6: 34        .byte $34   ; 
- D 1 - I - 0x00F3C7 03:B3B7: 34        .byte $34   ; 
- D 1 - I - 0x00F3C8 03:B3B8: B2        .byte $B2   ; 
- D 1 - I - 0x00F3C9 03:B3B9: B2        .byte $B2   ; 
- D 1 - I - 0x00F3CA 03:B3BA: B2        .byte $B2   ; 
- D 1 - I - 0x00F3CB 03:B3BB: B2        .byte $B2   ; 
- D 1 - I - 0x00F3CC 03:B3BC: 34        .byte $34   ; 
- D 1 - I - 0x00F3CD 03:B3BD: 34        .byte $34   ; 
- D 1 - I - 0x00F3CE 03:B3BE: 34        .byte $34   ; 
- D 1 - I - 0x00F3CF 03:B3BF: 34        .byte $34   ; 
- D 1 - I - 0x00F3D0 03:B3C0: 34        .byte $34   ; 
- D 1 - I - 0x00F3D1 03:B3C1: 34        .byte $34   ; 
- D 1 - I - 0x00F3D2 03:B3C2: 34        .byte $34   ; 
- D 1 - I - 0x00F3D3 03:B3C3: 34        .byte $34   ; 
- D 1 - I - 0x00F3D4 03:B3C4: 18        .byte $18   ; 
- D 1 - I - 0x00F3D5 03:B3C5: 84        .byte $84   ; 
- D 1 - I - 0x00F3D6 03:B3C6: 17        .byte $17   ; 
- D 1 - I - 0x00F3D7 03:B3C7: 86        .byte $86   ; 
- D 1 - I - 0x00F3D8 03:B3C8: 00        .byte $00   ; 
- D 1 - I - 0x00F3D9 03:B3C9: 00        .byte $00   ; 
- D 1 - I - 0x00F3DA 03:B3CA: 98        .byte $98   ; 
- D 1 - I - 0x00F3DB 03:B3CB: 85        .byte $85   ; 
- D 1 - I - 0x00F3DC 03:B3CC: 21        .byte $21   ; 
- D 1 - I - 0x00F3DD 03:B3CD: 99        .byte $99   ; 
- D 1 - I - 0x00F3DE 03:B3CE: 00        .byte $00   ; 
- D 1 - I - 0x00F3DF 03:B3CF: 00        .byte $00   ; 
- D 1 - I - 0x00F3E0 03:B3D0: 9A        .byte $9A   ; 
- D 1 - I - 0x00F3E1 03:B3D1: 9B        .byte $9B   ; 
- D 1 - I - 0x00F3E2 03:B3D2: 9C        .byte $9C   ; 
- D 1 - I - 0x00F3E3 03:B3D3: 00        .byte $00   ; 
- D 1 - I - 0x00F3E4 03:B3D4: 1B        .byte $1B   ; 
- D 1 - I - 0x00F3E5 03:B3D5: 1B        .byte $1B   ; 
- D 1 - I - 0x00F3E6 03:B3D6: 1B        .byte $1B   ; 
- D 1 - I - 0x00F3E7 03:B3D7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F3E8 03:B3D8: 89        .byte $89   ; 
- D 1 - I - 0x00F3E9 03:B3D9: 8A        .byte $8A   ; 
- D 1 - I - 0x00F3EA 03:B3DA: 89        .byte $89   ; 
- D 1 - I - 0x00F3EB 03:B3DB: 8A        .byte $8A   ; 
- D 1 - I - 0x00F3EC 03:B3DC: 28        .byte $28   ; 
- D 1 - I - 0x00F3ED 03:B3DD: 28        .byte $28   ; 
- D 1 - I - 0x00F3EE 03:B3DE: 28        .byte $28   ; 
- D 1 - I - 0x00F3EF 03:B3DF: A3        .byte $A3   ; 
- D 1 - I - 0x00F3F0 03:B3E0: 8B        .byte $8B   ; 
- D 1 - I - 0x00F3F1 03:B3E1: 28        .byte $28   ; 
- D 1 - I - 0x00F3F2 03:B3E2: 8B        .byte $8B   ; 
- D 1 - I - 0x00F3F3 03:B3E3: A7        .byte $A7   ; 
- D 1 - I - 0x00F3F4 03:B3E4: 22        .byte $22   ; 
- D 1 - I - 0x00F3F5 03:B3E5: 9D        .byte $9D   ; 
- D 1 - I - 0x00F3F6 03:B3E6: 23        .byte $23   ; 
- D 1 - I - 0x00F3F7 03:B3E7: 9E        .byte $9E   ; 
- D 1 - I - 0x00F3F8 03:B3E8: 9F        .byte $9F   ; 
- D 1 - I - 0x00F3F9 03:B3E9: A0        .byte $A0   ; 
- D 1 - I - 0x00F3FA 03:B3EA: A1        .byte $A1   ; 
- D 1 - I - 0x00F3FB 03:B3EB: A2        .byte $A2   ; 
- D 1 - I - 0x00F3FC 03:B3EC: 38        .byte $38   ; 
- D 1 - I - 0x00F3FD 03:B3ED: A4        .byte $A4   ; 
- D 1 - I - 0x00F3FE 03:B3EE: 39        .byte $39   ; 
- D 1 - I - 0x00F3FF 03:B3EF: A5        .byte $A5   ; 
- D 1 - I - 0x00F400 03:B3F0: A8        .byte $A8   ; 
- D 1 - I - 0x00F401 03:B3F1: A9        .byte $A9   ; 
- D 1 - I - 0x00F402 03:B3F2: AA        .byte $AA   ; 
- D 1 - I - 0x00F403 03:B3F3: AB        .byte $AB   ; 
- D 1 - I - 0x00F404 03:B3F4: 1A        .byte $1A   ; 
- D 1 - I - 0x00F405 03:B3F5: 1B        .byte $1B   ; 
- D 1 - I - 0x00F406 03:B3F6: 1B        .byte $1B   ; 
- D 1 - I - 0x00F407 03:B3F7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F408 03:B3F8: 8F        .byte $8F   ; 
- D 1 - I - 0x00F409 03:B3F9: 8A        .byte $8A   ; 
- D 1 - I - 0x00F40A 03:B3FA: 89        .byte $89   ; 
- D 1 - I - 0x00F40B 03:B3FB: 8A        .byte $8A   ; 
- D 1 - I - 0x00F40C 03:B3FC: 27        .byte $27   ; 
- D 1 - I - 0x00F40D 03:B3FD: A6        .byte $A6   ; 
- D 1 - I - 0x00F40E 03:B3FE: 28        .byte $28   ; 
- D 1 - I - 0x00F40F 03:B3FF: 28        .byte $28   ; 
- D 1 - I - 0x00F410 03:B400: AC        .byte $AC   ; 
- D 1 - I - 0x00F411 03:B401: AD        .byte $AD   ; 
- D 1 - I - 0x00F412 03:B402: 8B        .byte $8B   ; 
- D 1 - I - 0x00F413 03:B403: 28        .byte $28   ; 
- D 1 - I - 0x00F414 03:B404: 1B        .byte $1B   ; 
- D 1 - I - 0x00F415 03:B405: 1B        .byte $1B   ; 
- D 1 - I - 0x00F416 03:B406: 1B        .byte $1B   ; 
- D 1 - I - 0x00F417 03:B407: 1B        .byte $1B   ; 
- D 1 - I - 0x00F418 03:B408: 89        .byte $89   ; 
- D 1 - I - 0x00F419 03:B409: 8A        .byte $8A   ; 
- D 1 - I - 0x00F41A 03:B40A: 89        .byte $89   ; 
- D 1 - I - 0x00F41B 03:B40B: 8A        .byte $8A   ; 
- D 1 - I - 0x00F41C 03:B40C: 28        .byte $28   ; 
- D 1 - I - 0x00F41D 03:B40D: 28        .byte $28   ; 
- D 1 - I - 0x00F41E 03:B40E: 28        .byte $28   ; 
- D 1 - I - 0x00F41F 03:B40F: 28        .byte $28   ; 
- D 1 - I - 0x00F420 03:B410: 8B        .byte $8B   ; 
- D 1 - I - 0x00F421 03:B411: 28        .byte $28   ; 
- D 1 - I - 0x00F422 03:B412: 8B        .byte $8B   ; 
- D 1 - I - 0x00F423 03:B413: BB        .byte $BB   ; 
- D 1 - I - 0x00F424 03:B414: 1B        .byte $1B   ; 
- D 1 - I - 0x00F425 03:B415: 1B        .byte $1B   ; 
- D 1 - I - 0x00F426 03:B416: 1B        .byte $1B   ; 
- D 1 - I - 0x00F427 03:B417: 1B        .byte $1B   ; 
- D 1 - I - 0x00F428 03:B418: 89        .byte $89   ; 
- D 1 - I - 0x00F429 03:B419: 8A        .byte $8A   ; 
- D 1 - I - 0x00F42A 03:B41A: 89        .byte $89   ; 
- D 1 - I - 0x00F42B 03:B41B: 8A        .byte $8A   ; 
- D 1 - I - 0x00F42C 03:B41C: 28        .byte $28   ; 
- D 1 - I - 0x00F42D 03:B41D: 28        .byte $28   ; 
- D 1 - I - 0x00F42E 03:B41E: 28        .byte $28   ; 
- D 1 - I - 0x00F42F 03:B41F: 28        .byte $28   ; 
- D 1 - I - 0x00F430 03:B420: BC        .byte $BC   ; 
- D 1 - I - 0x00F431 03:B421: BD        .byte $BD   ; 
- D 1 - I - 0x00F432 03:B422: BE        .byte $BE   ; 
- D 1 - I - 0x00F433 03:B423: BF        .byte $BF   ; 
- D 1 - I - 0x00F434 03:B424: 2F        .byte $2F   ; 
- D 1 - I - 0x00F435 03:B425: 8B        .byte $8B   ; 
- D 1 - I - 0x00F436 03:B426: 2F        .byte $2F   ; 
- D 1 - I - 0x00F437 03:B427: 8B        .byte $8B   ; 
- D 1 - I - 0x00F438 03:B428: 8C        .byte $8C   ; 
- D 1 - I - 0x00F439 03:B429: 2F        .byte $2F   ; 
- D 1 - I - 0x00F43A 03:B42A: 8C        .byte $8C   ; 
- D 1 - I - 0x00F43B 03:B42B: 2F        .byte $2F   ; 
- D 1 - I - 0x00F43C 03:B42C: 2F        .byte $2F   ; 
- D 1 - I - 0x00F43D 03:B42D: 8D        .byte $8D   ; 
- D 1 - I - 0x00F43E 03:B42E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F43F 03:B42F: 8C        .byte $8C   ; 
- D 1 - I - 0x00F440 03:B430: 35        .byte $35   ; 
- D 1 - I - 0x00F441 03:B431: 8E        .byte $8E   ; 
- D 1 - I - 0x00F442 03:B432: 35        .byte $35   ; 
- D 1 - I - 0x00F443 03:B433: 8D        .byte $8D   ; 
- D 1 - I - 0x00F444 03:B434: 2D        .byte $2D   ; 
- D 1 - I - 0x00F445 03:B435: 00        .byte $00   ; 
- D 1 - I - 0x00F446 03:B436: 2D        .byte $2D   ; 
- D 1 - I - 0x00F447 03:B437: 8E        .byte $8E   ; 
- D 1 - I - 0x00F448 03:B438: 00        .byte $00   ; 
- D 1 - I - 0x00F449 03:B439: 00        .byte $00   ; 
- D 1 - I - 0x00F44A 03:B43A: 00        .byte $00   ; 
- D 1 - I - 0x00F44B 03:B43B: 00        .byte $00   ; 
- - - - - - 0x00F44C 03:B43C: 2D        .byte $2D   ; 
- - - - - - 0x00F44D 03:B43D: 00        .byte $00   ; 
- - - - - - 0x00F44E 03:B43E: 2D        .byte $2D   ; 
- - - - - - 0x00F44F 03:B43F: 00        .byte $00   ; 
- - - - - - 0x00F450 03:B440: 00        .byte $00   ; 
- - - - - - 0x00F451 03:B441: 00        .byte $00   ; 
- - - - - - 0x00F452 03:B442: 00        .byte $00   ; 
- - - - - - 0x00F453 03:B443: 00        .byte $00   ; 
- D 1 - I - 0x00F454 03:B444: 18        .byte $18   ; 
- D 1 - I - 0x00F455 03:B445: 84        .byte $84   ; 
- D 1 - I - 0x00F456 03:B446: 17        .byte $17   ; 
- D 1 - I - 0x00F457 03:B447: 86        .byte $86   ; 
- D 1 - I - 0x00F458 03:B448: 00        .byte $00   ; 
- D 1 - I - 0x00F459 03:B449: 00        .byte $00   ; 
- D 1 - I - 0x00F45A 03:B44A: 98        .byte $98   ; 
- D 1 - I - 0x00F45B 03:B44B: 85        .byte $85   ; 
- D 1 - I - 0x00F45C 03:B44C: AE        .byte $AE   ; 
- D 1 - I - 0x00F45D 03:B44D: AF        .byte $AF   ; 
- D 1 - I - 0x00F45E 03:B44E: 00        .byte $00   ; 
- D 1 - I - 0x00F45F 03:B44F: 00        .byte $00   ; 
- D 1 - I - 0x00F460 03:B450: 9A        .byte $9A   ; 
- D 1 - I - 0x00F461 03:B451: B0        .byte $B0   ; 
- D 1 - I - 0x00F462 03:B452: B1        .byte $B1   ; 
- D 1 - I - 0x00F463 03:B453: 00        .byte $00   ; 
- D 1 - I - 0x00F464 03:B454: 22        .byte $22   ; 
- D 1 - I - 0x00F465 03:B455: B2        .byte $B2   ; 
- D 1 - I - 0x00F466 03:B456: B3        .byte $B3   ; 
- D 1 - I - 0x00F467 03:B457: 9E        .byte $9E   ; 
- D 1 - I - 0x00F468 03:B458: 9F        .byte $9F   ; 
- D 1 - I - 0x00F469 03:B459: A0        .byte $A0   ; 
- D 1 - I - 0x00F46A 03:B45A: A1        .byte $A1   ; 
- D 1 - I - 0x00F46B 03:B45B: A2        .byte $A2   ; 
- D 1 - I - 0x00F46C 03:B45C: 38        .byte $38   ; 
- D 1 - I - 0x00F46D 03:B45D: A4        .byte $A4   ; 
- D 1 - I - 0x00F46E 03:B45E: 39        .byte $39   ; 
- D 1 - I - 0x00F46F 03:B45F: B4        .byte $B4   ; 
- D 1 - I - 0x00F470 03:B460: A8        .byte $A8   ; 
- D 1 - I - 0x00F471 03:B461: A9        .byte $A9   ; 
- D 1 - I - 0x00F472 03:B462: AA        .byte $AA   ; 
- D 1 - I - 0x00F473 03:B463: B5        .byte $B5   ; 
- D 1 - I - 0x00F474 03:B464: 1B        .byte $1B   ; 
- D 1 - I - 0x00F475 03:B465: 1B        .byte $1B   ; 
- D 1 - I - 0x00F476 03:B466: 1B        .byte $1B   ; 
- D 1 - I - 0x00F477 03:B467: 1B        .byte $1B   ; 
- D 1 - I - 0x00F478 03:B468: 89        .byte $89   ; 
- D 1 - I - 0x00F479 03:B469: 8A        .byte $8A   ; 
- D 1 - I - 0x00F47A 03:B46A: 89        .byte $89   ; 
- D 1 - I - 0x00F47B 03:B46B: 8A        .byte $8A   ; 
- D 1 - I - 0x00F47C 03:B46C: B6        .byte $B6   ; 
- D 1 - I - 0x00F47D 03:B46D: B7        .byte $B7   ; 
- D 1 - I - 0x00F47E 03:B46E: B8        .byte $B8   ; 
- D 1 - I - 0x00F47F 03:B46F: B9        .byte $B9   ; 
- D 1 - I - 0x00F480 03:B470: A8        .byte $A8   ; 
- D 1 - I - 0x00F481 03:B471: A9        .byte $A9   ; 
- D 1 - I - 0x00F482 03:B472: AA        .byte $AA   ; 
- D 1 - I - 0x00F483 03:B473: BA        .byte $BA   ; 
- D 1 - I - 0x00F484 03:B474: 1B        .byte $1B   ; 
- D 1 - I - 0x00F485 03:B475: 1B        .byte $1B   ; 
- D 1 - I - 0x00F486 03:B476: 1B        .byte $1B   ; 
- D 1 - I - 0x00F487 03:B477: 1B        .byte $1B   ; 
- D 1 - I - 0x00F488 03:B478: 89        .byte $89   ; 
- D 1 - I - 0x00F489 03:B479: 8A        .byte $8A   ; 
- D 1 - I - 0x00F48A 03:B47A: 89        .byte $89   ; 
- D 1 - I - 0x00F48B 03:B47B: 8A        .byte $8A   ; 
- D 1 - I - 0x00F48C 03:B47C: 28        .byte $28   ; 
- D 1 - I - 0x00F48D 03:B47D: 28        .byte $28   ; 
- D 1 - I - 0x00F48E 03:B47E: C0        .byte $C0   ; 
- D 1 - I - 0x00F48F 03:B47F: C1        .byte $C1   ; 
- D 1 - I - 0x00F490 03:B480: 8B        .byte $8B   ; 
- D 1 - I - 0x00F491 03:B481: 28        .byte $28   ; 
- D 1 - I - 0x00F492 03:B482: C5        .byte $C5   ; 
- D 1 - I - 0x00F493 03:B483: C6        .byte $C6   ; 
- D 1 - I - 0x00F494 03:B484: 1B        .byte $1B   ; 
- D 1 - I - 0x00F495 03:B485: 1B        .byte $1B   ; 
- D 1 - I - 0x00F496 03:B486: 1B        .byte $1B   ; 
- D 1 - I - 0x00F497 03:B487: 1B        .byte $1B   ; 
- D 1 - I - 0x00F498 03:B488: 89        .byte $89   ; 
- D 1 - I - 0x00F499 03:B489: 8A        .byte $8A   ; 
- D 1 - I - 0x00F49A 03:B48A: 89        .byte $89   ; 
- D 1 - I - 0x00F49B 03:B48B: 8A        .byte $8A   ; 
- D 1 - I - 0x00F49C 03:B48C: C2        .byte $C2   ; 
- D 1 - I - 0x00F49D 03:B48D: C3        .byte $C3   ; 
- D 1 - I - 0x00F49E 03:B48E: C4        .byte $C4   ; 
- D 1 - I - 0x00F49F 03:B48F: 28        .byte $28   ; 
- D 1 - I - 0x00F4A0 03:B490: C7        .byte $C7   ; 
- D 1 - I - 0x00F4A1 03:B491: C7        .byte $C7   ; 
- D 1 - I - 0x00F4A2 03:B492: C8        .byte $C8   ; 
- D 1 - I - 0x00F4A3 03:B493: C9        .byte $C9   ; 
- D 1 - I - 0x00F4A4 03:B494: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4A5 03:B495: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4A6 03:B496: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4A7 03:B497: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4A8 03:B498: 89        .byte $89   ; 
- D 1 - I - 0x00F4A9 03:B499: 8A        .byte $8A   ; 
- D 1 - I - 0x00F4AA 03:B49A: CA        .byte $CA   ; 
- D 1 - I - 0x00F4AB 03:B49B: CB        .byte $CB   ; 
- D 1 - I - 0x00F4AC 03:B49C: 28        .byte $28   ; 
- D 1 - I - 0x00F4AD 03:B49D: 28        .byte $28   ; 
- D 1 - I - 0x00F4AE 03:B49E: D0        .byte $D0   ; 
- D 1 - I - 0x00F4AF 03:B49F: D1        .byte $D1   ; 
- D 1 - I - 0x00F4B0 03:B4A0: 8B        .byte $8B   ; 
- D 1 - I - 0x00F4B1 03:B4A1: D5        .byte $D5   ; 
- D 1 - I - 0x00F4B2 03:B4A2: 00        .byte $00   ; 
- D 1 - I - 0x00F4B3 03:B4A3: D6        .byte $D6   ; 
- D 1 - I - 0x00F4B4 03:B4A4: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4B5 03:B4A5: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4B6 03:B4A6: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4B7 03:B4A7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4B8 03:B4A8: CC        .byte $CC   ; 
- D 1 - I - 0x00F4B9 03:B4A9: CD        .byte $CD   ; 
- D 1 - I - 0x00F4BA 03:B4AA: CE        .byte $CE   ; 
- D 1 - I - 0x00F4BB 03:B4AB: 8A        .byte $8A   ; 
- D 1 - I - 0x00F4BC 03:B4AC: D2        .byte $D2   ; 
- D 1 - I - 0x00F4BD 03:B4AD: D3        .byte $D3   ; 
- D 1 - I - 0x00F4BE 03:B4AE: D4        .byte $D4   ; 
- D 1 - I - 0x00F4BF 03:B4AF: 28        .byte $28   ; 
- D 1 - I - 0x00F4C0 03:B4B0: D7        .byte $D7   ; 
- D 1 - I - 0x00F4C1 03:B4B1: D8        .byte $D8   ; 
- D 1 - I - 0x00F4C2 03:B4B2: D9        .byte $D9   ; 
- D 1 - I - 0x00F4C3 03:B4B3: DA        .byte $DA   ; 
- D 1 - I - 0x00F4C4 03:B4B4: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4C5 03:B4B5: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4C6 03:B4B6: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4C7 03:B4B7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4C8 03:B4B8: 89        .byte $89   ; 
- D 1 - I - 0x00F4C9 03:B4B9: 8A        .byte $8A   ; 
- D 1 - I - 0x00F4CA 03:B4BA: DB        .byte $DB   ; 
- D 1 - I - 0x00F4CB 03:B4BB: DC        .byte $DC   ; 
- D 1 - I - 0x00F4CC 03:B4BC: 28        .byte $28   ; 
- D 1 - I - 0x00F4CD 03:B4BD: 28        .byte $28   ; 
- D 1 - I - 0x00F4CE 03:B4BE: E0        .byte $E0   ; 
- D 1 - I - 0x00F4CF 03:B4BF: E1        .byte $E1   ; 
- D 1 - I - 0x00F4D0 03:B4C0: 8B        .byte $8B   ; 
- D 1 - I - 0x00F4D1 03:B4C1: D5        .byte $D5   ; 
- D 1 - I - 0x00F4D2 03:B4C2: 00        .byte $00   ; 
- D 1 - I - 0x00F4D3 03:B4C3: E5        .byte $E5   ; 
- D 1 - I - 0x00F4D4 03:B4C4: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4D5 03:B4C5: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4D6 03:B4C6: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4D7 03:B4C7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4D8 03:B4C8: DD        .byte $DD   ; 
- D 1 - I - 0x00F4D9 03:B4C9: DE        .byte $DE   ; 
- D 1 - I - 0x00F4DA 03:B4CA: DF        .byte $DF   ; 
- D 1 - I - 0x00F4DB 03:B4CB: 8A        .byte $8A   ; 
- D 1 - I - 0x00F4DC 03:B4CC: E2        .byte $E2   ; 
- D 1 - I - 0x00F4DD 03:B4CD: E3        .byte $E3   ; 
- D 1 - I - 0x00F4DE 03:B4CE: E4        .byte $E4   ; 
- D 1 - I - 0x00F4DF 03:B4CF: 28        .byte $28   ; 
- D 1 - I - 0x00F4E0 03:B4D0: E6        .byte $E6   ; 
- D 1 - I - 0x00F4E1 03:B4D1: E7        .byte $E7   ; 
- D 1 - I - 0x00F4E2 03:B4D2: E8        .byte $E8   ; 
- D 1 - I - 0x00F4E3 03:B4D3: DA        .byte $DA   ; 
- D 1 - I - 0x00F4E4 03:B4D4: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4E5 03:B4D5: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4E6 03:B4D6: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4E7 03:B4D7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4E8 03:B4D8: 89        .byte $89   ; 
- D 1 - I - 0x00F4E9 03:B4D9: 8A        .byte $8A   ; 
- D 1 - I - 0x00F4EA 03:B4DA: 89        .byte $89   ; 
- D 1 - I - 0x00F4EB 03:B4DB: 8A        .byte $8A   ; 
- D 1 - I - 0x00F4EC 03:B4DC: 28        .byte $28   ; 
- D 1 - I - 0x00F4ED 03:B4DD: 28        .byte $28   ; 
- D 1 - I - 0x00F4EE 03:B4DE: E9        .byte $E9   ; 
- D 1 - I - 0x00F4EF 03:B4DF: EA        .byte $EA   ; 
- D 1 - I - 0x00F4F0 03:B4E0: 8B        .byte $8B   ; 
- D 1 - I - 0x00F4F1 03:B4E1: 28        .byte $28   ; 
- D 1 - I - 0x00F4F2 03:B4E2: ED        .byte $ED   ; 
- D 1 - I - 0x00F4F3 03:B4E3: EE        .byte $EE   ; 
- D 1 - I - 0x00F4F4 03:B4E4: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4F5 03:B4E5: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4F6 03:B4E6: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4F7 03:B4E7: 1B        .byte $1B   ; 
- D 1 - I - 0x00F4F8 03:B4E8: 89        .byte $89   ; 
- D 1 - I - 0x00F4F9 03:B4E9: 8A        .byte $8A   ; 
- D 1 - I - 0x00F4FA 03:B4EA: 89        .byte $89   ; 
- D 1 - I - 0x00F4FB 03:B4EB: 8A        .byte $8A   ; 
- D 1 - I - 0x00F4FC 03:B4EC: EB        .byte $EB   ; 
- D 1 - I - 0x00F4FD 03:B4ED: EB        .byte $EB   ; 
- D 1 - I - 0x00F4FE 03:B4EE: EC        .byte $EC   ; 
- D 1 - I - 0x00F4FF 03:B4EF: 28        .byte $28   ; 
- D 1 - I - 0x00F500 03:B4F0: EF        .byte $EF   ; 
- D 1 - I - 0x00F501 03:B4F1: EF        .byte $EF   ; 
- D 1 - I - 0x00F502 03:B4F2: F0        .byte $F0   ; 
- D 1 - I - 0x00F503 03:B4F3: F1        .byte $F1   ; 
- D 1 - I - 0x00F504 03:B4F4: 00        .byte $00   ; 
- D 1 - I - 0x00F505 03:B4F5: 00        .byte $00   ; 
- D 1 - I - 0x00F506 03:B4F6: 00        .byte $00   ; 
- D 1 - I - 0x00F507 03:B4F7: 00        .byte $00   ; 
- D 1 - I - 0x00F508 03:B4F8: 00        .byte $00   ; 
- D 1 - I - 0x00F509 03:B4F9: 00        .byte $00   ; 
- D 1 - I - 0x00F50A 03:B4FA: 00        .byte $00   ; 
- D 1 - I - 0x00F50B 03:B4FB: BC        .byte $BC   ; 
- D 1 - I - 0x00F50C 03:B4FC: 2D        .byte $2D   ; 
- D 1 - I - 0x00F50D 03:B4FD: 00        .byte $00   ; 
- D 1 - I - 0x00F50E 03:B4FE: 27        .byte $27   ; 
- D 1 - I - 0x00F50F 03:B4FF: BD        .byte $BD   ; 
- D 1 - I - 0x00F510 03:B500: AC        .byte $AC   ; 
- D 1 - I - 0x00F511 03:B501: AC        .byte $AC   ; 
- D 1 - I - 0x00F512 03:B502: BE        .byte $BE   ; 
- D 1 - I - 0x00F513 03:B503: BF        .byte $BF   ; 
- D 1 - I - 0x00F514 03:B504: 28        .byte $28   ; 
- D 1 - I - 0x00F515 03:B505: C3        .byte $C3   ; 
- D 1 - I - 0x00F516 03:B506: 29        .byte $29   ; 
- D 1 - I - 0x00F517 03:B507: C4        .byte $C4   ; 
- D 1 - I - 0x00F518 03:B508: C5        .byte $C5   ; 
- D 1 - I - 0x00F519 03:B509: C6        .byte $C6   ; 
- D 1 - I - 0x00F51A 03:B50A: C7        .byte $C7   ; 
- D 1 - I - 0x00F51B 03:B50B: C8        .byte $C8   ; 
- D 1 - I - 0x00F51C 03:B50C: 2E        .byte $2E   ; 
- D 1 - I - 0x00F51D 03:B50D: C9        .byte $C9   ; 
- D 1 - I - 0x00F51E 03:B50E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F51F 03:B50F: CA        .byte $CA   ; 
- D 1 - I - 0x00F520 03:B510: CB        .byte $CB   ; 
- D 1 - I - 0x00F521 03:B511: CC        .byte $CC   ; 
- D 1 - I - 0x00F522 03:B512: CD        .byte $CD   ; 
- D 1 - I - 0x00F523 03:B513: CE        .byte $CE   ; 
- D 1 - I - 0x00F524 03:B514: 2A        .byte $2A   ; 
- D 1 - I - 0x00F525 03:B515: 2A        .byte $2A   ; 
- D 1 - I - 0x00F526 03:B516: 2B        .byte $2B   ; 
- D 1 - I - 0x00F527 03:B517: 2B        .byte $2B   ; 
- D 1 - I - 0x00F528 03:B518: C5        .byte $C5   ; 
- D 1 - I - 0x00F529 03:B519: C6        .byte $C6   ; 
- D 1 - I - 0x00F52A 03:B51A: C5        .byte $C5   ; 
- D 1 - I - 0x00F52B 03:B51B: C6        .byte $C6   ; 
- D 1 - I - 0x00F52C 03:B51C: 2E        .byte $2E   ; 
- D 1 - I - 0x00F52D 03:B51D: C9        .byte $C9   ; 
- D 1 - I - 0x00F52E 03:B51E: 30        .byte $30   ; 
- D 1 - I - 0x00F52F 03:B51F: CF        .byte $CF   ; 
- D 1 - I - 0x00F530 03:B520: CB        .byte $CB   ; 
- D 1 - I - 0x00F531 03:B521: CC        .byte $CC   ; 
- D 1 - I - 0x00F532 03:B522: D1        .byte $D1   ; 
- D 1 - I - 0x00F533 03:B523: D2        .byte $D2   ; 
- D 1 - I - 0x00F534 03:B524: 2C        .byte $2C   ; 
- D 1 - I - 0x00F535 03:B525: 2B        .byte $2B   ; 
- D 1 - I - 0x00F536 03:B526: 2B        .byte $2B   ; 
- D 1 - I - 0x00F537 03:B527: 2C        .byte $2C   ; 
- D 1 - I - 0x00F538 03:B528: C5        .byte $C5   ; 
- D 1 - I - 0x00F539 03:B529: C6        .byte $C6   ; 
- D 1 - I - 0x00F53A 03:B52A: C7        .byte $C7   ; 
- D 1 - I - 0x00F53B 03:B52B: C8        .byte $C8   ; 
- D 1 - I - 0x00F53C 03:B52C: 2E        .byte $2E   ; 
- D 1 - I - 0x00F53D 03:B52D: C9        .byte $C9   ; 
- D 1 - I - 0x00F53E 03:B52E: 2F        .byte $2F   ; 
- D 1 - I - 0x00F53F 03:B52F: CA        .byte $CA   ; 
- D 1 - I - 0x00F540 03:B530: CB        .byte $CB   ; 
- D 1 - I - 0x00F541 03:B531: CC        .byte $CC   ; 
- D 1 - I - 0x00F542 03:B532: CD        .byte $CD   ; 
- D 1 - I - 0x00F543 03:B533: CE        .byte $CE   ; 
- D 1 - I - 0x00F544 03:B534: 30        .byte $30   ; 
- D 1 - I - 0x00F545 03:B535: CF        .byte $CF   ; 
- D 1 - I - 0x00F546 03:B536: 31        .byte $31   ; 
- D 1 - I - 0x00F547 03:B537: D0        .byte $D0   ; 
- D 1 - I - 0x00F548 03:B538: D1        .byte $D1   ; 
- D 1 - I - 0x00F549 03:B539: D2        .byte $D2   ; 
- D 1 - I - 0x00F54A 03:B53A: D3        .byte $D3   ; 
- D 1 - I - 0x00F54B 03:B53B: D4        .byte $D4   ; 
- D 1 - I - 0x00F54C 03:B53C: 2F        .byte $2F   ; 
- D 1 - I - 0x00F54D 03:B53D: CA        .byte $CA   ; 
- D 1 - I - 0x00F54E 03:B53E: 2E        .byte $2E   ; 
- D 1 - I - 0x00F54F 03:B53F: C9        .byte $C9   ; 
- D 1 - I - 0x00F550 03:B540: CD        .byte $CD   ; 
- D 1 - I - 0x00F551 03:B541: CE        .byte $CE   ; 
- D 1 - I - 0x00F552 03:B542: CB        .byte $CB   ; 
- D 1 - I - 0x00F553 03:B543: CC        .byte $CC   ; 
- D 1 - I - 0x00F554 03:B544: 30        .byte $30   ; 
- D 1 - I - 0x00F555 03:B545: D0        .byte $D0   ; 
- D 1 - I - 0x00F556 03:B546: 2F        .byte $2F   ; 
- D 1 - I - 0x00F557 03:B547: CA        .byte $CA   ; 
- D 1 - I - 0x00F558 03:B548: CB        .byte $CB   ; 
- D 1 - I - 0x00F559 03:B549: CC        .byte $CC   ; 
- D 1 - I - 0x00F55A 03:B54A: CD        .byte $CD   ; 
- D 1 - I - 0x00F55B 03:B54B: CE        .byte $CE   ; 
- D 1 - I - 0x00F55C 03:B54C: 30        .byte $30   ; 
- D 1 - I - 0x00F55D 03:B54D: CF        .byte $CF   ; 
- D 1 - I - 0x00F55E 03:B54E: 31        .byte $31   ; 
- D 1 - I - 0x00F55F 03:B54F: D0        .byte $D0   ; 
- D 1 - I - 0x00F560 03:B550: D1        .byte $D1   ; 
- D 1 - I - 0x00F561 03:B551: D2        .byte $D2   ; 
- D 1 - I - 0x00F562 03:B552: D3        .byte $D3   ; 
- D 1 - I - 0x00F563 03:B553: D4        .byte $D4   ; 
- D 1 - I - 0x00F564 03:B554: 34        .byte $34   ; 
- D 1 - I - 0x00F565 03:B555: 34        .byte $34   ; 
- D 1 - I - 0x00F566 03:B556: 34        .byte $34   ; 
- D 1 - I - 0x00F567 03:B557: C0        .byte $C0   ; 
- D 1 - I - 0x00F568 03:B558: B2        .byte $B2   ; 
- D 1 - I - 0x00F569 03:B559: B2        .byte $B2   ; 
- D 1 - I - 0x00F56A 03:B55A: B2        .byte $B2   ; 
- D 1 - I - 0x00F56B 03:B55B: C1        .byte $C1   ; 
- D 1 - I - 0x00F56C 03:B55C: 34        .byte $34   ; 
- D 1 - I - 0x00F56D 03:B55D: 34        .byte $34   ; 
- D 1 - I - 0x00F56E 03:B55E: 34        .byte $34   ; 
- D 1 - I - 0x00F56F 03:B55F: C2        .byte $C2   ; 
- D 1 - I - 0x00F570 03:B560: 34        .byte $34   ; 
- D 1 - I - 0x00F571 03:B561: 34        .byte $34   ; 
- D 1 - I - 0x00F572 03:B562: 34        .byte $34   ; 
- D 1 - I - 0x00F573 03:B563: C2        .byte $C2   ; 
- D 1 - I - 0x00F574 03:B564: 34        .byte $34   ; 
- D 1 - I - 0x00F575 03:B565: 34        .byte $34   ; 
- D 1 - I - 0x00F576 03:B566: 34        .byte $34   ; 
- D 1 - I - 0x00F577 03:B567: C2        .byte $C2   ; 
- D 1 - I - 0x00F578 03:B568: 34        .byte $34   ; 
- D 1 - I - 0x00F579 03:B569: 34        .byte $34   ; 
- D 1 - I - 0x00F57A 03:B56A: 34        .byte $34   ; 
- D 1 - I - 0x00F57B 03:B56B: C2        .byte $C2   ; 
- - - - - - 0x00F57C 03:B56C: 34        .byte $34   ; 
- - - - - - 0x00F57D 03:B56D: 34        .byte $34   ; 
- - - - - - 0x00F57E 03:B56E: 34        .byte $34   ; 
- - - - - - 0x00F57F 03:B56F: C2        .byte $C2   ; 
- - - - - - 0x00F580 03:B570: 34        .byte $34   ; 
- - - - - - 0x00F581 03:B571: 34        .byte $34   ; 
- - - - - - 0x00F582 03:B572: 34        .byte $34   ; 
- - - - - - 0x00F583 03:B573: C2        .byte $C2   ; 
- D 1 - I - 0x00F584 03:B574: 31        .byte $31   ; 
- D 1 - I - 0x00F585 03:B575: D0        .byte $D0   ; 
- D 1 - I - 0x00F586 03:B576: 30        .byte $30   ; 
- D 1 - I - 0x00F587 03:B577: D0        .byte $D0   ; 
- D 1 - I - 0x00F588 03:B578: D3        .byte $D3   ; 
- D 1 - I - 0x00F589 03:B579: D4        .byte $D4   ; 
- D 1 - I - 0x00F58A 03:B57A: CB        .byte $CB   ; 
- D 1 - I - 0x00F58B 03:B57B: CC        .byte $CC   ; 
- - - - - - 0x00F58C 03:B57C: 2E        .byte $2E   ; 
- - - - - - 0x00F58D 03:B57D: C9        .byte $C9   ; 
- - - - - - 0x00F58E 03:B57E: 30        .byte $30   ; 
- - - - - - 0x00F58F 03:B57F: CF        .byte $CF   ; 
- - - - - - 0x00F590 03:B580: CB        .byte $CB   ; 
- - - - - - 0x00F591 03:B581: CC        .byte $CC   ; 
- - - - - - 0x00F592 03:B582: D1        .byte $D1   ; 
- - - - - - 0x00F593 03:B583: D2        .byte $D2   ; 
- D 1 - I - 0x00F594 03:B584: 2F        .byte $2F   ; 
- D 1 - I - 0x00F595 03:B585: CA        .byte $CA   ; 
- D 1 - I - 0x00F596 03:B586: 2E        .byte $2E   ; 
- D 1 - I - 0x00F597 03:B587: C9        .byte $C9   ; 
- D 1 - I - 0x00F598 03:B588: CD        .byte $CD   ; 
- D 1 - I - 0x00F599 03:B589: CE        .byte $CE   ; 
- D 1 - I - 0x00F59A 03:B58A: CB        .byte $CB   ; 
- D 1 - I - 0x00F59B 03:B58B: CC        .byte $CC   ; 
- - - - - - 0x00F59C 03:B58C: 31        .byte $31   ; 
- - - - - - 0x00F59D 03:B58D: D0        .byte $D0   ; 
- - - - - - 0x00F59E 03:B58E: 30        .byte $30   ; 
- - - - - - 0x00F59F 03:B58F: D0        .byte $D0   ; 
- - - - - - 0x00F5A0 03:B590: D3        .byte $D3   ; 
- - - - - - 0x00F5A1 03:B591: D4        .byte $D4   ; 
- - - - - - 0x00F5A2 03:B592: CB        .byte $CB   ; 
- - - - - - 0x00F5A3 03:B593: CC        .byte $CC   ; 
- D 1 - I - 0x00F5A4 03:B594: 00        .byte $00   ; 
- D 1 - I - 0x00F5A5 03:B595: 00        .byte $00   ; 
- D 1 - I - 0x00F5A6 03:B596: 00        .byte $00   ; 
- D 1 - I - 0x00F5A7 03:B597: 00        .byte $00   ; 
- D 1 - I - 0x00F5A8 03:B598: 00        .byte $00   ; 
- D 1 - I - 0x00F5A9 03:B599: 00        .byte $00   ; 
- D 1 - I - 0x00F5AA 03:B59A: 00        .byte $00   ; 
- D 1 - I - 0x00F5AB 03:B59B: 00        .byte $00   ; 
- D 1 - I - 0x00F5AC 03:B59C: 00        .byte $00   ; 
- D 1 - I - 0x00F5AD 03:B59D: 00        .byte $00   ; 
- D 1 - I - 0x00F5AE 03:B59E: 01        .byte $01   ; 
- D 1 - I - 0x00F5AF 03:B59F: 02        .byte $02   ; 
- D 1 - I - 0x00F5B0 03:B5A0: 00        .byte $00   ; 
- D 1 - I - 0x00F5B1 03:B5A1: 00        .byte $00   ; 
- D 1 - I - 0x00F5B2 03:B5A2: 11        .byte $11   ; 
- D 1 - I - 0x00F5B3 03:B5A3: 12        .byte $12   ; 
- D 1 - I - 0x00F5B4 03:B5A4: 00        .byte $00   ; 
- D 1 - I - 0x00F5B5 03:B5A5: 00        .byte $00   ; 
- D 1 - I - 0x00F5B6 03:B5A6: 00        .byte $00   ; 
- D 1 - I - 0x00F5B7 03:B5A7: 00        .byte $00   ; 
- D 1 - I - 0x00F5B8 03:B5A8: 00        .byte $00   ; 
- D 1 - I - 0x00F5B9 03:B5A9: 00        .byte $00   ; 
- D 1 - I - 0x00F5BA 03:B5AA: 00        .byte $00   ; 
- D 1 - I - 0x00F5BB 03:B5AB: 00        .byte $00   ; 
- D 1 - I - 0x00F5BC 03:B5AC: 20        .byte $20   ; 
- D 1 - I - 0x00F5BD 03:B5AD: 20        .byte $20   ; 
- D 1 - I - 0x00F5BE 03:B5AE: 20        .byte $20   ; 
- D 1 - I - 0x00F5BF 03:B5AF: 20        .byte $20   ; 
- D 1 - I - 0x00F5C0 03:B5B0: 26        .byte $26   ; 
- D 1 - I - 0x00F5C1 03:B5B1: 26        .byte $26   ; 
- D 1 - I - 0x00F5C2 03:B5B2: 26        .byte $26   ; 
- D 1 - I - 0x00F5C3 03:B5B3: 26        .byte $26   ; 
- D 1 - I - 0x00F5C4 03:B5B4: 00        .byte $00   ; 
- D 1 - I - 0x00F5C5 03:B5B5: 00        .byte $00   ; 
- D 1 - I - 0x00F5C6 03:B5B6: 00        .byte $00   ; 
- D 1 - I - 0x00F5C7 03:B5B7: 00        .byte $00   ; 
- D 1 - I - 0x00F5C8 03:B5B8: 00        .byte $00   ; 
- D 1 - I - 0x00F5C9 03:B5B9: 00        .byte $00   ; 
- D 1 - I - 0x00F5CA 03:B5BA: 00        .byte $00   ; 
- D 1 - I - 0x00F5CB 03:B5BB: 00        .byte $00   ; 
- D 1 - I - 0x00F5CC 03:B5BC: 21        .byte $21   ; 
- D 1 - I - 0x00F5CD 03:B5BD: 22        .byte $22   ; 
- D 1 - I - 0x00F5CE 03:B5BE: 23        .byte $23   ; 
- D 1 - I - 0x00F5CF 03:B5BF: 23        .byte $23   ; 
- D 1 - I - 0x00F5D0 03:B5C0: 27        .byte $27   ; 
- D 1 - I - 0x00F5D1 03:B5C1: 28        .byte $28   ; 
- D 1 - I - 0x00F5D2 03:B5C2: 07        .byte $07   ; 
- D 1 - I - 0x00F5D3 03:B5C3: 17        .byte $17   ; 
- D 1 - I - 0x00F5D4 03:B5C4: 00        .byte $00   ; 
- D 1 - I - 0x00F5D5 03:B5C5: 00        .byte $00   ; 
- D 1 - I - 0x00F5D6 03:B5C6: 00        .byte $00   ; 
- D 1 - I - 0x00F5D7 03:B5C7: 00        .byte $00   ; 
- D 1 - I - 0x00F5D8 03:B5C8: 00        .byte $00   ; 
- D 1 - I - 0x00F5D9 03:B5C9: 00        .byte $00   ; 
- D 1 - I - 0x00F5DA 03:B5CA: 00        .byte $00   ; 
- D 1 - I - 0x00F5DB 03:B5CB: 00        .byte $00   ; 
- D 1 - I - 0x00F5DC 03:B5CC: 23        .byte $23   ; 
- D 1 - I - 0x00F5DD 03:B5CD: 23        .byte $23   ; 
- D 1 - I - 0x00F5DE 03:B5CE: 24        .byte $24   ; 
- D 1 - I - 0x00F5DF 03:B5CF: 25        .byte $25   ; 
- D 1 - I - 0x00F5E0 03:B5D0: 18        .byte $18   ; 
- D 1 - I - 0x00F5E1 03:B5D1: 09        .byte $09   ; 
- D 1 - I - 0x00F5E2 03:B5D2: 29        .byte $29   ; 
- D 1 - I - 0x00F5E3 03:B5D3: 2A        .byte $2A   ; 
- D 1 - I - 0x00F5E4 03:B5D4: 00        .byte $00   ; 
- D 1 - I - 0x00F5E5 03:B5D5: 00        .byte $00   ; 
- D 1 - I - 0x00F5E6 03:B5D6: 00        .byte $00   ; 
- D 1 - I - 0x00F5E7 03:B5D7: 00        .byte $00   ; 
- D 1 - I - 0x00F5E8 03:B5D8: 00        .byte $00   ; 
- D 1 - I - 0x00F5E9 03:B5D9: 00        .byte $00   ; 
- D 1 - I - 0x00F5EA 03:B5DA: 00        .byte $00   ; 
- D 1 - I - 0x00F5EB 03:B5DB: 00        .byte $00   ; 
- D 1 - I - 0x00F5EC 03:B5DC: 03        .byte $03   ; 
- D 1 - I - 0x00F5ED 03:B5DD: 04        .byte $04   ; 
- D 1 - I - 0x00F5EE 03:B5DE: 00        .byte $00   ; 
- D 1 - I - 0x00F5EF 03:B5DF: 00        .byte $00   ; 
- D 1 - I - 0x00F5F0 03:B5E0: 13        .byte $13   ; 
- D 1 - I - 0x00F5F1 03:B5E1: 14        .byte $14   ; 
- D 1 - I - 0x00F5F2 03:B5E2: 00        .byte $00   ; 
- D 1 - I - 0x00F5F3 03:B5E3: 00        .byte $00   ; 
- D 1 - I - 0x00F5F4 03:B5E4: 00        .byte $00   ; 
- D 1 - I - 0x00F5F5 03:B5E5: 00        .byte $00   ; 
- D 1 - I - 0x00F5F6 03:B5E6: 11        .byte $11   ; 
- D 1 - I - 0x00F5F7 03:B5E7: 12        .byte $12   ; 
- D 1 - I - 0x00F5F8 03:B5E8: 00        .byte $00   ; 
- D 1 - I - 0x00F5F9 03:B5E9: 00        .byte $00   ; 
- D 1 - I - 0x00F5FA 03:B5EA: 11        .byte $11   ; 
- D 1 - I - 0x00F5FB 03:B5EB: 12        .byte $12   ; 
- D 1 - I - 0x00F5FC 03:B5EC: 00        .byte $00   ; 
- D 1 - I - 0x00F5FD 03:B5ED: 00        .byte $00   ; 
- D 1 - I - 0x00F5FE 03:B5EE: 11        .byte $11   ; 
- D 1 - I - 0x00F5FF 03:B5EF: 12        .byte $12   ; 
- D 1 - I - 0x00F600 03:B5F0: 00        .byte $00   ; 
- D 1 - I - 0x00F601 03:B5F1: 00        .byte $00   ; 
- D 1 - I - 0x00F602 03:B5F2: 11        .byte $11   ; 
- D 1 - I - 0x00F603 03:B5F3: 12        .byte $12   ; 
- D 1 - I - 0x00F604 03:B5F4: 26        .byte $26   ; 
- D 1 - I - 0x00F605 03:B5F5: 0C        .byte $0C   ; 
- D 1 - I - 0x00F606 03:B5F6: 0D        .byte $0D   ; 
- D 1 - I - 0x00F607 03:B5F7: 26        .byte $26   ; 
- D 1 - I - 0x00F608 03:B5F8: 26        .byte $26   ; 
- D 1 - I - 0x00F609 03:B5F9: 1C        .byte $1C   ; 
- D 1 - I - 0x00F60A 03:B5FA: 1D        .byte $1D   ; 
- D 1 - I - 0x00F60B 03:B5FB: 26        .byte $26   ; 
- - - - - - 0x00F60C 03:B5FC: 00        .byte $00   ; 
- - - - - - 0x00F60D 03:B5FD: 00        .byte $00   ; 
- - - - - - 0x00F60E 03:B5FE: 00        .byte $00   ; 
- - - - - - 0x00F60F 03:B5FF: 00        .byte $00   ; 
- - - - - - 0x00F610 03:B600: 00        .byte $00   ; 
- - - - - - 0x00F611 03:B601: 00        .byte $00   ; 
- - - - - - 0x00F612 03:B602: 00        .byte $00   ; 
- - - - - - 0x00F613 03:B603: 00        .byte $00   ; 
- D 1 - I - 0x00F614 03:B604: 26        .byte $26   ; 
- D 1 - I - 0x00F615 03:B605: 0C        .byte $0C   ; 
- D 1 - I - 0x00F616 03:B606: 0D        .byte $0D   ; 
- D 1 - I - 0x00F617 03:B607: 26        .byte $26   ; 
- D 1 - I - 0x00F618 03:B608: 26        .byte $26   ; 
- D 1 - I - 0x00F619 03:B609: 1C        .byte $1C   ; 
- D 1 - I - 0x00F61A 03:B60A: 1D        .byte $1D   ; 
- D 1 - I - 0x00F61B 03:B60B: 2F        .byte $2F   ; 
- - - - - - 0x00F61C 03:B60C: 00        .byte $00   ; 
- - - - - - 0x00F61D 03:B60D: 00        .byte $00   ; 
- - - - - - 0x00F61E 03:B60E: 00        .byte $00   ; 
- - - - - - 0x00F61F 03:B60F: 00        .byte $00   ; 
- - - - - - 0x00F620 03:B610: 00        .byte $00   ; 
- - - - - - 0x00F621 03:B611: 00        .byte $00   ; 
- - - - - - 0x00F622 03:B612: 00        .byte $00   ; 
- - - - - - 0x00F623 03:B613: 00        .byte $00   ; 
- D 1 - I - 0x00F624 03:B614: 2B        .byte $2B   ; 
- D 1 - I - 0x00F625 03:B615: 2C        .byte $2C   ; 
- D 1 - I - 0x00F626 03:B616: 08        .byte $08   ; 
- D 1 - I - 0x00F627 03:B617: 18        .byte $18   ; 
- D 1 - I - 0x00F628 03:B618: 30        .byte $30   ; 
- D 1 - I - 0x00F629 03:B619: 31        .byte $31   ; 
- D 1 - I - 0x00F62A 03:B61A: 00        .byte $00   ; 
- D 1 - I - 0x00F62B 03:B61B: 19        .byte $19   ; 
- - - - - - 0x00F62C 03:B61C: 00        .byte $00   ; 
- - - - - - 0x00F62D 03:B61D: 00        .byte $00   ; 
- - - - - - 0x00F62E 03:B61E: 00        .byte $00   ; 
- - - - - - 0x00F62F 03:B61F: 00        .byte $00   ; 
- - - - - - 0x00F630 03:B620: 00        .byte $00   ; 
- - - - - - 0x00F631 03:B621: 00        .byte $00   ; 
- - - - - - 0x00F632 03:B622: 00        .byte $00   ; 
- - - - - - 0x00F633 03:B623: 00        .byte $00   ; 
- D 1 - I - 0x00F634 03:B624: 0B        .byte $0B   ; 
- D 1 - I - 0x00F635 03:B625: 00        .byte $00   ; 
- D 1 - I - 0x00F636 03:B626: 2D        .byte $2D   ; 
- D 1 - I - 0x00F637 03:B627: 2E        .byte $2E   ; 
- D 1 - I - 0x00F638 03:B628: 00        .byte $00   ; 
- D 1 - I - 0x00F639 03:B629: 10        .byte $10   ; 
- D 1 - I - 0x00F63A 03:B62A: 32        .byte $32   ; 
- D 1 - I - 0x00F63B 03:B62B: 33        .byte $33   ; 
- - - - - - 0x00F63C 03:B62C: 00        .byte $00   ; 
- - - - - - 0x00F63D 03:B62D: 00        .byte $00   ; 
- - - - - - 0x00F63E 03:B62E: 00        .byte $00   ; 
- - - - - - 0x00F63F 03:B62F: 00        .byte $00   ; 
- - - - - - 0x00F640 03:B630: 00        .byte $00   ; 
- - - - - - 0x00F641 03:B631: 00        .byte $00   ; 
- - - - - - 0x00F642 03:B632: 00        .byte $00   ; 
- - - - - - 0x00F643 03:B633: 00        .byte $00   ; 
- D 1 - I - 0x00F644 03:B634: 26        .byte $26   ; 
- D 1 - I - 0x00F645 03:B635: 0C        .byte $0C   ; 
- D 1 - I - 0x00F646 03:B636: 0D        .byte $0D   ; 
- D 1 - I - 0x00F647 03:B637: 26        .byte $26   ; 
- D 1 - I - 0x00F648 03:B638: 34        .byte $34   ; 
- D 1 - I - 0x00F649 03:B639: 1C        .byte $1C   ; 
- D 1 - I - 0x00F64A 03:B63A: 1D        .byte $1D   ; 
- D 1 - I - 0x00F64B 03:B63B: 26        .byte $26   ; 
- - - - - - 0x00F64C 03:B63C: 00        .byte $00   ; 
- - - - - - 0x00F64D 03:B63D: 00        .byte $00   ; 
- - - - - - 0x00F64E 03:B63E: 00        .byte $00   ; 
- - - - - - 0x00F64F 03:B63F: 00        .byte $00   ; 
- - - - - - 0x00F650 03:B640: 00        .byte $00   ; 
- - - - - - 0x00F651 03:B641: 00        .byte $00   ; 
- - - - - - 0x00F652 03:B642: 00        .byte $00   ; 
- - - - - - 0x00F653 03:B643: 00        .byte $00   ; 
- D 1 - I - 0x00F654 03:B644: 13        .byte $13   ; 
- D 1 - I - 0x00F655 03:B645: 14        .byte $14   ; 
- D 1 - I - 0x00F656 03:B646: 00        .byte $00   ; 
- D 1 - I - 0x00F657 03:B647: 00        .byte $00   ; 
- D 1 - I - 0x00F658 03:B648: 13        .byte $13   ; 
- D 1 - I - 0x00F659 03:B649: 14        .byte $14   ; 
- D 1 - I - 0x00F65A 03:B64A: 00        .byte $00   ; 
- D 1 - I - 0x00F65B 03:B64B: 00        .byte $00   ; 
- D 1 - I - 0x00F65C 03:B64C: 13        .byte $13   ; 
- D 1 - I - 0x00F65D 03:B64D: 14        .byte $14   ; 
- D 1 - I - 0x00F65E 03:B64E: 00        .byte $00   ; 
- D 1 - I - 0x00F65F 03:B64F: 00        .byte $00   ; 
- D 1 - I - 0x00F660 03:B650: 13        .byte $13   ; 
- D 1 - I - 0x00F661 03:B651: 14        .byte $14   ; 
- D 1 - I - 0x00F662 03:B652: 00        .byte $00   ; 
- D 1 - I - 0x00F663 03:B653: 00        .byte $00   ; 
- D 1 - I - 0x00F664 03:B654: 35        .byte $35   ; 
- D 1 - I - 0x00F665 03:B655: 35        .byte $35   ; 
- D 1 - I - 0x00F666 03:B656: 35        .byte $35   ; 
- D 1 - I - 0x00F667 03:B657: 35        .byte $35   ; 
- D 1 - I - 0x00F668 03:B658: 3C        .byte $3C   ; 
- D 1 - I - 0x00F669 03:B659: 3C        .byte $3C   ; 
- D 1 - I - 0x00F66A 03:B65A: 3C        .byte $3C   ; 
- D 1 - I - 0x00F66B 03:B65B: 3C        .byte $3C   ; 
- D 1 - I - 0x00F66C 03:B65C: 0E        .byte $0E   ; 
- D 1 - I - 0x00F66D 03:B65D: 00        .byte $00   ; 
- D 1 - I - 0x00F66E 03:B65E: 10        .byte $10   ; 
- D 1 - I - 0x00F66F 03:B65F: 1A        .byte $1A   ; 
- D 1 - I - 0x00F670 03:B660: 0E        .byte $0E   ; 
- D 1 - I - 0x00F671 03:B661: 1A        .byte $1A   ; 
- D 1 - I - 0x00F672 03:B662: 08        .byte $08   ; 
- D 1 - I - 0x00F673 03:B663: 19        .byte $19   ; 
- D 1 - I - 0x00F674 03:B664: 35        .byte $35   ; 
- D 1 - I - 0x00F675 03:B665: 35        .byte $35   ; 
- D 1 - I - 0x00F676 03:B666: 36        .byte $36   ; 
- D 1 - I - 0x00F677 03:B667: 37        .byte $37   ; 
- D 1 - I - 0x00F678 03:B668: 3C        .byte $3C   ; 
- D 1 - I - 0x00F679 03:B669: 3C        .byte $3C   ; 
- D 1 - I - 0x00F67A 03:B66A: 3D        .byte $3D   ; 
- D 1 - I - 0x00F67B 03:B66B: 31        .byte $31   ; 
- D 1 - I - 0x00F67C 03:B66C: 08        .byte $08   ; 
- D 1 - I - 0x00F67D 03:B66D: 08        .byte $08   ; 
- D 1 - I - 0x00F67E 03:B66E: 08        .byte $08   ; 
- D 1 - I - 0x00F67F 03:B66F: 0B        .byte $0B   ; 
- D 1 - I - 0x00F680 03:B670: 08        .byte $08   ; 
- D 1 - I - 0x00F681 03:B671: 08        .byte $08   ; 
- D 1 - I - 0x00F682 03:B672: 0B        .byte $0B   ; 
- D 1 - I - 0x00F683 03:B673: 00        .byte $00   ; 
- D 1 - I - 0x00F684 03:B674: 38        .byte $38   ; 
- D 1 - I - 0x00F685 03:B675: 80        .byte $80   ; 
- D 1 - I - 0x00F686 03:B676: 00        .byte $00   ; 
- D 1 - I - 0x00F687 03:B677: 68        .byte $68   ; 
- D 1 - I - 0x00F688 03:B678: 80        .byte $80   ; 
- D 1 - I - 0x00F689 03:B679: 00        .byte $00   ; 
- D 1 - I - 0x00F68A 03:B67A: 6A        .byte $6A   ; 
- D 1 - I - 0x00F68B 03:B67B: 6B        .byte $6B   ; 
- D 1 - I - 0x00F68C 03:B67C: 00        .byte $00   ; 
- D 1 - I - 0x00F68D 03:B67D: 6E        .byte $6E   ; 
- D 1 - I - 0x00F68E 03:B67E: 6F        .byte $6F   ; 
- D 1 - I - 0x00F68F 03:B67F: 70        .byte $70   ; 
- D 1 - I - 0x00F690 03:B680: 00        .byte $00   ; 
- D 1 - I - 0x00F691 03:B681: 74        .byte $74   ; 
- D 1 - I - 0x00F692 03:B682: 75        .byte $75   ; 
- D 1 - I - 0x00F693 03:B683: 76        .byte $76   ; 
- D 1 - I - 0x00F694 03:B684: 69        .byte $69   ; 
- D 1 - I - 0x00F695 03:B685: 00        .byte $00   ; 
- D 1 - I - 0x00F696 03:B686: 81        .byte $81   ; 
- D 1 - I - 0x00F697 03:B687: 39        .byte $39   ; 
- D 1 - I - 0x00F698 03:B688: 6C        .byte $6C   ; 
- D 1 - I - 0x00F699 03:B689: 6D        .byte $6D   ; 
- D 1 - I - 0x00F69A 03:B68A: 00        .byte $00   ; 
- D 1 - I - 0x00F69B 03:B68B: 81        .byte $81   ; 
- D 1 - I - 0x00F69C 03:B68C: 71        .byte $71   ; 
- D 1 - I - 0x00F69D 03:B68D: 72        .byte $72   ; 
- D 1 - I - 0x00F69E 03:B68E: 73        .byte $73   ; 
- D 1 - I - 0x00F69F 03:B68F: 00        .byte $00   ; 
- D 1 - I - 0x00F6A0 03:B690: 77        .byte $77   ; 
- D 1 - I - 0x00F6A1 03:B691: 78        .byte $78   ; 
- D 1 - I - 0x00F6A2 03:B692: 79        .byte $79   ; 
- D 1 - I - 0x00F6A3 03:B693: 00        .byte $00   ; 
- D 1 - I - 0x00F6A4 03:B694: 3A        .byte $3A   ; 
- D 1 - I - 0x00F6A5 03:B695: 3B        .byte $3B   ; 
- D 1 - I - 0x00F6A6 03:B696: 35        .byte $35   ; 
- D 1 - I - 0x00F6A7 03:B697: 35        .byte $35   ; 
- D 1 - I - 0x00F6A8 03:B698: 32        .byte $32   ; 
- D 1 - I - 0x00F6A9 03:B699: 3E        .byte $3E   ; 
- D 1 - I - 0x00F6AA 03:B69A: 3C        .byte $3C   ; 
- D 1 - I - 0x00F6AB 03:B69B: 3C        .byte $3C   ; 
- D 1 - I - 0x00F6AC 03:B69C: 00        .byte $00   ; 
- D 1 - I - 0x00F6AD 03:B69D: 10        .byte $10   ; 
- D 1 - I - 0x00F6AE 03:B69E: 1A        .byte $1A   ; 
- D 1 - I - 0x00F6AF 03:B69F: 08        .byte $08   ; 
- D 1 - I - 0x00F6B0 03:B6A0: 1A        .byte $1A   ; 
- D 1 - I - 0x00F6B1 03:B6A1: 08        .byte $08   ; 
- D 1 - I - 0x00F6B2 03:B6A2: 19        .byte $19   ; 
- D 1 - I - 0x00F6B3 03:B6A3: 08        .byte $08   ; 
- D 1 - I - 0x00F6B4 03:B6A4: 35        .byte $35   ; 
- D 1 - I - 0x00F6B5 03:B6A5: 35        .byte $35   ; 
- D 1 - I - 0x00F6B6 03:B6A6: 35        .byte $35   ; 
- D 1 - I - 0x00F6B7 03:B6A7: 35        .byte $35   ; 
- D 1 - I - 0x00F6B8 03:B6A8: 3C        .byte $3C   ; 
- D 1 - I - 0x00F6B9 03:B6A9: 3C        .byte $3C   ; 
- D 1 - I - 0x00F6BA 03:B6AA: 3C        .byte $3C   ; 
- D 1 - I - 0x00F6BB 03:B6AB: 3C        .byte $3C   ; 
- D 1 - I - 0x00F6BC 03:B6AC: 18        .byte $18   ; 
- D 1 - I - 0x00F6BD 03:B6AD: 08        .byte $08   ; 
- D 1 - I - 0x00F6BE 03:B6AE: 0B        .byte $0B   ; 
- D 1 - I - 0x00F6BF 03:B6AF: 0F        .byte $0F   ; 
- D 1 - I - 0x00F6C0 03:B6B0: 0B        .byte $0B   ; 
- D 1 - I - 0x00F6C1 03:B6B1: 10        .byte $10   ; 
- D 1 - I - 0x00F6C2 03:B6B2: 00        .byte $00   ; 
- D 1 - I - 0x00F6C3 03:B6B3: 0F        .byte $0F   ; 
- D 1 - I - 0x00F6C4 03:B6B4: 00        .byte $00   ; 
- D 1 - I - 0x00F6C5 03:B6B5: 00        .byte $00   ; 
- D 1 - I - 0x00F6C6 03:B6B6: 05        .byte $05   ; 
- D 1 - I - 0x00F6C7 03:B6B7: 06        .byte $06   ; 
- D 1 - I - 0x00F6C8 03:B6B8: 00        .byte $00   ; 
- D 1 - I - 0x00F6C9 03:B6B9: 00        .byte $00   ; 
- D 1 - I - 0x00F6CA 03:B6BA: 11        .byte $11   ; 
- D 1 - I - 0x00F6CB 03:B6BB: 12        .byte $12   ; 
- D 1 - I - 0x00F6CC 03:B6BC: 00        .byte $00   ; 
- D 1 - I - 0x00F6CD 03:B6BD: 00        .byte $00   ; 
- D 1 - I - 0x00F6CE 03:B6BE: 11        .byte $11   ; 
- D 1 - I - 0x00F6CF 03:B6BF: 12        .byte $12   ; 
- D 1 - I - 0x00F6D0 03:B6C0: 00        .byte $00   ; 
- D 1 - I - 0x00F6D1 03:B6C1: 00        .byte $00   ; 
- D 1 - I - 0x00F6D2 03:B6C2: 05        .byte $05   ; 
- D 1 - I - 0x00F6D3 03:B6C3: 06        .byte $06   ; 
- D 1 - I - 0x00F6D4 03:B6C4: 3F        .byte $3F   ; 
- D 1 - I - 0x00F6D5 03:B6C5: 3F        .byte $3F   ; 
- D 1 - I - 0x00F6D6 03:B6C6: 3F        .byte $3F   ; 
- D 1 - I - 0x00F6D7 03:B6C7: 3F        .byte $3F   ; 
- D 1 - I - 0x00F6D8 03:B6C8: 44        .byte $44   ; 
- D 1 - I - 0x00F6D9 03:B6C9: 44        .byte $44   ; 
- D 1 - I - 0x00F6DA 03:B6CA: 44        .byte $44   ; 
- D 1 - I - 0x00F6DB 03:B6CB: 44        .byte $44   ; 
- D 1 - I - 0x00F6DC 03:B6CC: 26        .byte $26   ; 
- D 1 - I - 0x00F6DD 03:B6CD: 26        .byte $26   ; 
- D 1 - I - 0x00F6DE 03:B6CE: 26        .byte $26   ; 
- D 1 - I - 0x00F6DF 03:B6CF: 26        .byte $26   ; 
- D 1 - I - 0x00F6E0 03:B6D0: 26        .byte $26   ; 
- D 1 - I - 0x00F6E1 03:B6D1: 0C        .byte $0C   ; 
- D 1 - I - 0x00F6E2 03:B6D2: 0D        .byte $0D   ; 
- D 1 - I - 0x00F6E3 03:B6D3: 26        .byte $26   ; 
- D 1 - I - 0x00F6E4 03:B6D4: 3F        .byte $3F   ; 
- D 1 - I - 0x00F6E5 03:B6D5: 3F        .byte $3F   ; 
- D 1 - I - 0x00F6E6 03:B6D6: 40        .byte $40   ; 
- D 1 - I - 0x00F6E7 03:B6D7: 41        .byte $41   ; 
- D 1 - I - 0x00F6E8 03:B6D8: 44        .byte $44   ; 
- D 1 - I - 0x00F6E9 03:B6D9: 44        .byte $44   ; 
- D 1 - I - 0x00F6EA 03:B6DA: 45        .byte $45   ; 
- D 1 - I - 0x00F6EB 03:B6DB: 46        .byte $46   ; 
- D 1 - I - 0x00F6EC 03:B6DC: 26        .byte $26   ; 
- D 1 - I - 0x00F6ED 03:B6DD: 26        .byte $26   ; 
- D 1 - I - 0x00F6EE 03:B6DE: 26        .byte $26   ; 
- D 1 - I - 0x00F6EF 03:B6DF: 4B        .byte $4B   ; 
- D 1 - I - 0x00F6F0 03:B6E0: 26        .byte $26   ; 
- D 1 - I - 0x00F6F1 03:B6E1: 0C        .byte $0C   ; 
- D 1 - I - 0x00F6F2 03:B6E2: 0D        .byte $0D   ; 
- D 1 - I - 0x00F6F3 03:B6E3: 26        .byte $26   ; 
- D 1 - I - 0x00F6F4 03:B6E4: 82        .byte $82   ; 
- D 1 - I - 0x00F6F5 03:B6E5: 00        .byte $00   ; 
- D 1 - I - 0x00F6F6 03:B6E6: 7A        .byte $7A   ; 
- D 1 - I - 0x00F6F7 03:B6E7: 7B        .byte $7B   ; 
- D 1 - I - 0x00F6F8 03:B6E8: 47        .byte $47   ; 
- D 1 - I - 0x00F6F9 03:B6E9: 82        .byte $82   ; 
- D 1 - I - 0x00F6FA 03:B6EA: 00        .byte $00   ; 
- D 1 - I - 0x00F6FB 03:B6EB: 7E        .byte $7E   ; 
- D 1 - I - 0x00F6FC 03:B6EC: 4C        .byte $4C   ; 
- D 1 - I - 0x00F6FD 03:B6ED: 41        .byte $41   ; 
- D 1 - I - 0x00F6FE 03:B6EE: 00        .byte $00   ; 
- D 1 - I - 0x00F6FF 03:B6EF: 17        .byte $17   ; 
- D 1 - I - 0x00F700 03:B6F0: 4F        .byte $4F   ; 
- D 1 - I - 0x00F701 03:B6F1: 50        .byte $50   ; 
- D 1 - I - 0x00F702 03:B6F2: 00        .byte $00   ; 
- D 1 - I - 0x00F703 03:B6F3: 18        .byte $18   ; 
- D 1 - I - 0x00F704 03:B6F4: 7C        .byte $7C   ; 
- D 1 - I - 0x00F705 03:B6F5: 7D        .byte $7D   ; 
- D 1 - I - 0x00F706 03:B6F6: 00        .byte $00   ; 
- D 1 - I - 0x00F707 03:B6F7: 83        .byte $83   ; 
- D 1 - I - 0x00F708 03:B6F8: 7F        .byte $7F   ; 
- D 1 - I - 0x00F709 03:B6F9: 00        .byte $00   ; 
- D 1 - I - 0x00F70A 03:B6FA: 83        .byte $83   ; 
- D 1 - I - 0x00F70B 03:B6FB: 48        .byte $48   ; 
- D 1 - I - 0x00F70C 03:B6FC: 00        .byte $00   ; 
- D 1 - I - 0x00F70D 03:B6FD: 00        .byte $00   ; 
- D 1 - I - 0x00F70E 03:B6FE: 42        .byte $42   ; 
- D 1 - I - 0x00F70F 03:B6FF: 4D        .byte $4D   ; 
- D 1 - I - 0x00F710 03:B700: 1A        .byte $1A   ; 
- D 1 - I - 0x00F711 03:B701: 08        .byte $08   ; 
- D 1 - I - 0x00F712 03:B702: 51        .byte $51   ; 
- D 1 - I - 0x00F713 03:B703: 52        .byte $52   ; 
- D 1 - I - 0x00F714 03:B704: 42        .byte $42   ; 
- D 1 - I - 0x00F715 03:B705: 43        .byte $43   ; 
- D 1 - I - 0x00F716 03:B706: 3F        .byte $3F   ; 
- D 1 - I - 0x00F717 03:B707: 3F        .byte $3F   ; 
- D 1 - I - 0x00F718 03:B708: 49        .byte $49   ; 
- D 1 - I - 0x00F719 03:B709: 4A        .byte $4A   ; 
- D 1 - I - 0x00F71A 03:B70A: 44        .byte $44   ; 
- D 1 - I - 0x00F71B 03:B70B: 44        .byte $44   ; 
- D 1 - I - 0x00F71C 03:B70C: 4E        .byte $4E   ; 
- D 1 - I - 0x00F71D 03:B70D: 26        .byte $26   ; 
- D 1 - I - 0x00F71E 03:B70E: 26        .byte $26   ; 
- D 1 - I - 0x00F71F 03:B70F: 26        .byte $26   ; 
- D 1 - I - 0x00F720 03:B710: 26        .byte $26   ; 
- D 1 - I - 0x00F721 03:B711: 0C        .byte $0C   ; 
- D 1 - I - 0x00F722 03:B712: 0D        .byte $0D   ; 
- D 1 - I - 0x00F723 03:B713: 26        .byte $26   ; 
- D 1 - I - 0x00F724 03:B714: 15        .byte $15   ; 
- D 1 - I - 0x00F725 03:B715: 16        .byte $16   ; 
- D 1 - I - 0x00F726 03:B716: 00        .byte $00   ; 
- D 1 - I - 0x00F727 03:B717: 00        .byte $00   ; 
- D 1 - I - 0x00F728 03:B718: 13        .byte $13   ; 
- D 1 - I - 0x00F729 03:B719: 14        .byte $14   ; 
- D 1 - I - 0x00F72A 03:B71A: 00        .byte $00   ; 
- D 1 - I - 0x00F72B 03:B71B: 00        .byte $00   ; 
- D 1 - I - 0x00F72C 03:B71C: 13        .byte $13   ; 
- D 1 - I - 0x00F72D 03:B71D: 14        .byte $14   ; 
- D 1 - I - 0x00F72E 03:B71E: 00        .byte $00   ; 
- D 1 - I - 0x00F72F 03:B71F: 00        .byte $00   ; 
- D 1 - I - 0x00F730 03:B720: 15        .byte $15   ; 
- D 1 - I - 0x00F731 03:B721: 16        .byte $16   ; 
- D 1 - I - 0x00F732 03:B722: 00        .byte $00   ; 
- D 1 - I - 0x00F733 03:B723: 00        .byte $00   ; 
- D 1 - I - 0x00F734 03:B724: 26        .byte $26   ; 
- D 1 - I - 0x00F735 03:B725: 1C        .byte $1C   ; 
- D 1 - I - 0x00F736 03:B726: 1D        .byte $1D   ; 
- D 1 - I - 0x00F737 03:B727: 26        .byte $26   ; 
- D 1 - I - 0x00F738 03:B728: 26        .byte $26   ; 
- D 1 - I - 0x00F739 03:B729: 26        .byte $26   ; 
- D 1 - I - 0x00F73A 03:B72A: 26        .byte $26   ; 
- D 1 - I - 0x00F73B 03:B72B: 26        .byte $26   ; 
- D 1 - I - 0x00F73C 03:B72C: 57        .byte $57   ; 
- D 1 - I - 0x00F73D 03:B72D: 57        .byte $57   ; 
- D 1 - I - 0x00F73E 03:B72E: 57        .byte $57   ; 
- D 1 - I - 0x00F73F 03:B72F: 57        .byte $57   ; 
- D 1 - I - 0x00F740 03:B730: 57        .byte $57   ; 
- D 1 - I - 0x00F741 03:B731: 57        .byte $57   ; 
- D 1 - I - 0x00F742 03:B732: 57        .byte $57   ; 
- D 1 - I - 0x00F743 03:B733: 57        .byte $57   ; 
- D 1 - I - 0x00F744 03:B734: 53        .byte $53   ; 
- D 1 - I - 0x00F745 03:B735: 54        .byte $54   ; 
- D 1 - I - 0x00F746 03:B736: 08        .byte $08   ; 
- D 1 - I - 0x00F747 03:B737: 08        .byte $08   ; 
- D 1 - I - 0x00F748 03:B738: 53        .byte $53   ; 
- D 1 - I - 0x00F749 03:B739: 54        .byte $54   ; 
- D 1 - I - 0x00F74A 03:B73A: 07        .byte $07   ; 
- D 1 - I - 0x00F74B 03:B73B: 0B        .byte $0B   ; 
- D 1 - I - 0x00F74C 03:B73C: 57        .byte $57   ; 
- D 1 - I - 0x00F74D 03:B73D: 58        .byte $58   ; 
- D 1 - I - 0x00F74E 03:B73E: 59        .byte $59   ; 
- D 1 - I - 0x00F74F 03:B73F: 59        .byte $59   ; 
- D 1 - I - 0x00F750 03:B740: 57        .byte $57   ; 
- D 1 - I - 0x00F751 03:B741: 57        .byte $57   ; 
- D 1 - I - 0x00F752 03:B742: 57        .byte $57   ; 
- D 1 - I - 0x00F753 03:B743: 57        .byte $57   ; 
- D 1 - I - 0x00F754 03:B744: 0B        .byte $0B   ; 
- D 1 - I - 0x00F755 03:B745: 00        .byte $00   ; 
- D 1 - I - 0x00F756 03:B746: 55        .byte $55   ; 
- D 1 - I - 0x00F757 03:B747: 56        .byte $56   ; 
- D 1 - I - 0x00F758 03:B748: 07        .byte $07   ; 
- D 1 - I - 0x00F759 03:B749: 08        .byte $08   ; 
- D 1 - I - 0x00F75A 03:B74A: 55        .byte $55   ; 
- D 1 - I - 0x00F75B 03:B74B: 56        .byte $56   ; 
- D 1 - I - 0x00F75C 03:B74C: 59        .byte $59   ; 
- D 1 - I - 0x00F75D 03:B74D: 59        .byte $59   ; 
- D 1 - I - 0x00F75E 03:B74E: 5A        .byte $5A   ; 
- D 1 - I - 0x00F75F 03:B74F: 57        .byte $57   ; 
- D 1 - I - 0x00F760 03:B750: 57        .byte $57   ; 
- D 1 - I - 0x00F761 03:B751: 57        .byte $57   ; 
- D 1 - I - 0x00F762 03:B752: 57        .byte $57   ; 
- D 1 - I - 0x00F763 03:B753: 57        .byte $57   ; 
- D 1 - I - 0x00F764 03:B754: 00        .byte $00   ; 
- D 1 - I - 0x00F765 03:B755: 00        .byte $00   ; 
- D 1 - I - 0x00F766 03:B756: 11        .byte $11   ; 
- D 1 - I - 0x00F767 03:B757: 12        .byte $12   ; 
- D 1 - I - 0x00F768 03:B758: 00        .byte $00   ; 
- D 1 - I - 0x00F769 03:B759: 00        .byte $00   ; 
- D 1 - I - 0x00F76A 03:B75A: 11        .byte $11   ; 
- D 1 - I - 0x00F76B 03:B75B: 12        .byte $12   ; 
- D 1 - I - 0x00F76C 03:B75C: 00        .byte $00   ; 
- D 1 - I - 0x00F76D 03:B75D: 00        .byte $00   ; 
- D 1 - I - 0x00F76E 03:B75E: 11        .byte $11   ; 
- D 1 - I - 0x00F76F 03:B75F: 12        .byte $12   ; 
- D 1 - I - 0x00F770 03:B760: 00        .byte $00   ; 
- D 1 - I - 0x00F771 03:B761: 5D        .byte $5D   ; 
- D 1 - I - 0x00F772 03:B762: 5E        .byte $5E   ; 
- D 1 - I - 0x00F773 03:B763: 12        .byte $12   ; 
- D 1 - I - 0x00F774 03:B764: 5B        .byte $5B   ; 
- D 1 - I - 0x00F775 03:B765: 5B        .byte $5B   ; 
- D 1 - I - 0x00F776 03:B766: 5B        .byte $5B   ; 
- D 1 - I - 0x00F777 03:B767: 5B        .byte $5B   ; 
- D 1 - I - 0x00F778 03:B768: 5C        .byte $5C   ; 
- D 1 - I - 0x00F779 03:B769: 5C        .byte $5C   ; 
- D 1 - I - 0x00F77A 03:B76A: 5C        .byte $5C   ; 
- D 1 - I - 0x00F77B 03:B76B: 5C        .byte $5C   ; 
- D 1 - I - 0x00F77C 03:B76C: 1E        .byte $1E   ; 
- D 1 - I - 0x00F77D 03:B76D: 07        .byte $07   ; 
- D 1 - I - 0x00F77E 03:B76E: 08        .byte $08   ; 
- D 1 - I - 0x00F77F 03:B76F: 18        .byte $18   ; 
- D 1 - I - 0x00F780 03:B770: 1E        .byte $1E   ; 
- D 1 - I - 0x00F781 03:B771: 00        .byte $00   ; 
- D 1 - I - 0x00F782 03:B772: 1A        .byte $1A   ; 
- D 1 - I - 0x00F783 03:B773: 0A        .byte $0A   ; 
- D 1 - I - 0x00F784 03:B774: 5B        .byte $5B   ; 
- D 1 - I - 0x00F785 03:B775: 5B        .byte $5B   ; 
- D 1 - I - 0x00F786 03:B776: 5B        .byte $5B   ; 
- D 1 - I - 0x00F787 03:B777: 5B        .byte $5B   ; 
- D 1 - I - 0x00F788 03:B778: 5C        .byte $5C   ; 
- D 1 - I - 0x00F789 03:B779: 5C        .byte $5C   ; 
- D 1 - I - 0x00F78A 03:B77A: 5C        .byte $5C   ; 
- D 1 - I - 0x00F78B 03:B77B: 5C        .byte $5C   ; 
- D 1 - I - 0x00F78C 03:B77C: 08        .byte $08   ; 
- D 1 - I - 0x00F78D 03:B77D: 1B        .byte $1B   ; 
- D 1 - I - 0x00F78E 03:B77E: 19        .byte $19   ; 
- D 1 - I - 0x00F78F 03:B77F: 10        .byte $10   ; 
- D 1 - I - 0x00F790 03:B780: 0A        .byte $0A   ; 
- D 1 - I - 0x00F791 03:B781: 08        .byte $08   ; 
- D 1 - I - 0x00F792 03:B782: 0A        .byte $0A   ; 
- D 1 - I - 0x00F793 03:B783: 09        .byte $09   ; 
- D 1 - I - 0x00F794 03:B784: 5B        .byte $5B   ; 
- D 1 - I - 0x00F795 03:B785: 5B        .byte $5B   ; 
- D 1 - I - 0x00F796 03:B786: 5B        .byte $5B   ; 
- D 1 - I - 0x00F797 03:B787: 5B        .byte $5B   ; 
- D 1 - I - 0x00F798 03:B788: 5C        .byte $5C   ; 
- D 1 - I - 0x00F799 03:B789: 5C        .byte $5C   ; 
- D 1 - I - 0x00F79A 03:B78A: 5C        .byte $5C   ; 
- D 1 - I - 0x00F79B 03:B78B: 5C        .byte $5C   ; 
- D 1 - I - 0x00F79C 03:B78C: 1A        .byte $1A   ; 
- D 1 - I - 0x00F79D 03:B78D: 08        .byte $08   ; 
- D 1 - I - 0x00F79E 03:B78E: 08        .byte $08   ; 
- D 1 - I - 0x00F79F 03:B78F: 18        .byte $18   ; 
- D 1 - I - 0x00F7A0 03:B790: 18        .byte $18   ; 
- D 1 - I - 0x00F7A1 03:B791: 07        .byte $07   ; 
- D 1 - I - 0x00F7A2 03:B792: 08        .byte $08   ; 
- D 1 - I - 0x00F7A3 03:B793: 0B        .byte $0B   ; 
- D 1 - I - 0x00F7A4 03:B794: 5B        .byte $5B   ; 
- D 1 - I - 0x00F7A5 03:B795: 5B        .byte $5B   ; 
- D 1 - I - 0x00F7A6 03:B796: 5B        .byte $5B   ; 
- D 1 - I - 0x00F7A7 03:B797: 5B        .byte $5B   ; 
- D 1 - I - 0x00F7A8 03:B798: 5C        .byte $5C   ; 
- D 1 - I - 0x00F7A9 03:B799: 5C        .byte $5C   ; 
- D 1 - I - 0x00F7AA 03:B79A: 5C        .byte $5C   ; 
- D 1 - I - 0x00F7AB 03:B79B: 5C        .byte $5C   ; 
- D 1 - I - 0x00F7AC 03:B79C: 1A        .byte $1A   ; 
- D 1 - I - 0x00F7AD 03:B79D: 0A        .byte $0A   ; 
- D 1 - I - 0x00F7AE 03:B79E: 0B        .byte $0B   ; 
- D 1 - I - 0x00F7AF 03:B79F: 10        .byte $10   ; 
- D 1 - I - 0x00F7B0 03:B7A0: 84        .byte $84   ; 
- D 1 - I - 0x00F7B1 03:B7A1: 07        .byte $07   ; 
- D 1 - I - 0x00F7B2 03:B7A2: 0A        .byte $0A   ; 
- D 1 - I - 0x00F7B3 03:B7A3: 08        .byte $08   ; 
- D 1 - I - 0x00F7B4 03:B7A4: 5B        .byte $5B   ; 
- D 1 - I - 0x00F7B5 03:B7A5: 5B        .byte $5B   ; 
- D 1 - I - 0x00F7B6 03:B7A6: 5B        .byte $5B   ; 
- D 1 - I - 0x00F7B7 03:B7A7: 5B        .byte $5B   ; 
- D 1 - I - 0x00F7B8 03:B7A8: 5C        .byte $5C   ; 
- D 1 - I - 0x00F7B9 03:B7A9: 5C        .byte $5C   ; 
- D 1 - I - 0x00F7BA 03:B7AA: 5C        .byte $5C   ; 
- D 1 - I - 0x00F7BB 03:B7AB: 5C        .byte $5C   ; 
- D 1 - I - 0x00F7BC 03:B7AC: 0A        .byte $0A   ; 
- D 1 - I - 0x00F7BD 03:B7AD: 08        .byte $08   ; 
- D 1 - I - 0x00F7BE 03:B7AE: 09        .byte $09   ; 
- D 1 - I - 0x00F7BF 03:B7AF: 1F        .byte $1F   ; 
- D 1 - I - 0x00F7C0 03:B7B0: 0A        .byte $0A   ; 
- D 1 - I - 0x00F7C1 03:B7B1: 08        .byte $08   ; 
- D 1 - I - 0x00F7C2 03:B7B2: 1B        .byte $1B   ; 
- D 1 - I - 0x00F7C3 03:B7B3: 1F        .byte $1F   ; 
- D 1 - I - 0x00F7C4 03:B7B4: 13        .byte $13   ; 
- D 1 - I - 0x00F7C5 03:B7B5: 14        .byte $14   ; 
- D 1 - I - 0x00F7C6 03:B7B6: 00        .byte $00   ; 
- D 1 - I - 0x00F7C7 03:B7B7: 00        .byte $00   ; 
- D 1 - I - 0x00F7C8 03:B7B8: 13        .byte $13   ; 
- D 1 - I - 0x00F7C9 03:B7B9: 14        .byte $14   ; 
- D 1 - I - 0x00F7CA 03:B7BA: 00        .byte $00   ; 
- D 1 - I - 0x00F7CB 03:B7BB: 00        .byte $00   ; 
- D 1 - I - 0x00F7CC 03:B7BC: 13        .byte $13   ; 
- D 1 - I - 0x00F7CD 03:B7BD: 14        .byte $14   ; 
- D 1 - I - 0x00F7CE 03:B7BE: 00        .byte $00   ; 
- D 1 - I - 0x00F7CF 03:B7BF: 00        .byte $00   ; 
- D 1 - I - 0x00F7D0 03:B7C0: 13        .byte $13   ; 
- D 1 - I - 0x00F7D1 03:B7C1: 5F        .byte $5F   ; 
- D 1 - I - 0x00F7D2 03:B7C2: 60        .byte $60   ; 
- D 1 - I - 0x00F7D3 03:B7C3: 00        .byte $00   ; 
- D 1 - I - 0x00F7D4 03:B7C4: 00        .byte $00   ; 
- D 1 - I - 0x00F7D5 03:B7C5: 61        .byte $61   ; 
- D 1 - I - 0x00F7D6 03:B7C6: 62        .byte $62   ; 
- D 1 - I - 0x00F7D7 03:B7C7: 63        .byte $63   ; 
- D 1 - I - 0x00F7D8 03:B7C8: 00        .byte $00   ; 
- D 1 - I - 0x00F7D9 03:B7C9: 85        .byte $85   ; 
- D 1 - I - 0x00F7DA 03:B7CA: 86        .byte $86   ; 
- D 1 - I - 0x00F7DB 03:B7CB: 87        .byte $87   ; 
- D 1 - I - 0x00F7DC 03:B7CC: 00        .byte $00   ; 
- D 1 - I - 0x00F7DD 03:B7CD: 85        .byte $85   ; 
- D 1 - I - 0x00F7DE 03:B7CE: 86        .byte $86   ; 
- D 1 - I - 0x00F7DF 03:B7CF: 87        .byte $87   ; 
- D 1 - I - 0x00F7E0 03:B7D0: 00        .byte $00   ; 
- D 1 - I - 0x00F7E1 03:B7D1: 85        .byte $85   ; 
- D 1 - I - 0x00F7E2 03:B7D2: 86        .byte $86   ; 
- D 1 - I - 0x00F7E3 03:B7D3: 87        .byte $87   ; 
- D 1 - I - 0x00F7E4 03:B7D4: 64        .byte $64   ; 
- D 1 - I - 0x00F7E5 03:B7D5: 64        .byte $64   ; 
- D 1 - I - 0x00F7E6 03:B7D6: 64        .byte $64   ; 
- D 1 - I - 0x00F7E7 03:B7D7: 64        .byte $64   ; 
- D 1 - I - 0x00F7E8 03:B7D8: 26        .byte $26   ; 
- D 1 - I - 0x00F7E9 03:B7D9: 26        .byte $26   ; 
- D 1 - I - 0x00F7EA 03:B7DA: 26        .byte $26   ; 
- D 1 - I - 0x00F7EB 03:B7DB: 26        .byte $26   ; 
- D 1 - I - 0x00F7EC 03:B7DC: 26        .byte $26   ; 
- D 1 - I - 0x00F7ED 03:B7DD: 26        .byte $26   ; 
- D 1 - I - 0x00F7EE 03:B7DE: 26        .byte $26   ; 
- D 1 - I - 0x00F7EF 03:B7DF: 26        .byte $26   ; 
- D 1 - I - 0x00F7F0 03:B7E0: 26        .byte $26   ; 
- D 1 - I - 0x00F7F1 03:B7E1: 26        .byte $26   ; 
- D 1 - I - 0x00F7F2 03:B7E2: 26        .byte $26   ; 
- D 1 - I - 0x00F7F3 03:B7E3: 26        .byte $26   ; 
- D 1 - I - 0x00F7F4 03:B7E4: 65        .byte $65   ; 
- D 1 - I - 0x00F7F5 03:B7E5: 66        .byte $66   ; 
- D 1 - I - 0x00F7F6 03:B7E6: 67        .byte $67   ; 
- D 1 - I - 0x00F7F7 03:B7E7: 00        .byte $00   ; 
- D 1 - I - 0x00F7F8 03:B7E8: 88        .byte $88   ; 
- D 1 - I - 0x00F7F9 03:B7E9: 89        .byte $89   ; 
- D 1 - I - 0x00F7FA 03:B7EA: 8A        .byte $8A   ; 
- D 1 - I - 0x00F7FB 03:B7EB: 00        .byte $00   ; 
- D 1 - I - 0x00F7FC 03:B7EC: 88        .byte $88   ; 
- D 1 - I - 0x00F7FD 03:B7ED: 89        .byte $89   ; 
- D 1 - I - 0x00F7FE 03:B7EE: 8A        .byte $8A   ; 
- D 1 - I - 0x00F7FF 03:B7EF: 00        .byte $00   ; 
- D 1 - I - 0x00F800 03:B7F0: 88        .byte $88   ; 
- D 1 - I - 0x00F801 03:B7F1: 89        .byte $89   ; 
- D 1 - I - 0x00F802 03:B7F2: 8A        .byte $8A   ; 
- D 1 - I - 0x00F803 03:B7F3: 00        .byte $00   ; 



_off007_0x00F804_02_area_3:
- D 1 - I - 0x00F804 03:B7F4: C0        .byte $C0   ; 
- D 1 - I - 0x00F805 03:B7F5: 00        .byte $00   ; 
- D 1 - I - 0x00F806 03:B7F6: 00        .byte $00   ; 
- D 1 - I - 0x00F807 03:B7F7: 00        .byte $00   ; 
- D 1 - I - 0x00F808 03:B7F8: 00        .byte $00   ; 
- D 1 - I - 0x00F809 03:B7F9: 00        .byte $00   ; 
- D 1 - I - 0x00F80A 03:B7FA: 00        .byte $00   ; 
- D 1 - I - 0x00F80B 03:B7FB: 00        .byte $00   ; 
- D 1 - I - 0x00F80C 03:B7FC: 50        .byte $50   ; 
- D 1 - I - 0x00F80D 03:B7FD: 00        .byte $00   ; 
- D 1 - I - 0x00F80E 03:B7FE: 54        .byte $54   ; 
- D 1 - I - 0x00F80F 03:B7FF: 50        .byte $50   ; 
- D 1 - I - 0x00F810 03:B800: 55        .byte $55   ; 
- D 1 - I - 0x00F811 03:B801: 55        .byte $55   ; 
- D 1 - I - 0x00F812 03:B802: 55        .byte $55   ; 
- D 1 - I - 0x00F813 03:B803: 55        .byte $55   ; 
- D 1 - I - 0x00F814 03:B804: 55        .byte $55   ; 
- D 1 - I - 0x00F815 03:B805: 55        .byte $55   ; 
- D 1 - I - 0x00F816 03:B806: 55        .byte $55   ; 
- D 1 - I - 0x00F817 03:B807: 55        .byte $55   ; 
- D 1 - I - 0x00F818 03:B808: 00        .byte $00   ; 
- D 1 - I - 0x00F819 03:B809: 00        .byte $00   ; 
- D 1 - I - 0x00F81A 03:B80A: 00        .byte $00   ; 
- D 1 - I - 0x00F81B 03:B80B: 00        .byte $00   ; 
- D 1 - I - 0x00F81C 03:B80C: C5        .byte $C5   ; 
- D 1 - I - 0x00F81D 03:B80D: F5        .byte $F5   ; 
- D 1 - I - 0x00F81E 03:B80E: F5        .byte $F5   ; 
- D 1 - I - 0x00F81F 03:B80F: 35        .byte $35   ; 
- D 1 - I - 0x00F820 03:B810: F5        .byte $F5   ; 
- D 1 - I - 0x00F821 03:B811: 00        .byte $00   ; 
- D 1 - I - 0x00F822 03:B812: BB        .byte $BB   ; 
- D 1 - I - 0x00F823 03:B813: AA        .byte $AA   ; 
- D 1 - I - 0x00F824 03:B814: EE        .byte $EE   ; 
- D 1 - I - 0x00F825 03:B815: 00        .byte $00   ; 
- D 1 - I - 0x00F826 03:B816: 00        .byte $00   ; 
- D 1 - I - 0x00F827 03:B817: BB        .byte $BB   ; 
- D 1 - I - 0x00F828 03:B818: AA        .byte $AA   ; 
- D 1 - I - 0x00F829 03:B819: EE        .byte $EE   ; 
- D 1 - I - 0x00F82A 03:B81A: 00        .byte $00   ; 
- D 1 - I - 0x00F82B 03:B81B: 00        .byte $00   ; 
- D 1 - I - 0x00F82C 03:B81C: 01        .byte $01   ; 
- D 1 - I - 0x00F82D 03:B81D: 00        .byte $00   ; 
- D 1 - I - 0x00F82E 03:B81E: 00        .byte $00   ; 
- D 1 - I - 0x00F82F 03:B81F: 60        .byte $60   ; 
- D 1 - I - 0x00F830 03:B820: 08        .byte $08   ; 
- D 1 - I - 0x00F831 03:B821: 05        .byte $05   ; 
- D 1 - I - 0x00F832 03:B822: 05        .byte $05   ; 
- D 1 - I - 0x00F833 03:B823: 05        .byte $05   ; 
- D 1 - I - 0x00F834 03:B824: 12        .byte $12   ; 
- D 1 - I - 0x00F835 03:B825: 50        .byte $50   ; 
- D 1 - I - 0x00F836 03:B826: 50        .byte $50   ; 
- D 1 - I - 0x00F837 03:B827: 50        .byte $50   ; 
- D 1 - I - 0x00F838 03:B828: 00        .byte $00   ; 
- D 1 - I - 0x00F839 03:B829: 00        .byte $00   ; 
- D 1 - I - 0x00F83A 03:B82A: FF        .byte $FF   ; 
- D 1 - I - 0x00F83B 03:B82B: FF        .byte $FF   ; 
- D 1 - I - 0x00F83C 03:B82C: 00        .byte $00   ; 
- D 1 - I - 0x00F83D 03:B82D: 00        .byte $00   ; 
- D 1 - I - 0x00F83E 03:B82E: 0F        .byte $0F   ; 
- D 1 - I - 0x00F83F 03:B82F: FF        .byte $FF   ; 
- D 1 - I - 0x00F840 03:B830: FF        .byte $FF   ; 
- D 1 - I - 0x00F841 03:B831: FF        .byte $FF   ; 
- D 1 - I - 0x00F842 03:B832: F5        .byte $F5   ; 
- D 1 - I - 0x00F843 03:B833: 00        .byte $00   ; 
- D 1 - I - 0x00F844 03:B834: FF        .byte $FF   ; 
- D 1 - I - 0x00F845 03:B835: 20        .byte $20   ; 
- D 1 - I - 0x00F846 03:B836: 88        .byte $88   ; 
- D 1 - I - 0x00F847 03:B837: A2        .byte $A2   ; 
- D 1 - I - 0x00F848 03:B838: 00        .byte $00   ; 
- D 1 - I - 0x00F849 03:B839: 00        .byte $00   ; 
- D 1 - I - 0x00F84A 03:B83A: F5        .byte $F5   ; 
- D 1 - I - 0x00F84B 03:B83B: FF        .byte $FF   ; 
- D 1 - I - 0x00F84C 03:B83C: F0        .byte $F0   ; 
- D 1 - I - 0x00F84D 03:B83D: 88        .byte $88   ; 
- D 1 - I - 0x00F84E 03:B83E: A2        .byte $A2   ; 
- D 1 - I - 0x00F84F 03:B83F: C8        .byte $C8   ; 
- D 1 - I - 0x00F850 03:B840: B2        .byte $B2   ; 
- D 1 - I - 0x00F851 03:B841: C8        .byte $C8   ; 
- D 1 - I - 0x00F852 03:B842: B2        .byte $B2   ; 
- D 1 - I - 0x00F853 03:B843: 88        .byte $88   ; 
- D 1 - I - 0x00F854 03:B844: 00        .byte $00   ; 
- D 1 - I - 0x00F855 03:B845: B4        .byte $B4   ; 
- D 1 - I - 0x00F856 03:B846: 55        .byte $55   ; 
- D 1 - I - 0x00F857 03:B847: 55        .byte $55   ; 
- D 1 - I - 0x00F858 03:B848: 55        .byte $55   ; 
- D 1 - I - 0x00F859 03:B849: 55        .byte $55   ; 
- D 1 - I - 0x00F85A 03:B84A: 55        .byte $55   ; 
- D 1 - I - 0x00F85B 03:B84B: FB        .byte $FB   ; 
- D 1 - I - 0x00F85C 03:B84C: FF        .byte $FF   ; 
- D 1 - I - 0x00F85D 03:B84D: 55        .byte $55   ; 
- D 1 - I - 0x00F85E 03:B84E: 55        .byte $55   ; 
- D 1 - I - 0x00F85F 03:B84F: FF        .byte $FF   ; 
- D 1 - I - 0x00F860 03:B850: FF        .byte $FF   ; 
- D 1 - I - 0x00F861 03:B851: BF        .byte $BF   ; 
- D 1 - I - 0x00F862 03:B852: EF        .byte $EF   ; 
- D 1 - I - 0x00F863 03:B853: FF        .byte $FF   ; 
- D 1 - I - 0x00F864 03:B854: FF        .byte $FF   ; 
- D 1 - I - 0x00F865 03:B855: FF        .byte $FF   ; 
- D 1 - I - 0x00F866 03:B856: FF        .byte $FF   ; 
- D 1 - I - 0x00F867 03:B857: FB        .byte $FB   ; 
- D 1 - I - 0x00F868 03:B858: FE        .byte $FE   ; 
- D 1 - I - 0x00F869 03:B859: FF        .byte $FF   ; 
- D 1 - I - 0x00F86A 03:B85A: FF        .byte $FF   ; 
- D 1 - I - 0x00F86B 03:B85B: AF        .byte $AF   ; 
- D 1 - I - 0x00F86C 03:B85C: AF        .byte $AF   ; 
- D 1 - I - 0x00F86D 03:B85D: 3C        .byte $3C   ; 
- D 1 - I - 0x00F86E 03:B85E: C3        .byte $C3   ; 
- D 1 - I - 0x00F86F 03:B85F: AF        .byte $AF   ; 
- D 1 - I - 0x00F870 03:B860: AF        .byte $AF   ; 
- D 1 - I - 0x00F871 03:B861: FF        .byte $FF   ; 
- D 1 - I - 0x00F872 03:B862: FF        .byte $FF   ; 
- D 1 - I - 0x00F873 03:B863: FF        .byte $FF   ; 
- D 1 - I - 0x00F874 03:B864: BC        .byte $BC   ; 
- D 1 - I - 0x00F875 03:B865: E3        .byte $E3   ; 
- D 1 - I - 0x00F876 03:B866: FF        .byte $FF   ; 
- D 1 - I - 0x00F877 03:B867: FF        .byte $FF   ; 
- D 1 - I - 0x00F878 03:B868: FF        .byte $FF   ; 
- D 1 - I - 0x00F879 03:B869: FB        .byte $FB   ; 
- D 1 - I - 0x00F87A 03:B86A: FE        .byte $FE   ; 
- D 1 - I - 0x00F87B 03:B86B: FF        .byte $FF   ; 
- D 1 - I - 0x00F87C 03:B86C: AF        .byte $AF   ; 
- D 1 - I - 0x00F87D 03:B86D: AF        .byte $AF   ; 
- D 1 - I - 0x00F87E 03:B86E: AF        .byte $AF   ; 
- D 1 - I - 0x00F87F 03:B86F: AF        .byte $AF   ; 
- D 1 - I - 0x00F880 03:B870: AF        .byte $AF   ; 
- D 1 - I - 0x00F881 03:B871: FF        .byte $FF   ; 
- D 1 - I - 0x00F882 03:B872: FF        .byte $FF   ; 
- D 1 - I - 0x00F883 03:B873: FF        .byte $FF   ; 
- D 1 - I - 0x00F884 03:B874: FF        .byte $FF   ; 
- - - - - - 0x00F885 03:B875: 00        .byte $00   ; 
- - - - - - 0x00F886 03:B876: 00        .byte $00   ; 
- - - - - - 0x00F887 03:B877: 00        .byte $00   ; 
- - - - - - 0x00F888 03:B878: 03        .byte $03   ; 
- - - - - - 0x00F889 03:B879: 00        .byte $00   ; 
- - - - - - 0x00F88A 03:B87A: 00        .byte $00   ; 
- - - - - - 0x00F88B 03:B87B: 00        .byte $00   ; 
- - - - - - 0x00F88C 03:B87C: 00        .byte $00   ; 
- - - - - - 0x00F88D 03:B87D: 00        .byte $00   ; 
- - - - - - 0x00F88E 03:B87E: 00        .byte $00   ; 
- - - - - - 0x00F88F 03:B87F: 00        .byte $00   ; 
- - - - - - 0x00F890 03:B880: 00        .byte $00   ; 
- - - - - - 0x00F891 03:B881: 00        .byte $00   ; 
- - - - - - 0x00F892 03:B882: 00        .byte $00   ; 
- - - - - - 0x00F893 03:B883: 00        .byte $00   ; 



loc_0x00F894_set_palette_for_area:
C D 1 - - - 0x00F894 03:B884: A5 50     LDA ram_номер_уровня
loc_0x00F896_set_palette:
C D 1 - - - 0x00F896 03:B886: 85 08     STA ram_0008
; fill 0F color by default
C - - - - - 0x00F898 03:B888: A9 0F     LDA #$0F
C - - - - - 0x00F89A 03:B88A: A0 1F     LDY #$1F
bra_B88C_loop:
C - - - - - 0x00F89C 03:B88C: 99 E0 03  STA ram_pal_buffer,Y
C - - - - - 0x00F89F 03:B88F: 88        DEY
C - - - - - 0x00F8A0 03:B890: 10 FA     BPL bra_B88C_loop
C - - - - - 0x00F8A2 03:B892: A5 08     LDA ram_0008
C - - - - - 0x00F8A4 03:B894: 0A        ASL
C - - - - - 0x00F8A5 03:B895: A8        TAY
C - - - - - 0x00F8A6 03:B896: B9 B3 B8  LDA tbl_B8B3,Y
C - - - - - 0x00F8A9 03:B899: 85 00     STA ram_0000
C - - - - - 0x00F8AB 03:B89B: B9 B4 B8  LDA tbl_B8B3 + $01,Y
C - - - - - 0x00F8AE 03:B89E: 85 01     STA ram_0001
; skip 1st color in each palette set
C - - - - - 0x00F8B0 03:B8A0: A0 17     LDY #$17
C - - - - - 0x00F8B2 03:B8A2: A2 1F     LDX #$1F
bra_B8A4_loop:
C - - - - - 0x00F8B4 03:B8A4: 8A        TXA
C - - - - - 0x00F8B5 03:B8A5: 29 03     AND #$03
C - - - - - 0x00F8B7 03:B8A7: F0 06     BEQ bra_B8AF_skip
C - - - - - 0x00F8B9 03:B8A9: B1 00     LDA (ram_0000),Y
C - - - - - 0x00F8BB 03:B8AB: 9D E0 03  STA ram_pal_buffer,X
C - - - - - 0x00F8BE 03:B8AE: 88        DEY
bra_B8AF_skip:
C - - - - - 0x00F8BF 03:B8AF: CA        DEX
C - - - - - 0x00F8C0 03:B8B0: 10 F2     BPL bra_B8A4_loop
C - - - - - 0x00F8C2 03:B8B2: 60        RTS



tbl_B8B3:
- D 1 - - - 0x00F8C3 03:B8B3: C9 B8     .word _off021_B8C9_00_area_1
- D 1 - - - 0x00F8C5 03:B8B5: E1 B8     .word _off021_B8E1_01_area_2
- D 1 - - - 0x00F8C7 03:B8B7: F9 B8     .word _off021_B8F9_02_area_3
- D 1 - - - 0x00F8C9 03:B8B9: 11 B9     .word _off021_B911_03_area_4
- D 1 - - - 0x00F8CB 03:B8BB: 29 B9     .word _off021_B929_04_area_5
- D 1 - - - 0x00F8CD 03:B8BD: 41 B9     .word _off021_B941_05_area_6
- D 1 - - - 0x00F8CF 03:B8BF: 59 B9     .word _off021_B959_06_area_7
- D 1 - - - 0x00F8D1 03:B8C1: 71 B9     .word _off021_B971_07_area_8
- D 1 - - - 0x00F8D3 03:B8C3: 89 B9     .word _off021_B989_08
- D 1 - - - 0x00F8D5 03:B8C5: A1 B9     .word _off021_B9A1_09
- D 1 - - - 0x00F8D7 03:B8C7: B9 B9     .word _off021_B9B9_0A



_off021_B8C9_00_area_1:
; background
- D 1 - I - 0x00F8D9 03:B8C9: 20        .byte $20, $10, $00   ; 
- D 1 - I - 0x00F8DC 03:B8CC: 20        .byte $20, $10, $00   ; 
- D 1 - I - 0x00F8DF 03:B8CF: 27        .byte $27, $16, $04   ; 
- D 1 - I - 0x00F8E2 03:B8D2: 16        .byte $16, $06, $00   ; 
; sprites
- D 1 - I - 0x00F8E5 03:B8D5: 37        .byte $37, $1C, $0F   ; 
- D 1 - I - 0x00F8E8 03:B8D8: 37        .byte $37, $16, $0F   ; 
- D 1 - I - 0x00F8EB 03:B8DB: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F8EE 03:B8DE: 34        .byte $34, $1B, $0F   ; 



_off021_B8E1_01_area_2:
; background
- D 1 - I - 0x00F8F1 03:B8E1: 20        .byte $20, $10, $00   ; 
- D 1 - I - 0x00F8F4 03:B8E4: 00        .byte $00, $10, $0C   ; 
- D 1 - I - 0x00F8F7 03:B8E7: 20        .byte $20, $1C, $0C   ; 
- D 1 - I - 0x00F8FA 03:B8EA: 06        .byte $06, $1C, $0C   ; 
; sprites
- D 1 - I - 0x00F8FD 03:B8ED: 37        .byte $37, $11, $0C   ; 
- D 1 - I - 0x00F900 03:B8F0: 37        .byte $37, $16, $07   ; 
- D 1 - I - 0x00F903 03:B8F3: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F906 03:B8F6: 34        .byte $34, $1B, $0F   ; 



_off021_B8F9_02_area_3:
; background
- D 1 - I - 0x00F909 03:B8F9: 2A        .byte $2A, $1A, $0A   ; 
- D 1 - I - 0x00F90C 03:B8FC: 28        .byte $28, $18, $08   ; 
- D 1 - I - 0x00F90F 03:B8FF: 10        .byte $10, $1A, $0A   ; 
- D 1 - I - 0x00F912 03:B902: 20        .byte $20, $10, $00   ; 
; sprites
- D 1 - I - 0x00F915 03:B905: 37        .byte $37, $1C, $0F   ; 
- D 1 - I - 0x00F918 03:B908: 37        .byte $37, $16, $0F   ; 
- D 1 - I - 0x00F91B 03:B90B: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F91E 03:B90E: 3B        .byte $3B, $14, $0F   ; 



_off021_B911_03_area_4:
; background
- D 1 - I - 0x00F921 03:B911: 20        .byte $20, $1B, $0A   ; 
- D 1 - I - 0x00F924 03:B914: 01        .byte $01, $00, $0A   ; 
- D 1 - I - 0x00F927 03:B917: 01        .byte $01, $1B, $0A   ; 
- D 1 - I - 0x00F92A 03:B91A: 01        .byte $01, $00, $06   ; 
; sprites
- D 1 - I - 0x00F92D 03:B91D: 37        .byte $37, $1C, $0F   ; 
- D 1 - I - 0x00F930 03:B920: 37        .byte $37, $16, $0F   ; 
- D 1 - I - 0x00F933 03:B923: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F936 03:B926: 20        .byte $20, $1B, $0A   ; 



_off021_B929_04_area_5:
; background
- D 1 - I - 0x00F939 03:B929: 20        .byte $20, $10, $00   ; 
- D 1 - I - 0x00F93C 03:B92C: 2A        .byte $2A, $1A, $00   ; 
- D 1 - I - 0x00F93F 03:B92F: 2C        .byte $2C, $1C, $0C   ; 
- D 1 - I - 0x00F942 03:B932: 20        .byte $20, $10, $04   ; 
; sprites
- D 1 - I - 0x00F945 03:B935: 37        .byte $37, $1C, $0F   ; 
- D 1 - I - 0x00F948 03:B938: 37        .byte $37, $16, $0F   ; 
- D 1 - I - 0x00F94B 03:B93B: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F94E 03:B93E: 3B        .byte $3B, $14, $0F   ; 



_off021_B941_05_area_6:
; background
- D 1 - I - 0x00F951 03:B941: 20        .byte $20, $10, $00   ; 
- D 1 - I - 0x00F954 03:B944: 29        .byte $29, $19, $09   ; 
- D 1 - I - 0x00F957 03:B947: 20        .byte $20, $10, $06   ; 
- D 1 - I - 0x00F95A 03:B94A: 10        .byte $10, $00, $06   ; 
; sprites
- D 1 - I - 0x00F95D 03:B94D: 37        .byte $37, $11, $0C   ; 
- D 1 - I - 0x00F960 03:B950: 37        .byte $37, $16, $07   ; 
- D 1 - I - 0x00F963 03:B953: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F966 03:B956: 10        .byte $10, $16, $0F   ; 



_off021_B959_06_area_7:
; background
- D 1 - I - 0x00F969 03:B959: 2C        .byte $2C, $12, $02   ; 
- D 1 - I - 0x00F96C 03:B95C: 22        .byte $22, $12, $02   ; 
- D 1 - I - 0x00F96F 03:B95F: 27        .byte $27, $16, $06   ; 
- D 1 - I - 0x00F972 03:B962: 1C        .byte $1C, $1A, $0A   ; 
; sprites
- D 1 - I - 0x00F975 03:B965: 37        .byte $37, $1C, $0F   ; 
- D 1 - I - 0x00F978 03:B968: 37        .byte $37, $16, $0F   ; 
- D 1 - I - 0x00F97B 03:B96B: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F97E 03:B96E: 24        .byte $24, $14, $04   ; 



_off021_B971_07_area_8:
; background
- D 1 - I - 0x00F981 03:B971: 24        .byte $24, $14, $04   ; 
- D 1 - I - 0x00F984 03:B974: 03        .byte $03, $02, $0C   ; 
- D 1 - I - 0x00F987 03:B977: 20        .byte $20, $10, $00   ; 
- D 1 - I - 0x00F98A 03:B97A: 09        .byte $09, $18, $08   ; 
; sprites
- D 1 - I - 0x00F98D 03:B97D: 37        .byte $37, $1C, $0F   ; 
- D 1 - I - 0x00F990 03:B980: 37        .byte $37, $16, $0F   ; 
- D 1 - I - 0x00F993 03:B983: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F996 03:B986: 20        .byte $20, $00, $0C   ; 



_off021_B989_08:
; background
- D 1 - I - 0x00F999 03:B989: 10        .byte $10, $27, $16   ; 
- D 1 - I - 0x00F99C 03:B98C: 20        .byte $20, $22, $02   ; 
- D 1 - I - 0x00F99F 03:B98F: 20        .byte $20, $10, $00   ; 
- D 1 - I - 0x00F9A2 03:B992: 27        .byte $27, $16, $06   ; 
; sprites
- D 1 - I - 0x00F9A5 03:B995: 16        .byte $16, $06, $0F   ; 
- D 1 - I - 0x00F9A8 03:B998: 20        .byte $20, $16, $17   ; 
- D 1 - I - 0x00F9AB 03:B99B: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F9AE 03:B99E: 20        .byte $20, $00, $0F   ; 



_off021_B9A1_09:
; background
- D 1 - I - 0x00F9B1 03:B9A1: 0F        .byte $0F, $0F, $0F   ; 
- D 1 - I - 0x00F9B4 03:B9A4: 20        .byte $20, $22, $02   ; 
- D 1 - I - 0x00F9B7 03:B9A7: 0F        .byte $0F, $0F, $0F   ; 
- D 1 - I - 0x00F9BA 03:B9AA: 0F        .byte $0F, $0F, $0F   ; 
; sprites
- D 1 - I - 0x00F9BD 03:B9AD: 0F        .byte $0F, $0F, $0F   ; 
- D 1 - I - 0x00F9C0 03:B9B0: 20        .byte $20, $16, $17   ; 
- D 1 - I - 0x00F9C3 03:B9B3: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F9C6 03:B9B6: 20        .byte $20, $00, $0F   ; 



_off021_B9B9_0A:
; background
- D 1 - I - 0x00F9C9 03:B9B9: 20        .byte $20, $27, $16   ; 
- D 1 - I - 0x00F9CC 03:B9BC: 27        .byte $27, $16, $04   ; 
- D 1 - I - 0x00F9CF 03:B9BF: 27        .byte $27, $16, $04   ; 
- D 1 - I - 0x00F9D2 03:B9C2: 26        .byte $26, $16, $05   ; 
; sprites
- D 1 - I - 0x00F9D5 03:B9C5: 20        .byte $20, $27, $0F   ; 
- D 1 - I - 0x00F9D8 03:B9C8: 20        .byte $20, $16, $17   ; 
- D 1 - I - 0x00F9DB 03:B9CB: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F9DE 03:B9CE: 37        .byte $37, $00, $0F   ; 


.out .sprintf("Free bytes in bank 36: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_36b"
- D 1 - - - 0x01000F 03:BFFF: 37        .byte con_prg_bank + $37   ; 



