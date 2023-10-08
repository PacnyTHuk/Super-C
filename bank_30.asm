.segment "BANK_30"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x000010-0x00400F



.export loc_0x000011
.export loc_0x001191
.export loc_0x001199
.export sub_0x001271
.export loc_0x001411
.export loc_0x00178C_print_text_on_the_screen
.export loc_0x00189E_draw_static_screen
.export loc_0x001C02_prepare_area_config
.export loc_0x001CA6
.export loc_0x001DA4
.export loc_0x002178_stage_complete_handler
.export loc_0x0022AC_cheat_code
.export loc_0x0022D4
.export loc_0x00231A_title_screen_handler
.export loc_0x0023C7_credits_handler
.export _off014_32_0x00263F_00
.export _off014_32_0x002730_01
.export _off014_32_0x0027DC_02
.export _off014_32_0x002854_03
.export _off014_36_0x0028DE_00
.export _off014_36_0x002962_01
.export _off014_36_0x0029E4_02
.export _off014_36_0x002A7D_03
.export _off004_0x002B55_01_area_2
.export _off005_0x002B71_01_area_2
.export _off006_0x002F4F_01_area_2
.export _off007_0x003E9F_01_area_2



; bzk this byte must be placed at 8000
- D 0 - - - 0x000010 00:8000: 30        .byte con_prg_bank + $30   ; 



loc_0x000011:
C D 0 - - - 0x000011 00:8001: A9        LDA #$00
C - - - - - 0x000013 00:8003: 85 72     STA ram_cam_spd_Y
C - - - - - 0x000015 00:8005: 85 62     STA ram_cam_spd_X
C - - - - - 0x000017 00:8007: A9 00     LDA #$00
C - - - - - 0x000019 00:8009: A4 CA     LDY ram_plr_game_over
C - - - - - 0x00001B 00:800B: D0 02     BNE bra_800F
C - - - - - 0x00001D 00:800D: 09 01     ORA #$01
bra_800F:
C - - - - - 0x00001F 00:800F: A4 CB     LDY ram_plr_game_over + $01
C - - - - - 0x000021 00:8011: D0 02     BNE bra_8015
C - - - - - 0x000023 00:8013: 09 02     ORA #$02
bra_8015:
C - - - - - 0x000025 00:8015: A8        TAY
C - - - - - 0x000026 00:8016: 88        DEY
C - - - - - 0x000027 00:8017: 84 96     STY ram_0096
C - - - - - 0x000029 00:8019: 20 60 83  JSR sub_8360
C - - - - - 0x00002C 00:801C: 20 BE 83  JSR sub_83BE
C - - - - - 0x00002F 00:801F: A2 00     LDX #$00
C - - - - - 0x000031 00:8021: A0 01     LDY #$01
C - - - - - 0x000033 00:8023: A5 CC     LDA ram_00CC
C - - - - - 0x000035 00:8025: C5 CD     CMP ram_00CD
C - - - - - 0x000037 00:8027: 90 0A     BCC bra_8033
C - - - - - 0x000039 00:8029: D0 0A     BNE bra_8035
C - - - - - 0x00003B 00:802B: A5 F4     LDA ram_btn_hold + $01
C - - - - - 0x00003D 00:802D: 05 B1     ORA ram_00B1
C - - - - - 0x00003F 00:802F: 29 01     AND #con_btn_Right
C - - - - - 0x000041 00:8031: F0 02     BEQ bra_8035
bra_8033:
C - - - - - 0x000043 00:8033: E8        INX
C - - - - - 0x000044 00:8034: 88        DEY
bra_8035:
C - - - - - 0x000045 00:8035: 86 10     STX ram_0010
C - - - - - 0x000047 00:8037: 84 11     STY ram_0011
C - - - - - 0x000049 00:8039: 20 13 85  JSR sub_8513
C - - - - - 0x00004C 00:803C: A5 10     LDA ram_0010
C - - - - - 0x00004E 00:803E: A6 11     LDX ram_0011
C - - - - - 0x000050 00:8040: 86 10     STX ram_0010
C - - - - - 0x000052 00:8042: 85 11     STA ram_0011
C - - - - - 0x000054 00:8044: 20 17 85  JSR sub_8517
C - - - - - 0x000057 00:8047: A2 00     LDX #$00
C - - - - - 0x000059 00:8049: A0 01     LDY #$01
C - - - - - 0x00005B 00:804B: A5 71     LDA ram_0071_flag
C - - - - - 0x00005D 00:804D: 30 1E     BMI bra_806D
C - - - - - 0x00005F 00:804F: A5 CE     LDA ram_00CE
C - - - - - 0x000061 00:8051: C5 CF     CMP ram_00CF
C - - - - - 0x000063 00:8053: 90 26     BCC bra_807B
C - - - - - 0x000065 00:8055: D0 22     BNE bra_8079
C - - - - - 0x000067 00:8057: A5 5D     LDA ram_005D
C - - - - - 0x000069 00:8059: F0 08     BEQ bra_8063
C - - - - - 0x00006B 00:805B: A5 F4     LDA ram_btn_hold + $01
C - - - - - 0x00006D 00:805D: 29 08     AND #con_btn_Up
C - - - - - 0x00006F 00:805F: F0 1A     BEQ bra_807B
C - - - - - 0x000071 00:8061: D0 16     BNE bra_8079    ; jmp
bra_8063:
C - - - - - 0x000073 00:8063: A5 AF     LDA ram_00AE_plr + $01
C - - - - - 0x000075 00:8065: 10 14     BPL bra_807B
C - - - - - 0x000077 00:8067: A5 A9     LDA ram_spd_Y_hi_plr + $01
C - - - - - 0x000079 00:8069: 10 10     BPL bra_807B
C - - - - - 0x00007B 00:806B: 30 0C     BMI bra_8079    ; jmp
bra_806D:
C - - - - - 0x00007D 00:806D: A5 CF     LDA ram_00CF
C - - - - - 0x00007F 00:806F: C5 CE     CMP ram_00CE
C - - - - - 0x000081 00:8071: 90 08     BCC bra_807B
C - - - - - 0x000083 00:8073: D0 04     BNE bra_8079
C - - - - - 0x000085 00:8075: 24 AF     BIT ram_00AE_plr + $01
C - - - - - 0x000087 00:8077: 50 02     BVC bra_807B
bra_8079:
C - - - - - 0x000089 00:8079: E8        INX
C - - - - - 0x00008A 00:807A: 88        DEY
bra_807B:
C - - - - - 0x00008B 00:807B: 86 10     STX ram_0010
C - - - - - 0x00008D 00:807D: 84 11     STY ram_0011
C - - - - - 0x00008F 00:807F: 20 AE 88  JSR sub_88AE
C - - - - - 0x000092 00:8082: A5 10     LDA ram_0010
C - - - - - 0x000094 00:8084: A6 11     LDX ram_0011
C - - - - - 0x000096 00:8086: 86 10     STX ram_0010
C - - - - - 0x000098 00:8088: 85 11     STA ram_0011
C - - - - - 0x00009A 00:808A: 20 B2 88  JSR sub_88B2
C - - - - - 0x00009D 00:808D: 20 F2 83  JSR sub_83F2
C - - - - - 0x0000A0 00:8090: A0 00     LDY #$00
C - - - - - 0x0000A2 00:8092: A2 01     LDX #$01
bra_8094_loop:
C - - - - - 0x0000A4 00:8094: B5 A0     LDA ram_00A0,X
C - - - - - 0x0000A6 00:8096: C9 02     CMP #$02
C - - - - - 0x0000A8 00:8098: D0 09     BNE bra_80A3
C - - - - - 0x0000AA 00:809A: B5 B8     LDA ram_weapon,X
C - - - - - 0x0000AC 00:809C: 29 0F     AND #$0F
C - - - - - 0x0000AE 00:809E: C9 02     CMP #con_weapon_S
C - - - - - 0x0000B0 00:80A0: D0 01     BNE bra_80A3
; if S
C - - - - - 0x0000B2 00:80A2: C8        INY
bra_80A3:
C - - - - - 0x0000B3 00:80A3: CA        DEX
C - - - - - 0x0000B4 00:80A4: 10 EE     BPL bra_8094_loop
C - - - - - 0x0000B6 00:80A6: 84 52     STY ram_S_weapon_cnt
C - - - - - 0x0000B8 00:80A8: 20 57 84  JSR sub_8457_borrow_lives
C - - - - - 0x0000BB 00:80AB: A5 CA     LDA ram_plr_game_over
C - - - - - 0x0000BD 00:80AD: 25 CB     AND ram_plr_game_over + $01
C - - - - - 0x0000BF 00:80AF: F0 03     BEQ bra_80B4_RTS
C - - - - - 0x0000C1 00:80B1: 4C F6 E8  JMP loc_0x01E906
bra_80B4_RTS:
C - - - - - 0x0000C4 00:80B4: 60        RTS



sub_80B5:
C - - - - - 0x0000C5 00:80B5: A9 FF     LDA #$FF
C - - - - - 0x0000C7 00:80B7: 95 C6     STA ram_00C6,X
C - - - - - 0x0000C9 00:80B9: A9 00     LDA #$00
C - - - - - 0x0000CB 00:80BB: 95 C2     STA ram_00C2,X
C - - - - - 0x0000CD 00:80BD: B5 BC     LDA ram_00BC,X
C - - - - - 0x0000CF 00:80BF: F0 02     BEQ bra_80C3
C - - - - - 0x0000D1 00:80C1: D6 BC     DEC ram_00BC,X
bra_80C3:
C - - - - - 0x0000D3 00:80C3: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x0000D5 00:80C5: C9 04     CMP #$04
C - - - - - 0x0000D7 00:80C7: D0 2C     BNE bra_80F5
C - - - - - 0x0000D9 00:80C9: A9 7F     LDA #$7F
C - - - - - 0x0000DB 00:80CB: 95 C6     STA ram_00C6,X
C - - - - - 0x0000DD 00:80CD: A0 00     LDY #$00
C - - - - - 0x0000DF 00:80CF: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x0000E1 00:80D1: 29 04     AND #con_btn_Down
C - - - - - 0x0000E3 00:80D3: F0 02     BEQ bra_80D7
C - - - - - 0x0000E5 00:80D5: A0 02     LDY #$02
bra_80D7:
C - - - - - 0x0000E7 00:80D7: 98        TYA
C - - - - - 0x0000E8 00:80D8: 4A        LSR
C - - - - - 0x0000E9 00:80D9: 95 C2     STA ram_00C2,X
C - - - - - 0x0000EB 00:80DB: B5 BC     LDA ram_00BC,X
C - - - - - 0x0000ED 00:80DD: F0 10     BEQ bra_80EF
C - - - - - 0x0000EF 00:80DF: A0 04     LDY #$04
C - - - - - 0x0000F1 00:80E1: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x0000F3 00:80E3: 29 08     AND #con_btn_Up
C - - - - - 0x0000F5 00:80E5: F0 08     BEQ bra_80EF
C - - - - - 0x0000F7 00:80E7: C8        INY ; 05
C - - - - - 0x0000F8 00:80E8: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x0000FA 00:80EA: 29 03     AND #con_btns_LR
C - - - - - 0x0000FC 00:80EC: D0 01     BNE bra_80EF
C - - - - - 0x0000FE 00:80EE: C8        INY ; 06
bra_80EF:
C - - - - - 0x0000FF 00:80EF: B9 1D 82  LDA tbl_821D,Y
C - - - - - 0x000102 00:80F2: 4C CC 81  JMP loc_81CC
bra_80F5:
C - - - - - 0x000105 00:80F5: B5 AE     LDA ram_00AE_plr,X
C - - - - - 0x000107 00:80F7: 0A        ASL
C - - - - - 0x000108 00:80F8: 90 03     BCC bra_80FD
C - - - - - 0x00010A 00:80FA: 4C AB 81  JMP loc_81AB
bra_80FD:
C - - - - - 0x00010D 00:80FD: 0A        ASL
C - - - - - 0x00010E 00:80FE: 90 0D     BCC bra_810D
C - - - - - 0x000110 00:8100: A9 01     LDA #$01
C - - - - - 0x000112 00:8102: B4 A0     LDY ram_00A0,X
C - - - - - 0x000114 00:8104: C0 02     CPY #$02
C - - - - - 0x000116 00:8106: F0 02     BEQ bra_810A
C - - - - - 0x000118 00:8108: A9 05     LDA #$05
bra_810A:
C - - - - - 0x00011A 00:810A: 4C CC 81  JMP loc_81CC
bra_810D:
C - - - - - 0x00011D 00:810D: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x00011F 00:810F: 29 03     AND #con_btns_LR
C - - - - - 0x000121 00:8111: F0 18     BEQ bra_812B
C - - - - - 0x000123 00:8113: F6 B6     INC ram_00B6,X
C - - - - - 0x000125 00:8115: B5 B6     LDA ram_00B6,X
C - - - - - 0x000127 00:8117: C9 06     CMP #$06
C - - - - - 0x000129 00:8119: 90 18     BCC bra_8133
C - - - - - 0x00012B 00:811B: A9 00     LDA #$00
C - - - - - 0x00012D 00:811D: 95 B6     STA ram_00B6,X
C - - - - - 0x00012F 00:811F: F6 B4     INC ram_00B4,X
C - - - - - 0x000131 00:8121: B4 B4     LDY ram_00B4,X
C - - - - - 0x000133 00:8123: C0 06     CPY #$06
C - - - - - 0x000135 00:8125: 90 0C     BCC bra_8133
C - - - - - 0x000137 00:8127: A0 00     LDY #$00
C - - - - - 0x000139 00:8129: F0 06     BEQ bra_8131    ; jmp
bra_812B:
C - - - - - 0x00013B 00:812B: A9 00     LDA #$00
C - - - - - 0x00013D 00:812D: 95 B6     STA ram_00B6,X
C - - - - - 0x00013F 00:812F: A0 02     LDY #$02
bra_8131:
C - - - - - 0x000141 00:8131: 94 B4     STY ram_00B4,X
bra_8133:
C - - - - - 0x000143 00:8133: B4 B4     LDY ram_00B4,X
C - - - - - 0x000145 00:8135: A5 5C     LDA ram_005C
C - - - - - 0x000147 00:8137: F0 0F     BEQ bra_8148
C - - - - - 0x000149 00:8139: B9 F9 81  LDA tbl_81F9,Y
C - - - - - 0x00014C 00:813C: D5 D6     CMP ram_00D6,X
C - - - - - 0x00014E 00:813E: F0 08     BEQ bra_8148
C - - - - - 0x000150 00:8140: 95 D6     STA ram_00D6,X
C - - - - - 0x000152 00:8142: A8        TAY ; update Z flag
C - - - - - 0x000153 00:8143: F0 03     BEQ bra_8148
C - - - - - 0x000155 00:8145: 20 DE FD  JSR sub_0x01FDEE_play_sound
bra_8148:
C - - - - - 0x000158 00:8148: A9 00     LDA #$00
C - - - - - 0x00015A 00:814A: 85 00     STA ram_0000
C - - - - - 0x00015C 00:814C: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x00015E 00:814E: 4A        LSR
C - - - - - 0x00015F 00:814F: 4A        LSR
C - - - - - 0x000160 00:8150: 4A        LSR
C - - - - - 0x000161 00:8151: A0 0C     LDY #$0C
C - - - - - 0x000163 00:8153: B0 23     BCS bra_8178    ; if con_btn_Down
C - - - - - 0x000165 00:8155: 4A        LSR
C - - - - - 0x000166 00:8156: A9 02     LDA #$02
C - - - - - 0x000168 00:8158: 85 00     STA ram_0000
C - - - - - 0x00016A 00:815A: A0 06     LDY #$06
C - - - - - 0x00016C 00:815C: B0 1A     BCS bra_8178    ; if con_btn_Up
C - - - - - 0x00016E 00:815E: A0 12     LDY #$12
C - - - - - 0x000170 00:8160: B5 BC     LDA ram_00BC,X
C - - - - - 0x000172 00:8162: F0 0A     BEQ bra_816E
C - - - - - 0x000174 00:8164: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000176 00:8166: 29 03     AND #con_btns_LR
C - - - - - 0x000178 00:8168: D0 36     BNE bra_81A0
C - - - - - 0x00017A 00:816A: A9 0B     LDA #$0B
C - - - - - 0x00017C 00:816C: D0 3A     BNE bra_81A8    ; jmp
bra_816E:
C - - - - - 0x00017E 00:816E: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000180 00:8170: 29 03     AND #con_btns_LR
C - - - - - 0x000182 00:8172: F0 2C     BEQ bra_81A0
C - - - - - 0x000184 00:8174: A0 00     LDY #$00
C - - - - - 0x000186 00:8176: F0 28     BEQ bra_81A0    ; jmp
bra_8178:
C - - - - - 0x000188 00:8178: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x00018A 00:817A: 29 03     AND #con_btns_LR
C - - - - - 0x00018C 00:817C: D0 22     BNE bra_81A0
C - - - - - 0x00018E 00:817E: A5 00     LDA ram_0000
C - - - - - 0x000190 00:8180: D0 10     BNE bra_8192
C - - - - - 0x000192 00:8182: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x000194 00:8184: C9 06     CMP #$06
C - - - - - 0x000196 00:8186: A0 3F     LDY #$3F
C - - - - - 0x000198 00:8188: 90 06     BCC bra_8190
C - - - - - 0x00019A 00:818A: A0 5F     LDY #$5F
C - - - - - 0x00019C 00:818C: A9 04     LDA #$04
C - - - - - 0x00019E 00:818E: 85 00     STA ram_0000
bra_8190:
C - - - - - 0x0001A0 00:8190: 94 C6     STY ram_00C6,X
bra_8192:
C - - - - - 0x0001A2 00:8192: B5 BC     LDA ram_00BC,X
C - - - - - 0x0001A4 00:8194: F0 02     BEQ bra_8198
C - - - - - 0x0001A6 00:8196: E6 00     INC ram_0000
bra_8198:
C - - - - - 0x0001A8 00:8198: A4 00     LDY ram_0000
C - - - - - 0x0001AA 00:819A: B9 17 82  LDA tbl_8217,Y
C - - - - - 0x0001AD 00:819D: 4C CC 81  JMP loc_81CC
bra_81A0:
C - - - - - 0x0001B0 00:81A0: 98        TYA
C - - - - - 0x0001B1 00:81A1: 18        CLC
C - - - - - 0x0001B2 00:81A2: 75 B4     ADC ram_00B4,X
C - - - - - 0x0001B4 00:81A4: A8        TAY
C - - - - - 0x0001B5 00:81A5: B9 FF 81  LDA tbl_81FF,Y
bra_81A8:
C - - - - - 0x0001B8 00:81A8: 4C CC 81  JMP loc_81CC



loc_81AB:
C D 0 - - - 0x0001BB 00:81AB: A9 1F     LDA #$1F
C - - - - - 0x0001BD 00:81AD: 95 C6     STA ram_00C6,X
C - - - - - 0x0001BF 00:81AF: F6 B6     INC ram_00B6,X
C - - - - - 0x0001C1 00:81B1: B5 B6     LDA ram_00B6,X
C - - - - - 0x0001C3 00:81B3: C9 05     CMP #$05
C - - - - - 0x0001C5 00:81B5: 90 10     BCC bra_81C7
C - - - - - 0x0001C7 00:81B7: A9 00     LDA #$00
C - - - - - 0x0001C9 00:81B9: 95 B6     STA ram_00B6,X
C - - - - - 0x0001CB 00:81BB: F6 B4     INC ram_00B4,X
C - - - - - 0x0001CD 00:81BD: B5 B4     LDA ram_00B4,X
C - - - - - 0x0001CF 00:81BF: C9 04     CMP #$04
C - - - - - 0x0001D1 00:81C1: 90 04     BCC bra_81C7
C - - - - - 0x0001D3 00:81C3: A9 00     LDA #$00
C - - - - - 0x0001D5 00:81C5: 95 B4     STA ram_00B4,X
bra_81C7:
C - - - - - 0x0001D7 00:81C7: B5 B4     LDA ram_00B4,X
C - - - - - 0x0001D9 00:81C9: 18        CLC
C - - - - - 0x0001DA 00:81CA: 69 1A     ADC #$1A
loc_81CC:
C D 0 - - - 0x0001DC 00:81CC: A8        TAY
C - - - - - 0x0001DD 00:81CD: B5 C4     LDA ram_plr_invinc,X
C - - - - - 0x0001DF 00:81CF: F0 07     BEQ bra_81D8
C - - - - - 0x0001E1 00:81D1: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x0001E3 00:81D3: 4A        LSR
C - - - - - 0x0001E4 00:81D4: 90 02     BCC bra_81D8
C - - - - - 0x0001E6 00:81D6: A0 00     LDY #$00
bra_81D8:
C - - - - - 0x0001E8 00:81D8: 98        TYA
C - - - - - 0x0001E9 00:81D9: 9D 18 05  STA ram_anim_id_plr,X
C - - - - - 0x0001EC 00:81DC: BD F7 81  LDA tbl_81F7,X
C - - - - - 0x0001EF 00:81DF: 1D 66 05  ORA ram_attr_spr_plr,X
C - - - - - 0x0001F2 00:81E2: B4 D4     LDY ram_plr_barrier_timer,X
C - - - - - 0x0001F4 00:81E4: F0 0D     BEQ bra_81F3
C - - - - - 0x0001F6 00:81E6: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x0001F8 00:81E8: 4A        LSR
C - - - - - 0x0001F9 00:81E9: 4A        LSR
C - - - - - 0x0001FA 00:81EA: BD 66 05  LDA ram_attr_spr_plr,X
C - - - - - 0x0001FD 00:81ED: 29 FC     AND #$FC
C - - - - - 0x0001FF 00:81EF: 90 02     BCC bra_81F3
C - - - - - 0x000201 00:81F1: 09 01     ORA #$01
bra_81F3:
C - - - - - 0x000203 00:81F3: 9D 66 05  STA ram_attr_spr_plr,X
C - - - - - 0x000206 00:81F6: 60        RTS



tbl_81F7:
- D 0 - - - 0x000207 00:81F7: 00        .byte $00   ; 00 
- D 0 - - - 0x000208 00:81F8: 01        .byte $01   ; 01 



tbl_81F9:
- D 0 - - - 0x000209 00:81F9: 07        .byte con_sound_07   ; 00 
- D 0 - - - 0x00020A 00:81FA: 00        .byte $00   ; 01 
- D 0 - - - 0x00020B 00:81FB: 00        .byte $00   ; 02 
- D 0 - - - 0x00020C 00:81FC: 07        .byte con_sound_07   ; 03 
- D 0 - - - 0x00020D 00:81FD: 00        .byte $00   ; 04 
- D 0 - - - 0x00020E 00:81FE: 00        .byte $00   ; 05 



tbl_81FF:
; 00 
- D 0 - - - 0x00020F 00:81FF: 01        .byte $01   ; 00 
- D 0 - - - 0x000210 00:8200: 02        .byte $02   ; 01 
- D 0 - - - 0x000211 00:8201: 03        .byte $03   ; 02 
- D 0 - - - 0x000212 00:8202: 04        .byte $04   ; 03 
- D 0 - - - 0x000213 00:8203: 02        .byte $02   ; 04 
- D 0 - - - 0x000214 00:8204: 05        .byte $05   ; 05 
; 06 
- D 0 - - - 0x000215 00:8205: 0C        .byte $0C   ; 00 
- D 0 - - - 0x000216 00:8206: 0D        .byte $0D   ; 01 
- D 0 - - - 0x000217 00:8207: 0E        .byte $0E   ; 02 
- D 0 - - - 0x000218 00:8208: 0F        .byte $0F   ; 03 
- D 0 - - - 0x000219 00:8209: 0D        .byte $0D   ; 04 
- D 0 - - - 0x00021A 00:820A: 10        .byte $10   ; 05 
; 0C 
- D 0 - - - 0x00021B 00:820B: 11        .byte $11   ; 00 
- D 0 - - - 0x00021C 00:820C: 12        .byte $12   ; 01 
- D 0 - - - 0x00021D 00:820D: 13        .byte $13   ; 02 
- D 0 - - - 0x00021E 00:820E: 14        .byte $14   ; 03 
- D 0 - - - 0x00021F 00:820F: 12        .byte $12   ; 04 
- D 0 - - - 0x000220 00:8210: 15        .byte $15   ; 05 
; 12 
- D 0 - - - 0x000221 00:8211: 06        .byte $06   ; 00 
- D 0 - - - 0x000222 00:8212: 07        .byte $07   ; 01 
- D 0 - - - 0x000223 00:8213: 08        .byte $08   ; 02 
- D 0 - - - 0x000224 00:8214: 09        .byte $09   ; 03 
- D 0 - - - 0x000225 00:8215: 07        .byte $07   ; 04 
- D 0 - - - 0x000226 00:8216: 0A        .byte $0A   ; 05 



tbl_8217:
- D 0 - - - 0x000227 00:8217: 16        .byte $16   ; 00 
- D 0 - - - 0x000228 00:8218: 17        .byte $17   ; 01 
- D 0 - - - 0x000229 00:8219: 18        .byte $18   ; 02 
- D 0 - - - 0x00022A 00:821A: 19        .byte $19   ; 03 
- D 0 - - - 0x00022B 00:821B: 23        .byte $23   ; 04 
- D 0 - - - 0x00022C 00:821C: 24        .byte $24   ; 05 



tbl_821D:
- D 0 - - - 0x00022D 00:821D: 25        .byte $25   ; 00 
- - - - - - 0x00022E 00:821E: 26        .byte $26   ; 01 
- D 0 - - - 0x00022F 00:821F: 27        .byte $27   ; 02 
- - - - - - 0x000230 00:8220: 28        .byte $28   ; 03 
- D 0 - - - 0x000231 00:8221: 29        .byte $29   ; 04 
- D 0 - - - 0x000232 00:8222: 2A        .byte $2A   ; 05 
- D 0 - - - 0x000233 00:8223: 2B        .byte $2B   ; 06 



sub_8224:
C - - - - - 0x000234 00:8224: A0 00     LDY #$00
C - - - - - 0x000236 00:8226: BD 66 05  LDA ram_attr_spr_plr,X
C - - - - - 0x000239 00:8229: 0A        ASL
C - - - - - 0x00023A 00:822A: 10 01     BPL bra_822D
C - - - - - 0x00023C 00:822C: C8        INY ; 01
bra_822D:
C - - - - - 0x00023D 00:822D: 84 00     STY ram_0000
C - - - - - 0x00023F 00:822F: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000241 00:8231: 29 0F     AND #con_btns_Dpad
C - - - - - 0x000243 00:8233: C9 0B     CMP #$0B
C - - - - - 0x000245 00:8235: 90 02     BCC bra_8239
; if both up and down were pressed
; bzk optimize, normally that's not possible. or is it?
- - - - - - 0x000247 00:8237: A9 00     LDA #$00
bra_8239:
C - - - - - 0x000249 00:8239: A8        TAY
C - - - - - 0x00024A 00:823A: C0 04     CPY #$04
C - - - - - 0x00024C 00:823C: D0 10     BNE bra_824E
C - - - - - 0x00024E 00:823E: A0 07     LDY #$07
C - - - - - 0x000250 00:8240: B5 AE     LDA ram_00AE_plr,X
C - - - - - 0x000252 00:8242: 30 0A     BMI bra_824E
C - - - - - 0x000254 00:8244: A0 03     LDY #$03
C - - - - - 0x000256 00:8246: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x000258 00:8248: C9 06     CMP #$06
C - - - - - 0x00025A 00:824A: B0 02     BCS bra_824E
C - - - - - 0x00025C 00:824C: A0 04     LDY #$04
bra_824E:
C - - - - - 0x00025E 00:824E: 98        TYA
C - - - - - 0x00025F 00:824F: 0A        ASL
C - - - - - 0x000260 00:8250: 65 00     ADC ram_0000
C - - - - - 0x000262 00:8252: A8        TAY
C - - - - - 0x000263 00:8253: B9 59 82  LDA tbl_8259,Y
C - - - - - 0x000266 00:8256: 95 BA     STA ram_plr_shoot_angle,X
C - - - - - 0x000268 00:8258: 60        RTS



tbl_8259:
- D 0 - - - 0x000269 00:8259: 02        .byte $02, $0A   ; 00 
- D 0 - - - 0x00026B 00:825B: 02        .byte $02, $0A   ; 01 
- - - - - - 0x00026D 00:825D: 02        .byte $02, $0A   ; 02 
- D 0 - - - 0x00026F 00:825F: 04        .byte $04, $08   ; 03 
- D 0 - - - 0x000271 00:8261: 05        .byte $05, $07   ; 04 
- D 0 - - - 0x000273 00:8263: 03        .byte $03, $09   ; 05 
- - - - - - 0x000275 00:8265: 03        .byte $03, $09   ; 06 
- D 0 - - - 0x000277 00:8267: 06        .byte $06, $06   ; 07 
- D 0 - - - 0x000279 00:8269: 00        .byte $00, $0C   ; 08 
- D 0 - - - 0x00027B 00:826B: 01        .byte $01, $0B   ; 09 
- - - - - - 0x00027D 00:826D: 01        .byte $01, $0B   ; 0A 



sub_826F:
C - - - - - 0x00027F 00:826F: A9 00     LDA #$00
C - - - - - 0x000281 00:8271: 85 15     STA ram_0015
C - - - - - 0x000283 00:8273: 20 A3 82  JSR sub_82A3
C - - - - - 0x000286 00:8276: 90 29     BCC bra_82A1
C - - - - - 0x000288 00:8278: A5 FD     LDA ram_scroll_X
C - - - - - 0x00028A 00:827A: 29 0F     AND #$0F
C - - - - - 0x00028C 00:827C: 85 00     STA ram_0000
C - - - - - 0x00028E 00:827E: A9 28     LDA #$28
C - - - - - 0x000290 00:8280: 38        SEC
C - - - - - 0x000291 00:8281: E5 00     SBC ram_0000
C - - - - - 0x000293 00:8283: 9D 4C 05  STA ram_pos_X_hi_plr,X
bra_8286_loop:
C - - - - - 0x000296 00:8286: 20 A3 82  JSR sub_82A3
C - - - - - 0x000299 00:8289: 90 16     BCC bra_82A1
C - - - - - 0x00029B 00:828B: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x00029E 00:828E: 18        CLC
C - - - - - 0x00029F 00:828F: 69 10     ADC #$10
C - - - - - 0x0002A1 00:8291: 9D 4C 05  STA ram_pos_X_hi_plr,X
C - - - - - 0x0002A4 00:8294: C9 E0     CMP #$E0
C - - - - - 0x0002A6 00:8296: 90 EE     BCC bra_8286_loop
C - - - - - 0x0002A8 00:8298: A5 15     LDA ram_0015
C - - - - - 0x0002AA 00:829A: 9D 4C 05  STA ram_pos_X_hi_plr,X
C - - - - - 0x0002AD 00:829D: D0 02     BNE bra_82A1
C - - - - - 0x0002AF 00:829F: 18        CLC
C - - - - - 0x0002B0 00:82A0: 60        RTS
bra_82A1:
C - - - - - 0x0002B1 00:82A1: 38        SEC
C - - - - - 0x0002B2 00:82A2: 60        RTS



sub_82A3:
C - - - - - 0x0002B3 00:82A3: BC 32 05  LDY ram_pos_Y_hi_plr,X
C - - - - - 0x0002B6 00:82A6: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x0002B9 00:82A9: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x0002BC 00:82AC: A8        TAY
C - - - - - 0x0002BD 00:82AD: B9 CC F8  LDA tbl_0x01F8DC,Y
C - - - - - 0x0002C0 00:82B0: D0 5F     BNE bra_8311
C - - - - - 0x0002C2 00:82B2: A5 15     LDA ram_0015
C - - - - - 0x0002C4 00:82B4: D0 05     BNE bra_82BB
C - - - - - 0x0002C6 00:82B6: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x0002C9 00:82B9: 85 15     STA ram_0015
bra_82BB:
C - - - - - 0x0002CB 00:82BB: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x0002CE 00:82BE: 18        CLC
C - - - - - 0x0002CF 00:82BF: 69 20     ADC #$20
C - - - - - 0x0002D1 00:82C1: 85 16     STA ram_0016
bra_82C3_loop:
C - - - - - 0x0002D3 00:82C3: A4 16     LDY ram_0016
C - - - - - 0x0002D5 00:82C5: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x0002D8 00:82C8: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x0002DB 00:82CB: D0 0C     BNE bra_82D9
C - - - - - 0x0002DD 00:82CD: A5 16     LDA ram_0016
C - - - - - 0x0002DF 00:82CF: 18        CLC
C - - - - - 0x0002E0 00:82D0: 69 10     ADC #$10
C - - - - - 0x0002E2 00:82D2: 85 16     STA ram_0016
C - - - - - 0x0002E4 00:82D4: C9 E0     CMP #$E0
C - - - - - 0x0002E6 00:82D6: 90 EB     BCC bra_82C3_loop
C - - - - - 0x0002E8 00:82D8: 60        RTS
bra_82D9:
C - - - - - 0x0002E9 00:82D9: 18        CLC
C - - - - - 0x0002EA 00:82DA: 60        RTS



sub_82DB:
C - - - - - 0x0002EB 00:82DB: A8        TAY
C - - - - - 0x0002EC 00:82DC: 4A        LSR
C - - - - - 0x0002ED 00:82DD: 4A        LSR
C - - - - - 0x0002EE 00:82DE: 4A        LSR
C - - - - - 0x0002EF 00:82DF: 4A        LSR
C - - - - - 0x0002F0 00:82E0: 85 16     STA ram_0016
C - - - - - 0x0002F2 00:82E2: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x0002F5 00:82E5: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x0002F8 00:82E8: D0 25     BNE bra_830F
C - - - - - 0x0002FA 00:82EA: A4 04     LDY ram_0004
bra_82EC_loop:
C - - - - - 0x0002FC 00:82EC: E6 16     INC ram_0016
C - - - - - 0x0002FE 00:82EE: A5 16     LDA ram_0016
C - - - - - 0x000300 00:82F0: C9 0E     CMP #$0E
C - - - - - 0x000302 00:82F2: B0 1C     BCS bra_8310_RTS
C - - - - - 0x000304 00:82F4: 98        TYA
C - - - - - 0x000305 00:82F5: 29 80     AND #$80
C - - - - - 0x000307 00:82F7: 85 17     STA ram_0017
C - - - - - 0x000309 00:82F9: 98        TYA
C - - - - - 0x00030A 00:82FA: 29 7F     AND #$7F
C - - - - - 0x00030C 00:82FC: 18        CLC
C - - - - - 0x00030D 00:82FD: 69 08     ADC #$08
C - - - - - 0x00030F 00:82FF: C9 78     CMP #$78
C - - - - - 0x000311 00:8301: 90 02     BCC bra_8305
- - - - - - 0x000313 00:8303: 69 07     ADC #$07
bra_8305:
C - - - - - 0x000315 00:8305: 29 7F     AND #$7F
C - - - - - 0x000317 00:8307: 05 17     ORA ram_0017
C - - - - - 0x000319 00:8309: A8        TAY
C - - - - - 0x00031A 00:830A: 20 1B BB  JSR sub_0x007B2B
C - - - - - 0x00031D 00:830D: F0 DD     BEQ bra_82EC_loop
bra_830F:
C - - - - - 0x00031F 00:830F: 18        CLC
bra_8310_RTS:
C - - - - - 0x000320 00:8310: 60        RTS
bra_8311:
C - - - - - 0x000321 00:8311: 38        SEC
C - - - - - 0x000322 00:8312: 60        RTS



loc_8313:
C D 0 - - - 0x000323 00:8313: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x000325 00:8315: 29 0F     AND #$0F
C - - - - - 0x000327 00:8317: D0 1B     BNE bra_8334_RTS
C - - - - - 0x000329 00:8319: A5 5C     LDA ram_005C
C - - - - - 0x00032B 00:831B: D0 17     BNE bra_8334_RTS
C - - - - - 0x00032D 00:831D: BC 32 05  LDY ram_pos_Y_hi_plr,X
C - - - - - 0x000330 00:8320: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x000333 00:8323: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x000336 00:8326: A8        TAY
C - - - - - 0x000337 00:8327: F0 0B     BEQ bra_8334_RTS
C - - - - - 0x000339 00:8329: A5 5D     LDA ram_005D
C - - - - - 0x00033B 00:832B: D0 04     BNE bra_8331
C - - - - - 0x00033D 00:832D: C0 02     CPY #$02
C - - - - - 0x00033F 00:832F: D0 03     BNE bra_8334_RTS
bra_8331:
C - - - - - 0x000341 00:8331: 4C AD F6  JMP loc_0x01F6BD
bra_8334_RTS:
C - - - - - 0x000344 00:8334: 60        RTS



loc_8335:
C D 0 - - - 0x000345 00:8335: 20 57 83  JSR sub_8357
C - - - - - 0x000348 00:8338: F0 1C     BEQ bra_8356_RTS
C - - - - - 0x00034A 00:833A: A9 18     LDA #$18
C - - - - - 0x00034C 00:833C: 9D 4C 05  STA ram_pos_X_hi_plr,X
bra_833F_loop:
C - - - - - 0x00034F 00:833F: 20 57 83  JSR sub_8357
C - - - - - 0x000352 00:8342: F0 CD     BEQ bra_8311
C - - - - - 0x000354 00:8344: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x000357 00:8347: 18        CLC
C - - - - - 0x000358 00:8348: 69 10     ADC #$10
C - - - - - 0x00035A 00:834A: 9D 4C 05  STA ram_pos_X_hi_plr,X
C - - - - - 0x00035D 00:834D: C9 F0     CMP #$F0
C - - - - - 0x00035F 00:834F: 90 EE     BCC bra_833F_loop
- - - - - - 0x000361 00:8351: A9 38     LDA #$38
- - - - - - 0x000363 00:8353: 9D 4C 05  STA ram_pos_X_hi_plr,X
bra_8356_RTS:
C - - - - - 0x000366 00:8356: 60        RTS



sub_8357:
C - - - - - 0x000367 00:8357: BC 32 05  LDY ram_pos_Y_hi_plr,X
C - - - - - 0x00036A 00:835A: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x00036D 00:835D: 4C C0 BA  JMP loc_0x007AD0



sub_8360:
C - - - - - 0x000370 00:8360: A5 84     LDA ram_0084
C - - - - - 0x000372 00:8362: F0 18     BEQ bra_837C
C - - - - - 0x000374 00:8364: A0 00     LDY #$00
C - - - - - 0x000376 00:8366: A2 01     LDX #$01
bra_8368_loop:
C - - - - - 0x000378 00:8368: B5 CA     LDA ram_plr_game_over,X
C - - - - - 0x00037A 00:836A: D0 08     BNE bra_8374
C - - - - - 0x00037C 00:836C: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x00037F 00:836F: C9 60     CMP #$60
C - - - - - 0x000381 00:8371: B0 01     BCS bra_8374
C - - - - - 0x000383 00:8373: C8        INY
bra_8374:
C - - - - - 0x000384 00:8374: CA        DEX
C - - - - - 0x000385 00:8375: 10 F1     BPL bra_8368_loop
C - - - - - 0x000387 00:8377: 98        TYA
C - - - - - 0x000388 00:8378: D0 15     BNE bra_838F
C - - - - - 0x00038A 00:837A: F0 38     BEQ bra_83B4    ; jmp
bra_837C:
C - - - - - 0x00038C 00:837C: A5 98     LDA ram_0098
C - - - - - 0x00038E 00:837E: F0 33     BEQ bra_83B3_RTS
C - - - - - 0x000390 00:8380: A5 98     LDA ram_0098
C - - - - - 0x000392 00:8382: 29 FE     AND #$FE
C - - - - - 0x000394 00:8384: 85 00     STA ram_0000
C - - - - - 0x000396 00:8386: C5 FC     CMP ram_scroll_Y
C - - - - - 0x000398 00:8388: F0 2A     BEQ bra_83B4
C - - - - - 0x00039A 00:838A: A5 98     LDA ram_0098
C - - - - - 0x00039C 00:838C: 4A        LSR
C - - - - - 0x00039D 00:838D: B0 12     BCS bra_83A1
bra_838F:
C - - - - - 0x00039F 00:838F: A5 9C     LDA ram_009C
C - - - - - 0x0003A1 00:8391: 30 0A     BMI bra_839D
C - - - - - 0x0003A3 00:8393: C5 82     CMP ram_0082
C - - - - - 0x0003A5 00:8395: D0 06     BNE bra_839D
C - - - - - 0x0003A7 00:8397: A5 00     LDA ram_0000
C - - - - - 0x0003A9 00:8399: C5 FC     CMP ram_scroll_Y
C - - - - - 0x0003AB 00:839B: B0 17     BCS bra_83B4
bra_839D:
C - - - - - 0x0003AD 00:839D: A9 FF     LDA #$FF
C - - - - - 0x0003AF 00:839F: D0 10     BNE bra_83B1    ; jmp
bra_83A1:
C - - - - - 0x0003B1 00:83A1: A5 9C     LDA ram_009C
C - - - - - 0x0003B3 00:83A3: 30 0A     BMI bra_83AF
C - - - - - 0x0003B5 00:83A5: C5 82     CMP ram_0082
C - - - - - 0x0003B7 00:83A7: D0 06     BNE bra_83AF
C - - - - - 0x0003B9 00:83A9: A5 00     LDA ram_0000
C - - - - - 0x0003BB 00:83AB: C5 FC     CMP ram_scroll_Y
C - - - - - 0x0003BD 00:83AD: 90 05     BCC bra_83B4
bra_83AF:
C - - - - - 0x0003BF 00:83AF: A9 01     LDA #$01
bra_83B1:
C - - - - - 0x0003C1 00:83B1: 85 72     STA ram_cam_spd_Y
bra_83B3_RTS:
C - - - - - 0x0003C3 00:83B3: 60        RTS
bra_83B4:
C - - - - - 0x0003C4 00:83B4: A0 00     LDY #$00
C - - - - - 0x0003C6 00:83B6: 84 98     STY ram_0098
C - - - - - 0x0003C8 00:83B8: 84 84     STY ram_0084
C - - - - - 0x0003CA 00:83BA: 88        DEY
C - - - - - 0x0003CB 00:83BB: 84 9C     STY ram_009C
C - - - - - 0x0003CD 00:83BD: 60        RTS



sub_83BE:
C - - - - - 0x0003CE 00:83BE: A6 6F     LDX ram_006F
C - - - - - 0x0003D0 00:83C0: F0 2F     BEQ bra_83F1_RTS
C - - - - - 0x0003D2 00:83C2: CA        DEX
C - - - - - 0x0003D3 00:83C3: F0 1E     BEQ bra_83E3
C - - - - - 0x0003D5 00:83C5: CA        DEX
C - - - - - 0x0003D6 00:83C6: D0 29     BNE bra_83F1_RTS
C - - - - - 0x0003D8 00:83C8: A5 61     LDA ram_0061
C - - - - - 0x0003DA 00:83CA: D0 1B     BNE bra_83E7
C - - - - - 0x0003DC 00:83CC: A8        TAY
C - - - - - 0x0003DD 00:83CD: A2 01     LDX #$01
bra_83CF_loop:
C - - - - - 0x0003DF 00:83CF: B5 CA     LDA ram_plr_game_over,X
C - - - - - 0x0003E1 00:83D1: D0 08     BNE bra_83DB
C - - - - - 0x0003E3 00:83D3: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x0003E6 00:83D6: C9 A0     CMP #$A0
C - - - - - 0x0003E8 00:83D8: 90 01     BCC bra_83DB
C - - - - - 0x0003EA 00:83DA: C8        INY
bra_83DB:
C - - - - - 0x0003EB 00:83DB: CA        DEX
C - - - - - 0x0003EC 00:83DC: 10 F1     BPL bra_83CF_loop
C - - - - - 0x0003EE 00:83DE: 98        TYA
C - - - - - 0x0003EF 00:83DF: D0 0C     BNE bra_83ED
C - - - - - 0x0003F1 00:83E1: F0 04     BEQ bra_83E7    ; jmp
bra_83E3:
C - - - - - 0x0003F3 00:83E3: A5 FD     LDA ram_scroll_X
C - - - - - 0x0003F5 00:83E5: D0 06     BNE bra_83ED
bra_83E7:
C - - - - - 0x0003F7 00:83E7: A9 00     LDA #$00
C - - - - - 0x0003F9 00:83E9: 85 6F     STA ram_006F
C - - - - - 0x0003FB 00:83EB: F0 04     BEQ bra_83F1_RTS    ; jmp
bra_83ED:
C - - - - - 0x0003FD 00:83ED: A9 01     LDA #$01
C - - - - - 0x0003FF 00:83EF: 85 62     STA ram_cam_spd_X
bra_83F1_RTS:
C - - - - - 0x000401 00:83F1: 60        RTS



sub_83F2:
C - - - - - 0x000402 00:83F2: A5 7E     LDA ram_007E
C - - - - - 0x000404 00:83F4: F0 60     BEQ bra_8456_RTS
C - - - - - 0x000406 00:83F6: 29 C0     AND #$C0
C - - - - - 0x000408 00:83F8: 85 00     STA ram_0000
C - - - - - 0x00040A 00:83FA: 45 71     EOR ram_0071_flag
C - - - - - 0x00040C 00:83FC: 25 00     AND ram_0000
C - - - - - 0x00040E 00:83FE: F0 56     BEQ bra_8456_RTS
C - - - - - 0x000410 00:8400: A5 81     LDA ram_0081
C - - - - - 0x000412 00:8402: 18        CLC
C - - - - - 0x000413 00:8403: 65 7F     ADC ram_007F
C - - - - - 0x000415 00:8405: 85 81     STA ram_0081
C - - - - - 0x000417 00:8407: A9 00     LDA #$00
C - - - - - 0x000419 00:8409: 65 80     ADC ram_0080
C - - - - - 0x00041B 00:840B: 85 72     STA ram_cam_spd_Y
C - - - - - 0x00041D 00:840D: A5 7E     LDA ram_007E
C - - - - - 0x00041F 00:840F: 4A        LSR
C - - - - - 0x000420 00:8410: 90 44     BCC bra_8456_RTS
; C = 1
- - - - - - 0x000422 00:8412: A5 CA     LDA ram_plr_game_over
- - - - - - 0x000424 00:8414: D0 04     BNE bra_841A
- - - - - - 0x000426 00:8416: A5 AE     LDA ram_00AE_plr
- - - - - - 0x000428 00:8418: F0 08     BEQ bra_8422
bra_841A:
- - - - - - 0x00042A 00:841A: A5 CB     LDA ram_plr_game_over + $01
- - - - - - 0x00042C 00:841C: D0 1D     BNE bra_843B
- - - - - - 0x00042E 00:841E: A5 AF     LDA ram_00AE_plr + $01
- - - - - - 0x000430 00:8420: D0 19     BNE bra_843B
bra_8422:
- - - - - - 0x000432 00:8422: A5 7F     LDA ram_007F
- - - - - - 0x000434 00:8424: E9 09     SBC #< $0009
- - - - - - 0x000436 00:8426: 85 7F     STA ram_007F
- - - - - - 0x000438 00:8428: A5 80     LDA ram_0080
- - - - - - 0x00043A 00:842A: E9 00     SBC #> $0009
- - - - - - 0x00043C 00:842C: 85 80     STA ram_0080
- - - - - - 0x00043E 00:842E: C9 FD     CMP #$FD
- - - - - - 0x000440 00:8430: B0 24     BCS bra_8456_RTS
- - - - - - 0x000442 00:8432: A9 FD     LDA #$FD
- - - - - - 0x000444 00:8434: 85 80     STA ram_0080
- - - - - - 0x000446 00:8436: A9 00     LDA #$00
- - - - - - 0x000448 00:8438: 85 7F     STA ram_007F
- - - - - - 0x00044A 00:843A: 60        RTS
bra_843B:
- - - - - - 0x00044B 00:843B: A5 7F     LDA ram_007F
- - - - - - 0x00044D 00:843D: 05 80     ORA ram_0080
- - - - - - 0x00044F 00:843F: F0 15     BEQ bra_8456_RTS
- - - - - - 0x000451 00:8441: A5 7F     LDA ram_007F
- - - - - - 0x000453 00:8443: 18        CLC
- - - - - - 0x000454 00:8444: 69 08     ADC #< $0008
- - - - - - 0x000456 00:8446: 85 7F     STA ram_007F
- - - - - - 0x000458 00:8448: A5 80     LDA ram_0080
- - - - - - 0x00045A 00:844A: 69 00     ADC #> $0008
- - - - - - 0x00045C 00:844C: 85 80     STA ram_0080
- - - - - - 0x00045E 00:844E: 30 06     BMI bra_8456_RTS
- - - - - - 0x000460 00:8450: A9 00     LDA #$00
- - - - - - 0x000462 00:8452: 85 7F     STA ram_007F
- - - - - - 0x000464 00:8454: 85 80     STA ram_0080
bra_8456_RTS:
C - - - - - 0x000466 00:8456: 60        RTS



sub_8457_borrow_lives:
C - - - - - 0x000467 00:8457: A5 20     LDA ram_колво_игроков
C - - - - - 0x000469 00:8459: F0 FB     BEQ bra_8456_RTS    ; if 1 player
; if 2 players
C - - - - - 0x00046B 00:845B: A2 01     LDX #$01
bra_845D_loop:
C - - - - - 0x00046D 00:845D: B5 CA     LDA ram_plr_game_over,X
C - - - - - 0x00046F 00:845F: D0 05     BNE bra_8466_player_dead
C - - - - - 0x000471 00:8461: CA        DEX
C - - - - - 0x000472 00:8462: 10 F9     BPL bra_845D_loop
C - - - - - 0x000474 00:8464: 30 F0     BMI bra_8456_RTS    ; jmp
bra_8466_player_dead:
C - - - - - 0x000476 00:8466: 8A        TXA
C - - - - - 0x000477 00:8467: 49 01     EOR #$01
C - - - - - 0x000479 00:8469: A8        TAY
C - - - - - 0x00047A 00:846A: B9 53 00  LDA ram_lives,Y
C - - - - - 0x00047D 00:846D: C9 02     CMP #$02
C - - - - - 0x00047F 00:846F: B0 07     BCS bra_8478_enough_lives
C - - - - - 0x000481 00:8471: B9 A0 00  LDA ram_00A0,Y
C - - - - - 0x000484 00:8474: C9 02     CMP #$02
C - - - - - 0x000486 00:8476: D0 DE     BNE bra_8456_RTS
bra_8478_enough_lives:
C - - - - - 0x000488 00:8478: B5 F1     LDA ram_btn_press,X
C - - - - - 0x00048A 00:847A: 29 80     AND #con_btn_A
C - - - - - 0x00048C 00:847C: F0 D8     BEQ bra_8456_RTS
C - - - - - 0x00048E 00:847E: 8A        TXA
C - - - - - 0x00048F 00:847F: 49 01     EOR #$01
C - - - - - 0x000491 00:8481: A8        TAY
C - - - - - 0x000492 00:8482: B9 53 00  LDA ram_lives,Y
C - - - - - 0x000495 00:8485: F0 CF     BEQ bra_8456_RTS
C - - - - - 0x000497 00:8487: C9 01     CMP #$01
C - - - - - 0x000499 00:8489: D0 07     BNE bra_8492
- - - - - - 0x00049B 00:848B: B9 A0 00  LDA ram_00A0,Y
- - - - - - 0x00049E 00:848E: C9 02     CMP #$02
- - - - - - 0x0004A0 00:8490: D0 C4     BNE bra_8456_RTS
bra_8492:
C - - - - - 0x0004A2 00:8492: B9 53 00  LDA ram_lives,Y
C - - - - - 0x0004A5 00:8495: 38        SEC
C - - - - - 0x0004A6 00:8496: E9 01     SBC #$01
C - - - - - 0x0004A8 00:8498: C9 FF     CMP #$FF
C - - - - - 0x0004AA 00:849A: D0 02     BNE bra_849E
- - - - - - 0x0004AC 00:849C: A9 00     LDA #$00
bra_849E:
C - - - - - 0x0004AE 00:849E: 99 53 00  STA ram_lives,Y
C - - - - - 0x0004B1 00:84A1: A9 01     LDA #$01
C - - - - - 0x0004B3 00:84A3: 95 53     STA ram_lives,X
C - - - - - 0x0004B5 00:84A5: 4C 60 86  JMP loc_8660



sub_84A8:
C - - - - - 0x0004B8 00:84A8: A4 11     LDY ram_0011
C - - - - - 0x0004BA 00:84AA: B9 CA 00  LDA ram_plr_game_over,Y
C - - - - - 0x0004BD 00:84AD: D0 06     BNE bra_84B5
C - - - - - 0x0004BF 00:84AF: B9 A0 00  LDA ram_00A0,Y
C - - - - - 0x0004C2 00:84B2: C9 02     CMP #$02
C - - - - - 0x0004C4 00:84B4: 60        RTS
bra_84B5:
C - - - - - 0x0004C5 00:84B5: 18        CLC
C - - - - - 0x0004C6 00:84B6: 60        RTS



sub_84B7:
C - - - - - 0x0004C7 00:84B7: B5 C4     LDA ram_plr_invinc,X
C - - - - - 0x0004C9 00:84B9: F0 02     BEQ bra_84BD
C - - - - - 0x0004CB 00:84BB: D6 C4     DEC ram_plr_invinc,X
bra_84BD:
C - - - - - 0x0004CD 00:84BD: B5 D4     LDA ram_plr_barrier_timer,X
C - - - - - 0x0004CF 00:84BF: F0 08     BEQ bra_84C9_RTS
C - - - - - 0x0004D1 00:84C1: A5 5B     LDA ram_005B
C - - - - - 0x0004D3 00:84C3: 29 03     AND #$03
C - - - - - 0x0004D5 00:84C5: D0 02     BNE bra_84C9_RTS
C - - - - - 0x0004D7 00:84C7: D6 D4     DEC ram_plr_barrier_timer,X
bra_84C9_RTS:
C - - - - - 0x0004D9 00:84C9: 60        RTS


; bzk garbage
- - - - - - 0x0004DA 00:84CA: A9 00     LDA #$00    ; con_weapon_default
- - - - - - 0x0004DC 00:84CC: 95 B8     STA ram_weapon,X
- - - - - - 0x0004DE 00:84CE: 9D 32 05  STA ram_pos_Y_hi_plr,X
- - - - - - 0x0004E1 00:84D1: 9D 4C 05  STA ram_pos_X_hi_plr,X
- - - - - - 0x0004E4 00:84D4: 95 C4     STA ram_plr_invinc,X



sub_84D6:
C - - - - - 0x0004E6 00:84D6: A9 00     LDA #$00
C - - - - - 0x0004E8 00:84D8: 9D 18 05  STA ram_anim_id_plr,X
C - - - - - 0x0004EB 00:84DB: 9D 66 05  STA ram_attr_spr_plr,X
C - - - - - 0x0004EE 00:84DE: 95 A2     STA ram_00A2,X
C - - - - - 0x0004F0 00:84E0: 95 A4     STA ram_00A4,X
C - - - - - 0x0004F2 00:84E2: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x0004F4 00:84E4: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x0004F6 00:84E6: 95 AA     STA ram_spd_X_lo_plr,X
C - - - - - 0x0004F8 00:84E8: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x0004FA 00:84EA: 95 AE     STA ram_00AE_plr,X
C - - - - - 0x0004FC 00:84EC: 95 B0     STA ram_00B0,X
C - - - - - 0x0004FE 00:84EE: 95 B2     STA ram_plr_surface,X
C - - - - - 0x000500 00:84F0: 95 B4     STA ram_00B4,X
C - - - - - 0x000502 00:84F2: 95 B6     STA ram_00B6,X
C - - - - - 0x000504 00:84F4: 95 BA     STA ram_plr_shoot_angle,X
C - - - - - 0x000506 00:84F6: 95 BC     STA ram_00BC,X
C - - - - - 0x000508 00:84F8: 95 BE     STA ram_00BE,X
C - - - - - 0x00050A 00:84FA: 95 C0     STA ram_00C0,X
C - - - - - 0x00050C 00:84FC: 95 C2     STA ram_00C2,X
C - - - - - 0x00050E 00:84FE: 95 C6     STA ram_00C6,X
C - - - - - 0x000510 00:8500: 95 C8     STA ram_00C8,X
C - - - - - 0x000512 00:8502: 95 CA     STA ram_plr_game_over,X
C - - - - - 0x000514 00:8504: 95 CC     STA ram_00CC,X
C - - - - - 0x000516 00:8506: 95 CE     STA ram_00CE,X
C - - - - - 0x000518 00:8508: 95 D2     STA ram_00D2,X
C - - - - - 0x00051A 00:850A: 95 D0     STA ram_00D0,X
C - - - - - 0x00051C 00:850C: 95 D4     STA ram_plr_barrier_timer,X
C - - - - - 0x00051E 00:850E: 95 D6     STA ram_00D6,X
C - - - - - 0x000520 00:8510: 95 D8     STA ram_00D8,X
C - - - - - 0x000522 00:8512: 60        RTS



sub_8513:
C - - - - - 0x000523 00:8513: A9 00     LDA #$00
C - - - - - 0x000525 00:8515: F0 02     BEQ bra_8519    ; jmp



sub_8517:
C - - - - - 0x000527 00:8517: A9 01     LDA #$01
bra_8519:
C - - - - - 0x000529 00:8519: 95 D8     STA ram_00D8,X
C - - - - - 0x00052B 00:851B: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x00052E 00:851E: 95 CC     STA ram_00CC,X
C - - - - - 0x000530 00:8520: A5 5D     LDA ram_005D
C - - - - - 0x000532 00:8522: F0 03     BEQ bra_8527
C - - - - - 0x000534 00:8524: 4C 24 8A  JMP loc_8A24
bra_8527:
C - - - - - 0x000537 00:8527: B5 A0     LDA ram_00A0,X
C - - - - - 0x000539 00:8529: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x00053C 00:852C: 3E 85     .word ofs_000_853E_00
- D 0 - I - 0x00053E 00:852E: 5B 85     .word ofs_000_855B_01
- D 0 - I - 0x000540 00:8530: 99 85     .word ofs_000_8599_02
- D 0 - I - 0x000542 00:8532: A9 85     .word ofs_000_85A9_03
- D 0 - I - 0x000544 00:8534: C6 85     .word ofs_000_85C6_04
- D 0 - I - 0x000546 00:8536: 46 86     .word ofs_000_8646_05
- D 0 - I - 0x000548 00:8538: 71 86     .word ofs_000_8671_06
- D 0 - I - 0x00054A 00:853A: 82 86     .word ofs_000_8682_07
- D 0 - I - 0x00054C 00:853C: 4E 85     .word ofs_000_854E_08



ofs_000_853E_00:
ofs_003_853E_00:
C - - J - - 0x00054E 00:853E: A9 01     LDA #$01
C - - - - - 0x000550 00:8540: 95 CA     STA ram_plr_game_over,X
C - - - - - 0x000552 00:8542: 95 C2     STA ram_00C2,X
C - - - - - 0x000554 00:8544: A9 FF     LDA #$FF
C - - - - - 0x000556 00:8546: 24 71     BIT ram_0071_flag
C - - - - - 0x000558 00:8548: 10 02     BPL bra_854C
C - - - - - 0x00055A 00:854A: A9 00     LDA #$00
bra_854C:
C - - - - - 0x00055C 00:854C: 95 CE     STA ram_00CE,X
ofs_000_854E_08:
ofs_003_854E_08:
C - - J - - 0x00055E 00:854E: A9 F0     LDA #$F0
C - - - - - 0x000560 00:8550: 9D 32 05  STA ram_pos_Y_hi_plr,X
C - - - - - 0x000563 00:8553: A9 00     LDA #$00
C - - - - - 0x000565 00:8555: 9D 18 05  STA ram_anim_id_plr,X
C - - - - - 0x000568 00:8558: 95 CC     STA ram_00CC,X
C - - - - - 0x00056A 00:855A: 60        RTS



ofs_000_855B_01:
C - - J - - 0x00056B 00:855B: 20 D6 84  JSR sub_84D6
C - - - - - 0x00056E 00:855E: A9 60     LDA #$60
C - - - - - 0x000570 00:8560: 9D 32 05  STA ram_pos_Y_hi_plr,X
C - - - - - 0x000573 00:8563: A5 50     LDA ram_area
C - - - - - 0x000575 00:8565: 0A        ASL
C - - - - - 0x000576 00:8566: 85 00     STA ram_0000
C - - - - - 0x000578 00:8568: 8A        TXA
C - - - - - 0x000579 00:8569: 18        CLC
C - - - - - 0x00057A 00:856A: 65 00     ADC ram_0000
C - - - - - 0x00057C 00:856C: A8        TAY
C - - - - - 0x00057D 00:856D: A5 FD     LDA ram_scroll_X
C - - - - - 0x00057F 00:856F: 29 0F     AND #$0F
C - - - - - 0x000581 00:8571: 85 00     STA ram_0000
C - - - - - 0x000583 00:8573: B9 89 85  LDA tbl_8589,Y
C - - - - - 0x000586 00:8576: 38        SEC
C - - - - - 0x000587 00:8577: E5 00     SBC ram_0000
C - - - - - 0x000589 00:8579: 9D 4C 05  STA ram_pos_X_hi_plr,X
C - - - - - 0x00058C 00:857C: 20 6F 82  JSR sub_826F
C - - - - - 0x00058F 00:857F: 90 07     BCC bra_8588_RTS
sub_8581:
C - - - - - 0x000591 00:8581: 20 D6 84  JSR sub_84D6
C - - - - - 0x000594 00:8584: D6 53     DEC ram_lives,X
loc_8586:
C D 0 - - - 0x000596 00:8586: F6 A0     INC ram_00A0,X
bra_8588_RTS:
C - - - - - 0x000598 00:8588: 60        RTS



tbl_8589:
- D 0 - - - 0x000599 00:8589: 48        .byte $48   ; 00 
- D 0 - - - 0x00059A 00:858A: 30        .byte $30   ; 01 
- - - - - - 0x00059B 00:858B: 48        .byte $48   ; 02 
- - - - - - 0x00059C 00:858C: 30        .byte $30   ; 03 
- D 0 - - - 0x00059D 00:858D: 48        .byte $48   ; 04 
- D 0 - - - 0x00059E 00:858E: 30        .byte $30   ; 05 
- D 0 - - - 0x00059F 00:858F: 48        .byte $48   ; 06 
- D 0 - - - 0x0005A0 00:8590: 30        .byte $30   ; 07 
- D 0 - - - 0x0005A1 00:8591: 3C        .byte $3C   ; 08 
- D 0 - - - 0x0005A2 00:8592: 24        .byte $24   ; 09 
- - - - - - 0x0005A3 00:8593: 48        .byte $48   ; 0A 
- - - - - - 0x0005A4 00:8594: 30        .byte $30   ; 0B 
- D 0 - - - 0x0005A5 00:8595: 48        .byte $48   ; 0C 
- D 0 - - - 0x0005A6 00:8596: 30        .byte $30   ; 0D 
- D 0 - - - 0x0005A7 00:8597: 48        .byte $48   ; 0E 
- D 0 - - - 0x0005A8 00:8598: 30        .byte $30   ; 0F 



ofs_000_8599_02:
C - - J - - 0x0005A9 00:8599: 20 EE 8C  JSR sub_8CEE
C - - - - - 0x0005AC 00:859C: 20 C9 86  JSR sub_86C9
C - - - - - 0x0005AF 00:859F: 20 B5 80  JSR sub_80B5
C - - - - - 0x0005B2 00:85A2: 20 24 82  JSR sub_8224
C - - - - - 0x0005B5 00:85A5: 4C 13 83  JMP loc_8313


; bzk garbage
- - - - - - 0x0005B8 00:85A8: 60        RTS



ofs_000_85A9_03:
C - - J - - 0x0005B9 00:85A9: A9 80     LDA #$80
C - - - - - 0x0005BB 00:85AB: 95 AE     STA ram_00AE_plr,X
C - - - - - 0x0005BD 00:85AD: A9 C0     LDA #$C0
C - - - - - 0x0005BF 00:85AF: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x0005C1 00:85B1: A9 FD     LDA #$FD
C - - - - - 0x0005C3 00:85B3: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x0005C5 00:85B5: A9 00     LDA #$00
C - - - - - 0x0005C7 00:85B7: 95 B4     STA ram_00B4,X
C - - - - - 0x0005C9 00:85B9: A9 06     LDA #$06
C - - - - - 0x0005CB 00:85BB: 95 B6     STA ram_00B6,X
C - - - - - 0x0005CD 00:85BD: 20 34 86  JSR sub_8634
C - - - - - 0x0005D0 00:85C0: 20 9B 87  JSR sub_879B
C - - - - - 0x0005D3 00:85C3: 4C 86 85  JMP loc_8586



ofs_000_85C6_04:
C - - J - - 0x0005D6 00:85C6: A0 02     LDY #$02
C - - - - - 0x0005D8 00:85C8: BD 66 05  LDA ram_attr_spr_plr,X
C - - - - - 0x0005DB 00:85CB: 0A        ASL
C - - - - - 0x0005DC 00:85CC: 10 02     BPL bra_85D0
C - - - - - 0x0005DE 00:85CE: A0 00     LDY #$00
bra_85D0:
C - - - - - 0x0005E0 00:85D0: B9 3C 86  LDA tbl_863C,Y
C - - - - - 0x0005E3 00:85D3: 95 AA     STA ram_spd_X_lo_plr,X
C - - - - - 0x0005E5 00:85D5: B9 3D 86  LDA tbl_863C + $01,Y
C - - - - - 0x0005E8 00:85D8: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x0005EA 00:85DA: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x0005ED 00:85DD: C9 F0     CMP #$F0
C - - - - - 0x0005EF 00:85DF: 90 08     BCC bra_85E9
C - - - - - 0x0005F1 00:85E1: A9 00     LDA #$00
C - - - - - 0x0005F3 00:85E3: 20 39 86  JSR sub_8639
C - - - - - 0x0005F6 00:85E6: 4C 0E 86  JMP loc_860E
bra_85E9:
C - - - - - 0x0005F9 00:85E9: B5 A6     LDA ram_spd_Y_lo_plr,X
C - - - - - 0x0005FB 00:85EB: 18        CLC
C - - - - - 0x0005FC 00:85EC: 69 20     ADC #< $0020
C - - - - - 0x0005FE 00:85EE: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000600 00:85F0: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x000602 00:85F2: 69 00     ADC #> $0020
C - - - - - 0x000604 00:85F4: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x000606 00:85F6: 30 0C     BMI bra_8604
C - - - - - 0x000608 00:85F8: C9 04     CMP #$04
C - - - - - 0x00060A 00:85FA: 90 08     BCC bra_8604
C - - - - - 0x00060C 00:85FC: A9 00     LDA #$00
C - - - - - 0x00060E 00:85FE: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000610 00:8600: A9 04     LDA #$04
C - - - - - 0x000612 00:8602: 95 A8     STA ram_spd_Y_hi_plr,X
bra_8604:
C - - - - - 0x000614 00:8604: 20 20 86  JSR sub_8620
C - - - - - 0x000617 00:8607: 20 9B 87  JSR sub_879B
C - - - - - 0x00061A 00:860A: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x00061C 00:860C: F0 11     BEQ bra_861F_RTS
loc_860E:
C D 0 - - - 0x00061E 00:860E: A9 00     LDA #$00
C - - - - - 0x000620 00:8610: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000622 00:8612: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x000624 00:8614: 95 AA     STA ram_spd_X_lo_plr,X
C - - - - - 0x000626 00:8616: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x000628 00:8618: A9 60     LDA #$60
C - - - - - 0x00062A 00:861A: 95 C0     STA ram_00C0,X
C - - - - - 0x00062C 00:861C: 4C 86 85  JMP loc_8586
bra_861F_RTS:
C - - - - - 0x00062F 00:861F: 60        RTS



sub_8620:
C - - - - - 0x000630 00:8620: D6 B6     DEC ram_00B6,X
C - - - - - 0x000632 00:8622: D0 FB     BNE bra_861F_RTS
C - - - - - 0x000634 00:8624: A9 06     LDA #$06
C - - - - - 0x000636 00:8626: 95 B6     STA ram_00B6,X
C - - - - - 0x000638 00:8628: F6 B4     INC ram_00B4,X
C - - - - - 0x00063A 00:862A: B5 B4     LDA ram_00B4,X
C - - - - - 0x00063C 00:862C: C9 05     CMP #$05
C - - - - - 0x00063E 00:862E: 90 02     BCC bra_8632
C - - - - - 0x000640 00:8630: A9 05     LDA #$05
bra_8632:
C - - - - - 0x000642 00:8632: 95 B4     STA ram_00B4,X
sub_8634:
C - - - - - 0x000644 00:8634: B4 B4     LDY ram_00B4,X
C - - - - - 0x000646 00:8636: B9 40 86  LDA tbl_8640,Y
sub_8639:   ; bzk optimize
C - - - - - 0x000649 00:8639: 4C CC 81  JMP loc_81CC



tbl_863C:
- D 0 - - - 0x00064C 00:863C: 40        .word $0140 ; 00 
- D 0 - - - 0x00064E 00:863E: C0        .word $FEC0 ; 02 



tbl_8640:
- D 0 - - - 0x000650 00:8640: 1E        .byte $1E   ; 00 
- D 0 - - - 0x000651 00:8641: 1F        .byte $1F   ; 01 
- D 0 - - - 0x000652 00:8642: 20        .byte $20   ; 02 
- D 0 - - - 0x000653 00:8643: 21        .byte $21   ; 03 
- D 0 - - - 0x000654 00:8644: 1E        .byte $1E   ; 04 
- D 0 - - - 0x000655 00:8645: 22        .byte $22   ; 05 



ofs_000_8646_05:
C - - J - - 0x000656 00:8646: 20 20 86  JSR sub_8620
loc_8649:
C D 0 - - - 0x000659 00:8649: A9 00     LDA #$00
C - - - - - 0x00065B 00:864B: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x00065D 00:864D: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x00065F 00:864F: 95 AA     STA ram_spd_X_lo_plr,X
C - - - - - 0x000661 00:8651: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x000663 00:8653: 20 9B 87  JSR sub_879B
C - - - - - 0x000666 00:8656: D6 C0     DEC ram_00C0,X
C - - - - - 0x000668 00:8658: D0 C5     BNE bra_861F_RTS
C - - - - - 0x00066A 00:865A: A9 00     LDA #$00
C - - - - - 0x00066C 00:865C: B4 53     LDY ram_lives,X
C - - - - - 0x00066E 00:865E: F0 0A     BEQ bra_866A
loc_8660:
C D 0 - - - 0x000670 00:8660: A9 00     LDA #con_weapon_default
C - - - - - 0x000672 00:8662: 95 B8     STA ram_weapon,X
C - - - - - 0x000674 00:8664: A9 80     LDA #$80
C - - - - - 0x000676 00:8666: 95 C4     STA ram_plr_invinc,X
C - - - - - 0x000678 00:8668: A9 01     LDA #$01
bra_866A:
C - - - - - 0x00067A 00:866A: 95 A0     STA ram_00A0,X
C - - - - - 0x00067C 00:866C: A9 00     LDA #$00
C - - - - - 0x00067E 00:866E: 95 C0     STA ram_00C0,X
bra_8670_RTS:
C - - - - - 0x000680 00:8670: 60        RTS



ofs_000_8671_06:
C - - J - - 0x000681 00:8671: D6 C0     DEC ram_00C0,X
C - - - - - 0x000683 00:8673: D0 FB     BNE bra_8670_RTS
C - - - - - 0x000685 00:8675: 20 81 85  JSR sub_8581
C - - - - - 0x000688 00:8678: A9 40     LDA #$40
C - - - - - 0x00068A 00:867A: 9D 66 05  STA ram_attr_spr_plr,X
C - - - - - 0x00068D 00:867D: A9 34     LDA #$34
C - - - - - 0x00068F 00:867F: 95 C0     STA ram_00C0,X
C - - - - - 0x000691 00:8681: 60        RTS



ofs_000_8682_07:
C - - J - - 0x000692 00:8682: A9 00     LDA #$00
C - - - - - 0x000694 00:8684: 95 F3     STA ram_btn_hold,X
C - - - - - 0x000696 00:8686: 20 C9 86  JSR sub_86C9
C - - - - - 0x000699 00:8689: 20 B5 80  JSR sub_80B5
C - - - - - 0x00069C 00:868C: D6 C0     DEC ram_00C0,X
C - - - - - 0x00069E 00:868E: F0 20     BEQ bra_86B0
C - - - - - 0x0006A0 00:8690: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x0006A2 00:8692: 30 08     BMI bra_869C
C - - - - - 0x0006A4 00:8694: C9 03     CMP #$03
C - - - - - 0x0006A6 00:8696: 90 04     BCC bra_869C
C - - - - - 0x0006A8 00:8698: A9 03     LDA #$03
C - - - - - 0x0006AA 00:869A: 95 A8     STA ram_spd_Y_hi_plr,X
bra_869C:
C - - - - - 0x0006AC 00:869C: B5 C0     LDA ram_00C0,X
C - - - - - 0x0006AE 00:869E: C9 24     CMP #$24
C - - - - - 0x0006B0 00:86A0: B0 0D     BCS bra_86AF_RTS
C - - - - - 0x0006B2 00:86A2: A9 73     LDA #$73
C - - - - - 0x0006B4 00:86A4: 9D 4C 05  STA ram_pos_X_hi_plr,X
C - - - - - 0x0006B7 00:86A7: BD 66 05  LDA ram_attr_spr_plr,X
C - - - - - 0x0006BA 00:86AA: 29 BF     AND #$BF
C - - - - - 0x0006BC 00:86AC: 9D 66 05  STA ram_attr_spr_plr,X
bra_86AF_RTS:
C - - - - - 0x0006BF 00:86AF: 60        RTS
bra_86B0:
C - - - - - 0x0006C0 00:86B0: A9 01     LDA #$01    ; con_btn_Right ?
C - - - - - 0x0006C2 00:86B2: 95 B0     STA ram_00B0,X
C - - - - - 0x0006C4 00:86B4: 8A        TXA
C - - - - - 0x0006C5 00:86B5: 0A        ASL
C - - - - - 0x0006C6 00:86B6: A8        TAY
C - - - - - 0x0006C7 00:86B7: B9 C5 86  LDA tbl_86C5_spd_Y,Y
C - - - - - 0x0006CA 00:86BA: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x0006CC 00:86BC: B9 C6 86  LDA tbl_86C5_spd_Y + $01,Y
C - - - - - 0x0006CF 00:86BF: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x0006D1 00:86C1: A9 02     LDA #$02
C - - - - - 0x0006D3 00:86C3: D0 A5     BNE bra_866A    ; jmp



tbl_86C5_spd_Y:
- D 0 - - - 0x0006D5 00:86C5: 40 FF     .word $FF40 ; 00 
- D 0 - - - 0x0006D7 00:86C7: 00 00     .word $0000 ; 01 



sub_86C9:
C - - - - - 0x0006D9 00:86C9: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x0006DB 00:86CB: C9 04     CMP #$04
C - - - - - 0x0006DD 00:86CD: D0 0C     BNE bra_86DB
C - - - - - 0x0006DF 00:86CF: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x0006E1 00:86D1: 29 04     AND #con_btn_Down
C - - - - - 0x0006E3 00:86D3: F0 06     BEQ bra_86DB
C - - - - - 0x0006E5 00:86D5: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x0006E7 00:86D7: 29 FC     AND #con_btns_LR ^ $FF
C - - - - - 0x0006E9 00:86D9: 95 F3     STA ram_btn_hold,X
bra_86DB:
C - - - - - 0x0006EB 00:86DB: 20 B7 84  JSR sub_84B7
C - - - - - 0x0006EE 00:86DE: B5 AE     LDA ram_00AE_plr,X
C - - - - - 0x0006F0 00:86E0: D0 58     BNE bra_873A
C - - - - - 0x0006F2 00:86E2: B5 F1     LDA ram_btn_press,X
C - - - - - 0x0006F4 00:86E4: 29 80     AND #con_btn_A
C - - - - - 0x0006F6 00:86E6: D0 03     BNE bra_86EB
C - - - - - 0x0006F8 00:86E8: 4C 6D 87  JMP loc_876D
bra_86EB:
C - - - - - 0x0006FB 00:86EB: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x0006FD 00:86ED: 29 0F     AND #con_btns_Dpad
C - - - - - 0x0006FF 00:86EF: C9 04     CMP #con_btn_Down
C - - - - - 0x000701 00:86F1: D0 27     BNE bra_871A
C - - - - - 0x000703 00:86F3: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x000705 00:86F5: C9 01     CMP #$01
C - - - - - 0x000707 00:86F7: D0 21     BNE bra_871A
C - - - - - 0x000709 00:86F9: 24 71     BIT ram_0071_flag
C - - - - - 0x00070B 00:86FB: 50 0E     BVC bra_870B
C - - - - - 0x00070D 00:86FD: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x000710 00:8700: 18        CLC
C - - - - - 0x000711 00:8701: 69 15     ADC #$15
C - - - - - 0x000713 00:8703: 18        CLC
C - - - - - 0x000714 00:8704: 69 10     ADC #$10
C - - - - - 0x000716 00:8706: 20 DB 82  JSR sub_82DB
C - - - - - 0x000719 00:8709: B0 0F     BCS bra_871A
bra_870B:
C - - - - - 0x00071B 00:870B: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x00071E 00:870E: 18        CLC
C - - - - - 0x00071F 00:870F: 69 10     ADC #$10
C - - - - - 0x000721 00:8711: 9D 32 05  STA ram_pos_Y_hi_plr,X
C - - - - - 0x000724 00:8714: 20 ED 89  JSR sub_89ED
C - - - - - 0x000727 00:8717: 4C 3A 87  JMP loc_873A
bra_871A:
C - - - - - 0x00072A 00:871A: A0 00     LDY #$00
C - - - - - 0x00072C 00:871C: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x00072E 00:871E: C9 04     CMP #$04
C - - - - - 0x000730 00:8720: D0 02     BNE bra_8724
C - - - - - 0x000732 00:8722: A0 02     LDY #$02
bra_8724:
C - - - - - 0x000734 00:8724: B9 4F 88  LDA tbl_884F_spd_Y,Y
C - - - - - 0x000737 00:8727: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000739 00:8729: B9 50 88  LDA tbl_884F_spd_Y + $01,Y
C - - - - - 0x00073C 00:872C: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x00073E 00:872E: A9 00     LDA #$00
C - - - - - 0x000740 00:8730: 95 B4     STA ram_00B4,X
C - - - - - 0x000742 00:8732: A9 80     LDA #$80
C - - - - - 0x000744 00:8734: 95 AE     STA ram_00AE_plr,X
C - - - - - 0x000746 00:8736: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000748 00:8738: 95 B0     STA ram_00B0,X
bra_873A:
loc_873A:
C D 0 - - - 0x00074A 00:873A: B5 A6     LDA ram_spd_Y_lo_plr,X
C - - - - - 0x00074C 00:873C: 18        CLC
C - - - - - 0x00074D 00:873D: 69 23     ADC #< $0023
C - - - - - 0x00074F 00:873F: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000751 00:8741: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x000753 00:8743: 69 00     ADC #> $0023
C - - - - - 0x000755 00:8745: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x000757 00:8747: 30 0C     BMI bra_8755
C - - - - - 0x000759 00:8749: C9 05     CMP #$05
C - - - - - 0x00075B 00:874B: 90 08     BCC bra_8755
C - - - - - 0x00075D 00:874D: A9 05     LDA #$05
C - - - - - 0x00075F 00:874F: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x000761 00:8751: A9 00     LDA #$00
C - - - - - 0x000763 00:8753: 95 A6     STA ram_spd_Y_lo_plr,X
bra_8755:
C - - - - - 0x000765 00:8755: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000767 00:8757: 29 03     AND #con_btns_LR
C - - - - - 0x000769 00:8759: F0 02     BEQ bra_875D
C - - - - - 0x00076B 00:875B: 95 B0     STA ram_00B0,X
bra_875D:
C - - - - - 0x00076D 00:875D: A9 04     LDA #$04
C - - - - - 0x00076F 00:875F: 85 08     STA ram_0008
C - - - - - 0x000771 00:8761: A9 08     LDA #$08
C - - - - - 0x000773 00:8763: 85 09     STA ram_0009
C - - - - - 0x000775 00:8765: B5 B0     LDA ram_00B0,X
C - - - - - 0x000777 00:8767: 20 53 88  JSR sub_8853
C - - - - - 0x00077A 00:876A: 4C 7F 87  JMP loc_877F



loc_876D:
C D 0 - - - 0x00077D 00:876D: 20 88 88  JSR sub_8888
C - - - - - 0x000780 00:8770: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000782 00:8772: 20 53 88  JSR sub_8853
C - - - - - 0x000785 00:8775: B9 6E 88  LDA tbl_886C_speed + $02,Y
C - - - - - 0x000788 00:8778: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x00078A 00:877A: B9 6F 88  LDA tbl_886C_speed + $03,Y
C - - - - - 0x00078D 00:877D: 95 A8     STA ram_spd_Y_hi_plr,X
loc_877F:
C D 0 - - - 0x00078F 00:877F: A0 FC     LDY #$FC
C - - - - - 0x000791 00:8781: A5 13     LDA ram_0013
C - - - - - 0x000793 00:8783: 29 03     AND #$03
C - - - - - 0x000795 00:8785: F0 07     BEQ bra_878E
C - - - - - 0x000797 00:8787: A0 3C     LDY #$3C
C - - - - - 0x000799 00:8789: 4A        LSR
C - - - - - 0x00079A 00:878A: A9 40     LDA #$40
C - - - - - 0x00079C 00:878C: 90 02     BCC bra_8790
bra_878E:
C - - - - - 0x00079E 00:878E: A9 00     LDA #$00
bra_8790:
C - - - - - 0x0007A0 00:8790: 85 08     STA ram_0008
C - - - - - 0x0007A2 00:8792: 98        TYA
C - - - - - 0x0007A3 00:8793: 3D 66 05  AND ram_attr_spr_plr,X
C - - - - - 0x0007A6 00:8796: 05 08     ORA ram_0008
C - - - - - 0x0007A8 00:8798: 9D 66 05  STA ram_attr_spr_plr,X
sub_879B:
C - - - - - 0x0007AB 00:879B: B5 D2     LDA ram_00D2,X
C - - - - - 0x0007AD 00:879D: D0 31     BNE bra_87D0
C - - - - - 0x0007AF 00:879F: A9 0C     LDA #$0C
C - - - - - 0x0007B1 00:87A1: 85 0F     STA ram_000F
C - - - - - 0x0007B3 00:87A3: A9 04     LDA #$04
C - - - - - 0x0007B5 00:87A5: A4 AE     LDY ram_00AE_plr
C - - - - - 0x0007B7 00:87A7: F0 02     BEQ bra_87AB
C - - - - - 0x0007B9 00:87A9: A9 08     LDA #$08
bra_87AB:
C - - - - - 0x0007BB 00:87AB: 18        CLC
C - - - - - 0x0007BC 00:87AC: 7D 32 05  ADC ram_pos_Y_hi_plr,X
C - - - - - 0x0007BF 00:87AF: A8        TAY
C - - - - - 0x0007C0 00:87B0: B5 AC     LDA ram_spd_X_hi_plr,X
C - - - - - 0x0007C2 00:87B2: 15 AA     ORA ram_spd_X_lo_plr,X
C - - - - - 0x0007C4 00:87B4: F0 1A     BEQ bra_87D0
C - - - - - 0x0007C6 00:87B6: B5 AC     LDA ram_spd_X_hi_plr,X
C - - - - - 0x0007C8 00:87B8: 0A        ASL
C - - - - - 0x0007C9 00:87B9: A9 0A     LDA #$0A
C - - - - - 0x0007CB 00:87BB: 90 02     BCC bra_87BF
C - - - - - 0x0007CD 00:87BD: A9 F6     LDA #$F6
bra_87BF:
C - - - - - 0x0007CF 00:87BF: 18        CLC
C - - - - - 0x0007D0 00:87C0: 7D 4C 05  ADC ram_pos_X_hi_plr,X
C - - - - - 0x0007D3 00:87C3: 20 7F BB  JSR sub_0x007B8F
C - - - - - 0x0007D6 00:87C6: 90 08     BCC bra_87D0
C - - - - - 0x0007D8 00:87C8: A9 00     LDA #$00
C - - - - - 0x0007DA 00:87CA: 95 AA     STA ram_spd_X_lo_plr,X
C - - - - - 0x0007DC 00:87CC: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x0007DE 00:87CE: 95 CC     STA ram_00CC,X
bra_87D0:
C - - - - - 0x0007E0 00:87D0: B5 AC     LDA ram_spd_X_hi_plr,X
C - - - - - 0x0007E2 00:87D2: 38        SEC
C - - - - - 0x0007E3 00:87D3: E5 62     SBC ram_cam_spd_X
C - - - - - 0x0007E5 00:87D5: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x0007E7 00:87D7: BC 4C 05  LDY ram_pos_X_hi_plr,X
C - - - - - 0x0007EA 00:87DA: 15 AA     ORA ram_spd_X_lo_plr,X
C - - - - - 0x0007EC 00:87DC: F0 6D     BEQ bra_884B_RTS
C - - - - - 0x0007EE 00:87DE: B5 AC     LDA ram_spd_X_hi_plr,X
C - - - - - 0x0007F0 00:87E0: 10 13     BPL bra_87F5
C - - - - - 0x0007F2 00:87E2: C0 14     CPY #$14
C - - - - - 0x0007F4 00:87E4: 90 65     BCC bra_884B_RTS
C - - - - - 0x0007F6 00:87E6: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x0007F9 00:87E9: C9 16     CMP #$16
C - - - - - 0x0007FB 00:87EB: B0 49     BCS bra_8836
C - - - - - 0x0007FD 00:87ED: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x0007FF 00:87EF: C9 09     CMP #$09
C - - - - - 0x000801 00:87F1: B0 58     BCS bra_884B_RTS
C - - - - - 0x000803 00:87F3: 90 41     BCC bra_8836    ; jmp
bra_87F5:
C - - - - - 0x000805 00:87F5: 98        TYA
C - - - - - 0x000806 00:87F6: A4 96     LDY ram_0096
C - - - - - 0x000808 00:87F8: C9 EC     CMP #$EC
C - - - - - 0x00080A 00:87FA: B0 4F     BCS bra_884B_RTS
C - - - - - 0x00080C 00:87FC: D9 4C 88  CMP tbl_884C,Y
C - - - - - 0x00080F 00:87FF: 90 35     BCC bra_8836
C - - - - - 0x000811 00:8801: A5 61     LDA ram_0061
C - - - - - 0x000813 00:8803: D0 20     BNE bra_8825
C - - - - - 0x000815 00:8805: B5 D8     LDA ram_00D8,X
C - - - - - 0x000817 00:8807: D0 2D     BNE bra_8836
C - - - - - 0x000819 00:8809: 20 A8 84  JSR sub_84A8
C - - - - - 0x00081C 00:880C: 90 07     BCC bra_8815
C - - - - - 0x00081E 00:880E: B9 4C 05  LDA ram_pos_X_hi_plr,Y
C - - - - - 0x000821 00:8811: C9 14     CMP #$14
C - - - - - 0x000823 00:8813: 90 36     BCC bra_884B_RTS
bra_8815:
C - - - - - 0x000825 00:8815: B5 A4     LDA ram_00A4,X
C - - - - - 0x000827 00:8817: 18        CLC
C - - - - - 0x000828 00:8818: 75 AA     ADC ram_spd_X_lo_plr,X
C - - - - - 0x00082A 00:881A: 95 A4     STA ram_00A4,X
C - - - - - 0x00082C 00:881C: A9 00     LDA #$00
C - - - - - 0x00082E 00:881E: 75 AC     ADC ram_spd_X_hi_plr,X
C - - - - - 0x000830 00:8820: 85 62     STA ram_cam_spd_X
C - - - - - 0x000832 00:8822: 4C 4B 88  JMP loc_884B_RTS
bra_8825:
C - - - - - 0x000835 00:8825: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x000838 00:8828: C9 16     CMP #$16
C - - - - - 0x00083A 00:882A: B0 0A     BCS bra_8836
C - - - - - 0x00083C 00:882C: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x00083E 00:882E: C9 06     CMP #$06
C - - - - - 0x000840 00:8830: 90 04     BCC bra_8836
- - - - - - 0x000842 00:8832: C9 09     CMP #$09
- - - - - - 0x000844 00:8834: 90 15     BCC bra_884B_RTS
bra_8836:
C - - - - - 0x000846 00:8836: B5 A4     LDA ram_00A4,X
C - - - - - 0x000848 00:8838: 18        CLC
C - - - - - 0x000849 00:8839: 75 AA     ADC ram_spd_X_lo_plr,X
C - - - - - 0x00084B 00:883B: 95 A4     STA ram_00A4,X
C - - - - - 0x00084D 00:883D: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x000850 00:8840: 75 AC     ADC ram_spd_X_hi_plr,X
C - - - - - 0x000852 00:8842: 9D 4C 05  STA ram_pos_X_hi_plr,X
C - - - - - 0x000855 00:8845: B4 CC     LDY ram_00CC,X
C - - - - - 0x000857 00:8847: F0 02     BEQ bra_884B_RTS
C - - - - - 0x000859 00:8849: 95 CC     STA ram_00CC,X
bra_884B_RTS:
loc_884B_RTS:   ; bzk optimize
C D 0 - - - 0x00085B 00:884B: 60        RTS



tbl_884C:
- D 0 - - - 0x00085C 00:884C: 80        .byte $80   ; 00 
- D 0 - - - 0x00085D 00:884D: 80        .byte $80   ; 01 
- D 0 - - - 0x00085E 00:884E: 98        .byte $98   ; 02 



tbl_884F_spd_Y:
- D 0 - - - 0x00085F 00:884F: F0 FB     .word $FBF0 ; 00 
- D 0 - - - 0x000861 00:8851: 00 FD     .word $FD00 ; 02 



sub_8853:
C - - - - - 0x000863 00:8853: 85 13     STA ram_0013
C - - - - - 0x000865 00:8855: A4 08     LDY ram_0008
C - - - - - 0x000867 00:8857: 4A        LSR
C - - - - - 0x000868 00:8858: B0 07     BCS bra_8861    ; if was 00
C - - - - - 0x00086A 00:885A: A4 09     LDY ram_0009
C - - - - - 0x00086C 00:885C: 4A        LSR
C - - - - - 0x00086D 00:885D: B0 02     BCS bra_8861    ; if was 00
C - - - - - 0x00086F 00:885F: A0 00     LDY # off_886C_00 - tbl_886C    ; default
bra_8861:
C - - - - - 0x000871 00:8861: B9 6C 88  LDA tbl_886C_speed,Y
C - - - - - 0x000874 00:8864: 95 AA     STA ram_spd_X_lo_plr,X
C - - - - - 0x000876 00:8866: B9 6D 88  LDA tbl_886C_speed + $01,Y
C - - - - - 0x000879 00:8869: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x00087B 00:886B: 60        RTS


tbl_886C:
tbl_886C_speed:
; on different surfaces
off_886C_00:
- D 0 - - - 0x00087C 00:886C: 00 00     .word $0000 ; X
- D 0 - - - 0x00087E 00:886E: 00 00     .word $0000 ; Y

off_8870_04:
- D 0 - - - 0x000880 00:8870: 00 01     .word $0100 ; X
- D 0 - - - 0x000882 00:8872: 00 00     .word $0000 ; Y

off_8874_08:
- D 0 - - - 0x000884 00:8874: 00 FF     .word $FF00 ; X
- D 0 - - - 0x000886 00:8876: 00 00     .word $0000 ; Y

off_8878_0C:
- D 0 - - - 0x000888 00:8878: E0 00     .word $00E0 ; X
- D 0 - - - 0x00088A 00:887A: 70 00     .word $0070 ; Y

off_887C_10:
- D 0 - - - 0x00088C 00:887C: 20 FF     .word $FF20 ; X
- D 0 - - - 0x00088E 00:887E: 70 00     .word $0070 ; Y

off_8880_14:
- D 0 - - - 0x000890 00:8880: E0 00     .word $00E0 ; X
- D 0 - - - 0x000892 00:8882: 90 FF     .word $FF90 ; Y

off_8884_18:
- D 0 - - - 0x000894 00:8884: 20 FF     .word $FF20 ; X
- D 0 - - - 0x000896 00:8886: 90 FF     .word $FF90 ; Y



sub_8888:
C - - - - - 0x000898 00:8888: B4 B2     LDY ram_plr_surface,X
C - - - - - 0x00089A 00:888A: C0 06     CPY #$06
C - - - - - 0x00089C 00:888C: B0 09     BCS bra_8897_diagonal
C - - - - - 0x00089E 00:888E: A9 04     LDA # off_8870_04 - tbl_886C
C - - - - - 0x0008A0 00:8890: 85 08     STA ram_0008
C - - - - - 0x0008A2 00:8892: A9 08     LDA # off_8874_08 - tbl_886C
C - - - - - 0x0008A4 00:8894: 85 09     STA ram_0009
C - - - - - 0x0008A6 00:8896: 60        RTS
bra_8897_diagonal:
C - - - - - 0x0008A7 00:8897: B9 9C 88  LDA tbl_88A2_index_1 - $06,Y
C - - - - - 0x0008AA 00:889A: 85 08     STA ram_0008
C - - - - - 0x0008AC 00:889C: B9 A2 88  LDA tbl_88A8_index_2 - $06,Y
C - - - - - 0x0008AF 00:889F: 85 09     STA ram_0009
C - - - - - 0x0008B1 00:88A1: 60        RTS



tbl_88A2_index_1:
- D 0 - - - 0x0008B2 00:88A2: 14        .byte off_8880_14 - tbl_886C   ; 06 
- D 0 - - - 0x0008B3 00:88A3: 14        .byte off_8880_14 - tbl_886C   ; 07 
- D 0 - - - 0x0008B4 00:88A4: 14        .byte off_8880_14 - tbl_886C   ; 08 
- D 0 - - - 0x0008B5 00:88A5: 0C        .byte off_8878_0C - tbl_886C   ; 09 
- D 0 - - - 0x0008B6 00:88A6: 0C        .byte off_8878_0C - tbl_886C   ; 0A 
- D 0 - - - 0x0008B7 00:88A7: 0C        .byte off_8878_0C - tbl_886C   ; 0B 



tbl_88A8_index_2:
- D 0 - - - 0x0008B8 00:88A8: 10        .byte off_887C_10 - tbl_886C   ; 06 
- D 0 - - - 0x0008B9 00:88A9: 10        .byte off_887C_10 - tbl_886C   ; 07 
- D 0 - - - 0x0008BA 00:88AA: 10        .byte off_887C_10 - tbl_886C   ; 08 
- D 0 - - - 0x0008BB 00:88AB: 18        .byte off_8884_18 - tbl_886C   ; 09 
- D 0 - - - 0x0008BC 00:88AC: 18        .byte off_8884_18 - tbl_886C   ; 0A 
- D 0 - - - 0x0008BD 00:88AD: 18        .byte off_8884_18 - tbl_886C   ; 0B 



sub_88AE:
C - - - - - 0x0008BE 00:88AE: A9 00     LDA #$00
C - - - - - 0x0008C0 00:88B0: F0 02     BEQ bra_88B4    ; jmp
sub_88B2:
C - - - - - 0x0008C2 00:88B2: A9 01     LDA #$01
bra_88B4:
C - - - - - 0x0008C4 00:88B4: 95 D8     STA ram_00D8,X
C - - - - - 0x0008C6 00:88B6: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x0008C9 00:88B9: 95 CE     STA ram_00CE,X
C - - - - - 0x0008CB 00:88BB: A5 5D     LDA ram_005D
C - - - - - 0x0008CD 00:88BD: F0 03     BEQ bra_88C2
C - - - - - 0x0008CF 00:88BF: 4C 28 8C  JMP loc_8C28
bra_88C2:
C - - - - - 0x0008D2 00:88C2: B5 A0     LDA ram_00A0,X
C - - - - - 0x0008D4 00:88C4: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x0008D7 00:88C7: F5 88     .word ofs_001_88F5_00_RTS
- D 0 - I - 0x0008D9 00:88C9: F5 88     .word ofs_001_88F5_01_RTS
- D 0 - I - 0x0008DB 00:88CB: DD 88     .word ofs_001_88DD_02
- D 0 - I - 0x0008DD 00:88CD: E3 88     .word ofs_001_88E3_03
- D 0 - I - 0x0008DF 00:88CF: E3 88     .word ofs_001_88E3_04
- D 0 - I - 0x0008E1 00:88D1: E9 88     .word ofs_001_88E9_05
- D 0 - I - 0x0008E3 00:88D3: F5 88     .word ofs_001_88F5_06_RTS
- D 0 - I - 0x0008E5 00:88D5: D9 88     .word ofs_001_88D9_07
- D 0 - I - 0x0008E7 00:88D7: F5 88     .word ofs_001_88F5_08_RTS



ofs_001_88D9_07:
C - - J - - 0x0008E9 00:88D9: A9 00     LDA #$00
C - - - - - 0x0008EB 00:88DB: 95 F3     STA ram_btn_hold,X
ofs_001_88DD_02:
C - - - - - 0x0008ED 00:88DD: 20 F6 88  JSR sub_88F6
C - - - - - 0x0008F0 00:88E0: 4C C3 89  JMP loc_89C3



bra_88E3:
ofs_001_88E3_03:
ofs_001_88E3_04:
C - - J - - 0x0008F3 00:88E3: 20 00 89  JSR sub_8900
C - - - - - 0x0008F6 00:88E6: 4C C3 89  JMP loc_89C3



ofs_001_88E9_05:
C - - J - - 0x0008F9 00:88E9: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x0008FC 00:88EC: C9 E0     CMP #$E0
C - - - - - 0x0008FE 00:88EE: 90 F3     BCC bra_88E3
C - - - - - 0x000900 00:88F0: A9 00     LDA #$00
C - - - - - 0x000902 00:88F2: 9D 18 05  STA ram_anim_id_plr,X
ofs_001_88F5_00_RTS:
ofs_001_88F5_01_RTS:
ofs_001_88F5_06_RTS:
ofs_001_88F5_08_RTS:
C - - J - - 0x000905 00:88F5: 60        RTS



sub_88F6:
C - - - - - 0x000906 00:88F6: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x000909 00:88F9: C9 E0     CMP #$E0
C - - - - - 0x00090B 00:88FB: 90 03     BCC bra_8900
C - - - - - 0x00090D 00:88FD: 4C AD F6  JMP loc_0x01F6BD
bra_8900:
sub_8900:
C - - - - - 0x000910 00:8900: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x000912 00:8902: 38        SEC
C - - - - - 0x000913 00:8903: E5 72     SBC ram_cam_spd_Y
C - - - - - 0x000915 00:8905: 85 14     STA ram_0014
C - - - - - 0x000917 00:8907: 15 A6     ORA ram_spd_Y_lo_plr,X
C - - - - - 0x000919 00:8909: D0 03     BNE bra_890E
C - - - - - 0x00091B 00:890B: 4C A0 89  JMP loc_89A0_RTS
bra_890E:
C - - - - - 0x00091E 00:890E: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x000921 00:8911: A4 14     LDY ram_0014
C - - - - - 0x000923 00:8913: 10 3B     BPL bra_8950
C - - - - - 0x000925 00:8915: 20 A1 89  JSR sub_89A1
C - - - - - 0x000928 00:8918: F0 0F     BEQ bra_8929
C - - - - - 0x00092A 00:891A: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x00092D 00:891D: 18        CLC
C - - - - - 0x00092E 00:891E: 65 9A     ADC ram_009A
C - - - - - 0x000930 00:8920: 9D 32 05  STA ram_pos_Y_hi_plr,X
C - - - - - 0x000933 00:8923: A9 00     LDA #$00
C - - - - - 0x000935 00:8925: 95 CE     STA ram_00CE,X
C - - - - - 0x000937 00:8927: F0 77     BEQ bra_89A0_RTS    ; jmp
bra_8929:
C - - - - - 0x000939 00:8929: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x00093C 00:892C: C9 12     CMP #$12
C - - - - - 0x00093E 00:892E: 90 70     BCC bra_89A0_RTS
C - - - - - 0x000940 00:8930: C9 60     CMP #$60
C - - - - - 0x000942 00:8932: B0 5B     BCS bra_898F
C - - - - - 0x000944 00:8934: B5 D8     LDA ram_00D8,X
C - - - - - 0x000946 00:8936: D0 57     BNE bra_898F
C - - - - - 0x000948 00:8938: A5 71     LDA ram_0071_flag
C - - - - - 0x00094A 00:893A: 30 53     BMI bra_898F
C - - - - - 0x00094C 00:893C: A5 7E     LDA ram_007E
C - - - - - 0x00094E 00:893E: D0 4F     BNE bra_898F
C - - - - - 0x000950 00:8940: B5 A2     LDA ram_00A2,X
C - - - - - 0x000952 00:8942: 18        CLC
C - - - - - 0x000953 00:8943: 75 A6     ADC ram_spd_Y_lo_plr,X
C - - - - - 0x000955 00:8945: 95 A2     STA ram_00A2,X
C - - - - - 0x000957 00:8947: A9 00     LDA #$00
C - - - - - 0x000959 00:8949: 65 14     ADC ram_0014
C - - - - - 0x00095B 00:894B: 85 72     STA ram_cam_spd_Y
C - - - - - 0x00095D 00:894D: 4C A0 89  JMP loc_89A0_RTS
bra_8950:
C - - - - - 0x000960 00:8950: A4 9A     LDY ram_009A
C - - - - - 0x000962 00:8952: F0 0F     BEQ bra_8963
C - - - - - 0x000964 00:8954: 20 A1 89  JSR sub_89A1
C - - - - - 0x000967 00:8957: F0 07     BEQ bra_8960
C - - - - - 0x000969 00:8959: A5 14     LDA ram_0014
C - - - - - 0x00096B 00:895B: 18        CLC
C - - - - - 0x00096C 00:895C: 65 9A     ADC ram_009A
C - - - - - 0x00096E 00:895E: 85 14     STA ram_0014
bra_8960:
C - - - - - 0x000970 00:8960: BD 32 05  LDA ram_pos_Y_hi_plr,X
bra_8963:
C - - - - - 0x000973 00:8963: C5 97     CMP ram_0097
C - - - - - 0x000975 00:8965: 90 28     BCC bra_898F
C - - - - - 0x000977 00:8967: A4 72     LDY ram_cam_spd_Y
C - - - - - 0x000979 00:8969: D0 24     BNE bra_898F
C - - - - - 0x00097B 00:896B: 24 71     BIT ram_0071_flag
C - - - - - 0x00097D 00:896D: 70 20     BVS bra_898F
C - - - - - 0x00097F 00:896F: A5 7E     LDA ram_007E
C - - - - - 0x000981 00:8971: D0 1C     BNE bra_898F
C - - - - - 0x000983 00:8973: 20 A8 84  JSR sub_84A8
C - - - - - 0x000986 00:8976: 90 07     BCC bra_897F
C - - - - - 0x000988 00:8978: B9 32 05  LDA ram_pos_Y_hi_plr,Y
C - - - - - 0x00098B 00:897B: C9 22     CMP #$22
C - - - - - 0x00098D 00:897D: 90 10     BCC bra_898F
bra_897F:
C - - - - - 0x00098F 00:897F: B5 A2     LDA ram_00A2,X
C - - - - - 0x000991 00:8981: 18        CLC
C - - - - - 0x000992 00:8982: 75 A6     ADC ram_spd_Y_lo_plr,X
C - - - - - 0x000994 00:8984: 95 A2     STA ram_00A2,X
C - - - - - 0x000996 00:8986: A9 00     LDA #$00
C - - - - - 0x000998 00:8988: 65 14     ADC ram_0014
C - - - - - 0x00099A 00:898A: 85 72     STA ram_cam_spd_Y
C - - - - - 0x00099C 00:898C: 4C A0 89  JMP loc_89A0_RTS
bra_898F:
C - - - - - 0x00099F 00:898F: B5 A2     LDA ram_00A2,X
C - - - - - 0x0009A1 00:8991: 18        CLC
C - - - - - 0x0009A2 00:8992: 75 A6     ADC ram_spd_Y_lo_plr,X
C - - - - - 0x0009A4 00:8994: 95 A2     STA ram_00A2,X
C - - - - - 0x0009A6 00:8996: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x0009A9 00:8999: 65 14     ADC ram_0014
C - - - - - 0x0009AB 00:899B: 9D 32 05  STA ram_pos_Y_hi_plr,X
C - - - - - 0x0009AE 00:899E: 95 CE     STA ram_00CE,X
bra_89A0_RTS:
loc_89A0_RTS:
C D 0 - - - 0x0009B0 00:89A0: 60        RTS



sub_89A1:
C - - - - - 0x0009B1 00:89A1: 18        CLC
C - - - - - 0x0009B2 00:89A2: 69 F6     ADC #$F6
C - - - - - 0x0009B4 00:89A4: A8        TAY
C - - - - - 0x0009B5 00:89A5: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x0009B8 00:89A8: 20 AA BA  JSR sub_0x007ABA_calculate_surface_type
C - - - - - 0x0009BB 00:89AB: C9 06     CMP #$06
C - - - - - 0x0009BD 00:89AD: 90 08     BCC bra_89B7
C - - - - - 0x0009BF 00:89AF: A9 02     LDA #$02
C - - - - - 0x0009C1 00:89B1: A4 8F     LDY ram_008F
C - - - - - 0x0009C3 00:89B3: D0 02     BNE bra_89B7
C - - - - - 0x0009C5 00:89B5: A9 00     LDA #$00
bra_89B7:
C - - - - - 0x0009C7 00:89B7: A8        TAY
C - - - - - 0x0009C8 00:89B8: B9 BC 89  LDA tbl_89BC,Y
C - - - - - 0x0009CB 00:89BB: 60        RTS



tbl_89BC:
- D 0 - - - 0x0009CC 00:89BC: 00        .byte $00   ; 00 
- D 0 - - - 0x0009CD 00:89BD: 00        .byte $00   ; 01 
- D 0 - - - 0x0009CE 00:89BE: 01        .byte $01   ; 02 
- D 0 - - - 0x0009CF 00:89BF: 01        .byte $01   ; 03 
- - - - - - 0x0009D0 00:89C0: 01        .byte $01   ; 04 
- - - - - - 0x0009D1 00:89C1: 00        .byte $00   ; 05 



bra_89C2_RTS:
C - - - - - 0x0009D2 00:89C2: 60        RTS



loc_89C3:
C D 0 - - - 0x0009D3 00:89C3: A9 00     LDA #$00
C - - - - - 0x0009D5 00:89C5: 95 B2     STA ram_plr_surface,X
C - - - - - 0x0009D7 00:89C7: B5 AE     LDA ram_00AE_plr,X
C - - - - - 0x0009D9 00:89C9: 10 06     BPL bra_89D1
C - - - - - 0x0009DB 00:89CB: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x0009DD 00:89CD: 30 F3     BMI bra_89C2_RTS
C - - - - - 0x0009DF 00:89CF: F0 F1     BEQ bra_89C2_RTS
bra_89D1:
C - - - - - 0x0009E1 00:89D1: A9 15     LDA #$15
C - - - - - 0x0009E3 00:89D3: 85 07     STA ram_0007
C - - - - - 0x0009E5 00:89D5: 18        CLC
C - - - - - 0x0009E6 00:89D6: 7D 32 05  ADC ram_pos_Y_hi_plr,X
C - - - - - 0x0009E9 00:89D9: A8        TAY
C - - - - - 0x0009EA 00:89DA: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x0009ED 00:89DD: 18        CLC
C - - - - - 0x0009EE 00:89DE: 65 62     ADC ram_cam_spd_X
C - - - - - 0x0009F0 00:89E0: 20 AA BA  JSR sub_0x007ABA_calculate_surface_type
C - - - - - 0x0009F3 00:89E3: 95 B2     STA ram_plr_surface,X
C - - - - - 0x0009F5 00:89E5: 85 09     STA ram_0009
C - - - - - 0x0009F7 00:89E7: D0 0D     BNE bra_89F6
C - - - - - 0x0009F9 00:89E9: B5 AE     LDA ram_00AE_plr,X
C - - - - - 0x0009FB 00:89EB: D0 D5     BNE bra_89C2_RTS
sub_89ED:
C - - - - - 0x0009FD 00:89ED: A9 40     LDA #$40
C - - - - - 0x0009FF 00:89EF: 95 AE     STA ram_00AE_plr,X
C - - - - - 0x000A01 00:89F1: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000A03 00:89F3: 95 B0     STA ram_00B0,X
C - - - - - 0x000A05 00:89F5: 60        RTS
bra_89F6:
C - - - - - 0x000A06 00:89F6: B5 AE     LDA ram_00AE_plr,X
C - - - - - 0x000A08 00:89F8: F0 0B     BEQ bra_8A05
C - - - - - 0x000A0A 00:89FA: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x000A0C 00:89FC: C9 04     CMP #$04
C - - - - - 0x000A0E 00:89FE: F0 05     BEQ bra_8A05
C - - - - - 0x000A10 00:8A00: A9 06     LDA #con_sound_06
C - - - - - 0x000A12 00:8A02: 20 DE FD  JSR sub_0x01FDEE_play_sound
bra_8A05:
C - - - - - 0x000A15 00:8A05: A9 00     LDA #$00
C - - - - - 0x000A17 00:8A07: 95 AE     STA ram_00AE_plr,X
C - - - - - 0x000A19 00:8A09: 95 B0     STA ram_00B0,X
C - - - - - 0x000A1B 00:8A0B: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000A1D 00:8A0D: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x000A1F 00:8A0F: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x000A21 00:8A11: C9 04     CMP #$04
C - - - - - 0x000A23 00:8A13: D0 08     BNE bra_8A1D
C - - - - - 0x000A25 00:8A15: A5 5B     LDA ram_005B
C - - - - - 0x000A27 00:8A17: 29 10     AND #$10
C - - - - - 0x000A29 00:8A19: F0 02     BEQ bra_8A1D
C - - - - - 0x000A2B 00:8A1B: C6 07     DEC ram_0007
bra_8A1D:
C - - - - - 0x000A2D 00:8A1D: 20 50 F8  JSR sub_0x01F860
C - - - - - 0x000A30 00:8A20: 9D 32 05  STA ram_pos_Y_hi_plr,X
C - - - - - 0x000A33 00:8A23: 60        RTS



loc_8A24:
C D 0 - - - 0x000A34 00:8A24: B5 A0     LDA ram_00A0,X
C - - - - - 0x000A36 00:8A26: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x000A39 00:8A29: 3E 85     .word ofs_003_853E_00
- D 0 - I - 0x000A3B 00:8A2B: 3B 8A     .word ofs_003_8A3B_01
- D 0 - I - 0x000A3D 00:8A2D: 4E 8A     .word ofs_003_8A4E_02
- D 0 - I - 0x000A3F 00:8A2F: 5E 8A     .word ofs_003_8A5E_03
- D 0 - I - 0x000A41 00:8A31: 81 8A     .word ofs_003_8A81_04
- D 0 - I - 0x000A43 00:8A33: 9F 8A     .word ofs_003_8A9F_05
- - - - - - 0x000A45 00:8A35: 5D 8A     .word ofs_003_8A5D_06_RTS
- - - - - - 0x000A47 00:8A37: 5D 8A     .word ofs_003_8A5D_07_RTS
- D 0 - I - 0x000A49 00:8A39: 4E 85     .word ofs_003_854E_08



ofs_003_8A3B_01:
C - - J - - 0x000A4B 00:8A3B: 20 81 85  JSR sub_8581
C - - - - - 0x000A4E 00:8A3E: A9 B0     LDA #$B0
C - - - - - 0x000A50 00:8A40: 9D 32 05  STA ram_pos_Y_hi_plr,X
C - - - - - 0x000A53 00:8A43: BD 4C 8A  LDA tbl_8A4C_pos_X,X
C - - - - - 0x000A56 00:8A46: 9D 4C 05  STA ram_pos_X_hi_plr,X
C - - - - - 0x000A59 00:8A49: 4C 35 83  JMP loc_8335



tbl_8A4C_pos_X:
- D 0 - - - 0x000A5C 00:8A4C: 98        .byte $98   ; 00 player 1
- D 0 - - - 0x000A5D 00:8A4D: 68        .byte $68   ; 01 player 2



ofs_003_8A4E_02:
C - - J - - 0x000A5E 00:8A4E: 20 EE 8C  JSR sub_8CEE
C - - - - - 0x000A61 00:8A51: 20 BF 8A  JSR sub_8ABF
C - - - - - 0x000A64 00:8A54: 20 AA 8B  JSR sub_8BAA
C - - - - - 0x000A67 00:8A57: 20 18 8C  JSR sub_8C18
C - - - - - 0x000A6A 00:8A5A: 4C 13 83  JMP loc_8313



ofs_003_8A5D_06_RTS:
ofs_003_8A5D_07_RTS:
- - - - - - 0x000A6D 00:8A5D: 60        RTS



ofs_003_8A5E_03:
C - - J - - 0x000A6E 00:8A5E: A9 80     LDA #$80
C - - - - - 0x000A70 00:8A60: 95 AE     STA ram_00AE_plr,X
C - - - - - 0x000A72 00:8A62: A9 00     LDA #$00
C - - - - - 0x000A74 00:8A64: 95 AA     STA ram_spd_X_lo_plr,X
C - - - - - 0x000A76 00:8A66: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x000A78 00:8A68: A9 C0     LDA #$C0
C - - - - - 0x000A7A 00:8A6A: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000A7C 00:8A6C: A9 FD     LDA #$FD
C - - - - - 0x000A7E 00:8A6E: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x000A80 00:8A70: A9 0C     LDA #$0C
C - - - - - 0x000A82 00:8A72: 95 B6     STA ram_00B6,X
C - - - - - 0x000A84 00:8A74: A9 00     LDA #$00
C - - - - - 0x000A86 00:8A76: 95 B4     STA ram_00B4,X
C - - - - - 0x000A88 00:8A78: 20 B9 8A  JSR sub_8AB9
C - - - - - 0x000A8B 00:8A7B: 20 05 8B  JSR sub_8B05
C - - - - - 0x000A8E 00:8A7E: F6 A0     INC ram_00A0,X
bra_8A80_RTS:
C - - - - - 0x000A90 00:8A80: 60        RTS



ofs_003_8A81_04:
C - - J - - 0x000A91 00:8A81: 20 A5 8A  JSR sub_8AA5
C - - - - - 0x000A94 00:8A84: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x000A96 00:8A86: 30 07     BMI bra_8A8F
C - - - - - 0x000A98 00:8A88: C9 03     CMP #$03
C - - - - - 0x000A9A 00:8A8A: 90 03     BCC bra_8A8F
C - - - - - 0x000A9C 00:8A8C: 4C 0E 86  JMP loc_860E
bra_8A8F:
C - - - - - 0x000A9F 00:8A8F: B5 A6     LDA ram_spd_Y_lo_plr,X
C - - - - - 0x000AA1 00:8A91: 18        CLC
C - - - - - 0x000AA2 00:8A92: 69 20     ADC #< $0020
C - - - - - 0x000AA4 00:8A94: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000AA6 00:8A96: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x000AA8 00:8A98: 69 00     ADC #> $0020
C - - - - - 0x000AAA 00:8A9A: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x000AAC 00:8A9C: 4C 05 8B  JMP loc_8B05



ofs_003_8A9F_05:
C - - J - - 0x000AAF 00:8A9F: 20 A5 8A  JSR sub_8AA5
C - - - - - 0x000AB2 00:8AA2: 4C 49 86  JMP loc_8649



sub_8AA5:
C - - - - - 0x000AB5 00:8AA5: D6 B6     DEC ram_00B6,X
C - - - - - 0x000AB7 00:8AA7: D0 D7     BNE bra_8A80_RTS
C - - - - - 0x000AB9 00:8AA9: A9 08     LDA #$08
C - - - - - 0x000ABB 00:8AAB: 95 B6     STA ram_00B6,X
C - - - - - 0x000ABD 00:8AAD: F6 B4     INC ram_00B4,X
C - - - - - 0x000ABF 00:8AAF: B5 B4     LDA ram_00B4,X
C - - - - - 0x000AC1 00:8AB1: C9 02     CMP #$02
C - - - - - 0x000AC3 00:8AB3: 90 02     BCC bra_8AB7
C - - - - - 0x000AC5 00:8AB5: A9 02     LDA #$02
bra_8AB7:
C - - - - - 0x000AC7 00:8AB7: 95 B4     STA ram_00B4,X
sub_8AB9:
C - - - - - 0x000AC9 00:8AB9: 18        CLC
C - - - - - 0x000ACA 00:8ABA: 69 3B     ADC #$3B
C - - - - - 0x000ACC 00:8ABC: 4C E0 8B  JMP loc_8BE0



sub_8ABF:
C - - - - - 0x000ACF 00:8ABF: 20 B7 84  JSR sub_84B7
C - - - - - 0x000AD2 00:8AC2: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000AD4 00:8AC4: 29 0F     AND #con_btns_Dpad
C - - - - - 0x000AD6 00:8AC6: 85 13     STA ram_0013
C - - - - - 0x000AD8 00:8AC8: C9 0B     CMP #$0B
C - - - - - 0x000ADA 00:8ACA: 90 02     BCC bra_8ACE
; if both up and down were pressed
; bzk optimize, normally that's not possible. or is it?
- - - - - - 0x000ADC 00:8ACC: A9 00     LDA #$00
bra_8ACE:
C - - - - - 0x000ADE 00:8ACE: A8        TAY
C - - - - - 0x000ADF 00:8ACF: F0 05     BEQ bra_8AD6
C - - - - - 0x000AE1 00:8AD1: B9 73 8B  LDA tbl_8B74 - $01,Y
C - - - - - 0x000AE4 00:8AD4: 95 D0     STA ram_00D0,X
bra_8AD6:
C - - - - - 0x000AE6 00:8AD6: A9 08     LDA #$08
C - - - - - 0x000AE8 00:8AD8: A4 13     LDY ram_0013
C - - - - - 0x000AEA 00:8ADA: F0 12     BEQ bra_8AEE
C - - - - - 0x000AEC 00:8ADC: B4 D0     LDY ram_00D0,X
C - - - - - 0x000AEE 00:8ADE: B9 7E 8B  LDA tbl_8B7E,Y
C - - - - - 0x000AF1 00:8AE1: 85 08     STA ram_0008
C - - - - - 0x000AF3 00:8AE3: BD 66 05  LDA ram_attr_spr_plr,X
C - - - - - 0x000AF6 00:8AE6: 29 3C     AND #$3C
C - - - - - 0x000AF8 00:8AE8: 05 08     ORA ram_0008
C - - - - - 0x000AFA 00:8AEA: 9D 66 05  STA ram_attr_spr_plr,X
C - - - - - 0x000AFD 00:8AED: 98        TYA
bra_8AEE:
C - - - - - 0x000AFE 00:8AEE: 0A        ASL
C - - - - - 0x000AFF 00:8AEF: 0A        ASL
C - - - - - 0x000B00 00:8AF0: A8        TAY
C - - - - - 0x000B01 00:8AF1: B9 86 8B  LDA tbl_8B86_speed,Y
C - - - - - 0x000B04 00:8AF4: 95 AA     STA ram_spd_X_lo_plr,X
C - - - - - 0x000B06 00:8AF6: B9 87 8B  LDA tbl_8B86_speed + $01,Y
C - - - - - 0x000B09 00:8AF9: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x000B0B 00:8AFB: B9 88 8B  LDA tbl_8B86_speed + $02,Y
C - - - - - 0x000B0E 00:8AFE: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000B10 00:8B00: B9 89 8B  LDA tbl_8B86_speed + $03,Y
C - - - - - 0x000B13 00:8B03: 95 A8     STA ram_spd_Y_hi_plr,X
sub_8B05:
loc_8B05:
C D 0 - - - 0x000B15 00:8B05: A5 F9     LDA ram_00F9
C - - - - - 0x000B17 00:8B07: C9 FF     CMP #$FF
C - - - - - 0x000B19 00:8B09: D0 1D     BNE bra_8B28
C - - - - - 0x000B1B 00:8B0B: A5 45     LDA ram_0045
C - - - - - 0x000B1D 00:8B0D: 38        SEC
C - - - - - 0x000B1E 00:8B0E: E9 10     SBC #$10
C - - - - - 0x000B20 00:8B10: DD 32 05  CMP ram_pos_Y_hi_plr,X
C - - - - - 0x000B23 00:8B13: B0 13     BCS bra_8B28
C - - - - - 0x000B25 00:8B15: BC 4C 05  LDY ram_pos_X_hi_plr,X
C - - - - - 0x000B28 00:8B18: B5 AC     LDA ram_spd_X_hi_plr,X
C - - - - - 0x000B2A 00:8B1A: 10 06     BPL bra_8B22
C - - - - - 0x000B2C 00:8B1C: C0 28     CPY #$28
C - - - - - 0x000B2E 00:8B1E: 90 53     BCC bra_8B73_RTS
C - - - - - 0x000B30 00:8B20: B0 42     BCS bra_8B64    ; jmp
bra_8B22:
C - - - - - 0x000B32 00:8B22: C0 D8     CPY #$D8
C - - - - - 0x000B34 00:8B24: B0 4D     BCS bra_8B73_RTS
C - - - - - 0x000B36 00:8B26: 90 3C     BCC bra_8B64    ; jmp
bra_8B28:
C - - - - - 0x000B38 00:8B28: A9 12     LDA #$12
C - - - - - 0x000B3A 00:8B2A: 85 0F     STA ram_000F
C - - - - - 0x000B3C 00:8B2C: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x000B3F 00:8B2F: 18        CLC
C - - - - - 0x000B40 00:8B30: 69 0F     ADC #$0F
C - - - - - 0x000B42 00:8B32: A8        TAY
C - - - - - 0x000B43 00:8B33: B5 AC     LDA ram_spd_X_hi_plr,X
C - - - - - 0x000B45 00:8B35: 15 AA     ORA ram_spd_X_lo_plr,X
C - - - - - 0x000B47 00:8B37: F0 3A     BEQ bra_8B73_RTS
C - - - - - 0x000B49 00:8B39: B5 AC     LDA ram_spd_X_hi_plr,X
C - - - - - 0x000B4B 00:8B3B: 0A        ASL
C - - - - - 0x000B4C 00:8B3C: A9 07     LDA #$07
C - - - - - 0x000B4E 00:8B3E: 90 02     BCC bra_8B42
C - - - - - 0x000B50 00:8B40: A9 F8     LDA #$F8
bra_8B42:
C - - - - - 0x000B52 00:8B42: 18        CLC
C - - - - - 0x000B53 00:8B43: 7D 4C 05  ADC ram_pos_X_hi_plr,X
C - - - - - 0x000B56 00:8B46: 20 7F BB  JSR sub_0x007B8F
C - - - - - 0x000B59 00:8B49: 90 08     BCC bra_8B53
C - - - - - 0x000B5B 00:8B4B: A9 00     LDA #$00
C - - - - - 0x000B5D 00:8B4D: 95 AA     STA ram_spd_X_lo_plr,X
C - - - - - 0x000B5F 00:8B4F: 95 AC     STA ram_spd_X_hi_plr,X
C - - - - - 0x000B61 00:8B51: F0 20     BEQ bra_8B73_RTS    ; jmp
bra_8B53:
C - - - - - 0x000B63 00:8B53: BC 4C 05  LDY ram_pos_X_hi_plr,X
C - - - - - 0x000B66 00:8B56: B5 AC     LDA ram_spd_X_hi_plr,X
C - - - - - 0x000B68 00:8B58: 10 06     BPL bra_8B60
C - - - - - 0x000B6A 00:8B5A: C0 14     CPY #$14
C - - - - - 0x000B6C 00:8B5C: 90 15     BCC bra_8B73_RTS
C - - - - - 0x000B6E 00:8B5E: B0 04     BCS bra_8B64    ; jmp
bra_8B60:
C - - - - - 0x000B70 00:8B60: C0 EC     CPY #$EC
C - - - - - 0x000B72 00:8B62: B0 0F     BCS bra_8B73_RTS
bra_8B64:
C - - - - - 0x000B74 00:8B64: B5 A4     LDA ram_00A4,X
C - - - - - 0x000B76 00:8B66: 18        CLC
C - - - - - 0x000B77 00:8B67: 75 AA     ADC ram_spd_X_lo_plr,X
C - - - - - 0x000B79 00:8B69: 95 A4     STA ram_00A4,X
C - - - - - 0x000B7B 00:8B6B: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x000B7E 00:8B6E: 75 AC     ADC ram_spd_X_hi_plr,X
C - - - - - 0x000B80 00:8B70: 9D 4C 05  STA ram_pos_X_hi_plr,X
bra_8B73_RTS:
C - - - - - 0x000B83 00:8B73: 60        RTS



tbl_8B74:
- D 0 - - - 0x000B84 00:8B74: 02        .byte $02   ; 01 
- D 0 - - - 0x000B85 00:8B75: 06        .byte $06   ; 02 
- - - - - - 0x000B86 00:8B76: 00        .byte $00   ; 03 
- D 0 - - - 0x000B87 00:8B77: 04        .byte $04   ; 04 
- D 0 - - - 0x000B88 00:8B78: 03        .byte $03   ; 05 
- D 0 - - - 0x000B89 00:8B79: 05        .byte $05   ; 06 
- - - - - - 0x000B8A 00:8B7A: 00        .byte $00   ; 07 
- D 0 - - - 0x000B8B 00:8B7B: 00        .byte $00   ; 08 
- D 0 - - - 0x000B8C 00:8B7C: 01        .byte $01   ; 09 
- D 0 - - - 0x000B8D 00:8B7D: 07        .byte $07   ; 0A 



tbl_8B7E:
- D 0 - - - 0x000B8E 00:8B7E: 00        .byte $00   ; 00 
- D 0 - - - 0x000B8F 00:8B7F: 40        .byte $40   ; 01 
- D 0 - - - 0x000B90 00:8B80: 40        .byte $40   ; 02 
- D 0 - - - 0x000B91 00:8B81: 40        .byte $40   ; 03 
- D 0 - - - 0x000B92 00:8B82: 00        .byte $00   ; 04 
- D 0 - - - 0x000B93 00:8B83: 00        .byte $00   ; 05 
- D 0 - - - 0x000B94 00:8B84: 00        .byte $00   ; 06 
- D 0 - - - 0x000B95 00:8B85: 00        .byte $00   ; 07 




tbl_8B86_speed:
; 00 
- D 0 - - - 0x000B96 00:8B86: 00 00     .word $0000 ; X
- D 0 - - - 0x000B98 00:8B88: 00 FF     .word $FF00 ; Y
; 01 
- D 0 - - - 0x000B9A 00:8B8A: B5 00     .word $00B5 ; X
- D 0 - - - 0x000B9C 00:8B8C: 4B FF     .word $FF4B ; Y
; 02 
- D 0 - - - 0x000B9E 00:8B8E: 00 01     .word $0100 ; X
- D 0 - - - 0x000BA0 00:8B90: 00 00     .word $0000 ; Y
; 03 
- D 0 - - - 0x000BA2 00:8B92: B5 00     .word $00B5 ; X
- D 0 - - - 0x000BA4 00:8B94: B5 00     .word $00B5 ; Y
; 04 
- D 0 - - - 0x000BA6 00:8B96: 00 00     .word $0000 ; X
- D 0 - - - 0x000BA8 00:8B98: 00 01     .word $0100 ; Y
; 05 
- D 0 - - - 0x000BAA 00:8B9A: 4B FF     .word $FF4B ; X
- D 0 - - - 0x000BAC 00:8B9C: B5 00     .word $00B5 ; Y
; 06 
- D 0 - - - 0x000BAE 00:8B9E: 00 FF     .word $FF00 ; X
- D 0 - - - 0x000BB0 00:8BA0: 00 00     .word $0000 ; Y
; 07 
- D 0 - - - 0x000BB2 00:8BA2: 4B FF     .word $FF4B ; X
- D 0 - - - 0x000BB4 00:8BA4: 4B FF     .word $FF4B ; Y
; 08 
- D 0 - - - 0x000BB6 00:8BA6: 00 00     .word $0000 ; X
- D 0 - - - 0x000BB8 00:8BA8: 00 00     .word $0000 ; Y



sub_8BAA:
C - - - - - 0x000BBA 00:8BAA: A9 BF     LDA #$BF
C - - - - - 0x000BBC 00:8BAC: 95 C6     STA ram_00C6,X
C - - - - - 0x000BBE 00:8BAE: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000BC0 00:8BB0: 29 0F     AND #con_btns_Dpad
C - - - - - 0x000BC2 00:8BB2: F0 18     BEQ bra_8BCC
C - - - - - 0x000BC4 00:8BB4: F6 B6     INC ram_00B6,X
C - - - - - 0x000BC6 00:8BB6: B5 B6     LDA ram_00B6,X
C - - - - - 0x000BC8 00:8BB8: C9 09     CMP #$09
C - - - - - 0x000BCA 00:8BBA: 90 18     BCC bra_8BD4
C - - - - - 0x000BCC 00:8BBC: A9 00     LDA #$00
C - - - - - 0x000BCE 00:8BBE: 95 B6     STA ram_00B6,X
C - - - - - 0x000BD0 00:8BC0: F6 B4     INC ram_00B4,X
C - - - - - 0x000BD2 00:8BC2: B4 B4     LDY ram_00B4,X
C - - - - - 0x000BD4 00:8BC4: C0 04     CPY #$04
C - - - - - 0x000BD6 00:8BC6: 90 0C     BCC bra_8BD4
C - - - - - 0x000BD8 00:8BC8: A0 00     LDY #$00
C - - - - - 0x000BDA 00:8BCA: F0 06     BEQ bra_8BD2    ; jmp
bra_8BCC:
C - - - - - 0x000BDC 00:8BCC: A9 00     LDA #$00
C - - - - - 0x000BDE 00:8BCE: 95 B6     STA ram_00B6,X
C - - - - - 0x000BE0 00:8BD0: A0 01     LDY #$01
bra_8BD2:
C - - - - - 0x000BE2 00:8BD2: 94 B4     STY ram_00B4,X
bra_8BD4:
C - - - - - 0x000BE4 00:8BD4: B4 D0     LDY ram_00D0,X
C - - - - - 0x000BE6 00:8BD6: B9 FC 8B  LDA tbl_8BFC_index,Y
C - - - - - 0x000BE9 00:8BD9: 18        CLC
C - - - - - 0x000BEA 00:8BDA: 75 B4     ADC ram_00B4,X
C - - - - - 0x000BEC 00:8BDC: A8        TAY
C - - - - - 0x000BED 00:8BDD: B9 04 8C  LDA tbl_8C04,Y
loc_8BE0:
C D 0 - - - 0x000BF0 00:8BE0: A8        TAY
C - - - - - 0x000BF1 00:8BE1: B5 C4     LDA ram_plr_invinc,X
C - - - - - 0x000BF3 00:8BE3: F0 07     BEQ bra_8BEC
C - - - - - 0x000BF5 00:8BE5: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x000BF7 00:8BE7: 4A        LSR
C - - - - - 0x000BF8 00:8BE8: 90 02     BCC bra_8BEC
C - - - - - 0x000BFA 00:8BEA: A0 00     LDY #$00
bra_8BEC:
C - - - - - 0x000BFC 00:8BEC: 98        TYA
C - - - - - 0x000BFD 00:8BED: 9D 18 05  STA ram_anim_id_plr,X
C - - - - - 0x000C00 00:8BF0: BD 66 05  LDA ram_attr_spr_plr,X
C - - - - - 0x000C03 00:8BF3: 1D FA 8B  ORA tbl_8BFA_spr_attr,X
C - - - - - 0x000C06 00:8BF6: 9D 66 05  STA ram_attr_spr_plr,X
C - - - - - 0x000C09 00:8BF9: 60        RTS



tbl_8BFA_spr_attr:
- D 0 - - - 0x000C0A 00:8BFA: 00        .byte $00   ; 00 player 1
- D 0 - - - 0x000C0B 00:8BFB: 01        .byte $01   ; 01 player 2



tbl_8BFC_index:
- D 0 - - - 0x000C0C 00:8BFC: 10        .byte off_8C14_10 - tbl_8C04   ; 00 
- D 0 - - - 0x000C0D 00:8BFD: 08        .byte off_8C0C_08 - tbl_8C04   ; 01 
- D 0 - - - 0x000C0E 00:8BFE: 0C        .byte off_8C10_0C - tbl_8C04   ; 02 
- D 0 - - - 0x000C0F 00:8BFF: 04        .byte off_8C08_04 - tbl_8C04   ; 03 
- D 0 - - - 0x000C10 00:8C00: 00        .byte off_8C04_00 - tbl_8C04   ; 04 
- D 0 - - - 0x000C11 00:8C01: 04        .byte off_8C08_04 - tbl_8C04   ; 05 
- D 0 - - - 0x000C12 00:8C02: 0C        .byte off_8C10_0C - tbl_8C04   ; 06 
- D 0 - - - 0x000C13 00:8C03: 08        .byte off_8C0C_08 - tbl_8C04   ; 07 



tbl_8C04:
off_8C04_00:
- D 0 - - - 0x000C14 00:8C04: 2C        .byte $2C   ; 00 
- D 0 - - - 0x000C15 00:8C05: 2D        .byte $2D   ; 01 
- D 0 - - - 0x000C16 00:8C06: 2E        .byte $2E   ; 02 
- D 0 - - - 0x000C17 00:8C07: 2D        .byte $2D   ; 03 

off_8C08_04:
- D 0 - - - 0x000C18 00:8C08: 2F        .byte $2F   ; 00 
- D 0 - - - 0x000C19 00:8C09: 30        .byte $30   ; 01 
- D 0 - - - 0x000C1A 00:8C0A: 31        .byte $31   ; 02 
- D 0 - - - 0x000C1B 00:8C0B: 30        .byte $30   ; 03 

off_8C0C_08:
- D 0 - - - 0x000C1C 00:8C0C: 32        .byte $32   ; 00 
- D 0 - - - 0x000C1D 00:8C0D: 33        .byte $33   ; 01 
- D 0 - - - 0x000C1E 00:8C0E: 34        .byte $34   ; 02 
- D 0 - - - 0x000C1F 00:8C0F: 33        .byte $33   ; 03 

off_8C10_0C:
- D 0 - - - 0x000C20 00:8C10: 35        .byte $35   ; 00 
- D 0 - - - 0x000C21 00:8C11: 36        .byte $36   ; 01 
- D 0 - - - 0x000C22 00:8C12: 37        .byte $37   ; 02 
- D 0 - - - 0x000C23 00:8C13: 36        .byte $36   ; 03 

off_8C14_10:
- D 0 - - - 0x000C24 00:8C14: 38        .byte $38   ; 00 
- D 0 - - - 0x000C25 00:8C15: 39        .byte $39   ; 01 
- D 0 - - - 0x000C26 00:8C16: 3A        .byte $3A   ; 02 
- D 0 - - - 0x000C27 00:8C17: 39        .byte $39   ; 03 



sub_8C18:
C - - - - - 0x000C28 00:8C18: B4 D0     LDY ram_00D0,X
C - - - - - 0x000C2A 00:8C1A: B9 20 8C  LDA tbl_8C20,Y
C - - - - - 0x000C2D 00:8C1D: 95 BA     STA ram_plr_shoot_angle,X
C - - - - - 0x000C2F 00:8C1F: 60        RTS



tbl_8C20:
- D 0 - - - 0x000C30 00:8C20: 00        .byte $00   ; 00 
- D 0 - - - 0x000C31 00:8C21: 01        .byte $01   ; 01 
- D 0 - - - 0x000C32 00:8C22: 02        .byte $02   ; 02 
- D 0 - - - 0x000C33 00:8C23: 03        .byte $03   ; 03 
- D 0 - - - 0x000C34 00:8C24: 06        .byte $06   ; 04 
- D 0 - - - 0x000C35 00:8C25: 09        .byte $09   ; 05 
- D 0 - - - 0x000C36 00:8C26: 0A        .byte $0A   ; 06 
- D 0 - - - 0x000C37 00:8C27: 0B        .byte $0B   ; 07 



loc_8C28:
C D 0 - - - 0x000C38 00:8C28: B5 A0     LDA ram_00A0,X
C - - - - - 0x000C3A 00:8C2A: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x000C3D 00:8C2D: 52 8C     .word ofs_004_8C52_00_RTS
- D 0 - I - 0x000C3F 00:8C2F: 52 8C     .word ofs_004_8C52_01_RTS
- D 0 - I - 0x000C41 00:8C31: 53 8C     .word ofs_004_8C53_02
- D 0 - I - 0x000C43 00:8C33: 3F 8C     .word ofs_004_8C3F_03
- D 0 - I - 0x000C45 00:8C35: 3F 8C     .word ofs_004_8C3F_04
- D 0 - I - 0x000C47 00:8C37: 4F 8C     .word ofs_004_8C4F_05
- - - - - - 0x000C49 00:8C39: 52 8C     .word ofs_004_8C52_06_RTS
- - - - - - 0x000C4B 00:8C3B: 52 8C     .word ofs_004_8C52_07_RTS
- D 0 - I - 0x000C4D 00:8C3D: 52 8C     .word ofs_004_8C52_08_RTS



ofs_004_8C3F_03:
ofs_004_8C3F_04:
C - - J - - 0x000C4F 00:8C3F: 20 53 8C  JSR sub_8C53
C - - - - - 0x000C52 00:8C42: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x000C54 00:8C44: 30 0C     BMI bra_8C52_RTS
C - - - - - 0x000C56 00:8C46: B5 CE     LDA ram_00CE,X
C - - - - - 0x000C58 00:8C48: C9 FF     CMP #$FF
C - - - - - 0x000C5A 00:8C4A: D0 06     BNE bra_8C52_RTS
C - - - - - 0x000C5C 00:8C4C: 4C 0E 86  JMP loc_860E



ofs_004_8C4F_05:    ; bzk optimize
C - - J - - 0x000C5F 00:8C4F: 4C 53 8C  JMP loc_8C53



bra_8C52_RTS:
ofs_004_8C52_00_RTS:
ofs_004_8C52_01_RTS:
ofs_004_8C52_06_RTS:
ofs_004_8C52_07_RTS:
ofs_004_8C52_08_RTS:
C - - - - - 0x000C62 00:8C52: 60        RTS



sub_8C53:
loc_8C53:
ofs_004_8C53_02:
C D 0 J - - 0x000C63 00:8C53: A9 0C     LDA #$0C
C - - - - - 0x000C65 00:8C55: 85 0F     STA ram_000F
C - - - - - 0x000C67 00:8C57: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x000C69 00:8C59: 15 A6     ORA ram_spd_Y_lo_plr,X
C - - - - - 0x000C6B 00:8C5B: F0 27     BEQ bra_8C84
C - - - - - 0x000C6D 00:8C5D: B5 D2     LDA ram_00D2,X
C - - - - - 0x000C6F 00:8C5F: D0 23     BNE bra_8C84
C - - - - - 0x000C71 00:8C61: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x000C73 00:8C63: 0A        ASL
C - - - - - 0x000C74 00:8C64: A9 10     LDA #$10
C - - - - - 0x000C76 00:8C66: 90 02     BCC bra_8C6A
C - - - - - 0x000C78 00:8C68: A9 F9     LDA #$F9
bra_8C6A:
C - - - - - 0x000C7A 00:8C6A: 18        CLC
C - - - - - 0x000C7B 00:8C6B: 7D 32 05  ADC ram_pos_Y_hi_plr,X
C - - - - - 0x000C7E 00:8C6E: A8        TAY
C - - - - - 0x000C7F 00:8C6F: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x000C82 00:8C72: 18        CLC
C - - - - - 0x000C83 00:8C73: 69 05     ADC #$05
C - - - - - 0x000C85 00:8C75: 20 34 BB  JSR sub_0x007B44
C - - - - - 0x000C88 00:8C78: 90 0A     BCC bra_8C84
C - - - - - 0x000C8A 00:8C7A: A9 00     LDA #$00
C - - - - - 0x000C8C 00:8C7C: 95 A6     STA ram_spd_Y_lo_plr,X
C - - - - - 0x000C8E 00:8C7E: 95 A8     STA ram_spd_Y_hi_plr,X
C - - - - - 0x000C90 00:8C80: A9 FF     LDA #$FF
C - - - - - 0x000C92 00:8C82: 95 CE     STA ram_00CE,X
bra_8C84:
C - - - - - 0x000C94 00:8C84: B5 A8     LDA ram_spd_Y_hi_plr,X
C - - - - - 0x000C96 00:8C86: 38        SEC
C - - - - - 0x000C97 00:8C87: E5 72     SBC ram_cam_spd_Y
C - - - - - 0x000C99 00:8C89: 85 14     STA ram_0014
C - - - - - 0x000C9B 00:8C8B: 15 A6     ORA ram_spd_Y_lo_plr,X
C - - - - - 0x000C9D 00:8C8D: F0 55     BEQ bra_8CE4_RTS
C - - - - - 0x000C9F 00:8C8F: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x000CA2 00:8C92: A4 14     LDY ram_0014
C - - - - - 0x000CA4 00:8C94: 10 33     BPL bra_8CC9
C - - - - - 0x000CA6 00:8C96: 24 5C     BIT ram_005C
C - - - - - 0x000CA8 00:8C98: 70 04     BVS bra_8C9E
C - - - - - 0x000CAA 00:8C9A: C9 12     CMP #$12
C - - - - - 0x000CAC 00:8C9C: 90 46     BCC bra_8CE4_RTS
bra_8C9E:
C - - - - - 0x000CAE 00:8C9E: A4 96     LDY ram_0096
C - - - - - 0x000CB0 00:8CA0: D9 EB 8C  CMP tbl_8CEB,Y
C - - - - - 0x000CB3 00:8CA3: B0 28     BCS bra_8CCD
C - - - - - 0x000CB5 00:8CA5: B5 D8     LDA ram_00D8,X
C - - - - - 0x000CB7 00:8CA7: D0 24     BNE bra_8CCD
C - - - - - 0x000CB9 00:8CA9: A5 71     LDA ram_0071_flag
C - - - - - 0x000CBB 00:8CAB: 30 20     BMI bra_8CCD
C - - - - - 0x000CBD 00:8CAD: 20 A8 84  JSR sub_84A8
C - - - - - 0x000CC0 00:8CB0: 90 07     BCC bra_8CB9
C - - - - - 0x000CC2 00:8CB2: B9 32 05  LDA ram_pos_Y_hi_plr,Y
C - - - - - 0x000CC5 00:8CB5: C9 D8     CMP #$D8
C - - - - - 0x000CC7 00:8CB7: B0 2B     BCS bra_8CE4_RTS
bra_8CB9:
C - - - - - 0x000CC9 00:8CB9: B5 A2     LDA ram_00A2,X
C - - - - - 0x000CCB 00:8CBB: 18        CLC
C - - - - - 0x000CCC 00:8CBC: 75 A6     ADC ram_spd_Y_lo_plr,X
C - - - - - 0x000CCE 00:8CBE: 95 A2     STA ram_00A2,X
C - - - - - 0x000CD0 00:8CC0: A9 00     LDA #$00
C - - - - - 0x000CD2 00:8CC2: 65 14     ADC ram_0014
C - - - - - 0x000CD4 00:8CC4: 85 72     STA ram_cam_spd_Y
C - - - - - 0x000CD6 00:8CC6: 4C E4 8C  JMP loc_8CE4_RTS
bra_8CC9:
C - - - - - 0x000CD9 00:8CC9: C9 D8     CMP #$D8
C - - - - - 0x000CDB 00:8CCB: B0 17     BCS bra_8CE4_RTS
bra_8CCD:
C - - - - - 0x000CDD 00:8CCD: B5 A2     LDA ram_00A2,X
C - - - - - 0x000CDF 00:8CCF: 18        CLC
C - - - - - 0x000CE0 00:8CD0: 75 A6     ADC ram_spd_Y_lo_plr,X
C - - - - - 0x000CE2 00:8CD2: 95 A2     STA ram_00A2,X
C - - - - - 0x000CE4 00:8CD4: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x000CE7 00:8CD7: 65 14     ADC ram_0014
C - - - - - 0x000CE9 00:8CD9: 9D 32 05  STA ram_pos_Y_hi_plr,X
C - - - - - 0x000CEC 00:8CDC: B4 CE     LDY ram_00CE,X
C - - - - - 0x000CEE 00:8CDE: C0 FF     CPY #$FF
C - - - - - 0x000CF0 00:8CE0: F0 02     BEQ bra_8CE4_RTS
C - - - - - 0x000CF2 00:8CE2: 95 CE     STA ram_00CE,X
bra_8CE4_RTS:
loc_8CE4_RTS:
C D 0 - - - 0x000CF4 00:8CE4: 60        RTS


; bzk garbage
- - - - - - 0x000CF5 00:8CE5: 00        .byte $00   ; 
- - - - - - 0x000CF6 00:8CE6: 00        .byte $00   ; 
- - - - - - 0x000CF7 00:8CE7: 01        .byte $01   ; 
- - - - - - 0x000CF8 00:8CE8: 01        .byte $01   ; 
- - - - - - 0x000CF9 00:8CE9: 01        .byte $01   ; 
- - - - - - 0x000CFA 00:8CEA: 00        .byte $00   ; 



tbl_8CEB:
- D 0 - - - 0x000CFB 00:8CEB: 80        .byte $80   ; 00 
- - - - - - 0x000CFC 00:8CEC: 80        .byte $80   ; 01 
- D 0 - - - 0x000CFD 00:8CED: 70        .byte $70   ; 02 



sub_8CEE:
C - - - - - 0x000CFE 00:8CEE: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x000D00 00:8CF0: C9 04     CMP #$04
C - - - - - 0x000D02 00:8CF2: D0 06     BNE bra_8CFA
C - - - - - 0x000D04 00:8CF4: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000D06 00:8CF6: 29 04     AND #con_btn_Down
C - - - - - 0x000D08 00:8CF8: D0 40     BNE bra_8D3A_RTS
bra_8CFA:
C - - - - - 0x000D0A 00:8CFA: B5 B8     LDA ram_weapon,X
C - - - - - 0x000D0C 00:8CFC: 85 0F     STA ram_000F    ; full weapon value
C - - - - - 0x000D0E 00:8CFE: 29 0F     AND #$0F
C - - - - - 0x000D10 00:8D00: 85 0E     STA ram_000E    ; R cut weapon value
C - - - - - 0x000D12 00:8D02: A8        TAY
C - - - - - 0x000D13 00:8D03: C0 01     CPY #con_weapon_M
C - - - - - 0x000D15 00:8D05: F0 21     BEQ bra_8D28
C - - - - - 0x000D17 00:8D07: C0 03     CPY #con_weapon_L
C - - - - - 0x000D19 00:8D09: D0 30     BNE bra_8D3B
; if M or L
C - - - - - 0x000D1B 00:8D0B: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000D1D 00:8D0D: 0A        ASL
C - - - - - 0x000D1E 00:8D0E: 0A        ASL
C - - - - - 0x000D1F 00:8D0F: 90 2A     BCC bra_8D3B    ; if not con_btn_B
C - - - - - 0x000D21 00:8D11: 8A        TXA
C - - - - - 0x000D22 00:8D12: F0 03     BEQ bra_8D17
C - - - - - 0x000D24 00:8D14: B9 04 8E  LDA tbl_8E04,Y
bra_8D17:
C - - - - - 0x000D27 00:8D17: A8        TAY
C - - - - - 0x000D28 00:8D18: A9 05     LDA #$05
C - - - - - 0x000D2A 00:8D1A: 85 0D     STA ram_000D
bra_8D1C_loop:
C - - - - - 0x000D2C 00:8D1C: B9 A8 05  LDA ram_05A8_plr_bullet,Y
C - - - - - 0x000D2F 00:8D1F: D0 1A     BNE bra_8D3B
C - - - - - 0x000D31 00:8D21: C8        INY
C - - - - - 0x000D32 00:8D22: C6 0D     DEC ram_000D
C - - - - - 0x000D34 00:8D24: D0 F6     BNE bra_8D1C_loop
C - - - - - 0x000D36 00:8D26: F0 5A     BEQ bra_8D82    ; jmp
bra_8D28:
C - - - - - 0x000D38 00:8D28: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000D3A 00:8D2A: 0A        ASL
C - - - - - 0x000D3B 00:8D2B: 0A        ASL
C - - - - - 0x000D3C 00:8D2C: A9 00     LDA #$00
C - - - - - 0x000D3E 00:8D2E: 90 06     BCC bra_8D36    ; if not con_btn_B
C - - - - - 0x000D40 00:8D30: D6 BE     DEC ram_00BE,X
C - - - - - 0x000D42 00:8D32: 10 06     BPL bra_8D3A_RTS
C - - - - - 0x000D44 00:8D34: A9 06     LDA #$06
bra_8D36:
C - - - - - 0x000D46 00:8D36: 95 BE     STA ram_00BE,X
C - - - - - 0x000D48 00:8D38: B0 48     BCS bra_8D82
bra_8D3A_RTS:
C - - - - - 0x000D4A 00:8D3A: 60        RTS
bra_8D3B:
C - - - - - 0x000D4B 00:8D3B: B5 F1     LDA ram_btn_press,X
C - - - - - 0x000D4D 00:8D3D: 0A        ASL
C - - - - - 0x000D4E 00:8D3E: 0A        ASL
C - - - - - 0x000D4F 00:8D3F: A4 0E     LDY ram_000E    ; R cut weapon value
C - - - - - 0x000D51 00:8D41: B0 22     BCS bra_8D65    ; if con_btn_B
C - - - - - 0x000D53 00:8D43: C0 04     CPY #con_weapon_F_normal
C - - - - - 0x000D55 00:8D45: D0 F3     BNE bra_8D3A_RTS
C - - - - - 0x000D57 00:8D47: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000D59 00:8D49: 29 40     AND #con_btn_B
C - - - - - 0x000D5B 00:8D4B: F0 0A     BEQ bra_8D57
C - - - - - 0x000D5D 00:8D4D: B5 C8     LDA ram_00C8,X
C - - - - - 0x000D5F 00:8D4F: C9 20     CMP #$20
C - - - - - 0x000D61 00:8D51: B0 E7     BCS bra_8D3A_RTS
C - - - - - 0x000D63 00:8D53: F6 C8     INC ram_00C8,X
C - - - - - 0x000D65 00:8D55: 90 E3     BCC bra_8D3A_RTS    ; jmp
bra_8D57:
C - - - - - 0x000D67 00:8D57: B5 C8     LDA ram_00C8,X
C - - - - - 0x000D69 00:8D59: C9 20     CMP #$20
C - - - - - 0x000D6B 00:8D5B: 90 79     BCC bra_8DD6
C - - - - - 0x000D6D 00:8D5D: A5 0F     LDA ram_000F    ; full weapon value
C - - - - - 0x000D6F 00:8D5F: 29 80     AND #con_weapon_R
C - - - - - 0x000D71 00:8D61: 09 05     ORA #con_weapon_F_charged
C - - - - - 0x000D73 00:8D63: 85 0F     STA ram_000F
bra_8D65:
C - - - - - 0x000D75 00:8D65: C0 03     CPY #$03
C - - - - - 0x000D77 00:8D67: D0 15     BNE bra_8D7E
C - - - - - 0x000D79 00:8D69: 8A        TXA
C - - - - - 0x000D7A 00:8D6A: F0 03     BEQ bra_8D6F
C - - - - - 0x000D7C 00:8D6C: B9 04 8E  LDA tbl_8E04,Y
bra_8D6F:
C - - - - - 0x000D7F 00:8D6F: A8        TAY
C - - - - - 0x000D80 00:8D70: A9 05     LDA #$05
C - - - - - 0x000D82 00:8D72: 85 0D     STA ram_000D
C - - - - - 0x000D84 00:8D74: A9 00     LDA #$00
bra_8D76_loop:
C - - - - - 0x000D86 00:8D76: 99 A8 05  STA ram_05A8_plr_bullet,Y
C - - - - - 0x000D89 00:8D79: C8        INY
C - - - - - 0x000D8A 00:8D7A: C6 0D     DEC ram_000D
C - - - - - 0x000D8C 00:8D7C: D0 F8     BNE bra_8D76_loop
bra_8D7E:
C - - - - - 0x000D8E 00:8D7E: A9 00     LDA #$00
C - - - - - 0x000D90 00:8D80: 95 C8     STA ram_00C8,X
bra_8D82:
C - - - - - 0x000D92 00:8D82: A0 11     LDY #$11
C - - - - - 0x000D94 00:8D84: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x000D96 00:8D86: C9 04     CMP #$04
C - - - - - 0x000D98 00:8D88: F0 08     BEQ bra_8D92
C - - - - - 0x000D9A 00:8D8A: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x000D9C 00:8D8C: 29 03     AND #con_btns_LR
C - - - - - 0x000D9E 00:8D8E: D0 02     BNE bra_8D92
C - - - - - 0x000DA0 00:8D90: A0 05     LDY #$05
bra_8D92:
C - - - - - 0x000DA2 00:8D92: 98        TYA
C - - - - - 0x000DA3 00:8D93: 95 BC     STA ram_00BC,X
C - - - - - 0x000DA5 00:8D95: A9 00     LDA #$00
C - - - - - 0x000DA7 00:8D97: 85 00     STA ram_0000
C - - - - - 0x000DA9 00:8D99: B5 BA     LDA ram_plr_shoot_angle,X
C - - - - - 0x000DAB 00:8D9B: 85 02     STA ram_0002
C - - - - - 0x000DAD 00:8D9D: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x000DB0 00:8DA0: 85 03     STA ram_0003
C - - - - - 0x000DB2 00:8DA2: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x000DB5 00:8DA5: 85 04     STA ram_0004
C - - - - - 0x000DB7 00:8DA7: A5 0E     LDA ram_000E    ; R cut weapon value
C - - - - - 0x000DB9 00:8DA9: C9 02     CMP #con_weapon_S
C - - - - - 0x000DBB 00:8DAB: 18        CLC
C - - - - - 0x000DBC 00:8DAC: F0 04     BEQ bra_8DB2
C - - - - - 0x000DBE 00:8DAE: B5 B2     LDA ram_plr_surface,X
C - - - - - 0x000DC0 00:8DB0: C9 06     CMP #$06
bra_8DB2:
C - - - - - 0x000DC2 00:8DB2: 2A        ROL
C - - - - - 0x000DC3 00:8DB3: 29 01     AND #$01
C - - - - - 0x000DC5 00:8DB5: 85 05     STA ram_0005
C - - - - - 0x000DC7 00:8DB7: 8A        TXA
C - - - - - 0x000DC8 00:8DB8: 6A        ROR
C - - - - - 0x000DC9 00:8DB9: 6A        ROR
C - - - - - 0x000DCA 00:8DBA: 6A        ROR
C - - - - - 0x000DCB 00:8DBB: 29 40     AND #$40
C - - - - - 0x000DCD 00:8DBD: 85 12     STA ram_0012
bra_8DBF_loop:
C - - - - - 0x000DCF 00:8DBF: A6 10     LDX ram_0010
C - - - - - 0x000DD1 00:8DC1: A4 0E     LDY ram_000E    ; R cut weapon value
C - - - - - 0x000DD3 00:8DC3: 20 D9 8D  JSR sub_8DD9
C - - - - - 0x000DD6 00:8DC6: B0 0E     BCS bra_8DD6
C - - - - - 0x000DD8 00:8DC8: 20 0B 8E  JSR sub_8E0B
C - - - - - 0x000DDB 00:8DCB: A4 0E     LDY ram_000E    ; R cut weapon value
C - - - - - 0x000DDD 00:8DCD: A5 00     LDA ram_0000
C - - - - - 0x000DDF 00:8DCF: E6 00     INC ram_0000
C - - - - - 0x000DE1 00:8DD1: D9 F7 8D  CMP tbl_8DF7,Y
C - - - - - 0x000DE4 00:8DD4: 90 E9     BCC bra_8DBF_loop
bra_8DD6:
C - - - - - 0x000DE6 00:8DD6: A6 10     LDX ram_0010
C - - - - - 0x000DE8 00:8DD8: 60        RTS



sub_8DD9:
C - - - - - 0x000DE9 00:8DD9: 8A        TXA
C - - - - - 0x000DEA 00:8DDA: F0 03     BEQ bra_8DDF
C - - - - - 0x000DEC 00:8DDC: B9 04 8E  LDA tbl_8E04,Y
bra_8DDF:
C - - - - - 0x000DEF 00:8DDF: AA        TAX
C - - - - - 0x000DF0 00:8DE0: A9 00     LDA #$00
C - - - - - 0x000DF2 00:8DE2: 85 01     STA ram_0001
bra_8DE4_loop:
C - - - - - 0x000DF4 00:8DE4: BD A8 05  LDA ram_05A8_plr_bullet,X
C - - - - - 0x000DF7 00:8DE7: F0 0C     BEQ bra_8DF5
C - - - - - 0x000DF9 00:8DE9: E8        INX
C - - - - - 0x000DFA 00:8DEA: A5 01     LDA ram_0001
C - - - - - 0x000DFC 00:8DEC: D9 FD 8D  CMP tbl_8DFD,Y
C - - - - - 0x000DFF 00:8DEF: B0 05     BCS bra_8DF6_RTS
C - - - - - 0x000E01 00:8DF1: E6 01     INC ram_0001
C - - - - - 0x000E03 00:8DF3: 90 EF     BCC bra_8DE4_loop    ; jmp
bra_8DF5:
C - - - - - 0x000E05 00:8DF5: 18        CLC
bra_8DF6_RTS:
C - - - - - 0x000E06 00:8DF6: 60        RTS



tbl_8DF7:
- D 0 - - - 0x000E07 00:8DF7: 00        .byte $00   ; 00 con_weapon_default
- D 0 - - - 0x000E08 00:8DF8: 00        .byte $00   ; 01 con_weapon_M
- D 0 - - - 0x000E09 00:8DF9: 04        .byte $04   ; 02 con_weapon_S
- D 0 - - - 0x000E0A 00:8DFA: 04        .byte $04   ; 03 con_weapon_L
- D 0 - - - 0x000E0B 00:8DFB: 00        .byte $00   ; 04 con_weapon_F_normal
- - - - - - 0x000E0C 00:8DFC: 00        .byte $00   ; 05 con_weapon_F_charged
   


tbl_8DFD:
- D 0 - - - 0x000E0D 00:8DFD: 03        .byte $03   ; 00 
- D 0 - - - 0x000E0E 00:8DFE: 05        .byte $05   ; 01 
- D 0 - - - 0x000E0F 00:8DFF: 09        .byte $09   ; 02 
- D 0 - - - 0x000E10 00:8E00: 04        .byte $04   ; 03 
- D 0 - - - 0x000E11 00:8E01: 01        .byte $01   ; 04 
- - - - - - 0x000E12 00:8E02: 00        .byte $00   ; 05 
- D 0 - - - 0x000E13 00:8E03: 09        .byte $09   ; 06 



tbl_8E04:
- D 0 - - - 0x000E14 00:8E04: 0A        .byte $0A   ; 00 
- D 0 - - - 0x000E15 00:8E05: 0A        .byte $0A   ; 01 
- D 0 - - - 0x000E16 00:8E06: 06        .byte $06   ; 02 
- D 0 - - - 0x000E17 00:8E07: 0A        .byte $0A   ; 03 
- D 0 - - - 0x000E18 00:8E08: 0A        .byte $0A   ; 04 
- - - - - - 0x000E19 00:8E09: 0A        .byte $0A   ; 05 
- - - - - - 0x000E1A 00:8E0A: 06        .byte $06   ; 06 



sub_8E0B:
C - - - - - 0x000E1B 00:8E0B: A4 02     LDY ram_0002
C - - - - - 0x000E1D 00:8E0D: B9 E8 8E  LDA tbl_8EE8_bullet_dir,Y
C - - - - - 0x000E20 00:8E10: 9D 48 06  STA ram_plr_bullet_dir,X
C - - - - - 0x000E23 00:8E13: 98        TYA
C - - - - - 0x000E24 00:8E14: 0A        ASL
C - - - - - 0x000E25 00:8E15: 0A        ASL
C - - - - - 0x000E26 00:8E16: A4 05     LDY ram_0005
C - - - - - 0x000E28 00:8E18: F0 03     BEQ bra_8E1D
C - - - - - 0x000E2A 00:8E1A: 18        CLC
C - - - - - 0x000E2B 00:8E1B: 69 34     ADC #$0D * $04
bra_8E1D:
C - - - - - 0x000E2D 00:8E1D: A8        TAY
C - - - - - 0x000E2E 00:8E1E: A5 03     LDA ram_0003
C - - - - - 0x000E30 00:8E20: 18        CLC
C - - - - - 0x000E31 00:8E21: 79 19 91  ADC tbl_9119,Y
C - - - - - 0x000E34 00:8E24: 9D 78 05  STA ram_plr_bullet_pos_Y_hi,X
C - - - - - 0x000E37 00:8E27: A5 04     LDA ram_0004
C - - - - - 0x000E39 00:8E29: 18        CLC
C - - - - - 0x000E3A 00:8E2A: 79 1A 91  ADC tbl_9119 + $01,Y
C - - - - - 0x000E3D 00:8E2D: 9D 88 05  STA ram_plr_bullet_pos_X_hi,X
C - - - - - 0x000E40 00:8E30: B9 1C 91  LDA tbl_9119 + $03,Y
C - - - - - 0x000E43 00:8E33: 9D 98 05  STA ram_plr_bullet_attr_spr,X
C - - - - - 0x000E46 00:8E36: B9 1B 91  LDA tbl_9119 + $02,Y
C - - - - - 0x000E49 00:8E39: 85 0A     STA ram_000A
C - - - - - 0x000E4B 00:8E3B: A5 0E     LDA ram_000E    ; R cut weapon value
C - - - - - 0x000E4D 00:8E3D: C9 02     CMP #con_weapon_S
C - - - - - 0x000E4F 00:8E3F: D0 0C     BNE bra_8E4D
C - - - - - 0x000E51 00:8E41: A4 00     LDY ram_0000
C - - - - - 0x000E53 00:8E43: B9 0A 8F  LDA tbl_8F0A_offset,Y
C - - - - - 0x000E56 00:8E46: 18        CLC
C - - - - - 0x000E57 00:8E47: 65 0A     ADC ram_000A
C - - - - - 0x000E59 00:8E49: 29 7F     AND #$7F
C - - - - - 0x000E5B 00:8E4B: 85 0A     STA ram_000A
bra_8E4D:
C - - - - - 0x000E5D 00:8E4D: A9 00     LDA #$00
C - - - - - 0x000E5F 00:8E4F: A4 0E     LDY ram_000E    ; R cut weapon value
C - - - - - 0x000E61 00:8E51: C0 03     CPY #con_weapon_L
C - - - - - 0x000E63 00:8E53: F0 10     BEQ bra_8E65
C - - - - - 0x000E65 00:8E55: A5 0F     LDA ram_000F
C - - - - - 0x000E67 00:8E57: 0A        ASL
C - - - - - 0x000E68 00:8E58: B9 0F 8F  LDA tbl_8F0F_index,Y
C - - - - - 0x000E6B 00:8E5B: 90 02     BCC bra_8E5F
; C = 1
C - - - - - 0x000E6D 00:8E5D: 69 00     ADC #$00
bra_8E5F:
C - - - - - 0x000E6F 00:8E5F: C9 02     CMP #$02
C - - - - - 0x000E71 00:8E61: 90 02     BCC bra_8E65    ; if not overflow
C - - - - - 0x000E73 00:8E63: A9 02     LDA #$02
bra_8E65:
C - - - - - 0x000E75 00:8E65: A4 05     LDY ram_0005
C - - - - - 0x000E77 00:8E67: F0 03     BEQ bra_8E6C
C - - - - - 0x000E79 00:8E69: 18        CLC
C - - - - - 0x000E7A 00:8E6A: 69 03     ADC #$03
bra_8E6C:
loc_8E6C:
C D 0 - - - 0x000E7C 00:8E6C: 0A        ASL
C - - - - - 0x000E7D 00:8E6D: A8        TAY
C - - - - - 0x000E7E 00:8E6E: B9 15 8F  LDA tbl_8F15_bullet_speed,Y
C - - - - - 0x000E81 00:8E71: 85 08     STA ram_0008
C - - - - - 0x000E83 00:8E73: B9 16 8F  LDA tbl_8F15_bullet_speed + $01,Y
C - - - - - 0x000E86 00:8E76: 85 09     STA ram_0009
C - - - - - 0x000E88 00:8E78: A4 0A     LDY ram_000A
C - - - - - 0x000E8A 00:8E7A: B1 08     LDA (ram_0008),Y
C - - - - - 0x000E8C 00:8E7C: 9D E8 05  STA ram_plr_bullet_spd_Y_lo,X
C - - - - - 0x000E8F 00:8E7F: C8        INY
C - - - - - 0x000E90 00:8E80: B1 08     LDA (ram_0008),Y
C - - - - - 0x000E92 00:8E82: 9D 58 06  STA ram_plr_bullet_spd_Y_hi,X
C - - - - - 0x000E95 00:8E85: C8        INY
C - - - - - 0x000E96 00:8E86: B1 08     LDA (ram_0008),Y
C - - - - - 0x000E98 00:8E88: 9D 08 06  STA ram_plr_bullet_spd_X_lo,X
C - - - - - 0x000E9B 00:8E8B: C8        INY
C - - - - - 0x000E9C 00:8E8C: B1 08     LDA (ram_0008),Y
C - - - - - 0x000E9E 00:8E8E: 9D 18 06  STA ram_plr_bullet_spd_X_hi,X
C - - - - - 0x000EA1 00:8E91: A9 00     LDA #$00
C - - - - - 0x000EA3 00:8E93: 9D 28 06  STA ram_0628_plr_bullet,X
C - - - - - 0x000EA6 00:8E96: A0 01     LDY #$01
C - - - - - 0x000EA8 00:8E98: A5 0F     LDA ram_000F
C - - - - - 0x000EAA 00:8E9A: 05 12     ORA ram_0012
C - - - - - 0x000EAC 00:8E9C: 9D B8 05  STA ram_plr_bullet_anim_id,X
C - - - - - 0x000EAF 00:8E9F: 29 0F     AND #$0F
C - - - - - 0x000EB1 00:8EA1: C9 03     CMP #$03
C - - - - - 0x000EB3 00:8EA3: D0 12     BNE bra_8EB7
C - - - - - 0x000EB5 00:8EA5: BC 48 06  LDY ram_plr_bullet_dir,X
C - - - - - 0x000EB8 00:8EA8: B9 D6 8E  LDA tbl_8ED6_offset,Y
C - - - - - 0x000EBB 00:8EAB: 18        CLC
C - - - - - 0x000EBC 00:8EAC: 65 01     ADC ram_0001
C - - - - - 0x000EBE 00:8EAE: A8        TAY
C - - - - - 0x000EBF 00:8EAF: B9 DE 8E  LDA tbl_8EDE,Y
C - - - - - 0x000EC2 00:8EB2: 9D 28 06  STA ram_0628_plr_bullet,X
C - - - - - 0x000EC5 00:8EB5: A0 03     LDY #$03
bra_8EB7:
C - - - - - 0x000EC7 00:8EB7: 98        TYA
C - - - - - 0x000EC8 00:8EB8: 9D A8 05  STA ram_05A8_plr_bullet,X
C - - - - - 0x000ECB 00:8EBB: BD B8 05  LDA ram_plr_bullet_anim_id,X
C - - - - - 0x000ECE 00:8EBE: 29 0F     AND #$0F
C - - - - - 0x000ED0 00:8EC0: A8        TAY
C - - - - - 0x000ED1 00:8EC1: B9 F5 8E  LDA tbl_8EF5,Y
C - - - - - 0x000ED4 00:8EC4: 9D 68 05  STA ram_0568_plr_bullet,X
C - - - - - 0x000ED7 00:8EC7: B9 FC 8E  LDA tbl_8EFC_bullet_damage,Y
C - - - - - 0x000EDA 00:8ECA: 9D F8 05  STA ram_plr_bullet_damage,X
C - - - - - 0x000EDD 00:8ECD: B9 03 8F  LDA tbl_8F03,Y
; bzk optimize, useless check, all values are > 00
C - - - - - 0x000EE0 00:8ED0: F0 03     BEQ bra_8ED5_RTS
C - - - - - 0x000EE2 00:8ED2: 4C DE FD  JMP loc_0x01FDEE_play_sound
bra_8ED5_RTS:
- - - - - - 0x000EE5 00:8ED5: 60        RTS



tbl_8ED6_offset:
- D 0 - - - 0x000EE6 00:8ED6: 00        .byte off_8EDE_00 - tbl_8EDE   ; 00 
- D 0 - - - 0x000EE7 00:8ED7: 05        .byte off_8EE3_05 - tbl_8EDE   ; 01 
- D 0 - - - 0x000EE8 00:8ED8: 00        .byte off_8EDE_00 - tbl_8EDE   ; 02 
- D 0 - - - 0x000EE9 00:8ED9: 05        .byte off_8EE3_05 - tbl_8EDE   ; 03 
- D 0 - - - 0x000EEA 00:8EDA: 00        .byte off_8EDE_00 - tbl_8EDE   ; 04 
- D 0 - - - 0x000EEB 00:8EDB: 05        .byte off_8EE3_05 - tbl_8EDE   ; 05 
- D 0 - - - 0x000EEC 00:8EDC: 00        .byte off_8EDE_00 - tbl_8EDE   ; 06 
- D 0 - - - 0x000EED 00:8EDD: 05        .byte off_8EE3_05 - tbl_8EDE   ; 07 



tbl_8EDE:
; bzk optimize, same bytes
off_8EDE_00:
- D 0 - - - 0x000EEE 00:8EDE: 01        .byte $01   ; 00 
- D 0 - - - 0x000EEF 00:8EDF: 03        .byte $03   ; 01 
- D 0 - - - 0x000EF0 00:8EE0: 05        .byte $05   ; 02 
- D 0 - - - 0x000EF1 00:8EE1: 07        .byte $07   ; 03 
- D 0 - - - 0x000EF2 00:8EE2: 09        .byte $09   ; 04 

off_8EE3_05:
- D 0 - - - 0x000EF3 00:8EE3: 01        .byte $01   ; 00 
- D 0 - - - 0x000EF4 00:8EE4: 03        .byte $03   ; 01 
- D 0 - - - 0x000EF5 00:8EE5: 05        .byte $05   ; 02 
- D 0 - - - 0x000EF6 00:8EE6: 07        .byte $07   ; 03 
- D 0 - - - 0x000EF7 00:8EE7: 09        .byte $09   ; 04 



tbl_8EE8_bullet_dir:
- D 0 - - - 0x000EF8 00:8EE8: 06        .byte $06   ; 00 
- D 0 - - - 0x000EF9 00:8EE9: 07        .byte $07   ; 01 
- D 0 - - - 0x000EFA 00:8EEA: 00        .byte $00   ; 02 
- D 0 - - - 0x000EFB 00:8EEB: 01        .byte $01   ; 03 
- D 0 - - - 0x000EFC 00:8EEC: 00        .byte $00   ; 04 
- D 0 - - - 0x000EFD 00:8EED: 00        .byte $00   ; 05 
- D 0 - - - 0x000EFE 00:8EEE: 02        .byte $02   ; 06 
- D 0 - - - 0x000EFF 00:8EEF: 04        .byte $04   ; 07 
- D 0 - - - 0x000F00 00:8EF0: 04        .byte $04   ; 08 
- D 0 - - - 0x000F01 00:8EF1: 03        .byte $03   ; 09 
- D 0 - - - 0x000F02 00:8EF2: 04        .byte $04   ; 0A 
- D 0 - - - 0x000F03 00:8EF3: 05        .byte $05   ; 0B 
- D 0 - - - 0x000F04 00:8EF4: 06        .byte $06   ; 0C 



tbl_8EF5:
- D 0 - - - 0x000F05 00:8EF5: 05        .byte $05   ; 00 
- D 0 - - - 0x000F06 00:8EF6: 19        .byte $19   ; 01 
- D 0 - - - 0x000F07 00:8EF7: 06        .byte $06   ; 02 
- D 0 - - - 0x000F08 00:8EF8: 00        .byte $00   ; 03 
- D 0 - - - 0x000F09 00:8EF9: 19        .byte $19   ; 04 
- D 0 - - - 0x000F0A 00:8EFA: 19        .byte $19   ; 05 
- D 0 - - - 0x000F0B 00:8EFB: 03        .byte $03   ; 06 



tbl_8EFC_bullet_damage:
- D 0 - - - 0x000F0C 00:8EFC: 00        .byte $00   ; 00 
- D 0 - - - 0x000F0D 00:8EFD: 00        .byte $00   ; 01 
- D 0 - - - 0x000F0E 00:8EFE: 00        .byte $00   ; 02 
- D 0 - - - 0x000F0F 00:8EFF: 00        .byte $00   ; 03 
- D 0 - - - 0x000F10 00:8F00: 00        .byte $00   ; 04 
- D 0 - - - 0x000F11 00:8F01: 04        .byte $04   ; 05 
- D 0 - - - 0x000F12 00:8F02: 00        .byte $00   ; 06 



tbl_8F03:
- D 0 - - - 0x000F13 00:8F03: 0B        .byte con_sound_0B   ; 00 
- D 0 - - - 0x000F14 00:8F04: 0C        .byte con_sound_0C   ; 01 
- D 0 - - - 0x000F15 00:8F05: 0E        .byte con_sound_0E   ; 02 
- D 0 - - - 0x000F16 00:8F06: 0D        .byte con_sound_0D   ; 03 
- D 0 - - - 0x000F17 00:8F07: 0F        .byte con_sound_0F   ; 04 
- D 0 - - - 0x000F18 00:8F08: 0F        .byte con_sound_0F   ; 05 
- D 0 - - - 0x000F19 00:8F09: 0F        .byte con_sound_0F   ; 06 



tbl_8F0A_offset:
- D 0 - - - 0x000F1A 00:8F0A: 00        .byte $00   ; 00 
- D 0 - - - 0x000F1B 00:8F0B: FC        .byte $FC   ; 01 
- D 0 - - - 0x000F1C 00:8F0C: 04        .byte $04   ; 02 
- D 0 - - - 0x000F1D 00:8F0D: F8        .byte $F8   ; 03 
- D 0 - - - 0x000F1E 00:8F0E: 08        .byte $08   ; 04 



tbl_8F0F_index:
- D 0 - - - 0x000F1F 00:8F0F: 00        .byte $00   ; 00 
- D 0 - - - 0x000F20 00:8F10: 00        .byte $00   ; 01 
- D 0 - - - 0x000F21 00:8F11: 00        .byte $00   ; 02 
- - - - - - 0x000F22 00:8F12: 00        .byte $00   ; 03 
- D 0 - - - 0x000F23 00:8F13: 01        .byte $01   ; 04 
- - - - - - 0x000F24 00:8F14: 02        .byte $02   ; 05 



tbl_8F15_bullet_speed:
- D 0 - - - 0x000F25 00:8F15: 21 8F     .word _off003_8F21_00_00
- D 0 - - - 0x000F27 00:8F17: A1 8F     .word _off003_8FA1_00_01
- D 0 - - - 0x000F29 00:8F19: 21 90     .word _off003_9021_00_02
- D 0 - - - 0x000F2B 00:8F1B: A1 90     .word _off003_90A1_01_00
- D 0 - - - 0x000F2D 00:8F1D: C1 90     .word _off003_90C1_01_01
- D 0 - - - 0x000F2F 00:8F1F: E1 90     .word _off003_90E1_01_02



_off003_8F21_00_00:
; 00 
- D 0 - I - 0x000F31 00:8F21: 00 00     .word $0000 ; Y
- D 0 - I - 0x000F33 00:8F23: 00 04     .word $0400 ; X
; 04
- D 0 - I - 0x000F35 00:8F25: C4 00     .word $00C4 ; Y
- D 0 - I - 0x000F37 00:8F27: EC 03     .word $03EC ; X
; 08 
- D 0 - I - 0x000F39 00:8F29: 84 01     .word $0184 ; Y
- D 0 - I - 0x000F3B 00:8F2B: B0 03     .word $03B0 ; X
; 0C 
- D 0 - I - 0x000F3D 00:8F2D: 38 02     .word $0238 ; Y
- D 0 - I - 0x000F3F 00:8F2F: 50 03     .word $0350 ; X
; 10 
- D 0 - I - 0x000F41 00:8F31: D4 02     .word $02D4 ; Y
- D 0 - I - 0x000F43 00:8F33: D4 02     .word $02D4 ; X
; 14 
- D 0 - I - 0x000F45 00:8F35: 50 03     .word $0350 ; Y
- D 0 - I - 0x000F47 00:8F37: 38 02     .word $0238 ; X
; 18 
- D 0 - I - 0x000F49 00:8F39: B0 03     .word $03B0 ; Y
- D 0 - I - 0x000F4B 00:8F3B: 84 01     .word $0184 ; X
; 1C 
- D 0 - I - 0x000F4D 00:8F3D: EC 03     .word $03EC ; Y
- D 0 - I - 0x000F4F 00:8F3F: C4 00     .word $00C4 ; X
; 20 
- D 0 - I - 0x000F51 00:8F41: 00 04     .word $0400 ; Y
- D 0 - I - 0x000F53 00:8F43: 00 00     .word $0000 ; X
; 24 
- D 0 - I - 0x000F55 00:8F45: EC 03     .word $03EC ; Y
- D 0 - I - 0x000F57 00:8F47: 3C FF     .word $FF3C ; X
; 28 
- D 0 - I - 0x000F59 00:8F49: B0 03     .word $03B0 ; Y
- D 0 - I - 0x000F5B 00:8F4B: 7C FE     .word $FE7C ; X
; 2C 
- D 0 - I - 0x000F5D 00:8F4D: 50 03     .word $0350 ; Y
- D 0 - I - 0x000F5F 00:8F4F: C8 FD     .word $FDC8 ; X
; 30 
- D 0 - I - 0x000F61 00:8F51: D4 02     .word $02D4 ; Y
- D 0 - I - 0x000F63 00:8F53: 2C FD     .word $FD2C ; X
; 34 
- D 0 - I - 0x000F65 00:8F55: 38 02     .word $0238 ; Y
- D 0 - I - 0x000F67 00:8F57: B0 FC     .word $FCB0 ; X
; 38 
- D 0 - I - 0x000F69 00:8F59: 84 01     .word $0184 ; Y
- D 0 - I - 0x000F6B 00:8F5B: 50 FC     .word $FC50 ; X
; 3C 
- D 0 - I - 0x000F6D 00:8F5D: C4 00     .word $00C4 ; Y
- D 0 - I - 0x000F6F 00:8F5F: 14 FC     .word $FC14 ; X
; 40 
- D 0 - I - 0x000F71 00:8F61: 00 00     .word $0000 ; Y
- D 0 - I - 0x000F73 00:8F63: 00 FC     .word $FC00 ; X
; 44 
- D 0 - I - 0x000F75 00:8F65: 3C FF     .word $FF3C ; Y
- D 0 - I - 0x000F77 00:8F67: 14 FC     .word $FC14 ; X
; 48 
- D 0 - I - 0x000F79 00:8F69: 7C FE     .word $FE7C ; Y
- D 0 - I - 0x000F7B 00:8F6B: 50 FC     .word $FC50 ; X
; 4C 
- D 0 - I - 0x000F7D 00:8F6D: C8 FD     .word $FDC8 ; Y
- D 0 - I - 0x000F7F 00:8F6F: B0 FC     .word $FCB0 ; X
; 50 
- D 0 - I - 0x000F81 00:8F71: 2C FD     .word $FD2C ; Y
- D 0 - I - 0x000F83 00:8F73: 2C FD     .word $FD2C ; X
; 54 
- D 0 - I - 0x000F85 00:8F75: B0 FC     .word $FCB0 ; Y
- D 0 - I - 0x000F87 00:8F77: C8 FD     .word $FDC8 ; X
; 58 
- D 0 - I - 0x000F89 00:8F79: 50 FC     .word $FC50 ; Y
- D 0 - I - 0x000F8B 00:8F7B: 7C FE     .word $FE7C ; X
; 5C 
- D 0 - I - 0x000F8D 00:8F7D: 14 FC     .word $FC14 ; Y
- D 0 - I - 0x000F8F 00:8F7F: 3C FF     .word $FF3C ; X
; 60 
- D 0 - I - 0x000F91 00:8F81: 00 FC     .word $FC00 ; Y
- D 0 - I - 0x000F93 00:8F83: 00 00     .word $0000 ; X
; 64 
- D 0 - I - 0x000F95 00:8F85: 14 FC     .word $FC14 ; Y
- D 0 - I - 0x000F97 00:8F87: C4 00     .word $00C4 ; X
; 68 
- D 0 - I - 0x000F99 00:8F89: 50 FC     .word $FC50 ; Y
- D 0 - I - 0x000F9B 00:8F8B: 84 01     .word $0184 ; X
; 6C 
- D 0 - I - 0x000F9D 00:8F8D: B0 FC     .word $FCB0 ; Y
- D 0 - I - 0x000F9F 00:8F8F: 38 02     .word $0238 ; X
; 70 
- D 0 - I - 0x000FA1 00:8F91: 2C FD     .word $FD2C ; Y
- D 0 - I - 0x000FA3 00:8F93: D4 02     .word $02D4 ; X
; 74 
- D 0 - I - 0x000FA5 00:8F95: C8 FD     .word $FDC8 ; Y
- D 0 - I - 0x000FA7 00:8F97: 50 03     .word $0350 ; X
; 78 
- D 0 - I - 0x000FA9 00:8F99: 7C FE     .word $FE7C ; Y
- D 0 - I - 0x000FAB 00:8F9B: B0 03     .word $03B0 ; X
; 7C 
- D 0 - I - 0x000FAD 00:8F9D: 3C FF     .word $FF3C ; Y
- D 0 - I - 0x000FAF 00:8F9F: EC 03     .word $03EC ; X



_off003_8FA1_00_01:
; 00 
- D 0 - I - 0x000FB1 00:8FA1: 00 00     .word $0000 ; Y
- D 0 - I - 0x000FB3 00:8FA3: 80 05     .word $0580 ; X
; 04 
- D 0 - I - 0x000FB5 00:8FA5: 0D 01     .word $010D ; Y
- D 0 - I - 0x000FB7 00:8FA7: 64 05     .word $0564 ; X
; 08 
- D 0 - I - 0x000FB9 00:8FA9: 15 02     .word $0215 ; Y
- D 0 - I - 0x000FBB 00:8FAB: 12 05     .word $0512 ; X
; 0C 
- D 0 - I - 0x000FBD 00:8FAD: 0D 03     .word $030D ; Y
- D 0 - I - 0x000FBF 00:8FAF: 8E 04     .word $048E ; X
; 10 
- D 0 - I - 0x000FC1 00:8FB1: E3 03     .word $03E3 ; Y
- D 0 - I - 0x000FC3 00:8FB3: E3 03     .word $03E3 ; X
; 14 
- D 0 - I - 0x000FC5 00:8FB5: 8E 04     .word $048E ; Y
- D 0 - I - 0x000FC7 00:8FB7: 0D 03     .word $030D ; X
; 18 
- D 0 - I - 0x000FC9 00:8FB9: 12 05     .word $0512 ; Y
- D 0 - I - 0x000FCB 00:8FBB: 15 02     .word $0215 ; X
; 1C 
- D 0 - I - 0x000FCD 00:8FBD: 64 05     .word $0564 ; Y
- D 0 - I - 0x000FCF 00:8FBF: 0D 01     .word $010D ; X
; 20 
- D 0 - I - 0x000FD1 00:8FC1: 80 05     .word $0580 ; Y
- D 0 - I - 0x000FD3 00:8FC3: 00 00     .word $0000 ; X
; 24 
- D 0 - I - 0x000FD5 00:8FC5: 64 05     .word $0564 ; Y
- D 0 - I - 0x000FD7 00:8FC7: F3 FE     .word $FEF3 ; X
; 28 
- D 0 - I - 0x000FD9 00:8FC9: 12 05     .word $0512 ; Y
- D 0 - I - 0x000FDB 00:8FCB: EB FD     .word $FDEB ; X
; 2C 
- D 0 - I - 0x000FDD 00:8FCD: 8E 04     .word $048E ; Y
- D 0 - I - 0x000FDF 00:8FCF: F3 FC     .word $FCF3 ; X
; 30 
- D 0 - I - 0x000FE1 00:8FD1: E3 03     .word $03E3 ; Y
- D 0 - I - 0x000FE3 00:8FD3: 1D FC     .word $FC1D ; X
; 34 
- D 0 - I - 0x000FE5 00:8FD5: 0D 03     .word $030D ; Y
- D 0 - I - 0x000FE7 00:8FD7: 72 FB     .word $FB72 ; X
; 38 
- D 0 - I - 0x000FE9 00:8FD9: 15 02     .word $0215 ; Y
- D 0 - I - 0x000FEB 00:8FDB: EE FA     .word $FAEE ; X
; 3C 
- D 0 - I - 0x000FED 00:8FDD: 0D 01     .word $010D ; Y
- D 0 - I - 0x000FEF 00:8FDF: 9C FA     .word $FA9C ; X
; 40 
- D 0 - I - 0x000FF1 00:8FE1: 00 00     .word $0000 ; Y
- D 0 - I - 0x000FF3 00:8FE3: 80 FA     .word $FA80 ; X
; 44 
- D 0 - I - 0x000FF5 00:8FE5: F3 FE     .word $FEF3 ; Y
- D 0 - I - 0x000FF7 00:8FE7: 9C FA     .word $FA9C ; X
; 48 
- D 0 - I - 0x000FF9 00:8FE9: EB FD     .word $FDEB ; Y
- D 0 - I - 0x000FFB 00:8FEB: EE FA     .word $FAEE ; X
; 4C 
- D 0 - I - 0x000FFD 00:8FED: F3 FC     .word $FCF3 ; Y
- D 0 - I - 0x000FFF 00:8FEF: 72 FB     .word $FB72 ; X
; 50 
- D 0 - I - 0x001001 00:8FF1: 1D FC     .word $FC1D ; Y
- D 0 - I - 0x001003 00:8FF3: 1D FC     .word $FC1D ; X
; 54 
- D 0 - I - 0x001005 00:8FF5: 72 FB     .word $FB72 ; Y
- D 0 - I - 0x001007 00:8FF7: F3 FC     .word $FCF3 ; X
; 58 
- D 0 - I - 0x001009 00:8FF9: EE FA     .word $FAEE ; Y
- D 0 - I - 0x00100B 00:8FFB: EB FD     .word $FDEB ; X
; 5C 
- D 0 - I - 0x00100D 00:8FFD: 9C FA     .word $FA9C ; Y
- D 0 - I - 0x00100F 00:8FFF: F3 FE     .word $FEF3 ; X
; 60 
- D 0 - I - 0x001011 00:9001: 80 FA     .word $FA80 ; Y
- D 0 - I - 0x001013 00:9003: 00 00     .word $0000 ; X
; 64 
- D 0 - I - 0x001015 00:9005: 9C FA     .word $FA9C ; Y
- D 0 - I - 0x001017 00:9007: 0D 01     .word $010D ; X
; 68 
- D 0 - I - 0x001019 00:9009: EE FA     .word $FAEE ; Y
- D 0 - I - 0x00101B 00:900B: 15 02     .word $0215 ; X
; 6C 
- D 0 - I - 0x00101D 00:900D: 72 FB     .word $FB72 ; Y
- D 0 - I - 0x00101F 00:900F: 0D 03     .word $030D ; X
; 70 
- D 0 - I - 0x001021 00:9011: 1D FC     .word $FC1D ; Y
- D 0 - I - 0x001023 00:9013: E3 03     .word $03E3 ; X
; 74 
- D 0 - I - 0x001025 00:9015: F3 FC     .word $FCF3 ; Y
- D 0 - I - 0x001027 00:9017: 8E 04     .word $048E ; X
; 78 
- D 0 - I - 0x001029 00:9019: EB FD     .word $FDEB ; Y
- D 0 - I - 0x00102B 00:901B: 12 05     .word $0512 ; X
; 7C 
- D 0 - I - 0x00102D 00:901D: F3 FE     .word $FEF3 ; Y
- D 0 - I - 0x00102F 00:901F: 64 05     .word $0564 ; X



_off003_9021_00_02:
; 00 
- D 0 - I - 0x001031 00:9021: 00 00     .word $0000 ; Y
- D 0 - I - 0x001033 00:9023: 00 07     .word $0700 ; X
; 04 
- - - - - - 0x001035 00:9025: 57 01     .word $0157 ; Y
- - - - - - 0x001037 00:9027: DD 06     .word $06DD ; X
; 08 
- - - - - - 0x001039 00:9029: A7 02     .word $02A7 ; Y
- - - - - - 0x00103B 00:902B: 74 06     .word $0674 ; X
; 0C 
- - - - - - 0x00103D 00:902D: E2 03     .word $03E2 ; Y
- - - - - - 0x00103F 00:902F: CC 05     .word $05CC ; X
; 10 
- D 0 - I - 0x001041 00:9031: F3 04     .word $04F3 ; Y
- D 0 - I - 0x001043 00:9033: F3 04     .word $04F3 ; X
; 14 
- - - - - - 0x001045 00:9035: CC 05     .word $05CC ; Y
- - - - - - 0x001047 00:9037: E2 03     .word $03E2 ; X
; 18 
- - - - - - 0x001049 00:9039: 74 06     .word $0674 ; Y
- - - - - - 0x00104B 00:903B: A7 02     .word $02A7 ; X
; 1C 
- - - - - - 0x00104D 00:903D: DD 06     .word $06DD ; Y
- - - - - - 0x00104F 00:903F: 57 01     .word $0157 ; X
; 20 
- D 0 - I - 0x001051 00:9041: 00 07     .word $0700 ; Y
- D 0 - I - 0x001053 00:9043: 00 00     .word $0000 ; X
; 24 
- - - - - - 0x001055 00:9045: DD 06     .word $06DD ; Y
- - - - - - 0x001057 00:9047: A9 FE     .word $FEA9 ; X
; 28 
- - - - - - 0x001059 00:9049: 74 06     .word $0674 ; Y
- - - - - - 0x00105B 00:904B: 59 FD     .word $FD59 ; X
; 2C 
- - - - - - 0x00105D 00:904D: CC 05     .word $05CC ; Y
- - - - - - 0x00105F 00:904F: 1E FC     .word $FC1E ; X
; 30 
- D 0 - I - 0x001061 00:9051: F3 04     .word $04F3 ; Y
- D 0 - I - 0x001063 00:9053: 0D FB     .word $FB0D ; X
; 34 
- - - - - - 0x001065 00:9055: E2 03     .word $03E2 ; Y
- - - - - - 0x001067 00:9057: 34 FA     .word $FA34 ; X
; 38 
- - - - - - 0x001069 00:9059: A7 02     .word $02A7 ; Y
- - - - - - 0x00106B 00:905B: 8C F9     .word $F98C ; X
; 3C 
- - - - - - 0x00106D 00:905D: 57 01     .word $0157 ; Y
- - - - - - 0x00106F 00:905F: 23 F9     .word $F923 ; X
; 40 
- D 0 - I - 0x001071 00:9061: 00 00     .word $0000 ; Y
- D 0 - I - 0x001073 00:9063: 00 F9     .word $F900 ; X
; 44 
- - - - - - 0x001075 00:9065: A9 FE     .word $FEA9 ; Y
- - - - - - 0x001077 00:9067: 23 F9     .word $F923 ; X
; 48 
- - - - - - 0x001079 00:9069: 59 FD     .word $FD59 ; Y
- - - - - - 0x00107B 00:906B: 8C F9     .word $F98C ; X
; 4C 
- - - - - - 0x00107D 00:906D: 1E FC     .word $FC1E ; Y
- - - - - - 0x00107F 00:906F: 34 FA     .word $FA34 ; X
; 50 
- D 0 - I - 0x001081 00:9071: 0D FB     .word $FB0D ; Y
- D 0 - I - 0x001083 00:9073: 0D FB     .word $FB0D ; X
; 54 
- - - - - - 0x001085 00:9075: 34 FA     .word $FA34 ; Y
- - - - - - 0x001087 00:9077: 1E FC     .word $FC1E ; X
; 58 
- - - - - - 0x001089 00:9079: 8C F9     .word $F98C ; Y
- - - - - - 0x00108B 00:907B: 59 FD     .word $FD59 ; X
; 5C 
- - - - - - 0x00108D 00:907D: 23 F9     .word $F923 ; Y
- - - - - - 0x00108F 00:907F: A9 FE     .word $FEA9 ; X
; 60 
- D 0 - I - 0x001091 00:9081: 00 F9     .word $F900 ; Y
- D 0 - I - 0x001093 00:9083: 00 00     .word $0000 ; X
; 64 
- - - - - - 0x001095 00:9085: 23 F9     .word $F923 ; Y
- - - - - - 0x001097 00:9087: 57 01     .word $0157 ; X
; 68 
- - - - - - 0x001099 00:9089: 8C F9     .word $F98C ; Y
- - - - - - 0x00109B 00:908B: A7 02     .word $02A7 ; X
; 6C 
- - - - - - 0x00109D 00:908D: 34 FA     .word $FA34 ; Y
- - - - - - 0x00109F 00:908F: E2 03     .word $03E2 ; X
; 70 
- D 0 - I - 0x0010A1 00:9091: 0D FB     .word $FB0D ; Y
- D 0 - I - 0x0010A3 00:9093: F3 04     .word $04F3 ; X
; 74 
- - - - - - 0x0010A5 00:9095: 1E FC     .word $FC1E ; Y
- - - - - - 0x0010A7 00:9097: CC 05     .word $05CC ; X
; 78 
- - - - - - 0x0010A9 00:9099: 59 FD     .word $FD59 ; Y
- - - - - - 0x0010AB 00:909B: 74 06     .word $0674 ; X
; 7C
- - - - - - 0x0010AD 00:909D: A9 FE     .word $FEA9 ; Y
- - - - - - 0x0010AF 00:909F: DD 06     .word $06DD ; X



_off003_90A1_01_00:
; 00 
- D 0 - I - 0x0010B1 00:90A1: 00 00     .word $0000 ; Y
- D 0 - I - 0x0010B3 00:90A3: 00 04     .word $0400 ; X
; 04 
- D 0 - I - 0x0010B5 00:90A5: D0 01     .word $01D0 ; Y
- D 0 - I - 0x0010B7 00:90A7: 78 03     .word $0378 ; X
; 08 
- - - - - - 0x0010B9 00:90A9: 00 04     .word $0400 ; Y
- - - - - - 0x0010BB 00:90AB: 00 00     .word $0000 ; X
; 0C 
- D 0 - I - 0x0010BD 00:90AD: D0 01     .word $01D0 ; Y
- D 0 - I - 0x0010BF 00:90AF: 88 FC     .word $FC88 ; X
; 10 
- D 0 - I - 0x0010C1 00:90B1: 00 00     .word $0000 ; Y
- D 0 - I - 0x0010C3 00:90B3: 00 FC     .word $FC00 ; X
; 14 
- D 0 - I - 0x0010C5 00:90B5: 30 FE     .word $FE30 ; Y
- D 0 - I - 0x0010C7 00:90B7: 88 FC     .word $FC88 ; X
; 18 
- D 0 - I - 0x0010C9 00:90B9: 00 FC     .word $FC00 ; Y
- D 0 - I - 0x0010CB 00:90BB: 00 00     .word $0000 ; X
; 1C 
- D 0 - I - 0x0010CD 00:90BD: 30 FE     .word $FE30 ; Y
- D 0 - I - 0x0010CF 00:90BF: 78 03     .word $0378 ; X



_off003_90C1_01_01:
; 00 
- D 0 - I - 0x0010D1 00:90C1: 00 00     .word $0000 ; Y
- D 0 - I - 0x0010D3 00:90C3: 80 05     .word $0580 ; X
; 04 
- D 0 - I - 0x0010D5 00:90C5: 7E 02     .word $027E ; Y
- D 0 - I - 0x0010D7 00:90C7: C5 04     .word $04C5 ; X
; 08 
- D 0 - I - 0x0010D9 00:90C9: 80 05     .word $0580 ; Y
- D 0 - I - 0x0010DB 00:90CB: 00 00     .word $0000 ; X
; 0C 
- D 0 - I - 0x0010DD 00:90CD: 7E 02     .word $027E ; Y
- D 0 - I - 0x0010DF 00:90CF: 3B FB     .word $FB3B ; X
; 10 
- D 0 - I - 0x0010E1 00:90D1: 00 00     .word $0000 ; Y
- D 0 - I - 0x0010E3 00:90D3: 80 FA     .word $FA80 ; X
; 14 
- D 0 - I - 0x0010E5 00:90D5: 82 FD     .word $FD82 ; Y
- D 0 - I - 0x0010E7 00:90D7: 3B FB     .word $FB3B ; X
; 18 
- D 0 - I - 0x0010E9 00:90D9: 80 FA     .word $FA80 ; Y
- D 0 - I - 0x0010EB 00:90DB: 00 00     .word $0000 ; X
; 1C 
- D 0 - I - 0x0010ED 00:90DD: 82 FD     .word $FD82 ; Y
- D 0 - I - 0x0010EF 00:90DF: C5 04     .word $04C5 ; X



_off003_90E1_01_02:
; 00 
- D 0 - I - 0x0010F1 00:90E1: 00 00     .word $0000 ; Y
- D 0 - I - 0x0010F3 00:90E3: 00 07     .word $0700 ; X
; 04 
- D 0 - I - 0x0010F5 00:90E5: 2C 03     .word $032C ; Y
- D 0 - I - 0x0010F7 00:90E7: 12 06     .word $0612 ; X
; 08 
- - - - - - 0x0010F9 00:90E9: 00 07     .word $0700 ; Y
- - - - - - 0x0010FB 00:90EB: 00 00     .word $0000 ; X
; 0C 
- D 0 - I - 0x0010FD 00:90ED: 2C 03     .word $032C ; Y
- D 0 - I - 0x0010FF 00:90EF: EE F9     .word $F9EE ; X
; 10 
- D 0 - I - 0x001101 00:90F1: 00 00     .word $0000 ; Y
- D 0 - I - 0x001103 00:90F3: 00 F9     .word $F900 ; X
; 14 
- D 0 - I - 0x001105 00:90F5: D4 FC     .word $FCD4 ; Y
- D 0 - I - 0x001107 00:90F7: EE F9     .word $F9EE ; X
; 18 
- D 0 - I - 0x001109 00:90F9: 00 F9     .word $F900 ; Y
- D 0 - I - 0x00110B 00:90FB: 00 00     .word $0000 ; X
; 1C 
- D 0 - I - 0x00110D 00:90FD: D4 FC     .word $FCD4 ; Y
- D 0 - I - 0x00110F 00:90FF: 12 06     .word $0612 ; X


; bzk garbage
- - - - - - 0x001111 00:9101: 00        .byte $00   ; 
- - - - - - 0x001112 00:9102: 21        .byte $21   ; 
- - - - - - 0x001113 00:9103: 42        .byte $42   ; 
- - - - - - 0x001114 00:9104: 61        .byte $61   ; 
- - - - - - 0x001115 00:9105: 7F        .byte $7F   ; 
- - - - - - 0x001116 00:9106: 9B        .byte $9B   ; 
- - - - - - 0x001117 00:9107: B5        .byte $B5   ; 
- - - - - - 0x001118 00:9108: CB        .byte $CB   ; 
- - - - - - 0x001119 00:9109: DD        .byte $DD   ; 
- - - - - - 0x00111A 00:910A: EC        .byte $EC   ; 
- - - - - - 0x00111B 00:910B: F7        .byte $F7   ; 
- - - - - - 0x00111C 00:910C: FD        .byte $FD   ; 
- - - - - - 0x00111D 00:910D: FF        .byte $FF   ; 
- - - - - - 0x00111E 00:910E: FD        .byte $FD   ; 
- - - - - - 0x00111F 00:910F: F7        .byte $F7   ; 
- - - - - - 0x001120 00:9110: EC        .byte $EC   ; 
- - - - - - 0x001121 00:9111: DD        .byte $DD   ; 
- - - - - - 0x001122 00:9112: CB        .byte $CB   ; 
- - - - - - 0x001123 00:9113: B5        .byte $B5   ; 
- - - - - - 0x001124 00:9114: 9B        .byte $9B   ; 
- - - - - - 0x001125 00:9115: 80        .byte $80   ; 
- - - - - - 0x001126 00:9116: 61        .byte $61   ; 
- - - - - - 0x001127 00:9117: 42        .byte $42   ; 
- - - - - - 0x001128 00:9118: 21        .byte $21   ; 



tbl_9119:
;                                              --------------------- pos_Y_hi
;                                              |    ---------------- pos_X_hi
;                                              |    |    ----------- offset for a different table
;                                              |    |    |    ------ spr_attr
;                                              |    |    |    |
- D 0 - - - 0x001129 00:9119: F0        .byte $F0, $02, $60, $02   ; 00 
- D 0 - - - 0x00112D 00:911D: F3        .byte $F3, $06, $70, $02   ; 01 
- D 0 - - - 0x001131 00:9121: FE        .byte $FE, $08, $00, $02   ; 02 
- D 0 - - - 0x001135 00:9125: 03        .byte $03, $08, $10, $02   ; 03 
- D 0 - - - 0x001139 00:9129: 06        .byte $06, $08, $00, $02   ; 04 
- D 0 - - - 0x00113D 00:912D: 0B        .byte $0B, $08, $00, $02   ; 05 
- D 0 - - - 0x001141 00:9131: 04        .byte $04, $00, $20, $02   ; 06 
- D 0 - - - 0x001145 00:9135: 0B        .byte $0B, $F8, $40, $42   ; 07 
- D 0 - - - 0x001149 00:9139: 06        .byte $06, $F8, $40, $42   ; 08 
- D 0 - - - 0x00114D 00:913D: 03        .byte $03, $F8, $30, $42   ; 09 
- D 0 - - - 0x001151 00:9141: FE        .byte $FE, $F8, $40, $42   ; 0A 
- D 0 - - - 0x001155 00:9145: F3        .byte $F3, $FA, $50, $42   ; 0B 
- D 0 - - - 0x001159 00:9149: F0        .byte $F0, $FE, $60, $42   ; 0C 
; 
- D 0 - - - 0x00115D 00:914D: F0        .byte $F0, $02, $18, $02   ; 00 
- D 0 - - - 0x001161 00:9151: F5        .byte $F5, $06, $1C, $02   ; 01 
- D 0 - - - 0x001165 00:9155: FE        .byte $FE, $08, $00, $02   ; 02 
- D 0 - - - 0x001169 00:9159: 03        .byte $03, $08, $04, $02   ; 03 
- D 0 - - - 0x00116D 00:915D: 06        .byte $06, $08, $00, $02   ; 04 
- - - - - - 0x001171 00:9161: 0B        .byte $0B, $08, $00, $02   ; 05 
- D 0 - - - 0x001175 00:9165: 04        .byte $04, $00, $08, $02   ; 06 
- D 0 - - - 0x001179 00:9169: 0B        .byte $0B, $F8, $10, $42   ; 07 
- D 0 - - - 0x00117D 00:916D: 06        .byte $06, $F8, $10, $42   ; 08 
- D 0 - - - 0x001181 00:9171: 03        .byte $03, $F8, $0C, $42   ; 09 
- D 0 - - - 0x001185 00:9175: FE        .byte $FE, $F8, $10, $42   ; 0A 
- D 0 - - - 0x001189 00:9179: F5        .byte $F5, $FA, $14, $42   ; 0B 
- D 0 - - - 0x00118D 00:917D: F0        .byte $F0, $FE, $18, $42   ; 0C 



loc_0x001191:
C D 0 - - - 0x001191 00:9181: A2 0F     LDX #$0F
bra_9183_loop:
C - - - - - 0x001193 00:9183: 20 B1 91  JSR sub_91B1
C - - - - - 0x001196 00:9186: CA        DEX
C - - - - - 0x001197 00:9187: 10 FA     BPL bra_9183_loop
loc_0x001199:
C D 0 - - - 0x001199 00:9189: A0 07     LDY #$07
C - - - - - 0x00119B 00:918B: A2 0F     LDX #$0F
C - - - - - 0x00119D 00:918D: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00119F 00:918F: 4A        LSR
C - - - - - 0x0011A0 00:9190: B0 01     BCS bra_9193
C - - - - - 0x0011A2 00:9192: CA        DEX
bra_9193:
bra_9193_loop:
C - - - - - 0x0011A3 00:9193: BD 68 05  LDA ram_0568_plr_bullet,X
C - - - - - 0x0011A6 00:9196: 99 00 05  STA ram_anim_id_bullet,Y
C - - - - - 0x0011A9 00:9199: BD 98 05  LDA ram_plr_bullet_attr_spr,X 
C - - - - - 0x0011AC 00:919C: 99 4E 05  STA ram_attr_spr_bullet,Y
C - - - - - 0x0011AF 00:919F: BD 78 05  LDA ram_plr_bullet_pos_Y_hi,X
C - - - - - 0x0011B2 00:91A2: 99 1A 05  STA ram_pos_Y_hi_bullet,Y
C - - - - - 0x0011B5 00:91A5: BD 88 05  LDA ram_plr_bullet_pos_X_hi,X
C - - - - - 0x0011B8 00:91A8: 99 34 05  STA ram_pos_X_hi_bullet,Y
C - - - - - 0x0011BB 00:91AB: CA        DEX
C - - - - - 0x0011BC 00:91AC: CA        DEX
C - - - - - 0x0011BD 00:91AD: 88        DEY
C - - - - - 0x0011BE 00:91AE: 10 E3     BPL bra_9193_loop
C - - - - - 0x0011C0 00:91B0: 60        RTS



sub_91B1:
C - - - - - 0x0011C1 00:91B1: BD B8 05  LDA ram_plr_bullet_anim_id,X
C - - - - - 0x0011C4 00:91B4: 29 0F     AND #$0F
C - - - - - 0x0011C6 00:91B6: 85 13     STA ram_0013
C - - - - - 0x0011C8 00:91B8: BC A8 05  LDY ram_05A8_plr_bullet,X
C - - - - - 0x0011CB 00:91BB: D0 28     BNE bra_91E5
bra_91BD:
C - - - - - 0x0011CD 00:91BD: A9 00     LDA #$00
C - - - - - 0x0011CF 00:91BF: 9D 38 06  STA ram_0638_plr_bullet_hitbox_index,X
C - - - - - 0x0011D2 00:91C2: 60        RTS
bra_91C3:
C - - - - - 0x0011D3 00:91C3: 20 8C 92  JSR sub_928C
C - - - - - 0x0011D6 00:91C6: DE 28 06  DEC ram_0628_plr_bullet,X
C - - - - - 0x0011D9 00:91C9: D0 F2     BNE bra_91BD
C - - - - - 0x0011DB 00:91CB: A9 01     LDA #$01
C - - - - - 0x0011DD 00:91CD: 9D A8 05  STA ram_05A8_plr_bullet,X
C - - - - - 0x0011E0 00:91D0: D0 EB     BNE bra_91BD    ; jmp
bra_91D2:
C - - - - - 0x0011E2 00:91D2: 88        DEY
C - - - - - 0x0011E3 00:91D3: D0 EE     BNE bra_91C3
C - - - - - 0x0011E5 00:91D5: 20 8C 92  JSR sub_928C
C - - - - - 0x0011E8 00:91D8: A9 04     LDA #$04
C - - - - - 0x0011EA 00:91DA: 9D 68 05  STA ram_0568_plr_bullet,X
C - - - - - 0x0011ED 00:91DD: DE 28 06  DEC ram_0628_plr_bullet,X
C - - - - - 0x0011F0 00:91E0: D0 DB     BNE bra_91BD
bra_91E2:
C - - - - - 0x0011F2 00:91E2: 4C 01 F8  JMP loc_0x01F811
bra_91E5:
C - - - - - 0x0011F5 00:91E5: 88        DEY
C - - - - - 0x0011F6 00:91E6: D0 EA     BNE bra_91D2
C - - - - - 0x0011F8 00:91E8: FE 28 06  INC ram_0628_plr_bullet,X
C - - - - - 0x0011FB 00:91EB: A5 5D     LDA ram_005D
C - - - - - 0x0011FD 00:91ED: F0 07     BEQ bra_91F6
C - - - - - 0x0011FF 00:91EF: BD 28 06  LDA ram_0628_plr_bullet,X
C - - - - - 0x001202 00:91F2: C9 1A     CMP #$1A
C - - - - - 0x001204 00:91F4: B0 6B     BCS bra_9261
bra_91F6:
C - - - - - 0x001206 00:91F6: 20 EF 92  JSR sub_92EF
C - - - - - 0x001209 00:91F9: A9 9F     LDA #$9F
C - - - - - 0x00120B 00:91FB: 9D 38 06  STA ram_0638_plr_bullet_hitbox_index,X
C - - - - - 0x00120E 00:91FE: BD C8 05  LDA ram_plr_bullet_pos_Y_lo,X
C - - - - - 0x001211 00:9201: 18        CLC
C - - - - - 0x001212 00:9202: 7D E8 05  ADC ram_plr_bullet_spd_Y_lo,X
C - - - - - 0x001215 00:9205: 9D C8 05  STA ram_plr_bullet_pos_Y_lo,X
C - - - - - 0x001218 00:9208: BD 78 05  LDA ram_plr_bullet_pos_Y_hi,X
C - - - - - 0x00121B 00:920B: 7D 58 06  ADC ram_plr_bullet_spd_Y_hi,X
C - - - - - 0x00121E 00:920E: 38        SEC
C - - - - - 0x00121F 00:920F: E5 72     SBC ram_cam_spd_Y
C - - - - - 0x001221 00:9211: 9D 78 05  STA ram_plr_bullet_pos_Y_hi,X
C - - - - - 0x001224 00:9214: C9 F0     CMP #$F0
C - - - - - 0x001226 00:9216: B0 CA     BCS bra_91E2
C - - - - - 0x001228 00:9218: BD D8 05  LDA ram_plr_bullet_pos_X_lo,X
C - - - - - 0x00122B 00:921B: 7D 08 06  ADC ram_plr_bullet_spd_X_lo,X
C - - - - - 0x00122E 00:921E: 9D D8 05  STA ram_plr_bullet_pos_X_lo,X
C - - - - - 0x001231 00:9221: BD 88 05  LDA ram_plr_bullet_pos_X_hi,X
C - - - - - 0x001234 00:9224: 7D 18 06  ADC ram_plr_bullet_spd_X_hi,X
C - - - - - 0x001237 00:9227: 9D 88 05  STA ram_plr_bullet_pos_X_hi,X
C - - - - - 0x00123A 00:922A: C9 08     CMP #$08
C - - - - - 0x00123C 00:922C: 90 B4     BCC bra_91E2
C - - - - - 0x00123E 00:922E: BC 28 06  LDY ram_0628_plr_bullet,X
C - - - - - 0x001241 00:9231: 88        DEY
C - - - - - 0x001242 00:9232: F0 4D     BEQ bra_9281_RTS
C - - - - - 0x001244 00:9234: A5 13     LDA ram_0013
C - - - - - 0x001246 00:9236: C9 06     CMP #$06
C - - - - - 0x001248 00:9238: F0 48     BEQ bra_9282
C - - - - - 0x00124A 00:923A: BD 78 05  LDA ram_plr_bullet_pos_Y_hi,X
C - - - - - 0x00124D 00:923D: C9 0C     CMP #$0C
C - - - - - 0x00124F 00:923F: 90 40     BCC bra_9281_RTS
C - - - - - 0x001251 00:9241: E9 04     SBC #$04
C - - - - - 0x001253 00:9243: A8        TAY
C - - - - - 0x001254 00:9244: BD 88 05  LDA ram_plr_bullet_pos_X_hi,X
C - - - - - 0x001257 00:9247: 20 AA BA  JSR sub_0x007ABA_calculate_surface_type
C - - - - - 0x00125A 00:924A: C9 06     CMP #$06
C - - - - - 0x00125C 00:924C: 90 06     BCC bra_9254
C - - - - - 0x00125E 00:924E: A4 8F     LDY ram_008F
C - - - - - 0x001260 00:9250: D0 02     BNE bra_9254
C - - - - - 0x001262 00:9252: A9 00     LDA #$00
bra_9254:
C - - - - - 0x001264 00:9254: A8        TAY
C - - - - - 0x001265 00:9255: B9 CC F8  LDA tbl_0x01F8DC,Y
C - - - - - 0x001268 00:9258: F0 27     BEQ bra_9281_RTS
C - - - - - 0x00126A 00:925A: C0 03     CPY #$03
C - - - - - 0x00126C 00:925C: D0 03     BNE bra_9261
C - - - - - 0x00126E 00:925E: 20 3B 93  JSR sub_933B
bra_9261:
sub_0x001271:
C - - - - - 0x001271 00:9261: A0 03     LDY #$03
C - - - - - 0x001273 00:9263: BD B8 05  LDA ram_plr_bullet_anim_id,X
C - - - - - 0x001276 00:9266: 29 0F     AND #$0F
C - - - - - 0x001278 00:9268: C9 04     CMP #$04
C - - - - - 0x00127A 00:926A: F0 2A     BEQ bra_9296
C - - - - - 0x00127C 00:926C: A0 07     LDY #$07
C - - - - - 0x00127E 00:926E: C9 05     CMP #$05
C - - - - - 0x001280 00:9270: F0 24     BEQ bra_9296
loc_9272:
C D 0 - - - 0x001282 00:9272: A9 06     LDA #$06
C - - - - - 0x001284 00:9274: 9D 28 06  STA ram_0628_plr_bullet,X
C - - - - - 0x001287 00:9277: A9 02     LDA #$02
C - - - - - 0x001289 00:9279: 9D A8 05  STA ram_05A8_plr_bullet,X
C - - - - - 0x00128C 00:927C: A9 00     LDA #$00
C - - - - - 0x00128E 00:927E: 9D 38 06  STA ram_0638_plr_bullet_hitbox_index,X
bra_9281_RTS:
C - - - - - 0x001291 00:9281: 60        RTS
bra_9282:
C - - - - - 0x001292 00:9282: BD 28 06  LDA ram_0628_plr_bullet,X
C - - - - - 0x001295 00:9285: C9 0A     CMP #$0A
C - - - - - 0x001297 00:9287: 90 F8     BCC bra_9281_RTS
C - - - - - 0x001299 00:9289: 4C 01 F8  JMP loc_0x01F811
sub_928C:
C - - - - - 0x00129C 00:928C: BD 78 05  LDA ram_plr_bullet_pos_Y_hi,X
C - - - - - 0x00129F 00:928F: 38        SEC
C - - - - - 0x0012A0 00:9290: E5 72     SBC ram_cam_spd_Y
C - - - - - 0x0012A2 00:9292: 9D 78 05  STA ram_plr_bullet_pos_Y_hi,X
C - - - - - 0x0012A5 00:9295: 60        RTS
bra_9296:
C - - - - - 0x0012A6 00:9296: 86 10     STX ram_0010
C - - - - - 0x0012A8 00:9298: 84 00     STY ram_0000
bra_929A_loop:
C - - - - - 0x0012AA 00:929A: A6 10     LDX ram_0010
C - - - - - 0x0012AC 00:929C: BD B8 05  LDA ram_plr_bullet_anim_id,X
C - - - - - 0x0012AF 00:929F: 29 40     AND #$40
C - - - - - 0x0012B1 00:92A1: 85 12     STA ram_0012
C - - - - - 0x0012B3 00:92A3: A9 06     LDA #$06
C - - - - - 0x0012B5 00:92A5: 85 0F     STA ram_000F
C - - - - - 0x0012B7 00:92A7: 2A        ROL
C - - - - - 0x0012B8 00:92A8: 2A        ROL
C - - - - - 0x0012B9 00:92A9: 2A        ROL
C - - - - - 0x0012BA 00:92AA: 29 01     AND #$01
C - - - - - 0x0012BC 00:92AC: AA        TAX
C - - - - - 0x0012BD 00:92AD: A0 06     LDY #$06
C - - - - - 0x0012BF 00:92AF: 20 D9 8D  JSR sub_8DD9
C - - - - - 0x0012C2 00:92B2: B0 07     BCS bra_92BB
C - - - - - 0x0012C4 00:92B4: 20 C0 92  JSR sub_92C0
C - - - - - 0x0012C7 00:92B7: C6 00     DEC ram_0000
C - - - - - 0x0012C9 00:92B9: 10 DF     BPL bra_929A_loop
bra_92BB:
C - - - - - 0x0012CB 00:92BB: A6 10     LDX ram_0010
C - - - - - 0x0012CD 00:92BD: 4C 72 92  JMP loc_9272



sub_92C0:
C - - - - - 0x0012D0 00:92C0: A4 10     LDY ram_0010
C - - - - - 0x0012D2 00:92C2: B9 78 05  LDA ram_plr_bullet_pos_Y_hi,Y
C - - - - - 0x0012D5 00:92C5: 85 0C     STA ram_000C
C - - - - - 0x0012D7 00:92C7: B9 88 05  LDA ram_plr_bullet_pos_X_hi,Y
C - - - - - 0x0012DA 00:92CA: 85 0D     STA ram_000D
C - - - - - 0x0012DC 00:92CC: A4 00     LDY ram_0000
C - - - - - 0x0012DE 00:92CE: B9 E7 92  LDA tbl_92E7,Y
C - - - - - 0x0012E1 00:92D1: 85 0A     STA ram_000A
C - - - - - 0x0012E3 00:92D3: A5 0C     LDA ram_000C
C - - - - - 0x0012E5 00:92D5: 9D 78 05  STA ram_plr_bullet_pos_Y_hi,X
C - - - - - 0x0012E8 00:92D8: A5 0D     LDA ram_000D
C - - - - - 0x0012EA 00:92DA: 9D 88 05  STA ram_plr_bullet_pos_X_hi,X
C - - - - - 0x0012ED 00:92DD: A9 02     LDA #$02
C - - - - - 0x0012EF 00:92DF: 9D 98 05  STA ram_plr_bullet_attr_spr,X
C - - - - - 0x0012F2 00:92E2: A9 00     LDA #$00
C - - - - - 0x0012F4 00:92E4: 4C 6C 8E  JMP loc_8E6C



tbl_92E7:
- D 0 - - - 0x0012F7 00:92E7: 30        .byte $30   ; 00 
- D 0 - - - 0x0012F8 00:92E8: 50        .byte $50   ; 01 
- D 0 - - - 0x0012F9 00:92E9: 10        .byte $10   ; 02 
- D 0 - - - 0x0012FA 00:92EA: 70        .byte $70   ; 03 
- D 0 - - - 0x0012FB 00:92EB: 20        .byte $20   ; 04 
- D 0 - - - 0x0012FC 00:92EC: 60        .byte $60   ; 05 
- D 0 - - - 0x0012FD 00:92ED: 40        .byte $40   ; 06 
- D 0 - - - 0x0012FE 00:92EE: 00        .byte $00   ; 07 



sub_92EF:
C - - - - - 0x0012FF 00:92EF: A5 13     LDA ram_0013
C - - - - - 0x001301 00:92F1: C9 03     CMP #$03
C - - - - - 0x001303 00:92F3: 90 11     BCC bra_9306_RTS
C - - - - - 0x001305 00:92F5: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- - - - - - 0x001308 00:92F8: 06 93     .word ofs_005_9306_00_RTS
- - - - - - 0x00130A 00:92FA: 06 93     .word ofs_005_9306_01_RTS
- - - - - - 0x00130C 00:92FC: 06 93     .word ofs_005_9306_02_RTS
- D 0 - I - 0x00130E 00:92FE: 07 93     .word ofs_005_9307_03
- D 0 - I - 0x001310 00:9300: 19 93     .word ofs_005_9319_04
- D 0 - I - 0x001312 00:9302: 26 93     .word ofs_005_9326_05
- D 0 - I - 0x001314 00:9304: 06 93     .word ofs_005_9306_06_RTS
bra_9306_RTS:
ofs_005_9306_00_RTS:
ofs_005_9306_01_RTS:
ofs_005_9306_02_RTS:
ofs_005_9306_06_RTS:
C - - - - - 0x001316 00:9306: 60        RTS



ofs_005_9307_03:
C - - J - - 0x001317 00:9307: BC 48 06  LDY ram_plr_bullet_dir,X
C - - - - - 0x00131A 00:930A: B9 11 93  LDA tbl_9311,Y
C - - - - - 0x00131D 00:930D: 9D 68 05  STA ram_0568_plr_bullet,X
C - - - - - 0x001320 00:9310: 60        RTS



tbl_9311:
;     06
;   05  07
; 04      00
;   03  01
;     02
- D 0 - - - 0x001321 00:9311: 16        .byte $16   ; 00 
- D 0 - - - 0x001322 00:9312: 18        .byte $18   ; 01 
- D 0 - - - 0x001323 00:9313: 15        .byte $15   ; 02 
- D 0 - - - 0x001324 00:9314: 18        .byte $18   ; 03 
- D 0 - - - 0x001325 00:9315: 16        .byte $16   ; 04 
- D 0 - - - 0x001326 00:9316: 17        .byte $17   ; 05 
- D 0 - - - 0x001327 00:9317: 15        .byte $15   ; 06 
- D 0 - - - 0x001328 00:9318: 17        .byte $17   ; 07 



ofs_005_9319_04:
C - - J - - 0x001329 00:9319: A9 19     LDA #$19
C - - - - - 0x00132B 00:931B: BC 28 06  LDY ram_0628_plr_bullet,X
C - - - - - 0x00132E 00:931E: C0 04     CPY #$04
C - - - - - 0x001330 00:9320: 90 15     BCC bra_9337
C - - - - - 0x001332 00:9322: A9 03     LDA #$03
C - - - - - 0x001334 00:9324: B0 11     BCS bra_9337    ; jmp



ofs_005_9326_05:
C - - J - - 0x001336 00:9326: A9 19     LDA #$19
C - - - - - 0x001338 00:9328: BC 28 06  LDY ram_0628_plr_bullet,X
C - - - - - 0x00133B 00:932B: C0 04     CPY #$04
C - - - - - 0x00133D 00:932D: 90 08     BCC bra_9337
C - - - - - 0x00133F 00:932F: A9 03     LDA #$03
C - - - - - 0x001341 00:9331: C0 0C     CPY #$0C
C - - - - - 0x001343 00:9333: 90 02     BCC bra_9337
C - - - - - 0x001345 00:9335: A9 1A     LDA #$1A
bra_9337:
C - - - - - 0x001347 00:9337: 9D 68 05  STA ram_0568_plr_bullet,X
C - - - - - 0x00134A 00:933A: 60        RTS



sub_933B:
; triggers during area 4 boss attacking
C - - - - - 0x00134B 00:933B: BD 88 05  LDA ram_plr_bullet_pos_X_hi,X
C - - - - - 0x00134E 00:933E: 4A        LSR
C - - - - - 0x00134F 00:933F: 4A        LSR
C - - - - - 0x001350 00:9340: 4A        LSR
C - - - - - 0x001351 00:9341: 85 00     STA ram_0000
C - - - - - 0x001353 00:9343: A9 08     LDA #$08
C - - - - - 0x001355 00:9345: 85 01     STA ram_0001
C - - - - - 0x001357 00:9347: BD 78 05  LDA ram_plr_bullet_pos_Y_hi,X
C - - - - - 0x00135A 00:934A: 18        CLC
C - - - - - 0x00135B 00:934B: 69 FC     ADC #$FC
C - - - - - 0x00135D 00:934D: 18        CLC
C - - - - - 0x00135E 00:934E: 65 FC     ADC ram_scroll_Y
C - - - - - 0x001360 00:9350: B0 04     BCS bra_9356
C - - - - - 0x001362 00:9352: C9 F0     CMP #$F0
C - - - - - 0x001364 00:9354: 90 02     BCC bra_9358
bra_9356:
C - - - - - 0x001366 00:9356: 69 0F     ADC #$0F
bra_9358:
C - - - - - 0x001368 00:9358: 29 F0     AND #$F0
C - - - - - 0x00136A 00:935A: 0A        ASL
C - - - - - 0x00136B 00:935B: 26 01     ROL ram_0001
C - - - - - 0x00136D 00:935D: 0A        ASL
C - - - - - 0x00136E 00:935E: 26 01     ROL ram_0001
C - - - - - 0x001370 00:9360: 05 00     ORA ram_0000
C - - - - - 0x001372 00:9362: 29 FE     AND #$FE
C - - - - - 0x001374 00:9364: 85 00     STA ram_0000
C - - - - - 0x001376 00:9366: 86 10     STX ram_0010
; bzk optimize, check ram_index_ppu_buffer first
C - - - - - 0x001378 00:9368: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x00137A 00:936A: E0 40     CPX #$40
C - - - - - 0x00137C 00:936C: B0 4D     BCS bra_93BB
; if buffer is not too loaded
C - - - - - 0x00137E 00:936E: A9 06     LDA #con_buf_mode_06
C - - - - - 0x001380 00:9370: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x001383 00:9373: E8        INX
C - - - - - 0x001384 00:9374: A5 04     LDA ram_0004
C - - - - - 0x001386 00:9376: 49 80     EOR #$80
C - - - - - 0x001388 00:9378: A8        TAY
C - - - - - 0x001389 00:9379: 20 1B BB  JSR sub_0x007B2B
C - - - - - 0x00138C 00:937C: 0A        ASL
C - - - - - 0x00138D 00:937D: 0A        ASL
C - - - - - 0x00138E 00:937E: A8        TAY
C - - - - - 0x00138F 00:937F: A9 02     LDA #$02
C - - - - - 0x001391 00:9381: 85 02     STA ram_0002
bra_9383_loop:
C - - - - - 0x001393 00:9383: A5 01     LDA ram_0001    ; ppu hi
C - - - - - 0x001395 00:9385: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x001398 00:9388: E8        INX
C - - - - - 0x001399 00:9389: A5 00     LDA ram_0000    ; ppu lo
C - - - - - 0x00139B 00:938B: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x00139E 00:938E: E8        INX
C - - - - - 0x00139F 00:938F: A9 02     LDA #$02    ; counter
C - - - - - 0x0013A1 00:9391: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0013A4 00:9394: E8        INX
C - - - - - 0x0013A5 00:9395: B9 BA 93  LDA tbl_93BE - $04,Y
C - - - - - 0x0013A8 00:9398: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0013AB 00:939B: C8        INY
C - - - - - 0x0013AC 00:939C: E8        INX
C - - - - - 0x0013AD 00:939D: B9 BA 93  LDA tbl_93BE - $04,Y
C - - - - - 0x0013B0 00:93A0: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0013B3 00:93A3: C8        INY
C - - - - - 0x0013B4 00:93A4: E8        INX
C - - - - - 0x0013B5 00:93A5: A5 00     LDA ram_0000
C - - - - - 0x0013B7 00:93A7: 18        CLC
C - - - - - 0x0013B8 00:93A8: 69 20     ADC #$20
C - - - - - 0x0013BA 00:93AA: 85 00     STA ram_0000
C - - - - - 0x0013BC 00:93AC: C6 02     DEC ram_0002
C - - - - - 0x0013BE 00:93AE: D0 D3     BNE bra_9383_loop
; close buffer
C - - - - - 0x0013C0 00:93B0: A9 FF     LDA #$FF
C - - - - - 0x0013C2 00:93B2: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0013C5 00:93B5: E8        INX
C - - - - - 0x0013C6 00:93B6: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x0013C8 00:93B8: 20 CA 93  JSR sub_93CA
bra_93BB:
C - - - - - 0x0013CB 00:93BB: A6 10     LDX ram_0010
C - - - - - 0x0013CD 00:93BD: 60        RTS



tbl_93BE:
; 01 
- D 0 - - - 0x0013CE 00:93BE: 00        .byte $00, $00   ; 
- D 0 - - - 0x0013D0 00:93C0: 00        .byte $00, $00   ; 
; 02 
- D 0 - - - 0x0013D2 00:93C2: 6E        .byte $6E, $6F   ; 
- D 0 - - - 0x0013D4 00:93C4: 70        .byte $70, $71   ; 
; 03 
- D 0 - - - 0x0013D6 00:93C6: 6A        .byte $6A, $6B   ; 
- D 0 - - - 0x0013D8 00:93C8: 6C        .byte $6C, $6D   ; 



sub_93CA:
C - - - - - 0x0013DA 00:93CA: A5 04     LDA ram_0004
C - - - - - 0x0013DC 00:93CC: 49 80     EOR #$80
C - - - - - 0x0013DE 00:93CE: AA        TAX
C - - - - - 0x0013DF 00:93CF: A5 03     LDA ram_0003
C - - - - - 0x0013E1 00:93D1: 29 01     AND #$01
C - - - - - 0x0013E3 00:93D3: A8        TAY
C - - - - - 0x0013E4 00:93D4: BD 00 04  LDA ram_0400,X
C - - - - - 0x0013E7 00:93D7: 38        SEC
C - - - - - 0x0013E8 00:93D8: F9 F8 93  SBC tbl_93F8,Y
C - - - - - 0x0013EB 00:93DB: 9D 00 04  STA ram_0400,X
C - - - - - 0x0013EE 00:93DE: 39 FA 93  AND tbl_93FA,Y
C - - - - - 0x0013F1 00:93E1: D0 14     BNE bra_93F7_RTS
C - - - - - 0x0013F3 00:93E3: BD 00 04  LDA ram_0400,X
C - - - - - 0x0013F6 00:93E6: 19 FE 93  ORA tbl_93FE,Y
C - - - - - 0x0013F9 00:93E9: 9D 00 04  STA ram_0400,X
C - - - - - 0x0013FC 00:93EC: A6 04     LDX ram_0004
C - - - - - 0x0013FE 00:93EE: BD 00 04  LDA ram_0400,X
C - - - - - 0x001401 00:93F1: 39 FC 93  AND tbl_93FC,Y
C - - - - - 0x001404 00:93F4: 9D 00 04  STA ram_0400,X
bra_93F7_RTS:
C - - - - - 0x001407 00:93F7: 60        RTS



tbl_93F8:
- D 0 - - - 0x001408 00:93F8: 10        .byte $10   ; 00 
- D 0 - - - 0x001409 00:93F9: 01        .byte $01   ; 01 



tbl_93FA:
- D 0 - - - 0x00140A 00:93FA: F0        .byte $F0   ; 00 
- D 0 - - - 0x00140B 00:93FB: 0F        .byte $0F   ; 01 



tbl_93FC:
- D 0 - - - 0x00140C 00:93FC: 0F        .byte $0F   ; 00 
- D 0 - - - 0x00140D 00:93FD: F0        .byte $F0   ; 01 



tbl_93FE:
- D 0 - - - 0x00140E 00:93FE: 30        .byte $30   ; 00 
- D 0 - - - 0x00140F 00:93FF: 03        .byte $03   ; 01 



bra_9400_RTS:
C - - - - - 0x001410 00:9400: 60        RTS



loc_0x001411:
C D 0 - - - 0x001411 00:9401: A5 5C     LDA ram_005C
C - - - - - 0x001413 00:9403: D0 FB     BNE bra_9400_RTS
C - - - - - 0x001415 00:9405: 24 94     BIT ram_0094
C - - - - - 0x001417 00:9407: 70 F7     BVS bra_9400_RTS
C - - - - - 0x001419 00:9409: A5 94     LDA ram_0094
C - - - - - 0x00141B 00:940B: 4A        LSR
C - - - - - 0x00141C 00:940C: A5 63     LDA ram_0063
C - - - - - 0x00141E 00:940E: 90 02     BCC bra_9412
C - - - - - 0x001420 00:9410: A5 82     LDA ram_0082
bra_9412:
C - - - - - 0x001422 00:9412: 85 16     STA ram_0016
C - - - - - 0x001424 00:9414: C5 92     CMP ram_0092
C - - - - - 0x001426 00:9416: F0 06     BEQ bra_941E
C - - - - - 0x001428 00:9418: 85 92     STA ram_0092
C - - - - - 0x00142A 00:941A: A9 00     LDA #$00
C - - - - - 0x00142C 00:941C: 85 90     STA ram_0090_mob_spawn_cnt
bra_941E:
C - - - - - 0x00142E 00:941E: A5 91     LDA ram_0091
C - - - - - 0x001430 00:9420: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x001433 00:9423: 27 94     .word ofs_006_9427_00
- D 0 - I - 0x001435 00:9425: 5B 94     .word ofs_006_945B_01



ofs_006_9427_00:
C - - J - - 0x001437 00:9427: A5 50     LDA ram_area
; bzk bug, Y is always 33 here because of 0x01FD6D,
; and it reads a byte from 0x0016F8.
; was it supposed to be LDY ram_area ?
C - - - - - 0x001439 00:9429: B9 B5 96  LDA tbl_96B5,Y
C - - - - - 0x00143C 00:942C: F0 1C     BEQ bra_944A_RTS
C - - - - - 0x00143E 00:942E: 85 93     STA ram_mob_spawn_cooldown
C - - - - - 0x001440 00:9430: A4 51     LDY ram_game_loop
C - - - - - 0x001442 00:9432: F0 0B     BEQ bra_943F_1st_loop
C - - - - - 0x001444 00:9434: C0 03     CPY #$03
C - - - - - 0x001446 00:9436: 90 02     BCC bra_943A_not_overflow
- - - - - - 0x001448 00:9438: A0 03     LDY #$03
bra_943A_not_overflow:
C - - - - - 0x00144A 00:943A: A9 10     LDA #$10
C - - - - - 0x00144C 00:943C: 20 4B 94  JSR sub_944B_decrease_timer
bra_943F_1st_loop:
C - - - - - 0x00144F 00:943F: A4 52     LDY ram_S_weapon_cnt
C - - - - - 0x001451 00:9441: F0 05     BEQ bra_9448
C - - - - - 0x001453 00:9443: A9 04     LDA #$04
C - - - - - 0x001455 00:9445: 20 4B 94  JSR sub_944B_decrease_timer
bra_9448:
C - - - - - 0x001458 00:9448: E6 91     INC ram_0091    ; 00 -> 01
bra_944A_RTS:
C - - - - - 0x00145A 00:944A: 60        RTS



sub_944B_decrease_timer:
C - - - - - 0x00145B 00:944B: 85 08     STA ram_0008
C - - - - - 0x00145D 00:944D: A5 93     LDA ram_mob_spawn_cooldown
bra_944F_loop:
C - - - - - 0x00145F 00:944F: 88        DEY
C - - - - - 0x001460 00:9450: 30 F8     BMI bra_944A_RTS
C - - - - - 0x001462 00:9452: 38        SEC
C - - - - - 0x001463 00:9453: E5 08     SBC ram_0008
C - - - - - 0x001465 00:9455: 90 F3     BCC bra_944A_RTS
C - - - - - 0x001467 00:9457: 85 93     STA ram_mob_spawn_cooldown
C - - - - - 0x001469 00:9459: B0 F4     BCS bra_944F_loop    ; jmp



ofs_006_945B_01:
C - - J - - 0x00146B 00:945B: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00146D 00:945D: 4A        LSR
C - - - - - 0x00146E 00:945E: 90 0F     BCC bra_946F
C - - - - - 0x001470 00:9460: A5 94     LDA ram_0094
C - - - - - 0x001472 00:9462: A0 02     LDY #$02
C - - - - - 0x001474 00:9464: 4A        LSR
C - - - - - 0x001475 00:9465: A5 62     LDA ram_cam_spd_X
C - - - - - 0x001477 00:9467: 90 02     BCC bra_946B
C - - - - - 0x001479 00:9469: A5 72     LDA ram_cam_spd_Y
bra_946B:
C - - - - - 0x00147B 00:946B: 85 17     STA ram_0017
C - - - - - 0x00147D 00:946D: D0 02     BNE bra_9471
bra_946F:
C - - - - - 0x00147F 00:946F: A0 01     LDY #$01
bra_9471:
C - - - - - 0x001481 00:9471: 84 08     STY ram_0008
C - - - - - 0x001483 00:9473: A5 93     LDA ram_mob_spawn_cooldown
C - - - - - 0x001485 00:9475: F0 0A     BEQ bra_9481
C - - - - - 0x001487 00:9477: 38        SEC
C - - - - - 0x001488 00:9478: E5 08     SBC ram_0008
C - - - - - 0x00148A 00:947A: B0 02     BCS bra_947E
C - - - - - 0x00148C 00:947C: A9 00     LDA #$00
bra_947E:
C - - - - - 0x00148E 00:947E: 85 93     STA ram_mob_spawn_cooldown
C - - - - - 0x001490 00:9480: 60        RTS
bra_9481:
C - - - - - 0x001491 00:9481: A5 50     LDA ram_area
C - - - - - 0x001493 00:9483: 0A        ASL
C - - - - - 0x001494 00:9484: 0A        ASL
C - - - - - 0x001495 00:9485: A8        TAY
C - - - - - 0x001496 00:9486: A5 94     LDA ram_0094
C - - - - - 0x001498 00:9488: 4A        LSR
C - - - - - 0x001499 00:9489: 90 02     BCC bra_948D
C - - - - - 0x00149B 00:948B: C8        INY
C - - - - - 0x00149C 00:948C: C8        INY
bra_948D:
C - - - - - 0x00149D 00:948D: B9 BD 96  LDA tbl_96BD,Y
C - - - - - 0x0014A0 00:9490: 85 08     STA ram_0008
C - - - - - 0x0014A2 00:9492: B9 BE 96  LDA tbl_96BD + $01,Y
C - - - - - 0x0014A5 00:9495: 85 09     STA ram_0009
C - - - - - 0x0014A7 00:9497: A4 16     LDY ram_0016
C - - - - - 0x0014A9 00:9499: B1 08     LDA (ram_0008),Y
C - - - - - 0x0014AB 00:949B: C9 FF     CMP #$FF
C - - - - - 0x0014AD 00:949D: D0 03     BNE bra_94A2
; FF
C - - - - - 0x0014AF 00:949F: 4C 23 95  JMP loc_9523
bra_94A2:
C - - - - - 0x0014B2 00:94A2: 84 0F     STY ram_000F
C - - - - - 0x0014B4 00:94A4: 20 AE 95  JSR sub_95AE
C - - - - - 0x0014B7 00:94A7: B0 03     BCS bra_94AC
C - - - - - 0x0014B9 00:94A9: 4C 23 95  JMP loc_9523
bra_94AC:
C - - - - - 0x0014BC 00:94AC: A5 99     LDA ram_0099
C - - - - - 0x0014BE 00:94AE: D0 19     BNE bra_94C9
C - - - - - 0x0014C0 00:94B0: A4 0F     LDY ram_000F
C - - - - - 0x0014C2 00:94B2: B1 08     LDA (ram_0008),Y
C - - - - - 0x0014C4 00:94B4: 10 08     BPL bra_94BE
C - - - - - 0x0014C6 00:94B6: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x0014C8 00:94B8: 29 02     AND #$02
C - - - - - 0x0014CA 00:94BA: D0 67     BNE bra_9523
C - - - - - 0x0014CC 00:94BC: F0 0B     BEQ bra_94C9    ; jmp
bra_94BE:
C - - - - - 0x0014CE 00:94BE: B1 08     LDA (ram_0008),Y
C - - - - - 0x0014D0 00:94C0: 0A        ASL
C - - - - - 0x0014D1 00:94C1: 10 06     BPL bra_94C9
C - - - - - 0x0014D3 00:94C3: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x0014D5 00:94C5: 29 0C     AND #$0C
C - - - - - 0x0014D7 00:94C7: D0 5A     BNE bra_9523
bra_94C9:
C - - - - - 0x0014D9 00:94C9: A5 94     LDA ram_0094
C - - - - - 0x0014DB 00:94CB: 10 03     BPL bra_94D0
C - - - - - 0x0014DD 00:94CD: 4C 28 95  JMP loc_9528
bra_94D0:
C - - - - - 0x0014E0 00:94D0: 20 82 95  JSR sub_9582
C - - - - - 0x0014E3 00:94D3: B0 4E     BCS bra_9523
C - - - - - 0x0014E5 00:94D5: A5 99     LDA ram_0099
C - - - - - 0x0014E7 00:94D7: F0 03     BEQ bra_94DC
C - - - - - 0x0014E9 00:94D9: 4C 6A 95  JMP loc_956A
bra_94DC:
C - - - - - 0x0014EC 00:94DC: A5 17     LDA ram_0017
C - - - - - 0x0014EE 00:94DE: F0 09     BEQ bra_94E9
C - - - - - 0x0014F0 00:94E0: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x0014F2 00:94E2: 29 03     AND #$03
C - - - - - 0x0014F4 00:94E4: D0 03     BNE bra_94E9
C - - - - - 0x0014F6 00:94E6: 4C 66 95  JMP loc_9566
bra_94E9:
C - - - - - 0x0014F9 00:94E9: 20 06 F7  JSR sub_0x01F716_try_to_find_free_object
C - - - - - 0x0014FC 00:94EC: D0 35     BNE bra_9523
C - - - - - 0x0014FE 00:94EE: A0 03     LDY #con_obj_id_03
C - - - - - 0x001500 00:94F0: 20 9E F7  JSR sub_0x01F7AE_prepare_object
C - - - - - 0x001503 00:94F3: A4 0F     LDY ram_000F
C - - - - - 0x001505 00:94F5: B1 08     LDA (ram_0008),Y
C - - - - - 0x001507 00:94F7: 29 0F     AND #$0F
C - - - - - 0x001509 00:94F9: 0A        ASL
C - - - - - 0x00150A 00:94FA: 0A        ASL
C - - - - - 0x00150B 00:94FB: 85 0A     STA ram_000A
C - - - - - 0x00150D 00:94FD: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00150F 00:94FF: 4A        LSR
C - - - - - 0x001510 00:9500: 4A        LSR
C - - - - - 0x001511 00:9501: 4A        LSR
C - - - - - 0x001512 00:9502: 4A        LSR
C - - - - - 0x001513 00:9503: 29 03     AND #$03
C - - - - - 0x001515 00:9505: 18        CLC
C - - - - - 0x001516 00:9506: 65 0A     ADC ram_000A
C - - - - - 0x001518 00:9508: A8        TAY
C - - - - - 0x001519 00:9509: B9 4C 97  LDA tbl_974C,Y
C - - - - - 0x00151C 00:950C: 9D 1E 07  STA ram_obj_flags,X
sub_950F:
C - - - - - 0x00151F 00:950F: A5 10     LDA ram_0010
C - - - - - 0x001521 00:9511: 38        SEC
C - - - - - 0x001522 00:9512: E9 12     SBC #$12
C - - - - - 0x001524 00:9514: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x001527 00:9517: A5 11     LDA ram_0011
C - - - - - 0x001529 00:9519: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x00152C 00:951C: 30 03     BMI bra_9521
C - - - - - 0x00152E 00:951E: FE 1E 07  INC ram_obj_flags,X
bra_9521:
loc_9521:
C D 0 - - - 0x001531 00:9521: E6 90     INC ram_0090_mob_spawn_cnt
bra_9523:
loc_9523:
C D 0 - - - 0x001533 00:9523: A9 00     LDA #$00
C - - - - - 0x001535 00:9525: 85 91     STA ram_0091
C - - - - - 0x001537 00:9527: 60        RTS



loc_9528:
C D 0 - - - 0x001538 00:9528: 20 06 F7  JSR sub_0x01F716_try_to_find_free_object
C - - - - - 0x00153B 00:952B: D0 F6     BNE bra_9523
C - - - - - 0x00153D 00:952D: A0 63     LDY #con_obj_id_63
C - - - - - 0x00153F 00:952F: A5 94     LDA ram_0094
C - - - - - 0x001541 00:9531: 4A        LSR
C - - - - - 0x001542 00:9532: 4A        LSR
C - - - - - 0x001543 00:9533: 90 02     BCC bra_9537
C - - - - - 0x001545 00:9535: A0 24     LDY #con_obj_id_24
bra_9537:
C - - - - - 0x001547 00:9537: 20 9E F7  JSR sub_0x01F7AE_prepare_object
C - - - - - 0x00154A 00:953A: A4 0F     LDY ram_000F
C - - - - - 0x00154C 00:953C: B1 08     LDA (ram_0008),Y
C - - - - - 0x00154E 00:953E: 29 0F     AND #$0F
C - - - - - 0x001550 00:9540: 0A        ASL
C - - - - - 0x001551 00:9541: 0A        ASL
C - - - - - 0x001552 00:9542: 85 0A     STA ram_000A
C - - - - - 0x001554 00:9544: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x001556 00:9546: 4A        LSR
C - - - - - 0x001557 00:9547: 4A        LSR
C - - - - - 0x001558 00:9548: 29 03     AND #$03
C - - - - - 0x00155A 00:954A: 18        CLC
C - - - - - 0x00155B 00:954B: 65 0A     ADC ram_000A
C - - - - - 0x00155D 00:954D: A8        TAY
C - - - - - 0x00155E 00:954E: B9 68 97  LDA tbl_9768,Y
C - - - - - 0x001561 00:9551: 9D 1E 07  STA ram_obj_flags,X
C - - - - - 0x001564 00:9554: A5 11     LDA ram_0011
C - - - - - 0x001566 00:9556: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x001569 00:9559: A5 10     LDA ram_0010
C - - - - - 0x00156B 00:955B: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x00156E 00:955E: 10 03     BPL bra_9563
C - - - - - 0x001570 00:9560: FE 1E 07  INC ram_obj_flags,X
bra_9563:
C - - - - - 0x001573 00:9563: 4C 21 95  JMP loc_9521



loc_9566:
C D 0 - - - 0x001576 00:9566: A9 03     LDA #$03
C - - - - - 0x001578 00:9568: 85 99     STA ram_0099
loc_956A:
C D 0 - - - 0x00157A 00:956A: 20 06 F7  JSR sub_0x01F716_try_to_find_free_object
C - - - - - 0x00157D 00:956D: D0 B4     BNE bra_9523
C - - - - - 0x00157F 00:956F: A0 03     LDY #con_obj_id_03
C - - - - - 0x001581 00:9571: 20 9E F7  JSR sub_0x01F7AE_prepare_object
C - - - - - 0x001584 00:9574: 20 0F 95  JSR sub_950F
C - - - - - 0x001587 00:9577: E6 91     INC ram_0091
C - - - - - 0x001589 00:9579: A9 10     LDA #$10
C - - - - - 0x00158B 00:957B: 85 93     STA ram_mob_spawn_cooldown
C - - - - - 0x00158D 00:957D: C6 99     DEC ram_0099
C - - - - - 0x00158F 00:957F: F0 A2     BEQ bra_9523
C - - - - - 0x001591 00:9581: 60        RTS



sub_9582:
C - - - - - 0x001592 00:9582: A5 90     LDA ram_0090_mob_spawn_cnt
C - - - - - 0x001594 00:9584: C9 1E     CMP #$1E
C - - - - - 0x001596 00:9586: B0 20     BCS bra_95A8
C - - - - - 0x001598 00:9588: A5 51     LDA ram_game_loop
C - - - - - 0x00159A 00:958A: D0 1C     BNE bra_95A8    ; if 2nd loop
; 1st loop
C - - - - - 0x00159C 00:958C: A0 00     LDY #$00
C - - - - - 0x00159E 00:958E: A5 11     LDA ram_0011
C - - - - - 0x0015A0 00:9590: 10 01     BPL bra_9593
C - - - - - 0x0015A2 00:9592: C8        INY ; 01
bra_9593:
C - - - - - 0x0015A3 00:9593: A2 01     LDX #$01
bra_9595_loop:
C - - - - - 0x0015A5 00:9595: B5 CA     LDA ram_plr_game_over,X
C - - - - - 0x0015A7 00:9597: D0 0C     BNE bra_95A5
C - - - - - 0x0015A9 00:9599: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x0015AC 00:959C: D9 AC 95  CMP tbl_95AC,Y
C - - - - - 0x0015AF 00:959F: 6A        ROR
C - - - - - 0x0015B0 00:95A0: 59 AC 95  EOR tbl_95AC,Y
C - - - - - 0x0015B3 00:95A3: 10 05     BPL bra_95AA
bra_95A5:
C - - - - - 0x0015B5 00:95A5: CA        DEX
C - - - - - 0x0015B6 00:95A6: 10 ED     BPL bra_9595_loop
bra_95A8:
C - - - - - 0x0015B8 00:95A8: 18        CLC
C - - - - - 0x0015B9 00:95A9: 60        RTS
bra_95AA:
C - - - - - 0x0015BA 00:95AA: 38        SEC
C - - - - - 0x0015BB 00:95AB: 60        RTS



tbl_95AC:
- D 0 - - - 0x0015BC 00:95AC: 38        .byte $38   ; 00 
- D 0 - - - 0x0015BD 00:95AD: C8        .byte $C8   ; 01 



sub_95AE:
C - - - - - 0x0015BE 00:95AE: A5 94     LDA ram_0094
C - - - - - 0x0015C0 00:95B0: 10 03     BPL bra_95B5
C - - - - - 0x0015C2 00:95B2: 4C 5C 96  JMP loc_965C
bra_95B5:
C - - - - - 0x0015C5 00:95B5: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x0015C7 00:95B7: 65 23     ADC ram_рандом_байт_1
C - - - - - 0x0015C9 00:95B9: 85 23     STA ram_рандом_байт_1
C - - - - - 0x0015CB 00:95BB: 4A        LSR
C - - - - - 0x0015CC 00:95BC: 29 0F     AND #$0F
C - - - - - 0x0015CE 00:95BE: A8        TAY
C - - - - - 0x0015CF 00:95BF: B9 40 96  LDA tbl_9640,Y
C - - - - - 0x0015D2 00:95C2: 85 11     STA ram_0011
C - - - - - 0x0015D4 00:95C4: A4 50     LDY ram_area
C - - - - - 0x0015D6 00:95C6: B9 54 96  LDA tbl_9654,Y
C - - - - - 0x0015D9 00:95C9: F0 08     BEQ bra_95D3
C - - - - - 0x0015DB 00:95CB: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x0015DD 00:95CD: 4A        LSR
C - - - - - 0x0015DE 00:95CE: 4A        LSR
C - - - - - 0x0015DF 00:95CF: 4A        LSR
C - - - - - 0x0015E0 00:95D0: 4A        LSR
C - - - - - 0x0015E1 00:95D1: 29 03     AND #$03
bra_95D3:
C - - - - - 0x0015E3 00:95D3: 85 13     STA ram_0013
C - - - - - 0x0015E5 00:95D5: A8        TAY
C - - - - - 0x0015E6 00:95D6: 4A        LSR
C - - - - - 0x0015E7 00:95D7: B9 50 96  LDA tbl_9650,Y
C - - - - - 0x0015EA 00:95DA: 90 03     BCC bra_95DF
C - - - - - 0x0015EC 00:95DC: AD 32 05  LDA ram_pos_Y_hi_plr
bra_95DF:
C - - - - - 0x0015EF 00:95DF: 29 F0     AND #$F0
C - - - - - 0x0015F1 00:95E1: A8        TAY
C - - - - - 0x0015F2 00:95E2: A5 FC     LDA ram_scroll_Y
C - - - - - 0x0015F4 00:95E4: 29 0F     AND #$0F
C - - - - - 0x0015F6 00:95E6: 85 14     STA ram_0014
C - - - - - 0x0015F8 00:95E8: 98        TYA
C - - - - - 0x0015F9 00:95E9: 38        SEC
C - - - - - 0x0015FA 00:95EA: E5 14     SBC ram_0014
C - - - - - 0x0015FC 00:95EC: 18        CLC
C - - - - - 0x0015FD 00:95ED: 69 08     ADC #$08
C - - - - - 0x0015FF 00:95EF: 85 10     STA ram_0010
C - - - - - 0x001601 00:95F1: A9 0F     LDA #$0F
C - - - - - 0x001603 00:95F3: 85 12     STA ram_0012
bra_95F5_loop:
C - - - - - 0x001605 00:95F5: A4 10     LDY ram_0010
C - - - - - 0x001607 00:95F7: A5 11     LDA ram_0011
C - - - - - 0x001609 00:95F9: 20 16 96  JSR sub_9616
C - - - - - 0x00160C 00:95FC: B0 17     BCS bra_9615_RTS
bra_95FE_loop:
C - - - - - 0x00160E 00:95FE: A5 13     LDA ram_0013
C - - - - - 0x001610 00:9600: 4A        LSR
C - - - - - 0x001611 00:9601: 4A        LSR
C - - - - - 0x001612 00:9602: A9 10     LDA #$10
C - - - - - 0x001614 00:9604: 90 02     BCC bra_9608
C - - - - - 0x001616 00:9606: A9 EF     LDA #$EF
bra_9608:
C - - - - - 0x001618 00:9608: 65 10     ADC ram_0010
C - - - - - 0x00161A 00:960A: 85 10     STA ram_0010
C - - - - - 0x00161C 00:960C: C9 F0     CMP #$F0
C - - - - - 0x00161E 00:960E: B0 EE     BCS bra_95FE_loop
C - - - - - 0x001620 00:9610: C6 12     DEC ram_0012
C - - - - - 0x001622 00:9612: D0 E1     BNE bra_95F5_loop
bra_9614:
C - - - - - 0x001624 00:9614: 18        CLC
bra_9615_RTS:
C - - - - - 0x001625 00:9615: 60        RTS



sub_9616:
C - - - - - 0x001626 00:9616: 20 AA BA  JSR sub_0x007ABA_calculate_surface_type
C - - - - - 0x001629 00:9619: F0 F9     BEQ bra_9614
C - - - - - 0x00162B 00:961B: A5 10     LDA ram_0010
C - - - - - 0x00162D 00:961D: 38        SEC
C - - - - - 0x00162E 00:961E: E9 10     SBC #$10
C - - - - - 0x001630 00:9620: A8        TAY
C - - - - - 0x001631 00:9621: A5 11     LDA ram_0011
C - - - - - 0x001633 00:9623: 20 F5 BB  JSR sub_0x007C05
C - - - - - 0x001636 00:9626: B0 EC     BCS bra_9614
C - - - - - 0x001638 00:9628: A5 10     LDA ram_0010
C - - - - - 0x00163A 00:962A: 38        SEC
C - - - - - 0x00163B 00:962B: E9 10     SBC #$10
C - - - - - 0x00163D 00:962D: A8        TAY
C - - - - - 0x00163E 00:962E: A5 11     LDA ram_0011
C - - - - - 0x001640 00:9630: 0A        ASL
C - - - - - 0x001641 00:9631: A9 10     LDA #$10
C - - - - - 0x001643 00:9633: 90 02     BCC bra_9637
C - - - - - 0x001645 00:9635: A9 EF     LDA #$EF
bra_9637:
C - - - - - 0x001647 00:9637: 65 11     ADC ram_0011
C - - - - - 0x001649 00:9639: 20 F5 BB  JSR sub_0x007C05
C - - - - - 0x00164C 00:963C: B0 D6     BCS bra_9614
C - - - - - 0x00164E 00:963E: 38        SEC
C - - - - - 0x00164F 00:963F: 60        RTS



tbl_9640:
- D 0 - - - 0x001650 00:9640: F8        .byte $F8   ; 00 
- D 0 - - - 0x001651 00:9641: 08        .byte $08   ; 01 
- D 0 - - - 0x001652 00:9642: F8        .byte $F8   ; 02 
- D 0 - - - 0x001653 00:9643: F8        .byte $F8   ; 03 
- D 0 - - - 0x001654 00:9644: 08        .byte $08   ; 04 
- D 0 - - - 0x001655 00:9645: F8        .byte $F8   ; 05 
- D 0 - - - 0x001656 00:9646: 08        .byte $08   ; 06 
- D 0 - - - 0x001657 00:9647: F8        .byte $F8   ; 07 
- D 0 - - - 0x001658 00:9648: 08        .byte $08   ; 08 
- D 0 - - - 0x001659 00:9649: F8        .byte $F8   ; 09 
- D 0 - - - 0x00165A 00:964A: 08        .byte $08   ; 0A 
- D 0 - - - 0x00165B 00:964B: F8        .byte $F8   ; 0B 
- D 0 - - - 0x00165C 00:964C: F8        .byte $F8   ; 0C 
- D 0 - - - 0x00165D 00:964D: 08        .byte $08   ; 0D 
- D 0 - - - 0x00165E 00:964E: 08        .byte $08   ; 0E 
- D 0 - - - 0x00165F 00:964F: F8        .byte $F8   ; 0F 



tbl_9650:
- D 0 - - - 0x001660 00:9650: 10        .byte $10   ; 00 
- D 0 - - - 0x001661 00:9651: 80        .byte $80   ; 01 
- D 0 - - - 0x001662 00:9652: E0        .byte $E0   ; 02 
- D 0 - - - 0x001663 00:9653: 80        .byte $80   ; 03 



tbl_9654:
- D 0 - - - 0x001664 00:9654: 00        .byte $00   ; 00 
- - - - - - 0x001665 00:9655: 01        .byte $01   ; 01 
- D 0 - - - 0x001666 00:9656: 00        .byte $00   ; 02 
- - - - - - 0x001667 00:9657: 01        .byte $01   ; 03 
- D 0 - - - 0x001668 00:9658: 01        .byte $01   ; 04 
- - - - - - 0x001669 00:9659: 01        .byte $01   ; 05 
- D 0 - - - 0x00166A 00:965A: 01        .byte $01   ; 06 
- D 0 - - - 0x00166B 00:965B: 01        .byte $01   ; 07 



loc_965C:
C D 0 - - - 0x00166C 00:965C: A4 0F     LDY ram_000F
C - - - - - 0x00166E 00:965E: B1 08     LDA (ram_0008),Y
C - - - - - 0x001670 00:9660: A0 10     LDY #$10
C - - - - - 0x001672 00:9662: 29 20     AND #$20
C - - - - - 0x001674 00:9664: F0 0A     BEQ bra_9670
C - - - - - 0x001676 00:9666: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x001678 00:9668: 65 1B     ADC ram_счетчик_кадров
C - - - - - 0x00167A 00:966A: 4A        LSR
C - - - - - 0x00167B 00:966B: 4A        LSR
C - - - - - 0x00167C 00:966C: B0 02     BCS bra_9670
C - - - - - 0x00167E 00:966E: A0 E0     LDY #$E0
bra_9670:
C - - - - - 0x001680 00:9670: 84 10     STY ram_0010
C - - - - - 0x001682 00:9672: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x001684 00:9674: 29 07     AND #$07
C - - - - - 0x001686 00:9676: A8        TAY
C - - - - - 0x001687 00:9677: B9 AD 96  LDA tbl_96AD,Y
C - - - - - 0x00168A 00:967A: 85 11     STA ram_0011
C - - - - - 0x00168C 00:967C: 85 12     STA ram_0012
C - - - - - 0x00168E 00:967E: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x001690 00:9680: 4A        LSR
C - - - - - 0x001691 00:9681: 29 01     AND #$01
C - - - - - 0x001693 00:9683: 85 13     STA ram_0013
bra_9685_loop:
C - - - - - 0x001695 00:9685: A4 10     LDY ram_0010
C - - - - - 0x001697 00:9687: A5 11     LDA ram_0011
C - - - - - 0x001699 00:9689: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x00169C 00:968C: F0 13     BEQ bra_96A1
C - - - - - 0x00169E 00:968E: A5 13     LDA ram_0013
C - - - - - 0x0016A0 00:9690: 4A        LSR
C - - - - - 0x0016A1 00:9691: A9 10     LDA #$10
C - - - - - 0x0016A3 00:9693: 90 02     BCC bra_9697
C - - - - - 0x0016A5 00:9695: A9 EF     LDA #$EF
bra_9697:
C - - - - - 0x0016A7 00:9697: 65 11     ADC ram_0011
C - - - - - 0x0016A9 00:9699: 85 11     STA ram_0011
C - - - - - 0x0016AB 00:969B: C5 12     CMP ram_0012
C - - - - - 0x0016AD 00:969D: D0 E6     BNE bra_9685_loop
C - - - - - 0x0016AF 00:969F: 18        CLC
C - - - - - 0x0016B0 00:96A0: 60        RTS
bra_96A1:
C - - - - - 0x0016B1 00:96A1: A5 10     LDA ram_0010
C - - - - - 0x0016B3 00:96A3: C9 10     CMP #$10
C - - - - - 0x0016B5 00:96A5: D0 02     BNE bra_96A9
C - - - - - 0x0016B7 00:96A7: A9 08     LDA #$08
bra_96A9:
C - - - - - 0x0016B9 00:96A9: 85 10     STA ram_0010
C - - - - - 0x0016BB 00:96AB: 38        SEC
C - - - - - 0x0016BC 00:96AC: 60        RTS



tbl_96AD:
- D 0 - - - 0x0016BD 00:96AD: 28        .byte $28   ; 00 
- D 0 - - - 0x0016BE 00:96AE: 48        .byte $48   ; 01 
- D 0 - - - 0x0016BF 00:96AF: 68        .byte $68   ; 02 
- D 0 - - - 0x0016C0 00:96B0: 88        .byte $88   ; 03 
- D 0 - - - 0x0016C1 00:96B1: A8        .byte $A8   ; 04 
- D 0 - - - 0x0016C2 00:96B2: C8        .byte $C8   ; 05 
- D 0 - - - 0x0016C3 00:96B3: E8        .byte $E8   ; 06 
- D 0 - - - 0x0016C4 00:96B4: 78        .byte $78   ; 07 



tbl_96B5:
- - - - - - 0x0016C5 00:96B5: 7B        .byte $7B   ; 00 
- - - - - - 0x0016C6 00:96B6: 53        .byte $53   ; 01 
- - - - - - 0x0016C7 00:96B7: 53        .byte $53   ; 02 
- - - - - - 0x0016C8 00:96B8: 53        .byte $53   ; 03 
- - - - - - 0x0016C9 00:96B9: 53        .byte $53   ; 04 
- - - - - - 0x0016CA 00:96BA: 53        .byte $53   ; 05 
- - - - - - 0x0016CB 00:96BB: 53        .byte $53   ; 06 
- - - - - - 0x0016CC 00:96BC: 53        .byte $53   ; 07 


tbl_96BD:
; bzk optimize, both cases have the same pointers for each area
- D 0 - - - 0x0016CD 00:96BD: DD 96     .word _off008_00_96DD_00_area_1
- - - - - - 0x0016CF 00:96BF: DD 96     .word _off008_01_96DD_00_area_1
- - - - - - 0x0016D1 00:96C1: EB 96     .word _off008_00_96EB_01_area_2
- D 0 - - - 0x0016D3 00:96C3: EB 96     .word _off008_01_96EB_01_area_2
- D 0 - - - 0x0016D5 00:96C5: F9 96     .word _off008_00_96F9_02_area_3
- - - - - - 0x0016D7 00:96C7: F9 96     .word _off008_01_96F9_02_area_3
- D 0 - - - 0x0016D9 00:96C9: 0F 97     .word _off008_00_970F_03_area_4
- - - - - - 0x0016DB 00:96CB: 0F 97     .word _off008_01_970F_03_area_4
- - - - - - 0x0016DD 00:96CD: 17 97     .word _off008_00_9717_04_area_5
- D 0 - - - 0x0016DF 00:96CF: 17 97     .word _off008_01_9717_04_area_5
- - - - - - 0x0016E1 00:96D1: 1F 97     .word _off008_00_971F_05_area_6
- D 0 - - - 0x0016E3 00:96D3: 1F 97     .word _off008_01_971F_05_area_6
- - - - - - 0x0016E5 00:96D5: 2F 97     .word _off008_00_972F_06_area_7
- D 0 - - - 0x0016E7 00:96D7: 2F 97     .word _off008_01_972F_06_area_7
- D 0 - - - 0x0016E9 00:96D9: 3C 97     .word _off008_00_973C_07_area_8
- - - - - - 0x0016EB 00:96DB: 3C 97     .word _off008_01_973C_07_area_8


; ???
_off008_00_96DD_00_area_1:
_off008_01_96DD_00_area_1:
- D 0 - I - 0x0016ED 00:96DD: FF        .byte $FF   ; 
- D 0 - I - 0x0016EE 00:96DE: 80        .byte $80   ; 
- D 0 - I - 0x0016EF 00:96DF: 80        .byte $80   ; 
- D 0 - I - 0x0016F0 00:96E0: 80        .byte $80   ; 
- D 0 - I - 0x0016F1 00:96E1: 00        .byte $00   ; 
- D 0 - I - 0x0016F2 00:96E2: 00        .byte $00   ; 
- D 0 - I - 0x0016F3 00:96E3: 80        .byte $80   ; 
- D 0 - I - 0x0016F4 00:96E4: 80        .byte $80   ; 
- D 0 - I - 0x0016F5 00:96E5: 00        .byte $00   ; 
- D 0 - I - 0x0016F6 00:96E6: 00        .byte $00   ; 
- D 0 - I - 0x0016F7 00:96E7: 00        .byte $00   ; 
- D 0 - - - 0x0016F8 00:96E8: 80        .byte $80   ; 
- D 0 - I - 0x0016F9 00:96E9: 80        .byte $80   ; 
- - - - - - 0x0016FA 00:96EA: FF        .byte $FF   ; 



_off008_00_96EB_01_area_2:
_off008_01_96EB_01_area_2:
- - - - - - 0x0016FB 00:96EB: FF        .byte $FF   ; 
- D 0 - I - 0x0016FC 00:96EC: FF        .byte $FF   ; 
- D 0 - I - 0x0016FD 00:96ED: FF        .byte $FF   ; 
- D 0 - I - 0x0016FE 00:96EE: 22        .byte $22   ; 
- D 0 - I - 0x0016FF 00:96EF: 82        .byte $82   ; 
- D 0 - I - 0x001700 00:96F0: 81        .byte $81   ; 
- D 0 - I - 0x001701 00:96F1: 22        .byte $22   ; 
- D 0 - I - 0x001702 00:96F2: 02        .byte $02   ; 
- D 0 - I - 0x001703 00:96F3: A1        .byte $A1   ; 
- D 0 - I - 0x001704 00:96F4: 81        .byte $81   ; 
- D 0 - I - 0x001705 00:96F5: 02        .byte $02   ; 
- D 0 - I - 0x001706 00:96F6: 80        .byte $80   ; 
- D 0 - I - 0x001707 00:96F7: 80        .byte $80   ; 
- - - - - - 0x001708 00:96F8: FF        .byte $FF   ; 



_off008_00_96F9_02_area_3:
_off008_01_96F9_02_area_3:
- D 0 - I - 0x001709 00:96F9: 80        .byte $80   ; 
- D 0 - I - 0x00170A 00:96FA: 00        .byte $00   ; 
- D 0 - I - 0x00170B 00:96FB: 80        .byte $80   ; 
- D 0 - I - 0x00170C 00:96FC: 81        .byte $81   ; 
- D 0 - I - 0x00170D 00:96FD: 82        .byte $82   ; 
- D 0 - I - 0x00170E 00:96FE: 40        .byte $40   ; 
- D 0 - I - 0x00170F 00:96FF: 80        .byte $80   ; 
- D 0 - I - 0x001710 00:9700: 80        .byte $80   ; 
- D 0 - I - 0x001711 00:9701: 80        .byte $80   ; 
- D 0 - I - 0x001712 00:9702: 80        .byte $80   ; 
- D 0 - I - 0x001713 00:9703: 80        .byte $80   ; 
- D 0 - I - 0x001714 00:9704: 80        .byte $80   ; 
- D 0 - I - 0x001715 00:9705: 80        .byte $80   ; 
- D 0 - I - 0x001716 00:9706: 40        .byte $40   ; 
- D 0 - I - 0x001717 00:9707: FF        .byte $FF   ; 
- D 0 - I - 0x001718 00:9708: 40        .byte $40   ; 
- D 0 - I - 0x001719 00:9709: 00        .byte $00   ; 
- D 0 - I - 0x00171A 00:970A: 81        .byte $81   ; 
- D 0 - I - 0x00171B 00:970B: 01        .byte $01   ; 
- D 0 - I - 0x00171C 00:970C: FF        .byte $FF   ; 
- - - - - - 0x00171D 00:970D: FF        .byte $FF   ; 
- - - - - - 0x00171E 00:970E: FF        .byte $FF   ; 



_off008_00_970F_03_area_4:
_off008_01_970F_03_area_4:
- D 0 - I - 0x00171F 00:970F: FF        .byte $FF   ; 
- D 0 - I - 0x001720 00:9710: FF        .byte $FF   ; 
- D 0 - I - 0x001721 00:9711: FF        .byte $FF   ; 
- D 0 - I - 0x001722 00:9712: FF        .byte $FF   ; 
- - - - - - 0x001723 00:9713: FF        .byte $FF   ; 
- - - - - - 0x001724 00:9714: FF        .byte $FF   ; 
- - - - - - 0x001725 00:9715: FF        .byte $FF   ; 
- - - - - - 0x001726 00:9716: FF        .byte $FF   ; 



_off008_00_9717_04_area_5:
_off008_01_9717_04_area_5:
- D 0 - I - 0x001727 00:9717: 00        .byte $00   ; 
- D 0 - I - 0x001728 00:9718: 00        .byte $00   ; 
- D 0 - I - 0x001729 00:9719: 40        .byte $40   ; 
- D 0 - I - 0x00172A 00:971A: 00        .byte $00   ; 
- D 0 - I - 0x00172B 00:971B: 00        .byte $00   ; 
- D 0 - I - 0x00172C 00:971C: 00        .byte $00   ; 
- D 0 - I - 0x00172D 00:971D: 00        .byte $00   ; 
- - - - - - 0x00172E 00:971E: FF        .byte $FF   ; 



_off008_00_971F_05_area_6:
_off008_01_971F_05_area_6:
- - - - - - 0x00172F 00:971F: FF        .byte $FF   ; 
- D 0 - I - 0x001730 00:9720: FF        .byte $FF   ; 
- D 0 - I - 0x001731 00:9721: 02        .byte $02   ; 
- D 0 - I - 0x001732 00:9722: 21        .byte $21   ; 
- D 0 - I - 0x001733 00:9723: FF        .byte $FF   ; 
- D 0 - I - 0x001734 00:9724: A0        .byte $A0   ; 
- D 0 - I - 0x001735 00:9725: 22        .byte $22   ; 
- D 0 - I - 0x001736 00:9726: 81        .byte $81   ; 
- D 0 - I - 0x001737 00:9727: 02        .byte $02   ; 
- D 0 - I - 0x001738 00:9728: 83        .byte $83   ; 
- D 0 - I - 0x001739 00:9729: 02        .byte $02   ; 
- D 0 - I - 0x00173A 00:972A: 01        .byte $01   ; 
- D 0 - I - 0x00173B 00:972B: 00        .byte $00   ; 
- - - - - - 0x00173C 00:972C: FF        .byte $FF   ; 
- - - - - - 0x00173D 00:972D: FF        .byte $FF   ; 
- - - - - - 0x00173E 00:972E: FF        .byte $FF   ; 



_off008_00_972F_06_area_7:
_off008_01_972F_06_area_7:
- D 0 - I - 0x00173F 00:972F: FF        .byte $FF   ; 
- D 0 - I - 0x001740 00:9730: 00        .byte $00   ; 
- D 0 - I - 0x001741 00:9731: 80        .byte $80   ; 
- D 0 - I - 0x001742 00:9732: 00        .byte $00   ; 
- D 0 - I - 0x001743 00:9733: 00        .byte $00   ; 
- D 0 - I - 0x001744 00:9734: 00        .byte $00   ; 
- D 0 - I - 0x001745 00:9735: 80        .byte $80   ; 
- D 0 - I - 0x001746 00:9736: FF        .byte $FF   ; 
- D 0 - I - 0x001747 00:9737: FF        .byte $FF   ; 
- D 0 - I - 0x001748 00:9738: FF        .byte $FF   ; 
- D 0 - I - 0x001749 00:9739: FF        .byte $FF   ; 
- D 0 - I - 0x00174A 00:973A: FF        .byte $FF   ; 
- D 0 - I - 0x00174B 00:973B: FF        .byte $FF   ; 



_off008_00_973C_07_area_8:
_off008_01_973C_07_area_8:
- D 0 - I - 0x00174C 00:973C: FF        .byte $FF   ; 
- D 0 - I - 0x00174D 00:973D: 00        .byte $00   ; 
- D 0 - I - 0x00174E 00:973E: 00        .byte $00   ; 
- D 0 - I - 0x00174F 00:973F: 00        .byte $00   ; 
- D 0 - I - 0x001750 00:9740: 00        .byte $00   ; 
- D 0 - I - 0x001751 00:9741: 00        .byte $00   ; 
- D 0 - I - 0x001752 00:9742: 00        .byte $00   ; 
- D 0 - I - 0x001753 00:9743: 00        .byte $00   ; 
- D 0 - I - 0x001754 00:9744: 00        .byte $00   ; 
- D 0 - I - 0x001755 00:9745: 00        .byte $00   ; 
- D 0 - I - 0x001756 00:9746: 00        .byte $00   ; 
- D 0 - I - 0x001757 00:9747: 00        .byte $00   ; 
- D 0 - I - 0x001758 00:9748: 00        .byte $00   ; 
- D 0 - I - 0x001759 00:9749: FF        .byte $FF   ; 
- D 0 - I - 0x00175A 00:974A: FF        .byte $FF   ; 
- - - - - - 0x00175B 00:974B: FF        .byte $FF   ; 



tbl_974C:
- D 0 - - - 0x00175C 00:974C: 00        .byte $00, $00, $00, $00   ; 00 
- D 0 - - - 0x001760 00:9750: 00        .byte $00, $00, $00, $08   ; 01 
- D 0 - - - 0x001764 00:9754: 00        .byte $00, $00, $08, $08   ; 02 
; bzk garbage?
- - - - - - 0x001768 00:9758: 00        .byte $00, $08, $08, $08   ; 03 
- - - - - - 0x00176C 00:975C: 08        .byte $08, $08, $08, $08   ; 04 
- - - - - - 0x001770 00:9760: 00        .byte $00, $00, $00, $10   ; 05 
- - - - - - 0x001774 00:9764: 00        .byte $00, $00, $08, $10   ; 06 



tbl_9768:
- D 0 - - - 0x001778 00:9768: 00        .byte $00, $00, $00, $00   ; 00 
- D 0 - - - 0x00177C 00:976C: 00        .byte $00, $00, $00, $02   ; 01 
- D 0 - - - 0x001780 00:9770: 00        .byte $00, $00, $02, $02   ; 02 
- D 0 - - - 0x001784 00:9774: 00        .byte $00, $02, $02, $02   ; 03 
- - - - - - 0x001788 00:9778: 02        .byte $02, $02, $02, $02   ; 01 



loc_0x00178C_print_text_on_the_screen:
; see con_0x0017EA
; +80 = hide text
C D 0 - - - 0x00178C 00:977C: A8        TAY
C - - - - - 0x00178D 00:977D: A9 02     LDA #$02
C - - - - - 0x00178F 00:977F: 85 03     STA ram_0003
C - - - - - 0x001791 00:9781: A9 01     LDA #$01
C - - - - - 0x001793 00:9783: 20 D1 97  JSR sub_97D1
C - - - - - 0x001796 00:9786: 98        TYA ; bzk optimize, write to 0002 from the beginning
C - - - - - 0x001797 00:9787: 85 02     STA ram_0002
C - - - - - 0x001799 00:9789: 0A        ASL
C - - - - - 0x00179A 00:978A: A8        TAY
C - - - - - 0x00179B 00:978B: B9 DA 97  LDA tbl_97DA,Y
C - - - - - 0x00179E 00:978E: 85 00     STA ram_0000
C - - - - - 0x0017A0 00:9790: B9 DB 97  LDA tbl_97DA + $01,Y
C - - - - - 0x0017A3 00:9793: 85 01     STA ram_0001
C - - - - - 0x0017A5 00:9795: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x0017A7 00:9797: A0 00     LDY #$00
bra_9799_loop:
C - - - - - 0x0017A9 00:9799: B1 00     LDA (ram_0000),Y
C - - - - - 0x0017AB 00:979B: C8        INY
; bzk optimize, there are no FF bytes in this data
C - - - - - 0x0017AC 00:979C: C9 FF     CMP #$FF
C - - - - - 0x0017AE 00:979E: F0 37     BEQ bra_97D7_FF
C - - - - - 0x0017B0 00:97A0: C9 FE     CMP #$FE
C - - - - - 0x0017B2 00:97A2: F0 27     BEQ bra_97CB_FE
C - - - - - 0x0017B4 00:97A4: C9 FD     CMP #$FD
C - - - - - 0x0017B6 00:97A6: F0 15     BEQ bra_97BD_FD
C - - - - - 0x0017B8 00:97A8: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0017BB 00:97AB: A5 02     LDA ram_0002
C - - - - - 0x0017BD 00:97AD: 10 0B     BPL bra_97BA
; hide text if +80
C - - - - - 0x0017BF 00:97AF: A5 03     LDA ram_0003
C - - - - - 0x0017C1 00:97B1: D0 05     BNE bra_97B8
; A = 00
C - - - - - 0x0017C3 00:97B3: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0017C6 00:97B6: F0 02     BEQ bra_97BA    ; jmp
bra_97B8:
C - - - - - 0x0017C8 00:97B8: C6 03     DEC ram_0003
bra_97BA:
C - - - - - 0x0017CA 00:97BA: E8        INX
C - - - - - 0x0017CB 00:97BB: D0 DC     BNE bra_9799_loop    ; jmp
bra_97BD_FD:
C - - - - - 0x0017CD 00:97BD: 20 CB 97  JSR sub_97CB
C - - - - - 0x0017D0 00:97C0: A9 02     LDA #$02
C - - - - - 0x0017D2 00:97C2: 85 03     STA ram_0003
C - - - - - 0x0017D4 00:97C4: A9 01     LDA #$01
C - - - - - 0x0017D6 00:97C6: 20 D3 97  JSR sub_97D3
C - - - - - 0x0017D9 00:97C9: D0 CE     BNE bra_9799_loop    ; jmp
bra_97CB_FE:
sub_97CB:
; write byte FF and close buffer
C - - - - - 0x0017DB 00:97CB: A9 FF     LDA #$FF
C - - - - - 0x0017DD 00:97CD: D0 04     BNE bra_97D3    ; jmp


; bzk garbage
- - - - - - 0x0017DF 00:97CF: A9 FF     LDA #$FF



sub_97D1:
C - - - - - 0x0017E1 00:97D1: A6 1E     LDX ram_index_ppu_buffer
bra_97D3:
sub_97D3:
C - - - - - 0x0017E3 00:97D3: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0017E6 00:97D6: E8        INX
bra_97D7_FF:
; close buffer
C - - - - - 0x0017E7 00:97D7: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x0017E9 00:97D9: 60        RTS



tbl_97DA:
; see con_0x0017EA
- D 0 - - - 0x0017EA 00:97DA: F4 97     .word _off009_97F4_00_1_player
- D 0 - - - 0x0017EC 00:97DC: FF 97     .word _off009_97FF_01_2_players
- D 0 - - - 0x0017EE 00:97DE: 5E 98     .word _off009_985E_02_area
- D 0 - - - 0x0017F0 00:97E0: 0B 98     .word _off009_980B_03_1p_score
- D 0 - - - 0x0017F2 00:97E2: 20 98     .word _off009_9820_04_2p_score
- D 0 - - - 0x0017F4 00:97E4: 35 98     .word _off009_9835_05_hi_score
- D 0 - - - 0x0017F6 00:97E6: 4A 98     .word _off009_984A_06_rest_1p
- D 0 - - - 0x0017F8 00:97E8: 54 98     .word _off009_9854_07_rest_2p
- - - - - - 0x0017FA 00:97EA: F4 97     .word _off009_97F4_08   ; unused
- D 0 - - - 0x0017FC 00:97EC: 67 98     .word _off009_9867_09_game_over
- D 0 - - - 0x0017FE 00:97EE: 73 98     .word _off009_9873_0A_continue_end
- - - - - - 0x001800 00:97F0: F4 97     .word _off009_97F4_0B   ; unused
- - - - - - 0x001802 00:97F2: 85 98     .word _off009_9885_0C_area_1



_off009_97F4_00_1_player:
_off009_97F4_08:
_off009_97F4_0B:
- D 0 - I - 0x001804 00:97F4: 22 A6     .dbyt $22A6 ; ppu address
- D 0 - I - 0x001806 00:97F6: 02        .byte $02, $00, $1A, $16, $0B, $23, $0F, $1C   ; "1 PLAYER"
- D 0 - I - 0x00180E 00:97FE: FE        .byte $FE   ; end token



_off009_97FF_01_2_players:
- D 0 - I - 0x00180F 00:97FF: 22 B2     .dbyt $22B2 ; ppu address
- D 0 - I - 0x001811 00:9801: 03        .byte $03, $00, $1A, $16, $0B, $23, $0F, $1C, $1D   ; "2 PLAYERS"
- D 0 - I - 0x00181A 00:980A: FE        .byte $FE   ; end token



_off009_980B_03_1p_score:
- D 0 - I - 0x00181B 00:980B: 21 03     .dbyt $2103 ; ppu address
- D 0 - I - 0x00181D 00:980D: 02        .byte $02, $1A, $00, $1D, $0D, $19, $1C, $0F   ; "1P SCORE"
- D 0 - I - 0x001825 00:9815: FD        .byte $FD   ; continue

- D 0 - I - 0x001826 00:9816: 21 44     .dbyt $2144 ; ppu address
- D 0 - I - 0x001828 00:9818: 00        .byte $00, $00, $00, $00, $00, $00, $01   ; "      0"
- D 0 - I - 0x00182F 00:981F: FE        .byte $FE   ; end token



_off009_9820_04_2p_score:
- D 0 - I - 0x001830 00:9820: 21 15     .dbyt $2115 ; ppu address
- D 0 - I - 0x001832 00:9822: 03        .byte $03, $1A, $00, $1D, $0D, $19, $1C, $0F   ; "2P SCORE"
- D 0 - I - 0x00183A 00:982A: FD        .byte $FD   ; continue

- D 0 - I - 0x00183B 00:982B: 21 56     .dbyt $2156 ; ppu address
- D 0 - I - 0x00183D 00:982D: 00        .byte $00, $00, $00, $00, $00, $00, $01   ; "      0"
- D 0 - I - 0x001844 00:9834: FE        .byte $FE   ; end token



_off009_9835_05_hi_score:
- D 0 - I - 0x001845 00:9835: 20 8C     .dbyt $208C ; ppu address
- D 0 - I - 0x001847 00:9837: 12        .byte $12, $13, $00, $1D, $0D, $19, $1C, $0F   ; "HI SCORE"
- D 0 - I - 0x00184F 00:983F: FD        .byte $FD   ; continue

- D 0 - I - 0x001850 00:9840: 20 CD     .dbyt $20CD ; ppu address
- D 0 - I - 0x001852 00:9842: 00        .byte $00, $00, $00, $00, $00, $00, $01   ; "      0"
- D 0 - I - 0x001859 00:9849: FE        .byte $FE   ; end token



_off009_984A_06_rest_1p:
- D 0 - I - 0x00185A 00:984A: 21 84     .dbyt $2184 ; ppu address
- D 0 - I - 0x00185C 00:984C: 1C        .byte $1C, $0F, $1D, $1E, $00, $00, $00   ; "REST   "
- D 0 - I - 0x001863 00:9853: FE        .byte $FE   ; end token



_off009_9854_07_rest_2p:
- D 0 - I - 0x001864 00:9854: 21 96     .dbyt $2196 ; ppu address
- D 0 - I - 0x001866 00:9856: 1C        .byte $1C, $0F, $1D, $1E, $00, $00, $00   ; "REST   "
- D 0 - I - 0x00186D 00:985D: FE        .byte $FE   ; end token



_off009_985E_02_area:
- D 0 - I - 0x00186E 00:985E: 22 4D     .dbyt $224D ; ppu address
- D 0 - I - 0x001870 00:9860: 0B        .byte $0B, $1C, $0F, $0B, $00, $00   ; "AREA  "
- D 0 - I - 0x001876 00:9866: FE        .byte $FE   ; end token



_off009_9867_09_game_over:
- D 0 - I - 0x001877 00:9867: 22 4C     .dbyt $224C ; ppu address
- D 0 - I - 0x001879 00:9869: 11        .byte $11, $0B, $17, $0F, $00, $19, $20, $0F, $1C   ; "GAME OVER"
- D 0 - I - 0x001882 00:9872: FE        .byte $FE   ; end token



_off009_9873_0A_continue_end:
- D 0 - I - 0x001883 00:9873: 22 4C     .dbyt $224C ; ppu address
- D 0 - I - 0x001885 00:9875: 0D        .byte $0D, $19, $18, $1E, $13, $18, $1F, $0F, $00   ; "CONTINUE "
- D 0 - I - 0x00188E 00:987E: FD        .byte $FD   ; continue

- D 0 - I - 0x00188F 00:987F: 22 AC     .dbyt $22AC ; ppu address
- D 0 - I - 0x001891 00:9881: 0F        .byte $0F, $18, $0E   ; "END"
- D 0 - I - 0x001894 00:9884: FE        .byte $FE   ; end token



_off009_9885_0C_area_1:
; bzk garbage?
- - - - - - 0x001895 00:9885: 22 4D     .dbyt $224D ; ppu address
- - - - - - 0x001897 00:9887: 0B        .byte $0B, $1C, $0F, $0B, $00, $02   ; "AREA 1"
- - - - - - 0x00189D 00:988D: FE        .byte $FE   ; end token



sub_988E_draw_static_screen:
loc_0x00189E_draw_static_screen:
C D 0 - - - 0x00189E 00:988E: A9 04     LDA #$04
C - - - - - 0x0018A0 00:9890: 85 1D     STA ram_001D
C - - - - - 0x0018A2 00:9892: BD 05 99  LDA tbl_9905_screen_data,X
C - - - - - 0x0018A5 00:9895: 85 00     STA ram_0000
C - - - - - 0x0018A7 00:9897: BD 06 99  LDA tbl_9905_screen_data + $01,X
C - - - - - 0x0018AA 00:989A: 85 01     STA ram_0001
C - - - - - 0x0018AC 00:989C: 20 E9 FC  JSR sub_0x01FCF9
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
C - - - - - 0x0018C9 00:98B9: 20 22 E6  JSR sub_0x01E632_inc_pointer_by_A
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
C - - - - - 0x0018F2 00:98E2: 20 22 E6  JSR sub_0x01E632_inc_pointer_by_A
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
C - - - - - 0x00190C 00:98FC: 20 22 E6  JSR sub_0x01E632_inc_pointer_by_A
C - - - - - 0x00190F 00:98FF: 4C A5 98  JMP loc_98A5_loop
bra_9902_FF_end_token:
C - - - - - 0x001912 00:9902: 4C BA FC  JMP loc_0x01FCCA_enable_nmi



tbl_9905_screen_data:
- D 0 - - - 0x001915 00:9905: 0B 99     .word _off010_990B_00_empty_screen
- D 0 - - - 0x001917 00:9907: 35 99     .word _off010_9935_02_title_screen
- D 0 - - - 0x001919 00:9909: B3 9A     .word _off010_9AB3_04



_off010_990B_00_empty_screen:
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



_off010_9935_02_title_screen:
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



_off010_9AB3_04:
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



loc_0x001C02_prepare_area_config:
; ???
C D 0 - - - 0x001C02 00:9BF2: A9 00     LDA #$00
C - - - - - 0x001C04 00:9BF4: 85 2F     STA ram_002F
C - - - - - 0x001C06 00:9BF6: A2 09     LDX #$09
bra_9BF8_loop:
C - - - - - 0x001C08 00:9BF8: 9D D0 07  STA ram_07D0,X
C - - - - - 0x001C0B 00:9BFB: CA        DEX
C - - - - - 0x001C0C 00:9BFC: 10 FA     BPL bra_9BF8_loop
; A = 00
C - - - - - 0x001C0E 00:9BFE: 85 26     STA ram_for_A000    ; con_mirroring_V
C - - - - - 0x001C10 00:9C00: 85 FD     STA ram_scroll_X
C - - - - - 0x001C12 00:9C02: 85 7A     STA ram_007A
C - - - - - 0x001C14 00:9C04: 85 FC     STA ram_scroll_Y
C - - - - - 0x001C16 00:9C06: 85 7B     STA ram_007B
C - - - - - 0x001C18 00:9C08: A5 FF     LDA ram_for_2000
C - - - - - 0x001C1A 00:9C0A: 29 FC     AND #$FC
C - - - - - 0x001C1C 00:9C0C: 85 FF     STA ram_for_2000
C - - - - - 0x001C1E 00:9C0E: 85 7C     STA ram_007C
C - - - - - 0x001C20 00:9C10: A9 FF     LDA #$FF
C - - - - - 0x001C22 00:9C12: 85 9C     STA ram_009C
C - - - - - 0x001C24 00:9C14: A4 50     LDY ram_area
C - - - - - 0x001C26 00:9C16: A9 00     LDA #$00
C - - - - - 0x001C28 00:9C18: 85 63     STA ram_0063
C - - - - - 0x001C2A 00:9C1A: B9 4E 9C  LDA tbl_9C4E,Y
C - - - - - 0x001C2D 00:9C1D: 85 74     STA ram_0074
C - - - - - 0x001C2F 00:9C1F: 85 82     STA ram_0082
C - - - - - 0x001C31 00:9C21: B9 56 9C  LDA tbl_9C56,Y
C - - - - - 0x001C34 00:9C24: 85 61     STA ram_0061
C - - - - - 0x001C36 00:9C26: B9 5E 9C  LDA tbl_9C5E,Y
C - - - - - 0x001C39 00:9C29: 85 71     STA ram_0071_flag
C - - - - - 0x001C3B 00:9C2B: 85 7D     STA ram_007D_flag
C - - - - - 0x001C3D 00:9C2D: B9 66 9C  LDA tbl_9C66,Y
C - - - - - 0x001C40 00:9C30: 85 8F     STA ram_008F
C - - - - - 0x001C42 00:9C32: B9 6E 9C  LDA tbl_9C6E,Y
C - - - - - 0x001C45 00:9C35: 85 5D     STA ram_005D
C - - - - - 0x001C47 00:9C37: B9 76 9C  LDA tbl_9C76,Y
C - - - - - 0x001C4A 00:9C3A: 85 97     STA ram_0097
C - - - - - 0x001C4C 00:9C3C: B9 7E 9C  LDA tbl_9C7E,Y
C - - - - - 0x001C4F 00:9C3F: 85 94     STA ram_0094
C - - - - - 0x001C51 00:9C41: B9 86 9C  LDA tbl_9C86,Y
C - - - - - 0x001C54 00:9C44: 8D CD 03  STA ram_03CD
C - - - - - 0x001C57 00:9C47: B9 8E 9C  LDA tbl_9C8E,Y
C - - - - - 0x001C5A 00:9C4A: 8D CF 03  STA ram_03CF
C - - - - - 0x001C5D 00:9C4D: 60        RTS



tbl_9C4E:
- D 0 - - - 0x001C5E 00:9C4E: 02        .byte $02   ; 00 
- D 0 - - - 0x001C5F 00:9C4F: 0C        .byte $0C   ; 01 
- D 0 - - - 0x001C60 00:9C50: 00        .byte $00   ; 02 
- D 0 - - - 0x001C61 00:9C51: 0C        .byte $0C   ; 03 
- D 0 - - - 0x001C62 00:9C52: 06        .byte $06   ; 04 
- D 0 - - - 0x001C63 00:9C53: 0C        .byte $0C   ; 05 
- D 0 - - - 0x001C64 00:9C54: 00        .byte $00   ; 06 
- D 0 - - - 0x001C65 00:9C55: 03        .byte $03   ; 07 



tbl_9C56:
- D 0 - - - 0x001C66 00:9C56: 00        .byte $00   ; 00 
- D 0 - - - 0x001C67 00:9C57: 01        .byte $01   ; 01 
- D 0 - - - 0x001C68 00:9C58: 00        .byte $00   ; 02 
- D 0 - - - 0x001C69 00:9C59: 00        .byte $00   ; 03 
- D 0 - - - 0x001C6A 00:9C5A: 01        .byte $01   ; 04 
- D 0 - - - 0x001C6B 00:9C5B: 01        .byte $01   ; 05 
- D 0 - - - 0x001C6C 00:9C5C: 01        .byte $01   ; 06 
- D 0 - - - 0x001C6D 00:9C5D: 00        .byte $00   ; 07 



tbl_9C5E:
- D 0 - - - 0x001C6E 00:9C5E: 80        .byte $80   ; 00 
- D 0 - - - 0x001C6F 00:9C5F: 40        .byte $40   ; 01 
- D 0 - - - 0x001C70 00:9C60: C0        .byte $C0   ; 02 
- D 0 - - - 0x001C71 00:9C61: C0        .byte $C0   ; 03 
- D 0 - - - 0x001C72 00:9C62: 40        .byte $40   ; 04 
- D 0 - - - 0x001C73 00:9C63: 40        .byte $40   ; 05 
- D 0 - - - 0x001C74 00:9C64: 80        .byte $80   ; 06 
- D 0 - - - 0x001C75 00:9C65: C0        .byte $C0   ; 07 



tbl_9C66:
- D 0 - - - 0x001C76 00:9C66: 01        .byte $01   ; 00 
- D 0 - - - 0x001C77 00:9C67: 01        .byte $01   ; 01 
- D 0 - - - 0x001C78 00:9C68: 01        .byte $01   ; 02 
- D 0 - - - 0x001C79 00:9C69: 01        .byte $01   ; 03 
- D 0 - - - 0x001C7A 00:9C6A: 00        .byte $00   ; 04 
- D 0 - - - 0x001C7B 00:9C6B: 01        .byte $01   ; 05 
- D 0 - - - 0x001C7C 00:9C6C: 01        .byte $01   ; 06 
- D 0 - - - 0x001C7D 00:9C6D: 00        .byte $00   ; 07 



tbl_9C6E:
- D 0 - - - 0x001C7E 00:9C6E: 00        .byte $00   ; 00 
- D 0 - - - 0x001C7F 00:9C6F: 01        .byte $01   ; 01 
- D 0 - - - 0x001C80 00:9C70: 00        .byte $00   ; 02 
- D 0 - - - 0x001C81 00:9C71: 00        .byte $00   ; 03 
- D 0 - - - 0x001C82 00:9C72: 00        .byte $00   ; 04 
- D 0 - - - 0x001C83 00:9C73: 01        .byte $01   ; 05 
- D 0 - - - 0x001C84 00:9C74: 00        .byte $00   ; 06 
- D 0 - - - 0x001C85 00:9C75: 00        .byte $00   ; 07 



tbl_9C76:
- D 0 - - - 0x001C86 00:9C76: 80        .byte $80   ; 00 
- D 0 - - - 0x001C87 00:9C77: D0        .byte $D0   ; 01 
- D 0 - - - 0x001C88 00:9C78: A0        .byte $A0   ; 02 
- D 0 - - - 0x001C89 00:9C79: A0        .byte $A0   ; 03 
- D 0 - - - 0x001C8A 00:9C7A: 80        .byte $80   ; 04 
- D 0 - - - 0x001C8B 00:9C7B: D0        .byte $D0   ; 05 
- D 0 - - - 0x001C8C 00:9C7C: 80        .byte $80   ; 06 
- D 0 - - - 0x001C8D 00:9C7D: A0        .byte $A0   ; 07 



tbl_9C7E:
- D 0 - - - 0x001C8E 00:9C7E: 00        .byte $00   ; 00 
- D 0 - - - 0x001C8F 00:9C7F: 81        .byte $81   ; 01 
- D 0 - - - 0x001C90 00:9C80: 00        .byte $00   ; 02 
- D 0 - - - 0x001C91 00:9C81: 00        .byte $00   ; 03 
- D 0 - - - 0x001C92 00:9C82: 01        .byte $01   ; 04 
- D 0 - - - 0x001C93 00:9C83: 83        .byte $83   ; 05 
- D 0 - - - 0x001C94 00:9C84: 01        .byte $01   ; 06 
- D 0 - - - 0x001C95 00:9C85: 00        .byte $00   ; 07 



tbl_9C86:
- D 0 - - - 0x001C96 00:9C86: FF        .byte $FF   ; 00 
- D 0 - - - 0x001C97 00:9C87: FF        .byte $FF   ; 01 
- D 0 - - - 0x001C98 00:9C88: FF        .byte $FF   ; 02 
- D 0 - - - 0x001C99 00:9C89: FF        .byte $FF   ; 03 
- D 0 - - - 0x001C9A 00:9C8A: 00        .byte $00   ; 04 
- D 0 - - - 0x001C9B 00:9C8B: FF        .byte $FF   ; 05 
- D 0 - - - 0x001C9C 00:9C8C: FF        .byte $FF   ; 06 
- D 0 - - - 0x001C9D 00:9C8D: FF        .byte $FF   ; 07 



tbl_9C8E:
- D 0 - - - 0x001C9E 00:9C8E: 00        .byte $00   ; 00 
- D 0 - - - 0x001C9F 00:9C8F: 00        .byte $00   ; 01 
- D 0 - - - 0x001CA0 00:9C90: 00        .byte $00   ; 02 
- D 0 - - - 0x001CA1 00:9C91: 00        .byte $00   ; 03 
- D 0 - - - 0x001CA2 00:9C92: 00        .byte $00   ; 04 
- D 0 - - - 0x001CA3 00:9C93: 00        .byte $00   ; 05 
- D 0 - - - 0x001CA4 00:9C94: 00        .byte $00   ; 06 
- D 0 - - - 0x001CA5 00:9C95: 00        .byte $00   ; 07 



loc_0x001CA6:
C D 0 - - - 0x001CA6 00:9C96: 20 E8 9C  JSR sub_9CE8
C - - - - - 0x001CA9 00:9C99: A6 61     LDX ram_0061
C - - - - - 0x001CAB 00:9C9B: F0 05     BEQ bra_9CA2
C - - - - - 0x001CAD 00:9C9D: CA        DEX
C - - - - - 0x001CAE 00:9C9E: F0 42     BEQ bra_9CE2_RTS
C - - - - - 0x001CB0 00:9CA0: D0 1B     BNE bra_9CBD    ; jmp
bra_9CA2:
C - - - - - 0x001CB2 00:9CA2: A6 85     LDX ram_0085
C - - - - - 0x001CB4 00:9CA4: 30 17     BMI bra_9CBD
C - - - - - 0x001CB6 00:9CA6: A5 62     LDA ram_cam_spd_X
C - - - - - 0x001CB8 00:9CA8: F0 38     BEQ bra_9CE2_RTS
C - - - - - 0x001CBA 00:9CAA: 18        CLC
C - - - - - 0x001CBB 00:9CAB: 65 FD     ADC ram_scroll_X
C - - - - - 0x001CBD 00:9CAD: 85 FD     STA ram_scroll_X
C - - - - - 0x001CBF 00:9CAF: A6 85     LDX ram_0085
C - - - - - 0x001CC1 00:9CB1: D0 2F     BNE bra_9CE2_RTS
C - - - - - 0x001CC3 00:9CB3: 90 08     BCC bra_9CBD
C - - - - - 0x001CC5 00:9CB5: A5 FF     LDA ram_for_2000
C - - - - - 0x001CC7 00:9CB7: 49 01     EOR #$01
C - - - - - 0x001CC9 00:9CB9: 85 FF     STA ram_for_2000
C - - - - - 0x001CCB 00:9CBB: E6 63     INC ram_0063
bra_9CBD:
C - - - - - 0x001CCD 00:9CBD: A4 89     LDY ram_0089
C - - - - - 0x001CCF 00:9CBF: 88        DEY
C - - - - - 0x001CD0 00:9CC0: 84 00     STY ram_0000
C - - - - - 0x001CD2 00:9CC2: A5 63     LDA ram_0063
C - - - - - 0x001CD4 00:9CC4: C5 00     CMP ram_0000
C - - - - - 0x001CD6 00:9CC6: B0 1B     BCS bra_9CE3
C - - - - - 0x001CD8 00:9CC8: C5 6C     CMP ram_006C
C - - - - - 0x001CDA 00:9CCA: F0 08     BEQ bra_9CD4
C - - - - - 0x001CDC 00:9CCC: B0 0C     BCS bra_9CDA
; C = 0
C - - - - - 0x001CDE 00:9CCE: A5 6C     LDA ram_006C
C - - - - - 0x001CE0 00:9CD0: 30 08     BMI bra_9CDA
C - - - - - 0x001CE2 00:9CD2: 90 0E     BCC bra_9CE2_RTS    ; jmp
bra_9CD4:
C - - - - - 0x001CE4 00:9CD4: A5 FD     LDA ram_scroll_X
C - - - - - 0x001CE6 00:9CD6: C5 6B     CMP ram_006B
C - - - - - 0x001CE8 00:9CD8: 90 08     BCC bra_9CE2_RTS
bra_9CDA:
C - - - - - 0x001CEA 00:9CDA: A5 60     LDA ram_0060
C - - - - - 0x001CEC 00:9CDC: D0 04     BNE bra_9CE2_RTS
C - - - - - 0x001CEE 00:9CDE: A9 02     LDA #$02
C - - - - - 0x001CF0 00:9CE0: 85 60     STA ram_0060
bra_9CE2_RTS:
C - - - - - 0x001CF2 00:9CE2: 60        RTS
bra_9CE3:
- - - - - - 0x001CF3 00:9CE3: A9 01     LDA #$01
- - - - - - 0x001CF5 00:9CE5: 85 61     STA ram_0061
bra_9CE7_RTS:
C - - - - - 0x001CF7 00:9CE7: 60        RTS



sub_9CE8:
C - - - - - 0x001CF8 00:9CE8: A5 FC     LDA ram_scroll_Y
C - - - - - 0x001CFA 00:9CEA: 29 0F     AND #$0F
C - - - - - 0x001CFC 00:9CEC: 85 00     STA ram_0000
C - - - - - 0x001CFE 00:9CEE: A5 72     LDA ram_cam_spd_Y
C - - - - - 0x001D00 00:9CF0: F0 F5     BEQ bra_9CE7_RTS
C - - - - - 0x001D02 00:9CF2: 30 57     BMI bra_9D4B
C - - - - - 0x001D04 00:9CF4: 18        CLC
C - - - - - 0x001D05 00:9CF5: 65 FC     ADC ram_scroll_Y
C - - - - - 0x001D07 00:9CF7: 85 FC     STA ram_scroll_Y
C - - - - - 0x001D09 00:9CF9: B0 04     BCS bra_9CFF
C - - - - - 0x001D0B 00:9CFB: C9 F0     CMP #$F0
C - - - - - 0x001D0D 00:9CFD: 90 07     BCC bra_9D06
bra_9CFF:
C - - - - - 0x001D0F 00:9CFF: 18        CLC
C - - - - - 0x001D10 00:9D00: 69 10     ADC #$10
C - - - - - 0x001D12 00:9D02: 85 FC     STA ram_scroll_Y
C - - - - - 0x001D14 00:9D04: E6 82     INC ram_0082
bra_9D06:
C - - - - - 0x001D16 00:9D06: A5 00     LDA ram_0000
C - - - - - 0x001D18 00:9D08: C9 07     CMP #$07
C - - - - - 0x001D1A 00:9D0A: B0 37     BCS bra_9D43
C - - - - - 0x001D1C 00:9D0C: A5 FC     LDA ram_scroll_Y
C - - - - - 0x001D1E 00:9D0E: 29 0F     AND #$0F
C - - - - - 0x001D20 00:9D10: C9 07     CMP #$07
C - - - - - 0x001D22 00:9D12: 90 2F     BCC bra_9D43
C - - - - - 0x001D24 00:9D14: A0 00     LDY #$00
C - - - - - 0x001D26 00:9D16: A5 77     LDA ram_0077
C - - - - - 0x001D28 00:9D18: F0 21     BEQ bra_9D3B
C - - - - - 0x001D2A 00:9D1A: A5 73     LDA ram_0073
C - - - - - 0x001D2C 00:9D1C: 69 01     ADC #$01
C - - - - - 0x001D2E 00:9D1E: C9 1E     CMP #$1E
C - - - - - 0x001D30 00:9D20: 90 04     BCC bra_9D26
C - - - - - 0x001D32 00:9D22: E6 74     INC ram_0074
C - - - - - 0x001D34 00:9D24: A9 00     LDA #$00
bra_9D26:
C - - - - - 0x001D36 00:9D26: 85 73     STA ram_0073
C - - - - - 0x001D38 00:9D28: A0 00     LDY #$00
C - - - - - 0x001D3A 00:9D2A: A5 74     LDA ram_0074
C - - - - - 0x001D3C 00:9D2C: 18        CLC
C - - - - - 0x001D3D 00:9D2D: 69 02     ADC #$02
C - - - - - 0x001D3F 00:9D2F: C5 88     CMP ram_0088
C - - - - - 0x001D41 00:9D31: D0 08     BNE bra_9D3B
C - - - - - 0x001D43 00:9D33: A5 73     LDA ram_0073
C - - - - - 0x001D45 00:9D35: C9 1C     CMP #$1C
C - - - - - 0x001D47 00:9D37: 90 02     BCC bra_9D3B
- - - - - - 0x001D49 00:9D39: A0 40     LDY #$40
bra_9D3B:
C - - - - - 0x001D4B 00:9D3B: 20 45 9D  JSR sub_9D45
C - - - - - 0x001D4E 00:9D3E: A0 01     LDY #$01
C - - - - - 0x001D50 00:9D40: 4C 8D 9D  JMP loc_9D8D
bra_9D43:
C - - - - - 0x001D53 00:9D43: A0 00     LDY #$00
sub_9D45:
C - - - - - 0x001D55 00:9D45: 98        TYA
C - - - - - 0x001D56 00:9D46: 05 7D     ORA ram_007D_flag
C - - - - - 0x001D58 00:9D48: 85 71     STA ram_0071_flag
C - - - - - 0x001D5A 00:9D4A: 60        RTS
bra_9D4B:
C - - - - - 0x001D5B 00:9D4B: 18        CLC
C - - - - - 0x001D5C 00:9D4C: 65 FC     ADC ram_scroll_Y
C - - - - - 0x001D5E 00:9D4E: 85 FC     STA ram_scroll_Y
C - - - - - 0x001D60 00:9D50: 90 04     BCC bra_9D56
C - - - - - 0x001D62 00:9D52: C9 F0     CMP #$F0
C - - - - - 0x001D64 00:9D54: 90 07     BCC bra_9D5D
bra_9D56:
C - - - - - 0x001D66 00:9D56: 38        SEC
C - - - - - 0x001D67 00:9D57: E9 10     SBC #$10
C - - - - - 0x001D69 00:9D59: 85 FC     STA ram_scroll_Y
C - - - - - 0x001D6B 00:9D5B: C6 82     DEC ram_0082
bra_9D5D:
C - - - - - 0x001D6D 00:9D5D: A5 00     LDA ram_0000
C - - - - - 0x001D6F 00:9D5F: C9 07     CMP #$07
C - - - - - 0x001D71 00:9D61: 90 E0     BCC bra_9D43
C - - - - - 0x001D73 00:9D63: A5 FC     LDA ram_scroll_Y
C - - - - - 0x001D75 00:9D65: 29 0F     AND #$0F
C - - - - - 0x001D77 00:9D67: C9 07     CMP #$07
C - - - - - 0x001D79 00:9D69: B0 D8     BCS bra_9D43
C - - - - - 0x001D7B 00:9D6B: A0 00     LDY #$00
C - - - - - 0x001D7D 00:9D6D: A5 77     LDA ram_0077
C - - - - - 0x001D7F 00:9D6F: D0 17     BNE bra_9D88
C - - - - - 0x001D81 00:9D71: A5 73     LDA ram_0073
C - - - - - 0x001D83 00:9D73: 38        SEC
C - - - - - 0x001D84 00:9D74: E9 02     SBC #$02
C - - - - - 0x001D86 00:9D76: 10 04     BPL bra_9D7C
C - - - - - 0x001D88 00:9D78: A9 1C     LDA #$1C
C - - - - - 0x001D8A 00:9D7A: C6 74     DEC ram_0074
bra_9D7C:
C - - - - - 0x001D8C 00:9D7C: 85 73     STA ram_0073
C - - - - - 0x001D8E 00:9D7E: A0 00     LDY #$00
C - - - - - 0x001D90 00:9D80: A5 74     LDA ram_0074
C - - - - - 0x001D92 00:9D82: 05 73     ORA ram_0073
C - - - - - 0x001D94 00:9D84: D0 02     BNE bra_9D88
C - - - - - 0x001D96 00:9D86: A0 80     LDY #$80
bra_9D88:
C - - - - - 0x001D98 00:9D88: 20 45 9D  JSR sub_9D45
C - - - - - 0x001D9B 00:9D8B: A0 00     LDY #$00
loc_9D8D:
C D 0 - - - 0x001D9D 00:9D8D: 84 77     STY ram_0077
C - - - - - 0x001D9F 00:9D8F: A9 01     LDA #$01
C - - - - - 0x001DA1 00:9D91: 85 70     STA ram_0070
C - - - - - 0x001DA3 00:9D93: 60        RTS



loc_0x001DA4:
C D 0 - - - 0x001DA4 00:9D94: E6 4E     INC ram_004E
C - - - - - 0x001DA6 00:9D96: D0 02     BNE bra_9D9A
C - - - - - 0x001DA8 00:9D98: C6 4E     DEC ram_004E
bra_9D9A:
C - - - - - 0x001DAA 00:9D9A: A2 01     LDX #$01
C - - - - - 0x001DAC 00:9D9C: 20 A0 9D  JSR sub_9DA0
C - - - - - 0x001DAF 00:9D9F: CA        DEX ; 00
sub_9DA0:
C - - - - - 0x001DB0 00:9DA0: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x001DB2 00:9DA2: 4A        LSR
C - - - - - 0x001DB3 00:9DA3: B0 33     BCS bra_9DD8
C - - - - - 0x001DB5 00:9DA5: B5 41     LDA ram_0041,X
C - - - - - 0x001DB7 00:9DA7: D0 2D     BNE bra_9DD6
C - - - - - 0x001DB9 00:9DA9: A5 50     LDA ram_area
C - - - - - 0x001DBB 00:9DAB: C9 03     CMP #$03
C - - - - - 0x001DBD 00:9DAD: 90 02     BCC bra_9DB1_00_02
; 03+
- - - - - - 0x001DBF 00:9DAF: A9 00     LDA #$00
bra_9DB1_00_02:
C - - - - - 0x001DC1 00:9DB1: 0A        ASL
C - - - - - 0x001DC2 00:9DB2: 0A        ASL
C - - - - - 0x001DC3 00:9DB3: 85 08     STA ram_0008
C - - - - - 0x001DC5 00:9DB5: 8A        TXA
C - - - - - 0x001DC6 00:9DB6: 0A        ASL
C - - - - - 0x001DC7 00:9DB7: 65 08     ADC ram_0008
C - - - - - 0x001DC9 00:9DB9: A8        TAY
C - - - - - 0x001DCA 00:9DBA: B9 08 9E  LDA tbl_9E08,Y
C - - - - - 0x001DCD 00:9DBD: 85 08     STA ram_0008
C - - - - - 0x001DCF 00:9DBF: B9 09 9E  LDA tbl_9E08 + $01,Y
C - - - - - 0x001DD2 00:9DC2: 85 09     STA ram_0009
C - - - - - 0x001DD4 00:9DC4: B4 43     LDY ram_0043,X
C - - - - - 0x001DD6 00:9DC6: B1 08     LDA (ram_0008),Y
C - - - - - 0x001DD8 00:9DC8: C9 FF     CMP #$FF
C - - - - - 0x001DDA 00:9DCA: F0 39     BEQ bra_9E05_FF
C - - - - - 0x001DDC 00:9DCC: 95 4C     STA ram_004C,X
C - - - - - 0x001DDE 00:9DCE: C8        INY
C - - - - - 0x001DDF 00:9DCF: B1 08     LDA (ram_0008),Y
C - - - - - 0x001DE1 00:9DD1: 95 41     STA ram_0041,X
C - - - - - 0x001DE3 00:9DD3: C8        INY
C - - - - - 0x001DE4 00:9DD4: 94 43     STY ram_0043,X
bra_9DD6:
C - - - - - 0x001DE6 00:9DD6: D6 41     DEC ram_0041,X
bra_9DD8:
C - - - - - 0x001DE8 00:9DD8: B5 4C     LDA ram_004C,X
C - - - - - 0x001DEA 00:9DDA: 95 F1     STA ram_btn_press,X
C - - - - - 0x001DEC 00:9DDC: 95 F3     STA ram_btn_hold,X
C - - - - - 0x001DEE 00:9DDE: A5 4E     LDA ram_004E
C - - - - - 0x001DF0 00:9DE0: C9 E0     CMP #$E0
C - - - - - 0x001DF2 00:9DE2: 90 20     BCC bra_9E04_RTS
C - - - - - 0x001DF4 00:9DE4: B5 B8     LDA ram_weapon,X
C - - - - - 0x001DF6 00:9DE6: 29 0F     AND #$0F
C - - - - - 0x001DF8 00:9DE8: C9 01     CMP #con_weapon_M
C - - - - - 0x001DFA 00:9DEA: F0 04     BEQ bra_9DF0
C - - - - - 0x001DFC 00:9DEC: C9 03     CMP #con_weapon_L
C - - - - - 0x001DFE 00:9DEE: D0 08     BNE bra_9DF8
bra_9DF0:
; if M or L
C - - - - - 0x001E00 00:9DF0: B5 F3     LDA ram_btn_hold,X
C - - - - - 0x001E02 00:9DF2: 09 40     ORA #con_btn_B
C - - - - - 0x001E04 00:9DF4: 95 F3     STA ram_btn_hold,X
C - - - - - 0x001E06 00:9DF6: D0 0C     BNE bra_9E04_RTS    ; jmp
bra_9DF8:
C - - - - - 0x001E08 00:9DF8: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x001E0A 00:9DFA: 29 06     AND #$06
C - - - - - 0x001E0C 00:9DFC: D0 06     BNE bra_9E04_RTS
C - - - - - 0x001E0E 00:9DFE: B5 F1     LDA ram_btn_press,X
C - - - - - 0x001E10 00:9E00: 09 40     ORA #con_btn_B
C - - - - - 0x001E12 00:9E02: 95 F1     STA ram_btn_press,X
bra_9E04_RTS:
C - - - - - 0x001E14 00:9E04: 60        RTS
bra_9E05_FF:
C - - - - - 0x001E15 00:9E05: E6 3B     INC ram_003B
C - - - - - 0x001E17 00:9E07: 60        RTS



tbl_9E08:
- D 0 - - - 0x001E18 00:9E08: 14 9E     .word _off012_00_9E14_00
- D 0 - - - 0x001E1A 00:9E0A: 5C 9E     .word _off012_01_9E5C_00
- D 0 - - - 0x001E1C 00:9E0C: BC 9E     .word _off012_00_9EBC_01
- D 0 - - - 0x001E1E 00:9E0E: 54 9F     .word _off012_01_9F54_01
- D 0 - - - 0x001E20 00:9E10: D0 9F     .word _off012_00_9FD0_02
- D 0 - - - 0x001E22 00:9E12: 8C A0     .word _off012_01_A08C_02


; ???
_off012_00_9E14_00:
- D 0 - I - 0x001E24 00:9E14: 00        .byte $00, $6F   ; 
- D 0 - I - 0x001E26 00:9E16: 01        .byte $01, $33   ; 
- D 0 - I - 0x001E28 00:9E18: 00        .byte $00, $01   ; 
- D 0 - I - 0x001E2A 00:9E1A: 08        .byte $08, $21   ; 
- D 0 - I - 0x001E2C 00:9E1C: 09        .byte $09, $02   ; 
- D 0 - I - 0x001E2E 00:9E1E: 01        .byte $01, $0F   ; 
- D 0 - I - 0x001E30 00:9E20: 00        .byte $00, $13   ; 
- D 0 - I - 0x001E32 00:9E22: 01        .byte $01, $15   ; 
- D 0 - I - 0x001E34 00:9E24: 02        .byte $02, $06   ; 
- D 0 - I - 0x001E36 00:9E26: 00        .byte $00, $07   ; 
- D 0 - I - 0x001E38 00:9E28: 01        .byte $01, $1A   ; 
- D 0 - I - 0x001E3A 00:9E2A: 09        .byte $09, $5A   ; 
- D 0 - I - 0x001E3C 00:9E2C: 08        .byte $08, $05   ; 
- D 0 - I - 0x001E3E 00:9E2E: 00        .byte $00, $06   ; 
- D 0 - I - 0x001E40 00:9E30: 08        .byte $08, $10   ; 
- D 0 - I - 0x001E42 00:9E32: 00        .byte $00, $17   ; 
- D 0 - I - 0x001E44 00:9E34: 01        .byte $01, $0A   ; 
- D 0 - I - 0x001E46 00:9E36: 09        .byte $09, $19   ; 
- D 0 - I - 0x001E48 00:9E38: 08        .byte $08, $02   ; 
- D 0 - I - 0x001E4A 00:9E3A: 0A        .byte $0A, $0E   ; 
- D 0 - I - 0x001E4C 00:9E3C: 08        .byte $08, $02   ; 
- D 0 - I - 0x001E4E 00:9E3E: 88        .byte $88, $0A   ; 
- D 0 - I - 0x001E50 00:9E40: 89        .byte $89, $06   ; 
- D 0 - I - 0x001E52 00:9E42: 88        .byte $88, $03   ; 
- D 0 - I - 0x001E54 00:9E44: 8A        .byte $8A, $02   ; 
- D 0 - I - 0x001E56 00:9E46: 0A        .byte $0A, $01   ; 
- D 0 - I - 0x001E58 00:9E48: 08        .byte $08, $05   ; 
- D 0 - I - 0x001E5A 00:9E4A: 09        .byte $09, $04   ; 
- D 0 - I - 0x001E5C 00:9E4C: 89        .byte $89, $12   ; 
- D 0 - I - 0x001E5E 00:9E4E: 09        .byte $09, $13   ; 
- D 0 - I - 0x001E60 00:9E50: 08        .byte $08, $01   ; 
- D 0 - I - 0x001E62 00:9E52: 88        .byte $88, $04   ; 
- D 0 - I - 0x001E64 00:9E54: 89        .byte $89, $05   ; 
- D 0 - I - 0x001E66 00:9E56: 09        .byte $09, $0E   ; 
- D 0 - I - 0x001E68 00:9E58: 01        .byte $01, $0E   ; 
- - - - - - 0x001E6A 00:9E5A: FF        .byte $FF, $FF   ; 



_off012_01_9E5C_00:
- D 0 - I - 0x001E6C 00:9E5C: 00        .byte $00, $84   ; 
- D 0 - I - 0x001E6E 00:9E5E: 01        .byte $01, $1E   ; 
- D 0 - I - 0x001E70 00:9E60: 00        .byte $00, $01   ; 
- D 0 - I - 0x001E72 00:9E62: 02        .byte $02, $07   ; 
- D 0 - I - 0x001E74 00:9E64: 00        .byte $00, $01   ; 
- D 0 - I - 0x001E76 00:9E66: 01        .byte $01, $04   ; 
- D 0 - I - 0x001E78 00:9E68: 08        .byte $08, $03   ; 
- D 0 - I - 0x001E7A 00:9E6A: 88        .byte $88, $05   ; 
- D 0 - I - 0x001E7C 00:9E6C: 08        .byte $08, $03   ; 
- D 0 - I - 0x001E7E 00:9E6E: 09        .byte $09, $0B   ; 
- D 0 - I - 0x001E80 00:9E70: 08        .byte $08, $03   ; 
- D 0 - I - 0x001E82 00:9E72: 0A        .byte $0A, $07   ; 
- D 0 - I - 0x001E84 00:9E74: 08        .byte $08, $04   ; 
- D 0 - I - 0x001E86 00:9E76: 00        .byte $00, $08   ; 
- D 0 - I - 0x001E88 00:9E78: 01        .byte $01, $02   ; 
- D 0 - I - 0x001E8A 00:9E7A: 81        .byte $81, $05   ; 
- D 0 - I - 0x001E8C 00:9E7C: 01        .byte $01, $04   ; 
- D 0 - I - 0x001E8E 00:9E7E: 09        .byte $09, $01   ; 
- D 0 - I - 0x001E90 00:9E80: 08        .byte $08, $04   ; 
- D 0 - I - 0x001E92 00:9E82: 00        .byte $00, $0E   ; 
- D 0 - I - 0x001E94 00:9E84: 01        .byte $01, $07   ; 
- D 0 - I - 0x001E96 00:9E86: 02        .byte $02, $04   ; 
- D 0 - I - 0x001E98 00:9E88: 00        .byte $00, $1A   ; 
- D 0 - I - 0x001E9A 00:9E8A: 01        .byte $01, $05   ; 
- D 0 - I - 0x001E9C 00:9E8C: 81        .byte $81, $05   ; 
- D 0 - I - 0x001E9E 00:9E8E: 01        .byte $01, $47   ; 
- D 0 - I - 0x001EA0 00:9E90: 09        .byte $09, $01   ; 
- D 0 - I - 0x001EA2 00:9E92: 08        .byte $08, $09   ; 
- D 0 - I - 0x001EA4 00:9E94: 09        .byte $09, $10   ; 
- D 0 - I - 0x001EA6 00:9E96: 08        .byte $08, $01   ; 
- D 0 - I - 0x001EA8 00:9E98: 0A        .byte $0A, $10   ; 
- D 0 - I - 0x001EAA 00:9E9A: 8A        .byte $8A, $05   ; 
- D 0 - I - 0x001EAC 00:9E9C: 88        .byte $88, $02   ; 
- D 0 - I - 0x001EAE 00:9E9E: 09        .byte $09, $1D   ; 
- D 0 - I - 0x001EB0 00:9EA0: 01        .byte $01, $1A   ; 
- D 0 - I - 0x001EB2 00:9EA2: 09        .byte $09, $07   ; 
- D 0 - I - 0x001EB4 00:9EA4: 08        .byte $08, $02   ; 
- D 0 - I - 0x001EB6 00:9EA6: 0A        .byte $0A, $0E   ; 
- D 0 - I - 0x001EB8 00:9EA8: 08        .byte $08, $03   ; 
- D 0 - I - 0x001EBA 00:9EAA: 0A        .byte $0A, $0E   ; 
- D 0 - I - 0x001EBC 00:9EAC: 08        .byte $08, $02   ; 
- D 0 - I - 0x001EBE 00:9EAE: 88        .byte $88, $05   ; 
- D 0 - I - 0x001EC0 00:9EB0: 89        .byte $89, $01   ; 
- D 0 - I - 0x001EC2 00:9EB2: 09        .byte $09, $1A   ; 
- D 0 - I - 0x001EC4 00:9EB4: 89        .byte $89, $06   ; 
- D 0 - I - 0x001EC6 00:9EB6: 09        .byte $09, $06   ; 
- D 0 - I - 0x001EC8 00:9EB8: 01        .byte $01, $20   ; 
- D 0 - I - 0x001ECA 00:9EBA: FF        .byte $FF, $FF   ; 



_off012_00_9EBC_01:
- D 0 - I - 0x001ECC 00:9EBC: 00        .byte $00, $38   ; 
- D 0 - I - 0x001ECE 00:9EBE: 02        .byte $02, $04   ; 
- D 0 - I - 0x001ED0 00:9EC0: 0A        .byte $0A, $1D   ; 
- D 0 - I - 0x001ED2 00:9EC2: 02        .byte $02, $08   ; 
- D 0 - I - 0x001ED4 00:9EC4: 0A        .byte $0A, $01   ; 
- D 0 - I - 0x001ED6 00:9EC6: 02        .byte $02, $01   ; 
- D 0 - I - 0x001ED8 00:9EC8: 00        .byte $00, $05   ; 
- D 0 - I - 0x001EDA 00:9ECA: 01        .byte $01, $08   ; 
- D 0 - I - 0x001EDC 00:9ECC: 08        .byte $08, $25   ; 
- D 0 - I - 0x001EDE 00:9ECE: 01        .byte $01, $07   ; 
- D 0 - I - 0x001EE0 00:9ED0: 09        .byte $09, $02   ; 
- D 0 - I - 0x001EE2 00:9ED2: 08        .byte $08, $0B   ; 
- D 0 - I - 0x001EE4 00:9ED4: 0A        .byte $0A, $01   ; 
- D 0 - I - 0x001EE6 00:9ED6: 02        .byte $02, $02   ; 
- D 0 - I - 0x001EE8 00:9ED8: 0A        .byte $0A, $07   ; 
- D 0 - I - 0x001EEA 00:9EDA: 08        .byte $08, $0A   ; 
- D 0 - I - 0x001EEC 00:9EDC: 00        .byte $00, $0C   ; 
- D 0 - I - 0x001EEE 00:9EDE: 08        .byte $08, $03   ; 
- D 0 - I - 0x001EF0 00:9EE0: 00        .byte $00, $03   ; 
- D 0 - I - 0x001EF2 00:9EE2: 08        .byte $08, $0C   ; 
- D 0 - I - 0x001EF4 00:9EE4: 01        .byte $01, $06   ; 
- D 0 - I - 0x001EF6 00:9EE6: 08        .byte $08, $1A   ; 
- D 0 - I - 0x001EF8 00:9EE8: 01        .byte $01, $0A   ; 
- D 0 - I - 0x001EFA 00:9EEA: 05        .byte $05, $01   ; 
- D 0 - I - 0x001EFC 00:9EEC: 04        .byte $04, $0B   ; 
- D 0 - I - 0x001EFE 00:9EEE: 05        .byte $05, $03   ; 
- D 0 - I - 0x001F00 00:9EF0: 04        .byte $04, $05   ; 
- D 0 - I - 0x001F02 00:9EF2: 05        .byte $05, $03   ; 
- D 0 - I - 0x001F04 00:9EF4: 01        .byte $01, $06   ; 
- D 0 - I - 0x001F06 00:9EF6: 09        .byte $09, $07   ; 
- D 0 - I - 0x001F08 00:9EF8: 01        .byte $01, $01   ; 
- D 0 - I - 0x001F0A 00:9EFA: 04        .byte $04, $09   ; 
- D 0 - I - 0x001F0C 00:9EFC: 05        .byte $05, $06   ; 
- D 0 - I - 0x001F0E 00:9EFE: 01        .byte $01, $0C   ; 
- D 0 - I - 0x001F10 00:9F00: 09        .byte $09, $01   ; 
- D 0 - I - 0x001F12 00:9F02: 08        .byte $08, $0A   ; 
- D 0 - I - 0x001F14 00:9F04: 09        .byte $09, $01   ; 
- D 0 - I - 0x001F16 00:9F06: 01        .byte $01, $0A   ; 
- D 0 - I - 0x001F18 00:9F08: 09        .byte $09, $01   ; 
- D 0 - I - 0x001F1A 00:9F0A: 08        .byte $08, $0C   ; 
- D 0 - I - 0x001F1C 00:9F0C: 09        .byte $09, $07   ; 
- D 0 - I - 0x001F1E 00:9F0E: 08        .byte $08, $04   ; 
- D 0 - I - 0x001F20 00:9F10: 09        .byte $09, $03   ; 
- D 0 - I - 0x001F22 00:9F12: 08        .byte $08, $12   ; 
- D 0 - I - 0x001F24 00:9F14: 0A        .byte $0A, $04   ; 
- D 0 - I - 0x001F26 00:9F16: 08        .byte $08, $0A   ; 
- D 0 - I - 0x001F28 00:9F18: 00        .byte $00, $06   ; 
- D 0 - I - 0x001F2A 00:9F1A: 08        .byte $08, $11   ; 
- D 0 - I - 0x001F2C 00:9F1C: 0A        .byte $0A, $14   ; 
- D 0 - I - 0x001F2E 00:9F1E: 08        .byte $08, $12   ; 
- D 0 - I - 0x001F30 00:9F20: 0A        .byte $0A, $11   ; 
- D 0 - I - 0x001F32 00:9F22: 02        .byte $02, $04   ; 
- D 0 - I - 0x001F34 00:9F24: 0A        .byte $0A, $01   ; 
- D 0 - I - 0x001F36 00:9F26: 08        .byte $08, $05   ; 
- D 0 - I - 0x001F38 00:9F28: 0A        .byte $0A, $0B   ; 
- D 0 - I - 0x001F3A 00:9F2A: 02        .byte $02, $05   ; 
- D 0 - I - 0x001F3C 00:9F2C: 06        .byte $06, $05   ; 
- D 0 - I - 0x001F3E 00:9F2E: 02        .byte $02, $02   ; 
- D 0 - I - 0x001F40 00:9F30: 06        .byte $06, $02   ; 
- D 0 - I - 0x001F42 00:9F32: 02        .byte $02, $07   ; 
- D 0 - I - 0x001F44 00:9F34: 0A        .byte $0A, $12   ; 
- D 0 - I - 0x001F46 00:9F36: 08        .byte $08, $17   ; 
- D 0 - I - 0x001F48 00:9F38: 00        .byte $00, $06   ; 
- D 0 - I - 0x001F4A 00:9F3A: 02        .byte $02, $01   ; 
- D 0 - I - 0x001F4C 00:9F3C: 0A        .byte $0A, $02   ; 
- D 0 - I - 0x001F4E 00:9F3E: 08        .byte $08, $06   ; 
- D 0 - I - 0x001F50 00:9F40: 00        .byte $00, $06   ; 
- D 0 - I - 0x001F52 00:9F42: 08        .byte $08, $02   ; 
- D 0 - I - 0x001F54 00:9F44: 00        .byte $00, $10   ; 
- D 0 - I - 0x001F56 00:9F46: 02        .byte $02, $06   ; 
- D 0 - I - 0x001F58 00:9F48: 00        .byte $00, $0C   ; 
- D 0 - I - 0x001F5A 00:9F4A: 01        .byte $01, $07   ; 
- D 0 - I - 0x001F5C 00:9F4C: 04        .byte $04, $08   ; 
- D 0 - I - 0x001F5E 00:9F4E: 01        .byte $01, $04   ; 
- D 0 - I - 0x001F60 00:9F50: 08        .byte $08, $01   ; 
- D 0 - I - 0x001F62 00:9F52: FF        .byte $FF, $FF   ; 



_off012_01_9F54_01:
- D 0 - I - 0x001F64 00:9F54: 00        .byte $00, $56   ; 
- D 0 - I - 0x001F66 00:9F56: 02        .byte $02, $14   ; 
- D 0 - I - 0x001F68 00:9F58: 00        .byte $00, $06   ; 
- D 0 - I - 0x001F6A 00:9F5A: 01        .byte $01, $04   ; 
- D 0 - I - 0x001F6C 00:9F5C: 00        .byte $00, $0B   ; 
- D 0 - I - 0x001F6E 00:9F5E: 08        .byte $08, $22   ; 
- D 0 - I - 0x001F70 00:9F60: 09        .byte $09, $08   ; 
- D 0 - I - 0x001F72 00:9F62: 08        .byte $08, $15   ; 
- D 0 - I - 0x001F74 00:9F64: 0A        .byte $0A, $13   ; 
- D 0 - I - 0x001F76 00:9F66: 08        .byte $08, $02   ; 
- D 0 - I - 0x001F78 00:9F68: 09        .byte $09, $06   ; 
- D 0 - I - 0x001F7A 00:9F6A: 08        .byte $08, $06   ; 
- D 0 - I - 0x001F7C 00:9F6C: 09        .byte $09, $03   ; 
- D 0 - I - 0x001F7E 00:9F6E: 01        .byte $01, $05   ; 
- D 0 - I - 0x001F80 00:9F70: 09        .byte $09, $0D   ; 
- D 0 - I - 0x001F82 00:9F72: 08        .byte $08, $02   ; 
- D 0 - I - 0x001F84 00:9F74: 0A        .byte $0A, $0F   ; 
- D 0 - I - 0x001F86 00:9F76: 08        .byte $08, $03   ; 
- D 0 - I - 0x001F88 00:9F78: 09        .byte $09, $03   ; 
- D 0 - I - 0x001F8A 00:9F7A: 01        .byte $01, $15   ; 
- D 0 - I - 0x001F8C 00:9F7C: 09        .byte $09, $06   ; 
- D 0 - I - 0x001F8E 00:9F7E: 01        .byte $01, $01   ; 
- D 0 - I - 0x001F90 00:9F80: 05        .byte $05, $04   ; 
- D 0 - I - 0x001F92 00:9F82: 04        .byte $04, $0C   ; 
- D 0 - I - 0x001F94 00:9F84: 05        .byte $05, $06   ; 
- D 0 - I - 0x001F96 00:9F86: 01        .byte $01, $04   ; 
- D 0 - I - 0x001F98 00:9F88: 09        .byte $09, $11   ; 
- D 0 - I - 0x001F9A 00:9F8A: 08        .byte $08, $05   ; 
- D 0 - I - 0x001F9C 00:9F8C: 09        .byte $09, $15   ; 
- D 0 - I - 0x001F9E 00:9F8E: 08        .byte $08, $03   ; 
- D 0 - I - 0x001FA0 00:9F90: 0A        .byte $0A, $01   ; 
- D 0 - I - 0x001FA2 00:9F92: 02        .byte $02, $03   ; 
- D 0 - I - 0x001FA4 00:9F94: 04        .byte $04, $12   ; 
- D 0 - I - 0x001FA6 00:9F96: 05        .byte $05, $03   ; 
- D 0 - I - 0x001FA8 00:9F98: 01        .byte $01, $05   ; 
- D 0 - I - 0x001FAA 00:9F9A: 09        .byte $09, $01   ; 
- D 0 - I - 0x001FAC 00:9F9C: 08        .byte $08, $26   ; 
- D 0 - I - 0x001FAE 00:9F9E: 0A        .byte $0A, $13   ; 
- D 0 - I - 0x001FB0 00:9FA0: 08        .byte $08, $04   ; 
- D 0 - I - 0x001FB2 00:9FA2: 09        .byte $09, $01   ; 
- D 0 - I - 0x001FB4 00:9FA4: 08        .byte $08, $03   ; 
- D 0 - I - 0x001FB6 00:9FA6: 0A        .byte $0A, $07   ; 
- D 0 - I - 0x001FB8 00:9FA8: 08        .byte $08, $02   ; 
- D 0 - I - 0x001FBA 00:9FAA: 01        .byte $01, $03   ; 
- D 0 - I - 0x001FBC 00:9FAC: 08        .byte $08, $02   ; 
- D 0 - I - 0x001FBE 00:9FAE: 0A        .byte $0A, $10   ; 
- D 0 - I - 0x001FC0 00:9FB0: 08        .byte $08, $01   ; 
- D 0 - I - 0x001FC2 00:9FB2: 01        .byte $01, $04   ; 
- D 0 - I - 0x001FC4 00:9FB4: 09        .byte $09, $04   ; 
- D 0 - I - 0x001FC6 00:9FB6: 08        .byte $08, $09   ; 
- D 0 - I - 0x001FC8 00:9FB8: 0A        .byte $0A, $26   ; 
- D 0 - I - 0x001FCA 00:9FBA: 08        .byte $08, $04   ; 
- D 0 - I - 0x001FCC 00:9FBC: 09        .byte $09, $06   ; 
- D 0 - I - 0x001FCE 00:9FBE: 08        .byte $08, $08   ; 
- D 0 - I - 0x001FD0 00:9FC0: 09        .byte $09, $10   ; 
- D 0 - I - 0x001FD2 00:9FC2: 08        .byte $08, $06   ; 
- D 0 - I - 0x001FD4 00:9FC4: 0A        .byte $0A, $1C   ; 
- D 0 - I - 0x001FD6 00:9FC6: 08        .byte $08, $0D   ; 
- D 0 - I - 0x001FD8 00:9FC8: 00        .byte $00, $1D   ; 
- - - - - - 0x001FDA 00:9FCA: 04        .byte $04, $0F   ; 
- - - - - - 0x001FDC 00:9FCC: 01        .byte $01, $01   ; 
- - - - - - 0x001FDE 00:9FCE: FF        .byte $FF, $FF   ; 



_off012_00_9FD0_02:
- D 0 - I - 0x001FE0 00:9FD0: 00        .byte $00, $54   ; 
- D 0 - I - 0x001FE2 00:9FD2: 01        .byte $01, $43   ; 
- D 0 - I - 0x001FE4 00:9FD4: 08        .byte $08, $02   ; 
- D 0 - I - 0x001FE6 00:9FD6: 09        .byte $09, $2C   ; 
- D 0 - I - 0x001FE8 00:9FD8: 01        .byte $01, $04   ; 
- D 0 - I - 0x001FEA 00:9FDA: 04        .byte $04, $13   ; 
- D 0 - I - 0x001FEC 00:9FDC: 01        .byte $01, $0B   ; 
- D 0 - I - 0x001FEE 00:9FDE: 05        .byte $05, $01   ; 
- D 0 - I - 0x001FF0 00:9FE0: 04        .byte $04, $13   ; 
- D 0 - I - 0x001FF2 00:9FE2: 84        .byte $84, $01   ; 
- D 0 - I - 0x001FF4 00:9FE4: 86        .byte $86, $0B   ; 
- D 0 - I - 0x001FF6 00:9FE6: 84        .byte $84, $01   ; 
- D 0 - I - 0x001FF8 00:9FE8: 81        .byte $81, $02   ; 
- D 0 - I - 0x001FFA 00:9FEA: 01        .byte $01, $12   ; 
- D 0 - I - 0x001FFC 00:9FEC: 09        .byte $09, $1F   ; 
- D 0 - I - 0x001FFE 00:9FEE: 01        .byte $01, $02   ; 
- D 0 - I - 0x002000 00:9FF0: 04        .byte $04, $0A   ; 
- D 0 - I - 0x002002 00:9FF2: 01        .byte $01, $03   ; 
- D 0 - I - 0x002004 00:9FF4: 09        .byte $09, $05   ; 
- D 0 - I - 0x002006 00:9FF6: 01        .byte $01, $02   ; 
- D 0 - I - 0x002008 00:9FF8: 04        .byte $04, $24   ; 
- D 0 - I - 0x00200A 00:9FFA: 01        .byte $01, $0A   ; 
- D 0 - I - 0x00200C 00:9FFC: 09        .byte $09, $0C   ; 
- D 0 - I - 0x00200E 00:9FFE: 08        .byte $08, $01   ; 
- D 1 - I - 0x002010 00:A000: 09        .byte $09, $13   ; 
- D 1 - I - 0x002012 00:A002: 01        .byte $01, $01   ; 
- D 1 - I - 0x002014 00:A004: 04        .byte $04, $0E   ; 
- D 1 - I - 0x002016 00:A006: 01        .byte $01, $04   ; 
- D 1 - I - 0x002018 00:A008: 09        .byte $09, $20   ; 
- D 1 - I - 0x00201A 00:A00A: 01        .byte $01, $01   ; 
- D 1 - I - 0x00201C 00:A00C: 04        .byte $04, $22   ; 
- D 1 - I - 0x00201E 00:A00E: 01        .byte $01, $01   ; 
- D 1 - I - 0x002020 00:A010: 09        .byte $09, $20   ; 
- D 1 - I - 0x002022 00:A012: 01        .byte $01, $03   ; 
- D 1 - I - 0x002024 00:A014: 09        .byte $09, $07   ; 
- D 1 - I - 0x002026 00:A016: 08        .byte $08, $15   ; 
- D 1 - I - 0x002028 00:A018: 09        .byte $09, $02   ; 
- D 1 - I - 0x00202A 00:A01A: 01        .byte $01, $10   ; 
- D 1 - I - 0x00202C 00:A01C: 00        .byte $00, $01   ; 
- D 1 - I - 0x00202E 00:A01E: 02        .byte $02, $05   ; 
- D 1 - I - 0x002030 00:A020: 00        .byte $00, $01   ; 
- D 1 - I - 0x002032 00:A022: 04        .byte $04, $01   ; 
- D 1 - I - 0x002034 00:A024: 01        .byte $01, $0B   ; 
- D 1 - I - 0x002036 00:A026: 08        .byte $08, $01   ; 
- D 1 - I - 0x002038 00:A028: 0A        .byte $0A, $06   ; 
- D 1 - I - 0x00203A 00:A02A: 02        .byte $02, $01   ; 
- D 1 - I - 0x00203C 00:A02C: 0A        .byte $0A, $06   ; 
- D 1 - I - 0x00203E 00:A02E: 08        .byte $08, $01   ; 
- D 1 - I - 0x002040 00:A030: 09        .byte $09, $02   ; 
- D 1 - I - 0x002042 00:A032: 01        .byte $01, $21   ; 
- D 1 - I - 0x002044 00:A034: 09        .byte $09, $02   ; 
- D 1 - I - 0x002046 00:A036: 08        .byte $08, $09   ; 
- D 1 - I - 0x002048 00:A038: 09        .byte $09, $10   ; 
- D 1 - I - 0x00204A 00:A03A: 01        .byte $01, $01   ; 
- D 1 - I - 0x00204C 00:A03C: 04        .byte $04, $1A   ; 
- D 1 - I - 0x00204E 00:A03E: 01        .byte $01, $01   ; 
- D 1 - I - 0x002050 00:A040: 89        .byte $89, $04   ; 
- D 1 - I - 0x002052 00:A042: 88        .byte $88, $01   ; 
- D 1 - I - 0x002054 00:A044: 8A        .byte $8A, $05   ; 
- D 1 - I - 0x002056 00:A046: 82        .byte $82, $02   ; 
- D 1 - I - 0x002058 00:A048: 88        .byte $88, $01   ; 
- D 1 - I - 0x00205A 00:A04A: 81        .byte $81, $01   ; 
- D 1 - I - 0x00205C 00:A04C: 01        .byte $01, $07   ; 
- D 1 - I - 0x00205E 00:A04E: 09        .byte $09, $0F   ; 
- D 1 - I - 0x002060 00:A050: 08        .byte $08, $01   ; 
- D 1 - I - 0x002062 00:A052: 09        .byte $09, $05   ; 
- D 1 - I - 0x002064 00:A054: 08        .byte $08, $04   ; 
- D 1 - I - 0x002066 00:A056: 09        .byte $09, $09   ; 
- D 1 - I - 0x002068 00:A058: 08        .byte $08, $02   ; 
- D 1 - I - 0x00206A 00:A05A: 09        .byte $09, $0D   ; 
- D 1 - I - 0x00206C 00:A05C: 08        .byte $08, $06   ; 
- D 1 - I - 0x00206E 00:A05E: 09        .byte $09, $02   ; 
- D 1 - I - 0x002070 00:A060: 08        .byte $08, $0C   ; 
- D 1 - I - 0x002072 00:A062: 09        .byte $09, $03   ; 
- D 1 - I - 0x002074 00:A064: 08        .byte $08, $03   ; 
- D 1 - I - 0x002076 00:A066: 09        .byte $09, $0B   ; 
- D 1 - I - 0x002078 00:A068: 01        .byte $01, $01   ; 
- D 1 - I - 0x00207A 00:A06A: 04        .byte $04, $1B   ; 
- D 1 - I - 0x00207C 00:A06C: 84        .byte $84, $01   ; 
- D 1 - I - 0x00207E 00:A06E: 88        .byte $88, $01   ; 
- D 1 - I - 0x002080 00:A070: 89        .byte $89, $07   ; 
- D 1 - I - 0x002082 00:A072: 81        .byte $81, $01   ; 
- D 1 - I - 0x002084 00:A074: 01        .byte $01, $05   ; 
- D 1 - I - 0x002086 00:A076: 09        .byte $09, $05   ; 
- D 1 - I - 0x002088 00:A078: 08        .byte $08, $08   ; 
- D 1 - I - 0x00208A 00:A07A: 09        .byte $09, $03   ; 
- D 1 - I - 0x00208C 00:A07C: 01        .byte $01, $0B   ; 
- D 1 - I - 0x00208E 00:A07E: 09        .byte $09, $04   ; 
- D 1 - I - 0x002090 00:A080: 08        .byte $08, $06   ; 
- D 1 - I - 0x002092 00:A082: 09        .byte $09, $02   ; 
- D 1 - I - 0x002094 00:A084: 08        .byte $08, $04   ; 
- D 1 - I - 0x002096 00:A086: 09        .byte $09, $1E   ; 
- - - - - - 0x002098 00:A088: 01        .byte $01, $01   ; 
- - - - - - 0x00209A 00:A08A: FF        .byte $FF, $FF   ; 



_off012_01_A08C_02:
- D 1 - I - 0x00209C 00:A08C: 00        .byte $00, $57   ; 
- D 1 - I - 0x00209E 00:A08E: 02        .byte $02, $09   ; 
- D 1 - I - 0x0020A0 00:A090: 0A        .byte $0A, $03   ; 
- D 1 - I - 0x0020A2 00:A092: 08        .byte $08, $01   ; 
- D 1 - I - 0x0020A4 00:A094: 01        .byte $01, $5D   ; 
- D 1 - I - 0x0020A6 00:A096: 02        .byte $02, $04   ; 
- D 1 - I - 0x0020A8 00:A098: 00        .byte $00, $05   ; 
- D 1 - I - 0x0020AA 00:A09A: 01        .byte $01, $0C   ; 
- D 1 - I - 0x0020AC 00:A09C: 81        .byte $81, $03   ; 
- D 1 - I - 0x0020AE 00:A09E: 89        .byte $89, $02   ; 
- D 1 - I - 0x0020B0 00:A0A0: 09        .byte $09, $03   ; 
- D 1 - I - 0x0020B2 00:A0A2: 08        .byte $08, $01   ; 
- D 1 - I - 0x0020B4 00:A0A4: 0A        .byte $0A, $05   ; 
- D 1 - I - 0x0020B6 00:A0A6: 02        .byte $02, $06   ; 
- D 1 - I - 0x0020B8 00:A0A8: 00        .byte $00, $01   ; 
- D 1 - I - 0x0020BA 00:A0AA: 05        .byte $05, $08   ; 
- D 1 - I - 0x0020BC 00:A0AC: 01        .byte $01, $06   ; 
- D 1 - I - 0x0020BE 00:A0AE: 04        .byte $04, $01   ; 
- D 1 - I - 0x0020C0 00:A0B0: 00        .byte $00, $05   ; 
- D 1 - I - 0x0020C2 00:A0B2: 01        .byte $01, $05   ; 
- D 1 - I - 0x0020C4 00:A0B4: 02        .byte $02, $04   ; 
- D 1 - I - 0x0020C6 00:A0B6: 00        .byte $00, $07   ; 
- D 1 - I - 0x0020C8 00:A0B8: 01        .byte $01, $39   ; 
- D 1 - I - 0x0020CA 00:A0BA: 09        .byte $09, $09   ; 
- D 1 - I - 0x0020CC 00:A0BC: 08        .byte $08, $02   ; 
- D 1 - I - 0x0020CE 00:A0BE: 02        .byte $02, $0D   ; 
- D 1 - I - 0x0020D0 00:A0C0: 0A        .byte $0A, $04   ; 
- D 1 - I - 0x0020D2 00:A0C2: 08        .byte $08, $01   ; 
- D 1 - I - 0x0020D4 00:A0C4: 81        .byte $81, $03   ; 
- D 1 - I - 0x0020D6 00:A0C6: 01        .byte $01, $14   ; 
- D 1 - I - 0x0020D8 00:A0C8: 08        .byte $08, $04   ; 
- D 1 - I - 0x0020DA 00:A0CA: 0A        .byte $0A, $08   ; 
- D 1 - I - 0x0020DC 00:A0CC: 08        .byte $08, $01   ; 
- D 1 - I - 0x0020DE 00:A0CE: 01        .byte $01, $29   ; 
- D 1 - I - 0x0020E0 00:A0D0: 09        .byte $09, $14   ; 
- D 1 - I - 0x0020E2 00:A0D2: 01        .byte $01, $01   ; 
- D 1 - I - 0x0020E4 00:A0D4: 09        .byte $09, $06   ; 
- D 1 - I - 0x0020E6 00:A0D6: 01        .byte $01, $09   ; 
- D 1 - I - 0x0020E8 00:A0D8: 09        .byte $09, $02   ; 
- D 1 - I - 0x0020EA 00:A0DA: 0A        .byte $0A, $02   ; 
- D 1 - I - 0x0020EC 00:A0DC: 02        .byte $02, $0D   ; 
- D 1 - I - 0x0020EE 00:A0DE: 0A        .byte $0A, $01   ; 
- D 1 - I - 0x0020F0 00:A0E0: 08        .byte $08, $01   ; 
- D 1 - I - 0x0020F2 00:A0E2: 88        .byte $88, $02   ; 
- D 1 - I - 0x0020F4 00:A0E4: 89        .byte $89, $02   ; 
- D 1 - I - 0x0020F6 00:A0E6: 81        .byte $81, $01   ; 
- D 1 - I - 0x0020F8 00:A0E8: 01        .byte $01, $0D   ; 
- D 1 - I - 0x0020FA 00:A0EA: 09        .byte $09, $01   ; 
- D 1 - I - 0x0020FC 00:A0EC: 08        .byte $08, $05   ; 
- D 1 - I - 0x0020FE 00:A0EE: 01        .byte $01, $07   ; 
- D 1 - I - 0x002100 00:A0F0: 08        .byte $08, $01   ; 
- D 1 - I - 0x002102 00:A0F2: 0A        .byte $0A, $03   ; 
- D 1 - I - 0x002104 00:A0F4: 08        .byte $08, $04   ; 
- D 1 - I - 0x002106 00:A0F6: 09        .byte $09, $06   ; 
- D 1 - I - 0x002108 00:A0F8: 08        .byte $08, $05   ; 
- D 1 - I - 0x00210A 00:A0FA: 09        .byte $09, $06   ; 
- D 1 - I - 0x00210C 00:A0FC: 08        .byte $08, $04   ; 
- D 1 - I - 0x00210E 00:A0FE: 88        .byte $88, $01   ; 
- D 1 - I - 0x002110 00:A100: 8A        .byte $8A, $05   ; 
- D 1 - I - 0x002112 00:A102: 0A        .byte $0A, $07   ; 
- D 1 - I - 0x002114 00:A104: 02        .byte $02, $11   ; 
- D 1 - I - 0x002116 00:A106: 8A        .byte $8A, $02   ; 
- D 1 - I - 0x002118 00:A108: 88        .byte $88, $01   ; 
- D 1 - I - 0x00211A 00:A10A: 89        .byte $89, $01   ; 
- D 1 - I - 0x00211C 00:A10C: 09        .byte $09, $02   ; 
- D 1 - I - 0x00211E 00:A10E: 01        .byte $01, $07   ; 
- D 1 - I - 0x002120 00:A110: 05        .byte $05, $05   ; 
- D 1 - I - 0x002122 00:A112: 04        .byte $04, $02   ; 
- D 1 - I - 0x002124 00:A114: 02        .byte $02, $06   ; 
- D 1 - I - 0x002126 00:A116: 04        .byte $04, $01   ; 
- D 1 - I - 0x002128 00:A118: 01        .byte $01, $30   ; 
- D 1 - I - 0x00212A 00:A11A: 09        .byte $09, $01   ; 
- D 1 - I - 0x00212C 00:A11C: 00        .byte $00, $01   ; 
- D 1 - I - 0x00212E 00:A11E: 02        .byte $02, $03   ; 
- D 1 - I - 0x002130 00:A120: 00        .byte $00, $02   ; 
- D 1 - I - 0x002132 00:A122: 01        .byte $01, $0C   ; 
- D 1 - I - 0x002134 00:A124: 81        .byte $81, $02   ; 
- D 1 - I - 0x002136 00:A126: 89        .byte $89, $01   ; 
- D 1 - I - 0x002138 00:A128: 88        .byte $88, $01   ; 
- D 1 - I - 0x00213A 00:A12A: 08        .byte $08, $01   ; 
- D 1 - I - 0x00213C 00:A12C: 0A        .byte $0A, $04   ; 
- D 1 - I - 0x00213E 00:A12E: 02        .byte $02, $09   ; 
- D 1 - I - 0x002140 00:A130: 06        .byte $06, $01   ; 
- D 1 - I - 0x002142 00:A132: 04        .byte $04, $02   ; 
- D 1 - I - 0x002144 00:A134: 05        .byte $05, $01   ; 
- D 1 - I - 0x002146 00:A136: 01        .byte $01, $0A   ; 
- D 1 - I - 0x002148 00:A138: 00        .byte $00, $0C   ; 
- D 1 - I - 0x00214A 00:A13A: 01        .byte $01, $10   ; 
- D 1 - I - 0x00214C 00:A13C: 09        .byte $09, $13   ; 
- D 1 - I - 0x00214E 00:A13E: 08        .byte $08, $02   ; 
- D 1 - I - 0x002150 00:A140: 0A        .byte $0A, $06   ; 
- D 1 - I - 0x002152 00:A142: 00        .byte $00, $01   ; 
- D 1 - I - 0x002154 00:A144: 01        .byte $01, $1A   ; 
- D 1 - I - 0x002156 00:A146: 09        .byte $09, $04   ; 
- D 1 - I - 0x002158 00:A148: 08        .byte $08, $01   ; 
- D 1 - I - 0x00215A 00:A14A: 0A        .byte $0A, $01   ; 
- D 1 - I - 0x00215C 00:A14C: 02        .byte $02, $02   ; 
- D 1 - I - 0x00215E 00:A14E: 00        .byte $00, $0D   ; 
- D 1 - I - 0x002160 00:A150: 80        .byte $80, $03   ; 
- D 1 - I - 0x002162 00:A152: 81        .byte $81, $02   ; 
- D 1 - I - 0x002164 00:A154: 01        .byte $01, $18   ; 
- D 1 - I - 0x002166 00:A156: 00        .byte $00, $02   ; 
- D 1 - I - 0x002168 00:A158: 01        .byte $01, $01   ; 
- D 1 - I - 0x00216A 00:A15A: 05        .byte $05, $02   ; 
- D 1 - I - 0x00216C 00:A15C: 04        .byte $04, $09   ; 
- D 1 - I - 0x00216E 00:A15E: 05        .byte $05, $02   ; 
- D 1 - I - 0x002170 00:A160: 01        .byte $01, $1F   ; 
- D 1 - I - 0x002172 00:A162: 02        .byte $02, $05   ; 
- D 1 - I - 0x002174 00:A164: 00        .byte $00, $0D   ; 
- D 1 - I - 0x002176 00:A166: FF        .byte $FF, $FF   ; 



loc_0x002178_stage_complete_handler:
C D 1 - - - 0x002178 00:A168: A5 40     LDA ram_0040
C - - - - - 0x00217A 00:A16A: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 1 - I - 0x00217D 00:A16D: 71 A1     .word ofs_007_A171_00
- D 1 - I - 0x00217F 00:A16F: B5 A1     .word ofs_007_A1B5_01



ofs_007_A171_00:
C - - J - - 0x002181 00:A171: 20 77 A1  JSR sub_A177
C - - - - - 0x002184 00:A174: E6 40     INC ram_0040
C - - - - - 0x002186 00:A176: 60        RTS



sub_A177:
C - - - - - 0x002187 00:A177: A5 50     LDA ram_area
C - - - - - 0x002189 00:A179: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 1 - I - 0x00218C 00:A17C: 8C A1     .word ofs_008_A18C_00_area_1
- D 1 - I - 0x00218E 00:A17E: 95 A1     .word ofs_008_A195_01_area_2
- D 1 - I - 0x002190 00:A180: A0 A1     .word ofs_008_A1A0_02_area_3
- D 1 - I - 0x002192 00:A182: 8C A1     .word ofs_008_A18C_03_area_4
- D 1 - I - 0x002194 00:A184: 8C A1     .word ofs_008_A18C_04_area_5
- D 1 - I - 0x002196 00:A186: A5 A1     .word ofs_008_A1A5_05_area_6
- D 1 - I - 0x002198 00:A188: A0 A1     .word ofs_008_A1A0_06_area_7
- D 1 - I - 0x00219A 00:A18A: B0 A1     .word ofs_008_A1B0_07_area_8



ofs_008_A18C_00_area_1:
ofs_008_A18C_03_area_4:
ofs_008_A18C_04_area_5:
C - - J - - 0x00219C 00:A18C: A9 02     LDA #$02
C - - - - - 0x00219E 00:A18E: 85 6F     STA ram_006F
C - - - - - 0x0021A0 00:A190: A9 00     LDA #$00
C - - - - - 0x0021A2 00:A192: 85 61     STA ram_0061
C - - - - - 0x0021A4 00:A194: 60        RTS



ofs_008_A195_01_area_2:
C - - J - - 0x0021A5 00:A195: A9 01     LDA #$01
C - - - - - 0x0021A7 00:A197: 85 84     STA ram_0084
C - - - - - 0x0021A9 00:A199: A9 40     LDA #$40
C - - - - - 0x0021AB 00:A19B: 85 71     STA ram_0071_flag
C - - - - - 0x0021AD 00:A19D: 85 7D     STA ram_007D_flag
C - - - - - 0x0021AF 00:A19F: 60        RTS



ofs_008_A1A0_02_area_3:
ofs_008_A1A0_06_area_7:
C - - J - - 0x0021B0 00:A1A0: A9 90     LDA #$90
C - - - - - 0x0021B2 00:A1A2: 85 9B     STA ram_009B
C - - - - - 0x0021B4 00:A1A4: 60        RTS



ofs_008_A1A5_05_area_6:
C - - J - - 0x0021B5 00:A1A5: A0 1F     LDY #$1F
C - - - - - 0x0021B7 00:A1A7: A9 00     LDA #$00
bra_A1A9_loop:
C - - - - - 0x0021B9 00:A1A9: 99 80 04  STA ram_0480,Y
C - - - - - 0x0021BC 00:A1AC: 88        DEY
C - - - - - 0x0021BD 00:A1AD: 10 FA     BPL bra_A1A9_loop
C - - - - - 0x0021BF 00:A1AF: 60        RTS



ofs_008_A1B0_07_area_8:
C - - J - - 0x0021C0 00:A1B0: A9 C0     LDA #$C0
C - - - - - 0x0021C2 00:A1B2: 85 9B     STA ram_009B
C - - - - - 0x0021C4 00:A1B4: 60        RTS



ofs_007_A1B5_01:
C - - J - - 0x0021C5 00:A1B5: A2 01     LDX #$01
bra_A1B7_loop:
C - - - - - 0x0021C7 00:A1B7: B5 CA     LDA ram_plr_game_over,X
C - - - - - 0x0021C9 00:A1B9: D0 03     BNE bra_A1BE
C - - - - - 0x0021CB 00:A1BB: 20 C2 A1  JSR sub_A1C2
bra_A1BE:
C - - - - - 0x0021CE 00:A1BE: CA        DEX
C - - - - - 0x0021CF 00:A1BF: 10 F6     BPL bra_A1B7_loop
C - - - - - 0x0021D1 00:A1C1: 60        RTS



sub_A1C2:
C - - - - - 0x0021D2 00:A1C2: A5 50     LDA ram_area
C - - - - - 0x0021D4 00:A1C4: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 1 - I - 0x0021D7 00:A1C7: D7 A1     .word ofs_009_A1D7_00_area_1
- D 1 - I - 0x0021D9 00:A1C9: FA A1     .word ofs_009_A1FA_01_area_2
- D 1 - I - 0x0021DB 00:A1CB: 2F A2     .word ofs_009_A22F_02_area_3
- D 1 - I - 0x0021DD 00:A1CD: 3F A2     .word ofs_009_A23F_03_area_4
- D 1 - I - 0x0021DF 00:A1CF: 48 A2     .word ofs_009_A248_04_area_5
- D 1 - I - 0x0021E1 00:A1D1: E2 A1     .word ofs_009_A1E2_05_area_6
- D 1 - I - 0x0021E3 00:A1D3: 2F A2     .word ofs_009_A22F_06_area_7
- D 1 - I - 0x0021E5 00:A1D5: 53 A2     .word ofs_009_A253_07_area_8



ofs_009_A1D7_00_area_1:
C - - J - - 0x0021E7 00:A1D7: A9 90     LDA #$90
C - - - - - 0x0021E9 00:A1D9: 85 00     STA ram_0000
C - - - - - 0x0021EB 00:A1DB: A9 B8     LDA #$B8
C - - - - - 0x0021ED 00:A1DD: 85 01     STA ram_0001
C - - - - - 0x0021EF 00:A1DF: 4C 69 A2  JMP loc_A269



ofs_009_A1E2_05_area_6:
C - - J - - 0x0021F2 00:A1E2: A0 00     LDY #$00
C - - - - - 0x0021F4 00:A1E4: A5 84     LDA ram_0084
C - - - - - 0x0021F6 00:A1E6: D0 3F     BNE bra_A227
C - - - - - 0x0021F8 00:A1E8: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x0021FB 00:A1EB: C9 08     CMP #$08
C - - - - - 0x0021FD 00:A1ED: 90 3B     BCC bra_A22A
C - - - - - 0x0021FF 00:A1EF: C9 50     CMP #$50
C - - - - - 0x002201 00:A1F1: B0 04     BCS bra_A1F7
C - - - - - 0x002203 00:A1F3: A9 01     LDA #$01
C - - - - - 0x002205 00:A1F5: 95 D2     STA ram_00D2,X
bra_A1F7:
C - - - - - 0x002207 00:A1F7: 4C 17 A2  JMP loc_A217



ofs_009_A1FA_01_area_2:
C - - J - - 0x00220A 00:A1FA: A0 00     LDY #$00
C - - - - - 0x00220C 00:A1FC: A5 84     LDA ram_0084
C - - - - - 0x00220E 00:A1FE: D0 27     BNE bra_A227
C - - - - - 0x002210 00:A200: BD 32 05  LDA ram_pos_Y_hi_plr,X
C - - - - - 0x002213 00:A203: C9 08     CMP #$08
C - - - - - 0x002215 00:A205: 90 23     BCC bra_A22A
C - - - - - 0x002217 00:A207: C9 40     CMP #$40
C - - - - - 0x002219 00:A209: B0 0C     BCS bra_A217
C - - - - - 0x00221B 00:A20B: A9 01     LDA #$01
C - - - - - 0x00221D 00:A20D: 95 D2     STA ram_00D2,X
C - - - - - 0x00221F 00:A20F: BD 66 05  LDA ram_attr_spr_plr,X
C - - - - - 0x002222 00:A212: 09 20     ORA #$20
C - - - - - 0x002224 00:A214: 9D 66 05  STA ram_attr_spr_plr,X
bra_A217:
loc_A217:
C D 1 - - - 0x002227 00:A217: A0 08     LDY #$08
C - - - - - 0x002229 00:A219: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x00222C 00:A21C: DD 2D A2  CMP tbl_A22D,X
C - - - - - 0x00222F 00:A21F: F0 06     BEQ bra_A227
C - - - - - 0x002231 00:A221: A0 09     LDY #con_btn_Up + con_btn_Right
C - - - - - 0x002233 00:A223: 90 02     BCC bra_A227
C - - - - - 0x002235 00:A225: A0 0A     LDY #con_btn_Up + con_btn_Left
bra_A227:
C - - - - - 0x002237 00:A227: 94 F3     STY ram_btn_hold,X
C - - - - - 0x002239 00:A229: 60        RTS
bra_A22A:
C - - - - - 0x00223A 00:A22A: 4C 97 A2  JMP loc_A297



tbl_A22D:
- D 1 - - - 0x00223D 00:A22D: 90        .byte $90   ; 00 
- D 1 - - - 0x00223E 00:A22E: 70        .byte $70   ; 01 



ofs_009_A22F_02_area_3:
ofs_009_A22F_06_area_7:
C - - J - - 0x00223F 00:A22F: A5 9B     LDA ram_009B
C - - - - - 0x002241 00:A231: F0 03     BEQ bra_A236
C - - - - - 0x002243 00:A233: C6 9B     DEC ram_009B
C - - - - - 0x002245 00:A235: 60        RTS
bra_A236:
C - - - - - 0x002246 00:A236: A9 FF     LDA #$FF
C - - - - - 0x002248 00:A238: 85 00     STA ram_0000
C - - - - - 0x00224A 00:A23A: 85 01     STA ram_0001
C - - - - - 0x00224C 00:A23C: 4C 77 A2  JMP loc_A277



ofs_009_A23F_03_area_4:
C - - J - - 0x00224F 00:A23F: A9 C8     LDA #$C8
C - - - - - 0x002251 00:A241: 85 00     STA ram_0000
C - - - - - 0x002253 00:A243: 85 01     STA ram_0001
C - - - - - 0x002255 00:A245: 4C 69 A2  JMP loc_A269



ofs_009_A248_04_area_5:
C - - J - - 0x002258 00:A248: A9 90     LDA #$90
C - - - - - 0x00225A 00:A24A: 85 00     STA ram_0000
C - - - - - 0x00225C 00:A24C: A9 A8     LDA #$A8
C - - - - - 0x00225E 00:A24E: 85 01     STA ram_0001
C - - - - - 0x002260 00:A250: 4C 69 A2  JMP loc_A269



ofs_009_A253_07_area_8:
C - - J - - 0x002263 00:A253: A9 00     LDA #$00
C - - - - - 0x002265 00:A255: 95 F3     STA ram_btn_hold,X
C - - - - - 0x002267 00:A257: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x002269 00:A259: 4A        LSR
C - - - - - 0x00226A 00:A25A: B0 0C     BCS bra_A268_RTS
C - - - - - 0x00226C 00:A25C: A5 9B     LDA ram_009B
C - - - - - 0x00226E 00:A25E: F0 08     BEQ bra_A268_RTS
C - - - - - 0x002270 00:A260: C6 9B     DEC ram_009B
C - - - - - 0x002272 00:A262: D0 04     BNE bra_A268_RTS
C - - - - - 0x002274 00:A264: A9 01     LDA #$01
C - - - - - 0x002276 00:A266: 85 3F     STA ram_003F
bra_A268_RTS:
C - - - - - 0x002278 00:A268: 60        RTS



loc_A269:
C D 1 - - - 0x002279 00:A269: A9 00     LDA #$00
C - - - - - 0x00227B 00:A26B: A4 6F     LDY ram_006F
C - - - - - 0x00227D 00:A26D: D0 25     BNE bra_A294
C - - - - - 0x00227F 00:A26F: B5 CC     LDA ram_00CC,X
C - - - - - 0x002281 00:A271: D0 04     BNE bra_A277
C - - - - - 0x002283 00:A273: A9 80     LDA #con_btn_A
C - - - - - 0x002285 00:A275: 95 F1     STA ram_btn_press,X
bra_A277:
loc_A277:
C D 1 - - - 0x002287 00:A277: BD 4C 05  LDA ram_pos_X_hi_plr,X
C - - - - - 0x00228A 00:A27A: C9 E8     CMP #$E8
C - - - - - 0x00228C 00:A27C: B0 19     BCS bra_A297
C - - - - - 0x00228E 00:A27E: C5 00     CMP ram_0000
C - - - - - 0x002290 00:A280: 90 04     BCC bra_A286
C - - - - - 0x002292 00:A282: A0 01     LDY #$01
C - - - - - 0x002294 00:A284: 94 D2     STY ram_00D2,X
bra_A286:
C - - - - - 0x002296 00:A286: C5 01     CMP ram_0001
C - - - - - 0x002298 00:A288: 90 08     BCC bra_A292
C - - - - - 0x00229A 00:A28A: BD 66 05  LDA ram_attr_spr_plr,X
C - - - - - 0x00229D 00:A28D: 09 20     ORA #$20
C - - - - - 0x00229F 00:A28F: 9D 66 05  STA ram_attr_spr_plr,X
bra_A292:
C - - - - - 0x0022A2 00:A292: A9 01     LDA #con_btn_Right
bra_A294:   ; A = 00
C - - - - - 0x0022A4 00:A294: 95 F3     STA ram_btn_hold,X
C - - - - - 0x0022A6 00:A296: 60        RTS
bra_A297:
loc_A297:
C D 1 - - - 0x0022A7 00:A297: A9 08     LDA #$08
C - - - - - 0x0022A9 00:A299: 95 A0     STA ram_00A0,X
C - - - - - 0x0022AB 00:A29B: 60        RTS



loc_0x0022AC_cheat_code:
C D 1 - - - 0x0022AC 00:A29C: A4 50     LDY ram_cheat_input_cnt
C - - - - - 0x0022AE 00:A29E: 30 1C     BMI bra_A2BC_RTS    ; if cheat was entered/incorrect input and no second chance
C - - - - - 0x0022B0 00:A2A0: A5 F1     LDA ram_btn_press
C - - - - - 0x0022B2 00:A2A2: 29 CF     AND #con_btns_AB + con_btns_Dpad
C - - - - - 0x0022B4 00:A2A4: F0 16     BEQ bra_A2BC_RTS
C - - - - - 0x0022B6 00:A2A6: D9 BD A2  CMP tbl_A2BD_cheat_code,Y
C - - - - - 0x0022B9 00:A2A9: D0 0D     BNE bra_A2B8_incorrect_input
C - - - - - 0x0022BB 00:A2AB: C8        INY
C - - - - - 0x0022BC 00:A2AC: 84 50     STY ram_cheat_input_cnt
C - - - - - 0x0022BE 00:A2AE: B9 BD A2  LDA tbl_A2BD_cheat_code,Y
C - - - - - 0x0022C1 00:A2B1: D0 09     BNE bra_A2BC_RTS
; if cheat was entered successfully
C - - - - - 0x0022C3 00:A2B3: A9 01     LDA #$01
C - - - - - 0x0022C5 00:A2B5: 8D EC 07  STA ram_cheat_flag
bra_A2B8_incorrect_input:
C - - - - - 0x0022C8 00:A2B8: A9 FF     LDA #$FF
C - - - - - 0x0022CA 00:A2BA: 85 50     STA ram_cheat_input_cnt
bra_A2BC_RTS:
C - - - - - 0x0022CC 00:A2BC: 60        RTS



tbl_A2BD_cheat_code:
- D 1 - - - 0x0022CD 00:A2BD: 01        .byte con_btn_Right   ; 00
- D 1 - - - 0x0022CE 00:A2BE: 02        .byte con_btn_Left   ; 01
- D 1 - - - 0x0022CF 00:A2BF: 04        .byte con_btn_Down   ; 02
- D 1 - - - 0x0022D0 00:A2C0: 08        .byte con_btn_Up   ; 03
- D 1 - - - 0x0022D1 00:A2C1: 80        .byte con_btn_A   ; 04
- D 1 - - - 0x0022D2 00:A2C2: 40        .byte con_btn_B   ; 05
- D 1 - - - 0x0022D3 00:A2C3: 00        .byte $00   ; 06 end token



loc_0x0022D4:
; bzk garbage?
- - - - - - 0x0022D4 00:A2C4: 20 DC A2  JSR sub_A2DC
- - - - - - 0x0022D7 00:A2C7: A5 1B     LDA ram_счетчик_кадров
- - - - - - 0x0022D9 00:A2C9: 4A        LSR
- - - - - - 0x0022DA 00:A2CA: 4A        LSR
- - - - - - 0x0022DB 00:A2CB: 4A        LSR
- - - - - - 0x0022DC 00:A2CC: 4A        LSR
- - - - - - 0x0022DD 00:A2CD: A9 00     LDA #$00
- - - - - - 0x0022DF 00:A2CF: 90 05     BCC bra_A2D6
- - - - - - 0x0022E1 00:A2D1: A5 50     LDA ram_area
- - - - - - 0x0022E3 00:A2D3: 18        CLC
- - - - - - 0x0022E4 00:A2D4: 69 02     ADC #$02
bra_A2D6:
- - - - - - 0x0022E6 00:A2D6: A6 1E     LDX ram_index_ppu_buffer
- - - - - - 0x0022E8 00:A2D8: 9D FE 02  STA ram_nmt_buffer - $02,X
- - - - - - 0x0022EB 00:A2DB: 60        RTS



sub_A2DC:
; bzk garbage?
- - - - - - 0x0022EC 00:A2DC: A5 F5     LDA ram_copy_btn_press
- - - - - - 0x0022EE 00:A2DE: 29 0C     AND #con_btns_UD
- - - - - - 0x0022F0 00:A2E0: F0 14     BEQ bra_A2F6
- - - - - - 0x0022F2 00:A2E2: C9 08     CMP #con_btn_Up
- - - - - - 0x0022F4 00:A2E4: D0 08     BNE bra_A2EE
- - - - - - 0x0022F6 00:A2E6: A5 50     LDA ram_area
- - - - - - 0x0022F8 00:A2E8: F0 0C     BEQ bra_A2F6
- - - - - - 0x0022FA 00:A2EA: C6 50     DEC ram_area
- - - - - - 0x0022FC 00:A2EC: 10 08     BPL bra_A2F6
bra_A2EE:
- - - - - - 0x0022FE 00:A2EE: A5 50     LDA ram_area
- - - - - - 0x002300 00:A2F0: C9 07     CMP #$07
- - - - - - 0x002302 00:A2F2: F0 02     BEQ bra_A2F6
- - - - - - 0x002304 00:A2F4: E6 50     INC ram_area
bra_A2F6:
- - - - - - 0x002306 00:A2F6: A5 F5     LDA ram_copy_btn_press
- - - - - - 0x002308 00:A2F8: 29 10     AND #con_btn_Start
- - - - - - 0x00230A 00:A2FA: F0 0D     BEQ bra_A309_RTS
- - - - - - 0x00230C 00:A2FC: A5 50     LDA ram_area
- - - - - - 0x00230E 00:A2FE: 48        PHA
- - - - - - 0x00230F 00:A2FF: 20 D0 E5  JSR sub_0x01E5E0_clear_memory
- - - - - - 0x002312 00:A302: 68        PLA
- - - - - - 0x002313 00:A303: 20 84 E5  JSR sub_0x01E594
- - - - - - 0x002316 00:A306: 4C E5 E4  JMP loc_0x01E4F5
bra_A309_RTS:
- - - - - - 0x002319 00:A309: 60        RTS



loc_0x00231A_title_screen_handler:
C D 1 - - - 0x00231A 00:A30A: A5 80     LDA ram_0080
C - - - - - 0x00231C 00:A30C: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 1 - I - 0x00231F 00:A30F: 17 A3     .word ofs_010_A317_00
- D 1 - I - 0x002321 00:A311: 3C A3     .word ofs_010_A33C_01
- D 1 - I - 0x002323 00:A313: 6D A3     .word ofs_010_A36D_02
- D 1 - I - 0x002325 00:A315: B1 A3     .word ofs_010_A3B1_03



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
C - - - - - 0x00233B 00:A32B: 85 86     STA ram_0086
C - - - - - 0x00233D 00:A32D: A9 00     LDA #$00
C - - - - - 0x00233F 00:A32F: 85 FD     STA ram_scroll_X
C - - - - - 0x002341 00:A331: 85 FC     STA ram_scroll_Y
C - - - - - 0x002343 00:A333: A2 02     LDX #$02    ; title screen
C - - - - - 0x002345 00:A335: 20 8E 98  JSR sub_988E_draw_static_screen
loc_A338:
C D 1 - - - 0x002348 00:A338: E6 80     INC ram_0080
C - - - - - 0x00234A 00:A33A: 18        CLC
C - - - - - 0x00234B 00:A33B: 60        RTS



ofs_010_A33C_01:
C - - J - - 0x00234C 00:A33C: A5 1B     LDA ram_счетчик_кадров
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
C - - - - - 0x002385 00:A375: A5 82     LDA ram_0082
C - - - - - 0x002387 00:A377: 0A        ASL
C - - - - - 0x002388 00:A378: 65 82     ADC ram_0082
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
C - - - - - 0x00239F 00:A38F: 20 BE F7  JSR sub_0x01F7CE
C - - - - - 0x0023A2 00:A392: E6 82     INC ram_0082
C - - - - - 0x0023A4 00:A394: A5 82     LDA ram_0082
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



loc_0x0023C7_credits_handler:
C D 1 - - - 0x0023C7 00:A3B7: A5 61     LDA ram_0061
C - - - - - 0x0023C9 00:A3B9: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 1 - I - 0x0023CC 00:A3BC: C6 A3     .word ofs_011_A3C6_00
- D 1 - I - 0x0023CE 00:A3BE: EF A3     .word ofs_011_A3EF_01
- D 1 - I - 0x0023D0 00:A3C0: 02 A4     .word ofs_011_A402_02
- D 1 - I - 0x0023D2 00:A3C2: 16 A4     .word ofs_011_A416_03
- D 1 - I - 0x0023D4 00:A3C4: 26 A4     .word ofs_011_A426_04



ofs_011_A3C6_00:
; !!! ???
C - - J - - 0x0023D6 00:A3C6: A0 0F     LDY #$0F
C - - - - - 0x0023D8 00:A3C8: A9 00     LDA #$00
bra_A3CA_loop:
C - - - - - 0x0023DA 00:A3CA: 99 70 00  STA ram_0070,Y
C - - - - - 0x0023DD 00:A3CD: 88        DEY
C - - - - - 0x0023DE 00:A3CE: 10 FA     BPL bra_A3CA_loop
C - - - - - 0x0023E0 00:A3D0: 20 C0 E7  JSR sub_0x01E7D0
C - - - - - 0x0023E3 00:A3D3: A9 18     LDA #con_chr_bank + $18
C - - - - - 0x0023E5 00:A3D5: 8D F1 07  STA ram_chr_bank + $01
C - - - - - 0x0023E8 00:A3D8: A9 69     LDA #con_chr_bank + $69
C - - - - - 0x0023EA 00:A3DA: 8D F5 07  STA ram_chr_bank + $05
C - - - - - 0x0023ED 00:A3DD: A9 03     LDA #con_irq_credits
C - - - - - 0x0023EF 00:A3DF: 85 27     STA ram_irq_handler_hi
C - - - - - 0x0023F1 00:A3E1: 20 03 A6  JSR sub_A603
C - - - - - 0x0023F4 00:A3E4: A9 01     LDA #con_mirroring_H
C - - - - - 0x0023F6 00:A3E6: 85 26     STA ram_for_A000
C - - - - - 0x0023F8 00:A3E8: A9 02     LDA #$02
loc_A3EA:
C D 1 - - - 0x0023FA 00:A3EA: 85 70     STA ram_0070
loc_A3EC:
C D 1 - - - 0x0023FC 00:A3EC: E6 61     INC ram_0061
bra_A3EE_RTS:
C - - - - - 0x0023FE 00:A3EE: 60        RTS



ofs_011_A3EF_01:
C - - J - - 0x0023FF 00:A3EF: 20 03 A6  JSR sub_A603
C - - - - - 0x002402 00:A3F2: 20 6A A4  JSR sub_A46A
C - - - - - 0x002405 00:A3F5: C6 70     DEC ram_0070
C - - - - - 0x002407 00:A3F7: D0 F5     BNE bra_A3EE_RTS
C - - - - - 0x002409 00:A3F9: A9 00     LDA #$00
C - - - - - 0x00240B 00:A3FB: 85 71     STA ram_0071_flag
C - - - - - 0x00240D 00:A3FD: 85 72     STA ram_cam_spd_Y
C - - - - - 0x00240F 00:A3FF: 4C EC A3  JMP loc_A3EC



ofs_011_A402_02:
C - - J - - 0x002412 00:A402: 20 03 A6  JSR sub_A603
C - - - - - 0x002415 00:A405: 20 6A A4  JSR sub_A46A
C - - - - - 0x002418 00:A408: 20 38 A4  JSR sub_A438_helicopter_handler
C - - - - - 0x00241B 00:A40B: 20 95 A4  JSR sub_A495
C - - - - - 0x00241E 00:A40E: 90 05     BCC bra_A415_RTS
C - - - - - 0x002420 00:A410: A9 20     LDA #$20
C - - - - - 0x002422 00:A412: 4C EA A3  JMP loc_A3EA
bra_A415_RTS:
C - - - - - 0x002425 00:A415: 60        RTS



ofs_011_A416_03:
C - - J - - 0x002426 00:A416: 20 03 A6  JSR sub_A603
C - - - - - 0x002429 00:A419: 20 6A A4  JSR sub_A46A
C - - - - - 0x00242C 00:A41C: 20 38 A4  JSR sub_A438_helicopter_handler
C - - - - - 0x00242F 00:A41F: C6 70     DEC ram_0070
C - - - - - 0x002431 00:A421: D0 14     BNE bra_A437_RTS
C - - - - - 0x002433 00:A423: 4C EC A3  JMP loc_A3EC



ofs_011_A426_04:
C - - J - - 0x002436 00:A426: 20 03 A6  JSR sub_A603
C - - - - - 0x002439 00:A429: 20 6A A4  JSR sub_A46A
C - - - - - 0x00243C 00:A42C: 20 38 A4  JSR sub_A438_helicopter_handler
C - - - - - 0x00243F 00:A42F: A5 F1     LDA ram_btn_press
C - - - - - 0x002441 00:A431: 29 10     AND #con_btn_Start
C - - - - - 0x002443 00:A433: F0 02     BEQ bra_A437_RTS
C - - - - - 0x002445 00:A435: E6 60     INC ram_0060
bra_A437_RTS:
C - - - - - 0x002447 00:A437: 60        RTS



sub_A438_helicopter_handler:
; during credits
C - - - - - 0x002448 00:A438: AD 68 06  LDA ram_obj_state
C - - - - - 0x00244B 00:A43B: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 1 - I - 0x00244E 00:A43E: 42 A4     .word ofs_012_A442_00
- D 1 - I - 0x002450 00:A440: 4B A4     .word ofs_012_A44B_01



ofs_012_A442_00:
C - - J - - 0x002452 00:A442: A9 48     LDA #$48
C - - - - - 0x002454 00:A444: 8D 3C 05  STA ram_pos_X_hi_enemy
C - - - - - 0x002457 00:A447: EE 68 06  INC ram_obj_state
C - - - - - 0x00245A 00:A44A: 60        RTS



ofs_012_A44B_01:
C - - J - - 0x00245B 00:A44B: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00245D 00:A44D: 4A        LSR
C - - - - - 0x00245E 00:A44E: A9 38     LDA #$38
C - - - - - 0x002460 00:A450: 90 02     BCC bra_A454
C - - - - - 0x002462 00:A452: A9 39     LDA #$39
bra_A454:
C - - - - - 0x002464 00:A454: 8D 22 05  STA ram_pos_Y_hi_enemy
C - - - - - 0x002467 00:A457: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x002469 00:A459: 4A        LSR
C - - - - - 0x00246A 00:A45A: 4A        LSR
C - - - - - 0x00246B 00:A45B: A9 BA     LDA #$BA
C - - - - - 0x00246D 00:A45D: 90 02     BCC bra_A461
C - - - - - 0x00246F 00:A45F: A9 BB     LDA #$BB
bra_A461:
C - - - - - 0x002471 00:A461: 8D 08 05  STA ram_anim_id_enemy
C - - - - - 0x002474 00:A464: A9 03     LDA #$03
C - - - - - 0x002476 00:A466: 8D 56 05  STA ram_attr_spr_enemy
C - - - - - 0x002479 00:A469: 60        RTS



sub_A46A:
C - - - - - 0x00247A 00:A46A: E6 75     INC ram_0075
C - - - - - 0x00247C 00:A46C: A5 75     LDA ram_0075
C - - - - - 0x00247E 00:A46E: C9 04     CMP #$04
C - - - - - 0x002480 00:A470: 90 06     BCC bra_A478
C - - - - - 0x002482 00:A472: A9 00     LDA #$00
C - - - - - 0x002484 00:A474: 85 75     STA ram_0075
C - - - - - 0x002486 00:A476: E6 FD     INC ram_scroll_X
bra_A478:
C - - - - - 0x002488 00:A478: E6 76     INC ram_0076
C - - - - - 0x00248A 00:A47A: A5 76     LDA ram_0076
C - - - - - 0x00248C 00:A47C: C9 08     CMP #$08
C - - - - - 0x00248E 00:A47E: 90 06     BCC bra_A486
C - - - - - 0x002490 00:A480: A9 00     LDA #$00
C - - - - - 0x002492 00:A482: 85 76     STA ram_0076
C - - - - - 0x002494 00:A484: E6 73     INC ram_0073
bra_A486:
C - - - - - 0x002496 00:A486: E6 77     INC ram_0077
C - - - - - 0x002498 00:A488: A5 77     LDA ram_0077
C - - - - - 0x00249A 00:A48A: C9 16     CMP #$16
C - - - - - 0x00249C 00:A48C: 90 06     BCC bra_A494_RTS
C - - - - - 0x00249E 00:A48E: A9 00     LDA #$00
C - - - - - 0x0024A0 00:A490: 85 77     STA ram_0077
C - - - - - 0x0024A2 00:A492: E6 74     INC ram_0074
bra_A494_RTS:
C - - - - - 0x0024A4 00:A494: 60        RTS



sub_A495:
C - - - - - 0x0024A5 00:A495: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x0024A7 00:A497: 29 03     AND #$03
C - - - - - 0x0024A9 00:A499: F0 03     BEQ bra_A49E
C - - - - - 0x0024AB 00:A49B: 4C 25 A5  JMP loc_A525
bra_A49E:
C - - - - - 0x0024AE 00:A49E: A5 F9     LDA ram_00F9
C - - - - - 0x0024B0 00:A4A0: 18        CLC
C - - - - - 0x0024B1 00:A4A1: 69 01     ADC #$01
C - - - - - 0x0024B3 00:A4A3: C9 F0     CMP #$F0
C - - - - - 0x0024B5 00:A4A5: 90 02     BCC bra_A4A9
C - - - - - 0x0024B7 00:A4A7: 69 0F     ADC #$0F
bra_A4A9:
C - - - - - 0x0024B9 00:A4A9: 85 F9     STA ram_00F9
C - - - - - 0x0024BB 00:A4AB: 29 07     AND #$07
C - - - - - 0x0024BD 00:A4AD: D0 76     BNE bra_A525
C - - - - - 0x0024BF 00:A4AF: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x0024C1 00:A4B1: A9 06     LDA #con_buf_mode_06
C - - - - - 0x0024C3 00:A4B3: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0024C6 00:A4B6: E8        INX
C - - - - - 0x0024C7 00:A4B7: A5 F9     LDA ram_00F9
C - - - - - 0x0024C9 00:A4B9: 18        CLC
C - - - - - 0x0024CA 00:A4BA: 69 60     ADC #$60
C - - - - - 0x0024CC 00:A4BC: B0 04     BCS bra_A4C2
C - - - - - 0x0024CE 00:A4BE: C9 F0     CMP #$F0
C - - - - - 0x0024D0 00:A4C0: 90 02     BCC bra_A4C4
bra_A4C2:
C - - - - - 0x0024D2 00:A4C2: 69 0F     ADC #$0F
bra_A4C4:
C - - - - - 0x0024D4 00:A4C4: 29 F8     AND #$F8
C - - - - - 0x0024D6 00:A4C6: 85 00     STA ram_0000
C - - - - - 0x0024D8 00:A4C8: A9 09     LDA #$09
C - - - - - 0x0024DA 00:A4CA: 06 00     ASL ram_0000
C - - - - - 0x0024DC 00:A4CC: 2A        ROL
C - - - - - 0x0024DD 00:A4CD: 06 00     ASL ram_0000
C - - - - - 0x0024DF 00:A4CF: 2A        ROL
C - - - - - 0x0024E0 00:A4D0: 9D 00 03  STA ram_nmt_buffer,X    ; ppu hi
C - - - - - 0x0024E3 00:A4D3: E8        INX
C - - - - - 0x0024E4 00:A4D4: A5 00     LDA ram_0000
C - - - - - 0x0024E6 00:A4D6: 18        CLC
C - - - - - 0x0024E7 00:A4D7: 69 08     ADC #$08
C - - - - - 0x0024E9 00:A4D9: 9D 00 03  STA ram_nmt_buffer,X    ; ppu lo
C - - - - - 0x0024EC 00:A4DC: E8        INX
C - - - - - 0x0024ED 00:A4DD: A9 10     LDA #$10
C - - - - - 0x0024EF 00:A4DF: 9D 00 03  STA ram_nmt_buffer,X    ; counter
C - - - - - 0x0024F2 00:A4E2: E8        INX
C - - - - - 0x0024F3 00:A4E3: A9 00     LDA #$00
C - - - - - 0x0024F5 00:A4E5: A0 10     LDY #$10
bra_A4E7_loop:
C - - - - - 0x0024F7 00:A4E7: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0024FA 00:A4EA: E8        INX
C - - - - - 0x0024FB 00:A4EB: 88        DEY
C - - - - - 0x0024FC 00:A4EC: D0 F9     BNE bra_A4E7_loop
C - - - - - 0x0024FE 00:A4EE: A9 FF     LDA #$FF
C - - - - - 0x002500 00:A4F0: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x002503 00:A4F3: E8        INX
C - - - - - 0x002504 00:A4F4: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x002506 00:A4F6: E6 72     INC ram_cam_spd_Y
C - - - - - 0x002508 00:A4F8: A4 71     LDY ram_0071_flag
C - - - - - 0x00250A 00:A4FA: B9 3B A5  LDA tbl_A53B_credits,Y
C - - - - - 0x00250D 00:A4FD: C5 72     CMP ram_cam_spd_Y
C - - - - - 0x00250F 00:A4FF: D0 24     BNE bra_A525
C - - - - - 0x002511 00:A501: C8        INY
C - - - - - 0x002512 00:A502: B9 3B A5  LDA tbl_A53B_credits,Y
C - - - - - 0x002515 00:A505: 30 20     BMI bra_A527_FE_FF
C - - - - - 0x002517 00:A507: 8A        TXA
C - - - - - 0x002518 00:A508: 38        SEC
C - - - - - 0x002519 00:A509: E9 11     SBC #$11
C - - - - - 0x00251B 00:A50B: 18        CLC
C - - - - - 0x00251C 00:A50C: 79 3B A5  ADC tbl_A53B_credits,Y
C - - - - - 0x00251F 00:A50F: AA        TAX
C - - - - - 0x002520 00:A510: C8        INY
C - - - - - 0x002521 00:A511: B9 3B A5  LDA tbl_A53B_credits,Y
C - - - - - 0x002524 00:A514: 85 00     STA ram_0000
C - - - - - 0x002526 00:A516: C8        INY
bra_A517_loop:
C - - - - - 0x002527 00:A517: B9 3B A5  LDA tbl_A53B_credits,Y
C - - - - - 0x00252A 00:A51A: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x00252D 00:A51D: E8        INX
C - - - - - 0x00252E 00:A51E: C8        INY
C - - - - - 0x00252F 00:A51F: C6 00     DEC ram_0000
C - - - - - 0x002531 00:A521: D0 F4     BNE bra_A517_loop
C - - - - - 0x002533 00:A523: 84 71     STY ram_0071_flag
bra_A525:
loc_A525:
C D 1 - - - 0x002535 00:A525: 18        CLC
C - - - - - 0x002536 00:A526: 60        RTS
bra_A527_FE_FF:
C - - - - - 0x002537 00:A527: C9 FE     CMP #$FE
C - - - - - 0x002539 00:A529: D0 0E     BNE bra_A539_FF
; FE
C - - - - - 0x00253B 00:A52B: A9 10     LDA #$10
C - - - - - 0x00253D 00:A52D: 8D E1 03  STA ram_pal_buffer + $01
C - - - - - 0x002540 00:A530: 20 B8 F7  JSR sub_0x01F7C8
C - - - - - 0x002543 00:A533: E6 71     INC ram_0071_flag
C - - - - - 0x002545 00:A535: E6 71     INC ram_0071_flag
C - - - - - 0x002547 00:A537: 18        CLC
C - - - - - 0x002548 00:A538: 60        RTS
bra_A539_FF:
C - - - - - 0x002549 00:A539: 38        SEC
C - - - - - 0x00254A 00:A53A: 60        RTS



tbl_A53B_credits:
- D 1 - - - 0x00254B 00:A53B: 02        .byte $02   ; 
- D 1 - - - 0x00254C 00:A53C: 05        .byte $05   ; 

- D 1 - - - 0x00254D 00:A53D: 05        .byte $05   ; counter
- D 1 - - - 0x00254E 00:A53E: 1D        .byte $1D, $1E, $0B, $10, $10   ; "STAFF"

- D 1 - - - 0x002553 00:A543: 0A        .byte $0A   ; 
- D 1 - - - 0x002554 00:A544: 03        .byte $03   ; 

- D 1 - - - 0x002555 00:A545: 0A        .byte $0A   ; counter
- D 1 - - - 0x002556 00:A546: 1A        .byte $1A, $1C, $19, $11, $1C, $0B, $17, $17, $0F, $1C   ; "PROGRAMMER"

- D 1 - - - 0x002560 00:A550: 0E        .byte $0E   ; 
- D 1 - - - 0x002561 00:A551: 03        .byte $03   ; 

- D 1 - - - 0x002562 00:A552: 09        .byte $09   ; counter
- D 1 - - - 0x002563 00:A553: 1D        .byte $1D, $26, $1F, $17, $0F, $24, $0B, $15, $13   ; "S.UMEZAKI"

- D 1 - - - 0x00256C 00:A55C: 16        .byte $16   ; 
- D 1 - - - 0x00256D 00:A55D: 01        .byte $01   ; 

- D 1 - - - 0x00256E 00:A55E: 0E        .byte $0E   ; counter
- D 1 - - - 0x00256F 00:A55F: 11        .byte $11, $1C, $0B, $1A, $12, $13, $0D, $00, $0E, $0F, $1D, $13, $11, $18   ; "GRAPHIC DESIGN"

- D 1 - - - 0x00257D 00:A56D: 1A        .byte $1A   ; 
- D 1 - - - 0x00257E 00:A56E: 04        .byte $04   ; 

- D 1 - - - 0x00257F 00:A56F: 08        .byte $08   ; counter
- D 1 - - - 0x002580 00:A570: 1D        .byte $1D, $26, $17, $1F, $1C, $0B, $15, $13   ; "S.MURAKI"

- D 1 - - - 0x002588 00:A578: 22        .byte $22   ; 
- D 1 - - - 0x002589 00:A579: 02        .byte $02   ; 

- D 1 - - - 0x00258A 00:A57A: 0C        .byte $0C   ; counter
- D 1 - - - 0x00258B 00:A57B: 1D        .byte $1D, $19, $1F, $18, $0E, $00, $0E, $0F, $1D, $13, $11, $18   ; "SOUND DESIGN"

- D 1 - - - 0x002597 00:A587: 26        .byte $26   ; 
- D 1 - - - 0x002598 00:A588: 03        .byte $03   ; 

- D 1 - - - 0x002599 00:A589: 09        .byte $09   ; counter
- D 1 - - - 0x00259A 00:A58A: 12        .byte $12, $26, $17, $0B, $0F, $24, $0B, $21, $0B   ; "H.MAEZAWA"

- D 1 - - - 0x0025A3 00:A593: 2E        .byte $2E   ; 
- D 1 - - - 0x0025A4 00:A594: 01        .byte $01   ; 

- D 1 - - - 0x0025A5 00:A595: 0E        .byte $0E   ; counter
- D 1 - - - 0x0025A6 00:A596: 1D        .byte $1D, $1A, $0F, $0D, $13, $0B, $16, $00, $1E, $12, $0B, $18, $15, $1D   ; "SPECIAL THANKS"

- D 1 - - - 0x0025B4 00:A5A4: 32        .byte $32   ; 
- D 1 - - - 0x0025B5 00:A5A5: 03        .byte $03   ; 

- D 1 - - - 0x0025B6 00:A5A6: 0A        .byte $0A   ; counter
- D 1 - - - 0x0025B7 00:A5A7: 15        .byte $15, $26, $1D, $12, $13, $17, $19, $13, $0E, $0F   ; "K.SHIMOIDE"

- D 1 - - - 0x0025C1 00:A5B1: 35        .byte $35   ; 
- D 1 - - - 0x0025C2 00:A5B2: 02        .byte $02   ; 

- D 1 - - - 0x0025C3 00:A5B3: 0C        .byte $0C   ; counter
- D 1 - - - 0x0025C4 00:A5B4: 1D        .byte $1D, $1F, $1A, $0F, $1C, $00, $0D, $00, $1E, $0F, $0B, $17   ; "SUPER C TEAM"

- D 1 - - - 0x0025D0 00:A5C0: 3D        .byte $3D   ; 
- D 1 - - - 0x0025D1 00:A5C1: 02        .byte $02   ; 

- D 1 - - - 0x0025D2 00:A5C2: 0B        .byte $0B   ; counter
- D 1 - - - 0x0025D3 00:A5C3: 0E        .byte $0E, $13, $1C, $0F, $0D, $1E, $0F, $0E, $00, $0C, $23   ; "DIRECTED BY"

- D 1 - - - 0x0025DE 00:A5CE: 41        .byte $41   ; 
- D 1 - - - 0x0025DF 00:A5CF: 02        .byte $02   ; 

- D 1 - - - 0x0025E0 00:A5D0: 0C        .byte $0C   ; counter
- D 1 - - - 0x0025E1 00:A5D1: 1F        .byte $1F, $17, $0F, $0D, $12, $0B, $18, $00, $1E, $0F, $0B, $17   ; "UMECHAN TEAM"

- D 1 - - - 0x0025ED 00:A5DD: 50        .byte $50   ; 

- D 1 - - - 0x0025EE 00:A5DE: FE        .byte $FE   ; FE

- D 1 - - - 0x0025EF 00:A5DF: 51        .byte $51   ; 
- D 1 - - - 0x0025F0 00:A5E0: 03        .byte $03   ; 

- D 1 - - - 0x0025F1 00:A5E1: 0B        .byte $0B   ; counter
- D 1 - - - 0x0025F2 00:A5E2: 2E        .byte $2E, $2F, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D   ; konami logo (upper part)

- D 1 - - - 0x0025FD 00:A5ED: 52        .byte $52   ; 
- D 1 - - - 0x0025FE 00:A5EE: 02        .byte $02   ; 

- D 1 - - - 0x0025FF 00:A5EF: 0C        .byte $0C   ; counter
- D 1 - - - 0x002600 00:A5F0: 30        .byte $30, $31, $32, $3E, $3F, $40, $41, $42, $43, $44, $45, $46   ; konami logo (middle part)

- D 1 - - - 0x00260C 00:A5FC: 53        .byte $53   ; 
- D 1 - - - 0x00260D 00:A5FD: 02        .byte $02   ; 

- D 1 - - - 0x00260E 00:A5FE: 02        .byte $02   ; counter
- D 1 - - - 0x00260F 00:A5FF: 33        .byte $33, $34   ; konami logo (bottom part)

- D 1 - - - 0x002611 00:A601: 59        .byte $59   ; 

- D 1 - - - 0x002612 00:A602: FF        .byte $FF   ; end token



sub_A603:
C - - - - - 0x002613 00:A603: A9 00     LDA #$00
C - - - - - 0x002615 00:A605: 85 FA     STA ram_00FA
C - - - - - 0x002617 00:A607: A9 38     LDA #$38
C - - - - - 0x002619 00:A609: 85 45     STA ram_0045
C - - - - - 0x00261B 00:A60B: A5 F9     LDA ram_00F9
C - - - - - 0x00261D 00:A60D: 29 07     AND #$07
C - - - - - 0x00261F 00:A60F: 85 47     STA ram_0047
C - - - - - 0x002621 00:A611: A9 27     LDA #$27
C - - - - - 0x002623 00:A613: 38        SEC
C - - - - - 0x002624 00:A614: E5 47     SBC ram_0047
C - - - - - 0x002626 00:A616: 85 46     STA ram_0046
C - - - - - 0x002628 00:A618: E6 47     INC ram_0047
C - - - - - 0x00262A 00:A61A: E6 47     INC ram_0047
C - - - - - 0x00262C 00:A61C: E6 47     INC ram_0047
C - - - - - 0x00262E 00:A61E: A0 0B     LDY #$0B
C - - - - - 0x002630 00:A620: 84 4B     STY ram_004B
C - - - - - 0x002632 00:A622: A5 F9     LDA ram_00F9
C - - - - - 0x002634 00:A624: 29 F8     AND #$F8
C - - - - - 0x002636 00:A626: 0A        ASL
C - - - - - 0x002637 00:A627: 26 4B     ROL ram_004B
C - - - - - 0x002639 00:A629: 0A        ASL
C - - - - - 0x00263A 00:A62A: 26 4B     ROL ram_004B
C - - - - - 0x00263C 00:A62C: 85 4A     STA ram_004A
C - - - - - 0x00263E 00:A62E: 60        RTS



_off014_32_0x00263F_00:
- D 1 - I - 0x00263F 00:A62F: EE        .byte $EE   ; 
- D 1 - I - 0x002640 00:A630: 06        .byte $06   ; 
- D 1 - I - 0x002641 00:A631: E6        .byte $E6   ; 
- D 1 - I - 0x002642 00:A632: 06        .byte $06   ; 
- D 1 - I - 0x002643 00:A633: C5        .byte $C5   ; 
loc_FF_A634:
- D 1 - I - 0x002644 00:A634: EE        .byte $EE   ; 
- D 1 - I - 0x002645 00:A635: 06        .byte $06   ; 
- D 1 - I - 0x002646 00:A636: E6        .byte $E6   ; 
- D 1 - I - 0x002647 00:A637: 01        .byte $01   ; 
- D 1 - I - 0x002648 00:A638: C0        .byte $C0   ; 
- D 1 - I - 0x002649 00:A639: ED        .byte $ED   ; 
- D 1 - I - 0x00264A 00:A63A: 81        .byte $81   ; 
- D 1 - I - 0x00264B 00:A63B: EC        .byte $EC   ; 
- D 1 - I - 0x00264C 00:A63C: 05        .byte $05   ; 
- D 1 - I - 0x00264D 00:A63D: E9        .byte $E9   ; 
- D 1 - I - 0x00264E 00:A63E: B9        .byte $B9   ; 
- D 1 - I - 0x00264F 00:A63F: D6        .byte $D6   ; 
- D 1 - I - 0x002650 00:A640: 30        .byte $30   ; 
- D 1 - I - 0x002651 00:A641: 26        .byte $26   ; 
- D 1 - I - 0x002652 00:A642: 17        .byte $17   ; 
- D 1 - I - 0x002653 00:A643: E4        .byte $E4   ; 
- D 1 - I - 0x002654 00:A644: 53        .byte $53   ; 
- D 1 - I - 0x002655 00:A645: 22        .byte $22   ; 
- D 1 - I - 0x002656 00:A646: 74        .byte $74   ; 
- D 1 - I - 0x002657 00:A647: 22        .byte $22   ; 
- D 1 - I - 0x002658 00:A648: 84        .byte $84   ; 
- D 1 - I - 0x002659 00:A649: 22        .byte $22   ; 
- D 1 - I - 0x00265A 00:A64A: 91        .byte $91   ; 
- D 1 - I - 0x00265B 00:A64B: E6        .byte $E6   ; 
- D 1 - I - 0x00265C 00:A64C: 11        .byte $11   ; 
- D 1 - I - 0x00265D 00:A64D: 80        .byte $80   ; 
- D 1 - I - 0x00265E 00:A64E: E6        .byte $E6   ; 
- D 1 - I - 0x00265F 00:A64F: 06        .byte $06   ; 
- D 1 - I - 0x002660 00:A650: ED        .byte $ED   ; 
- D 1 - I - 0x002661 00:A651: 01        .byte $01   ; 
- D 1 - I - 0x002662 00:A652: E9        .byte $E9   ; 
- D 1 - I - 0x002663 00:A653: 31        .byte $31   ; 
- D 1 - I - 0x002664 00:A654: E2        .byte $E2   ; 
- D 1 - I - 0x002665 00:A655: 71        .byte $71   ; 
- D 1 - I - 0x002666 00:A656: 80        .byte $80   ; 
- D 1 - I - 0x002667 00:A657: E8        .byte $E8   ; 
- D 1 - I - 0x002668 00:A658: 11        .byte $11   ; 
- D 1 - I - 0x002669 00:A659: 94        .byte $94   ; 
- D 1 - I - 0x00266A 00:A65A: E8        .byte $E8   ; 
- D 1 - I - 0x00266B 00:A65B: 17        .byte $17   ; 
- D 1 - I - 0x00266C 00:A65C: E6        .byte $E6   ; 
- D 1 - I - 0x00266D 00:A65D: 01        .byte $01   ; 
- D 1 - I - 0x00266E 00:A65E: C0        .byte $C0   ; 
- D 1 - I - 0x00266F 00:A65F: E6        .byte $E6   ; 
- D 1 - I - 0x002670 00:A660: 06        .byte $06   ; 
- D 1 - I - 0x002671 00:A661: ED        .byte $ED   ; 
- D 1 - I - 0x002672 00:A662: 81        .byte $81   ; 
- D 1 - I - 0x002673 00:A663: E9        .byte $E9   ; 
- D 1 - I - 0x002674 00:A664: B9        .byte $B9   ; 
- D 1 - I - 0x002675 00:A665: E4        .byte $E4   ; 
- D 1 - I - 0x002676 00:A666: 22        .byte $22   ; 
- D 1 - I - 0x002677 00:A667: 74        .byte $74   ; 
- D 1 - I - 0x002678 00:A668: 22        .byte $22   ; 
- D 1 - I - 0x002679 00:A669: 84        .byte $84   ; 
- D 1 - I - 0x00267A 00:A66A: 22        .byte $22   ; 
- D 1 - I - 0x00267B 00:A66B: 91        .byte $91   ; 
- D 1 - I - 0x00267C 00:A66C: E6        .byte $E6   ; 
- D 1 - I - 0x00267D 00:A66D: 11        .byte $11   ; 
- D 1 - I - 0x00267E 00:A66E: 80        .byte $80   ; 
- D 1 - I - 0x00267F 00:A66F: E6        .byte $E6   ; 
- D 1 - I - 0x002680 00:A670: 06        .byte $06   ; 
- D 1 - I - 0x002681 00:A671: ED        .byte $ED   ; 
- D 1 - I - 0x002682 00:A672: 01        .byte $01   ; 
- D 1 - I - 0x002683 00:A673: E9        .byte $E9   ; 
- D 1 - I - 0x002684 00:A674: 31        .byte $31   ; 
- D 1 - I - 0x002685 00:A675: E2        .byte $E2   ; 
- D 1 - I - 0x002686 00:A676: 91        .byte $91   ; 
- D 1 - I - 0x002687 00:A677: 90        .byte $90   ; 
- D 1 - I - 0x002688 00:A678: E8        .byte $E8   ; 
- D 1 - I - 0x002689 00:A679: 11        .byte $11   ; 
- D 1 - I - 0x00268A 00:A67A: A4        .byte $A4   ; 
- D 1 - I - 0x00268B 00:A67B: E8        .byte $E8   ; 
- D 1 - I - 0x00268C 00:A67C: 17        .byte $17   ; 
- D 1 - I - 0x00268D 00:A67D: E6        .byte $E6   ; 
- D 1 - I - 0x00268E 00:A67E: 01        .byte $01   ; 
- D 1 - I - 0x00268F 00:A67F: C0        .byte $C0   ; 
- D 1 - I - 0x002690 00:A680: E6        .byte $E6   ; 
- D 1 - I - 0x002691 00:A681: 06        .byte $06   ; 
- D 1 - I - 0x002692 00:A682: ED        .byte $ED   ; 
- D 1 - I - 0x002693 00:A683: 81        .byte $81   ; 
- D 1 - I - 0x002694 00:A684: E9        .byte $E9   ; 
- D 1 - I - 0x002695 00:A685: B9        .byte $B9   ; 
- D 1 - I - 0x002696 00:A686: E4        .byte $E4   ; 
- D 1 - I - 0x002697 00:A687: 32        .byte $32   ; 
- D 1 - I - 0x002698 00:A688: 84        .byte $84   ; 
- D 1 - I - 0x002699 00:A689: 32        .byte $32   ; 
- D 1 - I - 0x00269A 00:A68A: 94        .byte $94   ; 
- D 1 - I - 0x00269B 00:A68B: 32        .byte $32   ; 
- D 1 - I - 0x00269C 00:A68C: A1        .byte $A1   ; 
- D 1 - I - 0x00269D 00:A68D: E6        .byte $E6   ; 
- D 1 - I - 0x00269E 00:A68E: 11        .byte $11   ; 
- D 1 - I - 0x00269F 00:A68F: 90        .byte $90   ; 
- D 1 - I - 0x0026A0 00:A690: E6        .byte $E6   ; 
- D 1 - I - 0x0026A1 00:A691: 06        .byte $06   ; 
- D 1 - I - 0x0026A2 00:A692: ED        .byte $ED   ; 
- D 1 - I - 0x0026A3 00:A693: 01        .byte $01   ; 
- D 1 - I - 0x0026A4 00:A694: E9        .byte $E9   ; 
- D 1 - I - 0x0026A5 00:A695: 31        .byte $31   ; 
- D 1 - I - 0x0026A6 00:A696: E2        .byte $E2   ; 
- D 1 - I - 0x0026A7 00:A697: 81        .byte $81   ; 
- D 1 - I - 0x0026A8 00:A698: 90        .byte $90   ; 
- D 1 - I - 0x0026A9 00:A699: E8        .byte $E8   ; 
- D 1 - I - 0x0026AA 00:A69A: 11        .byte $11   ; 
- D 1 - I - 0x0026AB 00:A69B: A4        .byte $A4   ; 
- D 1 - I - 0x0026AC 00:A69C: E8        .byte $E8   ; 
- D 1 - I - 0x0026AD 00:A69D: 17        .byte $17   ; 
- D 1 - I - 0x0026AE 00:A69E: E6        .byte $E6   ; 
- D 1 - I - 0x0026AF 00:A69F: 01        .byte $01   ; 
- D 1 - I - 0x0026B0 00:A6A0: C0        .byte $C0   ; 
- D 1 - I - 0x0026B1 00:A6A1: E6        .byte $E6   ; 
- D 1 - I - 0x0026B2 00:A6A2: 06        .byte $06   ; 
- D 1 - I - 0x0026B3 00:A6A3: ED        .byte $ED   ; 
- D 1 - I - 0x0026B4 00:A6A4: 81        .byte $81   ; 
- D 1 - I - 0x0026B5 00:A6A5: E9        .byte $E9   ; 
- D 1 - I - 0x0026B6 00:A6A6: B9        .byte $B9   ; 
- D 1 - I - 0x0026B7 00:A6A7: E4        .byte $E4   ; 
- D 1 - I - 0x0026B8 00:A6A8: 32        .byte $32   ; 
- D 1 - I - 0x0026B9 00:A6A9: 84        .byte $84   ; 
- D 1 - I - 0x0026BA 00:A6AA: 32        .byte $32   ; 
- D 1 - I - 0x0026BB 00:A6AB: 94        .byte $94   ; 
- D 1 - I - 0x0026BC 00:A6AC: 32        .byte $32   ; 
- D 1 - I - 0x0026BD 00:A6AD: A1        .byte $A1   ; 
- D 1 - I - 0x0026BE 00:A6AE: E6        .byte $E6   ; 
- D 1 - I - 0x0026BF 00:A6AF: 11        .byte $11   ; 
- D 1 - I - 0x0026C0 00:A6B0: 90        .byte $90   ; 
- D 1 - I - 0x0026C1 00:A6B1: E6        .byte $E6   ; 
- D 1 - I - 0x0026C2 00:A6B2: 06        .byte $06   ; 
- D 1 - I - 0x0026C3 00:A6B3: ED        .byte $ED   ; 
- D 1 - I - 0x0026C4 00:A6B4: 01        .byte $01   ; 
- D 1 - I - 0x0026C5 00:A6B5: E9        .byte $E9   ; 
- D 1 - I - 0x0026C6 00:A6B6: 31        .byte $31   ; 
- D 1 - I - 0x0026C7 00:A6B7: E2        .byte $E2   ; 
- D 1 - I - 0x0026C8 00:A6B8: 71        .byte $71   ; 
- D 1 - I - 0x0026C9 00:A6B9: 80        .byte $80   ; 
- D 1 - I - 0x0026CA 00:A6BA: EE        .byte $EE   ; 
- D 1 - I - 0x0026CB 00:A6BB: 09        .byte $09   ; 
- D 1 - I - 0x0026CC 00:A6BC: EC        .byte $EC   ; 
- D 1 - I - 0x0026CD 00:A6BD: 00        .byte $00   ; 
- D 1 - I - 0x0026CE 00:A6BE: E6        .byte $E6   ; 
- D 1 - I - 0x0026CF 00:A6BF: 01        .byte $01   ; 
- D 1 - I - 0x0026D0 00:A6C0: C0        .byte $C0   ; 
- D 1 - I - 0x0026D1 00:A6C1: ED        .byte $ED   ; 
- D 1 - I - 0x0026D2 00:A6C2: 81        .byte $81   ; 
- D 1 - I - 0x0026D3 00:A6C3: E9        .byte $E9   ; 
- D 1 - I - 0x0026D4 00:A6C4: B1        .byte $B1   ; 
- D 1 - I - 0x0026D5 00:A6C5: D6        .byte $D6   ; 
- D 1 - I - 0x0026D6 00:A6C6: 70        .byte $70   ; 
- D 1 - I - 0x0026D7 00:A6C7: 1C        .byte $1C   ; 
- D 1 - I - 0x0026D8 00:A6C8: 34        .byte $34   ; 
- D 1 - I - 0x0026D9 00:A6C9: E4        .byte $E4   ; 
- D 1 - I - 0x0026DA 00:A6CA: 94        .byte $94   ; 
- D 1 - I - 0x0026DB 00:A6CB: 90        .byte $90   ; 
- D 1 - I - 0x0026DC 00:A6CC: 20        .byte $20   ; 
- D 1 - I - 0x0026DD 00:A6CD: 80        .byte $80   ; 
- D 1 - I - 0x0026DE 00:A6CE: 70        .byte $70   ; 
- D 1 - I - 0x0026DF 00:A6CF: 50        .byte $50   ; 
- D 1 - I - 0x0026E0 00:A6D0: 70        .byte $70   ; 
- D 1 - I - 0x0026E1 00:A6D1: 90        .byte $90   ; 
- D 1 - I - 0x0026E2 00:A6D2: 20        .byte $20   ; 
- D 1 - I - 0x0026E3 00:A6D3: C0        .byte $C0   ; 
- D 1 - I - 0x0026E4 00:A6D4: F4        .byte $F4   ; 
- D 1 - I - 0x0026E5 00:A6D5: 50        .byte $50   ; 
- D 1 - I - 0x0026E6 00:A6D6: 70        .byte $70   ; 
- D 1 - I - 0x0026E7 00:A6D7: 90        .byte $90   ; 
- D 1 - I - 0x0026E8 00:A6D8: F0        .byte $F0   ; 
- D 1 - I - 0x0026E9 00:A6D9: 20        .byte $20   ; 
- D 1 - I - 0x0026EA 00:A6DA: 40        .byte $40   ; 
- D 1 - I - 0x0026EB 00:A6DB: 50        .byte $50   ; 
- D 1 - I - 0x0026EC 00:A6DC: 20        .byte $20   ; 
- D 1 - I - 0x0026ED 00:A6DD: A0        .byte $A0   ; 
- D 1 - I - 0x0026EE 00:A6DE: 20        .byte $20   ; 
- D 1 - I - 0x0026EF 00:A6DF: 90        .byte $90   ; 
- D 1 - I - 0x0026F0 00:A6E0: 70        .byte $70   ; 
- D 1 - I - 0x0026F1 00:A6E1: 50        .byte $50   ; 
- D 1 - I - 0x0026F2 00:A6E2: 70        .byte $70   ; 
- D 1 - I - 0x0026F3 00:A6E3: 90        .byte $90   ; 
- D 1 - I - 0x0026F4 00:A6E4: 30        .byte $30   ; 
- D 1 - I - 0x0026F5 00:A6E5: A3        .byte $A3   ; 
- D 1 - I - 0x0026F6 00:A6E6: 94        .byte $94   ; 
- D 1 - I - 0x0026F7 00:A6E7: 20        .byte $20   ; 
- D 1 - I - 0x0026F8 00:A6E8: 80        .byte $80   ; 
- D 1 - I - 0x0026F9 00:A6E9: 70        .byte $70   ; 
- D 1 - I - 0x0026FA 00:A6EA: 50        .byte $50   ; 
- D 1 - I - 0x0026FB 00:A6EB: 70        .byte $70   ; 
- D 1 - I - 0x0026FC 00:A6EC: 90        .byte $90   ; 
- D 1 - I - 0x0026FD 00:A6ED: 20        .byte $20   ; 
- D 1 - I - 0x0026FE 00:A6EE: C0        .byte $C0   ; 
- D 1 - I - 0x0026FF 00:A6EF: F4        .byte $F4   ; 
- D 1 - I - 0x002700 00:A6F0: 50        .byte $50   ; 
- D 1 - I - 0x002701 00:A6F1: 70        .byte $70   ; 
- D 1 - I - 0x002702 00:A6F2: 90        .byte $90   ; 
- D 1 - I - 0x002703 00:A6F3: F0        .byte $F0   ; 
- D 1 - I - 0x002704 00:A6F4: 20        .byte $20   ; 
- D 1 - I - 0x002705 00:A6F5: 40        .byte $40   ; 
- D 1 - I - 0x002706 00:A6F6: 50        .byte $50   ; 
- D 1 - I - 0x002707 00:A6F7: 20        .byte $20   ; 
- D 1 - I - 0x002708 00:A6F8: A0        .byte $A0   ; 
- D 1 - I - 0x002709 00:A6F9: 20        .byte $20   ; 
- D 1 - I - 0x00270A 00:A6FA: 90        .byte $90   ; 
- D 1 - I - 0x00270B 00:A6FB: 70        .byte $70   ; 
- D 1 - I - 0x00270C 00:A6FC: 50        .byte $50   ; 
- D 1 - I - 0x00270D 00:A6FD: 60        .byte $60   ; 
- D 1 - I - 0x00270E 00:A6FE: 70        .byte $70   ; 
- D 1 - I - 0x00270F 00:A6FF: 30        .byte $30   ; 
- D 1 - I - 0x002710 00:A700: C0        .byte $C0   ; 
- D 1 - I - 0x002711 00:A701: F4        .byte $F4   ; 
- D 1 - I - 0x002712 00:A702: 50        .byte $50   ; 
- D 1 - I - 0x002713 00:A703: 60        .byte $60   ; 
- D 1 - I - 0x002714 00:A704: E6        .byte $E6   ; 
- D 1 - I - 0x002715 00:A705: 05        .byte $05   ; 
- D 1 - I - 0x002716 00:A706: 70        .byte $70   ; 
- D 1 - I - 0x002717 00:A707: E6        .byte $E6   ; 
- D 1 - I - 0x002718 00:A708: 06        .byte $06   ; 
- D 1 - I - 0x002719 00:A709: E7        .byte $E7   ; 
- D 1 - I - 0x00271A 00:A70A: 25        .byte $25   ; 
- D 1 - I - 0x00271B 00:A70B: F0        .byte $F0   ; 
- D 1 - I - 0x00271C 00:A70C: E6        .byte $E6   ; 
- D 1 - I - 0x00271D 00:A70D: 01        .byte $01   ; 
- D 1 - I - 0x00271E 00:A70E: E5        .byte $E5   ; 
- D 1 - I - 0x00271F 00:A70F: 47        .byte $47   ; 
- D 1 - I - 0x002720 00:A710: 57        .byte $57   ; 
- D 1 - I - 0x002721 00:A711: 67        .byte $67   ; 
- D 1 - I - 0x002722 00:A712: 77        .byte $77   ; 
- D 1 - I - 0x002723 00:A713: 87        .byte $87   ; 
- D 1 - I - 0x002724 00:A714: 97        .byte $97   ; 
- D 1 - I - 0x002725 00:A715: A7        .byte $A7   ; 
- D 1 - I - 0x002726 00:A716: B7        .byte $B7   ; 
- D 1 - I - 0x002727 00:A717: E4        .byte $E4   ; 
- D 1 - I - 0x002728 00:A718: 07        .byte $07   ; 
- D 1 - I - 0x002729 00:A719: 17        .byte $17   ; 
- D 1 - I - 0x00272A 00:A71A: 27        .byte $27   ; 
- D 1 - I - 0x00272B 00:A71B: 37        .byte $37   ; 
- D 1 - I - 0x00272C 00:A71C: FE        .byte $FE   ; 
- D 1 - I - 0x00272D 00:A71D: FF        .byte $FF   ; 
- D 1 - I - 0x00272E 00:A71E: 34 A6     .word loc_FF_A634



_off014_32_0x002730_01:
- D 1 - I - 0x002730 00:A720: E6        .byte $E6   ; 
- D 1 - I - 0x002731 00:A721: 06        .byte $06   ; 
- D 1 - I - 0x002732 00:A722: C5        .byte $C5   ; 
loc_FF_A723:
- D 1 - I - 0x002733 00:A723: EC        .byte $EC   ; 
- D 1 - I - 0x002734 00:A724: 05        .byte $05   ; 
- D 1 - I - 0x002735 00:A725: E9        .byte $E9   ; 
- D 1 - I - 0x002736 00:A726: 39        .byte $39   ; 
- D 1 - I - 0x002737 00:A727: D6        .byte $D6   ; 
- D 1 - I - 0x002738 00:A728: 70        .byte $70   ; 
- D 1 - I - 0x002739 00:A729: 26        .byte $26   ; 
- D 1 - I - 0x00273A 00:A72A: 17        .byte $17   ; 
- D 1 - I - 0x00273B 00:A72B: E3        .byte $E3   ; 
- D 1 - I - 0x00273C 00:A72C: 53        .byte $53   ; 
- D 1 - I - 0x00273D 00:A72D: 22        .byte $22   ; 
- D 1 - I - 0x00273E 00:A72E: 74        .byte $74   ; 
- D 1 - I - 0x00273F 00:A72F: 22        .byte $22   ; 
- D 1 - I - 0x002740 00:A730: 84        .byte $84   ; 
- D 1 - I - 0x002741 00:A731: 22        .byte $22   ; 
- D 1 - I - 0x002742 00:A732: 91        .byte $91   ; 
- D 1 - I - 0x002743 00:A733: 82        .byte $82   ; 
- D 1 - I - 0x002744 00:A734: E9        .byte $E9   ; 
- D 1 - I - 0x002745 00:A735: 30        .byte $30   ; 
- D 1 - I - 0x002746 00:A736: E2        .byte $E2   ; 
- D 1 - I - 0x002747 00:A737: 01        .byte $01   ; 
- D 1 - I - 0x002748 00:A738: 10        .byte $10   ; 
- D 1 - I - 0x002749 00:A739: 27        .byte $27   ; 
- D 1 - I - 0x00274A 00:A73A: E9        .byte $E9   ; 
- D 1 - I - 0x00274B 00:A73B: 70        .byte $70   ; 
- D 1 - I - 0x00274C 00:A73C: E3        .byte $E3   ; 
- D 1 - I - 0x00274D 00:A73D: 74        .byte $74   ; 
- D 1 - I - 0x00274E 00:A73E: E3        .byte $E3   ; 
- D 1 - I - 0x00274F 00:A73F: 22        .byte $22   ; 
- D 1 - I - 0x002750 00:A740: 84        .byte $84   ; 
- D 1 - I - 0x002751 00:A741: 22        .byte $22   ; 
- D 1 - I - 0x002752 00:A742: 91        .byte $91   ; 
- D 1 - I - 0x002753 00:A743: 82        .byte $82   ; 
- D 1 - I - 0x002754 00:A744: E9        .byte $E9   ; 
- D 1 - I - 0x002755 00:A745: 30        .byte $30   ; 
- D 1 - I - 0x002756 00:A746: E2        .byte $E2   ; 
- D 1 - I - 0x002757 00:A747: 21        .byte $21   ; 
- D 1 - I - 0x002758 00:A748: 20        .byte $20   ; 
- D 1 - I - 0x002759 00:A749: 37        .byte $37   ; 
- D 1 - I - 0x00275A 00:A74A: E9        .byte $E9   ; 
- D 1 - I - 0x00275B 00:A74B: 70        .byte $70   ; 
- D 1 - I - 0x00275C 00:A74C: E3        .byte $E3   ; 
- D 1 - I - 0x00275D 00:A74D: 84        .byte $84   ; 
- D 1 - I - 0x00275E 00:A74E: E3        .byte $E3   ; 
- D 1 - I - 0x00275F 00:A74F: 32        .byte $32   ; 
- D 1 - I - 0x002760 00:A750: 94        .byte $94   ; 
- D 1 - I - 0x002761 00:A751: 32        .byte $32   ; 
- D 1 - I - 0x002762 00:A752: A1        .byte $A1   ; 
- D 1 - I - 0x002763 00:A753: 92        .byte $92   ; 
- D 1 - I - 0x002764 00:A754: E9        .byte $E9   ; 
- D 1 - I - 0x002765 00:A755: 30        .byte $30   ; 
- D 1 - I - 0x002766 00:A756: E2        .byte $E2   ; 
- D 1 - I - 0x002767 00:A757: 11        .byte $11   ; 
- D 1 - I - 0x002768 00:A758: 20        .byte $20   ; 
- D 1 - I - 0x002769 00:A759: 37        .byte $37   ; 
- D 1 - I - 0x00276A 00:A75A: E9        .byte $E9   ; 
- D 1 - I - 0x00276B 00:A75B: 70        .byte $70   ; 
- D 1 - I - 0x00276C 00:A75C: E3        .byte $E3   ; 
- D 1 - I - 0x00276D 00:A75D: 84        .byte $84   ; 
- D 1 - I - 0x00276E 00:A75E: E3        .byte $E3   ; 
- D 1 - I - 0x00276F 00:A75F: 32        .byte $32   ; 
- D 1 - I - 0x002770 00:A760: 94        .byte $94   ; 
- D 1 - I - 0x002771 00:A761: 32        .byte $32   ; 
- D 1 - I - 0x002772 00:A762: A1        .byte $A1   ; 
- D 1 - I - 0x002773 00:A763: 92        .byte $92   ; 
- D 1 - I - 0x002774 00:A764: E9        .byte $E9   ; 
- D 1 - I - 0x002775 00:A765: 30        .byte $30   ; 
- D 1 - I - 0x002776 00:A766: E2        .byte $E2   ; 
- D 1 - I - 0x002777 00:A767: 01        .byte $01   ; 
- D 1 - I - 0x002778 00:A768: 10        .byte $10   ; 
- D 1 - I - 0x002779 00:A769: EC        .byte $EC   ; 
- D 1 - I - 0x00277A 00:A76A: 00        .byte $00   ; 
- D 1 - I - 0x00277B 00:A76B: E9        .byte $E9   ; 
- D 1 - I - 0x00277C 00:A76C: B1        .byte $B1   ; 
- D 1 - I - 0x00277D 00:A76D: D6        .byte $D6   ; 
- D 1 - I - 0x00277E 00:A76E: 30        .byte $30   ; 
- D 1 - I - 0x00277F 00:A76F: 27        .byte $27   ; 
- D 1 - I - 0x002780 00:A770: 34        .byte $34   ; 
- D 1 - I - 0x002781 00:A771: E2        .byte $E2   ; 
- D 1 - I - 0x002782 00:A772: 21        .byte $21   ; 
- D 1 - I - 0x002783 00:A773: 40        .byte $40   ; 
- D 1 - I - 0x002784 00:A774: 50        .byte $50   ; 
- D 1 - I - 0x002785 00:A775: 20        .byte $20   ; 
- D 1 - I - 0x002786 00:A776: 90        .byte $90   ; 
- D 1 - I - 0x002787 00:A777: C0        .byte $C0   ; 
- D 1 - I - 0x002788 00:A778: 80        .byte $80   ; 
- D 1 - I - 0x002789 00:A779: 70        .byte $70   ; 
- D 1 - I - 0x00278A 00:A77A: 50        .byte $50   ; 
- D 1 - I - 0x00278B 00:A77B: 70        .byte $70   ; 
- D 1 - I - 0x00278C 00:A77C: 90        .byte $90   ; 
- D 1 - I - 0x00278D 00:A77D: 20        .byte $20   ; 
- D 1 - I - 0x00278E 00:A77E: C0        .byte $C0   ; 
- D 1 - I - 0x00278F 00:A77F: F4        .byte $F4   ; 
- D 1 - I - 0x002790 00:A780: 50        .byte $50   ; 
- D 1 - I - 0x002791 00:A781: 70        .byte $70   ; 
- D 1 - I - 0x002792 00:A782: 90        .byte $90   ; 
- D 1 - I - 0x002793 00:A783: F0        .byte $F0   ; 
- D 1 - I - 0x002794 00:A784: E2        .byte $E2   ; 
- D 1 - I - 0x002795 00:A785: 20        .byte $20   ; 
- D 1 - I - 0x002796 00:A786: 40        .byte $40   ; 
- D 1 - I - 0x002797 00:A787: 50        .byte $50   ; 
- D 1 - I - 0x002798 00:A788: 20        .byte $20   ; 
- D 1 - I - 0x002799 00:A789: A0        .byte $A0   ; 
- D 1 - I - 0x00279A 00:A78A: C0        .byte $C0   ; 
- D 1 - I - 0x00279B 00:A78B: 90        .byte $90   ; 
- D 1 - I - 0x00279C 00:A78C: 70        .byte $70   ; 
- D 1 - I - 0x00279D 00:A78D: 50        .byte $50   ; 
- D 1 - I - 0x00279E 00:A78E: 70        .byte $70   ; 
- D 1 - I - 0x00279F 00:A78F: 90        .byte $90   ; 
- D 1 - I - 0x0027A0 00:A790: 34        .byte $34   ; 
- D 1 - I - 0x0027A1 00:A791: 20        .byte $20   ; 
- D 1 - I - 0x0027A2 00:A792: 40        .byte $40   ; 
- D 1 - I - 0x0027A3 00:A793: 50        .byte $50   ; 
- D 1 - I - 0x0027A4 00:A794: 20        .byte $20   ; 
- D 1 - I - 0x0027A5 00:A795: 90        .byte $90   ; 
- D 1 - I - 0x0027A6 00:A796: C0        .byte $C0   ; 
- D 1 - I - 0x0027A7 00:A797: 80        .byte $80   ; 
- D 1 - I - 0x0027A8 00:A798: 70        .byte $70   ; 
- D 1 - I - 0x0027A9 00:A799: 50        .byte $50   ; 
- D 1 - I - 0x0027AA 00:A79A: 70        .byte $70   ; 
- D 1 - I - 0x0027AB 00:A79B: 90        .byte $90   ; 
- D 1 - I - 0x0027AC 00:A79C: 20        .byte $20   ; 
- D 1 - I - 0x0027AD 00:A79D: C0        .byte $C0   ; 
- D 1 - I - 0x0027AE 00:A79E: F4        .byte $F4   ; 
- D 1 - I - 0x0027AF 00:A79F: 50        .byte $50   ; 
- D 1 - I - 0x0027B0 00:A7A0: 70        .byte $70   ; 
- D 1 - I - 0x0027B1 00:A7A1: 90        .byte $90   ; 
- D 1 - I - 0x0027B2 00:A7A2: F0        .byte $F0   ; 
- D 1 - I - 0x0027B3 00:A7A3: E2        .byte $E2   ; 
- D 1 - I - 0x0027B4 00:A7A4: 20        .byte $20   ; 
- D 1 - I - 0x0027B5 00:A7A5: 40        .byte $40   ; 
- D 1 - I - 0x0027B6 00:A7A6: 50        .byte $50   ; 
- D 1 - I - 0x0027B7 00:A7A7: 20        .byte $20   ; 
- D 1 - I - 0x0027B8 00:A7A8: A0        .byte $A0   ; 
- D 1 - I - 0x0027B9 00:A7A9: C0        .byte $C0   ; 
- D 1 - I - 0x0027BA 00:A7AA: 90        .byte $90   ; 
- D 1 - I - 0x0027BB 00:A7AB: 70        .byte $70   ; 
- D 1 - I - 0x0027BC 00:A7AC: 50        .byte $50   ; 
- D 1 - I - 0x0027BD 00:A7AD: 60        .byte $60   ; 
- D 1 - I - 0x0027BE 00:A7AE: 70        .byte $70   ; 
- D 1 - I - 0x0027BF 00:A7AF: 30        .byte $30   ; 
- D 1 - I - 0x0027C0 00:A7B0: C0        .byte $C0   ; 
- D 1 - I - 0x0027C1 00:A7B1: F4        .byte $F4   ; 
- D 1 - I - 0x0027C2 00:A7B2: 50        .byte $50   ; 
- D 1 - I - 0x0027C3 00:A7B3: 60        .byte $60   ; 
- D 1 - I - 0x0027C4 00:A7B4: 70        .byte $70   ; 
- D 1 - I - 0x0027C5 00:A7B5: E7        .byte $E7   ; 
- D 1 - I - 0x0027C6 00:A7B6: 24        .byte $24   ; 
- D 1 - I - 0x0027C7 00:A7B7: F0        .byte $F0   ; 
- D 1 - I - 0x0027C8 00:A7B8: E6        .byte $E6   ; 
- D 1 - I - 0x0027C9 00:A7B9: 01        .byte $01   ; 
- D 1 - I - 0x0027CA 00:A7BA: E3        .byte $E3   ; 
- D 1 - I - 0x0027CB 00:A7BB: 47        .byte $47   ; 
- D 1 - I - 0x0027CC 00:A7BC: 57        .byte $57   ; 
- D 1 - I - 0x0027CD 00:A7BD: 67        .byte $67   ; 
- D 1 - I - 0x0027CE 00:A7BE: 77        .byte $77   ; 
- D 1 - I - 0x0027CF 00:A7BF: 87        .byte $87   ; 
- D 1 - I - 0x0027D0 00:A7C0: 97        .byte $97   ; 
- D 1 - I - 0x0027D1 00:A7C1: A7        .byte $A7   ; 
- D 1 - I - 0x0027D2 00:A7C2: B7        .byte $B7   ; 
- D 1 - I - 0x0027D3 00:A7C3: E2        .byte $E2   ; 
- D 1 - I - 0x0027D4 00:A7C4: 07        .byte $07   ; 
- D 1 - I - 0x0027D5 00:A7C5: 17        .byte $17   ; 
- D 1 - I - 0x0027D6 00:A7C6: 27        .byte $27   ; 
- D 1 - I - 0x0027D7 00:A7C7: 37        .byte $37   ; 
- D 1 - I - 0x0027D8 00:A7C8: FE        .byte $FE   ; 
- D 1 - I - 0x0027D9 00:A7C9: FF        .byte $FF   ; 
- D 1 - I - 0x0027DA 00:A7CA: 23 A7     .word loc_FF_A723



_off014_32_0x0027DC_02:
- D 1 - I - 0x0027DC 00:A7CC: E6        .byte $E6   ; 
- D 1 - I - 0x0027DD 00:A7CD: 06        .byte $06   ; 
- D 1 - I - 0x0027DE 00:A7CE: C5        .byte $C5   ; 
loc_FF_A7CF:
- D 1 - I - 0x0027DF 00:A7CF: D6        .byte $D6   ; 
- D 1 - I - 0x0027E0 00:A7D0: 00        .byte $00   ; 
- D 1 - I - 0x0027E1 00:A7D1: E4        .byte $E4   ; 
- D 1 - I - 0x0027E2 00:A7D2: 53        .byte $53   ; 
- D 1 - I - 0x0027E3 00:A7D3: 22        .byte $22   ; 
- D 1 - I - 0x0027E4 00:A7D4: 74        .byte $74   ; 
- D 1 - I - 0x0027E5 00:A7D5: 22        .byte $22   ; 
- D 1 - I - 0x0027E6 00:A7D6: 84        .byte $84   ; 
- D 1 - I - 0x0027E7 00:A7D7: 22        .byte $22   ; 
- D 1 - I - 0x0027E8 00:A7D8: 91        .byte $91   ; 
- D 1 - I - 0x0027E9 00:A7D9: 82        .byte $82   ; 
- D 1 - I - 0x0027EA 00:A7DA: 72        .byte $72   ; 
- D 1 - I - 0x0027EB 00:A7DB: 54        .byte $54   ; 
- D 1 - I - 0x0027EC 00:A7DC: 22        .byte $22   ; 
- D 1 - I - 0x0027ED 00:A7DD: 74        .byte $74   ; 
- D 1 - I - 0x0027EE 00:A7DE: E4        .byte $E4   ; 
- D 1 - I - 0x0027EF 00:A7DF: 22        .byte $22   ; 
- D 1 - I - 0x0027F0 00:A7E0: 84        .byte $84   ; 
- D 1 - I - 0x0027F1 00:A7E1: 22        .byte $22   ; 
- D 1 - I - 0x0027F2 00:A7E2: 91        .byte $91   ; 
- D 1 - I - 0x0027F3 00:A7E3: 82        .byte $82   ; 
- D 1 - I - 0x0027F4 00:A7E4: 73        .byte $73   ; 
- D 1 - I - 0x0027F5 00:A7E5: 63        .byte $63   ; 
- D 1 - I - 0x0027F6 00:A7E6: 32        .byte $32   ; 
- D 1 - I - 0x0027F7 00:A7E7: 84        .byte $84   ; 
- D 1 - I - 0x0027F8 00:A7E8: 32        .byte $32   ; 
- D 1 - I - 0x0027F9 00:A7E9: 94        .byte $94   ; 
- D 1 - I - 0x0027FA 00:A7EA: 32        .byte $32   ; 
- D 1 - I - 0x0027FB 00:A7EB: A1        .byte $A1   ; 
- D 1 - I - 0x0027FC 00:A7EC: 92        .byte $92   ; 
- D 1 - I - 0x0027FD 00:A7ED: E4        .byte $E4   ; 
- D 1 - I - 0x0027FE 00:A7EE: 82        .byte $82   ; 
- D 1 - I - 0x0027FF 00:A7EF: 64        .byte $64   ; 
- D 1 - I - 0x002800 00:A7F0: 32        .byte $32   ; 
- D 1 - I - 0x002801 00:A7F1: 84        .byte $84   ; 
- D 1 - I - 0x002802 00:A7F2: 32        .byte $32   ; 
- D 1 - I - 0x002803 00:A7F3: 94        .byte $94   ; 
- D 1 - I - 0x002804 00:A7F4: 32        .byte $32   ; 
- D 1 - I - 0x002805 00:A7F5: A1        .byte $A1   ; 
- D 1 - I - 0x002806 00:A7F6: 92        .byte $92   ; 
- D 1 - I - 0x002807 00:A7F7: 72        .byte $72   ; 
- D 1 - I - 0x002808 00:A7F8: D6        .byte $D6   ; 
- D 1 - I - 0x002809 00:A7F9: 0D        .byte $0D   ; 
- D 1 - I - 0x00280A 00:A7FA: E4        .byte $E4   ; 
- D 1 - I - 0x00280B 00:A7FB: 71        .byte $71   ; 
- D 1 - I - 0x00280C 00:A7FC: E3        .byte $E3   ; 
- D 1 - I - 0x00280D 00:A7FD: 40        .byte $40   ; 
- D 1 - I - 0x00280E 00:A7FE: 50        .byte $50   ; 
- D 1 - I - 0x00280F 00:A7FF: 20        .byte $20   ; 
- D 1 - I - 0x002810 00:A800: 90        .byte $90   ; 
- D 1 - I - 0x002811 00:A801: 20        .byte $20   ; 
- D 1 - I - 0x002812 00:A802: 80        .byte $80   ; 
- D 1 - I - 0x002813 00:A803: 70        .byte $70   ; 
- D 1 - I - 0x002814 00:A804: 50        .byte $50   ; 
- D 1 - I - 0x002815 00:A805: 70        .byte $70   ; 
- D 1 - I - 0x002816 00:A806: 90        .byte $90   ; 
- D 1 - I - 0x002817 00:A807: 20        .byte $20   ; 
- D 1 - I - 0x002818 00:A808: C3        .byte $C3   ; 
- D 1 - I - 0x002819 00:A809: 20        .byte $20   ; 
- D 1 - I - 0x00281A 00:A80A: 40        .byte $40   ; 
- D 1 - I - 0x00281B 00:A80B: 50        .byte $50   ; 
- D 1 - I - 0x00281C 00:A80C: 20        .byte $20   ; 
- D 1 - I - 0x00281D 00:A80D: A0        .byte $A0   ; 
- D 1 - I - 0x00281E 00:A80E: 20        .byte $20   ; 
- D 1 - I - 0x00281F 00:A80F: 90        .byte $90   ; 
- D 1 - I - 0x002820 00:A810: 70        .byte $70   ; 
- D 1 - I - 0x002821 00:A811: 50        .byte $50   ; 
- D 1 - I - 0x002822 00:A812: 70        .byte $70   ; 
- D 1 - I - 0x002823 00:A813: 90        .byte $90   ; 
- D 1 - I - 0x002824 00:A814: 31        .byte $31   ; 
- D 1 - I - 0x002825 00:A815: C2        .byte $C2   ; 
- D 1 - I - 0x002826 00:A816: 20        .byte $20   ; 
- D 1 - I - 0x002827 00:A817: 40        .byte $40   ; 
- D 1 - I - 0x002828 00:A818: 50        .byte $50   ; 
- D 1 - I - 0x002829 00:A819: 20        .byte $20   ; 
- D 1 - I - 0x00282A 00:A81A: 90        .byte $90   ; 
- D 1 - I - 0x00282B 00:A81B: 20        .byte $20   ; 
- D 1 - I - 0x00282C 00:A81C: 80        .byte $80   ; 
- D 1 - I - 0x00282D 00:A81D: 70        .byte $70   ; 
- D 1 - I - 0x00282E 00:A81E: 50        .byte $50   ; 
- D 1 - I - 0x00282F 00:A81F: 70        .byte $70   ; 
- D 1 - I - 0x002830 00:A820: 90        .byte $90   ; 
- D 1 - I - 0x002831 00:A821: 20        .byte $20   ; 
- D 1 - I - 0x002832 00:A822: C3        .byte $C3   ; 
- D 1 - I - 0x002833 00:A823: 20        .byte $20   ; 
- D 1 - I - 0x002834 00:A824: 40        .byte $40   ; 
- D 1 - I - 0x002835 00:A825: 50        .byte $50   ; 
- D 1 - I - 0x002836 00:A826: 20        .byte $20   ; 
- D 1 - I - 0x002837 00:A827: A0        .byte $A0   ; 
- D 1 - I - 0x002838 00:A828: 20        .byte $20   ; 
- D 1 - I - 0x002839 00:A829: 90        .byte $90   ; 
- D 1 - I - 0x00283A 00:A82A: 70        .byte $70   ; 
- D 1 - I - 0x00283B 00:A82B: 50        .byte $50   ; 
- D 1 - I - 0x00283C 00:A82C: 60        .byte $60   ; 
- D 1 - I - 0x00283D 00:A82D: 90        .byte $90   ; 
- D 1 - I - 0x00283E 00:A82E: 31        .byte $31   ; 
- D 1 - I - 0x00283F 00:A82F: C2        .byte $C2   ; 
- D 1 - I - 0x002840 00:A830: D1        .byte $D1   ; 
- D 1 - I - 0x002841 00:A831: 02        .byte $02   ; 
- D 1 - I - 0x002842 00:A832: E4        .byte $E4   ; 
- D 1 - I - 0x002843 00:A833: 47        .byte $47   ; 
- D 1 - I - 0x002844 00:A834: 57        .byte $57   ; 
- D 1 - I - 0x002845 00:A835: 67        .byte $67   ; 
- D 1 - I - 0x002846 00:A836: 77        .byte $77   ; 
- D 1 - I - 0x002847 00:A837: 87        .byte $87   ; 
- D 1 - I - 0x002848 00:A838: 97        .byte $97   ; 
- D 1 - I - 0x002849 00:A839: A7        .byte $A7   ; 
- D 1 - I - 0x00284A 00:A83A: B7        .byte $B7   ; 
- D 1 - I - 0x00284B 00:A83B: E3        .byte $E3   ; 
- D 1 - I - 0x00284C 00:A83C: 07        .byte $07   ; 
- D 1 - I - 0x00284D 00:A83D: 17        .byte $17   ; 
- D 1 - I - 0x00284E 00:A83E: 27        .byte $27   ; 
- D 1 - I - 0x00284F 00:A83F: 37        .byte $37   ; 
- D 1 - I - 0x002850 00:A840: FE        .byte $FE   ; 
- D 1 - I - 0x002851 00:A841: FF        .byte $FF   ; 
- D 1 - I - 0x002852 00:A842: CF A7     .word loc_FF_A7CF



_off014_32_0x002854_03:
- D 1 - I - 0x002854 00:A844: D1        .byte $D1   ; 
- D 1 - I - 0x002855 00:A845: B0        .byte $B0   ; 
- D 1 - I - 0x002856 00:A846: 24        .byte $24   ; 
- D 1 - I - 0x002857 00:A847: B0        .byte $B0   ; 
- D 1 - I - 0x002858 00:A848: 24        .byte $24   ; 
- D 1 - I - 0x002859 00:A849: A0        .byte $A0   ; 
- D 1 - I - 0x00285A 00:A84A: 2A        .byte $2A   ; 
- D 1 - I - 0x00285B 00:A84B: A0        .byte $A0   ; 
- D 1 - I - 0x00285C 00:A84C: 24        .byte $24   ; 
- D 1 - I - 0x00285D 00:A84D: A0        .byte $A0   ; 
- D 1 - I - 0x00285E 00:A84E: 24        .byte $24   ; 
loc_FF_A84F:
- D 1 - I - 0x00285F 00:A84F: D1        .byte $D1   ; 
- D 1 - I - 0x002860 00:A850: FB        .byte $FB   ; 
- D 1 - I - 0x002861 00:A851: B0        .byte $B0   ; 
- D 1 - I - 0x002862 00:A852: 2A        .byte $2A   ; 
- D 1 - I - 0x002863 00:A853: 25        .byte $25   ; 
- D 1 - I - 0x002864 00:A854: 25        .byte $25   ; 
- D 1 - I - 0x002865 00:A855: A0        .byte $A0   ; 
- D 1 - I - 0x002866 00:A856: 2A        .byte $2A   ; 
- D 1 - I - 0x002867 00:A857: 25        .byte $25   ; 
- D 1 - I - 0x002868 00:A858: A0        .byte $A0   ; 
- D 1 - I - 0x002869 00:A859: 24        .byte $24   ; 
- D 1 - I - 0x00286A 00:A85A: B0        .byte $B0   ; 
- D 1 - I - 0x00286B 00:A85B: 2A        .byte $2A   ; 
- D 1 - I - 0x00286C 00:A85C: 25        .byte $25   ; 
- D 1 - I - 0x00286D 00:A85D: 25        .byte $25   ; 
- D 1 - I - 0x00286E 00:A85E: A0        .byte $A0   ; 
- D 1 - I - 0x00286F 00:A85F: 2A        .byte $2A   ; 
- D 1 - I - 0x002870 00:A860: 25        .byte $25   ; 
- D 1 - I - 0x002871 00:A861: B0        .byte $B0   ; 
- D 1 - I - 0x002872 00:A862: 24        .byte $24   ; 
- D 1 - I - 0x002873 00:A863: FE        .byte $FE   ; 
- D 1 - I - 0x002874 00:A864: 07        .byte $07   ; 
- D 1 - I - 0x002875 00:A865: B0        .byte $B0   ; 
- D 1 - I - 0x002876 00:A866: 2A        .byte $2A   ; 
- D 1 - I - 0x002877 00:A867: 25        .byte $25   ; 
- D 1 - I - 0x002878 00:A868: 25        .byte $25   ; 
- D 1 - I - 0x002879 00:A869: A0        .byte $A0   ; 
- D 1 - I - 0x00287A 00:A86A: 2A        .byte $2A   ; 
- D 1 - I - 0x00287B 00:A86B: 25        .byte $25   ; 
- D 1 - I - 0x00287C 00:A86C: A0        .byte $A0   ; 
- D 1 - I - 0x00287D 00:A86D: 24        .byte $24   ; 
- D 1 - I - 0x00287E 00:A86E: B0        .byte $B0   ; 
- D 1 - I - 0x00287F 00:A86F: 24        .byte $24   ; 
- D 1 - I - 0x002880 00:A870: 92        .byte $92   ; 
- D 1 - I - 0x002881 00:A871: 92        .byte $92   ; 
- D 1 - I - 0x002882 00:A872: 95        .byte $95   ; 
- D 1 - I - 0x002883 00:A873: 95        .byte $95   ; 
- D 1 - I - 0x002884 00:A874: 85        .byte $85   ; 
- D 1 - I - 0x002885 00:A875: 85        .byte $85   ; 
- D 1 - I - 0x002886 00:A876: 75        .byte $75   ; 
- D 1 - I - 0x002887 00:A877: D6        .byte $D6   ; 
- D 1 - I - 0x002888 00:A878: E3        .byte $E3   ; 
- D 1 - I - 0x002889 00:A879: 21        .byte $21   ; 
- D 1 - I - 0x00288A 00:A87A: 40        .byte $40   ; 
- D 1 - I - 0x00288B 00:A87B: 50        .byte $50   ; 
- D 1 - I - 0x00288C 00:A87C: 20        .byte $20   ; 
- D 1 - I - 0x00288D 00:A87D: 90        .byte $90   ; 
- D 1 - I - 0x00288E 00:A87E: C0        .byte $C0   ; 
- D 1 - I - 0x00288F 00:A87F: 80        .byte $80   ; 
- D 1 - I - 0x002890 00:A880: 70        .byte $70   ; 
- D 1 - I - 0x002891 00:A881: 50        .byte $50   ; 
- D 1 - I - 0x002892 00:A882: 70        .byte $70   ; 
- D 1 - I - 0x002893 00:A883: 90        .byte $90   ; 
- D 1 - I - 0x002894 00:A884: 20        .byte $20   ; 
- D 1 - I - 0x002895 00:A885: D6        .byte $D6   ; 
- D 1 - I - 0x002896 00:A886: C0        .byte $C0   ; 
- D 1 - I - 0x002897 00:A887: B0        .byte $B0   ; 
- D 1 - I - 0x002898 00:A888: A0        .byte $A0   ; 
- D 1 - I - 0x002899 00:A889: 20        .byte $20   ; 
- D 1 - I - 0x00289A 00:A88A: E3        .byte $E3   ; 
- D 1 - I - 0x00289B 00:A88B: 20        .byte $20   ; 
- D 1 - I - 0x00289C 00:A88C: 40        .byte $40   ; 
- D 1 - I - 0x00289D 00:A88D: 50        .byte $50   ; 
- D 1 - I - 0x00289E 00:A88E: 20        .byte $20   ; 
- D 1 - I - 0x00289F 00:A88F: A0        .byte $A0   ; 
- D 1 - I - 0x0028A0 00:A890: C0        .byte $C0   ; 
- D 1 - I - 0x0028A1 00:A891: 90        .byte $90   ; 
- D 1 - I - 0x0028A2 00:A892: 70        .byte $70   ; 
- D 1 - I - 0x0028A3 00:A893: 50        .byte $50   ; 
- D 1 - I - 0x0028A4 00:A894: 70        .byte $70   ; 
- D 1 - I - 0x0028A5 00:A895: 90        .byte $90   ; 
- D 1 - I - 0x0028A6 00:A896: 34        .byte $34   ; 
- D 1 - I - 0x0028A7 00:A897: 20        .byte $20   ; 
- D 1 - I - 0x0028A8 00:A898: 40        .byte $40   ; 
- D 1 - I - 0x0028A9 00:A899: 50        .byte $50   ; 
- D 1 - I - 0x0028AA 00:A89A: 20        .byte $20   ; 
- D 1 - I - 0x0028AB 00:A89B: 90        .byte $90   ; 
- D 1 - I - 0x0028AC 00:A89C: C0        .byte $C0   ; 
- D 1 - I - 0x0028AD 00:A89D: 80        .byte $80   ; 
- D 1 - I - 0x0028AE 00:A89E: 70        .byte $70   ; 
- D 1 - I - 0x0028AF 00:A89F: 50        .byte $50   ; 
- D 1 - I - 0x0028B0 00:A8A0: 70        .byte $70   ; 
- D 1 - I - 0x0028B1 00:A8A1: 90        .byte $90   ; 
- D 1 - I - 0x0028B2 00:A8A2: 20        .byte $20   ; 
- D 1 - I - 0x0028B3 00:A8A3: D6        .byte $D6   ; 
- D 1 - I - 0x0028B4 00:A8A4: 20        .byte $20   ; 
- D 1 - I - 0x0028B5 00:A8A5: B0        .byte $B0   ; 
- D 1 - I - 0x0028B6 00:A8A6: A0        .byte $A0   ; 
- D 1 - I - 0x0028B7 00:A8A7: 20        .byte $20   ; 
- D 1 - I - 0x0028B8 00:A8A8: E3        .byte $E3   ; 
- D 1 - I - 0x0028B9 00:A8A9: 20        .byte $20   ; 
- D 1 - I - 0x0028BA 00:A8AA: 40        .byte $40   ; 
- D 1 - I - 0x0028BB 00:A8AB: 50        .byte $50   ; 
- D 1 - I - 0x0028BC 00:A8AC: 20        .byte $20   ; 
- D 1 - I - 0x0028BD 00:A8AD: A0        .byte $A0   ; 
- D 1 - I - 0x0028BE 00:A8AE: C0        .byte $C0   ; 
- D 1 - I - 0x0028BF 00:A8AF: 90        .byte $90   ; 
- D 1 - I - 0x0028C0 00:A8B0: 70        .byte $70   ; 
- D 1 - I - 0x0028C1 00:A8B1: 50        .byte $50   ; 
- D 1 - I - 0x0028C2 00:A8B2: 60        .byte $60   ; 
- D 1 - I - 0x0028C3 00:A8B3: 70        .byte $70   ; 
- D 1 - I - 0x0028C4 00:A8B4: 30        .byte $30   ; 
- D 1 - I - 0x0028C5 00:A8B5: D1        .byte $D1   ; 
- D 1 - I - 0x0028C6 00:A8B6: 92        .byte $92   ; 
- D 1 - I - 0x0028C7 00:A8B7: 92        .byte $92   ; 
- D 1 - I - 0x0028C8 00:A8B8: D6        .byte $D6   ; 
- D 1 - I - 0x0028C9 00:A8B9: 90        .byte $90   ; 
- D 1 - I - 0x0028CA 00:A8BA: 90        .byte $90   ; 
- D 1 - I - 0x0028CB 00:A8BB: 90        .byte $90   ; 
- D 1 - I - 0x0028CC 00:A8BC: D1        .byte $D1   ; 
- D 1 - I - 0x0028CD 00:A8BD: FB        .byte $FB   ; 
- D 1 - I - 0x0028CE 00:A8BE: A0        .byte $A0   ; 
- D 1 - I - 0x0028CF 00:A8BF: 26        .byte $26   ; 
- D 1 - I - 0x0028D0 00:A8C0: FE        .byte $FE   ; 
- D 1 - I - 0x0028D1 00:A8C1: 06        .byte $06   ; 
- D 1 - I - 0x0028D2 00:A8C2: D1        .byte $D1   ; 
- D 1 - I - 0x0028D3 00:A8C3: B7        .byte $B7   ; 
- D 1 - I - 0x0028D4 00:A8C4: B7        .byte $B7   ; 
- D 1 - I - 0x0028D5 00:A8C5: B7        .byte $B7   ; 
- D 1 - I - 0x0028D6 00:A8C6: 93        .byte $93   ; 
- D 1 - I - 0x0028D7 00:A8C7: 93        .byte $93   ; 
- D 1 - I - 0x0028D8 00:A8C8: 87        .byte $87   ; 
- D 1 - I - 0x0028D9 00:A8C9: 67        .byte $67   ; 
- D 1 - I - 0x0028DA 00:A8CA: FE        .byte $FE   ; 
- D 1 - I - 0x0028DB 00:A8CB: FF        .byte $FF   ; 
- D 1 - I - 0x0028DC 00:A8CC: 4F A8     .word loc_FF_A84F



_off014_36_0x0028DE_00:
- D 1 - I - 0x0028DE 00:A8CE: E9        .byte $E9   ; 
- D 1 - I - 0x0028DF 00:A8CF: 71        .byte $71   ; 
- D 1 - I - 0x0028E0 00:A8D0: D4        .byte $D4   ; 
- D 1 - I - 0x0028E1 00:A8D1: 37        .byte $37   ; 
- D 1 - I - 0x0028E2 00:A8D2: 84        .byte $84   ; 
- D 1 - I - 0x0028E3 00:A8D3: 14        .byte $14   ; 
- D 1 - I - 0x0028E4 00:A8D4: E3        .byte $E3   ; 
- D 1 - I - 0x0028E5 00:A8D5: 73        .byte $73   ; 
- D 1 - I - 0x0028E6 00:A8D6: 71        .byte $71   ; 
- D 1 - I - 0x0028E7 00:A8D7: C0        .byte $C0   ; 
- D 1 - I - 0x0028E8 00:A8D8: F4        .byte $F4   ; 
- D 1 - I - 0x0028E9 00:A8D9: 70        .byte $70   ; 
- D 1 - I - 0x0028EA 00:A8DA: F0        .byte $F0   ; 
- D 1 - I - 0x0028EB 00:A8DB: 71        .byte $71   ; 
- D 1 - I - 0x0028EC 00:A8DC: 71        .byte $71   ; 
- D 1 - I - 0x0028ED 00:A8DD: 53        .byte $53   ; 
- D 1 - I - 0x0028EE 00:A8DE: 51        .byte $51   ; 
- D 1 - I - 0x0028EF 00:A8DF: C0        .byte $C0   ; 
- D 1 - I - 0x0028F0 00:A8E0: F4        .byte $F4   ; 
- D 1 - I - 0x0028F1 00:A8E1: 50        .byte $50   ; 
- D 1 - I - 0x0028F2 00:A8E2: F0        .byte $F0   ; 
- D 1 - I - 0x0028F3 00:A8E3: 51        .byte $51   ; 
- D 1 - I - 0x0028F4 00:A8E4: 51        .byte $51   ; 
- D 1 - I - 0x0028F5 00:A8E5: 43        .byte $43   ; 
- D 1 - I - 0x0028F6 00:A8E6: 41        .byte $41   ; 
- D 1 - I - 0x0028F7 00:A8E7: C0        .byte $C0   ; 
- D 1 - I - 0x0028F8 00:A8E8: F4        .byte $F4   ; 
- D 1 - I - 0x0028F9 00:A8E9: 40        .byte $40   ; 
- D 1 - I - 0x0028FA 00:A8EA: F0        .byte $F0   ; 
- D 1 - I - 0x0028FB 00:A8EB: 41        .byte $41   ; 
- D 1 - I - 0x0028FC 00:A8EC: 41        .byte $41   ; 
- D 1 - I - 0x0028FD 00:A8ED: 23        .byte $23   ; 
- D 1 - I - 0x0028FE 00:A8EE: 21        .byte $21   ; 
- D 1 - I - 0x0028FF 00:A8EF: C0        .byte $C0   ; 
- D 1 - I - 0x002900 00:A8F0: F4        .byte $F4   ; 
- D 1 - I - 0x002901 00:A8F1: 20        .byte $20   ; 
- D 1 - I - 0x002902 00:A8F2: F0        .byte $F0   ; 
- D 1 - I - 0x002903 00:A8F3: 21        .byte $21   ; 
- D 1 - I - 0x002904 00:A8F4: 21        .byte $21   ; 
- D 1 - I - 0x002905 00:A8F5: E9        .byte $E9   ; 
- D 1 - I - 0x002906 00:A8F6: 31        .byte $31   ; 
- D 1 - I - 0x002907 00:A8F7: D8        .byte $D8   ; 
- D 1 - I - 0x002908 00:A8F8: 74        .byte $74   ; 
- D 1 - I - 0x002909 00:A8F9: 82        .byte $82   ; 
- D 1 - I - 0x00290A 00:A8FA: 11        .byte $11   ; 
- D 1 - I - 0x00290B 00:A8FB: FB        .byte $FB   ; 
- D 1 - I - 0x00290C 00:A8FC: E2        .byte $E2   ; 
- D 1 - I - 0x00290D 00:A8FD: 70        .byte $70   ; 
- D 1 - I - 0x00290E 00:A8FE: 50        .byte $50   ; 
- D 1 - I - 0x00290F 00:A8FF: E2        .byte $E2   ; 
- D 1 - I - 0x002910 00:A900: A0        .byte $A0   ; 
- D 1 - I - 0x002911 00:A901: 90        .byte $90   ; 
- D 1 - I - 0x002912 00:A902: 70        .byte $70   ; 
- D 1 - I - 0x002913 00:A903: 90        .byte $90   ; 
- D 1 - I - 0x002914 00:A904: 50        .byte $50   ; 
- D 1 - I - 0x002915 00:A905: 03        .byte $03   ; 
- D 1 - I - 0x002916 00:A906: 00        .byte $00   ; 
- D 1 - I - 0x002917 00:A907: 50        .byte $50   ; 
- D 1 - I - 0x002918 00:A908: 90        .byte $90   ; 
- D 1 - I - 0x002919 00:A909: E1        .byte $E1   ; 
- D 1 - I - 0x00291A 00:A90A: 05        .byte $05   ; 
- D 1 - I - 0x00291B 00:A90B: E2        .byte $E2   ; 
- D 1 - I - 0x00291C 00:A90C: 75        .byte $75   ; 
- D 1 - I - 0x00291D 00:A90D: A0        .byte $A0   ; 
- D 1 - I - 0x00291E 00:A90E: 90        .byte $90   ; 
- D 1 - I - 0x00291F 00:A90F: 70        .byte $70   ; 
- D 1 - I - 0x002920 00:A910: A5        .byte $A5   ; 
- D 1 - I - 0x002921 00:A911: 70        .byte $70   ; 
- D 1 - I - 0x002922 00:A912: 90        .byte $90   ; 
- D 1 - I - 0x002923 00:A913: A0        .byte $A0   ; 
- D 1 - I - 0x002924 00:A914: 93        .byte $93   ; 
- D 1 - I - 0x002925 00:A915: 50        .byte $50   ; 
- D 1 - I - 0x002926 00:A916: 90        .byte $90   ; 
- D 1 - I - 0x002927 00:A917: E1        .byte $E1   ; 
- D 1 - I - 0x002928 00:A918: 22        .byte $22   ; 
- D 1 - I - 0x002929 00:A919: 52        .byte $52   ; 
- D 1 - I - 0x00292A 00:A91A: E1        .byte $E1   ; 
- D 1 - I - 0x00292B 00:A91B: 70        .byte $70   ; 
- D 1 - I - 0x00292C 00:A91C: 50        .byte $50   ; 
- D 1 - I - 0x00292D 00:A91D: 40        .byte $40   ; 
- D 1 - I - 0x00292E 00:A91E: 25        .byte $25   ; 
- D 1 - I - 0x00292F 00:A91F: 20        .byte $20   ; 
- D 1 - I - 0x002930 00:A920: 40        .byte $40   ; 
- D 1 - I - 0x002931 00:A921: 50        .byte $50   ; 
- D 1 - I - 0x002932 00:A922: 43        .byte $43   ; 
- D 1 - I - 0x002933 00:A923: 20        .byte $20   ; 
- D 1 - I - 0x002934 00:A924: 00        .byte $00   ; 
- D 1 - I - 0x002935 00:A925: 42        .byte $42   ; 
- D 1 - I - 0x002936 00:A926: 00        .byte $00   ; 
- D 1 - I - 0x002937 00:A927: 20        .byte $20   ; 
- D 1 - I - 0x002938 00:A928: 40        .byte $40   ; 
- D 1 - I - 0x002939 00:A929: 52        .byte $52   ; 
- D 1 - I - 0x00293A 00:A92A: 50        .byte $50   ; 
- D 1 - I - 0x00293B 00:A92B: 40        .byte $40   ; 
- D 1 - I - 0x00293C 00:A92C: 20        .byte $20   ; 
- D 1 - I - 0x00293D 00:A92D: 52        .byte $52   ; 
- D 1 - I - 0x00293E 00:A92E: 50        .byte $50   ; 
- D 1 - I - 0x00293F 00:A92F: 70        .byte $70   ; 
- D 1 - I - 0x002940 00:A930: 90        .byte $90   ; 
- D 1 - I - 0x002941 00:A931: 93        .byte $93   ; 
- D 1 - I - 0x002942 00:A932: 70        .byte $70   ; 
- D 1 - I - 0x002943 00:A933: 50        .byte $50   ; 
- D 1 - I - 0x002944 00:A934: 72        .byte $72   ; 
- D 1 - I - 0x002945 00:A935: 90        .byte $90   ; 
- D 1 - I - 0x002946 00:A936: FE        .byte $FE   ; 
- D 1 - I - 0x002947 00:A937: 03        .byte $03   ; 
- D 1 - I - 0x002948 00:A938: EA        .byte $EA   ; 
- D 1 - I - 0x002949 00:A939: 00        .byte $00   ; 
- D 1 - I - 0x00294A 00:A93A: E9        .byte $E9   ; 
- D 1 - I - 0x00294B 00:A93B: 31        .byte $31   ; 
- D 1 - I - 0x00294C 00:A93C: D8        .byte $D8   ; 
- D 1 - I - 0x00294D 00:A93D: 70        .byte $70   ; 
- D 1 - I - 0x00294E 00:A93E: 28        .byte $28   ; 
- D 1 - I - 0x00294F 00:A93F: 11        .byte $11   ; 
- D 1 - I - 0x002950 00:A940: EB        .byte $EB   ; 
- D 1 - I - 0x002951 00:A941: 50        .byte $50   ; 
- D 1 - I - 0x002952 00:A942: 21        .byte $21   ; 
- D 1 - I - 0x002953 00:A943: E1        .byte $E1   ; 
- D 1 - I - 0x002954 00:A944: 08        .byte $08   ; 
- D 1 - I - 0x002955 00:A945: 02        .byte $02   ; 
- D 1 - I - 0x002956 00:A946: 05        .byte $05   ; 
- D 1 - I - 0x002957 00:A947: 12        .byte $12   ; 
- D 1 - I - 0x002958 00:A948: E2        .byte $E2   ; 
- D 1 - I - 0x002959 00:A949: A2        .byte $A2   ; 
- D 1 - I - 0x00295A 00:A94A: A8        .byte $A8   ; 
- D 1 - I - 0x00295B 00:A94B: A0        .byte $A0   ; 
- D 1 - I - 0x00295C 00:A94C: E1        .byte $E1   ; 
- D 1 - I - 0x00295D 00:A94D: 00        .byte $00   ; 
- D 1 - I - 0x00295E 00:A94E: E2        .byte $E2   ; 
- D 1 - I - 0x00295F 00:A94F: A0        .byte $A0   ; 
- D 1 - I - 0x002960 00:A950: 9B        .byte $9B   ; 
- D 1 - I - 0x002961 00:A951: FF        .byte $FF   ; 



_off014_36_0x002962_01:
- D 1 - I - 0x002962 00:A952: E9        .byte $E9   ; 
- D 1 - I - 0x002963 00:A953: 71        .byte $71   ; 
- D 1 - I - 0x002964 00:A954: D4        .byte $D4   ; 
- D 1 - I - 0x002965 00:A955: 37        .byte $37   ; 
- D 1 - I - 0x002966 00:A956: 84        .byte $84   ; 
- D 1 - I - 0x002967 00:A957: 14        .byte $14   ; 
- D 1 - I - 0x002968 00:A958: E2        .byte $E2   ; 
- D 1 - I - 0x002969 00:A959: 03        .byte $03   ; 
- D 1 - I - 0x00296A 00:A95A: 01        .byte $01   ; 
- D 1 - I - 0x00296B 00:A95B: C0        .byte $C0   ; 
- D 1 - I - 0x00296C 00:A95C: F4        .byte $F4   ; 
- D 1 - I - 0x00296D 00:A95D: 00        .byte $00   ; 
- D 1 - I - 0x00296E 00:A95E: F0        .byte $F0   ; 
- D 1 - I - 0x00296F 00:A95F: 01        .byte $01   ; 
- D 1 - I - 0x002970 00:A960: 01        .byte $01   ; 
- D 1 - I - 0x002971 00:A961: E3        .byte $E3   ; 
- D 1 - I - 0x002972 00:A962: A3        .byte $A3   ; 
- D 1 - I - 0x002973 00:A963: A1        .byte $A1   ; 
- D 1 - I - 0x002974 00:A964: C0        .byte $C0   ; 
- D 1 - I - 0x002975 00:A965: F4        .byte $F4   ; 
- D 1 - I - 0x002976 00:A966: A0        .byte $A0   ; 
- D 1 - I - 0x002977 00:A967: F0        .byte $F0   ; 
- D 1 - I - 0x002978 00:A968: A1        .byte $A1   ; 
- D 1 - I - 0x002979 00:A969: A1        .byte $A1   ; 
- D 1 - I - 0x00297A 00:A96A: 93        .byte $93   ; 
- D 1 - I - 0x00297B 00:A96B: 91        .byte $91   ; 
- D 1 - I - 0x00297C 00:A96C: C0        .byte $C0   ; 
- D 1 - I - 0x00297D 00:A96D: F4        .byte $F4   ; 
- D 1 - I - 0x00297E 00:A96E: 90        .byte $90   ; 
- D 1 - I - 0x00297F 00:A96F: F0        .byte $F0   ; 
- D 1 - I - 0x002980 00:A970: 91        .byte $91   ; 
- D 1 - I - 0x002981 00:A971: 91        .byte $91   ; 
- D 1 - I - 0x002982 00:A972: 73        .byte $73   ; 
- D 1 - I - 0x002983 00:A973: 71        .byte $71   ; 
- D 1 - I - 0x002984 00:A974: C0        .byte $C0   ; 
- D 1 - I - 0x002985 00:A975: F4        .byte $F4   ; 
- D 1 - I - 0x002986 00:A976: 70        .byte $70   ; 
- D 1 - I - 0x002987 00:A977: F0        .byte $F0   ; 
- D 1 - I - 0x002988 00:A978: 71        .byte $71   ; 
- D 1 - I - 0x002989 00:A979: 71        .byte $71   ; 
- D 1 - I - 0x00298A 00:A97A: E9        .byte $E9   ; 
- D 1 - I - 0x00298B 00:A97B: 31        .byte $31   ; 
- D 1 - I - 0x00298C 00:A97C: D8        .byte $D8   ; 
- D 1 - I - 0x00298D 00:A97D: 70        .byte $70   ; 
- D 1 - I - 0x00298E 00:A97E: 28        .byte $28   ; 
- D 1 - I - 0x00298F 00:A97F: 11        .byte $11   ; 
- D 1 - I - 0x002990 00:A980: EB        .byte $EB   ; 
- D 1 - I - 0x002991 00:A981: 50        .byte $50   ; 
- D 1 - I - 0x002992 00:A982: 21        .byte $21   ; 
- D 1 - I - 0x002993 00:A983: FB        .byte $FB   ; 
- D 1 - I - 0x002994 00:A984: E2        .byte $E2   ; 
- D 1 - I - 0x002995 00:A985: A0        .byte $A0   ; 
- D 1 - I - 0x002996 00:A986: 90        .byte $90   ; 
- D 1 - I - 0x002997 00:A987: 70        .byte $70   ; 
- D 1 - I - 0x002998 00:A988: 90        .byte $90   ; 
- D 1 - I - 0x002999 00:A989: 50        .byte $50   ; 
- D 1 - I - 0x00299A 00:A98A: 03        .byte $03   ; 
- D 1 - I - 0x00299B 00:A98B: 00        .byte $00   ; 
- D 1 - I - 0x00299C 00:A98C: 50        .byte $50   ; 
- D 1 - I - 0x00299D 00:A98D: 90        .byte $90   ; 
- D 1 - I - 0x00299E 00:A98E: E1        .byte $E1   ; 
- D 1 - I - 0x00299F 00:A98F: 05        .byte $05   ; 
- D 1 - I - 0x0029A0 00:A990: E2        .byte $E2   ; 
- D 1 - I - 0x0029A1 00:A991: 75        .byte $75   ; 
- D 1 - I - 0x0029A2 00:A992: A0        .byte $A0   ; 
- D 1 - I - 0x0029A3 00:A993: 90        .byte $90   ; 
- D 1 - I - 0x0029A4 00:A994: 70        .byte $70   ; 
- D 1 - I - 0x0029A5 00:A995: A5        .byte $A5   ; 
- D 1 - I - 0x0029A6 00:A996: 70        .byte $70   ; 
- D 1 - I - 0x0029A7 00:A997: 90        .byte $90   ; 
- D 1 - I - 0x0029A8 00:A998: A0        .byte $A0   ; 
- D 1 - I - 0x0029A9 00:A999: 93        .byte $93   ; 
- D 1 - I - 0x0029AA 00:A99A: 50        .byte $50   ; 
- D 1 - I - 0x0029AB 00:A99B: 90        .byte $90   ; 
- D 1 - I - 0x0029AC 00:A99C: E1        .byte $E1   ; 
- D 1 - I - 0x0029AD 00:A99D: 22        .byte $22   ; 
- D 1 - I - 0x0029AE 00:A99E: 52        .byte $52   ; 
- D 1 - I - 0x0029AF 00:A99F: E1        .byte $E1   ; 
- D 1 - I - 0x0029B0 00:A9A0: 70        .byte $70   ; 
- D 1 - I - 0x0029B1 00:A9A1: 50        .byte $50   ; 
- D 1 - I - 0x0029B2 00:A9A2: 40        .byte $40   ; 
- D 1 - I - 0x0029B3 00:A9A3: 25        .byte $25   ; 
- D 1 - I - 0x0029B4 00:A9A4: 20        .byte $20   ; 
- D 1 - I - 0x0029B5 00:A9A5: 40        .byte $40   ; 
- D 1 - I - 0x0029B6 00:A9A6: 50        .byte $50   ; 
- D 1 - I - 0x0029B7 00:A9A7: 43        .byte $43   ; 
- D 1 - I - 0x0029B8 00:A9A8: 20        .byte $20   ; 
- D 1 - I - 0x0029B9 00:A9A9: 00        .byte $00   ; 
- D 1 - I - 0x0029BA 00:A9AA: 42        .byte $42   ; 
- D 1 - I - 0x0029BB 00:A9AB: 00        .byte $00   ; 
- D 1 - I - 0x0029BC 00:A9AC: 20        .byte $20   ; 
- D 1 - I - 0x0029BD 00:A9AD: 40        .byte $40   ; 
- D 1 - I - 0x0029BE 00:A9AE: 52        .byte $52   ; 
- D 1 - I - 0x0029BF 00:A9AF: 50        .byte $50   ; 
- D 1 - I - 0x0029C0 00:A9B0: 40        .byte $40   ; 
- D 1 - I - 0x0029C1 00:A9B1: 20        .byte $20   ; 
- D 1 - I - 0x0029C2 00:A9B2: 52        .byte $52   ; 
- D 1 - I - 0x0029C3 00:A9B3: 50        .byte $50   ; 
- D 1 - I - 0x0029C4 00:A9B4: 70        .byte $70   ; 
- D 1 - I - 0x0029C5 00:A9B5: 90        .byte $90   ; 
- D 1 - I - 0x0029C6 00:A9B6: 93        .byte $93   ; 
- D 1 - I - 0x0029C7 00:A9B7: 70        .byte $70   ; 
- D 1 - I - 0x0029C8 00:A9B8: 50        .byte $50   ; 
- D 1 - I - 0x0029C9 00:A9B9: 72        .byte $72   ; 
- D 1 - I - 0x0029CA 00:A9BA: 90        .byte $90   ; 
- D 1 - I - 0x0029CB 00:A9BB: 70        .byte $70   ; 
- D 1 - I - 0x0029CC 00:A9BC: 50        .byte $50   ; 
- D 1 - I - 0x0029CD 00:A9BD: FE        .byte $FE   ; 
- D 1 - I - 0x0029CE 00:A9BE: 03        .byte $03   ; 
- D 1 - I - 0x0029CF 00:A9BF: E9        .byte $E9   ; 
- D 1 - I - 0x0029D0 00:A9C0: 31        .byte $31   ; 
- D 1 - I - 0x0029D1 00:A9C1: D8        .byte $D8   ; 
- D 1 - I - 0x0029D2 00:A9C2: 70        .byte $70   ; 
- D 1 - I - 0x0029D3 00:A9C3: 28        .byte $28   ; 
- D 1 - I - 0x0029D4 00:A9C4: 11        .byte $11   ; 
- D 1 - I - 0x0029D5 00:A9C5: EB        .byte $EB   ; 
- D 1 - I - 0x0029D6 00:A9C6: 50        .byte $50   ; 
- D 1 - I - 0x0029D7 00:A9C7: 21        .byte $21   ; 
- D 1 - I - 0x0029D8 00:A9C8: E2        .byte $E2   ; 
- D 1 - I - 0x0029D9 00:A9C9: 58        .byte $58   ; 
- D 1 - I - 0x0029DA 00:A9CA: 52        .byte $52   ; 
- D 1 - I - 0x0029DB 00:A9CB: 55        .byte $55   ; 
- D 1 - I - 0x0029DC 00:A9CC: 52        .byte $52   ; 
- D 1 - I - 0x0029DD 00:A9CD: 52        .byte $52   ; 
- D 1 - I - 0x0029DE 00:A9CE: 58        .byte $58   ; 
- D 1 - I - 0x0029DF 00:A9CF: 50        .byte $50   ; 
- D 1 - I - 0x0029E0 00:A9D0: 50        .byte $50   ; 
- D 1 - I - 0x0029E1 00:A9D1: 50        .byte $50   ; 
- D 1 - I - 0x0029E2 00:A9D2: 5B        .byte $5B   ; 
- D 1 - I - 0x0029E3 00:A9D3: FF        .byte $FF   ; 



_off014_36_0x0029E4_02:
- D 1 - I - 0x0029E4 00:A9D4: D8        .byte $D8   ; 
- D 1 - I - 0x0029E5 00:A9D5: 18        .byte $18   ; 
- D 1 - I - 0x0029E6 00:A9D6: E2        .byte $E2   ; 
- D 1 - I - 0x0029E7 00:A9D7: 01        .byte $01   ; 
- D 1 - I - 0x0029E8 00:A9D8: 00        .byte $00   ; 
- D 1 - I - 0x0029E9 00:A9D9: C0        .byte $C0   ; 
- D 1 - I - 0x0029EA 00:A9DA: 00        .byte $00   ; 
- D 1 - I - 0x0029EB 00:A9DB: 00        .byte $00   ; 
- D 1 - I - 0x0029EC 00:A9DC: E3        .byte $E3   ; 
- D 1 - I - 0x0029ED 00:A9DD: A1        .byte $A1   ; 
- D 1 - I - 0x0029EE 00:A9DE: A0        .byte $A0   ; 
- D 1 - I - 0x0029EF 00:A9DF: C0        .byte $C0   ; 
- D 1 - I - 0x0029F0 00:A9E0: A0        .byte $A0   ; 
- D 1 - I - 0x0029F1 00:A9E1: A0        .byte $A0   ; 
- D 1 - I - 0x0029F2 00:A9E2: 91        .byte $91   ; 
- D 1 - I - 0x0029F3 00:A9E3: 90        .byte $90   ; 
- D 1 - I - 0x0029F4 00:A9E4: C0        .byte $C0   ; 
- D 1 - I - 0x0029F5 00:A9E5: 90        .byte $90   ; 
- D 1 - I - 0x0029F6 00:A9E6: 90        .byte $90   ; 
- D 1 - I - 0x0029F7 00:A9E7: 71        .byte $71   ; 
- D 1 - I - 0x0029F8 00:A9E8: 70        .byte $70   ; 
- D 1 - I - 0x0029F9 00:A9E9: C0        .byte $C0   ; 
- D 1 - I - 0x0029FA 00:A9EA: 70        .byte $70   ; 
- D 1 - I - 0x0029FB 00:A9EB: 70        .byte $70   ; 
- D 1 - I - 0x0029FC 00:A9EC: D8        .byte $D8   ; 
- D 1 - I - 0x0029FD 00:A9ED: 0F        .byte $0F   ; 
- D 1 - I - 0x0029FE 00:A9EE: FB        .byte $FB   ; 
- D 1 - I - 0x0029FF 00:A9EF: E3        .byte $E3   ; 
- D 1 - I - 0x002A00 00:A9F0: 51        .byte $51   ; 
- D 1 - I - 0x002A01 00:A9F1: 50        .byte $50   ; 
- D 1 - I - 0x002A02 00:A9F2: 50        .byte $50   ; 
- D 1 - I - 0x002A03 00:A9F3: 50        .byte $50   ; 
- D 1 - I - 0x002A04 00:A9F4: 50        .byte $50   ; 
- D 1 - I - 0x002A05 00:A9F5: 51        .byte $51   ; 
- D 1 - I - 0x002A06 00:A9F6: 50        .byte $50   ; 
- D 1 - I - 0x002A07 00:A9F7: 50        .byte $50   ; 
- D 1 - I - 0x002A08 00:A9F8: 50        .byte $50   ; 
- D 1 - I - 0x002A09 00:A9F9: 50        .byte $50   ; 
- D 1 - I - 0x002A0A 00:A9FA: 41        .byte $41   ; 
- D 1 - I - 0x002A0B 00:A9FB: 40        .byte $40   ; 
- D 1 - I - 0x002A0C 00:A9FC: 40        .byte $40   ; 
- D 1 - I - 0x002A0D 00:A9FD: 40        .byte $40   ; 
- D 1 - I - 0x002A0E 00:A9FE: 40        .byte $40   ; 
- D 1 - I - 0x002A0F 00:A9FF: 41        .byte $41   ; 
- D 1 - I - 0x002A10 00:AA00: 40        .byte $40   ; 
- D 1 - I - 0x002A11 00:AA01: 40        .byte $40   ; 
- D 1 - I - 0x002A12 00:AA02: 40        .byte $40   ; 
- D 1 - I - 0x002A13 00:AA03: 40        .byte $40   ; 
- D 1 - I - 0x002A14 00:AA04: 31        .byte $31   ; 
- D 1 - I - 0x002A15 00:AA05: 30        .byte $30   ; 
- D 1 - I - 0x002A16 00:AA06: 30        .byte $30   ; 
- D 1 - I - 0x002A17 00:AA07: 30        .byte $30   ; 
- D 1 - I - 0x002A18 00:AA08: 30        .byte $30   ; 
- D 1 - I - 0x002A19 00:AA09: 31        .byte $31   ; 
- D 1 - I - 0x002A1A 00:AA0A: 30        .byte $30   ; 
- D 1 - I - 0x002A1B 00:AA0B: 30        .byte $30   ; 
- D 1 - I - 0x002A1C 00:AA0C: 30        .byte $30   ; 
- D 1 - I - 0x002A1D 00:AA0D: 30        .byte $30   ; 
- D 1 - I - 0x002A1E 00:AA0E: 21        .byte $21   ; 
- D 1 - I - 0x002A1F 00:AA0F: 20        .byte $20   ; 
- D 1 - I - 0x002A20 00:AA10: 20        .byte $20   ; 
- D 1 - I - 0x002A21 00:AA11: 20        .byte $20   ; 
- D 1 - I - 0x002A22 00:AA12: 20        .byte $20   ; 
- D 1 - I - 0x002A23 00:AA13: 21        .byte $21   ; 
- D 1 - I - 0x002A24 00:AA14: 20        .byte $20   ; 
- D 1 - I - 0x002A25 00:AA15: 20        .byte $20   ; 
- D 1 - I - 0x002A26 00:AA16: 20        .byte $20   ; 
- D 1 - I - 0x002A27 00:AA17: 20        .byte $20   ; 
- D 1 - I - 0x002A28 00:AA18: E3        .byte $E3   ; 
- D 1 - I - 0x002A29 00:AA19: A1        .byte $A1   ; 
- D 1 - I - 0x002A2A 00:AA1A: A0        .byte $A0   ; 
- D 1 - I - 0x002A2B 00:AA1B: A0        .byte $A0   ; 
- D 1 - I - 0x002A2C 00:AA1C: A0        .byte $A0   ; 
- D 1 - I - 0x002A2D 00:AA1D: A0        .byte $A0   ; 
- D 1 - I - 0x002A2E 00:AA1E: A1        .byte $A1   ; 
- D 1 - I - 0x002A2F 00:AA1F: A0        .byte $A0   ; 
- D 1 - I - 0x002A30 00:AA20: A0        .byte $A0   ; 
- D 1 - I - 0x002A31 00:AA21: A0        .byte $A0   ; 
- D 1 - I - 0x002A32 00:AA22: A0        .byte $A0   ; 
- D 1 - I - 0x002A33 00:AA23: 91        .byte $91   ; 
- D 1 - I - 0x002A34 00:AA24: 90        .byte $90   ; 
- D 1 - I - 0x002A35 00:AA25: 90        .byte $90   ; 
- D 1 - I - 0x002A36 00:AA26: 90        .byte $90   ; 
- D 1 - I - 0x002A37 00:AA27: 90        .byte $90   ; 
- D 1 - I - 0x002A38 00:AA28: 91        .byte $91   ; 
- D 1 - I - 0x002A39 00:AA29: 90        .byte $90   ; 
- D 1 - I - 0x002A3A 00:AA2A: 90        .byte $90   ; 
- D 1 - I - 0x002A3B 00:AA2B: 90        .byte $90   ; 
- D 1 - I - 0x002A3C 00:AA2C: 90        .byte $90   ; 
- D 1 - I - 0x002A3D 00:AA2D: A1        .byte $A1   ; 
- D 1 - I - 0x002A3E 00:AA2E: A0        .byte $A0   ; 
- D 1 - I - 0x002A3F 00:AA2F: A0        .byte $A0   ; 
- D 1 - I - 0x002A40 00:AA30: A0        .byte $A0   ; 
- D 1 - I - 0x002A41 00:AA31: A0        .byte $A0   ; 
- D 1 - I - 0x002A42 00:AA32: B1        .byte $B1   ; 
- D 1 - I - 0x002A43 00:AA33: B0        .byte $B0   ; 
- D 1 - I - 0x002A44 00:AA34: B0        .byte $B0   ; 
- D 1 - I - 0x002A45 00:AA35: B0        .byte $B0   ; 
- D 1 - I - 0x002A46 00:AA36: B0        .byte $B0   ; 
- D 1 - I - 0x002A47 00:AA37: E2        .byte $E2   ; 
- D 1 - I - 0x002A48 00:AA38: 01        .byte $01   ; 
- D 1 - I - 0x002A49 00:AA39: 00        .byte $00   ; 
- D 1 - I - 0x002A4A 00:AA3A: 00        .byte $00   ; 
- D 1 - I - 0x002A4B 00:AA3B: 00        .byte $00   ; 
- D 1 - I - 0x002A4C 00:AA3C: 00        .byte $00   ; 
- D 1 - I - 0x002A4D 00:AA3D: 01        .byte $01   ; 
- D 1 - I - 0x002A4E 00:AA3E: 00        .byte $00   ; 
- D 1 - I - 0x002A4F 00:AA3F: 00        .byte $00   ; 
- D 1 - I - 0x002A50 00:AA40: 00        .byte $00   ; 
- D 1 - I - 0x002A51 00:AA41: 00        .byte $00   ; 
- D 1 - I - 0x002A52 00:AA42: FE        .byte $FE   ; 
- D 1 - I - 0x002A53 00:AA43: 03        .byte $03   ; 
- D 1 - I - 0x002A54 00:AA44: EA        .byte $EA   ; 
- D 1 - I - 0x002A55 00:AA45: 00        .byte $00   ; 
- D 1 - I - 0x002A56 00:AA46: D4        .byte $D4   ; 
- D 1 - I - 0x002A57 00:AA47: 00        .byte $00   ; 
- D 1 - I - 0x002A58 00:AA48: E2        .byte $E2   ; 
- D 1 - I - 0x002A59 00:AA49: 00        .byte $00   ; 
- D 1 - I - 0x002A5A 00:AA4A: 10        .byte $10   ; 
- D 1 - I - 0x002A5B 00:AA4B: D8        .byte $D8   ; 
- D 1 - I - 0x002A5C 00:AA4C: 00        .byte $00   ; 
- D 1 - I - 0x002A5D 00:AA4D: 17        .byte $17   ; 
- D 1 - I - 0x002A5E 00:AA4E: D8        .byte $D8   ; 
- D 1 - I - 0x002A5F 00:AA4F: 10        .byte $10   ; 
- D 1 - I - 0x002A60 00:AA50: 10        .byte $10   ; 
- D 1 - I - 0x002A61 00:AA51: 10        .byte $10   ; 
- D 1 - I - 0x002A62 00:AA52: 10        .byte $10   ; 
- D 1 - I - 0x002A63 00:AA53: D8        .byte $D8   ; 
- D 1 - I - 0x002A64 00:AA54: 40        .byte $40   ; 
- D 1 - I - 0x002A65 00:AA55: 35        .byte $35   ; 
- D 1 - I - 0x002A66 00:AA56: D2        .byte $D2   ; 
- D 1 - I - 0x002A67 00:AA57: 20        .byte $20   ; 
- D 1 - I - 0x002A68 00:AA58: 20        .byte $20   ; 
- D 1 - I - 0x002A69 00:AA59: 3A        .byte $3A   ; 
- D 1 - I - 0x002A6A 00:AA5A: 21        .byte $21   ; 
- D 1 - I - 0x002A6B 00:AA5B: 39        .byte $39   ; 
- D 1 - I - 0x002A6C 00:AA5C: D8        .byte $D8   ; 
- D 1 - I - 0x002A6D 00:AA5D: 00        .byte $00   ; 
- D 1 - I - 0x002A6E 00:AA5E: 55        .byte $55   ; 
- D 1 - I - 0x002A6F 00:AA5F: D8        .byte $D8   ; 
- D 1 - I - 0x002A70 00:AA60: 40        .byte $40   ; 
- D 1 - I - 0x002A71 00:AA61: 52        .byte $52   ; 
- D 1 - I - 0x002A72 00:AA62: D8        .byte $D8   ; 
- D 1 - I - 0x002A73 00:AA63: 10        .byte $10   ; 
- D 1 - I - 0x002A74 00:AA64: E2        .byte $E2   ; 
- D 1 - I - 0x002A75 00:AA65: 50        .byte $50   ; 
- D 1 - I - 0x002A76 00:AA66: 50        .byte $50   ; 
- D 1 - I - 0x002A77 00:AA67: 50        .byte $50   ; 
- D 1 - I - 0x002A78 00:AA68: D8        .byte $D8   ; 
- D 1 - I - 0x002A79 00:AA69: 00        .byte $00   ; 
- D 1 - I - 0x002A7A 00:AA6A: 55        .byte $55   ; 
- D 1 - I - 0x002A7B 00:AA6B: 55        .byte $55   ; 
- D 1 - I - 0x002A7C 00:AA6C: FF        .byte $FF   ; 



_off014_36_0x002A7D_03:
- D 1 - I - 0x002A7D 00:AA6D: D1        .byte $D1   ; 
- D 1 - I - 0x002A7E 00:AA6E: E2        .byte $E2   ; 
- D 1 - I - 0x002A7F 00:AA6F: 00        .byte $00   ; 
- D 1 - I - 0x002A80 00:AA70: D1        .byte $D1   ; 
- D 1 - I - 0x002A81 00:AA71: 26        .byte $26   ; 
- D 1 - I - 0x002A82 00:AA72: 13        .byte $13   ; 
- D 1 - I - 0x002A83 00:AA73: 13        .byte $13   ; 
- D 1 - I - 0x002A84 00:AA74: E2        .byte $E2   ; 
- D 1 - I - 0x002A85 00:AA75: 00        .byte $00   ; 
- D 1 - I - 0x002A86 00:AA76: D1        .byte $D1   ; 
- D 1 - I - 0x002A87 00:AA77: 16        .byte $16   ; 
- D 1 - I - 0x002A88 00:AA78: A0        .byte $A0   ; 
- D 1 - I - 0x002A89 00:AA79: 26        .byte $26   ; 
- D 1 - I - 0x002A8A 00:AA7A: E2        .byte $E2   ; 
- D 1 - I - 0x002A8B 00:AA7B: 00        .byte $00   ; 
- D 1 - I - 0x002A8C 00:AA7C: D1        .byte $D1   ; 
- D 1 - I - 0x002A8D 00:AA7D: 16        .byte $16   ; 
- D 1 - I - 0x002A8E 00:AA7E: E2        .byte $E2   ; 
- D 1 - I - 0x002A8F 00:AA7F: 00        .byte $00   ; 
- D 1 - I - 0x002A90 00:AA80: D1        .byte $D1   ; 
- D 1 - I - 0x002A91 00:AA81: 16        .byte $16   ; 
- D 1 - I - 0x002A92 00:AA82: E3        .byte $E3   ; 
- D 1 - I - 0x002A93 00:AA83: A0        .byte $A0   ; 
- D 1 - I - 0x002A94 00:AA84: D1        .byte $D1   ; 
- D 1 - I - 0x002A95 00:AA85: 16        .byte $16   ; 
- D 1 - I - 0x002A96 00:AA86: 17        .byte $17   ; 
- D 1 - I - 0x002A97 00:AA87: E3        .byte $E3   ; 
- D 1 - I - 0x002A98 00:AA88: A0        .byte $A0   ; 
- D 1 - I - 0x002A99 00:AA89: D1        .byte $D1   ; 
- D 1 - I - 0x002A9A 00:AA8A: 16        .byte $16   ; 
- D 1 - I - 0x002A9B 00:AA8B: A0        .byte $A0   ; 
- D 1 - I - 0x002A9C 00:AA8C: 26        .byte $26   ; 
- D 1 - I - 0x002A9D 00:AA8D: E3        .byte $E3   ; 
- D 1 - I - 0x002A9E 00:AA8E: A0        .byte $A0   ; 
- D 1 - I - 0x002A9F 00:AA8F: D1        .byte $D1   ; 
- D 1 - I - 0x002AA0 00:AA90: 16        .byte $16   ; 
- D 1 - I - 0x002AA1 00:AA91: E3        .byte $E3   ; 
- D 1 - I - 0x002AA2 00:AA92: A0        .byte $A0   ; 
- D 1 - I - 0x002AA3 00:AA93: D1        .byte $D1   ; 
- D 1 - I - 0x002AA4 00:AA94: 16        .byte $16   ; 
- D 1 - I - 0x002AA5 00:AA95: E3        .byte $E3   ; 
- D 1 - I - 0x002AA6 00:AA96: 90        .byte $90   ; 
- D 1 - I - 0x002AA7 00:AA97: D1        .byte $D1   ; 
- D 1 - I - 0x002AA8 00:AA98: 16        .byte $16   ; 
- D 1 - I - 0x002AA9 00:AA99: 13        .byte $13   ; 
- D 1 - I - 0x002AAA 00:AA9A: 13        .byte $13   ; 
- D 1 - I - 0x002AAB 00:AA9B: E3        .byte $E3   ; 
- D 1 - I - 0x002AAC 00:AA9C: 90        .byte $90   ; 
- D 1 - I - 0x002AAD 00:AA9D: D1        .byte $D1   ; 
- D 1 - I - 0x002AAE 00:AA9E: 16        .byte $16   ; 
- D 1 - I - 0x002AAF 00:AA9F: E2        .byte $E2   ; 
- D 1 - I - 0x002AB0 00:AAA0: 00        .byte $00   ; 
- D 1 - I - 0x002AB1 00:AAA1: D1        .byte $D1   ; 
- D 1 - I - 0x002AB2 00:AAA2: 26        .byte $26   ; 
- D 1 - I - 0x002AB3 00:AAA3: E3        .byte $E3   ; 
- D 1 - I - 0x002AB4 00:AAA4: 50        .byte $50   ; 
- D 1 - I - 0x002AB5 00:AAA5: D1        .byte $D1   ; 
- D 1 - I - 0x002AB6 00:AAA6: 26        .byte $26   ; 
- D 1 - I - 0x002AB7 00:AAA7: E3        .byte $E3   ; 
- D 1 - I - 0x002AB8 00:AAA8: 70        .byte $70   ; 
- D 1 - I - 0x002AB9 00:AAA9: D1        .byte $D1   ; 
- D 1 - I - 0x002ABA 00:AAAA: 26        .byte $26   ; 
- D 1 - I - 0x002ABB 00:AAAB: E2        .byte $E2   ; 
- D 1 - I - 0x002ABC 00:AAAC: 00        .byte $00   ; 
- D 1 - I - 0x002ABD 00:AAAD: D1        .byte $D1   ; 
- D 1 - I - 0x002ABE 00:AAAE: 26        .byte $26   ; 
- D 1 - I - 0x002ABF 00:AAAF: A0        .byte $A0   ; 
- D 1 - I - 0x002AC0 00:AAB0: 22        .byte $22   ; 
- D 1 - I - 0x002AC1 00:AAB1: A0        .byte $A0   ; 
- D 1 - I - 0x002AC2 00:AAB2: 22        .byte $22   ; 
- D 1 - I - 0x002AC3 00:AAB3: A0        .byte $A0   ; 
- D 1 - I - 0x002AC4 00:AAB4: 26        .byte $26   ; 
- D 1 - I - 0x002AC5 00:AAB5: A0        .byte $A0   ; 
- D 1 - I - 0x002AC6 00:AAB6: 26        .byte $26   ; 
- D 1 - I - 0x002AC7 00:AAB7: A0        .byte $A0   ; 
- D 1 - I - 0x002AC8 00:AAB8: 26        .byte $26   ; 
- D 1 - I - 0x002AC9 00:AAB9: A0        .byte $A0   ; 
- D 1 - I - 0x002ACA 00:AABA: 26        .byte $26   ; 
- D 1 - I - 0x002ACB 00:AABB: FD        .byte $FD   ; 
- D 1 - I - 0x002ACC 00:AABC: 15 AB     .word sub_FD_AB15
- D 1 - I - 0x002ACE 00:AABE: FD        .byte $FD   ; 
- D 1 - I - 0x002ACF 00:AABF: 15 AB     .word sub_FD_AB15
- D 1 - I - 0x002AD1 00:AAC1: FD        .byte $FD   ; 
- D 1 - I - 0x002AD2 00:AAC2: 15 AB     .word sub_FD_AB15
- D 1 - I - 0x002AD4 00:AAC4: D1        .byte $D1   ; 
- D 1 - I - 0x002AD5 00:AAC5: B0        .byte $B0   ; 
- D 1 - I - 0x002AD6 00:AAC6: 26        .byte $26   ; 
- D 1 - I - 0x002AD7 00:AAC7: 23        .byte $23   ; 
- D 1 - I - 0x002AD8 00:AAC8: 13        .byte $13   ; 
- D 1 - I - 0x002AD9 00:AAC9: B0        .byte $B0   ; 
- D 1 - I - 0x002ADA 00:AACA: 26        .byte $26   ; 
- D 1 - I - 0x002ADB 00:AACB: A0        .byte $A0   ; 
- D 1 - I - 0x002ADC 00:AACC: 26        .byte $26   ; 
- D 1 - I - 0x002ADD 00:AACD: B0        .byte $B0   ; 
- D 1 - I - 0x002ADE 00:AACE: 26        .byte $26   ; 
- D 1 - I - 0x002ADF 00:AACF: 27        .byte $27   ; 
- D 1 - I - 0x002AE0 00:AAD0: B0        .byte $B0   ; 
- D 1 - I - 0x002AE1 00:AAD1: 26        .byte $26   ; 
- D 1 - I - 0x002AE2 00:AAD2: 27        .byte $27   ; 
- D 1 - I - 0x002AE3 00:AAD3: B0        .byte $B0   ; 
- D 1 - I - 0x002AE4 00:AAD4: 26        .byte $26   ; 
- D 1 - I - 0x002AE5 00:AAD5: A0        .byte $A0   ; 
- D 1 - I - 0x002AE6 00:AAD6: 26        .byte $26   ; 
- D 1 - I - 0x002AE7 00:AAD7: B0        .byte $B0   ; 
- D 1 - I - 0x002AE8 00:AAD8: 26        .byte $26   ; 
- D 1 - I - 0x002AE9 00:AAD9: 27        .byte $27   ; 
- D 1 - I - 0x002AEA 00:AADA: B0        .byte $B0   ; 
- D 1 - I - 0x002AEB 00:AADB: 26        .byte $26   ; 
- D 1 - I - 0x002AEC 00:AADC: 93        .byte $93   ; 
- D 1 - I - 0x002AED 00:AADD: 93        .byte $93   ; 
- D 1 - I - 0x002AEE 00:AADE: 90        .byte $90   ; 
- D 1 - I - 0x002AEF 00:AADF: 26        .byte $26   ; 
- D 1 - I - 0x002AF0 00:AAE0: A0        .byte $A0   ; 
- D 1 - I - 0x002AF1 00:AAE1: 26        .byte $26   ; 
- D 1 - I - 0x002AF2 00:AAE2: 80        .byte $80   ; 
- D 1 - I - 0x002AF3 00:AAE3: 26        .byte $26   ; 
- D 1 - I - 0x002AF4 00:AAE4: 80        .byte $80   ; 
- D 1 - I - 0x002AF5 00:AAE5: 26        .byte $26   ; 
- D 1 - I - 0x002AF6 00:AAE6: B0        .byte $B0   ; 
- D 1 - I - 0x002AF7 00:AAE7: 26        .byte $26   ; 
- D 1 - I - 0x002AF8 00:AAE8: A0        .byte $A0   ; 
- D 1 - I - 0x002AF9 00:AAE9: 26        .byte $26   ; 
- D 1 - I - 0x002AFA 00:AAEA: A0        .byte $A0   ; 
- D 1 - I - 0x002AFB 00:AAEB: 26        .byte $26   ; 
- D 1 - I - 0x002AFC 00:AAEC: A0        .byte $A0   ; 
- D 1 - I - 0x002AFD 00:AAED: 26        .byte $26   ; 
- D 1 - I - 0x002AFE 00:AAEE: 80        .byte $80   ; 
- D 1 - I - 0x002AFF 00:AAEF: 26        .byte $26   ; 
- D 1 - I - 0x002B00 00:AAF0: 70        .byte $70   ; 
- D 1 - I - 0x002B01 00:AAF1: 26        .byte $26   ; 
- D 1 - I - 0x002B02 00:AAF2: B0        .byte $B0   ; 
- D 1 - I - 0x002B03 00:AAF3: 26        .byte $26   ; 
- D 1 - I - 0x002B04 00:AAF4: 23        .byte $23   ; 
- D 1 - I - 0x002B05 00:AAF5: 23        .byte $23   ; 
- D 1 - I - 0x002B06 00:AAF6: B0        .byte $B0   ; 
- D 1 - I - 0x002B07 00:AAF7: 26        .byte $26   ; 
- D 1 - I - 0x002B08 00:AAF8: A0        .byte $A0   ; 
- D 1 - I - 0x002B09 00:AAF9: 26        .byte $26   ; 
- D 1 - I - 0x002B0A 00:AAFA: B0        .byte $B0   ; 
- D 1 - I - 0x002B0B 00:AAFB: 26        .byte $26   ; 
- D 1 - I - 0x002B0C 00:AAFC: 27        .byte $27   ; 
- D 1 - I - 0x002B0D 00:AAFD: B0        .byte $B0   ; 
- D 1 - I - 0x002B0E 00:AAFE: 26        .byte $26   ; 
- D 1 - I - 0x002B0F 00:AAFF: 27        .byte $27   ; 
- D 1 - I - 0x002B10 00:AB00: B0        .byte $B0   ; 
- D 1 - I - 0x002B11 00:AB01: 26        .byte $26   ; 
- D 1 - I - 0x002B12 00:AB02: A3        .byte $A3   ; 
- D 1 - I - 0x002B13 00:AB03: A3        .byte $A3   ; 
- D 1 - I - 0x002B14 00:AB04: C7        .byte $C7   ; 
- D 1 - I - 0x002B15 00:AB05: C7        .byte $C7   ; 
- D 1 - I - 0x002B16 00:AB06: B0        .byte $B0   ; 
- D 1 - I - 0x002B17 00:AB07: 26        .byte $26   ; 
- D 1 - I - 0x002B18 00:AB08: 93        .byte $93   ; 
- D 1 - I - 0x002B19 00:AB09: 93        .byte $93   ; 
- D 1 - I - 0x002B1A 00:AB0A: 83        .byte $83   ; 
- D 1 - I - 0x002B1B 00:AB0B: 73        .byte $73   ; 
- D 1 - I - 0x002B1C 00:AB0C: A0        .byte $A0   ; 
- D 1 - I - 0x002B1D 00:AB0D: 26        .byte $26   ; 
- D 1 - I - 0x002B1E 00:AB0E: A0        .byte $A0   ; 
- D 1 - I - 0x002B1F 00:AB0F: 26        .byte $26   ; 
- D 1 - I - 0x002B20 00:AB10: A0        .byte $A0   ; 
- D 1 - I - 0x002B21 00:AB11: 26        .byte $26   ; 
- D 1 - I - 0x002B22 00:AB12: A0        .byte $A0   ; 
- D 1 - I - 0x002B23 00:AB13: 26        .byte $26   ; 
- D 1 - I - 0x002B24 00:AB14: FF        .byte $FF   ; 



sub_FD_AB15:
- D 1 - I - 0x002B25 00:AB15: D1        .byte $D1   ; 
- D 1 - I - 0x002B26 00:AB16: FB        .byte $FB   ; 
- D 1 - I - 0x002B27 00:AB17: B0        .byte $B0   ; 
- D 1 - I - 0x002B28 00:AB18: 26        .byte $26   ; 
- D 1 - I - 0x002B29 00:AB19: 23        .byte $23   ; 
- D 1 - I - 0x002B2A 00:AB1A: 13        .byte $13   ; 
- D 1 - I - 0x002B2B 00:AB1B: B0        .byte $B0   ; 
- D 1 - I - 0x002B2C 00:AB1C: 26        .byte $26   ; 
- D 1 - I - 0x002B2D 00:AB1D: A0        .byte $A0   ; 
- D 1 - I - 0x002B2E 00:AB1E: 26        .byte $26   ; 
- D 1 - I - 0x002B2F 00:AB1F: B0        .byte $B0   ; 
- D 1 - I - 0x002B30 00:AB20: 26        .byte $26   ; 
- D 1 - I - 0x002B31 00:AB21: 27        .byte $27   ; 
- D 1 - I - 0x002B32 00:AB22: B0        .byte $B0   ; 
- D 1 - I - 0x002B33 00:AB23: 26        .byte $26   ; 
- D 1 - I - 0x002B34 00:AB24: 27        .byte $27   ; 
- D 1 - I - 0x002B35 00:AB25: B0        .byte $B0   ; 
- D 1 - I - 0x002B36 00:AB26: 26        .byte $26   ; 
- D 1 - I - 0x002B37 00:AB27: A0        .byte $A0   ; 
- D 1 - I - 0x002B38 00:AB28: 26        .byte $26   ; 
- D 1 - I - 0x002B39 00:AB29: B0        .byte $B0   ; 
- D 1 - I - 0x002B3A 00:AB2A: 26        .byte $26   ; 
- D 1 - I - 0x002B3B 00:AB2B: 27        .byte $27   ; 
- D 1 - I - 0x002B3C 00:AB2C: FE        .byte $FE   ; 
- D 1 - I - 0x002B3D 00:AB2D: 07        .byte $07   ; 
- D 1 - I - 0x002B3E 00:AB2E: B0        .byte $B0   ; 
- D 1 - I - 0x002B3F 00:AB2F: 26        .byte $26   ; 
- D 1 - I - 0x002B40 00:AB30: 23        .byte $23   ; 
- D 1 - I - 0x002B41 00:AB31: 13        .byte $13   ; 
- D 1 - I - 0x002B42 00:AB32: B0        .byte $B0   ; 
- D 1 - I - 0x002B43 00:AB33: 26        .byte $26   ; 
- D 1 - I - 0x002B44 00:AB34: A0        .byte $A0   ; 
- D 1 - I - 0x002B45 00:AB35: 26        .byte $26   ; 
- D 1 - I - 0x002B46 00:AB36: B0        .byte $B0   ; 
- D 1 - I - 0x002B47 00:AB37: 26        .byte $26   ; 
- D 1 - I - 0x002B48 00:AB38: 27        .byte $27   ; 
- D 1 - I - 0x002B49 00:AB39: B0        .byte $B0   ; 
- D 1 - I - 0x002B4A 00:AB3A: 26        .byte $26   ; 
- D 1 - I - 0x002B4B 00:AB3B: 27        .byte $27   ; 
- D 1 - I - 0x002B4C 00:AB3C: B0        .byte $B0   ; 
- D 1 - I - 0x002B4D 00:AB3D: 26        .byte $26   ; 
- D 1 - I - 0x002B4E 00:AB3E: A0        .byte $A0   ; 
- D 1 - I - 0x002B4F 00:AB3F: 26        .byte $26   ; 
- D 1 - I - 0x002B50 00:AB40: A0        .byte $A0   ; 
- D 1 - I - 0x002B51 00:AB41: 26        .byte $26   ; 
- D 1 - I - 0x002B52 00:AB42: A0        .byte $A0   ; 
- D 1 - I - 0x002B53 00:AB43: 26        .byte $26   ; 
- D 1 - I - 0x002B54 00:AB44: FD        .byte $FD   ; 



_off004_0x002B55_01_area_2:
- D 1 - I - 0x002B55 00:AB45: 02        .byte $02   ; config
- D 1 - I - 0x002B56 00:AB46: 0D        .byte $0D   ; config

- D 1 - I - 0x002B57 00:AB47: 0D        .byte $0D   ; 
- D 1 - I - 0x002B58 00:AB48: 00        .byte $00   ; 
- D 1 - I - 0x002B59 00:AB49: 0C        .byte $0C   ; 
- D 1 - I - 0x002B5A 00:AB4A: 0E        .byte $0E   ; 
- D 1 - I - 0x002B5B 00:AB4B: 0B        .byte $0B   ; 
- - - - - - 0x002B5C 00:AB4C: 00        .byte $00   ; 
- D 1 - I - 0x002B5D 00:AB4D: 0A        .byte $0A   ; 
- - - - - - 0x002B5E 00:AB4E: 00        .byte $00   ; 
- D 1 - I - 0x002B5F 00:AB4F: 09        .byte $09   ; 
- - - - - - 0x002B60 00:AB50: 00        .byte $00   ; 
- D 1 - I - 0x002B61 00:AB51: 08        .byte $08   ; 
- - - - - - 0x002B62 00:AB52: 00        .byte $00   ; 
- D 1 - I - 0x002B63 00:AB53: 07        .byte $07   ; 
- - - - - - 0x002B64 00:AB54: 00        .byte $00   ; 
- D 1 - I - 0x002B65 00:AB55: 06        .byte $06   ; 
- - - - - - 0x002B66 00:AB56: 00        .byte $00   ; 
- D 1 - I - 0x002B67 00:AB57: 05        .byte $05   ; 
- - - - - - 0x002B68 00:AB58: 00        .byte $00   ; 
- D 1 - I - 0x002B69 00:AB59: 04        .byte $04   ; 
- - - - - - 0x002B6A 00:AB5A: 00        .byte $00   ; 
- D 1 - I - 0x002B6B 00:AB5B: 03        .byte $03   ; 
- - - - - - 0x002B6C 00:AB5C: 00        .byte $00   ; 
- D 1 - I - 0x002B6D 00:AB5D: 02        .byte $02   ; 
- - - - - - 0x002B6E 00:AB5E: 00        .byte $00   ; 
- D 1 - I - 0x002B6F 00:AB5F: 01        .byte $01   ; 
- D 1 - I - 0x002B70 00:AB60: 0F        .byte $0F   ; 



_off005_0x002B71_01_area_2:
- D 1 - I - 0x002B71 00:AB61: 7F AB     .word _off018_01_AB7F_00
- D 1 - I - 0x002B73 00:AB63: BF AB     .word _off018_01_ABBF_01
- D 1 - I - 0x002B75 00:AB65: FF AB     .word _off018_01_ABFF_02
- D 1 - I - 0x002B77 00:AB67: 3F AC     .word _off018_01_AC3F_03
- D 1 - I - 0x002B79 00:AB69: 7F AC     .word _off018_01_AC7F_04
- D 1 - I - 0x002B7B 00:AB6B: BF AC     .word _off018_01_ACBF_05
- D 1 - I - 0x002B7D 00:AB6D: FF AC     .word _off018_01_ACFF_06
- D 1 - I - 0x002B7F 00:AB6F: 3F AD     .word _off018_01_AD3F_07
- D 1 - I - 0x002B81 00:AB71: 7F AD     .word _off018_01_AD7F_08
- D 1 - I - 0x002B83 00:AB73: BF AD     .word _off018_01_ADBF_09
- D 1 - I - 0x002B85 00:AB75: FF AD     .word _off018_01_ADFF_0A
- D 1 - I - 0x002B87 00:AB77: 3F AE     .word _off018_01_AE3F_0B
- D 1 - I - 0x002B89 00:AB79: 7F AE     .word _off018_01_AE7F_0C
- D 1 - I - 0x002B8B 00:AB7B: BF AE     .word _off018_01_AEBF_0D
- D 1 - I - 0x002B8D 00:AB7D: FF AE     .word _off018_01_AEFF_0E



_off018_01_AB7F_00:
- D 1 - I - 0x002B8F 00:AB7F: 00        .byte $00   ; 
- D 1 - I - 0x002B90 00:AB80: 00        .byte $00   ; 
- - - - - - 0x002B91 00:AB81: 00        .byte $00   ; 
- - - - - - 0x002B92 00:AB82: 00        .byte $00   ; 
- - - - - - 0x002B93 00:AB83: 00        .byte $00   ; 
- - - - - - 0x002B94 00:AB84: 00        .byte $00   ; 
- - - - - - 0x002B95 00:AB85: 00        .byte $00   ; 
- - - - - - 0x002B96 00:AB86: 00        .byte $00   ; 
- - - - - - 0x002B97 00:AB87: 00        .byte $00   ; 
- - - - - - 0x002B98 00:AB88: 00        .byte $00   ; 
- - - - - - 0x002B99 00:AB89: 00        .byte $00   ; 
- - - - - - 0x002B9A 00:AB8A: 00        .byte $00   ; 
- - - - - - 0x002B9B 00:AB8B: 00        .byte $00   ; 
- - - - - - 0x002B9C 00:AB8C: 00        .byte $00   ; 
- - - - - - 0x002B9D 00:AB8D: 00        .byte $00   ; 
- - - - - - 0x002B9E 00:AB8E: 00        .byte $00   ; 
- - - - - - 0x002B9F 00:AB8F: 00        .byte $00   ; 
- - - - - - 0x002BA0 00:AB90: 00        .byte $00   ; 
- - - - - - 0x002BA1 00:AB91: 00        .byte $00   ; 
- - - - - - 0x002BA2 00:AB92: 00        .byte $00   ; 
- - - - - - 0x002BA3 00:AB93: 00        .byte $00   ; 
- - - - - - 0x002BA4 00:AB94: 00        .byte $00   ; 
- - - - - - 0x002BA5 00:AB95: 00        .byte $00   ; 
- - - - - - 0x002BA6 00:AB96: 00        .byte $00   ; 
- - - - - - 0x002BA7 00:AB97: 00        .byte $00   ; 
- - - - - - 0x002BA8 00:AB98: 00        .byte $00   ; 
- - - - - - 0x002BA9 00:AB99: 00        .byte $00   ; 
- - - - - - 0x002BAA 00:AB9A: 00        .byte $00   ; 
- - - - - - 0x002BAB 00:AB9B: 00        .byte $00   ; 
- - - - - - 0x002BAC 00:AB9C: 00        .byte $00   ; 
- - - - - - 0x002BAD 00:AB9D: 00        .byte $00   ; 
- - - - - - 0x002BAE 00:AB9E: 00        .byte $00   ; 
- D 1 - I - 0x002BAF 00:AB9F: 00        .byte $00   ; 
- D 1 - I - 0x002BB0 00:ABA0: 00        .byte $00   ; 
- - - - - - 0x002BB1 00:ABA1: 00        .byte $00   ; 
- - - - - - 0x002BB2 00:ABA2: 00        .byte $00   ; 
- - - - - - 0x002BB3 00:ABA3: 00        .byte $00   ; 
- - - - - - 0x002BB4 00:ABA4: 00        .byte $00   ; 
- - - - - - 0x002BB5 00:ABA5: 00        .byte $00   ; 
- - - - - - 0x002BB6 00:ABA6: 00        .byte $00   ; 
- D 1 - I - 0x002BB7 00:ABA7: 00        .byte $00   ; 
- D 1 - I - 0x002BB8 00:ABA8: 00        .byte $00   ; 
- - - - - - 0x002BB9 00:ABA9: 00        .byte $00   ; 
- - - - - - 0x002BBA 00:ABAA: 00        .byte $00   ; 
- - - - - - 0x002BBB 00:ABAB: 00        .byte $00   ; 
- - - - - - 0x002BBC 00:ABAC: 00        .byte $00   ; 
- - - - - - 0x002BBD 00:ABAD: 00        .byte $00   ; 
- - - - - - 0x002BBE 00:ABAE: 00        .byte $00   ; 
- D 1 - I - 0x002BBF 00:ABAF: 00        .byte $00   ; 
- D 1 - I - 0x002BC0 00:ABB0: 00        .byte $00   ; 
- - - - - - 0x002BC1 00:ABB1: 00        .byte $00   ; 
- - - - - - 0x002BC2 00:ABB2: 00        .byte $00   ; 
- - - - - - 0x002BC3 00:ABB3: 00        .byte $00   ; 
- - - - - - 0x002BC4 00:ABB4: 00        .byte $00   ; 
- - - - - - 0x002BC5 00:ABB5: 00        .byte $00   ; 
- - - - - - 0x002BC6 00:ABB6: 00        .byte $00   ; 
- D 1 - I - 0x002BC7 00:ABB7: 00        .byte $00   ; 
- D 1 - I - 0x002BC8 00:ABB8: 00        .byte $00   ; 
- - - - - - 0x002BC9 00:ABB9: 00        .byte $00   ; 
- - - - - - 0x002BCA 00:ABBA: 00        .byte $00   ; 
- - - - - - 0x002BCB 00:ABBB: 00        .byte $00   ; 
- - - - - - 0x002BCC 00:ABBC: 00        .byte $00   ; 
- - - - - - 0x002BCD 00:ABBD: 00        .byte $00   ; 
- - - - - - 0x002BCE 00:ABBE: 00        .byte $00   ; 



_off018_01_ABBF_01:
- D 1 - I - 0x002BCF 00:ABBF: 01        .byte $01   ; 
- D 1 - I - 0x002BD0 00:ABC0: 01        .byte $01   ; 
- D 1 - I - 0x002BD1 00:ABC1: 02        .byte $02   ; 
- D 1 - I - 0x002BD2 00:ABC2: 1F        .byte $1F   ; 
- D 1 - I - 0x002BD3 00:ABC3: 10        .byte $10   ; 
- D 1 - I - 0x002BD4 00:ABC4: 11        .byte $11   ; 
- D 1 - I - 0x002BD5 00:ABC5: 12        .byte $12   ; 
- D 1 - I - 0x002BD6 00:ABC6: 12        .byte $12   ; 
- D 1 - I - 0x002BD7 00:ABC7: 02        .byte $02   ; 
- D 1 - I - 0x002BD8 00:ABC8: 01        .byte $01   ; 
- D 1 - I - 0x002BD9 00:ABC9: 01        .byte $01   ; 
- D 1 - I - 0x002BDA 00:ABCA: 1F        .byte $1F   ; 
- D 1 - I - 0x002BDB 00:ABCB: 14        .byte $14   ; 
- D 1 - I - 0x002BDC 00:ABCC: 15        .byte $15   ; 
- D 1 - I - 0x002BDD 00:ABCD: 16        .byte $16   ; 
- D 1 - I - 0x002BDE 00:ABCE: 0B        .byte $0B   ; 
- D 1 - I - 0x002BDF 00:ABCF: 01        .byte $01   ; 
- D 1 - I - 0x002BE0 00:ABD0: 01        .byte $01   ; 
- D 1 - I - 0x002BE1 00:ABD1: 01        .byte $01   ; 
- D 1 - I - 0x002BE2 00:ABD2: 1F        .byte $1F   ; 
- D 1 - I - 0x002BE3 00:ABD3: 18        .byte $18   ; 
- D 1 - I - 0x002BE4 00:ABD4: 19        .byte $19   ; 
- D 1 - I - 0x002BE5 00:ABD5: 1A        .byte $1A   ; 
- D 1 - I - 0x002BE6 00:ABD6: 08        .byte $08   ; 
- D 1 - I - 0x002BE7 00:ABD7: 01        .byte $01   ; 
- D 1 - I - 0x002BE8 00:ABD8: 01        .byte $01   ; 
- D 1 - I - 0x002BE9 00:ABD9: 02        .byte $02   ; 
- D 1 - I - 0x002BEA 00:ABDA: 1F        .byte $1F   ; 
- D 1 - I - 0x002BEB 00:ABDB: 1C        .byte $1C   ; 
- D 1 - I - 0x002BEC 00:ABDC: 1D        .byte $1D   ; 
- D 1 - I - 0x002BED 00:ABDD: 1E        .byte $1E   ; 
- D 1 - I - 0x002BEE 00:ABDE: 0F        .byte $0F   ; 
- D 1 - I - 0x002BEF 00:ABDF: 0C        .byte $0C   ; 
- D 1 - I - 0x002BF0 00:ABE0: 01        .byte $01   ; 
- D 1 - I - 0x002BF1 00:ABE1: 01        .byte $01   ; 
- D 1 - I - 0x002BF2 00:ABE2: 01        .byte $01   ; 
- D 1 - I - 0x002BF3 00:ABE3: 06        .byte $06   ; 
- D 1 - I - 0x002BF4 00:ABE4: 07        .byte $07   ; 
- D 1 - I - 0x002BF5 00:ABE5: 07        .byte $07   ; 
- D 1 - I - 0x002BF6 00:ABE6: 00        .byte $00   ; 
- D 1 - I - 0x002BF7 00:ABE7: 04        .byte $04   ; 
- D 1 - I - 0x002BF8 00:ABE8: 05        .byte $05   ; 
- D 1 - I - 0x002BF9 00:ABE9: 01        .byte $01   ; 
- D 1 - I - 0x002BFA 00:ABEA: 02        .byte $02   ; 
- D 1 - I - 0x002BFB 00:ABEB: 01        .byte $01   ; 
- D 1 - I - 0x002BFC 00:ABEC: 06        .byte $06   ; 
- D 1 - I - 0x002BFD 00:ABED: 07        .byte $07   ; 
- D 1 - I - 0x002BFE 00:ABEE: 00        .byte $00   ; 
- D 1 - I - 0x002BFF 00:ABEF: 08        .byte $08   ; 
- D 1 - I - 0x002C00 00:ABF0: 09        .byte $09   ; 
- D 1 - I - 0x002C01 00:ABF1: 0A        .byte $0A   ; 
- D 1 - I - 0x002C02 00:ABF2: 01        .byte $01   ; 
- D 1 - I - 0x002C03 00:ABF3: 01        .byte $01   ; 
- D 1 - I - 0x002C04 00:ABF4: 02        .byte $02   ; 
- D 1 - I - 0x002C05 00:ABF5: 06        .byte $06   ; 
- D 1 - I - 0x002C06 00:ABF6: 03        .byte $03   ; 
- D 1 - I - 0x002C07 00:ABF7: 08        .byte $08   ; 
- D 1 - I - 0x002C08 00:ABF8: 0D        .byte $0D   ; 
- D 1 - I - 0x002C09 00:ABF9: 0E        .byte $0E   ; 
- D 1 - I - 0x002C0A 00:ABFA: 01        .byte $01   ; 
- D 1 - I - 0x002C0B 00:ABFB: 01        .byte $01   ; 
- D 1 - I - 0x002C0C 00:ABFC: 01        .byte $01   ; 
- D 1 - I - 0x002C0D 00:ABFD: 01        .byte $01   ; 
- D 1 - I - 0x002C0E 00:ABFE: 06        .byte $06   ; 



_off018_01_ABFF_02:
- D 1 - I - 0x002C0F 00:ABFF: 31        .byte $31   ; 
- D 1 - I - 0x002C10 00:AC00: 32        .byte $32   ; 
- D 1 - I - 0x002C11 00:AC01: 30        .byte $30   ; 
- D 1 - I - 0x002C12 00:AC02: 30        .byte $30   ; 
- D 1 - I - 0x002C13 00:AC03: 30        .byte $30   ; 
- D 1 - I - 0x002C14 00:AC04: 30        .byte $30   ; 
- D 1 - I - 0x002C15 00:AC05: 30        .byte $30   ; 
- D 1 - I - 0x002C16 00:AC06: 23        .byte $23   ; 
- D 1 - I - 0x002C17 00:AC07: 20        .byte $20   ; 
- D 1 - I - 0x002C18 00:AC08: 21        .byte $21   ; 
- D 1 - I - 0x002C19 00:AC09: 22        .byte $22   ; 
- D 1 - I - 0x002C1A 00:AC0A: 22        .byte $22   ; 
- D 1 - I - 0x002C1B 00:AC0B: 22        .byte $22   ; 
- D 1 - I - 0x002C1C 00:AC0C: 36        .byte $36   ; 
- D 1 - I - 0x002C1D 00:AC0D: 3E        .byte $3E   ; 
- D 1 - I - 0x002C1E 00:AC0E: 33        .byte $33   ; 
- D 1 - I - 0x002C1F 00:AC0F: 24        .byte $24   ; 
- D 1 - I - 0x002C20 00:AC10: 25        .byte $25   ; 
- D 1 - I - 0x002C21 00:AC11: 26        .byte $26   ; 
- D 1 - I - 0x002C22 00:AC12: 27        .byte $27   ; 
- D 1 - I - 0x002C23 00:AC13: 34        .byte $34   ; 
- D 1 - I - 0x002C24 00:AC14: 35        .byte $35   ; 
- D 1 - I - 0x002C25 00:AC15: 3E        .byte $3E   ; 
- D 1 - I - 0x002C26 00:AC16: 30        .byte $30   ; 
- D 1 - I - 0x002C27 00:AC17: 28        .byte $28   ; 
- D 1 - I - 0x002C28 00:AC18: 29        .byte $29   ; 
- D 1 - I - 0x002C29 00:AC19: 2A        .byte $2A   ; 
- D 1 - I - 0x002C2A 00:AC1A: 2B        .byte $2B   ; 
- D 1 - I - 0x002C2B 00:AC1B: 38        .byte $38   ; 
- D 1 - I - 0x002C2C 00:AC1C: 39        .byte $39   ; 
- D 1 - I - 0x002C2D 00:AC1D: 30        .byte $30   ; 
- D 1 - I - 0x002C2E 00:AC1E: 23        .byte $23   ; 
- D 1 - I - 0x002C2F 00:AC1F: 2C        .byte $2C   ; 
- D 1 - I - 0x002C30 00:AC20: 28        .byte $28   ; 
- D 1 - I - 0x002C31 00:AC21: 2E        .byte $2E   ; 
- D 1 - I - 0x002C32 00:AC22: 2F        .byte $2F   ; 
- D 1 - I - 0x002C33 00:AC23: 3C        .byte $3C   ; 
- D 1 - I - 0x002C34 00:AC24: 3D        .byte $3D   ; 
- D 1 - I - 0x002C35 00:AC25: 37        .byte $37   ; 
- D 1 - I - 0x002C36 00:AC26: 33        .byte $33   ; 
- D 1 - I - 0x002C37 00:AC27: 13        .byte $13   ; 
- D 1 - I - 0x002C38 00:AC28: 17        .byte $17   ; 
- D 1 - I - 0x002C39 00:AC29: 1B        .byte $1B   ; 
- D 1 - I - 0x002C3A 00:AC2A: 3A        .byte $3A   ; 
- D 1 - I - 0x002C3B 00:AC2B: 3A        .byte $3A   ; 
- D 1 - I - 0x002C3C 00:AC2C: 3A        .byte $3A   ; 
- D 1 - I - 0x002C3D 00:AC2D: 3B        .byte $3B   ; 
- D 1 - I - 0x002C3E 00:AC2E: 37        .byte $37   ; 
- D 1 - I - 0x002C3F 00:AC2F: 3A        .byte $3A   ; 
- D 1 - I - 0x002C40 00:AC30: 3A        .byte $3A   ; 
- D 1 - I - 0x002C41 00:AC31: 3A        .byte $3A   ; 
- D 1 - I - 0x002C42 00:AC32: 3A        .byte $3A   ; 
- D 1 - I - 0x002C43 00:AC33: 3A        .byte $3A   ; 
- D 1 - I - 0x002C44 00:AC34: 3A        .byte $3A   ; 
- D 1 - I - 0x002C45 00:AC35: 3A        .byte $3A   ; 
- D 1 - I - 0x002C46 00:AC36: 3B        .byte $3B   ; 
- D 1 - I - 0x002C47 00:AC37: 30        .byte $30   ; 
- D 1 - I - 0x002C48 00:AC38: 30        .byte $30   ; 
- D 1 - I - 0x002C49 00:AC39: 30        .byte $30   ; 
- D 1 - I - 0x002C4A 00:AC3A: 30        .byte $30   ; 
- D 1 - I - 0x002C4B 00:AC3B: 22        .byte $22   ; 
- D 1 - I - 0x002C4C 00:AC3C: 22        .byte $22   ; 
- D 1 - I - 0x002C4D 00:AC3D: 22        .byte $22   ; 
- D 1 - I - 0x002C4E 00:AC3E: 22        .byte $22   ; 



_off018_01_AC3F_03:
- D 1 - I - 0x002C4F 00:AC3F: 3F        .byte $3F   ; 
- D 1 - I - 0x002C50 00:AC40: 3F        .byte $3F   ; 
- D 1 - I - 0x002C51 00:AC41: 3F        .byte $3F   ; 
- D 1 - I - 0x002C52 00:AC42: 3F        .byte $3F   ; 
- D 1 - I - 0x002C53 00:AC43: 3F        .byte $3F   ; 
- D 1 - I - 0x002C54 00:AC44: 3F        .byte $3F   ; 
- D 1 - I - 0x002C55 00:AC45: 3F        .byte $3F   ; 
- D 1 - I - 0x002C56 00:AC46: 3F        .byte $3F   ; 
- D 1 - I - 0x002C57 00:AC47: 01        .byte $01   ; 
- D 1 - I - 0x002C58 00:AC48: 01        .byte $01   ; 
- D 1 - I - 0x002C59 00:AC49: 01        .byte $01   ; 
- D 1 - I - 0x002C5A 00:AC4A: 01        .byte $01   ; 
- D 1 - I - 0x002C5B 00:AC4B: 01        .byte $01   ; 
- D 1 - I - 0x002C5C 00:AC4C: 01        .byte $01   ; 
- D 1 - I - 0x002C5D 00:AC4D: 01        .byte $01   ; 
- D 1 - I - 0x002C5E 00:AC4E: 01        .byte $01   ; 
- D 1 - I - 0x002C5F 00:AC4F: 01        .byte $01   ; 
- D 1 - I - 0x002C60 00:AC50: 01        .byte $01   ; 
- D 1 - I - 0x002C61 00:AC51: 01        .byte $01   ; 
- D 1 - I - 0x002C62 00:AC52: 01        .byte $01   ; 
- D 1 - I - 0x002C63 00:AC53: 01        .byte $01   ; 
- D 1 - I - 0x002C64 00:AC54: 01        .byte $01   ; 
- D 1 - I - 0x002C65 00:AC55: 01        .byte $01   ; 
- D 1 - I - 0x002C66 00:AC56: 01        .byte $01   ; 
- D 1 - I - 0x002C67 00:AC57: 01        .byte $01   ; 
- D 1 - I - 0x002C68 00:AC58: 01        .byte $01   ; 
- D 1 - I - 0x002C69 00:AC59: 01        .byte $01   ; 
- D 1 - I - 0x002C6A 00:AC5A: 01        .byte $01   ; 
- D 1 - I - 0x002C6B 00:AC5B: 01        .byte $01   ; 
- D 1 - I - 0x002C6C 00:AC5C: 01        .byte $01   ; 
- D 1 - I - 0x002C6D 00:AC5D: 01        .byte $01   ; 
- D 1 - I - 0x002C6E 00:AC5E: 01        .byte $01   ; 
- D 1 - I - 0x002C6F 00:AC5F: 01        .byte $01   ; 
- D 1 - I - 0x002C70 00:AC60: 01        .byte $01   ; 
- D 1 - I - 0x002C71 00:AC61: 01        .byte $01   ; 
- D 1 - I - 0x002C72 00:AC62: 01        .byte $01   ; 
- D 1 - I - 0x002C73 00:AC63: 01        .byte $01   ; 
- D 1 - I - 0x002C74 00:AC64: 01        .byte $01   ; 
- D 1 - I - 0x002C75 00:AC65: 01        .byte $01   ; 
- D 1 - I - 0x002C76 00:AC66: 01        .byte $01   ; 
- D 1 - I - 0x002C77 00:AC67: 01        .byte $01   ; 
- D 1 - I - 0x002C78 00:AC68: 01        .byte $01   ; 
- D 1 - I - 0x002C79 00:AC69: 01        .byte $01   ; 
- D 1 - I - 0x002C7A 00:AC6A: 01        .byte $01   ; 
- D 1 - I - 0x002C7B 00:AC6B: 01        .byte $01   ; 
- D 1 - I - 0x002C7C 00:AC6C: 01        .byte $01   ; 
- D 1 - I - 0x002C7D 00:AC6D: 01        .byte $01   ; 
- D 1 - I - 0x002C7E 00:AC6E: 01        .byte $01   ; 
- D 1 - I - 0x002C7F 00:AC6F: 01        .byte $01   ; 
- D 1 - I - 0x002C80 00:AC70: 01        .byte $01   ; 
- D 1 - I - 0x002C81 00:AC71: 01        .byte $01   ; 
- D 1 - I - 0x002C82 00:AC72: 01        .byte $01   ; 
- D 1 - I - 0x002C83 00:AC73: 01        .byte $01   ; 
- D 1 - I - 0x002C84 00:AC74: 01        .byte $01   ; 
- D 1 - I - 0x002C85 00:AC75: 01        .byte $01   ; 
- D 1 - I - 0x002C86 00:AC76: 01        .byte $01   ; 
- D 1 - I - 0x002C87 00:AC77: 01        .byte $01   ; 
- D 1 - I - 0x002C88 00:AC78: 01        .byte $01   ; 
- D 1 - I - 0x002C89 00:AC79: 01        .byte $01   ; 
- D 1 - I - 0x002C8A 00:AC7A: 01        .byte $01   ; 
- D 1 - I - 0x002C8B 00:AC7B: 01        .byte $01   ; 
- D 1 - I - 0x002C8C 00:AC7C: 01        .byte $01   ; 
- D 1 - I - 0x002C8D 00:AC7D: 01        .byte $01   ; 
- D 1 - I - 0x002C8E 00:AC7E: 01        .byte $01   ; 



_off018_01_AC7F_04:
- D 1 - I - 0x002C8F 00:AC7F: 40        .byte $40   ; 
- D 1 - I - 0x002C90 00:AC80: 40        .byte $40   ; 
- D 1 - I - 0x002C91 00:AC81: 40        .byte $40   ; 
- D 1 - I - 0x002C92 00:AC82: 40        .byte $40   ; 
- D 1 - I - 0x002C93 00:AC83: 40        .byte $40   ; 
- D 1 - I - 0x002C94 00:AC84: 40        .byte $40   ; 
- D 1 - I - 0x002C95 00:AC85: 40        .byte $40   ; 
- D 1 - I - 0x002C96 00:AC86: 40        .byte $40   ; 
- D 1 - I - 0x002C97 00:AC87: 40        .byte $40   ; 
- D 1 - I - 0x002C98 00:AC88: 40        .byte $40   ; 
- D 1 - I - 0x002C99 00:AC89: 40        .byte $40   ; 
- D 1 - I - 0x002C9A 00:AC8A: 40        .byte $40   ; 
- D 1 - I - 0x002C9B 00:AC8B: 40        .byte $40   ; 
- D 1 - I - 0x002C9C 00:AC8C: 40        .byte $40   ; 
- D 1 - I - 0x002C9D 00:AC8D: 40        .byte $40   ; 
- D 1 - I - 0x002C9E 00:AC8E: 40        .byte $40   ; 
- D 1 - I - 0x002C9F 00:AC8F: 40        .byte $40   ; 
- D 1 - I - 0x002CA0 00:AC90: 40        .byte $40   ; 
- D 1 - I - 0x002CA1 00:AC91: 40        .byte $40   ; 
- D 1 - I - 0x002CA2 00:AC92: 40        .byte $40   ; 
- D 1 - I - 0x002CA3 00:AC93: 40        .byte $40   ; 
- D 1 - I - 0x002CA4 00:AC94: 40        .byte $40   ; 
- D 1 - I - 0x002CA5 00:AC95: 40        .byte $40   ; 
- D 1 - I - 0x002CA6 00:AC96: 40        .byte $40   ; 
- D 1 - I - 0x002CA7 00:AC97: 40        .byte $40   ; 
- D 1 - I - 0x002CA8 00:AC98: 40        .byte $40   ; 
- D 1 - I - 0x002CA9 00:AC99: 40        .byte $40   ; 
- D 1 - I - 0x002CAA 00:AC9A: 40        .byte $40   ; 
- D 1 - I - 0x002CAB 00:AC9B: 40        .byte $40   ; 
- D 1 - I - 0x002CAC 00:AC9C: 40        .byte $40   ; 
- D 1 - I - 0x002CAD 00:AC9D: 40        .byte $40   ; 
- D 1 - I - 0x002CAE 00:AC9E: 40        .byte $40   ; 
- D 1 - I - 0x002CAF 00:AC9F: 40        .byte $40   ; 
- D 1 - I - 0x002CB0 00:ACA0: 40        .byte $40   ; 
- D 1 - I - 0x002CB1 00:ACA1: 40        .byte $40   ; 
- D 1 - I - 0x002CB2 00:ACA2: 40        .byte $40   ; 
- D 1 - I - 0x002CB3 00:ACA3: 40        .byte $40   ; 
- D 1 - I - 0x002CB4 00:ACA4: 40        .byte $40   ; 
- D 1 - I - 0x002CB5 00:ACA5: 40        .byte $40   ; 
- D 1 - I - 0x002CB6 00:ACA6: 40        .byte $40   ; 
- D 1 - I - 0x002CB7 00:ACA7: 40        .byte $40   ; 
- D 1 - I - 0x002CB8 00:ACA8: 40        .byte $40   ; 
- D 1 - I - 0x002CB9 00:ACA9: 41        .byte $41   ; 
- D 1 - I - 0x002CBA 00:ACAA: 42        .byte $42   ; 
- D 1 - I - 0x002CBB 00:ACAB: 43        .byte $43   ; 
- D 1 - I - 0x002CBC 00:ACAC: 44        .byte $44   ; 
- D 1 - I - 0x002CBD 00:ACAD: 40        .byte $40   ; 
- D 1 - I - 0x002CBE 00:ACAE: 40        .byte $40   ; 
- D 1 - I - 0x002CBF 00:ACAF: 40        .byte $40   ; 
- D 1 - I - 0x002CC0 00:ACB0: 40        .byte $40   ; 
- D 1 - I - 0x002CC1 00:ACB1: 45        .byte $45   ; 
- D 1 - I - 0x002CC2 00:ACB2: 46        .byte $46   ; 
- D 1 - I - 0x002CC3 00:ACB3: 47        .byte $47   ; 
- D 1 - I - 0x002CC4 00:ACB4: 48        .byte $48   ; 
- D 1 - I - 0x002CC5 00:ACB5: 40        .byte $40   ; 
- D 1 - I - 0x002CC6 00:ACB6: 40        .byte $40   ; 
- D 1 - I - 0x002CC7 00:ACB7: 40        .byte $40   ; 
- D 1 - I - 0x002CC8 00:ACB8: 40        .byte $40   ; 
- D 1 - I - 0x002CC9 00:ACB9: 49        .byte $49   ; 
- D 1 - I - 0x002CCA 00:ACBA: 4A        .byte $4A   ; 
- D 1 - I - 0x002CCB 00:ACBB: 4A        .byte $4A   ; 
- D 1 - I - 0x002CCC 00:ACBC: 4B        .byte $4B   ; 
- D 1 - I - 0x002CCD 00:ACBD: 40        .byte $40   ; 
- D 1 - I - 0x002CCE 00:ACBE: 40        .byte $40   ; 



_off018_01_ACBF_05:
- D 1 - I - 0x002CCF 00:ACBF: 5C        .byte $5C   ; 
- D 1 - I - 0x002CD0 00:ACC0: 54        .byte $54   ; 
- D 1 - I - 0x002CD1 00:ACC1: 55        .byte $55   ; 
- D 1 - I - 0x002CD2 00:ACC2: 40        .byte $40   ; 
- D 1 - I - 0x002CD3 00:ACC3: 40        .byte $40   ; 
- D 1 - I - 0x002CD4 00:ACC4: 56        .byte $56   ; 
- D 1 - I - 0x002CD5 00:ACC5: 57        .byte $57   ; 
- D 1 - I - 0x002CD6 00:ACC6: 51        .byte $51   ; 
- D 1 - I - 0x002CD7 00:ACC7: 5D        .byte $5D   ; 
- D 1 - I - 0x002CD8 00:ACC8: 58        .byte $58   ; 
- D 1 - I - 0x002CD9 00:ACC9: 59        .byte $59   ; 
- D 1 - I - 0x002CDA 00:ACCA: 40        .byte $40   ; 
- D 1 - I - 0x002CDB 00:ACCB: 40        .byte $40   ; 
- D 1 - I - 0x002CDC 00:ACCC: 5A        .byte $5A   ; 
- D 1 - I - 0x002CDD 00:ACCD: 5B        .byte $5B   ; 
- D 1 - I - 0x002CDE 00:ACCE: 52        .byte $52   ; 
- D 1 - I - 0x002CDF 00:ACCF: 4C        .byte $4C   ; 
- D 1 - I - 0x002CE0 00:ACD0: 4D        .byte $4D   ; 
- D 1 - I - 0x002CE1 00:ACD1: 4E        .byte $4E   ; 
- D 1 - I - 0x002CE2 00:ACD2: 4F        .byte $4F   ; 
- D 1 - I - 0x002CE3 00:ACD3: 40        .byte $40   ; 
- D 1 - I - 0x002CE4 00:ACD4: 5E        .byte $5E   ; 
- D 1 - I - 0x002CE5 00:ACD5: 5F        .byte $5F   ; 
- D 1 - I - 0x002CE6 00:ACD6: 4C        .byte $4C   ; 
- D 1 - I - 0x002CE7 00:ACD7: 64        .byte $64   ; 
- D 1 - I - 0x002CE8 00:ACD8: 64        .byte $64   ; 
- D 1 - I - 0x002CE9 00:ACD9: 64        .byte $64   ; 
- D 1 - I - 0x002CEA 00:ACDA: 64        .byte $64   ; 
- D 1 - I - 0x002CEB 00:ACDB: 4F        .byte $4F   ; 
- D 1 - I - 0x002CEC 00:ACDC: 63        .byte $63   ; 
- D 1 - I - 0x002CED 00:ACDD: 64        .byte $64   ; 
- D 1 - I - 0x002CEE 00:ACDE: 64        .byte $64   ; 
- D 1 - I - 0x002CEF 00:ACDF: 64        .byte $64   ; 
- D 1 - I - 0x002CF0 00:ACE0: 64        .byte $64   ; 
- D 1 - I - 0x002CF1 00:ACE1: 64        .byte $64   ; 
- D 1 - I - 0x002CF2 00:ACE2: 64        .byte $64   ; 
- D 1 - I - 0x002CF3 00:ACE3: 64        .byte $64   ; 
- D 1 - I - 0x002CF4 00:ACE4: 4F        .byte $4F   ; 
- D 1 - I - 0x002CF5 00:ACE5: 63        .byte $63   ; 
- D 1 - I - 0x002CF6 00:ACE6: 64        .byte $64   ; 
- D 1 - I - 0x002CF7 00:ACE7: 41        .byte $41   ; 
- D 1 - I - 0x002CF8 00:ACE8: 42        .byte $42   ; 
- D 1 - I - 0x002CF9 00:ACE9: 43        .byte $43   ; 
- D 1 - I - 0x002CFA 00:ACEA: 44        .byte $44   ; 
- D 1 - I - 0x002CFB 00:ACEB: 41        .byte $41   ; 
- D 1 - I - 0x002CFC 00:ACEC: 42        .byte $42   ; 
- D 1 - I - 0x002CFD 00:ACED: 43        .byte $43   ; 
- D 1 - I - 0x002CFE 00:ACEE: 44        .byte $44   ; 
- D 1 - I - 0x002CFF 00:ACEF: 45        .byte $45   ; 
- D 1 - I - 0x002D00 00:ACF0: 46        .byte $46   ; 
- D 1 - I - 0x002D01 00:ACF1: 47        .byte $47   ; 
- D 1 - I - 0x002D02 00:ACF2: 48        .byte $48   ; 
- D 1 - I - 0x002D03 00:ACF3: 45        .byte $45   ; 
- D 1 - I - 0x002D04 00:ACF4: 46        .byte $46   ; 
- D 1 - I - 0x002D05 00:ACF5: 47        .byte $47   ; 
- D 1 - I - 0x002D06 00:ACF6: 48        .byte $48   ; 
- D 1 - I - 0x002D07 00:ACF7: 49        .byte $49   ; 
- D 1 - I - 0x002D08 00:ACF8: 4A        .byte $4A   ; 
- D 1 - I - 0x002D09 00:ACF9: 4A        .byte $4A   ; 
- D 1 - I - 0x002D0A 00:ACFA: 4B        .byte $4B   ; 
- D 1 - I - 0x002D0B 00:ACFB: 49        .byte $49   ; 
- D 1 - I - 0x002D0C 00:ACFC: 4A        .byte $4A   ; 
- D 1 - I - 0x002D0D 00:ACFD: 4A        .byte $4A   ; 
- D 1 - I - 0x002D0E 00:ACFE: 4B        .byte $4B   ; 



_off018_01_ACFF_06:
- D 1 - I - 0x002D0F 00:ACFF: 40        .byte $40   ; 
- D 1 - I - 0x002D10 00:AD00: 40        .byte $40   ; 
- D 1 - I - 0x002D11 00:AD01: 40        .byte $40   ; 
- D 1 - I - 0x002D12 00:AD02: 40        .byte $40   ; 
- D 1 - I - 0x002D13 00:AD03: 40        .byte $40   ; 
- D 1 - I - 0x002D14 00:AD04: 40        .byte $40   ; 
- D 1 - I - 0x002D15 00:AD05: 40        .byte $40   ; 
- D 1 - I - 0x002D16 00:AD06: 40        .byte $40   ; 
- D 1 - I - 0x002D17 00:AD07: 40        .byte $40   ; 
- D 1 - I - 0x002D18 00:AD08: 40        .byte $40   ; 
- D 1 - I - 0x002D19 00:AD09: 40        .byte $40   ; 
- D 1 - I - 0x002D1A 00:AD0A: 40        .byte $40   ; 
- D 1 - I - 0x002D1B 00:AD0B: 40        .byte $40   ; 
- D 1 - I - 0x002D1C 00:AD0C: 40        .byte $40   ; 
- D 1 - I - 0x002D1D 00:AD0D: 40        .byte $40   ; 
- D 1 - I - 0x002D1E 00:AD0E: 40        .byte $40   ; 
- D 1 - I - 0x002D1F 00:AD0F: 40        .byte $40   ; 
- D 1 - I - 0x002D20 00:AD10: 40        .byte $40   ; 
- D 1 - I - 0x002D21 00:AD11: 40        .byte $40   ; 
- D 1 - I - 0x002D22 00:AD12: 40        .byte $40   ; 
- D 1 - I - 0x002D23 00:AD13: 40        .byte $40   ; 
- D 1 - I - 0x002D24 00:AD14: 40        .byte $40   ; 
- D 1 - I - 0x002D25 00:AD15: 40        .byte $40   ; 
- D 1 - I - 0x002D26 00:AD16: 40        .byte $40   ; 
- D 1 - I - 0x002D27 00:AD17: 40        .byte $40   ; 
- D 1 - I - 0x002D28 00:AD18: 40        .byte $40   ; 
- D 1 - I - 0x002D29 00:AD19: 40        .byte $40   ; 
- D 1 - I - 0x002D2A 00:AD1A: 40        .byte $40   ; 
- D 1 - I - 0x002D2B 00:AD1B: 40        .byte $40   ; 
- D 1 - I - 0x002D2C 00:AD1C: 40        .byte $40   ; 
- D 1 - I - 0x002D2D 00:AD1D: 40        .byte $40   ; 
- D 1 - I - 0x002D2E 00:AD1E: 40        .byte $40   ; 
- D 1 - I - 0x002D2F 00:AD1F: 40        .byte $40   ; 
- D 1 - I - 0x002D30 00:AD20: 40        .byte $40   ; 
- D 1 - I - 0x002D31 00:AD21: 40        .byte $40   ; 
- D 1 - I - 0x002D32 00:AD22: 40        .byte $40   ; 
- D 1 - I - 0x002D33 00:AD23: 40        .byte $40   ; 
- D 1 - I - 0x002D34 00:AD24: 40        .byte $40   ; 
- D 1 - I - 0x002D35 00:AD25: 40        .byte $40   ; 
- D 1 - I - 0x002D36 00:AD26: 40        .byte $40   ; 
- D 1 - I - 0x002D37 00:AD27: 40        .byte $40   ; 
- D 1 - I - 0x002D38 00:AD28: 40        .byte $40   ; 
- D 1 - I - 0x002D39 00:AD29: 40        .byte $40   ; 
- D 1 - I - 0x002D3A 00:AD2A: 40        .byte $40   ; 
- D 1 - I - 0x002D3B 00:AD2B: 40        .byte $40   ; 
- D 1 - I - 0x002D3C 00:AD2C: 40        .byte $40   ; 
- D 1 - I - 0x002D3D 00:AD2D: 40        .byte $40   ; 
- D 1 - I - 0x002D3E 00:AD2E: 40        .byte $40   ; 
- D 1 - I - 0x002D3F 00:AD2F: 61        .byte $61   ; 
- D 1 - I - 0x002D40 00:AD30: 60        .byte $60   ; 
- D 1 - I - 0x002D41 00:AD31: 40        .byte $40   ; 
- D 1 - I - 0x002D42 00:AD32: 40        .byte $40   ; 
- D 1 - I - 0x002D43 00:AD33: 40        .byte $40   ; 
- D 1 - I - 0x002D44 00:AD34: 40        .byte $40   ; 
- D 1 - I - 0x002D45 00:AD35: 62        .byte $62   ; 
- D 1 - I - 0x002D46 00:AD36: 61        .byte $61   ; 
- D 1 - I - 0x002D47 00:AD37: 6F        .byte $6F   ; 
- D 1 - I - 0x002D48 00:AD38: 50        .byte $50   ; 
- D 1 - I - 0x002D49 00:AD39: 40        .byte $40   ; 
- D 1 - I - 0x002D4A 00:AD3A: 40        .byte $40   ; 
- D 1 - I - 0x002D4B 00:AD3B: 40        .byte $40   ; 
- D 1 - I - 0x002D4C 00:AD3C: 40        .byte $40   ; 
- D 1 - I - 0x002D4D 00:AD3D: 53        .byte $53   ; 
- D 1 - I - 0x002D4E 00:AD3E: 6F        .byte $6F   ; 



_off018_01_AD3F_07:
- D 1 - I - 0x002D4F 00:AD3F: 40        .byte $40   ; 
- D 1 - I - 0x002D50 00:AD40: 40        .byte $40   ; 
- D 1 - I - 0x002D51 00:AD41: 90        .byte $90   ; 
- D 1 - I - 0x002D52 00:AD42: 91        .byte $91   ; 
- D 1 - I - 0x002D53 00:AD43: 6B        .byte $6B   ; 
- D 1 - I - 0x002D54 00:AD44: 6F        .byte $6F   ; 
- D 1 - I - 0x002D55 00:AD45: 6F        .byte $6F   ; 
- D 1 - I - 0x002D56 00:AD46: 6F        .byte $6F   ; 
- D 1 - I - 0x002D57 00:AD47: 40        .byte $40   ; 
- D 1 - I - 0x002D58 00:AD48: 40        .byte $40   ; 
- D 1 - I - 0x002D59 00:AD49: 94        .byte $94   ; 
- D 1 - I - 0x002D5A 00:AD4A: 95        .byte $95   ; 
- D 1 - I - 0x002D5B 00:AD4B: 78        .byte $78   ; 
- D 1 - I - 0x002D5C 00:AD4C: 79        .byte $79   ; 
- D 1 - I - 0x002D5D 00:AD4D: 80        .byte $80   ; 
- D 1 - I - 0x002D5E 00:AD4E: 79        .byte $79   ; 
- D 1 - I - 0x002D5F 00:AD4F: 40        .byte $40   ; 
- D 1 - I - 0x002D60 00:AD50: 40        .byte $40   ; 
- D 1 - I - 0x002D61 00:AD51: 40        .byte $40   ; 
- D 1 - I - 0x002D62 00:AD52: 40        .byte $40   ; 
- D 1 - I - 0x002D63 00:AD53: 7C        .byte $7C   ; 
- D 1 - I - 0x002D64 00:AD54: 7D        .byte $7D   ; 
- D 1 - I - 0x002D65 00:AD55: 81        .byte $81   ; 
- D 1 - I - 0x002D66 00:AD56: 82        .byte $82   ; 
- D 1 - I - 0x002D67 00:AD57: 40        .byte $40   ; 
- D 1 - I - 0x002D68 00:AD58: 40        .byte $40   ; 
- D 1 - I - 0x002D69 00:AD59: 40        .byte $40   ; 
- D 1 - I - 0x002D6A 00:AD5A: 40        .byte $40   ; 
- D 1 - I - 0x002D6B 00:AD5B: 7E        .byte $7E   ; 
- D 1 - I - 0x002D6C 00:AD5C: 7F        .byte $7F   ; 
- D 1 - I - 0x002D6D 00:AD5D: 4C        .byte $4C   ; 
- D 1 - I - 0x002D6E 00:AD5E: 5F        .byte $5F   ; 
- D 1 - I - 0x002D6F 00:AD5F: 90        .byte $90   ; 
- D 1 - I - 0x002D70 00:AD60: 91        .byte $91   ; 
- D 1 - I - 0x002D71 00:AD61: 40        .byte $40   ; 
- D 1 - I - 0x002D72 00:AD62: 40        .byte $40   ; 
- D 1 - I - 0x002D73 00:AD63: 63        .byte $63   ; 
- D 1 - I - 0x002D74 00:AD64: 64        .byte $64   ; 
- D 1 - I - 0x002D75 00:AD65: 64        .byte $64   ; 
- D 1 - I - 0x002D76 00:AD66: 64        .byte $64   ; 
- D 1 - I - 0x002D77 00:AD67: 94        .byte $94   ; 
- D 1 - I - 0x002D78 00:AD68: 95        .byte $95   ; 
- D 1 - I - 0x002D79 00:AD69: 40        .byte $40   ; 
- D 1 - I - 0x002D7A 00:AD6A: 40        .byte $40   ; 
- D 1 - I - 0x002D7B 00:AD6B: 40        .byte $40   ; 
- D 1 - I - 0x002D7C 00:AD6C: 63        .byte $63   ; 
- D 1 - I - 0x002D7D 00:AD6D: 64        .byte $64   ; 
- D 1 - I - 0x002D7E 00:AD6E: 64        .byte $64   ; 
- D 1 - I - 0x002D7F 00:AD6F: 40        .byte $40   ; 
- D 1 - I - 0x002D80 00:AD70: 40        .byte $40   ; 
- D 1 - I - 0x002D81 00:AD71: 40        .byte $40   ; 
- D 1 - I - 0x002D82 00:AD72: 40        .byte $40   ; 
- D 1 - I - 0x002D83 00:AD73: 40        .byte $40   ; 
- D 1 - I - 0x002D84 00:AD74: 40        .byte $40   ; 
- D 1 - I - 0x002D85 00:AD75: 63        .byte $63   ; 
- D 1 - I - 0x002D86 00:AD76: 64        .byte $64   ; 
- D 1 - I - 0x002D87 00:AD77: 40        .byte $40   ; 
- D 1 - I - 0x002D88 00:AD78: 40        .byte $40   ; 
- D 1 - I - 0x002D89 00:AD79: 40        .byte $40   ; 
- D 1 - I - 0x002D8A 00:AD7A: 40        .byte $40   ; 
- D 1 - I - 0x002D8B 00:AD7B: 40        .byte $40   ; 
- D 1 - I - 0x002D8C 00:AD7C: 40        .byte $40   ; 
- D 1 - I - 0x002D8D 00:AD7D: 40        .byte $40   ; 
- D 1 - I - 0x002D8E 00:AD7E: 40        .byte $40   ; 



_off018_01_AD7F_08:
- D 1 - I - 0x002D8F 00:AD7F: 5C        .byte $5C   ; 
- D 1 - I - 0x002D90 00:AD80: 54        .byte $54   ; 
- D 1 - I - 0x002D91 00:AD81: 55        .byte $55   ; 
- D 1 - I - 0x002D92 00:AD82: 40        .byte $40   ; 
- D 1 - I - 0x002D93 00:AD83: 40        .byte $40   ; 
- D 1 - I - 0x002D94 00:AD84: 56        .byte $56   ; 
- D 1 - I - 0x002D95 00:AD85: 57        .byte $57   ; 
- D 1 - I - 0x002D96 00:AD86: 51        .byte $51   ; 
- D 1 - I - 0x002D97 00:AD87: 5D        .byte $5D   ; 
- D 1 - I - 0x002D98 00:AD88: 58        .byte $58   ; 
- D 1 - I - 0x002D99 00:AD89: 59        .byte $59   ; 
- D 1 - I - 0x002D9A 00:AD8A: 40        .byte $40   ; 
- D 1 - I - 0x002D9B 00:AD8B: 40        .byte $40   ; 
- D 1 - I - 0x002D9C 00:AD8C: 5A        .byte $5A   ; 
- D 1 - I - 0x002D9D 00:AD8D: 5B        .byte $5B   ; 
- D 1 - I - 0x002D9E 00:AD8E: 52        .byte $52   ; 
- D 1 - I - 0x002D9F 00:AD8F: 4C        .byte $4C   ; 
- D 1 - I - 0x002DA0 00:AD90: 4D        .byte $4D   ; 
- D 1 - I - 0x002DA1 00:AD91: 4E        .byte $4E   ; 
- D 1 - I - 0x002DA2 00:AD92: 4F        .byte $4F   ; 
- D 1 - I - 0x002DA3 00:AD93: 40        .byte $40   ; 
- D 1 - I - 0x002DA4 00:AD94: 5E        .byte $5E   ; 
- D 1 - I - 0x002DA5 00:AD95: 5F        .byte $5F   ; 
- D 1 - I - 0x002DA6 00:AD96: 4C        .byte $4C   ; 
- D 1 - I - 0x002DA7 00:AD97: 64        .byte $64   ; 
- D 1 - I - 0x002DA8 00:AD98: 64        .byte $64   ; 
- D 1 - I - 0x002DA9 00:AD99: 64        .byte $64   ; 
- D 1 - I - 0x002DAA 00:AD9A: 64        .byte $64   ; 
- D 1 - I - 0x002DAB 00:AD9B: 4F        .byte $4F   ; 
- D 1 - I - 0x002DAC 00:AD9C: 63        .byte $63   ; 
- D 1 - I - 0x002DAD 00:AD9D: 64        .byte $64   ; 
- D 1 - I - 0x002DAE 00:AD9E: 64        .byte $64   ; 
- D 1 - I - 0x002DAF 00:AD9F: 64        .byte $64   ; 
- D 1 - I - 0x002DB0 00:ADA0: 64        .byte $64   ; 
- D 1 - I - 0x002DB1 00:ADA1: 64        .byte $64   ; 
- D 1 - I - 0x002DB2 00:ADA2: 64        .byte $64   ; 
- D 1 - I - 0x002DB3 00:ADA3: 64        .byte $64   ; 
- D 1 - I - 0x002DB4 00:ADA4: 4F        .byte $4F   ; 
- D 1 - I - 0x002DB5 00:ADA5: 63        .byte $63   ; 
- D 1 - I - 0x002DB6 00:ADA6: 64        .byte $64   ; 
- D 1 - I - 0x002DB7 00:ADA7: 40        .byte $40   ; 
- D 1 - I - 0x002DB8 00:ADA8: 40        .byte $40   ; 
- D 1 - I - 0x002DB9 00:ADA9: 40        .byte $40   ; 
- D 1 - I - 0x002DBA 00:ADAA: 40        .byte $40   ; 
- D 1 - I - 0x002DBB 00:ADAB: 70        .byte $70   ; 
- D 1 - I - 0x002DBC 00:ADAC: 71        .byte $71   ; 
- D 1 - I - 0x002DBD 00:ADAD: 71        .byte $71   ; 
- D 1 - I - 0x002DBE 00:ADAE: 71        .byte $71   ; 
- D 1 - I - 0x002DBF 00:ADAF: 40        .byte $40   ; 
- D 1 - I - 0x002DC0 00:ADB0: 40        .byte $40   ; 
- D 1 - I - 0x002DC1 00:ADB1: 40        .byte $40   ; 
- D 1 - I - 0x002DC2 00:ADB2: 40        .byte $40   ; 
- D 1 - I - 0x002DC3 00:ADB3: 6E        .byte $6E   ; 
- D 1 - I - 0x002DC4 00:ADB4: 6F        .byte $6F   ; 
- D 1 - I - 0x002DC5 00:ADB5: 6F        .byte $6F   ; 
- D 1 - I - 0x002DC6 00:ADB6: 6F        .byte $6F   ; 
- D 1 - I - 0x002DC7 00:ADB7: 40        .byte $40   ; 
- D 1 - I - 0x002DC8 00:ADB8: 40        .byte $40   ; 
- D 1 - I - 0x002DC9 00:ADB9: 40        .byte $40   ; 
- D 1 - I - 0x002DCA 00:ADBA: 40        .byte $40   ; 
- D 1 - I - 0x002DCB 00:ADBB: 70        .byte $70   ; 
- D 1 - I - 0x002DCC 00:ADBC: 71        .byte $71   ; 
- D 1 - I - 0x002DCD 00:ADBD: 71        .byte $71   ; 
- D 1 - I - 0x002DCE 00:ADBE: 71        .byte $71   ; 



_off018_01_ADBF_09:
- D 1 - I - 0x002DCF 00:ADBF: A4        .byte $A4   ; 
- D 1 - I - 0x002DD0 00:ADC0: A4        .byte $A4   ; 
- D 1 - I - 0x002DD1 00:ADC1: 72        .byte $72   ; 
- D 1 - I - 0x002DD2 00:ADC2: C7        .byte $C7   ; 
- D 1 - I - 0x002DD3 00:ADC3: C7        .byte $C7   ; 
- D 1 - I - 0x002DD4 00:ADC4: 73        .byte $73   ; 
- D 1 - I - 0x002DD5 00:ADC5: A4        .byte $A4   ; 
- D 1 - I - 0x002DD6 00:ADC6: A4        .byte $A4   ; 
- D 1 - I - 0x002DD7 00:ADC7: A4        .byte $A4   ; 
- D 1 - I - 0x002DD8 00:ADC8: A4        .byte $A4   ; 
- D 1 - I - 0x002DD9 00:ADC9: A4        .byte $A4   ; 
- D 1 - I - 0x002DDA 00:ADCA: 72        .byte $72   ; 
- D 1 - I - 0x002DDB 00:ADCB: 73        .byte $73   ; 
- D 1 - I - 0x002DDC 00:ADCC: A4        .byte $A4   ; 
- D 1 - I - 0x002DDD 00:ADCD: A4        .byte $A4   ; 
- D 1 - I - 0x002DDE 00:ADCE: A4        .byte $A4   ; 
- D 1 - I - 0x002DDF 00:ADCF: A4        .byte $A4   ; 
- D 1 - I - 0x002DE0 00:ADD0: A4        .byte $A4   ; 
- D 1 - I - 0x002DE1 00:ADD1: A4        .byte $A4   ; 
- D 1 - I - 0x002DE2 00:ADD2: 72        .byte $72   ; 
- D 1 - I - 0x002DE3 00:ADD3: 73        .byte $73   ; 
- D 1 - I - 0x002DE4 00:ADD4: A4        .byte $A4   ; 
- D 1 - I - 0x002DE5 00:ADD5: A4        .byte $A4   ; 
- D 1 - I - 0x002DE6 00:ADD6: A4        .byte $A4   ; 
- D 1 - I - 0x002DE7 00:ADD7: A4        .byte $A4   ; 
- D 1 - I - 0x002DE8 00:ADD8: A4        .byte $A4   ; 
- D 1 - I - 0x002DE9 00:ADD9: A4        .byte $A4   ; 
- D 1 - I - 0x002DEA 00:ADDA: 72        .byte $72   ; 
- D 1 - I - 0x002DEB 00:ADDB: 73        .byte $73   ; 
- D 1 - I - 0x002DEC 00:ADDC: A4        .byte $A4   ; 
- D 1 - I - 0x002DED 00:ADDD: A4        .byte $A4   ; 
- D 1 - I - 0x002DEE 00:ADDE: A4        .byte $A4   ; 
- D 1 - I - 0x002DEF 00:ADDF: A4        .byte $A4   ; 
- D 1 - I - 0x002DF0 00:ADE0: A4        .byte $A4   ; 
- D 1 - I - 0x002DF1 00:ADE1: A4        .byte $A4   ; 
- D 1 - I - 0x002DF2 00:ADE2: 72        .byte $72   ; 
- D 1 - I - 0x002DF3 00:ADE3: 73        .byte $73   ; 
- D 1 - I - 0x002DF4 00:ADE4: A4        .byte $A4   ; 
- D 1 - I - 0x002DF5 00:ADE5: A4        .byte $A4   ; 
- D 1 - I - 0x002DF6 00:ADE6: A4        .byte $A4   ; 
- D 1 - I - 0x002DF7 00:ADE7: 40        .byte $40   ; 
- D 1 - I - 0x002DF8 00:ADE8: 40        .byte $40   ; 
- D 1 - I - 0x002DF9 00:ADE9: 40        .byte $40   ; 
- D 1 - I - 0x002DFA 00:ADEA: 40        .byte $40   ; 
- D 1 - I - 0x002DFB 00:ADEB: 40        .byte $40   ; 
- D 1 - I - 0x002DFC 00:ADEC: 40        .byte $40   ; 
- D 1 - I - 0x002DFD 00:ADED: 40        .byte $40   ; 
- D 1 - I - 0x002DFE 00:ADEE: 40        .byte $40   ; 
- D 1 - I - 0x002DFF 00:ADEF: 61        .byte $61   ; 
- D 1 - I - 0x002E00 00:ADF0: 60        .byte $60   ; 
- D 1 - I - 0x002E01 00:ADF1: 40        .byte $40   ; 
- D 1 - I - 0x002E02 00:ADF2: 40        .byte $40   ; 
- D 1 - I - 0x002E03 00:ADF3: 40        .byte $40   ; 
- D 1 - I - 0x002E04 00:ADF4: 40        .byte $40   ; 
- D 1 - I - 0x002E05 00:ADF5: 62        .byte $62   ; 
- D 1 - I - 0x002E06 00:ADF6: 61        .byte $61   ; 
- D 1 - I - 0x002E07 00:ADF7: 6F        .byte $6F   ; 
- D 1 - I - 0x002E08 00:ADF8: 50        .byte $50   ; 
- D 1 - I - 0x002E09 00:ADF9: 40        .byte $40   ; 
- D 1 - I - 0x002E0A 00:ADFA: 40        .byte $40   ; 
- D 1 - I - 0x002E0B 00:ADFB: 40        .byte $40   ; 
- D 1 - I - 0x002E0C 00:ADFC: 40        .byte $40   ; 
- D 1 - I - 0x002E0D 00:ADFD: 53        .byte $53   ; 
- D 1 - I - 0x002E0E 00:ADFE: 6F        .byte $6F   ; 



_off018_01_ADFF_0A:
- D 1 - I - 0x002E0F 00:ADFF: 90        .byte $90   ; 
- D 1 - I - 0x002E10 00:AE00: 91        .byte $91   ; 
- D 1 - I - 0x002E11 00:AE01: 40        .byte $40   ; 
- D 1 - I - 0x002E12 00:AE02: 40        .byte $40   ; 
- D 1 - I - 0x002E13 00:AE03: 40        .byte $40   ; 
- D 1 - I - 0x002E14 00:AE04: 40        .byte $40   ; 
- D 1 - I - 0x002E15 00:AE05: 90        .byte $90   ; 
- D 1 - I - 0x002E16 00:AE06: 91        .byte $91   ; 
- D 1 - I - 0x002E17 00:AE07: 94        .byte $94   ; 
- D 1 - I - 0x002E18 00:AE08: 95        .byte $95   ; 
- D 1 - I - 0x002E19 00:AE09: 40        .byte $40   ; 
- D 1 - I - 0x002E1A 00:AE0A: 84        .byte $84   ; 
- D 1 - I - 0x002E1B 00:AE0B: 85        .byte $85   ; 
- D 1 - I - 0x002E1C 00:AE0C: 40        .byte $40   ; 
- D 1 - I - 0x002E1D 00:AE0D: 94        .byte $94   ; 
- D 1 - I - 0x002E1E 00:AE0E: 95        .byte $95   ; 
- D 1 - I - 0x002E1F 00:AE0F: 76        .byte $76   ; 
- D 1 - I - 0x002E20 00:AE10: 76        .byte $76   ; 
- D 1 - I - 0x002E21 00:AE11: 76        .byte $76   ; 
- D 1 - I - 0x002E22 00:AE12: 74        .byte $74   ; 
- D 1 - I - 0x002E23 00:AE13: 75        .byte $75   ; 
- D 1 - I - 0x002E24 00:AE14: 83        .byte $83   ; 
- D 1 - I - 0x002E25 00:AE15: 77        .byte $77   ; 
- D 1 - I - 0x002E26 00:AE16: 77        .byte $77   ; 
- D 1 - I - 0x002E27 00:AE17: 7A        .byte $7A   ; 
- D 1 - I - 0x002E28 00:AE18: 7A        .byte $7A   ; 
- D 1 - I - 0x002E29 00:AE19: 7A        .byte $7A   ; 
- D 1 - I - 0x002E2A 00:AE1A: 74        .byte $74   ; 
- D 1 - I - 0x002E2B 00:AE1B: 75        .byte $75   ; 
- D 1 - I - 0x002E2C 00:AE1C: AB        .byte $AB   ; 
- D 1 - I - 0x002E2D 00:AE1D: 7B        .byte $7B   ; 
- D 1 - I - 0x002E2E 00:AE1E: 7B        .byte $7B   ; 
- D 1 - I - 0x002E2F 00:AE1F: A4        .byte $A4   ; 
- D 1 - I - 0x002E30 00:AE20: A4        .byte $A4   ; 
- D 1 - I - 0x002E31 00:AE21: A4        .byte $A4   ; 
- D 1 - I - 0x002E32 00:AE22: 74        .byte $74   ; 
- D 1 - I - 0x002E33 00:AE23: 75        .byte $75   ; 
- D 1 - I - 0x002E34 00:AE24: A4        .byte $A4   ; 
- D 1 - I - 0x002E35 00:AE25: A4        .byte $A4   ; 
- D 1 - I - 0x002E36 00:AE26: A4        .byte $A4   ; 
- D 1 - I - 0x002E37 00:AE27: A4        .byte $A4   ; 
- D 1 - I - 0x002E38 00:AE28: A4        .byte $A4   ; 
- D 1 - I - 0x002E39 00:AE29: 9C        .byte $9C   ; 
- D 1 - I - 0x002E3A 00:AE2A: 9D        .byte $9D   ; 
- D 1 - I - 0x002E3B 00:AE2B: 9E        .byte $9E   ; 
- D 1 - I - 0x002E3C 00:AE2C: 9F        .byte $9F   ; 
- D 1 - I - 0x002E3D 00:AE2D: A4        .byte $A4   ; 
- D 1 - I - 0x002E3E 00:AE2E: A4        .byte $A4   ; 
- D 1 - I - 0x002E3F 00:AE2F: A4        .byte $A4   ; 
- D 1 - I - 0x002E40 00:AE30: A4        .byte $A4   ; 
- D 1 - I - 0x002E41 00:AE31: 99        .byte $99   ; 
- D 1 - I - 0x002E42 00:AE32: 9B        .byte $9B   ; 
- D 1 - I - 0x002E43 00:AE33: 9B        .byte $9B   ; 
- D 1 - I - 0x002E44 00:AE34: 9A        .byte $9A   ; 
- D 1 - I - 0x002E45 00:AE35: A4        .byte $A4   ; 
- D 1 - I - 0x002E46 00:AE36: A4        .byte $A4   ; 
- D 1 - I - 0x002E47 00:AE37: A4        .byte $A4   ; 
- D 1 - I - 0x002E48 00:AE38: A4        .byte $A4   ; 
- D 1 - I - 0x002E49 00:AE39: 99        .byte $99   ; 
- D 1 - I - 0x002E4A 00:AE3A: 9B        .byte $9B   ; 
- D 1 - I - 0x002E4B 00:AE3B: 9B        .byte $9B   ; 
- D 1 - I - 0x002E4C 00:AE3C: 75        .byte $75   ; 
- D 1 - I - 0x002E4D 00:AE3D: A4        .byte $A4   ; 
- D 1 - I - 0x002E4E 00:AE3E: A4        .byte $A4   ; 



_off018_01_AE3F_0B:
- D 1 - I - 0x002E4F 00:AE3F: 86        .byte $86   ; 
- D 1 - I - 0x002E50 00:AE40: 87        .byte $87   ; 
- D 1 - I - 0x002E51 00:AE41: 88        .byte $88   ; 
- D 1 - I - 0x002E52 00:AE42: 89        .byte $89   ; 
- D 1 - I - 0x002E53 00:AE43: AC        .byte $AC   ; 
- D 1 - I - 0x002E54 00:AE44: AD        .byte $AD   ; 
- D 1 - I - 0x002E55 00:AE45: AE        .byte $AE   ; 
- D 1 - I - 0x002E56 00:AE46: 86        .byte $86   ; 
- D 1 - I - 0x002E57 00:AE47: 8A        .byte $8A   ; 
- D 1 - I - 0x002E58 00:AE48: 8B        .byte $8B   ; 
- D 1 - I - 0x002E59 00:AE49: 8C        .byte $8C   ; 
- D 1 - I - 0x002E5A 00:AE4A: 8D        .byte $8D   ; 
- D 1 - I - 0x002E5B 00:AE4B: AF        .byte $AF   ; 
- D 1 - I - 0x002E5C 00:AE4C: B0        .byte $B0   ; 
- D 1 - I - 0x002E5D 00:AE4D: B1        .byte $B1   ; 
- D 1 - I - 0x002E5E 00:AE4E: B2        .byte $B2   ; 
- D 1 - I - 0x002E5F 00:AE4F: 8E        .byte $8E   ; 
- D 1 - I - 0x002E60 00:AE50: 8F        .byte $8F   ; 
- D 1 - I - 0x002E61 00:AE51: A0        .byte $A0   ; 
- D 1 - I - 0x002E62 00:AE52: C1        .byte $C1   ; 
- D 1 - I - 0x002E63 00:AE53: C2        .byte $C2   ; 
- D 1 - I - 0x002E64 00:AE54: B3        .byte $B3   ; 
- D 1 - I - 0x002E65 00:AE55: B4        .byte $B4   ; 
- D 1 - I - 0x002E66 00:AE56: B5        .byte $B5   ; 
- D 1 - I - 0x002E67 00:AE57: 8E        .byte $8E   ; 
- D 1 - I - 0x002E68 00:AE58: A1        .byte $A1   ; 
- D 1 - I - 0x002E69 00:AE59: A2        .byte $A2   ; 
- D 1 - I - 0x002E6A 00:AE5A: 64        .byte $64   ; 
- D 1 - I - 0x002E6B 00:AE5B: 64        .byte $64   ; 
- D 1 - I - 0x002E6C 00:AE5C: B6        .byte $B6   ; 
- D 1 - I - 0x002E6D 00:AE5D: B7        .byte $B7   ; 
- D 1 - I - 0x002E6E 00:AE5E: AE        .byte $AE   ; 
- D 1 - I - 0x002E6F 00:AE5F: A3        .byte $A3   ; 
- D 1 - I - 0x002E70 00:AE60: A1        .byte $A1   ; 
- D 1 - I - 0x002E71 00:AE61: A2        .byte $A2   ; 
- D 1 - I - 0x002E72 00:AE62: 64        .byte $64   ; 
- D 1 - I - 0x002E73 00:AE63: 40        .byte $40   ; 
- D 1 - I - 0x002E74 00:AE64: B8        .byte $B8   ; 
- D 1 - I - 0x002E75 00:AE65: B9        .byte $B9   ; 
- D 1 - I - 0x002E76 00:AE66: BA        .byte $BA   ; 
- D 1 - I - 0x002E77 00:AE67: A5        .byte $A5   ; 
- D 1 - I - 0x002E78 00:AE68: A6        .byte $A6   ; 
- D 1 - I - 0x002E79 00:AE69: A2        .byte $A2   ; 
- D 1 - I - 0x002E7A 00:AE6A: 64        .byte $64   ; 
- D 1 - I - 0x002E7B 00:AE6B: 40        .byte $40   ; 
- D 1 - I - 0x002E7C 00:AE6C: B8        .byte $B8   ; 
- D 1 - I - 0x002E7D 00:AE6D: BB        .byte $BB   ; 
- D 1 - I - 0x002E7E 00:AE6E: BC        .byte $BC   ; 
- D 1 - I - 0x002E7F 00:AE6F: A7        .byte $A7   ; 
- D 1 - I - 0x002E80 00:AE70: A7        .byte $A7   ; 
- D 1 - I - 0x002E81 00:AE71: A8        .byte $A8   ; 
- D 1 - I - 0x002E82 00:AE72: 64        .byte $64   ; 
- D 1 - I - 0x002E83 00:AE73: 40        .byte $40   ; 
- D 1 - I - 0x002E84 00:AE74: BD        .byte $BD   ; 
- D 1 - I - 0x002E85 00:AE75: BE        .byte $BE   ; 
- D 1 - I - 0x002E86 00:AE76: BF        .byte $BF   ; 
- D 1 - I - 0x002E87 00:AE77: A9        .byte $A9   ; 
- D 1 - I - 0x002E88 00:AE78: A9        .byte $A9   ; 
- D 1 - I - 0x002E89 00:AE79: AA        .byte $AA   ; 
- D 1 - I - 0x002E8A 00:AE7A: 64        .byte $64   ; 
- D 1 - I - 0x002E8B 00:AE7B: 40        .byte $40   ; 
- D 1 - I - 0x002E8C 00:AE7C: C0        .byte $C0   ; 
- D 1 - I - 0x002E8D 00:AE7D: A9        .byte $A9   ; 
- D 1 - I - 0x002E8E 00:AE7E: A9        .byte $A9   ; 



_off018_01_AE7F_0C:
- D 1 - I - 0x002E8F 00:AE7F: D2        .byte $D2   ; 
- D 1 - I - 0x002E90 00:AE80: D2        .byte $D2   ; 
- D 1 - I - 0x002E91 00:AE81: D3        .byte $D3   ; 
- D 1 - I - 0x002E92 00:AE82: 40        .byte $40   ; 
- D 1 - I - 0x002E93 00:AE83: 40        .byte $40   ; 
- D 1 - I - 0x002E94 00:AE84: D1        .byte $D1   ; 
- D 1 - I - 0x002E95 00:AE85: D2        .byte $D2   ; 
- D 1 - I - 0x002E96 00:AE86: D2        .byte $D2   ; 
- D 1 - I - 0x002E97 00:AE87: D0        .byte $D0   ; 
- D 1 - I - 0x002E98 00:AE88: D0        .byte $D0   ; 
- D 1 - I - 0x002E99 00:AE89: F0        .byte $F0   ; 
- D 1 - I - 0x002E9A 00:AE8A: E2        .byte $E2   ; 
- D 1 - I - 0x002E9B 00:AE8B: E3        .byte $E3   ; 
- D 1 - I - 0x002E9C 00:AE8C: F1        .byte $F1   ; 
- D 1 - I - 0x002E9D 00:AE8D: D0        .byte $D0   ; 
- D 1 - I - 0x002E9E 00:AE8E: D0        .byte $D0   ; 
- D 1 - I - 0x002E9F 00:AE8F: D0        .byte $D0   ; 
- D 1 - I - 0x002EA0 00:AE90: D0        .byte $D0   ; 
- D 1 - I - 0x002EA1 00:AE91: E4        .byte $E4   ; 
- D 1 - I - 0x002EA2 00:AE92: E5        .byte $E5   ; 
- D 1 - I - 0x002EA3 00:AE93: E6        .byte $E6   ; 
- D 1 - I - 0x002EA4 00:AE94: E7        .byte $E7   ; 
- D 1 - I - 0x002EA5 00:AE95: D0        .byte $D0   ; 
- D 1 - I - 0x002EA6 00:AE96: D0        .byte $D0   ; 
- D 1 - I - 0x002EA7 00:AE97: D0        .byte $D0   ; 
- D 1 - I - 0x002EA8 00:AE98: D0        .byte $D0   ; 
- D 1 - I - 0x002EA9 00:AE99: E8        .byte $E8   ; 
- D 1 - I - 0x002EAA 00:AE9A: E9        .byte $E9   ; 
- D 1 - I - 0x002EAB 00:AE9B: EA        .byte $EA   ; 
- D 1 - I - 0x002EAC 00:AE9C: EB        .byte $EB   ; 
- D 1 - I - 0x002EAD 00:AE9D: D0        .byte $D0   ; 
- D 1 - I - 0x002EAE 00:AE9E: D0        .byte $D0   ; 
- D 1 - I - 0x002EAF 00:AE9F: D0        .byte $D0   ; 
- D 1 - I - 0x002EB0 00:AEA0: D0        .byte $D0   ; 
- D 1 - I - 0x002EB1 00:AEA1: EC        .byte $EC   ; 
- D 1 - I - 0x002EB2 00:AEA2: ED        .byte $ED   ; 
- D 1 - I - 0x002EB3 00:AEA3: EE        .byte $EE   ; 
- D 1 - I - 0x002EB4 00:AEA4: EF        .byte $EF   ; 
- D 1 - I - 0x002EB5 00:AEA5: D0        .byte $D0   ; 
- D 1 - I - 0x002EB6 00:AEA6: D0        .byte $D0   ; 
- D 1 - I - 0x002EB7 00:AEA7: D0        .byte $D0   ; 
- D 1 - I - 0x002EB8 00:AEA8: D0        .byte $D0   ; 
- D 1 - I - 0x002EB9 00:AEA9: D0        .byte $D0   ; 
- D 1 - I - 0x002EBA 00:AEAA: D0        .byte $D0   ; 
- D 1 - I - 0x002EBB 00:AEAB: D0        .byte $D0   ; 
- D 1 - I - 0x002EBC 00:AEAC: D0        .byte $D0   ; 
- D 1 - I - 0x002EBD 00:AEAD: D0        .byte $D0   ; 
- D 1 - I - 0x002EBE 00:AEAE: D0        .byte $D0   ; 
- D 1 - I - 0x002EBF 00:AEAF: CA        .byte $CA   ; 
- D 1 - I - 0x002EC0 00:AEB0: C8        .byte $C8   ; 
- D 1 - I - 0x002EC1 00:AEB1: D5        .byte $D5   ; 
- D 1 - I - 0x002EC2 00:AEB2: CE        .byte $CE   ; 
- D 1 - I - 0x002EC3 00:AEB3: CE        .byte $CE   ; 
- D 1 - I - 0x002EC4 00:AEB4: CE        .byte $CE   ; 
- D 1 - I - 0x002EC5 00:AEB5: C9        .byte $C9   ; 
- D 1 - I - 0x002EC6 00:AEB6: CA        .byte $CA   ; 
- D 1 - I - 0x002EC7 00:AEB7: 86        .byte $86   ; 
- D 1 - I - 0x002EC8 00:AEB8: CC        .byte $CC   ; 
- D 1 - I - 0x002EC9 00:AEB9: CB        .byte $CB   ; 
- D 1 - I - 0x002ECA 00:AEBA: 64        .byte $64   ; 
- D 1 - I - 0x002ECB 00:AEBB: 64        .byte $64   ; 
- D 1 - I - 0x002ECC 00:AEBC: CF        .byte $CF   ; 
- D 1 - I - 0x002ECD 00:AEBD: CD        .byte $CD   ; 
- D 1 - I - 0x002ECE 00:AEBE: 86        .byte $86   ; 



_off018_01_AEBF_0D:
- - - - - - 0x002ECF 00:AEBF: 00        .byte $00   ; 
- - - - - - 0x002ED0 00:AEC0: 00        .byte $00   ; 
- - - - - - 0x002ED1 00:AEC1: 00        .byte $00   ; 
- - - - - - 0x002ED2 00:AEC2: 00        .byte $00   ; 
- - - - - - 0x002ED3 00:AEC3: 00        .byte $00   ; 
- - - - - - 0x002ED4 00:AEC4: 00        .byte $00   ; 
- - - - - - 0x002ED5 00:AEC5: 00        .byte $00   ; 
- - - - - - 0x002ED6 00:AEC6: 00        .byte $00   ; 
- - - - - - 0x002ED7 00:AEC7: 00        .byte $00   ; 
- - - - - - 0x002ED8 00:AEC8: 00        .byte $00   ; 
- - - - - - 0x002ED9 00:AEC9: 00        .byte $00   ; 
- - - - - - 0x002EDA 00:AECA: 00        .byte $00   ; 
- - - - - - 0x002EDB 00:AECB: 00        .byte $00   ; 
- - - - - - 0x002EDC 00:AECC: 00        .byte $00   ; 
- - - - - - 0x002EDD 00:AECD: 00        .byte $00   ; 
- - - - - - 0x002EDE 00:AECE: 00        .byte $00   ; 
- - - - - - 0x002EDF 00:AECF: 00        .byte $00   ; 
- - - - - - 0x002EE0 00:AED0: 00        .byte $00   ; 
- - - - - - 0x002EE1 00:AED1: 00        .byte $00   ; 
- - - - - - 0x002EE2 00:AED2: 00        .byte $00   ; 
- - - - - - 0x002EE3 00:AED3: 00        .byte $00   ; 
- - - - - - 0x002EE4 00:AED4: 00        .byte $00   ; 
- - - - - - 0x002EE5 00:AED5: 00        .byte $00   ; 
- - - - - - 0x002EE6 00:AED6: 00        .byte $00   ; 
- - - - - - 0x002EE7 00:AED7: 86        .byte $86   ; 
- - - - - - 0x002EE8 00:AED8: 86        .byte $86   ; 
- - - - - - 0x002EE9 00:AED9: 86        .byte $86   ; 
- - - - - - 0x002EEA 00:AEDA: 86        .byte $86   ; 
- - - - - - 0x002EEB 00:AEDB: 86        .byte $86   ; 
- - - - - - 0x002EEC 00:AEDC: 86        .byte $86   ; 
- - - - - - 0x002EED 00:AEDD: 86        .byte $86   ; 
- - - - - - 0x002EEE 00:AEDE: 86        .byte $86   ; 
- D 1 - I - 0x002EEF 00:AEDF: 86        .byte $86   ; 
- D 1 - I - 0x002EF0 00:AEE0: 86        .byte $86   ; 
- D 1 - I - 0x002EF1 00:AEE1: 86        .byte $86   ; 
- D 1 - I - 0x002EF2 00:AEE2: 86        .byte $86   ; 
- D 1 - I - 0x002EF3 00:AEE3: 86        .byte $86   ; 
- D 1 - I - 0x002EF4 00:AEE4: 86        .byte $86   ; 
- D 1 - I - 0x002EF5 00:AEE5: 86        .byte $86   ; 
- D 1 - I - 0x002EF6 00:AEE6: 86        .byte $86   ; 
- D 1 - I - 0x002EF7 00:AEE7: 86        .byte $86   ; 
- D 1 - I - 0x002EF8 00:AEE8: D8        .byte $D8   ; 
- D 1 - I - 0x002EF9 00:AEE9: D9        .byte $D9   ; 
- D 1 - I - 0x002EFA 00:AEEA: D6        .byte $D6   ; 
- D 1 - I - 0x002EFB 00:AEEB: D6        .byte $D6   ; 
- D 1 - I - 0x002EFC 00:AEEC: DA        .byte $DA   ; 
- D 1 - I - 0x002EFD 00:AEED: DB        .byte $DB   ; 
- D 1 - I - 0x002EFE 00:AEEE: 86        .byte $86   ; 
- D 1 - I - 0x002EFF 00:AEEF: D7        .byte $D7   ; 
- D 1 - I - 0x002F00 00:AEF0: DC        .byte $DC   ; 
- D 1 - I - 0x002F01 00:AEF1: DD        .byte $DD   ; 
- D 1 - I - 0x002F02 00:AEF2: 00        .byte $00   ; 
- D 1 - I - 0x002F03 00:AEF3: 00        .byte $00   ; 
- D 1 - I - 0x002F04 00:AEF4: DE        .byte $DE   ; 
- D 1 - I - 0x002F05 00:AEF5: DF        .byte $DF   ; 
- D 1 - I - 0x002F06 00:AEF6: D7        .byte $D7   ; 
- D 1 - I - 0x002F07 00:AEF7: D2        .byte $D2   ; 
- D 1 - I - 0x002F08 00:AEF8: D2        .byte $D2   ; 
- D 1 - I - 0x002F09 00:AEF9: E0        .byte $E0   ; 
- D 1 - I - 0x002F0A 00:AEFA: 64        .byte $64   ; 
- D 1 - I - 0x002F0B 00:AEFB: 64        .byte $64   ; 
- D 1 - I - 0x002F0C 00:AEFC: E1        .byte $E1   ; 
- D 1 - I - 0x002F0D 00:AEFD: D2        .byte $D2   ; 
- D 1 - I - 0x002F0E 00:AEFE: D2        .byte $D2   ; 



_off018_01_AEFF_0E:
- D 1 - I - 0x002F0F 00:AEFF: D0        .byte $D0   ; 
- D 1 - I - 0x002F10 00:AF00: D0        .byte $D0   ; 
- D 1 - I - 0x002F11 00:AF01: D0        .byte $D0   ; 
- D 1 - I - 0x002F12 00:AF02: D0        .byte $D0   ; 
- D 1 - I - 0x002F13 00:AF03: D0        .byte $D0   ; 
- D 1 - I - 0x002F14 00:AF04: D0        .byte $D0   ; 
- D 1 - I - 0x002F15 00:AF05: D0        .byte $D0   ; 
- D 1 - I - 0x002F16 00:AF06: D0        .byte $D0   ; 
- D 1 - I - 0x002F17 00:AF07: D0        .byte $D0   ; 
- D 1 - I - 0x002F18 00:AF08: D0        .byte $D0   ; 
- D 1 - I - 0x002F19 00:AF09: F0        .byte $F0   ; 
- D 1 - I - 0x002F1A 00:AF0A: E2        .byte $E2   ; 
- D 1 - I - 0x002F1B 00:AF0B: E3        .byte $E3   ; 
- D 1 - I - 0x002F1C 00:AF0C: F1        .byte $F1   ; 
- D 1 - I - 0x002F1D 00:AF0D: D0        .byte $D0   ; 
- D 1 - I - 0x002F1E 00:AF0E: D0        .byte $D0   ; 
- D 1 - I - 0x002F1F 00:AF0F: D0        .byte $D0   ; 
- D 1 - I - 0x002F20 00:AF10: D0        .byte $D0   ; 
- D 1 - I - 0x002F21 00:AF11: E4        .byte $E4   ; 
- D 1 - I - 0x002F22 00:AF12: E5        .byte $E5   ; 
- D 1 - I - 0x002F23 00:AF13: E6        .byte $E6   ; 
- D 1 - I - 0x002F24 00:AF14: E7        .byte $E7   ; 
- D 1 - I - 0x002F25 00:AF15: D0        .byte $D0   ; 
- D 1 - I - 0x002F26 00:AF16: D0        .byte $D0   ; 
- D 1 - I - 0x002F27 00:AF17: D0        .byte $D0   ; 
- D 1 - I - 0x002F28 00:AF18: D0        .byte $D0   ; 
- D 1 - I - 0x002F29 00:AF19: E8        .byte $E8   ; 
- D 1 - I - 0x002F2A 00:AF1A: E9        .byte $E9   ; 
- D 1 - I - 0x002F2B 00:AF1B: EA        .byte $EA   ; 
- D 1 - I - 0x002F2C 00:AF1C: EB        .byte $EB   ; 
- D 1 - I - 0x002F2D 00:AF1D: D0        .byte $D0   ; 
- D 1 - I - 0x002F2E 00:AF1E: D0        .byte $D0   ; 
- D 1 - I - 0x002F2F 00:AF1F: D0        .byte $D0   ; 
- D 1 - I - 0x002F30 00:AF20: D0        .byte $D0   ; 
- D 1 - I - 0x002F31 00:AF21: EC        .byte $EC   ; 
- D 1 - I - 0x002F32 00:AF22: ED        .byte $ED   ; 
- D 1 - I - 0x002F33 00:AF23: EE        .byte $EE   ; 
- D 1 - I - 0x002F34 00:AF24: EF        .byte $EF   ; 
- D 1 - I - 0x002F35 00:AF25: D0        .byte $D0   ; 
- D 1 - I - 0x002F36 00:AF26: D0        .byte $D0   ; 
- D 1 - I - 0x002F37 00:AF27: D0        .byte $D0   ; 
- D 1 - I - 0x002F38 00:AF28: D0        .byte $D0   ; 
- D 1 - I - 0x002F39 00:AF29: D0        .byte $D0   ; 
- D 1 - I - 0x002F3A 00:AF2A: D0        .byte $D0   ; 
- D 1 - I - 0x002F3B 00:AF2B: D0        .byte $D0   ; 
- D 1 - I - 0x002F3C 00:AF2C: D0        .byte $D0   ; 
- D 1 - I - 0x002F3D 00:AF2D: D0        .byte $D0   ; 
- D 1 - I - 0x002F3E 00:AF2E: D0        .byte $D0   ; 
- D 1 - I - 0x002F3F 00:AF2F: D0        .byte $D0   ; 
- D 1 - I - 0x002F40 00:AF30: D0        .byte $D0   ; 
- D 1 - I - 0x002F41 00:AF31: D0        .byte $D0   ; 
- D 1 - I - 0x002F42 00:AF32: D0        .byte $D0   ; 
- D 1 - I - 0x002F43 00:AF33: D0        .byte $D0   ; 
- D 1 - I - 0x002F44 00:AF34: D0        .byte $D0   ; 
- D 1 - I - 0x002F45 00:AF35: D0        .byte $D0   ; 
- D 1 - I - 0x002F46 00:AF36: D0        .byte $D0   ; 
- D 1 - I - 0x002F47 00:AF37: D0        .byte $D0   ; 
- D 1 - I - 0x002F48 00:AF38: D0        .byte $D0   ; 
- D 1 - I - 0x002F49 00:AF39: D0        .byte $D0   ; 
- D 1 - I - 0x002F4A 00:AF3A: D0        .byte $D0   ; 
- D 1 - I - 0x002F4B 00:AF3B: D0        .byte $D0   ; 
- D 1 - I - 0x002F4C 00:AF3C: D0        .byte $D0   ; 
- D 1 - I - 0x002F4D 00:AF3D: D0        .byte $D0   ; 
- D 1 - I - 0x002F4E 00:AF3E: D0        .byte $D0   ; 



_off006_0x002F4F_01_area_2:
- D 1 - I - 0x002F4F 00:AF3F: 00        .byte $00   ; 
- D 1 - I - 0x002F50 00:AF40: 00        .byte $00   ; 
- D 1 - I - 0x002F51 00:AF41: 00        .byte $00   ; 
- D 1 - I - 0x002F52 00:AF42: 00        .byte $00   ; 
- D 1 - I - 0x002F53 00:AF43: 00        .byte $00   ; 
- D 1 - I - 0x002F54 00:AF44: 00        .byte $00   ; 
- D 1 - I - 0x002F55 00:AF45: 00        .byte $00   ; 
- D 1 - I - 0x002F56 00:AF46: 00        .byte $00   ; 
- D 1 - I - 0x002F57 00:AF47: 00        .byte $00   ; 
- D 1 - I - 0x002F58 00:AF48: 00        .byte $00   ; 
- D 1 - I - 0x002F59 00:AF49: 00        .byte $00   ; 
- D 1 - I - 0x002F5A 00:AF4A: 00        .byte $00   ; 
- D 1 - I - 0x002F5B 00:AF4B: 00        .byte $00   ; 
- D 1 - I - 0x002F5C 00:AF4C: 00        .byte $00   ; 
- D 1 - I - 0x002F5D 00:AF4D: 00        .byte $00   ; 
- D 1 - I - 0x002F5E 00:AF4E: 00        .byte $00   ; 
- D 1 - I - 0x002F5F 00:AF4F: 05        .byte $05   ; 
- D 1 - I - 0x002F60 00:AF50: 06        .byte $06   ; 
- D 1 - I - 0x002F61 00:AF51: 06        .byte $06   ; 
- D 1 - I - 0x002F62 00:AF52: 5D        .byte $5D   ; 
- D 1 - I - 0x002F63 00:AF53: 07        .byte $07   ; 
- D 1 - I - 0x002F64 00:AF54: 08        .byte $08   ; 
- D 1 - I - 0x002F65 00:AF55: 5E        .byte $5E   ; 
- D 1 - I - 0x002F66 00:AF56: 5F        .byte $5F   ; 
- D 1 - I - 0x002F67 00:AF57: 07        .byte $07   ; 
- D 1 - I - 0x002F68 00:AF58: 5E        .byte $5E   ; 
- D 1 - I - 0x002F69 00:AF59: 08        .byte $08   ; 
- D 1 - I - 0x002F6A 00:AF5A: 5F        .byte $5F   ; 
- D 1 - I - 0x002F6B 00:AF5B: 60        .byte $60   ; 
- D 1 - I - 0x002F6C 00:AF5C: 65        .byte $65   ; 
- D 1 - I - 0x002F6D 00:AF5D: 65        .byte $65   ; 
- D 1 - I - 0x002F6E 00:AF5E: 55        .byte $55   ; 
- D 1 - I - 0x002F6F 00:AF5F: 05        .byte $05   ; 
- D 1 - I - 0x002F70 00:AF60: 66        .byte $66   ; 
- D 1 - I - 0x002F71 00:AF61: 14        .byte $14   ; 
- D 1 - I - 0x002F72 00:AF62: 5D        .byte $5D   ; 
- D 1 - I - 0x002F73 00:AF63: 67        .byte $67   ; 
- D 1 - I - 0x002F74 00:AF64: 68        .byte $68   ; 
- D 1 - I - 0x002F75 00:AF65: 69        .byte $69   ; 
- D 1 - I - 0x002F76 00:AF66: 6A        .byte $6A   ; 
- D 1 - I - 0x002F77 00:AF67: 15        .byte $15   ; 
- D 1 - I - 0x002F78 00:AF68: 6B        .byte $6B   ; 
- D 1 - I - 0x002F79 00:AF69: 16        .byte $16   ; 
- D 1 - I - 0x002F7A 00:AF6A: 6C        .byte $6C   ; 
- D 1 - I - 0x002F7B 00:AF6B: 60        .byte $60   ; 
- D 1 - I - 0x002F7C 00:AF6C: 6D        .byte $6D   ; 
- D 1 - I - 0x002F7D 00:AF6D: 6E        .byte $6E   ; 
- D 1 - I - 0x002F7E 00:AF6E: 55        .byte $55   ; 
- D 1 - I - 0x002F7F 00:AF6F: 0F        .byte $0F   ; 
- D 1 - I - 0x002F80 00:AF70: 18        .byte $18   ; 
- D 1 - I - 0x002F81 00:AF71: 00        .byte $00   ; 
- D 1 - I - 0x002F82 00:AF72: 00        .byte $00   ; 
- D 1 - I - 0x002F83 00:AF73: 10        .byte $10   ; 
- D 1 - I - 0x002F84 00:AF74: 00        .byte $00   ; 
- D 1 - I - 0x002F85 00:AF75: 00        .byte $00   ; 
- D 1 - I - 0x002F86 00:AF76: 00        .byte $00   ; 
- D 1 - I - 0x002F87 00:AF77: 10        .byte $10   ; 
- D 1 - I - 0x002F88 00:AF78: 00        .byte $00   ; 
- D 1 - I - 0x002F89 00:AF79: 00        .byte $00   ; 
- D 1 - I - 0x002F8A 00:AF7A: 00        .byte $00   ; 
- D 1 - I - 0x002F8B 00:AF7B: 71        .byte $71   ; 
- D 1 - I - 0x002F8C 00:AF7C: 00        .byte $00   ; 
- D 1 - I - 0x002F8D 00:AF7D: 00        .byte $00   ; 
- D 1 - I - 0x002F8E 00:AF7E: 00        .byte $00   ; 
- D 1 - I - 0x002F8F 00:AF7F: 79        .byte $79   ; 
- D 1 - I - 0x002F90 00:AF80: 82        .byte $82   ; 
- D 1 - I - 0x002F91 00:AF81: 3F        .byte $3F   ; 
- D 1 - I - 0x002F92 00:AF82: 00        .byte $00   ; 
- D 1 - I - 0x002F93 00:AF83: 83        .byte $83   ; 
- D 1 - I - 0x002F94 00:AF84: 83        .byte $83   ; 
- D 1 - I - 0x002F95 00:AF85: 37        .byte $37   ; 
- D 1 - I - 0x002F96 00:AF86: 82        .byte $82   ; 
- D 1 - I - 0x002F97 00:AF87: 40        .byte $40   ; 
- D 1 - I - 0x002F98 00:AF88: 40        .byte $40   ; 
- D 1 - I - 0x002F99 00:AF89: 49        .byte $49   ; 
- D 1 - I - 0x002F9A 00:AF8A: 37        .byte $37   ; 
- D 1 - I - 0x002F9B 00:AF8B: 40        .byte $40   ; 
- D 1 - I - 0x002F9C 00:AF8C: 40        .byte $40   ; 
- D 1 - I - 0x002F9D 00:AF8D: 40        .byte $40   ; 
- D 1 - I - 0x002F9E 00:AF8E: 49        .byte $49   ; 
- D 1 - I - 0x002F9F 00:AF8F: 0F        .byte $0F   ; 
- D 1 - I - 0x002FA0 00:AF90: 12        .byte $12   ; 
- D 1 - I - 0x002FA1 00:AF91: 12        .byte $12   ; 
- D 1 - I - 0x002FA2 00:AF92: 5D        .byte $5D   ; 
- D 1 - I - 0x002FA3 00:AF93: 00        .byte $00   ; 
- D 1 - I - 0x002FA4 00:AF94: 11        .byte $11   ; 
- D 1 - I - 0x002FA5 00:AF95: 5E        .byte $5E   ; 
- D 1 - I - 0x002FA6 00:AF96: 5F        .byte $5F   ; 
- D 1 - I - 0x002FA7 00:AF97: 00        .byte $00   ; 
- D 1 - I - 0x002FA8 00:AF98: 00        .byte $00   ; 
- D 1 - I - 0x002FA9 00:AF99: 11        .byte $11   ; 
- D 1 - I - 0x002FAA 00:AF9A: 5F        .byte $5F   ; 
- D 1 - I - 0x002FAB 00:AF9B: 82        .byte $82   ; 
- D 1 - I - 0x002FAC 00:AF9C: 00        .byte $00   ; 
- D 1 - I - 0x002FAD 00:AF9D: 00        .byte $00   ; 
- D 1 - I - 0x002FAE 00:AF9E: 55        .byte $55   ; 
- D 1 - I - 0x002FAF 00:AF9F: 17        .byte $17   ; 
- D 1 - I - 0x002FB0 00:AFA0: 18        .byte $18   ; 
- D 1 - I - 0x002FB1 00:AFA1: 18        .byte $18   ; 
- D 1 - I - 0x002FB2 00:AFA2: 00        .byte $00   ; 
- D 1 - I - 0x002FB3 00:AFA3: 07        .byte $07   ; 
- D 1 - I - 0x002FB4 00:AFA4: 19        .byte $19   ; 
- D 1 - I - 0x002FB5 00:AFA5: 00        .byte $00   ; 
- D 1 - I - 0x002FB6 00:AFA6: 00        .byte $00   ; 
- D 1 - I - 0x002FB7 00:AFA7: 07        .byte $07   ; 
- D 1 - I - 0x002FB8 00:AFA8: 5E        .byte $5E   ; 
- D 1 - I - 0x002FB9 00:AFA9: 19        .byte $19   ; 
- D 1 - I - 0x002FBA 00:AFAA: 00        .byte $00   ; 
- D 1 - I - 0x002FBB 00:AFAB: 60        .byte $60   ; 
- D 1 - I - 0x002FBC 00:AFAC: 65        .byte $65   ; 
- D 1 - I - 0x002FBD 00:AFAD: 65        .byte $65   ; 
- D 1 - I - 0x002FBE 00:AFAE: 6F        .byte $6F   ; 
- D 1 - I - 0x002FBF 00:AFAF: 0F        .byte $0F   ; 
- D 1 - I - 0x002FC0 00:AFB0: 18        .byte $18   ; 
- D 1 - I - 0x002FC1 00:AFB1: 18        .byte $18   ; 
- D 1 - I - 0x002FC2 00:AFB2: 00        .byte $00   ; 
- D 1 - I - 0x002FC3 00:AFB3: 10        .byte $10   ; 
- D 1 - I - 0x002FC4 00:AFB4: 00        .byte $00   ; 
- D 1 - I - 0x002FC5 00:AFB5: 00        .byte $00   ; 
- D 1 - I - 0x002FC6 00:AFB6: 00        .byte $00   ; 
- D 1 - I - 0x002FC7 00:AFB7: 10        .byte $10   ; 
- D 1 - I - 0x002FC8 00:AFB8: 00        .byte $00   ; 
- D 1 - I - 0x002FC9 00:AFB9: 00        .byte $00   ; 
- D 1 - I - 0x002FCA 00:AFBA: 00        .byte $00   ; 
- D 1 - I - 0x002FCB 00:AFBB: 71        .byte $71   ; 
- D 1 - I - 0x002FCC 00:AFBC: 00        .byte $00   ; 
- D 1 - I - 0x002FCD 00:AFBD: 00        .byte $00   ; 
- D 1 - I - 0x002FCE 00:AFBE: 00        .byte $00   ; 
- D 1 - I - 0x002FCF 00:AFBF: 40        .byte $40   ; 
- D 1 - I - 0x002FD0 00:AFC0: 40        .byte $40   ; 
- D 1 - I - 0x002FD1 00:AFC1: 40        .byte $40   ; 
- D 1 - I - 0x002FD2 00:AFC2: 40        .byte $40   ; 
- D 1 - I - 0x002FD3 00:AFC3: 40        .byte $40   ; 
- D 1 - I - 0x002FD4 00:AFC4: 40        .byte $40   ; 
- D 1 - I - 0x002FD5 00:AFC5: 40        .byte $40   ; 
- D 1 - I - 0x002FD6 00:AFC6: 40        .byte $40   ; 
- D 1 - I - 0x002FD7 00:AFC7: 40        .byte $40   ; 
- D 1 - I - 0x002FD8 00:AFC8: 40        .byte $40   ; 
- D 1 - I - 0x002FD9 00:AFC9: 40        .byte $40   ; 
- D 1 - I - 0x002FDA 00:AFCA: 40        .byte $40   ; 
- D 1 - I - 0x002FDB 00:AFCB: 40        .byte $40   ; 
- D 1 - I - 0x002FDC 00:AFCC: 40        .byte $40   ; 
- D 1 - I - 0x002FDD 00:AFCD: 40        .byte $40   ; 
- D 1 - I - 0x002FDE 00:AFCE: 40        .byte $40   ; 
- D 1 - I - 0x002FDF 00:AFCF: 49        .byte $49   ; 
- D 1 - I - 0x002FE0 00:AFD0: 00        .byte $00   ; 
- D 1 - I - 0x002FE1 00:AFD1: 00        .byte $00   ; 
- D 1 - I - 0x002FE2 00:AFD2: 55        .byte $55   ; 
- D 1 - I - 0x002FE3 00:AFD3: 4A        .byte $4A   ; 
- D 1 - I - 0x002FE4 00:AFD4: 82        .byte $82   ; 
- D 1 - I - 0x002FE5 00:AFD5: 00        .byte $00   ; 
- D 1 - I - 0x002FE6 00:AFD6: 00        .byte $00   ; 
- D 1 - I - 0x002FE7 00:AFD7: 4A        .byte $4A   ; 
- D 1 - I - 0x002FE8 00:AFD8: 37        .byte $37   ; 
- D 1 - I - 0x002FE9 00:AFD9: 00        .byte $00   ; 
- D 1 - I - 0x002FEA 00:AFDA: 00        .byte $00   ; 
- D 1 - I - 0x002FEB 00:AFDB: 40        .byte $40   ; 
- D 1 - I - 0x002FEC 00:AFDC: 37        .byte $37   ; 
- D 1 - I - 0x002FED 00:AFDD: 82        .byte $82   ; 
- D 1 - I - 0x002FEE 00:AFDE: 00        .byte $00   ; 
- D 1 - I - 0x002FEF 00:AFDF: 0F        .byte $0F   ; 
- D 1 - I - 0x002FF0 00:AFE0: 06        .byte $06   ; 
- D 1 - I - 0x002FF1 00:AFE1: 06        .byte $06   ; 
- D 1 - I - 0x002FF2 00:AFE2: 5D        .byte $5D   ; 
- D 1 - I - 0x002FF3 00:AFE3: 11        .byte $11   ; 
- D 1 - I - 0x002FF4 00:AFE4: 08        .byte $08   ; 
- D 1 - I - 0x002FF5 00:AFE5: 5E        .byte $5E   ; 
- D 1 - I - 0x002FF6 00:AFE6: 5F        .byte $5F   ; 
- D 1 - I - 0x002FF7 00:AFE7: 00        .byte $00   ; 
- D 1 - I - 0x002FF8 00:AFE8: 5E        .byte $5E   ; 
- D 1 - I - 0x002FF9 00:AFE9: 08        .byte $08   ; 
- D 1 - I - 0x002FFA 00:AFEA: 5F        .byte $5F   ; 
- D 1 - I - 0x002FFB 00:AFEB: 00        .byte $00   ; 
- D 1 - I - 0x002FFC 00:AFEC: 11        .byte $11   ; 
- D 1 - I - 0x002FFD 00:AFED: 65        .byte $65   ; 
- D 1 - I - 0x002FFE 00:AFEE: 55        .byte $55   ; 
- D 1 - I - 0x002FFF 00:AFEF: 50        .byte $50   ; 
- D 1 - I - 0x003000 00:AFF0: 50        .byte $50   ; 
- D 1 - I - 0x003001 00:AFF1: 50        .byte $50   ; 
- D 1 - I - 0x003002 00:AFF2: 50        .byte $50   ; 
- D 1 - I - 0x003003 00:AFF3: 40        .byte $40   ; 
- D 1 - I - 0x003004 00:AFF4: 40        .byte $40   ; 
- D 1 - I - 0x003005 00:AFF5: 40        .byte $40   ; 
- D 1 - I - 0x003006 00:AFF6: 40        .byte $40   ; 
- D 1 - I - 0x003007 00:AFF7: 40        .byte $40   ; 
- D 1 - I - 0x003008 00:AFF8: 40        .byte $40   ; 
- D 1 - I - 0x003009 00:AFF9: 40        .byte $40   ; 
- D 1 - I - 0x00300A 00:AFFA: 40        .byte $40   ; 
- D 1 - I - 0x00300B 00:AFFB: E4        .byte $E4   ; 
- D 1 - I - 0x00300C 00:AFFC: 40        .byte $40   ; 
- D 1 - I - 0x00300D 00:AFFD: 40        .byte $40   ; 
- D 1 - I - 0x00300E 00:AFFE: 40        .byte $40   ; 
- D 1 - I - 0x00300F 00:AFFF: 05        .byte $05   ; 
- D 1 - I - 0x003010 00:B000: 06        .byte $06   ; 
- D 1 - I - 0x003011 00:B001: 06        .byte $06   ; 
- D 1 - I - 0x003012 00:B002: 5D        .byte $5D   ; 
- D 1 - I - 0x003013 00:B003: 07        .byte $07   ; 
- D 1 - I - 0x003014 00:B004: 08        .byte $08   ; 
- D 1 - I - 0x003015 00:B005: 5E        .byte $5E   ; 
- D 1 - I - 0x003016 00:B006: 5F        .byte $5F   ; 
- D 1 - I - 0x003017 00:B007: 07        .byte $07   ; 
- D 1 - I - 0x003018 00:B008: 5E        .byte $5E   ; 
- D 1 - I - 0x003019 00:B009: 08        .byte $08   ; 
- D 1 - I - 0x00301A 00:B00A: 5F        .byte $5F   ; 
- D 1 - I - 0x00301B 00:B00B: 55        .byte $55   ; 
- D 1 - I - 0x00301C 00:B00C: 55        .byte $55   ; 
- D 1 - I - 0x00301D 00:B00D: 65        .byte $65   ; 
- D 1 - I - 0x00301E 00:B00E: 55        .byte $55   ; 
- D 1 - I - 0x00301F 00:B00F: 40        .byte $40   ; 
- D 1 - I - 0x003020 00:B010: 49        .byte $49   ; 
- D 1 - I - 0x003021 00:B011: 79        .byte $79   ; 
- D 1 - I - 0x003022 00:B012: 00        .byte $00   ; 
- D 1 - I - 0x003023 00:B013: 40        .byte $40   ; 
- D 1 - I - 0x003024 00:B014: 40        .byte $40   ; 
- D 1 - I - 0x003025 00:B015: 37        .byte $37   ; 
- D 1 - I - 0x003026 00:B016: 00        .byte $00   ; 
- - - - - - 0x003027 00:B017: 00        .byte $00   ; 
- - - - - - 0x003028 00:B018: 00        .byte $00   ; 
- - - - - - 0x003029 00:B019: 00        .byte $00   ; 
- - - - - - 0x00302A 00:B01A: 00        .byte $00   ; 
- - - - - - 0x00302B 00:B01B: 00        .byte $00   ; 
- - - - - - 0x00302C 00:B01C: 00        .byte $00   ; 
- - - - - - 0x00302D 00:B01D: 00        .byte $00   ; 
- - - - - - 0x00302E 00:B01E: 00        .byte $00   ; 
- D 1 - I - 0x00302F 00:B01F: 00        .byte $00   ; 
- D 1 - I - 0x003030 00:B020: 00        .byte $00   ; 
- D 1 - I - 0x003031 00:B021: 06        .byte $06   ; 
- D 1 - I - 0x003032 00:B022: 5D        .byte $5D   ; 
- D 1 - I - 0x003033 00:B023: 00        .byte $00   ; 
- D 1 - I - 0x003034 00:B024: 00        .byte $00   ; 
- D 1 - I - 0x003035 00:B025: 5E        .byte $5E   ; 
- D 1 - I - 0x003036 00:B026: 5F        .byte $5F   ; 
- - - - - - 0x003037 00:B027: 00        .byte $00   ; 
- - - - - - 0x003038 00:B028: 00        .byte $00   ; 
- - - - - - 0x003039 00:B029: 00        .byte $00   ; 
- - - - - - 0x00303A 00:B02A: 00        .byte $00   ; 
- - - - - - 0x00303B 00:B02B: 00        .byte $00   ; 
- - - - - - 0x00303C 00:B02C: 00        .byte $00   ; 
- - - - - - 0x00303D 00:B02D: 00        .byte $00   ; 
- - - - - - 0x00303E 00:B02E: 00        .byte $00   ; 
- D 1 - I - 0x00303F 00:B02F: 4F        .byte $4F   ; 
- D 1 - I - 0x003040 00:B030: E4        .byte $E4   ; 
- D 1 - I - 0x003041 00:B031: 40        .byte $40   ; 
- D 1 - I - 0x003042 00:B032: 40        .byte $40   ; 
- D 1 - I - 0x003043 00:B033: 4D        .byte $4D   ; 
- D 1 - I - 0x003044 00:B034: 4F        .byte $4F   ; 
- D 1 - I - 0x003045 00:B035: 40        .byte $40   ; 
- D 1 - I - 0x003046 00:B036: 40        .byte $40   ; 
- D 1 - I - 0x003047 00:B037: 35        .byte $35   ; 
- D 1 - I - 0x003048 00:B038: 4E        .byte $4E   ; 
- D 1 - I - 0x003049 00:B039: 4C        .byte $4C   ; 
- D 1 - I - 0x00304A 00:B03A: 4C        .byte $4C   ; 
- D 1 - I - 0x00304B 00:B03B: 00        .byte $00   ; 
- D 1 - I - 0x00304C 00:B03C: 00        .byte $00   ; 
- D 1 - I - 0x00304D 00:B03D: 35        .byte $35   ; 
- D 1 - I - 0x00304E 00:B03E: 4E        .byte $4E   ; 
- D 1 - I - 0x00304F 00:B03F: 4D        .byte $4D   ; 
- D 1 - I - 0x003050 00:B040: E5        .byte $E5   ; 
- D 1 - I - 0x003051 00:B041: 33        .byte $33   ; 
- D 1 - I - 0x003052 00:B042: E5        .byte $E5   ; 
- D 1 - I - 0x003053 00:B043: 36        .byte $36   ; 
- D 1 - I - 0x003054 00:B044: 40        .byte $40   ; 
- D 1 - I - 0x003055 00:B045: 40        .byte $40   ; 
- D 1 - I - 0x003056 00:B046: 40        .byte $40   ; 
- D 1 - I - 0x003057 00:B047: 36        .byte $36   ; 
- D 1 - I - 0x003058 00:B048: 40        .byte $40   ; 
- D 1 - I - 0x003059 00:B049: 40        .byte $40   ; 
- D 1 - I - 0x00305A 00:B04A: 40        .byte $40   ; 
- D 1 - I - 0x00305B 00:B04B: 34        .byte $34   ; 
- D 1 - I - 0x00305C 00:B04C: 4C        .byte $4C   ; 
- D 1 - I - 0x00305D 00:B04D: 40        .byte $40   ; 
- D 1 - I - 0x00305E 00:B04E: 40        .byte $40   ; 
- D 1 - I - 0x00305F 00:B04F: 33        .byte $33   ; 
- D 1 - I - 0x003060 00:B050: E5        .byte $E5   ; 
- D 1 - I - 0x003061 00:B051: 33        .byte $33   ; 
- D 1 - I - 0x003062 00:B052: E5        .byte $E5   ; 
- D 1 - I - 0x003063 00:B053: 40        .byte $40   ; 
- D 1 - I - 0x003064 00:B054: 40        .byte $40   ; 
- D 1 - I - 0x003065 00:B055: 40        .byte $40   ; 
- D 1 - I - 0x003066 00:B056: 40        .byte $40   ; 
- D 1 - I - 0x003067 00:B057: 40        .byte $40   ; 
- D 1 - I - 0x003068 00:B058: 40        .byte $40   ; 
- D 1 - I - 0x003069 00:B059: 40        .byte $40   ; 
- D 1 - I - 0x00306A 00:B05A: 40        .byte $40   ; 
- D 1 - I - 0x00306B 00:B05B: 4C        .byte $4C   ; 
- D 1 - I - 0x00306C 00:B05C: E4        .byte $E4   ; 
- D 1 - I - 0x00306D 00:B05D: 40        .byte $40   ; 
- D 1 - I - 0x00306E 00:B05E: 40        .byte $40   ; 
- D 1 - I - 0x00306F 00:B05F: 33        .byte $33   ; 
- D 1 - I - 0x003070 00:B060: E5        .byte $E5   ; 
- D 1 - I - 0x003071 00:B061: 33        .byte $33   ; 
- D 1 - I - 0x003072 00:B062: E5        .byte $E5   ; 
- D 1 - I - 0x003073 00:B063: 40        .byte $40   ; 
- D 1 - I - 0x003074 00:B064: 40        .byte $40   ; 
- D 1 - I - 0x003075 00:B065: 40        .byte $40   ; 
- D 1 - I - 0x003076 00:B066: 40        .byte $40   ; 
- D 1 - I - 0x003077 00:B067: 40        .byte $40   ; 
- D 1 - I - 0x003078 00:B068: 40        .byte $40   ; 
- D 1 - I - 0x003079 00:B069: 40        .byte $40   ; 
- D 1 - I - 0x00307A 00:B06A: 40        .byte $40   ; 
- D 1 - I - 0x00307B 00:B06B: 4C        .byte $4C   ; 
- D 1 - I - 0x00307C 00:B06C: 40        .byte $40   ; 
- D 1 - I - 0x00307D 00:B06D: 40        .byte $40   ; 
- D 1 - I - 0x00307E 00:B06E: 40        .byte $40   ; 
- D 1 - I - 0x00307F 00:B06F: 41        .byte $41   ; 
- D 1 - I - 0x003080 00:B070: 41        .byte $41   ; 
- D 1 - I - 0x003081 00:B071: 41        .byte $41   ; 
- D 1 - I - 0x003082 00:B072: 41        .byte $41   ; 
- D 1 - I - 0x003083 00:B073: EB        .byte $EB   ; 
- D 1 - I - 0x003084 00:B074: EB        .byte $EB   ; 
- D 1 - I - 0x003085 00:B075: EB        .byte $EB   ; 
- D 1 - I - 0x003086 00:B076: EB        .byte $EB   ; 
- D 1 - I - 0x003087 00:B077: 00        .byte $00   ; 
- D 1 - I - 0x003088 00:B078: 00        .byte $00   ; 
- D 1 - I - 0x003089 00:B079: 00        .byte $00   ; 
- D 1 - I - 0x00308A 00:B07A: 00        .byte $00   ; 
- D 1 - I - 0x00308B 00:B07B: 00        .byte $00   ; 
- D 1 - I - 0x00308C 00:B07C: 00        .byte $00   ; 
- D 1 - I - 0x00308D 00:B07D: 00        .byte $00   ; 
- D 1 - I - 0x00308E 00:B07E: 00        .byte $00   ; 
- D 1 - I - 0x00308F 00:B07F: 34        .byte $34   ; 
- D 1 - I - 0x003090 00:B080: E7        .byte $E7   ; 
- D 1 - I - 0x003091 00:B081: 37        .byte $37   ; 
- D 1 - I - 0x003092 00:B082: E7        .byte $E7   ; 
- D 1 - I - 0x003093 00:B083: E8        .byte $E8   ; 
- D 1 - I - 0x003094 00:B084: 35        .byte $35   ; 
- D 1 - I - 0x003095 00:B085: E6        .byte $E6   ; 
- D 1 - I - 0x003096 00:B086: E6        .byte $E6   ; 
- D 1 - I - 0x003097 00:B087: 3A        .byte $3A   ; 
- D 1 - I - 0x003098 00:B088: 38        .byte $38   ; 
- D 1 - I - 0x003099 00:B089: 39        .byte $39   ; 
- D 1 - I - 0x00309A 00:B08A: 39        .byte $39   ; 
- D 1 - I - 0x00309B 00:B08B: 3A        .byte $3A   ; 
- D 1 - I - 0x00309C 00:B08C: 41        .byte $41   ; 
- D 1 - I - 0x00309D 00:B08D: 41        .byte $41   ; 
- D 1 - I - 0x00309E 00:B08E: 41        .byte $41   ; 
- D 1 - I - 0x00309F 00:B08F: 37        .byte $37   ; 
- D 1 - I - 0x0030A0 00:B090: E7        .byte $E7   ; 
- D 1 - I - 0x0030A1 00:B091: 37        .byte $37   ; 
- D 1 - I - 0x0030A2 00:B092: E7        .byte $E7   ; 
- D 1 - I - 0x0030A3 00:B093: 35        .byte $35   ; 
- D 1 - I - 0x0030A4 00:B094: 35        .byte $35   ; 
- D 1 - I - 0x0030A5 00:B095: E6        .byte $E6   ; 
- D 1 - I - 0x0030A6 00:B096: 35        .byte $35   ; 
- D 1 - I - 0x0030A7 00:B097: 38        .byte $38   ; 
- D 1 - I - 0x0030A8 00:B098: 39        .byte $39   ; 
- D 1 - I - 0x0030A9 00:B099: 39        .byte $39   ; 
- D 1 - I - 0x0030AA 00:B09A: 38        .byte $38   ; 
- D 1 - I - 0x0030AB 00:B09B: 41        .byte $41   ; 
- D 1 - I - 0x0030AC 00:B09C: 41        .byte $41   ; 
- D 1 - I - 0x0030AD 00:B09D: 41        .byte $41   ; 
- D 1 - I - 0x0030AE 00:B09E: 41        .byte $41   ; 
- D 1 - I - 0x0030AF 00:B09F: 37        .byte $37   ; 
- D 1 - I - 0x0030B0 00:B0A0: 7B        .byte $7B   ; 
- D 1 - I - 0x0030B1 00:B0A1: 50        .byte $50   ; 
- D 1 - I - 0x0030B2 00:B0A2: 50        .byte $50   ; 
- D 1 - I - 0x0030B3 00:B0A3: 4E        .byte $4E   ; 
- D 1 - I - 0x0030B4 00:B0A4: 4E        .byte $4E   ; 
- D 1 - I - 0x0030B5 00:B0A5: 40        .byte $40   ; 
- D 1 - I - 0x0030B6 00:B0A6: 40        .byte $40   ; 
- D 1 - I - 0x0030B7 00:B0A7: 3F        .byte $3F   ; 
- D 1 - I - 0x0030B8 00:B0A8: 7A        .byte $7A   ; 
- D 1 - I - 0x0030B9 00:B0A9: 40        .byte $40   ; 
- D 1 - I - 0x0030BA 00:B0AA: 40        .byte $40   ; 
- D 1 - I - 0x0030BB 00:B0AB: 7E        .byte $7E   ; 
- D 1 - I - 0x0030BC 00:B0AC: 35        .byte $35   ; 
- D 1 - I - 0x0030BD 00:B0AD: 4F        .byte $4F   ; 
- D 1 - I - 0x0030BE 00:B0AE: E4        .byte $E4   ; 
- D 1 - I - 0x0030BF 00:B0AF: 41        .byte $41   ; 
- D 1 - I - 0x0030C0 00:B0B0: 41        .byte $41   ; 
- D 1 - I - 0x0030C1 00:B0B1: 47        .byte $47   ; 
- D 1 - I - 0x0030C2 00:B0B2: EF        .byte $EF   ; 
- D 1 - I - 0x0030C3 00:B0B3: EB        .byte $EB   ; 
- D 1 - I - 0x0030C4 00:B0B4: EB        .byte $EB   ; 
- D 1 - I - 0x0030C5 00:B0B5: EB        .byte $EB   ; 
- D 1 - I - 0x0030C6 00:B0B6: D6        .byte $D6   ; 
- D 1 - I - 0x0030C7 00:B0B7: 00        .byte $00   ; 
- D 1 - I - 0x0030C8 00:B0B8: 00        .byte $00   ; 
- D 1 - I - 0x0030C9 00:B0B9: 00        .byte $00   ; 
- D 1 - I - 0x0030CA 00:B0BA: 00        .byte $00   ; 
- D 1 - I - 0x0030CB 00:B0BB: 00        .byte $00   ; 
- D 1 - I - 0x0030CC 00:B0BC: 00        .byte $00   ; 
- D 1 - I - 0x0030CD 00:B0BD: 00        .byte $00   ; 
- D 1 - I - 0x0030CE 00:B0BE: 00        .byte $00   ; 
- D 1 - I - 0x0030CF 00:B0BF: 3A        .byte $3A   ; 
- D 1 - I - 0x0030D0 00:B0C0: 41        .byte $41   ; 
- D 1 - I - 0x0030D1 00:B0C1: 41        .byte $41   ; 
- D 1 - I - 0x0030D2 00:B0C2: 41        .byte $41   ; 
- D 1 - I - 0x0030D3 00:B0C3: 3B        .byte $3B   ; 
- D 1 - I - 0x0030D4 00:B0C4: 41        .byte $41   ; 
- D 1 - I - 0x0030D5 00:B0C5: 41        .byte $41   ; 
- D 1 - I - 0x0030D6 00:B0C6: 41        .byte $41   ; 
- D 1 - I - 0x0030D7 00:B0C7: 3B        .byte $3B   ; 
- D 1 - I - 0x0030D8 00:B0C8: 41        .byte $41   ; 
- D 1 - I - 0x0030D9 00:B0C9: 41        .byte $41   ; 
- D 1 - I - 0x0030DA 00:B0CA: 41        .byte $41   ; 
- D 1 - I - 0x0030DB 00:B0CB: 3B        .byte $3B   ; 
- D 1 - I - 0x0030DC 00:B0CC: 41        .byte $41   ; 
- D 1 - I - 0x0030DD 00:B0CD: 41        .byte $41   ; 
- D 1 - I - 0x0030DE 00:B0CE: 41        .byte $41   ; 
- D 1 - I - 0x0030DF 00:B0CF: 41        .byte $41   ; 
- D 1 - I - 0x0030E0 00:B0D0: 41        .byte $41   ; 
- D 1 - I - 0x0030E1 00:B0D1: 41        .byte $41   ; 
- D 1 - I - 0x0030E2 00:B0D2: 3D        .byte $3D   ; 
- D 1 - I - 0x0030E3 00:B0D3: 41        .byte $41   ; 
- D 1 - I - 0x0030E4 00:B0D4: 41        .byte $41   ; 
- D 1 - I - 0x0030E5 00:B0D5: 41        .byte $41   ; 
- D 1 - I - 0x0030E6 00:B0D6: E9        .byte $E9   ; 
- D 1 - I - 0x0030E7 00:B0D7: 41        .byte $41   ; 
- D 1 - I - 0x0030E8 00:B0D8: 41        .byte $41   ; 
- D 1 - I - 0x0030E9 00:B0D9: 3D        .byte $3D   ; 
- D 1 - I - 0x0030EA 00:B0DA: 3E        .byte $3E   ; 
- D 1 - I - 0x0030EB 00:B0DB: 41        .byte $41   ; 
- D 1 - I - 0x0030EC 00:B0DC: 41        .byte $41   ; 
- D 1 - I - 0x0030ED 00:B0DD: E9        .byte $E9   ; 
- D 1 - I - 0x0030EE 00:B0DE: 41        .byte $41   ; 
- D 1 - I - 0x0030EF 00:B0DF: 30        .byte $30   ; 
- D 1 - I - 0x0030F0 00:B0E0: 00        .byte $00   ; 
- D 1 - I - 0x0030F1 00:B0E1: 4E        .byte $4E   ; 
- D 1 - I - 0x0030F2 00:B0E2: 32        .byte $32   ; 
- D 1 - I - 0x0030F3 00:B0E3: 81        .byte $81   ; 
- D 1 - I - 0x0030F4 00:B0E4: 00        .byte $00   ; 
- D 1 - I - 0x0030F5 00:B0E5: 7A        .byte $7A   ; 
- D 1 - I - 0x0030F6 00:B0E6: 4C        .byte $4C   ; 
- D 1 - I - 0x0030F7 00:B0E7: 31        .byte $31   ; 
- D 1 - I - 0x0030F8 00:B0E8: 00        .byte $00   ; 
- D 1 - I - 0x0030F9 00:B0E9: 35        .byte $35   ; 
- D 1 - I - 0x0030FA 00:B0EA: 4D        .byte $4D   ; 
- D 1 - I - 0x0030FB 00:B0EB: 41        .byte $41   ; 
- D 1 - I - 0x0030FC 00:B0EC: 7F        .byte $7F   ; 
- D 1 - I - 0x0030FD 00:B0ED: 00        .byte $00   ; 
- D 1 - I - 0x0030FE 00:B0EE: 4F        .byte $4F   ; 
- D 1 - I - 0x0030FF 00:B0EF: 41        .byte $41   ; 
- D 1 - I - 0x003100 00:B0F0: 41        .byte $41   ; 
- D 1 - I - 0x003101 00:B0F1: 48        .byte $48   ; 
- D 1 - I - 0x003102 00:B0F2: 90        .byte $90   ; 
- D 1 - I - 0x003103 00:B0F3: EB        .byte $EB   ; 
- D 1 - I - 0x003104 00:B0F4: EB        .byte $EB   ; 
- D 1 - I - 0x003105 00:B0F5: EB        .byte $EB   ; 
- D 1 - I - 0x003106 00:B0F6: 91        .byte $91   ; 
- D 1 - I - 0x003107 00:B0F7: 00        .byte $00   ; 
- D 1 - I - 0x003108 00:B0F8: 00        .byte $00   ; 
- D 1 - I - 0x003109 00:B0F9: 00        .byte $00   ; 
- D 1 - I - 0x00310A 00:B0FA: 00        .byte $00   ; 
- D 1 - I - 0x00310B 00:B0FB: 00        .byte $00   ; 
- D 1 - I - 0x00310C 00:B0FC: 00        .byte $00   ; 
- D 1 - I - 0x00310D 00:B0FD: 00        .byte $00   ; 
- D 1 - I - 0x00310E 00:B0FE: 00        .byte $00   ; 
- D 1 - I - 0x00310F 00:B0FF: 3C        .byte $3C   ; 
- D 1 - I - 0x003110 00:B100: 41        .byte $41   ; 
- D 1 - I - 0x003111 00:B101: 41        .byte $41   ; 
- D 1 - I - 0x003112 00:B102: 41        .byte $41   ; 
- D 1 - I - 0x003113 00:B103: 3C        .byte $3C   ; 
- D 1 - I - 0x003114 00:B104: 41        .byte $41   ; 
- D 1 - I - 0x003115 00:B105: 41        .byte $41   ; 
- D 1 - I - 0x003116 00:B106: 41        .byte $41   ; 
- D 1 - I - 0x003117 00:B107: 3C        .byte $3C   ; 
- D 1 - I - 0x003118 00:B108: 41        .byte $41   ; 
- D 1 - I - 0x003119 00:B109: 41        .byte $41   ; 
- D 1 - I - 0x00311A 00:B10A: 41        .byte $41   ; 
- D 1 - I - 0x00311B 00:B10B: EA        .byte $EA   ; 
- D 1 - I - 0x00311C 00:B10C: EB        .byte $EB   ; 
- D 1 - I - 0x00311D 00:B10D: EB        .byte $EB   ; 
- D 1 - I - 0x00311E 00:B10E: EB        .byte $EB   ; 
- D 1 - I - 0x00311F 00:B10F: 41        .byte $41   ; 
- D 1 - I - 0x003120 00:B110: 3D        .byte $3D   ; 
- D 1 - I - 0x003121 00:B111: 3E        .byte $3E   ; 
- D 1 - I - 0x003122 00:B112: 41        .byte $41   ; 
- D 1 - I - 0x003123 00:B113: 41        .byte $41   ; 
- D 1 - I - 0x003124 00:B114: E9        .byte $E9   ; 
- D 1 - I - 0x003125 00:B115: 41        .byte $41   ; 
- D 1 - I - 0x003126 00:B116: 41        .byte $41   ; 
- D 1 - I - 0x003127 00:B117: 3D        .byte $3D   ; 
- D 1 - I - 0x003128 00:B118: 3E        .byte $3E   ; 
- D 1 - I - 0x003129 00:B119: 41        .byte $41   ; 
- D 1 - I - 0x00312A 00:B11A: 41        .byte $41   ; 
- D 1 - I - 0x00312B 00:B11B: EC        .byte $EC   ; 
- D 1 - I - 0x00312C 00:B11C: EB        .byte $EB   ; 
- D 1 - I - 0x00312D 00:B11D: EB        .byte $EB   ; 
- D 1 - I - 0x00312E 00:B11E: EB        .byte $EB   ; 
- D 1 - I - 0x00312F 00:B11F: 41        .byte $41   ; 
- D 1 - I - 0x003130 00:B120: 80        .byte $80   ; 
- D 1 - I - 0x003131 00:B121: 3F        .byte $3F   ; 
- D 1 - I - 0x003132 00:B122: 4E        .byte $4E   ; 
- D 1 - I - 0x003133 00:B123: 41        .byte $41   ; 
- D 1 - I - 0x003134 00:B124: 81        .byte $81   ; 
- D 1 - I - 0x003135 00:B125: 00        .byte $00   ; 
- D 1 - I - 0x003136 00:B126: 35        .byte $35   ; 
- D 1 - I - 0x003137 00:B127: 41        .byte $41   ; 
- D 1 - I - 0x003138 00:B128: 31        .byte $31   ; 
- D 1 - I - 0x003139 00:B129: 3F        .byte $3F   ; 
- D 1 - I - 0x00313A 00:B12A: 00        .byte $00   ; 
- D 1 - I - 0x00313B 00:B12B: EB        .byte $EB   ; 
- D 1 - I - 0x00313C 00:B12C: EB        .byte $EB   ; 
- D 1 - I - 0x00313D 00:B12D: 7D        .byte $7D   ; 
- D 1 - I - 0x00313E 00:B12E: 00        .byte $00   ; 
- D 1 - I - 0x00313F 00:B12F: 05        .byte $05   ; 
- D 1 - I - 0x003140 00:B130: 06        .byte $06   ; 
- D 1 - I - 0x003141 00:B131: 06        .byte $06   ; 
- D 1 - I - 0x003142 00:B132: 5D        .byte $5D   ; 
- D 1 - I - 0x003143 00:B133: 07        .byte $07   ; 
- D 1 - I - 0x003144 00:B134: 08        .byte $08   ; 
- D 1 - I - 0x003145 00:B135: 5E        .byte $5E   ; 
- D 1 - I - 0x003146 00:B136: 55        .byte $55   ; 
- D 1 - I - 0x003147 00:B137: 07        .byte $07   ; 
- D 1 - I - 0x003148 00:B138: 5E        .byte $5E   ; 
- D 1 - I - 0x003149 00:B139: 08        .byte $08   ; 
- D 1 - I - 0x00314A 00:B13A: 55        .byte $55   ; 
- D 1 - I - 0x00314B 00:B13B: 60        .byte $60   ; 
- D 1 - I - 0x00314C 00:B13C: 65        .byte $65   ; 
- D 1 - I - 0x00314D 00:B13D: 65        .byte $65   ; 
- D 1 - I - 0x00314E 00:B13E: 55        .byte $55   ; 
- D 1 - I - 0x00314F 00:B13F: 40        .byte $40   ; 
- D 1 - I - 0x003150 00:B140: 40        .byte $40   ; 
- D 1 - I - 0x003151 00:B141: 4A        .byte $4A   ; 
- D 1 - I - 0x003152 00:B142: 37        .byte $37   ; 
- D 1 - I - 0x003153 00:B143: 40        .byte $40   ; 
- D 1 - I - 0x003154 00:B144: 40        .byte $40   ; 
- D 1 - I - 0x003155 00:B145: 40        .byte $40   ; 
- D 1 - I - 0x003156 00:B146: 37        .byte $37   ; 
- D 1 - I - 0x003157 00:B147: 42        .byte $42   ; 
- D 1 - I - 0x003158 00:B148: 43        .byte $43   ; 
- D 1 - I - 0x003159 00:B149: 42        .byte $42   ; 
- D 1 - I - 0x00315A 00:B14A: 43        .byte $43   ; 
- D 1 - I - 0x00315B 00:B14B: 40        .byte $40   ; 
- D 1 - I - 0x00315C 00:B14C: 40        .byte $40   ; 
- D 1 - I - 0x00315D 00:B14D: 40        .byte $40   ; 
- D 1 - I - 0x00315E 00:B14E: 40        .byte $40   ; 
- D 1 - I - 0x00315F 00:B14F: 00        .byte $00   ; 
- D 1 - I - 0x003160 00:B150: 00        .byte $00   ; 
- D 1 - I - 0x003161 00:B151: 08        .byte $08   ; 
- D 1 - I - 0x003162 00:B152: 5F        .byte $5F   ; 
- D 1 - I - 0x003163 00:B153: 82        .byte $82   ; 
- D 1 - I - 0x003164 00:B154: 00        .byte $00   ; 
- D 1 - I - 0x003165 00:B155: 11        .byte $11   ; 
- D 1 - I - 0x003166 00:B156: 55        .byte $55   ; 
- D 1 - I - 0x003167 00:B157: 42        .byte $42   ; 
- D 1 - I - 0x003168 00:B158: ED        .byte $ED   ; 
- D 1 - I - 0x003169 00:B159: 4B        .byte $4B   ; 
- D 1 - I - 0x00316A 00:B15A: 43        .byte $43   ; 
- D 1 - I - 0x00316B 00:B15B: 40        .byte $40   ; 
- D 1 - I - 0x00316C 00:B15C: EE        .byte $EE   ; 
- D 1 - I - 0x00316D 00:B15D: 84        .byte $84   ; 
- D 1 - I - 0x00316E 00:B15E: 40        .byte $40   ; 
- D 1 - I - 0x00316F 00:B15F: 07        .byte $07   ; 
- D 1 - I - 0x003170 00:B160: 5E        .byte $5E   ; 
- D 1 - I - 0x003171 00:B161: 08        .byte $08   ; 
- D 1 - I - 0x003172 00:B162: 5F        .byte $5F   ; 
- D 1 - I - 0x003173 00:B163: 65        .byte $65   ; 
- D 1 - I - 0x003174 00:B164: 65        .byte $65   ; 
- D 1 - I - 0x003175 00:B165: 65        .byte $65   ; 
- D 1 - I - 0x003176 00:B166: 55        .byte $55   ; 
- D 1 - I - 0x003177 00:B167: 43        .byte $43   ; 
- D 1 - I - 0x003178 00:B168: 42        .byte $42   ; 
- D 1 - I - 0x003179 00:B169: 43        .byte $43   ; 
- D 1 - I - 0x00317A 00:B16A: 42        .byte $42   ; 
- D 1 - I - 0x00317B 00:B16B: 40        .byte $40   ; 
- D 1 - I - 0x00317C 00:B16C: 40        .byte $40   ; 
- D 1 - I - 0x00317D 00:B16D: 40        .byte $40   ; 
- D 1 - I - 0x00317E 00:B16E: 40        .byte $40   ; 
- D 1 - I - 0x00317F 00:B16F: 07        .byte $07   ; 
- D 1 - I - 0x003180 00:B170: 5E        .byte $5E   ; 
- D 1 - I - 0x003181 00:B171: 08        .byte $08   ; 
- D 1 - I - 0x003182 00:B172: 5F        .byte $5F   ; 
- D 1 - I - 0x003183 00:B173: 60        .byte $60   ; 
- D 1 - I - 0x003184 00:B174: 65        .byte $65   ; 
- D 1 - I - 0x003185 00:B175: 65        .byte $65   ; 
- D 1 - I - 0x003186 00:B176: 55        .byte $55   ; 
- D 1 - I - 0x003187 00:B177: 05        .byte $05   ; 
- D 1 - I - 0x003188 00:B178: 66        .byte $66   ; 
- D 1 - I - 0x003189 00:B179: 14        .byte $14   ; 
- D 1 - I - 0x00318A 00:B17A: 5D        .byte $5D   ; 
- D 1 - I - 0x00318B 00:B17B: 67        .byte $67   ; 
- D 1 - I - 0x00318C 00:B17C: 68        .byte $68   ; 
- D 1 - I - 0x00318D 00:B17D: 69        .byte $69   ; 
- D 1 - I - 0x00318E 00:B17E: 6A        .byte $6A   ; 
- D 1 - I - 0x00318F 00:B17F: 40        .byte $40   ; 
- D 1 - I - 0x003190 00:B180: 40        .byte $40   ; 
- D 1 - I - 0x003191 00:B181: 40        .byte $40   ; 
- D 1 - I - 0x003192 00:B182: 40        .byte $40   ; 
- D 1 - I - 0x003193 00:B183: 40        .byte $40   ; 
- D 1 - I - 0x003194 00:B184: 40        .byte $40   ; 
- D 1 - I - 0x003195 00:B185: 4C        .byte $4C   ; 
- D 1 - I - 0x003196 00:B186: E4        .byte $E4   ; 
- D 1 - I - 0x003197 00:B187: 44        .byte $44   ; 
- D 1 - I - 0x003198 00:B188: 45        .byte $45   ; 
- D 1 - I - 0x003199 00:B189: 44        .byte $44   ; 
- D 1 - I - 0x00319A 00:B18A: 44        .byte $44   ; 
- D 1 - I - 0x00319B 00:B18B: 41        .byte $41   ; 
- D 1 - I - 0x00319C 00:B18C: 41        .byte $41   ; 
- D 1 - I - 0x00319D 00:B18D: 41        .byte $41   ; 
- D 1 - I - 0x00319E 00:B18E: 41        .byte $41   ; 
- D 1 - I - 0x00319F 00:B18F: 40        .byte $40   ; 
- D 1 - I - 0x0031A0 00:B190: EE        .byte $EE   ; 
- D 1 - I - 0x0031A1 00:B191: 5C        .byte $5C   ; 
- D 1 - I - 0x0031A2 00:B192: 85        .byte $85   ; 
- D 1 - I - 0x0031A3 00:B193: 40        .byte $40   ; 
- D 1 - I - 0x0031A4 00:B194: EE        .byte $EE   ; 
- D 1 - I - 0x0031A5 00:B195: D9        .byte $D9   ; 
- D 1 - I - 0x0031A6 00:B196: 84        .byte $84   ; 
- D 1 - I - 0x0031A7 00:B197: 44        .byte $44   ; 
- D 1 - I - 0x0031A8 00:B198: D7        .byte $D7   ; 
- D 1 - I - 0x0031A9 00:B199: 46        .byte $46   ; 
- D 1 - I - 0x0031AA 00:B19A: 5C        .byte $5C   ; 
- D 1 - I - 0x0031AB 00:B19B: 41        .byte $41   ; 
- D 1 - I - 0x0031AC 00:B19C: 41        .byte $41   ; 
- D 1 - I - 0x0031AD 00:B19D: D8        .byte $D8   ; 
- D 1 - I - 0x0031AE 00:B19E: D9        .byte $D9   ; 
- D 1 - I - 0x0031AF 00:B19F: 40        .byte $40   ; 
- D 1 - I - 0x0031B0 00:B1A0: 40        .byte $40   ; 
- D 1 - I - 0x0031B1 00:B1A1: 40        .byte $40   ; 
- D 1 - I - 0x0031B2 00:B1A2: 40        .byte $40   ; 
- D 1 - I - 0x0031B3 00:B1A3: 4C        .byte $4C   ; 
- D 1 - I - 0x0031B4 00:B1A4: 40        .byte $40   ; 
- D 1 - I - 0x0031B5 00:B1A5: 40        .byte $40   ; 
- D 1 - I - 0x0031B6 00:B1A6: 40        .byte $40   ; 
- D 1 - I - 0x0031B7 00:B1A7: 51        .byte $51   ; 
- D 1 - I - 0x0031B8 00:B1A8: 45        .byte $45   ; 
- D 1 - I - 0x0031B9 00:B1A9: 45        .byte $45   ; 
- D 1 - I - 0x0031BA 00:B1AA: 44        .byte $44   ; 
- D 1 - I - 0x0031BB 00:B1AB: 8A        .byte $8A   ; 
- D 1 - I - 0x0031BC 00:B1AC: 52        .byte $52   ; 
- D 1 - I - 0x0031BD 00:B1AD: 41        .byte $41   ; 
- D 1 - I - 0x0031BE 00:B1AE: 41        .byte $41   ; 
- D 1 - I - 0x0031BF 00:B1AF: 40        .byte $40   ; 
- D 1 - I - 0x0031C0 00:B1B0: 40        .byte $40   ; 
- D 1 - I - 0x0031C1 00:B1B1: 40        .byte $40   ; 
- D 1 - I - 0x0031C2 00:B1B2: 40        .byte $40   ; 
- D 1 - I - 0x0031C3 00:B1B3: 40        .byte $40   ; 
- D 1 - I - 0x0031C4 00:B1B4: 40        .byte $40   ; 
- D 1 - I - 0x0031C5 00:B1B5: 40        .byte $40   ; 
- D 1 - I - 0x0031C6 00:B1B6: 4C        .byte $4C   ; 
- D 1 - I - 0x0031C7 00:B1B7: 44        .byte $44   ; 
- D 1 - I - 0x0031C8 00:B1B8: 45        .byte $45   ; 
- D 1 - I - 0x0031C9 00:B1B9: 44        .byte $44   ; 
- D 1 - I - 0x0031CA 00:B1BA: 8B        .byte $8B   ; 
- D 1 - I - 0x0031CB 00:B1BB: 41        .byte $41   ; 
- D 1 - I - 0x0031CC 00:B1BC: 41        .byte $41   ; 
- D 1 - I - 0x0031CD 00:B1BD: 41        .byte $41   ; 
- D 1 - I - 0x0031CE 00:B1BE: 8C        .byte $8C   ; 
- D 1 - I - 0x0031CF 00:B1BF: 41        .byte $41   ; 
- D 1 - I - 0x0031D0 00:B1C0: 41        .byte $41   ; 
- D 1 - I - 0x0031D1 00:B1C1: 41        .byte $41   ; 
- D 1 - I - 0x0031D2 00:B1C2: 41        .byte $41   ; 
- D 1 - I - 0x0031D3 00:B1C3: EF        .byte $EF   ; 
- D 1 - I - 0x0031D4 00:B1C4: 41        .byte $41   ; 
- D 1 - I - 0x0031D5 00:B1C5: 41        .byte $41   ; 
- D 1 - I - 0x0031D6 00:B1C6: 41        .byte $41   ; 
- D 1 - I - 0x0031D7 00:B1C7: 47        .byte $47   ; 
- D 1 - I - 0x0031D8 00:B1C8: EF        .byte $EF   ; 
- D 1 - I - 0x0031D9 00:B1C9: 41        .byte $41   ; 
- D 1 - I - 0x0031DA 00:B1CA: 41        .byte $41   ; 
- D 1 - I - 0x0031DB 00:B1CB: 41        .byte $41   ; 
- D 1 - I - 0x0031DC 00:B1CC: 47        .byte $47   ; 
- D 1 - I - 0x0031DD 00:B1CD: EF        .byte $EF   ; 
- D 1 - I - 0x0031DE 00:B1CE: 41        .byte $41   ; 
- D 1 - I - 0x0031DF 00:B1CF: 41        .byte $41   ; 
- D 1 - I - 0x0031E0 00:B1D0: 41        .byte $41   ; 
- D 1 - I - 0x0031E1 00:B1D1: 48        .byte $48   ; 
- D 1 - I - 0x0031E2 00:B1D2: 46        .byte $46   ; 
- D 1 - I - 0x0031E3 00:B1D3: 41        .byte $41   ; 
- D 1 - I - 0x0031E4 00:B1D4: 41        .byte $41   ; 
- D 1 - I - 0x0031E5 00:B1D5: 41        .byte $41   ; 
- D 1 - I - 0x0031E6 00:B1D6: D8        .byte $D8   ; 
- D 1 - I - 0x0031E7 00:B1D7: 41        .byte $41   ; 
- D 1 - I - 0x0031E8 00:B1D8: 41        .byte $41   ; 
- D 1 - I - 0x0031E9 00:B1D9: 41        .byte $41   ; 
- D 1 - I - 0x0031EA 00:B1DA: 48        .byte $48   ; 
- D 1 - I - 0x0031EB 00:B1DB: 41        .byte $41   ; 
- D 1 - I - 0x0031EC 00:B1DC: 41        .byte $41   ; 
- D 1 - I - 0x0031ED 00:B1DD: 41        .byte $41   ; 
- D 1 - I - 0x0031EE 00:B1DE: 41        .byte $41   ; 
- D 1 - I - 0x0031EF 00:B1DF: 53        .byte $53   ; 
- D 1 - I - 0x0031F0 00:B1E0: 54        .byte $54   ; 
- D 1 - I - 0x0031F1 00:B1E1: 52        .byte $52   ; 
- D 1 - I - 0x0031F2 00:B1E2: 41        .byte $41   ; 
- D 1 - I - 0x0031F3 00:B1E3: D9        .byte $D9   ; 
- D 1 - I - 0x0031F4 00:B1E4: 8A        .byte $8A   ; 
- D 1 - I - 0x0031F5 00:B1E5: 00        .byte $00   ; 
- D 1 - I - 0x0031F6 00:B1E6: 52        .byte $52   ; 
- D 1 - I - 0x0031F7 00:B1E7: 46        .byte $46   ; 
- D 1 - I - 0x0031F8 00:B1E8: 53        .byte $53   ; 
- D 1 - I - 0x0031F9 00:B1E9: 54        .byte $54   ; 
- D 1 - I - 0x0031FA 00:B1EA: 00        .byte $00   ; 
- D 1 - I - 0x0031FB 00:B1EB: D8        .byte $D8   ; 
- D 1 - I - 0x0031FC 00:B1EC: D9        .byte $D9   ; 
- D 1 - I - 0x0031FD 00:B1ED: 8A        .byte $8A   ; 
- D 1 - I - 0x0031FE 00:B1EE: 00        .byte $00   ; 
- D 1 - I - 0x0031FF 00:B1EF: 41        .byte $41   ; 
- D 1 - I - 0x003200 00:B1F0: 41        .byte $41   ; 
- D 1 - I - 0x003201 00:B1F1: 41        .byte $41   ; 
- D 1 - I - 0x003202 00:B1F2: 8C        .byte $8C   ; 
- D 1 - I - 0x003203 00:B1F3: 41        .byte $41   ; 
- D 1 - I - 0x003204 00:B1F4: 41        .byte $41   ; 
- D 1 - I - 0x003205 00:B1F5: 41        .byte $41   ; 
- D 1 - I - 0x003206 00:B1F6: 8C        .byte $8C   ; 
- D 1 - I - 0x003207 00:B1F7: 52        .byte $52   ; 
- D 1 - I - 0x003208 00:B1F8: 41        .byte $41   ; 
- D 1 - I - 0x003209 00:B1F9: 41        .byte $41   ; 
- D 1 - I - 0x00320A 00:B1FA: 8C        .byte $8C   ; 
- D 1 - I - 0x00320B 00:B1FB: 00        .byte $00   ; 
- D 1 - I - 0x00320C 00:B1FC: 52        .byte $52   ; 
- D 1 - I - 0x00320D 00:B1FD: 41        .byte $41   ; 
- D 1 - I - 0x00320E 00:B1FE: 8C        .byte $8C   ; 
- D 1 - I - 0x00320F 00:B1FF: 41        .byte $41   ; 
- D 1 - I - 0x003210 00:B200: 41        .byte $41   ; 
- D 1 - I - 0x003211 00:B201: 47        .byte $47   ; 
- D 1 - I - 0x003212 00:B202: EF        .byte $EF   ; 
- D 1 - I - 0x003213 00:B203: 41        .byte $41   ; 
- D 1 - I - 0x003214 00:B204: 41        .byte $41   ; 
- D 1 - I - 0x003215 00:B205: 41        .byte $41   ; 
- D 1 - I - 0x003216 00:B206: 47        .byte $47   ; 
- D 1 - I - 0x003217 00:B207: 41        .byte $41   ; 
- D 1 - I - 0x003218 00:B208: 41        .byte $41   ; 
- D 1 - I - 0x003219 00:B209: 41        .byte $41   ; 
- D 1 - I - 0x00321A 00:B20A: 41        .byte $41   ; 
- D 1 - I - 0x00321B 00:B20B: 41        .byte $41   ; 
- D 1 - I - 0x00321C 00:B20C: 41        .byte $41   ; 
- D 1 - I - 0x00321D 00:B20D: 41        .byte $41   ; 
- D 1 - I - 0x00321E 00:B20E: 41        .byte $41   ; 
- - - - - - 0x00321F 00:B20F: 41        .byte $41   ; 
- - - - - - 0x003220 00:B210: 41        .byte $41   ; 
- - - - - - 0x003221 00:B211: 41        .byte $41   ; 
- - - - - - 0x003222 00:B212: 41        .byte $41   ; 
- - - - - - 0x003223 00:B213: EF        .byte $EF   ; 
- - - - - - 0x003224 00:B214: 41        .byte $41   ; 
- - - - - - 0x003225 00:B215: 41        .byte $41   ; 
- - - - - - 0x003226 00:B216: 41        .byte $41   ; 
- - - - - - 0x003227 00:B217: 47        .byte $47   ; 
- - - - - - 0x003228 00:B218: EF        .byte $EF   ; 
- - - - - - 0x003229 00:B219: 41        .byte $41   ; 
- - - - - - 0x00322A 00:B21A: 41        .byte $41   ; 
- - - - - - 0x00322B 00:B21B: 41        .byte $41   ; 
- - - - - - 0x00322C 00:B21C: 47        .byte $47   ; 
- - - - - - 0x00322D 00:B21D: EF        .byte $EF   ; 
- - - - - - 0x00322E 00:B21E: 41        .byte $41   ; 
- D 1 - I - 0x00322F 00:B21F: 48        .byte $48   ; 
- D 1 - I - 0x003230 00:B220: 46        .byte $46   ; 
- D 1 - I - 0x003231 00:B221: 53        .byte $53   ; 
- D 1 - I - 0x003232 00:B222: 54        .byte $54   ; 
- D 1 - I - 0x003233 00:B223: 41        .byte $41   ; 
- D 1 - I - 0x003234 00:B224: D8        .byte $D8   ; 
- D 1 - I - 0x003235 00:B225: D9        .byte $D9   ; 
- D 1 - I - 0x003236 00:B226: 8A        .byte $8A   ; 
- D 1 - I - 0x003237 00:B227: 41        .byte $41   ; 
- D 1 - I - 0x003238 00:B228: 48        .byte $48   ; 
- D 1 - I - 0x003239 00:B229: 46        .byte $46   ; 
- D 1 - I - 0x00323A 00:B22A: 8E        .byte $8E   ; 
- D 1 - I - 0x00323B 00:B22B: 41        .byte $41   ; 
- D 1 - I - 0x00323C 00:B22C: 41        .byte $41   ; 
- D 1 - I - 0x00323D 00:B22D: D8        .byte $D8   ; 
- D 1 - I - 0x00323E 00:B22E: 8F        .byte $8F   ; 
- D 1 - I - 0x00323F 00:B22F: 3F        .byte $3F   ; 
- D 1 - I - 0x003240 00:B230: 00        .byte $00   ; 
- D 1 - I - 0x003241 00:B231: 52        .byte $52   ; 
- D 1 - I - 0x003242 00:B232: 8C        .byte $8C   ; 
- D 1 - I - 0x003243 00:B233: 00        .byte $00   ; 
- D 1 - I - 0x003244 00:B234: 00        .byte $00   ; 
- D 1 - I - 0x003245 00:B235: 00        .byte $00   ; 
- D 1 - I - 0x003246 00:B236: 8D        .byte $8D   ; 
- D 1 - I - 0x003247 00:B237: 00        .byte $00   ; 
- D 1 - I - 0x003248 00:B238: 00        .byte $00   ; 
- D 1 - I - 0x003249 00:B239: 00        .byte $00   ; 
- D 1 - I - 0x00324A 00:B23A: 00        .byte $00   ; 
- D 1 - I - 0x00324B 00:B23B: 00        .byte $00   ; 
- D 1 - I - 0x00324C 00:B23C: 00        .byte $00   ; 
- D 1 - I - 0x00324D 00:B23D: 00        .byte $00   ; 
- D 1 - I - 0x00324E 00:B23E: 00        .byte $00   ; 
- D 1 - I - 0x00324F 00:B23F: 07        .byte $07   ; 
- D 1 - I - 0x003250 00:B240: 5E        .byte $5E   ; 
- D 1 - I - 0x003251 00:B241: 08        .byte $08   ; 
- D 1 - I - 0x003252 00:B242: 5F        .byte $5F   ; 
- D 1 - I - 0x003253 00:B243: 60        .byte $60   ; 
- D 1 - I - 0x003254 00:B244: 65        .byte $65   ; 
- D 1 - I - 0x003255 00:B245: 65        .byte $65   ; 
- D 1 - I - 0x003256 00:B246: 55        .byte $55   ; 
- D 1 - I - 0x003257 00:B247: 05        .byte $05   ; 
- D 1 - I - 0x003258 00:B248: 06        .byte $06   ; 
- D 1 - I - 0x003259 00:B249: 06        .byte $06   ; 
- D 1 - I - 0x00325A 00:B24A: 5D        .byte $5D   ; 
- D 1 - I - 0x00325B 00:B24B: 07        .byte $07   ; 
- D 1 - I - 0x00325C 00:B24C: 08        .byte $08   ; 
- D 1 - I - 0x00325D 00:B24D: 5E        .byte $5E   ; 
- D 1 - I - 0x00325E 00:B24E: 5F        .byte $5F   ; 
- D 1 - I - 0x00325F 00:B24F: 3F        .byte $3F   ; 
- D 1 - I - 0x003260 00:B250: 00        .byte $00   ; 
- D 1 - I - 0x003261 00:B251: 11        .byte $11   ; 
- D 1 - I - 0x003262 00:B252: 5D        .byte $5D   ; 
- D 1 - I - 0x003263 00:B253: 37        .byte $37   ; 
- D 1 - I - 0x003264 00:B254: 82        .byte $82   ; 
- D 1 - I - 0x003265 00:B255: 00        .byte $00   ; 
- D 1 - I - 0x003266 00:B256: 11        .byte $11   ; 
- D 1 - I - 0x003267 00:B257: 40        .byte $40   ; 
- D 1 - I - 0x003268 00:B258: 49        .byte $49   ; 
- D 1 - I - 0x003269 00:B259: 79        .byte $79   ; 
- D 1 - I - 0x00326A 00:B25A: 00        .byte $00   ; 
- D 1 - I - 0x00326B 00:B25B: 40        .byte $40   ; 
- D 1 - I - 0x00326C 00:B25C: 40        .byte $40   ; 
- D 1 - I - 0x00326D 00:B25D: 49        .byte $49   ; 
- D 1 - I - 0x00326E 00:B25E: 82        .byte $82   ; 
- D 1 - I - 0x00326F 00:B25F: 07        .byte $07   ; 
- D 1 - I - 0x003270 00:B260: 5E        .byte $5E   ; 
- D 1 - I - 0x003271 00:B261: 08        .byte $08   ; 
- D 1 - I - 0x003272 00:B262: 5F        .byte $5F   ; 
- D 1 - I - 0x003273 00:B263: 55        .byte $55   ; 
- D 1 - I - 0x003274 00:B264: 65        .byte $65   ; 
- D 1 - I - 0x003275 00:B265: 65        .byte $65   ; 
- D 1 - I - 0x003276 00:B266: 55        .byte $55   ; 
- D 1 - I - 0x003277 00:B267: 11        .byte $11   ; 
- D 1 - I - 0x003278 00:B268: 12        .byte $12   ; 
- D 1 - I - 0x003279 00:B269: 06        .byte $06   ; 
- D 1 - I - 0x00327A 00:B26A: 5D        .byte $5D   ; 
- D 1 - I - 0x00327B 00:B26B: 00        .byte $00   ; 
- D 1 - I - 0x00327C 00:B26C: 11        .byte $11   ; 
- D 1 - I - 0x00327D 00:B26D: 5E        .byte $5E   ; 
- D 1 - I - 0x00327E 00:B26E: 55        .byte $55   ; 
- D 1 - I - 0x00327F 00:B26F: 15        .byte $15   ; 
- D 1 - I - 0x003280 00:B270: 6B        .byte $6B   ; 
- D 1 - I - 0x003281 00:B271: 16        .byte $16   ; 
- D 1 - I - 0x003282 00:B272: 6C        .byte $6C   ; 
- D 1 - I - 0x003283 00:B273: 60        .byte $60   ; 
- D 1 - I - 0x003284 00:B274: 6D        .byte $6D   ; 
- D 1 - I - 0x003285 00:B275: 6E        .byte $6E   ; 
- D 1 - I - 0x003286 00:B276: 55        .byte $55   ; 
- D 1 - I - 0x003287 00:B277: 05        .byte $05   ; 
- D 1 - I - 0x003288 00:B278: 06        .byte $06   ; 
- D 1 - I - 0x003289 00:B279: 06        .byte $06   ; 
- D 1 - I - 0x00328A 00:B27A: 5D        .byte $5D   ; 
- D 1 - I - 0x00328B 00:B27B: 07        .byte $07   ; 
- D 1 - I - 0x00328C 00:B27C: 08        .byte $08   ; 
- D 1 - I - 0x00328D 00:B27D: 5E        .byte $5E   ; 
- D 1 - I - 0x00328E 00:B27E: 5F        .byte $5F   ; 
- D 1 - I - 0x00328F 00:B27F: 40        .byte $40   ; 
- D 1 - I - 0x003290 00:B280: 40        .byte $40   ; 
- D 1 - I - 0x003291 00:B281: 40        .byte $40   ; 
- D 1 - I - 0x003292 00:B282: 40        .byte $40   ; 
- D 1 - I - 0x003293 00:B283: 40        .byte $40   ; 
- D 1 - I - 0x003294 00:B284: 40        .byte $40   ; 
- D 1 - I - 0x003295 00:B285: 40        .byte $40   ; 
- D 1 - I - 0x003296 00:B286: 40        .byte $40   ; 
- D 1 - I - 0x003297 00:B287: 44        .byte $44   ; 
- D 1 - I - 0x003298 00:B288: 45        .byte $45   ; 
- D 1 - I - 0x003299 00:B289: 45        .byte $45   ; 
- D 1 - I - 0x00329A 00:B28A: 45        .byte $45   ; 
- D 1 - I - 0x00329B 00:B28B: 41        .byte $41   ; 
- D 1 - I - 0x00329C 00:B28C: 41        .byte $41   ; 
- D 1 - I - 0x00329D 00:B28D: 41        .byte $41   ; 
- D 1 - I - 0x00329E 00:B28E: 41        .byte $41   ; 
- D 1 - I - 0x00329F 00:B28F: 40        .byte $40   ; 
- D 1 - I - 0x0032A0 00:B290: 40        .byte $40   ; 
- D 1 - I - 0x0032A1 00:B291: 40        .byte $40   ; 
- D 1 - I - 0x0032A2 00:B292: 88        .byte $88   ; 
- D 1 - I - 0x0032A3 00:B293: 40        .byte $40   ; 
- D 1 - I - 0x0032A4 00:B294: 40        .byte $40   ; 
- D 1 - I - 0x0032A5 00:B295: 86        .byte $86   ; 
- D 1 - I - 0x0032A6 00:B296: 89        .byte $89   ; 
- D 1 - I - 0x0032A7 00:B297: 44        .byte $44   ; 
- D 1 - I - 0x0032A8 00:B298: 45        .byte $45   ; 
- D 1 - I - 0x0032A9 00:B299: 57        .byte $57   ; 
- D 1 - I - 0x0032AA 00:B29A: 72        .byte $72   ; 
- D 1 - I - 0x0032AB 00:B29B: 41        .byte $41   ; 
- D 1 - I - 0x0032AC 00:B29C: 41        .byte $41   ; 
- D 1 - I - 0x0032AD 00:B29D: 73        .byte $73   ; 
- D 1 - I - 0x0032AE 00:B29E: 75        .byte $75   ; 
- D 1 - I - 0x0032AF 00:B29F: 07        .byte $07   ; 
- D 1 - I - 0x0032B0 00:B2A0: 5E        .byte $5E   ; 
- D 1 - I - 0x0032B1 00:B2A1: 08        .byte $08   ; 
- D 1 - I - 0x0032B2 00:B2A2: 5F        .byte $5F   ; 
- D 1 - I - 0x0032B3 00:B2A3: 65        .byte $65   ; 
- D 1 - I - 0x0032B4 00:B2A4: 65        .byte $65   ; 
- D 1 - I - 0x0032B5 00:B2A5: 65        .byte $65   ; 
- D 1 - I - 0x0032B6 00:B2A6: 55        .byte $55   ; 
- D 1 - I - 0x0032B7 00:B2A7: 43        .byte $43   ; 
- D 1 - I - 0x0032B8 00:B2A8: 42        .byte $42   ; 
- D 1 - I - 0x0032B9 00:B2A9: 42        .byte $42   ; 
- D 1 - I - 0x0032BA 00:B2AA: 87        .byte $87   ; 
- D 1 - I - 0x0032BB 00:B2AB: 40        .byte $40   ; 
- D 1 - I - 0x0032BC 00:B2AC: 40        .byte $40   ; 
- D 1 - I - 0x0032BD 00:B2AD: 40        .byte $40   ; 
- D 1 - I - 0x0032BE 00:B2AE: 88        .byte $88   ; 
- D 1 - I - 0x0032BF 00:B2AF: 07        .byte $07   ; 
- D 1 - I - 0x0032C0 00:B2B0: 5E        .byte $5E   ; 
- D 1 - I - 0x0032C1 00:B2B1: 08        .byte $08   ; 
- D 1 - I - 0x0032C2 00:B2B2: 5F        .byte $5F   ; 
- D 1 - I - 0x0032C3 00:B2B3: 60        .byte $60   ; 
- D 1 - I - 0x0032C4 00:B2B4: 65        .byte $65   ; 
- D 1 - I - 0x0032C5 00:B2B5: 65        .byte $65   ; 
- D 1 - I - 0x0032C6 00:B2B6: 55        .byte $55   ; 
- D 1 - I - 0x0032C7 00:B2B7: 0F        .byte $0F   ; 
- D 1 - I - 0x0032C8 00:B2B8: 12        .byte $12   ; 
- D 1 - I - 0x0032C9 00:B2B9: 06        .byte $06   ; 
- D 1 - I - 0x0032CA 00:B2BA: 5D        .byte $5D   ; 
- D 1 - I - 0x0032CB 00:B2BB: 00        .byte $00   ; 
- D 1 - I - 0x0032CC 00:B2BC: 11        .byte $11   ; 
- D 1 - I - 0x0032CD 00:B2BD: 5E        .byte $5E   ; 
- D 1 - I - 0x0032CE 00:B2BE: 5F        .byte $5F   ; 
- D 1 - I - 0x0032CF 00:B2BF: 41        .byte $41   ; 
- D 1 - I - 0x0032D0 00:B2C0: 41        .byte $41   ; 
- D 1 - I - 0x0032D1 00:B2C1: 41        .byte $41   ; 
- D 1 - I - 0x0032D2 00:B2C2: 41        .byte $41   ; 
- D 1 - I - 0x0032D3 00:B2C3: 41        .byte $41   ; 
- D 1 - I - 0x0032D4 00:B2C4: 41        .byte $41   ; 
- D 1 - I - 0x0032D5 00:B2C5: 41        .byte $41   ; 
- D 1 - I - 0x0032D6 00:B2C6: 41        .byte $41   ; 
- D 1 - I - 0x0032D7 00:B2C7: 41        .byte $41   ; 
- D 1 - I - 0x0032D8 00:B2C8: 41        .byte $41   ; 
- D 1 - I - 0x0032D9 00:B2C9: 41        .byte $41   ; 
- D 1 - I - 0x0032DA 00:B2CA: 41        .byte $41   ; 
- D 1 - I - 0x0032DB 00:B2CB: 41        .byte $41   ; 
- D 1 - I - 0x0032DC 00:B2CC: 41        .byte $41   ; 
- D 1 - I - 0x0032DD 00:B2CD: 41        .byte $41   ; 
- D 1 - I - 0x0032DE 00:B2CE: 41        .byte $41   ; 
- D 1 - I - 0x0032DF 00:B2CF: 57        .byte $57   ; 
- D 1 - I - 0x0032E0 00:B2D0: 57        .byte $57   ; 
- D 1 - I - 0x0032E1 00:B2D1: 56        .byte $56   ; 
- D 1 - I - 0x0032E2 00:B2D2: 5F        .byte $5F   ; 
- D 1 - I - 0x0032E3 00:B2D3: 57        .byte $57   ; 
- D 1 - I - 0x0032E4 00:B2D4: 73        .byte $73   ; 
- D 1 - I - 0x0032E5 00:B2D5: 74        .byte $74   ; 
- D 1 - I - 0x0032E6 00:B2D6: 55        .byte $55   ; 
- D 1 - I - 0x0032E7 00:B2D7: 57        .byte $57   ; 
- D 1 - I - 0x0032E8 00:B2D8: 56        .byte $56   ; 
- D 1 - I - 0x0032E9 00:B2D9: 12        .byte $12   ; 
- D 1 - I - 0x0032EA 00:B2DA: 5D        .byte $5D   ; 
- D 1 - I - 0x0032EB 00:B2DB: 73        .byte $73   ; 
- D 1 - I - 0x0032EC 00:B2DC: 75        .byte $75   ; 
- D 1 - I - 0x0032ED 00:B2DD: 5E        .byte $5E   ; 
- D 1 - I - 0x0032EE 00:B2DE: 5F        .byte $5F   ; 
- D 1 - I - 0x0032EF 00:B2DF: 10        .byte $10   ; 
- D 1 - I - 0x0032F0 00:B2E0: 00        .byte $00   ; 
- D 1 - I - 0x0032F1 00:B2E1: 00        .byte $00   ; 
- D 1 - I - 0x0032F2 00:B2E2: 00        .byte $00   ; 
- D 1 - I - 0x0032F3 00:B2E3: 71        .byte $71   ; 
- D 1 - I - 0x0032F4 00:B2E4: 00        .byte $00   ; 
- D 1 - I - 0x0032F5 00:B2E5: 00        .byte $00   ; 
- D 1 - I - 0x0032F6 00:B2E6: 00        .byte $00   ; 
- D 1 - I - 0x0032F7 00:B2E7: 0F        .byte $0F   ; 
- D 1 - I - 0x0032F8 00:B2E8: 18        .byte $18   ; 
- D 1 - I - 0x0032F9 00:B2E9: 18        .byte $18   ; 
- D 1 - I - 0x0032FA 00:B2EA: 00        .byte $00   ; 
- D 1 - I - 0x0032FB 00:B2EB: 00        .byte $00   ; 
- D 1 - I - 0x0032FC 00:B2EC: 00        .byte $00   ; 
- D 1 - I - 0x0032FD 00:B2ED: 00        .byte $00   ; 
- D 1 - I - 0x0032FE 00:B2EE: 00        .byte $00   ; 
- D 1 - I - 0x0032FF 00:B2EF: 00        .byte $00   ; 
- D 1 - I - 0x003300 00:B2F0: 00        .byte $00   ; 
- D 1 - I - 0x003301 00:B2F1: 11        .byte $11   ; 
- D 1 - I - 0x003302 00:B2F2: 5F        .byte $5F   ; 
- D 1 - I - 0x003303 00:B2F3: 00        .byte $00   ; 
- D 1 - I - 0x003304 00:B2F4: 00        .byte $00   ; 
- D 1 - I - 0x003305 00:B2F5: 00        .byte $00   ; 
- D 1 - I - 0x003306 00:B2F6: 11        .byte $11   ; 
- D 1 - I - 0x003307 00:B2F7: 0F        .byte $0F   ; 
- D 1 - I - 0x003308 00:B2F8: 18        .byte $18   ; 
- D 1 - I - 0x003309 00:B2F9: 18        .byte $18   ; 
- D 1 - I - 0x00330A 00:B2FA: 00        .byte $00   ; 
- D 1 - I - 0x00330B 00:B2FB: 10        .byte $10   ; 
- D 1 - I - 0x00330C 00:B2FC: 00        .byte $00   ; 
- D 1 - I - 0x00330D 00:B2FD: 00        .byte $00   ; 
- D 1 - I - 0x00330E 00:B2FE: 00        .byte $00   ; 
- D 1 - I - 0x00330F 00:B2FF: 41        .byte $41   ; 
- D 1 - I - 0x003310 00:B300: 41        .byte $41   ; 
- D 1 - I - 0x003311 00:B301: 41        .byte $41   ; 
- D 1 - I - 0x003312 00:B302: 41        .byte $41   ; 
- D 1 - I - 0x003313 00:B303: EB        .byte $EB   ; 
- D 1 - I - 0x003314 00:B304: EB        .byte $EB   ; 
- D 1 - I - 0x003315 00:B305: EB        .byte $EB   ; 
- D 1 - I - 0x003316 00:B306: EB        .byte $EB   ; 
- D 1 - I - 0x003317 00:B307: 0F        .byte $0F   ; 
- D 1 - I - 0x003318 00:B308: 18        .byte $18   ; 
- D 1 - I - 0x003319 00:B309: 18        .byte $18   ; 
- D 1 - I - 0x00331A 00:B30A: 00        .byte $00   ; 
- D 1 - I - 0x00331B 00:B30B: 10        .byte $10   ; 
- D 1 - I - 0x00331C 00:B30C: 00        .byte $00   ; 
- D 1 - I - 0x00331D 00:B30D: 00        .byte $00   ; 
- D 1 - I - 0x00331E 00:B30E: 00        .byte $00   ; 
- D 1 - I - 0x00331F 00:B30F: 7C        .byte $7C   ; 
- D 1 - I - 0x003320 00:B310: 00        .byte $00   ; 
- D 1 - I - 0x003321 00:B311: 11        .byte $11   ; 
- D 1 - I - 0x003322 00:B312: 5F        .byte $5F   ; 
- D 1 - I - 0x003323 00:B313: 76        .byte $76   ; 
- D 1 - I - 0x003324 00:B314: 00        .byte $00   ; 
- D 1 - I - 0x003325 00:B315: 00        .byte $00   ; 
- D 1 - I - 0x003326 00:B316: 77        .byte $77   ; 
- D 1 - I - 0x003327 00:B317: 0F        .byte $0F   ; 
- D 1 - I - 0x003328 00:B318: 18        .byte $18   ; 
- D 1 - I - 0x003329 00:B319: 18        .byte $18   ; 
- D 1 - I - 0x00332A 00:B31A: 00        .byte $00   ; 
- D 1 - I - 0x00332B 00:B31B: 10        .byte $10   ; 
- D 1 - I - 0x00332C 00:B31C: 00        .byte $00   ; 
- D 1 - I - 0x00332D 00:B31D: 00        .byte $00   ; 
- D 1 - I - 0x00332E 00:B31E: 00        .byte $00   ; 
- D 1 - I - 0x00332F 00:B31F: 08        .byte $08   ; 
- D 1 - I - 0x003330 00:B320: 5E        .byte $5E   ; 
- D 1 - I - 0x003331 00:B321: 08        .byte $08   ; 
- D 1 - I - 0x003332 00:B322: 5F        .byte $5F   ; 
- D 1 - I - 0x003333 00:B323: 65        .byte $65   ; 
- D 1 - I - 0x003334 00:B324: 65        .byte $65   ; 
- D 1 - I - 0x003335 00:B325: 65        .byte $65   ; 
- D 1 - I - 0x003336 00:B326: 55        .byte $55   ; 
- D 1 - I - 0x003337 00:B327: 08        .byte $08   ; 
- D 1 - I - 0x003338 00:B328: 06        .byte $06   ; 
- D 1 - I - 0x003339 00:B329: 06        .byte $06   ; 
- D 1 - I - 0x00333A 00:B32A: 5D        .byte $5D   ; 
- D 1 - I - 0x00333B 00:B32B: 08        .byte $08   ; 
- D 1 - I - 0x00333C 00:B32C: 08        .byte $08   ; 
- D 1 - I - 0x00333D 00:B32D: 5E        .byte $5E   ; 
- D 1 - I - 0x00333E 00:B32E: 5F        .byte $5F   ; 
- D 1 - I - 0x00333F 00:B32F: 13        .byte $13   ; 
- D 1 - I - 0x003340 00:B330: 13        .byte $13   ; 
- D 1 - I - 0x003341 00:B331: 13        .byte $13   ; 
- D 1 - I - 0x003342 00:B332: 13        .byte $13   ; 
- D 1 - I - 0x003343 00:B333: 78        .byte $78   ; 
- D 1 - I - 0x003344 00:B334: 78        .byte $78   ; 
- D 1 - I - 0x003345 00:B335: 78        .byte $78   ; 
- D 1 - I - 0x003346 00:B336: 78        .byte $78   ; 
- D 1 - I - 0x003347 00:B337: 07        .byte $07   ; 
- D 1 - I - 0x003348 00:B338: 5E        .byte $5E   ; 
- D 1 - I - 0x003349 00:B339: 08        .byte $08   ; 
- D 1 - I - 0x00334A 00:B33A: 5F        .byte $5F   ; 
- D 1 - I - 0x00334B 00:B33B: 60        .byte $60   ; 
- D 1 - I - 0x00334C 00:B33C: 65        .byte $65   ; 
- D 1 - I - 0x00334D 00:B33D: 65        .byte $65   ; 
- D 1 - I - 0x00334E 00:B33E: 55        .byte $55   ; 
- D 1 - I - 0x00334F 00:B33F: 01        .byte $01   ; 
- D 1 - I - 0x003350 00:B340: 02        .byte $02   ; 
- D 1 - I - 0x003351 00:B341: 02        .byte $02   ; 
- D 1 - I - 0x003352 00:B342: 61        .byte $61   ; 
- D 1 - I - 0x003353 00:B343: 62        .byte $62   ; 
- D 1 - I - 0x003354 00:B344: 63        .byte $63   ; 
- D 1 - I - 0x003355 00:B345: 63        .byte $63   ; 
- D 1 - I - 0x003356 00:B346: 64        .byte $64   ; 
- D 1 - I - 0x003357 00:B347: 01        .byte $01   ; 
- D 1 - I - 0x003358 00:B348: 02        .byte $02   ; 
- D 1 - I - 0x003359 00:B349: 02        .byte $02   ; 
- D 1 - I - 0x00335A 00:B34A: 61        .byte $61   ; 
- D 1 - I - 0x00335B 00:B34B: 62        .byte $62   ; 
- D 1 - I - 0x00335C 00:B34C: 63        .byte $63   ; 
- D 1 - I - 0x00335D 00:B34D: 63        .byte $63   ; 
- D 1 - I - 0x00335E 00:B34E: 64        .byte $64   ; 
- D 1 - I - 0x00335F 00:B34F: 01        .byte $01   ; 
- D 1 - I - 0x003360 00:B350: 02        .byte $02   ; 
- D 1 - I - 0x003361 00:B351: 2A        .byte $2A   ; 
- D 1 - I - 0x003362 00:B352: E3        .byte $E3   ; 
- D 1 - I - 0x003363 00:B353: 62        .byte $62   ; 
- D 1 - I - 0x003364 00:B354: 63        .byte $63   ; 
- D 1 - I - 0x003365 00:B355: A7        .byte $A7   ; 
- D 1 - I - 0x003366 00:B356: A8        .byte $A8   ; 
- D 1 - I - 0x003367 00:B357: 01        .byte $01   ; 
- D 1 - I - 0x003368 00:B358: 02        .byte $02   ; 
- D 1 - I - 0x003369 00:B359: 1B        .byte $1B   ; 
- D 1 - I - 0x00336A 00:B35A: 1C        .byte $1C   ; 
- D 1 - I - 0x00336B 00:B35B: 62        .byte $62   ; 
- D 1 - I - 0x00336C 00:B35C: 63        .byte $63   ; 
- D 1 - I - 0x00336D 00:B35D: AE        .byte $AE   ; 
- D 1 - I - 0x00336E 00:B35E: AF        .byte $AF   ; 
- D 1 - I - 0x00336F 00:B35F: 2B        .byte $2B   ; 
- D 1 - I - 0x003370 00:B360: 2A        .byte $2A   ; 
- D 1 - I - 0x003371 00:B361: 1A        .byte $1A   ; 
- D 1 - I - 0x003372 00:B362: BE        .byte $BE   ; 
- D 1 - I - 0x003373 00:B363: A8        .byte $A8   ; 
- D 1 - I - 0x003374 00:B364: A9        .byte $A9   ; 
- D 1 - I - 0x003375 00:B365: BF        .byte $BF   ; 
- D 1 - I - 0x003376 00:B366: C0        .byte $C0   ; 
- D 1 - I - 0x003377 00:B367: 1C        .byte $1C   ; 
- D 1 - I - 0x003378 00:B368: AC        .byte $AC   ; 
- D 1 - I - 0x003379 00:B369: 23        .byte $23   ; 
- D 1 - I - 0x00337A 00:B36A: C3        .byte $C3   ; 
- D 1 - I - 0x00337B 00:B36B: AF        .byte $AF   ; 
- D 1 - I - 0x00337C 00:B36C: C5        .byte $C5   ; 
- D 1 - I - 0x00337D 00:B36D: C6        .byte $C6   ; 
- D 1 - I - 0x00337E 00:B36E: C7        .byte $C7   ; 
- D 1 - I - 0x00337F 00:B36F: 22        .byte $22   ; 
- D 1 - I - 0x003380 00:B370: A6        .byte $A6   ; 
- D 1 - I - 0x003381 00:B371: 2A        .byte $2A   ; 
- D 1 - I - 0x003382 00:B372: E3        .byte $E3   ; 
- D 1 - I - 0x003383 00:B373: C1        .byte $C1   ; 
- D 1 - I - 0x003384 00:B374: C2        .byte $C2   ; 
- D 1 - I - 0x003385 00:B375: AA        .byte $AA   ; 
- D 1 - I - 0x003386 00:B376: A8        .byte $A8   ; 
- D 1 - I - 0x003387 00:B377: 24        .byte $24   ; 
- D 1 - I - 0x003388 00:B378: C4        .byte $C4   ; 
- D 1 - I - 0x003389 00:B379: 1D        .byte $1D   ; 
- D 1 - I - 0x00338A 00:B37A: 1C        .byte $1C   ; 
- D 1 - I - 0x00338B 00:B37B: C8        .byte $C8   ; 
- D 1 - I - 0x00338C 00:B37C: C9        .byte $C9   ; 
- D 1 - I - 0x00338D 00:B37D: CA        .byte $CA   ; 
- D 1 - I - 0x00338E 00:B37E: AF        .byte $AF   ; 
- D 1 - I - 0x00338F 00:B37F: 2B        .byte $2B   ; 
- D 1 - I - 0x003390 00:B380: 2A        .byte $2A   ; 
- D 1 - I - 0x003391 00:B381: 02        .byte $02   ; 
- D 1 - I - 0x003392 00:B382: 61        .byte $61   ; 
- D 1 - I - 0x003393 00:B383: A8        .byte $A8   ; 
- D 1 - I - 0x003394 00:B384: AB        .byte $AB   ; 
- D 1 - I - 0x003395 00:B385: 63        .byte $63   ; 
- D 1 - I - 0x003396 00:B386: 64        .byte $64   ; 
- D 1 - I - 0x003397 00:B387: 1C        .byte $1C   ; 
- D 1 - I - 0x003398 00:B388: AD        .byte $AD   ; 
- D 1 - I - 0x003399 00:B389: 03        .byte $03   ; 
- D 1 - I - 0x00339A 00:B38A: 61        .byte $61   ; 
- D 1 - I - 0x00339B 00:B38B: AF        .byte $AF   ; 
- D 1 - I - 0x00339C 00:B38C: B0        .byte $B0   ; 
- D 1 - I - 0x00339D 00:B38D: 00        .byte $00   ; 
- D 1 - I - 0x00339E 00:B38E: 64        .byte $64   ; 
- D 1 - I - 0x00339F 00:B38F: 01        .byte $01   ; 
- D 1 - I - 0x0033A0 00:B390: 02        .byte $02   ; 
- D 1 - I - 0x0033A1 00:B391: 1E        .byte $1E   ; 
- D 1 - I - 0x0033A2 00:B392: 1F        .byte $1F   ; 
- D 1 - I - 0x0033A3 00:B393: 62        .byte $62   ; 
- D 1 - I - 0x0033A4 00:B394: 63        .byte $63   ; 
- D 1 - I - 0x0033A5 00:B395: B2        .byte $B2   ; 
- D 1 - I - 0x0033A6 00:B396: B3        .byte $B3   ; 
- D 1 - I - 0x0033A7 00:B397: 01        .byte $01   ; 
- D 1 - I - 0x0033A8 00:B398: 02        .byte $02   ; 
- D 1 - I - 0x0033A9 00:B399: 20        .byte $20   ; 
- D 1 - I - 0x0033AA 00:B39A: 21        .byte $21   ; 
- D 1 - I - 0x0033AB 00:B39B: 62        .byte $62   ; 
- D 1 - I - 0x0033AC 00:B39C: 63        .byte $63   ; 
- D 1 - I - 0x0033AD 00:B39D: B8        .byte $B8   ; 
- D 1 - I - 0x0033AE 00:B39E: B9        .byte $B9   ; 
- D 1 - I - 0x0033AF 00:B39F: 1F        .byte $1F   ; 
- D 1 - I - 0x0033B0 00:B3A0: CB        .byte $CB   ; 
- D 1 - I - 0x0033B1 00:B3A1: 25        .byte $25   ; 
- D 1 - I - 0x0033B2 00:B3A2: CC        .byte $CC   ; 
- D 1 - I - 0x0033B3 00:B3A3: B3        .byte $B3   ; 
- D 1 - I - 0x0033B4 00:B3A4: B4        .byte $B4   ; 
- D 1 - I - 0x0033B5 00:B3A5: CE        .byte $CE   ; 
- D 1 - I - 0x0033B6 00:B3A6: CF        .byte $CF   ; 
- D 1 - I - 0x0033B7 00:B3A7: 21        .byte $21   ; 
- D 1 - I - 0x0033B8 00:B3A8: 21        .byte $21   ; 
- D 1 - I - 0x0033B9 00:B3A9: 28        .byte $28   ; 
- D 1 - I - 0x0033BA 00:B3AA: D2        .byte $D2   ; 
- D 1 - I - 0x0033BB 00:B3AB: BA        .byte $BA   ; 
- D 1 - I - 0x0033BC 00:B3AC: BB        .byte $BB   ; 
- D 1 - I - 0x0033BD 00:B3AD: BA        .byte $BA   ; 
- D 1 - I - 0x0033BE 00:B3AE: BB        .byte $BB   ; 
- D 1 - I - 0x0033BF 00:B3AF: 26        .byte $26   ; 
- D 1 - I - 0x0033C0 00:B3B0: CD        .byte $CD   ; 
- D 1 - I - 0x0033C1 00:B3B1: 27        .byte $27   ; 
- D 1 - I - 0x0033C2 00:B3B2: 1F        .byte $1F   ; 
- D 1 - I - 0x0033C3 00:B3B3: D0        .byte $D0   ; 
- D 1 - I - 0x0033C4 00:B3B4: D1        .byte $D1   ; 
- D 1 - I - 0x0033C5 00:B3B5: B5        .byte $B5   ; 
- D 1 - I - 0x0033C6 00:B3B6: B3        .byte $B3   ; 
- D 1 - I - 0x0033C7 00:B3B7: 29        .byte $29   ; 
- D 1 - I - 0x0033C8 00:B3B8: D3        .byte $D3   ; 
- D 1 - I - 0x0033C9 00:B3B9: 21        .byte $21   ; 
- D 1 - I - 0x0033CA 00:B3BA: 21        .byte $21   ; 
- D 1 - I - 0x0033CB 00:B3BB: BA        .byte $BA   ; 
- D 1 - I - 0x0033CC 00:B3BC: BB        .byte $BB   ; 
- D 1 - I - 0x0033CD 00:B3BD: BA        .byte $BA   ; 
- D 1 - I - 0x0033CE 00:B3BE: BB        .byte $BB   ; 
- D 1 - I - 0x0033CF 00:B3BF: 1F        .byte $1F   ; 
- D 1 - I - 0x0033D0 00:B3C0: B1        .byte $B1   ; 
- D 1 - I - 0x0033D1 00:B3C1: 03        .byte $03   ; 
- D 1 - I - 0x0033D2 00:B3C2: 61        .byte $61   ; 
- D 1 - I - 0x0033D3 00:B3C3: B3        .byte $B3   ; 
- D 1 - I - 0x0033D4 00:B3C4: B6        .byte $B6   ; 
- D 1 - I - 0x0033D5 00:B3C5: 00        .byte $00   ; 
- D 1 - I - 0x0033D6 00:B3C6: 64        .byte $64   ; 
- D 1 - I - 0x0033D7 00:B3C7: 21        .byte $21   ; 
- D 1 - I - 0x0033D8 00:B3C8: B7        .byte $B7   ; 
- D 1 - I - 0x0033D9 00:B3C9: 03        .byte $03   ; 
- D 1 - I - 0x0033DA 00:B3CA: 61        .byte $61   ; 
- D 1 - I - 0x0033DB 00:B3CB: BC        .byte $BC   ; 
- D 1 - I - 0x0033DC 00:B3CC: BD        .byte $BD   ; 
- D 1 - I - 0x0033DD 00:B3CD: 00        .byte $00   ; 
- D 1 - I - 0x0033DE 00:B3CE: 64        .byte $64   ; 
- D 1 - I - 0x0033DF 00:B3CF: 01        .byte $01   ; 
- D 1 - I - 0x0033E0 00:B3D0: 02        .byte $02   ; 
- D 1 - I - 0x0033E1 00:B3D1: 09        .byte $09   ; 
- D 1 - I - 0x0033E2 00:B3D2: 00        .byte $00   ; 
- D 1 - I - 0x0033E3 00:B3D3: 62        .byte $62   ; 
- D 1 - I - 0x0033E4 00:B3D4: 63        .byte $63   ; 
- D 1 - I - 0x0033E5 00:B3D5: 63        .byte $63   ; 
- D 1 - I - 0x0033E6 00:B3D6: 64        .byte $64   ; 
- - - - - - 0x0033E7 00:B3D7: 01        .byte $01   ; 
- - - - - - 0x0033E8 00:B3D8: 02        .byte $02   ; 
- - - - - - 0x0033E9 00:B3D9: 02        .byte $02   ; 
- - - - - - 0x0033EA 00:B3DA: 61        .byte $61   ; 
- - - - - - 0x0033EB 00:B3DB: 62        .byte $62   ; 
- - - - - - 0x0033EC 00:B3DC: 63        .byte $63   ; 
- - - - - - 0x0033ED 00:B3DD: 63        .byte $63   ; 
- - - - - - 0x0033EE 00:B3DE: 64        .byte $64   ; 
- D 1 - I - 0x0033EF 00:B3DF: 00        .byte $00   ; 
- D 1 - I - 0x0033F0 00:B3E0: 00        .byte $00   ; 
- D 1 - I - 0x0033F1 00:B3E1: 00        .byte $00   ; 
- D 1 - I - 0x0033F2 00:B3E2: 00        .byte $00   ; 
- D 1 - I - 0x0033F3 00:B3E3: 62        .byte $62   ; 
- D 1 - I - 0x0033F4 00:B3E4: 63        .byte $63   ; 
- D 1 - I - 0x0033F5 00:B3E5: 63        .byte $63   ; 
- D 1 - I - 0x0033F6 00:B3E6: 64        .byte $64   ; 
- - - - - - 0x0033F7 00:B3E7: 01        .byte $01   ; 
- - - - - - 0x0033F8 00:B3E8: 02        .byte $02   ; 
- - - - - - 0x0033F9 00:B3E9: 02        .byte $02   ; 
- - - - - - 0x0033FA 00:B3EA: 61        .byte $61   ; 
- - - - - - 0x0033FB 00:B3EB: 62        .byte $62   ; 
- - - - - - 0x0033FC 00:B3EC: 63        .byte $63   ; 
- - - - - - 0x0033FD 00:B3ED: 63        .byte $63   ; 
- - - - - - 0x0033FE 00:B3EE: 64        .byte $64   ; 
- D 1 - I - 0x0033FF 00:B3EF: 00        .byte $00   ; 
- D 1 - I - 0x003400 00:B3F0: 03        .byte $03   ; 
- D 1 - I - 0x003401 00:B3F1: 03        .byte $03   ; 
- D 1 - I - 0x003402 00:B3F2: 61        .byte $61   ; 
- D 1 - I - 0x003403 00:B3F3: 62        .byte $62   ; 
- D 1 - I - 0x003404 00:B3F4: 63        .byte $63   ; 
- D 1 - I - 0x003405 00:B3F5: 63        .byte $63   ; 
- D 1 - I - 0x003406 00:B3F6: 64        .byte $64   ; 
- - - - - - 0x003407 00:B3F7: 01        .byte $01   ; 
- - - - - - 0x003408 00:B3F8: 02        .byte $02   ; 
- - - - - - 0x003409 00:B3F9: 02        .byte $02   ; 
- - - - - - 0x00340A 00:B3FA: 61        .byte $61   ; 
- - - - - - 0x00340B 00:B3FB: 62        .byte $62   ; 
- - - - - - 0x00340C 00:B3FC: 63        .byte $63   ; 
- - - - - - 0x00340D 00:B3FD: 63        .byte $63   ; 
- - - - - - 0x00340E 00:B3FE: 64        .byte $64   ; 
- D 1 - I - 0x00340F 00:B3FF: 41        .byte $41   ; 
- D 1 - I - 0x003410 00:B400: 41        .byte $41   ; 
- D 1 - I - 0x003411 00:B401: 41        .byte $41   ; 
- D 1 - I - 0x003412 00:B402: 41        .byte $41   ; 
- D 1 - I - 0x003413 00:B403: 41        .byte $41   ; 
- D 1 - I - 0x003414 00:B404: 41        .byte $41   ; 
- D 1 - I - 0x003415 00:B405: 41        .byte $41   ; 
- D 1 - I - 0x003416 00:B406: 41        .byte $41   ; 
- D 1 - I - 0x003417 00:B407: 41        .byte $41   ; 
- D 1 - I - 0x003418 00:B408: 41        .byte $41   ; 
- D 1 - I - 0x003419 00:B409: 41        .byte $41   ; 
- D 1 - I - 0x00341A 00:B40A: 41        .byte $41   ; 
- D 1 - I - 0x00341B 00:B40B: EB        .byte $EB   ; 
- D 1 - I - 0x00341C 00:B40C: EB        .byte $EB   ; 
- D 1 - I - 0x00341D 00:B40D: EB        .byte $EB   ; 
- D 1 - I - 0x00341E 00:B40E: EB        .byte $EB   ; 
- D 1 - I - 0x00341F 00:B40F: 47        .byte $47   ; 
- D 1 - I - 0x003420 00:B410: EF        .byte $EF   ; 
- D 1 - I - 0x003421 00:B411: 41        .byte $41   ; 
- D 1 - I - 0x003422 00:B412: 41        .byte $41   ; 
- D 1 - I - 0x003423 00:B413: 41        .byte $41   ; 
- D 1 - I - 0x003424 00:B414: 47        .byte $47   ; 
- D 1 - I - 0x003425 00:B415: EF        .byte $EF   ; 
- D 1 - I - 0x003426 00:B416: 41        .byte $41   ; 
- D 1 - I - 0x003427 00:B417: 41        .byte $41   ; 
- D 1 - I - 0x003428 00:B418: 41        .byte $41   ; 
- D 1 - I - 0x003429 00:B419: 47        .byte $47   ; 
- D 1 - I - 0x00342A 00:B41A: EF        .byte $EF   ; 
- D 1 - I - 0x00342B 00:B41B: EB        .byte $EB   ; 
- D 1 - I - 0x00342C 00:B41C: EB        .byte $EB   ; 
- D 1 - I - 0x00342D 00:B41D: EB        .byte $EB   ; 
- D 1 - I - 0x00342E 00:B41E: D6        .byte $D6   ; 
- D 1 - I - 0x00342F 00:B41F: 41        .byte $41   ; 
- D 1 - I - 0x003430 00:B420: 48        .byte $48   ; 
- D 1 - I - 0x003431 00:B421: 46        .byte $46   ; 
- D 1 - I - 0x003432 00:B422: F2        .byte $F2   ; 
- D 1 - I - 0x003433 00:B423: 41        .byte $41   ; 
- D 1 - I - 0x003434 00:B424: 41        .byte $41   ; 
- D 1 - I - 0x003435 00:B425: D8        .byte $D8   ; 
- D 1 - I - 0x003436 00:B426: F3        .byte $F3   ; 
- D 1 - I - 0x003437 00:B427: 41        .byte $41   ; 
- D 1 - I - 0x003438 00:B428: 41        .byte $41   ; 
- D 1 - I - 0x003439 00:B429: 48        .byte $48   ; 
- D 1 - I - 0x00343A 00:B42A: F4        .byte $F4   ; 
- D 1 - I - 0x00343B 00:B42B: EB        .byte $EB   ; 
- D 1 - I - 0x00343C 00:B42C: EB        .byte $EB   ; 
- D 1 - I - 0x00343D 00:B42D: EB        .byte $EB   ; 
- D 1 - I - 0x00343E 00:B42E: F5        .byte $F5   ; 
- D 1 - I - 0x00343F 00:B42F: 0E        .byte $0E   ; 
- D 1 - I - 0x003440 00:B430: 02        .byte $02   ; 
- D 1 - I - 0x003441 00:B431: 02        .byte $02   ; 
- D 1 - I - 0x003442 00:B432: 61        .byte $61   ; 
- D 1 - I - 0x003443 00:B433: 0C        .byte $0C   ; 
- D 1 - I - 0x003444 00:B434: F6        .byte $F6   ; 
- D 1 - I - 0x003445 00:B435: 63        .byte $63   ; 
- D 1 - I - 0x003446 00:B436: 64        .byte $64   ; 
- D 1 - I - 0x003447 00:B437: 0B        .byte $0B   ; 
- D 1 - I - 0x003448 00:B438: 03        .byte $03   ; 
- D 1 - I - 0x003449 00:B439: 04        .byte $04   ; 
- D 1 - I - 0x00344A 00:B43A: 61        .byte $61   ; 
- D 1 - I - 0x00344B 00:B43B: 0C        .byte $0C   ; 
- D 1 - I - 0x00344C 00:B43C: 00        .byte $00   ; 
- D 1 - I - 0x00344D 00:B43D: 00        .byte $00   ; 
- D 1 - I - 0x00344E 00:B43E: E2        .byte $E2   ; 
- D 1 - I - 0x00344F 00:B43F: 40        .byte $40   ; 
- D 1 - I - 0x003450 00:B440: EE        .byte $EE   ; 
- D 1 - I - 0x003451 00:B441: 5C        .byte $5C   ; 
- D 1 - I - 0x003452 00:B442: 59        .byte $59   ; 
- D 1 - I - 0x003453 00:B443: 40        .byte $40   ; 
- D 1 - I - 0x003454 00:B444: EE        .byte $EE   ; 
- D 1 - I - 0x003455 00:B445: D9        .byte $D9   ; 
- D 1 - I - 0x003456 00:B446: F0        .byte $F0   ; 
- - - - - - 0x003457 00:B447: 00        .byte $00   ; 
- - - - - - 0x003458 00:B448: 00        .byte $00   ; 
- - - - - - 0x003459 00:B449: 00        .byte $00   ; 
- - - - - - 0x00345A 00:B44A: 00        .byte $00   ; 
- - - - - - 0x00345B 00:B44B: 00        .byte $00   ; 
- - - - - - 0x00345C 00:B44C: 00        .byte $00   ; 
- - - - - - 0x00345D 00:B44D: 00        .byte $00   ; 
- - - - - - 0x00345E 00:B44E: 00        .byte $00   ; 
- D 1 - I - 0x00345F 00:B44F: 44        .byte $44   ; 
- D 1 - I - 0x003460 00:B450: 45        .byte $45   ; 
- D 1 - I - 0x003461 00:B451: 44        .byte $44   ; 
- D 1 - I - 0x003462 00:B452: 45        .byte $45   ; 
- D 1 - I - 0x003463 00:B453: 41        .byte $41   ; 
- D 1 - I - 0x003464 00:B454: 41        .byte $41   ; 
- D 1 - I - 0x003465 00:B455: 41        .byte $41   ; 
- D 1 - I - 0x003466 00:B456: 41        .byte $41   ; 
- D 1 - I - 0x003467 00:B457: 41        .byte $41   ; 
- D 1 - I - 0x003468 00:B458: 41        .byte $41   ; 
- D 1 - I - 0x003469 00:B459: 41        .byte $41   ; 
- D 1 - I - 0x00346A 00:B45A: 41        .byte $41   ; 
- D 1 - I - 0x00346B 00:B45B: 41        .byte $41   ; 
- D 1 - I - 0x00346C 00:B45C: 41        .byte $41   ; 
- D 1 - I - 0x00346D 00:B45D: 41        .byte $41   ; 
- D 1 - I - 0x00346E 00:B45E: E1        .byte $E1   ; 
- D 1 - I - 0x00346F 00:B45F: 41        .byte $41   ; 
- D 1 - I - 0x003470 00:B460: 41        .byte $41   ; 
- D 1 - I - 0x003471 00:B461: E1        .byte $E1   ; 
- D 1 - I - 0x003472 00:B462: FD        .byte $FD   ; 
- D 1 - I - 0x003473 00:B463: 41        .byte $41   ; 
- D 1 - I - 0x003474 00:B464: E1        .byte $E1   ; 
- D 1 - I - 0x003475 00:B465: FD        .byte $FD   ; 
- D 1 - I - 0x003476 00:B466: 41        .byte $41   ; 
- D 1 - I - 0x003477 00:B467: E1        .byte $E1   ; 
- D 1 - I - 0x003478 00:B468: FD        .byte $FD   ; 
- D 1 - I - 0x003479 00:B469: 41        .byte $41   ; 
- D 1 - I - 0x00347A 00:B46A: 41        .byte $41   ; 
- D 1 - I - 0x00347B 00:B46B: FD        .byte $FD   ; 
- D 1 - I - 0x00347C 00:B46C: 41        .byte $41   ; 
- D 1 - I - 0x00347D 00:B46D: 41        .byte $41   ; 
- D 1 - I - 0x00347E 00:B46E: 41        .byte $41   ; 
- D 1 - I - 0x00347F 00:B46F: 5A        .byte $5A   ; 
- D 1 - I - 0x003480 00:B470: DA        .byte $DA   ; 
- D 1 - I - 0x003481 00:B471: DE        .byte $DE   ; 
- D 1 - I - 0x003482 00:B472: 40        .byte $40   ; 
- D 1 - I - 0x003483 00:B473: F7        .byte $F7   ; 
- D 1 - I - 0x003484 00:B474: F9        .byte $F9   ; 
- D 1 - I - 0x003485 00:B475: DE        .byte $DE   ; 
- D 1 - I - 0x003486 00:B476: 40        .byte $40   ; 
- - - - - - 0x003487 00:B477: 00        .byte $00   ; 
- - - - - - 0x003488 00:B478: 00        .byte $00   ; 
- - - - - - 0x003489 00:B479: 00        .byte $00   ; 
- - - - - - 0x00348A 00:B47A: 00        .byte $00   ; 
- - - - - - 0x00348B 00:B47B: 00        .byte $00   ; 
- - - - - - 0x00348C 00:B47C: 00        .byte $00   ; 
- - - - - - 0x00348D 00:B47D: 00        .byte $00   ; 
- - - - - - 0x00348E 00:B47E: 00        .byte $00   ; 
- D 1 - I - 0x00348F 00:B47F: 45        .byte $45   ; 
- D 1 - I - 0x003490 00:B480: D7        .byte $D7   ; 
- D 1 - I - 0x003491 00:B481: 46        .byte $46   ; 
- D 1 - I - 0x003492 00:B482: 5C        .byte $5C   ; 
- D 1 - I - 0x003493 00:B483: 41        .byte $41   ; 
- D 1 - I - 0x003494 00:B484: 41        .byte $41   ; 
- D 1 - I - 0x003495 00:B485: D8        .byte $D8   ; 
- D 1 - I - 0x003496 00:B486: D9        .byte $D9   ; 
- D 1 - I - 0x003497 00:B487: 41        .byte $41   ; 
- D 1 - I - 0x003498 00:B488: 41        .byte $41   ; 
- D 1 - I - 0x003499 00:B489: 48        .byte $48   ; 
- D 1 - I - 0x00349A 00:B48A: 46        .byte $46   ; 
- D 1 - I - 0x00349B 00:B48B: 41        .byte $41   ; 
- D 1 - I - 0x00349C 00:B48C: 41        .byte $41   ; 
- D 1 - I - 0x00349D 00:B48D: 41        .byte $41   ; 
- D 1 - I - 0x00349E 00:B48E: D8        .byte $D8   ; 
- D 1 - I - 0x00349F 00:B48F: 58        .byte $58   ; 
- D 1 - I - 0x0034A0 00:B490: 02        .byte $02   ; 
- D 1 - I - 0x0034A1 00:B491: 02        .byte $02   ; 
- D 1 - I - 0x0034A2 00:B492: 61        .byte $61   ; 
- D 1 - I - 0x0034A3 00:B493: F1        .byte $F1   ; 
- D 1 - I - 0x0034A4 00:B494: 63        .byte $63   ; 
- D 1 - I - 0x0034A5 00:B495: 63        .byte $63   ; 
- D 1 - I - 0x0034A6 00:B496: 64        .byte $64   ; 
- D 1 - I - 0x0034A7 00:B497: 5C        .byte $5C   ; 
- D 1 - I - 0x0034A8 00:B498: 58        .byte $58   ; 
- D 1 - I - 0x0034A9 00:B499: 02        .byte $02   ; 
- D 1 - I - 0x0034AA 00:B49A: 61        .byte $61   ; 
- D 1 - I - 0x0034AB 00:B49B: D9        .byte $D9   ; 
- D 1 - I - 0x0034AC 00:B49C: F1        .byte $F1   ; 
- D 1 - I - 0x0034AD 00:B49D: 63        .byte $63   ; 
- D 1 - I - 0x0034AE 00:B49E: 64        .byte $64   ; 
- D 1 - I - 0x0034AF 00:B49F: 01        .byte $01   ; 
- D 1 - I - 0x0034B0 00:B4A0: 02        .byte $02   ; 
- D 1 - I - 0x0034B1 00:B4A1: D5        .byte $D5   ; 
- D 1 - I - 0x0034B2 00:B4A2: 5B        .byte $5B   ; 
- D 1 - I - 0x0034B3 00:B4A3: 62        .byte $62   ; 
- D 1 - I - 0x0034B4 00:B4A4: 63        .byte $63   ; 
- D 1 - I - 0x0034B5 00:B4A5: 63        .byte $63   ; 
- D 1 - I - 0x0034B6 00:B4A6: F8        .byte $F8   ; 
- D 1 - I - 0x0034B7 00:B4A7: 01        .byte $01   ; 
- D 1 - I - 0x0034B8 00:B4A8: 02        .byte $02   ; 
- D 1 - I - 0x0034B9 00:B4A9: 5B        .byte $5B   ; 
- D 1 - I - 0x0034BA 00:B4AA: DA        .byte $DA   ; 
- D 1 - I - 0x0034BB 00:B4AB: 62        .byte $62   ; 
- D 1 - I - 0x0034BC 00:B4AC: 63        .byte $63   ; 
- D 1 - I - 0x0034BD 00:B4AD: F8        .byte $F8   ; 
- D 1 - I - 0x0034BE 00:B4AE: F9        .byte $F9   ; 
- D 1 - I - 0x0034BF 00:B4AF: DA        .byte $DA   ; 
- D 1 - I - 0x0034C0 00:B4B0: DC        .byte $DC   ; 
- D 1 - I - 0x0034C1 00:B4B1: DF        .byte $DF   ; 
- D 1 - I - 0x0034C2 00:B4B2: 45        .byte $45   ; 
- D 1 - I - 0x0034C3 00:B4B3: F9        .byte $F9   ; 
- D 1 - I - 0x0034C4 00:B4B4: FC        .byte $FC   ; 
- D 1 - I - 0x0034C5 00:B4B5: 41        .byte $41   ; 
- D 1 - I - 0x0034C6 00:B4B6: 41        .byte $41   ; 
- D 1 - I - 0x0034C7 00:B4B7: DC        .byte $DC   ; 
- D 1 - I - 0x0034C8 00:B4B8: E0        .byte $E0   ; 
- D 1 - I - 0x0034C9 00:B4B9: 41        .byte $41   ; 
- D 1 - I - 0x0034CA 00:B4BA: 41        .byte $41   ; 
- D 1 - I - 0x0034CB 00:B4BB: FC        .byte $FC   ; 
- D 1 - I - 0x0034CC 00:B4BC: 41        .byte $41   ; 
- D 1 - I - 0x0034CD 00:B4BD: 41        .byte $41   ; 
- D 1 - I - 0x0034CE 00:B4BE: 41        .byte $41   ; 
- D 1 - I - 0x0034CF 00:B4BF: 41        .byte $41   ; 
- D 1 - I - 0x0034D0 00:B4C0: 41        .byte $41   ; 
- D 1 - I - 0x0034D1 00:B4C1: 41        .byte $41   ; 
- D 1 - I - 0x0034D2 00:B4C2: 48        .byte $48   ; 
- D 1 - I - 0x0034D3 00:B4C3: 41        .byte $41   ; 
- D 1 - I - 0x0034D4 00:B4C4: 41        .byte $41   ; 
- D 1 - I - 0x0034D5 00:B4C5: 41        .byte $41   ; 
- D 1 - I - 0x0034D6 00:B4C6: 41        .byte $41   ; 
- D 1 - I - 0x0034D7 00:B4C7: 41        .byte $41   ; 
- D 1 - I - 0x0034D8 00:B4C8: 41        .byte $41   ; 
- D 1 - I - 0x0034D9 00:B4C9: 41        .byte $41   ; 
- D 1 - I - 0x0034DA 00:B4CA: 41        .byte $41   ; 
- D 1 - I - 0x0034DB 00:B4CB: EF        .byte $EF   ; 
- D 1 - I - 0x0034DC 00:B4CC: 41        .byte $41   ; 
- D 1 - I - 0x0034DD 00:B4CD: 41        .byte $41   ; 
- D 1 - I - 0x0034DE 00:B4CE: 41        .byte $41   ; 
- D 1 - I - 0x0034DF 00:B4CF: 46        .byte $46   ; 
- D 1 - I - 0x0034E0 00:B4D0: 5C        .byte $5C   ; 
- D 1 - I - 0x0034E1 00:B4D1: 58        .byte $58   ; 
- D 1 - I - 0x0034E2 00:B4D2: 61        .byte $61   ; 
- D 1 - I - 0x0034E3 00:B4D3: D8        .byte $D8   ; 
- D 1 - I - 0x0034E4 00:B4D4: D9        .byte $D9   ; 
- D 1 - I - 0x0034E5 00:B4D5: F1        .byte $F1   ; 
- D 1 - I - 0x0034E6 00:B4D6: 64        .byte $64   ; 
- D 1 - I - 0x0034E7 00:B4D7: 48        .byte $48   ; 
- D 1 - I - 0x0034E8 00:B4D8: 46        .byte $46   ; 
- D 1 - I - 0x0034E9 00:B4D9: 5C        .byte $5C   ; 
- D 1 - I - 0x0034EA 00:B4DA: 59        .byte $59   ; 
- D 1 - I - 0x0034EB 00:B4DB: 41        .byte $41   ; 
- D 1 - I - 0x0034EC 00:B4DC: D8        .byte $D8   ; 
- D 1 - I - 0x0034ED 00:B4DD: D9        .byte $D9   ; 
- D 1 - I - 0x0034EE 00:B4DE: F0        .byte $F0   ; 
- D 1 - I - 0x0034EF 00:B4DF: 01        .byte $01   ; 
- D 1 - I - 0x0034F0 00:B4E0: 5B        .byte $5B   ; 
- D 1 - I - 0x0034F1 00:B4E1: DA        .byte $DA   ; 
- D 1 - I - 0x0034F2 00:B4E2: DC        .byte $DC   ; 
- D 1 - I - 0x0034F3 00:B4E3: 62        .byte $62   ; 
- D 1 - I - 0x0034F4 00:B4E4: F8        .byte $F8   ; 
- D 1 - I - 0x0034F5 00:B4E5: F9        .byte $F9   ; 
- D 1 - I - 0x0034F6 00:B4E6: FC        .byte $FC   ; 
- D 1 - I - 0x0034F7 00:B4E7: 5A        .byte $5A   ; 
- D 1 - I - 0x0034F8 00:B4E8: DA        .byte $DA   ; 
- D 1 - I - 0x0034F9 00:B4E9: DC        .byte $DC   ; 
- D 1 - I - 0x0034FA 00:B4EA: E0        .byte $E0   ; 
- D 1 - I - 0x0034FB 00:B4EB: F7        .byte $F7   ; 
- D 1 - I - 0x0034FC 00:B4EC: F9        .byte $F9   ; 
- D 1 - I - 0x0034FD 00:B4ED: FC        .byte $FC   ; 
- D 1 - I - 0x0034FE 00:B4EE: 41        .byte $41   ; 
- D 1 - I - 0x0034FF 00:B4EF: E0        .byte $E0   ; 
- D 1 - I - 0x003500 00:B4F0: 41        .byte $41   ; 
- D 1 - I - 0x003501 00:B4F1: 41        .byte $41   ; 
- D 1 - I - 0x003502 00:B4F2: 41        .byte $41   ; 
- D 1 - I - 0x003503 00:B4F3: 41        .byte $41   ; 
- D 1 - I - 0x003504 00:B4F4: 41        .byte $41   ; 
- D 1 - I - 0x003505 00:B4F5: 41        .byte $41   ; 
- D 1 - I - 0x003506 00:B4F6: 41        .byte $41   ; 
- D 1 - I - 0x003507 00:B4F7: 41        .byte $41   ; 
- D 1 - I - 0x003508 00:B4F8: 41        .byte $41   ; 
- D 1 - I - 0x003509 00:B4F9: 41        .byte $41   ; 
- D 1 - I - 0x00350A 00:B4FA: 41        .byte $41   ; 
- D 1 - I - 0x00350B 00:B4FB: 41        .byte $41   ; 
- D 1 - I - 0x00350C 00:B4FC: 41        .byte $41   ; 
- D 1 - I - 0x00350D 00:B4FD: 41        .byte $41   ; 
- D 1 - I - 0x00350E 00:B4FE: E1        .byte $E1   ; 
- D 1 - I - 0x00350F 00:B4FF: 45        .byte $45   ; 
- D 1 - I - 0x003510 00:B500: 44        .byte $44   ; 
- D 1 - I - 0x003511 00:B501: 45        .byte $45   ; 
- D 1 - I - 0x003512 00:B502: 44        .byte $44   ; 
- D 1 - I - 0x003513 00:B503: 41        .byte $41   ; 
- D 1 - I - 0x003514 00:B504: 41        .byte $41   ; 
- D 1 - I - 0x003515 00:B505: 41        .byte $41   ; 
- D 1 - I - 0x003516 00:B506: 41        .byte $41   ; 
- D 1 - I - 0x003517 00:B507: 41        .byte $41   ; 
- D 1 - I - 0x003518 00:B508: 41        .byte $41   ; 
- D 1 - I - 0x003519 00:B509: 41        .byte $41   ; 
- D 1 - I - 0x00351A 00:B50A: 41        .byte $41   ; 
- D 1 - I - 0x00351B 00:B50B: EF        .byte $EF   ; 
- D 1 - I - 0x00351C 00:B50C: 41        .byte $41   ; 
- D 1 - I - 0x00351D 00:B50D: 41        .byte $41   ; 
- D 1 - I - 0x00351E 00:B50E: 41        .byte $41   ; 
- D 1 - I - 0x00351F 00:B50F: 47        .byte $47   ; 
- D 1 - I - 0x003520 00:B510: EF        .byte $EF   ; 
- D 1 - I - 0x003521 00:B511: 41        .byte $41   ; 
- D 1 - I - 0x003522 00:B512: 41        .byte $41   ; 
- D 1 - I - 0x003523 00:B513: 41        .byte $41   ; 
- D 1 - I - 0x003524 00:B514: 47        .byte $47   ; 
- D 1 - I - 0x003525 00:B515: EF        .byte $EF   ; 
- D 1 - I - 0x003526 00:B516: 41        .byte $41   ; 
- D 1 - I - 0x003527 00:B517: 41        .byte $41   ; 
- D 1 - I - 0x003528 00:B518: 41        .byte $41   ; 
- D 1 - I - 0x003529 00:B519: 47        .byte $47   ; 
- D 1 - I - 0x00352A 00:B51A: EF        .byte $EF   ; 
- D 1 - I - 0x00352B 00:B51B: 41        .byte $41   ; 
- D 1 - I - 0x00352C 00:B51C: 41        .byte $41   ; 
- D 1 - I - 0x00352D 00:B51D: 41        .byte $41   ; 
- D 1 - I - 0x00352E 00:B51E: 47        .byte $47   ; 
- D 1 - I - 0x00352F 00:B51F: DB        .byte $DB   ; 
- D 1 - I - 0x003530 00:B520: DC        .byte $DC   ; 
- D 1 - I - 0x003531 00:B521: E0        .byte $E0   ; 
- D 1 - I - 0x003532 00:B522: 41        .byte $41   ; 
- D 1 - I - 0x003533 00:B523: FA        .byte $FA   ; 
- D 1 - I - 0x003534 00:B524: FC        .byte $FC   ; 
- D 1 - I - 0x003535 00:B525: 41        .byte $41   ; 
- D 1 - I - 0x003536 00:B526: 41        .byte $41   ; 
- D 1 - I - 0x003537 00:B527: FB        .byte $FB   ; 
- D 1 - I - 0x003538 00:B528: E0        .byte $E0   ; 
- D 1 - I - 0x003539 00:B529: 41        .byte $41   ; 
- D 1 - I - 0x00353A 00:B52A: 41        .byte $41   ; 
- D 1 - I - 0x00353B 00:B52B: FE        .byte $FE   ; 
- D 1 - I - 0x00353C 00:B52C: EB        .byte $EB   ; 
- D 1 - I - 0x00353D 00:B52D: EB        .byte $EB   ; 
- D 1 - I - 0x00353E 00:B52E: EB        .byte $EB   ; 
- D 1 - I - 0x00353F 00:B52F: 41        .byte $41   ; 
- D 1 - I - 0x003540 00:B530: 41        .byte $41   ; 
- D 1 - I - 0x003541 00:B531: E1        .byte $E1   ; 
- D 1 - I - 0x003542 00:B532: FD        .byte $FD   ; 
- D 1 - I - 0x003543 00:B533: 41        .byte $41   ; 
- D 1 - I - 0x003544 00:B534: E1        .byte $E1   ; 
- D 1 - I - 0x003545 00:B535: FD        .byte $FD   ; 
- D 1 - I - 0x003546 00:B536: 41        .byte $41   ; 
- D 1 - I - 0x003547 00:B537: E1        .byte $E1   ; 
- D 1 - I - 0x003548 00:B538: FD        .byte $FD   ; 
- D 1 - I - 0x003549 00:B539: 41        .byte $41   ; 
- D 1 - I - 0x00354A 00:B53A: 41        .byte $41   ; 
- D 1 - I - 0x00354B 00:B53B: FF        .byte $FF   ; 
- D 1 - I - 0x00354C 00:B53C: EB        .byte $EB   ; 
- D 1 - I - 0x00354D 00:B53D: EB        .byte $EB   ; 
- D 1 - I - 0x00354E 00:B53E: EB        .byte $EB   ; 
- D 1 - I - 0x00354F 00:B53F: 01        .byte $01   ; 
- D 1 - I - 0x003550 00:B540: 02        .byte $02   ; 
- D 1 - I - 0x003551 00:B541: 02        .byte $02   ; 
- D 1 - I - 0x003552 00:B542: 61        .byte $61   ; 
- D 1 - I - 0x003553 00:B543: 62        .byte $62   ; 
- D 1 - I - 0x003554 00:B544: 63        .byte $63   ; 
- D 1 - I - 0x003555 00:B545: 63        .byte $63   ; 
- D 1 - I - 0x003556 00:B546: 64        .byte $64   ; 
- D 1 - I - 0x003557 00:B547: 43        .byte $43   ; 
- D 1 - I - 0x003558 00:B548: ED        .byte $ED   ; 
- D 1 - I - 0x003559 00:B549: 58        .byte $58   ; 
- D 1 - I - 0x00355A 00:B54A: 61        .byte $61   ; 
- D 1 - I - 0x00355B 00:B54B: 40        .byte $40   ; 
- D 1 - I - 0x00355C 00:B54C: EE        .byte $EE   ; 
- D 1 - I - 0x00355D 00:B54D: F1        .byte $F1   ; 
- D 1 - I - 0x00355E 00:B54E: 64        .byte $64   ; 
- D 1 - I - 0x00355F 00:B54F: 01        .byte $01   ; 
- D 1 - I - 0x003560 00:B550: 02        .byte $02   ; 
- D 1 - I - 0x003561 00:B551: 02        .byte $02   ; 
- D 1 - I - 0x003562 00:B552: 61        .byte $61   ; 
- D 1 - I - 0x003563 00:B553: 62        .byte $62   ; 
- D 1 - I - 0x003564 00:B554: 63        .byte $63   ; 
- D 1 - I - 0x003565 00:B555: 63        .byte $63   ; 
- D 1 - I - 0x003566 00:B556: 64        .byte $64   ; 
- D 1 - I - 0x003567 00:B557: 43        .byte $43   ; 
- D 1 - I - 0x003568 00:B558: 42        .byte $42   ; 
- D 1 - I - 0x003569 00:B559: 43        .byte $43   ; 
- D 1 - I - 0x00356A 00:B55A: 42        .byte $42   ; 
- D 1 - I - 0x00356B 00:B55B: 40        .byte $40   ; 
- D 1 - I - 0x00356C 00:B55C: 40        .byte $40   ; 
- D 1 - I - 0x00356D 00:B55D: 40        .byte $40   ; 
- D 1 - I - 0x00356E 00:B55E: 40        .byte $40   ; 
- D 1 - I - 0x00356F 00:B55F: 01        .byte $01   ; 
- D 1 - I - 0x003570 00:B560: 02        .byte $02   ; 
- D 1 - I - 0x003571 00:B561: 02        .byte $02   ; 
- D 1 - I - 0x003572 00:B562: 61        .byte $61   ; 
- D 1 - I - 0x003573 00:B563: 62        .byte $62   ; 
- D 1 - I - 0x003574 00:B564: 63        .byte $63   ; 
- D 1 - I - 0x003575 00:B565: 63        .byte $63   ; 
- D 1 - I - 0x003576 00:B566: 64        .byte $64   ; 
- D 1 - I - 0x003577 00:B567: D4        .byte $D4   ; 
- D 1 - I - 0x003578 00:B568: 5B        .byte $5B   ; 
- D 1 - I - 0x003579 00:B569: DD        .byte $DD   ; 
- D 1 - I - 0x00357A 00:B56A: 42        .byte $42   ; 
- D 1 - I - 0x00357B 00:B56B: 62        .byte $62   ; 
- D 1 - I - 0x00357C 00:B56C: F8        .byte $F8   ; 
- D 1 - I - 0x00357D 00:B56D: DE        .byte $DE   ; 
- D 1 - I - 0x00357E 00:B56E: 40        .byte $40   ; 
- D 1 - I - 0x00357F 00:B56F: 0D        .byte $0D   ; 
- D 1 - I - 0x003580 00:B570: 03        .byte $03   ; 
- D 1 - I - 0x003581 00:B571: 03        .byte $03   ; 
- D 1 - I - 0x003582 00:B572: 03        .byte $03   ; 
- D 1 - I - 0x003583 00:B573: 62        .byte $62   ; 
- D 1 - I - 0x003584 00:B574: 09        .byte $09   ; 
- D 1 - I - 0x003585 00:B575: 00        .byte $00   ; 
- D 1 - I - 0x003586 00:B576: 00        .byte $00   ; 
- D 1 - I - 0x003587 00:B577: 01        .byte $01   ; 
- D 1 - I - 0x003588 00:B578: 02        .byte $02   ; 
- D 1 - I - 0x003589 00:B579: 0A        .byte $0A   ; 
- D 1 - I - 0x00358A 00:B57A: 03        .byte $03   ; 
- D 1 - I - 0x00358B 00:B57B: 62        .byte $62   ; 
- D 1 - I - 0x00358C 00:B57C: 63        .byte $63   ; 
- D 1 - I - 0x00358D 00:B57D: 63        .byte $63   ; 
- D 1 - I - 0x00358E 00:B57E: 09        .byte $09   ; 
- D 1 - I - 0x00358F 00:B57F: 0B        .byte $0B   ; 
- D 1 - I - 0x003590 00:B580: 03        .byte $03   ; 
- D 1 - I - 0x003591 00:B581: 03        .byte $03   ; 
- D 1 - I - 0x003592 00:B582: 03        .byte $03   ; 
- D 1 - I - 0x003593 00:B583: 0C        .byte $0C   ; 
- D 1 - I - 0x003594 00:B584: 00        .byte $00   ; 
- D 1 - I - 0x003595 00:B585: 00        .byte $00   ; 
- D 1 - I - 0x003596 00:B586: 00        .byte $00   ; 
- D 1 - I - 0x003597 00:B587: 0B        .byte $0B   ; 
- D 1 - I - 0x003598 00:B588: 03        .byte $03   ; 
- D 1 - I - 0x003599 00:B589: 03        .byte $03   ; 
- D 1 - I - 0x00359A 00:B58A: 03        .byte $03   ; 
- D 1 - I - 0x00359B 00:B58B: 0C        .byte $0C   ; 
- D 1 - I - 0x00359C 00:B58C: 00        .byte $00   ; 
- D 1 - I - 0x00359D 00:B58D: 00        .byte $00   ; 
- D 1 - I - 0x00359E 00:B58E: 00        .byte $00   ; 
- D 1 - I - 0x00359F 00:B58F: 2B        .byte $2B   ; 
- D 1 - I - 0x0035A0 00:B590: 2A        .byte $2A   ; 
- D 1 - I - 0x0035A1 00:B591: 2A        .byte $2A   ; 
- D 1 - I - 0x0035A2 00:B592: E3        .byte $E3   ; 
- D 1 - I - 0x0035A3 00:B593: A8        .byte $A8   ; 
- D 1 - I - 0x0035A4 00:B594: A8        .byte $A8   ; 
- D 1 - I - 0x0035A5 00:B595: A8        .byte $A8   ; 
- D 1 - I - 0x0035A6 00:B596: A8        .byte $A8   ; 
- D 1 - I - 0x0035A7 00:B597: 1C        .byte $1C   ; 
- D 1 - I - 0x0035A8 00:B598: 1C        .byte $1C   ; 
- D 1 - I - 0x0035A9 00:B599: 9A        .byte $9A   ; 
- D 1 - I - 0x0035AA 00:B59A: 9B        .byte $9B   ; 
- D 1 - I - 0x0035AB 00:B59B: AF        .byte $AF   ; 
- D 1 - I - 0x0035AC 00:B59C: AF        .byte $AF   ; 
- D 1 - I - 0x0035AD 00:B59D: 9E        .byte $9E   ; 
- D 1 - I - 0x0035AE 00:B59E: 9F        .byte $9F   ; 
- D 1 - I - 0x0035AF 00:B59F: 2B        .byte $2B   ; 
- D 1 - I - 0x0035B0 00:B5A0: 2A        .byte $2A   ; 
- D 1 - I - 0x0035B1 00:B5A1: 2A        .byte $2A   ; 
- D 1 - I - 0x0035B2 00:B5A2: E3        .byte $E3   ; 
- D 1 - I - 0x0035B3 00:B5A3: A8        .byte $A8   ; 
- D 1 - I - 0x0035B4 00:B5A4: A8        .byte $A8   ; 
- D 1 - I - 0x0035B5 00:B5A5: A8        .byte $A8   ; 
- D 1 - I - 0x0035B6 00:B5A6: A8        .byte $A8   ; 
- D 1 - I - 0x0035B7 00:B5A7: 9C        .byte $9C   ; 
- D 1 - I - 0x0035B8 00:B5A8: 9D        .byte $9D   ; 
- D 1 - I - 0x0035B9 00:B5A9: 1C        .byte $1C   ; 
- D 1 - I - 0x0035BA 00:B5AA: 1C        .byte $1C   ; 
- D 1 - I - 0x0035BB 00:B5AB: A0        .byte $A0   ; 
- D 1 - I - 0x0035BC 00:B5AC: A1        .byte $A1   ; 
- D 1 - I - 0x0035BD 00:B5AD: AF        .byte $AF   ; 
- D 1 - I - 0x0035BE 00:B5AE: AF        .byte $AF   ; 
- D 1 - I - 0x0035BF 00:B5AF: 1F        .byte $1F   ; 
- D 1 - I - 0x0035C0 00:B5B0: 1F        .byte $1F   ; 
- D 1 - I - 0x0035C1 00:B5B1: A2        .byte $A2   ; 
- D 1 - I - 0x0035C2 00:B5B2: A3        .byte $A3   ; 
- D 1 - I - 0x0035C3 00:B5B3: B3        .byte $B3   ; 
- D 1 - I - 0x0035C4 00:B5B4: B3        .byte $B3   ; 
- D 1 - I - 0x0035C5 00:B5B5: B3        .byte $B3   ; 
- D 1 - I - 0x0035C6 00:B5B6: B3        .byte $B3   ; 
- D 1 - I - 0x0035C7 00:B5B7: 21        .byte $21   ; 
- D 1 - I - 0x0035C8 00:B5B8: 21        .byte $21   ; 
- D 1 - I - 0x0035C9 00:B5B9: 21        .byte $21   ; 
- D 1 - I - 0x0035CA 00:B5BA: 21        .byte $21   ; 
- D 1 - I - 0x0035CB 00:B5BB: BA        .byte $BA   ; 
- D 1 - I - 0x0035CC 00:B5BC: BB        .byte $BB   ; 
- D 1 - I - 0x0035CD 00:B5BD: BA        .byte $BA   ; 
- D 1 - I - 0x0035CE 00:B5BE: BB        .byte $BB   ; 
- D 1 - I - 0x0035CF 00:B5BF: A4        .byte $A4   ; 
- D 1 - I - 0x0035D0 00:B5C0: A5        .byte $A5   ; 
- D 1 - I - 0x0035D1 00:B5C1: 1F        .byte $1F   ; 
- D 1 - I - 0x0035D2 00:B5C2: 1F        .byte $1F   ; 
- D 1 - I - 0x0035D3 00:B5C3: B3        .byte $B3   ; 
- D 1 - I - 0x0035D4 00:B5C4: B3        .byte $B3   ; 
- D 1 - I - 0x0035D5 00:B5C5: B3        .byte $B3   ; 
- D 1 - I - 0x0035D6 00:B5C6: B3        .byte $B3   ; 
- D 1 - I - 0x0035D7 00:B5C7: 21        .byte $21   ; 
- D 1 - I - 0x0035D8 00:B5C8: 21        .byte $21   ; 
- D 1 - I - 0x0035D9 00:B5C9: 21        .byte $21   ; 
- D 1 - I - 0x0035DA 00:B5CA: 21        .byte $21   ; 
- D 1 - I - 0x0035DB 00:B5CB: BA        .byte $BA   ; 
- D 1 - I - 0x0035DC 00:B5CC: BB        .byte $BB   ; 
- D 1 - I - 0x0035DD 00:B5CD: BA        .byte $BA   ; 
- D 1 - I - 0x0035DE 00:B5CE: BB        .byte $BB   ; 
- D 1 - I - 0x0035DF 00:B5CF: 1F        .byte $1F   ; 
- D 1 - I - 0x0035E0 00:B5D0: CB        .byte $CB   ; 
- D 1 - I - 0x0035E1 00:B5D1: 25        .byte $25   ; 
- D 1 - I - 0x0035E2 00:B5D2: CC        .byte $CC   ; 
- D 1 - I - 0x0035E3 00:B5D3: B3        .byte $B3   ; 
- D 1 - I - 0x0035E4 00:B5D4: B4        .byte $B4   ; 
- D 1 - I - 0x0035E5 00:B5D5: CE        .byte $CE   ; 
- D 1 - I - 0x0035E6 00:B5D6: CF        .byte $CF   ; 
- D 1 - I - 0x0035E7 00:B5D7: 21        .byte $21   ; 
- D 1 - I - 0x0035E8 00:B5D8: 21        .byte $21   ; 
- D 1 - I - 0x0035E9 00:B5D9: 2C        .byte $2C   ; 
- D 1 - I - 0x0035EA 00:B5DA: 2D        .byte $2D   ; 
- D 1 - I - 0x0035EB 00:B5DB: BA        .byte $BA   ; 
- D 1 - I - 0x0035EC 00:B5DC: BB        .byte $BB   ; 
- D 1 - I - 0x0035ED 00:B5DD: BA        .byte $BA   ; 
- D 1 - I - 0x0035EE 00:B5DE: BB        .byte $BB   ; 
- D 1 - I - 0x0035EF 00:B5DF: 26        .byte $26   ; 
- D 1 - I - 0x0035F0 00:B5E0: CD        .byte $CD   ; 
- D 1 - I - 0x0035F1 00:B5E1: 27        .byte $27   ; 
- D 1 - I - 0x0035F2 00:B5E2: 1F        .byte $1F   ; 
- D 1 - I - 0x0035F3 00:B5E3: D0        .byte $D0   ; 
- D 1 - I - 0x0035F4 00:B5E4: D1        .byte $D1   ; 
- D 1 - I - 0x0035F5 00:B5E5: B5        .byte $B5   ; 
- D 1 - I - 0x0035F6 00:B5E6: B3        .byte $B3   ; 
- D 1 - I - 0x0035F7 00:B5E7: 2E        .byte $2E   ; 
- D 1 - I - 0x0035F8 00:B5E8: 2F        .byte $2F   ; 
- D 1 - I - 0x0035F9 00:B5E9: 21        .byte $21   ; 
- D 1 - I - 0x0035FA 00:B5EA: 21        .byte $21   ; 
- D 1 - I - 0x0035FB 00:B5EB: BA        .byte $BA   ; 
- D 1 - I - 0x0035FC 00:B5EC: BB        .byte $BB   ; 
- D 1 - I - 0x0035FD 00:B5ED: BA        .byte $BA   ; 
- D 1 - I - 0x0035FE 00:B5EE: BB        .byte $BB   ; 
- D 1 - I - 0x0035FF 00:B5EF: 51        .byte $51   ; 
- D 1 - I - 0x003600 00:B5F0: 40        .byte $40   ; 
- D 1 - I - 0x003601 00:B5F1: 40        .byte $40   ; 
- D 1 - I - 0x003602 00:B5F2: 40        .byte $40   ; 
- D 1 - I - 0x003603 00:B5F3: 51        .byte $51   ; 
- D 1 - I - 0x003604 00:B5F4: 40        .byte $40   ; 
- D 1 - I - 0x003605 00:B5F5: 40        .byte $40   ; 
- D 1 - I - 0x003606 00:B5F6: 40        .byte $40   ; 
- D 1 - I - 0x003607 00:B5F7: 36        .byte $36   ; 
- D 1 - I - 0x003608 00:B5F8: 40        .byte $40   ; 
- D 1 - I - 0x003609 00:B5F9: 40        .byte $40   ; 
- D 1 - I - 0x00360A 00:B5FA: 40        .byte $40   ; 
- D 1 - I - 0x00360B 00:B5FB: 34        .byte $34   ; 
- D 1 - I - 0x00360C 00:B5FC: 4C        .byte $4C   ; 
- D 1 - I - 0x00360D 00:B5FD: 40        .byte $40   ; 
- D 1 - I - 0x00360E 00:B5FE: 40        .byte $40   ; 
- D 1 - I - 0x00360F 00:B5FF: 0B        .byte $0B   ; 
- D 1 - I - 0x003610 00:B600: 03        .byte $03   ; 
- D 1 - I - 0x003611 00:B601: 03        .byte $03   ; 
- D 1 - I - 0x003612 00:B602: 03        .byte $03   ; 
- D 1 - I - 0x003613 00:B603: 0C        .byte $0C   ; 
- D 1 - I - 0x003614 00:B604: 00        .byte $00   ; 
- D 1 - I - 0x003615 00:B605: 00        .byte $00   ; 
- D 1 - I - 0x003616 00:B606: 00        .byte $00   ; 
- D 1 - I - 0x003617 00:B607: 70        .byte $70   ; 
- D 1 - I - 0x003618 00:B608: 03        .byte $03   ; 
- D 1 - I - 0x003619 00:B609: 03        .byte $03   ; 
- D 1 - I - 0x00361A 00:B60A: 03        .byte $03   ; 
- D 1 - I - 0x00361B 00:B60B: 71        .byte $71   ; 
- D 1 - I - 0x00361C 00:B60C: 00        .byte $00   ; 
- D 1 - I - 0x00361D 00:B60D: 00        .byte $00   ; 
- D 1 - I - 0x00361E 00:B60E: 00        .byte $00   ; 
- D 1 - I - 0x00361F 00:B60F: 70        .byte $70   ; 
- D 1 - I - 0x003620 00:B610: 03        .byte $03   ; 
- D 1 - I - 0x003621 00:B611: 03        .byte $03   ; 
- D 1 - I - 0x003622 00:B612: 03        .byte $03   ; 
- D 1 - I - 0x003623 00:B613: 71        .byte $71   ; 
- D 1 - I - 0x003624 00:B614: 00        .byte $00   ; 
- D 1 - I - 0x003625 00:B615: 00        .byte $00   ; 
- D 1 - I - 0x003626 00:B616: 00        .byte $00   ; 
- D 1 - I - 0x003627 00:B617: 72        .byte $72   ; 
- D 1 - I - 0x003628 00:B618: 03        .byte $03   ; 
- D 1 - I - 0x003629 00:B619: 03        .byte $03   ; 
- D 1 - I - 0x00362A 00:B61A: 03        .byte $03   ; 
- D 1 - I - 0x00362B 00:B61B: 00        .byte $00   ; 
- D 1 - I - 0x00362C 00:B61C: 00        .byte $00   ; 
- D 1 - I - 0x00362D 00:B61D: 00        .byte $00   ; 
- D 1 - I - 0x00362E 00:B61E: 00        .byte $00   ; 
- D 1 - I - 0x00362F 00:B61F: 51        .byte $51   ; 
- D 1 - I - 0x003630 00:B620: 40        .byte $40   ; 
- D 1 - I - 0x003631 00:B621: 40        .byte $40   ; 
- D 1 - I - 0x003632 00:B622: 40        .byte $40   ; 
- D 1 - I - 0x003633 00:B623: 51        .byte $51   ; 
- D 1 - I - 0x003634 00:B624: 40        .byte $40   ; 
- D 1 - I - 0x003635 00:B625: 40        .byte $40   ; 
- D 1 - I - 0x003636 00:B626: 40        .byte $40   ; 
- D 1 - I - 0x003637 00:B627: 51        .byte $51   ; 
- D 1 - I - 0x003638 00:B628: 40        .byte $40   ; 
- D 1 - I - 0x003639 00:B629: 40        .byte $40   ; 
- D 1 - I - 0x00363A 00:B62A: 40        .byte $40   ; 
- D 1 - I - 0x00363B 00:B62B: 36        .byte $36   ; 
- D 1 - I - 0x00363C 00:B62C: 40        .byte $40   ; 
- D 1 - I - 0x00363D 00:B62D: 40        .byte $40   ; 
- D 1 - I - 0x00363E 00:B62E: 40        .byte $40   ; 
- D 1 - I - 0x00363F 00:B62F: 40        .byte $40   ; 
- D 1 - I - 0x003640 00:B630: 40        .byte $40   ; 
- D 1 - I - 0x003641 00:B631: 40        .byte $40   ; 
- D 1 - I - 0x003642 00:B632: 40        .byte $40   ; 
- D 1 - I - 0x003643 00:B633: 40        .byte $40   ; 
- D 1 - I - 0x003644 00:B634: 40        .byte $40   ; 
- D 1 - I - 0x003645 00:B635: 40        .byte $40   ; 
- D 1 - I - 0x003646 00:B636: 40        .byte $40   ; 
- D 1 - I - 0x003647 00:B637: 40        .byte $40   ; 
- D 1 - I - 0x003648 00:B638: 40        .byte $40   ; 
- D 1 - I - 0x003649 00:B639: 40        .byte $40   ; 
- D 1 - I - 0x00364A 00:B63A: 40        .byte $40   ; 
- D 1 - I - 0x00364B 00:B63B: 4C        .byte $4C   ; 
- D 1 - I - 0x00364C 00:B63C: E4        .byte $E4   ; 
- D 1 - I - 0x00364D 00:B63D: 40        .byte $40   ; 
- D 1 - I - 0x00364E 00:B63E: 40        .byte $40   ; 
- D 1 - I - 0x00364F 00:B63F: 80        .byte $80   ; 
- D 1 - I - 0x003650 00:B640: E5        .byte $E5   ; 
- D 1 - I - 0x003651 00:B641: E5        .byte $E5   ; 
- D 1 - I - 0x003652 00:B642: E5        .byte $E5   ; 
- D 1 - I - 0x003653 00:B643: 51        .byte $51   ; 
- D 1 - I - 0x003654 00:B644: 40        .byte $40   ; 
- D 1 - I - 0x003655 00:B645: 40        .byte $40   ; 
- D 1 - I - 0x003656 00:B646: 40        .byte $40   ; 
- D 1 - I - 0x003657 00:B647: 51        .byte $51   ; 
- D 1 - I - 0x003658 00:B648: 40        .byte $40   ; 
- D 1 - I - 0x003659 00:B649: 40        .byte $40   ; 
- D 1 - I - 0x00365A 00:B64A: 40        .byte $40   ; 
- D 1 - I - 0x00365B 00:B64B: 51        .byte $51   ; 
- D 1 - I - 0x00365C 00:B64C: 40        .byte $40   ; 
- D 1 - I - 0x00365D 00:B64D: 40        .byte $40   ; 
- D 1 - I - 0x00365E 00:B64E: 40        .byte $40   ; 
- D 1 - I - 0x00365F 00:B64F: E5        .byte $E5   ; 
- D 1 - I - 0x003660 00:B650: E5        .byte $E5   ; 
- D 1 - I - 0x003661 00:B651: E5        .byte $E5   ; 
- D 1 - I - 0x003662 00:B652: E5        .byte $E5   ; 
- D 1 - I - 0x003663 00:B653: 40        .byte $40   ; 
- D 1 - I - 0x003664 00:B654: 40        .byte $40   ; 
- D 1 - I - 0x003665 00:B655: 40        .byte $40   ; 
- D 1 - I - 0x003666 00:B656: 40        .byte $40   ; 
- D 1 - I - 0x003667 00:B657: 40        .byte $40   ; 
- D 1 - I - 0x003668 00:B658: 40        .byte $40   ; 
- D 1 - I - 0x003669 00:B659: 40        .byte $40   ; 
- D 1 - I - 0x00366A 00:B65A: 40        .byte $40   ; 
- D 1 - I - 0x00366B 00:B65B: 40        .byte $40   ; 
- D 1 - I - 0x00366C 00:B65C: 40        .byte $40   ; 
- D 1 - I - 0x00366D 00:B65D: 40        .byte $40   ; 
- D 1 - I - 0x00366E 00:B65E: 40        .byte $40   ; 
- D 1 - I - 0x00366F 00:B65F: 05        .byte $05   ; 
- D 1 - I - 0x003670 00:B660: 06        .byte $06   ; 
- D 1 - I - 0x003671 00:B661: 06        .byte $06   ; 
- D 1 - I - 0x003672 00:B662: 06        .byte $06   ; 
- D 1 - I - 0x003673 00:B663: 40        .byte $40   ; 
- D 1 - I - 0x003674 00:B664: 40        .byte $40   ; 
- D 1 - I - 0x003675 00:B665: 40        .byte $40   ; 
- D 1 - I - 0x003676 00:B666: 40        .byte $40   ; 
- D 1 - I - 0x003677 00:B667: 07        .byte $07   ; 
- D 1 - I - 0x003678 00:B668: 40        .byte $40   ; 
- D 1 - I - 0x003679 00:B669: 07        .byte $07   ; 
- D 1 - I - 0x00367A 00:B66A: 40        .byte $40   ; 
- D 1 - I - 0x00367B 00:B66B: 52        .byte $52   ; 
- D 1 - I - 0x00367C 00:B66C: 53        .byte $53   ; 
- D 1 - I - 0x00367D 00:B66D: 53        .byte $53   ; 
- D 1 - I - 0x00367E 00:B66E: 53        .byte $53   ; 
- D 1 - I - 0x00367F 00:B66F: 06        .byte $06   ; 
- D 1 - I - 0x003680 00:B670: 06        .byte $06   ; 
- D 1 - I - 0x003681 00:B671: 06        .byte $06   ; 
- D 1 - I - 0x003682 00:B672: C2        .byte $C2   ; 
- D 1 - I - 0x003683 00:B673: 40        .byte $40   ; 
- D 1 - I - 0x003684 00:B674: 40        .byte $40   ; 
- D 1 - I - 0x003685 00:B675: 40        .byte $40   ; 
- D 1 - I - 0x003686 00:B676: C3        .byte $C3   ; 
- D 1 - I - 0x003687 00:B677: 07        .byte $07   ; 
- D 1 - I - 0x003688 00:B678: 40        .byte $40   ; 
- D 1 - I - 0x003689 00:B679: 07        .byte $07   ; 
- D 1 - I - 0x00368A 00:B67A: C3        .byte $C3   ; 
- D 1 - I - 0x00368B 00:B67B: 53        .byte $53   ; 
- D 1 - I - 0x00368C 00:B67C: 53        .byte $53   ; 
- D 1 - I - 0x00368D 00:B67D: 53        .byte $53   ; 
- D 1 - I - 0x00368E 00:B67E: C4        .byte $C4   ; 
- D 1 - I - 0x00368F 00:B67F: 07        .byte $07   ; 
- D 1 - I - 0x003690 00:B680: 40        .byte $40   ; 
- D 1 - I - 0x003691 00:B681: 07        .byte $07   ; 
- D 1 - I - 0x003692 00:B682: 40        .byte $40   ; 
- D 1 - I - 0x003693 00:B683: 52        .byte $52   ; 
- D 1 - I - 0x003694 00:B684: 53        .byte $53   ; 
- D 1 - I - 0x003695 00:B685: 53        .byte $53   ; 
- D 1 - I - 0x003696 00:B686: 53        .byte $53   ; 
- D 1 - I - 0x003697 00:B687: 05        .byte $05   ; 
- D 1 - I - 0x003698 00:B688: 06        .byte $06   ; 
- D 1 - I - 0x003699 00:B689: 06        .byte $06   ; 
- D 1 - I - 0x00369A 00:B68A: 06        .byte $06   ; 
- D 1 - I - 0x00369B 00:B68B: 40        .byte $40   ; 
- D 1 - I - 0x00369C 00:B68C: 40        .byte $40   ; 
- D 1 - I - 0x00369D 00:B68D: 40        .byte $40   ; 
- D 1 - I - 0x00369E 00:B68E: 40        .byte $40   ; 
- D 1 - I - 0x00369F 00:B68F: 07        .byte $07   ; 
- D 1 - I - 0x0036A0 00:B690: 40        .byte $40   ; 
- D 1 - I - 0x0036A1 00:B691: 07        .byte $07   ; 
- D 1 - I - 0x0036A2 00:B692: C3        .byte $C3   ; 
- D 1 - I - 0x0036A3 00:B693: 53        .byte $53   ; 
- D 1 - I - 0x0036A4 00:B694: 53        .byte $53   ; 
- D 1 - I - 0x0036A5 00:B695: 53        .byte $53   ; 
- D 1 - I - 0x0036A6 00:B696: C4        .byte $C4   ; 
- D 1 - I - 0x0036A7 00:B697: 06        .byte $06   ; 
- D 1 - I - 0x0036A8 00:B698: 06        .byte $06   ; 
- D 1 - I - 0x0036A9 00:B699: 06        .byte $06   ; 
- D 1 - I - 0x0036AA 00:B69A: C2        .byte $C2   ; 
- D 1 - I - 0x0036AB 00:B69B: 40        .byte $40   ; 
- D 1 - I - 0x0036AC 00:B69C: 40        .byte $40   ; 
- D 1 - I - 0x0036AD 00:B69D: 40        .byte $40   ; 
- D 1 - I - 0x0036AE 00:B69E: C3        .byte $C3   ; 
- D 1 - I - 0x0036AF 00:B69F: 24        .byte $24   ; 
- D 1 - I - 0x0036B0 00:B6A0: 24        .byte $24   ; 
- D 1 - I - 0x0036B1 00:B6A1: 24        .byte $24   ; 
- D 1 - I - 0x0036B2 00:B6A2: 24        .byte $24   ; 
- D 1 - I - 0x0036B3 00:B6A3: 7D        .byte $7D   ; 
- D 1 - I - 0x0036B4 00:B6A4: 7D        .byte $7D   ; 
- D 1 - I - 0x0036B5 00:B6A5: 7D        .byte $7D   ; 
- D 1 - I - 0x0036B6 00:B6A6: 7D        .byte $7D   ; 
- D 1 - I - 0x0036B7 00:B6A7: 21        .byte $21   ; 
- D 1 - I - 0x0036B8 00:B6A8: 20        .byte $20   ; 
- D 1 - I - 0x0036B9 00:B6A9: 1F        .byte $1F   ; 
- D 1 - I - 0x0036BA 00:B6AA: 83        .byte $83   ; 
- D 1 - I - 0x0036BB 00:B6AB: 83        .byte $83   ; 
- D 1 - I - 0x0036BC 00:B6AC: 83        .byte $83   ; 
- D 1 - I - 0x0036BD 00:B6AD: 20        .byte $20   ; 
- D 1 - I - 0x0036BE 00:B6AE: 22        .byte $22   ; 
- D 1 - I - 0x0036BF 00:B6AF: 24        .byte $24   ; 
- D 1 - I - 0x0036C0 00:B6B0: 24        .byte $24   ; 
- D 1 - I - 0x0036C1 00:B6B1: 24        .byte $24   ; 
- D 1 - I - 0x0036C2 00:B6B2: 24        .byte $24   ; 
- D 1 - I - 0x0036C3 00:B6B3: 7D        .byte $7D   ; 
- D 1 - I - 0x0036C4 00:B6B4: 7D        .byte $7D   ; 
- D 1 - I - 0x0036C5 00:B6B5: 7D        .byte $7D   ; 
- D 1 - I - 0x0036C6 00:B6B6: 7D        .byte $7D   ; 
- D 1 - I - 0x0036C7 00:B6B7: 1B        .byte $1B   ; 
- D 1 - I - 0x0036C8 00:B6B8: 85        .byte $85   ; 
- D 1 - I - 0x0036C9 00:B6B9: 1C        .byte $1C   ; 
- D 1 - I - 0x0036CA 00:B6BA: 81        .byte $81   ; 
- D 1 - I - 0x0036CB 00:B6BB: 1D        .byte $1D   ; 
- D 1 - I - 0x0036CC 00:B6BC: 1C        .byte $1C   ; 
- D 1 - I - 0x0036CD 00:B6BD: 1B        .byte $1B   ; 
- D 1 - I - 0x0036CE 00:B6BE: 1B        .byte $1B   ; 
- D 1 - I - 0x0036CF 00:B6BF: 34        .byte $34   ; 
- D 1 - I - 0x0036D0 00:B6C0: E7        .byte $E7   ; 
- D 1 - I - 0x0036D1 00:B6C1: 37        .byte $37   ; 
- D 1 - I - 0x0036D2 00:B6C2: E7        .byte $E7   ; 
- D 1 - I - 0x0036D3 00:B6C3: E8        .byte $E8   ; 
- D 1 - I - 0x0036D4 00:B6C4: 35        .byte $35   ; 
- D 1 - I - 0x0036D5 00:B6C5: E6        .byte $E6   ; 
- D 1 - I - 0x0036D6 00:B6C6: E6        .byte $E6   ; 
- D 1 - I - 0x0036D7 00:B6C7: 3A        .byte $3A   ; 
- D 1 - I - 0x0036D8 00:B6C8: 38        .byte $38   ; 
- D 1 - I - 0x0036D9 00:B6C9: 39        .byte $39   ; 
- D 1 - I - 0x0036DA 00:B6CA: 39        .byte $39   ; 
- D 1 - I - 0x0036DB 00:B6CB: 3A        .byte $3A   ; 
- D 1 - I - 0x0036DC 00:B6CC: 41        .byte $41   ; 
- D 1 - I - 0x0036DD 00:B6CD: 41        .byte $41   ; 
- D 1 - I - 0x0036DE 00:B6CE: 41        .byte $41   ; 
- D 1 - I - 0x0036DF 00:B6CF: 37        .byte $37   ; 
- D 1 - I - 0x0036E0 00:B6D0: E7        .byte $E7   ; 
- D 1 - I - 0x0036E1 00:B6D1: 37        .byte $37   ; 
- D 1 - I - 0x0036E2 00:B6D2: E7        .byte $E7   ; 
- D 1 - I - 0x0036E3 00:B6D3: 35        .byte $35   ; 
- D 1 - I - 0x0036E4 00:B6D4: 35        .byte $35   ; 
- D 1 - I - 0x0036E5 00:B6D5: E6        .byte $E6   ; 
- D 1 - I - 0x0036E6 00:B6D6: 35        .byte $35   ; 
- D 1 - I - 0x0036E7 00:B6D7: 38        .byte $38   ; 
- D 1 - I - 0x0036E8 00:B6D8: 39        .byte $39   ; 
- D 1 - I - 0x0036E9 00:B6D9: 39        .byte $39   ; 
- D 1 - I - 0x0036EA 00:B6DA: 38        .byte $38   ; 
- D 1 - I - 0x0036EB 00:B6DB: 41        .byte $41   ; 
- D 1 - I - 0x0036EC 00:B6DC: 41        .byte $41   ; 
- D 1 - I - 0x0036ED 00:B6DD: 41        .byte $41   ; 
- D 1 - I - 0x0036EE 00:B6DE: 41        .byte $41   ; 
- D 1 - I - 0x0036EF 00:B6DF: 22        .byte $22   ; 
- D 1 - I - 0x0036F0 00:B6E0: 22        .byte $22   ; 
- D 1 - I - 0x0036F1 00:B6E1: 20        .byte $20   ; 
- D 1 - I - 0x0036F2 00:B6E2: 84        .byte $84   ; 
- D 1 - I - 0x0036F3 00:B6E3: 84        .byte $84   ; 
- D 1 - I - 0x0036F4 00:B6E4: 23        .byte $23   ; 
- D 1 - I - 0x0036F5 00:B6E5: 22        .byte $22   ; 
- D 1 - I - 0x0036F6 00:B6E6: 84        .byte $84   ; 
- D 1 - I - 0x0036F7 00:B6E7: 23        .byte $23   ; 
- D 1 - I - 0x0036F8 00:B6E8: 84        .byte $84   ; 
- D 1 - I - 0x0036F9 00:B6E9: 23        .byte $23   ; 
- D 1 - I - 0x0036FA 00:B6EA: 00        .byte $00   ; 
- D 1 - I - 0x0036FB 00:B6EB: 00        .byte $00   ; 
- D 1 - I - 0x0036FC 00:B6EC: 00        .byte $00   ; 
- D 1 - I - 0x0036FD 00:B6ED: 00        .byte $00   ; 
- D 1 - I - 0x0036FE 00:B6EE: 23        .byte $23   ; 
- D 1 - I - 0x0036FF 00:B6EF: 1E        .byte $1E   ; 
- D 1 - I - 0x003700 00:B6F0: 1C        .byte $1C   ; 
- D 1 - I - 0x003701 00:B6F1: 1D        .byte $1D   ; 
- D 1 - I - 0x003702 00:B6F2: 1D        .byte $1D   ; 
- D 1 - I - 0x003703 00:B6F3: 1E        .byte $1E   ; 
- D 1 - I - 0x003704 00:B6F4: 82        .byte $82   ; 
- D 1 - I - 0x003705 00:B6F5: 82        .byte $82   ; 
- D 1 - I - 0x003706 00:B6F6: 1E        .byte $1E   ; 
- D 1 - I - 0x003707 00:B6F7: 30        .byte $30   ; 
- D 1 - I - 0x003708 00:B6F8: 82        .byte $82   ; 
- D 1 - I - 0x003709 00:B6F9: 1E        .byte $1E   ; 
- D 1 - I - 0x00370A 00:B6FA: 82        .byte $82   ; 
- D 1 - I - 0x00370B 00:B6FB: 82        .byte $82   ; 
- D 1 - I - 0x00370C 00:B6FC: 00        .byte $00   ; 
- D 1 - I - 0x00370D 00:B6FD: 00        .byte $00   ; 
- D 1 - I - 0x00370E 00:B6FE: 00        .byte $00   ; 
- D 1 - I - 0x00370F 00:B6FF: 3A        .byte $3A   ; 
- D 1 - I - 0x003710 00:B700: 41        .byte $41   ; 
- D 1 - I - 0x003711 00:B701: 41        .byte $41   ; 
- D 1 - I - 0x003712 00:B702: 41        .byte $41   ; 
- D 1 - I - 0x003713 00:B703: 3B        .byte $3B   ; 
- D 1 - I - 0x003714 00:B704: 41        .byte $41   ; 
- D 1 - I - 0x003715 00:B705: 41        .byte $41   ; 
- D 1 - I - 0x003716 00:B706: 41        .byte $41   ; 
- D 1 - I - 0x003717 00:B707: 3B        .byte $3B   ; 
- D 1 - I - 0x003718 00:B708: 41        .byte $41   ; 
- D 1 - I - 0x003719 00:B709: 41        .byte $41   ; 
- D 1 - I - 0x00371A 00:B70A: 41        .byte $41   ; 
- D 1 - I - 0x00371B 00:B70B: 3B        .byte $3B   ; 
- D 1 - I - 0x00371C 00:B70C: 41        .byte $41   ; 
- D 1 - I - 0x00371D 00:B70D: 41        .byte $41   ; 
- D 1 - I - 0x00371E 00:B70E: 41        .byte $41   ; 
- D 1 - I - 0x00371F 00:B70F: 41        .byte $41   ; 
- D 1 - I - 0x003720 00:B710: 41        .byte $41   ; 
- D 1 - I - 0x003721 00:B711: 41        .byte $41   ; 
- D 1 - I - 0x003722 00:B712: 3D        .byte $3D   ; 
- D 1 - I - 0x003723 00:B713: 41        .byte $41   ; 
- D 1 - I - 0x003724 00:B714: 41        .byte $41   ; 
- D 1 - I - 0x003725 00:B715: 41        .byte $41   ; 
- D 1 - I - 0x003726 00:B716: E9        .byte $E9   ; 
- D 1 - I - 0x003727 00:B717: 41        .byte $41   ; 
- D 1 - I - 0x003728 00:B718: 41        .byte $41   ; 
- D 1 - I - 0x003729 00:B719: 3D        .byte $3D   ; 
- D 1 - I - 0x00372A 00:B71A: 3E        .byte $3E   ; 
- D 1 - I - 0x00372B 00:B71B: 41        .byte $41   ; 
- D 1 - I - 0x00372C 00:B71C: 41        .byte $41   ; 
- D 1 - I - 0x00372D 00:B71D: E9        .byte $E9   ; 
- D 1 - I - 0x00372E 00:B71E: 41        .byte $41   ; 
- D 1 - I - 0x00372F 00:B71F: 3C        .byte $3C   ; 
- D 1 - I - 0x003730 00:B720: 41        .byte $41   ; 
- D 1 - I - 0x003731 00:B721: 41        .byte $41   ; 
- D 1 - I - 0x003732 00:B722: 41        .byte $41   ; 
- D 1 - I - 0x003733 00:B723: 3C        .byte $3C   ; 
- D 1 - I - 0x003734 00:B724: 41        .byte $41   ; 
- D 1 - I - 0x003735 00:B725: 41        .byte $41   ; 
- D 1 - I - 0x003736 00:B726: 41        .byte $41   ; 
- D 1 - I - 0x003737 00:B727: 3C        .byte $3C   ; 
- D 1 - I - 0x003738 00:B728: 41        .byte $41   ; 
- D 1 - I - 0x003739 00:B729: 41        .byte $41   ; 
- D 1 - I - 0x00373A 00:B72A: 41        .byte $41   ; 
- D 1 - I - 0x00373B 00:B72B: EA        .byte $EA   ; 
- D 1 - I - 0x00373C 00:B72C: EB        .byte $EB   ; 
- D 1 - I - 0x00373D 00:B72D: EB        .byte $EB   ; 
- D 1 - I - 0x00373E 00:B72E: EB        .byte $EB   ; 
- D 1 - I - 0x00373F 00:B72F: 41        .byte $41   ; 
- D 1 - I - 0x003740 00:B730: 3D        .byte $3D   ; 
- D 1 - I - 0x003741 00:B731: 3E        .byte $3E   ; 
- D 1 - I - 0x003742 00:B732: 41        .byte $41   ; 
- D 1 - I - 0x003743 00:B733: 41        .byte $41   ; 
- D 1 - I - 0x003744 00:B734: E9        .byte $E9   ; 
- D 1 - I - 0x003745 00:B735: 41        .byte $41   ; 
- D 1 - I - 0x003746 00:B736: 41        .byte $41   ; 
- D 1 - I - 0x003747 00:B737: 3D        .byte $3D   ; 
- D 1 - I - 0x003748 00:B738: 3E        .byte $3E   ; 
- D 1 - I - 0x003749 00:B739: 41        .byte $41   ; 
- D 1 - I - 0x00374A 00:B73A: 41        .byte $41   ; 
- D 1 - I - 0x00374B 00:B73B: EC        .byte $EC   ; 
- D 1 - I - 0x00374C 00:B73C: EB        .byte $EB   ; 
- D 1 - I - 0x00374D 00:B73D: EB        .byte $EB   ; 
- D 1 - I - 0x00374E 00:B73E: EB        .byte $EB   ; 
- D 1 - I - 0x00374F 00:B73F: 37        .byte $37   ; 
- D 1 - I - 0x003750 00:B740: E7        .byte $E7   ; 
- D 1 - I - 0x003751 00:B741: 37        .byte $37   ; 
- D 1 - I - 0x003752 00:B742: E7        .byte $E7   ; 
- D 1 - I - 0x003753 00:B743: 35        .byte $35   ; 
- D 1 - I - 0x003754 00:B744: 35        .byte $35   ; 
- D 1 - I - 0x003755 00:B745: E6        .byte $E6   ; 
- D 1 - I - 0x003756 00:B746: 35        .byte $35   ; 
- D 1 - I - 0x003757 00:B747: 3F        .byte $3F   ; 
- D 1 - I - 0x003758 00:B748: 00        .byte $00   ; 
- D 1 - I - 0x003759 00:B749: 39        .byte $39   ; 
- D 1 - I - 0x00375A 00:B74A: 38        .byte $38   ; 
- D 1 - I - 0x00375B 00:B74B: E9        .byte $E9   ; 
- D 1 - I - 0x00375C 00:B74C: 41        .byte $41   ; 
- D 1 - I - 0x00375D 00:B74D: 41        .byte $41   ; 
- D 1 - I - 0x00375E 00:B74E: 41        .byte $41   ; 
- D 1 - I - 0x00375F 00:B74F: 3E        .byte $3E   ; 
- D 1 - I - 0x003760 00:B750: 41        .byte $41   ; 
- D 1 - I - 0x003761 00:B751: 41        .byte $41   ; 
- D 1 - I - 0x003762 00:B752: 41        .byte $41   ; 
- D 1 - I - 0x003763 00:B753: 41        .byte $41   ; 
- D 1 - I - 0x003764 00:B754: 41        .byte $41   ; 
- D 1 - I - 0x003765 00:B755: 41        .byte $41   ; 
- D 1 - I - 0x003766 00:B756: 41        .byte $41   ; 
- D 1 - I - 0x003767 00:B757: 41        .byte $41   ; 
- D 1 - I - 0x003768 00:B758: 41        .byte $41   ; 
- D 1 - I - 0x003769 00:B759: 41        .byte $41   ; 
- D 1 - I - 0x00376A 00:B75A: 41        .byte $41   ; 
- D 1 - I - 0x00376B 00:B75B: 41        .byte $41   ; 
- D 1 - I - 0x00376C 00:B75C: 41        .byte $41   ; 
- D 1 - I - 0x00376D 00:B75D: 41        .byte $41   ; 
- D 1 - I - 0x00376E 00:B75E: 41        .byte $41   ; 
- D 1 - I - 0x00376F 00:B75F: 41        .byte $41   ; 
- D 1 - I - 0x003770 00:B760: 41        .byte $41   ; 
- D 1 - I - 0x003771 00:B761: 41        .byte $41   ; 
- D 1 - I - 0x003772 00:B762: 41        .byte $41   ; 
- D 1 - I - 0x003773 00:B763: 41        .byte $41   ; 
- D 1 - I - 0x003774 00:B764: 41        .byte $41   ; 
- D 1 - I - 0x003775 00:B765: 41        .byte $41   ; 
- D 1 - I - 0x003776 00:B766: 41        .byte $41   ; 
- D 1 - I - 0x003777 00:B767: 41        .byte $41   ; 
- D 1 - I - 0x003778 00:B768: 41        .byte $41   ; 
- D 1 - I - 0x003779 00:B769: 41        .byte $41   ; 
- D 1 - I - 0x00377A 00:B76A: 41        .byte $41   ; 
- D 1 - I - 0x00377B 00:B76B: 41        .byte $41   ; 
- D 1 - I - 0x00377C 00:B76C: 41        .byte $41   ; 
- D 1 - I - 0x00377D 00:B76D: 41        .byte $41   ; 
- D 1 - I - 0x00377E 00:B76E: E1        .byte $E1   ; 
- D 1 - I - 0x00377F 00:B76F: 25        .byte $25   ; 
- D 1 - I - 0x003780 00:B770: 24        .byte $24   ; 
- D 1 - I - 0x003781 00:B771: 24        .byte $24   ; 
- D 1 - I - 0x003782 00:B772: 24        .byte $24   ; 
- D 1 - I - 0x003783 00:B773: 00        .byte $00   ; 
- D 1 - I - 0x003784 00:B774: 54        .byte $54   ; 
- D 1 - I - 0x003785 00:B775: 7D        .byte $7D   ; 
- D 1 - I - 0x003786 00:B776: 7D        .byte $7D   ; 
- D 1 - I - 0x003787 00:B777: 30        .byte $30   ; 
- D 1 - I - 0x003788 00:B778: 00        .byte $00   ; 
- D 1 - I - 0x003789 00:B779: 1D        .byte $1D   ; 
- D 1 - I - 0x00378A 00:B77A: 1C        .byte $1C   ; 
- D 1 - I - 0x00378B 00:B77B: 00        .byte $00   ; 
- D 1 - I - 0x00378C 00:B77C: 00        .byte $00   ; 
- D 1 - I - 0x00378D 00:B77D: 82        .byte $82   ; 
- D 1 - I - 0x00378E 00:B77E: 1D        .byte $1D   ; 
- D 1 - I - 0x00378F 00:B77F: 01        .byte $01   ; 
- D 1 - I - 0x003790 00:B780: 02        .byte $02   ; 
- D 1 - I - 0x003791 00:B781: 02        .byte $02   ; 
- D 1 - I - 0x003792 00:B782: 61        .byte $61   ; 
- D 1 - I - 0x003793 00:B783: 62        .byte $62   ; 
- D 1 - I - 0x003794 00:B784: 63        .byte $63   ; 
- D 1 - I - 0x003795 00:B785: 63        .byte $63   ; 
- D 1 - I - 0x003796 00:B786: 64        .byte $64   ; 
- D 1 - I - 0x003797 00:B787: 05        .byte $05   ; 
- D 1 - I - 0x003798 00:B788: 06        .byte $06   ; 
- D 1 - I - 0x003799 00:B789: 06        .byte $06   ; 
- D 1 - I - 0x00379A 00:B78A: 06        .byte $06   ; 
- D 1 - I - 0x00379B 00:B78B: 40        .byte $40   ; 
- D 1 - I - 0x00379C 00:B78C: 40        .byte $40   ; 
- D 1 - I - 0x00379D 00:B78D: 40        .byte $40   ; 
- D 1 - I - 0x00379E 00:B78E: 40        .byte $40   ; 
- D 1 - I - 0x00379F 00:B78F: 01        .byte $01   ; 
- D 1 - I - 0x0037A0 00:B790: 02        .byte $02   ; 
- D 1 - I - 0x0037A1 00:B791: 02        .byte $02   ; 
- D 1 - I - 0x0037A2 00:B792: 61        .byte $61   ; 
- D 1 - I - 0x0037A3 00:B793: 62        .byte $62   ; 
- D 1 - I - 0x0037A4 00:B794: 63        .byte $63   ; 
- D 1 - I - 0x0037A5 00:B795: 63        .byte $63   ; 
- D 1 - I - 0x0037A6 00:B796: 64        .byte $64   ; 
- D 1 - I - 0x0037A7 00:B797: 06        .byte $06   ; 
- D 1 - I - 0x0037A8 00:B798: 06        .byte $06   ; 
- D 1 - I - 0x0037A9 00:B799: 06        .byte $06   ; 
- D 1 - I - 0x0037AA 00:B79A: C2        .byte $C2   ; 
- D 1 - I - 0x0037AB 00:B79B: 40        .byte $40   ; 
- D 1 - I - 0x0037AC 00:B79C: 40        .byte $40   ; 
- D 1 - I - 0x0037AD 00:B79D: 40        .byte $40   ; 
- D 1 - I - 0x0037AE 00:B79E: C3        .byte $C3   ; 
- D 1 - I - 0x0037AF 00:B79F: 40        .byte $40   ; 
- D 1 - I - 0x0037B0 00:B7A0: 40        .byte $40   ; 
- D 1 - I - 0x0037B1 00:B7A1: 40        .byte $40   ; 
- D 1 - I - 0x0037B2 00:B7A2: 40        .byte $40   ; 
- D 1 - I - 0x0037B3 00:B7A3: 40        .byte $40   ; 
- D 1 - I - 0x0037B4 00:B7A4: 40        .byte $40   ; 
- D 1 - I - 0x0037B5 00:B7A5: 40        .byte $40   ; 
- D 1 - I - 0x0037B6 00:B7A6: 40        .byte $40   ; 
- D 1 - I - 0x0037B7 00:B7A7: 40        .byte $40   ; 
- D 1 - I - 0x0037B8 00:B7A8: 40        .byte $40   ; 
- D 1 - I - 0x0037B9 00:B7A9: 40        .byte $40   ; 
- D 1 - I - 0x0037BA 00:B7AA: 40        .byte $40   ; 
- D 1 - I - 0x0037BB 00:B7AB: 40        .byte $40   ; 
- D 1 - I - 0x0037BC 00:B7AC: 40        .byte $40   ; 
- D 1 - I - 0x0037BD 00:B7AD: 40        .byte $40   ; 
- D 1 - I - 0x0037BE 00:B7AE: 40        .byte $40   ; 
- D 1 - I - 0x0037BF 00:B7AF: 40        .byte $40   ; 
- D 1 - I - 0x0037C0 00:B7B0: 40        .byte $40   ; 
- D 1 - I - 0x0037C1 00:B7B1: 40        .byte $40   ; 
- D 1 - I - 0x0037C2 00:B7B2: 7B        .byte $7B   ; 
- D 1 - I - 0x0037C3 00:B7B3: 40        .byte $40   ; 
- D 1 - I - 0x0037C4 00:B7B4: 40        .byte $40   ; 
- D 1 - I - 0x0037C5 00:B7B5: 40        .byte $40   ; 
- D 1 - I - 0x0037C6 00:B7B6: 7B        .byte $7B   ; 
- D 1 - I - 0x0037C7 00:B7B7: 40        .byte $40   ; 
- D 1 - I - 0x0037C8 00:B7B8: 40        .byte $40   ; 
- D 1 - I - 0x0037C9 00:B7B9: 40        .byte $40   ; 
- D 1 - I - 0x0037CA 00:B7BA: 7B        .byte $7B   ; 
- D 1 - I - 0x0037CB 00:B7BB: 40        .byte $40   ; 
- D 1 - I - 0x0037CC 00:B7BC: 40        .byte $40   ; 
- D 1 - I - 0x0037CD 00:B7BD: 40        .byte $40   ; 
- D 1 - I - 0x0037CE 00:B7BE: 7B        .byte $7B   ; 
- D 1 - I - 0x0037CF 00:B7BF: 41        .byte $41   ; 
- D 1 - I - 0x0037D0 00:B7C0: 49        .byte $49   ; 
- D 1 - I - 0x0037D1 00:B7C1: 3F        .byte $3F   ; 
- D 1 - I - 0x0037D2 00:B7C2: 00        .byte $00   ; 
- D 1 - I - 0x0037D3 00:B7C3: 65        .byte $65   ; 
- D 1 - I - 0x0037D4 00:B7C4: 65        .byte $65   ; 
- D 1 - I - 0x0037D5 00:B7C5: 65        .byte $65   ; 
- D 1 - I - 0x0037D6 00:B7C6: 65        .byte $65   ; 
- D 1 - I - 0x0037D7 00:B7C7: 68        .byte $68   ; 
- D 1 - I - 0x0037D8 00:B7C8: 41        .byte $41   ; 
- D 1 - I - 0x0037D9 00:B7C9: 41        .byte $41   ; 
- D 1 - I - 0x0037DA 00:B7CA: 41        .byte $41   ; 
- D 1 - I - 0x0037DB 00:B7CB: 6C        .byte $6C   ; 
- D 1 - I - 0x0037DC 00:B7CC: 6A        .byte $6A   ; 
- D 1 - I - 0x0037DD 00:B7CD: 41        .byte $41   ; 
- D 1 - I - 0x0037DE 00:B7CE: 41        .byte $41   ; 
- D 1 - I - 0x0037DF 00:B7CF: 3F        .byte $3F   ; 
- D 1 - I - 0x0037E0 00:B7D0: 00        .byte $00   ; 
- D 1 - I - 0x0037E1 00:B7D1: 3F        .byte $3F   ; 
- D 1 - I - 0x0037E2 00:B7D2: 00        .byte $00   ; 
- D 1 - I - 0x0037E3 00:B7D3: 65        .byte $65   ; 
- D 1 - I - 0x0037E4 00:B7D4: 65        .byte $65   ; 
- D 1 - I - 0x0037E5 00:B7D5: 65        .byte $65   ; 
- D 1 - I - 0x0037E6 00:B7D6: 6B        .byte $6B   ; 
- D 1 - I - 0x0037E7 00:B7D7: 41        .byte $41   ; 
- D 1 - I - 0x0037E8 00:B7D8: 41        .byte $41   ; 
- D 1 - I - 0x0037E9 00:B7D9: 41        .byte $41   ; 
- D 1 - I - 0x0037EA 00:B7DA: 6D        .byte $6D   ; 
- D 1 - I - 0x0037EB 00:B7DB: 41        .byte $41   ; 
- D 1 - I - 0x0037EC 00:B7DC: 41        .byte $41   ; 
- D 1 - I - 0x0037ED 00:B7DD: 41        .byte $41   ; 
- D 1 - I - 0x0037EE 00:B7DE: 6D        .byte $6D   ; 
- D 1 - I - 0x0037EF 00:B7DF: 40        .byte $40   ; 
- D 1 - I - 0x0037F0 00:B7E0: 40        .byte $40   ; 
- D 1 - I - 0x0037F1 00:B7E1: 40        .byte $40   ; 
- D 1 - I - 0x0037F2 00:B7E2: 40        .byte $40   ; 
- D 1 - I - 0x0037F3 00:B7E3: 40        .byte $40   ; 
- D 1 - I - 0x0037F4 00:B7E4: 40        .byte $40   ; 
- D 1 - I - 0x0037F5 00:B7E5: 40        .byte $40   ; 
- D 1 - I - 0x0037F6 00:B7E6: 40        .byte $40   ; 
- D 1 - I - 0x0037F7 00:B7E7: 40        .byte $40   ; 
- D 1 - I - 0x0037F8 00:B7E8: 40        .byte $40   ; 
- D 1 - I - 0x0037F9 00:B7E9: 69        .byte $69   ; 
- D 1 - I - 0x0037FA 00:B7EA: 68        .byte $68   ; 
- D 1 - I - 0x0037FB 00:B7EB: 40        .byte $40   ; 
- D 1 - I - 0x0037FC 00:B7EC: 40        .byte $40   ; 
- D 1 - I - 0x0037FD 00:B7ED: 69        .byte $69   ; 
- D 1 - I - 0x0037FE 00:B7EE: 6C        .byte $6C   ; 
- D 1 - I - 0x0037FF 00:B7EF: 40        .byte $40   ; 
- D 1 - I - 0x003800 00:B7F0: 40        .byte $40   ; 
- D 1 - I - 0x003801 00:B7F1: 40        .byte $40   ; 
- D 1 - I - 0x003802 00:B7F2: 7B        .byte $7B   ; 
- D 1 - I - 0x003803 00:B7F3: 40        .byte $40   ; 
- D 1 - I - 0x003804 00:B7F4: 40        .byte $40   ; 
- D 1 - I - 0x003805 00:B7F5: 40        .byte $40   ; 
- D 1 - I - 0x003806 00:B7F6: 7B        .byte $7B   ; 
- D 1 - I - 0x003807 00:B7F7: 41        .byte $41   ; 
- D 1 - I - 0x003808 00:B7F8: 41        .byte $41   ; 
- D 1 - I - 0x003809 00:B7F9: 41        .byte $41   ; 
- D 1 - I - 0x00380A 00:B7FA: 4A        .byte $4A   ; 
- D 1 - I - 0x00380B 00:B7FB: 6A        .byte $6A   ; 
- D 1 - I - 0x00380C 00:B7FC: 41        .byte $41   ; 
- D 1 - I - 0x00380D 00:B7FD: 41        .byte $41   ; 
- D 1 - I - 0x00380E 00:B7FE: 26        .byte $26   ; 
- D 1 - I - 0x00380F 00:B7FF: 41        .byte $41   ; 
- D 1 - I - 0x003810 00:B800: 49        .byte $49   ; 
- D 1 - I - 0x003811 00:B801: 6A        .byte $6A   ; 
- D 1 - I - 0x003812 00:B802: 41        .byte $41   ; 
- D 1 - I - 0x003813 00:B803: 41        .byte $41   ; 
- D 1 - I - 0x003814 00:B804: 6C        .byte $6C   ; 
- D 1 - I - 0x003815 00:B805: 00        .byte $00   ; 
- D 1 - I - 0x003816 00:B806: 6A        .byte $6A   ; 
- D 1 - I - 0x003817 00:B807: 41        .byte $41   ; 
- D 1 - I - 0x003818 00:B808: 41        .byte $41   ; 
- D 1 - I - 0x003819 00:B809: 49        .byte $49   ; 
- D 1 - I - 0x00381A 00:B80A: 00        .byte $00   ; 
- D 1 - I - 0x00381B 00:B80B: 41        .byte $41   ; 
- D 1 - I - 0x00381C 00:B80C: 41        .byte $41   ; 
- D 1 - I - 0x00381D 00:B80D: 6C        .byte $6C   ; 
- D 1 - I - 0x00381E 00:B80E: 00        .byte $00   ; 
- D 1 - I - 0x00381F 00:B80F: 41        .byte $41   ; 
- D 1 - I - 0x003820 00:B810: 41        .byte $41   ; 
- D 1 - I - 0x003821 00:B811: 41        .byte $41   ; 
- D 1 - I - 0x003822 00:B812: 6D        .byte $6D   ; 
- D 1 - I - 0x003823 00:B813: 41        .byte $41   ; 
- D 1 - I - 0x003824 00:B814: 41        .byte $41   ; 
- D 1 - I - 0x003825 00:B815: 41        .byte $41   ; 
- D 1 - I - 0x003826 00:B816: 6D        .byte $6D   ; 
- D 1 - I - 0x003827 00:B817: 6A        .byte $6A   ; 
- D 1 - I - 0x003828 00:B818: 41        .byte $41   ; 
- D 1 - I - 0x003829 00:B819: 41        .byte $41   ; 
- D 1 - I - 0x00382A 00:B81A: 6D        .byte $6D   ; 
- D 1 - I - 0x00382B 00:B81B: 00        .byte $00   ; 
- D 1 - I - 0x00382C 00:B81C: 6A        .byte $6A   ; 
- D 1 - I - 0x00382D 00:B81D: 41        .byte $41   ; 
- D 1 - I - 0x00382E 00:B81E: 6D        .byte $6D   ; 
- D 1 - I - 0x00382F 00:B81F: 40        .byte $40   ; 
- D 1 - I - 0x003830 00:B820: 40        .byte $40   ; 
- D 1 - I - 0x003831 00:B821: 69        .byte $69   ; 
- D 1 - I - 0x003832 00:B822: 41        .byte $41   ; 
- D 1 - I - 0x003833 00:B823: 40        .byte $40   ; 
- D 1 - I - 0x003834 00:B824: 40        .byte $40   ; 
- D 1 - I - 0x003835 00:B825: 69        .byte $69   ; 
- D 1 - I - 0x003836 00:B826: 41        .byte $41   ; 
- D 1 - I - 0x003837 00:B827: 40        .byte $40   ; 
- D 1 - I - 0x003838 00:B828: 40        .byte $40   ; 
- D 1 - I - 0x003839 00:B829: 69        .byte $69   ; 
- D 1 - I - 0x00383A 00:B82A: 41        .byte $41   ; 
- D 1 - I - 0x00383B 00:B82B: 40        .byte $40   ; 
- D 1 - I - 0x00383C 00:B82C: 40        .byte $40   ; 
- D 1 - I - 0x00383D 00:B82D: 69        .byte $69   ; 
- D 1 - I - 0x00383E 00:B82E: 41        .byte $41   ; 
- D 1 - I - 0x00383F 00:B82F: 49        .byte $49   ; 
- D 1 - I - 0x003840 00:B830: 6A        .byte $6A   ; 
- D 1 - I - 0x003841 00:B831: 41        .byte $41   ; 
- D 1 - I - 0x003842 00:B832: 41        .byte $41   ; 
- D 1 - I - 0x003843 00:B833: 6C        .byte $6C   ; 
- D 1 - I - 0x003844 00:B834: 00        .byte $00   ; 
- D 1 - I - 0x003845 00:B835: 6A        .byte $6A   ; 
- D 1 - I - 0x003846 00:B836: 41        .byte $41   ; 
- D 1 - I - 0x003847 00:B837: 41        .byte $41   ; 
- D 1 - I - 0x003848 00:B838: 49        .byte $49   ; 
- D 1 - I - 0x003849 00:B839: 3F        .byte $3F   ; 
- D 1 - I - 0x00384A 00:B83A: 6A        .byte $6A   ; 
- D 1 - I - 0x00384B 00:B83B: 41        .byte $41   ; 
- D 1 - I - 0x00384C 00:B83C: 76        .byte $76   ; 
- D 1 - I - 0x00384D 00:B83D: 00        .byte $00   ; 
- D 1 - I - 0x00384E 00:B83E: 00        .byte $00   ; 
- D 1 - I - 0x00384F 00:B83F: 1A        .byte $1A   ; 
- D 1 - I - 0x003850 00:B840: C1        .byte $C1   ; 
- D 1 - I - 0x003851 00:B841: 10        .byte $10   ; 
- D 1 - I - 0x003852 00:B842: 10        .byte $10   ; 
- D 1 - I - 0x003853 00:B843: 12        .byte $12   ; 
- D 1 - I - 0x003854 00:B844: 87        .byte $87   ; 
- D 1 - I - 0x003855 00:B845: 88        .byte $88   ; 
- D 1 - I - 0x003856 00:B846: 89        .byte $89   ; 
- D 1 - I - 0x003857 00:B847: 12        .byte $12   ; 
- D 1 - I - 0x003858 00:B848: 87        .byte $87   ; 
- D 1 - I - 0x003859 00:B849: 13        .byte $13   ; 
- D 1 - I - 0x00385A 00:B84A: 8D        .byte $8D   ; 
- D 1 - I - 0x00385B 00:B84B: 12        .byte $12   ; 
- D 1 - I - 0x00385C 00:B84C: 87        .byte $87   ; 
- D 1 - I - 0x00385D 00:B84D: 8F        .byte $8F   ; 
- D 1 - I - 0x00385E 00:B84E: BE        .byte $BE   ; 
- D 1 - I - 0x00385F 00:B84F: 10        .byte $10   ; 
- D 1 - I - 0x003860 00:B850: 10        .byte $10   ; 
- D 1 - I - 0x003861 00:B851: 11        .byte $11   ; 
- D 1 - I - 0x003862 00:B852: 86        .byte $86   ; 
- D 1 - I - 0x003863 00:B853: 8A        .byte $8A   ; 
- D 1 - I - 0x003864 00:B854: 8B        .byte $8B   ; 
- D 1 - I - 0x003865 00:B855: 15        .byte $15   ; 
- D 1 - I - 0x003866 00:B856: 15        .byte $15   ; 
- D 1 - I - 0x003867 00:B857: 14        .byte $14   ; 
- D 1 - I - 0x003868 00:B858: 8E        .byte $8E   ; 
- D 1 - I - 0x003869 00:B859: 15        .byte $15   ; 
- D 1 - I - 0x00386A 00:B85A: 15        .byte $15   ; 
- D 1 - I - 0x00386B 00:B85B: BF        .byte $BF   ; 
- D 1 - I - 0x00386C 00:B85C: 91        .byte $91   ; 
- D 1 - I - 0x00386D 00:B85D: 15        .byte $15   ; 
- D 1 - I - 0x00386E 00:B85E: 15        .byte $15   ; 
- D 1 - I - 0x00386F 00:B85F: 88        .byte $88   ; 
- D 1 - I - 0x003870 00:B860: 89        .byte $89   ; 
- D 1 - I - 0x003871 00:B861: 8A        .byte $8A   ; 
- D 1 - I - 0x003872 00:B862: 8B        .byte $8B   ; 
- D 1 - I - 0x003873 00:B863: 9D        .byte $9D   ; 
- D 1 - I - 0x003874 00:B864: 9E        .byte $9E   ; 
- D 1 - I - 0x003875 00:B865: 14        .byte $14   ; 
- D 1 - I - 0x003876 00:B866: 8E        .byte $8E   ; 
- D 1 - I - 0x003877 00:B867: 9F        .byte $9F   ; 
- D 1 - I - 0x003878 00:B868: A0        .byte $A0   ; 
- D 1 - I - 0x003879 00:B869: 90        .byte $90   ; 
- D 1 - I - 0x00387A 00:B86A: 91        .byte $91   ; 
- D 1 - I - 0x00387B 00:B86B: A1        .byte $A1   ; 
- D 1 - I - 0x00387C 00:B86C: A2        .byte $A2   ; 
- D 1 - I - 0x00387D 00:B86D: 93        .byte $93   ; 
- D 1 - I - 0x00387E 00:B86E: 94        .byte $94   ; 
- D 1 - I - 0x00387F 00:B86F: 88        .byte $88   ; 
- D 1 - I - 0x003880 00:B870: 89        .byte $89   ; 
- D 1 - I - 0x003881 00:B871: 8A        .byte $8A   ; 
- D 1 - I - 0x003882 00:B872: 8B        .byte $8B   ; 
- D 1 - I - 0x003883 00:B873: A3        .byte $A3   ; 
- D 1 - I - 0x003884 00:B874: A4        .byte $A4   ; 
- D 1 - I - 0x003885 00:B875: 14        .byte $14   ; 
- D 1 - I - 0x003886 00:B876: 8E        .byte $8E   ; 
- D 1 - I - 0x003887 00:B877: A5        .byte $A5   ; 
- D 1 - I - 0x003888 00:B878: A6        .byte $A6   ; 
- D 1 - I - 0x003889 00:B879: 90        .byte $90   ; 
- D 1 - I - 0x00388A 00:B87A: 91        .byte $91   ; 
- D 1 - I - 0x00388B 00:B87B: A7        .byte $A7   ; 
- D 1 - I - 0x00388C 00:B87C: A8        .byte $A8   ; 
- D 1 - I - 0x00388D 00:B87D: 93        .byte $93   ; 
- D 1 - I - 0x00388E 00:B87E: 94        .byte $94   ; 
- D 1 - I - 0x00388F 00:B87F: 12        .byte $12   ; 
- D 1 - I - 0x003890 00:B880: 87        .byte $87   ; 
- D 1 - I - 0x003891 00:B881: 16        .byte $16   ; 
- D 1 - I - 0x003892 00:B882: C0        .byte $C0   ; 
- D 1 - I - 0x003893 00:B883: 12        .byte $12   ; 
- D 1 - I - 0x003894 00:B884: 95        .byte $95   ; 
- D 1 - I - 0x003895 00:B885: 96        .byte $96   ; 
- D 1 - I - 0x003896 00:B886: 96        .byte $96   ; 
- D 1 - I - 0x003897 00:B887: 12        .byte $12   ; 
- D 1 - I - 0x003898 00:B888: 98        .byte $98   ; 
- D 1 - I - 0x003899 00:B889: 18        .byte $18   ; 
- D 1 - I - 0x00389A 00:B88A: 19        .byte $19   ; 
- D 1 - I - 0x00389B 00:B88B: 99        .byte $99   ; 
- D 1 - I - 0x00389C 00:B88C: 9A        .byte $9A   ; 
- D 1 - I - 0x00389D 00:B88D: 9A        .byte $9A   ; 
- D 1 - I - 0x00389E 00:B88E: 9B        .byte $9B   ; 
- D 1 - I - 0x00389F 00:B88F: 17        .byte $17   ; 
- D 1 - I - 0x0038A0 00:B890: 94        .byte $94   ; 
- D 1 - I - 0x0038A1 00:B891: 15        .byte $15   ; 
- D 1 - I - 0x0038A2 00:B892: 15        .byte $15   ; 
- D 1 - I - 0x0038A3 00:B893: 96        .byte $96   ; 
- D 1 - I - 0x0038A4 00:B894: 96        .byte $96   ; 
- D 1 - I - 0x0038A5 00:B895: 97        .byte $97   ; 
- D 1 - I - 0x0038A6 00:B896: 15        .byte $15   ; 
- D 1 - I - 0x0038A7 00:B897: 19        .byte $19   ; 
- D 1 - I - 0x0038A8 00:B898: 18        .byte $18   ; 
- D 1 - I - 0x0038A9 00:B899: 2E        .byte $2E   ; 
- D 1 - I - 0x0038AA 00:B89A: 15        .byte $15   ; 
- D 1 - I - 0x0038AB 00:B89B: 9B        .byte $9B   ; 
- D 1 - I - 0x0038AC 00:B89C: 9A        .byte $9A   ; 
- D 1 - I - 0x0038AD 00:B89D: 9A        .byte $9A   ; 
- D 1 - I - 0x0038AE 00:B89E: 9C        .byte $9C   ; 
- D 1 - I - 0x0038AF 00:B89F: 88        .byte $88   ; 
- D 1 - I - 0x0038B0 00:B8A0: 89        .byte $89   ; 
- D 1 - I - 0x0038B1 00:B8A1: 8A        .byte $8A   ; 
- D 1 - I - 0x0038B2 00:B8A2: 8B        .byte $8B   ; 
- D 1 - I - 0x0038B3 00:B8A3: 8C        .byte $8C   ; 
- D 1 - I - 0x0038B4 00:B8A4: 8D        .byte $8D   ; 
- D 1 - I - 0x0038B5 00:B8A5: A9        .byte $A9   ; 
- D 1 - I - 0x0038B6 00:B8A6: AA        .byte $AA   ; 
- D 1 - I - 0x0038B7 00:B8A7: 8F        .byte $8F   ; 
- D 1 - I - 0x0038B8 00:B8A8: 14        .byte $14   ; 
- D 1 - I - 0x0038B9 00:B8A9: AB        .byte $AB   ; 
- D 1 - I - 0x0038BA 00:B8AA: AD        .byte $AD   ; 
- D 1 - I - 0x0038BB 00:B8AB: 16        .byte $16   ; 
- D 1 - I - 0x0038BC 00:B8AC: 92        .byte $92   ; 
- D 1 - I - 0x0038BD 00:B8AD: AC        .byte $AC   ; 
- D 1 - I - 0x0038BE 00:B8AE: AE        .byte $AE   ; 
- D 1 - I - 0x0038BF 00:B8AF: 88        .byte $88   ; 
- D 1 - I - 0x0038C0 00:B8B0: 89        .byte $89   ; 
- D 1 - I - 0x0038C1 00:B8B1: 8A        .byte $8A   ; 
- D 1 - I - 0x0038C2 00:B8B2: 8B        .byte $8B   ; 
- D 1 - I - 0x0038C3 00:B8B3: 8C        .byte $8C   ; 
- D 1 - I - 0x0038C4 00:B8B4: 8D        .byte $8D   ; 
- D 1 - I - 0x0038C5 00:B8B5: AF        .byte $AF   ; 
- D 1 - I - 0x0038C6 00:B8B6: B0        .byte $B0   ; 
- D 1 - I - 0x0038C7 00:B8B7: 8F        .byte $8F   ; 
- D 1 - I - 0x0038C8 00:B8B8: 14        .byte $14   ; 
- D 1 - I - 0x0038C9 00:B8B9: 14        .byte $14   ; 
- D 1 - I - 0x0038CA 00:B8BA: B1        .byte $B1   ; 
- D 1 - I - 0x0038CB 00:B8BB: 16        .byte $16   ; 
- D 1 - I - 0x0038CC 00:B8BC: 92        .byte $92   ; 
- D 1 - I - 0x0038CD 00:B8BD: 93        .byte $93   ; 
- D 1 - I - 0x0038CE 00:B8BE: 94        .byte $94   ; 
- D 1 - I - 0x0038CF 00:B8BF: 88        .byte $88   ; 
- D 1 - I - 0x0038D0 00:B8C0: B2        .byte $B2   ; 
- D 1 - I - 0x0038D1 00:B8C1: B3        .byte $B3   ; 
- D 1 - I - 0x0038D2 00:B8C2: B4        .byte $B4   ; 
- D 1 - I - 0x0038D3 00:B8C3: B5        .byte $B5   ; 
- D 1 - I - 0x0038D4 00:B8C4: 00        .byte $00   ; 
- D 1 - I - 0x0038D5 00:B8C5: B6        .byte $B6   ; 
- D 1 - I - 0x0038D6 00:B8C6: B7        .byte $B7   ; 
- D 1 - I - 0x0038D7 00:B8C7: B8        .byte $B8   ; 
- D 1 - I - 0x0038D8 00:B8C8: B9        .byte $B9   ; 
- D 1 - I - 0x0038D9 00:B8C9: BA        .byte $BA   ; 
- D 1 - I - 0x0038DA 00:B8CA: BB        .byte $BB   ; 
- D 1 - I - 0x0038DB 00:B8CB: 16        .byte $16   ; 
- D 1 - I - 0x0038DC 00:B8CC: BC        .byte $BC   ; 
- D 1 - I - 0x0038DD 00:B8CD: BD        .byte $BD   ; 
- D 1 - I - 0x0038DE 00:B8CE: 94        .byte $94   ; 
- D 1 - I - 0x0038DF 00:B8CF: 07        .byte $07   ; 
- D 1 - I - 0x0038E0 00:B8D0: 40        .byte $40   ; 
- D 1 - I - 0x0038E1 00:B8D1: 07        .byte $07   ; 
- D 1 - I - 0x0038E2 00:B8D2: 40        .byte $40   ; 
- D 1 - I - 0x0038E3 00:B8D3: 52        .byte $52   ; 
- D 1 - I - 0x0038E4 00:B8D4: 53        .byte $53   ; 
- D 1 - I - 0x0038E5 00:B8D5: 53        .byte $53   ; 
- D 1 - I - 0x0038E6 00:B8D6: 53        .byte $53   ; 
- D 1 - I - 0x0038E7 00:B8D7: 05        .byte $05   ; 
- D 1 - I - 0x0038E8 00:B8D8: 06        .byte $06   ; 
- D 1 - I - 0x0038E9 00:B8D9: 06        .byte $06   ; 
- D 1 - I - 0x0038EA 00:B8DA: 06        .byte $06   ; 
- D 1 - I - 0x0038EB 00:B8DB: 40        .byte $40   ; 
- D 1 - I - 0x0038EC 00:B8DC: 40        .byte $40   ; 
- D 1 - I - 0x0038ED 00:B8DD: 40        .byte $40   ; 
- D 1 - I - 0x0038EE 00:B8DE: 40        .byte $40   ; 
- D 1 - I - 0x0038EF 00:B8DF: 07        .byte $07   ; 
- D 1 - I - 0x0038F0 00:B8E0: 40        .byte $40   ; 
- D 1 - I - 0x0038F1 00:B8E1: 07        .byte $07   ; 
- D 1 - I - 0x0038F2 00:B8E2: C3        .byte $C3   ; 
- D 1 - I - 0x0038F3 00:B8E3: 53        .byte $53   ; 
- D 1 - I - 0x0038F4 00:B8E4: 53        .byte $53   ; 
- D 1 - I - 0x0038F5 00:B8E5: 53        .byte $53   ; 
- D 1 - I - 0x0038F6 00:B8E6: C4        .byte $C4   ; 
- D 1 - I - 0x0038F7 00:B8E7: 06        .byte $06   ; 
- D 1 - I - 0x0038F8 00:B8E8: 06        .byte $06   ; 
- D 1 - I - 0x0038F9 00:B8E9: 06        .byte $06   ; 
- D 1 - I - 0x0038FA 00:B8EA: C2        .byte $C2   ; 
- D 1 - I - 0x0038FB 00:B8EB: 40        .byte $40   ; 
- D 1 - I - 0x0038FC 00:B8EC: 40        .byte $40   ; 
- D 1 - I - 0x0038FD 00:B8ED: 40        .byte $40   ; 
- D 1 - I - 0x0038FE 00:B8EE: C3        .byte $C3   ; 
- D 1 - I - 0x0038FF 00:B8EF: 07        .byte $07   ; 
- D 1 - I - 0x003900 00:B8F0: 40        .byte $40   ; 
- D 1 - I - 0x003901 00:B8F1: 07        .byte $07   ; 
- D 1 - I - 0x003902 00:B8F2: 40        .byte $40   ; 
- D 1 - I - 0x003903 00:B8F3: 53        .byte $53   ; 
- D 1 - I - 0x003904 00:B8F4: 53        .byte $53   ; 
- D 1 - I - 0x003905 00:B8F5: 53        .byte $53   ; 
- D 1 - I - 0x003906 00:B8F6: 53        .byte $53   ; 
- D 1 - I - 0x003907 00:B8F7: 06        .byte $06   ; 
- D 1 - I - 0x003908 00:B8F8: 06        .byte $06   ; 
- D 1 - I - 0x003909 00:B8F9: 06        .byte $06   ; 
- D 1 - I - 0x00390A 00:B8FA: 06        .byte $06   ; 
- D 1 - I - 0x00390B 00:B8FB: 40        .byte $40   ; 
- D 1 - I - 0x00390C 00:B8FC: 40        .byte $40   ; 
- D 1 - I - 0x00390D 00:B8FD: 40        .byte $40   ; 
- D 1 - I - 0x00390E 00:B8FE: 40        .byte $40   ; 
- D 1 - I - 0x00390F 00:B8FF: 00        .byte $00   ; 
- D 1 - I - 0x003910 00:B900: 00        .byte $00   ; 
- D 1 - I - 0x003911 00:B901: 00        .byte $00   ; 
- D 1 - I - 0x003912 00:B902: 00        .byte $00   ; 
- D 1 - I - 0x003913 00:B903: 00        .byte $00   ; 
- D 1 - I - 0x003914 00:B904: 00        .byte $00   ; 
- D 1 - I - 0x003915 00:B905: 00        .byte $00   ; 
- D 1 - I - 0x003916 00:B906: 00        .byte $00   ; 
- D 1 - I - 0x003917 00:B907: 05        .byte $05   ; 
- D 1 - I - 0x003918 00:B908: 06        .byte $06   ; 
- D 1 - I - 0x003919 00:B909: 06        .byte $06   ; 
- D 1 - I - 0x00391A 00:B90A: 06        .byte $06   ; 
- D 1 - I - 0x00391B 00:B90B: 40        .byte $40   ; 
- D 1 - I - 0x00391C 00:B90C: 40        .byte $40   ; 
- D 1 - I - 0x00391D 00:B90D: 40        .byte $40   ; 
- D 1 - I - 0x00391E 00:B90E: 40        .byte $40   ; 
- D 1 - I - 0x00391F 00:B90F: 07        .byte $07   ; 
- D 1 - I - 0x003920 00:B910: 40        .byte $40   ; 
- D 1 - I - 0x003921 00:B911: 07        .byte $07   ; 
- D 1 - I - 0x003922 00:B912: 40        .byte $40   ; 
- D 1 - I - 0x003923 00:B913: 52        .byte $52   ; 
- D 1 - I - 0x003924 00:B914: 53        .byte $53   ; 
- D 1 - I - 0x003925 00:B915: 53        .byte $53   ; 
- D 1 - I - 0x003926 00:B916: 53        .byte $53   ; 
- D 1 - I - 0x003927 00:B917: 06        .byte $06   ; 
- D 1 - I - 0x003928 00:B918: 06        .byte $06   ; 
- D 1 - I - 0x003929 00:B919: 06        .byte $06   ; 
- D 1 - I - 0x00392A 00:B91A: 06        .byte $06   ; 
- D 1 - I - 0x00392B 00:B91B: 40        .byte $40   ; 
- D 1 - I - 0x00392C 00:B91C: 40        .byte $40   ; 
- D 1 - I - 0x00392D 00:B91D: 40        .byte $40   ; 
- D 1 - I - 0x00392E 00:B91E: 40        .byte $40   ; 
- D 1 - I - 0x00392F 00:B91F: 07        .byte $07   ; 
- D 1 - I - 0x003930 00:B920: 40        .byte $40   ; 
- D 1 - I - 0x003931 00:B921: 07        .byte $07   ; 
- D 1 - I - 0x003932 00:B922: C3        .byte $C3   ; 
- D 1 - I - 0x003933 00:B923: 53        .byte $53   ; 
- D 1 - I - 0x003934 00:B924: 53        .byte $53   ; 
- D 1 - I - 0x003935 00:B925: 53        .byte $53   ; 
- D 1 - I - 0x003936 00:B926: C4        .byte $C4   ; 
- D 1 - I - 0x003937 00:B927: 06        .byte $06   ; 
- D 1 - I - 0x003938 00:B928: 06        .byte $06   ; 
- D 1 - I - 0x003939 00:B929: 06        .byte $06   ; 
- D 1 - I - 0x00393A 00:B92A: 06        .byte $06   ; 
- D 1 - I - 0x00393B 00:B92B: 40        .byte $40   ; 
- D 1 - I - 0x00393C 00:B92C: 40        .byte $40   ; 
- D 1 - I - 0x00393D 00:B92D: 40        .byte $40   ; 
- D 1 - I - 0x00393E 00:B92E: 40        .byte $40   ; 
- D 1 - I - 0x00393F 00:B92F: 00        .byte $00   ; 
- D 1 - I - 0x003940 00:B930: 00        .byte $00   ; 
- D 1 - I - 0x003941 00:B931: 00        .byte $00   ; 
- D 1 - I - 0x003942 00:B932: 00        .byte $00   ; 
- D 1 - I - 0x003943 00:B933: 00        .byte $00   ; 
- D 1 - I - 0x003944 00:B934: 00        .byte $00   ; 
- D 1 - I - 0x003945 00:B935: 00        .byte $00   ; 
- D 1 - I - 0x003946 00:B936: 00        .byte $00   ; 
- D 1 - I - 0x003947 00:B937: 06        .byte $06   ; 
- D 1 - I - 0x003948 00:B938: 06        .byte $06   ; 
- D 1 - I - 0x003949 00:B939: 06        .byte $06   ; 
- D 1 - I - 0x00394A 00:B93A: C2        .byte $C2   ; 
- D 1 - I - 0x00394B 00:B93B: 40        .byte $40   ; 
- D 1 - I - 0x00394C 00:B93C: 40        .byte $40   ; 
- D 1 - I - 0x00394D 00:B93D: 40        .byte $40   ; 
- D 1 - I - 0x00394E 00:B93E: C3        .byte $C3   ; 
- D 1 - I - 0x00394F 00:B93F: 4A        .byte $4A   ; 
- D 1 - I - 0x003950 00:B940: 41        .byte $41   ; 
- D 1 - I - 0x003951 00:B941: 41        .byte $41   ; 
- D 1 - I - 0x003952 00:B942: 49        .byte $49   ; 
- D 1 - I - 0x003953 00:B943: 26        .byte $26   ; 
- D 1 - I - 0x003954 00:B944: 41        .byte $41   ; 
- D 1 - I - 0x003955 00:B945: 41        .byte $41   ; 
- D 1 - I - 0x003956 00:B946: 76        .byte $76   ; 
- D 1 - I - 0x003957 00:B947: 41        .byte $41   ; 
- D 1 - I - 0x003958 00:B948: 4A        .byte $4A   ; 
- D 1 - I - 0x003959 00:B949: 41        .byte $41   ; 
- D 1 - I - 0x00395A 00:B94A: 7A        .byte $7A   ; 
- D 1 - I - 0x00395B 00:B94B: 2D        .byte $2D   ; 
- D 1 - I - 0x00395C 00:B94C: 26        .byte $26   ; 
- D 1 - I - 0x00395D 00:B94D: 41        .byte $41   ; 
- D 1 - I - 0x00395E 00:B94E: 7A        .byte $7A   ; 
- D 1 - I - 0x00395F 00:B94F: 41        .byte $41   ; 
- D 1 - I - 0x003960 00:B950: 7A        .byte $7A   ; 
- D 1 - I - 0x003961 00:B951: 32        .byte $32   ; 
- D 1 - I - 0x003962 00:B952: 41        .byte $41   ; 
- D 1 - I - 0x003963 00:B953: 41        .byte $41   ; 
- D 1 - I - 0x003964 00:B954: 7A        .byte $7A   ; 
- D 1 - I - 0x003965 00:B955: 41        .byte $41   ; 
- D 1 - I - 0x003966 00:B956: 41        .byte $41   ; 
- D 1 - I - 0x003967 00:B957: 41        .byte $41   ; 
- D 1 - I - 0x003968 00:B958: 7A        .byte $7A   ; 
- D 1 - I - 0x003969 00:B959: 32        .byte $32   ; 
- D 1 - I - 0x00396A 00:B95A: 41        .byte $41   ; 
- D 1 - I - 0x00396B 00:B95B: 41        .byte $41   ; 
- D 1 - I - 0x00396C 00:B95C: 7A        .byte $7A   ; 
- D 1 - I - 0x00396D 00:B95D: 41        .byte $41   ; 
- D 1 - I - 0x00396E 00:B95E: 41        .byte $41   ; 
- D 1 - I - 0x00396F 00:B95F: 32        .byte $32   ; 
- D 1 - I - 0x003970 00:B960: 69        .byte $69   ; 
- D 1 - I - 0x003971 00:B961: 32        .byte $32   ; 
- D 1 - I - 0x003972 00:B962: 7A        .byte $7A   ; 
- D 1 - I - 0x003973 00:B963: 41        .byte $41   ; 
- D 1 - I - 0x003974 00:B964: 69        .byte $69   ; 
- D 1 - I - 0x003975 00:B965: 41        .byte $41   ; 
- D 1 - I - 0x003976 00:B966: 7A        .byte $7A   ; 
- D 1 - I - 0x003977 00:B967: 32        .byte $32   ; 
- D 1 - I - 0x003978 00:B968: 69        .byte $69   ; 
- D 1 - I - 0x003979 00:B969: 32        .byte $32   ; 
- D 1 - I - 0x00397A 00:B96A: 7A        .byte $7A   ; 
- D 1 - I - 0x00397B 00:B96B: 41        .byte $41   ; 
- D 1 - I - 0x00397C 00:B96C: 69        .byte $69   ; 
- D 1 - I - 0x00397D 00:B96D: 41        .byte $41   ; 
- D 1 - I - 0x00397E 00:B96E: 7A        .byte $7A   ; 
- D 1 - I - 0x00397F 00:B96F: 40        .byte $40   ; 
- D 1 - I - 0x003980 00:B970: 40        .byte $40   ; 
- D 1 - I - 0x003981 00:B971: 69        .byte $69   ; 
- D 1 - I - 0x003982 00:B972: 41        .byte $41   ; 
- D 1 - I - 0x003983 00:B973: 40        .byte $40   ; 
- D 1 - I - 0x003984 00:B974: 40        .byte $40   ; 
- D 1 - I - 0x003985 00:B975: 69        .byte $69   ; 
- D 1 - I - 0x003986 00:B976: 41        .byte $41   ; 
- D 1 - I - 0x003987 00:B977: 40        .byte $40   ; 
- D 1 - I - 0x003988 00:B978: 40        .byte $40   ; 
- D 1 - I - 0x003989 00:B979: 69        .byte $69   ; 
- D 1 - I - 0x00398A 00:B97A: 41        .byte $41   ; 
- D 1 - I - 0x00398B 00:B97B: 24        .byte $24   ; 
- D 1 - I - 0x00398C 00:B97C: 24        .byte $24   ; 
- D 1 - I - 0x00398D 00:B97D: 24        .byte $24   ; 
- D 1 - I - 0x00398E 00:B97E: 4A        .byte $4A   ; 
- D 1 - I - 0x00398F 00:B97F: 30        .byte $30   ; 
- D 1 - I - 0x003990 00:B980: 00        .byte $00   ; 
- D 1 - I - 0x003991 00:B981: 30        .byte $30   ; 
- D 1 - I - 0x003992 00:B982: 00        .byte $00   ; 
- D 1 - I - 0x003993 00:B983: 00        .byte $00   ; 
- D 1 - I - 0x003994 00:B984: 00        .byte $00   ; 
- D 1 - I - 0x003995 00:B985: 00        .byte $00   ; 
- D 1 - I - 0x003996 00:B986: 00        .byte $00   ; 
- D 1 - I - 0x003997 00:B987: 30        .byte $30   ; 
- D 1 - I - 0x003998 00:B988: 00        .byte $00   ; 
- D 1 - I - 0x003999 00:B989: 30        .byte $30   ; 
- D 1 - I - 0x00399A 00:B98A: 00        .byte $00   ; 
- D 1 - I - 0x00399B 00:B98B: 00        .byte $00   ; 
- D 1 - I - 0x00399C 00:B98C: 00        .byte $00   ; 
- D 1 - I - 0x00399D 00:B98D: 00        .byte $00   ; 
- D 1 - I - 0x00399E 00:B98E: 00        .byte $00   ; 
- D 1 - I - 0x00399F 00:B98F: 41        .byte $41   ; 
- D 1 - I - 0x0039A0 00:B990: 41        .byte $41   ; 
- D 1 - I - 0x0039A1 00:B991: 41        .byte $41   ; 
- D 1 - I - 0x0039A2 00:B992: 26        .byte $26   ; 
- D 1 - I - 0x0039A3 00:B993: 41        .byte $41   ; 
- D 1 - I - 0x0039A4 00:B994: 41        .byte $41   ; 
- D 1 - I - 0x0039A5 00:B995: 41        .byte $41   ; 
- D 1 - I - 0x0039A6 00:B996: 41        .byte $41   ; 
- D 1 - I - 0x0039A7 00:B997: 32        .byte $32   ; 
- D 1 - I - 0x0039A8 00:B998: 41        .byte $41   ; 
- D 1 - I - 0x0039A9 00:B999: 32        .byte $32   ; 
- D 1 - I - 0x0039AA 00:B99A: 41        .byte $41   ; 
- D 1 - I - 0x0039AB 00:B99B: 7D        .byte $7D   ; 
- D 1 - I - 0x0039AC 00:B99C: 7D        .byte $7D   ; 
- D 1 - I - 0x0039AD 00:B99D: 7D        .byte $7D   ; 
- D 1 - I - 0x0039AE 00:B99E: 7D        .byte $7D   ; 
- D 1 - I - 0x0039AF 00:B99F: 41        .byte $41   ; 
- D 1 - I - 0x0039B0 00:B9A0: 7A        .byte $7A   ; 
- D 1 - I - 0x0039B1 00:B9A1: 32        .byte $32   ; 
- D 1 - I - 0x0039B2 00:B9A2: 41        .byte $41   ; 
- D 1 - I - 0x0039B3 00:B9A3: 4A        .byte $4A   ; 
- D 1 - I - 0x0039B4 00:B9A4: 7A        .byte $7A   ; 
- D 1 - I - 0x0039B5 00:B9A5: 41        .byte $41   ; 
- D 1 - I - 0x0039B6 00:B9A6: 41        .byte $41   ; 
- D 1 - I - 0x0039B7 00:B9A7: 26        .byte $26   ; 
- D 1 - I - 0x0039B8 00:B9A8: 7A        .byte $7A   ; 
- D 1 - I - 0x0039B9 00:B9A9: 32        .byte $32   ; 
- D 1 - I - 0x0039BA 00:B9AA: 41        .byte $41   ; 
- D 1 - I - 0x0039BB 00:B9AB: 7D        .byte $7D   ; 
- D 1 - I - 0x0039BC 00:B9AC: 7E        .byte $7E   ; 
- D 1 - I - 0x0039BD 00:B9AD: 41        .byte $41   ; 
- D 1 - I - 0x0039BE 00:B9AE: 41        .byte $41   ; 
- D 1 - I - 0x0039BF 00:B9AF: 32        .byte $32   ; 
- D 1 - I - 0x0039C0 00:B9B0: 41        .byte $41   ; 
- D 1 - I - 0x0039C1 00:B9B1: 32        .byte $32   ; 
- D 1 - I - 0x0039C2 00:B9B2: 41        .byte $41   ; 
- D 1 - I - 0x0039C3 00:B9B3: 41        .byte $41   ; 
- D 1 - I - 0x0039C4 00:B9B4: 41        .byte $41   ; 
- D 1 - I - 0x0039C5 00:B9B5: 41        .byte $41   ; 
- D 1 - I - 0x0039C6 00:B9B6: 41        .byte $41   ; 
- D 1 - I - 0x0039C7 00:B9B7: 31        .byte $31   ; 
- D 1 - I - 0x0039C8 00:B9B8: 40        .byte $40   ; 
- D 1 - I - 0x0039C9 00:B9B9: 31        .byte $31   ; 
- D 1 - I - 0x0039CA 00:B9BA: 40        .byte $40   ; 
- D 1 - I - 0x0039CB 00:B9BB: 24        .byte $24   ; 
- D 1 - I - 0x0039CC 00:B9BC: 24        .byte $24   ; 
- D 1 - I - 0x0039CD 00:B9BD: 24        .byte $24   ; 
- D 1 - I - 0x0039CE 00:B9BE: 24        .byte $24   ; 
- D 1 - I - 0x0039CF 00:B9BF: 32        .byte $32   ; 
- D 1 - I - 0x0039D0 00:B9C0: 69        .byte $69   ; 
- D 1 - I - 0x0039D1 00:B9C1: 32        .byte $32   ; 
- D 1 - I - 0x0039D2 00:B9C2: 7A        .byte $7A   ; 
- D 1 - I - 0x0039D3 00:B9C3: 41        .byte $41   ; 
- D 1 - I - 0x0039D4 00:B9C4: 69        .byte $69   ; 
- D 1 - I - 0x0039D5 00:B9C5: 41        .byte $41   ; 
- D 1 - I - 0x0039D6 00:B9C6: 7A        .byte $7A   ; 
- D 1 - I - 0x0039D7 00:B9C7: 31        .byte $31   ; 
- D 1 - I - 0x0039D8 00:B9C8: 69        .byte $69   ; 
- D 1 - I - 0x0039D9 00:B9C9: 32        .byte $32   ; 
- D 1 - I - 0x0039DA 00:B9CA: 7A        .byte $7A   ; 
- D 1 - I - 0x0039DB 00:B9CB: 24        .byte $24   ; 
- D 1 - I - 0x0039DC 00:B9CC: 24        .byte $24   ; 
- D 1 - I - 0x0039DD 00:B9CD: 4A        .byte $4A   ; 
- D 1 - I - 0x0039DE 00:B9CE: 7A        .byte $7A   ; 
- D 1 - I - 0x0039DF 00:B9CF: 32        .byte $32   ; 
- D 1 - I - 0x0039E0 00:B9D0: 41        .byte $41   ; 
- D 1 - I - 0x0039E1 00:B9D1: 32        .byte $32   ; 
- D 1 - I - 0x0039E2 00:B9D2: 41        .byte $41   ; 
- D 1 - I - 0x0039E3 00:B9D3: 7D        .byte $7D   ; 
- D 1 - I - 0x0039E4 00:B9D4: 7D        .byte $7D   ; 
- D 1 - I - 0x0039E5 00:B9D5: 7D        .byte $7D   ; 
- D 1 - I - 0x0039E6 00:B9D6: 7D        .byte $7D   ; 
- - - - - - 0x0039E7 00:B9D7: 00        .byte $00   ; 
- - - - - - 0x0039E8 00:B9D8: 00        .byte $00   ; 
- - - - - - 0x0039E9 00:B9D9: 00        .byte $00   ; 
- - - - - - 0x0039EA 00:B9DA: 00        .byte $00   ; 
- - - - - - 0x0039EB 00:B9DB: 00        .byte $00   ; 
- - - - - - 0x0039EC 00:B9DC: 00        .byte $00   ; 
- - - - - - 0x0039ED 00:B9DD: 00        .byte $00   ; 
- - - - - - 0x0039EE 00:B9DE: 00        .byte $00   ; 
- D 1 - I - 0x0039EF 00:B9DF: 32        .byte $32   ; 
- D 1 - I - 0x0039F0 00:B9E0: 41        .byte $41   ; 
- D 1 - I - 0x0039F1 00:B9E1: 26        .byte $26   ; 
- D 1 - I - 0x0039F2 00:B9E2: 7A        .byte $7A   ; 
- D 1 - I - 0x0039F3 00:B9E3: 7D        .byte $7D   ; 
- D 1 - I - 0x0039F4 00:B9E4: 7D        .byte $7D   ; 
- D 1 - I - 0x0039F5 00:B9E5: 7D        .byte $7D   ; 
- D 1 - I - 0x0039F6 00:B9E6: 7E        .byte $7E   ; 
- - - - - - 0x0039F7 00:B9E7: E8        .byte $E8   ; 
- - - - - - 0x0039F8 00:B9E8: E9        .byte $E9   ; 
- - - - - - 0x0039F9 00:B9E9: EA        .byte $EA   ; 
- - - - - - 0x0039FA 00:B9EA: EB        .byte $EB   ; 
- - - - - - 0x0039FB 00:B9EB: F8        .byte $F8   ; 
- - - - - - 0x0039FC 00:B9EC: F9        .byte $F9   ; 
- - - - - - 0x0039FD 00:B9ED: FA        .byte $FA   ; 
- - - - - - 0x0039FE 00:B9EE: FB        .byte $FB   ; 
- D 1 - I - 0x0039FF 00:B9EF: 30        .byte $30   ; 
- D 1 - I - 0x003A00 00:B9F0: 00        .byte $00   ; 
- D 1 - I - 0x003A01 00:B9F1: 30        .byte $30   ; 
- D 1 - I - 0x003A02 00:B9F2: 1E        .byte $1E   ; 
- D 1 - I - 0x003A03 00:B9F3: 00        .byte $00   ; 
- D 1 - I - 0x003A04 00:B9F4: 00        .byte $00   ; 
- D 1 - I - 0x003A05 00:B9F5: 82        .byte $82   ; 
- D 1 - I - 0x003A06 00:B9F6: 00        .byte $00   ; 
- D 1 - I - 0x003A07 00:B9F7: 30        .byte $30   ; 
- D 1 - I - 0x003A08 00:B9F8: 00        .byte $00   ; 
- D 1 - I - 0x003A09 00:B9F9: 30        .byte $30   ; 
- D 1 - I - 0x003A0A 00:B9FA: 82        .byte $82   ; 
- D 1 - I - 0x003A0B 00:B9FB: 00        .byte $00   ; 
- D 1 - I - 0x003A0C 00:B9FC: 00        .byte $00   ; 
- D 1 - I - 0x003A0D 00:B9FD: 00        .byte $00   ; 
- D 1 - I - 0x003A0E 00:B9FE: 00        .byte $00   ; 
- D 1 - I - 0x003A0F 00:B9FF: 3F        .byte $3F   ; 
- D 1 - I - 0x003A10 00:BA00: 00        .byte $00   ; 
- D 1 - I - 0x003A11 00:BA01: 3F        .byte $3F   ; 
- D 1 - I - 0x003A12 00:BA02: 00        .byte $00   ; 
- D 1 - I - 0x003A13 00:BA03: 65        .byte $65   ; 
- D 1 - I - 0x003A14 00:BA04: 65        .byte $65   ; 
- D 1 - I - 0x003A15 00:BA05: 65        .byte $65   ; 
- D 1 - I - 0x003A16 00:BA06: 65        .byte $65   ; 
- D 1 - I - 0x003A17 00:BA07: 41        .byte $41   ; 
- D 1 - I - 0x003A18 00:BA08: 41        .byte $41   ; 
- D 1 - I - 0x003A19 00:BA09: 41        .byte $41   ; 
- D 1 - I - 0x003A1A 00:BA0A: 41        .byte $41   ; 
- D 1 - I - 0x003A1B 00:BA0B: 4B        .byte $4B   ; 
- D 1 - I - 0x003A1C 00:BA0C: 41        .byte $41   ; 
- D 1 - I - 0x003A1D 00:BA0D: 41        .byte $41   ; 
- D 1 - I - 0x003A1E 00:BA0E: 41        .byte $41   ; 
- D 1 - I - 0x003A1F 00:BA0F: 3F        .byte $3F   ; 
- D 1 - I - 0x003A20 00:BA10: 00        .byte $00   ; 
- D 1 - I - 0x003A21 00:BA11: 5F        .byte $5F   ; 
- D 1 - I - 0x003A22 00:BA12: 40        .byte $40   ; 
- D 1 - I - 0x003A23 00:BA13: 65        .byte $65   ; 
- D 1 - I - 0x003A24 00:BA14: 65        .byte $65   ; 
- D 1 - I - 0x003A25 00:BA15: 65        .byte $65   ; 
- D 1 - I - 0x003A26 00:BA16: 6B        .byte $6B   ; 
- D 1 - I - 0x003A27 00:BA17: 41        .byte $41   ; 
- D 1 - I - 0x003A28 00:BA18: 41        .byte $41   ; 
- D 1 - I - 0x003A29 00:BA19: 41        .byte $41   ; 
- D 1 - I - 0x003A2A 00:BA1A: 6E        .byte $6E   ; 
- D 1 - I - 0x003A2B 00:BA1B: 41        .byte $41   ; 
- D 1 - I - 0x003A2C 00:BA1C: 41        .byte $41   ; 
- D 1 - I - 0x003A2D 00:BA1D: 41        .byte $41   ; 
- D 1 - I - 0x003A2E 00:BA1E: 6F        .byte $6F   ; 
- D 1 - I - 0x003A2F 00:BA1F: 40        .byte $40   ; 
- D 1 - I - 0x003A30 00:BA20: 2A        .byte $2A   ; 
- D 1 - I - 0x003A31 00:BA21: 40        .byte $40   ; 
- D 1 - I - 0x003A32 00:BA22: 40        .byte $40   ; 
- D 1 - I - 0x003A33 00:BA23: 40        .byte $40   ; 
- D 1 - I - 0x003A34 00:BA24: 2A        .byte $2A   ; 
- D 1 - I - 0x003A35 00:BA25: 40        .byte $40   ; 
- D 1 - I - 0x003A36 00:BA26: 40        .byte $40   ; 
- D 1 - I - 0x003A37 00:BA27: 40        .byte $40   ; 
- D 1 - I - 0x003A38 00:BA28: 2A        .byte $2A   ; 
- D 1 - I - 0x003A39 00:BA29: 40        .byte $40   ; 
- D 1 - I - 0x003A3A 00:BA2A: 40        .byte $40   ; 
- D 1 - I - 0x003A3B 00:BA2B: 40        .byte $40   ; 
- D 1 - I - 0x003A3C 00:BA2C: 2A        .byte $2A   ; 
- D 1 - I - 0x003A3D 00:BA2D: 40        .byte $40   ; 
- D 1 - I - 0x003A3E 00:BA2E: 40        .byte $40   ; 
- D 1 - I - 0x003A3F 00:BA2F: 4B        .byte $4B   ; 
- D 1 - I - 0x003A40 00:BA30: 41        .byte $41   ; 
- D 1 - I - 0x003A41 00:BA31: 41        .byte $41   ; 
- D 1 - I - 0x003A42 00:BA32: 41        .byte $41   ; 
- D 1 - I - 0x003A43 00:BA33: 4B        .byte $4B   ; 
- D 1 - I - 0x003A44 00:BA34: 41        .byte $41   ; 
- D 1 - I - 0x003A45 00:BA35: 41        .byte $41   ; 
- D 1 - I - 0x003A46 00:BA36: 41        .byte $41   ; 
- D 1 - I - 0x003A47 00:BA37: 41        .byte $41   ; 
- D 1 - I - 0x003A48 00:BA38: 41        .byte $41   ; 
- D 1 - I - 0x003A49 00:BA39: 41        .byte $41   ; 
- D 1 - I - 0x003A4A 00:BA3A: 41        .byte $41   ; 
- D 1 - I - 0x003A4B 00:BA3B: 4B        .byte $4B   ; 
- D 1 - I - 0x003A4C 00:BA3C: 41        .byte $41   ; 
- D 1 - I - 0x003A4D 00:BA3D: 41        .byte $41   ; 
- D 1 - I - 0x003A4E 00:BA3E: 41        .byte $41   ; 
- D 1 - I - 0x003A4F 00:BA3F: 41        .byte $41   ; 
- D 1 - I - 0x003A50 00:BA40: 41        .byte $41   ; 
- D 1 - I - 0x003A51 00:BA41: 4D        .byte $4D   ; 
- D 1 - I - 0x003A52 00:BA42: 50        .byte $50   ; 
- D 1 - I - 0x003A53 00:BA43: 41        .byte $41   ; 
- D 1 - I - 0x003A54 00:BA44: 41        .byte $41   ; 
- D 1 - I - 0x003A55 00:BA45: 74        .byte $74   ; 
- D 1 - I - 0x003A56 00:BA46: 75        .byte $75   ; 
- D 1 - I - 0x003A57 00:BA47: 41        .byte $41   ; 
- D 1 - I - 0x003A58 00:BA48: 4D        .byte $4D   ; 
- D 1 - I - 0x003A59 00:BA49: 4E        .byte $4E   ; 
- D 1 - I - 0x003A5A 00:BA4A: 40        .byte $40   ; 
- D 1 - I - 0x003A5B 00:BA4B: 41        .byte $41   ; 
- D 1 - I - 0x003A5C 00:BA4C: 74        .byte $74   ; 
- D 1 - I - 0x003A5D 00:BA4D: 78        .byte $78   ; 
- D 1 - I - 0x003A5E 00:BA4E: 40        .byte $40   ; 
- D 1 - I - 0x003A5F 00:BA4F: 40        .byte $40   ; 
- D 1 - I - 0x003A60 00:BA50: 2A        .byte $2A   ; 
- D 1 - I - 0x003A61 00:BA51: 40        .byte $40   ; 
- D 1 - I - 0x003A62 00:BA52: 40        .byte $40   ; 
- D 1 - I - 0x003A63 00:BA53: 40        .byte $40   ; 
- D 1 - I - 0x003A64 00:BA54: 2A        .byte $2A   ; 
- D 1 - I - 0x003A65 00:BA55: 40        .byte $40   ; 
- D 1 - I - 0x003A66 00:BA56: 40        .byte $40   ; 
- D 1 - I - 0x003A67 00:BA57: 4F        .byte $4F   ; 
- D 1 - I - 0x003A68 00:BA58: 41        .byte $41   ; 
- D 1 - I - 0x003A69 00:BA59: 41        .byte $41   ; 
- D 1 - I - 0x003A6A 00:BA5A: 41        .byte $41   ; 
- D 1 - I - 0x003A6B 00:BA5B: 67        .byte $67   ; 
- D 1 - I - 0x003A6C 00:BA5C: 41        .byte $41   ; 
- D 1 - I - 0x003A6D 00:BA5D: 41        .byte $41   ; 
- D 1 - I - 0x003A6E 00:BA5E: 41        .byte $41   ; 
- D 1 - I - 0x003A6F 00:BA5F: 40        .byte $40   ; 
- D 1 - I - 0x003A70 00:BA60: 40        .byte $40   ; 
- D 1 - I - 0x003A71 00:BA61: 40        .byte $40   ; 
- D 1 - I - 0x003A72 00:BA62: 40        .byte $40   ; 
- D 1 - I - 0x003A73 00:BA63: 40        .byte $40   ; 
- D 1 - I - 0x003A74 00:BA64: 40        .byte $40   ; 
- D 1 - I - 0x003A75 00:BA65: 40        .byte $40   ; 
- D 1 - I - 0x003A76 00:BA66: 40        .byte $40   ; 
- D 1 - I - 0x003A77 00:BA67: 4D        .byte $4D   ; 
- D 1 - I - 0x003A78 00:BA68: 2A        .byte $2A   ; 
- D 1 - I - 0x003A79 00:BA69: 40        .byte $40   ; 
- D 1 - I - 0x003A7A 00:BA6A: 40        .byte $40   ; 
- D 1 - I - 0x003A7B 00:BA6B: 6F        .byte $6F   ; 
- D 1 - I - 0x003A7C 00:BA6C: 2A        .byte $2A   ; 
- D 1 - I - 0x003A7D 00:BA6D: 40        .byte $40   ; 
- D 1 - I - 0x003A7E 00:BA6E: 40        .byte $40   ; 
- D 1 - I - 0x003A7F 00:BA6F: 4D        .byte $4D   ; 
- D 1 - I - 0x003A80 00:BA70: 41        .byte $41   ; 
- D 1 - I - 0x003A81 00:BA71: 50        .byte $50   ; 
- D 1 - I - 0x003A82 00:BA72: 4F        .byte $4F   ; 
- D 1 - I - 0x003A83 00:BA73: 79        .byte $79   ; 
- D 1 - I - 0x003A84 00:BA74: 41        .byte $41   ; 
- D 1 - I - 0x003A85 00:BA75: 75        .byte $75   ; 
- D 1 - I - 0x003A86 00:BA76: 67        .byte $67   ; 
- D 1 - I - 0x003A87 00:BA77: 56        .byte $56   ; 
- D 1 - I - 0x003A88 00:BA78: 4E        .byte $4E   ; 
- D 1 - I - 0x003A89 00:BA79: 4F        .byte $4F   ; 
- D 1 - I - 0x003A8A 00:BA7A: 41        .byte $41   ; 
- D 1 - I - 0x003A8B 00:BA7B: 56        .byte $56   ; 
- D 1 - I - 0x003A8C 00:BA7C: 78        .byte $78   ; 
- D 1 - I - 0x003A8D 00:BA7D: 67        .byte $67   ; 
- D 1 - I - 0x003A8E 00:BA7E: 41        .byte $41   ; 
- D 1 - I - 0x003A8F 00:BA7F: 41        .byte $41   ; 
- D 1 - I - 0x003A90 00:BA80: 41        .byte $41   ; 
- D 1 - I - 0x003A91 00:BA81: 41        .byte $41   ; 
- D 1 - I - 0x003A92 00:BA82: 4D        .byte $4D   ; 
- D 1 - I - 0x003A93 00:BA83: 41        .byte $41   ; 
- D 1 - I - 0x003A94 00:BA84: 41        .byte $41   ; 
- D 1 - I - 0x003A95 00:BA85: 41        .byte $41   ; 
- D 1 - I - 0x003A96 00:BA86: 74        .byte $74   ; 
- D 1 - I - 0x003A97 00:BA87: 41        .byte $41   ; 
- D 1 - I - 0x003A98 00:BA88: 41        .byte $41   ; 
- D 1 - I - 0x003A99 00:BA89: 4D        .byte $4D   ; 
- D 1 - I - 0x003A9A 00:BA8A: 4E        .byte $4E   ; 
- D 1 - I - 0x003A9B 00:BA8B: 41        .byte $41   ; 
- D 1 - I - 0x003A9C 00:BA8C: 41        .byte $41   ; 
- D 1 - I - 0x003A9D 00:BA8D: 79        .byte $79   ; 
- D 1 - I - 0x003A9E 00:BA8E: 78        .byte $78   ; 
- D 1 - I - 0x003A9F 00:BA8F: 50        .byte $50   ; 
- D 1 - I - 0x003AA0 00:BA90: 2A        .byte $2A   ; 
- D 1 - I - 0x003AA1 00:BA91: 40        .byte $40   ; 
- D 1 - I - 0x003AA2 00:BA92: 40        .byte $40   ; 
- D 1 - I - 0x003AA3 00:BA93: 75        .byte $75   ; 
- D 1 - I - 0x003AA4 00:BA94: 2A        .byte $2A   ; 
- D 1 - I - 0x003AA5 00:BA95: 40        .byte $40   ; 
- D 1 - I - 0x003AA6 00:BA96: 40        .byte $40   ; 
- D 1 - I - 0x003AA7 00:BA97: 40        .byte $40   ; 
- D 1 - I - 0x003AA8 00:BA98: 2A        .byte $2A   ; 
- D 1 - I - 0x003AA9 00:BA99: 40        .byte $40   ; 
- D 1 - I - 0x003AAA 00:BA9A: 40        .byte $40   ; 
- D 1 - I - 0x003AAB 00:BA9B: 40        .byte $40   ; 
- D 1 - I - 0x003AAC 00:BA9C: 2A        .byte $2A   ; 
- D 1 - I - 0x003AAD 00:BA9D: 40        .byte $40   ; 
- D 1 - I - 0x003AAE 00:BA9E: 40        .byte $40   ; 
- D 1 - I - 0x003AAF 00:BA9F: 27        .byte $27   ; 
- D 1 - I - 0x003AB0 00:BAA0: 50        .byte $50   ; 
- D 1 - I - 0x003AB1 00:BAA1: 28        .byte $28   ; 
- D 1 - I - 0x003AB2 00:BAA2: 2F        .byte $2F   ; 
- D 1 - I - 0x003AB3 00:BAA3: 56        .byte $56   ; 
- D 1 - I - 0x003AB4 00:BAA4: 75        .byte $75   ; 
- D 1 - I - 0x003AB5 00:BAA5: 2A        .byte $2A   ; 
- D 1 - I - 0x003AB6 00:BAA6: 2B        .byte $2B   ; 
- D 1 - I - 0x003AB7 00:BAA7: 29        .byte $29   ; 
- D 1 - I - 0x003AB8 00:BAA8: 40        .byte $40   ; 
- D 1 - I - 0x003AB9 00:BAA9: 2A        .byte $2A   ; 
- D 1 - I - 0x003ABA 00:BAAA: 40        .byte $40   ; 
- D 1 - I - 0x003ABB 00:BAAB: 7C        .byte $7C   ; 
- D 1 - I - 0x003ABC 00:BAAC: 40        .byte $40   ; 
- D 1 - I - 0x003ABD 00:BAAD: 2A        .byte $2A   ; 
- D 1 - I - 0x003ABE 00:BAAE: 40        .byte $40   ; 
- D 1 - I - 0x003ABF 00:BAAF: 2F        .byte $2F   ; 
- D 1 - I - 0x003AC0 00:BAB0: 2F        .byte $2F   ; 
- D 1 - I - 0x003AC1 00:BAB1: 56        .byte $56   ; 
- D 1 - I - 0x003AC2 00:BAB2: 50        .byte $50   ; 
- D 1 - I - 0x003AC3 00:BAB3: 41        .byte $41   ; 
- D 1 - I - 0x003AC4 00:BAB4: 41        .byte $41   ; 
- D 1 - I - 0x003AC5 00:BAB5: 56        .byte $56   ; 
- D 1 - I - 0x003AC6 00:BAB6: 75        .byte $75   ; 
- D 1 - I - 0x003AC7 00:BAB7: 2B        .byte $2B   ; 
- D 1 - I - 0x003AC8 00:BAB8: 41        .byte $41   ; 
- D 1 - I - 0x003AC9 00:BAB9: 57        .byte $57   ; 
- D 1 - I - 0x003ACA 00:BABA: 40        .byte $40   ; 
- D 1 - I - 0x003ACB 00:BABB: 40        .byte $40   ; 
- D 1 - I - 0x003ACC 00:BABC: 2B        .byte $2B   ; 
- D 1 - I - 0x003ACD 00:BABD: 7C        .byte $7C   ; 
- D 1 - I - 0x003ACE 00:BABE: 40        .byte $40   ; 
- D 1 - I - 0x003ACF 00:BABF: 2C        .byte $2C   ; 
- D 1 - I - 0x003AD0 00:BAC0: 40        .byte $40   ; 
- D 1 - I - 0x003AD1 00:BAC1: 2A        .byte $2A   ; 
- D 1 - I - 0x003AD2 00:BAC2: 40        .byte $40   ; 
- D 1 - I - 0x003AD3 00:BAC3: 2C        .byte $2C   ; 
- D 1 - I - 0x003AD4 00:BAC4: 40        .byte $40   ; 
- D 1 - I - 0x003AD5 00:BAC5: 2A        .byte $2A   ; 
- D 1 - I - 0x003AD6 00:BAC6: 40        .byte $40   ; 
- D 1 - I - 0x003AD7 00:BAC7: 2C        .byte $2C   ; 
- D 1 - I - 0x003AD8 00:BAC8: 40        .byte $40   ; 
- D 1 - I - 0x003AD9 00:BAC9: 2A        .byte $2A   ; 
- D 1 - I - 0x003ADA 00:BACA: 40        .byte $40   ; 
- D 1 - I - 0x003ADB 00:BACB: 2C        .byte $2C   ; 
- D 1 - I - 0x003ADC 00:BACC: 40        .byte $40   ; 
- D 1 - I - 0x003ADD 00:BACD: 2A        .byte $2A   ; 
- D 1 - I - 0x003ADE 00:BACE: 40        .byte $40   ; 
- D 1 - I - 0x003ADF 00:BACF: 31        .byte $31   ; 
- D 1 - I - 0x003AE0 00:BAD0: 40        .byte $40   ; 
- D 1 - I - 0x003AE1 00:BAD1: 66        .byte $66   ; 
- D 1 - I - 0x003AE2 00:BAD2: 40        .byte $40   ; 
- D 1 - I - 0x003AE3 00:BAD3: 40        .byte $40   ; 
- D 1 - I - 0x003AE4 00:BAD4: 40        .byte $40   ; 
- D 1 - I - 0x003AE5 00:BAD5: 2C        .byte $2C   ; 
- D 1 - I - 0x003AE6 00:BAD6: 40        .byte $40   ; 
- D 1 - I - 0x003AE7 00:BAD7: 31        .byte $31   ; 
- D 1 - I - 0x003AE8 00:BAD8: 40        .byte $40   ; 
- D 1 - I - 0x003AE9 00:BAD9: 66        .byte $66   ; 
- D 1 - I - 0x003AEA 00:BADA: 40        .byte $40   ; 
- D 1 - I - 0x003AEB 00:BADB: 40        .byte $40   ; 
- D 1 - I - 0x003AEC 00:BADC: 40        .byte $40   ; 
- D 1 - I - 0x003AED 00:BADD: 2C        .byte $2C   ; 
- D 1 - I - 0x003AEE 00:BADE: 40        .byte $40   ; 
- D 1 - I - 0x003AEF 00:BADF: 40        .byte $40   ; 
- D 1 - I - 0x003AF0 00:BAE0: 2A        .byte $2A   ; 
- D 1 - I - 0x003AF1 00:BAE1: 40        .byte $40   ; 
- D 1 - I - 0x003AF2 00:BAE2: 40        .byte $40   ; 
- D 1 - I - 0x003AF3 00:BAE3: 40        .byte $40   ; 
- D 1 - I - 0x003AF4 00:BAE4: 2A        .byte $2A   ; 
- D 1 - I - 0x003AF5 00:BAE5: 40        .byte $40   ; 
- D 1 - I - 0x003AF6 00:BAE6: 40        .byte $40   ; 
- D 1 - I - 0x003AF7 00:BAE7: 40        .byte $40   ; 
- D 1 - I - 0x003AF8 00:BAE8: 2A        .byte $2A   ; 
- D 1 - I - 0x003AF9 00:BAE9: 40        .byte $40   ; 
- D 1 - I - 0x003AFA 00:BAEA: 40        .byte $40   ; 
- D 1 - I - 0x003AFB 00:BAEB: 4F        .byte $4F   ; 
- D 1 - I - 0x003AFC 00:BAEC: 24        .byte $24   ; 
- D 1 - I - 0x003AFD 00:BAED: 24        .byte $24   ; 
- D 1 - I - 0x003AFE 00:BAEE: 24        .byte $24   ; 
- D 1 - I - 0x003AFF 00:BAEF: 31        .byte $31   ; 
- D 1 - I - 0x003B00 00:BAF0: 40        .byte $40   ; 
- D 1 - I - 0x003B01 00:BAF1: 66        .byte $66   ; 
- D 1 - I - 0x003B02 00:BAF2: 40        .byte $40   ; 
- D 1 - I - 0x003B03 00:BAF3: 40        .byte $40   ; 
- D 1 - I - 0x003B04 00:BAF4: 40        .byte $40   ; 
- D 1 - I - 0x003B05 00:BAF5: 2C        .byte $2C   ; 
- D 1 - I - 0x003B06 00:BAF6: 4F        .byte $4F   ; 
- D 1 - I - 0x003B07 00:BAF7: 31        .byte $31   ; 
- D 1 - I - 0x003B08 00:BAF8: 40        .byte $40   ; 
- D 1 - I - 0x003B09 00:BAF9: 2C        .byte $2C   ; 
- D 1 - I - 0x003B0A 00:BAFA: 67        .byte $67   ; 
- D 1 - I - 0x003B0B 00:BAFB: 40        .byte $40   ; 
- D 1 - I - 0x003B0C 00:BAFC: 40        .byte $40   ; 
- D 1 - I - 0x003B0D 00:BAFD: 7F        .byte $7F   ; 
- D 1 - I - 0x003B0E 00:BAFE: 7D        .byte $7D   ; 
- D 1 - I - 0x003B0F 00:BAFF: 67        .byte $67   ; 
- D 1 - I - 0x003B10 00:BB00: 41        .byte $41   ; 
- D 1 - I - 0x003B11 00:BB01: 41        .byte $41   ; 
- D 1 - I - 0x003B12 00:BB02: 41        .byte $41   ; 
- D 1 - I - 0x003B13 00:BB03: 41        .byte $41   ; 
- D 1 - I - 0x003B14 00:BB04: 41        .byte $41   ; 
- D 1 - I - 0x003B15 00:BB05: 41        .byte $41   ; 
- D 1 - I - 0x003B16 00:BB06: 41        .byte $41   ; 
- D 1 - I - 0x003B17 00:BB07: 32        .byte $32   ; 
- D 1 - I - 0x003B18 00:BB08: 41        .byte $41   ; 
- D 1 - I - 0x003B19 00:BB09: 32        .byte $32   ; 
- D 1 - I - 0x003B1A 00:BB0A: 41        .byte $41   ; 
- D 1 - I - 0x003B1B 00:BB0B: 7D        .byte $7D   ; 
- D 1 - I - 0x003B1C 00:BB0C: 7D        .byte $7D   ; 
- D 1 - I - 0x003B1D 00:BB0D: 7D        .byte $7D   ; 
- D 1 - I - 0x003B1E 00:BB0E: 7D        .byte $7D   ; 
- D 1 - I - 0x003B1F 00:BB0F: 2C        .byte $2C   ; 
- D 1 - I - 0x003B20 00:BB10: 40        .byte $40   ; 
- D 1 - I - 0x003B21 00:BB11: 2A        .byte $2A   ; 
- D 1 - I - 0x003B22 00:BB12: 40        .byte $40   ; 
- D 1 - I - 0x003B23 00:BB13: 2C        .byte $2C   ; 
- D 1 - I - 0x003B24 00:BB14: 40        .byte $40   ; 
- D 1 - I - 0x003B25 00:BB15: 2A        .byte $2A   ; 
- D 1 - I - 0x003B26 00:BB16: 40        .byte $40   ; 
- D 1 - I - 0x003B27 00:BB17: 2C        .byte $2C   ; 
- D 1 - I - 0x003B28 00:BB18: 40        .byte $40   ; 
- D 1 - I - 0x003B29 00:BB19: 2A        .byte $2A   ; 
- D 1 - I - 0x003B2A 00:BB1A: 40        .byte $40   ; 
- D 1 - I - 0x003B2B 00:BB1B: 2C        .byte $2C   ; 
- D 1 - I - 0x003B2C 00:BB1C: 4F        .byte $4F   ; 
- D 1 - I - 0x003B2D 00:BB1D: 24        .byte $24   ; 
- D 1 - I - 0x003B2E 00:BB1E: 24        .byte $24   ; 
- D 1 - I - 0x003B2F 00:BB1F: 31        .byte $31   ; 
- D 1 - I - 0x003B30 00:BB20: 40        .byte $40   ; 
- D 1 - I - 0x003B31 00:BB21: 2B        .byte $2B   ; 
- D 1 - I - 0x003B32 00:BB22: 41        .byte $41   ; 
- D 1 - I - 0x003B33 00:BB23: 40        .byte $40   ; 
- D 1 - I - 0x003B34 00:BB24: 40        .byte $40   ; 
- D 1 - I - 0x003B35 00:BB25: 40        .byte $40   ; 
- D 1 - I - 0x003B36 00:BB26: 2B        .byte $2B   ; 
- D 1 - I - 0x003B37 00:BB27: 31        .byte $31   ; 
- D 1 - I - 0x003B38 00:BB28: 40        .byte $40   ; 
- D 1 - I - 0x003B39 00:BB29: 31        .byte $31   ; 
- D 1 - I - 0x003B3A 00:BB2A: 40        .byte $40   ; 
- D 1 - I - 0x003B3B 00:BB2B: 24        .byte $24   ; 
- D 1 - I - 0x003B3C 00:BB2C: 24        .byte $24   ; 
- D 1 - I - 0x003B3D 00:BB2D: 24        .byte $24   ; 
- D 1 - I - 0x003B3E 00:BB2E: 24        .byte $24   ; 
- D 1 - I - 0x003B3F 00:BB2F: 32        .byte $32   ; 
- D 1 - I - 0x003B40 00:BB30: 41        .byte $41   ; 
- D 1 - I - 0x003B41 00:BB31: 32        .byte $32   ; 
- D 1 - I - 0x003B42 00:BB32: 41        .byte $41   ; 
- D 1 - I - 0x003B43 00:BB33: 41        .byte $41   ; 
- D 1 - I - 0x003B44 00:BB34: 41        .byte $41   ; 
- D 1 - I - 0x003B45 00:BB35: 41        .byte $41   ; 
- D 1 - I - 0x003B46 00:BB36: 41        .byte $41   ; 
- D 1 - I - 0x003B47 00:BB37: 31        .byte $31   ; 
- D 1 - I - 0x003B48 00:BB38: 40        .byte $40   ; 
- D 1 - I - 0x003B49 00:BB39: 31        .byte $31   ; 
- D 1 - I - 0x003B4A 00:BB3A: 40        .byte $40   ; 
- D 1 - I - 0x003B4B 00:BB3B: 24        .byte $24   ; 
- D 1 - I - 0x003B4C 00:BB3C: 24        .byte $24   ; 
- D 1 - I - 0x003B4D 00:BB3D: 24        .byte $24   ; 
- D 1 - I - 0x003B4E 00:BB3E: 24        .byte $24   ; 
- D 1 - I - 0x003B4F 00:BB3F: 2C        .byte $2C   ; 
- D 1 - I - 0x003B50 00:BB40: 67        .byte $67   ; 
- D 1 - I - 0x003B51 00:BB41: 32        .byte $32   ; 
- D 1 - I - 0x003B52 00:BB42: 41        .byte $41   ; 
- D 1 - I - 0x003B53 00:BB43: 7F        .byte $7F   ; 
- D 1 - I - 0x003B54 00:BB44: 7D        .byte $7D   ; 
- D 1 - I - 0x003B55 00:BB45: 7D        .byte $7D   ; 
- D 1 - I - 0x003B56 00:BB46: 7D        .byte $7D   ; 
- - - - - - 0x003B57 00:BB47: 00        .byte $00   ; 
- - - - - - 0x003B58 00:BB48: 00        .byte $00   ; 
- - - - - - 0x003B59 00:BB49: 00        .byte $00   ; 
- - - - - - 0x003B5A 00:BB4A: 00        .byte $00   ; 
- - - - - - 0x003B5B 00:BB4B: 00        .byte $00   ; 
- - - - - - 0x003B5C 00:BB4C: 00        .byte $00   ; 
- - - - - - 0x003B5D 00:BB4D: 00        .byte $00   ; 
- - - - - - 0x003B5E 00:BB4E: 00        .byte $00   ; 
- D 1 - I - 0x003B5F 00:BB4F: 30        .byte $30   ; 
- D 1 - I - 0x003B60 00:BB50: 00        .byte $00   ; 
- D 1 - I - 0x003B61 00:BB51: 2D        .byte $2D   ; 
- D 1 - I - 0x003B62 00:BB52: 6D        .byte $6D   ; 
- D 1 - I - 0x003B63 00:BB53: 00        .byte $00   ; 
- D 1 - I - 0x003B64 00:BB54: 00        .byte $00   ; 
- D 1 - I - 0x003B65 00:BB55: 00        .byte $00   ; 
- D 1 - I - 0x003B66 00:BB56: 77        .byte $77   ; 
- D 1 - I - 0x003B67 00:BB57: 0B        .byte $0B   ; 
- D 1 - I - 0x003B68 00:BB58: 03        .byte $03   ; 
- D 1 - I - 0x003B69 00:BB59: 03        .byte $03   ; 
- D 1 - I - 0x003B6A 00:BB5A: 03        .byte $03   ; 
- D 1 - I - 0x003B6B 00:BB5B: 0C        .byte $0C   ; 
- D 1 - I - 0x003B6C 00:BB5C: 00        .byte $00   ; 
- D 1 - I - 0x003B6D 00:BB5D: 00        .byte $00   ; 
- D 1 - I - 0x003B6E 00:BB5E: 00        .byte $00   ; 
- D 1 - I - 0x003B6F 00:BB5F: 32        .byte $32   ; 
- D 1 - I - 0x003B70 00:BB60: 41        .byte $41   ; 
- D 1 - I - 0x003B71 00:BB61: 32        .byte $32   ; 
- D 1 - I - 0x003B72 00:BB62: 41        .byte $41   ; 
- D 1 - I - 0x003B73 00:BB63: 41        .byte $41   ; 
- D 1 - I - 0x003B74 00:BB64: 41        .byte $41   ; 
- D 1 - I - 0x003B75 00:BB65: 41        .byte $41   ; 
- D 1 - I - 0x003B76 00:BB66: 41        .byte $41   ; 
- D 1 - I - 0x003B77 00:BB67: 0B        .byte $0B   ; 
- D 1 - I - 0x003B78 00:BB68: 03        .byte $03   ; 
- D 1 - I - 0x003B79 00:BB69: 03        .byte $03   ; 
- D 1 - I - 0x003B7A 00:BB6A: 03        .byte $03   ; 
- D 1 - I - 0x003B7B 00:BB6B: 0C        .byte $0C   ; 
- D 1 - I - 0x003B7C 00:BB6C: 00        .byte $00   ; 
- D 1 - I - 0x003B7D 00:BB6D: 00        .byte $00   ; 
- D 1 - I - 0x003B7E 00:BB6E: 00        .byte $00   ; 
- D 1 - I - 0x003B7F 00:BB6F: 00        .byte $00   ; 
- D 1 - I - 0x003B80 00:BB70: 00        .byte $00   ; 
- D 1 - I - 0x003B81 00:BB71: 03        .byte $03   ; 
- D 1 - I - 0x003B82 00:BB72: 03        .byte $03   ; 
- D 1 - I - 0x003B83 00:BB73: 00        .byte $00   ; 
- D 1 - I - 0x003B84 00:BB74: 00        .byte $00   ; 
- D 1 - I - 0x003B85 00:BB75: 00        .byte $00   ; 
- D 1 - I - 0x003B86 00:BB76: 00        .byte $00   ; 
- D 1 - I - 0x003B87 00:BB77: 0B        .byte $0B   ; 
- D 1 - I - 0x003B88 00:BB78: 03        .byte $03   ; 
- D 1 - I - 0x003B89 00:BB79: 03        .byte $03   ; 
- D 1 - I - 0x003B8A 00:BB7A: 03        .byte $03   ; 
- D 1 - I - 0x003B8B 00:BB7B: 0C        .byte $0C   ; 
- D 1 - I - 0x003B8C 00:BB7C: 00        .byte $00   ; 
- D 1 - I - 0x003B8D 00:BB7D: 00        .byte $00   ; 
- D 1 - I - 0x003B8E 00:BB7E: 00        .byte $00   ; 
- D 1 - I - 0x003B8F 00:BB7F: 0B        .byte $0B   ; 
- D 1 - I - 0x003B90 00:BB80: 03        .byte $03   ; 
- D 1 - I - 0x003B91 00:BB81: 55        .byte $55   ; 
- D 1 - I - 0x003B92 00:BB82: 40        .byte $40   ; 
- D 1 - I - 0x003B93 00:BB83: 0C        .byte $0C   ; 
- D 1 - I - 0x003B94 00:BB84: 00        .byte $00   ; 
- D 1 - I - 0x003B95 00:BB85: 73        .byte $73   ; 
- D 1 - I - 0x003B96 00:BB86: 40        .byte $40   ; 
- D 1 - I - 0x003B97 00:BB87: 0B        .byte $0B   ; 
- D 1 - I - 0x003B98 00:BB88: 03        .byte $03   ; 
- D 1 - I - 0x003B99 00:BB89: 03        .byte $03   ; 
- D 1 - I - 0x003B9A 00:BB8A: 03        .byte $03   ; 
- D 1 - I - 0x003B9B 00:BB8B: 0C        .byte $0C   ; 
- D 1 - I - 0x003B9C 00:BB8C: 00        .byte $00   ; 
- D 1 - I - 0x003B9D 00:BB8D: 00        .byte $00   ; 
- D 1 - I - 0x003B9E 00:BB8E: 00        .byte $00   ; 
- D 1 - I - 0x003B9F 00:BB8F: 0B        .byte $0B   ; 
- D 1 - I - 0x003BA0 00:BB90: 03        .byte $03   ; 
- D 1 - I - 0x003BA1 00:BB91: 03        .byte $03   ; 
- D 1 - I - 0x003BA2 00:BB92: 03        .byte $03   ; 
- D 1 - I - 0x003BA3 00:BB93: 0C        .byte $0C   ; 
- D 1 - I - 0x003BA4 00:BB94: 00        .byte $00   ; 
- D 1 - I - 0x003BA5 00:BB95: 00        .byte $00   ; 
- D 1 - I - 0x003BA6 00:BB96: 00        .byte $00   ; 
- D 1 - I - 0x003BA7 00:BB97: 0B        .byte $0B   ; 
- D 1 - I - 0x003BA8 00:BB98: 03        .byte $03   ; 
- D 1 - I - 0x003BA9 00:BB99: 03        .byte $03   ; 
- D 1 - I - 0x003BAA 00:BB9A: 73        .byte $73   ; 
- D 1 - I - 0x003BAB 00:BB9B: 0C        .byte $0C   ; 
- D 1 - I - 0x003BAC 00:BB9C: 00        .byte $00   ; 
- D 1 - I - 0x003BAD 00:BB9D: 00        .byte $00   ; 
- D 1 - I - 0x003BAE 00:BB9E: 55        .byte $55   ; 
- D 1 - I - 0x003BAF 00:BB9F: 0B        .byte $0B   ; 
- D 1 - I - 0x003BB0 00:BBA0: 03        .byte $03   ; 
- D 1 - I - 0x003BB1 00:BBA1: 03        .byte $03   ; 
- D 1 - I - 0x003BB2 00:BBA2: 55        .byte $55   ; 
- D 1 - I - 0x003BB3 00:BBA3: 0C        .byte $0C   ; 
- D 1 - I - 0x003BB4 00:BBA4: 00        .byte $00   ; 
- D 1 - I - 0x003BB5 00:BBA5: 00        .byte $00   ; 
- D 1 - I - 0x003BB6 00:BBA6: 55        .byte $55   ; 
- D 1 - I - 0x003BB7 00:BBA7: 0B        .byte $0B   ; 
- D 1 - I - 0x003BB8 00:BBA8: 03        .byte $03   ; 
- D 1 - I - 0x003BB9 00:BBA9: 03        .byte $03   ; 
- D 1 - I - 0x003BBA 00:BBAA: 73        .byte $73   ; 
- D 1 - I - 0x003BBB 00:BBAB: 0C        .byte $0C   ; 
- D 1 - I - 0x003BBC 00:BBAC: 00        .byte $00   ; 
- D 1 - I - 0x003BBD 00:BBAD: 73        .byte $73   ; 
- D 1 - I - 0x003BBE 00:BBAE: 40        .byte $40   ; 
- D 1 - I - 0x003BBF 00:BBAF: 06        .byte $06   ; 
- D 1 - I - 0x003BC0 00:BBB0: 06        .byte $06   ; 
- D 1 - I - 0x003BC1 00:BBB1: 06        .byte $06   ; 
- D 1 - I - 0x003BC2 00:BBB2: 06        .byte $06   ; 
- D 1 - I - 0x003BC3 00:BBB3: 40        .byte $40   ; 
- D 1 - I - 0x003BC4 00:BBB4: 40        .byte $40   ; 
- D 1 - I - 0x003BC5 00:BBB5: 40        .byte $40   ; 
- D 1 - I - 0x003BC6 00:BBB6: 40        .byte $40   ; 
- D 1 - I - 0x003BC7 00:BBB7: 07        .byte $07   ; 
- D 1 - I - 0x003BC8 00:BBB8: 40        .byte $40   ; 
- D 1 - I - 0x003BC9 00:BBB9: 07        .byte $07   ; 
- D 1 - I - 0x003BCA 00:BBBA: 40        .byte $40   ; 
- D 1 - I - 0x003BCB 00:BBBB: 53        .byte $53   ; 
- D 1 - I - 0x003BCC 00:BBBC: 53        .byte $53   ; 
- D 1 - I - 0x003BCD 00:BBBD: 53        .byte $53   ; 
- D 1 - I - 0x003BCE 00:BBBE: 53        .byte $53   ; 
- D 1 - I - 0x003BCF 00:BBBF: 08        .byte $08   ; 
- D 1 - I - 0x003BD0 00:BBC0: 08        .byte $08   ; 
- D 1 - I - 0x003BD1 00:BBC1: 08        .byte $08   ; 
- D 1 - I - 0x003BD2 00:BBC2: 08        .byte $08   ; 
- D 1 - I - 0x003BD3 00:BBC3: 08        .byte $08   ; 
- D 1 - I - 0x003BD4 00:BBC4: 08        .byte $08   ; 
- D 1 - I - 0x003BD5 00:BBC5: 08        .byte $08   ; 
- D 1 - I - 0x003BD6 00:BBC6: 08        .byte $08   ; 
- D 1 - I - 0x003BD7 00:BBC7: 40        .byte $40   ; 
- D 1 - I - 0x003BD8 00:BBC8: 40        .byte $40   ; 
- D 1 - I - 0x003BD9 00:BBC9: 69        .byte $69   ; 
- D 1 - I - 0x003BDA 00:BBCA: 49        .byte $49   ; 
- D 1 - I - 0x003BDB 00:BBCB: 40        .byte $40   ; 
- D 1 - I - 0x003BDC 00:BBCC: 40        .byte $40   ; 
- D 1 - I - 0x003BDD 00:BBCD: 69        .byte $69   ; 
- D 1 - I - 0x003BDE 00:BBCE: 6C        .byte $6C   ; 
- D 1 - I - 0x003BDF 00:BBCF: 08        .byte $08   ; 
- D 1 - I - 0x003BE0 00:BBD0: 08        .byte $08   ; 
- D 1 - I - 0x003BE1 00:BBD1: 08        .byte $08   ; 
- D 1 - I - 0x003BE2 00:BBD2: 08        .byte $08   ; 
- D 1 - I - 0x003BE3 00:BBD3: 08        .byte $08   ; 
- D 1 - I - 0x003BE4 00:BBD4: 08        .byte $08   ; 
- D 1 - I - 0x003BE5 00:BBD5: 08        .byte $08   ; 
- D 1 - I - 0x003BE6 00:BBD6: 08        .byte $08   ; 
- D 1 - I - 0x003BE7 00:BBD7: 5F        .byte $5F   ; 
- D 1 - I - 0x003BE8 00:BBD8: 2A        .byte $2A   ; 
- D 1 - I - 0x003BE9 00:BBD9: 40        .byte $40   ; 
- D 1 - I - 0x003BEA 00:BBDA: 40        .byte $40   ; 
- D 1 - I - 0x003BEB 00:BBDB: 60        .byte $60   ; 
- D 1 - I - 0x003BEC 00:BBDC: 2A        .byte $2A   ; 
- D 1 - I - 0x003BED 00:BBDD: 40        .byte $40   ; 
- D 1 - I - 0x003BEE 00:BBDE: 40        .byte $40   ; 
- D 1 - I - 0x003BEF 00:BBDF: 08        .byte $08   ; 
- D 1 - I - 0x003BF0 00:BBE0: 08        .byte $08   ; 
- D 1 - I - 0x003BF1 00:BBE1: 08        .byte $08   ; 
- D 1 - I - 0x003BF2 00:BBE2: 08        .byte $08   ; 
- D 1 - I - 0x003BF3 00:BBE3: 08        .byte $08   ; 
- D 1 - I - 0x003BF4 00:BBE4: 08        .byte $08   ; 
- D 1 - I - 0x003BF5 00:BBE5: 08        .byte $08   ; 
- D 1 - I - 0x003BF6 00:BBE6: 08        .byte $08   ; 
- D 1 - I - 0x003BF7 00:BBE7: 40        .byte $40   ; 
- D 1 - I - 0x003BF8 00:BBE8: 40        .byte $40   ; 
- D 1 - I - 0x003BF9 00:BBE9: 40        .byte $40   ; 
- D 1 - I - 0x003BFA 00:BBEA: 40        .byte $40   ; 
- D 1 - I - 0x003BFB 00:BBEB: 40        .byte $40   ; 
- D 1 - I - 0x003BFC 00:BBEC: 40        .byte $40   ; 
- D 1 - I - 0x003BFD 00:BBED: 40        .byte $40   ; 
- D 1 - I - 0x003BFE 00:BBEE: 40        .byte $40   ; 
- D 1 - I - 0x003BFF 00:BBEF: 49        .byte $49   ; 
- D 1 - I - 0x003C00 00:BBF0: 00        .byte $00   ; 
- D 1 - I - 0x003C01 00:BBF1: 03        .byte $03   ; 
- D 1 - I - 0x003C02 00:BBF2: 03        .byte $03   ; 
- D 1 - I - 0x003C03 00:BBF3: 6C        .byte $6C   ; 
- D 1 - I - 0x003C04 00:BBF4: 00        .byte $00   ; 
- D 1 - I - 0x003C05 00:BBF5: 00        .byte $00   ; 
- D 1 - I - 0x003C06 00:BBF6: 00        .byte $00   ; 
- - - - - - 0x003C07 00:BBF7: 00        .byte $00   ; 
- - - - - - 0x003C08 00:BBF8: 00        .byte $00   ; 
- - - - - - 0x003C09 00:BBF9: 00        .byte $00   ; 
- - - - - - 0x003C0A 00:BBFA: 00        .byte $00   ; 
- - - - - - 0x003C0B 00:BBFB: 00        .byte $00   ; 
- - - - - - 0x003C0C 00:BBFC: 00        .byte $00   ; 
- - - - - - 0x003C0D 00:BBFD: 00        .byte $00   ; 
- - - - - - 0x003C0E 00:BBFE: 00        .byte $00   ; 
- D 1 - I - 0x003C0F 00:BBFF: 40        .byte $40   ; 
- D 1 - I - 0x003C10 00:BC00: 40        .byte $40   ; 
- D 1 - I - 0x003C11 00:BC01: 69        .byte $69   ; 
- D 1 - I - 0x003C12 00:BC02: 41        .byte $41   ; 
- D 1 - I - 0x003C13 00:BC03: 40        .byte $40   ; 
- D 1 - I - 0x003C14 00:BC04: 40        .byte $40   ; 
- D 1 - I - 0x003C15 00:BC05: 69        .byte $69   ; 
- D 1 - I - 0x003C16 00:BC06: 41        .byte $41   ; 
- - - - - - 0x003C17 00:BC07: 00        .byte $00   ; 
- - - - - - 0x003C18 00:BC08: 00        .byte $00   ; 
- - - - - - 0x003C19 00:BC09: 00        .byte $00   ; 
- - - - - - 0x003C1A 00:BC0A: 00        .byte $00   ; 
- - - - - - 0x003C1B 00:BC0B: 00        .byte $00   ; 
- - - - - - 0x003C1C 00:BC0C: 00        .byte $00   ; 
- - - - - - 0x003C1D 00:BC0D: 00        .byte $00   ; 
- - - - - - 0x003C1E 00:BC0E: 00        .byte $00   ; 
- D 1 - I - 0x003C1F 00:BC0F: 40        .byte $40   ; 
- D 1 - I - 0x003C20 00:BC10: 2A        .byte $2A   ; 
- D 1 - I - 0x003C21 00:BC11: 40        .byte $40   ; 
- D 1 - I - 0x003C22 00:BC12: 40        .byte $40   ; 
- D 1 - I - 0x003C23 00:BC13: 40        .byte $40   ; 
- D 1 - I - 0x003C24 00:BC14: 2A        .byte $2A   ; 
- D 1 - I - 0x003C25 00:BC15: 40        .byte $40   ; 
- D 1 - I - 0x003C26 00:BC16: 40        .byte $40   ; 
- - - - - - 0x003C27 00:BC17: 00        .byte $00   ; 
- - - - - - 0x003C28 00:BC18: 00        .byte $00   ; 
- - - - - - 0x003C29 00:BC19: 00        .byte $00   ; 
- - - - - - 0x003C2A 00:BC1A: 00        .byte $00   ; 
- - - - - - 0x003C2B 00:BC1B: 00        .byte $00   ; 
- - - - - - 0x003C2C 00:BC1C: 00        .byte $00   ; 
- - - - - - 0x003C2D 00:BC1D: 00        .byte $00   ; 
- - - - - - 0x003C2E 00:BC1E: 00        .byte $00   ; 
- D 1 - I - 0x003C2F 00:BC1F: 08        .byte $08   ; 
- D 1 - I - 0x003C30 00:BC20: 08        .byte $08   ; 
- D 1 - I - 0x003C31 00:BC21: 08        .byte $08   ; 
- D 1 - I - 0x003C32 00:BC22: 08        .byte $08   ; 
- D 1 - I - 0x003C33 00:BC23: 08        .byte $08   ; 
- D 1 - I - 0x003C34 00:BC24: 08        .byte $08   ; 
- D 1 - I - 0x003C35 00:BC25: 08        .byte $08   ; 
- D 1 - I - 0x003C36 00:BC26: 08        .byte $08   ; 
- D 1 - I - 0x003C37 00:BC27: 0B        .byte $0B   ; 
- D 1 - I - 0x003C38 00:BC28: 03        .byte $03   ; 
- D 1 - I - 0x003C39 00:BC29: 03        .byte $03   ; 
- D 1 - I - 0x003C3A 00:BC2A: 03        .byte $03   ; 
- D 1 - I - 0x003C3B 00:BC2B: 0C        .byte $0C   ; 
- D 1 - I - 0x003C3C 00:BC2C: 00        .byte $00   ; 
- D 1 - I - 0x003C3D 00:BC2D: 00        .byte $00   ; 
- D 1 - I - 0x003C3E 00:BC2E: 00        .byte $00   ; 
- D 1 - I - 0x003C3F 00:BC2F: 0B        .byte $0B   ; 
- D 1 - I - 0x003C40 00:BC30: 03        .byte $03   ; 
- D 1 - I - 0x003C41 00:BC31: 3F        .byte $3F   ; 
- D 1 - I - 0x003C42 00:BC32: 5F        .byte $5F   ; 
- D 1 - I - 0x003C43 00:BC33: 0C        .byte $0C   ; 
- D 1 - I - 0x003C44 00:BC34: 00        .byte $00   ; 
- D 1 - I - 0x003C45 00:BC35: 00        .byte $00   ; 
- D 1 - I - 0x003C46 00:BC36: 60        .byte $60   ; 
- - - - - - 0x003C47 00:BC37: 00        .byte $00   ; 
- - - - - - 0x003C48 00:BC38: 00        .byte $00   ; 
- - - - - - 0x003C49 00:BC39: 00        .byte $00   ; 
- - - - - - 0x003C4A 00:BC3A: 00        .byte $00   ; 
- - - - - - 0x003C4B 00:BC3B: 00        .byte $00   ; 
- - - - - - 0x003C4C 00:BC3C: 00        .byte $00   ; 
- - - - - - 0x003C4D 00:BC3D: 00        .byte $00   ; 
- - - - - - 0x003C4E 00:BC3E: 00        .byte $00   ; 
- D 1 - I - 0x003C4F 00:BC3F: 08        .byte $08   ; 
- D 1 - I - 0x003C50 00:BC40: 08        .byte $08   ; 
- D 1 - I - 0x003C51 00:BC41: 08        .byte $08   ; 
- D 1 - I - 0x003C52 00:BC42: 08        .byte $08   ; 
- D 1 - I - 0x003C53 00:BC43: 08        .byte $08   ; 
- D 1 - I - 0x003C54 00:BC44: 08        .byte $08   ; 
- D 1 - I - 0x003C55 00:BC45: 08        .byte $08   ; 
- D 1 - I - 0x003C56 00:BC46: 08        .byte $08   ; 
- D 1 - I - 0x003C57 00:BC47: 08        .byte $08   ; 
- D 1 - I - 0x003C58 00:BC48: 08        .byte $08   ; 
- D 1 - I - 0x003C59 00:BC49: 08        .byte $08   ; 
- D 1 - I - 0x003C5A 00:BC4A: 08        .byte $08   ; 
- D 1 - I - 0x003C5B 00:BC4B: 08        .byte $08   ; 
- D 1 - I - 0x003C5C 00:BC4C: 08        .byte $08   ; 
- D 1 - I - 0x003C5D 00:BC4D: 08        .byte $08   ; 
- D 1 - I - 0x003C5E 00:BC4E: 08        .byte $08   ; 
- D 1 - I - 0x003C5F 00:BC4F: 66        .byte $66   ; 
- D 1 - I - 0x003C60 00:BC50: 40        .byte $40   ; 
- D 1 - I - 0x003C61 00:BC51: 67        .byte $67   ; 
- D 1 - I - 0x003C62 00:BC52: 41        .byte $41   ; 
- D 1 - I - 0x003C63 00:BC53: 66        .byte $66   ; 
- D 1 - I - 0x003C64 00:BC54: 4F        .byte $4F   ; 
- D 1 - I - 0x003C65 00:BC55: 41        .byte $41   ; 
- D 1 - I - 0x003C66 00:BC56: 41        .byte $41   ; 
- D 1 - I - 0x003C67 00:BC57: 66        .byte $66   ; 
- D 1 - I - 0x003C68 00:BC58: 67        .byte $67   ; 
- D 1 - I - 0x003C69 00:BC59: 41        .byte $41   ; 
- D 1 - I - 0x003C6A 00:BC5A: 41        .byte $41   ; 
- D 1 - I - 0x003C6B 00:BC5B: 7F        .byte $7F   ; 
- D 1 - I - 0x003C6C 00:BC5C: 7D        .byte $7D   ; 
- D 1 - I - 0x003C6D 00:BC5D: 7D        .byte $7D   ; 
- D 1 - I - 0x003C6E 00:BC5E: 7D        .byte $7D   ; 
- D 1 - I - 0x003C6F 00:BC5F: 41        .byte $41   ; 
- D 1 - I - 0x003C70 00:BC60: 41        .byte $41   ; 
- D 1 - I - 0x003C71 00:BC61: 41        .byte $41   ; 
- D 1 - I - 0x003C72 00:BC62: 41        .byte $41   ; 
- D 1 - I - 0x003C73 00:BC63: 41        .byte $41   ; 
- D 1 - I - 0x003C74 00:BC64: 41        .byte $41   ; 
- D 1 - I - 0x003C75 00:BC65: 41        .byte $41   ; 
- D 1 - I - 0x003C76 00:BC66: 41        .byte $41   ; 
- D 1 - I - 0x003C77 00:BC67: 41        .byte $41   ; 
- D 1 - I - 0x003C78 00:BC68: 41        .byte $41   ; 
- D 1 - I - 0x003C79 00:BC69: 41        .byte $41   ; 
- D 1 - I - 0x003C7A 00:BC6A: 41        .byte $41   ; 
- D 1 - I - 0x003C7B 00:BC6B: 7D        .byte $7D   ; 
- D 1 - I - 0x003C7C 00:BC6C: 7D        .byte $7D   ; 
- D 1 - I - 0x003C7D 00:BC6D: 7D        .byte $7D   ; 
- D 1 - I - 0x003C7E 00:BC6E: 7D        .byte $7D   ; 
- D 1 - I - 0x003C7F 00:BC6F: 41        .byte $41   ; 
- D 1 - I - 0x003C80 00:BC70: 26        .byte $26   ; 
- D 1 - I - 0x003C81 00:BC71: 41        .byte $41   ; 
- D 1 - I - 0x003C82 00:BC72: 7A        .byte $7A   ; 
- D 1 - I - 0x003C83 00:BC73: 41        .byte $41   ; 
- D 1 - I - 0x003C84 00:BC74: 41        .byte $41   ; 
- D 1 - I - 0x003C85 00:BC75: 4A        .byte $4A   ; 
- D 1 - I - 0x003C86 00:BC76: 7A        .byte $7A   ; 
- D 1 - I - 0x003C87 00:BC77: 41        .byte $41   ; 
- D 1 - I - 0x003C88 00:BC78: 41        .byte $41   ; 
- D 1 - I - 0x003C89 00:BC79: 80        .byte $80   ; 
- D 1 - I - 0x003C8A 00:BC7A: 7A        .byte $7A   ; 
- D 1 - I - 0x003C8B 00:BC7B: 7D        .byte $7D   ; 
- D 1 - I - 0x003C8C 00:BC7C: 7D        .byte $7D   ; 
- D 1 - I - 0x003C8D 00:BC7D: 7D        .byte $7D   ; 
- D 1 - I - 0x003C8E 00:BC7E: 7E        .byte $7E   ; 
- D 1 - I - 0x003C8F 00:BC7F: 88        .byte $88   ; 
- D 1 - I - 0x003C90 00:BC80: 89        .byte $89   ; 
- D 1 - I - 0x003C91 00:BC81: 8A        .byte $8A   ; 
- D 1 - I - 0x003C92 00:BC82: 8B        .byte $8B   ; 
- D 1 - I - 0x003C93 00:BC83: 13        .byte $13   ; 
- D 1 - I - 0x003C94 00:BC84: 8D        .byte $8D   ; 
- D 1 - I - 0x003C95 00:BC85: 14        .byte $14   ; 
- D 1 - I - 0x003C96 00:BC86: 8E        .byte $8E   ; 
- D 1 - I - 0x003C97 00:BC87: 8F        .byte $8F   ; 
- D 1 - I - 0x003C98 00:BC88: BE        .byte $BE   ; 
- D 1 - I - 0x003C99 00:BC89: BF        .byte $BF   ; 
- D 1 - I - 0x003C9A 00:BC8A: 91        .byte $91   ; 
- D 1 - I - 0x003C9B 00:BC8B: 16        .byte $16   ; 
- D 1 - I - 0x003C9C 00:BC8C: C0        .byte $C0   ; 
- D 1 - I - 0x003C9D 00:BC8D: 17        .byte $17   ; 
- D 1 - I - 0x003C9E 00:BC8E: 94        .byte $94   ; 
- D 1 - I - 0x003C9F 00:BC8F: 08        .byte $08   ; 
- D 1 - I - 0x003CA0 00:BC90: 08        .byte $08   ; 
- D 1 - I - 0x003CA1 00:BC91: 08        .byte $08   ; 
- D 1 - I - 0x003CA2 00:BC92: 08        .byte $08   ; 
- D 1 - I - 0x003CA3 00:BC93: 08        .byte $08   ; 
- D 1 - I - 0x003CA4 00:BC94: 08        .byte $08   ; 
- D 1 - I - 0x003CA5 00:BC95: 08        .byte $08   ; 
- D 1 - I - 0x003CA6 00:BC96: 08        .byte $08   ; 
- D 1 - I - 0x003CA7 00:BC97: 03        .byte $03   ; 
- D 1 - I - 0x003CA8 00:BC98: 03        .byte $03   ; 
- D 1 - I - 0x003CA9 00:BC99: 03        .byte $03   ; 
- D 1 - I - 0x003CAA 00:BC9A: 03        .byte $03   ; 
- D 1 - I - 0x003CAB 00:BC9B: 00        .byte $00   ; 
- D 1 - I - 0x003CAC 00:BC9C: 00        .byte $00   ; 
- D 1 - I - 0x003CAD 00:BC9D: 00        .byte $00   ; 
- D 1 - I - 0x003CAE 00:BC9E: 00        .byte $00   ; 
- D 1 - I - 0x003CAF 00:BC9F: 0F        .byte $0F   ; 
- D 1 - I - 0x003CB0 00:BCA0: 32        .byte $32   ; 
- D 1 - I - 0x003CB1 00:BCA1: 0F        .byte $0F   ; 
- D 1 - I - 0x003CB2 00:BCA2: 32        .byte $32   ; 
- D 1 - I - 0x003CB3 00:BCA3: 00        .byte $00   ; 
- D 1 - I - 0x003CB4 00:BCA4: 00        .byte $00   ; 
- D 1 - I - 0x003CB5 00:BCA5: 00        .byte $00   ; 
- D 1 - I - 0x003CB6 00:BCA6: 00        .byte $00   ; 
- D 1 - I - 0x003CB7 00:BCA7: 00        .byte $00   ; 
- D 1 - I - 0x003CB8 00:BCA8: 00        .byte $00   ; 
- D 1 - I - 0x003CB9 00:BCA9: 00        .byte $00   ; 
- D 1 - I - 0x003CBA 00:BCAA: 00        .byte $00   ; 
- D 1 - I - 0x003CBB 00:BCAB: 00        .byte $00   ; 
- D 1 - I - 0x003CBC 00:BCAC: 00        .byte $00   ; 
- D 1 - I - 0x003CBD 00:BCAD: 00        .byte $00   ; 
- D 1 - I - 0x003CBE 00:BCAE: 00        .byte $00   ; 
- D 1 - I - 0x003CBF 00:BCAF: 40        .byte $40   ; 
- D 1 - I - 0x003CC0 00:BCB0: 40        .byte $40   ; 
- D 1 - I - 0x003CC1 00:BCB1: 40        .byte $40   ; 
- D 1 - I - 0x003CC2 00:BCB2: 40        .byte $40   ; 
- D 1 - I - 0x003CC3 00:BCB3: 24        .byte $24   ; 
- D 1 - I - 0x003CC4 00:BCB4: 24        .byte $24   ; 
- D 1 - I - 0x003CC5 00:BCB5: 24        .byte $24   ; 
- D 1 - I - 0x003CC6 00:BCB6: 24        .byte $24   ; 
- D 1 - I - 0x003CC7 00:BCB7: 41        .byte $41   ; 
- D 1 - I - 0x003CC8 00:BCB8: 41        .byte $41   ; 
- D 1 - I - 0x003CC9 00:BCB9: 41        .byte $41   ; 
- D 1 - I - 0x003CCA 00:BCBA: 41        .byte $41   ; 
- D 1 - I - 0x003CCB 00:BCBB: 41        .byte $41   ; 
- D 1 - I - 0x003CCC 00:BCBC: 41        .byte $41   ; 
- D 1 - I - 0x003CCD 00:BCBD: 41        .byte $41   ; 
- D 1 - I - 0x003CCE 00:BCBE: 41        .byte $41   ; 
- D 1 - I - 0x003CCF 00:BCBF: 40        .byte $40   ; 
- D 1 - I - 0x003CD0 00:BCC0: 40        .byte $40   ; 
- D 1 - I - 0x003CD1 00:BCC1: 69        .byte $69   ; 
- D 1 - I - 0x003CD2 00:BCC2: 68        .byte $68   ; 
- D 1 - I - 0x003CD3 00:BCC3: 40        .byte $40   ; 
- D 1 - I - 0x003CD4 00:BCC4: 40        .byte $40   ; 
- D 1 - I - 0x003CD5 00:BCC5: 69        .byte $69   ; 
- D 1 - I - 0x003CD6 00:BCC6: 6C        .byte $6C   ; 
- D 1 - I - 0x003CD7 00:BCC7: 40        .byte $40   ; 
- D 1 - I - 0x003CD8 00:BCC8: 40        .byte $40   ; 
- D 1 - I - 0x003CD9 00:BCC9: 69        .byte $69   ; 
- D 1 - I - 0x003CDA 00:BCCA: 41        .byte $41   ; 
- D 1 - I - 0x003CDB 00:BCCB: 40        .byte $40   ; 
- D 1 - I - 0x003CDC 00:BCCC: 40        .byte $40   ; 
- D 1 - I - 0x003CDD 00:BCCD: 69        .byte $69   ; 
- D 1 - I - 0x003CDE 00:BCCE: 41        .byte $41   ; 
- D 1 - I - 0x003CDF 00:BCCF: 0F        .byte $0F   ; 
- D 1 - I - 0x003CE0 00:BCD0: 32        .byte $32   ; 
- D 1 - I - 0x003CE1 00:BCD1: 0F        .byte $0F   ; 
- D 1 - I - 0x003CE2 00:BCD2: 32        .byte $32   ; 
- D 1 - I - 0x003CE3 00:BCD3: 00        .byte $00   ; 
- D 1 - I - 0x003CE4 00:BCD4: 00        .byte $00   ; 
- D 1 - I - 0x003CE5 00:BCD5: 00        .byte $00   ; 
- D 1 - I - 0x003CE6 00:BCD6: 00        .byte $00   ; 
- D 1 - I - 0x003CE7 00:BCD7: 49        .byte $49   ; 
- D 1 - I - 0x003CE8 00:BCD8: 00        .byte $00   ; 
- D 1 - I - 0x003CE9 00:BCD9: 00        .byte $00   ; 
- D 1 - I - 0x003CEA 00:BCDA: 00        .byte $00   ; 
- D 1 - I - 0x003CEB 00:BCDB: 5D        .byte $5D   ; 
- D 1 - I - 0x003CEC 00:BCDC: 00        .byte $00   ; 
- D 1 - I - 0x003CED 00:BCDD: 00        .byte $00   ; 
- D 1 - I - 0x003CEE 00:BCDE: 00        .byte $00   ; 
- D 1 - I - 0x003CEF 00:BCDF: 0F        .byte $0F   ; 
- D 1 - I - 0x003CF0 00:BCE0: 32        .byte $32   ; 
- D 1 - I - 0x003CF1 00:BCE1: 0F        .byte $0F   ; 
- D 1 - I - 0x003CF2 00:BCE2: 32        .byte $32   ; 
- D 1 - I - 0x003CF3 00:BCE3: 00        .byte $00   ; 
- D 1 - I - 0x003CF4 00:BCE4: 00        .byte $00   ; 
- D 1 - I - 0x003CF5 00:BCE5: 00        .byte $00   ; 
- D 1 - I - 0x003CF6 00:BCE6: 00        .byte $00   ; 
- D 1 - I - 0x003CF7 00:BCE7: 00        .byte $00   ; 
- D 1 - I - 0x003CF8 00:BCE8: 00        .byte $00   ; 
- D 1 - I - 0x003CF9 00:BCE9: 3F        .byte $3F   ; 
- D 1 - I - 0x003CFA 00:BCEA: 5F        .byte $5F   ; 
- D 1 - I - 0x003CFB 00:BCEB: 00        .byte $00   ; 
- D 1 - I - 0x003CFC 00:BCEC: 00        .byte $00   ; 
- D 1 - I - 0x003CFD 00:BCED: 00        .byte $00   ; 
- D 1 - I - 0x003CFE 00:BCEE: 60        .byte $60   ; 
- D 1 - I - 0x003CFF 00:BCEF: 6E        .byte $6E   ; 
- D 1 - I - 0x003D00 00:BCF0: 2A        .byte $2A   ; 
- D 1 - I - 0x003D01 00:BCF1: 40        .byte $40   ; 
- D 1 - I - 0x003D02 00:BCF2: 40        .byte $40   ; 
- D 1 - I - 0x003D03 00:BCF3: 60        .byte $60   ; 
- D 1 - I - 0x003D04 00:BCF4: 2A        .byte $2A   ; 
- D 1 - I - 0x003D05 00:BCF5: 40        .byte $40   ; 
- D 1 - I - 0x003D06 00:BCF6: 40        .byte $40   ; 
- D 1 - I - 0x003D07 00:BCF7: 40        .byte $40   ; 
- D 1 - I - 0x003D08 00:BCF8: 2A        .byte $2A   ; 
- D 1 - I - 0x003D09 00:BCF9: 40        .byte $40   ; 
- D 1 - I - 0x003D0A 00:BCFA: 40        .byte $40   ; 
- D 1 - I - 0x003D0B 00:BCFB: 40        .byte $40   ; 
- D 1 - I - 0x003D0C 00:BCFC: 2A        .byte $2A   ; 
- D 1 - I - 0x003D0D 00:BCFD: 40        .byte $40   ; 
- D 1 - I - 0x003D0E 00:BCFE: 40        .byte $40   ; 
- D 1 - I - 0x003D0F 00:BCFF: 40        .byte $40   ; 
- D 1 - I - 0x003D10 00:BD00: 40        .byte $40   ; 
- D 1 - I - 0x003D11 00:BD01: 69        .byte $69   ; 
- D 1 - I - 0x003D12 00:BD02: 41        .byte $41   ; 
- D 1 - I - 0x003D13 00:BD03: 24        .byte $24   ; 
- D 1 - I - 0x003D14 00:BD04: 24        .byte $24   ; 
- D 1 - I - 0x003D15 00:BD05: 24        .byte $24   ; 
- D 1 - I - 0x003D16 00:BD06: 4A        .byte $4A   ; 
- D 1 - I - 0x003D17 00:BD07: 41        .byte $41   ; 
- D 1 - I - 0x003D18 00:BD08: 41        .byte $41   ; 
- D 1 - I - 0x003D19 00:BD09: 41        .byte $41   ; 
- D 1 - I - 0x003D1A 00:BD0A: 26        .byte $26   ; 
- D 1 - I - 0x003D1B 00:BD0B: 41        .byte $41   ; 
- D 1 - I - 0x003D1C 00:BD0C: 41        .byte $41   ; 
- D 1 - I - 0x003D1D 00:BD0D: 41        .byte $41   ; 
- D 1 - I - 0x003D1E 00:BD0E: 41        .byte $41   ; 
- D 1 - I - 0x003D1F 00:BD0F: 41        .byte $41   ; 
- D 1 - I - 0x003D20 00:BD10: 49        .byte $49   ; 
- D 1 - I - 0x003D21 00:BD11: 00        .byte $00   ; 
- D 1 - I - 0x003D22 00:BD12: 00        .byte $00   ; 
- D 1 - I - 0x003D23 00:BD13: 41        .byte $41   ; 
- D 1 - I - 0x003D24 00:BD14: 5D        .byte $5D   ; 
- D 1 - I - 0x003D25 00:BD15: 00        .byte $00   ; 
- D 1 - I - 0x003D26 00:BD16: 00        .byte $00   ; 
- D 1 - I - 0x003D27 00:BD17: 41        .byte $41   ; 
- D 1 - I - 0x003D28 00:BD18: 41        .byte $41   ; 
- D 1 - I - 0x003D29 00:BD19: 49        .byte $49   ; 
- D 1 - I - 0x003D2A 00:BD1A: 00        .byte $00   ; 
- D 1 - I - 0x003D2B 00:BD1B: 4A        .byte $4A   ; 
- D 1 - I - 0x003D2C 00:BD1C: 41        .byte $41   ; 
- D 1 - I - 0x003D2D 00:BD1D: 5D        .byte $5D   ; 
- D 1 - I - 0x003D2E 00:BD1E: 00        .byte $00   ; 
- D 1 - I - 0x003D2F 00:BD1F: 00        .byte $00   ; 
- D 1 - I - 0x003D30 00:BD20: 00        .byte $00   ; 
- D 1 - I - 0x003D31 00:BD21: 5F        .byte $5F   ; 
- D 1 - I - 0x003D32 00:BD22: 40        .byte $40   ; 
- D 1 - I - 0x003D33 00:BD23: 00        .byte $00   ; 
- D 1 - I - 0x003D34 00:BD24: 00        .byte $00   ; 
- D 1 - I - 0x003D35 00:BD25: 60        .byte $60   ; 
- D 1 - I - 0x003D36 00:BD26: 40        .byte $40   ; 
- D 1 - I - 0x003D37 00:BD27: 3F        .byte $3F   ; 
- D 1 - I - 0x003D38 00:BD28: 5F        .byte $5F   ; 
- D 1 - I - 0x003D39 00:BD29: 40        .byte $40   ; 
- D 1 - I - 0x003D3A 00:BD2A: 40        .byte $40   ; 
- D 1 - I - 0x003D3B 00:BD2B: 00        .byte $00   ; 
- D 1 - I - 0x003D3C 00:BD2C: 60        .byte $60   ; 
- D 1 - I - 0x003D3D 00:BD2D: 40        .byte $40   ; 
- D 1 - I - 0x003D3E 00:BD2E: 4F        .byte $4F   ; 
- D 1 - I - 0x003D3F 00:BD2F: 40        .byte $40   ; 
- D 1 - I - 0x003D40 00:BD30: 2A        .byte $2A   ; 
- D 1 - I - 0x003D41 00:BD31: 40        .byte $40   ; 
- D 1 - I - 0x003D42 00:BD32: 40        .byte $40   ; 
- D 1 - I - 0x003D43 00:BD33: 4F        .byte $4F   ; 
- D 1 - I - 0x003D44 00:BD34: 24        .byte $24   ; 
- D 1 - I - 0x003D45 00:BD35: 24        .byte $24   ; 
- D 1 - I - 0x003D46 00:BD36: 24        .byte $24   ; 
- D 1 - I - 0x003D47 00:BD37: 67        .byte $67   ; 
- D 1 - I - 0x003D48 00:BD38: 41        .byte $41   ; 
- D 1 - I - 0x003D49 00:BD39: 41        .byte $41   ; 
- D 1 - I - 0x003D4A 00:BD3A: 41        .byte $41   ; 
- D 1 - I - 0x003D4B 00:BD3B: 41        .byte $41   ; 
- D 1 - I - 0x003D4C 00:BD3C: 41        .byte $41   ; 
- D 1 - I - 0x003D4D 00:BD3D: 41        .byte $41   ; 
- D 1 - I - 0x003D4E 00:BD3E: 41        .byte $41   ; 
- D 1 - I - 0x003D4F 00:BD3F: 5E        .byte $5E   ; 
- D 1 - I - 0x003D50 00:BD40: 41        .byte $41   ; 
- D 1 - I - 0x003D51 00:BD41: 41        .byte $41   ; 
- D 1 - I - 0x003D52 00:BD42: 49        .byte $49   ; 
- D 1 - I - 0x003D53 00:BD43: 41        .byte $41   ; 
- D 1 - I - 0x003D54 00:BD44: 4A        .byte $4A   ; 
- D 1 - I - 0x003D55 00:BD45: 41        .byte $41   ; 
- D 1 - I - 0x003D56 00:BD46: 76        .byte $76   ; 
- - - - - - 0x003D57 00:BD47: 00        .byte $00   ; 
- - - - - - 0x003D58 00:BD48: 00        .byte $00   ; 
- - - - - - 0x003D59 00:BD49: 00        .byte $00   ; 
- - - - - - 0x003D5A 00:BD4A: 00        .byte $00   ; 
- - - - - - 0x003D5B 00:BD4B: 00        .byte $00   ; 
- - - - - - 0x003D5C 00:BD4C: 00        .byte $00   ; 
- - - - - - 0x003D5D 00:BD4D: 00        .byte $00   ; 
- - - - - - 0x003D5E 00:BD4E: 00        .byte $00   ; 
- D 1 - I - 0x003D5F 00:BD4F: 5F        .byte $5F   ; 
- D 1 - I - 0x003D60 00:BD50: 40        .byte $40   ; 
- D 1 - I - 0x003D61 00:BD51: 40        .byte $40   ; 
- D 1 - I - 0x003D62 00:BD52: 67        .byte $67   ; 
- D 1 - I - 0x003D63 00:BD53: 81        .byte $81   ; 
- D 1 - I - 0x003D64 00:BD54: 40        .byte $40   ; 
- D 1 - I - 0x003D65 00:BD55: 4F        .byte $4F   ; 
- D 1 - I - 0x003D66 00:BD56: 41        .byte $41   ; 
- - - - - - 0x003D67 00:BD57: 00        .byte $00   ; 
- - - - - - 0x003D68 00:BD58: 00        .byte $00   ; 
- - - - - - 0x003D69 00:BD59: 00        .byte $00   ; 
- - - - - - 0x003D6A 00:BD5A: 00        .byte $00   ; 
- - - - - - 0x003D6B 00:BD5B: 00        .byte $00   ; 
- - - - - - 0x003D6C 00:BD5C: 00        .byte $00   ; 
- - - - - - 0x003D6D 00:BD5D: 00        .byte $00   ; 
- - - - - - 0x003D6E 00:BD5E: 00        .byte $00   ; 
- D 1 - I - 0x003D6F 00:BD5F: 08        .byte $08   ; 
- D 1 - I - 0x003D70 00:BD60: 08        .byte $08   ; 
- D 1 - I - 0x003D71 00:BD61: 08        .byte $08   ; 
- D 1 - I - 0x003D72 00:BD62: 08        .byte $08   ; 
- D 1 - I - 0x003D73 00:BD63: 08        .byte $08   ; 
- D 1 - I - 0x003D74 00:BD64: 08        .byte $08   ; 
- D 1 - I - 0x003D75 00:BD65: 82        .byte $82   ; 
- D 1 - I - 0x003D76 00:BD66: 83        .byte $83   ; 
- D 1 - I - 0x003D77 00:BD67: 86        .byte $86   ; 
- D 1 - I - 0x003D78 00:BD68: 87        .byte $87   ; 
- D 1 - I - 0x003D79 00:BD69: 88        .byte $88   ; 
- D 1 - I - 0x003D7A 00:BD6A: 89        .byte $89   ; 
- D 1 - I - 0x003D7B 00:BD6B: 8F        .byte $8F   ; 
- D 1 - I - 0x003D7C 00:BD6C: 90        .byte $90   ; 
- D 1 - I - 0x003D7D 00:BD6D: 91        .byte $91   ; 
- D 1 - I - 0x003D7E 00:BD6E: 92        .byte $92   ; 
- D 1 - I - 0x003D7F 00:BD6F: 08        .byte $08   ; 
- D 1 - I - 0x003D80 00:BD70: 08        .byte $08   ; 
- D 1 - I - 0x003D81 00:BD71: 08        .byte $08   ; 
- D 1 - I - 0x003D82 00:BD72: 08        .byte $08   ; 
- D 1 - I - 0x003D83 00:BD73: 84        .byte $84   ; 
- D 1 - I - 0x003D84 00:BD74: 85        .byte $85   ; 
- D 1 - I - 0x003D85 00:BD75: 08        .byte $08   ; 
- D 1 - I - 0x003D86 00:BD76: 08        .byte $08   ; 
- D 1 - I - 0x003D87 00:BD77: 8A        .byte $8A   ; 
- D 1 - I - 0x003D88 00:BD78: 8B        .byte $8B   ; 
- D 1 - I - 0x003D89 00:BD79: 8C        .byte $8C   ; 
- D 1 - I - 0x003D8A 00:BD7A: 86        .byte $86   ; 
- D 1 - I - 0x003D8B 00:BD7B: 93        .byte $93   ; 
- D 1 - I - 0x003D8C 00:BD7C: 94        .byte $94   ; 
- D 1 - I - 0x003D8D 00:BD7D: 95        .byte $95   ; 
- D 1 - I - 0x003D8E 00:BD7E: 96        .byte $96   ; 
- D 1 - I - 0x003D8F 00:BD7F: 08        .byte $08   ; 
- D 1 - I - 0x003D90 00:BD80: 08        .byte $08   ; 
- D 1 - I - 0x003D91 00:BD81: 98        .byte $98   ; 
- D 1 - I - 0x003D92 00:BD82: 99        .byte $99   ; 
- D 1 - I - 0x003D93 00:BD83: 08        .byte $08   ; 
- D 1 - I - 0x003D94 00:BD84: 08        .byte $08   ; 
- D 1 - I - 0x003D95 00:BD85: A3        .byte $A3   ; 
- D 1 - I - 0x003D96 00:BD86: A4        .byte $A4   ; 
- D 1 - I - 0x003D97 00:BD87: 08        .byte $08   ; 
- D 1 - I - 0x003D98 00:BD88: 08        .byte $08   ; 
- D 1 - I - 0x003D99 00:BD89: AD        .byte $AD   ; 
- D 1 - I - 0x003D9A 00:BD8A: AE        .byte $AE   ; 
- D 1 - I - 0x003D9B 00:BD8B: 08        .byte $08   ; 
- D 1 - I - 0x003D9C 00:BD8C: 08        .byte $08   ; 
- D 1 - I - 0x003D9D 00:BD8D: B4        .byte $B4   ; 
- D 1 - I - 0x003D9E 00:BD8E: B5        .byte $B5   ; 
- D 1 - I - 0x003D9F 00:BD8F: 9A        .byte $9A   ; 
- D 1 - I - 0x003DA0 00:BD90: 9B        .byte $9B   ; 
- D 1 - I - 0x003DA1 00:BD91: 9C        .byte $9C   ; 
- D 1 - I - 0x003DA2 00:BD92: 9D        .byte $9D   ; 
- D 1 - I - 0x003DA3 00:BD93: A5        .byte $A5   ; 
- D 1 - I - 0x003DA4 00:BD94: A6        .byte $A6   ; 
- D 1 - I - 0x003DA5 00:BD95: A7        .byte $A7   ; 
- D 1 - I - 0x003DA6 00:BD96: 00        .byte $00   ; 
- D 1 - I - 0x003DA7 00:BD97: AF        .byte $AF   ; 
- D 1 - I - 0x003DA8 00:BD98: B0        .byte $B0   ; 
- D 1 - I - 0x003DA9 00:BD99: B1        .byte $B1   ; 
- D 1 - I - 0x003DAA 00:BD9A: B2        .byte $B2   ; 
- D 1 - I - 0x003DAB 00:BD9B: B6        .byte $B6   ; 
- D 1 - I - 0x003DAC 00:BD9C: B5        .byte $B5   ; 
- D 1 - I - 0x003DAD 00:BD9D: B7        .byte $B7   ; 
- D 1 - I - 0x003DAE 00:BD9E: B8        .byte $B8   ; 
- D 1 - I - 0x003DAF 00:BD9F: 9E        .byte $9E   ; 
- D 1 - I - 0x003DB0 00:BDA0: 9F        .byte $9F   ; 
- D 1 - I - 0x003DB1 00:BDA1: A0        .byte $A0   ; 
- D 1 - I - 0x003DB2 00:BDA2: 9A        .byte $9A   ; 
- D 1 - I - 0x003DB3 00:BDA3: 00        .byte $00   ; 
- D 1 - I - 0x003DB4 00:BDA4: A8        .byte $A8   ; 
- D 1 - I - 0x003DB5 00:BDA5: A9        .byte $A9   ; 
- D 1 - I - 0x003DB6 00:BDA6: A5        .byte $A5   ; 
- D 1 - I - 0x003DB7 00:BDA7: B2        .byte $B2   ; 
- D 1 - I - 0x003DB8 00:BDA8: B1        .byte $B1   ; 
- D 1 - I - 0x003DB9 00:BDA9: AE        .byte $AE   ; 
- D 1 - I - 0x003DBA 00:BDAA: AF        .byte $AF   ; 
- D 1 - I - 0x003DBB 00:BDAB: B8        .byte $B8   ; 
- D 1 - I - 0x003DBC 00:BDAC: B9        .byte $B9   ; 
- D 1 - I - 0x003DBD 00:BDAD: B5        .byte $B5   ; 
- D 1 - I - 0x003DBE 00:BDAE: B6        .byte $B6   ; 
- D 1 - I - 0x003DBF 00:BDAF: A1        .byte $A1   ; 
- D 1 - I - 0x003DC0 00:BDB0: A2        .byte $A2   ; 
- D 1 - I - 0x003DC1 00:BDB1: AC        .byte $AC   ; 
- D 1 - I - 0x003DC2 00:BDB2: 08        .byte $08   ; 
- D 1 - I - 0x003DC3 00:BDB3: AA        .byte $AA   ; 
- D 1 - I - 0x003DC4 00:BDB4: AB        .byte $AB   ; 
- D 1 - I - 0x003DC5 00:BDB5: 00        .byte $00   ; 
- D 1 - I - 0x003DC6 00:BDB6: 08        .byte $08   ; 
- D 1 - I - 0x003DC7 00:BDB7: B0        .byte $B0   ; 
- D 1 - I - 0x003DC8 00:BDB8: B3        .byte $B3   ; 
- D 1 - I - 0x003DC9 00:BDB9: 00        .byte $00   ; 
- D 1 - I - 0x003DCA 00:BDBA: 08        .byte $08   ; 
- D 1 - I - 0x003DCB 00:BDBB: B5        .byte $B5   ; 
- D 1 - I - 0x003DCC 00:BDBC: BA        .byte $BA   ; 
- D 1 - I - 0x003DCD 00:BDBD: 00        .byte $00   ; 
- D 1 - I - 0x003DCE 00:BDBE: 08        .byte $08   ; 
- D 1 - I - 0x003DCF 00:BDBF: 08        .byte $08   ; 
- D 1 - I - 0x003DD0 00:BDC0: 08        .byte $08   ; 
- D 1 - I - 0x003DD1 00:BDC1: BB        .byte $BB   ; 
- D 1 - I - 0x003DD2 00:BDC2: A7        .byte $A7   ; 
- D 1 - I - 0x003DD3 00:BDC3: 08        .byte $08   ; 
- D 1 - I - 0x003DD4 00:BDC4: 08        .byte $08   ; 
- D 1 - I - 0x003DD5 00:BDC5: C1        .byte $C1   ; 
- D 1 - I - 0x003DD6 00:BDC6: B1        .byte $B1   ; 
- D 1 - I - 0x003DD7 00:BDC7: 08        .byte $08   ; 
- D 1 - I - 0x003DD8 00:BDC8: 08        .byte $08   ; 
- D 1 - I - 0x003DD9 00:BDC9: C6        .byte $C6   ; 
- D 1 - I - 0x003DDA 00:BDCA: C7        .byte $C7   ; 
- D 1 - I - 0x003DDB 00:BDCB: 08        .byte $08   ; 
- D 1 - I - 0x003DDC 00:BDCC: 08        .byte $08   ; 
- D 1 - I - 0x003DDD 00:BDCD: CD        .byte $CD   ; 
- D 1 - I - 0x003DDE 00:BDCE: CE        .byte $CE   ; 
- D 1 - I - 0x003DDF 00:BDCF: BC        .byte $BC   ; 
- D 1 - I - 0x003DE0 00:BDD0: A8        .byte $A8   ; 
- D 1 - I - 0x003DE1 00:BDD1: BD        .byte $BD   ; 
- D 1 - I - 0x003DE2 00:BDD2: BE        .byte $BE   ; 
- D 1 - I - 0x003DE3 00:BDD3: 00        .byte $00   ; 
- D 1 - I - 0x003DE4 00:BDD4: B1        .byte $B1   ; 
- D 1 - I - 0x003DE5 00:BDD5: C2        .byte $C2   ; 
- D 1 - I - 0x003DE6 00:BDD6: C3        .byte $C3   ; 
- D 1 - I - 0x003DE7 00:BDD7: C8        .byte $C8   ; 
- D 1 - I - 0x003DE8 00:BDD8: C7        .byte $C7   ; 
- D 1 - I - 0x003DE9 00:BDD9: C9        .byte $C9   ; 
- D 1 - I - 0x003DEA 00:BDDA: CA        .byte $CA   ; 
- D 1 - I - 0x003DEB 00:BDDB: CF        .byte $CF   ; 
- D 1 - I - 0x003DEC 00:BDDC: D0        .byte $D0   ; 
- D 1 - I - 0x003DED 00:BDDD: D1        .byte $D1   ; 
- D 1 - I - 0x003DEE 00:BDDE: D2        .byte $D2   ; 
- D 1 - I - 0x003DEF 00:BDDF: BE        .byte $BE   ; 
- D 1 - I - 0x003DF0 00:BDE0: BF        .byte $BF   ; 
- D 1 - I - 0x003DF1 00:BDE1: A7        .byte $A7   ; 
- D 1 - I - 0x003DF2 00:BDE2: BC        .byte $BC   ; 
- D 1 - I - 0x003DF3 00:BDE3: C3        .byte $C3   ; 
- D 1 - I - 0x003DF4 00:BDE4: C4        .byte $C4   ; 
- D 1 - I - 0x003DF5 00:BDE5: B1        .byte $B1   ; 
- D 1 - I - 0x003DF6 00:BDE6: 00        .byte $00   ; 
- D 1 - I - 0x003DF7 00:BDE7: CA        .byte $CA   ; 
- D 1 - I - 0x003DF8 00:BDE8: CB        .byte $CB   ; 
- D 1 - I - 0x003DF9 00:BDE9: C7        .byte $C7   ; 
- D 1 - I - 0x003DFA 00:BDEA: C8        .byte $C8   ; 
- D 1 - I - 0x003DFB 00:BDEB: D2        .byte $D2   ; 
- D 1 - I - 0x003DFC 00:BDEC: D1        .byte $D1   ; 
- D 1 - I - 0x003DFD 00:BDED: D0        .byte $D0   ; 
- D 1 - I - 0x003DFE 00:BDEE: CF        .byte $CF   ; 
- D 1 - I - 0x003DFF 00:BDEF: A8        .byte $A8   ; 
- D 1 - I - 0x003E00 00:BDF0: C0        .byte $C0   ; 
- D 1 - I - 0x003E01 00:BDF1: 00        .byte $00   ; 
- D 1 - I - 0x003E02 00:BDF2: 08        .byte $08   ; 
- D 1 - I - 0x003E03 00:BDF3: B1        .byte $B1   ; 
- D 1 - I - 0x003E04 00:BDF4: C5        .byte $C5   ; 
- D 1 - I - 0x003E05 00:BDF5: 00        .byte $00   ; 
- D 1 - I - 0x003E06 00:BDF6: 08        .byte $08   ; 
- D 1 - I - 0x003E07 00:BDF7: C7        .byte $C7   ; 
- D 1 - I - 0x003E08 00:BDF8: CC        .byte $CC   ; 
- D 1 - I - 0x003E09 00:BDF9: 00        .byte $00   ; 
- D 1 - I - 0x003E0A 00:BDFA: 08        .byte $08   ; 
- D 1 - I - 0x003E0B 00:BDFB: D3        .byte $D3   ; 
- D 1 - I - 0x003E0C 00:BDFC: D4        .byte $D4   ; 
- D 1 - I - 0x003E0D 00:BDFD: 00        .byte $00   ; 
- D 1 - I - 0x003E0E 00:BDFE: 08        .byte $08   ; 
- D 1 - I - 0x003E0F 00:BDFF: 08        .byte $08   ; 
- D 1 - I - 0x003E10 00:BE00: 08        .byte $08   ; 
- D 1 - I - 0x003E11 00:BE01: D5        .byte $D5   ; 
- D 1 - I - 0x003E12 00:BE02: D6        .byte $D6   ; 
- D 1 - I - 0x003E13 00:BE03: 08        .byte $08   ; 
- D 1 - I - 0x003E14 00:BE04: 08        .byte $08   ; 
- D 1 - I - 0x003E15 00:BE05: DE        .byte $DE   ; 
- D 1 - I - 0x003E16 00:BE06: DF        .byte $DF   ; 
- D 1 - I - 0x003E17 00:BE07: 08        .byte $08   ; 
- D 1 - I - 0x003E18 00:BE08: 08        .byte $08   ; 
- D 1 - I - 0x003E19 00:BE09: 00        .byte $00   ; 
- D 1 - I - 0x003E1A 00:BE0A: 00        .byte $00   ; 
- D 1 - I - 0x003E1B 00:BE0B: 08        .byte $08   ; 
- D 1 - I - 0x003E1C 00:BE0C: 08        .byte $08   ; 
- D 1 - I - 0x003E1D 00:BE0D: 08        .byte $08   ; 
- D 1 - I - 0x003E1E 00:BE0E: 08        .byte $08   ; 
- D 1 - I - 0x003E1F 00:BE0F: F3        .byte $F3   ; 
- D 1 - I - 0x003E20 00:BE10: D8        .byte $D8   ; 
- D 1 - I - 0x003E21 00:BE11: D9        .byte $D9   ; 
- D 1 - I - 0x003E22 00:BE12: DA        .byte $DA   ; 
- D 1 - I - 0x003E23 00:BE13: E0        .byte $E0   ; 
- D 1 - I - 0x003E24 00:BE14: E0        .byte $E0   ; 
- D 1 - I - 0x003E25 00:BE15: E1        .byte $E1   ; 
- D 1 - I - 0x003E26 00:BE16: E2        .byte $E2   ; 
- D 1 - I - 0x003E27 00:BE17: 00        .byte $00   ; 
- D 1 - I - 0x003E28 00:BE18: 00        .byte $00   ; 
- D 1 - I - 0x003E29 00:BE19: 00        .byte $00   ; 
- D 1 - I - 0x003E2A 00:BE1A: 00        .byte $00   ; 
- D 1 - I - 0x003E2B 00:BE1B: 08        .byte $08   ; 
- D 1 - I - 0x003E2C 00:BE1C: 08        .byte $08   ; 
- D 1 - I - 0x003E2D 00:BE1D: 08        .byte $08   ; 
- D 1 - I - 0x003E2E 00:BE1E: 08        .byte $08   ; 
- D 1 - I - 0x003E2F 00:BE1F: DA        .byte $DA   ; 
- D 1 - I - 0x003E30 00:BE20: D9        .byte $D9   ; 
- D 1 - I - 0x003E31 00:BE21: DB        .byte $DB   ; 
- D 1 - I - 0x003E32 00:BE22: F3        .byte $F3   ; 
- D 1 - I - 0x003E33 00:BE23: E2        .byte $E2   ; 
- D 1 - I - 0x003E34 00:BE24: E1        .byte $E1   ; 
- D 1 - I - 0x003E35 00:BE25: E0        .byte $E0   ; 
- D 1 - I - 0x003E36 00:BE26: E0        .byte $E0   ; 
- D 1 - I - 0x003E37 00:BE27: 00        .byte $00   ; 
- D 1 - I - 0x003E38 00:BE28: 00        .byte $00   ; 
- D 1 - I - 0x003E39 00:BE29: 00        .byte $00   ; 
- D 1 - I - 0x003E3A 00:BE2A: 00        .byte $00   ; 
- D 1 - I - 0x003E3B 00:BE2B: 08        .byte $08   ; 
- D 1 - I - 0x003E3C 00:BE2C: 08        .byte $08   ; 
- D 1 - I - 0x003E3D 00:BE2D: 08        .byte $08   ; 
- D 1 - I - 0x003E3E 00:BE2E: 08        .byte $08   ; 
- D 1 - I - 0x003E3F 00:BE2F: DC        .byte $DC   ; 
- D 1 - I - 0x003E40 00:BE30: DD        .byte $DD   ; 
- D 1 - I - 0x003E41 00:BE31: 00        .byte $00   ; 
- D 1 - I - 0x003E42 00:BE32: 08        .byte $08   ; 
- D 1 - I - 0x003E43 00:BE33: E3        .byte $E3   ; 
- D 1 - I - 0x003E44 00:BE34: E4        .byte $E4   ; 
- D 1 - I - 0x003E45 00:BE35: 00        .byte $00   ; 
- D 1 - I - 0x003E46 00:BE36: 08        .byte $08   ; 
- D 1 - I - 0x003E47 00:BE37: 00        .byte $00   ; 
- D 1 - I - 0x003E48 00:BE38: 00        .byte $00   ; 
- D 1 - I - 0x003E49 00:BE39: 00        .byte $00   ; 
- D 1 - I - 0x003E4A 00:BE3A: 08        .byte $08   ; 
- D 1 - I - 0x003E4B 00:BE3B: 08        .byte $08   ; 
- D 1 - I - 0x003E4C 00:BE3C: 08        .byte $08   ; 
- D 1 - I - 0x003E4D 00:BE3D: 08        .byte $08   ; 
- D 1 - I - 0x003E4E 00:BE3E: 08        .byte $08   ; 
- D 1 - I - 0x003E4F 00:BE3F: 08        .byte $08   ; 
- D 1 - I - 0x003E50 00:BE40: 08        .byte $08   ; 
- D 1 - I - 0x003E51 00:BE41: 08        .byte $08   ; 
- D 1 - I - 0x003E52 00:BE42: 08        .byte $08   ; 
- D 1 - I - 0x003E53 00:BE43: 08        .byte $08   ; 
- D 1 - I - 0x003E54 00:BE44: 08        .byte $08   ; 
- D 1 - I - 0x003E55 00:BE45: 08        .byte $08   ; 
- D 1 - I - 0x003E56 00:BE46: 08        .byte $08   ; 
- D 1 - I - 0x003E57 00:BE47: 08        .byte $08   ; 
- D 1 - I - 0x003E58 00:BE48: 08        .byte $08   ; 
- D 1 - I - 0x003E59 00:BE49: 08        .byte $08   ; 
- D 1 - I - 0x003E5A 00:BE4A: 08        .byte $08   ; 
- D 1 - I - 0x003E5B 00:BE4B: 08        .byte $08   ; 
- D 1 - I - 0x003E5C 00:BE4C: 08        .byte $08   ; 
- D 1 - I - 0x003E5D 00:BE4D: 8D        .byte $8D   ; 
- D 1 - I - 0x003E5E 00:BE4E: 8E        .byte $8E   ; 
- D 1 - I - 0x003E5F 00:BE4F: 08        .byte $08   ; 
- D 1 - I - 0x003E60 00:BE50: 08        .byte $08   ; 
- D 1 - I - 0x003E61 00:BE51: 08        .byte $08   ; 
- D 1 - I - 0x003E62 00:BE52: 08        .byte $08   ; 
- D 1 - I - 0x003E63 00:BE53: 08        .byte $08   ; 
- D 1 - I - 0x003E64 00:BE54: 08        .byte $08   ; 
- D 1 - I - 0x003E65 00:BE55: 08        .byte $08   ; 
- D 1 - I - 0x003E66 00:BE56: 08        .byte $08   ; 
- D 1 - I - 0x003E67 00:BE57: 08        .byte $08   ; 
- D 1 - I - 0x003E68 00:BE58: 08        .byte $08   ; 
- D 1 - I - 0x003E69 00:BE59: 08        .byte $08   ; 
- D 1 - I - 0x003E6A 00:BE5A: 08        .byte $08   ; 
- D 1 - I - 0x003E6B 00:BE5B: 8E        .byte $8E   ; 
- D 1 - I - 0x003E6C 00:BE5C: 97        .byte $97   ; 
- D 1 - I - 0x003E6D 00:BE5D: 08        .byte $08   ; 
- D 1 - I - 0x003E6E 00:BE5E: 08        .byte $08   ; 
- - - - - - 0x003E6F 00:BE5F: 88        .byte $88   ; 
- - - - - - 0x003E70 00:BE60: 89        .byte $89   ; 
- - - - - - 0x003E71 00:BE61: 8A        .byte $8A   ; 
- - - - - - 0x003E72 00:BE62: 8B        .byte $8B   ; 
- - - - - - 0x003E73 00:BE63: EB        .byte $EB   ; 
- - - - - - 0x003E74 00:BE64: EC        .byte $EC   ; 
- - - - - - 0x003E75 00:BE65: ED        .byte $ED   ; 
- - - - - - 0x003E76 00:BE66: EE        .byte $EE   ; 
- - - - - - 0x003E77 00:BE67: 00        .byte $00   ; 
- - - - - - 0x003E78 00:BE68: EF        .byte $EF   ; 
- - - - - - 0x003E79 00:BE69: EF        .byte $EF   ; 
- - - - - - 0x003E7A 00:BE6A: F0        .byte $F0   ; 
- - - - - - 0x003E7B 00:BE6B: EA        .byte $EA   ; 
- - - - - - 0x003E7C 00:BE6C: 00        .byte $00   ; 
- - - - - - 0x003E7D 00:BE6D: 00        .byte $00   ; 
- - - - - - 0x003E7E 00:BE6E: F1        .byte $F1   ; 
- - - - - - 0x003E7F 00:BE6F: AD        .byte $AD   ; 
- - - - - - 0x003E80 00:BE70: E5        .byte $E5   ; 
- - - - - - 0x003E81 00:BE71: E6        .byte $E6   ; 
- - - - - - 0x003E82 00:BE72: E7        .byte $E7   ; 
- - - - - - 0x003E83 00:BE73: B4        .byte $B4   ; 
- - - - - - 0x003E84 00:BE74: E8        .byte $E8   ; 
- - - - - - 0x003E85 00:BE75: E9        .byte $E9   ; 
- - - - - - 0x003E86 00:BE76: E8        .byte $E8   ; 
- - - - - - 0x003E87 00:BE77: BB        .byte $BB   ; 
- - - - - - 0x003E88 00:BE78: EA        .byte $EA   ; 
- - - - - - 0x003E89 00:BE79: 00        .byte $00   ; 
- - - - - - 0x003E8A 00:BE7A: F1        .byte $F1   ; 
- - - - - - 0x003E8B 00:BE7B: C1        .byte $C1   ; 
- - - - - - 0x003E8C 00:BE7C: F2        .byte $F2   ; 
- - - - - - 0x003E8D 00:BE7D: 00        .byte $00   ; 
- - - - - - 0x003E8E 00:BE7E: F2        .byte $F2   ; 
- - - - - - 0x003E8F 00:BE7F: E5        .byte $E5   ; 
- - - - - - 0x003E90 00:BE80: E6        .byte $E6   ; 
- - - - - - 0x003E91 00:BE81: E7        .byte $E7   ; 
- - - - - - 0x003E92 00:BE82: B3        .byte $B3   ; 
- - - - - - 0x003E93 00:BE83: E8        .byte $E8   ; 
- - - - - - 0x003E94 00:BE84: E9        .byte $E9   ; 
- - - - - - 0x003E95 00:BE85: E8        .byte $E8   ; 
- - - - - - 0x003E96 00:BE86: BA        .byte $BA   ; 
- - - - - - 0x003E97 00:BE87: EA        .byte $EA   ; 
- - - - - - 0x003E98 00:BE88: 00        .byte $00   ; 
- - - - - - 0x003E99 00:BE89: F1        .byte $F1   ; 
- - - - - - 0x003E9A 00:BE8A: C0        .byte $C0   ; 
- - - - - - 0x003E9B 00:BE8B: F2        .byte $F2   ; 
- - - - - - 0x003E9C 00:BE8C: 00        .byte $00   ; 
- - - - - - 0x003E9D 00:BE8D: F2        .byte $F2   ; 
- - - - - - 0x003E9E 00:BE8E: C5        .byte $C5   ; 



_off007_0x003E9F_01_area_2:
- D 1 - I - 0x003E9F 00:BE8F: 00        .byte $00   ; 
- D 1 - I - 0x003EA0 00:BE90: AA        .byte $AA   ; 
- D 1 - I - 0x003EA1 00:BE91: BE        .byte $BE   ; 
- D 1 - I - 0x003EA2 00:BE92: AA        .byte $AA   ; 
- D 1 - I - 0x003EA3 00:BE93: 00        .byte $00   ; 
- D 1 - I - 0x003EA4 00:BE94: 8A        .byte $8A   ; 
- D 1 - I - 0x003EA5 00:BE95: AA        .byte $AA   ; 
- D 1 - I - 0x003EA6 00:BE96: AA        .byte $AA   ; 
- D 1 - I - 0x003EA7 00:BE97: 00        .byte $00   ; 
- D 1 - I - 0x003EA8 00:BE98: 08        .byte $08   ; 
- D 1 - I - 0x003EA9 00:BE99: AA        .byte $AA   ; 
- D 1 - I - 0x003EAA 00:BE9A: 00        .byte $00   ; 
- D 1 - I - 0x003EAB 00:BE9B: AA        .byte $AA   ; 
- D 1 - I - 0x003EAC 00:BE9C: 00        .byte $00   ; 
- D 1 - I - 0x003EAD 00:BE9D: AA        .byte $AA   ; 
- D 1 - I - 0x003EAE 00:BE9E: 00        .byte $00   ; 
- D 1 - I - 0x003EAF 00:BE9F: 00        .byte $00   ; 
- D 1 - I - 0x003EB0 00:BEA0: 00        .byte $00   ; 
- D 1 - I - 0x003EB1 00:BEA1: 00        .byte $00   ; 
- D 1 - I - 0x003EB2 00:BEA2: 00        .byte $00   ; 
- D 1 - I - 0x003EB3 00:BEA3: 00        .byte $00   ; 
- D 1 - I - 0x003EB4 00:BEA4: 00        .byte $00   ; 
- D 1 - I - 0x003EB5 00:BEA5: 00        .byte $00   ; 
- D 1 - I - 0x003EB6 00:BEA6: 00        .byte $00   ; 
- D 1 - I - 0x003EB7 00:BEA7: 00        .byte $00   ; 
- D 1 - I - 0x003EB8 00:BEA8: 00        .byte $00   ; 
- D 1 - I - 0x003EB9 00:BEA9: 00        .byte $00   ; 
- D 1 - I - 0x003EBA 00:BEAA: 00        .byte $00   ; 
- D 1 - I - 0x003EBB 00:BEAB: 00        .byte $00   ; 
- D 1 - I - 0x003EBC 00:BEAC: 00        .byte $00   ; 
- D 1 - I - 0x003EBD 00:BEAD: 00        .byte $00   ; 
- D 1 - I - 0x003EBE 00:BEAE: AA        .byte $AA   ; 
- D 1 - I - 0x003EBF 00:BEAF: 00        .byte $00   ; 
- D 1 - I - 0x003EC0 00:BEB0: 08        .byte $08   ; 
- D 1 - I - 0x003EC1 00:BEB1: 0A        .byte $0A   ; 
- D 1 - I - 0x003EC2 00:BEB2: EA        .byte $EA   ; 
- D 1 - I - 0x003EC3 00:BEB3: 00        .byte $00   ; 
- D 1 - I - 0x003EC4 00:BEB4: 00        .byte $00   ; 
- D 1 - I - 0x003EC5 00:BEB5: 00        .byte $00   ; 
- D 1 - I - 0x003EC6 00:BEB6: 00        .byte $00   ; 
- D 1 - I - 0x003EC7 00:BEB7: 00        .byte $00   ; 
- D 1 - I - 0x003EC8 00:BEB8: 00        .byte $00   ; 
- D 1 - I - 0x003EC9 00:BEB9: 00        .byte $00   ; 
- D 1 - I - 0x003ECA 00:BEBA: 00        .byte $00   ; 
- D 1 - I - 0x003ECB 00:BEBB: 00        .byte $00   ; 
- - - - - - 0x003ECC 00:BEBC: 00        .byte $00   ; 
- D 1 - I - 0x003ECD 00:BEBD: 00        .byte $00   ; 
- D 1 - I - 0x003ECE 00:BEBE: 00        .byte $00   ; 
- D 1 - I - 0x003ECF 00:BEBF: AA        .byte $AA   ; 
- D 1 - I - 0x003ED0 00:BEC0: 08        .byte $08   ; 
- D 1 - I - 0x003ED1 00:BEC1: AA        .byte $AA   ; 
- D 1 - I - 0x003ED2 00:BEC2: AB        .byte $AB   ; 
- D 1 - I - 0x003ED3 00:BEC3: 00        .byte $00   ; 
- D 1 - I - 0x003ED4 00:BEC4: 40        .byte $40   ; 
- D 1 - I - 0x003ED5 00:BEC5: 0A        .byte $0A   ; 
- D 1 - I - 0x003ED6 00:BEC6: AA        .byte $AA   ; 
- D 1 - I - 0x003ED7 00:BEC7: 00        .byte $00   ; 
- D 1 - I - 0x003ED8 00:BEC8: 95        .byte $95   ; 
- D 1 - I - 0x003ED9 00:BEC9: AA        .byte $AA   ; 
- D 1 - I - 0x003EDA 00:BECA: AA        .byte $AA   ; 
- D 1 - I - 0x003EDB 00:BECB: A0        .byte $A0   ; 
- D 1 - I - 0x003EDC 00:BECC: A9        .byte $A9   ; 
- D 1 - I - 0x003EDD 00:BECD: AA        .byte $AA   ; 
- D 1 - I - 0x003EDE 00:BECE: AA        .byte $AA   ; 
- D 1 - I - 0x003EDF 00:BECF: 55        .byte $55   ; 
- D 1 - I - 0x003EE0 00:BED0: D1        .byte $D1   ; 
- D 1 - I - 0x003EE1 00:BED1: F0        .byte $F0   ; 
- D 1 - I - 0x003EE2 00:BED2: F0        .byte $F0   ; 
- D 1 - I - 0x003EE3 00:BED3: 74        .byte $74   ; 
- D 1 - I - 0x003EE4 00:BED4: DD        .byte $DD   ; 
- D 1 - I - 0x003EE5 00:BED5: FF        .byte $FF   ; 
- D 1 - I - 0x003EE6 00:BED6: FF        .byte $FF   ; 
- D 1 - I - 0x003EE7 00:BED7: 77        .byte $77   ; 
- D 1 - I - 0x003EE8 00:BED8: 55        .byte $55   ; 
- D 1 - I - 0x003EE9 00:BED9: 55        .byte $55   ; 
- D 1 - I - 0x003EEA 00:BEDA: 55        .byte $55   ; 
- D 1 - I - 0x003EEB 00:BEDB: AA        .byte $AA   ; 
- D 1 - I - 0x003EEC 00:BEDC: AA        .byte $AA   ; 
- D 1 - I - 0x003EED 00:BEDD: AA        .byte $AA   ; 
- D 1 - I - 0x003EEE 00:BEDE: 55        .byte $55   ; 
- D 1 - I - 0x003EEF 00:BEDF: 56        .byte $56   ; 
- D 1 - I - 0x003EF0 00:BEE0: AA        .byte $AA   ; 
- D 1 - I - 0x003EF1 00:BEE1: AA        .byte $AA   ; 
- D 1 - I - 0x003EF2 00:BEE2: A9        .byte $A9   ; 
- D 1 - I - 0x003EF3 00:BEE3: AA        .byte $AA   ; 
- D 1 - I - 0x003EF4 00:BEE4: 55        .byte $55   ; 
- D 1 - I - 0x003EF5 00:BEE5: 55        .byte $55   ; 
- D 1 - I - 0x003EF6 00:BEE6: AA        .byte $AA   ; 
- D 1 - I - 0x003EF7 00:BEE7: AA        .byte $AA   ; 
- D 1 - I - 0x003EF8 00:BEE8: 66        .byte $66   ; 
- D 1 - I - 0x003EF9 00:BEE9: 99        .byte $99   ; 
- D 1 - I - 0x003EFA 00:BEEA: AA        .byte $AA   ; 
- D 1 - I - 0x003EFB 00:BEEB: AA        .byte $AA   ; 
- D 1 - I - 0x003EFC 00:BEEC: AA        .byte $AA   ; 
- D 1 - I - 0x003EFD 00:BEED: AA        .byte $AA   ; 
- D 1 - I - 0x003EFE 00:BEEE: AA        .byte $AA   ; 
- D 1 - I - 0x003EFF 00:BEEF: 65        .byte $65   ; 
- D 1 - I - 0x003F00 00:BEF0: A5        .byte $A5   ; 
- D 1 - I - 0x003F01 00:BEF1: 95        .byte $95   ; 
- D 1 - I - 0x003F02 00:BEF2: 55        .byte $55   ; 
- D 1 - I - 0x003F03 00:BEF3: 55        .byte $55   ; 
- D 1 - I - 0x003F04 00:BEF4: F0        .byte $F0   ; 
- D 1 - I - 0x003F05 00:BEF5: F0        .byte $F0   ; 
- D 1 - I - 0x003F06 00:BEF6: FF        .byte $FF   ; 
- D 1 - I - 0x003F07 00:BEF7: FF        .byte $FF   ; 
- D 1 - I - 0x003F08 00:BEF8: FF        .byte $FF   ; 
- D 1 - I - 0x003F09 00:BEF9: FF        .byte $FF   ; 
- D 1 - I - 0x003F0A 00:BEFA: AA        .byte $AA   ; 
- D 1 - I - 0x003F0B 00:BEFB: 55        .byte $55   ; 
- D 1 - I - 0x003F0C 00:BEFC: 55        .byte $55   ; 
- D 1 - I - 0x003F0D 00:BEFD: AA        .byte $AA   ; 
- D 1 - I - 0x003F0E 00:BEFE: AA        .byte $AA   ; 
- D 1 - I - 0x003F0F 00:BEFF: AA        .byte $AA   ; 
- D 1 - I - 0x003F10 00:BF00: AA        .byte $AA   ; 
- D 1 - I - 0x003F11 00:BF01: AA        .byte $AA   ; 
- D 1 - I - 0x003F12 00:BF02: AA        .byte $AA   ; 
- D 1 - I - 0x003F13 00:BF03: AA        .byte $AA   ; 
- D 1 - I - 0x003F14 00:BF04: AA        .byte $AA   ; 
- D 1 - I - 0x003F15 00:BF05: 0A        .byte $0A   ; 
- D 1 - I - 0x003F16 00:BF06: 0A        .byte $0A   ; 
- D 1 - I - 0x003F17 00:BF07: AA        .byte $AA   ; 
- D 1 - I - 0x003F18 00:BF08: AA        .byte $AA   ; 
- D 1 - I - 0x003F19 00:BF09: 00        .byte $00   ; 
- D 1 - I - 0x003F1A 00:BF0A: 00        .byte $00   ; 
- D 1 - I - 0x003F1B 00:BF0B: AA        .byte $AA   ; 
- D 1 - I - 0x003F1C 00:BF0C: AA        .byte $AA   ; 
- D 1 - I - 0x003F1D 00:BF0D: AA        .byte $AA   ; 
- D 1 - I - 0x003F1E 00:BF0E: AA        .byte $AA   ; 
- D 1 - I - 0x003F1F 00:BF0F: AA        .byte $AA   ; 
- D 1 - I - 0x003F20 00:BF10: AA        .byte $AA   ; 
- D 1 - I - 0x003F21 00:BF11: AA        .byte $AA   ; 
- D 1 - I - 0x003F22 00:BF12: 0A        .byte $0A   ; 
- D 1 - I - 0x003F23 00:BF13: A5        .byte $A5   ; 
- D 1 - I - 0x003F24 00:BF14: A5        .byte $A5   ; 
- D 1 - I - 0x003F25 00:BF15: AA        .byte $AA   ; 
- D 1 - I - 0x003F26 00:BF16: AA        .byte $AA   ; 
- D 1 - I - 0x003F27 00:BF17: AA        .byte $AA   ; 
- D 1 - I - 0x003F28 00:BF18: AA        .byte $AA   ; 
- D 1 - I - 0x003F29 00:BF19: AA        .byte $AA   ; 
- D 1 - I - 0x003F2A 00:BF1A: AA        .byte $AA   ; 
- D 1 - I - 0x003F2B 00:BF1B: AA        .byte $AA   ; 
- D 1 - I - 0x003F2C 00:BF1C: AA        .byte $AA   ; 
- D 1 - I - 0x003F2D 00:BF1D: AA        .byte $AA   ; 
- D 1 - I - 0x003F2E 00:BF1E: AA        .byte $AA   ; 
- D 1 - I - 0x003F2F 00:BF1F: FF        .byte $FF   ; 
- D 1 - I - 0x003F30 00:BF20: FF        .byte $FF   ; 
- - - - - - 0x003F31 00:BF21: FF        .byte $FF   ; 
- - - - - - 0x003F32 00:BF22: FF        .byte $FF   ; 
- D 1 - I - 0x003F33 00:BF23: FF        .byte $FF   ; 
- D 1 - I - 0x003F34 00:BF24: FF        .byte $FF   ; 
- - - - - - 0x003F35 00:BF25: FF        .byte $FF   ; 
- - - - - - 0x003F36 00:BF26: FF        .byte $FF   ; 
- - - - - - 0x003F37 00:BF27: FF        .byte $FF   ; 
- D 1 - I - 0x003F38 00:BF28: AA        .byte $AA   ; 
- D 1 - I - 0x003F39 00:BF29: AA        .byte $AA   ; 
- D 1 - I - 0x003F3A 00:BF2A: AA        .byte $AA   ; 
- D 1 - I - 0x003F3B 00:BF2B: AA        .byte $AA   ; 
- D 1 - I - 0x003F3C 00:BF2C: AA        .byte $AA   ; 
- D 1 - I - 0x003F3D 00:BF2D: AA        .byte $AA   ; 
- D 1 - I - 0x003F3E 00:BF2E: AA        .byte $AA   ; 
- D 1 - I - 0x003F3F 00:BF2F: AA        .byte $AA   ; 
- D 1 - I - 0x003F40 00:BF30: AA        .byte $AA   ; 
- D 1 - I - 0x003F41 00:BF31: AA        .byte $AA   ; 
- D 1 - I - 0x003F42 00:BF32: AA        .byte $AA   ; 
- D 1 - I - 0x003F43 00:BF33: 00        .byte $00   ; 
- D 1 - I - 0x003F44 00:BF34: AA        .byte $AA   ; 
- D 1 - I - 0x003F45 00:BF35: AA        .byte $AA   ; 
- D 1 - I - 0x003F46 00:BF36: AA        .byte $AA   ; 
- D 1 - I - 0x003F47 00:BF37: AA        .byte $AA   ; 
- D 1 - I - 0x003F48 00:BF38: AA        .byte $AA   ; 
- D 1 - I - 0x003F49 00:BF39: AA        .byte $AA   ; 
- D 1 - I - 0x003F4A 00:BF3A: 00        .byte $00   ; 
- D 1 - I - 0x003F4B 00:BF3B: AA        .byte $AA   ; 
- D 1 - I - 0x003F4C 00:BF3C: AA        .byte $AA   ; 
- D 1 - I - 0x003F4D 00:BF3D: AA        .byte $AA   ; 
- D 1 - I - 0x003F4E 00:BF3E: AA        .byte $AA   ; 
- D 1 - I - 0x003F4F 00:BF3F: AA        .byte $AA   ; 
- D 1 - I - 0x003F50 00:BF40: AA        .byte $AA   ; 
- D 1 - I - 0x003F51 00:BF41: AA        .byte $AA   ; 
- D 1 - I - 0x003F52 00:BF42: AA        .byte $AA   ; 
- D 1 - I - 0x003F53 00:BF43: AA        .byte $AA   ; 
- D 1 - I - 0x003F54 00:BF44: AA        .byte $AA   ; 
- D 1 - I - 0x003F55 00:BF45: AA        .byte $AA   ; 
- D 1 - I - 0x003F56 00:BF46: AA        .byte $AA   ; 
- D 1 - I - 0x003F57 00:BF47: AA        .byte $AA   ; 
- D 1 - I - 0x003F58 00:BF48: AA        .byte $AA   ; 
- D 1 - I - 0x003F59 00:BF49: AA        .byte $AA   ; 
- D 1 - I - 0x003F5A 00:BF4A: AA        .byte $AA   ; 
- D 1 - I - 0x003F5B 00:BF4B: AA        .byte $AA   ; 
- D 1 - I - 0x003F5C 00:BF4C: AA        .byte $AA   ; 
- D 1 - I - 0x003F5D 00:BF4D: AA        .byte $AA   ; 
- D 1 - I - 0x003F5E 00:BF4E: AA        .byte $AA   ; 
- D 1 - I - 0x003F5F 00:BF4F: FE        .byte $FE   ; 
- D 1 - I - 0x003F60 00:BF50: 5A        .byte $5A   ; 
- D 1 - I - 0x003F61 00:BF51: 5A        .byte $5A   ; 
- D 1 - I - 0x003F62 00:BF52: 55        .byte $55   ; 
- D 1 - I - 0x003F63 00:BF53: 55        .byte $55   ; 
- D 1 - I - 0x003F64 00:BF54: 55        .byte $55   ; 
- D 1 - I - 0x003F65 00:BF55: 55        .byte $55   ; 
- D 1 - I - 0x003F66 00:BF56: AA        .byte $AA   ; 
- D 1 - I - 0x003F67 00:BF57: A5        .byte $A5   ; 
- D 1 - I - 0x003F68 00:BF58: A5        .byte $A5   ; 
- D 1 - I - 0x003F69 00:BF59: A5        .byte $A5   ; 
- D 1 - I - 0x003F6A 00:BF5A: 56        .byte $56   ; 
- D 1 - I - 0x003F6B 00:BF5B: AA        .byte $AA   ; 
- D 1 - I - 0x003F6C 00:BF5C: AA        .byte $AA   ; 
- D 1 - I - 0x003F6D 00:BF5D: 55        .byte $55   ; 
- D 1 - I - 0x003F6E 00:BF5E: 59        .byte $59   ; 
- D 1 - I - 0x003F6F 00:BF5F: 55        .byte $55   ; 
- D 1 - I - 0x003F70 00:BF60: AA        .byte $AA   ; 
- D 1 - I - 0x003F71 00:BF61: AA        .byte $AA   ; 
- D 1 - I - 0x003F72 00:BF62: AA        .byte $AA   ; 
- - - - - - 0x003F73 00:BF63: FF        .byte $FF   ; 
- D 1 - I - 0x003F74 00:BF64: 55        .byte $55   ; 
- D 1 - I - 0x003F75 00:BF65: AA        .byte $AA   ; 
- D 1 - I - 0x003F76 00:BF66: AA        .byte $AA   ; 
- D 1 - I - 0x003F77 00:BF67: AA        .byte $AA   ; 
- D 1 - I - 0x003F78 00:BF68: AA        .byte $AA   ; 
- D 1 - I - 0x003F79 00:BF69: AA        .byte $AA   ; 
- D 1 - I - 0x003F7A 00:BF6A: AA        .byte $AA   ; 
- D 1 - I - 0x003F7B 00:BF6B: AA        .byte $AA   ; 
- D 1 - I - 0x003F7C 00:BF6C: AA        .byte $AA   ; 
- D 1 - I - 0x003F7D 00:BF6D: AA        .byte $AA   ; 
- D 1 - I - 0x003F7E 00:BF6E: AA        .byte $AA   ; 
- D 1 - I - 0x003F7F 00:BF6F: FA        .byte $FA   ; 
- D 1 - I - 0x003F80 00:BF70: FA        .byte $FA   ; 
- D 1 - I - 0x003F81 00:BF71: 35        .byte $35   ; 
- D 1 - I - 0x003F82 00:BF72: C5        .byte $C5   ; 
- D 1 - I - 0x003F83 00:BF73: 19        .byte $19   ; 
- D 1 - I - 0x003F84 00:BF74: 8A        .byte $8A   ; 
- D 1 - I - 0x003F85 00:BF75: 2A        .byte $2A   ; 
- D 1 - I - 0x003F86 00:BF76: 46        .byte $46   ; 
- D 1 - I - 0x003F87 00:BF77: 99        .byte $99   ; 
- D 1 - I - 0x003F88 00:BF78: AA        .byte $AA   ; 
- D 1 - I - 0x003F89 00:BF79: AA        .byte $AA   ; 
- D 1 - I - 0x003F8A 00:BF7A: 66        .byte $66   ; 
- D 1 - I - 0x003F8B 00:BF7B: 59        .byte $59   ; 
- D 1 - I - 0x003F8C 00:BF7C: 5A        .byte $5A   ; 
- D 1 - I - 0x003F8D 00:BF7D: 5A        .byte $5A   ; 
- D 1 - I - 0x003F8E 00:BF7E: 56        .byte $56   ; 
- D 1 - I - 0x003F8F 00:BF7F: 55        .byte $55   ; 
- D 1 - I - 0x003F90 00:BF80: 55        .byte $55   ; 
- - - - - - 0x003F91 00:BF81: A0        .byte $A0   ; 
- - - - - - 0x003F92 00:BF82: A0        .byte $A0   ; 
- - - - - - 0x003F93 00:BF83: A0        .byte $A0   ; 
- - - - - - 0x003F94 00:BF84: 00        .byte $00   ; 
- - - - - - 0x003F95 00:BF85: 00        .byte $00   ; 
- - - - - - 0x003F96 00:BF86: 00        .byte $00   ; 
- - - - - - 0x003F97 00:BF87: 00        .byte $00   ; 
- - - - - - 0x003F98 00:BF88: 00        .byte $00   ; 
- - - - - - 0x003F99 00:BF89: 00        .byte $00   ; 
- - - - - - 0x003F9A 00:BF8A: 00        .byte $00   ; 


.out .sprintf("Free bytes in bank 30: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_30b"
- D 1 - - - 0x00400F 00:BFFF: 31        .byte con_prg_bank + $31   ; 



