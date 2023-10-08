.segment "BANK_3A"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x014010-0x01800F



.export _off001_0x014011_2E_tankman
.export _off001_0x0141A9_30_bullet_tank
.export _off001_0x0141FE_5B_cannon_tank
.export _off001_0x014332_5C_rifleman_standing_2
.export _off001_0x0143D2_63_mob_normal_2
.export _off001_0x014737_69_boss_2_green_tankman
.export _off001_0x014A09_6A_boss_2_red_tankman
.export _off001_0x014B4D_36_tank_electricity
.export _off001_0x014B91_25_moving_gun
.export _off001_0x014C67_2C_falling_platform
.export _off001_0x014DBA_2D_spawner_falling_platforms
.export _off001_0x014DF0_31_redblue_bubble
.export _off001_0x014E4B_39_elevator
.export _off001_0x01510E_40_mob_winged
.export _off001_0x01529D_41_spawner_winged_mobs
.export _off001_0x0152DB_43_boss_4_gun
.export _off001_0x01541F_44_boss_4_bullet
.export _off001_0x0154F3_6B_blue_bubble
.export _off001_0x0155C1_6C_spawner_blue_bubbles
.export _off001_0x015602_42_boss_4_hanger
.export _off004_0x01585B_06_area_7
.export _off005_0x015879_06_area_7
.export _off006_0x015C57_06_area_7
.export _off007_0x016767_06_area_7
.export _off004_0x016827_07_area_8
.export _off005_0x016869_07_area_8
.export _off006_0x016E57_07_area_8
.export _off007_0x017CB7_07_area_8



; bzk this byte must be placed at 8000
- D 0 - - - 0x014010 05:8000: 3A        .byte con_prg_bank + $3A   ; 



_off001_0x014011_2E_tankman:
- D 0 - I - 0x014011 05:8001: 13 80     .word ofs_038_2E_8013_01_initialize_object ; 
- D 0 - I - 0x014013 05:8003: 4B 80     .word ofs_038_2E_804B_02 ; 
- D 0 - I - 0x014015 05:8005: 60 80     .word ofs_038_2E_8060_03 ; 
- D 0 - I - 0x014017 05:8007: C7 80     .word ofs_038_2E_80C7_04 ; 
- D 0 - I - 0x014019 05:8009: 54 A3     .word ofs_038_2E_0x006364_05_delete_object_06 ; 
- D 0 - I - 0x01401B 05:800B: 6B A3     .word ofs_038_2E_0x00637B_06_delete_object_07 ; 
- D 0 - I - 0x01401D 05:800D: 4F 81     .word ofs_038_2E_814F_07 ; 
- D 0 - I - 0x01401F 05:800F: FD A2     .word ofs_038_2E_0x00630D_08 ; 
- D 0 - I - 0x014021 05:8011: 3D A3     .word ofs_038_2E_0x00634D_09_delete_object_04 ; 



ofs_038_2E_8013_01_initialize_object:
C - - J - - 0x014023 05:8013: A9 10     LDA #$10
C - - - - - 0x014025 05:8015: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x014028 05:8018: A9 85     LDA #$85
C - - - - - 0x01402A 05:801A: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x01402D 05:801D: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014030 05:8020: 18        CLC
C - - - - - 0x014031 05:8021: 69 08     ADC #$08
C - - - - - 0x014033 05:8023: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014036 05:8026: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014039 05:8029: 18        CLC
C - - - - - 0x01403A 05:802A: 69 04     ADC #$04
C - - - - - 0x01403C 05:802C: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x01403F 05:802F: A9 04     LDA #$04
C - - - - - 0x014041 05:8031: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x014044 05:8034: A9 1B     LDA #$1B
C - - - - - 0x014046 05:8036: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x014049 05:8039: A9 06     LDA #$06
C - - - - - 0x01404B 05:803B: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01404E 05:803E: A9 03     LDA #$03
C - - - - - 0x014050 05:8040: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014053 05:8043: E6 9F     INC ram_009F
C - - - - - 0x014055 05:8045: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014058 05:8048: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_2E_804B_02:
C - - J - - 0x01405B 05:804B: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x01405E 05:804E: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014061 05:8051: C9 20     CMP #$20
C - - - - - 0x014063 05:8053: 90 0A     BCC bra_805F_RTS
C - - - - - 0x014065 05:8055: A9 05     LDA #$05
C - - - - - 0x014067 05:8057: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x01406A 05:805A: A9 10     LDA #$10
C - - - - - 0x01406C 05:805C: 4C E0 A2  JMP loc_0x0062F0
bra_805F_RTS:
C - - - - - 0x01406F 05:805F: 60        RTS



ofs_038_2E_8060_03:
C - - J - - 0x014070 05:8060: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x014073 05:8063: B9 B7 80  LDA tbl_80B7_animation,Y
C - - - - - 0x014076 05:8066: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014079 05:8069: B9 BF 80  LDA tbl_80BF_spr_attr,Y
C - - - - - 0x01407C 05:806C: 20 19 87  JSR sub_8719
C - - - - - 0x01407F 05:806F: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014082 05:8072: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x014085 05:8075: D0 1C     BNE bra_8093
C - - - - - 0x014087 05:8077: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x01408A 05:807A: C9 06     CMP #$06
C - - - - - 0x01408C 05:807C: F0 15     BEQ bra_8093
C - - - - - 0x01408E 05:807E: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x014091 05:8081: 85 0A     STA ram_000A
C - - - - - 0x014093 05:8083: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x014096 05:8086: A0 04     LDY #$04
C - - - - - 0x014098 05:8088: 20 27 F3  JSR sub_0x01F337
C - - - - - 0x01409B 05:808B: 20 66 81  JSR sub_8166
C - - - - - 0x01409E 05:808E: A9 4D     LDA #$4D
C - - - - - 0x0140A0 05:8090: 9D F4 06  STA ram_06F4_obj,X
bra_8093:
C - - - - - 0x0140A3 05:8093: DE 02 07  DEC ram_0702_obj,X
C - - - - - 0x0140A6 05:8096: D0 0F     BNE bra_80A7
C - - - - - 0x0140A8 05:8098: A9 08     LDA #$08
C - - - - - 0x0140AA 05:809A: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x0140AD 05:809D: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x0140B0 05:80A0: 98        TYA
C - - - - - 0x0140B1 05:80A1: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0140B4 05:80A4: 20 95 F4  JSR sub_0x01F4A5
bra_80A7:
C - - - - - 0x0140B7 05:80A7: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0140BA 05:80AA: D0 0A     BNE bra_80B6_RTS
C - - - - - 0x0140BC 05:80AC: A9 00     LDA #$00
C - - - - - 0x0140BE 05:80AE: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x0140C1 05:80B1: A9 01     LDA #$01
C - - - - - 0x0140C3 05:80B3: 4C E0 A2  JMP loc_0x0062F0
bra_80B6_RTS:
C - - - - - 0x0140C6 05:80B6: 60        RTS



tbl_80B7_animation:
- D 0 - - - 0x0140C7 05:80B7: 53        .byte $53   ; 00 
- D 0 - - - 0x0140C8 05:80B8: 52        .byte $52   ; 01 
- D 0 - - - 0x0140C9 05:80B9: 51        .byte $51   ; 02 
- D 0 - - - 0x0140CA 05:80BA: 52        .byte $52   ; 03 
- D 0 - - - 0x0140CB 05:80BB: 53        .byte $53   ; 04 
- - - - - - 0x0140CC 05:80BC: 53        .byte $53   ; 05 
- - - - - - 0x0140CD 05:80BD: 53        .byte $53   ; 06 
- - - - - - 0x0140CE 05:80BE: 53        .byte $53   ; 07 



tbl_80BF_spr_attr:
- D 0 - - - 0x0140CF 05:80BF: 40        .byte $40   ; 00 
- D 0 - - - 0x0140D0 05:80C0: 40        .byte $40   ; 01 
- D 0 - - - 0x0140D1 05:80C1: 00        .byte $00   ; 02 
- D 0 - - - 0x0140D2 05:80C2: 00        .byte $00   ; 03 
- D 0 - - - 0x0140D3 05:80C3: 00        .byte $00   ; 04 
- - - - - - 0x0140D4 05:80C4: 00        .byte $00   ; 05 
- - - - - - 0x0140D5 05:80C5: 00        .byte $00   ; 06 
- - - - - - 0x0140D6 05:80C6: 40        .byte $40   ; 07 



ofs_038_2E_80C7_04:
C - - J - - 0x0140D7 05:80C7: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0140DA 05:80CA: C9 C0     CMP #$C0
C - - - - - 0x0140DC 05:80CC: 90 03     BCC bra_80D1
- - - - - - 0x0140DE 05:80CE: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_80D1:
C - - - - - 0x0140E1 05:80D1: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0140E4 05:80D4: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0140E7 05:80D7: D0 64     BNE bra_813D_RTS
C - - - - - 0x0140E9 05:80D9: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x0140EC 05:80DC: 0A        ASL
C - - - - - 0x0140ED 05:80DD: A8        TAY
C - - - - - 0x0140EE 05:80DE: B9 4B 81  LDA tbl_814B,Y
C - - - - - 0x0140F1 05:80E1: 85 08     STA ram_0008
C - - - - - 0x0140F3 05:80E3: B9 4C 81  LDA tbl_814B + $01,Y
C - - - - - 0x0140F6 05:80E6: 85 0C     STA ram_000C
C - - - - - 0x0140F8 05:80E8: A9 11     LDA #$11
C - - - - - 0x0140FA 05:80EA: 85 0D     STA ram_000D
C - - - - - 0x0140FC 05:80EC: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0140FF 05:80EF: 69 08     ADC #$08
C - - - - - 0x014101 05:80F1: A8        TAY
C - - - - - 0x014102 05:80F2: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014105 05:80F5: E9 08     SBC #$08
C - - - - - 0x014107 05:80F7: 20 B2 A8  JSR sub_0x0068C2
C - - - - - 0x01410A 05:80FA: A9 01     LDA #$01
C - - - - - 0x01410C 05:80FC: B0 3C     BCS bra_813A
C - - - - - 0x01410E 05:80FE: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x014111 05:8101: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x014114 05:8104: C9 02     CMP #$02
C - - - - - 0x014116 05:8106: B0 36     BCS bra_813E
C - - - - - 0x014118 05:8108: A9 02     LDA #$02
C - - - - - 0x01411A 05:810A: 85 08     STA ram_0008
bra_810C_loop:
C - - - - - 0x01411C 05:810C: A0 30     LDY #con_obj_id_30
C - - - - - 0x01411E 05:810E: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x014121 05:8111: 90 2A     BCC bra_813D_RTS
C - - - - - 0x014123 05:8113: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014126 05:8116: 18        CLC
C - - - - - 0x014127 05:8117: 69 1C     ADC #$1C
C - - - - - 0x014129 05:8119: 85 09     STA ram_0009
C - - - - - 0x01412B 05:811B: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01412E 05:811E: A6 11     LDX ram_0011
C - - - - - 0x014130 05:8120: A4 08     LDY ram_0008
C - - - - - 0x014132 05:8122: 18        CLC
C - - - - - 0x014133 05:8123: 79 48 81  ADC tbl_8148,Y
C - - - - - 0x014136 05:8126: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014139 05:8129: A5 09     LDA ram_0009
C - - - - - 0x01413B 05:812B: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x01413E 05:812E: 98        TYA
C - - - - - 0x01413F 05:812F: 9D 1E 07  STA ram_obj_flags,X
C - - - - - 0x014142 05:8132: C6 08     DEC ram_0008
C - - - - - 0x014144 05:8134: 10 D6     BPL bra_810C_loop
C - - - - - 0x014146 05:8136: A6 10     LDX ram_0010
C - - - - - 0x014148 05:8138: A9 08     LDA #$08
bra_813A:
C - - - - - 0x01414A 05:813A: 9D E6 06  STA ram_06E6_obj,X
bra_813D_RTS:
C - - - - - 0x01414D 05:813D: 60        RTS
bra_813E:
C - - - - - 0x01414E 05:813E: A9 60     LDA #$60
C - - - - - 0x014150 05:8140: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x014153 05:8143: A9 03     LDA #$03
C - - - - - 0x014155 05:8145: 4C 83 A2  JMP loc_0x006293_set_obj_state



tbl_8148:
- D 0 - - - 0x014158 05:8148: F4        .byte $F4   ; 00 
- D 0 - - - 0x014159 05:8149: 0C        .byte $0C   ; 01 
- D 0 - - - 0x01415A 05:814A: 00        .byte $00   ; 02 



tbl_814B:
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- D 0 - - - 0x01415B 05:814B: 69        .byte $69, $6A   ; 00 
- D 0 - - - 0x01415D 05:814D: 46        .byte $46, $47   ; 01 



ofs_038_2E_814F_07:
C - - J - - 0x01415F 05:814F: C6 9F     DEC ram_009F
C - - - - - 0x014161 05:8151: D0 06     BNE bra_8159
C - - - - - 0x014163 05:8153: A9 40     LDA #$40
C - - - - - 0x014165 05:8155: 85 7D     STA ram_007D_flag
C - - - - - 0x014167 05:8157: 85 71     STA ram_0071_flag
bra_8159:
C - - - - - 0x014169 05:8159: A9 00     LDA #$00
C - - - - - 0x01416B 05:815B: 20 46 A8  JSR sub_0x006856
C - - - - - 0x01416E 05:815E: B0 03     BCS bra_8163
C - - - - - 0x014170 05:8160: 4C 9A A2  JMP loc_0x0062AA
bra_8163:
- - - - - - 0x014173 05:8163: 4C B7 A6  JMP loc_0x0066C7_delete_object_03



sub_8166:
C - - - - - 0x014176 05:8166: D0 20     BNE bra_8188_RTS
C - - - - - 0x014178 05:8168: A9 06     LDA #$06
C - - - - - 0x01417A 05:816A: 9D 80 07  STA ram_0780_obj,X
C - - - - - 0x01417D 05:816D: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x014180 05:8170: A6 11     LDX ram_0011
C - - - - - 0x014182 05:8172: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014185 05:8175: 18        CLC
C - - - - - 0x014186 05:8176: 79 89 81  ADC tbl_8189_pos_Y,Y
C - - - - - 0x014189 05:8179: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x01418C 05:817C: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01418F 05:817F: 18        CLC
C - - - - - 0x014190 05:8180: 79 91 81  ADC tbl_8191_pos_X,Y
C - - - - - 0x014193 05:8183: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014196 05:8186: A6 10     LDX ram_0010
bra_8188_RTS:
C - - - - - 0x014198 05:8188: 60        RTS



tbl_8189_pos_Y:
- D 0 - - - 0x014199 05:8189: F6        .byte $F6   ; 00 
- D 0 - - - 0x01419A 05:818A: 00        .byte $00   ; 01 
- D 0 - - - 0x01419B 05:818B: 02        .byte $02   ; 02 
- D 0 - - - 0x01419C 05:818C: 00        .byte $00   ; 03 
- D 0 - - - 0x01419D 05:818D: F6        .byte $F6   ; 04 
- - - - - - 0x01419E 05:818E: F6        .byte $F6   ; 05 
- - - - - - 0x01419F 05:818F: F6        .byte $F6   ; 06 
- - - - - - 0x0141A0 05:8190: F6        .byte $F6   ; 07 



tbl_8191_pos_X:
- D 0 - - - 0x0141A1 05:8191: 0E        .byte $0E   ; 00 
- D 0 - - - 0x0141A2 05:8192: 0C        .byte $0C   ; 01 
- D 0 - - - 0x0141A3 05:8193: 00        .byte $00   ; 02 
- D 0 - - - 0x0141A4 05:8194: F4        .byte $F4   ; 03 
- D 0 - - - 0x0141A5 05:8195: F2        .byte $F2   ; 04 
- - - - - - 0x0141A6 05:8196: F2        .byte $F2   ; 05 
- - - - - - 0x0141A7 05:8197: 00        .byte $00   ; 06 
- - - - - - 0x0141A8 05:8198: 0E        .byte $0E   ; 07 



_off001_0x0141A9_30_bullet_tank:
- D 0 - I - 0x0141A9 05:8199: A3 81     .word ofs_038_30_81A3_01_initialize_object ; 
- D 0 - I - 0x0141AB 05:819B: A9 AE     .word ofs_038_30_0x006EB9_02 ; 
- D 0 - I - 0x0141AD 05:819D: DB 81     .word ofs_038_30_81DB_03 ; 
- D 0 - I - 0x0141AF 05:819F: 70 AE     .word ofs_038_30_0x006E80_04 ; 
- D 0 - I - 0x0141B1 05:81A1: 78 AE     .word ofs_038_30_0x006E88_05 ; 



ofs_038_30_81A3_01_initialize_object:
C - - J - - 0x0141B3 05:81A3: A9 02     LDA #$02
C - - - - - 0x0141B5 05:81A5: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0141B8 05:81A8: 20 95 AE  JSR sub_0x006EA5
C - - - - - 0x0141BB 05:81AB: A9 80     LDA #$80
C - - - - - 0x0141BD 05:81AD: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0141C0 05:81B0: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0141C3 05:81B3: 0A        ASL
C - - - - - 0x0141C4 05:81B4: 0A        ASL
C - - - - - 0x0141C5 05:81B5: A8        TAY
C - - - - - 0x0141C6 05:81B6: B9 CF 81  LDA tbl_81CF_speed,Y
C - - - - - 0x0141C9 05:81B9: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x0141CC 05:81BC: B9 D0 81  LDA tbl_81CF_speed + $01,Y
C - - - - - 0x0141CF 05:81BF: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x0141D2 05:81C2: B9 D1 81  LDA tbl_81CF_speed + $02,Y
C - - - - - 0x0141D5 05:81C5: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x0141D8 05:81C8: B9 D2 81  LDA tbl_81CF_speed + $03,Y
C - - - - - 0x0141DB 05:81CB: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x0141DE 05:81CE: 60        RTS



tbl_81CF_speed:
; 00 
- D 0 - - - 0x0141DF 05:81CF: E8 01     .word $01E8 ; Y
- D 0 - - - 0x0141E1 05:81D1: 6C FF     .word $FF6C ; X
; 01 
- D 0 - - - 0x0141E3 05:81D3: E8 01     .word $01E8 ; Y
- D 0 - - - 0x0141E5 05:81D5: 94 00     .word $0094 ; X
; 02 
- D 0 - - - 0x0141E7 05:81D7: 00 02     .word $0200 ; Y
- D 0 - - - 0x0141E9 05:81D9: 00 00     .word $0000 ; X



ofs_038_30_81DB_03:
C - - J - - 0x0141EB 05:81DB: A5 5B     LDA ram_005B
C - - - - - 0x0141ED 05:81DD: 29 01     AND #$01
C - - - - - 0x0141EF 05:81DF: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0141F2 05:81E2: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x0141F5 05:81E5: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x0141F8 05:81E8: D0 03     BNE bra_81ED_RTS
C - - - - - 0x0141FA 05:81EA: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_81ED_RTS:
C - - - - - 0x0141FD 05:81ED: 60        RTS



_off001_0x0141FE_5B_cannon_tank:
- D 0 - I - 0x0141FE 05:81EE: 00 82     .word ofs_038_5B_8200_01_initialize_object ; 
- D 0 - I - 0x014200 05:81F0: 27 82     .word ofs_038_5B_8227_02 ; 
- D 0 - I - 0x014202 05:81F2: 44 82     .word ofs_038_5B_8244_03 ; 
- D 0 - I - 0x014204 05:81F4: C2 82     .word ofs_038_5B_82C2_04 ; 
- D 0 - I - 0x014206 05:81F6: 54 A3     .word ofs_038_5B_0x006364_05_delete_object_06 ; 
- D 0 - I - 0x014208 05:81F8: 6B A3     .word ofs_038_5B_0x00637B_06_delete_object_07 ; 
- D 0 - I - 0x01420A 05:81FA: DA 82     .word ofs_038_5B_82DA_07 ; 
- D 0 - I - 0x01420C 05:81FC: FD A2     .word ofs_038_5B_0x00630D_08 ; 
- D 0 - I - 0x01420E 05:81FE: 3D A3     .word ofs_038_5B_0x00634D_09_delete_object_04 ; 



ofs_038_5B_8200_01_initialize_object:
C - - J - - 0x014210 05:8200: A9 01     LDA #$01
C - - - - - 0x014212 05:8202: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014215 05:8205: A9 08     LDA #$08
C - - - - - 0x014217 05:8207: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x01421A 05:820A: A9 85     LDA #$85
C - - - - - 0x01421C 05:820C: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x01421F 05:820F: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014222 05:8212: 69 08     ADC #$08
C - - - - - 0x014224 05:8214: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014227 05:8217: A9 06     LDA #$06
C - - - - - 0x014229 05:8219: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01422C 05:821C: A9 02     LDA #$02
C - - - - - 0x01422E 05:821E: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014231 05:8221: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014234 05:8224: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_5B_8227_02:
C - - J - - 0x014237 05:8227: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x01423A 05:822A: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01423D 05:822D: C9 20     CMP #$20
C - - - - - 0x01423F 05:822F: 90 12     BCC bra_8243_RTS
C - - - - - 0x014241 05:8231: A9 05     LDA #$05
C - - - - - 0x014243 05:8233: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x014246 05:8236: A9 02     LDA #$02
C - - - - - 0x014248 05:8238: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x01424B 05:823B: A9 01     LDA #$01
C - - - - - 0x01424D 05:823D: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x014250 05:8240: 4C E0 A2  JMP loc_0x0062F0
bra_8243_RTS:
C - - - - - 0x014253 05:8243: 60        RTS



ofs_038_5B_8244_03:
C - - J - - 0x014254 05:8244: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014257 05:8247: C9 C0     CMP #$C0
C - - - - - 0x014259 05:8249: 90 03     BCC bra_824E
C - - - - - 0x01425B 05:824B: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_824E:
C - - - - - 0x01425E 05:824E: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014261 05:8251: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x014264 05:8254: D0 21     BNE bra_8277
C - - - - - 0x014266 05:8256: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x014269 05:8259: 85 0A     STA ram_000A
C - - - - - 0x01426B 05:825B: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x01426E 05:825E: A0 03     LDY #$03
C - - - - - 0x014270 05:8260: 20 E4 F2  JSR sub_0x01F2F4
C - - - - - 0x014273 05:8263: 20 FA 82  JSR sub_82FA
C - - - - - 0x014276 05:8266: A9 10     LDA #$10
C - - - - - 0x014278 05:8268: DE 72 07  DEC ram_0772_obj,X
C - - - - - 0x01427B 05:826B: 10 07     BPL bra_8274
C - - - - - 0x01427D 05:826D: A9 02     LDA #$02
C - - - - - 0x01427F 05:826F: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x014282 05:8272: A9 57     LDA #$57
bra_8274:
C - - - - - 0x014284 05:8274: 9D F4 06  STA ram_06F4_obj,X
bra_8277:
C - - - - - 0x014287 05:8277: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x01428A 05:827A: D0 38     BNE bra_82B4_RTS
C - - - - - 0x01428C 05:827C: A9 0C     LDA #$0C
C - - - - - 0x01428E 05:827E: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x014291 05:8281: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x014294 05:8284: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014297 05:8287: 38        SEC
C - - - - - 0x014298 05:8288: E9 10     SBC #$10
C - - - - - 0x01429A 05:828A: D9 32 05  CMP ram_pos_Y_hi_plr,Y
C - - - - - 0x01429D 05:828D: 98        TYA
C - - - - - 0x01429E 05:828E: 90 04     BCC bra_8294
C - - - - - 0x0142A0 05:8290: 49 01     EOR #$01
C - - - - - 0x0142A2 05:8292: 85 0A     STA ram_000A
bra_8294:
C - - - - - 0x0142A4 05:8294: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0142A7 05:8297: 20 A2 F4  JSR sub_0x01F4B2
C - - - - - 0x0142AA 05:829A: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0142AD 05:829D: 85 0B     STA ram_000B
C - - - - - 0x0142AF 05:829F: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0142B2 05:82A2: C9 0D     CMP #$0D
C - - - - - 0x0142B4 05:82A4: B0 0E     BCS bra_82B4_RTS
C - - - - - 0x0142B6 05:82A6: A8        TAY
C - - - - - 0x0142B7 05:82A7: B9 B5 82  LDA tbl_82B5,Y
C - - - - - 0x0142BA 05:82AA: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x0142BD 05:82AD: C5 0B     CMP ram_000B
C - - - - - 0x0142BF 05:82AF: F0 03     BEQ bra_82B4_RTS
C - - - - - 0x0142C1 05:82B1: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_82B4_RTS:
C - - - - - 0x0142C4 05:82B4: 60        RTS



tbl_82B5:
- D 0 - - - 0x0142C5 05:82B5: 00        .byte $00   ; 00 
- D 0 - - - 0x0142C6 05:82B6: 00        .byte $00   ; 01 
- D 0 - - - 0x0142C7 05:82B7: 01        .byte $01   ; 02 
- D 0 - - - 0x0142C8 05:82B8: 01        .byte $01   ; 03 
- D 0 - - - 0x0142C9 05:82B9: 01        .byte $01   ; 04 
- D 0 - - - 0x0142CA 05:82BA: 02        .byte $02   ; 05 
- D 0 - - - 0x0142CB 05:82BB: 02        .byte $02   ; 06 
- D 0 - - - 0x0142CC 05:82BC: 02        .byte $02   ; 07 
- D 0 - - - 0x0142CD 05:82BD: 03        .byte $03   ; 08 
- D 0 - - - 0x0142CE 05:82BE: 03        .byte $03   ; 09 
- D 0 - - - 0x0142CF 05:82BF: 03        .byte $03   ; 0A 
- D 0 - - - 0x0142D0 05:82C0: 04        .byte $04   ; 0B 
- D 0 - - - 0x0142D1 05:82C1: 04        .byte $04   ; 0C 



ofs_038_5B_82C2_04:
C - - J - - 0x0142D2 05:82C2: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0142D5 05:82C5: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x0142D8 05:82C8: B9 D5 82  LDA tbl_82D5,Y
C - - - - - 0x0142DB 05:82CB: 20 E7 82  JSR sub_82E7
C - - - - - 0x0142DE 05:82CE: B0 E4     BCS bra_82B4_RTS
C - - - - - 0x0142E0 05:82D0: A9 03     LDA #$03
C - - - - - 0x0142E2 05:82D2: 4C 83 A2  JMP loc_0x006293_set_obj_state



tbl_82D5:
- D 0 - - - 0x0142E5 05:82D5: 97        .byte $97   ; 00 
- D 0 - - - 0x0142E6 05:82D6: 96        .byte $96   ; 01 
- D 0 - - - 0x0142E7 05:82D7: D4        .byte $D4   ; 02 
- D 0 - - - 0x0142E8 05:82D8: 93        .byte $93   ; 03 
- D 0 - - - 0x0142E9 05:82D9: 92        .byte $92   ; 04 



ofs_038_5B_82DA_07:
C - - J - - 0x0142EA 05:82DA: A9 98     LDA #$98
C - - - - - 0x0142EC 05:82DC: 20 E7 82  JSR sub_82E7
C - - - - - 0x0142EF 05:82DF: B0 03     BCS bra_82E4
C - - - - - 0x0142F1 05:82E1: 4C 9A A2  JMP loc_0x0062AA
bra_82E4:
C - - - - - 0x0142F4 05:82E4: 4C B7 A6  JMP loc_0x0066C7_delete_object_03



sub_82E7:
C - - - - - 0x0142F7 05:82E7: 85 08     STA ram_0008
C - - - - - 0x0142F9 05:82E9: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0142FC 05:82EC: E9 0C     SBC #$0C
C - - - - - 0x0142FE 05:82EE: A8        TAY
C - - - - - 0x0142FF 05:82EF: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014302 05:82F2: E9 0C     SBC #$0C
C - - - - - 0x014304 05:82F4: 20 95 F0  JSR sub_0x01F0A5
C - - - - - 0x014307 05:82F7: A6 10     LDX ram_0010
C - - - - - 0x014309 05:82F9: 60        RTS



sub_82FA:
C - - - - - 0x01430A 05:82FA: D0 1B     BNE bra_8317_RTS
C - - - - - 0x01430C 05:82FC: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x01430F 05:82FF: A6 11     LDX ram_0011
C - - - - - 0x014311 05:8301: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014314 05:8304: 18        CLC
C - - - - - 0x014315 05:8305: 79 18 83  ADC tbl_8318_pos_Y,Y
C - - - - - 0x014318 05:8308: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x01431B 05:830B: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01431E 05:830E: 18        CLC
C - - - - - 0x01431F 05:830F: 79 1D 83  ADC tbl_831D_pos_X,Y
C - - - - - 0x014322 05:8312: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014325 05:8315: A6 10     LDX ram_0010
bra_8317_RTS:
C - - - - - 0x014327 05:8317: 60        RTS



tbl_8318_pos_Y:
- D 0 - - - 0x014328 05:8318: FB        .byte $FB   ; 00 
- D 0 - - - 0x014329 05:8319: 04        .byte $04   ; 01 
- D 0 - - - 0x01432A 05:831A: 0C        .byte $0C   ; 02 
- D 0 - - - 0x01432B 05:831B: 04        .byte $04   ; 03 
- D 0 - - - 0x01432C 05:831C: FB        .byte $FB   ; 04 



tbl_831D_pos_X:
- D 0 - - - 0x01432D 05:831D: 12        .byte $12   ; 00 
- D 0 - - - 0x01432E 05:831E: 0D        .byte $0D   ; 01 
- D 0 - - - 0x01432F 05:831F: 00        .byte $00   ; 02 
- D 0 - - - 0x014330 05:8320: F3        .byte $F3   ; 03 
- D 0 - - - 0x014331 05:8321: EE        .byte $EE   ; 04 



_off001_0x014332_5C_rifleman_standing_2:
- D 0 - I - 0x014332 05:8322: 2C 83     .word ofs_038_5C_832C_01_initialize_object ; 
- D 0 - I - 0x014334 05:8324: 4D 83     .word ofs_038_5C_834D_02 ; 
- D 0 - I - 0x014336 05:8326: 9A A2     .word ofs_038_5C_0x0062AA_03 ; 
- D 0 - I - 0x014338 05:8328: FD A2     .word ofs_038_5C_0x00630D_04 ; 
- D 0 - I - 0x01433A 05:832A: 3D A3     .word ofs_038_5C_0x00634D_05_delete_object_04 ; 



ofs_038_5C_832C_01_initialize_object:
C - - J - - 0x01433C 05:832C: A9 02     LDA #$02
C - - - - - 0x01433E 05:832E: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x014341 05:8331: A9 01     LDA #$01
C - - - - - 0x014343 05:8333: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x014346 05:8336: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014349 05:8339: A9 06     LDA #$06
C - - - - - 0x01434B 05:833B: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01434E 05:833E: A9 03     LDA #$03
C - - - - - 0x014350 05:8340: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014353 05:8343: A9 20     LDA #$20
C - - - - - 0x014355 05:8345: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x014358 05:8348: A9 01     LDA #$01
C - - - - - 0x01435A 05:834A: 4C E0 A2  JMP loc_0x0062F0



ofs_038_5C_834D_02:
C - - J - - 0x01435D 05:834D: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x014360 05:8350: B9 A3 83  LDA tbl_83A3_animation,Y
C - - - - - 0x014363 05:8353: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014366 05:8356: B9 AB 83  LDA tbl_83AB_spr_attr,Y
C - - - - - 0x014369 05:8359: 20 19 87  JSR sub_8719
C - - - - - 0x01436C 05:835C: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x01436F 05:835F: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x014372 05:8362: D0 2A     BNE bra_838E
C - - - - - 0x014374 05:8364: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x014377 05:8367: 85 0A     STA ram_000A
C - - - - - 0x014379 05:8369: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x01437C 05:836C: A0 03     LDY #$03
C - - - - - 0x01437E 05:836E: 20 27 F3  JSR sub_0x01F337
C - - - - - 0x014381 05:8371: 20 B9 83  JSR sub_83B9
C - - - - - 0x014384 05:8374: A9 10     LDA #$10
C - - - - - 0x014386 05:8376: DE 72 07  DEC ram_0772_obj,X
C - - - - - 0x014389 05:8379: 10 0F     BPL bra_838A
C - - - - - 0x01438B 05:837B: A9 01     LDA #$01
C - - - - - 0x01438D 05:837D: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x014390 05:8380: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x014392 05:8382: 65 5B     ADC ram_005B
C - - - - - 0x014394 05:8384: 85 23     STA ram_рандом_байт_1
C - - - - - 0x014396 05:8386: 29 0F     AND #$0F
C - - - - - 0x014398 05:8388: 69 77     ADC #$77
bra_838A:
C - - - - - 0x01439A 05:838A: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x01439D 05:838D: 60        RTS
bra_838E:
C - - - - - 0x01439E 05:838E: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0143A1 05:8391: D0 0F     BNE bra_83A2_RTS
C - - - - - 0x0143A3 05:8393: A9 08     LDA #$08
C - - - - - 0x0143A5 05:8395: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x0143A8 05:8398: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x0143AB 05:839B: 98        TYA
C - - - - - 0x0143AC 05:839C: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0143AF 05:839F: 20 95 F4  JSR sub_0x01F4A5
bra_83A2_RTS:
C - - - - - 0x0143B2 05:83A2: 60        RTS



tbl_83A3_animation:
- D 0 - - - 0x0143B3 05:83A3: 47        .byte $47   ; 00 
- D 0 - - - 0x0143B4 05:83A4: 41        .byte $41   ; 01 
- D 0 - - - 0x0143B5 05:83A5: 3E        .byte $3E   ; 02 
- D 0 - - - 0x0143B6 05:83A6: 41        .byte $41   ; 03 
- D 0 - - - 0x0143B7 05:83A7: 47        .byte $47   ; 04 
- D 0 - - - 0x0143B8 05:83A8: 44        .byte $44   ; 05 
- D 0 - - - 0x0143B9 05:83A9: 48        .byte $48   ; 06 
- D 0 - - - 0x0143BA 05:83AA: 44        .byte $44   ; 07 



tbl_83AB_spr_attr:
- D 0 - - - 0x0143BB 05:83AB: 40        .byte $40   ; 00 
- D 0 - - - 0x0143BC 05:83AC: 40        .byte $40   ; 01 
- D 0 - - - 0x0143BD 05:83AD: 00        .byte $00   ; 02 
- D 0 - - - 0x0143BE 05:83AE: 00        .byte $00   ; 03 
- D 0 - - - 0x0143BF 05:83AF: 00        .byte $00   ; 04 
- D 0 - - - 0x0143C0 05:83B0: 00        .byte $00   ; 05 
- D 0 - - - 0x0143C1 05:83B1: 00        .byte $00   ; 06 
- D 0 - - - 0x0143C2 05:83B2: 40        .byte $40   ; 07 


; bzk garbage
- - - - - - 0x0143C3 05:83B3: 4C 3E B1  JMP loc_0x00714E


; bzk garbage
- - - - - - 0x0143C6 05:83B6: 4C 7C B1  JMP loc_0x00718C



sub_83B9:
C - - - - - 0x0143C9 05:83B9: D0 06     BNE bra_83C1_RTS
C - - - - - 0x0143CB 05:83BB: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x0143CE 05:83BE: 4C EB 86  JMP loc_86EB
bra_83C1_RTS:
- - - - - - 0x0143D1 05:83C1: 60        RTS



_off001_0x0143D2_63_mob_normal_2:
- D 0 - I - 0x0143D2 05:83C2: CE 83     .word ofs_038_63_83CE_01_initialize_object ; 
- D 0 - I - 0x0143D4 05:83C4: 4D 84     .word ofs_038_63_844D_02 ; 
- D 0 - I - 0x0143D6 05:83C6: 8F 86     .word ofs_038_63_868F_03 ; 
- D 0 - I - 0x0143D8 05:83C8: 9A A2     .word ofs_038_63_0x0062AA_04 ; 
- D 0 - I - 0x0143DA 05:83CA: FD A2     .word ofs_038_63_0x00630D_05 ; 
- D 0 - I - 0x0143DC 05:83CC: 3D A3     .word ofs_038_63_0x00634D_06_delete_object_04 ; 



ofs_038_63_83CE_01_initialize_object:
C - - J - - 0x0143DE 05:83CE: A9 02     LDA #$02
C - - - - - 0x0143E0 05:83D0: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0143E3 05:83D3: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0143E6 05:83D6: 4A        LSR
C - - - - - 0x0143E7 05:83D7: 90 0A     BCC bra_83E3
C - - - - - 0x0143E9 05:83D9: A9 40     LDA #$40
C - - - - - 0x0143EB 05:83DB: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x0143EE 05:83DE: A9 E0     LDA #$E0
C - - - - - 0x0143F0 05:83E0: 9D 22 05  STA ram_pos_Y_hi_enemy,X
bra_83E3:
C - - - - - 0x0143F3 05:83E3: 20 F3 83  JSR sub_83F3
C - - - - - 0x0143F6 05:83E6: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x0143F9 05:83E9: A9 20     LDA #$20
C - - - - - 0x0143FB 05:83EB: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x0143FE 05:83EE: A9 30     LDA #$30
C - - - - - 0x014400 05:83F0: 4C E0 A2  JMP loc_0x0062F0



sub_83F3:
C - - - - - 0x014403 05:83F3: 20 4C 86  JSR sub_864C
C - - - - - 0x014406 05:83F6: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x014409 05:83F9: 20 F0 F4  JSR sub_0x01F500
C - - - - - 0x01440C 05:83FC: A5 0C     LDA ram_000C
C - - - - - 0x01440E 05:83FE: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x014411 05:8401: A8        TAY
C - - - - - 0x014412 05:8402: 20 9B F4  JSR sub_0x01F4AB
C - - - - - 0x014415 05:8405: 4C 0E 84  JMP loc_840E



sub_8408:
C - - - - - 0x014418 05:8408: 20 4C 86  JSR sub_864C
C - - - - - 0x01441B 05:840B: 20 95 F4  JSR sub_0x01F4A5



loc_840E:
sub_840E:
C D 0 - - - 0x01441E 05:840E: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x014421 05:8411: 0A        ASL
C - - - - - 0x014422 05:8412: 0A        ASL
C - - - - - 0x014423 05:8413: A8        TAY
C - - - - - 0x014424 05:8414: B9 2D 84  LDA tbl_842D_speed,Y
C - - - - - 0x014427 05:8417: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x01442A 05:841A: B9 2E 84  LDA tbl_842D_speed + $01,Y
C - - - - - 0x01442D 05:841D: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x014430 05:8420: B9 2F 84  LDA tbl_842D_speed + $02,Y
C - - - - - 0x014433 05:8423: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x014436 05:8426: B9 30 84  LDA tbl_842D_speed + $03,Y
C - - - - - 0x014439 05:8429: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x01443C 05:842C: 60        RTS



tbl_842D_speed:
; 00 
- D 0 - - - 0x01443D 05:842D: 00 00     .word $0000 ; Y
- D 0 - - - 0x01443F 05:842F: C0 00     .word $00C0 ; X
; 01 
- D 0 - - - 0x014441 05:8431: 87 00     .word $0087 ; Y
- D 0 - - - 0x014443 05:8433: 87 00     .word $0087 ; X
; 02 
- D 0 - - - 0x014445 05:8435: C0 00     .word $00C0 ; Y
- D 0 - - - 0x014447 05:8437: 00 00     .word $0000 ; X
; 03 
- D 0 - - - 0x014449 05:8439: 87 00     .word $0087 ; Y
- D 0 - - - 0x01444B 05:843B: 79 FF     .word $FF79 ; X
; 04 
- D 0 - - - 0x01444D 05:843D: 00 00     .word $0000 ; Y
- D 0 - - - 0x01444F 05:843F: 40 FF     .word $FF40 ; X
; 05 
- D 0 - - - 0x014451 05:8441: 79 FF     .word $FF79 ; Y
- D 0 - - - 0x014453 05:8443: 79 FF     .word $FF79 ; X
; 06 
- D 0 - - - 0x014455 05:8445: 40 FF     .word $FF40 ; Y
- D 0 - - - 0x014457 05:8447: 00 00     .word $0000 ; X
; 07 
- D 0 - - - 0x014459 05:8449: 79 FF     .word $FF79 ; Y
- D 0 - - - 0x01445B 05:844B: 87 00     .word $0087 ; X



ofs_038_63_844D_02:
C - - J - - 0x01445D 05:844D: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x014460 05:8450: F0 2D     BEQ bra_847F
C - - - - - 0x014462 05:8452: B9 A1 85  LDA tbl_85A2 - $01,Y
C - - - - - 0x014465 05:8455: 18        CLC
C - - - - - 0x014466 05:8456: 7D 22 05  ADC ram_pos_Y_hi_enemy,X
C - - - - - 0x014469 05:8459: 85 08     STA ram_0008
C - - - - - 0x01446B 05:845B: B9 A5 85  LDA tbl_85A6 - $01,Y
C - - - - - 0x01446E 05:845E: 18        CLC
C - - - - - 0x01446F 05:845F: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x014472 05:8462: A4 08     LDY ram_0008
C - - - - - 0x014474 05:8464: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x014477 05:8467: D0 16     BNE bra_847F
C - - - - - 0x014479 05:8469: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x01447C 05:846C: B9 A9 85  LDA tbl_85AA - $01,Y
C - - - - - 0x01447F 05:846F: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x014482 05:8472: A9 08     LDA #$08
C - - - - - 0x014484 05:8474: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x014487 05:8477: A9 00     LDA #$00
C - - - - - 0x014489 05:8479: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x01448C 05:847C: 4C 04 85  JMP loc_8504
bra_847F:
C - - - - - 0x01448F 05:847F: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x014492 05:8482: 1D BC 06  ORA ram_spd_X_lo_obj,X
C - - - - - 0x014495 05:8485: F0 40     BEQ bra_84C7
C - - - - - 0x014497 05:8487: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x01449A 05:848A: 2A        ROL
C - - - - - 0x01449B 05:848B: 2A        ROL
C - - - - - 0x01449C 05:848C: 29 01     AND #$01
C - - - - - 0x01449E 05:848E: A8        TAY
C - - - - - 0x01449F 05:848F: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0144A2 05:8492: D9 B2 85  CMP tbl_85B2,Y
C - - - - - 0x0144A5 05:8495: C8        INY
C - - - - - 0x0144A6 05:8496: 84 13     STY ram_0013
C - - - - - 0x0144A8 05:8498: 6A        ROR
C - - - - - 0x0144A9 05:8499: 5D CA 06  EOR ram_spd_X_hi_obj,X
C - - - - - 0x0144AC 05:849C: 30 1B     BMI bra_84B9
C - - - - - 0x0144AE 05:849E: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x0144B1 05:84A1: 0A        ASL
C - - - - - 0x0144B2 05:84A2: A9 08     LDA #$08
C - - - - - 0x0144B4 05:84A4: A0 01     LDY #$01
C - - - - - 0x0144B6 05:84A6: 90 03     BCC bra_84AB
C - - - - - 0x0144B8 05:84A8: A9 F8     LDA #$F8
C - - - - - 0x0144BA 05:84AA: C8        INY
bra_84AB:
C - - - - - 0x0144BB 05:84AB: 84 13     STY ram_0013
C - - - - - 0x0144BD 05:84AD: 18        CLC
C - - - - - 0x0144BE 05:84AE: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x0144C1 05:84B1: BC 22 05  LDY ram_pos_Y_hi_enemy,X
C - - - - - 0x0144C4 05:84B4: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x0144C7 05:84B7: F0 0E     BEQ bra_84C7
bra_84B9:
C - - - - - 0x0144C9 05:84B9: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x0144CC 05:84BC: D0 03     BNE bra_84C1
C - - - - - 0x0144CE 05:84BE: 4C 3B 85  JMP loc_853B
bra_84C1:
C - - - - - 0x0144D1 05:84C1: 20 2B 86  JSR sub_862B
C - - - - - 0x0144D4 05:84C4: 4C 04 85  JMP loc_8504
bra_84C7:
C - - - - - 0x0144D7 05:84C7: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x0144DA 05:84CA: 1D A0 06  ORA ram_spd_Y_lo_obj,X
C - - - - - 0x0144DD 05:84CD: F0 2B     BEQ bra_84FA
C - - - - - 0x0144DF 05:84CF: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x0144E2 05:84D2: 0A        ASL
C - - - - - 0x0144E3 05:84D3: A9 10     LDA #$10
C - - - - - 0x0144E5 05:84D5: A0 03     LDY #$03
C - - - - - 0x0144E7 05:84D7: 90 03     BCC bra_84DC
C - - - - - 0x0144E9 05:84D9: A9 F8     LDA #$F8
C - - - - - 0x0144EB 05:84DB: C8        INY
bra_84DC:
C - - - - - 0x0144EC 05:84DC: 84 13     STY ram_0013
C - - - - - 0x0144EE 05:84DE: 18        CLC
C - - - - - 0x0144EF 05:84DF: 7D 22 05  ADC ram_pos_Y_hi_enemy,X
C - - - - - 0x0144F2 05:84E2: C9 E8     CMP #$E8
C - - - - - 0x0144F4 05:84E4: B0 14     BCS bra_84FA
C - - - - - 0x0144F6 05:84E6: A8        TAY
C - - - - - 0x0144F7 05:84E7: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0144FA 05:84EA: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x0144FD 05:84ED: F0 0B     BEQ bra_84FA
C - - - - - 0x0144FF 05:84EF: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x014502 05:84F2: F0 2B     BEQ bra_851F
- - - - - - 0x014504 05:84F4: 20 2B 86  JSR sub_862B
- - - - - - 0x014507 05:84F7: 4C 04 85  JMP loc_8504
bra_84FA:
C - - - - - 0x01450A 05:84FA: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x01450D 05:84FD: D0 05     BNE bra_8504
C - - - - - 0x01450F 05:84FF: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x014512 05:8502: F0 53     BEQ bra_8557
bra_8504:
loc_8504:
C D 0 - - - 0x014514 05:8504: 20 C3 85  JSR sub_85C3
C - - - - - 0x014517 05:8507: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x01451A 05:850A: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x01451D 05:850D: 29 02     AND #$02
C - - - - - 0x01451F 05:850F: F0 0D     BEQ bra_851E_RTS
C - - - - - 0x014521 05:8511: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x014524 05:8514: D0 08     BNE bra_851E_RTS
C - - - - - 0x014526 05:8516: A9 20     LDA #$20
C - - - - - 0x014528 05:8518: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x01452B 05:851B: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_851E_RTS:
C - - - - - 0x01452E 05:851E: 60        RTS
bra_851F:
C - - - - - 0x01452F 05:851F: 20 66 86  JSR sub_8666
C - - - - - 0x014532 05:8522: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014535 05:8525: C5 0C     CMP ram_000C
C - - - - - 0x014537 05:8527: 6A        ROR
C - - - - - 0x014538 05:8528: 5D AE 06  EOR ram_spd_Y_hi_obj,X
C - - - - - 0x01453B 05:852B: 30 2A     BMI bra_8557
C - - - - - 0x01453D 05:852D: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014540 05:8530: C5 0B     CMP ram_000B
C - - - - - 0x014542 05:8532: A9 00     LDA #$00
C - - - - - 0x014544 05:8534: 90 02     BCC bra_8538
C - - - - - 0x014546 05:8536: A9 01     LDA #$01
bra_8538:
C - - - - - 0x014548 05:8538: 4C 8A 85  JMP loc_858A



loc_853B:
C D 0 - - - 0x01454B 05:853B: 20 66 86  JSR sub_8666
C - - - - - 0x01454E 05:853E: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014551 05:8541: C5 0B     CMP ram_000B
C - - - - - 0x014553 05:8543: 6A        ROR
C - - - - - 0x014554 05:8544: 5D CA 06  EOR ram_spd_X_hi_obj,X
C - - - - - 0x014557 05:8547: 30 0E     BMI bra_8557
C - - - - - 0x014559 05:8549: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01455C 05:854C: C5 0C     CMP ram_000C
C - - - - - 0x01455E 05:854E: A9 02     LDA #$02
C - - - - - 0x014560 05:8550: 90 02     BCC bra_8554
C - - - - - 0x014562 05:8552: A9 03     LDA #$03
bra_8554:
C - - - - - 0x014564 05:8554: 4C 8A 85  JMP loc_858A
bra_8557:
C - - - - - 0x014567 05:8557: 20 66 86  JSR sub_8666
C - - - - - 0x01456A 05:855A: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01456D 05:855D: C5 0C     CMP ram_000C
C - - - - - 0x01456F 05:855F: 90 0A     BCC bra_856B
C - - - - - 0x014571 05:8561: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x014574 05:8564: 0A        ASL
C - - - - - 0x014575 05:8565: 30 0C     BMI bra_8573
C - - - - - 0x014577 05:8567: A9 80     LDA #$80
C - - - - - 0x014579 05:8569: D0 05     BNE bra_8570    ; jmp
bra_856B:
C - - - - - 0x01457B 05:856B: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x01457E 05:856E: 29 BF     AND #$BF
bra_8570:
C - - - - - 0x014580 05:8570: 9D 72 07  STA ram_0772_obj,X
bra_8573:
C - - - - - 0x014583 05:8573: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x014585 05:8575: E5 23     SBC ram_рандом_байт_1
C - - - - - 0x014587 05:8577: 85 23     STA ram_рандом_байт_1
C - - - - - 0x014589 05:8579: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x01458B 05:857B: 29 07     AND #$07
C - - - - - 0x01458D 05:857D: A8        TAY
C - - - - - 0x01458E 05:857E: B9 B4 85  LDA tbl_85B4,Y
C - - - - - 0x014591 05:8581: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x014594 05:8584: 20 08 84  JSR sub_8408
C - - - - - 0x014597 05:8587: 4C B7 A6  JMP loc_0x0066C7_delete_object_03



loc_858A:
C D 0 - - - 0x01459A 05:858A: A8        TAY
C - - - - - 0x01459B 05:858B: B9 AA 85  LDA tbl_85AA,Y
C - - - - - 0x01459E 05:858E: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0145A1 05:8591: B9 AE 85  LDA tbl_85AE,Y
C - - - - - 0x0145A4 05:8594: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x0145A7 05:8597: A5 13     LDA ram_0013
C - - - - - 0x0145A9 05:8599: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0145AC 05:859C: 20 0E 84  JSR sub_840E
C - - - - - 0x0145AF 05:859F: 4C B7 A6  JMP loc_0x0066C7_delete_object_03



tbl_85A2:
- D 0 - - - 0x0145B2 05:85A2: 00        .byte $00   ; 01
- D 0 - - - 0x0145B3 05:85A3: 00        .byte $00   ; 02
- D 0 - - - 0x0145B4 05:85A4: 10        .byte $10   ; 03
- D 0 - - - 0x0145B5 05:85A5: F8        .byte $F8   ; 04



tbl_85A6:
- D 0 - - - 0x0145B6 05:85A6: 08        .byte $08   ; 01
- D 0 - - - 0x0145B7 05:85A7: F8        .byte $F8   ; 02
- D 0 - - - 0x0145B8 05:85A8: 00        .byte $00   ; 03
- D 0 - - - 0x0145B9 05:85A9: 00        .byte $00   ; 04



tbl_85AA:
- D 0 - - - 0x0145BA 05:85AA: 00        .byte $00   ; 00 (01)
- D 0 - - - 0x0145BB 05:85AB: 0C        .byte $0C   ; 01 (02)
- D 0 - - - 0x0145BC 05:85AC: 06        .byte $06   ; 02 (03)
- D 0 - - - 0x0145BD 05:85AD: 12        .byte $12   ; 03 (04)



tbl_85AE:
- D 0 - - - 0x0145BE 05:85AE: 00        .byte $00   ; 00
- D 0 - - - 0x0145BF 05:85AF: 04        .byte $04   ; 01
- D 0 - - - 0x0145C0 05:85B0: 02        .byte $02   ; 02
- D 0 - - - 0x0145C1 05:85B1: 06        .byte $06   ; 03



tbl_85B2:
- D 0 - - - 0x0145C2 05:85B2: F0        .byte $F0   ; 00
- D 0 - - - 0x0145C3 05:85B3: 10        .byte $10   ; 01



tbl_85B4:
- D 0 - - - 0x0145C4 05:85B4: 1A        .byte $1A   ; 00
- D 0 - - - 0x0145C5 05:85B5: 08        .byte $08   ; 01
- D 0 - - - 0x0145C6 05:85B6: 18        .byte $18   ; 02
- D 0 - - - 0x0145C7 05:85B7: 20        .byte $20   ; 03
- D 0 - - - 0x0145C8 05:85B8: 02        .byte $02   ; 04
- D 0 - - - 0x0145C9 05:85B9: 1C        .byte $1C   ; 05
- D 0 - - - 0x0145CA 05:85BA: 05        .byte $05   ; 06
- D 0 - - - 0x0145CB 05:85BB: 0E        .byte $0E   ; 07



sub_85BC:
C - - - - - 0x0145CC 05:85BC: A9 03     LDA #$03
C - - - - - 0x0145CE 05:85BE: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x0145D1 05:85C1: D0 1D     BNE bra_85E0    ; jmp



sub_85C3:
C - - - - - 0x0145D3 05:85C3: FE 02 07  INC ram_0702_obj,X
C - - - - - 0x0145D6 05:85C6: BD 02 07  LDA ram_0702_obj,X
C - - - - - 0x0145D9 05:85C9: C9 08     CMP #$08
C - - - - - 0x0145DB 05:85CB: 90 10     BCC bra_85DD
C - - - - - 0x0145DD 05:85CD: A9 00     LDA #$00
C - - - - - 0x0145DF 05:85CF: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x0145E2 05:85D2: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x0145E5 05:85D5: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x0145E8 05:85D8: 29 03     AND #$03
C - - - - - 0x0145EA 05:85DA: 9D 10 07  STA ram_0710_obj,X
bra_85DD:
C - - - - - 0x0145ED 05:85DD: BC 56 07  LDY ram_0756_obj,X
bra_85E0:
C - - - - - 0x0145F0 05:85E0: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0145F3 05:85E3: 4A        LSR
C - - - - - 0x0145F4 05:85E4: 4A        LSR
C - - - - - 0x0145F5 05:85E5: A9 01     LDA #$01
C - - - - - 0x0145F7 05:85E7: B0 02     BCS bra_85EB
C - - - - - 0x0145F9 05:85E9: A9 03     LDA #$03
bra_85EB:
C - - - - - 0x0145FB 05:85EB: 19 03 86  ORA tbl_8603_spr_attr,Y
C - - - - - 0x0145FE 05:85EE: 84 08     STY ram_0008
C - - - - - 0x014600 05:85F0: 20 19 87  JSR sub_8719
C - - - - - 0x014603 05:85F3: A5 08     LDA ram_0008
C - - - - - 0x014605 05:85F5: 0A        ASL
C - - - - - 0x014606 05:85F6: 0A        ASL
C - - - - - 0x014607 05:85F7: 18        CLC
C - - - - - 0x014608 05:85F8: 7D 10 07  ADC ram_0710_obj,X
C - - - - - 0x01460B 05:85FB: A8        TAY
C - - - - - 0x01460C 05:85FC: B9 0B 86  LDA tbl_860B_animation,Y
C - - - - - 0x01460F 05:85FF: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014612 05:8602: 60        RTS



tbl_8603_spr_attr:
- D 0 - - - 0x014613 05:8603: 40        .byte $40   ; 00 
- D 0 - - - 0x014614 05:8604: 40        .byte $40   ; 01 
- D 0 - - - 0x014615 05:8605: 00        .byte $00   ; 02 
- D 0 - - - 0x014616 05:8606: 00        .byte $00   ; 03 
- D 0 - - - 0x014617 05:8607: 00        .byte $00   ; 04 
- D 0 - - - 0x014618 05:8608: 00        .byte $00   ; 05 
- D 0 - - - 0x014619 05:8609: 00        .byte $00   ; 06 
- D 0 - - - 0x01461A 05:860A: 40        .byte $40   ; 07 



tbl_860B_animation:
;                                              --------------------- 
;                                              |    ---------------- 
;                                              |    |    ----------- 
;                                              |    |    |    ------ 
;                                              |    |    |    |
- D 0 - - - 0x01461B 05:860B: 45        .byte $45, $46, $47, $46   ; 00 
- D 0 - - - 0x01461F 05:860F: 3F        .byte $3F, $40, $41, $40   ; 01 
- D 0 - - - 0x014623 05:8613: 3C        .byte $3C, $3D, $3E, $3D   ; 02 
- D 0 - - - 0x014627 05:8617: 3F        .byte $3F, $40, $41, $40   ; 03 
- D 0 - - - 0x01462B 05:861B: 45        .byte $45, $46, $47, $46   ; 04 
- D 0 - - - 0x01462F 05:861F: 42        .byte $42, $43, $44, $43   ; 05 
- D 0 - - - 0x014633 05:8623: 48        .byte $48, $49, $4A, $49   ; 06 
- D 0 - - - 0x014637 05:8627: 42        .byte $42, $43, $44, $43   ; 07 



sub_862B:
C - - - - - 0x01463B 05:862B: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x01463E 05:862E: 18        CLC
C - - - - - 0x01463F 05:862F: 69 0C     ADC #$0C
C - - - - - 0x014641 05:8631: C9 18     CMP #$18
C - - - - - 0x014643 05:8633: 90 02     BCC bra_8637
C - - - - - 0x014645 05:8635: E9 18     SBC #$18
bra_8637:
C - - - - - 0x014647 05:8637: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01464A 05:863A: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x01464D 05:863D: 18        CLC
C - - - - - 0x01464E 05:863E: 69 04     ADC #$04
C - - - - - 0x014650 05:8640: C9 08     CMP #$08
C - - - - - 0x014652 05:8642: 90 02     BCC bra_8646
C - - - - - 0x014654 05:8644: E9 08     SBC #$08
bra_8646:
C - - - - - 0x014656 05:8646: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014659 05:8649: 4C 0E 84  JMP loc_840E



sub_864C:
C - - - - - 0x01465C 05:864C: 20 7C 86  JSR sub_867C
C - - - - - 0x01465F 05:864F: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x014662 05:8652: 30 0F     BMI bra_8663
C - - - - - 0x014664 05:8654: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x014667 05:8657: 84 0A     STY ram_000A
C - - - - - 0x014669 05:8659: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x01466C 05:865C: 29 FE     AND #$FE
C - - - - - 0x01466E 05:865E: 05 0A     ORA ram_000A
C - - - - - 0x014670 05:8660: 9D 72 07  STA ram_0772_obj,X
bra_8663:
C - - - - - 0x014673 05:8663: 85 0A     STA ram_000A
C - - - - - 0x014675 05:8665: 60        RTS



sub_8666:
C - - - - - 0x014676 05:8666: 20 7C 86  JSR sub_867C
C - - - - - 0x014679 05:8669: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x01467C 05:866C: 30 0D     BMI bra_867B_RTS
C - - - - - 0x01467E 05:866E: 29 01     AND #$01
C - - - - - 0x014680 05:8670: A8        TAY
C - - - - - 0x014681 05:8671: B9 32 05  LDA ram_pos_Y_hi_plr,Y
C - - - - - 0x014684 05:8674: 85 0C     STA ram_000C
C - - - - - 0x014686 05:8676: B9 4C 05  LDA ram_pos_X_hi_plr,Y
C - - - - - 0x014689 05:8679: 85 0B     STA ram_000B
bra_867B_RTS:
C - - - - - 0x01468B 05:867B: 60        RTS



sub_867C:
C - - - - - 0x01468C 05:867C: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x01468E 05:867E: 29 03     AND #$03
C - - - - - 0x014690 05:8680: A8        TAY
C - - - - - 0x014691 05:8681: B9 8B 86  LDA tbl_868B,Y
C - - - - - 0x014694 05:8684: 85 0B     STA ram_000B
C - - - - - 0x014696 05:8686: A9 FF     LDA #$FF
C - - - - - 0x014698 05:8688: 85 0C     STA ram_000C
C - - - - - 0x01469A 05:868A: 60        RTS



tbl_868B:
- D 0 - - - 0x01469B 05:868B: 20        .byte $20   ; 00 
- D 0 - - - 0x01469C 05:868C: 60        .byte $60   ; 01 
- D 0 - - - 0x01469D 05:868D: A0        .byte $A0   ; 02 
- D 0 - - - 0x01469E 05:868E: E0        .byte $E0   ; 03 



ofs_038_63_868F_03:
C - - J - - 0x01469F 05:868F: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x0146A2 05:8692: 10 04     BPL bra_8698
C - - - - - 0x0146A4 05:8694: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x0146A7 05:8697: 98        TYA
bra_8698:
C - - - - - 0x0146A8 05:8698: 85 0A     STA ram_000A
C - - - - - 0x0146AA 05:869A: 48        PHA
C - - - - - 0x0146AB 05:869B: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x0146AE 05:869E: 20 F0 F4  JSR sub_0x01F500
C - - - - - 0x0146B1 05:86A1: A4 0C     LDY ram_000C
C - - - - - 0x0146B3 05:86A3: B9 D4 F4  LDA tbl_0x01F4E4,Y
C - - - - - 0x0146B6 05:86A6: A8        TAY
C - - - - - 0x0146B7 05:86A7: 85 17     STA ram_0017
C - - - - - 0x0146B9 05:86A9: 20 BC 85  JSR sub_85BC
C - - - - - 0x0146BC 05:86AC: 68        PLA
C - - - - - 0x0146BD 05:86AD: 85 0A     STA ram_000A
C - - - - - 0x0146BF 05:86AF: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0146C2 05:86B2: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x0146C5 05:86B5: F0 18     BEQ bra_86CF
C - - - - - 0x0146C7 05:86B7: BD F4 06  LDA ram_06F4_obj,X
C - - - - - 0x0146CA 05:86BA: C9 10     CMP #$10
C - - - - - 0x0146CC 05:86BC: D0 10     BNE bra_86CE_RTS
C - - - - - 0x0146CE 05:86BE: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x0146D1 05:86C1: A0 03     LDY #$03
C - - - - - 0x0146D3 05:86C3: 20 27 F3  JSR sub_0x01F337
C - - - - - 0x0146D6 05:86C6: 20 E7 86  JSR sub_86E7
C - - - - - 0x0146D9 05:86C9: A9 08     LDA #$08
C - - - - - 0x0146DB 05:86CB: 9D F4 06  STA ram_06F4_obj,X
bra_86CE_RTS:
C - - - - - 0x0146DE 05:86CE: 60        RTS
bra_86CF:
C - - - - - 0x0146DF 05:86CF: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x0146E1 05:86D1: 65 1B     ADC ram_счетчик_кадров
C - - - - - 0x0146E3 05:86D3: 85 23     STA ram_рандом_байт_1
C - - - - - 0x0146E5 05:86D5: 29 1F     AND #$1F
C - - - - - 0x0146E7 05:86D7: 69 70     ADC #$70
C - - - - - 0x0146E9 05:86D9: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x0146EC 05:86DC: A9 02     LDA #$02
C - - - - - 0x0146EE 05:86DE: 4C 83 A2  JMP loc_0x006293_set_obj_state


; bzk garbage
- - - - - - 0x0146F1 05:86E1: 4C 3E B1  JMP loc_0x00714E


; bzk garbage
- - - - - - 0x0146F4 05:86E4: 4C 7C B1  JMP loc_0x00718C



sub_86E7:
C - - - - - 0x0146F7 05:86E7: D0 1F     BNE bra_8708_RTS
C - - - - - 0x0146F9 05:86E9: A4 17     LDY ram_0017
loc_86EB:
C D 0 - - - 0x0146FB 05:86EB: A9 06     LDA #$06
C - - - - - 0x0146FD 05:86ED: 9D 80 07  STA ram_0780_obj,X
C - - - - - 0x014700 05:86F0: A6 11     LDX ram_0011
C - - - - - 0x014702 05:86F2: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014705 05:86F5: 18        CLC
C - - - - - 0x014706 05:86F6: 79 09 87  ADC tbl_8709_pos_Y,Y
C - - - - - 0x014709 05:86F9: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x01470C 05:86FC: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01470F 05:86FF: 18        CLC
C - - - - - 0x014710 05:8700: 79 11 87  ADC tbl_8711_pos_X,Y
C - - - - - 0x014713 05:8703: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014716 05:8706: A6 10     LDX ram_0010
bra_8708_RTS:
C - - - - - 0x014718 05:8708: 60        RTS



tbl_8709_pos_Y:
- D 0 - - - 0x014719 05:8709: FC        .byte $FC   ; 00 
- D 0 - - - 0x01471A 05:870A: 03        .byte $03   ; 01 
- D 0 - - - 0x01471B 05:870B: 04        .byte $04   ; 02 
- D 0 - - - 0x01471C 05:870C: 03        .byte $03   ; 03 
- D 0 - - - 0x01471D 05:870D: FC        .byte $FC   ; 04 
- D 0 - - - 0x01471E 05:870E: F3        .byte $F3   ; 05 
- D 0 - - - 0x01471F 05:870F: F0        .byte $F0   ; 06 
- D 0 - - - 0x014720 05:8710: F3        .byte $F3   ; 07 



tbl_8711_pos_X:
- D 0 - - - 0x014721 05:8711: 08        .byte $08   ; 00 
- D 0 - - - 0x014722 05:8712: 08        .byte $08   ; 01 
- D 0 - - - 0x014723 05:8713: FD        .byte $FD   ; 02 
- D 0 - - - 0x014724 05:8714: F8        .byte $F8   ; 03 
- D 0 - - - 0x014725 05:8715: F8        .byte $F8   ; 04 
- D 0 - - - 0x014726 05:8716: F8        .byte $F8   ; 05 
- D 0 - - - 0x014727 05:8717: 03        .byte $03   ; 06 
- D 0 - - - 0x014728 05:8718: 08        .byte $08   ; 07 



sub_8719:
C - - - - - 0x014729 05:8719: BC 80 07  LDY ram_0780_obj,X
C - - - - - 0x01472C 05:871C: F0 05     BEQ bra_8723
C - - - - - 0x01472E 05:871E: DE 80 07  DEC ram_0780_obj,X
C - - - - - 0x014731 05:8721: 09 04     ORA #$04
bra_8723:
C - - - - - 0x014733 05:8723: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x014736 05:8726: 60        RTS



_off001_0x014737_69_boss_2_green_tankman:
- D 0 - I - 0x014737 05:8727: 3B 87     .word ofs_038_69_873B_01_initialize_object ; 
- D 0 - I - 0x014739 05:8729: 48 87     .word ofs_038_69_8748_02 ; 
- D 0 - I - 0x01473B 05:872B: 61 87     .word ofs_038_69_8761_03 ; 
- D 0 - I - 0x01473D 05:872D: AD 87     .word ofs_038_69_87AD_04 ; 
- D 0 - I - 0x01473F 05:872F: 50 88     .word ofs_038_69_8850_05 ; 
- D 0 - I - 0x014741 05:8731: E2 88     .word ofs_038_69_88E2_06 ; 
- D 0 - I - 0x014743 05:8733: E8 88     .word ofs_038_69_88E8_07 ; 
- D 0 - I - 0x014745 05:8735: EE 88     .word ofs_038_69_88EE_08 ; 
- D 0 - I - 0x014747 05:8737: F6 A2     .word ofs_038_42_0x006306_09 ; 
- D 0 - I - 0x014749 05:8739: F4 88     .word ofs_038_69_88F4_0A ; 



ofs_038_69_873B_01_initialize_object:
C - - J - - 0x01474B 05:873B: A9 91     LDA #$91
C - - - - - 0x01474D 05:873D: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x014750 05:8740: A9 20     LDA #$20
C - - - - - 0x014752 05:8742: 20 99 AB  JSR sub_0x006BA9_set_dynamic_hp_to_boss
C - - - - - 0x014755 05:8745: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_69_8748_02:
C - - J - - 0x014758 05:8748: A9 4E     LDA #$4E
C - - - - - 0x01475A 05:874A: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x01475D 05:874D: A5 FC     LDA ram_scroll_Y
C - - - - - 0x01475F 05:874F: D0 1F     BNE bra_8770_RTS
C - - - - - 0x014761 05:8751: A9 00     LDA #$00
C - - - - - 0x014763 05:8753: 85 64     STA ram_0064
C - - - - - 0x014765 05:8755: A9 02     LDA #$02
C - - - - - 0x014767 05:8757: 85 61     STA ram_0061
C - - - - - 0x014769 05:8759: A9 08     LDA #$08
C - - - - - 0x01476B 05:875B: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01476E 05:875E: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_69_8761_03:
C - - J - - 0x014771 05:8761: A5 60     LDA ram_0060
C - - - - - 0x014773 05:8763: 05 70     ORA ram_0070
C - - - - - 0x014775 05:8765: D0 09     BNE bra_8770_RTS
C - - - - - 0x014777 05:8767: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x01477A 05:876A: F0 05     BEQ bra_8771
C - - - - - 0x01477C 05:876C: A9 00     LDA #$00
C - - - - - 0x01477E 05:876E: 85 6B     STA ram_006B
bra_8770_RTS:
C - - - - - 0x014780 05:8770: 60        RTS
bra_8771:
C - - - - - 0x014781 05:8771: A9 01     LDA #con_mirroring_H
C - - - - - 0x014783 05:8773: 85 26     STA ram_for_A000
C - - - - - 0x014785 05:8775: A9 80     LDA #$80
C - - - - - 0x014787 05:8777: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x01478A 05:877A: A9 88     LDA #$88
C - - - - - 0x01478C 05:877C: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x01478F 05:877F: A9 FF     LDA #$FF
C - - - - - 0x014791 05:8781: 9D 8E 07  STA ram_078E_obj,X
C - - - - - 0x014794 05:8784: A9 0C     LDA #con_irq_area_2_boss
C - - - - - 0x014796 05:8786: 85 27     STA ram_irq_handler_hi
C - - - - - 0x014798 05:8788: 20 2F 89  JSR sub_892F
C - - - - - 0x01479B 05:878B: 20 CE A9  JSR sub_0x0069DE
C - - - - - 0x01479E 05:878E: A9 00     LDA #$00
C - - - - - 0x0147A0 05:8790: 9D 8E 07  STA ram_078E_obj,X
C - - - - - 0x0147A3 05:8793: A9 62     LDA #$62
C - - - - - 0x0147A5 05:8795: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0147A8 05:8798: A9 10     LDA #$10
C - - - - - 0x0147AA 05:879A: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0147AD 05:879D: 20 2C 89  JSR sub_892C
C - - - - - 0x0147B0 05:87A0: A9 31     LDA #con_sound_31
C - - - - - 0x0147B2 05:87A2: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x0147B5 05:87A5: A9 05     LDA #$05
C - - - - - 0x0147B7 05:87A7: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0147BA 05:87AA: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_69_87AD_04:
C - - J - - 0x0147BD 05:87AD: A0 03     LDY #$03
C - - - - - 0x0147BF 05:87AF: A9 55     LDA #$55
bra_87B1_loop:
; 07D6-07D9
C - - - - - 0x0147C1 05:87B1: 99 D6 07  STA ram_07D0 + $06,Y
C - - - - - 0x0147C4 05:87B4: 88        DEY
C - - - - - 0x0147C5 05:87B5: 10 FA     BPL bra_87B1_loop
C - - - - - 0x0147C7 05:87B7: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0147CA 05:87BA: 0A        ASL
C - - - - - 0x0147CB 05:87BB: 0A        ASL
C - - - - - 0x0147CC 05:87BC: A8        TAY
C - - - - - 0x0147CD 05:87BD: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x0147CF 05:87BF: A9 03     LDA #con_buf_mode_03
C - - - - - 0x0147D1 05:87C1: 9D 00 03  STA ram_nmt_buffer,X
; ppu hi
C - - - - - 0x0147D4 05:87C4: E8        INX
C - - - - - 0x0147D5 05:87C5: B9 39 88  LDA tbl_8838 + $01,Y
C - - - - - 0x0147D8 05:87C8: 9D 00 03  STA ram_nmt_buffer,X
; ppu lo
C - - - - - 0x0147DB 05:87CB: E8        INX
C - - - - - 0x0147DC 05:87CC: B9 38 88  LDA tbl_8838,Y
C - - - - - 0x0147DF 05:87CF: 9D 00 03  STA ram_nmt_buffer,X
; counter
C - - - - - 0x0147E2 05:87D2: E8        INX
C - - - - - 0x0147E3 05:87D3: B9 3A 88  LDA tbl_8838 + $02,Y
C - - - - - 0x0147E6 05:87D6: 9D 00 03  STA ram_nmt_buffer,X
; fill tile
C - - - - - 0x0147E9 05:87D9: E8        INX
C - - - - - 0x0147EA 05:87DA: B9 3B 88  LDA tbl_8838 + $03,Y
C - - - - - 0x0147ED 05:87DD: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0147F0 05:87E0: E8        INX
C - - - - - 0x0147F1 05:87E1: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x0147F3 05:87E3: A6 10     LDX ram_0010
C - - - - - 0x0147F5 05:87E5: 20 29 89  JSR sub_8929
C - - - - - 0x0147F8 05:87E8: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x0147FB 05:87EB: 10 46     BPL bra_8833_RTS
C - - - - - 0x0147FD 05:87ED: A9 00     LDA #$00
C - - - - - 0x0147FF 05:87EF: A0 2F     LDY #$2F
bra_87F1_loop:
C - - - - - 0x014801 05:87F1: 99 18 04  STA ram_0418,Y
C - - - - - 0x014804 05:87F4: 99 98 04  STA ram_0498,Y
C - - - - - 0x014807 05:87F7: 88        DEY
C - - - - - 0x014808 05:87F8: 10 F7     BPL bra_87F1_loop
C - - - - - 0x01480A 05:87FA: A9 87     LDA #$87
C - - - - - 0x01480C 05:87FC: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x01480F 05:87FF: A9 06     LDA #$06
C - - - - - 0x014811 05:8801: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x014814 05:8804: A9 03     LDA #$03
C - - - - - 0x014816 05:8806: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014819 05:8809: A9 00     LDA #$00
C - - - - - 0x01481B 05:880B: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x01481E 05:880E: A9 F0     LDA #$F0
C - - - - - 0x014820 05:8810: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x014823 05:8813: A0 03     LDY #$03
bra_8815_loop:
C - - - - - 0x014825 05:8815: 84 08     STY ram_0008
C - - - - - 0x014827 05:8817: B9 34 88  LDA tbl_8834,Y
C - - - - - 0x01482A 05:881A: A8        TAY
C - - - - - 0x01482B 05:881B: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x01482E 05:881E: 90 10     BCC bra_8830
C - - - - - 0x014830 05:8820: A4 11     LDY ram_0011
C - - - - - 0x014832 05:8822: A5 08     LDA ram_0008
C - - - - - 0x014834 05:8824: 99 1E 07  STA ram_obj_flags,Y
C - - - - - 0x014837 05:8827: 8A        TXA
C - - - - - 0x014838 05:8828: 99 64 07  STA ram_0764_obj,Y
C - - - - - 0x01483B 05:882B: A4 08     LDY ram_0008
C - - - - - 0x01483D 05:882D: 88        DEY
C - - - - - 0x01483E 05:882E: 10 E5     BPL bra_8815_loop
bra_8830:
C - - - - - 0x014840 05:8830: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8833_RTS:
C - - - - - 0x014843 05:8833: 60        RTS



tbl_8834:
- D 0 - - - 0x014844 05:8834: 6A        .byte con_obj_id_6A   ; 00 
- D 0 - - - 0x014845 05:8835: 6A        .byte con_obj_id_6A   ; 01 
- D 0 - - - 0x014846 05:8836: 36        .byte con_obj_id_36   ; 02 
- D 0 - - - 0x014847 05:8837: 36        .byte con_obj_id_36   ; 03 



tbl_8838:
; 00 
- D 0 - - - 0x014848 05:8838: A8 20     .word $20A8 ; ppu address
- D 0 - - - 0x01484A 05:883A: 58        .byte $58, $08   ; counter + fill tile
; 01 
- D 0 - - - 0x01484C 05:883C: 08 21     .word $2108 ; ppu address
- D 0 - - - 0x01484E 05:883E: 58        .byte $58, $08   ; counter + fill tile
; 02 
- D 0 - - - 0x014850 05:8840: 68 21     .word $2168 ; ppu address
- D 0 - - - 0x014852 05:8842: 58        .byte $58, $08   ; counter + fill tile
; 03 
- D 0 - - - 0x014854 05:8844: C8 21     .word $21C8 ; ppu address
- D 0 - - - 0x014856 05:8846: 58        .byte $58, $08   ; counter + fill tile
; 04 
- D 0 - - - 0x014858 05:8848: 28 22     .word $2228 ; ppu address
- D 0 - - - 0x01485A 05:884A: 58        .byte $58, $08   ; counter + fill tile
; 05 
- D 0 - - - 0x01485C 05:884C: CA 23     .word $23CA ; ppu address
- D 0 - - - 0x01485E 05:884E: 1E        .byte $1E, $55   ; counter + fill tile



ofs_038_69_8850_05:
C - - J - - 0x014860 05:8850: DE 02 07  DEC ram_0702_obj,X
C - - - - - 0x014863 05:8853: F0 26     BEQ bra_887B
C - - - - - 0x014865 05:8855: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x014868 05:8858: 4A        LSR
C - - - - - 0x014869 05:8859: 90 32     BCC bra_888D
C - - - - - 0x01486B 05:885B: 4A        LSR
C - - - - - 0x01486C 05:885C: B0 12     BCS bra_8870
C - - - - - 0x01486E 05:885E: BD 02 07  LDA ram_0702_obj,X
C - - - - - 0x014871 05:8861: 4A        LSR
C - - - - - 0x014872 05:8862: 90 29     BCC bra_888D
C - - - - - 0x014874 05:8864: FE 80 07  INC ram_0780_obj,X
C - - - - - 0x014877 05:8867: BD 80 07  LDA ram_0780_obj,X
C - - - - - 0x01487A 05:886A: C9 10     CMP #$10
C - - - - - 0x01487C 05:886C: 90 1F     BCC bra_888D
C - - - - - 0x01487E 05:886E: B0 0B     BCS bra_887B    ; jmp
bra_8870:
C - - - - - 0x014880 05:8870: BD 02 07  LDA ram_0702_obj,X
C - - - - - 0x014883 05:8873: 4A        LSR
C - - - - - 0x014884 05:8874: 90 17     BCC bra_888D
C - - - - - 0x014886 05:8876: DE 80 07  DEC ram_0780_obj,X
C - - - - - 0x014889 05:8879: D0 12     BNE bra_888D
bra_887B:
C - - - - - 0x01488B 05:887B: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x01488E 05:887E: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x014891 05:8881: 29 03     AND #$03
C - - - - - 0x014893 05:8883: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x014896 05:8886: A8        TAY
C - - - - - 0x014897 05:8887: B9 DE 88  LDA tbl_88DE,Y
C - - - - - 0x01489A 05:888A: 9D 02 07  STA ram_0702_obj,X
bra_888D:
C - - - - - 0x01489D 05:888D: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x0148A0 05:8890: 98        TYA
C - - - - - 0x0148A1 05:8891: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0148A4 05:8894: 20 95 F4  JSR sub_0x01F4A5
C - - - - - 0x0148A7 05:8897: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x0148AA 05:889A: B9 CE 88  LDA tbl_88CE_animation,Y
C - - - - - 0x0148AD 05:889D: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x0148B0 05:88A0: B9 D6 88  LDA tbl_88D6_spr_attr,Y
C - - - - - 0x0148B3 05:88A3: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0148B6 05:88A6: 20 8A 89  JSR sub_898A
C - - - - - 0x0148B9 05:88A9: 20 29 89  JSR sub_8929
C - - - - - 0x0148BC 05:88AC: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x0148BF 05:88AF: D0 1C     BNE bra_88CD_RTS
C - - - - - 0x0148C1 05:88B1: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0148C4 05:88B4: C9 06     CMP #$06
C - - - - - 0x0148C6 05:88B6: F0 10     BEQ bra_88C8
C - - - - - 0x0148C8 05:88B8: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x0148CB 05:88BB: 85 0A     STA ram_000A
C - - - - - 0x0148CD 05:88BD: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x0148D0 05:88C0: A0 03     LDY #$03
C - - - - - 0x0148D2 05:88C2: 20 27 F3  JSR sub_0x01F337
C - - - - - 0x0148D5 05:88C5: 20 FB 88  JSR sub_88FB
bra_88C8:
C - - - - - 0x0148D8 05:88C8: A9 43     LDA #$43
C - - - - - 0x0148DA 05:88CA: 9D F4 06  STA ram_06F4_obj,X
bra_88CD_RTS:
C - - - - - 0x0148DD 05:88CD: 60        RTS



tbl_88CE_animation:
- D 0 - - - 0x0148DE 05:88CE: 50        .byte $50   ; 00 
- D 0 - - - 0x0148DF 05:88CF: 4F        .byte $4F   ; 01 
- D 0 - - - 0x0148E0 05:88D0: 4E        .byte $4E   ; 02 
- D 0 - - - 0x0148E1 05:88D1: 4F        .byte $4F   ; 03 
- D 0 - - - 0x0148E2 05:88D2: 50        .byte $50   ; 04 
- D 0 - - - 0x0148E3 05:88D3: 50        .byte $50   ; 05 
- D 0 - - - 0x0148E4 05:88D4: 50        .byte $50   ; 06 
- D 0 - - - 0x0148E5 05:88D5: 50        .byte $50   ; 07 



tbl_88D6_spr_attr:
- D 0 - - - 0x0148E6 05:88D6: 43        .byte $43   ; 00 
- D 0 - - - 0x0148E7 05:88D7: 43        .byte $43   ; 01 
- D 0 - - - 0x0148E8 05:88D8: 03        .byte $03   ; 02 
- D 0 - - - 0x0148E9 05:88D9: 03        .byte $03   ; 03 
- D 0 - - - 0x0148EA 05:88DA: 03        .byte $03   ; 04 
- D 0 - - - 0x0148EB 05:88DB: 03        .byte $03   ; 05 
- D 0 - - - 0x0148EC 05:88DC: 03        .byte $03   ; 06 
- D 0 - - - 0x0148ED 05:88DD: 43        .byte $43   ; 07 



tbl_88DE:
- D 0 - - - 0x0148EE 05:88DE: 80        .byte $80   ; 00 
- D 0 - - - 0x0148EF 05:88DF: 00        .byte $00   ; 01 
- D 0 - - - 0x0148F0 05:88E0: 80        .byte $80   ; 02 
- D 0 - - - 0x0148F1 05:88E1: 00        .byte $00   ; 03 



ofs_038_69_88E2_06:
C - - J - - 0x0148F2 05:88E2: 20 2C 89  JSR sub_892C
C - - - - - 0x0148F5 05:88E5: 4C B8 A3  JMP loc_0x0063C8



ofs_038_69_88E8_07:
C - - J - - 0x0148F8 05:88E8: 20 2C 89  JSR sub_892C
C - - - - - 0x0148FB 05:88EB: 4C D8 A3  JMP loc_0x0063E8



ofs_038_69_88EE_08:
C - - J - - 0x0148FE 05:88EE: 20 8C FC  JSR sub_0x01FC9C_increase_002B
C - - - - - 0x014901 05:88F1: 4C A2 A2  JMP loc_0x0062B2



ofs_038_69_88F4_0A:
C - - J - - 0x014904 05:88F4: A9 00     LDA #con_mirroring_V
C - - - - - 0x014906 05:88F6: 85 26     STA ram_for_A000
C - - - - - 0x014908 05:88F8: 4C 37 A3  JMP loc_0x006347_delete_object_08



sub_88FB:
C - - - - - 0x01490B 05:88FB: D0 1B     BNE bra_8918_RTS
C - - - - - 0x01490D 05:88FD: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x014910 05:8900: A6 11     LDX ram_0011
C - - - - - 0x014912 05:8902: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014915 05:8905: 18        CLC
C - - - - - 0x014916 05:8906: 79 19 89  ADC tbl_8919_pos_Y,Y
C - - - - - 0x014919 05:8909: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x01491C 05:890C: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01491F 05:890F: 18        CLC
C - - - - - 0x014920 05:8910: 79 21 89  ADC tbl_8921_pos_X,Y
C - - - - - 0x014923 05:8913: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014926 05:8916: A6 10     LDX ram_0010
bra_8918_RTS:
C - - - - - 0x014928 05:8918: 60        RTS



tbl_8919_pos_Y:
- D 0 - - - 0x014929 05:8919: EC        .byte $EC   ; 00 
- D 0 - - - 0x01492A 05:891A: F6        .byte $F6   ; 01 
- D 0 - - - 0x01492B 05:891B: F8        .byte $F8   ; 02 
- D 0 - - - 0x01492C 05:891C: F6        .byte $F6   ; 03 
- D 0 - - - 0x01492D 05:891D: EC        .byte $EC   ; 04 
- D 0 - - - 0x01492E 05:891E: EC        .byte $EC   ; 05 
- - - - - - 0x01492F 05:891F: EC        .byte $EC   ; 06 
- D 0 - - - 0x014930 05:8920: EC        .byte $EC   ; 07 



tbl_8921_pos_X:
- D 0 - - - 0x014931 05:8921: 0E        .byte $0E   ; 00 
- D 0 - - - 0x014932 05:8922: 0C        .byte $0C   ; 01 
- D 0 - - - 0x014933 05:8923: 00        .byte $00   ; 02 
- D 0 - - - 0x014934 05:8924: F4        .byte $F4   ; 03 
- D 0 - - - 0x014935 05:8925: F2        .byte $F2   ; 04 
- D 0 - - - 0x014936 05:8926: F2        .byte $F2   ; 05 
- - - - - - 0x014937 05:8927: 00        .byte $00   ; 06 
- D 0 - - - 0x014938 05:8928: 0E        .byte $0E   ; 07 



sub_8929:
C - - - - - 0x014939 05:8929: 20 5D A7  JSR sub_0x00676D
sub_892C:
C - - - - - 0x01493C 05:892C: 20 4F AA  JSR sub_0x006A5F
sub_892F:
C - - - - - 0x01493F 05:892F: A5 F9     LDA ram_00F9
C - - - - - 0x014941 05:8931: 29 07     AND #$07
C - - - - - 0x014943 05:8933: 85 46     STA ram_0046
C - - - - - 0x014945 05:8935: A9 27     LDA #$27
C - - - - - 0x014947 05:8937: 38        SEC
C - - - - - 0x014948 05:8938: E5 46     SBC ram_0046
C - - - - - 0x01494A 05:893A: 85 45     STA ram_0045
C - - - - - 0x01494C 05:893C: E6 46     INC ram_0046
C - - - - - 0x01494E 05:893E: A9 97     LDA #$97
C - - - - - 0x014950 05:8940: 85 47     STA ram_0047
C - - - - - 0x014952 05:8942: A0 08     LDY #$08
C - - - - - 0x014954 05:8944: A5 FB     LDA ram_00FB
C - - - - - 0x014956 05:8946: 29 02     AND #$02
C - - - - - 0x014958 05:8948: F0 02     BEQ bra_894C
C - - - - - 0x01495A 05:894A: A0 0B     LDY #$0B
bra_894C:
C - - - - - 0x01495C 05:894C: 84 4B     STY ram_004B
C - - - - - 0x01495E 05:894E: A5 F9     LDA ram_00F9
C - - - - - 0x014960 05:8950: 29 F8     AND #$F8
C - - - - - 0x014962 05:8952: 0A        ASL
C - - - - - 0x014963 05:8953: 26 4B     ROL ram_004B
C - - - - - 0x014965 05:8955: 0A        ASL
C - - - - - 0x014966 05:8956: 26 4B     ROL ram_004B
C - - - - - 0x014968 05:8958: 85 4A     STA ram_004A
C - - - - - 0x01496A 05:895A: 60        RTS



sub_895B:
loc_895B:
C D 0 - - - 0x01496B 05:895B: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x01496E 05:895E: 0A        ASL
C - - - - - 0x01496F 05:895F: 0A        ASL
C - - - - - 0x014970 05:8960: A8        TAY
C - - - - - 0x014971 05:8961: B9 7A 89  LDA tbl_897A_speed,Y
C - - - - - 0x014974 05:8964: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x014977 05:8967: B9 7B 89  LDA tbl_897A_speed + $01,Y
C - - - - - 0x01497A 05:896A: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x01497D 05:896D: B9 7C 89  LDA tbl_897A_speed + $02,Y
C - - - - - 0x014980 05:8970: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x014983 05:8973: B9 7D 89  LDA tbl_897A_speed + $03,Y
C - - - - - 0x014986 05:8976: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x014989 05:8979: 60        RTS



tbl_897A_speed:
; 00 
- D 0 - - - 0x01498A 05:897A: 00 00     .word $0000 ; Y
- D 0 - - - 0x01498C 05:897C: 00 00     .word $0000 ; X
; 01 
- D 0 - - - 0x01498E 05:897E: 00 00     .word $0000 ; Y
- D 0 - - - 0x014990 05:8980: 60 00     .word $0060 ; X
; 02 
- D 0 - - - 0x014992 05:8982: 40 00     .word $0040 ; Y
- D 0 - - - 0x014994 05:8984: 00 00     .word $0000 ; X
; 03 
- D 0 - - - 0x014996 05:8986: C0 FF     .word $FFC0 ; Y
- D 0 - - - 0x014998 05:8988: 00 00     .word $0000 ; X



sub_898A:
C - - - - - 0x01499A 05:898A: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x01499D 05:898D: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x0149A0 05:8990: 98 89     .word ofs_030_8998_00
- D 0 - I - 0x0149A2 05:8992: A6 89     .word ofs_030_89A6_01
- D 0 - I - 0x0149A4 05:8994: C5 89     .word ofs_030_89C5_02
- D 0 - I - 0x0149A6 05:8996: EF 89     .word ofs_030_89EF_03



ofs_030_8998_00:
C - - J - - 0x0149A8 05:8998: FE 72 07  INC ram_0772_obj,X
C - - - - - 0x0149AB 05:899B: 20 5B 89  JSR sub_895B
C - - - - - 0x0149AE 05:899E: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0149B1 05:89A1: 10 53     BPL bra_89F6_RTS
C - - - - - 0x0149B3 05:89A3: 4C DC A7  JMP loc_0x0067EC_inverse_spd_X



ofs_030_89A6_01:
C - - J - - 0x0149B6 05:89A6: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x0149B9 05:89A9: 2A        ROL
C - - - - - 0x0149BA 05:89AA: 2A        ROL
C - - - - - 0x0149BB 05:89AB: 29 01     AND #$01
C - - - - - 0x0149BD 05:89AD: A8        TAY
C - - - - - 0x0149BE 05:89AE: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0149C1 05:89B1: D9 F7 89  CMP tbl_89F7_pos_X,Y
C - - - - - 0x0149C4 05:89B4: 6A        ROR
C - - - - - 0x0149C5 05:89B5: 5D CA 06  EOR ram_spd_X_hi_obj,X
C - - - - - 0x0149C8 05:89B8: 10 3C     BPL bra_89F6_RTS
C - - - - - 0x0149CA 05:89BA: A9 20     LDA #$20
C - - - - - 0x0149CC 05:89BC: 9D E6 06  STA ram_06E6_obj,X
bra_89BF:
C - - - - - 0x0149CF 05:89BF: FE 72 07  INC ram_0772_obj,X
C - - - - - 0x0149D2 05:89C2: 4C 5B 89  JMP loc_895B



ofs_030_89C5_02:
C - - J - - 0x0149D5 05:89C5: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0149D8 05:89C8: C9 88     CMP #$88
C - - - - - 0x0149DA 05:89CA: B0 F3     BCS bra_89BF
C - - - - - 0x0149DC 05:89CC: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0149DF 05:89CF: D0 25     BNE bra_89F6_RTS
C - - - - - 0x0149E1 05:89D1: 69 20     ADC #$20
C - - - - - 0x0149E3 05:89D3: 85 08     STA ram_0008
C - - - - - 0x0149E5 05:89D5: A4 CA     LDY ram_plr_game_over
C - - - - - 0x0149E7 05:89D7: D0 05     BNE bra_89DE
C - - - - - 0x0149E9 05:89D9: CD 32 05  CMP ram_pos_Y_hi_plr
C - - - - - 0x0149EC 05:89DC: 90 09     BCC bra_89E7
bra_89DE:
C - - - - - 0x0149EE 05:89DE: A4 CB     LDY ram_plr_game_over + $01
C - - - - - 0x0149F0 05:89E0: D0 DD     BNE bra_89BF
C - - - - - 0x0149F2 05:89E2: CD 33 05  CMP ram_pos_Y_hi_plr + $01
C - - - - - 0x0149F5 05:89E5: B0 D8     BCS bra_89BF
bra_89E7:
C - - - - - 0x0149F7 05:89E7: A9 00     LDA #$00
C - - - - - 0x0149F9 05:89E9: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x0149FC 05:89EC: 4C 5B 89  JMP loc_895B



ofs_030_89EF_03:
C - - J - - 0x0149FF 05:89EF: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014A02 05:89F2: C9 60     CMP #$60
C - - - - - 0x014A04 05:89F4: 90 F1     BCC bra_89E7
bra_89F6_RTS:
C - - - - - 0x014A06 05:89F6: 60        RTS



tbl_89F7_pos_X:
- D 0 - - - 0x014A07 05:89F7: C0        .byte $C0   ; 00 
- D 0 - - - 0x014A08 05:89F8: 40        .byte $40   ; 01 



_off001_0x014A09_6A_boss_2_red_tankman:
- D 0 - I - 0x014A09 05:89F9: 07 8A     .word ofs_038_6A_8A07_01_initialize_object ; 
- D 0 - I - 0x014A0B 05:89FB: 26 8A     .word ofs_038_6A_8A26_02 ; 
- D 0 - I - 0x014A0D 05:89FD: 74 8A     .word ofs_038_6A_8A74_03 ; 
- D 0 - I - 0x014A0F 05:89FF: 7A 8A     .word ofs_038_6A_8A7A_04 ; 
- D 0 - I - 0x014A11 05:8A01: 80 8A     .word ofs_038_6A_8A80_05 ; 
- D 0 - I - 0x014A13 05:8A03: 89 8A     .word ofs_038_6A_8A89_06 ; 
- D 0 - I - 0x014A15 05:8A05: 8F 8A     .word ofs_038_6A_8A8F_07 ; 



ofs_038_6A_8A07_01_initialize_object:
C - - J - - 0x014A17 05:8A07: A9 10     LDA #$10
C - - - - - 0x014A19 05:8A09: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x014A1C 05:8A0C: A9 06     LDA #$06
C - - - - - 0x014A1E 05:8A0E: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x014A21 05:8A11: A9 03     LDA #$03
C - - - - - 0x014A23 05:8A13: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014A26 05:8A16: BC 1E 07  LDY ram_obj_flags,X
C - - - - - 0x014A29 05:8A19: B9 24 8A  LDA tbl_8A24,Y
C - - - - - 0x014A2C 05:8A1C: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x014A2F 05:8A1F: A9 01     LDA #$01
C - - - - - 0x014A31 05:8A21: 4C E0 A2  JMP loc_0x0062F0



tbl_8A24:
- D 0 - - - 0x014A34 05:8A24: 27        .byte $27   ; 00 
- D 0 - - - 0x014A35 05:8A25: 35        .byte $35   ; 01 



ofs_038_6A_8A26_02:
C - - J - - 0x014A36 05:8A26: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x014A39 05:8A29: 98        TYA
C - - - - - 0x014A3A 05:8A2A: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x014A3D 05:8A2D: 20 95 F4  JSR sub_0x01F4A5
C - - - - - 0x014A40 05:8A30: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x014A43 05:8A33: B9 64 8A  LDA tbl_8A64_animation,Y
C - - - - - 0x014A46 05:8A36: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014A49 05:8A39: B9 6C 8A  LDA tbl_8A6C_spr_attr,Y
C - - - - - 0x014A4C 05:8A3C: 20 19 87  JSR sub_8719
C - - - - - 0x014A4F 05:8A3F: 20 95 8A  JSR sub_8A95
C - - - - - 0x014A52 05:8A42: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x014A55 05:8A45: D0 1C     BNE bra_8A63_RTS
C - - - - - 0x014A57 05:8A47: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x014A5A 05:8A4A: C9 06     CMP #$06
C - - - - - 0x014A5C 05:8A4C: F0 10     BEQ bra_8A5E
C - - - - - 0x014A5E 05:8A4E: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x014A61 05:8A51: 85 0A     STA ram_000A
C - - - - - 0x014A63 05:8A53: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x014A66 05:8A56: A0 03     LDY #$03
C - - - - - 0x014A68 05:8A58: 20 27 F3  JSR sub_0x01F337
C - - - - - 0x014A6B 05:8A5B: 20 B2 8A  JSR sub_8AB2
bra_8A5E:
C - - - - - 0x014A6E 05:8A5E: A9 55     LDA #$55
C - - - - - 0x014A70 05:8A60: 9D F4 06  STA ram_06F4_obj,X
bra_8A63_RTS:
C - - - - - 0x014A73 05:8A63: 60        RTS



tbl_8A64_animation:
- D 0 - - - 0x014A74 05:8A64: 4D        .byte $4D   ; 00 
- D 0 - - - 0x014A75 05:8A65: 4C        .byte $4C   ; 01 
- D 0 - - - 0x014A76 05:8A66: 4B        .byte $4B   ; 02 
- D 0 - - - 0x014A77 05:8A67: 4C        .byte $4C   ; 03 
- D 0 - - - 0x014A78 05:8A68: 4D        .byte $4D   ; 04 
- D 0 - - - 0x014A79 05:8A69: 4D        .byte $4D   ; 05 
- D 0 - - - 0x014A7A 05:8A6A: 4D        .byte $4D   ; 06 
- D 0 - - - 0x014A7B 05:8A6B: 4D        .byte $4D   ; 07 



tbl_8A6C_spr_attr:
- D 0 - - - 0x014A7C 05:8A6C: 41        .byte $41   ; 00 
- D 0 - - - 0x014A7D 05:8A6D: 41        .byte $41   ; 01 
- D 0 - - - 0x014A7E 05:8A6E: 01        .byte $01   ; 02 
- D 0 - - - 0x014A7F 05:8A6F: 01        .byte $01   ; 03 
- D 0 - - - 0x014A80 05:8A70: 01        .byte $01   ; 04 
- D 0 - - - 0x014A81 05:8A71: 01        .byte $01   ; 05 
- D 0 - - - 0x014A82 05:8A72: 01        .byte $01   ; 06 
- D 0 - - - 0x014A83 05:8A73: 41        .byte $41   ; 07 



ofs_038_6A_8A74_03:
C - - J - - 0x014A84 05:8A74: 20 95 8A  JSR sub_8A95
C - - - - - 0x014A87 05:8A77: 4C 54 A3  JMP loc_0x006364_delete_object_06



ofs_038_6A_8A7A_04:
C - - J - - 0x014A8A 05:8A7A: 20 95 8A  JSR sub_8A95
C - - - - - 0x014A8D 05:8A7D: 4C 6B A3  JMP loc_0x00637B



ofs_038_6A_8A80_05:
C - - J - - 0x014A90 05:8A80: 20 95 8A  JSR sub_8A95
C - - - - - 0x014A93 05:8A83: 20 E5 8A  JSR sub_8AE5
C - - - - - 0x014A96 05:8A86: 4C 9A A2  JMP loc_0x0062AA



ofs_038_6A_8A89_06:
C - - J - - 0x014A99 05:8A89: 20 95 8A  JSR sub_8A95
C - - - - - 0x014A9C 05:8A8C: 4C FD A2  JMP loc_0x00630D



ofs_038_6A_8A8F_07:
C - - J - - 0x014A9F 05:8A8F: 20 95 8A  JSR sub_8A95
C - - - - - 0x014AA2 05:8A92: 4C 3D A3  JMP loc_0x00634D_delete_object_04



sub_8A95:
C - - - - - 0x014AA5 05:8A95: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x014AA8 05:8A98: B9 22 05  LDA ram_pos_Y_hi_enemy,Y
C - - - - - 0x014AAB 05:8A9B: 18        CLC
C - - - - - 0x014AAC 05:8A9C: 69 01     ADC #$01
C - - - - - 0x014AAE 05:8A9E: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x014AB1 05:8AA1: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x014AB4 05:8AA4: 4A        LSR
C - - - - - 0x014AB5 05:8AA5: A9 1C     LDA #$1C
C - - - - - 0x014AB7 05:8AA7: 90 02     BCC bra_8AAB
C - - - - - 0x014AB9 05:8AA9: A9 E3     LDA #$E3
bra_8AAB:
C - - - - - 0x014ABB 05:8AAB: 79 3C 05  ADC ram_pos_X_hi_enemy,Y
C - - - - - 0x014ABE 05:8AAE: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014AC1 05:8AB1: 60        RTS



sub_8AB2:
C - - - - - 0x014AC2 05:8AB2: D0 20     BNE bra_8AD4_RTS
C - - - - - 0x014AC4 05:8AB4: A9 06     LDA #$06
C - - - - - 0x014AC6 05:8AB6: 9D 80 07  STA ram_0780_obj,X
C - - - - - 0x014AC9 05:8AB9: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x014ACC 05:8ABC: A6 11     LDX ram_0011
C - - - - - 0x014ACE 05:8ABE: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014AD1 05:8AC1: 18        CLC
C - - - - - 0x014AD2 05:8AC2: 79 D5 8A  ADC tbl_8AD5_pos_Y,Y
C - - - - - 0x014AD5 05:8AC5: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x014AD8 05:8AC8: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014ADB 05:8ACB: 18        CLC
C - - - - - 0x014ADC 05:8ACC: 79 DD 8A  ADC tbl_8ADD_pos_X,Y
C - - - - - 0x014ADF 05:8ACF: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014AE2 05:8AD2: A6 10     LDX ram_0010
bra_8AD4_RTS:
C - - - - - 0x014AE4 05:8AD4: 60        RTS



tbl_8AD5_pos_Y:
- D 0 - - - 0x014AE5 05:8AD5: 08        .byte $08   ; 00 
- D 0 - - - 0x014AE6 05:8AD6: 12        .byte $12   ; 01 
- D 0 - - - 0x014AE7 05:8AD7: 14        .byte $14   ; 02 
- D 0 - - - 0x014AE8 05:8AD8: 12        .byte $12   ; 03 
- D 0 - - - 0x014AE9 05:8AD9: 08        .byte $08   ; 04 
- D 0 - - - 0x014AEA 05:8ADA: 08        .byte $08   ; 05 
- - - - - - 0x014AEB 05:8ADB: 08        .byte $08   ; 06 
- D 0 - - - 0x014AEC 05:8ADC: 08        .byte $08   ; 07 



tbl_8ADD_pos_X:
- D 0 - - - 0x014AED 05:8ADD: 0E        .byte $0E   ; 00 
- D 0 - - - 0x014AEE 05:8ADE: 0C        .byte $0C   ; 01 
- D 0 - - - 0x014AEF 05:8ADF: 00        .byte $00   ; 02 
- D 0 - - - 0x014AF0 05:8AE0: F4        .byte $F4   ; 03 
- D 0 - - - 0x014AF1 05:8AE1: F2        .byte $F2   ; 04 
- D 0 - - - 0x014AF2 05:8AE2: F2        .byte $F2   ; 05 
- - - - - - 0x014AF3 05:8AE3: 00        .byte $00   ; 06 
- D 0 - - - 0x014AF4 05:8AE4: 0E        .byte $0E   ; 07 



sub_8AE5:
C - - - - - 0x014AF5 05:8AE5: A0 00     LDY #$00
C - - - - - 0x014AF7 05:8AE7: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x014AFA 05:8AEA: F0 02     BEQ bra_8AEE
C - - - - - 0x014AFC 05:8AEC: A0 1E     LDY # off_8B1F - tbl_8B01
bra_8AEE:
C - - - - - 0x014AFE 05:8AEE: A6 1E     LDX ram_index_ppu_buffer
bra_8AF0_loop:
C - - - - - 0x014B00 05:8AF0: B9 01 8B  LDA tbl_8B01,Y
C - - - - - 0x014B03 05:8AF3: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x014B06 05:8AF6: E8        INX
C - - - - - 0x014B07 05:8AF7: C8        INY
C - - - - - 0x014B08 05:8AF8: C9 FF     CMP #$FF
C - - - - - 0x014B0A 05:8AFA: D0 F4     BNE bra_8AF0_loop
C - - - - - 0x014B0C 05:8AFC: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x014B0E 05:8AFE: A6 10     LDX ram_0010
C - - - - - 0x014B10 05:8B00: 60        RTS



tbl_8B01:
; 00
- D 0 - - - 0x014B11 05:8B01: 06        .byte con_buf_mode_06   ; 

- D 0 - - - 0x014B12 05:8B02: 2D 52     .dbyt $2D52 ; ppu address
- D 0 - - - 0x014B14 05:8B04: 04        .byte $04   ; counter
- D 0 - - - 0x014B15 05:8B05: E5        .byte $E5, $E6, $E7, $B3   ; tiles

- D 0 - - - 0x014B19 05:8B09: 2D 72     .dbyt $2D72 ; ppu address
- D 0 - - - 0x014B1B 05:8B0B: 04        .byte $04   ; counter
- D 0 - - - 0x014B1C 05:8B0C: E8        .byte $E8, $E9, $E8, $BA   ; tiles

- D 0 - - - 0x014B20 05:8B10: 2D 92     .dbyt $2D92 ; ppu address
- D 0 - - - 0x014B22 05:8B12: 04        .byte $04   ; counter
- D 0 - - - 0x014B23 05:8B13: EA        .byte $EA, $00, $F1, $C0   ; tiles

- D 0 - - - 0x014B27 05:8B17: 2D B2     .dbyt $2DB2 ; ppu address
- D 0 - - - 0x014B29 05:8B19: 04        .byte $04   ; counter
- D 0 - - - 0x014B2A 05:8B1A: F2        .byte $F2, $00, $F2, $C5   ; tiles

- D 0 - - - 0x014B2E 05:8B1E: FF        .byte $FF   ; end token



off_8B1F:
; 1E
- D 0 - - - 0x014B2F 05:8B1F: 06        .byte con_buf_mode_06   ; 

- D 0 - - - 0x014B30 05:8B20: 2D 4A     .dbyt $2D4A ; ppu address
- D 0 - - - 0x014B32 05:8B22: 04        .byte $04   ; counter
- D 0 - - - 0x014B33 05:8B23: AD        .byte $AD, $E5, $E6, $E7   ; tiles

- D 0 - - - 0x014B37 05:8B27: 2D 6A     .dbyt $2D6A ; ppu address
- D 0 - - - 0x014B39 05:8B29: 04        .byte $04   ; counter
- D 0 - - - 0x014B3A 05:8B2A: B4        .byte $B4, $E8, $E9, $E8   ; tiles

- D 0 - - - 0x014B3E 05:8B2E: 2D 8A     .dbyt $2D8A ; ppu address
- D 0 - - - 0x014B40 05:8B30: 04        .byte $04   ; counter
- D 0 - - - 0x014B41 05:8B31: 20        .byte $20, $EA, $00, $F1   ; tiles

- D 0 - - - 0x014B45 05:8B35: 2D AA     .dbyt $2DAA ; ppu address
- D 0 - - - 0x014B47 05:8B37: 04        .byte $04   ; counter
- D 0 - - - 0x014B48 05:8B38: C1        .byte $C1, $F2, $00, $F2   ; tiles

- D 0 - - - 0x014B4C 05:8B3C: FF        .byte $FF   ; end token



_off001_0x014B4D_36_tank_electricity:
- D 0 - I - 0x014B4D 05:8B3D: 43 8B     .word ofs_038_36_8B43_01_initialize_object ; 
- D 0 - I - 0x014B4F 05:8B3F: 4B 8B     .word ofs_038_36_8B4B_02 ; 
- D 0 - I - 0x014B51 05:8B41: 75 A2     .word ofs_038_36_0x006285_03_delete_object_02 ; 



ofs_038_36_8B43_01_initialize_object:
C - - J - - 0x014B53 05:8B43: A9 80     LDA #$80
C - - - - - 0x014B55 05:8B45: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x014B58 05:8B48: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_36_8B4B_02:
C - - J - - 0x014B5B 05:8B4B: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x014B5E 05:8B4E: 4A        LSR
C - - - - - 0x014B5F 05:8B4F: 90 08     BCC bra_8B59
C - - - - - 0x014B61 05:8B51: A9 54     LDA #$54
C - - - - - 0x014B63 05:8B53: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014B66 05:8B56: 4C 66 8B  JMP loc_8B66
bra_8B59:
C - - - - - 0x014B69 05:8B59: A5 5B     LDA ram_005B
C - - - - - 0x014B6B 05:8B5B: 29 03     AND #$03
C - - - - - 0x014B6D 05:8B5D: 18        CLC
C - - - - - 0x014B6E 05:8B5E: 69 55     ADC #$55
C - - - - - 0x014B70 05:8B60: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014B73 05:8B63: 4C 6A 8B  JMP loc_8B6A



loc_8B66:
C D 0 - - - 0x014B76 05:8B66: A9 00     LDA #$00
C - - - - - 0x014B78 05:8B68: F0 06     BEQ bra_8B70    ; jmp



loc_8B6A:
C D 0 - - - 0x014B7A 05:8B6A: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x014B7D 05:8B6D: B9 80 07  LDA ram_0780_obj,Y
bra_8B70:
C - - - - - 0x014B80 05:8B70: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x014B83 05:8B73: 18        CLC
C - - - - - 0x014B84 05:8B74: 79 22 05  ADC ram_pos_Y_hi_enemy,Y
C - - - - - 0x014B87 05:8B77: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x014B8A 05:8B7A: B9 3C 05  LDA ram_pos_X_hi_enemy,Y
C - - - - - 0x014B8D 05:8B7D: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014B90 05:8B80: 60        RTS



_off001_0x014B91_25_moving_gun:
- D 0 - I - 0x014B91 05:8B81: 8B 8B     .word ofs_038_25_8B8B_01_initialize_object ; 
- D 0 - I - 0x014B93 05:8B83: AF 8B     .word ofs_038_25_8BAF_02 ; 
- D 0 - I - 0x014B95 05:8B85: 9A A2     .word ofs_038_25_0x0062AA_03 ; 
- D 0 - I - 0x014B97 05:8B87: FD A2     .word ofs_038_25_0x00630D_04 ; 
- D 0 - I - 0x014B99 05:8B89: 3D A3     .word ofs_038_25_0x00634D_05_delete_object_04 ; 



ofs_038_25_8B8B_01_initialize_object:
C - - J - - 0x014B9B 05:8B8B: A9 04     LDA #$04
C - - - - - 0x014B9D 05:8B8D: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x014BA0 05:8B90: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x014BA3 05:8B93: 29 01     AND #$01
C - - - - - 0x014BA5 05:8B95: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x014BA8 05:8B98: 20 41 8C  JSR sub_8C41
C - - - - - 0x014BAB 05:8B9B: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014BAE 05:8B9E: 18        CLC
C - - - - - 0x014BAF 05:8B9F: 69 0A     ADC #$0A
C - - - - - 0x014BB1 05:8BA1: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x014BB4 05:8BA4: A9 27     LDA #$27
C - - - - - 0x014BB6 05:8BA6: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x014BB9 05:8BA9: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x014BBC 05:8BAC: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_25_8BAF_02:
C - - J - - 0x014BBF 05:8BAF: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x014BC2 05:8BB2: 98        TYA
C - - - - - 0x014BC3 05:8BB3: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x014BC6 05:8BB6: B9 4C 05  LDA ram_pos_X_hi_plr,Y
C - - - - - 0x014BC9 05:8BB9: 38        SEC
C - - - - - 0x014BCA 05:8BBA: FD 3C 05  SBC ram_pos_X_hi_enemy,X
C - - - - - 0x014BCD 05:8BBD: A0 02     LDY #$02
C - - - - - 0x014BCF 05:8BBF: B0 06     BCS bra_8BC7
C - - - - - 0x014BD1 05:8BC1: A0 00     LDY #$00
C - - - - - 0x014BD3 05:8BC3: 49 FF     EOR #$FF
C - - - - - 0x014BD5 05:8BC5: 69 01     ADC #$01
bra_8BC7:
C - - - - - 0x014BD7 05:8BC7: C9 20     CMP #$20
C - - - - - 0x014BD9 05:8BC9: B0 02     BCS bra_8BCD
C - - - - - 0x014BDB 05:8BCB: A0 01     LDY #$01
bra_8BCD:
C - - - - - 0x014BDD 05:8BCD: 98        TYA
C - - - - - 0x014BDE 05:8BCE: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014BE1 05:8BD1: B9 2D 8C  LDA tbl_8C2D_animation,Y
C - - - - - 0x014BE4 05:8BD4: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014BE7 05:8BD7: B9 30 8C  LDA tbl_8C30_spr_attr,Y
C - - - - - 0x014BEA 05:8BDA: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x014BED 05:8BDD: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x014BF0 05:8BE0: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x014BF3 05:8BE3: 2A        ROL
C - - - - - 0x014BF4 05:8BE4: 2A        ROL
C - - - - - 0x014BF5 05:8BE5: 29 01     AND #$01
C - - - - - 0x014BF7 05:8BE7: A8        TAY
C - - - - - 0x014BF8 05:8BE8: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014BFB 05:8BEB: D9 2B 8C  CMP tbl_8C2B_pos_X,Y
C - - - - - 0x014BFE 05:8BEE: 6A        ROR
C - - - - - 0x014BFF 05:8BEF: 5D CA 06  EOR ram_spd_X_hi_obj,X
C - - - - - 0x014C02 05:8BF2: 10 03     BPL bra_8BF7
C - - - - - 0x014C04 05:8BF4: 20 39 8C  JSR sub_8C39
bra_8BF7:
C - - - - - 0x014C07 05:8BF7: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x014C0A 05:8BFA: D0 2E     BNE bra_8C2A_RTS
C - - - - - 0x014C0C 05:8BFC: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x014C0F 05:8BFF: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014C12 05:8C02: 18        CLC
C - - - - - 0x014C13 05:8C03: 79 33 8C  ADC tbl_8C33_pos_Y,Y
C - - - - - 0x014C16 05:8C06: 85 08     STA ram_0008
C - - - - - 0x014C18 05:8C08: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014C1B 05:8C0B: 18        CLC
C - - - - - 0x014C1C 05:8C0C: 79 36 8C  ADC tbl_8C36_pos_X,Y
C - - - - - 0x014C1F 05:8C0F: 85 09     STA ram_0009
C - - - - - 0x014C21 05:8C11: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x014C24 05:8C14: 84 0A     STY ram_000A
C - - - - - 0x014C26 05:8C16: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014C29 05:8C19: C9 A0     CMP #$A0
C - - - - - 0x014C2B 05:8C1B: B0 0D     BCS bra_8C2A_RTS
C - - - - - 0x014C2D 05:8C1D: D9 32 05  CMP ram_pos_Y_hi_plr,Y
C - - - - - 0x014C30 05:8C20: B0 08     BCS bra_8C2A_RTS
C - - - - - 0x014C32 05:8C22: 20 25 F3  JSR sub_0x01F335
C - - - - - 0x014C35 05:8C25: A9 37     LDA #$37
C - - - - - 0x014C37 05:8C27: 9D F4 06  STA ram_06F4_obj,X
bra_8C2A_RTS:
C - - - - - 0x014C3A 05:8C2A: 60        RTS



tbl_8C2B_pos_X:
- D 0 - - - 0x014C3B 05:8C2B: E0        .byte $E0   ; 00 
- D 0 - - - 0x014C3C 05:8C2C: 20        .byte $20   ; 01 



tbl_8C2D_animation:
- D 0 - - - 0x014C3D 05:8C2D: 64        .byte $64   ; 00 
- D 0 - - - 0x014C3E 05:8C2E: 65        .byte $65   ; 01 
- D 0 - - - 0x014C3F 05:8C2F: 64        .byte $64   ; 02 



tbl_8C30_spr_attr:
- D 0 - - - 0x014C40 05:8C30: 03        .byte $03   ; 00 
- D 0 - - - 0x014C41 05:8C31: 03        .byte $03   ; 01 
- D 0 - - - 0x014C42 05:8C32: 43        .byte $43   ; 02 



tbl_8C33_pos_Y:
- D 0 - - - 0x014C43 05:8C33: 0B        .byte $0B   ; 00 
- D 0 - - - 0x014C44 05:8C34: 13        .byte $13   ; 01 
- D 0 - - - 0x014C45 05:8C35: 0B        .byte $0B   ; 02 



tbl_8C36_pos_X:
- D 0 - - - 0x014C46 05:8C36: F5        .byte $F5   ; 00 
- D 0 - - - 0x014C47 05:8C37: 00        .byte $00   ; 01 
- D 0 - - - 0x014C48 05:8C38: 0B        .byte $0B   ; 02 



sub_8C39:
C - - - - - 0x014C49 05:8C39: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x014C4C 05:8C3C: 49 01     EOR #$01
C - - - - - 0x014C4E 05:8C3E: 9D 48 07  STA ram_0748_obj,X
sub_8C41:
C - - - - - 0x014C51 05:8C41: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x014C54 05:8C44: 0A        ASL
C - - - - - 0x014C55 05:8C45: A8        TAY
C - - - - - 0x014C56 05:8C46: B9 53 8C  LDA tbl_8C53_spd_X,Y
C - - - - - 0x014C59 05:8C49: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x014C5C 05:8C4C: B9 54 8C  LDA tbl_8C53_spd_X + $01,Y
C - - - - - 0x014C5F 05:8C4F: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x014C62 05:8C52: 60        RTS



tbl_8C53_spd_X:
- D 0 - - - 0x014C63 05:8C53: 80 FF     .word $FF80 ; 00 
- D 0 - - - 0x014C65 05:8C55: 80 00     .word $0080 ; 01 



_off001_0x014C67_2C_falling_platform:
- D 0 - I - 0x014C67 05:8C57: 63 8C     .word ofs_038_2C_8C63_01_initialize_object ; 
- D 0 - I - 0x014C69 05:8C59: 76 8C     .word ofs_038_2C_8C76_02 ; 
- D 0 - I - 0x014C6B 05:8C5B: 85 8C     .word ofs_038_2C_8C85_03 ; 
- D 0 - I - 0x014C6D 05:8C5D: C1 8C     .word ofs_038_2C_8CC1_04 ; 
- D 0 - I - 0x014C6F 05:8C5F: 08 8D     .word ofs_038_2C_8D08_05 ; 
- D 0 - I - 0x014C71 05:8C61: A1 8D     .word ofs_038_2C_8DA1_06 ; 



ofs_038_2C_8C63_01_initialize_object:
C - - J - - 0x014C73 05:8C63: A9 01     LDA #$01
C - - - - - 0x014C75 05:8C65: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x014C78 05:8C68: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014C7B 05:8C6B: 69 04     ADC #$04
C - - - - - 0x014C7D 05:8C6D: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x014C80 05:8C70: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014C83 05:8C73: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_2C_8C76_02:
C - - J - - 0x014C86 05:8C76: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014C89 05:8C79: A5 61     LDA ram_0061
C - - - - - 0x014C8B 05:8C7B: F0 07     BEQ bra_8C84_RTS
C - - - - - 0x014C8D 05:8C7D: A5 71     LDA ram_0071_flag
C - - - - - 0x014C8F 05:8C7F: 10 03     BPL bra_8C84_RTS
C - - - - - 0x014C91 05:8C81: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8C84_RTS:
C - - - - - 0x014C94 05:8C84: 60        RTS



ofs_038_2C_8C85_03:
C - - J - - 0x014C95 05:8C85: A9 01     LDA #$01
C - - - - - 0x014C97 05:8C87: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014C9A 05:8C8A: A9 FF     LDA #$FF
C - - - - - 0x014C9C 05:8C8C: 85 08     STA ram_0008
C - - - - - 0x014C9E 05:8C8E: 85 09     STA ram_0009
C - - - - - 0x014CA0 05:8C90: A0 0F     LDY #$0F
bra_8C92_loop:
C - - - - - 0x014CA2 05:8C92: B9 A8 05  LDA ram_05A8_plr_bullet,Y
C - - - - - 0x014CA5 05:8C95: C9 01     CMP #$01
C - - - - - 0x014CA7 05:8C97: D0 16     BNE bra_8CAF
C - - - - - 0x014CA9 05:8C99: B9 88 05  LDA ram_plr_bullet_pos_X_hi,Y
C - - - - - 0x014CAC 05:8C9C: C9 38     CMP #$38
C - - - - - 0x014CAE 05:8C9E: 90 0F     BCC bra_8CAF
C - - - - - 0x014CB0 05:8CA0: C9 C8     CMP #$C8
C - - - - - 0x014CB2 05:8CA2: B0 0B     BCS bra_8CAF
C - - - - - 0x014CB4 05:8CA4: B9 78 05  LDA ram_plr_bullet_pos_Y_hi,Y
C - - - - - 0x014CB7 05:8CA7: C5 08     CMP ram_0008
C - - - - - 0x014CB9 05:8CA9: B0 04     BCS bra_8CAF
C - - - - - 0x014CBB 05:8CAB: 85 08     STA ram_0008
C - - - - - 0x014CBD 05:8CAD: 84 09     STY ram_0009
bra_8CAF:
C - - - - - 0x014CBF 05:8CAF: 88        DEY
C - - - - - 0x014CC0 05:8CB0: 10 E0     BPL bra_8C92_loop
C - - - - - 0x014CC2 05:8CB2: A9 80     LDA #$80
C - - - - - 0x014CC4 05:8CB4: A4 09     LDY ram_0009
C - - - - - 0x014CC6 05:8CB6: 30 03     BMI bra_8CBB
C - - - - - 0x014CC8 05:8CB8: B9 88 05  LDA ram_plr_bullet_pos_X_hi,Y
bra_8CBB:
C - - - - - 0x014CCB 05:8CBB: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x014CCE 05:8CBE: 4C B7 A6  JMP loc_0x0066C7_delete_object_03



ofs_038_2C_8CC1_04:
C - - J - - 0x014CD1 05:8CC1: A9 20     LDA #$20
C - - - - - 0x014CD3 05:8CC3: 8D 89 04  STA ram_0489
C - - - - - 0x014CD6 05:8CC6: A9 00     LDA #$00
C - - - - - 0x014CD8 05:8CC8: 8D 8A 04  STA ram_048A
C - - - - - 0x014CDB 05:8CCB: 8D 8B 04  STA ram_048B
C - - - - - 0x014CDE 05:8CCE: 8D 8C 04  STA ram_048C
C - - - - - 0x014CE1 05:8CD1: 8D 8D 04  STA ram_048D
C - - - - - 0x014CE4 05:8CD4: A9 02     LDA #$02
C - - - - - 0x014CE6 05:8CD6: 8D 8E 04  STA ram_048E
C - - - - - 0x014CE9 05:8CD9: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014CEC 05:8CDC: 38        SEC
C - - - - - 0x014CED 05:8CDD: E9 04     SBC #$04
C - - - - - 0x014CEF 05:8CDF: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x014CF2 05:8CE2: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x014CF5 05:8CE5: 29 F0     AND #$F0
C - - - - - 0x014CF7 05:8CE7: 09 04     ORA #$04
C - - - - - 0x014CF9 05:8CE9: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x014CFC 05:8CEC: 38        SEC
C - - - - - 0x014CFD 05:8CED: E9 10     SBC #$10
C - - - - - 0x014CFF 05:8CEF: C9 30     CMP #$30
C - - - - - 0x014D01 05:8CF1: B0 02     BCS bra_8CF5
- - - - - - 0x014D03 05:8CF3: A9 00     LDA #$00
bra_8CF5:
C - - - - - 0x014D05 05:8CF5: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014D08 05:8CF8: A9 01     LDA #$01
C - - - - - 0x014D0A 05:8CFA: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x014D0D 05:8CFD: A9 10     LDA #$10
C - - - - - 0x014D0F 05:8CFF: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x014D12 05:8D02: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014D15 05:8D05: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_2C_8D08_05:
C - - J - - 0x014D18 05:8D08: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014D1B 05:8D0B: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x014D1E 05:8D0E: F0 40     BEQ bra_8D50
C - - - - - 0x014D20 05:8D10: DE 64 07  DEC ram_0764_obj,X
C - - - - - 0x014D23 05:8D13: D0 3B     BNE bra_8D50
C - - - - - 0x014D25 05:8D15: A9 00     LDA #$00
C - - - - - 0x014D27 05:8D17: 85 08     STA ram_0008
C - - - - - 0x014D29 05:8D19: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014D2C 05:8D1C: 38        SEC
C - - - - - 0x014D2D 05:8D1D: E9 04     SBC #$04
C - - - - - 0x014D2F 05:8D1F: A8        TAY
C - - - - - 0x014D30 05:8D20: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x014D33 05:8D23: 20 E6 A8  JSR sub_0x0068F6
C - - - - - 0x014D36 05:8D26: A9 01     LDA #$01
C - - - - - 0x014D38 05:8D28: B0 23     BCS bra_8D4D
C - - - - - 0x014D3A 05:8D2A: A0 2D     LDY #con_obj_id_2D
C - - - - - 0x014D3C 05:8D2C: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x014D3F 05:8D2F: 90 0B     BCC bra_8D3C
C - - - - - 0x014D41 05:8D31: A4 11     LDY ram_0011
C - - - - - 0x014D43 05:8D33: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x014D46 05:8D36: 18        CLC
C - - - - - 0x014D47 05:8D37: 69 04     ADC #$04
C - - - - - 0x014D49 05:8D39: 99 3C 05  STA ram_pos_X_hi_enemy,Y
bra_8D3C:
C - - - - - 0x014D4C 05:8D3C: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x014D4F 05:8D3F: 18        CLC
C - - - - - 0x014D50 05:8D40: 69 10     ADC #$10
C - - - - - 0x014D52 05:8D42: C9 D0     CMP #$D0
C - - - - - 0x014D54 05:8D44: 90 02     BCC bra_8D48
C - - - - - 0x014D56 05:8D46: A9 00     LDA #$00
bra_8D48:
C - - - - - 0x014D58 05:8D48: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x014D5B 05:8D4B: A9 10     LDA #$10
bra_8D4D:
C - - - - - 0x014D5D 05:8D4D: 9D 64 07  STA ram_0764_obj,X
bra_8D50:
C - - - - - 0x014D60 05:8D50: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x014D63 05:8D53: F0 40     BEQ bra_8D95
C - - - - - 0x014D65 05:8D55: DE 72 07  DEC ram_0772_obj,X
C - - - - - 0x014D68 05:8D58: D0 3B     BNE bra_8D95
C - - - - - 0x014D6A 05:8D5A: A9 00     LDA #$00
C - - - - - 0x014D6C 05:8D5C: 85 08     STA ram_0008
C - - - - - 0x014D6E 05:8D5E: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x014D71 05:8D61: 38        SEC
C - - - - - 0x014D72 05:8D62: E9 08     SBC #$08
C - - - - - 0x014D74 05:8D64: A8        TAY
C - - - - - 0x014D75 05:8D65: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x014D78 05:8D68: 20 E6 A8  JSR sub_0x0068F6
C - - - - - 0x014D7B 05:8D6B: A9 01     LDA #$01
C - - - - - 0x014D7D 05:8D6D: B0 23     BCS bra_8D92
C - - - - - 0x014D7F 05:8D6F: A0 2D     LDY #con_obj_id_2D
C - - - - - 0x014D81 05:8D71: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x014D84 05:8D74: 90 0B     BCC bra_8D81
C - - - - - 0x014D86 05:8D76: A4 11     LDY ram_0011
C - - - - - 0x014D88 05:8D78: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x014D8B 05:8D7B: 18        CLC
C - - - - - 0x014D8C 05:8D7C: 69 04     ADC #$04
C - - - - - 0x014D8E 05:8D7E: 99 3C 05  STA ram_pos_X_hi_enemy,Y
bra_8D81:
C - - - - - 0x014D91 05:8D81: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x014D94 05:8D84: 38        SEC
C - - - - - 0x014D95 05:8D85: E9 10     SBC #$10
C - - - - - 0x014D97 05:8D87: C9 30     CMP #$30
C - - - - - 0x014D99 05:8D89: B0 02     BCS bra_8D8D
C - - - - - 0x014D9B 05:8D8B: A9 00     LDA #$00
bra_8D8D:
C - - - - - 0x014D9D 05:8D8D: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014DA0 05:8D90: A9 10     LDA #$10
bra_8D92:
C - - - - - 0x014DA2 05:8D92: 9D 72 07  STA ram_0772_obj,X
bra_8D95:
C - - - - - 0x014DA5 05:8D95: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x014DA8 05:8D98: 1D 56 07  ORA ram_0756_obj,X
C - - - - - 0x014DAB 05:8D9B: D0 03     BNE bra_8DA0_RTS
C - - - - - 0x014DAD 05:8D9D: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8DA0_RTS:
C - - - - - 0x014DB0 05:8DA0: 60        RTS



ofs_038_2C_8DA1_06:
C - - J - - 0x014DB1 05:8DA1: A9 40     LDA #$40
C - - - - - 0x014DB3 05:8DA3: 85 71     STA ram_0071_flag
C - - - - - 0x014DB5 05:8DA5: 85 7D     STA ram_007D_flag
C - - - - - 0x014DB7 05:8DA7: 4C 75 A2  JMP loc_0x006285_delete_object_02



_off001_0x014DBA_2D_spawner_falling_platforms:
- D 0 - I - 0x014DBA 05:8DAA: B4 8D     .word ofs_038_2D_8DB4_01_initialize_object ; 
- D 0 - I - 0x014DBC 05:8DAC: C4 8D     .word ofs_038_2D_8DC4_02 ; 
- D 0 - I - 0x014DBE 05:8DAE: 9A A2     .word ofs_038_2D_0x0062AA_03 ; 
- D 0 - I - 0x014DC0 05:8DB0: FD A2     .word ofs_038_2D_0x00630D_04 ; 
- D 0 - I - 0x014DC2 05:8DB2: 3D A3     .word ofs_038_2D_0x00634D_05_delete_object_04 ; 



ofs_038_2D_8DB4_01_initialize_object:
C - - J - - 0x014DC4 05:8DB4: A9 62     LDA #$62
C - - - - - 0x014DC6 05:8DB6: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014DC9 05:8DB9: A9 04     LDA #$04
C - - - - - 0x014DCB 05:8DBB: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x014DCE 05:8DBE: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
bra_8DC1:
C - - - - - 0x014DD1 05:8DC1: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_2D_8DC4_02:
C - - J - - 0x014DD4 05:8DC4: BD A0 06  LDA ram_spd_Y_lo_obj,X
C - - - - - 0x014DD7 05:8DC7: 18        CLC
C - - - - - 0x014DD8 05:8DC8: 69 20     ADC #< $0020
C - - - - - 0x014DDA 05:8DCA: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x014DDD 05:8DCD: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x014DE0 05:8DD0: 69 00     ADC #> $0020
C - - - - - 0x014DE2 05:8DD2: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x014DE5 05:8DD5: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x014DE8 05:8DD8: A9 00     LDA #$00
C - - - - - 0x014DEA 05:8DDA: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x014DED 05:8DDD: D0 E2     BNE bra_8DC1
C - - - - - 0x014DEF 05:8DDF: 60        RTS



_off001_0x014DF0_31_redblue_bubble:
- D 0 - I - 0x014DF0 05:8DE0: EC 8D     .word ofs_038_31_8DEC_01_initialize_object ; 
- D 0 - I - 0x014DF2 05:8DE2: F9 8D     .word ofs_038_31_8DF9_02 ; 
- D 0 - I - 0x014DF4 05:8DE4: 19 8E     .word ofs_038_31_8E19_03 ; 
- D 0 - I - 0x014DF6 05:8DE6: 9A A2     .word ofs_038_31_0x0062AA_04 ; 
- D 0 - I - 0x014DF8 05:8DE8: FD A2     .word ofs_038_31_0x00630D_05 ; 
- D 0 - I - 0x014DFA 05:8DEA: 3D A3     .word ofs_038_31_0x00634D_06_delete_object_04 ; 



ofs_038_31_8DEC_01_initialize_object:
C - - J - - 0x014DFC 05:8DEC: A9 06     LDA #$06
C - - - - - 0x014DFE 05:8DEE: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x014E01 05:8DF1: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014E04 05:8DF4: A9 40     LDA #$40
C - - - - - 0x014E06 05:8DF6: 4C E0 A2  JMP loc_0x0062F0



ofs_038_31_8DF9_02:
C - - J - - 0x014E09 05:8DF9: A0 05     LDY #$05
C - - - - - 0x014E0B 05:8DFB: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x014E0E 05:8DFE: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x014E11 05:8E01: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x014E14 05:8E04: D0 12     BNE bra_8E18_RTS
C - - - - - 0x014E16 05:8E06: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x014E19 05:8E09: A0 06     LDY #$06
C - - - - - 0x014E1B 05:8E0B: 20 57 A9  JSR sub_0x006967
C - - - - - 0x014E1E 05:8E0E: A9 20     LDA #$20
C - - - - - 0x014E20 05:8E10: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x014E23 05:8E13: A9 30     LDA #$30
C - - - - - 0x014E25 05:8E15: 4C E0 A2  JMP loc_0x0062F0
bra_8E18_RTS:
C - - - - - 0x014E28 05:8E18: 60        RTS



ofs_038_31_8E19_03:
C - - J - - 0x014E29 05:8E19: A0 06     LDY #$06
C - - - - - 0x014E2B 05:8E1B: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x014E2E 05:8E1E: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x014E31 05:8E21: F0 15     BEQ bra_8E38
C - - - - - 0x014E33 05:8E23: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x014E36 05:8E26: D0 10     BNE bra_8E38
C - - - - - 0x014E38 05:8E28: A9 06     LDA #$06
C - - - - - 0x014E3A 05:8E2A: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x014E3D 05:8E2D: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x014E40 05:8E30: A0 06     LDY #$06
C - - - - - 0x014E42 05:8E32: 20 23 A9  JSR sub_0x006933
C - - - - - 0x014E45 05:8E35: DE 56 07  DEC ram_0756_obj,X
bra_8E38:
C - - - - - 0x014E48 05:8E38: 4C D3 A6  JMP loc_0x0066E3



_off001_0x014E4B_39_elevator:
- D 0 - I - 0x014E4B 05:8E3B: 49 8E     .word ofs_038_39_8E49_01_initialize_object ; 
- D 0 - I - 0x014E4D 05:8E3D: 51 8E     .word ofs_038_39_8E51_02 ; 
- D 0 - I - 0x014E4F 05:8E3F: 70 8E     .word ofs_038_39_8E70_03 ; 
- D 0 - I - 0x014E51 05:8E41: 96 8E     .word ofs_038_39_8E96_04 ; 
- D 0 - I - 0x014E53 05:8E43: A3 8E     .word ofs_038_39_8EA3_05 ; 
- D 0 - I - 0x014E55 05:8E45: BB 8E     .word ofs_038_39_8EBB_06 ; 
- D 0 - I - 0x014E57 05:8E47: DE 8E     .word ofs_038_39_8EDE_07 ; 



ofs_038_39_8E49_01_initialize_object:
C - - J - - 0x014E59 05:8E49: A9 81     LDA #$81
C - - - - - 0x014E5B 05:8E4B: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x014E5E 05:8E4E: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_39_8E51_02:
C - - J - - 0x014E61 05:8E51: A5 FC     LDA ram_scroll_Y
C - - - - - 0x014E63 05:8E53: D0 1A     BNE bra_8E6F_RTS
C - - - - - 0x014E65 05:8E55: A9 00     LDA #$00
C - - - - - 0x014E67 05:8E57: 85 7E     STA ram_007E
C - - - - - 0x014E69 05:8E59: A9 C0     LDA #$C0
C - - - - - 0x014E6B 05:8E5B: 85 71     STA ram_0071_flag
C - - - - - 0x014E6D 05:8E5D: A9 A0     LDA #$A0
C - - - - - 0x014E6F 05:8E5F: 9D 22 05  STA ram_pos_Y_hi_enemy,X
loc_8E62:
C D 0 - - - 0x014E72 05:8E62: A9 00     LDA #$00
C - - - - - 0x014E74 05:8E64: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x014E77 05:8E67: A9 08     LDA #$08
C - - - - - 0x014E79 05:8E69: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x014E7C 05:8E6C: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8E6F_RTS:
C - - - - - 0x014E7F 05:8E6F: 60        RTS



ofs_038_39_8E70_03:
C - - J - - 0x014E80 05:8E70: BD E6 06  LDA ram_06E6_obj,X
C - - - - - 0x014E83 05:8E73: F0 05     BEQ bra_8E7A
C - - - - - 0x014E85 05:8E75: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x014E88 05:8E78: D0 F5     BNE bra_8E6F_RTS
bra_8E7A:
C - - - - - 0x014E8A 05:8E7A: A0 00     LDY #$00
C - - - - - 0x014E8C 05:8E7C: 20 F7 8E  JSR sub_8EF7
C - - - - - 0x014E8F 05:8E7F: 90 EE     BCC bra_8E6F_RTS
C - - - - - 0x014E91 05:8E81: A9 02     LDA #con_irq_area_4_elevator
C - - - - - 0x014E93 05:8E83: 85 27     STA ram_irq_handler_hi
C - - - - - 0x014E95 05:8E85: 20 C5 90  JSR sub_90C5
C - - - - - 0x014E98 05:8E88: A9 00     LDA #$00
C - - - - - 0x014E9A 05:8E8A: 85 FA     STA ram_00FA
C - - - - - 0x014E9C 05:8E8C: A9 00     LDA #$00
C - - - - - 0x014E9E 05:8E8E: 85 FB     STA ram_00FB
C - - - - - 0x014EA0 05:8E90: 20 C5 90  JSR sub_90C5
C - - - - - 0x014EA3 05:8E93: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_39_8E96_04:
C - - J - - 0x014EA6 05:8E96: 20 C5 90  JSR sub_90C5
C - - - - - 0x014EA9 05:8E99: A0 01     LDY #$01
C - - - - - 0x014EAB 05:8E9B: 20 F7 8E  JSR sub_8EF7
C - - - - - 0x014EAE 05:8E9E: 90 CF     BCC bra_8E6F_RTS
C - - - - - 0x014EB0 05:8EA0: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_39_8EA3_05:
C - - J - - 0x014EB3 05:8EA3: 20 C5 90  JSR sub_90C5
C - - - - - 0x014EB6 05:8EA6: A9 80     LDA #$80
C - - - - - 0x014EB8 05:8EA8: 85 7E     STA ram_007E
C - - - - - 0x014EBA 05:8EAA: A9 C0     LDA #$C0
C - - - - - 0x014EBC 05:8EAC: 85 7F     STA ram_007F
C - - - - - 0x014EBE 05:8EAE: A9 FF     LDA #$FF
C - - - - - 0x014EC0 05:8EB0: 85 80     STA ram_0080
C - - - - - 0x014EC2 05:8EB2: A9 40     LDA #$40
C - - - - - 0x014EC4 05:8EB4: 85 71     STA ram_0071_flag
C - - - - - 0x014EC6 05:8EB6: A9 01     LDA #$01
C - - - - - 0x014EC8 05:8EB8: 4C E0 A2  JMP loc_0x0062F0



ofs_038_39_8EBB_06:
C - - J - - 0x014ECB 05:8EBB: A5 5B     LDA ram_005B
C - - - - - 0x014ECD 05:8EBD: 29 03     AND #$03
C - - - - - 0x014ECF 05:8EBF: D0 0F     BNE bra_8ED0
C - - - - - 0x014ED1 05:8EC1: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x014ED4 05:8EC4: D0 0A     BNE bra_8ED0
C - - - - - 0x014ED6 05:8EC6: A9 80     LDA #$80
C - - - - - 0x014ED8 05:8EC8: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x014EDB 05:8ECB: A9 21     LDA #con_sound_21
C - - - - - 0x014EDD 05:8ECD: 20 DE FD  JSR sub_0x01FDEE_play_sound
bra_8ED0:
C - - - - - 0x014EE0 05:8ED0: 20 C5 90  JSR sub_90C5
C - - - - - 0x014EE3 05:8ED3: A5 7E     LDA ram_007E
C - - - - - 0x014EE5 05:8ED5: D0 98     BNE bra_8E6F_RTS
C - - - - - 0x014EE7 05:8ED7: A5 FC     LDA ram_scroll_Y
C - - - - - 0x014EE9 05:8ED9: D0 94     BNE bra_8E6F_RTS
C - - - - - 0x014EEB 05:8EDB: 4C 62 8E  JMP loc_8E62



ofs_038_39_8EDE_07:
C - - J - - 0x014EEE 05:8EDE: 20 C5 90  JSR sub_90C5
C - - - - - 0x014EF1 05:8EE1: A0 02     LDY #$02
C - - - - - 0x014EF3 05:8EE3: 20 F7 8E  JSR sub_8EF7
C - - - - - 0x014EF6 05:8EE6: 90 0E     BCC bra_8EF6_RTS
C - - - - - 0x014EF8 05:8EE8: 20 8C FC  JSR sub_0x01FC9C_increase_002B
C - - - - - 0x014EFB 05:8EEB: A9 40     LDA #$40
C - - - - - 0x014EFD 05:8EED: 85 71     STA ram_0071_flag
C - - - - - 0x014EFF 05:8EEF: A9 00     LDA #$00
C - - - - - 0x014F01 05:8EF1: 85 80     STA ram_0080
C - - - - - 0x014F03 05:8EF3: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_8EF6_RTS:
C - - - - - 0x014F06 05:8EF6: 60        RTS



sub_8EF7:
C - - - - - 0x014F07 05:8EF7: 84 0C     STY ram_000C
C - - - - - 0x014F09 05:8EF9: B9 80 8F  LDA tbl_8F80,Y
C - - - - - 0x014F0C 05:8EFC: 85 0B     STA ram_000B
C - - - - - 0x014F0E 05:8EFE: 98        TYA
C - - - - - 0x014F0F 05:8EFF: 0A        ASL
C - - - - - 0x014F10 05:8F00: A8        TAY
C - - - - - 0x014F11 05:8F01: B9 7A 8F  LDA tbl_8F7A,Y
C - - - - - 0x014F14 05:8F04: 85 09     STA ram_0009
C - - - - - 0x014F16 05:8F06: B9 7B 8F  LDA tbl_8F7A + $01,Y
C - - - - - 0x014F19 05:8F09: 85 0A     STA ram_000A
C - - - - - 0x014F1B 05:8F0B: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x014F1E 05:8F0E: 0A        ASL
C - - - - - 0x014F1F 05:8F0F: A8        TAY
C - - - - - 0x014F20 05:8F10: B1 09     LDA (ram_0009),Y
C - - - - - 0x014F22 05:8F12: 85 08     STA ram_0008
C - - - - - 0x014F24 05:8F14: C8        INY
C - - - - - 0x014F25 05:8F15: B1 09     LDA (ram_0009),Y
C - - - - - 0x014F27 05:8F17: 85 09     STA ram_0009
C - - - - - 0x014F29 05:8F19: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x014F2B 05:8F1B: E0 10     CPX #$10
C - - - - - 0x014F2D 05:8F1D: B0 54     BCS bra_8F73
C - - - - - 0x014F2F 05:8F1F: A0 00     LDY #$00
C - - - - - 0x014F31 05:8F21: B1 08     LDA (ram_0008),Y
C - - - - - 0x014F33 05:8F23: 85 0A     STA ram_000A
C - - - - - 0x014F35 05:8F25: C8        INY
bra_8F26_loop:
C - - - - - 0x014F36 05:8F26: B1 08     LDA (ram_0008),Y
C - - - - - 0x014F38 05:8F28: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x014F3B 05:8F2B: C8        INY
C - - - - - 0x014F3C 05:8F2C: E8        INX
C - - - - - 0x014F3D 05:8F2D: C6 0A     DEC ram_000A
C - - - - - 0x014F3F 05:8F2F: D0 F5     BNE bra_8F26_loop
C - - - - - 0x014F41 05:8F31: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x014F43 05:8F33: A6 10     LDX ram_0010
C - - - - - 0x014F45 05:8F35: FE 48 07  INC ram_0748_obj,X
C - - - - - 0x014F48 05:8F38: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x014F4B 05:8F3B: C5 0B     CMP ram_000B
C - - - - - 0x014F4D 05:8F3D: 90 37     BCC bra_8F76_RTS
C - - - - - 0x014F4F 05:8F3F: A9 00     LDA #$00
C - - - - - 0x014F51 05:8F41: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x014F54 05:8F44: A4 0C     LDY ram_000C
C - - - - - 0x014F56 05:8F46: B9 77 8F  LDA tbl_8F77,Y
C - - - - - 0x014F59 05:8F49: A8        TAY
C - - - - - 0x014F5A 05:8F4A: A9 06     LDA #$06
C - - - - - 0x014F5C 05:8F4C: 85 0D     STA ram_000D
bra_8F4E_loop:
C - - - - - 0x014F5E 05:8F4E: A9 11     LDA #$11
C - - - - - 0x014F60 05:8F50: 99 01 04  STA ram_0401,Y
C - - - - - 0x014F63 05:8F53: A9 00     LDA #$00
C - - - - - 0x014F65 05:8F55: 99 09 04  STA ram_0409,Y
C - - - - - 0x014F68 05:8F58: C8        INY
C - - - - - 0x014F69 05:8F59: C6 0D     DEC ram_000D
C - - - - - 0x014F6B 05:8F5B: D0 F1     BNE bra_8F4E_loop
C - - - - - 0x014F6D 05:8F5D: A9 21     LDA #$21
C - - - - - 0x014F6F 05:8F5F: 99 FA 03  STA ram_pal_buffer + $1A,Y
C - - - - - 0x014F72 05:8F62: A9 12     LDA #$12
C - - - - - 0x014F74 05:8F64: 99 01 04  STA ram_0401,Y
C - - - - - 0x014F77 05:8F67: A9 20     LDA #$20
C - - - - - 0x014F79 05:8F69: 99 02 04  STA ram_0402,Y
C - - - - - 0x014F7C 05:8F6C: A9 02     LDA #$02
C - - - - - 0x014F7E 05:8F6E: 99 09 04  STA ram_0409,Y
C - - - - - 0x014F81 05:8F71: 38        SEC
C - - - - - 0x014F82 05:8F72: 60        RTS
bra_8F73:
- - - - - - 0x014F83 05:8F73: A6 10     LDX ram_0010
- - - - - - 0x014F85 05:8F75: 18        CLC
bra_8F76_RTS:
C - - - - - 0x014F86 05:8F76: 60        RTS



tbl_8F77:
- D 0 - - - 0x014F87 05:8F77: 50        .byte $50   ; 00 
- D 0 - - - 0x014F88 05:8F78: D0        .byte $D0   ; 01 
- D 0 - - - 0x014F89 05:8F79: D0        .byte $D0   ; 02 



tbl_8F7A:
- D 0 - - - 0x014F8A 05:8F7A: 83 8F     .word off_8F83_00
- D 0 - - - 0x014F8C 05:8F7C: 8B 8F     .word off_8F8B_01
- D 0 - - - 0x014F8E 05:8F7E: 93 8F     .word off_8F93_02



tbl_8F80:
- D 0 - - - 0x014F90 05:8F80: 04        .byte $04   ; 00 
- D 0 - - - 0x014F91 05:8F81: 04        .byte $04   ; 01 
- D 0 - - - 0x014F92 05:8F82: 04        .byte $04   ; 02 



off_8F83_00:
- D 0 - I - 0x014F93 05:8F83: 9B 8F     .word _off025_00_8F9B_00
- D 0 - I - 0x014F95 05:8F85: B1 8F     .word _off025_00_8FB1_01
- D 0 - I - 0x014F97 05:8F87: D7 8F     .word _off025_00_8FD7_02
- D 0 - I - 0x014F99 05:8F89: FD 8F     .word _off025_00_8FFD_03



off_8F8B_01:
- D 0 - I - 0x014F9B 05:8F8B: 08 90     .word _off025_01_9008_00
- D 0 - I - 0x014F9D 05:8F8D: 1C 90     .word _off025_01_901C_01
- D 0 - I - 0x014F9F 05:8F8F: 30 90     .word _off025_01_9030_02
- D 0 - I - 0x014FA1 05:8F91: 44 90     .word _off025_01_9044_03



off_8F93_02:
- D 0 - I - 0x014FA3 05:8F93: 58 90     .word _off025_02_9058_00
- D 0 - I - 0x014FA5 05:8F95: 6E 90     .word _off025_02_906E_01
- D 0 - I - 0x014FA7 05:8F97: 94 90     .word _off025_02_9094_02
- D 0 - I - 0x014FA9 05:8F99: BA 90     .word _off025_02_90BA_03



_off025_00_8F9B_00:
- D 0 - I - 0x014FAB 05:8F9B: 15        .byte @end - * - $01   ; total data size

- D 0 - I - 0x014FAC 05:8F9C: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x014FAD 05:8F9D: 22 80     .dbyt $2280 ; ppu address
- D 0 - I - 0x014FAF 05:8F9F: 04        .byte $04   ; counter
- D 0 - I - 0x014FB0 05:8FA0: 40        .byte $40, $40, $29, $6E   ; tiles

- D 0 - I - 0x014FB4 05:8FA4: 22 9C     .dbyt $229C ; ppu address
- D 0 - I - 0x014FB6 05:8FA6: 04        .byte $04   ; counter
- D 0 - I - 0x014FB7 05:8FA7: 2A        .byte $2A, $6F, $40, $40   ; tiles

- D 0 - I - 0x014FBB 05:8FAB: FF        .byte $FF   ; change mode

- D 0 - I - 0x014FBC 05:8FAC: 03        .byte con_buf_mode_03   ; 
- D 0 - I - 0x014FBD 05:8FAD: 22 84     .dbyt $2284 ; ppu address
- D 0 - I - 0x014FBF 05:8FAF: 18        .byte $18, $2B   ; counter + fill tile
@end:



_off025_00_8FB1_01:
- D 0 - I - 0x014FC1 05:8FB1: 25        .byte @end - * - $01   ; total data size

- D 0 - I - 0x014FC2 05:8FB2: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x014FC3 05:8FB3: 22 A0     .dbyt $22A0 ; ppu address
- D 0 - I - 0x014FC5 05:8FB5: 20        .byte $20   ; counter
- D 0 - I - 0x014FC6 05:8FB6: 6B        .byte $6B, $6C, $70, $71, $72, $71, $72, $71, $72, $71, $72, $71, $72, $71, $72, $71   ; tiles
- D 0 - I - 0x014FD6 05:8FC6: 72        .byte $72, $71, $72, $71, $72, $71, $72, $71, $72, $71, $72, $71, $72, $73, $6B, $6C   ; 

- D 0 - I - 0x014FE6 05:8FD6: FF        .byte $FF   ; change mode
@end:



_off025_00_8FD7_02:
- D 0 - I - 0x014FE7 05:8FD7: 25        .byte @end - * - $01   ; total data size

- D 0 - I - 0x014FE8 05:8FD8: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x014FE9 05:8FD9: 22 C0     .dbyt $22C0 ; ppu address
- D 0 - I - 0x014FEB 05:8FDB: 20        .byte $20   ; counter
- D 0 - I - 0x014FEC 05:8FDC: 30        .byte $30, $6D, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74   ; tiles
- D 0 - I - 0x014FFC 05:8FEC: 1E        .byte $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $30, $6D   ; 

- D 0 - I - 0x01500C 05:8FFC: FF        .byte $FF   ; change mode
@end:



_off025_00_8FFD_03:
- D 0 - I - 0x01500D 05:8FFD: 0A        .byte @end - * - $01   ; total data size

- D 0 - I - 0x01500E 05:8FFE: 03        .byte con_buf_mode_03   ; 

- D 0 - I - 0x01500F 05:8FFF: 22 E0     .dbyt $22E0 ; ppu address
- D 0 - I - 0x015011 05:9001: 24        .byte $24, $00   ; counter + fill tile

- D 0 - I - 0x015013 05:9003: 03        .byte con_buf_mode_03   ; 

- D 0 - I - 0x015014 05:9004: 23 E8     .dbyt $23E8 ; ppu address
- D 0 - I - 0x015016 05:9006: 08        .byte $08, $00   ; counter + fill tile
@end:



_off025_01_9008_00:
- D 0 - I - 0x015018 05:9008: 13        .byte @end - * - $01   ; total data size

- D 0 - I - 0x015019 05:9009: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x01501A 05:900A: 2E 80     .dbyt $2E80 ; ppu address
- D 0 - I - 0x01501C 05:900C: 03        .byte $03   ; counter
- D 0 - I - 0x01501D 05:900D: 3A        .byte $3A, $F0, $0C   ; tiles

- D 0 - I - 0x015020 05:9010: 2E 9D     .dbyt $2E9D ; ppu address
- D 0 - I - 0x015022 05:9012: 03        .byte $03   ; counter
- D 0 - I - 0x015023 05:9013: D5        .byte $D5, $3D, $3A   ; tiles

- D 0 - I - 0x015026 05:9016: FF        .byte $FF   ; change mode

- D 0 - I - 0x015027 05:9017: 03        .byte con_buf_mode_03   ; 

- D 0 - I - 0x015028 05:9018: 2E 83     .dbyt $2E83 ; ppu address
- D 0 - I - 0x01502A 05:901A: 1A        .byte $1A, $00   ; counter + fill tile
@end:



_off025_01_901C_01:
- D 0 - I - 0x01502C 05:901C: 13        .byte @end - * - $01   ; total data size

- D 0 - I - 0x01502D 05:901D: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x01502E 05:901E: 2E A0     .dbyt $2EA0 ; ppu address
- D 0 - I - 0x015030 05:9020: 03        .byte $03   ; counter
- D 0 - I - 0x015031 05:9021: F5        .byte $F5, $F6, $0C   ; tiles

- D 0 - I - 0x015034 05:9024: 2E BD     .dbyt $2EBD ; ppu address
- D 0 - I - 0x015036 05:9026: 03        .byte $03   ; counter
- D 0 - I - 0x015037 05:9027: D5        .byte $D5, $EE, $43   ; tiles

- D 0 - I - 0x01503A 05:902A: FF        .byte $FF   ; change mode

- D 0 - I - 0x01503B 05:902B: 03        .byte con_buf_mode_03   ; 

- D 0 - I - 0x01503C 05:902C: 2E A3     .dbyt $2EA3 ; ppu address
- D 0 - I - 0x01503E 05:902E: 1A        .byte $1A, $00   ; counter + fill tile
@end:



_off025_01_9030_02:
- D 0 - I - 0x015040 05:9030: 13        .byte @end - * - $01   ; total data size

- D 0 - I - 0x015041 05:9031: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x015042 05:9032: 2E C0     .dbyt $2EC0 ; ppu address
- D 0 - I - 0x015044 05:9034: 03        .byte $03   ; counter
- D 0 - I - 0x015045 05:9035: 3B        .byte $3B, $F7, $0C   ; tiles

- D 0 - I - 0x015048 05:9038: 2E DD     .dbyt $2EDD ; ppu address
- D 0 - I - 0x01504A 05:903A: 03        .byte $03   ; counter
- D 0 - I - 0x01504B 05:903B: D5        .byte $D5, $3E, $44   ; tiles

- D 0 - I - 0x01504E 05:903E: FF        .byte $FF   ; change mode

- D 0 - I - 0x01504F 05:903F: 03        .byte con_buf_mode_03   ; 

- D 0 - I - 0x015050 05:9040: 2E C3     .dbyt $2EC3 ; ppu address
- D 0 - I - 0x015052 05:9042: 1A        .byte $1A, $00   ; counter + fill tile
@end:



_off025_01_9044_03:
- D 0 - I - 0x015054 05:9044: 13        .byte @end - * - $01   ; total data size

- D 0 - I - 0x015055 05:9045: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x015056 05:9046: 2E E0     .dbyt $2EE0 ; ppu address
- D 0 - I - 0x015058 05:9048: 03        .byte $03   ; counter
- D 0 - I - 0x015059 05:9049: C5        .byte $C5, $F1, $1B   ; tiles

- D 0 - I - 0x01505C 05:904C: 2E FD     .dbyt $2EFD ; ppu address
- D 0 - I - 0x01505E 05:904E: 03        .byte $03   ; counter
- D 0 - I - 0x01505F 05:904F: D6        .byte $D6, $E9, $C5   ; tiles

- D 0 - I - 0x015062 05:9052: FF        .byte $FF   ; change mode

- D 0 - I - 0x015063 05:9053: 03        .byte con_buf_mode_03   ; 

- D 0 - I - 0x015064 05:9054: 2E E3     .dbyt $2EE3 ; ppu address
- D 0 - I - 0x015066 05:9056: 1A        .byte $1A, $00   ; counter + fill tile
@end:



_off025_02_9058_00:
- D 0 - I - 0x015068 05:9058: 15        .byte @end - * - $01   ; total data size

- D 0 - I - 0x015069 05:9059: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x01506A 05:905A: 2E 80     .dbyt $2E80 ; ppu address
- D 0 - I - 0x01506C 05:905C: 04        .byte $04   ; counter
- D 0 - I - 0x01506D 05:905D: 40        .byte $40, $40, $29, $6E   ; tiles

- D 0 - I - 0x015071 05:9061: 2E 9C     .dbyt $2E9C ; ppu address
- D 0 - I - 0x015073 05:9063: 04        .byte $04   ; counter
- D 0 - I - 0x015074 05:9064: 2A        .byte $2A, $6F, $40, $40   ; tiles

- D 0 - I - 0x015078 05:9068: FF        .byte $FF   ; change mode

- D 0 - I - 0x015079 05:9069: 03        .byte con_buf_mode_03   ; 

- D 0 - I - 0x01507A 05:906A: 2E 84     .dbyt $2E84 ; ppu address
- D 0 - I - 0x01507C 05:906C: 18        .byte $18, $2B   ; counter + fill tile
@end:



_off025_02_906E_01:
- D 0 - I - 0x01507E 05:906E: 25        .byte @end - * - $01   ; total data size

- D 0 - I - 0x01507F 05:906F: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x015080 05:9070: 2E A0     .dbyt $2EA0 ; ppu address
- D 0 - I - 0x015082 05:9072: 20        .byte $20   ; counter
- D 0 - I - 0x015083 05:9073: 6B        .byte $6B, $6C, $70, $71, $72, $71, $72, $71, $72, $71, $72, $71, $72, $71, $72, $71   ; tiles
- D 0 - I - 0x015093 05:9083: 72        .byte $72, $71, $72, $71, $72, $71, $72, $71, $72, $71, $72, $71, $72, $73, $6B, $6C   ; 

- D 0 - I - 0x0150A3 05:9093: FF        .byte $FF   ; change mode
@end:



_off025_02_9094_02:
- D 0 - I - 0x0150A4 05:9094: 25        .byte @end - * - $01   ; total data size

- D 0 - I - 0x0150A5 05:9095: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x0150A6 05:9096: 2E C0     .dbyt $2EC0 ; ppu address
- D 0 - I - 0x0150A8 05:9098: 20        .byte $20   ; counter
- D 0 - I - 0x0150A9 05:9099: 30        .byte $30, $6D, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74   ; tiles
- D 0 - I - 0x0150B9 05:90A9: 1E        .byte $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $1E, $74, $30, $6D   ; 
- D 0 - I - 0x0150C9 05:90B9: FF        .byte $FF   ; close buffer
@end:



_off025_02_90BA_03:
- D 0 - I - 0x0150CA 05:90BA: 0A        .byte @end - * - $01   ; total data size

- D 0 - I - 0x0150CB 05:90BB: 03        .byte con_buf_mode_03   ; 
- D 0 - I - 0x0150CC 05:90BC: 2E E0     .dbyt $2EE0 ; ppu address
- D 0 - I - 0x0150CE 05:90BE: 20        .byte $20, $00   ; counter + fill tile

- D 0 - I - 0x0150D0 05:90C0: 03        .byte con_buf_mode_03   ; 
- D 0 - I - 0x0150D1 05:90C1: 2F E8     .dbyt $2FE8 ; ppu address
- D 0 - I - 0x0150D3 05:90C3: 08        .byte $08, $00   ; counter + fill tile
@end:



sub_90C5:
C - - - - - 0x0150D5 05:90C5: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0150D8 05:90C8: 85 45     STA ram_0045
C - - - - - 0x0150DA 05:90CA: 18        CLC
C - - - - - 0x0150DB 05:90CB: 69 20     ADC #$20
C - - - - - 0x0150DD 05:90CD: 18        CLC
C - - - - - 0x0150DE 05:90CE: 65 FC     ADC ram_scroll_Y
C - - - - - 0x0150E0 05:90D0: B0 04     BCS bra_90D6
C - - - - - 0x0150E2 05:90D2: C9 F0     CMP #$F0
C - - - - - 0x0150E4 05:90D4: 90 02     BCC bra_90D8
bra_90D6:
C - - - - - 0x0150E6 05:90D6: 69 0F     ADC #$0F
bra_90D8:
C - - - - - 0x0150E8 05:90D8: 85 00     STA ram_0000
C - - - - - 0x0150EA 05:90DA: 29 07     AND #$07
C - - - - - 0x0150EC 05:90DC: 85 47     STA ram_0047
C - - - - - 0x0150EE 05:90DE: A9 1F     LDA #$1F
C - - - - - 0x0150F0 05:90E0: 38        SEC
C - - - - - 0x0150F1 05:90E1: E5 47     SBC ram_0047
C - - - - - 0x0150F3 05:90E3: 85 46     STA ram_0046
C - - - - - 0x0150F5 05:90E5: A9 09     LDA #$09
C - - - - - 0x0150F7 05:90E7: 85 4B     STA ram_004B
C - - - - - 0x0150F9 05:90E9: A5 00     LDA ram_0000
C - - - - - 0x0150FB 05:90EB: 29 F8     AND #$F8
C - - - - - 0x0150FD 05:90ED: 0A        ASL
C - - - - - 0x0150FE 05:90EE: 26 4B     ROL ram_004B
C - - - - - 0x015100 05:90F0: 0A        ASL
C - - - - - 0x015101 05:90F1: 26 4B     ROL ram_004B
C - - - - - 0x015103 05:90F3: 85 4A     STA ram_004A
C - - - - - 0x015105 05:90F5: A9 A0     LDA #$A0
C - - - - - 0x015107 05:90F7: 38        SEC
C - - - - - 0x015108 05:90F8: FD 22 05  SBC ram_pos_Y_hi_enemy,X
C - - - - - 0x01510B 05:90FB: 85 F9     STA ram_00F9
C - - - - - 0x01510D 05:90FD: 60        RTS



_off001_0x01510E_40_mob_winged:
- D 0 - I - 0x01510E 05:90FE: 12 91     .word ofs_038_40_9112_01_initialize_object ; 
- D 0 - I - 0x015110 05:9100: 40 91     .word ofs_038_40_9140_02 ; 
- D 0 - I - 0x015112 05:9102: CC 91     .word ofs_038_40_91CC_03 ; 
- D 0 - I - 0x015114 05:9104: 05 92     .word ofs_038_40_9205_04 ; 
- D 0 - I - 0x015116 05:9106: 4C 92     .word ofs_038_40_924C_05 ; 
- D 0 - I - 0x015118 05:9108: 70 92     .word ofs_038_40_9270_06 ; 
- D 0 - I - 0x01511A 05:910A: 75 92     .word ofs_038_40_9275_07 ; 
- D 0 - I - 0x01511C 05:910C: 9A A2     .word ofs_038_40_0x0062AA_08 ; 
- D 0 - I - 0x01511E 05:910E: FD A2     .word ofs_038_40_0x00630D_09 ; 
- D 0 - I - 0x015120 05:9110: 3D A3     .word ofs_038_40_0x00634D_0A_delete_object_04 ; 



ofs_038_40_9112_01_initialize_object:
C - - J - - 0x015122 05:9112: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x015125 05:9115: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x015128 05:9118: 29 01     AND #$01
C - - - - - 0x01512A 05:911A: 9D 1E 07  STA ram_obj_flags,X
sub_911D:
C - - - - - 0x01512D 05:911D: 0A        ASL
C - - - - - 0x01512E 05:911E: A8        TAY
C - - - - - 0x01512F 05:911F: B9 3C 91  LDA tbl_913C_spd_X,Y
C - - - - - 0x015132 05:9122: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x015135 05:9125: B9 3D 91  LDA tbl_913C_spd_X + $01,Y
C - - - - - 0x015138 05:9128: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x01513B 05:912B: 20 31 91  JSR sub_9131
C - - - - - 0x01513E 05:912E: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



sub_9131:
C - - - - - 0x015141 05:9131: 0A        ASL
C - - - - - 0x015142 05:9132: A9 41     LDA #$41
C - - - - - 0x015144 05:9134: B0 02     BCS bra_9138
C - - - - - 0x015146 05:9136: A9 01     LDA #$01
bra_9138:
C - - - - - 0x015148 05:9138: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x01514B 05:913B: 60        RTS



tbl_913C_spd_X:
- D 0 - - - 0x01514C 05:913C: 00 FF     .word $FF00 ; 00 
- D 0 - - - 0x01514E 05:913E: 00 01     .word $0100 ; 01 



ofs_038_40_9140_02:
C - - J - - 0x015150 05:9140: A9 12     LDA #$12
C - - - - - 0x015152 05:9142: 20 00 A8  JSR sub_0x006810
C - - - - - 0x015155 05:9145: F0 79     BEQ bra_91C0
C - - - - - 0x015157 05:9147: 20 3D A8  JSR sub_0x00684D
C - - - - - 0x01515A 05:914A: A5 03     LDA ram_0003
C - - - - - 0x01515C 05:914C: 29 01     AND #$01
C - - - - - 0x01515E 05:914E: 85 03     STA ram_0003
C - - - - - 0x015160 05:9150: A9 01     LDA #$01
C - - - - - 0x015162 05:9152: BC CA 06  LDY ram_spd_X_hi_obj,X
C - - - - - 0x015165 05:9155: 10 02     BPL bra_9159
C - - - - - 0x015167 05:9157: A9 FF     LDA #$FF
bra_9159:
C - - - - - 0x015169 05:9159: 85 08     STA ram_0008
C - - - - - 0x01516B 05:915B: 18        CLC
C - - - - - 0x01516C 05:915C: 65 03     ADC ram_0003
C - - - - - 0x01516E 05:915E: C9 02     CMP #$02
C - - - - - 0x015170 05:9160: 29 01     AND #$01
C - - - - - 0x015172 05:9162: 85 03     STA ram_0003
C - - - - - 0x015174 05:9164: A5 04     LDA ram_0004
C - - - - - 0x015176 05:9166: 90 03     BCC bra_916B
C - - - - - 0x015178 05:9168: 18        CLC
C - - - - - 0x015179 05:9169: 65 08     ADC ram_0008
bra_916B:
C - - - - - 0x01517B 05:916B: A8        TAY
C - - - - - 0x01517C 05:916C: 20 1B BB  JSR sub_0x007B2B
C - - - - - 0x01517F 05:916F: F0 4F     BEQ bra_91C0
C - - - - - 0x015181 05:9171: A9 08     LDA #$08
C - - - - - 0x015183 05:9173: BC CA 06  LDY ram_spd_X_hi_obj,X
C - - - - - 0x015186 05:9176: 10 02     BPL bra_917A
C - - - - - 0x015188 05:9178: A9 F8     LDA #$F8
bra_917A:
C - - - - - 0x01518A 05:917A: 20 22 A8  JSR sub_0x006832
C - - - - - 0x01518D 05:917D: F0 09     BEQ bra_9188
C - - - - - 0x01518F 05:917F: 20 DC A7  JSR sub_0x0067EC_inverse_spd_X
C - - - - - 0x015192 05:9182: 20 31 91  JSR sub_9131
C - - - - - 0x015195 05:9185: FE 48 07  INC ram_0748_obj,X
bra_9188:
C - - - - - 0x015198 05:9188: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x01519B 05:918B: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01519E 05:918E: 38        SEC
C - - - - - 0x01519F 05:918F: F9 32 05  SBC ram_pos_Y_hi_plr,Y
C - - - - - 0x0151A2 05:9192: B0 04     BCS bra_9198
C - - - - - 0x0151A4 05:9194: 49 FF     EOR #$FF
C - - - - - 0x0151A6 05:9196: 69 01     ADC #$01
bra_9198:
C - - - - - 0x0151A8 05:9198: C9 08     CMP #$08
C - - - - - 0x0151AA 05:919A: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0151AD 05:919D: B0 04     BCS bra_91A3
C - - - - - 0x0151AF 05:919F: C9 02     CMP #$02
C - - - - - 0x0151B1 05:91A1: 90 15     BCC bra_91B8
bra_91A3:
C - - - - - 0x0151B3 05:91A3: C9 03     CMP #$03
C - - - - - 0x0151B5 05:91A5: B0 19     BCS bra_91C0
C - - - - - 0x0151B7 05:91A7: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0151BA 05:91AA: 38        SEC
C - - - - - 0x0151BB 05:91AB: F9 4C 05  SBC ram_pos_X_hi_plr,Y
C - - - - - 0x0151BE 05:91AE: B0 04     BCS bra_91B4
C - - - - - 0x0151C0 05:91B0: 49 FF     EOR #$FF
C - - - - - 0x0151C2 05:91B2: 69 01     ADC #$01
bra_91B4:
C - - - - - 0x0151C4 05:91B4: C9 28     CMP #$28
C - - - - - 0x0151C6 05:91B6: 90 08     BCC bra_91C0
bra_91B8:
C - - - - - 0x0151C8 05:91B8: A0 07     LDY #$07
C - - - - - 0x0151CA 05:91BA: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x0151CD 05:91BD: 4C 07 A7  JMP loc_0x006717
bra_91C0:
C - - - - - 0x0151D0 05:91C0: 20 C7 A7  JSR sub_0x0067D7_clear_spd_XY
C - - - - - 0x0151D3 05:91C3: 20 07 A7  JSR sub_0x006717
C - - - - - 0x0151D6 05:91C6: A9 10     LDA #$10
C - - - - - 0x0151D8 05:91C8: 4C E0 A2  JMP loc_0x0062F0



bra_91CB_RTS:
C - - - - - 0x0151DB 05:91CB: 60        RTS



ofs_038_40_91CC_03:
C - - J - - 0x0151DC 05:91CC: 20 7A 92  JSR sub_927A
C - - - - - 0x0151DF 05:91CF: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0151E2 05:91D2: D0 F7     BNE bra_91CB_RTS
C - - - - - 0x0151E4 05:91D4: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0151E7 05:91D7: CD 4C 05  CMP ram_pos_X_hi_plr
C - - - - - 0x0151EA 05:91DA: A0 00     LDY #$00
C - - - - - 0x0151EC 05:91DC: B0 02     BCS bra_91E0
C - - - - - 0x0151EE 05:91DE: A0 04     LDY #$04
bra_91E0:
C - - - - - 0x0151F0 05:91E0: B9 FD 91  LDA tbl_91FD_speed,Y
C - - - - - 0x0151F3 05:91E3: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x0151F6 05:91E6: B9 FE 91  LDA tbl_91FD_speed + $01,Y
C - - - - - 0x0151F9 05:91E9: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x0151FC 05:91EC: B9 FF 91  LDA tbl_91FD_speed + $02,Y
C - - - - - 0x0151FF 05:91EF: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x015202 05:91F2: B9 00 92  LDA tbl_91FD_speed + $03,Y
C - - - - - 0x015205 05:91F5: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x015208 05:91F8: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state


; bzk garbage
- - - - - - 0x01520B 05:91FB: 01        .byte $01   ; 
- - - - - - 0x01520C 05:91FC: 02        .byte $02   ; 



tbl_91FD_speed:
; 00 
- D 0 - - - 0x01520D 05:91FD: 80 FE     .word $FE80 ; Y
- D 0 - - - 0x01520F 05:91FF: 40 FF     .word $FF40 ; X
; 04 
- D 0 - - - 0x015211 05:9201: 80 FE     .word $FE80 ; Y
- D 0 - - - 0x015213 05:9203: C0 00     .word $00C0 ; X



ofs_038_40_9205_04:
C - - J - - 0x015215 05:9205: A9 6C     LDA #$6C
C - - - - - 0x015217 05:9207: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x01521A 05:920A: 20 07 A7  JSR sub_0x006717
C - - - - - 0x01521D 05:920D: BD A0 06  LDA ram_spd_Y_lo_obj,X
C - - - - - 0x015220 05:9210: 18        CLC
C - - - - - 0x015221 05:9211: 69 18     ADC #< $0018
C - - - - - 0x015223 05:9213: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x015226 05:9216: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x015229 05:9219: 69 00     ADC #> $0018
C - - - - - 0x01522B 05:921B: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x01522E 05:921E: A9 08     LDA #$08
C - - - - - 0x015230 05:9220: BC CA 06  LDY ram_spd_X_hi_obj,X
C - - - - - 0x015233 05:9223: 10 02     BPL bra_9227
C - - - - - 0x015235 05:9225: A9 F8     LDA #$F8
bra_9227:
C - - - - - 0x015237 05:9227: 20 22 A8  JSR sub_0x006832
C - - - - - 0x01523A 05:922A: F0 06     BEQ bra_9232
C - - - - - 0x01523C 05:922C: 20 DC A7  JSR sub_0x0067EC_inverse_spd_X
C - - - - - 0x01523F 05:922F: FE 48 07  INC ram_0748_obj,X
bra_9232:
C - - - - - 0x015242 05:9232: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x015245 05:9235: C9 02     CMP #$02
C - - - - - 0x015247 05:9237: 90 12     BCC bra_924B_RTS
C - - - - - 0x015249 05:9239: A9 12     LDA #$12
C - - - - - 0x01524B 05:923B: 20 00 A8  JSR sub_0x006810
C - - - - - 0x01524E 05:923E: F0 0B     BEQ bra_924B_RTS
C - - - - - 0x015250 05:9240: 20 3D A8  JSR sub_0x00684D
C - - - - - 0x015253 05:9243: 20 C7 A7  JSR sub_0x0067D7_clear_spd_XY
C - - - - - 0x015256 05:9246: A9 08     LDA #$08
C - - - - - 0x015258 05:9248: 4C E0 A2  JMP loc_0x0062F0
bra_924B_RTS:
C - - - - - 0x01525B 05:924B: 60        RTS



ofs_038_40_924C_05:
C - - J - - 0x01525C 05:924C: 20 7A 92  JSR sub_927A
C - - - - - 0x01525F 05:924F: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x015262 05:9252: D0 F7     BNE bra_924B_RTS
C - - - - - 0x015264 05:9254: A9 00     LDA #$00
C - - - - - 0x015266 05:9256: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x015269 05:9259: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x01526C 05:925C: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01526F 05:925F: D9 4C 05  CMP ram_pos_X_hi_plr,Y
C - - - - - 0x015272 05:9262: A9 00     LDA #$00
C - - - - - 0x015274 05:9264: B0 02     BCS bra_9268
C - - - - - 0x015276 05:9266: A9 01     LDA #$01
bra_9268:
C - - - - - 0x015278 05:9268: 20 1D 91  JSR sub_911D
C - - - - - 0x01527B 05:926B: A9 02     LDA #$02
C - - - - - 0x01527D 05:926D: 4C 83 A2  JMP loc_0x006293_set_obj_state



ofs_038_40_9270_06:
C - - J - - 0x015280 05:9270: A9 6C     LDA #$6C    ; animation id
C - - - - - 0x015282 05:9272: 4C 3B B1  JMP loc_0x00714B



ofs_038_40_9275_07:
C - - J - - 0x015285 05:9275: A9 6C     LDA #$6C    ; animation id
C - - - - - 0x015287 05:9277: 4C 79 B1  JMP loc_0x007189



sub_927A:
C - - - - - 0x01528A 05:927A: A9 6B     LDA #$6B
C - - - - - 0x01528C 05:927C: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x01528F 05:927F: 20 07 A7  JSR sub_0x006717
C - - - - - 0x015292 05:9282: A9 12     LDA #$12
C - - - - - 0x015294 05:9284: 20 00 A8  JSR sub_0x006810
C - - - - - 0x015297 05:9287: F0 03     BEQ bra_928C_RTS
C - - - - - 0x015299 05:9289: 20 3D A8  JSR sub_0x00684D
bra_928C_RTS:
C - - - - - 0x01529C 05:928C: 60        RTS



_off001_0x01529D_41_spawner_winged_mobs:
- D 0 - I - 0x01529D 05:928D: 91 92     .word ofs_038_41_9291_01_initialize_object ; 
- D 0 - I - 0x01529F 05:928F: 9E 92     .word ofs_038_41_929E_02 ; 



ofs_038_41_9291_01_initialize_object:
C - - J - - 0x0152A1 05:9291: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0152A4 05:9294: A9 03     LDA #$03
C - - - - - 0x0152A6 05:9296: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0152A9 05:9299: A9 01     LDA #$01
C - - - - - 0x0152AB 05:929B: 4C E0 A2  JMP loc_0x0062F0



ofs_038_41_929E_02:
C - - J - - 0x0152AE 05:929E: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0152B1 05:92A1: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0152B4 05:92A4: C9 10     CMP #$10
C - - - - - 0x0152B6 05:92A6: 90 1F     BCC bra_92C7_RTS
C - - - - - 0x0152B8 05:92A8: C9 A0     CMP #$A0
C - - - - - 0x0152BA 05:92AA: B0 1C     BCS bra_92C8
C - - - - - 0x0152BC 05:92AC: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0152BF 05:92AF: D0 16     BNE bra_92C7_RTS
C - - - - - 0x0152C1 05:92B1: A9 30     LDA #$30
C - - - - - 0x0152C3 05:92B3: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x0152C6 05:92B6: D0 07     BNE bra_92BF
C - - - - - 0x0152C8 05:92B8: A9 03     LDA #$03
C - - - - - 0x0152CA 05:92BA: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0152CD 05:92BD: A9 F0     LDA #$F0
bra_92BF:
C - - - - - 0x0152CF 05:92BF: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x0152D2 05:92C2: A0 40     LDY #con_obj_id_40
C - - - - - 0x0152D4 05:92C4: 20 C8 AB  JSR sub_0x006BD8
bra_92C7_RTS:
C - - - - - 0x0152D7 05:92C7: 60        RTS
bra_92C8:
C - - - - - 0x0152D8 05:92C8: 4C 75 A2  JMP loc_0x006285_delete_object_02



_off001_0x0152DB_43_boss_4_gun:
- D 0 - I - 0x0152DB 05:92CB: DB 92     .word ofs_038_43_92DB_01_initialize_object ; 
- D 0 - I - 0x0152DD 05:92CD: EA 92     .word ofs_038_43_92EA_02 ; 
- D 0 - I - 0x0152DF 05:92CF: 09 93     .word ofs_038_43_9309_03 ; 
- D 0 - I - 0x0152E1 05:92D1: 33 93     .word ofs_038_43_9333_04 ; 
- D 0 - I - 0x0152E3 05:92D3: 44 93     .word ofs_038_43_9344_05 ; 
- D 0 - I - 0x0152E5 05:92D5: 51 93     .word ofs_038_43_9351_06 ; 
- D 0 - I - 0x0152E7 05:92D7: 88 93     .word ofs_038_43_9388_07 ; 
- D 0 - I - 0x0152E9 05:92D9: 8E 93     .word ofs_038_43_938E_08 ; 



ofs_038_43_92DB_01_initialize_object:
C - - J - - 0x0152EB 05:92DB: A9 03     LDA #$03
C - - - - - 0x0152ED 05:92DD: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0152F0 05:92E0: A9 10     LDA #$10
C - - - - - 0x0152F2 05:92E2: A0 06     LDY #$06
C - - - - - 0x0152F4 05:92E4: 20 9B AB  JSR sub_0x006BAB_set_dynamic_hp_to_obj
C - - - - - 0x0152F7 05:92E7: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_43_92EA_02:
C - - J - - 0x0152FA 05:92EA: A9 01     LDA #$01
C - - - - - 0x0152FC 05:92EC: 20 96 93  JSR sub_9396
C - - - - - 0x0152FF 05:92EF: BC 80 07  LDY ram_0780_obj,X
C - - - - - 0x015302 05:92F2: B9 72 07  LDA ram_0772_obj,Y
C - - - - - 0x015305 05:92F5: 10 11     BPL bra_9308_RTS
C - - - - - 0x015307 05:92F7: C9 FF     CMP #$FF
C - - - - - 0x015309 05:92F9: F0 0D     BEQ bra_9308_RTS
C - - - - - 0x01530B 05:92FB: 29 7F     AND #$7F
C - - - - - 0x01530D 05:92FD: DD 1E 07  CMP ram_obj_flags,X
C - - - - - 0x015310 05:9300: D0 06     BNE bra_9308_RTS
C - - - - - 0x015312 05:9302: 99 72 07  STA ram_0772_obj,Y
C - - - - - 0x015315 05:9305: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_9308_RTS:
C - - - - - 0x015318 05:9308: 60        RTS



ofs_038_43_9309_03:
C - - J - - 0x015319 05:9309: 20 94 93  JSR sub_9394
C - - - - - 0x01531C 05:930C: FE 48 07  INC ram_0748_obj,X
C - - - - - 0x01531F 05:930F: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x015322 05:9312: C9 0F     CMP #$0F
C - - - - - 0x015324 05:9314: 90 F2     BCC bra_9308_RTS
C - - - - - 0x015326 05:9316: A0 44     LDY #con_obj_id_44
C - - - - - 0x015328 05:9318: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x01532B 05:931B: 90 06     BCC bra_9323
C - - - - - 0x01532D 05:931D: A4 11     LDY ram_0011
C - - - - - 0x01532F 05:931F: 8A        TXA
C - - - - - 0x015330 05:9320: 99 80 07  STA ram_0780_obj,Y
bra_9323:
C - - - - - 0x015333 05:9323: BD 76 06  LDA ram_obj_hp,X
C - - - - - 0x015336 05:9326: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x015339 05:9329: A9 F0     LDA #con__hp_F0
C - - - - - 0x01533B 05:932B: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x01533E 05:932E: A9 10     LDA #$10
C - - - - - 0x015340 05:9330: 4C E0 A2  JMP loc_0x0062F0



ofs_038_43_9333_04:
C - - J - - 0x015343 05:9333: 20 94 93  JSR sub_9394
C - - - - - 0x015346 05:9336: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x015349 05:9339: D0 CD     BNE bra_9308_RTS
C - - - - - 0x01534B 05:933B: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x01534E 05:933E: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x015351 05:9341: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_43_9344_05:
C - - J - - 0x015354 05:9344: 20 94 93  JSR sub_9394
C - - - - - 0x015357 05:9347: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x01535A 05:934A: D0 BC     BNE bra_9308_RTS
C - - - - - 0x01535C 05:934C: A9 02     LDA #$02
C - - - - - 0x01535E 05:934E: 4C 83 A2  JMP loc_0x006293_set_obj_state



ofs_038_43_9351_06:
C - - J - - 0x015361 05:9351: BD 80 07  LDA ram_0780_obj,X
C - - - - - 0x015364 05:9354: AA        TAX
C - - - - - 0x015365 05:9355: DE 64 07  DEC ram_0764_obj,X
C - - - - - 0x015368 05:9358: A6 10     LDX ram_0010
C - - - - - 0x01536A 05:935A: BC 1E 07  LDY ram_obj_flags,X
C - - - - - 0x01536D 05:935D: C0 08     CPY #$08
C - - - - - 0x01536F 05:935F: D0 0A     BNE bra_936B
; 08
C - - - - - 0x015371 05:9361: BC 80 07  LDY ram_0780_obj,X
C - - - - - 0x015374 05:9364: A9 00     LDA #$00
C - - - - - 0x015376 05:9366: 99 10 07  STA ram_0710_obj,Y
C - - - - - 0x015379 05:9369: F0 0C     BEQ bra_9377    ; jmp
bra_936B:
C - - - - - 0x01537B 05:936B: B9 80 93  LDA tbl_9380,Y
C - - - - - 0x01537E 05:936E: BC 80 07  LDY ram_0780_obj,X
C - - - - - 0x015381 05:9371: 39 02 07  AND ram_0702_obj,Y
C - - - - - 0x015384 05:9374: 99 02 07  STA ram_0702_obj,Y
bra_9377:
C - - - - - 0x015387 05:9377: 20 99 93  JSR sub_9399
C - - - - - 0x01538A 05:937A: 20 E4 93  JSR sub_93E4
C - - - - - 0x01538D 05:937D: 4C 9A A2  JMP loc_0x0062AA



tbl_9380:
- D 0 - - - 0x015390 05:9380: 7F        .byte $7F   ; 00 
- D 0 - - - 0x015391 05:9381: BF        .byte $BF   ; 01 
- D 0 - - - 0x015392 05:9382: DF        .byte $DF   ; 02 
- D 0 - - - 0x015393 05:9383: EF        .byte $EF   ; 03 
- D 0 - - - 0x015394 05:9384: F7        .byte $F7   ; 04 
- D 0 - - - 0x015395 05:9385: FB        .byte $FB   ; 05 
- D 0 - - - 0x015396 05:9386: FD        .byte $FD   ; 06 
- D 0 - - - 0x015397 05:9387: FE        .byte $FE   ; 07 



ofs_038_43_9388_07:
C - - J - - 0x015398 05:9388: 20 99 93  JSR sub_9399
C - - - - - 0x01539B 05:938B: 4C FD A2  JMP loc_0x00630D



ofs_038_43_938E_08:
C - - J - - 0x01539E 05:938E: 20 99 93  JSR sub_9399
C - - - - - 0x0153A1 05:9391: 4C 3D A3  JMP loc_0x00634D_delete_object_04



sub_9394:
C - - - - - 0x0153A4 05:9394: A9 63     LDA #$63
sub_9396:
C - - - - - 0x0153A6 05:9396: 9D 08 05  STA ram_anim_id_enemy,X
sub_9399:
C - - - - - 0x0153A9 05:9399: BC 1E 07  LDY ram_obj_flags,X
C - - - - - 0x0153AC 05:939C: B9 DB 93  LDA tbl_93DB,Y
C - - - - - 0x0153AF 05:939F: 85 09     STA ram_0009
C - - - - - 0x0153B1 05:93A1: 0A        ASL
C - - - - - 0x0153B2 05:93A2: A9 00     LDA #$00
C - - - - - 0x0153B4 05:93A4: 90 02     BCC bra_93A8
C - - - - - 0x0153B6 05:93A6: A9 FF     LDA #$FF
bra_93A8:
C - - - - - 0x0153B8 05:93A8: 85 0B     STA ram_000B
C - - - - - 0x0153BA 05:93AA: BC 80 07  LDY ram_0780_obj,X
C - - - - - 0x0153BD 05:93AD: A5 09     LDA ram_0009
C - - - - - 0x0153BF 05:93AF: 18        CLC
C - - - - - 0x0153C0 05:93B0: 79 3C 05  ADC ram_pos_X_hi_enemy,Y
C - - - - - 0x0153C3 05:93B3: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0153C6 05:93B6: A5 0B     LDA ram_000B
C - - - - - 0x0153C8 05:93B8: 79 9C 07  ADC ram_079C_obj,Y
C - - - - - 0x0153CB 05:93BB: 9D 9C 07  STA ram_079C_obj,X
C - - - - - 0x0153CE 05:93BE: D0 18     BNE bra_93D8
C - - - - - 0x0153D0 05:93C0: A9 18     LDA #$18
C - - - - - 0x0153D2 05:93C2: 18        CLC
C - - - - - 0x0153D3 05:93C3: 7D 48 07  ADC ram_0748_obj,X
C - - - - - 0x0153D6 05:93C6: 18        CLC
C - - - - - 0x0153D7 05:93C7: 79 22 05  ADC ram_pos_Y_hi_enemy,Y
C - - - - - 0x0153DA 05:93CA: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0153DD 05:93CD: A9 00     LDA #$00
C - - - - - 0x0153DF 05:93CF: 79 8E 07  ADC ram_078E_obj,Y
C - - - - - 0x0153E2 05:93D2: 9D 8E 07  STA ram_078E_obj,X
C - - - - - 0x0153E5 05:93D5: D0 01     BNE bra_93D8
C - - - - - 0x0153E7 05:93D7: 60        RTS
bra_93D8:
C - - - - - 0x0153E8 05:93D8: 4C 7D A2  JMP loc_0x00628D_clear_anim_id



tbl_93DB:
- D 0 - - - 0x0153EB 05:93DB: C0        .byte $C0   ; 00 
- D 0 - - - 0x0153EC 05:93DC: D0        .byte $D0   ; 01 
- D 0 - - - 0x0153ED 05:93DD: E0        .byte $E0   ; 02 
- D 0 - - - 0x0153EE 05:93DE: F0        .byte $F0   ; 03 
- D 0 - - - 0x0153EF 05:93DF: 00        .byte $00   ; 04 
- D 0 - - - 0x0153F0 05:93E0: 10        .byte $10   ; 05 
- D 0 - - - 0x0153F1 05:93E1: 20        .byte $20   ; 06 
- D 0 - - - 0x0153F2 05:93E2: 30        .byte $30   ; 07 
- D 0 - - - 0x0153F3 05:93E3: 40        .byte $40   ; 08 



sub_93E4:
C - - - - - 0x0153F4 05:93E4: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0153F7 05:93E7: 0A        ASL
C - - - - - 0x0153F8 05:93E8: 85 08     STA ram_0008
C - - - - - 0x0153FA 05:93EA: A0 00     LDY #$00
C - - - - - 0x0153FC 05:93EC: A6 1E     LDX ram_index_ppu_buffer
bra_93EE_loop:
C - - - - - 0x0153FE 05:93EE: B9 08 94  LDA tbl_9408,Y
C - - - - - 0x015401 05:93F1: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x015404 05:93F4: E8        INX
C - - - - - 0x015405 05:93F5: C8        INY
C - - - - - 0x015406 05:93F6: C9 FF     CMP #$FF
C - - - - - 0x015408 05:93F8: D0 F4     BNE bra_93EE_loop
C - - - - - 0x01540A 05:93FA: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x01540C 05:93FC: BD FB 02  LDA ram_nmt_buffer - $05,X
C - - - - - 0x01540F 05:93FF: 18        CLC
C - - - - - 0x015410 05:9400: 65 08     ADC ram_0008
C - - - - - 0x015412 05:9402: 9D FB 02  STA ram_nmt_buffer - $05,X
C - - - - - 0x015415 05:9405: A6 10     LDX ram_0010
C - - - - - 0x015417 05:9407: 60        RTS



tbl_9408:
- D 0 - - - 0x015418 05:9408: 07        .byte con_buf_mode_07   ; 

- D 0 - - - 0x015419 05:9409: 20 87     .dbyt $2087 ; ppu
- D 0 - - - 0x01541B 05:940B: 02        .byte $02   ; counter
- D 0 - - - 0x01541C 05:940C: FE        .byte $FE, $00   ; tiles

- D 0 - - - 0x01541E 05:940E: FF        .byte $FF   ; end token



_off001_0x01541F_44_boss_4_bullet:
- D 0 - I - 0x01541F 05:940F: 15 94     .word ofs_038_44_9415_01_initialize_object ; 
- D 0 - I - 0x015421 05:9411: 38 94     .word ofs_038_44_9438_02 ; 
- D 0 - I - 0x015423 05:9413: 58 94     .word ofs_038_44_9458_03 ; 



ofs_038_44_9415_01_initialize_object:
C - - J - - 0x015425 05:9415: A9 80     LDA #$80
C - - - - - 0x015427 05:9417: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x01542A 05:941A: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01542D 05:941D: 18        CLC
C - - - - - 0x01542E 05:941E: 69 08     ADC #$08
C - - - - - 0x015430 05:9420: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x015433 05:9423: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x015436 05:9426: A9 00     LDA #< $0800
C - - - - - 0x015438 05:9428: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x01543B 05:942B: A9 08     LDA #> $0800
C - - - - - 0x01543D 05:942D: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x015440 05:9430: A9 10     LDA #con_sound_10
C - - - - - 0x015442 05:9432: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x015445 05:9435: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_44_9438_02:
C - - J - - 0x015448 05:9438: 20 6A 94  JSR sub_946A
C - - - - - 0x01544B 05:943B: A9 D2     LDA #$D2
C - - - - - 0x01544D 05:943D: 20 7C 94  JSR sub_947C
C - - - - - 0x015450 05:9440: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x015453 05:9443: C9 E0     CMP #$E0
C - - - - - 0x015455 05:9445: B0 07     BCS bra_944E
C - - - - - 0x015457 05:9447: A9 00     LDA #$00
C - - - - - 0x015459 05:9449: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x01545C 05:944C: F0 09     BEQ bra_9457_RTS
bra_944E:
C - - - - - 0x01545E 05:944E: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x015461 05:9451: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x015464 05:9454: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_9457_RTS:
C - - - - - 0x015467 05:9457: 60        RTS



ofs_038_44_9458_03:
C - - J - - 0x015468 05:9458: 20 6A 94  JSR sub_946A
C - - - - - 0x01546B 05:945B: A9 00     LDA #$00
C - - - - - 0x01546D 05:945D: 20 7C 94  JSR sub_947C
C - - - - - 0x015470 05:9460: A9 00     LDA #$00
C - - - - - 0x015472 05:9462: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x015475 05:9465: F0 F0     BEQ bra_9457_RTS
C - - - - - 0x015477 05:9467: 4C 75 A2  JMP loc_0x006285_delete_object_02



sub_946A:
C - - - - - 0x01547A 05:946A: A9 01     LDA #$01
C - - - - - 0x01547C 05:946C: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x01547F 05:946F: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x015482 05:9472: BC 80 07  LDY ram_0780_obj,X
C - - - - - 0x015485 05:9475: B9 3C 05  LDA ram_pos_X_hi_enemy,Y
C - - - - - 0x015488 05:9478: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x01548B 05:947B: 60        RTS



sub_947C:
C - - - - - 0x01548C 05:947C: 85 08     STA ram_0008
C - - - - - 0x01548E 05:947E: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x015491 05:9481: 18        CLC
C - - - - - 0x015492 05:9482: 65 FA     ADC ram_00FA
C - - - - - 0x015494 05:9484: 4A        LSR
C - - - - - 0x015495 05:9485: 4A        LSR
C - - - - - 0x015496 05:9486: 4A        LSR
C - - - - - 0x015497 05:9487: 85 00     STA ram_0000
C - - - - - 0x015499 05:9489: A5 FB     LDA ram_00FB
C - - - - - 0x01549B 05:948B: 4A        LSR
C - - - - - 0x01549C 05:948C: 4A        LSR
C - - - - - 0x01549D 05:948D: A9 08     LDA #$08
C - - - - - 0x01549F 05:948F: 90 02     BCC bra_9493
- - - - - - 0x0154A1 05:9491: A9 0A     LDA #$0A
bra_9493:
C - - - - - 0x0154A3 05:9493: 85 01     STA ram_0001
C - - - - - 0x0154A5 05:9495: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0154A8 05:9498: 18        CLC
C - - - - - 0x0154A9 05:9499: 65 F9     ADC ram_00F9
C - - - - - 0x0154AB 05:949B: B0 04     BCS bra_94A1
- - - - - - 0x0154AD 05:949D: C9 F0     CMP #$F0
- - - - - - 0x0154AF 05:949F: 90 0A     BCC bra_94AB
bra_94A1:
C - - - - - 0x0154B1 05:94A1: 69 0F     ADC #$0F
C - - - - - 0x0154B3 05:94A3: A8        TAY
C - - - - - 0x0154B4 05:94A4: A5 01     LDA ram_0001
C - - - - - 0x0154B6 05:94A6: 49 02     EOR #$02
C - - - - - 0x0154B8 05:94A8: 85 01     STA ram_0001
C - - - - - 0x0154BA 05:94AA: 98        TYA
bra_94AB:
C - - - - - 0x0154BB 05:94AB: 29 F8     AND #$F8
C - - - - - 0x0154BD 05:94AD: 0A        ASL
C - - - - - 0x0154BE 05:94AE: 26 01     ROL ram_0001
C - - - - - 0x0154C0 05:94B0: 0A        ASL
C - - - - - 0x0154C1 05:94B1: 26 01     ROL ram_0001
C - - - - - 0x0154C3 05:94B3: 18        CLC
C - - - - - 0x0154C4 05:94B4: 65 00     ADC ram_0000
C - - - - - 0x0154C6 05:94B6: 85 00     STA ram_0000
C - - - - - 0x0154C8 05:94B8: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x0154CA 05:94BA: A9 06     LDA #con_buf_mode_06
C - - - - - 0x0154CC 05:94BC: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0154CF 05:94BF: E8        INX
C - - - - - 0x0154D0 05:94C0: A5 01     LDA ram_0001    ; ppu hi
C - - - - - 0x0154D2 05:94C2: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0154D5 05:94C5: E8        INX
C - - - - - 0x0154D6 05:94C6: A5 00     LDA ram_0000    ; ppu lo
C - - - - - 0x0154D8 05:94C8: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0154DB 05:94CB: E8        INX
C - - - - - 0x0154DC 05:94CC: A9 01     LDA #$01    ; counter
C - - - - - 0x0154DE 05:94CE: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0154E1 05:94D1: E8        INX
C - - - - - 0x0154E2 05:94D2: A5 08     LDA ram_0008    ; tile
C - - - - - 0x0154E4 05:94D4: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0154E7 05:94D7: E8        INX
C - - - - - 0x0154E8 05:94D8: A9 FF     LDA #$FF    ; close buffer
C - - - - - 0x0154EA 05:94DA: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0154ED 05:94DD: E8        INX
C - - - - - 0x0154EE 05:94DE: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x0154F0 05:94E0: A6 10     LDX ram_0010
C - - - - - 0x0154F2 05:94E2: 60        RTS



_off001_0x0154F3_6B_blue_bubble:
- D 0 - I - 0x0154F3 05:94E3: EF 94     .word ofs_038_6B_94EF_01_initialize_object ; 
- D 0 - I - 0x0154F5 05:94E5: 40 95     .word ofs_038_6B_9540_02 ; 
- D 0 - I - 0x0154F7 05:94E7: 71 95     .word ofs_038_6B_9571_03 ; 
- D 0 - I - 0x0154F9 05:94E9: 9A A2     .word ofs_038_6B_0x0062AA_04 ; 
- D 0 - I - 0x0154FB 05:94EB: FD A2     .word ofs_038_6B_0x00630D_05 ; 
- D 0 - I - 0x0154FD 05:94ED: 3D A3     .word ofs_038_6B_0x00634D_06_delete_object_04 ; 



ofs_038_6B_94EF_01_initialize_object:
C - - J - - 0x0154FF 05:94EF: A9 5E     LDA #$5E
C - - - - - 0x015501 05:94F1: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x015504 05:94F4: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x015506 05:94F6: 29 07     AND #$07
C - - - - - 0x015508 05:94F8: 0A        ASL
C - - - - - 0x015509 05:94F9: A8        TAY
C - - - - - 0x01550A 05:94FA: B9 28 95  LDA tbl_9528_spd_Y,Y
C - - - - - 0x01550D 05:94FD: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x015510 05:9500: B9 29 95  LDA tbl_9528_spd_Y + $01,Y
C - - - - - 0x015513 05:9503: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x015516 05:9506: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x015518 05:9508: 4A        LSR
C - - - - - 0x015519 05:9509: 4A        LSR
C - - - - - 0x01551A 05:950A: 4A        LSR
C - - - - - 0x01551B 05:950B: 4A        LSR
C - - - - - 0x01551C 05:950C: 48        PHA
C - - - - - 0x01551D 05:950D: 29 03     AND #$03
C - - - - - 0x01551F 05:950F: 0A        ASL
C - - - - - 0x015520 05:9510: A8        TAY
C - - - - - 0x015521 05:9511: B9 38 95  LDA tbl_9538_spd_X,Y
C - - - - - 0x015524 05:9514: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x015527 05:9517: B9 39 95  LDA tbl_9538_spd_X + $01,Y
C - - - - - 0x01552A 05:951A: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x01552D 05:951D: 68        PLA
C - - - - - 0x01552E 05:951E: 4A        LSR
C - - - - - 0x01552F 05:951F: 4A        LSR
C - - - - - 0x015530 05:9520: 90 03     BCC bra_9525
C - - - - - 0x015532 05:9522: 20 DC A7  JSR sub_0x0067EC_inverse_spd_X
bra_9525:
C - - - - - 0x015535 05:9525: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_9528_spd_Y:
- D 0 - - - 0x015538 05:9528: 00 08     .word $0800 ; 00 
- D 0 - - - 0x01553A 05:952A: 00 07     .word $0700 ; 01 
- D 0 - - - 0x01553C 05:952C: 00 06     .word $0600 ; 02 
- D 0 - - - 0x01553E 05:952E: 00 05     .word $0500 ; 03 
- D 0 - - - 0x015540 05:9530: 80 04     .word $0480 ; 04 
- D 0 - - - 0x015542 05:9532: 40 07     .word $0740 ; 05 
- D 0 - - - 0x015544 05:9534: 80 06     .word $0680 ; 06 
- D 0 - - - 0x015546 05:9536: 80 05     .word $0580 ; 07 



tbl_9538_spd_X:
- D 0 - - - 0x015548 05:9538: 40 00     .word $0040 ; 00 
- D 0 - - - 0x01554A 05:953A: 60 00     .word $0060 ; 01 
- D 0 - - - 0x01554C 05:953C: 80 00     .word $0080 ; 02 
- D 0 - - - 0x01554E 05:953E: C0 00     .word $00C0 ; 03 



ofs_038_6B_9540_02:
C - - J - - 0x015550 05:9540: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x015553 05:9543: 10 04     BPL bra_9549_00_08
C - - - - - 0x015555 05:9545: C9 FF     CMP #$FF
C - - - - - 0x015557 05:9547: F0 11     BEQ bra_955A_FF
bra_9549_00_08:
C - - - - - 0x015559 05:9549: BD A0 06  LDA ram_spd_Y_lo_obj,X
C - - - - - 0x01555C 05:954C: 38        SEC
C - - - - - 0x01555D 05:954D: E9 80     SBC #< $0080
C - - - - - 0x01555F 05:954F: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x015562 05:9552: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x015565 05:9555: E9 00     SBC #> $0080
C - - - - - 0x015567 05:9557: 9D AE 06  STA ram_spd_Y_hi_obj,X
bra_955A_FF:
C - - - - - 0x01556A 05:955A: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x01556D 05:955D: 20 84 95  JSR sub_9584
C - - - - - 0x015570 05:9560: F0 06     BEQ bra_9568
C - - - - - 0x015572 05:9562: 20 EE A7  JSR sub_0x0067FE_inverse_spd_Y
C - - - - - 0x015575 05:9565: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_9568:
C - - - - - 0x015578 05:9568: 20 98 95  JSR sub_9598
C - - - - - 0x01557B 05:956B: F0 03     BEQ bra_9570_RTS
C - - - - - 0x01557D 05:956D: 4C DC A7  JMP loc_0x0067EC_inverse_spd_X
bra_9570_RTS:
C - - - - - 0x015580 05:9570: 60        RTS



ofs_038_6B_9571_03:
C - - J - - 0x015581 05:9571: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x015584 05:9574: 20 84 95  JSR sub_9584
C - - - - - 0x015587 05:9577: F0 03     BEQ bra_957C
C - - - - - 0x015589 05:9579: 20 EE A7  JSR sub_0x0067FE_inverse_spd_Y
bra_957C:
C - - - - - 0x01558C 05:957C: 20 98 95  JSR sub_9598
C - - - - - 0x01558F 05:957F: F0 EF     BEQ bra_9570_RTS
C - - - - - 0x015591 05:9581: 4C DC A7  JMP loc_0x0067EC_inverse_spd_X



sub_9584:
C - - - - - 0x015594 05:9584: A9 04     LDA #$04
C - - - - - 0x015596 05:9586: BC AE 06  LDY ram_spd_Y_hi_obj,X
C - - - - - 0x015599 05:9589: 10 02     BPL bra_958D
C - - - - - 0x01559B 05:958B: A9 FC     LDA #$FC
bra_958D:
C - - - - - 0x01559D 05:958D: 18        CLC
C - - - - - 0x01559E 05:958E: 7D 22 05  ADC ram_pos_Y_hi_enemy,X
C - - - - - 0x0155A1 05:9591: A8        TAY
C - - - - - 0x0155A2 05:9592: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0155A5 05:9595: 4C C0 BA  JMP loc_0x007AD0



sub_9598:
C - - - - - 0x0155A8 05:9598: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x0155AB 05:959B: 2A        ROL
C - - - - - 0x0155AC 05:959C: 2A        ROL
C - - - - - 0x0155AD 05:959D: 29 01     AND #$01
C - - - - - 0x0155AF 05:959F: A8        TAY
C - - - - - 0x0155B0 05:95A0: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0155B3 05:95A3: D9 AF 95  CMP tbl_95AF_pos_Y,Y
C - - - - - 0x0155B6 05:95A6: 6A        ROR
C - - - - - 0x0155B7 05:95A7: 5D CA 06  EOR ram_spd_X_hi_obj,X
C - - - - - 0x0155BA 05:95AA: 30 02     BMI bra_95AE_RTS
C - - - - - 0x0155BC 05:95AC: A9 00     LDA #$00
bra_95AE_RTS:
C - - - - - 0x0155BE 05:95AE: 60        RTS



tbl_95AF_pos_Y:
- D 0 - - - 0x0155BF 05:95AF: F0        .byte $F0   ; 00 
- D 0 - - - 0x0155C0 05:95B0: 10        .byte $10   ; 01 



_off001_0x0155C1_6C_spawner_blue_bubbles:
- D 0 - I - 0x0155C1 05:95B1: BB 95     .word ofs_038_6C_95BB_01_initialize_object ; 
- D 0 - I - 0x0155C3 05:95B3: D5 95     .word ofs_038_6C_95D5_02 ; 
- - - - - - 0x0155C5 05:95B5: 9A A2     .word ofs_038_6C_0x0062AA_03 ; 
- - - - - - 0x0155C7 05:95B7: FD A2     .word ofs_038_6C_0x00630D_04 ; 
- - - - - - 0x0155C9 05:95B9: 3D A3     .word ofs_038_6C_0x00634D_05_delete_object_04 ; 



ofs_038_6C_95BB_01_initialize_object:
C - - J - - 0x0155CB 05:95BB: A9 01     LDA #$01
C - - - - - 0x0155CD 05:95BD: A9 20     LDA #$20
C - - - - - 0x0155CF 05:95BF: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x0155D2 05:95C2: A9 14     LDA #$14
C - - - - - 0x0155D4 05:95C4: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0155D7 05:95C7: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0155DA 05:95CA: 38        SEC
C - - - - - 0x0155DB 05:95CB: E9 08     SBC #$08
C - - - - - 0x0155DD 05:95CD: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0155E0 05:95D0: A9 10     LDA #$10
C - - - - - 0x0155E2 05:95D2: 4C E0 A2  JMP loc_0x0062F0



ofs_038_6C_95D5_02:
C - - J - - 0x0155E5 05:95D5: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0155E8 05:95D8: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0155EB 05:95DB: D0 14     BNE bra_95F1_RTS
C - - - - - 0x0155ED 05:95DD: A9 14     LDA #$14
C - - - - - 0x0155EF 05:95DF: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x0155F2 05:95E2: A0 6B     LDY #con_obj_id_6B
C - - - - - 0x0155F4 05:95E4: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x0155F7 05:95E7: 90 08     BCC bra_95F1_RTS
C - - - - - 0x0155F9 05:95E9: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x0155FC 05:95EC: D0 03     BNE bra_95F1_RTS
C - - - - - 0x0155FE 05:95EE: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_95F1_RTS:
C - - - - - 0x015601 05:95F1: 60        RTS



_off001_0x015602_42_boss_4_hanger:
- D 0 - I - 0x015602 05:95F2: 06 96     .word ofs_038_42_9606_01_initialize_object ; 
- D 0 - I - 0x015604 05:95F4: 0F 96     .word ofs_038_42_960F_02 ; 
- D 0 - I - 0x015606 05:95F6: 25 96     .word ofs_038_42_9625_03 ; 
- D 0 - I - 0x015608 05:95F8: 8F 96     .word ofs_038_42_968F_04 ; 
- D 0 - I - 0x01560A 05:95FA: BE 96     .word ofs_038_42_96BE_05 ; 
- D 0 - I - 0x01560C 05:95FC: B8 A3     .word ofs_038_42_0x0063C8_06 ; 
- D 0 - I - 0x01560E 05:95FE: D8 A3     .word ofs_038_42_0x0063E8_07 ; 
- D 0 - I - 0x015610 05:9600: A2 A2     .word ofs_038_42_0x0062B2_08 ; 
- D 0 - I - 0x015612 05:9602: F6 A2     .word ofs_038_42_0x006306_09 ; 
- D 0 - I - 0x015614 05:9604: CC 96     .word ofs_038_42_96CC_0A ; 



ofs_038_42_9606_01_initialize_object:
C - - J - - 0x015616 05:9606: A9 10     LDA #$10
C - - - - - 0x015618 05:9608: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x01561B 05:960B: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_960E_RTS:
C - - - - - 0x01561E 05:960E: 60        RTS



ofs_038_42_960F_02:
C - - J - - 0x01561F 05:960F: A5 7E     LDA ram_007E
C - - - - - 0x015621 05:9611: 05 60     ORA ram_0060
C - - - - - 0x015623 05:9613: 05 70     ORA ram_0070
C - - - - - 0x015625 05:9615: 05 80     ORA ram_0080
C - - - - - 0x015627 05:9617: D0 F5     BNE bra_960E_RTS
C - - - - - 0x015629 05:9619: A9 C8     LDA #$C8
C - - - - - 0x01562B 05:961B: 85 98     STA ram_0098
C - - - - - 0x01562D 05:961D: A9 31     LDA #con_sound_31
C - - - - - 0x01562F 05:961F: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x015632 05:9622: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_42_9625_03:
C - - J - - 0x015635 05:9625: A5 98     LDA ram_0098
C - - - - - 0x015637 05:9627: D0 E5     BNE bra_960E_RTS
C - - - - - 0x015639 05:9629: A9 C0     LDA #$C0
C - - - - - 0x01563B 05:962B: 85 7D     STA ram_007D_flag
C - - - - - 0x01563D 05:962D: A9 7C     LDA #$7C
C - - - - - 0x01563F 05:962F: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x015642 05:9632: A9 38     LDA #$38
C - - - - - 0x015644 05:9634: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x015647 05:9637: A9 00     LDA #$00
C - - - - - 0x015649 05:9639: 9D 8E 07  STA ram_078E_obj,X
C - - - - - 0x01564C 05:963C: A9 01     LDA #$01
C - - - - - 0x01564E 05:963E: 9D 9C 07  STA ram_079C_obj,X
C - - - - - 0x015651 05:9641: 20 7F FC  JSR sub_0x01FC8F_copy_reg_values
C - - - - - 0x015654 05:9644: A9 05     LDA #con_irq_area_4_boss
C - - - - - 0x015656 05:9646: 85 27     STA ram_irq_handler_hi
C - - - - - 0x015658 05:9648: A9 18     LDA #$18
C - - - - - 0x01565A 05:964A: 85 45     STA ram_0045
C - - - - - 0x01565C 05:964C: A9 01     LDA #$01
C - - - - - 0x01565E 05:964E: 85 46     STA ram_0046
C - - - - - 0x015660 05:9650: A9 AB     LDA #$AB
C - - - - - 0x015662 05:9652: 85 47     STA ram_0047
C - - - - - 0x015664 05:9654: A9 00     LDA #$00
C - - - - - 0x015666 05:9656: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x015669 05:9659: A0 08     LDY #$08
bra_965B_loop:
C - - - - - 0x01566B 05:965B: 84 08     STY ram_0008
C - - - - - 0x01566D 05:965D: A9 43     LDA #con_obj_id_43
; bzk optimize, load into Y directly
C - - - - - 0x01566F 05:965F: A8        TAY
C - - - - - 0x015670 05:9660: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x015673 05:9663: 90 13     BCC bra_9678
C - - - - - 0x015675 05:9665: FE 64 07  INC ram_0764_obj,X
C - - - - - 0x015678 05:9668: A4 11     LDY ram_0011
C - - - - - 0x01567A 05:966A: A5 08     LDA ram_0008
C - - - - - 0x01567C 05:966C: 99 1E 07  STA ram_obj_flags,Y
C - - - - - 0x01567F 05:966F: 8A        TXA
C - - - - - 0x015680 05:9670: 99 80 07  STA ram_0780_obj,Y
C - - - - - 0x015683 05:9673: A4 08     LDY ram_0008
C - - - - - 0x015685 05:9675: 88        DEY
C - - - - - 0x015686 05:9676: 10 E3     BPL bra_965B_loop
bra_9678:
C - - - - - 0x015688 05:9678: A9 FF     LDA #$FF
C - - - - - 0x01568A 05:967A: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x01568D 05:967D: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x015690 05:9680: A9 02     LDA #$02
C - - - - - 0x015692 05:9682: 85 61     STA ram_0061
C - - - - - 0x015694 05:9684: 20 90 F1  JSR sub_0x01F1A0
C - - - - - 0x015697 05:9687: A9 08     LDA #$08
C - - - - - 0x015699 05:9689: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01569C 05:968C: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_42_968F_04:
C - - J - - 0x01569F 05:968F: A5 60     LDA ram_0060
C - - - - - 0x0156A1 05:9691: 05 70     ORA ram_0070
C - - - - - 0x0156A3 05:9693: D0 09     BNE bra_969E_RTS
C - - - - - 0x0156A5 05:9695: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x0156A8 05:9698: F0 05     BEQ bra_969F
C - - - - - 0x0156AA 05:969A: A9 00     LDA #$00
C - - - - - 0x0156AC 05:969C: 85 6B     STA ram_006B
bra_969E_RTS:
C - - - - - 0x0156AE 05:969E: 60        RTS
bra_969F:
C - - - - - 0x0156AF 05:969F: 20 10 BD  JSR sub_0x007D20_clear_0400_047F
C - - - - - 0x0156B2 05:96A2: A9 00     LDA #$00
C - - - - - 0x0156B4 05:96A4: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0156B7 05:96A7: A9 09     LDA #$09
C - - - - - 0x0156B9 05:96A9: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x0156BC 05:96AC: A9 40     LDA #$40
C - - - - - 0x0156BE 05:96AE: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x0156C1 05:96B1: A9 00     LDA #< $F900
C - - - - - 0x0156C3 05:96B3: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x0156C6 05:96B6: A9 F9     LDA #> $F900
C - - - - - 0x0156C8 05:96B8: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x0156CB 05:96BB: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_42_96BE_05:
C - - J - - 0x0156CE 05:96BE: 20 FE 96  JSR sub_96FE
C - - - - - 0x0156D1 05:96C1: 20 00 98  JSR sub_9800
C - - - - - 0x0156D4 05:96C4: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x0156D7 05:96C7: D0 D5     BNE bra_969E_RTS
C - - - - - 0x0156D9 05:96C9: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_42_96CC_0A:
C - - J - - 0x0156DC 05:96CC: 20 8C FC  JSR sub_0x01FC9C_increase_002B
C - - - - - 0x0156DF 05:96CF: 20 88 F1  JSR sub_0x01F198
C - - - - - 0x0156E2 05:96D2: E6 65     INC ram_0065
C - - - - - 0x0156E4 05:96D4: A9 08     LDA #con_chr_bank + $08
C - - - - - 0x0156E6 05:96D6: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x0156E9 05:96D9: A9 0A     LDA #con_chr_bank + $0A
C - - - - - 0x0156EB 05:96DB: 8D F1 07  STA ram_bg_bank_1 + $01
C - - - - - 0x0156EE 05:96DE: 4C 37 A3  JMP loc_0x006347_delete_object_08



sub_96E1:
C - - - - - 0x0156F1 05:96E1: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x0156F4 05:96E4: 29 0E     AND #$0E
C - - - - - 0x0156F6 05:96E6: A8        TAY
C - - - - - 0x0156F7 05:96E7: B9 F4 96  LDA tbl_96F4_spd_X,Y
C - - - - - 0x0156FA 05:96EA: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x0156FD 05:96ED: B9 F5 96  LDA tbl_96F4_spd_X + $01,Y
C - - - - - 0x015700 05:96F0: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x015703 05:96F3: 60        RTS



tbl_96F4_spd_X:
- D 0 - - - 0x015704 05:96F4: C0 00     .word $00C0 ; 00 
- D 0 - - - 0x015706 05:96F6: A0 00     .word $00A0 ; 02 
- D 0 - - - 0x015708 05:96F8: 80 00     .word $0080 ; 04 
- D 0 - - - 0x01570A 05:96FA: 60 00     .word $0060 ; 06 
- D 0 - - - 0x01570C 05:96FC: 40 00     .word $0040 ; 08 



sub_96FE:
C - - - - - 0x01570E 05:96FE: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x015711 05:9701: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x015714 05:9704: 0E 97     .word ofs_031_970E_00
- D 0 - I - 0x015716 05:9706: 25 97     .word ofs_031_9725_01
- D 0 - I - 0x015718 05:9708: 31 97     .word ofs_031_9731_02
- D 0 - I - 0x01571A 05:970A: 25 97     .word ofs_031_9725_03
- D 0 - I - 0x01571C 05:970C: 62 97     .word ofs_031_9762_04



ofs_031_970E_00:
C - - J - - 0x01571E 05:970E: BD BC 06  LDA ram_spd_X_lo_obj,X
C - - - - - 0x015721 05:9711: 18        CLC
C - - - - - 0x015722 05:9712: 69 16     ADC #< $0016
C - - - - - 0x015724 05:9714: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x015727 05:9717: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x01572A 05:971A: 69 00     ADC #> $0016
C - - - - - 0x01572C 05:971C: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x01572F 05:971F: 30 0F     BMI bra_9730_RTS
C - - - - - 0x015731 05:9721: A9 08     LDA #$08
C - - - - - 0x015733 05:9723: D0 36     BNE bra_975B    ; jmp



ofs_031_9725_01:
ofs_031_9725_03:
C - - J - - 0x015735 05:9725: 20 C7 A7  JSR sub_0x0067D7_clear_spd_XY
C - - - - - 0x015738 05:9728: 20 B7 97  JSR sub_97B7
C - - - - - 0x01573B 05:972B: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x01573E 05:972E: F0 2E     BEQ bra_975E
bra_9730_RTS:
C - - - - - 0x015740 05:9730: 60        RTS



ofs_031_9731_02:
C - - J - - 0x015741 05:9731: 20 B7 97  JSR sub_97B7
C - - - - - 0x015744 05:9734: 20 E1 96  JSR sub_96E1
C - - - - - 0x015747 05:9737: A0 00     LDY #$00
C - - - - - 0x015749 05:9739: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x01574C 05:973C: D0 0B     BNE bra_9749
C - - - - - 0x01574E 05:973E: BD 02 07  LDA ram_0702_obj,X
bra_9741_loop:
C - - - - - 0x015751 05:9741: C8        INY
C - - - - - 0x015752 05:9742: C0 08     CPY #$08
C - - - - - 0x015754 05:9744: B0 03     BCS bra_9749
C - - - - - 0x015756 05:9746: 4A        LSR
C - - - - - 0x015757 05:9747: 90 F8     BCC bra_9741_loop
bra_9749:
C - - - - - 0x015759 05:9749: BD 9C 07  LDA ram_079C_obj,X
C - - - - - 0x01575C 05:974C: D9 93 97  CMP tbl_9793,Y
C - - - - - 0x01575F 05:974F: D0 DF     BNE bra_9730_RTS
C - - - - - 0x015761 05:9751: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x015764 05:9754: D9 9C 97  CMP tbl_979C_pos_X,Y
C - - - - - 0x015767 05:9757: 90 D7     BCC bra_9730_RTS
C - - - - - 0x015769 05:9759: A9 30     LDA #$30
bra_975B:
C - - - - - 0x01576B 05:975B: 9D E6 06  STA ram_06E6_obj,X
bra_975E:
C - - - - - 0x01576E 05:975E: FE 48 07  INC ram_0748_obj,X
C - - - - - 0x015771 05:9761: 60        RTS



ofs_031_9762_04:
C - - J - - 0x015772 05:9762: 20 B7 97  JSR sub_97B7
C - - - - - 0x015775 05:9765: 20 E1 96  JSR sub_96E1
C - - - - - 0x015778 05:9768: 20 DC A7  JSR sub_0x0067EC_inverse_spd_X
C - - - - - 0x01577B 05:976B: A0 FF     LDY #$FF
C - - - - - 0x01577D 05:976D: BD 02 07  LDA ram_0702_obj,X
bra_9770_loop:
C - - - - - 0x015780 05:9770: C8        INY
C - - - - - 0x015781 05:9771: C0 08     CPY #$08
C - - - - - 0x015783 05:9773: B0 03     BCS bra_9778
C - - - - - 0x015785 05:9775: 0A        ASL
C - - - - - 0x015786 05:9776: 90 F8     BCC bra_9770_loop
bra_9778:
C - - - - - 0x015788 05:9778: BD 9C 07  LDA ram_079C_obj,X
C - - - - - 0x01578B 05:977B: D9 A5 97  CMP tbl_97A5,Y
C - - - - - 0x01578E 05:977E: D0 B0     BNE bra_9730_RTS
C - - - - - 0x015790 05:9780: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x015793 05:9783: D9 AE 97  CMP tbl_97AE_pos_X,Y
C - - - - - 0x015796 05:9786: B0 A8     BCS bra_9730_RTS
C - - - - - 0x015798 05:9788: A9 30     LDA #$30
C - - - - - 0x01579A 05:978A: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x01579D 05:978D: A9 01     LDA #$01
C - - - - - 0x01579F 05:978F: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0157A2 05:9792: 60        RTS



tbl_9793:
- D 0 - - - 0x0157A3 05:9793: 00        .byte $00   ; 00 
- D 0 - - - 0x0157A4 05:9794: 00        .byte $00   ; 01 
- D 0 - - - 0x0157A5 05:9795: 00        .byte $00   ; 02 
- D 0 - - - 0x0157A6 05:9796: 00        .byte $00   ; 03 
- - - - - - 0x0157A7 05:9797: 00        .byte $00   ; 04 
- - - - - - 0x0157A8 05:9798: 01        .byte $01   ; 05 
- - - - - - 0x0157A9 05:9799: 01        .byte $01   ; 06 
- - - - - - 0x0157AA 05:979A: 01        .byte $01   ; 07 
- D 0 - - - 0x0157AB 05:979B: 01        .byte $01   ; 08 



tbl_979C_pos_X:
- D 0 - - - 0x0157AC 05:979C: B0        .byte $B0   ; 00 
- D 0 - - - 0x0157AD 05:979D: C0        .byte $C0   ; 01 
- - - - - - 0x0157AE 05:979E: D0        .byte $D0   ; 02 
- D 0 - - - 0x0157AF 05:979F: E0        .byte $E0   ; 03 
- - - - - - 0x0157B0 05:97A0: F0        .byte $F0   ; 04 
- - - - - - 0x0157B1 05:97A1: 00        .byte $00   ; 05 
- - - - - - 0x0157B2 05:97A2: 10        .byte $10   ; 06 
- - - - - - 0x0157B3 05:97A3: 20        .byte $20   ; 07 
- D 0 - - - 0x0157B4 05:97A4: 30        .byte $30   ; 08 



tbl_97A5:
- D 0 - - - 0x0157B5 05:97A5: 00        .byte $00   ; 00 
- - - - - - 0x0157B6 05:97A6: 00        .byte $00   ; 01 
- - - - - - 0x0157B7 05:97A7: 00        .byte $00   ; 02 
- D 0 - - - 0x0157B8 05:97A8: 00        .byte $00   ; 03 
- D 0 - - - 0x0157B9 05:97A9: 00        .byte $00   ; 04 
- D 0 - - - 0x0157BA 05:97AA: FF        .byte $FF   ; 05 
- D 0 - - - 0x0157BB 05:97AB: FF        .byte $FF   ; 06 
- D 0 - - - 0x0157BC 05:97AC: FF        .byte $FF   ; 07 
- D 0 - - - 0x0157BD 05:97AD: FF        .byte $FF   ; 08 



tbl_97AE_pos_X:
- D 0 - - - 0x0157BE 05:97AE: 50        .byte $50   ; 00 
- - - - - - 0x0157BF 05:97AF: 40        .byte $40   ; 01 
- - - - - - 0x0157C0 05:97B0: 30        .byte $30   ; 02 
- D 0 - - - 0x0157C1 05:97B1: 20        .byte $20   ; 03 
- D 0 - - - 0x0157C2 05:97B2: 10        .byte $10   ; 04 
- - - - - - 0x0157C3 05:97B3: FF        .byte $FF   ; 05 
- D 0 - - - 0x0157C4 05:97B4: F0        .byte $F0   ; 06 
- D 0 - - - 0x0157C5 05:97B5: E0        .byte $E0   ; 07 
- - - - - - 0x0157C6 05:97B6: D0        .byte $D0   ; 08 



sub_97B7:
C - - - - - 0x0157C7 05:97B7: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x0157CA 05:97BA: D0 43     BNE bra_97FF_RTS
C - - - - - 0x0157CC 05:97BC: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x0157CF 05:97BF: C9 FF     CMP #$FF
C - - - - - 0x0157D1 05:97C1: F0 02     BEQ bra_97C5
C - - - - - 0x0157D3 05:97C3: 29 7F     AND #$7F
bra_97C5:
C - - - - - 0x0157D5 05:97C5: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x0157D8 05:97C8: A9 14     LDA #$14
C - - - - - 0x0157DA 05:97CA: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x0157DD 05:97CD: C0 06     CPY #$06
C - - - - - 0x0157DF 05:97CF: B0 02     BCS bra_97D3
C - - - - - 0x0157E1 05:97D1: A9 10     LDA #$10
bra_97D3:
C - - - - - 0x0157E3 05:97D3: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x0157E6 05:97D6: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0157E9 05:97D9: 4A        LSR
C - - - - - 0x0157EA 05:97DA: A9 FF     LDA #$FF
C - - - - - 0x0157EC 05:97DC: 90 02     BCC bra_97E0
C - - - - - 0x0157EE 05:97DE: A9 01     LDA #$01
bra_97E0:
C - - - - - 0x0157F0 05:97E0: 18        CLC
C - - - - - 0x0157F1 05:97E1: 7D 72 07  ADC ram_0772_obj,X
C - - - - - 0x0157F4 05:97E4: C9 09     CMP #$09
C - - - - - 0x0157F6 05:97E6: 90 12     BCC bra_97FA
C - - - - - 0x0157F8 05:97E8: A8        TAY
C - - - - - 0x0157F9 05:97E9: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0157FC 05:97EC: 49 01     EOR #$01
C - - - - - 0x0157FE 05:97EE: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x015801 05:97F1: A9 30     LDA #$30
C - - - - - 0x015803 05:97F3: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x015806 05:97F6: 98        TYA
C - - - - - 0x015807 05:97F7: 4C FC 97  JMP loc_97FC
bra_97FA:
C - - - - - 0x01580A 05:97FA: 09 80     ORA #$80
loc_97FC:
C D 0 - - - 0x01580C 05:97FC: 9D 72 07  STA ram_0772_obj,X
bra_97FF_RTS:
C - - - - - 0x01580F 05:97FF: 60        RTS



sub_9800:
C - - - - - 0x015810 05:9800: 20 5D A7  JSR sub_0x00676D
C - - - - - 0x015813 05:9803: A9 7C     LDA #$7C
C - - - - - 0x015815 05:9805: 38        SEC
C - - - - - 0x015816 05:9806: FD 3C 05  SBC ram_pos_X_hi_enemy,X
C - - - - - 0x015819 05:9809: 85 FA     STA ram_00FA
C - - - - - 0x01581B 05:980B: 2A        ROL
C - - - - - 0x01581C 05:980C: 5D 9C 07  EOR ram_079C_obj,X
C - - - - - 0x01581F 05:980F: 4A        LSR
C - - - - - 0x015820 05:9810: A9 A8     LDA #$A8
C - - - - - 0x015822 05:9812: B0 02     BCS bra_9816
C - - - - - 0x015824 05:9814: A9 A9     LDA #$A9
bra_9816:
C - - - - - 0x015826 05:9816: 85 FB     STA ram_00FB
C - - - - - 0x015828 05:9818: 60        RTS


; bzk garbage, same code as 0x0047A9
- - - - - - 0x015829 05:9819: A9 14     LDA #$14
- - - - - - 0x01582B 05:981B: 85 08     STA ram_0008
- - - - - - 0x01582D 05:981D: A0 00     LDY #$00
; bzk optimize, check ram_index_ppu_buffer first
- - - - - - 0x01582F 05:981F: A6 1E     LDX ram_index_ppu_buffer
- - - - - - 0x015831 05:9821: E0 40     CPX #$40
- - - - - - 0x015833 05:9823: B0 0F     BCS bra_9834_skip
; if buffer is not too loaded
bra_9825_loop:
- - - - - - 0x015835 05:9825: B9 37 98  LDA tbl_9837,Y
- - - - - - 0x015838 05:9828: 9D 00 03  STA ram_nmt_buffer,X
- - - - - - 0x01583B 05:982B: E8        INX
- - - - - - 0x01583C 05:982C: C8        INY
- - - - - - 0x01583D 05:982D: C6 08     DEC ram_0008
- - - - - - 0x01583F 05:982F: D0 F4     BNE bra_9825_loop
- - - - - - 0x015841 05:9831: 86 1E     STX ram_index_ppu_buffer
- - - - - - 0x015843 05:9833: 18        CLC
bra_9834_skip:
- - - - - - 0x015844 05:9834: A6 10     LDX ram_0010
- - - - - - 0x015846 05:9836: 60        RTS



tbl_9837:
; bzk garbage, same table as 0x01086D
- - - - - - 0x015847 05:9837: 03        .byte con_buf_mode_03   ; 

- - - - - - 0x015848 05:9838: 23 D8     .dbyt $23D8 ; ppu address
- - - - - - 0x01584A 05:983A: 12        .byte $12, $AA   ; counter + fill tile

- - - - - - 0x01584C 05:983C: 06        .byte con_buf_mode_06   ; 

- - - - - - 0x01584D 05:983D: 23 EA     .dbyt $23EA ; ppu address
- - - - - - 0x01584F 05:983F: 05        .byte $05   ; counter
- - - - - - 0x015850 05:9840: AE        .byte $AE, $FA, $FA, $FA, $FA   ; tiles

- - - - - - 0x015855 05:9845: FF        .byte $FF   ; change mode

- - - - - - 0x015856 05:9846: 03        .byte con_buf_mode_03   ;
 
- - - - - - 0x015857 05:9847: 23 EF     .dbyt $23EF ; ppu address
- - - - - - 0x015859 05:9849: 08        .byte $08, $AA   ; counter + fill tile



_off004_0x01585B_06_area_7:
- D 0 - I - 0x01585B 05:984B: 02        .byte $02   ; config
- D 0 - I - 0x01585C 05:984C: 0E        .byte $0E   ; config

- D 0 - I - 0x01585D 05:984D: 01        .byte $01   ; 
- D 0 - I - 0x01585E 05:984E: 00        .byte $00   ; 
- D 0 - I - 0x01585F 05:984F: 02        .byte $02   ; 
- - - - - - 0x015860 05:9850: 00        .byte $00   ; 
- D 0 - I - 0x015861 05:9851: 03        .byte $03   ; 
- - - - - - 0x015862 05:9852: 00        .byte $00   ; 
- D 0 - I - 0x015863 05:9853: 04        .byte $04   ; 
- - - - - - 0x015864 05:9854: 00        .byte $00   ; 
- D 0 - I - 0x015865 05:9855: 05        .byte $05   ; 
- - - - - - 0x015866 05:9856: 00        .byte $00   ; 
- D 0 - I - 0x015867 05:9857: 06        .byte $06   ; 
- - - - - - 0x015868 05:9858: 00        .byte $00   ; 
- D 0 - I - 0x015869 05:9859: 07        .byte $07   ; 
- - - - - - 0x01586A 05:985A: 00        .byte $00   ; 
- D 0 - I - 0x01586B 05:985B: 08        .byte $08   ; 
- - - - - - 0x01586C 05:985C: 00        .byte $00   ; 
- D 0 - I - 0x01586D 05:985D: 09        .byte $09   ; 
- - - - - - 0x01586E 05:985E: 00        .byte $00   ; 
- D 0 - I - 0x01586F 05:985F: 0A        .byte $0A   ; 
- - - - - - 0x015870 05:9860: 00        .byte $00   ; 
- D 0 - I - 0x015871 05:9861: 0B        .byte $0B   ; 
- - - - - - 0x015872 05:9862: 00        .byte $00   ; 
- D 0 - I - 0x015873 05:9863: 0C        .byte $0C   ; 
- - - - - - 0x015874 05:9864: 00        .byte $00   ; 
- D 0 - I - 0x015875 05:9865: 0D        .byte $0D   ; 
- - - - - - 0x015876 05:9866: 00        .byte $00   ; 
- D 0 - I - 0x015877 05:9867: 0E        .byte $0E   ; 
- - - - - - 0x015878 05:9868: 00        .byte $00   ; 



_off005_0x015879_06_area_7:
- D 0 - I - 0x015879 05:9869: 87 98     .word _off018_06_9887_00
- D 0 - I - 0x01587B 05:986B: C7 98     .word _off018_06_98C7_01
- D 0 - I - 0x01587D 05:986D: 07 99     .word _off018_06_9907_02
- D 0 - I - 0x01587F 05:986F: 47 99     .word _off018_06_9947_03
- D 0 - I - 0x015881 05:9871: 87 99     .word _off018_06_9987_04
- D 0 - I - 0x015883 05:9873: C7 99     .word _off018_06_99C7_05
- D 0 - I - 0x015885 05:9875: 07 9A     .word _off018_06_9A07_06
- D 0 - I - 0x015887 05:9877: 47 9A     .word _off018_06_9A47_07
- D 0 - I - 0x015889 05:9879: 87 9A     .word _off018_06_9A87_08
- D 0 - I - 0x01588B 05:987B: C7 9A     .word _off018_06_9AC7_09
- D 0 - I - 0x01588D 05:987D: 07 9B     .word _off018_06_9B07_0A
- D 0 - I - 0x01588F 05:987F: 47 9B     .word _off018_06_9B47_0B
- D 0 - I - 0x015891 05:9881: 87 9B     .word _off018_06_9B87_0C
- D 0 - I - 0x015893 05:9883: C7 9B     .word _off018_06_9BC7_0D
- D 0 - I - 0x015895 05:9885: 07 9C     .word _off018_06_9C07_0E



_off018_06_9887_00:
- D 0 - I - 0x015897 05:9887: 00        .byte $00   ; 
- - - - - - 0x015898 05:9888: 00        .byte $00   ; 
- - - - - - 0x015899 05:9889: 00        .byte $00   ; 
- - - - - - 0x01589A 05:988A: 00        .byte $00   ; 
- - - - - - 0x01589B 05:988B: 00        .byte $00   ; 
- - - - - - 0x01589C 05:988C: 00        .byte $00   ; 
- - - - - - 0x01589D 05:988D: 00        .byte $00   ; 
- - - - - - 0x01589E 05:988E: 00        .byte $00   ; 
- D 0 - I - 0x01589F 05:988F: 00        .byte $00   ; 
- - - - - - 0x0158A0 05:9890: 00        .byte $00   ; 
- - - - - - 0x0158A1 05:9891: 00        .byte $00   ; 
- - - - - - 0x0158A2 05:9892: 00        .byte $00   ; 
- - - - - - 0x0158A3 05:9893: 00        .byte $00   ; 
- - - - - - 0x0158A4 05:9894: 00        .byte $00   ; 
- - - - - - 0x0158A5 05:9895: 00        .byte $00   ; 
- - - - - - 0x0158A6 05:9896: 00        .byte $00   ; 
- D 0 - I - 0x0158A7 05:9897: 00        .byte $00   ; 
- - - - - - 0x0158A8 05:9898: 00        .byte $00   ; 
- - - - - - 0x0158A9 05:9899: 00        .byte $00   ; 
- - - - - - 0x0158AA 05:989A: 00        .byte $00   ; 
- - - - - - 0x0158AB 05:989B: 00        .byte $00   ; 
- - - - - - 0x0158AC 05:989C: 00        .byte $00   ; 
- - - - - - 0x0158AD 05:989D: 00        .byte $00   ; 
- - - - - - 0x0158AE 05:989E: 00        .byte $00   ; 
- D 0 - I - 0x0158AF 05:989F: 00        .byte $00   ; 
- - - - - - 0x0158B0 05:98A0: 00        .byte $00   ; 
- - - - - - 0x0158B1 05:98A1: 00        .byte $00   ; 
- - - - - - 0x0158B2 05:98A2: 00        .byte $00   ; 
- - - - - - 0x0158B3 05:98A3: 00        .byte $00   ; 
- - - - - - 0x0158B4 05:98A4: 00        .byte $00   ; 
- - - - - - 0x0158B5 05:98A5: 00        .byte $00   ; 
- - - - - - 0x0158B6 05:98A6: 00        .byte $00   ; 
- D 0 - I - 0x0158B7 05:98A7: 00        .byte $00   ; 
- - - - - - 0x0158B8 05:98A8: 00        .byte $00   ; 
- - - - - - 0x0158B9 05:98A9: 00        .byte $00   ; 
- - - - - - 0x0158BA 05:98AA: 00        .byte $00   ; 
- - - - - - 0x0158BB 05:98AB: 00        .byte $00   ; 
- - - - - - 0x0158BC 05:98AC: 00        .byte $00   ; 
- - - - - - 0x0158BD 05:98AD: 00        .byte $00   ; 
- - - - - - 0x0158BE 05:98AE: 00        .byte $00   ; 
- D 0 - I - 0x0158BF 05:98AF: 00        .byte $00   ; 
- - - - - - 0x0158C0 05:98B0: 00        .byte $00   ; 
- - - - - - 0x0158C1 05:98B1: 00        .byte $00   ; 
- - - - - - 0x0158C2 05:98B2: 00        .byte $00   ; 
- - - - - - 0x0158C3 05:98B3: 00        .byte $00   ; 
- - - - - - 0x0158C4 05:98B4: 00        .byte $00   ; 
- - - - - - 0x0158C5 05:98B5: 00        .byte $00   ; 
- - - - - - 0x0158C6 05:98B6: 00        .byte $00   ; 
- D 0 - I - 0x0158C7 05:98B7: 00        .byte $00   ; 
- - - - - - 0x0158C8 05:98B8: 00        .byte $00   ; 
- - - - - - 0x0158C9 05:98B9: 00        .byte $00   ; 
- - - - - - 0x0158CA 05:98BA: 00        .byte $00   ; 
- - - - - - 0x0158CB 05:98BB: 00        .byte $00   ; 
- - - - - - 0x0158CC 05:98BC: 00        .byte $00   ; 
- - - - - - 0x0158CD 05:98BD: 00        .byte $00   ; 
- - - - - - 0x0158CE 05:98BE: 00        .byte $00   ; 
- D 0 - I - 0x0158CF 05:98BF: 00        .byte $00   ; 
- - - - - - 0x0158D0 05:98C0: 00        .byte $00   ; 
- - - - - - 0x0158D1 05:98C1: 00        .byte $00   ; 
- - - - - - 0x0158D2 05:98C2: 00        .byte $00   ; 
- - - - - - 0x0158D3 05:98C3: 00        .byte $00   ; 
- - - - - - 0x0158D4 05:98C4: 00        .byte $00   ; 
- - - - - - 0x0158D5 05:98C5: 00        .byte $00   ; 
- - - - - - 0x0158D6 05:98C6: 00        .byte $00   ; 



_off018_06_98C7_01:
- D 0 - I - 0x0158D7 05:98C7: 38        .byte $38   ; 
- D 0 - I - 0x0158D8 05:98C8: 38        .byte $38   ; 
- D 0 - I - 0x0158D9 05:98C9: 38        .byte $38   ; 
- D 0 - I - 0x0158DA 05:98CA: 38        .byte $38   ; 
- D 0 - I - 0x0158DB 05:98CB: 38        .byte $38   ; 
- D 0 - I - 0x0158DC 05:98CC: 38        .byte $38   ; 
- D 0 - I - 0x0158DD 05:98CD: 38        .byte $38   ; 
- D 0 - I - 0x0158DE 05:98CE: 38        .byte $38   ; 
- D 0 - I - 0x0158DF 05:98CF: 39        .byte $39   ; 
- D 0 - I - 0x0158E0 05:98D0: 39        .byte $39   ; 
- D 0 - I - 0x0158E1 05:98D1: 39        .byte $39   ; 
- D 0 - I - 0x0158E2 05:98D2: 39        .byte $39   ; 
- D 0 - I - 0x0158E3 05:98D3: 39        .byte $39   ; 
- D 0 - I - 0x0158E4 05:98D4: 39        .byte $39   ; 
- D 0 - I - 0x0158E5 05:98D5: 39        .byte $39   ; 
- D 0 - I - 0x0158E6 05:98D6: 39        .byte $39   ; 
- D 0 - I - 0x0158E7 05:98D7: 3A        .byte $3A   ; 
- D 0 - I - 0x0158E8 05:98D8: 3A        .byte $3A   ; 
- D 0 - I - 0x0158E9 05:98D9: 3A        .byte $3A   ; 
- D 0 - I - 0x0158EA 05:98DA: 3A        .byte $3A   ; 
- D 0 - I - 0x0158EB 05:98DB: 3A        .byte $3A   ; 
- D 0 - I - 0x0158EC 05:98DC: 3A        .byte $3A   ; 
- D 0 - I - 0x0158ED 05:98DD: 3A        .byte $3A   ; 
- D 0 - I - 0x0158EE 05:98DE: 3A        .byte $3A   ; 
- D 0 - I - 0x0158EF 05:98DF: 3F        .byte $3F   ; 
- D 0 - I - 0x0158F0 05:98E0: 3F        .byte $3F   ; 
- D 0 - I - 0x0158F1 05:98E1: 3F        .byte $3F   ; 
- D 0 - I - 0x0158F2 05:98E2: 3F        .byte $3F   ; 
- D 0 - I - 0x0158F3 05:98E3: 3F        .byte $3F   ; 
- D 0 - I - 0x0158F4 05:98E4: 3F        .byte $3F   ; 
- D 0 - I - 0x0158F5 05:98E5: 3F        .byte $3F   ; 
- D 0 - I - 0x0158F6 05:98E6: 3F        .byte $3F   ; 
- D 0 - I - 0x0158F7 05:98E7: 40        .byte $40   ; 
- D 0 - I - 0x0158F8 05:98E8: 40        .byte $40   ; 
- D 0 - I - 0x0158F9 05:98E9: 48        .byte $48   ; 
- D 0 - I - 0x0158FA 05:98EA: 48        .byte $48   ; 
- D 0 - I - 0x0158FB 05:98EB: 48        .byte $48   ; 
- D 0 - I - 0x0158FC 05:98EC: 48        .byte $48   ; 
- D 0 - I - 0x0158FD 05:98ED: 40        .byte $40   ; 
- D 0 - I - 0x0158FE 05:98EE: 40        .byte $40   ; 
- D 0 - I - 0x0158FF 05:98EF: 0B        .byte $0B   ; 
- D 0 - I - 0x015900 05:98F0: 09        .byte $09   ; 
- D 0 - I - 0x015901 05:98F1: 0A        .byte $0A   ; 
- D 0 - I - 0x015902 05:98F2: 0B        .byte $0B   ; 
- D 0 - I - 0x015903 05:98F3: 00        .byte $00   ; 
- D 0 - I - 0x015904 05:98F4: 0B        .byte $0B   ; 
- D 0 - I - 0x015905 05:98F5: 0B        .byte $0B   ; 
- D 0 - I - 0x015906 05:98F6: 0B        .byte $0B   ; 
- D 0 - I - 0x015907 05:98F7: 02        .byte $02   ; 
- D 0 - I - 0x015908 05:98F8: 01        .byte $01   ; 
- D 0 - I - 0x015909 05:98F9: 03        .byte $03   ; 
- D 0 - I - 0x01590A 05:98FA: 02        .byte $02   ; 
- D 0 - I - 0x01590B 05:98FB: 10        .byte $10   ; 
- D 0 - I - 0x01590C 05:98FC: 03        .byte $03   ; 
- D 0 - I - 0x01590D 05:98FD: 02        .byte $02   ; 
- D 0 - I - 0x01590E 05:98FE: 03        .byte $03   ; 
- D 0 - I - 0x01590F 05:98FF: 01        .byte $01   ; 
- D 0 - I - 0x015910 05:9900: 03        .byte $03   ; 
- D 0 - I - 0x015911 05:9901: 02        .byte $02   ; 
- D 0 - I - 0x015912 05:9902: 03        .byte $03   ; 
- D 0 - I - 0x015913 05:9903: 10        .byte $10   ; 
- D 0 - I - 0x015914 05:9904: 01        .byte $01   ; 
- D 0 - I - 0x015915 05:9905: 0E        .byte $0E   ; 
- D 0 - I - 0x015916 05:9906: 02        .byte $02   ; 



_off018_06_9907_02:
- D 0 - I - 0x015917 05:9907: 02        .byte $02   ; 
- D 0 - I - 0x015918 05:9908: 01        .byte $01   ; 
- D 0 - I - 0x015919 05:9909: 02        .byte $02   ; 
- D 0 - I - 0x01591A 05:990A: 01        .byte $01   ; 
- D 0 - I - 0x01591B 05:990B: 06        .byte $06   ; 
- D 0 - I - 0x01591C 05:990C: 08        .byte $08   ; 
- D 0 - I - 0x01591D 05:990D: 02        .byte $02   ; 
- D 0 - I - 0x01591E 05:990E: 01        .byte $01   ; 
- D 0 - I - 0x01591F 05:990F: 03        .byte $03   ; 
- D 0 - I - 0x015920 05:9910: 02        .byte $02   ; 
- D 0 - I - 0x015921 05:9911: 03        .byte $03   ; 
- D 0 - I - 0x015922 05:9912: 02        .byte $02   ; 
- D 0 - I - 0x015923 05:9913: 03        .byte $03   ; 
- D 0 - I - 0x015924 05:9914: 05        .byte $05   ; 
- D 0 - I - 0x015925 05:9915: 03        .byte $03   ; 
- D 0 - I - 0x015926 05:9916: 02        .byte $02   ; 
- D 0 - I - 0x015927 05:9917: 02        .byte $02   ; 
- D 0 - I - 0x015928 05:9918: 03        .byte $03   ; 
- D 0 - I - 0x015929 05:9919: 02        .byte $02   ; 
- D 0 - I - 0x01592A 05:991A: 01        .byte $01   ; 
- D 0 - I - 0x01592B 05:991B: 02        .byte $02   ; 
- D 0 - I - 0x01592C 05:991C: 05        .byte $05   ; 
- D 0 - I - 0x01592D 05:991D: 02        .byte $02   ; 
- D 0 - I - 0x01592E 05:991E: 03        .byte $03   ; 
- D 0 - I - 0x01592F 05:991F: 01        .byte $01   ; 
- D 0 - I - 0x015930 05:9920: 02        .byte $02   ; 
- D 0 - I - 0x015931 05:9921: 03        .byte $03   ; 
- D 0 - I - 0x015932 05:9922: 02        .byte $02   ; 
- D 0 - I - 0x015933 05:9923: 02        .byte $02   ; 
- D 0 - I - 0x015934 05:9924: 07        .byte $07   ; 
- D 0 - I - 0x015935 05:9925: 03        .byte $03   ; 
- D 0 - I - 0x015936 05:9926: 02        .byte $02   ; 
- D 0 - I - 0x015937 05:9927: 03        .byte $03   ; 
- D 0 - I - 0x015938 05:9928: 02        .byte $02   ; 
- D 0 - I - 0x015939 05:9929: 03        .byte $03   ; 
- D 0 - I - 0x01593A 05:992A: 02        .byte $02   ; 
- D 0 - I - 0x01593B 05:992B: 06        .byte $06   ; 
- D 0 - I - 0x01593C 05:992C: 08        .byte $08   ; 
- D 0 - I - 0x01593D 05:992D: 02        .byte $02   ; 
- D 0 - I - 0x01593E 05:992E: 03        .byte $03   ; 
- D 0 - I - 0x01593F 05:992F: 03        .byte $03   ; 
- D 0 - I - 0x015940 05:9930: 02        .byte $02   ; 
- D 0 - I - 0x015941 05:9931: 03        .byte $03   ; 
- D 0 - I - 0x015942 05:9932: 0F        .byte $0F   ; 
- D 0 - I - 0x015943 05:9933: 04        .byte $04   ; 
- D 0 - I - 0x015944 05:9934: 02        .byte $02   ; 
- D 0 - I - 0x015945 05:9935: 03        .byte $03   ; 
- D 0 - I - 0x015946 05:9936: 02        .byte $02   ; 
- D 0 - I - 0x015947 05:9937: 0D        .byte $0D   ; 
- D 0 - I - 0x015948 05:9938: 0E        .byte $0E   ; 
- D 0 - I - 0x015949 05:9939: 0F        .byte $0F   ; 
- D 0 - I - 0x01594A 05:993A: 04        .byte $04   ; 
- D 0 - I - 0x01594B 05:993B: 00        .byte $00   ; 
- D 0 - I - 0x01594C 05:993C: 02        .byte $02   ; 
- D 0 - I - 0x01594D 05:993D: 02        .byte $02   ; 
- D 0 - I - 0x01594E 05:993E: 03        .byte $03   ; 
- D 0 - I - 0x01594F 05:993F: 00        .byte $00   ; 
- D 0 - I - 0x015950 05:9940: 00        .byte $00   ; 
- D 0 - I - 0x015951 05:9941: 00        .byte $00   ; 
- D 0 - I - 0x015952 05:9942: 00        .byte $00   ; 
- D 0 - I - 0x015953 05:9943: 0B        .byte $0B   ; 
- D 0 - I - 0x015954 05:9944: 03        .byte $03   ; 
- D 0 - I - 0x015955 05:9945: 03        .byte $03   ; 
- D 0 - I - 0x015956 05:9946: 02        .byte $02   ; 



_off018_06_9947_03:
- D 0 - I - 0x015957 05:9947: 3C        .byte $3C   ; 
- D 0 - I - 0x015958 05:9948: 37        .byte $37   ; 
- D 0 - I - 0x015959 05:9949: 3C        .byte $3C   ; 
- D 0 - I - 0x01595A 05:994A: 00        .byte $00   ; 
- D 0 - I - 0x01595B 05:994B: 0D        .byte $0D   ; 
- D 0 - I - 0x01595C 05:994C: 0E        .byte $0E   ; 
- D 0 - I - 0x01595D 05:994D: 0E        .byte $0E   ; 
- D 0 - I - 0x01595E 05:994E: 0D        .byte $0D   ; 
- D 0 - I - 0x01595F 05:994F: 20        .byte $20   ; 
- D 0 - I - 0x015960 05:9950: 21        .byte $21   ; 
- D 0 - I - 0x015961 05:9951: 37        .byte $37   ; 
- D 0 - I - 0x015962 05:9952: 3C        .byte $3C   ; 
- D 0 - I - 0x015963 05:9953: 3C        .byte $3C   ; 
- D 0 - I - 0x015964 05:9954: 3C        .byte $3C   ; 
- D 0 - I - 0x015965 05:9955: 3C        .byte $3C   ; 
- D 0 - I - 0x015966 05:9956: 3C        .byte $3C   ; 
- D 0 - I - 0x015967 05:9957: 24        .byte $24   ; 
- D 0 - I - 0x015968 05:9958: 25        .byte $25   ; 
- D 0 - I - 0x015969 05:9959: 20        .byte $20   ; 
- D 0 - I - 0x01596A 05:995A: 21        .byte $21   ; 
- D 0 - I - 0x01596B 05:995B: 38        .byte $38   ; 
- D 0 - I - 0x01596C 05:995C: 38        .byte $38   ; 
- D 0 - I - 0x01596D 05:995D: 38        .byte $38   ; 
- D 0 - I - 0x01596E 05:995E: 38        .byte $38   ; 
- D 0 - I - 0x01596F 05:995F: 22        .byte $22   ; 
- D 0 - I - 0x015970 05:9960: 22        .byte $22   ; 
- D 0 - I - 0x015971 05:9961: 24        .byte $24   ; 
- D 0 - I - 0x015972 05:9962: 25        .byte $25   ; 
- D 0 - I - 0x015973 05:9963: 26        .byte $26   ; 
- D 0 - I - 0x015974 05:9964: 27        .byte $27   ; 
- D 0 - I - 0x015975 05:9965: 39        .byte $39   ; 
- D 0 - I - 0x015976 05:9966: 39        .byte $39   ; 
- D 0 - I - 0x015977 05:9967: 22        .byte $22   ; 
- D 0 - I - 0x015978 05:9968: 22        .byte $22   ; 
- D 0 - I - 0x015979 05:9969: 28        .byte $28   ; 
- D 0 - I - 0x01597A 05:996A: 29        .byte $29   ; 
- D 0 - I - 0x01597B 05:996B: 2A        .byte $2A   ; 
- D 0 - I - 0x01597C 05:996C: 2B        .byte $2B   ; 
- D 0 - I - 0x01597D 05:996D: 49        .byte $49   ; 
- D 0 - I - 0x01597E 05:996E: 3A        .byte $3A   ; 
- D 0 - I - 0x01597F 05:996F: 29        .byte $29   ; 
- D 0 - I - 0x015980 05:9970: 23        .byte $23   ; 
- D 0 - I - 0x015981 05:9971: 3C        .byte $3C   ; 
- D 0 - I - 0x015982 05:9972: 3C        .byte $3C   ; 
- D 0 - I - 0x015983 05:9973: 3B        .byte $3B   ; 
- D 0 - I - 0x015984 05:9974: 3B        .byte $3B   ; 
- D 0 - I - 0x015985 05:9975: 3B        .byte $3B   ; 
- D 0 - I - 0x015986 05:9976: 46        .byte $46   ; 
- D 0 - I - 0x015987 05:9977: 37        .byte $37   ; 
- D 0 - I - 0x015988 05:9978: 37        .byte $37   ; 
- D 0 - I - 0x015989 05:9979: 37        .byte $37   ; 
- D 0 - I - 0x01598A 05:997A: 37        .byte $37   ; 
- D 0 - I - 0x01598B 05:997B: 37        .byte $37   ; 
- D 0 - I - 0x01598C 05:997C: 12        .byte $12   ; 
- D 0 - I - 0x01598D 05:997D: 13        .byte $13   ; 
- D 0 - I - 0x01598E 05:997E: 16        .byte $16   ; 
- D 0 - I - 0x01598F 05:997F: 37        .byte $37   ; 
- D 0 - I - 0x015990 05:9980: 37        .byte $37   ; 
- D 0 - I - 0x015991 05:9981: 37        .byte $37   ; 
- D 0 - I - 0x015992 05:9982: 3D        .byte $3D   ; 
- D 0 - I - 0x015993 05:9983: 13        .byte $13   ; 
- D 0 - I - 0x015994 05:9984: 16        .byte $16   ; 
- D 0 - I - 0x015995 05:9985: 17        .byte $17   ; 
- D 0 - I - 0x015996 05:9986: 1B        .byte $1B   ; 



_off018_06_9987_04:
- D 0 - I - 0x015997 05:9987: 40        .byte $40   ; 
- D 0 - I - 0x015998 05:9988: 40        .byte $40   ; 
- D 0 - I - 0x015999 05:9989: 14        .byte $14   ; 
- D 0 - I - 0x01599A 05:998A: 15        .byte $15   ; 
- D 0 - I - 0x01599B 05:998B: 16        .byte $16   ; 
- D 0 - I - 0x01599C 05:998C: 17        .byte $17   ; 
- D 0 - I - 0x01599D 05:998D: 11        .byte $11   ; 
- D 0 - I - 0x01599E 05:998E: 11        .byte $11   ; 
- D 0 - I - 0x01599F 05:998F: 40        .byte $40   ; 
- D 0 - I - 0x0159A0 05:9990: 40        .byte $40   ; 
- D 0 - I - 0x0159A1 05:9991: 18        .byte $18   ; 
- D 0 - I - 0x0159A2 05:9992: 19        .byte $19   ; 
- D 0 - I - 0x0159A3 05:9993: 1A        .byte $1A   ; 
- D 0 - I - 0x0159A4 05:9994: 1B        .byte $1B   ; 
- D 0 - I - 0x0159A5 05:9995: 11        .byte $11   ; 
- D 0 - I - 0x0159A6 05:9996: 11        .byte $11   ; 
- D 0 - I - 0x0159A7 05:9997: 21        .byte $21   ; 
- D 0 - I - 0x0159A8 05:9998: 40        .byte $40   ; 
- D 0 - I - 0x0159A9 05:9999: 40        .byte $40   ; 
- D 0 - I - 0x0159AA 05:999A: 3E        .byte $3E   ; 
- D 0 - I - 0x0159AB 05:999B: 3E        .byte $3E   ; 
- D 0 - I - 0x0159AC 05:999C: 44        .byte $44   ; 
- D 0 - I - 0x0159AD 05:999D: 1F        .byte $1F   ; 
- D 0 - I - 0x0159AE 05:999E: 1A        .byte $1A   ; 
- D 0 - I - 0x0159AF 05:999F: 25        .byte $25   ; 
- D 0 - I - 0x0159B0 05:99A0: 20        .byte $20   ; 
- D 0 - I - 0x0159B1 05:99A1: 21        .byte $21   ; 
- D 0 - I - 0x0159B2 05:99A2: 47        .byte $47   ; 
- D 0 - I - 0x0159B3 05:99A3: 39        .byte $39   ; 
- D 0 - I - 0x0159B4 05:99A4: 39        .byte $39   ; 
- D 0 - I - 0x0159B5 05:99A5: 39        .byte $39   ; 
- D 0 - I - 0x0159B6 05:99A6: 39        .byte $39   ; 
- D 0 - I - 0x0159B7 05:99A7: 22        .byte $22   ; 
- D 0 - I - 0x0159B8 05:99A8: 24        .byte $24   ; 
- D 0 - I - 0x0159B9 05:99A9: 25        .byte $25   ; 
- D 0 - I - 0x0159BA 05:99AA: 20        .byte $20   ; 
- D 0 - I - 0x0159BB 05:99AB: 42        .byte $42   ; 
- D 0 - I - 0x0159BC 05:99AC: 4B        .byte $4B   ; 
- D 0 - I - 0x0159BD 05:99AD: 3A        .byte $3A   ; 
- D 0 - I - 0x0159BE 05:99AE: 3A        .byte $3A   ; 
- D 0 - I - 0x0159BF 05:99AF: 22        .byte $22   ; 
- D 0 - I - 0x0159C0 05:99B0: 22        .byte $22   ; 
- D 0 - I - 0x0159C1 05:99B1: 28        .byte $28   ; 
- D 0 - I - 0x0159C2 05:99B2: 24        .byte $24   ; 
- D 0 - I - 0x0159C3 05:99B3: 2C        .byte $2C   ; 
- D 0 - I - 0x0159C4 05:99B4: 2D        .byte $2D   ; 
- D 0 - I - 0x0159C5 05:99B5: 4A        .byte $4A   ; 
- D 0 - I - 0x0159C6 05:99B6: 3B        .byte $3B   ; 
- D 0 - I - 0x0159C7 05:99B7: 29        .byte $29   ; 
- D 0 - I - 0x0159C8 05:99B8: 23        .byte $23   ; 
- D 0 - I - 0x0159C9 05:99B9: 3C        .byte $3C   ; 
- D 0 - I - 0x0159CA 05:99BA: 3C        .byte $3C   ; 
- D 0 - I - 0x0159CB 05:99BB: 3C        .byte $3C   ; 
- D 0 - I - 0x0159CC 05:99BC: 3C        .byte $3C   ; 
- D 0 - I - 0x0159CD 05:99BD: 37        .byte $37   ; 
- D 0 - I - 0x0159CE 05:99BE: 37        .byte $37   ; 
- D 0 - I - 0x0159CF 05:99BF: 3C        .byte $3C   ; 
- D 0 - I - 0x0159D0 05:99C0: 37        .byte $37   ; 
- D 0 - I - 0x0159D1 05:99C1: 37        .byte $37   ; 
- D 0 - I - 0x0159D2 05:99C2: 37        .byte $37   ; 
- D 0 - I - 0x0159D3 05:99C3: 37        .byte $37   ; 
- D 0 - I - 0x0159D4 05:99C4: 37        .byte $37   ; 
- D 0 - I - 0x0159D5 05:99C5: 37        .byte $37   ; 
- D 0 - I - 0x0159D6 05:99C6: 37        .byte $37   ; 



_off018_06_99C7_05:
- D 0 - I - 0x0159D7 05:99C7: 40        .byte $40   ; 
- D 0 - I - 0x0159D8 05:99C8: 40        .byte $40   ; 
- D 0 - I - 0x0159D9 05:99C9: 40        .byte $40   ; 
- D 0 - I - 0x0159DA 05:99CA: 2E        .byte $2E   ; 
- D 0 - I - 0x0159DB 05:99CB: 30        .byte $30   ; 
- D 0 - I - 0x0159DC 05:99CC: 30        .byte $30   ; 
- D 0 - I - 0x0159DD 05:99CD: 30        .byte $30   ; 
- D 0 - I - 0x0159DE 05:99CE: 30        .byte $30   ; 
- D 0 - I - 0x0159DF 05:99CF: 40        .byte $40   ; 
- D 0 - I - 0x0159E0 05:99D0: 40        .byte $40   ; 
- D 0 - I - 0x0159E1 05:99D1: 43        .byte $43   ; 
- D 0 - I - 0x0159E2 05:99D2: 2F        .byte $2F   ; 
- D 0 - I - 0x0159E3 05:99D3: 34        .byte $34   ; 
- D 0 - I - 0x0159E4 05:99D4: 31        .byte $31   ; 
- D 0 - I - 0x0159E5 05:99D5: 32        .byte $32   ; 
- D 0 - I - 0x0159E6 05:99D6: 32        .byte $32   ; 
- D 0 - I - 0x0159E7 05:99D7: 20        .byte $20   ; 
- D 0 - I - 0x0159E8 05:99D8: 21        .byte $21   ; 
- D 0 - I - 0x0159E9 05:99D9: 40        .byte $40   ; 
- D 0 - I - 0x0159EA 05:99DA: 40        .byte $40   ; 
- D 0 - I - 0x0159EB 05:99DB: 40        .byte $40   ; 
- D 0 - I - 0x0159EC 05:99DC: 33        .byte $33   ; 
- D 0 - I - 0x0159ED 05:99DD: 35        .byte $35   ; 
- D 0 - I - 0x0159EE 05:99DE: 36        .byte $36   ; 
- D 0 - I - 0x0159EF 05:99DF: 24        .byte $24   ; 
- D 0 - I - 0x0159F0 05:99E0: 25        .byte $25   ; 
- D 0 - I - 0x0159F1 05:99E1: 20        .byte $20   ; 
- D 0 - I - 0x0159F2 05:99E2: 21        .byte $21   ; 
- D 0 - I - 0x0159F3 05:99E3: 40        .byte $40   ; 
- D 0 - I - 0x0159F4 05:99E4: 3E        .byte $3E   ; 
- D 0 - I - 0x0159F5 05:99E5: 3E        .byte $3E   ; 
- D 0 - I - 0x0159F6 05:99E6: 3E        .byte $3E   ; 
- D 0 - I - 0x0159F7 05:99E7: 22        .byte $22   ; 
- D 0 - I - 0x0159F8 05:99E8: 22        .byte $22   ; 
- D 0 - I - 0x0159F9 05:99E9: 24        .byte $24   ; 
- D 0 - I - 0x0159FA 05:99EA: 25        .byte $25   ; 
- D 0 - I - 0x0159FB 05:99EB: 26        .byte $26   ; 
- D 0 - I - 0x0159FC 05:99EC: 27        .byte $27   ; 
- D 0 - I - 0x0159FD 05:99ED: 47        .byte $47   ; 
- D 0 - I - 0x0159FE 05:99EE: 39        .byte $39   ; 
- D 0 - I - 0x0159FF 05:99EF: 22        .byte $22   ; 
- D 0 - I - 0x015A00 05:99F0: 22        .byte $22   ; 
- D 0 - I - 0x015A01 05:99F1: 28        .byte $28   ; 
- D 0 - I - 0x015A02 05:99F2: 29        .byte $29   ; 
- D 0 - I - 0x015A03 05:99F3: 2A        .byte $2A   ; 
- D 0 - I - 0x015A04 05:99F4: 2B        .byte $2B   ; 
- D 0 - I - 0x015A05 05:99F5: 49        .byte $49   ; 
- D 0 - I - 0x015A06 05:99F6: 3A        .byte $3A   ; 
- D 0 - I - 0x015A07 05:99F7: 29        .byte $29   ; 
- D 0 - I - 0x015A08 05:99F8: 23        .byte $23   ; 
- D 0 - I - 0x015A09 05:99F9: 3C        .byte $3C   ; 
- D 0 - I - 0x015A0A 05:99FA: 40        .byte $40   ; 
- D 0 - I - 0x015A0B 05:99FB: 3F        .byte $3F   ; 
- D 0 - I - 0x015A0C 05:99FC: 3F        .byte $3F   ; 
- D 0 - I - 0x015A0D 05:99FD: 3F        .byte $3F   ; 
- D 0 - I - 0x015A0E 05:99FE: 46        .byte $46   ; 
- D 0 - I - 0x015A0F 05:99FF: 40        .byte $40   ; 
- D 0 - I - 0x015A10 05:9A00: 40        .byte $40   ; 
- D 0 - I - 0x015A11 05:9A01: 40        .byte $40   ; 
- D 0 - I - 0x015A12 05:9A02: 40        .byte $40   ; 
- D 0 - I - 0x015A13 05:9A03: 40        .byte $40   ; 
- D 0 - I - 0x015A14 05:9A04: 40        .byte $40   ; 
- D 0 - I - 0x015A15 05:9A05: 13        .byte $13   ; 
- D 0 - I - 0x015A16 05:9A06: 16        .byte $16   ; 



_off018_06_9A07_06:
- D 0 - I - 0x015A17 05:9A07: 37        .byte $37   ; 
- D 0 - I - 0x015A18 05:9A08: 37        .byte $37   ; 
- D 0 - I - 0x015A19 05:9A09: 37        .byte $37   ; 
- D 0 - I - 0x015A1A 05:9A0A: 37        .byte $37   ; 
- D 0 - I - 0x015A1B 05:9A0B: 12        .byte $12   ; 
- D 0 - I - 0x015A1C 05:9A0C: 13        .byte $13   ; 
- D 0 - I - 0x015A1D 05:9A0D: 16        .byte $16   ; 
- D 0 - I - 0x015A1E 05:9A0E: 17        .byte $17   ; 
- D 0 - I - 0x015A1F 05:9A0F: 37        .byte $37   ; 
- D 0 - I - 0x015A20 05:9A10: 37        .byte $37   ; 
- D 0 - I - 0x015A21 05:9A11: 14        .byte $14   ; 
- D 0 - I - 0x015A22 05:9A12: 15        .byte $15   ; 
- D 0 - I - 0x015A23 05:9A13: 16        .byte $16   ; 
- D 0 - I - 0x015A24 05:9A14: 17        .byte $17   ; 
- D 0 - I - 0x015A25 05:9A15: 11        .byte $11   ; 
- D 0 - I - 0x015A26 05:9A16: 11        .byte $11   ; 
- D 0 - I - 0x015A27 05:9A17: 37        .byte $37   ; 
- D 0 - I - 0x015A28 05:9A18: 3D        .byte $3D   ; 
- D 0 - I - 0x015A29 05:9A19: 18        .byte $18   ; 
- D 0 - I - 0x015A2A 05:9A1A: 19        .byte $19   ; 
- D 0 - I - 0x015A2B 05:9A1B: 1A        .byte $1A   ; 
- D 0 - I - 0x015A2C 05:9A1C: 1B        .byte $1B   ; 
- D 0 - I - 0x015A2D 05:9A1D: 11        .byte $11   ; 
- D 0 - I - 0x015A2E 05:9A1E: 11        .byte $11   ; 
- D 0 - I - 0x015A2F 05:9A1F: 21        .byte $21   ; 
- D 0 - I - 0x015A30 05:9A20: 3E        .byte $3E   ; 
- D 0 - I - 0x015A31 05:9A21: 3E        .byte $3E   ; 
- D 0 - I - 0x015A32 05:9A22: 3E        .byte $3E   ; 
- D 0 - I - 0x015A33 05:9A23: 3E        .byte $3E   ; 
- D 0 - I - 0x015A34 05:9A24: 44        .byte $44   ; 
- D 0 - I - 0x015A35 05:9A25: 1F        .byte $1F   ; 
- D 0 - I - 0x015A36 05:9A26: 1A        .byte $1A   ; 
- D 0 - I - 0x015A37 05:9A27: 25        .byte $25   ; 
- D 0 - I - 0x015A38 05:9A28: 20        .byte $20   ; 
- D 0 - I - 0x015A39 05:9A29: 41        .byte $41   ; 
- D 0 - I - 0x015A3A 05:9A2A: 47        .byte $47   ; 
- D 0 - I - 0x015A3B 05:9A2B: 39        .byte $39   ; 
- D 0 - I - 0x015A3C 05:9A2C: 39        .byte $39   ; 
- D 0 - I - 0x015A3D 05:9A2D: 39        .byte $39   ; 
- D 0 - I - 0x015A3E 05:9A2E: 39        .byte $39   ; 
- D 0 - I - 0x015A3F 05:9A2F: 22        .byte $22   ; 
- D 0 - I - 0x015A40 05:9A30: 24        .byte $24   ; 
- D 0 - I - 0x015A41 05:9A31: 25        .byte $25   ; 
- D 0 - I - 0x015A42 05:9A32: 20        .byte $20   ; 
- D 0 - I - 0x015A43 05:9A33: 42        .byte $42   ; 
- D 0 - I - 0x015A44 05:9A34: 4B        .byte $4B   ; 
- D 0 - I - 0x015A45 05:9A35: 3A        .byte $3A   ; 
- D 0 - I - 0x015A46 05:9A36: 3A        .byte $3A   ; 
- D 0 - I - 0x015A47 05:9A37: 22        .byte $22   ; 
- D 0 - I - 0x015A48 05:9A38: 22        .byte $22   ; 
- D 0 - I - 0x015A49 05:9A39: 22        .byte $22   ; 
- D 0 - I - 0x015A4A 05:9A3A: 24        .byte $24   ; 
- D 0 - I - 0x015A4B 05:9A3B: 2C        .byte $2C   ; 
- D 0 - I - 0x015A4C 05:9A3C: 2D        .byte $2D   ; 
- D 0 - I - 0x015A4D 05:9A3D: 4A        .byte $4A   ; 
- D 0 - I - 0x015A4E 05:9A3E: 3B        .byte $3B   ; 
- D 0 - I - 0x015A4F 05:9A3F: 22        .byte $22   ; 
- D 0 - I - 0x015A50 05:9A40: 29        .byte $29   ; 
- D 0 - I - 0x015A51 05:9A41: 23        .byte $23   ; 
- D 0 - I - 0x015A52 05:9A42: 3C        .byte $3C   ; 
- D 0 - I - 0x015A53 05:9A43: 3C        .byte $3C   ; 
- D 0 - I - 0x015A54 05:9A44: 3C        .byte $3C   ; 
- D 0 - I - 0x015A55 05:9A45: 37        .byte $37   ; 
- D 0 - I - 0x015A56 05:9A46: 37        .byte $37   ; 



_off018_06_9A47_07:
- D 0 - I - 0x015A57 05:9A47: 29        .byte $29   ; 
- D 0 - I - 0x015A58 05:9A48: 23        .byte $23   ; 
- D 0 - I - 0x015A59 05:9A49: 40        .byte $40   ; 
- D 0 - I - 0x015A5A 05:9A4A: 48        .byte $48   ; 
- D 0 - I - 0x015A5B 05:9A4B: 48        .byte $48   ; 
- D 0 - I - 0x015A5C 05:9A4C: 48        .byte $48   ; 
- D 0 - I - 0x015A5D 05:9A4D: 48        .byte $48   ; 
- D 0 - I - 0x015A5E 05:9A4E: 40        .byte $40   ; 
- D 0 - I - 0x015A5F 05:9A4F: 00        .byte $00   ; 
- D 0 - I - 0x015A60 05:9A50: 00        .byte $00   ; 
- D 0 - I - 0x015A61 05:9A51: 00        .byte $00   ; 
- D 0 - I - 0x015A62 05:9A52: 00        .byte $00   ; 
- D 0 - I - 0x015A63 05:9A53: 00        .byte $00   ; 
- D 0 - I - 0x015A64 05:9A54: 00        .byte $00   ; 
- D 0 - I - 0x015A65 05:9A55: 00        .byte $00   ; 
- D 0 - I - 0x015A66 05:9A56: 00        .byte $00   ; 
- D 0 - I - 0x015A67 05:9A57: 62        .byte $62   ; 
- D 0 - I - 0x015A68 05:9A58: 00        .byte $00   ; 
- D 0 - I - 0x015A69 05:9A59: 00        .byte $00   ; 
- D 0 - I - 0x015A6A 05:9A5A: 00        .byte $00   ; 
- D 0 - I - 0x015A6B 05:9A5B: 00        .byte $00   ; 
- D 0 - I - 0x015A6C 05:9A5C: 00        .byte $00   ; 
- D 0 - I - 0x015A6D 05:9A5D: 00        .byte $00   ; 
- D 0 - I - 0x015A6E 05:9A5E: 63        .byte $63   ; 
- D 0 - I - 0x015A6F 05:9A5F: 5D        .byte $5D   ; 
- D 0 - I - 0x015A70 05:9A60: 4C        .byte $4C   ; 
- D 0 - I - 0x015A71 05:9A61: 4D        .byte $4D   ; 
- D 0 - I - 0x015A72 05:9A62: 00        .byte $00   ; 
- D 0 - I - 0x015A73 05:9A63: 00        .byte $00   ; 
- D 0 - I - 0x015A74 05:9A64: 56        .byte $56   ; 
- D 0 - I - 0x015A75 05:9A65: 57        .byte $57   ; 
- D 0 - I - 0x015A76 05:9A66: 5E        .byte $5E   ; 
- D 0 - I - 0x015A77 05:9A67: 5D        .byte $5D   ; 
- D 0 - I - 0x015A78 05:9A68: 50        .byte $50   ; 
- D 0 - I - 0x015A79 05:9A69: 4E        .byte $4E   ; 
- D 0 - I - 0x015A7A 05:9A6A: 4F        .byte $4F   ; 
- D 0 - I - 0x015A7B 05:9A6B: 53        .byte $53   ; 
- D 0 - I - 0x015A7C 05:9A6C: 54        .byte $54   ; 
- D 0 - I - 0x015A7D 05:9A6D: 55        .byte $55   ; 
- D 0 - I - 0x015A7E 05:9A6E: 5E        .byte $5E   ; 
- D 0 - I - 0x015A7F 05:9A6F: 5D        .byte $5D   ; 
- D 0 - I - 0x015A80 05:9A70: 50        .byte $50   ; 
- D 0 - I - 0x015A81 05:9A71: 52        .byte $52   ; 
- D 0 - I - 0x015A82 05:9A72: 52        .byte $52   ; 
- D 0 - I - 0x015A83 05:9A73: 52        .byte $52   ; 
- D 0 - I - 0x015A84 05:9A74: 51        .byte $51   ; 
- D 0 - I - 0x015A85 05:9A75: 55        .byte $55   ; 
- D 0 - I - 0x015A86 05:9A76: 5E        .byte $5E   ; 
- D 0 - I - 0x015A87 05:9A77: 5D        .byte $5D   ; 
- D 0 - I - 0x015A88 05:9A78: 50        .byte $50   ; 
- D 0 - I - 0x015A89 05:9A79: 51        .byte $51   ; 
- D 0 - I - 0x015A8A 05:9A7A: 52        .byte $52   ; 
- D 0 - I - 0x015A8B 05:9A7B: 51        .byte $51   ; 
- D 0 - I - 0x015A8C 05:9A7C: 51        .byte $51   ; 
- D 0 - I - 0x015A8D 05:9A7D: 55        .byte $55   ; 
- D 0 - I - 0x015A8E 05:9A7E: 5E        .byte $5E   ; 
- D 0 - I - 0x015A8F 05:9A7F: 5D        .byte $5D   ; 
- D 0 - I - 0x015A90 05:9A80: 00        .byte $00   ; 
- D 0 - I - 0x015A91 05:9A81: 00        .byte $00   ; 
- D 0 - I - 0x015A92 05:9A82: 00        .byte $00   ; 
- D 0 - I - 0x015A93 05:9A83: 00        .byte $00   ; 
- D 0 - I - 0x015A94 05:9A84: 00        .byte $00   ; 
- D 0 - I - 0x015A95 05:9A85: 00        .byte $00   ; 
- D 0 - I - 0x015A96 05:9A86: 5E        .byte $5E   ; 



_off018_06_9A87_08:
- D 0 - I - 0x015A97 05:9A87: 5D        .byte $5D   ; 
- D 0 - I - 0x015A98 05:9A88: 50        .byte $50   ; 
- D 0 - I - 0x015A99 05:9A89: 4C        .byte $4C   ; 
- D 0 - I - 0x015A9A 05:9A8A: 4D        .byte $4D   ; 
- D 0 - I - 0x015A9B 05:9A8B: 00        .byte $00   ; 
- D 0 - I - 0x015A9C 05:9A8C: 4F        .byte $4F   ; 
- D 0 - I - 0x015A9D 05:9A8D: 55        .byte $55   ; 
- D 0 - I - 0x015A9E 05:9A8E: 5E        .byte $5E   ; 
- D 0 - I - 0x015A9F 05:9A8F: 5D        .byte $5D   ; 
- D 0 - I - 0x015AA0 05:9A90: 51        .byte $51   ; 
- D 0 - I - 0x015AA1 05:9A91: 51        .byte $51   ; 
- D 0 - I - 0x015AA2 05:9A92: 57        .byte $57   ; 
- D 0 - I - 0x015AA3 05:9A93: 50        .byte $50   ; 
- D 0 - I - 0x015AA4 05:9A94: 51        .byte $51   ; 
- D 0 - I - 0x015AA5 05:9A95: 55        .byte $55   ; 
- D 0 - I - 0x015AA6 05:9A96: 5E        .byte $5E   ; 
- D 0 - I - 0x015AA7 05:9A97: 5D        .byte $5D   ; 
- D 0 - I - 0x015AA8 05:9A98: 50        .byte $50   ; 
- D 0 - I - 0x015AA9 05:9A99: 51        .byte $51   ; 
- D 0 - I - 0x015AAA 05:9A9A: 51        .byte $51   ; 
- D 0 - I - 0x015AAB 05:9A9B: 52        .byte $52   ; 
- D 0 - I - 0x015AAC 05:9A9C: 51        .byte $51   ; 
- D 0 - I - 0x015AAD 05:9A9D: 55        .byte $55   ; 
- D 0 - I - 0x015AAE 05:9A9E: 5E        .byte $5E   ; 
- D 0 - I - 0x015AAF 05:9A9F: 5D        .byte $5D   ; 
- D 0 - I - 0x015AB0 05:9AA0: 50        .byte $50   ; 
- D 0 - I - 0x015AB1 05:9AA1: 52        .byte $52   ; 
- D 0 - I - 0x015AB2 05:9AA2: 52        .byte $52   ; 
- D 0 - I - 0x015AB3 05:9AA3: 52        .byte $52   ; 
- D 0 - I - 0x015AB4 05:9AA4: 52        .byte $52   ; 
- D 0 - I - 0x015AB5 05:9AA5: 55        .byte $55   ; 
- D 0 - I - 0x015AB6 05:9AA6: 5E        .byte $5E   ; 
- D 0 - I - 0x015AB7 05:9AA7: 5D        .byte $5D   ; 
- D 0 - I - 0x015AB8 05:9AA8: 50        .byte $50   ; 
- D 0 - I - 0x015AB9 05:9AA9: 51        .byte $51   ; 
- D 0 - I - 0x015ABA 05:9AAA: 52        .byte $52   ; 
- D 0 - I - 0x015ABB 05:9AAB: 52        .byte $52   ; 
- D 0 - I - 0x015ABC 05:9AAC: 51        .byte $51   ; 
- D 0 - I - 0x015ABD 05:9AAD: 55        .byte $55   ; 
- D 0 - I - 0x015ABE 05:9AAE: 5E        .byte $5E   ; 
- D 0 - I - 0x015ABF 05:9AAF: 5D        .byte $5D   ; 
- D 0 - I - 0x015AC0 05:9AB0: 50        .byte $50   ; 
- D 0 - I - 0x015AC1 05:9AB1: 50        .byte $50   ; 
- D 0 - I - 0x015AC2 05:9AB2: 51        .byte $51   ; 
- D 0 - I - 0x015AC3 05:9AB3: 51        .byte $51   ; 
- D 0 - I - 0x015AC4 05:9AB4: 51        .byte $51   ; 
- D 0 - I - 0x015AC5 05:9AB5: 5A        .byte $5A   ; 
- D 0 - I - 0x015AC6 05:9AB6: 68        .byte $68   ; 
- D 0 - I - 0x015AC7 05:9AB7: 5C        .byte $5C   ; 
- D 0 - I - 0x015AC8 05:9AB8: 58        .byte $58   ; 
- D 0 - I - 0x015AC9 05:9AB9: 59        .byte $59   ; 
- D 0 - I - 0x015ACA 05:9ABA: 52        .byte $52   ; 
- D 0 - I - 0x015ACB 05:9ABB: 5A        .byte $5A   ; 
- D 0 - I - 0x015ACC 05:9ABC: 5B        .byte $5B   ; 
- D 0 - I - 0x015ACD 05:9ABD: 5F        .byte $5F   ; 
- D 0 - I - 0x015ACE 05:9ABE: 11        .byte $11   ; 
- D 0 - I - 0x015ACF 05:9ABF: 22        .byte $22   ; 
- D 0 - I - 0x015AD0 05:9AC0: 22        .byte $22   ; 
- D 0 - I - 0x015AD1 05:9AC1: 6A        .byte $6A   ; 
- D 0 - I - 0x015AD2 05:9AC2: 52        .byte $52   ; 
- D 0 - I - 0x015AD3 05:9AC3: 6B        .byte $6B   ; 
- D 0 - I - 0x015AD4 05:9AC4: 11        .byte $11   ; 
- D 0 - I - 0x015AD5 05:9AC5: 11        .byte $11   ; 
- D 0 - I - 0x015AD6 05:9AC6: 11        .byte $11   ; 



_off018_06_9AC7_09:
- D 0 - I - 0x015AD7 05:9AC7: 22        .byte $22   ; 
- D 0 - I - 0x015AD8 05:9AC8: 22        .byte $22   ; 
- D 0 - I - 0x015AD9 05:9AC9: 5D        .byte $5D   ; 
- D 0 - I - 0x015ADA 05:9ACA: 51        .byte $51   ; 
- D 0 - I - 0x015ADB 05:9ACB: 5E        .byte $5E   ; 
- D 0 - I - 0x015ADC 05:9ACC: 11        .byte $11   ; 
- D 0 - I - 0x015ADD 05:9ACD: 11        .byte $11   ; 
- D 0 - I - 0x015ADE 05:9ACE: 11        .byte $11   ; 
- D 0 - I - 0x015ADF 05:9ACF: 22        .byte $22   ; 
- D 0 - I - 0x015AE0 05:9AD0: 22        .byte $22   ; 
- D 0 - I - 0x015AE1 05:9AD1: 5D        .byte $5D   ; 
- D 0 - I - 0x015AE2 05:9AD2: 50        .byte $50   ; 
- D 0 - I - 0x015AE3 05:9AD3: 5E        .byte $5E   ; 
- D 0 - I - 0x015AE4 05:9AD4: 11        .byte $11   ; 
- D 0 - I - 0x015AE5 05:9AD5: 11        .byte $11   ; 
- D 0 - I - 0x015AE6 05:9AD6: 11        .byte $11   ; 
- D 0 - I - 0x015AE7 05:9AD7: 22        .byte $22   ; 
- D 0 - I - 0x015AE8 05:9AD8: 22        .byte $22   ; 
- D 0 - I - 0x015AE9 05:9AD9: 5D        .byte $5D   ; 
- D 0 - I - 0x015AEA 05:9ADA: 51        .byte $51   ; 
- D 0 - I - 0x015AEB 05:9ADB: 5E        .byte $5E   ; 
- D 0 - I - 0x015AEC 05:9ADC: 11        .byte $11   ; 
- D 0 - I - 0x015AED 05:9ADD: 11        .byte $11   ; 
- D 0 - I - 0x015AEE 05:9ADE: 11        .byte $11   ; 
- D 0 - I - 0x015AEF 05:9ADF: 22        .byte $22   ; 
- D 0 - I - 0x015AF0 05:9AE0: 22        .byte $22   ; 
- D 0 - I - 0x015AF1 05:9AE1: 5D        .byte $5D   ; 
- D 0 - I - 0x015AF2 05:9AE2: 50        .byte $50   ; 
- D 0 - I - 0x015AF3 05:9AE3: 5E        .byte $5E   ; 
- D 0 - I - 0x015AF4 05:9AE4: 11        .byte $11   ; 
- D 0 - I - 0x015AF5 05:9AE5: 11        .byte $11   ; 
- D 0 - I - 0x015AF6 05:9AE6: 11        .byte $11   ; 
- D 0 - I - 0x015AF7 05:9AE7: 22        .byte $22   ; 
- D 0 - I - 0x015AF8 05:9AE8: 22        .byte $22   ; 
- D 0 - I - 0x015AF9 05:9AE9: 5D        .byte $5D   ; 
- D 0 - I - 0x015AFA 05:9AEA: 51        .byte $51   ; 
- D 0 - I - 0x015AFB 05:9AEB: 5E        .byte $5E   ; 
- D 0 - I - 0x015AFC 05:9AEC: 11        .byte $11   ; 
- D 0 - I - 0x015AFD 05:9AED: 11        .byte $11   ; 
- D 0 - I - 0x015AFE 05:9AEE: 11        .byte $11   ; 
- D 0 - I - 0x015AFF 05:9AEF: 22        .byte $22   ; 
- D 0 - I - 0x015B00 05:9AF0: 22        .byte $22   ; 
- D 0 - I - 0x015B01 05:9AF1: 5D        .byte $5D   ; 
- D 0 - I - 0x015B02 05:9AF2: 50        .byte $50   ; 
- D 0 - I - 0x015B03 05:9AF3: 5E        .byte $5E   ; 
- D 0 - I - 0x015B04 05:9AF4: 11        .byte $11   ; 
- D 0 - I - 0x015B05 05:9AF5: 11        .byte $11   ; 
- D 0 - I - 0x015B06 05:9AF6: 11        .byte $11   ; 
- D 0 - I - 0x015B07 05:9AF7: 22        .byte $22   ; 
- D 0 - I - 0x015B08 05:9AF8: 28        .byte $28   ; 
- D 0 - I - 0x015B09 05:9AF9: 5D        .byte $5D   ; 
- D 0 - I - 0x015B0A 05:9AFA: 51        .byte $51   ; 
- D 0 - I - 0x015B0B 05:9AFB: 5E        .byte $5E   ; 
- D 0 - I - 0x015B0C 05:9AFC: 11        .byte $11   ; 
- D 0 - I - 0x015B0D 05:9AFD: 11        .byte $11   ; 
- D 0 - I - 0x015B0E 05:9AFE: 11        .byte $11   ; 
- D 0 - I - 0x015B0F 05:9AFF: 22        .byte $22   ; 
- D 0 - I - 0x015B10 05:9B00: 22        .byte $22   ; 
- D 0 - I - 0x015B11 05:9B01: 5D        .byte $5D   ; 
- D 0 - I - 0x015B12 05:9B02: 54        .byte $54   ; 
- D 0 - I - 0x015B13 05:9B03: 5E        .byte $5E   ; 
- D 0 - I - 0x015B14 05:9B04: 11        .byte $11   ; 
- D 0 - I - 0x015B15 05:9B05: 11        .byte $11   ; 
- D 0 - I - 0x015B16 05:9B06: 11        .byte $11   ; 



_off018_06_9B07_0A:
- D 0 - I - 0x015B17 05:9B07: 22        .byte $22   ; 
- D 0 - I - 0x015B18 05:9B08: 66        .byte $66   ; 
- D 0 - I - 0x015B19 05:9B09: 60        .byte $60   ; 
- D 0 - I - 0x015B1A 05:9B0A: 00        .byte $00   ; 
- D 0 - I - 0x015B1B 05:9B0B: 61        .byte $61   ; 
- D 0 - I - 0x015B1C 05:9B0C: 67        .byte $67   ; 
- D 0 - I - 0x015B1D 05:9B0D: 11        .byte $11   ; 
- D 0 - I - 0x015B1E 05:9B0E: 11        .byte $11   ; 
- D 0 - I - 0x015B1F 05:9B0F: 64        .byte $64   ; 
- D 0 - I - 0x015B20 05:9B10: 3C        .byte $3C   ; 
- D 0 - I - 0x015B21 05:9B11: 3C        .byte $3C   ; 
- D 0 - I - 0x015B22 05:9B12: 37        .byte $37   ; 
- D 0 - I - 0x015B23 05:9B13: 37        .byte $37   ; 
- D 0 - I - 0x015B24 05:9B14: 37        .byte $37   ; 
- D 0 - I - 0x015B25 05:9B15: 65        .byte $65   ; 
- D 0 - I - 0x015B26 05:9B16: 1A        .byte $1A   ; 
- D 0 - I - 0x015B27 05:9B17: 3C        .byte $3C   ; 
- D 0 - I - 0x015B28 05:9B18: 37        .byte $37   ; 
- D 0 - I - 0x015B29 05:9B19: 6C        .byte $6C   ; 
- D 0 - I - 0x015B2A 05:9B1A: 69        .byte $69   ; 
- D 0 - I - 0x015B2B 05:9B1B: 6D        .byte $6D   ; 
- D 0 - I - 0x015B2C 05:9B1C: 37        .byte $37   ; 
- D 0 - I - 0x015B2D 05:9B1D: 37        .byte $37   ; 
- D 0 - I - 0x015B2E 05:9B1E: 3C        .byte $3C   ; 
- D 0 - I - 0x015B2F 05:9B1F: 37        .byte $37   ; 
- D 0 - I - 0x015B30 05:9B20: 37        .byte $37   ; 
- D 0 - I - 0x015B31 05:9B21: 37        .byte $37   ; 
- D 0 - I - 0x015B32 05:9B22: 37        .byte $37   ; 
- D 0 - I - 0x015B33 05:9B23: 37        .byte $37   ; 
- D 0 - I - 0x015B34 05:9B24: 37        .byte $37   ; 
- D 0 - I - 0x015B35 05:9B25: 37        .byte $37   ; 
- D 0 - I - 0x015B36 05:9B26: 6E        .byte $6E   ; 
- D 0 - I - 0x015B37 05:9B27: 37        .byte $37   ; 
- D 0 - I - 0x015B38 05:9B28: 37        .byte $37   ; 
- D 0 - I - 0x015B39 05:9B29: 37        .byte $37   ; 
- D 0 - I - 0x015B3A 05:9B2A: 37        .byte $37   ; 
- D 0 - I - 0x015B3B 05:9B2B: 6C        .byte $6C   ; 
- D 0 - I - 0x015B3C 05:9B2C: 69        .byte $69   ; 
- D 0 - I - 0x015B3D 05:9B2D: 69        .byte $69   ; 
- D 0 - I - 0x015B3E 05:9B2E: 6D        .byte $6D   ; 
- D 0 - I - 0x015B3F 05:9B2F: 6E        .byte $6E   ; 
- D 0 - I - 0x015B40 05:9B30: 6E        .byte $6E   ; 
- D 0 - I - 0x015B41 05:9B31: 37        .byte $37   ; 
- D 0 - I - 0x015B42 05:9B32: 3D        .byte $3D   ; 
- D 0 - I - 0x015B43 05:9B33: 3C        .byte $3C   ; 
- D 0 - I - 0x015B44 05:9B34: 3C        .byte $3C   ; 
- D 0 - I - 0x015B45 05:9B35: 3C        .byte $3C   ; 
- D 0 - I - 0x015B46 05:9B36: 3C        .byte $3C   ; 
- D 0 - I - 0x015B47 05:9B37: 6C        .byte $6C   ; 
- D 0 - I - 0x015B48 05:9B38: 69        .byte $69   ; 
- D 0 - I - 0x015B49 05:9B39: 69        .byte $69   ; 
- D 0 - I - 0x015B4A 05:9B3A: 69        .byte $69   ; 
- D 0 - I - 0x015B4B 05:9B3B: 6D        .byte $6D   ; 
- D 0 - I - 0x015B4C 05:9B3C: 37        .byte $37   ; 
- D 0 - I - 0x015B4D 05:9B3D: 37        .byte $37   ; 
- D 0 - I - 0x015B4E 05:9B3E: 37        .byte $37   ; 
- D 0 - I - 0x015B4F 05:9B3F: 37        .byte $37   ; 
- D 0 - I - 0x015B50 05:9B40: 37        .byte $37   ; 
- D 0 - I - 0x015B51 05:9B41: 37        .byte $37   ; 
- D 0 - I - 0x015B52 05:9B42: 37        .byte $37   ; 
- D 0 - I - 0x015B53 05:9B43: 37        .byte $37   ; 
- D 0 - I - 0x015B54 05:9B44: 37        .byte $37   ; 
- D 0 - I - 0x015B55 05:9B45: 37        .byte $37   ; 
- D 0 - I - 0x015B56 05:9B46: 37        .byte $37   ; 



_off018_06_9B47_0B:
- D 0 - I - 0x015B57 05:9B47: 37        .byte $37   ; 
- D 0 - I - 0x015B58 05:9B48: 37        .byte $37   ; 
- D 0 - I - 0x015B59 05:9B49: 37        .byte $37   ; 
- D 0 - I - 0x015B5A 05:9B4A: 37        .byte $37   ; 
- D 0 - I - 0x015B5B 05:9B4B: 6E        .byte $6E   ; 
- D 0 - I - 0x015B5C 05:9B4C: 37        .byte $37   ; 
- D 0 - I - 0x015B5D 05:9B4D: 37        .byte $37   ; 
- D 0 - I - 0x015B5E 05:9B4E: 37        .byte $37   ; 
- D 0 - I - 0x015B5F 05:9B4F: 37        .byte $37   ; 
- D 0 - I - 0x015B60 05:9B50: 37        .byte $37   ; 
- D 0 - I - 0x015B61 05:9B51: 37        .byte $37   ; 
- D 0 - I - 0x015B62 05:9B52: 37        .byte $37   ; 
- D 0 - I - 0x015B63 05:9B53: 6C        .byte $6C   ; 
- D 0 - I - 0x015B64 05:9B54: 69        .byte $69   ; 
- D 0 - I - 0x015B65 05:9B55: 69        .byte $69   ; 
- D 0 - I - 0x015B66 05:9B56: 6D        .byte $6D   ; 
- D 0 - I - 0x015B67 05:9B57: 37        .byte $37   ; 
- D 0 - I - 0x015B68 05:9B58: 6E        .byte $6E   ; 
- D 0 - I - 0x015B69 05:9B59: 37        .byte $37   ; 
- D 0 - I - 0x015B6A 05:9B5A: 37        .byte $37   ; 
- D 0 - I - 0x015B6B 05:9B5B: 6E        .byte $6E   ; 
- D 0 - I - 0x015B6C 05:9B5C: 3C        .byte $3C   ; 
- D 0 - I - 0x015B6D 05:9B5D: 3C        .byte $3C   ; 
- D 0 - I - 0x015B6E 05:9B5E: 3C        .byte $3C   ; 
- D 0 - I - 0x015B6F 05:9B5F: 6C        .byte $6C   ; 
- D 0 - I - 0x015B70 05:9B60: 69        .byte $69   ; 
- D 0 - I - 0x015B71 05:9B61: 69        .byte $69   ; 
- D 0 - I - 0x015B72 05:9B62: 69        .byte $69   ; 
- D 0 - I - 0x015B73 05:9B63: 69        .byte $69   ; 
- D 0 - I - 0x015B74 05:9B64: 6D        .byte $6D   ; 
- D 0 - I - 0x015B75 05:9B65: 37        .byte $37   ; 
- D 0 - I - 0x015B76 05:9B66: 37        .byte $37   ; 
- D 0 - I - 0x015B77 05:9B67: 37        .byte $37   ; 
- D 0 - I - 0x015B78 05:9B68: 37        .byte $37   ; 
- D 0 - I - 0x015B79 05:9B69: 37        .byte $37   ; 
- D 0 - I - 0x015B7A 05:9B6A: 37        .byte $37   ; 
- D 0 - I - 0x015B7B 05:9B6B: 37        .byte $37   ; 
- D 0 - I - 0x015B7C 05:9B6C: 37        .byte $37   ; 
- D 0 - I - 0x015B7D 05:9B6D: 37        .byte $37   ; 
- D 0 - I - 0x015B7E 05:9B6E: 37        .byte $37   ; 
- D 0 - I - 0x015B7F 05:9B6F: 37        .byte $37   ; 
- D 0 - I - 0x015B80 05:9B70: 37        .byte $37   ; 
- D 0 - I - 0x015B81 05:9B71: 6E        .byte $6E   ; 
- D 0 - I - 0x015B82 05:9B72: 37        .byte $37   ; 
- D 0 - I - 0x015B83 05:9B73: 37        .byte $37   ; 
- D 0 - I - 0x015B84 05:9B74: 37        .byte $37   ; 
- D 0 - I - 0x015B85 05:9B75: 3D        .byte $3D   ; 
- D 0 - I - 0x015B86 05:9B76: 6E        .byte $6E   ; 
- D 0 - I - 0x015B87 05:9B77: 37        .byte $37   ; 
- D 0 - I - 0x015B88 05:9B78: 6C        .byte $6C   ; 
- D 0 - I - 0x015B89 05:9B79: 69        .byte $69   ; 
- D 0 - I - 0x015B8A 05:9B7A: 69        .byte $69   ; 
- D 0 - I - 0x015B8B 05:9B7B: 69        .byte $69   ; 
- D 0 - I - 0x015B8C 05:9B7C: 69        .byte $69   ; 
- D 0 - I - 0x015B8D 05:9B7D: 69        .byte $69   ; 
- D 0 - I - 0x015B8E 05:9B7E: 6D        .byte $6D   ; 
- D 0 - I - 0x015B8F 05:9B7F: 37        .byte $37   ; 
- D 0 - I - 0x015B90 05:9B80: 3C        .byte $3C   ; 
- D 0 - I - 0x015B91 05:9B81: 3C        .byte $3C   ; 
- D 0 - I - 0x015B92 05:9B82: 3C        .byte $3C   ; 
- D 0 - I - 0x015B93 05:9B83: 3C        .byte $3C   ; 
- D 0 - I - 0x015B94 05:9B84: 3C        .byte $3C   ; 
- D 0 - I - 0x015B95 05:9B85: 3C        .byte $3C   ; 
- D 0 - I - 0x015B96 05:9B86: 3C        .byte $3C   ; 



_off018_06_9B87_0C:
- D 0 - I - 0x015B97 05:9B87: 37        .byte $37   ; 
- D 0 - I - 0x015B98 05:9B88: 37        .byte $37   ; 
- D 0 - I - 0x015B99 05:9B89: 37        .byte $37   ; 
- D 0 - I - 0x015B9A 05:9B8A: 37        .byte $37   ; 
- D 0 - I - 0x015B9B 05:9B8B: 37        .byte $37   ; 
- D 0 - I - 0x015B9C 05:9B8C: 37        .byte $37   ; 
- D 0 - I - 0x015B9D 05:9B8D: 37        .byte $37   ; 
- D 0 - I - 0x015B9E 05:9B8E: 37        .byte $37   ; 
- D 0 - I - 0x015B9F 05:9B8F: 37        .byte $37   ; 
- D 0 - I - 0x015BA0 05:9B90: 3D        .byte $3D   ; 
- D 0 - I - 0x015BA1 05:9B91: 6E        .byte $6E   ; 
- D 0 - I - 0x015BA2 05:9B92: 37        .byte $37   ; 
- D 0 - I - 0x015BA3 05:9B93: 6E        .byte $6E   ; 
- D 0 - I - 0x015BA4 05:9B94: 37        .byte $37   ; 
- D 0 - I - 0x015BA5 05:9B95: 37        .byte $37   ; 
- D 0 - I - 0x015BA6 05:9B96: 37        .byte $37   ; 
- D 0 - I - 0x015BA7 05:9B97: 6C        .byte $6C   ; 
- D 0 - I - 0x015BA8 05:9B98: 69        .byte $69   ; 
- D 0 - I - 0x015BA9 05:9B99: 69        .byte $69   ; 
- D 0 - I - 0x015BAA 05:9B9A: 69        .byte $69   ; 
- D 0 - I - 0x015BAB 05:9B9B: 69        .byte $69   ; 
- D 0 - I - 0x015BAC 05:9B9C: 6D        .byte $6D   ; 
- D 0 - I - 0x015BAD 05:9B9D: 37        .byte $37   ; 
- D 0 - I - 0x015BAE 05:9B9E: 37        .byte $37   ; 
- D 0 - I - 0x015BAF 05:9B9F: 3C        .byte $3C   ; 
- D 0 - I - 0x015BB0 05:9BA0: 3C        .byte $3C   ; 
- D 0 - I - 0x015BB1 05:9BA1: 3C        .byte $3C   ; 
- D 0 - I - 0x015BB2 05:9BA2: 3C        .byte $3C   ; 
- D 0 - I - 0x015BB3 05:9BA3: 3C        .byte $3C   ; 
- D 0 - I - 0x015BB4 05:9BA4: 3C        .byte $3C   ; 
- D 0 - I - 0x015BB5 05:9BA5: 37        .byte $37   ; 
- D 0 - I - 0x015BB6 05:9BA6: 37        .byte $37   ; 
- D 0 - I - 0x015BB7 05:9BA7: 3C        .byte $3C   ; 
- D 0 - I - 0x015BB8 05:9BA8: 37        .byte $37   ; 
- D 0 - I - 0x015BB9 05:9BA9: 37        .byte $37   ; 
- D 0 - I - 0x015BBA 05:9BAA: 6E        .byte $6E   ; 
- D 0 - I - 0x015BBB 05:9BAB: 37        .byte $37   ; 
- D 0 - I - 0x015BBC 05:9BAC: 37        .byte $37   ; 
- D 0 - I - 0x015BBD 05:9BAD: 37        .byte $37   ; 
- D 0 - I - 0x015BBE 05:9BAE: 6E        .byte $6E   ; 
- D 0 - I - 0x015BBF 05:9BAF: 37        .byte $37   ; 
- D 0 - I - 0x015BC0 05:9BB0: 37        .byte $37   ; 
- D 0 - I - 0x015BC1 05:9BB1: 6C        .byte $6C   ; 
- D 0 - I - 0x015BC2 05:9BB2: 69        .byte $69   ; 
- D 0 - I - 0x015BC3 05:9BB3: 69        .byte $69   ; 
- D 0 - I - 0x015BC4 05:9BB4: 69        .byte $69   ; 
- D 0 - I - 0x015BC5 05:9BB5: 69        .byte $69   ; 
- D 0 - I - 0x015BC6 05:9BB6: 6D        .byte $6D   ; 
- D 0 - I - 0x015BC7 05:9BB7: 37        .byte $37   ; 
- D 0 - I - 0x015BC8 05:9BB8: 37        .byte $37   ; 
- D 0 - I - 0x015BC9 05:9BB9: 3C        .byte $3C   ; 
- D 0 - I - 0x015BCA 05:9BBA: 3C        .byte $3C   ; 
- D 0 - I - 0x015BCB 05:9BBB: 3C        .byte $3C   ; 
- D 0 - I - 0x015BCC 05:9BBC: 3C        .byte $3C   ; 
- D 0 - I - 0x015BCD 05:9BBD: 3C        .byte $3C   ; 
- D 0 - I - 0x015BCE 05:9BBE: 3C        .byte $3C   ; 
- D 0 - I - 0x015BCF 05:9BBF: 00        .byte $00   ; 
- D 0 - I - 0x015BD0 05:9BC0: 00        .byte $00   ; 
- D 0 - I - 0x015BD1 05:9BC1: 00        .byte $00   ; 
- D 0 - I - 0x015BD2 05:9BC2: 00        .byte $00   ; 
- D 0 - I - 0x015BD3 05:9BC3: 00        .byte $00   ; 
- D 0 - I - 0x015BD4 05:9BC4: 00        .byte $00   ; 
- D 0 - I - 0x015BD5 05:9BC5: 00        .byte $00   ; 
- D 0 - I - 0x015BD6 05:9BC6: 00        .byte $00   ; 



_off018_06_9BC7_0D:
- D 0 - I - 0x015BD7 05:9BC7: 00        .byte $00   ; 
- D 0 - I - 0x015BD8 05:9BC8: 00        .byte $00   ; 
- D 0 - I - 0x015BD9 05:9BC9: 00        .byte $00   ; 
- D 0 - I - 0x015BDA 05:9BCA: 00        .byte $00   ; 
- D 0 - I - 0x015BDB 05:9BCB: 00        .byte $00   ; 
- D 0 - I - 0x015BDC 05:9BCC: 00        .byte $00   ; 
- D 0 - I - 0x015BDD 05:9BCD: 00        .byte $00   ; 
- D 0 - I - 0x015BDE 05:9BCE: 00        .byte $00   ; 
- D 0 - I - 0x015BDF 05:9BCF: 00        .byte $00   ; 
- D 0 - I - 0x015BE0 05:9BD0: 00        .byte $00   ; 
- D 0 - I - 0x015BE1 05:9BD1: 00        .byte $00   ; 
- D 0 - I - 0x015BE2 05:9BD2: 00        .byte $00   ; 
- D 0 - I - 0x015BE3 05:9BD3: 00        .byte $00   ; 
- D 0 - I - 0x015BE4 05:9BD4: 00        .byte $00   ; 
- D 0 - I - 0x015BE5 05:9BD5: 00        .byte $00   ; 
- D 0 - I - 0x015BE6 05:9BD6: 00        .byte $00   ; 
- D 0 - I - 0x015BE7 05:9BD7: 00        .byte $00   ; 
- D 0 - I - 0x015BE8 05:9BD8: 00        .byte $00   ; 
- D 0 - I - 0x015BE9 05:9BD9: 00        .byte $00   ; 
- D 0 - I - 0x015BEA 05:9BDA: 00        .byte $00   ; 
- D 0 - I - 0x015BEB 05:9BDB: 00        .byte $00   ; 
- D 0 - I - 0x015BEC 05:9BDC: 00        .byte $00   ; 
- D 0 - I - 0x015BED 05:9BDD: 00        .byte $00   ; 
- D 0 - I - 0x015BEE 05:9BDE: 00        .byte $00   ; 
- D 0 - I - 0x015BEF 05:9BDF: 00        .byte $00   ; 
- D 0 - I - 0x015BF0 05:9BE0: 00        .byte $00   ; 
- D 0 - I - 0x015BF1 05:9BE1: 00        .byte $00   ; 
- D 0 - I - 0x015BF2 05:9BE2: 00        .byte $00   ; 
- D 0 - I - 0x015BF3 05:9BE3: 00        .byte $00   ; 
- D 0 - I - 0x015BF4 05:9BE4: 00        .byte $00   ; 
- D 0 - I - 0x015BF5 05:9BE5: 00        .byte $00   ; 
- D 0 - I - 0x015BF6 05:9BE6: 00        .byte $00   ; 
- D 0 - I - 0x015BF7 05:9BE7: 00        .byte $00   ; 
- D 0 - I - 0x015BF8 05:9BE8: 00        .byte $00   ; 
- D 0 - I - 0x015BF9 05:9BE9: 00        .byte $00   ; 
- D 0 - I - 0x015BFA 05:9BEA: 00        .byte $00   ; 
- D 0 - I - 0x015BFB 05:9BEB: 00        .byte $00   ; 
- D 0 - I - 0x015BFC 05:9BEC: 00        .byte $00   ; 
- D 0 - I - 0x015BFD 05:9BED: 00        .byte $00   ; 
- D 0 - I - 0x015BFE 05:9BEE: 00        .byte $00   ; 
- D 0 - I - 0x015BFF 05:9BEF: 00        .byte $00   ; 
- D 0 - I - 0x015C00 05:9BF0: 00        .byte $00   ; 
- D 0 - I - 0x015C01 05:9BF1: 00        .byte $00   ; 
- D 0 - I - 0x015C02 05:9BF2: 00        .byte $00   ; 
- D 0 - I - 0x015C03 05:9BF3: 00        .byte $00   ; 
- D 0 - I - 0x015C04 05:9BF4: 00        .byte $00   ; 
- D 0 - I - 0x015C05 05:9BF5: 00        .byte $00   ; 
- D 0 - I - 0x015C06 05:9BF6: 00        .byte $00   ; 
- D 0 - I - 0x015C07 05:9BF7: 00        .byte $00   ; 
- D 0 - I - 0x015C08 05:9BF8: 00        .byte $00   ; 
- D 0 - I - 0x015C09 05:9BF9: 00        .byte $00   ; 
- D 0 - I - 0x015C0A 05:9BFA: 00        .byte $00   ; 
- D 0 - I - 0x015C0B 05:9BFB: 00        .byte $00   ; 
- D 0 - I - 0x015C0C 05:9BFC: 00        .byte $00   ; 
- D 0 - I - 0x015C0D 05:9BFD: 00        .byte $00   ; 
- D 0 - I - 0x015C0E 05:9BFE: 00        .byte $00   ; 
- D 0 - I - 0x015C0F 05:9BFF: 00        .byte $00   ; 
- D 0 - I - 0x015C10 05:9C00: 00        .byte $00   ; 
- D 0 - I - 0x015C11 05:9C01: 00        .byte $00   ; 
- D 0 - I - 0x015C12 05:9C02: 00        .byte $00   ; 
- D 0 - I - 0x015C13 05:9C03: 00        .byte $00   ; 
- D 0 - I - 0x015C14 05:9C04: 00        .byte $00   ; 
- D 0 - I - 0x015C15 05:9C05: 00        .byte $00   ; 
- D 0 - I - 0x015C16 05:9C06: 00        .byte $00   ; 



_off018_06_9C07_0E:
- D 0 - I - 0x015C17 05:9C07: 00        .byte $00   ; 
- D 0 - I - 0x015C18 05:9C08: 71        .byte $71   ; 
- D 0 - I - 0x015C19 05:9C09: 72        .byte $72   ; 
- D 0 - I - 0x015C1A 05:9C0A: 73        .byte $73   ; 
- D 0 - I - 0x015C1B 05:9C0B: 74        .byte $74   ; 
- D 0 - I - 0x015C1C 05:9C0C: 75        .byte $75   ; 
- D 0 - I - 0x015C1D 05:9C0D: 76        .byte $76   ; 
- D 0 - I - 0x015C1E 05:9C0E: 00        .byte $00   ; 
- D 0 - I - 0x015C1F 05:9C0F: 00        .byte $00   ; 
- D 0 - I - 0x015C20 05:9C10: 77        .byte $77   ; 
- D 0 - I - 0x015C21 05:9C11: 78        .byte $78   ; 
- D 0 - I - 0x015C22 05:9C12: 79        .byte $79   ; 
- D 0 - I - 0x015C23 05:9C13: 7A        .byte $7A   ; 
- D 0 - I - 0x015C24 05:9C14: 7B        .byte $7B   ; 
- D 0 - I - 0x015C25 05:9C15: 00        .byte $00   ; 
- D 0 - I - 0x015C26 05:9C16: 00        .byte $00   ; 
- D 0 - I - 0x015C27 05:9C17: 7C        .byte $7C   ; 
- D 0 - I - 0x015C28 05:9C18: 7D        .byte $7D   ; 
- D 0 - I - 0x015C29 05:9C19: 7E        .byte $7E   ; 
- D 0 - I - 0x015C2A 05:9C1A: 7F        .byte $7F   ; 
- D 0 - I - 0x015C2B 05:9C1B: 80        .byte $80   ; 
- D 0 - I - 0x015C2C 05:9C1C: 81        .byte $81   ; 
- D 0 - I - 0x015C2D 05:9C1D: 82        .byte $82   ; 
- D 0 - I - 0x015C2E 05:9C1E: 83        .byte $83   ; 
- D 0 - I - 0x015C2F 05:9C1F: 00        .byte $00   ; 
- D 0 - I - 0x015C30 05:9C20: 84        .byte $84   ; 
- D 0 - I - 0x015C31 05:9C21: 85        .byte $85   ; 
- D 0 - I - 0x015C32 05:9C22: 86        .byte $86   ; 
- D 0 - I - 0x015C33 05:9C23: 87        .byte $87   ; 
- D 0 - I - 0x015C34 05:9C24: 88        .byte $88   ; 
- D 0 - I - 0x015C35 05:9C25: 89        .byte $89   ; 
- D 0 - I - 0x015C36 05:9C26: 00        .byte $00   ; 
- D 0 - I - 0x015C37 05:9C27: 00        .byte $00   ; 
- D 0 - I - 0x015C38 05:9C28: 8A        .byte $8A   ; 
- D 0 - I - 0x015C39 05:9C29: 8B        .byte $8B   ; 
- D 0 - I - 0x015C3A 05:9C2A: 8C        .byte $8C   ; 
- D 0 - I - 0x015C3B 05:9C2B: 8D        .byte $8D   ; 
- D 0 - I - 0x015C3C 05:9C2C: 8E        .byte $8E   ; 
- D 0 - I - 0x015C3D 05:9C2D: 8F        .byte $8F   ; 
- D 0 - I - 0x015C3E 05:9C2E: 00        .byte $00   ; 
- D 0 - I - 0x015C3F 05:9C2F: 90        .byte $90   ; 
- D 0 - I - 0x015C40 05:9C30: 91        .byte $91   ; 
- D 0 - I - 0x015C41 05:9C31: 92        .byte $92   ; 
- D 0 - I - 0x015C42 05:9C32: 93        .byte $93   ; 
- D 0 - I - 0x015C43 05:9C33: 94        .byte $94   ; 
- D 0 - I - 0x015C44 05:9C34: 95        .byte $95   ; 
- D 0 - I - 0x015C45 05:9C35: 96        .byte $96   ; 
- D 0 - I - 0x015C46 05:9C36: 97        .byte $97   ; 
- D 0 - I - 0x015C47 05:9C37: 98        .byte $98   ; 
- D 0 - I - 0x015C48 05:9C38: 99        .byte $99   ; 
- D 0 - I - 0x015C49 05:9C39: 9A        .byte $9A   ; 
- D 0 - I - 0x015C4A 05:9C3A: 9B        .byte $9B   ; 
- D 0 - I - 0x015C4B 05:9C3B: 9C        .byte $9C   ; 
- D 0 - I - 0x015C4C 05:9C3C: 9D        .byte $9D   ; 
- D 0 - I - 0x015C4D 05:9C3D: 9E        .byte $9E   ; 
- D 0 - I - 0x015C4E 05:9C3E: 9F        .byte $9F   ; 
- - - - - - 0x015C4F 05:9C3F: A0        .byte $A0   ; 
- - - - - - 0x015C50 05:9C40: A0        .byte $A0   ; 
- - - - - - 0x015C51 05:9C41: A0        .byte $A0   ; 
- - - - - - 0x015C52 05:9C42: A0        .byte $A0   ; 
- - - - - - 0x015C53 05:9C43: A0        .byte $A0   ; 
- - - - - - 0x015C54 05:9C44: A0        .byte $A0   ; 
- - - - - - 0x015C55 05:9C45: A0        .byte $A0   ; 
- - - - - - 0x015C56 05:9C46: A0        .byte $A0   ; 



_off006_0x015C57_06_area_7:
- D 0 - I - 0x015C57 05:9C47: 00        .byte $00   ; 
- D 0 - I - 0x015C58 05:9C48: 00        .byte $00   ; 
- D 0 - I - 0x015C59 05:9C49: 00        .byte $00   ; 
- D 0 - I - 0x015C5A 05:9C4A: 00        .byte $00   ; 
- D 0 - I - 0x015C5B 05:9C4B: 00        .byte $00   ; 
- D 0 - I - 0x015C5C 05:9C4C: 00        .byte $00   ; 
- D 0 - I - 0x015C5D 05:9C4D: 00        .byte $00   ; 
- D 0 - I - 0x015C5E 05:9C4E: 00        .byte $00   ; 
- D 0 - I - 0x015C5F 05:9C4F: 00        .byte $00   ; 
- D 0 - I - 0x015C60 05:9C50: 00        .byte $00   ; 
- D 0 - I - 0x015C61 05:9C51: 00        .byte $00   ; 
- D 0 - I - 0x015C62 05:9C52: 00        .byte $00   ; 
- D 0 - I - 0x015C63 05:9C53: 00        .byte $00   ; 
- D 0 - I - 0x015C64 05:9C54: 00        .byte $00   ; 
- D 0 - I - 0x015C65 05:9C55: 00        .byte $00   ; 
- D 0 - I - 0x015C66 05:9C56: 00        .byte $00   ; 
- D 0 - I - 0x015C67 05:9C57: 17        .byte $17   ; 
- D 0 - I - 0x015C68 05:9C58: 5D        .byte $5D   ; 
- D 0 - I - 0x015C69 05:9C59: 18        .byte $18   ; 
- D 0 - I - 0x015C6A 05:9C5A: 5E        .byte $5E   ; 
- D 0 - I - 0x015C6B 05:9C5B: 5B        .byte $5B   ; 
- D 0 - I - 0x015C6C 05:9C5C: 5C        .byte $5C   ; 
- D 0 - I - 0x015C6D 05:9C5D: 5F        .byte $5F   ; 
- D 0 - I - 0x015C6E 05:9C5E: 5A        .byte $5A   ; 
- D 0 - I - 0x015C6F 05:9C5F: 20        .byte $20   ; 
- D 0 - I - 0x015C70 05:9C60: 58        .byte $58   ; 
- D 0 - I - 0x015C71 05:9C61: 21        .byte $21   ; 
- D 0 - I - 0x015C72 05:9C62: 59        .byte $59   ; 
- D 0 - I - 0x015C73 05:9C63: 16        .byte $16   ; 
- D 0 - I - 0x015C74 05:9C64: 19        .byte $19   ; 
- D 0 - I - 0x015C75 05:9C65: 1A        .byte $1A   ; 
- D 0 - I - 0x015C76 05:9C66: 1B        .byte $1B   ; 
- D 0 - I - 0x015C77 05:9C67: 3A        .byte $3A   ; 
- D 0 - I - 0x015C78 05:9C68: 1C        .byte $1C   ; 
- D 0 - I - 0x015C79 05:9C69: 1D        .byte $1D   ; 
- D 0 - I - 0x015C7A 05:9C6A: 3B        .byte $3B   ; 
- D 0 - I - 0x015C7B 05:9C6B: 3C        .byte $3C   ; 
- D 0 - I - 0x015C7C 05:9C6C: 3D        .byte $3D   ; 
- D 0 - I - 0x015C7D 05:9C6D: 3E        .byte $3E   ; 
- D 0 - I - 0x015C7E 05:9C6E: 3F        .byte $3F   ; 
- D 0 - I - 0x015C7F 05:9C6F: 22        .byte $22   ; 
- D 0 - I - 0x015C80 05:9C70: 40        .byte $40   ; 
- D 0 - I - 0x015C81 05:9C71: 23        .byte $23   ; 
- D 0 - I - 0x015C82 05:9C72: 41        .byte $41   ; 
- D 0 - I - 0x015C83 05:9C73: 42        .byte $42   ; 
- D 0 - I - 0x015C84 05:9C74: 43        .byte $43   ; 
- D 0 - I - 0x015C85 05:9C75: 44        .byte $44   ; 
- D 0 - I - 0x015C86 05:9C76: 45        .byte $45   ; 
- D 0 - I - 0x015C87 05:9C77: 1E        .byte $1E   ; 
- D 0 - I - 0x015C88 05:9C78: 46        .byte $46   ; 
- D 0 - I - 0x015C89 05:9C79: 1F        .byte $1F   ; 
- D 0 - I - 0x015C8A 05:9C7A: 60        .byte $60   ; 
- D 0 - I - 0x015C8B 05:9C7B: 61        .byte $61   ; 
- D 0 - I - 0x015C8C 05:9C7C: 62        .byte $62   ; 
- D 0 - I - 0x015C8D 05:9C7D: 63        .byte $63   ; 
- D 0 - I - 0x015C8E 05:9C7E: 64        .byte $64   ; 
- D 0 - I - 0x015C8F 05:9C7F: 24        .byte $24   ; 
- D 0 - I - 0x015C90 05:9C80: 65        .byte $65   ; 
- D 0 - I - 0x015C91 05:9C81: 25        .byte $25   ; 
- D 0 - I - 0x015C92 05:9C82: 66        .byte $66   ; 
- D 0 - I - 0x015C93 05:9C83: 67        .byte $67   ; 
- D 0 - I - 0x015C94 05:9C84: 68        .byte $68   ; 
- D 0 - I - 0x015C95 05:9C85: 69        .byte $69   ; 
- D 0 - I - 0x015C96 05:9C86: 6A        .byte $6A   ; 
- D 0 - I - 0x015C97 05:9C87: 03        .byte $03   ; 
- D 0 - I - 0x015C98 05:9C88: 00        .byte $00   ; 
- D 0 - I - 0x015C99 05:9C89: 00        .byte $00   ; 
- D 0 - I - 0x015C9A 05:9C8A: 00        .byte $00   ; 
- D 0 - I - 0x015C9B 05:9C8B: 71        .byte $71   ; 
- D 0 - I - 0x015C9C 05:9C8C: 00        .byte $00   ; 
- D 0 - I - 0x015C9D 05:9C8D: 00        .byte $00   ; 
- D 0 - I - 0x015C9E 05:9C8E: 00        .byte $00   ; 
- D 0 - I - 0x015C9F 05:9C8F: 00        .byte $00   ; 
- D 0 - I - 0x015CA0 05:9C90: 00        .byte $00   ; 
- D 0 - I - 0x015CA1 05:9C91: 00        .byte $00   ; 
- D 0 - I - 0x015CA2 05:9C92: 00        .byte $00   ; 
- D 0 - I - 0x015CA3 05:9C93: 00        .byte $00   ; 
- D 0 - I - 0x015CA4 05:9C94: 00        .byte $00   ; 
- D 0 - I - 0x015CA5 05:9C95: 00        .byte $00   ; 
- D 0 - I - 0x015CA6 05:9C96: 00        .byte $00   ; 
- D 0 - I - 0x015CA7 05:9C97: 03        .byte $03   ; 
- D 0 - I - 0x015CA8 05:9C98: 00        .byte $00   ; 
- D 0 - I - 0x015CA9 05:9C99: 00        .byte $00   ; 
- D 0 - I - 0x015CAA 05:9C9A: 73        .byte $73   ; 
- D 0 - I - 0x015CAB 05:9C9B: 71        .byte $71   ; 
- D 0 - I - 0x015CAC 05:9C9C: 00        .byte $00   ; 
- D 0 - I - 0x015CAD 05:9C9D: 00        .byte $00   ; 
- D 0 - I - 0x015CAE 05:9C9E: 74        .byte $74   ; 
- D 0 - I - 0x015CAF 05:9C9F: 04        .byte $04   ; 
- D 0 - I - 0x015CB0 05:9CA0: 00        .byte $00   ; 
- D 0 - I - 0x015CB1 05:9CA1: 00        .byte $00   ; 
- D 0 - I - 0x015CB2 05:9CA2: 75        .byte $75   ; 
- D 0 - I - 0x015CB3 05:9CA3: 72        .byte $72   ; 
- D 0 - I - 0x015CB4 05:9CA4: 00        .byte $00   ; 
- D 0 - I - 0x015CB5 05:9CA5: 00        .byte $00   ; 
- D 0 - I - 0x015CB6 05:9CA6: 76        .byte $76   ; 
- D 0 - I - 0x015CB7 05:9CA7: 03        .byte $03   ; 
- D 0 - I - 0x015CB8 05:9CA8: 00        .byte $00   ; 
- D 0 - I - 0x015CB9 05:9CA9: 00        .byte $00   ; 
- D 0 - I - 0x015CBA 05:9CAA: 00        .byte $00   ; 
- D 0 - I - 0x015CBB 05:9CAB: 71        .byte $71   ; 
- D 0 - I - 0x015CBC 05:9CAC: 00        .byte $00   ; 
- D 0 - I - 0x015CBD 05:9CAD: 00        .byte $00   ; 
- D 0 - I - 0x015CBE 05:9CAE: 00        .byte $00   ; 
- D 0 - I - 0x015CBF 05:9CAF: 04        .byte $04   ; 
- D 0 - I - 0x015CC0 05:9CB0: 00        .byte $00   ; 
- D 0 - I - 0x015CC1 05:9CB1: 00        .byte $00   ; 
- D 0 - I - 0x015CC2 05:9CB2: 00        .byte $00   ; 
- D 0 - I - 0x015CC3 05:9CB3: 72        .byte $72   ; 
- D 0 - I - 0x015CC4 05:9CB4: 00        .byte $00   ; 
- D 0 - I - 0x015CC5 05:9CB5: 00        .byte $00   ; 
- D 0 - I - 0x015CC6 05:9CB6: 00        .byte $00   ; 
- D 0 - I - 0x015CC7 05:9CB7: 01        .byte $01   ; 
- D 0 - I - 0x015CC8 05:9CB8: 00        .byte $00   ; 
- D 0 - I - 0x015CC9 05:9CB9: 00        .byte $00   ; 
- D 0 - I - 0x015CCA 05:9CBA: 6D        .byte $6D   ; 
- D 0 - I - 0x015CCB 05:9CBB: 6B        .byte $6B   ; 
- D 0 - I - 0x015CCC 05:9CBC: 00        .byte $00   ; 
- D 0 - I - 0x015CCD 05:9CBD: 00        .byte $00   ; 
- D 0 - I - 0x015CCE 05:9CBE: 00        .byte $00   ; 
- D 0 - I - 0x015CCF 05:9CBF: 02        .byte $02   ; 
- D 0 - I - 0x015CD0 05:9CC0: 00        .byte $00   ; 
- D 0 - I - 0x015CD1 05:9CC1: 00        .byte $00   ; 
- D 0 - I - 0x015CD2 05:9CC2: 00        .byte $00   ; 
- D 0 - I - 0x015CD3 05:9CC3: 6C        .byte $6C   ; 
- D 0 - I - 0x015CD4 05:9CC4: 00        .byte $00   ; 
- D 0 - I - 0x015CD5 05:9CC5: 00        .byte $00   ; 
- D 0 - I - 0x015CD6 05:9CC6: 70        .byte $70   ; 
- D 0 - I - 0x015CD7 05:9CC7: 00        .byte $00   ; 
- D 0 - I - 0x015CD8 05:9CC8: 00        .byte $00   ; 
- D 0 - I - 0x015CD9 05:9CC9: 00        .byte $00   ; 
- D 0 - I - 0x015CDA 05:9CCA: 6D        .byte $6D   ; 
- D 0 - I - 0x015CDB 05:9CCB: 00        .byte $00   ; 
- D 0 - I - 0x015CDC 05:9CCC: 00        .byte $00   ; 
- D 0 - I - 0x015CDD 05:9CCD: 00        .byte $00   ; 
- D 0 - I - 0x015CDE 05:9CCE: 00        .byte $00   ; 
- D 0 - I - 0x015CDF 05:9CCF: 00        .byte $00   ; 
- D 0 - I - 0x015CE0 05:9CD0: 00        .byte $00   ; 
- D 0 - I - 0x015CE1 05:9CD1: 00        .byte $00   ; 
- D 0 - I - 0x015CE2 05:9CD2: 00        .byte $00   ; 
- D 0 - I - 0x015CE3 05:9CD3: 00        .byte $00   ; 
- D 0 - I - 0x015CE4 05:9CD4: 00        .byte $00   ; 
- D 0 - I - 0x015CE5 05:9CD5: 00        .byte $00   ; 
- D 0 - I - 0x015CE6 05:9CD6: 70        .byte $70   ; 
- D 0 - I - 0x015CE7 05:9CD7: 00        .byte $00   ; 
- D 0 - I - 0x015CE8 05:9CD8: 00        .byte $00   ; 
- D 0 - I - 0x015CE9 05:9CD9: 00        .byte $00   ; 
- D 0 - I - 0x015CEA 05:9CDA: 00        .byte $00   ; 
- D 0 - I - 0x015CEB 05:9CDB: 00        .byte $00   ; 
- D 0 - I - 0x015CEC 05:9CDC: 00        .byte $00   ; 
- D 0 - I - 0x015CED 05:9CDD: 00        .byte $00   ; 
- D 0 - I - 0x015CEE 05:9CDE: 00        .byte $00   ; 
- D 0 - I - 0x015CEF 05:9CDF: 00        .byte $00   ; 
- D 0 - I - 0x015CF0 05:9CE0: 00        .byte $00   ; 
- D 0 - I - 0x015CF1 05:9CE1: 00        .byte $00   ; 
- D 0 - I - 0x015CF2 05:9CE2: 00        .byte $00   ; 
- D 0 - I - 0x015CF3 05:9CE3: 77        .byte $77   ; 
- D 0 - I - 0x015CF4 05:9CE4: 00        .byte $00   ; 
- D 0 - I - 0x015CF5 05:9CE5: 00        .byte $00   ; 
- D 0 - I - 0x015CF6 05:9CE6: 7A        .byte $7A   ; 
- D 0 - I - 0x015CF7 05:9CE7: 00        .byte $00   ; 
- D 0 - I - 0x015CF8 05:9CE8: 00        .byte $00   ; 
- D 0 - I - 0x015CF9 05:9CE9: 00        .byte $00   ; 
- D 0 - I - 0x015CFA 05:9CEA: 00        .byte $00   ; 
- D 0 - I - 0x015CFB 05:9CEB: 00        .byte $00   ; 
- D 0 - I - 0x015CFC 05:9CEC: 00        .byte $00   ; 
- D 0 - I - 0x015CFD 05:9CED: 00        .byte $00   ; 
- D 0 - I - 0x015CFE 05:9CEE: 00        .byte $00   ; 
- D 0 - I - 0x015CFF 05:9CEF: 00        .byte $00   ; 
- D 0 - I - 0x015D00 05:9CF0: 00        .byte $00   ; 
- D 0 - I - 0x015D01 05:9CF1: 00        .byte $00   ; 
- D 0 - I - 0x015D02 05:9CF2: 00        .byte $00   ; 
- D 0 - I - 0x015D03 05:9CF3: 7B        .byte $7B   ; 
- D 0 - I - 0x015D04 05:9CF4: 00        .byte $00   ; 
- D 0 - I - 0x015D05 05:9CF5: 78        .byte $78   ; 
- D 0 - I - 0x015D06 05:9CF6: 79        .byte $79   ; 
- D 0 - I - 0x015D07 05:9CF7: 00        .byte $00   ; 
- D 0 - I - 0x015D08 05:9CF8: 00        .byte $00   ; 
- D 0 - I - 0x015D09 05:9CF9: 00        .byte $00   ; 
- D 0 - I - 0x015D0A 05:9CFA: 00        .byte $00   ; 
- D 0 - I - 0x015D0B 05:9CFB: 00        .byte $00   ; 
- D 0 - I - 0x015D0C 05:9CFC: 00        .byte $00   ; 
- D 0 - I - 0x015D0D 05:9CFD: 00        .byte $00   ; 
- D 0 - I - 0x015D0E 05:9CFE: 00        .byte $00   ; 
- D 0 - I - 0x015D0F 05:9CFF: 00        .byte $00   ; 
- D 0 - I - 0x015D10 05:9D00: 00        .byte $00   ; 
- D 0 - I - 0x015D11 05:9D01: 00        .byte $00   ; 
- D 0 - I - 0x015D12 05:9D02: 00        .byte $00   ; 
- D 0 - I - 0x015D13 05:9D03: 7A        .byte $7A   ; 
- D 0 - I - 0x015D14 05:9D04: 7B        .byte $7B   ; 
- D 0 - I - 0x015D15 05:9D05: 78        .byte $78   ; 
- D 0 - I - 0x015D16 05:9D06: 79        .byte $79   ; 
- - - - - - 0x015D17 05:9D07: 03        .byte $03   ; 
- - - - - - 0x015D18 05:9D08: 00        .byte $00   ; 
- - - - - - 0x015D19 05:9D09: 00        .byte $00   ; 
- - - - - - 0x015D1A 05:9D0A: 76        .byte $76   ; 
- - - - - - 0x015D1B 05:9D0B: 71        .byte $71   ; 
- - - - - - 0x015D1C 05:9D0C: 00        .byte $00   ; 
- - - - - - 0x015D1D 05:9D0D: 00        .byte $00   ; 
- - - - - - 0x015D1E 05:9D0E: 6D        .byte $6D   ; 
- - - - - - 0x015D1F 05:9D0F: 04        .byte $04   ; 
- - - - - - 0x015D20 05:9D10: 00        .byte $00   ; 
- - - - - - 0x015D21 05:9D11: 00        .byte $00   ; 
- - - - - - 0x015D22 05:9D12: 6F        .byte $6F   ; 
- - - - - - 0x015D23 05:9D13: 72        .byte $72   ; 
- - - - - - 0x015D24 05:9D14: 00        .byte $00   ; 
- - - - - - 0x015D25 05:9D15: 00        .byte $00   ; 
- - - - - - 0x015D26 05:9D16: 70        .byte $70   ; 
- D 0 - I - 0x015D27 05:9D17: 3A        .byte $3A   ; 
- D 0 - I - 0x015D28 05:9D18: 1C        .byte $1C   ; 
- D 0 - I - 0x015D29 05:9D19: 1D        .byte $1D   ; 
- D 0 - I - 0x015D2A 05:9D1A: 3B        .byte $3B   ; 
- D 0 - I - 0x015D2B 05:9D1B: 3C        .byte $3C   ; 
- D 0 - I - 0x015D2C 05:9D1C: 3D        .byte $3D   ; 
- D 0 - I - 0x015D2D 05:9D1D: 3E        .byte $3E   ; 
- D 0 - I - 0x015D2E 05:9D1E: 3F        .byte $3F   ; 
- D 0 - I - 0x015D2F 05:9D1F: 22        .byte $22   ; 
- D 0 - I - 0x015D30 05:9D20: 40        .byte $40   ; 
- D 0 - I - 0x015D31 05:9D21: 23        .byte $23   ; 
- D 0 - I - 0x015D32 05:9D22: 41        .byte $41   ; 
- D 0 - I - 0x015D33 05:9D23: 42        .byte $42   ; 
- D 0 - I - 0x015D34 05:9D24: 43        .byte $43   ; 
- D 0 - I - 0x015D35 05:9D25: 44        .byte $44   ; 
- D 0 - I - 0x015D36 05:9D26: 7C        .byte $7C   ; 
- D 0 - I - 0x015D37 05:9D27: 1E        .byte $1E   ; 
- D 0 - I - 0x015D38 05:9D28: 46        .byte $46   ; 
- D 0 - I - 0x015D39 05:9D29: 1F        .byte $1F   ; 
- D 0 - I - 0x015D3A 05:9D2A: 60        .byte $60   ; 
- D 0 - I - 0x015D3B 05:9D2B: 61        .byte $61   ; 
- D 0 - I - 0x015D3C 05:9D2C: 62        .byte $62   ; 
- D 0 - I - 0x015D3D 05:9D2D: 63        .byte $63   ; 
- D 0 - I - 0x015D3E 05:9D2E: 64        .byte $64   ; 
- D 0 - I - 0x015D3F 05:9D2F: 24        .byte $24   ; 
- D 0 - I - 0x015D40 05:9D30: 65        .byte $65   ; 
- D 0 - I - 0x015D41 05:9D31: 25        .byte $25   ; 
- D 0 - I - 0x015D42 05:9D32: 66        .byte $66   ; 
- D 0 - I - 0x015D43 05:9D33: 05        .byte $05   ; 
- D 0 - I - 0x015D44 05:9D34: 7D        .byte $7D   ; 
- D 0 - I - 0x015D45 05:9D35: 06        .byte $06   ; 
- D 0 - I - 0x015D46 05:9D36: 7E        .byte $7E   ; 
- D 0 - I - 0x015D47 05:9D37: 1E        .byte $1E   ; 
- D 0 - I - 0x015D48 05:9D38: 46        .byte $46   ; 
- D 0 - I - 0x015D49 05:9D39: 1F        .byte $1F   ; 
- D 0 - I - 0x015D4A 05:9D3A: 60        .byte $60   ; 
- D 0 - I - 0x015D4B 05:9D3B: 61        .byte $61   ; 
- D 0 - I - 0x015D4C 05:9D3C: 62        .byte $62   ; 
- D 0 - I - 0x015D4D 05:9D3D: 63        .byte $63   ; 
- D 0 - I - 0x015D4E 05:9D3E: 64        .byte $64   ; 
- D 0 - I - 0x015D4F 05:9D3F: 24        .byte $24   ; 
- D 0 - I - 0x015D50 05:9D40: 65        .byte $65   ; 
- D 0 - I - 0x015D51 05:9D41: 25        .byte $25   ; 
- D 0 - I - 0x015D52 05:9D42: 66        .byte $66   ; 
- D 0 - I - 0x015D53 05:9D43: 05        .byte $05   ; 
- D 0 - I - 0x015D54 05:9D44: 7D        .byte $7D   ; 
- D 0 - I - 0x015D55 05:9D45: 06        .byte $06   ; 
- D 0 - I - 0x015D56 05:9D46: 7F        .byte $7F   ; 
- D 0 - I - 0x015D57 05:9D47: 03        .byte $03   ; 
- D 0 - I - 0x015D58 05:9D48: 00        .byte $00   ; 
- D 0 - I - 0x015D59 05:9D49: 00        .byte $00   ; 
- D 0 - I - 0x015D5A 05:9D4A: 73        .byte $73   ; 
- D 0 - I - 0x015D5B 05:9D4B: 71        .byte $71   ; 
- D 0 - I - 0x015D5C 05:9D4C: 00        .byte $00   ; 
- D 0 - I - 0x015D5D 05:9D4D: 00        .byte $00   ; 
- D 0 - I - 0x015D5E 05:9D4E: 74        .byte $74   ; 
- D 0 - I - 0x015D5F 05:9D4F: 04        .byte $04   ; 
- D 0 - I - 0x015D60 05:9D50: 00        .byte $00   ; 
- D 0 - I - 0x015D61 05:9D51: 00        .byte $00   ; 
- D 0 - I - 0x015D62 05:9D52: 75        .byte $75   ; 
- D 0 - I - 0x015D63 05:9D53: 00        .byte $00   ; 
- D 0 - I - 0x015D64 05:9D54: 00        .byte $00   ; 
- D 0 - I - 0x015D65 05:9D55: 00        .byte $00   ; 
- D 0 - I - 0x015D66 05:9D56: 00        .byte $00   ; 
- D 0 - I - 0x015D67 05:9D57: 2A        .byte $2A   ; 
- D 0 - I - 0x015D68 05:9D58: 8E        .byte $8E   ; 
- D 0 - I - 0x015D69 05:9D59: 2B        .byte $2B   ; 
- D 0 - I - 0x015D6A 05:9D5A: 8F        .byte $8F   ; 
- D 0 - I - 0x015D6B 05:9D5B: 2C        .byte $2C   ; 
- D 0 - I - 0x015D6C 05:9D5C: 90        .byte $90   ; 
- D 0 - I - 0x015D6D 05:9D5D: 2D        .byte $2D   ; 
- D 0 - I - 0x015D6E 05:9D5E: 91        .byte $91   ; 
- D 0 - I - 0x015D6F 05:9D5F: 2B        .byte $2B   ; 
- D 0 - I - 0x015D70 05:9D60: 8F        .byte $8F   ; 
- D 0 - I - 0x015D71 05:9D61: 2A        .byte $2A   ; 
- D 0 - I - 0x015D72 05:9D62: 8E        .byte $8E   ; 
- D 0 - I - 0x015D73 05:9D63: 2D        .byte $2D   ; 
- D 0 - I - 0x015D74 05:9D64: 91        .byte $91   ; 
- D 0 - I - 0x015D75 05:9D65: 2C        .byte $2C   ; 
- D 0 - I - 0x015D76 05:9D66: 90        .byte $90   ; 
- D 0 - I - 0x015D77 05:9D67: 0C        .byte $0C   ; 
- D 0 - I - 0x015D78 05:9D68: B5        .byte $B5   ; 
- D 0 - I - 0x015D79 05:9D69: 0D        .byte $0D   ; 
- D 0 - I - 0x015D7A 05:9D6A: B6        .byte $B6   ; 
- D 0 - I - 0x015D7B 05:9D6B: B7        .byte $B7   ; 
- D 0 - I - 0x015D7C 05:9D6C: B8        .byte $B8   ; 
- D 0 - I - 0x015D7D 05:9D6D: 00        .byte $00   ; 
- D 0 - I - 0x015D7E 05:9D6E: 00        .byte $00   ; 
- D 0 - I - 0x015D7F 05:9D6F: 00        .byte $00   ; 
- D 0 - I - 0x015D80 05:9D70: 80        .byte $80   ; 
- D 0 - I - 0x015D81 05:9D71: 51        .byte $51   ; 
- D 0 - I - 0x015D82 05:9D72: 81        .byte $81   ; 
- D 0 - I - 0x015D83 05:9D73: 82        .byte $82   ; 
- D 0 - I - 0x015D84 05:9D74: 83        .byte $83   ; 
- D 0 - I - 0x015D85 05:9D75: 84        .byte $84   ; 
- D 0 - I - 0x015D86 05:9D76: 4D        .byte $4D   ; 
- D 0 - I - 0x015D87 05:9D77: 00        .byte $00   ; 
- D 0 - I - 0x015D88 05:9D78: 80        .byte $80   ; 
- D 0 - I - 0x015D89 05:9D79: 51        .byte $51   ; 
- D 0 - I - 0x015D8A 05:9D7A: 81        .byte $81   ; 
- D 0 - I - 0x015D8B 05:9D7B: 82        .byte $82   ; 
- D 0 - I - 0x015D8C 05:9D7C: 83        .byte $83   ; 
- D 0 - I - 0x015D8D 05:9D7D: 84        .byte $84   ; 
- D 0 - I - 0x015D8E 05:9D7E: 4D        .byte $4D   ; 
- D 0 - I - 0x015D8F 05:9D7F: 4D        .byte $4D   ; 
- D 0 - I - 0x015D90 05:9D80: 81        .byte $81   ; 
- D 0 - I - 0x015D91 05:9D81: 4F        .byte $4F   ; 
- D 0 - I - 0x015D92 05:9D82: 85        .byte $85   ; 
- D 0 - I - 0x015D93 05:9D83: 86        .byte $86   ; 
- D 0 - I - 0x015D94 05:9D84: 87        .byte $87   ; 
- D 0 - I - 0x015D95 05:9D85: 50        .byte $50   ; 
- D 0 - I - 0x015D96 05:9D86: 88        .byte $88   ; 
- D 0 - I - 0x015D97 05:9D87: 0C        .byte $0C   ; 
- D 0 - I - 0x015D98 05:9D88: B5        .byte $B5   ; 
- D 0 - I - 0x015D99 05:9D89: 0D        .byte $0D   ; 
- D 0 - I - 0x015D9A 05:9D8A: 00        .byte $00   ; 
- D 0 - I - 0x015D9B 05:9D8B: B7        .byte $B7   ; 
- D 0 - I - 0x015D9C 05:9D8C: B8        .byte $B8   ; 
- D 0 - I - 0x015D9D 05:9D8D: 00        .byte $00   ; 
- D 0 - I - 0x015D9E 05:9D8E: 00        .byte $00   ; 
- D 0 - I - 0x015D9F 05:9D8F: 00        .byte $00   ; 
- D 0 - I - 0x015DA0 05:9D90: 80        .byte $80   ; 
- D 0 - I - 0x015DA1 05:9D91: 51        .byte $51   ; 
- D 0 - I - 0x015DA2 05:9D92: 81        .byte $81   ; 
- D 0 - I - 0x015DA3 05:9D93: 82        .byte $82   ; 
- D 0 - I - 0x015DA4 05:9D94: 83        .byte $83   ; 
- D 0 - I - 0x015DA5 05:9D95: 84        .byte $84   ; 
- D 0 - I - 0x015DA6 05:9D96: 4E        .byte $4E   ; 
- D 0 - I - 0x015DA7 05:9D97: 00        .byte $00   ; 
- D 0 - I - 0x015DA8 05:9D98: 80        .byte $80   ; 
- D 0 - I - 0x015DA9 05:9D99: 51        .byte $51   ; 
- D 0 - I - 0x015DAA 05:9D9A: 81        .byte $81   ; 
- D 0 - I - 0x015DAB 05:9D9B: 82        .byte $82   ; 
- D 0 - I - 0x015DAC 05:9D9C: 83        .byte $83   ; 
- D 0 - I - 0x015DAD 05:9D9D: 84        .byte $84   ; 
- D 0 - I - 0x015DAE 05:9D9E: 4D        .byte $4D   ; 
- D 0 - I - 0x015DAF 05:9D9F: 4D        .byte $4D   ; 
- D 0 - I - 0x015DB0 05:9DA0: 81        .byte $81   ; 
- D 0 - I - 0x015DB1 05:9DA1: 4F        .byte $4F   ; 
- D 0 - I - 0x015DB2 05:9DA2: 85        .byte $85   ; 
- D 0 - I - 0x015DB3 05:9DA3: 8B        .byte $8B   ; 
- D 0 - I - 0x015DB4 05:9DA4: 50        .byte $50   ; 
- D 0 - I - 0x015DB5 05:9DA5: 88        .byte $88   ; 
- D 0 - I - 0x015DB6 05:9DA6: 8A        .byte $8A   ; 
- D 0 - I - 0x015DB7 05:9DA7: 4D        .byte $4D   ; 
- D 0 - I - 0x015DB8 05:9DA8: 81        .byte $81   ; 
- D 0 - I - 0x015DB9 05:9DA9: 4F        .byte $4F   ; 
- D 0 - I - 0x015DBA 05:9DAA: 85        .byte $85   ; 
- D 0 - I - 0x015DBB 05:9DAB: 86        .byte $86   ; 
- D 0 - I - 0x015DBC 05:9DAC: 87        .byte $87   ; 
- D 0 - I - 0x015DBD 05:9DAD: 50        .byte $50   ; 
- D 0 - I - 0x015DBE 05:9DAE: 88        .byte $88   ; 
- D 0 - I - 0x015DBF 05:9DAF: 26        .byte $26   ; 
- D 0 - I - 0x015DC0 05:9DB0: 89        .byte $89   ; 
- D 0 - I - 0x015DC1 05:9DB1: 27        .byte $27   ; 
- D 0 - I - 0x015DC2 05:9DB2: 28        .byte $28   ; 
- D 0 - I - 0x015DC3 05:9DB3: 29        .byte $29   ; 
- D 0 - I - 0x015DC4 05:9DB4: 8A        .byte $8A   ; 
- D 0 - I - 0x015DC5 05:9DB5: 28        .byte $28   ; 
- D 0 - I - 0x015DC6 05:9DB6: 92        .byte $92   ; 
- D 0 - I - 0x015DC7 05:9DB7: 26        .byte $26   ; 
- D 0 - I - 0x015DC8 05:9DB8: 89        .byte $89   ; 
- D 0 - I - 0x015DC9 05:9DB9: 27        .byte $27   ; 
- D 0 - I - 0x015DCA 05:9DBA: 28        .byte $28   ; 
- D 0 - I - 0x015DCB 05:9DBB: 29        .byte $29   ; 
- D 0 - I - 0x015DCC 05:9DBC: 8A        .byte $8A   ; 
- D 0 - I - 0x015DCD 05:9DBD: 28        .byte $28   ; 
- D 0 - I - 0x015DCE 05:9DBE: 92        .byte $92   ; 
- D 0 - I - 0x015DCF 05:9DBF: 2B        .byte $2B   ; 
- D 0 - I - 0x015DD0 05:9DC0: 8F        .byte $8F   ; 
- D 0 - I - 0x015DD1 05:9DC1: 2A        .byte $2A   ; 
- D 0 - I - 0x015DD2 05:9DC2: 8E        .byte $8E   ; 
- D 0 - I - 0x015DD3 05:9DC3: 2D        .byte $2D   ; 
- D 0 - I - 0x015DD4 05:9DC4: 91        .byte $91   ; 
- D 0 - I - 0x015DD5 05:9DC5: 2C        .byte $2C   ; 
- D 0 - I - 0x015DD6 05:9DC6: 90        .byte $90   ; 
- D 0 - I - 0x015DD7 05:9DC7: 4E        .byte $4E   ; 
- D 0 - I - 0x015DD8 05:9DC8: 8C        .byte $8C   ; 
- D 0 - I - 0x015DD9 05:9DC9: 50        .byte $50   ; 
- D 0 - I - 0x015DDA 05:9DCA: 88        .byte $88   ; 
- D 0 - I - 0x015DDB 05:9DCB: 8D        .byte $8D   ; 
- D 0 - I - 0x015DDC 05:9DCC: 29        .byte $29   ; 
- D 0 - I - 0x015DDD 05:9DCD: 8A        .byte $8A   ; 
- D 0 - I - 0x015DDE 05:9DCE: 28        .byte $28   ; 
- D 0 - I - 0x015DDF 05:9DCF: 00        .byte $00   ; 
- D 0 - I - 0x015DE0 05:9DD0: 00        .byte $00   ; 
- D 0 - I - 0x015DE1 05:9DD1: 00        .byte $00   ; 
- D 0 - I - 0x015DE2 05:9DD2: 00        .byte $00   ; 
- D 0 - I - 0x015DE3 05:9DD3: B7        .byte $B7   ; 
- D 0 - I - 0x015DE4 05:9DD4: B8        .byte $B8   ; 
- D 0 - I - 0x015DE5 05:9DD5: B9        .byte $B9   ; 
- D 0 - I - 0x015DE6 05:9DD6: BA        .byte $BA   ; 
- D 0 - I - 0x015DE7 05:9DD7: 29        .byte $29   ; 
- D 0 - I - 0x015DE8 05:9DD8: 8A        .byte $8A   ; 
- D 0 - I - 0x015DE9 05:9DD9: 28        .byte $28   ; 
- D 0 - I - 0x015DEA 05:9DDA: 92        .byte $92   ; 
- D 0 - I - 0x015DEB 05:9DDB: 93        .byte $93   ; 
- D 0 - I - 0x015DEC 05:9DDC: 0B        .byte $0B   ; 
- D 0 - I - 0x015DED 05:9DDD: 0B        .byte $0B   ; 
- D 0 - I - 0x015DEE 05:9DDE: 94        .byte $94   ; 
- D 0 - I - 0x015DEF 05:9DDF: 00        .byte $00   ; 
- D 0 - I - 0x015DF0 05:9DE0: 00        .byte $00   ; 
- D 0 - I - 0x015DF1 05:9DE1: 00        .byte $00   ; 
- D 0 - I - 0x015DF2 05:9DE2: 00        .byte $00   ; 
- D 0 - I - 0x015DF3 05:9DE3: B7        .byte $B7   ; 
- D 0 - I - 0x015DF4 05:9DE4: B8        .byte $B8   ; 
- D 0 - I - 0x015DF5 05:9DE5: B9        .byte $B9   ; 
- D 0 - I - 0x015DF6 05:9DE6: BA        .byte $BA   ; 
- D 0 - I - 0x015DF7 05:9DE7: 2A        .byte $2A   ; 
- D 0 - I - 0x015DF8 05:9DE8: 8E        .byte $8E   ; 
- D 0 - I - 0x015DF9 05:9DE9: 2B        .byte $2B   ; 
- D 0 - I - 0x015DFA 05:9DEA: 8F        .byte $8F   ; 
- D 0 - I - 0x015DFB 05:9DEB: 2C        .byte $2C   ; 
- D 0 - I - 0x015DFC 05:9DEC: 90        .byte $90   ; 
- D 0 - I - 0x015DFD 05:9DED: 2D        .byte $2D   ; 
- D 0 - I - 0x015DFE 05:9DEE: 91        .byte $91   ; 
- D 0 - I - 0x015DFF 05:9DEF: 00        .byte $00   ; 
- D 0 - I - 0x015E00 05:9DF0: 93        .byte $93   ; 
- D 0 - I - 0x015E01 05:9DF1: 07        .byte $07   ; 
- D 0 - I - 0x015E02 05:9DF2: 8E        .byte $8E   ; 
- D 0 - I - 0x015E03 05:9DF3: 00        .byte $00   ; 
- D 0 - I - 0x015E04 05:9DF4: 00        .byte $00   ; 
- D 0 - I - 0x015E05 05:9DF5: 00        .byte $00   ; 
- D 0 - I - 0x015E06 05:9DF6: 93        .byte $93   ; 
- D 0 - I - 0x015E07 05:9DF7: 2A        .byte $2A   ; 
- D 0 - I - 0x015E08 05:9DF8: 8E        .byte $8E   ; 
- D 0 - I - 0x015E09 05:9DF9: 2B        .byte $2B   ; 
- D 0 - I - 0x015E0A 05:9DFA: 8F        .byte $8F   ; 
- D 0 - I - 0x015E0B 05:9DFB: 2C        .byte $2C   ; 
- D 0 - I - 0x015E0C 05:9DFC: 90        .byte $90   ; 
- D 0 - I - 0x015E0D 05:9DFD: 2D        .byte $2D   ; 
- D 0 - I - 0x015E0E 05:9DFE: 91        .byte $91   ; 
- D 0 - I - 0x015E0F 05:9DFF: 2A        .byte $2A   ; 
- D 0 - I - 0x015E10 05:9E00: 8E        .byte $8E   ; 
- D 0 - I - 0x015E11 05:9E01: 2A        .byte $2A   ; 
- D 0 - I - 0x015E12 05:9E02: 8E        .byte $8E   ; 
- D 0 - I - 0x015E13 05:9E03: 0B        .byte $0B   ; 
- D 0 - I - 0x015E14 05:9E04: 94        .byte $94   ; 
- D 0 - I - 0x015E15 05:9E05: 0B        .byte $0B   ; 
- D 0 - I - 0x015E16 05:9E06: 94        .byte $94   ; 
- - - - - - 0x015E17 05:9E07: 00        .byte $00   ; 
- - - - - - 0x015E18 05:9E08: 80        .byte $80   ; 
- - - - - - 0x015E19 05:9E09: 51        .byte $51   ; 
- - - - - - 0x015E1A 05:9E0A: 81        .byte $81   ; 
- - - - - - 0x015E1B 05:9E0B: 82        .byte $82   ; 
- - - - - - 0x015E1C 05:9E0C: 83        .byte $83   ; 
- - - - - - 0x015E1D 05:9E0D: 84        .byte $84   ; 
- - - - - - 0x015E1E 05:9E0E: 4E        .byte $4E   ; 
- - - - - - 0x015E1F 05:9E0F: 4E        .byte $4E   ; 
- - - - - - 0x015E20 05:9E10: 8C        .byte $8C   ; 
- - - - - - 0x015E21 05:9E11: 50        .byte $50   ; 
- - - - - - 0x015E22 05:9E12: 88        .byte $88   ; 
- - - - - - 0x015E23 05:9E13: 8D        .byte $8D   ; 
- - - - - - 0x015E24 05:9E14: 29        .byte $29   ; 
- - - - - - 0x015E25 05:9E15: 8A        .byte $8A   ; 
- - - - - - 0x015E26 05:9E16: 28        .byte $28   ; 
- - - - - - 0x015E27 05:9E17: 4D        .byte $4D   ; 
- - - - - - 0x015E28 05:9E18: 81        .byte $81   ; 
- - - - - - 0x015E29 05:9E19: 4F        .byte $4F   ; 
- - - - - - 0x015E2A 05:9E1A: 85        .byte $85   ; 
- - - - - - 0x015E2B 05:9E1B: 8B        .byte $8B   ; 
- - - - - - 0x015E2C 05:9E1C: 50        .byte $50   ; 
- - - - - - 0x015E2D 05:9E1D: 88        .byte $88   ; 
- - - - - - 0x015E2E 05:9E1E: 8A        .byte $8A   ; 
- - - - - - 0x015E2F 05:9E1F: 29        .byte $29   ; 
- - - - - - 0x015E30 05:9E20: 8A        .byte $8A   ; 
- - - - - - 0x015E31 05:9E21: 28        .byte $28   ; 
- - - - - - 0x015E32 05:9E22: 92        .byte $92   ; 
- - - - - - 0x015E33 05:9E23: 93        .byte $93   ; 
- - - - - - 0x015E34 05:9E24: 0B        .byte $0B   ; 
- - - - - - 0x015E35 05:9E25: 0B        .byte $0B   ; 
- - - - - - 0x015E36 05:9E26: 94        .byte $94   ; 
- - - - - - 0x015E37 05:9E27: 26        .byte $26   ; 
- - - - - - 0x015E38 05:9E28: 89        .byte $89   ; 
- - - - - - 0x015E39 05:9E29: 27        .byte $27   ; 
- - - - - - 0x015E3A 05:9E2A: 28        .byte $28   ; 
- - - - - - 0x015E3B 05:9E2B: 29        .byte $29   ; 
- - - - - - 0x015E3C 05:9E2C: 8A        .byte $8A   ; 
- - - - - - 0x015E3D 05:9E2D: 28        .byte $28   ; 
- - - - - - 0x015E3E 05:9E2E: 92        .byte $92   ; 
- - - - - - 0x015E3F 05:9E2F: 2A        .byte $2A   ; 
- - - - - - 0x015E40 05:9E30: 8E        .byte $8E   ; 
- - - - - - 0x015E41 05:9E31: 2B        .byte $2B   ; 
- - - - - - 0x015E42 05:9E32: 8F        .byte $8F   ; 
- - - - - - 0x015E43 05:9E33: 2C        .byte $2C   ; 
- - - - - - 0x015E44 05:9E34: 90        .byte $90   ; 
- - - - - - 0x015E45 05:9E35: 2D        .byte $2D   ; 
- - - - - - 0x015E46 05:9E36: 91        .byte $91   ; 
- D 0 - I - 0x015E47 05:9E37: 00        .byte $00   ; 
- D 0 - I - 0x015E48 05:9E38: 93        .byte $93   ; 
- D 0 - I - 0x015E49 05:9E39: 07        .byte $07   ; 
- D 0 - I - 0x015E4A 05:9E3A: 8E        .byte $8E   ; 
- D 0 - I - 0x015E4B 05:9E3B: 00        .byte $00   ; 
- D 0 - I - 0x015E4C 05:9E3C: 00        .byte $00   ; 
- D 0 - I - 0x015E4D 05:9E3D: 00        .byte $00   ; 
- D 0 - I - 0x015E4E 05:9E3E: 93        .byte $93   ; 
- D 0 - I - 0x015E4F 05:9E3F: 0E        .byte $0E   ; 
- D 0 - I - 0x015E50 05:9E40: BD        .byte $BD   ; 
- D 0 - I - 0x015E51 05:9E41: 0E        .byte $0E   ; 
- D 0 - I - 0x015E52 05:9E42: 00        .byte $00   ; 
- D 0 - I - 0x015E53 05:9E43: BE        .byte $BE   ; 
- D 0 - I - 0x015E54 05:9E44: BF        .byte $BF   ; 
- D 0 - I - 0x015E55 05:9E45: BE        .byte $BE   ; 
- D 0 - I - 0x015E56 05:9E46: BF        .byte $BF   ; 
- D 0 - I - 0x015E57 05:9E47: 56        .byte $56   ; 
- D 0 - I - 0x015E58 05:9E48: 95        .byte $95   ; 
- D 0 - I - 0x015E59 05:9E49: 08        .byte $08   ; 
- D 0 - I - 0x015E5A 05:9E4A: 00        .byte $00   ; 
- D 0 - I - 0x015E5B 05:9E4B: 99        .byte $99   ; 
- D 0 - I - 0x015E5C 05:9E4C: 98        .byte $98   ; 
- D 0 - I - 0x015E5D 05:9E4D: 97        .byte $97   ; 
- D 0 - I - 0x015E5E 05:9E4E: 96        .byte $96   ; 
- D 0 - I - 0x015E5F 05:9E4F: 54        .byte $54   ; 
- D 0 - I - 0x015E60 05:9E50: 9A        .byte $9A   ; 
- D 0 - I - 0x015E61 05:9E51: 52        .byte $52   ; 
- D 0 - I - 0x015E62 05:9E52: 99        .byte $99   ; 
- D 0 - I - 0x015E63 05:9E53: 55        .byte $55   ; 
- D 0 - I - 0x015E64 05:9E54: 9D        .byte $9D   ; 
- D 0 - I - 0x015E65 05:9E55: 9C        .byte $9C   ; 
- D 0 - I - 0x015E66 05:9E56: 9B        .byte $9B   ; 
- D 0 - I - 0x015E67 05:9E57: 0C        .byte $0C   ; 
- D 0 - I - 0x015E68 05:9E58: B5        .byte $B5   ; 
- D 0 - I - 0x015E69 05:9E59: 0D        .byte $0D   ; 
- D 0 - I - 0x015E6A 05:9E5A: B6        .byte $B6   ; 
- D 0 - I - 0x015E6B 05:9E5B: 00        .byte $00   ; 
- D 0 - I - 0x015E6C 05:9E5C: B8        .byte $B8   ; 
- D 0 - I - 0x015E6D 05:9E5D: B9        .byte $B9   ; 
- D 0 - I - 0x015E6E 05:9E5E: BA        .byte $BA   ; 
- D 0 - I - 0x015E6F 05:9E5F: 56        .byte $56   ; 
- D 0 - I - 0x015E70 05:9E60: 95        .byte $95   ; 
- D 0 - I - 0x015E71 05:9E61: 08        .byte $08   ; 
- D 0 - I - 0x015E72 05:9E62: 00        .byte $00   ; 
- D 0 - I - 0x015E73 05:9E63: 99        .byte $99   ; 
- D 0 - I - 0x015E74 05:9E64: 98        .byte $98   ; 
- D 0 - I - 0x015E75 05:9E65: 97        .byte $97   ; 
- D 0 - I - 0x015E76 05:9E66: 96        .byte $96   ; 
- D 0 - I - 0x015E77 05:9E67: 32        .byte $32   ; 
- D 0 - I - 0x015E78 05:9E68: A5        .byte $A5   ; 
- D 0 - I - 0x015E79 05:9E69: 31        .byte $31   ; 
- D 0 - I - 0x015E7A 05:9E6A: A4        .byte $A4   ; 
- D 0 - I - 0x015E7B 05:9E6B: A9        .byte $A9   ; 
- D 0 - I - 0x015E7C 05:9E6C: A8        .byte $A8   ; 
- D 0 - I - 0x015E7D 05:9E6D: A7        .byte $A7   ; 
- D 0 - I - 0x015E7E 05:9E6E: A6        .byte $A6   ; 
- D 0 - I - 0x015E7F 05:9E6F: 31        .byte $31   ; 
- D 0 - I - 0x015E80 05:9E70: A4        .byte $A4   ; 
- D 0 - I - 0x015E81 05:9E71: 32        .byte $32   ; 
- D 0 - I - 0x015E82 05:9E72: A5        .byte $A5   ; 
- D 0 - I - 0x015E83 05:9E73: A7        .byte $A7   ; 
- D 0 - I - 0x015E84 05:9E74: A6        .byte $A6   ; 
- D 0 - I - 0x015E85 05:9E75: A9        .byte $A9   ; 
- D 0 - I - 0x015E86 05:9E76: A8        .byte $A8   ; 
- D 0 - I - 0x015E87 05:9E77: 09        .byte $09   ; 
- D 0 - I - 0x015E88 05:9E78: A4        .byte $A4   ; 
- D 0 - I - 0x015E89 05:9E79: 0A        .byte $0A   ; 
- D 0 - I - 0x015E8A 05:9E7A: 00        .byte $00   ; 
- D 0 - I - 0x015E8B 05:9E7B: 0A        .byte $0A   ; 
- D 0 - I - 0x015E8C 05:9E7C: 00        .byte $00   ; 
- D 0 - I - 0x015E8D 05:9E7D: 00        .byte $00   ; 
- D 0 - I - 0x015E8E 05:9E7E: 00        .byte $00   ; 
- D 0 - I - 0x015E8F 05:9E7F: 00        .byte $00   ; 
- D 0 - I - 0x015E90 05:9E80: 00        .byte $00   ; 
- D 0 - I - 0x015E91 05:9E81: 0C        .byte $0C   ; 
- D 0 - I - 0x015E92 05:9E82: B5        .byte $B5   ; 
- D 0 - I - 0x015E93 05:9E83: B9        .byte $B9   ; 
- D 0 - I - 0x015E94 05:9E84: BA        .byte $BA   ; 
- D 0 - I - 0x015E95 05:9E85: B7        .byte $B7   ; 
- D 0 - I - 0x015E96 05:9E86: B8        .byte $B8   ; 
- D 0 - I - 0x015E97 05:9E87: 2F        .byte $2F   ; 
- D 0 - I - 0x015E98 05:9E88: 9F        .byte $9F   ; 
- D 0 - I - 0x015E99 05:9E89: 2E        .byte $2E   ; 
- D 0 - I - 0x015E9A 05:9E8A: 9E        .byte $9E   ; 
- D 0 - I - 0x015E9B 05:9E8B: 39        .byte $39   ; 
- D 0 - I - 0x015E9C 05:9E8C: 2F        .byte $2F   ; 
- D 0 - I - 0x015E9D 05:9E8D: 30        .byte $30   ; 
- D 0 - I - 0x015E9E 05:9E8E: A0        .byte $A0   ; 
- D 0 - I - 0x015E9F 05:9E8F: 31        .byte $31   ; 
- D 0 - I - 0x015EA0 05:9E90: A4        .byte $A4   ; 
- D 0 - I - 0x015EA1 05:9E91: 32        .byte $32   ; 
- D 0 - I - 0x015EA2 05:9E92: A5        .byte $A5   ; 
- D 0 - I - 0x015EA3 05:9E93: A7        .byte $A7   ; 
- D 0 - I - 0x015EA4 05:9E94: A6        .byte $A6   ; 
- D 0 - I - 0x015EA5 05:9E95: A9        .byte $A9   ; 
- D 0 - I - 0x015EA6 05:9E96: A8        .byte $A8   ; 
- D 0 - I - 0x015EA7 05:9E97: 54        .byte $54   ; 
- D 0 - I - 0x015EA8 05:9E98: 9A        .byte $9A   ; 
- D 0 - I - 0x015EA9 05:9E99: 52        .byte $52   ; 
- D 0 - I - 0x015EAA 05:9E9A: 99        .byte $99   ; 
- D 0 - I - 0x015EAB 05:9E9B: 55        .byte $55   ; 
- D 0 - I - 0x015EAC 05:9E9C: 9D        .byte $9D   ; 
- D 0 - I - 0x015EAD 05:9E9D: 9C        .byte $9C   ; 
- D 0 - I - 0x015EAE 05:9E9E: 9B        .byte $9B   ; 
- D 0 - I - 0x015EAF 05:9E9F: 2F        .byte $2F   ; 
- D 0 - I - 0x015EB0 05:9EA0: 9F        .byte $9F   ; 
- D 0 - I - 0x015EB1 05:9EA1: 2E        .byte $2E   ; 
- D 0 - I - 0x015EB2 05:9EA2: 9E        .byte $9E   ; 
- D 0 - I - 0x015EB3 05:9EA3: 39        .byte $39   ; 
- D 0 - I - 0x015EB4 05:9EA4: 2F        .byte $2F   ; 
- D 0 - I - 0x015EB5 05:9EA5: 30        .byte $30   ; 
- D 0 - I - 0x015EB6 05:9EA6: A0        .byte $A0   ; 
- D 0 - I - 0x015EB7 05:9EA7: 56        .byte $56   ; 
- D 0 - I - 0x015EB8 05:9EA8: 95        .byte $95   ; 
- D 0 - I - 0x015EB9 05:9EA9: 08        .byte $08   ; 
- D 0 - I - 0x015EBA 05:9EAA: 00        .byte $00   ; 
- D 0 - I - 0x015EBB 05:9EAB: 99        .byte $99   ; 
- D 0 - I - 0x015EBC 05:9EAC: 98        .byte $98   ; 
- D 0 - I - 0x015EBD 05:9EAD: 97        .byte $97   ; 
- D 0 - I - 0x015EBE 05:9EAE: 96        .byte $96   ; 
- D 0 - I - 0x015EBF 05:9EAF: 54        .byte $54   ; 
- D 0 - I - 0x015EC0 05:9EB0: 9A        .byte $9A   ; 
- D 0 - I - 0x015EC1 05:9EB1: 52        .byte $52   ; 
- D 0 - I - 0x015EC2 05:9EB2: 99        .byte $99   ; 
- D 0 - I - 0x015EC3 05:9EB3: 30        .byte $30   ; 
- D 0 - I - 0x015EC4 05:9EB4: 55        .byte $55   ; 
- D 0 - I - 0x015EC5 05:9EB5: 9D        .byte $9D   ; 
- D 0 - I - 0x015EC6 05:9EB6: A1        .byte $A1   ; 
- D 0 - I - 0x015EC7 05:9EB7: 0F        .byte $0F   ; 
- D 0 - I - 0x015EC8 05:9EB8: C0        .byte $C0   ; 
- D 0 - I - 0x015EC9 05:9EB9: 0F        .byte $0F   ; 
- D 0 - I - 0x015ECA 05:9EBA: C0        .byte $C0   ; 
- D 0 - I - 0x015ECB 05:9EBB: 00        .byte $00   ; 
- D 0 - I - 0x015ECC 05:9EBC: C2        .byte $C2   ; 
- D 0 - I - 0x015ECD 05:9EBD: C1        .byte $C1   ; 
- D 0 - I - 0x015ECE 05:9EBE: C2        .byte $C2   ; 
- D 0 - I - 0x015ECF 05:9EBF: 56        .byte $56   ; 
- D 0 - I - 0x015ED0 05:9EC0: 95        .byte $95   ; 
- D 0 - I - 0x015ED1 05:9EC1: 08        .byte $08   ; 
- D 0 - I - 0x015ED2 05:9EC2: 00        .byte $00   ; 
- D 0 - I - 0x015ED3 05:9EC3: A2        .byte $A2   ; 
- D 0 - I - 0x015ED4 05:9EC4: 98        .byte $98   ; 
- D 0 - I - 0x015ED5 05:9EC5: 97        .byte $97   ; 
- D 0 - I - 0x015ED6 05:9EC6: 96        .byte $96   ; 
- D 0 - I - 0x015ED7 05:9EC7: 32        .byte $32   ; 
- D 0 - I - 0x015ED8 05:9EC8: A5        .byte $A5   ; 
- D 0 - I - 0x015ED9 05:9EC9: 31        .byte $31   ; 
- D 0 - I - 0x015EDA 05:9ECA: A4        .byte $A4   ; 
- D 0 - I - 0x015EDB 05:9ECB: A9        .byte $A9   ; 
- D 0 - I - 0x015EDC 05:9ECC: A8        .byte $A8   ; 
- D 0 - I - 0x015EDD 05:9ECD: A7        .byte $A7   ; 
- D 0 - I - 0x015EDE 05:9ECE: A6        .byte $A6   ; 
- D 0 - I - 0x015EDF 05:9ECF: 31        .byte $31   ; 
- D 0 - I - 0x015EE0 05:9ED0: A4        .byte $A4   ; 
- D 0 - I - 0x015EE1 05:9ED1: 31        .byte $31   ; 
- D 0 - I - 0x015EE2 05:9ED2: A4        .byte $A4   ; 
- D 0 - I - 0x015EE3 05:9ED3: AB        .byte $AB   ; 
- D 0 - I - 0x015EE4 05:9ED4: AA        .byte $AA   ; 
- D 0 - I - 0x015EE5 05:9ED5: AB        .byte $AB   ; 
- D 0 - I - 0x015EE6 05:9ED6: AA        .byte $AA   ; 
- D 0 - I - 0x015EE7 05:9ED7: 32        .byte $32   ; 
- D 0 - I - 0x015EE8 05:9ED8: A5        .byte $A5   ; 
- D 0 - I - 0x015EE9 05:9ED9: 31        .byte $31   ; 
- D 0 - I - 0x015EEA 05:9EDA: A4        .byte $A4   ; 
- D 0 - I - 0x015EEB 05:9EDB: A9        .byte $A9   ; 
- D 0 - I - 0x015EEC 05:9EDC: A8        .byte $A8   ; 
- D 0 - I - 0x015EED 05:9EDD: A7        .byte $A7   ; 
- D 0 - I - 0x015EEE 05:9EDE: A6        .byte $A6   ; 
- D 0 - I - 0x015EEF 05:9EDF: 09        .byte $09   ; 
- D 0 - I - 0x015EF0 05:9EE0: A4        .byte $A4   ; 
- D 0 - I - 0x015EF1 05:9EE1: 0A        .byte $0A   ; 
- D 0 - I - 0x015EF2 05:9EE2: 00        .byte $00   ; 
- D 0 - I - 0x015EF3 05:9EE3: 0A        .byte $0A   ; 
- D 0 - I - 0x015EF4 05:9EE4: 00        .byte $00   ; 
- D 0 - I - 0x015EF5 05:9EE5: 00        .byte $00   ; 
- D 0 - I - 0x015EF6 05:9EE6: 00        .byte $00   ; 
- D 0 - I - 0x015EF7 05:9EE7: 39        .byte $39   ; 
- D 0 - I - 0x015EF8 05:9EE8: 2F        .byte $2F   ; 
- D 0 - I - 0x015EF9 05:9EE9: 30        .byte $30   ; 
- D 0 - I - 0x015EFA 05:9EEA: A0        .byte $A0   ; 
- D 0 - I - 0x015EFB 05:9EEB: AB        .byte $AB   ; 
- D 0 - I - 0x015EFC 05:9EEC: AA        .byte $AA   ; 
- D 0 - I - 0x015EFD 05:9EED: AA        .byte $AA   ; 
- D 0 - I - 0x015EFE 05:9EEE: 0A        .byte $0A   ; 
- D 0 - I - 0x015EFF 05:9EEF: 00        .byte $00   ; 
- D 0 - I - 0x015F00 05:9EF0: 00        .byte $00   ; 
- D 0 - I - 0x015F01 05:9EF1: 00        .byte $00   ; 
- D 0 - I - 0x015F02 05:9EF2: 00        .byte $00   ; 
- D 0 - I - 0x015F03 05:9EF3: B9        .byte $B9   ; 
- D 0 - I - 0x015F04 05:9EF4: BA        .byte $BA   ; 
- D 0 - I - 0x015F05 05:9EF5: CA        .byte $CA   ; 
- D 0 - I - 0x015F06 05:9EF6: CB        .byte $CB   ; 
- D 0 - I - 0x015F07 05:9EF7: 55        .byte $55   ; 
- D 0 - I - 0x015F08 05:9EF8: 9D        .byte $9D   ; 
- D 0 - I - 0x015F09 05:9EF9: 53        .byte $53   ; 
- D 0 - I - 0x015F0A 05:9EFA: A2        .byte $A2   ; 
- D 0 - I - 0x015F0B 05:9EFB: 2F        .byte $2F   ; 
- D 0 - I - 0x015F0C 05:9EFC: 30        .byte $30   ; 
- D 0 - I - 0x015F0D 05:9EFD: A0        .byte $A0   ; 
- D 0 - I - 0x015F0E 05:9EFE: A3        .byte $A3   ; 
- D 0 - I - 0x015F0F 05:9EFF: 00        .byte $00   ; 
- D 0 - I - 0x015F10 05:9F00: 00        .byte $00   ; 
- D 0 - I - 0x015F11 05:9F01: 00        .byte $00   ; 
- D 0 - I - 0x015F12 05:9F02: 00        .byte $00   ; 
- D 0 - I - 0x015F13 05:9F03: CA        .byte $CA   ; 
- D 0 - I - 0x015F14 05:9F04: CB        .byte $CB   ; 
- D 0 - I - 0x015F15 05:9F05: CA        .byte $CA   ; 
- D 0 - I - 0x015F16 05:9F06: CB        .byte $CB   ; 
- D 0 - I - 0x015F17 05:9F07: 54        .byte $54   ; 
- D 0 - I - 0x015F18 05:9F08: 9A        .byte $9A   ; 
- D 0 - I - 0x015F19 05:9F09: 52        .byte $52   ; 
- D 0 - I - 0x015F1A 05:9F0A: 99        .byte $99   ; 
- D 0 - I - 0x015F1B 05:9F0B: 30        .byte $30   ; 
- D 0 - I - 0x015F1C 05:9F0C: 55        .byte $55   ; 
- D 0 - I - 0x015F1D 05:9F0D: 9D        .byte $9D   ; 
- D 0 - I - 0x015F1E 05:9F0E: A1        .byte $A1   ; 
- D 0 - I - 0x015F1F 05:9F0F: 39        .byte $39   ; 
- D 0 - I - 0x015F20 05:9F10: 2F        .byte $2F   ; 
- D 0 - I - 0x015F21 05:9F11: 30        .byte $30   ; 
- D 0 - I - 0x015F22 05:9F12: A0        .byte $A0   ; 
- D 0 - I - 0x015F23 05:9F13: AB        .byte $AB   ; 
- D 0 - I - 0x015F24 05:9F14: AA        .byte $AA   ; 
- D 0 - I - 0x015F25 05:9F15: AA        .byte $AA   ; 
- D 0 - I - 0x015F26 05:9F16: 0A        .byte $0A   ; 
- D 0 - I - 0x015F27 05:9F17: 56        .byte $56   ; 
- D 0 - I - 0x015F28 05:9F18: 95        .byte $95   ; 
- D 0 - I - 0x015F29 05:9F19: 08        .byte $08   ; 
- D 0 - I - 0x015F2A 05:9F1A: 00        .byte $00   ; 
- D 0 - I - 0x015F2B 05:9F1B: A2        .byte $A2   ; 
- D 0 - I - 0x015F2C 05:9F1C: 98        .byte $98   ; 
- D 0 - I - 0x015F2D 05:9F1D: 97        .byte $97   ; 
- D 0 - I - 0x015F2E 05:9F1E: 96        .byte $96   ; 
- D 0 - I - 0x015F2F 05:9F1F: 55        .byte $55   ; 
- D 0 - I - 0x015F30 05:9F20: 9D        .byte $9D   ; 
- D 0 - I - 0x015F31 05:9F21: 53        .byte $53   ; 
- D 0 - I - 0x015F32 05:9F22: A2        .byte $A2   ; 
- D 0 - I - 0x015F33 05:9F23: 2F        .byte $2F   ; 
- D 0 - I - 0x015F34 05:9F24: 30        .byte $30   ; 
- D 0 - I - 0x015F35 05:9F25: A0        .byte $A0   ; 
- D 0 - I - 0x015F36 05:9F26: A3        .byte $A3   ; 
- D 0 - I - 0x015F37 05:9F27: 00        .byte $00   ; 
- D 0 - I - 0x015F38 05:9F28: 00        .byte $00   ; 
- D 0 - I - 0x015F39 05:9F29: 00        .byte $00   ; 
- D 0 - I - 0x015F3A 05:9F2A: 00        .byte $00   ; 
- D 0 - I - 0x015F3B 05:9F2B: 00        .byte $00   ; 
- D 0 - I - 0x015F3C 05:9F2C: 00        .byte $00   ; 
- D 0 - I - 0x015F3D 05:9F2D: 00        .byte $00   ; 
- D 0 - I - 0x015F3E 05:9F2E: 00        .byte $00   ; 
- D 0 - I - 0x015F3F 05:9F2F: 33        .byte $33   ; 
- D 0 - I - 0x015F40 05:9F30: AC        .byte $AC   ; 
- D 0 - I - 0x015F41 05:9F31: 34        .byte $34   ; 
- D 0 - I - 0x015F42 05:9F32: AD        .byte $AD   ; 
- D 0 - I - 0x015F43 05:9F33: AE        .byte $AE   ; 
- D 0 - I - 0x015F44 05:9F34: AF        .byte $AF   ; 
- D 0 - I - 0x015F45 05:9F35: 84        .byte $84   ; 
- D 0 - I - 0x015F46 05:9F36: 4D        .byte $4D   ; 
- D 0 - I - 0x015F47 05:9F37: 15        .byte $15   ; 
- D 0 - I - 0x015F48 05:9F38: B2        .byte $B2   ; 
- D 0 - I - 0x015F49 05:9F39: 37        .byte $37   ; 
- D 0 - I - 0x015F4A 05:9F3A: B3        .byte $B3   ; 
- D 0 - I - 0x015F4B 05:9F3B: 00        .byte $00   ; 
- D 0 - I - 0x015F4C 05:9F3C: 93        .byte $93   ; 
- D 0 - I - 0x015F4D 05:9F3D: 0B        .byte $0B   ; 
- D 0 - I - 0x015F4E 05:9F3E: 94        .byte $94   ; 
- D 0 - I - 0x015F4F 05:9F3F: 0C        .byte $0C   ; 
- D 0 - I - 0x015F50 05:9F40: B5        .byte $B5   ; 
- D 0 - I - 0x015F51 05:9F41: 00        .byte $00   ; 
- D 0 - I - 0x015F52 05:9F42: 00        .byte $00   ; 
- D 0 - I - 0x015F53 05:9F43: B7        .byte $B7   ; 
- D 0 - I - 0x015F54 05:9F44: B8        .byte $B8   ; 
- D 0 - I - 0x015F55 05:9F45: B9        .byte $B9   ; 
- D 0 - I - 0x015F56 05:9F46: BA        .byte $BA   ; 
- D 0 - I - 0x015F57 05:9F47: 00        .byte $00   ; 
- D 0 - I - 0x015F58 05:9F48: 00        .byte $00   ; 
- D 0 - I - 0x015F59 05:9F49: 00        .byte $00   ; 
- D 0 - I - 0x015F5A 05:9F4A: 00        .byte $00   ; 
- D 0 - I - 0x015F5B 05:9F4B: 00        .byte $00   ; 
- D 0 - I - 0x015F5C 05:9F4C: 00        .byte $00   ; 
- D 0 - I - 0x015F5D 05:9F4D: 00        .byte $00   ; 
- D 0 - I - 0x015F5E 05:9F4E: 00        .byte $00   ; 
- D 0 - I - 0x015F5F 05:9F4F: 35        .byte $35   ; 
- D 0 - I - 0x015F60 05:9F50: B0        .byte $B0   ; 
- D 0 - I - 0x015F61 05:9F51: 36        .byte $36   ; 
- D 0 - I - 0x015F62 05:9F52: B1        .byte $B1   ; 
- D 0 - I - 0x015F63 05:9F53: 84        .byte $84   ; 
- D 0 - I - 0x015F64 05:9F54: 87        .byte $87   ; 
- D 0 - I - 0x015F65 05:9F55: 84        .byte $84   ; 
- D 0 - I - 0x015F66 05:9F56: 4D        .byte $4D   ; 
- D 0 - I - 0x015F67 05:9F57: 38        .byte $38   ; 
- D 0 - I - 0x015F68 05:9F58: B4        .byte $B4   ; 
- D 0 - I - 0x015F69 05:9F59: 37        .byte $37   ; 
- D 0 - I - 0x015F6A 05:9F5A: B3        .byte $B3   ; 
- D 0 - I - 0x015F6B 05:9F5B: 2B        .byte $2B   ; 
- D 0 - I - 0x015F6C 05:9F5C: 8F        .byte $8F   ; 
- D 0 - I - 0x015F6D 05:9F5D: 2B        .byte $2B   ; 
- D 0 - I - 0x015F6E 05:9F5E: 8F        .byte $8F   ; 
- D 0 - I - 0x015F6F 05:9F5F: 2D        .byte $2D   ; 
- D 0 - I - 0x015F70 05:9F60: 91        .byte $91   ; 
- D 0 - I - 0x015F71 05:9F61: 2C        .byte $2C   ; 
- D 0 - I - 0x015F72 05:9F62: 90        .byte $90   ; 
- D 0 - I - 0x015F73 05:9F63: 2A        .byte $2A   ; 
- D 0 - I - 0x015F74 05:9F64: 8E        .byte $8E   ; 
- D 0 - I - 0x015F75 05:9F65: 2A        .byte $2A   ; 
- D 0 - I - 0x015F76 05:9F66: 8E        .byte $8E   ; 
- D 0 - I - 0x015F77 05:9F67: 38        .byte $38   ; 
- D 0 - I - 0x015F78 05:9F68: B4        .byte $B4   ; 
- D 0 - I - 0x015F79 05:9F69: 37        .byte $37   ; 
- D 0 - I - 0x015F7A 05:9F6A: B3        .byte $B3   ; 
- D 0 - I - 0x015F7B 05:9F6B: 2A        .byte $2A   ; 
- D 0 - I - 0x015F7C 05:9F6C: 8E        .byte $8E   ; 
- D 0 - I - 0x015F7D 05:9F6D: 2B        .byte $2B   ; 
- D 0 - I - 0x015F7E 05:9F6E: 8F        .byte $8F   ; 
- D 0 - I - 0x015F7F 05:9F6F: 2C        .byte $2C   ; 
- D 0 - I - 0x015F80 05:9F70: 90        .byte $90   ; 
- D 0 - I - 0x015F81 05:9F71: 2D        .byte $2D   ; 
- D 0 - I - 0x015F82 05:9F72: 91        .byte $91   ; 
- D 0 - I - 0x015F83 05:9F73: 2B        .byte $2B   ; 
- D 0 - I - 0x015F84 05:9F74: 8F        .byte $8F   ; 
- D 0 - I - 0x015F85 05:9F75: 2A        .byte $2A   ; 
- D 0 - I - 0x015F86 05:9F76: 8E        .byte $8E   ; 
- D 0 - I - 0x015F87 05:9F77: 00        .byte $00   ; 
- D 0 - I - 0x015F88 05:9F78: 93        .byte $93   ; 
- D 0 - I - 0x015F89 05:9F79: 0B        .byte $0B   ; 
- D 0 - I - 0x015F8A 05:9F7A: 94        .byte $94   ; 
- D 0 - I - 0x015F8B 05:9F7B: 00        .byte $00   ; 
- D 0 - I - 0x015F8C 05:9F7C: 00        .byte $00   ; 
- D 0 - I - 0x015F8D 05:9F7D: 00        .byte $00   ; 
- D 0 - I - 0x015F8E 05:9F7E: 00        .byte $00   ; 
- D 0 - I - 0x015F8F 05:9F7F: 0C        .byte $0C   ; 
- D 0 - I - 0x015F90 05:9F80: B5        .byte $B5   ; 
- D 0 - I - 0x015F91 05:9F81: 0D        .byte $0D   ; 
- D 0 - I - 0x015F92 05:9F82: B6        .byte $B6   ; 
- D 0 - I - 0x015F93 05:9F83: B7        .byte $B7   ; 
- D 0 - I - 0x015F94 05:9F84: B8        .byte $B8   ; 
- D 0 - I - 0x015F95 05:9F85: B9        .byte $B9   ; 
- D 0 - I - 0x015F96 05:9F86: BA        .byte $BA   ; 
- D 0 - I - 0x015F97 05:9F87: 38        .byte $38   ; 
- D 0 - I - 0x015F98 05:9F88: B4        .byte $B4   ; 
- D 0 - I - 0x015F99 05:9F89: 37        .byte $37   ; 
- D 0 - I - 0x015F9A 05:9F8A: B3        .byte $B3   ; 
- D 0 - I - 0x015F9B 05:9F8B: 2C        .byte $2C   ; 
- D 0 - I - 0x015F9C 05:9F8C: 90        .byte $90   ; 
- D 0 - I - 0x015F9D 05:9F8D: 2D        .byte $2D   ; 
- D 0 - I - 0x015F9E 05:9F8E: 91        .byte $91   ; 
- D 0 - I - 0x015F9F 05:9F8F: 00        .byte $00   ; 
- D 0 - I - 0x015FA0 05:9F90: 93        .byte $93   ; 
- D 0 - I - 0x015FA1 05:9F91: 07        .byte $07   ; 
- D 0 - I - 0x015FA2 05:9F92: 8E        .byte $8E   ; 
- D 0 - I - 0x015FA3 05:9F93: 00        .byte $00   ; 
- D 0 - I - 0x015FA4 05:9F94: 00        .byte $00   ; 
- D 0 - I - 0x015FA5 05:9F95: 00        .byte $00   ; 
- D 0 - I - 0x015FA6 05:9F96: 93        .byte $93   ; 
- D 0 - I - 0x015FA7 05:9F97: 07        .byte $07   ; 
- D 0 - I - 0x015FA8 05:9F98: 91        .byte $91   ; 
- D 0 - I - 0x015FA9 05:9F99: 2C        .byte $2C   ; 
- D 0 - I - 0x015FAA 05:9F9A: 91        .byte $91   ; 
- D 0 - I - 0x015FAB 05:9F9B: 00        .byte $00   ; 
- D 0 - I - 0x015FAC 05:9F9C: 93        .byte $93   ; 
- D 0 - I - 0x015FAD 05:9F9D: 2A        .byte $2A   ; 
- D 0 - I - 0x015FAE 05:9F9E: 8E        .byte $8E   ; 
- D 0 - I - 0x015FAF 05:9F9F: 0C        .byte $0C   ; 
- D 0 - I - 0x015FB0 05:9FA0: 00        .byte $00   ; 
- D 0 - I - 0x015FB1 05:9FA1: 00        .byte $00   ; 
- D 0 - I - 0x015FB2 05:9FA2: 93        .byte $93   ; 
- D 0 - I - 0x015FB3 05:9FA3: B7        .byte $B7   ; 
- D 0 - I - 0x015FB4 05:9FA4: B8        .byte $B8   ; 
- D 0 - I - 0x015FB5 05:9FA5: 00        .byte $00   ; 
- D 0 - I - 0x015FB6 05:9FA6: 00        .byte $00   ; 
- D 0 - I - 0x015FB7 05:9FA7: 2C        .byte $2C   ; 
- D 0 - I - 0x015FB8 05:9FA8: 90        .byte $90   ; 
- D 0 - I - 0x015FB9 05:9FA9: 2C        .byte $2C   ; 
- D 0 - I - 0x015FBA 05:9FAA: 90        .byte $90   ; 
- D 0 - I - 0x015FBB 05:9FAB: 2A        .byte $2A   ; 
- D 0 - I - 0x015FBC 05:9FAC: 8E        .byte $8E   ; 
- D 0 - I - 0x015FBD 05:9FAD: 2B        .byte $2B   ; 
- D 0 - I - 0x015FBE 05:9FAE: 8F        .byte $8F   ; 
- D 0 - I - 0x015FBF 05:9FAF: 0B        .byte $0B   ; 
- D 0 - I - 0x015FC0 05:9FB0: 94        .byte $94   ; 
- D 0 - I - 0x015FC1 05:9FB1: 07        .byte $07   ; 
- D 0 - I - 0x015FC2 05:9FB2: 8E        .byte $8E   ; 
- D 0 - I - 0x015FC3 05:9FB3: 00        .byte $00   ; 
- D 0 - I - 0x015FC4 05:9FB4: 00        .byte $00   ; 
- D 0 - I - 0x015FC5 05:9FB5: 00        .byte $00   ; 
- D 0 - I - 0x015FC6 05:9FB6: 93        .byte $93   ; 
- D 0 - I - 0x015FC7 05:9FB7: 0C        .byte $0C   ; 
- D 0 - I - 0x015FC8 05:9FB8: B5        .byte $B5   ; 
- D 0 - I - 0x015FC9 05:9FB9: 0D        .byte $0D   ; 
- D 0 - I - 0x015FCA 05:9FBA: B6        .byte $B6   ; 
- D 0 - I - 0x015FCB 05:9FBB: B7        .byte $B7   ; 
- D 0 - I - 0x015FCC 05:9FBC: B8        .byte $B8   ; 
- D 0 - I - 0x015FCD 05:9FBD: B9        .byte $B9   ; 
- D 0 - I - 0x015FCE 05:9FBE: BA        .byte $BA   ; 
- D 0 - I - 0x015FCF 05:9FBF: 0D        .byte $0D   ; 
- D 0 - I - 0x015FD0 05:9FC0: B6        .byte $B6   ; 
- D 0 - I - 0x015FD1 05:9FC1: 0C        .byte $0C   ; 
- D 0 - I - 0x015FD2 05:9FC2: B5        .byte $B5   ; 
- D 0 - I - 0x015FD3 05:9FC3: B9        .byte $B9   ; 
- D 0 - I - 0x015FD4 05:9FC4: BA        .byte $BA   ; 
- D 0 - I - 0x015FD5 05:9FC5: B7        .byte $B7   ; 
- D 0 - I - 0x015FD6 05:9FC6: B8        .byte $B8   ; 
- D 0 - I - 0x015FD7 05:9FC7: 0C        .byte $0C   ; 
- D 0 - I - 0x015FD8 05:9FC8: B5        .byte $B5   ; 
- D 0 - I - 0x015FD9 05:9FC9: 0D        .byte $0D   ; 
- D 0 - I - 0x015FDA 05:9FCA: B6        .byte $B6   ; 
- D 0 - I - 0x015FDB 05:9FCB: BB        .byte $BB   ; 
- D 0 - I - 0x015FDC 05:9FCC: BC        .byte $BC   ; 
- D 0 - I - 0x015FDD 05:9FCD: BB        .byte $BB   ; 
- D 0 - I - 0x015FDE 05:9FCE: BC        .byte $BC   ; 
- D 0 - I - 0x015FDF 05:9FCF: 0E        .byte $0E   ; 
- D 0 - I - 0x015FE0 05:9FD0: BD        .byte $BD   ; 
- D 0 - I - 0x015FE1 05:9FD1: 0E        .byte $0E   ; 
- D 0 - I - 0x015FE2 05:9FD2: BD        .byte $BD   ; 
- D 0 - I - 0x015FE3 05:9FD3: BE        .byte $BE   ; 
- D 0 - I - 0x015FE4 05:9FD4: BF        .byte $BF   ; 
- D 0 - I - 0x015FE5 05:9FD5: BE        .byte $BE   ; 
- D 0 - I - 0x015FE6 05:9FD6: BF        .byte $BF   ; 
- D 0 - I - 0x015FE7 05:9FD7: 0F        .byte $0F   ; 
- D 0 - I - 0x015FE8 05:9FD8: C0        .byte $C0   ; 
- D 0 - I - 0x015FE9 05:9FD9: 0F        .byte $0F   ; 
- D 0 - I - 0x015FEA 05:9FDA: C0        .byte $C0   ; 
- D 0 - I - 0x015FEB 05:9FDB: C1        .byte $C1   ; 
- D 0 - I - 0x015FEC 05:9FDC: C2        .byte $C2   ; 
- D 0 - I - 0x015FED 05:9FDD: C1        .byte $C1   ; 
- D 0 - I - 0x015FEE 05:9FDE: C2        .byte $C2   ; 
- D 0 - I - 0x015FEF 05:9FDF: 10        .byte $10   ; 
- D 0 - I - 0x015FF0 05:9FE0: C3        .byte $C3   ; 
- D 0 - I - 0x015FF1 05:9FE1: 10        .byte $10   ; 
- D 0 - I - 0x015FF2 05:9FE2: C3        .byte $C3   ; 
- D 0 - I - 0x015FF3 05:9FE3: C4        .byte $C4   ; 
- D 0 - I - 0x015FF4 05:9FE4: C5        .byte $C5   ; 
- D 0 - I - 0x015FF5 05:9FE5: C4        .byte $C4   ; 
- D 0 - I - 0x015FF6 05:9FE6: C5        .byte $C5   ; 
- D 0 - I - 0x015FF7 05:9FE7: 11        .byte $11   ; 
- D 0 - I - 0x015FF8 05:9FE8: C6        .byte $C6   ; 
- D 0 - I - 0x015FF9 05:9FE9: 11        .byte $11   ; 
- D 0 - I - 0x015FFA 05:9FEA: C6        .byte $C6   ; 
- D 0 - I - 0x015FFB 05:9FEB: C7        .byte $C7   ; 
- D 0 - I - 0x015FFC 05:9FEC: C8        .byte $C8   ; 
- D 0 - I - 0x015FFD 05:9FED: C7        .byte $C7   ; 
- D 0 - I - 0x015FFE 05:9FEE: C8        .byte $C8   ; 
- D 0 - I - 0x015FFF 05:9FEF: 12        .byte $12   ; 
- D 0 - I - 0x016000 05:9FF0: C9        .byte $C9   ; 
- D 0 - I - 0x016001 05:9FF1: 12        .byte $12   ; 
- D 0 - I - 0x016002 05:9FF2: C9        .byte $C9   ; 
- D 0 - I - 0x016003 05:9FF3: CA        .byte $CA   ; 
- D 0 - I - 0x016004 05:9FF4: CB        .byte $CB   ; 
- D 0 - I - 0x016005 05:9FF5: CA        .byte $CA   ; 
- D 0 - I - 0x016006 05:9FF6: CB        .byte $CB   ; 
- D 0 - I - 0x016007 05:9FF7: 13        .byte $13   ; 
- D 0 - I - 0x016008 05:9FF8: CC        .byte $CC   ; 
- D 0 - I - 0x016009 05:9FF9: 13        .byte $13   ; 
- D 0 - I - 0x01600A 05:9FFA: CC        .byte $CC   ; 
- D 0 - I - 0x01600B 05:9FFB: CD        .byte $CD   ; 
- D 0 - I - 0x01600C 05:9FFC: CE        .byte $CE   ; 
- D 0 - I - 0x01600D 05:9FFD: CD        .byte $CD   ; 
- D 0 - I - 0x01600E 05:9FFE: CE        .byte $CE   ; 
- D 0 - I - 0x01600F 05:9FFF: 14        .byte $14   ; 
- D 1 - I - 0x016010 05:A000: CF        .byte $CF   ; 
- D 1 - I - 0x016011 05:A001: 14        .byte $14   ; 
- D 1 - I - 0x016012 05:A002: CF        .byte $CF   ; 
- D 1 - I - 0x016013 05:A003: B9        .byte $B9   ; 
- D 1 - I - 0x016014 05:A004: BA        .byte $BA   ; 
- D 1 - I - 0x016015 05:A005: B7        .byte $B7   ; 
- D 1 - I - 0x016016 05:A006: B8        .byte $B8   ; 
- D 1 - I - 0x016017 05:A007: 00        .byte $00   ; 
- D 1 - I - 0x016018 05:A008: 00        .byte $00   ; 
- D 1 - I - 0x016019 05:A009: 00        .byte $00   ; 
- D 1 - I - 0x01601A 05:A00A: 00        .byte $00   ; 
- D 1 - I - 0x01601B 05:A00B: B7        .byte $B7   ; 
- D 1 - I - 0x01601C 05:A00C: B8        .byte $B8   ; 
- D 1 - I - 0x01601D 05:A00D: B9        .byte $B9   ; 
- D 1 - I - 0x01601E 05:A00E: BA        .byte $BA   ; 
- D 1 - I - 0x01601F 05:A00F: 0D        .byte $0D   ; 
- D 1 - I - 0x016020 05:A010: B6        .byte $B6   ; 
- D 1 - I - 0x016021 05:A011: 0C        .byte $0C   ; 
- D 1 - I - 0x016022 05:A012: B5        .byte $B5   ; 
- D 1 - I - 0x016023 05:A013: B9        .byte $B9   ; 
- D 1 - I - 0x016024 05:A014: BA        .byte $BA   ; 
- D 1 - I - 0x016025 05:A015: B7        .byte $B7   ; 
- D 1 - I - 0x016026 05:A016: B8        .byte $B8   ; 
- D 1 - I - 0x016027 05:A017: 0C        .byte $0C   ; 
- D 1 - I - 0x016028 05:A018: B5        .byte $B5   ; 
- D 1 - I - 0x016029 05:A019: 0D        .byte $0D   ; 
- D 1 - I - 0x01602A 05:A01A: 00        .byte $00   ; 
- D 1 - I - 0x01602B 05:A01B: B7        .byte $B7   ; 
- D 1 - I - 0x01602C 05:A01C: B8        .byte $B8   ; 
- D 1 - I - 0x01602D 05:A01D: B9        .byte $B9   ; 
- D 1 - I - 0x01602E 05:A01E: 00        .byte $00   ; 
- D 1 - I - 0x01602F 05:A01F: 0D        .byte $0D   ; 
- D 1 - I - 0x016030 05:A020: B6        .byte $B6   ; 
- D 1 - I - 0x016031 05:A021: 0C        .byte $0C   ; 
- D 1 - I - 0x016032 05:A022: B5        .byte $B5   ; 
- D 1 - I - 0x016033 05:A023: B9        .byte $B9   ; 
- D 1 - I - 0x016034 05:A024: BA        .byte $BA   ; 
- D 1 - I - 0x016035 05:A025: B7        .byte $B7   ; 
- D 1 - I - 0x016036 05:A026: B8        .byte $B8   ; 
- D 1 - I - 0x016037 05:A027: 0D        .byte $0D   ; 
- D 1 - I - 0x016038 05:A028: B6        .byte $B6   ; 
- D 1 - I - 0x016039 05:A029: 0C        .byte $0C   ; 
- D 1 - I - 0x01603A 05:A02A: B5        .byte $B5   ; 
- D 1 - I - 0x01603B 05:A02B: BB        .byte $BB   ; 
- D 1 - I - 0x01603C 05:A02C: BC        .byte $BC   ; 
- D 1 - I - 0x01603D 05:A02D: BB        .byte $BB   ; 
- D 1 - I - 0x01603E 05:A02E: BC        .byte $BC   ; 
- D 1 - I - 0x01603F 05:A02F: 0E        .byte $0E   ; 
- D 1 - I - 0x016040 05:A030: BD        .byte $BD   ; 
- D 1 - I - 0x016041 05:A031: 0E        .byte $0E   ; 
- D 1 - I - 0x016042 05:A032: BD        .byte $BD   ; 
- D 1 - I - 0x016043 05:A033: BE        .byte $BE   ; 
- D 1 - I - 0x016044 05:A034: BF        .byte $BF   ; 
- D 1 - I - 0x016045 05:A035: BE        .byte $BE   ; 
- D 1 - I - 0x016046 05:A036: BF        .byte $BF   ; 
- D 1 - I - 0x016047 05:A037: 13        .byte $13   ; 
- D 1 - I - 0x016048 05:A038: CC        .byte $CC   ; 
- D 1 - I - 0x016049 05:A039: 13        .byte $13   ; 
- D 1 - I - 0x01604A 05:A03A: CC        .byte $CC   ; 
- D 1 - I - 0x01604B 05:A03B: CD        .byte $CD   ; 
- D 1 - I - 0x01604C 05:A03C: CE        .byte $CE   ; 
- D 1 - I - 0x01604D 05:A03D: CD        .byte $CD   ; 
- D 1 - I - 0x01604E 05:A03E: CE        .byte $CE   ; 
- D 1 - I - 0x01604F 05:A03F: 14        .byte $14   ; 
- D 1 - I - 0x016050 05:A040: CF        .byte $CF   ; 
- D 1 - I - 0x016051 05:A041: 14        .byte $14   ; 
- D 1 - I - 0x016052 05:A042: CF        .byte $CF   ; 
- D 1 - I - 0x016053 05:A043: B7        .byte $B7   ; 
- D 1 - I - 0x016054 05:A044: B8        .byte $B8   ; 
- D 1 - I - 0x016055 05:A045: B9        .byte $B9   ; 
- D 1 - I - 0x016056 05:A046: BA        .byte $BA   ; 
- D 1 - I - 0x016057 05:A047: 0D        .byte $0D   ; 
- D 1 - I - 0x016058 05:A048: B6        .byte $B6   ; 
- D 1 - I - 0x016059 05:A049: 0C        .byte $0C   ; 
- D 1 - I - 0x01605A 05:A04A: B5        .byte $B5   ; 
- D 1 - I - 0x01605B 05:A04B: B9        .byte $B9   ; 
- D 1 - I - 0x01605C 05:A04C: BA        .byte $BA   ; 
- D 1 - I - 0x01605D 05:A04D: B7        .byte $B7   ; 
- D 1 - I - 0x01605E 05:A04E: B8        .byte $B8   ; 
- D 1 - I - 0x01605F 05:A04F: 0C        .byte $0C   ; 
- D 1 - I - 0x016060 05:A050: B5        .byte $B5   ; 
- D 1 - I - 0x016061 05:A051: 0D        .byte $0D   ; 
- D 1 - I - 0x016062 05:A052: B6        .byte $B6   ; 
- D 1 - I - 0x016063 05:A053: B7        .byte $B7   ; 
- D 1 - I - 0x016064 05:A054: B8        .byte $B8   ; 
- D 1 - I - 0x016065 05:A055: B9        .byte $B9   ; 
- D 1 - I - 0x016066 05:A056: BA        .byte $BA   ; 
- D 1 - I - 0x016067 05:A057: 0F        .byte $0F   ; 
- D 1 - I - 0x016068 05:A058: C0        .byte $C0   ; 
- D 1 - I - 0x016069 05:A059: 0F        .byte $0F   ; 
- D 1 - I - 0x01606A 05:A05A: C0        .byte $C0   ; 
- D 1 - I - 0x01606B 05:A05B: 00        .byte $00   ; 
- D 1 - I - 0x01606C 05:A05C: C2        .byte $C2   ; 
- D 1 - I - 0x01606D 05:A05D: C1        .byte $C1   ; 
- D 1 - I - 0x01606E 05:A05E: C2        .byte $C2   ; 
- D 1 - I - 0x01606F 05:A05F: 56        .byte $56   ; 
- D 1 - I - 0x016070 05:A060: 95        .byte $95   ; 
- D 1 - I - 0x016071 05:A061: 08        .byte $08   ; 
- D 1 - I - 0x016072 05:A062: 00        .byte $00   ; 
- D 1 - I - 0x016073 05:A063: 99        .byte $99   ; 
- D 1 - I - 0x016074 05:A064: 98        .byte $98   ; 
- D 1 - I - 0x016075 05:A065: 97        .byte $97   ; 
- D 1 - I - 0x016076 05:A066: 96        .byte $96   ; 
- D 1 - I - 0x016077 05:A067: 11        .byte $11   ; 
- D 1 - I - 0x016078 05:A068: C8        .byte $C8   ; 
- D 1 - I - 0x016079 05:A069: 11        .byte $11   ; 
- D 1 - I - 0x01607A 05:A06A: C6        .byte $C6   ; 
- D 1 - I - 0x01607B 05:A06B: 00        .byte $00   ; 
- D 1 - I - 0x01607C 05:A06C: 00        .byte $00   ; 
- D 1 - I - 0x01607D 05:A06D: C7        .byte $C7   ; 
- D 1 - I - 0x01607E 05:A06E: C8        .byte $C8   ; 
- D 1 - I - 0x01607F 05:A06F: 56        .byte $56   ; 
- D 1 - I - 0x016080 05:A070: 95        .byte $95   ; 
- D 1 - I - 0x016081 05:A071: 08        .byte $08   ; 
- D 1 - I - 0x016082 05:A072: 00        .byte $00   ; 
- D 1 - I - 0x016083 05:A073: 99        .byte $99   ; 
- D 1 - I - 0x016084 05:A074: 98        .byte $98   ; 
- D 1 - I - 0x016085 05:A075: 97        .byte $97   ; 
- D 1 - I - 0x016086 05:A076: 96        .byte $96   ; 
- D 1 - I - 0x016087 05:A077: 0D        .byte $0D   ; 
- D 1 - I - 0x016088 05:A078: B6        .byte $B6   ; 
- D 1 - I - 0x016089 05:A079: 0C        .byte $0C   ; 
- D 1 - I - 0x01608A 05:A07A: 00        .byte $00   ; 
- D 1 - I - 0x01608B 05:A07B: B9        .byte $B9   ; 
- D 1 - I - 0x01608C 05:A07C: BA        .byte $BA   ; 
- D 1 - I - 0x01608D 05:A07D: B7        .byte $B7   ; 
- D 1 - I - 0x01608E 05:A07E: 00        .byte $00   ; 
- D 1 - I - 0x01608F 05:A07F: 0C        .byte $0C   ; 
- D 1 - I - 0x016090 05:A080: B5        .byte $B5   ; 
- D 1 - I - 0x016091 05:A081: 0D        .byte $0D   ; 
- D 1 - I - 0x016092 05:A082: 00        .byte $00   ; 
- D 1 - I - 0x016093 05:A083: B7        .byte $B7   ; 
- D 1 - I - 0x016094 05:A084: B8        .byte $B8   ; 
- D 1 - I - 0x016095 05:A085: B9        .byte $B9   ; 
- D 1 - I - 0x016096 05:A086: BA        .byte $BA   ; 
- D 1 - I - 0x016097 05:A087: 00        .byte $00   ; 
- D 1 - I - 0x016098 05:A088: 00        .byte $00   ; 
- D 1 - I - 0x016099 05:A089: 00        .byte $00   ; 
- D 1 - I - 0x01609A 05:A08A: 00        .byte $00   ; 
- D 1 - I - 0x01609B 05:A08B: BB        .byte $BB   ; 
- D 1 - I - 0x01609C 05:A08C: BC        .byte $BC   ; 
- D 1 - I - 0x01609D 05:A08D: BB        .byte $BB   ; 
- D 1 - I - 0x01609E 05:A08E: BC        .byte $BC   ; 
- D 1 - I - 0x01609F 05:A08F: 0E        .byte $0E   ; 
- D 1 - I - 0x0160A0 05:A090: BD        .byte $BD   ; 
- D 1 - I - 0x0160A1 05:A091: 0E        .byte $0E   ; 
- D 1 - I - 0x0160A2 05:A092: BD        .byte $BD   ; 
- D 1 - I - 0x0160A3 05:A093: BE        .byte $BE   ; 
- D 1 - I - 0x0160A4 05:A094: BF        .byte $BF   ; 
- D 1 - I - 0x0160A5 05:A095: BE        .byte $BE   ; 
- D 1 - I - 0x0160A6 05:A096: BF        .byte $BF   ; 
- - - - - - 0x0160A7 05:A097: 13        .byte $13   ; 
- - - - - - 0x0160A8 05:A098: CC        .byte $CC   ; 
- - - - - - 0x0160A9 05:A099: 13        .byte $13   ; 
- - - - - - 0x0160AA 05:A09A: CC        .byte $CC   ; 
- - - - - - 0x0160AB 05:A09B: CD        .byte $CD   ; 
- - - - - - 0x0160AC 05:A09C: CE        .byte $CE   ; 
- - - - - - 0x0160AD 05:A09D: CD        .byte $CD   ; 
- - - - - - 0x0160AE 05:A09E: CE        .byte $CE   ; 
- - - - - - 0x0160AF 05:A09F: 14        .byte $14   ; 
- - - - - - 0x0160B0 05:A0A0: CF        .byte $CF   ; 
- - - - - - 0x0160B1 05:A0A1: 14        .byte $14   ; 
- - - - - - 0x0160B2 05:A0A2: CF        .byte $CF   ; 
- - - - - - 0x0160B3 05:A0A3: 00        .byte $00   ; 
- - - - - - 0x0160B4 05:A0A4: 00        .byte $00   ; 
- - - - - - 0x0160B5 05:A0A5: 00        .byte $00   ; 
- - - - - - 0x0160B6 05:A0A6: 00        .byte $00   ; 
- D 1 - I - 0x0160B7 05:A0A7: 13        .byte $13   ; 
- D 1 - I - 0x0160B8 05:A0A8: CC        .byte $CC   ; 
- D 1 - I - 0x0160B9 05:A0A9: 13        .byte $13   ; 
- D 1 - I - 0x0160BA 05:A0AA: CC        .byte $CC   ; 
- D 1 - I - 0x0160BB 05:A0AB: CD        .byte $CD   ; 
- D 1 - I - 0x0160BC 05:A0AC: CE        .byte $CE   ; 
- D 1 - I - 0x0160BD 05:A0AD: 00        .byte $00   ; 
- D 1 - I - 0x0160BE 05:A0AE: 00        .byte $00   ; 
- D 1 - I - 0x0160BF 05:A0AF: 00        .byte $00   ; 
- D 1 - I - 0x0160C0 05:A0B0: 80        .byte $80   ; 
- D 1 - I - 0x0160C1 05:A0B1: 51        .byte $51   ; 
- D 1 - I - 0x0160C2 05:A0B2: 81        .byte $81   ; 
- D 1 - I - 0x0160C3 05:A0B3: 82        .byte $82   ; 
- D 1 - I - 0x0160C4 05:A0B4: 83        .byte $83   ; 
- D 1 - I - 0x0160C5 05:A0B5: 84        .byte $84   ; 
- D 1 - I - 0x0160C6 05:A0B6: 4D        .byte $4D   ; 
- D 1 - I - 0x0160C7 05:A0B7: 0F        .byte $0F   ; 
- D 1 - I - 0x0160C8 05:A0B8: C0        .byte $C0   ; 
- D 1 - I - 0x0160C9 05:A0B9: 0F        .byte $0F   ; 
- D 1 - I - 0x0160CA 05:A0BA: C0        .byte $C0   ; 
- D 1 - I - 0x0160CB 05:A0BB: C1        .byte $C1   ; 
- D 1 - I - 0x0160CC 05:A0BC: C2        .byte $C2   ; 
- D 1 - I - 0x0160CD 05:A0BD: C1        .byte $C1   ; 
- D 1 - I - 0x0160CE 05:A0BE: C2        .byte $C2   ; 
- D 1 - I - 0x0160CF 05:A0BF: 10        .byte $10   ; 
- D 1 - I - 0x0160D0 05:A0C0: C3        .byte $C3   ; 
- D 1 - I - 0x0160D1 05:A0C1: 10        .byte $10   ; 
- D 1 - I - 0x0160D2 05:A0C2: C3        .byte $C3   ; 
- D 1 - I - 0x0160D3 05:A0C3: 00        .byte $00   ; 
- D 1 - I - 0x0160D4 05:A0C4: 00        .byte $00   ; 
- D 1 - I - 0x0160D5 05:A0C5: C4        .byte $C4   ; 
- D 1 - I - 0x0160D6 05:A0C6: C5        .byte $C5   ; 
- D 1 - I - 0x0160D7 05:A0C7: 0D        .byte $0D   ; 
- D 1 - I - 0x0160D8 05:A0C8: B6        .byte $B6   ; 
- D 1 - I - 0x0160D9 05:A0C9: 0C        .byte $0C   ; 
- D 1 - I - 0x0160DA 05:A0CA: B5        .byte $B5   ; 
- D 1 - I - 0x0160DB 05:A0CB: B9        .byte $B9   ; 
- D 1 - I - 0x0160DC 05:A0CC: BA        .byte $BA   ; 
- D 1 - I - 0x0160DD 05:A0CD: B7        .byte $B7   ; 
- D 1 - I - 0x0160DE 05:A0CE: B8        .byte $B8   ; 
- D 1 - I - 0x0160DF 05:A0CF: 0C        .byte $0C   ; 
- D 1 - I - 0x0160E0 05:A0D0: B5        .byte $B5   ; 
- D 1 - I - 0x0160E1 05:A0D1: 0D        .byte $0D   ; 
- D 1 - I - 0x0160E2 05:A0D2: B6        .byte $B6   ; 
- D 1 - I - 0x0160E3 05:A0D3: 00        .byte $00   ; 
- D 1 - I - 0x0160E4 05:A0D4: B8        .byte $B8   ; 
- D 1 - I - 0x0160E5 05:A0D5: 00        .byte $00   ; 
- D 1 - I - 0x0160E6 05:A0D6: 00        .byte $00   ; 
- D 1 - I - 0x0160E7 05:A0D7: 00        .byte $00   ; 
- D 1 - I - 0x0160E8 05:A0D8: 00        .byte $00   ; 
- D 1 - I - 0x0160E9 05:A0D9: 11        .byte $11   ; 
- D 1 - I - 0x0160EA 05:A0DA: C6        .byte $C6   ; 
- D 1 - I - 0x0160EB 05:A0DB: 00        .byte $00   ; 
- D 1 - I - 0x0160EC 05:A0DC: C8        .byte $C8   ; 
- D 1 - I - 0x0160ED 05:A0DD: C7        .byte $C7   ; 
- D 1 - I - 0x0160EE 05:A0DE: C8        .byte $C8   ; 
- D 1 - I - 0x0160EF 05:A0DF: 00        .byte $00   ; 
- D 1 - I - 0x0160F0 05:A0E0: C9        .byte $C9   ; 
- D 1 - I - 0x0160F1 05:A0E1: 12        .byte $12   ; 
- D 1 - I - 0x0160F2 05:A0E2: C9        .byte $C9   ; 
- D 1 - I - 0x0160F3 05:A0E3: CA        .byte $CA   ; 
- D 1 - I - 0x0160F4 05:A0E4: CB        .byte $CB   ; 
- D 1 - I - 0x0160F5 05:A0E5: CA        .byte $CA   ; 
- D 1 - I - 0x0160F6 05:A0E6: CB        .byte $CB   ; 
- D 1 - I - 0x0160F7 05:A0E7: 13        .byte $13   ; 
- D 1 - I - 0x0160F8 05:A0E8: CC        .byte $CC   ; 
- D 1 - I - 0x0160F9 05:A0E9: 13        .byte $13   ; 
- D 1 - I - 0x0160FA 05:A0EA: CC        .byte $CC   ; 
- D 1 - I - 0x0160FB 05:A0EB: 00        .byte $00   ; 
- D 1 - I - 0x0160FC 05:A0EC: CE        .byte $CE   ; 
- D 1 - I - 0x0160FD 05:A0ED: CD        .byte $CD   ; 
- D 1 - I - 0x0160FE 05:A0EE: CE        .byte $CE   ; 
- D 1 - I - 0x0160FF 05:A0EF: 00        .byte $00   ; 
- D 1 - I - 0x016100 05:A0F0: CF        .byte $CF   ; 
- D 1 - I - 0x016101 05:A0F1: 14        .byte $14   ; 
- D 1 - I - 0x016102 05:A0F2: CF        .byte $CF   ; 
- D 1 - I - 0x016103 05:A0F3: 00        .byte $00   ; 
- D 1 - I - 0x016104 05:A0F4: BA        .byte $BA   ; 
- D 1 - I - 0x016105 05:A0F5: B7        .byte $B7   ; 
- D 1 - I - 0x016106 05:A0F6: B8        .byte $B8   ; 
- D 1 - I - 0x016107 05:A0F7: 11        .byte $11   ; 
- D 1 - I - 0x016108 05:A0F8: C6        .byte $C6   ; 
- D 1 - I - 0x016109 05:A0F9: 11        .byte $11   ; 
- D 1 - I - 0x01610A 05:A0FA: C6        .byte $C6   ; 
- D 1 - I - 0x01610B 05:A0FB: C7        .byte $C7   ; 
- D 1 - I - 0x01610C 05:A0FC: C8        .byte $C8   ; 
- D 1 - I - 0x01610D 05:A0FD: C7        .byte $C7   ; 
- D 1 - I - 0x01610E 05:A0FE: C8        .byte $C8   ; 
- D 1 - I - 0x01610F 05:A0FF: 00        .byte $00   ; 
- D 1 - I - 0x016110 05:A100: C9        .byte $C9   ; 
- D 1 - I - 0x016111 05:A101: 12        .byte $12   ; 
- D 1 - I - 0x016112 05:A102: C9        .byte $C9   ; 
- D 1 - I - 0x016113 05:A103: 00        .byte $00   ; 
- D 1 - I - 0x016114 05:A104: 00        .byte $00   ; 
- D 1 - I - 0x016115 05:A105: CA        .byte $CA   ; 
- D 1 - I - 0x016116 05:A106: CB        .byte $CB   ; 
- D 1 - I - 0x016117 05:A107: 46        .byte $46   ; 
- D 1 - I - 0x016118 05:A108: D0        .byte $D0   ; 
- D 1 - I - 0x016119 05:A109: 00        .byte $00   ; 
- D 1 - I - 0x01611A 05:A10A: 00        .byte $00   ; 
- D 1 - I - 0x01611B 05:A10B: D1        .byte $D1   ; 
- D 1 - I - 0x01611C 05:A10C: D2        .byte $D2   ; 
- D 1 - I - 0x01611D 05:A10D: 00        .byte $00   ; 
- D 1 - I - 0x01611E 05:A10E: 00        .byte $00   ; 
- D 1 - I - 0x01611F 05:A10F: 4C        .byte $4C   ; 
- D 1 - I - 0x016120 05:A110: E2        .byte $E2   ; 
- D 1 - I - 0x016121 05:A111: 49        .byte $49   ; 
- D 1 - I - 0x016122 05:A112: D7        .byte $D7   ; 
- D 1 - I - 0x016123 05:A113: E3        .byte $E3   ; 
- D 1 - I - 0x016124 05:A114: E4        .byte $E4   ; 
- D 1 - I - 0x016125 05:A115: D8        .byte $D8   ; 
- D 1 - I - 0x016126 05:A116: D9        .byte $D9   ; 
- D 1 - I - 0x016127 05:A117: 00        .byte $00   ; 
- D 1 - I - 0x016128 05:A118: 00        .byte $00   ; 
- D 1 - I - 0x016129 05:A119: 00        .byte $00   ; 
- D 1 - I - 0x01612A 05:A11A: 00        .byte $00   ; 
- D 1 - I - 0x01612B 05:A11B: 00        .byte $00   ; 
- D 1 - I - 0x01612C 05:A11C: 00        .byte $00   ; 
- D 1 - I - 0x01612D 05:A11D: 00        .byte $00   ; 
- D 1 - I - 0x01612E 05:A11E: 00        .byte $00   ; 
- D 1 - I - 0x01612F 05:A11F: 46        .byte $46   ; 
- D 1 - I - 0x016130 05:A120: D0        .byte $D0   ; 
- D 1 - I - 0x016131 05:A121: 00        .byte $00   ; 
- D 1 - I - 0x016132 05:A122: 00        .byte $00   ; 
- D 1 - I - 0x016133 05:A123: D1        .byte $D1   ; 
- D 1 - I - 0x016134 05:A124: D2        .byte $D2   ; 
- D 1 - I - 0x016135 05:A125: 00        .byte $00   ; 
- D 1 - I - 0x016136 05:A126: 00        .byte $00   ; 
- D 1 - I - 0x016137 05:A127: 4B        .byte $4B   ; 
- D 1 - I - 0x016138 05:A128: DC        .byte $DC   ; 
- D 1 - I - 0x016139 05:A129: 47        .byte $47   ; 
- D 1 - I - 0x01613A 05:A12A: D0        .byte $D0   ; 
- D 1 - I - 0x01613B 05:A12B: DD        .byte $DD   ; 
- D 1 - I - 0x01613C 05:A12C: DE        .byte $DE   ; 
- D 1 - I - 0x01613D 05:A12D: D1        .byte $D1   ; 
- D 1 - I - 0x01613E 05:A12E: D2        .byte $D2   ; 
- D 1 - I - 0x01613F 05:A12F: 4C        .byte $4C   ; 
- D 1 - I - 0x016140 05:A130: E2        .byte $E2   ; 
- D 1 - I - 0x016141 05:A131: 46        .byte $46   ; 
- D 1 - I - 0x016142 05:A132: D0        .byte $D0   ; 
- D 1 - I - 0x016143 05:A133: E3        .byte $E3   ; 
- D 1 - I - 0x016144 05:A134: E4        .byte $E4   ; 
- D 1 - I - 0x016145 05:A135: D1        .byte $D1   ; 
- D 1 - I - 0x016146 05:A136: D2        .byte $D2   ; 
- D 1 - I - 0x016147 05:A137: 00        .byte $00   ; 
- D 1 - I - 0x016148 05:A138: 00        .byte $00   ; 
- D 1 - I - 0x016149 05:A139: 00        .byte $00   ; 
- D 1 - I - 0x01614A 05:A13A: 00        .byte $00   ; 
- D 1 - I - 0x01614B 05:A13B: 00        .byte $00   ; 
- D 1 - I - 0x01614C 05:A13C: 00        .byte $00   ; 
- D 1 - I - 0x01614D 05:A13D: 00        .byte $00   ; 
- D 1 - I - 0x01614E 05:A13E: 00        .byte $00   ; 
- D 1 - I - 0x01614F 05:A13F: 46        .byte $46   ; 
- D 1 - I - 0x016150 05:A140: D0        .byte $D0   ; 
- D 1 - I - 0x016151 05:A141: 49        .byte $49   ; 
- D 1 - I - 0x016152 05:A142: D7        .byte $D7   ; 
- D 1 - I - 0x016153 05:A143: D1        .byte $D1   ; 
- D 1 - I - 0x016154 05:A144: D2        .byte $D2   ; 
- D 1 - I - 0x016155 05:A145: D8        .byte $D8   ; 
- D 1 - I - 0x016156 05:A146: D9        .byte $D9   ; 
- D 1 - I - 0x016157 05:A147: 48        .byte $48   ; 
- D 1 - I - 0x016158 05:A148: D4        .byte $D4   ; 
- D 1 - I - 0x016159 05:A149: 46        .byte $46   ; 
- D 1 - I - 0x01615A 05:A14A: D0        .byte $D0   ; 
- D 1 - I - 0x01615B 05:A14B: D5        .byte $D5   ; 
- D 1 - I - 0x01615C 05:A14C: D6        .byte $D6   ; 
- D 1 - I - 0x01615D 05:A14D: D1        .byte $D1   ; 
- D 1 - I - 0x01615E 05:A14E: D2        .byte $D2   ; 
- D 1 - I - 0x01615F 05:A14F: 46        .byte $46   ; 
- D 1 - I - 0x016160 05:A150: D0        .byte $D0   ; 
- D 1 - I - 0x016161 05:A151: 45        .byte $45   ; 
- D 1 - I - 0x016162 05:A152: DF        .byte $DF   ; 
- D 1 - I - 0x016163 05:A153: D1        .byte $D1   ; 
- D 1 - I - 0x016164 05:A154: D2        .byte $D2   ; 
- D 1 - I - 0x016165 05:A155: E0        .byte $E0   ; 
- D 1 - I - 0x016166 05:A156: E1        .byte $E1   ; 
- D 1 - I - 0x016167 05:A157: 4B        .byte $4B   ; 
- D 1 - I - 0x016168 05:A158: DC        .byte $DC   ; 
- D 1 - I - 0x016169 05:A159: 4A        .byte $4A   ; 
- D 1 - I - 0x01616A 05:A15A: D7        .byte $D7   ; 
- D 1 - I - 0x01616B 05:A15B: DD        .byte $DD   ; 
- D 1 - I - 0x01616C 05:A15C: DE        .byte $DE   ; 
- D 1 - I - 0x01616D 05:A15D: D8        .byte $D8   ; 
- D 1 - I - 0x01616E 05:A15E: D9        .byte $D9   ; 
- D 1 - I - 0x01616F 05:A15F: 4C        .byte $4C   ; 
- D 1 - I - 0x016170 05:A160: E2        .byte $E2   ; 
- D 1 - I - 0x016171 05:A161: 48        .byte $48   ; 
- D 1 - I - 0x016172 05:A162: D4        .byte $D4   ; 
- D 1 - I - 0x016173 05:A163: E3        .byte $E3   ; 
- D 1 - I - 0x016174 05:A164: E4        .byte $E4   ; 
- D 1 - I - 0x016175 05:A165: D5        .byte $D5   ; 
- D 1 - I - 0x016176 05:A166: D6        .byte $D6   ; 
- D 1 - I - 0x016177 05:A167: 4B        .byte $4B   ; 
- D 1 - I - 0x016178 05:A168: DC        .byte $DC   ; 
- D 1 - I - 0x016179 05:A169: 4A        .byte $4A   ; 
- D 1 - I - 0x01617A 05:A16A: D7        .byte $D7   ; 
- D 1 - I - 0x01617B 05:A16B: DD        .byte $DD   ; 
- D 1 - I - 0x01617C 05:A16C: DE        .byte $DE   ; 
- D 1 - I - 0x01617D 05:A16D: DA        .byte $DA   ; 
- D 1 - I - 0x01617E 05:A16E: DB        .byte $DB   ; 
- D 1 - I - 0x01617F 05:A16F: 4C        .byte $4C   ; 
- D 1 - I - 0x016180 05:A170: E2        .byte $E2   ; 
- D 1 - I - 0x016181 05:A171: 45        .byte $45   ; 
- D 1 - I - 0x016182 05:A172: DF        .byte $DF   ; 
- D 1 - I - 0x016183 05:A173: E3        .byte $E3   ; 
- D 1 - I - 0x016184 05:A174: E4        .byte $E4   ; 
- D 1 - I - 0x016185 05:A175: E0        .byte $E0   ; 
- D 1 - I - 0x016186 05:A176: E1        .byte $E1   ; 
- D 1 - I - 0x016187 05:A177: 00        .byte $00   ; 
- D 1 - I - 0x016188 05:A178: 00        .byte $00   ; 
- D 1 - I - 0x016189 05:A179: 00        .byte $00   ; 
- D 1 - I - 0x01618A 05:A17A: 00        .byte $00   ; 
- D 1 - I - 0x01618B 05:A17B: 00        .byte $00   ; 
- D 1 - I - 0x01618C 05:A17C: 00        .byte $00   ; 
- D 1 - I - 0x01618D 05:A17D: 00        .byte $00   ; 
- D 1 - I - 0x01618E 05:A17E: 00        .byte $00   ; 
- D 1 - I - 0x01618F 05:A17F: 46        .byte $46   ; 
- D 1 - I - 0x016190 05:A180: D0        .byte $D0   ; 
- D 1 - I - 0x016191 05:A181: 48        .byte $48   ; 
- D 1 - I - 0x016192 05:A182: D4        .byte $D4   ; 
- D 1 - I - 0x016193 05:A183: D1        .byte $D1   ; 
- D 1 - I - 0x016194 05:A184: D2        .byte $D2   ; 
- D 1 - I - 0x016195 05:A185: D5        .byte $D5   ; 
- D 1 - I - 0x016196 05:A186: D6        .byte $D6   ; 
- D 1 - I - 0x016197 05:A187: 46        .byte $46   ; 
- D 1 - I - 0x016198 05:A188: D0        .byte $D0   ; 
- D 1 - I - 0x016199 05:A189: 49        .byte $49   ; 
- D 1 - I - 0x01619A 05:A18A: D7        .byte $D7   ; 
- D 1 - I - 0x01619B 05:A18B: D1        .byte $D1   ; 
- D 1 - I - 0x01619C 05:A18C: D2        .byte $D2   ; 
- D 1 - I - 0x01619D 05:A18D: DA        .byte $DA   ; 
- D 1 - I - 0x01619E 05:A18E: DB        .byte $DB   ; 
- D 1 - I - 0x01619F 05:A18F: 4C        .byte $4C   ; 
- D 1 - I - 0x0161A0 05:A190: E2        .byte $E2   ; 
- D 1 - I - 0x0161A1 05:A191: 45        .byte $45   ; 
- D 1 - I - 0x0161A2 05:A192: DF        .byte $DF   ; 
- D 1 - I - 0x0161A3 05:A193: E3        .byte $E3   ; 
- D 1 - I - 0x0161A4 05:A194: E4        .byte $E4   ; 
- D 1 - I - 0x0161A5 05:A195: E0        .byte $E0   ; 
- D 1 - I - 0x0161A6 05:A196: E1        .byte $E1   ; 
- D 1 - I - 0x0161A7 05:A197: 46        .byte $46   ; 
- D 1 - I - 0x0161A8 05:A198: D0        .byte $D0   ; 
- D 1 - I - 0x0161A9 05:A199: 48        .byte $48   ; 
- D 1 - I - 0x0161AA 05:A19A: D4        .byte $D4   ; 
- D 1 - I - 0x0161AB 05:A19B: D1        .byte $D1   ; 
- D 1 - I - 0x0161AC 05:A19C: D2        .byte $D2   ; 
- D 1 - I - 0x0161AD 05:A19D: D5        .byte $D5   ; 
- D 1 - I - 0x0161AE 05:A19E: D6        .byte $D6   ; 
- D 1 - I - 0x0161AF 05:A19F: 45        .byte $45   ; 
- D 1 - I - 0x0161B0 05:A1A0: DF        .byte $DF   ; 
- D 1 - I - 0x0161B1 05:A1A1: 46        .byte $46   ; 
- D 1 - I - 0x0161B2 05:A1A2: D0        .byte $D0   ; 
- D 1 - I - 0x0161B3 05:A1A3: E0        .byte $E0   ; 
- D 1 - I - 0x0161B4 05:A1A4: E1        .byte $E1   ; 
- D 1 - I - 0x0161B5 05:A1A5: D1        .byte $D1   ; 
- D 1 - I - 0x0161B6 05:A1A6: D2        .byte $D2   ; 
- D 1 - I - 0x0161B7 05:A1A7: 00        .byte $00   ; 
- D 1 - I - 0x0161B8 05:A1A8: 00        .byte $00   ; 
- D 1 - I - 0x0161B9 05:A1A9: 00        .byte $00   ; 
- D 1 - I - 0x0161BA 05:A1AA: 00        .byte $00   ; 
- D 1 - I - 0x0161BB 05:A1AB: 00        .byte $00   ; 
- D 1 - I - 0x0161BC 05:A1AC: 00        .byte $00   ; 
- D 1 - I - 0x0161BD 05:A1AD: 00        .byte $00   ; 
- D 1 - I - 0x0161BE 05:A1AE: 00        .byte $00   ; 
- D 1 - I - 0x0161BF 05:A1AF: 00        .byte $00   ; 
- D 1 - I - 0x0161C0 05:A1B0: 00        .byte $00   ; 
- D 1 - I - 0x0161C1 05:A1B1: 45        .byte $45   ; 
- D 1 - I - 0x0161C2 05:A1B2: DF        .byte $DF   ; 
- D 1 - I - 0x0161C3 05:A1B3: 00        .byte $00   ; 
- D 1 - I - 0x0161C4 05:A1B4: 00        .byte $00   ; 
- D 1 - I - 0x0161C5 05:A1B5: E0        .byte $E0   ; 
- D 1 - I - 0x0161C6 05:A1B6: E1        .byte $E1   ; 
- D 1 - I - 0x0161C7 05:A1B7: 46        .byte $46   ; 
- D 1 - I - 0x0161C8 05:A1B8: D0        .byte $D0   ; 
- D 1 - I - 0x0161C9 05:A1B9: 48        .byte $48   ; 
- D 1 - I - 0x0161CA 05:A1BA: D4        .byte $D4   ; 
- D 1 - I - 0x0161CB 05:A1BB: D1        .byte $D1   ; 
- D 1 - I - 0x0161CC 05:A1BC: D2        .byte $D2   ; 
- D 1 - I - 0x0161CD 05:A1BD: D5        .byte $D5   ; 
- D 1 - I - 0x0161CE 05:A1BE: D6        .byte $D6   ; 
- D 1 - I - 0x0161CF 05:A1BF: 4C        .byte $4C   ; 
- D 1 - I - 0x0161D0 05:A1C0: E2        .byte $E2   ; 
- D 1 - I - 0x0161D1 05:A1C1: 45        .byte $45   ; 
- D 1 - I - 0x0161D2 05:A1C2: DF        .byte $DF   ; 
- D 1 - I - 0x0161D3 05:A1C3: E3        .byte $E3   ; 
- D 1 - I - 0x0161D4 05:A1C4: E4        .byte $E4   ; 
- D 1 - I - 0x0161D5 05:A1C5: E0        .byte $E0   ; 
- D 1 - I - 0x0161D6 05:A1C6: E1        .byte $E1   ; 
- D 1 - I - 0x0161D7 05:A1C7: 36        .byte $36   ; 
- D 1 - I - 0x0161D8 05:A1C8: B0        .byte $B0   ; 
- D 1 - I - 0x0161D9 05:A1C9: 37        .byte $37   ; 
- D 1 - I - 0x0161DA 05:A1CA: B1        .byte $B1   ; 
- D 1 - I - 0x0161DB 05:A1CB: 84        .byte $84   ; 
- D 1 - I - 0x0161DC 05:A1CC: 87        .byte $87   ; 
- D 1 - I - 0x0161DD 05:A1CD: 84        .byte $84   ; 
- D 1 - I - 0x0161DE 05:A1CE: F6        .byte $F6   ; 
- D 1 - I - 0x0161DF 05:A1CF: 38        .byte $38   ; 
- D 1 - I - 0x0161E0 05:A1D0: B4        .byte $B4   ; 
- D 1 - I - 0x0161E1 05:A1D1: 1E        .byte $1E   ; 
- D 1 - I - 0x0161E2 05:A1D2: F7        .byte $F7   ; 
- D 1 - I - 0x0161E3 05:A1D3: 32        .byte $32   ; 
- D 1 - I - 0x0161E4 05:A1D4: A5        .byte $A5   ; 
- D 1 - I - 0x0161E5 05:A1D5: 31        .byte $31   ; 
- D 1 - I - 0x0161E6 05:A1D6: F4        .byte $F4   ; 
- D 1 - I - 0x0161E7 05:A1D7: 16        .byte $16   ; 
- D 1 - I - 0x0161E8 05:A1D8: 00        .byte $00   ; 
- D 1 - I - 0x0161E9 05:A1D9: 48        .byte $48   ; 
- D 1 - I - 0x0161EA 05:A1DA: D4        .byte $D4   ; 
- D 1 - I - 0x0161EB 05:A1DB: E5        .byte $E5   ; 
- D 1 - I - 0x0161EC 05:A1DC: E6        .byte $E6   ; 
- D 1 - I - 0x0161ED 05:A1DD: D5        .byte $D5   ; 
- D 1 - I - 0x0161EE 05:A1DE: D6        .byte $D6   ; 
- D 1 - I - 0x0161EF 05:A1DF: 35        .byte $35   ; 
- D 1 - I - 0x0161F0 05:A1E0: E7        .byte $E7   ; 
- D 1 - I - 0x0161F1 05:A1E1: 16        .byte $16   ; 
- D 1 - I - 0x0161F2 05:A1E2: 00        .byte $00   ; 
- D 1 - I - 0x0161F3 05:A1E3: E8        .byte $E8   ; 
- D 1 - I - 0x0161F4 05:A1E4: E9        .byte $E9   ; 
- D 1 - I - 0x0161F5 05:A1E5: E5        .byte $E5   ; 
- D 1 - I - 0x0161F6 05:A1E6: E6        .byte $E6   ; 
- D 1 - I - 0x0161F7 05:A1E7: 46        .byte $46   ; 
- D 1 - I - 0x0161F8 05:A1E8: D0        .byte $D0   ; 
- D 1 - I - 0x0161F9 05:A1E9: 00        .byte $00   ; 
- D 1 - I - 0x0161FA 05:A1EA: F9        .byte $F9   ; 
- D 1 - I - 0x0161FB 05:A1EB: D1        .byte $D1   ; 
- D 1 - I - 0x0161FC 05:A1EC: D2        .byte $D2   ; 
- D 1 - I - 0x0161FD 05:A1ED: FA        .byte $FA   ; 
- D 1 - I - 0x0161FE 05:A1EE: FB        .byte $FB   ; 
- D 1 - I - 0x0161FF 05:A1EF: 00        .byte $00   ; 
- D 1 - I - 0x016200 05:A1F0: F9        .byte $F9   ; 
- D 1 - I - 0x016201 05:A1F1: 3A        .byte $3A   ; 
- D 1 - I - 0x016202 05:A1F2: FC        .byte $FC   ; 
- D 1 - I - 0x016203 05:A1F3: FA        .byte $FA   ; 
- D 1 - I - 0x016204 05:A1F4: FB        .byte $FB   ; 
- D 1 - I - 0x016205 05:A1F5: FD        .byte $FD   ; 
- D 1 - I - 0x016206 05:A1F6: FE        .byte $FE   ; 
- D 1 - I - 0x016207 05:A1F7: 36        .byte $36   ; 
- D 1 - I - 0x016208 05:A1F8: B0        .byte $B0   ; 
- D 1 - I - 0x016209 05:A1F9: 37        .byte $37   ; 
- D 1 - I - 0x01620A 05:A1FA: B1        .byte $B1   ; 
- D 1 - I - 0x01620B 05:A1FB: 7A        .byte $7A   ; 
- D 1 - I - 0x01620C 05:A1FC: 87        .byte $87   ; 
- D 1 - I - 0x01620D 05:A1FD: 84        .byte $84   ; 
- D 1 - I - 0x01620E 05:A1FE: 4D        .byte $4D   ; 
- D 1 - I - 0x01620F 05:A1FF: 23        .byte $23   ; 
- D 1 - I - 0x016210 05:A200: B4        .byte $B4   ; 
- D 1 - I - 0x016211 05:A201: 1E        .byte $1E   ; 
- D 1 - I - 0x016212 05:A202: B3        .byte $B3   ; 
- D 1 - I - 0x016213 05:A203: 78        .byte $78   ; 
- D 1 - I - 0x016214 05:A204: 8E        .byte $8E   ; 
- D 1 - I - 0x016215 05:A205: 2B        .byte $2B   ; 
- D 1 - I - 0x016216 05:A206: 8F        .byte $8F   ; 
- D 1 - I - 0x016217 05:A207: 32        .byte $32   ; 
- D 1 - I - 0x016218 05:A208: F3        .byte $F3   ; 
- D 1 - I - 0x016219 05:A209: 35        .byte $35   ; 
- D 1 - I - 0x01621A 05:A20A: E7        .byte $E7   ; 
- D 1 - I - 0x01621B 05:A20B: A9        .byte $A9   ; 
- D 1 - I - 0x01621C 05:A20C: F4        .byte $F4   ; 
- D 1 - I - 0x01621D 05:A20D: E8        .byte $E8   ; 
- D 1 - I - 0x01621E 05:A20E: E9        .byte $E9   ; 
- D 1 - I - 0x01621F 05:A20F: 31        .byte $31   ; 
- D 1 - I - 0x016220 05:A210: A4        .byte $A4   ; 
- D 1 - I - 0x016221 05:A211: 32        .byte $32   ; 
- D 1 - I - 0x016222 05:A212: F5        .byte $F5   ; 
- D 1 - I - 0x016223 05:A213: A7        .byte $A7   ; 
- D 1 - I - 0x016224 05:A214: A6        .byte $A6   ; 
- D 1 - I - 0x016225 05:A215: A9        .byte $A9   ; 
- D 1 - I - 0x016226 05:A216: A8        .byte $A8   ; 
- D 1 - I - 0x016227 05:A217: 32        .byte $32   ; 
- D 1 - I - 0x016228 05:A218: EA        .byte $EA   ; 
- D 1 - I - 0x016229 05:A219: 33        .byte $33   ; 
- D 1 - I - 0x01622A 05:A21A: EC        .byte $EC   ; 
- D 1 - I - 0x01622B 05:A21B: A9        .byte $A9   ; 
- D 1 - I - 0x01622C 05:A21C: EB        .byte $EB   ; 
- D 1 - I - 0x01622D 05:A21D: ED        .byte $ED   ; 
- D 1 - I - 0x01622E 05:A21E: EE        .byte $EE   ; 
- D 1 - I - 0x01622F 05:A21F: 31        .byte $31   ; 
- D 1 - I - 0x016230 05:A220: EF        .byte $EF   ; 
- D 1 - I - 0x016231 05:A221: 34        .byte $34   ; 
- D 1 - I - 0x016232 05:A222: F1        .byte $F1   ; 
- D 1 - I - 0x016233 05:A223: A7        .byte $A7   ; 
- D 1 - I - 0x016234 05:A224: F0        .byte $F0   ; 
- D 1 - I - 0x016235 05:A225: ED        .byte $ED   ; 
- D 1 - I - 0x016236 05:A226: F2        .byte $F2   ; 
- D 1 - I - 0x016237 05:A227: 24        .byte $24   ; 
- D 1 - I - 0x016238 05:A228: FF        .byte $FF   ; 
- D 1 - I - 0x016239 05:A229: 25        .byte $25   ; 
- D 1 - I - 0x01623A 05:A22A: 8F        .byte $8F   ; 
- D 1 - I - 0x01623B 05:A22B: 72        .byte $72   ; 
- D 1 - I - 0x01623C 05:A22C: 73        .byte $73   ; 
- D 1 - I - 0x01623D 05:A22D: 74        .byte $74   ; 
- D 1 - I - 0x01623E 05:A22E: 91        .byte $91   ; 
- D 1 - I - 0x01623F 05:A22F: 1F        .byte $1F   ; 
- D 1 - I - 0x016240 05:A230: 75        .byte $75   ; 
- D 1 - I - 0x016241 05:A231: 20        .byte $20   ; 
- D 1 - I - 0x016242 05:A232: 8E        .byte $8E   ; 
- D 1 - I - 0x016243 05:A233: 76        .byte $76   ; 
- D 1 - I - 0x016244 05:A234: 73        .byte $73   ; 
- D 1 - I - 0x016245 05:A235: 77        .byte $77   ; 
- D 1 - I - 0x016246 05:A236: 90        .byte $90   ; 
- D 1 - I - 0x016247 05:A237: 3A        .byte $3A   ; 
- D 1 - I - 0x016248 05:A238: FC        .byte $FC   ; 
- D 1 - I - 0x016249 05:A239: 21        .byte $21   ; 
- D 1 - I - 0x01624A 05:A23A: 8F        .byte $8F   ; 
- D 1 - I - 0x01624B 05:A23B: FD        .byte $FD   ; 
- D 1 - I - 0x01624C 05:A23C: FE        .byte $FE   ; 
- D 1 - I - 0x01624D 05:A23D: 78        .byte $78   ; 
- D 1 - I - 0x01624E 05:A23E: 91        .byte $91   ; 
- D 1 - I - 0x01624F 05:A23F: 22        .byte $22   ; 
- D 1 - I - 0x016250 05:A240: 8F        .byte $8F   ; 
- D 1 - I - 0x016251 05:A241: 2A        .byte $2A   ; 
- D 1 - I - 0x016252 05:A242: 8E        .byte $8E   ; 
- D 1 - I - 0x016253 05:A243: 2D        .byte $2D   ; 
- D 1 - I - 0x016254 05:A244: 91        .byte $91   ; 
- D 1 - I - 0x016255 05:A245: 2A        .byte $2A   ; 
- D 1 - I - 0x016256 05:A246: 8E        .byte $8E   ; 
- D 1 - I - 0x016257 05:A247: 32        .byte $32   ; 
- D 1 - I - 0x016258 05:A248: EA        .byte $EA   ; 
- D 1 - I - 0x016259 05:A249: 33        .byte $33   ; 
- D 1 - I - 0x01625A 05:A24A: EC        .byte $EC   ; 
- D 1 - I - 0x01625B 05:A24B: A9        .byte $A9   ; 
- D 1 - I - 0x01625C 05:A24C: 7F        .byte $7F   ; 
- D 1 - I - 0x01625D 05:A24D: 7E        .byte $7E   ; 
- D 1 - I - 0x01625E 05:A24E: EE        .byte $EE   ; 
- D 1 - I - 0x01625F 05:A24F: 01        .byte $01   ; 
- D 1 - I - 0x016260 05:A250: 0A        .byte $0A   ; 
- D 1 - I - 0x016261 05:A251: 02        .byte $02   ; 
- D 1 - I - 0x016262 05:A252: F8        .byte $F8   ; 
- D 1 - I - 0x016263 05:A253: 00        .byte $00   ; 
- D 1 - I - 0x016264 05:A254: 00        .byte $00   ; 
- D 1 - I - 0x016265 05:A255: 00        .byte $00   ; 
- D 1 - I - 0x016266 05:A256: 00        .byte $00   ; 
- D 1 - I - 0x016267 05:A257: 24        .byte $24   ; 
- D 1 - I - 0x016268 05:A258: FF        .byte $FF   ; 
- D 1 - I - 0x016269 05:A259: 25        .byte $25   ; 
- D 1 - I - 0x01626A 05:A25A: 8F        .byte $8F   ; 
- D 1 - I - 0x01626B 05:A25B: 72        .byte $72   ; 
- D 1 - I - 0x01626C 05:A25C: 7B        .byte $7B   ; 
- D 1 - I - 0x01626D 05:A25D: 7C        .byte $7C   ; 
- D 1 - I - 0x01626E 05:A25E: 91        .byte $91   ; 
- D 1 - I - 0x01626F 05:A25F: 03        .byte $03   ; 
- D 1 - I - 0x016270 05:A260: 7D        .byte $7D   ; 
- D 1 - I - 0x016271 05:A261: 04        .byte $04   ; 
- D 1 - I - 0x016272 05:A262: 2A        .byte $2A   ; 
- D 1 - I - 0x016273 05:A263: 00        .byte $00   ; 
- D 1 - I - 0x016274 05:A264: 00        .byte $00   ; 
- D 1 - I - 0x016275 05:A265: 00        .byte $00   ; 
- D 1 - I - 0x016276 05:A266: 00        .byte $00   ; 
- D 1 - I - 0x016277 05:A267: 16        .byte $16   ; 
- D 1 - I - 0x016278 05:A268: 00        .byte $00   ; 
- D 1 - I - 0x016279 05:A269: 00        .byte $00   ; 
- D 1 - I - 0x01627A 05:A26A: 00        .byte $00   ; 
- D 1 - I - 0x01627B 05:A26B: E5        .byte $E5   ; 
- D 1 - I - 0x01627C 05:A26C: E6        .byte $E6   ; 
- D 1 - I - 0x01627D 05:A26D: 00        .byte $00   ; 
- D 1 - I - 0x01627E 05:A26E: 00        .byte $00   ; 
- D 1 - I - 0x01627F 05:A26F: 35        .byte $35   ; 
- D 1 - I - 0x016280 05:A270: E7        .byte $E7   ; 
- D 1 - I - 0x016281 05:A271: 16        .byte $16   ; 
- D 1 - I - 0x016282 05:A272: 00        .byte $00   ; 
- D 1 - I - 0x016283 05:A273: E8        .byte $E8   ; 
- D 1 - I - 0x016284 05:A274: E9        .byte $E9   ; 
- D 1 - I - 0x016285 05:A275: E5        .byte $E5   ; 
- D 1 - I - 0x016286 05:A276: E6        .byte $E6   ; 
- D 1 - I - 0x016287 05:A277: 00        .byte $00   ; 
- D 1 - I - 0x016288 05:A278: 00        .byte $00   ; 
- D 1 - I - 0x016289 05:A279: 00        .byte $00   ; 
- D 1 - I - 0x01628A 05:A27A: F9        .byte $F9   ; 
- D 1 - I - 0x01628B 05:A27B: 00        .byte $00   ; 
- D 1 - I - 0x01628C 05:A27C: 00        .byte $00   ; 
- D 1 - I - 0x01628D 05:A27D: FA        .byte $FA   ; 
- D 1 - I - 0x01628E 05:A27E: FB        .byte $FB   ; 
- D 1 - I - 0x01628F 05:A27F: 00        .byte $00   ; 
- D 1 - I - 0x016290 05:A280: F9        .byte $F9   ; 
- D 1 - I - 0x016291 05:A281: 3A        .byte $3A   ; 
- D 1 - I - 0x016292 05:A282: FC        .byte $FC   ; 
- D 1 - I - 0x016293 05:A283: FA        .byte $FA   ; 
- D 1 - I - 0x016294 05:A284: FB        .byte $FB   ; 
- D 1 - I - 0x016295 05:A285: FD        .byte $FD   ; 
- D 1 - I - 0x016296 05:A286: FE        .byte $FE   ; 
- D 1 - I - 0x016297 05:A287: 01        .byte $01   ; 
- D 1 - I - 0x016298 05:A288: A9        .byte $A9   ; 
- D 1 - I - 0x016299 05:A289: 01        .byte $01   ; 
- D 1 - I - 0x01629A 05:A28A: 0A        .byte $0A   ; 
- D 1 - I - 0x01629B 05:A28B: AA        .byte $AA   ; 
- D 1 - I - 0x01629C 05:A28C: 0A        .byte $0A   ; 
- D 1 - I - 0x01629D 05:A28D: 00        .byte $00   ; 
- D 1 - I - 0x01629E 05:A28E: 00        .byte $00   ; 
- D 1 - I - 0x01629F 05:A28F: 00        .byte $00   ; 
- D 1 - I - 0x0162A0 05:A290: 00        .byte $00   ; 
- D 1 - I - 0x0162A1 05:A291: 00        .byte $00   ; 
- D 1 - I - 0x0162A2 05:A292: 00        .byte $00   ; 
- D 1 - I - 0x0162A3 05:A293: 00        .byte $00   ; 
- D 1 - I - 0x0162A4 05:A294: 00        .byte $00   ; 
- D 1 - I - 0x0162A5 05:A295: 00        .byte $00   ; 
- D 1 - I - 0x0162A6 05:A296: 00        .byte $00   ; 
- D 1 - I - 0x0162A7 05:A297: 04        .byte $04   ; 
- D 1 - I - 0x0162A8 05:A298: 2A        .byte $2A   ; 
- D 1 - I - 0x0162A9 05:A299: 07        .byte $07   ; 
- D 1 - I - 0x0162AA 05:A29A: 2C        .byte $2C   ; 
- D 1 - I - 0x0162AB 05:A29B: 00        .byte $00   ; 
- D 1 - I - 0x0162AC 05:A29C: 00        .byte $00   ; 
- D 1 - I - 0x0162AD 05:A29D: 93        .byte $93   ; 
- D 1 - I - 0x0162AE 05:A29E: 0B        .byte $0B   ; 
- D 1 - I - 0x0162AF 05:A29F: 00        .byte $00   ; 
- D 1 - I - 0x0162B0 05:A2A0: 00        .byte $00   ; 
- D 1 - I - 0x0162B1 05:A2A1: 00        .byte $00   ; 
- D 1 - I - 0x0162B2 05:A2A2: 00        .byte $00   ; 
- D 1 - I - 0x0162B3 05:A2A3: 00        .byte $00   ; 
- D 1 - I - 0x0162B4 05:A2A4: 00        .byte $00   ; 
- D 1 - I - 0x0162B5 05:A2A5: 00        .byte $00   ; 
- D 1 - I - 0x0162B6 05:A2A6: 00        .byte $00   ; 
- D 1 - I - 0x0162B7 05:A2A7: 32        .byte $32   ; 
- D 1 - I - 0x0162B8 05:A2A8: A5        .byte $A5   ; 
- D 1 - I - 0x0162B9 05:A2A9: 31        .byte $31   ; 
- D 1 - I - 0x0162BA 05:A2AA: A4        .byte $A4   ; 
- D 1 - I - 0x0162BB 05:A2AB: A9        .byte $A9   ; 
- D 1 - I - 0x0162BC 05:A2AC: A8        .byte $A8   ; 
- D 1 - I - 0x0162BD 05:A2AD: A7        .byte $A7   ; 
- D 1 - I - 0x0162BE 05:A2AE: A6        .byte $A6   ; 
- D 1 - I - 0x0162BF 05:A2AF: 32        .byte $32   ; 
- D 1 - I - 0x0162C0 05:A2B0: A7        .byte $A7   ; 
- D 1 - I - 0x0162C1 05:A2B1: 32        .byte $32   ; 
- D 1 - I - 0x0162C2 05:A2B2: A9        .byte $A9   ; 
- D 1 - I - 0x0162C3 05:A2B3: A8        .byte $A8   ; 
- D 1 - I - 0x0162C4 05:A2B4: AB        .byte $AB   ; 
- D 1 - I - 0x0162C5 05:A2B5: AA        .byte $AA   ; 
- D 1 - I - 0x0162C6 05:A2B6: 0A        .byte $0A   ; 
- D 1 - I - 0x0162C7 05:A2B7: 2A        .byte $2A   ; 
- D 1 - I - 0x0162C8 05:A2B8: 8E        .byte $8E   ; 
- D 1 - I - 0x0162C9 05:A2B9: 2B        .byte $2B   ; 
- D 1 - I - 0x0162CA 05:A2BA: 8F        .byte $8F   ; 
- D 1 - I - 0x0162CB 05:A2BB: 2C        .byte $2C   ; 
- D 1 - I - 0x0162CC 05:A2BC: 90        .byte $90   ; 
- D 1 - I - 0x0162CD 05:A2BD: 2D        .byte $2D   ; 
- D 1 - I - 0x0162CE 05:A2BE: 91        .byte $91   ; 
- D 1 - I - 0x0162CF 05:A2BF: 2B        .byte $2B   ; 
- D 1 - I - 0x0162D0 05:A2C0: 8F        .byte $8F   ; 
- D 1 - I - 0x0162D1 05:A2C1: 2A        .byte $2A   ; 
- D 1 - I - 0x0162D2 05:A2C2: 8E        .byte $8E   ; 
- D 1 - I - 0x0162D3 05:A2C3: 93        .byte $93   ; 
- D 1 - I - 0x0162D4 05:A2C4: 0B        .byte $0B   ; 
- D 1 - I - 0x0162D5 05:A2C5: 94        .byte $94   ; 
- D 1 - I - 0x0162D6 05:A2C6: 90        .byte $90   ; 
- D 1 - I - 0x0162D7 05:A2C7: 3A        .byte $3A   ; 
- D 1 - I - 0x0162D8 05:A2C8: FC        .byte $FC   ; 
- D 1 - I - 0x0162D9 05:A2C9: 21        .byte $21   ; 
- D 1 - I - 0x0162DA 05:A2CA: 79        .byte $79   ; 
- D 1 - I - 0x0162DB 05:A2CB: FD        .byte $FD   ; 
- D 1 - I - 0x0162DC 05:A2CC: FE        .byte $FE   ; 
- D 1 - I - 0x0162DD 05:A2CD: 78        .byte $78   ; 
- D 1 - I - 0x0162DE 05:A2CE: 91        .byte $91   ; 
- D 1 - I - 0x0162DF 05:A2CF: 21        .byte $21   ; 
- D 1 - I - 0x0162E0 05:A2D0: 8F        .byte $8F   ; 
- D 1 - I - 0x0162E1 05:A2D1: 2A        .byte $2A   ; 
- D 1 - I - 0x0162E2 05:A2D2: 8E        .byte $8E   ; 
- D 1 - I - 0x0162E3 05:A2D3: 78        .byte $78   ; 
- D 1 - I - 0x0162E4 05:A2D4: 91        .byte $91   ; 
- D 1 - I - 0x0162E5 05:A2D5: 2C        .byte $2C   ; 
- D 1 - I - 0x0162E6 05:A2D6: 90        .byte $90   ; 
- D 1 - I - 0x0162E7 05:A2D7: 1B        .byte $1B   ; 
- D 1 - I - 0x0162E8 05:A2D8: BF        .byte $BF   ; 
- D 1 - I - 0x0162E9 05:A2D9: 1C        .byte $1C   ; 
- D 1 - I - 0x0162EA 05:A2DA: C0        .byte $C0   ; 
- D 1 - I - 0x0162EB 05:A2DB: C1        .byte $C1   ; 
- D 1 - I - 0x0162EC 05:A2DC: C2        .byte $C2   ; 
- D 1 - I - 0x0162ED 05:A2DD: C3        .byte $C3   ; 
- D 1 - I - 0x0162EE 05:A2DE: C4        .byte $C4   ; 
- D 1 - I - 0x0162EF 05:A2DF: 18        .byte $18   ; 
- D 1 - I - 0x0162F0 05:A2E0: C5        .byte $C5   ; 
- D 1 - I - 0x0162F1 05:A2E1: 17        .byte $17   ; 
- D 1 - I - 0x0162F2 05:A2E2: C6        .byte $C6   ; 
- D 1 - I - 0x0162F3 05:A2E3: C7        .byte $C7   ; 
- D 1 - I - 0x0162F4 05:A2E4: C8        .byte $C8   ; 
- D 1 - I - 0x0162F5 05:A2E5: C9        .byte $C9   ; 
- D 1 - I - 0x0162F6 05:A2E6: CA        .byte $CA   ; 
- D 1 - I - 0x0162F7 05:A2E7: 32        .byte $32   ; 
- D 1 - I - 0x0162F8 05:A2E8: EA        .byte $EA   ; 
- D 1 - I - 0x0162F9 05:A2E9: 33        .byte $33   ; 
- D 1 - I - 0x0162FA 05:A2EA: EC        .byte $EC   ; 
- D 1 - I - 0x0162FB 05:A2EB: A9        .byte $A9   ; 
- D 1 - I - 0x0162FC 05:A2EC: EB        .byte $EB   ; 
- D 1 - I - 0x0162FD 05:A2ED: 99        .byte $99   ; 
- D 1 - I - 0x0162FE 05:A2EE: EE        .byte $EE   ; 
- - - - - - 0x0162FF 05:A2EF: 31        .byte $31   ; 
- - - - - - 0x016300 05:A2F0: EF        .byte $EF   ; 
- - - - - - 0x016301 05:A2F1: 34        .byte $34   ; 
- - - - - - 0x016302 05:A2F2: F1        .byte $F1   ; 
- - - - - - 0x016303 05:A2F3: A7        .byte $A7   ; 
- - - - - - 0x016304 05:A2F4: F0        .byte $F0   ; 
- - - - - - 0x016305 05:A2F5: ED        .byte $ED   ; 
- - - - - - 0x016306 05:A2F6: F2        .byte $F2   ; 
- D 1 - I - 0x016307 05:A2F7: 24        .byte $24   ; 
- D 1 - I - 0x016308 05:A2F8: FF        .byte $FF   ; 
- D 1 - I - 0x016309 05:A2F9: 25        .byte $25   ; 
- D 1 - I - 0x01630A 05:A2FA: 8F        .byte $8F   ; 
- D 1 - I - 0x01630B 05:A2FB: 72        .byte $72   ; 
- D 1 - I - 0x01630C 05:A2FC: 73        .byte $73   ; 
- D 1 - I - 0x01630D 05:A2FD: 74        .byte $74   ; 
- D 1 - I - 0x01630E 05:A2FE: 91        .byte $91   ; 
- - - - - - 0x01630F 05:A2FF: 1F        .byte $1F   ; 
- - - - - - 0x016310 05:A300: 75        .byte $75   ; 
- - - - - - 0x016311 05:A301: 20        .byte $20   ; 
- - - - - - 0x016312 05:A302: 8E        .byte $8E   ; 
- - - - - - 0x016313 05:A303: 76        .byte $76   ; 
- - - - - - 0x016314 05:A304: 73        .byte $73   ; 
- - - - - - 0x016315 05:A305: 77        .byte $77   ; 
- - - - - - 0x016316 05:A306: 90        .byte $90   ; 
- D 1 - I - 0x016317 05:A307: 19        .byte $19   ; 
- D 1 - I - 0x016318 05:A308: BF        .byte $BF   ; 
- D 1 - I - 0x016319 05:A309: 1A        .byte $1A   ; 
- D 1 - I - 0x01631A 05:A30A: C0        .byte $C0   ; 
- D 1 - I - 0x01631B 05:A30B: CE        .byte $CE   ; 
- D 1 - I - 0x01631C 05:A30C: C2        .byte $C2   ; 
- D 1 - I - 0x01631D 05:A30D: C3        .byte $C3   ; 
- D 1 - I - 0x01631E 05:A30E: C4        .byte $C4   ; 
- D 1 - I - 0x01631F 05:A30F: 15        .byte $15   ; 
- D 1 - I - 0x016320 05:A310: C5        .byte $C5   ; 
- D 1 - I - 0x016321 05:A311: 17        .byte $17   ; 
- D 1 - I - 0x016322 05:A312: C6        .byte $C6   ; 
- D 1 - I - 0x016323 05:A313: CF        .byte $CF   ; 
- D 1 - I - 0x016324 05:A314: C8        .byte $C8   ; 
- D 1 - I - 0x016325 05:A315: C9        .byte $C9   ; 
- D 1 - I - 0x016326 05:A316: CA        .byte $CA   ; 
- D 1 - I - 0x016327 05:A317: 1B        .byte $1B   ; 
- D 1 - I - 0x016328 05:A318: BF        .byte $BF   ; 
- D 1 - I - 0x016329 05:A319: 1C        .byte $1C   ; 
- D 1 - I - 0x01632A 05:A31A: CB        .byte $CB   ; 
- D 1 - I - 0x01632B 05:A31B: C1        .byte $C1   ; 
- D 1 - I - 0x01632C 05:A31C: C2        .byte $C2   ; 
- D 1 - I - 0x01632D 05:A31D: C3        .byte $C3   ; 
- D 1 - I - 0x01632E 05:A31E: CC        .byte $CC   ; 
- D 1 - I - 0x01632F 05:A31F: 18        .byte $18   ; 
- D 1 - I - 0x016330 05:A320: C5        .byte $C5   ; 
- D 1 - I - 0x016331 05:A321: 17        .byte $17   ; 
- D 1 - I - 0x016332 05:A322: CD        .byte $CD   ; 
- D 1 - I - 0x016333 05:A323: C7        .byte $C7   ; 
- D 1 - I - 0x016334 05:A324: C8        .byte $C8   ; 
- D 1 - I - 0x016335 05:A325: C9        .byte $C9   ; 
- D 1 - I - 0x016336 05:A326: 00        .byte $00   ; 
- D 1 - I - 0x016337 05:A327: 00        .byte $00   ; 
- D 1 - I - 0x016338 05:A328: 00        .byte $00   ; 
- D 1 - I - 0x016339 05:A329: 00        .byte $00   ; 
- D 1 - I - 0x01633A 05:A32A: 00        .byte $00   ; 
- D 1 - I - 0x01633B 05:A32B: 00        .byte $00   ; 
- D 1 - I - 0x01633C 05:A32C: 1D        .byte $1D   ; 
- D 1 - I - 0x01633D 05:A32D: 3B        .byte $3B   ; 
- D 1 - I - 0x01633E 05:A32E: 00        .byte $00   ; 
- D 1 - I - 0x01633F 05:A32F: 05        .byte $05   ; 
- D 1 - I - 0x016340 05:A330: 3C        .byte $3C   ; 
- D 1 - I - 0x016341 05:A331: 06        .byte $06   ; 
- D 1 - I - 0x016342 05:A332: 3D        .byte $3D   ; 
- D 1 - I - 0x016343 05:A333: 3E        .byte $3E   ; 
- D 1 - I - 0x016344 05:A334: 3F        .byte $3F   ; 
- D 1 - I - 0x016345 05:A335: 40        .byte $40   ; 
- D 1 - I - 0x016346 05:A336: 41        .byte $41   ; 
- D 1 - I - 0x016347 05:A337: 00        .byte $00   ; 
- D 1 - I - 0x016348 05:A338: 00        .byte $00   ; 
- D 1 - I - 0x016349 05:A339: 00        .byte $00   ; 
- D 1 - I - 0x01634A 05:A33A: 00        .byte $00   ; 
- D 1 - I - 0x01634B 05:A33B: 00        .byte $00   ; 
- D 1 - I - 0x01634C 05:A33C: 42        .byte $42   ; 
- D 1 - I - 0x01634D 05:A33D: 43        .byte $43   ; 
- D 1 - I - 0x01634E 05:A33E: 00        .byte $00   ; 
- D 1 - I - 0x01634F 05:A33F: 44        .byte $44   ; 
- D 1 - I - 0x016350 05:A340: 5B        .byte $5B   ; 
- D 1 - I - 0x016351 05:A341: 5C        .byte $5C   ; 
- D 1 - I - 0x016352 05:A342: 5D        .byte $5D   ; 
- D 1 - I - 0x016353 05:A343: 5E        .byte $5E   ; 
- D 1 - I - 0x016354 05:A344: 5F        .byte $5F   ; 
- D 1 - I - 0x016355 05:A345: 60        .byte $60   ; 
- D 1 - I - 0x016356 05:A346: 61        .byte $61   ; 
- D 1 - I - 0x016357 05:A347: 62        .byte $62   ; 
- D 1 - I - 0x016358 05:A348: 63        .byte $63   ; 
- D 1 - I - 0x016359 05:A349: 64        .byte $64   ; 
- D 1 - I - 0x01635A 05:A34A: 65        .byte $65   ; 
- D 1 - I - 0x01635B 05:A34B: 66        .byte $66   ; 
- D 1 - I - 0x01635C 05:A34C: 67        .byte $67   ; 
- D 1 - I - 0x01635D 05:A34D: 68        .byte $68   ; 
- D 1 - I - 0x01635E 05:A34E: 69        .byte $69   ; 
- D 1 - I - 0x01635F 05:A34F: BB        .byte $BB   ; 
- D 1 - I - 0x016360 05:A350: BC        .byte $BC   ; 
- D 1 - I - 0x016361 05:A351: BD        .byte $BD   ; 
- D 1 - I - 0x016362 05:A352: BE        .byte $BE   ; 
- D 1 - I - 0x016363 05:A353: 3E        .byte $3E   ; 
- D 1 - I - 0x016364 05:A354: 3F        .byte $3F   ; 
- D 1 - I - 0x016365 05:A355: 40        .byte $40   ; 
- D 1 - I - 0x016366 05:A356: 41        .byte $41   ; 
- D 1 - I - 0x016367 05:A357: 00        .byte $00   ; 
- D 1 - I - 0x016368 05:A358: 00        .byte $00   ; 
- D 1 - I - 0x016369 05:A359: 00        .byte $00   ; 
- D 1 - I - 0x01636A 05:A35A: 00        .byte $00   ; 
- D 1 - I - 0x01636B 05:A35B: 00        .byte $00   ; 
- D 1 - I - 0x01636C 05:A35C: 00        .byte $00   ; 
- D 1 - I - 0x01636D 05:A35D: 00        .byte $00   ; 
- D 1 - I - 0x01636E 05:A35E: 00        .byte $00   ; 
- D 1 - I - 0x01636F 05:A35F: 00        .byte $00   ; 
- D 1 - I - 0x016370 05:A360: 00        .byte $00   ; 
- D 1 - I - 0x016371 05:A361: 00        .byte $00   ; 
- D 1 - I - 0x016372 05:A362: 2D        .byte $2D   ; 
- D 1 - I - 0x016373 05:A363: 00        .byte $00   ; 
- D 1 - I - 0x016374 05:A364: 00        .byte $00   ; 
- D 1 - I - 0x016375 05:A365: 00        .byte $00   ; 
- D 1 - I - 0x016376 05:A366: 3B        .byte $3B   ; 
- D 1 - I - 0x016377 05:A367: 00        .byte $00   ; 
- D 1 - I - 0x016378 05:A368: 00        .byte $00   ; 
- D 1 - I - 0x016379 05:A369: 00        .byte $00   ; 
- D 1 - I - 0x01637A 05:A36A: 00        .byte $00   ; 
- D 1 - I - 0x01637B 05:A36B: 00        .byte $00   ; 
- D 1 - I - 0x01637C 05:A36C: 00        .byte $00   ; 
- D 1 - I - 0x01637D 05:A36D: 25        .byte $25   ; 
- D 1 - I - 0x01637E 05:A36E: 26        .byte $26   ; 
- D 1 - I - 0x01637F 05:A36F: 2E        .byte $2E   ; 
- D 1 - I - 0x016380 05:A370: 2F        .byte $2F   ; 
- D 1 - I - 0x016381 05:A371: 30        .byte $30   ; 
- D 1 - I - 0x016382 05:A372: 31        .byte $31   ; 
- D 1 - I - 0x016383 05:A373: 3C        .byte $3C   ; 
- D 1 - I - 0x016384 05:A374: 3D        .byte $3D   ; 
- D 1 - I - 0x016385 05:A375: 3E        .byte $3E   ; 
- D 1 - I - 0x016386 05:A376: 3F        .byte $3F   ; 
- D 1 - I - 0x016387 05:A377: 00        .byte $00   ; 
- D 1 - I - 0x016388 05:A378: 00        .byte $00   ; 
- D 1 - I - 0x016389 05:A379: 21        .byte $21   ; 
- D 1 - I - 0x01638A 05:A37A: 22        .byte $22   ; 
- D 1 - I - 0x01638B 05:A37B: 27        .byte $27   ; 
- D 1 - I - 0x01638C 05:A37C: 28        .byte $28   ; 
- D 1 - I - 0x01638D 05:A37D: 29        .byte $29   ; 
- D 1 - I - 0x01638E 05:A37E: 2A        .byte $2A   ; 
- D 1 - I - 0x01638F 05:A37F: 32        .byte $32   ; 
- D 1 - I - 0x016390 05:A380: 33        .byte $33   ; 
- D 1 - I - 0x016391 05:A381: 34        .byte $34   ; 
- D 1 - I - 0x016392 05:A382: 35        .byte $35   ; 
- D 1 - I - 0x016393 05:A383: 40        .byte $40   ; 
- D 1 - I - 0x016394 05:A384: 41        .byte $41   ; 
- D 1 - I - 0x016395 05:A385: 42        .byte $42   ; 
- D 1 - I - 0x016396 05:A386: 43        .byte $43   ; 
- D 1 - I - 0x016397 05:A387: 23        .byte $23   ; 
- D 1 - I - 0x016398 05:A388: 24        .byte $24   ; 
- D 1 - I - 0x016399 05:A389: 00        .byte $00   ; 
- D 1 - I - 0x01639A 05:A38A: 00        .byte $00   ; 
- D 1 - I - 0x01639B 05:A38B: 2B        .byte $2B   ; 
- D 1 - I - 0x01639C 05:A38C: 2C        .byte $2C   ; 
- D 1 - I - 0x01639D 05:A38D: 25        .byte $25   ; 
- D 1 - I - 0x01639E 05:A38E: 26        .byte $26   ; 
- D 1 - I - 0x01639F 05:A38F: 36        .byte $36   ; 
- D 1 - I - 0x0163A0 05:A390: 37        .byte $37   ; 
- D 1 - I - 0x0163A1 05:A391: 38        .byte $38   ; 
- D 1 - I - 0x0163A2 05:A392: 39        .byte $39   ; 
- D 1 - I - 0x0163A3 05:A393: 44        .byte $44   ; 
- D 1 - I - 0x0163A4 05:A394: 45        .byte $45   ; 
- D 1 - I - 0x0163A5 05:A395: 46        .byte $46   ; 
- D 1 - I - 0x0163A6 05:A396: 47        .byte $47   ; 
- D 1 - I - 0x0163A7 05:A397: 00        .byte $00   ; 
- D 1 - I - 0x0163A8 05:A398: 00        .byte $00   ; 
- D 1 - I - 0x0163A9 05:A399: 00        .byte $00   ; 
- D 1 - I - 0x0163AA 05:A39A: 00        .byte $00   ; 
- D 1 - I - 0x0163AB 05:A39B: 27        .byte $27   ; 
- D 1 - I - 0x0163AC 05:A39C: 28        .byte $28   ; 
- D 1 - I - 0x0163AD 05:A39D: 00        .byte $00   ; 
- D 1 - I - 0x0163AE 05:A39E: 00        .byte $00   ; 
- D 1 - I - 0x0163AF 05:A39F: 2E        .byte $2E   ; 
- D 1 - I - 0x0163B0 05:A3A0: 2F        .byte $2F   ; 
- D 1 - I - 0x0163B1 05:A3A1: 30        .byte $30   ; 
- D 1 - I - 0x0163B2 05:A3A2: 31        .byte $31   ; 
- D 1 - I - 0x0163B3 05:A3A3: 3C        .byte $3C   ; 
- D 1 - I - 0x0163B4 05:A3A4: 3D        .byte $3D   ; 
- D 1 - I - 0x0163B5 05:A3A5: 3E        .byte $3E   ; 
- D 1 - I - 0x0163B6 05:A3A6: 3F        .byte $3F   ; 
- D 1 - I - 0x0163B7 05:A3A7: 00        .byte $00   ; 
- D 1 - I - 0x0163B8 05:A3A8: 00        .byte $00   ; 
- D 1 - I - 0x0163B9 05:A3A9: 00        .byte $00   ; 
- D 1 - I - 0x0163BA 05:A3AA: 00        .byte $00   ; 
- D 1 - I - 0x0163BB 05:A3AB: 00        .byte $00   ; 
- D 1 - I - 0x0163BC 05:A3AC: 00        .byte $00   ; 
- D 1 - I - 0x0163BD 05:A3AD: 00        .byte $00   ; 
- D 1 - I - 0x0163BE 05:A3AE: 00        .byte $00   ; 
- D 1 - I - 0x0163BF 05:A3AF: 3A        .byte $3A   ; 
- D 1 - I - 0x0163C0 05:A3B0: 00        .byte $00   ; 
- D 1 - I - 0x0163C1 05:A3B1: 00        .byte $00   ; 
- D 1 - I - 0x0163C2 05:A3B2: 00        .byte $00   ; 
- D 1 - I - 0x0163C3 05:A3B3: 48        .byte $48   ; 
- D 1 - I - 0x0163C4 05:A3B4: 00        .byte $00   ; 
- D 1 - I - 0x0163C5 05:A3B5: 00        .byte $00   ; 
- D 1 - I - 0x0163C6 05:A3B6: 00        .byte $00   ; 
- D 1 - I - 0x0163C7 05:A3B7: 00        .byte $00   ; 
- D 1 - I - 0x0163C8 05:A3B8: 00        .byte $00   ; 
- D 1 - I - 0x0163C9 05:A3B9: 00        .byte $00   ; 
- D 1 - I - 0x0163CA 05:A3BA: 75        .byte $75   ; 
- D 1 - I - 0x0163CB 05:A3BB: 00        .byte $00   ; 
- D 1 - I - 0x0163CC 05:A3BC: 00        .byte $00   ; 
- D 1 - I - 0x0163CD 05:A3BD: 00        .byte $00   ; 
- D 1 - I - 0x0163CE 05:A3BE: 77        .byte $77   ; 
- D 1 - I - 0x0163CF 05:A3BF: 00        .byte $00   ; 
- D 1 - I - 0x0163D0 05:A3C0: 00        .byte $00   ; 
- D 1 - I - 0x0163D1 05:A3C1: 00        .byte $00   ; 
- D 1 - I - 0x0163D2 05:A3C2: 7E        .byte $7E   ; 
- D 1 - I - 0x0163D3 05:A3C3: 00        .byte $00   ; 
- D 1 - I - 0x0163D4 05:A3C4: 00        .byte $00   ; 
- D 1 - I - 0x0163D5 05:A3C5: 00        .byte $00   ; 
- D 1 - I - 0x0163D6 05:A3C6: 7F        .byte $7F   ; 
- D 1 - I - 0x0163D7 05:A3C7: 00        .byte $00   ; 
- D 1 - I - 0x0163D8 05:A3C8: 7A        .byte $7A   ; 
- D 1 - I - 0x0163D9 05:A3C9: 79        .byte $79   ; 
- D 1 - I - 0x0163DA 05:A3CA: 00        .byte $00   ; 
- D 1 - I - 0x0163DB 05:A3CB: 7A        .byte $7A   ; 
- D 1 - I - 0x0163DC 05:A3CC: 00        .byte $00   ; 
- D 1 - I - 0x0163DD 05:A3CD: 00        .byte $00   ; 
- D 1 - I - 0x0163DE 05:A3CE: 7B        .byte $7B   ; 
- D 1 - I - 0x0163DF 05:A3CF: 76        .byte $76   ; 
- D 1 - I - 0x0163E0 05:A3D0: 00        .byte $00   ; 
- D 1 - I - 0x0163E1 05:A3D1: 7A        .byte $7A   ; 
- D 1 - I - 0x0163E2 05:A3D2: 76        .byte $76   ; 
- D 1 - I - 0x0163E3 05:A3D3: 00        .byte $00   ; 
- D 1 - I - 0x0163E4 05:A3D4: 7B        .byte $7B   ; 
- D 1 - I - 0x0163E5 05:A3D5: 76        .byte $76   ; 
- D 1 - I - 0x0163E6 05:A3D6: 7A        .byte $7A   ; 
- D 1 - I - 0x0163E7 05:A3D7: 49        .byte $49   ; 
- D 1 - I - 0x0163E8 05:A3D8: 4A        .byte $4A   ; 
- D 1 - I - 0x0163E9 05:A3D9: 4B        .byte $4B   ; 
- D 1 - I - 0x0163EA 05:A3DA: 4C        .byte $4C   ; 
- D 1 - I - 0x0163EB 05:A3DB: 51        .byte $51   ; 
- D 1 - I - 0x0163EC 05:A3DC: 52        .byte $52   ; 
- D 1 - I - 0x0163ED 05:A3DD: 53        .byte $53   ; 
- D 1 - I - 0x0163EE 05:A3DE: 54        .byte $54   ; 
- D 1 - I - 0x0163EF 05:A3DF: 58        .byte $58   ; 
- D 1 - I - 0x0163F0 05:A3E0: 59        .byte $59   ; 
- D 1 - I - 0x0163F1 05:A3E1: 5A        .byte $5A   ; 
- D 1 - I - 0x0163F2 05:A3E2: 5B        .byte $5B   ; 
- D 1 - I - 0x0163F3 05:A3E3: 79        .byte $79   ; 
- D 1 - I - 0x0163F4 05:A3E4: 60        .byte $60   ; 
- D 1 - I - 0x0163F5 05:A3E5: 61        .byte $61   ; 
- D 1 - I - 0x0163F6 05:A3E6: 62        .byte $62   ; 
- D 1 - I - 0x0163F7 05:A3E7: 4D        .byte $4D   ; 
- D 1 - I - 0x0163F8 05:A3E8: 4E        .byte $4E   ; 
- D 1 - I - 0x0163F9 05:A3E9: 4F        .byte $4F   ; 
- D 1 - I - 0x0163FA 05:A3EA: 50        .byte $50   ; 
- D 1 - I - 0x0163FB 05:A3EB: 55        .byte $55   ; 
- D 1 - I - 0x0163FC 05:A3EC: 56        .byte $56   ; 
- D 1 - I - 0x0163FD 05:A3ED: 57        .byte $57   ; 
- D 1 - I - 0x0163FE 05:A3EE: 51        .byte $51   ; 
- D 1 - I - 0x0163FF 05:A3EF: 5C        .byte $5C   ; 
- D 1 - I - 0x016400 05:A3F0: 5D        .byte $5D   ; 
- D 1 - I - 0x016401 05:A3F1: 5E        .byte $5E   ; 
- D 1 - I - 0x016402 05:A3F2: 5F        .byte $5F   ; 
- D 1 - I - 0x016403 05:A3F3: 63        .byte $63   ; 
- D 1 - I - 0x016404 05:A3F4: 64        .byte $64   ; 
- D 1 - I - 0x016405 05:A3F5: 65        .byte $65   ; 
- D 1 - I - 0x016406 05:A3F6: 7A        .byte $7A   ; 
- D 1 - I - 0x016407 05:A3F7: 00        .byte $00   ; 
- D 1 - I - 0x016408 05:A3F8: 76        .byte $76   ; 
- D 1 - I - 0x016409 05:A3F9: 00        .byte $00   ; 
- D 1 - I - 0x01640A 05:A3FA: 7C        .byte $7C   ; 
- D 1 - I - 0x01640B 05:A3FB: 76        .byte $76   ; 
- D 1 - I - 0x01640C 05:A3FC: 7A        .byte $7A   ; 
- D 1 - I - 0x01640D 05:A3FD: 76        .byte $76   ; 
- D 1 - I - 0x01640E 05:A3FE: 7D        .byte $7D   ; 
- D 1 - I - 0x01640F 05:A3FF: 7A        .byte $7A   ; 
- D 1 - I - 0x016410 05:A400: 00        .byte $00   ; 
- D 1 - I - 0x016411 05:A401: 7A        .byte $7A   ; 
- D 1 - I - 0x016412 05:A402: 78        .byte $78   ; 
- D 1 - I - 0x016413 05:A403: 76        .byte $76   ; 
- D 1 - I - 0x016414 05:A404: 7A        .byte $7A   ; 
- D 1 - I - 0x016415 05:A405: 00        .byte $00   ; 
- D 1 - I - 0x016416 05:A406: 74        .byte $74   ; 
- D 1 - I - 0x016417 05:A407: 66        .byte $66   ; 
- D 1 - I - 0x016418 05:A408: 67        .byte $67   ; 
- D 1 - I - 0x016419 05:A409: 68        .byte $68   ; 
- D 1 - I - 0x01641A 05:A40A: 69        .byte $69   ; 
- D 1 - I - 0x01641B 05:A40B: 00        .byte $00   ; 
- D 1 - I - 0x01641C 05:A40C: 80        .byte $80   ; 
- D 1 - I - 0x01641D 05:A40D: 81        .byte $81   ; 
- D 1 - I - 0x01641E 05:A40E: 82        .byte $82   ; 
- D 1 - I - 0x01641F 05:A40F: 00        .byte $00   ; 
- D 1 - I - 0x016420 05:A410: 00        .byte $00   ; 
- D 1 - I - 0x016421 05:A411: 00        .byte $00   ; 
- D 1 - I - 0x016422 05:A412: 76        .byte $76   ; 
- D 1 - I - 0x016423 05:A413: 00        .byte $00   ; 
- D 1 - I - 0x016424 05:A414: 00        .byte $00   ; 
- D 1 - I - 0x016425 05:A415: 00        .byte $00   ; 
- D 1 - I - 0x016426 05:A416: 00        .byte $00   ; 
- D 1 - I - 0x016427 05:A417: 6A        .byte $6A   ; 
- D 1 - I - 0x016428 05:A418: 6A        .byte $6A   ; 
- D 1 - I - 0x016429 05:A419: 6A        .byte $6A   ; 
- D 1 - I - 0x01642A 05:A41A: 6A        .byte $6A   ; 
- D 1 - I - 0x01642B 05:A41B: 83        .byte $83   ; 
- D 1 - I - 0x01642C 05:A41C: 84        .byte $84   ; 
- D 1 - I - 0x01642D 05:A41D: 84        .byte $84   ; 
- D 1 - I - 0x01642E 05:A41E: 85        .byte $85   ; 
- D 1 - I - 0x01642F 05:A41F: 7B        .byte $7B   ; 
- D 1 - I - 0x016430 05:A420: 76        .byte $76   ; 
- D 1 - I - 0x016431 05:A421: 00        .byte $00   ; 
- D 1 - I - 0x016432 05:A422: 7A        .byte $7A   ; 
- D 1 - I - 0x016433 05:A423: 75        .byte $75   ; 
- D 1 - I - 0x016434 05:A424: 00        .byte $00   ; 
- D 1 - I - 0x016435 05:A425: 7B        .byte $7B   ; 
- D 1 - I - 0x016436 05:A426: 00        .byte $00   ; 
- D 1 - I - 0x016437 05:A427: 6A        .byte $6A   ; 
- D 1 - I - 0x016438 05:A428: 6A        .byte $6A   ; 
- D 1 - I - 0x016439 05:A429: 6A        .byte $6A   ; 
- D 1 - I - 0x01643A 05:A42A: 6B        .byte $6B   ; 
- D 1 - I - 0x01643B 05:A42B: 85        .byte $85   ; 
- D 1 - I - 0x01643C 05:A42C: 86        .byte $86   ; 
- D 1 - I - 0x01643D 05:A42D: 86        .byte $86   ; 
- D 1 - I - 0x01643E 05:A42E: 87        .byte $87   ; 
- D 1 - I - 0x01643F 05:A42F: 76        .byte $76   ; 
- D 1 - I - 0x016440 05:A430: 7A        .byte $7A   ; 
- D 1 - I - 0x016441 05:A431: 00        .byte $00   ; 
- D 1 - I - 0x016442 05:A432: 7A        .byte $7A   ; 
- D 1 - I - 0x016443 05:A433: 00        .byte $00   ; 
- D 1 - I - 0x016444 05:A434: 76        .byte $76   ; 
- D 1 - I - 0x016445 05:A435: 7A        .byte $7A   ; 
- D 1 - I - 0x016446 05:A436: 76        .byte $76   ; 
- D 1 - I - 0x016447 05:A437: 6C        .byte $6C   ; 
- D 1 - I - 0x016448 05:A438: 6D        .byte $6D   ; 
- D 1 - I - 0x016449 05:A439: 6E        .byte $6E   ; 
- D 1 - I - 0x01644A 05:A43A: 6F        .byte $6F   ; 
- D 1 - I - 0x01644B 05:A43B: 88        .byte $88   ; 
- D 1 - I - 0x01644C 05:A43C: 89        .byte $89   ; 
- D 1 - I - 0x01644D 05:A43D: 8A        .byte $8A   ; 
- D 1 - I - 0x01644E 05:A43E: 8B        .byte $8B   ; 
- D 1 - I - 0x01644F 05:A43F: 93        .byte $93   ; 
- D 1 - I - 0x016450 05:A440: 94        .byte $94   ; 
- D 1 - I - 0x016451 05:A441: 95        .byte $95   ; 
- D 1 - I - 0x016452 05:A442: 96        .byte $96   ; 
- D 1 - I - 0x016453 05:A443: 9B        .byte $9B   ; 
- D 1 - I - 0x016454 05:A444: 9C        .byte $9C   ; 
- D 1 - I - 0x016455 05:A445: 9D        .byte $9D   ; 
- D 1 - I - 0x016456 05:A446: 9E        .byte $9E   ; 
- D 1 - I - 0x016457 05:A447: 70        .byte $70   ; 
- D 1 - I - 0x016458 05:A448: 71        .byte $71   ; 
- D 1 - I - 0x016459 05:A449: 72        .byte $72   ; 
- D 1 - I - 0x01645A 05:A44A: 6C        .byte $6C   ; 
- D 1 - I - 0x01645B 05:A44B: 8C        .byte $8C   ; 
- D 1 - I - 0x01645C 05:A44C: 8D        .byte $8D   ; 
- D 1 - I - 0x01645D 05:A44D: 8E        .byte $8E   ; 
- D 1 - I - 0x01645E 05:A44E: 88        .byte $88   ; 
- D 1 - I - 0x01645F 05:A44F: 97        .byte $97   ; 
- D 1 - I - 0x016460 05:A450: 98        .byte $98   ; 
- D 1 - I - 0x016461 05:A451: 99        .byte $99   ; 
- D 1 - I - 0x016462 05:A452: 9A        .byte $9A   ; 
- D 1 - I - 0x016463 05:A453: 9F        .byte $9F   ; 
- D 1 - I - 0x016464 05:A454: A0        .byte $A0   ; 
- D 1 - I - 0x016465 05:A455: A1        .byte $A1   ; 
- D 1 - I - 0x016466 05:A456: A2        .byte $A2   ; 
- D 1 - I - 0x016467 05:A457: 73        .byte $73   ; 
- D 1 - I - 0x016468 05:A458: 6A        .byte $6A   ; 
- D 1 - I - 0x016469 05:A459: 6A        .byte $6A   ; 
- D 1 - I - 0x01646A 05:A45A: 6A        .byte $6A   ; 
- D 1 - I - 0x01646B 05:A45B: 8F        .byte $8F   ; 
- D 1 - I - 0x01646C 05:A45C: 86        .byte $86   ; 
- D 1 - I - 0x01646D 05:A45D: 86        .byte $86   ; 
- D 1 - I - 0x01646E 05:A45E: 85        .byte $85   ; 
- D 1 - I - 0x01646F 05:A45F: 00        .byte $00   ; 
- D 1 - I - 0x016470 05:A460: 76        .byte $76   ; 
- D 1 - I - 0x016471 05:A461: 00        .byte $00   ; 
- D 1 - I - 0x016472 05:A462: 00        .byte $00   ; 
- D 1 - I - 0x016473 05:A463: 00        .byte $00   ; 
- D 1 - I - 0x016474 05:A464: 7A        .byte $7A   ; 
- D 1 - I - 0x016475 05:A465: 76        .byte $76   ; 
- D 1 - I - 0x016476 05:A466: 00        .byte $00   ; 
- D 1 - I - 0x016477 05:A467: 6A        .byte $6A   ; 
- D 1 - I - 0x016478 05:A468: 6A        .byte $6A   ; 
- D 1 - I - 0x016479 05:A469: 6A        .byte $6A   ; 
- D 1 - I - 0x01647A 05:A46A: 6A        .byte $6A   ; 
- D 1 - I - 0x01647B 05:A46B: 85        .byte $85   ; 
- D 1 - I - 0x01647C 05:A46C: 84        .byte $84   ; 
- D 1 - I - 0x01647D 05:A46D: 84        .byte $84   ; 
- D 1 - I - 0x01647E 05:A46E: 83        .byte $83   ; 
- D 1 - I - 0x01647F 05:A46F: 76        .byte $76   ; 
- D 1 - I - 0x016480 05:A470: 7A        .byte $7A   ; 
- D 1 - I - 0x016481 05:A471: 00        .byte $00   ; 
- D 1 - I - 0x016482 05:A472: 79        .byte $79   ; 
- D 1 - I - 0x016483 05:A473: 7A        .byte $7A   ; 
- D 1 - I - 0x016484 05:A474: 76        .byte $76   ; 
- D 1 - I - 0x016485 05:A475: 00        .byte $00   ; 
- D 1 - I - 0x016486 05:A476: 7C        .byte $7C   ; 
- D 1 - I - 0x016487 05:A477: F5        .byte $F5   ; 
- D 1 - I - 0x016488 05:A478: F6        .byte $F6   ; 
- D 1 - I - 0x016489 05:A479: F7        .byte $F7   ; 
- D 1 - I - 0x01648A 05:A47A: F8        .byte $F8   ; 
- D 1 - I - 0x01648B 05:A47B: 90        .byte $90   ; 
- D 1 - I - 0x01648C 05:A47C: 91        .byte $91   ; 
- D 1 - I - 0x01648D 05:A47D: 92        .byte $92   ; 
- D 1 - I - 0x01648E 05:A47E: 00        .byte $00   ; 
- D 1 - I - 0x01648F 05:A47F: 7A        .byte $7A   ; 
- D 1 - I - 0x016490 05:A480: 00        .byte $00   ; 
- D 1 - I - 0x016491 05:A481: 00        .byte $00   ; 
- D 1 - I - 0x016492 05:A482: 00        .byte $00   ; 
- D 1 - I - 0x016493 05:A483: 00        .byte $00   ; 
- D 1 - I - 0x016494 05:A484: 00        .byte $00   ; 
- D 1 - I - 0x016495 05:A485: 00        .byte $00   ; 
- D 1 - I - 0x016496 05:A486: 00        .byte $00   ; 
- D 1 - I - 0x016497 05:A487: 77        .byte $77   ; 
- D 1 - I - 0x016498 05:A488: 7A        .byte $7A   ; 
- D 1 - I - 0x016499 05:A489: 76        .byte $76   ; 
- D 1 - I - 0x01649A 05:A48A: 00        .byte $00   ; 
- D 1 - I - 0x01649B 05:A48B: 00        .byte $00   ; 
- D 1 - I - 0x01649C 05:A48C: 76        .byte $76   ; 
- D 1 - I - 0x01649D 05:A48D: 00        .byte $00   ; 
- D 1 - I - 0x01649E 05:A48E: 76        .byte $76   ; 
- D 1 - I - 0x01649F 05:A48F: 00        .byte $00   ; 
- D 1 - I - 0x0164A0 05:A490: 00        .byte $00   ; 
- D 1 - I - 0x0164A1 05:A491: 75        .byte $75   ; 
- D 1 - I - 0x0164A2 05:A492: 7A        .byte $7A   ; 
- D 1 - I - 0x0164A3 05:A493: 00        .byte $00   ; 
- D 1 - I - 0x0164A4 05:A494: 00        .byte $00   ; 
- D 1 - I - 0x0164A5 05:A495: 77        .byte $77   ; 
- D 1 - I - 0x0164A6 05:A496: 76        .byte $76   ; 
- D 1 - I - 0x0164A7 05:A497: 00        .byte $00   ; 
- D 1 - I - 0x0164A8 05:A498: 7A        .byte $7A   ; 
- D 1 - I - 0x0164A9 05:A499: 00        .byte $00   ; 
- D 1 - I - 0x0164AA 05:A49A: A3        .byte $A3   ; 
- D 1 - I - 0x0164AB 05:A49B: 7A        .byte $7A   ; 
- D 1 - I - 0x0164AC 05:A49C: 76        .byte $76   ; 
- D 1 - I - 0x0164AD 05:A49D: AD        .byte $AD   ; 
- D 1 - I - 0x0164AE 05:A49E: AE        .byte $AE   ; 
- D 1 - I - 0x0164AF 05:A49F: 00        .byte $00   ; 
- D 1 - I - 0x0164B0 05:A4A0: 00        .byte $00   ; 
- D 1 - I - 0x0164B1 05:A4A1: B9        .byte $B9   ; 
- D 1 - I - 0x0164B2 05:A4A2: BA        .byte $BA   ; 
- D 1 - I - 0x0164B3 05:A4A3: 00        .byte $00   ; 
- D 1 - I - 0x0164B4 05:A4A4: 7A        .byte $7A   ; 
- D 1 - I - 0x0164B5 05:A4A5: C5        .byte $C5   ; 
- D 1 - I - 0x0164B6 05:A4A6: C6        .byte $C6   ; 
- D 1 - I - 0x0164B7 05:A4A7: A4        .byte $A4   ; 
- D 1 - I - 0x0164B8 05:A4A8: A5        .byte $A5   ; 
- D 1 - I - 0x0164B9 05:A4A9: A6        .byte $A6   ; 
- D 1 - I - 0x0164BA 05:A4AA: A7        .byte $A7   ; 
- D 1 - I - 0x0164BB 05:A4AB: AF        .byte $AF   ; 
- D 1 - I - 0x0164BC 05:A4AC: B0        .byte $B0   ; 
- D 1 - I - 0x0164BD 05:A4AD: B1        .byte $B1   ; 
- D 1 - I - 0x0164BE 05:A4AE: B2        .byte $B2   ; 
- D 1 - I - 0x0164BF 05:A4AF: BB        .byte $BB   ; 
- D 1 - I - 0x0164C0 05:A4B0: BC        .byte $BC   ; 
- D 1 - I - 0x0164C1 05:A4B1: BD        .byte $BD   ; 
- D 1 - I - 0x0164C2 05:A4B2: BE        .byte $BE   ; 
- D 1 - I - 0x0164C3 05:A4B3: C7        .byte $C7   ; 
- D 1 - I - 0x0164C4 05:A4B4: C8        .byte $C8   ; 
- D 1 - I - 0x0164C5 05:A4B5: C9        .byte $C9   ; 
- D 1 - I - 0x0164C6 05:A4B6: CA        .byte $CA   ; 
- D 1 - I - 0x0164C7 05:A4B7: A8        .byte $A8   ; 
- D 1 - I - 0x0164C8 05:A4B8: A9        .byte $A9   ; 
- D 1 - I - 0x0164C9 05:A4B9: AA        .byte $AA   ; 
- D 1 - I - 0x0164CA 05:A4BA: AB        .byte $AB   ; 
- D 1 - I - 0x0164CB 05:A4BB: B3        .byte $B3   ; 
- D 1 - I - 0x0164CC 05:A4BC: B4        .byte $B4   ; 
- D 1 - I - 0x0164CD 05:A4BD: B5        .byte $B5   ; 
- D 1 - I - 0x0164CE 05:A4BE: B6        .byte $B6   ; 
- D 1 - I - 0x0164CF 05:A4BF: BF        .byte $BF   ; 
- D 1 - I - 0x0164D0 05:A4C0: C0        .byte $C0   ; 
- D 1 - I - 0x0164D1 05:A4C1: C1        .byte $C1   ; 
- D 1 - I - 0x0164D2 05:A4C2: C2        .byte $C2   ; 
- D 1 - I - 0x0164D3 05:A4C3: CB        .byte $CB   ; 
- D 1 - I - 0x0164D4 05:A4C4: CC        .byte $CC   ; 
- D 1 - I - 0x0164D5 05:A4C5: CD        .byte $CD   ; 
- D 1 - I - 0x0164D6 05:A4C6: CE        .byte $CE   ; 
- D 1 - I - 0x0164D7 05:A4C7: AC        .byte $AC   ; 
- D 1 - I - 0x0164D8 05:A4C8: 00        .byte $00   ; 
- D 1 - I - 0x0164D9 05:A4C9: 00        .byte $00   ; 
- D 1 - I - 0x0164DA 05:A4CA: 7B        .byte $7B   ; 
- D 1 - I - 0x0164DB 05:A4CB: B7        .byte $B7   ; 
- D 1 - I - 0x0164DC 05:A4CC: B8        .byte $B8   ; 
- D 1 - I - 0x0164DD 05:A4CD: 7A        .byte $7A   ; 
- D 1 - I - 0x0164DE 05:A4CE: 76        .byte $76   ; 
- D 1 - I - 0x0164DF 05:A4CF: C3        .byte $C3   ; 
- D 1 - I - 0x0164E0 05:A4D0: C4        .byte $C4   ; 
- D 1 - I - 0x0164E1 05:A4D1: 00        .byte $00   ; 
- D 1 - I - 0x0164E2 05:A4D2: 7A        .byte $7A   ; 
- D 1 - I - 0x0164E3 05:A4D3: CF        .byte $CF   ; 
- D 1 - I - 0x0164E4 05:A4D4: D0        .byte $D0   ; 
- D 1 - I - 0x0164E5 05:A4D5: 7A        .byte $7A   ; 
- D 1 - I - 0x0164E6 05:A4D6: 76        .byte $76   ; 
- D 1 - I - 0x0164E7 05:A4D7: 00        .byte $00   ; 
- D 1 - I - 0x0164E8 05:A4D8: 00        .byte $00   ; 
- D 1 - I - 0x0164E9 05:A4D9: 76        .byte $76   ; 
- D 1 - I - 0x0164EA 05:A4DA: 7D        .byte $7D   ; 
- D 1 - I - 0x0164EB 05:A4DB: 00        .byte $00   ; 
- D 1 - I - 0x0164EC 05:A4DC: 00        .byte $00   ; 
- D 1 - I - 0x0164ED 05:A4DD: 7A        .byte $7A   ; 
- D 1 - I - 0x0164EE 05:A4DE: 00        .byte $00   ; 
- D 1 - I - 0x0164EF 05:A4DF: 76        .byte $76   ; 
- D 1 - I - 0x0164F0 05:A4E0: 7C        .byte $7C   ; 
- D 1 - I - 0x0164F1 05:A4E1: 00        .byte $00   ; 
- D 1 - I - 0x0164F2 05:A4E2: 00        .byte $00   ; 
- D 1 - I - 0x0164F3 05:A4E3: 00        .byte $00   ; 
- D 1 - I - 0x0164F4 05:A4E4: 7D        .byte $7D   ; 
- D 1 - I - 0x0164F5 05:A4E5: 00        .byte $00   ; 
- D 1 - I - 0x0164F6 05:A4E6: 00        .byte $00   ; 
- D 1 - I - 0x0164F7 05:A4E7: 00        .byte $00   ; 
- D 1 - I - 0x0164F8 05:A4E8: 00        .byte $00   ; 
- D 1 - I - 0x0164F9 05:A4E9: 00        .byte $00   ; 
- D 1 - I - 0x0164FA 05:A4EA: F3        .byte $F3   ; 
- D 1 - I - 0x0164FB 05:A4EB: 00        .byte $00   ; 
- D 1 - I - 0x0164FC 05:A4EC: 00        .byte $00   ; 
- D 1 - I - 0x0164FD 05:A4ED: 7E        .byte $7E   ; 
- D 1 - I - 0x0164FE 05:A4EE: 7A        .byte $7A   ; 
- D 1 - I - 0x0164FF 05:A4EF: 00        .byte $00   ; 
- D 1 - I - 0x016500 05:A4F0: 00        .byte $00   ; 
- D 1 - I - 0x016501 05:A4F1: 7F        .byte $7F   ; 
- D 1 - I - 0x016502 05:A4F2: 76        .byte $76   ; 
- D 1 - I - 0x016503 05:A4F3: 00        .byte $00   ; 
- D 1 - I - 0x016504 05:A4F4: 7A        .byte $7A   ; 
- D 1 - I - 0x016505 05:A4F5: 76        .byte $76   ; 
- D 1 - I - 0x016506 05:A4F6: 00        .byte $00   ; 
- D 1 - I - 0x016507 05:A4F7: 7B        .byte $7B   ; 
- D 1 - I - 0x016508 05:A4F8: D1        .byte $D1   ; 
- D 1 - I - 0x016509 05:A4F9: D2        .byte $D2   ; 
- D 1 - I - 0x01650A 05:A4FA: D3        .byte $D3   ; 
- D 1 - I - 0x01650B 05:A4FB: 00        .byte $00   ; 
- D 1 - I - 0x01650C 05:A4FC: DE        .byte $DE   ; 
- D 1 - I - 0x01650D 05:A4FD: DF        .byte $DF   ; 
- D 1 - I - 0x01650E 05:A4FE: E0        .byte $E0   ; 
- D 1 - I - 0x01650F 05:A4FF: E4        .byte $E4   ; 
- D 1 - I - 0x016510 05:A500: E5        .byte $E5   ; 
- D 1 - I - 0x016511 05:A501: F9        .byte $F9   ; 
- D 1 - I - 0x016512 05:A502: 00        .byte $00   ; 
- D 1 - I - 0x016513 05:A503: E7        .byte $E7   ; 
- D 1 - I - 0x016514 05:A504: EF        .byte $EF   ; 
- D 1 - I - 0x016515 05:A505: E5        .byte $E5   ; 
- D 1 - I - 0x016516 05:A506: E6        .byte $E6   ; 
- D 1 - I - 0x016517 05:A507: D4        .byte $D4   ; 
- D 1 - I - 0x016518 05:A508: D5        .byte $D5   ; 
- D 1 - I - 0x016519 05:A509: D6        .byte $D6   ; 
- D 1 - I - 0x01651A 05:A50A: D7        .byte $D7   ; 
- D 1 - I - 0x01651B 05:A50B: D4        .byte $D4   ; 
- D 1 - I - 0x01651C 05:A50C: D5        .byte $D5   ; 
- D 1 - I - 0x01651D 05:A50D: D6        .byte $D6   ; 
- D 1 - I - 0x01651E 05:A50E: D7        .byte $D7   ; 
- D 1 - I - 0x01651F 05:A50F: D4        .byte $D4   ; 
- D 1 - I - 0x016520 05:A510: D5        .byte $D5   ; 
- D 1 - I - 0x016521 05:A511: D6        .byte $D6   ; 
- D 1 - I - 0x016522 05:A512: D7        .byte $D7   ; 
- D 1 - I - 0x016523 05:A513: D4        .byte $D4   ; 
- D 1 - I - 0x016524 05:A514: D5        .byte $D5   ; 
- D 1 - I - 0x016525 05:A515: D6        .byte $D6   ; 
- D 1 - I - 0x016526 05:A516: D7        .byte $D7   ; 
- D 1 - I - 0x016527 05:A517: D8        .byte $D8   ; 
- D 1 - I - 0x016528 05:A518: D6        .byte $D6   ; 
- D 1 - I - 0x016529 05:A519: D9        .byte $D9   ; 
- D 1 - I - 0x01652A 05:A51A: DA        .byte $DA   ; 
- D 1 - I - 0x01652B 05:A51B: D8        .byte $D8   ; 
- D 1 - I - 0x01652C 05:A51C: D6        .byte $D6   ; 
- D 1 - I - 0x01652D 05:A51D: D9        .byte $D9   ; 
- D 1 - I - 0x01652E 05:A51E: DA        .byte $DA   ; 
- D 1 - I - 0x01652F 05:A51F: D8        .byte $D8   ; 
- D 1 - I - 0x016530 05:A520: D6        .byte $D6   ; 
- D 1 - I - 0x016531 05:A521: D9        .byte $D9   ; 
- D 1 - I - 0x016532 05:A522: DA        .byte $DA   ; 
- D 1 - I - 0x016533 05:A523: D8        .byte $D8   ; 
- D 1 - I - 0x016534 05:A524: D6        .byte $D6   ; 
- D 1 - I - 0x016535 05:A525: D9        .byte $D9   ; 
- D 1 - I - 0x016536 05:A526: DA        .byte $DA   ; 
- D 1 - I - 0x016537 05:A527: DB        .byte $DB   ; 
- D 1 - I - 0x016538 05:A528: DC        .byte $DC   ; 
- D 1 - I - 0x016539 05:A529: DD        .byte $DD   ; 
- D 1 - I - 0x01653A 05:A52A: 7A        .byte $7A   ; 
- D 1 - I - 0x01653B 05:A52B: E1        .byte $E1   ; 
- D 1 - I - 0x01653C 05:A52C: E2        .byte $E2   ; 
- D 1 - I - 0x01653D 05:A52D: E3        .byte $E3   ; 
- D 1 - I - 0x01653E 05:A52E: 00        .byte $00   ; 
- D 1 - I - 0x01653F 05:A52F: E4        .byte $E4   ; 
- D 1 - I - 0x016540 05:A530: E5        .byte $E5   ; 
- D 1 - I - 0x016541 05:A531: FA        .byte $FA   ; 
- D 1 - I - 0x016542 05:A532: 00        .byte $00   ; 
- D 1 - I - 0x016543 05:A533: E7        .byte $E7   ; 
- D 1 - I - 0x016544 05:A534: EF        .byte $EF   ; 
- D 1 - I - 0x016545 05:A535: E5        .byte $E5   ; 
- D 1 - I - 0x016546 05:A536: E6        .byte $E6   ; 
- D 1 - I - 0x016547 05:A537: FC        .byte $FC   ; 
- D 1 - I - 0x016548 05:A538: 00        .byte $00   ; 
- D 1 - I - 0x016549 05:A539: 00        .byte $00   ; 
- D 1 - I - 0x01654A 05:A53A: 00        .byte $00   ; 
- D 1 - I - 0x01654B 05:A53B: 00        .byte $00   ; 
- D 1 - I - 0x01654C 05:A53C: 78        .byte $78   ; 
- D 1 - I - 0x01654D 05:A53D: 00        .byte $00   ; 
- D 1 - I - 0x01654E 05:A53E: 00        .byte $00   ; 
- D 1 - I - 0x01654F 05:A53F: 00        .byte $00   ; 
- D 1 - I - 0x016550 05:A540: 74        .byte $74   ; 
- D 1 - I - 0x016551 05:A541: 00        .byte $00   ; 
- D 1 - I - 0x016552 05:A542: 00        .byte $00   ; 
- D 1 - I - 0x016553 05:A543: 00        .byte $00   ; 
- D 1 - I - 0x016554 05:A544: 7A        .byte $7A   ; 
- D 1 - I - 0x016555 05:A545: 76        .byte $76   ; 
- D 1 - I - 0x016556 05:A546: 00        .byte $00   ; 
- D 1 - I - 0x016557 05:A547: 00        .byte $00   ; 
- D 1 - I - 0x016558 05:A548: 00        .byte $00   ; 
- D 1 - I - 0x016559 05:A549: 00        .byte $00   ; 
- D 1 - I - 0x01655A 05:A54A: 00        .byte $00   ; 
- D 1 - I - 0x01655B 05:A54B: 00        .byte $00   ; 
- D 1 - I - 0x01655C 05:A54C: 00        .byte $00   ; 
- D 1 - I - 0x01655D 05:A54D: 00        .byte $00   ; 
- D 1 - I - 0x01655E 05:A54E: 7A        .byte $7A   ; 
- D 1 - I - 0x01655F 05:A54F: 00        .byte $00   ; 
- D 1 - I - 0x016560 05:A550: 00        .byte $00   ; 
- D 1 - I - 0x016561 05:A551: E4        .byte $E4   ; 
- D 1 - I - 0x016562 05:A552: E5        .byte $E5   ; 
- D 1 - I - 0x016563 05:A553: E4        .byte $E4   ; 
- D 1 - I - 0x016564 05:A554: E5        .byte $E5   ; 
- D 1 - I - 0x016565 05:A555: ED        .byte $ED   ; 
- D 1 - I - 0x016566 05:A556: E8        .byte $E8   ; 
- D 1 - I - 0x016567 05:A557: 7A        .byte $7A   ; 
- D 1 - I - 0x016568 05:A558: 00        .byte $00   ; 
- D 1 - I - 0x016569 05:A559: E4        .byte $E4   ; 
- D 1 - I - 0x01656A 05:A55A: E5        .byte $E5   ; 
- D 1 - I - 0x01656B 05:A55B: 76        .byte $76   ; 
- D 1 - I - 0x01656C 05:A55C: 00        .byte $00   ; 
- D 1 - I - 0x01656D 05:A55D: E7        .byte $E7   ; 
- D 1 - I - 0x01656E 05:A55E: E8        .byte $E8   ; 
- D 1 - I - 0x01656F 05:A55F: E6        .byte $E6   ; 
- D 1 - I - 0x016570 05:A560: E4        .byte $E4   ; 
- D 1 - I - 0x016571 05:A561: E5        .byte $E5   ; 
- D 1 - I - 0x016572 05:A562: EE        .byte $EE   ; 
- D 1 - I - 0x016573 05:A563: E9        .byte $E9   ; 
- D 1 - I - 0x016574 05:A564: E7        .byte $E7   ; 
- D 1 - I - 0x016575 05:A565: E8        .byte $E8   ; 
- D 1 - I - 0x016576 05:A566: EF        .byte $EF   ; 
- D 1 - I - 0x016577 05:A567: EE        .byte $EE   ; 
- D 1 - I - 0x016578 05:A568: E7        .byte $E7   ; 
- D 1 - I - 0x016579 05:A569: E8        .byte $E8   ; 
- D 1 - I - 0x01657A 05:A56A: EF        .byte $EF   ; 
- D 1 - I - 0x01657B 05:A56B: F0        .byte $F0   ; 
- D 1 - I - 0x01657C 05:A56C: E5        .byte $E5   ; 
- D 1 - I - 0x01657D 05:A56D: EE        .byte $EE   ; 
- D 1 - I - 0x01657E 05:A56E: E7        .byte $E7   ; 
- D 1 - I - 0x01657F 05:A56F: E7        .byte $E7   ; 
- D 1 - I - 0x016580 05:A570: E8        .byte $E8   ; 
- D 1 - I - 0x016581 05:A571: EF        .byte $EF   ; 
- D 1 - I - 0x016582 05:A572: E5        .byte $E5   ; 
- D 1 - I - 0x016583 05:A573: E5        .byte $E5   ; 
- D 1 - I - 0x016584 05:A574: EE        .byte $EE   ; 
- D 1 - I - 0x016585 05:A575: E7        .byte $E7   ; 
- D 1 - I - 0x016586 05:A576: E8        .byte $E8   ; 
- D 1 - I - 0x016587 05:A577: E5        .byte $E5   ; 
- D 1 - I - 0x016588 05:A578: E6        .byte $E6   ; 
- D 1 - I - 0x016589 05:A579: D6        .byte $D6   ; 
- D 1 - I - 0x01658A 05:A57A: D7        .byte $D7   ; 
- D 1 - I - 0x01658B 05:A57B: E8        .byte $E8   ; 
- D 1 - I - 0x01658C 05:A57C: E9        .byte $E9   ; 
- D 1 - I - 0x01658D 05:A57D: D6        .byte $D6   ; 
- D 1 - I - 0x01658E 05:A57E: D7        .byte $D7   ; 
- D 1 - I - 0x01658F 05:A57F: EE        .byte $EE   ; 
- D 1 - I - 0x016590 05:A580: EC        .byte $EC   ; 
- D 1 - I - 0x016591 05:A581: E4        .byte $E4   ; 
- D 1 - I - 0x016592 05:A582: E5        .byte $E5   ; 
- D 1 - I - 0x016593 05:A583: EF        .byte $EF   ; 
- D 1 - I - 0x016594 05:A584: E5        .byte $E5   ; 
- D 1 - I - 0x016595 05:A585: ED        .byte $ED   ; 
- D 1 - I - 0x016596 05:A586: E8        .byte $E8   ; 
- D 1 - I - 0x016597 05:A587: D8        .byte $D8   ; 
- D 1 - I - 0x016598 05:A588: D6        .byte $D6   ; 
- D 1 - I - 0x016599 05:A589: E4        .byte $E4   ; 
- D 1 - I - 0x01659A 05:A58A: E5        .byte $E5   ; 
- D 1 - I - 0x01659B 05:A58B: D8        .byte $D8   ; 
- D 1 - I - 0x01659C 05:A58C: D6        .byte $D6   ; 
- D 1 - I - 0x01659D 05:A58D: E7        .byte $E7   ; 
- D 1 - I - 0x01659E 05:A58E: E8        .byte $E8   ; 
- D 1 - I - 0x01659F 05:A58F: E6        .byte $E6   ; 
- D 1 - I - 0x0165A0 05:A590: E4        .byte $E4   ; 
- D 1 - I - 0x0165A1 05:A591: E5        .byte $E5   ; 
- D 1 - I - 0x0165A2 05:A592: EE        .byte $EE   ; 
- D 1 - I - 0x0165A3 05:A593: EF        .byte $EF   ; 
- D 1 - I - 0x0165A4 05:A594: E5        .byte $E5   ; 
- D 1 - I - 0x0165A5 05:A595: EE        .byte $EE   ; 
- D 1 - I - 0x0165A6 05:A596: E9        .byte $E9   ; 
- D 1 - I - 0x0165A7 05:A597: EE        .byte $EE   ; 
- D 1 - I - 0x0165A8 05:A598: E7        .byte $E7   ; 
- D 1 - I - 0x0165A9 05:A599: E8        .byte $E8   ; 
- D 1 - I - 0x0165AA 05:A59A: F0        .byte $F0   ; 
- D 1 - I - 0x0165AB 05:A59B: E9        .byte $E9   ; 
- D 1 - I - 0x0165AC 05:A59C: EA        .byte $EA   ; 
- D 1 - I - 0x0165AD 05:A59D: EF        .byte $EF   ; 
- D 1 - I - 0x0165AE 05:A59E: E5        .byte $E5   ; 
- D 1 - I - 0x0165AF 05:A59F: EF        .byte $EF   ; 
- D 1 - I - 0x0165B0 05:A5A0: E5        .byte $E5   ; 
- D 1 - I - 0x0165B1 05:A5A1: ED        .byte $ED   ; 
- D 1 - I - 0x0165B2 05:A5A2: E8        .byte $E8   ; 
- D 1 - I - 0x0165B3 05:A5A3: E7        .byte $E7   ; 
- D 1 - I - 0x0165B4 05:A5A4: E8        .byte $E8   ; 
- D 1 - I - 0x0165B5 05:A5A5: EF        .byte $EF   ; 
- D 1 - I - 0x0165B6 05:A5A6: E5        .byte $E5   ; 
- D 1 - I - 0x0165B7 05:A5A7: E5        .byte $E5   ; 
- D 1 - I - 0x0165B8 05:A5A8: E6        .byte $E6   ; 
- D 1 - I - 0x0165B9 05:A5A9: 7C        .byte $7C   ; 
- D 1 - I - 0x0165BA 05:A5AA: 76        .byte $76   ; 
- D 1 - I - 0x0165BB 05:A5AB: EE        .byte $EE   ; 
- D 1 - I - 0x0165BC 05:A5AC: E9        .byte $E9   ; 
- D 1 - I - 0x0165BD 05:A5AD: 00        .byte $00   ; 
- D 1 - I - 0x0165BE 05:A5AE: 00        .byte $00   ; 
- D 1 - I - 0x0165BF 05:A5AF: F0        .byte $F0   ; 
- D 1 - I - 0x0165C0 05:A5B0: E5        .byte $E5   ; 
- D 1 - I - 0x0165C1 05:A5B1: E6        .byte $E6   ; 
- D 1 - I - 0x0165C2 05:A5B2: E4        .byte $E4   ; 
- D 1 - I - 0x0165C3 05:A5B3: ED        .byte $ED   ; 
- D 1 - I - 0x0165C4 05:A5B4: EF        .byte $EF   ; 
- D 1 - I - 0x0165C5 05:A5B5: E5        .byte $E5   ; 
- D 1 - I - 0x0165C6 05:A5B6: ED        .byte $ED   ; 
- D 1 - I - 0x0165C7 05:A5B7: 00        .byte $00   ; 
- D 1 - I - 0x0165C8 05:A5B8: 00        .byte $00   ; 
- D 1 - I - 0x0165C9 05:A5B9: 00        .byte $00   ; 
- D 1 - I - 0x0165CA 05:A5BA: 00        .byte $00   ; 
- D 1 - I - 0x0165CB 05:A5BB: 79        .byte $79   ; 
- D 1 - I - 0x0165CC 05:A5BC: 00        .byte $00   ; 
- D 1 - I - 0x0165CD 05:A5BD: 00        .byte $00   ; 
- D 1 - I - 0x0165CE 05:A5BE: 00        .byte $00   ; 
- D 1 - I - 0x0165CF 05:A5BF: E5        .byte $E5   ; 
- D 1 - I - 0x0165D0 05:A5C0: E6        .byte $E6   ; 
- D 1 - I - 0x0165D1 05:A5C1: 00        .byte $00   ; 
- D 1 - I - 0x0165D2 05:A5C2: 00        .byte $00   ; 
- D 1 - I - 0x0165D3 05:A5C3: E8        .byte $E8   ; 
- D 1 - I - 0x0165D4 05:A5C4: EF        .byte $EF   ; 
- D 1 - I - 0x0165D5 05:A5C5: E5        .byte $E5   ; 
- D 1 - I - 0x0165D6 05:A5C6: E6        .byte $E6   ; 
- D 1 - I - 0x0165D7 05:A5C7: E7        .byte $E7   ; 
- D 1 - I - 0x0165D8 05:A5C8: E8        .byte $E8   ; 
- D 1 - I - 0x0165D9 05:A5C9: E9        .byte $E9   ; 
- D 1 - I - 0x0165DA 05:A5CA: EB        .byte $EB   ; 
- D 1 - I - 0x0165DB 05:A5CB: EA        .byte $EA   ; 
- D 1 - I - 0x0165DC 05:A5CC: EB        .byte $EB   ; 
- D 1 - I - 0x0165DD 05:A5CD: F0        .byte $F0   ; 
- D 1 - I - 0x0165DE 05:A5CE: E5        .byte $E5   ; 
- D 1 - I - 0x0165DF 05:A5CF: FD        .byte $FD   ; 
- D 1 - I - 0x0165E0 05:A5D0: FD        .byte $FD   ; 
- D 1 - I - 0x0165E1 05:A5D1: FD        .byte $FD   ; 
- D 1 - I - 0x0165E2 05:A5D2: FD        .byte $FD   ; 
- D 1 - I - 0x0165E3 05:A5D3: F1        .byte $F1   ; 
- D 1 - I - 0x0165E4 05:A5D4: F2        .byte $F2   ; 
- D 1 - I - 0x0165E5 05:A5D5: F1        .byte $F1   ; 
- D 1 - I - 0x0165E6 05:A5D6: F2        .byte $F2   ; 
- D 1 - I - 0x0165E7 05:A5D7: F0        .byte $F0   ; 
- D 1 - I - 0x0165E8 05:A5D8: E5        .byte $E5   ; 
- D 1 - I - 0x0165E9 05:A5D9: EE        .byte $EE   ; 
- D 1 - I - 0x0165EA 05:A5DA: E7        .byte $E7   ; 
- D 1 - I - 0x0165EB 05:A5DB: ED        .byte $ED   ; 
- D 1 - I - 0x0165EC 05:A5DC: E8        .byte $E8   ; 
- D 1 - I - 0x0165ED 05:A5DD: E9        .byte $E9   ; 
- D 1 - I - 0x0165EE 05:A5DE: EA        .byte $EA   ; 
- D 1 - I - 0x0165EF 05:A5DF: FD        .byte $FD   ; 
- D 1 - I - 0x0165F0 05:A5E0: FD        .byte $FD   ; 
- D 1 - I - 0x0165F1 05:A5E1: FD        .byte $FD   ; 
- D 1 - I - 0x0165F2 05:A5E2: FD        .byte $FD   ; 
- D 1 - I - 0x0165F3 05:A5E3: F1        .byte $F1   ; 
- D 1 - I - 0x0165F4 05:A5E4: F2        .byte $F2   ; 
- D 1 - I - 0x0165F5 05:A5E5: F1        .byte $F1   ; 
- D 1 - I - 0x0165F6 05:A5E6: F2        .byte $F2   ; 
- D 1 - I - 0x0165F7 05:A5E7: E8        .byte $E8   ; 
- D 1 - I - 0x0165F8 05:A5E8: EF        .byte $EF   ; 
- D 1 - I - 0x0165F9 05:A5E9: E5        .byte $E5   ; 
- D 1 - I - 0x0165FA 05:A5EA: EE        .byte $EE   ; 
- D 1 - I - 0x0165FB 05:A5EB: EB        .byte $EB   ; 
- D 1 - I - 0x0165FC 05:A5EC: E7        .byte $E7   ; 
- D 1 - I - 0x0165FD 05:A5ED: E8        .byte $E8   ; 
- D 1 - I - 0x0165FE 05:A5EE: E9        .byte $E9   ; 
- D 1 - I - 0x0165FF 05:A5EF: FD        .byte $FD   ; 
- D 1 - I - 0x016600 05:A5F0: FD        .byte $FD   ; 
- D 1 - I - 0x016601 05:A5F1: FD        .byte $FD   ; 
- D 1 - I - 0x016602 05:A5F2: FD        .byte $FD   ; 
- D 1 - I - 0x016603 05:A5F3: F1        .byte $F1   ; 
- D 1 - I - 0x016604 05:A5F4: F2        .byte $F2   ; 
- D 1 - I - 0x016605 05:A5F5: F1        .byte $F1   ; 
- D 1 - I - 0x016606 05:A5F6: F2        .byte $F2   ; 
- D 1 - I - 0x016607 05:A5F7: E7        .byte $E7   ; 
- D 1 - I - 0x016608 05:A5F8: E8        .byte $E8   ; 
- D 1 - I - 0x016609 05:A5F9: E9        .byte $E9   ; 
- D 1 - I - 0x01660A 05:A5FA: EB        .byte $EB   ; 
- D 1 - I - 0x01660B 05:A5FB: EA        .byte $EA   ; 
- D 1 - I - 0x01660C 05:A5FC: EF        .byte $EF   ; 
- D 1 - I - 0x01660D 05:A5FD: E5        .byte $E5   ; 
- D 1 - I - 0x01660E 05:A5FE: E6        .byte $E6   ; 
- D 1 - I - 0x01660F 05:A5FF: FD        .byte $FD   ; 
- D 1 - I - 0x016610 05:A600: FD        .byte $FD   ; 
- D 1 - I - 0x016611 05:A601: FD        .byte $FD   ; 
- D 1 - I - 0x016612 05:A602: FD        .byte $FD   ; 
- D 1 - I - 0x016613 05:A603: F1        .byte $F1   ; 
- D 1 - I - 0x016614 05:A604: F2        .byte $F2   ; 
- D 1 - I - 0x016615 05:A605: F1        .byte $F1   ; 
- D 1 - I - 0x016616 05:A606: F2        .byte $F2   ; 
- D 1 - I - 0x016617 05:A607: E7        .byte $E7   ; 
- D 1 - I - 0x016618 05:A608: E8        .byte $E8   ; 
- D 1 - I - 0x016619 05:A609: EF        .byte $EF   ; 
- D 1 - I - 0x01661A 05:A60A: E5        .byte $E5   ; 
- D 1 - I - 0x01661B 05:A60B: EA        .byte $EA   ; 
- D 1 - I - 0x01661C 05:A60C: EB        .byte $EB   ; 
- D 1 - I - 0x01661D 05:A60D: E7        .byte $E7   ; 
- D 1 - I - 0x01661E 05:A60E: E8        .byte $E8   ; 
- D 1 - I - 0x01661F 05:A60F: FD        .byte $FD   ; 
- D 1 - I - 0x016620 05:A610: FD        .byte $FD   ; 
- D 1 - I - 0x016621 05:A611: FD        .byte $FD   ; 
- D 1 - I - 0x016622 05:A612: FD        .byte $FD   ; 
- D 1 - I - 0x016623 05:A613: F1        .byte $F1   ; 
- D 1 - I - 0x016624 05:A614: F2        .byte $F2   ; 
- D 1 - I - 0x016625 05:A615: F1        .byte $F1   ; 
- D 1 - I - 0x016626 05:A616: F2        .byte $F2   ; 
- D 1 - I - 0x016627 05:A617: EE        .byte $EE   ; 
- D 1 - I - 0x016628 05:A618: EB        .byte $EB   ; 
- D 1 - I - 0x016629 05:A619: E7        .byte $E7   ; 
- D 1 - I - 0x01662A 05:A61A: E8        .byte $E8   ; 
- D 1 - I - 0x01662B 05:A61B: E9        .byte $E9   ; 
- D 1 - I - 0x01662C 05:A61C: E4        .byte $E4   ; 
- D 1 - I - 0x01662D 05:A61D: E5        .byte $E5   ; 
- D 1 - I - 0x01662E 05:A61E: EE        .byte $EE   ; 
- D 1 - I - 0x01662F 05:A61F: FD        .byte $FD   ; 
- D 1 - I - 0x016630 05:A620: FD        .byte $FD   ; 
- D 1 - I - 0x016631 05:A621: FD        .byte $FD   ; 
- D 1 - I - 0x016632 05:A622: FD        .byte $FD   ; 
- D 1 - I - 0x016633 05:A623: F1        .byte $F1   ; 
- D 1 - I - 0x016634 05:A624: F2        .byte $F2   ; 
- D 1 - I - 0x016635 05:A625: F1        .byte $F1   ; 
- D 1 - I - 0x016636 05:A626: F2        .byte $F2   ; 
- D 1 - I - 0x016637 05:A627: EF        .byte $EF   ; 
- D 1 - I - 0x016638 05:A628: E5        .byte $E5   ; 
- D 1 - I - 0x016639 05:A629: ED        .byte $ED   ; 
- D 1 - I - 0x01663A 05:A62A: E9        .byte $E9   ; 
- D 1 - I - 0x01663B 05:A62B: E7        .byte $E7   ; 
- D 1 - I - 0x01663C 05:A62C: E8        .byte $E8   ; 
- D 1 - I - 0x01663D 05:A62D: E9        .byte $E9   ; 
- D 1 - I - 0x01663E 05:A62E: F0        .byte $F0   ; 
- D 1 - I - 0x01663F 05:A62F: FD        .byte $FD   ; 
- D 1 - I - 0x016640 05:A630: FD        .byte $FD   ; 
- D 1 - I - 0x016641 05:A631: FD        .byte $FD   ; 
- D 1 - I - 0x016642 05:A632: FD        .byte $FD   ; 
- D 1 - I - 0x016643 05:A633: F1        .byte $F1   ; 
- D 1 - I - 0x016644 05:A634: F2        .byte $F2   ; 
- D 1 - I - 0x016645 05:A635: F1        .byte $F1   ; 
- D 1 - I - 0x016646 05:A636: F2        .byte $F2   ; 
- D 1 - I - 0x016647 05:A637: EB        .byte $EB   ; 
- D 1 - I - 0x016648 05:A638: E7        .byte $E7   ; 
- D 1 - I - 0x016649 05:A639: E8        .byte $E8   ; 
- D 1 - I - 0x01664A 05:A63A: E9        .byte $E9   ; 
- D 1 - I - 0x01664B 05:A63B: E5        .byte $E5   ; 
- D 1 - I - 0x01664C 05:A63C: EE        .byte $EE   ; 
- D 1 - I - 0x01664D 05:A63D: EB        .byte $EB   ; 
- D 1 - I - 0x01664E 05:A63E: EC        .byte $EC   ; 
- D 1 - I - 0x01664F 05:A63F: FD        .byte $FD   ; 
- D 1 - I - 0x016650 05:A640: FD        .byte $FD   ; 
- D 1 - I - 0x016651 05:A641: FD        .byte $FD   ; 
- D 1 - I - 0x016652 05:A642: FD        .byte $FD   ; 
- D 1 - I - 0x016653 05:A643: F1        .byte $F1   ; 
- D 1 - I - 0x016654 05:A644: F2        .byte $F2   ; 
- D 1 - I - 0x016655 05:A645: F1        .byte $F1   ; 
- D 1 - I - 0x016656 05:A646: F2        .byte $F2   ; 
- - - - - - 0x016657 05:A647: FE        .byte $FE   ; 
- - - - - - 0x016658 05:A648: F4        .byte $F4   ; 
- - - - - - 0x016659 05:A649: FE        .byte $FE   ; 
- - - - - - 0x01665A 05:A64A: F4        .byte $F4   ; 
- - - - - - 0x01665B 05:A64B: FB        .byte $FB   ; 
- - - - - - 0x01665C 05:A64C: FF        .byte $FF   ; 
- - - - - - 0x01665D 05:A64D: FB        .byte $FB   ; 
- - - - - - 0x01665E 05:A64E: FF        .byte $FF   ; 
- - - - - - 0x01665F 05:A64F: 00        .byte $00   ; 
- - - - - - 0x016660 05:A650: 00        .byte $00   ; 
- - - - - - 0x016661 05:A651: 00        .byte $00   ; 
- - - - - - 0x016662 05:A652: 00        .byte $00   ; 
- - - - - - 0x016663 05:A653: 00        .byte $00   ; 
- - - - - - 0x016664 05:A654: 00        .byte $00   ; 
- - - - - - 0x016665 05:A655: 00        .byte $00   ; 
- - - - - - 0x016666 05:A656: 00        .byte $00   ; 
- D 1 - I - 0x016667 05:A657: 6C        .byte $6C   ; 
- D 1 - I - 0x016668 05:A658: 6D        .byte $6D   ; 
- D 1 - I - 0x016669 05:A659: 6E        .byte $6E   ; 
- D 1 - I - 0x01666A 05:A65A: 6F        .byte $6F   ; 
- D 1 - I - 0x01666B 05:A65B: 88        .byte $88   ; 
- D 1 - I - 0x01666C 05:A65C: 89        .byte $89   ; 
- D 1 - I - 0x01666D 05:A65D: 01        .byte $01   ; 
- D 1 - I - 0x01666E 05:A65E: 02        .byte $02   ; 
- D 1 - I - 0x01666F 05:A65F: 93        .byte $93   ; 
- D 1 - I - 0x016670 05:A660: 05        .byte $05   ; 
- D 1 - I - 0x016671 05:A661: 06        .byte $06   ; 
- D 1 - I - 0x016672 05:A662: 07        .byte $07   ; 
- D 1 - I - 0x016673 05:A663: 9B        .byte $9B   ; 
- D 1 - I - 0x016674 05:A664: 0B        .byte $0B   ; 
- D 1 - I - 0x016675 05:A665: 0C        .byte $0C   ; 
- D 1 - I - 0x016676 05:A666: 00        .byte $00   ; 
- D 1 - I - 0x016677 05:A667: 70        .byte $70   ; 
- D 1 - I - 0x016678 05:A668: 71        .byte $71   ; 
- D 1 - I - 0x016679 05:A669: 72        .byte $72   ; 
- D 1 - I - 0x01667A 05:A66A: 6C        .byte $6C   ; 
- D 1 - I - 0x01667B 05:A66B: 03        .byte $03   ; 
- D 1 - I - 0x01667C 05:A66C: 04        .byte $04   ; 
- D 1 - I - 0x01667D 05:A66D: 8E        .byte $8E   ; 
- D 1 - I - 0x01667E 05:A66E: 88        .byte $88   ; 
- D 1 - I - 0x01667F 05:A66F: 08        .byte $08   ; 
- D 1 - I - 0x016680 05:A670: 09        .byte $09   ; 
- D 1 - I - 0x016681 05:A671: 0A        .byte $0A   ; 
- D 1 - I - 0x016682 05:A672: 9A        .byte $9A   ; 
- D 1 - I - 0x016683 05:A673: 00        .byte $00   ; 
- D 1 - I - 0x016684 05:A674: 0D        .byte $0D   ; 
- D 1 - I - 0x016685 05:A675: 0E        .byte $0E   ; 
- D 1 - I - 0x016686 05:A676: A2        .byte $A2   ; 
- D 1 - I - 0x016687 05:A677: A4        .byte $A4   ; 
- D 1 - I - 0x016688 05:A678: 0F        .byte $0F   ; 
- D 1 - I - 0x016689 05:A679: 10        .byte $10   ; 
- D 1 - I - 0x01668A 05:A67A: 00        .byte $00   ; 
- D 1 - I - 0x01668B 05:A67B: AF        .byte $AF   ; 
- D 1 - I - 0x01668C 05:A67C: 13        .byte $13   ; 
- D 1 - I - 0x01668D 05:A67D: 14        .byte $14   ; 
- D 1 - I - 0x01668E 05:A67E: 15        .byte $15   ; 
- D 1 - I - 0x01668F 05:A67F: BB        .byte $BB   ; 
- D 1 - I - 0x016690 05:A680: BC        .byte $BC   ; 
- D 1 - I - 0x016691 05:A681: 19        .byte $19   ; 
- D 1 - I - 0x016692 05:A682: 1A        .byte $1A   ; 
- D 1 - I - 0x016693 05:A683: C7        .byte $C7   ; 
- D 1 - I - 0x016694 05:A684: C8        .byte $C8   ; 
- D 1 - I - 0x016695 05:A685: C9        .byte $C9   ; 
- D 1 - I - 0x016696 05:A686: CA        .byte $CA   ; 
- D 1 - I - 0x016697 05:A687: 00        .byte $00   ; 
- D 1 - I - 0x016698 05:A688: 11        .byte $11   ; 
- D 1 - I - 0x016699 05:A689: 12        .byte $12   ; 
- D 1 - I - 0x01669A 05:A68A: AB        .byte $AB   ; 
- D 1 - I - 0x01669B 05:A68B: 16        .byte $16   ; 
- D 1 - I - 0x01669C 05:A68C: 17        .byte $17   ; 
- D 1 - I - 0x01669D 05:A68D: 18        .byte $18   ; 
- D 1 - I - 0x01669E 05:A68E: B6        .byte $B6   ; 
- D 1 - I - 0x01669F 05:A68F: 1B        .byte $1B   ; 
- D 1 - I - 0x0166A0 05:A690: 1C        .byte $1C   ; 
- D 1 - I - 0x0166A1 05:A691: C1        .byte $C1   ; 
- D 1 - I - 0x0166A2 05:A692: C2        .byte $C2   ; 
- D 1 - I - 0x0166A3 05:A693: CB        .byte $CB   ; 
- D 1 - I - 0x0166A4 05:A694: CC        .byte $CC   ; 
- D 1 - I - 0x0166A5 05:A695: CD        .byte $CD   ; 
- D 1 - I - 0x0166A6 05:A696: CE        .byte $CE   ; 
- D 1 - I - 0x0166A7 05:A697: 6C        .byte $6C   ; 
- D 1 - I - 0x0166A8 05:A698: 6D        .byte $6D   ; 
- D 1 - I - 0x0166A9 05:A699: 6E        .byte $6E   ; 
- D 1 - I - 0x0166AA 05:A69A: 6F        .byte $6F   ; 
- D 1 - I - 0x0166AB 05:A69B: 88        .byte $88   ; 
- D 1 - I - 0x0166AC 05:A69C: 89        .byte $89   ; 
- D 1 - I - 0x0166AD 05:A69D: 1D        .byte $1D   ; 
- D 1 - I - 0x0166AE 05:A69E: 1E        .byte $1E   ; 
- D 1 - I - 0x0166AF 05:A69F: 93        .byte $93   ; 
- D 1 - I - 0x0166B0 05:A6A0: 21        .byte $21   ; 
- D 1 - I - 0x0166B1 05:A6A1: 06        .byte $06   ; 
- D 1 - I - 0x0166B2 05:A6A2: 22        .byte $22   ; 
- D 1 - I - 0x0166B3 05:A6A3: 9B        .byte $9B   ; 
- D 1 - I - 0x0166B4 05:A6A4: 25        .byte $25   ; 
- D 1 - I - 0x0166B5 05:A6A5: 26        .byte $26   ; 
- D 1 - I - 0x0166B6 05:A6A6: 00        .byte $00   ; 
- D 1 - I - 0x0166B7 05:A6A7: 70        .byte $70   ; 
- D 1 - I - 0x0166B8 05:A6A8: 71        .byte $71   ; 
- D 1 - I - 0x0166B9 05:A6A9: 72        .byte $72   ; 
- D 1 - I - 0x0166BA 05:A6AA: 6C        .byte $6C   ; 
- D 1 - I - 0x0166BB 05:A6AB: 1F        .byte $1F   ; 
- D 1 - I - 0x0166BC 05:A6AC: 20        .byte $20   ; 
- D 1 - I - 0x0166BD 05:A6AD: 8E        .byte $8E   ; 
- D 1 - I - 0x0166BE 05:A6AE: 88        .byte $88   ; 
- D 1 - I - 0x0166BF 05:A6AF: 23        .byte $23   ; 
- D 1 - I - 0x0166C0 05:A6B0: 09        .byte $09   ; 
- D 1 - I - 0x0166C1 05:A6B1: 24        .byte $24   ; 
- D 1 - I - 0x0166C2 05:A6B2: 9A        .byte $9A   ; 
- D 1 - I - 0x0166C3 05:A6B3: 00        .byte $00   ; 
- D 1 - I - 0x0166C4 05:A6B4: 27        .byte $27   ; 
- D 1 - I - 0x0166C5 05:A6B5: 28        .byte $28   ; 
- D 1 - I - 0x0166C6 05:A6B6: A2        .byte $A2   ; 
- D 1 - I - 0x0166C7 05:A6B7: A4        .byte $A4   ; 
- D 1 - I - 0x0166C8 05:A6B8: 29        .byte $29   ; 
- D 1 - I - 0x0166C9 05:A6B9: 2A        .byte $2A   ; 
- D 1 - I - 0x0166CA 05:A6BA: 00        .byte $00   ; 
- D 1 - I - 0x0166CB 05:A6BB: AF        .byte $AF   ; 
- D 1 - I - 0x0166CC 05:A6BC: 2D        .byte $2D   ; 
- D 1 - I - 0x0166CD 05:A6BD: 14        .byte $14   ; 
- D 1 - I - 0x0166CE 05:A6BE: 2E        .byte $2E   ; 
- D 1 - I - 0x0166CF 05:A6BF: BB        .byte $BB   ; 
- D 1 - I - 0x0166D0 05:A6C0: BC        .byte $BC   ; 
- D 1 - I - 0x0166D1 05:A6C1: 31        .byte $31   ; 
- D 1 - I - 0x0166D2 05:A6C2: 32        .byte $32   ; 
- D 1 - I - 0x0166D3 05:A6C3: C7        .byte $C7   ; 
- D 1 - I - 0x0166D4 05:A6C4: C8        .byte $C8   ; 
- D 1 - I - 0x0166D5 05:A6C5: C9        .byte $C9   ; 
- D 1 - I - 0x0166D6 05:A6C6: CA        .byte $CA   ; 
- D 1 - I - 0x0166D7 05:A6C7: 00        .byte $00   ; 
- D 1 - I - 0x0166D8 05:A6C8: 2B        .byte $2B   ; 
- D 1 - I - 0x0166D9 05:A6C9: 2C        .byte $2C   ; 
- D 1 - I - 0x0166DA 05:A6CA: AB        .byte $AB   ; 
- D 1 - I - 0x0166DB 05:A6CB: 2F        .byte $2F   ; 
- D 1 - I - 0x0166DC 05:A6CC: 17        .byte $17   ; 
- D 1 - I - 0x0166DD 05:A6CD: 30        .byte $30   ; 
- D 1 - I - 0x0166DE 05:A6CE: B6        .byte $B6   ; 
- D 1 - I - 0x0166DF 05:A6CF: 33        .byte $33   ; 
- D 1 - I - 0x0166E0 05:A6D0: 34        .byte $34   ; 
- D 1 - I - 0x0166E1 05:A6D1: C1        .byte $C1   ; 
- D 1 - I - 0x0166E2 05:A6D2: C2        .byte $C2   ; 
- D 1 - I - 0x0166E3 05:A6D3: CB        .byte $CB   ; 
- D 1 - I - 0x0166E4 05:A6D4: CC        .byte $CC   ; 
- D 1 - I - 0x0166E5 05:A6D5: CD        .byte $CD   ; 
- D 1 - I - 0x0166E6 05:A6D6: CE        .byte $CE   ; 
- D 1 - I - 0x0166E7 05:A6D7: 00        .byte $00   ; 
- D 1 - I - 0x0166E8 05:A6D8: 00        .byte $00   ; 
- D 1 - I - 0x0166E9 05:A6D9: 21        .byte $21   ; 
- D 1 - I - 0x0166EA 05:A6DA: 22        .byte $22   ; 
- D 1 - I - 0x0166EB 05:A6DB: 27        .byte $27   ; 
- D 1 - I - 0x0166EC 05:A6DC: 28        .byte $28   ; 
- D 1 - I - 0x0166ED 05:A6DD: 29        .byte $29   ; 
- D 1 - I - 0x0166EE 05:A6DE: 2A        .byte $2A   ; 
- D 1 - I - 0x0166EF 05:A6DF: 32        .byte $32   ; 
- D 1 - I - 0x0166F0 05:A6E0: 33        .byte $33   ; 
- D 1 - I - 0x0166F1 05:A6E1: 34        .byte $34   ; 
- D 1 - I - 0x0166F2 05:A6E2: 35        .byte $35   ; 
- D 1 - I - 0x0166F3 05:A6E3: 40        .byte $40   ; 
- D 1 - I - 0x0166F4 05:A6E4: 41        .byte $41   ; 
- D 1 - I - 0x0166F5 05:A6E5: 01        .byte $01   ; 
- D 1 - I - 0x0166F6 05:A6E6: 02        .byte $02   ; 
- D 1 - I - 0x0166F7 05:A6E7: 23        .byte $23   ; 
- D 1 - I - 0x0166F8 05:A6E8: 24        .byte $24   ; 
- D 1 - I - 0x0166F9 05:A6E9: 00        .byte $00   ; 
- D 1 - I - 0x0166FA 05:A6EA: 00        .byte $00   ; 
- D 1 - I - 0x0166FB 05:A6EB: 2B        .byte $2B   ; 
- D 1 - I - 0x0166FC 05:A6EC: 2C        .byte $2C   ; 
- D 1 - I - 0x0166FD 05:A6ED: 25        .byte $25   ; 
- D 1 - I - 0x0166FE 05:A6EE: 26        .byte $26   ; 
- D 1 - I - 0x0166FF 05:A6EF: 36        .byte $36   ; 
- D 1 - I - 0x016700 05:A6F0: 37        .byte $37   ; 
- D 1 - I - 0x016701 05:A6F1: 38        .byte $38   ; 
- D 1 - I - 0x016702 05:A6F2: 39        .byte $39   ; 
- D 1 - I - 0x016703 05:A6F3: 03        .byte $03   ; 
- D 1 - I - 0x016704 05:A6F4: 04        .byte $04   ; 
- D 1 - I - 0x016705 05:A6F5: 46        .byte $46   ; 
- D 1 - I - 0x016706 05:A6F6: 47        .byte $47   ; 
- D 1 - I - 0x016707 05:A6F7: 49        .byte $49   ; 
- D 1 - I - 0x016708 05:A6F8: 4A        .byte $4A   ; 
- D 1 - I - 0x016709 05:A6F9: 05        .byte $05   ; 
- D 1 - I - 0x01670A 05:A6FA: 4C        .byte $4C   ; 
- D 1 - I - 0x01670B 05:A6FB: 51        .byte $51   ; 
- D 1 - I - 0x01670C 05:A6FC: 52        .byte $52   ; 
- D 1 - I - 0x01670D 05:A6FD: 07        .byte $07   ; 
- D 1 - I - 0x01670E 05:A6FE: 54        .byte $54   ; 
- D 1 - I - 0x01670F 05:A6FF: 58        .byte $58   ; 
- D 1 - I - 0x016710 05:A700: 59        .byte $59   ; 
- D 1 - I - 0x016711 05:A701: 09        .byte $09   ; 
- D 1 - I - 0x016712 05:A702: 0A        .byte $0A   ; 
- D 1 - I - 0x016713 05:A703: 79        .byte $79   ; 
- D 1 - I - 0x016714 05:A704: 60        .byte $60   ; 
- D 1 - I - 0x016715 05:A705: 0D        .byte $0D   ; 
- D 1 - I - 0x016716 05:A706: 0E        .byte $0E   ; 
- D 1 - I - 0x016717 05:A707: 4D        .byte $4D   ; 
- D 1 - I - 0x016718 05:A708: 06        .byte $06   ; 
- D 1 - I - 0x016719 05:A709: 4F        .byte $4F   ; 
- D 1 - I - 0x01671A 05:A70A: 50        .byte $50   ; 
- D 1 - I - 0x01671B 05:A70B: 55        .byte $55   ; 
- D 1 - I - 0x01671C 05:A70C: 08        .byte $08   ; 
- D 1 - I - 0x01671D 05:A70D: 57        .byte $57   ; 
- D 1 - I - 0x01671E 05:A70E: 51        .byte $51   ; 
- D 1 - I - 0x01671F 05:A70F: 0B        .byte $0B   ; 
- D 1 - I - 0x016720 05:A710: 0C        .byte $0C   ; 
- D 1 - I - 0x016721 05:A711: 5E        .byte $5E   ; 
- D 1 - I - 0x016722 05:A712: 5F        .byte $5F   ; 
- D 1 - I - 0x016723 05:A713: 0F        .byte $0F   ; 
- D 1 - I - 0x016724 05:A714: 10        .byte $10   ; 
- D 1 - I - 0x016725 05:A715: 65        .byte $65   ; 
- D 1 - I - 0x016726 05:A716: 7A        .byte $7A   ; 
- D 1 - I - 0x016727 05:A717: 00        .byte $00   ; 
- D 1 - I - 0x016728 05:A718: 00        .byte $00   ; 
- D 1 - I - 0x016729 05:A719: 21        .byte $21   ; 
- D 1 - I - 0x01672A 05:A71A: 22        .byte $22   ; 
- D 1 - I - 0x01672B 05:A71B: 27        .byte $27   ; 
- D 1 - I - 0x01672C 05:A71C: 28        .byte $28   ; 
- D 1 - I - 0x01672D 05:A71D: 29        .byte $29   ; 
- D 1 - I - 0x01672E 05:A71E: 2A        .byte $2A   ; 
- D 1 - I - 0x01672F 05:A71F: 32        .byte $32   ; 
- D 1 - I - 0x016730 05:A720: 33        .byte $33   ; 
- D 1 - I - 0x016731 05:A721: 34        .byte $34   ; 
- D 1 - I - 0x016732 05:A722: 35        .byte $35   ; 
- D 1 - I - 0x016733 05:A723: 40        .byte $40   ; 
- D 1 - I - 0x016734 05:A724: 41        .byte $41   ; 
- D 1 - I - 0x016735 05:A725: 11        .byte $11   ; 
- D 1 - I - 0x016736 05:A726: 12        .byte $12   ; 
- D 1 - I - 0x016737 05:A727: 23        .byte $23   ; 
- D 1 - I - 0x016738 05:A728: 24        .byte $24   ; 
- D 1 - I - 0x016739 05:A729: 00        .byte $00   ; 
- D 1 - I - 0x01673A 05:A72A: 00        .byte $00   ; 
- D 1 - I - 0x01673B 05:A72B: 2B        .byte $2B   ; 
- D 1 - I - 0x01673C 05:A72C: 2C        .byte $2C   ; 
- D 1 - I - 0x01673D 05:A72D: 25        .byte $25   ; 
- D 1 - I - 0x01673E 05:A72E: 26        .byte $26   ; 
- D 1 - I - 0x01673F 05:A72F: 36        .byte $36   ; 
- D 1 - I - 0x016740 05:A730: 37        .byte $37   ; 
- D 1 - I - 0x016741 05:A731: 38        .byte $38   ; 
- D 1 - I - 0x016742 05:A732: 39        .byte $39   ; 
- D 1 - I - 0x016743 05:A733: 13        .byte $13   ; 
- D 1 - I - 0x016744 05:A734: 14        .byte $14   ; 
- D 1 - I - 0x016745 05:A735: 46        .byte $46   ; 
- D 1 - I - 0x016746 05:A736: 47        .byte $47   ; 
- D 1 - I - 0x016747 05:A737: 49        .byte $49   ; 
- D 1 - I - 0x016748 05:A738: 4A        .byte $4A   ; 
- D 1 - I - 0x016749 05:A739: 15        .byte $15   ; 
- D 1 - I - 0x01674A 05:A73A: 4C        .byte $4C   ; 
- D 1 - I - 0x01674B 05:A73B: 51        .byte $51   ; 
- D 1 - I - 0x01674C 05:A73C: 52        .byte $52   ; 
- D 1 - I - 0x01674D 05:A73D: 17        .byte $17   ; 
- D 1 - I - 0x01674E 05:A73E: 54        .byte $54   ; 
- D 1 - I - 0x01674F 05:A73F: 58        .byte $58   ; 
- D 1 - I - 0x016750 05:A740: 59        .byte $59   ; 
- D 1 - I - 0x016751 05:A741: 19        .byte $19   ; 
- D 1 - I - 0x016752 05:A742: 1A        .byte $1A   ; 
- D 1 - I - 0x016753 05:A743: 79        .byte $79   ; 
- D 1 - I - 0x016754 05:A744: 60        .byte $60   ; 
- D 1 - I - 0x016755 05:A745: 1D        .byte $1D   ; 
- D 1 - I - 0x016756 05:A746: 1E        .byte $1E   ; 
- D 1 - I - 0x016757 05:A747: 4D        .byte $4D   ; 
- D 1 - I - 0x016758 05:A748: 16        .byte $16   ; 
- D 1 - I - 0x016759 05:A749: 4F        .byte $4F   ; 
- D 1 - I - 0x01675A 05:A74A: 50        .byte $50   ; 
- D 1 - I - 0x01675B 05:A74B: 55        .byte $55   ; 
- D 1 - I - 0x01675C 05:A74C: 18        .byte $18   ; 
- D 1 - I - 0x01675D 05:A74D: 57        .byte $57   ; 
- D 1 - I - 0x01675E 05:A74E: 51        .byte $51   ; 
- D 1 - I - 0x01675F 05:A74F: 1B        .byte $1B   ; 
- D 1 - I - 0x016760 05:A750: 1C        .byte $1C   ; 
- D 1 - I - 0x016761 05:A751: 5E        .byte $5E   ; 
- D 1 - I - 0x016762 05:A752: 5F        .byte $5F   ; 
- D 1 - I - 0x016763 05:A753: 1F        .byte $1F   ; 
- D 1 - I - 0x016764 05:A754: 20        .byte $20   ; 
- D 1 - I - 0x016765 05:A755: 65        .byte $65   ; 
- D 1 - I - 0x016766 05:A756: 7A        .byte $7A   ; 



_off007_0x016767_06_area_7:
- D 1 - I - 0x016767 05:A757: 00        .byte $00   ; 
- D 1 - I - 0x016768 05:A758: 05        .byte $05   ; 
- D 1 - I - 0x016769 05:A759: 50        .byte $50   ; 
- D 1 - I - 0x01676A 05:A75A: 40        .byte $40   ; 
- D 1 - I - 0x01676B 05:A75B: 00        .byte $00   ; 
- D 1 - I - 0x01676C 05:A75C: 40        .byte $40   ; 
- D 1 - I - 0x01676D 05:A75D: 00        .byte $00   ; 
- D 1 - I - 0x01676E 05:A75E: 01        .byte $01   ; 
- D 1 - I - 0x01676F 05:A75F: 00        .byte $00   ; 
- D 1 - I - 0x016770 05:A760: 10        .byte $10   ; 
- D 1 - I - 0x016771 05:A761: 00        .byte $00   ; 
- D 1 - I - 0x016772 05:A762: 00        .byte $00   ; 
- - - - - - 0x016773 05:A763: 00        .byte $00   ; 
- D 1 - I - 0x016774 05:A764: 50        .byte $50   ; 
- D 1 - I - 0x016775 05:A765: 40        .byte $40   ; 
- D 1 - I - 0x016776 05:A766: 40        .byte $40   ; 
- D 1 - I - 0x016777 05:A767: 00        .byte $00   ; 
- D 1 - I - 0x016778 05:A768: AA        .byte $AA   ; 
- D 1 - I - 0x016779 05:A769: AF        .byte $AF   ; 
- D 1 - I - 0x01677A 05:A76A: AA        .byte $AA   ; 
- D 1 - I - 0x01677B 05:A76B: AF        .byte $AF   ; 
- D 1 - I - 0x01677C 05:A76C: AA        .byte $AA   ; 
- D 1 - I - 0x01677D 05:A76D: AA        .byte $AA   ; 
- D 1 - I - 0x01677E 05:A76E: AA        .byte $AA   ; 
- D 1 - I - 0x01677F 05:A76F: FA        .byte $FA   ; 
- D 1 - I - 0x016780 05:A770: FA        .byte $FA   ; 
- D 1 - I - 0x016781 05:A771: AA        .byte $AA   ; 
- D 1 - I - 0x016782 05:A772: AA        .byte $AA   ; 
- - - - - - 0x016783 05:A773: AA        .byte $AA   ; 
- - - - - - 0x016784 05:A774: AA        .byte $AA   ; 
- - - - - - 0x016785 05:A775: AA        .byte $AA   ; 
- D 1 - I - 0x016786 05:A776: FA        .byte $FA   ; 
- D 1 - I - 0x016787 05:A777: AA        .byte $AA   ; 
- D 1 - I - 0x016788 05:A778: AF        .byte $AF   ; 
- D 1 - I - 0x016789 05:A779: AA        .byte $AA   ; 
- D 1 - I - 0x01678A 05:A77A: FA        .byte $FA   ; 
- D 1 - I - 0x01678B 05:A77B: AA        .byte $AA   ; 
- D 1 - I - 0x01678C 05:A77C: AA        .byte $AA   ; 
- D 1 - I - 0x01678D 05:A77D: AA        .byte $AA   ; 
- D 1 - I - 0x01678E 05:A77E: AF        .byte $AF   ; 
- D 1 - I - 0x01678F 05:A77F: AA        .byte $AA   ; 
- D 1 - I - 0x016790 05:A780: AA        .byte $AA   ; 
- D 1 - I - 0x016791 05:A781: FA        .byte $FA   ; 
- D 1 - I - 0x016792 05:A782: FA        .byte $FA   ; 
- D 1 - I - 0x016793 05:A783: AA        .byte $AA   ; 
- D 1 - I - 0x016794 05:A784: AA        .byte $AA   ; 
- D 1 - I - 0x016795 05:A785: AA        .byte $AA   ; 
- D 1 - I - 0x016796 05:A786: FA        .byte $FA   ; 
- D 1 - I - 0x016797 05:A787: AA        .byte $AA   ; 
- D 1 - I - 0x016798 05:A788: AA        .byte $AA   ; 
- D 1 - I - 0x016799 05:A789: AA        .byte $AA   ; 
- D 1 - I - 0x01679A 05:A78A: FA        .byte $FA   ; 
- D 1 - I - 0x01679B 05:A78B: AA        .byte $AA   ; 
- D 1 - I - 0x01679C 05:A78C: BA        .byte $BA   ; 
- D 1 - I - 0x01679D 05:A78D: AA        .byte $AA   ; 
- D 1 - I - 0x01679E 05:A78E: FF        .byte $FF   ; 
- D 1 - I - 0x01679F 05:A78F: FF        .byte $FF   ; 
- D 1 - I - 0x0167A0 05:A790: FF        .byte $FF   ; 
- D 1 - I - 0x0167A1 05:A791: FF        .byte $FF   ; 
- D 1 - I - 0x0167A2 05:A792: FF        .byte $FF   ; 
- D 1 - I - 0x0167A3 05:A793: FF        .byte $FF   ; 
- D 1 - I - 0x0167A4 05:A794: FF        .byte $FF   ; 
- D 1 - I - 0x0167A5 05:A795: FF        .byte $FF   ; 
- D 1 - I - 0x0167A6 05:A796: FF        .byte $FF   ; 
- D 1 - I - 0x0167A7 05:A797: FF        .byte $FF   ; 
- D 1 - I - 0x0167A8 05:A798: AF        .byte $AF   ; 
- D 1 - I - 0x0167A9 05:A799: AF        .byte $AF   ; 
- D 1 - I - 0x0167AA 05:A79A: FF        .byte $FF   ; 
- D 1 - I - 0x0167AB 05:A79B: FF        .byte $FF   ; 
- - - - - - 0x0167AC 05:A79C: FF        .byte $FF   ; 
- D 1 - I - 0x0167AD 05:A79D: AF        .byte $AF   ; 
- D 1 - I - 0x0167AE 05:A79E: FF        .byte $FF   ; 
- D 1 - I - 0x0167AF 05:A79F: FF        .byte $FF   ; 
- D 1 - I - 0x0167B0 05:A7A0: FF        .byte $FF   ; 
- D 1 - I - 0x0167B1 05:A7A1: FF        .byte $FF   ; 
- D 1 - I - 0x0167B2 05:A7A2: FF        .byte $FF   ; 
- D 1 - I - 0x0167B3 05:A7A3: 55        .byte $55   ; 
- D 1 - I - 0x0167B4 05:A7A4: 55        .byte $55   ; 
- D 1 - I - 0x0167B5 05:A7A5: 55        .byte $55   ; 
- D 1 - I - 0x0167B6 05:A7A6: 55        .byte $55   ; 
- D 1 - I - 0x0167B7 05:A7A7: 55        .byte $55   ; 
- D 1 - I - 0x0167B8 05:A7A8: 55        .byte $55   ; 
- D 1 - I - 0x0167B9 05:A7A9: 55        .byte $55   ; 
- D 1 - I - 0x0167BA 05:A7AA: 55        .byte $55   ; 
- D 1 - I - 0x0167BB 05:A7AB: 55        .byte $55   ; 
- D 1 - I - 0x0167BC 05:A7AC: 55        .byte $55   ; 
- D 1 - I - 0x0167BD 05:A7AD: 55        .byte $55   ; 
- D 1 - I - 0x0167BE 05:A7AE: 55        .byte $55   ; 
- D 1 - I - 0x0167BF 05:A7AF: AA        .byte $AA   ; 
- D 1 - I - 0x0167C0 05:A7B0: A6        .byte $A6   ; 
- D 1 - I - 0x0167C1 05:A7B1: A9        .byte $A9   ; 
- D 1 - I - 0x0167C2 05:A7B2: AA        .byte $AA   ; 
- D 1 - I - 0x0167C3 05:A7B3: AA        .byte $AA   ; 
- D 1 - I - 0x0167C4 05:A7B4: AA        .byte $AA   ; 
- D 1 - I - 0x0167C5 05:A7B5: AA        .byte $AA   ; 
- D 1 - I - 0x0167C6 05:A7B6: AA        .byte $AA   ; 
- D 1 - I - 0x0167C7 05:A7B7: AA        .byte $AA   ; 
- D 1 - I - 0x0167C8 05:A7B8: AA        .byte $AA   ; 
- D 1 - I - 0x0167C9 05:A7B9: AA        .byte $AA   ; 
- D 1 - I - 0x0167CA 05:A7BA: AA        .byte $AA   ; 
- D 1 - I - 0x0167CB 05:A7BB: AA        .byte $AA   ; 
- D 1 - I - 0x0167CC 05:A7BC: AA        .byte $AA   ; 
- D 1 - I - 0x0167CD 05:A7BD: AA        .byte $AA   ; 
- D 1 - I - 0x0167CE 05:A7BE: AA        .byte $AA   ; 
- D 1 - I - 0x0167CF 05:A7BF: AA        .byte $AA   ; 
- D 1 - I - 0x0167D0 05:A7C0: AA        .byte $AA   ; 
- D 1 - I - 0x0167D1 05:A7C1: AA        .byte $AA   ; 
- D 1 - I - 0x0167D2 05:A7C2: AA        .byte $AA   ; 
- D 1 - I - 0x0167D3 05:A7C3: AA        .byte $AA   ; 
- D 1 - I - 0x0167D4 05:A7C4: AA        .byte $AA   ; 
- D 1 - I - 0x0167D5 05:A7C5: 00        .byte $00   ; 
- D 1 - I - 0x0167D6 05:A7C6: 00        .byte $00   ; 
- D 1 - I - 0x0167D7 05:A7C7: 00        .byte $00   ; 
- D 1 - I - 0x0167D8 05:A7C8: 55        .byte $55   ; 
- D 1 - I - 0x0167D9 05:A7C9: 5D        .byte $5D   ; 
- D 1 - I - 0x0167DA 05:A7CA: 77        .byte $77   ; 
- D 1 - I - 0x0167DB 05:A7CB: DD        .byte $DD   ; 
- D 1 - I - 0x0167DC 05:A7CC: 57        .byte $57   ; 
- D 1 - I - 0x0167DD 05:A7CD: 55        .byte $55   ; 
- D 1 - I - 0x0167DE 05:A7CE: DD        .byte $DD   ; 
- D 1 - I - 0x0167DF 05:A7CF: FF        .byte $FF   ; 
- D 1 - I - 0x0167E0 05:A7D0: F7        .byte $F7   ; 
- D 1 - I - 0x0167E1 05:A7D1: FD        .byte $FD   ; 
- D 1 - I - 0x0167E2 05:A7D2: FF        .byte $FF   ; 
- D 1 - I - 0x0167E3 05:A7D3: D5        .byte $D5   ; 
- D 1 - I - 0x0167E4 05:A7D4: F5        .byte $F5   ; 
- D 1 - I - 0x0167E5 05:A7D5: F5        .byte $F5   ; 
- D 1 - I - 0x0167E6 05:A7D6: 7F        .byte $7F   ; 
- D 1 - I - 0x0167E7 05:A7D7: DF        .byte $DF   ; 
- D 1 - I - 0x0167E8 05:A7D8: F5        .byte $F5   ; 
- D 1 - I - 0x0167E9 05:A7D9: F5        .byte $F5   ; 
- D 1 - I - 0x0167EA 05:A7DA: 75        .byte $75   ; 
- D 1 - I - 0x0167EB 05:A7DB: DF        .byte $DF   ; 
- D 1 - I - 0x0167EC 05:A7DC: 77        .byte $77   ; 
- D 1 - I - 0x0167ED 05:A7DD: F7        .byte $F7   ; 
- D 1 - I - 0x0167EE 05:A7DE: FD        .byte $FD   ; 
- D 1 - I - 0x0167EF 05:A7DF: DD        .byte $DD   ; 
- D 1 - I - 0x0167F0 05:A7E0: 7D        .byte $7D   ; 
- D 1 - I - 0x0167F1 05:A7E1: FD        .byte $FD   ; 
- D 1 - I - 0x0167F2 05:A7E2: 57        .byte $57   ; 
- D 1 - I - 0x0167F3 05:A7E3: FF        .byte $FF   ; 
- D 1 - I - 0x0167F4 05:A7E4: FF        .byte $FF   ; 
- D 1 - I - 0x0167F5 05:A7E5: 5D        .byte $5D   ; 
- D 1 - I - 0x0167F6 05:A7E6: F7        .byte $F7   ; 
- D 1 - I - 0x0167F7 05:A7E7: 5D        .byte $5D   ; 
- D 1 - I - 0x0167F8 05:A7E8: 57        .byte $57   ; 
- D 1 - I - 0x0167F9 05:A7E9: 55        .byte $55   ; 
- D 1 - I - 0x0167FA 05:A7EA: 5D        .byte $5D   ; 
- D 1 - I - 0x0167FB 05:A7EB: 57        .byte $57   ; 
- D 1 - I - 0x0167FC 05:A7EC: 55        .byte $55   ; 
- D 1 - I - 0x0167FD 05:A7ED: 5D        .byte $5D   ; 
- D 1 - I - 0x0167FE 05:A7EE: 57        .byte $57   ; 
- D 1 - I - 0x0167FF 05:A7EF: F5        .byte $F5   ; 
- D 1 - I - 0x016800 05:A7F0: F5        .byte $F5   ; 
- D 1 - I - 0x016801 05:A7F1: F5        .byte $F5   ; 
- D 1 - I - 0x016802 05:A7F2: F5        .byte $F5   ; 
- D 1 - I - 0x016803 05:A7F3: F5        .byte $F5   ; 
- D 1 - I - 0x016804 05:A7F4: F5        .byte $F5   ; 
- D 1 - I - 0x016805 05:A7F5: F5        .byte $F5   ; 
- D 1 - I - 0x016806 05:A7F6: F5        .byte $F5   ; 
- - - - - - 0x016807 05:A7F7: 55        .byte $55   ; 
- D 1 - I - 0x016808 05:A7F8: 7F        .byte $7F   ; 
- D 1 - I - 0x016809 05:A7F9: DF        .byte $DF   ; 
- D 1 - I - 0x01680A 05:A7FA: F7        .byte $F7   ; 
- D 1 - I - 0x01680B 05:A7FB: FD        .byte $FD   ; 
- D 1 - I - 0x01680C 05:A7FC: 7F        .byte $7F   ; 
- D 1 - I - 0x01680D 05:A7FD: DF        .byte $DF   ; 
- D 1 - I - 0x01680E 05:A7FE: F7        .byte $F7   ; 
- D 1 - I - 0x01680F 05:A7FF: FD        .byte $FD   ; 
- D 1 - I - 0x016810 05:A800: 77        .byte $77   ; 
- D 1 - I - 0x016811 05:A801: DD        .byte $DD   ; 
- D 1 - I - 0x016812 05:A802: F7        .byte $F7   ; 
- D 1 - I - 0x016813 05:A803: FD        .byte $FD   ; 
- D 1 - I - 0x016814 05:A804: 77        .byte $77   ; 
- D 1 - I - 0x016815 05:A805: DD        .byte $DD   ; 
- D 1 - I - 0x016816 05:A806: F7        .byte $F7   ; 
- D 1 - I - 0x016817 05:A807: FD        .byte $FD   ; 
- - - - - - 0x016818 05:A808: 00        .byte $00   ; 
- - - - - - 0x016819 05:A809: 00        .byte $00   ; 
- - - - - - 0x01681A 05:A80A: 00        .byte $00   ; 
- - - - - - 0x01681B 05:A80B: 00        .byte $00   ; 
- - - - - - 0x01681C 05:A80C: 00        .byte $00   ; 
- - - - - - 0x01681D 05:A80D: 00        .byte $00   ; 
- - - - - - 0x01681E 05:A80E: 00        .byte $00   ; 
- - - - - - 0x01681F 05:A80F: 00        .byte $00   ; 
- - - - - - 0x016820 05:A810: 00        .byte $00   ; 
- - - - - - 0x016821 05:A811: 00        .byte $00   ; 
- - - - - - 0x016822 05:A812: 00        .byte $00   ; 
- - - - - - 0x016823 05:A813: 00        .byte $00   ; 
- - - - - - 0x016824 05:A814: 00        .byte $00   ; 
- - - - - - 0x016825 05:A815: 00        .byte $00   ; 
- - - - - - 0x016826 05:A816: 00        .byte $00   ; 



_off004_0x016827_07_area_8:
- D 1 - I - 0x016827 05:A817: 10        .byte $10   ; config
- D 1 - I - 0x016828 05:A818: 04        .byte $04   ; config

- - - - - - 0x016829 05:A819: 00        .byte $00   ; 
- - - - - - 0x01682A 05:A81A: 00        .byte $00   ; 
- - - - - - 0x01682B 05:A81B: 00        .byte $00   ; 
- - - - - - 0x01682C 05:A81C: 00        .byte $00   ; 
- - - - - - 0x01682D 05:A81D: 00        .byte $00   ; 
- D 1 - I - 0x01682E 05:A81E: 00        .byte $00   ; 
- D 1 - I - 0x01682F 05:A81F: 00        .byte $00   ; 
- D 1 - I - 0x016830 05:A820: 00        .byte $00   ; 
- - - - - - 0x016831 05:A821: 00        .byte $00   ; 
- - - - - - 0x016832 05:A822: 00        .byte $00   ; 
- D 1 - I - 0x016833 05:A823: 15        .byte $15   ; 
- D 1 - I - 0x016834 05:A824: 15        .byte $15   ; 
- - - - - - 0x016835 05:A825: 00        .byte $00   ; 
- - - - - - 0x016836 05:A826: 00        .byte $00   ; 
- - - - - - 0x016837 05:A827: 00        .byte $00   ; 
- - - - - - 0x016838 05:A828: 00        .byte $00   ; 
- - - - - - 0x016839 05:A829: 00        .byte $00   ; 
- - - - - - 0x01683A 05:A82A: 00        .byte $00   ; 
- - - - - - 0x01683B 05:A82B: 00        .byte $00   ; 
- - - - - - 0x01683C 05:A82C: 00        .byte $00   ; 
- - - - - - 0x01683D 05:A82D: 00        .byte $00   ; 
- D 1 - I - 0x01683E 05:A82E: 00        .byte $00   ; 
- D 1 - I - 0x01683F 05:A82F: 0B        .byte $0B   ; 
- D 1 - I - 0x016840 05:A830: 0C        .byte $0C   ; 
- D 1 - I - 0x016841 05:A831: 0D        .byte $0D   ; 
- D 1 - I - 0x016842 05:A832: 0E        .byte $0E   ; 
- D 1 - I - 0x016843 05:A833: 0F        .byte $0F   ; 
- D 1 - I - 0x016844 05:A834: 0F        .byte $0F   ; 
- D 1 - I - 0x016845 05:A835: 10        .byte $10   ; 
- D 1 - I - 0x016846 05:A836: 11        .byte $11   ; 
- - - - - - 0x016847 05:A837: 00        .byte $00   ; 
- - - - - - 0x016848 05:A838: 00        .byte $00   ; 
- - - - - - 0x016849 05:A839: 00        .byte $00   ; 
- - - - - - 0x01684A 05:A83A: 00        .byte $00   ; 
- - - - - - 0x01684B 05:A83B: 00        .byte $00   ; 
- D 1 - I - 0x01684C 05:A83C: 07        .byte $07   ; 
- D 1 - I - 0x01684D 05:A83D: 08        .byte $08   ; 
- D 1 - I - 0x01684E 05:A83E: 09        .byte $09   ; 
- D 1 - I - 0x01684F 05:A83F: 0A        .byte $0A   ; 
- D 1 - I - 0x016850 05:A840: 00        .byte $00   ; 
- - - - - - 0x016851 05:A841: 00        .byte $00   ; 
- - - - - - 0x016852 05:A842: 00        .byte $00   ; 
- - - - - - 0x016853 05:A843: 00        .byte $00   ; 
- D 1 - I - 0x016854 05:A844: 00        .byte $00   ; 
- D 1 - I - 0x016855 05:A845: 12        .byte $12   ; 
- D 1 - I - 0x016856 05:A846: 13        .byte $13   ; 
- D 1 - I - 0x016857 05:A847: 14        .byte $14   ; 
- D 1 - I - 0x016858 05:A848: 16        .byte $16   ; 
- D 1 - I - 0x016859 05:A849: 01        .byte $01   ; 
- D 1 - I - 0x01685A 05:A84A: 02        .byte $02   ; 
- D 1 - I - 0x01685B 05:A84B: 03        .byte $03   ; 
- D 1 - I - 0x01685C 05:A84C: 04        .byte $04   ; 
- D 1 - I - 0x01685D 05:A84D: 05        .byte $05   ; 
- D 1 - I - 0x01685E 05:A84E: 06        .byte $06   ; 
- D 1 - I - 0x01685F 05:A84F: 00        .byte $00   ; 
- - - - - - 0x016860 05:A850: 00        .byte $00   ; 
- - - - - - 0x016861 05:A851: 00        .byte $00   ; 
- - - - - - 0x016862 05:A852: 00        .byte $00   ; 
- - - - - - 0x016863 05:A853: 00        .byte $00   ; 
- - - - - - 0x016864 05:A854: 00        .byte $00   ; 
- D 1 - I - 0x016865 05:A855: 00        .byte $00   ; 
- D 1 - I - 0x016866 05:A856: 00        .byte $00   ; 
- - - - - - 0x016867 05:A857: 00        .byte $00   ; 
- - - - - - 0x016868 05:A858: 00        .byte $00   ; 



_off005_0x016869_07_area_8:
- D 1 - I - 0x016869 05:A859: 87 A8     .word _off018_07_A887_00
- D 1 - I - 0x01686B 05:A85B: C7 A8     .word _off018_07_A8C7_01
- D 1 - I - 0x01686D 05:A85D: 07 A9     .word _off018_07_A907_02
- D 1 - I - 0x01686F 05:A85F: 47 A9     .word _off018_07_A947_03
- D 1 - I - 0x016871 05:A861: 87 A9     .word _off018_07_A987_04
- D 1 - I - 0x016873 05:A863: C7 A9     .word _off018_07_A9C7_05
- D 1 - I - 0x016875 05:A865: 07 AA     .word _off018_07_AA07_06
- D 1 - I - 0x016877 05:A867: 47 AA     .word _off018_07_AA47_07
- D 1 - I - 0x016879 05:A869: 87 AA     .word _off018_07_AA87_08
- D 1 - I - 0x01687B 05:A86B: C7 AA     .word _off018_07_AAC7_09
- D 1 - I - 0x01687D 05:A86D: 07 AB     .word _off018_07_AB07_0A
- D 1 - I - 0x01687F 05:A86F: 47 AB     .word _off018_07_AB47_0B
- D 1 - I - 0x016881 05:A871: 87 AB     .word _off018_07_AB87_0C
- D 1 - I - 0x016883 05:A873: C7 AB     .word _off018_07_ABC7_0D
- D 1 - I - 0x016885 05:A875: 07 AC     .word _off018_07_AC07_0E
- D 1 - I - 0x016887 05:A877: 47 AC     .word _off018_07_AC47_0F
- D 1 - I - 0x016889 05:A879: 87 AC     .word _off018_07_AC87_10
- D 1 - I - 0x01688B 05:A87B: C7 AC     .word _off018_07_ACC7_11
- D 1 - I - 0x01688D 05:A87D: 07 AD     .word _off018_07_AD07_12
- D 1 - I - 0x01688F 05:A87F: 47 AD     .word _off018_07_AD47_13
- D 1 - I - 0x016891 05:A881: 87 AD     .word _off018_07_AD87_14
- D 1 - I - 0x016893 05:A883: C7 AD     .word _off018_07_ADC7_15
- D 1 - I - 0x016895 05:A885: 07 AE     .word _off018_07_AE07_16



_off018_07_A887_00:
- D 1 - I - 0x016897 05:A887: 00        .byte $00   ; 
- D 1 - I - 0x016898 05:A888: 00        .byte $00   ; 
- D 1 - I - 0x016899 05:A889: 00        .byte $00   ; 
- D 1 - I - 0x01689A 05:A88A: 00        .byte $00   ; 
- D 1 - I - 0x01689B 05:A88B: 00        .byte $00   ; 
- D 1 - I - 0x01689C 05:A88C: 00        .byte $00   ; 
- D 1 - I - 0x01689D 05:A88D: 00        .byte $00   ; 
- D 1 - I - 0x01689E 05:A88E: 00        .byte $00   ; 
- D 1 - I - 0x01689F 05:A88F: 00        .byte $00   ; 
- D 1 - I - 0x0168A0 05:A890: 00        .byte $00   ; 
- D 1 - I - 0x0168A1 05:A891: 00        .byte $00   ; 
- - - - - - 0x0168A2 05:A892: 00        .byte $00   ; 
- - - - - - 0x0168A3 05:A893: 00        .byte $00   ; 
- - - - - - 0x0168A4 05:A894: 00        .byte $00   ; 
- - - - - - 0x0168A5 05:A895: 00        .byte $00   ; 
- D 1 - I - 0x0168A6 05:A896: 00        .byte $00   ; 
- D 1 - I - 0x0168A7 05:A897: 00        .byte $00   ; 
- D 1 - I - 0x0168A8 05:A898: 00        .byte $00   ; 
- - - - - - 0x0168A9 05:A899: 00        .byte $00   ; 
- - - - - - 0x0168AA 05:A89A: 00        .byte $00   ; 
- - - - - - 0x0168AB 05:A89B: 00        .byte $00   ; 
- - - - - - 0x0168AC 05:A89C: 00        .byte $00   ; 
- - - - - - 0x0168AD 05:A89D: 00        .byte $00   ; 
- D 1 - I - 0x0168AE 05:A89E: 00        .byte $00   ; 
- D 1 - I - 0x0168AF 05:A89F: 00        .byte $00   ; 
- - - - - - 0x0168B0 05:A8A0: 00        .byte $00   ; 
- - - - - - 0x0168B1 05:A8A1: 00        .byte $00   ; 
- - - - - - 0x0168B2 05:A8A2: 00        .byte $00   ; 
- - - - - - 0x0168B3 05:A8A3: 00        .byte $00   ; 
- - - - - - 0x0168B4 05:A8A4: 00        .byte $00   ; 
- - - - - - 0x0168B5 05:A8A5: 00        .byte $00   ; 
- D 1 - I - 0x0168B6 05:A8A6: 00        .byte $00   ; 
- D 1 - I - 0x0168B7 05:A8A7: 00        .byte $00   ; 
- D 1 - I - 0x0168B8 05:A8A8: 00        .byte $00   ; 
- D 1 - I - 0x0168B9 05:A8A9: 00        .byte $00   ; 
- D 1 - I - 0x0168BA 05:A8AA: 00        .byte $00   ; 
- D 1 - I - 0x0168BB 05:A8AB: 00        .byte $00   ; 
- D 1 - I - 0x0168BC 05:A8AC: 00        .byte $00   ; 
- D 1 - I - 0x0168BD 05:A8AD: 00        .byte $00   ; 
- D 1 - I - 0x0168BE 05:A8AE: 00        .byte $00   ; 
- D 1 - I - 0x0168BF 05:A8AF: 00        .byte $00   ; 
- D 1 - I - 0x0168C0 05:A8B0: 00        .byte $00   ; 
- D 1 - I - 0x0168C1 05:A8B1: 00        .byte $00   ; 
- D 1 - I - 0x0168C2 05:A8B2: 00        .byte $00   ; 
- D 1 - I - 0x0168C3 05:A8B3: 00        .byte $00   ; 
- D 1 - I - 0x0168C4 05:A8B4: 00        .byte $00   ; 
- D 1 - I - 0x0168C5 05:A8B5: 00        .byte $00   ; 
- D 1 - I - 0x0168C6 05:A8B6: 00        .byte $00   ; 
- D 1 - I - 0x0168C7 05:A8B7: 00        .byte $00   ; 
- D 1 - I - 0x0168C8 05:A8B8: 00        .byte $00   ; 
- D 1 - I - 0x0168C9 05:A8B9: 00        .byte $00   ; 
- D 1 - I - 0x0168CA 05:A8BA: 00        .byte $00   ; 
- D 1 - I - 0x0168CB 05:A8BB: 00        .byte $00   ; 
- D 1 - I - 0x0168CC 05:A8BC: 00        .byte $00   ; 
- D 1 - I - 0x0168CD 05:A8BD: 00        .byte $00   ; 
- D 1 - I - 0x0168CE 05:A8BE: 00        .byte $00   ; 
- D 1 - I - 0x0168CF 05:A8BF: 00        .byte $00   ; 
- D 1 - I - 0x0168D0 05:A8C0: 00        .byte $00   ; 
- D 1 - I - 0x0168D1 05:A8C1: 00        .byte $00   ; 
- D 1 - I - 0x0168D2 05:A8C2: 00        .byte $00   ; 
- D 1 - I - 0x0168D3 05:A8C3: 00        .byte $00   ; 
- D 1 - I - 0x0168D4 05:A8C4: 00        .byte $00   ; 
- D 1 - I - 0x0168D5 05:A8C5: 00        .byte $00   ; 
- D 1 - I - 0x0168D6 05:A8C6: 00        .byte $00   ; 



_off018_07_A8C7_01:
- D 1 - I - 0x0168D7 05:A8C7: 0C        .byte $0C   ; 
- D 1 - I - 0x0168D8 05:A8C8: 0D        .byte $0D   ; 
- D 1 - I - 0x0168D9 05:A8C9: 0B        .byte $0B   ; 
- D 1 - I - 0x0168DA 05:A8CA: 0A        .byte $0A   ; 
- D 1 - I - 0x0168DB 05:A8CB: 0C        .byte $0C   ; 
- D 1 - I - 0x0168DC 05:A8CC: 0D        .byte $0D   ; 
- D 1 - I - 0x0168DD 05:A8CD: 0A        .byte $0A   ; 
- D 1 - I - 0x0168DE 05:A8CE: 0C        .byte $0C   ; 
- D 1 - I - 0x0168DF 05:A8CF: 0D        .byte $0D   ; 
- D 1 - I - 0x0168E0 05:A8D0: 0A        .byte $0A   ; 
- D 1 - I - 0x0168E1 05:A8D1: 0C        .byte $0C   ; 
- D 1 - I - 0x0168E2 05:A8D2: 0D        .byte $0D   ; 
- D 1 - I - 0x0168E3 05:A8D3: 0C        .byte $0C   ; 
- D 1 - I - 0x0168E4 05:A8D4: 0B        .byte $0B   ; 
- D 1 - I - 0x0168E5 05:A8D5: 0A        .byte $0A   ; 
- D 1 - I - 0x0168E6 05:A8D6: 71        .byte $71   ; 
- D 1 - I - 0x0168E7 05:A8D7: 0B        .byte $0B   ; 
- D 1 - I - 0x0168E8 05:A8D8: 0D        .byte $0D   ; 
- D 1 - I - 0x0168E9 05:A8D9: 4F        .byte $4F   ; 
- D 1 - I - 0x0168EA 05:A8DA: 0A        .byte $0A   ; 
- D 1 - I - 0x0168EB 05:A8DB: 0E        .byte $0E   ; 
- D 1 - I - 0x0168EC 05:A8DC: 70        .byte $70   ; 
- D 1 - I - 0x0168ED 05:A8DD: 72        .byte $72   ; 
- D 1 - I - 0x0168EE 05:A8DE: 75        .byte $75   ; 
- D 1 - I - 0x0168EF 05:A8DF: 0E        .byte $0E   ; 
- D 1 - I - 0x0168F0 05:A8E0: 0E        .byte $0E   ; 
- D 1 - I - 0x0168F1 05:A8E1: 0E        .byte $0E   ; 
- D 1 - I - 0x0168F2 05:A8E2: 00        .byte $00   ; 
- D 1 - I - 0x0168F3 05:A8E3: 00        .byte $00   ; 
- D 1 - I - 0x0168F4 05:A8E4: 71        .byte $71   ; 
- D 1 - I - 0x0168F5 05:A8E5: 75        .byte $75   ; 
- D 1 - I - 0x0168F6 05:A8E6: 79        .byte $79   ; 
- D 1 - I - 0x0168F7 05:A8E7: 00        .byte $00   ; 
- D 1 - I - 0x0168F8 05:A8E8: 00        .byte $00   ; 
- D 1 - I - 0x0168F9 05:A8E9: 00        .byte $00   ; 
- D 1 - I - 0x0168FA 05:A8EA: 00        .byte $00   ; 
- D 1 - I - 0x0168FB 05:A8EB: 00        .byte $00   ; 
- D 1 - I - 0x0168FC 05:A8EC: 78        .byte $78   ; 
- D 1 - I - 0x0168FD 05:A8ED: 7A        .byte $7A   ; 
- D 1 - I - 0x0168FE 05:A8EE: 7B        .byte $7B   ; 
- D 1 - I - 0x0168FF 05:A8EF: 09        .byte $09   ; 
- D 1 - I - 0x016900 05:A8F0: 09        .byte $09   ; 
- D 1 - I - 0x016901 05:A8F1: 09        .byte $09   ; 
- D 1 - I - 0x016902 05:A8F2: 09        .byte $09   ; 
- D 1 - I - 0x016903 05:A8F3: 09        .byte $09   ; 
- D 1 - I - 0x016904 05:A8F4: 09        .byte $09   ; 
- D 1 - I - 0x016905 05:A8F5: 09        .byte $09   ; 
- D 1 - I - 0x016906 05:A8F6: 09        .byte $09   ; 
- D 1 - I - 0x016907 05:A8F7: 0A        .byte $0A   ; 
- D 1 - I - 0x016908 05:A8F8: 0C        .byte $0C   ; 
- D 1 - I - 0x016909 05:A8F9: 0D        .byte $0D   ; 
- D 1 - I - 0x01690A 05:A8FA: 0B        .byte $0B   ; 
- D 1 - I - 0x01690B 05:A8FB: 0A        .byte $0A   ; 
- D 1 - I - 0x01690C 05:A8FC: 0C        .byte $0C   ; 
- D 1 - I - 0x01690D 05:A8FD: 0D        .byte $0D   ; 
- D 1 - I - 0x01690E 05:A8FE: 4F        .byte $4F   ; 
- D 1 - I - 0x01690F 05:A8FF: 0E        .byte $0E   ; 
- D 1 - I - 0x016910 05:A900: 0E        .byte $0E   ; 
- D 1 - I - 0x016911 05:A901: 0E        .byte $0E   ; 
- D 1 - I - 0x016912 05:A902: 0E        .byte $0E   ; 
- D 1 - I - 0x016913 05:A903: 0E        .byte $0E   ; 
- D 1 - I - 0x016914 05:A904: 0E        .byte $0E   ; 
- D 1 - I - 0x016915 05:A905: 0E        .byte $0E   ; 
- D 1 - I - 0x016916 05:A906: 0E        .byte $0E   ; 



_off018_07_A907_02:
- D 1 - I - 0x016917 05:A907: 0D        .byte $0D   ; 
- D 1 - I - 0x016918 05:A908: 0A        .byte $0A   ; 
- D 1 - I - 0x016919 05:A909: 0C        .byte $0C   ; 
- D 1 - I - 0x01691A 05:A90A: 0D        .byte $0D   ; 
- D 1 - I - 0x01691B 05:A90B: 0C        .byte $0C   ; 
- D 1 - I - 0x01691C 05:A90C: 0D        .byte $0D   ; 
- D 1 - I - 0x01691D 05:A90D: 4F        .byte $4F   ; 
- D 1 - I - 0x01691E 05:A90E: 7F        .byte $7F   ; 
- D 1 - I - 0x01691F 05:A90F: 72        .byte $72   ; 
- D 1 - I - 0x016920 05:A910: 00        .byte $00   ; 
- D 1 - I - 0x016921 05:A911: 0B        .byte $0B   ; 
- D 1 - I - 0x016922 05:A912: 0C        .byte $0C   ; 
- D 1 - I - 0x016923 05:A913: 0D        .byte $0D   ; 
- D 1 - I - 0x016924 05:A914: 0E        .byte $0E   ; 
- D 1 - I - 0x016925 05:A915: 0E        .byte $0E   ; 
- D 1 - I - 0x016926 05:A916: 7D        .byte $7D   ; 
- D 1 - I - 0x016927 05:A917: 76        .byte $76   ; 
- D 1 - I - 0x016928 05:A918: 7B        .byte $7B   ; 
- D 1 - I - 0x016929 05:A919: 0E        .byte $0E   ; 
- D 1 - I - 0x01692A 05:A91A: 0E        .byte $0E   ; 
- D 1 - I - 0x01692B 05:A91B: 0E        .byte $0E   ; 
- D 1 - I - 0x01692C 05:A91C: 00        .byte $00   ; 
- D 1 - I - 0x01692D 05:A91D: 79        .byte $79   ; 
- D 1 - I - 0x01692E 05:A91E: 75        .byte $75   ; 
- D 1 - I - 0x01692F 05:A91F: 7A        .byte $7A   ; 
- D 1 - I - 0x016930 05:A920: 7B        .byte $7B   ; 
- D 1 - I - 0x016931 05:A921: 00        .byte $00   ; 
- D 1 - I - 0x016932 05:A922: 00        .byte $00   ; 
- D 1 - I - 0x016933 05:A923: 00        .byte $00   ; 
- D 1 - I - 0x016934 05:A924: 00        .byte $00   ; 
- D 1 - I - 0x016935 05:A925: 00        .byte $00   ; 
- D 1 - I - 0x016936 05:A926: 79        .byte $79   ; 
- D 1 - I - 0x016937 05:A927: 00        .byte $00   ; 
- D 1 - I - 0x016938 05:A928: 00        .byte $00   ; 
- D 1 - I - 0x016939 05:A929: 00        .byte $00   ; 
- D 1 - I - 0x01693A 05:A92A: 00        .byte $00   ; 
- D 1 - I - 0x01693B 05:A92B: 00        .byte $00   ; 
- D 1 - I - 0x01693C 05:A92C: 0F        .byte $0F   ; 
- D 1 - I - 0x01693D 05:A92D: 1A        .byte $1A   ; 
- D 1 - I - 0x01693E 05:A92E: 04        .byte $04   ; 
- D 1 - I - 0x01693F 05:A92F: 09        .byte $09   ; 
- D 1 - I - 0x016940 05:A930: 09        .byte $09   ; 
- D 1 - I - 0x016941 05:A931: 09        .byte $09   ; 
- D 1 - I - 0x016942 05:A932: 09        .byte $09   ; 
- D 1 - I - 0x016943 05:A933: 50        .byte $50   ; 
- D 1 - I - 0x016944 05:A934: 10        .byte $10   ; 
- D 1 - I - 0x016945 05:A935: 1E        .byte $1E   ; 
- D 1 - I - 0x016946 05:A936: 08        .byte $08   ; 
- D 1 - I - 0x016947 05:A937: 0A        .byte $0A   ; 
- D 1 - I - 0x016948 05:A938: 4F        .byte $4F   ; 
- D 1 - I - 0x016949 05:A939: 0C        .byte $0C   ; 
- D 1 - I - 0x01694A 05:A93A: 0D        .byte $0D   ; 
- D 1 - I - 0x01694B 05:A93B: 54        .byte $54   ; 
- D 1 - I - 0x01694C 05:A93C: 14        .byte $14   ; 
- D 1 - I - 0x01694D 05:A93D: 13        .byte $13   ; 
- D 1 - I - 0x01694E 05:A93E: 00        .byte $00   ; 
- D 1 - I - 0x01694F 05:A93F: 0E        .byte $0E   ; 
- D 1 - I - 0x016950 05:A940: 0E        .byte $0E   ; 
- D 1 - I - 0x016951 05:A941: 0E        .byte $0E   ; 
- D 1 - I - 0x016952 05:A942: 0E        .byte $0E   ; 
- D 1 - I - 0x016953 05:A943: 13        .byte $13   ; 
- D 1 - I - 0x016954 05:A944: 00        .byte $00   ; 
- D 1 - I - 0x016955 05:A945: 00        .byte $00   ; 
- D 1 - I - 0x016956 05:A946: 00        .byte $00   ; 



_off018_07_A947_03:
- D 1 - I - 0x016957 05:A947: 0A        .byte $0A   ; 
- D 1 - I - 0x016958 05:A948: 0A        .byte $0A   ; 
- D 1 - I - 0x016959 05:A949: 0B        .byte $0B   ; 
- D 1 - I - 0x01695A 05:A94A: 0C        .byte $0C   ; 
- D 1 - I - 0x01695B 05:A94B: 0D        .byte $0D   ; 
- D 1 - I - 0x01695C 05:A94C: 0A        .byte $0A   ; 
- D 1 - I - 0x01695D 05:A94D: 0A        .byte $0A   ; 
- D 1 - I - 0x01695E 05:A94E: 0C        .byte $0C   ; 
- D 1 - I - 0x01695F 05:A94F: 72        .byte $72   ; 
- D 1 - I - 0x016960 05:A950: 00        .byte $00   ; 
- D 1 - I - 0x016961 05:A951: 00        .byte $00   ; 
- D 1 - I - 0x016962 05:A952: 0A        .byte $0A   ; 
- D 1 - I - 0x016963 05:A953: 0C        .byte $0C   ; 
- D 1 - I - 0x016964 05:A954: 0D        .byte $0D   ; 
- D 1 - I - 0x016965 05:A955: 4F        .byte $4F   ; 
- D 1 - I - 0x016966 05:A956: 0A        .byte $0A   ; 
- D 1 - I - 0x016967 05:A957: 76        .byte $76   ; 
- D 1 - I - 0x016968 05:A958: 71        .byte $71   ; 
- D 1 - I - 0x016969 05:A959: 00        .byte $00   ; 
- D 1 - I - 0x01696A 05:A95A: 00        .byte $00   ; 
- D 1 - I - 0x01696B 05:A95B: 0E        .byte $0E   ; 
- D 1 - I - 0x01696C 05:A95C: 0E        .byte $0E   ; 
- D 1 - I - 0x01696D 05:A95D: 0E        .byte $0E   ; 
- D 1 - I - 0x01696E 05:A95E: 70        .byte $70   ; 
- D 1 - I - 0x01696F 05:A95F: 77        .byte $77   ; 
- D 1 - I - 0x016970 05:A960: 79        .byte $79   ; 
- D 1 - I - 0x016971 05:A961: 00        .byte $00   ; 
- D 1 - I - 0x016972 05:A962: 00        .byte $00   ; 
- D 1 - I - 0x016973 05:A963: 00        .byte $00   ; 
- D 1 - I - 0x016974 05:A964: 00        .byte $00   ; 
- D 1 - I - 0x016975 05:A965: 70        .byte $70   ; 
- D 1 - I - 0x016976 05:A966: 76        .byte $76   ; 
- D 1 - I - 0x016977 05:A967: 01        .byte $01   ; 
- D 1 - I - 0x016978 05:A968: 02        .byte $02   ; 
- D 1 - I - 0x016979 05:A969: 47        .byte $47   ; 
- D 1 - I - 0x01697A 05:A96A: 03        .byte $03   ; 
- D 1 - I - 0x01697B 05:A96B: 22        .byte $22   ; 
- D 1 - I - 0x01697C 05:A96C: 17        .byte $17   ; 
- D 1 - I - 0x01697D 05:A96D: 79        .byte $79   ; 
- D 1 - I - 0x01697E 05:A96E: 75        .byte $75   ; 
- D 1 - I - 0x01697F 05:A96F: 05        .byte $05   ; 
- D 1 - I - 0x016980 05:A970: 06        .byte $06   ; 
- D 1 - I - 0x016981 05:A971: 4B        .byte $4B   ; 
- D 1 - I - 0x016982 05:A972: 07        .byte $07   ; 
- D 1 - I - 0x016983 05:A973: 26        .byte $26   ; 
- D 1 - I - 0x016984 05:A974: 21        .byte $21   ; 
- D 1 - I - 0x016985 05:A975: 23        .byte $23   ; 
- D 1 - I - 0x016986 05:A976: 7E        .byte $7E   ; 
- D 1 - I - 0x016987 05:A977: 00        .byte $00   ; 
- D 1 - I - 0x016988 05:A978: 79        .byte $79   ; 
- D 1 - I - 0x016989 05:A979: 71        .byte $71   ; 
- D 1 - I - 0x01698A 05:A97A: 73        .byte $73   ; 
- D 1 - I - 0x01698B 05:A97B: 29        .byte $29   ; 
- D 1 - I - 0x01698C 05:A97C: 25        .byte $25   ; 
- D 1 - I - 0x01698D 05:A97D: 27        .byte $27   ; 
- D 1 - I - 0x01698E 05:A97E: 21        .byte $21   ; 
- D 1 - I - 0x01698F 05:A97F: 00        .byte $00   ; 
- D 1 - I - 0x016990 05:A980: 00        .byte $00   ; 
- D 1 - I - 0x016991 05:A981: 74        .byte $74   ; 
- D 1 - I - 0x016992 05:A982: 75        .byte $75   ; 
- D 1 - I - 0x016993 05:A983: 76        .byte $76   ; 
- D 1 - I - 0x016994 05:A984: 73        .byte $73   ; 
- D 1 - I - 0x016995 05:A985: 29        .byte $29   ; 
- D 1 - I - 0x016996 05:A986: 25        .byte $25   ; 



_off018_07_A987_04:
- D 1 - I - 0x016997 05:A987: 0D        .byte $0D   ; 
- D 1 - I - 0x016998 05:A988: 0A        .byte $0A   ; 
- D 1 - I - 0x016999 05:A989: 7F        .byte $7F   ; 
- D 1 - I - 0x01699A 05:A98A: 0B        .byte $0B   ; 
- D 1 - I - 0x01699B 05:A98B: 0C        .byte $0C   ; 
- D 1 - I - 0x01699C 05:A98C: 0D        .byte $0D   ; 
- D 1 - I - 0x01699D 05:A98D: 7F        .byte $7F   ; 
- D 1 - I - 0x01699E 05:A98E: 73        .byte $73   ; 
- D 1 - I - 0x01699F 05:A98F: 0C        .byte $0C   ; 
- D 1 - I - 0x0169A0 05:A990: 4F        .byte $4F   ; 
- D 1 - I - 0x0169A1 05:A991: 0C        .byte $0C   ; 
- D 1 - I - 0x0169A2 05:A992: 0D        .byte $0D   ; 
- D 1 - I - 0x0169A3 05:A993: 4F        .byte $4F   ; 
- D 1 - I - 0x0169A4 05:A994: 7F        .byte $7F   ; 
- D 1 - I - 0x0169A5 05:A995: 76        .byte $76   ; 
- D 1 - I - 0x0169A6 05:A996: 77        .byte $77   ; 
- D 1 - I - 0x0169A7 05:A997: 71        .byte $71   ; 
- D 1 - I - 0x0169A8 05:A998: 73        .byte $73   ; 
- D 1 - I - 0x0169A9 05:A999: 00        .byte $00   ; 
- D 1 - I - 0x0169AA 05:A99A: 79        .byte $79   ; 
- D 1 - I - 0x0169AB 05:A99B: 75        .byte $75   ; 
- D 1 - I - 0x0169AC 05:A99C: 77        .byte $77   ; 
- D 1 - I - 0x0169AD 05:A99D: 7A        .byte $7A   ; 
- D 1 - I - 0x0169AE 05:A99E: 7B        .byte $7B   ; 
- D 1 - I - 0x0169AF 05:A99F: 44        .byte $44   ; 
- D 1 - I - 0x0169B0 05:A9A0: 45        .byte $45   ; 
- D 1 - I - 0x0169B1 05:A9A1: 45        .byte $45   ; 
- D 1 - I - 0x0169B2 05:A9A2: 46        .byte $46   ; 
- D 1 - I - 0x0169B3 05:A9A3: 79        .byte $79   ; 
- D 1 - I - 0x0169B4 05:A9A4: 7B        .byte $7B   ; 
- D 1 - I - 0x0169B5 05:A9A5: 00        .byte $00   ; 
- D 1 - I - 0x0169B6 05:A9A6: 00        .byte $00   ; 
- D 1 - I - 0x0169B7 05:A9A7: 6F        .byte $6F   ; 
- D 1 - I - 0x0169B8 05:A9A8: 09        .byte $09   ; 
- D 1 - I - 0x0169B9 05:A9A9: 09        .byte $09   ; 
- D 1 - I - 0x0169BA 05:A9AA: 41        .byte $41   ; 
- D 1 - I - 0x0169BB 05:A9AB: 00        .byte $00   ; 
- D 1 - I - 0x0169BC 05:A9AC: 00        .byte $00   ; 
- D 1 - I - 0x0169BD 05:A9AD: 2A        .byte $2A   ; 
- D 1 - I - 0x0169BE 05:A9AE: 00        .byte $00   ; 
- D 1 - I - 0x0169BF 05:A9AF: 0E        .byte $0E   ; 
- D 1 - I - 0x0169C0 05:A9B0: 0E        .byte $0E   ; 
- D 1 - I - 0x0169C1 05:A9B1: 0E        .byte $0E   ; 
- D 1 - I - 0x0169C2 05:A9B2: 0E        .byte $0E   ; 
- D 1 - I - 0x0169C3 05:A9B3: 0F        .byte $0F   ; 
- D 1 - I - 0x0169C4 05:A9B4: 19        .byte $19   ; 
- D 1 - I - 0x0169C5 05:A9B5: 2E        .byte $2E   ; 
- D 1 - I - 0x0169C6 05:A9B6: 71        .byte $71   ; 
- D 1 - I - 0x0169C7 05:A9B7: 01        .byte $01   ; 
- D 1 - I - 0x0169C8 05:A9B8: 01        .byte $01   ; 
- D 1 - I - 0x0169C9 05:A9B9: 02        .byte $02   ; 
- D 1 - I - 0x0169CA 05:A9BA: 03        .byte $03   ; 
- D 1 - I - 0x0169CB 05:A9BB: 10        .byte $10   ; 
- D 1 - I - 0x0169CC 05:A9BC: 1D        .byte $1D   ; 
- D 1 - I - 0x0169CD 05:A9BD: 16        .byte $16   ; 
- D 1 - I - 0x0169CE 05:A9BE: 75        .byte $75   ; 
- D 1 - I - 0x0169CF 05:A9BF: 05        .byte $05   ; 
- D 1 - I - 0x0169D0 05:A9C0: 05        .byte $05   ; 
- D 1 - I - 0x0169D1 05:A9C1: 06        .byte $06   ; 
- D 1 - I - 0x0169D2 05:A9C2: 07        .byte $07   ; 
- D 1 - I - 0x0169D3 05:A9C3: 14        .byte $14   ; 
- D 1 - I - 0x0169D4 05:A9C4: 13        .byte $13   ; 
- D 1 - I - 0x0169D5 05:A9C5: 71        .byte $71   ; 
- D 1 - I - 0x0169D6 05:A9C6: 75        .byte $75   ; 



_off018_07_A9C7_05:
- D 1 - I - 0x0169D7 05:A9C7: 00        .byte $00   ; 
- D 1 - I - 0x0169D8 05:A9C8: 00        .byte $00   ; 
- D 1 - I - 0x0169D9 05:A9C9: 00        .byte $00   ; 
- D 1 - I - 0x0169DA 05:A9CA: 00        .byte $00   ; 
- D 1 - I - 0x0169DB 05:A9CB: 00        .byte $00   ; 
- D 1 - I - 0x0169DC 05:A9CC: 00        .byte $00   ; 
- D 1 - I - 0x0169DD 05:A9CD: 0F        .byte $0F   ; 
- D 1 - I - 0x0169DE 05:A9CE: 50        .byte $50   ; 
- D 1 - I - 0x0169DF 05:A9CF: 00        .byte $00   ; 
- D 1 - I - 0x0169E0 05:A9D0: 00        .byte $00   ; 
- D 1 - I - 0x0169E1 05:A9D1: 00        .byte $00   ; 
- D 1 - I - 0x0169E2 05:A9D2: 00        .byte $00   ; 
- D 1 - I - 0x0169E3 05:A9D3: 2A        .byte $2A   ; 
- D 1 - I - 0x0169E4 05:A9D4: 00        .byte $00   ; 
- D 1 - I - 0x0169E5 05:A9D5: 38        .byte $38   ; 
- D 1 - I - 0x0169E6 05:A9D6: 54        .byte $54   ; 
- D 1 - I - 0x0169E7 05:A9D7: 00        .byte $00   ; 
- D 1 - I - 0x0169E8 05:A9D8: 70        .byte $70   ; 
- D 1 - I - 0x0169E9 05:A9D9: 33        .byte $33   ; 
- D 1 - I - 0x0169EA 05:A9DA: 71        .byte $71   ; 
- D 1 - I - 0x0169EB 05:A9DB: 2B        .byte $2B   ; 
- D 1 - I - 0x0169EC 05:A9DC: 00        .byte $00   ; 
- D 1 - I - 0x0169ED 05:A9DD: 3C        .byte $3C   ; 
- D 1 - I - 0x0169EE 05:A9DE: 13        .byte $13   ; 
- D 1 - I - 0x0169EF 05:A9DF: 32        .byte $32   ; 
- D 1 - I - 0x0169F0 05:A9E0: 50        .byte $50   ; 
- D 1 - I - 0x0169F1 05:A9E1: 37        .byte $37   ; 
- D 1 - I - 0x0169F2 05:A9E2: 76        .byte $76   ; 
- D 1 - I - 0x0169F3 05:A9E3: 2F        .byte $2F   ; 
- D 1 - I - 0x0169F4 05:A9E4: 00        .byte $00   ; 
- D 1 - I - 0x0169F5 05:A9E5: 00        .byte $00   ; 
- D 1 - I - 0x0169F6 05:A9E6: 00        .byte $00   ; 
- D 1 - I - 0x0169F7 05:A9E7: 36        .byte $36   ; 
- D 1 - I - 0x0169F8 05:A9E8: 54        .byte $54   ; 
- D 1 - I - 0x0169F9 05:A9E9: 16        .byte $16   ; 
- D 1 - I - 0x0169FA 05:A9EA: 7C        .byte $7C   ; 
- D 1 - I - 0x0169FB 05:A9EB: 79        .byte $79   ; 
- D 1 - I - 0x0169FC 05:A9EC: 70        .byte $70   ; 
- D 1 - I - 0x0169FD 05:A9ED: 71        .byte $71   ; 
- D 1 - I - 0x0169FE 05:A9EE: 72        .byte $72   ; 
- D 1 - I - 0x0169FF 05:A9EF: 35        .byte $35   ; 
- D 1 - I - 0x016A00 05:A9F0: 13        .byte $13   ; 
- D 1 - I - 0x016A01 05:A9F1: 00        .byte $00   ; 
- D 1 - I - 0x016A02 05:A9F2: 00        .byte $00   ; 
- D 1 - I - 0x016A03 05:A9F3: 00        .byte $00   ; 
- D 1 - I - 0x016A04 05:A9F4: 74        .byte $74   ; 
- D 1 - I - 0x016A05 05:A9F5: 75        .byte $75   ; 
- D 1 - I - 0x016A06 05:A9F6: 76        .byte $76   ; 
- D 1 - I - 0x016A07 05:A9F7: 72        .byte $72   ; 
- D 1 - I - 0x016A08 05:A9F8: 00        .byte $00   ; 
- D 1 - I - 0x016A09 05:A9F9: 00        .byte $00   ; 
- D 1 - I - 0x016A0A 05:A9FA: 00        .byte $00   ; 
- D 1 - I - 0x016A0B 05:A9FB: 00        .byte $00   ; 
- D 1 - I - 0x016A0C 05:A9FC: 00        .byte $00   ; 
- D 1 - I - 0x016A0D 05:A9FD: 74        .byte $74   ; 
- D 1 - I - 0x016A0E 05:A9FE: 75        .byte $75   ; 
- D 1 - I - 0x016A0F 05:A9FF: 76        .byte $76   ; 
- D 1 - I - 0x016A10 05:AA00: 71        .byte $71   ; 
- D 1 - I - 0x016A11 05:AA01: 00        .byte $00   ; 
- D 1 - I - 0x016A12 05:AA02: 00        .byte $00   ; 
- D 1 - I - 0x016A13 05:AA03: 00        .byte $00   ; 
- D 1 - I - 0x016A14 05:AA04: 00        .byte $00   ; 
- D 1 - I - 0x016A15 05:AA05: 00        .byte $00   ; 
- - - - - - 0x016A16 05:AA06: 7A        .byte $7A   ; 



_off018_07_AA07_06:
- D 1 - I - 0x016A17 05:AA07: 10        .byte $10   ; 
- D 1 - I - 0x016A18 05:AA08: 1D        .byte $1D   ; 
- D 1 - I - 0x016A19 05:AA09: 16        .byte $16   ; 
- D 1 - I - 0x016A1A 05:AA0A: 0E        .byte $0E   ; 
- D 1 - I - 0x016A1B 05:AA0B: 0E        .byte $0E   ; 
- D 1 - I - 0x016A1C 05:AA0C: 0E        .byte $0E   ; 
- D 1 - I - 0x016A1D 05:AA0D: 0E        .byte $0E   ; 
- D 1 - I - 0x016A1E 05:AA0E: 0E        .byte $0E   ; 
- D 1 - I - 0x016A1F 05:AA0F: 14        .byte $14   ; 
- D 1 - I - 0x016A20 05:AA10: 00        .byte $00   ; 
- D 1 - I - 0x016A21 05:AA11: 00        .byte $00   ; 
- D 1 - I - 0x016A22 05:AA12: 00        .byte $00   ; 
- D 1 - I - 0x016A23 05:AA13: 00        .byte $00   ; 
- D 1 - I - 0x016A24 05:AA14: 00        .byte $00   ; 
- D 1 - I - 0x016A25 05:AA15: 00        .byte $00   ; 
- D 1 - I - 0x016A26 05:AA16: 00        .byte $00   ; 
- D 1 - I - 0x016A27 05:AA17: 00        .byte $00   ; 
- D 1 - I - 0x016A28 05:AA18: 00        .byte $00   ; 
- D 1 - I - 0x016A29 05:AA19: 00        .byte $00   ; 
- D 1 - I - 0x016A2A 05:AA1A: 00        .byte $00   ; 
- D 1 - I - 0x016A2B 05:AA1B: 00        .byte $00   ; 
- D 1 - I - 0x016A2C 05:AA1C: 00        .byte $00   ; 
- D 1 - I - 0x016A2D 05:AA1D: 00        .byte $00   ; 
- D 1 - I - 0x016A2E 05:AA1E: 00        .byte $00   ; 
- D 1 - I - 0x016A2F 05:AA1F: 00        .byte $00   ; 
- D 1 - I - 0x016A30 05:AA20: 00        .byte $00   ; 
- D 1 - I - 0x016A31 05:AA21: 00        .byte $00   ; 
- D 1 - I - 0x016A32 05:AA22: 00        .byte $00   ; 
- D 1 - I - 0x016A33 05:AA23: 00        .byte $00   ; 
- D 1 - I - 0x016A34 05:AA24: 00        .byte $00   ; 
- D 1 - I - 0x016A35 05:AA25: 00        .byte $00   ; 
- - - - - - 0x016A36 05:AA26: 00        .byte $00   ; 
- D 1 - I - 0x016A37 05:AA27: 73        .byte $73   ; 
- D 1 - I - 0x016A38 05:AA28: 00        .byte $00   ; 
- D 1 - I - 0x016A39 05:AA29: 00        .byte $00   ; 
- D 1 - I - 0x016A3A 05:AA2A: 00        .byte $00   ; 
- D 1 - I - 0x016A3B 05:AA2B: 00        .byte $00   ; 
- - - - - - 0x016A3C 05:AA2C: 00        .byte $00   ; 
- - - - - - 0x016A3D 05:AA2D: 00        .byte $00   ; 
- - - - - - 0x016A3E 05:AA2E: 00        .byte $00   ; 
- D 1 - I - 0x016A3F 05:AA2F: 77        .byte $77   ; 
- D 1 - I - 0x016A40 05:AA30: 00        .byte $00   ; 
- - - - - - 0x016A41 05:AA31: 00        .byte $00   ; 
- - - - - - 0x016A42 05:AA32: 00        .byte $00   ; 
- - - - - - 0x016A43 05:AA33: 00        .byte $00   ; 
- - - - - - 0x016A44 05:AA34: 00        .byte $00   ; 
- - - - - - 0x016A45 05:AA35: 00        .byte $00   ; 
- - - - - - 0x016A46 05:AA36: 00        .byte $00   ; 
- D 1 - I - 0x016A47 05:AA37: 76        .byte $76   ; 
- - - - - - 0x016A48 05:AA38: 73        .byte $73   ; 
- - - - - - 0x016A49 05:AA39: 00        .byte $00   ; 
- - - - - - 0x016A4A 05:AA3A: 00        .byte $00   ; 
- - - - - - 0x016A4B 05:AA3B: 00        .byte $00   ; 
- - - - - - 0x016A4C 05:AA3C: 00        .byte $00   ; 
- - - - - - 0x016A4D 05:AA3D: 00        .byte $00   ; 
- - - - - - 0x016A4E 05:AA3E: 00        .byte $00   ; 
- - - - - - 0x016A4F 05:AA3F: 7A        .byte $7A   ; 
- - - - - - 0x016A50 05:AA40: 7B        .byte $7B   ; 
- - - - - - 0x016A51 05:AA41: 00        .byte $00   ; 
- - - - - - 0x016A52 05:AA42: 00        .byte $00   ; 
- - - - - - 0x016A53 05:AA43: 00        .byte $00   ; 
- - - - - - 0x016A54 05:AA44: 00        .byte $00   ; 
- - - - - - 0x016A55 05:AA45: 00        .byte $00   ; 
- - - - - - 0x016A56 05:AA46: 00        .byte $00   ; 



_off018_07_AA47_07:
- - - - - - 0x016A57 05:AA47: 00        .byte $00   ; 
- - - - - - 0x016A58 05:AA48: 00        .byte $00   ; 
- - - - - - 0x016A59 05:AA49: 00        .byte $00   ; 
- - - - - - 0x016A5A 05:AA4A: 00        .byte $00   ; 
- - - - - - 0x016A5B 05:AA4B: 00        .byte $00   ; 
- - - - - - 0x016A5C 05:AA4C: 00        .byte $00   ; 
- - - - - - 0x016A5D 05:AA4D: 00        .byte $00   ; 
- - - - - - 0x016A5E 05:AA4E: 00        .byte $00   ; 
- - - - - - 0x016A5F 05:AA4F: 00        .byte $00   ; 
- - - - - - 0x016A60 05:AA50: 00        .byte $00   ; 
- - - - - - 0x016A61 05:AA51: 00        .byte $00   ; 
- - - - - - 0x016A62 05:AA52: 00        .byte $00   ; 
- - - - - - 0x016A63 05:AA53: 00        .byte $00   ; 
- - - - - - 0x016A64 05:AA54: 00        .byte $00   ; 
- - - - - - 0x016A65 05:AA55: 00        .byte $00   ; 
- - - - - - 0x016A66 05:AA56: 00        .byte $00   ; 
- - - - - - 0x016A67 05:AA57: 00        .byte $00   ; 
- - - - - - 0x016A68 05:AA58: 00        .byte $00   ; 
- - - - - - 0x016A69 05:AA59: 00        .byte $00   ; 
- - - - - - 0x016A6A 05:AA5A: 00        .byte $00   ; 
- - - - - - 0x016A6B 05:AA5B: 00        .byte $00   ; 
- - - - - - 0x016A6C 05:AA5C: 00        .byte $00   ; 
- - - - - - 0x016A6D 05:AA5D: 00        .byte $00   ; 
- - - - - - 0x016A6E 05:AA5E: 69        .byte $69   ; 
- - - - - - 0x016A6F 05:AA5F: 00        .byte $00   ; 
- - - - - - 0x016A70 05:AA60: 00        .byte $00   ; 
- - - - - - 0x016A71 05:AA61: 00        .byte $00   ; 
- - - - - - 0x016A72 05:AA62: 00        .byte $00   ; 
- - - - - - 0x016A73 05:AA63: 00        .byte $00   ; 
- - - - - - 0x016A74 05:AA64: 00        .byte $00   ; 
- - - - - - 0x016A75 05:AA65: 69        .byte $69   ; 
- - - - - - 0x016A76 05:AA66: 69        .byte $69   ; 
- - - - - - 0x016A77 05:AA67: 00        .byte $00   ; 
- - - - - - 0x016A78 05:AA68: 00        .byte $00   ; 
- - - - - - 0x016A79 05:AA69: 00        .byte $00   ; 
- - - - - - 0x016A7A 05:AA6A: 00        .byte $00   ; 
- - - - - - 0x016A7B 05:AA6B: 00        .byte $00   ; 
- - - - - - 0x016A7C 05:AA6C: 65        .byte $65   ; 
- - - - - - 0x016A7D 05:AA6D: 67        .byte $67   ; 
- D 1 - I - 0x016A7E 05:AA6E: 69        .byte $69   ; 
- - - - - - 0x016A7F 05:AA6F: 00        .byte $00   ; 
- - - - - - 0x016A80 05:AA70: 00        .byte $00   ; 
- - - - - - 0x016A81 05:AA71: 00        .byte $00   ; 
- - - - - - 0x016A82 05:AA72: 00        .byte $00   ; 
- - - - - - 0x016A83 05:AA73: 69        .byte $69   ; 
- - - - - - 0x016A84 05:AA74: 06        .byte $06   ; 
- D 1 - I - 0x016A85 05:AA75: 07        .byte $07   ; 
- D 1 - I - 0x016A86 05:AA76: 65        .byte $65   ; 
- - - - - - 0x016A87 05:AA77: 00        .byte $00   ; 
- - - - - - 0x016A88 05:AA78: 05        .byte $05   ; 
- - - - - - 0x016A89 05:AA79: 69        .byte $69   ; 
- - - - - - 0x016A8A 05:AA7A: 63        .byte $63   ; 
- D 1 - I - 0x016A8B 05:AA7B: 65        .byte $65   ; 
- D 1 - I - 0x016A8C 05:AA7C: 67        .byte $67   ; 
- D 1 - I - 0x016A8D 05:AA7D: 69        .byte $69   ; 
- D 1 - I - 0x016A8E 05:AA7E: 06        .byte $06   ; 
- - - - - - 0x016A8F 05:AA7F: 05        .byte $05   ; 
- - - - - - 0x016A90 05:AA80: 05        .byte $05   ; 
- - - - - - 0x016A91 05:AA81: 05        .byte $05   ; 
- - - - - - 0x016A92 05:AA82: 08        .byte $08   ; 
- D 1 - I - 0x016A93 05:AA83: 06        .byte $06   ; 
- D 1 - I - 0x016A94 05:AA84: 07        .byte $07   ; 
- D 1 - I - 0x016A95 05:AA85: 05        .byte $05   ; 
- D 1 - I - 0x016A96 05:AA86: 05        .byte $05   ; 



_off018_07_AA87_08:
- - - - - - 0x016A97 05:AA87: 00        .byte $00   ; 
- - - - - - 0x016A98 05:AA88: 05        .byte $05   ; 
- - - - - - 0x016A99 05:AA89: 05        .byte $05   ; 
- - - - - - 0x016A9A 05:AA8A: 69        .byte $69   ; 
- - - - - - 0x016A9B 05:AA8B: 65        .byte $65   ; 
- - - - - - 0x016A9C 05:AA8C: 67        .byte $67   ; 
- - - - - - 0x016A9D 05:AA8D: 05        .byte $05   ; 
- - - - - - 0x016A9E 05:AA8E: 05        .byte $05   ; 
- - - - - - 0x016A9F 05:AA8F: 05        .byte $05   ; 
- - - - - - 0x016AA0 05:AA90: 67        .byte $67   ; 
- - - - - - 0x016AA1 05:AA91: 69        .byte $69   ; 
- - - - - - 0x016AA2 05:AA92: 67        .byte $67   ; 
- - - - - - 0x016AA3 05:AA93: 64        .byte $64   ; 
- - - - - - 0x016AA4 05:AA94: 07        .byte $07   ; 
- - - - - - 0x016AA5 05:AA95: 69        .byte $69   ; 
- D 1 - I - 0x016AA6 05:AA96: 00        .byte $00   ; 
- - - - - - 0x016AA7 05:AA97: 65        .byte $65   ; 
- - - - - - 0x016AA8 05:AA98: 68        .byte $68   ; 
- - - - - - 0x016AA9 05:AA99: 69        .byte $69   ; 
- - - - - - 0x016AAA 05:AA9A: 07        .byte $07   ; 
- D 1 - I - 0x016AAB 05:AA9B: 08        .byte $08   ; 
- D 1 - I - 0x016AAC 05:AA9C: 05        .byte $05   ; 
- D 1 - I - 0x016AAD 05:AA9D: 70        .byte $70   ; 
- D 1 - I - 0x016AAE 05:AA9E: 71        .byte $71   ; 
- - - - - - 0x016AAF 05:AA9F: 64        .byte $64   ; 
- - - - - - 0x016AB0 05:AAA0: 07        .byte $07   ; 
- D 1 - I - 0x016AB1 05:AAA1: 65        .byte $65   ; 
- D 1 - I - 0x016AB2 05:AAA2: 67        .byte $67   ; 
- D 1 - I - 0x016AB3 05:AAA3: 69        .byte $69   ; 
- D 1 - I - 0x016AB4 05:AAA4: 00        .byte $00   ; 
- D 1 - I - 0x016AB5 05:AAA5: 74        .byte $74   ; 
- D 1 - I - 0x016AB6 05:AAA6: 76        .byte $76   ; 
- D 1 - I - 0x016AB7 05:AAA7: 08        .byte $08   ; 
- D 1 - I - 0x016AB8 05:AAA8: 69        .byte $69   ; 
- D 1 - I - 0x016AB9 05:AAA9: 06        .byte $06   ; 
- D 1 - I - 0x016ABA 05:AAAA: 07        .byte $07   ; 
- D 1 - I - 0x016ABB 05:AAAB: 00        .byte $00   ; 
- D 1 - I - 0x016ABC 05:AAAC: 00        .byte $00   ; 
- D 1 - I - 0x016ABD 05:AAAD: 79        .byte $79   ; 
- D 1 - I - 0x016ABE 05:AAAE: 7A        .byte $7A   ; 
- D 1 - I - 0x016ABF 05:AAAF: 67        .byte $67   ; 
- D 1 - I - 0x016AC0 05:AAB0: 63        .byte $63   ; 
- D 1 - I - 0x016AC1 05:AAB1: 00        .byte $00   ; 
- D 1 - I - 0x016AC2 05:AAB2: 00        .byte $00   ; 
- D 1 - I - 0x016AC3 05:AAB3: 00        .byte $00   ; 
- D 1 - I - 0x016AC4 05:AAB4: 00        .byte $00   ; 
- D 1 - I - 0x016AC5 05:AAB5: 00        .byte $00   ; 
- D 1 - I - 0x016AC6 05:AAB6: 00        .byte $00   ; 
- D 1 - I - 0x016AC7 05:AAB7: 07        .byte $07   ; 
- D 1 - I - 0x016AC8 05:AAB8: 08        .byte $08   ; 
- D 1 - I - 0x016AC9 05:AAB9: 69        .byte $69   ; 
- D 1 - I - 0x016ACA 05:AABA: 00        .byte $00   ; 
- D 1 - I - 0x016ACB 05:AABB: 00        .byte $00   ; 
- D 1 - I - 0x016ACC 05:AABC: 00        .byte $00   ; 
- D 1 - I - 0x016ACD 05:AABD: 00        .byte $00   ; 
- D 1 - I - 0x016ACE 05:AABE: 00        .byte $00   ; 
- D 1 - I - 0x016ACF 05:AABF: 05        .byte $05   ; 
- D 1 - I - 0x016AD0 05:AAC0: 00        .byte $00   ; 
- D 1 - I - 0x016AD1 05:AAC1: 00        .byte $00   ; 
- D 1 - I - 0x016AD2 05:AAC2: 00        .byte $00   ; 
- D 1 - I - 0x016AD3 05:AAC3: 00        .byte $00   ; 
- D 1 - I - 0x016AD4 05:AAC4: 00        .byte $00   ; 
- D 1 - I - 0x016AD5 05:AAC5: 00        .byte $00   ; 
- D 1 - I - 0x016AD6 05:AAC6: 00        .byte $00   ; 



_off018_07_AAC7_09:
- D 1 - I - 0x016AD7 05:AAC7: 05        .byte $05   ; 
- D 1 - I - 0x016AD8 05:AAC8: 00        .byte $00   ; 
- D 1 - I - 0x016AD9 05:AAC9: 00        .byte $00   ; 
- D 1 - I - 0x016ADA 05:AACA: 70        .byte $70   ; 
- D 1 - I - 0x016ADB 05:AACB: 71        .byte $71   ; 
- D 1 - I - 0x016ADC 05:AACC: 72        .byte $72   ; 
- D 1 - I - 0x016ADD 05:AACD: 00        .byte $00   ; 
- D 1 - I - 0x016ADE 05:AACE: 00        .byte $00   ; 
- D 1 - I - 0x016ADF 05:AACF: 00        .byte $00   ; 
- D 1 - I - 0x016AE0 05:AAD0: 00        .byte $00   ; 
- D 1 - I - 0x016AE1 05:AAD1: 00        .byte $00   ; 
- D 1 - I - 0x016AE2 05:AAD2: 76        .byte $76   ; 
- D 1 - I - 0x016AE3 05:AAD3: 75        .byte $75   ; 
- D 1 - I - 0x016AE4 05:AAD4: 76        .byte $76   ; 
- D 1 - I - 0x016AE5 05:AAD5: 72        .byte $72   ; 
- D 1 - I - 0x016AE6 05:AAD6: 00        .byte $00   ; 
- D 1 - I - 0x016AE7 05:AAD7: 72        .byte $72   ; 
- D 1 - I - 0x016AE8 05:AAD8: 73        .byte $73   ; 
- D 1 - I - 0x016AE9 05:AAD9: 2D        .byte $2D   ; 
- D 1 - I - 0x016AEA 05:AADA: 79        .byte $79   ; 
- D 1 - I - 0x016AEB 05:AADB: 42        .byte $42   ; 
- D 1 - I - 0x016AEC 05:AADC: 02        .byte $02   ; 
- D 1 - I - 0x016AED 05:AADD: 03        .byte $03   ; 
- D 1 - I - 0x016AEE 05:AADE: 04        .byte $04   ; 
- D 1 - I - 0x016AEF 05:AADF: 75        .byte $75   ; 
- D 1 - I - 0x016AF0 05:AAE0: 76        .byte $76   ; 
- D 1 - I - 0x016AF1 05:AAE1: 20        .byte $20   ; 
- D 1 - I - 0x016AF2 05:AAE2: 58        .byte $58   ; 
- D 1 - I - 0x016AF3 05:AAE3: 43        .byte $43   ; 
- D 1 - I - 0x016AF4 05:AAE4: 06        .byte $06   ; 
- D 1 - I - 0x016AF5 05:AAE5: 07        .byte $07   ; 
- D 1 - I - 0x016AF6 05:AAE6: 08        .byte $08   ; 
- D 1 - I - 0x016AF7 05:AAE7: 79        .byte $79   ; 
- D 1 - I - 0x016AF8 05:AAE8: 7A        .byte $7A   ; 
- D 1 - I - 0x016AF9 05:AAE9: 24        .byte $24   ; 
- D 1 - I - 0x016AFA 05:AAEA: 5C        .byte $5C   ; 
- D 1 - I - 0x016AFB 05:AAEB: 20        .byte $20   ; 
- D 1 - I - 0x016AFC 05:AAEC: 3B        .byte $3B   ; 
- D 1 - I - 0x016AFD 05:AAED: 00        .byte $00   ; 
- D 1 - I - 0x016AFE 05:AAEE: 71        .byte $71   ; 
- D 1 - I - 0x016AFF 05:AAEF: 00        .byte $00   ; 
- D 1 - I - 0x016B00 05:AAF0: 00        .byte $00   ; 
- D 1 - I - 0x016B01 05:AAF1: 00        .byte $00   ; 
- D 1 - I - 0x016B02 05:AAF2: 29        .byte $29   ; 
- D 1 - I - 0x016B03 05:AAF3: 24        .byte $24   ; 
- D 1 - I - 0x016B04 05:AAF4: 3F        .byte $3F   ; 
- D 1 - I - 0x016B05 05:AAF5: 70        .byte $70   ; 
- D 1 - I - 0x016B06 05:AAF6: 6D        .byte $6D   ; 
- D 1 - I - 0x016B07 05:AAF7: 00        .byte $00   ; 
- D 1 - I - 0x016B08 05:AAF8: 0F        .byte $0F   ; 
- D 1 - I - 0x016B09 05:AAF9: 1A        .byte $1A   ; 
- D 1 - I - 0x016B0A 05:AAFA: 01        .byte $01   ; 
- D 1 - I - 0x016B0B 05:AAFB: 01        .byte $01   ; 
- D 1 - I - 0x016B0C 05:AAFC: 04        .byte $04   ; 
- D 1 - I - 0x016B0D 05:AAFD: 02        .byte $02   ; 
- D 1 - I - 0x016B0E 05:AAFE: 6A        .byte $6A   ; 
- D 1 - I - 0x016B0F 05:AAFF: 18        .byte $18   ; 
- D 1 - I - 0x016B10 05:AB00: 11        .byte $11   ; 
- D 1 - I - 0x016B11 05:AB01: 1E        .byte $1E   ; 
- D 1 - I - 0x016B12 05:AB02: 05        .byte $05   ; 
- D 1 - I - 0x016B13 05:AB03: 05        .byte $05   ; 
- D 1 - I - 0x016B14 05:AB04: 08        .byte $08   ; 
- D 1 - I - 0x016B15 05:AB05: 06        .byte $06   ; 
- D 1 - I - 0x016B16 05:AB06: 07        .byte $07   ; 



_off018_07_AB07_0A:
- D 1 - I - 0x016B17 05:AB07: 29        .byte $29   ; 
- D 1 - I - 0x016B18 05:AB08: 1F        .byte $1F   ; 
- D 1 - I - 0x016B19 05:AB09: 2C        .byte $2C   ; 
- D 1 - I - 0x016B1A 05:AB0A: 20        .byte $20   ; 
- D 1 - I - 0x016B1B 05:AB0B: 3B        .byte $3B   ; 
- D 1 - I - 0x016B1C 05:AB0C: 00        .byte $00   ; 
- D 1 - I - 0x016B1D 05:AB0D: 70        .byte $70   ; 
- D 1 - I - 0x016B1E 05:AB0E: 71        .byte $71   ; 
- D 1 - I - 0x016B1F 05:AB0F: 00        .byte $00   ; 
- D 1 - I - 0x016B20 05:AB10: 00        .byte $00   ; 
- D 1 - I - 0x016B21 05:AB11: 29        .byte $29   ; 
- D 1 - I - 0x016B22 05:AB12: 24        .byte $24   ; 
- D 1 - I - 0x016B23 05:AB13: 3F        .byte $3F   ; 
- D 1 - I - 0x016B24 05:AB14: 6D        .byte $6D   ; 
- D 1 - I - 0x016B25 05:AB15: 74        .byte $74   ; 
- D 1 - I - 0x016B26 05:AB16: 75        .byte $75   ; 
- D 1 - I - 0x016B27 05:AB17: 02        .byte $02   ; 
- D 1 - I - 0x016B28 05:AB18: 03        .byte $03   ; 
- D 1 - I - 0x016B29 05:AB19: 04        .byte $04   ; 
- D 1 - I - 0x016B2A 05:AB1A: 01        .byte $01   ; 
- D 1 - I - 0x016B2B 05:AB1B: 02        .byte $02   ; 
- D 1 - I - 0x016B2C 05:AB1C: 6A        .byte $6A   ; 
- D 1 - I - 0x016B2D 05:AB1D: 6B        .byte $6B   ; 
- D 1 - I - 0x016B2E 05:AB1E: 78        .byte $78   ; 
- D 1 - I - 0x016B2F 05:AB1F: 06        .byte $06   ; 
- D 1 - I - 0x016B30 05:AB20: 07        .byte $07   ; 
- D 1 - I - 0x016B31 05:AB21: 08        .byte $08   ; 
- D 1 - I - 0x016B32 05:AB22: 05        .byte $05   ; 
- D 1 - I - 0x016B33 05:AB23: 06        .byte $06   ; 
- D 1 - I - 0x016B34 05:AB24: 07        .byte $07   ; 
- D 1 - I - 0x016B35 05:AB25: 69        .byte $69   ; 
- D 1 - I - 0x016B36 05:AB26: 69        .byte $69   ; 
- D 1 - I - 0x016B37 05:AB27: 70        .byte $70   ; 
- D 1 - I - 0x016B38 05:AB28: 72        .byte $72   ; 
- D 1 - I - 0x016B39 05:AB29: 71        .byte $71   ; 
- D 1 - I - 0x016B3A 05:AB2A: 72        .byte $72   ; 
- D 1 - I - 0x016B3B 05:AB2B: 71        .byte $71   ; 
- D 1 - I - 0x016B3C 05:AB2C: 72        .byte $72   ; 
- D 1 - I - 0x016B3D 05:AB2D: 00        .byte $00   ; 
- D 1 - I - 0x016B3E 05:AB2E: 00        .byte $00   ; 
- D 1 - I - 0x016B3F 05:AB2F: 74        .byte $74   ; 
- D 1 - I - 0x016B40 05:AB30: 76        .byte $76   ; 
- D 1 - I - 0x016B41 05:AB31: 75        .byte $75   ; 
- D 1 - I - 0x016B42 05:AB32: 76        .byte $76   ; 
- D 1 - I - 0x016B43 05:AB33: 75        .byte $75   ; 
- D 1 - I - 0x016B44 05:AB34: 77        .byte $77   ; 
- D 1 - I - 0x016B45 05:AB35: 00        .byte $00   ; 
- D 1 - I - 0x016B46 05:AB36: 00        .byte $00   ; 
- D 1 - I - 0x016B47 05:AB37: 6B        .byte $6B   ; 
- D 1 - I - 0x016B48 05:AB38: 79        .byte $79   ; 
- D 1 - I - 0x016B49 05:AB39: 7A        .byte $7A   ; 
- - - - - - 0x016B4A 05:AB3A: 79        .byte $79   ; 
- - - - - - 0x016B4B 05:AB3B: 7B        .byte $7B   ; 
- - - - - - 0x016B4C 05:AB3C: 00        .byte $00   ; 
- - - - - - 0x016B4D 05:AB3D: 00        .byte $00   ; 
- - - - - - 0x016B4E 05:AB3E: 00        .byte $00   ; 
- D 1 - I - 0x016B4F 05:AB3F: 05        .byte $05   ; 
- D 1 - I - 0x016B50 05:AB40: 00        .byte $00   ; 
- D 1 - I - 0x016B51 05:AB41: 00        .byte $00   ; 
- - - - - - 0x016B52 05:AB42: 00        .byte $00   ; 
- - - - - - 0x016B53 05:AB43: 00        .byte $00   ; 
- - - - - - 0x016B54 05:AB44: 00        .byte $00   ; 
- - - - - - 0x016B55 05:AB45: 00        .byte $00   ; 
- - - - - - 0x016B56 05:AB46: 00        .byte $00   ; 



_off018_07_AB47_0B:
- D 1 - I - 0x016B57 05:AB47: 00        .byte $00   ; 
- D 1 - I - 0x016B58 05:AB48: 70        .byte $70   ; 
- D 1 - I - 0x016B59 05:AB49: 71        .byte $71   ; 
- D 1 - I - 0x016B5A 05:AB4A: 72        .byte $72   ; 
- D 1 - I - 0x016B5B 05:AB4B: 00        .byte $00   ; 
- D 1 - I - 0x016B5C 05:AB4C: 00        .byte $00   ; 
- D 1 - I - 0x016B5D 05:AB4D: 00        .byte $00   ; 
- D 1 - I - 0x016B5E 05:AB4E: 70        .byte $70   ; 
- D 1 - I - 0x016B5F 05:AB4F: 70        .byte $70   ; 
- D 1 - I - 0x016B60 05:AB50: 71        .byte $71   ; 
- D 1 - I - 0x016B61 05:AB51: 75        .byte $75   ; 
- D 1 - I - 0x016B62 05:AB52: 76        .byte $76   ; 
- D 1 - I - 0x016B63 05:AB53: 72        .byte $72   ; 
- D 1 - I - 0x016B64 05:AB54: 00        .byte $00   ; 
- D 1 - I - 0x016B65 05:AB55: 70        .byte $70   ; 
- D 1 - I - 0x016B66 05:AB56: 71        .byte $71   ; 
- D 1 - I - 0x016B67 05:AB57: 74        .byte $74   ; 
- D 1 - I - 0x016B68 05:AB58: 75        .byte $75   ; 
- D 1 - I - 0x016B69 05:AB59: 76        .byte $76   ; 
- D 1 - I - 0x016B6A 05:AB5A: 77        .byte $77   ; 
- D 1 - I - 0x016B6B 05:AB5B: 7B        .byte $7B   ; 
- D 1 - I - 0x016B6C 05:AB5C: 0F        .byte $0F   ; 
- D 1 - I - 0x016B6D 05:AB5D: 31        .byte $31   ; 
- D 1 - I - 0x016B6E 05:AB5E: 75        .byte $75   ; 
- D 1 - I - 0x016B6F 05:AB5F: 78        .byte $78   ; 
- D 1 - I - 0x016B70 05:AB60: 79        .byte $79   ; 
- D 1 - I - 0x016B71 05:AB61: 7A        .byte $7A   ; 
- D 1 - I - 0x016B72 05:AB62: 0F        .byte $0F   ; 
- D 1 - I - 0x016B73 05:AB63: 50        .byte $50   ; 
- D 1 - I - 0x016B74 05:AB64: 12        .byte $12   ; 
- D 1 - I - 0x016B75 05:AB65: 1D        .byte $1D   ; 
- D 1 - I - 0x016B76 05:AB66: 79        .byte $79   ; 
- D 1 - I - 0x016B77 05:AB67: 00        .byte $00   ; 
- D 1 - I - 0x016B78 05:AB68: 0F        .byte $0F   ; 
- D 1 - I - 0x016B79 05:AB69: 1A        .byte $1A   ; 
- D 1 - I - 0x016B7A 05:AB6A: 10        .byte $10   ; 
- D 1 - I - 0x016B7B 05:AB6B: 54        .byte $54   ; 
- D 1 - I - 0x016B7C 05:AB6C: 16        .byte $16   ; 
- D 1 - I - 0x016B7D 05:AB6D: 13        .byte $13   ; 
- D 1 - I - 0x016B7E 05:AB6E: 00        .byte $00   ; 
- D 1 - I - 0x016B7F 05:AB6F: 2D        .byte $2D   ; 
- D 1 - I - 0x016B80 05:AB70: 30        .byte $30   ; 
- D 1 - I - 0x016B81 05:AB71: 1E        .byte $1E   ; 
- D 1 - I - 0x016B82 05:AB72: 14        .byte $14   ; 
- D 1 - I - 0x016B83 05:AB73: 13        .byte $13   ; 
- D 1 - I - 0x016B84 05:AB74: 70        .byte $70   ; 
- D 1 - I - 0x016B85 05:AB75: 72        .byte $72   ; 
- D 1 - I - 0x016B86 05:AB76: 73        .byte $73   ; 
- D 1 - I - 0x016B87 05:AB77: 21        .byte $21   ; 
- D 1 - I - 0x016B88 05:AB78: 34        .byte $34   ; 
- D 1 - I - 0x016B89 05:AB79: 17        .byte $17   ; 
- D 1 - I - 0x016B8A 05:AB7A: 00        .byte $00   ; 
- D 1 - I - 0x016B8B 05:AB7B: 00        .byte $00   ; 
- D 1 - I - 0x016B8C 05:AB7C: 74        .byte $74   ; 
- D 1 - I - 0x016B8D 05:AB7D: 75        .byte $75   ; 
- D 1 - I - 0x016B8E 05:AB7E: 76        .byte $76   ; 
- D 1 - I - 0x016B8F 05:AB7F: 25        .byte $25   ; 
- D 1 - I - 0x016B90 05:AB80: 26        .byte $26   ; 
- D 1 - I - 0x016B91 05:AB81: 21        .byte $21   ; 
- D 1 - I - 0x016B92 05:AB82: 23        .byte $23   ; 
- D 1 - I - 0x016B93 05:AB83: 00        .byte $00   ; 
- D 1 - I - 0x016B94 05:AB84: 00        .byte $00   ; 
- D 1 - I - 0x016B95 05:AB85: 78        .byte $78   ; 
- D 1 - I - 0x016B96 05:AB86: 79        .byte $79   ; 



_off018_07_AB87_0C:
- D 1 - I - 0x016B97 05:AB87: 71        .byte $71   ; 
- D 1 - I - 0x016B98 05:AB88: 72        .byte $72   ; 
- D 1 - I - 0x016B99 05:AB89: 00        .byte $00   ; 
- D 1 - I - 0x016B9A 05:AB8A: 00        .byte $00   ; 
- D 1 - I - 0x016B9B 05:AB8B: 00        .byte $00   ; 
- D 1 - I - 0x016B9C 05:AB8C: 00        .byte $00   ; 
- D 1 - I - 0x016B9D 05:AB8D: 00        .byte $00   ; 
- D 1 - I - 0x016B9E 05:AB8E: 00        .byte $00   ; 
- D 1 - I - 0x016B9F 05:AB8F: 76        .byte $76   ; 
- D 1 - I - 0x016BA0 05:AB90: 77        .byte $77   ; 
- D 1 - I - 0x016BA1 05:AB91: 00        .byte $00   ; 
- D 1 - I - 0x016BA2 05:AB92: 70        .byte $70   ; 
- D 1 - I - 0x016BA3 05:AB93: 72        .byte $72   ; 
- D 1 - I - 0x016BA4 05:AB94: 72        .byte $72   ; 
- D 1 - I - 0x016BA5 05:AB95: 00        .byte $00   ; 
- D 1 - I - 0x016BA6 05:AB96: 00        .byte $00   ; 
- D 1 - I - 0x016BA7 05:AB97: 7C        .byte $7C   ; 
- D 1 - I - 0x016BA8 05:AB98: 7B        .byte $7B   ; 
- D 1 - I - 0x016BA9 05:AB99: 00        .byte $00   ; 
- D 1 - I - 0x016BAA 05:AB9A: 74        .byte $74   ; 
- D 1 - I - 0x016BAB 05:AB9B: 76        .byte $76   ; 
- D 1 - I - 0x016BAC 05:AB9C: 77        .byte $77   ; 
- D 1 - I - 0x016BAD 05:AB9D: 00        .byte $00   ; 
- D 1 - I - 0x016BAE 05:AB9E: 00        .byte $00   ; 
- D 1 - I - 0x016BAF 05:AB9F: 39        .byte $39   ; 
- D 1 - I - 0x016BB0 05:ABA0: 17        .byte $17   ; 
- D 1 - I - 0x016BB1 05:ABA1: 00        .byte $00   ; 
- D 1 - I - 0x016BB2 05:ABA2: 78        .byte $78   ; 
- D 1 - I - 0x016BB3 05:ABA3: 7A        .byte $7A   ; 
- D 1 - I - 0x016BB4 05:ABA4: 00        .byte $00   ; 
- D 1 - I - 0x016BB5 05:ABA5: 70        .byte $70   ; 
- D 1 - I - 0x016BB6 05:ABA6: 71        .byte $71   ; 
- D 1 - I - 0x016BB7 05:ABA7: 3D        .byte $3D   ; 
- D 1 - I - 0x016BB8 05:ABA8: 20        .byte $20   ; 
- D 1 - I - 0x016BB9 05:ABA9: 58        .byte $58   ; 
- D 1 - I - 0x016BBA 05:ABAA: 17        .byte $17   ; 
- D 1 - I - 0x016BBB 05:ABAB: 00        .byte $00   ; 
- D 1 - I - 0x016BBC 05:ABAC: 00        .byte $00   ; 
- D 1 - I - 0x016BBD 05:ABAD: 74        .byte $74   ; 
- D 1 - I - 0x016BBE 05:ABAE: 75        .byte $75   ; 
- D 1 - I - 0x016BBF 05:ABAF: 29        .byte $29   ; 
- D 1 - I - 0x016BC0 05:ABB0: 24        .byte $24   ; 
- D 1 - I - 0x016BC1 05:ABB1: 5C        .byte $5C   ; 
- D 1 - I - 0x016BC2 05:ABB2: 3A        .byte $3A   ; 
- D 1 - I - 0x016BC3 05:ABB3: 00        .byte $00   ; 
- D 1 - I - 0x016BC4 05:ABB4: 00        .byte $00   ; 
- D 1 - I - 0x016BC5 05:ABB5: 78        .byte $78   ; 
- D 1 - I - 0x016BC6 05:ABB6: 79        .byte $79   ; 
- D 1 - I - 0x016BC7 05:ABB7: 73        .byte $73   ; 
- D 1 - I - 0x016BC8 05:ABB8: 00        .byte $00   ; 
- D 1 - I - 0x016BC9 05:ABB9: 29        .byte $29   ; 
- D 1 - I - 0x016BCA 05:ABBA: 3E        .byte $3E   ; 
- D 1 - I - 0x016BCB 05:ABBB: 00        .byte $00   ; 
- D 1 - I - 0x016BCC 05:ABBC: 80        .byte $80   ; 
- D 1 - I - 0x016BCD 05:ABBD: 02        .byte $02   ; 
- D 1 - I - 0x016BCE 05:ABBE: 03        .byte $03   ; 
- D 1 - I - 0x016BCF 05:ABBF: 7B        .byte $7B   ; 
- D 1 - I - 0x016BD0 05:ABC0: 00        .byte $00   ; 
- D 1 - I - 0x016BD1 05:ABC1: 00        .byte $00   ; 
- D 1 - I - 0x016BD2 05:ABC2: 00        .byte $00   ; 
- D 1 - I - 0x016BD3 05:ABC3: 00        .byte $00   ; 
- D 1 - I - 0x016BD4 05:ABC4: 81        .byte $81   ; 
- D 1 - I - 0x016BD5 05:ABC5: 06        .byte $06   ; 
- D 1 - I - 0x016BD6 05:ABC6: 07        .byte $07   ; 



_off018_07_ABC7_0D:
- D 1 - I - 0x016BD7 05:ABC7: 00        .byte $00   ; 
- D 1 - I - 0x016BD8 05:ABC8: 00        .byte $00   ; 
- D 1 - I - 0x016BD9 05:ABC9: 00        .byte $00   ; 
- D 1 - I - 0x016BDA 05:ABCA: 00        .byte $00   ; 
- D 1 - I - 0x016BDB 05:ABCB: 00        .byte $00   ; 
- D 1 - I - 0x016BDC 05:ABCC: 00        .byte $00   ; 
- D 1 - I - 0x016BDD 05:ABCD: 9B        .byte $9B   ; 
- D 1 - I - 0x016BDE 05:ABCE: 9C        .byte $9C   ; 
- D 1 - I - 0x016BDF 05:ABCF: 00        .byte $00   ; 
- D 1 - I - 0x016BE0 05:ABD0: 00        .byte $00   ; 
- D 1 - I - 0x016BE1 05:ABD1: 00        .byte $00   ; 
- D 1 - I - 0x016BE2 05:ABD2: 70        .byte $70   ; 
- D 1 - I - 0x016BE3 05:ABD3: 72        .byte $72   ; 
- D 1 - I - 0x016BE4 05:ABD4: 73        .byte $73   ; 
- D 1 - I - 0x016BE5 05:ABD5: 00        .byte $00   ; 
- D 1 - I - 0x016BE6 05:ABD6: 00        .byte $00   ; 
- D 1 - I - 0x016BE7 05:ABD7: 00        .byte $00   ; 
- D 1 - I - 0x016BE8 05:ABD8: 00        .byte $00   ; 
- D 1 - I - 0x016BE9 05:ABD9: 00        .byte $00   ; 
- D 1 - I - 0x016BEA 05:ABDA: 74        .byte $74   ; 
- D 1 - I - 0x016BEB 05:ABDB: 76        .byte $76   ; 
- D 1 - I - 0x016BEC 05:ABDC: 77        .byte $77   ; 
- D 1 - I - 0x016BED 05:ABDD: 00        .byte $00   ; 
- D 1 - I - 0x016BEE 05:ABDE: 00        .byte $00   ; 
- D 1 - I - 0x016BEF 05:ABDF: 72        .byte $72   ; 
- D 1 - I - 0x016BF0 05:ABE0: 72        .byte $72   ; 
- D 1 - I - 0x016BF1 05:ABE1: 73        .byte $73   ; 
- D 1 - I - 0x016BF2 05:ABE2: 78        .byte $78   ; 
- D 1 - I - 0x016BF3 05:ABE3: 79        .byte $79   ; 
- D 1 - I - 0x016BF4 05:ABE4: 7B        .byte $7B   ; 
- D 1 - I - 0x016BF5 05:ABE5: 00        .byte $00   ; 
- D 1 - I - 0x016BF6 05:ABE6: 00        .byte $00   ; 
- D 1 - I - 0x016BF7 05:ABE7: 76        .byte $76   ; 
- D 1 - I - 0x016BF8 05:ABE8: 76        .byte $76   ; 
- D 1 - I - 0x016BF9 05:ABE9: 77        .byte $77   ; 
- D 1 - I - 0x016BFA 05:ABEA: 00        .byte $00   ; 
- D 1 - I - 0x016BFB 05:ABEB: 00        .byte $00   ; 
- D 1 - I - 0x016BFC 05:ABEC: 00        .byte $00   ; 
- D 1 - I - 0x016BFD 05:ABED: 00        .byte $00   ; 
- D 1 - I - 0x016BFE 05:ABEE: 00        .byte $00   ; 
- D 1 - I - 0x016BFF 05:ABEF: 7A        .byte $7A   ; 
- D 1 - I - 0x016C00 05:ABF0: 7A        .byte $7A   ; 
- D 1 - I - 0x016C01 05:ABF1: 7B        .byte $7B   ; 
- D 1 - I - 0x016C02 05:ABF2: 00        .byte $00   ; 
- D 1 - I - 0x016C03 05:ABF3: 00        .byte $00   ; 
- D 1 - I - 0x016C04 05:ABF4: 00        .byte $00   ; 
- D 1 - I - 0x016C05 05:ABF5: 00        .byte $00   ; 
- D 1 - I - 0x016C06 05:ABF6: 00        .byte $00   ; 
- D 1 - I - 0x016C07 05:ABF7: 02        .byte $02   ; 
- D 1 - I - 0x016C08 05:ABF8: 03        .byte $03   ; 
- D 1 - I - 0x016C09 05:ABF9: 01        .byte $01   ; 
- D 1 - I - 0x016C0A 05:ABFA: 02        .byte $02   ; 
- D 1 - I - 0x016C0B 05:ABFB: 03        .byte $03   ; 
- D 1 - I - 0x016C0C 05:ABFC: 01        .byte $01   ; 
- D 1 - I - 0x016C0D 05:ABFD: 02        .byte $02   ; 
- D 1 - I - 0x016C0E 05:ABFE: 03        .byte $03   ; 
- D 1 - I - 0x016C0F 05:ABFF: 06        .byte $06   ; 
- D 1 - I - 0x016C10 05:AC00: 07        .byte $07   ; 
- D 1 - I - 0x016C11 05:AC01: 05        .byte $05   ; 
- D 1 - I - 0x016C12 05:AC02: 06        .byte $06   ; 
- D 1 - I - 0x016C13 05:AC03: 07        .byte $07   ; 
- D 1 - I - 0x016C14 05:AC04: 05        .byte $05   ; 
- D 1 - I - 0x016C15 05:AC05: 06        .byte $06   ; 
- D 1 - I - 0x016C16 05:AC06: 07        .byte $07   ; 



_off018_07_AC07_0E:
- D 1 - I - 0x016C17 05:AC07: 93        .byte $93   ; 
- D 1 - I - 0x016C18 05:AC08: 94        .byte $94   ; 
- D 1 - I - 0x016C19 05:AC09: 93        .byte $93   ; 
- D 1 - I - 0x016C1A 05:AC0A: 95        .byte $95   ; 
- D 1 - I - 0x016C1B 05:AC0B: 96        .byte $96   ; 
- D 1 - I - 0x016C1C 05:AC0C: 97        .byte $97   ; 
- D 1 - I - 0x016C1D 05:AC0D: 96        .byte $96   ; 
- D 1 - I - 0x016C1E 05:AC0E: 98        .byte $98   ; 
- D 1 - I - 0x016C1F 05:AC0F: 00        .byte $00   ; 
- D 1 - I - 0x016C20 05:AC10: 00        .byte $00   ; 
- D 1 - I - 0x016C21 05:AC11: 00        .byte $00   ; 
- D 1 - I - 0x016C22 05:AC12: 00        .byte $00   ; 
- D 1 - I - 0x016C23 05:AC13: 00        .byte $00   ; 
- D 1 - I - 0x016C24 05:AC14: 00        .byte $00   ; 
- D 1 - I - 0x016C25 05:AC15: 00        .byte $00   ; 
- D 1 - I - 0x016C26 05:AC16: 00        .byte $00   ; 
- D 1 - I - 0x016C27 05:AC17: 00        .byte $00   ; 
- D 1 - I - 0x016C28 05:AC18: 00        .byte $00   ; 
- D 1 - I - 0x016C29 05:AC19: 00        .byte $00   ; 
- D 1 - I - 0x016C2A 05:AC1A: 00        .byte $00   ; 
- D 1 - I - 0x016C2B 05:AC1B: 00        .byte $00   ; 
- D 1 - I - 0x016C2C 05:AC1C: 00        .byte $00   ; 
- D 1 - I - 0x016C2D 05:AC1D: 00        .byte $00   ; 
- D 1 - I - 0x016C2E 05:AC1E: 00        .byte $00   ; 
- D 1 - I - 0x016C2F 05:AC1F: 00        .byte $00   ; 
- D 1 - I - 0x016C30 05:AC20: 00        .byte $00   ; 
- D 1 - I - 0x016C31 05:AC21: 00        .byte $00   ; 
- D 1 - I - 0x016C32 05:AC22: 00        .byte $00   ; 
- D 1 - I - 0x016C33 05:AC23: 00        .byte $00   ; 
- D 1 - I - 0x016C34 05:AC24: 00        .byte $00   ; 
- D 1 - I - 0x016C35 05:AC25: 00        .byte $00   ; 
- D 1 - I - 0x016C36 05:AC26: 00        .byte $00   ; 
- D 1 - I - 0x016C37 05:AC27: 00        .byte $00   ; 
- D 1 - I - 0x016C38 05:AC28: 00        .byte $00   ; 
- D 1 - I - 0x016C39 05:AC29: 00        .byte $00   ; 
- D 1 - I - 0x016C3A 05:AC2A: 00        .byte $00   ; 
- D 1 - I - 0x016C3B 05:AC2B: 00        .byte $00   ; 
- D 1 - I - 0x016C3C 05:AC2C: 00        .byte $00   ; 
- D 1 - I - 0x016C3D 05:AC2D: 00        .byte $00   ; 
- D 1 - I - 0x016C3E 05:AC2E: 00        .byte $00   ; 
- D 1 - I - 0x016C3F 05:AC2F: 00        .byte $00   ; 
- D 1 - I - 0x016C40 05:AC30: 00        .byte $00   ; 
- D 1 - I - 0x016C41 05:AC31: 00        .byte $00   ; 
- D 1 - I - 0x016C42 05:AC32: 00        .byte $00   ; 
- D 1 - I - 0x016C43 05:AC33: 00        .byte $00   ; 
- D 1 - I - 0x016C44 05:AC34: 00        .byte $00   ; 
- D 1 - I - 0x016C45 05:AC35: 00        .byte $00   ; 
- D 1 - I - 0x016C46 05:AC36: 00        .byte $00   ; 
- D 1 - I - 0x016C47 05:AC37: 82        .byte $82   ; 
- D 1 - I - 0x016C48 05:AC38: 83        .byte $83   ; 
- D 1 - I - 0x016C49 05:AC39: 82        .byte $82   ; 
- D 1 - I - 0x016C4A 05:AC3A: 83        .byte $83   ; 
- D 1 - I - 0x016C4B 05:AC3B: 82        .byte $82   ; 
- D 1 - I - 0x016C4C 05:AC3C: 83        .byte $83   ; 
- D 1 - I - 0x016C4D 05:AC3D: 82        .byte $82   ; 
- D 1 - I - 0x016C4E 05:AC3E: 83        .byte $83   ; 
- D 1 - I - 0x016C4F 05:AC3F: 99        .byte $99   ; 
- D 1 - I - 0x016C50 05:AC40: 9A        .byte $9A   ; 
- D 1 - I - 0x016C51 05:AC41: 99        .byte $99   ; 
- D 1 - I - 0x016C52 05:AC42: 9A        .byte $9A   ; 
- D 1 - I - 0x016C53 05:AC43: 99        .byte $99   ; 
- D 1 - I - 0x016C54 05:AC44: 9A        .byte $9A   ; 
- D 1 - I - 0x016C55 05:AC45: 99        .byte $99   ; 
- D 1 - I - 0x016C56 05:AC46: 9A        .byte $9A   ; 



_off018_07_AC47_0F:
- D 1 - I - 0x016C57 05:AC47: 93        .byte $93   ; 
- D 1 - I - 0x016C58 05:AC48: 94        .byte $94   ; 
- D 1 - I - 0x016C59 05:AC49: 93        .byte $93   ; 
- D 1 - I - 0x016C5A 05:AC4A: 95        .byte $95   ; 
- D 1 - I - 0x016C5B 05:AC4B: 96        .byte $96   ; 
- D 1 - I - 0x016C5C 05:AC4C: 97        .byte $97   ; 
- D 1 - I - 0x016C5D 05:AC4D: 96        .byte $96   ; 
- D 1 - I - 0x016C5E 05:AC4E: 98        .byte $98   ; 
- D 1 - I - 0x016C5F 05:AC4F: 00        .byte $00   ; 
- D 1 - I - 0x016C60 05:AC50: 00        .byte $00   ; 
- D 1 - I - 0x016C61 05:AC51: 00        .byte $00   ; 
- D 1 - I - 0x016C62 05:AC52: 00        .byte $00   ; 
- D 1 - I - 0x016C63 05:AC53: 00        .byte $00   ; 
- D 1 - I - 0x016C64 05:AC54: 00        .byte $00   ; 
- D 1 - I - 0x016C65 05:AC55: 00        .byte $00   ; 
- D 1 - I - 0x016C66 05:AC56: 00        .byte $00   ; 
- D 1 - I - 0x016C67 05:AC57: 00        .byte $00   ; 
- D 1 - I - 0x016C68 05:AC58: 00        .byte $00   ; 
- D 1 - I - 0x016C69 05:AC59: 00        .byte $00   ; 
- D 1 - I - 0x016C6A 05:AC5A: 00        .byte $00   ; 
- D 1 - I - 0x016C6B 05:AC5B: 00        .byte $00   ; 
- D 1 - I - 0x016C6C 05:AC5C: 00        .byte $00   ; 
- D 1 - I - 0x016C6D 05:AC5D: 00        .byte $00   ; 
- D 1 - I - 0x016C6E 05:AC5E: 00        .byte $00   ; 
- D 1 - I - 0x016C6F 05:AC5F: 00        .byte $00   ; 
- D 1 - I - 0x016C70 05:AC60: 00        .byte $00   ; 
- D 1 - I - 0x016C71 05:AC61: 00        .byte $00   ; 
- D 1 - I - 0x016C72 05:AC62: 00        .byte $00   ; 
- D 1 - I - 0x016C73 05:AC63: 00        .byte $00   ; 
- D 1 - I - 0x016C74 05:AC64: 00        .byte $00   ; 
- D 1 - I - 0x016C75 05:AC65: 00        .byte $00   ; 
- D 1 - I - 0x016C76 05:AC66: 00        .byte $00   ; 
- D 1 - I - 0x016C77 05:AC67: 00        .byte $00   ; 
- D 1 - I - 0x016C78 05:AC68: 00        .byte $00   ; 
- D 1 - I - 0x016C79 05:AC69: 00        .byte $00   ; 
- D 1 - I - 0x016C7A 05:AC6A: 00        .byte $00   ; 
- D 1 - I - 0x016C7B 05:AC6B: 00        .byte $00   ; 
- D 1 - I - 0x016C7C 05:AC6C: 00        .byte $00   ; 
- D 1 - I - 0x016C7D 05:AC6D: 00        .byte $00   ; 
- D 1 - I - 0x016C7E 05:AC6E: 00        .byte $00   ; 
- D 1 - I - 0x016C7F 05:AC6F: 00        .byte $00   ; 
- D 1 - I - 0x016C80 05:AC70: 00        .byte $00   ; 
- D 1 - I - 0x016C81 05:AC71: 00        .byte $00   ; 
- D 1 - I - 0x016C82 05:AC72: 00        .byte $00   ; 
- D 1 - I - 0x016C83 05:AC73: 00        .byte $00   ; 
- D 1 - I - 0x016C84 05:AC74: 00        .byte $00   ; 
- D 1 - I - 0x016C85 05:AC75: 00        .byte $00   ; 
- D 1 - I - 0x016C86 05:AC76: 00        .byte $00   ; 
- D 1 - I - 0x016C87 05:AC77: 84        .byte $84   ; 
- D 1 - I - 0x016C88 05:AC78: 00        .byte $00   ; 
- D 1 - I - 0x016C89 05:AC79: 85        .byte $85   ; 
- D 1 - I - 0x016C8A 05:AC7A: 00        .byte $00   ; 
- D 1 - I - 0x016C8B 05:AC7B: 85        .byte $85   ; 
- D 1 - I - 0x016C8C 05:AC7C: 00        .byte $00   ; 
- D 1 - I - 0x016C8D 05:AC7D: 86        .byte $86   ; 
- D 1 - I - 0x016C8E 05:AC7E: 82        .byte $82   ; 
- D 1 - I - 0x016C8F 05:AC7F: 99        .byte $99   ; 
- D 1 - I - 0x016C90 05:AC80: 00        .byte $00   ; 
- D 1 - I - 0x016C91 05:AC81: 9A        .byte $9A   ; 
- D 1 - I - 0x016C92 05:AC82: 00        .byte $00   ; 
- D 1 - I - 0x016C93 05:AC83: 9A        .byte $9A   ; 
- D 1 - I - 0x016C94 05:AC84: 00        .byte $00   ; 
- D 1 - I - 0x016C95 05:AC85: 87        .byte $87   ; 
- D 1 - I - 0x016C96 05:AC86: 99        .byte $99   ; 



_off018_07_AC87_10:
- D 1 - I - 0x016C97 05:AC87: C5        .byte $C5   ; 
- D 1 - I - 0x016C98 05:AC88: 9D        .byte $9D   ; 
- D 1 - I - 0x016C99 05:AC89: 9E        .byte $9E   ; 
- D 1 - I - 0x016C9A 05:AC8A: A0        .byte $A0   ; 
- D 1 - I - 0x016C9B 05:AC8B: BD        .byte $BD   ; 
- D 1 - I - 0x016C9C 05:AC8C: A1        .byte $A1   ; 
- D 1 - I - 0x016C9D 05:AC8D: A2        .byte $A2   ; 
- D 1 - I - 0x016C9E 05:AC8E: CD        .byte $CD   ; 
- D 1 - I - 0x016C9F 05:AC8F: 00        .byte $00   ; 
- D 1 - I - 0x016CA0 05:AC90: 00        .byte $00   ; 
- D 1 - I - 0x016CA1 05:AC91: 00        .byte $00   ; 
- D 1 - I - 0x016CA2 05:AC92: 00        .byte $00   ; 
- D 1 - I - 0x016CA3 05:AC93: 71        .byte $71   ; 
- D 1 - I - 0x016CA4 05:AC94: 76        .byte $76   ; 
- D 1 - I - 0x016CA5 05:AC95: A3        .byte $A3   ; 
- D 1 - I - 0x016CA6 05:AC96: A4        .byte $A4   ; 
- D 1 - I - 0x016CA7 05:AC97: 70        .byte $70   ; 
- D 1 - I - 0x016CA8 05:AC98: 71        .byte $71   ; 
- D 1 - I - 0x016CA9 05:AC99: 73        .byte $73   ; 
- D 1 - I - 0x016CAA 05:AC9A: 00        .byte $00   ; 
- D 1 - I - 0x016CAB 05:AC9B: 79        .byte $79   ; 
- D 1 - I - 0x016CAC 05:AC9C: 79        .byte $79   ; 
- D 1 - I - 0x016CAD 05:AC9D: A5        .byte $A5   ; 
- D 1 - I - 0x016CAE 05:AC9E: A6        .byte $A6   ; 
- D 1 - I - 0x016CAF 05:AC9F: 74        .byte $74   ; 
- D 1 - I - 0x016CB0 05:ACA0: 75        .byte $75   ; 
- D 1 - I - 0x016CB1 05:ACA1: 76        .byte $76   ; 
- D 1 - I - 0x016CB2 05:ACA2: 7B        .byte $7B   ; 
- D 1 - I - 0x016CB3 05:ACA3: 70        .byte $70   ; 
- D 1 - I - 0x016CB4 05:ACA4: 70        .byte $70   ; 
- D 1 - I - 0x016CB5 05:ACA5: 72        .byte $72   ; 
- D 1 - I - 0x016CB6 05:ACA6: A7        .byte $A7   ; 
- D 1 - I - 0x016CB7 05:ACA7: 00        .byte $00   ; 
- D 1 - I - 0x016CB8 05:ACA8: 79        .byte $79   ; 
- D 1 - I - 0x016CB9 05:ACA9: 7A        .byte $7A   ; 
- D 1 - I - 0x016CBA 05:ACAA: 7B        .byte $7B   ; 
- D 1 - I - 0x016CBB 05:ACAB: 74        .byte $74   ; 
- D 1 - I - 0x016CBC 05:ACAC: 76        .byte $76   ; 
- D 1 - I - 0x016CBD 05:ACAD: 76        .byte $76   ; 
- D 1 - I - 0x016CBE 05:ACAE: A8        .byte $A8   ; 
- D 1 - I - 0x016CBF 05:ACAF: 00        .byte $00   ; 
- D 1 - I - 0x016CC0 05:ACB0: 00        .byte $00   ; 
- D 1 - I - 0x016CC1 05:ACB1: 72        .byte $72   ; 
- D 1 - I - 0x016CC2 05:ACB2: 00        .byte $00   ; 
- D 1 - I - 0x016CC3 05:ACB3: 78        .byte $78   ; 
- D 1 - I - 0x016CC4 05:ACB4: 79        .byte $79   ; 
- D 1 - I - 0x016CC5 05:ACB5: 7A        .byte $7A   ; 
- D 1 - I - 0x016CC6 05:ACB6: A9        .byte $A9   ; 
- D 1 - I - 0x016CC7 05:ACB7: 82        .byte $82   ; 
- D 1 - I - 0x016CC8 05:ACB8: 83        .byte $83   ; 
- D 1 - I - 0x016CC9 05:ACB9: 82        .byte $82   ; 
- D 1 - I - 0x016CCA 05:ACBA: 9F        .byte $9F   ; 
- D 1 - I - 0x016CCB 05:ACBB: 00        .byte $00   ; 
- D 1 - I - 0x016CCC 05:ACBC: 00        .byte $00   ; 
- D 1 - I - 0x016CCD 05:ACBD: 00        .byte $00   ; 
- D 1 - I - 0x016CCE 05:ACBE: AA        .byte $AA   ; 
- D 1 - I - 0x016CCF 05:ACBF: 99        .byte $99   ; 
- D 1 - I - 0x016CD0 05:ACC0: 9A        .byte $9A   ; 
- D 1 - I - 0x016CD1 05:ACC1: 99        .byte $99   ; 
- D 1 - I - 0x016CD2 05:ACC2: 9A        .byte $9A   ; 
- D 1 - I - 0x016CD3 05:ACC3: 00        .byte $00   ; 
- D 1 - I - 0x016CD4 05:ACC4: 00        .byte $00   ; 
- D 1 - I - 0x016CD5 05:ACC5: 00        .byte $00   ; 
- D 1 - I - 0x016CD6 05:ACC6: AB        .byte $AB   ; 



_off018_07_ACC7_11:
- D 1 - I - 0x016CD7 05:ACC7: 92        .byte $92   ; 
- D 1 - I - 0x016CD8 05:ACC8: CD        .byte $CD   ; 
- D 1 - I - 0x016CD9 05:ACC9: 92        .byte $92   ; 
- - - - - - 0x016CDA 05:ACCA: CD        .byte $CD   ; 
- - - - - - 0x016CDB 05:ACCB: 00        .byte $00   ; 
- - - - - - 0x016CDC 05:ACCC: 00        .byte $00   ; 
- - - - - - 0x016CDD 05:ACCD: 00        .byte $00   ; 
- - - - - - 0x016CDE 05:ACCE: 00        .byte $00   ; 
- D 1 - I - 0x016CDF 05:ACCF: 8A        .byte $8A   ; 
- D 1 - I - 0x016CE0 05:ACD0: 8B        .byte $8B   ; 
- D 1 - I - 0x016CE1 05:ACD1: 8A        .byte $8A   ; 
- D 1 - I - 0x016CE2 05:ACD2: 8B        .byte $8B   ; 
- - - - - - 0x016CE3 05:ACD3: 00        .byte $00   ; 
- - - - - - 0x016CE4 05:ACD4: 00        .byte $00   ; 
- - - - - - 0x016CE5 05:ACD5: 00        .byte $00   ; 
- - - - - - 0x016CE6 05:ACD6: 00        .byte $00   ; 
- D 1 - I - 0x016CE7 05:ACD7: 90        .byte $90   ; 
- D 1 - I - 0x016CE8 05:ACD8: 88        .byte $88   ; 
- D 1 - I - 0x016CE9 05:ACD9: 90        .byte $90   ; 
- D 1 - I - 0x016CEA 05:ACDA: 88        .byte $88   ; 
- - - - - - 0x016CEB 05:ACDB: 00        .byte $00   ; 
- - - - - - 0x016CEC 05:ACDC: 00        .byte $00   ; 
- - - - - - 0x016CED 05:ACDD: 00        .byte $00   ; 
- - - - - - 0x016CEE 05:ACDE: 00        .byte $00   ; 
- D 1 - I - 0x016CEF 05:ACDF: 8D        .byte $8D   ; 
- D 1 - I - 0x016CF0 05:ACE0: 8E        .byte $8E   ; 
- D 1 - I - 0x016CF1 05:ACE1: 8D        .byte $8D   ; 
- D 1 - I - 0x016CF2 05:ACE2: 8E        .byte $8E   ; 
- - - - - - 0x016CF3 05:ACE3: 00        .byte $00   ; 
- - - - - - 0x016CF4 05:ACE4: 00        .byte $00   ; 
- - - - - - 0x016CF5 05:ACE5: 00        .byte $00   ; 
- - - - - - 0x016CF6 05:ACE6: 00        .byte $00   ; 
- D 1 - I - 0x016CF7 05:ACE7: AC        .byte $AC   ; 
- D 1 - I - 0x016CF8 05:ACE8: CD        .byte $CD   ; 
- D 1 - I - 0x016CF9 05:ACE9: 92        .byte $92   ; 
- D 1 - I - 0x016CFA 05:ACEA: CD        .byte $CD   ; 
- D 1 - I - 0x016CFB 05:ACEB: 92        .byte $92   ; 
- - - - - - 0x016CFC 05:ACEC: CD        .byte $CD   ; 
- - - - - - 0x016CFD 05:ACED: 92        .byte $92   ; 
- - - - - - 0x016CFE 05:ACEE: CD        .byte $CD   ; 
- D 1 - I - 0x016CFF 05:ACEF: AD        .byte $AD   ; 
- D 1 - I - 0x016D00 05:ACF0: 8B        .byte $8B   ; 
- D 1 - I - 0x016D01 05:ACF1: 8A        .byte $8A   ; 
- D 1 - I - 0x016D02 05:ACF2: 8B        .byte $8B   ; 
- D 1 - I - 0x016D03 05:ACF3: 8A        .byte $8A   ; 
- - - - - - 0x016D04 05:ACF4: 8B        .byte $8B   ; 
- - - - - - 0x016D05 05:ACF5: 8A        .byte $8A   ; 
- - - - - - 0x016D06 05:ACF6: 8B        .byte $8B   ; 
- D 1 - I - 0x016D07 05:ACF7: AE        .byte $AE   ; 
- D 1 - I - 0x016D08 05:ACF8: 88        .byte $88   ; 
- D 1 - I - 0x016D09 05:ACF9: 90        .byte $90   ; 
- D 1 - I - 0x016D0A 05:ACFA: 88        .byte $88   ; 
- D 1 - I - 0x016D0B 05:ACFB: 90        .byte $90   ; 
- - - - - - 0x016D0C 05:ACFC: 88        .byte $88   ; 
- - - - - - 0x016D0D 05:ACFD: 90        .byte $90   ; 
- - - - - - 0x016D0E 05:ACFE: 88        .byte $88   ; 
- D 1 - I - 0x016D0F 05:ACFF: 8D        .byte $8D   ; 
- D 1 - I - 0x016D10 05:AD00: 8E        .byte $8E   ; 
- D 1 - I - 0x016D11 05:AD01: 8D        .byte $8D   ; 
- D 1 - I - 0x016D12 05:AD02: 8E        .byte $8E   ; 
- D 1 - I - 0x016D13 05:AD03: 8D        .byte $8D   ; 
- D 1 - I - 0x016D14 05:AD04: 8E        .byte $8E   ; 
- - - - - - 0x016D15 05:AD05: 8D        .byte $8D   ; 
- - - - - - 0x016D16 05:AD06: 8E        .byte $8E   ; 



_off018_07_AD07_12:
- D 1 - I - 0x016D17 05:AD07: 88        .byte $88   ; 
- D 1 - I - 0x016D18 05:AD08: C3        .byte $C3   ; 
- D 1 - I - 0x016D19 05:AD09: 88        .byte $88   ; 
- D 1 - I - 0x016D1A 05:AD0A: C3        .byte $C3   ; 
- D 1 - I - 0x016D1B 05:AD0B: 00        .byte $00   ; 
- D 1 - I - 0x016D1C 05:AD0C: 00        .byte $00   ; 
- D 1 - I - 0x016D1D 05:AD0D: 00        .byte $00   ; 
- D 1 - I - 0x016D1E 05:AD0E: A7        .byte $A7   ; 
- D 1 - I - 0x016D1F 05:AD0F: 8E        .byte $8E   ; 
- D 1 - I - 0x016D20 05:AD10: C4        .byte $C4   ; 
- D 1 - I - 0x016D21 05:AD11: 8E        .byte $8E   ; 
- D 1 - I - 0x016D22 05:AD12: C4        .byte $C4   ; 
- D 1 - I - 0x016D23 05:AD13: 00        .byte $00   ; 
- D 1 - I - 0x016D24 05:AD14: 00        .byte $00   ; 
- D 1 - I - 0x016D25 05:AD15: 00        .byte $00   ; 
- D 1 - I - 0x016D26 05:AD16: A8        .byte $A8   ; 
- D 1 - I - 0x016D27 05:AD17: CD        .byte $CD   ; 
- D 1 - I - 0x016D28 05:AD18: 8F        .byte $8F   ; 
- D 1 - I - 0x016D29 05:AD19: CD        .byte $CD   ; 
- D 1 - I - 0x016D2A 05:AD1A: 8F        .byte $8F   ; 
- D 1 - I - 0x016D2B 05:AD1B: 09        .byte $09   ; 
- D 1 - I - 0x016D2C 05:AD1C: 41        .byte $41   ; 
- D 1 - I - 0x016D2D 05:AD1D: 00        .byte $00   ; 
- D 1 - I - 0x016D2E 05:AD1E: A9        .byte $A9   ; 
- D 1 - I - 0x016D2F 05:AD1F: 89        .byte $89   ; 
- D 1 - I - 0x016D30 05:AD20: 8A        .byte $8A   ; 
- D 1 - I - 0x016D31 05:AD21: 89        .byte $89   ; 
- D 1 - I - 0x016D32 05:AD22: 8A        .byte $8A   ; 
- D 1 - I - 0x016D33 05:AD23: 8C        .byte $8C   ; 
- D 1 - I - 0x016D34 05:AD24: C4        .byte $C4   ; 
- D 1 - I - 0x016D35 05:AD25: 00        .byte $00   ; 
- D 1 - I - 0x016D36 05:AD26: AF        .byte $AF   ; 
- - - - - - 0x016D37 05:AD27: 88        .byte $88   ; 
- D 1 - I - 0x016D38 05:AD28: 90        .byte $90   ; 
- D 1 - I - 0x016D39 05:AD29: 88        .byte $88   ; 
- D 1 - I - 0x016D3A 05:AD2A: 91        .byte $91   ; 
- D 1 - I - 0x016D3B 05:AD2B: CD        .byte $CD   ; 
- D 1 - I - 0x016D3C 05:AD2C: 8F        .byte $8F   ; 
- D 1 - I - 0x016D3D 05:AD2D: 70        .byte $70   ; 
- D 1 - I - 0x016D3E 05:AD2E: 71        .byte $71   ; 
- - - - - - 0x016D3F 05:AD2F: 8C        .byte $8C   ; 
- D 1 - I - 0x016D40 05:AD30: 8D        .byte $8D   ; 
- D 1 - I - 0x016D41 05:AD31: 8C        .byte $8C   ; 
- D 1 - I - 0x016D42 05:AD32: 8D        .byte $8D   ; 
- D 1 - I - 0x016D43 05:AD33: 89        .byte $89   ; 
- D 1 - I - 0x016D44 05:AD34: 8A        .byte $8A   ; 
- D 1 - I - 0x016D45 05:AD35: 74        .byte $74   ; 
- D 1 - I - 0x016D46 05:AD36: 76        .byte $76   ; 
- - - - - - 0x016D47 05:AD37: CD        .byte $CD   ; 
- - - - - - 0x016D48 05:AD38: CE        .byte $CE   ; 
- D 1 - I - 0x016D49 05:AD39: CD        .byte $CD   ; 
- D 1 - I - 0x016D4A 05:AD3A: CE        .byte $CE   ; 
- D 1 - I - 0x016D4B 05:AD3B: 88        .byte $88   ; 
- D 1 - I - 0x016D4C 05:AD3C: 90        .byte $90   ; 
- D 1 - I - 0x016D4D 05:AD3D: 82        .byte $82   ; 
- D 1 - I - 0x016D4E 05:AD3E: 83        .byte $83   ; 
- - - - - - 0x016D4F 05:AD3F: 89        .byte $89   ; 
- - - - - - 0x016D50 05:AD40: C4        .byte $C4   ; 
- D 1 - I - 0x016D51 05:AD41: 89        .byte $89   ; 
- D 1 - I - 0x016D52 05:AD42: C4        .byte $C4   ; 
- D 1 - I - 0x016D53 05:AD43: 8E        .byte $8E   ; 
- D 1 - I - 0x016D54 05:AD44: 8D        .byte $8D   ; 
- D 1 - I - 0x016D55 05:AD45: 99        .byte $99   ; 
- D 1 - I - 0x016D56 05:AD46: 9A        .byte $9A   ; 



_off018_07_AD47_13:
- D 1 - I - 0x016D57 05:AD47: B0        .byte $B0   ; 
- D 1 - I - 0x016D58 05:AD48: C8        .byte $C8   ; 
- D 1 - I - 0x016D59 05:AD49: B0        .byte $B0   ; 
- D 1 - I - 0x016D5A 05:AD4A: C8        .byte $C8   ; 
- D 1 - I - 0x016D5B 05:AD4B: B0        .byte $B0   ; 
- D 1 - I - 0x016D5C 05:AD4C: C8        .byte $C8   ; 
- D 1 - I - 0x016D5D 05:AD4D: B0        .byte $B0   ; 
- D 1 - I - 0x016D5E 05:AD4E: B9        .byte $B9   ; 
- D 1 - I - 0x016D5F 05:AD4F: B2        .byte $B2   ; 
- D 1 - I - 0x016D60 05:AD50: B3        .byte $B3   ; 
- D 1 - I - 0x016D61 05:AD51: B4        .byte $B4   ; 
- D 1 - I - 0x016D62 05:AD52: B3        .byte $B3   ; 
- D 1 - I - 0x016D63 05:AD53: B4        .byte $B4   ; 
- D 1 - I - 0x016D64 05:AD54: B3        .byte $B3   ; 
- D 1 - I - 0x016D65 05:AD55: BA        .byte $BA   ; 
- D 1 - I - 0x016D66 05:AD56: BB        .byte $BB   ; 
- D 1 - I - 0x016D67 05:AD57: B5        .byte $B5   ; 
- D 1 - I - 0x016D68 05:AD58: B6        .byte $B6   ; 
- D 1 - I - 0x016D69 05:AD59: B7        .byte $B7   ; 
- D 1 - I - 0x016D6A 05:AD5A: B6        .byte $B6   ; 
- D 1 - I - 0x016D6B 05:AD5B: B7        .byte $B7   ; 
- D 1 - I - 0x016D6C 05:AD5C: B6        .byte $B6   ; 
- D 1 - I - 0x016D6D 05:AD5D: BC        .byte $BC   ; 
- D 1 - I - 0x016D6E 05:AD5E: 00        .byte $00   ; 
- D 1 - I - 0x016D6F 05:AD5F: A1        .byte $A1   ; 
- D 1 - I - 0x016D70 05:AD60: B8        .byte $B8   ; 
- D 1 - I - 0x016D71 05:AD61: A1        .byte $A1   ; 
- D 1 - I - 0x016D72 05:AD62: B8        .byte $B8   ; 
- D 1 - I - 0x016D73 05:AD63: A1        .byte $A1   ; 
- D 1 - I - 0x016D74 05:AD64: B8        .byte $B8   ; 
- D 1 - I - 0x016D75 05:AD65: BB        .byte $BB   ; 
- D 1 - I - 0x016D76 05:AD66: 00        .byte $00   ; 
- D 1 - I - 0x016D77 05:AD67: 72        .byte $72   ; 
- D 1 - I - 0x016D78 05:AD68: 00        .byte $00   ; 
- D 1 - I - 0x016D79 05:AD69: 00        .byte $00   ; 
- D 1 - I - 0x016D7A 05:AD6A: 00        .byte $00   ; 
- D 1 - I - 0x016D7B 05:AD6B: 70        .byte $70   ; 
- D 1 - I - 0x016D7C 05:AD6C: 71        .byte $71   ; 
- D 1 - I - 0x016D7D 05:AD6D: 00        .byte $00   ; 
- D 1 - I - 0x016D7E 05:AD6E: 00        .byte $00   ; 
- D 1 - I - 0x016D7F 05:AD6F: 75        .byte $75   ; 
- D 1 - I - 0x016D80 05:AD70: 71        .byte $71   ; 
- D 1 - I - 0x016D81 05:AD71: 00        .byte $00   ; 
- D 1 - I - 0x016D82 05:AD72: 00        .byte $00   ; 
- D 1 - I - 0x016D83 05:AD73: 74        .byte $74   ; 
- D 1 - I - 0x016D84 05:AD74: 75        .byte $75   ; 
- D 1 - I - 0x016D85 05:AD75: 72        .byte $72   ; 
- D 1 - I - 0x016D86 05:AD76: 00        .byte $00   ; 
- D 1 - I - 0x016D87 05:AD77: 82        .byte $82   ; 
- D 1 - I - 0x016D88 05:AD78: 83        .byte $83   ; 
- D 1 - I - 0x016D89 05:AD79: 82        .byte $82   ; 
- D 1 - I - 0x016D8A 05:AD7A: 83        .byte $83   ; 
- D 1 - I - 0x016D8B 05:AD7B: 82        .byte $82   ; 
- D 1 - I - 0x016D8C 05:AD7C: 83        .byte $83   ; 
- D 1 - I - 0x016D8D 05:AD7D: 82        .byte $82   ; 
- D 1 - I - 0x016D8E 05:AD7E: 83        .byte $83   ; 
- D 1 - I - 0x016D8F 05:AD7F: 99        .byte $99   ; 
- D 1 - I - 0x016D90 05:AD80: 9A        .byte $9A   ; 
- D 1 - I - 0x016D91 05:AD81: 99        .byte $99   ; 
- D 1 - I - 0x016D92 05:AD82: 9A        .byte $9A   ; 
- D 1 - I - 0x016D93 05:AD83: 99        .byte $99   ; 
- D 1 - I - 0x016D94 05:AD84: 9A        .byte $9A   ; 
- D 1 - I - 0x016D95 05:AD85: 99        .byte $99   ; 
- D 1 - I - 0x016D96 05:AD86: 9A        .byte $9A   ; 



_off018_07_AD87_14:
- D 1 - I - 0x016D97 05:AD87: B8        .byte $B8   ; 
- D 1 - I - 0x016D98 05:AD88: A1        .byte $A1   ; 
- D 1 - I - 0x016D99 05:AD89: B8        .byte $B8   ; 
- D 1 - I - 0x016D9A 05:AD8A: BD        .byte $BD   ; 
- D 1 - I - 0x016D9B 05:AD8B: BE        .byte $BE   ; 
- D 1 - I - 0x016D9C 05:AD8C: BF        .byte $BF   ; 
- D 1 - I - 0x016D9D 05:AD8D: A1        .byte $A1   ; 
- D 1 - I - 0x016D9E 05:AD8E: C0        .byte $C0   ; 
- D 1 - I - 0x016D9F 05:AD8F: 00        .byte $00   ; 
- D 1 - I - 0x016DA0 05:AD90: 00        .byte $00   ; 
- D 1 - I - 0x016DA1 05:AD91: 00        .byte $00   ; 
- D 1 - I - 0x016DA2 05:AD92: 00        .byte $00   ; 
- D 1 - I - 0x016DA3 05:AD93: 00        .byte $00   ; 
- D 1 - I - 0x016DA4 05:AD94: 00        .byte $00   ; 
- D 1 - I - 0x016DA5 05:AD95: 00        .byte $00   ; 
- D 1 - I - 0x016DA6 05:AD96: C1        .byte $C1   ; 
- D 1 - I - 0x016DA7 05:AD97: 00        .byte $00   ; 
- D 1 - I - 0x016DA8 05:AD98: 00        .byte $00   ; 
- D 1 - I - 0x016DA9 05:AD99: 00        .byte $00   ; 
- D 1 - I - 0x016DAA 05:AD9A: 00        .byte $00   ; 
- D 1 - I - 0x016DAB 05:AD9B: 00        .byte $00   ; 
- D 1 - I - 0x016DAC 05:AD9C: 00        .byte $00   ; 
- D 1 - I - 0x016DAD 05:AD9D: 00        .byte $00   ; 
- D 1 - I - 0x016DAE 05:AD9E: C2        .byte $C2   ; 
- D 1 - I - 0x016DAF 05:AD9F: 00        .byte $00   ; 
- D 1 - I - 0x016DB0 05:ADA0: 00        .byte $00   ; 
- D 1 - I - 0x016DB1 05:ADA1: 00        .byte $00   ; 
- D 1 - I - 0x016DB2 05:ADA2: 00        .byte $00   ; 
- D 1 - I - 0x016DB3 05:ADA3: 00        .byte $00   ; 
- D 1 - I - 0x016DB4 05:ADA4: 00        .byte $00   ; 
- D 1 - I - 0x016DB5 05:ADA5: 00        .byte $00   ; 
- D 1 - I - 0x016DB6 05:ADA6: A9        .byte $A9   ; 
- D 1 - I - 0x016DB7 05:ADA7: 00        .byte $00   ; 
- D 1 - I - 0x016DB8 05:ADA8: 00        .byte $00   ; 
- D 1 - I - 0x016DB9 05:ADA9: 00        .byte $00   ; 
- D 1 - I - 0x016DBA 05:ADAA: 00        .byte $00   ; 
- D 1 - I - 0x016DBB 05:ADAB: 00        .byte $00   ; 
- D 1 - I - 0x016DBC 05:ADAC: 00        .byte $00   ; 
- D 1 - I - 0x016DBD 05:ADAD: 00        .byte $00   ; 
- D 1 - I - 0x016DBE 05:ADAE: AA        .byte $AA   ; 
- D 1 - I - 0x016DBF 05:ADAF: 00        .byte $00   ; 
- D 1 - I - 0x016DC0 05:ADB0: 00        .byte $00   ; 
- D 1 - I - 0x016DC1 05:ADB1: 00        .byte $00   ; 
- D 1 - I - 0x016DC2 05:ADB2: 00        .byte $00   ; 
- D 1 - I - 0x016DC3 05:ADB3: 00        .byte $00   ; 
- D 1 - I - 0x016DC4 05:ADB4: 00        .byte $00   ; 
- D 1 - I - 0x016DC5 05:ADB5: 00        .byte $00   ; 
- D 1 - I - 0x016DC6 05:ADB6: A7        .byte $A7   ; 
- D 1 - I - 0x016DC7 05:ADB7: 82        .byte $82   ; 
- D 1 - I - 0x016DC8 05:ADB8: 83        .byte $83   ; 
- D 1 - I - 0x016DC9 05:ADB9: 82        .byte $82   ; 
- D 1 - I - 0x016DCA 05:ADBA: 83        .byte $83   ; 
- D 1 - I - 0x016DCB 05:ADBB: 82        .byte $82   ; 
- D 1 - I - 0x016DCC 05:ADBC: 83        .byte $83   ; 
- D 1 - I - 0x016DCD 05:ADBD: 82        .byte $82   ; 
- D 1 - I - 0x016DCE 05:ADBE: 83        .byte $83   ; 
- D 1 - I - 0x016DCF 05:ADBF: 99        .byte $99   ; 
- D 1 - I - 0x016DD0 05:ADC0: 9A        .byte $9A   ; 
- D 1 - I - 0x016DD1 05:ADC1: 99        .byte $99   ; 
- D 1 - I - 0x016DD2 05:ADC2: 9A        .byte $9A   ; 
- D 1 - I - 0x016DD3 05:ADC3: 99        .byte $99   ; 
- D 1 - I - 0x016DD4 05:ADC4: 9A        .byte $9A   ; 
- D 1 - I - 0x016DD5 05:ADC5: 99        .byte $99   ; 
- D 1 - I - 0x016DD6 05:ADC6: 9A        .byte $9A   ; 



_off018_07_ADC7_15:
- D 1 - I - 0x016DD7 05:ADC7: 00        .byte $00   ; 
- D 1 - I - 0x016DD8 05:ADC8: 00        .byte $00   ; 
- D 1 - I - 0x016DD9 05:ADC9: 00        .byte $00   ; 
- D 1 - I - 0x016DDA 05:ADCA: 00        .byte $00   ; 
- D 1 - I - 0x016DDB 05:ADCB: 00        .byte $00   ; 
- D 1 - I - 0x016DDC 05:ADCC: 00        .byte $00   ; 
- D 1 - I - 0x016DDD 05:ADCD: 00        .byte $00   ; 
- D 1 - I - 0x016DDE 05:ADCE: 00        .byte $00   ; 
- D 1 - I - 0x016DDF 05:ADCF: 00        .byte $00   ; 
- D 1 - I - 0x016DE0 05:ADD0: 00        .byte $00   ; 
- D 1 - I - 0x016DE1 05:ADD1: 00        .byte $00   ; 
- D 1 - I - 0x016DE2 05:ADD2: 00        .byte $00   ; 
- D 1 - I - 0x016DE3 05:ADD3: 00        .byte $00   ; 
- D 1 - I - 0x016DE4 05:ADD4: 00        .byte $00   ; 
- D 1 - I - 0x016DE5 05:ADD5: 00        .byte $00   ; 
- D 1 - I - 0x016DE6 05:ADD6: 00        .byte $00   ; 
- D 1 - I - 0x016DE7 05:ADD7: C6        .byte $C6   ; 
- D 1 - I - 0x016DE8 05:ADD8: C7        .byte $C7   ; 
- D 1 - I - 0x016DE9 05:ADD9: C6        .byte $C6   ; 
- D 1 - I - 0x016DEA 05:ADDA: C7        .byte $C7   ; 
- D 1 - I - 0x016DEB 05:ADDB: B3        .byte $B3   ; 
- D 1 - I - 0x016DEC 05:ADDC: B4        .byte $B4   ; 
- D 1 - I - 0x016DED 05:ADDD: B3        .byte $B3   ; 
- D 1 - I - 0x016DEE 05:ADDE: B4        .byte $B4   ; 
- D 1 - I - 0x016DEF 05:ADDF: B1        .byte $B1   ; 
- D 1 - I - 0x016DF0 05:ADE0: B0        .byte $B0   ; 
- D 1 - I - 0x016DF1 05:ADE1: C8        .byte $C8   ; 
- D 1 - I - 0x016DF2 05:ADE2: C9        .byte $C9   ; 
- D 1 - I - 0x016DF3 05:ADE3: CA        .byte $CA   ; 
- D 1 - I - 0x016DF4 05:ADE4: CB        .byte $CB   ; 
- D 1 - I - 0x016DF5 05:ADE5: 99        .byte $99   ; 
- D 1 - I - 0x016DF6 05:ADE6: 9A        .byte $9A   ; 
- D 1 - I - 0x016DF7 05:ADE7: B3        .byte $B3   ; 
- D 1 - I - 0x016DF8 05:ADE8: B4        .byte $B4   ; 
- D 1 - I - 0x016DF9 05:ADE9: B3        .byte $B3   ; 
- D 1 - I - 0x016DFA 05:ADEA: B4        .byte $B4   ; 
- D 1 - I - 0x016DFB 05:ADEB: C6        .byte $C6   ; 
- D 1 - I - 0x016DFC 05:ADEC: C7        .byte $C7   ; 
- D 1 - I - 0x016DFD 05:ADED: C6        .byte $C6   ; 
- D 1 - I - 0x016DFE 05:ADEE: C7        .byte $C7   ; 
- D 1 - I - 0x016DFF 05:ADEF: CA        .byte $CA   ; 
- D 1 - I - 0x016E00 05:ADF0: CB        .byte $CB   ; 
- D 1 - I - 0x016E01 05:ADF1: 99        .byte $99   ; 
- D 1 - I - 0x016E02 05:ADF2: 9A        .byte $9A   ; 
- D 1 - I - 0x016E03 05:ADF3: B1        .byte $B1   ; 
- D 1 - I - 0x016E04 05:ADF4: B0        .byte $B0   ; 
- D 1 - I - 0x016E05 05:ADF5: C8        .byte $C8   ; 
- D 1 - I - 0x016E06 05:ADF6: C9        .byte $C9   ; 
- D 1 - I - 0x016E07 05:ADF7: C6        .byte $C6   ; 
- D 1 - I - 0x016E08 05:ADF8: C7        .byte $C7   ; 
- D 1 - I - 0x016E09 05:ADF9: C6        .byte $C6   ; 
- D 1 - I - 0x016E0A 05:ADFA: C7        .byte $C7   ; 
- D 1 - I - 0x016E0B 05:ADFB: B3        .byte $B3   ; 
- D 1 - I - 0x016E0C 05:ADFC: B4        .byte $B4   ; 
- D 1 - I - 0x016E0D 05:ADFD: B3        .byte $B3   ; 
- D 1 - I - 0x016E0E 05:ADFE: B4        .byte $B4   ; 
- D 1 - I - 0x016E0F 05:ADFF: CC        .byte $CC   ; 
- D 1 - I - 0x016E10 05:AE00: B0        .byte $B0   ; 
- D 1 - I - 0x016E11 05:AE01: CC        .byte $CC   ; 
- D 1 - I - 0x016E12 05:AE02: C9        .byte $C9   ; 
- D 1 - I - 0x016E13 05:AE03: CA        .byte $CA   ; 
- D 1 - I - 0x016E14 05:AE04: CB        .byte $CB   ; 
- D 1 - I - 0x016E15 05:AE05: 99        .byte $99   ; 
- D 1 - I - 0x016E16 05:AE06: 9A        .byte $9A   ; 



_off018_07_AE07_16:
- D 1 - I - 0x016E17 05:AE07: 00        .byte $00   ; 
- D 1 - I - 0x016E18 05:AE08: 00        .byte $00   ; 
- D 1 - I - 0x016E19 05:AE09: 00        .byte $00   ; 
- D 1 - I - 0x016E1A 05:AE0A: 00        .byte $00   ; 
- D 1 - I - 0x016E1B 05:AE0B: 00        .byte $00   ; 
- D 1 - I - 0x016E1C 05:AE0C: 00        .byte $00   ; 
- D 1 - I - 0x016E1D 05:AE0D: 00        .byte $00   ; 
- D 1 - I - 0x016E1E 05:AE0E: 00        .byte $00   ; 
- D 1 - I - 0x016E1F 05:AE0F: 00        .byte $00   ; 
- D 1 - I - 0x016E20 05:AE10: 00        .byte $00   ; 
- D 1 - I - 0x016E21 05:AE11: 00        .byte $00   ; 
- D 1 - I - 0x016E22 05:AE12: 00        .byte $00   ; 
- D 1 - I - 0x016E23 05:AE13: 00        .byte $00   ; 
- D 1 - I - 0x016E24 05:AE14: 00        .byte $00   ; 
- D 1 - I - 0x016E25 05:AE15: 00        .byte $00   ; 
- D 1 - I - 0x016E26 05:AE16: 00        .byte $00   ; 
- D 1 - I - 0x016E27 05:AE17: 00        .byte $00   ; 
- D 1 - I - 0x016E28 05:AE18: 00        .byte $00   ; 
- D 1 - I - 0x016E29 05:AE19: 00        .byte $00   ; 
- D 1 - I - 0x016E2A 05:AE1A: 00        .byte $00   ; 
- D 1 - I - 0x016E2B 05:AE1B: 00        .byte $00   ; 
- D 1 - I - 0x016E2C 05:AE1C: D6        .byte $D6   ; 
- D 1 - I - 0x016E2D 05:AE1D: D7        .byte $D7   ; 
- D 1 - I - 0x016E2E 05:AE1E: D8        .byte $D8   ; 
- D 1 - I - 0x016E2F 05:AE1F: 00        .byte $00   ; 
- D 1 - I - 0x016E30 05:AE20: 00        .byte $00   ; 
- D 1 - I - 0x016E31 05:AE21: 00        .byte $00   ; 
- D 1 - I - 0x016E32 05:AE22: 00        .byte $00   ; 
- D 1 - I - 0x016E33 05:AE23: 00        .byte $00   ; 
- D 1 - I - 0x016E34 05:AE24: D9        .byte $D9   ; 
- D 1 - I - 0x016E35 05:AE25: DA        .byte $DA   ; 
- D 1 - I - 0x016E36 05:AE26: DB        .byte $DB   ; 
- D 1 - I - 0x016E37 05:AE27: 00        .byte $00   ; 
- D 1 - I - 0x016E38 05:AE28: 00        .byte $00   ; 
- D 1 - I - 0x016E39 05:AE29: 00        .byte $00   ; 
- D 1 - I - 0x016E3A 05:AE2A: 00        .byte $00   ; 
- D 1 - I - 0x016E3B 05:AE2B: DC        .byte $DC   ; 
- D 1 - I - 0x016E3C 05:AE2C: DD        .byte $DD   ; 
- D 1 - I - 0x016E3D 05:AE2D: DE        .byte $DE   ; 
- D 1 - I - 0x016E3E 05:AE2E: DF        .byte $DF   ; 
- D 1 - I - 0x016E3F 05:AE2F: 00        .byte $00   ; 
- D 1 - I - 0x016E40 05:AE30: 00        .byte $00   ; 
- D 1 - I - 0x016E41 05:AE31: 00        .byte $00   ; 
- D 1 - I - 0x016E42 05:AE32: E0        .byte $E0   ; 
- D 1 - I - 0x016E43 05:AE33: E1        .byte $E1   ; 
- D 1 - I - 0x016E44 05:AE34: E2        .byte $E2   ; 
- D 1 - I - 0x016E45 05:AE35: E3        .byte $E3   ; 
- D 1 - I - 0x016E46 05:AE36: E4        .byte $E4   ; 
- D 1 - I - 0x016E47 05:AE37: 00        .byte $00   ; 
- D 1 - I - 0x016E48 05:AE38: 00        .byte $00   ; 
- D 1 - I - 0x016E49 05:AE39: 00        .byte $00   ; 
- D 1 - I - 0x016E4A 05:AE3A: 00        .byte $00   ; 
- D 1 - I - 0x016E4B 05:AE3B: 00        .byte $00   ; 
- D 1 - I - 0x016E4C 05:AE3C: 00        .byte $00   ; 
- D 1 - I - 0x016E4D 05:AE3D: 00        .byte $00   ; 
- D 1 - I - 0x016E4E 05:AE3E: 00        .byte $00   ; 
- D 1 - I - 0x016E4F 05:AE3F: 00        .byte $00   ; 
- D 1 - I - 0x016E50 05:AE40: 00        .byte $00   ; 
- D 1 - I - 0x016E51 05:AE41: 00        .byte $00   ; 
- D 1 - I - 0x016E52 05:AE42: 00        .byte $00   ; 
- D 1 - I - 0x016E53 05:AE43: 00        .byte $00   ; 
- D 1 - I - 0x016E54 05:AE44: 00        .byte $00   ; 
- D 1 - I - 0x016E55 05:AE45: 00        .byte $00   ; 
- D 1 - I - 0x016E56 05:AE46: 00        .byte $00   ; 



_off006_0x016E57_07_area_8:
- D 1 - I - 0x016E57 05:AE47: 00        .byte $00   ; 
- D 1 - I - 0x016E58 05:AE48: 00        .byte $00   ; 
- D 1 - I - 0x016E59 05:AE49: 00        .byte $00   ; 
- D 1 - I - 0x016E5A 05:AE4A: 00        .byte $00   ; 
- D 1 - I - 0x016E5B 05:AE4B: 00        .byte $00   ; 
- D 1 - I - 0x016E5C 05:AE4C: 00        .byte $00   ; 
- D 1 - I - 0x016E5D 05:AE4D: 00        .byte $00   ; 
- D 1 - I - 0x016E5E 05:AE4E: 00        .byte $00   ; 
- D 1 - I - 0x016E5F 05:AE4F: 00        .byte $00   ; 
- D 1 - I - 0x016E60 05:AE50: 00        .byte $00   ; 
- D 1 - I - 0x016E61 05:AE51: 00        .byte $00   ; 
- D 1 - I - 0x016E62 05:AE52: 00        .byte $00   ; 
- D 1 - I - 0x016E63 05:AE53: 00        .byte $00   ; 
- D 1 - I - 0x016E64 05:AE54: 00        .byte $00   ; 
- D 1 - I - 0x016E65 05:AE55: 00        .byte $00   ; 
- D 1 - I - 0x016E66 05:AE56: 00        .byte $00   ; 
- D 1 - I - 0x016E67 05:AE57: 42        .byte $42   ; 
- D 1 - I - 0x016E68 05:AE58: DB        .byte $DB   ; 
- D 1 - I - 0x016E69 05:AE59: 42        .byte $42   ; 
- D 1 - I - 0x016E6A 05:AE5A: DB        .byte $DB   ; 
- D 1 - I - 0x016E6B 05:AE5B: DC        .byte $DC   ; 
- D 1 - I - 0x016E6C 05:AE5C: DD        .byte $DD   ; 
- D 1 - I - 0x016E6D 05:AE5D: DC        .byte $DC   ; 
- D 1 - I - 0x016E6E 05:AE5E: DD        .byte $DD   ; 
- D 1 - I - 0x016E6F 05:AE5F: 00        .byte $00   ; 
- D 1 - I - 0x016E70 05:AE60: 00        .byte $00   ; 
- D 1 - I - 0x016E71 05:AE61: 00        .byte $00   ; 
- D 1 - I - 0x016E72 05:AE62: 00        .byte $00   ; 
- D 1 - I - 0x016E73 05:AE63: 00        .byte $00   ; 
- D 1 - I - 0x016E74 05:AE64: 00        .byte $00   ; 
- D 1 - I - 0x016E75 05:AE65: 00        .byte $00   ; 
- D 1 - I - 0x016E76 05:AE66: 00        .byte $00   ; 
- D 1 - I - 0x016E77 05:AE67: 42        .byte $42   ; 
- D 1 - I - 0x016E78 05:AE68: DB        .byte $DB   ; 
- D 1 - I - 0x016E79 05:AE69: 42        .byte $42   ; 
- D 1 - I - 0x016E7A 05:AE6A: DB        .byte $DB   ; 
- D 1 - I - 0x016E7B 05:AE6B: DC        .byte $DC   ; 
- D 1 - I - 0x016E7C 05:AE6C: DD        .byte $DD   ; 
- D 1 - I - 0x016E7D 05:AE6D: DC        .byte $DC   ; 
- D 1 - I - 0x016E7E 05:AE6E: DD        .byte $DD   ; 
- D 1 - I - 0x016E7F 05:AE6F: 04        .byte $04   ; 
- D 1 - I - 0x016E80 05:AE70: ED        .byte $ED   ; 
- D 1 - I - 0x016E81 05:AE71: 05        .byte $05   ; 
- D 1 - I - 0x016E82 05:AE72: F0        .byte $F0   ; 
- D 1 - I - 0x016E83 05:AE73: EE        .byte $EE   ; 
- D 1 - I - 0x016E84 05:AE74: EF        .byte $EF   ; 
- D 1 - I - 0x016E85 05:AE75: F1        .byte $F1   ; 
- D 1 - I - 0x016E86 05:AE76: F2        .byte $F2   ; 
- D 1 - I - 0x016E87 05:AE77: 42        .byte $42   ; 
- D 1 - I - 0x016E88 05:AE78: DB        .byte $DB   ; 
- D 1 - I - 0x016E89 05:AE79: 42        .byte $42   ; 
- D 1 - I - 0x016E8A 05:AE7A: DB        .byte $DB   ; 
- D 1 - I - 0x016E8B 05:AE7B: DC        .byte $DC   ; 
- D 1 - I - 0x016E8C 05:AE7C: DD        .byte $DD   ; 
- D 1 - I - 0x016E8D 05:AE7D: DC        .byte $DC   ; 
- D 1 - I - 0x016E8E 05:AE7E: DD        .byte $DD   ; 
- D 1 - I - 0x016E8F 05:AE7F: 08        .byte $08   ; 
- D 1 - I - 0x016E90 05:AE80: F2        .byte $F2   ; 
- D 1 - I - 0x016E91 05:AE81: 09        .byte $09   ; 
- D 1 - I - 0x016E92 05:AE82: F9        .byte $F9   ; 
- D 1 - I - 0x016E93 05:AE83: F7        .byte $F7   ; 
- D 1 - I - 0x016E94 05:AE84: F8        .byte $F8   ; 
- D 1 - I - 0x016E95 05:AE85: FA        .byte $FA   ; 
- D 1 - I - 0x016E96 05:AE86: FB        .byte $FB   ; 
- D 1 - I - 0x016E97 05:AE87: 42        .byte $42   ; 
- D 1 - I - 0x016E98 05:AE88: DB        .byte $DB   ; 
- D 1 - I - 0x016E99 05:AE89: 42        .byte $42   ; 
- D 1 - I - 0x016E9A 05:AE8A: DB        .byte $DB   ; 
- D 1 - I - 0x016E9B 05:AE8B: DC        .byte $DC   ; 
- D 1 - I - 0x016E9C 05:AE8C: DD        .byte $DD   ; 
- D 1 - I - 0x016E9D 05:AE8D: DC        .byte $DC   ; 
- D 1 - I - 0x016E9E 05:AE8E: DD        .byte $DD   ; 
- D 1 - I - 0x016E9F 05:AE8F: 0C        .byte $0C   ; 
- D 1 - I - 0x016EA0 05:AE90: E1        .byte $E1   ; 
- D 1 - I - 0x016EA1 05:AE91: 0D        .byte $0D   ; 
- D 1 - I - 0x016EA2 05:AE92: E3        .byte $E3   ; 
- D 1 - I - 0x016EA3 05:AE93: 10        .byte $10   ; 
- D 1 - I - 0x016EA4 05:AE94: E2        .byte $E2   ; 
- D 1 - I - 0x016EA5 05:AE95: 11        .byte $11   ; 
- D 1 - I - 0x016EA6 05:AE96: E4        .byte $E4   ; 
- D 1 - I - 0x016EA7 05:AE97: 01        .byte $01   ; 
- D 1 - I - 0x016EA8 05:AE98: EA        .byte $EA   ; 
- D 1 - I - 0x016EA9 05:AE99: 01        .byte $01   ; 
- D 1 - I - 0x016EAA 05:AE9A: EA        .byte $EA   ; 
- D 1 - I - 0x016EAB 05:AE9B: EB        .byte $EB   ; 
- D 1 - I - 0x016EAC 05:AE9C: EC        .byte $EC   ; 
- D 1 - I - 0x016EAD 05:AE9D: EB        .byte $EB   ; 
- D 1 - I - 0x016EAE 05:AE9E: EC        .byte $EC   ; 
- D 1 - I - 0x016EAF 05:AE9F: 02        .byte $02   ; 
- D 1 - I - 0x016EB0 05:AEA0: DE        .byte $DE   ; 
- D 1 - I - 0x016EB1 05:AEA1: 03        .byte $03   ; 
- D 1 - I - 0x016EB2 05:AEA2: 02        .byte $02   ; 
- D 1 - I - 0x016EB3 05:AEA3: 00        .byte $00   ; 
- D 1 - I - 0x016EB4 05:AEA4: DF        .byte $DF   ; 
- D 1 - I - 0x016EB5 05:AEA5: E0        .byte $E0   ; 
- D 1 - I - 0x016EB6 05:AEA6: 00        .byte $00   ; 
- D 1 - I - 0x016EB7 05:AEA7: 06        .byte $06   ; 
- D 1 - I - 0x016EB8 05:AEA8: F3        .byte $F3   ; 
- D 1 - I - 0x016EB9 05:AEA9: 07        .byte $07   ; 
- D 1 - I - 0x016EBA 05:AEAA: F4        .byte $F4   ; 
- D 1 - I - 0x016EBB 05:AEAB: EB        .byte $EB   ; 
- D 1 - I - 0x016EBC 05:AEAC: EC        .byte $EC   ; 
- D 1 - I - 0x016EBD 05:AEAD: F5        .byte $F5   ; 
- D 1 - I - 0x016EBE 05:AEAE: F6        .byte $F6   ; 
- D 1 - I - 0x016EBF 05:AEAF: 02        .byte $02   ; 
- D 1 - I - 0x016EC0 05:AEB0: DE        .byte $DE   ; 
- D 1 - I - 0x016EC1 05:AEB1: 03        .byte $03   ; 
- D 1 - I - 0x016EC2 05:AEB2: 02        .byte $02   ; 
- D 1 - I - 0x016EC3 05:AEB3: 00        .byte $00   ; 
- D 1 - I - 0x016EC4 05:AEB4: DF        .byte $DF   ; 
- D 1 - I - 0x016EC5 05:AEB5: E0        .byte $E0   ; 
- D 1 - I - 0x016EC6 05:AEB6: 00        .byte $00   ; 
- D 1 - I - 0x016EC7 05:AEB7: 0A        .byte $0A   ; 
- D 1 - I - 0x016EC8 05:AEB8: FC        .byte $FC   ; 
- D 1 - I - 0x016EC9 05:AEB9: 0B        .byte $0B   ; 
- D 1 - I - 0x016ECA 05:AEBA: FE        .byte $FE   ; 
- D 1 - I - 0x016ECB 05:AEBB: EB        .byte $EB   ; 
- D 1 - I - 0x016ECC 05:AEBC: FD        .byte $FD   ; 
- D 1 - I - 0x016ECD 05:AEBD: FF        .byte $FF   ; 
- D 1 - I - 0x016ECE 05:AEBE: EC        .byte $EC   ; 
- D 1 - I - 0x016ECF 05:AEBF: 02        .byte $02   ; 
- D 1 - I - 0x016ED0 05:AEC0: DE        .byte $DE   ; 
- D 1 - I - 0x016ED1 05:AEC1: 03        .byte $03   ; 
- D 1 - I - 0x016ED2 05:AEC2: 02        .byte $02   ; 
- D 1 - I - 0x016ED3 05:AEC3: 00        .byte $00   ; 
- D 1 - I - 0x016ED4 05:AEC4: DF        .byte $DF   ; 
- D 1 - I - 0x016ED5 05:AEC5: E0        .byte $E0   ; 
- D 1 - I - 0x016ED6 05:AEC6: 00        .byte $00   ; 
- D 1 - I - 0x016ED7 05:AEC7: 0E        .byte $0E   ; 
- D 1 - I - 0x016ED8 05:AEC8: E5        .byte $E5   ; 
- D 1 - I - 0x016ED9 05:AEC9: 0F        .byte $0F   ; 
- D 1 - I - 0x016EDA 05:AECA: E8        .byte $E8   ; 
- D 1 - I - 0x016EDB 05:AECB: E6        .byte $E6   ; 
- D 1 - I - 0x016EDC 05:AECC: E7        .byte $E7   ; 
- D 1 - I - 0x016EDD 05:AECD: 17        .byte $17   ; 
- D 1 - I - 0x016EDE 05:AECE: E9        .byte $E9   ; 
- D 1 - I - 0x016EDF 05:AECF: 02        .byte $02   ; 
- D 1 - I - 0x016EE0 05:AED0: DE        .byte $DE   ; 
- D 1 - I - 0x016EE1 05:AED1: 03        .byte $03   ; 
- D 1 - I - 0x016EE2 05:AED2: 02        .byte $02   ; 
- D 1 - I - 0x016EE3 05:AED3: 00        .byte $00   ; 
- D 1 - I - 0x016EE4 05:AED4: DF        .byte $DF   ; 
- D 1 - I - 0x016EE5 05:AED5: E0        .byte $E0   ; 
- D 1 - I - 0x016EE6 05:AED6: 00        .byte $00   ; 
- D 1 - I - 0x016EE7 05:AED7: 00        .byte $00   ; 
- D 1 - I - 0x016EE8 05:AED8: 00        .byte $00   ; 
- D 1 - I - 0x016EE9 05:AED9: 00        .byte $00   ; 
- D 1 - I - 0x016EEA 05:AEDA: 00        .byte $00   ; 
- D 1 - I - 0x016EEB 05:AEDB: 00        .byte $00   ; 
- D 1 - I - 0x016EEC 05:AEDC: 00        .byte $00   ; 
- D 1 - I - 0x016EED 05:AEDD: 00        .byte $00   ; 
- D 1 - I - 0x016EEE 05:AEDE: 00        .byte $00   ; 
- D 1 - I - 0x016EEF 05:AEDF: 42        .byte $42   ; 
- D 1 - I - 0x016EF0 05:AEE0: DB        .byte $DB   ; 
- D 1 - I - 0x016EF1 05:AEE1: 42        .byte $42   ; 
- D 1 - I - 0x016EF2 05:AEE2: DB        .byte $DB   ; 
- D 1 - I - 0x016EF3 05:AEE3: DC        .byte $DC   ; 
- D 1 - I - 0x016EF4 05:AEE4: DD        .byte $DD   ; 
- D 1 - I - 0x016EF5 05:AEE5: DC        .byte $DC   ; 
- D 1 - I - 0x016EF6 05:AEE6: DD        .byte $DD   ; 
- D 1 - I - 0x016EF7 05:AEE7: 00        .byte $00   ; 
- D 1 - I - 0x016EF8 05:AEE8: 00        .byte $00   ; 
- D 1 - I - 0x016EF9 05:AEE9: 00        .byte $00   ; 
- D 1 - I - 0x016EFA 05:AEEA: 00        .byte $00   ; 
- D 1 - I - 0x016EFB 05:AEEB: 00        .byte $00   ; 
- D 1 - I - 0x016EFC 05:AEEC: 00        .byte $00   ; 
- D 1 - I - 0x016EFD 05:AEED: 00        .byte $00   ; 
- D 1 - I - 0x016EFE 05:AEEE: 00        .byte $00   ; 
- D 1 - I - 0x016EFF 05:AEEF: 01        .byte $01   ; 
- D 1 - I - 0x016F00 05:AEF0: EA        .byte $EA   ; 
- D 1 - I - 0x016F01 05:AEF1: 01        .byte $01   ; 
- D 1 - I - 0x016F02 05:AEF2: EA        .byte $EA   ; 
- D 1 - I - 0x016F03 05:AEF3: EB        .byte $EB   ; 
- D 1 - I - 0x016F04 05:AEF4: EC        .byte $EC   ; 
- D 1 - I - 0x016F05 05:AEF5: EB        .byte $EB   ; 
- D 1 - I - 0x016F06 05:AEF6: EC        .byte $EC   ; 
- D 1 - I - 0x016F07 05:AEF7: 0C        .byte $0C   ; 
- D 1 - I - 0x016F08 05:AEF8: E1        .byte $E1   ; 
- D 1 - I - 0x016F09 05:AEF9: 0D        .byte $0D   ; 
- D 1 - I - 0x016F0A 05:AEFA: E3        .byte $E3   ; 
- D 1 - I - 0x016F0B 05:AEFB: 10        .byte $10   ; 
- D 1 - I - 0x016F0C 05:AEFC: E2        .byte $E2   ; 
- D 1 - I - 0x016F0D 05:AEFD: 11        .byte $11   ; 
- D 1 - I - 0x016F0E 05:AEFE: E4        .byte $E4   ; 
- D 1 - I - 0x016F0F 05:AEFF: 0E        .byte $0E   ; 
- D 1 - I - 0x016F10 05:AF00: E5        .byte $E5   ; 
- D 1 - I - 0x016F11 05:AF01: 0F        .byte $0F   ; 
- D 1 - I - 0x016F12 05:AF02: E8        .byte $E8   ; 
- D 1 - I - 0x016F13 05:AF03: E6        .byte $E6   ; 
- D 1 - I - 0x016F14 05:AF04: E7        .byte $E7   ; 
- D 1 - I - 0x016F15 05:AF05: 17        .byte $17   ; 
- D 1 - I - 0x016F16 05:AF06: E9        .byte $E9   ; 
- D 1 - I - 0x016F17 05:AF07: 04        .byte $04   ; 
- D 1 - I - 0x016F18 05:AF08: ED        .byte $ED   ; 
- D 1 - I - 0x016F19 05:AF09: 05        .byte $05   ; 
- D 1 - I - 0x016F1A 05:AF0A: F0        .byte $F0   ; 
- D 1 - I - 0x016F1B 05:AF0B: EE        .byte $EE   ; 
- D 1 - I - 0x016F1C 05:AF0C: EF        .byte $EF   ; 
- D 1 - I - 0x016F1D 05:AF0D: F1        .byte $F1   ; 
- D 1 - I - 0x016F1E 05:AF0E: F2        .byte $F2   ; 
- D 1 - I - 0x016F1F 05:AF0F: 06        .byte $06   ; 
- D 1 - I - 0x016F20 05:AF10: F3        .byte $F3   ; 
- D 1 - I - 0x016F21 05:AF11: 07        .byte $07   ; 
- D 1 - I - 0x016F22 05:AF12: F4        .byte $F4   ; 
- D 1 - I - 0x016F23 05:AF13: EB        .byte $EB   ; 
- D 1 - I - 0x016F24 05:AF14: EC        .byte $EC   ; 
- D 1 - I - 0x016F25 05:AF15: F5        .byte $F5   ; 
- D 1 - I - 0x016F26 05:AF16: F6        .byte $F6   ; 
- D 1 - I - 0x016F27 05:AF17: 08        .byte $08   ; 
- D 1 - I - 0x016F28 05:AF18: F2        .byte $F2   ; 
- D 1 - I - 0x016F29 05:AF19: 09        .byte $09   ; 
- D 1 - I - 0x016F2A 05:AF1A: F9        .byte $F9   ; 
- D 1 - I - 0x016F2B 05:AF1B: F7        .byte $F7   ; 
- D 1 - I - 0x016F2C 05:AF1C: F8        .byte $F8   ; 
- D 1 - I - 0x016F2D 05:AF1D: FA        .byte $FA   ; 
- D 1 - I - 0x016F2E 05:AF1E: FB        .byte $FB   ; 
- D 1 - I - 0x016F2F 05:AF1F: 0A        .byte $0A   ; 
- D 1 - I - 0x016F30 05:AF20: FC        .byte $FC   ; 
- D 1 - I - 0x016F31 05:AF21: 0B        .byte $0B   ; 
- D 1 - I - 0x016F32 05:AF22: FE        .byte $FE   ; 
- D 1 - I - 0x016F33 05:AF23: EB        .byte $EB   ; 
- D 1 - I - 0x016F34 05:AF24: FD        .byte $FD   ; 
- D 1 - I - 0x016F35 05:AF25: FF        .byte $FF   ; 
- D 1 - I - 0x016F36 05:AF26: EC        .byte $EC   ; 
- D 1 - I - 0x016F37 05:AF27: 02        .byte $02   ; 
- D 1 - I - 0x016F38 05:AF28: DE        .byte $DE   ; 
- D 1 - I - 0x016F39 05:AF29: 03        .byte $03   ; 
- D 1 - I - 0x016F3A 05:AF2A: 02        .byte $02   ; 
- D 1 - I - 0x016F3B 05:AF2B: 00        .byte $00   ; 
- D 1 - I - 0x016F3C 05:AF2C: DF        .byte $DF   ; 
- D 1 - I - 0x016F3D 05:AF2D: E0        .byte $E0   ; 
- D 1 - I - 0x016F3E 05:AF2E: 00        .byte $00   ; 
- D 1 - I - 0x016F3F 05:AF2F: 00        .byte $00   ; 
- D 1 - I - 0x016F40 05:AF30: 00        .byte $00   ; 
- D 1 - I - 0x016F41 05:AF31: 00        .byte $00   ; 
- D 1 - I - 0x016F42 05:AF32: 00        .byte $00   ; 
- D 1 - I - 0x016F43 05:AF33: 00        .byte $00   ; 
- D 1 - I - 0x016F44 05:AF34: 00        .byte $00   ; 
- D 1 - I - 0x016F45 05:AF35: 00        .byte $00   ; 
- D 1 - I - 0x016F46 05:AF36: 00        .byte $00   ; 
- D 1 - I - 0x016F47 05:AF37: 00        .byte $00   ; 
- D 1 - I - 0x016F48 05:AF38: 00        .byte $00   ; 
- D 1 - I - 0x016F49 05:AF39: 00        .byte $00   ; 
- D 1 - I - 0x016F4A 05:AF3A: 00        .byte $00   ; 
- D 1 - I - 0x016F4B 05:AF3B: 00        .byte $00   ; 
- D 1 - I - 0x016F4C 05:AF3C: 00        .byte $00   ; 
- D 1 - I - 0x016F4D 05:AF3D: 00        .byte $00   ; 
- D 1 - I - 0x016F4E 05:AF3E: 00        .byte $00   ; 
- D 1 - I - 0x016F4F 05:AF3F: 00        .byte $00   ; 
- D 1 - I - 0x016F50 05:AF40: 00        .byte $00   ; 
- D 1 - I - 0x016F51 05:AF41: 64        .byte $64   ; 
- D 1 - I - 0x016F52 05:AF42: CC        .byte $CC   ; 
- D 1 - I - 0x016F53 05:AF43: 64        .byte $64   ; 
- D 1 - I - 0x016F54 05:AF44: CC        .byte $CC   ; 
- D 1 - I - 0x016F55 05:AF45: 60        .byte $60   ; 
- D 1 - I - 0x016F56 05:AF46: CA        .byte $CA   ; 
- D 1 - I - 0x016F57 05:AF47: 60        .byte $60   ; 
- D 1 - I - 0x016F58 05:AF48: CA        .byte $CA   ; 
- D 1 - I - 0x016F59 05:AF49: 62        .byte $62   ; 
- D 1 - I - 0x016F5A 05:AF4A: CB        .byte $CB   ; 
- D 1 - I - 0x016F5B 05:AF4B: 15        .byte $15   ; 
- D 1 - I - 0x016F5C 05:AF4C: CB        .byte $CB   ; 
- D 1 - I - 0x016F5D 05:AF4D: 00        .byte $00   ; 
- D 1 - I - 0x016F5E 05:AF4E: 00        .byte $00   ; 
- D 1 - I - 0x016F5F 05:AF4F: 00        .byte $00   ; 
- D 1 - I - 0x016F60 05:AF50: 00        .byte $00   ; 
- D 1 - I - 0x016F61 05:AF51: 00        .byte $00   ; 
- D 1 - I - 0x016F62 05:AF52: 00        .byte $00   ; 
- D 1 - I - 0x016F63 05:AF53: 00        .byte $00   ; 
- D 1 - I - 0x016F64 05:AF54: 00        .byte $00   ; 
- D 1 - I - 0x016F65 05:AF55: 14        .byte $14   ; 
- D 1 - I - 0x016F66 05:AF56: D3        .byte $D3   ; 
- D 1 - I - 0x016F67 05:AF57: 60        .byte $60   ; 
- D 1 - I - 0x016F68 05:AF58: CA        .byte $CA   ; 
- D 1 - I - 0x016F69 05:AF59: 62        .byte $62   ; 
- D 1 - I - 0x016F6A 05:AF5A: CF        .byte $CF   ; 
- D 1 - I - 0x016F6B 05:AF5B: 8E        .byte $8E   ; 
- D 1 - I - 0x016F6C 05:AF5C: E1        .byte $E1   ; 
- D 1 - I - 0x016F6D 05:AF5D: 0D        .byte $0D   ; 
- D 1 - I - 0x016F6E 05:AF5E: E3        .byte $E3   ; 
- - - - - - 0x016F6F 05:AF5F: 10        .byte $10   ; 
- - - - - - 0x016F70 05:AF60: E2        .byte $E2   ; 
- - - - - - 0x016F71 05:AF61: 11        .byte $11   ; 
- - - - - - 0x016F72 05:AF62: E4        .byte $E4   ; 
- - - - - - 0x016F73 05:AF63: 0E        .byte $0E   ; 
- - - - - - 0x016F74 05:AF64: E5        .byte $E5   ; 
- - - - - - 0x016F75 05:AF65: 0F        .byte $0F   ; 
- - - - - - 0x016F76 05:AF66: E8        .byte $E8   ; 
- D 1 - I - 0x016F77 05:AF67: 60        .byte $60   ; 
- D 1 - I - 0x016F78 05:AF68: CA        .byte $CA   ; 
- D 1 - I - 0x016F79 05:AF69: 62        .byte $62   ; 
- D 1 - I - 0x016F7A 05:AF6A: D0        .byte $D0   ; 
- D 1 - I - 0x016F7B 05:AF6B: CD        .byte $CD   ; 
- D 1 - I - 0x016F7C 05:AF6C: CE        .byte $CE   ; 
- D 1 - I - 0x016F7D 05:AF6D: D1        .byte $D1   ; 
- D 1 - I - 0x016F7E 05:AF6E: D2        .byte $D2   ; 
- D 1 - I - 0x016F7F 05:AF6F: 12        .byte $12   ; 
- D 1 - I - 0x016F80 05:AF70: D6        .byte $D6   ; 
- D 1 - I - 0x016F81 05:AF71: 13        .byte $13   ; 
- D 1 - I - 0x016F82 05:AF72: D9        .byte $D9   ; 
- D 1 - I - 0x016F83 05:AF73: D7        .byte $D7   ; 
- D 1 - I - 0x016F84 05:AF74: D8        .byte $D8   ; 
- D 1 - I - 0x016F85 05:AF75: 14        .byte $14   ; 
- D 1 - I - 0x016F86 05:AF76: D3        .byte $D3   ; 
- D 1 - I - 0x016F87 05:AF77: 02        .byte $02   ; 
- D 1 - I - 0x016F88 05:AF78: 1A        .byte $1A   ; 
- D 1 - I - 0x016F89 05:AF79: 00        .byte $00   ; 
- D 1 - I - 0x016F8A 05:AF7A: 1C        .byte $1C   ; 
- D 1 - I - 0x016F8B 05:AF7B: 00        .byte $00   ; 
- D 1 - I - 0x016F8C 05:AF7C: 00        .byte $00   ; 
- D 1 - I - 0x016F8D 05:AF7D: 00        .byte $00   ; 
- D 1 - I - 0x016F8E 05:AF7E: 00        .byte $00   ; 
- D 1 - I - 0x016F8F 05:AF7F: 00        .byte $00   ; 
- D 1 - I - 0x016F90 05:AF80: 00        .byte $00   ; 
- D 1 - I - 0x016F91 05:AF81: 00        .byte $00   ; 
- D 1 - I - 0x016F92 05:AF82: 00        .byte $00   ; 
- D 1 - I - 0x016F93 05:AF83: 00        .byte $00   ; 
- D 1 - I - 0x016F94 05:AF84: 00        .byte $00   ; 
- D 1 - I - 0x016F95 05:AF85: 00        .byte $00   ; 
- D 1 - I - 0x016F96 05:AF86: 00        .byte $00   ; 
- D 1 - I - 0x016F97 05:AF87: 14        .byte $14   ; 
- D 1 - I - 0x016F98 05:AF88: D3        .byte $D3   ; 
- D 1 - I - 0x016F99 05:AF89: 15        .byte $15   ; 
- D 1 - I - 0x016F9A 05:AF8A: D4        .byte $D4   ; 
- D 1 - I - 0x016F9B 05:AF8B: 15        .byte $15   ; 
- D 1 - I - 0x016F9C 05:AF8C: D4        .byte $D4   ; 
- D 1 - I - 0x016F9D 05:AF8D: 02        .byte $02   ; 
- D 1 - I - 0x016F9E 05:AF8E: D5        .byte $D5   ; 
- D 1 - I - 0x016F9F 05:AF8F: 02        .byte $02   ; 
- D 1 - I - 0x016FA0 05:AF90: 1A        .byte $1A   ; 
- D 1 - I - 0x016FA1 05:AF91: 00        .byte $00   ; 
- D 1 - I - 0x016FA2 05:AF92: 1C        .byte $1C   ; 
- D 1 - I - 0x016FA3 05:AF93: 00        .byte $00   ; 
- D 1 - I - 0x016FA4 05:AF94: 00        .byte $00   ; 
- D 1 - I - 0x016FA5 05:AF95: 00        .byte $00   ; 
- D 1 - I - 0x016FA6 05:AF96: 00        .byte $00   ; 
- - - - - - 0x016FA7 05:AF97: 16        .byte $16   ; 
- - - - - - 0x016FA8 05:AF98: E7        .byte $E7   ; 
- - - - - - 0x016FA9 05:AF99: 17        .byte $17   ; 
- - - - - - 0x016FAA 05:AF9A: D4        .byte $D4   ; 
- - - - - - 0x016FAB 05:AF9B: 15        .byte $15   ; 
- - - - - - 0x016FAC 05:AF9C: D4        .byte $D4   ; 
- - - - - - 0x016FAD 05:AF9D: 02        .byte $02   ; 
- - - - - - 0x016FAE 05:AF9E: D5        .byte $D5   ; 
- - - - - - 0x016FAF 05:AF9F: 02        .byte $02   ; 
- - - - - - 0x016FB0 05:AFA0: 1A        .byte $1A   ; 
- - - - - - 0x016FB1 05:AFA1: 00        .byte $00   ; 
- - - - - - 0x016FB2 05:AFA2: 1C        .byte $1C   ; 
- - - - - - 0x016FB3 05:AFA3: 00        .byte $00   ; 
- - - - - - 0x016FB4 05:AFA4: 00        .byte $00   ; 
- - - - - - 0x016FB5 05:AFA5: 00        .byte $00   ; 
- - - - - - 0x016FB6 05:AFA6: 00        .byte $00   ; 
- D 1 - I - 0x016FB7 05:AFA7: 07        .byte $07   ; 
- D 1 - I - 0x016FB8 05:AFA8: DA        .byte $DA   ; 
- D 1 - I - 0x016FB9 05:AFA9: 15        .byte $15   ; 
- D 1 - I - 0x016FBA 05:AFAA: D4        .byte $D4   ; 
- D 1 - I - 0x016FBB 05:AFAB: 15        .byte $15   ; 
- D 1 - I - 0x016FBC 05:AFAC: D4        .byte $D4   ; 
- D 1 - I - 0x016FBD 05:AFAD: 02        .byte $02   ; 
- D 1 - I - 0x016FBE 05:AFAE: D5        .byte $D5   ; 
- D 1 - I - 0x016FBF 05:AFAF: 02        .byte $02   ; 
- D 1 - I - 0x016FC0 05:AFB0: 1A        .byte $1A   ; 
- D 1 - I - 0x016FC1 05:AFB1: 00        .byte $00   ; 
- D 1 - I - 0x016FC2 05:AFB2: 1C        .byte $1C   ; 
- D 1 - I - 0x016FC3 05:AFB3: 00        .byte $00   ; 
- D 1 - I - 0x016FC4 05:AFB4: 00        .byte $00   ; 
- D 1 - I - 0x016FC5 05:AFB5: 00        .byte $00   ; 
- D 1 - I - 0x016FC6 05:AFB6: 00        .byte $00   ; 
- D 1 - I - 0x016FC7 05:AFB7: 00        .byte $00   ; 
- D 1 - I - 0x016FC8 05:AFB8: 00        .byte $00   ; 
- D 1 - I - 0x016FC9 05:AFB9: 00        .byte $00   ; 
- D 1 - I - 0x016FCA 05:AFBA: 00        .byte $00   ; 
- D 1 - I - 0x016FCB 05:AFBB: 00        .byte $00   ; 
- D 1 - I - 0x016FCC 05:AFBC: 00        .byte $00   ; 
- D 1 - I - 0x016FCD 05:AFBD: 00        .byte $00   ; 
- D 1 - I - 0x016FCE 05:AFBE: 00        .byte $00   ; 
- D 1 - I - 0x016FCF 05:AFBF: 68        .byte $68   ; 
- D 1 - I - 0x016FD0 05:AFC0: C0        .byte $C0   ; 
- D 1 - I - 0x016FD1 05:AFC1: 00        .byte $00   ; 
- D 1 - I - 0x016FD2 05:AFC2: 00        .byte $00   ; 
- D 1 - I - 0x016FD3 05:AFC3: 65        .byte $65   ; 
- D 1 - I - 0x016FD4 05:AFC4: BE        .byte $BE   ; 
- D 1 - I - 0x016FD5 05:AFC5: 68        .byte $68   ; 
- D 1 - I - 0x016FD6 05:AFC6: C0        .byte $C0   ; 
- D 1 - I - 0x016FD7 05:AFC7: 00        .byte $00   ; 
- D 1 - I - 0x016FD8 05:AFC8: 00        .byte $00   ; 
- D 1 - I - 0x016FD9 05:AFC9: 64        .byte $64   ; 
- D 1 - I - 0x016FDA 05:AFCA: CC        .byte $CC   ; 
- D 1 - I - 0x016FDB 05:AFCB: 64        .byte $64   ; 
- D 1 - I - 0x016FDC 05:AFCC: CC        .byte $CC   ; 
- D 1 - I - 0x016FDD 05:AFCD: 60        .byte $60   ; 
- D 1 - I - 0x016FDE 05:AFCE: CA        .byte $CA   ; 
- - - - - - 0x016FDF 05:AFCF: 60        .byte $60   ; 
- - - - - - 0x016FE0 05:AFD0: CA        .byte $CA   ; 
- - - - - - 0x016FE1 05:AFD1: 62        .byte $62   ; 
- - - - - - 0x016FE2 05:AFD2: CB        .byte $CB   ; 
- - - - - - 0x016FE3 05:AFD3: 15        .byte $15   ; 
- - - - - - 0x016FE4 05:AFD4: CB        .byte $CB   ; 
- - - - - - 0x016FE5 05:AFD5: 00        .byte $00   ; 
- - - - - - 0x016FE6 05:AFD6: 00        .byte $00   ; 
- D 1 - I - 0x016FE7 05:AFD7: 00        .byte $00   ; 
- D 1 - I - 0x016FE8 05:AFD8: 00        .byte $00   ; 
- D 1 - I - 0x016FE9 05:AFD9: 64        .byte $64   ; 
- D 1 - I - 0x016FEA 05:AFDA: CC        .byte $CC   ; 
- D 1 - I - 0x016FEB 05:AFDB: 64        .byte $64   ; 
- D 1 - I - 0x016FEC 05:AFDC: CC        .byte $CC   ; 
- D 1 - I - 0x016FED 05:AFDD: 60        .byte $60   ; 
- D 1 - I - 0x016FEE 05:AFDE: CA        .byte $CA   ; 
- D 1 - I - 0x016FEF 05:AFDF: 60        .byte $60   ; 
- D 1 - I - 0x016FF0 05:AFE0: CA        .byte $CA   ; 
- D 1 - I - 0x016FF1 05:AFE1: 62        .byte $62   ; 
- D 1 - I - 0x016FF2 05:AFE2: CF        .byte $CF   ; 
- D 1 - I - 0x016FF3 05:AFE3: 8E        .byte $8E   ; 
- D 1 - I - 0x016FF4 05:AFE4: E1        .byte $E1   ; 
- D 1 - I - 0x016FF5 05:AFE5: 0D        .byte $0D   ; 
- D 1 - I - 0x016FF6 05:AFE6: E3        .byte $E3   ; 
- D 1 - I - 0x016FF7 05:AFE7: 00        .byte $00   ; 
- D 1 - I - 0x016FF8 05:AFE8: 00        .byte $00   ; 
- D 1 - I - 0x016FF9 05:AFE9: 64        .byte $64   ; 
- D 1 - I - 0x016FFA 05:AFEA: CC        .byte $CC   ; 
- D 1 - I - 0x016FFB 05:AFEB: 64        .byte $64   ; 
- D 1 - I - 0x016FFC 05:AFEC: CC        .byte $CC   ; 
- D 1 - I - 0x016FFD 05:AFED: 60        .byte $60   ; 
- D 1 - I - 0x016FFE 05:AFEE: CA        .byte $CA   ; 
- D 1 - I - 0x016FFF 05:AFEF: 60        .byte $60   ; 
- D 1 - I - 0x017000 05:AFF0: CA        .byte $CA   ; 
- D 1 - I - 0x017001 05:AFF1: 62        .byte $62   ; 
- D 1 - I - 0x017002 05:AFF2: D0        .byte $D0   ; 
- D 1 - I - 0x017003 05:AFF3: CD        .byte $CD   ; 
- D 1 - I - 0x017004 05:AFF4: CE        .byte $CE   ; 
- D 1 - I - 0x017005 05:AFF5: D1        .byte $D1   ; 
- D 1 - I - 0x017006 05:AFF6: D2        .byte $D2   ; 
- - - - - - 0x017007 05:AFF7: 66        .byte $66   ; 
- - - - - - 0x017008 05:AFF8: BF        .byte $BF   ; 
- - - - - - 0x017009 05:AFF9: 65        .byte $65   ; 
- - - - - - 0x01700A 05:AFFA: BE        .byte $BE   ; 
- - - - - - 0x01700B 05:AFFB: 00        .byte $00   ; 
- - - - - - 0x01700C 05:AFFC: 00        .byte $00   ; 
- - - - - - 0x01700D 05:AFFD: 66        .byte $66   ; 
- - - - - - 0x01700E 05:AFFE: BF        .byte $BF   ; 
- - - - - - 0x01700F 05:AFFF: 00        .byte $00   ; 
- - - - - - 0x017010 05:B000: 00        .byte $00   ; 
- - - - - - 0x017011 05:B001: 00        .byte $00   ; 
- - - - - - 0x017012 05:B002: 00        .byte $00   ; 
- - - - - - 0x017013 05:B003: 19        .byte $19   ; 
- - - - - - 0x017014 05:B004: C1        .byte $C1   ; 
- - - - - - 0x017015 05:B005: 00        .byte $00   ; 
- - - - - - 0x017016 05:B006: 00        .byte $00   ; 
- - - - - - 0x017017 05:B007: 00        .byte $00   ; 
- - - - - - 0x017018 05:B008: 00        .byte $00   ; 
- - - - - - 0x017019 05:B009: 00        .byte $00   ; 
- - - - - - 0x01701A 05:B00A: 00        .byte $00   ; 
- - - - - - 0x01701B 05:B00B: 00        .byte $00   ; 
- - - - - - 0x01701C 05:B00C: 00        .byte $00   ; 
- - - - - - 0x01701D 05:B00D: 14        .byte $14   ; 
- - - - - - 0x01701E 05:B00E: D3        .byte $D3   ; 
- - - - - - 0x01701F 05:B00F: 14        .byte $14   ; 
- - - - - - 0x017020 05:B010: D3        .byte $D3   ; 
- - - - - - 0x017021 05:B011: 15        .byte $15   ; 
- - - - - - 0x017022 05:B012: D4        .byte $D4   ; 
- - - - - - 0x017023 05:B013: 15        .byte $15   ; 
- - - - - - 0x017024 05:B014: D4        .byte $D4   ; 
- - - - - - 0x017025 05:B015: 02        .byte $02   ; 
- - - - - - 0x017026 05:B016: D5        .byte $D5   ; 
- D 1 - I - 0x017027 05:B017: 10        .byte $10   ; 
- D 1 - I - 0x017028 05:B018: E2        .byte $E2   ; 
- D 1 - I - 0x017029 05:B019: 11        .byte $11   ; 
- D 1 - I - 0x01702A 05:B01A: E4        .byte $E4   ; 
- D 1 - I - 0x01702B 05:B01B: 0E        .byte $0E   ; 
- D 1 - I - 0x01702C 05:B01C: E5        .byte $E5   ; 
- D 1 - I - 0x01702D 05:B01D: 0F        .byte $0F   ; 
- D 1 - I - 0x01702E 05:B01E: E8        .byte $E8   ; 
- D 1 - I - 0x01702F 05:B01F: 16        .byte $16   ; 
- D 1 - I - 0x017030 05:B020: E7        .byte $E7   ; 
- D 1 - I - 0x017031 05:B021: 17        .byte $17   ; 
- D 1 - I - 0x017032 05:B022: D4        .byte $D4   ; 
- D 1 - I - 0x017033 05:B023: 15        .byte $15   ; 
- D 1 - I - 0x017034 05:B024: D4        .byte $D4   ; 
- D 1 - I - 0x017035 05:B025: 02        .byte $02   ; 
- D 1 - I - 0x017036 05:B026: D5        .byte $D5   ; 
- D 1 - I - 0x017037 05:B027: 12        .byte $12   ; 
- D 1 - I - 0x017038 05:B028: D6        .byte $D6   ; 
- D 1 - I - 0x017039 05:B029: 13        .byte $13   ; 
- D 1 - I - 0x01703A 05:B02A: D9        .byte $D9   ; 
- D 1 - I - 0x01703B 05:B02B: D7        .byte $D7   ; 
- D 1 - I - 0x01703C 05:B02C: D8        .byte $D8   ; 
- D 1 - I - 0x01703D 05:B02D: 14        .byte $14   ; 
- D 1 - I - 0x01703E 05:B02E: D3        .byte $D3   ; 
- D 1 - I - 0x01703F 05:B02F: 07        .byte $07   ; 
- D 1 - I - 0x017040 05:B030: DA        .byte $DA   ; 
- D 1 - I - 0x017041 05:B031: 15        .byte $15   ; 
- D 1 - I - 0x017042 05:B032: D4        .byte $D4   ; 
- D 1 - I - 0x017043 05:B033: 15        .byte $15   ; 
- D 1 - I - 0x017044 05:B034: D4        .byte $D4   ; 
- D 1 - I - 0x017045 05:B035: 02        .byte $02   ; 
- D 1 - I - 0x017046 05:B036: D5        .byte $D5   ; 
- D 1 - I - 0x017047 05:B037: 18        .byte $18   ; 
- D 1 - I - 0x017048 05:B038: BF        .byte $BF   ; 
- D 1 - I - 0x017049 05:B039: 19        .byte $19   ; 
- D 1 - I - 0x01704A 05:B03A: C1        .byte $C1   ; 
- D 1 - I - 0x01704B 05:B03B: D5        .byte $D5   ; 
- D 1 - I - 0x01704C 05:B03C: 02        .byte $02   ; 
- D 1 - I - 0x01704D 05:B03D: 18        .byte $18   ; 
- D 1 - I - 0x01704E 05:B03E: BF        .byte $BF   ; 
- D 1 - I - 0x01704F 05:B03F: 1C        .byte $1C   ; 
- D 1 - I - 0x017050 05:B040: 00        .byte $00   ; 
- D 1 - I - 0x017051 05:B041: 1A        .byte $1A   ; 
- D 1 - I - 0x017052 05:B042: 02        .byte $02   ; 
- D 1 - I - 0x017053 05:B043: 00        .byte $00   ; 
- D 1 - I - 0x017054 05:B044: 00        .byte $00   ; 
- D 1 - I - 0x017055 05:B045: 00        .byte $00   ; 
- D 1 - I - 0x017056 05:B046: 00        .byte $00   ; 
- D 1 - I - 0x017057 05:B047: 66        .byte $66   ; 
- D 1 - I - 0x017058 05:B048: BF        .byte $BF   ; 
- D 1 - I - 0x017059 05:B049: 65        .byte $65   ; 
- D 1 - I - 0x01705A 05:B04A: BE        .byte $BE   ; 
- D 1 - I - 0x01705B 05:B04B: 0C        .byte $0C   ; 
- D 1 - I - 0x01705C 05:B04C: E1        .byte $E1   ; 
- D 1 - I - 0x01705D 05:B04D: 0D        .byte $0D   ; 
- D 1 - I - 0x01705E 05:B04E: BF        .byte $BF   ; 
- D 1 - I - 0x01705F 05:B04F: 10        .byte $10   ; 
- D 1 - I - 0x017060 05:B050: E2        .byte $E2   ; 
- D 1 - I - 0x017061 05:B051: 11        .byte $11   ; 
- D 1 - I - 0x017062 05:B052: E4        .byte $E4   ; 
- D 1 - I - 0x017063 05:B053: 0E        .byte $0E   ; 
- D 1 - I - 0x017064 05:B054: E5        .byte $E5   ; 
- D 1 - I - 0x017065 05:B055: 0F        .byte $0F   ; 
- D 1 - I - 0x017066 05:B056: E8        .byte $E8   ; 
- D 1 - I - 0x017067 05:B057: 67        .byte $67   ; 
- D 1 - I - 0x017068 05:B058: BF        .byte $BF   ; 
- D 1 - I - 0x017069 05:B059: 65        .byte $65   ; 
- D 1 - I - 0x01706A 05:B05A: BE        .byte $BE   ; 
- D 1 - I - 0x01706B 05:B05B: C2        .byte $C2   ; 
- D 1 - I - 0x01706C 05:B05C: C3        .byte $C3   ; 
- D 1 - I - 0x01706D 05:B05D: C5        .byte $C5   ; 
- D 1 - I - 0x01706E 05:B05E: C6        .byte $C6   ; 
- D 1 - I - 0x01706F 05:B05F: 00        .byte $00   ; 
- D 1 - I - 0x017070 05:B060: C4        .byte $C4   ; 
- D 1 - I - 0x017071 05:B061: 1B        .byte $1B   ; 
- D 1 - I - 0x017072 05:B062: C7        .byte $C7   ; 
- D 1 - I - 0x017073 05:B063: 19        .byte $19   ; 
- D 1 - I - 0x017074 05:B064: C1        .byte $C1   ; 
- D 1 - I - 0x017075 05:B065: D7        .byte $D7   ; 
- D 1 - I - 0x017076 05:B066: D8        .byte $D8   ; 
- D 1 - I - 0x017077 05:B067: 68        .byte $68   ; 
- D 1 - I - 0x017078 05:B068: C0        .byte $C0   ; 
- D 1 - I - 0x017079 05:B069: 00        .byte $00   ; 
- D 1 - I - 0x01707A 05:B06A: 00        .byte $00   ; 
- D 1 - I - 0x01707B 05:B06B: 65        .byte $65   ; 
- D 1 - I - 0x01707C 05:B06C: BE        .byte $BE   ; 
- D 1 - I - 0x01707D 05:B06D: 68        .byte $68   ; 
- D 1 - I - 0x01707E 05:B06E: C0        .byte $C0   ; 
- D 1 - I - 0x01707F 05:B06F: 66        .byte $66   ; 
- D 1 - I - 0x017080 05:B070: BF        .byte $BF   ; 
- D 1 - I - 0x017081 05:B071: 65        .byte $65   ; 
- D 1 - I - 0x017082 05:B072: BE        .byte $BE   ; 
- D 1 - I - 0x017083 05:B073: 00        .byte $00   ; 
- D 1 - I - 0x017084 05:B074: 00        .byte $00   ; 
- D 1 - I - 0x017085 05:B075: 66        .byte $66   ; 
- D 1 - I - 0x017086 05:B076: BF        .byte $BF   ; 
- D 1 - I - 0x017087 05:B077: 68        .byte $68   ; 
- D 1 - I - 0x017088 05:B078: C0        .byte $C0   ; 
- D 1 - I - 0x017089 05:B079: 00        .byte $00   ; 
- D 1 - I - 0x01708A 05:B07A: 00        .byte $00   ; 
- D 1 - I - 0x01708B 05:B07B: 65        .byte $65   ; 
- D 1 - I - 0x01708C 05:B07C: BE        .byte $BE   ; 
- D 1 - I - 0x01708D 05:B07D: 68        .byte $68   ; 
- D 1 - I - 0x01708E 05:B07E: C0        .byte $C0   ; 
- D 1 - I - 0x01708F 05:B07F: 66        .byte $66   ; 
- D 1 - I - 0x017090 05:B080: BF        .byte $BF   ; 
- D 1 - I - 0x017091 05:B081: 65        .byte $65   ; 
- D 1 - I - 0x017092 05:B082: BE        .byte $BE   ; 
- D 1 - I - 0x017093 05:B083: 0C        .byte $0C   ; 
- D 1 - I - 0x017094 05:B084: E1        .byte $E1   ; 
- D 1 - I - 0x017095 05:B085: 0D        .byte $0D   ; 
- D 1 - I - 0x017096 05:B086: BF        .byte $BF   ; 
- D 1 - I - 0x017097 05:B087: 18        .byte $18   ; 
- D 1 - I - 0x017098 05:B088: E7        .byte $E7   ; 
- D 1 - I - 0x017099 05:B089: 17        .byte $17   ; 
- D 1 - I - 0x01709A 05:B08A: C9        .byte $C9   ; 
- D 1 - I - 0x01709B 05:B08B: D5        .byte $D5   ; 
- D 1 - I - 0x01709C 05:B08C: 02        .byte $02   ; 
- D 1 - I - 0x01709D 05:B08D: 18        .byte $18   ; 
- D 1 - I - 0x01709E 05:B08E: BF        .byte $BF   ; 
- D 1 - I - 0x01709F 05:B08F: 1C        .byte $1C   ; 
- D 1 - I - 0x0170A0 05:B090: 00        .byte $00   ; 
- D 1 - I - 0x0170A1 05:B091: 1A        .byte $1A   ; 
- D 1 - I - 0x0170A2 05:B092: 02        .byte $02   ; 
- D 1 - I - 0x0170A3 05:B093: 00        .byte $00   ; 
- D 1 - I - 0x0170A4 05:B094: 00        .byte $00   ; 
- D 1 - I - 0x0170A5 05:B095: 00        .byte $00   ; 
- D 1 - I - 0x0170A6 05:B096: 00        .byte $00   ; 
- D 1 - I - 0x0170A7 05:B097: 18        .byte $18   ; 
- D 1 - I - 0x0170A8 05:B098: BF        .byte $BF   ; 
- D 1 - I - 0x0170A9 05:B099: 07        .byte $07   ; 
- D 1 - I - 0x0170AA 05:B09A: C8        .byte $C8   ; 
- D 1 - I - 0x0170AB 05:B09B: D5        .byte $D5   ; 
- D 1 - I - 0x0170AC 05:B09C: 02        .byte $02   ; 
- D 1 - I - 0x0170AD 05:B09D: 18        .byte $18   ; 
- D 1 - I - 0x0170AE 05:B09E: BF        .byte $BF   ; 
- D 1 - I - 0x0170AF 05:B09F: 00        .byte $00   ; 
- D 1 - I - 0x0170B0 05:B0A0: 00        .byte $00   ; 
- D 1 - I - 0x0170B1 05:B0A1: 1A        .byte $1A   ; 
- D 1 - I - 0x0170B2 05:B0A2: 02        .byte $02   ; 
- D 1 - I - 0x0170B3 05:B0A3: 00        .byte $00   ; 
- D 1 - I - 0x0170B4 05:B0A4: 00        .byte $00   ; 
- D 1 - I - 0x0170B5 05:B0A5: 00        .byte $00   ; 
- D 1 - I - 0x0170B6 05:B0A6: 00        .byte $00   ; 
- D 1 - I - 0x0170B7 05:B0A7: 00        .byte $00   ; 
- D 1 - I - 0x0170B8 05:B0A8: 00        .byte $00   ; 
- D 1 - I - 0x0170B9 05:B0A9: 00        .byte $00   ; 
- D 1 - I - 0x0170BA 05:B0AA: 00        .byte $00   ; 
- D 1 - I - 0x0170BB 05:B0AB: 19        .byte $19   ; 
- D 1 - I - 0x0170BC 05:B0AC: C1        .byte $C1   ; 
- D 1 - I - 0x0170BD 05:B0AD: 00        .byte $00   ; 
- D 1 - I - 0x0170BE 05:B0AE: 00        .byte $00   ; 
- D 1 - I - 0x0170BF 05:B0AF: 18        .byte $18   ; 
- D 1 - I - 0x0170C0 05:B0B0: BF        .byte $BF   ; 
- D 1 - I - 0x0170C1 05:B0B1: 19        .byte $19   ; 
- D 1 - I - 0x0170C2 05:B0B2: C1        .byte $C1   ; 
- D 1 - I - 0x0170C3 05:B0B3: D5        .byte $D5   ; 
- D 1 - I - 0x0170C4 05:B0B4: 02        .byte $02   ; 
- D 1 - I - 0x0170C5 05:B0B5: 18        .byte $18   ; 
- D 1 - I - 0x0170C6 05:B0B6: BF        .byte $BF   ; 
- D 1 - I - 0x0170C7 05:B0B7: 10        .byte $10   ; 
- D 1 - I - 0x0170C8 05:B0B8: E2        .byte $E2   ; 
- D 1 - I - 0x0170C9 05:B0B9: 11        .byte $11   ; 
- D 1 - I - 0x0170CA 05:B0BA: E4        .byte $E4   ; 
- D 1 - I - 0x0170CB 05:B0BB: 0E        .byte $0E   ; 
- D 1 - I - 0x0170CC 05:B0BC: E5        .byte $E5   ; 
- D 1 - I - 0x0170CD 05:B0BD: 0F        .byte $0F   ; 
- D 1 - I - 0x0170CE 05:B0BE: E8        .byte $E8   ; 
- D 1 - I - 0x0170CF 05:B0BF: 18        .byte $18   ; 
- D 1 - I - 0x0170D0 05:B0C0: E7        .byte $E7   ; 
- D 1 - I - 0x0170D1 05:B0C1: 17        .byte $17   ; 
- D 1 - I - 0x0170D2 05:B0C2: C9        .byte $C9   ; 
- D 1 - I - 0x0170D3 05:B0C3: D5        .byte $D5   ; 
- D 1 - I - 0x0170D4 05:B0C4: 02        .byte $02   ; 
- D 1 - I - 0x0170D5 05:B0C5: 18        .byte $18   ; 
- D 1 - I - 0x0170D6 05:B0C6: BF        .byte $BF   ; 
- - - - - - 0x0170D7 05:B0C7: 68        .byte $68   ; 
- - - - - - 0x0170D8 05:B0C8: C0        .byte $C0   ; 
- - - - - - 0x0170D9 05:B0C9: 00        .byte $00   ; 
- - - - - - 0x0170DA 05:B0CA: 00        .byte $00   ; 
- - - - - - 0x0170DB 05:B0CB: 65        .byte $65   ; 
- - - - - - 0x0170DC 05:B0CC: BE        .byte $BE   ; 
- - - - - - 0x0170DD 05:B0CD: 68        .byte $68   ; 
- - - - - - 0x0170DE 05:B0CE: C0        .byte $C0   ; 
- - - - - - 0x0170DF 05:B0CF: 67        .byte $67   ; 
- - - - - - 0x0170E0 05:B0D0: BF        .byte $BF   ; 
- - - - - - 0x0170E1 05:B0D1: 65        .byte $65   ; 
- - - - - - 0x0170E2 05:B0D2: BE        .byte $BE   ; 
- - - - - - 0x0170E3 05:B0D3: C2        .byte $C2   ; 
- - - - - - 0x0170E4 05:B0D4: C3        .byte $C3   ; 
- - - - - - 0x0170E5 05:B0D5: C5        .byte $C5   ; 
- - - - - - 0x0170E6 05:B0D6: C6        .byte $C6   ; 
- D 1 - I - 0x0170E7 05:B0D7: 1C        .byte $1C   ; 
- D 1 - I - 0x0170E8 05:B0D8: 00        .byte $00   ; 
- D 1 - I - 0x0170E9 05:B0D9: 1A        .byte $1A   ; 
- D 1 - I - 0x0170EA 05:B0DA: 02        .byte $02   ; 
- D 1 - I - 0x0170EB 05:B0DB: 00        .byte $00   ; 
- D 1 - I - 0x0170EC 05:B0DC: 00        .byte $00   ; 
- D 1 - I - 0x0170ED 05:B0DD: 00        .byte $00   ; 
- D 1 - I - 0x0170EE 05:B0DE: 00        .byte $00   ; 
- D 1 - I - 0x0170EF 05:B0DF: 00        .byte $00   ; 
- D 1 - I - 0x0170F0 05:B0E0: 00        .byte $00   ; 
- D 1 - I - 0x0170F1 05:B0E1: 00        .byte $00   ; 
- D 1 - I - 0x0170F2 05:B0E2: 00        .byte $00   ; 
- D 1 - I - 0x0170F3 05:B0E3: 00        .byte $00   ; 
- D 1 - I - 0x0170F4 05:B0E4: 00        .byte $00   ; 
- D 1 - I - 0x0170F5 05:B0E5: 00        .byte $00   ; 
- D 1 - I - 0x0170F6 05:B0E6: 00        .byte $00   ; 
- D 1 - I - 0x0170F7 05:B0E7: 00        .byte $00   ; 
- D 1 - I - 0x0170F8 05:B0E8: 00        .byte $00   ; 
- D 1 - I - 0x0170F9 05:B0E9: 00        .byte $00   ; 
- D 1 - I - 0x0170FA 05:B0EA: 00        .byte $00   ; 
- D 1 - I - 0x0170FB 05:B0EB: 00        .byte $00   ; 
- D 1 - I - 0x0170FC 05:B0EC: 00        .byte $00   ; 
- D 1 - I - 0x0170FD 05:B0ED: 00        .byte $00   ; 
- D 1 - I - 0x0170FE 05:B0EE: 00        .byte $00   ; 
- D 1 - I - 0x0170FF 05:B0EF: 00        .byte $00   ; 
- D 1 - I - 0x017100 05:B0F0: 00        .byte $00   ; 
- D 1 - I - 0x017101 05:B0F1: 64        .byte $64   ; 
- D 1 - I - 0x017102 05:B0F2: B8        .byte $B8   ; 
- D 1 - I - 0x017103 05:B0F3: 64        .byte $64   ; 
- D 1 - I - 0x017104 05:B0F4: CC        .byte $CC   ; 
- D 1 - I - 0x017105 05:B0F5: 60        .byte $60   ; 
- D 1 - I - 0x017106 05:B0F6: B9        .byte $B9   ; 
- D 1 - I - 0x017107 05:B0F7: 61        .byte $61   ; 
- D 1 - I - 0x017108 05:B0F8: CA        .byte $CA   ; 
- D 1 - I - 0x017109 05:B0F9: 62        .byte $62   ; 
- D 1 - I - 0x01710A 05:B0FA: D0        .byte $D0   ; 
- D 1 - I - 0x01710B 05:B0FB: 63        .byte $63   ; 
- D 1 - I - 0x01710C 05:B0FC: D0        .byte $D0   ; 
- D 1 - I - 0x01710D 05:B0FD: D1        .byte $D1   ; 
- D 1 - I - 0x01710E 05:B0FE: D2        .byte $D2   ; 
- D 1 - I - 0x01710F 05:B0FF: 00        .byte $00   ; 
- D 1 - I - 0x017110 05:B100: D7        .byte $D7   ; 
- D 1 - I - 0x017111 05:B101: 17        .byte $17   ; 
- D 1 - I - 0x017112 05:B102: 00        .byte $00   ; 
- D 1 - I - 0x017113 05:B103: D7        .byte $D7   ; 
- D 1 - I - 0x017114 05:B104: D8        .byte $D8   ; 
- D 1 - I - 0x017115 05:B105: 14        .byte $14   ; 
- D 1 - I - 0x017116 05:B106: B7        .byte $B7   ; 
- D 1 - I - 0x017117 05:B107: 00        .byte $00   ; 
- D 1 - I - 0x017118 05:B108: C4        .byte $C4   ; 
- D 1 - I - 0x017119 05:B109: 1B        .byte $1B   ; 
- D 1 - I - 0x01711A 05:B10A: C7        .byte $C7   ; 
- D 1 - I - 0x01711B 05:B10B: 19        .byte $19   ; 
- D 1 - I - 0x01711C 05:B10C: C1        .byte $C1   ; 
- D 1 - I - 0x01711D 05:B10D: D7        .byte $D7   ; 
- D 1 - I - 0x01711E 05:B10E: D8        .byte $D8   ; 
- D 1 - I - 0x01711F 05:B10F: 18        .byte $18   ; 
- D 1 - I - 0x017120 05:B110: BF        .byte $BF   ; 
- D 1 - I - 0x017121 05:B111: 07        .byte $07   ; 
- D 1 - I - 0x017122 05:B112: C8        .byte $C8   ; 
- D 1 - I - 0x017123 05:B113: D5        .byte $D5   ; 
- D 1 - I - 0x017124 05:B114: 02        .byte $02   ; 
- D 1 - I - 0x017125 05:B115: 18        .byte $18   ; 
- D 1 - I - 0x017126 05:B116: BF        .byte $BF   ; 
- D 1 - I - 0x017127 05:B117: 00        .byte $00   ; 
- D 1 - I - 0x017128 05:B118: 00        .byte $00   ; 
- D 1 - I - 0x017129 05:B119: 00        .byte $00   ; 
- D 1 - I - 0x01712A 05:B11A: 00        .byte $00   ; 
- D 1 - I - 0x01712B 05:B11B: 00        .byte $00   ; 
- D 1 - I - 0x01712C 05:B11C: 00        .byte $00   ; 
- D 1 - I - 0x01712D 05:B11D: 00        .byte $00   ; 
- D 1 - I - 0x01712E 05:B11E: 00        .byte $00   ; 
- D 1 - I - 0x01712F 05:B11F: 69        .byte $69   ; 
- D 1 - I - 0x017130 05:B120: C0        .byte $C0   ; 
- D 1 - I - 0x017131 05:B121: 00        .byte $00   ; 
- D 1 - I - 0x017132 05:B122: 00        .byte $00   ; 
- D 1 - I - 0x017133 05:B123: BA        .byte $BA   ; 
- D 1 - I - 0x017134 05:B124: BE        .byte $BE   ; 
- D 1 - I - 0x017135 05:B125: 68        .byte $68   ; 
- D 1 - I - 0x017136 05:B126: C0        .byte $C0   ; 
- D 1 - I - 0x017137 05:B127: 60        .byte $60   ; 
- D 1 - I - 0x017138 05:B128: CA        .byte $CA   ; 
- D 1 - I - 0x017139 05:B129: 62        .byte $62   ; 
- D 1 - I - 0x01713A 05:B12A: D0        .byte $D0   ; 
- D 1 - I - 0x01713B 05:B12B: CD        .byte $CD   ; 
- D 1 - I - 0x01713C 05:B12C: CE        .byte $CE   ; 
- D 1 - I - 0x01713D 05:B12D: D1        .byte $D1   ; 
- D 1 - I - 0x01713E 05:B12E: D2        .byte $D2   ; 
- D 1 - I - 0x01713F 05:B12F: 12        .byte $12   ; 
- D 1 - I - 0x017140 05:B130: D6        .byte $D6   ; 
- D 1 - I - 0x017141 05:B131: 17        .byte $17   ; 
- D 1 - I - 0x017142 05:B132: 00        .byte $00   ; 
- D 1 - I - 0x017143 05:B133: D7        .byte $D7   ; 
- D 1 - I - 0x017144 05:B134: D8        .byte $D8   ; 
- D 1 - I - 0x017145 05:B135: 14        .byte $14   ; 
- D 1 - I - 0x017146 05:B136: B7        .byte $B7   ; 
- D 1 - I - 0x017147 05:B137: 07        .byte $07   ; 
- D 1 - I - 0x017148 05:B138: DA        .byte $DA   ; 
- D 1 - I - 0x017149 05:B139: 15        .byte $15   ; 
- D 1 - I - 0x01714A 05:B13A: D4        .byte $D4   ; 
- D 1 - I - 0x01714B 05:B13B: 63        .byte $63   ; 
- D 1 - I - 0x01714C 05:B13C: D4        .byte $D4   ; 
- D 1 - I - 0x01714D 05:B13D: 02        .byte $02   ; 
- D 1 - I - 0x01714E 05:B13E: D5        .byte $D5   ; 
- D 1 - I - 0x01714F 05:B13F: 33        .byte $33   ; 
- D 1 - I - 0x017150 05:B140: 00        .byte $00   ; 
- D 1 - I - 0x017151 05:B141: 00        .byte $00   ; 
- D 1 - I - 0x017152 05:B142: 1C        .byte $1C   ; 
- D 1 - I - 0x017153 05:B143: 32        .byte $32   ; 
- D 1 - I - 0x017154 05:B144: 6B        .byte $6B   ; 
- D 1 - I - 0x017155 05:B145: 00        .byte $00   ; 
- D 1 - I - 0x017156 05:B146: 00        .byte $00   ; 
- D 1 - I - 0x017157 05:B147: 61        .byte $61   ; 
- D 1 - I - 0x017158 05:B148: CA        .byte $CA   ; 
- D 1 - I - 0x017159 05:B149: 62        .byte $62   ; 
- D 1 - I - 0x01715A 05:B14A: CB        .byte $CB   ; 
- D 1 - I - 0x01715B 05:B14B: 63        .byte $63   ; 
- D 1 - I - 0x01715C 05:B14C: CB        .byte $CB   ; 
- D 1 - I - 0x01715D 05:B14D: 00        .byte $00   ; 
- D 1 - I - 0x01715E 05:B14E: 00        .byte $00   ; 
- D 1 - I - 0x01715F 05:B14F: 00        .byte $00   ; 
- D 1 - I - 0x017160 05:B150: 00        .byte $00   ; 
- D 1 - I - 0x017161 05:B151: 00        .byte $00   ; 
- D 1 - I - 0x017162 05:B152: 00        .byte $00   ; 
- D 1 - I - 0x017163 05:B153: 00        .byte $00   ; 
- D 1 - I - 0x017164 05:B154: 00        .byte $00   ; 
- D 1 - I - 0x017165 05:B155: 14        .byte $14   ; 
- D 1 - I - 0x017166 05:B156: D3        .byte $D3   ; 
- D 1 - I - 0x017167 05:B157: 00        .byte $00   ; 
- D 1 - I - 0x017168 05:B158: 00        .byte $00   ; 
- D 1 - I - 0x017169 05:B159: 64        .byte $64   ; 
- D 1 - I - 0x01716A 05:B15A: B8        .byte $B8   ; 
- D 1 - I - 0x01716B 05:B15B: 64        .byte $64   ; 
- D 1 - I - 0x01716C 05:B15C: CC        .byte $CC   ; 
- D 1 - I - 0x01716D 05:B15D: 60        .byte $60   ; 
- D 1 - I - 0x01716E 05:B15E: B9        .byte $B9   ; 
- D 1 - I - 0x01716F 05:B15F: 60        .byte $60   ; 
- D 1 - I - 0x017170 05:B160: CA        .byte $CA   ; 
- D 1 - I - 0x017171 05:B161: 62        .byte $62   ; 
- D 1 - I - 0x017172 05:B162: CF        .byte $CF   ; 
- D 1 - I - 0x017173 05:B163: 8E        .byte $8E   ; 
- D 1 - I - 0x017174 05:B164: E1        .byte $E1   ; 
- D 1 - I - 0x017175 05:B165: 0D        .byte $0D   ; 
- D 1 - I - 0x017176 05:B166: E3        .byte $E3   ; 
- D 1 - I - 0x017177 05:B167: 00        .byte $00   ; 
- D 1 - I - 0x017178 05:B168: 00        .byte $00   ; 
- D 1 - I - 0x017179 05:B169: 00        .byte $00   ; 
- D 1 - I - 0x01717A 05:B16A: 00        .byte $00   ; 
- D 1 - I - 0x01717B 05:B16B: 00        .byte $00   ; 
- D 1 - I - 0x01717C 05:B16C: 00        .byte $00   ; 
- D 1 - I - 0x01717D 05:B16D: 00        .byte $00   ; 
- D 1 - I - 0x01717E 05:B16E: 00        .byte $00   ; 
- D 1 - I - 0x01717F 05:B16F: 00        .byte $00   ; 
- D 1 - I - 0x017180 05:B170: 00        .byte $00   ; 
- D 1 - I - 0x017181 05:B171: 64        .byte $64   ; 
- D 1 - I - 0x017182 05:B172: CC        .byte $CC   ; 
- D 1 - I - 0x017183 05:B173: 00        .byte $00   ; 
- D 1 - I - 0x017184 05:B174: 00        .byte $00   ; 
- D 1 - I - 0x017185 05:B175: 61        .byte $61   ; 
- D 1 - I - 0x017186 05:B176: CA        .byte $CA   ; 
- D 1 - I - 0x017187 05:B177: 00        .byte $00   ; 
- D 1 - I - 0x017188 05:B178: 00        .byte $00   ; 
- D 1 - I - 0x017189 05:B179: 00        .byte $00   ; 
- D 1 - I - 0x01718A 05:B17A: 00        .byte $00   ; 
- D 1 - I - 0x01718B 05:B17B: 00        .byte $00   ; 
- D 1 - I - 0x01718C 05:B17C: 00        .byte $00   ; 
- D 1 - I - 0x01718D 05:B17D: 00        .byte $00   ; 
- D 1 - I - 0x01718E 05:B17E: 00        .byte $00   ; 
- D 1 - I - 0x01718F 05:B17F: 00        .byte $00   ; 
- D 1 - I - 0x017190 05:B180: 00        .byte $00   ; 
- D 1 - I - 0x017191 05:B181: 64        .byte $64   ; 
- D 1 - I - 0x017192 05:B182: B8        .byte $B8   ; 
- D 1 - I - 0x017193 05:B183: 64        .byte $64   ; 
- D 1 - I - 0x017194 05:B184: CC        .byte $CC   ; 
- D 1 - I - 0x017195 05:B185: 60        .byte $60   ; 
- D 1 - I - 0x017196 05:B186: B9        .byte $B9   ; 
- D 1 - I - 0x017197 05:B187: 68        .byte $68   ; 
- D 1 - I - 0x017198 05:B188: C0        .byte $C0   ; 
- D 1 - I - 0x017199 05:B189: 1D        .byte $1D   ; 
- D 1 - I - 0x01719A 05:B18A: CB        .byte $CB   ; 
- D 1 - I - 0x01719B 05:B18B: 65        .byte $65   ; 
- D 1 - I - 0x01719C 05:B18C: BE        .byte $BE   ; 
- D 1 - I - 0x01719D 05:B18D: 68        .byte $68   ; 
- D 1 - I - 0x01719E 05:B18E: C0        .byte $C0   ; 
- D 1 - I - 0x01719F 05:B18F: 66        .byte $66   ; 
- D 1 - I - 0x0171A0 05:B190: BF        .byte $BF   ; 
- D 1 - I - 0x0171A1 05:B191: 65        .byte $65   ; 
- D 1 - I - 0x0171A2 05:B192: BE        .byte $BE   ; 
- D 1 - I - 0x0171A3 05:B193: 00        .byte $00   ; 
- D 1 - I - 0x0171A4 05:B194: 00        .byte $00   ; 
- D 1 - I - 0x0171A5 05:B195: 66        .byte $66   ; 
- D 1 - I - 0x0171A6 05:B196: BF        .byte $BF   ; 
- D 1 - I - 0x0171A7 05:B197: 00        .byte $00   ; 
- D 1 - I - 0x0171A8 05:B198: 00        .byte $00   ; 
- D 1 - I - 0x0171A9 05:B199: 1D        .byte $1D   ; 
- D 1 - I - 0x0171AA 05:B19A: D4        .byte $D4   ; 
- D 1 - I - 0x0171AB 05:B19B: 00        .byte $00   ; 
- D 1 - I - 0x0171AC 05:B19C: 00        .byte $00   ; 
- D 1 - I - 0x0171AD 05:B19D: 00        .byte $00   ; 
- D 1 - I - 0x0171AE 05:B19E: D5        .byte $D5   ; 
- D 1 - I - 0x0171AF 05:B19F: 00        .byte $00   ; 
- D 1 - I - 0x0171B0 05:B1A0: 00        .byte $00   ; 
- D 1 - I - 0x0171B1 05:B1A1: 00        .byte $00   ; 
- D 1 - I - 0x0171B2 05:B1A2: 1C        .byte $1C   ; 
- D 1 - I - 0x0171B3 05:B1A3: 00        .byte $00   ; 
- D 1 - I - 0x0171B4 05:B1A4: 00        .byte $00   ; 
- D 1 - I - 0x0171B5 05:B1A5: 00        .byte $00   ; 
- D 1 - I - 0x0171B6 05:B1A6: 00        .byte $00   ; 
- D 1 - I - 0x0171B7 05:B1A7: 00        .byte $00   ; 
- D 1 - I - 0x0171B8 05:B1A8: 00        .byte $00   ; 
- D 1 - I - 0x0171B9 05:B1A9: 63        .byte $63   ; 
- D 1 - I - 0x0171BA 05:B1AA: CB        .byte $CB   ; 
- D 1 - I - 0x0171BB 05:B1AB: 00        .byte $00   ; 
- D 1 - I - 0x0171BC 05:B1AC: 00        .byte $00   ; 
- D 1 - I - 0x0171BD 05:B1AD: 00        .byte $00   ; 
- D 1 - I - 0x0171BE 05:B1AE: 00        .byte $00   ; 
- D 1 - I - 0x0171BF 05:B1AF: 00        .byte $00   ; 
- D 1 - I - 0x0171C0 05:B1B0: 00        .byte $00   ; 
- D 1 - I - 0x0171C1 05:B1B1: 00        .byte $00   ; 
- D 1 - I - 0x0171C2 05:B1B2: 00        .byte $00   ; 
- D 1 - I - 0x0171C3 05:B1B3: 00        .byte $00   ; 
- D 1 - I - 0x0171C4 05:B1B4: 00        .byte $00   ; 
- D 1 - I - 0x0171C5 05:B1B5: 14        .byte $14   ; 
- D 1 - I - 0x0171C6 05:B1B6: D3        .byte $D3   ; 
- D 1 - I - 0x0171C7 05:B1B7: 60        .byte $60   ; 
- D 1 - I - 0x0171C8 05:B1B8: CA        .byte $CA   ; 
- D 1 - I - 0x0171C9 05:B1B9: 62        .byte $62   ; 
- D 1 - I - 0x0171CA 05:B1BA: D0        .byte $D0   ; 
- D 1 - I - 0x0171CB 05:B1BB: CD        .byte $CD   ; 
- D 1 - I - 0x0171CC 05:B1BC: CE        .byte $CE   ; 
- D 1 - I - 0x0171CD 05:B1BD: D1        .byte $D1   ; 
- D 1 - I - 0x0171CE 05:B1BE: D2        .byte $D2   ; 
- D 1 - I - 0x0171CF 05:B1BF: 12        .byte $12   ; 
- D 1 - I - 0x0171D0 05:B1C0: D6        .byte $D6   ; 
- D 1 - I - 0x0171D1 05:B1C1: 13        .byte $13   ; 
- D 1 - I - 0x0171D2 05:B1C2: 00        .byte $00   ; 
- D 1 - I - 0x0171D3 05:B1C3: D7        .byte $D7   ; 
- D 1 - I - 0x0171D4 05:B1C4: D8        .byte $D8   ; 
- D 1 - I - 0x0171D5 05:B1C5: 14        .byte $14   ; 
- D 1 - I - 0x0171D6 05:B1C6: B7        .byte $B7   ; 
- D 1 - I - 0x0171D7 05:B1C7: 61        .byte $61   ; 
- D 1 - I - 0x0171D8 05:B1C8: CA        .byte $CA   ; 
- D 1 - I - 0x0171D9 05:B1C9: 62        .byte $62   ; 
- D 1 - I - 0x0171DA 05:B1CA: D0        .byte $D0   ; 
- D 1 - I - 0x0171DB 05:B1CB: 63        .byte $63   ; 
- D 1 - I - 0x0171DC 05:B1CC: D0        .byte $D0   ; 
- D 1 - I - 0x0171DD 05:B1CD: D1        .byte $D1   ; 
- D 1 - I - 0x0171DE 05:B1CE: D2        .byte $D2   ; 
- D 1 - I - 0x0171DF 05:B1CF: 00        .byte $00   ; 
- D 1 - I - 0x0171E0 05:B1D0: D6        .byte $D6   ; 
- D 1 - I - 0x0171E1 05:B1D1: 13        .byte $13   ; 
- D 1 - I - 0x0171E2 05:B1D2: D9        .byte $D9   ; 
- D 1 - I - 0x0171E3 05:B1D3: D7        .byte $D7   ; 
- D 1 - I - 0x0171E4 05:B1D4: D8        .byte $D8   ; 
- D 1 - I - 0x0171E5 05:B1D5: 14        .byte $14   ; 
- D 1 - I - 0x0171E6 05:B1D6: D3        .byte $D3   ; 
- D 1 - I - 0x0171E7 05:B1D7: 69        .byte $69   ; 
- D 1 - I - 0x0171E8 05:B1D8: C0        .byte $C0   ; 
- D 1 - I - 0x0171E9 05:B1D9: 00        .byte $00   ; 
- D 1 - I - 0x0171EA 05:B1DA: 00        .byte $00   ; 
- D 1 - I - 0x0171EB 05:B1DB: BA        .byte $BA   ; 
- D 1 - I - 0x0171EC 05:B1DC: BE        .byte $BE   ; 
- D 1 - I - 0x0171ED 05:B1DD: 68        .byte $68   ; 
- D 1 - I - 0x0171EE 05:B1DE: C0        .byte $C0   ; 
- D 1 - I - 0x0171EF 05:B1DF: 67        .byte $67   ; 
- D 1 - I - 0x0171F0 05:B1E0: BF        .byte $BF   ; 
- D 1 - I - 0x0171F1 05:B1E1: 65        .byte $65   ; 
- D 1 - I - 0x0171F2 05:B1E2: BE        .byte $BE   ; 
- D 1 - I - 0x0171F3 05:B1E3: C2        .byte $C2   ; 
- D 1 - I - 0x0171F4 05:B1E4: C3        .byte $C3   ; 
- D 1 - I - 0x0171F5 05:B1E5: C5        .byte $C5   ; 
- D 1 - I - 0x0171F6 05:B1E6: C6        .byte $C6   ; 
- D 1 - I - 0x0171F7 05:B1E7: 66        .byte $66   ; 
- D 1 - I - 0x0171F8 05:B1E8: BF        .byte $BF   ; 
- D 1 - I - 0x0171F9 05:B1E9: 65        .byte $65   ; 
- D 1 - I - 0x0171FA 05:B1EA: BB        .byte $BB   ; 
- D 1 - I - 0x0171FB 05:B1EB: 00        .byte $00   ; 
- D 1 - I - 0x0171FC 05:B1EC: 00        .byte $00   ; 
- D 1 - I - 0x0171FD 05:B1ED: 66        .byte $66   ; 
- D 1 - I - 0x0171FE 05:B1EE: BC        .byte $BC   ; 
- D 1 - I - 0x0171FF 05:B1EF: 00        .byte $00   ; 
- D 1 - I - 0x017200 05:B1F0: 00        .byte $00   ; 
- D 1 - I - 0x017201 05:B1F1: 00        .byte $00   ; 
- D 1 - I - 0x017202 05:B1F2: 00        .byte $00   ; 
- D 1 - I - 0x017203 05:B1F3: 19        .byte $19   ; 
- D 1 - I - 0x017204 05:B1F4: C1        .byte $C1   ; 
- D 1 - I - 0x017205 05:B1F5: 00        .byte $00   ; 
- D 1 - I - 0x017206 05:B1F6: 00        .byte $00   ; 
- D 1 - I - 0x017207 05:B1F7: 68        .byte $68   ; 
- D 1 - I - 0x017208 05:B1F8: C0        .byte $C0   ; 
- D 1 - I - 0x017209 05:B1F9: 00        .byte $00   ; 
- D 1 - I - 0x01720A 05:B1FA: 00        .byte $00   ; 
- D 1 - I - 0x01720B 05:B1FB: 65        .byte $65   ; 
- D 1 - I - 0x01720C 05:B1FC: BE        .byte $BE   ; 
- D 1 - I - 0x01720D 05:B1FD: 68        .byte $68   ; 
- D 1 - I - 0x01720E 05:B1FE: C0        .byte $C0   ; 
- D 1 - I - 0x01720F 05:B1FF: 66        .byte $66   ; 
- D 1 - I - 0x017210 05:B200: BF        .byte $BF   ; 
- D 1 - I - 0x017211 05:B201: 65        .byte $65   ; 
- D 1 - I - 0x017212 05:B202: BB        .byte $BB   ; 
- D 1 - I - 0x017213 05:B203: 00        .byte $00   ; 
- D 1 - I - 0x017214 05:B204: 00        .byte $00   ; 
- D 1 - I - 0x017215 05:B205: 66        .byte $66   ; 
- D 1 - I - 0x017216 05:B206: BC        .byte $BC   ; 
- D 1 - I - 0x017217 05:B207: 07        .byte $07   ; 
- D 1 - I - 0x017218 05:B208: DA        .byte $DA   ; 
- D 1 - I - 0x017219 05:B209: 15        .byte $15   ; 
- D 1 - I - 0x01721A 05:B20A: D4        .byte $D4   ; 
- D 1 - I - 0x01721B 05:B20B: 63        .byte $63   ; 
- D 1 - I - 0x01721C 05:B20C: D4        .byte $D4   ; 
- D 1 - I - 0x01721D 05:B20D: 02        .byte $02   ; 
- D 1 - I - 0x01721E 05:B20E: D5        .byte $D5   ; 
- D 1 - I - 0x01721F 05:B20F: 00        .byte $00   ; 
- D 1 - I - 0x017220 05:B210: 1A        .byte $1A   ; 
- D 1 - I - 0x017221 05:B211: 00        .byte $00   ; 
- D 1 - I - 0x017222 05:B212: 1C        .byte $1C   ; 
- D 1 - I - 0x017223 05:B213: 00        .byte $00   ; 
- D 1 - I - 0x017224 05:B214: 00        .byte $00   ; 
- D 1 - I - 0x017225 05:B215: 00        .byte $00   ; 
- D 1 - I - 0x017226 05:B216: 00        .byte $00   ; 
- D 1 - I - 0x017227 05:B217: 00        .byte $00   ; 
- D 1 - I - 0x017228 05:B218: C4        .byte $C4   ; 
- D 1 - I - 0x017229 05:B219: 1B        .byte $1B   ; 
- D 1 - I - 0x01722A 05:B21A: C7        .byte $C7   ; 
- D 1 - I - 0x01722B 05:B21B: 69        .byte $69   ; 
- D 1 - I - 0x01722C 05:B21C: C1        .byte $C1   ; 
- D 1 - I - 0x01722D 05:B21D: D7        .byte $D7   ; 
- D 1 - I - 0x01722E 05:B21E: D8        .byte $D8   ; 
- D 1 - I - 0x01722F 05:B21F: 18        .byte $18   ; 
- D 1 - I - 0x017230 05:B220: BF        .byte $BF   ; 
- D 1 - I - 0x017231 05:B221: 07        .byte $07   ; 
- D 1 - I - 0x017232 05:B222: C8        .byte $C8   ; 
- D 1 - I - 0x017233 05:B223: D5        .byte $D5   ; 
- D 1 - I - 0x017234 05:B224: 02        .byte $02   ; 
- D 1 - I - 0x017235 05:B225: 18        .byte $18   ; 
- D 1 - I - 0x017236 05:B226: BF        .byte $BF   ; 
- D 1 - I - 0x017237 05:B227: 18        .byte $18   ; 
- D 1 - I - 0x017238 05:B228: BF        .byte $BF   ; 
- D 1 - I - 0x017239 05:B229: 19        .byte $19   ; 
- D 1 - I - 0x01723A 05:B22A: B8        .byte $B8   ; 
- D 1 - I - 0x01723B 05:B22B: D5        .byte $D5   ; 
- D 1 - I - 0x01723C 05:B22C: 02        .byte $02   ; 
- D 1 - I - 0x01723D 05:B22D: 18        .byte $18   ; 
- D 1 - I - 0x01723E 05:B22E: BD        .byte $BD   ; 
- D 1 - I - 0x01723F 05:B22F: 1C        .byte $1C   ; 
- D 1 - I - 0x017240 05:B230: 00        .byte $00   ; 
- D 1 - I - 0x017241 05:B231: 1A        .byte $1A   ; 
- D 1 - I - 0x017242 05:B232: 00        .byte $00   ; 
- D 1 - I - 0x017243 05:B233: 00        .byte $00   ; 
- D 1 - I - 0x017244 05:B234: 00        .byte $00   ; 
- D 1 - I - 0x017245 05:B235: 00        .byte $00   ; 
- D 1 - I - 0x017246 05:B236: 00        .byte $00   ; 
- D 1 - I - 0x017247 05:B237: 00        .byte $00   ; 
- D 1 - I - 0x017248 05:B238: 00        .byte $00   ; 
- D 1 - I - 0x017249 05:B239: 00        .byte $00   ; 
- D 1 - I - 0x01724A 05:B23A: 00        .byte $00   ; 
- D 1 - I - 0x01724B 05:B23B: 19        .byte $19   ; 
- D 1 - I - 0x01724C 05:B23C: C1        .byte $C1   ; 
- D 1 - I - 0x01724D 05:B23D: 00        .byte $00   ; 
- D 1 - I - 0x01724E 05:B23E: 00        .byte $00   ; 
- D 1 - I - 0x01724F 05:B23F: 18        .byte $18   ; 
- D 1 - I - 0x017250 05:B240: BF        .byte $BF   ; 
- D 1 - I - 0x017251 05:B241: 19        .byte $19   ; 
- D 1 - I - 0x017252 05:B242: B8        .byte $B8   ; 
- D 1 - I - 0x017253 05:B243: D5        .byte $D5   ; 
- D 1 - I - 0x017254 05:B244: 02        .byte $02   ; 
- D 1 - I - 0x017255 05:B245: 18        .byte $18   ; 
- D 1 - I - 0x017256 05:B246: BD        .byte $BD   ; 
- - - - - - 0x017257 05:B247: 00        .byte $00   ; 
- - - - - - 0x017258 05:B248: 00        .byte $00   ; 
- - - - - - 0x017259 05:B249: 00        .byte $00   ; 
- - - - - - 0x01725A 05:B24A: 00        .byte $00   ; 
- - - - - - 0x01725B 05:B24B: 00        .byte $00   ; 
- - - - - - 0x01725C 05:B24C: 00        .byte $00   ; 
- - - - - - 0x01725D 05:B24D: 00        .byte $00   ; 
- - - - - - 0x01725E 05:B24E: 00        .byte $00   ; 
- - - - - - 0x01725F 05:B24F: 40        .byte $40   ; 
- - - - - - 0x017260 05:B250: DB        .byte $DB   ; 
- - - - - - 0x017261 05:B251: 42        .byte $42   ; 
- - - - - - 0x017262 05:B252: DB        .byte $DB   ; 
- - - - - - 0x017263 05:B253: B4        .byte $B4   ; 
- - - - - - 0x017264 05:B254: DD        .byte $DD   ; 
- - - - - - 0x017265 05:B255: DC        .byte $DC   ; 
- - - - - - 0x017266 05:B256: DD        .byte $DD   ; 
- D 1 - I - 0x017267 05:B257: 00        .byte $00   ; 
- D 1 - I - 0x017268 05:B258: 00        .byte $00   ; 
- D 1 - I - 0x017269 05:B259: 00        .byte $00   ; 
- D 1 - I - 0x01726A 05:B25A: 00        .byte $00   ; 
- D 1 - I - 0x01726B 05:B25B: 00        .byte $00   ; 
- D 1 - I - 0x01726C 05:B25C: 00        .byte $00   ; 
- D 1 - I - 0x01726D 05:B25D: 00        .byte $00   ; 
- D 1 - I - 0x01726E 05:B25E: 00        .byte $00   ; 
- D 1 - I - 0x01726F 05:B25F: 42        .byte $42   ; 
- D 1 - I - 0x017270 05:B260: DB        .byte $DB   ; 
- D 1 - I - 0x017271 05:B261: 41        .byte $41   ; 
- D 1 - I - 0x017272 05:B262: B5        .byte $B5   ; 
- D 1 - I - 0x017273 05:B263: DC        .byte $DC   ; 
- D 1 - I - 0x017274 05:B264: DD        .byte $DD   ; 
- D 1 - I - 0x017275 05:B265: DC        .byte $DC   ; 
- D 1 - I - 0x017276 05:B266: B6        .byte $B6   ; 
- D 1 - I - 0x017277 05:B267: 40        .byte $40   ; 
- D 1 - I - 0x017278 05:B268: DB        .byte $DB   ; 
- D 1 - I - 0x017279 05:B269: 42        .byte $42   ; 
- D 1 - I - 0x01727A 05:B26A: DB        .byte $DB   ; 
- D 1 - I - 0x01727B 05:B26B: B4        .byte $B4   ; 
- D 1 - I - 0x01727C 05:B26C: DD        .byte $DD   ; 
- D 1 - I - 0x01727D 05:B26D: DC        .byte $DC   ; 
- D 1 - I - 0x01727E 05:B26E: DD        .byte $DD   ; 
- D 1 - I - 0x01727F 05:B26F: 00        .byte $00   ; 
- D 1 - I - 0x017280 05:B270: 00        .byte $00   ; 
- D 1 - I - 0x017281 05:B271: 00        .byte $00   ; 
- D 1 - I - 0x017282 05:B272: 00        .byte $00   ; 
- D 1 - I - 0x017283 05:B273: 00        .byte $00   ; 
- D 1 - I - 0x017284 05:B274: 00        .byte $00   ; 
- D 1 - I - 0x017285 05:B275: 00        .byte $00   ; 
- D 1 - I - 0x017286 05:B276: 00        .byte $00   ; 
- D 1 - I - 0x017287 05:B277: 01        .byte $01   ; 
- D 1 - I - 0x017288 05:B278: EA        .byte $EA   ; 
- D 1 - I - 0x017289 05:B279: 01        .byte $01   ; 
- D 1 - I - 0x01728A 05:B27A: EA        .byte $EA   ; 
- D 1 - I - 0x01728B 05:B27B: B4        .byte $B4   ; 
- D 1 - I - 0x01728C 05:B27C: EC        .byte $EC   ; 
- D 1 - I - 0x01728D 05:B27D: EB        .byte $EB   ; 
- D 1 - I - 0x01728E 05:B27E: EC        .byte $EC   ; 
- D 1 - I - 0x01728F 05:B27F: 68        .byte $68   ; 
- D 1 - I - 0x017290 05:B280: C0        .byte $C0   ; 
- D 1 - I - 0x017291 05:B281: 02        .byte $02   ; 
- D 1 - I - 0x017292 05:B282: 03        .byte $03   ; 
- D 1 - I - 0x017293 05:B283: 65        .byte $65   ; 
- D 1 - I - 0x017294 05:B284: BE        .byte $BE   ; 
- D 1 - I - 0x017295 05:B285: 68        .byte $68   ; 
- D 1 - I - 0x017296 05:B286: C0        .byte $C0   ; 
- D 1 - I - 0x017297 05:B287: 40        .byte $40   ; 
- D 1 - I - 0x017298 05:B288: DB        .byte $DB   ; 
- D 1 - I - 0x017299 05:B289: 42        .byte $42   ; 
- D 1 - I - 0x01729A 05:B28A: DB        .byte $DB   ; 
- D 1 - I - 0x01729B 05:B28B: B4        .byte $B4   ; 
- D 1 - I - 0x01729C 05:B28C: DD        .byte $DD   ; 
- D 1 - I - 0x01729D 05:B28D: DC        .byte $DC   ; 
- D 1 - I - 0x01729E 05:B28E: DD        .byte $DD   ; 
- D 1 - I - 0x01729F 05:B28F: 02        .byte $02   ; 
- D 1 - I - 0x0172A0 05:B290: DE        .byte $DE   ; 
- D 1 - I - 0x0172A1 05:B291: 03        .byte $03   ; 
- D 1 - I - 0x0172A2 05:B292: 02        .byte $02   ; 
- D 1 - I - 0x0172A3 05:B293: 00        .byte $00   ; 
- D 1 - I - 0x0172A4 05:B294: DF        .byte $DF   ; 
- D 1 - I - 0x0172A5 05:B295: E0        .byte $E0   ; 
- D 1 - I - 0x0172A6 05:B296: 00        .byte $00   ; 
- D 1 - I - 0x0172A7 05:B297: 42        .byte $42   ; 
- D 1 - I - 0x0172A8 05:B298: DB        .byte $DB   ; 
- D 1 - I - 0x0172A9 05:B299: 42        .byte $42   ; 
- D 1 - I - 0x0172AA 05:B29A: DB        .byte $DB   ; 
- D 1 - I - 0x0172AB 05:B29B: DC        .byte $DC   ; 
- D 1 - I - 0x0172AC 05:B29C: DD        .byte $DD   ; 
- D 1 - I - 0x0172AD 05:B29D: DC        .byte $DC   ; 
- D 1 - I - 0x0172AE 05:B29E: DD        .byte $DD   ; 
- D 1 - I - 0x0172AF 05:B29F: 02        .byte $02   ; 
- D 1 - I - 0x0172B0 05:B2A0: DE        .byte $DE   ; 
- D 1 - I - 0x0172B1 05:B2A1: 03        .byte $03   ; 
- D 1 - I - 0x0172B2 05:B2A2: 02        .byte $02   ; 
- D 1 - I - 0x0172B3 05:B2A3: 00        .byte $00   ; 
- D 1 - I - 0x0172B4 05:B2A4: DF        .byte $DF   ; 
- D 1 - I - 0x0172B5 05:B2A5: E0        .byte $E0   ; 
- D 1 - I - 0x0172B6 05:B2A6: 00        .byte $00   ; 
- D 1 - I - 0x0172B7 05:B2A7: 42        .byte $42   ; 
- D 1 - I - 0x0172B8 05:B2A8: DB        .byte $DB   ; 
- D 1 - I - 0x0172B9 05:B2A9: 41        .byte $41   ; 
- D 1 - I - 0x0172BA 05:B2AA: B5        .byte $B5   ; 
- D 1 - I - 0x0172BB 05:B2AB: B4        .byte $B4   ; 
- D 1 - I - 0x0172BC 05:B2AC: DD        .byte $DD   ; 
- D 1 - I - 0x0172BD 05:B2AD: DC        .byte $DC   ; 
- D 1 - I - 0x0172BE 05:B2AE: B6        .byte $B6   ; 
- D 1 - I - 0x0172BF 05:B2AF: 02        .byte $02   ; 
- D 1 - I - 0x0172C0 05:B2B0: DE        .byte $DE   ; 
- D 1 - I - 0x0172C1 05:B2B1: 03        .byte $03   ; 
- D 1 - I - 0x0172C2 05:B2B2: 02        .byte $02   ; 
- D 1 - I - 0x0172C3 05:B2B3: 00        .byte $00   ; 
- D 1 - I - 0x0172C4 05:B2B4: DF        .byte $DF   ; 
- D 1 - I - 0x0172C5 05:B2B5: E0        .byte $E0   ; 
- D 1 - I - 0x0172C6 05:B2B6: 00        .byte $00   ; 
- D 1 - I - 0x0172C7 05:B2B7: 42        .byte $42   ; 
- D 1 - I - 0x0172C8 05:B2B8: DB        .byte $DB   ; 
- D 1 - I - 0x0172C9 05:B2B9: 42        .byte $42   ; 
- D 1 - I - 0x0172CA 05:B2BA: DB        .byte $DB   ; 
- D 1 - I - 0x0172CB 05:B2BB: DC        .byte $DC   ; 
- D 1 - I - 0x0172CC 05:B2BC: DD        .byte $DD   ; 
- D 1 - I - 0x0172CD 05:B2BD: DC        .byte $DC   ; 
- D 1 - I - 0x0172CE 05:B2BE: DD        .byte $DD   ; 
- D 1 - I - 0x0172CF 05:B2BF: 0C        .byte $0C   ; 
- D 1 - I - 0x0172D0 05:B2C0: 94        .byte $94   ; 
- D 1 - I - 0x0172D1 05:B2C1: 1E        .byte $1E   ; 
- D 1 - I - 0x0172D2 05:B2C2: 95        .byte $95   ; 
- D 1 - I - 0x0172D3 05:B2C3: 25        .byte $25   ; 
- D 1 - I - 0x0172D4 05:B2C4: 96        .byte $96   ; 
- D 1 - I - 0x0172D5 05:B2C5: 26        .byte $26   ; 
- D 1 - I - 0x0172D6 05:B2C6: 97        .byte $97   ; 
- D 1 - I - 0x0172D7 05:B2C7: 42        .byte $42   ; 
- D 1 - I - 0x0172D8 05:B2C8: DB        .byte $DB   ; 
- D 1 - I - 0x0172D9 05:B2C9: 42        .byte $42   ; 
- D 1 - I - 0x0172DA 05:B2CA: DB        .byte $DB   ; 
- D 1 - I - 0x0172DB 05:B2CB: DC        .byte $DC   ; 
- D 1 - I - 0x0172DC 05:B2CC: DD        .byte $DD   ; 
- D 1 - I - 0x0172DD 05:B2CD: DC        .byte $DC   ; 
- D 1 - I - 0x0172DE 05:B2CE: DD        .byte $DD   ; 
- D 1 - I - 0x0172DF 05:B2CF: 0C        .byte $0C   ; 
- D 1 - I - 0x0172E0 05:B2D0: 94        .byte $94   ; 
- D 1 - I - 0x0172E1 05:B2D1: 1E        .byte $1E   ; 
- D 1 - I - 0x0172E2 05:B2D2: 95        .byte $95   ; 
- D 1 - I - 0x0172E3 05:B2D3: 25        .byte $25   ; 
- D 1 - I - 0x0172E4 05:B2D4: 90        .byte $90   ; 
- D 1 - I - 0x0172E5 05:B2D5: 91        .byte $91   ; 
- D 1 - I - 0x0172E6 05:B2D6: 97        .byte $97   ; 
- D 1 - I - 0x0172E7 05:B2D7: 42        .byte $42   ; 
- D 1 - I - 0x0172E8 05:B2D8: DB        .byte $DB   ; 
- D 1 - I - 0x0172E9 05:B2D9: 42        .byte $42   ; 
- D 1 - I - 0x0172EA 05:B2DA: DB        .byte $DB   ; 
- D 1 - I - 0x0172EB 05:B2DB: DC        .byte $DC   ; 
- D 1 - I - 0x0172EC 05:B2DC: DD        .byte $DD   ; 
- D 1 - I - 0x0172ED 05:B2DD: DC        .byte $DC   ; 
- D 1 - I - 0x0172EE 05:B2DE: DD        .byte $DD   ; 
- D 1 - I - 0x0172EF 05:B2DF: 9E        .byte $9E   ; 
- D 1 - I - 0x0172F0 05:B2E0: 9F        .byte $9F   ; 
- D 1 - I - 0x0172F1 05:B2E1: A0        .byte $A0   ; 
- D 1 - I - 0x0172F2 05:B2E2: A1        .byte $A1   ; 
- D 1 - I - 0x0172F3 05:B2E3: A2        .byte $A2   ; 
- D 1 - I - 0x0172F4 05:B2E4: A3        .byte $A3   ; 
- D 1 - I - 0x0172F5 05:B2E5: A4        .byte $A4   ; 
- D 1 - I - 0x0172F6 05:B2E6: A5        .byte $A5   ; 
- D 1 - I - 0x0172F7 05:B2E7: 42        .byte $42   ; 
- D 1 - I - 0x0172F8 05:B2E8: DB        .byte $DB   ; 
- D 1 - I - 0x0172F9 05:B2E9: 42        .byte $42   ; 
- D 1 - I - 0x0172FA 05:B2EA: DB        .byte $DB   ; 
- D 1 - I - 0x0172FB 05:B2EB: DC        .byte $DC   ; 
- D 1 - I - 0x0172FC 05:B2EC: DD        .byte $DD   ; 
- D 1 - I - 0x0172FD 05:B2ED: DC        .byte $DC   ; 
- D 1 - I - 0x0172FE 05:B2EE: DD        .byte $DD   ; 
- D 1 - I - 0x0172FF 05:B2EF: 9E        .byte $9E   ; 
- D 1 - I - 0x017300 05:B2F0: AE        .byte $AE   ; 
- D 1 - I - 0x017301 05:B2F1: AF        .byte $AF   ; 
- D 1 - I - 0x017302 05:B2F2: A1        .byte $A1   ; 
- D 1 - I - 0x017303 05:B2F3: A2        .byte $A2   ; 
- D 1 - I - 0x017304 05:B2F4: B0        .byte $B0   ; 
- D 1 - I - 0x017305 05:B2F5: B1        .byte $B1   ; 
- D 1 - I - 0x017306 05:B2F6: A5        .byte $A5   ; 
- D 1 - I - 0x017307 05:B2F7: 1F        .byte $1F   ; 
- D 1 - I - 0x017308 05:B2F8: 98        .byte $98   ; 
- D 1 - I - 0x017309 05:B2F9: 20        .byte $20   ; 
- D 1 - I - 0x01730A 05:B2FA: 99        .byte $99   ; 
- D 1 - I - 0x01730B 05:B2FB: 9A        .byte $9A   ; 
- D 1 - I - 0x01730C 05:B2FC: 9B        .byte $9B   ; 
- D 1 - I - 0x01730D 05:B2FD: 9C        .byte $9C   ; 
- D 1 - I - 0x01730E 05:B2FE: 9D        .byte $9D   ; 
- D 1 - I - 0x01730F 05:B2FF: 02        .byte $02   ; 
- D 1 - I - 0x017310 05:B300: DE        .byte $DE   ; 
- D 1 - I - 0x017311 05:B301: 03        .byte $03   ; 
- D 1 - I - 0x017312 05:B302: 02        .byte $02   ; 
- D 1 - I - 0x017313 05:B303: 00        .byte $00   ; 
- D 1 - I - 0x017314 05:B304: DF        .byte $DF   ; 
- D 1 - I - 0x017315 05:B305: E0        .byte $E0   ; 
- D 1 - I - 0x017316 05:B306: 00        .byte $00   ; 
- D 1 - I - 0x017317 05:B307: 1F        .byte $1F   ; 
- D 1 - I - 0x017318 05:B308: 92        .byte $92   ; 
- D 1 - I - 0x017319 05:B309: 93        .byte $93   ; 
- D 1 - I - 0x01731A 05:B30A: 99        .byte $99   ; 
- D 1 - I - 0x01731B 05:B30B: 9A        .byte $9A   ; 
- D 1 - I - 0x01731C 05:B30C: 9B        .byte $9B   ; 
- D 1 - I - 0x01731D 05:B30D: 9C        .byte $9C   ; 
- D 1 - I - 0x01731E 05:B30E: 9D        .byte $9D   ; 
- D 1 - I - 0x01731F 05:B30F: 02        .byte $02   ; 
- D 1 - I - 0x017320 05:B310: DE        .byte $DE   ; 
- D 1 - I - 0x017321 05:B311: 03        .byte $03   ; 
- D 1 - I - 0x017322 05:B312: 02        .byte $02   ; 
- D 1 - I - 0x017323 05:B313: 00        .byte $00   ; 
- D 1 - I - 0x017324 05:B314: DF        .byte $DF   ; 
- D 1 - I - 0x017325 05:B315: E0        .byte $E0   ; 
- D 1 - I - 0x017326 05:B316: 00        .byte $00   ; 
- D 1 - I - 0x017327 05:B317: A6        .byte $A6   ; 
- D 1 - I - 0x017328 05:B318: A7        .byte $A7   ; 
- D 1 - I - 0x017329 05:B319: A8        .byte $A8   ; 
- D 1 - I - 0x01732A 05:B31A: A9        .byte $A9   ; 
- D 1 - I - 0x01732B 05:B31B: AA        .byte $AA   ; 
- D 1 - I - 0x01732C 05:B31C: AB        .byte $AB   ; 
- D 1 - I - 0x01732D 05:B31D: AC        .byte $AC   ; 
- D 1 - I - 0x01732E 05:B31E: AD        .byte $AD   ; 
- D 1 - I - 0x01732F 05:B31F: 02        .byte $02   ; 
- D 1 - I - 0x017330 05:B320: DE        .byte $DE   ; 
- D 1 - I - 0x017331 05:B321: 03        .byte $03   ; 
- D 1 - I - 0x017332 05:B322: 02        .byte $02   ; 
- D 1 - I - 0x017333 05:B323: 00        .byte $00   ; 
- D 1 - I - 0x017334 05:B324: DF        .byte $DF   ; 
- D 1 - I - 0x017335 05:B325: E0        .byte $E0   ; 
- D 1 - I - 0x017336 05:B326: 00        .byte $00   ; 
- D 1 - I - 0x017337 05:B327: A6        .byte $A6   ; 
- D 1 - I - 0x017338 05:B328: B2        .byte $B2   ; 
- D 1 - I - 0x017339 05:B329: B3        .byte $B3   ; 
- D 1 - I - 0x01733A 05:B32A: A9        .byte $A9   ; 
- D 1 - I - 0x01733B 05:B32B: AA        .byte $AA   ; 
- D 1 - I - 0x01733C 05:B32C: AB        .byte $AB   ; 
- D 1 - I - 0x01733D 05:B32D: AC        .byte $AC   ; 
- D 1 - I - 0x01733E 05:B32E: AD        .byte $AD   ; 
- D 1 - I - 0x01733F 05:B32F: 02        .byte $02   ; 
- D 1 - I - 0x017340 05:B330: DE        .byte $DE   ; 
- D 1 - I - 0x017341 05:B331: 03        .byte $03   ; 
- D 1 - I - 0x017342 05:B332: 02        .byte $02   ; 
- D 1 - I - 0x017343 05:B333: 00        .byte $00   ; 
- D 1 - I - 0x017344 05:B334: DF        .byte $DF   ; 
- D 1 - I - 0x017345 05:B335: E0        .byte $E0   ; 
- D 1 - I - 0x017346 05:B336: 00        .byte $00   ; 
- D 1 - I - 0x017347 05:B337: 0C        .byte $0C   ; 
- D 1 - I - 0x017348 05:B338: 94        .byte $94   ; 
- D 1 - I - 0x017349 05:B339: 1E        .byte $1E   ; 
- D 1 - I - 0x01734A 05:B33A: 95        .byte $95   ; 
- D 1 - I - 0x01734B 05:B33B: 25        .byte $25   ; 
- D 1 - I - 0x01734C 05:B33C: 96        .byte $96   ; 
- D 1 - I - 0x01734D 05:B33D: 26        .byte $26   ; 
- D 1 - I - 0x01734E 05:B33E: 97        .byte $97   ; 
- D 1 - I - 0x01734F 05:B33F: 1F        .byte $1F   ; 
- D 1 - I - 0x017350 05:B340: 98        .byte $98   ; 
- D 1 - I - 0x017351 05:B341: 20        .byte $20   ; 
- D 1 - I - 0x017352 05:B342: 99        .byte $99   ; 
- D 1 - I - 0x017353 05:B343: 9A        .byte $9A   ; 
- D 1 - I - 0x017354 05:B344: 9B        .byte $9B   ; 
- D 1 - I - 0x017355 05:B345: 9C        .byte $9C   ; 
- D 1 - I - 0x017356 05:B346: 9D        .byte $9D   ; 
- D 1 - I - 0x017357 05:B347: 00        .byte $00   ; 
- D 1 - I - 0x017358 05:B348: 00        .byte $00   ; 
- D 1 - I - 0x017359 05:B349: 64        .byte $64   ; 
- D 1 - I - 0x01735A 05:B34A: CC        .byte $CC   ; 
- D 1 - I - 0x01735B 05:B34B: 64        .byte $64   ; 
- D 1 - I - 0x01735C 05:B34C: CC        .byte $CC   ; 
- D 1 - I - 0x01735D 05:B34D: 60        .byte $60   ; 
- D 1 - I - 0x01735E 05:B34E: CA        .byte $CA   ; 
- D 1 - I - 0x01735F 05:B34F: 60        .byte $60   ; 
- D 1 - I - 0x017360 05:B350: CA        .byte $CA   ; 
- D 1 - I - 0x017361 05:B351: 62        .byte $62   ; 
- D 1 - I - 0x017362 05:B352: CF        .byte $CF   ; 
- D 1 - I - 0x017363 05:B353: 8E        .byte $8E   ; 
- D 1 - I - 0x017364 05:B354: 94        .byte $94   ; 
- D 1 - I - 0x017365 05:B355: 1E        .byte $1E   ; 
- D 1 - I - 0x017366 05:B356: 95        .byte $95   ; 
- D 1 - I - 0x017367 05:B357: 00        .byte $00   ; 
- D 1 - I - 0x017368 05:B358: 00        .byte $00   ; 
- D 1 - I - 0x017369 05:B359: 64        .byte $64   ; 
- D 1 - I - 0x01736A 05:B35A: CC        .byte $CC   ; 
- D 1 - I - 0x01736B 05:B35B: 64        .byte $64   ; 
- D 1 - I - 0x01736C 05:B35C: CC        .byte $CC   ; 
- D 1 - I - 0x01736D 05:B35D: 60        .byte $60   ; 
- D 1 - I - 0x01736E 05:B35E: CA        .byte $CA   ; 
- D 1 - I - 0x01736F 05:B35F: 60        .byte $60   ; 
- D 1 - I - 0x017370 05:B360: CA        .byte $CA   ; 
- D 1 - I - 0x017371 05:B361: 62        .byte $62   ; 
- D 1 - I - 0x017372 05:B362: CF        .byte $CF   ; 
- D 1 - I - 0x017373 05:B363: 8E        .byte $8E   ; 
- D 1 - I - 0x017374 05:B364: 94        .byte $94   ; 
- D 1 - I - 0x017375 05:B365: 1E        .byte $1E   ; 
- D 1 - I - 0x017376 05:B366: 95        .byte $95   ; 
- D 1 - I - 0x017377 05:B367: 00        .byte $00   ; 
- D 1 - I - 0x017378 05:B368: 00        .byte $00   ; 
- D 1 - I - 0x017379 05:B369: 64        .byte $64   ; 
- D 1 - I - 0x01737A 05:B36A: CC        .byte $CC   ; 
- D 1 - I - 0x01737B 05:B36B: 64        .byte $64   ; 
- D 1 - I - 0x01737C 05:B36C: CC        .byte $CC   ; 
- D 1 - I - 0x01737D 05:B36D: 60        .byte $60   ; 
- D 1 - I - 0x01737E 05:B36E: CA        .byte $CA   ; 
- D 1 - I - 0x01737F 05:B36F: 60        .byte $60   ; 
- D 1 - I - 0x017380 05:B370: CA        .byte $CA   ; 
- D 1 - I - 0x017381 05:B371: 62        .byte $62   ; 
- D 1 - I - 0x017382 05:B372: CF        .byte $CF   ; 
- D 1 - I - 0x017383 05:B373: 8F        .byte $8F   ; 
- D 1 - I - 0x017384 05:B374: 9F        .byte $9F   ; 
- D 1 - I - 0x017385 05:B375: A0        .byte $A0   ; 
- D 1 - I - 0x017386 05:B376: A1        .byte $A1   ; 
- D 1 - I - 0x017387 05:B377: 00        .byte $00   ; 
- D 1 - I - 0x017388 05:B378: 00        .byte $00   ; 
- D 1 - I - 0x017389 05:B379: 64        .byte $64   ; 
- D 1 - I - 0x01738A 05:B37A: CC        .byte $CC   ; 
- D 1 - I - 0x01738B 05:B37B: 64        .byte $64   ; 
- D 1 - I - 0x01738C 05:B37C: CC        .byte $CC   ; 
- D 1 - I - 0x01738D 05:B37D: 60        .byte $60   ; 
- D 1 - I - 0x01738E 05:B37E: CA        .byte $CA   ; 
- D 1 - I - 0x01738F 05:B37F: 60        .byte $60   ; 
- D 1 - I - 0x017390 05:B380: CA        .byte $CA   ; 
- D 1 - I - 0x017391 05:B381: 62        .byte $62   ; 
- D 1 - I - 0x017392 05:B382: CF        .byte $CF   ; 
- D 1 - I - 0x017393 05:B383: 8F        .byte $8F   ; 
- D 1 - I - 0x017394 05:B384: AE        .byte $AE   ; 
- D 1 - I - 0x017395 05:B385: AF        .byte $AF   ; 
- D 1 - I - 0x017396 05:B386: A1        .byte $A1   ; 
- D 1 - I - 0x017397 05:B387: 25        .byte $25   ; 
- D 1 - I - 0x017398 05:B388: 96        .byte $96   ; 
- D 1 - I - 0x017399 05:B389: 26        .byte $26   ; 
- D 1 - I - 0x01739A 05:B38A: 97        .byte $97   ; 
- D 1 - I - 0x01739B 05:B38B: 1F        .byte $1F   ; 
- D 1 - I - 0x01739C 05:B38C: 98        .byte $98   ; 
- D 1 - I - 0x01739D 05:B38D: 20        .byte $20   ; 
- D 1 - I - 0x01739E 05:B38E: 99        .byte $99   ; 
- D 1 - I - 0x01739F 05:B38F: 16        .byte $16   ; 
- D 1 - I - 0x0173A0 05:B390: E7        .byte $E7   ; 
- D 1 - I - 0x0173A1 05:B391: 17        .byte $17   ; 
- D 1 - I - 0x0173A2 05:B392: D4        .byte $D4   ; 
- D 1 - I - 0x0173A3 05:B393: 15        .byte $15   ; 
- D 1 - I - 0x0173A4 05:B394: D4        .byte $D4   ; 
- D 1 - I - 0x0173A5 05:B395: 02        .byte $02   ; 
- D 1 - I - 0x0173A6 05:B396: D5        .byte $D5   ; 
- D 1 - I - 0x0173A7 05:B397: 25        .byte $25   ; 
- D 1 - I - 0x0173A8 05:B398: 90        .byte $90   ; 
- D 1 - I - 0x0173A9 05:B399: 91        .byte $91   ; 
- D 1 - I - 0x0173AA 05:B39A: 97        .byte $97   ; 
- D 1 - I - 0x0173AB 05:B39B: 1F        .byte $1F   ; 
- D 1 - I - 0x0173AC 05:B39C: 92        .byte $92   ; 
- D 1 - I - 0x0173AD 05:B39D: 93        .byte $93   ; 
- D 1 - I - 0x0173AE 05:B39E: 99        .byte $99   ; 
- D 1 - I - 0x0173AF 05:B39F: 16        .byte $16   ; 
- D 1 - I - 0x0173B0 05:B3A0: E7        .byte $E7   ; 
- D 1 - I - 0x0173B1 05:B3A1: 17        .byte $17   ; 
- D 1 - I - 0x0173B2 05:B3A2: D4        .byte $D4   ; 
- D 1 - I - 0x0173B3 05:B3A3: 15        .byte $15   ; 
- D 1 - I - 0x0173B4 05:B3A4: D4        .byte $D4   ; 
- D 1 - I - 0x0173B5 05:B3A5: 02        .byte $02   ; 
- D 1 - I - 0x0173B6 05:B3A6: D5        .byte $D5   ; 
- D 1 - I - 0x0173B7 05:B3A7: A2        .byte $A2   ; 
- D 1 - I - 0x0173B8 05:B3A8: A3        .byte $A3   ; 
- D 1 - I - 0x0173B9 05:B3A9: A4        .byte $A4   ; 
- D 1 - I - 0x0173BA 05:B3AA: A5        .byte $A5   ; 
- D 1 - I - 0x0173BB 05:B3AB: A6        .byte $A6   ; 
- D 1 - I - 0x0173BC 05:B3AC: A7        .byte $A7   ; 
- D 1 - I - 0x0173BD 05:B3AD: A8        .byte $A8   ; 
- D 1 - I - 0x0173BE 05:B3AE: A9        .byte $A9   ; 
- D 1 - I - 0x0173BF 05:B3AF: 16        .byte $16   ; 
- D 1 - I - 0x0173C0 05:B3B0: E7        .byte $E7   ; 
- D 1 - I - 0x0173C1 05:B3B1: 17        .byte $17   ; 
- D 1 - I - 0x0173C2 05:B3B2: D4        .byte $D4   ; 
- D 1 - I - 0x0173C3 05:B3B3: 15        .byte $15   ; 
- D 1 - I - 0x0173C4 05:B3B4: D4        .byte $D4   ; 
- D 1 - I - 0x0173C5 05:B3B5: 02        .byte $02   ; 
- D 1 - I - 0x0173C6 05:B3B6: D5        .byte $D5   ; 
- D 1 - I - 0x0173C7 05:B3B7: A2        .byte $A2   ; 
- D 1 - I - 0x0173C8 05:B3B8: B0        .byte $B0   ; 
- D 1 - I - 0x0173C9 05:B3B9: B1        .byte $B1   ; 
- D 1 - I - 0x0173CA 05:B3BA: A5        .byte $A5   ; 
- D 1 - I - 0x0173CB 05:B3BB: A6        .byte $A6   ; 
- D 1 - I - 0x0173CC 05:B3BC: B2        .byte $B2   ; 
- D 1 - I - 0x0173CD 05:B3BD: B3        .byte $B3   ; 
- D 1 - I - 0x0173CE 05:B3BE: A9        .byte $A9   ; 
- D 1 - I - 0x0173CF 05:B3BF: 16        .byte $16   ; 
- D 1 - I - 0x0173D0 05:B3C0: E7        .byte $E7   ; 
- D 1 - I - 0x0173D1 05:B3C1: 17        .byte $17   ; 
- D 1 - I - 0x0173D2 05:B3C2: D4        .byte $D4   ; 
- D 1 - I - 0x0173D3 05:B3C3: 15        .byte $15   ; 
- D 1 - I - 0x0173D4 05:B3C4: D4        .byte $D4   ; 
- D 1 - I - 0x0173D5 05:B3C5: 02        .byte $02   ; 
- D 1 - I - 0x0173D6 05:B3C6: D5        .byte $D5   ; 
- D 1 - I - 0x0173D7 05:B3C7: 68        .byte $68   ; 
- D 1 - I - 0x0173D8 05:B3C8: C0        .byte $C0   ; 
- D 1 - I - 0x0173D9 05:B3C9: 00        .byte $00   ; 
- D 1 - I - 0x0173DA 05:B3CA: 00        .byte $00   ; 
- D 1 - I - 0x0173DB 05:B3CB: 65        .byte $65   ; 
- D 1 - I - 0x0173DC 05:B3CC: BE        .byte $BE   ; 
- D 1 - I - 0x0173DD 05:B3CD: 68        .byte $68   ; 
- D 1 - I - 0x0173DE 05:B3CE: C0        .byte $C0   ; 
- D 1 - I - 0x0173DF 05:B3CF: 66        .byte $66   ; 
- D 1 - I - 0x0173E0 05:B3D0: BF        .byte $BF   ; 
- D 1 - I - 0x0173E1 05:B3D1: 65        .byte $65   ; 
- D 1 - I - 0x0173E2 05:B3D2: BE        .byte $BE   ; 
- D 1 - I - 0x0173E3 05:B3D3: 0C        .byte $0C   ; 
- D 1 - I - 0x0173E4 05:B3D4: 94        .byte $94   ; 
- D 1 - I - 0x0173E5 05:B3D5: 1E        .byte $1E   ; 
- D 1 - I - 0x0173E6 05:B3D6: 8C        .byte $8C   ; 
- D 1 - I - 0x0173E7 05:B3D7: 68        .byte $68   ; 
- D 1 - I - 0x0173E8 05:B3D8: C0        .byte $C0   ; 
- D 1 - I - 0x0173E9 05:B3D9: 00        .byte $00   ; 
- D 1 - I - 0x0173EA 05:B3DA: 00        .byte $00   ; 
- D 1 - I - 0x0173EB 05:B3DB: 65        .byte $65   ; 
- D 1 - I - 0x0173EC 05:B3DC: BE        .byte $BE   ; 
- D 1 - I - 0x0173ED 05:B3DD: 68        .byte $68   ; 
- D 1 - I - 0x0173EE 05:B3DE: C0        .byte $C0   ; 
- D 1 - I - 0x0173EF 05:B3DF: 66        .byte $66   ; 
- D 1 - I - 0x0173F0 05:B3E0: BF        .byte $BF   ; 
- D 1 - I - 0x0173F1 05:B3E1: 65        .byte $65   ; 
- D 1 - I - 0x0173F2 05:B3E2: BE        .byte $BE   ; 
- D 1 - I - 0x0173F3 05:B3E3: 0C        .byte $0C   ; 
- D 1 - I - 0x0173F4 05:B3E4: 94        .byte $94   ; 
- D 1 - I - 0x0173F5 05:B3E5: 1E        .byte $1E   ; 
- D 1 - I - 0x0173F6 05:B3E6: 8C        .byte $8C   ; 
- D 1 - I - 0x0173F7 05:B3E7: 68        .byte $68   ; 
- D 1 - I - 0x0173F8 05:B3E8: C0        .byte $C0   ; 
- D 1 - I - 0x0173F9 05:B3E9: 00        .byte $00   ; 
- D 1 - I - 0x0173FA 05:B3EA: 00        .byte $00   ; 
- D 1 - I - 0x0173FB 05:B3EB: 65        .byte $65   ; 
- D 1 - I - 0x0173FC 05:B3EC: BE        .byte $BE   ; 
- D 1 - I - 0x0173FD 05:B3ED: 68        .byte $68   ; 
- D 1 - I - 0x0173FE 05:B3EE: C0        .byte $C0   ; 
- D 1 - I - 0x0173FF 05:B3EF: 66        .byte $66   ; 
- D 1 - I - 0x017400 05:B3F0: BF        .byte $BF   ; 
- D 1 - I - 0x017401 05:B3F1: 65        .byte $65   ; 
- D 1 - I - 0x017402 05:B3F2: BE        .byte $BE   ; 
- D 1 - I - 0x017403 05:B3F3: 9E        .byte $9E   ; 
- D 1 - I - 0x017404 05:B3F4: 9F        .byte $9F   ; 
- D 1 - I - 0x017405 05:B3F5: A0        .byte $A0   ; 
- D 1 - I - 0x017406 05:B3F6: 8D        .byte $8D   ; 
- D 1 - I - 0x017407 05:B3F7: 68        .byte $68   ; 
- D 1 - I - 0x017408 05:B3F8: C0        .byte $C0   ; 
- D 1 - I - 0x017409 05:B3F9: 00        .byte $00   ; 
- D 1 - I - 0x01740A 05:B3FA: 00        .byte $00   ; 
- D 1 - I - 0x01740B 05:B3FB: 65        .byte $65   ; 
- D 1 - I - 0x01740C 05:B3FC: BE        .byte $BE   ; 
- D 1 - I - 0x01740D 05:B3FD: 68        .byte $68   ; 
- D 1 - I - 0x01740E 05:B3FE: C0        .byte $C0   ; 
- D 1 - I - 0x01740F 05:B3FF: 66        .byte $66   ; 
- D 1 - I - 0x017410 05:B400: BF        .byte $BF   ; 
- D 1 - I - 0x017411 05:B401: 65        .byte $65   ; 
- D 1 - I - 0x017412 05:B402: BE        .byte $BE   ; 
- D 1 - I - 0x017413 05:B403: 9E        .byte $9E   ; 
- D 1 - I - 0x017414 05:B404: AE        .byte $AE   ; 
- D 1 - I - 0x017415 05:B405: AF        .byte $AF   ; 
- D 1 - I - 0x017416 05:B406: 8D        .byte $8D   ; 
- D 1 - I - 0x017417 05:B407: 25        .byte $25   ; 
- D 1 - I - 0x017418 05:B408: 96        .byte $96   ; 
- D 1 - I - 0x017419 05:B409: 26        .byte $26   ; 
- D 1 - I - 0x01741A 05:B40A: 97        .byte $97   ; 
- D 1 - I - 0x01741B 05:B40B: 1F        .byte $1F   ; 
- D 1 - I - 0x01741C 05:B40C: 98        .byte $98   ; 
- D 1 - I - 0x01741D 05:B40D: 20        .byte $20   ; 
- D 1 - I - 0x01741E 05:B40E: 99        .byte $99   ; 
- D 1 - I - 0x01741F 05:B40F: 18        .byte $18   ; 
- D 1 - I - 0x017420 05:B410: E7        .byte $E7   ; 
- D 1 - I - 0x017421 05:B411: 17        .byte $17   ; 
- D 1 - I - 0x017422 05:B412: C9        .byte $C9   ; 
- D 1 - I - 0x017423 05:B413: D5        .byte $D5   ; 
- D 1 - I - 0x017424 05:B414: 02        .byte $02   ; 
- D 1 - I - 0x017425 05:B415: 18        .byte $18   ; 
- D 1 - I - 0x017426 05:B416: BF        .byte $BF   ; 
- D 1 - I - 0x017427 05:B417: 25        .byte $25   ; 
- D 1 - I - 0x017428 05:B418: 90        .byte $90   ; 
- D 1 - I - 0x017429 05:B419: 91        .byte $91   ; 
- D 1 - I - 0x01742A 05:B41A: 97        .byte $97   ; 
- D 1 - I - 0x01742B 05:B41B: 1F        .byte $1F   ; 
- D 1 - I - 0x01742C 05:B41C: 92        .byte $92   ; 
- D 1 - I - 0x01742D 05:B41D: 93        .byte $93   ; 
- D 1 - I - 0x01742E 05:B41E: 99        .byte $99   ; 
- D 1 - I - 0x01742F 05:B41F: 18        .byte $18   ; 
- D 1 - I - 0x017430 05:B420: E7        .byte $E7   ; 
- D 1 - I - 0x017431 05:B421: 17        .byte $17   ; 
- D 1 - I - 0x017432 05:B422: C9        .byte $C9   ; 
- D 1 - I - 0x017433 05:B423: D5        .byte $D5   ; 
- D 1 - I - 0x017434 05:B424: 02        .byte $02   ; 
- D 1 - I - 0x017435 05:B425: 18        .byte $18   ; 
- D 1 - I - 0x017436 05:B426: BF        .byte $BF   ; 
- D 1 - I - 0x017437 05:B427: A2        .byte $A2   ; 
- D 1 - I - 0x017438 05:B428: A3        .byte $A3   ; 
- D 1 - I - 0x017439 05:B429: A4        .byte $A4   ; 
- D 1 - I - 0x01743A 05:B42A: A5        .byte $A5   ; 
- D 1 - I - 0x01743B 05:B42B: A6        .byte $A6   ; 
- D 1 - I - 0x01743C 05:B42C: A7        .byte $A7   ; 
- D 1 - I - 0x01743D 05:B42D: A8        .byte $A8   ; 
- D 1 - I - 0x01743E 05:B42E: A9        .byte $A9   ; 
- D 1 - I - 0x01743F 05:B42F: 18        .byte $18   ; 
- D 1 - I - 0x017440 05:B430: E7        .byte $E7   ; 
- D 1 - I - 0x017441 05:B431: 17        .byte $17   ; 
- D 1 - I - 0x017442 05:B432: C9        .byte $C9   ; 
- D 1 - I - 0x017443 05:B433: D5        .byte $D5   ; 
- D 1 - I - 0x017444 05:B434: 02        .byte $02   ; 
- D 1 - I - 0x017445 05:B435: 18        .byte $18   ; 
- D 1 - I - 0x017446 05:B436: BF        .byte $BF   ; 
- D 1 - I - 0x017447 05:B437: A2        .byte $A2   ; 
- D 1 - I - 0x017448 05:B438: B0        .byte $B0   ; 
- D 1 - I - 0x017449 05:B439: B1        .byte $B1   ; 
- D 1 - I - 0x01744A 05:B43A: A5        .byte $A5   ; 
- D 1 - I - 0x01744B 05:B43B: A6        .byte $A6   ; 
- D 1 - I - 0x01744C 05:B43C: B2        .byte $B2   ; 
- D 1 - I - 0x01744D 05:B43D: B3        .byte $B3   ; 
- D 1 - I - 0x01744E 05:B43E: A9        .byte $A9   ; 
- D 1 - I - 0x01744F 05:B43F: 18        .byte $18   ; 
- D 1 - I - 0x017450 05:B440: E7        .byte $E7   ; 
- D 1 - I - 0x017451 05:B441: 17        .byte $17   ; 
- D 1 - I - 0x017452 05:B442: C9        .byte $C9   ; 
- D 1 - I - 0x017453 05:B443: D5        .byte $D5   ; 
- D 1 - I - 0x017454 05:B444: 02        .byte $02   ; 
- D 1 - I - 0x017455 05:B445: 18        .byte $18   ; 
- D 1 - I - 0x017456 05:B446: BF        .byte $BF   ; 
- D 1 - I - 0x017457 05:B447: 0C        .byte $0C   ; 
- D 1 - I - 0x017458 05:B448: 94        .byte $94   ; 
- D 1 - I - 0x017459 05:B449: 1E        .byte $1E   ; 
- D 1 - I - 0x01745A 05:B44A: 95        .byte $95   ; 
- D 1 - I - 0x01745B 05:B44B: 25        .byte $25   ; 
- D 1 - I - 0x01745C 05:B44C: 90        .byte $90   ; 
- D 1 - I - 0x01745D 05:B44D: 91        .byte $91   ; 
- D 1 - I - 0x01745E 05:B44E: 97        .byte $97   ; 
- D 1 - I - 0x01745F 05:B44F: 1F        .byte $1F   ; 
- D 1 - I - 0x017460 05:B450: 92        .byte $92   ; 
- D 1 - I - 0x017461 05:B451: 93        .byte $93   ; 
- D 1 - I - 0x017462 05:B452: 99        .byte $99   ; 
- D 1 - I - 0x017463 05:B453: 9A        .byte $9A   ; 
- D 1 - I - 0x017464 05:B454: 9B        .byte $9B   ; 
- D 1 - I - 0x017465 05:B455: 9C        .byte $9C   ; 
- D 1 - I - 0x017466 05:B456: 9D        .byte $9D   ; 
- D 1 - I - 0x017467 05:B457: 9E        .byte $9E   ; 
- D 1 - I - 0x017468 05:B458: 9F        .byte $9F   ; 
- D 1 - I - 0x017469 05:B459: A0        .byte $A0   ; 
- D 1 - I - 0x01746A 05:B45A: A1        .byte $A1   ; 
- D 1 - I - 0x01746B 05:B45B: A2        .byte $A2   ; 
- D 1 - I - 0x01746C 05:B45C: A3        .byte $A3   ; 
- D 1 - I - 0x01746D 05:B45D: A4        .byte $A4   ; 
- D 1 - I - 0x01746E 05:B45E: A5        .byte $A5   ; 
- D 1 - I - 0x01746F 05:B45F: A6        .byte $A6   ; 
- D 1 - I - 0x017470 05:B460: A7        .byte $A7   ; 
- D 1 - I - 0x017471 05:B461: A8        .byte $A8   ; 
- D 1 - I - 0x017472 05:B462: A9        .byte $A9   ; 
- D 1 - I - 0x017473 05:B463: AA        .byte $AA   ; 
- D 1 - I - 0x017474 05:B464: AB        .byte $AB   ; 
- D 1 - I - 0x017475 05:B465: AC        .byte $AC   ; 
- D 1 - I - 0x017476 05:B466: AD        .byte $AD   ; 
- D 1 - I - 0x017477 05:B467: 9E        .byte $9E   ; 
- D 1 - I - 0x017478 05:B468: AE        .byte $AE   ; 
- D 1 - I - 0x017479 05:B469: AF        .byte $AF   ; 
- D 1 - I - 0x01747A 05:B46A: A1        .byte $A1   ; 
- D 1 - I - 0x01747B 05:B46B: A2        .byte $A2   ; 
- D 1 - I - 0x01747C 05:B46C: B0        .byte $B0   ; 
- D 1 - I - 0x01747D 05:B46D: B1        .byte $B1   ; 
- D 1 - I - 0x01747E 05:B46E: A5        .byte $A5   ; 
- D 1 - I - 0x01747F 05:B46F: A6        .byte $A6   ; 
- D 1 - I - 0x017480 05:B470: B2        .byte $B2   ; 
- D 1 - I - 0x017481 05:B471: B3        .byte $B3   ; 
- D 1 - I - 0x017482 05:B472: A9        .byte $A9   ; 
- D 1 - I - 0x017483 05:B473: AA        .byte $AA   ; 
- D 1 - I - 0x017484 05:B474: AB        .byte $AB   ; 
- D 1 - I - 0x017485 05:B475: AC        .byte $AC   ; 
- D 1 - I - 0x017486 05:B476: AD        .byte $AD   ; 
- D 1 - I - 0x017487 05:B477: 01        .byte $01   ; 
- D 1 - I - 0x017488 05:B478: EA        .byte $EA   ; 
- D 1 - I - 0x017489 05:B479: 01        .byte $01   ; 
- D 1 - I - 0x01748A 05:B47A: EA        .byte $EA   ; 
- D 1 - I - 0x01748B 05:B47B: EB        .byte $EB   ; 
- D 1 - I - 0x01748C 05:B47C: EC        .byte $EC   ; 
- D 1 - I - 0x01748D 05:B47D: EB        .byte $EB   ; 
- D 1 - I - 0x01748E 05:B47E: EC        .byte $EC   ; 
- D 1 - I - 0x01748F 05:B47F: 0C        .byte $0C   ; 
- D 1 - I - 0x017490 05:B480: E1        .byte $E1   ; 
- D 1 - I - 0x017491 05:B481: 0D        .byte $0D   ; 
- D 1 - I - 0x017492 05:B482: E3        .byte $E3   ; 
- D 1 - I - 0x017493 05:B483: 10        .byte $10   ; 
- D 1 - I - 0x017494 05:B484: E2        .byte $E2   ; 
- D 1 - I - 0x017495 05:B485: 11        .byte $11   ; 
- D 1 - I - 0x017496 05:B486: E4        .byte $E4   ; 
- - - - - - 0x017497 05:B487: 06        .byte $06   ; 
- - - - - - 0x017498 05:B488: F3        .byte $F3   ; 
- - - - - - 0x017499 05:B489: 07        .byte $07   ; 
- - - - - - 0x01749A 05:B48A: F4        .byte $F4   ; 
- - - - - - 0x01749B 05:B48B: EB        .byte $EB   ; 
- - - - - - 0x01749C 05:B48C: EC        .byte $EC   ; 
- - - - - - 0x01749D 05:B48D: F5        .byte $F5   ; 
- - - - - - 0x01749E 05:B48E: F6        .byte $F6   ; 
- - - - - - 0x01749F 05:B48F: 0C        .byte $0C   ; 
- - - - - - 0x0174A0 05:B490: E1        .byte $E1   ; 
- - - - - - 0x0174A1 05:B491: 0D        .byte $0D   ; 
- - - - - - 0x0174A2 05:B492: E3        .byte $E3   ; 
- - - - - - 0x0174A3 05:B493: 10        .byte $10   ; 
- - - - - - 0x0174A4 05:B494: E2        .byte $E2   ; 
- - - - - - 0x0174A5 05:B495: 11        .byte $11   ; 
- - - - - - 0x0174A6 05:B496: E4        .byte $E4   ; 
- D 1 - I - 0x0174A7 05:B497: 01        .byte $01   ; 
- D 1 - I - 0x0174A8 05:B498: EA        .byte $EA   ; 
- D 1 - I - 0x0174A9 05:B499: 01        .byte $01   ; 
- D 1 - I - 0x0174AA 05:B49A: EA        .byte $EA   ; 
- D 1 - I - 0x0174AB 05:B49B: EB        .byte $EB   ; 
- D 1 - I - 0x0174AC 05:B49C: EC        .byte $EC   ; 
- D 1 - I - 0x0174AD 05:B49D: EB        .byte $EB   ; 
- D 1 - I - 0x0174AE 05:B49E: EC        .byte $EC   ; 
- D 1 - I - 0x0174AF 05:B49F: 04        .byte $04   ; 
- D 1 - I - 0x0174B0 05:B4A0: ED        .byte $ED   ; 
- D 1 - I - 0x0174B1 05:B4A1: 05        .byte $05   ; 
- D 1 - I - 0x0174B2 05:B4A2: F0        .byte $F0   ; 
- D 1 - I - 0x0174B3 05:B4A3: EE        .byte $EE   ; 
- D 1 - I - 0x0174B4 05:B4A4: EF        .byte $EF   ; 
- D 1 - I - 0x0174B5 05:B4A5: F1        .byte $F1   ; 
- D 1 - I - 0x0174B6 05:B4A6: F2        .byte $F2   ; 
- - - - - - 0x0174B7 05:B4A7: 0A        .byte $0A   ; 
- - - - - - 0x0174B8 05:B4A8: FC        .byte $FC   ; 
- - - - - - 0x0174B9 05:B4A9: 0B        .byte $0B   ; 
- - - - - - 0x0174BA 05:B4AA: FE        .byte $FE   ; 
- - - - - - 0x0174BB 05:B4AB: EB        .byte $EB   ; 
- - - - - - 0x0174BC 05:B4AC: FD        .byte $FD   ; 
- - - - - - 0x0174BD 05:B4AD: FF        .byte $FF   ; 
- - - - - - 0x0174BE 05:B4AE: EC        .byte $EC   ; 
- - - - - - 0x0174BF 05:B4AF: 04        .byte $04   ; 
- - - - - - 0x0174C0 05:B4B0: ED        .byte $ED   ; 
- - - - - - 0x0174C1 05:B4B1: 05        .byte $05   ; 
- - - - - - 0x0174C2 05:B4B2: F0        .byte $F0   ; 
- - - - - - 0x0174C3 05:B4B3: EE        .byte $EE   ; 
- - - - - - 0x0174C4 05:B4B4: EF        .byte $EF   ; 
- - - - - - 0x0174C5 05:B4B5: F1        .byte $F1   ; 
- - - - - - 0x0174C6 05:B4B6: F2        .byte $F2   ; 
- D 1 - I - 0x0174C7 05:B4B7: 01        .byte $01   ; 
- D 1 - I - 0x0174C8 05:B4B8: EA        .byte $EA   ; 
- D 1 - I - 0x0174C9 05:B4B9: 01        .byte $01   ; 
- D 1 - I - 0x0174CA 05:B4BA: EA        .byte $EA   ; 
- D 1 - I - 0x0174CB 05:B4BB: EB        .byte $EB   ; 
- D 1 - I - 0x0174CC 05:B4BC: EC        .byte $EC   ; 
- D 1 - I - 0x0174CD 05:B4BD: EB        .byte $EB   ; 
- D 1 - I - 0x0174CE 05:B4BE: EC        .byte $EC   ; 
- D 1 - I - 0x0174CF 05:B4BF: 08        .byte $08   ; 
- D 1 - I - 0x0174D0 05:B4C0: F2        .byte $F2   ; 
- D 1 - I - 0x0174D1 05:B4C1: 09        .byte $09   ; 
- D 1 - I - 0x0174D2 05:B4C2: F9        .byte $F9   ; 
- D 1 - I - 0x0174D3 05:B4C3: F7        .byte $F7   ; 
- D 1 - I - 0x0174D4 05:B4C4: F8        .byte $F8   ; 
- D 1 - I - 0x0174D5 05:B4C5: FA        .byte $FA   ; 
- D 1 - I - 0x0174D6 05:B4C6: FB        .byte $FB   ; 
- - - - - - 0x0174D7 05:B4C7: 0A        .byte $0A   ; 
- - - - - - 0x0174D8 05:B4C8: FC        .byte $FC   ; 
- - - - - - 0x0174D9 05:B4C9: 0B        .byte $0B   ; 
- - - - - - 0x0174DA 05:B4CA: FE        .byte $FE   ; 
- - - - - - 0x0174DB 05:B4CB: EB        .byte $EB   ; 
- - - - - - 0x0174DC 05:B4CC: FD        .byte $FD   ; 
- - - - - - 0x0174DD 05:B4CD: FF        .byte $FF   ; 
- - - - - - 0x0174DE 05:B4CE: EC        .byte $EC   ; 
- - - - - - 0x0174DF 05:B4CF: 08        .byte $08   ; 
- - - - - - 0x0174E0 05:B4D0: F2        .byte $F2   ; 
- - - - - - 0x0174E1 05:B4D1: 09        .byte $09   ; 
- - - - - - 0x0174E2 05:B4D2: F9        .byte $F9   ; 
- - - - - - 0x0174E3 05:B4D3: F7        .byte $F7   ; 
- - - - - - 0x0174E4 05:B4D4: F8        .byte $F8   ; 
- - - - - - 0x0174E5 05:B4D5: FA        .byte $FA   ; 
- - - - - - 0x0174E6 05:B4D6: FB        .byte $FB   ; 
- D 1 - I - 0x0174E7 05:B4D7: 01        .byte $01   ; 
- D 1 - I - 0x0174E8 05:B4D8: EA        .byte $EA   ; 
- D 1 - I - 0x0174E9 05:B4D9: 01        .byte $01   ; 
- D 1 - I - 0x0174EA 05:B4DA: EA        .byte $EA   ; 
- D 1 - I - 0x0174EB 05:B4DB: EB        .byte $EB   ; 
- D 1 - I - 0x0174EC 05:B4DC: EC        .byte $EC   ; 
- D 1 - I - 0x0174ED 05:B4DD: EB        .byte $EB   ; 
- D 1 - I - 0x0174EE 05:B4DE: EC        .byte $EC   ; 
- D 1 - I - 0x0174EF 05:B4DF: 00        .byte $00   ; 
- D 1 - I - 0x0174F0 05:B4E0: 00        .byte $00   ; 
- D 1 - I - 0x0174F1 05:B4E1: 00        .byte $00   ; 
- D 1 - I - 0x0174F2 05:B4E2: 00        .byte $00   ; 
- D 1 - I - 0x0174F3 05:B4E3: 00        .byte $00   ; 
- D 1 - I - 0x0174F4 05:B4E4: 00        .byte $00   ; 
- D 1 - I - 0x0174F5 05:B4E5: 00        .byte $00   ; 
- D 1 - I - 0x0174F6 05:B4E6: 00        .byte $00   ; 
- D 1 - I - 0x0174F7 05:B4E7: 50        .byte $50   ; 
- D 1 - I - 0x0174F8 05:B4E8: 7F        .byte $7F   ; 
- D 1 - I - 0x0174F9 05:B4E9: 51        .byte $51   ; 
- D 1 - I - 0x0174FA 05:B4EA: 80        .byte $80   ; 
- D 1 - I - 0x0174FB 05:B4EB: DC        .byte $DC   ; 
- D 1 - I - 0x0174FC 05:B4EC: DD        .byte $DD   ; 
- D 1 - I - 0x0174FD 05:B4ED: DC        .byte $DC   ; 
- D 1 - I - 0x0174FE 05:B4EE: DD        .byte $DD   ; 
- D 1 - I - 0x0174FF 05:B4EF: 08        .byte $08   ; 
- D 1 - I - 0x017500 05:B4F0: F2        .byte $F2   ; 
- D 1 - I - 0x017501 05:B4F1: 09        .byte $09   ; 
- D 1 - I - 0x017502 05:B4F2: F9        .byte $F9   ; 
- D 1 - I - 0x017503 05:B4F3: F7        .byte $F7   ; 
- D 1 - I - 0x017504 05:B4F4: F8        .byte $F8   ; 
- D 1 - I - 0x017505 05:B4F5: FA        .byte $FA   ; 
- D 1 - I - 0x017506 05:B4F6: FB        .byte $FB   ; 
- D 1 - I - 0x017507 05:B4F7: 43        .byte $43   ; 
- D 1 - I - 0x017508 05:B4F8: DB        .byte $DB   ; 
- D 1 - I - 0x017509 05:B4F9: 41        .byte $41   ; 
- D 1 - I - 0x01750A 05:B4FA: B5        .byte $B5   ; 
- D 1 - I - 0x01750B 05:B4FB: DC        .byte $DC   ; 
- D 1 - I - 0x01750C 05:B4FC: DD        .byte $DD   ; 
- D 1 - I - 0x01750D 05:B4FD: DC        .byte $DC   ; 
- D 1 - I - 0x01750E 05:B4FE: B6        .byte $B6   ; 
- D 1 - I - 0x01750F 05:B4FF: 00        .byte $00   ; 
- D 1 - I - 0x017510 05:B500: 00        .byte $00   ; 
- D 1 - I - 0x017511 05:B501: 00        .byte $00   ; 
- D 1 - I - 0x017512 05:B502: 00        .byte $00   ; 
- D 1 - I - 0x017513 05:B503: 00        .byte $00   ; 
- D 1 - I - 0x017514 05:B504: 00        .byte $00   ; 
- D 1 - I - 0x017515 05:B505: 00        .byte $00   ; 
- D 1 - I - 0x017516 05:B506: 00        .byte $00   ; 
- D 1 - I - 0x017517 05:B507: 00        .byte $00   ; 
- D 1 - I - 0x017518 05:B508: 00        .byte $00   ; 
- D 1 - I - 0x017519 05:B509: 00        .byte $00   ; 
- D 1 - I - 0x01751A 05:B50A: 00        .byte $00   ; 
- D 1 - I - 0x01751B 05:B50B: 00        .byte $00   ; 
- D 1 - I - 0x01751C 05:B50C: 00        .byte $00   ; 
- D 1 - I - 0x01751D 05:B50D: 00        .byte $00   ; 
- D 1 - I - 0x01751E 05:B50E: 00        .byte $00   ; 
- D 1 - I - 0x01751F 05:B50F: 00        .byte $00   ; 
- D 1 - I - 0x017520 05:B510: 00        .byte $00   ; 
- D 1 - I - 0x017521 05:B511: 00        .byte $00   ; 
- D 1 - I - 0x017522 05:B512: 00        .byte $00   ; 
- D 1 - I - 0x017523 05:B513: 89        .byte $89   ; 
- D 1 - I - 0x017524 05:B514: 8A        .byte $8A   ; 
- D 1 - I - 0x017525 05:B515: 8B        .byte $8B   ; 
- D 1 - I - 0x017526 05:B516: 7E        .byte $7E   ; 
- D 1 - I - 0x017527 05:B517: 21        .byte $21   ; 
- D 1 - I - 0x017528 05:B518: 73        .byte $73   ; 
- D 1 - I - 0x017529 05:B519: 22        .byte $22   ; 
- D 1 - I - 0x01752A 05:B51A: 74        .byte $74   ; 
- D 1 - I - 0x01752B 05:B51B: 75        .byte $75   ; 
- D 1 - I - 0x01752C 05:B51C: 76        .byte $76   ; 
- D 1 - I - 0x01752D 05:B51D: 77        .byte $77   ; 
- D 1 - I - 0x01752E 05:B51E: 78        .byte $78   ; 
- D 1 - I - 0x01752F 05:B51F: 23        .byte $23   ; 
- D 1 - I - 0x017530 05:B520: 79        .byte $79   ; 
- D 1 - I - 0x017531 05:B521: 24        .byte $24   ; 
- D 1 - I - 0x017532 05:B522: 7A        .byte $7A   ; 
- D 1 - I - 0x017533 05:B523: 7B        .byte $7B   ; 
- D 1 - I - 0x017534 05:B524: 7C        .byte $7C   ; 
- D 1 - I - 0x017535 05:B525: 7D        .byte $7D   ; 
- D 1 - I - 0x017536 05:B526: 7E        .byte $7E   ; 
- D 1 - I - 0x017537 05:B527: 21        .byte $21   ; 
- D 1 - I - 0x017538 05:B528: 73        .byte $73   ; 
- D 1 - I - 0x017539 05:B529: 22        .byte $22   ; 
- D 1 - I - 0x01753A 05:B52A: 74        .byte $74   ; 
- D 1 - I - 0x01753B 05:B52B: 75        .byte $75   ; 
- D 1 - I - 0x01753C 05:B52C: 81        .byte $81   ; 
- D 1 - I - 0x01753D 05:B52D: 82        .byte $82   ; 
- D 1 - I - 0x01753E 05:B52E: 78        .byte $78   ; 
- D 1 - I - 0x01753F 05:B52F: 83        .byte $83   ; 
- D 1 - I - 0x017540 05:B530: 84        .byte $84   ; 
- D 1 - I - 0x017541 05:B531: 85        .byte $85   ; 
- D 1 - I - 0x017542 05:B532: 7A        .byte $7A   ; 
- D 1 - I - 0x017543 05:B533: 86        .byte $86   ; 
- D 1 - I - 0x017544 05:B534: 87        .byte $87   ; 
- D 1 - I - 0x017545 05:B535: 88        .byte $88   ; 
- D 1 - I - 0x017546 05:B536: 7E        .byte $7E   ; 
- D 1 - I - 0x017547 05:B537: 2D        .byte $2D   ; 
- D 1 - I - 0x017548 05:B538: 48        .byte $48   ; 
- D 1 - I - 0x017549 05:B539: 2F        .byte $2F   ; 
- D 1 - I - 0x01754A 05:B53A: 00        .byte $00   ; 
- D 1 - I - 0x01754B 05:B53B: 29        .byte $29   ; 
- D 1 - I - 0x01754C 05:B53C: 3D        .byte $3D   ; 
- D 1 - I - 0x01754D 05:B53D: 34        .byte $34   ; 
- D 1 - I - 0x01754E 05:B53E: 00        .byte $00   ; 
- D 1 - I - 0x01754F 05:B53F: 40        .byte $40   ; 
- D 1 - I - 0x017550 05:B540: DB        .byte $DB   ; 
- D 1 - I - 0x017551 05:B541: 42        .byte $42   ; 
- D 1 - I - 0x017552 05:B542: DB        .byte $DB   ; 
- D 1 - I - 0x017553 05:B543: B4        .byte $B4   ; 
- D 1 - I - 0x017554 05:B544: DD        .byte $DD   ; 
- D 1 - I - 0x017555 05:B545: DC        .byte $DC   ; 
- D 1 - I - 0x017556 05:B546: DD        .byte $DD   ; 
- D 1 - I - 0x017557 05:B547: 00        .byte $00   ; 
- D 1 - I - 0x017558 05:B548: 00        .byte $00   ; 
- D 1 - I - 0x017559 05:B549: 00        .byte $00   ; 
- D 1 - I - 0x01755A 05:B54A: 00        .byte $00   ; 
- D 1 - I - 0x01755B 05:B54B: 00        .byte $00   ; 
- D 1 - I - 0x01755C 05:B54C: 00        .byte $00   ; 
- D 1 - I - 0x01755D 05:B54D: 00        .byte $00   ; 
- D 1 - I - 0x01755E 05:B54E: 00        .byte $00   ; 
- D 1 - I - 0x01755F 05:B54F: 00        .byte $00   ; 
- D 1 - I - 0x017560 05:B550: 00        .byte $00   ; 
- D 1 - I - 0x017561 05:B551: 34        .byte $34   ; 
- D 1 - I - 0x017562 05:B552: 54        .byte $54   ; 
- D 1 - I - 0x017563 05:B553: 00        .byte $00   ; 
- D 1 - I - 0x017564 05:B554: 00        .byte $00   ; 
- D 1 - I - 0x017565 05:B555: 35        .byte $35   ; 
- D 1 - I - 0x017566 05:B556: 49        .byte $49   ; 
- D 1 - I - 0x017567 05:B557: 00        .byte $00   ; 
- D 1 - I - 0x017568 05:B558: 00        .byte $00   ; 
- D 1 - I - 0x017569 05:B559: 00        .byte $00   ; 
- D 1 - I - 0x01756A 05:B55A: 00        .byte $00   ; 
- D 1 - I - 0x01756B 05:B55B: 33        .byte $33   ; 
- D 1 - I - 0x01756C 05:B55C: 00        .byte $00   ; 
- D 1 - I - 0x01756D 05:B55D: 34        .byte $34   ; 
- D 1 - I - 0x01756E 05:B55E: 54        .byte $54   ; 
- D 1 - I - 0x01756F 05:B55F: 36        .byte $36   ; 
- D 1 - I - 0x017570 05:B560: 56        .byte $56   ; 
- D 1 - I - 0x017571 05:B561: 35        .byte $35   ; 
- D 1 - I - 0x017572 05:B562: 55        .byte $55   ; 
- D 1 - I - 0x017573 05:B563: 57        .byte $57   ; 
- D 1 - I - 0x017574 05:B564: 58        .byte $58   ; 
- D 1 - I - 0x017575 05:B565: 4C        .byte $4C   ; 
- D 1 - I - 0x017576 05:B566: 5A        .byte $5A   ; 
- D 1 - I - 0x017577 05:B567: 00        .byte $00   ; 
- D 1 - I - 0x017578 05:B568: 00        .byte $00   ; 
- D 1 - I - 0x017579 05:B569: 00        .byte $00   ; 
- D 1 - I - 0x01757A 05:B56A: 00        .byte $00   ; 
- D 1 - I - 0x01757B 05:B56B: 4F        .byte $4F   ; 
- D 1 - I - 0x01757C 05:B56C: 52        .byte $52   ; 
- D 1 - I - 0x01757D 05:B56D: 00        .byte $00   ; 
- D 1 - I - 0x01757E 05:B56E: 00        .byte $00   ; 
- D 1 - I - 0x01757F 05:B56F: 33        .byte $33   ; 
- D 1 - I - 0x017580 05:B570: 00        .byte $00   ; 
- D 1 - I - 0x017581 05:B571: 34        .byte $34   ; 
- D 1 - I - 0x017582 05:B572: 54        .byte $54   ; 
- D 1 - I - 0x017583 05:B573: 32        .byte $32   ; 
- D 1 - I - 0x017584 05:B574: 47        .byte $47   ; 
- D 1 - I - 0x017585 05:B575: 35        .byte $35   ; 
- D 1 - I - 0x017586 05:B576: 49        .byte $49   ; 
- D 1 - I - 0x017587 05:B577: 00        .byte $00   ; 
- D 1 - I - 0x017588 05:B578: 00        .byte $00   ; 
- D 1 - I - 0x017589 05:B579: 00        .byte $00   ; 
- D 1 - I - 0x01758A 05:B57A: 00        .byte $00   ; 
- D 1 - I - 0x01758B 05:B57B: 33        .byte $33   ; 
- D 1 - I - 0x01758C 05:B57C: 00        .byte $00   ; 
- D 1 - I - 0x01758D 05:B57D: 00        .byte $00   ; 
- D 1 - I - 0x01758E 05:B57E: 00        .byte $00   ; 
- D 1 - I - 0x01758F 05:B57F: 36        .byte $36   ; 
- D 1 - I - 0x017590 05:B580: 56        .byte $56   ; 
- D 1 - I - 0x017591 05:B581: 35        .byte $35   ; 
- D 1 - I - 0x017592 05:B582: 00        .byte $00   ; 
- D 1 - I - 0x017593 05:B583: 57        .byte $57   ; 
- D 1 - I - 0x017594 05:B584: 58        .byte $58   ; 
- D 1 - I - 0x017595 05:B585: 4C        .byte $4C   ; 
- D 1 - I - 0x017596 05:B586: 00        .byte $00   ; 
- D 1 - I - 0x017597 05:B587: 00        .byte $00   ; 
- D 1 - I - 0x017598 05:B588: 54        .byte $54   ; 
- D 1 - I - 0x017599 05:B589: 2F        .byte $2F   ; 
- D 1 - I - 0x01759A 05:B58A: 47        .byte $47   ; 
- D 1 - I - 0x01759B 05:B58B: 00        .byte $00   ; 
- D 1 - I - 0x01759C 05:B58C: 55        .byte $55   ; 
- D 1 - I - 0x01759D 05:B58D: 2D        .byte $2D   ; 
- D 1 - I - 0x01759E 05:B58E: 48        .byte $48   ; 
- D 1 - I - 0x01759F 05:B58F: 00        .byte $00   ; 
- D 1 - I - 0x0175A0 05:B590: 56        .byte $56   ; 
- D 1 - I - 0x0175A1 05:B591: 2E        .byte $2E   ; 
- D 1 - I - 0x0175A2 05:B592: 49        .byte $49   ; 
- D 1 - I - 0x0175A3 05:B593: 00        .byte $00   ; 
- D 1 - I - 0x0175A4 05:B594: 00        .byte $00   ; 
- D 1 - I - 0x0175A5 05:B595: 59        .byte $59   ; 
- D 1 - I - 0x0175A6 05:B596: 4D        .byte $4D   ; 
- D 1 - I - 0x0175A7 05:B597: 2B        .byte $2B   ; 
- D 1 - I - 0x0175A8 05:B598: 3F        .byte $3F   ; 
- D 1 - I - 0x0175A9 05:B599: 2C        .byte $2C   ; 
- D 1 - I - 0x0175AA 05:B59A: 44        .byte $44   ; 
- D 1 - I - 0x0175AB 05:B59B: 38        .byte $38   ; 
- D 1 - I - 0x0175AC 05:B59C: 39        .byte $39   ; 
- D 1 - I - 0x0175AD 05:B59D: 3A        .byte $3A   ; 
- D 1 - I - 0x0175AE 05:B59E: 3B        .byte $3B   ; 
- D 1 - I - 0x0175AF 05:B59F: 27        .byte $27   ; 
- D 1 - I - 0x0175B0 05:B5A0: 37        .byte $37   ; 
- D 1 - I - 0x0175B1 05:B5A1: 28        .byte $28   ; 
- D 1 - I - 0x0175B2 05:B5A2: 3C        .byte $3C   ; 
- D 1 - I - 0x0175B3 05:B5A3: 46        .byte $46   ; 
- D 1 - I - 0x0175B4 05:B5A4: 47        .byte $47   ; 
- D 1 - I - 0x0175B5 05:B5A5: 2E        .byte $2E   ; 
- D 1 - I - 0x0175B6 05:B5A6: 3D        .byte $3D   ; 
- D 1 - I - 0x0175B7 05:B5A7: 2D        .byte $2D   ; 
- D 1 - I - 0x0175B8 05:B5A8: 48        .byte $48   ; 
- D 1 - I - 0x0175B9 05:B5A9: 2F        .byte $2F   ; 
- D 1 - I - 0x0175BA 05:B5AA: 47        .byte $47   ; 
- D 1 - I - 0x0175BB 05:B5AB: 29        .byte $29   ; 
- D 1 - I - 0x0175BC 05:B5AC: 3D        .byte $3D   ; 
- D 1 - I - 0x0175BD 05:B5AD: 28        .byte $28   ; 
- D 1 - I - 0x0175BE 05:B5AE: 3C        .byte $3C   ; 
- D 1 - I - 0x0175BF 05:B5AF: 2A        .byte $2A   ; 
- D 1 - I - 0x0175C0 05:B5B0: 3B        .byte $3B   ; 
- D 1 - I - 0x0175C1 05:B5B1: 29        .byte $29   ; 
- D 1 - I - 0x0175C2 05:B5B2: 3D        .byte $3D   ; 
- D 1 - I - 0x0175C3 05:B5B3: 4A        .byte $4A   ; 
- D 1 - I - 0x0175C4 05:B5B4: 4B        .byte $4B   ; 
- D 1 - I - 0x0175C5 05:B5B5: 3E        .byte $3E   ; 
- D 1 - I - 0x0175C6 05:B5B6: 4D        .byte $4D   ; 
- D 1 - I - 0x0175C7 05:B5B7: 2B        .byte $2B   ; 
- D 1 - I - 0x0175C8 05:B5B8: 4E        .byte $4E   ; 
- D 1 - I - 0x0175C9 05:B5B9: 31        .byte $31   ; 
- D 1 - I - 0x0175CA 05:B5BA: 00        .byte $00   ; 
- D 1 - I - 0x0175CB 05:B5BB: 45        .byte $45   ; 
- D 1 - I - 0x0175CC 05:B5BC: 52        .byte $52   ; 
- D 1 - I - 0x0175CD 05:B5BD: 32        .byte $32   ; 
- D 1 - I - 0x0175CE 05:B5BE: 00        .byte $00   ; 
- D 1 - I - 0x0175CF 05:B5BF: 2C        .byte $2C   ; 
- D 1 - I - 0x0175D0 05:B5C0: 00        .byte $00   ; 
- D 1 - I - 0x0175D1 05:B5C1: 34        .byte $34   ; 
- D 1 - I - 0x0175D2 05:B5C2: 00        .byte $00   ; 
- D 1 - I - 0x0175D3 05:B5C3: 46        .byte $46   ; 
- D 1 - I - 0x0175D4 05:B5C4: 53        .byte $53   ; 
- D 1 - I - 0x0175D5 05:B5C5: 35        .byte $35   ; 
- D 1 - I - 0x0175D6 05:B5C6: 00        .byte $00   ; 
- D 1 - I - 0x0175D7 05:B5C7: 00        .byte $00   ; 
- D 1 - I - 0x0175D8 05:B5C8: 4E        .byte $4E   ; 
- D 1 - I - 0x0175D9 05:B5C9: 31        .byte $31   ; 
- D 1 - I - 0x0175DA 05:B5CA: 44        .byte $44   ; 
- D 1 - I - 0x0175DB 05:B5CB: 00        .byte $00   ; 
- D 1 - I - 0x0175DC 05:B5CC: 52        .byte $52   ; 
- D 1 - I - 0x0175DD 05:B5CD: 32        .byte $32   ; 
- D 1 - I - 0x0175DE 05:B5CE: 53        .byte $53   ; 
- D 1 - I - 0x0175DF 05:B5CF: 00        .byte $00   ; 
- D 1 - I - 0x0175E0 05:B5D0: 00        .byte $00   ; 
- D 1 - I - 0x0175E1 05:B5D1: 00        .byte $00   ; 
- D 1 - I - 0x0175E2 05:B5D2: 00        .byte $00   ; 
- D 1 - I - 0x0175E3 05:B5D3: 00        .byte $00   ; 
- D 1 - I - 0x0175E4 05:B5D4: 00        .byte $00   ; 
- D 1 - I - 0x0175E5 05:B5D5: 00        .byte $00   ; 
- D 1 - I - 0x0175E6 05:B5D6: 00        .byte $00   ; 
- D 1 - I - 0x0175E7 05:B5D7: 34        .byte $34   ; 
- D 1 - I - 0x0175E8 05:B5D8: 54        .byte $54   ; 
- D 1 - I - 0x0175E9 05:B5D9: 2F        .byte $2F   ; 
- D 1 - I - 0x0175EA 05:B5DA: 53        .byte $53   ; 
- D 1 - I - 0x0175EB 05:B5DB: 35        .byte $35   ; 
- D 1 - I - 0x0175EC 05:B5DC: 55        .byte $55   ; 
- D 1 - I - 0x0175ED 05:B5DD: 34        .byte $34   ; 
- D 1 - I - 0x0175EE 05:B5DE: 54        .byte $54   ; 
- D 1 - I - 0x0175EF 05:B5DF: 36        .byte $36   ; 
- D 1 - I - 0x0175F0 05:B5E0: 56        .byte $56   ; 
- D 1 - I - 0x0175F1 05:B5E1: 35        .byte $35   ; 
- D 1 - I - 0x0175F2 05:B5E2: 55        .byte $55   ; 
- D 1 - I - 0x0175F3 05:B5E3: 00        .byte $00   ; 
- D 1 - I - 0x0175F4 05:B5E4: 00        .byte $00   ; 
- D 1 - I - 0x0175F5 05:B5E5: 00        .byte $00   ; 
- D 1 - I - 0x0175F6 05:B5E6: 00        .byte $00   ; 
- D 1 - I - 0x0175F7 05:B5E7: 2B        .byte $2B   ; 
- D 1 - I - 0x0175F8 05:B5E8: 4E        .byte $4E   ; 
- D 1 - I - 0x0175F9 05:B5E9: 2C        .byte $2C   ; 
- D 1 - I - 0x0175FA 05:B5EA: 44        .byte $44   ; 
- D 1 - I - 0x0175FB 05:B5EB: 4F        .byte $4F   ; 
- D 1 - I - 0x0175FC 05:B5EC: 52        .byte $52   ; 
- D 1 - I - 0x0175FD 05:B5ED: 32        .byte $32   ; 
- D 1 - I - 0x0175FE 05:B5EE: 53        .byte $53   ; 
- D 1 - I - 0x0175FF 05:B5EF: 33        .byte $33   ; 
- D 1 - I - 0x017600 05:B5F0: 00        .byte $00   ; 
- D 1 - I - 0x017601 05:B5F1: 00        .byte $00   ; 
- D 1 - I - 0x017602 05:B5F2: 00        .byte $00   ; 
- D 1 - I - 0x017603 05:B5F3: 00        .byte $00   ; 
- D 1 - I - 0x017604 05:B5F4: 00        .byte $00   ; 
- D 1 - I - 0x017605 05:B5F5: 00        .byte $00   ; 
- D 1 - I - 0x017606 05:B5F6: 00        .byte $00   ; 
- D 1 - I - 0x017607 05:B5F7: 34        .byte $34   ; 
- D 1 - I - 0x017608 05:B5F8: 54        .byte $54   ; 
- D 1 - I - 0x017609 05:B5F9: 00        .byte $00   ; 
- D 1 - I - 0x01760A 05:B5FA: 00        .byte $00   ; 
- D 1 - I - 0x01760B 05:B5FB: 35        .byte $35   ; 
- D 1 - I - 0x01760C 05:B5FC: 55        .byte $55   ; 
- D 1 - I - 0x01760D 05:B5FD: 00        .byte $00   ; 
- D 1 - I - 0x01760E 05:B5FE: 00        .byte $00   ; 
- D 1 - I - 0x01760F 05:B5FF: 00        .byte $00   ; 
- D 1 - I - 0x017610 05:B600: 00        .byte $00   ; 
- D 1 - I - 0x017611 05:B601: 00        .byte $00   ; 
- D 1 - I - 0x017612 05:B602: 00        .byte $00   ; 
- D 1 - I - 0x017613 05:B603: 00        .byte $00   ; 
- D 1 - I - 0x017614 05:B604: 00        .byte $00   ; 
- D 1 - I - 0x017615 05:B605: 00        .byte $00   ; 
- D 1 - I - 0x017616 05:B606: 00        .byte $00   ; 
- D 1 - I - 0x017617 05:B607: 30        .byte $30   ; 
- D 1 - I - 0x017618 05:B608: 4E        .byte $4E   ; 
- D 1 - I - 0x017619 05:B609: 31        .byte $31   ; 
- D 1 - I - 0x01761A 05:B60A: 00        .byte $00   ; 
- D 1 - I - 0x01761B 05:B60B: 4F        .byte $4F   ; 
- D 1 - I - 0x01761C 05:B60C: 52        .byte $52   ; 
- D 1 - I - 0x01761D 05:B60D: 32        .byte $32   ; 
- D 1 - I - 0x01761E 05:B60E: 53        .byte $53   ; 
- D 1 - I - 0x01761F 05:B60F: 33        .byte $33   ; 
- D 1 - I - 0x017620 05:B610: 00        .byte $00   ; 
- D 1 - I - 0x017621 05:B611: 34        .byte $34   ; 
- D 1 - I - 0x017622 05:B612: 54        .byte $54   ; 
- D 1 - I - 0x017623 05:B613: 32        .byte $32   ; 
- D 1 - I - 0x017624 05:B614: 53        .byte $53   ; 
- D 1 - I - 0x017625 05:B615: 35        .byte $35   ; 
- D 1 - I - 0x017626 05:B616: 55        .byte $55   ; 
- D 1 - I - 0x017627 05:B617: 34        .byte $34   ; 
- D 1 - I - 0x017628 05:B618: 54        .byte $54   ; 
- D 1 - I - 0x017629 05:B619: 32        .byte $32   ; 
- D 1 - I - 0x01762A 05:B61A: 53        .byte $53   ; 
- D 1 - I - 0x01762B 05:B61B: 35        .byte $35   ; 
- D 1 - I - 0x01762C 05:B61C: 55        .byte $55   ; 
- D 1 - I - 0x01762D 05:B61D: 34        .byte $34   ; 
- D 1 - I - 0x01762E 05:B61E: 54        .byte $54   ; 
- D 1 - I - 0x01762F 05:B61F: 36        .byte $36   ; 
- D 1 - I - 0x017630 05:B620: 56        .byte $56   ; 
- D 1 - I - 0x017631 05:B621: 35        .byte $35   ; 
- D 1 - I - 0x017632 05:B622: 55        .byte $55   ; 
- D 1 - I - 0x017633 05:B623: 57        .byte $57   ; 
- D 1 - I - 0x017634 05:B624: 58        .byte $58   ; 
- D 1 - I - 0x017635 05:B625: 59        .byte $59   ; 
- D 1 - I - 0x017636 05:B626: 5A        .byte $5A   ; 
- D 1 - I - 0x017637 05:B627: 34        .byte $34   ; 
- D 1 - I - 0x017638 05:B628: 54        .byte $54   ; 
- D 1 - I - 0x017639 05:B629: 2F        .byte $2F   ; 
- D 1 - I - 0x01763A 05:B62A: 53        .byte $53   ; 
- D 1 - I - 0x01763B 05:B62B: 35        .byte $35   ; 
- D 1 - I - 0x01763C 05:B62C: 55        .byte $55   ; 
- D 1 - I - 0x01763D 05:B62D: 34        .byte $34   ; 
- D 1 - I - 0x01763E 05:B62E: 54        .byte $54   ; 
- D 1 - I - 0x01763F 05:B62F: 68        .byte $68   ; 
- D 1 - I - 0x017640 05:B630: C0        .byte $C0   ; 
- D 1 - I - 0x017641 05:B631: 00        .byte $00   ; 
- D 1 - I - 0x017642 05:B632: 00        .byte $00   ; 
- D 1 - I - 0x017643 05:B633: 65        .byte $65   ; 
- D 1 - I - 0x017644 05:B634: BE        .byte $BE   ; 
- D 1 - I - 0x017645 05:B635: 68        .byte $68   ; 
- D 1 - I - 0x017646 05:B636: C0        .byte $C0   ; 
- D 1 - I - 0x017647 05:B637: 30        .byte $30   ; 
- D 1 - I - 0x017648 05:B638: 4E        .byte $4E   ; 
- D 1 - I - 0x017649 05:B639: 31        .byte $31   ; 
- D 1 - I - 0x01764A 05:B63A: 00        .byte $00   ; 
- D 1 - I - 0x01764B 05:B63B: 4F        .byte $4F   ; 
- D 1 - I - 0x01764C 05:B63C: 52        .byte $52   ; 
- D 1 - I - 0x01764D 05:B63D: 32        .byte $32   ; 
- D 1 - I - 0x01764E 05:B63E: 53        .byte $53   ; 
- D 1 - I - 0x01764F 05:B63F: 01        .byte $01   ; 
- D 1 - I - 0x017650 05:B640: EA        .byte $EA   ; 
- D 1 - I - 0x017651 05:B641: 01        .byte $01   ; 
- D 1 - I - 0x017652 05:B642: EA        .byte $EA   ; 
- D 1 - I - 0x017653 05:B643: EB        .byte $EB   ; 
- D 1 - I - 0x017654 05:B644: EC        .byte $EC   ; 
- D 1 - I - 0x017655 05:B645: EB        .byte $EB   ; 
- D 1 - I - 0x017656 05:B646: EC        .byte $EC   ; 
- D 1 - I - 0x017657 05:B647: 00        .byte $00   ; 
- D 1 - I - 0x017658 05:B648: 00        .byte $00   ; 
- D 1 - I - 0x017659 05:B649: 40        .byte $40   ; 
- D 1 - I - 0x01765A 05:B64A: DB        .byte $DB   ; 
- D 1 - I - 0x01765B 05:B64B: 00        .byte $00   ; 
- D 1 - I - 0x01765C 05:B64C: 00        .byte $00   ; 
- D 1 - I - 0x01765D 05:B64D: B4        .byte $B4   ; 
- D 1 - I - 0x01765E 05:B64E: DD        .byte $DD   ; 
- D 1 - I - 0x01765F 05:B64F: 00        .byte $00   ; 
- D 1 - I - 0x017660 05:B650: 00        .byte $00   ; 
- D 1 - I - 0x017661 05:B651: 00        .byte $00   ; 
- D 1 - I - 0x017662 05:B652: 00        .byte $00   ; 
- D 1 - I - 0x017663 05:B653: 00        .byte $00   ; 
- D 1 - I - 0x017664 05:B654: 00        .byte $00   ; 
- D 1 - I - 0x017665 05:B655: 00        .byte $00   ; 
- D 1 - I - 0x017666 05:B656: 00        .byte $00   ; 
- D 1 - I - 0x017667 05:B657: 00        .byte $00   ; 
- D 1 - I - 0x017668 05:B658: 00        .byte $00   ; 
- D 1 - I - 0x017669 05:B659: 01        .byte $01   ; 
- D 1 - I - 0x01766A 05:B65A: EA        .byte $EA   ; 
- D 1 - I - 0x01766B 05:B65B: 00        .byte $00   ; 
- D 1 - I - 0x01766C 05:B65C: 00        .byte $00   ; 
- D 1 - I - 0x01766D 05:B65D: EB        .byte $EB   ; 
- D 1 - I - 0x01766E 05:B65E: EC        .byte $EC   ; 
- - - - - - 0x01766F 05:B65F: 00        .byte $00   ; 
- - - - - - 0x017670 05:B660: 00        .byte $00   ; 
- - - - - - 0x017671 05:B661: 02        .byte $02   ; 
- - - - - - 0x017672 05:B662: DE        .byte $DE   ; 
- - - - - - 0x017673 05:B663: 00        .byte $00   ; 
- - - - - - 0x017674 05:B664: 00        .byte $00   ; 
- - - - - - 0x017675 05:B665: 00        .byte $00   ; 
- - - - - - 0x017676 05:B666: DF        .byte $DF   ; 
- D 1 - I - 0x017677 05:B667: 42        .byte $42   ; 
- D 1 - I - 0x017678 05:B668: 41        .byte $41   ; 
- D 1 - I - 0x017679 05:B669: 42        .byte $42   ; 
- D 1 - I - 0x01767A 05:B66A: 41        .byte $41   ; 
- D 1 - I - 0x01767B 05:B66B: DC        .byte $DC   ; 
- D 1 - I - 0x01767C 05:B66C: DD        .byte $DD   ; 
- D 1 - I - 0x01767D 05:B66D: DC        .byte $DC   ; 
- D 1 - I - 0x01767E 05:B66E: DD        .byte $DD   ; 
- D 1 - I - 0x01767F 05:B66F: 8B        .byte $8B   ; 
- D 1 - I - 0x017680 05:B670: D2        .byte $D2   ; 
- D 1 - I - 0x017681 05:B671: 89        .byte $89   ; 
- D 1 - I - 0x017682 05:B672: BC        .byte $BC   ; 
- D 1 - I - 0x017683 05:B673: B0        .byte $B0   ; 
- D 1 - I - 0x017684 05:B674: C1        .byte $C1   ; 
- D 1 - I - 0x017685 05:B675: BE        .byte $BE   ; 
- D 1 - I - 0x017686 05:B676: AB        .byte $AB   ; 
- D 1 - I - 0x017687 05:B677: 42        .byte $42   ; 
- D 1 - I - 0x017688 05:B678: 41        .byte $41   ; 
- D 1 - I - 0x017689 05:B679: 42        .byte $42   ; 
- D 1 - I - 0x01768A 05:B67A: 41        .byte $41   ; 
- D 1 - I - 0x01768B 05:B67B: DC        .byte $DC   ; 
- D 1 - I - 0x01768C 05:B67C: DD        .byte $DD   ; 
- D 1 - I - 0x01768D 05:B67D: DC        .byte $DC   ; 
- D 1 - I - 0x01768E 05:B67E: DD        .byte $DD   ; 
- D 1 - I - 0x01768F 05:B67F: 85        .byte $85   ; 
- D 1 - I - 0x017690 05:B680: D3        .byte $D3   ; 
- D 1 - I - 0x017691 05:B681: 5D        .byte $5D   ; 
- D 1 - I - 0x017692 05:B682: C6        .byte $C6   ; 
- D 1 - I - 0x017693 05:B683: D5        .byte $D5   ; 
- D 1 - I - 0x017694 05:B684: 62        .byte $62   ; 
- D 1 - I - 0x017695 05:B685: 5D        .byte $5D   ; 
- D 1 - I - 0x017696 05:B686: C6        .byte $C6   ; 
- D 1 - I - 0x017697 05:B687: 42        .byte $42   ; 
- D 1 - I - 0x017698 05:B688: 41        .byte $41   ; 
- D 1 - I - 0x017699 05:B689: 42        .byte $42   ; 
- D 1 - I - 0x01769A 05:B68A: B5        .byte $B5   ; 
- D 1 - I - 0x01769B 05:B68B: DC        .byte $DC   ; 
- D 1 - I - 0x01769C 05:B68C: DD        .byte $DD   ; 
- D 1 - I - 0x01769D 05:B68D: DC        .byte $DC   ; 
- D 1 - I - 0x01769E 05:B68E: B6        .byte $B6   ; 
- D 1 - I - 0x01769F 05:B68F: 8B        .byte $8B   ; 
- D 1 - I - 0x0176A0 05:B690: D2        .byte $D2   ; 
- D 1 - I - 0x0176A1 05:B691: 89        .byte $89   ; 
- D 1 - I - 0x0176A2 05:B692: BC        .byte $BC   ; 
- D 1 - I - 0x0176A3 05:B693: B0        .byte $B0   ; 
- D 1 - I - 0x0176A4 05:B694: C1        .byte $C1   ; 
- D 1 - I - 0x0176A5 05:B695: BE        .byte $BE   ; 
- D 1 - I - 0x0176A6 05:B696: AB        .byte $AB   ; 
- D 1 - I - 0x0176A7 05:B697: 40        .byte $40   ; 
- D 1 - I - 0x0176A8 05:B698: 41        .byte $41   ; 
- D 1 - I - 0x0176A9 05:B699: 42        .byte $42   ; 
- D 1 - I - 0x0176AA 05:B69A: B5        .byte $B5   ; 
- D 1 - I - 0x0176AB 05:B69B: B4        .byte $B4   ; 
- D 1 - I - 0x0176AC 05:B69C: DD        .byte $DD   ; 
- D 1 - I - 0x0176AD 05:B69D: DC        .byte $DC   ; 
- D 1 - I - 0x0176AE 05:B69E: B6        .byte $B6   ; 
- D 1 - I - 0x0176AF 05:B69F: 85        .byte $85   ; 
- D 1 - I - 0x0176B0 05:B6A0: D3        .byte $D3   ; 
- D 1 - I - 0x0176B1 05:B6A1: 5D        .byte $5D   ; 
- D 1 - I - 0x0176B2 05:B6A2: C6        .byte $C6   ; 
- D 1 - I - 0x0176B3 05:B6A3: D5        .byte $D5   ; 
- D 1 - I - 0x0176B4 05:B6A4: 62        .byte $62   ; 
- D 1 - I - 0x0176B5 05:B6A5: 5D        .byte $5D   ; 
- D 1 - I - 0x0176B6 05:B6A6: C6        .byte $C6   ; 
- D 1 - I - 0x0176B7 05:B6A7: 00        .byte $00   ; 
- D 1 - I - 0x0176B8 05:B6A8: 00        .byte $00   ; 
- D 1 - I - 0x0176B9 05:B6A9: 40        .byte $40   ; 
- D 1 - I - 0x0176BA 05:B6AA: 41        .byte $41   ; 
- D 1 - I - 0x0176BB 05:B6AB: 00        .byte $00   ; 
- D 1 - I - 0x0176BC 05:B6AC: 00        .byte $00   ; 
- D 1 - I - 0x0176BD 05:B6AD: B4        .byte $B4   ; 
- D 1 - I - 0x0176BE 05:B6AE: DD        .byte $DD   ; 
- D 1 - I - 0x0176BF 05:B6AF: 00        .byte $00   ; 
- D 1 - I - 0x0176C0 05:B6B0: 00        .byte $00   ; 
- D 1 - I - 0x0176C1 05:B6B1: 61        .byte $61   ; 
- D 1 - I - 0x0176C2 05:B6B2: B8        .byte $B8   ; 
- D 1 - I - 0x0176C3 05:B6B3: 00        .byte $00   ; 
- D 1 - I - 0x0176C4 05:B6B4: 00        .byte $00   ; 
- D 1 - I - 0x0176C5 05:B6B5: E0        .byte $E0   ; 
- D 1 - I - 0x0176C6 05:B6B6: 8B        .byte $8B   ; 
- D 1 - I - 0x0176C7 05:B6B7: 00        .byte $00   ; 
- D 1 - I - 0x0176C8 05:B6B8: 00        .byte $00   ; 
- D 1 - I - 0x0176C9 05:B6B9: 8B        .byte $8B   ; 
- D 1 - I - 0x0176CA 05:B6BA: B0        .byte $B0   ; 
- D 1 - I - 0x0176CB 05:B6BB: 00        .byte $00   ; 
- D 1 - I - 0x0176CC 05:B6BC: 00        .byte $00   ; 
- D 1 - I - 0x0176CD 05:B6BD: B0        .byte $B0   ; 
- D 1 - I - 0x0176CE 05:B6BE: 88        .byte $88   ; 
- - - - - - 0x0176CF 05:B6BF: 00        .byte $00   ; 
- - - - - - 0x0176D0 05:B6C0: 00        .byte $00   ; 
- - - - - - 0x0176D1 05:B6C1: 00        .byte $00   ; 
- - - - - - 0x0176D2 05:B6C2: 00        .byte $00   ; 
- - - - - - 0x0176D3 05:B6C3: 00        .byte $00   ; 
- - - - - - 0x0176D4 05:B6C4: 00        .byte $00   ; 
- - - - - - 0x0176D5 05:B6C5: 00        .byte $00   ; 
- - - - - - 0x0176D6 05:B6C6: 00        .byte $00   ; 
- D 1 - I - 0x0176D7 05:B6C7: 50        .byte $50   ; 
- D 1 - I - 0x0176D8 05:B6C8: 00        .byte $00   ; 
- D 1 - I - 0x0176D9 05:B6C9: 5F        .byte $5F   ; 
- D 1 - I - 0x0176DA 05:B6CA: DA        .byte $DA   ; 
- D 1 - I - 0x0176DB 05:B6CB: 00        .byte $00   ; 
- D 1 - I - 0x0176DC 05:B6CC: 5B        .byte $5B   ; 
- D 1 - I - 0x0176DD 05:B6CD: D9        .byte $D9   ; 
- D 1 - I - 0x0176DE 05:B6CE: DE        .byte $DE   ; 
- D 1 - I - 0x0176DF 05:B6CF: 5B        .byte $5B   ; 
- D 1 - I - 0x0176E0 05:B6D0: B8        .byte $B8   ; 
- D 1 - I - 0x0176E1 05:B6D1: 8C        .byte $8C   ; 
- D 1 - I - 0x0176E2 05:B6D2: B1        .byte $B1   ; 
- D 1 - I - 0x0176E3 05:B6D3: B8        .byte $B8   ; 
- D 1 - I - 0x0176E4 05:B6D4: 8B        .byte $8B   ; 
- D 1 - I - 0x0176E5 05:B6D5: B0        .byte $B0   ; 
- D 1 - I - 0x0176E6 05:B6D6: 88        .byte $88   ; 
- D 1 - I - 0x0176E7 05:B6D7: 8B        .byte $8B   ; 
- D 1 - I - 0x0176E8 05:B6D8: D2        .byte $D2   ; 
- D 1 - I - 0x0176E9 05:B6D9: 89        .byte $89   ; 
- D 1 - I - 0x0176EA 05:B6DA: BC        .byte $BC   ; 
- D 1 - I - 0x0176EB 05:B6DB: B0        .byte $B0   ; 
- D 1 - I - 0x0176EC 05:B6DC: C1        .byte $C1   ; 
- D 1 - I - 0x0176ED 05:B6DD: BE        .byte $BE   ; 
- D 1 - I - 0x0176EE 05:B6DE: AB        .byte $AB   ; 
- D 1 - I - 0x0176EF 05:B6DF: 88        .byte $88   ; 
- D 1 - I - 0x0176F0 05:B6E0: BC        .byte $BC   ; 
- D 1 - I - 0x0176F1 05:B6E1: 51        .byte $51   ; 
- D 1 - I - 0x0176F2 05:B6E2: D6        .byte $D6   ; 
- D 1 - I - 0x0176F3 05:B6E3: BE        .byte $BE   ; 
- D 1 - I - 0x0176F4 05:B6E4: 50        .byte $50   ; 
- D 1 - I - 0x0176F5 05:B6E5: D7        .byte $D7   ; 
- D 1 - I - 0x0176F6 05:B6E6: D8        .byte $D8   ; 
- D 1 - I - 0x0176F7 05:B6E7: 85        .byte $85   ; 
- D 1 - I - 0x0176F8 05:B6E8: D3        .byte $D3   ; 
- D 1 - I - 0x0176F9 05:B6E9: 5D        .byte $5D   ; 
- D 1 - I - 0x0176FA 05:B6EA: C6        .byte $C6   ; 
- D 1 - I - 0x0176FB 05:B6EB: D5        .byte $D5   ; 
- D 1 - I - 0x0176FC 05:B6EC: 62        .byte $62   ; 
- D 1 - I - 0x0176FD 05:B6ED: 5D        .byte $5D   ; 
- D 1 - I - 0x0176FE 05:B6EE: C6        .byte $C6   ; 
- D 1 - I - 0x0176FF 05:B6EF: 60        .byte $60   ; 
- D 1 - I - 0x017700 05:B6F0: B3        .byte $B3   ; 
- D 1 - I - 0x017701 05:B6F1: 5D        .byte $5D   ; 
- D 1 - I - 0x017702 05:B6F2: C6        .byte $C6   ; 
- D 1 - I - 0x017703 05:B6F3: B9        .byte $B9   ; 
- D 1 - I - 0x017704 05:B6F4: 8B        .byte $8B   ; 
- D 1 - I - 0x017705 05:B6F5: C3        .byte $C3   ; 
- D 1 - I - 0x017706 05:B6F6: C7        .byte $C7   ; 
- D 1 - I - 0x017707 05:B6F7: 8B        .byte $8B   ; 
- D 1 - I - 0x017708 05:B6F8: D2        .byte $D2   ; 
- D 1 - I - 0x017709 05:B6F9: 89        .byte $89   ; 
- D 1 - I - 0x01770A 05:B6FA: BC        .byte $BC   ; 
- D 1 - I - 0x01770B 05:B6FB: B0        .byte $B0   ; 
- D 1 - I - 0x01770C 05:B6FC: C1        .byte $C1   ; 
- D 1 - I - 0x01770D 05:B6FD: BE        .byte $BE   ; 
- D 1 - I - 0x01770E 05:B6FE: AB        .byte $AB   ; 
- D 1 - I - 0x01770F 05:B6FF: 88        .byte $88   ; 
- D 1 - I - 0x017710 05:B700: BC        .byte $BC   ; 
- D 1 - I - 0x017711 05:B701: 51        .byte $51   ; 
- D 1 - I - 0x017712 05:B702: D6        .byte $D6   ; 
- D 1 - I - 0x017713 05:B703: BD        .byte $BD   ; 
- D 1 - I - 0x017714 05:B704: 50        .byte $50   ; 
- D 1 - I - 0x017715 05:B705: D7        .byte $D7   ; 
- D 1 - I - 0x017716 05:B706: D8        .byte $D8   ; 
- D 1 - I - 0x017717 05:B707: 8B        .byte $8B   ; 
- D 1 - I - 0x017718 05:B708: B0        .byte $B0   ; 
- D 1 - I - 0x017719 05:B709: 88        .byte $88   ; 
- D 1 - I - 0x01771A 05:B70A: BC        .byte $BC   ; 
- D 1 - I - 0x01771B 05:B70B: B0        .byte $B0   ; 
- D 1 - I - 0x01771C 05:B70C: 88        .byte $88   ; 
- D 1 - I - 0x01771D 05:B70D: BE        .byte $BE   ; 
- D 1 - I - 0x01771E 05:B70E: 82        .byte $82   ; 
- D 1 - I - 0x01771F 05:B70F: 88        .byte $88   ; 
- D 1 - I - 0x017720 05:B710: BC        .byte $BC   ; 
- D 1 - I - 0x017721 05:B711: 84        .byte $84   ; 
- D 1 - I - 0x017722 05:B712: E1        .byte $E1   ; 
- D 1 - I - 0x017723 05:B713: BD        .byte $BD   ; 
- D 1 - I - 0x017724 05:B714: AD        .byte $AD   ; 
- D 1 - I - 0x017725 05:B715: E2        .byte $E2   ; 
- D 1 - I - 0x017726 05:B716: E3        .byte $E3   ; 
- D 1 - I - 0x017727 05:B717: 85        .byte $85   ; 
- D 1 - I - 0x017728 05:B718: D3        .byte $D3   ; 
- D 1 - I - 0x017729 05:B719: 61        .byte $61   ; 
- D 1 - I - 0x01772A 05:B71A: B8        .byte $B8   ; 
- D 1 - I - 0x01772B 05:B71B: D5        .byte $D5   ; 
- D 1 - I - 0x01772C 05:B71C: 62        .byte $62   ; 
- D 1 - I - 0x01772D 05:B71D: E0        .byte $E0   ; 
- D 1 - I - 0x01772E 05:B71E: 8B        .byte $8B   ; 
- D 1 - I - 0x01772F 05:B71F: 5E        .byte $5E   ; 
- D 1 - I - 0x017730 05:B720: D3        .byte $D3   ; 
- D 1 - I - 0x017731 05:B721: 8B        .byte $8B   ; 
- D 1 - I - 0x017732 05:B722: B0        .byte $B0   ; 
- D 1 - I - 0x017733 05:B723: D5        .byte $D5   ; 
- D 1 - I - 0x017734 05:B724: 62        .byte $62   ; 
- D 1 - I - 0x017735 05:B725: B0        .byte $B0   ; 
- D 1 - I - 0x017736 05:B726: 88        .byte $88   ; 
- D 1 - I - 0x017737 05:B727: 8B        .byte $8B   ; 
- D 1 - I - 0x017738 05:B728: B0        .byte $B0   ; 
- D 1 - I - 0x017739 05:B729: 88        .byte $88   ; 
- D 1 - I - 0x01773A 05:B72A: BC        .byte $BC   ; 
- D 1 - I - 0x01773B 05:B72B: B0        .byte $B0   ; 
- D 1 - I - 0x01773C 05:B72C: 88        .byte $88   ; 
- D 1 - I - 0x01773D 05:B72D: BE        .byte $BE   ; 
- D 1 - I - 0x01773E 05:B72E: 82        .byte $82   ; 
- D 1 - I - 0x01773F 05:B72F: 88        .byte $88   ; 
- D 1 - I - 0x017740 05:B730: BC        .byte $BC   ; 
- D 1 - I - 0x017741 05:B731: 84        .byte $84   ; 
- D 1 - I - 0x017742 05:B732: E1        .byte $E1   ; 
- D 1 - I - 0x017743 05:B733: BE        .byte $BE   ; 
- D 1 - I - 0x017744 05:B734: AD        .byte $AD   ; 
- D 1 - I - 0x017745 05:B735: E2        .byte $E2   ; 
- D 1 - I - 0x017746 05:B736: E3        .byte $E3   ; 
- D 1 - I - 0x017747 05:B737: 5E        .byte $5E   ; 
- D 1 - I - 0x017748 05:B738: B0        .byte $B0   ; 
- D 1 - I - 0x017749 05:B739: 88        .byte $88   ; 
- D 1 - I - 0x01774A 05:B73A: C8        .byte $C8   ; 
- D 1 - I - 0x01774B 05:B73B: CE        .byte $CE   ; 
- D 1 - I - 0x01774C 05:B73C: 88        .byte $88   ; 
- D 1 - I - 0x01774D 05:B73D: BE        .byte $BE   ; 
- D 1 - I - 0x01774E 05:B73E: AF        .byte $AF   ; 
- D 1 - I - 0x01774F 05:B73F: 88        .byte $88   ; 
- D 1 - I - 0x017750 05:B740: BC        .byte $BC   ; 
- D 1 - I - 0x017751 05:B741: 87        .byte $87   ; 
- D 1 - I - 0x017752 05:B742: C5        .byte $C5   ; 
- D 1 - I - 0x017753 05:B743: BE        .byte $BE   ; 
- D 1 - I - 0x017754 05:B744: AC        .byte $AC   ; 
- D 1 - I - 0x017755 05:B745: C2        .byte $C2   ; 
- D 1 - I - 0x017756 05:B746: C4        .byte $C4   ; 
- D 1 - I - 0x017757 05:B747: 8B        .byte $8B   ; 
- D 1 - I - 0x017758 05:B748: B0        .byte $B0   ; 
- D 1 - I - 0x017759 05:B749: 88        .byte $88   ; 
- D 1 - I - 0x01775A 05:B74A: C8        .byte $C8   ; 
- D 1 - I - 0x01775B 05:B74B: B0        .byte $B0   ; 
- D 1 - I - 0x01775C 05:B74C: 88        .byte $88   ; 
- D 1 - I - 0x01775D 05:B74D: BE        .byte $BE   ; 
- D 1 - I - 0x01775E 05:B74E: AF        .byte $AF   ; 
- D 1 - I - 0x01775F 05:B74F: 88        .byte $88   ; 
- D 1 - I - 0x017760 05:B750: BC        .byte $BC   ; 
- D 1 - I - 0x017761 05:B751: 50        .byte $50   ; 
- D 1 - I - 0x017762 05:B752: 00        .byte $00   ; 
- D 1 - I - 0x017763 05:B753: BE        .byte $BE   ; 
- D 1 - I - 0x017764 05:B754: 83        .byte $83   ; 
- D 1 - I - 0x017765 05:B755: DF        .byte $DF   ; 
- D 1 - I - 0x017766 05:B756: 5B        .byte $5B   ; 
- D 1 - I - 0x017767 05:B757: 8B        .byte $8B   ; 
- D 1 - I - 0x017768 05:B758: B0        .byte $B0   ; 
- D 1 - I - 0x017769 05:B759: 88        .byte $88   ; 
- D 1 - I - 0x01776A 05:B75A: C8        .byte $C8   ; 
- D 1 - I - 0x01776B 05:B75B: B0        .byte $B0   ; 
- D 1 - I - 0x01776C 05:B75C: 88        .byte $88   ; 
- D 1 - I - 0x01776D 05:B75D: BE        .byte $BE   ; 
- D 1 - I - 0x01776E 05:B75E: AE        .byte $AE   ; 
- D 1 - I - 0x01776F 05:B75F: 88        .byte $88   ; 
- D 1 - I - 0x017770 05:B760: BC        .byte $BC   ; 
- D 1 - I - 0x017771 05:B761: 50        .byte $50   ; 
- D 1 - I - 0x017772 05:B762: 00        .byte $00   ; 
- D 1 - I - 0x017773 05:B763: BE        .byte $BE   ; 
- D 1 - I - 0x017774 05:B764: 83        .byte $83   ; 
- D 1 - I - 0x017775 05:B765: DF        .byte $DF   ; 
- D 1 - I - 0x017776 05:B766: 5B        .byte $5B   ; 
- D 1 - I - 0x017777 05:B767: 5E        .byte $5E   ; 
- D 1 - I - 0x017778 05:B768: B0        .byte $B0   ; 
- D 1 - I - 0x017779 05:B769: 88        .byte $88   ; 
- D 1 - I - 0x01777A 05:B76A: BC        .byte $BC   ; 
- D 1 - I - 0x01777B 05:B76B: CE        .byte $CE   ; 
- D 1 - I - 0x01777C 05:B76C: 88        .byte $88   ; 
- D 1 - I - 0x01777D 05:B76D: BE        .byte $BE   ; 
- D 1 - I - 0x01777E 05:B76E: AE        .byte $AE   ; 
- D 1 - I - 0x01777F 05:B76F: 88        .byte $88   ; 
- D 1 - I - 0x017780 05:B770: BC        .byte $BC   ; 
- D 1 - I - 0x017781 05:B771: 87        .byte $87   ; 
- D 1 - I - 0x017782 05:B772: C5        .byte $C5   ; 
- D 1 - I - 0x017783 05:B773: BE        .byte $BE   ; 
- D 1 - I - 0x017784 05:B774: AC        .byte $AC   ; 
- D 1 - I - 0x017785 05:B775: C2        .byte $C2   ; 
- D 1 - I - 0x017786 05:B776: C4        .byte $C4   ; 
- D 1 - I - 0x017787 05:B777: 85        .byte $85   ; 
- D 1 - I - 0x017788 05:B778: D4        .byte $D4   ; 
- D 1 - I - 0x017789 05:B779: 5C        .byte $5C   ; 
- D 1 - I - 0x01778A 05:B77A: BA        .byte $BA   ; 
- D 1 - I - 0x01778B 05:B77B: D5        .byte $D5   ; 
- D 1 - I - 0x01778C 05:B77C: 62        .byte $62   ; 
- D 1 - I - 0x01778D 05:B77D: B7        .byte $B7   ; 
- D 1 - I - 0x01778E 05:B77E: 8B        .byte $8B   ; 
- D 1 - I - 0x01778F 05:B77F: 5E        .byte $5E   ; 
- D 1 - I - 0x017790 05:B780: B8        .byte $B8   ; 
- D 1 - I - 0x017791 05:B781: 8B        .byte $8B   ; 
- D 1 - I - 0x017792 05:B782: B0        .byte $B0   ; 
- D 1 - I - 0x017793 05:B783: 00        .byte $00   ; 
- D 1 - I - 0x017794 05:B784: E7        .byte $E7   ; 
- D 1 - I - 0x017795 05:B785: E8        .byte $E8   ; 
- D 1 - I - 0x017796 05:B786: E9        .byte $E9   ; 
- D 1 - I - 0x017797 05:B787: 5E        .byte $5E   ; 
- D 1 - I - 0x017798 05:B788: B0        .byte $B0   ; 
- D 1 - I - 0x017799 05:B789: 88        .byte $88   ; 
- D 1 - I - 0x01779A 05:B78A: BC        .byte $BC   ; 
- D 1 - I - 0x01779B 05:B78B: B0        .byte $B0   ; 
- D 1 - I - 0x01779C 05:B78C: 88        .byte $88   ; 
- D 1 - I - 0x01779D 05:B78D: BE        .byte $BE   ; 
- D 1 - I - 0x01779E 05:B78E: 82        .byte $82   ; 
- D 1 - I - 0x01779F 05:B78F: 88        .byte $88   ; 
- D 1 - I - 0x0177A0 05:B790: BC        .byte $BC   ; 
- D 1 - I - 0x0177A1 05:B791: 84        .byte $84   ; 
- D 1 - I - 0x0177A2 05:B792: E1        .byte $E1   ; 
- D 1 - I - 0x0177A3 05:B793: BF        .byte $BF   ; 
- D 1 - I - 0x0177A4 05:B794: 50        .byte $50   ; 
- D 1 - I - 0x0177A5 05:B795: E4        .byte $E4   ; 
- D 1 - I - 0x0177A6 05:B796: E3        .byte $E3   ; 
- D 1 - I - 0x0177A7 05:B797: 5E        .byte $5E   ; 
- D 1 - I - 0x0177A8 05:B798: B0        .byte $B0   ; 
- D 1 - I - 0x0177A9 05:B799: 88        .byte $88   ; 
- D 1 - I - 0x0177AA 05:B79A: BC        .byte $BC   ; 
- D 1 - I - 0x0177AB 05:B79B: B0        .byte $B0   ; 
- D 1 - I - 0x0177AC 05:B79C: 88        .byte $88   ; 
- D 1 - I - 0x0177AD 05:B79D: BE        .byte $BE   ; 
- D 1 - I - 0x0177AE 05:B79E: 85        .byte $85   ; 
- D 1 - I - 0x0177AF 05:B79F: 88        .byte $88   ; 
- D 1 - I - 0x0177B0 05:B7A0: BC        .byte $BC   ; 
- D 1 - I - 0x0177B1 05:B7A1: 82        .byte $82   ; 
- D 1 - I - 0x0177B2 05:B7A2: D5        .byte $D5   ; 
- D 1 - I - 0x0177B3 05:B7A3: BF        .byte $BF   ; 
- D 1 - I - 0x0177B4 05:B7A4: 50        .byte $50   ; 
- D 1 - I - 0x0177B5 05:B7A5: E5        .byte $E5   ; 
- D 1 - I - 0x0177B6 05:B7A6: 5E        .byte $5E   ; 
- D 1 - I - 0x0177B7 05:B7A7: 83        .byte $83   ; 
- D 1 - I - 0x0177B8 05:B7A8: DF        .byte $DF   ; 
- D 1 - I - 0x0177B9 05:B7A9: 5F        .byte $5F   ; 
- D 1 - I - 0x0177BA 05:B7AA: DA        .byte $DA   ; 
- D 1 - I - 0x0177BB 05:B7AB: D3        .byte $D3   ; 
- D 1 - I - 0x0177BC 05:B7AC: 61        .byte $61   ; 
- D 1 - I - 0x0177BD 05:B7AD: D9        .byte $D9   ; 
- D 1 - I - 0x0177BE 05:B7AE: DE        .byte $DE   ; 
- D 1 - I - 0x0177BF 05:B7AF: 62        .byte $62   ; 
- D 1 - I - 0x0177C0 05:B7B0: E0        .byte $E0   ; 
- D 1 - I - 0x0177C1 05:B7B1: 8C        .byte $8C   ; 
- D 1 - I - 0x0177C2 05:B7B2: B1        .byte $B1   ; 
- D 1 - I - 0x0177C3 05:B7B3: E6        .byte $E6   ; 
- D 1 - I - 0x0177C4 05:B7B4: E7        .byte $E7   ; 
- D 1 - I - 0x0177C5 05:B7B5: E8        .byte $E8   ; 
- D 1 - I - 0x0177C6 05:B7B6: E9        .byte $E9   ; 
- D 1 - I - 0x0177C7 05:B7B7: 8B        .byte $8B   ; 
- D 1 - I - 0x0177C8 05:B7B8: B0        .byte $B0   ; 
- D 1 - I - 0x0177C9 05:B7B9: 88        .byte $88   ; 
- D 1 - I - 0x0177CA 05:B7BA: C8        .byte $C8   ; 
- D 1 - I - 0x0177CB 05:B7BB: B2        .byte $B2   ; 
- D 1 - I - 0x0177CC 05:B7BC: 88        .byte $88   ; 
- D 1 - I - 0x0177CD 05:B7BD: BE        .byte $BE   ; 
- D 1 - I - 0x0177CE 05:B7BE: 85        .byte $85   ; 
- D 1 - I - 0x0177CF 05:B7BF: 88        .byte $88   ; 
- D 1 - I - 0x0177D0 05:B7C0: BC        .byte $BC   ; 
- D 1 - I - 0x0177D1 05:B7C1: 82        .byte $82   ; 
- D 1 - I - 0x0177D2 05:B7C2: D5        .byte $D5   ; 
- D 1 - I - 0x0177D3 05:B7C3: BF        .byte $BF   ; 
- D 1 - I - 0x0177D4 05:B7C4: 50        .byte $50   ; 
- D 1 - I - 0x0177D5 05:B7C5: E5        .byte $E5   ; 
- D 1 - I - 0x0177D6 05:B7C6: 5E        .byte $5E   ; 
- D 1 - I - 0x0177D7 05:B7C7: 8B        .byte $8B   ; 
- D 1 - I - 0x0177D8 05:B7C8: B0        .byte $B0   ; 
- D 1 - I - 0x0177D9 05:B7C9: 88        .byte $88   ; 
- D 1 - I - 0x0177DA 05:B7CA: C8        .byte $C8   ; 
- D 1 - I - 0x0177DB 05:B7CB: B0        .byte $B0   ; 
- D 1 - I - 0x0177DC 05:B7CC: 88        .byte $88   ; 
- D 1 - I - 0x0177DD 05:B7CD: BE        .byte $BE   ; 
- D 1 - I - 0x0177DE 05:B7CE: 82        .byte $82   ; 
- D 1 - I - 0x0177DF 05:B7CF: 88        .byte $88   ; 
- D 1 - I - 0x0177E0 05:B7D0: BC        .byte $BC   ; 
- D 1 - I - 0x0177E1 05:B7D1: 84        .byte $84   ; 
- D 1 - I - 0x0177E2 05:B7D2: E1        .byte $E1   ; 
- D 1 - I - 0x0177E3 05:B7D3: BF        .byte $BF   ; 
- D 1 - I - 0x0177E4 05:B7D4: 50        .byte $50   ; 
- D 1 - I - 0x0177E5 05:B7D5: E4        .byte $E4   ; 
- D 1 - I - 0x0177E6 05:B7D6: E3        .byte $E3   ; 
- D 1 - I - 0x0177E7 05:B7D7: 88        .byte $88   ; 
- D 1 - I - 0x0177E8 05:B7D8: BC        .byte $BC   ; 
- D 1 - I - 0x0177E9 05:B7D9: 51        .byte $51   ; 
- D 1 - I - 0x0177EA 05:B7DA: D6        .byte $D6   ; 
- D 1 - I - 0x0177EB 05:B7DB: BD        .byte $BD   ; 
- D 1 - I - 0x0177EC 05:B7DC: 50        .byte $50   ; 
- D 1 - I - 0x0177ED 05:B7DD: D7        .byte $D7   ; 
- D 1 - I - 0x0177EE 05:B7DE: D8        .byte $D8   ; 
- D 1 - I - 0x0177EF 05:B7DF: 50        .byte $50   ; 
- D 1 - I - 0x0177F0 05:B7E0: 00        .byte $00   ; 
- D 1 - I - 0x0177F1 05:B7E1: 5F        .byte $5F   ; 
- D 1 - I - 0x0177F2 05:B7E2: DA        .byte $DA   ; 
- D 1 - I - 0x0177F3 05:B7E3: 00        .byte $00   ; 
- D 1 - I - 0x0177F4 05:B7E4: 5B        .byte $5B   ; 
- D 1 - I - 0x0177F5 05:B7E5: D9        .byte $D9   ; 
- D 1 - I - 0x0177F6 05:B7E6: DE        .byte $DE   ; 
- D 1 - I - 0x0177F7 05:B7E7: 60        .byte $60   ; 
- D 1 - I - 0x0177F8 05:B7E8: B3        .byte $B3   ; 
- D 1 - I - 0x0177F9 05:B7E9: 5D        .byte $5D   ; 
- D 1 - I - 0x0177FA 05:B7EA: C6        .byte $C6   ; 
- D 1 - I - 0x0177FB 05:B7EB: B9        .byte $B9   ; 
- D 1 - I - 0x0177FC 05:B7EC: 8B        .byte $8B   ; 
- D 1 - I - 0x0177FD 05:B7ED: C3        .byte $C3   ; 
- D 1 - I - 0x0177FE 05:B7EE: C7        .byte $C7   ; 
- D 1 - I - 0x0177FF 05:B7EF: 8B        .byte $8B   ; 
- D 1 - I - 0x017800 05:B7F0: B0        .byte $B0   ; 
- D 1 - I - 0x017801 05:B7F1: 88        .byte $88   ; 
- D 1 - I - 0x017802 05:B7F2: C8        .byte $C8   ; 
- D 1 - I - 0x017803 05:B7F3: B0        .byte $B0   ; 
- D 1 - I - 0x017804 05:B7F4: 88        .byte $88   ; 
- D 1 - I - 0x017805 05:B7F5: BE        .byte $BE   ; 
- D 1 - I - 0x017806 05:B7F6: AE        .byte $AE   ; 
- D 1 - I - 0x017807 05:B7F7: 00        .byte $00   ; 
- D 1 - I - 0x017808 05:B7F8: 00        .byte $00   ; 
- D 1 - I - 0x017809 05:B7F9: 5C        .byte $5C   ; 
- D 1 - I - 0x01780A 05:B7FA: BA        .byte $BA   ; 
- D 1 - I - 0x01780B 05:B7FB: 00        .byte $00   ; 
- D 1 - I - 0x01780C 05:B7FC: 00        .byte $00   ; 
- D 1 - I - 0x01780D 05:B7FD: B7        .byte $B7   ; 
- D 1 - I - 0x01780E 05:B7FE: 8B        .byte $8B   ; 
- D 1 - I - 0x01780F 05:B7FF: 00        .byte $00   ; 
- D 1 - I - 0x017810 05:B800: 00        .byte $00   ; 
- D 1 - I - 0x017811 05:B801: E7        .byte $E7   ; 
- D 1 - I - 0x017812 05:B802: E8        .byte $E8   ; 
- D 1 - I - 0x017813 05:B803: 00        .byte $00   ; 
- D 1 - I - 0x017814 05:B804: 00        .byte $00   ; 
- D 1 - I - 0x017815 05:B805: 00        .byte $00   ; 
- D 1 - I - 0x017816 05:B806: 00        .byte $00   ; 
- D 1 - I - 0x017817 05:B807: 5E        .byte $5E   ; 
- D 1 - I - 0x017818 05:B808: B0        .byte $B0   ; 
- D 1 - I - 0x017819 05:B809: 88        .byte $88   ; 
- D 1 - I - 0x01781A 05:B80A: BC        .byte $BC   ; 
- D 1 - I - 0x01781B 05:B80B: B0        .byte $B0   ; 
- D 1 - I - 0x01781C 05:B80C: 88        .byte $88   ; 
- D 1 - I - 0x01781D 05:B80D: BE        .byte $BE   ; 
- D 1 - I - 0x01781E 05:B80E: 82        .byte $82   ; 
- D 1 - I - 0x01781F 05:B80F: E9        .byte $E9   ; 
- D 1 - I - 0x017820 05:B810: BD        .byte $BD   ; 
- D 1 - I - 0x017821 05:B811: 84        .byte $84   ; 
- D 1 - I - 0x017822 05:B812: E1        .byte $E1   ; 
- D 1 - I - 0x017823 05:B813: 00        .byte $00   ; 
- D 1 - I - 0x017824 05:B814: 00        .byte $00   ; 
- D 1 - I - 0x017825 05:B815: E4        .byte $E4   ; 
- D 1 - I - 0x017826 05:B816: E3        .byte $E3   ; 
- D 1 - I - 0x017827 05:B817: 85        .byte $85   ; 
- D 1 - I - 0x017828 05:B818: D3        .byte $D3   ; 
- D 1 - I - 0x017829 05:B819: 61        .byte $61   ; 
- D 1 - I - 0x01782A 05:B81A: B8        .byte $B8   ; 
- D 1 - I - 0x01782B 05:B81B: D5        .byte $D5   ; 
- D 1 - I - 0x01782C 05:B81C: 62        .byte $62   ; 
- D 1 - I - 0x01782D 05:B81D: E0        .byte $E0   ; 
- D 1 - I - 0x01782E 05:B81E: 8B        .byte $8B   ; 
- D 1 - I - 0x01782F 05:B81F: 5E        .byte $5E   ; 
- D 1 - I - 0x017830 05:B820: B8        .byte $B8   ; 
- D 1 - I - 0x017831 05:B821: 8B        .byte $8B   ; 
- D 1 - I - 0x017832 05:B822: B0        .byte $B0   ; 
- D 1 - I - 0x017833 05:B823: 00        .byte $00   ; 
- D 1 - I - 0x017834 05:B824: E7        .byte $E7   ; 
- D 1 - I - 0x017835 05:B825: E8        .byte $E8   ; 
- D 1 - I - 0x017836 05:B826: E9        .byte $E9   ; 
- D 1 - I - 0x017837 05:B827: 8B        .byte $8B   ; 
- D 1 - I - 0x017838 05:B828: B0        .byte $B0   ; 
- D 1 - I - 0x017839 05:B829: 88        .byte $88   ; 
- D 1 - I - 0x01783A 05:B82A: BC        .byte $BC   ; 
- D 1 - I - 0x01783B 05:B82B: B0        .byte $B0   ; 
- D 1 - I - 0x01783C 05:B82C: 88        .byte $88   ; 
- D 1 - I - 0x01783D 05:B82D: BE        .byte $BE   ; 
- D 1 - I - 0x01783E 05:B82E: 50        .byte $50   ; 
- D 1 - I - 0x01783F 05:B82F: 88        .byte $88   ; 
- D 1 - I - 0x017840 05:B830: BC        .byte $BC   ; 
- D 1 - I - 0x017841 05:B831: 15        .byte $15   ; 
- D 1 - I - 0x017842 05:B832: 00        .byte $00   ; 
- D 1 - I - 0x017843 05:B833: BF        .byte $BF   ; 
- D 1 - I - 0x017844 05:B834: 50        .byte $50   ; 
- D 1 - I - 0x017845 05:B835: 00        .byte $00   ; 
- D 1 - I - 0x017846 05:B836: 00        .byte $00   ; 
- D 1 - I - 0x017847 05:B837: 42        .byte $42   ; 
- D 1 - I - 0x017848 05:B838: 41        .byte $41   ; 
- D 1 - I - 0x017849 05:B839: 42        .byte $42   ; 
- D 1 - I - 0x01784A 05:B83A: B5        .byte $B5   ; 
- D 1 - I - 0x01784B 05:B83B: B4        .byte $B4   ; 
- D 1 - I - 0x01784C 05:B83C: DD        .byte $DD   ; 
- D 1 - I - 0x01784D 05:B83D: DC        .byte $DC   ; 
- D 1 - I - 0x01784E 05:B83E: B6        .byte $B6   ; 
- D 1 - I - 0x01784F 05:B83F: 85        .byte $85   ; 
- D 1 - I - 0x017850 05:B840: D3        .byte $D3   ; 
- D 1 - I - 0x017851 05:B841: 5D        .byte $5D   ; 
- D 1 - I - 0x017852 05:B842: C6        .byte $C6   ; 
- D 1 - I - 0x017853 05:B843: D5        .byte $D5   ; 
- D 1 - I - 0x017854 05:B844: 62        .byte $62   ; 
- D 1 - I - 0x017855 05:B845: 5D        .byte $5D   ; 
- D 1 - I - 0x017856 05:B846: C6        .byte $C6   ; 
- D 1 - I - 0x017857 05:B847: 72        .byte $72   ; 
- D 1 - I - 0x017858 05:B848: 67        .byte $67   ; 
- D 1 - I - 0x017859 05:B849: 68        .byte $68   ; 
- D 1 - I - 0x01785A 05:B84A: 67        .byte $67   ; 
- D 1 - I - 0x01785B 05:B84B: 6C        .byte $6C   ; 
- D 1 - I - 0x01785C 05:B84C: 6E        .byte $6E   ; 
- D 1 - I - 0x01785D 05:B84D: 99        .byte $99   ; 
- D 1 - I - 0x01785E 05:B84E: 99        .byte $99   ; 
- D 1 - I - 0x01785F 05:B84F: 00        .byte $00   ; 
- D 1 - I - 0x017860 05:B850: 6C        .byte $6C   ; 
- D 1 - I - 0x017861 05:B851: 0F        .byte $0F   ; 
- D 1 - I - 0x017862 05:B852: 12        .byte $12   ; 
- D 1 - I - 0x017863 05:B853: 00        .byte $00   ; 
- D 1 - I - 0x017864 05:B854: 00        .byte $00   ; 
- D 1 - I - 0x017865 05:B855: 00        .byte $00   ; 
- D 1 - I - 0x017866 05:B856: 00        .byte $00   ; 
- D 1 - I - 0x017867 05:B857: 69        .byte $69   ; 
- D 1 - I - 0x017868 05:B858: 67        .byte $67   ; 
- D 1 - I - 0x017869 05:B859: 68        .byte $68   ; 
- D 1 - I - 0x01786A 05:B85A: 69        .byte $69   ; 
- D 1 - I - 0x01786B 05:B85B: 72        .byte $72   ; 
- D 1 - I - 0x01786C 05:B85C: 70        .byte $70   ; 
- D 1 - I - 0x01786D 05:B85D: 66        .byte $66   ; 
- D 1 - I - 0x01786E 05:B85E: 67        .byte $67   ; 
- D 1 - I - 0x01786F 05:B85F: 12        .byte $12   ; 
- D 1 - I - 0x017870 05:B860: 72        .byte $72   ; 
- D 1 - I - 0x017871 05:B861: 70        .byte $70   ; 
- D 1 - I - 0x017872 05:B862: 71        .byte $71   ; 
- D 1 - I - 0x017873 05:B863: 00        .byte $00   ; 
- D 1 - I - 0x017874 05:B864: 97        .byte $97   ; 
- D 1 - I - 0x017875 05:B865: 9C        .byte $9C   ; 
- D 1 - I - 0x017876 05:B866: 99        .byte $99   ; 
- D 1 - I - 0x017877 05:B867: 69        .byte $69   ; 
- D 1 - I - 0x017878 05:B868: B0        .byte $B0   ; 
- D 1 - I - 0x017879 05:B869: 88        .byte $88   ; 
- D 1 - I - 0x01787A 05:B86A: BC        .byte $BC   ; 
- D 1 - I - 0x01787B 05:B86B: 66        .byte $66   ; 
- D 1 - I - 0x01787C 05:B86C: 6B        .byte $6B   ; 
- D 1 - I - 0x01787D 05:B86D: BE        .byte $BE   ; 
- D 1 - I - 0x01787E 05:B86E: 50        .byte $50   ; 
- D 1 - I - 0x01787F 05:B86F: 73        .byte $73   ; 
- D 1 - I - 0x017880 05:B870: 94        .byte $94   ; 
- D 1 - I - 0x017881 05:B871: 69        .byte $69   ; 
- D 1 - I - 0x017882 05:B872: 00        .byte $00   ; 
- D 1 - I - 0x017883 05:B873: 6D        .byte $6D   ; 
- D 1 - I - 0x017884 05:B874: 70        .byte $70   ; 
- D 1 - I - 0x017885 05:B875: 94        .byte $94   ; 
- D 1 - I - 0x017886 05:B876: 6B        .byte $6B   ; 
- D 1 - I - 0x017887 05:B877: 6C        .byte $6C   ; 
- D 1 - I - 0x017888 05:B878: 6E        .byte $6E   ; 
- D 1 - I - 0x017889 05:B879: 75        .byte $75   ; 
- D 1 - I - 0x01788A 05:B87A: 66        .byte $66   ; 
- D 1 - I - 0x01788B 05:B87B: 10        .byte $10   ; 
- D 1 - I - 0x01788C 05:B87C: 6D        .byte $6D   ; 
- D 1 - I - 0x01788D 05:B87D: 70        .byte $70   ; 
- D 1 - I - 0x01788E 05:B87E: 94        .byte $94   ; 
- D 1 - I - 0x01788F 05:B87F: 00        .byte $00   ; 
- D 1 - I - 0x017890 05:B880: 10        .byte $10   ; 
- D 1 - I - 0x017891 05:B881: 6E        .byte $6E   ; 
- D 1 - I - 0x017892 05:B882: 70        .byte $70   ; 
- D 1 - I - 0x017893 05:B883: 00        .byte $00   ; 
- D 1 - I - 0x017894 05:B884: 00        .byte $00   ; 
- D 1 - I - 0x017895 05:B885: 6C        .byte $6C   ; 
- D 1 - I - 0x017896 05:B886: 6F        .byte $6F   ; 
- D 1 - I - 0x017897 05:B887: 8B        .byte $8B   ; 
- D 1 - I - 0x017898 05:B888: D2        .byte $D2   ; 
- D 1 - I - 0x017899 05:B889: 89        .byte $89   ; 
- D 1 - I - 0x01789A 05:B88A: BC        .byte $BC   ; 
- D 1 - I - 0x01789B 05:B88B: 69        .byte $69   ; 
- D 1 - I - 0x01789C 05:B88C: C0        .byte $C0   ; 
- D 1 - I - 0x01789D 05:B88D: BE        .byte $BE   ; 
- D 1 - I - 0x01789E 05:B88E: AB        .byte $AB   ; 
- D 1 - I - 0x01789F 05:B88F: 66        .byte $66   ; 
- D 1 - I - 0x0178A0 05:B890: 69        .byte $69   ; 
- D 1 - I - 0x0178A1 05:B891: 51        .byte $51   ; 
- D 1 - I - 0x0178A2 05:B892: D6        .byte $D6   ; 
- D 1 - I - 0x0178A3 05:B893: 70        .byte $70   ; 
- D 1 - I - 0x0178A4 05:B894: 94        .byte $94   ; 
- D 1 - I - 0x0178A5 05:B895: D7        .byte $D7   ; 
- D 1 - I - 0x0178A6 05:B896: D8        .byte $D8   ; 
- D 1 - I - 0x0178A7 05:B897: 00        .byte $00   ; 
- D 1 - I - 0x0178A8 05:B898: 00        .byte $00   ; 
- D 1 - I - 0x0178A9 05:B899: 10        .byte $10   ; 
- D 1 - I - 0x0178AA 05:B89A: 78        .byte $78   ; 
- D 1 - I - 0x0178AB 05:B89B: 00        .byte $00   ; 
- D 1 - I - 0x0178AC 05:B89C: 00        .byte $00   ; 
- D 1 - I - 0x0178AD 05:B89D: 00        .byte $00   ; 
- D 1 - I - 0x0178AE 05:B89E: 6D        .byte $6D   ; 
- D 1 - I - 0x0178AF 05:B89F: 00        .byte $00   ; 
- D 1 - I - 0x0178B0 05:B8A0: 00        .byte $00   ; 
- D 1 - I - 0x0178B1 05:B8A1: 00        .byte $00   ; 
- D 1 - I - 0x0178B2 05:B8A2: 6C        .byte $6C   ; 
- D 1 - I - 0x0178B3 05:B8A3: 00        .byte $00   ; 
- D 1 - I - 0x0178B4 05:B8A4: 00        .byte $00   ; 
- D 1 - I - 0x0178B5 05:B8A5: 00        .byte $00   ; 
- D 1 - I - 0x0178B6 05:B8A6: 95        .byte $95   ; 
- D 1 - I - 0x0178B7 05:B8A7: 75        .byte $75   ; 
- D 1 - I - 0x0178B8 05:B8A8: 66        .byte $66   ; 
- D 1 - I - 0x0178B9 05:B8A9: 5F        .byte $5F   ; 
- D 1 - I - 0x0178BA 05:B8AA: DA        .byte $DA   ; 
- D 1 - I - 0x0178BB 05:B8AB: 70        .byte $70   ; 
- D 1 - I - 0x0178BC 05:B8AC: 66        .byte $66   ; 
- D 1 - I - 0x0178BD 05:B8AD: D9        .byte $D9   ; 
- D 1 - I - 0x0178BE 05:B8AE: DE        .byte $DE   ; 
- D 1 - I - 0x0178BF 05:B8AF: 6F        .byte $6F   ; 
- D 1 - I - 0x0178C0 05:B8B0: 94        .byte $94   ; 
- D 1 - I - 0x0178C1 05:B8B1: 69        .byte $69   ; 
- D 1 - I - 0x0178C2 05:B8B2: B1        .byte $B1   ; 
- D 1 - I - 0x0178C3 05:B8B3: 6D        .byte $6D   ; 
- D 1 - I - 0x0178C4 05:B8B4: 70        .byte $70   ; 
- D 1 - I - 0x0178C5 05:B8B5: 66        .byte $66   ; 
- D 1 - I - 0x0178C6 05:B8B6: 88        .byte $88   ; 
- D 1 - I - 0x0178C7 05:B8B7: 78        .byte $78   ; 
- D 1 - I - 0x0178C8 05:B8B8: 75        .byte $75   ; 
- D 1 - I - 0x0178C9 05:B8B9: 66        .byte $66   ; 
- D 1 - I - 0x0178CA 05:B8BA: 6B        .byte $6B   ; 
- D 1 - I - 0x0178CB 05:B8BB: 6D        .byte $6D   ; 
- D 1 - I - 0x0178CC 05:B8BC: 70        .byte $70   ; 
- D 1 - I - 0x0178CD 05:B8BD: 66        .byte $66   ; 
- D 1 - I - 0x0178CE 05:B8BE: 69        .byte $69   ; 
- D 1 - I - 0x0178CF 05:B8BF: 10        .byte $10   ; 
- D 1 - I - 0x0178D0 05:B8C0: 6E        .byte $6E   ; 
- D 1 - I - 0x0178D1 05:B8C1: 70        .byte $70   ; 
- D 1 - I - 0x0178D2 05:B8C2: 6B        .byte $6B   ; 
- D 1 - I - 0x0178D3 05:B8C3: 00        .byte $00   ; 
- D 1 - I - 0x0178D4 05:B8C4: 6C        .byte $6C   ; 
- D 1 - I - 0x0178D5 05:B8C5: 6F        .byte $6F   ; 
- D 1 - I - 0x0178D6 05:B8C6: 66        .byte $66   ; 
- D 1 - I - 0x0178D7 05:B8C7: 00        .byte $00   ; 
- D 1 - I - 0x0178D8 05:B8C8: 95        .byte $95   ; 
- D 1 - I - 0x0178D9 05:B8C9: 7C        .byte $7C   ; 
- D 1 - I - 0x0178DA 05:B8CA: AA        .byte $AA   ; 
- D 1 - I - 0x0178DB 05:B8CB: 00        .byte $00   ; 
- D 1 - I - 0x0178DC 05:B8CC: A9        .byte $A9   ; 
- D 1 - I - 0x0178DD 05:B8CD: A7        .byte $A7   ; 
- D 1 - I - 0x0178DE 05:B8CE: 7E        .byte $7E   ; 
- D 1 - I - 0x0178DF 05:B8CF: 77        .byte $77   ; 
- D 1 - I - 0x0178E0 05:B8D0: AA        .byte $AA   ; 
- D 1 - I - 0x0178E1 05:B8D1: 80        .byte $80   ; 
- D 1 - I - 0x0178E2 05:B8D2: A2        .byte $A2   ; 
- D 1 - I - 0x0178E3 05:B8D3: 10        .byte $10   ; 
- D 1 - I - 0x0178E4 05:B8D4: A4        .byte $A4   ; 
- D 1 - I - 0x0178E5 05:B8D5: AA        .byte $AA   ; 
- D 1 - I - 0x0178E6 05:B8D6: 7E        .byte $7E   ; 
- D 1 - I - 0x0178E7 05:B8D7: 00        .byte $00   ; 
- D 1 - I - 0x0178E8 05:B8D8: 6C        .byte $6C   ; 
- D 1 - I - 0x0178E9 05:B8D9: 7D        .byte $7D   ; 
- D 1 - I - 0x0178EA 05:B8DA: A2        .byte $A2   ; 
- D 1 - I - 0x0178EB 05:B8DB: 00        .byte $00   ; 
- D 1 - I - 0x0178EC 05:B8DC: 6C        .byte $6C   ; 
- D 1 - I - 0x0178ED 05:B8DD: 65        .byte $65   ; 
- D 1 - I - 0x0178EE 05:B8DE: 67        .byte $67   ; 
- D 1 - I - 0x0178EF 05:B8DF: 00        .byte $00   ; 
- D 1 - I - 0x0178F0 05:B8E0: 10        .byte $10   ; 
- D 1 - I - 0x0178F1 05:B8E1: 6E        .byte $6E   ; 
- D 1 - I - 0x0178F2 05:B8E2: 66        .byte $66   ; 
- D 1 - I - 0x0178F3 05:B8E3: 00        .byte $00   ; 
- D 1 - I - 0x0178F4 05:B8E4: 00        .byte $00   ; 
- D 1 - I - 0x0178F5 05:B8E5: 6D        .byte $6D   ; 
- D 1 - I - 0x0178F6 05:B8E6: 94        .byte $94   ; 
- D 1 - I - 0x0178F7 05:B8E7: 00        .byte $00   ; 
- D 1 - I - 0x0178F8 05:B8E8: 91        .byte $91   ; 
- D 1 - I - 0x0178F9 05:B8E9: 65        .byte $65   ; 
- D 1 - I - 0x0178FA 05:B8EA: 93        .byte $93   ; 
- D 1 - I - 0x0178FB 05:B8EB: 90        .byte $90   ; 
- D 1 - I - 0x0178FC 05:B8EC: 92        .byte $92   ; 
- D 1 - I - 0x0178FD 05:B8ED: 93        .byte $93   ; 
- D 1 - I - 0x0178FE 05:B8EE: 6B        .byte $6B   ; 
- D 1 - I - 0x0178FF 05:B8EF: 64        .byte $64   ; 
- D 1 - I - 0x017900 05:B8F0: 93        .byte $93   ; 
- D 1 - I - 0x017901 05:B8F1: 66        .byte $66   ; 
- D 1 - I - 0x017902 05:B8F2: 69        .byte $69   ; 
- D 1 - I - 0x017903 05:B8F3: 6F        .byte $6F   ; 
- D 1 - I - 0x017904 05:B8F4: 94        .byte $94   ; 
- D 1 - I - 0x017905 05:B8F5: 6B        .byte $6B   ; 
- D 1 - I - 0x017906 05:B8F6: 88        .byte $88   ; 
- D 1 - I - 0x017907 05:B8F7: 6D        .byte $6D   ; 
- D 1 - I - 0x017908 05:B8F8: 70        .byte $70   ; 
- D 1 - I - 0x017909 05:B8F9: 66        .byte $66   ; 
- D 1 - I - 0x01790A 05:B8FA: BC        .byte $BC   ; 
- D 1 - I - 0x01790B 05:B8FB: 65        .byte $65   ; 
- D 1 - I - 0x01790C 05:B8FC: 70        .byte $70   ; 
- D 1 - I - 0x01790D 05:B8FD: 6B        .byte $6B   ; 
- D 1 - I - 0x01790E 05:B8FE: 69        .byte $69   ; 
- - - - - - 0x01790F 05:B8FF: 00        .byte $00   ; 
- - - - - - 0x017910 05:B900: 00        .byte $00   ; 
- - - - - - 0x017911 05:B901: 00        .byte $00   ; 
- - - - - - 0x017912 05:B902: 00        .byte $00   ; 
- - - - - - 0x017913 05:B903: 00        .byte $00   ; 
- - - - - - 0x017914 05:B904: 00        .byte $00   ; 
- - - - - - 0x017915 05:B905: 00        .byte $00   ; 
- - - - - - 0x017916 05:B906: 00        .byte $00   ; 
- D 1 - I - 0x017917 05:B907: 6C        .byte $6C   ; 
- D 1 - I - 0x017918 05:B908: B0        .byte $B0   ; 
- D 1 - I - 0x017919 05:B909: 88        .byte $88   ; 
- D 1 - I - 0x01791A 05:B90A: BC        .byte $BC   ; 
- D 1 - I - 0x01791B 05:B90B: 69        .byte $69   ; 
- D 1 - I - 0x01791C 05:B90C: 69        .byte $69   ; 
- D 1 - I - 0x01791D 05:B90D: BE        .byte $BE   ; 
- D 1 - I - 0x01791E 05:B90E: AE        .byte $AE   ; 
- D 1 - I - 0x01791F 05:B90F: 69        .byte $69   ; 
- D 1 - I - 0x017920 05:B910: BC        .byte $BC   ; 
- D 1 - I - 0x017921 05:B911: 87        .byte $87   ; 
- D 1 - I - 0x017922 05:B912: C5        .byte $C5   ; 
- D 1 - I - 0x017923 05:B913: 95        .byte $95   ; 
- D 1 - I - 0x017924 05:B914: AC        .byte $AC   ; 
- D 1 - I - 0x017925 05:B915: C2        .byte $C2   ; 
- D 1 - I - 0x017926 05:B916: C4        .byte $C4   ; 
- D 1 - I - 0x017927 05:B917: 85        .byte $85   ; 
- D 1 - I - 0x017928 05:B918: D3        .byte $D3   ; 
- D 1 - I - 0x017929 05:B919: 5D        .byte $5D   ; 
- D 1 - I - 0x01792A 05:B91A: C6        .byte $C6   ; 
- D 1 - I - 0x01792B 05:B91B: D5        .byte $D5   ; 
- D 1 - I - 0x01792C 05:B91C: 62        .byte $62   ; 
- D 1 - I - 0x01792D 05:B91D: 5D        .byte $5D   ; 
- D 1 - I - 0x01792E 05:B91E: C6        .byte $C6   ; 
- D 1 - I - 0x01792F 05:B91F: 60        .byte $60   ; 
- D 1 - I - 0x017930 05:B920: B3        .byte $B3   ; 
- D 1 - I - 0x017931 05:B921: 5D        .byte $5D   ; 
- D 1 - I - 0x017932 05:B922: C6        .byte $C6   ; 
- D 1 - I - 0x017933 05:B923: 6B        .byte $6B   ; 
- D 1 - I - 0x017934 05:B924: 8B        .byte $8B   ; 
- D 1 - I - 0x017935 05:B925: C3        .byte $C3   ; 
- D 1 - I - 0x017936 05:B926: C7        .byte $C7   ; 
- D 1 - I - 0x017937 05:B927: 69        .byte $69   ; 
- D 1 - I - 0x017938 05:B928: B0        .byte $B0   ; 
- D 1 - I - 0x017939 05:B929: 88        .byte $88   ; 
- D 1 - I - 0x01793A 05:B92A: C8        .byte $C8   ; 
- D 1 - I - 0x01793B 05:B92B: B0        .byte $B0   ; 
- D 1 - I - 0x01793C 05:B92C: 88        .byte $88   ; 
- D 1 - I - 0x01793D 05:B92D: BE        .byte $BE   ; 
- D 1 - I - 0x01793E 05:B92E: AF        .byte $AF   ; 
- D 1 - I - 0x01793F 05:B92F: 88        .byte $88   ; 
- D 1 - I - 0x017940 05:B930: BC        .byte $BC   ; 
- D 1 - I - 0x017941 05:B931: 50        .byte $50   ; 
- D 1 - I - 0x017942 05:B932: 00        .byte $00   ; 
- D 1 - I - 0x017943 05:B933: BE        .byte $BE   ; 
- D 1 - I - 0x017944 05:B934: 83        .byte $83   ; 
- D 1 - I - 0x017945 05:B935: DF        .byte $DF   ; 
- D 1 - I - 0x017946 05:B936: 5B        .byte $5B   ; 
- D 1 - I - 0x017947 05:B937: 00        .byte $00   ; 
- D 1 - I - 0x017948 05:B938: 00        .byte $00   ; 
- D 1 - I - 0x017949 05:B939: 6D        .byte $6D   ; 
- D 1 - I - 0x01794A 05:B93A: 94        .byte $94   ; 
- D 1 - I - 0x01794B 05:B93B: 00        .byte $00   ; 
- D 1 - I - 0x01794C 05:B93C: 00        .byte $00   ; 
- D 1 - I - 0x01794D 05:B93D: 10        .byte $10   ; 
- D 1 - I - 0x01794E 05:B93E: 6E        .byte $6E   ; 
- D 1 - I - 0x01794F 05:B93F: 00        .byte $00   ; 
- D 1 - I - 0x017950 05:B940: 00        .byte $00   ; 
- D 1 - I - 0x017951 05:B941: 00        .byte $00   ; 
- D 1 - I - 0x017952 05:B942: 97        .byte $97   ; 
- D 1 - I - 0x017953 05:B943: 00        .byte $00   ; 
- D 1 - I - 0x017954 05:B944: 00        .byte $00   ; 
- D 1 - I - 0x017955 05:B945: 00        .byte $00   ; 
- D 1 - I - 0x017956 05:B946: 00        .byte $00   ; 
- D 1 - I - 0x017957 05:B947: 5E        .byte $5E   ; 
- D 1 - I - 0x017958 05:B948: D3        .byte $D3   ; 
- D 1 - I - 0x017959 05:B949: 8B        .byte $8B   ; 
- D 1 - I - 0x01795A 05:B94A: B0        .byte $B0   ; 
- D 1 - I - 0x01795B 05:B94B: D5        .byte $D5   ; 
- D 1 - I - 0x01795C 05:B94C: 62        .byte $62   ; 
- D 1 - I - 0x01795D 05:B94D: B0        .byte $B0   ; 
- D 1 - I - 0x01795E 05:B94E: 88        .byte $88   ; 
- D 1 - I - 0x01795F 05:B94F: 5E        .byte $5E   ; 
- D 1 - I - 0x017960 05:B950: B0        .byte $B0   ; 
- D 1 - I - 0x017961 05:B951: 88        .byte $88   ; 
- D 1 - I - 0x017962 05:B952: BC        .byte $BC   ; 
- D 1 - I - 0x017963 05:B953: CE        .byte $CE   ; 
- D 1 - I - 0x017964 05:B954: 88        .byte $88   ; 
- D 1 - I - 0x017965 05:B955: BE        .byte $BE   ; 
- D 1 - I - 0x017966 05:B956: AE        .byte $AE   ; 
- D 1 - I - 0x017967 05:B957: 88        .byte $88   ; 
- D 1 - I - 0x017968 05:B958: BC        .byte $BC   ; 
- D 1 - I - 0x017969 05:B959: 84        .byte $84   ; 
- D 1 - I - 0x01796A 05:B95A: E1        .byte $E1   ; 
- D 1 - I - 0x01796B 05:B95B: BD        .byte $BD   ; 
- D 1 - I - 0x01796C 05:B95C: AD        .byte $AD   ; 
- D 1 - I - 0x01796D 05:B95D: E2        .byte $E2   ; 
- D 1 - I - 0x01796E 05:B95E: E3        .byte $E3   ; 
- D 1 - I - 0x01796F 05:B95F: 86        .byte $86   ; 
- D 1 - I - 0x017970 05:B960: C9        .byte $C9   ; 
- D 1 - I - 0x017971 05:B961: 8A        .byte $8A   ; 
- D 1 - I - 0x017972 05:B962: BA        .byte $BA   ; 
- D 1 - I - 0x017973 05:B963: CA        .byte $CA   ; 
- D 1 - I - 0x017974 05:B964: CB        .byte $CB   ; 
- D 1 - I - 0x017975 05:B965: CC        .byte $CC   ; 
- D 1 - I - 0x017976 05:B966: CD        .byte $CD   ; 
- D 1 - I - 0x017977 05:B967: 6A        .byte $6A   ; 
- D 1 - I - 0x017978 05:B968: BC        .byte $BC   ; 
- D 1 - I - 0x017979 05:B969: 87        .byte $87   ; 
- D 1 - I - 0x01797A 05:B96A: C5        .byte $C5   ; 
- D 1 - I - 0x01797B 05:B96B: 69        .byte $69   ; 
- D 1 - I - 0x01797C 05:B96C: AC        .byte $AC   ; 
- D 1 - I - 0x01797D 05:B96D: C2        .byte $C2   ; 
- D 1 - I - 0x01797E 05:B96E: C4        .byte $C4   ; 
- D 1 - I - 0x01797F 05:B96F: 7E        .byte $7E   ; 
- D 1 - I - 0x017980 05:B970: 9B        .byte $9B   ; 
- D 1 - I - 0x017981 05:B971: 5D        .byte $5D   ; 
- D 1 - I - 0x017982 05:B972: C6        .byte $C6   ; 
- D 1 - I - 0x017983 05:B973: A2        .byte $A2   ; 
- D 1 - I - 0x017984 05:B974: 5B        .byte $5B   ; 
- D 1 - I - 0x017985 05:B975: 5D        .byte $5D   ; 
- D 1 - I - 0x017986 05:B976: C6        .byte $C6   ; 
- D 1 - I - 0x017987 05:B977: 5B        .byte $5B   ; 
- D 1 - I - 0x017988 05:B978: CF        .byte $CF   ; 
- D 1 - I - 0x017989 05:B979: 8B        .byte $8B   ; 
- D 1 - I - 0x01798A 05:B97A: D0        .byte $D0   ; 
- D 1 - I - 0x01798B 05:B97B: B8        .byte $B8   ; 
- D 1 - I - 0x01798C 05:B97C: D1        .byte $D1   ; 
- D 1 - I - 0x01798D 05:B97D: B0        .byte $B0   ; 
- D 1 - I - 0x01798E 05:B97E: C0        .byte $C0   ; 
- D 1 - I - 0x01798F 05:B97F: 8B        .byte $8B   ; 
- D 1 - I - 0x017990 05:B980: D2        .byte $D2   ; 
- D 1 - I - 0x017991 05:B981: 88        .byte $88   ; 
- D 1 - I - 0x017992 05:B982: BC        .byte $BC   ; 
- D 1 - I - 0x017993 05:B983: B0        .byte $B0   ; 
- D 1 - I - 0x017994 05:B984: C1        .byte $C1   ; 
- D 1 - I - 0x017995 05:B985: BE        .byte $BE   ; 
- D 1 - I - 0x017996 05:B986: 50        .byte $50   ; 
- D 1 - I - 0x017997 05:B987: 88        .byte $88   ; 
- D 1 - I - 0x017998 05:B988: BC        .byte $BC   ; 
- D 1 - I - 0x017999 05:B989: 87        .byte $87   ; 
- D 1 - I - 0x01799A 05:B98A: C5        .byte $C5   ; 
- D 1 - I - 0x01799B 05:B98B: BE        .byte $BE   ; 
- D 1 - I - 0x01799C 05:B98C: AC        .byte $AC   ; 
- D 1 - I - 0x01799D 05:B98D: C2        .byte $C2   ; 
- D 1 - I - 0x01799E 05:B98E: C4        .byte $C4   ; 
- D 1 - I - 0x01799F 05:B98F: 85        .byte $85   ; 
- D 1 - I - 0x0179A0 05:B990: D3        .byte $D3   ; 
- D 1 - I - 0x0179A1 05:B991: 5D        .byte $5D   ; 
- D 1 - I - 0x0179A2 05:B992: C6        .byte $C6   ; 
- D 1 - I - 0x0179A3 05:B993: D5        .byte $D5   ; 
- D 1 - I - 0x0179A4 05:B994: 62        .byte $62   ; 
- D 1 - I - 0x0179A5 05:B995: 5D        .byte $5D   ; 
- D 1 - I - 0x0179A6 05:B996: C6        .byte $C6   ; 
- D 1 - I - 0x0179A7 05:B997: 69        .byte $69   ; 
- D 1 - I - 0x0179A8 05:B998: B3        .byte $B3   ; 
- D 1 - I - 0x0179A9 05:B999: 5D        .byte $5D   ; 
- D 1 - I - 0x0179AA 05:B99A: C6        .byte $C6   ; 
- D 1 - I - 0x0179AB 05:B99B: B9        .byte $B9   ; 
- D 1 - I - 0x0179AC 05:B99C: 8B        .byte $8B   ; 
- D 1 - I - 0x0179AD 05:B99D: C3        .byte $C3   ; 
- D 1 - I - 0x0179AE 05:B99E: C7        .byte $C7   ; 
- D 1 - I - 0x0179AF 05:B99F: 69        .byte $69   ; 
- D 1 - I - 0x0179B0 05:B9A0: B0        .byte $B0   ; 
- D 1 - I - 0x0179B1 05:B9A1: 88        .byte $88   ; 
- D 1 - I - 0x0179B2 05:B9A2: C8        .byte $C8   ; 
- D 1 - I - 0x0179B3 05:B9A3: 6B        .byte $6B   ; 
- D 1 - I - 0x0179B4 05:B9A4: 69        .byte $69   ; 
- D 1 - I - 0x0179B5 05:B9A5: BE        .byte $BE   ; 
- D 1 - I - 0x0179B6 05:B9A6: AF        .byte $AF   ; 
- D 1 - I - 0x0179B7 05:B9A7: 88        .byte $88   ; 
- D 1 - I - 0x0179B8 05:B9A8: BC        .byte $BC   ; 
- D 1 - I - 0x0179B9 05:B9A9: 51        .byte $51   ; 
- D 1 - I - 0x0179BA 05:B9AA: D6        .byte $D6   ; 
- D 1 - I - 0x0179BB 05:B9AB: BD        .byte $BD   ; 
- D 1 - I - 0x0179BC 05:B9AC: 50        .byte $50   ; 
- D 1 - I - 0x0179BD 05:B9AD: D7        .byte $D7   ; 
- D 1 - I - 0x0179BE 05:B9AE: D8        .byte $D8   ; 
- D 1 - I - 0x0179BF 05:B9AF: 50        .byte $50   ; 
- D 1 - I - 0x0179C0 05:B9B0: 5B        .byte $5B   ; 
- D 1 - I - 0x0179C1 05:B9B1: 5F        .byte $5F   ; 
- D 1 - I - 0x0179C2 05:B9B2: DA        .byte $DA   ; 
- D 1 - I - 0x0179C3 05:B9B3: 5B        .byte $5B   ; 
- D 1 - I - 0x0179C4 05:B9B4: 68        .byte $68   ; 
- D 1 - I - 0x0179C5 05:B9B5: 67        .byte $67   ; 
- D 1 - I - 0x0179C6 05:B9B6: 69        .byte $69   ; 
- D 1 - I - 0x0179C7 05:B9B7: 60        .byte $60   ; 
- D 1 - I - 0x0179C8 05:B9B8: B3        .byte $B3   ; 
- D 1 - I - 0x0179C9 05:B9B9: 5D        .byte $5D   ; 
- D 1 - I - 0x0179CA 05:B9BA: C6        .byte $C6   ; 
- D 1 - I - 0x0179CB 05:B9BB: B9        .byte $B9   ; 
- D 1 - I - 0x0179CC 05:B9BC: 8B        .byte $8B   ; 
- D 1 - I - 0x0179CD 05:B9BD: C3        .byte $C3   ; 
- D 1 - I - 0x0179CE 05:B9BE: C7        .byte $C7   ; 
- D 1 - I - 0x0179CF 05:B9BF: 8B        .byte $8B   ; 
- D 1 - I - 0x0179D0 05:B9C0: B0        .byte $B0   ; 
- D 1 - I - 0x0179D1 05:B9C1: 88        .byte $88   ; 
- D 1 - I - 0x0179D2 05:B9C2: C8        .byte $C8   ; 
- D 1 - I - 0x0179D3 05:B9C3: E8        .byte $E8   ; 
- D 1 - I - 0x0179D4 05:B9C4: E9        .byte $E9   ; 
- D 1 - I - 0x0179D5 05:B9C5: BF        .byte $BF   ; 
- D 1 - I - 0x0179D6 05:B9C6: AF        .byte $AF   ; 
- D 1 - I - 0x0179D7 05:B9C7: 67        .byte $67   ; 
- D 1 - I - 0x0179D8 05:B9C8: 66        .byte $66   ; 
- D 1 - I - 0x0179D9 05:B9C9: 66        .byte $66   ; 
- D 1 - I - 0x0179DA 05:B9CA: 66        .byte $66   ; 
- D 1 - I - 0x0179DB 05:B9CB: 71        .byte $71   ; 
- D 1 - I - 0x0179DC 05:B9CC: 71        .byte $71   ; 
- D 1 - I - 0x0179DD 05:B9CD: 99        .byte $99   ; 
- D 1 - I - 0x0179DE 05:B9CE: 98        .byte $98   ; 
- D 1 - I - 0x0179DF 05:B9CF: 7A        .byte $7A   ; 
- D 1 - I - 0x0179E0 05:B9D0: 13        .byte $13   ; 
- D 1 - I - 0x0179E1 05:B9D1: 13        .byte $13   ; 
- D 1 - I - 0x0179E2 05:B9D2: 9B        .byte $9B   ; 
- D 1 - I - 0x0179E3 05:B9D3: 11        .byte $11   ; 
- D 1 - I - 0x0179E4 05:B9D4: 00        .byte $00   ; 
- D 1 - I - 0x0179E5 05:B9D5: 00        .byte $00   ; 
- D 1 - I - 0x0179E6 05:B9D6: 00        .byte $00   ; 
- D 1 - I - 0x0179E7 05:B9D7: 88        .byte $88   ; 
- D 1 - I - 0x0179E8 05:B9D8: BC        .byte $BC   ; 
- D 1 - I - 0x0179E9 05:B9D9: 6A        .byte $6A   ; 
- D 1 - I - 0x0179EA 05:B9DA: 67        .byte $67   ; 
- D 1 - I - 0x0179EB 05:B9DB: BE        .byte $BE   ; 
- D 1 - I - 0x0179EC 05:B9DC: 6A        .byte $6A   ; 
- D 1 - I - 0x0179ED 05:B9DD: 66        .byte $66   ; 
- D 1 - I - 0x0179EE 05:B9DE: 66        .byte $66   ; 
- D 1 - I - 0x0179EF 05:B9DF: 6A        .byte $6A   ; 
- D 1 - I - 0x0179F0 05:B9E0: 67        .byte $67   ; 
- D 1 - I - 0x0179F1 05:B9E1: 74        .byte $74   ; 
- D 1 - I - 0x0179F2 05:B9E2: 71        .byte $71   ; 
- D 1 - I - 0x0179F3 05:B9E3: 66        .byte $66   ; 
- D 1 - I - 0x0179F4 05:B9E4: 71        .byte $71   ; 
- D 1 - I - 0x0179F5 05:B9E5: A0        .byte $A0   ; 
- D 1 - I - 0x0179F6 05:B9E6: 9D        .byte $9D   ; 
- D 1 - I - 0x0179F7 05:B9E7: 88        .byte $88   ; 
- D 1 - I - 0x0179F8 05:B9E8: BC        .byte $BC   ; 
- D 1 - I - 0x0179F9 05:B9E9: 68        .byte $68   ; 
- D 1 - I - 0x0179FA 05:B9EA: 6A        .byte $6A   ; 
- D 1 - I - 0x0179FB 05:B9EB: BE        .byte $BE   ; 
- D 1 - I - 0x0179FC 05:B9EC: 69        .byte $69   ; 
- D 1 - I - 0x0179FD 05:B9ED: 6A        .byte $6A   ; 
- D 1 - I - 0x0179FE 05:B9EE: 71        .byte $71   ; 
- D 1 - I - 0x0179FF 05:B9EF: 85        .byte $85   ; 
- D 1 - I - 0x017A00 05:B9F0: D3        .byte $D3   ; 
- D 1 - I - 0x017A01 05:B9F1: 66        .byte $66   ; 
- D 1 - I - 0x017A02 05:B9F2: 71        .byte $71   ; 
- D 1 - I - 0x017A03 05:B9F3: D5        .byte $D5   ; 
- D 1 - I - 0x017A04 05:B9F4: 6A        .byte $6A   ; 
- D 1 - I - 0x017A05 05:B9F5: 71        .byte $71   ; 
- D 1 - I - 0x017A06 05:B9F6: 7B        .byte $7B   ; 
- D 1 - I - 0x017A07 05:B9F7: 71        .byte $71   ; 
- D 1 - I - 0x017A08 05:B9F8: A0        .byte $A0   ; 
- D 1 - I - 0x017A09 05:B9F9: 13        .byte $13   ; 
- D 1 - I - 0x017A0A 05:B9FA: 00        .byte $00   ; 
- D 1 - I - 0x017A0B 05:B9FB: 9D        .byte $9D   ; 
- D 1 - I - 0x017A0C 05:B9FC: 11        .byte $11   ; 
- D 1 - I - 0x017A0D 05:B9FD: 00        .byte $00   ; 
- D 1 - I - 0x017A0E 05:B9FE: 00        .byte $00   ; 
- D 1 - I - 0x017A0F 05:B9FF: 11        .byte $11   ; 
- D 1 - I - 0x017A10 05:BA00: 00        .byte $00   ; 
- D 1 - I - 0x017A11 05:BA01: 00        .byte $00   ; 
- D 1 - I - 0x017A12 05:BA02: 00        .byte $00   ; 
- D 1 - I - 0x017A13 05:BA03: 00        .byte $00   ; 
- D 1 - I - 0x017A14 05:BA04: 00        .byte $00   ; 
- D 1 - I - 0x017A15 05:BA05: 00        .byte $00   ; 
- D 1 - I - 0x017A16 05:BA06: 00        .byte $00   ; 
- D 1 - I - 0x017A17 05:BA07: 60        .byte $60   ; 
- D 1 - I - 0x017A18 05:BA08: 6A        .byte $6A   ; 
- D 1 - I - 0x017A19 05:BA09: 76        .byte $76   ; 
- D 1 - I - 0x017A1A 05:BA0A: A1        .byte $A1   ; 
- D 1 - I - 0x017A1B 05:BA0B: B9        .byte $B9   ; 
- D 1 - I - 0x017A1C 05:BA0C: 66        .byte $66   ; 
- D 1 - I - 0x017A1D 05:BA0D: 71        .byte $71   ; 
- D 1 - I - 0x017A1E 05:BA0E: 96        .byte $96   ; 
- D 1 - I - 0x017A1F 05:BA0F: 6A        .byte $6A   ; 
- D 1 - I - 0x017A20 05:BA10: 71        .byte $71   ; 
- D 1 - I - 0x017A21 05:BA11: 7B        .byte $7B   ; 
- D 1 - I - 0x017A22 05:BA12: A1        .byte $A1   ; 
- D 1 - I - 0x017A23 05:BA13: 66        .byte $66   ; 
- D 1 - I - 0x017A24 05:BA14: 71        .byte $71   ; 
- D 1 - I - 0x017A25 05:BA15: A0        .byte $A0   ; 
- D 1 - I - 0x017A26 05:BA16: 79        .byte $79   ; 
- D 1 - I - 0x017A27 05:BA17: 67        .byte $67   ; 
- D 1 - I - 0x017A28 05:BA18: 68        .byte $68   ; 
- D 1 - I - 0x017A29 05:BA19: 66        .byte $66   ; 
- D 1 - I - 0x017A2A 05:BA1A: 69        .byte $69   ; 
- D 1 - I - 0x017A2B 05:BA1B: 9A        .byte $9A   ; 
- D 1 - I - 0x017A2C 05:BA1C: 98        .byte $98   ; 
- D 1 - I - 0x017A2D 05:BA1D: 9A        .byte $9A   ; 
- D 1 - I - 0x017A2E 05:BA1E: 9D        .byte $9D   ; 
- D 1 - I - 0x017A2F 05:BA1F: 13        .byte $13   ; 
- D 1 - I - 0x017A30 05:BA20: 9B        .byte $9B   ; 
- D 1 - I - 0x017A31 05:BA21: 13        .byte $13   ; 
- D 1 - I - 0x017A32 05:BA22: 11        .byte $11   ; 
- D 1 - I - 0x017A33 05:BA23: 00        .byte $00   ; 
- D 1 - I - 0x017A34 05:BA24: 00        .byte $00   ; 
- D 1 - I - 0x017A35 05:BA25: 00        .byte $00   ; 
- D 1 - I - 0x017A36 05:BA26: 00        .byte $00   ; 
- D 1 - I - 0x017A37 05:BA27: 79        .byte $79   ; 
- D 1 - I - 0x017A38 05:BA28: A3        .byte $A3   ; 
- D 1 - I - 0x017A39 05:BA29: 7F        .byte $7F   ; 
- D 1 - I - 0x017A3A 05:BA2A: A3        .byte $A3   ; 
- D 1 - I - 0x017A3B 05:BA2B: 9E        .byte $9E   ; 
- D 1 - I - 0x017A3C 05:BA2C: 81        .byte $81   ; 
- D 1 - I - 0x017A3D 05:BA2D: A6        .byte $A6   ; 
- D 1 - I - 0x017A3E 05:BA2E: 81        .byte $81   ; 
- D 1 - I - 0x017A3F 05:BA2F: 00        .byte $00   ; 
- D 1 - I - 0x017A40 05:BA30: A8        .byte $A8   ; 
- D 1 - I - 0x017A41 05:BA31: 81        .byte $81   ; 
- D 1 - I - 0x017A42 05:BA32: A5        .byte $A5   ; 
- D 1 - I - 0x017A43 05:BA33: 00        .byte $00   ; 
- D 1 - I - 0x017A44 05:BA34: 00        .byte $00   ; 
- D 1 - I - 0x017A45 05:BA35: 9F        .byte $9F   ; 
- D 1 - I - 0x017A46 05:BA36: 11        .byte $11   ; 
- D 1 - I - 0x017A47 05:BA37: 7F        .byte $7F   ; 
- D 1 - I - 0x017A48 05:BA38: 67        .byte $67   ; 
- D 1 - I - 0x017A49 05:BA39: 66        .byte $66   ; 
- D 1 - I - 0x017A4A 05:BA3A: 74        .byte $74   ; 
- D 1 - I - 0x017A4B 05:BA3B: A3        .byte $A3   ; 
- D 1 - I - 0x017A4C 05:BA3C: 9D        .byte $9D   ; 
- D 1 - I - 0x017A4D 05:BA3D: 98        .byte $98   ; 
- D 1 - I - 0x017A4E 05:BA3E: 9F        .byte $9F   ; 
- D 1 - I - 0x017A4F 05:BA3F: 13        .byte $13   ; 
- D 1 - I - 0x017A50 05:BA40: 14        .byte $14   ; 
- D 1 - I - 0x017A51 05:BA41: 14        .byte $14   ; 
- D 1 - I - 0x017A52 05:BA42: 11        .byte $11   ; 
- D 1 - I - 0x017A53 05:BA43: 00        .byte $00   ; 
- D 1 - I - 0x017A54 05:BA44: 00        .byte $00   ; 
- D 1 - I - 0x017A55 05:BA45: 00        .byte $00   ; 
- D 1 - I - 0x017A56 05:BA46: 00        .byte $00   ; 
- D 1 - I - 0x017A57 05:BA47: 88        .byte $88   ; 
- D 1 - I - 0x017A58 05:BA48: 69        .byte $69   ; 
- D 1 - I - 0x017A59 05:BA49: 6B        .byte $6B   ; 
- D 1 - I - 0x017A5A 05:BA4A: 69        .byte $69   ; 
- D 1 - I - 0x017A5B 05:BA4B: 67        .byte $67   ; 
- D 1 - I - 0x017A5C 05:BA4C: 66        .byte $66   ; 
- D 1 - I - 0x017A5D 05:BA4D: 66        .byte $66   ; 
- D 1 - I - 0x017A5E 05:BA4E: 66        .byte $66   ; 
- D 1 - I - 0x017A5F 05:BA4F: 71        .byte $71   ; 
- D 1 - I - 0x017A60 05:BA50: 70        .byte $70   ; 
- D 1 - I - 0x017A61 05:BA51: 74        .byte $74   ; 
- D 1 - I - 0x017A62 05:BA52: 71        .byte $71   ; 
- D 1 - I - 0x017A63 05:BA53: 9D        .byte $9D   ; 
- D 1 - I - 0x017A64 05:BA54: 9C        .byte $9C   ; 
- D 1 - I - 0x017A65 05:BA55: 9F        .byte $9F   ; 
- D 1 - I - 0x017A66 05:BA56: 9F        .byte $9F   ; 
- D 1 - I - 0x017A67 05:BA57: 00        .byte $00   ; 
- D 1 - I - 0x017A68 05:BA58: 00        .byte $00   ; 
- D 1 - I - 0x017A69 05:BA59: 63        .byte $63   ; 
- D 1 - I - 0x017A6A 05:BA5A: 91        .byte $91   ; 
- D 1 - I - 0x017A6B 05:BA5B: 00        .byte $00   ; 
- D 1 - I - 0x017A6C 05:BA5C: 00        .byte $00   ; 
- D 1 - I - 0x017A6D 05:BA5D: 90        .byte $90   ; 
- D 1 - I - 0x017A6E 05:BA5E: 92        .byte $92   ; 
- D 1 - I - 0x017A6F 05:BA5F: 00        .byte $00   ; 
- D 1 - I - 0x017A70 05:BA60: 00        .byte $00   ; 
- D 1 - I - 0x017A71 05:BA61: 64        .byte $64   ; 
- D 1 - I - 0x017A72 05:BA62: 93        .byte $93   ; 
- D 1 - I - 0x017A73 05:BA63: 00        .byte $00   ; 
- D 1 - I - 0x017A74 05:BA64: 00        .byte $00   ; 
- D 1 - I - 0x017A75 05:BA65: 6F        .byte $6F   ; 
- D 1 - I - 0x017A76 05:BA66: 94        .byte $94   ; 
- D 1 - I - 0x017A77 05:BA67: 00        .byte $00   ; 
- D 1 - I - 0x017A78 05:BA68: 00        .byte $00   ; 
- D 1 - I - 0x017A79 05:BA69: 7C        .byte $7C   ; 
- D 1 - I - 0x017A7A 05:BA6A: AA        .byte $AA   ; 
- D 1 - I - 0x017A7B 05:BA6B: 00        .byte $00   ; 
- D 1 - I - 0x017A7C 05:BA6C: A9        .byte $A9   ; 
- D 1 - I - 0x017A7D 05:BA6D: A7        .byte $A7   ; 
- D 1 - I - 0x017A7E 05:BA6E: 7E        .byte $7E   ; 
- D 1 - I - 0x017A7F 05:BA6F: 77        .byte $77   ; 
- D 1 - I - 0x017A80 05:BA70: AA        .byte $AA   ; 
- D 1 - I - 0x017A81 05:BA71: 80        .byte $80   ; 
- D 1 - I - 0x017A82 05:BA72: A2        .byte $A2   ; 
- D 1 - I - 0x017A83 05:BA73: 10        .byte $10   ; 
- D 1 - I - 0x017A84 05:BA74: A4        .byte $A4   ; 
- D 1 - I - 0x017A85 05:BA75: AA        .byte $AA   ; 
- D 1 - I - 0x017A86 05:BA76: 7E        .byte $7E   ; 
- D 1 - I - 0x017A87 05:BA77: 8B        .byte $8B   ; 
- D 1 - I - 0x017A88 05:BA78: B0        .byte $B0   ; 
- D 1 - I - 0x017A89 05:BA79: 88        .byte $88   ; 
- D 1 - I - 0x017A8A 05:BA7A: C8        .byte $C8   ; 
- D 1 - I - 0x017A8B 05:BA7B: B0        .byte $B0   ; 
- D 1 - I - 0x017A8C 05:BA7C: 88        .byte $88   ; 
- D 1 - I - 0x017A8D 05:BA7D: BE        .byte $BE   ; 
- D 1 - I - 0x017A8E 05:BA7E: AF        .byte $AF   ; 
- D 1 - I - 0x017A8F 05:BA7F: 88        .byte $88   ; 
- D 1 - I - 0x017A90 05:BA80: BC        .byte $BC   ; 
- D 1 - I - 0x017A91 05:BA81: 87        .byte $87   ; 
- D 1 - I - 0x017A92 05:BA82: C5        .byte $C5   ; 
- D 1 - I - 0x017A93 05:BA83: BE        .byte $BE   ; 
- D 1 - I - 0x017A94 05:BA84: 83        .byte $83   ; 
- D 1 - I - 0x017A95 05:BA85: C2        .byte $C2   ; 
- D 1 - I - 0x017A96 05:BA86: C4        .byte $C4   ; 
- D 1 - I - 0x017A97 05:BA87: 85        .byte $85   ; 
- D 1 - I - 0x017A98 05:BA88: D3        .byte $D3   ; 
- D 1 - I - 0x017A99 05:BA89: 5D        .byte $5D   ; 
- D 1 - I - 0x017A9A 05:BA8A: C6        .byte $C6   ; 
- D 1 - I - 0x017A9B 05:BA8B: D5        .byte $D5   ; 
- D 1 - I - 0x017A9C 05:BA8C: 62        .byte $62   ; 
- D 1 - I - 0x017A9D 05:BA8D: 5D        .byte $5D   ; 
- D 1 - I - 0x017A9E 05:BA8E: C6        .byte $C6   ; 
- D 1 - I - 0x017A9F 05:BA8F: 5E        .byte $5E   ; 
- D 1 - I - 0x017AA0 05:BA90: D4        .byte $D4   ; 
- D 1 - I - 0x017AA1 05:BA91: 5D        .byte $5D   ; 
- D 1 - I - 0x017AA2 05:BA92: C6        .byte $C6   ; 
- D 1 - I - 0x017AA3 05:BA93: D5        .byte $D5   ; 
- D 1 - I - 0x017AA4 05:BA94: 62        .byte $62   ; 
- D 1 - I - 0x017AA5 05:BA95: C3        .byte $C3   ; 
- D 1 - I - 0x017AA6 05:BA96: C7        .byte $C7   ; 
- D 1 - I - 0x017AA7 05:BA97: 8B        .byte $8B   ; 
- D 1 - I - 0x017AA8 05:BA98: B0        .byte $B0   ; 
- D 1 - I - 0x017AA9 05:BA99: 88        .byte $88   ; 
- D 1 - I - 0x017AAA 05:BA9A: BC        .byte $BC   ; 
- D 1 - I - 0x017AAB 05:BA9B: B2        .byte $B2   ; 
- D 1 - I - 0x017AAC 05:BA9C: 88        .byte $88   ; 
- D 1 - I - 0x017AAD 05:BA9D: BE        .byte $BE   ; 
- D 1 - I - 0x017AAE 05:BA9E: 82        .byte $82   ; 
- D 1 - I - 0x017AAF 05:BA9F: 88        .byte $88   ; 
- D 1 - I - 0x017AB0 05:BAA0: BC        .byte $BC   ; 
- D 1 - I - 0x017AB1 05:BAA1: 82        .byte $82   ; 
- D 1 - I - 0x017AB2 05:BAA2: E1        .byte $E1   ; 
- D 1 - I - 0x017AB3 05:BAA3: BF        .byte $BF   ; 
- D 1 - I - 0x017AB4 05:BAA4: 50        .byte $50   ; 
- D 1 - I - 0x017AB5 05:BAA5: 00        .byte $00   ; 
- D 1 - I - 0x017AB6 05:BAA6: 00        .byte $00   ; 
- D 1 - I - 0x017AB7 05:BAA7: 5B        .byte $5B   ; 
- D 1 - I - 0x017AB8 05:BAA8: B8        .byte $B8   ; 
- D 1 - I - 0x017AB9 05:BAA9: 8C        .byte $8C   ; 
- D 1 - I - 0x017ABA 05:BAAA: B1        .byte $B1   ; 
- D 1 - I - 0x017ABB 05:BAAB: B8        .byte $B8   ; 
- D 1 - I - 0x017ABC 05:BAAC: 8B        .byte $8B   ; 
- D 1 - I - 0x017ABD 05:BAAD: B0        .byte $B0   ; 
- D 1 - I - 0x017ABE 05:BAAE: 88        .byte $88   ; 
- D 1 - I - 0x017ABF 05:BAAF: 8B        .byte $8B   ; 
- D 1 - I - 0x017AC0 05:BAB0: B0        .byte $B0   ; 
- D 1 - I - 0x017AC1 05:BAB1: 88        .byte $88   ; 
- D 1 - I - 0x017AC2 05:BAB2: BC        .byte $BC   ; 
- D 1 - I - 0x017AC3 05:BAB3: B0        .byte $B0   ; 
- D 1 - I - 0x017AC4 05:BAB4: 88        .byte $88   ; 
- D 1 - I - 0x017AC5 05:BAB5: BE        .byte $BE   ; 
- D 1 - I - 0x017AC6 05:BAB6: 82        .byte $82   ; 
- D 1 - I - 0x017AC7 05:BAB7: 88        .byte $88   ; 
- D 1 - I - 0x017AC8 05:BAB8: BC        .byte $BC   ; 
- D 1 - I - 0x017AC9 05:BAB9: 50        .byte $50   ; 
- D 1 - I - 0x017ACA 05:BABA: 00        .byte $00   ; 
- D 1 - I - 0x017ACB 05:BABB: BE        .byte $BE   ; 
- D 1 - I - 0x017ACC 05:BABC: 83        .byte $83   ; 
- D 1 - I - 0x017ACD 05:BABD: DF        .byte $DF   ; 
- D 1 - I - 0x017ACE 05:BABE: 5B        .byte $5B   ; 
- D 1 - I - 0x017ACF 05:BABF: 85        .byte $85   ; 
- D 1 - I - 0x017AD0 05:BAC0: D3        .byte $D3   ; 
- D 1 - I - 0x017AD1 05:BAC1: 61        .byte $61   ; 
- D 1 - I - 0x017AD2 05:BAC2: B8        .byte $B8   ; 
- D 1 - I - 0x017AD3 05:BAC3: D5        .byte $D5   ; 
- D 1 - I - 0x017AD4 05:BAC4: 62        .byte $62   ; 
- D 1 - I - 0x017AD5 05:BAC5: E0        .byte $E0   ; 
- D 1 - I - 0x017AD6 05:BAC6: 8B        .byte $8B   ; 
- D 1 - I - 0x017AD7 05:BAC7: 88        .byte $88   ; 
- D 1 - I - 0x017AD8 05:BAC8: BC        .byte $BC   ; 
- D 1 - I - 0x017AD9 05:BAC9: 84        .byte $84   ; 
- D 1 - I - 0x017ADA 05:BACA: E1        .byte $E1   ; 
- D 1 - I - 0x017ADB 05:BACB: BE        .byte $BE   ; 
- D 1 - I - 0x017ADC 05:BACC: AD        .byte $AD   ; 
- D 1 - I - 0x017ADD 05:BACD: E2        .byte $E2   ; 
- D 1 - I - 0x017ADE 05:BACE: E3        .byte $E3   ; 
- D 1 - I - 0x017ADF 05:BACF: 86        .byte $86   ; 
- D 1 - I - 0x017AE0 05:BAD0: C9        .byte $C9   ; 
- D 1 - I - 0x017AE1 05:BAD1: 8A        .byte $8A   ; 
- D 1 - I - 0x017AE2 05:BAD2: BB        .byte $BB   ; 
- D 1 - I - 0x017AE3 05:BAD3: CA        .byte $CA   ; 
- D 1 - I - 0x017AE4 05:BAD4: CB        .byte $CB   ; 
- D 1 - I - 0x017AE5 05:BAD5: CC        .byte $CC   ; 
- D 1 - I - 0x017AE6 05:BAD6: CD        .byte $CD   ; 
- D 1 - I - 0x017AE7 05:BAD7: 5E        .byte $5E   ; 
- D 1 - I - 0x017AE8 05:BAD8: D3        .byte $D3   ; 
- D 1 - I - 0x017AE9 05:BAD9: 8B        .byte $8B   ; 
- D 1 - I - 0x017AEA 05:BADA: B0        .byte $B0   ; 
- D 1 - I - 0x017AEB 05:BADB: D5        .byte $D5   ; 
- D 1 - I - 0x017AEC 05:BADC: 62        .byte $62   ; 
- D 1 - I - 0x017AED 05:BADD: B0        .byte $B0   ; 
- D 1 - I - 0x017AEE 05:BADE: 88        .byte $88   ; 
- D 1 - I - 0x017AEF 05:BADF: 5E        .byte $5E   ; 
- D 1 - I - 0x017AF0 05:BAE0: B0        .byte $B0   ; 
- D 1 - I - 0x017AF1 05:BAE1: 88        .byte $88   ; 
- D 1 - I - 0x017AF2 05:BAE2: BC        .byte $BC   ; 
- D 1 - I - 0x017AF3 05:BAE3: CE        .byte $CE   ; 
- D 1 - I - 0x017AF4 05:BAE4: 88        .byte $88   ; 
- D 1 - I - 0x017AF5 05:BAE5: BE        .byte $BE   ; 
- D 1 - I - 0x017AF6 05:BAE6: 50        .byte $50   ; 
- D 1 - I - 0x017AF7 05:BAE7: 88        .byte $88   ; 
- D 1 - I - 0x017AF8 05:BAE8: BC        .byte $BC   ; 
- D 1 - I - 0x017AF9 05:BAE9: 51        .byte $51   ; 
- D 1 - I - 0x017AFA 05:BAEA: D6        .byte $D6   ; 
- D 1 - I - 0x017AFB 05:BAEB: BE        .byte $BE   ; 
- D 1 - I - 0x017AFC 05:BAEC: 50        .byte $50   ; 
- D 1 - I - 0x017AFD 05:BAED: D7        .byte $D7   ; 
- D 1 - I - 0x017AFE 05:BAEE: D8        .byte $D8   ; 
- D 1 - I - 0x017AFF 05:BAEF: 50        .byte $50   ; 
- D 1 - I - 0x017B00 05:BAF0: 00        .byte $00   ; 
- D 1 - I - 0x017B01 05:BAF1: 5F        .byte $5F   ; 
- D 1 - I - 0x017B02 05:BAF2: DA        .byte $DA   ; 
- D 1 - I - 0x017B03 05:BAF3: 00        .byte $00   ; 
- D 1 - I - 0x017B04 05:BAF4: 5B        .byte $5B   ; 
- D 1 - I - 0x017B05 05:BAF5: D9        .byte $D9   ; 
- D 1 - I - 0x017B06 05:BAF6: DE        .byte $DE   ; 
- D 1 - I - 0x017B07 05:BAF7: 60        .byte $60   ; 
- D 1 - I - 0x017B08 05:BAF8: B3        .byte $B3   ; 
- D 1 - I - 0x017B09 05:BAF9: 5D        .byte $5D   ; 
- D 1 - I - 0x017B0A 05:BAFA: C6        .byte $C6   ; 
- D 1 - I - 0x017B0B 05:BAFB: B9        .byte $B9   ; 
- D 1 - I - 0x017B0C 05:BAFC: 8B        .byte $8B   ; 
- D 1 - I - 0x017B0D 05:BAFD: C3        .byte $C3   ; 
- D 1 - I - 0x017B0E 05:BAFE: C7        .byte $C7   ; 
- D 1 - I - 0x017B0F 05:BAFF: 8B        .byte $8B   ; 
- D 1 - I - 0x017B10 05:BB00: B0        .byte $B0   ; 
- D 1 - I - 0x017B11 05:BB01: 88        .byte $88   ; 
- D 1 - I - 0x017B12 05:BB02: C8        .byte $C8   ; 
- D 1 - I - 0x017B13 05:BB03: B0        .byte $B0   ; 
- D 1 - I - 0x017B14 05:BB04: 88        .byte $88   ; 
- D 1 - I - 0x017B15 05:BB05: BE        .byte $BE   ; 
- D 1 - I - 0x017B16 05:BB06: AF        .byte $AF   ; 
- D 1 - I - 0x017B17 05:BB07: 88        .byte $88   ; 
- D 1 - I - 0x017B18 05:BB08: BC        .byte $BC   ; 
- D 1 - I - 0x017B19 05:BB09: 84        .byte $84   ; 
- D 1 - I - 0x017B1A 05:BB0A: E1        .byte $E1   ; 
- D 1 - I - 0x017B1B 05:BB0B: BD        .byte $BD   ; 
- D 1 - I - 0x017B1C 05:BB0C: 50        .byte $50   ; 
- D 1 - I - 0x017B1D 05:BB0D: E4        .byte $E4   ; 
- D 1 - I - 0x017B1E 05:BB0E: E3        .byte $E3   ; 
- - - - - - 0x017B1F 05:BB0F: 00        .byte $00   ; 
- - - - - - 0x017B20 05:BB10: 00        .byte $00   ; 
- - - - - - 0x017B21 05:BB11: 00        .byte $00   ; 
- - - - - - 0x017B22 05:BB12: 00        .byte $00   ; 
- - - - - - 0x017B23 05:BB13: 00        .byte $00   ; 
- - - - - - 0x017B24 05:BB14: 00        .byte $00   ; 
- - - - - - 0x017B25 05:BB15: 00        .byte $00   ; 
- - - - - - 0x017B26 05:BB16: 00        .byte $00   ; 
- D 1 - I - 0x017B27 05:BB17: 86        .byte $86   ; 
- D 1 - I - 0x017B28 05:BB18: C9        .byte $C9   ; 
- D 1 - I - 0x017B29 05:BB19: 8A        .byte $8A   ; 
- D 1 - I - 0x017B2A 05:BB1A: BB        .byte $BB   ; 
- D 1 - I - 0x017B2B 05:BB1B: CA        .byte $CA   ; 
- D 1 - I - 0x017B2C 05:BB1C: CB        .byte $CB   ; 
- D 1 - I - 0x017B2D 05:BB1D: CC        .byte $CC   ; 
- D 1 - I - 0x017B2E 05:BB1E: CD        .byte $CD   ; 
- D 1 - I - 0x017B2F 05:BB1F: 5B        .byte $5B   ; 
- D 1 - I - 0x017B30 05:BB20: CF        .byte $CF   ; 
- D 1 - I - 0x017B31 05:BB21: 8B        .byte $8B   ; 
- D 1 - I - 0x017B32 05:BB22: D0        .byte $D0   ; 
- D 1 - I - 0x017B33 05:BB23: B8        .byte $B8   ; 
- D 1 - I - 0x017B34 05:BB24: D1        .byte $D1   ; 
- D 1 - I - 0x017B35 05:BB25: B0        .byte $B0   ; 
- D 1 - I - 0x017B36 05:BB26: C0        .byte $C0   ; 
- D 1 - I - 0x017B37 05:BB27: 5E        .byte $5E   ; 
- D 1 - I - 0x017B38 05:BB28: B0        .byte $B0   ; 
- D 1 - I - 0x017B39 05:BB29: 88        .byte $88   ; 
- D 1 - I - 0x017B3A 05:BB2A: BC        .byte $BC   ; 
- D 1 - I - 0x017B3B 05:BB2B: CE        .byte $CE   ; 
- D 1 - I - 0x017B3C 05:BB2C: 88        .byte $88   ; 
- D 1 - I - 0x017B3D 05:BB2D: BE        .byte $BE   ; 
- D 1 - I - 0x017B3E 05:BB2E: 50        .byte $50   ; 
- D 1 - I - 0x017B3F 05:BB2F: 88        .byte $88   ; 
- D 1 - I - 0x017B40 05:BB30: BC        .byte $BC   ; 
- D 1 - I - 0x017B41 05:BB31: 87        .byte $87   ; 
- D 1 - I - 0x017B42 05:BB32: C5        .byte $C5   ; 
- D 1 - I - 0x017B43 05:BB33: BE        .byte $BE   ; 
- D 1 - I - 0x017B44 05:BB34: AC        .byte $AC   ; 
- D 1 - I - 0x017B45 05:BB35: C2        .byte $C2   ; 
- D 1 - I - 0x017B46 05:BB36: C4        .byte $C4   ; 
- - - - - - 0x017B47 05:BB37: 9E        .byte $9E   ; 
- - - - - - 0x017B48 05:BB38: 5C        .byte $5C   ; 
- - - - - - 0x017B49 05:BB39: 5D        .byte $5D   ; 
- - - - - - 0x017B4A 05:BB3A: A1        .byte $A1   ; 
- - - - - - 0x017B4B 05:BB3B: A2        .byte $A2   ; 
- - - - - - 0x017B4C 05:BB3C: 6C        .byte $6C   ; 
- - - - - - 0x017B4D 05:BB3D: 6D        .byte $6D   ; 
- - - - - - 0x017B4E 05:BB3E: A5        .byte $A5   ; 
- - - - - - 0x017B4F 05:BB3F: A6        .byte $A6   ; 
- - - - - - 0x017B50 05:BB40: 5E        .byte $5E   ; 
- - - - - - 0x017B51 05:BB41: 5F        .byte $5F   ; 
- - - - - - 0x017B52 05:BB42: A9        .byte $A9   ; 
- - - - - - 0x017B53 05:BB43: AA        .byte $AA   ; 
- - - - - - 0x017B54 05:BB44: 6E        .byte $6E   ; 
- - - - - - 0x017B55 05:BB45: 6F        .byte $6F   ; 
- - - - - - 0x017B56 05:BB46: AD        .byte $AD   ; 
- - - - - - 0x017B57 05:BB47: 42        .byte $42   ; 
- - - - - - 0x017B58 05:BB48: DB        .byte $DB   ; 
- - - - - - 0x017B59 05:BB49: 42        .byte $42   ; 
- - - - - - 0x017B5A 05:BB4A: DB        .byte $DB   ; 
- - - - - - 0x017B5B 05:BB4B: DC        .byte $DC   ; 
- - - - - - 0x017B5C 05:BB4C: DD        .byte $DD   ; 
- - - - - - 0x017B5D 05:BB4D: DC        .byte $DC   ; 
- - - - - - 0x017B5E 05:BB4E: DD        .byte $DD   ; 
- - - - - - 0x017B5F 05:BB4F: 9E        .byte $9E   ; 
- - - - - - 0x017B60 05:BB50: 5C        .byte $5C   ; 
- - - - - - 0x017B61 05:BB51: 5D        .byte $5D   ; 
- - - - - - 0x017B62 05:BB52: A1        .byte $A1   ; 
- - - - - - 0x017B63 05:BB53: A2        .byte $A2   ; 
- - - - - - 0x017B64 05:BB54: 6C        .byte $6C   ; 
- - - - - - 0x017B65 05:BB55: 6D        .byte $6D   ; 
- - - - - - 0x017B66 05:BB56: A5        .byte $A5   ; 
- - - - - - 0x017B67 05:BB57: 00        .byte $00   ; 
- - - - - - 0x017B68 05:BB58: 00        .byte $00   ; 
- - - - - - 0x017B69 05:BB59: 64        .byte $64   ; 
- - - - - - 0x017B6A 05:BB5A: CC        .byte $CC   ; 
- - - - - - 0x017B6B 05:BB5B: 64        .byte $64   ; 
- - - - - - 0x017B6C 05:BB5C: CC        .byte $CC   ; 
- - - - - - 0x017B6D 05:BB5D: 60        .byte $60   ; 
- - - - - - 0x017B6E 05:BB5E: CA        .byte $CA   ; 
- - - - - - 0x017B6F 05:BB5F: 60        .byte $60   ; 
- - - - - - 0x017B70 05:BB60: CA        .byte $CA   ; 
- - - - - - 0x017B71 05:BB61: 62        .byte $62   ; 
- - - - - - 0x017B72 05:BB62: CF        .byte $CF   ; 
- - - - - - 0x017B73 05:BB63: 8F        .byte $8F   ; 
- - - - - - 0x017B74 05:BB64: 5C        .byte $5C   ; 
- - - - - - 0x017B75 05:BB65: 5D        .byte $5D   ; 
- - - - - - 0x017B76 05:BB66: A1        .byte $A1   ; 
- - - - - - 0x017B77 05:BB67: 68        .byte $68   ; 
- - - - - - 0x017B78 05:BB68: C0        .byte $C0   ; 
- - - - - - 0x017B79 05:BB69: 00        .byte $00   ; 
- - - - - - 0x017B7A 05:BB6A: 00        .byte $00   ; 
- - - - - - 0x017B7B 05:BB6B: 65        .byte $65   ; 
- - - - - - 0x017B7C 05:BB6C: BE        .byte $BE   ; 
- - - - - - 0x017B7D 05:BB6D: 68        .byte $68   ; 
- - - - - - 0x017B7E 05:BB6E: C0        .byte $C0   ; 
- - - - - - 0x017B7F 05:BB6F: 66        .byte $66   ; 
- - - - - - 0x017B80 05:BB70: BF        .byte $BF   ; 
- - - - - - 0x017B81 05:BB71: 65        .byte $65   ; 
- - - - - - 0x017B82 05:BB72: BE        .byte $BE   ; 
- - - - - - 0x017B83 05:BB73: 9E        .byte $9E   ; 
- - - - - - 0x017B84 05:BB74: 5C        .byte $5C   ; 
- - - - - - 0x017B85 05:BB75: 5D        .byte $5D   ; 
- - - - - - 0x017B86 05:BB76: 8D        .byte $8D   ; 
- - - - - - 0x017B87 05:BB77: A2        .byte $A2   ; 
- - - - - - 0x017B88 05:BB78: 6C        .byte $6C   ; 
- - - - - - 0x017B89 05:BB79: 6D        .byte $6D   ; 
- - - - - - 0x017B8A 05:BB7A: A5        .byte $A5   ; 
- - - - - - 0x017B8B 05:BB7B: A6        .byte $A6   ; 
- - - - - - 0x017B8C 05:BB7C: 5E        .byte $5E   ; 
- - - - - - 0x017B8D 05:BB7D: 5F        .byte $5F   ; 
- - - - - - 0x017B8E 05:BB7E: A9        .byte $A9   ; 
- - - - - - 0x017B8F 05:BB7F: 18        .byte $18   ; 
- - - - - - 0x017B90 05:BB80: E7        .byte $E7   ; 
- - - - - - 0x017B91 05:BB81: 17        .byte $17   ; 
- - - - - - 0x017B92 05:BB82: C9        .byte $C9   ; 
- - - - - - 0x017B93 05:BB83: D5        .byte $D5   ; 
- - - - - - 0x017B94 05:BB84: 02        .byte $02   ; 
- - - - - - 0x017B95 05:BB85: 18        .byte $18   ; 
- - - - - - 0x017B96 05:BB86: BF        .byte $BF   ; 
- - - - - - 0x017B97 05:BB87: A6        .byte $A6   ; 
- - - - - - 0x017B98 05:BB88: 5E        .byte $5E   ; 
- - - - - - 0x017B99 05:BB89: 5F        .byte $5F   ; 
- - - - - - 0x017B9A 05:BB8A: A9        .byte $A9   ; 
- - - - - - 0x017B9B 05:BB8B: AA        .byte $AA   ; 
- - - - - - 0x017B9C 05:BB8C: 6E        .byte $6E   ; 
- - - - - - 0x017B9D 05:BB8D: 6F        .byte $6F   ; 
- - - - - - 0x017B9E 05:BB8E: AD        .byte $AD   ; 
- - - - - - 0x017B9F 05:BB8F: 02        .byte $02   ; 
- - - - - - 0x017BA0 05:BB90: DE        .byte $DE   ; 
- - - - - - 0x017BA1 05:BB91: 03        .byte $03   ; 
- - - - - - 0x017BA2 05:BB92: 02        .byte $02   ; 
- - - - - - 0x017BA3 05:BB93: 00        .byte $00   ; 
- - - - - - 0x017BA4 05:BB94: DF        .byte $DF   ; 
- - - - - - 0x017BA5 05:BB95: E0        .byte $E0   ; 
- - - - - - 0x017BA6 05:BB96: 00        .byte $00   ; 
- - - - - - 0x017BA7 05:BB97: A2        .byte $A2   ; 
- - - - - - 0x017BA8 05:BB98: 6C        .byte $6C   ; 
- - - - - - 0x017BA9 05:BB99: 6D        .byte $6D   ; 
- - - - - - 0x017BAA 05:BB9A: A5        .byte $A5   ; 
- - - - - - 0x017BAB 05:BB9B: A6        .byte $A6   ; 
- - - - - - 0x017BAC 05:BB9C: 5E        .byte $5E   ; 
- - - - - - 0x017BAD 05:BB9D: 5F        .byte $5F   ; 
- - - - - - 0x017BAE 05:BB9E: A9        .byte $A9   ; 
- - - - - - 0x017BAF 05:BB9F: 16        .byte $16   ; 
- - - - - - 0x017BB0 05:BBA0: 6E        .byte $6E   ; 
- - - - - - 0x017BB1 05:BBA1: 6F        .byte $6F   ; 
- - - - - - 0x017BB2 05:BBA2: D4        .byte $D4   ; 
- - - - - - 0x017BB3 05:BBA3: 15        .byte $15   ; 
- - - - - - 0x017BB4 05:BBA4: D4        .byte $D4   ; 
- - - - - - 0x017BB5 05:BBA5: 02        .byte $02   ; 
- - - - - - 0x017BB6 05:BBA6: D5        .byte $D5   ; 
- D 1 - I - 0x017BB7 05:BBA7: 00        .byte $00   ; 
- D 1 - I - 0x017BB8 05:BBA8: 00        .byte $00   ; 
- D 1 - I - 0x017BB9 05:BBA9: 00        .byte $00   ; 
- D 1 - I - 0x017BBA 05:BBAA: 00        .byte $00   ; 
- D 1 - I - 0x017BBB 05:BBAB: 00        .byte $00   ; 
- D 1 - I - 0x017BBC 05:BBAC: 00        .byte $00   ; 
- D 1 - I - 0x017BBD 05:BBAD: 00        .byte $00   ; 
- D 1 - I - 0x017BBE 05:BBAE: 00        .byte $00   ; 
- D 1 - I - 0x017BBF 05:BBAF: 00        .byte $00   ; 
- D 1 - I - 0x017BC0 05:BBB0: 00        .byte $00   ; 
- D 1 - I - 0x017BC1 05:BBB1: 00        .byte $00   ; 
- D 1 - I - 0x017BC2 05:BBB2: 0C        .byte $0C   ; 
- D 1 - I - 0x017BC3 05:BBB3: 00        .byte $00   ; 
- D 1 - I - 0x017BC4 05:BBB4: 00        .byte $00   ; 
- D 1 - I - 0x017BC5 05:BBB5: 00        .byte $00   ; 
- D 1 - I - 0x017BC6 05:BBB6: 15        .byte $15   ; 
- D 1 - I - 0x017BC7 05:BBB7: 01        .byte $01   ; 
- D 1 - I - 0x017BC8 05:BBB8: 02        .byte $02   ; 
- D 1 - I - 0x017BC9 05:BBB9: 03        .byte $03   ; 
- D 1 - I - 0x017BCA 05:BBBA: 04        .byte $04   ; 
- D 1 - I - 0x017BCB 05:BBBB: 07        .byte $07   ; 
- D 1 - I - 0x017BCC 05:BBBC: 08        .byte $08   ; 
- D 1 - I - 0x017BCD 05:BBBD: 09        .byte $09   ; 
- D 1 - I - 0x017BCE 05:BBBE: 09        .byte $09   ; 
- D 1 - I - 0x017BCF 05:BBBF: 0D        .byte $0D   ; 
- D 1 - I - 0x017BD0 05:BBC0: 0E        .byte $0E   ; 
- D 1 - I - 0x017BD1 05:BBC1: 0F        .byte $0F   ; 
- D 1 - I - 0x017BD2 05:BBC2: 10        .byte $10   ; 
- D 1 - I - 0x017BD3 05:BBC3: 16        .byte $16   ; 
- D 1 - I - 0x017BD4 05:BBC4: 17        .byte $17   ; 
- D 1 - I - 0x017BD5 05:BBC5: 18        .byte $18   ; 
- D 1 - I - 0x017BD6 05:BBC6: 19        .byte $19   ; 
- D 1 - I - 0x017BD7 05:BBC7: 05        .byte $05   ; 
- D 1 - I - 0x017BD8 05:BBC8: 06        .byte $06   ; 
- D 1 - I - 0x017BD9 05:BBC9: 00        .byte $00   ; 
- D 1 - I - 0x017BDA 05:BBCA: 00        .byte $00   ; 
- D 1 - I - 0x017BDB 05:BBCB: 09        .byte $09   ; 
- D 1 - I - 0x017BDC 05:BBCC: 0A        .byte $0A   ; 
- D 1 - I - 0x017BDD 05:BBCD: 0B        .byte $0B   ; 
- D 1 - I - 0x017BDE 05:BBCE: 00        .byte $00   ; 
- D 1 - I - 0x017BDF 05:BBCF: 11        .byte $11   ; 
- D 1 - I - 0x017BE0 05:BBD0: 12        .byte $12   ; 
- D 1 - I - 0x017BE1 05:BBD1: 13        .byte $13   ; 
- D 1 - I - 0x017BE2 05:BBD2: 14        .byte $14   ; 
- D 1 - I - 0x017BE3 05:BBD3: 1A        .byte $1A   ; 
- D 1 - I - 0x017BE4 05:BBD4: 1B        .byte $1B   ; 
- D 1 - I - 0x017BE5 05:BBD5: 1C        .byte $1C   ; 
- D 1 - I - 0x017BE6 05:BBD6: 1D        .byte $1D   ; 
- D 1 - I - 0x017BE7 05:BBD7: 00        .byte $00   ; 
- D 1 - I - 0x017BE8 05:BBD8: 00        .byte $00   ; 
- D 1 - I - 0x017BE9 05:BBD9: 00        .byte $00   ; 
- D 1 - I - 0x017BEA 05:BBDA: 1E        .byte $1E   ; 
- D 1 - I - 0x017BEB 05:BBDB: 00        .byte $00   ; 
- D 1 - I - 0x017BEC 05:BBDC: 00        .byte $00   ; 
- D 1 - I - 0x017BED 05:BBDD: 27        .byte $27   ; 
- D 1 - I - 0x017BEE 05:BBDE: 28        .byte $28   ; 
- D 1 - I - 0x017BEF 05:BBDF: 00        .byte $00   ; 
- D 1 - I - 0x017BF0 05:BBE0: 31        .byte $31   ; 
- D 1 - I - 0x017BF1 05:BBE1: 32        .byte $32   ; 
- D 1 - I - 0x017BF2 05:BBE2: 33        .byte $33   ; 
- D 1 - I - 0x017BF3 05:BBE3: 00        .byte $00   ; 
- D 1 - I - 0x017BF4 05:BBE4: 3C        .byte $3C   ; 
- D 1 - I - 0x017BF5 05:BBE5: 3D        .byte $3D   ; 
- D 1 - I - 0x017BF6 05:BBE6: 3E        .byte $3E   ; 
- D 1 - I - 0x017BF7 05:BBE7: 1F        .byte $1F   ; 
- D 1 - I - 0x017BF8 05:BBE8: 20        .byte $20   ; 
- D 1 - I - 0x017BF9 05:BBE9: 21        .byte $21   ; 
- D 1 - I - 0x017BFA 05:BBEA: 22        .byte $22   ; 
- D 1 - I - 0x017BFB 05:BBEB: 29        .byte $29   ; 
- D 1 - I - 0x017BFC 05:BBEC: 2A        .byte $2A   ; 
- D 1 - I - 0x017BFD 05:BBED: 2B        .byte $2B   ; 
- D 1 - I - 0x017BFE 05:BBEE: 2C        .byte $2C   ; 
- D 1 - I - 0x017BFF 05:BBEF: 34        .byte $34   ; 
- D 1 - I - 0x017C00 05:BBF0: 35        .byte $35   ; 
- D 1 - I - 0x017C01 05:BBF1: 36        .byte $36   ; 
- D 1 - I - 0x017C02 05:BBF2: 37        .byte $37   ; 
- D 1 - I - 0x017C03 05:BBF3: 3F        .byte $3F   ; 
- D 1 - I - 0x017C04 05:BBF4: 40        .byte $40   ; 
- D 1 - I - 0x017C05 05:BBF5: 41        .byte $41   ; 
- D 1 - I - 0x017C06 05:BBF6: 42        .byte $42   ; 
- D 1 - I - 0x017C07 05:BBF7: 23        .byte $23   ; 
- D 1 - I - 0x017C08 05:BBF8: 24        .byte $24   ; 
- D 1 - I - 0x017C09 05:BBF9: 25        .byte $25   ; 
- D 1 - I - 0x017C0A 05:BBFA: 26        .byte $26   ; 
- D 1 - I - 0x017C0B 05:BBFB: 2D        .byte $2D   ; 
- D 1 - I - 0x017C0C 05:BBFC: 2E        .byte $2E   ; 
- D 1 - I - 0x017C0D 05:BBFD: 2F        .byte $2F   ; 
- D 1 - I - 0x017C0E 05:BBFE: 30        .byte $30   ; 
- D 1 - I - 0x017C0F 05:BBFF: 38        .byte $38   ; 
- D 1 - I - 0x017C10 05:BC00: 39        .byte $39   ; 
- D 1 - I - 0x017C11 05:BC01: 3A        .byte $3A   ; 
- D 1 - I - 0x017C12 05:BC02: 3B        .byte $3B   ; 
- D 1 - I - 0x017C13 05:BC03: 43        .byte $43   ; 
- D 1 - I - 0x017C14 05:BC04: 44        .byte $44   ; 
- D 1 - I - 0x017C15 05:BC05: 45        .byte $45   ; 
- D 1 - I - 0x017C16 05:BC06: 46        .byte $46   ; 
- D 1 - I - 0x017C17 05:BC07: 00        .byte $00   ; 
- D 1 - I - 0x017C18 05:BC08: 00        .byte $00   ; 
- D 1 - I - 0x017C19 05:BC09: 00        .byte $00   ; 
- D 1 - I - 0x017C1A 05:BC0A: 00        .byte $00   ; 
- D 1 - I - 0x017C1B 05:BC0B: 00        .byte $00   ; 
- D 1 - I - 0x017C1C 05:BC0C: 00        .byte $00   ; 
- D 1 - I - 0x017C1D 05:BC0D: 00        .byte $00   ; 
- D 1 - I - 0x017C1E 05:BC0E: 00        .byte $00   ; 
- D 1 - I - 0x017C1F 05:BC0F: 00        .byte $00   ; 
- D 1 - I - 0x017C20 05:BC10: 00        .byte $00   ; 
- D 1 - I - 0x017C21 05:BC11: 5E        .byte $5E   ; 
- D 1 - I - 0x017C22 05:BC12: 5F        .byte $5F   ; 
- D 1 - I - 0x017C23 05:BC13: 6C        .byte $6C   ; 
- D 1 - I - 0x017C24 05:BC14: 6D        .byte $6D   ; 
- D 1 - I - 0x017C25 05:BC15: 6E        .byte $6E   ; 
- D 1 - I - 0x017C26 05:BC16: 6F        .byte $6F   ; 
- D 1 - I - 0x017C27 05:BC17: 00        .byte $00   ; 
- D 1 - I - 0x017C28 05:BC18: 47        .byte $47   ; 
- D 1 - I - 0x017C29 05:BC19: 48        .byte $48   ; 
- D 1 - I - 0x017C2A 05:BC1A: 49        .byte $49   ; 
- D 1 - I - 0x017C2B 05:BC1B: 52        .byte $52   ; 
- D 1 - I - 0x017C2C 05:BC1C: 53        .byte $53   ; 
- D 1 - I - 0x017C2D 05:BC1D: 54        .byte $54   ; 
- D 1 - I - 0x017C2E 05:BC1E: 55        .byte $55   ; 
- D 1 - I - 0x017C2F 05:BC1F: 60        .byte $60   ; 
- D 1 - I - 0x017C30 05:BC20: 61        .byte $61   ; 
- D 1 - I - 0x017C31 05:BC21: 62        .byte $62   ; 
- D 1 - I - 0x017C32 05:BC22: 63        .byte $63   ; 
- D 1 - I - 0x017C33 05:BC23: 70        .byte $70   ; 
- D 1 - I - 0x017C34 05:BC24: 71        .byte $71   ; 
- D 1 - I - 0x017C35 05:BC25: 72        .byte $72   ; 
- D 1 - I - 0x017C36 05:BC26: 73        .byte $73   ; 
- D 1 - I - 0x017C37 05:BC27: 4A        .byte $4A   ; 
- D 1 - I - 0x017C38 05:BC28: 4B        .byte $4B   ; 
- D 1 - I - 0x017C39 05:BC29: 4C        .byte $4C   ; 
- D 1 - I - 0x017C3A 05:BC2A: 4D        .byte $4D   ; 
- D 1 - I - 0x017C3B 05:BC2B: 56        .byte $56   ; 
- D 1 - I - 0x017C3C 05:BC2C: 57        .byte $57   ; 
- D 1 - I - 0x017C3D 05:BC2D: 58        .byte $58   ; 
- D 1 - I - 0x017C3E 05:BC2E: 59        .byte $59   ; 
- D 1 - I - 0x017C3F 05:BC2F: 64        .byte $64   ; 
- D 1 - I - 0x017C40 05:BC30: 65        .byte $65   ; 
- D 1 - I - 0x017C41 05:BC31: 66        .byte $66   ; 
- D 1 - I - 0x017C42 05:BC32: 67        .byte $67   ; 
- D 1 - I - 0x017C43 05:BC33: 74        .byte $74   ; 
- D 1 - I - 0x017C44 05:BC34: 75        .byte $75   ; 
- D 1 - I - 0x017C45 05:BC35: 76        .byte $76   ; 
- D 1 - I - 0x017C46 05:BC36: 77        .byte $77   ; 
- D 1 - I - 0x017C47 05:BC37: 4E        .byte $4E   ; 
- D 1 - I - 0x017C48 05:BC38: 4F        .byte $4F   ; 
- D 1 - I - 0x017C49 05:BC39: 50        .byte $50   ; 
- D 1 - I - 0x017C4A 05:BC3A: 51        .byte $51   ; 
- D 1 - I - 0x017C4B 05:BC3B: 5A        .byte $5A   ; 
- D 1 - I - 0x017C4C 05:BC3C: 5B        .byte $5B   ; 
- D 1 - I - 0x017C4D 05:BC3D: 5C        .byte $5C   ; 
- D 1 - I - 0x017C4E 05:BC3E: 5D        .byte $5D   ; 
- D 1 - I - 0x017C4F 05:BC3F: 68        .byte $68   ; 
- D 1 - I - 0x017C50 05:BC40: 69        .byte $69   ; 
- D 1 - I - 0x017C51 05:BC41: 6A        .byte $6A   ; 
- D 1 - I - 0x017C52 05:BC42: 6B        .byte $6B   ; 
- D 1 - I - 0x017C53 05:BC43: 78        .byte $78   ; 
- D 1 - I - 0x017C54 05:BC44: 79        .byte $79   ; 
- D 1 - I - 0x017C55 05:BC45: 7A        .byte $7A   ; 
- D 1 - I - 0x017C56 05:BC46: 7B        .byte $7B   ; 
- D 1 - I - 0x017C57 05:BC47: 00        .byte $00   ; 
- D 1 - I - 0x017C58 05:BC48: 00        .byte $00   ; 
- D 1 - I - 0x017C59 05:BC49: 00        .byte $00   ; 
- D 1 - I - 0x017C5A 05:BC4A: 7C        .byte $7C   ; 
- D 1 - I - 0x017C5B 05:BC4B: 00        .byte $00   ; 
- D 1 - I - 0x017C5C 05:BC4C: 00        .byte $00   ; 
- D 1 - I - 0x017C5D 05:BC4D: 00        .byte $00   ; 
- D 1 - I - 0x017C5E 05:BC4E: 8D        .byte $8D   ; 
- D 1 - I - 0x017C5F 05:BC4F: 00        .byte $00   ; 
- D 1 - I - 0x017C60 05:BC50: 00        .byte $00   ; 
- D 1 - I - 0x017C61 05:BC51: 9D        .byte $9D   ; 
- D 1 - I - 0x017C62 05:BC52: 9E        .byte $9E   ; 
- D 1 - I - 0x017C63 05:BC53: 00        .byte $00   ; 
- D 1 - I - 0x017C64 05:BC54: 00        .byte $00   ; 
- D 1 - I - 0x017C65 05:BC55: AC        .byte $AC   ; 
- D 1 - I - 0x017C66 05:BC56: AD        .byte $AD   ; 
- D 1 - I - 0x017C67 05:BC57: 7D        .byte $7D   ; 
- D 1 - I - 0x017C68 05:BC58: 7E        .byte $7E   ; 
- D 1 - I - 0x017C69 05:BC59: 7F        .byte $7F   ; 
- D 1 - I - 0x017C6A 05:BC5A: 80        .byte $80   ; 
- D 1 - I - 0x017C6B 05:BC5B: 8E        .byte $8E   ; 
- D 1 - I - 0x017C6C 05:BC5C: 00        .byte $00   ; 
- D 1 - I - 0x017C6D 05:BC5D: 8F        .byte $8F   ; 
- D 1 - I - 0x017C6E 05:BC5E: 90        .byte $90   ; 
- D 1 - I - 0x017C6F 05:BC5F: 00        .byte $00   ; 
- D 1 - I - 0x017C70 05:BC60: 00        .byte $00   ; 
- D 1 - I - 0x017C71 05:BC61: 9F        .byte $9F   ; 
- D 1 - I - 0x017C72 05:BC62: A0        .byte $A0   ; 
- D 1 - I - 0x017C73 05:BC63: 00        .byte $00   ; 
- D 1 - I - 0x017C74 05:BC64: 00        .byte $00   ; 
- D 1 - I - 0x017C75 05:BC65: AE        .byte $AE   ; 
- D 1 - I - 0x017C76 05:BC66: 00        .byte $00   ; 
- D 1 - I - 0x017C77 05:BC67: 81        .byte $81   ; 
- D 1 - I - 0x017C78 05:BC68: 82        .byte $82   ; 
- D 1 - I - 0x017C79 05:BC69: 83        .byte $83   ; 
- D 1 - I - 0x017C7A 05:BC6A: 84        .byte $84   ; 
- D 1 - I - 0x017C7B 05:BC6B: 91        .byte $91   ; 
- D 1 - I - 0x017C7C 05:BC6C: 92        .byte $92   ; 
- D 1 - I - 0x017C7D 05:BC6D: 93        .byte $93   ; 
- D 1 - I - 0x017C7E 05:BC6E: 94        .byte $94   ; 
- D 1 - I - 0x017C7F 05:BC6F: A1        .byte $A1   ; 
- D 1 - I - 0x017C80 05:BC70: A2        .byte $A2   ; 
- D 1 - I - 0x017C81 05:BC71: A3        .byte $A3   ; 
- D 1 - I - 0x017C82 05:BC72: 00        .byte $00   ; 
- D 1 - I - 0x017C83 05:BC73: AF        .byte $AF   ; 
- D 1 - I - 0x017C84 05:BC74: 00        .byte $00   ; 
- D 1 - I - 0x017C85 05:BC75: B0        .byte $B0   ; 
- D 1 - I - 0x017C86 05:BC76: 00        .byte $00   ; 
- D 1 - I - 0x017C87 05:BC77: 85        .byte $85   ; 
- D 1 - I - 0x017C88 05:BC78: 86        .byte $86   ; 
- D 1 - I - 0x017C89 05:BC79: 87        .byte $87   ; 
- D 1 - I - 0x017C8A 05:BC7A: 88        .byte $88   ; 
- D 1 - I - 0x017C8B 05:BC7B: 95        .byte $95   ; 
- D 1 - I - 0x017C8C 05:BC7C: 96        .byte $96   ; 
- D 1 - I - 0x017C8D 05:BC7D: 97        .byte $97   ; 
- D 1 - I - 0x017C8E 05:BC7E: 98        .byte $98   ; 
- D 1 - I - 0x017C8F 05:BC7F: A4        .byte $A4   ; 
- D 1 - I - 0x017C90 05:BC80: A5        .byte $A5   ; 
- D 1 - I - 0x017C91 05:BC81: A6        .byte $A6   ; 
- D 1 - I - 0x017C92 05:BC82: A7        .byte $A7   ; 
- D 1 - I - 0x017C93 05:BC83: B1        .byte $B1   ; 
- D 1 - I - 0x017C94 05:BC84: B2        .byte $B2   ; 
- D 1 - I - 0x017C95 05:BC85: B3        .byte $B3   ; 
- D 1 - I - 0x017C96 05:BC86: B4        .byte $B4   ; 
- D 1 - I - 0x017C97 05:BC87: 89        .byte $89   ; 
- D 1 - I - 0x017C98 05:BC88: 8A        .byte $8A   ; 
- D 1 - I - 0x017C99 05:BC89: 8B        .byte $8B   ; 
- D 1 - I - 0x017C9A 05:BC8A: 8C        .byte $8C   ; 
- D 1 - I - 0x017C9B 05:BC8B: 99        .byte $99   ; 
- D 1 - I - 0x017C9C 05:BC8C: 9A        .byte $9A   ; 
- D 1 - I - 0x017C9D 05:BC8D: 9B        .byte $9B   ; 
- D 1 - I - 0x017C9E 05:BC8E: 9C        .byte $9C   ; 
- D 1 - I - 0x017C9F 05:BC8F: A8        .byte $A8   ; 
- D 1 - I - 0x017CA0 05:BC90: A9        .byte $A9   ; 
- D 1 - I - 0x017CA1 05:BC91: AA        .byte $AA   ; 
- D 1 - I - 0x017CA2 05:BC92: AB        .byte $AB   ; 
- D 1 - I - 0x017CA3 05:BC93: B5        .byte $B5   ; 
- D 1 - I - 0x017CA4 05:BC94: B6        .byte $B6   ; 
- D 1 - I - 0x017CA5 05:BC95: B7        .byte $B7   ; 
- D 1 - I - 0x017CA6 05:BC96: B8        .byte $B8   ; 
- - - - - - 0x017CA7 05:BC97: 85        .byte $85   ; 
- - - - - - 0x017CA8 05:BC98: 00        .byte $00   ; 
- - - - - - 0x017CA9 05:BC99: BB        .byte $BB   ; 
- - - - - - 0x017CAA 05:BC9A: 88        .byte $88   ; 
- - - - - - 0x017CAB 05:BC9B: BC        .byte $BC   ; 
- - - - - - 0x017CAC 05:BC9C: BD        .byte $BD   ; 
- - - - - - 0x017CAD 05:BC9D: BE        .byte $BE   ; 
- - - - - - 0x017CAE 05:BC9E: BF        .byte $BF   ; 
- - - - - - 0x017CAF 05:BC9F: C0        .byte $C0   ; 
- - - - - - 0x017CB0 05:BCA0: C1        .byte $C1   ; 
- - - - - - 0x017CB1 05:BCA1: C2        .byte $C2   ; 
- - - - - - 0x017CB2 05:BCA2: C3        .byte $C3   ; 
- - - - - - 0x017CB3 05:BCA3: C4        .byte $C4   ; 
- - - - - - 0x017CB4 05:BCA4: C5        .byte $C5   ; 
- - - - - - 0x017CB5 05:BCA5: B3        .byte $B3   ; 
- - - - - - 0x017CB6 05:BCA6: B4        .byte $B4   ; 



_off007_0x017CB7_07_area_8:
- D 1 - I - 0x017CB7 05:BCA7: 00        .byte $00   ; 
- D 1 - I - 0x017CB8 05:BCA8: 00        .byte $00   ; 
- D 1 - I - 0x017CB9 05:BCA9: 00        .byte $00   ; 
- D 1 - I - 0x017CBA 05:BCAA: 00        .byte $00   ; 
- D 1 - I - 0x017CBB 05:BCAB: 00        .byte $00   ; 
- D 1 - I - 0x017CBC 05:BCAC: 00        .byte $00   ; 
- D 1 - I - 0x017CBD 05:BCAD: 00        .byte $00   ; 
- D 1 - I - 0x017CBE 05:BCAE: 00        .byte $00   ; 
- D 1 - I - 0x017CBF 05:BCAF: 00        .byte $00   ; 
- D 1 - I - 0x017CC0 05:BCB0: 00        .byte $00   ; 
- D 1 - I - 0x017CC1 05:BCB1: 00        .byte $00   ; 
- D 1 - I - 0x017CC2 05:BCB2: 00        .byte $00   ; 
- D 1 - I - 0x017CC3 05:BCB3: 00        .byte $00   ; 
- D 1 - I - 0x017CC4 05:BCB4: 00        .byte $00   ; 
- D 1 - I - 0x017CC5 05:BCB5: 00        .byte $00   ; 
- D 1 - I - 0x017CC6 05:BCB6: 00        .byte $00   ; 
- D 1 - I - 0x017CC7 05:BCB7: 00        .byte $00   ; 
- D 1 - I - 0x017CC8 05:BCB8: 00        .byte $00   ; 
- D 1 - I - 0x017CC9 05:BCB9: 00        .byte $00   ; 
- D 1 - I - 0x017CCA 05:BCBA: 00        .byte $00   ; 
- D 1 - I - 0x017CCB 05:BCBB: 00        .byte $00   ; 
- - - - - - 0x017CCC 05:BCBC: 00        .byte $00   ; 
- D 1 - I - 0x017CCD 05:BCBD: 00        .byte $00   ; 
- D 1 - I - 0x017CCE 05:BCBE: 00        .byte $00   ; 
- D 1 - I - 0x017CCF 05:BCBF: 00        .byte $00   ; 
- D 1 - I - 0x017CD0 05:BCC0: 00        .byte $00   ; 
- D 1 - I - 0x017CD1 05:BCC1: 00        .byte $00   ; 
- - - - - - 0x017CD2 05:BCC2: 00        .byte $00   ; 
- - - - - - 0x017CD3 05:BCC3: 00        .byte $00   ; 
- D 1 - I - 0x017CD4 05:BCC4: 00        .byte $00   ; 
- D 1 - I - 0x017CD5 05:BCC5: 00        .byte $00   ; 
- D 1 - I - 0x017CD6 05:BCC6: 00        .byte $00   ; 
- D 1 - I - 0x017CD7 05:BCC7: 00        .byte $00   ; 
- D 1 - I - 0x017CD8 05:BCC8: 00        .byte $00   ; 
- D 1 - I - 0x017CD9 05:BCC9: 00        .byte $00   ; 
- D 1 - I - 0x017CDA 05:BCCA: 00        .byte $00   ; 
- D 1 - I - 0x017CDB 05:BCCB: 00        .byte $00   ; 
- D 1 - I - 0x017CDC 05:BCCC: 00        .byte $00   ; 
- D 1 - I - 0x017CDD 05:BCCD: 00        .byte $00   ; 
- D 1 - I - 0x017CDE 05:BCCE: 00        .byte $00   ; 
- - - - - - 0x017CDF 05:BCCF: 00        .byte $00   ; 
- D 1 - I - 0x017CE0 05:BCD0: 00        .byte $00   ; 
- D 1 - I - 0x017CE1 05:BCD1: 00        .byte $00   ; 
- D 1 - I - 0x017CE2 05:BCD2: 00        .byte $00   ; 
- D 1 - I - 0x017CE3 05:BCD3: 00        .byte $00   ; 
- D 1 - I - 0x017CE4 05:BCD4: 00        .byte $00   ; 
- D 1 - I - 0x017CE5 05:BCD5: 00        .byte $00   ; 
- D 1 - I - 0x017CE6 05:BCD6: 10        .byte $10   ; 
- D 1 - I - 0x017CE7 05:BCD7: 00        .byte $00   ; 
- D 1 - I - 0x017CE8 05:BCD8: 00        .byte $00   ; 
- D 1 - I - 0x017CE9 05:BCD9: 00        .byte $00   ; 
- D 1 - I - 0x017CEA 05:BCDA: 00        .byte $00   ; 
- D 1 - I - 0x017CEB 05:BCDB: 00        .byte $00   ; 
- D 1 - I - 0x017CEC 05:BCDC: 00        .byte $00   ; 
- D 1 - I - 0x017CED 05:BCDD: 00        .byte $00   ; 
- D 1 - I - 0x017CEE 05:BCDE: 00        .byte $00   ; 
- D 1 - I - 0x017CEF 05:BCDF: 00        .byte $00   ; 
- D 1 - I - 0x017CF0 05:BCE0: 00        .byte $00   ; 
- D 1 - I - 0x017CF1 05:BCE1: 00        .byte $00   ; 
- D 1 - I - 0x017CF2 05:BCE2: 00        .byte $00   ; 
- D 1 - I - 0x017CF3 05:BCE3: 00        .byte $00   ; 
- D 1 - I - 0x017CF4 05:BCE4: 00        .byte $00   ; 
- D 1 - I - 0x017CF5 05:BCE5: 00        .byte $00   ; 
- D 1 - I - 0x017CF6 05:BCE6: 00        .byte $00   ; 
- - - - - - 0x017CF7 05:BCE7: 00        .byte $00   ; 
- D 1 - I - 0x017CF8 05:BCE8: 00        .byte $00   ; 
- D 1 - I - 0x017CF9 05:BCE9: 00        .byte $00   ; 
- D 1 - I - 0x017CFA 05:BCEA: 00        .byte $00   ; 
- D 1 - I - 0x017CFB 05:BCEB: 00        .byte $00   ; 
- D 1 - I - 0x017CFC 05:BCEC: 00        .byte $00   ; 
- D 1 - I - 0x017CFD 05:BCED: 00        .byte $00   ; 
- D 1 - I - 0x017CFE 05:BCEE: 00        .byte $00   ; 
- D 1 - I - 0x017CFF 05:BCEF: 00        .byte $00   ; 
- D 1 - I - 0x017D00 05:BCF0: 00        .byte $00   ; 
- D 1 - I - 0x017D01 05:BCF1: 00        .byte $00   ; 
- D 1 - I - 0x017D02 05:BCF2: 00        .byte $00   ; 
- D 1 - I - 0x017D03 05:BCF3: 00        .byte $00   ; 
- D 1 - I - 0x017D04 05:BCF4: 00        .byte $00   ; 
- D 1 - I - 0x017D05 05:BCF5: 00        .byte $00   ; 
- D 1 - I - 0x017D06 05:BCF6: 00        .byte $00   ; 
- D 1 - I - 0x017D07 05:BCF7: 00        .byte $00   ; 
- D 1 - I - 0x017D08 05:BCF8: 00        .byte $00   ; 
- D 1 - I - 0x017D09 05:BCF9: 00        .byte $00   ; 
- D 1 - I - 0x017D0A 05:BCFA: 00        .byte $00   ; 
- D 1 - I - 0x017D0B 05:BCFB: 00        .byte $00   ; 
- D 1 - I - 0x017D0C 05:BCFC: 00        .byte $00   ; 
- D 1 - I - 0x017D0D 05:BCFD: 00        .byte $00   ; 
- D 1 - I - 0x017D0E 05:BCFE: 00        .byte $00   ; 
- D 1 - I - 0x017D0F 05:BCFF: 00        .byte $00   ; 
- D 1 - I - 0x017D10 05:BD00: 00        .byte $00   ; 
- D 1 - I - 0x017D11 05:BD01: 00        .byte $00   ; 
- D 1 - I - 0x017D12 05:BD02: 00        .byte $00   ; 
- D 1 - I - 0x017D13 05:BD03: 00        .byte $00   ; 
- D 1 - I - 0x017D14 05:BD04: 00        .byte $00   ; 
- D 1 - I - 0x017D15 05:BD05: 00        .byte $00   ; 
- D 1 - I - 0x017D16 05:BD06: 00        .byte $00   ; 
- D 1 - I - 0x017D17 05:BD07: 00        .byte $00   ; 
- D 1 - I - 0x017D18 05:BD08: 00        .byte $00   ; 
- D 1 - I - 0x017D19 05:BD09: 00        .byte $00   ; 
- D 1 - I - 0x017D1A 05:BD0A: 00        .byte $00   ; 
- - - - - - 0x017D1B 05:BD0B: 00        .byte $00   ; 
- D 1 - I - 0x017D1C 05:BD0C: 00        .byte $00   ; 
- - - - - - 0x017D1D 05:BD0D: 00        .byte $00   ; 
- D 1 - I - 0x017D1E 05:BD0E: 00        .byte $00   ; 
- - - - - - 0x017D1F 05:BD0F: 00        .byte $00   ; 
- D 1 - I - 0x017D20 05:BD10: 00        .byte $00   ; 
- D 1 - I - 0x017D21 05:BD11: 00        .byte $00   ; 
- D 1 - I - 0x017D22 05:BD12: 00        .byte $00   ; 
- D 1 - I - 0x017D23 05:BD13: 00        .byte $00   ; 
- D 1 - I - 0x017D24 05:BD14: 00        .byte $00   ; 
- D 1 - I - 0x017D25 05:BD15: 00        .byte $00   ; 
- D 1 - I - 0x017D26 05:BD16: 05        .byte $05   ; 
- D 1 - I - 0x017D27 05:BD17: 55        .byte $55   ; 
- D 1 - I - 0x017D28 05:BD18: 55        .byte $55   ; 
- D 1 - I - 0x017D29 05:BD19: 55        .byte $55   ; 
- D 1 - I - 0x017D2A 05:BD1A: 55        .byte $55   ; 
- D 1 - I - 0x017D2B 05:BD1B: 55        .byte $55   ; 
- D 1 - I - 0x017D2C 05:BD1C: 55        .byte $55   ; 
- D 1 - I - 0x017D2D 05:BD1D: 55        .byte $55   ; 
- D 1 - I - 0x017D2E 05:BD1E: 55        .byte $55   ; 
- D 1 - I - 0x017D2F 05:BD1F: 55        .byte $55   ; 
- D 1 - I - 0x017D30 05:BD20: 55        .byte $55   ; 
- D 1 - I - 0x017D31 05:BD21: 55        .byte $55   ; 
- D 1 - I - 0x017D32 05:BD22: 55        .byte $55   ; 
- D 1 - I - 0x017D33 05:BD23: 55        .byte $55   ; 
- D 1 - I - 0x017D34 05:BD24: 55        .byte $55   ; 
- D 1 - I - 0x017D35 05:BD25: 05        .byte $05   ; 
- D 1 - I - 0x017D36 05:BD26: 05        .byte $05   ; 
- D 1 - I - 0x017D37 05:BD27: 00        .byte $00   ; 
- D 1 - I - 0x017D38 05:BD28: 00        .byte $00   ; 
- D 1 - I - 0x017D39 05:BD29: 00        .byte $00   ; 
- D 1 - I - 0x017D3A 05:BD2A: 00        .byte $00   ; 
- D 1 - I - 0x017D3B 05:BD2B: 00        .byte $00   ; 
- D 1 - I - 0x017D3C 05:BD2C: 00        .byte $00   ; 
- D 1 - I - 0x017D3D 05:BD2D: 00        .byte $00   ; 
- D 1 - I - 0x017D3E 05:BD2E: 00        .byte $00   ; 
- D 1 - I - 0x017D3F 05:BD2F: 00        .byte $00   ; 
- D 1 - I - 0x017D40 05:BD30: 00        .byte $00   ; 
- D 1 - I - 0x017D41 05:BD31: 00        .byte $00   ; 
- D 1 - I - 0x017D42 05:BD32: 00        .byte $00   ; 
- D 1 - I - 0x017D43 05:BD33: 00        .byte $00   ; 
- D 1 - I - 0x017D44 05:BD34: 00        .byte $00   ; 
- D 1 - I - 0x017D45 05:BD35: 00        .byte $00   ; 
- D 1 - I - 0x017D46 05:BD36: 00        .byte $00   ; 
- D 1 - I - 0x017D47 05:BD37: 00        .byte $00   ; 
- D 1 - I - 0x017D48 05:BD38: 00        .byte $00   ; 
- D 1 - I - 0x017D49 05:BD39: 00        .byte $00   ; 
- D 1 - I - 0x017D4A 05:BD3A: 00        .byte $00   ; 
- D 1 - I - 0x017D4B 05:BD3B: 00        .byte $00   ; 
- D 1 - I - 0x017D4C 05:BD3C: 00        .byte $00   ; 
- D 1 - I - 0x017D4D 05:BD3D: 00        .byte $00   ; 
- D 1 - I - 0x017D4E 05:BD3E: 00        .byte $00   ; 
- D 1 - I - 0x017D4F 05:BD3F: 00        .byte $00   ; 
- D 1 - I - 0x017D50 05:BD40: 00        .byte $00   ; 
- D 1 - I - 0x017D51 05:BD41: 00        .byte $00   ; 
- D 1 - I - 0x017D52 05:BD42: 00        .byte $00   ; 
- D 1 - I - 0x017D53 05:BD43: 00        .byte $00   ; 
- D 1 - I - 0x017D54 05:BD44: 00        .byte $00   ; 
- D 1 - I - 0x017D55 05:BD45: 00        .byte $00   ; 
- D 1 - I - 0x017D56 05:BD46: 00        .byte $00   ; 
- D 1 - I - 0x017D57 05:BD47: 00        .byte $00   ; 
- D 1 - I - 0x017D58 05:BD48: 00        .byte $00   ; 
- D 1 - I - 0x017D59 05:BD49: 00        .byte $00   ; 
- D 1 - I - 0x017D5A 05:BD4A: 00        .byte $00   ; 
- D 1 - I - 0x017D5B 05:BD4B: 00        .byte $00   ; 
- D 1 - I - 0x017D5C 05:BD4C: 00        .byte $00   ; 
- D 1 - I - 0x017D5D 05:BD4D: 00        .byte $00   ; 
- D 1 - I - 0x017D5E 05:BD4E: 00        .byte $00   ; 
- D 1 - I - 0x017D5F 05:BD4F: 00        .byte $00   ; 
- D 1 - I - 0x017D60 05:BD50: 00        .byte $00   ; 
- D 1 - I - 0x017D61 05:BD51: 00        .byte $00   ; 
- D 1 - I - 0x017D62 05:BD52: 00        .byte $00   ; 
- D 1 - I - 0x017D63 05:BD53: 00        .byte $00   ; 
- D 1 - I - 0x017D64 05:BD54: 00        .byte $00   ; 
- D 1 - I - 0x017D65 05:BD55: 00        .byte $00   ; 
- D 1 - I - 0x017D66 05:BD56: 00        .byte $00   ; 
- D 1 - I - 0x017D67 05:BD57: 00        .byte $00   ; 
- D 1 - I - 0x017D68 05:BD58: 00        .byte $00   ; 
- D 1 - I - 0x017D69 05:BD59: 00        .byte $00   ; 
- D 1 - I - 0x017D6A 05:BD5A: 00        .byte $00   ; 
- D 1 - I - 0x017D6B 05:BD5B: 00        .byte $00   ; 
- D 1 - I - 0x017D6C 05:BD5C: 00        .byte $00   ; 
- D 1 - I - 0x017D6D 05:BD5D: 00        .byte $00   ; 
- D 1 - I - 0x017D6E 05:BD5E: 00        .byte $00   ; 
- D 1 - I - 0x017D6F 05:BD5F: 00        .byte $00   ; 
- D 1 - I - 0x017D70 05:BD60: 00        .byte $00   ; 
- D 1 - I - 0x017D71 05:BD61: 00        .byte $00   ; 
- D 1 - I - 0x017D72 05:BD62: 00        .byte $00   ; 
- D 1 - I - 0x017D73 05:BD63: 00        .byte $00   ; 
- D 1 - I - 0x017D74 05:BD64: 00        .byte $00   ; 
- D 1 - I - 0x017D75 05:BD65: 00        .byte $00   ; 
- D 1 - I - 0x017D76 05:BD66: 00        .byte $00   ; 
- D 1 - I - 0x017D77 05:BD67: 00        .byte $00   ; 
- D 1 - I - 0x017D78 05:BD68: 00        .byte $00   ; 
- D 1 - I - 0x017D79 05:BD69: 00        .byte $00   ; 
- D 1 - I - 0x017D7A 05:BD6A: 00        .byte $00   ; 
- D 1 - I - 0x017D7B 05:BD6B: 00        .byte $00   ; 
- D 1 - I - 0x017D7C 05:BD6C: 00        .byte $00   ; 
- D 1 - I - 0x017D7D 05:BD6D: 00        .byte $00   ; 
- D 1 - I - 0x017D7E 05:BD6E: 00        .byte $00   ; 
- D 1 - I - 0x017D7F 05:BD6F: 00        .byte $00   ; 
- D 1 - I - 0x017D80 05:BD70: 00        .byte $00   ; 
- D 1 - I - 0x017D81 05:BD71: 00        .byte $00   ; 
- D 1 - I - 0x017D82 05:BD72: 00        .byte $00   ; 
- D 1 - I - 0x017D83 05:BD73: 00        .byte $00   ; 
- D 1 - I - 0x017D84 05:BD74: 00        .byte $00   ; 
- D 1 - I - 0x017D85 05:BD75: 00        .byte $00   ; 
- - - - - - 0x017D86 05:BD76: 00        .byte $00   ; 
- - - - - - 0x017D87 05:BD77: 00        .byte $00   ; 
- - - - - - 0x017D88 05:BD78: 00        .byte $00   ; 
- - - - - - 0x017D89 05:BD79: 00        .byte $00   ; 
- - - - - - 0x017D8A 05:BD7A: 00        .byte $00   ; 
- - - - - - 0x017D8B 05:BD7B: 00        .byte $00   ; 
- - - - - - 0x017D8C 05:BD7C: 00        .byte $00   ; 
- D 1 - I - 0x017D8D 05:BD7D: 80        .byte $80   ; 
- D 1 - I - 0x017D8E 05:BD7E: AA        .byte $AA   ; 
- D 1 - I - 0x017D8F 05:BD7F: AA        .byte $AA   ; 
- D 1 - I - 0x017D90 05:BD80: A8        .byte $A8   ; 
- D 1 - I - 0x017D91 05:BD81: AA        .byte $AA   ; 
- D 1 - I - 0x017D92 05:BD82: AA        .byte $AA   ; 
- D 1 - I - 0x017D93 05:BD83: A0        .byte $A0   ; 
- D 1 - I - 0x017D94 05:BD84: AA        .byte $AA   ; 
- D 1 - I - 0x017D95 05:BD85: AA        .byte $AA   ; 
- D 1 - I - 0x017D96 05:BD86: AA        .byte $AA   ; 
- D 1 - I - 0x017D97 05:BD87: 88        .byte $88   ; 
- D 1 - I - 0x017D98 05:BD88: 8A        .byte $8A   ; 
- D 1 - I - 0x017D99 05:BD89: AA        .byte $AA   ; 
- D 1 - I - 0x017D9A 05:BD8A: AA        .byte $AA   ; 
- D 1 - I - 0x017D9B 05:BD8B: AA        .byte $AA   ; 
- - - - - - 0x017D9C 05:BD8C: AA        .byte $AA   ; 
- - - - - - 0x017D9D 05:BD8D: 55        .byte $55   ; 
- - - - - - 0x017D9E 05:BD8E: 55        .byte $55   ; 
- - - - - - 0x017D9F 05:BD8F: 55        .byte $55   ; 
- - - - - - 0x017DA0 05:BD90: 55        .byte $55   ; 
- - - - - - 0x017DA1 05:BD91: 55        .byte $55   ; 
- - - - - - 0x017DA2 05:BD92: 55        .byte $55   ; 
- - - - - - 0x017DA3 05:BD93: 55        .byte $55   ; 
- - - - - - 0x017DA4 05:BD94: 55        .byte $55   ; 
- - - - - - 0x017DA5 05:BD95: 55        .byte $55   ; 
- - - - - - 0x017DA6 05:BD96: 55        .byte $55   ; 


.out .sprintf("Free bytes in bank 3A: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_3Ab"
- - - - - - 0x01800F 05:BFFF: 3B        .byte con_prg_bank + $3B   ; 



