.segment "BANK_34"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x008010-0x00C00F



.export _off001_0x008011_45_spawner_red_spiked_balls
.export _off001_0x008138_46_red_spiked_ball
.export _off001_0x0081B1_2A_embryo
.export _off001_0x008216_47_cannon_skul
.export _off001_0x008299_48_bullet_cannon_skul
.export _off001_0x0082C5_49_ceiling
.export _off001_0x00847F_2B_boss_8_red_spiked_ball
.export _off001_0x0084B9_37_boss_8_blue_spiked_ball
.export _off001_0x008543_38
.export _off001_0x0085A4_6D_boss_8_eye
.export _off001_0x0088CD_6E_boss_8_small_rock
.export _off001_0x008959_3B_purple_mutant
.export _off001_0x008A4C_3C_bullet_purple_mutant
.export _off001_0x008AD4_3D_spawner_facehuggers
.export _off001_0x008BB0_3E_facehugger
.export _off001_0x008C9D_52_boss_7_chest
.export _off001_0x008DD4_53_boss_7_ear
.export _off001_0x008E18_54_boss_7_fireball
.export _off001_0x008E51_55_boss_7_red_spikeball
.export _off001_0x008EB4_56_boss_7_slime
.export _off001_0x009002_51_boss_7_mouth
.export loc_0x009158
.export loc_0x0092C0
.export _off013_0x0092D9_00_area_1
.export _off013_0x0093ED_01_area_2
.export _off013_0x009493_02_area_3
.export _off013_0x00956B_03_area_4
.export _off013_0x00977E_04_area_5
.export _off013_0x009892_05_area_6
.export _off013_0x009935_06_area_7
.export _off013_0x0099C9_07_area_8
.export loc_0x009AE9_sound_mode_handler
.export _off004_0x009FC8_00_area_1
.export _off005_0x00A002_00_area_1
.export _off006_0x00A4E8_00_area_1
.export _off007_0x00B428_00_area_1



; bzk this byte must be placed at 8000
- D 0 - - - 0x008010 02:8000: 34        .byte con_prg_bank + $34   ; 



_off001_0x008011_45_spawner_red_spiked_balls:
- D 0 - I - 0x008011 02:8001: 0D 80     .word ofs_038_45_800D_01_initialize_object ; 
- D 0 - I - 0x008013 02:8003: 35 80     .word ofs_038_45_8035_02 ; 
- D 0 - I - 0x008015 02:8005: 53 80     .word ofs_038_45_8053_03 ; 
- D 0 - I - 0x008017 02:8007: BD 80     .word ofs_038_45_80BD_04 ; 
- D 0 - I - 0x008019 02:8009: FD A2     .word ofs_038_45_0x00630D_05 ; 
- D 0 - I - 0x00801B 02:800B: 3D A3     .word ofs_038_45_0x00634D_06_delete_object_04 ; 



ofs_038_45_800D_01_initialize_object:
C - - J - - 0x00801D 02:800D: A9 0C     LDA #$0C
C - - - - - 0x00801F 02:800F: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x008022 02:8012: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x008025 02:8015: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008028 02:8018: 29 03     AND #$03
C - - - - - 0x00802A 02:801A: A8        TAY
C - - - - - 0x00802B 02:801B: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x00802E 02:801E: 18        CLC
C - - - - - 0x00802F 02:801F: 79 31 80  ADC tbl_8031,Y
C - - - - - 0x008032 02:8022: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x008035 02:8025: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x008038 02:8028: 38        SEC
C - - - - - 0x008039 02:8029: E9 08     SBC #$08
C - - - - - 0x00803B 02:802B: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x00803E 02:802E: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_8031:
- D 0 - - - 0x008041 02:8031: 04        .byte $04   ; 00 
- D 0 - - - 0x008042 02:8032: F8        .byte $F8   ; 01 
- D 0 - - - 0x008043 02:8033: FF        .byte $FF   ; 02 
- D 0 - - - 0x008044 02:8034: FC        .byte $FC   ; 03 



ofs_038_45_8035_02:
C - - J - - 0x008045 02:8035: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x008048 02:8038: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x00804B 02:803B: C9 F0     CMP #$F0
C - - - - - 0x00804D 02:803D: B0 13     BCS bra_8052_RTS
C - - - - - 0x00804F 02:803F: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008052 02:8042: C9 20     CMP #$20
C - - - - - 0x008054 02:8044: 90 0C     BCC bra_8052_RTS
C - - - - - 0x008056 02:8046: C9 D0     CMP #$D0
C - - - - - 0x008058 02:8048: B0 08     BCS bra_8052_RTS
C - - - - - 0x00805A 02:804A: A9 01     LDA #$01
C - - - - - 0x00805C 02:804C: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x00805F 02:804F: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8052_RTS:
C - - - - - 0x008062 02:8052: 60        RTS



ofs_038_45_8053_03:
C - - J - - 0x008063 02:8053: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008066 02:8056: C9 D0     CMP #$D0
C - - - - - 0x008068 02:8058: 90 03     BCC bra_805D
C - - - - - 0x00806A 02:805A: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_805D:
C - - - - - 0x00806D 02:805D: A9 01     LDA #$01
C - - - - - 0x00806F 02:805F: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x008072 02:8062: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x008075 02:8065: DE 02 07  DEC ram_0702_obj,X
C - - - - - 0x008078 02:8068: D0 E8     BNE bra_8052_RTS
C - - - - - 0x00807A 02:806A: 20 C7 80  JSR sub_80C7
C - - - - - 0x00807D 02:806D: B0 4A     BCS bra_80B9
C - - - - - 0x00807F 02:806F: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x008082 02:8072: F0 0E     BEQ bra_8082
C - - - - - 0x008084 02:8074: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x008087 02:8077: 10 3E     BPL bra_80B7
C - - - - - 0x008089 02:8079: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x00808C 02:807C: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x00808F 02:807F: 4C AF 80  JMP loc_80AF
bra_8082:
C - - - - - 0x008092 02:8082: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x008095 02:8085: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x008098 02:8088: C9 05     CMP #$05
C - - - - - 0x00809A 02:808A: A9 02     LDA #$02
C - - - - - 0x00809C 02:808C: 90 02     BCC bra_8090
C - - - - - 0x00809E 02:808E: A9 04     LDA #$04
bra_8090:
C - - - - - 0x0080A0 02:8090: DD 10 07  CMP ram_0710_obj,X
C - - - - - 0x0080A3 02:8093: D0 22     BNE bra_80B7
C - - - - - 0x0080A5 02:8095: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x0080A8 02:8098: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x0080AB 02:809B: FE 48 07  INC ram_0748_obj,X
C - - - - - 0x0080AE 02:809E: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0080B1 02:80A1: C9 06     CMP #$06
C - - - - - 0x0080B3 02:80A3: 90 0A     BCC bra_80AF
C - - - - - 0x0080B5 02:80A5: A9 00     LDA #$00
C - - - - - 0x0080B7 02:80A7: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0080BA 02:80AA: A0 46     LDY #con_obj_id_46
C - - - - - 0x0080BC 02:80AC: 20 C8 AB  JSR sub_0x006BD8
bra_80AF:
loc_80AF:
C D 0 - - - 0x0080BF 02:80AF: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0080C2 02:80B2: 49 01     EOR #$01
C - - - - - 0x0080C4 02:80B4: 9D 56 07  STA ram_0756_obj,X
bra_80B7:
C - - - - - 0x0080C7 02:80B7: A9 0A     LDA #$0A
bra_80B9:
C - - - - - 0x0080C9 02:80B9: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x0080CC 02:80BC: 60        RTS



ofs_038_45_80BD_04:
C - - J - - 0x0080CD 02:80BD: A9 04     LDA #$04
C - - - - - 0x0080CF 02:80BF: 20 CA 80  JSR sub_80CA
C - - - - - 0x0080D2 02:80C2: B0 8E     BCS bra_8052_RTS
C - - - - - 0x0080D4 02:80C4: 4C 9A A2  JMP loc_0x0062AA



sub_80C7:
C - - - - - 0x0080D7 02:80C7: BD 10 07  LDA ram_0710_obj,X
sub_80CA:
C - - - - - 0x0080DA 02:80CA: 85 0A     STA ram_000A
C - - - - - 0x0080DC 02:80CC: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0080DF 02:80CF: 29 03     AND #$03
C - - - - - 0x0080E1 02:80D1: 0A        ASL
C - - - - - 0x0080E2 02:80D2: A8        TAY
C - - - - - 0x0080E3 02:80D3: B9 FD 80  LDA tbl_80FD,Y
C - - - - - 0x0080E6 02:80D6: 85 08     STA ram_0008
C - - - - - 0x0080E8 02:80D8: B9 FE 80  LDA tbl_80FD + $01,Y
C - - - - - 0x0080EB 02:80DB: 85 09     STA ram_0009
C - - - - - 0x0080ED 02:80DD: 98        TYA
C - - - - - 0x0080EE 02:80DE: F0 13     BEQ bra_80F3
C - - - - - 0x0080F0 02:80E0: A5 0A     LDA ram_000A
C - - - - - 0x0080F2 02:80E2: 0A        ASL
C - - - - - 0x0080F3 02:80E3: A8        TAY
C - - - - - 0x0080F4 02:80E4: B1 08     LDA (ram_0008),Y
C - - - - - 0x0080F6 02:80E6: 85 0C     STA ram_000C
C - - - - - 0x0080F8 02:80E8: C8        INY
C - - - - - 0x0080F9 02:80E9: B1 08     LDA (ram_0008),Y
C - - - - - 0x0080FB 02:80EB: A0 E0     LDY #$E0
C - - - - - 0x0080FD 02:80ED: 20 A8 A8  JSR sub_0x0068B8
C - - - - - 0x008100 02:80F0: A9 01     LDA #$01
C - - - - - 0x008102 02:80F2: 60        RTS
bra_80F3:
C - - - - - 0x008103 02:80F3: A4 0A     LDY ram_000A
C - - - - - 0x008105 02:80F5: B1 08     LDA (ram_0008),Y
C - - - - - 0x008107 02:80F7: 20 9A A8  JSR sub_0x0068AA
C - - - - - 0x00810A 02:80FA: A9 01     LDA #$01
C - - - - - 0x00810C 02:80FC: 60        RTS



tbl_80FD:
- D 0 - - - 0x00810D 02:80FD: 05 81     .word off_8105_00
- D 0 - - - 0x00810F 02:80FF: 0A 81     .word off_810A_01
- D 0 - - - 0x008111 02:8101: 14 81     .word off_8114_02
- D 0 - - - 0x008113 02:8103: 1E 81     .word off_811E_03



off_8105_00:
- D 0 - I - 0x008115 02:8105: 4F        .byte $4F   ; 
- D 0 - I - 0x008116 02:8106: 60        .byte $60   ; 
- D 0 - I - 0x008117 02:8107: 61        .byte $61   ; 
- D 0 - I - 0x008118 02:8108: 62        .byte $62   ; 
- D 0 - I - 0x008119 02:8109: 0B        .byte $0B   ; 



off_810A_01:
- D 0 - I - 0x00811A 02:810A: 47        .byte $47   ; 
- D 0 - I - 0x00811B 02:810B: 4B        .byte $4B   ; 
- D 0 - I - 0x00811C 02:810C: 48        .byte $48   ; 
- D 0 - I - 0x00811D 02:810D: 4C        .byte $4C   ; 
- D 0 - I - 0x00811E 02:810E: 49        .byte $49   ; 
- D 0 - I - 0x00811F 02:810F: 4D        .byte $4D   ; 
- D 0 - I - 0x008120 02:8110: 4A        .byte $4A   ; 
- D 0 - I - 0x008121 02:8111: 4E        .byte $4E   ; 
- D 0 - I - 0x008122 02:8112: 04        .byte $04   ; 
- D 0 - I - 0x008123 02:8113: 08        .byte $08   ; 



off_8114_02:
- D 0 - I - 0x008124 02:8114: 50        .byte $50   ; 
- D 0 - I - 0x008125 02:8115: 54        .byte $54   ; 
- D 0 - I - 0x008126 02:8116: 51        .byte $51   ; 
- D 0 - I - 0x008127 02:8117: 55        .byte $55   ; 
- D 0 - I - 0x008128 02:8118: 52        .byte $52   ; 
- D 0 - I - 0x008129 02:8119: 56        .byte $56   ; 
- D 0 - I - 0x00812A 02:811A: 53        .byte $53   ; 
- D 0 - I - 0x00812B 02:811B: 57        .byte $57   ; 
- D 0 - I - 0x00812C 02:811C: 19        .byte $19   ; 
- D 0 - I - 0x00812D 02:811D: 1D        .byte $1D   ; 



off_811E_03:
- D 0 - I - 0x00812E 02:811E: 58        .byte $58   ; 
- D 0 - I - 0x00812F 02:811F: 5C        .byte $5C   ; 
- D 0 - I - 0x008130 02:8120: 59        .byte $59   ; 
- D 0 - I - 0x008131 02:8121: 5D        .byte $5D   ; 
- D 0 - I - 0x008132 02:8122: 5A        .byte $5A   ; 
- D 0 - I - 0x008133 02:8123: 5E        .byte $5E   ; 
- D 0 - I - 0x008134 02:8124: 5B        .byte $5B   ; 
- D 0 - I - 0x008135 02:8125: 5F        .byte $5F   ; 
- D 0 - I - 0x008136 02:8126: 23        .byte $23   ; 
- D 0 - I - 0x008137 02:8127: 27        .byte $27   ; 



_off001_0x008138_46_red_spiked_ball:
- D 0 - I - 0x008138 02:8128: 36 81     .word ofs_038_46_8136_01_initialize_object ; 
- D 0 - I - 0x00813A 02:812A: 4D 81     .word ofs_038_46_814D_02 ; 
- D 0 - I - 0x00813C 02:812C: 64 81     .word ofs_038_46_8164_03 ; 
- D 0 - I - 0x00813E 02:812E: 7E 81     .word ofs_038_46_817E_04 ; 
- D 0 - I - 0x008140 02:8130: 9A A2     .word ofs_038_46_0x0062AA_05 ; 
- D 0 - I - 0x008142 02:8132: FD A2     .word ofs_038_46_0x00630D_06 ; 
- D 0 - I - 0x008144 02:8134: 3D A3     .word ofs_038_46_0x00634D_07_delete_object_04 ; 



ofs_038_46_8136_01_initialize_object:
C - - J - - 0x008146 02:8136: A9 16     LDA #$16
C - - - - - 0x008148 02:8138: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x00814B 02:813B: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x00814E 02:813E: A0 00     LDY #$00
C - - - - - 0x008150 02:8140: 20 57 A9  JSR sub_0x006967
C - - - - - 0x008153 02:8143: A9 02     LDA #$02
C - - - - - 0x008155 02:8145: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x008158 02:8148: A9 40     LDA #$40
C - - - - - 0x00815A 02:814A: 4C E0 A2  JMP loc_0x0062F0



ofs_038_46_814D_02:
C - - J - - 0x00815D 02:814D: A0 16     LDY #$16
C - - - - - 0x00815F 02:814F: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008162 02:8152: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x008165 02:8155: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008168 02:8158: D0 46     BNE bra_81A0_RTS
C - - - - - 0x00816A 02:815A: A9 20     LDA #$20
C - - - - - 0x00816C 02:815C: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x00816F 02:815F: A9 20     LDA #$20
C - - - - - 0x008171 02:8161: 4C E0 A2  JMP loc_0x0062F0



ofs_038_46_8164_03:
C - - J - - 0x008174 02:8164: A0 16     LDY #$16
C - - - - - 0x008176 02:8166: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008179 02:8169: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x00817C 02:816C: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x00817F 02:816F: D0 2F     BNE bra_81A0_RTS
C - - - - - 0x008181 02:8171: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x008184 02:8174: A0 05     LDY #$05
C - - - - - 0x008186 02:8176: 20 57 A9  JSR sub_0x006967
C - - - - - 0x008189 02:8179: A9 10     LDA #$10
C - - - - - 0x00818B 02:817B: 4C E0 A2  JMP loc_0x0062F0



ofs_038_46_817E_04:
C - - J - - 0x00818E 02:817E: A0 16     LDY #$16
C - - - - - 0x008190 02:8180: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008193 02:8183: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x008196 02:8186: F0 15     BEQ bra_819D
C - - - - - 0x008198 02:8188: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x00819B 02:818B: D0 10     BNE bra_819D
C - - - - - 0x00819D 02:818D: A9 07     LDA #$07
C - - - - - 0x00819F 02:818F: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x0081A2 02:8192: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x0081A5 02:8195: A0 05     LDY #$05
C - - - - - 0x0081A7 02:8197: 20 23 A9  JSR sub_0x006933
C - - - - - 0x0081AA 02:819A: DE 56 07  DEC ram_0756_obj,X
bra_819D:
C - - - - - 0x0081AD 02:819D: 4C D3 A6  JMP loc_0x0066E3
bra_81A0_RTS:
C - - - - - 0x0081B0 02:81A0: 60        RTS



_off001_0x0081B1_2A_embryo:
- D 0 - I - 0x0081B1 02:81A1: AD 81     .word ofs_038_2A_81AD_01_initialize_object ; 
- D 0 - I - 0x0081B3 02:81A3: CC 81     .word ofs_038_2A_81CC_02 ; 
- D 0 - I - 0x0081B5 02:81A5: E7 81     .word ofs_038_2A_81E7_03 ; 
- D 0 - I - 0x0081B7 02:81A7: 9A A2     .word ofs_038_2A_0x0062AA_04 ; 
- D 0 - I - 0x0081B9 02:81A9: FD A2     .word ofs_038_2A_0x00630D_05 ; 
- D 0 - I - 0x0081BB 02:81AB: 3D A3     .word ofs_038_2A_0x00634D_06_delete_object_04 ; 



ofs_038_2A_81AD_01_initialize_object:
C - - J - - 0x0081BD 02:81AD: A9 06     LDA #$06
C - - - - - 0x0081BF 02:81AF: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0081C2 02:81B2: A9 02     LDA #$02
C - - - - - 0x0081C4 02:81B4: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0081C7 02:81B7: A9 81     LDA #$81
C - - - - - 0x0081C9 02:81B9: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0081CC 02:81BC: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0081CF 02:81BF: 4A        LSR
C - - - - - 0x0081D0 02:81C0: A9 20     LDA #$20
C - - - - - 0x0081D2 02:81C2: B0 05     BCS bra_81C9
C - - - - - 0x0081D4 02:81C4: 20 D7 A2  JSR sub_0x0062E7_increase_obj_state
C - - - - - 0x0081D7 02:81C7: A9 01     LDA #$01
bra_81C9:
C - - - - - 0x0081D9 02:81C9: 4C E0 A2  JMP loc_0x0062F0



ofs_038_2A_81CC_02:
C - - J - - 0x0081DC 02:81CC: BD E6 06  LDA ram_06E6_obj,X
C - - - - - 0x0081DF 02:81CF: 4A        LSR
C - - - - - 0x0081E0 02:81D0: 4A        LSR
C - - - - - 0x0081E1 02:81D1: A9 A8     LDA #$A8
C - - - - - 0x0081E3 02:81D3: 90 02     BCC bra_81D7
C - - - - - 0x0081E5 02:81D5: A9 00     LDA #$00
bra_81D7:
C - - - - - 0x0081E7 02:81D7: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x0081EA 02:81DA: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0081ED 02:81DD: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0081F0 02:81E0: D0 BE     BNE bra_81A0_RTS
C - - - - - 0x0081F2 02:81E2: A9 01     LDA #$01
C - - - - - 0x0081F4 02:81E4: 4C E0 A2  JMP loc_0x0062F0



ofs_038_2A_81E7_03:
C - - J - - 0x0081F7 02:81E7: A9 00     LDA #$00
C - - - - - 0x0081F9 02:81E9: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0081FC 02:81EC: A0 15     LDY #$15
C - - - - - 0x0081FE 02:81EE: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008201 02:81F1: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008204 02:81F4: D0 0D     BNE bra_8203
C - - - - - 0x008206 02:81F6: A9 07     LDA #$07
C - - - - - 0x008208 02:81F8: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x00820B 02:81FB: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x00820E 02:81FE: A0 01     LDY #$01
C - - - - - 0x008210 02:8200: 20 23 A9  JSR sub_0x006933
bra_8203:
C - - - - - 0x008213 02:8203: 4C D3 A6  JMP loc_0x0066E3



_off001_0x008216_47_cannon_skul:
- D 0 - I - 0x008216 02:8206: 10 82     .word ofs_038_47_8210_01_initialize_object ; 
- D 0 - I - 0x008218 02:8208: 34 82     .word ofs_038_47_8234_02 ; 
- D 0 - I - 0x00821A 02:820A: 7F 82     .word ofs_038_47_827F_03 ; 
- D 0 - I - 0x00821C 02:820C: FD A2     .word ofs_038_47_0x00630D_04 ; 
- D 0 - I - 0x00821E 02:820E: 3D A3     .word ofs_038_47_0x00634D_05_delete_object_04 ; 



ofs_038_47_8210_01_initialize_object:
C - - J - - 0x008220 02:8210: A9 10     LDA #$10
C - - - - - 0x008222 02:8212: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x008225 02:8215: A9 01     LDA #$01
C - - - - - 0x008227 02:8217: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x00822A 02:821A: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x00822D 02:821D: 38        SEC
C - - - - - 0x00822E 02:821E: E9 08     SBC #$08
C - - - - - 0x008230 02:8220: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x008233 02:8223: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008236 02:8226: 18        CLC
C - - - - - 0x008237 02:8227: 69 08     ADC #$08
C - - - - - 0x008239 02:8229: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x00823C 02:822C: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x00823F 02:822F: A9 10     LDA #$10
C - - - - - 0x008241 02:8231: 4C E0 A2  JMP loc_0x0062F0



ofs_038_47_8234_02:
C - - J - - 0x008244 02:8234: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008247 02:8237: C9 D0     CMP #$D0
C - - - - - 0x008249 02:8239: 90 03     BCC bra_823E
C - - - - - 0x00824B 02:823B: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_823E:
C - - - - - 0x00824E 02:823E: A9 01     LDA #$01
C - - - - - 0x008250 02:8240: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x008253 02:8243: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x008256 02:8246: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008259 02:8249: D0 31     BNE bra_827C_RTS
C - - - - - 0x00825B 02:824B: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x00825E 02:824E: B9 7D 82  LDA tbl_827D,Y
C - - - - - 0x008261 02:8251: 20 9A A8  JSR sub_0x0068AA
C - - - - - 0x008264 02:8254: A9 01     LDA #$01
C - - - - - 0x008266 02:8256: B0 21     BCS bra_8279
C - - - - - 0x008268 02:8258: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x00826B 02:825B: 49 01     EOR #$01
C - - - - - 0x00826D 02:825D: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x008270 02:8260: F0 09     BEQ bra_826B
C - - - - - 0x008272 02:8262: A0 48     LDY #con_obj_id_48
C - - - - - 0x008274 02:8264: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x008277 02:8267: A9 08     LDA #$08
C - - - - - 0x008279 02:8269: D0 0E     BNE bra_8279    ; jmp
bra_826B:
C - - - - - 0x00827B 02:826B: A9 10     LDA #$10
C - - - - - 0x00827D 02:826D: DE 56 07  DEC ram_0756_obj,X
C - - - - - 0x008280 02:8270: 10 07     BPL bra_8279
C - - - - - 0x008282 02:8272: A9 01     LDA #$01
C - - - - - 0x008284 02:8274: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x008287 02:8277: A9 50     LDA #$50
bra_8279:
C - - - - - 0x008289 02:8279: 9D E6 06  STA ram_06E6_obj,X
bra_827C_RTS:
C - - - - - 0x00828C 02:827C: 60        RTS



tbl_827D:
- D 0 - - - 0x00828D 02:827D: 6E        .byte $6E   ; 00 
- D 0 - - - 0x00828E 02:827E: 6D        .byte $6D   ; 01 



ofs_038_47_827F_03:
C - - J - - 0x00828F 02:827F: A9 6C     LDA #$6C
C - - - - - 0x008291 02:8281: 20 9A A8  JSR sub_0x0068AA
C - - - - - 0x008294 02:8284: B0 F6     BCS bra_827C_RTS
C - - - - - 0x008296 02:8286: 4C 9A A2  JMP loc_0x0062AA



_off001_0x008299_48_bullet_cannon_skul:
- D 0 - I - 0x008299 02:8289: 8D 82     .word ofs_038_48_828D_01_initialize_object ; 
- D 0 - I - 0x00829B 02:828B: A8 82     .word ofs_038_48_82A8_02 ; 



ofs_038_48_828D_01_initialize_object:
C - - J - - 0x00829D 02:828D: A9 80     LDA #$80
C - - - - - 0x00829F 02:828F: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0082A2 02:8292: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0082A5 02:8295: 18        CLC
C - - - - - 0x0082A6 02:8296: 69 04     ADC #$04
C - - - - - 0x0082A8 02:8298: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0082AB 02:829B: A9 00     LDA #< $FC00
C - - - - - 0x0082AD 02:829D: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x0082B0 02:82A0: A9 FC     LDA #> $FC00
C - - - - - 0x0082B2 02:82A2: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x0082B5 02:82A5: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_48_82A8_02:
C - - J - - 0x0082B8 02:82A8: A9 06     LDA #$06
C - - - - - 0x0082BA 02:82AA: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x0082BD 02:82AD: A9 02     LDA #$02
C - - - - - 0x0082BF 02:82AF: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0082C2 02:82B2: 4C D3 A6  JMP loc_0x0066E3



_off001_0x0082C5_49_ceiling:
- D 0 - I - 0x0082C5 02:82B5: BF 82     .word ofs_038_49_82BF_01_initialize_object ; 
- D 0 - I - 0x0082C7 02:82B7: CC 82     .word ofs_038_49_82CC_02 ; 
- D 0 - I - 0x0082C9 02:82B9: 1A 83     .word ofs_038_49_831A_03 ; 
- D 0 - I - 0x0082CB 02:82BB: 3A 83     .word ofs_038_49_833A_04 ; 
- D 0 - I - 0x0082CD 02:82BD: 57 83     .word ofs_038_49_8357_05 ; 



ofs_038_49_82BF_01_initialize_object:
C - - J - - 0x0082CF 02:82BF: A9 81     LDA #$81
C - - - - - 0x0082D1 02:82C1: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0082D4 02:82C4: A9 20     LDA #$20
C - - - - - 0x0082D6 02:82C6: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0082D9 02:82C9: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_49_82CC_02:
C - - J - - 0x0082DC 02:82CC: A5 FD     LDA ram_scroll_X
C - - - - - 0x0082DE 02:82CE: D0 49     BNE bra_8319_RTS
C - - - - - 0x0082E0 02:82D0: A9 00     LDA #$00
C - - - - - 0x0082E2 02:82D2: 85 60     STA ram_0060
C - - - - - 0x0082E4 02:82D4: 85 70     STA ram_0070
C - - - - - 0x0082E6 02:82D6: 20 7F FC  JSR sub_0x01FC8F_copy_reg_values
C - - - - - 0x0082E9 02:82D9: 20 94 AA  JSR sub_0x006AA4_save_reg_values
C - - - - - 0x0082EC 02:82DC: A9 80     LDA #$80
C - - - - - 0x0082EE 02:82DE: 85 85     STA ram_0085
C - - - - - 0x0082F0 02:82E0: A9 01     LDA #con_mirroring_H
C - - - - - 0x0082F2 02:82E2: 85 26     STA ram_for_A000
C - - - - - 0x0082F4 02:82E4: A9 06     LDA #con_irq_area_8_ceiling
C - - - - - 0x0082F6 02:82E6: 85 27     STA ram_irq_handler_hi
C - - - - - 0x0082F8 02:82E8: A9 B9     LDA #$B9
C - - - - - 0x0082FA 02:82EA: 85 45     STA ram_0045
C - - - - - 0x0082FC 02:82EC: A9 E0     LDA #$E0
C - - - - - 0x0082FE 02:82EE: 85 4A     STA ram_004A
C - - - - - 0x008300 02:82F0: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008303 02:82F3: 4A        LSR
C - - - - - 0x008304 02:82F4: A9 2E     LDA #$2E
C - - - - - 0x008306 02:82F6: A0 AA     LDY #$AA
C - - - - - 0x008308 02:82F8: 90 04     BCC bra_82FE
C - - - - - 0x00830A 02:82FA: A9 22     LDA #$22
C - - - - - 0x00830C 02:82FC: A0 A8     LDY #$A8
bra_82FE:
C - - - - - 0x00830E 02:82FE: 85 4B     STA ram_004B
C - - - - - 0x008310 02:8300: 84 FF     STY ram_for_2000
C - - - - - 0x008312 02:8302: 84 FB     STY ram_00FB
C - - - - - 0x008314 02:8304: 20 CE A9  JSR sub_0x0069DE
C - - - - - 0x008317 02:8307: A9 08     LDA #$08
C - - - - - 0x008319 02:8309: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x00831C 02:830C: A9 00     LDA #$00
C - - - - - 0x00831E 02:830E: 85 73     STA ram_0073
C - - - - - 0x008320 02:8310: 85 74     STA ram_0074
C - - - - - 0x008322 02:8312: 85 77     STA ram_0077
C - - - - - 0x008324 02:8314: 85 64     STA ram_0064
C - - - - - 0x008326 02:8316: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8319_RTS:
C - - - - - 0x008329 02:8319: 60        RTS



ofs_038_49_831A_03:
C - - J - - 0x00832A 02:831A: 20 76 83  JSR sub_8376
C - - - - - 0x00832D 02:831D: A5 60     LDA ram_0060
C - - - - - 0x00832F 02:831F: 05 70     ORA ram_0070
C - - - - - 0x008331 02:8321: D0 16     BNE bra_8339_RTS
C - - - - - 0x008333 02:8323: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x008336 02:8326: F0 05     BEQ bra_832D
C - - - - - 0x008338 02:8328: A9 00     LDA #$00
C - - - - - 0x00833A 02:832A: 85 6B     STA ram_006B
C - - - - - 0x00833C 02:832C: 60        RTS
bra_832D:
C - - - - - 0x00833D 02:832D: A9 01     LDA #$01
C - - - - - 0x00833F 02:832F: 85 85     STA ram_0085
C - - - - - 0x008341 02:8331: A9 00     LDA #$00
C - - - - - 0x008343 02:8333: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x008346 02:8336: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8339_RTS:
C - - - - - 0x008349 02:8339: 60        RTS



ofs_038_49_833A_04:
C - - J - - 0x00834A 02:833A: A9 00     LDA #$00
C - - - - - 0x00834C 02:833C: 85 9A     STA ram_009A
C - - - - - 0x00834E 02:833E: 20 8F 83  JSR sub_838F
C - - - - - 0x008351 02:8341: 20 76 83  JSR sub_8376
C - - - - - 0x008354 02:8344: BD 9C 07  LDA ram_079C_obj,X
C - - - - - 0x008357 02:8347: F0 F0     BEQ bra_8339_RTS
C - - - - - 0x008359 02:8349: C9 FE     CMP #$FE
C - - - - - 0x00835B 02:834B: B0 EC     BCS bra_8339_RTS
C - - - - - 0x00835D 02:834D: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008360 02:8350: C9 20     CMP #$20
C - - - - - 0x008362 02:8352: D0 E5     BNE bra_8339_RTS
C - - - - - 0x008364 02:8354: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_49_8357_05:
C - - J - - 0x008367 02:8357: 20 76 83  JSR sub_8376
C - - - - - 0x00836A 02:835A: A5 FD     LDA ram_scroll_X
C - - - - - 0x00836C 02:835C: D0 DB     BNE bra_8339_RTS
C - - - - - 0x00836E 02:835E: 20 A1 AA  JSR sub_0x006AB1_restore_reg_values
C - - - - - 0x008371 02:8361: A5 FD     LDA ram_scroll_X
C - - - - - 0x008373 02:8363: 85 FA     STA ram_00FA
C - - - - - 0x008375 02:8365: A9 00     LDA #$00
C - - - - - 0x008377 02:8367: 85 85     STA ram_0085
C - - - - - 0x008379 02:8369: 20 82 F1  JSR sub_0x01F192
C - - - - - 0x00837C 02:836C: E6 74     INC ram_0074
C - - - - - 0x00837E 02:836E: C6 65     DEC ram_0065
C - - - - - 0x008380 02:8370: 20 8C FC  JSR sub_0x01FC9C_increase_002B
C - - - - - 0x008383 02:8373: 4C 75 A2  JMP loc_0x006285_delete_object_02



sub_8376:
C - - - - - 0x008386 02:8376: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x008389 02:8379: 38        SEC
C - - - - - 0x00838A 02:837A: E5 62     SBC ram_cam_spd_X
C - - - - - 0x00838C 02:837C: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x00838F 02:837F: BD 9C 07  LDA ram_079C_obj,X
C - - - - - 0x008392 02:8382: E9 00     SBC #$00
C - - - - - 0x008394 02:8384: 9D 9C 07  STA ram_079C_obj,X
C - - - - - 0x008397 02:8387: 20 0A AA  JSR sub_0x006A1A
C - - - - - 0x00839A 02:838A: A5 FD     LDA ram_scroll_X
C - - - - - 0x00839C 02:838C: 85 FA     STA ram_00FA
C - - - - - 0x00839E 02:838E: 60        RTS



sub_838F:
C - - - - - 0x00839F 02:838F: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0083A2 02:8392: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x0083A5 02:8395: 9F 83     .word ofs_017_839F_00
- D 0 - I - 0x0083A7 02:8397: C9 83     .word ofs_017_83C9_01
- D 0 - I - 0x0083A9 02:8399: E6 83     .word ofs_017_83E6_02
- D 0 - I - 0x0083AB 02:839B: F4 83     .word ofs_017_83F4_03
- D 0 - I - 0x0083AD 02:839D: 3A 84     .word ofs_017_843A_04



ofs_017_839F_00:
C - - J - - 0x0083AF 02:839F: A9 10     LDA #$10
C - - - - - 0x0083B1 02:83A1: 20 CB AA  JSR sub_0x006ADB
C - - - - - 0x0083B4 02:83A4: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0083B7 02:83A7: 85 08     STA ram_0008
C - - - - - 0x0083B9 02:83A9: 20 48 84  JSR sub_8448
C - - - - - 0x0083BC 02:83AC: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0083BF 02:83AF: 38        SEC
C - - - - - 0x0083C0 02:83B0: E5 08     SBC ram_0008
C - - - - - 0x0083C2 02:83B2: 85 9A     STA ram_009A
C - - - - - 0x0083C4 02:83B4: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0083C7 02:83B7: C9 A0     CMP #$A0
C - - - - - 0x0083C9 02:83B9: 90 0D     BCC bra_83C8_RTS
C - - - - - 0x0083CB 02:83BB: A9 22     LDA #con_sound_22
C - - - - - 0x0083CD 02:83BD: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x0083D0 02:83C0: A9 20     LDA #$20
bra_83C2:
loc_83C2:
C D 0 - - - 0x0083D2 02:83C2: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x0083D5 02:83C5: FE 48 07  INC ram_0748_obj,X
bra_83C8_RTS:
C - - - - - 0x0083D8 02:83C8: 60        RTS



ofs_017_83C9_01:
C - - J - - 0x0083D9 02:83C9: BD E6 06  LDA ram_06E6_obj,X
C - - - - - 0x0083DC 02:83CC: 29 03     AND #$03
C - - - - - 0x0083DE 02:83CE: D0 0D     BNE bra_83DD
C - - - - - 0x0083E0 02:83D0: BD E6 06  LDA ram_06E6_obj,X
C - - - - - 0x0083E3 02:83D3: 4A        LSR
C - - - - - 0x0083E4 02:83D4: 29 02     AND #$02
C - - - - - 0x0083E6 02:83D6: A8        TAY
C - - - - - 0x0083E7 02:83D7: 20 5C 84  JSR sub_845C
C - - - - - 0x0083EA 02:83DA: 20 48 84  JSR sub_8448
bra_83DD:
C - - - - - 0x0083ED 02:83DD: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0083F0 02:83E0: D0 E6     BNE bra_83C8_RTS
C - - - - - 0x0083F2 02:83E2: A9 40     LDA #$40
C - - - - - 0x0083F4 02:83E4: D0 DC     BNE bra_83C2    ; jmp



ofs_017_83E6_02:
C - - J - - 0x0083F6 02:83E6: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0083F9 02:83E9: D0 DD     BNE bra_83C8_RTS
C - - - - - 0x0083FB 02:83EB: A0 04     LDY #$04
C - - - - - 0x0083FD 02:83ED: 20 5C 84  JSR sub_845C
C - - - - - 0x008400 02:83F0: FE 48 07  INC ram_0748_obj,X
C - - - - - 0x008403 02:83F3: 60        RTS



ofs_017_83F4_03:
C - - J - - 0x008404 02:83F4: 20 48 84  JSR sub_8448
C - - - - - 0x008407 02:83F7: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x00840A 02:83FA: C9 21     CMP #$21
C - - - - - 0x00840C 02:83FC: B0 CA     BCS bra_83C8_RTS
C - - - - - 0x00840E 02:83FE: A9 20     LDA #$20
C - - - - - 0x008410 02:8400: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x008413 02:8403: A9 05     LDA #$05
C - - - - - 0x008415 02:8405: 85 08     STA ram_0008
bra_8407_loop:
C - - - - - 0x008417 02:8407: A0 2A     LDY #con_obj_id_2A
C - - - - - 0x008419 02:8409: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x00841C 02:840C: 90 1B     BCC bra_8429
C - - - - - 0x00841E 02:840E: A6 11     LDX ram_0011
C - - - - - 0x008420 02:8410: A4 08     LDY ram_0008
C - - - - - 0x008422 02:8412: B9 2E 84  LDA tbl_842E_pos_Y,Y
C - - - - - 0x008425 02:8415: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x008428 02:8418: B9 34 84  LDA tbl_8434_pos_X,Y
C - - - - - 0x00842B 02:841B: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x00842E 02:841E: A9 01     LDA #$01
C - - - - - 0x008430 02:8420: 9D 1E 07  STA ram_obj_flags,X
C - - - - - 0x008433 02:8423: A6 10     LDX ram_0010
C - - - - - 0x008435 02:8425: C6 08     DEC ram_0008
C - - - - - 0x008437 02:8427: 10 DE     BPL bra_8407_loop
bra_8429:
C - - - - - 0x008439 02:8429: A9 40     LDA #$40
C - - - - - 0x00843B 02:842B: 4C C2 83  JMP loc_83C2



tbl_842E_pos_Y:
- D 0 - - - 0x00843E 02:842E: 38        .byte $38   ; 00 
- D 0 - - - 0x00843F 02:842F: 38        .byte $38   ; 01 
- D 0 - - - 0x008440 02:8430: 30        .byte $30   ; 02 
- D 0 - - - 0x008441 02:8431: 30        .byte $30   ; 03 
- D 0 - - - 0x008442 02:8432: 28        .byte $28   ; 04 
- D 0 - - - 0x008443 02:8433: 28        .byte $28   ; 05 



tbl_8434_pos_X:
- D 0 - - - 0x008444 02:8434: 30        .byte $30   ; 00 
- D 0 - - - 0x008445 02:8435: D0        .byte $D0   ; 01 
- D 0 - - - 0x008446 02:8436: 50        .byte $50   ; 02 
- D 0 - - - 0x008447 02:8437: B0        .byte $B0   ; 03 
- D 0 - - - 0x008448 02:8438: 70        .byte $70   ; 04 
- D 0 - - - 0x008449 02:8439: 90        .byte $90   ; 05 



ofs_017_843A_04:
C - - J - - 0x00844A 02:843A: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x00844D 02:843D: D0 89     BNE bra_83C8_RTS
C - - - - - 0x00844F 02:843F: 20 CA A7  JSR sub_0x0067DA_clear_spd_Y
C - - - - - 0x008452 02:8442: A9 00     LDA #$00
C - - - - - 0x008454 02:8444: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x008457 02:8447: 60        RTS



sub_8448:
C - - - - - 0x008458 02:8448: BD 84 06  LDA ram_pos_Y_lo_enemy,X
C - - - - - 0x00845B 02:844B: 18        CLC
C - - - - - 0x00845C 02:844C: 7D A0 06  ADC ram_spd_Y_lo_obj,X
C - - - - - 0x00845F 02:844F: 9D 84 06  STA ram_pos_Y_lo_enemy,X
C - - - - - 0x008462 02:8452: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008465 02:8455: 7D AE 06  ADC ram_spd_Y_hi_obj,X
C - - - - - 0x008468 02:8458: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x00846B 02:845B: 60        RTS



sub_845C:
C - - - - - 0x00846C 02:845C: B9 69 84  LDA tbl_8469_spd_Y,Y
C - - - - - 0x00846F 02:845F: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x008472 02:8462: B9 6A 84  LDA tbl_8469_spd_Y + $01,Y
C - - - - - 0x008475 02:8465: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x008478 02:8468: 60        RTS



tbl_8469_spd_Y:
- D 0 - - - 0x008479 02:8469: 00 02     .word $0200 ; 00 
- D 0 - - - 0x00847B 02:846B: 00 FE     .word $FE00 ; 02 
- D 0 - - - 0x00847D 02:846D: 00 FF     .word $FF00 ; 04 



_off001_0x00847F_2B_boss_8_red_spiked_ball:
- D 0 - I - 0x00847F 02:846F: 77 84     .word ofs_038_2B_8477_01_initialize_object ; 
- D 0 - I - 0x008481 02:8471: 92 84     .word ofs_038_2B_8492_02 ; 
- D 0 - I - 0x008483 02:8473: A0 84     .word ofs_038_2B_84A0_03 ; 
- D 0 - I - 0x008485 02:8475: 75 A2     .word ofs_038_2B_0x006285_04_delete_object_02 ; 


ofs_038_2B_8477_01_initialize_object:
C - - J - - 0x008487 02:8477: A9 80     LDA #$80
C - - - - - 0x008489 02:8479: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x00848C 02:847C: A9 F1     LDA #con__hp_F1
C - - - - - 0x00848E 02:847E: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x008491 02:8481: BC 48 07  LDY ram_0748_obj,X
C - - - - - 0x008494 02:8484: B9 8A 84  LDA tbl_848A,Y
C - - - - - 0x008497 02:8487: 4C E0 A2  JMP loc_0x0062F0



tbl_848A:
- D 0 - - - 0x00849A 02:848A: 1C        .byte $1C   ; 00 
- D 0 - - - 0x00849B 02:848B: 18        .byte $18   ; 01 
- D 0 - - - 0x00849C 02:848C: 14        .byte $14   ; 02 
- D 0 - - - 0x00849D 02:848D: 10        .byte $10   ; 03 
- D 0 - - - 0x00849E 02:848E: 0C        .byte $0C   ; 04 
- D 0 - - - 0x00849F 02:848F: 08        .byte $08   ; 05 
- D 0 - - - 0x0084A0 02:8490: 04        .byte $04   ; 06 
- D 0 - - - 0x0084A1 02:8491: 01        .byte $01   ; 07 



ofs_038_2B_8492_02:
C - - J - - 0x0084A2 02:8492: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0084A5 02:8495: D0 08     BNE bra_849F_RTS
C - - - - - 0x0084A7 02:8497: A9 02     LDA #$02
C - - - - - 0x0084A9 02:8499: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0084AC 02:849C: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_849F_RTS:
C - - - - - 0x0084AF 02:849F: 60        RTS



ofs_038_2B_84A0_03:
C - - J - - 0x0084B0 02:84A0: A0 16     LDY #$16
C - - - - - 0x0084B2 02:84A2: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x0084B5 02:84A5: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x0084B8 02:84A8: 60        RTS



_off001_0x0084B9_37_boss_8_blue_spiked_ball:
- D 0 - I - 0x0084B9 02:84A9: B5 84     .word ofs_038_37_84B5_01_initialize_object ; 
- D 0 - I - 0x0084BB 02:84AB: EE 84     .word ofs_038_37_84EE_02 ; 
- D 0 - I - 0x0084BD 02:84AD: 0B 85     .word ofs_038_37_850B_03 ; 
- D 0 - I - 0x0084BF 02:84AF: 9A A2     .word ofs_038_37_0x0062AA_04 ; 
- D 0 - I - 0x0084C1 02:84B1: FD A2     .word ofs_038_37_0x00630D_05 ; 
- D 0 - I - 0x0084C3 02:84B3: 3D A3     .word ofs_038_37_0x00634D_06_delete_object_04 ; 



ofs_038_37_84B5_01_initialize_object:
C - - J - - 0x0084C5 02:84B5: A9 03     LDA #$03
C - - - - - 0x0084C7 02:84B7: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0084CA 02:84BA: A9 B8     LDA #$B8
C - - - - - 0x0084CC 02:84BC: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0084CF 02:84BF: A9 D0     LDA #$D0
C - - - - - 0x0084D1 02:84C1: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0084D4 02:84C4: A5 23     LDA ram_0023
C - - - - - 0x0084D6 02:84C6: 29 07     AND #$07
C - - - - - 0x0084D8 02:84C8: 0A        ASL
C - - - - - 0x0084D9 02:84C9: A8        TAY
C - - - - - 0x0084DA 02:84CA: B9 13 85  LDA tbl_8513_spd_Y,Y
C - - - - - 0x0084DD 02:84CD: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x0084E0 02:84D0: B9 14 85  LDA tbl_8513_spd_Y + $01,Y
C - - - - - 0x0084E3 02:84D3: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x0084E6 02:84D6: A5 23     LDA ram_0023
C - - - - - 0x0084E8 02:84D8: 18        CLC
C - - - - - 0x0084E9 02:84D9: 65 1B     ADC ram_счетчик_кадров
C - - - - - 0x0084EB 02:84DB: 29 07     AND #$07
C - - - - - 0x0084ED 02:84DD: 0A        ASL
C - - - - - 0x0084EE 02:84DE: A8        TAY
C - - - - - 0x0084EF 02:84DF: B9 23 85  LDA tbl_8523_spd_X,Y
C - - - - - 0x0084F2 02:84E2: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x0084F5 02:84E5: B9 24 85  LDA tbl_8523_spd_X + $01,Y
C - - - - - 0x0084F8 02:84E8: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x0084FB 02:84EB: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_37_84EE_02:
C - - J - - 0x0084FE 02:84EE: A0 16     LDY #$16
C - - - - - 0x008500 02:84F0: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008503 02:84F3: A9 20     LDA #$20
C - - - - - 0x008505 02:84F5: 20 CB AA  JSR sub_0x006ADB
C - - - - - 0x008508 02:84F8: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x00850B 02:84FB: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x00850E 02:84FE: 30 0A     BMI bra_850A_RTS
C - - - - - 0x008510 02:8500: C9 01     CMP #$01
C - - - - - 0x008512 02:8502: 90 06     BCC bra_850A_RTS
C - - - - - 0x008514 02:8504: 20 D3 A7  JSR sub_0x0067E3_clear_spd_X
C - - - - - 0x008517 02:8507: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_850A_RTS:
C - - - - - 0x00851A 02:850A: 60        RTS



ofs_038_37_850B_03:
C - - J - - 0x00851B 02:850B: A0 16     LDY #$16
C - - - - - 0x00851D 02:850D: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008520 02:8510: 4C D3 A6  JMP loc_0x0066E3



tbl_8513_spd_Y:
- D 0 - - - 0x008523 02:8513: C0 F9     .word $F9C0 ; 00 
- D 0 - - - 0x008525 02:8515: 00 FA     .word $FA00 ; 01 
- D 0 - - - 0x008527 02:8517: C0 F9     .word $F9C0 ; 02 
- D 0 - - - 0x008529 02:8519: 00 FA     .word $FA00 ; 03 
- D 0 - - - 0x00852B 02:851B: C0 F9     .word $F9C0 ; 04 
- D 0 - - - 0x00852D 02:851D: 00 FA     .word $FA00 ; 05 
- D 0 - - - 0x00852F 02:851F: C0 F9     .word $F9C0 ; 06 
- D 0 - - - 0x008531 02:8521: 00 FA     .word $FA00 ; 07 



tbl_8523_spd_X:
- D 0 - - - 0x008533 02:8523: 00 FD     .word $FD00 ; 00 
- D 0 - - - 0x008535 02:8525: 30 FD     .word $FD30 ; 01 
- D 0 - - - 0x008537 02:8527: 60 FD     .word $FD60 ; 02 
- D 0 - - - 0x008539 02:8529: 90 FD     .word $FD90 ; 03 
- D 0 - - - 0x00853B 02:852B: C0 FD     .word $FDC0 ; 04 
- D 0 - - - 0x00853D 02:852D: F0 FD     .word $FDF0 ; 05 
- D 0 - - - 0x00853F 02:852F: 20 FE     .word $FE20 ; 06 
- D 0 - - - 0x008541 02:8531: 50 FE     .word $FE50 ; 07 



_off001_0x008543_38:
; bzk garbage, unused object
- - - - - - 0x008543 02:8533: 39 85     .word ofs_038_38_8539_01_initialize_object ; 
- - - - - - 0x008545 02:8535: 72 85     .word ofs_038_38_8572_02 ; 
- - - - - - 0x008547 02:8537: 75 A2     .word ofs_038_38_0x006285_03_delete_object_02 ; 



ofs_038_38_8539_01_initialize_object:
- - - - - - 0x008549 02:8539: A9 06     LDA #$06
- - - - - - 0x00854B 02:853B: 9D 08 05  STA ram_anim_id_enemy,X
- - - - - - 0x00854E 02:853E: A9 81     LDA #$81
- - - - - - 0x008550 02:8540: 9D 2C 07  STA ram_072C_obj,X
- - - - - - 0x008553 02:8543: A9 02     LDA #$02
- - - - - - 0x008555 02:8545: 9D 56 07  STA ram_0756_obj,X
- - - - - - 0x008558 02:8548: BD 48 07  LDA ram_0748_obj,X
- - - - - - 0x00855B 02:854B: 29 01     AND #$01
- - - - - - 0x00855D 02:854D: A8        TAY
- - - - - - 0x00855E 02:854E: B9 8E 85  LDA tbl_858E,Y
- - - - - - 0x008561 02:8551: 9D E6 06  STA ram_06E6_obj,X
- - - - - - 0x008564 02:8554: B9 90 85  LDA tbl_8590,Y
- - - - - - 0x008567 02:8557: 85 00     STA ram_0000
- - - - - - 0x008569 02:8559: B9 92 85  LDA tbl_8592,Y
- - - - - - 0x00856C 02:855C: BC 80 07  LDY ram_0780_obj,X
- - - - - - 0x00856F 02:855F: 18        CLC
- - - - - - 0x008570 02:8560: 79 3C 05  ADC ram_pos_X_hi_enemy,Y
- - - - - - 0x008573 02:8563: 9D 3C 05  STA ram_pos_X_hi_enemy,X
- - - - - - 0x008576 02:8566: A5 00     LDA ram_0000
- - - - - - 0x008578 02:8568: 18        CLC
- - - - - - 0x008579 02:8569: 79 22 05  ADC ram_pos_Y_hi_enemy,Y
- - - - - - 0x00857C 02:856C: 9D 22 05  STA ram_pos_Y_hi_enemy,X
- - - - - - 0x00857F 02:856F: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_38_8572_02:
- - - - - - 0x008582 02:8572: DE E6 06  DEC ram_06E6_obj,X
- - - - - - 0x008585 02:8575: D0 16     BNE bra_858D_RTS
- - - - - - 0x008587 02:8577: A0 37     LDY #con_obj_id_37
- - - - - - 0x008589 02:8579: 20 C8 AB  JSR sub_0x006BD8
- - - - - - 0x00858C 02:857C: A9 20     LDA #$20
- - - - - - 0x00858E 02:857E: DE 56 07  DEC ram_0756_obj,X
- - - - - - 0x008591 02:8581: D0 07     BNE bra_858A
- - - - - - 0x008593 02:8583: A9 02     LDA #$02
- - - - - - 0x008595 02:8585: 9D 56 07  STA ram_0756_obj,X
- - - - - - 0x008598 02:8588: A9 F0     LDA #$F0
bra_858A:
- - - - - - 0x00859A 02:858A: 9D E6 06  STA ram_06E6_obj,X
bra_858D_RTS:
- - - - - - 0x00859D 02:858D: 60        RTS



tbl_858E:
- - - - - - 0x00859E 02:858E: 80        .byte $80   ; 00 
- - - - - - 0x00859F 02:858F: C0        .byte $C0   ; 01 



tbl_8590:
- - - - - - 0x0085A0 02:8590: F0        .byte $F0   ; 00 
- - - - - - 0x0085A1 02:8591: 40        .byte $40   ; 01 



tbl_8592:
- - - - - - 0x0085A2 02:8592: 00        .byte $00   ; 00 
- - - - - - 0x0085A3 02:8593: 00        .byte $00   ; 01 



_off001_0x0085A4_6D_boss_8_eye:
- D 0 - I - 0x0085A4 02:8594: AC 85     .word ofs_038_6D_85AC_01_initialize_object ; 
- D 0 - I - 0x0085A6 02:8596: B9 85     .word ofs_038_6D_85B9_02 ; 
- D 0 - I - 0x0085A8 02:8598: D4 85     .word ofs_038_6D_85D4_03 ; 
- D 0 - I - 0x0085AA 02:859A: 02 86     .word ofs_038_6D_8602_04 ; 
- D 0 - I - 0x0085AC 02:859C: 76 86     .word ofs_038_6D_8676_05 ; 
- D 0 - I - 0x0085AE 02:859E: B3 86     .word ofs_038_6D_86B3_06 ; 
- D 0 - I - 0x0085B0 02:85A0: 07 87     .word ofs_038_6D_8707_07 ; 
- D 0 - I - 0x0085B2 02:85A2: 0D 87     .word ofs_038_6D_870D_08 ; 
- D 0 - I - 0x0085B4 02:85A4: 18 87     .word ofs_038_6D_8718_09 ; 
- D 0 - I - 0x0085B6 02:85A6: 1E 87     .word ofs_038_6D_871E_0A ; 
- D 0 - I - 0x0085B8 02:85A8: F6 A2     .word ofs_038_6D_0x006306_0B ; 
- D 0 - I - 0x0085BA 02:85AA: 37 A3     .word ofs_038_6D_0x006347_0C_delete_object_08 ; 



ofs_038_6D_85AC_01_initialize_object:
C - - J - - 0x0085BC 02:85AC: A9 91     LDA #$91
C - - - - - 0x0085BE 02:85AE: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0085C1 02:85B1: A9 F0     LDA #con__hp_F0
C - - - - - 0x0085C3 02:85B3: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x0085C6 02:85B6: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_6D_85B9_02:
C - - J - - 0x0085C9 02:85B9: A5 61     LDA ram_0061
C - - - - - 0x0085CB 02:85BB: F0 26     BEQ bra_85E3_RTS
C - - - - - 0x0085CD 02:85BD: A9 00     LDA #$00
C - - - - - 0x0085CF 02:85BF: 85 64     STA ram_0064
C - - - - - 0x0085D1 02:85C1: A9 02     LDA #$02
C - - - - - 0x0085D3 02:85C3: 85 61     STA ram_0061
C - - - - - 0x0085D5 02:85C5: A0 50     LDY #$50
C - - - - - 0x0085D7 02:85C7: 20 30 FA  JSR sub_0x01FA40
C - - - - - 0x0085DA 02:85CA: A6 10     LDX ram_0010
C - - - - - 0x0085DC 02:85CC: A9 08     LDA #$08
C - - - - - 0x0085DE 02:85CE: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0085E1 02:85D1: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_6D_85D4_03:
C - - J - - 0x0085E4 02:85D4: A5 60     LDA ram_0060
C - - - - - 0x0085E6 02:85D6: 05 70     ORA ram_0070
C - - - - - 0x0085E8 02:85D8: D0 09     BNE bra_85E3_RTS
C - - - - - 0x0085EA 02:85DA: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x0085ED 02:85DD: F0 05     BEQ bra_85E4
C - - - - - 0x0085EF 02:85DF: A9 00     LDA #$00
C - - - - - 0x0085F1 02:85E1: 85 6B     STA ram_006B
bra_85E3_RTS:
C - - - - - 0x0085F3 02:85E3: 60        RTS
bra_85E4:
C - - - - - 0x0085F4 02:85E4: A0 AC     LDY #con_F97C_colors + $AC
C - - - - - 0x0085F6 02:85E6: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x0085F9 02:85E9: A6 10     LDX ram_0010
C - - - - - 0x0085FB 02:85EB: A9 30     LDA #con_sound_30
C - - - - - 0x0085FD 02:85ED: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x008600 02:85F0: A9 01     LDA #$01
C - - - - - 0x008602 02:85F2: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x008605 02:85F5: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x008608 02:85F8: A9 00     LDA #$00
C - - - - - 0x00860A 02:85FA: 9D 1E 07  STA ram_obj_flags,X
C - - - - - 0x00860D 02:85FD: A9 40     LDA #$40
C - - - - - 0x00860F 02:85FF: 4C E0 A2  JMP loc_0x0062F0



ofs_038_6D_8602_04:
C - - J - - 0x008612 02:8602: 20 87 88  JSR sub_8887
C - - - - - 0x008615 02:8605: 20 99 88  JSR sub_8899
C - - - - - 0x008618 02:8608: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x00861B 02:860B: D0 D6     BNE bra_85E3_RTS
C - - - - - 0x00861D 02:860D: A9 02     LDA #$02
C - - - - - 0x00861F 02:860F: 85 08     STA ram_0008
bra_8611_loop:
C - - - - - 0x008621 02:8611: A0 6E     LDY #con_obj_id_6E
C - - - - - 0x008623 02:8613: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x008626 02:8616: 90 0B     BCC bra_8623
C - - - - - 0x008628 02:8618: A4 11     LDY ram_0011
C - - - - - 0x00862A 02:861A: A5 08     LDA ram_0008
C - - - - - 0x00862C 02:861C: 99 48 07  STA ram_0748_obj,Y
C - - - - - 0x00862F 02:861F: C6 08     DEC ram_0008
C - - - - - 0x008631 02:8621: 10 EE     BPL bra_8611_loop
bra_8623:
C - - - - - 0x008633 02:8623: 20 4C 88  JSR sub_884C
C - - - - - 0x008636 02:8626: A9 10     LDA #$10
C - - - - - 0x008638 02:8628: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x00863B 02:862B: FE 1E 07  INC ram_obj_flags,X
C - - - - - 0x00863E 02:862E: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008641 02:8631: C9 14     CMP #$14
C - - - - - 0x008643 02:8633: 90 AE     BCC bra_85E3_RTS
C - - - - - 0x008645 02:8635: A9 01     LDA #con_mirroring_H
C - - - - - 0x008647 02:8637: 85 26     STA ram_for_A000
C - - - - - 0x008649 02:8639: A9 C8     LDA #$C8
C - - - - - 0x00864B 02:863B: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x00864E 02:863E: A9 58     LDA #$58
C - - - - - 0x008650 02:8640: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x008653 02:8643: A9 01     LDA #$01
C - - - - - 0x008655 02:8645: 9D 8E 07  STA ram_078E_obj,X
C - - - - - 0x008658 02:8648: A9 00     LDA #$00
C - - - - - 0x00865A 02:864A: 85 FD     STA ram_scroll_X
C - - - - - 0x00865C 02:864C: 85 FC     STA ram_scroll_Y
C - - - - - 0x00865E 02:864E: A9 A8     LDA #$A8
C - - - - - 0x008660 02:8650: 85 FF     STA ram_for_2000
C - - - - - 0x008662 02:8652: 20 7F FC  JSR sub_0x01FC8F_copy_reg_values
C - - - - - 0x008665 02:8655: A9 0D     LDA #con_irq_area_8_boss
C - - - - - 0x008667 02:8657: 85 27     STA ram_irq_handler_hi
C - - - - - 0x008669 02:8659: 20 9F 88  JSR sub_889F
C - - - - - 0x00866C 02:865C: 20 CE A9  JSR sub_0x0069DE
C - - - - - 0x00866F 02:865F: A9 00     LDA #$00
C - - - - - 0x008671 02:8661: 9D 8E 07  STA ram_078E_obj,X
C - - - - - 0x008674 02:8664: A9 E0     LDA #$E0
C - - - - - 0x008676 02:8666: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x008679 02:8669: 20 9C 88  JSR sub_889C
C - - - - - 0x00867C 02:866C: A0 00     LDY #$00
C - - - - - 0x00867E 02:866E: 20 3B 88  JSR sub_883B
C - - - - - 0x008681 02:8671: A9 40     LDA #$40
C - - - - - 0x008683 02:8673: 4C E0 A2  JMP loc_0x0062F0



ofs_038_6D_8676_05:
C - - J - - 0x008686 02:8676: A9 01     LDA #$01
C - - - - - 0x008688 02:8678: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x00868B 02:867B: 20 90 88  JSR sub_8890
C - - - - - 0x00868E 02:867E: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008691 02:8681: C9 5A     CMP #$5A
C - - - - - 0x008693 02:8683: 90 19     BCC bra_869E
C - - - - - 0x008695 02:8685: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008698 02:8688: D0 13     BNE bra_869D_RTS
C - - - - - 0x00869A 02:868A: A9 01     LDA #$01
C - - - - - 0x00869C 02:868C: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x00869F 02:868F: A0 6E     LDY #con_obj_id_6E
C - - - - - 0x0086A1 02:8691: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x0086A4 02:8694: 90 07     BCC bra_869D_RTS
C - - - - - 0x0086A6 02:8696: A4 11     LDY ram_0011
C - - - - - 0x0086A8 02:8698: A9 01     LDA #$01
C - - - - - 0x0086AA 02:869A: 99 56 07  STA ram_0756_obj,Y
bra_869D_RTS:
C - - - - - 0x0086AD 02:869D: 60        RTS
bra_869E:
C - - - - - 0x0086AE 02:869E: A9 30     LDA #$30
C - - - - - 0x0086B0 02:86A0: 20 99 AB  JSR sub_0x006BA9_set_dynamic_hp_to_boss
C - - - - - 0x0086B3 02:86A3: A9 10     LDA #$10
C - - - - - 0x0086B5 02:86A5: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0086B8 02:86A8: 20 32 88  JSR sub_8832
C - - - - - 0x0086BB 02:86AB: 20 CA A7  JSR sub_0x0067DA_clear_spd_Y
C - - - - - 0x0086BE 02:86AE: A9 20     LDA #$20
C - - - - - 0x0086C0 02:86B0: 4C E0 A2  JMP loc_0x0062F0



ofs_038_6D_86B3_06:
; something during final boss spawn
C - - J - - 0x0086C3 02:86B3: 20 99 88  JSR sub_8899
C - - - - - 0x0086C6 02:86B6: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0086C9 02:86B9: D0 E2     BNE bra_869D_RTS
C - - - - - 0x0086CB 02:86BB: A4 1E     LDY ram_index_ppu_buffer
C - - - - - 0x0086CD 02:86BD: A9 06     LDA #con_buf_mode_06
C - - - - - 0x0086CF 02:86BF: 99 00 03  STA ram_nmt_buffer,Y
C - - - - - 0x0086D2 02:86C2: A9 2D     LDA #> $2DD6
C - - - - - 0x0086D4 02:86C4: 99 01 03  STA ram_nmt_buffer + $01,Y  ; ppu hi
C - - - - - 0x0086D7 02:86C7: A9 D6     LDA #< $2DD6
C - - - - - 0x0086D9 02:86C9: 99 02 03  STA ram_nmt_buffer + $02,Y  ; ppu lo
C - - - - - 0x0086DC 02:86CC: A9 02     LDA #$02    ; tiles counter
C - - - - - 0x0086DE 02:86CE: 99 03 03  STA ram_nmt_buffer + $03,Y
C - - - - - 0x0086E1 02:86D1: A9 B9     LDA #$B9    ; tile
C - - - - - 0x0086E3 02:86D3: 99 04 03  STA ram_nmt_buffer + $04,Y
C - - - - - 0x0086E6 02:86D6: A9 BA     LDA #$BA    ; tile
C - - - - - 0x0086E8 02:86D8: 99 05 03  STA ram_nmt_buffer + $05,Y
C - - - - - 0x0086EB 02:86DB: A9 FF     LDA #$FF    ; close buffer
C - - - - - 0x0086ED 02:86DD: 99 06 03  STA ram_nmt_buffer + $06,Y
C - - - - - 0x0086F0 02:86E0: 98        TYA
C - - - - - 0x0086F1 02:86E1: 18        CLC
C - - - - - 0x0086F2 02:86E2: 69 07     ADC #$07
C - - - - - 0x0086F4 02:86E4: 85 1E     STA ram_index_ppu_buffer
C - - - - - 0x0086F6 02:86E6: A0 B0     LDY #con_F97C_colors + $B0
C - - - - - 0x0086F8 02:86E8: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x0086FB 02:86EB: A6 10     LDX ram_0010
C - - - - - 0x0086FD 02:86ED: A9 20     LDA #$20
C - - - - - 0x0086FF 02:86EF: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x008702 02:86F2: A9 00     LDA #$00
C - - - - - 0x008704 02:86F4: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x008707 02:86F7: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x00870A 02:86FA: A9 06     LDA #$06
C - - - - - 0x00870C 02:86FC: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x00870F 02:86FF: A9 30     LDA #$30
C - - - - - 0x008711 02:8701: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x008714 02:8704: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_6D_8707_07:
C - - J - - 0x008717 02:8707: 20 27 87  JSR sub_8727
C - - - - - 0x00871A 02:870A: 4C 99 88  JMP loc_8899



ofs_038_6D_870D_08:
C - - J - - 0x00871D 02:870D: A0 02     LDY #$02
C - - - - - 0x00871F 02:870F: 20 3B 88  JSR sub_883B
C - - - - - 0x008722 02:8712: 20 90 88  JSR sub_8890
C - - - - - 0x008725 02:8715: 4C B8 A3  JMP loc_0x0063C8



ofs_038_6D_8718_09:
C - - J - - 0x008728 02:8718: 20 90 88  JSR sub_8890
C - - - - - 0x00872B 02:871B: 4C D8 A3  JMP loc_0x0063E8



ofs_038_6D_871E_0A:
C - - J - - 0x00872E 02:871E: 20 8C FC  JSR sub_0x01FC9C_increase_002B
C - - - - - 0x008731 02:8721: 20 32 88  JSR sub_8832
C - - - - - 0x008734 02:8724: 4C A2 A2  JMP loc_0x0062B2



sub_8727:
C - - - - - 0x008737 02:8727: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x00873A 02:872A: D0 20     BNE bra_874C
C - - - - - 0x00873C 02:872C: FE 72 07  INC ram_0772_obj,X
C - - - - - 0x00873F 02:872F: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x008742 02:8732: C9 0A     CMP #$0A
C - - - - - 0x008744 02:8734: A9 14     LDA #$14
C - - - - - 0x008746 02:8736: 90 07     BCC bra_873F
C - - - - - 0x008748 02:8738: A9 00     LDA #$00
C - - - - - 0x00874A 02:873A: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x00874D 02:873D: A9 80     LDA #$80
bra_873F:
C - - - - - 0x00874F 02:873F: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x008752 02:8742: A0 37     LDY #$37
C - - - - - 0x008754 02:8744: 84 17     STY ram_0017
C - - - - - 0x008756 02:8746: 20 08 F7  JSR sub_0x01F718_try_to_find_free_object
C - - - - - 0x008759 02:8749: 20 CD AB  JSR sub_0x006BDD
bra_874C:
C - - - - - 0x00875C 02:874C: BD F4 06  LDA ram_06F4_obj,X
C - - - - - 0x00875F 02:874F: F0 08     BEQ bra_8759
C - - - - - 0x008761 02:8751: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x008764 02:8754: D0 03     BNE bra_8759
C - - - - - 0x008766 02:8756: 20 F7 87  JSR sub_87F7
bra_8759:
C - - - - - 0x008769 02:8759: DE 02 07  DEC ram_0702_obj,X
C - - - - - 0x00876C 02:875C: D0 45     BNE bra_87A3_RTS
C - - - - - 0x00876E 02:875E: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x008771 02:8761: D0 24     BNE bra_8787
C - - - - - 0x008773 02:8763: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x008776 02:8766: 20 A4 87  JSR sub_87A4
C - - - - - 0x008779 02:8769: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x00877C 02:876C: C9 02     CMP #$02
C - - - - - 0x00877E 02:876E: A9 08     LDA #$08
C - - - - - 0x008780 02:8770: 90 2E     BCC bra_87A0
C - - - - - 0x008782 02:8772: A9 10     LDA #$10
C - - - - - 0x008784 02:8774: DE 56 07  DEC ram_0756_obj,X
C - - - - - 0x008787 02:8777: D0 1D     BNE bra_8796
C - - - - - 0x008789 02:8779: A9 04     LDA #$04
C - - - - - 0x00878B 02:877B: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x00878E 02:877E: A9 06     LDA #$06
C - - - - - 0x008790 02:8780: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x008793 02:8783: A9 40     LDA #$40
C - - - - - 0x008795 02:8785: D0 0F     BNE bra_8796    ; jmp
bra_8787:
C - - - - - 0x008797 02:8787: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x00879A 02:878A: 20 A4 87  JSR sub_87A4
C - - - - - 0x00879D 02:878D: A9 08     LDA #$08
C - - - - - 0x00879F 02:878F: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x0087A2 02:8792: D0 0C     BNE bra_87A0
C - - - - - 0x0087A4 02:8794: A9 10     LDA #$10
bra_8796:
C - - - - - 0x0087A6 02:8796: A8        TAY
C - - - - - 0x0087A7 02:8797: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x0087AA 02:879A: 49 01     EOR #$01
C - - - - - 0x0087AC 02:879C: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0087AF 02:879F: 98        TYA
bra_87A0:
C - - - - - 0x0087B0 02:87A0: 9D 02 07  STA ram_0702_obj,X
bra_87A3_RTS:
C - - - - - 0x0087B3 02:87A3: 60        RTS



sub_87A4:
C - - - - - 0x0087B4 02:87A4: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x0087B7 02:87A7: C9 03     CMP #$03
C - - - - - 0x0087B9 02:87A9: 90 02     BCC bra_87AD
- - - - - - 0x0087BB 02:87AB: A9 02     LDA #$01 * $02
bra_87AD:
C - - - - - 0x0087BD 02:87AD: 0A        ASL
C - - - - - 0x0087BE 02:87AE: A8        TAY
C - - - - - 0x0087BF 02:87AF: B9 CD 87  LDA tbl_87CD,Y
C - - - - - 0x0087C2 02:87B2: 85 08     STA ram_0008
C - - - - - 0x0087C4 02:87B4: B9 CE 87  LDA tbl_87CD + $01,Y
C - - - - - 0x0087C7 02:87B7: 85 09     STA ram_0009
C - - - - - 0x0087C9 02:87B9: A0 00     LDY #$00
C - - - - - 0x0087CB 02:87BB: A6 1E     LDX ram_index_ppu_buffer
bra_87BD_loop:
C - - - - - 0x0087CD 02:87BD: B1 08     LDA (ram_0008),Y
C - - - - - 0x0087CF 02:87BF: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0087D2 02:87C2: C8        INY
C - - - - - 0x0087D3 02:87C3: E8        INX
C - - - - - 0x0087D4 02:87C4: C9 FF     CMP #$FF
C - - - - - 0x0087D6 02:87C6: D0 F5     BNE bra_87BD_loop
C - - - - - 0x0087D8 02:87C8: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x0087DA 02:87CA: A6 10     LDX ram_0010
C - - - - - 0x0087DC 02:87CC: 60        RTS



tbl_87CD:
- D 0 - - - 0x0087DD 02:87CD: D3 87     .word off_87D3_00
- D 0 - - - 0x0087DF 02:87CF: DF 87     .word off_87DF_01
- D 0 - - - 0x0087E1 02:87D1: EB 87     .word off_87EB_02



off_87D3_00:
- D 0 - I - 0x0087E3 02:87D3: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x0087E4 02:87D4: 2D 58     .dbyt $2D58 ; ppu address
- D 0 - I - 0x0087E6 02:87D6: 02        .byte $02   ; counter
- D 0 - I - 0x0087E7 02:87D7: 0D        .byte $0D, $0E   ; tiles

- D 0 - I - 0x0087E9 02:87D9: 2D 78     .dbyt $2D78 ; ppu address
- D 0 - I - 0x0087EB 02:87DB: 02        .byte $02   ; counter
- D 0 - I - 0x0087EC 02:87DC: 16        .byte $16, $17   ; tiles

- D 0 - I - 0x0087EE 02:87DE: FF        .byte $FF   ; end token



off_87DF_01:
- D 0 - I - 0x0087EF 02:87DF: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x0087F0 02:87E0: 2D 58     .dbyt $2D58 ; ppu address
- D 0 - I - 0x0087F2 02:87E2: 02        .byte $02   ; counter
- D 0 - I - 0x0087F3 02:87E3: C6        .byte $C6, $C7   ; tiles

- D 0 - I - 0x0087F5 02:87E5: 2D 78     .dbyt $2D78 ; ppu address
- D 0 - I - 0x0087F7 02:87E7: 02        .byte $02   ; counter
- D 0 - I - 0x0087F8 02:87E8: C8        .byte $C8, $C9   ; tiles

- D 0 - I - 0x0087FA 02:87EA: FF        .byte $FF   ; end token



off_87EB_02:
- D 0 - I - 0x0087FB 02:87EB: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x0087FC 02:87EC: 2D 58     .dbyt $2D58 ; ppu address
- D 0 - I - 0x0087FE 02:87EE: 02        .byte $02   ; counter
- D 0 - I - 0x0087FF 02:87EF: CA        .byte $CA, $CB   ; tiles

- D 0 - I - 0x008801 02:87F1: 2D 78     .dbyt $2D78 ; ppu address
- D 0 - I - 0x008803 02:87F3: 02        .byte $02   ; counter
- D 0 - I - 0x008804 02:87F4: CC        .byte $CC, $CD   ; tiles

- D 0 - I - 0x008806 02:87F6: FF        .byte $FF   ; end token



sub_87F7:
C - - - - - 0x008807 02:87F7: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x00880A 02:87FA: A0 05     LDY #$05
C - - - - - 0x00880C 02:87FC: 20 57 A9  JSR sub_0x006967
C - - - - - 0x00880F 02:87FF: A0 07     LDY #$07
bra_8801_loop:
C - - - - - 0x008811 02:8801: 84 08     STY ram_0008
C - - - - - 0x008813 02:8803: A9 2B     LDA #con_obj_id_2B
; bzk optimize, load into Y directly
C - - - - - 0x008815 02:8805: A8        TAY
C - - - - - 0x008816 02:8806: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x008819 02:8809: 90 24     BCC bra_882F
C - - - - - 0x00881B 02:880B: A4 11     LDY ram_0011
C - - - - - 0x00881D 02:880D: A5 08     LDA ram_0008
C - - - - - 0x00881F 02:880F: 99 48 07  STA ram_0748_obj,Y
C - - - - - 0x008822 02:8812: BD A0 06  LDA ram_spd_Y_lo_obj,X
C - - - - - 0x008825 02:8815: 99 A0 06  STA ram_spd_Y_lo_obj,Y
C - - - - - 0x008828 02:8818: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x00882B 02:881B: 99 AE 06  STA ram_spd_Y_hi_obj,Y
C - - - - - 0x00882E 02:881E: BD BC 06  LDA ram_spd_X_lo_obj,X
C - - - - - 0x008831 02:8821: 99 BC 06  STA ram_spd_X_lo_obj,Y
C - - - - - 0x008834 02:8824: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x008837 02:8827: 99 CA 06  STA ram_spd_X_hi_obj,Y
C - - - - - 0x00883A 02:882A: A4 08     LDY ram_0008
C - - - - - 0x00883C 02:882C: 88        DEY
C - - - - - 0x00883D 02:882D: 10 D2     BPL bra_8801_loop
bra_882F:
C - - - - - 0x00883F 02:882F: 4C C7 A7  JMP loc_0x0067D7_clear_spd_XY



sub_8832:
C - - - - - 0x008842 02:8832: A9 00     LDA #$00
C - - - - - 0x008844 02:8834: 85 FD     STA ram_scroll_X
C - - - - - 0x008846 02:8836: 85 FA     STA ram_00FA
C - - - - - 0x008848 02:8838: 85 FC     STA ram_scroll_Y
C - - - - - 0x00884A 02:883A: 60        RTS



sub_883B:
C - - - - - 0x00884B 02:883B: B9 48 88  LDA tbl_8848_spd_Y,Y
C - - - - - 0x00884E 02:883E: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x008851 02:8841: B9 49 88  LDA tbl_8848_spd_Y + $01,Y
C - - - - - 0x008854 02:8844: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x008857 02:8847: 60        RTS



tbl_8848_spd_Y:
- D 0 - - - 0x008858 02:8848: C0 FF     .word $FFC0 ; 00 
- D 0 - - - 0x00885A 02:884A: 40 00     .word $0040 ; 01 



sub_884C:
C - - - - - 0x00885C 02:884C: A9 00     LDA #$00
C - - - - - 0x00885E 02:884E: 85 00     STA ram_0000
C - - - - - 0x008860 02:8850: A4 1E     LDY ram_index_ppu_buffer
C - - - - - 0x008862 02:8852: A9 03     LDA #con_buf_mode_03
C - - - - - 0x008864 02:8854: 99 00 03  STA ram_nmt_buffer,Y
C - - - - - 0x008867 02:8857: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x00886A 02:885A: 0A        ASL
C - - - - - 0x00886B 02:885B: 26 00     ROL ram_0000
C - - - - - 0x00886D 02:885D: 0A        ASL
C - - - - - 0x00886E 02:885E: 26 00     ROL ram_0000
C - - - - - 0x008870 02:8860: 0A        ASL
C - - - - - 0x008871 02:8861: 26 00     ROL ram_0000
C - - - - - 0x008873 02:8863: 0A        ASL
C - - - - - 0x008874 02:8864: 26 00     ROL ram_0000
C - - - - - 0x008876 02:8866: 0A        ASL
C - - - - - 0x008877 02:8867: 26 00     ROL ram_0000
C - - - - - 0x008879 02:8869: 18        CLC
C - - - - - 0x00887A 02:886A: 69 9C     ADC #< $209C
C - - - - - 0x00887C 02:886C: 99 02 03  STA ram_nmt_buffer + $02,Y  ; ppu hi
C - - - - - 0x00887F 02:886F: A5 00     LDA ram_0000
C - - - - - 0x008881 02:8871: 69 20     ADC #> $209C
C - - - - - 0x008883 02:8873: 99 01 03  STA ram_nmt_buffer + $01,Y  ; ppu lo
C - - - - - 0x008886 02:8876: A9 04     LDA #$04    ; counter
C - - - - - 0x008888 02:8878: 99 03 03  STA ram_nmt_buffer + $03,Y
C - - - - - 0x00888B 02:887B: A9 00     LDA #$00    ; fill tile
C - - - - - 0x00888D 02:887D: 99 04 03  STA ram_nmt_buffer + $04,Y
C - - - - - 0x008890 02:8880: 98        TYA
C - - - - - 0x008891 02:8881: 18        CLC
C - - - - - 0x008892 02:8882: 69 05     ADC #$05
C - - - - - 0x008894 02:8884: 85 1E     STA ram_index_ppu_buffer
C - - - - - 0x008896 02:8886: 60        RTS



sub_8887:
C - - - - - 0x008897 02:8887: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x00889A 02:888A: F0 03     BEQ bra_888F_RTS
C - - - - - 0x00889C 02:888C: 4C 6B AB  JMP loc_0x006B7B
bra_888F_RTS:
C - - - - - 0x00889F 02:888F: 60        RTS



sub_8890:
C - - - - - 0x0088A0 02:8890: 20 87 88  JSR sub_8887
C - - - - - 0x0088A3 02:8893: 20 4F A7  JSR sub_0x00675F
C - - - - - 0x0088A6 02:8896: 4C 9C 88  JMP loc_889C



sub_8899:
loc_8899:
C D 0 - - - 0x0088A9 02:8899: 20 5D A7  JSR sub_0x00676D
sub_889C:
loc_889C:
C D 0 - - - 0x0088AC 02:889C: 20 4F AA  JSR sub_0x006A5F
sub_889F:
C - - - - - 0x0088AF 02:889F: A9 F0     LDA #$F0
C - - - - - 0x0088B1 02:88A1: 38        SEC
C - - - - - 0x0088B2 02:88A2: E5 F9     SBC ram_00F9
C - - - - - 0x0088B4 02:88A4: 18        CLC
C - - - - - 0x0088B5 02:88A5: 69 31     ADC #$31
C - - - - - 0x0088B7 02:88A7: 85 45     STA ram_0045
C - - - - - 0x0088B9 02:88A9: A9 05     LDA #$05
C - - - - - 0x0088BB 02:88AB: 85 46     STA ram_0046
C - - - - - 0x0088BD 02:88AD: A9 BA     LDA #$BA
C - - - - - 0x0088BF 02:88AF: 38        SEC
C - - - - - 0x0088C0 02:88B0: E5 45     SBC ram_0045
C - - - - - 0x0088C2 02:88B2: 85 47     STA ram_0047
C - - - - - 0x0088C4 02:88B4: A9 C0     LDA #$C0
C - - - - - 0x0088C6 02:88B6: 85 4A     STA ram_004A
C - - - - - 0x0088C8 02:88B8: A9 2C     LDA #$2C
C - - - - - 0x0088CA 02:88BA: 85 4B     STA ram_004B
C - - - - - 0x0088CC 02:88BC: 60        RTS



_off001_0x0088CD_6E_boss_8_small_rock:
- D 0 - I - 0x0088CD 02:88BD: C1 88     .word ofs_038_6E_88C1_01_initialize_object ; 
- D 0 - I - 0x0088CF 02:88BF: 33 89     .word ofs_038_6E_8933_02 ; 



ofs_038_6E_88C1_01_initialize_object:
C - - J - - 0x0088D1 02:88C1: A9 80     LDA #$80
C - - - - - 0x0088D3 02:88C3: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0088D6 02:88C6: A9 03     LDA #$03
C - - - - - 0x0088D8 02:88C8: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0088DB 02:88CB: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0088DE 02:88CE: D0 1A     BNE bra_88EA
C - - - - - 0x0088E0 02:88D0: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0088E3 02:88D3: 0A        ASL
C - - - - - 0x0088E4 02:88D4: 0A        ASL
C - - - - - 0x0088E5 02:88D5: 0A        ASL
C - - - - - 0x0088E6 02:88D6: 69 24     ADC #$24
C - - - - - 0x0088E8 02:88D8: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0088EB 02:88DB: BC 48 07  LDY ram_0748_obj,X
C - - - - - 0x0088EE 02:88DE: B9 21 89  LDA tbl_8921_pos_X,Y
C - - - - - 0x0088F1 02:88E1: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0088F4 02:88E4: B9 24 89  LDA tbl_8924,Y
C - - - - - 0x0088F7 02:88E7: 4C E0 A2  JMP loc_0x0062F0
bra_88EA:
C - - - - - 0x0088FA 02:88EA: A9 C0     LDA #$C0
C - - - - - 0x0088FC 02:88EC: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0088FF 02:88EF: A5 23     LDA ram_0023
C - - - - - 0x008901 02:88F1: 29 78     AND #$78
C - - - - - 0x008903 02:88F3: 09 80     ORA #$80
C - - - - - 0x008905 02:88F5: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x008908 02:88F8: A5 23     LDA ram_0023
C - - - - - 0x00890A 02:88FA: 29 03     AND #$03
C - - - - - 0x00890C 02:88FC: 0A        ASL
C - - - - - 0x00890D 02:88FD: A8        TAY
C - - - - - 0x00890E 02:88FE: B9 27 89  LDA tbl_8927_spd_Y,Y
C - - - - - 0x008911 02:8901: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x008914 02:8904: B9 28 89  LDA tbl_8927_spd_Y + $01,Y
C - - - - - 0x008917 02:8907: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x00891A 02:890A: A5 23     LDA ram_0023
C - - - - - 0x00891C 02:890C: 30 10     BMI bra_891E
C - - - - - 0x00891E 02:890E: 29 04     AND #$04
C - - - - - 0x008920 02:8910: 4A        LSR
C - - - - - 0x008921 02:8911: A8        TAY
C - - - - - 0x008922 02:8912: B9 2F 89  LDA tbl_892F_spd_X,Y
C - - - - - 0x008925 02:8915: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x008928 02:8918: B9 30 89  LDA tbl_892F_spd_X + $01,Y
C - - - - - 0x00892B 02:891B: 9D CA 06  STA ram_spd_X_hi_obj,X
bra_891E:
C - - - - - 0x00892E 02:891E: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_8921_pos_X:
- D 0 - - - 0x008931 02:8921: E8        .byte $E8   ; 00 
- D 0 - - - 0x008932 02:8922: F0        .byte $F0   ; 01 
- D 0 - - - 0x008933 02:8923: F8        .byte $F8   ; 02 



tbl_8924:
- D 0 - - - 0x008934 02:8924: 00        .byte $00   ; 00 
- D 0 - - - 0x008935 02:8925: 06        .byte $06   ; 01 
- D 0 - - - 0x008936 02:8926: 03        .byte $03   ; 02 



tbl_8927_spd_Y:
- D 0 - - - 0x008937 02:8927: 00 FF     .word $FF00 ; 00 
- D 0 - - - 0x008939 02:8929: C0 FE     .word $FEC0 ; 01 
- D 0 - - - 0x00893B 02:892B: 40 FF     .word $FF40 ; 02 
- D 0 - - - 0x00893D 02:892D: 80 FF     .word $FF80 ; 03 



tbl_892F_spd_X:
; bzk it may look like there should be 4 more bytes,
; but no reads were logged below it.
; it just works
- D 0 - - - 0x00893F 02:892F: 40 00     .word $0040 ; 00 
- D 0 - - - 0x008941 02:8931: C0 FF     .word $FFC0 ; 04 



ofs_038_6E_8933_02:
C - - J - - 0x008943 02:8933: BD E6 06  LDA ram_06E6_obj,X
C - - - - - 0x008946 02:8936: F0 04     BEQ bra_893C
C - - - - - 0x008948 02:8938: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x00894B 02:893B: 60        RTS
bra_893C:
C - - - - - 0x00894C 02:893C: A0 17     LDY #$17
C - - - - - 0x00894E 02:893E: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008951 02:8941: A9 20     LDA #$20
C - - - - - 0x008953 02:8943: 20 CB AA  JSR sub_0x006ADB
C - - - - - 0x008956 02:8946: 4C D3 A6  JMP loc_0x0066E3



_off001_0x008959_3B_purple_mutant:
- D 0 - I - 0x008959 02:8949: 55 89     .word ofs_038_3B_8955_01_initialize_object ; 
- D 0 - I - 0x00895B 02:894B: 6A 89     .word ofs_038_3B_896A_02 ; 
- D 0 - I - 0x00895D 02:894D: 83 89     .word ofs_038_3B_8983_03 ; 
- D 0 - I - 0x00895F 02:894F: 9A A2     .word ofs_038_3B_0x0062AA_04 ; 
- D 0 - I - 0x008961 02:8951: FD A2     .word ofs_038_3B_0x00630D_05 ; 
- D 0 - I - 0x008963 02:8953: 3D A3     .word ofs_038_3B_0x00634D_06_delete_object_04 ; 



ofs_038_3B_8955_01_initialize_object:
C - - J - - 0x008965 02:8955: A9 F1     LDA #con__hp_F1
C - - - - - 0x008967 02:8957: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x00896A 02:895A: A9 00     LDA #$00
C - - - - - 0x00896C 02:895C: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x00896F 02:895F: A9 10     LDA #$10
C - - - - - 0x008971 02:8961: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x008974 02:8964: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x008977 02:8967: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_3B_896A_02:
C - - J - - 0x00897A 02:896A: 20 2A 8A  JSR sub_8A2A
C - - - - - 0x00897D 02:896D: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x008980 02:8970: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008983 02:8973: C9 B8     CMP #$B8
C - - - - - 0x008985 02:8975: B0 0B     BCS bra_8982_RTS
C - - - - - 0x008987 02:8977: A9 18     LDA #$18
C - - - - - 0x008989 02:8979: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x00898C 02:897C: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x00898F 02:897F: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8982_RTS:
C - - - - - 0x008992 02:8982: 60        RTS



ofs_038_3B_8983_03:
C - - J - - 0x008993 02:8983: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x008996 02:8986: 84 12     STY ram_0012
C - - - - - 0x008998 02:8988: A9 28     LDA #$28
C - - - - - 0x00899A 02:898A: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x00899D 02:898D: D0 0B     BNE bra_899A
C - - - - - 0x00899F 02:898F: A9 14     LDA #$14
C - - - - - 0x0089A1 02:8991: 20 CB AA  JSR sub_0x006ADB
C - - - - - 0x0089A4 02:8994: 20 D3 A7  JSR sub_0x0067E3_clear_spd_X
C - - - - - 0x0089A7 02:8997: 4C EF 89  JMP loc_89EF
bra_899A:
C - - - - - 0x0089AA 02:899A: 20 3D A8  JSR sub_0x00684D
C - - - - - 0x0089AD 02:899D: A0 00     LDY #$00
C - - - - - 0x0089AF 02:899F: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0089B2 02:89A2: 38        SEC
C - - - - - 0x0089B3 02:89A3: FD 76 06  SBC ram_obj_hp,X
C - - - - - 0x0089B6 02:89A6: 0A        ASL
C - - - - - 0x0089B7 02:89A7: 0A        ASL
C - - - - - 0x0089B8 02:89A8: 0A        ASL
C - - - - - 0x0089B9 02:89A9: 0A        ASL
C - - - - - 0x0089BA 02:89AA: 0A        ASL
C - - - - - 0x0089BB 02:89AB: 18        CLC
C - - - - - 0x0089BC 02:89AC: 7D 56 07  ADC ram_0756_obj,X
C - - - - - 0x0089BF 02:89AF: 90 02     BCC bra_89B3
C - - - - - 0x0089C1 02:89B1: A9 FF     LDA #$FF
bra_89B3:
C - - - - - 0x0089C3 02:89B3: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x0089C6 02:89B6: BD 76 06  LDA ram_obj_hp,X
C - - - - - 0x0089C9 02:89B9: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0089CC 02:89BC: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0089CF 02:89BF: F0 18     BEQ bra_89D9
C - - - - - 0x0089D1 02:89C1: DE 56 07  DEC ram_0756_obj,X
C - - - - - 0x0089D4 02:89C4: A4 12     LDY ram_0012
C - - - - - 0x0089D6 02:89C6: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0089D9 02:89C9: D9 4C 05  CMP ram_pos_X_hi_plr,Y
C - - - - - 0x0089DC 02:89CC: A0 02     LDY #$02
C - - - - - 0x0089DE 02:89CE: A9 00     LDA #$00
C - - - - - 0x0089E0 02:89D0: B0 04     BCS bra_89D6
C - - - - - 0x0089E2 02:89D2: A0 04     LDY #$04
C - - - - - 0x0089E4 02:89D4: A9 01     LDA #$01
bra_89D6:
C - - - - - 0x0089E6 02:89D6: 9D 1E 07  STA ram_obj_flags,X
bra_89D9:
C - - - - - 0x0089E9 02:89D9: A9 00     LDA #< $0100
C - - - - - 0x0089EB 02:89DB: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x0089EE 02:89DE: A9 01     LDA #> $0100
C - - - - - 0x0089F0 02:89E0: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x0089F3 02:89E3: B9 22 8A  LDA tbl_8A22_spd_X,Y
C - - - - - 0x0089F6 02:89E6: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x0089F9 02:89E9: B9 23 8A  LDA tbl_8A22_spd_X + $01,Y
C - - - - - 0x0089FC 02:89EC: 9D CA 06  STA ram_spd_X_hi_obj,X
loc_89EF:
C D 0 - - - 0x0089FF 02:89EF: 20 2A 8A  JSR sub_8A2A
C - - - - - 0x008A02 02:89F2: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x008A05 02:89F5: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x008A08 02:89F8: D0 27     BNE bra_8A21_RTS
C - - - - - 0x008A0A 02:89FA: A0 3C     LDY #con_obj_id_3C
C - - - - - 0x008A0C 02:89FC: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x008A0F 02:89FF: 90 1B     BCC bra_8A1C
C - - - - - 0x008A11 02:8A01: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008A14 02:8A04: 29 01     AND #$01
C - - - - - 0x008A16 02:8A06: A8        TAY
C - - - - - 0x008A17 02:8A07: B9 28 8A  LDA tbl_8A28,Y
C - - - - - 0x008A1A 02:8A0A: A4 11     LDY ram_0011
C - - - - - 0x008A1C 02:8A0C: 18        CLC
C - - - - - 0x008A1D 02:8A0D: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x008A20 02:8A10: 99 3C 05  STA ram_pos_X_hi_enemy,Y
C - - - - - 0x008A23 02:8A13: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008A26 02:8A16: 38        SEC
C - - - - - 0x008A27 02:8A17: E9 10     SBC #$10
C - - - - - 0x008A29 02:8A19: 99 22 05  STA ram_pos_Y_hi_enemy,Y
bra_8A1C:
C - - - - - 0x008A2C 02:8A1C: A9 17     LDA #$17
C - - - - - 0x008A2E 02:8A1E: 9D F4 06  STA ram_06F4_obj,X
bra_8A21_RTS:
C - - - - - 0x008A31 02:8A21: 60        RTS



tbl_8A22_spd_X:
- D 0 - - - 0x008A32 02:8A22: 00 00     .word $0000 ; 00 
- D 0 - - - 0x008A34 02:8A24: E0 FF     .word $FFE0 ; 02 
- D 0 - - - 0x008A36 02:8A26: 20 00     .word $0020 ; 04 



tbl_8A28:
- D 0 - - - 0x008A38 02:8A28: F9        .byte $F9   ; 00 
- D 0 - - - 0x008A39 02:8A29: 07        .byte $07   ; 01 



sub_8A2A:
C - - - - - 0x008A3A 02:8A2A: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008A3D 02:8A2D: 4A        LSR
C - - - - - 0x008A3E 02:8A2E: A9 03     LDA #$03
C - - - - - 0x008A40 02:8A30: 90 02     BCC bra_8A34
C - - - - - 0x008A42 02:8A32: A9 43     LDA #$43
bra_8A34:
C - - - - - 0x008A44 02:8A34: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x008A47 02:8A37: A0 0E     LDY #$0E
C - - - - - 0x008A49 02:8A39: 4C FD AB  JMP loc_0x006C0D



_off001_0x008A4C_3C_bullet_purple_mutant:
- D 0 - I - 0x008A4C 02:8A3C: 42 8A     .word ofs_038_3C_8A42_01_initialize_object ; 
- D 0 - I - 0x008A4E 02:8A3E: A0 8A     .word ofs_038_3C_8AA0_02 ; 
- - - - - - 0x008A50 02:8A40: 75 A2     .word ofs_038_3C_0x006285_03_delete_object_02 ; 



ofs_038_3C_8A42_01_initialize_object:
C - - J - - 0x008A52 02:8A42: A9 80     LDA #$80
C - - - - - 0x008A54 02:8A44: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x008A57 02:8A47: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008A5A 02:8A4A: 18        CLC
C - - - - - 0x008A5B 02:8A4B: 65 23     ADC ram_0023
C - - - - - 0x008A5D 02:8A4D: 29 07     AND #$07
C - - - - - 0x008A5F 02:8A4F: 0A        ASL
C - - - - - 0x008A60 02:8A50: A8        TAY
C - - - - - 0x008A61 02:8A51: B9 90 8A  LDA tbl_8A90_spd_X,Y
C - - - - - 0x008A64 02:8A54: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x008A67 02:8A57: B9 91 8A  LDA tbl_8A90_spd_X + $01,Y
C - - - - - 0x008A6A 02:8A5A: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x008A6D 02:8A5D: A5 23     LDA ram_0023
C - - - - - 0x008A6F 02:8A5F: 29 07     AND #$07
C - - - - - 0x008A71 02:8A61: 0A        ASL
C - - - - - 0x008A72 02:8A62: A8        TAY
C - - - - - 0x008A73 02:8A63: B9 80 8A  LDA tbl_8A80_spd_Y,Y
C - - - - - 0x008A76 02:8A66: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x008A79 02:8A69: B9 81 8A  LDA tbl_8A80_spd_Y + $01,Y
C - - - - - 0x008A7C 02:8A6C: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x008A7F 02:8A6F: A9 02     LDA #$02
C - - - - - 0x008A81 02:8A71: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x008A84 02:8A74: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008A87 02:8A77: 4A        LSR
C - - - - - 0x008A88 02:8A78: B0 03     BCS bra_8A7D
C - - - - - 0x008A8A 02:8A7A: 20 DC A7  JSR sub_0x0067EC_inverse_spd_X
bra_8A7D:
C - - - - - 0x008A8D 02:8A7D: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_8A80_spd_Y:
- D 0 - - - 0x008A90 02:8A80: 00 FF     .word $FF00 ; 00 
- D 0 - - - 0x008A92 02:8A82: 10 FF     .word $FF10 ; 01 
- D 0 - - - 0x008A94 02:8A84: 20 FF     .word $FF20 ; 02 
- D 0 - - - 0x008A96 02:8A86: 30 FF     .word $FF30 ; 03 
- D 0 - - - 0x008A98 02:8A88: 40 FF     .word $FF40 ; 04 
- D 0 - - - 0x008A9A 02:8A8A: 50 FF     .word $FF50 ; 05 
- D 0 - - - 0x008A9C 02:8A8C: 60 FF     .word $FF60 ; 06 
- D 0 - - - 0x008A9E 02:8A8E: 70 FF     .word $FF70 ; 07 



tbl_8A90_spd_X:
- D 0 - - - 0x008AA0 02:8A90: A0 00     .word $00A0 ; 00 
- D 0 - - - 0x008AA2 02:8A92: C0 00     .word $00C0 ; 01 
- D 0 - - - 0x008AA4 02:8A94: E0 00     .word $00E0 ; 02 
- D 0 - - - 0x008AA6 02:8A96: 00 01     .word $0100 ; 03 
- D 0 - - - 0x008AA8 02:8A98: 20 01     .word $0120 ; 04 
- D 0 - - - 0x008AAA 02:8A9A: 40 01     .word $0140 ; 05 
- D 0 - - - 0x008AAC 02:8A9C: 60 01     .word $0160 ; 06 
- D 0 - - - 0x008AAE 02:8A9E: 80 01     .word $0180 ; 07 



ofs_038_3C_8AA0_02:
C - - J - - 0x008AB0 02:8AA0: A0 0F     LDY #$0F
C - - - - - 0x008AB2 02:8AA2: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008AB5 02:8AA5: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x008AB8 02:8AA8: BD A0 06  LDA ram_spd_Y_lo_obj,X
C - - - - - 0x008ABB 02:8AAB: 18        CLC
C - - - - - 0x008ABC 02:8AAC: 69 0C     ADC #< $000C
C - - - - - 0x008ABE 02:8AAE: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x008AC1 02:8AB1: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x008AC4 02:8AB4: 69 00     ADC #> $000C
C - - - - - 0x008AC6 02:8AB6: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x008AC9 02:8AB9: A9 00     LDA #$00
C - - - - - 0x008ACB 02:8ABB: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x008ACE 02:8ABE: F0 03     BEQ bra_8AC3_RTS
C - - - - - 0x008AD0 02:8AC0: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_8AC3_RTS:
C - - - - - 0x008AD3 02:8AC3: 60        RTS



_off001_0x008AD4_3D_spawner_facehuggers:
- D 0 - I - 0x008AD4 02:8AC4: D0 8A     .word ofs_038_3D_8AD0_01_initialize_object ; 
- D 0 - I - 0x008AD6 02:8AC6: F0 8A     .word ofs_038_3D_8AF0_02 ; 
- D 0 - I - 0x008AD8 02:8AC8: 45 8B     .word ofs_038_3D_8B45_03 ; 
- D 0 - I - 0x008ADA 02:8ACA: 78 8B     .word ofs_038_3D_8B78_04 ; 
- D 0 - I - 0x008ADC 02:8ACC: FD A2     .word ofs_038_3D_0x00630D_05 ; 
- D 0 - I - 0x008ADE 02:8ACE: 3D A3     .word ofs_038_3D_0x00634D_06_delete_object_04 ; 



ofs_038_3D_8AD0_01_initialize_object:
C - - J - - 0x008AE0 02:8AD0: A9 10     LDA #$10
C - - - - - 0x008AE2 02:8AD2: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x008AE5 02:8AD5: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x008AE8 02:8AD8: 38        SEC
C - - - - - 0x008AE9 02:8AD9: E9 08     SBC #$08
C - - - - - 0x008AEB 02:8ADB: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x008AEE 02:8ADE: A9 01     LDA #$01
C - - - - - 0x008AF0 02:8AE0: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x008AF3 02:8AE3: A9 03     LDA #$03
C - - - - - 0x008AF5 02:8AE5: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x008AF8 02:8AE8: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x008AFB 02:8AEB: A9 01     LDA #$01
C - - - - - 0x008AFD 02:8AED: 4C E0 A2  JMP loc_0x0062F0



ofs_038_3D_8AF0_02:
C - - J - - 0x008B00 02:8AF0: A9 01     LDA #$01
C - - - - - 0x008B02 02:8AF2: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x008B05 02:8AF5: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x008B08 02:8AF8: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008B0B 02:8AFB: D0 2E     BNE bra_8B2B_RTS
C - - - - - 0x008B0D 02:8AFD: 20 82 8B  JSR sub_8B82
C - - - - - 0x008B10 02:8B00: B0 26     BCS bra_8B28
C - - - - - 0x008B12 02:8B02: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x008B15 02:8B05: D0 16     BNE bra_8B1D
C - - - - - 0x008B17 02:8B07: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x008B1A 02:8B0A: C9 01     CMP #$01
C - - - - - 0x008B1C 02:8B0C: 90 0A     BCC bra_8B18
bra_8B0E:
C - - - - - 0x008B1E 02:8B0E: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x008B21 02:8B11: 49 01     EOR #$01
C - - - - - 0x008B23 02:8B13: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x008B26 02:8B16: B0 14     BCS bra_8B2C
bra_8B18:
C - - - - - 0x008B28 02:8B18: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x008B2B 02:8B1B: D0 09     BNE bra_8B26    ; jmp?
bra_8B1D:
C - - - - - 0x008B2D 02:8B1D: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x008B30 02:8B20: 18        CLC
C - - - - - 0x008B31 02:8B21: F0 EB     BEQ bra_8B0E
bra_8B23:
C - - - - - 0x008B33 02:8B23: DE 10 07  DEC ram_0710_obj,X
bra_8B26:
C - - - - - 0x008B36 02:8B26: A9 08     LDA #$08
bra_8B28:
C - - - - - 0x008B38 02:8B28: 9D E6 06  STA ram_06E6_obj,X
bra_8B2B_RTS:
C - - - - - 0x008B3B 02:8B2B: 60        RTS
bra_8B2C:
C - - - - - 0x008B3C 02:8B2C: DE 56 07  DEC ram_0756_obj,X
C - - - - - 0x008B3F 02:8B2F: D0 F2     BNE bra_8B23
C - - - - - 0x008B41 02:8B31: A9 06     LDA #$06
C - - - - - 0x008B43 02:8B33: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x008B46 02:8B36: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008B49 02:8B39: C9 C0     CMP #$C0
C - - - - - 0x008B4B 02:8B3B: B0 E6     BCS bra_8B23
C - - - - - 0x008B4D 02:8B3D: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x008B50 02:8B40: A9 10     LDA #$10
C - - - - - 0x008B52 02:8B42: 4C E0 A2  JMP loc_0x0062F0



ofs_038_3D_8B45_03:
C - - J - - 0x008B55 02:8B45: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x008B58 02:8B48: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008B5B 02:8B4B: D0 DE     BNE bra_8B2B_RTS
C - - - - - 0x008B5D 02:8B4D: 20 82 8B  JSR sub_8B82
C - - - - - 0x008B60 02:8B50: B0 D6     BCS bra_8B28
C - - - - - 0x008B62 02:8B52: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x008B65 02:8B55: C9 02     CMP #$02
C - - - - - 0x008B67 02:8B57: 90 BF     BCC bra_8B18
C - - - - - 0x008B69 02:8B59: A0 3E     LDY #con_obj_id_3E
C - - - - - 0x008B6B 02:8B5B: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x008B6E 02:8B5E: 90 0B     BCC bra_8B6B
C - - - - - 0x008B70 02:8B60: A4 11     LDY ram_0011
C - - - - - 0x008B72 02:8B62: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008B75 02:8B65: 38        SEC
C - - - - - 0x008B76 02:8B66: E9 08     SBC #$08
C - - - - - 0x008B78 02:8B68: 99 22 05  STA ram_pos_Y_hi_enemy,Y
bra_8B6B:
C - - - - - 0x008B7B 02:8B6B: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x008B7E 02:8B6E: A9 20     LDA #$20
C - - - - - 0x008B80 02:8B70: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x008B83 02:8B73: A9 02     LDA #$02
C - - - - - 0x008B85 02:8B75: 4C 83 A2  JMP loc_0x006293_set_obj_state



ofs_038_3D_8B78_04:
C - - J - - 0x008B88 02:8B78: A0 03     LDY #$03
C - - - - - 0x008B8A 02:8B7A: 20 85 8B  JSR sub_8B85
C - - - - - 0x008B8D 02:8B7D: B0 AC     BCS bra_8B2B_RTS
C - - - - - 0x008B8F 02:8B7F: 4C 9A A2  JMP loc_0x0062AA



sub_8B82:
C - - - - - 0x008B92 02:8B82: BC 10 07  LDY ram_0710_obj,X
sub_8B85:
C - - - - - 0x008B95 02:8B85: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008B98 02:8B88: C9 20     CMP #$20
C - - - - - 0x008B9A 02:8B8A: 90 0D     BCC bra_8B99
C - - - - - 0x008B9C 02:8B8C: C9 D0     CMP #$D0
C - - - - - 0x008B9E 02:8B8E: B0 09     BCS bra_8B99
C - - - - - 0x008BA0 02:8B90: B9 9C 8B  LDA tbl_8B9C,Y
C - - - - - 0x008BA3 02:8B93: 20 9A A8  JSR sub_0x0068AA
bra_8B96:
C - - - - - 0x008BA6 02:8B96: A9 01     LDA #$01
C - - - - - 0x008BA8 02:8B98: 60        RTS
bra_8B99:
C - - - - - 0x008BA9 02:8B99: 38        SEC
C - - - - - 0x008BAA 02:8B9A: B0 FA     BCS bra_8B96    ; jmp



tbl_8B9C:
- D 0 - - - 0x008BAC 02:8B9C: 6E        .byte $6E   ; 00 
- D 0 - - - 0x008BAD 02:8B9D: 6F        .byte $6F   ; 01 
- D 0 - - - 0x008BAE 02:8B9E: 70        .byte $70   ; 02 
- D 0 - - - 0x008BAF 02:8B9F: 37        .byte $37   ; 03 



_off001_0x008BB0_3E_facehugger:
- D 0 - I - 0x008BB0 02:8BA0: AA 8B     .word ofs_038_3E_8BAA_01_initialize_object ; 
- D 0 - I - 0x008BB2 02:8BA2: EA 8B     .word ofs_038_3E_8BEA_02 ; 
- D 0 - I - 0x008BB4 02:8BA4: 9A A2     .word ofs_038_3E_0x0062AA_03 ; 
- D 0 - I - 0x008BB6 02:8BA6: FD A2     .word ofs_038_3E_0x00630D_04 ; 
- D 0 - I - 0x008BB8 02:8BA8: 3D A3     .word ofs_038_3E_0x00634D_05_delete_object_04 ; 



ofs_038_3E_8BAA_01_initialize_object:
C - - J - - 0x008BBA 02:8BAA: A9 01     LDA #$01
C - - - - - 0x008BBC 02:8BAC: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x008BBF 02:8BAF: A5 23     LDA ram_0023
C - - - - - 0x008BC1 02:8BB1: 29 03     AND #$03
C - - - - - 0x008BC3 02:8BB3: 0A        ASL
C - - - - - 0x008BC4 02:8BB4: 0A        ASL
C - - - - - 0x008BC5 02:8BB5: A8        TAY
C - - - - - 0x008BC6 02:8BB6: 20 BC 8B  JSR sub_8BBC
C - - - - - 0x008BC9 02:8BB9: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



sub_8BBC:
C - - - - - 0x008BCC 02:8BBC: B9 75 8C  LDA tbl_8C75_speed,Y
C - - - - - 0x008BCF 02:8BBF: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x008BD2 02:8BC2: B9 76 8C  LDA tbl_8C75_speed + $01,Y
C - - - - - 0x008BD5 02:8BC5: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x008BD8 02:8BC8: B9 77 8C  LDA tbl_8C75_speed + $02,Y
C - - - - - 0x008BDB 02:8BCB: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x008BDE 02:8BCE: B9 78 8C  LDA tbl_8C75_speed + $03,Y
C - - - - - 0x008BE1 02:8BD1: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x008BE4 02:8BD4: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x008BE7 02:8BD7: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x008BEA 02:8BDA: D9 4C 05  CMP ram_pos_X_hi_plr,Y
C - - - - - 0x008BED 02:8BDD: A9 43     LDA #$43
C - - - - - 0x008BEF 02:8BDF: 90 05     BCC bra_8BE6
C - - - - - 0x008BF1 02:8BE1: 20 DC A7  JSR sub_0x0067EC_inverse_spd_X
C - - - - - 0x008BF4 02:8BE4: A9 03     LDA #$03
bra_8BE6:
C - - - - - 0x008BF6 02:8BE6: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x008BF9 02:8BE9: 60        RTS



ofs_038_3E_8BEA_02:
C - - J - - 0x008BFA 02:8BEA: 20 F0 8B  JSR sub_8BF0
C - - - - - 0x008BFD 02:8BED: 4C 07 A7  JMP loc_0x006717



sub_8BF0:
C - - - - - 0x008C00 02:8BF0: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x008C03 02:8BF3: F0 41     BEQ bra_8C36
C - - - - - 0x008C05 02:8BF5: A9 9E     LDA #$9E
C - - - - - 0x008C07 02:8BF7: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x008C0A 02:8BFA: A9 18     LDA #$18
C - - - - - 0x008C0C 02:8BFC: 20 CB AA  JSR sub_0x006ADB
C - - - - - 0x008C0F 02:8BFF: A9 10     LDA #$10
C - - - - - 0x008C11 02:8C01: BC CA 06  LDY ram_spd_X_hi_obj,X
C - - - - - 0x008C14 02:8C04: 10 02     BPL bra_8C08
C - - - - - 0x008C16 02:8C06: A9 F0     LDA #$F0
bra_8C08:
C - - - - - 0x008C18 02:8C08: 20 22 A8  JSR sub_0x006832
C - - - - - 0x008C1B 02:8C0B: F0 03     BEQ bra_8C10
C - - - - - 0x008C1D 02:8C0D: 20 D3 A7  JSR sub_0x0067E3_clear_spd_X
bra_8C10:
C - - - - - 0x008C20 02:8C10: BD 8E 07  LDA ram_078E_obj,X
C - - - - - 0x008C23 02:8C13: D0 20     BNE bra_8C35_RTS
C - - - - - 0x008C25 02:8C15: A9 0E     LDA #$0E
C - - - - - 0x008C27 02:8C17: BC AE 06  LDY ram_spd_Y_hi_obj,X
C - - - - - 0x008C2A 02:8C1A: 10 02     BPL bra_8C1E
C - - - - - 0x008C2C 02:8C1C: A9 F2     LDA #$F2
bra_8C1E:
C - - - - - 0x008C2E 02:8C1E: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x008C31 02:8C21: F0 12     BEQ bra_8C35_RTS
C - - - - - 0x008C33 02:8C23: BC AE 06  LDY ram_spd_Y_hi_obj,X
C - - - - - 0x008C36 02:8C26: 10 03     BPL bra_8C2B
C - - - - - 0x008C38 02:8C28: 4C CA A7  JMP loc_0x0067DA_clear_spd_Y
bra_8C2B:
C - - - - - 0x008C3B 02:8C2B: A0 10     LDY #$04 * $04
C - - - - - 0x008C3D 02:8C2D: 20 BC 8B  JSR sub_8BBC
C - - - - - 0x008C40 02:8C30: A9 00     LDA #$00
C - - - - - 0x008C42 02:8C32: 9D 48 07  STA ram_0748_obj,X
bra_8C35_RTS:
C - - - - - 0x008C45 02:8C35: 60        RTS
bra_8C36:
C - - - - - 0x008C46 02:8C36: A0 10     LDY #$10
C - - - - - 0x008C48 02:8C38: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008C4B 02:8C3B: A9 10     LDA #$10
C - - - - - 0x008C4D 02:8C3D: BC CA 06  LDY ram_spd_X_hi_obj,X
C - - - - - 0x008C50 02:8C40: 10 02     BPL bra_8C44
C - - - - - 0x008C52 02:8C42: A9 F0     LDA #$F0
bra_8C44:
C - - - - - 0x008C54 02:8C44: 20 22 A8  JSR sub_0x006832
C - - - - - 0x008C57 02:8C47: F0 03     BEQ bra_8C4C
- - - - - - 0x008C59 02:8C49: 20 DC A7  JSR sub_0x0067EC_inverse_spd_X
bra_8C4C:
C - - - - - 0x008C5C 02:8C4C: A9 0E     LDA #$0E
C - - - - - 0x008C5E 02:8C4E: 20 00 A8  JSR sub_0x006810
C - - - - - 0x008C61 02:8C51: F0 03     BEQ bra_8C56
C - - - - - 0x008C63 02:8C53: 4C 3D A8  JMP loc_0x00684D
bra_8C56:
C - - - - - 0x008C66 02:8C56: A9 01     LDA #$01
C - - - - - 0x008C68 02:8C58: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x008C6B 02:8C5B: 20 CA A7  JSR sub_0x0067DA_clear_spd_Y
C - - - - - 0x008C6E 02:8C5E: A0 00     LDY #$00
C - - - - - 0x008C70 02:8C60: BD 56 05  LDA ram_attr_spr_enemy,X
C - - - - - 0x008C73 02:8C63: 0A        ASL
C - - - - - 0x008C74 02:8C64: 10 02     BPL bra_8C68
C - - - - - 0x008C76 02:8C66: A0 02     LDY #$02
bra_8C68:
C - - - - - 0x008C78 02:8C68: B9 89 8C  LDA tbl_8C89_spd_X,Y
C - - - - - 0x008C7B 02:8C6B: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x008C7E 02:8C6E: B9 8A 8C  LDA tbl_8C89_spd_X + $01,Y
C - - - - - 0x008C81 02:8C71: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x008C84 02:8C74: 60        RTS



tbl_8C75_speed:
; 00 
- D 0 - - - 0x008C85 02:8C75: 00 FE     .word $FE00 ; Y
- D 0 - - - 0x008C87 02:8C77: 80 00     .word $0080 ; X
; 01 
- D 0 - - - 0x008C89 02:8C79: 00 FE     .word $FE00 ; Y
- D 0 - - - 0x008C8B 02:8C7B: 00 01     .word $0100 ; X
; 02 
- D 0 - - - 0x008C8D 02:8C7D: 00 FE     .word $FE00 ; Y
- D 0 - - - 0x008C8F 02:8C7F: 80 01     .word $0180 ; X
; 03 
- D 0 - - - 0x008C91 02:8C81: 00 FE     .word $FE00 ; Y
- D 0 - - - 0x008C93 02:8C83: 00 02     .word $0200 ; X
; 04 
- D 0 - - - 0x008C95 02:8C85: 00 00     .word $0000 ; Y
- D 0 - - - 0x008C97 02:8C87: 00 02     .word $0200 ; X



tbl_8C89_spd_X:
- D 0 - - - 0x008C99 02:8C89: 80 FF     .word $FF80 ; 00 
- D 0 - - - 0x008C9B 02:8C8B: 80 00     .word $0080 ; 02 



_off001_0x008C9D_52_boss_7_chest:
- D 0 - I - 0x008C9D 02:8C8D: 9B 8C     .word ofs_038_52_8C9B_01_initialize_object ; 
- D 0 - I - 0x008C9F 02:8C8F: C6 8C     .word ofs_038_52_8CC6_02 ; 
- D 0 - I - 0x008CA1 02:8C91: FB 8C     .word ofs_038_52_8CFB_03 ; 
- D 0 - I - 0x008CA3 02:8C93: 1A 8D     .word ofs_038_52_8D1A_04 ; 
- D 0 - I - 0x008CA5 02:8C95: 3A 8D     .word ofs_038_52_8D3A_05 ; 
- D 0 - I - 0x008CA7 02:8C97: FD A2     .word ofs_038_52_0x00630D_06 ; 
- D 0 - I - 0x008CA9 02:8C99: 44 8D     .word ofs_038_52_8D44_07 ; 



ofs_038_52_8C9B_01_initialize_object:
C - - J - - 0x008CAB 02:8C9B: A9 01     LDA #$01
C - - - - - 0x008CAD 02:8C9D: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x008CB0 02:8CA0: A9 01     LDA #$01
C - - - - - 0x008CB2 02:8CA2: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x008CB5 02:8CA5: A9 18     LDA #$18
C - - - - - 0x008CB7 02:8CA7: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x008CBA 02:8CAA: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x008CBD 02:8CAD: A9 F0     LDA #con__hp_F0
C - - - - - 0x008CBF 02:8CAF: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x008CC2 02:8CB2: A9 70     LDA #$70
C - - - - - 0x008CC4 02:8CB4: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x008CC7 02:8CB7: A9 80     LDA #$80
C - - - - - 0x008CC9 02:8CB9: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x008CCC 02:8CBC: A9 01     LDA #$01
C - - - - - 0x008CCE 02:8CBE: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x008CD1 02:8CC1: A9 40     LDA #$40
C - - - - - 0x008CD3 02:8CC3: 4C E0 A2  JMP loc_0x0062F0



ofs_038_52_8CC6_02:
C - - J - - 0x008CD6 02:8CC6: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008CD9 02:8CC9: D0 29     BNE bra_8CF4_RTS
C - - - - - 0x008CDB 02:8CCB: 20 4F 8D  JSR sub_8D4F
C - - - - - 0x008CDE 02:8CCE: A9 01     LDA #$01
C - - - - - 0x008CE0 02:8CD0: B0 1F     BCS bra_8CF1
C - - - - - 0x008CE2 02:8CD2: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x008CE5 02:8CD5: C9 02     CMP #$02
C - - - - - 0x008CE7 02:8CD7: A9 08     LDA #$08
C - - - - - 0x008CE9 02:8CD9: 90 13     BCC bra_8CEE
C - - - - - 0x008CEB 02:8CDB: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x008CEE 02:8CDE: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x008CF1 02:8CE1: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x008CF4 02:8CE4: A9 10     LDA #$10
C - - - - - 0x008CF6 02:8CE6: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x008CF9 02:8CE9: A9 70     LDA #$70
C - - - - - 0x008CFB 02:8CEB: 4C E0 A2  JMP loc_0x0062F0
bra_8CEE:
C - - - - - 0x008CFE 02:8CEE: FE 10 07  INC ram_0710_obj,X
bra_8CF1:
loc_8CF1:
C D 0 - - - 0x008D01 02:8CF1: 9D E6 06  STA ram_06E6_obj,X
bra_8CF4_RTS:
C - - - - - 0x008D04 02:8CF4: 60        RTS



bra_8CF5:
C - - - - - 0x008D05 02:8CF5: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x008D08 02:8CF8: 4C F1 8C  JMP loc_8CF1



ofs_038_52_8CFB_03:
C - - J - - 0x008D0B 02:8CFB: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x008D0E 02:8CFE: D0 05     BNE bra_8D05
C - - - - - 0x008D10 02:8D00: A0 54     LDY #con_obj_id_54
C - - - - - 0x008D12 02:8D02: 20 C8 AB  JSR sub_0x006BD8
bra_8D05:
C - - - - - 0x008D15 02:8D05: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008D18 02:8D08: D0 EA     BNE bra_8CF4_RTS
C - - - - - 0x008D1A 02:8D0A: BD 76 06  LDA ram_obj_hp,X
C - - - - - 0x008D1D 02:8D0D: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x008D20 02:8D10: A9 F0     LDA #con__hp_F0
C - - - - - 0x008D22 02:8D12: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x008D25 02:8D15: A9 01     LDA #$01
C - - - - - 0x008D27 02:8D17: 4C E0 A2  JMP loc_0x0062F0



ofs_038_52_8D1A_04:
C - - J - - 0x008D2A 02:8D1A: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008D2D 02:8D1D: D0 D5     BNE bra_8CF4_RTS
C - - - - - 0x008D2F 02:8D1F: 20 4F 8D  JSR sub_8D4F
C - - - - - 0x008D32 02:8D22: A9 01     LDA #$01
C - - - - - 0x008D34 02:8D24: B0 CB     BCS bra_8CF1
C - - - - - 0x008D36 02:8D26: A9 08     LDA #$08
C - - - - - 0x008D38 02:8D28: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x008D3B 02:8D2B: D0 C8     BNE bra_8CF5
C - - - - - 0x008D3D 02:8D2D: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x008D40 02:8D30: A9 50     LDA #$50
C - - - - - 0x008D42 02:8D32: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x008D45 02:8D35: A9 02     LDA #$02
C - - - - - 0x008D47 02:8D37: 4C 83 A2  JMP loc_0x006293_set_obj_state



ofs_038_52_8D3A_05:
C - - J - - 0x008D4A 02:8D3A: A9 03     LDA #$03
C - - - - - 0x008D4C 02:8D3C: 20 52 8D  JSR sub_8D52
C - - - - - 0x008D4F 02:8D3F: B0 B3     BCS bra_8CF4_RTS
C - - - - - 0x008D51 02:8D41: 4C 9A A2  JMP loc_0x0062AA



ofs_038_52_8D44_07:
C - - J - - 0x008D54 02:8D44: BC 80 07  LDY ram_0780_obj,X
C - - - - - 0x008D57 02:8D47: A9 01     LDA #$01
C - - - - - 0x008D59 02:8D49: 99 48 07  STA ram_0748_obj,Y
C - - - - - 0x008D5C 02:8D4C: 4C 3D A3  JMP loc_0x00634D_delete_object_04



sub_8D4F:
C - - - - - 0x008D5F 02:8D4F: BD 10 07  LDA ram_0710_obj,X
sub_8D52:
C - - - - - 0x008D62 02:8D52: A0 00     LDY #$00
loc_8D54:
C D 0 - - - 0x008D64 02:8D54: 84 0E     STY ram_000E
; A = 00-07
C - - - - - 0x008D66 02:8D56: 0A        ASL
C - - - - - 0x008D67 02:8D57: 0A        ASL
C - - - - - 0x008D68 02:8D58: 85 0D     STA ram_000D
; bzk optimize, check ram_index_ppu_buffer first
C - - - - - 0x008D6A 02:8D5A: A5 1E     LDA ram_index_ppu_buffer
C - - - - - 0x008D6C 02:8D5C: D0 33     BNE bra_8D91
C - - - - - 0x008D6E 02:8D5E: A0 03     LDY #$03
bra_8D60_loop:
C - - - - - 0x008D70 02:8D60: 84 0F     STY ram_000F
C - - - - - 0x008D72 02:8D62: 98        TYA
C - - - - - 0x008D73 02:8D63: 18        CLC
C - - - - - 0x008D74 02:8D64: 65 0D     ADC ram_000D
C - - - - - 0x008D76 02:8D66: A8        TAY
C - - - - - 0x008D77 02:8D67: B9 94 8D  LDA tbl_8D94,Y
C - - - - - 0x008D7A 02:8D6A: 85 08     STA ram_0008
C - - - - - 0x008D7C 02:8D6C: A5 0F     LDA ram_000F
C - - - - - 0x008D7E 02:8D6E: 18        CLC
C - - - - - 0x008D7F 02:8D6F: 65 0E     ADC ram_000E    ; 00/04
C - - - - - 0x008D81 02:8D71: A8        TAY
C - - - - - 0x008D82 02:8D72: B9 B4 8D  LDA tbl_8DB4,Y
C - - - - - 0x008D85 02:8D75: 85 0C     STA ram_000C
C - - - - - 0x008D87 02:8D77: B9 BC 8D  LDA tbl_8DBC,Y
C - - - - - 0x008D8A 02:8D7A: A4 0C     LDY ram_000C
C - - - - - 0x008D8C 02:8D7C: 20 A4 FE  JSR sub_0x01FEB4
C - - - - - 0x008D8F 02:8D7F: 8A        TXA
C - - - - - 0x008D90 02:8D80: 38        SEC
C - - - - - 0x008D91 02:8D81: E9 04     SBC #$04
C - - - - - 0x008D93 02:8D83: 85 1E     STA ram_index_ppu_buffer
C - - - - - 0x008D95 02:8D85: AA        TAX
C - - - - - 0x008D96 02:8D86: A9 FF     LDA #$FF
C - - - - - 0x008D98 02:8D88: 9D FF 02  STA ram_nmt_buffer - $01,X
C - - - - - 0x008D9B 02:8D8B: A4 0F     LDY ram_000F
C - - - - - 0x008D9D 02:8D8D: 88        DEY
C - - - - - 0x008D9E 02:8D8E: 10 D0     BPL bra_8D60_loop
C - - - - - 0x008DA0 02:8D90: 18        CLC
bra_8D91:
C - - - - - 0x008DA1 02:8D91: A6 10     LDX ram_0010
C - - - - - 0x008DA3 02:8D93: 60        RTS



tbl_8D94:
- D 0 - - - 0x008DA4 02:8D94: 7F        .byte $7F, $80, $86, $87   ; 00 
- D 0 - - - 0x008DA8 02:8D98: A1        .byte $A1, $A2, $A3, $A4   ; 01 
- D 0 - - - 0x008DAC 02:8D9C: A5        .byte $A5, $A6, $A7, $A8   ; 02 
- D 0 - - - 0x008DB0 02:8DA0: A5        .byte $A5, $A6, $A7, $A8   ; 03 
- D 0 - - - 0x008DB4 02:8DA4: 73        .byte $73, $74, $79, $7A   ; 04 
- D 0 - - - 0x008DB8 02:8DA8: A9        .byte $A9, $AA, $AB, $AC   ; 05 
- D 0 - - - 0x008DBC 02:8DAC: AD        .byte $AD, $AE, $AF, $B0   ; 06 
- D 0 - - - 0x008DC0 02:8DB0: AD        .byte $AD, $AE, $AF, $B0   ; 07 



tbl_8DB4:
- D 0 - - - 0x008DC4 02:8DB4: 60        .byte $60   ; 00 
- D 0 - - - 0x008DC5 02:8DB5: 60        .byte $60   ; 01 
- D 0 - - - 0x008DC6 02:8DB6: 80        .byte $80   ; 02 
- D 0 - - - 0x008DC7 02:8DB7: 80        .byte $80   ; 03 
- D 0 - - - 0x008DC8 02:8DB8: 20        .byte $20   ; 04 
- D 0 - - - 0x008DC9 02:8DB9: 20        .byte $20   ; 05 
- D 0 - - - 0x008DCA 02:8DBA: 40        .byte $40   ; 06 
- D 0 - - - 0x008DCB 02:8DBB: 40        .byte $40   ; 07 



tbl_8DBC:
- D 0 - - - 0x008DCC 02:8DBC: 70        .byte $70   ; 00 
- D 0 - - - 0x008DCD 02:8DBD: 90        .byte $90   ; 01 
- D 0 - - - 0x008DCE 02:8DBE: 70        .byte $70   ; 02 
- D 0 - - - 0x008DCF 02:8DBF: 90        .byte $90   ; 03 
- D 0 - - - 0x008DD0 02:8DC0: 70        .byte $70   ; 04 
- D 0 - - - 0x008DD1 02:8DC1: 90        .byte $90   ; 05 
- D 0 - - - 0x008DD2 02:8DC2: 70        .byte $70   ; 06 
- D 0 - - - 0x008DD3 02:8DC3: 90        .byte $90   ; 07 



_off001_0x008DD4_53_boss_7_ear:
- D 0 - I - 0x008DD4 02:8DC4: CE 8D     .word ofs_038_53_8DCE_01_initialize_object ; 
- D 0 - I - 0x008DD6 02:8DC6: ED 8D     .word ofs_038_53_8DED_02 ; 
- D 0 - I - 0x008DD8 02:8DC8: 02 8E     .word ofs_038_53_8E02_03 ; 
- D 0 - I - 0x008DDA 02:8DCA: FD A2     .word ofs_038_53_0x00630D_04 ; 
- D 0 - I - 0x008DDC 02:8DCC: 05 8E     .word ofs_038_53_8E05_05 ; 



ofs_038_53_8DCE_01_initialize_object:
C - - J - - 0x008DDE 02:8DCE: A9 01     LDA #$01
C - - - - - 0x008DE0 02:8DD0: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x008DE3 02:8DD3: A9 10     LDA #$10
C - - - - - 0x008DE5 02:8DD5: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x008DE8 02:8DD8: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008DEB 02:8DDB: 4A        LSR
C - - - - - 0x008DEC 02:8DDC: A9 C4     LDA #$C4
C - - - - - 0x008DEE 02:8DDE: B0 02     BCS bra_8DE2
C - - - - - 0x008DF0 02:8DE0: A9 3C     LDA #$3C
bra_8DE2:
C - - - - - 0x008DF2 02:8DE2: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x008DF5 02:8DE5: A9 27     LDA #$27
C - - - - - 0x008DF7 02:8DE7: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x008DFA 02:8DEA: 4C E0 A2  JMP loc_0x0062F0



ofs_038_53_8DED_02:
C - - J - - 0x008DFD 02:8DED: A9 01     LDA #$01
C - - - - - 0x008DFF 02:8DEF: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x008E02 02:8DF2: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008E05 02:8DF5: D0 0A     BNE bra_8E01_RTS
C - - - - - 0x008E07 02:8DF7: A0 56     LDY #con_obj_id_56
C - - - - - 0x008E09 02:8DF9: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x008E0C 02:8DFC: A9 A0     LDA #$A0
C - - - - - 0x008E0E 02:8DFE: 9D E6 06  STA ram_06E6_obj,X
bra_8E01_RTS:
C - - - - - 0x008E11 02:8E01: 60        RTS



ofs_038_53_8E02_03: ; bzk optimize
C - - J - - 0x008E12 02:8E02: 4C 9A A2  JMP loc_0x0062AA



ofs_038_53_8E05_05: ; bzk optimize
C - - J - - 0x008E15 02:8E05: 4C 3D A3  JMP loc_0x00634D_delete_object_04



_off001_0x008E18_54_boss_7_fireball:
- D 0 - I - 0x008E18 02:8E08: 14 8E     .word ofs_038_54_8E14_01_initialize_object ; 
- D 0 - I - 0x008E1A 02:8E0A: 23 8E     .word ofs_038_54_8E23_02 ; 
- D 0 - I - 0x008E1C 02:8E0C: 39 8E     .word ofs_038_54_8E39_03 ; 
- D 0 - I - 0x008E1E 02:8E0E: 9A A2     .word ofs_038_54_0x0062AA_04 ; 
- D 0 - I - 0x008E20 02:8E10: FD A2     .word ofs_038_54_0x00630D_05 ; 
- D 0 - I - 0x008E22 02:8E12: 3D A3     .word ofs_038_54_0x00634D_06_delete_object_04 ; 



ofs_038_54_8E14_01_initialize_object:
C - - J - - 0x008E24 02:8E14: A9 03     LDA #$03
C - - - - - 0x008E26 02:8E16: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x008E29 02:8E19: A9 02     LDA #$02
C - - - - - 0x008E2B 02:8E1B: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x008E2E 02:8E1E: A9 28     LDA #$28
C - - - - - 0x008E30 02:8E20: 4C E0 A2  JMP loc_0x0062F0



ofs_038_54_8E23_02:
C - - J - - 0x008E33 02:8E23: A0 11     LDY #$11
C - - - - - 0x008E35 02:8E25: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008E38 02:8E28: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008E3B 02:8E2B: D0 0B     BNE bra_8E38_RTS
C - - - - - 0x008E3D 02:8E2D: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x008E40 02:8E30: A0 07     LDY #$07
C - - - - - 0x008E42 02:8E32: 20 57 A9  JSR sub_0x006967
C - - - - - 0x008E45 02:8E35: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8E38_RTS:
C - - - - - 0x008E48 02:8E38: 60        RTS



ofs_038_54_8E39_03:
C - - J - - 0x008E49 02:8E39: A0 11     LDY #$11
C - - - - - 0x008E4B 02:8E3B: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008E4E 02:8E3E: 4C D3 A6  JMP loc_0x0066E3



_off001_0x008E51_55_boss_7_red_spikeball:
- D 0 - I - 0x008E51 02:8E41: 4B 8E     .word ofs_038_55_8E4B_01_initialize_object ; 
- D 0 - I - 0x008E53 02:8E43: 82 8E     .word ofs_038_55_8E82_02 ; 
- D 0 - I - 0x008E55 02:8E45: 9A A2     .word ofs_038_55_0x0062AA_03 ; 
- D 0 - I - 0x008E57 02:8E47: FD A2     .word ofs_038_55_0x00630D_04 ; 
- D 0 - I - 0x008E59 02:8E49: 3D A3     .word ofs_038_55_0x00634D_05_delete_object_04 ; 



ofs_038_55_8E4B_01_initialize_object:
C - - J - - 0x008E5B 02:8E4B: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x008E5E 02:8E4E: A0 06     LDY #$06
C - - - - - 0x008E60 02:8E50: 84 06     STY ram_0006
C - - - - - 0x008E62 02:8E52: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x008E65 02:8E55: 20 F0 F4  JSR sub_0x01F500
C - - - - - 0x008E68 02:8E58: BC 1E 07  LDY ram_obj_flags,X
C - - - - - 0x008E6B 02:8E5B: B9 7F 8E  LDA tbl_8E7F,Y
C - - - - - 0x008E6E 02:8E5E: 18        CLC
C - - - - - 0x008E6F 02:8E5F: 65 0C     ADC ram_000C
C - - - - - 0x008E71 02:8E61: C9 18     CMP #$18
C - - - - - 0x008E73 02:8E63: 90 02     BCC bra_8E67
- - - - - - 0x008E75 02:8E65: A9 00     LDA #$00
bra_8E67:
C - - - - - 0x008E77 02:8E67: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x008E7A 02:8E6A: A0 06     LDY #$06
C - - - - - 0x008E7C 02:8E6C: 20 23 A9  JSR sub_0x006933
C - - - - - 0x008E7F 02:8E6F: A9 02     LDA #$02
C - - - - - 0x008E81 02:8E71: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x008E84 02:8E74: A9 20     LDA #$20
C - - - - - 0x008E86 02:8E76: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x008E89 02:8E79: A9 2C     LDA #$2C
C - - - - - 0x008E8B 02:8E7B: 4C E0 A2  JMP loc_0x0062F0


; bzk garbage
- - - - - - 0x008E8E 02:8E7E: 60        RTS



tbl_8E7F:
- D 0 - - - 0x008E8F 02:8E7F: 00        .byte $00   ; 00 
- D 0 - - - 0x008E90 02:8E80: 04        .byte $04   ; 01 
- D 0 - - - 0x008E91 02:8E81: FC        .byte $FC   ; 02 



ofs_038_55_8E82_02:
C - - J - - 0x008E92 02:8E82: A0 12     LDY #$12
C - - - - - 0x008E94 02:8E84: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008E97 02:8E87: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x008E9A 02:8E8A: F0 15     BEQ bra_8EA1
C - - - - - 0x008E9C 02:8E8C: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008E9F 02:8E8F: D0 10     BNE bra_8EA1
C - - - - - 0x008EA1 02:8E91: A9 06     LDA #$06
C - - - - - 0x008EA3 02:8E93: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x008EA6 02:8E96: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x008EA9 02:8E99: A0 06     LDY #$06
C - - - - - 0x008EAB 02:8E9B: 20 23 A9  JSR sub_0x006933
C - - - - - 0x008EAE 02:8E9E: DE 56 07  DEC ram_0756_obj,X
bra_8EA1:
C - - - - - 0x008EB1 02:8EA1: 4C D3 A6  JMP loc_0x0066E3



_off001_0x008EB4_56_boss_7_slime:
- D 0 - I - 0x008EB4 02:8EA4: B8 8E     .word ofs_038_56_8EB8_01_initialize_object ; 
- D 0 - I - 0x008EB6 02:8EA6: C0 8E     .word ofs_038_56_8EC0_02 ; 
- D 0 - I - 0x008EB8 02:8EA8: DA 8E     .word ofs_038_56_8EDA_03 ; 
- D 0 - I - 0x008EBA 02:8EAA: 01 8F     .word ofs_038_56_8F01_04 ; 
- D 0 - I - 0x008EBC 02:8EAC: 51 8F     .word ofs_038_56_8F51_05 ; 
- D 0 - I - 0x008EBE 02:8EAE: 70 8F     .word ofs_038_56_8F70_06 ; 
- D 0 - I - 0x008EC0 02:8EB0: 92 8F     .word ofs_038_56_8F92_07 ; 
- D 0 - I - 0x008EC2 02:8EB2: 9A A2     .word ofs_038_56_0x0062AA_08 ; 
- D 0 - I - 0x008EC4 02:8EB4: FD A2     .word ofs_038_56_0x00630D_09 ; 
- D 0 - I - 0x008EC6 02:8EB6: 3D A3     .word ofs_038_56_0x00634D_0A_delete_object_04 ; 



ofs_038_56_8EB8_01_initialize_object:
C - - J - - 0x008EC8 02:8EB8: 20 9E 8F  JSR sub_8F9E
C - - - - - 0x008ECB 02:8EBB: A9 0C     LDA #$0C
C - - - - - 0x008ECD 02:8EBD: 4C E0 A2  JMP loc_0x0062F0



ofs_038_56_8EC0_02:
C - - J - - 0x008ED0 02:8EC0: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008ED3 02:8EC3: D0 3B     BNE bra_8F00_RTS
C - - - - - 0x008ED5 02:8EC5: A9 0C     LDA #$0C
C - - - - - 0x008ED7 02:8EC7: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x008EDA 02:8ECA: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x008EDD 02:8ECD: 20 9E 8F  JSR sub_8F9E
C - - - - - 0x008EE0 02:8ED0: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x008EE3 02:8ED3: C9 03     CMP #$03
C - - - - - 0x008EE5 02:8ED5: 90 29     BCC bra_8F00_RTS
C - - - - - 0x008EE7 02:8ED7: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_56_8EDA_03:
C - - J - - 0x008EEA 02:8EDA: A9 10     LDA #$10
C - - - - - 0x008EEC 02:8EDC: 20 CB AA  JSR sub_0x006ADB
C - - - - - 0x008EEF 02:8EDF: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x008EF2 02:8EE2: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008EF5 02:8EE5: C9 4C     CMP #$4C
C - - - - - 0x008EF7 02:8EE7: 90 17     BCC bra_8F00_RTS
C - - - - - 0x008EF9 02:8EE9: A9 4C     LDA #$4C
C - - - - - 0x008EFB 02:8EEB: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x008EFE 02:8EEE: A9 05     LDA #$05
C - - - - - 0x008F00 02:8EF0: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x008F03 02:8EF3: 20 CA A7  JSR sub_0x0067DA_clear_spd_Y
C - - - - - 0x008F06 02:8EF6: A9 00     LDA #$00
C - - - - - 0x008F08 02:8EF8: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x008F0B 02:8EFB: A9 10     LDA #$10
C - - - - - 0x008F0D 02:8EFD: 4C E0 A2  JMP loc_0x0062F0
bra_8F00_RTS:
C - - - - - 0x008F10 02:8F00: 60        RTS



ofs_038_56_8F01_04:
C - - J - - 0x008F11 02:8F01: A0 13     LDY #$13
C - - - - - 0x008F13 02:8F03: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008F16 02:8F06: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008F19 02:8F09: 29 01     AND #$01
C - - - - - 0x008F1B 02:8F0B: 0A        ASL
C - - - - - 0x008F1C 02:8F0C: 85 00     STA ram_0000
C - - - - - 0x008F1E 02:8F0E: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x008F21 02:8F11: 2A        ROL
C - - - - - 0x008F22 02:8F12: 2A        ROL
C - - - - - 0x008F23 02:8F13: 29 01     AND #$01
C - - - - - 0x008F25 02:8F15: 18        CLC
C - - - - - 0x008F26 02:8F16: 65 00     ADC ram_0000    ; 00/02
C - - - - - 0x008F28 02:8F18: A8        TAY
C - - - - - 0x008F29 02:8F19: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x008F2C 02:8F1C: D9 4D 8F  CMP tbl_8F4D,Y
C - - - - - 0x008F2F 02:8F1F: 6A        ROR
C - - - - - 0x008F30 02:8F20: 5D CA 06  EOR ram_spd_X_hi_obj,X
C - - - - - 0x008F33 02:8F23: 10 03     BPL bra_8F28
C - - - - - 0x008F35 02:8F25: 20 DC A7  JSR sub_0x0067EC_inverse_spd_X
bra_8F28:
C - - - - - 0x008F38 02:8F28: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x008F3B 02:8F2B: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008F3E 02:8F2E: D0 D0     BNE bra_8F00_RTS
C - - - - - 0x008F40 02:8F30: A9 30     LDA #$30
C - - - - - 0x008F42 02:8F32: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x008F45 02:8F35: 20 C9 8F  JSR sub_8FC9
C - - - - - 0x008F48 02:8F38: DE 56 07  DEC ram_0756_obj,X
C - - - - - 0x008F4B 02:8F3B: D0 C3     BNE bra_8F00_RTS
C - - - - - 0x008F4D 02:8F3D: 20 D3 A7  JSR sub_0x0067E3_clear_spd_X
C - - - - - 0x008F50 02:8F40: A9 04     LDA #$04
C - - - - - 0x008F52 02:8F42: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x008F55 02:8F45: 20 9A 8F  JSR sub_8F9A
C - - - - - 0x008F58 02:8F48: A9 0C     LDA #$0C
C - - - - - 0x008F5A 02:8F4A: 4C E0 A2  JMP loc_0x0062F0



tbl_8F4D:
; 00 
- D 0 - - - 0x008F5D 02:8F4D: 60        .byte $60   ; 00 
- D 0 - - - 0x008F5E 02:8F4E: 20        .byte $20   ; 01 
; 01 
- D 0 - - - 0x008F5F 02:8F4F: E0        .byte $E0   ; 00 
- D 0 - - - 0x008F60 02:8F50: A0        .byte $A0   ; 01 



ofs_038_56_8F51_05:
C - - J - - 0x008F61 02:8F51: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x008F64 02:8F54: D0 AA     BNE bra_8F00_RTS
C - - - - - 0x008F66 02:8F56: A9 0C     LDA #$0C
C - - - - - 0x008F68 02:8F58: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x008F6B 02:8F5B: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x008F6E 02:8F5E: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x008F71 02:8F61: C9 07     CMP #$07
C - - - - - 0x008F73 02:8F63: B0 03     BCS bra_8F68
C - - - - - 0x008F75 02:8F65: 4C 9A 8F  JMP loc_8F9A
bra_8F68:
C - - - - - 0x008F78 02:8F68: A9 97     LDA #$97
C - - - - - 0x008F7A 02:8F6A: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x008F7D 02:8F6D: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_56_8F70_06:
C - - J - - 0x008F80 02:8F70: A9 10     LDA #$10
C - - - - - 0x008F82 02:8F72: 20 CB AA  JSR sub_0x006ADB
C - - - - - 0x008F85 02:8F75: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x008F88 02:8F78: A9 0C     LDA #$0C
C - - - - - 0x008F8A 02:8F7A: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x008F8D 02:8F7D: F0 81     BEQ bra_8F00_RTS
C - - - - - 0x008F8F 02:8F7F: 20 3D A8  JSR sub_0x00684D
C - - - - - 0x008F92 02:8F82: 20 CA A7  JSR sub_0x0067DA_clear_spd_Y
C - - - - - 0x008F95 02:8F85: A0 02     LDY #$02
C - - - - - 0x008F97 02:8F87: 20 CB 8F  JSR sub_8FCB
C - - - - - 0x008F9A 02:8F8A: A9 00     LDA #$00
C - - - - - 0x008F9C 02:8F8C: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x008F9F 02:8F8F: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_56_8F92_07:
C - - J - - 0x008FA2 02:8F92: A0 14     LDY #$14
C - - - - - 0x008FA4 02:8F94: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x008FA7 02:8F97: 4C D3 A6  JMP loc_0x0066E3



sub_8F9A:
loc_8F9A:
C D 0 - - - 0x008FAA 02:8F9A: A9 96     LDA #$96
C - - - - - 0x008FAC 02:8F9C: D0 02     BNE bra_8FA0    ; jmp



sub_8F9E:
C - - - - - 0x008FAE 02:8F9E: A9 94     LDA #$94
bra_8FA0:
C - - - - - 0x008FB0 02:8FA0: 18        CLC
C - - - - - 0x008FB1 02:8FA1: 7D 10 07  ADC ram_0710_obj,X
C - - - - - 0x008FB4 02:8FA4: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x008FB7 02:8FA7: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x008FBA 02:8FAA: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x008FBD 02:8FAD: 18        CLC
C - - - - - 0x008FBE 02:8FAE: 79 C2 8F  ADC tbl_8FC2,Y
C - - - - - 0x008FC1 02:8FB1: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x008FC4 02:8FB4: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x008FC7 02:8FB7: 4A        LSR
loc_8FB8:
C D 0 - - - 0x008FC8 02:8FB8: A9 03     LDA #$03
C - - - - - 0x008FCA 02:8FBA: 90 02     BCC bra_8FBE
C - - - - - 0x008FCC 02:8FBC: A9 43     LDA #$43
bra_8FBE:
C - - - - - 0x008FCE 02:8FBE: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x008FD1 02:8FC1: 60        RTS



tbl_8FC2:
- D 0 - - - 0x008FD2 02:8FC2: 00        .byte $00   ; 00 
- D 0 - - - 0x008FD3 02:8FC3: 04        .byte $04   ; 01 
- D 0 - - - 0x008FD4 02:8FC4: 08        .byte $08   ; 02 
- D 0 - - - 0x008FD5 02:8FC5: 04        .byte $04   ; 03 
- D 0 - - - 0x008FD6 02:8FC6: 04        .byte $04   ; 04 
- D 0 - - - 0x008FD7 02:8FC7: 08        .byte $08   ; 05 
- D 0 - - - 0x008FD8 02:8FC8: 02        .byte $02   ; 06 



sub_8FC9:
C - - - - - 0x008FD9 02:8FC9: A0 00     LDY #$00
sub_8FCB:
C - - - - - 0x008FDB 02:8FCB: B9 EE 8F  LDA tbl_8FEE_spd_X,Y
C - - - - - 0x008FDE 02:8FCE: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x008FE1 02:8FD1: B9 EF 8F  LDA tbl_8FEE_spd_X + $01,Y
C - - - - - 0x008FE4 02:8FD4: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x008FE7 02:8FD7: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x008FEA 02:8FDA: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x008FED 02:8FDD: D9 4C 05  CMP ram_pos_X_hi_plr,Y
C - - - - - 0x008FF0 02:8FE0: 90 03     BCC bra_8FE5
C - - - - - 0x008FF2 02:8FE2: 20 DC A7  JSR sub_0x0067EC_inverse_spd_X
bra_8FE5:
C - - - - - 0x008FF5 02:8FE5: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x008FF8 02:8FE8: 49 80     EOR #$80
C - - - - - 0x008FFA 02:8FEA: 0A        ASL
C - - - - - 0x008FFB 02:8FEB: 4C B8 8F  JMP loc_8FB8



tbl_8FEE_spd_X:
- D 0 - - - 0x008FFE 02:8FEE: 80 00     .word $0080 ; 00 
- D 0 - - - 0x009000 02:8FF0: 80 01     .word $0180 ; 02 



_off001_0x009002_51_boss_7_mouth:
- D 0 - I - 0x009002 02:8FF2: 08 90     .word ofs_038_51_9008_01_initialize_object ; 
- D 0 - I - 0x009004 02:8FF4: 1D 90     .word ofs_038_51_901D_02 ; 
- D 0 - I - 0x009006 02:8FF6: 71 90     .word ofs_038_51_9071_03 ; 
- D 0 - I - 0x009008 02:8FF8: 80 90     .word ofs_038_51_9080_04 ; 
- D 0 - I - 0x00900A 02:8FFA: B5 90     .word ofs_038_51_90B5_05 ; 
- D 0 - I - 0x00900C 02:8FFC: E6 90     .word ofs_038_51_90E6_06 ; 
- D 0 - I - 0x00900E 02:8FFE: B8 A3     .word ofs_038_51_0x0063C8_07 ; 
- D 0 - I - 0x009010 02:9000: D8 A3     .word ofs_038_51_0x0063E8_08 ; 
- D 0 - I - 0x009012 02:9002: 06 91     .word ofs_038_51_9106_09 ; 
- D 0 - I - 0x009014 02:9004: F6 A2     .word ofs_038_51_0x006306_0A ; 
- D 0 - I - 0x009016 02:9006: 10 91     .word ofs_038_51_9110_0B ; 



ofs_038_51_9008_01_initialize_object:
C - - J - - 0x009018 02:9008: A9 11     LDA #$11
C - - - - - 0x00901A 02:900A: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x00901D 02:900D: A9 20     LDA #$20
C - - - - - 0x00901F 02:900F: 20 99 AB  JSR sub_0x006BA9_set_dynamic_hp_to_boss
C - - - - - 0x009022 02:9012: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x009025 02:9015: A9 F0     LDA #con__hp_F0
C - - - - - 0x009027 02:9017: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x00902A 02:901A: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_51_901D_02:
C - - J - - 0x00902D 02:901D: A9 01     LDA #$01
C - - - - - 0x00902F 02:901F: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x009032 02:9022: A5 7D     LDA ram_007D_flag
C - - - - - 0x009034 02:9024: C9 C0     CMP #$C0
C - - - - - 0x009036 02:9026: D0 45     BNE bra_906D_RTS
C - - - - - 0x009038 02:9028: A9 31     LDA #con_sound_31
C - - - - - 0x00903A 02:902A: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x00903D 02:902D: A9 48     LDA #$48
C - - - - - 0x00903F 02:902F: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x009042 02:9032: A9 80     LDA #$80
C - - - - - 0x009044 02:9034: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x009047 02:9037: A9 0A     LDA #con_irq_area_7_boss
C - - - - - 0x009049 02:9039: 85 27     STA ram_irq_handler_hi
C - - - - - 0x00904B 02:903B: A9 52     LDA #$52
C - - - - - 0x00904D 02:903D: 85 45     STA ram_0045
C - - - - - 0x00904F 02:903F: A9 E0     LDA #$E0
C - - - - - 0x009051 02:9041: 85 FC     STA ram_scroll_Y
C - - - - - 0x009053 02:9043: 85 F9     STA ram_00F9
C - - - - - 0x009055 02:9045: A5 FD     LDA ram_scroll_X
C - - - - - 0x009057 02:9047: 85 FA     STA ram_00FA
C - - - - - 0x009059 02:9049: A5 FF     LDA ram_for_2000
C - - - - - 0x00905B 02:904B: 85 FB     STA ram_00FB
C - - - - - 0x00905D 02:904D: A0 02     LDY #$02
bra_904F_loop:
C - - - - - 0x00905F 02:904F: 84 08     STY ram_0008
C - - - - - 0x009061 02:9051: B9 6E 90  LDA tbl_906E,Y
C - - - - - 0x009064 02:9054: A8        TAY
C - - - - - 0x009065 02:9055: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x009068 02:9058: 90 10     BCC bra_906A
C - - - - - 0x00906A 02:905A: A4 11     LDY ram_0011
C - - - - - 0x00906C 02:905C: A5 08     LDA ram_0008
C - - - - - 0x00906E 02:905E: 99 1E 07  STA ram_obj_flags,Y
C - - - - - 0x009071 02:9061: 8A        TXA
C - - - - - 0x009072 02:9062: 99 80 07  STA ram_0780_obj,Y
C - - - - - 0x009075 02:9065: A4 08     LDY ram_0008
C - - - - - 0x009077 02:9067: 88        DEY
C - - - - - 0x009078 02:9068: 10 E5     BPL bra_904F_loop
bra_906A:
C - - - - - 0x00907A 02:906A: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_906D_RTS:
C - - - - - 0x00907D 02:906D: 60        RTS



tbl_906E:
- D 0 - - - 0x00907E 02:906E: 52        .byte con_obj_id_52   ; 00 
- D 0 - - - 0x00907F 02:906F: 53        .byte con_obj_id_53   ; 01 
- D 0 - - - 0x009080 02:9070: 53        .byte con_obj_id_53   ; 02 



ofs_038_51_9071_03:
C - - J - - 0x009081 02:9071: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x009084 02:9074: F0 F7     BEQ bra_906D_RTS
C - - - - - 0x009086 02:9076: A9 01     LDA #$01
C - - - - - 0x009088 02:9078: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x00908B 02:907B: A9 40     LDA #$40
C - - - - - 0x00908D 02:907D: 4C E0 A2  JMP loc_0x0062F0



ofs_038_51_9080_04:
C - - J - - 0x009090 02:9080: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x009093 02:9083: D0 29     BNE bra_90AE_RTS
C - - - - - 0x009095 02:9085: 20 13 91  JSR sub_9113
C - - - - - 0x009098 02:9088: A9 01     LDA #$01
C - - - - - 0x00909A 02:908A: B0 1F     BCS bra_90AB
C - - - - - 0x00909C 02:908C: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x00909F 02:908F: C9 02     CMP #$02
C - - - - - 0x0090A1 02:9091: A9 08     LDA #$08
C - - - - - 0x0090A3 02:9093: 90 13     BCC bra_90A8
C - - - - - 0x0090A5 02:9095: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x0090A8 02:9098: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0090AB 02:909B: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x0090AE 02:909E: A9 08     LDA #$08
C - - - - - 0x0090B0 02:90A0: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x0090B3 02:90A3: A9 50     LDA #$50
C - - - - - 0x0090B5 02:90A5: 4C E0 A2  JMP loc_0x0062F0
bra_90A8:
C - - - - - 0x0090B8 02:90A8: FE 10 07  INC ram_0710_obj,X
bra_90AB:
loc_90AB:
C D 0 - - - 0x0090BB 02:90AB: 9D E6 06  STA ram_06E6_obj,X
bra_90AE_RTS:
C - - - - - 0x0090BE 02:90AE: 60        RTS



bra_90AF:
C - - - - - 0x0090BF 02:90AF: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x0090C2 02:90B2: 4C AB 90  JMP loc_90AB



ofs_038_51_90B5_05:
C - - J - - 0x0090C5 02:90B5: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x0090C8 02:90B8: D0 17     BNE bra_90D1
C - - - - - 0x0090CA 02:90BA: A0 02     LDY #$02
bra_90BC_loop:
C - - - - - 0x0090CC 02:90BC: 84 08     STY ram_0008
C - - - - - 0x0090CE 02:90BE: A0 55     LDY #con_obj_id_55
C - - - - - 0x0090D0 02:90C0: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x0090D3 02:90C3: 90 0C     BCC bra_90D1
C - - - - - 0x0090D5 02:90C5: A4 11     LDY ram_0011
C - - - - - 0x0090D7 02:90C7: A5 08     LDA ram_0008
C - - - - - 0x0090D9 02:90C9: 99 1E 07  STA ram_obj_flags,Y
C - - - - - 0x0090DC 02:90CC: A4 08     LDY ram_0008
C - - - - - 0x0090DE 02:90CE: 88        DEY
C - - - - - 0x0090DF 02:90CF: 10 EB     BPL bra_90BC_loop
bra_90D1:
C - - - - - 0x0090E1 02:90D1: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0090E4 02:90D4: D0 D8     BNE bra_90AE_RTS
C - - - - - 0x0090E6 02:90D6: BD 76 06  LDA ram_obj_hp,X
C - - - - - 0x0090E9 02:90D9: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x0090EC 02:90DC: A9 F0     LDA #con__hp_F0
C - - - - - 0x0090EE 02:90DE: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x0090F1 02:90E1: A9 01     LDA #$01
C - - - - - 0x0090F3 02:90E3: 4C E0 A2  JMP loc_0x0062F0



ofs_038_51_90E6_06:
C - - J - - 0x0090F6 02:90E6: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0090F9 02:90E9: D0 C3     BNE bra_90AE_RTS
C - - - - - 0x0090FB 02:90EB: 20 13 91  JSR sub_9113
C - - - - - 0x0090FE 02:90EE: A9 01     LDA #$01
C - - - - - 0x009100 02:90F0: B0 B9     BCS bra_90AB
C - - - - - 0x009102 02:90F2: A9 08     LDA #$08
C - - - - - 0x009104 02:90F4: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x009107 02:90F7: D0 B6     BNE bra_90AF
C - - - - - 0x009109 02:90F9: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x00910C 02:90FC: A9 80     LDA #$80
C - - - - - 0x00910E 02:90FE: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x009111 02:9101: A9 04     LDA #$04
C - - - - - 0x009113 02:9103: 4C 83 A2  JMP loc_0x006293_set_obj_state



ofs_038_51_9106_09:
C - - J - - 0x009116 02:9106: A9 03     LDA #$03
C - - - - - 0x009118 02:9108: 20 16 91  JSR sub_9116
C - - - - - 0x00911B 02:910B: B0 A1     BCS bra_90AE_RTS
C - - - - - 0x00911D 02:910D: 4C A2 A2  JMP loc_0x0062B2



ofs_038_51_9110_0B: ; bzk optimize
C - - J - - 0x009120 02:9110: 4C 37 A3  JMP loc_0x006347_delete_object_08



sub_9113:
C - - - - - 0x009123 02:9113: BD 10 07  LDA ram_0710_obj,X
sub_9116:
C - - - - - 0x009126 02:9116: 18        CLC
C - - - - - 0x009127 02:9117: 69 04     ADC #$04
C - - - - - 0x009129 02:9119: A0 04     LDY #$04
C - - - - - 0x00912B 02:911B: 4C 54 8D  JMP loc_8D54



sub_911E:
C - - - - - 0x00912E 02:911E: 84 02     STY ram_0002
C - - - - - 0x009130 02:9120: A5 FD     LDA ram_scroll_X
C - - - - - 0x009132 02:9122: 4A        LSR
C - - - - - 0x009133 02:9123: 4A        LSR
C - - - - - 0x009134 02:9124: 4A        LSR
C - - - - - 0x009135 02:9125: 4A        LSR
C - - - - - 0x009136 02:9126: 85 00     STA ram_0000
C - - - - - 0x009138 02:9128: A0 00     LDY #$00
C - - - - - 0x00913A 02:912A: A5 FC     LDA ram_scroll_Y
C - - - - - 0x00913C 02:912C: 29 F0     AND #$F0
C - - - - - 0x00913E 02:912E: 85 01     STA ram_0001
C - - - - - 0x009140 02:9130: D0 02     BNE bra_9134
C - - - - - 0x009142 02:9132: A4 02     LDY ram_0002
bra_9134:
C - - - - - 0x009144 02:9134: 84 02     STY ram_0002
C - - - - - 0x009146 02:9136: A9 00     LDA #$00
C - - - - - 0x009148 02:9138: A4 82     LDY ram_0082
C - - - - - 0x00914A 02:913A: F0 06     BEQ bra_9142
bra_913C_loop:
C - - - - - 0x00914C 02:913C: 18        CLC
C - - - - - 0x00914D 02:913D: 65 89     ADC ram_0089
C - - - - - 0x00914F 02:913F: 88        DEY
C - - - - - 0x009150 02:9140: D0 FA     BNE bra_913C_loop
bra_9142:
C - - - - - 0x009152 02:9142: 18        CLC
C - - - - - 0x009153 02:9143: 65 63     ADC ram_0063
C - - - - - 0x009155 02:9145: 85 03     STA ram_0003
bra_9147_RTS:
C - - - - - 0x009157 02:9147: 60        RTS



loc_0x009158:
C D 0 - - - 0x009158 02:9148: A5 5C     LDA ram_005C
C - - - - - 0x00915A 02:914A: D0 FB     BNE bra_9147_RTS
C - - - - - 0x00915C 02:914C: A5 61     LDA ram_0061
C - - - - - 0x00915E 02:914E: D0 03     BNE bra_9153
C - - - - - 0x009160 02:9150: 20 D5 91  JSR sub_91D5
bra_9153:
C - - - - - 0x009163 02:9153: A5 71     LDA ram_0071_flag
C - - - - - 0x009165 02:9155: C9 C0     CMP #$C0
C - - - - - 0x009167 02:9157: F0 EE     BEQ bra_9147_RTS
C - - - - - 0x009169 02:9159: A0 00     LDY #$00
C - - - - - 0x00916B 02:915B: 20 1E 91  JSR sub_911E
C - - - - - 0x00916E 02:915E: A5 72     LDA ram_cam_spd_Y
C - - - - - 0x009170 02:9160: F0 E5     BEQ bra_9147_RTS
C - - - - - 0x009172 02:9162: 0A        ASL
C - - - - - 0x009173 02:9163: A9 07     LDA #$07
C - - - - - 0x009175 02:9165: B0 02     BCS bra_9169
C - - - - - 0x009177 02:9167: A9 0A     LDA #$0A
bra_9169:
C - - - - - 0x009179 02:9169: 85 04     STA ram_0004
C - - - - - 0x00917B 02:916B: A5 FC     LDA ram_scroll_Y
C - - - - - 0x00917D 02:916D: 29 0F     AND #$0F
C - - - - - 0x00917F 02:916F: C5 04     CMP ram_0004
C - - - - - 0x009181 02:9171: 6A        ROR
C - - - - - 0x009182 02:9172: 45 72     EOR ram_cam_spd_Y
C - - - - - 0x009184 02:9174: 10 D1     BPL bra_9147_RTS
C - - - - - 0x009186 02:9176: A5 01     LDA ram_0001
C - - - - - 0x009188 02:9178: C5 8B     CMP ram_008B
C - - - - - 0x00918A 02:917A: F0 CB     BEQ bra_9147_RTS
C - - - - - 0x00918C 02:917C: 85 8B     STA ram_008B
C - - - - - 0x00918E 02:917E: A5 72     LDA ram_cam_spd_Y
C - - - - - 0x009190 02:9180: 30 18     BMI bra_919A
C - - - - - 0x009192 02:9182: A9 E0     LDA #$E0
C - - - - - 0x009194 02:9184: 18        CLC
C - - - - - 0x009195 02:9185: 65 01     ADC ram_0001
C - - - - - 0x009197 02:9187: B0 04     BCS bra_918D
C - - - - - 0x009199 02:9189: C9 F0     CMP #$F0
C - - - - - 0x00919B 02:918B: 90 0B     BCC bra_9198
bra_918D:
C - - - - - 0x00919D 02:918D: 69 0F     ADC #$0F
C - - - - - 0x00919F 02:918F: A8        TAY
C - - - - - 0x0091A0 02:9190: A5 03     LDA ram_0003
C - - - - - 0x0091A2 02:9192: 18        CLC
C - - - - - 0x0091A3 02:9193: 65 89     ADC ram_0089
C - - - - - 0x0091A5 02:9195: 85 03     STA ram_0003
C - - - - - 0x0091A7 02:9197: 98        TYA
bra_9198:
C - - - - - 0x0091A8 02:9198: 85 01     STA ram_0001
bra_919A:
loc_919A_loop:
C D 0 - - - 0x0091AA 02:919A: 20 29 92  JSR sub_9229_spawn_object_from_area_data
C - - - - - 0x0091AD 02:919D: A0 00     LDY #$00
bra_919F_loop:
C - - - - - 0x0091AF 02:919F: B1 0A     LDA (ram_000A),Y
C - - - - - 0x0091B1 02:91A1: C9 FF     CMP #$FF
C - - - - - 0x0091B3 02:91A3: F0 25     BEQ bra_91CA_FF
C - - - - - 0x0091B5 02:91A5: 29 F0     AND #$F0
C - - - - - 0x0091B7 02:91A7: C5 01     CMP ram_0001
C - - - - - 0x0091B9 02:91A9: F0 04     BEQ bra_91AF
C - - - - - 0x0091BB 02:91AB: B0 18     BCS bra_91C5
C - - - - - 0x0091BD 02:91AD: D0 11     BNE bra_91C0    ; jmp
bra_91AF:
C - - - - - 0x0091BF 02:91AF: B1 0A     LDA (ram_000A),Y
C - - - - - 0x0091C1 02:91B1: 29 0F     AND #$0F
C - - - - - 0x0091C3 02:91B3: C5 00     CMP ram_0000
C - - - - - 0x0091C5 02:91B5: 2A        ROL
C - - - - - 0x0091C6 02:91B6: 45 02     EOR ram_0002
C - - - - - 0x0091C8 02:91B8: 4A        LSR
C - - - - - 0x0091C9 02:91B9: 90 05     BCC bra_91C0
C - - - - - 0x0091CB 02:91BB: 20 57 92  JSR sub_9257
C - - - - - 0x0091CE 02:91BE: B0 DF     BCS bra_919F_loop
bra_91C0:
C - - - - - 0x0091D0 02:91C0: C8        INY
C - - - - - 0x0091D1 02:91C1: C8        INY
C - - - - - 0x0091D2 02:91C2: C8        INY
C - - - - - 0x0091D3 02:91C3: D0 DA     BNE bra_919F_loop    ; jmp?
bra_91C5:
C - - - - - 0x0091D5 02:91C5: A5 02     LDA ram_0002
C - - - - - 0x0091D7 02:91C7: F0 01     BEQ bra_91CA
bra_91C9_RTS:
C - - - - - 0x0091D9 02:91C9: 60        RTS
bra_91CA:
bra_91CA_FF:
C - - - - - 0x0091DA 02:91CA: A5 02     LDA ram_0002
C - - - - - 0x0091DC 02:91CC: D0 FB     BNE bra_91C9_RTS
C - - - - - 0x0091DE 02:91CE: E6 02     INC ram_0002
C - - - - - 0x0091E0 02:91D0: E6 03     INC ram_0003
C - - - - - 0x0091E2 02:91D2: 4C 9A 91  JMP loc_919A_loop



sub_91D5:
C - - - - - 0x0091E5 02:91D5: A5 85     LDA ram_0085
C - - - - - 0x0091E7 02:91D7: D0 F0     BNE bra_91C9_RTS
C - - - - - 0x0091E9 02:91D9: A0 02     LDY #$02
C - - - - - 0x0091EB 02:91DB: 20 1E 91  JSR sub_911E
C - - - - - 0x0091EE 02:91DE: A5 FD     LDA ram_scroll_X
C - - - - - 0x0091F0 02:91E0: 29 08     AND #$08
C - - - - - 0x0091F2 02:91E2: C5 8A     CMP ram_008A
C - - - - - 0x0091F4 02:91E4: F0 E3     BEQ bra_91C9_RTS
C - - - - - 0x0091F6 02:91E6: 85 8A     STA ram_008A
C - - - - - 0x0091F8 02:91E8: 29 08     AND #$08
C - - - - - 0x0091FA 02:91EA: F0 DD     BEQ bra_91C9_RTS
C - - - - - 0x0091FC 02:91EC: E6 03     INC ram_0003
loc_91EE_loop:
C D 0 - - - 0x0091FE 02:91EE: 20 29 92  JSR sub_9229_spawn_object_from_area_data
C - - - - - 0x009201 02:91F1: A0 00     LDY #$00
loc_91F3_loop:
bra_91F3_loop:
C D 0 - - - 0x009203 02:91F3: B1 0A     LDA (ram_000A),Y
C - - - - - 0x009205 02:91F5: C9 FF     CMP #$FF
C - - - - - 0x009207 02:91F7: F0 20     BEQ bra_9219
C - - - - - 0x009209 02:91F9: C5 01     CMP ram_0001
C - - - - - 0x00920B 02:91FB: 2A        ROL
C - - - - - 0x00920C 02:91FC: 45 02     EOR ram_0002
C - - - - - 0x00920E 02:91FE: 4A        LSR
C - - - - - 0x00920F 02:91FF: 90 13     BCC bra_9214
C - - - - - 0x009211 02:9201: B1 0A     LDA (ram_000A),Y
C - - - - - 0x009213 02:9203: 29 0F     AND #$0F
C - - - - - 0x009215 02:9205: C5 00     CMP ram_0000
C - - - - - 0x009217 02:9207: D0 06     BNE bra_920F
C - - - - - 0x009219 02:9209: 20 57 92  JSR sub_9257
C - - - - - 0x00921C 02:920C: 4C F3 91  JMP loc_91F3_loop
bra_920F:
C - - - - - 0x00921F 02:920F: C8        INY
C - - - - - 0x009220 02:9210: C8        INY
C - - - - - 0x009221 02:9211: C8        INY
C - - - - - 0x009222 02:9212: D0 DF     BNE bra_91F3_loop    ; jmp?
bra_9214:
C - - - - - 0x009224 02:9214: A5 02     LDA ram_0002
C - - - - - 0x009226 02:9216: F0 F7     BEQ bra_920F
bra_9218_RTS:
C - - - - - 0x009228 02:9218: 60        RTS
bra_9219:
C - - - - - 0x009229 02:9219: A5 02     LDA ram_0002
C - - - - - 0x00922B 02:921B: D0 FB     BNE bra_9218_RTS
C - - - - - 0x00922D 02:921D: E6 02     INC ram_0002
C - - - - - 0x00922F 02:921F: A5 03     LDA ram_0003
C - - - - - 0x009231 02:9221: 18        CLC
C - - - - - 0x009232 02:9222: 65 89     ADC ram_0089
C - - - - - 0x009234 02:9224: 85 03     STA ram_0003
C - - - - - 0x009236 02:9226: 4C EE 91  JMP loc_91EE_loop



sub_9229_spawn_object_from_area_data:
C - - - - - 0x009239 02:9229: A5 50     LDA ram_area
C - - - - - 0x00923B 02:922B: 0A        ASL
C - - - - - 0x00923C 02:922C: A8        TAY
C - - - - - 0x00923D 02:922D: B9 D4 F2  LDA tbl_0x01F2E4_area_objects_spawner,Y
C - - - - - 0x009240 02:9230: 85 08     STA ram_0008
C - - - - - 0x009242 02:9232: B9 D5 F2  LDA tbl_0x01F2E4_area_objects_spawner + $01,Y
C - - - - - 0x009245 02:9235: 85 09     STA ram_0009
C - - - - - 0x009247 02:9237: A9 00     LDA #$00
C - - - - - 0x009249 02:9239: 85 0A     STA ram_000A
; bzk optimize, max possible index in 0003 is 5A, no need for 16-bit multiplication
C - - - - - 0x00924B 02:923B: A5 03     LDA ram_0003
C - - - - - 0x00924D 02:923D: 0A        ASL
C - - - - - 0x00924E 02:923E: 26 0A     ROL ram_000A
C - - - - - 0x009250 02:9240: 18        CLC
C - - - - - 0x009251 02:9241: 65 08     ADC ram_0008
C - - - - - 0x009253 02:9243: 85 08     STA ram_0008
C - - - - - 0x009255 02:9245: A5 0A     LDA ram_000A
C - - - - - 0x009257 02:9247: 65 09     ADC ram_0009
C - - - - - 0x009259 02:9249: 85 09     STA ram_0009
C - - - - - 0x00925B 02:924B: A0 00     LDY #$00
C - - - - - 0x00925D 02:924D: B1 08     LDA (ram_0008),Y
C - - - - - 0x00925F 02:924F: 85 0A     STA ram_000A
C - - - - - 0x009261 02:9251: C8        INY
C - - - - - 0x009262 02:9252: B1 08     LDA (ram_0008),Y
C - - - - - 0x009264 02:9254: 85 0B     STA ram_000B
C - - - - - 0x009266 02:9256: 60        RTS
sub_9257:
C - - - - - 0x009267 02:9257: B1 0A     LDA (ram_000A),Y
C - - - - - 0x009269 02:9259: 85 0C     STA ram_000C    ; object position
C - - - - - 0x00926B 02:925B: C8        INY
C - - - - - 0x00926C 02:925C: B1 0A     LDA (ram_000A),Y
C - - - - - 0x00926E 02:925E: 85 0D     STA ram_000D    ; object flags
C - - - - - 0x009270 02:9260: C8        INY
C - - - - - 0x009271 02:9261: B1 0A     LDA (ram_000A),Y
C - - - - - 0x009273 02:9263: 85 08     STA ram_0008    ; object id
C - - - - - 0x009275 02:9265: C8        INY
C - - - - - 0x009276 02:9266: 84 07     STY ram_0007
C - - - - - 0x009278 02:9268: 20 FD F6  JSR sub_0x01F70D_try_to_find_free_object
C - - - - - 0x00927B 02:926B: F0 12     BEQ bra_927F_place_object
; if no free objects found
C - - - - - 0x00927D 02:926D: A5 0D     LDA ram_000D    ; object flags
C - - - - - 0x00927F 02:926F: 10 3D     BPL bra_92AE_failed_to_place_object
; if allowed to replace an enemy bullet with this object
C - - - - - 0x009281 02:9271: 20 1C F7  JSR sub_0x01F72C_try_to_find_enemy_bullet
C - - - - - 0x009284 02:9274: F0 09     BEQ bra_927F_place_object
; if no enemy bullets found
C - - - - - 0x009286 02:9276: 24 0D     BIT ram_000D    ; object flags
C - - - - - 0x009288 02:9278: 50 34     BVC bra_92AE_failed_to_place_object
; if allowed to forcibly create this object as a last resort
- - - - - - 0x00928A 02:927A: A2 00     LDX #$00
- - - - - - 0x00928C 02:927C: 20 3F F7  JSR sub_0x01F74F_start_preparing_new_object
bra_927F_place_object:
C - - - - - 0x00928F 02:927F: A5 0D     LDA ram_000D    ; object flags
C - - - - - 0x009291 02:9281: 29 7F     AND #$7F
C - - - - - 0x009293 02:9283: 9D 1E 07  STA ram_obj_flags,X
C - - - - - 0x009296 02:9286: A4 08     LDY ram_0008    ; object id
C - - - - - 0x009298 02:9288: 20 9E F7  JSR sub_0x01F7AE_prepare_object
C - - - - - 0x00929B 02:928B: A4 07     LDY ram_0007
C - - - - - 0x00929D 02:928D: A5 0C     LDA ram_000C    ; object position
C - - - - - 0x00929F 02:928F: 0A        ASL
C - - - - - 0x0092A0 02:9290: 0A        ASL
C - - - - - 0x0092A1 02:9291: 0A        ASL
C - - - - - 0x0092A2 02:9292: 0A        ASL
C - - - - - 0x0092A3 02:9293: 38        SEC
C - - - - - 0x0092A4 02:9294: E5 FD     SBC ram_scroll_X
C - - - - - 0x0092A6 02:9296: 18        CLC
C - - - - - 0x0092A7 02:9297: 69 08     ADC #$08
C - - - - - 0x0092A9 02:9299: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0092AC 02:929C: A5 0C     LDA ram_000C    ; object position
C - - - - - 0x0092AE 02:929E: 29 F0     AND #$F0
C - - - - - 0x0092B0 02:92A0: 09 08     ORA #$08
C - - - - - 0x0092B2 02:92A2: 38        SEC
C - - - - - 0x0092B3 02:92A3: E5 FC     SBC ram_scroll_Y
C - - - - - 0x0092B5 02:92A5: B0 02     BCS bra_92A9
C - - - - - 0x0092B7 02:92A7: E9 0F     SBC #$0F
bra_92A9:
C - - - - - 0x0092B9 02:92A9: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0092BC 02:92AC: 38        SEC
C - - - - - 0x0092BD 02:92AD: 60        RTS
bra_92AE_failed_to_place_object:
C - - - - - 0x0092BE 02:92AE: 18        CLC
C - - - - - 0x0092BF 02:92AF: 60        RTS



loc_0x0092C0:
C D 0 - - - 0x0092C0 02:92B0: A5 50     LDA ram_area
C - - - - - 0x0092C2 02:92B2: D0 14     BNE bra_92C8_RTS
C - - - - - 0x0092C4 02:92B4: 20 FD F6  JSR sub_0x01F70D_try_to_find_free_object
C - - - - - 0x0092C7 02:92B7: D0 0F     BNE bra_92C8_RTS
C - - - - - 0x0092C9 02:92B9: A0 62     LDY #con_obj_id_62
C - - - - - 0x0092CB 02:92BB: 20 9E F7  JSR sub_0x01F7AE_prepare_object
C - - - - - 0x0092CE 02:92BE: A9 60     LDA #$60
C - - - - - 0x0092D0 02:92C0: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0092D3 02:92C3: A9 1C     LDA #$1C
C - - - - - 0x0092D5 02:92C5: 9D 22 05  STA ram_pos_Y_hi_enemy,X
bra_92C8_RTS:
C - - - - - 0x0092D8 02:92C8: 60        RTS



_off013_0x0092D9_00_area_1:
- - - - - - 0x0092D9 02:92C9: 39 93     .word _off019_00_9339_00
- - - - - - 0x0092DB 02:92CB: 3A 93     .word _off019_00_933A_01
- - - - - - 0x0092DD 02:92CD: 3B 93     .word _off019_00_933B_02
- - - - - - 0x0092DF 02:92CF: 3C 93     .word _off019_00_933C_03
- - - - - - 0x0092E1 02:92D1: 3D 93     .word _off019_00_933D_04
- - - - - - 0x0092E3 02:92D3: 3E 93     .word _off019_00_933E_05
- - - - - - 0x0092E5 02:92D5: 3F 93     .word _off019_00_933F_06
- - - - - - 0x0092E7 02:92D7: 40 93     .word _off019_00_9340_07
- - - - - - 0x0092E9 02:92D9: 41 93     .word _off019_00_9341_08
- - - - - - 0x0092EB 02:92DB: 42 93     .word _off019_00_9342_09
- D 0 - I - 0x0092ED 02:92DD: 43 93     .word _off019_00_9343_0A
- D 0 - I - 0x0092EF 02:92DF: 44 93     .word _off019_00_9344_0B
- D 0 - I - 0x0092F1 02:92E1: 45 93     .word _off019_00_9345_0C
- - - - - - 0x0092F3 02:92E3: 46 93     .word _off019_00_9346_0D
- - - - - - 0x0092F5 02:92E5: 47 93     .word _off019_00_9347_0E
- - - - - - 0x0092F7 02:92E7: 48 93     .word _off019_00_9348_0F
- - - - - - 0x0092F9 02:92E9: 49 93     .word _off019_00_9349_10
- - - - - - 0x0092FB 02:92EB: 4A 93     .word _off019_00_934A_11
- - - - - - 0x0092FD 02:92ED: 4B 93     .word _off019_00_934B_12
- D 0 - I - 0x0092FF 02:92EF: 4C 93     .word _off019_00_934C_13
- D 0 - I - 0x009301 02:92F1: 4D 93     .word _off019_00_934D_14
- D 0 - I - 0x009303 02:92F3: 4E 93     .word _off019_00_934E_15
- D 0 - I - 0x009305 02:92F5: 4F 93     .word _off019_00_934F_16
- D 0 - I - 0x009307 02:92F7: 53 93     .word _off019_00_9353_17
- D 0 - I - 0x009309 02:92F9: 60 93     .word _off019_00_9360_18
- D 0 - I - 0x00930B 02:92FB: 64 93     .word _off019_00_9364_19
- D 0 - I - 0x00930D 02:92FD: 6B 93     .word _off019_00_936B_1A
- - - - - - 0x00930F 02:92FF: 72 93     .word _off019_00_9372_1B
- D 0 - I - 0x009311 02:9301: 73 93     .word _off019_00_9373_1C
- D 0 - I - 0x009313 02:9303: 74 93     .word _off019_00_9374_1D
- D 0 - I - 0x009315 02:9305: 75 93     .word _off019_00_9375_1E
- D 0 - I - 0x009317 02:9307: 76 93     .word _off019_00_9376_1F
- D 0 - I - 0x009319 02:9309: 77 93     .word _off019_00_9377_20
- D 0 - I - 0x00931B 02:930B: 7E 93     .word _off019_00_937E_21
- D 0 - I - 0x00931D 02:930D: 82 93     .word _off019_00_9382_22
- D 0 - I - 0x00931F 02:930F: 89 93     .word _off019_00_9389_23
- D 0 - I - 0x009321 02:9311: 93 93     .word _off019_00_9393_24
- D 0 - I - 0x009323 02:9313: 97 93     .word _off019_00_9397_25
- D 0 - I - 0x009325 02:9315: 9B 93     .word _off019_00_939B_26
- D 0 - I - 0x009327 02:9317: 9F 93     .word _off019_00_939F_27
- - - - - - 0x009329 02:9319: A0 93     .word _off019_00_93A0_28
- - - - - - 0x00932B 02:931B: A1 93     .word _off019_00_93A1_29
- D 0 - I - 0x00932D 02:931D: A2 93     .word _off019_00_93A2_2A
- D 0 - I - 0x00932F 02:931F: A3 93     .word _off019_00_93A3_2B
- D 0 - I - 0x009331 02:9321: BF 93     .word _off019_00_93BF_2C
- D 0 - I - 0x009333 02:9323: C9 93     .word _off019_00_93C9_2D
- D 0 - I - 0x009335 02:9325: D0 93     .word _off019_00_93D0_2E
- D 0 - I - 0x009337 02:9327: D1 93     .word _off019_00_93D1_2F
- D 0 - I - 0x009339 02:9329: D5 93     .word _off019_00_93D5_30
- - - - - - 0x00933B 02:932B: D6 93     .word _off019_00_93D6_31
- - - - - - 0x00933D 02:932D: D7 93     .word _off019_00_93D7_32
- - - - - - 0x00933F 02:932F: D8 93     .word _off019_00_93D8_33
- - - - - - 0x009341 02:9331: D9 93     .word _off019_00_93D9_34
- - - - - - 0x009343 02:9333: DA 93     .word _off019_00_93DA_35
- - - - - - 0x009345 02:9335: DB 93     .word _off019_00_93DB_36
- - - - - - 0x009347 02:9337: DC 93     .word _off019_00_93DC_37



_off019_00_9339_00:
- - - - - - 0x009349 02:9339: FF        .byte $FF   ; end token



_off019_00_933A_01:
- - - - - - 0x00934A 02:933A: FF        .byte $FF   ; end token



_off019_00_933B_02:
- - - - - - 0x00934B 02:933B: FF        .byte $FF   ; end token



_off019_00_933C_03:
- - - - - - 0x00934C 02:933C: FF        .byte $FF   ; end token



_off019_00_933D_04:
- - - - - - 0x00934D 02:933D: FF        .byte $FF   ; end token



_off019_00_933E_05:
- - - - - - 0x00934E 02:933E: FF        .byte $FF   ; end token



_off019_00_933F_06:
- - - - - - 0x00934F 02:933F: FF        .byte $FF   ; end token



_off019_00_9340_07:
- - - - - - 0x009350 02:9340: FF        .byte $FF   ; end token



_off019_00_9341_08:
- - - - - - 0x009351 02:9341: FF        .byte $FF   ; end token



_off019_00_9342_09:
- - - - - - 0x009352 02:9342: FF        .byte $FF   ; end token



_off019_00_9343_0A:
- D 0 - I - 0x009353 02:9343: FF        .byte $FF   ; end token



_off019_00_9344_0B:
- D 0 - I - 0x009354 02:9344: FF        .byte $FF   ; end token



_off019_00_9345_0C:
- D 0 - I - 0x009355 02:9345: FF        .byte $FF   ; end token



_off019_00_9346_0D:
- - - - - - 0x009356 02:9346: FF        .byte $FF   ; end token



_off019_00_9347_0E:
- - - - - - 0x009357 02:9347: FF        .byte $FF   ; end token



_off019_00_9348_0F:
- - - - - - 0x009358 02:9348: FF        .byte $FF   ; end token



_off019_00_9349_10:
- - - - - - 0x009359 02:9349: FF        .byte $FF   ; end token



_off019_00_934A_11:
- - - - - - 0x00935A 02:934A: FF        .byte $FF   ; end token



_off019_00_934B_12:
- - - - - - 0x00935B 02:934B: FF        .byte $FF   ; end token



_off019_00_934C_13:
- D 0 - I - 0x00935C 02:934C: FF        .byte $FF   ; end token



_off019_00_934D_14:
- D 0 - I - 0x00935D 02:934D: FF        .byte $FF   ; end token



_off019_00_934E_15:
- D 0 - I - 0x00935E 02:934E: FF        .byte $FF   ; end token



_off019_00_934F_16:
- D 0 - I - 0x00935F 02:934F: 8B        .byte $10 * $08 + $0B   ; pos YX
- D 0 - I - 0x009360 02:9350: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009361 02:9351: 6F        .byte con_obj_id_6F   ; 

- D 0 - I - 0x009362 02:9352: FF        .byte $FF   ; end token



_off019_00_9353_17:
- D 0 - I - 0x009363 02:9353: 97        .byte $10 * $09 + $07   ; pos YX
- D 0 - I - 0x009364 02:9354: 91        .byte $80 + $00 + $11   ; flags
- D 0 - I - 0x009365 02:9355: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009366 02:9356: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009367 02:9357: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009368 02:9358: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009369 02:9359: AD        .byte $10 * $0A + $0D   ; pos YX
- D 0 - I - 0x00936A 02:935A: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00936B 02:935B: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00936C 02:935C: E6        .byte $10 * $0E + $06   ; pos YX
- D 0 - I - 0x00936D 02:935D: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x00936E 02:935E: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00936F 02:935F: FF        .byte $FF   ; end token



_off019_00_9360_18:
- D 0 - I - 0x009370 02:9360: AC        .byte $10 * $0A + $0C   ; pos YX
- D 0 - I - 0x009371 02:9361: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x009372 02:9362: 0F        .byte con_obj_id_0F   ; 

- D 0 - I - 0x009373 02:9363: FF        .byte $FF   ; end token



_off019_00_9364_19:
- D 0 - I - 0x009374 02:9364: 39        .byte $10 * $03 + $09   ; pos YX
- D 0 - I - 0x009375 02:9365: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009376 02:9366: 10        .byte con_obj_id_10   ; 

- D 0 - I - 0x009377 02:9367: 8F        .byte $10 * $08 + $0F   ; pos YX
- D 0 - I - 0x009378 02:9368: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009379 02:9369: 20        .byte con_obj_id_20   ; 

- D 0 - I - 0x00937A 02:936A: FF        .byte $FF   ; end token



_off019_00_936B_1A:
- D 0 - I - 0x00937B 02:936B: B5        .byte $10 * $0B + $05   ; pos YX
- D 0 - I - 0x00937C 02:936C: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00937D 02:936D: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00937E 02:936E: 81        .byte $10 * $08 + $01   ; pos YX
- D 0 - I - 0x00937F 02:936F: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009380 02:9370: 21        .byte con_obj_id_21   ; 

- D 0 - I - 0x009381 02:9371: FF        .byte $FF   ; end token



_off019_00_9372_1B:
- - - - - - 0x009382 02:9372: FF        .byte $FF   ; end token



_off019_00_9373_1C:
- D 0 - I - 0x009383 02:9373: FF        .byte $FF   ; end token



_off019_00_9374_1D:
- D 0 - I - 0x009384 02:9374: FF        .byte $FF   ; end token



_off019_00_9375_1E:
- D 0 - I - 0x009385 02:9375: FF        .byte $FF   ; end token



_off019_00_9376_1F:
- D 0 - I - 0x009386 02:9376: FF        .byte $FF   ; end token



_off019_00_9377_20:
- D 0 - I - 0x009387 02:9377: AB        .byte $10 * $0A + $0B   ; pos YX
- D 0 - I - 0x009388 02:9378: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009389 02:9379: 10        .byte con_obj_id_10   ; 

- D 0 - I - 0x00938A 02:937A: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x00938B 02:937B: 96        .byte $80 + $00 + $16   ; flags
- D 0 - I - 0x00938C 02:937C: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00938D 02:937D: FF        .byte $FF   ; end token



_off019_00_937E_21:
- D 0 - I - 0x00938E 02:937E: 98        .byte $10 * $09 + $08   ; pos YX
- D 0 - I - 0x00938F 02:937F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009390 02:9380: 6F        .byte con_obj_id_6F   ; 

- D 0 - I - 0x009391 02:9381: FF        .byte $FF   ; end token



_off019_00_9382_22:
- D 0 - I - 0x009392 02:9382: 36        .byte $10 * $03 + $06   ; pos YX
- D 0 - I - 0x009393 02:9383: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009394 02:9384: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009395 02:9385: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x009396 02:9386: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x009397 02:9387: 05        .byte con_obj_id_05   ; 

- D 0 - I - 0x009398 02:9388: FF        .byte $FF   ; end token



_off019_00_9389_23:
- D 0 - I - 0x009399 02:9389: 05        .byte $10 * $00 + $05   ; pos YX
- D 0 - I - 0x00939A 02:938A: 96        .byte $80 + $00 + $16   ; flags
- D 0 - I - 0x00939B 02:938B: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00939C 02:938C: 24        .byte $10 * $02 + $04   ; pos YX
- D 0 - I - 0x00939D 02:938D: 93        .byte $80 + $00 + $13   ; flags
- D 0 - I - 0x00939E 02:938E: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00939F 02:938F: 62        .byte $10 * $06 + $02   ; pos YX
- D 0 - I - 0x0093A0 02:9390: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0093A1 02:9391: 0F        .byte con_obj_id_0F   ; 

- D 0 - I - 0x0093A2 02:9392: FF        .byte $FF   ; end token



_off019_00_9393_24:
- D 0 - I - 0x0093A3 02:9393: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x0093A4 02:9394: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x0093A5 02:9395: 0F        .byte con_obj_id_0F   ; 

- D 0 - I - 0x0093A6 02:9396: FF        .byte $FF   ; end token



_off019_00_9397_25:
- D 0 - I - 0x0093A7 02:9397: 09        .byte $10 * $00 + $09   ; pos YX
- D 0 - I - 0x0093A8 02:9398: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0093A9 02:9399: 20        .byte con_obj_id_20   ; 

- D 0 - I - 0x0093AA 02:939A: FF        .byte $FF   ; end token



_off019_00_939B_26:
- D 0 - I - 0x0093AB 02:939B: 01        .byte $10 * $00 + $01   ; pos YX
- D 0 - I - 0x0093AC 02:939C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0093AD 02:939D: 20        .byte con_obj_id_20   ; 

- D 0 - I - 0x0093AE 02:939E: FF        .byte $FF   ; end token



_off019_00_939F_27:
- D 0 - I - 0x0093AF 02:939F: FF        .byte $FF   ; end token



_off019_00_93A0_28:
- - - - - - 0x0093B0 02:93A0: FF        .byte $FF   ; end token



_off019_00_93A1_29:
- - - - - - 0x0093B1 02:93A1: FF        .byte $FF   ; end token



_off019_00_93A2_2A:
- D 0 - I - 0x0093B2 02:93A2: FF        .byte $FF   ; end token



_off019_00_93A3_2B:
- D 0 - I - 0x0093B3 02:93A3: 35        .byte $10 * $03 + $05   ; pos YX
- D 0 - I - 0x0093B4 02:93A4: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x0093B5 02:93A5: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0093B6 02:93A6: 4B        .byte $10 * $04 + $0B   ; pos YX
- D 0 - I - 0x0093B7 02:93A7: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0093B8 02:93A8: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0093B9 02:93A9: 93        .byte $10 * $09 + $03   ; pos YX
- D 0 - I - 0x0093BA 02:93AA: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093BB 02:93AB: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093BC 02:93AC: 95        .byte $10 * $09 + $05   ; pos YX
- D 0 - I - 0x0093BD 02:93AD: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093BE 02:93AE: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093BF 02:93AF: 95        .byte $10 * $09 + $05   ; pos YX
- D 0 - I - 0x0093C0 02:93B0: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0093C1 02:93B1: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093C2 02:93B2: 97        .byte $10 * $09 + $07   ; pos YX
- D 0 - I - 0x0093C3 02:93B3: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093C4 02:93B4: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093C5 02:93B5: 99        .byte $10 * $09 + $09   ; pos YX
- D 0 - I - 0x0093C6 02:93B6: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093C7 02:93B7: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093C8 02:93B8: 9A        .byte $10 * $09 + $0A   ; pos YX
- D 0 - I - 0x0093C9 02:93B9: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0093CA 02:93BA: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093CB 02:93BB: 9C        .byte $10 * $09 + $0C   ; pos YX
- D 0 - I - 0x0093CC 02:93BC: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093CD 02:93BD: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093CE 02:93BE: FF        .byte $FF   ; end token



_off019_00_93BF_2C:
- D 0 - I - 0x0093CF 02:93BF: 56        .byte $10 * $05 + $06   ; pos YX
- D 0 - I - 0x0093D0 02:93C0: 94        .byte $80 + $00 + $14   ; flags
- D 0 - I - 0x0093D1 02:93C1: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0093D2 02:93C2: 4B        .byte $10 * $04 + $0B   ; pos YX
- D 0 - I - 0x0093D3 02:93C3: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0093D4 02:93C4: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0093D5 02:93C5: 56        .byte $10 * $05 + $06   ; pos YX
- D 0 - I - 0x0093D6 02:93C6: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0093D7 02:93C7: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0093D8 02:93C8: FF        .byte $FF   ; end token



_off019_00_93C9_2D:
- D 0 - I - 0x0093D9 02:93C9: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x0093DA 02:93CA: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0093DB 02:93CB: 6F        .byte con_obj_id_6F   ; 

- D 0 - I - 0x0093DC 02:93CC: 26        .byte $10 * $02 + $06   ; pos YX
- D 0 - I - 0x0093DD 02:93CD: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0093DE 02:93CE: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0093DF 02:93CF: FF        .byte $FF   ; end token



_off019_00_93D0_2E:
- D 0 - I - 0x0093E0 02:93D0: FF        .byte $FF   ; end token



_off019_00_93D1_2F:
- D 0 - I - 0x0093E1 02:93D1: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x0093E2 02:93D2: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x0093E3 02:93D3: 07        .byte con_obj_id_07   ; 

- D 0 - I - 0x0093E4 02:93D4: FF        .byte $FF   ; end token



_off019_00_93D5_30:
- D 0 - I - 0x0093E5 02:93D5: FF        .byte $FF   ; end token



_off019_00_93D6_31:
- - - - - - 0x0093E6 02:93D6: FF        .byte $FF   ; end token



_off019_00_93D7_32:
- - - - - - 0x0093E7 02:93D7: FF        .byte $FF   ; end token



_off019_00_93D8_33:
- - - - - - 0x0093E8 02:93D8: FF        .byte $FF   ; end token



_off019_00_93D9_34:
- - - - - - 0x0093E9 02:93D9: FF        .byte $FF   ; end token



_off019_00_93DA_35:
- - - - - - 0x0093EA 02:93DA: FF        .byte $FF   ; end token



_off019_00_93DB_36:
- - - - - - 0x0093EB 02:93DB: FF        .byte $FF   ; end token



_off019_00_93DC_37:
- - - - - - 0x0093EC 02:93DC: FF        .byte $FF   ; end token



_off013_0x0093ED_01_area_2:
- - - - - - 0x0093ED 02:93DD: 15 94     .word _off019_01_9415_00
- - - - - - 0x0093EF 02:93DF: 15 94     .word _off019_01_9415_01
- D 0 - I - 0x0093F1 02:93E1: 16 94     .word _off019_01_9416_02
- D 0 - I - 0x0093F3 02:93E3: 15 94     .word _off019_01_9415_03
- D 0 - I - 0x0093F5 02:93E5: 1A 94     .word _off019_01_941A_04
- D 0 - I - 0x0093F7 02:93E7: 15 94     .word _off019_01_9415_05
- D 0 - I - 0x0093F9 02:93E9: 27 94     .word _off019_01_9427_06
- D 0 - I - 0x0093FB 02:93EB: 15 94     .word _off019_01_9415_07
- D 0 - I - 0x0093FD 02:93ED: 34 94     .word _off019_01_9434_08
- D 0 - I - 0x0093FF 02:93EF: 15 94     .word _off019_01_9415_09
- D 0 - I - 0x009401 02:93F1: 3E 94     .word _off019_01_943E_0A
- D 0 - I - 0x009403 02:93F3: 15 94     .word _off019_01_9415_0B
- D 0 - I - 0x009405 02:93F5: 4B 94     .word _off019_01_944B_0C
- D 0 - I - 0x009407 02:93F7: 15 94     .word _off019_01_9415_0D
- D 0 - I - 0x009409 02:93F9: 52 94     .word _off019_01_9452_0E
- D 0 - I - 0x00940B 02:93FB: 15 94     .word _off019_01_9415_0F
- D 0 - I - 0x00940D 02:93FD: 62 94     .word _off019_01_9462_10
- D 0 - I - 0x00940F 02:93FF: 15 94     .word _off019_01_9415_11
- D 0 - I - 0x009411 02:9401: 6F 94     .word _off019_01_946F_12
- D 0 - I - 0x009413 02:9403: 15 94     .word _off019_01_9415_13
- D 0 - I - 0x009415 02:9405: 73 94     .word _off019_01_9473_14
- D 0 - I - 0x009417 02:9407: 15 94     .word _off019_01_9415_15
- D 0 - I - 0x009419 02:9409: 7A 94     .word _off019_01_947A_16
- D 0 - I - 0x00941B 02:940B: 15 94     .word _off019_01_9415_17
- - - - - - 0x00941D 02:940D: 81 94     .word _off019_01_9481_18
- - - - - - 0x00941F 02:940F: 15 94     .word _off019_01_9415_19
- - - - - - 0x009421 02:9411: 82 94     .word _off019_01_9482_1A
- - - - - - 0x009423 02:9413: 15 94     .word _off019_01_9415_1B



_off019_01_9415_00:
_off019_01_9415_01:
_off019_01_9415_03:
_off019_01_9415_05:
_off019_01_9415_07:
_off019_01_9415_09:
_off019_01_9415_0B:
_off019_01_9415_0D:
_off019_01_9415_0F:
_off019_01_9415_11:
_off019_01_9415_13:
_off019_01_9415_15:
_off019_01_9415_17:
_off019_01_9415_19:
_off019_01_9415_1B:
- D 0 - I - 0x009425 02:9415: FF        .byte $FF   ; end token



_off019_01_9416_02:
- D 0 - I - 0x009426 02:9416: 40        .byte $10 * $04 + $00   ; pos YX
- D 0 - I - 0x009427 02:9417: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009428 02:9418: 69        .byte con_obj_id_69   ; 

- D 0 - I - 0x009429 02:9419: FF        .byte $FF   ; end token



_off019_01_941A_04:
- D 0 - I - 0x00942A 02:941A: 37        .byte $10 * $03 + $07   ; pos YX
- D 0 - I - 0x00942B 02:941B: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x00942C 02:941C: 0D        .byte con_obj_id_0D   ; 

- D 0 - I - 0x00942D 02:941D: 58        .byte $10 * $05 + $08   ; pos YX
- D 0 - I - 0x00942E 02:941E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00942F 02:941F: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009430 02:9420: 83        .byte $10 * $08 + $03   ; pos YX
- D 0 - I - 0x009431 02:9421: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009432 02:9422: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009433 02:9423: 8C        .byte $10 * $08 + $0C   ; pos YX
- D 0 - I - 0x009434 02:9424: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009435 02:9425: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009436 02:9426: FF        .byte $FF   ; end token



_off019_01_9427_06:
- D 0 - I - 0x009437 02:9427: 1D        .byte $10 * $01 + $0D   ; pos YX
- D 0 - I - 0x009438 02:9428: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009439 02:9429: 5B        .byte con_obj_id_5B   ; 

- D 0 - I - 0x00943A 02:942A: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x00943B 02:942B: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00943C 02:942C: 5B        .byte con_obj_id_5B   ; 

- D 0 - I - 0x00943D 02:942D: D5        .byte $10 * $0D + $05   ; pos YX
- D 0 - I - 0x00943E 02:942E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00943F 02:942F: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009440 02:9430: DA        .byte $10 * $0D + $0A   ; pos YX
- D 0 - I - 0x009441 02:9431: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009442 02:9432: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009443 02:9433: FF        .byte $FF   ; end token



_off019_01_9434_08:
- D 0 - I - 0x009444 02:9434: 47        .byte $10 * $04 + $07   ; pos YX
- D 0 - I - 0x009445 02:9435: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009446 02:9436: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009447 02:9437: B5        .byte $10 * $0B + $05   ; pos YX
- D 0 - I - 0x009448 02:9438: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009449 02:9439: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x00944A 02:943A: BA        .byte $10 * $0B + $0A   ; pos YX
- D 0 - I - 0x00944B 02:943B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00944C 02:943C: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x00944D 02:943D: FF        .byte $FF   ; end token



_off019_01_943E_0A:
- D 0 - I - 0x00944E 02:943E: 65        .byte $10 * $06 + $05   ; pos YX
- D 0 - I - 0x00944F 02:943F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009450 02:9440: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009451 02:9441: 6A        .byte $10 * $06 + $0A   ; pos YX
- D 0 - I - 0x009452 02:9442: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009453 02:9443: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009454 02:9444: 78        .byte $10 * $07 + $08   ; pos YX
- D 0 - I - 0x009455 02:9445: B6        .byte $80 + $00 + $36   ; flags
- D 0 - I - 0x009456 02:9446: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009457 02:9447: C1        .byte $10 * $0C + $01   ; pos YX
- D 0 - I - 0x009458 02:9448: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009459 02:9449: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x00945A 02:944A: FF        .byte $FF   ; end token



_off019_01_944B_0C:
- D 0 - I - 0x00945B 02:944B: 15        .byte $10 * $01 + $05   ; pos YX
- D 0 - I - 0x00945C 02:944C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00945D 02:944D: 5B        .byte con_obj_id_5B   ; 

- D 0 - I - 0x00945E 02:944E: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x00945F 02:944F: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009460 02:9450: 5B        .byte con_obj_id_5B   ; 

- D 0 - I - 0x009461 02:9451: FF        .byte $FF   ; end token



_off019_01_9452_0E:
- D 0 - I - 0x009462 02:9452: 17        .byte $10 * $01 + $07   ; pos YX
- D 0 - I - 0x009463 02:9453: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009464 02:9454: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009465 02:9455: 18        .byte $10 * $01 + $08   ; pos YX
- D 0 - I - 0x009466 02:9456: B2        .byte $80 + $00 + $32   ; flags
- D 0 - I - 0x009467 02:9457: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009468 02:9458: 38        .byte $10 * $03 + $08   ; pos YX
- D 0 - I - 0x009469 02:9459: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00946A 02:945A: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00946B 02:945B: A5        .byte $10 * $0A + $05   ; pos YX
- D 0 - I - 0x00946C 02:945C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00946D 02:945D: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x00946E 02:945E: AA        .byte $10 * $0A + $0A   ; pos YX
- D 0 - I - 0x00946F 02:945F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009470 02:9460: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009471 02:9461: FF        .byte $FF   ; end token



_off019_01_9462_10:
- D 0 - I - 0x009472 02:9462: 65        .byte $10 * $06 + $05   ; pos YX
- D 0 - I - 0x009473 02:9463: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009474 02:9464: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009475 02:9465: 6A        .byte $10 * $06 + $0A   ; pos YX
- D 0 - I - 0x009476 02:9466: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009477 02:9467: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x009478 02:9468: B3        .byte $10 * $0B + $03   ; pos YX
- D 0 - I - 0x009479 02:9469: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00947A 02:946A: 2E        .byte con_obj_id_2E   ; 

- D 0 - I - 0x00947B 02:946B: BB        .byte $10 * $0B + $0B   ; pos YX
- D 0 - I - 0x00947C 02:946C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00947D 02:946D: 2E        .byte con_obj_id_2E   ; 

- D 0 - I - 0x00947E 02:946E: FF        .byte $FF   ; end token



_off019_01_946F_12:
- D 0 - I - 0x00947F 02:946F: B7        .byte $10 * $0B + $07   ; pos YX
- D 0 - I - 0x009480 02:9470: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009481 02:9471: 2E        .byte con_obj_id_2E   ; 

- D 0 - I - 0x009482 02:9472: FF        .byte $FF   ; end token



_off019_01_9473_14:
- D 0 - I - 0x009483 02:9473: 18        .byte $10 * $01 + $08   ; pos YX
- D 0 - I - 0x009484 02:9474: B1        .byte $80 + $00 + $31   ; flags
- D 0 - I - 0x009485 02:9475: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009486 02:9476: 38        .byte $10 * $03 + $08   ; pos YX
- D 0 - I - 0x009487 02:9477: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009488 02:9478: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009489 02:9479: FF        .byte $FF   ; end token



_off019_01_947A_16:
- D 0 - I - 0x00948A 02:947A: 8D        .byte $10 * $08 + $0D   ; pos YX
- D 0 - I - 0x00948B 02:947B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00948C 02:947C: 5C        .byte con_obj_id_5C   ; 

- D 0 - I - 0x00948D 02:947D: B8        .byte $10 * $0B + $08   ; pos YX
- D 0 - I - 0x00948E 02:947E: B0        .byte $80 + $00 + $30   ; flags
- D 0 - I - 0x00948F 02:947F: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009490 02:9480: FF        .byte $FF   ; end token



_off019_01_9481_18:
- - - - - - 0x009491 02:9481: FF        .byte $FF   ; end token



_off019_01_9482_1A:
- - - - - - 0x009492 02:9482: FF        .byte $FF   ; end token



_off013_0x009493_02_area_3:
- - - - - - 0x009493 02:9483: AF 94     .word _off019_02_94AF_00
- D 0 - I - 0x009495 02:9485: B0 94     .word _off019_02_94B0_01
- D 0 - I - 0x009497 02:9487: B7 94     .word _off019_02_94B7_02
- D 0 - I - 0x009499 02:9489: C4 94     .word _off019_02_94C4_03
- D 0 - I - 0x00949B 02:948B: D4 94     .word _off019_02_94D4_04
- D 0 - I - 0x00949D 02:948D: D8 94     .word _off019_02_94D8_05
- D 0 - I - 0x00949F 02:948F: DF 94     .word _off019_02_94DF_06
- D 0 - I - 0x0094A1 02:9491: F5 94     .word _off019_02_94F5_07
- D 0 - I - 0x0094A3 02:9493: F9 94     .word _off019_02_94F9_08
- D 0 - I - 0x0094A5 02:9495: 06 95     .word _off019_02_9506_09
- D 0 - I - 0x0094A7 02:9497: 0A 95     .word _off019_02_950A_0A
- D 0 - I - 0x0094A9 02:9499: 1D 95     .word _off019_02_951D_0B
- D 0 - I - 0x0094AB 02:949B: 27 95     .word _off019_02_9527_0C
- D 0 - I - 0x0094AD 02:949D: 3D 95     .word _off019_02_953D_0D
- D 0 - I - 0x0094AF 02:949F: 41 95     .word _off019_02_9541_0E
- D 0 - I - 0x0094B1 02:94A1: 45 95     .word _off019_02_9545_0F
- D 0 - I - 0x0094B3 02:94A3: 4C 95     .word _off019_02_954C_10
- D 0 - I - 0x0094B5 02:94A5: 4D 95     .word _off019_02_954D_11
- D 0 - I - 0x0094B7 02:94A7: 54 95     .word _off019_02_9554_12
- D 0 - I - 0x0094B9 02:94A9: 55 95     .word _off019_02_9555_13
- - - - - - 0x0094BB 02:94AB: 59 95     .word _off019_02_9559_14
- - - - - - 0x0094BD 02:94AD: 5A 95     .word _off019_02_955A_15



_off019_02_94AF_00:
- - - - - - 0x0094BF 02:94AF: FF        .byte $FF   ; end token



_off019_02_94B0_01:
- D 0 - I - 0x0094C0 02:94B0: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x0094C1 02:94B1: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0094C2 02:94B2: 26        .byte con_obj_id_26   ; 

- D 0 - I - 0x0094C3 02:94B3: B7        .byte $10 * $0B + $07   ; pos YX
- D 0 - I - 0x0094C4 02:94B4: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x0094C5 02:94B5: 27        .byte con_obj_id_27   ; 

- D 0 - I - 0x0094C6 02:94B6: FF        .byte $FF   ; end token



_off019_02_94B7_02:
- D 0 - I - 0x0094C7 02:94B7: 97        .byte $10 * $09 + $07   ; pos YX
- D 0 - I - 0x0094C8 02:94B8: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0094C9 02:94B9: 26        .byte con_obj_id_26   ; 

- D 0 - I - 0x0094CA 02:94BA: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x0094CB 02:94BB: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x0094CC 02:94BC: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094CD 02:94BD: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x0094CE 02:94BE: 96        .byte $80 + $00 + $16   ; flags
- D 0 - I - 0x0094CF 02:94BF: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0094D0 02:94C0: 8B        .byte $10 * $08 + $0B   ; pos YX
- D 0 - I - 0x0094D1 02:94C1: 94        .byte $80 + $00 + $14   ; flags
- D 0 - I - 0x0094D2 02:94C2: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0094D3 02:94C3: FF        .byte $FF   ; end token



_off019_02_94C4_03:
- D 0 - I - 0x0094D4 02:94C4: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x0094D5 02:94C5: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0094D6 02:94C6: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094D7 02:94C7: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x0094D8 02:94C8: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0094D9 02:94C9: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094DA 02:94CA: 37        .byte $10 * $03 + $07   ; pos YX
- D 0 - I - 0x0094DB 02:94CB: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x0094DC 02:94CC: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094DD 02:94CD: B3        .byte $10 * $0B + $03   ; pos YX
- D 0 - I - 0x0094DE 02:94CE: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x0094DF 02:94CF: 27        .byte con_obj_id_27   ; 

- D 0 - I - 0x0094E0 02:94D0: BB        .byte $10 * $0B + $0B   ; pos YX
- D 0 - I - 0x0094E1 02:94D1: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x0094E2 02:94D2: 27        .byte con_obj_id_27   ; 

- D 0 - I - 0x0094E3 02:94D3: FF        .byte $FF   ; end token



_off019_02_94D4_04:
- D 0 - I - 0x0094E4 02:94D4: 17        .byte $10 * $01 + $07   ; pos YX
- D 0 - I - 0x0094E5 02:94D5: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0094E6 02:94D6: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094E7 02:94D7: FF        .byte $FF   ; end token



_off019_02_94D8_05:
- D 0 - I - 0x0094E8 02:94D8: 42        .byte $10 * $04 + $02   ; pos YX
- D 0 - I - 0x0094E9 02:94D9: 10        .byte $10 + $00 + $00   ; flags
- D 0 - I - 0x0094EA 02:94DA: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0094EB 02:94DB: 8A        .byte $8A   ; 
- D 0 - I - 0x0094EC 02:94DC: 00        .byte $00   ; 
- D 0 - I - 0x0094ED 02:94DD: 28        .byte $28   ; 
- D 0 - I - 0x0094EE 02:94DE: FF        .byte $FF   ; end token



_off019_02_94DF_06:
- D 0 - I - 0x0094EF 02:94DF: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x0094F0 02:94E0: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0094F1 02:94E1: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094F2 02:94E2: 16        .byte $10 * $01 + $06   ; pos YX
- D 0 - I - 0x0094F3 02:94E3: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0094F4 02:94E4: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094F5 02:94E5: 39        .byte $10 * $03 + $09   ; pos YX
- D 0 - I - 0x0094F6 02:94E6: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x0094F7 02:94E7: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094F8 02:94E8: 3C        .byte $10 * $03 + $0C   ; pos YX
- D 0 - I - 0x0094F9 02:94E9: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x0094FA 02:94EA: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094FB 02:94EB: 3E        .byte $10 * $03 + $0E   ; pos YX
- D 0 - I - 0x0094FC 02:94EC: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x0094FD 02:94ED: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094FE 02:94EE: 40        .byte $10 * $04 + $00   ; pos YX
- D 0 - I - 0x0094FF 02:94EF: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x009500 02:94F0: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009501 02:94F1: A6        .byte $10 * $0A + $06   ; pos YX
- D 0 - I - 0x009502 02:94F2: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x009503 02:94F3: 07        .byte con_obj_id_07   ; 

- D 0 - I - 0x009504 02:94F4: FF        .byte $FF   ; end token



_off019_02_94F5_07:
- D 0 - I - 0x009505 02:94F5: 34        .byte $10 * $03 + $04   ; pos YX
- D 0 - I - 0x009506 02:94F6: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x009507 02:94F7: 10        .byte con_obj_id_10   ; 

- D 0 - I - 0x009508 02:94F8: FF        .byte $FF   ; end token



_off019_02_94F9_08:
- D 0 - I - 0x009509 02:94F9: 37        .byte $10 * $03 + $07   ; pos YX
- D 0 - I - 0x00950A 02:94FA: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00950B 02:94FB: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00950C 02:94FC: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x00950D 02:94FD: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00950E 02:94FE: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00950F 02:94FF: 84        .byte $10 * $08 + $04   ; pos YX
- D 0 - I - 0x009510 02:9500: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009511 02:9501: 26        .byte con_obj_id_26   ; 

- D 0 - I - 0x009512 02:9502: 8A        .byte $10 * $08 + $0A   ; pos YX
- D 0 - I - 0x009513 02:9503: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009514 02:9504: 26        .byte con_obj_id_26   ; 

- D 0 - I - 0x009515 02:9505: FF        .byte $FF   ; end token



_off019_02_9506_09:
- D 0 - I - 0x009516 02:9506: 33        .byte $10 * $03 + $03   ; pos YX
- D 0 - I - 0x009517 02:9507: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x009518 02:9508: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009519 02:9509: FF        .byte $FF   ; end token



_off019_02_950A_0A:
- D 0 - I - 0x00951A 02:950A: 17        .byte $10 * $01 + $07   ; pos YX
- D 0 - I - 0x00951B 02:950B: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00951C 02:950C: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00951D 02:950D: 17        .byte $10 * $01 + $07   ; pos YX
- D 0 - I - 0x00951E 02:950E: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00951F 02:950F: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009520 02:9510: 19        .byte $10 * $01 + $09   ; pos YX
- D 0 - I - 0x009521 02:9511: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009522 02:9512: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009523 02:9513: 19        .byte $10 * $01 + $09   ; pos YX
- D 0 - I - 0x009524 02:9514: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009525 02:9515: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009526 02:9516: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x009527 02:9517: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009528 02:9518: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009529 02:9519: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x00952A 02:951A: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00952B 02:951B: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00952C 02:951C: FF        .byte $FF   ; end token



_off019_02_951D_0B:
- D 0 - I - 0x00952D 02:951D: 33        .byte $10 * $03 + $03   ; pos YX
- D 0 - I - 0x00952E 02:951E: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00952F 02:951F: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009530 02:9520: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x009531 02:9521: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x009532 02:9522: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009533 02:9523: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009534 02:9524: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x009535 02:9525: 07        .byte con_obj_id_07   ; 

- D 0 - I - 0x009536 02:9526: FF        .byte $FF   ; end token



_off019_02_9527_0C:
- D 0 - I - 0x009537 02:9527: 12        .byte $10 * $01 + $02   ; pos YX
- D 0 - I - 0x009538 02:9528: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009539 02:9529: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00953A 02:952A: 12        .byte $10 * $01 + $02   ; pos YX
- D 0 - I - 0x00953B 02:952B: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00953C 02:952C: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00953D 02:952D: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x00953E 02:952E: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00953F 02:952F: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009540 02:9530: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x009541 02:9531: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009542 02:9532: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009543 02:9533: 16        .byte $10 * $01 + $06   ; pos YX
- D 0 - I - 0x009544 02:9534: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009545 02:9535: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009546 02:9536: 16        .byte $10 * $01 + $06   ; pos YX
- D 0 - I - 0x009547 02:9537: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009548 02:9538: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009549 02:9539: 33        .byte $10 * $03 + $03   ; pos YX
- D 0 - I - 0x00954A 02:953A: A3        .byte $80 + $00 + $23   ; flags
- D 0 - I - 0x00954B 02:953B: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00954C 02:953C: FF        .byte $FF   ; end token



_off019_02_953D_0D:
- D 0 - I - 0x00954D 02:953D: 34        .byte $10 * $03 + $04   ; pos YX
- D 0 - I - 0x00954E 02:953E: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x00954F 02:953F: 10        .byte con_obj_id_10   ; 

- D 0 - I - 0x009550 02:9540: FF        .byte $FF   ; end token



_off019_02_9541_0E:
- D 0 - I - 0x009551 02:9541: 98        .byte $10 * $09 + $08   ; pos YX
- D 0 - I - 0x009552 02:9542: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009553 02:9543: 4E        .byte con_obj_id_4E   ; 

- D 0 - I - 0x009554 02:9544: FF        .byte $FF   ; end token



_off019_02_9545_0F:
- D 0 - I - 0x009555 02:9545: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x009556 02:9546: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009557 02:9547: 3F        .byte con_obj_id_3F   ; 

- D 0 - I - 0x009558 02:9548: 5E        .byte $10 * $05 + $0E   ; pos YX
- D 0 - I - 0x009559 02:9549: 15        .byte $10 + $00 + $05   ; flags
- D 0 - I - 0x00955A 02:954A: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00955B 02:954B: FF        .byte $FF   ; end token



_off019_02_954C_10:
- D 0 - I - 0x00955C 02:954C: FF        .byte $FF   ; end token



_off019_02_954D_11:
- D 0 - I - 0x00955D 02:954D: 45        .byte $10 * $04 + $05   ; pos YX
- D 0 - I - 0x00955E 02:954E: 11        .byte $10 + $00 + $01   ; flags
- D 0 - I - 0x00955F 02:954F: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009560 02:9550: 75        .byte $10 * $07 + $05   ; pos YX
- D 0 - I - 0x009561 02:9551: 13        .byte $10 + $00 + $03   ; flags
- D 0 - I - 0x009562 02:9552: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009563 02:9553: FF        .byte $FF   ; end token



_off019_02_9554_12:
- D 0 - I - 0x009564 02:9554: FF        .byte $FF   ; end token



_off019_02_9555_13:
- D 0 - I - 0x009565 02:9555: 8E        .byte $10 * $08 + $0E   ; pos YX
- D 0 - I - 0x009566 02:9556: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009567 02:9557: 4B        .byte con_obj_id_4B   ; 

- D 0 - I - 0x009568 02:9558: FF        .byte $FF   ; end token



_off019_02_9559_14:
- - - - - - 0x009569 02:9559: FF        .byte $FF   ; end token



_off019_02_955A_15:
- - - - - - 0x00956A 02:955A: FF        .byte $FF   ; end token



_off013_0x00956B_03_area_4:
- - - - - - 0x00956B 02:955B: 11 96     .word _off019_03_9611_00
- - - - - - 0x00956D 02:955D: 12 96     .word _off019_03_9612_01
- - - - - - 0x00956F 02:955F: 13 96     .word _off019_03_9613_02
- D 0 - I - 0x009571 02:9561: 14 96     .word _off019_03_9614_03
- D 0 - I - 0x009573 02:9563: 15 96     .word _off019_03_9615_04
- - - - - - 0x009575 02:9565: 16 96     .word _off019_03_9616_05
- - - - - - 0x009577 02:9567: 17 96     .word _off019_03_9617_06
- - - - - - 0x009579 02:9569: 18 96     .word _off019_03_9618_07
- - - - - - 0x00957B 02:956B: 19 96     .word _off019_03_9619_08
- - - - - - 0x00957D 02:956D: 1A 96     .word _off019_03_961A_09
- D 0 - I - 0x00957F 02:956F: 1B 96     .word _off019_03_961B_0A
- D 0 - I - 0x009581 02:9571: 43 96     .word _off019_03_9643_0B
- - - - - - 0x009583 02:9573: 44 96     .word _off019_03_9644_0C
- - - - - - 0x009585 02:9575: 45 96     .word _off019_03_9645_0D
- - - - - - 0x009587 02:9577: 46 96     .word _off019_03_9646_0E
- - - - - - 0x009589 02:9579: 47 96     .word _off019_03_9647_0F
- - - - - - 0x00958B 02:957B: 48 96     .word _off019_03_9648_10
- D 0 - I - 0x00958D 02:957D: 49 96     .word _off019_03_9649_11
- D 0 - I - 0x00958F 02:957F: 71 96     .word _off019_03_9671_12
- - - - - - 0x009591 02:9581: 72 96     .word _off019_03_9672_13
- - - - - - 0x009593 02:9583: 73 96     .word _off019_03_9673_14
- - - - - - 0x009595 02:9585: 74 96     .word _off019_03_9674_15
- - - - - - 0x009597 02:9587: 75 96     .word _off019_03_9675_16
- - - - - - 0x009599 02:9589: 76 96     .word _off019_03_9676_17
- D 0 - I - 0x00959B 02:958B: 77 96     .word _off019_03_9677_18
- D 0 - I - 0x00959D 02:958D: 96 96     .word _off019_03_9696_19
- - - - - - 0x00959F 02:958F: 97 96     .word _off019_03_9697_1A
- - - - - - 0x0095A1 02:9591: 98 96     .word _off019_03_9698_1B
- - - - - - 0x0095A3 02:9593: 99 96     .word _off019_03_9699_1C
- - - - - - 0x0095A5 02:9595: 9A 96     .word _off019_03_969A_1D
- - - - - - 0x0095A7 02:9597: 9B 96     .word _off019_03_969B_1E
- D 0 - I - 0x0095A9 02:9599: 9C 96     .word _off019_03_969C_1F
- D 0 - I - 0x0095AB 02:959B: A6 96     .word _off019_03_96A6_20
- - - - - - 0x0095AD 02:959D: A7 96     .word _off019_03_96A7_21
- - - - - - 0x0095AF 02:959F: A8 96     .word _off019_03_96A8_22
- - - - - - 0x0095B1 02:95A1: A9 96     .word _off019_03_96A9_23
- - - - - - 0x0095B3 02:95A3: AA 96     .word _off019_03_96AA_24
- - - - - - 0x0095B5 02:95A5: AB 96     .word _off019_03_96AB_25
- D 0 - I - 0x0095B7 02:95A7: AC 96     .word _off019_03_96AC_26
- D 0 - I - 0x0095B9 02:95A9: B9 96     .word _off019_03_96B9_27
- - - - - - 0x0095BB 02:95AB: BA 96     .word _off019_03_96BA_28
- - - - - - 0x0095BD 02:95AD: BB 96     .word _off019_03_96BB_29
- - - - - - 0x0095BF 02:95AF: BC 96     .word _off019_03_96BC_2A
- - - - - - 0x0095C1 02:95B1: BD 96     .word _off019_03_96BD_2B
- - - - - - 0x0095C3 02:95B3: BE 96     .word _off019_03_96BE_2C
- D 0 - I - 0x0095C5 02:95B5: BF 96     .word _off019_03_96BF_2D
- D 0 - I - 0x0095C7 02:95B7: CC 96     .word _off019_03_96CC_2E
- - - - - - 0x0095C9 02:95B9: CD 96     .word _off019_03_96CD_2F
- - - - - - 0x0095CB 02:95BB: CE 96     .word _off019_03_96CE_30
- - - - - - 0x0095CD 02:95BD: CF 96     .word _off019_03_96CF_31
- - - - - - 0x0095CF 02:95BF: D0 96     .word _off019_03_96D0_32
- - - - - - 0x0095D1 02:95C1: D1 96     .word _off019_03_96D1_33
- D 0 - I - 0x0095D3 02:95C3: D2 96     .word _off019_03_96D2_34
- D 0 - I - 0x0095D5 02:95C5: D9 96     .word _off019_03_96D9_35
- - - - - - 0x0095D7 02:95C7: DA 96     .word _off019_03_96DA_36
- - - - - - 0x0095D9 02:95C9: DB 96     .word _off019_03_96DB_37
- - - - - - 0x0095DB 02:95CB: DC 96     .word _off019_03_96DC_38
- - - - - - 0x0095DD 02:95CD: DD 96     .word _off019_03_96DD_39
- - - - - - 0x0095DF 02:95CF: DE 96     .word _off019_03_96DE_3A
- D 0 - I - 0x0095E1 02:95D1: DF 96     .word _off019_03_96DF_3B
- D 0 - I - 0x0095E3 02:95D3: EF 96     .word _off019_03_96EF_3C
- - - - - - 0x0095E5 02:95D5: F0 96     .word _off019_03_96F0_3D
- - - - - - 0x0095E7 02:95D7: F1 96     .word _off019_03_96F1_3E
- - - - - - 0x0095E9 02:95D9: F2 96     .word _off019_03_96F2_3F
- - - - - - 0x0095EB 02:95DB: F3 96     .word _off019_03_96F3_40
- - - - - - 0x0095ED 02:95DD: F4 96     .word _off019_03_96F4_41
- D 0 - I - 0x0095EF 02:95DF: F5 96     .word _off019_03_96F5_42
- D 0 - I - 0x0095F1 02:95E1: FF 96     .word _off019_03_96FF_43
- - - - - - 0x0095F3 02:95E3: 00 97     .word _off019_03_9700_44
- - - - - - 0x0095F5 02:95E5: 01 97     .word _off019_03_9701_45
- - - - - - 0x0095F7 02:95E7: 02 97     .word _off019_03_9702_46
- - - - - - 0x0095F9 02:95E9: 03 97     .word _off019_03_9703_47
- - - - - - 0x0095FB 02:95EB: 04 97     .word _off019_03_9704_48
- D 0 - I - 0x0095FD 02:95ED: 05 97     .word _off019_03_9705_49
- D 0 - I - 0x0095FF 02:95EF: 0F 97     .word _off019_03_970F_4A
- - - - - - 0x009601 02:95F1: 10 97     .word _off019_03_9710_4B
- - - - - - 0x009603 02:95F3: 11 97     .word _off019_03_9711_4C
- - - - - - 0x009605 02:95F5: 12 97     .word _off019_03_9712_4D
- - - - - - 0x009607 02:95F7: 13 97     .word _off019_03_9713_4E
- - - - - - 0x009609 02:95F9: 14 97     .word _off019_03_9714_4F
- D 0 - I - 0x00960B 02:95FB: 15 97     .word _off019_03_9715_50
- D 0 - I - 0x00960D 02:95FD: 22 97     .word _off019_03_9722_51
- - - - - - 0x00960F 02:95FF: 23 97     .word _off019_03_9723_52
- - - - - - 0x009611 02:9601: 24 97     .word _off019_03_9724_53
- - - - - - 0x009613 02:9603: 25 97     .word _off019_03_9725_54
- D 0 - I - 0x009615 02:9605: 26 97     .word _off019_03_9726_55
- D 0 - I - 0x009617 02:9607: 3C 97     .word _off019_03_973C_56
- D 0 - I - 0x009619 02:9609: 55 97     .word _off019_03_9755_57
- - - - - - 0x00961B 02:960B: 6B 97     .word _off019_03_976B_58
- - - - - - 0x00961D 02:960D: 6C 97     .word _off019_03_976C_59
- - - - - - 0x00961F 02:960F: 6D 97     .word _off019_03_976D_5A



_off019_03_9611_00:
- - - - - - 0x009621 02:9611: FF        .byte $FF   ; end token



_off019_03_9612_01:
- - - - - - 0x009622 02:9612: FF        .byte $FF   ; end token



_off019_03_9613_02:
- - - - - - 0x009623 02:9613: FF        .byte $FF   ; end token



_off019_03_9614_03:
- D 0 - I - 0x009624 02:9614: FF        .byte $FF   ; end token



_off019_03_9615_04:
- D 0 - I - 0x009625 02:9615: FF        .byte $FF   ; end token



_off019_03_9616_05:
- - - - - - 0x009626 02:9616: FF        .byte $FF   ; end token



_off019_03_9617_06:
- - - - - - 0x009627 02:9617: FF        .byte $FF   ; end token



_off019_03_9618_07:
- - - - - - 0x009628 02:9618: FF        .byte $FF   ; end token



_off019_03_9619_08:
- - - - - - 0x009629 02:9619: FF        .byte $FF   ; end token



_off019_03_961A_09:
- - - - - - 0x00962A 02:961A: FF        .byte $FF   ; end token



_off019_03_961B_0A:
- D 0 - I - 0x00962B 02:961B: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x00962C 02:961C: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x00962D 02:961D: 42        .byte con_obj_id_42   ; 

- D 0 - I - 0x00962E 02:961E: 71        .byte $10 * $07 + $01   ; pos YX
- D 0 - I - 0x00962F 02:961F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009630 02:9620: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009631 02:9621: 77        .byte $10 * $07 + $07   ; pos YX
- D 0 - I - 0x009632 02:9622: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009633 02:9623: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009634 02:9624: 79        .byte $10 * $07 + $09   ; pos YX
- D 0 - I - 0x009635 02:9625: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009636 02:9626: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009637 02:9627: 7E        .byte $10 * $07 + $0E   ; pos YX
- D 0 - I - 0x009638 02:9628: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009639 02:9629: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x00963A 02:962A: A4        .byte $10 * $0A + $04   ; pos YX
- D 0 - I - 0x00963B 02:962B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00963C 02:962C: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x00963D 02:962D: A6        .byte $10 * $0A + $06   ; pos YX
- D 0 - I - 0x00963E 02:962E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00963F 02:962F: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009640 02:9630: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009641 02:9631: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009642 02:9632: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009643 02:9633: AC        .byte $10 * $0A + $0C   ; pos YX
- D 0 - I - 0x009644 02:9634: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009645 02:9635: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009646 02:9636: D5        .byte $10 * $0D + $05   ; pos YX
- D 0 - I - 0x009647 02:9637: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009648 02:9638: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009649 02:9639: D8        .byte $10 * $0D + $08   ; pos YX
- D 0 - I - 0x00964A 02:963A: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00964B 02:963B: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x00964C 02:963C: DB        .byte $10 * $0D + $0B   ; pos YX
- D 0 - I - 0x00964D 02:963D: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00964E 02:963E: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x00964F 02:963F: DE        .byte $10 * $0D + $0E   ; pos YX
- D 0 - I - 0x009650 02:9640: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009651 02:9641: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009652 02:9642: FF        .byte $FF   ; end token



_off019_03_9643_0B:
- D 0 - I - 0x009653 02:9643: FF        .byte $FF   ; end token



_off019_03_9644_0C:
- - - - - - 0x009654 02:9644: FF        .byte $FF   ; end token



_off019_03_9645_0D:
- - - - - - 0x009655 02:9645: FF        .byte $FF   ; end token



_off019_03_9646_0E:
- - - - - - 0x009656 02:9646: FF        .byte $FF   ; end token



_off019_03_9647_0F:
- - - - - - 0x009657 02:9647: FF        .byte $FF   ; end token



_off019_03_9648_10:
- - - - - - 0x009658 02:9648: FF        .byte $FF   ; end token



_off019_03_9649_11:
- D 0 - I - 0x009659 02:9649: 15        .byte $10 * $01 + $05   ; pos YX
- D 0 - I - 0x00965A 02:964A: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00965B 02:964B: 40        .byte con_obj_id_40   ; 

- D 0 - I - 0x00965C 02:964C: 1A        .byte $10 * $01 + $0A   ; pos YX
- D 0 - I - 0x00965D 02:964D: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00965E 02:964E: 40        .byte con_obj_id_40   ; 

- D 0 - I - 0x00965F 02:964F: 3E        .byte $10 * $03 + $0E   ; pos YX
- D 0 - I - 0x009660 02:9650: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009661 02:9651: 40        .byte con_obj_id_40   ; 

- D 0 - I - 0x009662 02:9652: 41        .byte $10 * $04 + $01   ; pos YX
- D 0 - I - 0x009663 02:9653: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009664 02:9654: 41        .byte con_obj_id_41   ; 

- D 0 - I - 0x009665 02:9655: 65        .byte $10 * $06 + $05   ; pos YX
- D 0 - I - 0x009666 02:9656: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009667 02:9657: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009668 02:9658: 68        .byte $10 * $06 + $08   ; pos YX
- D 0 - I - 0x009669 02:9659: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00966A 02:965A: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x00966B 02:965B: 7B        .byte $10 * $07 + $0B   ; pos YX
- D 0 - I - 0x00966C 02:965C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00966D 02:965D: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x00966E 02:965E: 7E        .byte $10 * $07 + $0E   ; pos YX
- D 0 - I - 0x00966F 02:965F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009670 02:9660: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009671 02:9661: AE        .byte $10 * $0A + $0E   ; pos YX
- D 0 - I - 0x009672 02:9662: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009673 02:9663: 41        .byte con_obj_id_41   ; 

- D 0 - I - 0x009674 02:9664: A2        .byte $10 * $0A + $02   ; pos YX
- D 0 - I - 0x009675 02:9665: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009676 02:9666: 40        .byte con_obj_id_40   ; 

- D 0 - I - 0x009677 02:9667: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009678 02:9668: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009679 02:9669: 40        .byte con_obj_id_40   ; 

- D 0 - I - 0x00967A 02:966A: D4        .byte $10 * $0D + $04   ; pos YX
- D 0 - I - 0x00967B 02:966B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00967C 02:966C: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x00967D 02:966D: DA        .byte $10 * $0D + $0A   ; pos YX
- D 0 - I - 0x00967E 02:966E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00967F 02:966F: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009680 02:9670: FF        .byte $FF   ; end token



_off019_03_9671_12:
- D 0 - I - 0x009681 02:9671: FF        .byte $FF   ; end token



_off019_03_9672_13:
- - - - - - 0x009682 02:9672: FF        .byte $FF   ; end token



_off019_03_9673_14:
- - - - - - 0x009683 02:9673: FF        .byte $FF   ; end token



_off019_03_9674_15:
- - - - - - 0x009684 02:9674: FF        .byte $FF   ; end token



_off019_03_9675_16:
- - - - - - 0x009685 02:9675: FF        .byte $FF   ; end token



_off019_03_9676_17:
- - - - - - 0x009686 02:9676: FF        .byte $FF   ; end token



_off019_03_9677_18:
- D 0 - I - 0x009687 02:9677: 22        .byte $10 * $02 + $02   ; pos YX
- D 0 - I - 0x009688 02:9678: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009689 02:9679: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x00968A 02:967A: 2D        .byte $10 * $02 + $0D   ; pos YX
- D 0 - I - 0x00968B 02:967B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00968C 02:967C: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x00968D 02:967D: 56        .byte $10 * $05 + $06   ; pos YX
- D 0 - I - 0x00968E 02:967E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00968F 02:967F: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009690 02:9680: 5A        .byte $10 * $05 + $0A   ; pos YX
- D 0 - I - 0x009691 02:9681: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009692 02:9682: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009693 02:9683: 73        .byte $10 * $07 + $03   ; pos YX
- D 0 - I - 0x009694 02:9684: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009695 02:9685: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009696 02:9686: 8A        .byte $10 * $08 + $0A   ; pos YX
- D 0 - I - 0x009697 02:9687: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009698 02:9688: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009699 02:9689: AC        .byte $10 * $0A + $0C   ; pos YX
- D 0 - I - 0x00969A 02:968A: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x00969B 02:968B: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00969C 02:968C: A4        .byte $10 * $0A + $04   ; pos YX
- D 0 - I - 0x00969D 02:968D: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00969E 02:968E: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00969F 02:968F: B8        .byte $10 * $0B + $08   ; pos YX
- D 0 - I - 0x0096A0 02:9690: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0096A1 02:9691: 25        .byte con_obj_id_25   ; 

- D 0 - I - 0x0096A2 02:9692: D8        .byte $10 * $0D + $08   ; pos YX
- D 0 - I - 0x0096A3 02:9693: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096A4 02:9694: 25        .byte con_obj_id_25   ; 

- D 0 - I - 0x0096A5 02:9695: FF        .byte $FF   ; end token



_off019_03_9696_19:
- D 0 - I - 0x0096A6 02:9696: FF        .byte $FF   ; end token



_off019_03_9697_1A:
- - - - - - 0x0096A7 02:9697: FF        .byte $FF   ; end token



_off019_03_9698_1B:
- - - - - - 0x0096A8 02:9698: FF        .byte $FF   ; end token



_off019_03_9699_1C:
- - - - - - 0x0096A9 02:9699: FF        .byte $FF   ; end token



_off019_03_969A_1D:
- - - - - - 0x0096AA 02:969A: FF        .byte $FF   ; end token



_off019_03_969B_1E:
- - - - - - 0x0096AB 02:969B: FF        .byte $FF   ; end token



_off019_03_969C_1F:
- D 0 - I - 0x0096AC 02:969C: 62        .byte $10 * $06 + $02   ; pos YX
- D 0 - I - 0x0096AD 02:969D: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x0096AE 02:969E: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x0096AF 02:969F: 6C        .byte $10 * $06 + $0C   ; pos YX
- D 0 - I - 0x0096B0 02:96A0: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x0096B1 02:96A1: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x0096B2 02:96A2: D8        .byte $10 * $0D + $08   ; pos YX
- D 0 - I - 0x0096B3 02:96A3: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096B4 02:96A4: 25        .byte con_obj_id_25   ; 

- D 0 - I - 0x0096B5 02:96A5: FF        .byte $FF   ; end token



_off019_03_96A6_20:
- D 0 - I - 0x0096B6 02:96A6: FF        .byte $FF   ; end token



_off019_03_96A7_21:
- - - - - - 0x0096B7 02:96A7: FF        .byte $FF   ; end token



_off019_03_96A8_22:
- - - - - - 0x0096B8 02:96A8: FF        .byte $FF   ; end token



_off019_03_96A9_23:
- - - - - - 0x0096B9 02:96A9: FF        .byte $FF   ; end token



_off019_03_96AA_24:
- - - - - - 0x0096BA 02:96AA: FF        .byte $FF   ; end token



_off019_03_96AB_25:
- - - - - - 0x0096BB 02:96AB: FF        .byte $FF   ; end token



_off019_03_96AC_26:
- D 0 - I - 0x0096BC 02:96AC: 28        .byte $10 * $02 + $08   ; pos YX
- D 0 - I - 0x0096BD 02:96AD: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0096BE 02:96AE: 25        .byte con_obj_id_25   ; 

- D 0 - I - 0x0096BF 02:96AF: 94        .byte $10 * $09 + $04   ; pos YX
- D 0 - I - 0x0096C0 02:96B0: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x0096C1 02:96B1: 39        .byte con_obj_id_39   ; 

- D 0 - I - 0x0096C2 02:96B2: 92        .byte $10 * $09 + $02   ; pos YX
- D 0 - I - 0x0096C3 02:96B3: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0096C4 02:96B4: 40        .byte con_obj_id_40   ; 

- D 0 - I - 0x0096C5 02:96B5: 9C        .byte $10 * $09 + $0C   ; pos YX
- D 0 - I - 0x0096C6 02:96B6: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096C7 02:96B7: 40        .byte con_obj_id_40   ; 

- D 0 - I - 0x0096C8 02:96B8: FF        .byte $FF   ; end token



_off019_03_96B9_27:
- D 0 - I - 0x0096C9 02:96B9: FF        .byte $FF   ; end token



_off019_03_96BA_28:
- - - - - - 0x0096CA 02:96BA: FF        .byte $FF   ; end token



_off019_03_96BB_29:
- - - - - - 0x0096CB 02:96BB: FF        .byte $FF   ; end token



_off019_03_96BC_2A:
- - - - - - 0x0096CC 02:96BC: FF        .byte $FF   ; end token



_off019_03_96BD_2B:
- - - - - - 0x0096CD 02:96BD: FF        .byte $FF   ; end token



_off019_03_96BE_2C:
- - - - - - 0x0096CE 02:96BE: FF        .byte $FF   ; end token



_off019_03_96BF_2D:
- D 0 - I - 0x0096CF 02:96BF: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x0096D0 02:96C0: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0096D1 02:96C1: 41        .byte con_obj_id_41   ; 

- D 0 - I - 0x0096D2 02:96C2: 15        .byte $10 * $01 + $05   ; pos YX
- D 0 - I - 0x0096D3 02:96C3: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0096D4 02:96C4: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0096D5 02:96C5: 2E        .byte $10 * $02 + $0E   ; pos YX
- D 0 - I - 0x0096D6 02:96C6: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096D7 02:96C7: 41        .byte con_obj_id_41   ; 

- D 0 - I - 0x0096D8 02:96C8: 66        .byte $10 * $06 + $06   ; pos YX
- D 0 - I - 0x0096D9 02:96C9: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0096DA 02:96CA: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0096DB 02:96CB: FF        .byte $FF   ; end token



_off019_03_96CC_2E:
- D 0 - I - 0x0096DC 02:96CC: FF        .byte $FF   ; end token



_off019_03_96CD_2F:
- - - - - - 0x0096DD 02:96CD: FF        .byte $FF   ; end token



_off019_03_96CE_30:
- - - - - - 0x0096DE 02:96CE: FF        .byte $FF   ; end token



_off019_03_96CF_31:
- - - - - - 0x0096DF 02:96CF: FF        .byte $FF   ; end token



_off019_03_96D0_32:
- - - - - - 0x0096E0 02:96D0: FF        .byte $FF   ; end token



_off019_03_96D1_33:
- - - - - - 0x0096E1 02:96D1: FF        .byte $FF   ; end token



_off019_03_96D2_34:
- D 0 - I - 0x0096E2 02:96D2: 44        .byte $10 * $04 + $04   ; pos YX
- D 0 - I - 0x0096E3 02:96D3: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x0096E4 02:96D4: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x0096E5 02:96D5: 4A        .byte $10 * $04 + $0A   ; pos YX
- D 0 - I - 0x0096E6 02:96D6: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x0096E7 02:96D7: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x0096E8 02:96D8: FF        .byte $FF   ; end token



_off019_03_96D9_35:
- D 0 - I - 0x0096E9 02:96D9: FF        .byte $FF   ; end token



_off019_03_96DA_36:
- - - - - - 0x0096EA 02:96DA: FF        .byte $FF   ; end token



_off019_03_96DB_37:
- - - - - - 0x0096EB 02:96DB: FF        .byte $FF   ; end token



_off019_03_96DC_38:
- - - - - - 0x0096EC 02:96DC: FF        .byte $FF   ; end token



_off019_03_96DD_39:
- - - - - - 0x0096ED 02:96DD: FF        .byte $FF   ; end token



_off019_03_96DE_3A:
- - - - - - 0x0096EE 02:96DE: FF        .byte $FF   ; end token



_off019_03_96DF_3B:
- D 0 - I - 0x0096EF 02:96DF: 05        .byte $10 * $00 + $05   ; pos YX
- D 0 - I - 0x0096F0 02:96E0: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096F1 02:96E1: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x0096F2 02:96E2: 09        .byte $10 * $00 + $09   ; pos YX
- D 0 - I - 0x0096F3 02:96E3: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096F4 02:96E4: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x0096F5 02:96E5: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x0096F6 02:96E6: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x0096F7 02:96E7: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0096F8 02:96E8: 2B        .byte $10 * $02 + $0B   ; pos YX
- D 0 - I - 0x0096F9 02:96E9: A4        .byte $80 + $00 + $24   ; flags
- D 0 - I - 0x0096FA 02:96EA: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0096FB 02:96EB: 94        .byte $10 * $09 + $04   ; pos YX
- D 0 - I - 0x0096FC 02:96EC: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x0096FD 02:96ED: 39        .byte con_obj_id_39   ; 

- D 0 - I - 0x0096FE 02:96EE: FF        .byte $FF   ; end token



_off019_03_96EF_3C:
- D 0 - I - 0x0096FF 02:96EF: FF        .byte $FF   ; end token



_off019_03_96F0_3D:
- - - - - - 0x009700 02:96F0: FF        .byte $FF   ; end token



_off019_03_96F1_3E:
- - - - - - 0x009701 02:96F1: FF        .byte $FF   ; end token



_off019_03_96F2_3F:
- - - - - - 0x009702 02:96F2: FF        .byte $FF   ; end token



_off019_03_96F3_40:
- - - - - - 0x009703 02:96F3: FF        .byte $FF   ; end token



_off019_03_96F4_41:
- - - - - - 0x009704 02:96F4: FF        .byte $FF   ; end token



_off019_03_96F5_42:
- D 0 - I - 0x009705 02:96F5: 18        .byte $10 * $01 + $08   ; pos YX
- D 0 - I - 0x009706 02:96F6: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009707 02:96F7: 2C        .byte con_obj_id_2C   ; 

- D 0 - I - 0x009708 02:96F8: 41        .byte $10 * $04 + $01   ; pos YX
- D 0 - I - 0x009709 02:96F9: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00970A 02:96FA: 41        .byte con_obj_id_41   ; 

- D 0 - I - 0x00970B 02:96FB: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x00970C 02:96FC: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00970D 02:96FD: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x00970E 02:96FE: FF        .byte $FF   ; end token



_off019_03_96FF_43:
- D 0 - I - 0x00970F 02:96FF: FF        .byte $FF   ; end token



_off019_03_9700_44:
- - - - - - 0x009710 02:9700: FF        .byte $FF   ; end token



_off019_03_9701_45:
- - - - - - 0x009711 02:9701: FF        .byte $FF   ; end token



_off019_03_9702_46:
- - - - - - 0x009712 02:9702: FF        .byte $FF   ; end token



_off019_03_9703_47:
- - - - - - 0x009713 02:9703: FF        .byte $FF   ; end token



_off019_03_9704_48:
- - - - - - 0x009714 02:9704: FF        .byte $FF   ; end token



_off019_03_9705_49:
- D 0 - I - 0x009715 02:9705: 08        .byte $10 * $00 + $08   ; pos YX
- D 0 - I - 0x009716 02:9706: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009717 02:9707: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x009718 02:9708: 24        .byte $10 * $02 + $04   ; pos YX
- D 0 - I - 0x009719 02:9709: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00971A 02:970A: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x00971B 02:970B: 6E        .byte $10 * $06 + $0E   ; pos YX
- D 0 - I - 0x00971C 02:970C: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00971D 02:970D: 41        .byte con_obj_id_41   ; 

- D 0 - I - 0x00971E 02:970E: FF        .byte $FF   ; end token



_off019_03_970F_4A:
- D 0 - I - 0x00971F 02:970F: FF        .byte $FF   ; end token



_off019_03_9710_4B:
- - - - - - 0x009720 02:9710: FF        .byte $FF   ; end token



_off019_03_9711_4C:
- - - - - - 0x009721 02:9711: FF        .byte $FF   ; end token



_off019_03_9712_4D:
- - - - - - 0x009722 02:9712: FF        .byte $FF   ; end token



_off019_03_9713_4E:
- - - - - - 0x009723 02:9713: FF        .byte $FF   ; end token



_off019_03_9714_4F:
- - - - - - 0x009724 02:9714: FF        .byte $FF   ; end token



_off019_03_9715_50:
- D 0 - I - 0x009725 02:9715: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x009726 02:9716: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009727 02:9717: 41        .byte con_obj_id_41   ; 

- D 0 - I - 0x009728 02:9718: 42        .byte $10 * $04 + $02   ; pos YX
- D 0 - I - 0x009729 02:9719: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00972A 02:971A: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x00972B 02:971B: 4A        .byte $10 * $04 + $0A   ; pos YX
- D 0 - I - 0x00972C 02:971C: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00972D 02:971D: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x00972E 02:971E: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x00972F 02:971F: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009730 02:9720: 41        .byte con_obj_id_41   ; 

- D 0 - I - 0x009731 02:9721: FF        .byte $FF   ; end token



_off019_03_9722_51:
- D 0 - I - 0x009732 02:9722: FF        .byte $FF   ; end token



_off019_03_9723_52:
- - - - - - 0x009733 02:9723: FF        .byte $FF   ; end token



_off019_03_9724_53:
- - - - - - 0x009734 02:9724: FF        .byte $FF   ; end token



_off019_03_9725_54:
- - - - - - 0x009735 02:9725: FF        .byte $FF   ; end token



_off019_03_9726_55:
- D 0 - I - 0x009736 02:9726: 52        .byte $10 * $05 + $02   ; pos YX
- D 0 - I - 0x009737 02:9727: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009738 02:9728: 6C        .byte con_obj_id_6C   ; 

- D 0 - I - 0x009739 02:9729: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x00973A 02:972A: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00973B 02:972B: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00973C 02:972C: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x00973D 02:972D: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00973E 02:972E: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00973F 02:972F: 9A        .byte $10 * $09 + $0A   ; pos YX
- D 0 - I - 0x009740 02:9730: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009741 02:9731: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009742 02:9732: 9C        .byte $10 * $09 + $0C   ; pos YX
- D 0 - I - 0x009743 02:9733: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009744 02:9734: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009745 02:9735: 9F        .byte $10 * $09 + $0F   ; pos YX
- D 0 - I - 0x009746 02:9736: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009747 02:9737: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009748 02:9738: 67        .byte $10 * $06 + $07   ; pos YX
- D 0 - I - 0x009749 02:9739: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x00974A 02:973A: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00974B 02:973B: FF        .byte $FF   ; end token



_off019_03_973C_56:
- D 0 - I - 0x00974C 02:973C: 52        .byte $10 * $05 + $02   ; pos YX
- D 0 - I - 0x00974D 02:973D: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00974E 02:973E: 6C        .byte con_obj_id_6C   ; 

- D 0 - I - 0x00974F 02:973F: 92        .byte $10 * $09 + $02   ; pos YX
- D 0 - I - 0x009750 02:9740: 09        .byte $00 + $00 + $09   ; flags
- D 0 - I - 0x009751 02:9741: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009752 02:9742: 95        .byte $10 * $09 + $05   ; pos YX
- D 0 - I - 0x009753 02:9743: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009754 02:9744: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009755 02:9745: 95        .byte $10 * $09 + $05   ; pos YX
- D 0 - I - 0x009756 02:9746: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009757 02:9747: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009758 02:9748: 9B        .byte $10 * $09 + $0B   ; pos YX
- D 0 - I - 0x009759 02:9749: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00975A 02:974A: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00975B 02:974B: 9C        .byte $10 * $09 + $0C   ; pos YX
- D 0 - I - 0x00975C 02:974C: 09        .byte $00 + $00 + $09   ; flags
- D 0 - I - 0x00975D 02:974D: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00975E 02:974E: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x00975F 02:974F: 08        .byte $00 + $00 + $08   ; flags
- D 0 - I - 0x009760 02:9750: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009761 02:9751: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x009762 02:9752: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009763 02:9753: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009764 02:9754: FF        .byte $FF   ; end token



_off019_03_9755_57:
- D 0 - I - 0x009765 02:9755: 18        .byte $10 * $01 + $08   ; pos YX
- D 0 - I - 0x009766 02:9756: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009767 02:9757: 2C        .byte con_obj_id_2C   ; 

- D 0 - I - 0x009768 02:9758: 45        .byte $10 * $04 + $05   ; pos YX
- D 0 - I - 0x009769 02:9759: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00976A 02:975A: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00976B 02:975B: 4A        .byte $10 * $04 + $0A   ; pos YX
- D 0 - I - 0x00976C 02:975C: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00976D 02:975D: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00976E 02:975E: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x00976F 02:975F: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009770 02:9760: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009771 02:9761: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x009772 02:9762: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009773 02:9763: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009774 02:9764: 96        .byte $10 * $09 + $06   ; pos YX
- D 0 - I - 0x009775 02:9765: 09        .byte $00 + $00 + $09   ; flags
- D 0 - I - 0x009776 02:9766: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009777 02:9767: 98        .byte $10 * $09 + $08   ; pos YX
- D 0 - I - 0x009778 02:9768: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009779 02:9769: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00977A 02:976A: FF        .byte $FF   ; end token



_off019_03_976B_58:
- - - - - - 0x00977B 02:976B: FF        .byte $FF   ; end token



_off019_03_976C_59:
- - - - - - 0x00977C 02:976C: FF        .byte $FF   ; end token



_off019_03_976D_5A:
- - - - - - 0x00977D 02:976D: FF        .byte $FF   ; end token



_off013_0x00977E_04_area_5:
- D 0 - I - 0x00977E 02:976E: EC 97     .word _off019_04_97EC_00
- D 0 - I - 0x009780 02:9770: F6 97     .word _off019_04_97F6_01
- D 0 - I - 0x009782 02:9772: F7 97     .word _off019_04_97F7_02
- D 0 - I - 0x009784 02:9774: F8 97     .word _off019_04_97F8_03
- - - - - - 0x009786 02:9776: F9 97     .word _off019_04_97F9_04
- - - - - - 0x009788 02:9778: FA 97     .word _off019_04_97FA_05
- - - - - - 0x00978A 02:977A: FB 97     .word _off019_04_97FB_06
- - - - - - 0x00978C 02:977C: FC 97     .word _off019_04_97FC_07
- - - - - - 0x00978E 02:977E: FD 97     .word _off019_04_97FD_08
- D 0 - I - 0x009790 02:9780: FE 97     .word _off019_04_97FE_09
- D 0 - I - 0x009792 02:9782: 0B 98     .word _off019_04_980B_0A
- D 0 - I - 0x009794 02:9784: 0C 98     .word _off019_04_980C_0B
- D 0 - I - 0x009796 02:9786: 10 98     .word _off019_04_9810_0C
- D 0 - I - 0x009798 02:9788: 14 98     .word _off019_04_9814_0D
- D 0 - I - 0x00979A 02:978A: 15 98     .word _off019_04_9815_0E
- - - - - - 0x00979C 02:978C: 16 98     .word _off019_04_9816_0F
- - - - - - 0x00979E 02:978E: 17 98     .word _off019_04_9817_10
- - - - - - 0x0097A0 02:9790: 18 98     .word _off019_04_9818_11
- D 0 - I - 0x0097A2 02:9792: 19 98     .word _off019_04_9819_12
- D 0 - I - 0x0097A4 02:9794: 26 98     .word _off019_04_9826_13
- D 0 - I - 0x0097A6 02:9796: 27 98     .word _off019_04_9827_14
- D 0 - I - 0x0097A8 02:9798: 28 98     .word _off019_04_9828_15
- D 0 - I - 0x0097AA 02:979A: 2C 98     .word _off019_04_982C_16
- D 0 - I - 0x0097AC 02:979C: 30 98     .word _off019_04_9830_17
- - - - - - 0x0097AE 02:979E: 34 98     .word _off019_04_9834_18
- - - - - - 0x0097B0 02:97A0: 35 98     .word _off019_04_9835_19
- - - - - - 0x0097B2 02:97A2: 36 98     .word _off019_04_9836_1A
- D 0 - I - 0x0097B4 02:97A4: 37 98     .word _off019_04_9837_1B
- D 0 - I - 0x0097B6 02:97A6: 47 98     .word _off019_04_9847_1C
- - - - - - 0x0097B8 02:97A8: 48 98     .word _off019_04_9848_1D
- - - - - - 0x0097BA 02:97AA: 49 98     .word _off019_04_9849_1E
- - - - - - 0x0097BC 02:97AC: 4A 98     .word _off019_04_984A_1F
- - - - - - 0x0097BE 02:97AE: 4B 98     .word _off019_04_984B_20
- - - - - - 0x0097C0 02:97B0: 4C 98     .word _off019_04_984C_21
- - - - - - 0x0097C2 02:97B2: 4D 98     .word _off019_04_984D_22
- - - - - - 0x0097C4 02:97B4: 4E 98     .word _off019_04_984E_23
- D 0 - I - 0x0097C6 02:97B6: 4F 98     .word _off019_04_984F_24
- D 0 - I - 0x0097C8 02:97B8: 59 98     .word _off019_04_9859_25
- - - - - - 0x0097CA 02:97BA: 5A 98     .word _off019_04_985A_26
- - - - - - 0x0097CC 02:97BC: 5B 98     .word _off019_04_985B_27
- - - - - - 0x0097CE 02:97BE: 5C 98     .word _off019_04_985C_28
- - - - - - 0x0097D0 02:97C0: 5D 98     .word _off019_04_985D_29
- - - - - - 0x0097D2 02:97C2: 5E 98     .word _off019_04_985E_2A
- - - - - - 0x0097D4 02:97C4: 5F 98     .word _off019_04_985F_2B
- - - - - - 0x0097D6 02:97C6: 60 98     .word _off019_04_9860_2C
- D 0 - I - 0x0097D8 02:97C8: 61 98     .word _off019_04_9861_2D
- D 0 - I - 0x0097DA 02:97CA: 71 98     .word _off019_04_9871_2E
- - - - - - 0x0097DC 02:97CC: 72 98     .word _off019_04_9872_2F
- - - - - - 0x0097DE 02:97CE: 73 98     .word _off019_04_9873_30
- - - - - - 0x0097E0 02:97D0: 74 98     .word _off019_04_9874_31
- - - - - - 0x0097E2 02:97D2: 75 98     .word _off019_04_9875_32
- - - - - - 0x0097E4 02:97D4: 76 98     .word _off019_04_9876_33
- - - - - - 0x0097E6 02:97D6: 77 98     .word _off019_04_9877_34
- - - - - - 0x0097E8 02:97D8: 78 98     .word _off019_04_9878_35
- - - - - - 0x0097EA 02:97DA: 79 98     .word _off019_04_9879_36
- - - - - - 0x0097EC 02:97DC: 7A 98     .word _off019_04_987A_37
- - - - - - 0x0097EE 02:97DE: 7B 98     .word _off019_04_987B_38
- - - - - - 0x0097F0 02:97E0: 7C 98     .word _off019_04_987C_39
- - - - - - 0x0097F2 02:97E2: 7D 98     .word _off019_04_987D_3A
- - - - - - 0x0097F4 02:97E4: 7E 98     .word _off019_04_987E_3B
- - - - - - 0x0097F6 02:97E6: 7F 98     .word _off019_04_987F_3C
- - - - - - 0x0097F8 02:97E8: 80 98     .word _off019_04_9880_3D
- - - - - - 0x0097FA 02:97EA: 81 98     .word _off019_04_9881_3E



_off019_04_97EC_00:
- D 0 - I - 0x0097FC 02:97EC: AA        .byte $10 * $0A + $0A   ; pos YX
- D 0 - I - 0x0097FD 02:97ED: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0097FE 02:97EE: 2F        .byte con_obj_id_2F   ; 

- D 0 - I - 0x0097FF 02:97EF: C1        .byte $10 * $0C + $01   ; pos YX
- D 0 - I - 0x009800 02:97F0: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009801 02:97F1: 2F        .byte con_obj_id_2F   ; 

- D 0 - I - 0x009802 02:97F2: D6        .byte $10 * $0D + $06   ; pos YX
- D 0 - I - 0x009803 02:97F3: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009804 02:97F4: 2F        .byte con_obj_id_2F   ; 

- D 0 - I - 0x009805 02:97F5: FF        .byte $FF   ; end token



_off019_04_97F6_01:
- D 0 - I - 0x009806 02:97F6: FF        .byte $FF   ; end token



_off019_04_97F7_02:
- D 0 - I - 0x009807 02:97F7: FF        .byte $FF   ; end token



_off019_04_97F8_03:
- D 0 - I - 0x009808 02:97F8: FF        .byte $FF   ; end token



_off019_04_97F9_04:
- - - - - - 0x009809 02:97F9: FF        .byte $FF   ; end token



_off019_04_97FA_05:
- - - - - - 0x00980A 02:97FA: FF        .byte $FF   ; end token



_off019_04_97FB_06:
- - - - - - 0x00980B 02:97FB: FF        .byte $FF   ; end token



_off019_04_97FC_07:
- - - - - - 0x00980C 02:97FC: FF        .byte $FF   ; end token



_off019_04_97FD_08:
- - - - - - 0x00980D 02:97FD: FF        .byte $FF   ; end token



_off019_04_97FE_09:
- D 0 - I - 0x00980E 02:97FE: 03        .byte $10 * $00 + $03   ; pos YX
- D 0 - I - 0x00980F 02:97FF: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009810 02:9800: 2F        .byte con_obj_id_2F   ; 

- D 0 - I - 0x009811 02:9801: 28        .byte $10 * $02 + $08   ; pos YX
- D 0 - I - 0x009812 02:9802: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009813 02:9803: 2F        .byte con_obj_id_2F   ; 

- D 0 - I - 0x009814 02:9804: 43        .byte $10 * $04 + $03   ; pos YX
- D 0 - I - 0x009815 02:9805: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009816 02:9806: 2F        .byte con_obj_id_2F   ; 

- D 0 - I - 0x009817 02:9807: 7B        .byte $10 * $07 + $0B   ; pos YX
- D 0 - I - 0x009818 02:9808: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009819 02:9809: 2F        .byte con_obj_id_2F   ; 

- D 0 - I - 0x00981A 02:980A: FF        .byte $FF   ; end token



_off019_04_980B_0A:
- D 0 - I - 0x00981B 02:980B: FF        .byte $FF   ; end token



_off019_04_980C_0B:
- D 0 - I - 0x00981C 02:980C: 59        .byte $10 * $05 + $09   ; pos YX
- D 0 - I - 0x00981D 02:980D: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00981E 02:980E: 58        .byte con_obj_id_58   ; 

- D 0 - I - 0x00981F 02:980F: FF        .byte $FF   ; end token



_off019_04_9810_0C:
- D 0 - I - 0x009820 02:9810: E9        .byte $10 * $0E + $09   ; pos YX
- D 0 - I - 0x009821 02:9811: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009822 02:9812: 32        .byte con_obj_id_32   ; 

- D 0 - I - 0x009823 02:9813: FF        .byte $FF   ; end token



_off019_04_9814_0D:
- D 0 - I - 0x009824 02:9814: FF        .byte $FF   ; end token



_off019_04_9815_0E:
- D 0 - I - 0x009825 02:9815: FF        .byte $FF   ; end token



_off019_04_9816_0F:
- - - - - - 0x009826 02:9816: FF        .byte $FF   ; end token



_off019_04_9817_10:
- - - - - - 0x009827 02:9817: FF        .byte $FF   ; end token



_off019_04_9818_11:
- - - - - - 0x009828 02:9818: FF        .byte $FF   ; end token



_off019_04_9819_12:
- D 0 - I - 0x009829 02:9819: 13        .byte $10 * $01 + $03   ; pos YX
- D 0 - I - 0x00982A 02:981A: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00982B 02:981B: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00982C 02:981C: 4A        .byte $10 * $04 + $0A   ; pos YX
- D 0 - I - 0x00982D 02:981D: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00982E 02:981E: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00982F 02:981F: 81        .byte $10 * $08 + $01   ; pos YX
- D 0 - I - 0x009830 02:9820: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009831 02:9821: 34        .byte con_obj_id_34   ; 

- D 0 - I - 0x009832 02:9822: 8E        .byte $10 * $08 + $0E   ; pos YX
- D 0 - I - 0x009833 02:9823: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009834 02:9824: 34        .byte con_obj_id_34   ; 

- D 0 - I - 0x009835 02:9825: FF        .byte $FF   ; end token



_off019_04_9826_13:
- D 0 - I - 0x009836 02:9826: FF        .byte $FF   ; end token



_off019_04_9827_14:
- D 0 - I - 0x009837 02:9827: FF        .byte $FF   ; end token



_off019_04_9828_15:
- D 0 - I - 0x009838 02:9828: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x009839 02:9829: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00983A 02:982A: 58        .byte con_obj_id_58   ; 

- D 0 - I - 0x00983B 02:982B: FF        .byte $FF   ; end token



_off019_04_982C_16:
- D 0 - I - 0x00983C 02:982C: AD        .byte $10 * $0A + $0D   ; pos YX
- D 0 - I - 0x00983D 02:982D: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00983E 02:982E: 32        .byte con_obj_id_32   ; 

- D 0 - I - 0x00983F 02:982F: FF        .byte $FF   ; end token



_off019_04_9830_17:
- D 0 - I - 0x009840 02:9830: 88        .byte $10 * $08 + $08   ; pos YX
- D 0 - I - 0x009841 02:9831: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009842 02:9832: 59        .byte con_obj_id_59   ; 

- D 0 - I - 0x009843 02:9833: FF        .byte $FF   ; end token



_off019_04_9834_18:
- - - - - - 0x009844 02:9834: FF        .byte $FF   ; end token



_off019_04_9835_19:
- - - - - - 0x009845 02:9835: FF        .byte $FF   ; end token



_off019_04_9836_1A:
- - - - - - 0x009846 02:9836: FF        .byte $FF   ; end token



_off019_04_9837_1B:
- D 0 - I - 0x009847 02:9837: 0E        .byte $10 * $00 + $0E   ; pos YX
- D 0 - I - 0x009848 02:9838: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009849 02:9839: 34        .byte con_obj_id_34   ; 

- D 0 - I - 0x00984A 02:983A: 21        .byte $10 * $02 + $01   ; pos YX
- D 0 - I - 0x00984B 02:983B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00984C 02:983C: 34        .byte con_obj_id_34   ; 

- D 0 - I - 0x00984D 02:983D: 56        .byte $10 * $05 + $06   ; pos YX
- D 0 - I - 0x00984E 02:983E: A6        .byte $80 + $00 + $26   ; flags
- D 0 - I - 0x00984F 02:983F: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009850 02:9840: 6B        .byte $10 * $06 + $0B   ; pos YX
- D 0 - I - 0x009851 02:9841: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x009852 02:9842: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009853 02:9843: A6        .byte $10 * $0A + $06   ; pos YX
- D 0 - I - 0x009854 02:9844: 84        .byte $80 + $00 + $04   ; flags
- D 0 - I - 0x009855 02:9845: 04        .byte con_obj_id_04   ; 

- D 0 - I - 0x009856 02:9846: FF        .byte $FF   ; end token



_off019_04_9847_1C:
- D 0 - I - 0x009857 02:9847: FF        .byte $FF   ; end token



_off019_04_9848_1D:
- - - - - - 0x009858 02:9848: FF        .byte $FF   ; end token



_off019_04_9849_1E:
- - - - - - 0x009859 02:9849: FF        .byte $FF   ; end token



_off019_04_984A_1F:
- - - - - - 0x00985A 02:984A: FF        .byte $FF   ; end token



_off019_04_984B_20:
- - - - - - 0x00985B 02:984B: FF        .byte $FF   ; end token



_off019_04_984C_21:
- - - - - - 0x00985C 02:984C: FF        .byte $FF   ; end token



_off019_04_984D_22:
- - - - - - 0x00985D 02:984D: FF        .byte $FF   ; end token



_off019_04_984E_23:
- - - - - - 0x00985E 02:984E: FF        .byte $FF   ; end token



_off019_04_984F_24:
- D 0 - I - 0x00985F 02:984F: 0A        .byte $10 * $00 + $0A   ; pos YX
- D 0 - I - 0x009860 02:9850: 8B        .byte $80 + $00 + $0B   ; flags
- D 0 - I - 0x009861 02:9851: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x009862 02:9852: 42        .byte $10 * $04 + $02   ; pos YX
- D 0 - I - 0x009863 02:9853: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009864 02:9854: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009865 02:9855: C0        .byte $10 * $0C + $00   ; pos YX
- D 0 - I - 0x009866 02:9856: 8A        .byte $80 + $00 + $0A   ; flags
- D 0 - I - 0x009867 02:9857: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x009868 02:9858: FF        .byte $FF   ; end token



_off019_04_9859_25:
- D 0 - I - 0x009869 02:9859: FF        .byte $FF   ; end token



_off019_04_985A_26:
- - - - - - 0x00986A 02:985A: FF        .byte $FF   ; end token



_off019_04_985B_27:
- - - - - - 0x00986B 02:985B: FF        .byte $FF   ; end token



_off019_04_985C_28:
- - - - - - 0x00986C 02:985C: FF        .byte $FF   ; end token



_off019_04_985D_29:
- - - - - - 0x00986D 02:985D: FF        .byte $FF   ; end token



_off019_04_985E_2A:
- - - - - - 0x00986E 02:985E: FF        .byte $FF   ; end token



_off019_04_985F_2B:
- - - - - - 0x00986F 02:985F: FF        .byte $FF   ; end token



_off019_04_9860_2C:
- - - - - - 0x009870 02:9860: FF        .byte $FF   ; end token



_off019_04_9861_2D:
- D 0 - I - 0x009871 02:9861: 0E        .byte $10 * $00 + $0E   ; pos YX
- D 0 - I - 0x009872 02:9862: 8A        .byte $80 + $00 + $0A   ; flags
- D 0 - I - 0x009873 02:9863: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x009874 02:9864: 60        .byte $10 * $06 + $00   ; pos YX
- D 0 - I - 0x009875 02:9865: 84        .byte $80 + $00 + $04   ; flags
- D 0 - I - 0x009876 02:9866: 0B        .byte con_obj_id_0B   ; 

- D 0 - I - 0x009877 02:9867: 8C        .byte $10 * $08 + $0C   ; pos YX
- D 0 - I - 0x009878 02:9868: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009879 02:9869: 04        .byte con_obj_id_04   ; 

- D 0 - I - 0x00987A 02:986A: CA        .byte $10 * $0C + $0A   ; pos YX
- D 0 - I - 0x00987B 02:986B: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x00987C 02:986C: 0B        .byte con_obj_id_0B   ; 

- D 0 - I - 0x00987D 02:986D: EE        .byte $10 * $0E + $0E   ; pos YX
- D 0 - I - 0x00987E 02:986E: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x00987F 02:986F: 04        .byte con_obj_id_04   ; 

- D 0 - I - 0x009880 02:9870: FF        .byte $FF   ; end token



_off019_04_9871_2E:
- D 0 - I - 0x009881 02:9871: FF        .byte $FF   ; end token



_off019_04_9872_2F:
- - - - - - 0x009882 02:9872: FF        .byte $FF   ; end token



_off019_04_9873_30:
- - - - - - 0x009883 02:9873: FF        .byte $FF   ; end token



_off019_04_9874_31:
- - - - - - 0x009884 02:9874: FF        .byte $FF   ; end token



_off019_04_9875_32:
- - - - - - 0x009885 02:9875: FF        .byte $FF   ; end token



_off019_04_9876_33:
- - - - - - 0x009886 02:9876: FF        .byte $FF   ; end token



_off019_04_9877_34:
- - - - - - 0x009887 02:9877: FF        .byte $FF   ; end token



_off019_04_9878_35:
- - - - - - 0x009888 02:9878: FF        .byte $FF   ; end token



_off019_04_9879_36:
- - - - - - 0x009889 02:9879: FF        .byte $FF   ; end token



_off019_04_987A_37:
- - - - - - 0x00988A 02:987A: FF        .byte $FF   ; end token



_off019_04_987B_38:
- - - - - - 0x00988B 02:987B: FF        .byte $FF   ; end token



_off019_04_987C_39:
- - - - - - 0x00988C 02:987C: FF        .byte $FF   ; end token



_off019_04_987D_3A:
- - - - - - 0x00988D 02:987D: FF        .byte $FF   ; end token



_off019_04_987E_3B:
- - - - - - 0x00988E 02:987E: FF        .byte $FF   ; end token



_off019_04_987F_3C:
- - - - - - 0x00988F 02:987F: FF        .byte $FF   ; end token



_off019_04_9880_3D:
- - - - - - 0x009890 02:9880: FF        .byte $FF   ; end token



_off019_04_9881_3E:
- - - - - - 0x009891 02:9881: FF        .byte $FF   ; end token



_off013_0x009892_05_area_6:
- - - - - - 0x009892 02:9882: BA 98     .word _off019_05_98BA_00
- - - - - - 0x009894 02:9884: BA 98     .word _off019_05_98BA_01
- D 0 - I - 0x009896 02:9886: BB 98     .word _off019_05_98BB_02
- D 0 - I - 0x009898 02:9888: BA 98     .word _off019_05_98BA_03
- D 0 - I - 0x00989A 02:988A: C8 98     .word _off019_05_98C8_04
- D 0 - I - 0x00989C 02:988C: BA 98     .word _off019_05_98BA_05
- D 0 - I - 0x00989E 02:988E: CC 98     .word _off019_05_98CC_06
- D 0 - I - 0x0098A0 02:9890: BA 98     .word _off019_05_98BA_07
- D 0 - I - 0x0098A2 02:9892: D0 98     .word _off019_05_98D0_08
- D 0 - I - 0x0098A4 02:9894: BA 98     .word _off019_05_98BA_09
- D 0 - I - 0x0098A6 02:9896: EC 98     .word _off019_05_98EC_0A
- D 0 - I - 0x0098A8 02:9898: BA 98     .word _off019_05_98BA_0B
- D 0 - I - 0x0098AA 02:989A: 05 99     .word _off019_05_9905_0C
- D 0 - I - 0x0098AC 02:989C: BA 98     .word _off019_05_98BA_0D
- D 0 - I - 0x0098AE 02:989E: 06 99     .word _off019_05_9906_0E
- D 0 - I - 0x0098B0 02:98A0: BA 98     .word _off019_05_98BA_0F
- D 0 - I - 0x0098B2 02:98A2: 13 99     .word _off019_05_9913_10
- D 0 - I - 0x0098B4 02:98A4: BA 98     .word _off019_05_98BA_11
- D 0 - I - 0x0098B6 02:98A6: 14 99     .word _off019_05_9914_12
- D 0 - I - 0x0098B8 02:98A8: BA 98     .word _off019_05_98BA_13
- D 0 - I - 0x0098BA 02:98AA: 21 99     .word _off019_05_9921_14
- D 0 - I - 0x0098BC 02:98AC: BA 98     .word _off019_05_98BA_15
- D 0 - I - 0x0098BE 02:98AE: 22 99     .word _off019_05_9922_16
- D 0 - I - 0x0098C0 02:98B0: BA 98     .word _off019_05_98BA_17
- - - - - - 0x0098C2 02:98B2: 23 99     .word _off019_05_9923_18
- - - - - - 0x0098C4 02:98B4: BA 98     .word _off019_05_98BA_19
- - - - - - 0x0098C6 02:98B6: 24 99     .word _off019_05_9924_1A
- - - - - - 0x0098C8 02:98B8: BA 98     .word _off019_05_98BA_1B



_off019_05_98BA_00:
_off019_05_98BA_01:
_off019_05_98BA_03:
_off019_05_98BA_05:
_off019_05_98BA_07:
_off019_05_98BA_09:
_off019_05_98BA_0B:
_off019_05_98BA_0D:
_off019_05_98BA_0F:
_off019_05_98BA_11:
_off019_05_98BA_13:
_off019_05_98BA_15:
_off019_05_98BA_17:
_off019_05_98BA_19:
_off019_05_98BA_1B:
- D 0 - I - 0x0098CA 02:98BA: FF        .byte $FF   ; end token



_off019_05_98BB_02:
- D 0 - I - 0x0098CB 02:98BB: 10        .byte $10 * $01 + $00   ; pos YX
- D 0 - I - 0x0098CC 02:98BC: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x0098CD 02:98BD: 64        .byte con_obj_id_64   ; 

- D 0 - I - 0x0098CE 02:98BE: 5D        .byte $10 * $05 + $0D   ; pos YX
- D 0 - I - 0x0098CF 02:98BF: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098D0 02:98C0: 70        .byte con_obj_id_70   ; 

- D 0 - I - 0x0098D1 02:98C1: 52        .byte $10 * $05 + $02   ; pos YX
- D 0 - I - 0x0098D2 02:98C2: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098D3 02:98C3: 70        .byte con_obj_id_70   ; 

- D 0 - I - 0x0098D4 02:98C4: 71        .byte $10 * $07 + $01   ; pos YX
- D 0 - I - 0x0098D5 02:98C5: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098D6 02:98C6: 71        .byte con_obj_id_71   ; 

- D 0 - I - 0x0098D7 02:98C7: FF        .byte $FF   ; end token



_off019_05_98C8_04:
- D 0 - I - 0x0098D8 02:98C8: A7        .byte $10 * $0A + $07   ; pos YX
- D 0 - I - 0x0098D9 02:98C9: C1        .byte $80 + $40 + $01   ; flags
- D 0 - I - 0x0098DA 02:98CA: 0D        .byte con_obj_id_0D   ; 

- D 0 - I - 0x0098DB 02:98CB: FF        .byte $FF   ; end token



_off019_05_98CC_06:
- D 0 - I - 0x0098DC 02:98CC: E1        .byte $10 * $0E + $01   ; pos YX
- D 0 - I - 0x0098DD 02:98CD: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x0098DE 02:98CE: 71        .byte con_obj_id_71   ; 

- D 0 - I - 0x0098DF 02:98CF: FF        .byte $FF   ; end token



_off019_05_98D0_08:
- D 0 - I - 0x0098E0 02:98D0: 02        .byte $10 * $00 + $02   ; pos YX
- D 0 - I - 0x0098E1 02:98D1: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098E2 02:98D2: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x0098E3 02:98D3: 0D        .byte $10 * $00 + $0D   ; pos YX
- D 0 - I - 0x0098E4 02:98D4: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098E5 02:98D5: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x0098E6 02:98D6: 42        .byte $10 * $04 + $02   ; pos YX
- D 0 - I - 0x0098E7 02:98D7: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098E8 02:98D8: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x0098E9 02:98D9: 4D        .byte $10 * $04 + $0D   ; pos YX
- D 0 - I - 0x0098EA 02:98DA: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098EB 02:98DB: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x0098EC 02:98DC: 82        .byte $10 * $08 + $02   ; pos YX
- D 0 - I - 0x0098ED 02:98DD: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098EE 02:98DE: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x0098EF 02:98DF: 8D        .byte $10 * $08 + $0D   ; pos YX
- D 0 - I - 0x0098F0 02:98E0: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098F1 02:98E1: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x0098F2 02:98E2: 98        .byte $10 * $09 + $08   ; pos YX
- D 0 - I - 0x0098F3 02:98E3: B6        .byte $80 + $00 + $36   ; flags
- D 0 - I - 0x0098F4 02:98E4: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0098F5 02:98E5: C2        .byte $10 * $0C + $02   ; pos YX
- D 0 - I - 0x0098F6 02:98E6: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098F7 02:98E7: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x0098F8 02:98E8: CD        .byte $10 * $0C + $0D   ; pos YX
- D 0 - I - 0x0098F9 02:98E9: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098FA 02:98EA: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x0098FB 02:98EB: FF        .byte $FF   ; end token



_off019_05_98EC_0A:
- D 0 - I - 0x0098FC 02:98EC: 12        .byte $10 * $01 + $02   ; pos YX
- D 0 - I - 0x0098FD 02:98ED: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098FE 02:98EE: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x0098FF 02:98EF: 1D        .byte $10 * $01 + $0D   ; pos YX
- D 0 - I - 0x009900 02:98F0: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009901 02:98F1: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x009902 02:98F2: 52        .byte $10 * $05 + $02   ; pos YX
- D 0 - I - 0x009903 02:98F3: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009904 02:98F4: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x009905 02:98F5: 5D        .byte $10 * $05 + $0D   ; pos YX
- D 0 - I - 0x009906 02:98F6: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009907 02:98F7: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x009908 02:98F8: 58        .byte $10 * $05 + $08   ; pos YX
- D 0 - I - 0x009909 02:98F9: B1        .byte $80 + $00 + $31   ; flags
- D 0 - I - 0x00990A 02:98FA: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00990B 02:98FB: 58        .byte $10 * $05 + $08   ; pos YX
- D 0 - I - 0x00990C 02:98FC: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00990D 02:98FD: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00990E 02:98FE: 92        .byte $10 * $09 + $02   ; pos YX
- D 0 - I - 0x00990F 02:98FF: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009910 02:9900: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x009911 02:9901: 9D        .byte $10 * $09 + $0D   ; pos YX
- D 0 - I - 0x009912 02:9902: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009913 02:9903: 60        .byte con_obj_id_60   ; 

- D 0 - I - 0x009914 02:9904: FF        .byte $FF   ; end token



_off019_05_9905_0C:
- D 0 - I - 0x009915 02:9905: FF        .byte $FF   ; end token



_off019_05_9906_0E:
- D 0 - I - 0x009916 02:9906: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x009917 02:9907: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009918 02:9908: 5F        .byte con_obj_id_5F   ; 

- D 0 - I - 0x009919 02:9909: 4C        .byte $10 * $04 + $0C   ; pos YX
- D 0 - I - 0x00991A 02:990A: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00991B 02:990B: 5F        .byte con_obj_id_5F   ; 

- D 0 - I - 0x00991C 02:990C: 44        .byte $10 * $04 + $04   ; pos YX
- D 0 - I - 0x00991D 02:990D: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00991E 02:990E: 5F        .byte con_obj_id_5F   ; 

- D 0 - I - 0x00991F 02:990F: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009920 02:9910: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009921 02:9911: 5F        .byte con_obj_id_5F   ; 

- D 0 - I - 0x009922 02:9912: FF        .byte $FF   ; end token



_off019_05_9913_10:
- D 0 - I - 0x009923 02:9913: FF        .byte $FF   ; end token



_off019_05_9914_12:
- D 0 - I - 0x009924 02:9914: 1A        .byte $10 * $01 + $0A   ; pos YX
- D 0 - I - 0x009925 02:9915: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009926 02:9916: 5D        .byte con_obj_id_5D   ; 

- D 0 - I - 0x009927 02:9917: 88        .byte $10 * $08 + $08   ; pos YX
- D 0 - I - 0x009928 02:9918: B3        .byte $80 + $00 + $33   ; flags
- D 0 - I - 0x009929 02:9919: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00992A 02:991A: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x00992B 02:991B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00992C 02:991C: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00992D 02:991D: E0        .byte $10 * $0E + $00   ; pos YX
- D 0 - I - 0x00992E 02:991E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00992F 02:991F: 5E        .byte con_obj_id_5E   ; 

- D 0 - I - 0x009930 02:9920: FF        .byte $FF   ; end token



_off019_05_9921_14:
- D 0 - I - 0x009931 02:9921: FF        .byte $FF   ; end token



_off019_05_9922_16:
- D 0 - I - 0x009932 02:9922: FF        .byte $FF   ; end token



_off019_05_9923_18:
- - - - - - 0x009933 02:9923: FF        .byte $FF   ; end token



_off019_05_9924_1A:
- - - - - - 0x009934 02:9924: FF        .byte $FF   ; end token



_off013_0x009935_06_area_7:
- - - - - - 0x009935 02:9925: 5D 99     .word _off019_06_995D_00
- - - - - - 0x009937 02:9927: 5D 99     .word _off019_06_995D_01
- D 0 - I - 0x009939 02:9929: 5E 99     .word _off019_06_995E_02
- D 0 - I - 0x00993B 02:992B: 5D 99     .word _off019_06_995D_03
- D 0 - I - 0x00993D 02:992D: 5F 99     .word _off019_06_995F_04
- D 0 - I - 0x00993F 02:992F: 5D 99     .word _off019_06_995D_05
- D 0 - I - 0x009941 02:9931: 69 99     .word _off019_06_9969_06
- D 0 - I - 0x009943 02:9933: 5D 99     .word _off019_06_995D_07
- D 0 - I - 0x009945 02:9935: 70 99     .word _off019_06_9970_08
- D 0 - I - 0x009947 02:9937: 5D 99     .word _off019_06_995D_09
- D 0 - I - 0x009949 02:9939: 74 99     .word _off019_06_9974_0A
- D 0 - I - 0x00994B 02:993B: 5D 99     .word _off019_06_995D_0B
- D 0 - I - 0x00994D 02:993D: 7B 99     .word _off019_06_997B_0C
- D 0 - I - 0x00994F 02:993F: 5D 99     .word _off019_06_995D_0D
- D 0 - I - 0x009951 02:9941: 7F 99     .word _off019_06_997F_0E
- D 0 - I - 0x009953 02:9943: 5D 99     .word _off019_06_995D_0F
- D 0 - I - 0x009955 02:9945: 86 99     .word _off019_06_9986_10
- D 0 - I - 0x009957 02:9947: 5D 99     .word _off019_06_995D_11
- D 0 - I - 0x009959 02:9949: 87 99     .word _off019_06_9987_12
- D 0 - I - 0x00995B 02:994B: 5D 99     .word _off019_06_995D_13
- D 0 - I - 0x00995D 02:994D: 97 99     .word _off019_06_9997_14
- D 0 - I - 0x00995F 02:994F: 5D 99     .word _off019_06_995D_15
- D 0 - I - 0x009961 02:9951: A7 99     .word _off019_06_99A7_16
- D 0 - I - 0x009963 02:9953: 5D 99     .word _off019_06_995D_17
- D 0 - I - 0x009965 02:9955: B4 99     .word _off019_06_99B4_18
- D 0 - I - 0x009967 02:9957: 5D 99     .word _off019_06_995D_19
- D 0 - I - 0x009969 02:9959: B8 99     .word _off019_06_99B8_1A
- D 0 - I - 0x00996B 02:995B: 5D 99     .word _off019_06_995D_1B



_off019_06_995D_00:
_off019_06_995D_01:
_off019_06_995D_03:
_off019_06_995D_05:
_off019_06_995D_07:
_off019_06_995D_09:
_off019_06_995D_0B:
_off019_06_995D_0D:
_off019_06_995D_0F:
_off019_06_995D_11:
_off019_06_995D_13:
_off019_06_995D_15:
_off019_06_995D_17:
_off019_06_995D_19:
_off019_06_995D_1B:
- D 0 - I - 0x00996D 02:995D: FF        .byte $FF   ; end token



_off019_06_995E_02:
- D 0 - I - 0x00996E 02:995E: FF        .byte $FF   ; end token



_off019_06_995F_04:
- D 0 - I - 0x00996F 02:995F: 8A        .byte $10 * $08 + $0A   ; pos YX
- D 0 - I - 0x009970 02:9960: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x009971 02:9961: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009972 02:9962: 86        .byte $10 * $08 + $06   ; pos YX
- D 0 - I - 0x009973 02:9963: A4        .byte $80 + $00 + $24   ; flags
- D 0 - I - 0x009974 02:9964: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009975 02:9965: E4        .byte $10 * $0E + $04   ; pos YX
- D 0 - I - 0x009976 02:9966: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009977 02:9967: 3B        .byte con_obj_id_3B   ; 

- D 0 - I - 0x009978 02:9968: FF        .byte $FF   ; end token



_off019_06_9969_06:
- D 0 - I - 0x009979 02:9969: 8B        .byte $10 * $08 + $0B   ; pos YX
- D 0 - I - 0x00997A 02:996A: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00997B 02:996B: 3B        .byte con_obj_id_3B   ; 

- D 0 - I - 0x00997C 02:996C: D6        .byte $10 * $0D + $06   ; pos YX
- D 0 - I - 0x00997D 02:996D: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00997E 02:996E: 3B        .byte con_obj_id_3B   ; 

- D 0 - I - 0x00997F 02:996F: FF        .byte $FF   ; end token



_off019_06_9970_08:
- D 0 - I - 0x009980 02:9970: 7B        .byte $10 * $07 + $0B   ; pos YX
- D 0 - I - 0x009981 02:9971: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009982 02:9972: 3B        .byte con_obj_id_3B   ; 

- D 0 - I - 0x009983 02:9973: FF        .byte $FF   ; end token



_off019_06_9974_0A:
- D 0 - I - 0x009984 02:9974: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x009985 02:9975: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009986 02:9976: 3B        .byte con_obj_id_3B   ; 

- D 0 - I - 0x009987 02:9977: BB        .byte $10 * $0B + $0B   ; pos YX
- D 0 - I - 0x009988 02:9978: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009989 02:9979: 3B        .byte con_obj_id_3B   ; 

- D 0 - I - 0x00998A 02:997A: FF        .byte $FF   ; end token



_off019_06_997B_0C:
- D 0 - I - 0x00998B 02:997B: B8        .byte $10 * $0B + $08   ; pos YX
- D 0 - I - 0x00998C 02:997C: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00998D 02:997D: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00998E 02:997E: FF        .byte $FF   ; end token



_off019_06_997F_0E:
- D 0 - I - 0x00998F 02:997F: 8C        .byte $10 * $08 + $0C   ; pos YX
- D 0 - I - 0x009990 02:9980: A3        .byte $80 + $00 + $23   ; flags
- D 0 - I - 0x009991 02:9981: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009992 02:9982: 84        .byte $10 * $08 + $04   ; pos YX
- D 0 - I - 0x009993 02:9983: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x009994 02:9984: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009995 02:9985: FF        .byte $FF   ; end token



_off019_06_9986_10:
- D 0 - I - 0x009996 02:9986: FF        .byte $FF   ; end token



_off019_06_9987_12:
- D 0 - I - 0x009997 02:9987: 7F        .byte $10 * $07 + $0F   ; pos YX
- D 0 - I - 0x009998 02:9988: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009999 02:9989: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x00999A 02:998A: 7B        .byte $10 * $07 + $0B   ; pos YX
- D 0 - I - 0x00999B 02:998B: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x00999C 02:998C: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00999D 02:998D: 77        .byte $10 * $07 + $07   ; pos YX
- D 0 - I - 0x00999E 02:998E: A4        .byte $80 + $00 + $24   ; flags
- D 0 - I - 0x00999F 02:998F: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0099A0 02:9990: B1        .byte $10 * $0B + $01   ; pos YX
- D 0 - I - 0x0099A1 02:9991: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099A2 02:9992: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099A3 02:9993: B3        .byte $10 * $0B + $03   ; pos YX
- D 0 - I - 0x0099A4 02:9994: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099A5 02:9995: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099A6 02:9996: FF        .byte $FF   ; end token



_off019_06_9997_14:
- D 0 - I - 0x0099A7 02:9997: 09        .byte $10 * $00 + $09   ; pos YX
- D 0 - I - 0x0099A8 02:9998: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099A9 02:9999: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099AA 02:999A: 43        .byte $10 * $04 + $03   ; pos YX
- D 0 - I - 0x0099AB 02:999B: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099AC 02:999C: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099AD 02:999D: 49        .byte $10 * $04 + $09   ; pos YX
- D 0 - I - 0x0099AE 02:999E: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099AF 02:999F: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099B0 02:99A0: A5        .byte $10 * $0A + $05   ; pos YX
- D 0 - I - 0x0099B1 02:99A1: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099B2 02:99A2: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099B3 02:99A3: AF        .byte $10 * $0A + $0F   ; pos YX
- D 0 - I - 0x0099B4 02:99A4: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099B5 02:99A5: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099B6 02:99A6: FF        .byte $FF   ; end token



_off019_06_99A7_16:
- D 0 - I - 0x0099B7 02:99A7: 35        .byte $10 * $03 + $05   ; pos YX
- D 0 - I - 0x0099B8 02:99A8: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099B9 02:99A9: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099BA 02:99AA: 39        .byte $10 * $03 + $09   ; pos YX
- D 0 - I - 0x0099BB 02:99AB: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099BC 02:99AC: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099BD 02:99AD: 97        .byte $10 * $09 + $07   ; pos YX
- D 0 - I - 0x0099BE 02:99AE: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099BF 02:99AF: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099C0 02:99B0: 9F        .byte $10 * $09 + $0F   ; pos YX
- D 0 - I - 0x0099C1 02:99B1: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099C2 02:99B2: 3D        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099C3 02:99B3: FF        .byte $FF   ; end token



_off019_06_99B4_18:
- D 0 - I - 0x0099C4 02:99B4: 47        .byte $10 * $04 + $07   ; pos YX
- D 0 - I - 0x0099C5 02:99B5: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099C6 02:99B6: 51        .byte con_obj_id_51   ; 

- D 0 - I - 0x0099C7 02:99B7: FF        .byte $FF   ; end token



_off019_06_99B8_1A:
- D 0 - I - 0x0099C8 02:99B8: FF        .byte $FF   ; end token



_off013_0x0099C9_07_area_8:
- - - - - - 0x0099C9 02:99B9: 39 9A     .word _off019_07_9A39_00
- - - - - - 0x0099CB 02:99BB: 3A 9A     .word _off019_07_9A3A_01
- - - - - - 0x0099CD 02:99BD: 3B 9A     .word _off019_07_9A3B_02
- - - - - - 0x0099CF 02:99BF: 3C 9A     .word _off019_07_9A3C_03
- - - - - - 0x0099D1 02:99C1: 3D 9A     .word _off019_07_9A3D_04
- D 0 - I - 0x0099D3 02:99C3: 3E 9A     .word _off019_07_9A3E_05
- D 0 - I - 0x0099D5 02:99C5: 3F 9A     .word _off019_07_9A3F_06
- D 0 - I - 0x0099D7 02:99C7: 40 9A     .word _off019_07_9A40_07
- - - - - - 0x0099D9 02:99C9: 41 9A     .word _off019_07_9A41_08
- - - - - - 0x0099DB 02:99CB: 42 9A     .word _off019_07_9A42_09
- - - - - - 0x0099DD 02:99CD: 43 9A     .word _off019_07_9A43_0A
- - - - - - 0x0099DF 02:99CF: 44 9A     .word _off019_07_9A44_0B
- - - - - - 0x0099E1 02:99D1: 45 9A     .word _off019_07_9A45_0C
- - - - - - 0x0099E3 02:99D3: 46 9A     .word _off019_07_9A46_0D
- - - - - - 0x0099E5 02:99D5: 47 9A     .word _off019_07_9A47_0E
- - - - - - 0x0099E7 02:99D7: 48 9A     .word _off019_07_9A48_0F
- - - - - - 0x0099E9 02:99D9: 49 9A     .word _off019_07_9A49_10
- - - - - - 0x0099EB 02:99DB: 4A 9A     .word _off019_07_9A4A_11
- - - - - - 0x0099ED 02:99DD: 4B 9A     .word _off019_07_9A4B_12
- - - - - - 0x0099EF 02:99DF: 4C 9A     .word _off019_07_9A4C_13
- - - - - - 0x0099F1 02:99E1: 4D 9A     .word _off019_07_9A4D_14
- D 0 - I - 0x0099F3 02:99E3: 4E 9A     .word _off019_07_9A4E_15
- D 0 - I - 0x0099F5 02:99E5: 4F 9A     .word _off019_07_9A4F_16
- D 0 - I - 0x0099F7 02:99E7: 53 9A     .word _off019_07_9A53_17
- D 0 - I - 0x0099F9 02:99E9: 57 9A     .word _off019_07_9A57_18
- D 0 - I - 0x0099FB 02:99EB: 5E 9A     .word _off019_07_9A5E_19
- D 0 - I - 0x0099FD 02:99ED: 62 9A     .word _off019_07_9A62_1A
- D 0 - I - 0x0099FF 02:99EF: 66 9A     .word _off019_07_9A66_1B
- D 0 - I - 0x009A01 02:99F1: 67 9A     .word _off019_07_9A67_1C
- D 0 - I - 0x009A03 02:99F3: 6B 9A     .word _off019_07_9A6B_1D
- - - - - - 0x009A05 02:99F5: 6C 9A     .word _off019_07_9A6C_1E
- - - - - - 0x009A07 02:99F7: 6D 9A     .word _off019_07_9A6D_1F
- - - - - - 0x009A09 02:99F9: 6E 9A     .word _off019_07_9A6E_20
- - - - - - 0x009A0B 02:99FB: 6F 9A     .word _off019_07_9A6F_21
- - - - - - 0x009A0D 02:99FD: 70 9A     .word _off019_07_9A70_22
- D 0 - I - 0x009A0F 02:99FF: 71 9A     .word _off019_07_9A71_23
- D 0 - I - 0x009A11 02:9A01: 72 9A     .word _off019_07_9A72_24
- D 0 - I - 0x009A13 02:9A03: 73 9A     .word _off019_07_9A73_25
- D 0 - I - 0x009A15 02:9A05: 7D 9A     .word _off019_07_9A7D_26
- - - - - - 0x009A17 02:9A07: 81 9A     .word _off019_07_9A81_27
- - - - - - 0x009A19 02:9A09: 82 9A     .word _off019_07_9A82_28
- - - - - - 0x009A1B 02:9A0B: 83 9A     .word _off019_07_9A83_29
- - - - - - 0x009A1D 02:9A0D: 84 9A     .word _off019_07_9A84_2A
- D 0 - I - 0x009A1F 02:9A0F: 85 9A     .word _off019_07_9A85_2B
- D 0 - I - 0x009A21 02:9A11: 86 9A     .word _off019_07_9A86_2C
- D 0 - I - 0x009A23 02:9A13: 87 9A     .word _off019_07_9A87_2D
- D 0 - I - 0x009A25 02:9A15: 88 9A     .word _off019_07_9A88_2E
- - - - - - 0x009A27 02:9A17: 89 9A     .word _off019_07_9A89_2F
- - - - - - 0x009A29 02:9A19: 8A 9A     .word _off019_07_9A8A_30
- D 0 - I - 0x009A2B 02:9A1B: 8B 9A     .word _off019_07_9A8B_31
- D 0 - I - 0x009A2D 02:9A1D: A4 9A     .word _off019_07_9AA4_32
- D 0 - I - 0x009A2F 02:9A1F: B7 9A     .word _off019_07_9AB7_33
- D 0 - I - 0x009A31 02:9A21: C4 9A     .word _off019_07_9AC4_34
- D 0 - I - 0x009A33 02:9A23: CE 9A     .word _off019_07_9ACE_35
- D 0 - I - 0x009A35 02:9A25: CF 9A     .word _off019_07_9ACF_36
- - - - - - 0x009A37 02:9A27: D0 9A     .word _off019_07_9AD0_37
- - - - - - 0x009A39 02:9A29: D1 9A     .word _off019_07_9AD1_38
- - - - - - 0x009A3B 02:9A2B: D2 9A     .word _off019_07_9AD2_39
- - - - - - 0x009A3D 02:9A2D: D3 9A     .word _off019_07_9AD3_3A
- - - - - - 0x009A3F 02:9A2F: D4 9A     .word _off019_07_9AD4_3B
- - - - - - 0x009A41 02:9A31: D5 9A     .word _off019_07_9AD5_3C
- - - - - - 0x009A43 02:9A33: D6 9A     .word _off019_07_9AD6_3D
- - - - - - 0x009A45 02:9A35: D7 9A     .word _off019_07_9AD7_3E
- - - - - - 0x009A47 02:9A37: D8 9A     .word _off019_07_9AD8_3F



_off019_07_9A39_00:
- - - - - - 0x009A49 02:9A39: FF        .byte $FF   ; end token



_off019_07_9A3A_01:
- - - - - - 0x009A4A 02:9A3A: FF        .byte $FF   ; end token



_off019_07_9A3B_02:
- - - - - - 0x009A4B 02:9A3B: FF        .byte $FF   ; end token



_off019_07_9A3C_03:
- - - - - - 0x009A4C 02:9A3C: FF        .byte $FF   ; end token



_off019_07_9A3D_04:
- - - - - - 0x009A4D 02:9A3D: FF        .byte $FF   ; end token



_off019_07_9A3E_05:
- D 0 - I - 0x009A4E 02:9A3E: FF        .byte $FF   ; end token



_off019_07_9A3F_06:
- D 0 - I - 0x009A4F 02:9A3F: FF        .byte $FF   ; end token



_off019_07_9A40_07:
- D 0 - I - 0x009A50 02:9A40: FF        .byte $FF   ; end token



_off019_07_9A41_08:
- - - - - - 0x009A51 02:9A41: FF        .byte $FF   ; end token



_off019_07_9A42_09:
- - - - - - 0x009A52 02:9A42: FF        .byte $FF   ; end token



_off019_07_9A43_0A:
- - - - - - 0x009A53 02:9A43: FF        .byte $FF   ; end token



_off019_07_9A44_0B:
- - - - - - 0x009A54 02:9A44: FF        .byte $FF   ; end token



_off019_07_9A45_0C:
- - - - - - 0x009A55 02:9A45: FF        .byte $FF   ; end token



_off019_07_9A46_0D:
- - - - - - 0x009A56 02:9A46: FF        .byte $FF   ; end token



_off019_07_9A47_0E:
- - - - - - 0x009A57 02:9A47: FF        .byte $FF   ; end token



_off019_07_9A48_0F:
- - - - - - 0x009A58 02:9A48: FF        .byte $FF   ; end token



_off019_07_9A49_10:
- - - - - - 0x009A59 02:9A49: FF        .byte $FF   ; end token



_off019_07_9A4A_11:
- - - - - - 0x009A5A 02:9A4A: FF        .byte $FF   ; end token



_off019_07_9A4B_12:
- - - - - - 0x009A5B 02:9A4B: FF        .byte $FF   ; end token



_off019_07_9A4C_13:
- - - - - - 0x009A5C 02:9A4C: FF        .byte $FF   ; end token



_off019_07_9A4D_14:
- - - - - - 0x009A5D 02:9A4D: FF        .byte $FF   ; end token



_off019_07_9A4E_15:
- D 0 - I - 0x009A5E 02:9A4E: FF        .byte $FF   ; end token



_off019_07_9A4F_16:
- D 0 - I - 0x009A5F 02:9A4F: 89        .byte $10 * $08 + $09   ; pos YX
- D 0 - I - 0x009A60 02:9A50: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009A61 02:9A51: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009A62 02:9A52: FF        .byte $FF   ; end token



_off019_07_9A53_17:
- D 0 - I - 0x009A63 02:9A53: A5        .byte $10 * $0A + $05   ; pos YX
- D 0 - I - 0x009A64 02:9A54: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009A65 02:9A55: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009A66 02:9A56: FF        .byte $FF   ; end token



_off019_07_9A57_18:
- D 0 - I - 0x009A67 02:9A57: 31        .byte $10 * $03 + $01   ; pos YX
- D 0 - I - 0x009A68 02:9A58: 93        .byte $80 + $00 + $13   ; flags
- D 0 - I - 0x009A69 02:9A59: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009A6A 02:9A5A: 71        .byte $10 * $07 + $01   ; pos YX
- D 0 - I - 0x009A6B 02:9A5B: 96        .byte $80 + $00 + $16   ; flags
- D 0 - I - 0x009A6C 02:9A5C: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009A6D 02:9A5D: FF        .byte $FF   ; end token



_off019_07_9A5E_19:
- D 0 - I - 0x009A6E 02:9A5E: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x009A6F 02:9A5F: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009A70 02:9A60: 49        .byte con_obj_id_49   ; 

- D 0 - I - 0x009A71 02:9A61: FF        .byte $FF   ; end token



_off019_07_9A62_1A:
- D 0 - I - 0x009A72 02:9A62: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x009A73 02:9A63: C1        .byte $80 + $40 + $01   ; flags
- D 0 - I - 0x009A74 02:9A64: 49        .byte con_obj_id_49   ; 

- D 0 - I - 0x009A75 02:9A65: FF        .byte $FF   ; end token



_off019_07_9A66_1B:
- D 0 - I - 0x009A76 02:9A66: FF        .byte $FF   ; end token



_off019_07_9A67_1C:
- D 0 - I - 0x009A77 02:9A67: 88        .byte $10 * $08 + $08   ; pos YX
- D 0 - I - 0x009A78 02:9A68: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009A79 02:9A69: 6D        .byte con_obj_id_6D   ; 

- D 0 - I - 0x009A7A 02:9A6A: FF        .byte $FF   ; end token



_off019_07_9A6B_1D:
- D 0 - I - 0x009A7B 02:9A6B: FF        .byte $FF   ; end token



_off019_07_9A6C_1E:
- - - - - - 0x009A7C 02:9A6C: FF        .byte $FF   ; end token



_off019_07_9A6D_1F:
- - - - - - 0x009A7D 02:9A6D: FF        .byte $FF   ; end token



_off019_07_9A6E_20:
- - - - - - 0x009A7E 02:9A6E: FF        .byte $FF   ; end token



_off019_07_9A6F_21:
- - - - - - 0x009A7F 02:9A6F: FF        .byte $FF   ; end token



_off019_07_9A70_22:
- - - - - - 0x009A80 02:9A70: FF        .byte $FF   ; end token



_off019_07_9A71_23:
- D 0 - I - 0x009A81 02:9A71: FF        .byte $FF   ; end token



_off019_07_9A72_24:
- D 0 - I - 0x009A82 02:9A72: FF        .byte $FF   ; end token



_off019_07_9A73_25:
- D 0 - I - 0x009A83 02:9A73: 87        .byte $10 * $08 + $07   ; pos YX
- D 0 - I - 0x009A84 02:9A74: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009A85 02:9A75: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009A86 02:9A76: A3        .byte $10 * $0A + $03   ; pos YX
- D 0 - I - 0x009A87 02:9A77: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x009A88 02:9A78: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009A89 02:9A79: AF        .byte $10 * $0A + $0F   ; pos YX
- D 0 - I - 0x009A8A 02:9A7A: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009A8B 02:9A7B: 47        .byte con_obj_id_47   ; 

- D 0 - I - 0x009A8C 02:9A7C: FF        .byte $FF   ; end token



_off019_07_9A7D_26:
- D 0 - I - 0x009A8D 02:9A7D: 2B        .byte $10 * $02 + $0B   ; pos YX
- D 0 - I - 0x009A8E 02:9A7E: 86        .byte $80 + $00 + $06   ; flags
- D 0 - I - 0x009A8F 02:9A7F: 47        .byte con_obj_id_47   ; 

- D 0 - I - 0x009A90 02:9A80: FF        .byte $FF   ; end token



_off019_07_9A81_27:
- - - - - - 0x009A91 02:9A81: FF        .byte $FF   ; end token



_off019_07_9A82_28:
- - - - - - 0x009A92 02:9A82: FF        .byte $FF   ; end token



_off019_07_9A83_29:
- - - - - - 0x009A93 02:9A83: FF        .byte $FF   ; end token



_off019_07_9A84_2A:
- - - - - - 0x009A94 02:9A84: FF        .byte $FF   ; end token



_off019_07_9A85_2B:
- D 0 - I - 0x009A95 02:9A85: FF        .byte $FF   ; end token



_off019_07_9A86_2C:
- D 0 - I - 0x009A96 02:9A86: FF        .byte $FF   ; end token



_off019_07_9A87_2D:
- D 0 - I - 0x009A97 02:9A87: FF        .byte $FF   ; end token



_off019_07_9A88_2E:
- D 0 - I - 0x009A98 02:9A88: FF        .byte $FF   ; end token



_off019_07_9A89_2F:
- - - - - - 0x009A99 02:9A89: FF        .byte $FF   ; end token



_off019_07_9A8A_30:
- - - - - - 0x009A9A 02:9A8A: FF        .byte $FF   ; end token



_off019_07_9A8B_31:
- D 0 - I - 0x009A9B 02:9A8B: 12        .byte $10 * $01 + $02   ; pos YX
- D 0 - I - 0x009A9C 02:9A8C: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009A9D 02:9A8D: 2A        .byte con_obj_id_2A   ; 

- D 0 - I - 0x009A9E 02:9A8E: 44        .byte $10 * $04 + $04   ; pos YX
- D 0 - I - 0x009A9F 02:9A8F: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AA0 02:9A90: 2A        .byte con_obj_id_2A   ; 

- D 0 - I - 0x009AA1 02:9A91: 46        .byte $10 * $04 + $06   ; pos YX
- D 0 - I - 0x009AA2 02:9A92: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x009AA3 02:9A93: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009AA4 02:9A94: 82        .byte $10 * $08 + $02   ; pos YX
- D 0 - I - 0x009AA5 02:9A95: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AA6 02:9A96: 2A        .byte con_obj_id_2A   ; 

- D 0 - I - 0x009AA7 02:9A97: A6        .byte $10 * $0A + $06   ; pos YX
- D 0 - I - 0x009AA8 02:9A98: 93        .byte $80 + $00 + $13   ; flags
- D 0 - I - 0x009AA9 02:9A99: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009AAA 02:9A9A: C4        .byte $10 * $0C + $04   ; pos YX
- D 0 - I - 0x009AAB 02:9A9B: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AAC 02:9A9C: 2A        .byte con_obj_id_2A   ; 

- D 0 - I - 0x009AAD 02:9A9D: C9        .byte $10 * $0C + $09   ; pos YX
- D 0 - I - 0x009AAE 02:9A9E: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009AAF 02:9A9F: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009AB0 02:9AA0: C3        .byte $10 * $0C + $03   ; pos YX
- D 0 - I - 0x009AB1 02:9AA1: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009AB2 02:9AA2: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009AB3 02:9AA3: FF        .byte $FF   ; end token



_off019_07_9AA4_32:
- D 0 - I - 0x009AB4 02:9AA4: 2D        .byte $10 * $02 + $0D   ; pos YX
- D 0 - I - 0x009AB5 02:9AA5: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009AB6 02:9AA6: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009AB7 02:9AA7: 22        .byte $10 * $02 + $02   ; pos YX
- D 0 - I - 0x009AB8 02:9AA8: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AB9 02:9AA9: 2A        .byte con_obj_id_2A   ; 

- D 0 - I - 0x009ABA 02:9AAA: 54        .byte $10 * $05 + $04   ; pos YX
- D 0 - I - 0x009ABB 02:9AAB: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009ABC 02:9AAC: 2A        .byte con_obj_id_2A   ; 

- D 0 - I - 0x009ABD 02:9AAD: 82        .byte $10 * $08 + $02   ; pos YX
- D 0 - I - 0x009ABE 02:9AAE: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009ABF 02:9AAF: 2A        .byte con_obj_id_2A   ; 

- D 0 - I - 0x009AC0 02:9AB0: B4        .byte $10 * $0B + $04   ; pos YX
- D 0 - I - 0x009AC1 02:9AB1: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AC2 02:9AB2: 2A        .byte con_obj_id_2A   ; 

- D 0 - I - 0x009AC3 02:9AB3: A5        .byte $10 * $0A + $05   ; pos YX
- D 0 - I - 0x009AC4 02:9AB4: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009AC5 02:9AB5: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009AC6 02:9AB6: FF        .byte $FF   ; end token



_off019_07_9AB7_33:
- D 0 - I - 0x009AC7 02:9AB7: 23        .byte $10 * $02 + $03   ; pos YX
- D 0 - I - 0x009AC8 02:9AB8: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009AC9 02:9AB9: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009ACA 02:9ABA: 29        .byte $10 * $02 + $09   ; pos YX
- D 0 - I - 0x009ACB 02:9ABB: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009ACC 02:9ABC: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009ACD 02:9ABD: 5B        .byte $10 * $05 + $0B   ; pos YX
- D 0 - I - 0x009ACE 02:9ABE: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x009ACF 02:9ABF: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009AD0 02:9AC0: 8B        .byte $10 * $08 + $0B   ; pos YX
- D 0 - I - 0x009AD1 02:9AC1: 94        .byte $80 + $00 + $14   ; flags
- D 0 - I - 0x009AD2 02:9AC2: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009AD3 02:9AC3: FF        .byte $FF   ; end token



_off019_07_9AC4_34:
- D 0 - I - 0x009AD4 02:9AC4: 2F        .byte $10 * $02 + $0F   ; pos YX
- D 0 - I - 0x009AD5 02:9AC5: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009AD6 02:9AC6: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009AD7 02:9AC7: 46        .byte $10 * $04 + $06   ; pos YX
- D 0 - I - 0x009AD8 02:9AC8: 91        .byte $80 + $00 + $11   ; flags
- D 0 - I - 0x009AD9 02:9AC9: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009ADA 02:9ACA: 83        .byte $10 * $08 + $03   ; pos YX
- D 0 - I - 0x009ADB 02:9ACB: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009ADC 02:9ACC: 45        .byte con_obj_id_45   ; 

- D 0 - I - 0x009ADD 02:9ACD: FF        .byte $FF   ; end token



_off019_07_9ACE_35:
- D 0 - I - 0x009ADE 02:9ACE: FF        .byte $FF   ; end token



_off019_07_9ACF_36:
- D 0 - I - 0x009ADF 02:9ACF: FF        .byte $FF   ; end token



_off019_07_9AD0_37:
- - - - - - 0x009AE0 02:9AD0: FF        .byte $FF   ; end token



_off019_07_9AD1_38:
- - - - - - 0x009AE1 02:9AD1: FF        .byte $FF   ; end token



_off019_07_9AD2_39:
- - - - - - 0x009AE2 02:9AD2: FF        .byte $FF   ; end token



_off019_07_9AD3_3A:
- - - - - - 0x009AE3 02:9AD3: FF        .byte $FF   ; end token



_off019_07_9AD4_3B:
- - - - - - 0x009AE4 02:9AD4: FF        .byte $FF   ; end token



_off019_07_9AD5_3C:
- - - - - - 0x009AE5 02:9AD5: FF        .byte $FF   ; end token



_off019_07_9AD6_3D:
- - - - - - 0x009AE6 02:9AD6: FF        .byte $FF   ; end token



_off019_07_9AD7_3E:
- - - - - - 0x009AE7 02:9AD7: FF        .byte $FF   ; end token



_off019_07_9AD8_3F:
- - - - - - 0x009AE8 02:9AD8: FF        .byte $FF   ; end token



loc_0x009AE9_sound_mode_handler:
C D 0 - - - 0x009AE9 02:9AD9: A5 50     LDA ram_sound_mode_handler
C - - - - - 0x009AEB 02:9ADB: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x009AEE 02:9ADE: E6 9A     .word ofs_sound_mode_9AE6_00_init
- D 0 - I - 0x009AF0 02:9AE0: FF 9A     .word ofs_sound_mode_9AFF_01_clear_title_screen
- D 0 - I - 0x009AF2 02:9AE2: 11 9B     .word ofs_sound_mode_9B11_02_draw_window
- D 0 - I - 0x009AF4 02:9AE4: 2A 9B     .word ofs_sound_mode_9B2A_03_menu_handler



ofs_sound_mode_9AE6_00_init:
C - - J - - 0x009AF6 02:9AE6: A0 18     LDY #$18
; clear 0050-0068
C - - - - - 0x009AF8 02:9AE8: A9 00     LDA #$00
bra_9AEA_loop:
C - - - - - 0x009AFA 02:9AEA: 99 50 00  STA $00 + $50,Y
C - - - - - 0x009AFD 02:9AED: 88        DEY
C - - - - - 0x009AFE 02:9AEE: 10 FA     BPL bra_9AEA_loop
C - - - - - 0x009B00 02:9AF0: A9 23     LDA #> $23A0
C - - - - - 0x009B02 02:9AF2: 85 57     STA ram_0057_plr
C - - - - - 0x009B04 02:9AF4: A9 A0     LDA #< $23A0
C - - - - - 0x009B06 02:9AF6: 85 56     STA ram_0055_plr + $01
C - - - - - 0x009B08 02:9AF8: A9 0D     LDA #$0D    ; clear lines counter
C - - - - - 0x009B0A 02:9AFA: 85 55     STA ram_0055_plr
C - - - - - 0x009B0C 02:9AFC: 4C 0E 9B  JMP loc_9B0E



ofs_sound_mode_9AFF_01_clear_title_screen:
C - - J - - 0x009B0F 02:9AFF: 20 48 9C  JSR sub_9C48
C - - - - - 0x009B12 02:9B02: C6 55     DEC ram_0055_plr
C - - - - - 0x009B14 02:9B04: 10 0A     BPL bra_9B10_RTS
; if all lines are cleared
C - - - - - 0x009B16 02:9B06: A9 00     LDA #$00
C - - - - - 0x009B18 02:9B08: 85 55     STA ram_0055_plr
C - - - - - 0x009B1A 02:9B0A: A9 04     LDA #$04    ; wait 4 frames before drawing window
C - - - - - 0x009B1C 02:9B0C: 85 52     STA ram_sound_mode_draw_cooldown
loc_9B0E:
C D 0 - - - 0x009B1E 02:9B0E: E6 50     INC ram_sound_mode_handler    ; 00 -> 01, 01 -> 02, 02 -> 03
bra_9B10_RTS:
C - - - - - 0x009B20 02:9B10: 60        RTS



ofs_sound_mode_9B11_02_draw_window:
C - - J - - 0x009B21 02:9B11: C6 52     DEC ram_sound_mode_draw_cooldown
C - - - - - 0x009B23 02:9B13: D0 FB     BNE bra_9B10_RTS
; if it's time to draw a window
C - - - - - 0x009B25 02:9B15: A9 01     LDA #$01
C - - - - - 0x009B27 02:9B17: 85 52     STA ram_sound_mode_draw_cooldown
C - - - - - 0x009B29 02:9B19: 20 78 9C  JSR sub_9C78_draw_sound_mode_window
C - - - - - 0x009B2C 02:9B1C: E6 55     INC ram_0055_plr
C - - - - - 0x009B2E 02:9B1E: A5 55     LDA ram_0055_plr
C - - - - - 0x009B30 02:9B20: C9 0E     CMP #$0E    ; window lines counter
C - - - - - 0x009B32 02:9B22: 90 EC     BCC bra_9B10_RTS
C - - - - - 0x009B34 02:9B24: 20 D9 9B  JSR sub_9BD9
C - - - - - 0x009B37 02:9B27: 4C 0E 9B  JMP loc_9B0E



ofs_sound_mode_9B2A_03_menu_handler:
C - - J - - 0x009B3A 02:9B2A: 20 08 9F  JSR sub_9F08
C - - - - - 0x009B3D 02:9B2D: 20 92 9B  JSR sub_9B92
C - - - - - 0x009B40 02:9B30: 20 50 9B  JSR sub_9B50
C - - - - - 0x009B43 02:9B33: A9 21     LDA #$21
C - - - - - 0x009B45 02:9B35: 8D 4E 05  STA ram_attr_spr_obj
C - - - - - 0x009B48 02:9B38: A9 B9     LDA #$B9
C - - - - - 0x009B4A 02:9B3A: 8D 00 05  STA ram_anim_id_obj
C - - - - - 0x009B4D 02:9B3D: A9 34     LDA #$34
C - - - - - 0x009B4F 02:9B3F: 8D 34 05  STA ram_pos_X_hi_obj
C - - - - - 0x009B52 02:9B42: A5 53     LDA ram_sound_mode_track_cur
C - - - - - 0x009B54 02:9B44: 38        SEC
C - - - - - 0x009B55 02:9B45: E5 54     SBC ram_sound_mode_track_min
C - - - - - 0x009B57 02:9B47: 0A        ASL
C - - - - - 0x009B58 02:9B48: 0A        ASL
C - - - - - 0x009B59 02:9B49: 0A        ASL
C - - - - - 0x009B5A 02:9B4A: 69 A7     ADC #$A7
C - - - - - 0x009B5C 02:9B4C: 8D 1A 05  STA ram_pos_Y_hi_obj
C - - - - - 0x009B5F 02:9B4F: 60        RTS



sub_9B50:
C - - - - - 0x009B60 02:9B50: A5 F5     LDA ram_copy_btn_press
C - - - - - 0x009B62 02:9B52: 10 06     BPL bra_9B5A    ; if not con_btn_A
C - - - - - 0x009B64 02:9B54: 20 51 9F  JSR sub_9F51
C - - - - - 0x009B67 02:9B57: 4C 0E FE  JMP loc_0x01FE1E_sprite_engine
bra_9B5A:
C - - - - - 0x009B6A 02:9B5A: 0A        ASL
C - - - - - 0x009B6B 02:9B5B: 30 01     BMI bra_9B5E
C - - - - - 0x009B6D 02:9B5D: 60        RTS
bra_9B5E:
C - - - - - 0x009B6E 02:9B5E: 20 51 9F  JSR sub_9F51
C - - - - - 0x009B71 02:9B61: A5 53     LDA ram_sound_mode_track_cur
C - - - - - 0x009B73 02:9B63: C9 26     CMP #$26
C - - - - - 0x009B75 02:9B65: F0 0F     BEQ bra_9B76_26
C - - - - - 0x009B77 02:9B67: C9 0E     CMP #$0E
C - - - - - 0x009B79 02:9B69: B0 03     BCS bra_9B6E
C - - - - - 0x009B7B 02:9B6B: 20 0E FE  JSR sub_0x01FE1E_sprite_engine
bra_9B6E:
C - - - - - 0x009B7E 02:9B6E: A4 53     LDY ram_sound_mode_track_cur
C - - - - - 0x009B80 02:9B70: B9 A4 9C  LDA tbl_9CA4_track_list,Y
C - - - - - 0x009B83 02:9B73: 4C DE FD  JMP loc_0x01FDEE_play_sound
bra_9B76_26:
; play all one by one
C - - - - - 0x009B86 02:9B76: 20 0E FE  JSR sub_0x01FE1E_sprite_engine
C - - - - - 0x009B89 02:9B79: AD 5E 9F  LDA tbl_9F5E_auto_playlist
C - - - - - 0x009B8C 02:9B7C: 85 5C     STA ram_005C
C - - - - - 0x009B8E 02:9B7E: AD 5F 9F  LDA tbl_9F5E_auto_playlist + $01
C - - - - - 0x009B91 02:9B81: 85 5D     STA ram_005D
; bzk optimize, doesn't look like data from tbl_9FB7 will be read
C - - - - - 0x009B93 02:9B83: AD 60 9F  LDA tbl_9F60
C - - - - - 0x009B96 02:9B86: 85 60     STA ram_0060
C - - - - - 0x009B98 02:9B88: AD 61 9F  LDA tbl_9F60 + $01
C - - - - - 0x009B9B 02:9B8B: 85 61     STA ram_0061
C - - - - - 0x009B9D 02:9B8D: A9 01     LDA #$01
C - - - - - 0x009B9F 02:9B8F: 85 59     STA ram_play_all
C - - - - - 0x009BA1 02:9B91: 60        RTS



sub_9B92:
C - - - - - 0x009BA2 02:9B92: A5 59     LDA ram_play_all
C - - - - - 0x009BA4 02:9B94: D0 31     BNE bra_9BC7_RTS
C - - - - - 0x009BA6 02:9B96: A5 F7     LDA ram_copy_btn_hold
C - - - - - 0x009BA8 02:9B98: 29 0C     AND #con_btns_UD
C - - - - - 0x009BAA 02:9B9A: F0 2B     BEQ bra_9BC7_RTS
C - - - - - 0x009BAC 02:9B9C: A0 04     LDY #$04
C - - - - - 0x009BAE 02:9B9E: C6 58     DEC ram_0057_plr + $01
C - - - - - 0x009BB0 02:9BA0: F0 08     BEQ bra_9BAA
C - - - - - 0x009BB2 02:9BA2: A5 F5     LDA ram_copy_btn_press
C - - - - - 0x009BB4 02:9BA4: 29 0C     AND #con_btns_UD
C - - - - - 0x009BB6 02:9BA6: F0 1F     BEQ bra_9BC7_RTS
C - - - - - 0x009BB8 02:9BA8: A0 20     LDY #$20
bra_9BAA:
C - - - - - 0x009BBA 02:9BAA: 84 58     STY ram_0057_plr + $01
C - - - - - 0x009BBC 02:9BAC: 4A        LSR
C - - - - - 0x009BBD 02:9BAD: 4A        LSR
C - - - - - 0x009BBE 02:9BAE: 4A        LSR
C - - - - - 0x009BBF 02:9BAF: 90 17     BCC bra_9BC8
C - - - - - 0x009BC1 02:9BB1: A5 53     LDA ram_sound_mode_track_cur
C - - - - - 0x009BC3 02:9BB3: C9 26     CMP #$26
C - - - - - 0x009BC5 02:9BB5: B0 10     BCS bra_9BC7_RTS
C - - - - - 0x009BC7 02:9BB7: E6 53     INC ram_sound_mode_track_cur
C - - - - - 0x009BC9 02:9BB9: A5 53     LDA ram_sound_mode_track_cur
C - - - - - 0x009BCB 02:9BBB: 38        SEC
C - - - - - 0x009BCC 02:9BBC: E5 54     SBC ram_sound_mode_track_min
C - - - - - 0x009BCE 02:9BBE: C9 07     CMP #$07
C - - - - - 0x009BD0 02:9BC0: 90 05     BCC bra_9BC7_RTS
C - - - - - 0x009BD2 02:9BC2: E6 54     INC ram_sound_mode_track_min
C - - - - - 0x009BD4 02:9BC4: 4C D9 9B  JMP loc_9BD9
bra_9BC7_RTS:
C - - - - - 0x009BD7 02:9BC7: 60        RTS
bra_9BC8:
C - - - - - 0x009BD8 02:9BC8: 4A        LSR
C - - - - - 0x009BD9 02:9BC9: 90 FC     BCC bra_9BC7_RTS
C - - - - - 0x009BDB 02:9BCB: A5 53     LDA ram_sound_mode_track_cur
C - - - - - 0x009BDD 02:9BCD: F0 F8     BEQ bra_9BC7_RTS
C - - - - - 0x009BDF 02:9BCF: C6 53     DEC ram_sound_mode_track_cur
C - - - - - 0x009BE1 02:9BD1: A5 53     LDA ram_sound_mode_track_cur
C - - - - - 0x009BE3 02:9BD3: C5 54     CMP ram_sound_mode_track_min
C - - - - - 0x009BE5 02:9BD5: B0 F0     BCS bra_9BC7_RTS
C - - - - - 0x009BE7 02:9BD7: C6 54     DEC ram_sound_mode_track_min
sub_9BD9:
loc_9BD9:
C D 0 - - - 0x009BE9 02:9BD9: A9 22     LDA #> $22A8
C - - - - - 0x009BEB 02:9BDB: 85 01     STA ram_0001
C - - - - - 0x009BED 02:9BDD: A9 A8     LDA #< $22A8
C - - - - - 0x009BEF 02:9BDF: 85 00     STA ram_0000
C - - - - - 0x009BF1 02:9BE1: A9 00     LDA #$00
C - - - - - 0x009BF3 02:9BE3: 85 09     STA ram_0009
C - - - - - 0x009BF5 02:9BE5: A5 54     LDA ram_sound_mode_track_min
C - - - - - 0x009BF7 02:9BE7: 0A        ASL
C - - - - - 0x009BF8 02:9BE8: 26 09     ROL ram_0009
C - - - - - 0x009BFA 02:9BEA: 0A        ASL
C - - - - - 0x009BFB 02:9BEB: 26 09     ROL ram_0009
C - - - - - 0x009BFD 02:9BED: 0A        ASL
C - - - - - 0x009BFE 02:9BEE: 26 09     ROL ram_0009
C - - - - - 0x009C00 02:9BF0: 6D CB 9C  ADC tbl_9CCB_track_names
C - - - - - 0x009C03 02:9BF3: 85 08     STA ram_0008
C - - - - - 0x009C05 02:9BF5: AD CC 9C  LDA tbl_9CCB_track_names + $01
C - - - - - 0x009C08 02:9BF8: 65 09     ADC ram_0009
C - - - - - 0x009C0A 02:9BFA: 85 09     STA ram_0009
C - - - - - 0x009C0C 02:9BFC: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x009C0E 02:9BFE: A9 06     LDA #con_buf_mode_06
C - - - - - 0x009C10 02:9C00: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C13 02:9C03: E8        INX
C - - - - - 0x009C14 02:9C04: A9 06     LDA #$06
C - - - - - 0x009C16 02:9C06: 85 0A     STA ram_000A
bra_9C08_loop:
C - - - - - 0x009C18 02:9C08: A0 00     LDY #$00
C - - - - - 0x009C1A 02:9C0A: A5 01     LDA ram_0001    ; ppu hi
C - - - - - 0x009C1C 02:9C0C: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C1F 02:9C0F: E8        INX
C - - - - - 0x009C20 02:9C10: A5 00     LDA ram_0000    ; ppu lo
C - - - - - 0x009C22 02:9C12: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C25 02:9C15: E8        INX
C - - - - - 0x009C26 02:9C16: A9 08     LDA #$08    ; counter
C - - - - - 0x009C28 02:9C18: 85 0B     STA ram_000B
C - - - - - 0x009C2A 02:9C1A: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C2D 02:9C1D: E8        INX
bra_9C1E_loop:
C - - - - - 0x009C2E 02:9C1E: B1 08     LDA (ram_0008),Y
C - - - - - 0x009C30 02:9C20: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C33 02:9C23: E8        INX
C - - - - - 0x009C34 02:9C24: C8        INY
C - - - - - 0x009C35 02:9C25: C6 0B     DEC ram_000B
C - - - - - 0x009C37 02:9C27: D0 F5     BNE bra_9C1E_loop
C - - - - - 0x009C39 02:9C29: A5 08     LDA ram_0008
C - - - - - 0x009C3B 02:9C2B: 18        CLC
C - - - - - 0x009C3C 02:9C2C: 69 08     ADC #$08
C - - - - - 0x009C3E 02:9C2E: 85 08     STA ram_0008
C - - - - - 0x009C40 02:9C30: 90 02     BCC bra_9C34
C - - - - - 0x009C42 02:9C32: E6 09     INC ram_0009
bra_9C34:
C - - - - - 0x009C44 02:9C34: A5 00     LDA ram_0000
C - - - - - 0x009C46 02:9C36: 18        CLC
C - - - - - 0x009C47 02:9C37: 69 20     ADC #$20
C - - - - - 0x009C49 02:9C39: 85 00     STA ram_0000
C - - - - - 0x009C4B 02:9C3B: 90 02     BCC bra_9C3F
C - - - - - 0x009C4D 02:9C3D: E6 01     INC ram_0001
bra_9C3F:
C - - - - - 0x009C4F 02:9C3F: C6 0A     DEC ram_000A
C - - - - - 0x009C51 02:9C41: 10 C5     BPL bra_9C08_loop
C - - - - - 0x009C53 02:9C43: A9 FF     LDA #$FF
C - - - - - 0x009C55 02:9C45: 4C 9D 9C  JMP loc_9C9D



sub_9C48:
C - - - - - 0x009C58 02:9C48: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x009C5A 02:9C4A: A9 03     LDA #con_buf_mode_03
C - - - - - 0x009C5C 02:9C4C: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C5F 02:9C4F: E8        INX
C - - - - - 0x009C60 02:9C50: A5 57     LDA ram_0057_plr    ; ppu hi
C - - - - - 0x009C62 02:9C52: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C65 02:9C55: E8        INX
C - - - - - 0x009C66 02:9C56: A5 56     LDA ram_0055_plr + $01    ; ppu lo
C - - - - - 0x009C68 02:9C58: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C6B 02:9C5B: E8        INX
C - - - - - 0x009C6C 02:9C5C: A9 20     LDA #$20    ; counter
C - - - - - 0x009C6E 02:9C5E: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C71 02:9C61: E8        INX
C - - - - - 0x009C72 02:9C62: A9 00     LDA #$00    ; tile
C - - - - - 0x009C74 02:9C64: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C77 02:9C67: E8        INX
C - - - - - 0x009C78 02:9C68: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x009C7A 02:9C6A: A5 56     LDA ram_0055_plr + $01
C - - - - - 0x009C7C 02:9C6C: 38        SEC
C - - - - - 0x009C7D 02:9C6D: E9 20     SBC #< $0020
C - - - - - 0x009C7F 02:9C6F: 85 56     STA ram_0055_plr + $01
C - - - - - 0x009C81 02:9C71: A5 57     LDA ram_0057_plr
C - - - - - 0x009C83 02:9C73: E9 00     SBC #> $0020
C - - - - - 0x009C85 02:9C75: 85 57     STA ram_0057_plr
C - - - - - 0x009C87 02:9C77: 60        RTS



sub_9C78_draw_sound_mode_window:
C - - - - - 0x009C88 02:9C78: A5 55     LDA ram_0055_plr    ; window line counter
C - - - - - 0x009C8A 02:9C7A: 0A        ASL
C - - - - - 0x009C8B 02:9C7B: A8        TAY
C - - - - - 0x009C8C 02:9C7C: B9 05 9E  LDA tbl_9E05_sound_mode_window,Y
C - - - - - 0x009C8F 02:9C7F: 85 08     STA ram_0008
C - - - - - 0x009C91 02:9C81: B9 06 9E  LDA tbl_9E05_sound_mode_window + $01,Y
C - - - - - 0x009C94 02:9C84: 85 09     STA ram_0009
C - - - - - 0x009C96 02:9C86: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x009C98 02:9C88: A9 06     LDA #con_buf_mode_06
C - - - - - 0x009C9A 02:9C8A: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C9D 02:9C8D: E8        INX
C - - - - - 0x009C9E 02:9C8E: A0 00     LDY #$00
bra_9C90_loop:
C - - - - - 0x009CA0 02:9C90: B1 08     LDA (ram_0008),Y
C - - - - - 0x009CA2 02:9C92: C9 FF     CMP #$FF
C - - - - - 0x009CA4 02:9C94: F0 07     BEQ bra_9C9D_FF
C - - - - - 0x009CA6 02:9C96: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009CA9 02:9C99: E8        INX
C - - - - - 0x009CAA 02:9C9A: C8        INY
C - - - - - 0x009CAB 02:9C9B: D0 F3     BNE bra_9C90_loop    ; jmp
bra_9C9D_FF:
loc_9C9D:
C D 0 - - - 0x009CAD 02:9C9D: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009CB0 02:9CA0: E8        INX
C - - - - - 0x009CB1 02:9CA1: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x009CB3 02:9CA3: 60        RTS



tbl_9CA4_track_list:
- D 0 - - - 0x009CB4 02:9CA4: 28        .byte con_sound_28   ; 00 BGM1
- D 0 - - - 0x009CB5 02:9CA5: 2B        .byte con_sound_2B   ; 01 BGM2
- D 0 - - - 0x009CB6 02:9CA6: 2A        .byte con_sound_2A   ; 02 BGM3
- D 0 - - - 0x009CB7 02:9CA7: 29        .byte con_sound_29   ; 03 BGM4
- D 0 - - - 0x009CB8 02:9CA8: 2C        .byte con_sound_2C   ; 04 BGM5
- D 0 - - - 0x009CB9 02:9CA9: 2D        .byte con_sound_2D   ; 05 BGM6
- D 0 - - - 0x009CBA 02:9CAA: 2F        .byte con_sound_2F   ; 06 BGM7
- D 0 - - - 0x009CBB 02:9CAB: 30        .byte con_sound_30   ; 07 GREAT
- D 0 - - - 0x009CBC 02:9CAC: 31        .byte con_sound_31   ; 08 BOSS BGM
- D 0 - - - 0x009CBD 02:9CAD: 32        .byte con_sound_32   ; 09 BOSS2BGM
- D 0 - - - 0x009CBE 02:9CAE: 33        .byte con_sound_33   ; 0A P CLEAR
- D 0 - - - 0x009CBF 02:9CAF: 34        .byte con_sound_34   ; 0B A CLEAR
- D 0 - - - 0x009CC0 02:9CB0: 35        .byte con_sound_35   ; 0C OVER
- D 0 - - - 0x009CC1 02:9CB1: 36        .byte con_sound_36   ; 0D ENDING
- D 0 - - - 0x009CC2 02:9CB2: 06        .byte con_sound_06   ; 0E SUTA
- D 0 - - - 0x009CC3 02:9CB3: 0A        .byte con_sound_0A   ; 0F THUNDER
- D 0 - - - 0x009CC4 02:9CB4: 0B        .byte con_sound_0B   ; 10 SHOT
- D 0 - - - 0x009CC5 02:9CB5: 0D        .byte con_sound_0D   ; 11 LASER
- D 0 - - - 0x009CC6 02:9CB6: 0E        .byte con_sound_0E   ; 12 SPREAD
- D 0 - - - 0x009CC7 02:9CB7: 0F        .byte con_sound_0F   ; 13 FIRE
- D 0 - - - 0x009CC8 02:9CB8: 10        .byte con_sound_10   ; 14 B SHOT
- D 0 - - - 0x009CC9 02:9CB9: 11        .byte con_sound_11   ; 15 T DAMEGE
- D 0 - - - 0x009CCA 02:9CBA: 12        .byte con_sound_12   ; 16 HARETSU
- D 0 - - - 0x009CCB 02:9CBB: 13        .byte con_sound_13   ; 17 T OUT
- D 0 - - - 0x009CCC 02:9CBC: 14        .byte con_sound_14   ; 18 Z OUT
- D 0 - - - 0x009CCD 02:9CBD: 15        .byte con_sound_15   ; 19 A OUT
- D 0 - - - 0x009CCE 02:9CBE: 16        .byte con_sound_16   ; 1A ROLL
- D 0 - - - 0x009CCF 02:9CBF: 18        .byte con_sound_18   ; 1B APPEAR
- D 0 - - - 0x009CD0 02:9CC0: 19        .byte con_sound_19   ; 1C POWER
- D 0 - - - 0x009CD1 02:9CC1: 1A        .byte con_sound_1A   ; 1D BOSS BK
- D 0 - - - 0x009CD2 02:9CC2: 1B        .byte con_sound_1B   ; 1E BAKUHA1
- D 0 - - - 0x009CD3 02:9CC3: 1C        .byte con_sound_1C   ; 1F BAKUHA2
- D 0 - - - 0x009CD4 02:9CC4: 1F        .byte con_sound_1F   ; 20 ARUKU
- D 0 - - - 0x009CD5 02:9CC5: 20        .byte con_sound_20   ; 21 JIWARE
- D 0 - - - 0x009CD6 02:9CC6: 21        .byte con_sound_21   ; 22 SILEN
- D 0 - - - 0x009CD7 02:9CC7: 23        .byte con_sound_23   ; 23 P 1UP
- D 0 - - - 0x009CD8 02:9CC8: 25        .byte con_sound_25   ; 24 P OUT
- D 0 - - - 0x009CD9 02:9CC9: 26        .byte con_sound_26   ; 25 B OUT
; bzk garbage
- - - - - - 0x009CDA 02:9CCA: FF        .byte $FF            ; 26 MELODEY



tbl_9CCB_track_names:
; bzk optimize
- D 0 - - - 0x009CDB 02:9CCB: CD 9C     .word tbl_9CCD_track_names



tbl_9CCD_track_names:
- D 0 - I - 0x009CDD 02:9CCD: 0C        .byte $0C, $11, $17, $02, $00, $00, $00, $00   ; 00 "BGM1    "
- D 0 - I - 0x009CE5 02:9CD5: 0C        .byte $0C, $11, $17, $03, $00, $00, $00, $00   ; 01 "BGM2    "
- D 0 - I - 0x009CED 02:9CDD: 0C        .byte $0C, $11, $17, $04, $00, $00, $00, $00   ; 02 "BGM3    "
- D 0 - I - 0x009CF5 02:9CE5: 0C        .byte $0C, $11, $17, $05, $00, $00, $00, $00   ; 03 "BGM4    "
- D 0 - I - 0x009CFD 02:9CED: 0C        .byte $0C, $11, $17, $06, $00, $00, $00, $00   ; 04 "BGM5    "
- D 0 - I - 0x009D05 02:9CF5: 0C        .byte $0C, $11, $17, $07, $00, $00, $00, $00   ; 05 "BGM6    "
- D 0 - I - 0x009D0D 02:9CFD: 0C        .byte $0C, $11, $17, $08, $00, $00, $00, $00   ; 06 "BGM7    "
- D 0 - I - 0x009D15 02:9D05: 11        .byte $11, $1C, $0F, $0B, $1E, $00, $00, $00   ; 07 "GREAT   "
- D 0 - I - 0x009D1D 02:9D0D: 0C        .byte $0C, $19, $1D, $1D, $00, $0C, $11, $17   ; 08 "BOSS BGM"
- D 0 - I - 0x009D25 02:9D15: 0C        .byte $0C, $19, $1D, $1D, $03, $0C, $11, $17   ; 09 "BOSS2BGM"
- D 0 - I - 0x009D2D 02:9D1D: 1A        .byte $1A, $00, $0D, $16, $0F, $0B, $1C, $00   ; 0A "P CLEAR "
- D 0 - I - 0x009D35 02:9D25: 0B        .byte $0B, $00, $0D, $16, $0F, $0B, $1C, $00   ; 0B "A CLEAR "
- D 0 - I - 0x009D3D 02:9D2D: 19        .byte $19, $20, $0F, $1C, $00, $00, $00, $00   ; 0C "OVER    "
- D 0 - I - 0x009D45 02:9D35: 0F        .byte $0F, $18, $0E, $13, $18, $11, $00, $00   ; 0D "ENDING  "
- D 0 - I - 0x009D4D 02:9D3D: 1D        .byte $1D, $1F, $1E, $0B, $00, $00, $00, $00   ; 0E "SUTA    "
- D 0 - I - 0x009D55 02:9D45: 1E        .byte $1E, $12, $1F, $18, $0E, $0F, $1C, $00   ; 0F "THUNDER "
- D 0 - I - 0x009D5D 02:9D4D: 1D        .byte $1D, $12, $19, $1E, $00, $00, $00, $00   ; 10 "SHOT    "
- D 0 - I - 0x009D65 02:9D55: 16        .byte $16, $0B, $1D, $0F, $1C, $00, $00, $00   ; 11 "LASER   "
- D 0 - I - 0x009D6D 02:9D5D: 1D        .byte $1D, $1A, $1C, $0F, $0B, $0E, $00, $00   ; 12 "SPREAD  "
- D 0 - I - 0x009D75 02:9D65: 10        .byte $10, $13, $1C, $0F, $00, $00, $00, $00   ; 13 "FIRE    "
- D 0 - I - 0x009D7D 02:9D6D: 0C        .byte $0C, $00, $1D, $12, $19, $1E, $00, $00   ; 14 "B SHOT  "
- D 0 - I - 0x009D85 02:9D75: 1E        .byte $1E, $00, $0E, $0B, $17, $0F, $11, $0F   ; 15 "T DAMEGE"
- D 0 - I - 0x009D8D 02:9D7D: 12        .byte $12, $0B, $1C, $0F, $1E, $1D, $1F, $00   ; 16 "HARETSU "
- D 0 - I - 0x009D95 02:9D85: 1E        .byte $1E, $00, $19, $1F, $1E, $00, $00, $00   ; 17 "T OUT   "
- D 0 - I - 0x009D9D 02:9D8D: 24        .byte $24, $00, $19, $1F, $1E, $00, $00, $00   ; 18 "Z OUT   "
- D 0 - I - 0x009DA5 02:9D95: 0B        .byte $0B, $00, $19, $1F, $1E, $00, $00, $00   ; 19 "A OUT   "
- D 0 - I - 0x009DAD 02:9D9D: 1C        .byte $1C, $19, $16, $16, $00, $00, $00, $00   ; 1A "ROLL    "
- D 0 - I - 0x009DB5 02:9DA5: 0B        .byte $0B, $1A, $1A, $0F, $0B, $1C, $00, $00   ; 1B "APPEAR  "
- D 0 - I - 0x009DBD 02:9DAD: 1A        .byte $1A, $19, $21, $0F, $1C, $00, $00, $00   ; 1C "POWER   "
- D 0 - I - 0x009DC5 02:9DB5: 0C        .byte $0C, $19, $1D, $1D, $00, $0C, $15, $00   ; 1D "BOSS BK "
- D 0 - I - 0x009DCD 02:9DBD: 0C        .byte $0C, $0B, $15, $1F, $12, $0B, $02, $00   ; 1E "BAKUHA1 "
- D 0 - I - 0x009DD5 02:9DC5: 0C        .byte $0C, $0B, $15, $1F, $12, $0B, $03, $00   ; 1F "BAKUHA2 "
- D 0 - I - 0x009DDD 02:9DCD: 0B        .byte $0B, $1C, $1F, $15, $1F, $00, $00, $00   ; 20 "ARUKU   "
- D 0 - I - 0x009DE5 02:9DD5: 14        .byte $14, $13, $21, $0B, $1C, $0F, $00, $00   ; 21 "JIWARE  "
- D 0 - I - 0x009DED 02:9DDD: 1D        .byte $1D, $13, $16, $0F, $18, $00, $00, $00   ; 22 "SILEN   "
- D 0 - I - 0x009DF5 02:9DE5: 1A        .byte $1A, $00, $02, $1F, $1A, $00, $00, $00   ; 23 "P 1UP   "
- D 0 - I - 0x009DFD 02:9DED: 1A        .byte $1A, $00, $19, $1F, $1E, $00, $00, $00   ; 24 "P OUT   "
- D 0 - I - 0x009E05 02:9DF5: 0C        .byte $0C, $00, $19, $1F, $1E, $00, $00, $00   ; 25 "B OUT   "
- D 0 - I - 0x009E0D 02:9DFD: 17        .byte $17, $0F, $0E, $19, $16, $0F, $23, $00   ; 26 "MEDOLEY "



tbl_9E05_sound_mode_window:
- D 0 - - - 0x009E15 02:9E05: 21 9E     .word _off011_9E21_00
- D 0 - - - 0x009E17 02:9E07: 45 9E     .word _off011_9E45_01
- D 0 - - - 0x009E19 02:9E09: 55 9E     .word _off011_9E55_02
- D 0 - - - 0x009E1B 02:9E0B: 65 9E     .word _off011_9E65_03
- D 0 - - - 0x009E1D 02:9E0D: 75 9E     .word _off011_9E75_04
- D 0 - - - 0x009E1F 02:9E0F: 7A 9E     .word _off011_9E7A_05
- D 0 - - - 0x009E21 02:9E11: 94 9E     .word _off011_9E94_06
- D 0 - - - 0x009E23 02:9E13: 9D 9E     .word _off011_9E9D_07
- D 0 - - - 0x009E25 02:9E15: AF 9E     .word _off011_9EAF_08
- D 0 - - - 0x009E27 02:9E17: BD 9E     .word _off011_9EBD_09
- D 0 - - - 0x009E29 02:9E19: C6 9E     .word _off011_9EC6_0A
- D 0 - - - 0x009E2B 02:9E1B: D8 9E     .word _off011_9ED8_0B
- D 0 - - - 0x009E2D 02:9E1D: E5 9E     .word _off011_9EE5_0C
- D 0 - - - 0x009E2F 02:9E1F: EE 9E     .word _off011_9EEE_0D



_off011_9E21_00:
- D 0 - I - 0x009E31 02:9E21: 23 E0     .dbyt $23E0 ; ppu address
- D 0 - I - 0x009E33 02:9E23: 20        .byte $20   ; counter
- D 0 - I - 0x009E34 02:9E24: 55        .byte $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55   ; 
- D 0 - I - 0x009E44 02:9E34: 55        .byte $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55, $55   ; 

- D 0 - I - 0x009E54 02:9E44: FF        .byte $FF   ; end token



_off011_9E45_01:
- D 0 - I - 0x009E55 02:9E45: 22 0A     .dbyt $220A ; ppu address
- D 0 - I - 0x009E57 02:9E47: 0C        .byte $0C   ; counter
- D 0 - I - 0x009E58 02:9E48: 28        .byte $28, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $29   ; 

- D 0 - I - 0x009E64 02:9E54: FF        .byte $FF   ; end token



_off011_9E55_02:
- D 0 - I - 0x009E65 02:9E55: 22 2A     .dbyt $222A ; ppu address
- D 0 - I - 0x009E67 02:9E57: 0C        .byte $0C   ; counter
- D 0 - I - 0x009E68 02:9E58: 2D        .byte $2D, $1D, $19, $1F, $18, $0E, $00, $17, $19, $0E, $0F, $2D   ; 

- D 0 - I - 0x009E74 02:9E64: FF        .byte $FF   ; end token



_off011_9E65_03:
- D 0 - I - 0x009E75 02:9E65: 22 4A     .dbyt $224A ; ppu address
- D 0 - I - 0x009E77 02:9E67: 0C        .byte $0C   ; counter
- D 0 - I - 0x009E78 02:9E68: 2A        .byte $2A, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2B   ; 

- D 0 - I - 0x009E84 02:9E74: FF        .byte $FF   ; end token



_off011_9E75_04:
- D 0 - I - 0x009E85 02:9E75: 22 6A     .dbyt $226A ; ppu address
- D 0 - I - 0x009E87 02:9E77: 01        .byte $01   ; counter
- D 0 - I - 0x009E88 02:9E78: 00        .byte $00   ; 

- D 0 - I - 0x009E89 02:9E79: FF        .byte $FF   ; end token



_off011_9E7A_05:
- D 0 - I - 0x009E8A 02:9E7A: 22 85     .dbyt $2285 ; ppu address
- D 0 - I - 0x009E8C 02:9E7C: 16        .byte $16   ; counter
- D 0 - I - 0x009E8D 02:9E7D: 28        .byte $28, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C   ; 
- D 0 - I - 0x009E9D 02:9E8D: 2C        .byte $2C, $2C, $2C, $2C, $2C, $29   ; 

- D 0 - I - 0x009EA3 02:9E93: FF        .byte $FF   ; end token



_off011_9E94_06:
- D 0 - I - 0x009EA4 02:9E94: 22 A5     .dbyt $22A5 ; ppu address
- D 0 - I - 0x009EA6 02:9E96: 01        .byte $01   ; counter
- D 0 - I - 0x009EA7 02:9E97: 2D        .byte $2D   ; 

- D 0 - I - 0x009EA8 02:9E98: 22 BA     .dbyt $22BA ; ppu address
- D 0 - I - 0x009EAA 02:9E9A: 01        .byte $01   ; counter
- D 0 - I - 0x009EAB 02:9E9B: 2D        .byte $2D   ; 

- D 0 - I - 0x009EAC 02:9E9C: FF        .byte $FF   ; end token



_off011_9E9D_07:
- D 0 - I - 0x009EAD 02:9E9D: 22 C5     .dbyt $22C5 ; ppu address
- D 0 - I - 0x009EAF 02:9E9F: 01        .byte $01   ; counter
- D 0 - I - 0x009EB0 02:9EA0: 2D        .byte $2D   ; 

- D 0 - I - 0x009EB1 02:9EA1: 22 D1     .dbyt $22D1 ; ppu address
- D 0 - I - 0x009EB3 02:9EA3: 0A        .byte $0A   ; counter
- D 0 - I - 0x009EB4 02:9EA4: 0C        .byte $0C, $25, $25, $25, $1D, $19, $1F, $18, $0E, $2D   ; "B***SOUND"

- D 0 - I - 0x009EBE 02:9EAE: FF        .byte $FF   ; end token



_off011_9EAF_08:
- D 0 - I - 0x009EBF 02:9EAF: 22 E5     .dbyt $22E5 ; ppu address
- D 0 - I - 0x009EC1 02:9EB1: 01        .byte $01   ; counter
- D 0 - I - 0x009EC2 02:9EB2: 2D        .byte $2D   ; 

- D 0 - I - 0x009EC3 02:9EB3: 22 F5     .dbyt $22F5 ; ppu address
- D 0 - I - 0x009EC5 02:9EB5: 06        .byte $06   ; counter
- D 0 - I - 0x009EC6 02:9EB6: 1D        .byte $1D, $1E, $0B, $1C, $1E, $2D   ; "START"

- D 0 - I - 0x009ECC 02:9EBC: FF        .byte $FF   ; end token



_off011_9EBD_09:
- D 0 - I - 0x009ECD 02:9EBD: 23 05     .dbyt $2305 ; ppu address
- D 0 - I - 0x009ECF 02:9EBF: 01        .byte $01   ; counter
- D 0 - I - 0x009ED0 02:9EC0: 2D        .byte $2D   ; 

- D 0 - I - 0x009ED1 02:9EC1: 23 1A     .dbyt $231A ; ppu address
- D 0 - I - 0x009ED3 02:9EC3: 01        .byte $01   ; counter
- D 0 - I - 0x009ED4 02:9EC4: 2D        .byte $2D   ; 

- D 0 - I - 0x009ED5 02:9EC5: FF        .byte $FF   ; end token



_off011_9EC6_0A:
- D 0 - I - 0x009ED6 02:9EC6: 23 25     .dbyt $2325 ; ppu address
- D 0 - I - 0x009ED8 02:9EC8: 01        .byte $01   ; counter
- D 0 - I - 0x009ED9 02:9EC9: 2D        .byte $2D   ; 

- D 0 - I - 0x009EDA 02:9ECA: 23 31     .dbyt $2331 ; ppu address
- D 0 - I - 0x009EDC 02:9ECC: 0A        .byte $0A   ; counter
- D 0 - I - 0x009EDD 02:9ECD: 0B        .byte $0B, $25, $25, $25, $1D, $19, $1F, $18, $0E, $2D   ; "A***SOUND"

- D 0 - I - 0x009EE7 02:9ED7: FF        .byte $FF   ; end token



_off011_9ED8_0B:
- D 0 - I - 0x009EE8 02:9ED8: 23 45     .dbyt $2345 ; ppu address
- D 0 - I - 0x009EEA 02:9EDA: 01        .byte $01   ; counter
- D 0 - I - 0x009EEB 02:9EDB: 2D        .byte $2D   ; 

- D 0 - I - 0x009EEC 02:9EDC: 23 56     .dbyt $2356 ; ppu address
- D 0 - I - 0x009EEE 02:9EDE: 05        .byte $05   ; counter
- D 0 - I - 0x009EEF 02:9EDF: 19        .byte $19, $10, $10, $00, $2D   ; "OFF"

- D 0 - I - 0x009EF4 02:9EE4: FF        .byte $FF   ; end token



_off011_9EE5_0C:
- D 0 - I - 0x009EF5 02:9EE5: 23 65     .dbyt $2365 ; ppu address
- D 0 - I - 0x009EF7 02:9EE7: 01        .byte $01   ; counter
- D 0 - I - 0x009EF8 02:9EE8: 2D        .byte $2D   ; 

- D 0 - I - 0x009EF9 02:9EE9: 23 7A     .dbyt $237A ; ppu address
- D 0 - I - 0x009EFB 02:9EEB: 01        .byte $01   ; counter
- D 0 - I - 0x009EFC 02:9EEC: 2D        .byte $2D   ; 

- D 0 - I - 0x009EFD 02:9EED: FF        .byte $FF   ; end token



_off011_9EEE_0D:
- D 0 - I - 0x009EFE 02:9EEE: 23 85     .dbyt $2385 ; ppu address
- D 0 - I - 0x009F00 02:9EF0: 16        .byte $16   ; counter
- D 0 - I - 0x009F01 02:9EF1: 2A        .byte $2A, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C   ; 
- D 0 - I - 0x009F11 02:9F01: 2C        .byte $2C, $2C, $2C, $2C, $2C, $2B   ; 

- D 0 - I - 0x009F17 02:9F07: FF        .byte $FF   ; end token



sub_9F08:
C - - - - - 0x009F18 02:9F08: A5 59     LDA ram_play_all
C - - - - - 0x009F1A 02:9F0A: F0 03     BEQ bra_9F0F_RTS
C - - - - - 0x009F1C 02:9F0C: 20 10 9F  JSR sub_9F10
bra_9F0F_RTS:
C - - - - - 0x009F1F 02:9F0F: 60        RTS



sub_9F10:
C - - - - - 0x009F20 02:9F10: A5 5A     LDA ram_005A
C - - - - - 0x009F22 02:9F12: 05 5B     ORA ram_005B
C - - - - - 0x009F24 02:9F14: F0 07     BEQ bra_9F1D
C - - - - - 0x009F26 02:9F16: C6 5A     DEC ram_005A
C - - - - - 0x009F28 02:9F18: D0 02     BNE bra_9F1C_RTS
C - - - - - 0x009F2A 02:9F1A: C6 5B     DEC ram_005B
bra_9F1C_RTS:
C - - - - - 0x009F2C 02:9F1C: 60        RTS
bra_9F1D:
C - - - - - 0x009F2D 02:9F1D: A0 00     LDY #$00
C - - - - - 0x009F2F 02:9F1F: B1 5C     LDA (ram_005C),Y
C - - - - - 0x009F31 02:9F21: C9 FF     CMP #$FF
C - - - - - 0x009F33 02:9F23: F0 2C     BEQ bra_9F51_FF
C - - - - - 0x009F35 02:9F25: 85 09     STA ram_0009
; bzk optimize, no bytes >= 40 in there (except FF)
C - - - - - 0x009F37 02:9F27: 29 3F     AND #$3F
C - - - - - 0x009F39 02:9F29: 85 5B     STA ram_005B
C - - - - - 0x009F3B 02:9F2B: C8        INY
C - - - - - 0x009F3C 02:9F2C: B1 5C     LDA (ram_005C),Y
C - - - - - 0x009F3E 02:9F2E: 85 5A     STA ram_005A
C - - - - - 0x009F40 02:9F30: C8        INY
C - - - - - 0x009F41 02:9F31: B1 5C     LDA (ram_005C),Y
C - - - - - 0x009F43 02:9F33: 85 08     STA ram_0008
C - - - - - 0x009F45 02:9F35: A5 09     LDA ram_0009
C - - - - - 0x009F47 02:9F37: 0A        ASL
; bzk optimize, no bytes >= 80 in there
C - - - - - 0x009F48 02:9F38: 30 03     BMI bra_9F3D
C - - - - - 0x009F4A 02:9F3A: 20 0E FE  JSR sub_0x01FE1E_sprite_engine
bra_9F3D:
C - - - - - 0x009F4D 02:9F3D: A5 08     LDA ram_0008
C - - - - - 0x009F4F 02:9F3F: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x009F52 02:9F42: 4C 45 9F  JMP loc_9F45



loc_9F45:
C D 0 - - - 0x009F55 02:9F45: A5 5C     LDA ram_005C
C - - - - - 0x009F57 02:9F47: 18        CLC
C - - - - - 0x009F58 02:9F48: 69 03     ADC #$03
C - - - - - 0x009F5A 02:9F4A: 85 5C     STA ram_005C
C - - - - - 0x009F5C 02:9F4C: 90 02     BCC bra_9F50_RTS
- - - - - - 0x009F5E 02:9F4E: E6 5D     INC ram_005D
bra_9F50_RTS:
C - - - - - 0x009F60 02:9F50: 60        RTS
bra_9F51_FF:
sub_9F51:
C - - - - - 0x009F61 02:9F51: A9 00     LDA #$00
C - - - - - 0x009F63 02:9F53: 85 59     STA ram_play_all
C - - - - - 0x009F65 02:9F55: 85 5A     STA ram_005A
C - - - - - 0x009F67 02:9F57: 85 5B     STA ram_005B
C - - - - - 0x009F69 02:9F59: 85 5E     STA ram_005E
C - - - - - 0x009F6B 02:9F5B: 85 5F     STA ram_005F
C - - - - - 0x009F6D 02:9F5D: 60        RTS



tbl_9F5E_auto_playlist:
; bzk optimize
- D 0 - - - 0x009F6E 02:9F5E: 62 9F     .word tbl_9F62_auto_playlist



tbl_9F60:
; bzk optimize
- D 0 - - - 0x009F70 02:9F60: B7 9F     .word tbl_9FB7



tbl_9F62_auto_playlist:
; ???
- D 0 - I - 0x009F72 02:9F62: 0E        .byte $0E   ; 
- D 0 - I - 0x009F73 02:9F63: 5C        .byte $5C   ; 
- D 0 - I - 0x009F74 02:9F64: 28        .byte con_obj_id_28   ; 

- D 0 - I - 0x009F75 02:9F65: 0D        .byte $0D   ; 
- D 0 - I - 0x009F76 02:9F66: E4        .byte $E4   ; 
- D 0 - I - 0x009F77 02:9F67: 30        .byte con_obj_id_30   ; 

- D 0 - I - 0x009F78 02:9F68: 02        .byte $02   ; 
- D 0 - I - 0x009F79 02:9F69: 01        .byte $01   ; 
- D 0 - I - 0x009F7A 02:9F6A: 33        .byte con_obj_id_33   ; 

- D 0 - I - 0x009F7B 02:9F6B: 09        .byte $09   ; 
- D 0 - I - 0x009F7C 02:9F6C: 34        .byte $34   ; 
- D 0 - I - 0x009F7D 02:9F6D: 2B        .byte con_obj_id_2B   ; 

- D 0 - I - 0x009F7E 02:9F6E: 06        .byte $06   ; 
- D 0 - I - 0x009F7F 02:9F6F: DC        .byte $DC   ; 
- D 0 - I - 0x009F80 02:9F70: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009F81 02:9F71: 02        .byte $02   ; 
- D 0 - I - 0x009F82 02:9F72: 01        .byte $01   ; 
- D 0 - I - 0x009F83 02:9F73: 33        .byte con_obj_id_33   ; 

- D 0 - I - 0x009F84 02:9F74: 0C        .byte $0C   ; 
- D 0 - I - 0x009F85 02:9F75: 40        .byte $40   ; 
- D 0 - I - 0x009F86 02:9F76: 2A        .byte con_obj_id_2A   ; 

- D 0 - I - 0x009F87 02:9F77: 08        .byte $08   ; 
- D 0 - I - 0x009F88 02:9F78: 08        .byte $08   ; 
- D 0 - I - 0x009F89 02:9F79: 32        .byte con_obj_id_32   ; 

- D 0 - I - 0x009F8A 02:9F7A: 06        .byte $06   ; 
- D 0 - I - 0x009F8B 02:9F7B: DC        .byte $DC   ; 
- D 0 - I - 0x009F8C 02:9F7C: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009F8D 02:9F7D: 02        .byte $02   ; 
- D 0 - I - 0x009F8E 02:9F7E: 01        .byte $01   ; 
- D 0 - I - 0x009F8F 02:9F7F: 33        .byte con_obj_id_33   ; 

- D 0 - I - 0x009F90 02:9F80: 0C        .byte $0C   ; 
- D 0 - I - 0x009F91 02:9F81: B8        .byte $B8   ; 
- D 0 - I - 0x009F92 02:9F82: 29        .byte con_obj_id_29   ; 

- D 0 - I - 0x009F93 02:9F83: 06        .byte $06   ; 
- D 0 - I - 0x009F94 02:9F84: DC        .byte $DC   ; 
- D 0 - I - 0x009F95 02:9F85: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009F96 02:9F86: 02        .byte $02   ; 
- D 0 - I - 0x009F97 02:9F87: 01        .byte $01   ; 
- D 0 - I - 0x009F98 02:9F88: 33        .byte con_obj_id_33   ; 

- D 0 - I - 0x009F99 02:9F89: 09        .byte $09   ; 
- D 0 - I - 0x009F9A 02:9F8A: 34        .byte $34   ; 
- D 0 - I - 0x009F9B 02:9F8B: 2C        .byte con_obj_id_2C   ; 

- D 0 - I - 0x009F9C 02:9F8C: 06        .byte $06   ; 
- D 0 - I - 0x009F9D 02:9F8D: DC        .byte $DC   ; 
- D 0 - I - 0x009F9E 02:9F8E: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009F9F 02:9F8F: 02        .byte $02   ; 
- D 0 - I - 0x009FA0 02:9F90: 01        .byte $01   ; 
- D 0 - I - 0x009FA1 02:9F91: 33        .byte con_obj_id_33   ; 

- D 0 - I - 0x009FA2 02:9F92: 09        .byte $09   ; 
- D 0 - I - 0x009FA3 02:9F93: AC        .byte $AC   ; 
- D 0 - I - 0x009FA4 02:9F94: 2D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x009FA5 02:9F95: 08        .byte $08   ; 
- D 0 - I - 0x009FA6 02:9F96: 08        .byte $08   ; 
- D 0 - I - 0x009FA7 02:9F97: 32        .byte con_obj_id_32   ; 

- D 0 - I - 0x009FA8 02:9F98: 0D        .byte $0D   ; 
- D 0 - I - 0x009FA9 02:9F99: E4        .byte $E4   ; 
- D 0 - I - 0x009FAA 02:9F9A: 30        .byte con_obj_id_30   ; 

- D 0 - I - 0x009FAB 02:9F9B: 02        .byte $02   ; 
- D 0 - I - 0x009FAC 02:9F9C: 01        .byte $01   ; 
- D 0 - I - 0x009FAD 02:9F9D: 33        .byte con_obj_id_33   ; 

- D 0 - I - 0x009FAE 02:9F9E: 0C        .byte $0C   ; 
- D 0 - I - 0x009FAF 02:9F9F: B8        .byte $B8   ; 
- D 0 - I - 0x009FB0 02:9FA0: 2E        .byte con_obj_id_2E   ; 

- D 0 - I - 0x009FB1 02:9FA1: 06        .byte $06   ; 
- D 0 - I - 0x009FB2 02:9FA2: DC        .byte $DC   ; 
- D 0 - I - 0x009FB3 02:9FA3: 31        .byte con_obj_id_31   ; 

- D 0 - I - 0x009FB4 02:9FA4: 02        .byte $02   ; 
- D 0 - I - 0x009FB5 02:9FA5: 01        .byte $01   ; 
- D 0 - I - 0x009FB6 02:9FA6: 33        .byte con_obj_id_33   ; 

- D 0 - I - 0x009FB7 02:9FA7: 0F        .byte $0F   ; 
- D 0 - I - 0x009FB8 02:9FA8: 10        .byte $10   ; 
- D 0 - I - 0x009FB9 02:9FA9: 2F        .byte con_obj_id_2F   ; 

- D 0 - I - 0x009FBA 02:9FAA: 0D        .byte $0D   ; 
- D 0 - I - 0x009FBB 02:9FAB: E4        .byte $E4   ; 
- D 0 - I - 0x009FBC 02:9FAC: 30        .byte con_obj_id_30   ; 

- D 0 - I - 0x009FBD 02:9FAD: 02        .byte $02   ; 
- D 0 - I - 0x009FBE 02:9FAE: 68        .byte $68   ; 
- D 0 - I - 0x009FBF 02:9FAF: 34        .byte con_obj_id_34   ; 

- D 0 - I - 0x009FC0 02:9FB0: 0C        .byte $0C   ; 
- D 0 - I - 0x009FC1 02:9FB1: 62        .byte $62   ; 
- D 0 - I - 0x009FC2 02:9FB2: 36        .byte con_obj_id_36   ; 

- D 0 - I - 0x009FC3 02:9FB3: 01        .byte $01   ; 
- D 0 - I - 0x009FC4 02:9FB4: F0        .byte $F0   ; 
- D 0 - I - 0x009FC5 02:9FB5: 35        .byte con_obj_id_35   ; 

- D 0 - I - 0x009FC6 02:9FB6: FF        .byte $FF   ; end token



tbl_9FB7:
- - - - - - 0x009FC7 02:9FB7: FF        .byte $FF   ; 



_off004_0x009FC8_00_area_1:
- D 0 - I - 0x009FC8 02:9FB8: 0E        .byte $0E   ; config
- D 0 - I - 0x009FC9 02:9FB9: 04        .byte $04   ; config

- - - - - - 0x009FCA 02:9FBA: 00        .byte $00   ; 
- - - - - - 0x009FCB 02:9FBB: 00        .byte $00   ; 
- - - - - - 0x009FCC 02:9FBC: 00        .byte $00   ; 
- - - - - - 0x009FCD 02:9FBD: 00        .byte $00   ; 
- - - - - - 0x009FCE 02:9FBE: 00        .byte $00   ; 
- - - - - - 0x009FCF 02:9FBF: 00        .byte $00   ; 
- - - - - - 0x009FD0 02:9FC0: 00        .byte $00   ; 
- - - - - - 0x009FD1 02:9FC1: 00        .byte $00   ; 
- - - - - - 0x009FD2 02:9FC2: 00        .byte $00   ; 
- - - - - - 0x009FD3 02:9FC3: 00        .byte $00   ; 
- D 0 - I - 0x009FD4 02:9FC4: 00        .byte $00   ; 
- D 0 - I - 0x009FD5 02:9FC5: 00        .byte $00   ; 
- D 0 - I - 0x009FD6 02:9FC6: 00        .byte $00   ; 
- D 0 - I - 0x009FD7 02:9FC7: 00        .byte $00   ; 
- D 0 - I - 0x009FD8 02:9FC8: 00        .byte $00   ; 
- - - - - - 0x009FD9 02:9FC9: 00        .byte $00   ; 
- - - - - - 0x009FDA 02:9FCA: 00        .byte $00   ; 
- - - - - - 0x009FDB 02:9FCB: 00        .byte $00   ; 
- - - - - - 0x009FDC 02:9FCC: 00        .byte $00   ; 
- D 0 - I - 0x009FDD 02:9FCD: 00        .byte $00   ; 
- D 0 - I - 0x009FDE 02:9FCE: 00        .byte $00   ; 
- D 0 - I - 0x009FDF 02:9FCF: 09        .byte $09   ; 
- D 0 - I - 0x009FE0 02:9FD0: 0A        .byte $0A   ; 
- D 0 - I - 0x009FE1 02:9FD1: 0E        .byte $0E   ; 
- D 0 - I - 0x009FE2 02:9FD2: 0B        .byte $0B   ; 
- D 0 - I - 0x009FE3 02:9FD3: 0F        .byte $0F   ; 
- D 0 - I - 0x009FE4 02:9FD4: 10        .byte $10   ; 
- D 0 - I - 0x009FE5 02:9FD5: 11        .byte $11   ; 
- D 0 - I - 0x009FE6 02:9FD6: 01        .byte $01   ; 
- D 0 - I - 0x009FE7 02:9FD7: 12        .byte $12   ; 
- D 0 - I - 0x009FE8 02:9FD8: 00        .byte $00   ; 
- D 0 - I - 0x009FE9 02:9FD9: 09        .byte $09   ; 
- D 0 - I - 0x009FEA 02:9FDA: 0A        .byte $0A   ; 
- D 0 - I - 0x009FEB 02:9FDB: 0B        .byte $0B   ; 
- D 0 - I - 0x009FEC 02:9FDC: 0C        .byte $0C   ; 
- D 0 - I - 0x009FED 02:9FDD: 05        .byte $05   ; 
- D 0 - I - 0x009FEE 02:9FDE: 06        .byte $06   ; 
- D 0 - I - 0x009FEF 02:9FDF: 0D        .byte $0D   ; 
- D 0 - I - 0x009FF0 02:9FE0: 07        .byte $07   ; 
- D 0 - I - 0x009FF1 02:9FE1: 08        .byte $08   ; 
- - - - - - 0x009FF2 02:9FE2: 00        .byte $00   ; 
- - - - - - 0x009FF3 02:9FE3: 00        .byte $00   ; 
- D 0 - I - 0x009FF4 02:9FE4: 02        .byte $02   ; 
- D 0 - I - 0x009FF5 02:9FE5: 03        .byte $03   ; 
- D 0 - I - 0x009FF6 02:9FE6: 04        .byte $04   ; 
- D 0 - I - 0x009FF7 02:9FE7: 05        .byte $05   ; 
- D 0 - I - 0x009FF8 02:9FE8: 06        .byte $06   ; 
- D 0 - I - 0x009FF9 02:9FE9: 07        .byte $07   ; 
- D 0 - I - 0x009FFA 02:9FEA: 08        .byte $08   ; 
- - - - - - 0x009FFB 02:9FEB: 00        .byte $00   ; 
- - - - - - 0x009FFC 02:9FEC: 00        .byte $00   ; 
- - - - - - 0x009FFD 02:9FED: 00        .byte $00   ; 
- - - - - - 0x009FFE 02:9FEE: 00        .byte $00   ; 
- - - - - - 0x009FFF 02:9FEF: 00        .byte $00   ; 
- - - - - - 0x00A000 02:9FF0: 00        .byte $00   ; 
- - - - - - 0x00A001 02:9FF1: 00        .byte $00   ; 



_off005_0x00A002_00_area_1:
- D 0 - I - 0x00A002 02:9FF2: 18 A0     .word _off018_00_A018_00
- D 0 - I - 0x00A004 02:9FF4: 58 A0     .word _off018_00_A058_01
- D 0 - I - 0x00A006 02:9FF6: 98 A0     .word _off018_00_A098_02
- D 0 - I - 0x00A008 02:9FF8: D8 A0     .word _off018_00_A0D8_03
- D 0 - I - 0x00A00A 02:9FFA: 18 A1     .word _off018_00_A118_04
- D 0 - I - 0x00A00C 02:9FFC: 58 A1     .word _off018_00_A158_05
- D 0 - I - 0x00A00E 02:9FFE: 98 A1     .word _off018_00_A198_06
- D 1 - I - 0x00A010 02:A000: D8 A1     .word _off018_00_A1D8_07
- D 1 - I - 0x00A012 02:A002: 18 A2     .word _off018_00_A218_08
- D 1 - I - 0x00A014 02:A004: 58 A2     .word _off018_00_A258_09
- D 1 - I - 0x00A016 02:A006: 98 A2     .word _off018_00_A298_0A
- D 1 - I - 0x00A018 02:A008: D8 A2     .word _off018_00_A2D8_0B
- D 1 - I - 0x00A01A 02:A00A: 18 A3     .word _off018_00_A318_0C
- D 1 - I - 0x00A01C 02:A00C: 58 A3     .word _off018_00_A358_0D
- D 1 - I - 0x00A01E 02:A00E: 98 A3     .word _off018_00_A398_0E
- D 1 - I - 0x00A020 02:A010: D8 A3     .word _off018_00_A3D8_0F
- D 1 - I - 0x00A022 02:A012: 18 A4     .word _off018_00_A418_10
- D 1 - I - 0x00A024 02:A014: 58 A4     .word _off018_00_A458_11
- D 1 - I - 0x00A026 02:A016: 98 A4     .word _off018_00_A498_12



_off018_00_A018_00:
- - - - - - 0x00A028 02:A018: 00        .byte $00   ; 
- - - - - - 0x00A029 02:A019: 00        .byte $00   ; 
- - - - - - 0x00A02A 02:A01A: 00        .byte $00   ; 
- - - - - - 0x00A02B 02:A01B: 00        .byte $00   ; 
- - - - - - 0x00A02C 02:A01C: 00        .byte $00   ; 
- - - - - - 0x00A02D 02:A01D: 00        .byte $00   ; 
- - - - - - 0x00A02E 02:A01E: 00        .byte $00   ; 
- - - - - - 0x00A02F 02:A01F: 00        .byte $00   ; 
- - - - - - 0x00A030 02:A020: 00        .byte $00   ; 
- - - - - - 0x00A031 02:A021: 00        .byte $00   ; 
- - - - - - 0x00A032 02:A022: 00        .byte $00   ; 
- - - - - - 0x00A033 02:A023: 00        .byte $00   ; 
- - - - - - 0x00A034 02:A024: 00        .byte $00   ; 
- - - - - - 0x00A035 02:A025: 00        .byte $00   ; 
- - - - - - 0x00A036 02:A026: 00        .byte $00   ; 
- - - - - - 0x00A037 02:A027: 00        .byte $00   ; 
- - - - - - 0x00A038 02:A028: 00        .byte $00   ; 
- - - - - - 0x00A039 02:A029: 00        .byte $00   ; 
- - - - - - 0x00A03A 02:A02A: 00        .byte $00   ; 
- - - - - - 0x00A03B 02:A02B: 00        .byte $00   ; 
- - - - - - 0x00A03C 02:A02C: 00        .byte $00   ; 
- - - - - - 0x00A03D 02:A02D: 00        .byte $00   ; 
- - - - - - 0x00A03E 02:A02E: 00        .byte $00   ; 
- - - - - - 0x00A03F 02:A02F: 00        .byte $00   ; 
- - - - - - 0x00A040 02:A030: 00        .byte $00   ; 
- - - - - - 0x00A041 02:A031: 00        .byte $00   ; 
- - - - - - 0x00A042 02:A032: 00        .byte $00   ; 
- - - - - - 0x00A043 02:A033: 00        .byte $00   ; 
- - - - - - 0x00A044 02:A034: 00        .byte $00   ; 
- - - - - - 0x00A045 02:A035: 00        .byte $00   ; 
- - - - - - 0x00A046 02:A036: 00        .byte $00   ; 
- - - - - - 0x00A047 02:A037: 00        .byte $00   ; 
- - - - - - 0x00A048 02:A038: 00        .byte $00   ; 
- - - - - - 0x00A049 02:A039: 00        .byte $00   ; 
- - - - - - 0x00A04A 02:A03A: 00        .byte $00   ; 
- - - - - - 0x00A04B 02:A03B: 00        .byte $00   ; 
- - - - - - 0x00A04C 02:A03C: 00        .byte $00   ; 
- - - - - - 0x00A04D 02:A03D: 00        .byte $00   ; 
- - - - - - 0x00A04E 02:A03E: 00        .byte $00   ; 
- - - - - - 0x00A04F 02:A03F: 00        .byte $00   ; 
- - - - - - 0x00A050 02:A040: 00        .byte $00   ; 
- - - - - - 0x00A051 02:A041: 00        .byte $00   ; 
- - - - - - 0x00A052 02:A042: 00        .byte $00   ; 
- - - - - - 0x00A053 02:A043: 00        .byte $00   ; 
- - - - - - 0x00A054 02:A044: 00        .byte $00   ; 
- - - - - - 0x00A055 02:A045: 00        .byte $00   ; 
- - - - - - 0x00A056 02:A046: 00        .byte $00   ; 
- - - - - - 0x00A057 02:A047: 00        .byte $00   ; 
- - - - - - 0x00A058 02:A048: 00        .byte $00   ; 
- - - - - - 0x00A059 02:A049: 00        .byte $00   ; 
- - - - - - 0x00A05A 02:A04A: 00        .byte $00   ; 
- - - - - - 0x00A05B 02:A04B: 00        .byte $00   ; 
- - - - - - 0x00A05C 02:A04C: 00        .byte $00   ; 
- - - - - - 0x00A05D 02:A04D: 00        .byte $00   ; 
- - - - - - 0x00A05E 02:A04E: 00        .byte $00   ; 
- D 1 - I - 0x00A05F 02:A04F: 00        .byte $00   ; 
- D 1 - I - 0x00A060 02:A050: 00        .byte $00   ; 
- D 1 - I - 0x00A061 02:A051: 00        .byte $00   ; 
- D 1 - I - 0x00A062 02:A052: 00        .byte $00   ; 
- D 1 - I - 0x00A063 02:A053: 00        .byte $00   ; 
- D 1 - I - 0x00A064 02:A054: 00        .byte $00   ; 
- D 1 - I - 0x00A065 02:A055: 00        .byte $00   ; 
- D 1 - I - 0x00A066 02:A056: 00        .byte $00   ; 
- D 1 - I - 0x00A067 02:A057: 00        .byte $00   ; 



_off018_00_A058_01:
- D 1 - I - 0x00A068 02:A058: 00        .byte $00   ; 
- D 1 - I - 0x00A069 02:A059: 00        .byte $00   ; 
- D 1 - I - 0x00A06A 02:A05A: 00        .byte $00   ; 
- D 1 - I - 0x00A06B 02:A05B: 00        .byte $00   ; 
- D 1 - I - 0x00A06C 02:A05C: 00        .byte $00   ; 
- D 1 - I - 0x00A06D 02:A05D: 00        .byte $00   ; 
- D 1 - I - 0x00A06E 02:A05E: 00        .byte $00   ; 
- D 1 - I - 0x00A06F 02:A05F: 00        .byte $00   ; 
- D 1 - I - 0x00A070 02:A060: 40        .byte $40   ; 
- D 1 - I - 0x00A071 02:A061: 41        .byte $41   ; 
- D 1 - I - 0x00A072 02:A062: 42        .byte $42   ; 
- D 1 - I - 0x00A073 02:A063: 43        .byte $43   ; 
- D 1 - I - 0x00A074 02:A064: 50        .byte $50   ; 
- D 1 - I - 0x00A075 02:A065: 51        .byte $51   ; 
- D 1 - I - 0x00A076 02:A066: 52        .byte $52   ; 
- D 1 - I - 0x00A077 02:A067: 53        .byte $53   ; 
- D 1 - I - 0x00A078 02:A068: 44        .byte $44   ; 
- D 1 - I - 0x00A079 02:A069: 45        .byte $45   ; 
- D 1 - I - 0x00A07A 02:A06A: 46        .byte $46   ; 
- D 1 - I - 0x00A07B 02:A06B: 47        .byte $47   ; 
- D 1 - I - 0x00A07C 02:A06C: 54        .byte $54   ; 
- D 1 - I - 0x00A07D 02:A06D: 55        .byte $55   ; 
- D 1 - I - 0x00A07E 02:A06E: 44        .byte $44   ; 
- D 1 - I - 0x00A07F 02:A06F: 00        .byte $00   ; 
- D 1 - I - 0x00A080 02:A070: 48        .byte $48   ; 
- D 1 - I - 0x00A081 02:A071: 49        .byte $49   ; 
- D 1 - I - 0x00A082 02:A072: 4A        .byte $4A   ; 
- D 1 - I - 0x00A083 02:A073: 4B        .byte $4B   ; 
- D 1 - I - 0x00A084 02:A074: 58        .byte $58   ; 
- D 1 - I - 0x00A085 02:A075: 40        .byte $40   ; 
- D 1 - I - 0x00A086 02:A076: 48        .byte $48   ; 
- D 1 - I - 0x00A087 02:A077: 5B        .byte $5B   ; 
- D 1 - I - 0x00A088 02:A078: 00        .byte $00   ; 
- D 1 - I - 0x00A089 02:A079: 00        .byte $00   ; 
- D 1 - I - 0x00A08A 02:A07A: 4E        .byte $4E   ; 
- D 1 - I - 0x00A08B 02:A07B: 4F        .byte $4F   ; 
- D 1 - I - 0x00A08C 02:A07C: 5C        .byte $5C   ; 
- D 1 - I - 0x00A08D 02:A07D: 5D        .byte $5D   ; 
- D 1 - I - 0x00A08E 02:A07E: 5E        .byte $5E   ; 
- D 1 - I - 0x00A08F 02:A07F: 5F        .byte $5F   ; 
- D 1 - I - 0x00A090 02:A080: 60        .byte $60   ; 
- D 1 - I - 0x00A091 02:A081: 61        .byte $61   ; 
- D 1 - I - 0x00A092 02:A082: 62        .byte $62   ; 
- D 1 - I - 0x00A093 02:A083: 63        .byte $63   ; 
- D 1 - I - 0x00A094 02:A084: 64        .byte $64   ; 
- D 1 - I - 0x00A095 02:A085: 65        .byte $65   ; 
- D 1 - I - 0x00A096 02:A086: 66        .byte $66   ; 
- D 1 - I - 0x00A097 02:A087: 67        .byte $67   ; 
- D 1 - I - 0x00A098 02:A088: 56        .byte $56   ; 
- D 1 - I - 0x00A099 02:A089: 59        .byte $59   ; 
- D 1 - I - 0x00A09A 02:A08A: 5A        .byte $5A   ; 
- D 1 - I - 0x00A09B 02:A08B: 3F        .byte $3F   ; 
- D 1 - I - 0x00A09C 02:A08C: 4C        .byte $4C   ; 
- D 1 - I - 0x00A09D 02:A08D: 4D        .byte $4D   ; 
- D 1 - I - 0x00A09E 02:A08E: 4C        .byte $4C   ; 
- D 1 - I - 0x00A09F 02:A08F: 4D        .byte $4D   ; 
- D 1 - I - 0x00A0A0 02:A090: 70        .byte $70   ; 
- D 1 - I - 0x00A0A1 02:A091: 00        .byte $00   ; 
- D 1 - I - 0x00A0A2 02:A092: 68        .byte $68   ; 
- D 1 - I - 0x00A0A3 02:A093: 69        .byte $69   ; 
- D 1 - I - 0x00A0A4 02:A094: 00        .byte $00   ; 
- D 1 - I - 0x00A0A5 02:A095: 00        .byte $00   ; 
- D 1 - I - 0x00A0A6 02:A096: 00        .byte $00   ; 
- D 1 - I - 0x00A0A7 02:A097: 00        .byte $00   ; 



_off018_00_A098_02:
- D 1 - I - 0x00A0A8 02:A098: 6D        .byte $6D   ; 
- D 1 - I - 0x00A0A9 02:A099: 00        .byte $00   ; 
- D 1 - I - 0x00A0AA 02:A09A: 76        .byte $76   ; 
- D 1 - I - 0x00A0AB 02:A09B: 6D        .byte $6D   ; 
- D 1 - I - 0x00A0AC 02:A09C: 00        .byte $00   ; 
- D 1 - I - 0x00A0AD 02:A09D: 00        .byte $00   ; 
- D 1 - I - 0x00A0AE 02:A09E: 00        .byte $00   ; 
- D 1 - I - 0x00A0AF 02:A09F: 00        .byte $00   ; 
- D 1 - I - 0x00A0B0 02:A0A0: 74        .byte $74   ; 
- D 1 - I - 0x00A0B1 02:A0A1: 75        .byte $75   ; 
- D 1 - I - 0x00A0B2 02:A0A2: 76        .byte $76   ; 
- D 1 - I - 0x00A0B3 02:A0A3: 6D        .byte $6D   ; 
- D 1 - I - 0x00A0B4 02:A0A4: 74        .byte $74   ; 
- D 1 - I - 0x00A0B5 02:A0A5: 75        .byte $75   ; 
- D 1 - I - 0x00A0B6 02:A0A6: 72        .byte $72   ; 
- D 1 - I - 0x00A0B7 02:A0A7: 73        .byte $73   ; 
- D 1 - I - 0x00A0B8 02:A0A8: 78        .byte $78   ; 
- D 1 - I - 0x00A0B9 02:A0A9: 79        .byte $79   ; 
- D 1 - I - 0x00A0BA 02:A0AA: 7A        .byte $7A   ; 
- D 1 - I - 0x00A0BB 02:A0AB: 6F        .byte $6F   ; 
- D 1 - I - 0x00A0BC 02:A0AC: 78        .byte $78   ; 
- D 1 - I - 0x00A0BD 02:A0AD: 79        .byte $79   ; 
- D 1 - I - 0x00A0BE 02:A0AE: 76        .byte $76   ; 
- D 1 - I - 0x00A0BF 02:A0AF: 77        .byte $77   ; 
- D 1 - I - 0x00A0C0 02:A0B0: 6E        .byte $6E   ; 
- D 1 - I - 0x00A0C1 02:A0B1: 79        .byte $79   ; 
- D 1 - I - 0x00A0C2 02:A0B2: 7A        .byte $7A   ; 
- D 1 - I - 0x00A0C3 02:A0B3: 7B        .byte $7B   ; 
- D 1 - I - 0x00A0C4 02:A0B4: 6E        .byte $6E   ; 
- D 1 - I - 0x00A0C5 02:A0B5: 79        .byte $79   ; 
- D 1 - I - 0x00A0C6 02:A0B6: 7A        .byte $7A   ; 
- D 1 - I - 0x00A0C7 02:A0B7: 7B        .byte $7B   ; 
- D 1 - I - 0x00A0C8 02:A0B8: 7C        .byte $7C   ; 
- D 1 - I - 0x00A0C9 02:A0B9: 7D        .byte $7D   ; 
- D 1 - I - 0x00A0CA 02:A0BA: 7E        .byte $7E   ; 
- D 1 - I - 0x00A0CB 02:A0BB: 7F        .byte $7F   ; 
- D 1 - I - 0x00A0CC 02:A0BC: 7C        .byte $7C   ; 
- D 1 - I - 0x00A0CD 02:A0BD: 7D        .byte $7D   ; 
- D 1 - I - 0x00A0CE 02:A0BE: 7E        .byte $7E   ; 
- D 1 - I - 0x00A0CF 02:A0BF: 7F        .byte $7F   ; 
- D 1 - I - 0x00A0D0 02:A0C0: 03        .byte $03   ; 
- D 1 - I - 0x00A0D1 02:A0C1: 05        .byte $05   ; 
- D 1 - I - 0x00A0D2 02:A0C2: 04        .byte $04   ; 
- D 1 - I - 0x00A0D3 02:A0C3: 05        .byte $05   ; 
- D 1 - I - 0x00A0D4 02:A0C4: 03        .byte $03   ; 
- D 1 - I - 0x00A0D5 02:A0C5: 05        .byte $05   ; 
- D 1 - I - 0x00A0D6 02:A0C6: 04        .byte $04   ; 
- D 1 - I - 0x00A0D7 02:A0C7: 05        .byte $05   ; 
- D 1 - I - 0x00A0D8 02:A0C8: 06        .byte $06   ; 
- D 1 - I - 0x00A0D9 02:A0C9: 07        .byte $07   ; 
- D 1 - I - 0x00A0DA 02:A0CA: 08        .byte $08   ; 
- D 1 - I - 0x00A0DB 02:A0CB: 09        .byte $09   ; 
- D 1 - I - 0x00A0DC 02:A0CC: 06        .byte $06   ; 
- D 1 - I - 0x00A0DD 02:A0CD: 07        .byte $07   ; 
- D 1 - I - 0x00A0DE 02:A0CE: 08        .byte $08   ; 
- D 1 - I - 0x00A0DF 02:A0CF: 09        .byte $09   ; 
- - - - - - 0x00A0E0 02:A0D0: 0A        .byte $0A   ; 
- - - - - - 0x00A0E1 02:A0D1: 0B        .byte $0B   ; 
- - - - - - 0x00A0E2 02:A0D2: 0C        .byte $0C   ; 
- - - - - - 0x00A0E3 02:A0D3: 0D        .byte $0D   ; 
- - - - - - 0x00A0E4 02:A0D4: 0A        .byte $0A   ; 
- - - - - - 0x00A0E5 02:A0D5: 0B        .byte $0B   ; 
- - - - - - 0x00A0E6 02:A0D6: 0C        .byte $0C   ; 
- - - - - - 0x00A0E7 02:A0D7: 0D        .byte $0D   ; 



_off018_00_A0D8_03:
- D 1 - I - 0x00A0E8 02:A0D8: 00        .byte $00   ; 
- D 1 - I - 0x00A0E9 02:A0D9: 00        .byte $00   ; 
- D 1 - I - 0x00A0EA 02:A0DA: 00        .byte $00   ; 
- D 1 - I - 0x00A0EB 02:A0DB: 00        .byte $00   ; 
- D 1 - I - 0x00A0EC 02:A0DC: 00        .byte $00   ; 
- D 1 - I - 0x00A0ED 02:A0DD: 84        .byte $84   ; 
- D 1 - I - 0x00A0EE 02:A0DE: 85        .byte $85   ; 
- D 1 - I - 0x00A0EF 02:A0DF: 86        .byte $86   ; 
- D 1 - I - 0x00A0F0 02:A0E0: 70        .byte $70   ; 
- D 1 - I - 0x00A0F1 02:A0E1: 71        .byte $71   ; 
- D 1 - I - 0x00A0F2 02:A0E2: 72        .byte $72   ; 
- D 1 - I - 0x00A0F3 02:A0E3: 73        .byte $73   ; 
- D 1 - I - 0x00A0F4 02:A0E4: 00        .byte $00   ; 
- D 1 - I - 0x00A0F5 02:A0E5: 00        .byte $00   ; 
- D 1 - I - 0x00A0F6 02:A0E6: 00        .byte $00   ; 
- D 1 - I - 0x00A0F7 02:A0E7: 73        .byte $73   ; 
- D 1 - I - 0x00A0F8 02:A0E8: 74        .byte $74   ; 
- D 1 - I - 0x00A0F9 02:A0E9: 75        .byte $75   ; 
- D 1 - I - 0x00A0FA 02:A0EA: 76        .byte $76   ; 
- D 1 - I - 0x00A0FB 02:A0EB: 77        .byte $77   ; 
- D 1 - I - 0x00A0FC 02:A0EC: 74        .byte $74   ; 
- D 1 - I - 0x00A0FD 02:A0ED: 75        .byte $75   ; 
- D 1 - I - 0x00A0FE 02:A0EE: 72        .byte $72   ; 
- D 1 - I - 0x00A0FF 02:A0EF: 77        .byte $77   ; 
- D 1 - I - 0x00A100 02:A0F0: 78        .byte $78   ; 
- D 1 - I - 0x00A101 02:A0F1: 79        .byte $79   ; 
- D 1 - I - 0x00A102 02:A0F2: 7A        .byte $7A   ; 
- D 1 - I - 0x00A103 02:A0F3: 7B        .byte $7B   ; 
- D 1 - I - 0x00A104 02:A0F4: 78        .byte $78   ; 
- D 1 - I - 0x00A105 02:A0F5: 79        .byte $79   ; 
- D 1 - I - 0x00A106 02:A0F6: 7A        .byte $7A   ; 
- D 1 - I - 0x00A107 02:A0F7: 7B        .byte $7B   ; 
- D 1 - I - 0x00A108 02:A0F8: 7C        .byte $7C   ; 
- D 1 - I - 0x00A109 02:A0F9: 7D        .byte $7D   ; 
- D 1 - I - 0x00A10A 02:A0FA: 7E        .byte $7E   ; 
- D 1 - I - 0x00A10B 02:A0FB: 7F        .byte $7F   ; 
- D 1 - I - 0x00A10C 02:A0FC: 7C        .byte $7C   ; 
- D 1 - I - 0x00A10D 02:A0FD: 7D        .byte $7D   ; 
- D 1 - I - 0x00A10E 02:A0FE: 7E        .byte $7E   ; 
- D 1 - I - 0x00A10F 02:A0FF: 7F        .byte $7F   ; 
- D 1 - I - 0x00A110 02:A100: 03        .byte $03   ; 
- D 1 - I - 0x00A111 02:A101: 05        .byte $05   ; 
- D 1 - I - 0x00A112 02:A102: 04        .byte $04   ; 
- D 1 - I - 0x00A113 02:A103: 05        .byte $05   ; 
- D 1 - I - 0x00A114 02:A104: 03        .byte $03   ; 
- D 1 - I - 0x00A115 02:A105: 05        .byte $05   ; 
- D 1 - I - 0x00A116 02:A106: 04        .byte $04   ; 
- D 1 - I - 0x00A117 02:A107: 05        .byte $05   ; 
- D 1 - I - 0x00A118 02:A108: 06        .byte $06   ; 
- D 1 - I - 0x00A119 02:A109: 07        .byte $07   ; 
- D 1 - I - 0x00A11A 02:A10A: 08        .byte $08   ; 
- D 1 - I - 0x00A11B 02:A10B: 09        .byte $09   ; 
- D 1 - I - 0x00A11C 02:A10C: 06        .byte $06   ; 
- D 1 - I - 0x00A11D 02:A10D: 07        .byte $07   ; 
- D 1 - I - 0x00A11E 02:A10E: 08        .byte $08   ; 
- D 1 - I - 0x00A11F 02:A10F: 09        .byte $09   ; 
- - - - - - 0x00A120 02:A110: 0A        .byte $0A   ; 
- - - - - - 0x00A121 02:A111: 0B        .byte $0B   ; 
- - - - - - 0x00A122 02:A112: 0C        .byte $0C   ; 
- - - - - - 0x00A123 02:A113: 0D        .byte $0D   ; 
- - - - - - 0x00A124 02:A114: 0A        .byte $0A   ; 
- - - - - - 0x00A125 02:A115: 0B        .byte $0B   ; 
- - - - - - 0x00A126 02:A116: 0C        .byte $0C   ; 
- - - - - - 0x00A127 02:A117: 0D        .byte $0D   ; 



_off018_00_A118_04:
- D 1 - I - 0x00A128 02:A118: 87        .byte $87   ; 
- D 1 - I - 0x00A129 02:A119: 88        .byte $88   ; 
- D 1 - I - 0x00A12A 02:A11A: 89        .byte $89   ; 
- D 1 - I - 0x00A12B 02:A11B: 8A        .byte $8A   ; 
- D 1 - I - 0x00A12C 02:A11C: 88        .byte $88   ; 
- D 1 - I - 0x00A12D 02:A11D: 89        .byte $89   ; 
- D 1 - I - 0x00A12E 02:A11E: 8A        .byte $8A   ; 
- D 1 - I - 0x00A12F 02:A11F: 88        .byte $88   ; 
- D 1 - I - 0x00A130 02:A120: 70        .byte $70   ; 
- D 1 - I - 0x00A131 02:A121: 71        .byte $71   ; 
- D 1 - I - 0x00A132 02:A122: 72        .byte $72   ; 
- D 1 - I - 0x00A133 02:A123: 73        .byte $73   ; 
- D 1 - I - 0x00A134 02:A124: 00        .byte $00   ; 
- D 1 - I - 0x00A135 02:A125: 00        .byte $00   ; 
- D 1 - I - 0x00A136 02:A126: 00        .byte $00   ; 
- D 1 - I - 0x00A137 02:A127: 00        .byte $00   ; 
- D 1 - I - 0x00A138 02:A128: 74        .byte $74   ; 
- D 1 - I - 0x00A139 02:A129: 75        .byte $75   ; 
- D 1 - I - 0x00A13A 02:A12A: 76        .byte $76   ; 
- D 1 - I - 0x00A13B 02:A12B: 6D        .byte $6D   ; 
- D 1 - I - 0x00A13C 02:A12C: 74        .byte $74   ; 
- D 1 - I - 0x00A13D 02:A12D: 6C        .byte $6C   ; 
- D 1 - I - 0x00A13E 02:A12E: 00        .byte $00   ; 
- D 1 - I - 0x00A13F 02:A12F: 00        .byte $00   ; 
- D 1 - I - 0x00A140 02:A130: 78        .byte $78   ; 
- D 1 - I - 0x00A141 02:A131: 79        .byte $79   ; 
- D 1 - I - 0x00A142 02:A132: 7A        .byte $7A   ; 
- D 1 - I - 0x00A143 02:A133: 7B        .byte $7B   ; 
- D 1 - I - 0x00A144 02:A134: 78        .byte $78   ; 
- D 1 - I - 0x00A145 02:A135: 79        .byte $79   ; 
- D 1 - I - 0x00A146 02:A136: 80        .byte $80   ; 
- D 1 - I - 0x00A147 02:A137: 6A        .byte $6A   ; 
- D 1 - I - 0x00A148 02:A138: 8E        .byte $8E   ; 
- D 1 - I - 0x00A149 02:A139: 8F        .byte $8F   ; 
- D 1 - I - 0x00A14A 02:A13A: 90        .byte $90   ; 
- D 1 - I - 0x00A14B 02:A13B: 91        .byte $91   ; 
- D 1 - I - 0x00A14C 02:A13C: 7C        .byte $7C   ; 
- D 1 - I - 0x00A14D 02:A13D: 7D        .byte $7D   ; 
- D 1 - I - 0x00A14E 02:A13E: 7E        .byte $7E   ; 
- D 1 - I - 0x00A14F 02:A13F: 7F        .byte $7F   ; 
- D 1 - I - 0x00A150 02:A140: 24        .byte $24   ; 
- D 1 - I - 0x00A151 02:A141: 25        .byte $25   ; 
- D 1 - I - 0x00A152 02:A142: 26        .byte $26   ; 
- D 1 - I - 0x00A153 02:A143: 27        .byte $27   ; 
- D 1 - I - 0x00A154 02:A144: 03        .byte $03   ; 
- D 1 - I - 0x00A155 02:A145: 05        .byte $05   ; 
- D 1 - I - 0x00A156 02:A146: 04        .byte $04   ; 
- D 1 - I - 0x00A157 02:A147: 05        .byte $05   ; 
- D 1 - I - 0x00A158 02:A148: 28        .byte $28   ; 
- D 1 - I - 0x00A159 02:A149: 29        .byte $29   ; 
- D 1 - I - 0x00A15A 02:A14A: 2A        .byte $2A   ; 
- D 1 - I - 0x00A15B 02:A14B: 2B        .byte $2B   ; 
- D 1 - I - 0x00A15C 02:A14C: 06        .byte $06   ; 
- D 1 - I - 0x00A15D 02:A14D: 07        .byte $07   ; 
- D 1 - I - 0x00A15E 02:A14E: 08        .byte $08   ; 
- D 1 - I - 0x00A15F 02:A14F: 09        .byte $09   ; 
- - - - - - 0x00A160 02:A150: 2C        .byte $2C   ; 
- - - - - - 0x00A161 02:A151: 2D        .byte $2D   ; 
- - - - - - 0x00A162 02:A152: 2E        .byte $2E   ; 
- - - - - - 0x00A163 02:A153: 22        .byte $22   ; 
- - - - - - 0x00A164 02:A154: 0A        .byte $0A   ; 
- - - - - - 0x00A165 02:A155: 0B        .byte $0B   ; 
- - - - - - 0x00A166 02:A156: 0C        .byte $0C   ; 
- - - - - - 0x00A167 02:A157: 0D        .byte $0D   ; 



_off018_00_A158_05:
- D 1 - I - 0x00A168 02:A158: 89        .byte $89   ; 
- D 1 - I - 0x00A169 02:A159: 8A        .byte $8A   ; 
- D 1 - I - 0x00A16A 02:A15A: E8        .byte $E8   ; 
- D 1 - I - 0x00A16B 02:A15B: E9        .byte $E9   ; 
- D 1 - I - 0x00A16C 02:A15C: EA        .byte $EA   ; 
- D 1 - I - 0x00A16D 02:A15D: D2        .byte $D2   ; 
- D 1 - I - 0x00A16E 02:A15E: D3        .byte $D3   ; 
- D 1 - I - 0x00A16F 02:A15F: 98        .byte $98   ; 
- D 1 - I - 0x00A170 02:A160: 00        .byte $00   ; 
- D 1 - I - 0x00A171 02:A161: 00        .byte $00   ; 
- D 1 - I - 0x00A172 02:A162: 99        .byte $99   ; 
- D 1 - I - 0x00A173 02:A163: 8C        .byte $8C   ; 
- D 1 - I - 0x00A174 02:A164: EE        .byte $EE   ; 
- D 1 - I - 0x00A175 02:A165: EF        .byte $EF   ; 
- D 1 - I - 0x00A176 02:A166: ED        .byte $ED   ; 
- D 1 - I - 0x00A177 02:A167: 9C        .byte $9C   ; 
- D 1 - I - 0x00A178 02:A168: 00        .byte $00   ; 
- D 1 - I - 0x00A179 02:A169: 94        .byte $94   ; 
- D 1 - I - 0x00A17A 02:A16A: 95        .byte $95   ; 
- D 1 - I - 0x00A17B 02:A16B: 96        .byte $96   ; 
- D 1 - I - 0x00A17C 02:A16C: 97        .byte $97   ; 
- D 1 - I - 0x00A17D 02:A16D: 15        .byte $15   ; 
- D 1 - I - 0x00A17E 02:A16E: 16        .byte $16   ; 
- D 1 - I - 0x00A17F 02:A16F: 14        .byte $14   ; 
- D 1 - I - 0x00A180 02:A170: 00        .byte $00   ; 
- D 1 - I - 0x00A181 02:A171: 98        .byte $98   ; 
- D 1 - I - 0x00A182 02:A172: 97        .byte $97   ; 
- D 1 - I - 0x00A183 02:A173: 9A        .byte $9A   ; 
- D 1 - I - 0x00A184 02:A174: 9B        .byte $9B   ; 
- D 1 - I - 0x00A185 02:A175: 14        .byte $14   ; 
- D 1 - I - 0x00A186 02:A176: 18        .byte $18   ; 
- D 1 - I - 0x00A187 02:A177: 19        .byte $19   ; 
- D 1 - I - 0x00A188 02:A178: 01        .byte $01   ; 
- D 1 - I - 0x00A189 02:A179: 0E        .byte $0E   ; 
- D 1 - I - 0x00A18A 02:A17A: 9B        .byte $9B   ; 
- D 1 - I - 0x00A18B 02:A17B: 14        .byte $14   ; 
- D 1 - I - 0x00A18C 02:A17C: 18        .byte $18   ; 
- D 1 - I - 0x00A18D 02:A17D: 19        .byte $19   ; 
- D 1 - I - 0x00A18E 02:A17E: 1A        .byte $1A   ; 
- D 1 - I - 0x00A18F 02:A17F: 1B        .byte $1B   ; 
- D 1 - I - 0x00A190 02:A180: 03        .byte $03   ; 
- D 1 - I - 0x00A191 02:A181: 0F        .byte $0F   ; 
- D 1 - I - 0x00A192 02:A182: 10        .byte $10   ; 
- D 1 - I - 0x00A193 02:A183: 11        .byte $11   ; 
- D 1 - I - 0x00A194 02:A184: 1A        .byte $1A   ; 
- D 1 - I - 0x00A195 02:A185: 1B        .byte $1B   ; 
- D 1 - I - 0x00A196 02:A186: 1C        .byte $1C   ; 
- D 1 - I - 0x00A197 02:A187: 1D        .byte $1D   ; 
- D 1 - I - 0x00A198 02:A188: 06        .byte $06   ; 
- D 1 - I - 0x00A199 02:A189: 07        .byte $07   ; 
- D 1 - I - 0x00A19A 02:A18A: 3D        .byte $3D   ; 
- D 1 - I - 0x00A19B 02:A18B: 3D        .byte $3D   ; 
- D 1 - I - 0x00A19C 02:A18C: 1C        .byte $1C   ; 
- D 1 - I - 0x00A19D 02:A18D: 1D        .byte $1D   ; 
- D 1 - I - 0x00A19E 02:A18E: 36        .byte $36   ; 
- D 1 - I - 0x00A19F 02:A18F: 33        .byte $33   ; 
- - - - - - 0x00A1A0 02:A190: 0A        .byte $0A   ; 
- - - - - - 0x00A1A1 02:A191: 0B        .byte $0B   ; 
- - - - - - 0x00A1A2 02:A192: 0C        .byte $0C   ; 
- - - - - - 0x00A1A3 02:A193: 0D        .byte $0D   ; 
- - - - - - 0x00A1A4 02:A194: 36        .byte $36   ; 
- - - - - - 0x00A1A5 02:A195: 33        .byte $33   ; 
- - - - - - 0x00A1A6 02:A196: 37        .byte $37   ; 
- - - - - - 0x00A1A7 02:A197: 30        .byte $30   ; 



_off018_00_A198_06:
- D 1 - I - 0x00A1A8 02:A198: 97        .byte $97   ; 
- D 1 - I - 0x00A1A9 02:A199: 13        .byte $13   ; 
- D 1 - I - 0x00A1AA 02:A19A: 01        .byte $01   ; 
- D 1 - I - 0x00A1AB 02:A19B: 9F        .byte $9F   ; 
- D 1 - I - 0x00A1AC 02:A19C: A0        .byte $A0   ; 
- D 1 - I - 0x00A1AD 02:A19D: 9F        .byte $9F   ; 
- D 1 - I - 0x00A1AE 02:A19E: A0        .byte $A0   ; 
- D 1 - I - 0x00A1AF 02:A19F: 02        .byte $02   ; 
- D 1 - I - 0x00A1B0 02:A1A0: 9B        .byte $9B   ; 
- D 1 - I - 0x00A1B1 02:A1A1: 17        .byte $17   ; 
- D 1 - I - 0x00A1B2 02:A1A2: 03        .byte $03   ; 
- D 1 - I - 0x00A1B3 02:A1A3: 05        .byte $05   ; 
- D 1 - I - 0x00A1B4 02:A1A4: 04        .byte $04   ; 
- D 1 - I - 0x00A1B5 02:A1A5: 05        .byte $05   ; 
- D 1 - I - 0x00A1B6 02:A1A6: 03        .byte $03   ; 
- D 1 - I - 0x00A1B7 02:A1A7: 05        .byte $05   ; 
- D 1 - I - 0x00A1B8 02:A1A8: 18        .byte $18   ; 
- D 1 - I - 0x00A1B9 02:A1A9: 19        .byte $19   ; 
- D 1 - I - 0x00A1BA 02:A1AA: 06        .byte $06   ; 
- D 1 - I - 0x00A1BB 02:A1AB: 07        .byte $07   ; 
- D 1 - I - 0x00A1BC 02:A1AC: 08        .byte $08   ; 
- D 1 - I - 0x00A1BD 02:A1AD: 09        .byte $09   ; 
- D 1 - I - 0x00A1BE 02:A1AE: 06        .byte $06   ; 
- D 1 - I - 0x00A1BF 02:A1AF: 07        .byte $07   ; 
- D 1 - I - 0x00A1C0 02:A1B0: 1A        .byte $1A   ; 
- D 1 - I - 0x00A1C1 02:A1B1: 1B        .byte $1B   ; 
- D 1 - I - 0x00A1C2 02:A1B2: 37        .byte $37   ; 
- D 1 - I - 0x00A1C3 02:A1B3: 30        .byte $30   ; 
- D 1 - I - 0x00A1C4 02:A1B4: 1C        .byte $1C   ; 
- D 1 - I - 0x00A1C5 02:A1B5: 1D        .byte $1D   ; 
- D 1 - I - 0x00A1C6 02:A1B6: 37        .byte $37   ; 
- D 1 - I - 0x00A1C7 02:A1B7: 30        .byte $30   ; 
- D 1 - I - 0x00A1C8 02:A1B8: 1C        .byte $1C   ; 
- D 1 - I - 0x00A1C9 02:A1B9: 1D        .byte $1D   ; 
- D 1 - I - 0x00A1CA 02:A1BA: 36        .byte $36   ; 
- D 1 - I - 0x00A1CB 02:A1BB: 33        .byte $33   ; 
- D 1 - I - 0x00A1CC 02:A1BC: 36        .byte $36   ; 
- D 1 - I - 0x00A1CD 02:A1BD: 33        .byte $33   ; 
- D 1 - I - 0x00A1CE 02:A1BE: 36        .byte $36   ; 
- D 1 - I - 0x00A1CF 02:A1BF: 33        .byte $33   ; 
- D 1 - I - 0x00A1D0 02:A1C0: 36        .byte $36   ; 
- D 1 - I - 0x00A1D1 02:A1C1: 33        .byte $33   ; 
- D 1 - I - 0x00A1D2 02:A1C2: 37        .byte $37   ; 
- D 1 - I - 0x00A1D3 02:A1C3: 30        .byte $30   ; 
- D 1 - I - 0x00A1D4 02:A1C4: 37        .byte $37   ; 
- D 1 - I - 0x00A1D5 02:A1C5: 30        .byte $30   ; 
- - - - - - 0x00A1D6 02:A1C6: 37        .byte $37   ; 
- - - - - - 0x00A1D7 02:A1C7: 30        .byte $30   ; 
- D 1 - I - 0x00A1D8 02:A1C8: 37        .byte $37   ; 
- D 1 - I - 0x00A1D9 02:A1C9: 30        .byte $30   ; 
- D 1 - I - 0x00A1DA 02:A1CA: 36        .byte $36   ; 
- D 1 - I - 0x00A1DB 02:A1CB: 33        .byte $33   ; 
- D 1 - I - 0x00A1DC 02:A1CC: 36        .byte $36   ; 
- - - - - - 0x00A1DD 02:A1CD: 33        .byte $33   ; 
- - - - - - 0x00A1DE 02:A1CE: 36        .byte $36   ; 
- - - - - - 0x00A1DF 02:A1CF: 33        .byte $33   ; 
- - - - - - 0x00A1E0 02:A1D0: 1E        .byte $1E   ; 
- - - - - - 0x00A1E1 02:A1D1: 1F        .byte $1F   ; 
- - - - - - 0x00A1E2 02:A1D2: 37        .byte $37   ; 
- - - - - - 0x00A1E3 02:A1D3: 30        .byte $30   ; 
- - - - - - 0x00A1E4 02:A1D4: 37        .byte $37   ; 
- - - - - - 0x00A1E5 02:A1D5: 30        .byte $30   ; 
- - - - - - 0x00A1E6 02:A1D6: 37        .byte $37   ; 
- - - - - - 0x00A1E7 02:A1D7: 30        .byte $30   ; 



_off018_00_A1D8_07:
- D 1 - I - 0x00A1E8 02:A1D8: 01        .byte $01   ; 
- D 1 - I - 0x00A1E9 02:A1D9: 6B        .byte $6B   ; 
- D 1 - I - 0x00A1EA 02:A1DA: 16        .byte $16   ; 
- D 1 - I - 0x00A1EB 02:A1DB: 14        .byte $14   ; 
- D 1 - I - 0x00A1EC 02:A1DC: 18        .byte $18   ; 
- D 1 - I - 0x00A1ED 02:A1DD: 19        .byte $19   ; 
- D 1 - I - 0x00A1EE 02:A1DE: 3D        .byte $3D   ; 
- D 1 - I - 0x00A1EF 02:A1DF: 3D        .byte $3D   ; 
- D 1 - I - 0x00A1F0 02:A1E0: 03        .byte $03   ; 
- D 1 - I - 0x00A1F1 02:A1E1: 0F        .byte $0F   ; 
- D 1 - I - 0x00A1F2 02:A1E2: 10        .byte $10   ; 
- D 1 - I - 0x00A1F3 02:A1E3: 11        .byte $11   ; 
- D 1 - I - 0x00A1F4 02:A1E4: 1C        .byte $1C   ; 
- D 1 - I - 0x00A1F5 02:A1E5: 1D        .byte $1D   ; 
- D 1 - I - 0x00A1F6 02:A1E6: 3D        .byte $3D   ; 
- D 1 - I - 0x00A1F7 02:A1E7: 3D        .byte $3D   ; 
- D 1 - I - 0x00A1F8 02:A1E8: 06        .byte $06   ; 
- D 1 - I - 0x00A1F9 02:A1E9: 07        .byte $07   ; 
- D 1 - I - 0x00A1FA 02:A1EA: 3D        .byte $3D   ; 
- D 1 - I - 0x00A1FB 02:A1EB: 3D        .byte $3D   ; 
- D 1 - I - 0x00A1FC 02:A1EC: 0A        .byte $0A   ; 
- D 1 - I - 0x00A1FD 02:A1ED: 0B        .byte $0B   ; 
- D 1 - I - 0x00A1FE 02:A1EE: 0C        .byte $0C   ; 
- D 1 - I - 0x00A1FF 02:A1EF: 0D        .byte $0D   ; 
- D 1 - I - 0x00A200 02:A1F0: 0A        .byte $0A   ; 
- - - - - - 0x00A201 02:A1F1: 0B        .byte $0B   ; 
- - - - - - 0x00A202 02:A1F2: 0C        .byte $0C   ; 
- - - - - - 0x00A203 02:A1F3: 0D        .byte $0D   ; 
- - - - - - 0x00A204 02:A1F4: 0A        .byte $0A   ; 
- - - - - - 0x00A205 02:A1F5: 3A        .byte $3A   ; 
- - - - - - 0x00A206 02:A1F6: 3B        .byte $3B   ; 
- - - - - - 0x00A207 02:A1F7: 3C        .byte $3C   ; 
- - - - - - 0x00A208 02:A1F8: 0A        .byte $0A   ; 
- - - - - - 0x00A209 02:A1F9: 3A        .byte $3A   ; 
- - - - - - 0x00A20A 02:A1FA: 3B        .byte $3B   ; 
- - - - - - 0x00A20B 02:A1FB: 3C        .byte $3C   ; 
- - - - - - 0x00A20C 02:A1FC: 0A        .byte $0A   ; 
- - - - - - 0x00A20D 02:A1FD: 3A        .byte $3A   ; 
- - - - - - 0x00A20E 02:A1FE: 3B        .byte $3B   ; 
- - - - - - 0x00A20F 02:A1FF: 3C        .byte $3C   ; 
- - - - - - 0x00A210 02:A200: 0A        .byte $0A   ; 
- - - - - - 0x00A211 02:A201: 3A        .byte $3A   ; 
- - - - - - 0x00A212 02:A202: 3B        .byte $3B   ; 
- - - - - - 0x00A213 02:A203: 3C        .byte $3C   ; 
- - - - - - 0x00A214 02:A204: 0A        .byte $0A   ; 
- - - - - - 0x00A215 02:A205: 3A        .byte $3A   ; 
- - - - - - 0x00A216 02:A206: 3B        .byte $3B   ; 
- - - - - - 0x00A217 02:A207: 3C        .byte $3C   ; 
- - - - - - 0x00A218 02:A208: 0A        .byte $0A   ; 
- - - - - - 0x00A219 02:A209: 3A        .byte $3A   ; 
- - - - - - 0x00A21A 02:A20A: 3B        .byte $3B   ; 
- - - - - - 0x00A21B 02:A20B: 3C        .byte $3C   ; 
- - - - - - 0x00A21C 02:A20C: 0A        .byte $0A   ; 
- - - - - - 0x00A21D 02:A20D: 3A        .byte $3A   ; 
- - - - - - 0x00A21E 02:A20E: 3B        .byte $3B   ; 
- - - - - - 0x00A21F 02:A20F: 3C        .byte $3C   ; 
- - - - - - 0x00A220 02:A210: 0A        .byte $0A   ; 
- - - - - - 0x00A221 02:A211: 3A        .byte $3A   ; 
- - - - - - 0x00A222 02:A212: 3B        .byte $3B   ; 
- - - - - - 0x00A223 02:A213: 3C        .byte $3C   ; 
- - - - - - 0x00A224 02:A214: 0A        .byte $0A   ; 
- - - - - - 0x00A225 02:A215: 3A        .byte $3A   ; 
- - - - - - 0x00A226 02:A216: 3B        .byte $3B   ; 
- - - - - - 0x00A227 02:A217: 3C        .byte $3C   ; 



_off018_00_A218_08:
- D 1 - I - 0x00A228 02:A218: 36        .byte $36   ; 
- D 1 - I - 0x00A229 02:A219: 33        .byte $33   ; 
- D 1 - I - 0x00A22A 02:A21A: 3D        .byte $3D   ; 
- D 1 - I - 0x00A22B 02:A21B: 3D        .byte $3D   ; 
- D 1 - I - 0x00A22C 02:A21C: 1E        .byte $1E   ; 
- D 1 - I - 0x00A22D 02:A21D: 1F        .byte $1F   ; 
- D 1 - I - 0x00A22E 02:A21E: 1C        .byte $1C   ; 
- D 1 - I - 0x00A22F 02:A21F: 1D        .byte $1D   ; 
- D 1 - I - 0x00A230 02:A220: 36        .byte $36   ; 
- D 1 - I - 0x00A231 02:A221: 33        .byte $33   ; 
- D 1 - I - 0x00A232 02:A222: 1C        .byte $1C   ; 
- D 1 - I - 0x00A233 02:A223: 1D        .byte $1D   ; 
- D 1 - I - 0x00A234 02:A224: 1E        .byte $1E   ; 
- D 1 - I - 0x00A235 02:A225: 1F        .byte $1F   ; 
- - - - - - 0x00A236 02:A226: 1E        .byte $1E   ; 
- - - - - - 0x00A237 02:A227: 1F        .byte $1F   ; 
- D 1 - I - 0x00A238 02:A228: 36        .byte $36   ; 
- D 1 - I - 0x00A239 02:A229: 33        .byte $33   ; 
- D 1 - I - 0x00A23A 02:A22A: 1E        .byte $1E   ; 
- D 1 - I - 0x00A23B 02:A22B: 1F        .byte $1F   ; 
- D 1 - I - 0x00A23C 02:A22C: 1E        .byte $1E   ; 
- - - - - - 0x00A23D 02:A22D: 1F        .byte $1F   ; 
- - - - - - 0x00A23E 02:A22E: 1E        .byte $1E   ; 
- - - - - - 0x00A23F 02:A22F: 1F        .byte $1F   ; 
- - - - - - 0x00A240 02:A230: 36        .byte $36   ; 
- - - - - - 0x00A241 02:A231: 33        .byte $33   ; 
- - - - - - 0x00A242 02:A232: 1E        .byte $1E   ; 
- - - - - - 0x00A243 02:A233: 1F        .byte $1F   ; 
- - - - - - 0x00A244 02:A234: 1E        .byte $1E   ; 
- - - - - - 0x00A245 02:A235: 1F        .byte $1F   ; 
- - - - - - 0x00A246 02:A236: 1E        .byte $1E   ; 
- - - - - - 0x00A247 02:A237: 1F        .byte $1F   ; 
- - - - - - 0x00A248 02:A238: 36        .byte $36   ; 
- - - - - - 0x00A249 02:A239: 33        .byte $33   ; 
- - - - - - 0x00A24A 02:A23A: 1E        .byte $1E   ; 
- - - - - - 0x00A24B 02:A23B: 1F        .byte $1F   ; 
- - - - - - 0x00A24C 02:A23C: 1E        .byte $1E   ; 
- - - - - - 0x00A24D 02:A23D: 1F        .byte $1F   ; 
- - - - - - 0x00A24E 02:A23E: 1E        .byte $1E   ; 
- - - - - - 0x00A24F 02:A23F: 1F        .byte $1F   ; 
- - - - - - 0x00A250 02:A240: 36        .byte $36   ; 
- - - - - - 0x00A251 02:A241: 33        .byte $33   ; 
- - - - - - 0x00A252 02:A242: 1E        .byte $1E   ; 
- - - - - - 0x00A253 02:A243: 1F        .byte $1F   ; 
- - - - - - 0x00A254 02:A244: 1E        .byte $1E   ; 
- - - - - - 0x00A255 02:A245: 1F        .byte $1F   ; 
- - - - - - 0x00A256 02:A246: 1E        .byte $1E   ; 
- - - - - - 0x00A257 02:A247: 1F        .byte $1F   ; 
- - - - - - 0x00A258 02:A248: 36        .byte $36   ; 
- - - - - - 0x00A259 02:A249: 33        .byte $33   ; 
- - - - - - 0x00A25A 02:A24A: 1E        .byte $1E   ; 
- - - - - - 0x00A25B 02:A24B: 1F        .byte $1F   ; 
- - - - - - 0x00A25C 02:A24C: 1E        .byte $1E   ; 
- - - - - - 0x00A25D 02:A24D: 1F        .byte $1F   ; 
- - - - - - 0x00A25E 02:A24E: 1E        .byte $1E   ; 
- - - - - - 0x00A25F 02:A24F: 1F        .byte $1F   ; 
- - - - - - 0x00A260 02:A250: 36        .byte $36   ; 
- - - - - - 0x00A261 02:A251: 33        .byte $33   ; 
- - - - - - 0x00A262 02:A252: 1E        .byte $1E   ; 
- - - - - - 0x00A263 02:A253: 1F        .byte $1F   ; 
- - - - - - 0x00A264 02:A254: 1E        .byte $1E   ; 
- - - - - - 0x00A265 02:A255: 1F        .byte $1F   ; 
- - - - - - 0x00A266 02:A256: 1E        .byte $1E   ; 
- - - - - - 0x00A267 02:A257: 1F        .byte $1F   ; 



_off018_00_A258_09:
- - - - - - 0x00A268 02:A258: 00        .byte $00   ; 
- - - - - - 0x00A269 02:A259: 00        .byte $00   ; 
- - - - - - 0x00A26A 02:A25A: 00        .byte $00   ; 
- - - - - - 0x00A26B 02:A25B: 00        .byte $00   ; 
- - - - - - 0x00A26C 02:A25C: 00        .byte $00   ; 
- - - - - - 0x00A26D 02:A25D: 00        .byte $00   ; 
- - - - - - 0x00A26E 02:A25E: 00        .byte $00   ; 
- - - - - - 0x00A26F 02:A25F: 00        .byte $00   ; 
- - - - - - 0x00A270 02:A260: 00        .byte $00   ; 
- - - - - - 0x00A271 02:A261: 00        .byte $00   ; 
- - - - - - 0x00A272 02:A262: 00        .byte $00   ; 
- - - - - - 0x00A273 02:A263: 00        .byte $00   ; 
- - - - - - 0x00A274 02:A264: 00        .byte $00   ; 
- - - - - - 0x00A275 02:A265: 00        .byte $00   ; 
- - - - - - 0x00A276 02:A266: 00        .byte $00   ; 
- - - - - - 0x00A277 02:A267: 00        .byte $00   ; 
- - - - - - 0x00A278 02:A268: 00        .byte $00   ; 
- - - - - - 0x00A279 02:A269: 00        .byte $00   ; 
- - - - - - 0x00A27A 02:A26A: 00        .byte $00   ; 
- - - - - - 0x00A27B 02:A26B: 00        .byte $00   ; 
- - - - - - 0x00A27C 02:A26C: 00        .byte $00   ; 
- - - - - - 0x00A27D 02:A26D: 00        .byte $00   ; 
- - - - - - 0x00A27E 02:A26E: 00        .byte $00   ; 
- - - - - - 0x00A27F 02:A26F: 00        .byte $00   ; 
- - - - - - 0x00A280 02:A270: 00        .byte $00   ; 
- - - - - - 0x00A281 02:A271: 00        .byte $00   ; 
- - - - - - 0x00A282 02:A272: 00        .byte $00   ; 
- - - - - - 0x00A283 02:A273: 00        .byte $00   ; 
- - - - - - 0x00A284 02:A274: 00        .byte $00   ; 
- D 1 - I - 0x00A285 02:A275: 51        .byte $51   ; 
- D 1 - I - 0x00A286 02:A276: 52        .byte $52   ; 
- D 1 - I - 0x00A287 02:A277: 53        .byte $53   ; 
- - - - - - 0x00A288 02:A278: 51        .byte $51   ; 
- - - - - - 0x00A289 02:A279: 52        .byte $52   ; 
- - - - - - 0x00A28A 02:A27A: 53        .byte $53   ; 
- D 1 - I - 0x00A28B 02:A27B: 00        .byte $00   ; 
- D 1 - I - 0x00A28C 02:A27C: CB        .byte $CB   ; 
- D 1 - I - 0x00A28D 02:A27D: 00        .byte $00   ; 
- D 1 - I - 0x00A28E 02:A27E: 51        .byte $51   ; 
- D 1 - I - 0x00A28F 02:A27F: 53        .byte $53   ; 
- D 1 - I - 0x00A290 02:A280: 00        .byte $00   ; 
- D 1 - I - 0x00A291 02:A281: 00        .byte $00   ; 
- D 1 - I - 0x00A292 02:A282: 51        .byte $51   ; 
- D 1 - I - 0x00A293 02:A283: 52        .byte $52   ; 
- D 1 - I - 0x00A294 02:A284: 53        .byte $53   ; 
- D 1 - I - 0x00A295 02:A285: CE        .byte $CE   ; 
- D 1 - I - 0x00A296 02:A286: CF        .byte $CF   ; 
- D 1 - I - 0x00A297 02:A287: 00        .byte $00   ; 
- D 1 - I - 0x00A298 02:A288: D0        .byte $D0   ; 
- D 1 - I - 0x00A299 02:A289: D1        .byte $D1   ; 
- D 1 - I - 0x00A29A 02:A28A: CB        .byte $CB   ; 
- D 1 - I - 0x00A29B 02:A28B: 00        .byte $00   ; 
- D 1 - I - 0x00A29C 02:A28C: D0        .byte $D0   ; 
- D 1 - I - 0x00A29D 02:A28D: D1        .byte $D1   ; 
- D 1 - I - 0x00A29E 02:A28E: 00        .byte $00   ; 
- D 1 - I - 0x00A29F 02:A28F: CB        .byte $CB   ; 
- D 1 - I - 0x00A2A0 02:A290: 00        .byte $00   ; 
- D 1 - I - 0x00A2A1 02:A291: D5        .byte $D5   ; 
- D 1 - I - 0x00A2A2 02:A292: 00        .byte $00   ; 
- D 1 - I - 0x00A2A3 02:A293: D2        .byte $D2   ; 
- D 1 - I - 0x00A2A4 02:A294: 00        .byte $00   ; 
- D 1 - I - 0x00A2A5 02:A295: D5        .byte $D5   ; 
- D 1 - I - 0x00A2A6 02:A296: 00        .byte $00   ; 
- D 1 - I - 0x00A2A7 02:A297: 9D        .byte $9D   ; 



_off018_00_A298_0A:
- - - - - - 0x00A2A8 02:A298: 00        .byte $00   ; 
- - - - - - 0x00A2A9 02:A299: 00        .byte $00   ; 
- - - - - - 0x00A2AA 02:A29A: 00        .byte $00   ; 
- - - - - - 0x00A2AB 02:A29B: 00        .byte $00   ; 
- - - - - - 0x00A2AC 02:A29C: 00        .byte $00   ; 
- - - - - - 0x00A2AD 02:A29D: 00        .byte $00   ; 
- - - - - - 0x00A2AE 02:A29E: 00        .byte $00   ; 
- - - - - - 0x00A2AF 02:A29F: 00        .byte $00   ; 
- - - - - - 0x00A2B0 02:A2A0: 00        .byte $00   ; 
- - - - - - 0x00A2B1 02:A2A1: 00        .byte $00   ; 
- - - - - - 0x00A2B2 02:A2A2: 00        .byte $00   ; 
- - - - - - 0x00A2B3 02:A2A3: 00        .byte $00   ; 
- - - - - - 0x00A2B4 02:A2A4: 00        .byte $00   ; 
- - - - - - 0x00A2B5 02:A2A5: 00        .byte $00   ; 
- - - - - - 0x00A2B6 02:A2A6: 00        .byte $00   ; 
- - - - - - 0x00A2B7 02:A2A7: 00        .byte $00   ; 
- - - - - - 0x00A2B8 02:A2A8: 00        .byte $00   ; 
- - - - - - 0x00A2B9 02:A2A9: 00        .byte $00   ; 
- - - - - - 0x00A2BA 02:A2AA: 00        .byte $00   ; 
- - - - - - 0x00A2BB 02:A2AB: 00        .byte $00   ; 
- - - - - - 0x00A2BC 02:A2AC: 00        .byte $00   ; 
- - - - - - 0x00A2BD 02:A2AD: 00        .byte $00   ; 
- - - - - - 0x00A2BE 02:A2AE: 00        .byte $00   ; 
- D 1 - I - 0x00A2BF 02:A2AF: 00        .byte $00   ; 
- D 1 - I - 0x00A2C0 02:A2B0: CE        .byte $CE   ; 
- D 1 - I - 0x00A2C1 02:A2B1: CF        .byte $CF   ; 
- D 1 - I - 0x00A2C2 02:A2B2: B3        .byte $B3   ; 
- D 1 - I - 0x00A2C3 02:A2B3: B4        .byte $B4   ; 
- D 1 - I - 0x00A2C4 02:A2B4: B5        .byte $B5   ; 
- D 1 - I - 0x00A2C5 02:A2B5: B5        .byte $B5   ; 
- D 1 - I - 0x00A2C6 02:A2B6: B5        .byte $B5   ; 
- D 1 - I - 0x00A2C7 02:A2B7: B6        .byte $B6   ; 
- D 1 - I - 0x00A2C8 02:A2B8: 00        .byte $00   ; 
- D 1 - I - 0x00A2C9 02:A2B9: 00        .byte $00   ; 
- D 1 - I - 0x00A2CA 02:A2BA: 00        .byte $00   ; 
- D 1 - I - 0x00A2CB 02:A2BB: AF        .byte $AF   ; 
- D 1 - I - 0x00A2CC 02:A2BC: B0        .byte $B0   ; 
- D 1 - I - 0x00A2CD 02:A2BD: B1        .byte $B1   ; 
- D 1 - I - 0x00A2CE 02:A2BE: B2        .byte $B2   ; 
- D 1 - I - 0x00A2CF 02:A2BF: D6        .byte $D6   ; 
- D 1 - I - 0x00A2D0 02:A2C0: CC        .byte $CC   ; 
- D 1 - I - 0x00A2D1 02:A2C1: CD        .byte $CD   ; 
- D 1 - I - 0x00A2D2 02:A2C2: A9        .byte $A9   ; 
- D 1 - I - 0x00A2D3 02:A2C3: AA        .byte $AA   ; 
- D 1 - I - 0x00A2D4 02:A2C4: AB        .byte $AB   ; 
- D 1 - I - 0x00A2D5 02:A2C5: AC        .byte $AC   ; 
- D 1 - I - 0x00A2D6 02:A2C6: AD        .byte $AD   ; 
- D 1 - I - 0x00A2D7 02:A2C7: AE        .byte $AE   ; 
- D 1 - I - 0x00A2D8 02:A2C8: 00        .byte $00   ; 
- D 1 - I - 0x00A2D9 02:A2C9: 00        .byte $00   ; 
- D 1 - I - 0x00A2DA 02:A2CA: 00        .byte $00   ; 
- D 1 - I - 0x00A2DB 02:A2CB: A7        .byte $A7   ; 
- D 1 - I - 0x00A2DC 02:A2CC: A8        .byte $A8   ; 
- D 1 - I - 0x00A2DD 02:A2CD: A7        .byte $A7   ; 
- D 1 - I - 0x00A2DE 02:A2CE: A8        .byte $A8   ; 
- D 1 - I - 0x00A2DF 02:A2CF: 00        .byte $00   ; 
- D 1 - I - 0x00A2E0 02:A2D0: 9E        .byte $9E   ; 
- D 1 - I - 0x00A2E1 02:A2D1: 00        .byte $00   ; 
- D 1 - I - 0x00A2E2 02:A2D2: 00        .byte $00   ; 
- D 1 - I - 0x00A2E3 02:A2D3: A5        .byte $A5   ; 
- D 1 - I - 0x00A2E4 02:A2D4: A6        .byte $A6   ; 
- D 1 - I - 0x00A2E5 02:A2D5: A5        .byte $A5   ; 
- D 1 - I - 0x00A2E6 02:A2D6: A6        .byte $A6   ; 
- D 1 - I - 0x00A2E7 02:A2D7: 00        .byte $00   ; 



_off018_00_A2D8_0B:
- - - - - - 0x00A2E8 02:A2D8: 00        .byte $00   ; 
- - - - - - 0x00A2E9 02:A2D9: 00        .byte $00   ; 
- - - - - - 0x00A2EA 02:A2DA: 00        .byte $00   ; 
- - - - - - 0x00A2EB 02:A2DB: 00        .byte $00   ; 
- D 1 - I - 0x00A2EC 02:A2DC: 51        .byte $51   ; 
- D 1 - I - 0x00A2ED 02:A2DD: 52        .byte $52   ; 
- D 1 - I - 0x00A2EE 02:A2DE: 53        .byte $53   ; 
- D 1 - I - 0x00A2EF 02:A2DF: 00        .byte $00   ; 
- - - - - - 0x00A2F0 02:A2E0: 00        .byte $00   ; 
- - - - - - 0x00A2F1 02:A2E1: 51        .byte $51   ; 
- D 1 - I - 0x00A2F2 02:A2E2: 52        .byte $52   ; 
- D 1 - I - 0x00A2F3 02:A2E3: 53        .byte $53   ; 
- D 1 - I - 0x00A2F4 02:A2E4: D0        .byte $D0   ; 
- D 1 - I - 0x00A2F5 02:A2E5: 00        .byte $00   ; 
- D 1 - I - 0x00A2F6 02:A2E6: D0        .byte $D0   ; 
- D 1 - I - 0x00A2F7 02:A2E7: D1        .byte $D1   ; 
- D 1 - I - 0x00A2F8 02:A2E8: CB        .byte $CB   ; 
- D 1 - I - 0x00A2F9 02:A2E9: 00        .byte $00   ; 
- D 1 - I - 0x00A2FA 02:A2EA: CB        .byte $CB   ; 
- D 1 - I - 0x00A2FB 02:A2EB: CB        .byte $CB   ; 
- D 1 - I - 0x00A2FC 02:A2EC: 00        .byte $00   ; 
- D 1 - I - 0x00A2FD 02:A2ED: CE        .byte $CE   ; 
- D 1 - I - 0x00A2FE 02:A2EE: CF        .byte $CF   ; 
- D 1 - I - 0x00A2FF 02:A2EF: D5        .byte $D5   ; 
- D 1 - I - 0x00A300 02:A2F0: CE        .byte $CE   ; 
- D 1 - I - 0x00A301 02:A2F1: CF        .byte $CF   ; 
- D 1 - I - 0x00A302 02:A2F2: 00        .byte $00   ; 
- D 1 - I - 0x00A303 02:A2F3: D2        .byte $D2   ; 
- D 1 - I - 0x00A304 02:A2F4: D3        .byte $D3   ; 
- D 1 - I - 0x00A305 02:A2F5: 00        .byte $00   ; 
- D 1 - I - 0x00A306 02:A2F6: 94        .byte $94   ; 
- D 1 - I - 0x00A307 02:A2F7: 93        .byte $93   ; 
- D 1 - I - 0x00A308 02:A2F8: 81        .byte $81   ; 
- D 1 - I - 0x00A309 02:A2F9: D2        .byte $D2   ; 
- D 1 - I - 0x00A30A 02:A2FA: D3        .byte $D3   ; 
- D 1 - I - 0x00A30B 02:A2FB: 00        .byte $00   ; 
- D 1 - I - 0x00A30C 02:A2FC: D2        .byte $D2   ; 
- D 1 - I - 0x00A30D 02:A2FD: D3        .byte $D3   ; 
- D 1 - I - 0x00A30E 02:A2FE: 98        .byte $98   ; 
- D 1 - I - 0x00A30F 02:A2FF: 97        .byte $97   ; 
- D 1 - I - 0x00A310 02:A300: 85        .byte $85   ; 
- D 1 - I - 0x00A311 02:A301: 86        .byte $86   ; 
- D 1 - I - 0x00A312 02:A302: 87        .byte $87   ; 
- D 1 - I - 0x00A313 02:A303: 88        .byte $88   ; 
- D 1 - I - 0x00A314 02:A304: EC        .byte $EC   ; 
- D 1 - I - 0x00A315 02:A305: ED        .byte $ED   ; 
- D 1 - I - 0x00A316 02:A306: 9C        .byte $9C   ; 
- D 1 - I - 0x00A317 02:A307: 9B        .byte $9B   ; 
- D 1 - I - 0x00A318 02:A308: 00        .byte $00   ; 
- D 1 - I - 0x00A319 02:A309: 00        .byte $00   ; 
- D 1 - I - 0x00A31A 02:A30A: 00        .byte $00   ; 
- D 1 - I - 0x00A31B 02:A30B: 12        .byte $12   ; 
- D 1 - I - 0x00A31C 02:A30C: 2F        .byte $2F   ; 
- D 1 - I - 0x00A31D 02:A30D: 38        .byte $38   ; 
- D 1 - I - 0x00A31E 02:A30E: 14        .byte $14   ; 
- D 1 - I - 0x00A31F 02:A30F: 10        .byte $10   ; 
- D 1 - I - 0x00A320 02:A310: 00        .byte $00   ; 
- D 1 - I - 0x00A321 02:A311: 12        .byte $12   ; 
- D 1 - I - 0x00A322 02:A312: 2F        .byte $2F   ; 
- D 1 - I - 0x00A323 02:A313: 38        .byte $38   ; 
- D 1 - I - 0x00A324 02:A314: 34        .byte $34   ; 
- D 1 - I - 0x00A325 02:A315: 39        .byte $39   ; 
- D 1 - I - 0x00A326 02:A316: 31        .byte $31   ; 
- D 1 - I - 0x00A327 02:A317: 32        .byte $32   ; 



_off018_00_A318_0C:
- D 1 - I - 0x00A328 02:A318: C5        .byte $C5   ; 
- D 1 - I - 0x00A329 02:A319: C6        .byte $C6   ; 
- D 1 - I - 0x00A32A 02:A31A: C7        .byte $C7   ; 
- D 1 - I - 0x00A32B 02:A31B: C7        .byte $C7   ; 
- D 1 - I - 0x00A32C 02:A31C: C8        .byte $C8   ; 
- D 1 - I - 0x00A32D 02:A31D: C7        .byte $C7   ; 
- D 1 - I - 0x00A32E 02:A31E: C9        .byte $C9   ; 
- D 1 - I - 0x00A32F 02:A31F: 82        .byte $82   ; 
- D 1 - I - 0x00A330 02:A320: 00        .byte $00   ; 
- D 1 - I - 0x00A331 02:A321: C0        .byte $C0   ; 
- D 1 - I - 0x00A332 02:A322: C1        .byte $C1   ; 
- D 1 - I - 0x00A333 02:A323: C1        .byte $C1   ; 
- D 1 - I - 0x00A334 02:A324: C3        .byte $C3   ; 
- D 1 - I - 0x00A335 02:A325: C4        .byte $C4   ; 
- D 1 - I - 0x00A336 02:A326: 8D        .byte $8D   ; 
- D 1 - I - 0x00A337 02:A327: 00        .byte $00   ; 
- D 1 - I - 0x00A338 02:A328: B9        .byte $B9   ; 
- D 1 - I - 0x00A339 02:A329: BA        .byte $BA   ; 
- D 1 - I - 0x00A33A 02:A32A: BB        .byte $BB   ; 
- D 1 - I - 0x00A33B 02:A32B: BC        .byte $BC   ; 
- D 1 - I - 0x00A33C 02:A32C: BD        .byte $BD   ; 
- D 1 - I - 0x00A33D 02:A32D: BE        .byte $BE   ; 
- D 1 - I - 0x00A33E 02:A32E: BF        .byte $BF   ; 
- D 1 - I - 0x00A33F 02:A32F: 00        .byte $00   ; 
- D 1 - I - 0x00A340 02:A330: 00        .byte $00   ; 
- D 1 - I - 0x00A341 02:A331: B7        .byte $B7   ; 
- D 1 - I - 0x00A342 02:A332: B8        .byte $B8   ; 
- D 1 - I - 0x00A343 02:A333: 00        .byte $00   ; 
- D 1 - I - 0x00A344 02:A334: B7        .byte $B7   ; 
- D 1 - I - 0x00A345 02:A335: B8        .byte $B8   ; 
- D 1 - I - 0x00A346 02:A336: 00        .byte $00   ; 
- D 1 - I - 0x00A347 02:A337: 00        .byte $00   ; 
- D 1 - I - 0x00A348 02:A338: 13        .byte $13   ; 
- D 1 - I - 0x00A349 02:A339: A1        .byte $A1   ; 
- D 1 - I - 0x00A34A 02:A33A: A2        .byte $A2   ; 
- D 1 - I - 0x00A34B 02:A33B: 01        .byte $01   ; 
- D 1 - I - 0x00A34C 02:A33C: 9F        .byte $9F   ; 
- D 1 - I - 0x00A34D 02:A33D: A0        .byte $A0   ; 
- D 1 - I - 0x00A34E 02:A33E: 02        .byte $02   ; 
- D 1 - I - 0x00A34F 02:A33F: 01        .byte $01   ; 
- D 1 - I - 0x00A350 02:A340: 17        .byte $17   ; 
- D 1 - I - 0x00A351 02:A341: 04        .byte $04   ; 
- D 1 - I - 0x00A352 02:A342: 05        .byte $05   ; 
- D 1 - I - 0x00A353 02:A343: 04        .byte $04   ; 
- D 1 - I - 0x00A354 02:A344: 05        .byte $05   ; 
- D 1 - I - 0x00A355 02:A345: 04        .byte $04   ; 
- D 1 - I - 0x00A356 02:A346: 05        .byte $05   ; 
- D 1 - I - 0x00A357 02:A347: 3E        .byte $3E   ; 
- D 1 - I - 0x00A358 02:A348: 11        .byte $11   ; 
- D 1 - I - 0x00A359 02:A349: 08        .byte $08   ; 
- D 1 - I - 0x00A35A 02:A34A: 09        .byte $09   ; 
- D 1 - I - 0x00A35B 02:A34B: 08        .byte $08   ; 
- D 1 - I - 0x00A35C 02:A34C: 09        .byte $09   ; 
- D 1 - I - 0x00A35D 02:A34D: 08        .byte $08   ; 
- D 1 - I - 0x00A35E 02:A34E: 09        .byte $09   ; 
- D 1 - I - 0x00A35F 02:A34F: 3D        .byte $3D   ; 
- D 1 - I - 0x00A360 02:A350: 1C        .byte $1C   ; 
- D 1 - I - 0x00A361 02:A351: 1D        .byte $1D   ; 
- D 1 - I - 0x00A362 02:A352: 3D        .byte $3D   ; 
- D 1 - I - 0x00A363 02:A353: 3D        .byte $3D   ; 
- D 1 - I - 0x00A364 02:A354: 1C        .byte $1C   ; 
- D 1 - I - 0x00A365 02:A355: 1D        .byte $1D   ; 
- D 1 - I - 0x00A366 02:A356: 3D        .byte $3D   ; 
- D 1 - I - 0x00A367 02:A357: 3D        .byte $3D   ; 



_off018_00_A358_0D:
- D 1 - I - 0x00A368 02:A358: 20        .byte $20   ; 
- D 1 - I - 0x00A369 02:A359: 21        .byte $21   ; 
- D 1 - I - 0x00A36A 02:A35A: A3        .byte $A3   ; 
- D 1 - I - 0x00A36B 02:A35B: A4        .byte $A4   ; 
- D 1 - I - 0x00A36C 02:A35C: 01        .byte $01   ; 
- D 1 - I - 0x00A36D 02:A35D: 9F        .byte $9F   ; 
- D 1 - I - 0x00A36E 02:A35E: A0        .byte $A0   ; 
- D 1 - I - 0x00A36F 02:A35F: 02        .byte $02   ; 
- D 1 - I - 0x00A370 02:A360: 24        .byte $24   ; 
- D 1 - I - 0x00A371 02:A361: 25        .byte $25   ; 
- D 1 - I - 0x00A372 02:A362: 26        .byte $26   ; 
- D 1 - I - 0x00A373 02:A363: 27        .byte $27   ; 
- D 1 - I - 0x00A374 02:A364: 03        .byte $03   ; 
- D 1 - I - 0x00A375 02:A365: 05        .byte $05   ; 
- D 1 - I - 0x00A376 02:A366: 04        .byte $04   ; 
- D 1 - I - 0x00A377 02:A367: 05        .byte $05   ; 
- D 1 - I - 0x00A378 02:A368: 28        .byte $28   ; 
- D 1 - I - 0x00A379 02:A369: 29        .byte $29   ; 
- D 1 - I - 0x00A37A 02:A36A: 2A        .byte $2A   ; 
- D 1 - I - 0x00A37B 02:A36B: 2B        .byte $2B   ; 
- D 1 - I - 0x00A37C 02:A36C: 06        .byte $06   ; 
- D 1 - I - 0x00A37D 02:A36D: 07        .byte $07   ; 
- D 1 - I - 0x00A37E 02:A36E: 08        .byte $08   ; 
- D 1 - I - 0x00A37F 02:A36F: 09        .byte $09   ; 
- D 1 - I - 0x00A380 02:A370: 2C        .byte $2C   ; 
- - - - - - 0x00A381 02:A371: 2D        .byte $2D   ; 
- - - - - - 0x00A382 02:A372: 2E        .byte $2E   ; 
- - - - - - 0x00A383 02:A373: 22        .byte $22   ; 
- - - - - - 0x00A384 02:A374: 0A        .byte $0A   ; 
- - - - - - 0x00A385 02:A375: 0B        .byte $0B   ; 
- - - - - - 0x00A386 02:A376: 0C        .byte $0C   ; 
- - - - - - 0x00A387 02:A377: 0D        .byte $0D   ; 
- - - - - - 0x00A388 02:A378: 3D        .byte $3D   ; 
- - - - - - 0x00A389 02:A379: 3D        .byte $3D   ; 
- - - - - - 0x00A38A 02:A37A: 35        .byte $35   ; 
- - - - - - 0x00A38B 02:A37B: 32        .byte $32   ; 
- - - - - - 0x00A38C 02:A37C: 1E        .byte $1E   ; 
- - - - - - 0x00A38D 02:A37D: 3A        .byte $3A   ; 
- - - - - - 0x00A38E 02:A37E: 3B        .byte $3B   ; 
- - - - - - 0x00A38F 02:A37F: 3C        .byte $3C   ; 
- - - - - - 0x00A390 02:A380: 1C        .byte $1C   ; 
- - - - - - 0x00A391 02:A381: 1D        .byte $1D   ; 
- - - - - - 0x00A392 02:A382: 36        .byte $36   ; 
- - - - - - 0x00A393 02:A383: 33        .byte $33   ; 
- - - - - - 0x00A394 02:A384: 1E        .byte $1E   ; 
- - - - - - 0x00A395 02:A385: 3A        .byte $3A   ; 
- - - - - - 0x00A396 02:A386: 3B        .byte $3B   ; 
- - - - - - 0x00A397 02:A387: 3C        .byte $3C   ; 
- - - - - - 0x00A398 02:A388: 1E        .byte $1E   ; 
- - - - - - 0x00A399 02:A389: 1F        .byte $1F   ; 
- - - - - - 0x00A39A 02:A38A: 36        .byte $36   ; 
- - - - - - 0x00A39B 02:A38B: 33        .byte $33   ; 
- - - - - - 0x00A39C 02:A38C: 1E        .byte $1E   ; 
- - - - - - 0x00A39D 02:A38D: 3A        .byte $3A   ; 
- - - - - - 0x00A39E 02:A38E: 3B        .byte $3B   ; 
- - - - - - 0x00A39F 02:A38F: 3C        .byte $3C   ; 
- - - - - - 0x00A3A0 02:A390: 1E        .byte $1E   ; 
- - - - - - 0x00A3A1 02:A391: 1F        .byte $1F   ; 
- - - - - - 0x00A3A2 02:A392: 36        .byte $36   ; 
- - - - - - 0x00A3A3 02:A393: 33        .byte $33   ; 
- - - - - - 0x00A3A4 02:A394: 1E        .byte $1E   ; 
- - - - - - 0x00A3A5 02:A395: 3A        .byte $3A   ; 
- - - - - - 0x00A3A6 02:A396: 3B        .byte $3B   ; 
- - - - - - 0x00A3A7 02:A397: 3C        .byte $3C   ; 



_off018_00_A398_0E:
- - - - - - 0x00A3A8 02:A398: 00        .byte $00   ; 
- - - - - - 0x00A3A9 02:A399: 00        .byte $00   ; 
- - - - - - 0x00A3AA 02:A39A: 00        .byte $00   ; 
- - - - - - 0x00A3AB 02:A39B: 00        .byte $00   ; 
- - - - - - 0x00A3AC 02:A39C: 00        .byte $00   ; 
- - - - - - 0x00A3AD 02:A39D: 00        .byte $00   ; 
- - - - - - 0x00A3AE 02:A39E: 00        .byte $00   ; 
- - - - - - 0x00A3AF 02:A39F: 00        .byte $00   ; 
- - - - - - 0x00A3B0 02:A3A0: 00        .byte $00   ; 
- - - - - - 0x00A3B1 02:A3A1: 00        .byte $00   ; 
- - - - - - 0x00A3B2 02:A3A2: 00        .byte $00   ; 
- - - - - - 0x00A3B3 02:A3A3: 00        .byte $00   ; 
- - - - - - 0x00A3B4 02:A3A4: 00        .byte $00   ; 
- - - - - - 0x00A3B5 02:A3A5: 00        .byte $00   ; 
- - - - - - 0x00A3B6 02:A3A6: 00        .byte $00   ; 
- - - - - - 0x00A3B7 02:A3A7: 00        .byte $00   ; 
- - - - - - 0x00A3B8 02:A3A8: 00        .byte $00   ; 
- - - - - - 0x00A3B9 02:A3A9: 00        .byte $00   ; 
- - - - - - 0x00A3BA 02:A3AA: 00        .byte $00   ; 
- - - - - - 0x00A3BB 02:A3AB: 00        .byte $00   ; 
- - - - - - 0x00A3BC 02:A3AC: 00        .byte $00   ; 
- - - - - - 0x00A3BD 02:A3AD: 00        .byte $00   ; 
- - - - - - 0x00A3BE 02:A3AE: 00        .byte $00   ; 
- D 1 - I - 0x00A3BF 02:A3AF: 00        .byte $00   ; 
- D 1 - I - 0x00A3C0 02:A3B0: 00        .byte $00   ; 
- D 1 - I - 0x00A3C1 02:A3B1: B3        .byte $B3   ; 
- D 1 - I - 0x00A3C2 02:A3B2: B4        .byte $B4   ; 
- D 1 - I - 0x00A3C3 02:A3B3: B5        .byte $B5   ; 
- D 1 - I - 0x00A3C4 02:A3B4: B5        .byte $B5   ; 
- D 1 - I - 0x00A3C5 02:A3B5: B5        .byte $B5   ; 
- D 1 - I - 0x00A3C6 02:A3B6: B5        .byte $B5   ; 
- D 1 - I - 0x00A3C7 02:A3B7: B6        .byte $B6   ; 
- D 1 - I - 0x00A3C8 02:A3B8: 81        .byte $81   ; 
- D 1 - I - 0x00A3C9 02:A3B9: 8B        .byte $8B   ; 
- D 1 - I - 0x00A3CA 02:A3BA: AF        .byte $AF   ; 
- D 1 - I - 0x00A3CB 02:A3BB: B0        .byte $B0   ; 
- D 1 - I - 0x00A3CC 02:A3BC: B0        .byte $B0   ; 
- D 1 - I - 0x00A3CD 02:A3BD: B1        .byte $B1   ; 
- D 1 - I - 0x00A3CE 02:A3BE: B2        .byte $B2   ; 
- D 1 - I - 0x00A3CF 02:A3BF: D6        .byte $D6   ; 
- D 1 - I - 0x00A3D0 02:A3C0: 85        .byte $85   ; 
- D 1 - I - 0x00A3D1 02:A3C1: 83        .byte $83   ; 
- D 1 - I - 0x00A3D2 02:A3C2: AA        .byte $AA   ; 
- D 1 - I - 0x00A3D3 02:A3C3: AB        .byte $AB   ; 
- D 1 - I - 0x00A3D4 02:A3C4: AB        .byte $AB   ; 
- D 1 - I - 0x00A3D5 02:A3C5: AC        .byte $AC   ; 
- D 1 - I - 0x00A3D6 02:A3C6: AD        .byte $AD   ; 
- D 1 - I - 0x00A3D7 02:A3C7: AE        .byte $AE   ; 
- D 1 - I - 0x00A3D8 02:A3C8: 00        .byte $00   ; 
- D 1 - I - 0x00A3D9 02:A3C9: 00        .byte $00   ; 
- D 1 - I - 0x00A3DA 02:A3CA: A7        .byte $A7   ; 
- D 1 - I - 0x00A3DB 02:A3CB: A8        .byte $A8   ; 
- D 1 - I - 0x00A3DC 02:A3CC: 00        .byte $00   ; 
- D 1 - I - 0x00A3DD 02:A3CD: A7        .byte $A7   ; 
- D 1 - I - 0x00A3DE 02:A3CE: A8        .byte $A8   ; 
- D 1 - I - 0x00A3DF 02:A3CF: 00        .byte $00   ; 
- D 1 - I - 0x00A3E0 02:A3D0: 00        .byte $00   ; 
- D 1 - I - 0x00A3E1 02:A3D1: 00        .byte $00   ; 
- D 1 - I - 0x00A3E2 02:A3D2: A5        .byte $A5   ; 
- D 1 - I - 0x00A3E3 02:A3D3: A6        .byte $A6   ; 
- D 1 - I - 0x00A3E4 02:A3D4: 00        .byte $00   ; 
- D 1 - I - 0x00A3E5 02:A3D5: A5        .byte $A5   ; 
- D 1 - I - 0x00A3E6 02:A3D6: A6        .byte $A6   ; 
- D 1 - I - 0x00A3E7 02:A3D7: 00        .byte $00   ; 



_off018_00_A3D8_0F:
- D 1 - I - 0x00A3E8 02:A3D8: C5        .byte $C5   ; 
- D 1 - I - 0x00A3E9 02:A3D9: C6        .byte $C6   ; 
- D 1 - I - 0x00A3EA 02:A3DA: C7        .byte $C7   ; 
- D 1 - I - 0x00A3EB 02:A3DB: C7        .byte $C7   ; 
- D 1 - I - 0x00A3EC 02:A3DC: C8        .byte $C8   ; 
- D 1 - I - 0x00A3ED 02:A3DD: C7        .byte $C7   ; 
- D 1 - I - 0x00A3EE 02:A3DE: CA        .byte $CA   ; 
- D 1 - I - 0x00A3EF 02:A3DF: 00        .byte $00   ; 
- D 1 - I - 0x00A3F0 02:A3E0: 00        .byte $00   ; 
- D 1 - I - 0x00A3F1 02:A3E1: C0        .byte $C0   ; 
- D 1 - I - 0x00A3F2 02:A3E2: C1        .byte $C1   ; 
- D 1 - I - 0x00A3F3 02:A3E3: C1        .byte $C1   ; 
- D 1 - I - 0x00A3F4 02:A3E4: C3        .byte $C3   ; 
- D 1 - I - 0x00A3F5 02:A3E5: C4        .byte $C4   ; 
- D 1 - I - 0x00A3F6 02:A3E6: 00        .byte $00   ; 
- D 1 - I - 0x00A3F7 02:A3E7: 00        .byte $00   ; 
- D 1 - I - 0x00A3F8 02:A3E8: B9        .byte $B9   ; 
- D 1 - I - 0x00A3F9 02:A3E9: BA        .byte $BA   ; 
- D 1 - I - 0x00A3FA 02:A3EA: BB        .byte $BB   ; 
- D 1 - I - 0x00A3FB 02:A3EB: BC        .byte $BC   ; 
- D 1 - I - 0x00A3FC 02:A3EC: BD        .byte $BD   ; 
- D 1 - I - 0x00A3FD 02:A3ED: BE        .byte $BE   ; 
- D 1 - I - 0x00A3FE 02:A3EE: BF        .byte $BF   ; 
- D 1 - I - 0x00A3FF 02:A3EF: 00        .byte $00   ; 
- D 1 - I - 0x00A400 02:A3F0: 00        .byte $00   ; 
- D 1 - I - 0x00A401 02:A3F1: B7        .byte $B7   ; 
- D 1 - I - 0x00A402 02:A3F2: B8        .byte $B8   ; 
- D 1 - I - 0x00A403 02:A3F3: 00        .byte $00   ; 
- D 1 - I - 0x00A404 02:A3F4: B7        .byte $B7   ; 
- D 1 - I - 0x00A405 02:A3F5: B8        .byte $B8   ; 
- D 1 - I - 0x00A406 02:A3F6: 00        .byte $00   ; 
- D 1 - I - 0x00A407 02:A3F7: 00        .byte $00   ; 
- D 1 - I - 0x00A408 02:A3F8: 13        .byte $13   ; 
- D 1 - I - 0x00A409 02:A3F9: A1        .byte $A1   ; 
- D 1 - I - 0x00A40A 02:A3FA: A2        .byte $A2   ; 
- D 1 - I - 0x00A40B 02:A3FB: 01        .byte $01   ; 
- D 1 - I - 0x00A40C 02:A3FC: 9F        .byte $9F   ; 
- D 1 - I - 0x00A40D 02:A3FD: A0        .byte $A0   ; 
- D 1 - I - 0x00A40E 02:A3FE: 02        .byte $02   ; 
- D 1 - I - 0x00A40F 02:A3FF: 01        .byte $01   ; 
- D 1 - I - 0x00A410 02:A400: 17        .byte $17   ; 
- D 1 - I - 0x00A411 02:A401: 04        .byte $04   ; 
- D 1 - I - 0x00A412 02:A402: 05        .byte $05   ; 
- D 1 - I - 0x00A413 02:A403: 04        .byte $04   ; 
- D 1 - I - 0x00A414 02:A404: 05        .byte $05   ; 
- D 1 - I - 0x00A415 02:A405: 04        .byte $04   ; 
- D 1 - I - 0x00A416 02:A406: 05        .byte $05   ; 
- D 1 - I - 0x00A417 02:A407: 03        .byte $03   ; 
- D 1 - I - 0x00A418 02:A408: 11        .byte $11   ; 
- D 1 - I - 0x00A419 02:A409: 08        .byte $08   ; 
- D 1 - I - 0x00A41A 02:A40A: 09        .byte $09   ; 
- D 1 - I - 0x00A41B 02:A40B: 08        .byte $08   ; 
- D 1 - I - 0x00A41C 02:A40C: 09        .byte $09   ; 
- D 1 - I - 0x00A41D 02:A40D: 08        .byte $08   ; 
- D 1 - I - 0x00A41E 02:A40E: 09        .byte $09   ; 
- D 1 - I - 0x00A41F 02:A40F: 06        .byte $06   ; 
- D 1 - I - 0x00A420 02:A410: 1C        .byte $1C   ; 
- D 1 - I - 0x00A421 02:A411: 1D        .byte $1D   ; 
- D 1 - I - 0x00A422 02:A412: 3D        .byte $3D   ; 
- D 1 - I - 0x00A423 02:A413: 3D        .byte $3D   ; 
- D 1 - I - 0x00A424 02:A414: 1C        .byte $1C   ; 
- D 1 - I - 0x00A425 02:A415: 1D        .byte $1D   ; 
- D 1 - I - 0x00A426 02:A416: 3D        .byte $3D   ; 
- D 1 - I - 0x00A427 02:A417: 0A        .byte $0A   ; 



_off018_00_A418_10:
- D 1 - I - 0x00A428 02:A418: 00        .byte $00   ; 
- D 1 - I - 0x00A429 02:A419: 00        .byte $00   ; 
- D 1 - I - 0x00A42A 02:A41A: 00        .byte $00   ; 
- D 1 - I - 0x00A42B 02:A41B: 00        .byte $00   ; 
- D 1 - I - 0x00A42C 02:A41C: 00        .byte $00   ; 
- D 1 - I - 0x00A42D 02:A41D: 00        .byte $00   ; 
- D 1 - I - 0x00A42E 02:A41E: 00        .byte $00   ; 
- D 1 - I - 0x00A42F 02:A41F: 00        .byte $00   ; 
- D 1 - I - 0x00A430 02:A420: 00        .byte $00   ; 
- D 1 - I - 0x00A431 02:A421: 00        .byte $00   ; 
- D 1 - I - 0x00A432 02:A422: 00        .byte $00   ; 
- D 1 - I - 0x00A433 02:A423: 00        .byte $00   ; 
- D 1 - I - 0x00A434 02:A424: 00        .byte $00   ; 
- D 1 - I - 0x00A435 02:A425: 00        .byte $00   ; 
- D 1 - I - 0x00A436 02:A426: 00        .byte $00   ; 
- D 1 - I - 0x00A437 02:A427: 00        .byte $00   ; 
- D 1 - I - 0x00A438 02:A428: 00        .byte $00   ; 
- D 1 - I - 0x00A439 02:A429: 00        .byte $00   ; 
- D 1 - I - 0x00A43A 02:A42A: 00        .byte $00   ; 
- D 1 - I - 0x00A43B 02:A42B: 00        .byte $00   ; 
- D 1 - I - 0x00A43C 02:A42C: 00        .byte $00   ; 
- D 1 - I - 0x00A43D 02:A42D: 00        .byte $00   ; 
- D 1 - I - 0x00A43E 02:A42E: 00        .byte $00   ; 
- D 1 - I - 0x00A43F 02:A42F: 00        .byte $00   ; 
- D 1 - I - 0x00A440 02:A430: 00        .byte $00   ; 
- D 1 - I - 0x00A441 02:A431: 00        .byte $00   ; 
- D 1 - I - 0x00A442 02:A432: 00        .byte $00   ; 
- D 1 - I - 0x00A443 02:A433: 00        .byte $00   ; 
- D 1 - I - 0x00A444 02:A434: 00        .byte $00   ; 
- D 1 - I - 0x00A445 02:A435: 00        .byte $00   ; 
- D 1 - I - 0x00A446 02:A436: 00        .byte $00   ; 
- D 1 - I - 0x00A447 02:A437: 00        .byte $00   ; 
- D 1 - I - 0x00A448 02:A438: 02        .byte $02   ; 
- D 1 - I - 0x00A449 02:A439: 20        .byte $20   ; 
- D 1 - I - 0x00A44A 02:A43A: 21        .byte $21   ; 
- D 1 - I - 0x00A44B 02:A43B: 21        .byte $21   ; 
- D 1 - I - 0x00A44C 02:A43C: 23        .byte $23   ; 
- D 1 - I - 0x00A44D 02:A43D: 01        .byte $01   ; 
- D 1 - I - 0x00A44E 02:A43E: 01        .byte $01   ; 
- D 1 - I - 0x00A44F 02:A43F: 02        .byte $02   ; 
- D 1 - I - 0x00A450 02:A440: 05        .byte $05   ; 
- D 1 - I - 0x00A451 02:A441: 24        .byte $24   ; 
- D 1 - I - 0x00A452 02:A442: 25        .byte $25   ; 
- D 1 - I - 0x00A453 02:A443: 26        .byte $26   ; 
- D 1 - I - 0x00A454 02:A444: 27        .byte $27   ; 
- D 1 - I - 0x00A455 02:A445: 3E        .byte $3E   ; 
- D 1 - I - 0x00A456 02:A446: 04        .byte $04   ; 
- D 1 - I - 0x00A457 02:A447: 05        .byte $05   ; 
- D 1 - I - 0x00A458 02:A448: 07        .byte $07   ; 
- D 1 - I - 0x00A459 02:A449: 28        .byte $28   ; 
- D 1 - I - 0x00A45A 02:A44A: 29        .byte $29   ; 
- D 1 - I - 0x00A45B 02:A44B: 2A        .byte $2A   ; 
- D 1 - I - 0x00A45C 02:A44C: 2B        .byte $2B   ; 
- D 1 - I - 0x00A45D 02:A44D: 3D        .byte $3D   ; 
- D 1 - I - 0x00A45E 02:A44E: 08        .byte $08   ; 
- D 1 - I - 0x00A45F 02:A44F: 09        .byte $09   ; 
- - - - - - 0x00A460 02:A450: 0B        .byte $0B   ; 
- - - - - - 0x00A461 02:A451: 0C        .byte $0C   ; 
- - - - - - 0x00A462 02:A452: 2D        .byte $2D   ; 
- - - - - - 0x00A463 02:A453: 2E        .byte $2E   ; 
- - - - - - 0x00A464 02:A454: 22        .byte $22   ; 
- - - - - - 0x00A465 02:A455: 1C        .byte $1C   ; 
- - - - - - 0x00A466 02:A456: 1D        .byte $1D   ; 
- - - - - - 0x00A467 02:A457: 0D        .byte $0D   ; 



_off018_00_A458_11:
- D 1 - I - 0x00A468 02:A458: CE        .byte $CE   ; 
- D 1 - I - 0x00A469 02:A459: CF        .byte $CF   ; 
- D 1 - I - 0x00A46A 02:A45A: D2        .byte $D2   ; 
- D 1 - I - 0x00A46B 02:A45B: D3        .byte $D3   ; 
- D 1 - I - 0x00A46C 02:A45C: DC        .byte $DC   ; 
- D 1 - I - 0x00A46D 02:A45D: D9        .byte $D9   ; 
- D 1 - I - 0x00A46E 02:A45E: DA        .byte $DA   ; 
- D 1 - I - 0x00A46F 02:A45F: DB        .byte $DB   ; 
- D 1 - I - 0x00A470 02:A460: D6        .byte $D6   ; 
- D 1 - I - 0x00A471 02:A461: 81        .byte $81   ; 
- D 1 - I - 0x00A472 02:A462: CB        .byte $CB   ; 
- D 1 - I - 0x00A473 02:A463: CD        .byte $CD   ; 
- D 1 - I - 0x00A474 02:A464: DC        .byte $DC   ; 
- D 1 - I - 0x00A475 02:A465: DD        .byte $DD   ; 
- D 1 - I - 0x00A476 02:A466: DD        .byte $DD   ; 
- D 1 - I - 0x00A477 02:A467: DE        .byte $DE   ; 
- D 1 - I - 0x00A478 02:A468: 84        .byte $84   ; 
- D 1 - I - 0x00A479 02:A469: 85        .byte $85   ; 
- D 1 - I - 0x00A47A 02:A46A: 86        .byte $86   ; 
- D 1 - I - 0x00A47B 02:A46B: 87        .byte $87   ; 
- D 1 - I - 0x00A47C 02:A46C: D8        .byte $D8   ; 
- D 1 - I - 0x00A47D 02:A46D: E0        .byte $E0   ; 
- D 1 - I - 0x00A47E 02:A46E: DD        .byte $DD   ; 
- D 1 - I - 0x00A47F 02:A46F: DE        .byte $DE   ; 
- D 1 - I - 0x00A480 02:A470: D4        .byte $D4   ; 
- D 1 - I - 0x00A481 02:A471: 92        .byte $92   ; 
- D 1 - I - 0x00A482 02:A472: 92        .byte $92   ; 
- D 1 - I - 0x00A483 02:A473: 93        .byte $93   ; 
- D 1 - I - 0x00A484 02:A474: D7        .byte $D7   ; 
- D 1 - I - 0x00A485 02:A475: E1        .byte $E1   ; 
- D 1 - I - 0x00A486 02:A476: EB        .byte $EB   ; 
- D 1 - I - 0x00A487 02:A477: DB        .byte $DB   ; 
- D 1 - I - 0x00A488 02:A478: A1        .byte $A1   ; 
- D 1 - I - 0x00A489 02:A479: A2        .byte $A2   ; 
- D 1 - I - 0x00A48A 02:A47A: A1        .byte $A1   ; 
- D 1 - I - 0x00A48B 02:A47B: A2        .byte $A2   ; 
- D 1 - I - 0x00A48C 02:A47C: E7        .byte $E7   ; 
- D 1 - I - 0x00A48D 02:A47D: E2        .byte $E2   ; 
- D 1 - I - 0x00A48E 02:A47E: EB        .byte $EB   ; 
- D 1 - I - 0x00A48F 02:A47F: DE        .byte $DE   ; 
- D 1 - I - 0x00A490 02:A480: 03        .byte $03   ; 
- D 1 - I - 0x00A491 02:A481: 05        .byte $05   ; 
- D 1 - I - 0x00A492 02:A482: 04        .byte $04   ; 
- D 1 - I - 0x00A493 02:A483: 05        .byte $05   ; 
- D 1 - I - 0x00A494 02:A484: 03        .byte $03   ; 
- D 1 - I - 0x00A495 02:A485: E3        .byte $E3   ; 
- D 1 - I - 0x00A496 02:A486: E4        .byte $E4   ; 
- D 1 - I - 0x00A497 02:A487: DF        .byte $DF   ; 
- D 1 - I - 0x00A498 02:A488: 06        .byte $06   ; 
- D 1 - I - 0x00A499 02:A489: 07        .byte $07   ; 
- D 1 - I - 0x00A49A 02:A48A: 08        .byte $08   ; 
- D 1 - I - 0x00A49B 02:A48B: 09        .byte $09   ; 
- D 1 - I - 0x00A49C 02:A48C: 06        .byte $06   ; 
- D 1 - I - 0x00A49D 02:A48D: 07        .byte $07   ; 
- D 1 - I - 0x00A49E 02:A48E: E5        .byte $E5   ; 
- D 1 - I - 0x00A49F 02:A48F: DB        .byte $DB   ; 
- - - - - - 0x00A4A0 02:A490: 0A        .byte $0A   ; 
- - - - - - 0x00A4A1 02:A491: 0B        .byte $0B   ; 
- - - - - - 0x00A4A2 02:A492: 0C        .byte $0C   ; 
- - - - - - 0x00A4A3 02:A493: 0D        .byte $0D   ; 
- - - - - - 0x00A4A4 02:A494: 0A        .byte $0A   ; 
- - - - - - 0x00A4A5 02:A495: 0B        .byte $0B   ; 
- - - - - - 0x00A4A6 02:A496: E6        .byte $E6   ; 
- - - - - - 0x00A4A7 02:A497: DE        .byte $DE   ; 



_off018_00_A498_12:
- D 1 - I - 0x00A4A8 02:A498: 00        .byte $00   ; 
- D 1 - I - 0x00A4A9 02:A499: 00        .byte $00   ; 
- - - - - - 0x00A4AA 02:A49A: 00        .byte $00   ; 
- - - - - - 0x00A4AB 02:A49B: 00        .byte $00   ; 
- - - - - - 0x00A4AC 02:A49C: 00        .byte $00   ; 
- - - - - - 0x00A4AD 02:A49D: 00        .byte $00   ; 
- - - - - - 0x00A4AE 02:A49E: 00        .byte $00   ; 
- - - - - - 0x00A4AF 02:A49F: 00        .byte $00   ; 
- D 1 - I - 0x00A4B0 02:A4A0: 00        .byte $00   ; 
- D 1 - I - 0x00A4B1 02:A4A1: 00        .byte $00   ; 
- - - - - - 0x00A4B2 02:A4A2: 00        .byte $00   ; 
- - - - - - 0x00A4B3 02:A4A3: 00        .byte $00   ; 
- - - - - - 0x00A4B4 02:A4A4: 00        .byte $00   ; 
- - - - - - 0x00A4B5 02:A4A5: 00        .byte $00   ; 
- - - - - - 0x00A4B6 02:A4A6: 00        .byte $00   ; 
- - - - - - 0x00A4B7 02:A4A7: 00        .byte $00   ; 
- D 1 - I - 0x00A4B8 02:A4A8: D2        .byte $D2   ; 
- D 1 - I - 0x00A4B9 02:A4A9: D3        .byte $D3   ; 
- - - - - - 0x00A4BA 02:A4AA: 00        .byte $00   ; 
- - - - - - 0x00A4BB 02:A4AB: 00        .byte $00   ; 
- - - - - - 0x00A4BC 02:A4AC: 00        .byte $00   ; 
- - - - - - 0x00A4BD 02:A4AD: 00        .byte $00   ; 
- - - - - - 0x00A4BE 02:A4AE: 00        .byte $00   ; 
- - - - - - 0x00A4BF 02:A4AF: 00        .byte $00   ; 
- D 1 - I - 0x00A4C0 02:A4B0: CD        .byte $CD   ; 
- D 1 - I - 0x00A4C1 02:A4B1: 00        .byte $00   ; 
- - - - - - 0x00A4C2 02:A4B2: CE        .byte $CE   ; 
- - - - - - 0x00A4C3 02:A4B3: CF        .byte $CF   ; 
- - - - - - 0x00A4C4 02:A4B4: 00        .byte $00   ; 
- - - - - - 0x00A4C5 02:A4B5: 00        .byte $00   ; 
- - - - - - 0x00A4C6 02:A4B6: 00        .byte $00   ; 
- - - - - - 0x00A4C7 02:A4B7: 00        .byte $00   ; 
- D 1 - I - 0x00A4C8 02:A4B8: 5F        .byte $5F   ; 
- D 1 - I - 0x00A4C9 02:A4B9: 5F        .byte $5F   ; 
- D 1 - I - 0x00A4CA 02:A4BA: 5F        .byte $5F   ; 
- - - - - - 0x00A4CB 02:A4BB: 5F        .byte $5F   ; 
- - - - - - 0x00A4CC 02:A4BC: 00        .byte $00   ; 
- - - - - - 0x00A4CD 02:A4BD: 00        .byte $00   ; 
- - - - - - 0x00A4CE 02:A4BE: 00        .byte $00   ; 
- - - - - - 0x00A4CF 02:A4BF: 00        .byte $00   ; 
- D 1 - I - 0x00A4D0 02:A4C0: 66        .byte $66   ; 
- D 1 - I - 0x00A4D1 02:A4C1: 66        .byte $66   ; 
- D 1 - I - 0x00A4D2 02:A4C2: 66        .byte $66   ; 
- - - - - - 0x00A4D3 02:A4C3: 66        .byte $66   ; 
- - - - - - 0x00A4D4 02:A4C4: 00        .byte $00   ; 
- - - - - - 0x00A4D5 02:A4C5: 00        .byte $00   ; 
- - - - - - 0x00A4D6 02:A4C6: 00        .byte $00   ; 
- - - - - - 0x00A4D7 02:A4C7: 00        .byte $00   ; 
- D 1 - I - 0x00A4D8 02:A4C8: 4C        .byte $4C   ; 
- D 1 - I - 0x00A4D9 02:A4C9: 4D        .byte $4D   ; 
- D 1 - I - 0x00A4DA 02:A4CA: 4C        .byte $4C   ; 
- - - - - - 0x00A4DB 02:A4CB: 4D        .byte $4D   ; 
- - - - - - 0x00A4DC 02:A4CC: 00        .byte $00   ; 
- - - - - - 0x00A4DD 02:A4CD: 00        .byte $00   ; 
- - - - - - 0x00A4DE 02:A4CE: 00        .byte $00   ; 
- - - - - - 0x00A4DF 02:A4CF: 00        .byte $00   ; 
- D 1 - I - 0x00A4E0 02:A4D0: 00        .byte $00   ; 
- D 1 - I - 0x00A4E1 02:A4D1: 00        .byte $00   ; 
- D 1 - I - 0x00A4E2 02:A4D2: 00        .byte $00   ; 
- D 1 - I - 0x00A4E3 02:A4D3: 00        .byte $00   ; 
- D 1 - I - 0x00A4E4 02:A4D4: 00        .byte $00   ; 
- D 1 - I - 0x00A4E5 02:A4D5: 00        .byte $00   ; 
- D 1 - I - 0x00A4E6 02:A4D6: 00        .byte $00   ; 
- D 1 - I - 0x00A4E7 02:A4D7: 00        .byte $00   ; 



_off006_0x00A4E8_00_area_1:
- D 1 - I - 0x00A4E8 02:A4D8: 00        .byte $00   ; 
- D 1 - I - 0x00A4E9 02:A4D9: 00        .byte $00   ; 
- D 1 - I - 0x00A4EA 02:A4DA: 00        .byte $00   ; 
- D 1 - I - 0x00A4EB 02:A4DB: 00        .byte $00   ; 
- D 1 - I - 0x00A4EC 02:A4DC: 00        .byte $00   ; 
- D 1 - I - 0x00A4ED 02:A4DD: 00        .byte $00   ; 
- D 1 - I - 0x00A4EE 02:A4DE: 00        .byte $00   ; 
- D 1 - I - 0x00A4EF 02:A4DF: 00        .byte $00   ; 
- D 1 - I - 0x00A4F0 02:A4E0: 00        .byte $00   ; 
- D 1 - I - 0x00A4F1 02:A4E1: 00        .byte $00   ; 
- D 1 - I - 0x00A4F2 02:A4E2: 00        .byte $00   ; 
- D 1 - I - 0x00A4F3 02:A4E3: 00        .byte $00   ; 
- D 1 - I - 0x00A4F4 02:A4E4: 00        .byte $00   ; 
- D 1 - I - 0x00A4F5 02:A4E5: 00        .byte $00   ; 
- D 1 - I - 0x00A4F6 02:A4E6: 00        .byte $00   ; 
- D 1 - I - 0x00A4F7 02:A4E7: 00        .byte $00   ; 
- D 1 - I - 0x00A4F8 02:A4E8: 00        .byte $00   ; 
- D 1 - I - 0x00A4F9 02:A4E9: 00        .byte $00   ; 
- D 1 - I - 0x00A4FA 02:A4EA: 00        .byte $00   ; 
- D 1 - I - 0x00A4FB 02:A4EB: 00        .byte $00   ; 
- D 1 - I - 0x00A4FC 02:A4EC: 00        .byte $00   ; 
- D 1 - I - 0x00A4FD 02:A4ED: 00        .byte $00   ; 
- D 1 - I - 0x00A4FE 02:A4EE: 00        .byte $00   ; 
- D 1 - I - 0x00A4FF 02:A4EF: 00        .byte $00   ; 
- D 1 - I - 0x00A500 02:A4F0: 00        .byte $00   ; 
- D 1 - I - 0x00A501 02:A4F1: 00        .byte $00   ; 
- D 1 - I - 0x00A502 02:A4F2: 00        .byte $00   ; 
- D 1 - I - 0x00A503 02:A4F3: 00        .byte $00   ; 
- D 1 - I - 0x00A504 02:A4F4: F7        .byte $F7   ; 
- D 1 - I - 0x00A505 02:A4F5: F7        .byte $F7   ; 
- D 1 - I - 0x00A506 02:A4F6: F7        .byte $F7   ; 
- D 1 - I - 0x00A507 02:A4F7: F7        .byte $F7   ; 
- D 1 - I - 0x00A508 02:A4F8: 00        .byte $00   ; 
- D 1 - I - 0x00A509 02:A4F9: 00        .byte $00   ; 
- D 1 - I - 0x00A50A 02:A4FA: 00        .byte $00   ; 
- D 1 - I - 0x00A50B 02:A4FB: 00        .byte $00   ; 
- D 1 - I - 0x00A50C 02:A4FC: 00        .byte $00   ; 
- D 1 - I - 0x00A50D 02:A4FD: 00        .byte $00   ; 
- D 1 - I - 0x00A50E 02:A4FE: 00        .byte $00   ; 
- D 1 - I - 0x00A50F 02:A4FF: 00        .byte $00   ; 
- D 1 - I - 0x00A510 02:A500: 00        .byte $00   ; 
- D 1 - I - 0x00A511 02:A501: 00        .byte $00   ; 
- D 1 - I - 0x00A512 02:A502: 00        .byte $00   ; 
- D 1 - I - 0x00A513 02:A503: 00        .byte $00   ; 
- D 1 - I - 0x00A514 02:A504: DF        .byte $DF   ; 
- D 1 - I - 0x00A515 02:A505: F7        .byte $F7   ; 
- D 1 - I - 0x00A516 02:A506: F7        .byte $F7   ; 
- D 1 - I - 0x00A517 02:A507: F7        .byte $F7   ; 
- D 1 - I - 0x00A518 02:A508: BD        .byte $BD   ; 
- D 1 - I - 0x00A519 02:A509: BD        .byte $BD   ; 
- D 1 - I - 0x00A51A 02:A50A: BD        .byte $BD   ; 
- D 1 - I - 0x00A51B 02:A50B: BD        .byte $BD   ; 
- D 1 - I - 0x00A51C 02:A50C: BD        .byte $BD   ; 
- D 1 - I - 0x00A51D 02:A50D: BD        .byte $BD   ; 
- D 1 - I - 0x00A51E 02:A50E: BD        .byte $BD   ; 
- D 1 - I - 0x00A51F 02:A50F: BD        .byte $BD   ; 
- D 1 - I - 0x00A520 02:A510: C0        .byte $C0   ; 
- D 1 - I - 0x00A521 02:A511: C0        .byte $C0   ; 
- D 1 - I - 0x00A522 02:A512: C0        .byte $C0   ; 
- D 1 - I - 0x00A523 02:A513: C0        .byte $C0   ; 
- D 1 - I - 0x00A524 02:A514: 9D        .byte $9D   ; 
- D 1 - I - 0x00A525 02:A515: 9E        .byte $9E   ; 
- D 1 - I - 0x00A526 02:A516: 9E        .byte $9E   ; 
- D 1 - I - 0x00A527 02:A517: E6        .byte $E6   ; 
- D 1 - I - 0x00A528 02:A518: BD        .byte $BD   ; 
- D 1 - I - 0x00A529 02:A519: BD        .byte $BD   ; 
- D 1 - I - 0x00A52A 02:A51A: BD        .byte $BD   ; 
- D 1 - I - 0x00A52B 02:A51B: BD        .byte $BD   ; 
- D 1 - I - 0x00A52C 02:A51C: BD        .byte $BD   ; 
- D 1 - I - 0x00A52D 02:A51D: BD        .byte $BD   ; 
- D 1 - I - 0x00A52E 02:A51E: BD        .byte $BD   ; 
- D 1 - I - 0x00A52F 02:A51F: BD        .byte $BD   ; 
- D 1 - I - 0x00A530 02:A520: C0        .byte $C0   ; 
- D 1 - I - 0x00A531 02:A521: C0        .byte $C0   ; 
- D 1 - I - 0x00A532 02:A522: C0        .byte $C0   ; 
- D 1 - I - 0x00A533 02:A523: C0        .byte $C0   ; 
- D 1 - I - 0x00A534 02:A524: 9D        .byte $9D   ; 
- D 1 - I - 0x00A535 02:A525: 9E        .byte $9E   ; 
- D 1 - I - 0x00A536 02:A526: 9E        .byte $9E   ; 
- D 1 - I - 0x00A537 02:A527: E5        .byte $E5   ; 
- D 1 - I - 0x00A538 02:A528: BE        .byte $BE   ; 
- D 1 - I - 0x00A539 02:A529: E0        .byte $E0   ; 
- D 1 - I - 0x00A53A 02:A52A: BD        .byte $BD   ; 
- D 1 - I - 0x00A53B 02:A52B: BD        .byte $BD   ; 
- D 1 - I - 0x00A53C 02:A52C: BD        .byte $BD   ; 
- D 1 - I - 0x00A53D 02:A52D: BE        .byte $BE   ; 
- D 1 - I - 0x00A53E 02:A52E: E0        .byte $E0   ; 
- D 1 - I - 0x00A53F 02:A52F: BD        .byte $BD   ; 
- D 1 - I - 0x00A540 02:A530: C0        .byte $C0   ; 
- D 1 - I - 0x00A541 02:A531: C0        .byte $C0   ; 
- D 1 - I - 0x00A542 02:A532: A7        .byte $A7   ; 
- D 1 - I - 0x00A543 02:A533: E1        .byte $E1   ; 
- D 1 - I - 0x00A544 02:A534: B9        .byte $B9   ; 
- D 1 - I - 0x00A545 02:A535: E7        .byte $E7   ; 
- D 1 - I - 0x00A546 02:A536: 9E        .byte $9E   ; 
- D 1 - I - 0x00A547 02:A537: E9        .byte $E9   ; 
- D 1 - I - 0x00A548 02:A538: A8        .byte $A8   ; 
- D 1 - I - 0x00A549 02:A539: A1        .byte $A1   ; 
- D 1 - I - 0x00A54A 02:A53A: A1        .byte $A1   ; 
- D 1 - I - 0x00A54B 02:A53B: EA        .byte $EA   ; 
- D 1 - I - 0x00A54C 02:A53C: A9        .byte $A9   ; 
- D 1 - I - 0x00A54D 02:A53D: E2        .byte $E2   ; 
- D 1 - I - 0x00A54E 02:A53E: AA        .byte $AA   ; 
- D 1 - I - 0x00A54F 02:A53F: EA        .byte $EA   ; 
- D 1 - I - 0x00A550 02:A540: A9        .byte $A9   ; 
- D 1 - I - 0x00A551 02:A541: AA        .byte $AA   ; 
- D 1 - I - 0x00A552 02:A542: AA        .byte $AA   ; 
- D 1 - I - 0x00A553 02:A543: EA        .byte $EA   ; 
- D 1 - I - 0x00A554 02:A544: F1        .byte $F1   ; 
- D 1 - I - 0x00A555 02:A545: F2        .byte $F2   ; 
- D 1 - I - 0x00A556 02:A546: F2        .byte $F2   ; 
- D 1 - I - 0x00A557 02:A547: EA        .byte $EA   ; 
- D 1 - I - 0x00A558 02:A548: AB        .byte $AB   ; 
- D 1 - I - 0x00A559 02:A549: EB        .byte $EB   ; 
- D 1 - I - 0x00A55A 02:A54A: A1        .byte $A1   ; 
- D 1 - I - 0x00A55B 02:A54B: F6        .byte $F6   ; 
- D 1 - I - 0x00A55C 02:A54C: AA        .byte $AA   ; 
- D 1 - I - 0x00A55D 02:A54D: EB        .byte $EB   ; 
- D 1 - I - 0x00A55E 02:A54E: AA        .byte $AA   ; 
- D 1 - I - 0x00A55F 02:A54F: 9C        .byte $9C   ; 
- D 1 - I - 0x00A560 02:A550: AB        .byte $AB   ; 
- D 1 - I - 0x00A561 02:A551: EB        .byte $EB   ; 
- D 1 - I - 0x00A562 02:A552: AA        .byte $AA   ; 
- D 1 - I - 0x00A563 02:A553: F5        .byte $F5   ; 
- D 1 - I - 0x00A564 02:A554: AA        .byte $AA   ; 
- D 1 - I - 0x00A565 02:A555: EB        .byte $EB   ; 
- D 1 - I - 0x00A566 02:A556: F3        .byte $F3   ; 
- D 1 - I - 0x00A567 02:A557: F4        .byte $F4   ; 
- D 1 - I - 0x00A568 02:A558: A8        .byte $A8   ; 
- D 1 - I - 0x00A569 02:A559: A1        .byte $A1   ; 
- D 1 - I - 0x00A56A 02:A55A: A1        .byte $A1   ; 
- D 1 - I - 0x00A56B 02:A55B: BA        .byte $BA   ; 
- D 1 - I - 0x00A56C 02:A55C: A9        .byte $A9   ; 
- D 1 - I - 0x00A56D 02:A55D: E2        .byte $E2   ; 
- D 1 - I - 0x00A56E 02:A55E: AA        .byte $AA   ; 
- D 1 - I - 0x00A56F 02:A55F: E2        .byte $E2   ; 
- D 1 - I - 0x00A570 02:A560: A9        .byte $A9   ; 
- D 1 - I - 0x00A571 02:A561: AA        .byte $AA   ; 
- D 1 - I - 0x00A572 02:A562: AA        .byte $AA   ; 
- D 1 - I - 0x00A573 02:A563: AA        .byte $AA   ; 
- D 1 - I - 0x00A574 02:A564: F1        .byte $F1   ; 
- D 1 - I - 0x00A575 02:A565: F2        .byte $F2   ; 
- D 1 - I - 0x00A576 02:A566: F2        .byte $F2   ; 
- D 1 - I - 0x00A577 02:A567: F3        .byte $F3   ; 
- D 1 - I - 0x00A578 02:A568: AC        .byte $AC   ; 
- D 1 - I - 0x00A579 02:A569: AC        .byte $AC   ; 
- D 1 - I - 0x00A57A 02:A56A: A1        .byte $A1   ; 
- D 1 - I - 0x00A57B 02:A56B: F6        .byte $F6   ; 
- D 1 - I - 0x00A57C 02:A56C: AA        .byte $AA   ; 
- D 1 - I - 0x00A57D 02:A56D: E2        .byte $E2   ; 
- D 1 - I - 0x00A57E 02:A56E: AA        .byte $AA   ; 
- D 1 - I - 0x00A57F 02:A56F: 9C        .byte $9C   ; 
- D 1 - I - 0x00A580 02:A570: AA        .byte $AA   ; 
- D 1 - I - 0x00A581 02:A571: AA        .byte $AA   ; 
- D 1 - I - 0x00A582 02:A572: B0        .byte $B0   ; 
- D 1 - I - 0x00A583 02:A573: F5        .byte $F5   ; 
- D 1 - I - 0x00A584 02:A574: F3        .byte $F3   ; 
- D 1 - I - 0x00A585 02:A575: F3        .byte $F3   ; 
- D 1 - I - 0x00A586 02:A576: F3        .byte $F3   ; 
- D 1 - I - 0x00A587 02:A577: F4        .byte $F4   ; 
- D 1 - I - 0x00A588 02:A578: B1        .byte $B1   ; 
- D 1 - I - 0x00A589 02:A579: B2        .byte $B2   ; 
- D 1 - I - 0x00A58A 02:A57A: B2        .byte $B2   ; 
- D 1 - I - 0x00A58B 02:A57B: EC        .byte $EC   ; 
- D 1 - I - 0x00A58C 02:A57C: B3        .byte $B3   ; 
- D 1 - I - 0x00A58D 02:A57D: E2        .byte $E2   ; 
- D 1 - I - 0x00A58E 02:A57E: AA        .byte $AA   ; 
- D 1 - I - 0x00A58F 02:A57F: EA        .byte $EA   ; 
- D 1 - I - 0x00A590 02:A580: B3        .byte $B3   ; 
- D 1 - I - 0x00A591 02:A581: AA        .byte $AA   ; 
- D 1 - I - 0x00A592 02:A582: AA        .byte $AA   ; 
- D 1 - I - 0x00A593 02:A583: EA        .byte $EA   ; 
- D 1 - I - 0x00A594 02:A584: B3        .byte $B3   ; 
- D 1 - I - 0x00A595 02:A585: AA        .byte $AA   ; 
- D 1 - I - 0x00A596 02:A586: AA        .byte $AA   ; 
- D 1 - I - 0x00A597 02:A587: EA        .byte $EA   ; 
- D 1 - I - 0x00A598 02:A588: AE        .byte $AE   ; 
- D 1 - I - 0x00A599 02:A589: ED        .byte $ED   ; 
- D 1 - I - 0x00A59A 02:A58A: BD        .byte $BD   ; 
- D 1 - I - 0x00A59B 02:A58B: BD        .byte $BD   ; 
- D 1 - I - 0x00A59C 02:A58C: AB        .byte $AB   ; 
- D 1 - I - 0x00A59D 02:A58D: EE        .byte $EE   ; 
- D 1 - I - 0x00A59E 02:A58E: A8        .byte $A8   ; 
- D 1 - I - 0x00A59F 02:A58F: A1        .byte $A1   ; 
- D 1 - I - 0x00A5A0 02:A590: AA        .byte $AA   ; 
- D 1 - I - 0x00A5A1 02:A591: EE        .byte $EE   ; 
- D 1 - I - 0x00A5A2 02:A592: A9        .byte $A9   ; 
- D 1 - I - 0x00A5A3 02:A593: E2        .byte $E2   ; 
- D 1 - I - 0x00A5A4 02:A594: AB        .byte $AB   ; 
- D 1 - I - 0x00A5A5 02:A595: EE        .byte $EE   ; 
- D 1 - I - 0x00A5A6 02:A596: A9        .byte $A9   ; 
- D 1 - I - 0x00A5A7 02:A597: AA        .byte $AA   ; 
- D 1 - I - 0x00A5A8 02:A598: BD        .byte $BD   ; 
- D 1 - I - 0x00A5A9 02:A599: EF        .byte $EF   ; 
- D 1 - I - 0x00A5AA 02:A59A: AF        .byte $AF   ; 
- D 1 - I - 0x00A5AB 02:A59B: F6        .byte $F6   ; 
- D 1 - I - 0x00A5AC 02:A59C: A1        .byte $A1   ; 
- D 1 - I - 0x00A5AD 02:A59D: F6        .byte $F6   ; 
- D 1 - I - 0x00A5AE 02:A59E: F0        .byte $F0   ; 
- D 1 - I - 0x00A5AF 02:A59F: 9C        .byte $9C   ; 
- D 1 - I - 0x00A5B0 02:A5A0: AA        .byte $AA   ; 
- D 1 - I - 0x00A5B1 02:A5A1: F5        .byte $F5   ; 
- D 1 - I - 0x00A5B2 02:A5A2: AD        .byte $AD   ; 
- D 1 - I - 0x00A5B3 02:A5A3: AD        .byte $AD   ; 
- D 1 - I - 0x00A5B4 02:A5A4: B0        .byte $B0   ; 
- D 1 - I - 0x00A5B5 02:A5A5: F5        .byte $F5   ; 
- D 1 - I - 0x00A5B6 02:A5A6: 00        .byte $00   ; 
- D 1 - I - 0x00A5B7 02:A5A7: 9C        .byte $9C   ; 
- D 1 - I - 0x00A5B8 02:A5A8: B1        .byte $B1   ; 
- D 1 - I - 0x00A5B9 02:A5A9: B2        .byte $B2   ; 
- D 1 - I - 0x00A5BA 02:A5AA: B2        .byte $B2   ; 
- D 1 - I - 0x00A5BB 02:A5AB: F6        .byte $F6   ; 
- D 1 - I - 0x00A5BC 02:A5AC: B3        .byte $B3   ; 
- D 1 - I - 0x00A5BD 02:A5AD: E6        .byte $E6   ; 
- D 1 - I - 0x00A5BE 02:A5AE: B9        .byte $B9   ; 
- D 1 - I - 0x00A5BF 02:A5AF: E8        .byte $E8   ; 
- D 1 - I - 0x00A5C0 02:A5B0: AD        .byte $AD   ; 
- D 1 - I - 0x00A5C1 02:A5B1: DE        .byte $DE   ; 
- D 1 - I - 0x00A5C2 02:A5B2: AA        .byte $AA   ; 
- D 1 - I - 0x00A5C3 02:A5B3: EB        .byte $EB   ; 
- D 1 - I - 0x00A5C4 02:A5B4: B3        .byte $B3   ; 
- D 1 - I - 0x00A5C5 02:A5B5: EA        .byte $EA   ; 
- D 1 - I - 0x00A5C6 02:A5B6: AA        .byte $AA   ; 
- D 1 - I - 0x00A5C7 02:A5B7: EB        .byte $EB   ; 
- D 1 - I - 0x00A5C8 02:A5B8: 15        .byte $15   ; 
- D 1 - I - 0x00A5C9 02:A5B9: A8        .byte $A8   ; 
- D 1 - I - 0x00A5CA 02:A5BA: 74        .byte $74   ; 
- D 1 - I - 0x00A5CB 02:A5BB: A1        .byte $A1   ; 
- D 1 - I - 0x00A5CC 02:A5BC: 15        .byte $15   ; 
- D 1 - I - 0x00A5CD 02:A5BD: A9        .byte $A9   ; 
- D 1 - I - 0x00A5CE 02:A5BE: 40        .byte $40   ; 
- D 1 - I - 0x00A5CF 02:A5BF: 41        .byte $41   ; 
- D 1 - I - 0x00A5D0 02:A5C0: 21        .byte $21   ; 
- D 1 - I - 0x00A5D1 02:A5C1: 46        .byte $46   ; 
- D 1 - I - 0x00A5D2 02:A5C2: 02        .byte $02   ; 
- D 1 - I - 0x00A5D3 02:A5C3: 5F        .byte $5F   ; 
- D 1 - I - 0x00A5D4 02:A5C4: E4        .byte $E4   ; 
- D 1 - I - 0x00A5D5 02:A5C5: 5F        .byte $5F   ; 
- D 1 - I - 0x00A5D6 02:A5C6: BD        .byte $BD   ; 
- D 1 - I - 0x00A5D7 02:A5C7: BD        .byte $BD   ; 
- D 1 - I - 0x00A5D8 02:A5C8: BE        .byte $BE   ; 
- D 1 - I - 0x00A5D9 02:A5C9: E0        .byte $E0   ; 
- D 1 - I - 0x00A5DA 02:A5CA: F8        .byte $F8   ; 
- D 1 - I - 0x00A5DB 02:A5CB: BD        .byte $BD   ; 
- D 1 - I - 0x00A5DC 02:A5CC: BD        .byte $BD   ; 
- D 1 - I - 0x00A5DD 02:A5CD: BE        .byte $BE   ; 
- D 1 - I - 0x00A5DE 02:A5CE: E0        .byte $E0   ; 
- D 1 - I - 0x00A5DF 02:A5CF: BD        .byte $BD   ; 
- D 1 - I - 0x00A5E0 02:A5D0: C0        .byte $C0   ; 
- D 1 - I - 0x00A5E1 02:A5D1: C0        .byte $C0   ; 
- D 1 - I - 0x00A5E2 02:A5D2: A7        .byte $A7   ; 
- D 1 - I - 0x00A5E3 02:A5D3: 5A        .byte $5A   ; 
- D 1 - I - 0x00A5E4 02:A5D4: B9        .byte $B9   ; 
- D 1 - I - 0x00A5E5 02:A5D5: E7        .byte $E7   ; 
- D 1 - I - 0x00A5E6 02:A5D6: 9E        .byte $9E   ; 
- D 1 - I - 0x00A5E7 02:A5D7: E9        .byte $E9   ; 
- D 1 - I - 0x00A5E8 02:A5D8: FA        .byte $FA   ; 
- D 1 - I - 0x00A5E9 02:A5D9: BD        .byte $BD   ; 
- D 1 - I - 0x00A5EA 02:A5DA: B5        .byte $B5   ; 
- D 1 - I - 0x00A5EB 02:A5DB: 62        .byte $62   ; 
- D 1 - I - 0x00A5EC 02:A5DC: B5        .byte $B5   ; 
- D 1 - I - 0x00A5ED 02:A5DD: 62        .byte $62   ; 
- D 1 - I - 0x00A5EE 02:A5DE: B6        .byte $B6   ; 
- D 1 - I - 0x00A5EF 02:A5DF: 63        .byte $63   ; 
- D 1 - I - 0x00A5F0 02:A5E0: B6        .byte $B6   ; 
- D 1 - I - 0x00A5F1 02:A5E1: 63        .byte $63   ; 
- D 1 - I - 0x00A5F2 02:A5E2: B7        .byte $B7   ; 
- D 1 - I - 0x00A5F3 02:A5E3: 64        .byte $64   ; 
- D 1 - I - 0x00A5F4 02:A5E4: DC        .byte $DC   ; 
- D 1 - I - 0x00A5F5 02:A5E5: DD        .byte $DD   ; 
- D 1 - I - 0x00A5F6 02:A5E6: 5B        .byte $5B   ; 
- D 1 - I - 0x00A5F7 02:A5E7: F2        .byte $F2   ; 
- D 1 - I - 0x00A5F8 02:A5E8: B6        .byte $B6   ; 
- D 1 - I - 0x00A5F9 02:A5E9: 63        .byte $63   ; 
- D 1 - I - 0x00A5FA 02:A5EA: B7        .byte $B7   ; 
- D 1 - I - 0x00A5FB 02:A5EB: 5D        .byte $5D   ; 
- D 1 - I - 0x00A5FC 02:A5EC: B7        .byte $B7   ; 
- D 1 - I - 0x00A5FD 02:A5ED: 64        .byte $64   ; 
- D 1 - I - 0x00A5FE 02:A5EE: B8        .byte $B8   ; 
- D 1 - I - 0x00A5FF 02:A5EF: 9C        .byte $9C   ; 
- D 1 - I - 0x00A600 02:A5F0: B8        .byte $B8   ; 
- D 1 - I - 0x00A601 02:A5F1: AA        .byte $AA   ; 
- D 1 - I - 0x00A602 02:A5F2: B0        .byte $B0   ; 
- D 1 - I - 0x00A603 02:A5F3: F5        .byte $F5   ; 
- D 1 - I - 0x00A604 02:A5F4: F2        .byte $F2   ; 
- D 1 - I - 0x00A605 02:A5F5: F2        .byte $F2   ; 
- D 1 - I - 0x00A606 02:A5F6: F3        .byte $F3   ; 
- D 1 - I - 0x00A607 02:A5F7: F4        .byte $F4   ; 
- D 1 - I - 0x00A608 02:A5F8: 00        .byte $00   ; 
- D 1 - I - 0x00A609 02:A5F9: 00        .byte $00   ; 
- D 1 - I - 0x00A60A 02:A5FA: 00        .byte $00   ; 
- D 1 - I - 0x00A60B 02:A5FB: 00        .byte $00   ; 
- D 1 - I - 0x00A60C 02:A5FC: 00        .byte $00   ; 
- D 1 - I - 0x00A60D 02:A5FD: 00        .byte $00   ; 
- D 1 - I - 0x00A60E 02:A5FE: 00        .byte $00   ; 
- D 1 - I - 0x00A60F 02:A5FF: 00        .byte $00   ; 
- D 1 - I - 0x00A610 02:A600: 00        .byte $00   ; 
- D 1 - I - 0x00A611 02:A601: 00        .byte $00   ; 
- D 1 - I - 0x00A612 02:A602: 00        .byte $00   ; 
- D 1 - I - 0x00A613 02:A603: 00        .byte $00   ; 
- D 1 - I - 0x00A614 02:A604: 00        .byte $00   ; 
- D 1 - I - 0x00A615 02:A605: 00        .byte $00   ; 
- D 1 - I - 0x00A616 02:A606: 01        .byte $01   ; 
- D 1 - I - 0x00A617 02:A607: 5E        .byte $5E   ; 
- D 1 - I - 0x00A618 02:A608: 00        .byte $00   ; 
- D 1 - I - 0x00A619 02:A609: 00        .byte $00   ; 
- D 1 - I - 0x00A61A 02:A60A: 00        .byte $00   ; 
- D 1 - I - 0x00A61B 02:A60B: 00        .byte $00   ; 
- D 1 - I - 0x00A61C 02:A60C: 00        .byte $00   ; 
- D 1 - I - 0x00A61D 02:A60D: 00        .byte $00   ; 
- D 1 - I - 0x00A61E 02:A60E: 00        .byte $00   ; 
- D 1 - I - 0x00A61F 02:A60F: 00        .byte $00   ; 
- D 1 - I - 0x00A620 02:A610: 00        .byte $00   ; 
- D 1 - I - 0x00A621 02:A611: 00        .byte $00   ; 
- D 1 - I - 0x00A622 02:A612: 00        .byte $00   ; 
- D 1 - I - 0x00A623 02:A613: 00        .byte $00   ; 
- D 1 - I - 0x00A624 02:A614: DA        .byte $DA   ; 
- D 1 - I - 0x00A625 02:A615: F7        .byte $F7   ; 
- D 1 - I - 0x00A626 02:A616: F7        .byte $F7   ; 
- D 1 - I - 0x00A627 02:A617: F7        .byte $F7   ; 
- D 1 - I - 0x00A628 02:A618: FD        .byte $FD   ; 
- D 1 - I - 0x00A629 02:A619: E0        .byte $E0   ; 
- D 1 - I - 0x00A62A 02:A61A: F8        .byte $F8   ; 
- D 1 - I - 0x00A62B 02:A61B: BD        .byte $BD   ; 
- D 1 - I - 0x00A62C 02:A61C: BD        .byte $BD   ; 
- D 1 - I - 0x00A62D 02:A61D: BE        .byte $BE   ; 
- D 1 - I - 0x00A62E 02:A61E: E0        .byte $E0   ; 
- D 1 - I - 0x00A62F 02:A61F: BD        .byte $BD   ; 
- D 1 - I - 0x00A630 02:A620: FA        .byte $FA   ; 
- D 1 - I - 0x00A631 02:A621: BD        .byte $BD   ; 
- D 1 - I - 0x00A632 02:A622: B4        .byte $B4   ; 
- D 1 - I - 0x00A633 02:A623: 61        .byte $61   ; 
- D 1 - I - 0x00A634 02:A624: B5        .byte $B5   ; 
- D 1 - I - 0x00A635 02:A625: 62        .byte $62   ; 
- D 1 - I - 0x00A636 02:A626: B6        .byte $B6   ; 
- D 1 - I - 0x00A637 02:A627: 5C        .byte $5C   ; 
- D 1 - I - 0x00A638 02:A628: 00        .byte $00   ; 
- D 1 - I - 0x00A639 02:A629: 00        .byte $00   ; 
- D 1 - I - 0x00A63A 02:A62A: 00        .byte $00   ; 
- D 1 - I - 0x00A63B 02:A62B: 00        .byte $00   ; 
- D 1 - I - 0x00A63C 02:A62C: 00        .byte $00   ; 
- D 1 - I - 0x00A63D 02:A62D: 00        .byte $00   ; 
- D 1 - I - 0x00A63E 02:A62E: 01        .byte $01   ; 
- D 1 - I - 0x00A63F 02:A62F: 5E        .byte $5E   ; 
- D 1 - I - 0x00A640 02:A630: 01        .byte $01   ; 
- D 1 - I - 0x00A641 02:A631: 5E        .byte $5E   ; 
- D 1 - I - 0x00A642 02:A632: 02        .byte $02   ; 
- D 1 - I - 0x00A643 02:A633: 5F        .byte $5F   ; 
- D 1 - I - 0x00A644 02:A634: 60        .byte $60   ; 
- D 1 - I - 0x00A645 02:A635: 5F        .byte $5F   ; 
- D 1 - I - 0x00A646 02:A636: BD        .byte $BD   ; 
- D 1 - I - 0x00A647 02:A637: BD        .byte $BD   ; 
- D 1 - I - 0x00A648 02:A638: 01        .byte $01   ; 
- D 1 - I - 0x00A649 02:A639: 5E        .byte $5E   ; 
- D 1 - I - 0x00A64A 02:A63A: 02        .byte $02   ; 
- D 1 - I - 0x00A64B 02:A63B: 5F        .byte $5F   ; 
- D 1 - I - 0x00A64C 02:A63C: 02        .byte $02   ; 
- D 1 - I - 0x00A64D 02:A63D: 5F        .byte $5F   ; 
- D 1 - I - 0x00A64E 02:A63E: BD        .byte $BD   ; 
- D 1 - I - 0x00A64F 02:A63F: BD        .byte $BD   ; 
- D 1 - I - 0x00A650 02:A640: FC        .byte $FC   ; 
- D 1 - I - 0x00A651 02:A641: BD        .byte $BD   ; 
- D 1 - I - 0x00A652 02:A642: F8        .byte $F8   ; 
- D 1 - I - 0x00A653 02:A643: BD        .byte $BD   ; 
- D 1 - I - 0x00A654 02:A644: BD        .byte $BD   ; 
- D 1 - I - 0x00A655 02:A645: BD        .byte $BD   ; 
- D 1 - I - 0x00A656 02:A646: BD        .byte $BD   ; 
- D 1 - I - 0x00A657 02:A647: BD        .byte $BD   ; 
- D 1 - I - 0x00A658 02:A648: FD        .byte $FD   ; 
- D 1 - I - 0x00A659 02:A649: E0        .byte $E0   ; 
- D 1 - I - 0x00A65A 02:A64A: BD        .byte $BD   ; 
- D 1 - I - 0x00A65B 02:A64B: BD        .byte $BD   ; 
- D 1 - I - 0x00A65C 02:A64C: BD        .byte $BD   ; 
- D 1 - I - 0x00A65D 02:A64D: BE        .byte $BE   ; 
- D 1 - I - 0x00A65E 02:A64E: E0        .byte $E0   ; 
- D 1 - I - 0x00A65F 02:A64F: BD        .byte $BD   ; 
- D 1 - I - 0x00A660 02:A650: FA        .byte $FA   ; 
- D 1 - I - 0x00A661 02:A651: BD        .byte $BD   ; 
- D 1 - I - 0x00A662 02:A652: B4        .byte $B4   ; 
- D 1 - I - 0x00A663 02:A653: DB        .byte $DB   ; 
- D 1 - I - 0x00A664 02:A654: B5        .byte $B5   ; 
- D 1 - I - 0x00A665 02:A655: 62        .byte $62   ; 
- D 1 - I - 0x00A666 02:A656: B6        .byte $B6   ; 
- D 1 - I - 0x00A667 02:A657: 5C        .byte $5C   ; 
- D 1 - I - 0x00A668 02:A658: FA        .byte $FA   ; 
- D 1 - I - 0x00A669 02:A659: BD        .byte $BD   ; 
- D 1 - I - 0x00A66A 02:A65A: B5        .byte $B5   ; 
- D 1 - I - 0x00A66B 02:A65B: 62        .byte $62   ; 
- D 1 - I - 0x00A66C 02:A65C: B5        .byte $B5   ; 
- D 1 - I - 0x00A66D 02:A65D: 62        .byte $62   ; 
- D 1 - I - 0x00A66E 02:A65E: B6        .byte $B6   ; 
- D 1 - I - 0x00A66F 02:A65F: 63        .byte $63   ; 
- D 1 - I - 0x00A670 02:A660: B6        .byte $B6   ; 
- D 1 - I - 0x00A671 02:A661: 63        .byte $63   ; 
- D 1 - I - 0x00A672 02:A662: B7        .byte $B7   ; 
- D 1 - I - 0x00A673 02:A663: 64        .byte $64   ; 
- D 1 - I - 0x00A674 02:A664: B7        .byte $B7   ; 
- D 1 - I - 0x00A675 02:A665: 64        .byte $64   ; 
- D 1 - I - 0x00A676 02:A666: B8        .byte $B8   ; 
- D 1 - I - 0x00A677 02:A667: AA        .byte $AA   ; 
- D 1 - I - 0x00A678 02:A668: B6        .byte $B6   ; 
- D 1 - I - 0x00A679 02:A669: 63        .byte $63   ; 
- D 1 - I - 0x00A67A 02:A66A: B7        .byte $B7   ; 
- D 1 - I - 0x00A67B 02:A66B: 5D        .byte $5D   ; 
- D 1 - I - 0x00A67C 02:A66C: B7        .byte $B7   ; 
- D 1 - I - 0x00A67D 02:A66D: 64        .byte $64   ; 
- D 1 - I - 0x00A67E 02:A66E: B8        .byte $B8   ; 
- D 1 - I - 0x00A67F 02:A66F: 9C        .byte $9C   ; 
- D 1 - I - 0x00A680 02:A670: B8        .byte $B8   ; 
- D 1 - I - 0x00A681 02:A671: AA        .byte $AA   ; 
- D 1 - I - 0x00A682 02:A672: AA        .byte $AA   ; 
- D 1 - I - 0x00A683 02:A673: 9C        .byte $9C   ; 
- D 1 - I - 0x00A684 02:A674: AA        .byte $AA   ; 
- D 1 - I - 0x00A685 02:A675: E2        .byte $E2   ; 
- D 1 - I - 0x00A686 02:A676: AA        .byte $AA   ; 
- D 1 - I - 0x00A687 02:A677: 9C        .byte $9C   ; 
- D 1 - I - 0x00A688 02:A678: B1        .byte $B1   ; 
- D 1 - I - 0x00A689 02:A679: AA        .byte $AA   ; 
- D 1 - I - 0x00A68A 02:A67A: AA        .byte $AA   ; 
- D 1 - I - 0x00A68B 02:A67B: E2        .byte $E2   ; 
- D 1 - I - 0x00A68C 02:A67C: A9        .byte $A9   ; 
- D 1 - I - 0x00A68D 02:A67D: E2        .byte $E2   ; 
- D 1 - I - 0x00A68E 02:A67E: AA        .byte $AA   ; 
- D 1 - I - 0x00A68F 02:A67F: AA        .byte $AA   ; 
- D 1 - I - 0x00A690 02:A680: A9        .byte $A9   ; 
- D 1 - I - 0x00A691 02:A681: AA        .byte $AA   ; 
- D 1 - I - 0x00A692 02:A682: AA        .byte $AA   ; 
- D 1 - I - 0x00A693 02:A683: AA        .byte $AA   ; 
- D 1 - I - 0x00A694 02:A684: F1        .byte $F1   ; 
- D 1 - I - 0x00A695 02:A685: F2        .byte $F2   ; 
- D 1 - I - 0x00A696 02:A686: F2        .byte $F2   ; 
- D 1 - I - 0x00A697 02:A687: F2        .byte $F2   ; 
- D 1 - I - 0x00A698 02:A688: AA        .byte $AA   ; 
- D 1 - I - 0x00A699 02:A689: AA        .byte $AA   ; 
- D 1 - I - 0x00A69A 02:A68A: AA        .byte $AA   ; 
- D 1 - I - 0x00A69B 02:A68B: 9C        .byte $9C   ; 
- D 1 - I - 0x00A69C 02:A68C: AA        .byte $AA   ; 
- D 1 - I - 0x00A69D 02:A68D: AA        .byte $AA   ; 
- D 1 - I - 0x00A69E 02:A68E: AA        .byte $AA   ; 
- D 1 - I - 0x00A69F 02:A68F: F5        .byte $F5   ; 
- D 1 - I - 0x00A6A0 02:A690: AA        .byte $AA   ; 
- D 1 - I - 0x00A6A1 02:A691: AA        .byte $AA   ; 
- D 1 - I - 0x00A6A2 02:A692: B0        .byte $B0   ; 
- D 1 - I - 0x00A6A3 02:A693: F5        .byte $F5   ; 
- D 1 - I - 0x00A6A4 02:A694: F3        .byte $F3   ; 
- D 1 - I - 0x00A6A5 02:A695: F3        .byte $F3   ; 
- D 1 - I - 0x00A6A6 02:A696: F3        .byte $F3   ; 
- D 1 - I - 0x00A6A7 02:A697: F4        .byte $F4   ; 
- D 1 - I - 0x00A6A8 02:A698: A8        .byte $A8   ; 
- D 1 - I - 0x00A6A9 02:A699: A1        .byte $A1   ; 
- D 1 - I - 0x00A6AA 02:A69A: A1        .byte $A1   ; 
- D 1 - I - 0x00A6AB 02:A69B: E6        .byte $E6   ; 
- D 1 - I - 0x00A6AC 02:A69C: A9        .byte $A9   ; 
- D 1 - I - 0x00A6AD 02:A69D: E2        .byte $E2   ; 
- D 1 - I - 0x00A6AE 02:A69E: AA        .byte $AA   ; 
- D 1 - I - 0x00A6AF 02:A69F: EA        .byte $EA   ; 
- D 1 - I - 0x00A6B0 02:A6A0: A9        .byte $A9   ; 
- D 1 - I - 0x00A6B1 02:A6A1: AA        .byte $AA   ; 
- D 1 - I - 0x00A6B2 02:A6A2: AA        .byte $AA   ; 
- D 1 - I - 0x00A6B3 02:A6A3: EA        .byte $EA   ; 
- D 1 - I - 0x00A6B4 02:A6A4: B3        .byte $B3   ; 
- D 1 - I - 0x00A6B5 02:A6A5: AA        .byte $AA   ; 
- D 1 - I - 0x00A6B6 02:A6A6: AA        .byte $AA   ; 
- D 1 - I - 0x00A6B7 02:A6A7: EA        .byte $EA   ; 
- D 1 - I - 0x00A6B8 02:A6A8: B9        .byte $B9   ; 
- D 1 - I - 0x00A6B9 02:A6A9: E7        .byte $E7   ; 
- D 1 - I - 0x00A6BA 02:A6AA: A1        .byte $A1   ; 
- D 1 - I - 0x00A6BB 02:A6AB: F6        .byte $F6   ; 
- D 1 - I - 0x00A6BC 02:A6AC: AB        .byte $AB   ; 
- D 1 - I - 0x00A6BD 02:A6AD: EB        .byte $EB   ; 
- D 1 - I - 0x00A6BE 02:A6AE: AA        .byte $AA   ; 
- D 1 - I - 0x00A6BF 02:A6AF: 9C        .byte $9C   ; 
- D 1 - I - 0x00A6C0 02:A6B0: AA        .byte $AA   ; 
- D 1 - I - 0x00A6C1 02:A6B1: EB        .byte $EB   ; 
- D 1 - I - 0x00A6C2 02:A6B2: AA        .byte $AA   ; 
- D 1 - I - 0x00A6C3 02:A6B3: 9C        .byte $9C   ; 
- D 1 - I - 0x00A6C4 02:A6B4: AB        .byte $AB   ; 
- D 1 - I - 0x00A6C5 02:A6B5: EB        .byte $EB   ; 
- D 1 - I - 0x00A6C6 02:A6B6: AA        .byte $AA   ; 
- D 1 - I - 0x00A6C7 02:A6B7: 9C        .byte $9C   ; 
- D 1 - I - 0x00A6C8 02:A6B8: B1        .byte $B1   ; 
- D 1 - I - 0x00A6C9 02:A6B9: B2        .byte $B2   ; 
- D 1 - I - 0x00A6CA 02:A6BA: B2        .byte $B2   ; 
- D 1 - I - 0x00A6CB 02:A6BB: EC        .byte $EC   ; 
- D 1 - I - 0x00A6CC 02:A6BC: B3        .byte $B3   ; 
- D 1 - I - 0x00A6CD 02:A6BD: E2        .byte $E2   ; 
- D 1 - I - 0x00A6CE 02:A6BE: AA        .byte $AA   ; 
- D 1 - I - 0x00A6CF 02:A6BF: EA        .byte $EA   ; 
- D 1 - I - 0x00A6D0 02:A6C0: B3        .byte $B3   ; 
- D 1 - I - 0x00A6D1 02:A6C1: AA        .byte $AA   ; 
- D 1 - I - 0x00A6D2 02:A6C2: AA        .byte $AA   ; 
- D 1 - I - 0x00A6D3 02:A6C3: EA        .byte $EA   ; 
- D 1 - I - 0x00A6D4 02:A6C4: B3        .byte $B3   ; 
- D 1 - I - 0x00A6D5 02:A6C5: AA        .byte $AA   ; 
- D 1 - I - 0x00A6D6 02:A6C6: AA        .byte $AA   ; 
- D 1 - I - 0x00A6D7 02:A6C7: EA        .byte $EA   ; 
- D 1 - I - 0x00A6D8 02:A6C8: AE        .byte $AE   ; 
- D 1 - I - 0x00A6D9 02:A6C9: E3        .byte $E3   ; 
- D 1 - I - 0x00A6DA 02:A6CA: B2        .byte $B2   ; 
- D 1 - I - 0x00A6DB 02:A6CB: F6        .byte $F6   ; 
- D 1 - I - 0x00A6DC 02:A6CC: AB        .byte $AB   ; 
- D 1 - I - 0x00A6DD 02:A6CD: EB        .byte $EB   ; 
- D 1 - I - 0x00A6DE 02:A6CE: AA        .byte $AA   ; 
- D 1 - I - 0x00A6DF 02:A6CF: 9C        .byte $9C   ; 
- D 1 - I - 0x00A6E0 02:A6D0: AA        .byte $AA   ; 
- D 1 - I - 0x00A6E1 02:A6D1: EB        .byte $EB   ; 
- D 1 - I - 0x00A6E2 02:A6D2: AA        .byte $AA   ; 
- D 1 - I - 0x00A6E3 02:A6D3: 9C        .byte $9C   ; 
- D 1 - I - 0x00A6E4 02:A6D4: AB        .byte $AB   ; 
- D 1 - I - 0x00A6E5 02:A6D5: EB        .byte $EB   ; 
- D 1 - I - 0x00A6E6 02:A6D6: AA        .byte $AA   ; 
- D 1 - I - 0x00A6E7 02:A6D7: 9C        .byte $9C   ; 
- D 1 - I - 0x00A6E8 02:A6D8: 00        .byte $00   ; 
- D 1 - I - 0x00A6E9 02:A6D9: 00        .byte $00   ; 
- D 1 - I - 0x00A6EA 02:A6DA: 00        .byte $00   ; 
- D 1 - I - 0x00A6EB 02:A6DB: 00        .byte $00   ; 
- D 1 - I - 0x00A6EC 02:A6DC: 00        .byte $00   ; 
- D 1 - I - 0x00A6ED 02:A6DD: 00        .byte $00   ; 
- D 1 - I - 0x00A6EE 02:A6DE: 00        .byte $00   ; 
- D 1 - I - 0x00A6EF 02:A6DF: 00        .byte $00   ; 
- D 1 - I - 0x00A6F0 02:A6E0: 00        .byte $00   ; 
- D 1 - I - 0x00A6F1 02:A6E1: 00        .byte $00   ; 
- D 1 - I - 0x00A6F2 02:A6E2: 00        .byte $00   ; 
- D 1 - I - 0x00A6F3 02:A6E3: 00        .byte $00   ; 
- D 1 - I - 0x00A6F4 02:A6E4: F7        .byte $F7   ; 
- D 1 - I - 0x00A6F5 02:A6E5: DF        .byte $DF   ; 
- D 1 - I - 0x00A6F6 02:A6E6: 65        .byte $65   ; 
- D 1 - I - 0x00A6F7 02:A6E7: 65        .byte $65   ; 
- D 1 - I - 0x00A6F8 02:A6E8: 00        .byte $00   ; 
- D 1 - I - 0x00A6F9 02:A6E9: 00        .byte $00   ; 
- D 1 - I - 0x00A6FA 02:A6EA: 00        .byte $00   ; 
- D 1 - I - 0x00A6FB 02:A6EB: 00        .byte $00   ; 
- D 1 - I - 0x00A6FC 02:A6EC: 00        .byte $00   ; 
- D 1 - I - 0x00A6FD 02:A6ED: 00        .byte $00   ; 
- D 1 - I - 0x00A6FE 02:A6EE: 00        .byte $00   ; 
- D 1 - I - 0x00A6FF 02:A6EF: 00        .byte $00   ; 
- D 1 - I - 0x00A700 02:A6F0: 00        .byte $00   ; 
- D 1 - I - 0x00A701 02:A6F1: 00        .byte $00   ; 
- D 1 - I - 0x00A702 02:A6F2: 00        .byte $00   ; 
- D 1 - I - 0x00A703 02:A6F3: 00        .byte $00   ; 
- D 1 - I - 0x00A704 02:A6F4: 65        .byte $65   ; 
- D 1 - I - 0x00A705 02:A6F5: 65        .byte $65   ; 
- D 1 - I - 0x00A706 02:A6F6: 65        .byte $65   ; 
- D 1 - I - 0x00A707 02:A6F7: 65        .byte $65   ; 
- - - - - - 0x00A708 02:A6F8: BA        .byte $BA   ; 
- - - - - - 0x00A709 02:A6F9: AC        .byte $AC   ; 
- - - - - - 0x00A70A 02:A6FA: AC        .byte $AC   ; 
- - - - - - 0x00A70B 02:A6FB: 9C        .byte $9C   ; 
- - - - - - 0x00A70C 02:A6FC: AA        .byte $AA   ; 
- - - - - - 0x00A70D 02:A6FD: E2        .byte $E2   ; 
- - - - - - 0x00A70E 02:A6FE: AA        .byte $AA   ; 
- - - - - - 0x00A70F 02:A6FF: 9C        .byte $9C   ; 
- - - - - - 0x00A710 02:A700: AA        .byte $AA   ; 
- - - - - - 0x00A711 02:A701: AA        .byte $AA   ; 
- - - - - - 0x00A712 02:A702: AA        .byte $AA   ; 
- - - - - - 0x00A713 02:A703: 9C        .byte $9C   ; 
- - - - - - 0x00A714 02:A704: AA        .byte $AA   ; 
- - - - - - 0x00A715 02:A705: AA        .byte $AA   ; 
- - - - - - 0x00A716 02:A706: AA        .byte $AA   ; 
- - - - - - 0x00A717 02:A707: F5        .byte $F5   ; 
- D 1 - I - 0x00A718 02:A708: 00        .byte $00   ; 
- D 1 - I - 0x00A719 02:A709: 00        .byte $00   ; 
- D 1 - I - 0x00A71A 02:A70A: 00        .byte $00   ; 
- D 1 - I - 0x00A71B 02:A70B: 00        .byte $00   ; 
- D 1 - I - 0x00A71C 02:A70C: 00        .byte $00   ; 
- D 1 - I - 0x00A71D 02:A70D: 00        .byte $00   ; 
- D 1 - I - 0x00A71E 02:A70E: 00        .byte $00   ; 
- D 1 - I - 0x00A71F 02:A70F: 00        .byte $00   ; 
- D 1 - I - 0x00A720 02:A710: 00        .byte $00   ; 
- D 1 - I - 0x00A721 02:A711: 00        .byte $00   ; 
- D 1 - I - 0x00A722 02:A712: 00        .byte $00   ; 
- D 1 - I - 0x00A723 02:A713: 00        .byte $00   ; 
- D 1 - I - 0x00A724 02:A714: 66        .byte $66   ; 
- D 1 - I - 0x00A725 02:A715: F7        .byte $F7   ; 
- D 1 - I - 0x00A726 02:A716: F7        .byte $F7   ; 
- D 1 - I - 0x00A727 02:A717: F7        .byte $F7   ; 
- D 1 - I - 0x00A728 02:A718: BD        .byte $BD   ; 
- D 1 - I - 0x00A729 02:A719: BE        .byte $BE   ; 
- D 1 - I - 0x00A72A 02:A71A: BF        .byte $BF   ; 
- D 1 - I - 0x00A72B 02:A71B: 03        .byte $03   ; 
- D 1 - I - 0x00A72C 02:A71C: BD        .byte $BD   ; 
- D 1 - I - 0x00A72D 02:A71D: BD        .byte $BD   ; 
- D 1 - I - 0x00A72E 02:A71E: BE        .byte $BE   ; 
- D 1 - I - 0x00A72F 02:A71F: 67        .byte $67   ; 
- D 1 - I - 0x00A730 02:A720: C0        .byte $C0   ; 
- D 1 - I - 0x00A731 02:A721: C0        .byte $C0   ; 
- D 1 - I - 0x00A732 02:A722: C0        .byte $C0   ; 
- D 1 - I - 0x00A733 02:A723: A7        .byte $A7   ; 
- D 1 - I - 0x00A734 02:A724: 9D        .byte $9D   ; 
- D 1 - I - 0x00A735 02:A725: 9E        .byte $9E   ; 
- D 1 - I - 0x00A736 02:A726: 9E        .byte $9E   ; 
- D 1 - I - 0x00A737 02:A727: 9E        .byte $9E   ; 
- D 1 - I - 0x00A738 02:A728: 03        .byte $03   ; 
- D 1 - I - 0x00A739 02:A729: 03        .byte $03   ; 
- D 1 - I - 0x00A73A 02:A72A: 03        .byte $03   ; 
- D 1 - I - 0x00A73B 02:A72B: 03        .byte $03   ; 
- D 1 - I - 0x00A73C 02:A72C: 68        .byte $68   ; 
- D 1 - I - 0x00A73D 02:A72D: AA        .byte $AA   ; 
- D 1 - I - 0x00A73E 02:A72E: AA        .byte $AA   ; 
- D 1 - I - 0x00A73F 02:A72F: AA        .byte $AA   ; 
- D 1 - I - 0x00A740 02:A730: 04        .byte $04   ; 
- D 1 - I - 0x00A741 02:A731: 69        .byte $69   ; 
- D 1 - I - 0x00A742 02:A732: 05        .byte $05   ; 
- D 1 - I - 0x00A743 02:A733: AA        .byte $AA   ; 
- D 1 - I - 0x00A744 02:A734: A3        .byte $A3   ; 
- D 1 - I - 0x00A745 02:A735: 00        .byte $00   ; 
- D 1 - I - 0x00A746 02:A736: 6A        .byte $6A   ; 
- D 1 - I - 0x00A747 02:A737: 06        .byte $06   ; 
- D 1 - I - 0x00A748 02:A738: 03        .byte $03   ; 
- D 1 - I - 0x00A749 02:A739: 03        .byte $03   ; 
- D 1 - I - 0x00A74A 02:A73A: 03        .byte $03   ; 
- D 1 - I - 0x00A74B 02:A73B: 03        .byte $03   ; 
- D 1 - I - 0x00A74C 02:A73C: AA        .byte $AA   ; 
- D 1 - I - 0x00A74D 02:A73D: AA        .byte $AA   ; 
- D 1 - I - 0x00A74E 02:A73E: AA        .byte $AA   ; 
- D 1 - I - 0x00A74F 02:A73F: 06        .byte $06   ; 
- D 1 - I - 0x00A750 02:A740: 05        .byte $05   ; 
- D 1 - I - 0x00A751 02:A741: 06        .byte $06   ; 
- D 1 - I - 0x00A752 02:A742: 06        .byte $06   ; 
- D 1 - I - 0x00A753 02:A743: 6B        .byte $6B   ; 
- D 1 - I - 0x00A754 02:A744: 06        .byte $06   ; 
- D 1 - I - 0x00A755 02:A745: 6B        .byte $6B   ; 
- D 1 - I - 0x00A756 02:A746: 6B        .byte $6B   ; 
- D 1 - I - 0x00A757 02:A747: 6B        .byte $6B   ; 
- D 1 - I - 0x00A758 02:A748: 08        .byte $08   ; 
- D 1 - I - 0x00A759 02:A749: 72        .byte $72   ; 
- D 1 - I - 0x00A75A 02:A74A: BD        .byte $BD   ; 
- D 1 - I - 0x00A75B 02:A74B: BD        .byte $BD   ; 
- D 1 - I - 0x00A75C 02:A74C: 07        .byte $07   ; 
- D 1 - I - 0x00A75D 02:A74D: A0        .byte $A0   ; 
- D 1 - I - 0x00A75E 02:A74E: 73        .byte $73   ; 
- D 1 - I - 0x00A75F 02:A74F: BD        .byte $BD   ; 
- D 1 - I - 0x00A760 02:A750: 07        .byte $07   ; 
- D 1 - I - 0x00A761 02:A751: A6        .byte $A6   ; 
- D 1 - I - 0x00A762 02:A752: A0        .byte $A0   ; 
- D 1 - I - 0x00A763 02:A753: F9        .byte $F9   ; 
- D 1 - I - 0x00A764 02:A754: 07        .byte $07   ; 
- D 1 - I - 0x00A765 02:A755: 6B        .byte $6B   ; 
- D 1 - I - 0x00A766 02:A756: AA        .byte $AA   ; 
- D 1 - I - 0x00A767 02:A757: A0        .byte $A0   ; 
- D 1 - I - 0x00A768 02:A758: A8        .byte $A8   ; 
- D 1 - I - 0x00A769 02:A759: A1        .byte $A1   ; 
- D 1 - I - 0x00A76A 02:A75A: A1        .byte $A1   ; 
- D 1 - I - 0x00A76B 02:A75B: A1        .byte $A1   ; 
- D 1 - I - 0x00A76C 02:A75C: A9        .byte $A9   ; 
- D 1 - I - 0x00A76D 02:A75D: E2        .byte $E2   ; 
- D 1 - I - 0x00A76E 02:A75E: AA        .byte $AA   ; 
- D 1 - I - 0x00A76F 02:A75F: FB        .byte $FB   ; 
- D 1 - I - 0x00A770 02:A760: B3        .byte $B3   ; 
- D 1 - I - 0x00A771 02:A761: AA        .byte $AA   ; 
- D 1 - I - 0x00A772 02:A762: AA        .byte $AA   ; 
- D 1 - I - 0x00A773 02:A763: FE        .byte $FE   ; 
- D 1 - I - 0x00A774 02:A764: F1        .byte $F1   ; 
- D 1 - I - 0x00A775 02:A765: F2        .byte $F2   ; 
- D 1 - I - 0x00A776 02:A766: F2        .byte $F2   ; 
- D 1 - I - 0x00A777 02:A767: F3        .byte $F3   ; 
- D 1 - I - 0x00A778 02:A768: A3        .byte $A3   ; 
- D 1 - I - 0x00A779 02:A769: 00        .byte $00   ; 
- D 1 - I - 0x00A77A 02:A76A: A2        .byte $A2   ; 
- D 1 - I - 0x00A77B 02:A76B: 6C        .byte $6C   ; 
- D 1 - I - 0x00A77C 02:A76C: 00        .byte $00   ; 
- D 1 - I - 0x00A77D 02:A76D: 00        .byte $00   ; 
- D 1 - I - 0x00A77E 02:A76E: 00        .byte $00   ; 
- D 1 - I - 0x00A77F 02:A76F: 00        .byte $00   ; 
- D 1 - I - 0x00A780 02:A770: BC        .byte $BC   ; 
- D 1 - I - 0x00A781 02:A771: FF        .byte $FF   ; 
- D 1 - I - 0x00A782 02:A772: BB        .byte $BB   ; 
- D 1 - I - 0x00A783 02:A773: BB        .byte $BB   ; 
- D 1 - I - 0x00A784 02:A774: F3        .byte $F3   ; 
- D 1 - I - 0x00A785 02:A775: F4        .byte $F4   ; 
- D 1 - I - 0x00A786 02:A776: 9D        .byte $9D   ; 
- D 1 - I - 0x00A787 02:A777: E5        .byte $E5   ; 
- D 1 - I - 0x00A788 02:A778: A4        .byte $A4   ; 
- D 1 - I - 0x00A789 02:A779: A4        .byte $A4   ; 
- D 1 - I - 0x00A78A 02:A77A: A4        .byte $A4   ; 
- D 1 - I - 0x00A78B 02:A77B: A5        .byte $A5   ; 
- D 1 - I - 0x00A78C 02:A77C: 6E        .byte $6E   ; 
- D 1 - I - 0x00A78D 02:A77D: BD        .byte $BD   ; 
- D 1 - I - 0x00A78E 02:A77E: BD        .byte $BD   ; 
- D 1 - I - 0x00A78F 02:A77F: BD        .byte $BD   ; 
- D 1 - I - 0x00A790 02:A780: BB        .byte $BB   ; 
- D 1 - I - 0x00A791 02:A781: 71        .byte $71   ; 
- D 1 - I - 0x00A792 02:A782: C0        .byte $C0   ; 
- D 1 - I - 0x00A793 02:A783: C0        .byte $C0   ; 
- D 1 - I - 0x00A794 02:A784: B9        .byte $B9   ; 
- D 1 - I - 0x00A795 02:A785: E7        .byte $E7   ; 
- D 1 - I - 0x00A796 02:A786: 9E        .byte $9E   ; 
- D 1 - I - 0x00A797 02:A787: 9E        .byte $9E   ; 
- D 1 - I - 0x00A798 02:A788: A5        .byte $A5   ; 
- D 1 - I - 0x00A799 02:A789: 6D        .byte $6D   ; 
- D 1 - I - 0x00A79A 02:A78A: A6        .byte $A6   ; 
- D 1 - I - 0x00A79B 02:A78B: AA        .byte $AA   ; 
- D 1 - I - 0x00A79C 02:A78C: BD        .byte $BD   ; 
- D 1 - I - 0x00A79D 02:A78D: 6F        .byte $6F   ; 
- D 1 - I - 0x00A79E 02:A78E: 6D        .byte $6D   ; 
- D 1 - I - 0x00A79F 02:A78F: AA        .byte $AA   ; 
- D 1 - I - 0x00A7A0 02:A790: C0        .byte $C0   ; 
- D 1 - I - 0x00A7A1 02:A791: C0        .byte $C0   ; 
- D 1 - I - 0x00A7A2 02:A792: A7        .byte $A7   ; 
- D 1 - I - 0x00A7A3 02:A793: 70        .byte $70   ; 
- D 1 - I - 0x00A7A4 02:A794: E5        .byte $E5   ; 
- D 1 - I - 0x00A7A5 02:A795: B9        .byte $B9   ; 
- D 1 - I - 0x00A7A6 02:A796: E7        .byte $E7   ; 
- D 1 - I - 0x00A7A7 02:A797: E9        .byte $E9   ; 
- D 1 - I - 0x00A7A8 02:A798: B1        .byte $B1   ; 
- D 1 - I - 0x00A7A9 02:A799: B2        .byte $B2   ; 
- D 1 - I - 0x00A7AA 02:A79A: B2        .byte $B2   ; 
- D 1 - I - 0x00A7AB 02:A79B: B2        .byte $B2   ; 
- D 1 - I - 0x00A7AC 02:A79C: B3        .byte $B3   ; 
- D 1 - I - 0x00A7AD 02:A79D: AA        .byte $AA   ; 
- D 1 - I - 0x00A7AE 02:A79E: AA        .byte $AA   ; 
- D 1 - I - 0x00A7AF 02:A79F: AB        .byte $AB   ; 
- - - - - - 0x00A7B0 02:A7A0: B3        .byte $B3   ; 
- - - - - - 0x00A7B1 02:A7A1: AA        .byte $AA   ; 
- - - - - - 0x00A7B2 02:A7A2: AA        .byte $AA   ; 
- - - - - - 0x00A7B3 02:A7A3: AB        .byte $AB   ; 
- - - - - - 0x00A7B4 02:A7A4: B3        .byte $B3   ; 
- - - - - - 0x00A7B5 02:A7A5: AA        .byte $AA   ; 
- - - - - - 0x00A7B6 02:A7A6: AA        .byte $AA   ; 
- - - - - - 0x00A7B7 02:A7A7: AB        .byte $AB   ; 
- - - - - - 0x00A7B8 02:A7A8: B2        .byte $B2   ; 
- - - - - - 0x00A7B9 02:A7A9: F6        .byte $F6   ; 
- - - - - - 0x00A7BA 02:A7AA: A8        .byte $A8   ; 
- - - - - - 0x00A7BB 02:A7AB: BA        .byte $BA   ; 
- - - - - - 0x00A7BC 02:A7AC: AA        .byte $AA   ; 
- - - - - - 0x00A7BD 02:A7AD: 9C        .byte $9C   ; 
- - - - - - 0x00A7BE 02:A7AE: B3        .byte $B3   ; 
- - - - - - 0x00A7BF 02:A7AF: AA        .byte $AA   ; 
- - - - - - 0x00A7C0 02:A7B0: AA        .byte $AA   ; 
- - - - - - 0x00A7C1 02:A7B1: 9C        .byte $9C   ; 
- - - - - - 0x00A7C2 02:A7B2: B3        .byte $B3   ; 
- - - - - - 0x00A7C3 02:A7B3: AA        .byte $AA   ; 
- - - - - - 0x00A7C4 02:A7B4: AA        .byte $AA   ; 
- - - - - - 0x00A7C5 02:A7B5: 9C        .byte $9C   ; 
- - - - - - 0x00A7C6 02:A7B6: B3        .byte $B3   ; 
- - - - - - 0x00A7C7 02:A7B7: AA        .byte $AA   ; 
- - - - - - 0x00A7C8 02:A7B8: AC        .byte $AC   ; 
- - - - - - 0x00A7C9 02:A7B9: AC        .byte $AC   ; 
- - - - - - 0x00A7CA 02:A7BA: B2        .byte $B2   ; 
- - - - - - 0x00A7CB 02:A7BB: B2        .byte $B2   ; 
- - - - - - 0x00A7CC 02:A7BC: E2        .byte $E2   ; 
- - - - - - 0x00A7CD 02:A7BD: AA        .byte $AA   ; 
- - - - - - 0x00A7CE 02:A7BE: AA        .byte $AA   ; 
- - - - - - 0x00A7CF 02:A7BF: AA        .byte $AA   ; 
- - - - - - 0x00A7D0 02:A7C0: AA        .byte $AA   ; 
- - - - - - 0x00A7D1 02:A7C1: AA        .byte $AA   ; 
- - - - - - 0x00A7D2 02:A7C2: AA        .byte $AA   ; 
- - - - - - 0x00A7D3 02:A7C3: AA        .byte $AA   ; 
- - - - - - 0x00A7D4 02:A7C4: AA        .byte $AA   ; 
- - - - - - 0x00A7D5 02:A7C5: AA        .byte $AA   ; 
- - - - - - 0x00A7D6 02:A7C6: AA        .byte $AA   ; 
- - - - - - 0x00A7D7 02:A7C7: AA        .byte $AA   ; 
- D 1 - I - 0x00A7D8 02:A7C8: 00        .byte $00   ; 
- D 1 - I - 0x00A7D9 02:A7C9: 00        .byte $00   ; 
- D 1 - I - 0x00A7DA 02:A7CA: 00        .byte $00   ; 
- D 1 - I - 0x00A7DB 02:A7CB: 00        .byte $00   ; 
- D 1 - I - 0x00A7DC 02:A7CC: 00        .byte $00   ; 
- D 1 - I - 0x00A7DD 02:A7CD: 00        .byte $00   ; 
- D 1 - I - 0x00A7DE 02:A7CE: 01        .byte $01   ; 
- D 1 - I - 0x00A7DF 02:A7CF: 5E        .byte $5E   ; 
- D 1 - I - 0x00A7E0 02:A7D0: 01        .byte $01   ; 
- D 1 - I - 0x00A7E1 02:A7D1: 5E        .byte $5E   ; 
- D 1 - I - 0x00A7E2 02:A7D2: 02        .byte $02   ; 
- D 1 - I - 0x00A7E3 02:A7D3: 5F        .byte $5F   ; 
- D 1 - I - 0x00A7E4 02:A7D4: 02        .byte $02   ; 
- D 1 - I - 0x00A7E5 02:A7D5: 5F        .byte $5F   ; 
- D 1 - I - 0x00A7E6 02:A7D6: BD        .byte $BD   ; 
- D 1 - I - 0x00A7E7 02:A7D7: BD        .byte $BD   ; 
- D 1 - I - 0x00A7E8 02:A7D8: AA        .byte $AA   ; 
- D 1 - I - 0x00A7E9 02:A7D9: EB        .byte $EB   ; 
- D 1 - I - 0x00A7EA 02:A7DA: AA        .byte $AA   ; 
- D 1 - I - 0x00A7EB 02:A7DB: 9C        .byte $9C   ; 
- D 1 - I - 0x00A7EC 02:A7DC: AB        .byte $AB   ; 
- D 1 - I - 0x00A7ED 02:A7DD: EB        .byte $EB   ; 
- D 1 - I - 0x00A7EE 02:A7DE: AA        .byte $AA   ; 
- D 1 - I - 0x00A7EF 02:A7DF: 9C        .byte $9C   ; 
- D 1 - I - 0x00A7F0 02:A7E0: AA        .byte $AA   ; 
- D 1 - I - 0x00A7F1 02:A7E1: EB        .byte $EB   ; 
- D 1 - I - 0x00A7F2 02:A7E2: AA        .byte $AA   ; 
- D 1 - I - 0x00A7F3 02:A7E3: 9C        .byte $9C   ; 
- D 1 - I - 0x00A7F4 02:A7E4: AB        .byte $AB   ; 
- D 1 - I - 0x00A7F5 02:A7E5: EB        .byte $EB   ; 
- D 1 - I - 0x00A7F6 02:A7E6: AA        .byte $AA   ; 
- D 1 - I - 0x00A7F7 02:A7E7: F5        .byte $F5   ; 
- D 1 - I - 0x00A7F8 02:A7E8: B6        .byte $B6   ; 
- D 1 - I - 0x00A7F9 02:A7E9: 63        .byte $63   ; 
- D 1 - I - 0x00A7FA 02:A7EA: B7        .byte $B7   ; 
- D 1 - I - 0x00A7FB 02:A7EB: 64        .byte $64   ; 
- D 1 - I - 0x00A7FC 02:A7EC: DC        .byte $DC   ; 
- D 1 - I - 0x00A7FD 02:A7ED: DD        .byte $DD   ; 
- D 1 - I - 0x00A7FE 02:A7EE: 5B        .byte $5B   ; 
- D 1 - I - 0x00A7FF 02:A7EF: F2        .byte $F2   ; 
- - - - - - 0x00A800 02:A7F0: A8        .byte $A8   ; 
- - - - - - 0x00A801 02:A7F1: A1        .byte $A1   ; 
- - - - - - 0x00A802 02:A7F2: A1        .byte $A1   ; 
- - - - - - 0x00A803 02:A7F3: E6        .byte $E6   ; 
- - - - - - 0x00A804 02:A7F4: F1        .byte $F1   ; 
- - - - - - 0x00A805 02:A7F5: E2        .byte $E2   ; 
- - - - - - 0x00A806 02:A7F6: AA        .byte $AA   ; 
- - - - - - 0x00A807 02:A7F7: EA        .byte $EA   ; 
- D 1 - I - 0x00A808 02:A7F8: B8        .byte $B8   ; 
- D 1 - I - 0x00A809 02:A7F9: AA        .byte $AA   ; 
- D 1 - I - 0x00A80A 02:A7FA: B0        .byte $B0   ; 
- D 1 - I - 0x00A80B 02:A7FB: F5        .byte $F5   ; 
- D 1 - I - 0x00A80C 02:A7FC: F2        .byte $F2   ; 
- D 1 - I - 0x00A80D 02:A7FD: F2        .byte $F2   ; 
- D 1 - I - 0x00A80E 02:A7FE: F3        .byte $F3   ; 
- D 1 - I - 0x00A80F 02:A7FF: F4        .byte $F4   ; 
- - - - - - 0x00A810 02:A800: B9        .byte $B9   ; 
- - - - - - 0x00A811 02:A801: E7        .byte $E7   ; 
- - - - - - 0x00A812 02:A802: A1        .byte $A1   ; 
- - - - - - 0x00A813 02:A803: F6        .byte $F6   ; 
- - - - - - 0x00A814 02:A804: AB        .byte $AB   ; 
- - - - - - 0x00A815 02:A805: EB        .byte $EB   ; 
- - - - - - 0x00A816 02:A806: AA        .byte $AA   ; 
- - - - - - 0x00A817 02:A807: 9C        .byte $9C   ; 
- D 1 - I - 0x00A818 02:A808: AA        .byte $AA   ; 
- D 1 - I - 0x00A819 02:A809: EB        .byte $EB   ; 
- D 1 - I - 0x00A81A 02:A80A: AA        .byte $AA   ; 
- D 1 - I - 0x00A81B 02:A80B: F5        .byte $F5   ; 
- D 1 - I - 0x00A81C 02:A80C: AB        .byte $AB   ; 
- D 1 - I - 0x00A81D 02:A80D: EB        .byte $EB   ; 
- D 1 - I - 0x00A81E 02:A80E: F3        .byte $F3   ; 
- D 1 - I - 0x00A81F 02:A80F: F4        .byte $F4   ; 
- D 1 - I - 0x00A820 02:A810: AE        .byte $AE   ; 
- D 1 - I - 0x00A821 02:A811: E3        .byte $E3   ; 
- D 1 - I - 0x00A822 02:A812: A1        .byte $A1   ; 
- D 1 - I - 0x00A823 02:A813: F6        .byte $F6   ; 
- D 1 - I - 0x00A824 02:A814: AB        .byte $AB   ; 
- D 1 - I - 0x00A825 02:A815: EB        .byte $EB   ; 
- D 1 - I - 0x00A826 02:A816: AA        .byte $AA   ; 
- D 1 - I - 0x00A827 02:A817: 9C        .byte $9C   ; 
- D 1 - I - 0x00A828 02:A818: FC        .byte $FC   ; 
- D 1 - I - 0x00A829 02:A819: BD        .byte $BD   ; 
- D 1 - I - 0x00A82A 02:A81A: F8        .byte $F8   ; 
- D 1 - I - 0x00A82B 02:A81B: BD        .byte $BD   ; 
- D 1 - I - 0x00A82C 02:A81C: BD        .byte $BD   ; 
- D 1 - I - 0x00A82D 02:A81D: BD        .byte $BD   ; 
- D 1 - I - 0x00A82E 02:A81E: BD        .byte $BD   ; 
- D 1 - I - 0x00A82F 02:A81F: BD        .byte $BD   ; 
- - - - - - 0x00A830 02:A820: FA        .byte $FA   ; 
- - - - - - 0x00A831 02:A821: BD        .byte $BD   ; 
- - - - - - 0x00A832 02:A822: B5        .byte $B5   ; 
- - - - - - 0x00A833 02:A823: 62        .byte $62   ; 
- - - - - - 0x00A834 02:A824: B5        .byte $B5   ; 
- - - - - - 0x00A835 02:A825: 62        .byte $62   ; 
- - - - - - 0x00A836 02:A826: B6        .byte $B6   ; 
- - - - - - 0x00A837 02:A827: 63        .byte $63   ; 
- - - - - - 0x00A838 02:A828: B3        .byte $B3   ; 
- - - - - - 0x00A839 02:A829: AA        .byte $AA   ; 
- - - - - - 0x00A83A 02:A82A: AA        .byte $AA   ; 
- - - - - - 0x00A83B 02:A82B: AA        .byte $AA   ; 
- - - - - - 0x00A83C 02:A82C: F1        .byte $F1   ; 
- - - - - - 0x00A83D 02:A82D: F2        .byte $F2   ; 
- - - - - - 0x00A83E 02:A82E: F2        .byte $F2   ; 
- - - - - - 0x00A83F 02:A82F: F2        .byte $F2   ; 
- - - - - - 0x00A840 02:A830: A8        .byte $A8   ; 
- - - - - - 0x00A841 02:A831: A1        .byte $A1   ; 
- - - - - - 0x00A842 02:A832: A1        .byte $A1   ; 
- - - - - - 0x00A843 02:A833: E6        .byte $E6   ; 
- - - - - - 0x00A844 02:A834: A9        .byte $A9   ; 
- - - - - - 0x00A845 02:A835: E2        .byte $E2   ; 
- - - - - - 0x00A846 02:A836: AA        .byte $AA   ; 
- - - - - - 0x00A847 02:A837: EA        .byte $EA   ; 
- D 1 - I - 0x00A848 02:A838: B3        .byte $B3   ; 
- D 1 - I - 0x00A849 02:A839: AA        .byte $AA   ; 
- D 1 - I - 0x00A84A 02:A83A: AA        .byte $AA   ; 
- D 1 - I - 0x00A84B 02:A83B: EA        .byte $EA   ; 
- D 1 - I - 0x00A84C 02:A83C: F1        .byte $F1   ; 
- D 1 - I - 0x00A84D 02:A83D: F2        .byte $F2   ; 
- D 1 - I - 0x00A84E 02:A83E: F2        .byte $F2   ; 
- D 1 - I - 0x00A84F 02:A83F: EA        .byte $EA   ; 
- D 1 - I - 0x00A850 02:A840: A8        .byte $A8   ; 
- D 1 - I - 0x00A851 02:A841: A1        .byte $A1   ; 
- D 1 - I - 0x00A852 02:A842: A1        .byte $A1   ; 
- D 1 - I - 0x00A853 02:A843: EC        .byte $EC   ; 
- D 1 - I - 0x00A854 02:A844: A9        .byte $A9   ; 
- D 1 - I - 0x00A855 02:A845: E2        .byte $E2   ; 
- D 1 - I - 0x00A856 02:A846: AA        .byte $AA   ; 
- D 1 - I - 0x00A857 02:A847: EA        .byte $EA   ; 
- D 1 - I - 0x00A858 02:A848: B3        .byte $B3   ; 
- D 1 - I - 0x00A859 02:A849: AA        .byte $AA   ; 
- D 1 - I - 0x00A85A 02:A84A: AA        .byte $AA   ; 
- D 1 - I - 0x00A85B 02:A84B: EA        .byte $EA   ; 
- D 1 - I - 0x00A85C 02:A84C: B3        .byte $B3   ; 
- D 1 - I - 0x00A85D 02:A84D: AA        .byte $AA   ; 
- D 1 - I - 0x00A85E 02:A84E: AA        .byte $AA   ; 
- D 1 - I - 0x00A85F 02:A84F: EA        .byte $EA   ; 
- D 1 - I - 0x00A860 02:A850: B3        .byte $B3   ; 
- D 1 - I - 0x00A861 02:A851: AA        .byte $AA   ; 
- D 1 - I - 0x00A862 02:A852: AA        .byte $AA   ; 
- D 1 - I - 0x00A863 02:A853: EA        .byte $EA   ; 
- D 1 - I - 0x00A864 02:A854: B3        .byte $B3   ; 
- D 1 - I - 0x00A865 02:A855: AA        .byte $AA   ; 
- D 1 - I - 0x00A866 02:A856: AA        .byte $AA   ; 
- D 1 - I - 0x00A867 02:A857: EA        .byte $EA   ; 
- D 1 - I - 0x00A868 02:A858: 01        .byte $01   ; 
- D 1 - I - 0x00A869 02:A859: 5E        .byte $5E   ; 
- D 1 - I - 0x00A86A 02:A85A: 02        .byte $02   ; 
- D 1 - I - 0x00A86B 02:A85B: 5F        .byte $5F   ; 
- D 1 - I - 0x00A86C 02:A85C: 60        .byte $60   ; 
- D 1 - I - 0x00A86D 02:A85D: 5F        .byte $5F   ; 
- D 1 - I - 0x00A86E 02:A85E: BD        .byte $BD   ; 
- D 1 - I - 0x00A86F 02:A85F: BD        .byte $BD   ; 
- D 1 - I - 0x00A870 02:A860: FD        .byte $FD   ; 
- D 1 - I - 0x00A871 02:A861: E0        .byte $E0   ; 
- D 1 - I - 0x00A872 02:A862: F8        .byte $F8   ; 
- D 1 - I - 0x00A873 02:A863: BD        .byte $BD   ; 
- D 1 - I - 0x00A874 02:A864: BD        .byte $BD   ; 
- D 1 - I - 0x00A875 02:A865: BE        .byte $BE   ; 
- D 1 - I - 0x00A876 02:A866: E0        .byte $E0   ; 
- D 1 - I - 0x00A877 02:A867: BD        .byte $BD   ; 
- D 1 - I - 0x00A878 02:A868: FA        .byte $FA   ; 
- D 1 - I - 0x00A879 02:A869: BD        .byte $BD   ; 
- D 1 - I - 0x00A87A 02:A86A: B4        .byte $B4   ; 
- D 1 - I - 0x00A87B 02:A86B: 61        .byte $61   ; 
- D 1 - I - 0x00A87C 02:A86C: B5        .byte $B5   ; 
- D 1 - I - 0x00A87D 02:A86D: 62        .byte $62   ; 
- D 1 - I - 0x00A87E 02:A86E: B6        .byte $B6   ; 
- D 1 - I - 0x00A87F 02:A86F: 5C        .byte $5C   ; 
- - - - - - 0x00A880 02:A870: B6        .byte $B6   ; 
- - - - - - 0x00A881 02:A871: 63        .byte $63   ; 
- - - - - - 0x00A882 02:A872: B7        .byte $B7   ; 
- - - - - - 0x00A883 02:A873: 5D        .byte $5D   ; 
- - - - - - 0x00A884 02:A874: B7        .byte $B7   ; 
- - - - - - 0x00A885 02:A875: 64        .byte $64   ; 
- - - - - - 0x00A886 02:A876: B8        .byte $B8   ; 
- - - - - - 0x00A887 02:A877: 9C        .byte $9C   ; 
- - - - - - 0x00A888 02:A878: AE        .byte $AE   ; 
- - - - - - 0x00A889 02:A879: ED        .byte $ED   ; 
- - - - - - 0x00A88A 02:A87A: A9        .byte $A9   ; 
- - - - - - 0x00A88B 02:A87B: E2        .byte $E2   ; 
- - - - - - 0x00A88C 02:A87C: AB        .byte $AB   ; 
- - - - - - 0x00A88D 02:A87D: EE        .byte $EE   ; 
- - - - - - 0x00A88E 02:A87E: B3        .byte $B3   ; 
- - - - - - 0x00A88F 02:A87F: AA        .byte $AA   ; 
- - - - - - 0x00A890 02:A880: AA        .byte $AA   ; 
- - - - - - 0x00A891 02:A881: EE        .byte $EE   ; 
- - - - - - 0x00A892 02:A882: B3        .byte $B3   ; 
- - - - - - 0x00A893 02:A883: AA        .byte $AA   ; 
- - - - - - 0x00A894 02:A884: AB        .byte $AB   ; 
- - - - - - 0x00A895 02:A885: EE        .byte $EE   ; 
- - - - - - 0x00A896 02:A886: B3        .byte $B3   ; 
- - - - - - 0x00A897 02:A887: AA        .byte $AA   ; 
- - - - - - 0x00A898 02:A888: AA        .byte $AA   ; 
- - - - - - 0x00A899 02:A889: 9C        .byte $9C   ; 
- - - - - - 0x00A89A 02:A88A: AD        .byte $AD   ; 
- - - - - - 0x00A89B 02:A88B: AD        .byte $AD   ; 
- - - - - - 0x00A89C 02:A88C: AA        .byte $AA   ; 
- - - - - - 0x00A89D 02:A88D: F5        .byte $F5   ; 
- - - - - - 0x00A89E 02:A88E: 00        .byte $00   ; 
- - - - - - 0x00A89F 02:A88F: 9C        .byte $9C   ; 
- - - - - - 0x00A8A0 02:A890: AA        .byte $AA   ; 
- - - - - - 0x00A8A1 02:A891: F5        .byte $F5   ; 
- - - - - - 0x00A8A2 02:A892: A2        .byte $A2   ; 
- - - - - - 0x00A8A3 02:A893: 9C        .byte $9C   ; 
- - - - - - 0x00A8A4 02:A894: AA        .byte $AA   ; 
- - - - - - 0x00A8A5 02:A895: F5        .byte $F5   ; 
- - - - - - 0x00A8A6 02:A896: 00        .byte $00   ; 
- - - - - - 0x00A8A7 02:A897: 9C        .byte $9C   ; 
- - - - - - 0x00A8A8 02:A898: AD        .byte $AD   ; 
- - - - - - 0x00A8A9 02:A899: DE        .byte $DE   ; 
- - - - - - 0x00A8AA 02:A89A: AB        .byte $AB   ; 
- - - - - - 0x00A8AB 02:A89B: EB        .byte $EB   ; 
- - - - - - 0x00A8AC 02:A89C: B3        .byte $B3   ; 
- - - - - - 0x00A8AD 02:A89D: EA        .byte $EA   ; 
- - - - - - 0x00A8AE 02:A89E: AA        .byte $AA   ; 
- - - - - - 0x00A8AF 02:A89F: EB        .byte $EB   ; 
- - - - - - 0x00A8B0 02:A8A0: B3        .byte $B3   ; 
- - - - - - 0x00A8B1 02:A8A1: EA        .byte $EA   ; 
- - - - - - 0x00A8B2 02:A8A2: AB        .byte $AB   ; 
- - - - - - 0x00A8B3 02:A8A3: EB        .byte $EB   ; 
- - - - - - 0x00A8B4 02:A8A4: B3        .byte $B3   ; 
- - - - - - 0x00A8B5 02:A8A5: EA        .byte $EA   ; 
- - - - - - 0x00A8B6 02:A8A6: AA        .byte $AA   ; 
- - - - - - 0x00A8B7 02:A8A7: EB        .byte $EB   ; 
- D 1 - I - 0x00A8B8 02:A8A8: A8        .byte $A8   ; 
- D 1 - I - 0x00A8B9 02:A8A9: A1        .byte $A1   ; 
- D 1 - I - 0x00A8BA 02:A8AA: A1        .byte $A1   ; 
- D 1 - I - 0x00A8BB 02:A8AB: F6        .byte $F6   ; 
- D 1 - I - 0x00A8BC 02:A8AC: A9        .byte $A9   ; 
- D 1 - I - 0x00A8BD 02:A8AD: AB        .byte $AB   ; 
- D 1 - I - 0x00A8BE 02:A8AE: AA        .byte $AA   ; 
- D 1 - I - 0x00A8BF 02:A8AF: 9C        .byte $9C   ; 
- D 1 - I - 0x00A8C0 02:A8B0: B3        .byte $B3   ; 
- D 1 - I - 0x00A8C1 02:A8B1: AB        .byte $AB   ; 
- D 1 - I - 0x00A8C2 02:A8B2: AA        .byte $AA   ; 
- D 1 - I - 0x00A8C3 02:A8B3: F5        .byte $F5   ; 
- D 1 - I - 0x00A8C4 02:A8B4: F1        .byte $F1   ; 
- D 1 - I - 0x00A8C5 02:A8B5: F2        .byte $F2   ; 
- D 1 - I - 0x00A8C6 02:A8B6: F3        .byte $F3   ; 
- D 1 - I - 0x00A8C7 02:A8B7: F4        .byte $F4   ; 
- D 1 - I - 0x00A8C8 02:A8B8: BD        .byte $BD   ; 
- D 1 - I - 0x00A8C9 02:A8B9: BD        .byte $BD   ; 
- D 1 - I - 0x00A8CA 02:A8BA: BD        .byte $BD   ; 
- D 1 - I - 0x00A8CB 02:A8BB: BD        .byte $BD   ; 
- D 1 - I - 0x00A8CC 02:A8BC: BD        .byte $BD   ; 
- D 1 - I - 0x00A8CD 02:A8BD: BD        .byte $BD   ; 
- D 1 - I - 0x00A8CE 02:A8BE: BD        .byte $BD   ; 
- D 1 - I - 0x00A8CF 02:A8BF: BD        .byte $BD   ; 
- D 1 - I - 0x00A8D0 02:A8C0: C0        .byte $C0   ; 
- D 1 - I - 0x00A8D1 02:A8C1: C0        .byte $C0   ; 
- D 1 - I - 0x00A8D2 02:A8C2: C0        .byte $C0   ; 
- D 1 - I - 0x00A8D3 02:A8C3: C0        .byte $C0   ; 
- D 1 - I - 0x00A8D4 02:A8C4: 9D        .byte $9D   ; 
- D 1 - I - 0x00A8D5 02:A8C5: 9E        .byte $9E   ; 
- D 1 - I - 0x00A8D6 02:A8C6: 9E        .byte $9E   ; 
- D 1 - I - 0x00A8D7 02:A8C7: E9        .byte $E9   ; 
- D 1 - I - 0x00A8D8 02:A8C8: 81        .byte $81   ; 
- D 1 - I - 0x00A8D9 02:A8C9: 83        .byte $83   ; 
- D 1 - I - 0x00A8DA 02:A8CA: 18        .byte $18   ; 
- D 1 - I - 0x00A8DB 02:A8CB: 84        .byte $84   ; 
- D 1 - I - 0x00A8DC 02:A8CC: 00        .byte $00   ; 
- D 1 - I - 0x00A8DD 02:A8CD: 00        .byte $00   ; 
- D 1 - I - 0x00A8DE 02:A8CE: 15        .byte $15   ; 
- D 1 - I - 0x00A8DF 02:A8CF: 00        .byte $00   ; 
- D 1 - I - 0x00A8E0 02:A8D0: 00        .byte $00   ; 
- D 1 - I - 0x00A8E1 02:A8D1: 00        .byte $00   ; 
- D 1 - I - 0x00A8E2 02:A8D2: 15        .byte $15   ; 
- D 1 - I - 0x00A8E3 02:A8D3: 00        .byte $00   ; 
- D 1 - I - 0x00A8E4 02:A8D4: 00        .byte $00   ; 
- D 1 - I - 0x00A8E5 02:A8D5: 00        .byte $00   ; 
- D 1 - I - 0x00A8E6 02:A8D6: 15        .byte $15   ; 
- D 1 - I - 0x00A8E7 02:A8D7: 00        .byte $00   ; 
- D 1 - I - 0x00A8E8 02:A8D8: 00        .byte $00   ; 
- D 1 - I - 0x00A8E9 02:A8D9: 1A        .byte $1A   ; 
- D 1 - I - 0x00A8EA 02:A8DA: 1A        .byte $1A   ; 
- D 1 - I - 0x00A8EB 02:A8DB: 1B        .byte $1B   ; 
- D 1 - I - 0x00A8EC 02:A8DC: 1D        .byte $1D   ; 
- D 1 - I - 0x00A8ED 02:A8DD: 7C        .byte $7C   ; 
- D 1 - I - 0x00A8EE 02:A8DE: 1E        .byte $1E   ; 
- D 1 - I - 0x00A8EF 02:A8DF: 7D        .byte $7D   ; 
- D 1 - I - 0x00A8F0 02:A8E0: 1B        .byte $1B   ; 
- D 1 - I - 0x00A8F1 02:A8E1: 00        .byte $00   ; 
- D 1 - I - 0x00A8F2 02:A8E2: 00        .byte $00   ; 
- D 1 - I - 0x00A8F3 02:A8E3: 00        .byte $00   ; 
- D 1 - I - 0x00A8F4 02:A8E4: 7D        .byte $7D   ; 
- D 1 - I - 0x00A8F5 02:A8E5: 00        .byte $00   ; 
- D 1 - I - 0x00A8F6 02:A8E6: 1F        .byte $1F   ; 
- D 1 - I - 0x00A8F7 02:A8E7: 1C        .byte $1C   ; 
- D 1 - I - 0x00A8F8 02:A8E8: 11        .byte $11   ; 
- D 1 - I - 0x00A8F9 02:A8E9: 12        .byte $12   ; 
- D 1 - I - 0x00A8FA 02:A8EA: 11        .byte $11   ; 
- D 1 - I - 0x00A8FB 02:A8EB: 12        .byte $12   ; 
- D 1 - I - 0x00A8FC 02:A8EC: 00        .byte $00   ; 
- D 1 - I - 0x00A8FD 02:A8ED: 00        .byte $00   ; 
- D 1 - I - 0x00A8FE 02:A8EE: 00        .byte $00   ; 
- D 1 - I - 0x00A8FF 02:A8EF: 00        .byte $00   ; 
- D 1 - I - 0x00A900 02:A8F0: 19        .byte $19   ; 
- D 1 - I - 0x00A901 02:A8F1: 00        .byte $00   ; 
- D 1 - I - 0x00A902 02:A8F2: 00        .byte $00   ; 
- D 1 - I - 0x00A903 02:A8F3: 1B        .byte $1B   ; 
- D 1 - I - 0x00A904 02:A8F4: 1C        .byte $1C   ; 
- D 1 - I - 0x00A905 02:A8F5: 1D        .byte $1D   ; 
- D 1 - I - 0x00A906 02:A8F6: 1E        .byte $1E   ; 
- D 1 - I - 0x00A907 02:A8F7: 7D        .byte $7D   ; 
- D 1 - I - 0x00A908 02:A8F8: 12        .byte $12   ; 
- D 1 - I - 0x00A909 02:A8F9: 12        .byte $12   ; 
- D 1 - I - 0x00A90A 02:A8FA: 13        .byte $13   ; 
- D 1 - I - 0x00A90B 02:A8FB: 75        .byte $75   ; 
- D 1 - I - 0x00A90C 02:A8FC: 00        .byte $00   ; 
- D 1 - I - 0x00A90D 02:A8FD: 00        .byte $00   ; 
- D 1 - I - 0x00A90E 02:A8FE: 00        .byte $00   ; 
- D 1 - I - 0x00A90F 02:A8FF: 38        .byte $38   ; 
- D 1 - I - 0x00A910 02:A900: 00        .byte $00   ; 
- D 1 - I - 0x00A911 02:A901: 00        .byte $00   ; 
- D 1 - I - 0x00A912 02:A902: 01        .byte $01   ; 
- D 1 - I - 0x00A913 02:A903: 3A        .byte $3A   ; 
- D 1 - I - 0x00A914 02:A904: 3D        .byte $3D   ; 
- D 1 - I - 0x00A915 02:A905: 3E        .byte $3E   ; 
- D 1 - I - 0x00A916 02:A906: 3F        .byte $3F   ; 
- D 1 - I - 0x00A917 02:A907: 40        .byte $40   ; 
- D 1 - I - 0x00A918 02:A908: 14        .byte $14   ; 
- D 1 - I - 0x00A919 02:A909: 76        .byte $76   ; 
- D 1 - I - 0x00A91A 02:A90A: 12        .byte $12   ; 
- D 1 - I - 0x00A91B 02:A90B: 12        .byte $12   ; 
- D 1 - I - 0x00A91C 02:A90C: 39        .byte $39   ; 
- D 1 - I - 0x00A91D 02:A90D: 00        .byte $00   ; 
- D 1 - I - 0x00A91E 02:A90E: 00        .byte $00   ; 
- D 1 - I - 0x00A91F 02:A90F: 00        .byte $00   ; 
- D 1 - I - 0x00A920 02:A910: 02        .byte $02   ; 
- D 1 - I - 0x00A921 02:A911: 3B        .byte $3B   ; 
- D 1 - I - 0x00A922 02:A912: 00        .byte $00   ; 
- D 1 - I - 0x00A923 02:A913: 3C        .byte $3C   ; 
- D 1 - I - 0x00A924 02:A914: 41        .byte $41   ; 
- D 1 - I - 0x00A925 02:A915: 42        .byte $42   ; 
- D 1 - I - 0x00A926 02:A916: 43        .byte $43   ; 
- D 1 - I - 0x00A927 02:A917: 44        .byte $44   ; 
- D 1 - I - 0x00A928 02:A918: 00        .byte $00   ; 
- D 1 - I - 0x00A929 02:A919: 00        .byte $00   ; 
- D 1 - I - 0x00A92A 02:A91A: 00        .byte $00   ; 
- D 1 - I - 0x00A92B 02:A91B: 00        .byte $00   ; 
- D 1 - I - 0x00A92C 02:A91C: 00        .byte $00   ; 
- D 1 - I - 0x00A92D 02:A91D: 00        .byte $00   ; 
- D 1 - I - 0x00A92E 02:A91E: 00        .byte $00   ; 
- D 1 - I - 0x00A92F 02:A91F: 00        .byte $00   ; 
- D 1 - I - 0x00A930 02:A920: 1A        .byte $1A   ; 
- D 1 - I - 0x00A931 02:A921: 19        .byte $19   ; 
- D 1 - I - 0x00A932 02:A922: 00        .byte $00   ; 
- D 1 - I - 0x00A933 02:A923: 1A        .byte $1A   ; 
- D 1 - I - 0x00A934 02:A924: 1E        .byte $1E   ; 
- D 1 - I - 0x00A935 02:A925: 1C        .byte $1C   ; 
- D 1 - I - 0x00A936 02:A926: 1D        .byte $1D   ; 
- D 1 - I - 0x00A937 02:A927: 7C        .byte $7C   ; 
- D 1 - I - 0x00A938 02:A928: 00        .byte $00   ; 
- D 1 - I - 0x00A939 02:A929: 00        .byte $00   ; 
- D 1 - I - 0x00A93A 02:A92A: 00        .byte $00   ; 
- D 1 - I - 0x00A93B 02:A92B: 45        .byte $45   ; 
- D 1 - I - 0x00A93C 02:A92C: 00        .byte $00   ; 
- D 1 - I - 0x00A93D 02:A92D: 00        .byte $00   ; 
- D 1 - I - 0x00A93E 02:A92E: 4A        .byte $4A   ; 
- D 1 - I - 0x00A93F 02:A92F: 4B        .byte $4B   ; 
- D 1 - I - 0x00A940 02:A930: 19        .byte $19   ; 
- D 1 - I - 0x00A941 02:A931: 1A        .byte $1A   ; 
- D 1 - I - 0x00A942 02:A932: 06        .byte $06   ; 
- D 1 - I - 0x00A943 02:A933: 54        .byte $54   ; 
- D 1 - I - 0x00A944 02:A934: 1E        .byte $1E   ; 
- D 1 - I - 0x00A945 02:A935: 7D        .byte $7D   ; 
- D 1 - I - 0x00A946 02:A936: 59        .byte $59   ; 
- D 1 - I - 0x00A947 02:A937: 00        .byte $00   ; 
- D 1 - I - 0x00A948 02:A938: 03        .byte $03   ; 
- D 1 - I - 0x00A949 02:A939: 46        .byte $46   ; 
- D 1 - I - 0x00A94A 02:A93A: 00        .byte $00   ; 
- D 1 - I - 0x00A94B 02:A93B: 47        .byte $47   ; 
- D 1 - I - 0x00A94C 02:A93C: 4C        .byte $4C   ; 
- D 1 - I - 0x00A94D 02:A93D: 4D        .byte $4D   ; 
- D 1 - I - 0x00A94E 02:A93E: 4E        .byte $4E   ; 
- D 1 - I - 0x00A94F 02:A93F: 4F        .byte $4F   ; 
- D 1 - I - 0x00A950 02:A940: 07        .byte $07   ; 
- D 1 - I - 0x00A951 02:A941: 55        .byte $55   ; 
- D 1 - I - 0x00A952 02:A942: 08        .byte $08   ; 
- D 1 - I - 0x00A953 02:A943: 56        .byte $56   ; 
- D 1 - I - 0x00A954 02:A944: 00        .byte $00   ; 
- D 1 - I - 0x00A955 02:A945: 00        .byte $00   ; 
- D 1 - I - 0x00A956 02:A946: 5A        .byte $5A   ; 
- D 1 - I - 0x00A957 02:A947: 5B        .byte $5B   ; 
- D 1 - I - 0x00A958 02:A948: 04        .byte $04   ; 
- D 1 - I - 0x00A959 02:A949: 48        .byte $48   ; 
- D 1 - I - 0x00A95A 02:A94A: 05        .byte $05   ; 
- D 1 - I - 0x00A95B 02:A94B: 49        .byte $49   ; 
- D 1 - I - 0x00A95C 02:A94C: 50        .byte $50   ; 
- D 1 - I - 0x00A95D 02:A94D: 51        .byte $51   ; 
- D 1 - I - 0x00A95E 02:A94E: 52        .byte $52   ; 
- D 1 - I - 0x00A95F 02:A94F: 53        .byte $53   ; 
- D 1 - I - 0x00A960 02:A950: 09        .byte $09   ; 
- D 1 - I - 0x00A961 02:A951: 57        .byte $57   ; 
- D 1 - I - 0x00A962 02:A952: 0A        .byte $0A   ; 
- D 1 - I - 0x00A963 02:A953: 58        .byte $58   ; 
- D 1 - I - 0x00A964 02:A954: 5C        .byte $5C   ; 
- D 1 - I - 0x00A965 02:A955: 5D        .byte $5D   ; 
- D 1 - I - 0x00A966 02:A956: 5E        .byte $5E   ; 
- D 1 - I - 0x00A967 02:A957: 5F        .byte $5F   ; 
- D 1 - I - 0x00A968 02:A958: 00        .byte $00   ; 
- D 1 - I - 0x00A969 02:A959: 00        .byte $00   ; 
- D 1 - I - 0x00A96A 02:A95A: 00        .byte $00   ; 
- D 1 - I - 0x00A96B 02:A95B: 19        .byte $19   ; 
- D 1 - I - 0x00A96C 02:A95C: 00        .byte $00   ; 
- D 1 - I - 0x00A96D 02:A95D: 00        .byte $00   ; 
- D 1 - I - 0x00A96E 02:A95E: 1F        .byte $1F   ; 
- D 1 - I - 0x00A96F 02:A95F: 1C        .byte $1C   ; 
- D 1 - I - 0x00A970 02:A960: 19        .byte $19   ; 
- D 1 - I - 0x00A971 02:A961: 00        .byte $00   ; 
- D 1 - I - 0x00A972 02:A962: 00        .byte $00   ; 
- D 1 - I - 0x00A973 02:A963: 1B        .byte $1B   ; 
- D 1 - I - 0x00A974 02:A964: 1C        .byte $1C   ; 
- D 1 - I - 0x00A975 02:A965: 1D        .byte $1D   ; 
- D 1 - I - 0x00A976 02:A966: 1E        .byte $1E   ; 
- D 1 - I - 0x00A977 02:A967: 7D        .byte $7D   ; 
- D 1 - I - 0x00A978 02:A968: 00        .byte $00   ; 
- D 1 - I - 0x00A979 02:A969: 00        .byte $00   ; 
- D 1 - I - 0x00A97A 02:A96A: 0C        .byte $0C   ; 
- D 1 - I - 0x00A97B 02:A96B: 61        .byte $61   ; 
- D 1 - I - 0x00A97C 02:A96C: 00        .byte $00   ; 
- D 1 - I - 0x00A97D 02:A96D: 64        .byte $64   ; 
- D 1 - I - 0x00A97E 02:A96E: 65        .byte $65   ; 
- D 1 - I - 0x00A97F 02:A96F: 66        .byte $66   ; 
- D 1 - I - 0x00A980 02:A970: 00        .byte $00   ; 
- D 1 - I - 0x00A981 02:A971: 70        .byte $70   ; 
- D 1 - I - 0x00A982 02:A972: 0F        .byte $0F   ; 
- D 1 - I - 0x00A983 02:A973: 71        .byte $71   ; 
- D 1 - I - 0x00A984 02:A974: 00        .byte $00   ; 
- D 1 - I - 0x00A985 02:A975: 00        .byte $00   ; 
- D 1 - I - 0x00A986 02:A976: 00        .byte $00   ; 
- D 1 - I - 0x00A987 02:A977: 00        .byte $00   ; 
- D 1 - I - 0x00A988 02:A978: 00        .byte $00   ; 
- D 1 - I - 0x00A989 02:A979: 00        .byte $00   ; 
- D 1 - I - 0x00A98A 02:A97A: 00        .byte $00   ; 
- D 1 - I - 0x00A98B 02:A97B: 00        .byte $00   ; 
- D 1 - I - 0x00A98C 02:A97C: 67        .byte $67   ; 
- D 1 - I - 0x00A98D 02:A97D: 68        .byte $68   ; 
- D 1 - I - 0x00A98E 02:A97E: 69        .byte $69   ; 
- D 1 - I - 0x00A98F 02:A97F: 6A        .byte $6A   ; 
- D 1 - I - 0x00A990 02:A980: 00        .byte $00   ; 
- D 1 - I - 0x00A991 02:A981: 00        .byte $00   ; 
- D 1 - I - 0x00A992 02:A982: 00        .byte $00   ; 
- D 1 - I - 0x00A993 02:A983: 1A        .byte $1A   ; 
- D 1 - I - 0x00A994 02:A984: 1F        .byte $1F   ; 
- D 1 - I - 0x00A995 02:A985: 1C        .byte $1C   ; 
- D 1 - I - 0x00A996 02:A986: 1D        .byte $1D   ; 
- D 1 - I - 0x00A997 02:A987: 7C        .byte $7C   ; 
- D 1 - I - 0x00A998 02:A988: 00        .byte $00   ; 
- D 1 - I - 0x00A999 02:A989: 00        .byte $00   ; 
- D 1 - I - 0x00A99A 02:A98A: 0D        .byte $0D   ; 
- D 1 - I - 0x00A99B 02:A98B: 62        .byte $62   ; 
- D 1 - I - 0x00A99C 02:A98C: 6A        .byte $6A   ; 
- D 1 - I - 0x00A99D 02:A98D: 6B        .byte $6B   ; 
- D 1 - I - 0x00A99E 02:A98E: 6C        .byte $6C   ; 
- D 1 - I - 0x00A99F 02:A98F: 6D        .byte $6D   ; 
- D 1 - I - 0x00A9A0 02:A990: 1B        .byte $1B   ; 
- D 1 - I - 0x00A9A1 02:A991: 00        .byte $00   ; 
- D 1 - I - 0x00A9A2 02:A992: 10        .byte $10   ; 
- D 1 - I - 0x00A9A3 02:A993: 72        .byte $72   ; 
- D 1 - I - 0x00A9A4 02:A994: 7D        .byte $7D   ; 
- D 1 - I - 0x00A9A5 02:A995: 00        .byte $00   ; 
- D 1 - I - 0x00A9A6 02:A996: 73        .byte $73   ; 
- D 1 - I - 0x00A9A7 02:A997: 74        .byte $74   ; 
- D 1 - I - 0x00A9A8 02:A998: 34        .byte $34   ; 
- D 1 - I - 0x00A9A9 02:A999: 32        .byte $32   ; 
- D 1 - I - 0x00A9AA 02:A99A: 32        .byte $32   ; 
- D 1 - I - 0x00A9AB 02:A99B: 32        .byte $32   ; 
- D 1 - I - 0x00A9AC 02:A99C: 81        .byte $81   ; 
- D 1 - I - 0x00A9AD 02:A99D: 83        .byte $83   ; 
- D 1 - I - 0x00A9AE 02:A99E: 80        .byte $80   ; 
- D 1 - I - 0x00A9AF 02:A99F: 34        .byte $34   ; 
- D 1 - I - 0x00A9B0 02:A9A0: 00        .byte $00   ; 
- D 1 - I - 0x00A9B1 02:A9A1: 00        .byte $00   ; 
- D 1 - I - 0x00A9B2 02:A9A2: 00        .byte $00   ; 
- D 1 - I - 0x00A9B3 02:A9A3: 00        .byte $00   ; 
- D 1 - I - 0x00A9B4 02:A9A4: 00        .byte $00   ; 
- D 1 - I - 0x00A9B5 02:A9A5: 00        .byte $00   ; 
- D 1 - I - 0x00A9B6 02:A9A6: 00        .byte $00   ; 
- D 1 - I - 0x00A9B7 02:A9A7: 00        .byte $00   ; 
- D 1 - I - 0x00A9B8 02:A9A8: 32        .byte $32   ; 
- D 1 - I - 0x00A9B9 02:A9A9: 32        .byte $32   ; 
- D 1 - I - 0x00A9BA 02:A9AA: 32        .byte $32   ; 
- D 1 - I - 0x00A9BB 02:A9AB: 80        .byte $80   ; 
- D 1 - I - 0x00A9BC 02:A9AC: 80        .byte $80   ; 
- D 1 - I - 0x00A9BD 02:A9AD: 84        .byte $84   ; 
- D 1 - I - 0x00A9BE 02:A9AE: 82        .byte $82   ; 
- D 1 - I - 0x00A9BF 02:A9AF: 00        .byte $00   ; 
- D 1 - I - 0x00A9C0 02:A9B0: 00        .byte $00   ; 
- D 1 - I - 0x00A9C1 02:A9B1: 00        .byte $00   ; 
- D 1 - I - 0x00A9C2 02:A9B2: 00        .byte $00   ; 
- D 1 - I - 0x00A9C3 02:A9B3: 00        .byte $00   ; 
- D 1 - I - 0x00A9C4 02:A9B4: 00        .byte $00   ; 
- D 1 - I - 0x00A9C5 02:A9B5: 00        .byte $00   ; 
- D 1 - I - 0x00A9C6 02:A9B6: 00        .byte $00   ; 
- D 1 - I - 0x00A9C7 02:A9B7: 00        .byte $00   ; 
- D 1 - I - 0x00A9C8 02:A9B8: 00        .byte $00   ; 
- D 1 - I - 0x00A9C9 02:A9B9: 00        .byte $00   ; 
- D 1 - I - 0x00A9CA 02:A9BA: 00        .byte $00   ; 
- D 1 - I - 0x00A9CB 02:A9BB: 1F        .byte $1F   ; 
- D 1 - I - 0x00A9CC 02:A9BC: 00        .byte $00   ; 
- D 1 - I - 0x00A9CD 02:A9BD: 00        .byte $00   ; 
- D 1 - I - 0x00A9CE 02:A9BE: 00        .byte $00   ; 
- D 1 - I - 0x00A9CF 02:A9BF: 00        .byte $00   ; 
- D 1 - I - 0x00A9D0 02:A9C0: 00        .byte $00   ; 
- D 1 - I - 0x00A9D1 02:A9C1: 00        .byte $00   ; 
- D 1 - I - 0x00A9D2 02:A9C2: 00        .byte $00   ; 
- D 1 - I - 0x00A9D3 02:A9C3: 22        .byte $22   ; 
- D 1 - I - 0x00A9D4 02:A9C4: 22        .byte $22   ; 
- D 1 - I - 0x00A9D5 02:A9C5: 23        .byte $23   ; 
- D 1 - I - 0x00A9D6 02:A9C6: 25        .byte $25   ; 
- D 1 - I - 0x00A9D7 02:A9C7: 25        .byte $25   ; 
- D 1 - I - 0x00A9D8 02:A9C8: 1C        .byte $1C   ; 
- D 1 - I - 0x00A9D9 02:A9C9: 7E        .byte $7E   ; 
- D 1 - I - 0x00A9DA 02:A9CA: 15        .byte $15   ; 
- D 1 - I - 0x00A9DB 02:A9CB: 00        .byte $00   ; 
- D 1 - I - 0x00A9DC 02:A9CC: 00        .byte $00   ; 
- D 1 - I - 0x00A9DD 02:A9CD: 00        .byte $00   ; 
- D 1 - I - 0x00A9DE 02:A9CE: 15        .byte $15   ; 
- D 1 - I - 0x00A9DF 02:A9CF: 00        .byte $00   ; 
- D 1 - I - 0x00A9E0 02:A9D0: 23        .byte $23   ; 
- D 1 - I - 0x00A9E1 02:A9D1: 23        .byte $23   ; 
- D 1 - I - 0x00A9E2 02:A9D2: 15        .byte $15   ; 
- D 1 - I - 0x00A9E3 02:A9D3: 23        .byte $23   ; 
- D 1 - I - 0x00A9E4 02:A9D4: 35        .byte $35   ; 
- D 1 - I - 0x00A9E5 02:A9D5: 35        .byte $35   ; 
- D 1 - I - 0x00A9E6 02:A9D6: 79        .byte $79   ; 
- D 1 - I - 0x00A9E7 02:A9D7: 35        .byte $35   ; 
- D 1 - I - 0x00A9E8 02:A9D8: 12        .byte $12   ; 
- D 1 - I - 0x00A9E9 02:A9D9: 11        .byte $11   ; 
- D 1 - I - 0x00A9EA 02:A9DA: 12        .byte $12   ; 
- D 1 - I - 0x00A9EB 02:A9DB: 11        .byte $11   ; 
- D 1 - I - 0x00A9EC 02:A9DC: 00        .byte $00   ; 
- D 1 - I - 0x00A9ED 02:A9DD: 00        .byte $00   ; 
- D 1 - I - 0x00A9EE 02:A9DE: 00        .byte $00   ; 
- D 1 - I - 0x00A9EF 02:A9DF: 00        .byte $00   ; 
- D 1 - I - 0x00A9F0 02:A9E0: 00        .byte $00   ; 
- D 1 - I - 0x00A9F1 02:A9E1: 00        .byte $00   ; 
- D 1 - I - 0x00A9F2 02:A9E2: 00        .byte $00   ; 
- D 1 - I - 0x00A9F3 02:A9E3: 00        .byte $00   ; 
- D 1 - I - 0x00A9F4 02:A9E4: 00        .byte $00   ; 
- D 1 - I - 0x00A9F5 02:A9E5: 00        .byte $00   ; 
- D 1 - I - 0x00A9F6 02:A9E6: 00        .byte $00   ; 
- D 1 - I - 0x00A9F7 02:A9E7: 00        .byte $00   ; 
- D 1 - I - 0x00A9F8 02:A9E8: 00        .byte $00   ; 
- D 1 - I - 0x00A9F9 02:A9E9: 00        .byte $00   ; 
- D 1 - I - 0x00A9FA 02:A9EA: 00        .byte $00   ; 
- D 1 - I - 0x00A9FB 02:A9EB: 00        .byte $00   ; 
- D 1 - I - 0x00A9FC 02:A9EC: 9F        .byte $9F   ; 
- D 1 - I - 0x00A9FD 02:A9ED: 00        .byte $00   ; 
- D 1 - I - 0x00A9FE 02:A9EE: 1A        .byte $1A   ; 
- D 1 - I - 0x00A9FF 02:A9EF: 19        .byte $19   ; 
- D 1 - I - 0x00AA00 02:A9F0: 1F        .byte $1F   ; 
- D 1 - I - 0x00AA01 02:A9F1: 7E        .byte $7E   ; 
- D 1 - I - 0x00AA02 02:A9F2: 1E        .byte $1E   ; 
- D 1 - I - 0x00AA03 02:A9F3: 1C        .byte $1C   ; 
- D 1 - I - 0x00AA04 02:A9F4: 00        .byte $00   ; 
- D 1 - I - 0x00AA05 02:A9F5: 00        .byte $00   ; 
- D 1 - I - 0x00AA06 02:A9F6: 00        .byte $00   ; 
- D 1 - I - 0x00AA07 02:A9F7: 00        .byte $00   ; 
- D 1 - I - 0x00AA08 02:A9F8: 00        .byte $00   ; 
- D 1 - I - 0x00AA09 02:A9F9: 9F        .byte $9F   ; 
- D 1 - I - 0x00AA0A 02:A9FA: 00        .byte $00   ; 
- D 1 - I - 0x00AA0B 02:A9FB: 00        .byte $00   ; 
- D 1 - I - 0x00AA0C 02:A9FC: 00        .byte $00   ; 
- D 1 - I - 0x00AA0D 02:A9FD: 1A        .byte $1A   ; 
- D 1 - I - 0x00AA0E 02:A9FE: 1A        .byte $1A   ; 
- D 1 - I - 0x00AA0F 02:A9FF: 1B        .byte $1B   ; 
- D 1 - I - 0x00AA10 02:AA00: 1D        .byte $1D   ; 
- D 1 - I - 0x00AA11 02:AA01: 7C        .byte $7C   ; 
- D 1 - I - 0x00AA12 02:AA02: 1E        .byte $1E   ; 
- D 1 - I - 0x00AA13 02:AA03: 7D        .byte $7D   ; 
- D 1 - I - 0x00AA14 02:AA04: 00        .byte $00   ; 
- D 1 - I - 0x00AA15 02:AA05: 00        .byte $00   ; 
- D 1 - I - 0x00AA16 02:AA06: 00        .byte $00   ; 
- D 1 - I - 0x00AA17 02:AA07: 00        .byte $00   ; 
- D 1 - I - 0x00AA18 02:AA08: 00        .byte $00   ; 
- D 1 - I - 0x00AA19 02:AA09: 00        .byte $00   ; 
- D 1 - I - 0x00AA1A 02:AA0A: 00        .byte $00   ; 
- D 1 - I - 0x00AA1B 02:AA0B: 00        .byte $00   ; 
- D 1 - I - 0x00AA1C 02:AA0C: 00        .byte $00   ; 
- D 1 - I - 0x00AA1D 02:AA0D: 7F        .byte $7F   ; 
- D 1 - I - 0x00AA1E 02:AA0E: 00        .byte $00   ; 
- D 1 - I - 0x00AA1F 02:AA0F: 00        .byte $00   ; 
- D 1 - I - 0x00AA20 02:AA10: 1F        .byte $1F   ; 
- D 1 - I - 0x00AA21 02:AA11: 1E        .byte $1E   ; 
- D 1 - I - 0x00AA22 02:AA12: 00        .byte $00   ; 
- D 1 - I - 0x00AA23 02:AA13: 00        .byte $00   ; 
- D 1 - I - 0x00AA24 02:AA14: 00        .byte $00   ; 
- D 1 - I - 0x00AA25 02:AA15: 00        .byte $00   ; 
- D 1 - I - 0x00AA26 02:AA16: 00        .byte $00   ; 
- D 1 - I - 0x00AA27 02:AA17: 00        .byte $00   ; 
- D 1 - I - 0x00AA28 02:AA18: 00        .byte $00   ; 
- D 1 - I - 0x00AA29 02:AA19: 19        .byte $19   ; 
- D 1 - I - 0x00AA2A 02:AA1A: 00        .byte $00   ; 
- D 1 - I - 0x00AA2B 02:AA1B: 1A        .byte $1A   ; 
- D 1 - I - 0x00AA2C 02:AA1C: 1E        .byte $1E   ; 
- D 1 - I - 0x00AA2D 02:AA1D: 1C        .byte $1C   ; 
- D 1 - I - 0x00AA2E 02:AA1E: 1D        .byte $1D   ; 
- D 1 - I - 0x00AA2F 02:AA1F: 7C        .byte $7C   ; 
- D 1 - I - 0x00AA30 02:AA20: 0B        .byte $0B   ; 
- D 1 - I - 0x00AA31 02:AA21: 00        .byte $00   ; 
- D 1 - I - 0x00AA32 02:AA22: 00        .byte $00   ; 
- D 1 - I - 0x00AA33 02:AA23: 00        .byte $00   ; 
- D 1 - I - 0x00AA34 02:AA24: 60        .byte $60   ; 
- D 1 - I - 0x00AA35 02:AA25: 00        .byte $00   ; 
- D 1 - I - 0x00AA36 02:AA26: 00        .byte $00   ; 
- D 1 - I - 0x00AA37 02:AA27: 00        .byte $00   ; 
- D 1 - I - 0x00AA38 02:AA28: 1A        .byte $1A   ; 
- D 1 - I - 0x00AA39 02:AA29: 1B        .byte $1B   ; 
- D 1 - I - 0x00AA3A 02:AA2A: 19        .byte $19   ; 
- D 1 - I - 0x00AA3B 02:AA2B: 00        .byte $00   ; 
- D 1 - I - 0x00AA3C 02:AA2C: 1E        .byte $1E   ; 
- D 1 - I - 0x00AA3D 02:AA2D: 7D        .byte $7D   ; 
- D 1 - I - 0x00AA3E 02:AA2E: 00        .byte $00   ; 
- D 1 - I - 0x00AA3F 02:AA2F: 00        .byte $00   ; 
- D 1 - I - 0x00AA40 02:AA30: 00        .byte $00   ; 
- D 1 - I - 0x00AA41 02:AA31: 00        .byte $00   ; 
- D 1 - I - 0x00AA42 02:AA32: 00        .byte $00   ; 
- D 1 - I - 0x00AA43 02:AA33: 00        .byte $00   ; 
- D 1 - I - 0x00AA44 02:AA34: 00        .byte $00   ; 
- D 1 - I - 0x00AA45 02:AA35: 00        .byte $00   ; 
- D 1 - I - 0x00AA46 02:AA36: 1F        .byte $1F   ; 
- D 1 - I - 0x00AA47 02:AA37: 7E        .byte $7E   ; 
- D 1 - I - 0x00AA48 02:AA38: 30        .byte $30   ; 
- D 1 - I - 0x00AA49 02:AA39: 37        .byte $37   ; 
- D 1 - I - 0x00AA4A 02:AA3A: 33        .byte $33   ; 
- D 1 - I - 0x00AA4B 02:AA3B: 37        .byte $37   ; 
- D 1 - I - 0x00AA4C 02:AA3C: 82        .byte $82   ; 
- D 1 - I - 0x00AA4D 02:AA3D: 00        .byte $00   ; 
- D 1 - I - 0x00AA4E 02:AA3E: 81        .byte $81   ; 
- D 1 - I - 0x00AA4F 02:AA3F: 00        .byte $00   ; 
- D 1 - I - 0x00AA50 02:AA40: 00        .byte $00   ; 
- D 1 - I - 0x00AA51 02:AA41: 00        .byte $00   ; 
- D 1 - I - 0x00AA52 02:AA42: 00        .byte $00   ; 
- D 1 - I - 0x00AA53 02:AA43: 00        .byte $00   ; 
- D 1 - I - 0x00AA54 02:AA44: 00        .byte $00   ; 
- D 1 - I - 0x00AA55 02:AA45: 00        .byte $00   ; 
- D 1 - I - 0x00AA56 02:AA46: 00        .byte $00   ; 
- D 1 - I - 0x00AA57 02:AA47: 00        .byte $00   ; 
- - - - - - 0x00AA58 02:AA48: 00        .byte $00   ; 
- - - - - - 0x00AA59 02:AA49: 00        .byte $00   ; 
- - - - - - 0x00AA5A 02:AA4A: 00        .byte $00   ; 
- - - - - - 0x00AA5B 02:AA4B: 00        .byte $00   ; 
- - - - - - 0x00AA5C 02:AA4C: 00        .byte $00   ; 
- - - - - - 0x00AA5D 02:AA4D: 00        .byte $00   ; 
- - - - - - 0x00AA5E 02:AA4E: 00        .byte $00   ; 
- - - - - - 0x00AA5F 02:AA4F: 00        .byte $00   ; 
- - - - - - 0x00AA60 02:AA50: 1A        .byte $1A   ; 
- - - - - - 0x00AA61 02:AA51: 1B        .byte $1B   ; 
- - - - - - 0x00AA62 02:AA52: 1A        .byte $1A   ; 
- - - - - - 0x00AA63 02:AA53: 7F        .byte $7F   ; 
- - - - - - 0x00AA64 02:AA54: 1E        .byte $1E   ; 
- - - - - - 0x00AA65 02:AA55: 7D        .byte $7D   ; 
- - - - - - 0x00AA66 02:AA56: 1F        .byte $1F   ; 
- - - - - - 0x00AA67 02:AA57: 1E        .byte $1E   ; 
- D 1 - I - 0x00AA68 02:AA58: 0E        .byte $0E   ; 
- D 1 - I - 0x00AA69 02:AA59: 63        .byte $63   ; 
- D 1 - I - 0x00AA6A 02:AA5A: 1A        .byte $1A   ; 
- D 1 - I - 0x00AA6B 02:AA5B: 19        .byte $19   ; 
- D 1 - I - 0x00AA6C 02:AA5C: 6E        .byte $6E   ; 
- D 1 - I - 0x00AA6D 02:AA5D: 6F        .byte $6F   ; 
- D 1 - I - 0x00AA6E 02:AA5E: 1E        .byte $1E   ; 
- D 1 - I - 0x00AA6F 02:AA5F: 1C        .byte $1C   ; 
- D 1 - I - 0x00AA70 02:AA60: 00        .byte $00   ; 
- D 1 - I - 0x00AA71 02:AA61: 00        .byte $00   ; 
- D 1 - I - 0x00AA72 02:AA62: 00        .byte $00   ; 
- D 1 - I - 0x00AA73 02:AA63: 1A        .byte $1A   ; 
- D 1 - I - 0x00AA74 02:AA64: 1F        .byte $1F   ; 
- D 1 - I - 0x00AA75 02:AA65: 1C        .byte $1C   ; 
- D 1 - I - 0x00AA76 02:AA66: 7E        .byte $7E   ; 
- D 1 - I - 0x00AA77 02:AA67: 1E        .byte $1E   ; 
- D 1 - I - 0x00AA78 02:AA68: 82        .byte $82   ; 
- D 1 - I - 0x00AA79 02:AA69: 00        .byte $00   ; 
- D 1 - I - 0x00AA7A 02:AA6A: 81        .byte $81   ; 
- D 1 - I - 0x00AA7B 02:AA6B: 83        .byte $83   ; 
- D 1 - I - 0x00AA7C 02:AA6C: 00        .byte $00   ; 
- D 1 - I - 0x00AA7D 02:AA6D: 00        .byte $00   ; 
- D 1 - I - 0x00AA7E 02:AA6E: 00        .byte $00   ; 
- D 1 - I - 0x00AA7F 02:AA6F: 00        .byte $00   ; 
- D 1 - I - 0x00AA80 02:AA70: 00        .byte $00   ; 
- D 1 - I - 0x00AA81 02:AA71: 00        .byte $00   ; 
- D 1 - I - 0x00AA82 02:AA72: 00        .byte $00   ; 
- D 1 - I - 0x00AA83 02:AA73: 00        .byte $00   ; 
- D 1 - I - 0x00AA84 02:AA74: 00        .byte $00   ; 
- D 1 - I - 0x00AA85 02:AA75: 00        .byte $00   ; 
- D 1 - I - 0x00AA86 02:AA76: 00        .byte $00   ; 
- D 1 - I - 0x00AA87 02:AA77: 00        .byte $00   ; 
- D 1 - I - 0x00AA88 02:AA78: 80        .byte $80   ; 
- D 1 - I - 0x00AA89 02:AA79: 84        .byte $84   ; 
- D 1 - I - 0x00AA8A 02:AA7A: 82        .byte $82   ; 
- D 1 - I - 0x00AA8B 02:AA7B: 00        .byte $00   ; 
- D 1 - I - 0x00AA8C 02:AA7C: 00        .byte $00   ; 
- D 1 - I - 0x00AA8D 02:AA7D: 00        .byte $00   ; 
- D 1 - I - 0x00AA8E 02:AA7E: 00        .byte $00   ; 
- D 1 - I - 0x00AA8F 02:AA7F: 00        .byte $00   ; 
- D 1 - I - 0x00AA90 02:AA80: 00        .byte $00   ; 
- D 1 - I - 0x00AA91 02:AA81: 00        .byte $00   ; 
- D 1 - I - 0x00AA92 02:AA82: 85        .byte $85   ; 
- D 1 - I - 0x00AA93 02:AA83: 00        .byte $00   ; 
- D 1 - I - 0x00AA94 02:AA84: 00        .byte $00   ; 
- D 1 - I - 0x00AA95 02:AA85: 00        .byte $00   ; 
- D 1 - I - 0x00AA96 02:AA86: D6        .byte $D6   ; 
- D 1 - I - 0x00AA97 02:AA87: 00        .byte $00   ; 
- D 1 - I - 0x00AA98 02:AA88: 00        .byte $00   ; 
- D 1 - I - 0x00AA99 02:AA89: 1A        .byte $1A   ; 
- D 1 - I - 0x00AA9A 02:AA8A: 1A        .byte $1A   ; 
- D 1 - I - 0x00AA9B 02:AA8B: 1B        .byte $1B   ; 
- D 1 - I - 0x00AA9C 02:AA8C: 1D        .byte $1D   ; 
- D 1 - I - 0x00AA9D 02:AA8D: 7C        .byte $7C   ; 
- D 1 - I - 0x00AA9E 02:AA8E: 1E        .byte $1E   ; 
- D 1 - I - 0x00AA9F 02:AA8F: 7D        .byte $7D   ; 
- D 1 - I - 0x00AAA0 02:AA90: 1B        .byte $1B   ; 
- D 1 - I - 0x00AAA1 02:AA91: 00        .byte $00   ; 
- D 1 - I - 0x00AAA2 02:AA92: 00        .byte $00   ; 
- D 1 - I - 0x00AAA3 02:AA93: 00        .byte $00   ; 
- D 1 - I - 0x00AAA4 02:AA94: 7D        .byte $7D   ; 
- D 1 - I - 0x00AAA5 02:AA95: 00        .byte $00   ; 
- D 1 - I - 0x00AAA6 02:AA96: 1F        .byte $1F   ; 
- D 1 - I - 0x00AAA7 02:AA97: 1C        .byte $1C   ; 
- D 1 - I - 0x00AAA8 02:AA98: 00        .byte $00   ; 
- D 1 - I - 0x00AAA9 02:AA99: 00        .byte $00   ; 
- D 1 - I - 0x00AAAA 02:AA9A: 00        .byte $00   ; 
- D 1 - I - 0x00AAAB 02:AA9B: 1F        .byte $1F   ; 
- D 1 - I - 0x00AAAC 02:AA9C: 00        .byte $00   ; 
- D 1 - I - 0x00AAAD 02:AA9D: 00        .byte $00   ; 
- D 1 - I - 0x00AAAE 02:AA9E: 00        .byte $00   ; 
- D 1 - I - 0x00AAAF 02:AA9F: 00        .byte $00   ; 
- D 1 - I - 0x00AAB0 02:AAA0: 23        .byte $23   ; 
- D 1 - I - 0x00AAB1 02:AAA1: 23        .byte $23   ; 
- D 1 - I - 0x00AAB2 02:AAA2: 23        .byte $23   ; 
- D 1 - I - 0x00AAB3 02:AAA3: 23        .byte $23   ; 
- D 1 - I - 0x00AAB4 02:AAA4: 26        .byte $26   ; 
- D 1 - I - 0x00AAB5 02:AAA5: 26        .byte $26   ; 
- D 1 - I - 0x00AAB6 02:AAA6: 26        .byte $26   ; 
- D 1 - I - 0x00AAB7 02:AAA7: 26        .byte $26   ; 
- D 1 - I - 0x00AAB8 02:AAA8: 1C        .byte $1C   ; 
- D 1 - I - 0x00AAB9 02:AAA9: 1D        .byte $1D   ; 
- D 1 - I - 0x00AABA 02:AAAA: 1E        .byte $1E   ; 
- D 1 - I - 0x00AABB 02:AAAB: 00        .byte $00   ; 
- D 1 - I - 0x00AABC 02:AAAC: 00        .byte $00   ; 
- D 1 - I - 0x00AABD 02:AAAD: 00        .byte $00   ; 
- D 1 - I - 0x00AABE 02:AAAE: 00        .byte $00   ; 
- D 1 - I - 0x00AABF 02:AAAF: 22        .byte $22   ; 
- D 1 - I - 0x00AAC0 02:AAB0: 24        .byte $24   ; 
- D 1 - I - 0x00AAC1 02:AAB1: 24        .byte $24   ; 
- D 1 - I - 0x00AAC2 02:AAB2: 25        .byte $25   ; 
- D 1 - I - 0x00AAC3 02:AAB3: 26        .byte $26   ; 
- D 1 - I - 0x00AAC4 02:AAB4: 27        .byte $27   ; 
- D 1 - I - 0x00AAC5 02:AAB5: 27        .byte $27   ; 
- D 1 - I - 0x00AAC6 02:AAB6: 28        .byte $28   ; 
- D 1 - I - 0x00AAC7 02:AAB7: 28        .byte $28   ; 
- D 1 - I - 0x00AAC8 02:AAB8: 00        .byte $00   ; 
- D 1 - I - 0x00AAC9 02:AAB9: 00        .byte $00   ; 
- D 1 - I - 0x00AACA 02:AABA: 00        .byte $00   ; 
- D 1 - I - 0x00AACB 02:AABB: 00        .byte $00   ; 
- D 1 - I - 0x00AACC 02:AABC: 23        .byte $23   ; 
- D 1 - I - 0x00AACD 02:AABD: 23        .byte $23   ; 
- D 1 - I - 0x00AACE 02:AABE: 24        .byte $24   ; 
- D 1 - I - 0x00AACF 02:AABF: 25        .byte $25   ; 
- D 1 - I - 0x00AAD0 02:AAC0: 26        .byte $26   ; 
- D 1 - I - 0x00AAD1 02:AAC1: 26        .byte $26   ; 
- D 1 - I - 0x00AAD2 02:AAC2: 26        .byte $26   ; 
- D 1 - I - 0x00AAD3 02:AAC3: 27        .byte $27   ; 
- D 1 - I - 0x00AAD4 02:AAC4: 28        .byte $28   ; 
- D 1 - I - 0x00AAD5 02:AAC5: 28        .byte $28   ; 
- D 1 - I - 0x00AAD6 02:AAC6: 28        .byte $28   ; 
- D 1 - I - 0x00AAD7 02:AAC7: 29        .byte $29   ; 
- D 1 - I - 0x00AAD8 02:AAC8: 22        .byte $22   ; 
- D 1 - I - 0x00AAD9 02:AAC9: 22        .byte $22   ; 
- D 1 - I - 0x00AADA 02:AACA: 23        .byte $23   ; 
- D 1 - I - 0x00AADB 02:AACB: 23        .byte $23   ; 
- D 1 - I - 0x00AADC 02:AACC: 35        .byte $35   ; 
- D 1 - I - 0x00AADD 02:AACD: 35        .byte $35   ; 
- D 1 - I - 0x00AADE 02:AACE: 26        .byte $26   ; 
- D 1 - I - 0x00AADF 02:AACF: 26        .byte $26   ; 
- D 1 - I - 0x00AAE0 02:AAD0: 28        .byte $28   ; 
- D 1 - I - 0x00AAE1 02:AAD1: 28        .byte $28   ; 
- D 1 - I - 0x00AAE2 02:AAD2: 28        .byte $28   ; 
- D 1 - I - 0x00AAE3 02:AAD3: 28        .byte $28   ; 
- D 1 - I - 0x00AAE4 02:AAD4: 29        .byte $29   ; 
- D 1 - I - 0x00AAE5 02:AAD5: 29        .byte $29   ; 
- D 1 - I - 0x00AAE6 02:AAD6: 29        .byte $29   ; 
- D 1 - I - 0x00AAE7 02:AAD7: 29        .byte $29   ; 
- D 1 - I - 0x00AAE8 02:AAD8: 00        .byte $00   ; 
- D 1 - I - 0x00AAE9 02:AAD9: 22        .byte $22   ; 
- D 1 - I - 0x00AAEA 02:AADA: 22        .byte $22   ; 
- D 1 - I - 0x00AAEB 02:AADB: 23        .byte $23   ; 
- D 1 - I - 0x00AAEC 02:AADC: 35        .byte $35   ; 
- D 1 - I - 0x00AAED 02:AADD: 26        .byte $26   ; 
- D 1 - I - 0x00AAEE 02:AADE: 26        .byte $26   ; 
- D 1 - I - 0x00AAEF 02:AADF: 26        .byte $26   ; 
- D 1 - I - 0x00AAF0 02:AAE0: 27        .byte $27   ; 
- D 1 - I - 0x00AAF1 02:AAE1: 28        .byte $28   ; 
- D 1 - I - 0x00AAF2 02:AAE2: 29        .byte $29   ; 
- D 1 - I - 0x00AAF3 02:AAE3: 2A        .byte $2A   ; 
- D 1 - I - 0x00AAF4 02:AAE4: 2A        .byte $2A   ; 
- D 1 - I - 0x00AAF5 02:AAE5: 2C        .byte $2C   ; 
- D 1 - I - 0x00AAF6 02:AAE6: 2D        .byte $2D   ; 
- D 1 - I - 0x00AAF7 02:AAE7: 2D        .byte $2D   ; 
- D 1 - I - 0x00AAF8 02:AAE8: 24        .byte $24   ; 
- D 1 - I - 0x00AAF9 02:AAE9: 24        .byte $24   ; 
- D 1 - I - 0x00AAFA 02:AAEA: 25        .byte $25   ; 
- D 1 - I - 0x00AAFB 02:AAEB: 26        .byte $26   ; 
- D 1 - I - 0x00AAFC 02:AAEC: 27        .byte $27   ; 
- D 1 - I - 0x00AAFD 02:AAED: 27        .byte $27   ; 
- D 1 - I - 0x00AAFE 02:AAEE: 28        .byte $28   ; 
- D 1 - I - 0x00AAFF 02:AAEF: 28        .byte $28   ; 
- D 1 - I - 0x00AB00 02:AAF0: 2A        .byte $2A   ; 
- D 1 - I - 0x00AB01 02:AAF1: 2C        .byte $2C   ; 
- D 1 - I - 0x00AB02 02:AAF2: 2C        .byte $2C   ; 
- D 1 - I - 0x00AB03 02:AAF3: 2C        .byte $2C   ; 
- D 1 - I - 0x00AB04 02:AAF4: 2F        .byte $2F   ; 
- D 1 - I - 0x00AB05 02:AAF5: 37        .byte $37   ; 
- D 1 - I - 0x00AB06 02:AAF6: 33        .byte $33   ; 
- D 1 - I - 0x00AB07 02:AAF7: 30        .byte $30   ; 
- D 1 - I - 0x00AB08 02:AAF8: 26        .byte $26   ; 
- D 1 - I - 0x00AB09 02:AAF9: 27        .byte $27   ; 
- D 1 - I - 0x00AB0A 02:AAFA: 27        .byte $27   ; 
- D 1 - I - 0x00AB0B 02:AAFB: 27        .byte $27   ; 
- D 1 - I - 0x00AB0C 02:AAFC: 29        .byte $29   ; 
- D 1 - I - 0x00AB0D 02:AAFD: 29        .byte $29   ; 
- D 1 - I - 0x00AB0E 02:AAFE: 29        .byte $29   ; 
- D 1 - I - 0x00AB0F 02:AAFF: 29        .byte $29   ; 
- D 1 - I - 0x00AB10 02:AB00: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB11 02:AB01: 2B        .byte $2B   ; 
- D 1 - I - 0x00AB12 02:AB02: 2B        .byte $2B   ; 
- D 1 - I - 0x00AB13 02:AB03: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB14 02:AB04: 31        .byte $31   ; 
- D 1 - I - 0x00AB15 02:AB05: 31        .byte $31   ; 
- D 1 - I - 0x00AB16 02:AB06: 31        .byte $31   ; 
- D 1 - I - 0x00AB17 02:AB07: 37        .byte $37   ; 
- D 1 - I - 0x00AB18 02:AB08: 28        .byte $28   ; 
- D 1 - I - 0x00AB19 02:AB09: 28        .byte $28   ; 
- D 1 - I - 0x00AB1A 02:AB0A: 16        .byte $16   ; 
- D 1 - I - 0x00AB1B 02:AB0B: 28        .byte $28   ; 
- D 1 - I - 0x00AB1C 02:AB0C: 29        .byte $29   ; 
- D 1 - I - 0x00AB1D 02:AB0D: 2A        .byte $2A   ; 
- D 1 - I - 0x00AB1E 02:AB0E: 7A        .byte $7A   ; 
- D 1 - I - 0x00AB1F 02:AB0F: 2A        .byte $2A   ; 
- D 1 - I - 0x00AB20 02:AB10: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB21 02:AB11: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB22 02:AB12: 17        .byte $17   ; 
- D 1 - I - 0x00AB23 02:AB13: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB24 02:AB14: 33        .byte $33   ; 
- D 1 - I - 0x00AB25 02:AB15: 2F        .byte $2F   ; 
- D 1 - I - 0x00AB26 02:AB16: 7B        .byte $7B   ; 
- D 1 - I - 0x00AB27 02:AB17: 30        .byte $30   ; 
- D 1 - I - 0x00AB28 02:AB18: 28        .byte $28   ; 
- D 1 - I - 0x00AB29 02:AB19: 28        .byte $28   ; 
- D 1 - I - 0x00AB2A 02:AB1A: 29        .byte $29   ; 
- D 1 - I - 0x00AB2B 02:AB1B: 29        .byte $29   ; 
- D 1 - I - 0x00AB2C 02:AB1C: 2A        .byte $2A   ; 
- D 1 - I - 0x00AB2D 02:AB1D: 2C        .byte $2C   ; 
- D 1 - I - 0x00AB2E 02:AB1E: 2B        .byte $2B   ; 
- D 1 - I - 0x00AB2F 02:AB1F: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB30 02:AB20: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB31 02:AB21: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB32 02:AB22: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB33 02:AB23: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB34 02:AB24: 30        .byte $30   ; 
- D 1 - I - 0x00AB35 02:AB25: 30        .byte $30   ; 
- D 1 - I - 0x00AB36 02:AB26: 31        .byte $31   ; 
- D 1 - I - 0x00AB37 02:AB27: 31        .byte $31   ; 
- D 1 - I - 0x00AB38 02:AB28: 29        .byte $29   ; 
- D 1 - I - 0x00AB39 02:AB29: 29        .byte $29   ; 
- D 1 - I - 0x00AB3A 02:AB2A: 2A        .byte $2A   ; 
- D 1 - I - 0x00AB3B 02:AB2B: 2A        .byte $2A   ; 
- D 1 - I - 0x00AB3C 02:AB2C: 2B        .byte $2B   ; 
- D 1 - I - 0x00AB3D 02:AB2D: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB3E 02:AB2E: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB3F 02:AB2F: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB40 02:AB30: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB41 02:AB31: 2F        .byte $2F   ; 
- D 1 - I - 0x00AB42 02:AB32: 2F        .byte $2F   ; 
- D 1 - I - 0x00AB43 02:AB33: 2F        .byte $2F   ; 
- D 1 - I - 0x00AB44 02:AB34: 31        .byte $31   ; 
- D 1 - I - 0x00AB45 02:AB35: 31        .byte $31   ; 
- D 1 - I - 0x00AB46 02:AB36: 31        .byte $31   ; 
- D 1 - I - 0x00AB47 02:AB37: 36        .byte $36   ; 
- D 1 - I - 0x00AB48 02:AB38: 2A        .byte $2A   ; 
- D 1 - I - 0x00AB49 02:AB39: 2A        .byte $2A   ; 
- D 1 - I - 0x00AB4A 02:AB3A: 2C        .byte $2C   ; 
- D 1 - I - 0x00AB4B 02:AB3B: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB4C 02:AB3C: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB4D 02:AB3D: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB4E 02:AB3E: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB4F 02:AB3F: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB50 02:AB40: 30        .byte $30   ; 
- D 1 - I - 0x00AB51 02:AB41: 30        .byte $30   ; 
- D 1 - I - 0x00AB52 02:AB42: 30        .byte $30   ; 
- D 1 - I - 0x00AB53 02:AB43: 30        .byte $30   ; 
- D 1 - I - 0x00AB54 02:AB44: 36        .byte $36   ; 
- D 1 - I - 0x00AB55 02:AB45: 31        .byte $31   ; 
- D 1 - I - 0x00AB56 02:AB46: 36        .byte $36   ; 
- D 1 - I - 0x00AB57 02:AB47: 36        .byte $36   ; 
- D 1 - I - 0x00AB58 02:AB48: 2B        .byte $2B   ; 
- D 1 - I - 0x00AB59 02:AB49: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB5A 02:AB4A: 2B        .byte $2B   ; 
- D 1 - I - 0x00AB5B 02:AB4B: 2D        .byte $2D   ; 
- D 1 - I - 0x00AB5C 02:AB4C: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB5D 02:AB4D: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB5E 02:AB4E: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB5F 02:AB4F: 2E        .byte $2E   ; 
- D 1 - I - 0x00AB60 02:AB50: 31        .byte $31   ; 
- D 1 - I - 0x00AB61 02:AB51: 31        .byte $31   ; 
- D 1 - I - 0x00AB62 02:AB52: 31        .byte $31   ; 
- D 1 - I - 0x00AB63 02:AB53: 31        .byte $31   ; 
- D 1 - I - 0x00AB64 02:AB54: 32        .byte $32   ; 
- D 1 - I - 0x00AB65 02:AB55: 32        .byte $32   ; 
- D 1 - I - 0x00AB66 02:AB56: 32        .byte $32   ; 
- D 1 - I - 0x00AB67 02:AB57: 32        .byte $32   ; 
- D 1 - I - 0x00AB68 02:AB58: 8A        .byte $8A   ; 
- D 1 - I - 0x00AB69 02:AB59: 00        .byte $00   ; 
- D 1 - I - 0x00AB6A 02:AB5A: 86        .byte $86   ; 
- D 1 - I - 0x00AB6B 02:AB5B: D7        .byte $D7   ; 
- D 1 - I - 0x00AB6C 02:AB5C: 8B        .byte $8B   ; 
- D 1 - I - 0x00AB6D 02:AB5D: C8        .byte $C8   ; 
- D 1 - I - 0x00AB6E 02:AB5E: 87        .byte $87   ; 
- D 1 - I - 0x00AB6F 02:AB5F: C1        .byte $C1   ; 
- - - - - - 0x00AB70 02:AB60: 00        .byte $00   ; 
- - - - - - 0x00AB71 02:AB61: 00        .byte $00   ; 
- - - - - - 0x00AB72 02:AB62: 00        .byte $00   ; 
- - - - - - 0x00AB73 02:AB63: 00        .byte $00   ; 
- - - - - - 0x00AB74 02:AB64: 00        .byte $00   ; 
- - - - - - 0x00AB75 02:AB65: 00        .byte $00   ; 
- - - - - - 0x00AB76 02:AB66: 00        .byte $00   ; 
- - - - - - 0x00AB77 02:AB67: 00        .byte $00   ; 
- D 1 - I - 0x00AB78 02:AB68: 00        .byte $00   ; 
- D 1 - I - 0x00AB79 02:AB69: 00        .byte $00   ; 
- D 1 - I - 0x00AB7A 02:AB6A: 8A        .byte $8A   ; 
- D 1 - I - 0x00AB7B 02:AB6B: 00        .byte $00   ; 
- D 1 - I - 0x00AB7C 02:AB6C: 00        .byte $00   ; 
- D 1 - I - 0x00AB7D 02:AB6D: 00        .byte $00   ; 
- D 1 - I - 0x00AB7E 02:AB6E: 8B        .byte $8B   ; 
- D 1 - I - 0x00AB7F 02:AB6F: 00        .byte $00   ; 
- - - - - - 0x00AB80 02:AB70: 00        .byte $00   ; 
- - - - - - 0x00AB81 02:AB71: 00        .byte $00   ; 
- - - - - - 0x00AB82 02:AB72: 00        .byte $00   ; 
- - - - - - 0x00AB83 02:AB73: 00        .byte $00   ; 
- - - - - - 0x00AB84 02:AB74: 00        .byte $00   ; 
- - - - - - 0x00AB85 02:AB75: 00        .byte $00   ; 
- - - - - - 0x00AB86 02:AB76: 00        .byte $00   ; 
- - - - - - 0x00AB87 02:AB77: 00        .byte $00   ; 
- D 1 - I - 0x00AB88 02:AB78: 00        .byte $00   ; 
- D 1 - I - 0x00AB89 02:AB79: 00        .byte $00   ; 
- D 1 - I - 0x00AB8A 02:AB7A: 00        .byte $00   ; 
- D 1 - I - 0x00AB8B 02:AB7B: 00        .byte $00   ; 
- D 1 - I - 0x00AB8C 02:AB7C: CD        .byte $CD   ; 
- D 1 - I - 0x00AB8D 02:AB7D: 95        .byte $95   ; 
- D 1 - I - 0x00AB8E 02:AB7E: D1        .byte $D1   ; 
- D 1 - I - 0x00AB8F 02:AB7F: 00        .byte $00   ; 
- D 1 - I - 0x00AB90 02:AB80: 97        .byte $97   ; 
- D 1 - I - 0x00AB91 02:AB81: 99        .byte $99   ; 
- D 1 - I - 0x00AB92 02:AB82: 9A        .byte $9A   ; 
- D 1 - I - 0x00AB93 02:AB83: 00        .byte $00   ; 
- D 1 - I - 0x00AB94 02:AB84: 98        .byte $98   ; 
- D 1 - I - 0x00AB95 02:AB85: 99        .byte $99   ; 
- D 1 - I - 0x00AB96 02:AB86: 9A        .byte $9A   ; 
- D 1 - I - 0x00AB97 02:AB87: 00        .byte $00   ; 
- D 1 - I - 0x00AB98 02:AB88: 00        .byte $00   ; 
- D 1 - I - 0x00AB99 02:AB89: 00        .byte $00   ; 
- D 1 - I - 0x00AB9A 02:AB8A: 00        .byte $00   ; 
- D 1 - I - 0x00AB9B 02:AB8B: 00        .byte $00   ; 
- D 1 - I - 0x00AB9C 02:AB8C: 00        .byte $00   ; 
- D 1 - I - 0x00AB9D 02:AB8D: 00        .byte $00   ; 
- D 1 - I - 0x00AB9E 02:AB8E: 01        .byte $01   ; 
- D 1 - I - 0x00AB9F 02:AB8F: 5E        .byte $5E   ; 
- D 1 - I - 0x00ABA0 02:AB90: 01        .byte $01   ; 
- D 1 - I - 0x00ABA1 02:AB91: 5E        .byte $5E   ; 
- D 1 - I - 0x00ABA2 02:AB92: 02        .byte $02   ; 
- D 1 - I - 0x00ABA3 02:AB93: 5F        .byte $5F   ; 
- D 1 - I - 0x00ABA4 02:AB94: E4        .byte $E4   ; 
- D 1 - I - 0x00ABA5 02:AB95: 5F        .byte $5F   ; 
- D 1 - I - 0x00ABA6 02:AB96: BD        .byte $BD   ; 
- D 1 - I - 0x00ABA7 02:AB97: BD        .byte $BD   ; 
- D 1 - I - 0x00ABA8 02:AB98: 00        .byte $00   ; 
- D 1 - I - 0x00ABA9 02:AB99: 00        .byte $00   ; 
- D 1 - I - 0x00ABAA 02:AB9A: 00        .byte $00   ; 
- D 1 - I - 0x00ABAB 02:AB9B: 00        .byte $00   ; 
- D 1 - I - 0x00ABAC 02:AB9C: CD        .byte $CD   ; 
- D 1 - I - 0x00ABAD 02:AB9D: 95        .byte $95   ; 
- D 1 - I - 0x00ABAE 02:AB9E: D0        .byte $D0   ; 
- D 1 - I - 0x00ABAF 02:AB9F: 00        .byte $00   ; 
- D 1 - I - 0x00ABB0 02:ABA0: 98        .byte $98   ; 
- D 1 - I - 0x00ABB1 02:ABA1: D2        .byte $D2   ; 
- D 1 - I - 0x00ABB2 02:ABA2: 95        .byte $95   ; 
- D 1 - I - 0x00ABB3 02:ABA3: D1        .byte $D1   ; 
- D 1 - I - 0x00ABB4 02:ABA4: 00        .byte $00   ; 
- D 1 - I - 0x00ABB5 02:ABA5: 97        .byte $97   ; 
- D 1 - I - 0x00ABB6 02:ABA6: 99        .byte $99   ; 
- D 1 - I - 0x00ABB7 02:ABA7: D4        .byte $D4   ; 
- D 1 - I - 0x00ABB8 02:ABA8: 00        .byte $00   ; 
- D 1 - I - 0x00ABB9 02:ABA9: 00        .byte $00   ; 
- D 1 - I - 0x00ABBA 02:ABAA: 8B        .byte $8B   ; 
- D 1 - I - 0x00ABBB 02:ABAB: 00        .byte $00   ; 
- D 1 - I - 0x00ABBC 02:ABAC: 8D        .byte $8D   ; 
- D 1 - I - 0x00ABBD 02:ABAD: 8E        .byte $8E   ; 
- D 1 - I - 0x00ABBE 02:ABAE: C5        .byte $C5   ; 
- D 1 - I - 0x00ABBF 02:ABAF: 8E        .byte $8E   ; 
- D 1 - I - 0x00ABC0 02:ABB0: 00        .byte $00   ; 
- D 1 - I - 0x00ABC1 02:ABB1: 00        .byte $00   ; 
- D 1 - I - 0x00ABC2 02:ABB2: 8C        .byte $8C   ; 
- D 1 - I - 0x00ABC3 02:ABB3: 00        .byte $00   ; 
- D 1 - I - 0x00ABC4 02:ABB4: C7        .byte $C7   ; 
- D 1 - I - 0x00ABC5 02:ABB5: C8        .byte $C8   ; 
- D 1 - I - 0x00ABC6 02:ABB6: 8B        .byte $8B   ; 
- D 1 - I - 0x00ABC7 02:ABB7: C8        .byte $C8   ; 
- D 1 - I - 0x00ABC8 02:ABB8: 92        .byte $92   ; 
- D 1 - I - 0x00ABC9 02:ABB9: 92        .byte $92   ; 
- D 1 - I - 0x00ABCA 02:ABBA: 94        .byte $94   ; 
- D 1 - I - 0x00ABCB 02:ABBB: 92        .byte $92   ; 
- D 1 - I - 0x00ABCC 02:ABBC: CA        .byte $CA   ; 
- D 1 - I - 0x00ABCD 02:ABBD: CA        .byte $CA   ; 
- D 1 - I - 0x00ABCE 02:ABBE: CB        .byte $CB   ; 
- D 1 - I - 0x00ABCF 02:ABBF: CA        .byte $CA   ; 
- D 1 - I - 0x00ABD0 02:ABC0: 00        .byte $00   ; 
- D 1 - I - 0x00ABD1 02:ABC1: 00        .byte $00   ; 
- D 1 - I - 0x00ABD2 02:ABC2: 94        .byte $94   ; 
- D 1 - I - 0x00ABD3 02:ABC3: 00        .byte $00   ; 
- D 1 - I - 0x00ABD4 02:ABC4: 00        .byte $00   ; 
- D 1 - I - 0x00ABD5 02:ABC5: 00        .byte $00   ; 
- D 1 - I - 0x00ABD6 02:ABC6: 94        .byte $94   ; 
- D 1 - I - 0x00ABD7 02:ABC7: 00        .byte $00   ; 
- D 1 - I - 0x00ABD8 02:ABC8: 92        .byte $92   ; 
- D 1 - I - 0x00ABD9 02:ABC9: 90        .byte $90   ; 
- D 1 - I - 0x00ABDA 02:ABCA: 90        .byte $90   ; 
- D 1 - I - 0x00ABDB 02:ABCB: 92        .byte $92   ; 
- D 1 - I - 0x00ABDC 02:ABCC: CA        .byte $CA   ; 
- D 1 - I - 0x00ABDD 02:ABCD: CA        .byte $CA   ; 
- D 1 - I - 0x00ABDE 02:ABCE: CA        .byte $CA   ; 
- D 1 - I - 0x00ABDF 02:ABCF: CA        .byte $CA   ; 
- D 1 - I - 0x00ABE0 02:ABD0: 93        .byte $93   ; 
- D 1 - I - 0x00ABE1 02:ABD1: 00        .byte $00   ; 
- D 1 - I - 0x00ABE2 02:ABD2: 8B        .byte $8B   ; 
- D 1 - I - 0x00ABE3 02:ABD3: 00        .byte $00   ; 
- D 1 - I - 0x00ABE4 02:ABD4: 93        .byte $93   ; 
- D 1 - I - 0x00ABE5 02:ABD5: 00        .byte $00   ; 
- D 1 - I - 0x00ABE6 02:ABD6: 8C        .byte $8C   ; 
- D 1 - I - 0x00ABE7 02:ABD7: 00        .byte $00   ; 
- D 1 - I - 0x00ABE8 02:ABD8: 8D        .byte $8D   ; 
- D 1 - I - 0x00ABE9 02:ABD9: 8E        .byte $8E   ; 
- D 1 - I - 0x00ABEA 02:ABDA: 8E        .byte $8E   ; 
- D 1 - I - 0x00ABEB 02:ABDB: 8E        .byte $8E   ; 
- D 1 - I - 0x00ABEC 02:ABDC: 00        .byte $00   ; 
- D 1 - I - 0x00ABED 02:ABDD: 98        .byte $98   ; 
- D 1 - I - 0x00ABEE 02:ABDE: C4        .byte $C4   ; 
- D 1 - I - 0x00ABEF 02:ABDF: 00        .byte $00   ; 
- D 1 - I - 0x00ABF0 02:ABE0: 00        .byte $00   ; 
- D 1 - I - 0x00ABF1 02:ABE1: 00        .byte $00   ; 
- D 1 - I - 0x00ABF2 02:ABE2: 89        .byte $89   ; 
- D 1 - I - 0x00ABF3 02:ABE3: 00        .byte $00   ; 
- D 1 - I - 0x00ABF4 02:ABE4: C8        .byte $C8   ; 
- D 1 - I - 0x00ABF5 02:ABE5: 00        .byte $00   ; 
- D 1 - I - 0x00ABF6 02:ABE6: 8B        .byte $8B   ; 
- D 1 - I - 0x00ABF7 02:ABE7: C8        .byte $C8   ; 
- D 1 - I - 0x00ABF8 02:ABE8: 00        .byte $00   ; 
- D 1 - I - 0x00ABF9 02:ABE9: 00        .byte $00   ; 
- D 1 - I - 0x00ABFA 02:ABEA: 00        .byte $00   ; 
- D 1 - I - 0x00ABFB 02:ABEB: 00        .byte $00   ; 
- D 1 - I - 0x00ABFC 02:ABEC: 00        .byte $00   ; 
- D 1 - I - 0x00ABFD 02:ABED: 00        .byte $00   ; 
- D 1 - I - 0x00ABFE 02:ABEE: 00        .byte $00   ; 
- D 1 - I - 0x00ABFF 02:ABEF: 00        .byte $00   ; 
- D 1 - I - 0x00AC00 02:ABF0: 00        .byte $00   ; 
- D 1 - I - 0x00AC01 02:ABF1: 00        .byte $00   ; 
- D 1 - I - 0x00AC02 02:ABF2: 00        .byte $00   ; 
- D 1 - I - 0x00AC03 02:ABF3: 00        .byte $00   ; 
- D 1 - I - 0x00AC04 02:ABF4: C7        .byte $C7   ; 
- D 1 - I - 0x00AC05 02:ABF5: C8        .byte $C8   ; 
- D 1 - I - 0x00AC06 02:ABF6: C7        .byte $C7   ; 
- D 1 - I - 0x00AC07 02:ABF7: C8        .byte $C8   ; 
- D 1 - I - 0x00AC08 02:ABF8: 8A        .byte $8A   ; 
- D 1 - I - 0x00AC09 02:ABF9: 00        .byte $00   ; 
- D 1 - I - 0x00AC0A 02:ABFA: 85        .byte $85   ; 
- D 1 - I - 0x00AC0B 02:ABFB: 00        .byte $00   ; 
- D 1 - I - 0x00AC0C 02:ABFC: 8B        .byte $8B   ; 
- D 1 - I - 0x00AC0D 02:ABFD: 00        .byte $00   ; 
- D 1 - I - 0x00AC0E 02:ABFE: D6        .byte $D6   ; 
- D 1 - I - 0x00AC0F 02:ABFF: 00        .byte $00   ; 
- D 1 - I - 0x00AC10 02:AC00: 8B        .byte $8B   ; 
- D 1 - I - 0x00AC11 02:AC01: 00        .byte $00   ; 
- D 1 - I - 0x00AC12 02:AC02: 86        .byte $86   ; 
- D 1 - I - 0x00AC13 02:AC03: D7        .byte $D7   ; 
- D 1 - I - 0x00AC14 02:AC04: 8B        .byte $8B   ; 
- D 1 - I - 0x00AC15 02:AC05: C8        .byte $C8   ; 
- D 1 - I - 0x00AC16 02:AC06: 87        .byte $87   ; 
- D 1 - I - 0x00AC17 02:AC07: C1        .byte $C1   ; 
- D 1 - I - 0x00AC18 02:AC08: 00        .byte $00   ; 
- D 1 - I - 0x00AC19 02:AC09: 00        .byte $00   ; 
- D 1 - I - 0x00AC1A 02:AC0A: 00        .byte $00   ; 
- D 1 - I - 0x00AC1B 02:AC0B: 00        .byte $00   ; 
- D 1 - I - 0x00AC1C 02:AC0C: 00        .byte $00   ; 
- D 1 - I - 0x00AC1D 02:AC0D: 00        .byte $00   ; 
- D 1 - I - 0x00AC1E 02:AC0E: 00        .byte $00   ; 
- D 1 - I - 0x00AC1F 02:AC0F: 00        .byte $00   ; 
- D 1 - I - 0x00AC20 02:AC10: 00        .byte $00   ; 
- D 1 - I - 0x00AC21 02:AC11: 00        .byte $00   ; 
- D 1 - I - 0x00AC22 02:AC12: 8A        .byte $8A   ; 
- D 1 - I - 0x00AC23 02:AC13: 00        .byte $00   ; 
- D 1 - I - 0x00AC24 02:AC14: 00        .byte $00   ; 
- D 1 - I - 0x00AC25 02:AC15: 00        .byte $00   ; 
- D 1 - I - 0x00AC26 02:AC16: 8B        .byte $8B   ; 
- D 1 - I - 0x00AC27 02:AC17: 00        .byte $00   ; 
- D 1 - I - 0x00AC28 02:AC18: 00        .byte $00   ; 
- D 1 - I - 0x00AC29 02:AC19: 00        .byte $00   ; 
- D 1 - I - 0x00AC2A 02:AC1A: 8C        .byte $8C   ; 
- D 1 - I - 0x00AC2B 02:AC1B: 00        .byte $00   ; 
- D 1 - I - 0x00AC2C 02:AC1C: 8E        .byte $8E   ; 
- D 1 - I - 0x00AC2D 02:AC1D: 8E        .byte $8E   ; 
- D 1 - I - 0x00AC2E 02:AC1E: C5        .byte $C5   ; 
- D 1 - I - 0x00AC2F 02:AC1F: 8E        .byte $8E   ; 
- D 1 - I - 0x00AC30 02:AC20: 8F        .byte $8F   ; 
- D 1 - I - 0x00AC31 02:AC21: 00        .byte $00   ; 
- D 1 - I - 0x00AC32 02:AC22: 8C        .byte $8C   ; 
- D 1 - I - 0x00AC33 02:AC23: 00        .byte $00   ; 
- D 1 - I - 0x00AC34 02:AC24: 00        .byte $00   ; 
- D 1 - I - 0x00AC35 02:AC25: 8F        .byte $8F   ; 
- D 1 - I - 0x00AC36 02:AC26: 00        .byte $00   ; 
- D 1 - I - 0x00AC37 02:AC27: 00        .byte $00   ; 
- D 1 - I - 0x00AC38 02:AC28: 00        .byte $00   ; 
- D 1 - I - 0x00AC39 02:AC29: 00        .byte $00   ; 
- D 1 - I - 0x00AC3A 02:AC2A: 93        .byte $93   ; 
- D 1 - I - 0x00AC3B 02:AC2B: 00        .byte $00   ; 
- D 1 - I - 0x00AC3C 02:AC2C: CD        .byte $CD   ; 
- D 1 - I - 0x00AC3D 02:AC2D: 95        .byte $95   ; 
- D 1 - I - 0x00AC3E 02:AC2E: D0        .byte $D0   ; 
- D 1 - I - 0x00AC3F 02:AC2F: 8D        .byte $8D   ; 
- D 1 - I - 0x00AC40 02:AC30: 98        .byte $98   ; 
- D 1 - I - 0x00AC41 02:AC31: D2        .byte $D2   ; 
- D 1 - I - 0x00AC42 02:AC32: 95        .byte $95   ; 
- D 1 - I - 0x00AC43 02:AC33: D1        .byte $D1   ; 
- D 1 - I - 0x00AC44 02:AC34: 00        .byte $00   ; 
- D 1 - I - 0x00AC45 02:AC35: 97        .byte $97   ; 
- D 1 - I - 0x00AC46 02:AC36: 99        .byte $99   ; 
- D 1 - I - 0x00AC47 02:AC37: D4        .byte $D4   ; 
- D 1 - I - 0x00AC48 02:AC38: 8B        .byte $8B   ; 
- D 1 - I - 0x00AC49 02:AC39: 00        .byte $00   ; 
- D 1 - I - 0x00AC4A 02:AC3A: 87        .byte $87   ; 
- D 1 - I - 0x00AC4B 02:AC3B: C1        .byte $C1   ; 
- D 1 - I - 0x00AC4C 02:AC3C: C5        .byte $C5   ; 
- D 1 - I - 0x00AC4D 02:AC3D: 8D        .byte $8D   ; 
- D 1 - I - 0x00AC4E 02:AC3E: 87        .byte $87   ; 
- D 1 - I - 0x00AC4F 02:AC3F: C1        .byte $C1   ; 
- D 1 - I - 0x00AC50 02:AC40: 8B        .byte $8B   ; 
- D 1 - I - 0x00AC51 02:AC41: 00        .byte $00   ; 
- D 1 - I - 0x00AC52 02:AC42: 88        .byte $88   ; 
- D 1 - I - 0x00AC53 02:AC43: C1        .byte $C1   ; 
- D 1 - I - 0x00AC54 02:AC44: 8C        .byte $8C   ; 
- D 1 - I - 0x00AC55 02:AC45: 00        .byte $00   ; 
- D 1 - I - 0x00AC56 02:AC46: 86        .byte $86   ; 
- D 1 - I - 0x00AC57 02:AC47: C1        .byte $C1   ; 
- D 1 - I - 0x00AC58 02:AC48: 93        .byte $93   ; 
- D 1 - I - 0x00AC59 02:AC49: 00        .byte $00   ; 
- D 1 - I - 0x00AC5A 02:AC4A: 8C        .byte $8C   ; 
- D 1 - I - 0x00AC5B 02:AC4B: 00        .byte $00   ; 
- D 1 - I - 0x00AC5C 02:AC4C: 8D        .byte $8D   ; 
- D 1 - I - 0x00AC5D 02:AC4D: 8D        .byte $8D   ; 
- D 1 - I - 0x00AC5E 02:AC4E: C5        .byte $C5   ; 
- D 1 - I - 0x00AC5F 02:AC4F: C6        .byte $C6   ; 
- D 1 - I - 0x00AC60 02:AC50: 93        .byte $93   ; 
- D 1 - I - 0x00AC61 02:AC51: 00        .byte $00   ; 
- D 1 - I - 0x00AC62 02:AC52: 8B        .byte $8B   ; 
- D 1 - I - 0x00AC63 02:AC53: 00        .byte $00   ; 
- D 1 - I - 0x00AC64 02:AC54: 93        .byte $93   ; 
- D 1 - I - 0x00AC65 02:AC55: 00        .byte $00   ; 
- D 1 - I - 0x00AC66 02:AC56: 8C        .byte $8C   ; 
- D 1 - I - 0x00AC67 02:AC57: 00        .byte $00   ; 
- D 1 - I - 0x00AC68 02:AC58: 92        .byte $92   ; 
- D 1 - I - 0x00AC69 02:AC59: 90        .byte $90   ; 
- D 1 - I - 0x00AC6A 02:AC5A: 91        .byte $91   ; 
- D 1 - I - 0x00AC6B 02:AC5B: 92        .byte $92   ; 
- D 1 - I - 0x00AC6C 02:AC5C: CA        .byte $CA   ; 
- D 1 - I - 0x00AC6D 02:AC5D: CA        .byte $CA   ; 
- D 1 - I - 0x00AC6E 02:AC5E: CB        .byte $CB   ; 
- D 1 - I - 0x00AC6F 02:AC5F: CA        .byte $CA   ; 
- D 1 - I - 0x00AC70 02:AC60: 00        .byte $00   ; 
- D 1 - I - 0x00AC71 02:AC61: 00        .byte $00   ; 
- D 1 - I - 0x00AC72 02:AC62: 94        .byte $94   ; 
- D 1 - I - 0x00AC73 02:AC63: 00        .byte $00   ; 
- D 1 - I - 0x00AC74 02:AC64: 00        .byte $00   ; 
- D 1 - I - 0x00AC75 02:AC65: 00        .byte $00   ; 
- D 1 - I - 0x00AC76 02:AC66: 94        .byte $94   ; 
- D 1 - I - 0x00AC77 02:AC67: 00        .byte $00   ; 
- D 1 - I - 0x00AC78 02:AC68: 92        .byte $92   ; 
- D 1 - I - 0x00AC79 02:AC69: 98        .byte $98   ; 
- D 1 - I - 0x00AC7A 02:AC6A: 99        .byte $99   ; 
- D 1 - I - 0x00AC7B 02:AC6B: 9A        .byte $9A   ; 
- D 1 - I - 0x00AC7C 02:AC6C: CA        .byte $CA   ; 
- D 1 - I - 0x00AC7D 02:AC6D: CC        .byte $CC   ; 
- D 1 - I - 0x00AC7E 02:AC6E: 9B        .byte $9B   ; 
- D 1 - I - 0x00AC7F 02:AC6F: D3        .byte $D3   ; 
- D 1 - I - 0x00AC80 02:AC70: 00        .byte $00   ; 
- D 1 - I - 0x00AC81 02:AC71: 97        .byte $97   ; 
- D 1 - I - 0x00AC82 02:AC72: 99        .byte $99   ; 
- D 1 - I - 0x00AC83 02:AC73: D4        .byte $D4   ; 
- D 1 - I - 0x00AC84 02:AC74: 00        .byte $00   ; 
- D 1 - I - 0x00AC85 02:AC75: 97        .byte $97   ; 
- D 1 - I - 0x00AC86 02:AC76: 99        .byte $99   ; 
- D 1 - I - 0x00AC87 02:AC77: D4        .byte $D4   ; 
- D 1 - I - 0x00AC88 02:AC78: 00        .byte $00   ; 
- D 1 - I - 0x00AC89 02:AC79: 00        .byte $00   ; 
- D 1 - I - 0x00AC8A 02:AC7A: 87        .byte $87   ; 
- D 1 - I - 0x00AC8B 02:AC7B: C1        .byte $C1   ; 
- D 1 - I - 0x00AC8C 02:AC7C: 00        .byte $00   ; 
- D 1 - I - 0x00AC8D 02:AC7D: 00        .byte $00   ; 
- D 1 - I - 0x00AC8E 02:AC7E: D8        .byte $D8   ; 
- D 1 - I - 0x00AC8F 02:AC7F: D9        .byte $D9   ; 
- D 1 - I - 0x00AC90 02:AC80: 00        .byte $00   ; 
- D 1 - I - 0x00AC91 02:AC81: 00        .byte $00   ; 
- D 1 - I - 0x00AC92 02:AC82: 87        .byte $87   ; 
- D 1 - I - 0x00AC93 02:AC83: C1        .byte $C1   ; 
- D 1 - I - 0x00AC94 02:AC84: 00        .byte $00   ; 
- D 1 - I - 0x00AC95 02:AC85: 00        .byte $00   ; 
- D 1 - I - 0x00AC96 02:AC86: 87        .byte $87   ; 
- D 1 - I - 0x00AC97 02:AC87: C1        .byte $C1   ; 
- D 1 - I - 0x00AC98 02:AC88: 00        .byte $00   ; 
- D 1 - I - 0x00AC99 02:AC89: 00        .byte $00   ; 
- D 1 - I - 0x00AC9A 02:AC8A: 00        .byte $00   ; 
- D 1 - I - 0x00AC9B 02:AC8B: 00        .byte $00   ; 
- D 1 - I - 0x00AC9C 02:AC8C: CD        .byte $CD   ; 
- D 1 - I - 0x00AC9D 02:AC8D: 95        .byte $95   ; 
- D 1 - I - 0x00AC9E 02:AC8E: D0        .byte $D0   ; 
- D 1 - I - 0x00AC9F 02:AC8F: C9        .byte $C9   ; 
- D 1 - I - 0x00ACA0 02:AC90: 97        .byte $97   ; 
- D 1 - I - 0x00ACA1 02:AC91: 99        .byte $99   ; 
- D 1 - I - 0x00ACA2 02:AC92: 9A        .byte $9A   ; 
- D 1 - I - 0x00ACA3 02:AC93: 00        .byte $00   ; 
- D 1 - I - 0x00ACA4 02:AC94: 98        .byte $98   ; 
- D 1 - I - 0x00ACA5 02:AC95: 99        .byte $99   ; 
- D 1 - I - 0x00ACA6 02:AC96: 9A        .byte $9A   ; 
- D 1 - I - 0x00ACA7 02:AC97: 00        .byte $00   ; 
- D 1 - I - 0x00ACA8 02:AC98: 00        .byte $00   ; 
- D 1 - I - 0x00ACA9 02:AC99: 92        .byte $92   ; 
- D 1 - I - 0x00ACAA 02:AC9A: 94        .byte $94   ; 
- D 1 - I - 0x00ACAB 02:AC9B: 91        .byte $91   ; 
- D 1 - I - 0x00ACAC 02:AC9C: D0        .byte $D0   ; 
- D 1 - I - 0x00ACAD 02:AC9D: CA        .byte $CA   ; 
- D 1 - I - 0x00ACAE 02:AC9E: CA        .byte $CA   ; 
- D 1 - I - 0x00ACAF 02:AC9F: CA        .byte $CA   ; 
- D 1 - I - 0x00ACB0 02:ACA0: 9A        .byte $9A   ; 
- D 1 - I - 0x00ACB1 02:ACA1: 97        .byte $97   ; 
- D 1 - I - 0x00ACB2 02:ACA2: 99        .byte $99   ; 
- D 1 - I - 0x00ACB3 02:ACA3: 9A        .byte $9A   ; 
- D 1 - I - 0x00ACB4 02:ACA4: F7        .byte $F7   ; 
- D 1 - I - 0x00ACB5 02:ACA5: F7        .byte $F7   ; 
- D 1 - I - 0x00ACB6 02:ACA6: F7        .byte $F7   ; 
- D 1 - I - 0x00ACB7 02:ACA7: F7        .byte $F7   ; 
- D 1 - I - 0x00ACB8 02:ACA8: 92        .byte $92   ; 
- D 1 - I - 0x00ACB9 02:ACA9: 98        .byte $98   ; 
- D 1 - I - 0x00ACBA 02:ACAA: 9B        .byte $9B   ; 
- D 1 - I - 0x00ACBB 02:ACAB: D3        .byte $D3   ; 
- D 1 - I - 0x00ACBC 02:ACAC: CA        .byte $CA   ; 
- D 1 - I - 0x00ACBD 02:ACAD: CC        .byte $CC   ; 
- D 1 - I - 0x00ACBE 02:ACAE: 99        .byte $99   ; 
- D 1 - I - 0x00ACBF 02:ACAF: D4        .byte $D4   ; 
- D 1 - I - 0x00ACC0 02:ACB0: 99        .byte $99   ; 
- D 1 - I - 0x00ACC1 02:ACB1: D4        .byte $D4   ; 
- D 1 - I - 0x00ACC2 02:ACB2: 99        .byte $99   ; 
- D 1 - I - 0x00ACC3 02:ACB3: 9A        .byte $9A   ; 
- D 1 - I - 0x00ACC4 02:ACB4: DF        .byte $DF   ; 
- D 1 - I - 0x00ACC5 02:ACB5: F7        .byte $F7   ; 
- D 1 - I - 0x00ACC6 02:ACB6: F7        .byte $F7   ; 
- D 1 - I - 0x00ACC7 02:ACB7: F7        .byte $F7   ; 
- D 1 - I - 0x00ACC8 02:ACB8: 00        .byte $00   ; 
- D 1 - I - 0x00ACC9 02:ACB9: 00        .byte $00   ; 
- D 1 - I - 0x00ACCA 02:ACBA: 87        .byte $87   ; 
- D 1 - I - 0x00ACCB 02:ACBB: C1        .byte $C1   ; 
- D 1 - I - 0x00ACCC 02:ACBC: 00        .byte $00   ; 
- D 1 - I - 0x00ACCD 02:ACBD: CE        .byte $CE   ; 
- D 1 - I - 0x00ACCE 02:ACBE: C2        .byte $C2   ; 
- D 1 - I - 0x00ACCF 02:ACBF: C3        .byte $C3   ; 
- D 1 - I - 0x00ACD0 02:ACC0: 97        .byte $97   ; 
- D 1 - I - 0x00ACD1 02:ACC1: 99        .byte $99   ; 
- D 1 - I - 0x00ACD2 02:ACC2: 9A        .byte $9A   ; 
- D 1 - I - 0x00ACD3 02:ACC3: 99        .byte $99   ; 
- D 1 - I - 0x00ACD4 02:ACC4: F7        .byte $F7   ; 
- D 1 - I - 0x00ACD5 02:ACC5: F7        .byte $F7   ; 
- D 1 - I - 0x00ACD6 02:ACC6: F7        .byte $F7   ; 
- D 1 - I - 0x00ACD7 02:ACC7: F7        .byte $F7   ; 
- D 1 - I - 0x00ACD8 02:ACC8: 00        .byte $00   ; 
- D 1 - I - 0x00ACD9 02:ACC9: CD        .byte $CD   ; 
- D 1 - I - 0x00ACDA 02:ACCA: 96        .byte $96   ; 
- D 1 - I - 0x00ACDB 02:ACCB: D1        .byte $D1   ; 
- D 1 - I - 0x00ACDC 02:ACCC: CE        .byte $CE   ; 
- D 1 - I - 0x00ACDD 02:ACCD: D5        .byte $D5   ; 
- D 1 - I - 0x00ACDE 02:ACCE: CF        .byte $CF   ; 
- D 1 - I - 0x00ACDF 02:ACCF: 96        .byte $96   ; 
- D 1 - I - 0x00ACE0 02:ACD0: 99        .byte $99   ; 
- D 1 - I - 0x00ACE1 02:ACD1: 9A        .byte $9A   ; 
- D 1 - I - 0x00ACE2 02:ACD2: 99        .byte $99   ; 
- D 1 - I - 0x00ACE3 02:ACD3: 9A        .byte $9A   ; 
- D 1 - I - 0x00ACE4 02:ACD4: DF        .byte $DF   ; 
- D 1 - I - 0x00ACE5 02:ACD5: F7        .byte $F7   ; 
- D 1 - I - 0x00ACE6 02:ACD6: F7        .byte $F7   ; 
- D 1 - I - 0x00ACE7 02:ACD7: F7        .byte $F7   ; 
- D 1 - I - 0x00ACE8 02:ACD8: 00        .byte $00   ; 
- D 1 - I - 0x00ACE9 02:ACD9: 00        .byte $00   ; 
- D 1 - I - 0x00ACEA 02:ACDA: 85        .byte $85   ; 
- D 1 - I - 0x00ACEB 02:ACDB: 00        .byte $00   ; 
- D 1 - I - 0x00ACEC 02:ACDC: 00        .byte $00   ; 
- D 1 - I - 0x00ACED 02:ACDD: 00        .byte $00   ; 
- D 1 - I - 0x00ACEE 02:ACDE: D6        .byte $D6   ; 
- D 1 - I - 0x00ACEF 02:ACDF: 00        .byte $00   ; 
- D 1 - I - 0x00ACF0 02:ACE0: 00        .byte $00   ; 
- D 1 - I - 0x00ACF1 02:ACE1: 00        .byte $00   ; 
- D 1 - I - 0x00ACF2 02:ACE2: 86        .byte $86   ; 
- D 1 - I - 0x00ACF3 02:ACE3: D7        .byte $D7   ; 
- D 1 - I - 0x00ACF4 02:ACE4: 00        .byte $00   ; 
- D 1 - I - 0x00ACF5 02:ACE5: 00        .byte $00   ; 
- D 1 - I - 0x00ACF6 02:ACE6: 87        .byte $87   ; 
- D 1 - I - 0x00ACF7 02:ACE7: C1        .byte $C1   ; 
- D 1 - I - 0x00ACF8 02:ACE8: 00        .byte $00   ; 
- D 1 - I - 0x00ACF9 02:ACE9: 00        .byte $00   ; 
- D 1 - I - 0x00ACFA 02:ACEA: 00        .byte $00   ; 
- D 1 - I - 0x00ACFB 02:ACEB: 00        .byte $00   ; 
- D 1 - I - 0x00ACFC 02:ACEC: 00        .byte $00   ; 
- D 1 - I - 0x00ACFD 02:ACED: 00        .byte $00   ; 
- D 1 - I - 0x00ACFE 02:ACEE: 00        .byte $00   ; 
- D 1 - I - 0x00ACFF 02:ACEF: 00        .byte $00   ; 
- D 1 - I - 0x00AD00 02:ACF0: 00        .byte $00   ; 
- D 1 - I - 0x00AD01 02:ACF1: 00        .byte $00   ; 
- D 1 - I - 0x00AD02 02:ACF2: 00        .byte $00   ; 
- D 1 - I - 0x00AD03 02:ACF3: 00        .byte $00   ; 
- D 1 - I - 0x00AD04 02:ACF4: 0A        .byte $0A   ; 
- D 1 - I - 0x00AD05 02:ACF5: 09        .byte $09   ; 
- D 1 - I - 0x00AD06 02:ACF6: 32        .byte $32   ; 
- D 1 - I - 0x00AD07 02:ACF7: 00        .byte $00   ; 
- D 1 - I - 0x00AD08 02:ACF8: 00        .byte $00   ; 
- D 1 - I - 0x00AD09 02:ACF9: 00        .byte $00   ; 
- D 1 - I - 0x00AD0A 02:ACFA: 00        .byte $00   ; 
- D 1 - I - 0x00AD0B 02:ACFB: 0B        .byte $0B   ; 
- D 1 - I - 0x00AD0C 02:ACFC: 00        .byte $00   ; 
- D 1 - I - 0x00AD0D 02:ACFD: 0B        .byte $0B   ; 
- D 1 - I - 0x00AD0E 02:ACFE: 0C        .byte $0C   ; 
- D 1 - I - 0x00AD0F 02:ACFF: 35        .byte $35   ; 
- D 1 - I - 0x00AD10 02:AD00: 0C        .byte $0C   ; 
- D 1 - I - 0x00AD11 02:AD01: 35        .byte $35   ; 
- D 1 - I - 0x00AD12 02:AD02: 10        .byte $10   ; 
- D 1 - I - 0x00AD13 02:AD03: 11        .byte $11   ; 
- D 1 - I - 0x00AD14 02:AD04: 12        .byte $12   ; 
- D 1 - I - 0x00AD15 02:AD05: 14        .byte $14   ; 
- D 1 - I - 0x00AD16 02:AD06: 3C        .byte $3C   ; 
- D 1 - I - 0x00AD17 02:AD07: 83        .byte $83   ; 
- D 1 - I - 0x00AD18 02:AD08: 35        .byte $35   ; 
- D 1 - I - 0x00AD19 02:AD09: 3B        .byte $3B   ; 
- D 1 - I - 0x00AD1A 02:AD0A: 12        .byte $12   ; 
- D 1 - I - 0x00AD1B 02:AD0B: 0E        .byte $0E   ; 
- D 1 - I - 0x00AD1C 02:AD0C: 82        .byte $82   ; 
- D 1 - I - 0x00AD1D 02:AD0D: 00        .byte $00   ; 
- D 1 - I - 0x00AD1E 02:AD0E: 38        .byte $38   ; 
- D 1 - I - 0x00AD1F 02:AD0F: 83        .byte $83   ; 
- D 1 - I - 0x00AD20 02:AD10: 00        .byte $00   ; 
- D 1 - I - 0x00AD21 02:AD11: 00        .byte $00   ; 
- D 1 - I - 0x00AD22 02:AD12: 00        .byte $00   ; 
- D 1 - I - 0x00AD23 02:AD13: 58        .byte $58   ; 
- D 1 - I - 0x00AD24 02:AD14: 00        .byte $00   ; 
- D 1 - I - 0x00AD25 02:AD15: 00        .byte $00   ; 
- D 1 - I - 0x00AD26 02:AD16: 00        .byte $00   ; 
- D 1 - I - 0x00AD27 02:AD17: 59        .byte $59   ; 
- D 1 - I - 0x00AD28 02:AD18: 00        .byte $00   ; 
- D 1 - I - 0x00AD29 02:AD19: 81        .byte $81   ; 
- D 1 - I - 0x00AD2A 02:AD1A: 12        .byte $12   ; 
- D 1 - I - 0x00AD2B 02:AD1B: 3B        .byte $3B   ; 
- D 1 - I - 0x00AD2C 02:AD1C: 00        .byte $00   ; 
- D 1 - I - 0x00AD2D 02:AD1D: 00        .byte $00   ; 
- D 1 - I - 0x00AD2E 02:AD1E: 00        .byte $00   ; 
- D 1 - I - 0x00AD2F 02:AD1F: 00        .byte $00   ; 
- D 1 - I - 0x00AD30 02:AD20: 00        .byte $00   ; 
- D 1 - I - 0x00AD31 02:AD21: 00        .byte $00   ; 
- D 1 - I - 0x00AD32 02:AD22: 00        .byte $00   ; 
- D 1 - I - 0x00AD33 02:AD23: 00        .byte $00   ; 
- D 1 - I - 0x00AD34 02:AD24: 00        .byte $00   ; 
- D 1 - I - 0x00AD35 02:AD25: 00        .byte $00   ; 
- D 1 - I - 0x00AD36 02:AD26: 00        .byte $00   ; 
- D 1 - I - 0x00AD37 02:AD27: 00        .byte $00   ; 
- D 1 - I - 0x00AD38 02:AD28: 12        .byte $12   ; 
- D 1 - I - 0x00AD39 02:AD29: 36        .byte $36   ; 
- D 1 - I - 0x00AD3A 02:AD2A: 0E        .byte $0E   ; 
- D 1 - I - 0x00AD3B 02:AD2B: 0F        .byte $0F   ; 
- D 1 - I - 0x00AD3C 02:AD2C: 81        .byte $81   ; 
- D 1 - I - 0x00AD3D 02:AD2D: 83        .byte $83   ; 
- D 1 - I - 0x00AD3E 02:AD2E: 3A        .byte $3A   ; 
- D 1 - I - 0x00AD3F 02:AD2F: 14        .byte $14   ; 
- D 1 - I - 0x00AD40 02:AD30: 00        .byte $00   ; 
- D 1 - I - 0x00AD41 02:AD31: 00        .byte $00   ; 
- D 1 - I - 0x00AD42 02:AD32: 00        .byte $00   ; 
- D 1 - I - 0x00AD43 02:AD33: 00        .byte $00   ; 
- D 1 - I - 0x00AD44 02:AD34: 00        .byte $00   ; 
- D 1 - I - 0x00AD45 02:AD35: 00        .byte $00   ; 
- D 1 - I - 0x00AD46 02:AD36: 00        .byte $00   ; 
- D 1 - I - 0x00AD47 02:AD37: 00        .byte $00   ; 
- D 1 - I - 0x00AD48 02:AD38: 0D        .byte $0D   ; 
- D 1 - I - 0x00AD49 02:AD39: 0A        .byte $0A   ; 
- D 1 - I - 0x00AD4A 02:AD3A: 09        .byte $09   ; 
- D 1 - I - 0x00AD4B 02:AD3B: 0A        .byte $0A   ; 
- D 1 - I - 0x00AD4C 02:AD3C: 12        .byte $12   ; 
- D 1 - I - 0x00AD4D 02:AD3D: 36        .byte $36   ; 
- D 1 - I - 0x00AD4E 02:AD3E: 36        .byte $36   ; 
- D 1 - I - 0x00AD4F 02:AD3F: 36        .byte $36   ; 
- D 1 - I - 0x00AD50 02:AD40: 81        .byte $81   ; 
- D 1 - I - 0x00AD51 02:AD41: 83        .byte $83   ; 
- D 1 - I - 0x00AD52 02:AD42: 13        .byte $13   ; 
- D 1 - I - 0x00AD53 02:AD43: 80        .byte $80   ; 
- D 1 - I - 0x00AD54 02:AD44: 00        .byte $00   ; 
- D 1 - I - 0x00AD55 02:AD45: 00        .byte $00   ; 
- D 1 - I - 0x00AD56 02:AD46: 00        .byte $00   ; 
- D 1 - I - 0x00AD57 02:AD47: 00        .byte $00   ; 
- D 1 - I - 0x00AD58 02:AD48: 0A        .byte $0A   ; 
- D 1 - I - 0x00AD59 02:AD49: 09        .byte $09   ; 
- D 1 - I - 0x00AD5A 02:AD4A: 0A        .byte $0A   ; 
- D 1 - I - 0x00AD5B 02:AD4B: 09        .byte $09   ; 
- D 1 - I - 0x00AD5C 02:AD4C: 36        .byte $36   ; 
- D 1 - I - 0x00AD5D 02:AD4D: 33        .byte $33   ; 
- D 1 - I - 0x00AD5E 02:AD4E: 33        .byte $33   ; 
- D 1 - I - 0x00AD5F 02:AD4F: 34        .byte $34   ; 
- D 1 - I - 0x00AD60 02:AD50: 84        .byte $84   ; 
- D 1 - I - 0x00AD61 02:AD51: 82        .byte $82   ; 
- D 1 - I - 0x00AD62 02:AD52: 83        .byte $83   ; 
- D 1 - I - 0x00AD63 02:AD53: 3A        .byte $3A   ; 
- D 1 - I - 0x00AD64 02:AD54: 00        .byte $00   ; 
- D 1 - I - 0x00AD65 02:AD55: 00        .byte $00   ; 
- D 1 - I - 0x00AD66 02:AD56: 00        .byte $00   ; 
- D 1 - I - 0x00AD67 02:AD57: 00        .byte $00   ; 
- D 1 - I - 0x00AD68 02:AD58: 0A        .byte $0A   ; 
- D 1 - I - 0x00AD69 02:AD59: 09        .byte $09   ; 
- D 1 - I - 0x00AD6A 02:AD5A: 09        .byte $09   ; 
- D 1 - I - 0x00AD6B 02:AD5B: 09        .byte $09   ; 
- D 1 - I - 0x00AD6C 02:AD5C: 33        .byte $33   ; 
- D 1 - I - 0x00AD6D 02:AD5D: 34        .byte $34   ; 
- D 1 - I - 0x00AD6E 02:AD5E: 33        .byte $33   ; 
- D 1 - I - 0x00AD6F 02:AD5F: 34        .byte $34   ; 
- D 1 - I - 0x00AD70 02:AD60: 14        .byte $14   ; 
- D 1 - I - 0x00AD71 02:AD61: 39        .byte $39   ; 
- D 1 - I - 0x00AD72 02:AD62: 11        .byte $11   ; 
- D 1 - I - 0x00AD73 02:AD63: 37        .byte $37   ; 
- D 1 - I - 0x00AD74 02:AD64: 00        .byte $00   ; 
- D 1 - I - 0x00AD75 02:AD65: 81        .byte $81   ; 
- D 1 - I - 0x00AD76 02:AD66: 83        .byte $83   ; 
- D 1 - I - 0x00AD77 02:AD67: 13        .byte $13   ; 
- D 1 - I - 0x00AD78 02:AD68: 09        .byte $09   ; 
- D 1 - I - 0x00AD79 02:AD69: 09        .byte $09   ; 
- D 1 - I - 0x00AD7A 02:AD6A: 0A        .byte $0A   ; 
- D 1 - I - 0x00AD7B 02:AD6B: 09        .byte $09   ; 
- D 1 - I - 0x00AD7C 02:AD6C: 33        .byte $33   ; 
- D 1 - I - 0x00AD7D 02:AD6D: 34        .byte $34   ; 
- D 1 - I - 0x00AD7E 02:AD6E: 33        .byte $33   ; 
- D 1 - I - 0x00AD7F 02:AD6F: 34        .byte $34   ; 
- D 1 - I - 0x00AD80 02:AD70: 11        .byte $11   ; 
- D 1 - I - 0x00AD81 02:AD71: 37        .byte $37   ; 
- D 1 - I - 0x00AD82 02:AD72: 11        .byte $11   ; 
- D 1 - I - 0x00AD83 02:AD73: 37        .byte $37   ; 
- D 1 - I - 0x00AD84 02:AD74: 80        .byte $80   ; 
- D 1 - I - 0x00AD85 02:AD75: 83        .byte $83   ; 
- D 1 - I - 0x00AD86 02:AD76: 13        .byte $13   ; 
- D 1 - I - 0x00AD87 02:AD77: 80        .byte $80   ; 
- D 1 - I - 0x00AD88 02:AD78: 09        .byte $09   ; 
- D 1 - I - 0x00AD89 02:AD79: 0A        .byte $0A   ; 
- D 1 - I - 0x00AD8A 02:AD7A: 09        .byte $09   ; 
- D 1 - I - 0x00AD8B 02:AD7B: 0A        .byte $0A   ; 
- D 1 - I - 0x00AD8C 02:AD7C: 33        .byte $33   ; 
- D 1 - I - 0x00AD8D 02:AD7D: 34        .byte $34   ; 
- D 1 - I - 0x00AD8E 02:AD7E: 33        .byte $33   ; 
- D 1 - I - 0x00AD8F 02:AD7F: 33        .byte $33   ; 
- D 1 - I - 0x00AD90 02:AD80: 11        .byte $11   ; 
- D 1 - I - 0x00AD91 02:AD81: 37        .byte $37   ; 
- D 1 - I - 0x00AD92 02:AD82: 14        .byte $14   ; 
- D 1 - I - 0x00AD93 02:AD83: 39        .byte $39   ; 
- D 1 - I - 0x00AD94 02:AD84: 84        .byte $84   ; 
- D 1 - I - 0x00AD95 02:AD85: 82        .byte $82   ; 
- D 1 - I - 0x00AD96 02:AD86: 00        .byte $00   ; 
- D 1 - I - 0x00AD97 02:AD87: 38        .byte $38   ; 
- D 1 - I - 0x00AD98 02:AD88: 00        .byte $00   ; 
- D 1 - I - 0x00AD99 02:AD89: 00        .byte $00   ; 
- D 1 - I - 0x00AD9A 02:AD8A: 00        .byte $00   ; 
- D 1 - I - 0x00AD9B 02:AD8B: 00        .byte $00   ; 
- D 1 - I - 0x00AD9C 02:AD8C: 00        .byte $00   ; 
- D 1 - I - 0x00AD9D 02:AD8D: 00        .byte $00   ; 
- D 1 - I - 0x00AD9E 02:AD8E: 00        .byte $00   ; 
- D 1 - I - 0x00AD9F 02:AD8F: 00        .byte $00   ; 
- D 1 - I - 0x00ADA0 02:AD90: 00        .byte $00   ; 
- D 1 - I - 0x00ADA1 02:AD91: 00        .byte $00   ; 
- D 1 - I - 0x00ADA2 02:AD92: 00        .byte $00   ; 
- D 1 - I - 0x00ADA3 02:AD93: 00        .byte $00   ; 
- D 1 - I - 0x00ADA4 02:AD94: 0B        .byte $0B   ; 
- D 1 - I - 0x00ADA5 02:AD95: 09        .byte $09   ; 
- D 1 - I - 0x00ADA6 02:AD96: 09        .byte $09   ; 
- D 1 - I - 0x00ADA7 02:AD97: 32        .byte $32   ; 
- D 1 - I - 0x00ADA8 02:AD98: 00        .byte $00   ; 
- D 1 - I - 0x00ADA9 02:AD99: 00        .byte $00   ; 
- D 1 - I - 0x00ADAA 02:AD9A: 81        .byte $81   ; 
- D 1 - I - 0x00ADAB 02:AD9B: 83        .byte $83   ; 
- D 1 - I - 0x00ADAC 02:AD9C: 00        .byte $00   ; 
- D 1 - I - 0x00ADAD 02:AD9D: 00        .byte $00   ; 
- D 1 - I - 0x00ADAE 02:AD9E: 00        .byte $00   ; 
- D 1 - I - 0x00ADAF 02:AD9F: 00        .byte $00   ; 
- D 1 - I - 0x00ADB0 02:ADA0: 17        .byte $17   ; 
- D 1 - I - 0x00ADB1 02:ADA1: 17        .byte $17   ; 
- D 1 - I - 0x00ADB2 02:ADA2: 17        .byte $17   ; 
- D 1 - I - 0x00ADB3 02:ADA3: 17        .byte $17   ; 
- D 1 - I - 0x00ADB4 02:ADA4: 3F        .byte $3F   ; 
- D 1 - I - 0x00ADB5 02:ADA5: 3F        .byte $3F   ; 
- D 1 - I - 0x00ADB6 02:ADA6: 3F        .byte $3F   ; 
- D 1 - I - 0x00ADB7 02:ADA7: 3F        .byte $3F   ; 
- D 1 - I - 0x00ADB8 02:ADA8: 12        .byte $12   ; 
- D 1 - I - 0x00ADB9 02:ADA9: 14        .byte $14   ; 
- D 1 - I - 0x00ADBA 02:ADAA: 82        .byte $82   ; 
- D 1 - I - 0x00ADBB 02:ADAB: 00        .byte $00   ; 
- D 1 - I - 0x00ADBC 02:ADAC: 38        .byte $38   ; 
- D 1 - I - 0x00ADBD 02:ADAD: 00        .byte $00   ; 
- D 1 - I - 0x00ADBE 02:ADAE: 00        .byte $00   ; 
- D 1 - I - 0x00ADBF 02:ADAF: 00        .byte $00   ; 
- D 1 - I - 0x00ADC0 02:ADB0: 00        .byte $00   ; 
- D 1 - I - 0x00ADC1 02:ADB1: 00        .byte $00   ; 
- D 1 - I - 0x00ADC2 02:ADB2: 00        .byte $00   ; 
- D 1 - I - 0x00ADC3 02:ADB3: 00        .byte $00   ; 
- D 1 - I - 0x00ADC4 02:ADB4: 00        .byte $00   ; 
- D 1 - I - 0x00ADC5 02:ADB5: 00        .byte $00   ; 
- D 1 - I - 0x00ADC6 02:ADB6: 00        .byte $00   ; 
- D 1 - I - 0x00ADC7 02:ADB7: 00        .byte $00   ; 
- D 1 - I - 0x00ADC8 02:ADB8: 00        .byte $00   ; 
- D 1 - I - 0x00ADC9 02:ADB9: 92        .byte $92   ; 
- D 1 - I - 0x00ADCA 02:ADBA: 94        .byte $94   ; 
- D 1 - I - 0x00ADCB 02:ADBB: 91        .byte $91   ; 
- D 1 - I - 0x00ADCC 02:ADBC: D0        .byte $D0   ; 
- D 1 - I - 0x00ADCD 02:ADBD: CA        .byte $CA   ; 
- D 1 - I - 0x00ADCE 02:ADBE: CA        .byte $CA   ; 
- D 1 - I - 0x00ADCF 02:ADBF: CA        .byte $CA   ; 
- D 1 - I - 0x00ADD0 02:ADC0: 9A        .byte $9A   ; 
- D 1 - I - 0x00ADD1 02:ADC1: 97        .byte $97   ; 
- D 1 - I - 0x00ADD2 02:ADC2: 99        .byte $99   ; 
- D 1 - I - 0x00ADD3 02:ADC3: 9A        .byte $9A   ; 
- D 1 - I - 0x00ADD4 02:ADC4: F7        .byte $F7   ; 
- D 1 - I - 0x00ADD5 02:ADC5: DF        .byte $DF   ; 
- D 1 - I - 0x00ADD6 02:ADC6: 65        .byte $65   ; 
- D 1 - I - 0x00ADD7 02:ADC7: 65        .byte $65   ; 
- D 1 - I - 0x00ADD8 02:ADC8: 92        .byte $92   ; 
- D 1 - I - 0x00ADD9 02:ADC9: 98        .byte $98   ; 
- D 1 - I - 0x00ADDA 02:ADCA: 9B        .byte $9B   ; 
- D 1 - I - 0x00ADDB 02:ADCB: D3        .byte $D3   ; 
- D 1 - I - 0x00ADDC 02:ADCC: CA        .byte $CA   ; 
- D 1 - I - 0x00ADDD 02:ADCD: CC        .byte $CC   ; 
- D 1 - I - 0x00ADDE 02:ADCE: 99        .byte $99   ; 
- D 1 - I - 0x00ADDF 02:ADCF: D4        .byte $D4   ; 
- D 1 - I - 0x00ADE0 02:ADD0: 99        .byte $99   ; 
- D 1 - I - 0x00ADE1 02:ADD1: D4        .byte $D4   ; 
- D 1 - I - 0x00ADE2 02:ADD2: 99        .byte $99   ; 
- D 1 - I - 0x00ADE3 02:ADD3: 9A        .byte $9A   ; 
- D 1 - I - 0x00ADE4 02:ADD4: 65        .byte $65   ; 
- D 1 - I - 0x00ADE5 02:ADD5: 65        .byte $65   ; 
- D 1 - I - 0x00ADE6 02:ADD6: 65        .byte $65   ; 
- D 1 - I - 0x00ADE7 02:ADD7: 65        .byte $65   ; 
- D 1 - I - 0x00ADE8 02:ADD8: 00        .byte $00   ; 
- D 1 - I - 0x00ADE9 02:ADD9: 00        .byte $00   ; 
- D 1 - I - 0x00ADEA 02:ADDA: 87        .byte $87   ; 
- D 1 - I - 0x00ADEB 02:ADDB: C1        .byte $C1   ; 
- D 1 - I - 0x00ADEC 02:ADDC: 00        .byte $00   ; 
- D 1 - I - 0x00ADED 02:ADDD: CE        .byte $CE   ; 
- D 1 - I - 0x00ADEE 02:ADDE: C2        .byte $C2   ; 
- D 1 - I - 0x00ADEF 02:ADDF: C3        .byte $C3   ; 
- D 1 - I - 0x00ADF0 02:ADE0: 97        .byte $97   ; 
- D 1 - I - 0x00ADF1 02:ADE1: 99        .byte $99   ; 
- D 1 - I - 0x00ADF2 02:ADE2: 9A        .byte $9A   ; 
- D 1 - I - 0x00ADF3 02:ADE3: 99        .byte $99   ; 
- D 1 - I - 0x00ADF4 02:ADE4: 65        .byte $65   ; 
- D 1 - I - 0x00ADF5 02:ADE5: 65        .byte $65   ; 
- D 1 - I - 0x00ADF6 02:ADE6: 65        .byte $65   ; 
- D 1 - I - 0x00ADF7 02:ADE7: 65        .byte $65   ; 
- D 1 - I - 0x00ADF8 02:ADE8: 00        .byte $00   ; 
- D 1 - I - 0x00ADF9 02:ADE9: CD        .byte $CD   ; 
- D 1 - I - 0x00ADFA 02:ADEA: 96        .byte $96   ; 
- D 1 - I - 0x00ADFB 02:ADEB: D1        .byte $D1   ; 
- D 1 - I - 0x00ADFC 02:ADEC: CE        .byte $CE   ; 
- D 1 - I - 0x00ADFD 02:ADED: D5        .byte $D5   ; 
- D 1 - I - 0x00ADFE 02:ADEE: CF        .byte $CF   ; 
- D 1 - I - 0x00ADFF 02:ADEF: 96        .byte $96   ; 
- D 1 - I - 0x00AE00 02:ADF0: 99        .byte $99   ; 
- D 1 - I - 0x00AE01 02:ADF1: 9A        .byte $9A   ; 
- D 1 - I - 0x00AE02 02:ADF2: 99        .byte $99   ; 
- D 1 - I - 0x00AE03 02:ADF3: 9A        .byte $9A   ; 
- D 1 - I - 0x00AE04 02:ADF4: 66        .byte $66   ; 
- D 1 - I - 0x00AE05 02:ADF5: F7        .byte $F7   ; 
- D 1 - I - 0x00AE06 02:ADF6: F7        .byte $F7   ; 
- D 1 - I - 0x00AE07 02:ADF7: F7        .byte $F7   ; 
- D 1 - I - 0x00AE08 02:ADF8: 00        .byte $00   ; 
- D 1 - I - 0x00AE09 02:ADF9: 00        .byte $00   ; 
- D 1 - I - 0x00AE0A 02:ADFA: 00        .byte $00   ; 
- D 1 - I - 0x00AE0B 02:ADFB: 00        .byte $00   ; 
- D 1 - I - 0x00AE0C 02:ADFC: 00        .byte $00   ; 
- D 1 - I - 0x00AE0D 02:ADFD: 00        .byte $00   ; 
- D 1 - I - 0x00AE0E 02:ADFE: 00        .byte $00   ; 
- D 1 - I - 0x00AE0F 02:ADFF: 00        .byte $00   ; 
- D 1 - I - 0x00AE10 02:AE00: 17        .byte $17   ; 
- D 1 - I - 0x00AE11 02:AE01: 17        .byte $17   ; 
- D 1 - I - 0x00AE12 02:AE02: 17        .byte $17   ; 
- D 1 - I - 0x00AE13 02:AE03: 17        .byte $17   ; 
- D 1 - I - 0x00AE14 02:AE04: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE15 02:AE05: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE16 02:AE06: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE17 02:AE07: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE18 02:AE08: 00        .byte $00   ; 
- D 1 - I - 0x00AE19 02:AE09: 00        .byte $00   ; 
- D 1 - I - 0x00AE1A 02:AE0A: 00        .byte $00   ; 
- D 1 - I - 0x00AE1B 02:AE0B: 00        .byte $00   ; 
- D 1 - I - 0x00AE1C 02:AE0C: 00        .byte $00   ; 
- D 1 - I - 0x00AE1D 02:AE0D: 00        .byte $00   ; 
- D 1 - I - 0x00AE1E 02:AE0E: 00        .byte $00   ; 
- D 1 - I - 0x00AE1F 02:AE0F: 00        .byte $00   ; 
- D 1 - I - 0x00AE20 02:AE10: 17        .byte $17   ; 
- D 1 - I - 0x00AE21 02:AE11: 17        .byte $17   ; 
- D 1 - I - 0x00AE22 02:AE12: 17        .byte $17   ; 
- D 1 - I - 0x00AE23 02:AE13: 3E        .byte $3E   ; 
- D 1 - I - 0x00AE24 02:AE14: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE25 02:AE15: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE26 02:AE16: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE27 02:AE17: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE28 02:AE18: 00        .byte $00   ; 
- D 1 - I - 0x00AE29 02:AE19: 00        .byte $00   ; 
- D 1 - I - 0x00AE2A 02:AE1A: 00        .byte $00   ; 
- D 1 - I - 0x00AE2B 02:AE1B: 00        .byte $00   ; 
- D 1 - I - 0x00AE2C 02:AE1C: 00        .byte $00   ; 
- D 1 - I - 0x00AE2D 02:AE1D: 00        .byte $00   ; 
- D 1 - I - 0x00AE2E 02:AE1E: 00        .byte $00   ; 
- D 1 - I - 0x00AE2F 02:AE1F: 00        .byte $00   ; 
- D 1 - I - 0x00AE30 02:AE20: 16        .byte $16   ; 
- D 1 - I - 0x00AE31 02:AE21: 17        .byte $17   ; 
- D 1 - I - 0x00AE32 02:AE22: 17        .byte $17   ; 
- D 1 - I - 0x00AE33 02:AE23: 17        .byte $17   ; 
- D 1 - I - 0x00AE34 02:AE24: 3D        .byte $3D   ; 
- D 1 - I - 0x00AE35 02:AE25: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE36 02:AE26: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE37 02:AE27: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE38 02:AE28: 00        .byte $00   ; 
- D 1 - I - 0x00AE39 02:AE29: 00        .byte $00   ; 
- D 1 - I - 0x00AE3A 02:AE2A: 00        .byte $00   ; 
- D 1 - I - 0x00AE3B 02:AE2B: 15        .byte $15   ; 
- D 1 - I - 0x00AE3C 02:AE2C: 00        .byte $00   ; 
- D 1 - I - 0x00AE3D 02:AE2D: 00        .byte $00   ; 
- D 1 - I - 0x00AE3E 02:AE2E: 00        .byte $00   ; 
- D 1 - I - 0x00AE3F 02:AE2F: 15        .byte $15   ; 
- D 1 - I - 0x00AE40 02:AE30: 17        .byte $17   ; 
- D 1 - I - 0x00AE41 02:AE31: 17        .byte $17   ; 
- D 1 - I - 0x00AE42 02:AE32: 17        .byte $17   ; 
- D 1 - I - 0x00AE43 02:AE33: 15        .byte $15   ; 
- D 1 - I - 0x00AE44 02:AE34: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE45 02:AE35: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE46 02:AE36: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE47 02:AE37: 3F        .byte $3F   ; 
- D 1 - I - 0x00AE48 02:AE38: 75        .byte $75   ; 
- D 1 - I - 0x00AE49 02:AE39: A1        .byte $A1   ; 
- D 1 - I - 0x00AE4A 02:AE3A: 74        .byte $74   ; 
- D 1 - I - 0x00AE4B 02:AE3B: A1        .byte $A1   ; 
- D 1 - I - 0x00AE4C 02:AE3C: 76        .byte $76   ; 
- D 1 - I - 0x00AE4D 02:AE3D: AA        .byte $AA   ; 
- D 1 - I - 0x00AE4E 02:AE3E: E2        .byte $E2   ; 
- D 1 - I - 0x00AE4F 02:AE3F: AA        .byte $AA   ; 
- D 1 - I - 0x00AE50 02:AE40: 76        .byte $76   ; 
- D 1 - I - 0x00AE51 02:AE41: AA        .byte $AA   ; 
- D 1 - I - 0x00AE52 02:AE42: 05        .byte $05   ; 
- D 1 - I - 0x00AE53 02:AE43: AA        .byte $AA   ; 
- D 1 - I - 0x00AE54 02:AE44: F1        .byte $F1   ; 
- D 1 - I - 0x00AE55 02:AE45: F2        .byte $F2   ; 
- D 1 - I - 0x00AE56 02:AE46: F2        .byte $F2   ; 
- D 1 - I - 0x00AE57 02:AE47: F2        .byte $F2   ; 
- D 1 - I - 0x00AE58 02:AE48: 74        .byte $74   ; 
- D 1 - I - 0x00AE59 02:AE49: A1        .byte $A1   ; 
- D 1 - I - 0x00AE5A 02:AE4A: 74        .byte $74   ; 
- D 1 - I - 0x00AE5B 02:AE4B: F6        .byte $F6   ; 
- D 1 - I - 0x00AE5C 02:AE4C: E2        .byte $E2   ; 
- D 1 - I - 0x00AE5D 02:AE4D: AA        .byte $AA   ; 
- D 1 - I - 0x00AE5E 02:AE4E: AA        .byte $AA   ; 
- D 1 - I - 0x00AE5F 02:AE4F: 9C        .byte $9C   ; 
- D 1 - I - 0x00AE60 02:AE50: 05        .byte $05   ; 
- D 1 - I - 0x00AE61 02:AE51: AA        .byte $AA   ; 
- D 1 - I - 0x00AE62 02:AE52: 05        .byte $05   ; 
- D 1 - I - 0x00AE63 02:AE53: F5        .byte $F5   ; 
- D 1 - I - 0x00AE64 02:AE54: F2        .byte $F2   ; 
- D 1 - I - 0x00AE65 02:AE55: F2        .byte $F2   ; 
- D 1 - I - 0x00AE66 02:AE56: 42        .byte $42   ; 
- D 1 - I - 0x00AE67 02:AE57: 43        .byte $43   ; 
- D 1 - I - 0x00AE68 02:AE58: 15        .byte $15   ; 
- D 1 - I - 0x00AE69 02:AE59: A8        .byte $A8   ; 
- D 1 - I - 0x00AE6A 02:AE5A: 74        .byte $74   ; 
- D 1 - I - 0x00AE6B 02:AE5B: A1        .byte $A1   ; 
- D 1 - I - 0x00AE6C 02:AE5C: 15        .byte $15   ; 
- D 1 - I - 0x00AE6D 02:AE5D: A9        .byte $A9   ; 
- D 1 - I - 0x00AE6E 02:AE5E: E2        .byte $E2   ; 
- D 1 - I - 0x00AE6F 02:AE5F: AA        .byte $AA   ; 
- D 1 - I - 0x00AE70 02:AE60: 15        .byte $15   ; 
- D 1 - I - 0x00AE71 02:AE61: A9        .byte $A9   ; 
- D 1 - I - 0x00AE72 02:AE62: 05        .byte $05   ; 
- D 1 - I - 0x00AE73 02:AE63: AA        .byte $AA   ; 
- D 1 - I - 0x00AE74 02:AE64: 15        .byte $15   ; 
- D 1 - I - 0x00AE75 02:AE65: F1        .byte $F1   ; 
- D 1 - I - 0x00AE76 02:AE66: F2        .byte $F2   ; 
- D 1 - I - 0x00AE77 02:AE67: F2        .byte $F2   ; 
- D 1 - I - 0x00AE78 02:AE68: 00        .byte $00   ; 
- D 1 - I - 0x00AE79 02:AE69: 00        .byte $00   ; 
- D 1 - I - 0x00AE7A 02:AE6A: 00        .byte $00   ; 
- D 1 - I - 0x00AE7B 02:AE6B: 00        .byte $00   ; 
- D 1 - I - 0x00AE7C 02:AE6C: 00        .byte $00   ; 
- D 1 - I - 0x00AE7D 02:AE6D: 00        .byte $00   ; 
- D 1 - I - 0x00AE7E 02:AE6E: 00        .byte $00   ; 
- D 1 - I - 0x00AE7F 02:AE6F: 00        .byte $00   ; 
- D 1 - I - 0x00AE80 02:AE70: 00        .byte $00   ; 
- D 1 - I - 0x00AE81 02:AE71: 00        .byte $00   ; 
- D 1 - I - 0x00AE82 02:AE72: 00        .byte $00   ; 
- D 1 - I - 0x00AE83 02:AE73: 16        .byte $16   ; 
- D 1 - I - 0x00AE84 02:AE74: 00        .byte $00   ; 
- D 1 - I - 0x00AE85 02:AE75: 00        .byte $00   ; 
- D 1 - I - 0x00AE86 02:AE76: 00        .byte $00   ; 
- D 1 - I - 0x00AE87 02:AE77: 3D        .byte $3D   ; 
- D 1 - I - 0x00AE88 02:AE78: 75        .byte $75   ; 
- D 1 - I - 0x00AE89 02:AE79: A1        .byte $A1   ; 
- D 1 - I - 0x00AE8A 02:AE7A: 74        .byte $74   ; 
- D 1 - I - 0x00AE8B 02:AE7B: A1        .byte $A1   ; 
- D 1 - I - 0x00AE8C 02:AE7C: A9        .byte $A9   ; 
- D 1 - I - 0x00AE8D 02:AE7D: AA        .byte $AA   ; 
- D 1 - I - 0x00AE8E 02:AE7E: 40        .byte $40   ; 
- D 1 - I - 0x00AE8F 02:AE7F: 41        .byte $41   ; 
- D 1 - I - 0x00AE90 02:AE80: 20        .byte $20   ; 
- D 1 - I - 0x00AE91 02:AE81: 41        .byte $41   ; 
- D 1 - I - 0x00AE92 02:AE82: 02        .byte $02   ; 
- D 1 - I - 0x00AE93 02:AE83: 5F        .byte $5F   ; 
- D 1 - I - 0x00AE94 02:AE84: 60        .byte $60   ; 
- D 1 - I - 0x00AE95 02:AE85: 5F        .byte $5F   ; 
- D 1 - I - 0x00AE96 02:AE86: BD        .byte $BD   ; 
- D 1 - I - 0x00AE97 02:AE87: BD        .byte $BD   ; 
- D 1 - I - 0x00AE98 02:AE88: 18        .byte $18   ; 
- D 1 - I - 0x00AE99 02:AE89: 44        .byte $44   ; 
- D 1 - I - 0x00AE9A 02:AE8A: 02        .byte $02   ; 
- D 1 - I - 0x00AE9B 02:AE8B: 5F        .byte $5F   ; 
- D 1 - I - 0x00AE9C 02:AE8C: 02        .byte $02   ; 
- D 1 - I - 0x00AE9D 02:AE8D: 5F        .byte $5F   ; 
- D 1 - I - 0x00AE9E 02:AE8E: BD        .byte $BD   ; 
- D 1 - I - 0x00AE9F 02:AE8F: BD        .byte $BD   ; 
- D 1 - I - 0x00AEA0 02:AE90: FC        .byte $FC   ; 
- D 1 - I - 0x00AEA1 02:AE91: BD        .byte $BD   ; 
- D 1 - I - 0x00AEA2 02:AE92: F8        .byte $F8   ; 
- D 1 - I - 0x00AEA3 02:AE93: BD        .byte $BD   ; 
- D 1 - I - 0x00AEA4 02:AE94: BD        .byte $BD   ; 
- D 1 - I - 0x00AEA5 02:AE95: BD        .byte $BD   ; 
- D 1 - I - 0x00AEA6 02:AE96: BD        .byte $BD   ; 
- D 1 - I - 0x00AEA7 02:AE97: BD        .byte $BD   ; 
- D 1 - I - 0x00AEA8 02:AE98: 15        .byte $15   ; 
- D 1 - I - 0x00AEA9 02:AE99: A8        .byte $A8   ; 
- D 1 - I - 0x00AEAA 02:AE9A: 74        .byte $74   ; 
- D 1 - I - 0x00AEAB 02:AE9B: A1        .byte $A1   ; 
- D 1 - I - 0x00AEAC 02:AE9C: 15        .byte $15   ; 
- D 1 - I - 0x00AEAD 02:AE9D: A9        .byte $A9   ; 
- D 1 - I - 0x00AEAE 02:AE9E: 40        .byte $40   ; 
- D 1 - I - 0x00AEAF 02:AE9F: 41        .byte $41   ; 
- D 1 - I - 0x00AEB0 02:AEA0: 21        .byte $21   ; 
- D 1 - I - 0x00AEB1 02:AEA1: 46        .byte $46   ; 
- D 1 - I - 0x00AEB2 02:AEA2: 02        .byte $02   ; 
- D 1 - I - 0x00AEB3 02:AEA3: 5F        .byte $5F   ; 
- D 1 - I - 0x00AEB4 02:AEA4: 60        .byte $60   ; 
- D 1 - I - 0x00AEB5 02:AEA5: 5F        .byte $5F   ; 
- D 1 - I - 0x00AEB6 02:AEA6: BD        .byte $BD   ; 
- D 1 - I - 0x00AEB7 02:AEA7: BD        .byte $BD   ; 
- D 1 - I - 0x00AEB8 02:AEA8: 16        .byte $16   ; 
- D 1 - I - 0x00AEB9 02:AEA9: 17        .byte $17   ; 
- D 1 - I - 0x00AEBA 02:AEAA: 17        .byte $17   ; 
- D 1 - I - 0x00AEBB 02:AEAB: 17        .byte $17   ; 
- D 1 - I - 0x00AEBC 02:AEAC: 3D        .byte $3D   ; 
- D 1 - I - 0x00AEBD 02:AEAD: 3F        .byte $3F   ; 
- D 1 - I - 0x00AEBE 02:AEAE: 3F        .byte $3F   ; 
- D 1 - I - 0x00AEBF 02:AEAF: 3F        .byte $3F   ; 
- - - - - - 0x00AEC0 02:AEB0: 00        .byte $00   ; 
- - - - - - 0x00AEC1 02:AEB1: 00        .byte $00   ; 
- - - - - - 0x00AEC2 02:AEB2: 00        .byte $00   ; 
- - - - - - 0x00AEC3 02:AEB3: 00        .byte $00   ; 
- - - - - - 0x00AEC4 02:AEB4: 00        .byte $00   ; 
- - - - - - 0x00AEC5 02:AEB5: 00        .byte $00   ; 
- - - - - - 0x00AEC6 02:AEB6: 00        .byte $00   ; 
- - - - - - 0x00AEC7 02:AEB7: 00        .byte $00   ; 
- D 1 - I - 0x00AEC8 02:AEB8: 17        .byte $17   ; 
- D 1 - I - 0x00AEC9 02:AEB9: 17        .byte $17   ; 
- D 1 - I - 0x00AECA 02:AEBA: 17        .byte $17   ; 
- D 1 - I - 0x00AECB 02:AEBB: 3E        .byte $3E   ; 
- D 1 - I - 0x00AECC 02:AEBC: 3F        .byte $3F   ; 
- D 1 - I - 0x00AECD 02:AEBD: 3F        .byte $3F   ; 
- D 1 - I - 0x00AECE 02:AEBE: 3F        .byte $3F   ; 
- D 1 - I - 0x00AECF 02:AEBF: 3F        .byte $3F   ; 
- - - - - - 0x00AED0 02:AEC0: 00        .byte $00   ; 
- - - - - - 0x00AED1 02:AEC1: 00        .byte $00   ; 
- - - - - - 0x00AED2 02:AEC2: 00        .byte $00   ; 
- - - - - - 0x00AED3 02:AEC3: 00        .byte $00   ; 
- - - - - - 0x00AED4 02:AEC4: 00        .byte $00   ; 
- - - - - - 0x00AED5 02:AEC5: 00        .byte $00   ; 
- - - - - - 0x00AED6 02:AEC6: 00        .byte $00   ; 
- - - - - - 0x00AED7 02:AEC7: 00        .byte $00   ; 
- D 1 - I - 0x00AED8 02:AEC8: 22        .byte $22   ; 
- D 1 - I - 0x00AED9 02:AEC9: 53        .byte $53   ; 
- D 1 - I - 0x00AEDA 02:AECA: 00        .byte $00   ; 
- D 1 - I - 0x00AEDB 02:AECB: 00        .byte $00   ; 
- D 1 - I - 0x00AEDC 02:AECC: 22        .byte $22   ; 
- D 1 - I - 0x00AEDD 02:AECD: 47        .byte $47   ; 
- D 1 - I - 0x00AEDE 02:AECE: 00        .byte $00   ; 
- D 1 - I - 0x00AEDF 02:AECF: 00        .byte $00   ; 
- D 1 - I - 0x00AEE0 02:AED0: 24        .byte $24   ; 
- D 1 - I - 0x00AEE1 02:AED1: 48        .byte $48   ; 
- D 1 - I - 0x00AEE2 02:AED2: 00        .byte $00   ; 
- D 1 - I - 0x00AEE3 02:AED3: 00        .byte $00   ; 
- D 1 - I - 0x00AEE4 02:AED4: DF        .byte $DF   ; 
- D 1 - I - 0x00AEE5 02:AED5: F7        .byte $F7   ; 
- D 1 - I - 0x00AEE6 02:AED6: F7        .byte $F7   ; 
- D 1 - I - 0x00AEE7 02:AED7: F7        .byte $F7   ; 
- D 1 - I - 0x00AEE8 02:AED8: 00        .byte $00   ; 
- D 1 - I - 0x00AEE9 02:AED9: 00        .byte $00   ; 
- D 1 - I - 0x00AEEA 02:AEDA: 23        .byte $23   ; 
- D 1 - I - 0x00AEEB 02:AEDB: 54        .byte $54   ; 
- D 1 - I - 0x00AEEC 02:AEDC: 00        .byte $00   ; 
- D 1 - I - 0x00AEED 02:AEDD: 00        .byte $00   ; 
- D 1 - I - 0x00AEEE 02:AEDE: 22        .byte $22   ; 
- D 1 - I - 0x00AEEF 02:AEDF: 47        .byte $47   ; 
- D 1 - I - 0x00AEF0 02:AEE0: 00        .byte $00   ; 
- D 1 - I - 0x00AEF1 02:AEE1: 00        .byte $00   ; 
- D 1 - I - 0x00AEF2 02:AEE2: 24        .byte $24   ; 
- D 1 - I - 0x00AEF3 02:AEE3: 48        .byte $48   ; 
- D 1 - I - 0x00AEF4 02:AEE4: F7        .byte $F7   ; 
- D 1 - I - 0x00AEF5 02:AEE5: F7        .byte $F7   ; 
- D 1 - I - 0x00AEF6 02:AEE6: F7        .byte $F7   ; 
- D 1 - I - 0x00AEF7 02:AEE7: F7        .byte $F7   ; 
- D 1 - I - 0x00AEF8 02:AEE8: 22        .byte $22   ; 
- D 1 - I - 0x00AEF9 02:AEE9: 53        .byte $53   ; 
- D 1 - I - 0x00AEFA 02:AEEA: 28        .byte $28   ; 
- D 1 - I - 0x00AEFB 02:AEEB: 00        .byte $00   ; 
- D 1 - I - 0x00AEFC 02:AEEC: 22        .byte $22   ; 
- D 1 - I - 0x00AEFD 02:AEED: 47        .byte $47   ; 
- D 1 - I - 0x00AEFE 02:AEEE: 00        .byte $00   ; 
- D 1 - I - 0x00AEFF 02:AEEF: 00        .byte $00   ; 
- D 1 - I - 0x00AF00 02:AEF0: 24        .byte $24   ; 
- D 1 - I - 0x00AF01 02:AEF1: 48        .byte $48   ; 
- D 1 - I - 0x00AF02 02:AEF2: 00        .byte $00   ; 
- D 1 - I - 0x00AF03 02:AEF3: 00        .byte $00   ; 
- D 1 - I - 0x00AF04 02:AEF4: F7        .byte $F7   ; 
- D 1 - I - 0x00AF05 02:AEF5: F7        .byte $F7   ; 
- D 1 - I - 0x00AF06 02:AEF6: F7        .byte $F7   ; 
- D 1 - I - 0x00AF07 02:AEF7: F7        .byte $F7   ; 
- D 1 - I - 0x00AF08 02:AEF8: 00        .byte $00   ; 
- D 1 - I - 0x00AF09 02:AEF9: 00        .byte $00   ; 
- D 1 - I - 0x00AF0A 02:AEFA: 23        .byte $23   ; 
- D 1 - I - 0x00AF0B 02:AEFB: 54        .byte $54   ; 
- D 1 - I - 0x00AF0C 02:AEFC: 00        .byte $00   ; 
- D 1 - I - 0x00AF0D 02:AEFD: 00        .byte $00   ; 
- D 1 - I - 0x00AF0E 02:AEFE: 22        .byte $22   ; 
- D 1 - I - 0x00AF0F 02:AEFF: 47        .byte $47   ; 
- D 1 - I - 0x00AF10 02:AF00: 00        .byte $00   ; 
- D 1 - I - 0x00AF11 02:AF01: 00        .byte $00   ; 
- D 1 - I - 0x00AF12 02:AF02: 24        .byte $24   ; 
- D 1 - I - 0x00AF13 02:AF03: 48        .byte $48   ; 
- D 1 - I - 0x00AF14 02:AF04: DF        .byte $DF   ; 
- D 1 - I - 0x00AF15 02:AF05: F7        .byte $F7   ; 
- D 1 - I - 0x00AF16 02:AF06: F7        .byte $F7   ; 
- D 1 - I - 0x00AF17 02:AF07: F7        .byte $F7   ; 
- D 1 - I - 0x00AF18 02:AF08: 22        .byte $22   ; 
- D 1 - I - 0x00AF19 02:AF09: 53        .byte $53   ; 
- D 1 - I - 0x00AF1A 02:AF0A: 28        .byte $28   ; 
- D 1 - I - 0x00AF1B 02:AF0B: 00        .byte $00   ; 
- D 1 - I - 0x00AF1C 02:AF0C: 22        .byte $22   ; 
- D 1 - I - 0x00AF1D 02:AF0D: 47        .byte $47   ; 
- D 1 - I - 0x00AF1E 02:AF0E: 00        .byte $00   ; 
- D 1 - I - 0x00AF1F 02:AF0F: 00        .byte $00   ; 
- D 1 - I - 0x00AF20 02:AF10: 24        .byte $24   ; 
- D 1 - I - 0x00AF21 02:AF11: 48        .byte $48   ; 
- D 1 - I - 0x00AF22 02:AF12: 00        .byte $00   ; 
- D 1 - I - 0x00AF23 02:AF13: 00        .byte $00   ; 
- D 1 - I - 0x00AF24 02:AF14: 65        .byte $65   ; 
- D 1 - I - 0x00AF25 02:AF15: 65        .byte $65   ; 
- D 1 - I - 0x00AF26 02:AF16: 65        .byte $65   ; 
- D 1 - I - 0x00AF27 02:AF17: 65        .byte $65   ; 
- D 1 - I - 0x00AF28 02:AF18: 00        .byte $00   ; 
- D 1 - I - 0x00AF29 02:AF19: 00        .byte $00   ; 
- D 1 - I - 0x00AF2A 02:AF1A: 23        .byte $23   ; 
- D 1 - I - 0x00AF2B 02:AF1B: 54        .byte $54   ; 
- D 1 - I - 0x00AF2C 02:AF1C: 00        .byte $00   ; 
- D 1 - I - 0x00AF2D 02:AF1D: 00        .byte $00   ; 
- D 1 - I - 0x00AF2E 02:AF1E: 22        .byte $22   ; 
- D 1 - I - 0x00AF2F 02:AF1F: 47        .byte $47   ; 
- D 1 - I - 0x00AF30 02:AF20: 00        .byte $00   ; 
- D 1 - I - 0x00AF31 02:AF21: 00        .byte $00   ; 
- D 1 - I - 0x00AF32 02:AF22: 24        .byte $24   ; 
- D 1 - I - 0x00AF33 02:AF23: 48        .byte $48   ; 
- D 1 - I - 0x00AF34 02:AF24: 66        .byte $66   ; 
- D 1 - I - 0x00AF35 02:AF25: F7        .byte $F7   ; 
- D 1 - I - 0x00AF36 02:AF26: F7        .byte $F7   ; 
- D 1 - I - 0x00AF37 02:AF27: F7        .byte $F7   ; 
- D 1 - I - 0x00AF38 02:AF28: 22        .byte $22   ; 
- D 1 - I - 0x00AF39 02:AF29: 47        .byte $47   ; 
- D 1 - I - 0x00AF3A 02:AF2A: 27        .byte $27   ; 
- D 1 - I - 0x00AF3B 02:AF2B: 4D        .byte $4D   ; 
- D 1 - I - 0x00AF3C 02:AF2C: 22        .byte $22   ; 
- D 1 - I - 0x00AF3D 02:AF2D: 4C        .byte $4C   ; 
- D 1 - I - 0x00AF3E 02:AF2E: 4D        .byte $4D   ; 
- D 1 - I - 0x00AF3F 02:AF2F: 28        .byte $28   ; 
- - - - - - 0x00AF40 02:AF30: 00        .byte $00   ; 
- - - - - - 0x00AF41 02:AF31: 00        .byte $00   ; 
- - - - - - 0x00AF42 02:AF32: 00        .byte $00   ; 
- - - - - - 0x00AF43 02:AF33: 00        .byte $00   ; 
- - - - - - 0x00AF44 02:AF34: 00        .byte $00   ; 
- - - - - - 0x00AF45 02:AF35: 00        .byte $00   ; 
- - - - - - 0x00AF46 02:AF36: 00        .byte $00   ; 
- - - - - - 0x00AF47 02:AF37: 00        .byte $00   ; 
- D 1 - I - 0x00AF48 02:AF38: 2B        .byte $2B   ; 
- D 1 - I - 0x00AF49 02:AF39: 4A        .byte $4A   ; 
- D 1 - I - 0x00AF4A 02:AF3A: 26        .byte $26   ; 
- D 1 - I - 0x00AF4B 02:AF3B: 47        .byte $47   ; 
- D 1 - I - 0x00AF4C 02:AF3C: 00        .byte $00   ; 
- D 1 - I - 0x00AF4D 02:AF3D: 25        .byte $25   ; 
- D 1 - I - 0x00AF4E 02:AF3E: 4A        .byte $4A   ; 
- D 1 - I - 0x00AF4F 02:AF3F: 4B        .byte $4B   ; 
- - - - - - 0x00AF50 02:AF40: 00        .byte $00   ; 
- - - - - - 0x00AF51 02:AF41: 00        .byte $00   ; 
- - - - - - 0x00AF52 02:AF42: 00        .byte $00   ; 
- - - - - - 0x00AF53 02:AF43: 00        .byte $00   ; 
- - - - - - 0x00AF54 02:AF44: 00        .byte $00   ; 
- - - - - - 0x00AF55 02:AF45: 00        .byte $00   ; 
- - - - - - 0x00AF56 02:AF46: 00        .byte $00   ; 
- - - - - - 0x00AF57 02:AF47: 00        .byte $00   ; 
- D 1 - I - 0x00AF58 02:AF48: 23        .byte $23   ; 
- D 1 - I - 0x00AF59 02:AF49: 51        .byte $51   ; 
- D 1 - I - 0x00AF5A 02:AF4A: 2C        .byte $2C   ; 
- D 1 - I - 0x00AF5B 02:AF4B: 00        .byte $00   ; 
- D 1 - I - 0x00AF5C 02:AF4C: 22        .byte $22   ; 
- D 1 - I - 0x00AF5D 02:AF4D: 49        .byte $49   ; 
- D 1 - I - 0x00AF5E 02:AF4E: 4A        .byte $4A   ; 
- D 1 - I - 0x00AF5F 02:AF4F: 2C        .byte $2C   ; 
- D 1 - I - 0x00AF60 02:AF50: 22        .byte $22   ; 
- D 1 - I - 0x00AF61 02:AF51: 47        .byte $47   ; 
- D 1 - I - 0x00AF62 02:AF52: 25        .byte $25   ; 
- D 1 - I - 0x00AF63 02:AF53: 4A        .byte $4A   ; 
- D 1 - I - 0x00AF64 02:AF54: 22        .byte $22   ; 
- D 1 - I - 0x00AF65 02:AF55: 47        .byte $47   ; 
- D 1 - I - 0x00AF66 02:AF56: 00        .byte $00   ; 
- D 1 - I - 0x00AF67 02:AF57: 4F        .byte $4F   ; 
- D 1 - I - 0x00AF68 02:AF58: 00        .byte $00   ; 
- D 1 - I - 0x00AF69 02:AF59: 00        .byte $00   ; 
- D 1 - I - 0x00AF6A 02:AF5A: 2D        .byte $2D   ; 
- D 1 - I - 0x00AF6B 02:AF5B: 52        .byte $52   ; 
- D 1 - I - 0x00AF6C 02:AF5C: 00        .byte $00   ; 
- D 1 - I - 0x00AF6D 02:AF5D: 27        .byte $27   ; 
- D 1 - I - 0x00AF6E 02:AF5E: 4D        .byte $4D   ; 
- D 1 - I - 0x00AF6F 02:AF5F: 4E        .byte $4E   ; 
- D 1 - I - 0x00AF70 02:AF60: 2A        .byte $2A   ; 
- D 1 - I - 0x00AF71 02:AF61: 4D        .byte $4D   ; 
- D 1 - I - 0x00AF72 02:AF62: 29        .byte $29   ; 
- D 1 - I - 0x00AF73 02:AF63: 47        .byte $47   ; 
- D 1 - I - 0x00AF74 02:AF64: 00        .byte $00   ; 
- D 1 - I - 0x00AF75 02:AF65: 50        .byte $50   ; 
- D 1 - I - 0x00AF76 02:AF66: 22        .byte $22   ; 
- D 1 - I - 0x00AF77 02:AF67: 47        .byte $47   ; 
- D 1 - I - 0x00AF78 02:AF68: 00        .byte $00   ; 
- D 1 - I - 0x00AF79 02:AF69: 00        .byte $00   ; 
- D 1 - I - 0x00AF7A 02:AF6A: 00        .byte $00   ; 
- D 1 - I - 0x00AF7B 02:AF6B: 00        .byte $00   ; 
- D 1 - I - 0x00AF7C 02:AF6C: 00        .byte $00   ; 
- D 1 - I - 0x00AF7D 02:AF6D: 00        .byte $00   ; 
- D 1 - I - 0x00AF7E 02:AF6E: 00        .byte $00   ; 
- D 1 - I - 0x00AF7F 02:AF6F: 00        .byte $00   ; 
- D 1 - I - 0x00AF80 02:AF70: 00        .byte $00   ; 
- D 1 - I - 0x00AF81 02:AF71: 00        .byte $00   ; 
- D 1 - I - 0x00AF82 02:AF72: 00        .byte $00   ; 
- D 1 - I - 0x00AF83 02:AF73: 58        .byte $58   ; 
- D 1 - I - 0x00AF84 02:AF74: 00        .byte $00   ; 
- D 1 - I - 0x00AF85 02:AF75: 00        .byte $00   ; 
- D 1 - I - 0x00AF86 02:AF76: 00        .byte $00   ; 
- D 1 - I - 0x00AF87 02:AF77: 59        .byte $59   ; 
- D 1 - I - 0x00AF88 02:AF78: 15        .byte $15   ; 
- D 1 - I - 0x00AF89 02:AF79: A9        .byte $A9   ; 
- D 1 - I - 0x00AF8A 02:AF7A: 05        .byte $05   ; 
- D 1 - I - 0x00AF8B 02:AF7B: AA        .byte $AA   ; 
- D 1 - I - 0x00AF8C 02:AF7C: 15        .byte $15   ; 
- D 1 - I - 0x00AF8D 02:AF7D: A9        .byte $A9   ; 
- D 1 - I - 0x00AF8E 02:AF7E: AA        .byte $AA   ; 
- D 1 - I - 0x00AF8F 02:AF7F: AA        .byte $AA   ; 
- D 1 - I - 0x00AF90 02:AF80: 2E        .byte $2E   ; 
- D 1 - I - 0x00AF91 02:AF81: 2F        .byte $2F   ; 
- D 1 - I - 0x00AF92 02:AF82: 30        .byte $30   ; 
- D 1 - I - 0x00AF93 02:AF83: 30        .byte $30   ; 
- D 1 - I - 0x00AF94 02:AF84: 9D        .byte $9D   ; 
- D 1 - I - 0x00AF95 02:AF85: 9E        .byte $9E   ; 
- D 1 - I - 0x00AF96 02:AF86: 9E        .byte $9E   ; 
- D 1 - I - 0x00AF97 02:AF87: 9E        .byte $9E   ; 
- D 1 - I - 0x00AF98 02:AF88: 05        .byte $05   ; 
- D 1 - I - 0x00AF99 02:AF89: AA        .byte $AA   ; 
- D 1 - I - 0x00AF9A 02:AF8A: 05        .byte $05   ; 
- D 1 - I - 0x00AF9B 02:AF8B: 9C        .byte $9C   ; 
- D 1 - I - 0x00AF9C 02:AF8C: AA        .byte $AA   ; 
- D 1 - I - 0x00AF9D 02:AF8D: AA        .byte $AA   ; 
- D 1 - I - 0x00AF9E 02:AF8E: AA        .byte $AA   ; 
- D 1 - I - 0x00AF9F 02:AF8F: 9C        .byte $9C   ; 
- D 1 - I - 0x00AFA0 02:AF90: 30        .byte $30   ; 
- D 1 - I - 0x00AFA1 02:AF91: 30        .byte $30   ; 
- D 1 - I - 0x00AFA2 02:AF92: 30        .byte $30   ; 
- D 1 - I - 0x00AFA3 02:AF93: 31        .byte $31   ; 
- D 1 - I - 0x00AFA4 02:AF94: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFA5 02:AF95: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFA6 02:AF96: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFA7 02:AF97: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFA8 02:AF98: 9C        .byte $9C   ; 
- D 1 - I - 0x00AFA9 02:AF99: 00        .byte $00   ; 
- D 1 - I - 0x00AFAA 02:AF9A: 00        .byte $00   ; 
- D 1 - I - 0x00AFAB 02:AF9B: 00        .byte $00   ; 
- D 1 - I - 0x00AFAC 02:AF9C: 9C        .byte $9C   ; 
- D 1 - I - 0x00AFAD 02:AF9D: 00        .byte $00   ; 
- D 1 - I - 0x00AFAE 02:AF9E: 00        .byte $00   ; 
- D 1 - I - 0x00AFAF 02:AF9F: 00        .byte $00   ; 
- D 1 - I - 0x00AFB0 02:AFA0: 31        .byte $31   ; 
- D 1 - I - 0x00AFB1 02:AFA1: 00        .byte $00   ; 
- D 1 - I - 0x00AFB2 02:AFA2: 00        .byte $00   ; 
- D 1 - I - 0x00AFB3 02:AFA3: 00        .byte $00   ; 
- D 1 - I - 0x00AFB4 02:AFA4: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFB5 02:AFA5: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFB6 02:AFA6: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFB7 02:AFA7: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFB8 02:AFA8: 76        .byte $76   ; 
- D 1 - I - 0x00AFB9 02:AFA9: AB        .byte $AB   ; 
- D 1 - I - 0x00AFBA 02:AFAA: 05        .byte $05   ; 
- D 1 - I - 0x00AFBB 02:AFAB: 9C        .byte $9C   ; 
- D 1 - I - 0x00AFBC 02:AFAC: A9        .byte $A9   ; 
- D 1 - I - 0x00AFBD 02:AFAD: AB        .byte $AB   ; 
- D 1 - I - 0x00AFBE 02:AFAE: AA        .byte $AA   ; 
- D 1 - I - 0x00AFBF 02:AFAF: 9C        .byte $9C   ; 
- D 1 - I - 0x00AFC0 02:AFB0: 2F        .byte $2F   ; 
- D 1 - I - 0x00AFC1 02:AFB1: 30        .byte $30   ; 
- D 1 - I - 0x00AFC2 02:AFB2: 30        .byte $30   ; 
- D 1 - I - 0x00AFC3 02:AFB3: 31        .byte $31   ; 
- D 1 - I - 0x00AFC4 02:AFB4: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFC5 02:AFB5: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFC6 02:AFB6: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFC7 02:AFB7: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFC8 02:AFB8: 0F        .byte $0F   ; 
- D 1 - I - 0x00AFC9 02:AFB9: 35        .byte $35   ; 
- D 1 - I - 0x00AFCA 02:AFBA: 10        .byte $10   ; 
- D 1 - I - 0x00AFCB 02:AFBB: 3B        .byte $3B   ; 
- D 1 - I - 0x00AFCC 02:AFBC: 14        .byte $14   ; 
- D 1 - I - 0x00AFCD 02:AFBD: 84        .byte $84   ; 
- D 1 - I - 0x00AFCE 02:AFBE: 82        .byte $82   ; 
- D 1 - I - 0x00AFCF 02:AFBF: 00        .byte $00   ; 
- D 1 - I - 0x00AFD0 02:AFC0: 00        .byte $00   ; 
- D 1 - I - 0x00AFD1 02:AFC1: D8        .byte $D8   ; 
- D 1 - I - 0x00AFD2 02:AFC2: 00        .byte $00   ; 
- D 1 - I - 0x00AFD3 02:AFC3: 00        .byte $00   ; 
- D 1 - I - 0x00AFD4 02:AFC4: 9E        .byte $9E   ; 
- D 1 - I - 0x00AFD5 02:AFC5: E9        .byte $E9   ; 
- D 1 - I - 0x00AFD6 02:AFC6: 00        .byte $00   ; 
- D 1 - I - 0x00AFD7 02:AFC7: 00        .byte $00   ; 
- D 1 - I - 0x00AFD8 02:AFC8: 00        .byte $00   ; 
- D 1 - I - 0x00AFD9 02:AFC9: 55        .byte $55   ; 
- D 1 - I - 0x00AFDA 02:AFCA: 00        .byte $00   ; 
- D 1 - I - 0x00AFDB 02:AFCB: 00        .byte $00   ; 
- D 1 - I - 0x00AFDC 02:AFCC: 15        .byte $15   ; 
- D 1 - I - 0x00AFDD 02:AFCD: A9        .byte $A9   ; 
- D 1 - I - 0x00AFDE 02:AFCE: AA        .byte $AA   ; 
- D 1 - I - 0x00AFDF 02:AFCF: AA        .byte $AA   ; 
- D 1 - I - 0x00AFE0 02:AFD0: 15        .byte $15   ; 
- D 1 - I - 0x00AFE1 02:AFD1: A9        .byte $A9   ; 
- D 1 - I - 0x00AFE2 02:AFD2: 05        .byte $05   ; 
- D 1 - I - 0x00AFE3 02:AFD3: E2        .byte $E2   ; 
- D 1 - I - 0x00AFE4 02:AFD4: 15        .byte $15   ; 
- D 1 - I - 0x00AFE5 02:AFD5: A9        .byte $A9   ; 
- D 1 - I - 0x00AFE6 02:AFD6: AA        .byte $AA   ; 
- D 1 - I - 0x00AFE7 02:AFD7: AA        .byte $AA   ; 
- D 1 - I - 0x00AFE8 02:AFD8: 00        .byte $00   ; 
- D 1 - I - 0x00AFE9 02:AFD9: 55        .byte $55   ; 
- D 1 - I - 0x00AFEA 02:AFDA: 00        .byte $00   ; 
- D 1 - I - 0x00AFEB 02:AFDB: 00        .byte $00   ; 
- D 1 - I - 0x00AFEC 02:AFDC: AA        .byte $AA   ; 
- D 1 - I - 0x00AFED 02:AFDD: 56        .byte $56   ; 
- D 1 - I - 0x00AFEE 02:AFDE: AA        .byte $AA   ; 
- D 1 - I - 0x00AFEF 02:AFDF: 9C        .byte $9C   ; 
- D 1 - I - 0x00AFF0 02:AFE0: 05        .byte $05   ; 
- D 1 - I - 0x00AFF1 02:AFE1: E2        .byte $E2   ; 
- D 1 - I - 0x00AFF2 02:AFE2: 05        .byte $05   ; 
- D 1 - I - 0x00AFF3 02:AFE3: 9C        .byte $9C   ; 
- D 1 - I - 0x00AFF4 02:AFE4: AA        .byte $AA   ; 
- D 1 - I - 0x00AFF5 02:AFE5: AA        .byte $AA   ; 
- D 1 - I - 0x00AFF6 02:AFE6: AA        .byte $AA   ; 
- D 1 - I - 0x00AFF7 02:AFE7: 9C        .byte $9C   ; 
- D 1 - I - 0x00AFF8 02:AFE8: 00        .byte $00   ; 
- D 1 - I - 0x00AFF9 02:AFE9: 55        .byte $55   ; 
- D 1 - I - 0x00AFFA 02:AFEA: 00        .byte $00   ; 
- D 1 - I - 0x00AFFB 02:AFEB: 00        .byte $00   ; 
- D 1 - I - 0x00AFFC 02:AFEC: AA        .byte $AA   ; 
- D 1 - I - 0x00AFFD 02:AFED: 56        .byte $56   ; 
- D 1 - I - 0x00AFFE 02:AFEE: AA        .byte $AA   ; 
- D 1 - I - 0x00AFFF 02:AFEF: AA        .byte $AA   ; 
- D 1 - I - 0x00B000 02:AFF0: 9C        .byte $9C   ; 
- D 1 - I - 0x00B001 02:AFF1: 00        .byte $00   ; 
- D 1 - I - 0x00B002 02:AFF2: 00        .byte $00   ; 
- D 1 - I - 0x00B003 02:AFF3: 00        .byte $00   ; 
- D 1 - I - 0x00B004 02:AFF4: 9C        .byte $9C   ; 
- D 1 - I - 0x00B005 02:AFF5: 00        .byte $00   ; 
- D 1 - I - 0x00B006 02:AFF6: 00        .byte $00   ; 
- D 1 - I - 0x00B007 02:AFF7: 00        .byte $00   ; 
- D 1 - I - 0x00B008 02:AFF8: 00        .byte $00   ; 
- D 1 - I - 0x00B009 02:AFF9: 55        .byte $55   ; 
- D 1 - I - 0x00B00A 02:AFFA: 00        .byte $00   ; 
- D 1 - I - 0x00B00B 02:AFFB: 00        .byte $00   ; 
- D 1 - I - 0x00B00C 02:AFFC: AA        .byte $AA   ; 
- D 1 - I - 0x00B00D 02:AFFD: 56        .byte $56   ; 
- D 1 - I - 0x00B00E 02:AFFE: AA        .byte $AA   ; 
- D 1 - I - 0x00B00F 02:AFFF: 9C        .byte $9C   ; 
- D 1 - I - 0x00B010 02:B000: 76        .byte $76   ; 
- D 1 - I - 0x00B011 02:B001: AB        .byte $AB   ; 
- D 1 - I - 0x00B012 02:B002: 05        .byte $05   ; 
- D 1 - I - 0x00B013 02:B003: 9C        .byte $9C   ; 
- D 1 - I - 0x00B014 02:B004: A9        .byte $A9   ; 
- D 1 - I - 0x00B015 02:B005: AB        .byte $AB   ; 
- D 1 - I - 0x00B016 02:B006: AA        .byte $AA   ; 
- D 1 - I - 0x00B017 02:B007: 9C        .byte $9C   ; 
- D 1 - I - 0x00B018 02:B008: 00        .byte $00   ; 
- D 1 - I - 0x00B019 02:B009: 00        .byte $00   ; 
- D 1 - I - 0x00B01A 02:B00A: 00        .byte $00   ; 
- D 1 - I - 0x00B01B 02:B00B: 00        .byte $00   ; 
- D 1 - I - 0x00B01C 02:B00C: 00        .byte $00   ; 
- D 1 - I - 0x00B01D 02:B00D: 00        .byte $00   ; 
- D 1 - I - 0x00B01E 02:B00E: 00        .byte $00   ; 
- D 1 - I - 0x00B01F 02:B00F: 00        .byte $00   ; 
- D 1 - I - 0x00B020 02:B010: 00        .byte $00   ; 
- D 1 - I - 0x00B021 02:B011: 00        .byte $00   ; 
- D 1 - I - 0x00B022 02:B012: 00        .byte $00   ; 
- D 1 - I - 0x00B023 02:B013: 00        .byte $00   ; 
- D 1 - I - 0x00B024 02:B014: 00        .byte $00   ; 
- D 1 - I - 0x00B025 02:B015: 00        .byte $00   ; 
- D 1 - I - 0x00B026 02:B016: 00        .byte $00   ; 
- D 1 - I - 0x00B027 02:B017: 57        .byte $57   ; 
- D 1 - I - 0x00B028 02:B018: 00        .byte $00   ; 
- D 1 - I - 0x00B029 02:B019: 00        .byte $00   ; 
- D 1 - I - 0x00B02A 02:B01A: 00        .byte $00   ; 
- D 1 - I - 0x00B02B 02:B01B: 00        .byte $00   ; 
- D 1 - I - 0x00B02C 02:B01C: 00        .byte $00   ; 
- D 1 - I - 0x00B02D 02:B01D: 00        .byte $00   ; 
- D 1 - I - 0x00B02E 02:B01E: 00        .byte $00   ; 
- D 1 - I - 0x00B02F 02:B01F: 00        .byte $00   ; 
- D 1 - I - 0x00B030 02:B020: 00        .byte $00   ; 
- D 1 - I - 0x00B031 02:B021: 00        .byte $00   ; 
- D 1 - I - 0x00B032 02:B022: 00        .byte $00   ; 
- D 1 - I - 0x00B033 02:B023: 00        .byte $00   ; 
- D 1 - I - 0x00B034 02:B024: 9D        .byte $9D   ; 
- D 1 - I - 0x00B035 02:B025: 9E        .byte $9E   ; 
- D 1 - I - 0x00B036 02:B026: 9E        .byte $9E   ; 
- D 1 - I - 0x00B037 02:B027: 9E        .byte $9E   ; 
- D 1 - I - 0x00B038 02:B028: 00        .byte $00   ; 
- D 1 - I - 0x00B039 02:B029: 00        .byte $00   ; 
- D 1 - I - 0x00B03A 02:B02A: 00        .byte $00   ; 
- D 1 - I - 0x00B03B 02:B02B: 00        .byte $00   ; 
- D 1 - I - 0x00B03C 02:B02C: 00        .byte $00   ; 
- D 1 - I - 0x00B03D 02:B02D: 00        .byte $00   ; 
- D 1 - I - 0x00B03E 02:B02E: 00        .byte $00   ; 
- D 1 - I - 0x00B03F 02:B02F: 00        .byte $00   ; 
- D 1 - I - 0x00B040 02:B030: 00        .byte $00   ; 
- D 1 - I - 0x00B041 02:B031: 00        .byte $00   ; 
- D 1 - I - 0x00B042 02:B032: 00        .byte $00   ; 
- D 1 - I - 0x00B043 02:B033: 00        .byte $00   ; 
- D 1 - I - 0x00B044 02:B034: 9E        .byte $9E   ; 
- D 1 - I - 0x00B045 02:B035: 9E        .byte $9E   ; 
- D 1 - I - 0x00B046 02:B036: 9E        .byte $9E   ; 
- D 1 - I - 0x00B047 02:B037: 9E        .byte $9E   ; 
- D 1 - I - 0x00B048 02:B038: 00        .byte $00   ; 
- D 1 - I - 0x00B049 02:B039: 00        .byte $00   ; 
- D 1 - I - 0x00B04A 02:B03A: 00        .byte $00   ; 
- D 1 - I - 0x00B04B 02:B03B: 00        .byte $00   ; 
- D 1 - I - 0x00B04C 02:B03C: 00        .byte $00   ; 
- D 1 - I - 0x00B04D 02:B03D: 00        .byte $00   ; 
- D 1 - I - 0x00B04E 02:B03E: 00        .byte $00   ; 
- D 1 - I - 0x00B04F 02:B03F: 00        .byte $00   ; 
- D 1 - I - 0x00B050 02:B040: 00        .byte $00   ; 
- D 1 - I - 0x00B051 02:B041: 00        .byte $00   ; 
- D 1 - I - 0x00B052 02:B042: 00        .byte $00   ; 
- D 1 - I - 0x00B053 02:B043: 00        .byte $00   ; 
- D 1 - I - 0x00B054 02:B044: 9E        .byte $9E   ; 
- D 1 - I - 0x00B055 02:B045: E9        .byte $E9   ; 
- D 1 - I - 0x00B056 02:B046: 00        .byte $00   ; 
- D 1 - I - 0x00B057 02:B047: 00        .byte $00   ; 
- D 1 - I - 0x00B058 02:B048: 22        .byte $22   ; 
- D 1 - I - 0x00B059 02:B049: 47        .byte $47   ; 
- D 1 - I - 0x00B05A 02:B04A: 25        .byte $25   ; 
- D 1 - I - 0x00B05B 02:B04B: 4A        .byte $4A   ; 
- D 1 - I - 0x00B05C 02:B04C: 22        .byte $22   ; 
- D 1 - I - 0x00B05D 02:B04D: 47        .byte $47   ; 
- D 1 - I - 0x00B05E 02:B04E: 00        .byte $00   ; 
- D 1 - I - 0x00B05F 02:B04F: 4F        .byte $4F   ; 
- D 1 - I - 0x00B060 02:B050: 22        .byte $22   ; 
- D 1 - I - 0x00B061 02:B051: 47        .byte $47   ; 
- D 1 - I - 0x00B062 02:B052: 27        .byte $27   ; 
- D 1 - I - 0x00B063 02:B053: 4D        .byte $4D   ; 
- D 1 - I - 0x00B064 02:B054: 22        .byte $22   ; 
- D 1 - I - 0x00B065 02:B055: 4C        .byte $4C   ; 
- D 1 - I - 0x00B066 02:B056: 4D        .byte $4D   ; 
- D 1 - I - 0x00B067 02:B057: 28        .byte $28   ; 
- D 1 - I - 0x00B068 02:B058: 2A        .byte $2A   ; 
- D 1 - I - 0x00B069 02:B059: 4D        .byte $4D   ; 
- D 1 - I - 0x00B06A 02:B05A: 29        .byte $29   ; 
- D 1 - I - 0x00B06B 02:B05B: 47        .byte $47   ; 
- D 1 - I - 0x00B06C 02:B05C: 00        .byte $00   ; 
- D 1 - I - 0x00B06D 02:B05D: 50        .byte $50   ; 
- D 1 - I - 0x00B06E 02:B05E: 22        .byte $22   ; 
- D 1 - I - 0x00B06F 02:B05F: 47        .byte $47   ; 
- D 1 - I - 0x00B070 02:B060: 2B        .byte $2B   ; 
- D 1 - I - 0x00B071 02:B061: 4A        .byte $4A   ; 
- D 1 - I - 0x00B072 02:B062: 26        .byte $26   ; 
- D 1 - I - 0x00B073 02:B063: 47        .byte $47   ; 
- D 1 - I - 0x00B074 02:B064: 00        .byte $00   ; 
- D 1 - I - 0x00B075 02:B065: 25        .byte $25   ; 
- D 1 - I - 0x00B076 02:B066: 4A        .byte $4A   ; 
- D 1 - I - 0x00B077 02:B067: 4B        .byte $4B   ; 
- D 1 - I - 0x00B078 02:B068: 00        .byte $00   ; 
- D 1 - I - 0x00B079 02:B069: 00        .byte $00   ; 
- D 1 - I - 0x00B07A 02:B06A: 00        .byte $00   ; 
- D 1 - I - 0x00B07B 02:B06B: 58        .byte $58   ; 
- D 1 - I - 0x00B07C 02:B06C: 00        .byte $00   ; 
- D 1 - I - 0x00B07D 02:B06D: 00        .byte $00   ; 
- D 1 - I - 0x00B07E 02:B06E: 00        .byte $00   ; 
- D 1 - I - 0x00B07F 02:B06F: 59        .byte $59   ; 
- D 1 - I - 0x00B080 02:B070: 00        .byte $00   ; 
- D 1 - I - 0x00B081 02:B071: 00        .byte $00   ; 
- D 1 - I - 0x00B082 02:B072: 00        .byte $00   ; 
- D 1 - I - 0x00B083 02:B073: 00        .byte $00   ; 
- D 1 - I - 0x00B084 02:B074: 00        .byte $00   ; 
- D 1 - I - 0x00B085 02:B075: 00        .byte $00   ; 
- D 1 - I - 0x00B086 02:B076: 00        .byte $00   ; 
- D 1 - I - 0x00B087 02:B077: 00        .byte $00   ; 
- D 1 - I - 0x00B088 02:B078: 2E        .byte $2E   ; 
- D 1 - I - 0x00B089 02:B079: 2F        .byte $2F   ; 
- D 1 - I - 0x00B08A 02:B07A: 30        .byte $30   ; 
- D 1 - I - 0x00B08B 02:B07B: 30        .byte $30   ; 
- D 1 - I - 0x00B08C 02:B07C: 9D        .byte $9D   ; 
- D 1 - I - 0x00B08D 02:B07D: 9E        .byte $9E   ; 
- D 1 - I - 0x00B08E 02:B07E: 9E        .byte $9E   ; 
- D 1 - I - 0x00B08F 02:B07F: 9E        .byte $9E   ; 
- D 1 - I - 0x00B090 02:B080: 23        .byte $23   ; 
- D 1 - I - 0x00B091 02:B081: 51        .byte $51   ; 
- D 1 - I - 0x00B092 02:B082: 2C        .byte $2C   ; 
- D 1 - I - 0x00B093 02:B083: 00        .byte $00   ; 
- D 1 - I - 0x00B094 02:B084: 22        .byte $22   ; 
- D 1 - I - 0x00B095 02:B085: 49        .byte $49   ; 
- D 1 - I - 0x00B096 02:B086: 4A        .byte $4A   ; 
- D 1 - I - 0x00B097 02:B087: 2C        .byte $2C   ; 
- D 1 - I - 0x00B098 02:B088: 30        .byte $30   ; 
- D 1 - I - 0x00B099 02:B089: 30        .byte $30   ; 
- D 1 - I - 0x00B09A 02:B08A: 30        .byte $30   ; 
- D 1 - I - 0x00B09B 02:B08B: 31        .byte $31   ; 
- D 1 - I - 0x00B09C 02:B08C: 9E        .byte $9E   ; 
- D 1 - I - 0x00B09D 02:B08D: 9E        .byte $9E   ; 
- D 1 - I - 0x00B09E 02:B08E: 9E        .byte $9E   ; 
- D 1 - I - 0x00B09F 02:B08F: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0A0 02:B090: 00        .byte $00   ; 
- D 1 - I - 0x00B0A1 02:B091: 00        .byte $00   ; 
- D 1 - I - 0x00B0A2 02:B092: 2D        .byte $2D   ; 
- D 1 - I - 0x00B0A3 02:B093: 52        .byte $52   ; 
- D 1 - I - 0x00B0A4 02:B094: 00        .byte $00   ; 
- D 1 - I - 0x00B0A5 02:B095: 27        .byte $27   ; 
- D 1 - I - 0x00B0A6 02:B096: 4D        .byte $4D   ; 
- D 1 - I - 0x00B0A7 02:B097: 4E        .byte $4E   ; 
- D 1 - I - 0x00B0A8 02:B098: 30        .byte $30   ; 
- D 1 - I - 0x00B0A9 02:B099: 30        .byte $30   ; 
- D 1 - I - 0x00B0AA 02:B09A: 30        .byte $30   ; 
- D 1 - I - 0x00B0AB 02:B09B: 31        .byte $31   ; 
- D 1 - I - 0x00B0AC 02:B09C: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0AD 02:B09D: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0AE 02:B09E: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0AF 02:B09F: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0B0 02:B0A0: 00        .byte $00   ; 
- D 1 - I - 0x00B0B1 02:B0A1: 00        .byte $00   ; 
- D 1 - I - 0x00B0B2 02:B0A2: 00        .byte $00   ; 
- D 1 - I - 0x00B0B3 02:B0A3: 00        .byte $00   ; 
- D 1 - I - 0x00B0B4 02:B0A4: 00        .byte $00   ; 
- D 1 - I - 0x00B0B5 02:B0A5: 00        .byte $00   ; 
- D 1 - I - 0x00B0B6 02:B0A6: 00        .byte $00   ; 
- D 1 - I - 0x00B0B7 02:B0A7: 00        .byte $00   ; 
- D 1 - I - 0x00B0B8 02:B0A8: 31        .byte $31   ; 
- D 1 - I - 0x00B0B9 02:B0A9: 00        .byte $00   ; 
- D 1 - I - 0x00B0BA 02:B0AA: 00        .byte $00   ; 
- D 1 - I - 0x00B0BB 02:B0AB: 00        .byte $00   ; 
- D 1 - I - 0x00B0BC 02:B0AC: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0BD 02:B0AD: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0BE 02:B0AE: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0BF 02:B0AF: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0C0 02:B0B0: 23        .byte $23   ; 
- D 1 - I - 0x00B0C1 02:B0B1: 51        .byte $51   ; 
- D 1 - I - 0x00B0C2 02:B0B2: 2C        .byte $2C   ; 
- D 1 - I - 0x00B0C3 02:B0B3: 00        .byte $00   ; 
- D 1 - I - 0x00B0C4 02:B0B4: 22        .byte $22   ; 
- D 1 - I - 0x00B0C5 02:B0B5: 49        .byte $49   ; 
- D 1 - I - 0x00B0C6 02:B0B6: 4A        .byte $4A   ; 
- D 1 - I - 0x00B0C7 02:B0B7: 2C        .byte $2C   ; 
- D 1 - I - 0x00B0C8 02:B0B8: 2F        .byte $2F   ; 
- D 1 - I - 0x00B0C9 02:B0B9: 30        .byte $30   ; 
- D 1 - I - 0x00B0CA 02:B0BA: 30        .byte $30   ; 
- D 1 - I - 0x00B0CB 02:B0BB: 31        .byte $31   ; 
- D 1 - I - 0x00B0CC 02:B0BC: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0CD 02:B0BD: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0CE 02:B0BE: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0CF 02:B0BF: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0D0 02:B0C0: 00        .byte $00   ; 
- D 1 - I - 0x00B0D1 02:B0C1: 00        .byte $00   ; 
- D 1 - I - 0x00B0D2 02:B0C2: 2D        .byte $2D   ; 
- D 1 - I - 0x00B0D3 02:B0C3: 52        .byte $52   ; 
- D 1 - I - 0x00B0D4 02:B0C4: 00        .byte $00   ; 
- D 1 - I - 0x00B0D5 02:B0C5: 27        .byte $27   ; 
- D 1 - I - 0x00B0D6 02:B0C6: 4D        .byte $4D   ; 
- D 1 - I - 0x00B0D7 02:B0C7: 4E        .byte $4E   ; 
- D 1 - I - 0x00B0D8 02:B0C8: 00        .byte $00   ; 
- D 1 - I - 0x00B0D9 02:B0C9: D8        .byte $D8   ; 
- D 1 - I - 0x00B0DA 02:B0CA: 00        .byte $00   ; 
- D 1 - I - 0x00B0DB 02:B0CB: 00        .byte $00   ; 
- D 1 - I - 0x00B0DC 02:B0CC: 9E        .byte $9E   ; 
- D 1 - I - 0x00B0DD 02:B0CD: E9        .byte $E9   ; 
- D 1 - I - 0x00B0DE 02:B0CE: 00        .byte $00   ; 
- D 1 - I - 0x00B0DF 02:B0CF: 00        .byte $00   ; 
- D 1 - I - 0x00B0E0 02:B0D0: 00        .byte $00   ; 
- D 1 - I - 0x00B0E1 02:B0D1: 00        .byte $00   ; 
- D 1 - I - 0x00B0E2 02:B0D2: 00        .byte $00   ; 
- D 1 - I - 0x00B0E3 02:B0D3: 00        .byte $00   ; 
- D 1 - I - 0x00B0E4 02:B0D4: 00        .byte $00   ; 
- D 1 - I - 0x00B0E5 02:B0D5: 00        .byte $00   ; 
- D 1 - I - 0x00B0E6 02:B0D6: 00        .byte $00   ; 
- D 1 - I - 0x00B0E7 02:B0D7: 00        .byte $00   ; 
- D 1 - I - 0x00B0E8 02:B0D8: 15        .byte $15   ; 
- D 1 - I - 0x00B0E9 02:B0D9: A9        .byte $A9   ; 
- D 1 - I - 0x00B0EA 02:B0DA: 05        .byte $05   ; 
- D 1 - I - 0x00B0EB 02:B0DB: E2        .byte $E2   ; 
- D 1 - I - 0x00B0EC 02:B0DC: 15        .byte $15   ; 
- D 1 - I - 0x00B0ED 02:B0DD: A9        .byte $A9   ; 
- D 1 - I - 0x00B0EE 02:B0DE: AA        .byte $AA   ; 
- D 1 - I - 0x00B0EF 02:B0DF: AA        .byte $AA   ; 
- D 1 - I - 0x00B0F0 02:B0E0: 15        .byte $15   ; 
- D 1 - I - 0x00B0F1 02:B0E1: C3        .byte $C3   ; 
- D 1 - I - 0x00B0F2 02:B0E2: 05        .byte $05   ; 
- D 1 - I - 0x00B0F3 02:B0E3: AA        .byte $AA   ; 
- D 1 - I - 0x00B0F4 02:B0E4: 15        .byte $15   ; 
- D 1 - I - 0x00B0F5 02:B0E5: A9        .byte $A9   ; 
- D 1 - I - 0x00B0F6 02:B0E6: AA        .byte $AA   ; 
- D 1 - I - 0x00B0F7 02:B0E7: AA        .byte $AA   ; 
- D 1 - I - 0x00B0F8 02:B0E8: 05        .byte $05   ; 
- D 1 - I - 0x00B0F9 02:B0E9: E2        .byte $E2   ; 
- D 1 - I - 0x00B0FA 02:B0EA: 05        .byte $05   ; 
- D 1 - I - 0x00B0FB 02:B0EB: 9C        .byte $9C   ; 
- D 1 - I - 0x00B0FC 02:B0EC: AA        .byte $AA   ; 
- D 1 - I - 0x00B0FD 02:B0ED: AA        .byte $AA   ; 
- D 1 - I - 0x00B0FE 02:B0EE: AA        .byte $AA   ; 
- D 1 - I - 0x00B0FF 02:B0EF: 9C        .byte $9C   ; 
- D 1 - I - 0x00B100 02:B0F0: 05        .byte $05   ; 
- D 1 - I - 0x00B101 02:B0F1: AA        .byte $AA   ; 
- D 1 - I - 0x00B102 02:B0F2: 05        .byte $05   ; 
- D 1 - I - 0x00B103 02:B0F3: 9C        .byte $9C   ; 
- D 1 - I - 0x00B104 02:B0F4: AA        .byte $AA   ; 
- D 1 - I - 0x00B105 02:B0F5: AA        .byte $AA   ; 
- D 1 - I - 0x00B106 02:B0F6: AA        .byte $AA   ; 
- D 1 - I - 0x00B107 02:B0F7: 9C        .byte $9C   ; 
- - - - - - 0x00B108 02:B0F8: 05        .byte $05   ; 
- - - - - - 0x00B109 02:B0F9: E2        .byte $E2   ; 
- - - - - - 0x00B10A 02:B0FA: 05        .byte $05   ; 
- - - - - - 0x00B10B 02:B0FB: 9C        .byte $9C   ; 
- - - - - - 0x00B10C 02:B0FC: AA        .byte $AA   ; 
- - - - - - 0x00B10D 02:B0FD: AA        .byte $AA   ; 
- - - - - - 0x00B10E 02:B0FE: AA        .byte $AA   ; 
- - - - - - 0x00B10F 02:B0FF: 9C        .byte $9C   ; 
- - - - - - 0x00B110 02:B100: 05        .byte $05   ; 
- - - - - - 0x00B111 02:B101: AA        .byte $AA   ; 
- - - - - - 0x00B112 02:B102: 05        .byte $05   ; 
- - - - - - 0x00B113 02:B103: 9C        .byte $9C   ; 
- - - - - - 0x00B114 02:B104: AA        .byte $AA   ; 
- - - - - - 0x00B115 02:B105: AA        .byte $AA   ; 
- - - - - - 0x00B116 02:B106: AA        .byte $AA   ; 
- - - - - - 0x00B117 02:B107: 9C        .byte $9C   ; 
- D 1 - I - 0x00B118 02:B108: 9C        .byte $9C   ; 
- D 1 - I - 0x00B119 02:B109: 00        .byte $00   ; 
- D 1 - I - 0x00B11A 02:B10A: 00        .byte $00   ; 
- D 1 - I - 0x00B11B 02:B10B: 00        .byte $00   ; 
- D 1 - I - 0x00B11C 02:B10C: 9C        .byte $9C   ; 
- D 1 - I - 0x00B11D 02:B10D: 00        .byte $00   ; 
- D 1 - I - 0x00B11E 02:B10E: 00        .byte $00   ; 
- D 1 - I - 0x00B11F 02:B10F: 00        .byte $00   ; 
- D 1 - I - 0x00B120 02:B110: 9C        .byte $9C   ; 
- D 1 - I - 0x00B121 02:B111: 00        .byte $00   ; 
- D 1 - I - 0x00B122 02:B112: 00        .byte $00   ; 
- D 1 - I - 0x00B123 02:B113: 00        .byte $00   ; 
- D 1 - I - 0x00B124 02:B114: 9C        .byte $9C   ; 
- D 1 - I - 0x00B125 02:B115: 00        .byte $00   ; 
- D 1 - I - 0x00B126 02:B116: 00        .byte $00   ; 
- D 1 - I - 0x00B127 02:B117: 00        .byte $00   ; 
- D 1 - I - 0x00B128 02:B118: 76        .byte $76   ; 
- D 1 - I - 0x00B129 02:B119: AB        .byte $AB   ; 
- D 1 - I - 0x00B12A 02:B11A: 05        .byte $05   ; 
- D 1 - I - 0x00B12B 02:B11B: 9C        .byte $9C   ; 
- D 1 - I - 0x00B12C 02:B11C: A9        .byte $A9   ; 
- D 1 - I - 0x00B12D 02:B11D: AB        .byte $AB   ; 
- D 1 - I - 0x00B12E 02:B11E: AA        .byte $AA   ; 
- D 1 - I - 0x00B12F 02:B11F: 9C        .byte $9C   ; 
- D 1 - I - 0x00B130 02:B120: 76        .byte $76   ; 
- D 1 - I - 0x00B131 02:B121: AB        .byte $AB   ; 
- D 1 - I - 0x00B132 02:B122: 05        .byte $05   ; 
- D 1 - I - 0x00B133 02:B123: 9C        .byte $9C   ; 
- D 1 - I - 0x00B134 02:B124: A9        .byte $A9   ; 
- D 1 - I - 0x00B135 02:B125: AB        .byte $AB   ; 
- D 1 - I - 0x00B136 02:B126: AA        .byte $AA   ; 
- D 1 - I - 0x00B137 02:B127: 9C        .byte $9C   ; 
- D 1 - I - 0x00B138 02:B128: 00        .byte $00   ; 
- D 1 - I - 0x00B139 02:B129: 00        .byte $00   ; 
- D 1 - I - 0x00B13A 02:B12A: 00        .byte $00   ; 
- D 1 - I - 0x00B13B 02:B12B: 57        .byte $57   ; 
- D 1 - I - 0x00B13C 02:B12C: 00        .byte $00   ; 
- D 1 - I - 0x00B13D 02:B12D: 00        .byte $00   ; 
- D 1 - I - 0x00B13E 02:B12E: 00        .byte $00   ; 
- D 1 - I - 0x00B13F 02:B12F: 00        .byte $00   ; 
- D 1 - I - 0x00B140 02:B130: 00        .byte $00   ; 
- D 1 - I - 0x00B141 02:B131: 00        .byte $00   ; 
- D 1 - I - 0x00B142 02:B132: 00        .byte $00   ; 
- D 1 - I - 0x00B143 02:B133: 00        .byte $00   ; 
- D 1 - I - 0x00B144 02:B134: 00        .byte $00   ; 
- D 1 - I - 0x00B145 02:B135: 00        .byte $00   ; 
- D 1 - I - 0x00B146 02:B136: 00        .byte $00   ; 
- D 1 - I - 0x00B147 02:B137: 00        .byte $00   ; 
- D 1 - I - 0x00B148 02:B138: 9D        .byte $9D   ; 
- D 1 - I - 0x00B149 02:B139: 9E        .byte $9E   ; 
- D 1 - I - 0x00B14A 02:B13A: 9E        .byte $9E   ; 
- D 1 - I - 0x00B14B 02:B13B: 9E        .byte $9E   ; 
- D 1 - I - 0x00B14C 02:B13C: 00        .byte $00   ; 
- D 1 - I - 0x00B14D 02:B13D: 55        .byte $55   ; 
- D 1 - I - 0x00B14E 02:B13E: 00        .byte $00   ; 
- D 1 - I - 0x00B14F 02:B13F: 00        .byte $00   ; 
- D 1 - I - 0x00B150 02:B140: 15        .byte $15   ; 
- D 1 - I - 0x00B151 02:B141: A9        .byte $A9   ; 
- D 1 - I - 0x00B152 02:B142: 05        .byte $05   ; 
- D 1 - I - 0x00B153 02:B143: AA        .byte $AA   ; 
- D 1 - I - 0x00B154 02:B144: 15        .byte $15   ; 
- D 1 - I - 0x00B155 02:B145: A9        .byte $A9   ; 
- D 1 - I - 0x00B156 02:B146: AA        .byte $AA   ; 
- D 1 - I - 0x00B157 02:B147: AA        .byte $AA   ; 
- D 1 - I - 0x00B158 02:B148: 9E        .byte $9E   ; 
- D 1 - I - 0x00B159 02:B149: 9E        .byte $9E   ; 
- D 1 - I - 0x00B15A 02:B14A: 9E        .byte $9E   ; 
- D 1 - I - 0x00B15B 02:B14B: 9E        .byte $9E   ; 
- D 1 - I - 0x00B15C 02:B14C: 00        .byte $00   ; 
- D 1 - I - 0x00B15D 02:B14D: 55        .byte $55   ; 
- D 1 - I - 0x00B15E 02:B14E: 00        .byte $00   ; 
- D 1 - I - 0x00B15F 02:B14F: 00        .byte $00   ; 
- D 1 - I - 0x00B160 02:B150: 05        .byte $05   ; 
- D 1 - I - 0x00B161 02:B151: 56        .byte $56   ; 
- D 1 - I - 0x00B162 02:B152: 05        .byte $05   ; 
- D 1 - I - 0x00B163 02:B153: 9C        .byte $9C   ; 
- D 1 - I - 0x00B164 02:B154: AA        .byte $AA   ; 
- D 1 - I - 0x00B165 02:B155: AA        .byte $AA   ; 
- D 1 - I - 0x00B166 02:B156: AA        .byte $AA   ; 
- D 1 - I - 0x00B167 02:B157: 9C        .byte $9C   ; 
- D 1 - I - 0x00B168 02:B158: 9E        .byte $9E   ; 
- D 1 - I - 0x00B169 02:B159: 9E        .byte $9E   ; 
- D 1 - I - 0x00B16A 02:B15A: 9E        .byte $9E   ; 
- D 1 - I - 0x00B16B 02:B15B: 9E        .byte $9E   ; 
- D 1 - I - 0x00B16C 02:B15C: 00        .byte $00   ; 
- D 1 - I - 0x00B16D 02:B15D: 55        .byte $55   ; 
- D 1 - I - 0x00B16E 02:B15E: 00        .byte $00   ; 
- D 1 - I - 0x00B16F 02:B15F: 00        .byte $00   ; 
- D 1 - I - 0x00B170 02:B160: 05        .byte $05   ; 
- D 1 - I - 0x00B171 02:B161: 56        .byte $56   ; 
- D 1 - I - 0x00B172 02:B162: 05        .byte $05   ; 
- D 1 - I - 0x00B173 02:B163: AA        .byte $AA   ; 
- D 1 - I - 0x00B174 02:B164: AA        .byte $AA   ; 
- D 1 - I - 0x00B175 02:B165: AA        .byte $AA   ; 
- D 1 - I - 0x00B176 02:B166: AA        .byte $AA   ; 
- D 1 - I - 0x00B177 02:B167: AA        .byte $AA   ; 
- D 1 - I - 0x00B178 02:B168: 9E        .byte $9E   ; 
- D 1 - I - 0x00B179 02:B169: E9        .byte $E9   ; 
- D 1 - I - 0x00B17A 02:B16A: 00        .byte $00   ; 
- D 1 - I - 0x00B17B 02:B16B: 00        .byte $00   ; 
- D 1 - I - 0x00B17C 02:B16C: 00        .byte $00   ; 
- D 1 - I - 0x00B17D 02:B16D: 00        .byte $00   ; 
- D 1 - I - 0x00B17E 02:B16E: 00        .byte $00   ; 
- D 1 - I - 0x00B17F 02:B16F: 00        .byte $00   ; 
- D 1 - I - 0x00B180 02:B170: 00        .byte $00   ; 
- D 1 - I - 0x00B181 02:B171: 00        .byte $00   ; 
- D 1 - I - 0x00B182 02:B172: 0B        .byte $0B   ; 
- D 1 - I - 0x00B183 02:B173: 0C        .byte $0C   ; 
- D 1 - I - 0x00B184 02:B174: 0F        .byte $0F   ; 
- D 1 - I - 0x00B185 02:B175: 0F        .byte $0F   ; 
- D 1 - I - 0x00B186 02:B176: 35        .byte $35   ; 
- D 1 - I - 0x00B187 02:B177: 3B        .byte $3B   ; 
- D 1 - I - 0x00B188 02:B178: 9E        .byte $9E   ; 
- D 1 - I - 0x00B189 02:B179: E9        .byte $E9   ; 
- D 1 - I - 0x00B18A 02:B17A: 00        .byte $00   ; 
- D 1 - I - 0x00B18B 02:B17B: 00        .byte $00   ; 
- D 1 - I - 0x00B18C 02:B17C: 00        .byte $00   ; 
- D 1 - I - 0x00B18D 02:B17D: 00        .byte $00   ; 
- D 1 - I - 0x00B18E 02:B17E: 00        .byte $00   ; 
- D 1 - I - 0x00B18F 02:B17F: 00        .byte $00   ; 
- D 1 - I - 0x00B190 02:B180: 00        .byte $00   ; 
- D 1 - I - 0x00B191 02:B181: 00        .byte $00   ; 
- D 1 - I - 0x00B192 02:B182: 00        .byte $00   ; 
- D 1 - I - 0x00B193 02:B183: 00        .byte $00   ; 
- D 1 - I - 0x00B194 02:B184: 00        .byte $00   ; 
- D 1 - I - 0x00B195 02:B185: 00        .byte $00   ; 
- D 1 - I - 0x00B196 02:B186: 00        .byte $00   ; 
- D 1 - I - 0x00B197 02:B187: 00        .byte $00   ; 
- D 1 - I - 0x00B198 02:B188: 00        .byte $00   ; 
- D 1 - I - 0x00B199 02:B189: 00        .byte $00   ; 
- D 1 - I - 0x00B19A 02:B18A: 00        .byte $00   ; 
- D 1 - I - 0x00B19B 02:B18B: 00        .byte $00   ; 
- D 1 - I - 0x00B19C 02:B18C: 9F        .byte $9F   ; 
- D 1 - I - 0x00B19D 02:B18D: 00        .byte $00   ; 
- D 1 - I - 0x00B19E 02:B18E: 00        .byte $00   ; 
- D 1 - I - 0x00B19F 02:B18F: 00        .byte $00   ; 
- D 1 - I - 0x00B1A0 02:B190: 1F        .byte $1F   ; 
- D 1 - I - 0x00B1A1 02:B191: 1C        .byte $1C   ; 
- D 1 - I - 0x00B1A2 02:B192: 1D        .byte $1D   ; 
- D 1 - I - 0x00B1A3 02:B193: 1E        .byte $1E   ; 
- D 1 - I - 0x00B1A4 02:B194: 00        .byte $00   ; 
- D 1 - I - 0x00B1A5 02:B195: 00        .byte $00   ; 
- D 1 - I - 0x00B1A6 02:B196: 00        .byte $00   ; 
- D 1 - I - 0x00B1A7 02:B197: 00        .byte $00   ; 
- D 1 - I - 0x00B1A8 02:B198: 00        .byte $00   ; 
- D 1 - I - 0x00B1A9 02:B199: 00        .byte $00   ; 
- D 1 - I - 0x00B1AA 02:B19A: 00        .byte $00   ; 
- D 1 - I - 0x00B1AB 02:B19B: 00        .byte $00   ; 
- D 1 - I - 0x00B1AC 02:B19C: 00        .byte $00   ; 
- D 1 - I - 0x00B1AD 02:B19D: 00        .byte $00   ; 
- D 1 - I - 0x00B1AE 02:B19E: 00        .byte $00   ; 
- D 1 - I - 0x00B1AF 02:B19F: 00        .byte $00   ; 
- D 1 - I - 0x00B1B0 02:B1A0: 00        .byte $00   ; 
- D 1 - I - 0x00B1B1 02:B1A1: 00        .byte $00   ; 
- D 1 - I - 0x00B1B2 02:B1A2: 9F        .byte $9F   ; 
- D 1 - I - 0x00B1B3 02:B1A3: 00        .byte $00   ; 
- D 1 - I - 0x00B1B4 02:B1A4: 00        .byte $00   ; 
- D 1 - I - 0x00B1B5 02:B1A5: 00        .byte $00   ; 
- D 1 - I - 0x00B1B6 02:B1A6: 1F        .byte $1F   ; 
- D 1 - I - 0x00B1B7 02:B1A7: 1C        .byte $1C   ; 
- D 1 - I - 0x00B1B8 02:B1A8: 00        .byte $00   ; 
- D 1 - I - 0x00B1B9 02:B1A9: 00        .byte $00   ; 
- D 1 - I - 0x00B1BA 02:B1AA: 00        .byte $00   ; 
- D 1 - I - 0x00B1BB 02:B1AB: 00        .byte $00   ; 
- D 1 - I - 0x00B1BC 02:B1AC: 00        .byte $00   ; 
- D 1 - I - 0x00B1BD 02:B1AD: 00        .byte $00   ; 
- D 1 - I - 0x00B1BE 02:B1AE: 00        .byte $00   ; 
- D 1 - I - 0x00B1BF 02:B1AF: 00        .byte $00   ; 
- D 1 - I - 0x00B1C0 02:B1B0: 19        .byte $19   ; 
- D 1 - I - 0x00B1C1 02:B1B1: 00        .byte $00   ; 
- D 1 - I - 0x00B1C2 02:B1B2: 00        .byte $00   ; 
- D 1 - I - 0x00B1C3 02:B1B3: 1B        .byte $1B   ; 
- D 1 - I - 0x00B1C4 02:B1B4: 1C        .byte $1C   ; 
- D 1 - I - 0x00B1C5 02:B1B5: 1D        .byte $1D   ; 
- D 1 - I - 0x00B1C6 02:B1B6: 1E        .byte $1E   ; 
- D 1 - I - 0x00B1C7 02:B1B7: 7D        .byte $7D   ; 
- D 1 - I - 0x00B1C8 02:B1B8: 00        .byte $00   ; 
- D 1 - I - 0x00B1C9 02:B1B9: 00        .byte $00   ; 
- D 1 - I - 0x00B1CA 02:B1BA: 00        .byte $00   ; 
- D 1 - I - 0x00B1CB 02:B1BB: 00        .byte $00   ; 
- D 1 - I - 0x00B1CC 02:B1BC: 00        .byte $00   ; 
- D 1 - I - 0x00B1CD 02:B1BD: 00        .byte $00   ; 
- D 1 - I - 0x00B1CE 02:B1BE: 00        .byte $00   ; 
- D 1 - I - 0x00B1CF 02:B1BF: 19        .byte $19   ; 
- D 1 - I - 0x00B1D0 02:B1C0: 9F        .byte $9F   ; 
- D 1 - I - 0x00B1D1 02:B1C1: 00        .byte $00   ; 
- D 1 - I - 0x00B1D2 02:B1C2: 1A        .byte $1A   ; 
- D 1 - I - 0x00B1D3 02:B1C3: 00        .byte $00   ; 
- D 1 - I - 0x00B1D4 02:B1C4: 1F        .byte $1F   ; 
- D 1 - I - 0x00B1D5 02:B1C5: 7E        .byte $7E   ; 
- D 1 - I - 0x00B1D6 02:B1C6: 1E        .byte $1E   ; 
- D 1 - I - 0x00B1D7 02:B1C7: 1C        .byte $1C   ; 
- D 1 - I - 0x00B1D8 02:B1C8: 00        .byte $00   ; 
- D 1 - I - 0x00B1D9 02:B1C9: 00        .byte $00   ; 
- D 1 - I - 0x00B1DA 02:B1CA: 00        .byte $00   ; 
- D 1 - I - 0x00B1DB 02:B1CB: 00        .byte $00   ; 
- D 1 - I - 0x00B1DC 02:B1CC: 00        .byte $00   ; 
- D 1 - I - 0x00B1DD 02:B1CD: 00        .byte $00   ; 
- D 1 - I - 0x00B1DE 02:B1CE: 00        .byte $00   ; 
- D 1 - I - 0x00B1DF 02:B1CF: 00        .byte $00   ; 
- D 1 - I - 0x00B1E0 02:B1D0: 00        .byte $00   ; 
- D 1 - I - 0x00B1E1 02:B1D1: 1A        .byte $1A   ; 
- D 1 - I - 0x00B1E2 02:B1D2: 00        .byte $00   ; 
- D 1 - I - 0x00B1E3 02:B1D3: 7F        .byte $7F   ; 
- D 1 - I - 0x00B1E4 02:B1D4: 1D        .byte $1D   ; 
- D 1 - I - 0x00B1E5 02:B1D5: 7C        .byte $7C   ; 
- D 1 - I - 0x00B1E6 02:B1D6: 1F        .byte $1F   ; 
- D 1 - I - 0x00B1E7 02:B1D7: 1E        .byte $1E   ; 
- D 1 - I - 0x00B1E8 02:B1D8: 00        .byte $00   ; 
- D 1 - I - 0x00B1E9 02:B1D9: 00        .byte $00   ; 
- D 1 - I - 0x00B1EA 02:B1DA: 00        .byte $00   ; 
- D 1 - I - 0x00B1EB 02:B1DB: 00        .byte $00   ; 
- D 1 - I - 0x00B1EC 02:B1DC: 00        .byte $00   ; 
- D 1 - I - 0x00B1ED 02:B1DD: 00        .byte $00   ; 
- D 1 - I - 0x00B1EE 02:B1DE: 00        .byte $00   ; 
- D 1 - I - 0x00B1EF 02:B1DF: 00        .byte $00   ; 
- D 1 - I - 0x00B1F0 02:B1E0: 9F        .byte $9F   ; 
- D 1 - I - 0x00B1F1 02:B1E1: 00        .byte $00   ; 
- D 1 - I - 0x00B1F2 02:B1E2: 00        .byte $00   ; 
- D 1 - I - 0x00B1F3 02:B1E3: 1A        .byte $1A   ; 
- D 1 - I - 0x00B1F4 02:B1E4: 1F        .byte $1F   ; 
- D 1 - I - 0x00B1F5 02:B1E5: 1C        .byte $1C   ; 
- D 1 - I - 0x00B1F6 02:B1E6: 7E        .byte $7E   ; 
- D 1 - I - 0x00B1F7 02:B1E7: 1E        .byte $1E   ; 
- D 1 - I - 0x00B1F8 02:B1E8: 00        .byte $00   ; 
- D 1 - I - 0x00B1F9 02:B1E9: 00        .byte $00   ; 
- D 1 - I - 0x00B1FA 02:B1EA: 00        .byte $00   ; 
- D 1 - I - 0x00B1FB 02:B1EB: 00        .byte $00   ; 
- D 1 - I - 0x00B1FC 02:B1EC: 00        .byte $00   ; 
- D 1 - I - 0x00B1FD 02:B1ED: 00        .byte $00   ; 
- D 1 - I - 0x00B1FE 02:B1EE: 00        .byte $00   ; 
- D 1 - I - 0x00B1FF 02:B1EF: 00        .byte $00   ; 
- D 1 - I - 0x00B200 02:B1F0: 1B        .byte $1B   ; 
- D 1 - I - 0x00B201 02:B1F1: 00        .byte $00   ; 
- D 1 - I - 0x00B202 02:B1F2: 00        .byte $00   ; 
- D 1 - I - 0x00B203 02:B1F3: 00        .byte $00   ; 
- D 1 - I - 0x00B204 02:B1F4: 7D        .byte $7D   ; 
- D 1 - I - 0x00B205 02:B1F5: 00        .byte $00   ; 
- D 1 - I - 0x00B206 02:B1F6: 00        .byte $00   ; 
- D 1 - I - 0x00B207 02:B1F7: 1B        .byte $1B   ; 
- D 1 - I - 0x00B208 02:B1F8: 00        .byte $00   ; 
- D 1 - I - 0x00B209 02:B1F9: 00        .byte $00   ; 
- D 1 - I - 0x00B20A 02:B1FA: 00        .byte $00   ; 
- D 1 - I - 0x00B20B 02:B1FB: 1A        .byte $1A   ; 
- D 1 - I - 0x00B20C 02:B1FC: 1F        .byte $1F   ; 
- D 1 - I - 0x00B20D 02:B1FD: 1C        .byte $1C   ; 
- D 1 - I - 0x00B20E 02:B1FE: 7E        .byte $7E   ; 
- D 1 - I - 0x00B20F 02:B1FF: 1E        .byte $1E   ; 
- D 1 - I - 0x00B210 02:B200: 00        .byte $00   ; 
- D 1 - I - 0x00B211 02:B201: 00        .byte $00   ; 
- D 1 - I - 0x00B212 02:B202: 00        .byte $00   ; 
- D 1 - I - 0x00B213 02:B203: 00        .byte $00   ; 
- D 1 - I - 0x00B214 02:B204: 00        .byte $00   ; 
- D 1 - I - 0x00B215 02:B205: 00        .byte $00   ; 
- D 1 - I - 0x00B216 02:B206: 00        .byte $00   ; 
- D 1 - I - 0x00B217 02:B207: 00        .byte $00   ; 
- D 1 - I - 0x00B218 02:B208: 1B        .byte $1B   ; 
- D 1 - I - 0x00B219 02:B209: 00        .byte $00   ; 
- D 1 - I - 0x00B21A 02:B20A: 00        .byte $00   ; 
- D 1 - I - 0x00B21B 02:B20B: 00        .byte $00   ; 
- D 1 - I - 0x00B21C 02:B20C: 7D        .byte $7D   ; 
- D 1 - I - 0x00B21D 02:B20D: 00        .byte $00   ; 
- D 1 - I - 0x00B21E 02:B20E: 00        .byte $00   ; 
- D 1 - I - 0x00B21F 02:B20F: 1B        .byte $1B   ; 
- D 1 - I - 0x00B220 02:B210: 1F        .byte $1F   ; 
- D 1 - I - 0x00B221 02:B211: 1C        .byte $1C   ; 
- D 1 - I - 0x00B222 02:B212: 1D        .byte $1D   ; 
- D 1 - I - 0x00B223 02:B213: 1E        .byte $1E   ; 
- D 1 - I - 0x00B224 02:B214: 00        .byte $00   ; 
- D 1 - I - 0x00B225 02:B215: 00        .byte $00   ; 
- D 1 - I - 0x00B226 02:B216: 00        .byte $00   ; 
- D 1 - I - 0x00B227 02:B217: 00        .byte $00   ; 
- D 1 - I - 0x00B228 02:B218: 00        .byte $00   ; 
- D 1 - I - 0x00B229 02:B219: 00        .byte $00   ; 
- D 1 - I - 0x00B22A 02:B21A: 00        .byte $00   ; 
- D 1 - I - 0x00B22B 02:B21B: 00        .byte $00   ; 
- D 1 - I - 0x00B22C 02:B21C: 00        .byte $00   ; 
- D 1 - I - 0x00B22D 02:B21D: 00        .byte $00   ; 
- D 1 - I - 0x00B22E 02:B21E: 00        .byte $00   ; 
- D 1 - I - 0x00B22F 02:B21F: 00        .byte $00   ; 
- D 1 - I - 0x00B230 02:B220: 16        .byte $16   ; 
- D 1 - I - 0x00B231 02:B221: 17        .byte $17   ; 
- D 1 - I - 0x00B232 02:B222: 17        .byte $17   ; 
- D 1 - I - 0x00B233 02:B223: 17        .byte $17   ; 
- D 1 - I - 0x00B234 02:B224: 99        .byte $99   ; 
- D 1 - I - 0x00B235 02:B225: 3F        .byte $3F   ; 
- D 1 - I - 0x00B236 02:B226: 3F        .byte $3F   ; 
- D 1 - I - 0x00B237 02:B227: 3F        .byte $3F   ; 
- D 1 - I - 0x00B238 02:B228: 1F        .byte $1F   ; 
- D 1 - I - 0x00B239 02:B229: 1C        .byte $1C   ; 
- D 1 - I - 0x00B23A 02:B22A: 1D        .byte $1D   ; 
- D 1 - I - 0x00B23B 02:B22B: 1E        .byte $1E   ; 
- D 1 - I - 0x00B23C 02:B22C: 00        .byte $00   ; 
- D 1 - I - 0x00B23D 02:B22D: 00        .byte $00   ; 
- D 1 - I - 0x00B23E 02:B22E: 00        .byte $00   ; 
- D 1 - I - 0x00B23F 02:B22F: 00        .byte $00   ; 
- D 1 - I - 0x00B240 02:B230: 00        .byte $00   ; 
- D 1 - I - 0x00B241 02:B231: 00        .byte $00   ; 
- D 1 - I - 0x00B242 02:B232: 00        .byte $00   ; 
- D 1 - I - 0x00B243 02:B233: 00        .byte $00   ; 
- D 1 - I - 0x00B244 02:B234: 00        .byte $00   ; 
- D 1 - I - 0x00B245 02:B235: 00        .byte $00   ; 
- D 1 - I - 0x00B246 02:B236: 00        .byte $00   ; 
- D 1 - I - 0x00B247 02:B237: 00        .byte $00   ; 
- D 1 - I - 0x00B248 02:B238: 00        .byte $00   ; 
- D 1 - I - 0x00B249 02:B239: 00        .byte $00   ; 
- D 1 - I - 0x00B24A 02:B23A: 00        .byte $00   ; 
- D 1 - I - 0x00B24B 02:B23B: 00        .byte $00   ; 
- D 1 - I - 0x00B24C 02:B23C: 00        .byte $00   ; 
- D 1 - I - 0x00B24D 02:B23D: 00        .byte $00   ; 
- D 1 - I - 0x00B24E 02:B23E: 00        .byte $00   ; 
- D 1 - I - 0x00B24F 02:B23F: 00        .byte $00   ; 
- D 1 - I - 0x00B250 02:B240: 00        .byte $00   ; 
- D 1 - I - 0x00B251 02:B241: 00        .byte $00   ; 
- D 1 - I - 0x00B252 02:B242: 00        .byte $00   ; 
- D 1 - I - 0x00B253 02:B243: 00        .byte $00   ; 
- D 1 - I - 0x00B254 02:B244: 00        .byte $00   ; 
- D 1 - I - 0x00B255 02:B245: 0B        .byte $0B   ; 
- D 1 - I - 0x00B256 02:B246: 09        .byte $09   ; 
- D 1 - I - 0x00B257 02:B247: 0A        .byte $0A   ; 
- D 1 - I - 0x00B258 02:B248: 00        .byte $00   ; 
- D 1 - I - 0x00B259 02:B249: 00        .byte $00   ; 
- D 1 - I - 0x00B25A 02:B24A: 91        .byte $91   ; 
- D 1 - I - 0x00B25B 02:B24B: 92        .byte $92   ; 
- D 1 - I - 0x00B25C 02:B24C: 00        .byte $00   ; 
- D 1 - I - 0x00B25D 02:B24D: 00        .byte $00   ; 
- D 1 - I - 0x00B25E 02:B24E: 91        .byte $91   ; 
- D 1 - I - 0x00B25F 02:B24F: 92        .byte $92   ; 
- D 1 - I - 0x00B260 02:B250: 00        .byte $00   ; 
- D 1 - I - 0x00B261 02:B251: 00        .byte $00   ; 
- D 1 - I - 0x00B262 02:B252: 91        .byte $91   ; 
- D 1 - I - 0x00B263 02:B253: 92        .byte $92   ; 
- D 1 - I - 0x00B264 02:B254: 00        .byte $00   ; 
- D 1 - I - 0x00B265 02:B255: 00        .byte $00   ; 
- D 1 - I - 0x00B266 02:B256: 91        .byte $91   ; 
- D 1 - I - 0x00B267 02:B257: 92        .byte $92   ; 
- D 1 - I - 0x00B268 02:B258: 0A        .byte $0A   ; 
- D 1 - I - 0x00B269 02:B259: 09        .byte $09   ; 
- D 1 - I - 0x00B26A 02:B25A: 91        .byte $91   ; 
- D 1 - I - 0x00B26B 02:B25B: 92        .byte $92   ; 
- D 1 - I - 0x00B26C 02:B25C: 33        .byte $33   ; 
- D 1 - I - 0x00B26D 02:B25D: 34        .byte $34   ; 
- D 1 - I - 0x00B26E 02:B25E: 91        .byte $91   ; 
- D 1 - I - 0x00B26F 02:B25F: 92        .byte $92   ; 
- D 1 - I - 0x00B270 02:B260: 14        .byte $14   ; 
- D 1 - I - 0x00B271 02:B261: 39        .byte $39   ; 
- D 1 - I - 0x00B272 02:B262: 91        .byte $91   ; 
- D 1 - I - 0x00B273 02:B263: 92        .byte $92   ; 
- D 1 - I - 0x00B274 02:B264: 00        .byte $00   ; 
- D 1 - I - 0x00B275 02:B265: 81        .byte $81   ; 
- D 1 - I - 0x00B276 02:B266: 91        .byte $91   ; 
- D 1 - I - 0x00B277 02:B267: 92        .byte $92   ; 
- D 1 - I - 0x00B278 02:B268: BD        .byte $BD   ; 
- D 1 - I - 0x00B279 02:B269: D1        .byte $D1   ; 
- D 1 - I - 0x00B27A 02:B26A: D5        .byte $D5   ; 
- D 1 - I - 0x00B27B 02:B26B: D6        .byte $D6   ; 
- D 1 - I - 0x00B27C 02:B26C: D1        .byte $D1   ; 
- D 1 - I - 0x00B27D 02:B26D: D4        .byte $D4   ; 
- D 1 - I - 0x00B27E 02:B26E: BD        .byte $BD   ; 
- D 1 - I - 0x00B27F 02:B26F: BD        .byte $BD   ; 
- D 1 - I - 0x00B280 02:B270: D4        .byte $D4   ; 
- D 1 - I - 0x00B281 02:B271: BD        .byte $BD   ; 
- D 1 - I - 0x00B282 02:B272: BD        .byte $BD   ; 
- D 1 - I - 0x00B283 02:B273: BD        .byte $BD   ; 
- D 1 - I - 0x00B284 02:B274: BD        .byte $BD   ; 
- D 1 - I - 0x00B285 02:B275: BD        .byte $BD   ; 
- D 1 - I - 0x00B286 02:B276: BD        .byte $BD   ; 
- D 1 - I - 0x00B287 02:B277: BD        .byte $BD   ; 
- D 1 - I - 0x00B288 02:B278: D7        .byte $D7   ; 
- D 1 - I - 0x00B289 02:B279: BD        .byte $BD   ; 
- D 1 - I - 0x00B28A 02:B27A: BD        .byte $BD   ; 
- D 1 - I - 0x00B28B 02:B27B: BD        .byte $BD   ; 
- D 1 - I - 0x00B28C 02:B27C: D5        .byte $D5   ; 
- D 1 - I - 0x00B28D 02:B27D: D6        .byte $D6   ; 
- D 1 - I - 0x00B28E 02:B27E: D7        .byte $D7   ; 
- D 1 - I - 0x00B28F 02:B27F: BD        .byte $BD   ; 
- D 1 - I - 0x00B290 02:B280: BD        .byte $BD   ; 
- D 1 - I - 0x00B291 02:B281: BD        .byte $BD   ; 
- D 1 - I - 0x00B292 02:B282: D5        .byte $D5   ; 
- D 1 - I - 0x00B293 02:B283: D6        .byte $D6   ; 
- D 1 - I - 0x00B294 02:B284: BD        .byte $BD   ; 
- D 1 - I - 0x00B295 02:B285: BD        .byte $BD   ; 
- D 1 - I - 0x00B296 02:B286: BD        .byte $BD   ; 
- D 1 - I - 0x00B297 02:B287: BD        .byte $BD   ; 
- D 1 - I - 0x00B298 02:B288: A9        .byte $A9   ; 
- D 1 - I - 0x00B299 02:B289: AA        .byte $AA   ; 
- D 1 - I - 0x00B29A 02:B28A: AA        .byte $AA   ; 
- D 1 - I - 0x00B29B 02:B28B: AA        .byte $AA   ; 
- D 1 - I - 0x00B29C 02:B28C: A9        .byte $A9   ; 
- D 1 - I - 0x00B29D 02:B28D: AA        .byte $AA   ; 
- D 1 - I - 0x00B29E 02:B28E: AA        .byte $AA   ; 
- D 1 - I - 0x00B29F 02:B28F: AA        .byte $AA   ; 
- D 1 - I - 0x00B2A0 02:B290: F1        .byte $F1   ; 
- D 1 - I - 0x00B2A1 02:B291: AA        .byte $AA   ; 
- D 1 - I - 0x00B2A2 02:B292: AA        .byte $AA   ; 
- D 1 - I - 0x00B2A3 02:B293: AA        .byte $AA   ; 
- D 1 - I - 0x00B2A4 02:B294: A8        .byte $A8   ; 
- D 1 - I - 0x00B2A5 02:B295: A1        .byte $A1   ; 
- D 1 - I - 0x00B2A6 02:B296: A1        .byte $A1   ; 
- D 1 - I - 0x00B2A7 02:B297: A1        .byte $A1   ; 
- D 1 - I - 0x00B2A8 02:B298: 00        .byte $00   ; 
- D 1 - I - 0x00B2A9 02:B299: 00        .byte $00   ; 
- D 1 - I - 0x00B2AA 02:B29A: 91        .byte $91   ; 
- D 1 - I - 0x00B2AB 02:B29B: BD        .byte $BD   ; 
- D 1 - I - 0x00B2AC 02:B29C: 00        .byte $00   ; 
- D 1 - I - 0x00B2AD 02:B29D: 00        .byte $00   ; 
- D 1 - I - 0x00B2AE 02:B29E: 91        .byte $91   ; 
- D 1 - I - 0x00B2AF 02:B29F: BD        .byte $BD   ; 
- D 1 - I - 0x00B2B0 02:B2A0: 00        .byte $00   ; 
- D 1 - I - 0x00B2B1 02:B2A1: 00        .byte $00   ; 
- D 1 - I - 0x00B2B2 02:B2A2: 91        .byte $91   ; 
- D 1 - I - 0x00B2B3 02:B2A3: BD        .byte $BD   ; 
- D 1 - I - 0x00B2B4 02:B2A4: 00        .byte $00   ; 
- D 1 - I - 0x00B2B5 02:B2A5: 00        .byte $00   ; 
- D 1 - I - 0x00B2B6 02:B2A6: 91        .byte $91   ; 
- D 1 - I - 0x00B2B7 02:B2A7: BD        .byte $BD   ; 
- D 1 - I - 0x00B2B8 02:B2A8: BD        .byte $BD   ; 
- D 1 - I - 0x00B2B9 02:B2A9: BD        .byte $BD   ; 
- D 1 - I - 0x00B2BA 02:B2AA: BD        .byte $BD   ; 
- D 1 - I - 0x00B2BB 02:B2AB: BD        .byte $BD   ; 
- D 1 - I - 0x00B2BC 02:B2AC: BD        .byte $BD   ; 
- D 1 - I - 0x00B2BD 02:B2AD: BD        .byte $BD   ; 
- D 1 - I - 0x00B2BE 02:B2AE: BD        .byte $BD   ; 
- D 1 - I - 0x00B2BF 02:B2AF: BD        .byte $BD   ; 
- D 1 - I - 0x00B2C0 02:B2B0: BD        .byte $BD   ; 
- D 1 - I - 0x00B2C1 02:B2B1: BD        .byte $BD   ; 
- D 1 - I - 0x00B2C2 02:B2B2: BD        .byte $BD   ; 
- D 1 - I - 0x00B2C3 02:B2B3: BD        .byte $BD   ; 
- D 1 - I - 0x00B2C4 02:B2B4: BD        .byte $BD   ; 
- D 1 - I - 0x00B2C5 02:B2B5: BD        .byte $BD   ; 
- D 1 - I - 0x00B2C6 02:B2B6: BD        .byte $BD   ; 
- D 1 - I - 0x00B2C7 02:B2B7: BD        .byte $BD   ; 
- D 1 - I - 0x00B2C8 02:B2B8: A9        .byte $A9   ; 
- D 1 - I - 0x00B2C9 02:B2B9: AA        .byte $AA   ; 
- D 1 - I - 0x00B2CA 02:B2BA: AA        .byte $AA   ; 
- D 1 - I - 0x00B2CB 02:B2BB: AA        .byte $AA   ; 
- D 1 - I - 0x00B2CC 02:B2BC: A9        .byte $A9   ; 
- D 1 - I - 0x00B2CD 02:B2BD: AA        .byte $AA   ; 
- D 1 - I - 0x00B2CE 02:B2BE: AB        .byte $AB   ; 
- D 1 - I - 0x00B2CF 02:B2BF: AA        .byte $AA   ; 
- D 1 - I - 0x00B2D0 02:B2C0: A9        .byte $A9   ; 
- D 1 - I - 0x00B2D1 02:B2C1: AA        .byte $AA   ; 
- D 1 - I - 0x00B2D2 02:B2C2: AA        .byte $AA   ; 
- D 1 - I - 0x00B2D3 02:B2C3: AA        .byte $AA   ; 
- D 1 - I - 0x00B2D4 02:B2C4: A9        .byte $A9   ; 
- D 1 - I - 0x00B2D5 02:B2C5: AA        .byte $AA   ; 
- D 1 - I - 0x00B2D6 02:B2C6: AB        .byte $AB   ; 
- D 1 - I - 0x00B2D7 02:B2C7: AA        .byte $AA   ; 
- D 1 - I - 0x00B2D8 02:B2C8: C3        .byte $C3   ; 
- D 1 - I - 0x00B2D9 02:B2C9: AA        .byte $AA   ; 
- D 1 - I - 0x00B2DA 02:B2CA: AA        .byte $AA   ; 
- D 1 - I - 0x00B2DB 02:B2CB: AA        .byte $AA   ; 
- D 1 - I - 0x00B2DC 02:B2CC: A9        .byte $A9   ; 
- D 1 - I - 0x00B2DD 02:B2CD: AA        .byte $AA   ; 
- D 1 - I - 0x00B2DE 02:B2CE: AB        .byte $AB   ; 
- D 1 - I - 0x00B2DF 02:B2CF: AA        .byte $AA   ; 
- D 1 - I - 0x00B2E0 02:B2D0: A9        .byte $A9   ; 
- D 1 - I - 0x00B2E1 02:B2D1: AA        .byte $AA   ; 
- D 1 - I - 0x00B2E2 02:B2D2: AA        .byte $AA   ; 
- D 1 - I - 0x00B2E3 02:B2D3: AA        .byte $AA   ; 
- D 1 - I - 0x00B2E4 02:B2D4: A9        .byte $A9   ; 
- D 1 - I - 0x00B2E5 02:B2D5: AA        .byte $AA   ; 
- D 1 - I - 0x00B2E6 02:B2D6: AB        .byte $AB   ; 
- D 1 - I - 0x00B2E7 02:B2D7: AA        .byte $AA   ; 
- D 1 - I - 0x00B2E8 02:B2D8: 95        .byte $95   ; 
- D 1 - I - 0x00B2E9 02:B2D9: BD        .byte $BD   ; 
- D 1 - I - 0x00B2EA 02:B2DA: D2        .byte $D2   ; 
- D 1 - I - 0x00B2EB 02:B2DB: D1        .byte $D1   ; 
- D 1 - I - 0x00B2EC 02:B2DC: 96        .byte $96   ; 
- D 1 - I - 0x00B2ED 02:B2DD: 97        .byte $97   ; 
- D 1 - I - 0x00B2EE 02:B2DE: D1        .byte $D1   ; 
- D 1 - I - 0x00B2EF 02:B2DF: BD        .byte $BD   ; 
- D 1 - I - 0x00B2F0 02:B2E0: 96        .byte $96   ; 
- D 1 - I - 0x00B2F1 02:B2E1: 98        .byte $98   ; 
- D 1 - I - 0x00B2F2 02:B2E2: 97        .byte $97   ; 
- D 1 - I - 0x00B2F3 02:B2E3: BD        .byte $BD   ; 
- D 1 - I - 0x00B2F4 02:B2E4: 96        .byte $96   ; 
- D 1 - I - 0x00B2F5 02:B2E5: C4        .byte $C4   ; 
- D 1 - I - 0x00B2F6 02:B2E6: 98        .byte $98   ; 
- D 1 - I - 0x00B2F7 02:B2E7: 97        .byte $97   ; 
- D 1 - I - 0x00B2F8 02:B2E8: 9A        .byte $9A   ; 
- D 1 - I - 0x00B2F9 02:B2E9: 00        .byte $00   ; 
- D 1 - I - 0x00B2FA 02:B2EA: C4        .byte $C4   ; 
- D 1 - I - 0x00B2FB 02:B2EB: 98        .byte $98   ; 
- D 1 - I - 0x00B2FC 02:B2EC: C9        .byte $C9   ; 
- D 1 - I - 0x00B2FD 02:B2ED: 00        .byte $00   ; 
- D 1 - I - 0x00B2FE 02:B2EE: 00        .byte $00   ; 
- D 1 - I - 0x00B2FF 02:B2EF: 98        .byte $98   ; 
- D 1 - I - 0x00B300 02:B2F0: C9        .byte $C9   ; 
- D 1 - I - 0x00B301 02:B2F1: 00        .byte $00   ; 
- D 1 - I - 0x00B302 02:B2F2: 00        .byte $00   ; 
- D 1 - I - 0x00B303 02:B2F3: C4        .byte $C4   ; 
- D 1 - I - 0x00B304 02:B2F4: C9        .byte $C9   ; 
- D 1 - I - 0x00B305 02:B2F5: 00        .byte $00   ; 
- D 1 - I - 0x00B306 02:B2F6: 00        .byte $00   ; 
- D 1 - I - 0x00B307 02:B2F7: 00        .byte $00   ; 
- D 1 - I - 0x00B308 02:B2F8: C9        .byte $C9   ; 
- D 1 - I - 0x00B309 02:B2F9: 00        .byte $00   ; 
- D 1 - I - 0x00B30A 02:B2FA: 00        .byte $00   ; 
- D 1 - I - 0x00B30B 02:B2FB: 00        .byte $00   ; 
- D 1 - I - 0x00B30C 02:B2FC: C9        .byte $C9   ; 
- D 1 - I - 0x00B30D 02:B2FD: 00        .byte $00   ; 
- D 1 - I - 0x00B30E 02:B2FE: 00        .byte $00   ; 
- D 1 - I - 0x00B30F 02:B2FF: 00        .byte $00   ; 
- D 1 - I - 0x00B310 02:B300: C9        .byte $C9   ; 
- D 1 - I - 0x00B311 02:B301: 00        .byte $00   ; 
- D 1 - I - 0x00B312 02:B302: 00        .byte $00   ; 
- D 1 - I - 0x00B313 02:B303: 00        .byte $00   ; 
- D 1 - I - 0x00B314 02:B304: C7        .byte $C7   ; 
- D 1 - I - 0x00B315 02:B305: C8        .byte $C8   ; 
- D 1 - I - 0x00B316 02:B306: 00        .byte $00   ; 
- D 1 - I - 0x00B317 02:B307: 00        .byte $00   ; 
- D 1 - I - 0x00B318 02:B308: BD        .byte $BD   ; 
- D 1 - I - 0x00B319 02:B309: CA        .byte $CA   ; 
- D 1 - I - 0x00B31A 02:B30A: C1        .byte $C1   ; 
- D 1 - I - 0x00B31B 02:B30B: C5        .byte $C5   ; 
- D 1 - I - 0x00B31C 02:B30C: BD        .byte $BD   ; 
- D 1 - I - 0x00B31D 02:B30D: BD        .byte $BD   ; 
- D 1 - I - 0x00B31E 02:B30E: CA        .byte $CA   ; 
- D 1 - I - 0x00B31F 02:B30F: 96        .byte $96   ; 
- D 1 - I - 0x00B320 02:B310: C0        .byte $C0   ; 
- D 1 - I - 0x00B321 02:B311: C0        .byte $C0   ; 
- D 1 - I - 0x00B322 02:B312: A7        .byte $A7   ; 
- D 1 - I - 0x00B323 02:B313: C6        .byte $C6   ; 
- D 1 - I - 0x00B324 02:B314: B9        .byte $B9   ; 
- D 1 - I - 0x00B325 02:B315: E7        .byte $E7   ; 
- D 1 - I - 0x00B326 02:B316: 9E        .byte $9E   ; 
- D 1 - I - 0x00B327 02:B317: E9        .byte $E9   ; 
- D 1 - I - 0x00B328 02:B318: C2        .byte $C2   ; 
- D 1 - I - 0x00B329 02:B319: D2        .byte $D2   ; 
- D 1 - I - 0x00B32A 02:B31A: BD        .byte $BD   ; 
- D 1 - I - 0x00B32B 02:B31B: D1        .byte $D1   ; 
- D 1 - I - 0x00B32C 02:B31C: C2        .byte $C2   ; 
- D 1 - I - 0x00B32D 02:B31D: D1        .byte $D1   ; 
- D 1 - I - 0x00B32E 02:B31E: D3        .byte $D3   ; 
- D 1 - I - 0x00B32F 02:B31F: BD        .byte $BD   ; 
- D 1 - I - 0x00B330 02:B320: C2        .byte $C2   ; 
- D 1 - I - 0x00B331 02:B321: D4        .byte $D4   ; 
- D 1 - I - 0x00B332 02:B322: BD        .byte $BD   ; 
- D 1 - I - 0x00B333 02:B323: BD        .byte $BD   ; 
- D 1 - I - 0x00B334 02:B324: CE        .byte $CE   ; 
- D 1 - I - 0x00B335 02:B325: D0        .byte $D0   ; 
- D 1 - I - 0x00B336 02:B326: BD        .byte $BD   ; 
- D 1 - I - 0x00B337 02:B327: BD        .byte $BD   ; 
- D 1 - I - 0x00B338 02:B328: 94        .byte $94   ; 
- D 1 - I - 0x00B339 02:B329: CF        .byte $CF   ; 
- D 1 - I - 0x00B33A 02:B32A: D0        .byte $D0   ; 
- D 1 - I - 0x00B33B 02:B32B: BD        .byte $BD   ; 
- D 1 - I - 0x00B33C 02:B32C: 00        .byte $00   ; 
- D 1 - I - 0x00B33D 02:B32D: 93        .byte $93   ; 
- D 1 - I - 0x00B33E 02:B32E: CF        .byte $CF   ; 
- D 1 - I - 0x00B33F 02:B32F: D0        .byte $D0   ; 
- D 1 - I - 0x00B340 02:B330: 00        .byte $00   ; 
- D 1 - I - 0x00B341 02:B331: 94        .byte $94   ; 
- D 1 - I - 0x00B342 02:B332: BD        .byte $BD   ; 
- D 1 - I - 0x00B343 02:B333: CF        .byte $CF   ; 
- D 1 - I - 0x00B344 02:B334: 00        .byte $00   ; 
- D 1 - I - 0x00B345 02:B335: 00        .byte $00   ; 
- D 1 - I - 0x00B346 02:B336: 93        .byte $93   ; 
- D 1 - I - 0x00B347 02:B337: BD        .byte $BD   ; 
- - - - - - 0x00B348 02:B338: 00        .byte $00   ; 
- - - - - - 0x00B349 02:B339: 00        .byte $00   ; 
- - - - - - 0x00B34A 02:B33A: 94        .byte $94   ; 
- - - - - - 0x00B34B 02:B33B: BD        .byte $BD   ; 
- - - - - - 0x00B34C 02:B33C: 00        .byte $00   ; 
- - - - - - 0x00B34D 02:B33D: 00        .byte $00   ; 
- - - - - - 0x00B34E 02:B33E: 00        .byte $00   ; 
- - - - - - 0x00B34F 02:B33F: 93        .byte $93   ; 
- - - - - - 0x00B350 02:B340: 00        .byte $00   ; 
- - - - - - 0x00B351 02:B341: 00        .byte $00   ; 
- - - - - - 0x00B352 02:B342: 00        .byte $00   ; 
- - - - - - 0x00B353 02:B343: 00        .byte $00   ; 
- - - - - - 0x00B354 02:B344: 00        .byte $00   ; 
- - - - - - 0x00B355 02:B345: 00        .byte $00   ; 
- - - - - - 0x00B356 02:B346: 00        .byte $00   ; 
- - - - - - 0x00B357 02:B347: 00        .byte $00   ; 
- D 1 - I - 0x00B358 02:B348: 00        .byte $00   ; 
- D 1 - I - 0x00B359 02:B349: 00        .byte $00   ; 
- D 1 - I - 0x00B35A 02:B34A: 91        .byte $91   ; 
- D 1 - I - 0x00B35B 02:B34B: 92        .byte $92   ; 
- D 1 - I - 0x00B35C 02:B34C: 00        .byte $00   ; 
- D 1 - I - 0x00B35D 02:B34D: 00        .byte $00   ; 
- D 1 - I - 0x00B35E 02:B34E: CB        .byte $CB   ; 
- D 1 - I - 0x00B35F 02:B34F: CC        .byte $CC   ; 
- D 1 - I - 0x00B360 02:B350: 00        .byte $00   ; 
- D 1 - I - 0x00B361 02:B351: 00        .byte $00   ; 
- D 1 - I - 0x00B362 02:B352: 91        .byte $91   ; 
- D 1 - I - 0x00B363 02:B353: CD        .byte $CD   ; 
- D 1 - I - 0x00B364 02:B354: F7        .byte $F7   ; 
- D 1 - I - 0x00B365 02:B355: F7        .byte $F7   ; 
- D 1 - I - 0x00B366 02:B356: F7        .byte $F7   ; 
- D 1 - I - 0x00B367 02:B357: F7        .byte $F7   ; 
- D 1 - I - 0x00B368 02:B358: 09        .byte $09   ; 
- D 1 - I - 0x00B369 02:B359: 32        .byte $32   ; 
- D 1 - I - 0x00B36A 02:B35A: 32        .byte $32   ; 
- D 1 - I - 0x00B36B 02:B35B: 00        .byte $00   ; 
- D 1 - I - 0x00B36C 02:B35C: 33        .byte $33   ; 
- D 1 - I - 0x00B36D 02:B35D: 34        .byte $34   ; 
- D 1 - I - 0x00B36E 02:B35E: 34        .byte $34   ; 
- D 1 - I - 0x00B36F 02:B35F: 0F        .byte $0F   ; 
- D 1 - I - 0x00B370 02:B360: 14        .byte $14   ; 
- D 1 - I - 0x00B371 02:B361: 83        .byte $83   ; 
- D 1 - I - 0x00B372 02:B362: 3A        .byte $3A   ; 
- D 1 - I - 0x00B373 02:B363: 14        .byte $14   ; 
- D 1 - I - 0x00B374 02:B364: 00        .byte $00   ; 
- D 1 - I - 0x00B375 02:B365: 00        .byte $00   ; 
- D 1 - I - 0x00B376 02:B366: 00        .byte $00   ; 
- D 1 - I - 0x00B377 02:B367: 00        .byte $00   ; 
- D 1 - I - 0x00B378 02:B368: 00        .byte $00   ; 
- D 1 - I - 0x00B379 02:B369: 00        .byte $00   ; 
- D 1 - I - 0x00B37A 02:B36A: 00        .byte $00   ; 
- D 1 - I - 0x00B37B 02:B36B: 00        .byte $00   ; 
- D 1 - I - 0x00B37C 02:B36C: 0D        .byte $0D   ; 
- D 1 - I - 0x00B37D 02:B36D: 09        .byte $09   ; 
- D 1 - I - 0x00B37E 02:B36E: 32        .byte $32   ; 
- D 1 - I - 0x00B37F 02:B36F: 00        .byte $00   ; 
- D 1 - I - 0x00B380 02:B370: 12        .byte $12   ; 
- D 1 - I - 0x00B381 02:B371: 36        .byte $36   ; 
- D 1 - I - 0x00B382 02:B372: 0E        .byte $0E   ; 
- D 1 - I - 0x00B383 02:B373: 0D        .byte $0D   ; 
- D 1 - I - 0x00B384 02:B374: 81        .byte $81   ; 
- D 1 - I - 0x00B385 02:B375: 83        .byte $83   ; 
- D 1 - I - 0x00B386 02:B376: 3A        .byte $3A   ; 
- D 1 - I - 0x00B387 02:B377: 36        .byte $36   ; 
- D 1 - I - 0x00B388 02:B378: 00        .byte $00   ; 
- D 1 - I - 0x00B389 02:B379: 00        .byte $00   ; 
- D 1 - I - 0x00B38A 02:B37A: 00        .byte $00   ; 
- D 1 - I - 0x00B38B 02:B37B: 00        .byte $00   ; 
- D 1 - I - 0x00B38C 02:B37C: 00        .byte $00   ; 
- D 1 - I - 0x00B38D 02:B37D: 00        .byte $00   ; 
- D 1 - I - 0x00B38E 02:B37E: 00        .byte $00   ; 
- D 1 - I - 0x00B38F 02:B37F: 00        .byte $00   ; 
- D 1 - I - 0x00B390 02:B380: 32        .byte $32   ; 
- D 1 - I - 0x00B391 02:B381: 00        .byte $00   ; 
- D 1 - I - 0x00B392 02:B382: 00        .byte $00   ; 
- D 1 - I - 0x00B393 02:B383: 00        .byte $00   ; 
- D 1 - I - 0x00B394 02:B384: 0E        .byte $0E   ; 
- D 1 - I - 0x00B395 02:B385: 0D        .byte $0D   ; 
- D 1 - I - 0x00B396 02:B386: 09        .byte $09   ; 
- D 1 - I - 0x00B397 02:B387: 32        .byte $32   ; 
- D 1 - I - 0x00B398 02:B388: C2        .byte $C2   ; 
- D 1 - I - 0x00B399 02:B389: BD        .byte $BD   ; 
- D 1 - I - 0x00B39A 02:B38A: BD        .byte $BD   ; 
- D 1 - I - 0x00B39B 02:B38B: BD        .byte $BD   ; 
- D 1 - I - 0x00B39C 02:B38C: C2        .byte $C2   ; 
- D 1 - I - 0x00B39D 02:B38D: BD        .byte $BD   ; 
- D 1 - I - 0x00B39E 02:B38E: BD        .byte $BD   ; 
- D 1 - I - 0x00B39F 02:B38F: BD        .byte $BD   ; 
- D 1 - I - 0x00B3A0 02:B390: C2        .byte $C2   ; 
- D 1 - I - 0x00B3A1 02:B391: BD        .byte $BD   ; 
- D 1 - I - 0x00B3A2 02:B392: BD        .byte $BD   ; 
- D 1 - I - 0x00B3A3 02:B393: BD        .byte $BD   ; 
- D 1 - I - 0x00B3A4 02:B394: C2        .byte $C2   ; 
- D 1 - I - 0x00B3A5 02:B395: BD        .byte $BD   ; 
- D 1 - I - 0x00B3A6 02:B396: BD        .byte $BD   ; 
- D 1 - I - 0x00B3A7 02:B397: BD        .byte $BD   ; 
- D 1 - I - 0x00B3A8 02:B398: 09        .byte $09   ; 
- D 1 - I - 0x00B3A9 02:B399: 09        .byte $09   ; 
- D 1 - I - 0x00B3AA 02:B39A: 0A        .byte $0A   ; 
- D 1 - I - 0x00B3AB 02:B39B: 09        .byte $09   ; 
- D 1 - I - 0x00B3AC 02:B39C: 33        .byte $33   ; 
- D 1 - I - 0x00B3AD 02:B39D: 34        .byte $34   ; 
- D 1 - I - 0x00B3AE 02:B39E: 33        .byte $33   ; 
- D 1 - I - 0x00B3AF 02:B39F: 34        .byte $34   ; 
- D 1 - I - 0x00B3B0 02:B3A0: 11        .byte $11   ; 
- D 1 - I - 0x00B3B1 02:B3A1: 37        .byte $37   ; 
- D 1 - I - 0x00B3B2 02:B3A2: 11        .byte $11   ; 
- D 1 - I - 0x00B3B3 02:B3A3: 37        .byte $37   ; 
- D 1 - I - 0x00B3B4 02:B3A4: 80        .byte $80   ; 
- D 1 - I - 0x00B3B5 02:B3A5: 83        .byte $83   ; 
- D 1 - I - 0x00B3B6 02:B3A6: 80        .byte $80   ; 
- D 1 - I - 0x00B3B7 02:B3A7: 82        .byte $82   ; 
- D 1 - I - 0x00B3B8 02:B3A8: 0A        .byte $0A   ; 
- D 1 - I - 0x00B3B9 02:B3A9: 09        .byte $09   ; 
- D 1 - I - 0x00B3BA 02:B3AA: 0A        .byte $0A   ; 
- D 1 - I - 0x00B3BB 02:B3AB: 09        .byte $09   ; 
- D 1 - I - 0x00B3BC 02:B3AC: 34        .byte $34   ; 
- D 1 - I - 0x00B3BD 02:B3AD: 33        .byte $33   ; 
- D 1 - I - 0x00B3BE 02:B3AE: 3B        .byte $3B   ; 
- D 1 - I - 0x00B3BF 02:B3AF: 12        .byte $12   ; 
- D 1 - I - 0x00B3C0 02:B3B0: 14        .byte $14   ; 
- D 1 - I - 0x00B3C1 02:B3B1: 82        .byte $82   ; 
- D 1 - I - 0x00B3C2 02:B3B2: 00        .byte $00   ; 
- D 1 - I - 0x00B3C3 02:B3B3: 00        .byte $00   ; 
- D 1 - I - 0x00B3C4 02:B3B4: 00        .byte $00   ; 
- D 1 - I - 0x00B3C5 02:B3B5: 00        .byte $00   ; 
- D 1 - I - 0x00B3C6 02:B3B6: 01        .byte $01   ; 
- D 1 - I - 0x00B3C7 02:B3B7: 5E        .byte $5E   ; 
- D 1 - I - 0x00B3C8 02:B3B8: 3A        .byte $3A   ; 
- D 1 - I - 0x00B3C9 02:B3B9: 14        .byte $14   ; 
- D 1 - I - 0x00B3CA 02:B3BA: 12        .byte $12   ; 
- D 1 - I - 0x00B3CB 02:B3BB: 0E        .byte $0E   ; 
- D 1 - I - 0x00B3CC 02:B3BC: 00        .byte $00   ; 
- D 1 - I - 0x00B3CD 02:B3BD: 00        .byte $00   ; 
- D 1 - I - 0x00B3CE 02:B3BE: 81        .byte $81   ; 
- D 1 - I - 0x00B3CF 02:B3BF: 83        .byte $83   ; 
- D 1 - I - 0x00B3D0 02:B3C0: 17        .byte $17   ; 
- D 1 - I - 0x00B3D1 02:B3C1: 17        .byte $17   ; 
- D 1 - I - 0x00B3D2 02:B3C2: 17        .byte $17   ; 
- D 1 - I - 0x00B3D3 02:B3C3: 3E        .byte $3E   ; 
- D 1 - I - 0x00B3D4 02:B3C4: 3F        .byte $3F   ; 
- D 1 - I - 0x00B3D5 02:B3C5: 3F        .byte $3F   ; 
- D 1 - I - 0x00B3D6 02:B3C6: 3F        .byte $3F   ; 
- D 1 - I - 0x00B3D7 02:B3C7: 3F        .byte $3F   ; 
- D 1 - I - 0x00B3D8 02:B3C8: 0F        .byte $0F   ; 
- D 1 - I - 0x00B3D9 02:B3C9: 0D        .byte $0D   ; 
- D 1 - I - 0x00B3DA 02:B3CA: 0A        .byte $0A   ; 
- D 1 - I - 0x00B3DB 02:B3CB: 09        .byte $09   ; 
- D 1 - I - 0x00B3DC 02:B3CC: 14        .byte $14   ; 
- D 1 - I - 0x00B3DD 02:B3CD: 12        .byte $12   ; 
- D 1 - I - 0x00B3DE 02:B3CE: 36        .byte $36   ; 
- D 1 - I - 0x00B3DF 02:B3CF: 36        .byte $36   ; 
- D 1 - I - 0x00B3E0 02:B3D0: 00        .byte $00   ; 
- D 1 - I - 0x00B3E1 02:B3D1: 81        .byte $81   ; 
- D 1 - I - 0x00B3E2 02:B3D2: 83        .byte $83   ; 
- D 1 - I - 0x00B3E3 02:B3D3: 13        .byte $13   ; 
- D 1 - I - 0x00B3E4 02:B3D4: 00        .byte $00   ; 
- D 1 - I - 0x00B3E5 02:B3D5: 00        .byte $00   ; 
- D 1 - I - 0x00B3E6 02:B3D6: 00        .byte $00   ; 
- D 1 - I - 0x00B3E7 02:B3D7: 00        .byte $00   ; 
- D 1 - I - 0x00B3E8 02:B3D8: E0        .byte $E0   ; 
- D 1 - I - 0x00B3E9 02:B3D9: 88        .byte $88   ; 
- D 1 - I - 0x00B3EA 02:B3DA: 86        .byte $86   ; 
- D 1 - I - 0x00B3EB 02:B3DB: 87        .byte $87   ; 
- D 1 - I - 0x00B3EC 02:B3DC: BE        .byte $BE   ; 
- D 1 - I - 0x00B3ED 02:B3DD: E0        .byte $E0   ; 
- D 1 - I - 0x00B3EE 02:B3DE: 86        .byte $86   ; 
- D 1 - I - 0x00B3EF 02:B3DF: 87        .byte $87   ; 
- D 1 - I - 0x00B3F0 02:B3E0: C0        .byte $C0   ; 
- D 1 - I - 0x00B3F1 02:B3E1: C0        .byte $C0   ; 
- D 1 - I - 0x00B3F2 02:B3E2: C0        .byte $C0   ; 
- D 1 - I - 0x00B3F3 02:B3E3: C0        .byte $C0   ; 
- D 1 - I - 0x00B3F4 02:B3E4: 9D        .byte $9D   ; 
- D 1 - I - 0x00B3F5 02:B3E5: 9E        .byte $9E   ; 
- D 1 - I - 0x00B3F6 02:B3E6: 9E        .byte $9E   ; 
- D 1 - I - 0x00B3F7 02:B3E7: E6        .byte $E6   ; 
- D 1 - I - 0x00B3F8 02:B3E8: E0        .byte $E0   ; 
- D 1 - I - 0x00B3F9 02:B3E9: 88        .byte $88   ; 
- D 1 - I - 0x00B3FA 02:B3EA: 79        .byte $79   ; 
- D 1 - I - 0x00B3FB 02:B3EB: 7A        .byte $7A   ; 
- D 1 - I - 0x00B3FC 02:B3EC: BE        .byte $BE   ; 
- D 1 - I - 0x00B3FD 02:B3ED: E0        .byte $E0   ; 
- D 1 - I - 0x00B3FE 02:B3EE: 86        .byte $86   ; 
- D 1 - I - 0x00B3FF 02:B3EF: 87        .byte $87   ; 
- D 1 - I - 0x00B400 02:B3F0: C0        .byte $C0   ; 
- D 1 - I - 0x00B401 02:B3F1: C0        .byte $C0   ; 
- D 1 - I - 0x00B402 02:B3F2: C0        .byte $C0   ; 
- D 1 - I - 0x00B403 02:B3F3: C0        .byte $C0   ; 
- D 1 - I - 0x00B404 02:B3F4: 9D        .byte $9D   ; 
- D 1 - I - 0x00B405 02:B3F5: 9E        .byte $9E   ; 
- D 1 - I - 0x00B406 02:B3F6: 9E        .byte $9E   ; 
- D 1 - I - 0x00B407 02:B3F7: E6        .byte $E6   ; 
- D 1 - I - 0x00B408 02:B3F8: 00        .byte $00   ; 
- D 1 - I - 0x00B409 02:B3F9: 00        .byte $00   ; 
- D 1 - I - 0x00B40A 02:B3FA: 00        .byte $00   ; 
- D 1 - I - 0x00B40B 02:B3FB: 00        .byte $00   ; 
- D 1 - I - 0x00B40C 02:B3FC: 00        .byte $00   ; 
- D 1 - I - 0x00B40D 02:B3FD: 00        .byte $00   ; 
- D 1 - I - 0x00B40E 02:B3FE: 00        .byte $00   ; 
- D 1 - I - 0x00B40F 02:B3FF: 00        .byte $00   ; 
- D 1 - I - 0x00B410 02:B400: 89        .byte $89   ; 
- D 1 - I - 0x00B411 02:B401: 8A        .byte $8A   ; 
- D 1 - I - 0x00B412 02:B402: 8B        .byte $8B   ; 
- D 1 - I - 0x00B413 02:B403: 8C        .byte $8C   ; 
- D 1 - I - 0x00B414 02:B404: 8D        .byte $8D   ; 
- D 1 - I - 0x00B415 02:B405: 8E        .byte $8E   ; 
- D 1 - I - 0x00B416 02:B406: 8F        .byte $8F   ; 
- D 1 - I - 0x00B417 02:B407: 90        .byte $90   ; 
- D 1 - I - 0x00B418 02:B408: 89        .byte $89   ; 
- D 1 - I - 0x00B419 02:B409: 8A        .byte $8A   ; 
- D 1 - I - 0x00B41A 02:B40A: 8B        .byte $8B   ; 
- D 1 - I - 0x00B41B 02:B40B: 8C        .byte $8C   ; 
- D 1 - I - 0x00B41C 02:B40C: 8D        .byte $8D   ; 
- D 1 - I - 0x00B41D 02:B40D: 8E        .byte $8E   ; 
- D 1 - I - 0x00B41E 02:B40E: 8F        .byte $8F   ; 
- D 1 - I - 0x00B41F 02:B40F: 90        .byte $90   ; 
- D 1 - I - 0x00B420 02:B410: 77        .byte $77   ; 
- D 1 - I - 0x00B421 02:B411: 78        .byte $78   ; 
- D 1 - I - 0x00B422 02:B412: 79        .byte $79   ; 
- D 1 - I - 0x00B423 02:B413: 7A        .byte $7A   ; 
- D 1 - I - 0x00B424 02:B414: 7B        .byte $7B   ; 
- D 1 - I - 0x00B425 02:B415: 85        .byte $85   ; 
- D 1 - I - 0x00B426 02:B416: 86        .byte $86   ; 
- D 1 - I - 0x00B427 02:B417: 87        .byte $87   ; 



_off007_0x00B428_00_area_1:
- D 1 - I - 0x00B428 02:B418: 00        .byte $00   ; 
- D 1 - I - 0x00B429 02:B419: 00        .byte $00   ; 
- D 1 - I - 0x00B42A 02:B41A: 00        .byte $00   ; 
- D 1 - I - 0x00B42B 02:B41B: 00        .byte $00   ; 
- D 1 - I - 0x00B42C 02:B41C: 00        .byte $00   ; 
- D 1 - I - 0x00B42D 02:B41D: 00        .byte $00   ; 
- D 1 - I - 0x00B42E 02:B41E: 00        .byte $00   ; 
- D 1 - I - 0x00B42F 02:B41F: 40        .byte $40   ; 
- D 1 - I - 0x00B430 02:B420: 40        .byte $40   ; 
- D 1 - I - 0x00B431 02:B421: 50        .byte $50   ; 
- D 1 - I - 0x00B432 02:B422: 00        .byte $00   ; 
- D 1 - I - 0x00B433 02:B423: 00        .byte $00   ; 
- D 1 - I - 0x00B434 02:B424: 10        .byte $10   ; 
- D 1 - I - 0x00B435 02:B425: 00        .byte $00   ; 
- D 1 - I - 0x00B436 02:B426: 00        .byte $00   ; 
- D 1 - I - 0x00B437 02:B427: 00        .byte $00   ; 
- D 1 - I - 0x00B438 02:B428: 00        .byte $00   ; 
- D 1 - I - 0x00B439 02:B429: 40        .byte $40   ; 
- D 1 - I - 0x00B43A 02:B42A: 00        .byte $00   ; 
- D 1 - I - 0x00B43B 02:B42B: 00        .byte $00   ; 
- D 1 - I - 0x00B43C 02:B42C: 00        .byte $00   ; 
- D 1 - I - 0x00B43D 02:B42D: 00        .byte $00   ; 
- D 1 - I - 0x00B43E 02:B42E: 00        .byte $00   ; 
- D 1 - I - 0x00B43F 02:B42F: 00        .byte $00   ; 
- D 1 - I - 0x00B440 02:B430: 00        .byte $00   ; 
- D 1 - I - 0x00B441 02:B431: 00        .byte $00   ; 
- D 1 - I - 0x00B442 02:B432: 00        .byte $00   ; 
- D 1 - I - 0x00B443 02:B433: 54        .byte $54   ; 
- D 1 - I - 0x00B444 02:B434: 00        .byte $00   ; 
- D 1 - I - 0x00B445 02:B435: 00        .byte $00   ; 
- D 1 - I - 0x00B446 02:B436: 00        .byte $00   ; 
- D 1 - I - 0x00B447 02:B437: 00        .byte $00   ; 
- D 1 - I - 0x00B448 02:B438: 00        .byte $00   ; 
- D 1 - I - 0x00B449 02:B439: 00        .byte $00   ; 
- - - - - - 0x00B44A 02:B43A: 40        .byte $40   ; 
- D 1 - I - 0x00B44B 02:B43B: 00        .byte $00   ; 
- D 1 - I - 0x00B44C 02:B43C: 04        .byte $04   ; 
- D 1 - I - 0x00B44D 02:B43D: 55        .byte $55   ; 
- D 1 - I - 0x00B44E 02:B43E: 55        .byte $55   ; 
- D 1 - I - 0x00B44F 02:B43F: 11        .byte $11   ; 
- D 1 - I - 0x00B450 02:B440: 40        .byte $40   ; 
- D 1 - I - 0x00B451 02:B441: 11        .byte $11   ; 
- D 1 - I - 0x00B452 02:B442: 00        .byte $00   ; 
- D 1 - I - 0x00B453 02:B443: 05        .byte $05   ; 
- D 1 - I - 0x00B454 02:B444: 00        .byte $00   ; 
- - - - - - 0x00B455 02:B445: 00        .byte $00   ; 
- - - - - - 0x00B456 02:B446: 00        .byte $00   ; 
- D 1 - I - 0x00B457 02:B447: 00        .byte $00   ; 
- D 1 - I - 0x00B458 02:B448: 40        .byte $40   ; 
- D 1 - I - 0x00B459 02:B449: 00        .byte $00   ; 
- D 1 - I - 0x00B45A 02:B44A: 04        .byte $04   ; 
- D 1 - I - 0x00B45B 02:B44B: 04        .byte $04   ; 
- D 1 - I - 0x00B45C 02:B44C: 00        .byte $00   ; 
- - - - - - 0x00B45D 02:B44D: 00        .byte $00   ; 
- D 1 - I - 0x00B45E 02:B44E: 00        .byte $00   ; 
- D 1 - I - 0x00B45F 02:B44F: 00        .byte $00   ; 
- D 1 - I - 0x00B460 02:B450: 00        .byte $00   ; 
- D 1 - I - 0x00B461 02:B451: 00        .byte $00   ; 
- - - - - - 0x00B462 02:B452: 00        .byte $00   ; 
- - - - - - 0x00B463 02:B453: 11        .byte $11   ; 
- - - - - - 0x00B464 02:B454: 00        .byte $00   ; 
- D 1 - I - 0x00B465 02:B455: 40        .byte $40   ; 
- D 1 - I - 0x00B466 02:B456: 00        .byte $00   ; 
- D 1 - I - 0x00B467 02:B457: AA        .byte $AA   ; 
- D 1 - I - 0x00B468 02:B458: AA        .byte $AA   ; 
- D 1 - I - 0x00B469 02:B459: A5        .byte $A5   ; 
- D 1 - I - 0x00B46A 02:B45A: 55        .byte $55   ; 
- D 1 - I - 0x00B46B 02:B45B: 55        .byte $55   ; 
- D 1 - I - 0x00B46C 02:B45C: AA        .byte $AA   ; 
- D 1 - I - 0x00B46D 02:B45D: 66        .byte $66   ; 
- D 1 - I - 0x00B46E 02:B45E: 55        .byte $55   ; 
- D 1 - I - 0x00B46F 02:B45F: 55        .byte $55   ; 
- D 1 - I - 0x00B470 02:B460: AA        .byte $AA   ; 
- D 1 - I - 0x00B471 02:B461: 55        .byte $55   ; 
- D 1 - I - 0x00B472 02:B462: A5        .byte $A5   ; 
- D 1 - I - 0x00B473 02:B463: 65        .byte $65   ; 
- D 1 - I - 0x00B474 02:B464: AA        .byte $AA   ; 
- D 1 - I - 0x00B475 02:B465: AA        .byte $AA   ; 
- D 1 - I - 0x00B476 02:B466: AA        .byte $AA   ; 
- D 1 - I - 0x00B477 02:B467: AA        .byte $AA   ; 
- D 1 - I - 0x00B478 02:B468: 55        .byte $55   ; 
- D 1 - I - 0x00B479 02:B469: AA        .byte $AA   ; 
- D 1 - I - 0x00B47A 02:B46A: AA        .byte $AA   ; 
- D 1 - I - 0x00B47B 02:B46B: AA        .byte $AA   ; 
- D 1 - I - 0x00B47C 02:B46C: 9A        .byte $9A   ; 
- D 1 - I - 0x00B47D 02:B46D: AA        .byte $AA   ; 
- D 1 - I - 0x00B47E 02:B46E: AA        .byte $AA   ; 
- - - - - - 0x00B47F 02:B46F: A8        .byte $A8   ; 
- D 1 - I - 0x00B480 02:B470: A9        .byte $A9   ; 
- D 1 - I - 0x00B481 02:B471: AA        .byte $AA   ; 
- D 1 - I - 0x00B482 02:B472: EA        .byte $EA   ; 
- D 1 - I - 0x00B483 02:B473: AA        .byte $AA   ; 
- D 1 - I - 0x00B484 02:B474: AA        .byte $AA   ; 
- D 1 - I - 0x00B485 02:B475: AA        .byte $AA   ; 
- D 1 - I - 0x00B486 02:B476: AA        .byte $AA   ; 
- D 1 - I - 0x00B487 02:B477: AA        .byte $AA   ; 
- D 1 - I - 0x00B488 02:B478: AA        .byte $AA   ; 
- D 1 - I - 0x00B489 02:B479: AA        .byte $AA   ; 
- D 1 - I - 0x00B48A 02:B47A: AA        .byte $AA   ; 
- D 1 - I - 0x00B48B 02:B47B: AA        .byte $AA   ; 
- D 1 - I - 0x00B48C 02:B47C: AA        .byte $AA   ; 
- D 1 - I - 0x00B48D 02:B47D: AA        .byte $AA   ; 
- D 1 - I - 0x00B48E 02:B47E: AA        .byte $AA   ; 
- D 1 - I - 0x00B48F 02:B47F: AA        .byte $AA   ; 
- D 1 - I - 0x00B490 02:B480: 03        .byte $03   ; 
- D 1 - I - 0x00B491 02:B481: 0C        .byte $0C   ; 
- D 1 - I - 0x00B492 02:B482: 00        .byte $00   ; 
- D 1 - I - 0x00B493 02:B483: 00        .byte $00   ; 
- D 1 - I - 0x00B494 02:B484: 0C        .byte $0C   ; 
- D 1 - I - 0x00B495 02:B485: FF        .byte $FF   ; 
- D 1 - I - 0x00B496 02:B486: FF        .byte $FF   ; 
- D 1 - I - 0x00B497 02:B487: FF        .byte $FF   ; 
- D 1 - I - 0x00B498 02:B488: FF        .byte $FF   ; 
- D 1 - I - 0x00B499 02:B489: F0        .byte $F0   ; 
- D 1 - I - 0x00B49A 02:B48A: 3F        .byte $3F   ; 
- D 1 - I - 0x00B49B 02:B48B: CF        .byte $CF   ; 
- D 1 - I - 0x00B49C 02:B48C: FF        .byte $FF   ; 
- D 1 - I - 0x00B49D 02:B48D: 0C        .byte $0C   ; 
- D 1 - I - 0x00B49E 02:B48E: 33        .byte $33   ; 
- D 1 - I - 0x00B49F 02:B48F: FF        .byte $FF   ; 
- D 1 - I - 0x00B4A0 02:B490: FF        .byte $FF   ; 
- D 1 - I - 0x00B4A1 02:B491: 03        .byte $03   ; 
- D 1 - I - 0x00B4A2 02:B492: 00        .byte $00   ; 
- D 1 - I - 0x00B4A3 02:B493: 0C        .byte $0C   ; 
- D 1 - I - 0x00B4A4 02:B494: 0F        .byte $0F   ; 
- D 1 - I - 0x00B4A5 02:B495: 03        .byte $03   ; 
- D 1 - I - 0x00B4A6 02:B496: 00        .byte $00   ; 
- D 1 - I - 0x00B4A7 02:B497: 00        .byte $00   ; 
- D 1 - I - 0x00B4A8 02:B498: 0C        .byte $0C   ; 
- D 1 - I - 0x00B4A9 02:B499: AA        .byte $AA   ; 
- D 1 - I - 0x00B4AA 02:B49A: AA        .byte $AA   ; 
- D 1 - I - 0x00B4AB 02:B49B: 0A        .byte $0A   ; 
- D 1 - I - 0x00B4AC 02:B49C: AA        .byte $AA   ; 
- D 1 - I - 0x00B4AD 02:B49D: AA        .byte $AA   ; 
- D 1 - I - 0x00B4AE 02:B49E: AA        .byte $AA   ; 
- D 1 - I - 0x00B4AF 02:B49F: AA        .byte $AA   ; 
- D 1 - I - 0x00B4B0 02:B4A0: AA        .byte $AA   ; 
- D 1 - I - 0x00B4B1 02:B4A1: AA        .byte $AA   ; 
- D 1 - I - 0x00B4B2 02:B4A2: AA        .byte $AA   ; 
- D 1 - I - 0x00B4B3 02:B4A3: AA        .byte $AA   ; 
- D 1 - I - 0x00B4B4 02:B4A4: F8        .byte $F8   ; 
- D 1 - I - 0x00B4B5 02:B4A5: AA        .byte $AA   ; 
- D 1 - I - 0x00B4B6 02:B4A6: 0F        .byte $0F   ; 
- D 1 - I - 0x00B4B7 02:B4A7: 03        .byte $03   ; 
- D 1 - I - 0x00B4B8 02:B4A8: 00        .byte $00   ; 
- D 1 - I - 0x00B4B9 02:B4A9: 00        .byte $00   ; 
- D 1 - I - 0x00B4BA 02:B4AA: F0        .byte $F0   ; 
- D 1 - I - 0x00B4BB 02:B4AB: F0        .byte $F0   ; 
- D 1 - I - 0x00B4BC 02:B4AC: F0        .byte $F0   ; 
- D 1 - I - 0x00B4BD 02:B4AD: F0        .byte $F0   ; 
- D 1 - I - 0x00B4BE 02:B4AE: 00        .byte $00   ; 
- D 1 - I - 0x00B4BF 02:B4AF: 40        .byte $40   ; 
- D 1 - I - 0x00B4C0 02:B4B0: 00        .byte $00   ; 
- D 1 - I - 0x00B4C1 02:B4B1: C0        .byte $C0   ; 
- D 1 - I - 0x00B4C2 02:B4B2: 00        .byte $00   ; 
- D 1 - I - 0x00B4C3 02:B4B3: 00        .byte $00   ; 
- D 1 - I - 0x00B4C4 02:B4B4: 00        .byte $00   ; 
- D 1 - I - 0x00B4C5 02:B4B5: 0F        .byte $0F   ; 
- D 1 - I - 0x00B4C6 02:B4B6: 0F        .byte $0F   ; 
- D 1 - I - 0x00B4C7 02:B4B7: 03        .byte $03   ; 
- D 1 - I - 0x00B4C8 02:B4B8: 0C        .byte $0C   ; 
- D 1 - I - 0x00B4C9 02:B4B9: 0F        .byte $0F   ; 
- D 1 - I - 0x00B4CA 02:B4BA: 0C        .byte $0C   ; 
- D 1 - I - 0x00B4CB 02:B4BB: 0F        .byte $0F   ; 
- D 1 - I - 0x00B4CC 02:B4BC: 0C        .byte $0C   ; 
- D 1 - I - 0x00B4CD 02:B4BD: FF        .byte $FF   ; 
- D 1 - I - 0x00B4CE 02:B4BE: FF        .byte $FF   ; 
- D 1 - I - 0x00B4CF 02:B4BF: FF        .byte $FF   ; 
- D 1 - I - 0x00B4D0 02:B4C0: FF        .byte $FF   ; 
- D 1 - I - 0x00B4D1 02:B4C1: 00        .byte $00   ; 
- D 1 - I - 0x00B4D2 02:B4C2: 00        .byte $00   ; 
- D 1 - I - 0x00B4D3 02:B4C3: 00        .byte $00   ; 
- D 1 - I - 0x00B4D4 02:B4C4: 00        .byte $00   ; 
- D 1 - I - 0x00B4D5 02:B4C5: 00        .byte $00   ; 
- D 1 - I - 0x00B4D6 02:B4C6: 0A        .byte $0A   ; 
- D 1 - I - 0x00B4D7 02:B4C7: 00        .byte $00   ; 
- D 1 - I - 0x00B4D8 02:B4C8: 00        .byte $00   ; 
- D 1 - I - 0x00B4D9 02:B4C9: 00        .byte $00   ; 
- D 1 - I - 0x00B4DA 02:B4CA: 00        .byte $00   ; 
- D 1 - I - 0x00B4DB 02:B4CB: 00        .byte $00   ; 
- D 1 - I - 0x00B4DC 02:B4CC: 00        .byte $00   ; 
- D 1 - I - 0x00B4DD 02:B4CD: 00        .byte $00   ; 
- D 1 - I - 0x00B4DE 02:B4CE: 00        .byte $00   ; 
- D 1 - I - 0x00B4DF 02:B4CF: FF        .byte $FF   ; 
- D 1 - I - 0x00B4E0 02:B4D0: FF        .byte $FF   ; 
- D 1 - I - 0x00B4E1 02:B4D1: 00        .byte $00   ; 
- D 1 - I - 0x00B4E2 02:B4D2: F0        .byte $F0   ; 
- D 1 - I - 0x00B4E3 02:B4D3: F0        .byte $F0   ; 
- D 1 - I - 0x00B4E4 02:B4D4: 00        .byte $00   ; 
- D 1 - I - 0x00B4E5 02:B4D5: F0        .byte $F0   ; 
- D 1 - I - 0x00B4E6 02:B4D6: F0        .byte $F0   ; 
- D 1 - I - 0x00B4E7 02:B4D7: 00        .byte $00   ; 
- D 1 - I - 0x00B4E8 02:B4D8: 00        .byte $00   ; 
- D 1 - I - 0x00B4E9 02:B4D9: 00        .byte $00   ; 
- - - - - - 0x00B4EA 02:B4DA: 00        .byte $00   ; 
- D 1 - I - 0x00B4EB 02:B4DB: 00        .byte $00   ; 
- D 1 - I - 0x00B4EC 02:B4DC: 00        .byte $00   ; 
- D 1 - I - 0x00B4ED 02:B4DD: 00        .byte $00   ; 
- D 1 - I - 0x00B4EE 02:B4DE: 00        .byte $00   ; 
- D 1 - I - 0x00B4EF 02:B4DF: 00        .byte $00   ; 
- D 1 - I - 0x00B4F0 02:B4E0: 00        .byte $00   ; 
- D 1 - I - 0x00B4F1 02:B4E1: A8        .byte $A8   ; 
- D 1 - I - 0x00B4F2 02:B4E2: 00        .byte $00   ; 
- D 1 - I - 0x00B4F3 02:B4E3: AA        .byte $AA   ; 
- D 1 - I - 0x00B4F4 02:B4E4: 80        .byte $80   ; 
- D 1 - I - 0x00B4F5 02:B4E5: A0        .byte $A0   ; 
- D 1 - I - 0x00B4F6 02:B4E6: A8        .byte $A8   ; 
- D 1 - I - 0x00B4F7 02:B4E7: AA        .byte $AA   ; 
- D 1 - I - 0x00B4F8 02:B4E8: A0        .byte $A0   ; 
- D 1 - I - 0x00B4F9 02:B4E9: A0        .byte $A0   ; 
- D 1 - I - 0x00B4FA 02:B4EA: 0A        .byte $0A   ; 
- D 1 - I - 0x00B4FB 02:B4EB: AA        .byte $AA   ; 
- D 1 - I - 0x00B4FC 02:B4EC: F0        .byte $F0   ; 
- D 1 - I - 0x00B4FD 02:B4ED: 0A        .byte $0A   ; 
- D 1 - I - 0x00B4FE 02:B4EE: A0        .byte $A0   ; 
- D 1 - I - 0x00B4FF 02:B4EF: 00        .byte $00   ; 
- D 1 - I - 0x00B500 02:B4F0: 22        .byte $22   ; 
- D 1 - I - 0x00B501 02:B4F1: 00        .byte $00   ; 
- D 1 - I - 0x00B502 02:B4F2: 00        .byte $00   ; 
- D 1 - I - 0x00B503 02:B4F3: 00        .byte $00   ; 
- D 1 - I - 0x00B504 02:B4F4: 00        .byte $00   ; 
- D 1 - I - 0x00B505 02:B4F5: 00        .byte $00   ; 
- D 1 - I - 0x00B506 02:B4F6: 00        .byte $00   ; 
- D 1 - I - 0x00B507 02:B4F7: 00        .byte $00   ; 
- D 1 - I - 0x00B508 02:B4F8: 00        .byte $00   ; 
- D 1 - I - 0x00B509 02:B4F9: 00        .byte $00   ; 
- D 1 - I - 0x00B50A 02:B4FA: 00        .byte $00   ; 
- D 1 - I - 0x00B50B 02:B4FB: 00        .byte $00   ; 
- D 1 - I - 0x00B50C 02:B4FC: 00        .byte $00   ; 
- D 1 - I - 0x00B50D 02:B4FD: 00        .byte $00   ; 
- - - - - - 0x00B50E 02:B4FE: 00        .byte $00   ; 
- D 1 - I - 0x00B50F 02:B4FF: 00        .byte $00   ; 
- D 1 - I - 0x00B510 02:B500: AA        .byte $AA   ; 
- D 1 - I - 0x00B511 02:B501: AA        .byte $AA   ; 
- D 1 - I - 0x00B512 02:B502: A0        .byte $A0   ; 
- D 1 - I - 0x00B513 02:B503: 00        .byte $00   ; 
- D 1 - I - 0x00B514 02:B504: AA        .byte $AA   ; 
- D 1 - I - 0x00B515 02:B505: 2A        .byte $2A   ; 
- D 1 - I - 0x00B516 02:B506: FA        .byte $FA   ; 
- D 1 - I - 0x00B517 02:B507: AA        .byte $AA   ; 
- D 1 - I - 0x00B518 02:B508: 00        .byte $00   ; 
- D 1 - I - 0x00B519 02:B509: 00        .byte $00   ; 
- D 1 - I - 0x00B51A 02:B50A: 00        .byte $00   ; 
- D 1 - I - 0x00B51B 02:B50B: 00        .byte $00   ; 
- - - - - - 0x00B51C 02:B50C: 00        .byte $00   ; 
- - - - - - 0x00B51D 02:B50D: 00        .byte $00   ; 
- - - - - - 0x00B51E 02:B50E: 00        .byte $00   ; 
- - - - - - 0x00B51F 02:B50F: 00        .byte $00   ; 
- - - - - - 0x00B520 02:B510: 00        .byte $00   ; 
- - - - - - 0x00B521 02:B511: 00        .byte $00   ; 
- - - - - - 0x00B522 02:B512: 00        .byte $00   ; 
- - - - - - 0x00B523 02:B513: 00        .byte $00   ; 


.out .sprintf("Free bytes in bank 34: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_34b"
- D 1 - - - 0x00C00F 02:BFFF: 35        .byte con_prg_bank + $35   ; 



