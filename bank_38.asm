.segment "BANK_38"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x010010-0x01400F



.export _off001_0x010011_2F_falling_rock
.export _off001_0x0100BD_32_cannon_hidden_5_2
.export _off001_0x010187_33_bullet_cannon_32
.export _off001_0x0101C2_34_flying_rifleman
.export _off001_0x010276_58_spawner_container_normal_mobs
.export _off001_0x01030C_5A_boss_5_skull
.export _off001_0x0103B9_35_boss_5_red_spiked_ball
.export _off001_0x01043B_59_boss_5_body
.export _off001_0x010881_5D_giant_mouth
.export _off001_0x010B24_5E_spawner_giant_mouths
.export _off001_0x010C55_5F_red_skull_head
.export _off001_0x010ED2_24_blue_spider
.export _off001_0x0111B7_60_big_red_spiked_ball
.export _off001_0x0112FC_61_boss_6_big_red_spiked_ball
.export _off001_0x0113B2_70_boss_6_hole
.export _off001_0x0113DA_71_chr_banks_changer
.export _off001_0x011424_65_boss_6_phase_2
.export _off001_0x011802_68_boss_6_big_bullet
.export _off001_0x011838_64_boss_6_phase_1
.export _off001_0x011B42_66_boss_6_snake
.export _off004_0x011DF1_04_area_5
.export _off005_0x011E32_04_area_5
.export _off006_0x0122D6_04_area_5
.export _off007_0x012C96_04_area_5
.export _off004_0x012D36_05_area_6
.export _off005_0x012D52_05_area_6
.export _off006_0x01306A_05_area_6
.export _off007_0x01399A_05_area_6



; bzk this byte must be placed at 8000
- D 0 - - - 0x010010 04:8000: 38        .byte con_prg_bank + $38   ; 



_off001_0x010011_2F_falling_rock:
- D 0 - I - 0x010011 04:8001: 0B 80     .word ofs_038_2F_800B_01_initialize_object ; 
- D 0 - I - 0x010013 04:8003: 22 80     .word ofs_038_2F_8022_02 ; 
- D 0 - I - 0x010015 04:8005: 9A A2     .word ofs_038_2F_0x0062AA_03 ; 
- D 0 - I - 0x010017 04:8007: FD A2     .word ofs_038_2F_0x00630D_04 ; 
- D 0 - I - 0x010019 04:8009: 3D A3     .word ofs_038_2F_0x00634D_05_delete_object_04 ; 



ofs_038_2F_800B_01_initialize_object:
; area 5 falling rock
; area 8 mouth which shooting red stars
C - - J - - 0x01001B 04:800B: A9 05     LDA #$05
C - - - - - 0x01001D 04:800D: A0 06     LDY #$06
C - - - - - 0x01001F 04:800F: 20 9B AB  JSR sub_0x006BAB_set_dynamic_hp_to_obj
C - - - - - 0x010022 04:8012: A9 03     LDA #$03
C - - - - - 0x010024 04:8014: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x010027 04:8017: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x01002A 04:801A: A0 08     LDY #$08
C - - - - - 0x01002C 04:801C: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x01002F 04:801F: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_2F_8022_02:
C - - J - - 0x010032 04:8022: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x010035 04:8025: 1D BC 06  ORA ram_spd_X_lo_obj,X
C - - - - - 0x010038 04:8028: F0 0B     BEQ bra_8035
C - - - - - 0x01003A 04:802A: A0 08     LDY #$08
C - - - - - 0x01003C 04:802C: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x01003F 04:802F: 30 01     BMI bra_8032
C - - - - - 0x010041 04:8031: C8        INY
bra_8032:
C - - - - - 0x010042 04:8032: 20 FD AB  JSR sub_0x006C0D
bra_8035:
C - - - - - 0x010045 04:8035: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x010048 04:8038: 85 17     STA ram_0017
C - - - - - 0x01004A 04:803A: A9 10     LDA #$10
C - - - - - 0x01004C 04:803C: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x01004F 04:803F: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x010052 04:8042: F0 0F     BEQ bra_8053
C - - - - - 0x010054 04:8044: 20 3D A8  JSR sub_0x00684D
C - - - - - 0x010057 04:8047: A5 17     LDA ram_0017
C - - - - - 0x010059 04:8049: D0 08     BNE bra_8053
C - - - - - 0x01005B 04:804B: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x01005E 04:804E: F0 03     BEQ bra_8053
C - - - - - 0x010060 04:8050: 20 D3 A7  JSR sub_0x0067E3_clear_spd_X
bra_8053:
C - - - - - 0x010063 04:8053: BD A0 06  LDA ram_spd_Y_lo_obj,X
C - - - - - 0x010066 04:8056: 18        CLC
C - - - - - 0x010067 04:8057: 69 20     ADC #< $0020
C - - - - - 0x010069 04:8059: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x01006C 04:805C: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x01006F 04:805F: 69 00     ADC #> $0020
C - - - - - 0x010071 04:8061: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x010074 04:8064: BC 22 05  LDY ram_pos_Y_hi_enemy,X
C - - - - - 0x010077 04:8067: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x01007A 04:806A: 0A        ASL
C - - - - - 0x01007B 04:806B: A9 10     LDA #$10
C - - - - - 0x01007D 04:806D: 90 02     BCC bra_8071
C - - - - - 0x01007F 04:806F: A9 F0     LDA #$F0
bra_8071:
C - - - - - 0x010081 04:8071: 18        CLC
C - - - - - 0x010082 04:8072: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x010085 04:8075: 20 AA BA  JSR sub_0x007ABA_calculate_surface_type
C - - - - - 0x010088 04:8078: C9 02     CMP #$02
C - - - - - 0x01008A 04:807A: D0 03     BNE bra_807F
- - - - - - 0x01008C 04:807C: 20 D3 A7  JSR sub_0x0067E3_clear_spd_X
bra_807F:
C - - - - - 0x01008F 04:807F: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x010092 04:8082: F0 22     BEQ bra_80A6
C - - - - - 0x010094 04:8084: C9 06     CMP #$06
C - - - - - 0x010096 04:8086: 90 1B     BCC bra_80A3
C - - - - - 0x010098 04:8088: A0 00     LDY #$00
C - - - - - 0x01009A 04:808A: C9 09     CMP #$09
C - - - - - 0x01009C 04:808C: 90 02     BCC bra_8090
C - - - - - 0x01009E 04:808E: A0 02     LDY #$02
bra_8090:
C - - - - - 0x0100A0 04:8090: BD BC 06  LDA ram_spd_X_lo_obj,X
C - - - - - 0x0100A3 04:8093: 18        CLC
C - - - - - 0x0100A4 04:8094: 79 A9 80  ADC tbl_80A9_spd_X,Y
C - - - - - 0x0100A7 04:8097: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x0100AA 04:809A: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x0100AD 04:809D: 79 AA 80  ADC tbl_80A9_spd_X + $01,Y
C - - - - - 0x0100B0 04:80A0: 9D CA 06  STA ram_spd_X_hi_obj,X
bra_80A3:
C - - - - - 0x0100B3 04:80A3: 20 CA A7  JSR sub_0x0067DA_clear_spd_Y
bra_80A6:
C - - - - - 0x0100B6 04:80A6: 4C D3 A6  JMP loc_0x0066E3



tbl_80A9_spd_X:
- D 0 - - - 0x0100B9 04:80A9: FD FF     .word $FFFD ; 00 
- D 0 - - - 0x0100BB 04:80AB: 03 00     .word $0003 ; 01 



_off001_0x0100BD_32_cannon_hidden_5_2:
- D 0 - I - 0x0100BD 04:80AD: BB 80     .word ofs_038_32_80BB_01_initialize_object ; 
- D 0 - I - 0x0100BF 04:80AF: E2 80     .word ofs_038_32_80E2_02 ; 
- D 0 - I - 0x0100C1 04:80B1: F6 80     .word ofs_038_32_80F6_03 ; 
- D 0 - I - 0x0100C3 04:80B3: 1F 81     .word ofs_038_32_811F_04 ; 
- D 0 - I - 0x0100C5 04:80B5: 52 81     .word ofs_038_32_8152_05 ; 
- D 0 - I - 0x0100C7 04:80B7: FD A2     .word ofs_038_32_0x00630D_06 ; 
- D 0 - I - 0x0100C9 04:80B9: 3D A3     .word ofs_038_32_0x00634D_07_delete_object_04 ; 



ofs_038_32_80BB_01_initialize_object:
C - - J - - 0x0100CB 04:80BB: A9 81     LDA #$81
C - - - - - 0x0100CD 04:80BD: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0100D0 04:80C0: A9 08     LDA #$08
C - - - - - 0x0100D2 04:80C2: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x0100D5 04:80C5: A9 01     LDA #$01
C - - - - - 0x0100D7 04:80C7: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x0100DA 04:80CA: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0100DD 04:80CD: 38        SEC
C - - - - - 0x0100DE 04:80CE: E9 08     SBC #$08
C - - - - - 0x0100E0 04:80D0: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0100E3 04:80D3: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0100E6 04:80D6: 38        SEC
C - - - - - 0x0100E7 04:80D7: E9 20     SBC #$20
C - - - - - 0x0100E9 04:80D9: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0100EC 04:80DC: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0100EF 04:80DF: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_32_80E2_02:
C - - J - - 0x0100F2 04:80E2: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0100F5 04:80E5: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0100F8 04:80E8: C9 F0     CMP #$F0
C - - - - - 0x0100FA 04:80EA: B0 32     BCS bra_811E_RTS
C - - - - - 0x0100FC 04:80EC: 20 18 84  JSR sub_8418
C - - - - - 0x0100FF 04:80EF: B0 2D     BCS bra_811E_RTS
C - - - - - 0x010101 04:80F1: A9 01     LDA #$01
C - - - - - 0x010103 04:80F3: 4C E0 A2  JMP loc_0x0062F0



ofs_038_32_80F6_03:
C - - J - - 0x010106 04:80F6: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x010109 04:80F9: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x01010C 04:80FC: D0 20     BNE bra_811E_RTS
C - - - - - 0x01010E 04:80FE: 20 5F 81  JSR sub_815F
C - - - - - 0x010111 04:8101: A9 01     LDA #$01
C - - - - - 0x010113 04:8103: B0 16     BCS bra_811B
C - - - - - 0x010115 04:8105: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x010118 04:8108: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x01011B 04:810B: C9 02     CMP #$02
C - - - - - 0x01011D 04:810D: A9 0C     LDA #$0C
C - - - - - 0x01011F 04:810F: 90 0A     BCC bra_811B
C - - - - - 0x010121 04:8111: A9 01     LDA #$01
C - - - - - 0x010123 04:8113: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x010126 04:8116: A9 30     LDA #$30
C - - - - - 0x010128 04:8118: 4C E0 A2  JMP loc_0x0062F0
bra_811B:
C - - - - - 0x01012B 04:811B: 9D E6 06  STA ram_06E6_obj,X
bra_811E_RTS:
C - - - - - 0x01012E 04:811E: 60        RTS



ofs_038_32_811F_04:
C - - J - - 0x01012F 04:811F: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x010132 04:8122: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x010135 04:8125: C9 20     CMP #$20
C - - - - - 0x010137 04:8127: B0 03     BCS bra_812C
- - - - - - 0x010139 04:8129: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_812C:
C - - - - - 0x01013C 04:812C: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x01013F 04:812F: D0 ED     BNE bra_811E_RTS
C - - - - - 0x010141 04:8131: A9 50     LDA #$50
C - - - - - 0x010143 04:8133: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x010146 04:8136: A0 33     LDY #con_obj_id_33
C - - - - - 0x010148 04:8138: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x01014B 04:813B: 90 E1     BCC bra_811E_RTS
C - - - - - 0x01014D 04:813D: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010150 04:8140: 29 01     AND #$01
C - - - - - 0x010152 04:8142: A8        TAY
C - - - - - 0x010153 04:8143: B9 50 81  LDA tbl_8150,Y
C - - - - - 0x010156 04:8146: A4 11     LDY ram_0011
C - - - - - 0x010158 04:8148: 18        CLC
C - - - - - 0x010159 04:8149: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x01015C 04:814C: 99 3C 05  STA ram_pos_X_hi_enemy,Y
C - - - - - 0x01015F 04:814F: 60        RTS



tbl_8150:
- D 0 - - - 0x010160 04:8150: F4        .byte $F4   ; 00 
- - - - - - 0x010161 04:8151: 0C        .byte $0C   ; 01 



ofs_038_32_8152_05:
C - - J - - 0x010162 04:8152: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x010165 04:8155: A0 02     LDY #$02
C - - - - - 0x010167 04:8157: 20 62 81  JSR sub_8162
C - - - - - 0x01016A 04:815A: B0 C2     BCS bra_811E_RTS
C - - - - - 0x01016C 04:815C: 4C 9A A2  JMP loc_0x0062AA



sub_815F:
C - - - - - 0x01016F 04:815F: BC 10 07  LDY ram_0710_obj,X
sub_8162:
C - - - - - 0x010172 04:8162: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010175 04:8165: 4A        LSR
C - - - - - 0x010176 04:8166: 90 03     BCC bra_816B
- - - - - - 0x010178 04:8168: C8        INY
- - - - - - 0x010179 04:8169: C8        INY
- - - - - - 0x01017A 04:816A: C8        INY
bra_816B:
C - - - - - 0x01017B 04:816B: B9 71 81  LDA tbl_8171,Y
C - - - - - 0x01017E 04:816E: 4C 9A A8  JMP loc_0x0068AA



tbl_8171:
; 
- D 0 - - - 0x010181 04:8171: 88        .byte $88   ; 00 
- D 0 - - - 0x010182 04:8172: 89        .byte $89   ; 01 
- D 0 - - - 0x010183 04:8173: 87        .byte $87   ; 02 
; 
- - - - - - 0x010184 04:8174: 8A        .byte $8A   ; 00 
- - - - - - 0x010185 04:8175: 8B        .byte $8B   ; 01 
- - - - - - 0x010186 04:8176: 8C        .byte $8C   ; 02 



_off001_0x010187_33_bullet_cannon_32:
- D 0 - I - 0x010187 04:8177: 7D 81     .word ofs_038_33_817D_01_initialize_object ; 
- D 0 - I - 0x010189 04:8179: 9F 81     .word ofs_038_33_819F_02 ; 
- - - - - - 0x01018B 04:817B: 75 A2     .word ofs_038_33_0x006285_03_delete_object_02 ; 



ofs_038_33_817D_01_initialize_object:
C - - J - - 0x01018D 04:817D: A9 80     LDA #$80
C - - - - - 0x01018F 04:817F: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x010192 04:8182: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x010195 04:8185: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010198 04:8188: 29 01     AND #$01
C - - - - - 0x01019A 04:818A: 0A        ASL
C - - - - - 0x01019B 04:818B: A8        TAY
C - - - - - 0x01019C 04:818C: B9 9B 81  LDA tbl_819B_spd_X,Y
C - - - - - 0x01019F 04:818F: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x0101A2 04:8192: B9 9C 81  LDA tbl_819B_spd_X + $01,Y
C - - - - - 0x0101A5 04:8195: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x0101A8 04:8198: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_819B_spd_X:
- D 0 - - - 0x0101AB 04:819B: 00 FC     .word $FC00 ; 00 
- - - - - - 0x0101AD 04:819D: 00 04     .word $0400 ; 01 



ofs_038_33_819F_02:
C - - J - - 0x0101AF 04:819F: A9 06     LDA #$06
C - - - - - 0x0101B1 04:81A1: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x0101B4 04:81A4: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x0101B7 04:81A7: A9 00     LDA #$00
C - - - - - 0x0101B9 04:81A9: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x0101BC 04:81AC: F0 03     BEQ bra_81B1_RTS
C - - - - - 0x0101BE 04:81AE: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_81B1_RTS:
C - - - - - 0x0101C1 04:81B1: 60        RTS



_off001_0x0101C2_34_flying_rifleman:
- D 0 - I - 0x0101C2 04:81B2: BE 81     .word ofs_038_34_81BE_01_initialize_object ; 
- D 0 - I - 0x0101C4 04:81B4: E1 81     .word ofs_038_34_81E1_02 ; 
- D 0 - I - 0x0101C6 04:81B6: FF 81     .word ofs_038_34_81FF_03 ; 
- D 0 - I - 0x0101C8 04:81B8: 9A A2     .word ofs_038_34_0x0062AA_04 ; 
- D 0 - I - 0x0101CA 04:81BA: FD A2     .word ofs_038_34_0x00630D_05 ; 
- D 0 - I - 0x0101CC 04:81BC: 3D A3     .word ofs_038_34_0x00634D_06_delete_object_04 ; 



ofs_038_34_81BE_01_initialize_object:
C - - J - - 0x0101CE 04:81BE: A9 C8     LDA #$C8
C - - - - - 0x0101D0 04:81C0: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0101D3 04:81C3: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0101D6 04:81C6: A0 00     LDY #$00
C - - - - - 0x0101D8 04:81C8: 20 D0 81  JSR sub_81D0
C - - - - - 0x0101DB 04:81CB: A9 60     LDA #$60
C - - - - - 0x0101DD 04:81CD: 4C E0 A2  JMP loc_0x0062F0



sub_81D0:
C - - - - - 0x0101E0 04:81D0: B9 DD 81  LDA tbl_81DD_spd_Y,Y
C - - - - - 0x0101E3 04:81D3: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x0101E6 04:81D6: B9 DE 81  LDA tbl_81DD_spd_Y + $01,Y
C - - - - - 0x0101E9 04:81D9: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x0101EC 04:81DC: 60        RTS



tbl_81DD_spd_Y:
- D 0 - - - 0x0101ED 04:81DD: 00 FF     .word $FF00 ; 00 
- D 0 - - - 0x0101EF 04:81DF: 00 01     .word $0100 ; 02 



ofs_038_34_81E1_02:
C - - J - - 0x0101F1 04:81E1: 20 1C 82  JSR sub_821C
C - - - - - 0x0101F4 04:81E4: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x0101F7 04:81E7: 20 38 82  JSR sub_8238
C - - - - - 0x0101FA 04:81EA: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0101FD 04:81ED: C9 20     CMP #$20
C - - - - - 0x0101FF 04:81EF: B0 0D     BCS bra_81FE_RTS
C - - - - - 0x010201 04:81F1: A0 02     LDY #$02
C - - - - - 0x010203 04:81F3: 20 D0 81  JSR sub_81D0
C - - - - - 0x010206 04:81F6: A9 90     LDA #$90
C - - - - - 0x010208 04:81F8: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x01020B 04:81FB: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_81FE_RTS:
C - - - - - 0x01020E 04:81FE: 60        RTS



ofs_038_34_81FF_03:
C - - J - - 0x01020F 04:81FF: 20 1C 82  JSR sub_821C
C - - - - - 0x010212 04:8202: A0 FC     LDY #$FC
C - - - - - 0x010214 04:8204: 20 8E A9  JSR sub_0x00699E
C - - - - - 0x010217 04:8207: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x01021A 04:820A: 20 38 82  JSR sub_8238
C - - - - - 0x01021D 04:820D: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x010220 04:8210: 30 EC     BMI bra_81FE_RTS
C - - - - - 0x010222 04:8212: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x010225 04:8215: C9 D0     CMP #$D0
C - - - - - 0x010227 04:8217: 90 E5     BCC bra_81FE_RTS
C - - - - - 0x010229 04:8219: 4C EE A7  JMP loc_0x0067FE_inverse_spd_Y



sub_821C:
C - - - - - 0x01022C 04:821C: A0 0C     LDY #$0C
C - - - - - 0x01022E 04:821E: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x010231 04:8221: 20 24 AB  JSR sub_0x006B34
C - - - - - 0x010234 04:8224: 98        TYA
C - - - - - 0x010235 04:8225: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x010238 04:8228: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01023B 04:822B: D9 4C 05  CMP ram_pos_X_hi_plr,Y
C - - - - - 0x01023E 04:822E: A9 41     LDA #$41
C - - - - - 0x010240 04:8230: 90 02     BCC bra_8234
C - - - - - 0x010242 04:8232: A9 01     LDA #$01
bra_8234:
C - - - - - 0x010244 04:8234: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x010247 04:8237: 60        RTS



sub_8238:
C - - - - - 0x010248 04:8238: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x01024B 04:823B: D0 28     BNE bra_8265_RTS
C - - - - - 0x01024D 04:823D: A9 67     LDA #$67
C - - - - - 0x01024F 04:823F: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x010252 04:8242: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x010255 04:8245: 38        SEC
C - - - - - 0x010256 04:8246: E9 10     SBC #$10
C - - - - - 0x010258 04:8248: 85 08     STA ram_0008
C - - - - - 0x01025A 04:824A: BD 56 05  LDA ram_attr_spr_enemy,X
C - - - - - 0x01025D 04:824D: 0A        ASL
C - - - - - 0x01025E 04:824E: 0A        ASL
C - - - - - 0x01025F 04:824F: A9 0A     LDA #$0A
C - - - - - 0x010261 04:8251: B0 02     BCS bra_8255
C - - - - - 0x010263 04:8253: A9 F6     LDA #$F6
bra_8255:
C - - - - - 0x010265 04:8255: 18        CLC
C - - - - - 0x010266 04:8256: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x010269 04:8259: 85 09     STA ram_0009
C - - - - - 0x01026B 04:825B: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x01026E 04:825E: 85 0A     STA ram_000A
C - - - - - 0x010270 04:8260: A0 02     LDY #$02
C - - - - - 0x010272 04:8262: 4C 27 F3  JMP loc_0x01F337
bra_8265_RTS:
C - - - - - 0x010275 04:8265: 60        RTS



_off001_0x010276_58_spawner_container_normal_mobs:
- D 0 - I - 0x010276 04:8266: 6E 82     .word ofs_038_58_826E_01_initialize_object ; 
- D 0 - I - 0x010278 04:8268: 79 82     .word ofs_038_58_8279_02 ; 
- D 0 - I - 0x01027A 04:826A: 86 82     .word ofs_038_58_8286_03 ; 
- D 0 - I - 0x01027C 04:826C: AF 82     .word ofs_038_58_82AF_04 ; 



ofs_038_58_826E_01_initialize_object:
C - - J - - 0x01027E 04:826E: A9 81     LDA #$81
C - - - - - 0x010280 04:8270: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x010283 04:8273: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x010286 04:8276: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_58_8279_02:
C - - J - - 0x010289 04:8279: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x01028C 04:827C: 20 18 84  JSR sub_8418
C - - - - - 0x01028F 04:827F: B0 2D     BCS bra_82AE_RTS
C - - - - - 0x010291 04:8281: A9 01     LDA #$01
C - - - - - 0x010293 04:8283: 4C E0 A2  JMP loc_0x0062F0



ofs_038_58_8286_03:
C - - J - - 0x010296 04:8286: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x010299 04:8289: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x01029C 04:828C: D0 20     BNE bra_82AE_RTS
C - - - - - 0x01029E 04:828E: 20 E4 82  JSR sub_82E4
C - - - - - 0x0102A1 04:8291: A9 01     LDA #$01
C - - - - - 0x0102A3 04:8293: B0 16     BCS bra_82AB
C - - - - - 0x0102A5 04:8295: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x0102A8 04:8298: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x0102AB 04:829B: C9 03     CMP #$03
C - - - - - 0x0102AD 04:829D: A9 0A     LDA #$0A
C - - - - - 0x0102AF 04:829F: 90 0A     BCC bra_82AB
C - - - - - 0x0102B1 04:82A1: A9 03     LDA #$03
C - - - - - 0x0102B3 04:82A3: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0102B6 04:82A6: A9 01     LDA #$01
C - - - - - 0x0102B8 04:82A8: 4C E0 A2  JMP loc_0x0062F0
bra_82AB:
C - - - - - 0x0102BB 04:82AB: 9D E6 06  STA ram_06E6_obj,X
bra_82AE_RTS:
C - - - - - 0x0102BE 04:82AE: 60        RTS



ofs_038_58_82AF_04:
C - - J - - 0x0102BF 04:82AF: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0102C2 04:82B2: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0102C5 04:82B5: D0 F7     BNE bra_82AE_RTS
C - - - - - 0x0102C7 04:82B7: A9 10     LDA #$10
C - - - - - 0x0102C9 04:82B9: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x0102CC 04:82BC: A0 03     LDY #con_obj_id_03
C - - - - - 0x0102CE 04:82BE: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x0102D1 04:82C1: 90 19     BCC bra_82DC
C - - - - - 0x0102D3 04:82C3: A4 11     LDY ram_0011
C - - - - - 0x0102D5 04:82C5: A9 81     LDA #$81
C - - - - - 0x0102D7 04:82C7: 99 1E 07  STA ram_obj_flags,Y
C - - - - - 0x0102DA 04:82CA: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0102DD 04:82CD: 18        CLC
C - - - - - 0x0102DE 04:82CE: 69 18     ADC #$18
C - - - - - 0x0102E0 04:82D0: 99 22 05  STA ram_pos_Y_hi_enemy,Y
C - - - - - 0x0102E3 04:82D3: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0102E6 04:82D6: 18        CLC
C - - - - - 0x0102E7 04:82D7: 69 04     ADC #$04
C - - - - - 0x0102E9 04:82D9: 99 3C 05  STA ram_pos_X_hi_enemy,Y
bra_82DC:
C - - - - - 0x0102EC 04:82DC: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x0102EF 04:82DF: D0 CD     BNE bra_82AE_RTS
C - - - - - 0x0102F1 04:82E1: 4C 75 A2  JMP loc_0x006285_delete_object_02



sub_82E4:
C - - - - - 0x0102F4 04:82E4: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x0102F7 04:82E7: 0A        ASL
C - - - - - 0x0102F8 04:82E8: A8        TAY
C - - - - - 0x0102F9 04:82E9: B9 F7 82  LDA tbl_82F6 + $01,Y
C - - - - - 0x0102FC 04:82EC: 85 0C     STA ram_000C
C - - - - - 0x0102FE 04:82EE: B9 F6 82  LDA tbl_82F6,Y
C - - - - - 0x010301 04:82F1: A0 1F     LDY #$1F
C - - - - - 0x010303 04:82F3: 4C A8 A8  JMP loc_0x0068B8



tbl_82F6:
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- D 0 - - - 0x010306 04:82F6: 61        .byte $61, $75   ; 00 
- D 0 - - - 0x010308 04:82F8: 76        .byte $76, $77   ; 01 
- D 0 - - - 0x01030A 04:82FA: 78        .byte $78, $79   ; 02 



_off001_0x01030C_5A_boss_5_skull:
- D 0 - I - 0x01030C 04:82FC: 08 83     .word ofs_038_5A_8308_01_initialize_object ; 
- D 0 - I - 0x01030E 04:82FE: 39 83     .word ofs_038_5A_8339_02 ; 
- D 0 - I - 0x010310 04:8300: 8C 83     .word ofs_038_5A_838C_03 ; 
- D 0 - I - 0x010312 04:8302: 9A A2     .word ofs_038_5A_0x0062AA_04 ; 
- D 0 - I - 0x010314 04:8304: FD A2     .word ofs_038_5A_0x00630D_05 ; 
- D 0 - I - 0x010316 04:8306: 3D A3     .word ofs_038_5A_0x00634D_06_delete_object_04 ; 



ofs_038_5A_8308_01_initialize_object:
; area 5 boss, small skeleton heads
C - - J - - 0x010318 04:8308: A9 02     LDA #$02
C - - - - - 0x01031A 04:830A: A0 06     LDY #$06
C - - - - - 0x01031C 04:830C: 20 9B AB  JSR sub_0x006BAB_set_dynamic_hp_to_obj
C - - - - - 0x01031F 04:830F: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010322 04:8312: 0A        ASL
C - - - - - 0x010323 04:8313: A8        TAY
C - - - - - 0x010324 04:8314: B9 35 83  LDA tbl_8335_spd_X,Y
C - - - - - 0x010327 04:8317: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x01032A 04:831A: B9 36 83  LDA tbl_8335_spd_X + $01,Y
C - - - - - 0x01032D 04:831D: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x010330 04:8320: A9 C0     LDA #< $FEC0
C - - - - - 0x010332 04:8322: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x010335 04:8325: A9 FE     LDA #> $FEC0
C - - - - - 0x010337 04:8327: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x01033A 04:832A: 20 94 83  JSR sub_8394
C - - - - - 0x01033D 04:832D: 09 20     ORA #$20
C - - - - - 0x01033F 04:832F: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x010342 04:8332: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_8335_spd_X:
- D 0 - - - 0x010345 04:8335: 80 00     .word $0080 ; 00 
- D 0 - - - 0x010347 04:8337: 80 FF     .word $FF80 ; 01 



ofs_038_5A_8339_02:
C - - J - - 0x010349 04:8339: A0 0B     LDY #$0B
C - - - - - 0x01034B 04:833B: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x01034E 04:833E: A9 14     LDA #$14
C - - - - - 0x010350 04:8340: 20 CB AA  JSR sub_0x006ADB
C - - - - - 0x010353 04:8343: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x010356 04:8346: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x010359 04:8349: C9 10     CMP #$10
C - - - - - 0x01035B 04:834B: 90 04     BCC bra_8351
C - - - - - 0x01035D 04:834D: C9 F0     CMP #$F0
C - - - - - 0x01035F 04:834F: 90 03     BCC bra_8354
bra_8351:
C - - - - - 0x010361 04:8351: 20 D3 A7  JSR sub_0x0067E3_clear_spd_X
bra_8354:
C - - - - - 0x010364 04:8354: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x010367 04:8357: C9 A0     CMP #$A0
C - - - - - 0x010369 04:8359: 90 03     BCC bra_835E
C - - - - - 0x01036B 04:835B: 20 94 83  JSR sub_8394
bra_835E:
C - - - - - 0x01036E 04:835E: A9 08     LDA #$08
C - - - - - 0x010370 04:8360: 20 05 A8  JSR sub_0x006815
C - - - - - 0x010373 04:8363: F0 22     BEQ bra_8387_RTS
C - - - - - 0x010375 04:8365: 20 3D A8  JSR sub_0x00684D
C - - - - - 0x010378 04:8368: 20 CA A7  JSR sub_0x0067DA_clear_spd_Y
C - - - - - 0x01037B 04:836B: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x01037E 04:836E: 0A        ASL
C - - - - - 0x01037F 04:836F: A8        TAY
C - - - - - 0x010380 04:8370: B9 88 83  LDA tbl_8388_spd_X,Y
C - - - - - 0x010383 04:8373: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x010386 04:8376: B9 89 83  LDA tbl_8388_spd_X + $01,Y
C - - - - - 0x010389 04:8379: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x01038C 04:837C: 20 94 83  JSR sub_8394
C - - - - - 0x01038F 04:837F: A9 01     LDA #$01
C - - - - - 0x010391 04:8381: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x010394 04:8384: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8387_RTS:
C - - - - - 0x010397 04:8387: 60        RTS



tbl_8388_spd_X:
- D 0 - - - 0x010398 04:8388: C0 FE     .word $FEC0 ; 00 
- D 0 - - - 0x01039A 04:838A: 40 01     .word $0140 ; 01 



ofs_038_5A_838C_03:
C - - J - - 0x01039C 04:838C: A0 0B     LDY #$0B
C - - - - - 0x01039E 04:838E: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x0103A1 04:8391: 4C D3 A6  JMP loc_0x0066E3



sub_8394:
C - - - - - 0x0103A4 04:8394: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x0103A7 04:8397: 1D BC 06  ORA ram_spd_X_lo_obj,X
C - - - - - 0x0103AA 04:839A: F0 0C     BEQ bra_83A8_RTS
C - - - - - 0x0103AC 04:839C: A9 02     LDA #$02
C - - - - - 0x0103AE 04:839E: BC CA 06  LDY ram_spd_X_hi_obj,X
C - - - - - 0x0103B1 04:83A1: 30 02     BMI bra_83A5
C - - - - - 0x0103B3 04:83A3: A9 42     LDA #$42
bra_83A5:
C - - - - - 0x0103B5 04:83A5: 9D 56 05  STA ram_attr_spr_enemy,X
bra_83A8_RTS:
C - - - - - 0x0103B8 04:83A8: 60        RTS



_off001_0x0103B9_35_boss_5_red_spiked_ball:
- D 0 - I - 0x0103B9 04:83A9: B7 83     .word ofs_038_35_83B7_01_initialize_object ; 
- D 0 - I - 0x0103BB 04:83AB: CB 83     .word ofs_038_35_83CB_02 ; 
- D 0 - I - 0x0103BD 04:83AD: F1 83     .word ofs_038_35_83F1_03 ; 
- D 0 - I - 0x0103BF 04:83AF: 06 84     .word ofs_038_35_8406_04 ; 
- D 0 - I - 0x0103C1 04:83B1: 9A A2     .word ofs_038_35_0x0062AA_05 ; 
- D 0 - I - 0x0103C3 04:83B3: FD A2     .word ofs_038_35_0x00630D_06 ; 
- D 0 - I - 0x0103C5 04:83B5: 3D A3     .word ofs_038_35_0x00634D_07_delete_object_04 ; 



ofs_038_35_83B7_01_initialize_object:
C - - J - - 0x0103C7 04:83B7: A9 22     LDA #$22
C - - - - - 0x0103C9 04:83B9: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0103CC 04:83BC: A9 00     LDA #< $0200
C - - - - - 0x0103CE 04:83BE: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x0103D1 04:83C1: A9 02     LDA #> $0200
C - - - - - 0x0103D3 04:83C3: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x0103D6 04:83C6: A9 0A     LDA #$0A
C - - - - - 0x0103D8 04:83C8: 4C E0 A2  JMP loc_0x0062F0



ofs_038_35_83CB_02:
C - - J - - 0x0103DB 04:83CB: A0 0A     LDY #$0A
C - - - - - 0x0103DD 04:83CD: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x0103E0 04:83D0: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x0103E3 04:83D3: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0103E6 04:83D6: D0 14     BNE bra_83EC_RTS
C - - - - - 0x0103E8 04:83D8: A9 02     LDA #$02
C - - - - - 0x0103EA 04:83DA: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0103ED 04:83DD: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x0103EF 04:83DF: 65 1B     ADC ram_счетчик_кадров
C - - - - - 0x0103F1 04:83E1: 85 23     STA ram_рандом_байт_1
C - - - - - 0x0103F3 04:83E3: 29 03     AND #$03
C - - - - - 0x0103F5 04:83E5: A8        TAY
C - - - - - 0x0103F6 04:83E6: B9 ED 83  LDA tbl_83ED,Y
C - - - - - 0x0103F9 04:83E9: 4C E0 A2  JMP loc_0x0062F0
bra_83EC_RTS:
C - - - - - 0x0103FC 04:83EC: 60        RTS



tbl_83ED:
- D 0 - - - 0x0103FD 04:83ED: 40        .byte $40   ; 00 
- D 0 - - - 0x0103FE 04:83EE: 60        .byte $60   ; 01 
- D 0 - - - 0x0103FF 04:83EF: 70        .byte $70   ; 02 
- D 0 - - - 0x010400 04:83F0: 50        .byte $50   ; 03 



ofs_038_35_83F1_03:
C - - J - - 0x010401 04:83F1: A0 0A     LDY #$0A
C - - - - - 0x010403 04:83F3: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x010406 04:83F6: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x010409 04:83F9: D0 F1     BNE bra_83EC_RTS
C - - - - - 0x01040B 04:83FB: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x01040E 04:83FE: A0 02     LDY #$02
C - - - - - 0x010410 04:8400: 20 57 A9  JSR sub_0x006967
C - - - - - 0x010413 04:8403: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_35_8406_04:
C - - J - - 0x010416 04:8406: A0 0A     LDY #$0A
C - - - - - 0x010418 04:8408: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x01041B 04:840B: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x01041E 04:840E: A9 00     LDA #$00
C - - - - - 0x010420 04:8410: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x010423 04:8413: F0 D7     BEQ bra_83EC_RTS
C - - - - - 0x010425 04:8415: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



sub_8418:
C - - - - - 0x010428 04:8418: 20 24 AB  JSR sub_0x006B34
C - - - - - 0x01042B 04:841B: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01042E 04:841E: 38        SEC
C - - - - - 0x01042F 04:841F: F9 32 05  SBC ram_pos_Y_hi_plr,Y
C - - - - - 0x010432 04:8422: B0 04     BCS bra_8428
- - - - - - 0x010434 04:8424: 49 FF     EOR #$FF
- - - - - - 0x010436 04:8426: 69 01     ADC #$01
bra_8428:
C - - - - - 0x010438 04:8428: C9 20     CMP #$20
C - - - - - 0x01043A 04:842A: 60        RTS



_off001_0x01043B_59_boss_5_body:
- D 0 - I - 0x01043B 04:842B: 3F 84     .word ofs_038_59_843F_01_initialize_object ; 
- D 0 - I - 0x01043D 04:842D: 4C 84     .word ofs_038_59_844C_02 ; 
- D 0 - I - 0x01043F 04:842F: 69 84     .word ofs_038_59_8469_03 ; 
- D 0 - I - 0x010441 04:8431: 7B 84     .word ofs_038_59_847B_04 ; 
- D 0 - I - 0x010443 04:8433: 0A 85     .word ofs_038_59_850A_05 ; 
- D 0 - I - 0x010445 04:8435: 2E 85     .word ofs_038_59_852E_06 ; 
- D 0 - I - 0x010447 04:8437: 3C 85     .word ofs_038_59_853C_07 ; 
- D 0 - I - 0x010449 04:8439: 42 85     .word ofs_038_59_8542_08 ; 
- D 0 - I - 0x01044B 04:843B: 48 85     .word ofs_038_59_8548_09 ; 
- D 0 - I - 0x01044D 04:843D: 4E 85     .word ofs_038_59_854E_0A ; 



ofs_038_59_843F_01_initialize_object:
C - - J - - 0x01044F 04:843F: A9 10     LDA #$10
C - - - - - 0x010451 04:8441: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x010454 04:8444: A9 F0     LDA #con__hp_F0
C - - - - - 0x010456 04:8446: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x010459 04:8449: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_59_844C_02:
C - - J - - 0x01045C 04:844C: A5 61     LDA ram_0061
C - - - - - 0x01045E 04:844E: F0 18     BEQ bra_8468_RTS
C - - - - - 0x010460 04:8450: A5 60     LDA ram_0060
C - - - - - 0x010462 04:8452: 05 70     ORA ram_0070
C - - - - - 0x010464 04:8454: D0 12     BNE bra_8468_RTS
C - - - - - 0x010466 04:8456: A5 94     LDA ram_0094
C - - - - - 0x010468 04:8458: 09 40     ORA #$40
C - - - - - 0x01046A 04:845A: 85 94     STA ram_0094
C - - - - - 0x01046C 04:845C: A9 B8     LDA #$B8
C - - - - - 0x01046E 04:845E: 85 98     STA ram_0098
C - - - - - 0x010470 04:8460: A9 31     LDA #con_sound_31
C - - - - - 0x010472 04:8462: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x010475 04:8465: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8468_RTS:
C - - - - - 0x010478 04:8468: 60        RTS



ofs_038_59_8469_03:
C - - J - - 0x010479 04:8469: A5 98     LDA ram_0098
C - - - - - 0x01047B 04:846B: D0 FB     BNE bra_8468_RTS
C - - - - - 0x01047D 04:846D: 20 94 AA  JSR sub_0x006AA4_save_reg_values
C - - - - - 0x010480 04:8470: 20 90 F1  JSR sub_0x01F1A0
C - - - - - 0x010483 04:8473: A9 08     LDA #$08
C - - - - - 0x010485 04:8475: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x010488 04:8478: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_59_847B_04:
C - - J - - 0x01048B 04:847B: A5 60     LDA ram_0060
C - - - - - 0x01048D 04:847D: 05 70     ORA ram_0070
C - - - - - 0x01048F 04:847F: D0 E7     BNE bra_8468_RTS
C - - - - - 0x010491 04:8481: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x010494 04:8484: F0 05     BEQ bra_848B
C - - - - - 0x010496 04:8486: A9 00     LDA #$00
C - - - - - 0x010498 04:8488: 85 6B     STA ram_006B
C - - - - - 0x01049A 04:848A: 60        RTS
bra_848B:
C - - - - - 0x01049B 04:848B: A9 01     LDA #$01
C - - - - - 0x01049D 04:848D: 85 61     STA ram_0061
C - - - - - 0x01049F 04:848F: A9 01     LDA #con_mirroring_H
C - - - - - 0x0104A1 04:8491: 85 26     STA ram_for_A000
C - - - - - 0x0104A3 04:8493: A9 80     LDA #$80
C - - - - - 0x0104A5 04:8495: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0104A8 04:8498: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x0104AB 04:849B: A9 C4     LDA #$C4
C - - - - - 0x0104AD 04:849D: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0104B0 04:84A0: A9 FF     LDA #$FF
C - - - - - 0x0104B2 04:84A2: 9D 8E 07  STA ram_078E_obj,X
C - - - - - 0x0104B5 04:84A5: A9 00     LDA #$00
C - - - - - 0x0104B7 04:84A7: 9D 9C 07  STA ram_079C_obj,X
C - - - - - 0x0104BA 04:84AA: A9 A8     LDA #$A8
C - - - - - 0x0104BC 04:84AC: 85 FF     STA ram_for_2000
C - - - - - 0x0104BE 04:84AE: 20 7F FC  JSR sub_0x01FC8F_copy_reg_values
C - - - - - 0x0104C1 04:84B1: 20 CE A9  JSR sub_0x0069DE
C - - - - - 0x0104C4 04:84B4: A9 0B     LDA #con_irq_area_5_boss
C - - - - - 0x0104C6 04:84B6: 85 27     STA ram_irq_handler_hi
C - - - - - 0x0104C8 04:84B8: A9 C1     LDA #$C1
C - - - - - 0x0104CA 04:84BA: 85 45     STA ram_0045
C - - - - - 0x0104CC 04:84BC: A9 00     LDA #$00
C - - - - - 0x0104CE 04:84BE: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0104D1 04:84C1: A9 E0     LDA #< $00E0
C - - - - - 0x0104D3 04:84C3: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x0104D6 04:84C6: A9 00     LDA #> $00E0
C - - - - - 0x0104D8 04:84C8: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x0104DB 04:84CB: A0 00     LDY #$00
C - - - - - 0x0104DD 04:84CD: 20 F9 84  JSR sub_84F9
C - - - - - 0x0104E0 04:84D0: 20 10 BD  JSR sub_0x007D20_clear_0400_047F
C - - - - - 0x0104E3 04:84D3: A9 F0     LDA #$F0
C - - - - - 0x0104E5 04:84D5: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x0104E8 04:84D8: A9 00     LDA #$00
C - - - - - 0x0104EA 04:84DA: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x0104ED 04:84DD: A9 10     LDA #$10
C - - - - - 0x0104EF 04:84DF: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x0104F2 04:84E2: A9 00     LDA #$00
C - - - - - 0x0104F4 04:84E4: 9D 1E 07  STA ram_obj_flags,X
C - - - - - 0x0104F7 04:84E7: A9 20     LDA #$20
C - - - - - 0x0104F9 04:84E9: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x0104FC 04:84EC: A9 5A     LDA #con_chr_bank + $5A
C - - - - - 0x0104FE 04:84EE: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x010501 04:84F1: A9 06     LDA #con_chr_bank + $06
C - - - - - 0x010503 04:84F3: 8D F1 07  STA ram_bg_bank_1 + $01
C - - - - - 0x010506 04:84F6: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



sub_84F9:
loc_84F9:
C D 0 - - - 0x010509 04:84F9: B9 06 85  LDA tbl_8506_spd_Y,Y
C - - - - - 0x01050C 04:84FC: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x01050F 04:84FF: B9 07 85  LDA tbl_8506_spd_Y + $01,Y
C - - - - - 0x010512 04:8502: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x010515 04:8505: 60        RTS



tbl_8506_spd_Y:
- D 0 - - - 0x010516 04:8506: 40 00     .word $0040 ; 00 
- D 0 - - - 0x010518 04:8508: 80 00     .word $0080 ; 02 



ofs_038_59_850A_05:
C - - J - - 0x01051A 04:850A: A9 01     LDA #$01
C - - - - - 0x01051C 04:850C: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x01051F 04:850F: 20 B6 87  JSR sub_87B6
C - - - - - 0x010522 04:8512: A0 FC     LDY #$FC
C - - - - - 0x010524 04:8514: 20 8E A9  JSR sub_0x00699E
C - - - - - 0x010527 04:8517: BD 80 07  LDA ram_0780_obj,X
C - - - - - 0x01052A 04:851A: F0 05     BEQ bra_8521
C - - - - - 0x01052C 04:851C: A0 01     LDY #$01
C - - - - - 0x01052E 04:851E: 20 6E A9  JSR sub_0x00697E
bra_8521:
C - - - - - 0x010531 04:8521: 20 39 88  JSR sub_8839
C - - - - - 0x010534 04:8524: 20 66 85  JSR sub_8566
C - - - - - 0x010537 04:8527: 20 A0 86  JSR sub_86A0
C - - - - - 0x01053A 04:852A: 20 E7 86  JSR sub_86E7
C - - - - - 0x01053D 04:852D: 60        RTS



ofs_038_59_852E_06:
C - - J - - 0x01053E 04:852E: 20 D3 A7  JSR sub_0x0067E3_clear_spd_X
C - - - - - 0x010541 04:8531: A0 02     LDY #$02
C - - - - - 0x010543 04:8533: 20 F9 84  JSR sub_84F9
C - - - - - 0x010546 04:8536: 20 32 88  JSR sub_8832
C - - - - - 0x010549 04:8539: 4C B8 A3  JMP loc_0x0063C8



ofs_038_59_853C_07:
C - - J - - 0x01054C 04:853C: 20 32 88  JSR sub_8832
C - - - - - 0x01054F 04:853F: 4C D8 A3  JMP loc_0x0063E8



ofs_038_59_8542_08:
C - - J - - 0x010552 04:8542: 20 32 88  JSR sub_8832
C - - - - - 0x010555 04:8545: 4C A2 A2  JMP loc_0x0062B2



ofs_038_59_8548_09:
C - - J - - 0x010558 04:8548: 20 32 88  JSR sub_8832
C - - - - - 0x01055B 04:854B: 4C F6 A2  JMP loc_0x006306



ofs_038_59_854E_0A:
C - - J - - 0x01055E 04:854E: 20 8C FC  JSR sub_0x01FC9C_increase_002B
C - - - - - 0x010561 04:8551: 20 88 F1  JSR sub_0x01F198
C - - - - - 0x010564 04:8554: E6 65     INC ram_0065
C - - - - - 0x010566 04:8556: 20 A1 AA  JSR sub_0x006AB1_restore_reg_values
C - - - - - 0x010569 04:8559: A9 20     LDA #con_chr_bank + $20
C - - - - - 0x01056B 04:855B: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x01056E 04:855E: A9 22     LDA #con_chr_bank + $22
C - - - - - 0x010570 04:8560: 8D F1 07  STA ram_bg_bank_1 + $01
C - - - - - 0x010573 04:8563: 4C 37 A3  JMP loc_0x006347_delete_object_08



sub_8566:
C - - - - - 0x010576 04:8566: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x010579 04:8569: C9 02     CMP #$02
C - - - - - 0x01057B 04:856B: D0 15     BNE bra_8582
C - - - - - 0x01057D 04:856D: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x010580 04:8570: B9 DD 86  LDA tbl_86DD,Y
C - - - - - 0x010583 04:8573: 0A        ASL
C - - - - - 0x010584 04:8574: 30 47     BMI bra_85BD_RTS
- - - - - - 0x010586 04:8576: BD 02 07  LDA ram_0702_obj,X
- - - - - - 0x010589 04:8579: C9 0C     CMP #$0C
- - - - - - 0x01058B 04:857B: 90 05     BCC bra_8582
- - - - - - 0x01058D 04:857D: A9 0C     LDA #$0C
- - - - - - 0x01058F 04:857F: 9D 02 07  STA ram_0702_obj,X
bra_8582:
C - - - - - 0x010592 04:8582: DE 02 07  DEC ram_0702_obj,X
C - - - - - 0x010595 04:8585: D0 36     BNE bra_85BD_RTS
C - - - - - 0x010597 04:8587: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x01059A 04:858A: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x01059D 04:858D: C9 08     CMP #$08
C - - - - - 0x01059F 04:858F: 90 02     BCC bra_8593_not_overflow
C - - - - - 0x0105A1 04:8591: A9 00     LDA #$00
bra_8593_not_overflow:
C - - - - - 0x0105A3 04:8593: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x0105A6 04:8596: A8        TAY
C - - - - - 0x0105A7 04:8597: B9 BE 85  LDA tbl_85BE,Y
C - - - - - 0x0105AA 04:859A: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x0105AD 04:859D: 98        TYA
C - - - - - 0x0105AE 04:859E: 0A        ASL
C - - - - - 0x0105AF 04:859F: A8        TAY
C - - - - - 0x0105B0 04:85A0: B9 C6 85  LDA tbl_85C6,Y
C - - - - - 0x0105B3 04:85A3: 85 08     STA ram_0008
C - - - - - 0x0105B5 04:85A5: B9 C7 85  LDA tbl_85C6 + $01,Y
sub_85A8:
C - - - - - 0x0105B8 04:85A8: 85 09     STA ram_0009
C - - - - - 0x0105BA 04:85AA: A0 00     LDY #$00
C - - - - - 0x0105BC 04:85AC: A6 1E     LDX ram_index_ppu_buffer
bra_85AE_loop:
C - - - - - 0x0105BE 04:85AE: B1 08     LDA (ram_0008),Y
C - - - - - 0x0105C0 04:85B0: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0105C3 04:85B3: C8        INY
C - - - - - 0x0105C4 04:85B4: E8        INX
C - - - - - 0x0105C5 04:85B5: C9 FF     CMP #$FF
C - - - - - 0x0105C7 04:85B7: D0 F5     BNE bra_85AE_loop
C - - - - - 0x0105C9 04:85B9: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x0105CB 04:85BB: A6 10     LDX ram_0010
bra_85BD_RTS:
C - - - - - 0x0105CD 04:85BD: 60        RTS



tbl_85BE:
- D 0 - - - 0x0105CE 04:85BE: 0C        .byte $0C   ; 00 
- D 0 - - - 0x0105CF 04:85BF: 50        .byte $50   ; 01 
- D 0 - - - 0x0105D0 04:85C0: 0C        .byte $0C   ; 02 
- D 0 - - - 0x0105D1 04:85C1: 10        .byte $10   ; 03 
- D 0 - - - 0x0105D2 04:85C2: 0C        .byte $0C   ; 04 
- D 0 - - - 0x0105D3 04:85C3: 50        .byte $50   ; 05 
- D 0 - - - 0x0105D4 04:85C4: 0C        .byte $0C   ; 06 
- D 0 - - - 0x0105D5 04:85C5: 10        .byte $10   ; 07 



tbl_85C6:
- D 0 - - - 0x0105D6 04:85C6: F4 85     .word _off022_85F4_00
- D 0 - - - 0x0105D8 04:85C8: 1A 86     .word _off022_861A_01
- D 0 - - - 0x0105DA 04:85CA: F4 85     .word _off022_85F4_02
- D 0 - - - 0x0105DC 04:85CC: D6 85     .word _off022_85D6_03
- D 0 - - - 0x0105DE 04:85CE: 59 86     .word _off022_8659_04
- D 0 - - - 0x0105E0 04:85D0: 7F 86     .word _off022_867F_05
- D 0 - - - 0x0105E2 04:85D2: 59 86     .word _off022_8659_06
- D 0 - - - 0x0105E4 04:85D4: 3B 86     .word _off022_863B_07



_off022_85D6_03:
- D 0 - I - 0x0105E6 04:85D6: 07        .byte con_buf_mode_07   ; 

- D 0 - I - 0x0105E7 04:85D7: 21 D3     .dbyt $21D3 ; ppu address
- D 0 - I - 0x0105E9 04:85D9: 02        .byte $02   ; counter
- D 0 - I - 0x0105EA 04:85DA: 18        .byte $18, $24   ; tiles

- D 0 - I - 0x0105EC 04:85DC: 21 B4     .dbyt $21B4 ; ppu address
- D 0 - I - 0x0105EE 04:85DE: 05        .byte $05   ; counter
- D 0 - I - 0x0105EF 04:85DF: 10        .byte $10, $19, $25, $32, $3D   ; tiles

- D 0 - I - 0x0105F4 04:85E4: 21 B5     .dbyt $21B5 ; ppu address
- D 0 - I - 0x0105F6 04:85E6: 05        .byte $05   ; counter
- D 0 - I - 0x0105F7 04:85E7: 00        .byte $00, $1A, $26, $33, $3E   ; tiles

- D 0 - I - 0x0105FC 04:85EC: 21 D6     .dbyt $21D6 ; ppu address
- D 0 - I - 0x0105FE 04:85EE: 04        .byte $04   ; counter
- D 0 - I - 0x0105FF 04:85EF: 00        .byte $00, $27, $34, $3F   ; tiles

- D 0 - I - 0x010603 04:85F3: FF        .byte $FF   ; end token



_off022_85F4_00:
_off022_85F4_02:
- D 0 - I - 0x010604 04:85F4: 07        .byte con_buf_mode_07   ; 

- D 0 - I - 0x010605 04:85F5: 21 D3     .dbyt $21D3 ; ppu address
- D 0 - I - 0x010607 04:85F7: 02        .byte $02   ; counter
- D 0 - I - 0x010608 04:85F8: 7A        .byte $7A, $FE   ; tiles

- D 0 - I - 0x01060A 04:85FA: 21 B4     .dbyt $21B4 ; ppu address
- D 0 - I - 0x01060C 04:85FC: 05        .byte $05   ; counter
- D 0 - I - 0x01060D 04:85FD: 79        .byte $79, $25, $32, $7B, $7C   ; tiles

- D 0 - I - 0x010612 04:8602: 21 95     .dbyt $2195 ; ppu address
- D 0 - I - 0x010614 04:8604: 06        .byte $06   ; counter
- D 0 - I - 0x010615 04:8605: 00        .byte $00, $1A, $26, $33, $3E, $7D   ; tiles

- D 0 - I - 0x01061B 04:860B: 21 96     .dbyt $2196 ; ppu address
- D 0 - I - 0x01061D 04:860D: 06        .byte $06   ; counter
- D 0 - I - 0x01061E 04:860E: 00        .byte $00, $00, $27, $34, $3F, $7E   ; tiles

- D 0 - I - 0x010624 04:8614: 21 97     .dbyt $2197 ; ppu address
- D 0 - I - 0x010626 04:8616: 02        .byte $02   ; counter
- D 0 - I - 0x010627 04:8617: 00        .byte $00, $00   ; tiles

- D 0 - I - 0x010629 04:8619: FF        .byte $FF   ; end token



_off022_861A_01:
- D 0 - I - 0x01062A 04:861A: 07        .byte con_buf_mode_07   ; 

- D 0 - I - 0x01062B 04:861B: 21 B4     .dbyt $21B4 ; ppu address
- D 0 - I - 0x01062D 04:861D: 05        .byte $05   ; counter
- D 0 - I - 0x01062E 04:861E: F3        .byte $F3, $F7, $FA, $FC, $7C   ; tiles

- D 0 - I - 0x010633 04:8623: 21 95     .dbyt $2195 ; ppu address
- D 0 - I - 0x010635 04:8625: 06        .byte $06   ; counter
- D 0 - I - 0x010636 04:8626: F0        .byte $F0, $F4, $F8, $FB, $00, $FD   ; tiles

- D 0 - I - 0x01063C 04:862C: 21 96     .dbyt $2196 ; ppu address
- D 0 - I - 0x01063E 04:862E: 06        .byte $06   ; counter
- D 0 - I - 0x01063F 04:862F: F1        .byte $F1, $F5, $F9, $00, $00, $00   ; tiles

- D 0 - I - 0x010645 04:8635: 21 97     .dbyt $2197 ; ppu address
- D 0 - I - 0x010647 04:8637: 02        .byte $02   ; counter
- D 0 - I - 0x010648 04:8638: F2        .byte $F2, $F6   ; tiles

- D 0 - I - 0x01064A 04:863A: FF        .byte $FF   ; end token



_off022_863B_07:
- D 0 - I - 0x01064B 04:863B: 07        .byte con_buf_mode_07   ; 

- D 0 - I - 0x01064C 04:863C: 21 C9     .dbyt $21C9 ; ppu address
- D 0 - I - 0x01064E 04:863E: 04        .byte $04   ; counter
- D 0 - I - 0x01064F 04:863F: 00        .byte $00, $1B, $28, $35   ; tiles

- D 0 - I - 0x010653 04:8643: 21 AA     .dbyt $21AA ; ppu address
- D 0 - I - 0x010655 04:8645: 05        .byte $05   ; counter
- D 0 - I - 0x010656 04:8646: 00        .byte $00, $11, $1C, $29, $36   ; tiles

- D 0 - I - 0x01065B 04:864B: 21 AB     .dbyt $21AB ; ppu address
- D 0 - I - 0x01065D 04:864D: 05        .byte $05   ; counter
- D 0 - I - 0x01065E 04:864E: 07        .byte $07, $12, $1D, $2A, $37   ; tiles

- D 0 - I - 0x010663 04:8653: 21 CC     .dbyt $21CC ; ppu address
- D 0 - I - 0x010665 04:8655: 02        .byte $02   ; counter
- D 0 - I - 0x010666 04:8656: 13        .byte $13, $1E   ; tiles

- D 0 - I - 0x010668 04:8658: FF        .byte $FF   ; end token



_off022_8659_04:
_off022_8659_06:
- D 0 - I - 0x010669 04:8659: 07        .byte con_buf_mode_07   ; 

- D 0 - I - 0x01066A 04:865A: 21 88     .dbyt $2188 ; ppu address
- D 0 - I - 0x01066C 04:865C: 02        .byte $02   ; counter
- D 0 - I - 0x01066D 04:865D: 00        .byte $00, $00   ; tiles

- D 0 - I - 0x01066F 04:865F: 21 89     .dbyt $2189 ; ppu address
- D 0 - I - 0x010671 04:8661: 06        .byte $06   ; counter
- D 0 - I - 0x010672 04:8662: 00        .byte $00, $00, $1B, $28, $35, $68   ; tiles

- D 0 - I - 0x010678 04:8668: 21 8A     .dbyt $218A ; ppu address
- D 0 - I - 0x01067A 04:866A: 06        .byte $06   ; counter
- D 0 - I - 0x01067B 04:866B: 00        .byte $00, $11, $1C, $29, $36, $69   ; tiles

- D 0 - I - 0x010681 04:8671: 21 AB     .dbyt $21AB ; ppu address
- D 0 - I - 0x010683 04:8673: 05        .byte $05   ; counter
- D 0 - I - 0x010684 04:8674: 65        .byte $65, $1D, $2A, $67, $6A   ; tiles

- D 0 - I - 0x010689 04:8679: 21 CC     .dbyt $21CC ; ppu address
- D 0 - I - 0x01068B 04:867B: 02        .byte $02   ; counter
- D 0 - I - 0x01068C 04:867C: 66        .byte $66, $7F   ; tiles

- D 0 - I - 0x01068E 04:867E: FF        .byte $FF   ; end token



_off022_867F_05:
- D 0 - I - 0x01068F 04:867F: 07        .byte con_buf_mode_07   ; 

- D 0 - I - 0x010690 04:8680: 21 88     .dbyt $2188 ; ppu address
- D 0 - I - 0x010692 04:8682: 02        .byte $02   ; counter
- D 0 - I - 0x010693 04:8683: 6B        .byte $6B, $6E   ; tiles

- D 0 - I - 0x010695 04:8685: 21 89     .dbyt $2189 ; ppu address
- D 0 - I - 0x010697 04:8687: 06        .byte $06   ; counter
- D 0 - I - 0x010698 04:8688: 6C        .byte $6C, $6F, $72, $00, $00, $00   ; tiles

- D 0 - I - 0x01069E 04:868E: 21 8A     .dbyt $218A ; ppu address
- D 0 - I - 0x0106A0 04:8690: 06        .byte $06   ; counter
- D 0 - I - 0x0106A1 04:8691: 6D        .byte $6D, $70, $73, $75, $00, $78   ; tiles

- D 0 - I - 0x0106A7 04:8697: 21 AB     .dbyt $21AB ; ppu address
- D 0 - I - 0x0106A9 04:8699: 05        .byte $05   ; counter
- D 0 - I - 0x0106AA 04:869A: 71        .byte $71, $74, $76, $77, $6A   ; tiles

- D 0 - I - 0x0106AF 04:869F: FF        .byte $FF   ; end token



sub_86A0:
C - - - - - 0x0106B0 04:86A0: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x0106B3 04:86A3: B9 DD 86  LDA tbl_86DD,Y
C - - - - - 0x0106B6 04:86A6: 30 34     BMI bra_86DC_RTS
C - - - - - 0x0106B8 04:86A8: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x0106BB 04:86AB: D0 2F     BNE bra_86DC_RTS
C - - - - - 0x0106BD 04:86AD: A9 30     LDA #$30
C - - - - - 0x0106BF 04:86AF: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x0106C2 04:86B2: A0 5A     LDY #con_obj_id_5A
C - - - - - 0x0106C4 04:86B4: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x0106C7 04:86B7: 90 23     BCC bra_86DC_RTS
C - - - - - 0x0106C9 04:86B9: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x0106CC 04:86BC: B9 DD 86  LDA tbl_86DD,Y
C - - - - - 0x0106CF 04:86BF: 85 08     STA ram_0008
C - - - - - 0x0106D1 04:86C1: A8        TAY
C - - - - - 0x0106D2 04:86C2: B9 E5 86  LDA tbl_86E5,Y
C - - - - - 0x0106D5 04:86C5: 18        CLC
C - - - - - 0x0106D6 04:86C6: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x0106D9 04:86C9: A4 11     LDY ram_0011
C - - - - - 0x0106DB 04:86CB: 99 3C 05  STA ram_pos_X_hi_enemy,Y
C - - - - - 0x0106DE 04:86CE: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0106E1 04:86D1: 38        SEC
C - - - - - 0x0106E2 04:86D2: E9 10     SBC #$10
C - - - - - 0x0106E4 04:86D4: 99 22 05  STA ram_pos_Y_hi_enemy,Y
C - - - - - 0x0106E7 04:86D7: A5 08     LDA ram_0008
C - - - - - 0x0106E9 04:86D9: 99 1E 07  STA ram_obj_flags,Y
bra_86DC_RTS:
C - - - - - 0x0106EC 04:86DC: 60        RTS



tbl_86DD:
- D 0 - - - 0x0106ED 04:86DD: 80        .byte $80   ; 00 
- D 0 - - - 0x0106EE 04:86DE: 00        .byte $00   ; 01 
- D 0 - - - 0x0106EF 04:86DF: 80        .byte $80   ; 02 
- D 0 - - - 0x0106F0 04:86E0: C0        .byte $C0   ; 03 
- D 0 - - - 0x0106F1 04:86E1: 80        .byte $80   ; 04 
- D 0 - - - 0x0106F2 04:86E2: 01        .byte $01   ; 05 
- D 0 - - - 0x0106F3 04:86E3: 80        .byte $80   ; 06 
- D 0 - - - 0x0106F4 04:86E4: C0        .byte $C0   ; 07 



tbl_86E5:
; bzk fortunately 0x0106CC reads only correct indexes
- D 0 - - - 0x0106F5 04:86E5: 30        .byte $30   ; 00 
- D 0 - - - 0x0106F6 04:86E6: D0        .byte $D0   ; 01 



sub_86E7:
C - - - - - 0x0106F7 04:86E7: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x0106FA 04:86EA: C9 01     CMP #$01
C - - - - - 0x0106FC 04:86EC: F0 05     BEQ bra_86F3
C - - - - - 0x0106FE 04:86EE: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010701 04:86F1: F0 5D     BEQ bra_8750_RTS
bra_86F3:
C - - - - - 0x010703 04:86F3: A5 5B     LDA ram_005B
C - - - - - 0x010705 04:86F5: 4A        LSR
C - - - - - 0x010706 04:86F6: 90 58     BCC bra_8750_RTS
C - - - - - 0x010708 04:86F8: DE 72 07  DEC ram_0772_obj,X
C - - - - - 0x01070B 04:86FB: D0 53     BNE bra_8750_RTS
C - - - - - 0x01070D 04:86FD: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010710 04:8700: 0A        ASL
C - - - - - 0x010711 04:8701: A8        TAY
C - - - - - 0x010712 04:8702: B9 54 87  LDA tbl_8754,Y
C - - - - - 0x010715 04:8705: 85 08     STA ram_0008
C - - - - - 0x010717 04:8707: B9 55 87  LDA tbl_8754 + $01,Y
C - - - - - 0x01071A 04:870A: 20 A8 85  JSR sub_85A8
C - - - - - 0x01071D 04:870D: FE 1E 07  INC ram_obj_flags,X
C - - - - - 0x010720 04:8710: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010723 04:8713: C9 04     CMP #$04
C - - - - - 0x010725 04:8715: A9 06     LDA #$06
C - - - - - 0x010727 04:8717: 90 07     BCC bra_8720
C - - - - - 0x010729 04:8719: A9 00     LDA #$00
C - - - - - 0x01072B 04:871B: 9D 1E 07  STA ram_obj_flags,X
C - - - - - 0x01072E 04:871E: A9 50     LDA #$50
bra_8720:
C - - - - - 0x010730 04:8720: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x010733 04:8723: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010736 04:8726: C9 02     CMP #$02
C - - - - - 0x010738 04:8728: D0 26     BNE bra_8750_RTS
C - - - - - 0x01073A 04:872A: A9 02     LDA #$02
C - - - - - 0x01073C 04:872C: 85 08     STA ram_0008
bra_872E_loop:
C - - - - - 0x01073E 04:872E: A0 35     LDY #con_obj_id_35
C - - - - - 0x010740 04:8730: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x010743 04:8733: 90 1B     BCC bra_8750_RTS
C - - - - - 0x010745 04:8735: A4 08     LDY ram_0008
C - - - - - 0x010747 04:8737: B9 51 87  LDA tbl_8751_pos_X,Y
C - - - - - 0x01074A 04:873A: 18        CLC
C - - - - - 0x01074B 04:873B: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x01074E 04:873E: A4 11     LDY ram_0011
C - - - - - 0x010750 04:8740: 99 3C 05  STA ram_pos_X_hi_enemy,Y
C - - - - - 0x010753 04:8743: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x010756 04:8746: 18        CLC
C - - - - - 0x010757 04:8747: 69 12     ADC #$12
C - - - - - 0x010759 04:8749: 99 22 05  STA ram_pos_Y_hi_enemy,Y
C - - - - - 0x01075C 04:874C: C6 08     DEC ram_0008
C - - - - - 0x01075E 04:874E: 10 DE     BPL bra_872E_loop
bra_8750_RTS:
C - - - - - 0x010760 04:8750: 60        RTS



tbl_8751_pos_X:
- D 0 - - - 0x010761 04:8751: E0        .byte $E0   ; 00 
- D 0 - - - 0x010762 04:8752: 00        .byte $00   ; 01 
- D 0 - - - 0x010763 04:8753: 20        .byte $20   ; 02 



tbl_8754:
- D 0 - - - 0x010764 04:8754: 7A 87     .word off_877A_00
- D 0 - - - 0x010766 04:8756: 98 87     .word off_8798_01
- D 0 - - - 0x010768 04:8758: 7A 87     .word off_877A_02
- D 0 - - - 0x01076A 04:875A: 5C 87     .word off_875C_03



off_875C_03:
- D 0 - I - 0x01076C 04:875C: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x01076D 04:875D: 22 8A     .dbyt $228A ; ppu address
- D 0 - I - 0x01076F 04:875F: 0C        .byte $0C   ; counter
- D 0 - I - 0x010770 04:8760: 53        .byte $53, $54, $55, $56, $53, $54, $55, $56, $53, $54, $55, $56   ; tiles

- D 0 - I - 0x01077C 04:876C: 22 AB     .dbyt $22AB ; ppu address
- D 0 - I - 0x01077E 04:876E: 0A        .byte $0A   ; counter
- D 0 - I - 0x01077F 04:876F: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; tiles

- D 0 - I - 0x010789 04:8779: FF        .byte $FF   ; end token



off_877A_00:
off_877A_02:
- D 0 - I - 0x01078A 04:877A: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x01078B 04:877B: 22 8A     .dbyt $228A ; ppu address
- D 0 - I - 0x01078D 04:877D: 0C        .byte $0C   ; counter
- D 0 - I - 0x01078E 04:877E: 57        .byte $57, $58, $59, $5A, $57, $58, $59, $5A, $57, $58, $59, $5A   ; tiles

- D 0 - I - 0x01079A 04:878A: 22 AB     .dbyt $22AB ; ppu address
- D 0 - I - 0x01079C 04:878C: 0A        .byte $0A   ; counter
- D 0 - I - 0x01079D 04:878D: 5B        .byte $5B, $5C, $00, $00, $5B, $5C, $00, $00, $5B, $5C   ; tiles

- D 0 - I - 0x0107A7 04:8797: FF        .byte $FF   ; end token



off_8798_01:
- D 0 - I - 0x0107A8 04:8798: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x0107A9 04:8799: 22 8A     .dbyt $228A ; ppu address
- D 0 - I - 0x0107AB 04:879B: 0C        .byte $0C   ; counter
- D 0 - I - 0x0107AC 04:879C: 5D        .byte $5D, $5E, $5F, $60, $5D, $5E, $5F, $60, $5E, $5D, $5F, $60   ; tiles

- D 0 - I - 0x0107B8 04:87A8: 22 AB     .dbyt $22AB ; ppu address
- D 0 - I - 0x0107BA 04:87AA: 0A        .byte $0A   ; counter
- D 0 - I - 0x0107BB 04:87AB: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; tiles

- D 0 - I - 0x0107C5 04:87B5: FF        .byte $FF   ; end token



sub_87B6:
C - - - - - 0x0107C6 04:87B6: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x0107C9 04:87B9: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x0107CC 04:87BC: C4 87     .word ofs_028_87C4_00
- D 0 - I - 0x0107CE 04:87BE: E8 87     .word ofs_028_87E8_01
- D 0 - I - 0x0107D0 04:87C0: F3 87     .word ofs_028_87F3_02
- D 0 - I - 0x0107D2 04:87C2: 06 88     .word ofs_028_8806_03



ofs_028_87C4_00:
C - - J - - 0x0107D4 04:87C4: BD 8E 07  LDA ram_078E_obj,X
C - - - - - 0x0107D7 04:87C7: D0 29     BNE bra_87F2_RTS
C - - - - - 0x0107D9 04:87C9: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0107DC 04:87CC: C9 48     CMP #$48
C - - - - - 0x0107DE 04:87CE: 90 22     BCC bra_87F2_RTS
C - - - - - 0x0107E0 04:87D0: A9 F0     LDA #$F0
C - - - - - 0x0107E2 04:87D2: 20 FF 87  JSR sub_87FF
C - - - - - 0x0107E5 04:87D5: A9 20     LDA #$20
C - - - - - 0x0107E7 04:87D7: 20 99 AB  JSR sub_0x006BA9_set_dynamic_hp_to_boss
C - - - - - 0x0107EA 04:87DA: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0107ED 04:87DD: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0107F0 04:87E0: FE 80 07  INC ram_0780_obj,X
C - - - - - 0x0107F3 04:87E3: A0 02     LDY #$02
C - - - - - 0x0107F5 04:87E5: 4C F9 84  JMP loc_84F9



ofs_028_87E8_01:
C - - J - - 0x0107F8 04:87E8: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x0107FA 04:87EA: 4A        LSR
C - - - - - 0x0107FB 04:87EB: B0 05     BCS bra_87F2_RTS
C - - - - - 0x0107FD 04:87ED: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x010800 04:87F0: F0 10     BEQ bra_8802
bra_87F2_RTS:
C - - - - - 0x010802 04:87F2: 60        RTS



ofs_028_87F3_02:
C - - J - - 0x010803 04:87F3: A9 01     LDA #$01
C - - - - - 0x010805 04:87F5: 20 1D 88  JSR sub_881D
C - - - - - 0x010808 04:87F8: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01080B 04:87FB: C9 A4     CMP #$A4
C - - - - - 0x01080D 04:87FD: 90 F3     BCC bra_87F2_RTS
sub_87FF:
C - - - - - 0x01080F 04:87FF: 9D E6 06  STA ram_06E6_obj,X
bra_8802:
C - - - - - 0x010812 04:8802: FE 64 07  INC ram_0764_obj,X
C - - - - - 0x010815 04:8805: 60        RTS



ofs_028_8806_03:
C - - J - - 0x010816 04:8806: A9 FF     LDA #$FF
C - - - - - 0x010818 04:8808: 20 1D 88  JSR sub_881D
C - - - - - 0x01081B 04:880B: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01081E 04:880E: C9 48     CMP #$48
C - - - - - 0x010820 04:8810: B0 E0     BCS bra_87F2_RTS
C - - - - - 0x010822 04:8812: A9 F0     LDA #$F0
C - - - - - 0x010824 04:8814: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x010827 04:8817: A9 01     LDA #$01
C - - - - - 0x010829 04:8819: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x01082C 04:881C: 60        RTS



sub_881D:
C - - - - - 0x01082D 04:881D: 85 00     STA ram_0000
C - - - - - 0x01082F 04:881F: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x010832 04:8822: 18        CLC
C - - - - - 0x010833 04:8823: 65 00     ADC ram_0000
C - - - - - 0x010835 04:8825: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x010838 04:8828: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01083B 04:882B: 18        CLC
C - - - - - 0x01083C 04:882C: 65 00     ADC ram_0000
C - - - - - 0x01083E 04:882E: 9D 22 05  STA ram_pos_Y_hi_enemy,X
bra_8831_RTS:
C - - - - - 0x010841 04:8831: 60        RTS



sub_8832:
C - - - - - 0x010842 04:8832: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x010845 04:8835: C9 90     CMP #$90
C - - - - - 0x010847 04:8837: B0 F8     BCS bra_8831_RTS
sub_8839:
C - - - - - 0x010849 04:8839: 20 5D A7  JSR sub_0x00676D
C - - - - - 0x01084C 04:883C: 4C 0A AA  JMP loc_0x006A1A


; bzk garbage, same code as 0x0047A9
- - - - - - 0x01084F 04:883F: A9 14     LDA #$14
- - - - - - 0x010851 04:8841: 85 08     STA ram_0008
- - - - - - 0x010853 04:8843: A0 00     LDY #$00
; bzk optimize, check ram_index_ppu_buffer first
- - - - - - 0x010855 04:8845: A6 1E     LDX ram_index_ppu_buffer
- - - - - - 0x010857 04:8847: E0 40     CPX #$40
- - - - - - 0x010859 04:8849: B0 0F     BCS bra_885A
; if buffer is not too loaded
bra_884B_loop:
- - - - - - 0x01085B 04:884B: B9 5D 88  LDA tbl_885D,Y
- - - - - - 0x01085E 04:884E: 9D 00 03  STA ram_nmt_buffer,X
- - - - - - 0x010861 04:8851: E8        INX
- - - - - - 0x010862 04:8852: C8        INY
- - - - - - 0x010863 04:8853: C6 08     DEC ram_0008
- - - - - - 0x010865 04:8855: D0 F4     BNE bra_884B_loop
- - - - - - 0x010867 04:8857: 86 1E     STX ram_index_ppu_buffer
- - - - - - 0x010869 04:8859: 18        CLC
bra_885A:
- - - - - - 0x01086A 04:885A: A6 10     LDX ram_0010
- - - - - - 0x01086C 04:885C: 60        RTS



tbl_885D:
; bzk garbage, same table as 0x015847
- - - - - - 0x01086D 04:885D: 03        .byte con_buf_mode_03   ; 

- - - - - - 0x01086E 04:885E: 23 D8     .dbyt $23D8 ; ppu address
- - - - - - 0x010870 04:8860: 12        .byte $12, $AA   ; counter + fill tile

- - - - - - 0x010872 04:8862: 06        .byte con_buf_mode_06   ; 

- - - - - - 0x010873 04:8863: 23 EA     .dbyt $23EA ; ppu address
- - - - - - 0x010875 04:8865: 05        .byte $05   ; counter
- - - - - - 0x010876 04:8866: AE        .byte $AE, $FA, $FA, $FA, $FA   ; tiles

- - - - - - 0x01087B 04:886B: FF        .byte $FF   ; change mode

- - - - - - 0x01087C 04:886C: 03        .byte con_buf_mode_03   ; 

- - - - - - 0x01087D 04:886D: 23 EF     .dbyt $23EF ; ppu address
- - - - - - 0x01087F 04:886F: 08        .byte $08, $AA   ; counter + fill tile



_off001_0x010881_5D_giant_mouth:
- D 0 - I - 0x010881 04:8871: 7D 88     .word ofs_038_5D_887D_01_initialize_object ; 
- D 0 - I - 0x010883 04:8873: B8 88     .word ofs_038_5D_88B8_02 ; 
- D 0 - I - 0x010885 04:8875: CC 88     .word ofs_038_5D_88CC_03 ; 
- D 0 - I - 0x010887 04:8877: 4E 89     .word ofs_038_5D_894E_04 ; 
- D 0 - I - 0x010889 04:8879: FD A2     .word ofs_038_5D_0x00630D_05 ; 
- D 0 - I - 0x01088B 04:887B: 3D A3     .word ofs_038_5D_0x00634D_06_delete_object_04 ; 



ofs_038_5D_887D_01_initialize_object:
C - - J - - 0x01088D 04:887D: A9 01     LDA #$01
C - - - - - 0x01088F 04:887F: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x010892 04:8882: A9 01     LDA #$01
C - - - - - 0x010894 04:8884: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x010897 04:8887: A9 06     LDA #$06
C - - - - - 0x010899 04:8889: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x01089C 04:888C: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x01089F 04:888F: 4A        LSR
C - - - - - 0x0108A0 04:8890: A9 02     LDA #$02
C - - - - - 0x0108A2 04:8892: 90 14     BCC bra_88A8
C - - - - - 0x0108A4 04:8894: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x0108A7 04:8897: 38        SEC
C - - - - - 0x0108A8 04:8898: E9 08     SBC #$08
C - - - - - 0x0108AA 04:889A: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0108AD 04:889D: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0108B0 04:88A0: 18        CLC
C - - - - - 0x0108B1 04:88A1: 69 08     ADC #$08
C - - - - - 0x0108B3 04:88A3: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0108B6 04:88A6: A9 FF     LDA #$FF
bra_88A8:
C - - - - - 0x0108B8 04:88A8: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x0108BB 04:88AB: A9 01     LDA #$01
C - - - - - 0x0108BD 04:88AD: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x0108C0 04:88B0: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0108C3 04:88B3: A9 01     LDA #$01
C - - - - - 0x0108C5 04:88B5: 4C E0 A2  JMP loc_0x0062F0



ofs_038_5D_88B8_02:
C - - J - - 0x0108C8 04:88B8: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0108CB 04:88BB: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0108CE 04:88BE: 4A        LSR
C - - - - - 0x0108CF 04:88BF: 90 07     BCC bra_88C8
C - - - - - 0x0108D1 04:88C1: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0108D4 04:88C4: C9 28     CMP #$28
C - - - - - 0x0108D6 04:88C6: 90 03     BCC bra_88CB_RTS
bra_88C8:
C - - - - - 0x0108D8 04:88C8: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_88CB_RTS:
C - - - - - 0x0108DB 04:88CB: 60        RTS



ofs_038_5D_88CC_03:
C - - J - - 0x0108DC 04:88CC: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0108DF 04:88CF: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0108E2 04:88D2: D0 70     BNE bra_8944_RTS
C - - - - - 0x0108E4 04:88D4: 20 5E 89  JSR sub_895E
C - - - - - 0x0108E7 04:88D7: A9 01     LDA #$01
C - - - - - 0x0108E9 04:88D9: B0 5D     BCS bra_8938
C - - - - - 0x0108EB 04:88DB: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0108EE 04:88DE: D0 28     BNE bra_8908
C - - - - - 0x0108F0 04:88E0: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x0108F3 04:88E3: BC 22 05  LDY ram_pos_Y_hi_enemy,X
C - - - - - 0x0108F6 04:88E6: C0 C0     CPY #$C0
C - - - - - 0x0108F8 04:88E8: B0 0F     BCS bra_88F9
C - - - - - 0x0108FA 04:88EA: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x0108FD 04:88ED: C9 05     CMP #$05
C - - - - - 0x0108FF 04:88EF: B0 08     BCS bra_88F9
C - - - - - 0x010901 04:88F1: C9 02     CMP #$02
C - - - - - 0x010903 04:88F3: D0 41     BNE bra_8936
C - - - - - 0x010905 04:88F5: A9 1E     LDA #$1E
C - - - - - 0x010907 04:88F7: D0 3F     BNE bra_8938    ; jmp
bra_88F9:
C - - - - - 0x010909 04:88F9: A9 01     LDA #$01
C - - - - - 0x01090B 04:88FB: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01090E 04:88FE: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x010911 04:8901: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x010914 04:8904: A9 0C     LDA #$0C
C - - - - - 0x010916 04:8906: D0 30     BNE bra_8938    ; jmp
bra_8908:
C - - - - - 0x010918 04:8908: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x01091B 04:890B: A9 FF     LDA #$FF
C - - - - - 0x01091D 04:890D: BC 22 05  LDY ram_pos_Y_hi_enemy,X
C - - - - - 0x010920 04:8910: C0 C0     CPY #$C0
C - - - - - 0x010922 04:8912: B0 07     BCS bra_891B
C - - - - - 0x010924 04:8914: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x010927 04:8917: F0 02     BEQ bra_891B
C - - - - - 0x010929 04:8919: A9 01     LDA #$01
bra_891B:
C - - - - - 0x01092B 04:891B: DD 10 07  CMP ram_0710_obj,X
C - - - - - 0x01092E 04:891E: D0 16     BNE bra_8936
C - - - - - 0x010930 04:8920: A8        TAY
C - - - - - 0x010931 04:8921: 30 22     BMI bra_8945
C - - - - - 0x010933 04:8923: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x010936 04:8926: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x010939 04:8929: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x01093C 04:892C: 30 03     BMI bra_8931
C - - - - - 0x01093E 04:892E: DE 56 07  DEC ram_0756_obj,X
bra_8931:
C - - - - - 0x010941 04:8931: A9 00     LDA #$00
C - - - - - 0x010943 04:8933: 9D 48 07  STA ram_0748_obj,X
bra_8936:
C - - - - - 0x010946 04:8936: A9 08     LDA #$08
bra_8938:
C - - - - - 0x010948 04:8938: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x01094B 04:893B: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x01094E 04:893E: B9 48 89  LDA tbl_8948,Y
C - - - - - 0x010951 04:8941: 9D 2C 07  STA ram_072C_obj,X
bra_8944_RTS:
C - - - - - 0x010954 04:8944: 60        RTS
bra_8945:
C - - - - - 0x010955 04:8945: 4C 75 A2  JMP loc_0x006285_delete_object_02



tbl_8948:
- D 0 - - - 0x010958 04:8948: 81        .byte $81   ; 00 
- D 0 - - - 0x010959 04:8949: 01        .byte $01   ; 01 
- D 0 - - - 0x01095A 04:894A: 01        .byte $01   ; 02 
- D 0 - - - 0x01095B 04:894B: 00        .byte $00   ; 03 
- D 0 - - - 0x01095C 04:894C: 00        .byte $00   ; 04 
- - - - - - 0x01095D 04:894D: 81        .byte $81   ; 05 



ofs_038_5D_894E_04:
C - - J - - 0x01095E 04:894E: A9 05     LDA #$05
C - - - - - 0x010960 04:8950: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x010963 04:8953: 20 5E 89  JSR sub_895E
C - - - - - 0x010966 04:8956: B0 03     BCS bra_895B
C - - - - - 0x010968 04:8958: 4C 9A A2  JMP loc_0x0062AA
bra_895B:
C - - - - - 0x01096B 04:895B: 4C B7 A6  JMP loc_0x0066C7_delete_object_03



sub_895E:
C - - - - - 0x01096E 04:895E: A5 1E     LDA ram_index_ppu_buffer
C - - - - - 0x010970 04:8960: C9 20     CMP #$20
C - - - - - 0x010972 04:8962: A9 01     LDA #$01    ; bzk optimize, useless load
C - - - - - 0x010974 04:8964: B0 DE     BCS bra_8944_RTS
C - - - - - 0x010976 04:8966: 20 FF 89  JSR sub_89FF
C - - - - - 0x010979 04:8969: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x01097C 04:896C: 0A        ASL
C - - - - - 0x01097D 04:896D: A8        TAY
C - - - - - 0x01097E 04:896E: B9 2E 8A  LDA tbl_8A2E,Y
C - - - - - 0x010981 04:8971: 85 08     STA ram_0008
C - - - - - 0x010983 04:8973: B9 2F 8A  LDA tbl_8A2E + $01,Y
C - - - - - 0x010986 04:8976: 85 09     STA ram_0009
C - - - - - 0x010988 04:8978: A0 00     LDY #$00
C - - - - - 0x01098A 04:897A: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x01098C 04:897C: A9 06     LDA #con_buf_mode_06
C - - - - - 0x01098E 04:897E: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x010991 04:8981: E8        INX
bra_8982_loop:
C - - - - - 0x010992 04:8982: B1 08     LDA (ram_0008),Y
C - - - - - 0x010994 04:8984: C9 FF     CMP #$FF
C - - - - - 0x010996 04:8986: F0 26     BEQ bra_89AE_FF
C - - - - - 0x010998 04:8988: 18        CLC
C - - - - - 0x010999 04:8989: 65 00     ADC ram_0000    ; ppu hi
C - - - - - 0x01099B 04:898B: 9D 01 03  STA ram_nmt_buffer + $01,X
C - - - - - 0x01099E 04:898E: A5 01     LDA ram_0001    ; ppu lo
C - - - - - 0x0109A0 04:8990: 69 00     ADC #$00
C - - - - - 0x0109A2 04:8992: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0109A5 04:8995: E8        INX
C - - - - - 0x0109A6 04:8996: E8        INX
C - - - - - 0x0109A7 04:8997: C8        INY
C - - - - - 0x0109A8 04:8998: B1 08     LDA (ram_0008),Y
C - - - - - 0x0109AA 04:899A: 85 0A     STA ram_000A    ; counter
C - - - - - 0x0109AC 04:899C: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0109AF 04:899F: E8        INX
C - - - - - 0x0109B0 04:89A0: C8        INY
bra_89A1_loop:
C - - - - - 0x0109B1 04:89A1: B1 08     LDA (ram_0008),Y
C - - - - - 0x0109B3 04:89A3: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0109B6 04:89A6: E8        INX
C - - - - - 0x0109B7 04:89A7: C8        INY
C - - - - - 0x0109B8 04:89A8: C6 0A     DEC ram_000A
C - - - - - 0x0109BA 04:89AA: D0 F5     BNE bra_89A1_loop
C - - - - - 0x0109BC 04:89AC: F0 D4     BEQ bra_8982_loop    ; jmp
bra_89AE_FF:
C - - - - - 0x0109BE 04:89AE: C8        INY
C - - - - - 0x0109BF 04:89AF: A5 00     LDA ram_0000
C - - - - - 0x0109C1 04:89B1: 0A        ASL
C - - - - - 0x0109C2 04:89B2: 26 01     ROL ram_0001
C - - - - - 0x0109C4 04:89B4: 0A        ASL
C - - - - - 0x0109C5 04:89B5: 0A        ASL
C - - - - - 0x0109C6 04:89B6: 46 01     LSR ram_0001
C - - - - - 0x0109C8 04:89B8: 6A        ROR
C - - - - - 0x0109C9 04:89B9: 46 01     LSR ram_0001
C - - - - - 0x0109CB 04:89BB: 6A        ROR
C - - - - - 0x0109CC 04:89BC: 46 01     LSR ram_0001
C - - - - - 0x0109CE 04:89BE: 6A        ROR
C - - - - - 0x0109CF 04:89BF: 4A        LSR
C - - - - - 0x0109D0 04:89C0: 4A        LSR
C - - - - - 0x0109D1 04:89C1: 09 C0     ORA #$C0
C - - - - - 0x0109D3 04:89C3: 85 00     STA ram_0000
C - - - - - 0x0109D5 04:89C5: A9 02     LDA #$02
C - - - - - 0x0109D7 04:89C7: 85 01     STA ram_0001
bra_89C9_loop:
C - - - - - 0x0109D9 04:89C9: A9 23     LDA #$23    ; ppu hi
C - - - - - 0x0109DB 04:89CB: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0109DE 04:89CE: E8        INX
C - - - - - 0x0109DF 04:89CF: A5 00     LDA ram_0000    ; ppu lo
C - - - - - 0x0109E1 04:89D1: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0109E4 04:89D4: E8        INX
C - - - - - 0x0109E5 04:89D5: A9 02     LDA #$02    ; counter
C - - - - - 0x0109E7 04:89D7: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0109EA 04:89DA: 85 02     STA ram_0002
C - - - - - 0x0109EC 04:89DC: E8        INX
bra_89DD_loop:
C - - - - - 0x0109ED 04:89DD: B1 08     LDA (ram_0008),Y
C - - - - - 0x0109EF 04:89DF: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0109F2 04:89E2: E8        INX
C - - - - - 0x0109F3 04:89E3: C8        INY
C - - - - - 0x0109F4 04:89E4: C6 02     DEC ram_0002
C - - - - - 0x0109F6 04:89E6: D0 F5     BNE bra_89DD_loop
C - - - - - 0x0109F8 04:89E8: A5 00     LDA ram_0000
C - - - - - 0x0109FA 04:89EA: 18        CLC
C - - - - - 0x0109FB 04:89EB: 69 08     ADC #$08
C - - - - - 0x0109FD 04:89ED: 85 00     STA ram_0000
C - - - - - 0x0109FF 04:89EF: C6 01     DEC ram_0001
C - - - - - 0x010A01 04:89F1: D0 D6     BNE bra_89C9_loop
; close buffer
C - - - - - 0x010A03 04:89F3: A9 FF     LDA #$FF
C - - - - - 0x010A05 04:89F5: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x010A08 04:89F8: E8        INX
C - - - - - 0x010A09 04:89F9: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x010A0B 04:89FB: A6 10     LDX ram_0010
C - - - - - 0x010A0D 04:89FD: 18        CLC
C - - - - - 0x010A0E 04:89FE: 60        RTS



sub_89FF:
C - - - - - 0x010A0F 04:89FF: A9 08     LDA #$08
C - - - - - 0x010A11 04:8A01: 85 01     STA ram_0001
C - - - - - 0x010A13 04:8A03: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x010A16 04:8A06: 38        SEC
C - - - - - 0x010A17 04:8A07: E9 10     SBC #$10
C - - - - - 0x010A19 04:8A09: 18        CLC
C - - - - - 0x010A1A 04:8A0A: 65 FC     ADC ram_scroll_Y
C - - - - - 0x010A1C 04:8A0C: B0 04     BCS bra_8A12
C - - - - - 0x010A1E 04:8A0E: C9 F0     CMP #$F0
C - - - - - 0x010A20 04:8A10: 90 02     BCC bra_8A14
bra_8A12:
C - - - - - 0x010A22 04:8A12: 69 0F     ADC #$0F
bra_8A14:
C - - - - - 0x010A24 04:8A14: 29 E0     AND #$E0
C - - - - - 0x010A26 04:8A16: 0A        ASL
C - - - - - 0x010A27 04:8A17: 26 01     ROL ram_0001
C - - - - - 0x010A29 04:8A19: 0A        ASL
C - - - - - 0x010A2A 04:8A1A: 26 01     ROL ram_0001
C - - - - - 0x010A2C 04:8A1C: 85 02     STA ram_0002
C - - - - - 0x010A2E 04:8A1E: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x010A31 04:8A21: 38        SEC
C - - - - - 0x010A32 04:8A22: E9 10     SBC #$10
C - - - - - 0x010A34 04:8A24: 4A        LSR
C - - - - - 0x010A35 04:8A25: 4A        LSR
C - - - - - 0x010A36 04:8A26: 4A        LSR
C - - - - - 0x010A37 04:8A27: 29 1C     AND #$1C
C - - - - - 0x010A39 04:8A29: 05 02     ORA ram_0002
C - - - - - 0x010A3B 04:8A2B: 85 00     STA ram_0000
C - - - - - 0x010A3D 04:8A2D: 60        RTS



tbl_8A2E:
- D 0 - - - 0x010A3E 04:8A2E: 3A 8A     .word _off023_8A3A_00
- D 0 - - - 0x010A40 04:8A30: 47 8A     .word _off023_8A47_01
- D 0 - - - 0x010A42 04:8A32: 60 8A     .word _off023_8A60_02
- D 0 - - - 0x010A44 04:8A34: 81 8A     .word _off023_8A81_03
- D 0 - - - 0x010A46 04:8A36: B2 8A     .word _off023_8AB2_04
- D 0 - - - 0x010A48 04:8A38: E3 8A     .word _off023_8AE3_05



_off023_8A3A_00:
- D 0 - I - 0x010A4A 04:8A3A: 63        .byte $63   ; ppu address offset
- D 0 - I - 0x010A4B 04:8A3B: 02        .byte $02   ; counter
- D 0 - I - 0x010A4C 04:8A3C: 09        .byte $09, $0B   ; tiles

- D 0 - I - 0x010A4E 04:8A3E: 83        .byte $83   ; ppu address offset
- D 0 - I - 0x010A4F 04:8A3F: 02        .byte $02   ; counter
- D 0 - I - 0x010A50 04:8A40: 47        .byte $47, $0B   ; tiles

- D 0 - I - 0x010A52 04:8A42: FF        .byte $FF   ; end token + last 4 tiles
- D 0 - I - 0x010A53 04:8A43: 00        .byte $00, $00   ; 
- D 0 - I - 0x010A55 04:8A45: 00        .byte $00, $00   ; 



_off023_8A47_01:
- D 0 - I - 0x010A57 04:8A47: 43        .byte $43   ; ppu address offset
- D 0 - I - 0x010A58 04:8A48: 02        .byte $02   ; counter
- D 0 - I - 0x010A59 04:8A49: 0C        .byte $0C, $0A   ; tiles

- D 0 - I - 0x010A5B 04:8A4B: 62        .byte $62   ; ppu address offset
- D 0 - I - 0x010A5C 04:8A4C: 04        .byte $04   ; counter
- D 0 - I - 0x010A5D 04:8A4D: 0A        .byte $0A, $88, $89, $0C   ; tiles

- D 0 - I - 0x010A61 04:8A51: 82        .byte $82   ; ppu address offset
- D 0 - I - 0x010A62 04:8A52: 04        .byte $04   ; counter
- D 0 - I - 0x010A63 04:8A53: 0A        .byte $0A, $8A, $8B, $0C   ; tiles

- D 0 - I - 0x010A67 04:8A57: A3        .byte $A3   ; ppu address offset
- D 0 - I - 0x010A68 04:8A58: 02        .byte $02   ; counter
- D 0 - I - 0x010A69 04:8A59: 0C        .byte $0C, $0A   ; tiles

- D 0 - I - 0x010A6B 04:8A5B: FF        .byte $FF   ; end token + last 4 tiles
- D 0 - I - 0x010A6C 04:8A5C: 00        .byte $00, $00   ; 
- D 0 - I - 0x010A6E 04:8A5E: 00        .byte $00, $00   ; 



_off023_8A60_02:
- D 0 - I - 0x010A70 04:8A60: 42        .byte $42   ; ppu address offset
- D 0 - I - 0x010A71 04:8A61: 04        .byte $04   ; counter
- D 0 - I - 0x010A72 04:8A62: 0B        .byte $0B, $8C, $8D, $47   ; tiles

- D 0 - I - 0x010A76 04:8A66: 61        .byte $61   ; ppu address offset
- D 0 - I - 0x010A77 04:8A67: 06        .byte $06   ; counter
- D 0 - I - 0x010A78 04:8A68: 0C        .byte $0C, $8E, $8F, $90, $91, $0A   ; tiles

- D 0 - I - 0x010A7E 04:8A6E: 81        .byte $81   ; ppu address offset
- D 0 - I - 0x010A7F 04:8A6F: 06        .byte $06   ; counter
- D 0 - I - 0x010A80 04:8A70: 0C        .byte $0C, $92, $93, $94, $95, $0A   ; tiles

- D 0 - I - 0x010A86 04:8A76: A2        .byte $A2   ; ppu address offset
- D 0 - I - 0x010A87 04:8A77: 04        .byte $04   ; counter
- D 0 - I - 0x010A88 04:8A78: 0B        .byte $0B, $96, $97, $09   ; tiles

- D 0 - I - 0x010A8C 04:8A7C: FF        .byte $FF   ; end token + last 4 tiles
- D 0 - I - 0x010A8D 04:8A7D: 00        .byte $00, $00   ; 
- D 0 - I - 0x010A8F 04:8A7F: 00        .byte $00, $00   ; 



_off023_8A81_03:
- D 0 - I - 0x010A91 04:8A81: 22        .byte $22   ; ppu address offset
- D 0 - I - 0x010A92 04:8A82: 04        .byte $04   ; counter
- D 0 - I - 0x010A93 04:8A83: 0B        .byte $0B, $0C, $0A, $09   ; tiles

- D 0 - I - 0x010A97 04:8A87: 41        .byte $41   ; ppu address offset
- D 0 - I - 0x010A98 04:8A88: 06        .byte $06   ; counter
- D 0 - I - 0x010A99 04:8A89: 47        .byte $47, $98, $99, $9A, $9B, $0B   ; tiles

- D 0 - I - 0x010A9F 04:8A8F: 61        .byte $61   ; ppu address offset
- D 0 - I - 0x010AA0 04:8A90: 06        .byte $06   ; counter
- D 0 - I - 0x010AA1 04:8A91: 9C        .byte $9C, $9D, $9E, $9F, $A0, $A1   ; tiles

- D 0 - I - 0x010AA7 04:8A97: 81        .byte $81   ; ppu address offset
- D 0 - I - 0x010AA8 04:8A98: 06        .byte $06   ; counter
- D 0 - I - 0x010AA9 04:8A99: A2        .byte $A2, $A3, $A4, $A5, $A6, $A7   ; tiles

- D 0 - I - 0x010AAF 04:8A9F: A1        .byte $A1   ; ppu address offset
- D 0 - I - 0x010AB0 04:8AA0: 06        .byte $06   ; counter
- D 0 - I - 0x010AB1 04:8AA1: 09        .byte $09, $A8, $A9, $AA, $AB, $0B   ; tiles

- D 0 - I - 0x010AB7 04:8AA7: C2        .byte $C2   ; ppu address offset
- D 0 - I - 0x010AB8 04:8AA8: 04        .byte $04   ; counter
- D 0 - I - 0x010AB9 04:8AA9: 0B        .byte $0B, $0C, $0A, $47   ; tiles

- D 0 - I - 0x010ABD 04:8AAD: FF        .byte $FF   ; end token + last 4 tiles
- D 0 - I - 0x010ABE 04:8AAE: 80        .byte $80, $20   ; 
- D 0 - I - 0x010AC0 04:8AB0: 08        .byte $08, $02   ; 



_off023_8AB2_04:
- D 0 - I - 0x010AC2 04:8AB2: 22        .byte $22   ; ppu address offset
- D 0 - I - 0x010AC3 04:8AB3: 04        .byte $04   ; counter
- D 0 - I - 0x010AC4 04:8AB4: AC        .byte $AC, $AD, $AE, $AF   ; tiles

- D 0 - I - 0x010AC8 04:8AB8: 41        .byte $41   ; ppu address offset
- D 0 - I - 0x010AC9 04:8AB9: 06        .byte $06   ; counter
- D 0 - I - 0x010ACA 04:8ABA: B0        .byte $B0, $B1, $B2, $B3, $B4, $B5   ; tiles

- D 0 - I - 0x010AD0 04:8AC0: 61        .byte $61   ; ppu address offset
- D 0 - I - 0x010AD1 04:8AC1: 06        .byte $06   ; counter
- D 0 - I - 0x010AD2 04:8AC2: B6        .byte $B6, $B7, $B8, $B9, $BA, $BB   ; tiles

- D 0 - I - 0x010AD8 04:8AC8: 81        .byte $81   ; ppu address offset
- D 0 - I - 0x010AD9 04:8AC9: 06        .byte $06   ; counter
- D 0 - I - 0x010ADA 04:8ACA: BC        .byte $BC, $BD, $BE, $BF, $C0, $C1   ; tiles

- D 0 - I - 0x010AE0 04:8AD0: A1        .byte $A1   ; ppu address offset
- D 0 - I - 0x010AE1 04:8AD1: 06        .byte $06   ; counter
- D 0 - I - 0x010AE2 04:8AD2: C2        .byte $C2, $C3, $C4, $C5, $C6, $C7   ; tiles

- D 0 - I - 0x010AE8 04:8AD8: C2        .byte $C2   ; ppu address offset
- D 0 - I - 0x010AE9 04:8AD9: 04        .byte $04   ; counter
- D 0 - I - 0x010AEA 04:8ADA: C8        .byte $C8, $C9, $CA, $CB   ; tiles

- D 0 - I - 0x010AEE 04:8ADE: FF        .byte $FF   ; end token + last 4 tiles
- D 0 - I - 0x010AEF 04:8ADF: 80        .byte $80, $20   ; 
- D 0 - I - 0x010AF1 04:8AE1: 08        .byte $08, $02   ; 



_off023_8AE3_05:
- D 0 - I - 0x010AF3 04:8AE3: 22        .byte $22   ; ppu address offset
- D 0 - I - 0x010AF4 04:8AE4: 04        .byte $04   ; counter
- D 0 - I - 0x010AF5 04:8AE5: 0B        .byte $0B, $0C, $0A, $09   ; tiles

- D 0 - I - 0x010AF9 04:8AE9: 41        .byte $41   ; ppu address offset
- D 0 - I - 0x010AFA 04:8AEA: 06        .byte $06   ; counter
- D 0 - I - 0x010AFB 04:8AEB: 47        .byte $47, $0B, $0C, $0A, $47, $0B   ; tiles

- D 0 - I - 0x010B01 04:8AF1: 61        .byte $61   ; ppu address offset
- D 0 - I - 0x010B02 04:8AF2: 06        .byte $06   ; counter
- D 0 - I - 0x010B03 04:8AF3: 0C        .byte $0C, $0A, $09, $0B, $0C, $0A   ; tiles

- D 0 - I - 0x010B09 04:8AF9: 81        .byte $81   ; ppu address offset
- D 0 - I - 0x010B0A 04:8AFA: 06        .byte $06   ; counter
- D 0 - I - 0x010B0B 04:8AFB: 0C        .byte $0C, $0A, $47, $0B, $0C, $0A   ; tiles

- D 0 - I - 0x010B11 04:8B01: A1        .byte $A1   ; ppu address offset
- D 0 - I - 0x010B12 04:8B02: 06        .byte $06   ; counter
- D 0 - I - 0x010B13 04:8B03: 09        .byte $09, $0B, $0C, $0A, $09, $0B   ; tiles

- D 0 - I - 0x010B19 04:8B09: C2        .byte $C2   ; ppu address offset
- D 0 - I - 0x010B1A 04:8B0A: 04        .byte $04   ; counter
- D 0 - I - 0x010B1B 04:8B0B: 0B        .byte $0B, $0C, $0B, $0C   ; tiles

- D 0 - I - 0x010B1F 04:8B0F: FF        .byte $FF   ; end token + last 4 tiles
- D 0 - I - 0x010B20 04:8B10: 00        .byte $00, $00   ; 
- D 0 - I - 0x010B22 04:8B12: 00        .byte $00, $00   ; 



_off001_0x010B24_5E_spawner_giant_mouths:
- D 0 - I - 0x010B24 04:8B14: 18 8B     .word ofs_038_5E_8B18_01_initialize_object ; 
- D 0 - I - 0x010B26 04:8B16: 22 8B     .word ofs_038_5E_8B22_02 ; 



ofs_038_5E_8B18_01_initialize_object:
C - - J - - 0x010B28 04:8B18: A9 F0     LDA #con__hp_F0
C - - - - - 0x010B2A 04:8B1A: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x010B2D 04:8B1D: A9 01     LDA #$01
C - - - - - 0x010B2F 04:8B1F: 4C E0 A2  JMP loc_0x0062F0



ofs_038_5E_8B22_02:
C - - J - - 0x010B32 04:8B22: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x010B35 04:8B25: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x010B38 04:8B28: C9 E0     CMP #$E0
C - - - - - 0x010B3A 04:8B2A: 90 11     BCC bra_8B3D
C - - - - - 0x010B3C 04:8B2C: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x010B3F 04:8B2F: 30 31     BMI bra_8B62
C - - - - - 0x010B41 04:8B31: B9 65 8B  LDA tbl_8B65,Y
C - - - - - 0x010B44 04:8B34: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x010B47 04:8B37: B9 68 8B  LDA tbl_8B68,Y
C - - - - - 0x010B4A 04:8B3A: 9D 22 05  STA ram_pos_Y_hi_enemy,X
bra_8B3D:
C - - - - - 0x010B4D 04:8B3D: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x010B50 04:8B40: D0 1F     BNE bra_8B61_RTS
C - - - - - 0x010B52 04:8B42: 20 6B 8B  JSR sub_8B6B
C - - - - - 0x010B55 04:8B45: A9 01     LDA #$01
C - - - - - 0x010B57 04:8B47: B0 15     BCS bra_8B5E
C - - - - - 0x010B59 04:8B49: A0 5D     LDY #con_obj_id_5D
C - - - - - 0x010B5B 04:8B4B: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x010B5E 04:8B4E: 90 0E     BCC bra_8B5E
C - - - - - 0x010B60 04:8B50: A4 11     LDY ram_0011
C - - - - - 0x010B62 04:8B52: A5 08     LDA ram_0008
C - - - - - 0x010B64 04:8B54: 99 22 05  STA ram_pos_Y_hi_enemy,Y
C - - - - - 0x010B67 04:8B57: A5 09     LDA ram_0009
C - - - - - 0x010B69 04:8B59: 99 3C 05  STA ram_pos_X_hi_enemy,Y
C - - - - - 0x010B6C 04:8B5C: A9 47     LDA #$47
bra_8B5E:
C - - - - - 0x010B6E 04:8B5E: 9D E6 06  STA ram_06E6_obj,X
bra_8B61_RTS:
C - - - - - 0x010B71 04:8B61: 60        RTS
bra_8B62:
C - - - - - 0x010B72 04:8B62: 4C 75 A2  JMP loc_0x006285_delete_object_02



tbl_8B65:
- D 0 - - - 0x010B75 04:8B65: 01        .byte $01   ; 00 
- D 0 - - - 0x010B76 04:8B66: 02        .byte $02   ; 01 
- D 0 - - - 0x010B77 04:8B67: 80        .byte $80   ; 02 



tbl_8B68:
- D 0 - - - 0x010B78 04:8B68: 00        .byte $00   ; 00 
- D 0 - - - 0x010B79 04:8B69: C0        .byte $C0   ; 01 
- D 0 - - - 0x010B7A 04:8B6A: 00        .byte $00   ; 02 



sub_8B6B:
C - - - - - 0x010B7B 04:8B6B: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x010B7D 04:8B6D: 4A        LSR
C - - - - - 0x010B7E 04:8B6E: 29 07     AND #$07
C - - - - - 0x010B80 04:8B70: A8        TAY
C - - - - - 0x010B81 04:8B71: B9 31 8C  LDA tbl_8C31,Y
C - - - - - 0x010B84 04:8B74: 85 09     STA ram_0009
C - - - - - 0x010B86 04:8B76: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x010B88 04:8B78: 65 5B     ADC ram_005B
C - - - - - 0x010B8A 04:8B7A: 4A        LSR
C - - - - - 0x010B8B 04:8B7B: 4A        LSR
C - - - - - 0x010B8C 04:8B7C: 4A        LSR
C - - - - - 0x010B8D 04:8B7D: 29 07     AND #$07
C - - - - - 0x010B8F 04:8B7F: A8        TAY
C - - - - - 0x010B90 04:8B80: B9 29 8C  LDA tbl_8C29,Y
C - - - - - 0x010B93 04:8B83: 85 08     STA ram_0008
C - - - - - 0x010B95 04:8B85: FE 48 07  INC ram_0748_obj,X
C - - - - - 0x010B98 04:8B88: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x010B9B 04:8B8B: 29 01     AND #$01
C - - - - - 0x010B9D 04:8B8D: A8        TAY
C - - - - - 0x010B9E 04:8B8E: B9 CA 00  LDA ram_plr_game_over,Y
C - - - - - 0x010BA1 04:8B91: F0 03     BEQ bra_8B96
C - - - - - 0x010BA3 04:8B93: 49 01     EOR #$01
C - - - - - 0x010BA5 04:8B95: A8        TAY
bra_8B96:
C - - - - - 0x010BA6 04:8B96: B9 4C 05  LDA ram_pos_X_hi_plr,Y
C - - - - - 0x010BA9 04:8B99: 18        CLC
C - - - - - 0x010BAA 04:8B9A: 65 09     ADC ram_0009
C - - - - - 0x010BAC 04:8B9C: C9 20     CMP #$20
C - - - - - 0x010BAE 04:8B9E: 90 04     BCC bra_8BA4
C - - - - - 0x010BB0 04:8BA0: C9 E0     CMP #$E0
C - - - - - 0x010BB2 04:8BA2: 90 09     BCC bra_8BAD
bra_8BA4:
C - - - - - 0x010BB4 04:8BA4: A9 00     LDA #$00
C - - - - - 0x010BB6 04:8BA6: 38        SEC
C - - - - - 0x010BB7 04:8BA7: E5 09     SBC ram_0009
C - - - - - 0x010BB9 04:8BA9: 18        CLC
C - - - - - 0x010BBA 04:8BAA: 79 4C 05  ADC ram_pos_X_hi_plr,Y
bra_8BAD:
C - - - - - 0x010BBD 04:8BAD: 29 E0     AND #$E0
C - - - - - 0x010BBF 04:8BAF: 85 09     STA ram_0009
C - - - - - 0x010BC1 04:8BB1: B9 32 05  LDA ram_pos_Y_hi_plr,Y
C - - - - - 0x010BC4 04:8BB4: 18        CLC
C - - - - - 0x010BC5 04:8BB5: 65 08     ADC ram_0008
C - - - - - 0x010BC7 04:8BB7: C9 E0     CMP #$E0
C - - - - - 0x010BC9 04:8BB9: B0 04     BCS bra_8BBF
C - - - - - 0x010BCB 04:8BBB: C9 38     CMP #$38
C - - - - - 0x010BCD 04:8BBD: B0 06     BCS bra_8BC5
bra_8BBF:
C - - - - - 0x010BCF 04:8BBF: B9 32 05  LDA ram_pos_Y_hi_plr,Y
C - - - - - 0x010BD2 04:8BC2: 38        SEC
C - - - - - 0x010BD3 04:8BC3: E5 08     SBC ram_0008
bra_8BC5:
C - - - - - 0x010BD5 04:8BC5: 20 39 8C  JSR sub_8C39
C - - - - - 0x010BD8 04:8BC8: 29 E0     AND #$E0
C - - - - - 0x010BDA 04:8BCA: 85 08     STA ram_0008
C - - - - - 0x010BDC 04:8BCC: C9 10     CMP #$10
C - - - - - 0x010BDE 04:8BCE: 90 04     BCC bra_8BD4
C - - - - - 0x010BE0 04:8BD0: C9 E0     CMP #$E0
C - - - - - 0x010BE2 04:8BD2: 90 09     BCC bra_8BDD
bra_8BD4:
C - - - - - 0x010BE4 04:8BD4: A5 0A     LDA ram_000A
C - - - - - 0x010BE6 04:8BD6: 0A        ASL
C - - - - - 0x010BE7 04:8BD7: A9 20     LDA #$20
C - - - - - 0x010BE9 04:8BD9: 90 02     BCC bra_8BDD
C - - - - - 0x010BEB 04:8BDB: A9 C0     LDA #$C0
bra_8BDD:
C - - - - - 0x010BED 04:8BDD: 85 0B     STA ram_000B
C - - - - - 0x010BEF 04:8BDF: 38        SEC
C - - - - - 0x010BF0 04:8BE0: E5 FC     SBC ram_scroll_Y
C - - - - - 0x010BF2 04:8BE2: 90 04     BCC bra_8BE8
C - - - - - 0x010BF4 04:8BE4: C9 F0     CMP #$F0
C - - - - - 0x010BF6 04:8BE6: 90 03     BCC bra_8BEB
bra_8BE8:
C - - - - - 0x010BF8 04:8BE8: 38        SEC
C - - - - - 0x010BF9 04:8BE9: E9 10     SBC #$10
bra_8BEB:
C - - - - - 0x010BFB 04:8BEB: 85 08     STA ram_0008
C - - - - - 0x010BFD 04:8BED: C9 18     CMP #$18
C - - - - - 0x010BFF 04:8BEF: 90 13     BCC bra_8C04
C - - - - - 0x010C01 04:8BF1: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x010C04 04:8BF4: 30 02     BMI bra_8BF8
C - - - - - 0x010C06 04:8BF6: D0 09     BNE bra_8C01
bra_8BF8:
C - - - - - 0x010C08 04:8BF8: DD 22 05  CMP ram_pos_Y_hi_enemy,X
C - - - - - 0x010C0B 04:8BFB: 6A        ROR
C - - - - - 0x010C0C 04:8BFC: 5D 56 07  EOR ram_0756_obj,X
C - - - - - 0x010C0F 04:8BFF: 30 03     BMI bra_8C04
bra_8C01:
C - - - - - 0x010C11 04:8C01: 4C 06 8C  JMP loc_8C06
bra_8C04:
C - - - - - 0x010C14 04:8C04: 38        SEC
C - - - - - 0x010C15 04:8C05: 60        RTS



loc_8C06:
C D 0 - - - 0x010C16 04:8C06: A0 0D     LDY #$0D
bra_8C08_loop:
C - - - - - 0x010C18 04:8C08: B9 D8 06  LDA ram_obj_id,Y
C - - - - - 0x010C1B 04:8C0B: C9 5D     CMP #con_obj_id_5D
C - - - - - 0x010C1D 04:8C0D: D0 15     BNE bra_8C24
C - - - - - 0x010C1F 04:8C0F: B9 22 05  LDA ram_pos_Y_hi_enemy,Y
C - - - - - 0x010C22 04:8C12: 20 39 8C  JSR sub_8C39
C - - - - - 0x010C25 04:8C15: 29 E0     AND #$E0
C - - - - - 0x010C27 04:8C17: C5 0B     CMP ram_000B
C - - - - - 0x010C29 04:8C19: D0 09     BNE bra_8C24
C - - - - - 0x010C2B 04:8C1B: B9 3C 05  LDA ram_pos_X_hi_enemy,Y
C - - - - - 0x010C2E 04:8C1E: 29 E0     AND #$E0
C - - - - - 0x010C30 04:8C20: C5 09     CMP ram_0009
C - - - - - 0x010C32 04:8C22: F0 E0     BEQ bra_8C04
bra_8C24:
C - - - - - 0x010C34 04:8C24: 88        DEY
C - - - - - 0x010C35 04:8C25: 10 E1     BPL bra_8C08_loop
C - - - - - 0x010C37 04:8C27: 18        CLC
C - - - - - 0x010C38 04:8C28: 60        RTS



tbl_8C29:
- D 0 - - - 0x010C39 04:8C29: E0        .byte $E0   ; 00 
- D 0 - - - 0x010C3A 04:8C2A: C0        .byte $C0   ; 08 
- D 0 - - - 0x010C3B 04:8C2B: 00        .byte $00   ; 10 
- D 0 - - - 0x010C3C 04:8C2C: A0        .byte $A0   ; 18 
- D 0 - - - 0x010C3D 04:8C2D: E0        .byte $E0   ; 20 
- D 0 - - - 0x010C3E 04:8C2E: 00        .byte $00   ; 28 
- D 0 - - - 0x010C3F 04:8C2F: 20        .byte $20   ; 30 
- D 0 - - - 0x010C40 04:8C30: C0        .byte $C0   ; 38 



tbl_8C31:
- D 0 - - - 0x010C41 04:8C31: 00        .byte $00   ; 00 
- D 0 - - - 0x010C42 04:8C32: 20        .byte $20   ; 02 
- D 0 - - - 0x010C43 04:8C33: 40        .byte $40   ; 04 
- D 0 - - - 0x010C44 04:8C34: 60        .byte $60   ; 06 
- D 0 - - - 0x010C45 04:8C35: 00        .byte $00   ; 08 
- D 0 - - - 0x010C46 04:8C36: E0        .byte $E0   ; 0A 
- D 0 - - - 0x010C47 04:8C37: C0        .byte $C0   ; 0C 
- D 0 - - - 0x010C48 04:8C38: A0        .byte $A0   ; 0E 



sub_8C39:
C - - - - - 0x010C49 04:8C39: 18        CLC
C - - - - - 0x010C4A 04:8C3A: 65 FC     ADC ram_scroll_Y
C - - - - - 0x010C4C 04:8C3C: B0 04     BCS bra_8C42
C - - - - - 0x010C4E 04:8C3E: C9 F0     CMP #$F0
C - - - - - 0x010C50 04:8C40: 90 02     BCC bra_8C44_RTS
bra_8C42:
C - - - - - 0x010C52 04:8C42: 69 0F     ADC #$0F
bra_8C44_RTS:
C - - - - - 0x010C54 04:8C44: 60        RTS



_off001_0x010C55_5F_red_skull_head:
- D 0 - I - 0x010C55 04:8C45: 53 8C     .word ofs_038_5F_8C53_01_initialize_object ; 
- D 0 - I - 0x010C57 04:8C47: 8F 8C     .word ofs_038_5F_8C8F_02 ; 
- D 0 - I - 0x010C59 04:8C49: F0 8C     .word ofs_038_5F_8CF0_03 ; 
- D 0 - I - 0x010C5B 04:8C4B: 27 8E     .word ofs_038_5F_8E27_04 ; 
- D 0 - I - 0x010C5D 04:8C4D: 9A A2     .word ofs_038_5F_0x0062AA_05 ; 
- D 0 - I - 0x010C5F 04:8C4F: FD A2     .word ofs_038_5F_0x00630D_06 ; 
- D 0 - I - 0x010C61 04:8C51: 3D A3     .word ofs_038_5F_0x00634D_07_delete_object_04 ; 



ofs_038_5F_8C53_01_initialize_object:
C - - J - - 0x010C63 04:8C53: A9 08     LDA #$08
C - - - - - 0x010C65 04:8C55: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x010C68 04:8C58: A9 02     LDA #$02
C - - - - - 0x010C6A 04:8C5A: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x010C6D 04:8C5D: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010C70 04:8C60: 4A        LSR
C - - - - - 0x010C71 04:8C61: 90 05     BCC bra_8C68
C - - - - - 0x010C73 04:8C63: A9 D0     LDA #$D0
C - - - - - 0x010C75 04:8C65: 9D 22 05  STA ram_pos_Y_hi_enemy,X
bra_8C68:
C - - - - - 0x010C78 04:8C68: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x010C7B 04:8C6B: 98        TYA
C - - - - - 0x010C7C 04:8C6C: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x010C7F 04:8C6F: B9 32 05  LDA ram_pos_Y_hi_plr,Y
C - - - - - 0x010C82 04:8C72: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x010C85 04:8C75: B9 4C 05  LDA ram_pos_X_hi_plr,Y
C - - - - - 0x010C88 04:8C78: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x010C8B 04:8C7B: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010C8E 04:8C7E: 0A        ASL
C - - - - - 0x010C8F 04:8C7F: A8        TAY
C - - - - - 0x010C90 04:8C80: B9 E6 8C  LDA tbl_8CE6_spd_Y,Y
C - - - - - 0x010C93 04:8C83: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x010C96 04:8C86: B9 E7 8C  LDA tbl_8CE6_spd_Y + $01,Y
C - - - - - 0x010C99 04:8C89: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x010C9C 04:8C8C: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_5F_8C8F_02:
C - - J - - 0x010C9F 04:8C8F: A9 84     LDA #$84
C - - - - - 0x010CA1 04:8C91: BC AE 06  LDY ram_spd_Y_hi_obj,X
C - - - - - 0x010CA4 04:8C94: 10 02     BPL bra_8C98
C - - - - - 0x010CA6 04:8C96: A9 88     LDA #$88
bra_8C98:
C - - - - - 0x010CA8 04:8C98: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x010CAB 04:8C9B: A9 03     LDA #$03
C - - - - - 0x010CAD 04:8C9D: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x010CB0 04:8CA0: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x010CB3 04:8CA3: 20 57 8E  JSR sub_8E57
C - - - - - 0x010CB6 04:8CA6: A0 00     LDY #$00
C - - - - - 0x010CB8 04:8CA8: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x010CBB 04:8CAB: C5 09     CMP ram_0009
C - - - - - 0x010CBD 04:8CAD: F0 06     BEQ bra_8CB5
C - - - - - 0x010CBF 04:8CAF: A0 02     LDY #$02
C - - - - - 0x010CC1 04:8CB1: 90 02     BCC bra_8CB5
C - - - - - 0x010CC3 04:8CB3: A0 04     LDY #$04
bra_8CB5:
C - - - - - 0x010CC5 04:8CB5: B9 EA 8C  LDA tbl_8CEA_spd_X,Y
C - - - - - 0x010CC8 04:8CB8: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x010CCB 04:8CBB: B9 EB 8C  LDA tbl_8CEA_spd_X + $01,Y
C - - - - - 0x010CCE 04:8CBE: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x010CD1 04:8CC1: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x010CD4 04:8CC4: 38        SEC
C - - - - - 0x010CD5 04:8CC5: E5 08     SBC ram_0008
C - - - - - 0x010CD7 04:8CC7: B0 04     BCS bra_8CCD
C - - - - - 0x010CD9 04:8CC9: 49 FF     EOR #$FF
C - - - - - 0x010CDB 04:8CCB: 69 01     ADC #$01
bra_8CCD:
C - - - - - 0x010CDD 04:8CCD: C9 38     CMP #$38
C - - - - - 0x010CDF 04:8CCF: B0 14     BCS bra_8CE5_RTS
C - - - - - 0x010CE1 04:8CD1: A9 60     LDA #$60
C - - - - - 0x010CE3 04:8CD3: BC AE 06  LDY ram_spd_Y_hi_obj,X
C - - - - - 0x010CE6 04:8CD6: 10 02     BPL bra_8CDA
C - - - - - 0x010CE8 04:8CD8: A9 20     LDA #$20
bra_8CDA:
C - - - - - 0x010CEA 04:8CDA: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x010CED 04:8CDD: A9 16     LDA #con_sound_16
C - - - - - 0x010CEF 04:8CDF: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x010CF2 04:8CE2: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8CE5_RTS:
C - - - - - 0x010CF5 04:8CE5: 60        RTS



tbl_8CE6_spd_Y:
- D 0 - - - 0x010CF6 04:8CE6: 00 02     .word $0200 ; 00 
- D 0 - - - 0x010CF8 04:8CE8: 00 FE     .word $FE00 ; 01 



tbl_8CEA_spd_X:
- D 0 - - - 0x010CFA 04:8CEA: 00 00     .word $0000 ; 00 
- D 0 - - - 0x010CFC 04:8CEC: 00 03     .word $0300 ; 02 
- D 0 - - - 0x010CFE 04:8CEE: 00 FD     .word $FD00 ; 04 



ofs_038_5F_8CF0_03:
C - - J - - 0x010D00 04:8CF0: 20 71 8E  JSR sub_8E71
C - - - - - 0x010D03 04:8CF3: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x010D06 04:8CF6: 18        CLC
C - - - - - 0x010D07 04:8CF7: 69 01     ADC #$01
C - - - - - 0x010D09 04:8CF9: 29 7F     AND #$7F
C - - - - - 0x010D0B 04:8CFB: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x010D0E 04:8CFE: BC 56 07  LDY ram_0756_obj,X
C - - - - - 0x010D11 04:8D01: B9 87 8D  LDA tbl_8D87,Y
C - - - - - 0x010D14 04:8D04: 18        CLC
C - - - - - 0x010D15 04:8D05: 7D 64 07  ADC ram_0764_obj,X
C - - - - - 0x010D18 04:8D08: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x010D1B 04:8D0B: 6A        ROR
C - - - - - 0x010D1C 04:8D0C: 59 87 8D  EOR tbl_8D87,Y
C - - - - - 0x010D1F 04:8D0F: 30 10     BMI bra_8D21
C - - - - - 0x010D21 04:8D11: B9 A7 8D  LDA tbl_8DA7,Y
C - - - - - 0x010D24 04:8D14: 18        CLC
C - - - - - 0x010D25 04:8D15: 7D 72 07  ADC ram_0772_obj,X
C - - - - - 0x010D28 04:8D18: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x010D2B 04:8D1B: 6A        ROR
C - - - - - 0x010D2C 04:8D1C: 59 A7 8D  EOR tbl_8DA7,Y
C - - - - - 0x010D2F 04:8D1F: 10 07     BPL bra_8D28
bra_8D21:
C - - - - - 0x010D31 04:8D21: A9 00     LDA #$00
C - - - - - 0x010D33 04:8D23: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x010D36 04:8D26: F0 03     BEQ bra_8D2B
bra_8D28:
C - - - - - 0x010D38 04:8D28: 20 2D 8E  JSR sub_8E2D
bra_8D2B:
C - - - - - 0x010D3B 04:8D2B: A5 82     LDA ram_0082
C - - - - - 0x010D3D 04:8D2D: C9 05     CMP #$05
C - - - - - 0x010D3F 04:8D2F: D0 B4     BNE bra_8CE5_RTS
C - - - - - 0x010D41 04:8D31: A5 FC     LDA ram_scroll_Y
C - - - - - 0x010D43 04:8D33: C9 60     CMP #$60
C - - - - - 0x010D45 04:8D35: B0 AE     BCS bra_8CE5_RTS
C - - - - - 0x010D47 04:8D37: BD 08 05  LDA ram_anim_id_enemy,X
C - - - - - 0x010D4A 04:8D3A: D0 03     BNE bra_8D3F
- - - - - - 0x010D4C 04:8D3C: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_8D3F:
C - - - - - 0x010D4F 04:8D3F: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x010D52 04:8D42: 18        CLC
C - - - - - 0x010D53 04:8D43: 69 08     ADC #$08
C - - - - - 0x010D55 04:8D45: 29 7F     AND #$7F
C - - - - - 0x010D57 04:8D47: 4A        LSR
C - - - - - 0x010D58 04:8D48: 4A        LSR
C - - - - - 0x010D59 04:8D49: 29 1C     AND #$1C
C - - - - - 0x010D5B 04:8D4B: A8        TAY
C - - - - - 0x010D5C 04:8D4C: B9 67 8D  LDA tbl_8D67_speed,Y
C - - - - - 0x010D5F 04:8D4F: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x010D62 04:8D52: B9 68 8D  LDA tbl_8D67_speed + $01,Y
C - - - - - 0x010D65 04:8D55: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x010D68 04:8D58: B9 69 8D  LDA tbl_8D67_speed + $02,Y
C - - - - - 0x010D6B 04:8D5B: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x010D6E 04:8D5E: B9 6A 8D  LDA tbl_8D67_speed + $03,Y
C - - - - - 0x010D71 04:8D61: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x010D74 04:8D64: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_8D67_speed:
; 
- - - - - - 0x010D77 04:8D67: 00 00     .word $0000 ; Y
- - - - - - 0x010D79 04:8D69: 00 02     .word $0200 ; X
; 
- - - - - - 0x010D7B 04:8D6B: 6A 01     .word $016A ; Y
- - - - - - 0x010D7D 04:8D6D: 6A 01     .word $016A ; X
; 
- - - - - - 0x010D7F 04:8D6F: 00 02     .word $0200 ; Y
- - - - - - 0x010D81 04:8D71: 00 00     .word $0000 ; X
; 
- D 0 - - - 0x010D83 04:8D73: 6A 01     .word $016A ; Y
- D 0 - - - 0x010D85 04:8D75: 96 FE     .word $FE96 ; X
; 
- - - - - - 0x010D87 04:8D77: 00 00     .word $0000 ; Y
- - - - - - 0x010D89 04:8D79: 00 FE     .word $FE00 ; X
; 
- - - - - - 0x010D8B 04:8D7B: 96 FE     .word $FE96 ; Y
- - - - - - 0x010D8D 04:8D7D: 96 FE     .word $FE96 ; X
; 
- D 0 - - - 0x010D8F 04:8D7F: 00 FE     .word $FE00 ; Y
- D 0 - - - 0x010D91 04:8D81: 00 00     .word $0000 ; X
; 
- D 0 - - - 0x010D93 04:8D83: 96 FE     .word $FE96 ; Y
- D 0 - - - 0x010D95 04:8D85: 6A 01     .word $016A ; X



tbl_8D87:
- D 0 - - - 0x010D97 04:8D87: 00        .byte $00   ; 00 
- D 0 - - - 0x010D98 04:8D88: 02        .byte $02   ; 01 
- D 0 - - - 0x010D99 04:8D89: 05        .byte $05   ; 02 
- D 0 - - - 0x010D9A 04:8D8A: 08        .byte $08   ; 03 
- D 0 - - - 0x010D9B 04:8D8B: 0A        .byte $0A   ; 04 
- D 0 - - - 0x010D9C 04:8D8C: 0D        .byte $0D   ; 05 
- D 0 - - - 0x010D9D 04:8D8D: 10        .byte $10   ; 06 
- D 0 - - - 0x010D9E 04:8D8E: 12        .byte $12   ; 07 
- D 0 - - - 0x010D9F 04:8D8F: 15        .byte $15   ; 08 
- D 0 - - - 0x010DA0 04:8D90: 17        .byte $17   ; 09 
- D 0 - - - 0x010DA1 04:8D91: 1A        .byte $1A   ; 0A 
- D 0 - - - 0x010DA2 04:8D92: 1C        .byte $1C   ; 0B 
- D 0 - - - 0x010DA3 04:8D93: 1F        .byte $1F   ; 0C 
- D 0 - - - 0x010DA4 04:8D94: 21        .byte $21   ; 0D 
- D 0 - - - 0x010DA5 04:8D95: 23        .byte $23   ; 0E 
- D 0 - - - 0x010DA6 04:8D96: 25        .byte $25   ; 0F 
- D 0 - - - 0x010DA7 04:8D97: 27        .byte $27   ; 10 
- D 0 - - - 0x010DA8 04:8D98: 29        .byte $29   ; 11 
- D 0 - - - 0x010DA9 04:8D99: 2B        .byte $2B   ; 12 
- D 0 - - - 0x010DAA 04:8D9A: 2C        .byte $2C   ; 13 
- D 0 - - - 0x010DAB 04:8D9B: 2E        .byte $2E   ; 14 
- D 0 - - - 0x010DAC 04:8D9C: 2F        .byte $2F   ; 15 
- D 0 - - - 0x010DAD 04:8D9D: 31        .byte $31   ; 16 
- D 0 - - - 0x010DAE 04:8D9E: 32        .byte $32   ; 17 
- D 0 - - - 0x010DAF 04:8D9F: 33        .byte $33   ; 18 
- D 0 - - - 0x010DB0 04:8DA0: 34        .byte $34   ; 19 
- D 0 - - - 0x010DB1 04:8DA1: 35        .byte $35   ; 1A 
- D 0 - - - 0x010DB2 04:8DA2: 36        .byte $36   ; 1B 
- D 0 - - - 0x010DB3 04:8DA3: 36        .byte $36   ; 1C 
- D 0 - - - 0x010DB4 04:8DA4: 37        .byte $37   ; 1D 
- D 0 - - - 0x010DB5 04:8DA5: 37        .byte $37   ; 1E 
- D 0 - - - 0x010DB6 04:8DA6: 37        .byte $37   ; 1F 
tbl_8DA7:
- D 0 - - - 0x010DB7 04:8DA7: 37        .byte $37   ; 00 (20) 
- D 0 - - - 0x010DB8 04:8DA8: 37        .byte $37   ; 01 (21) 
- D 0 - - - 0x010DB9 04:8DA9: 37        .byte $37   ; 02 (22) 
- D 0 - - - 0x010DBA 04:8DAA: 37        .byte $37   ; 03 (23) 
- D 0 - - - 0x010DBB 04:8DAB: 36        .byte $36   ; 04 (24) 
- D 0 - - - 0x010DBC 04:8DAC: 36        .byte $36   ; 05 (25) 
- D 0 - - - 0x010DBD 04:8DAD: 35        .byte $35   ; 06 (26) 
- D 0 - - - 0x010DBE 04:8DAE: 34        .byte $34   ; 07 (27) 
- D 0 - - - 0x010DBF 04:8DAF: 33        .byte $33   ; 08 (28) 
- D 0 - - - 0x010DC0 04:8DB0: 32        .byte $32   ; 09 (29) 
- D 0 - - - 0x010DC1 04:8DB1: 31        .byte $31   ; 0A (2A) 
- D 0 - - - 0x010DC2 04:8DB2: 2F        .byte $2F   ; 0B (2B) 
- D 0 - - - 0x010DC3 04:8DB3: 2E        .byte $2E   ; 0C (2C) 
- D 0 - - - 0x010DC4 04:8DB4: 2C        .byte $2C   ; 0D (2D) 
- D 0 - - - 0x010DC5 04:8DB5: 2B        .byte $2B   ; 0E (2E) 
- D 0 - - - 0x010DC6 04:8DB6: 29        .byte $29   ; 0F (2F) 
- D 0 - - - 0x010DC7 04:8DB7: 27        .byte $27   ; 10 (30) 
- D 0 - - - 0x010DC8 04:8DB8: 25        .byte $25   ; 11 (31) 
- D 0 - - - 0x010DC9 04:8DB9: 23        .byte $23   ; 12 (32) 
- D 0 - - - 0x010DCA 04:8DBA: 21        .byte $21   ; 13 (33) 
- D 0 - - - 0x010DCB 04:8DBB: 1F        .byte $1F   ; 14 (34) 
- D 0 - - - 0x010DCC 04:8DBC: 1C        .byte $1C   ; 15 (35) 
- D 0 - - - 0x010DCD 04:8DBD: 1A        .byte $1A   ; 16 (36) 
- D 0 - - - 0x010DCE 04:8DBE: 17        .byte $17   ; 17 (37) 
- D 0 - - - 0x010DCF 04:8DBF: 15        .byte $15   ; 18 (38) 
- D 0 - - - 0x010DD0 04:8DC0: 12        .byte $12   ; 19 (39) 
- D 0 - - - 0x010DD1 04:8DC1: 10        .byte $10   ; 1A (3A) 
- D 0 - - - 0x010DD2 04:8DC2: 0D        .byte $0D   ; 1B (3B) 
- D 0 - - - 0x010DD3 04:8DC3: 0A        .byte $0A   ; 1C (3C) 
- D 0 - - - 0x010DD4 04:8DC4: 08        .byte $08   ; 1D (3D) 
- D 0 - - - 0x010DD5 04:8DC5: 05        .byte $05   ; 1E (3E) 
- D 0 - - - 0x010DD6 04:8DC6: 02        .byte $02   ; 1F (3F) 
- D 0 - - - 0x010DD7 04:8DC7: 00        .byte $00   ; 20 (40) 
- D 0 - - - 0x010DD8 04:8DC8: FE        .byte $FE   ; 21 (41) 
- D 0 - - - 0x010DD9 04:8DC9: FB        .byte $FB   ; 22 (42) 
- D 0 - - - 0x010DDA 04:8DCA: F8        .byte $F8   ; 23 (43) 
- D 0 - - - 0x010DDB 04:8DCB: F6        .byte $F6   ; 24 (44) 
- D 0 - - - 0x010DDC 04:8DCC: F3        .byte $F3   ; 25 (45) 
- D 0 - - - 0x010DDD 04:8DCD: F0        .byte $F0   ; 26 (46) 
- D 0 - - - 0x010DDE 04:8DCE: EE        .byte $EE   ; 27 (47) 
- D 0 - - - 0x010DDF 04:8DCF: EB        .byte $EB   ; 28 (48) 
- D 0 - - - 0x010DE0 04:8DD0: E9        .byte $E9   ; 29 (49) 
- D 0 - - - 0x010DE1 04:8DD1: E6        .byte $E6   ; 2A (4A) 
- D 0 - - - 0x010DE2 04:8DD2: E4        .byte $E4   ; 2B (4B) 
- D 0 - - - 0x010DE3 04:8DD3: E1        .byte $E1   ; 2C (4C) 
- D 0 - - - 0x010DE4 04:8DD4: DF        .byte $DF   ; 2D (4D) 
- D 0 - - - 0x010DE5 04:8DD5: DD        .byte $DD   ; 2E (4E) 
- D 0 - - - 0x010DE6 04:8DD6: DB        .byte $DB   ; 2F (4F) 
- D 0 - - - 0x010DE7 04:8DD7: D9        .byte $D9   ; 30 (50) 
- D 0 - - - 0x010DE8 04:8DD8: D7        .byte $D7   ; 31 (51) 
- D 0 - - - 0x010DE9 04:8DD9: D5        .byte $D5   ; 32 (52) 
- D 0 - - - 0x010DEA 04:8DDA: D4        .byte $D4   ; 33 (53) 
- D 0 - - - 0x010DEB 04:8DDB: D2        .byte $D2   ; 34 (54) 
- D 0 - - - 0x010DEC 04:8DDC: D1        .byte $D1   ; 35 (55) 
- D 0 - - - 0x010DED 04:8DDD: CF        .byte $CF   ; 36 (56) 
- D 0 - - - 0x010DEE 04:8DDE: CE        .byte $CE   ; 37 (57) 
- D 0 - - - 0x010DEF 04:8DDF: CD        .byte $CD   ; 38 (58) 
- D 0 - - - 0x010DF0 04:8DE0: CC        .byte $CC   ; 39 (59) 
- D 0 - - - 0x010DF1 04:8DE1: CB        .byte $CB   ; 3A (5A) 
- D 0 - - - 0x010DF2 04:8DE2: CA        .byte $CA   ; 3B (5B) 
- D 0 - - - 0x010DF3 04:8DE3: CA        .byte $CA   ; 3C (5C) 
- D 0 - - - 0x010DF4 04:8DE4: C9        .byte $C9   ; 3D (5D) 
- D 0 - - - 0x010DF5 04:8DE5: C9        .byte $C9   ; 3E (5E) 
- D 0 - - - 0x010DF6 04:8DE6: C9        .byte $C9   ; 3F (5F) 
- D 0 - - - 0x010DF7 04:8DE7: C9        .byte $C9   ; 40 (60) 
- D 0 - - - 0x010DF8 04:8DE8: C9        .byte $C9   ; 41 (61) 
- D 0 - - - 0x010DF9 04:8DE9: C9        .byte $C9   ; 42 (62) 
- D 0 - - - 0x010DFA 04:8DEA: C9        .byte $C9   ; 43 (63) 
- D 0 - - - 0x010DFB 04:8DEB: CA        .byte $CA   ; 44 (64) 
- D 0 - - - 0x010DFC 04:8DEC: CA        .byte $CA   ; 45 (65) 
- D 0 - - - 0x010DFD 04:8DED: CB        .byte $CB   ; 46 (66) 
- D 0 - - - 0x010DFE 04:8DEE: CC        .byte $CC   ; 47 (67) 
- D 0 - - - 0x010DFF 04:8DEF: CD        .byte $CD   ; 48 (68) 
- D 0 - - - 0x010E00 04:8DF0: CE        .byte $CE   ; 49 (69) 
- D 0 - - - 0x010E01 04:8DF1: CF        .byte $CF   ; 4A (6A) 
- D 0 - - - 0x010E02 04:8DF2: D1        .byte $D1   ; 4B (6B) 
- D 0 - - - 0x010E03 04:8DF3: D2        .byte $D2   ; 4C (6C) 
- D 0 - - - 0x010E04 04:8DF4: D4        .byte $D4   ; 4D (6D) 
- D 0 - - - 0x010E05 04:8DF5: D5        .byte $D5   ; 4E (6E) 
- D 0 - - - 0x010E06 04:8DF6: D7        .byte $D7   ; 4F (6F) 
- D 0 - - - 0x010E07 04:8DF7: D9        .byte $D9   ; 50 (70) 
- D 0 - - - 0x010E08 04:8DF8: DB        .byte $DB   ; 51 (71) 
- D 0 - - - 0x010E09 04:8DF9: DD        .byte $DD   ; 52 (72) 
- D 0 - - - 0x010E0A 04:8DFA: DF        .byte $DF   ; 53 (73) 
- D 0 - - - 0x010E0B 04:8DFB: E1        .byte $E1   ; 54 (74) 
- D 0 - - - 0x010E0C 04:8DFC: E4        .byte $E4   ; 55 (75) 
- D 0 - - - 0x010E0D 04:8DFD: E6        .byte $E6   ; 56 (76) 
- D 0 - - - 0x010E0E 04:8DFE: E9        .byte $E9   ; 57 (77) 
- D 0 - - - 0x010E0F 04:8DFF: EB        .byte $EB   ; 58 (78) 
- D 0 - - - 0x010E10 04:8E00: EE        .byte $EE   ; 59 (79) 
- D 0 - - - 0x010E11 04:8E01: F0        .byte $F0   ; 5A (7A) 
- D 0 - - - 0x010E12 04:8E02: F3        .byte $F3   ; 5B (7B) 
- D 0 - - - 0x010E13 04:8E03: F6        .byte $F6   ; 5C (7C) 
- D 0 - - - 0x010E14 04:8E04: F8        .byte $F8   ; 5D (7D) 
- D 0 - - - 0x010E15 04:8E05: FB        .byte $FB   ; 5E (7E) 
- D 0 - - - 0x010E16 04:8E06: FE        .byte $FE   ; 5F (7F) 
- D 0 - - - 0x010E17 04:8E07: 00        .byte $00   ; 60 
- D 0 - - - 0x010E18 04:8E08: 02        .byte $02   ; 61 
- D 0 - - - 0x010E19 04:8E09: 05        .byte $05   ; 62 
- D 0 - - - 0x010E1A 04:8E0A: 08        .byte $08   ; 63 
- D 0 - - - 0x010E1B 04:8E0B: 0A        .byte $0A   ; 64 
- D 0 - - - 0x010E1C 04:8E0C: 0D        .byte $0D   ; 65 
- D 0 - - - 0x010E1D 04:8E0D: 10        .byte $10   ; 66 
- D 0 - - - 0x010E1E 04:8E0E: 12        .byte $12   ; 67 
- D 0 - - - 0x010E1F 04:8E0F: 15        .byte $15   ; 68 
- D 0 - - - 0x010E20 04:8E10: 17        .byte $17   ; 69 
- D 0 - - - 0x010E21 04:8E11: 1A        .byte $1A   ; 6A 
- D 0 - - - 0x010E22 04:8E12: 1C        .byte $1C   ; 6B 
- D 0 - - - 0x010E23 04:8E13: 1F        .byte $1F   ; 6C 
- D 0 - - - 0x010E24 04:8E14: 21        .byte $21   ; 6D 
- D 0 - - - 0x010E25 04:8E15: 23        .byte $23   ; 6E 
- D 0 - - - 0x010E26 04:8E16: 25        .byte $25   ; 6F 
- D 0 - - - 0x010E27 04:8E17: 27        .byte $27   ; 70 
- D 0 - - - 0x010E28 04:8E18: 29        .byte $29   ; 71 
- D 0 - - - 0x010E29 04:8E19: 2B        .byte $2B   ; 72 
- D 0 - - - 0x010E2A 04:8E1A: 2C        .byte $2C   ; 73 
- D 0 - - - 0x010E2B 04:8E1B: 2E        .byte $2E   ; 74 
- D 0 - - - 0x010E2C 04:8E1C: 2F        .byte $2F   ; 75 
- D 0 - - - 0x010E2D 04:8E1D: 31        .byte $31   ; 76 
- D 0 - - - 0x010E2E 04:8E1E: 32        .byte $32   ; 77 
- D 0 - - - 0x010E2F 04:8E1F: 33        .byte $33   ; 78 
- D 0 - - - 0x010E30 04:8E20: 34        .byte $34   ; 79 
- D 0 - - - 0x010E31 04:8E21: 35        .byte $35   ; 7A 
- D 0 - - - 0x010E32 04:8E22: 36        .byte $36   ; 7B 
- D 0 - - - 0x010E33 04:8E23: 36        .byte $36   ; 7C 
- D 0 - - - 0x010E34 04:8E24: 37        .byte $37   ; 7D 
- D 0 - - - 0x010E35 04:8E25: 37        .byte $37   ; 7E 
- D 0 - - - 0x010E36 04:8E26: 37        .byte $37   ; 7F 



ofs_038_5F_8E27_04:
C - - J - - 0x010E37 04:8E27: 20 2D 8E  JSR sub_8E2D
C - - - - - 0x010E3A 04:8E2A: 4C D3 A6  JMP loc_0x0066E3



sub_8E2D:
C - - - - - 0x010E3D 04:8E2D: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x010E40 04:8E30: 18        CLC
C - - - - - 0x010E41 04:8E31: 69 08     ADC #$08
C - - - - - 0x010E43 04:8E33: 29 7F     AND #$7F
C - - - - - 0x010E45 04:8E35: 4A        LSR
C - - - - - 0x010E46 04:8E36: 4A        LSR
C - - - - - 0x010E47 04:8E37: 4A        LSR
C - - - - - 0x010E48 04:8E38: 4A        LSR
C - - - - - 0x010E49 04:8E39: A8        TAY
C - - - - - 0x010E4A 04:8E3A: B9 47 8E  LDA tbl_8E47,Y
C - - - - - 0x010E4D 04:8E3D: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x010E50 04:8E40: B9 4F 8E  LDA tbl_8E4F,Y
C - - - - - 0x010E53 04:8E43: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x010E56 04:8E46: 60        RTS



tbl_8E47:
- D 0 - - - 0x010E57 04:8E47: 86        .byte $86   ; 00 
- D 0 - - - 0x010E58 04:8E48: 87        .byte $87   ; 10 
- D 0 - - - 0x010E59 04:8E49: 88        .byte $88   ; 20 
- D 0 - - - 0x010E5A 04:8E4A: 87        .byte $87   ; 30 
- D 0 - - - 0x010E5B 04:8E4B: 86        .byte $86   ; 40 
- D 0 - - - 0x010E5C 04:8E4C: 85        .byte $85   ; 50 
- D 0 - - - 0x010E5D 04:8E4D: 84        .byte $84   ; 60 
- D 0 - - - 0x010E5E 04:8E4E: 85        .byte $85   ; 70 



tbl_8E4F:
- D 0 - - - 0x010E5F 04:8E4F: 03        .byte $03   ; 00 
- D 0 - - - 0x010E60 04:8E50: 03        .byte $03   ; 10 
- D 0 - - - 0x010E61 04:8E51: 03        .byte $03   ; 20 
- D 0 - - - 0x010E62 04:8E52: 43        .byte $43   ; 30 
- D 0 - - - 0x010E63 04:8E53: 43        .byte $43   ; 40 
- D 0 - - - 0x010E64 04:8E54: 43        .byte $43   ; 50 
- D 0 - - - 0x010E65 04:8E55: 03        .byte $03   ; 60 
- D 0 - - - 0x010E66 04:8E56: 03        .byte $03   ; 70 



sub_8E57:
C - - - - - 0x010E67 04:8E57: BC 48 07  LDY ram_0748_obj,X
C - - - - - 0x010E6A 04:8E5A: B9 CA 00  LDA ram_plr_game_over,Y
C - - - - - 0x010E6D 04:8E5D: F0 07     BEQ bra_8E66
- - - - - - 0x010E6F 04:8E5F: 98        TYA
- - - - - - 0x010E70 04:8E60: 49 01     EOR #$01
- - - - - - 0x010E72 04:8E62: A8        TAY
- - - - - - 0x010E73 04:8E63: 9D 48 07  STA ram_0748_obj,X
bra_8E66:
C - - - - - 0x010E76 04:8E66: B9 32 05  LDA ram_pos_Y_hi_plr,Y
C - - - - - 0x010E79 04:8E69: 85 08     STA ram_0008
C - - - - - 0x010E7B 04:8E6B: B9 4C 05  LDA ram_pos_X_hi_plr,Y
C - - - - - 0x010E7E 04:8E6E: 85 09     STA ram_0009
C - - - - - 0x010E80 04:8E70: 60        RTS



sub_8E71:
C - - - - - 0x010E81 04:8E71: 20 57 8E  JSR sub_8E57
C - - - - - 0x010E84 04:8E74: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x010E87 04:8E77: C5 08     CMP ram_0008
C - - - - - 0x010E89 04:8E79: F0 19     BEQ bra_8E94
C - - - - - 0x010E8B 04:8E7B: A0 00     LDY #$00
C - - - - - 0x010E8D 04:8E7D: 90 02     BCC bra_8E81
C - - - - - 0x010E8F 04:8E7F: A0 02     LDY #$02
bra_8E81:
C - - - - - 0x010E91 04:8E81: B9 BE 8E  LDA tbl_8EBE,Y
C - - - - - 0x010E94 04:8E84: 18        CLC
C - - - - - 0x010E95 04:8E85: 7D A0 06  ADC ram_spd_Y_lo_obj,X
C - - - - - 0x010E98 04:8E88: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x010E9B 04:8E8B: B9 BF 8E  LDA tbl_8EBE + $01,Y
C - - - - - 0x010E9E 04:8E8E: 7D 64 07  ADC ram_0764_obj,X
C - - - - - 0x010EA1 04:8E91: 9D 64 07  STA ram_0764_obj,X
bra_8E94:
C - - - - - 0x010EA4 04:8E94: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x010EA7 04:8E97: 38        SEC
C - - - - - 0x010EA8 04:8E98: E5 72     SBC ram_cam_spd_Y
C - - - - - 0x010EAA 04:8E9A: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x010EAD 04:8E9D: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x010EB0 04:8EA0: C5 09     CMP ram_0009
C - - - - - 0x010EB2 04:8EA2: F0 19     BEQ bra_8EBD_RTS
C - - - - - 0x010EB4 04:8EA4: A0 00     LDY #$00
C - - - - - 0x010EB6 04:8EA6: 90 02     BCC bra_8EAA
C - - - - - 0x010EB8 04:8EA8: A0 02     LDY #$02
bra_8EAA:
C - - - - - 0x010EBA 04:8EAA: B9 BE 8E  LDA tbl_8EBE,Y
C - - - - - 0x010EBD 04:8EAD: 18        CLC
C - - - - - 0x010EBE 04:8EAE: 7D BC 06  ADC ram_spd_X_lo_obj,X
C - - - - - 0x010EC1 04:8EB1: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x010EC4 04:8EB4: B9 BF 8E  LDA tbl_8EBE + $01,Y
C - - - - - 0x010EC7 04:8EB7: 7D 72 07  ADC ram_0772_obj,X
C - - - - - 0x010ECA 04:8EBA: 9D 72 07  STA ram_0772_obj,X
bra_8EBD_RTS:
C - - - - - 0x010ECD 04:8EBD: 60        RTS



tbl_8EBE:
;                                              ----------- speed
;                                              |    ------ 
;                                              |    |
- D 0 - - - 0x010ECE 04:8EBE: 00        .byte $00, $01   ; 00 
- D 0 - - - 0x010ED0 04:8EC0: 00        .byte $00, $FF   ; 02 



_off001_0x010ED2_24_blue_spider:
- D 0 - I - 0x010ED2 04:8EC2: CE 8E     .word ofs_038_24_8ECE_01_initialize_object ; 
- D 0 - I - 0x010ED4 04:8EC4: 52 8F     .word ofs_038_24_8F52_02 ; 
- D 0 - I - 0x010ED6 04:8EC6: 1E 91     .word ofs_038_24_911E_03 ; 
- D 0 - I - 0x010ED8 04:8EC8: 9A A2     .word ofs_038_24_0x0062AA_04 ; 
- D 0 - I - 0x010EDA 04:8ECA: FD A2     .word ofs_038_24_0x00630D_05 ; 
- D 0 - I - 0x010EDC 04:8ECC: 3D A3     .word ofs_038_24_0x00634D_06_delete_object_04 ; 



ofs_038_24_8ECE_01_initialize_object:
C - - J - - 0x010EDE 04:8ECE: A9 14     LDA #$14
C - - - - - 0x010EE0 04:8ED0: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x010EE3 04:8ED3: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x010EE6 04:8ED6: 4A        LSR
C - - - - - 0x010EE7 04:8ED7: 90 0A     BCC bra_8EE3
C - - - - - 0x010EE9 04:8ED9: A9 40     LDA #$40
C - - - - - 0x010EEB 04:8EDB: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x010EEE 04:8EDE: A9 E0     LDA #$E0
C - - - - - 0x010EF0 04:8EE0: 9D 22 05  STA ram_pos_Y_hi_enemy,X
bra_8EE3:
C - - - - - 0x010EF3 04:8EE3: A9 00     LDA #$00
C - - - - - 0x010EF5 04:8EE5: 9D 3A 07  STA ram_073A_obj_hitbox_index,X
C - - - - - 0x010EF8 04:8EE8: 20 F8 8E  JSR sub_8EF8
C - - - - - 0x010EFB 04:8EEB: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x010EFE 04:8EEE: A9 20     LDA #$20
C - - - - - 0x010F00 04:8EF0: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x010F03 04:8EF3: A9 30     LDA #$30
C - - - - - 0x010F05 04:8EF5: 4C E0 A2  JMP loc_0x0062F0



sub_8EF8:
C - - - - - 0x010F08 04:8EF8: 20 DB 90  JSR sub_90DB
C - - - - - 0x010F0B 04:8EFB: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x010F0E 04:8EFE: 20 F0 F4  JSR sub_0x01F500
C - - - - - 0x010F11 04:8F01: A5 0C     LDA ram_000C
C - - - - - 0x010F13 04:8F03: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x010F16 04:8F06: A8        TAY
C - - - - - 0x010F17 04:8F07: 20 9B F4  JSR sub_0x01F4AB
C - - - - - 0x010F1A 04:8F0A: 4C 13 8F  JMP loc_8F13



sub_8F0D:
C - - - - - 0x010F1D 04:8F0D: 20 DB 90  JSR sub_90DB
C - - - - - 0x010F20 04:8F10: 20 95 F4  JSR sub_0x01F4A5
loc_8F13:
sub_8F13:
C D 0 - - - 0x010F23 04:8F13: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x010F26 04:8F16: 0A        ASL
C - - - - - 0x010F27 04:8F17: 0A        ASL
C - - - - - 0x010F28 04:8F18: A8        TAY
C - - - - - 0x010F29 04:8F19: B9 32 8F  LDA tbl_8F32_speed,Y
C - - - - - 0x010F2C 04:8F1C: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x010F2F 04:8F1F: B9 33 8F  LDA tbl_8F32_speed + $01,Y
C - - - - - 0x010F32 04:8F22: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x010F35 04:8F25: B9 34 8F  LDA tbl_8F32_speed + $02,Y
C - - - - - 0x010F38 04:8F28: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x010F3B 04:8F2B: B9 35 8F  LDA tbl_8F32_speed + $03,Y
C - - - - - 0x010F3E 04:8F2E: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x010F41 04:8F31: 60        RTS



tbl_8F32_speed:
; 00 
- D 0 - - - 0x010F42 04:8F32: 00 00     .word $0000 ; Y
- D 0 - - - 0x010F44 04:8F34: C0 00     .word $00C0 ; X
; 01 
- D 0 - - - 0x010F46 04:8F36: 87 00     .word $0087 ; Y
- D 0 - - - 0x010F48 04:8F38: 87 00     .word $0087 ; X
; 02 
- D 0 - - - 0x010F4A 04:8F3A: C0 00     .word $00C0 ; Y
- D 0 - - - 0x010F4C 04:8F3C: 00 00     .word $0000 ; X
; 03 
- D 0 - - - 0x010F4E 04:8F3E: 87 00     .word $0087 ; Y
- D 0 - - - 0x010F50 04:8F40: 79 FF     .word $FF79 ; X
; 04 
- D 0 - - - 0x010F52 04:8F42: 00 00     .word $0000 ; Y
- D 0 - - - 0x010F54 04:8F44: 40 FF     .word $FF40 ; X
; 05 
- D 0 - - - 0x010F56 04:8F46: 79 FF     .word $FF79 ; Y
- D 0 - - - 0x010F58 04:8F48: 79 FF     .word $FF79 ; X
; 06 
- D 0 - - - 0x010F5A 04:8F4A: 40 FF     .word $FF40 ; Y
- D 0 - - - 0x010F5C 04:8F4C: 00 00     .word $0000 ; X
; 07 
- D 0 - - - 0x010F5E 04:8F4E: 79 FF     .word $FF79 ; Y
- D 0 - - - 0x010F60 04:8F50: 87 00     .word $0087 ; X



ofs_038_24_8F52_02:
C - - J - - 0x010F62 04:8F52: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x010F65 04:8F55: F0 2D     BEQ bra_8F84
C - - - - - 0x010F67 04:8F57: B9 9F 90  LDA tbl_90A0 - $01,Y
C - - - - - 0x010F6A 04:8F5A: 18        CLC
C - - - - - 0x010F6B 04:8F5B: 7D 22 05  ADC ram_pos_Y_hi_enemy,X
C - - - - - 0x010F6E 04:8F5E: 85 08     STA ram_0008
C - - - - - 0x010F70 04:8F60: B9 A3 90  LDA tbl_90A4 - $01,Y
C - - - - - 0x010F73 04:8F63: 18        CLC
C - - - - - 0x010F74 04:8F64: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x010F77 04:8F67: A4 08     LDY ram_0008
C - - - - - 0x010F79 04:8F69: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x010F7C 04:8F6C: D0 16     BNE bra_8F84
C - - - - - 0x010F7E 04:8F6E: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x010F81 04:8F71: B9 A7 90  LDA tbl_90A8 - $01,Y
C - - - - - 0x010F84 04:8F74: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x010F87 04:8F77: A9 08     LDA #$08
C - - - - - 0x010F89 04:8F79: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x010F8C 04:8F7C: A9 00     LDA #$00
C - - - - - 0x010F8E 04:8F7E: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x010F91 04:8F81: 4C 02 90  JMP loc_9002
bra_8F84:
C - - - - - 0x010F94 04:8F84: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x010F97 04:8F87: 1D BC 06  ORA ram_spd_X_lo_obj,X
C - - - - - 0x010F9A 04:8F8A: F0 3D     BEQ bra_8FC9
C - - - - - 0x010F9C 04:8F8C: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x010F9F 04:8F8F: 2A        ROL
C - - - - - 0x010FA0 04:8F90: 2A        ROL
C - - - - - 0x010FA1 04:8F91: 29 01     AND #$01
C - - - - - 0x010FA3 04:8F93: A8        TAY
C - - - - - 0x010FA4 04:8F94: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x010FA7 04:8F97: D9 B0 90  CMP tbl_90B0,Y
C - - - - - 0x010FAA 04:8F9A: C8        INY
C - - - - - 0x010FAB 04:8F9B: 84 13     STY ram_0013
C - - - - - 0x010FAD 04:8F9D: 6A        ROR
C - - - - - 0x010FAE 04:8F9E: 5D CA 06  EOR ram_spd_X_hi_obj,X
C - - - - - 0x010FB1 04:8FA1: 30 1B     BMI bra_8FBE
C - - - - - 0x010FB3 04:8FA3: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x010FB6 04:8FA6: 0A        ASL
C - - - - - 0x010FB7 04:8FA7: A9 08     LDA #$08
C - - - - - 0x010FB9 04:8FA9: A0 01     LDY #$01
C - - - - - 0x010FBB 04:8FAB: 90 03     BCC bra_8FB0
C - - - - - 0x010FBD 04:8FAD: A9 F8     LDA #$F8
C - - - - - 0x010FBF 04:8FAF: C8        INY
bra_8FB0:
C - - - - - 0x010FC0 04:8FB0: 84 13     STY ram_0013
C - - - - - 0x010FC2 04:8FB2: 18        CLC
C - - - - - 0x010FC3 04:8FB3: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x010FC6 04:8FB6: BC 22 05  LDY ram_pos_Y_hi_enemy,X
C - - - - - 0x010FC9 04:8FB9: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x010FCC 04:8FBC: F0 0B     BEQ bra_8FC9
bra_8FBE:
C - - - - - 0x010FCE 04:8FBE: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x010FD1 04:8FC1: F0 76     BEQ bra_9039
C - - - - - 0x010FD3 04:8FC3: 20 BA 90  JSR sub_90BA
C - - - - - 0x010FD6 04:8FC6: 4C 02 90  JMP loc_9002
bra_8FC9:
C - - - - - 0x010FD9 04:8FC9: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x010FDC 04:8FCC: 1D A0 06  ORA ram_spd_Y_lo_obj,X
C - - - - - 0x010FDF 04:8FCF: F0 27     BEQ bra_8FF8
C - - - - - 0x010FE1 04:8FD1: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x010FE4 04:8FD4: 0A        ASL
C - - - - - 0x010FE5 04:8FD5: A9 08     LDA #$08
C - - - - - 0x010FE7 04:8FD7: A0 03     LDY #$03
C - - - - - 0x010FE9 04:8FD9: 90 03     BCC bra_8FDE
C - - - - - 0x010FEB 04:8FDB: A9 F8     LDA #$F8
C - - - - - 0x010FED 04:8FDD: C8        INY
bra_8FDE:
C - - - - - 0x010FEE 04:8FDE: 84 13     STY ram_0013
C - - - - - 0x010FF0 04:8FE0: 18        CLC
C - - - - - 0x010FF1 04:8FE1: 7D 22 05  ADC ram_pos_Y_hi_enemy,X
C - - - - - 0x010FF4 04:8FE4: A8        TAY
C - - - - - 0x010FF5 04:8FE5: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x010FF8 04:8FE8: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x010FFB 04:8FEB: F0 0B     BEQ bra_8FF8
C - - - - - 0x010FFD 04:8FED: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x011000 04:8FF0: F0 2B     BEQ bra_901D
C - - - - - 0x011002 04:8FF2: 20 BA 90  JSR sub_90BA
C - - - - - 0x011005 04:8FF5: 4C 02 90  JMP loc_9002
bra_8FF8:
C - - - - - 0x011008 04:8FF8: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x01100B 04:8FFB: D0 05     BNE bra_9002
C - - - - - 0x01100D 04:8FFD: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011010 04:9000: F0 53     BEQ bra_9055
bra_9002:
loc_9002:
C D 0 - - - 0x011012 04:9002: 20 5E 91  JSR sub_915E
C - - - - - 0x011015 04:9005: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x011018 04:9008: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x01101B 04:900B: 29 02     AND #$02
C - - - - - 0x01101D 04:900D: F0 0D     BEQ bra_901C_RTS
C - - - - - 0x01101F 04:900F: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x011022 04:9012: D0 08     BNE bra_901C_RTS
C - - - - - 0x011024 04:9014: A9 10     LDA #$10
C - - - - - 0x011026 04:9016: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x011029 04:9019: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_901C_RTS:
C - - - - - 0x01102C 04:901C: 60        RTS
bra_901D:
C - - - - - 0x01102D 04:901D: 20 F5 90  JSR sub_90F5
C - - - - - 0x011030 04:9020: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x011033 04:9023: C5 0C     CMP ram_000C
C - - - - - 0x011035 04:9025: 6A        ROR
C - - - - - 0x011036 04:9026: 5D AE 06  EOR ram_spd_Y_hi_obj,X
C - - - - - 0x011039 04:9029: 30 2A     BMI bra_9055
C - - - - - 0x01103B 04:902B: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01103E 04:902E: C5 0B     CMP ram_000B
C - - - - - 0x011040 04:9030: A9 00     LDA #$00
C - - - - - 0x011042 04:9032: 90 02     BCC bra_9036
C - - - - - 0x011044 04:9034: A9 01     LDA #$01
bra_9036:
C - - - - - 0x011046 04:9036: 4C 88 90  JMP loc_9088
bra_9039:
C - - - - - 0x011049 04:9039: 20 F5 90  JSR sub_90F5
C - - - - - 0x01104C 04:903C: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01104F 04:903F: C5 0B     CMP ram_000B
C - - - - - 0x011051 04:9041: 6A        ROR
C - - - - - 0x011052 04:9042: 5D CA 06  EOR ram_spd_X_hi_obj,X
C - - - - - 0x011055 04:9045: 30 0E     BMI bra_9055
C - - - - - 0x011057 04:9047: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01105A 04:904A: C5 0C     CMP ram_000C
C - - - - - 0x01105C 04:904C: A9 02     LDA #$02
C - - - - - 0x01105E 04:904E: 90 02     BCC bra_9052
- - - - - - 0x011060 04:9050: A9 03     LDA #$03
bra_9052:
C - - - - - 0x011062 04:9052: 4C 88 90  JMP loc_9088
bra_9055:
C - - - - - 0x011065 04:9055: 20 F5 90  JSR sub_90F5
C - - - - - 0x011068 04:9058: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x01106B 04:905B: C5 0C     CMP ram_000C
C - - - - - 0x01106D 04:905D: 90 0A     BCC bra_9069
C - - - - - 0x01106F 04:905F: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x011072 04:9062: 0A        ASL
C - - - - - 0x011073 04:9063: 30 0C     BMI bra_9071
C - - - - - 0x011075 04:9065: A9 80     LDA #$80
C - - - - - 0x011077 04:9067: D0 05     BNE bra_906E    ; jmp
bra_9069:
C - - - - - 0x011079 04:9069: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x01107C 04:906C: 29 BF     AND #$BF
bra_906E:
C - - - - - 0x01107E 04:906E: 9D 72 07  STA ram_0772_obj,X
bra_9071:
C - - - - - 0x011081 04:9071: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x011083 04:9073: E5 23     SBC ram_рандом_байт_1
C - - - - - 0x011085 04:9075: 85 23     STA ram_рандом_байт_1
C - - - - - 0x011087 04:9077: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x011089 04:9079: 29 07     AND #$07
C - - - - - 0x01108B 04:907B: A8        TAY
C - - - - - 0x01108C 04:907C: B9 B2 90  LDA tbl_90B2,Y
C - - - - - 0x01108F 04:907F: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x011092 04:9082: 20 0D 8F  JSR sub_8F0D
C - - - - - 0x011095 04:9085: 4C B7 A6  JMP loc_0x0066C7_delete_object_03



loc_9088:
C D 0 - - - 0x011098 04:9088: A8        TAY
C - - - - - 0x011099 04:9089: B9 A8 90  LDA tbl_90A8,Y
C - - - - - 0x01109C 04:908C: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01109F 04:908F: B9 AC 90  LDA tbl_90AC,Y
C - - - - - 0x0110A2 04:9092: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x0110A5 04:9095: A5 13     LDA ram_0013
C - - - - - 0x0110A7 04:9097: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0110AA 04:909A: 20 13 8F  JSR sub_8F13
C - - - - - 0x0110AD 04:909D: 4C B7 A6  JMP loc_0x0066C7_delete_object_03



tbl_90A0:
- D 0 - - - 0x0110B0 04:90A0: 00        .byte $00   ; 01
- D 0 - - - 0x0110B1 04:90A1: 00        .byte $00   ; 02
- D 0 - - - 0x0110B2 04:90A2: 08        .byte $08   ; 03
- - - - - - 0x0110B3 04:90A3: F8        .byte $F8   ; 04



tbl_90A4:
- D 0 - - - 0x0110B4 04:90A4: 08        .byte $08   ; 01
- D 0 - - - 0x0110B5 04:90A5: F8        .byte $F8   ; 02
- D 0 - - - 0x0110B6 04:90A6: 00        .byte $00   ; 03
- - - - - - 0x0110B7 04:90A7: 00        .byte $00   ; 04



tbl_90A8:
- D 0 - - - 0x0110B8 04:90A8: 00        .byte $00   ; 00 (01)
- D 0 - - - 0x0110B9 04:90A9: 0C        .byte $0C   ; 01 (02)
- D 0 - - - 0x0110BA 04:90AA: 06        .byte $06   ; 02 (03)
- - - - - - 0x0110BB 04:90AB: 12        .byte $12   ; 03 (04)



tbl_90AC:
- D 0 - - - 0x0110BC 04:90AC: 00        .byte $00   ; 00
- D 0 - - - 0x0110BD 04:90AD: 04        .byte $04   ; 01
- D 0 - - - 0x0110BE 04:90AE: 02        .byte $02   ; 02
- - - - - - 0x0110BF 04:90AF: 06        .byte $06   ; 03



tbl_90B0:
- D 0 - - - 0x0110C0 04:90B0: F0        .byte $F0   ; 00
- D 0 - - - 0x0110C1 04:90B1: 10        .byte $10   ; 01



tbl_90B2:
- D 0 - - - 0x0110C2 04:90B2: 1A        .byte $1A   ; 00
- D 0 - - - 0x0110C3 04:90B3: 08        .byte $08   ; 01
- D 0 - - - 0x0110C4 04:90B4: 18        .byte $18   ; 02
- D 0 - - - 0x0110C5 04:90B5: 20        .byte $20   ; 03
- D 0 - - - 0x0110C6 04:90B6: 02        .byte $02   ; 04
- D 0 - - - 0x0110C7 04:90B7: 1C        .byte $1C   ; 05
- D 0 - - - 0x0110C8 04:90B8: 05        .byte $05   ; 06
- D 0 - - - 0x0110C9 04:90B9: 0E        .byte $0E   ; 07



sub_90BA:
C - - - - - 0x0110CA 04:90BA: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0110CD 04:90BD: 18        CLC
C - - - - - 0x0110CE 04:90BE: 69 0C     ADC #$0C
C - - - - - 0x0110D0 04:90C0: C9 18     CMP #$18
C - - - - - 0x0110D2 04:90C2: 90 02     BCC bra_90C6
C - - - - - 0x0110D4 04:90C4: E9 18     SBC #$18
bra_90C6:
C - - - - - 0x0110D6 04:90C6: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0110D9 04:90C9: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0110DC 04:90CC: 18        CLC
C - - - - - 0x0110DD 04:90CD: 69 04     ADC #$04
C - - - - - 0x0110DF 04:90CF: C9 08     CMP #$08
C - - - - - 0x0110E1 04:90D1: 90 02     BCC bra_90D5
C - - - - - 0x0110E3 04:90D3: E9 08     SBC #$08
bra_90D5:
C - - - - - 0x0110E5 04:90D5: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x0110E8 04:90D8: 4C 13 8F  JMP loc_8F13



sub_90DB:
C - - - - - 0x0110EB 04:90DB: 20 0B 91  JSR sub_910B
C - - - - - 0x0110EE 04:90DE: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x0110F1 04:90E1: 30 0F     BMI bra_90F2
C - - - - - 0x0110F3 04:90E3: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x0110F6 04:90E6: 84 0A     STY ram_000A
C - - - - - 0x0110F8 04:90E8: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x0110FB 04:90EB: 29 FE     AND #$FE
C - - - - - 0x0110FD 04:90ED: 05 0A     ORA ram_000A
C - - - - - 0x0110FF 04:90EF: 9D 72 07  STA ram_0772_obj,X
bra_90F2:
C - - - - - 0x011102 04:90F2: 85 0A     STA ram_000A
C - - - - - 0x011104 04:90F4: 60        RTS



sub_90F5:
C - - - - - 0x011105 04:90F5: 20 0B 91  JSR sub_910B
C - - - - - 0x011108 04:90F8: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x01110B 04:90FB: 30 0D     BMI bra_910A_RTS
C - - - - - 0x01110D 04:90FD: 29 01     AND #$01
C - - - - - 0x01110F 04:90FF: A8        TAY
C - - - - - 0x011110 04:9100: B9 32 05  LDA ram_pos_Y_hi_plr,Y
C - - - - - 0x011113 04:9103: 85 0C     STA ram_000C
C - - - - - 0x011115 04:9105: B9 4C 05  LDA ram_pos_X_hi_plr,Y
C - - - - - 0x011118 04:9108: 85 0B     STA ram_000B
bra_910A_RTS:
C - - - - - 0x01111A 04:910A: 60        RTS



sub_910B:
C - - - - - 0x01111B 04:910B: A5 23     LDA ram_рандом_байт_1
C - - - - - 0x01111D 04:910D: 29 03     AND #$03
C - - - - - 0x01111F 04:910F: A8        TAY
C - - - - - 0x011120 04:9110: B9 1A 91  LDA tbl_911A,Y
C - - - - - 0x011123 04:9113: 85 0B     STA ram_000B
C - - - - - 0x011125 04:9115: A9 FF     LDA #$FF
C - - - - - 0x011127 04:9117: 85 0C     STA ram_000C
C - - - - - 0x011129 04:9119: 60        RTS



tbl_911A:
- D 0 - - - 0x01112A 04:911A: 20        .byte $20   ; 00 
- D 0 - - - 0x01112B 04:911B: 60        .byte $60   ; 01 
- D 0 - - - 0x01112C 04:911C: A0        .byte $A0   ; 02 
- D 0 - - - 0x01112D 04:911D: E0        .byte $E0   ; 03 



ofs_038_24_911E_03:
C - - J - - 0x01112E 04:911E: 20 57 91  JSR sub_9157
C - - - - - 0x011131 04:9121: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x011134 04:9124: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x011137 04:9127: F0 24     BEQ bra_914D
C - - - - - 0x011139 04:9129: BD F4 06  LDA ram_06F4_obj,X
C - - - - - 0x01113C 04:912C: C9 0C     CMP #$0C
C - - - - - 0x01113E 04:912E: D0 1C     BNE bra_914C_RTS
C - - - - - 0x011140 04:9130: A9 06     LDA #$06
C - - - - - 0x011142 04:9132: 9D 80 07  STA ram_0780_obj,X
C - - - - - 0x011145 04:9135: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x011148 04:9138: 10 03     BPL bra_913D
C - - - - - 0x01114A 04:913A: 20 0B AB  JSR sub_0x006B1B
bra_913D:
C - - - - - 0x01114D 04:913D: 85 0A     STA ram_000A
C - - - - - 0x01114F 04:913F: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x011152 04:9142: A0 03     LDY #$03
C - - - - - 0x011154 04:9144: 20 27 F3  JSR sub_0x01F337
C - - - - - 0x011157 04:9147: A9 08     LDA #$08
C - - - - - 0x011159 04:9149: 9D F4 06  STA ram_06F4_obj,X
bra_914C_RTS:
C - - - - - 0x01115C 04:914C: 60        RTS
bra_914D:
C - - - - - 0x01115D 04:914D: A9 40     LDA #$40
C - - - - - 0x01115F 04:914F: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x011162 04:9152: A9 02     LDA #$02
C - - - - - 0x011164 04:9154: 4C 83 A2  JMP loc_0x006293_set_obj_state



sub_9157:
C - - - - - 0x011167 04:9157: A9 00     LDA #$00
C - - - - - 0x011169 04:9159: 9D 10 07  STA ram_0710_obj,X
; bzk optimize, useless branch
C - - - - - 0x01116C 04:915C: D0 1D     BNE bra_917B
sub_915E:
C - - - - - 0x01116E 04:915E: FE 02 07  INC ram_0702_obj,X
C - - - - - 0x011171 04:9161: BD 02 07  LDA ram_0702_obj,X
C - - - - - 0x011174 04:9164: C9 08     CMP #$08
C - - - - - 0x011176 04:9166: 90 10     BCC bra_9178_not_overflow
C - - - - - 0x011178 04:9168: A9 00     LDA #$00
C - - - - - 0x01117A 04:916A: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x01117D 04:916D: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x011180 04:9170: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x011183 04:9173: 29 01     AND #$01
C - - - - - 0x011185 04:9175: 9D 10 07  STA ram_0710_obj,X
bra_9178_not_overflow:
C - - - - - 0x011188 04:9178: BC 56 07  LDY ram_0756_obj,X
bra_917B:
C - - - - - 0x01118B 04:917B: B9 8F 91  LDA tbl_918F_spr_attr,Y
C - - - - - 0x01118E 04:917E: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x011191 04:9181: 98        TYA
C - - - - - 0x011192 04:9182: 0A        ASL
C - - - - - 0x011193 04:9183: 18        CLC
C - - - - - 0x011194 04:9184: 7D 10 07  ADC ram_0710_obj,X
C - - - - - 0x011197 04:9187: A8        TAY
C - - - - - 0x011198 04:9188: B9 97 91  LDA tbl_9197_animation,Y
C - - - - - 0x01119B 04:918B: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x01119E 04:918E: 60        RTS



tbl_918F_spr_attr:
- D 0 - - - 0x01119F 04:918F: 40        .byte $40   ; 00 
- D 0 - - - 0x0111A0 04:9190: 40        .byte $40   ; 01 
- D 0 - - - 0x0111A1 04:9191: 00        .byte $00   ; 02 
- D 0 - - - 0x0111A2 04:9192: 00        .byte $00   ; 03 
- D 0 - - - 0x0111A3 04:9193: 00        .byte $00   ; 04 
- D 0 - - - 0x0111A4 04:9194: 00        .byte $00   ; 05 
- D 0 - - - 0x0111A5 04:9195: 00        .byte $00   ; 06 
- D 0 - - - 0x0111A6 04:9196: 40        .byte $40   ; 07 



tbl_9197_animation:
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- D 0 - - - 0x0111A7 04:9197: 7C        .byte $7C, $7D   ; 00 
- D 0 - - - 0x0111A9 04:9199: 7A        .byte $7A, $7B   ; 01 
- D 0 - - - 0x0111AB 04:919B: 78        .byte $78, $79   ; 02 
- D 0 - - - 0x0111AD 04:919D: 7A        .byte $7A, $7B   ; 03 
- D 0 - - - 0x0111AF 04:919F: 7C        .byte $7C, $7D   ; 04 
- D 0 - - - 0x0111B1 04:91A1: 7E        .byte $7E, $7F   ; 05 
- D 0 - - - 0x0111B3 04:91A3: 80        .byte $80, $81   ; 06 
- D 0 - - - 0x0111B5 04:91A5: 7E        .byte $7E, $7F   ; 07 



_off001_0x0111B7_60_big_red_spiked_ball:
- D 0 - I - 0x0111B7 04:91A7: B5 91     .word ofs_038_60_91B5_01_initialize_object ; 
- D 0 - I - 0x0111B9 04:91A9: C9 91     .word ofs_038_60_91C9_02 ; 
- D 0 - I - 0x0111BB 04:91AB: 05 92     .word ofs_038_60_9205_03 ; 
- D 0 - I - 0x0111BD 04:91AD: 7A 92     .word ofs_038_60_927A_04 ; 
- D 0 - I - 0x0111BF 04:91AF: 97 92     .word ofs_038_60_9297_05 ; 
- D 0 - I - 0x0111C1 04:91B1: 9D 92     .word ofs_038_60_929D_06 ; 
- D 0 - I - 0x0111C3 04:91B3: A3 92     .word ofs_038_60_92A3_07 ; 



ofs_038_60_91B5_01_initialize_object:
C - - J - - 0x0111C5 04:91B5: A9 81     LDA #$81
C - - - - - 0x0111C7 04:91B7: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x0111CA 04:91BA: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0111CD 04:91BD: 18        CLC
C - - - - - 0x0111CE 04:91BE: 69 08     ADC #$08
C - - - - - 0x0111D0 04:91C0: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0111D3 04:91C3: 20 C5 92  JSR sub_92C5
C - - - - - 0x0111D6 04:91C6: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_60_91C9_02:
C - - J - - 0x0111D9 04:91C9: A9 01     LDA #$01
C - - - - - 0x0111DB 04:91CB: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x0111DE 04:91CE: 20 C5 92  JSR sub_92C5
C - - - - - 0x0111E1 04:91D1: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0111E4 04:91D4: C9 10     CMP #$10
C - - - - - 0x0111E6 04:91D6: 90 2A     BCC bra_9202_RTS
C - - - - - 0x0111E8 04:91D8: C9 FF     CMP #$FF
C - - - - - 0x0111EA 04:91DA: D0 03     BNE bra_91DF
C - - - - - 0x0111EC 04:91DC: 4C 75 A2  JMP loc_0x006285_delete_object_02
bra_91DF:
C - - - - - 0x0111EF 04:91DF: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0111F2 04:91E2: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0111F5 04:91E5: 29 01     AND #$01
C - - - - - 0x0111F7 04:91E7: A8        TAY
C - - - - - 0x0111F8 04:91E8: B9 03 92  LDA tbl_9203_pos_X,Y
C - - - - - 0x0111FB 04:91EB: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0111FE 04:91EE: A9 00     LDA #$00
C - - - - - 0x011200 04:91F0: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x011203 04:91F3: A9 00     LDA #$00
C - - - - - 0x011205 04:91F5: 9D 3A 07  STA ram_073A_obj_hitbox_index,X
C - - - - - 0x011208 04:91F8: A0 0D     LDY #$0D
C - - - - - 0x01120A 04:91FA: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x01120D 04:91FD: A9 32     LDA #$32
C - - - - - 0x01120F 04:91FF: 4C E0 A2  JMP loc_0x0062F0
bra_9202_RTS:
C - - - - - 0x011212 04:9202: 60        RTS



tbl_9203_pos_X:
- D 0 - - - 0x011213 04:9203: E0        .byte $E0   ; 00 
- D 0 - - - 0x011214 04:9204: 20        .byte $20   ; 01 



ofs_038_60_9205_03:
C - - J - - 0x011215 04:9205: A0 0D     LDY #$0D
C - - - - - 0x011217 04:9207: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x01121A 04:920A: 20 C5 92  JSR sub_92C5
C - - - - - 0x01121D 04:920D: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011220 04:9210: D0 F0     BNE bra_9202_RTS
C - - - - - 0x011222 04:9212: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x011225 04:9215: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x011228 04:9218: 38        SEC
C - - - - - 0x011229 04:9219: F9 32 05  SBC ram_pos_Y_hi_plr,Y
C - - - - - 0x01122C 04:921C: A0 00     LDY #$00
C - - - - - 0x01122E 04:921E: 90 02     BCC bra_9222
C - - - - - 0x011230 04:9220: A0 04     LDY #$04
bra_9222:
C - - - - - 0x011232 04:9222: B0 04     BCS bra_9228
C - - - - - 0x011234 04:9224: 49 FF     EOR #$FF
C - - - - - 0x011236 04:9226: 69 01     ADC #$01
bra_9228:
C - - - - - 0x011238 04:9228: C9 20     CMP #$20
C - - - - - 0x01123A 04:922A: B0 02     BCS bra_922E
C - - - - - 0x01123C 04:922C: A0 02     LDY #$02
bra_922E:
C - - - - - 0x01123E 04:922E: A5 72     LDA ram_cam_spd_Y
C - - - - - 0x011240 04:9230: F0 02     BEQ bra_9234
C - - - - - 0x011242 04:9232: C8        INY
C - - - - - 0x011243 04:9233: C8        INY
bra_9234:
C - - - - - 0x011244 04:9234: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x011247 04:9237: 4A        LSR
C - - - - - 0x011248 04:9238: 90 01     BCC bra_923B
C - - - - - 0x01124A 04:923A: C8        INY
bra_923B:
C - - - - - 0x01124B 04:923B: 98        TYA
C - - - - - 0x01124C 04:923C: 0A        ASL
C - - - - - 0x01124D 04:923D: 0A        ASL
C - - - - - 0x01124E 04:923E: A8        TAY
C - - - - - 0x01124F 04:923F: B9 5A 92  LDA tbl_925A_speed,Y
C - - - - - 0x011252 04:9242: 9D A0 06  STA ram_spd_Y_lo_obj,X
C - - - - - 0x011255 04:9245: B9 5B 92  LDA tbl_925A_speed + $01,Y
C - - - - - 0x011258 04:9248: 9D AE 06  STA ram_spd_Y_hi_obj,X
C - - - - - 0x01125B 04:924B: B9 5C 92  LDA tbl_925A_speed + $02,Y
C - - - - - 0x01125E 04:924E: 9D BC 06  STA ram_spd_X_lo_obj,X
C - - - - - 0x011261 04:9251: B9 5D 92  LDA tbl_925A_speed + $03,Y
C - - - - - 0x011264 04:9254: 9D CA 06  STA ram_spd_X_hi_obj,X
C - - - - - 0x011267 04:9257: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_925A_speed:
; 00 
- D 0 - - - 0x01126A 04:925A: 81 00     .word $0081 ; Y
- D 0 - - - 0x01126C 04:925C: A6 FE     .word $FEA6 ; X
; 01 
- D 0 - - - 0x01126E 04:925E: 81 00     .word $0081 ; Y
- D 0 - - - 0x011270 04:9260: 5A 01     .word $015A ; X
; 02 
- D 0 - - - 0x011272 04:9262: 00 00     .word $0000 ; Y
- D 0 - - - 0x011274 04:9264: 80 FE     .word $FE80 ; X
; 03 
- D 0 - - - 0x011276 04:9266: 00 00     .word $0000 ; Y
- D 0 - - - 0x011278 04:9268: 80 01     .word $0180 ; X
; 04 
- D 0 - - - 0x01127A 04:926A: 7F FF     .word $FF7F ; Y
- D 0 - - - 0x01127C 04:926C: A6 FE     .word $FEA6 ; X
; 05 
- D 0 - - - 0x01127E 04:926E: 7F FF     .word $FF7F ; Y
- D 0 - - - 0x011280 04:9270: 5A 01     .word $015A ; X
; 06 
- D 0 - - - 0x011282 04:9272: 7F FF     .word $FF7F ; Y
- D 0 - - - 0x011284 04:9274: A6 FE     .word $FEA6 ; X
; 07 
- D 0 - - - 0x011286 04:9276: 7F FF     .word $FF7F ; Y
- D 0 - - - 0x011288 04:9278: 5A 01     .word $015A ; X



ofs_038_60_927A_04:
C - - J - - 0x01128A 04:927A: A0 0D     LDY #$0D
C - - - - - 0x01128C 04:927C: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x01128F 04:927F: 20 AF 92  JSR sub_92AF
C - - - - - 0x011292 04:9282: 20 6F 93  JSR sub_936F
C - - - - - 0x011295 04:9285: 10 0F     BPL bra_9296_RTS
bra_9287:
sub_9287:
C - - - - - 0x011297 04:9287: A0 60     LDY #con_obj_id_60
C - - - - - 0x011299 04:9289: 20 9E F7  JSR sub_0x01F7AE_prepare_object
C - - - - - 0x01129C 04:928C: A9 02     LDA #$02
C - - - - - 0x01129E 04:928E: 9D 68 06  STA ram_obj_state,X
C - - - - - 0x0112A1 04:9291: A9 00     LDA #$00
C - - - - - 0x0112A3 04:9293: 9D 10 07  STA ram_0710_obj,X
bra_9296_RTS:
C - - - - - 0x0112A6 04:9296: 60        RTS



ofs_038_60_9297_05:
C - - J - - 0x0112A7 04:9297: 20 9A A2  JSR sub_0x0062AA
C - - - - - 0x0112AA 04:929A: 4C A6 92  JMP loc_92A6



ofs_038_60_929D_06:
C - - J - - 0x0112AD 04:929D: 20 FD A2  JSR sub_0x00630D
C - - - - - 0x0112B0 04:92A0: 4C A6 92  JMP loc_92A6



ofs_038_60_92A3_07:
C - - J - - 0x0112B3 04:92A3: 20 3D A3  JSR sub_0x00634D_delete_object_04
loc_92A6:
C D 0 - - - 0x0112B6 04:92A6: 20 D5 92  JSR sub_92D5
C - - - - - 0x0112B9 04:92A9: BD 68 06  LDA ram_obj_state,X
C - - - - - 0x0112BC 04:92AC: F0 D9     BEQ bra_9287
C - - - - - 0x0112BE 04:92AE: 60        RTS



sub_92AF:
C - - - - - 0x0112BF 04:92AF: 20 ED A6  JSR sub_0x0066FD
C - - - - - 0x0112C2 04:92B2: BD 84 06  LDA ram_pos_Y_lo_enemy,X
C - - - - - 0x0112C5 04:92B5: 18        CLC
C - - - - - 0x0112C6 04:92B6: 7D A0 06  ADC ram_spd_Y_lo_obj,X
C - - - - - 0x0112C9 04:92B9: 9D 84 06  STA ram_pos_Y_lo_enemy,X
C - - - - - 0x0112CC 04:92BC: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0112CF 04:92BF: 7D AE 06  ADC ram_spd_Y_hi_obj,X
C - - - - - 0x0112D2 04:92C2: 4C C8 92  JMP loc_92C8



sub_92C5:
C - - - - - 0x0112D5 04:92C5: BD 22 05  LDA ram_pos_Y_hi_enemy,X
loc_92C8:
C D 0 - - - 0x0112D8 04:92C8: 38        SEC
C - - - - - 0x0112D9 04:92C9: E5 72     SBC ram_cam_spd_Y
C - - - - - 0x0112DB 04:92CB: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0112DE 04:92CE: C9 E8     CMP #$E8
C - - - - - 0x0112E0 04:92D0: 90 03     BCC bra_92D5
C - - - - - 0x0112E2 04:92D2: 20 87 92  JSR sub_9287
bra_92D5:
sub_92D5:
C - - - - - 0x0112E5 04:92D5: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0112E8 04:92D8: C9 FF     CMP #$FF
C - - - - - 0x0112EA 04:92DA: F0 BA     BEQ bra_9296_RTS
C - - - - - 0x0112EC 04:92DC: 38        SEC
C - - - - - 0x0112ED 04:92DD: E5 72     SBC ram_cam_spd_Y
C - - - - - 0x0112EF 04:92DF: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0112F2 04:92E2: C9 E0     CMP #$E0
C - - - - - 0x0112F4 04:92E4: 90 B0     BCC bra_9296_RTS
C - - - - - 0x0112F6 04:92E6: A9 FF     LDA #$FF
C - - - - - 0x0112F8 04:92E8: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0112FB 04:92EB: 60        RTS



_off001_0x0112FC_61_boss_6_big_red_spiked_ball:
- D 0 - I - 0x0112FC 04:92EC: F6 92     .word ofs_038_61_92F6_01_initialize_object ; 
- D 0 - I - 0x0112FE 04:92EE: 05 93     .word ofs_038_61_9305_02 ; 
- D 0 - I - 0x011300 04:92F0: 9A A2     .word ofs_038_61_0x0062AA_03 ; 
- D 0 - I - 0x011302 04:92F2: FD A2     .word ofs_038_61_0x00630D_04 ; 
- D 0 - I - 0x011304 04:92F4: 3D A3     .word ofs_038_61_0x00634D_05_delete_object_04 ; 



ofs_038_61_92F6_01_initialize_object:
C - - J - - 0x011306 04:92F6: A9 06     LDA #$06
C - - - - - 0x011308 04:92F8: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01130B 04:92FB: A9 01     LDA #$01
C - - - - - 0x01130D 04:92FD: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x011310 04:9300: A9 01     LDA #$01
C - - - - - 0x011312 04:9302: 4C E0 A2  JMP loc_0x0062F0



ofs_038_61_9305_02:
C - - J - - 0x011315 04:9305: A0 0D     LDY #$0D
C - - - - - 0x011317 04:9307: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x01131A 04:930A: 20 23 93  JSR sub_9323
C - - - - - 0x01131D 04:930D: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x011320 04:9310: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011323 04:9313: D0 0D     BNE bra_9322_RTS
C - - - - - 0x011325 04:9315: A9 18     LDA #$18
C - - - - - 0x011327 04:9317: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x01132A 04:931A: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x01132D 04:931D: A0 01     LDY #$01
C - - - - - 0x01132F 04:931F: 4C 23 A9  JMP loc_0x006933
bra_9322_RTS:
C - - - - - 0x011332 04:9322: 60        RTS



sub_9323:
C - - - - - 0x011333 04:9323: A9 08     LDA #$08
C - - - - - 0x011335 04:9325: BC CA 06  LDY ram_spd_X_hi_obj,X
C - - - - - 0x011338 04:9328: 10 02     BPL bra_932C
C - - - - - 0x01133A 04:932A: A9 F8     LDA #$F8
bra_932C:
C - - - - - 0x01133C 04:932C: 18        CLC
C - - - - - 0x01133D 04:932D: 7D 3C 05  ADC ram_pos_X_hi_enemy,X
C - - - - - 0x011340 04:9330: BC 22 05  LDY ram_pos_Y_hi_enemy,X
C - - - - - 0x011343 04:9333: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x011346 04:9336: C9 02     CMP #$02
C - - - - - 0x011348 04:9338: B0 07     BCS bra_9341
C - - - - - 0x01134A 04:933A: A9 02     LDA #$02
C - - - - - 0x01134C 04:933C: 20 71 93  JSR sub_9371
C - - - - - 0x01134F 04:933F: 10 08     BPL bra_9349
bra_9341:
C - - - - - 0x011351 04:9341: 20 D3 A7  JSR sub_0x0067E3_clear_spd_X
C - - - - - 0x011354 04:9344: A9 01     LDA #$01
C - - - - - 0x011356 04:9346: 9D E6 06  STA ram_06E6_obj,X
bra_9349:
C - - - - - 0x011359 04:9349: A9 08     LDA #$08
C - - - - - 0x01135B 04:934B: BC AE 06  LDY ram_spd_Y_hi_obj,X
C - - - - - 0x01135E 04:934E: 10 02     BPL bra_9352
C - - - - - 0x011360 04:9350: A9 F8     LDA #$F8
bra_9352:
C - - - - - 0x011362 04:9352: 18        CLC
C - - - - - 0x011363 04:9353: 7D 22 05  ADC ram_pos_Y_hi_enemy,X
C - - - - - 0x011366 04:9356: A8        TAY
C - - - - - 0x011367 04:9357: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x01136A 04:935A: 20 C0 BA  JSR sub_0x007AD0
C - - - - - 0x01136D 04:935D: C9 02     CMP #$02
C - - - - - 0x01136F 04:935F: B0 05     BCS bra_9366
C - - - - - 0x011371 04:9361: 20 89 93  JSR sub_9389
C - - - - - 0x011374 04:9364: 10 08     BPL bra_936E_RTS
bra_9366:
C - - - - - 0x011376 04:9366: 20 CA A7  JSR sub_0x0067DA_clear_spd_Y
C - - - - - 0x011379 04:9369: A9 01     LDA #$01
C - - - - - 0x01137B 04:936B: 9D E6 06  STA ram_06E6_obj,X
bra_936E_RTS:
C - - - - - 0x01137E 04:936E: 60        RTS



sub_936F:
C - - - - - 0x01137F 04:936F: A9 00     LDA #$00
sub_9371:
C - - - - - 0x011381 04:9371: 85 08     STA ram_0008
C - - - - - 0x011383 04:9373: BD CA 06  LDA ram_spd_X_hi_obj,X
C - - - - - 0x011386 04:9376: 2A        ROL
C - - - - - 0x011387 04:9377: 2A        ROL
C - - - - - 0x011388 04:9378: 29 01     AND #$01
C - - - - - 0x01138A 04:937A: 18        CLC
C - - - - - 0x01138B 04:937B: 65 08     ADC ram_0008
C - - - - - 0x01138D 04:937D: A8        TAY
C - - - - - 0x01138E 04:937E: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x011391 04:9381: D9 9C 93  CMP tbl_939C_pos_X,Y
C - - - - - 0x011394 04:9384: 6A        ROR
C - - - - - 0x011395 04:9385: 5D CA 06  EOR ram_spd_X_hi_obj,X
C - - - - - 0x011398 04:9388: 60        RTS



sub_9389:
C - - - - - 0x011399 04:9389: BD AE 06  LDA ram_spd_Y_hi_obj,X
C - - - - - 0x01139C 04:938C: 2A        ROL
C - - - - - 0x01139D 04:938D: 2A        ROL
C - - - - - 0x01139E 04:938E: 29 01     AND #$01
C - - - - - 0x0113A0 04:9390: A8        TAY
C - - - - - 0x0113A1 04:9391: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0113A4 04:9394: D9 A0 93  CMP tbl_93A0_pos_Y,Y
C - - - - - 0x0113A7 04:9397: 6A        ROR
C - - - - - 0x0113A8 04:9398: 5D AE 06  EOR ram_spd_Y_hi_obj,X
C - - - - - 0x0113AB 04:939B: 60        RTS



tbl_939C_pos_X:
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- D 0 - - - 0x0113AC 04:939C: E0        .byte $E0, $20   ; 00 
- D 0 - - - 0x0113AE 04:939E: F8        .byte $F8, $08   ; 02 



tbl_93A0_pos_Y:
- D 0 - - - 0x0113B0 04:93A0: D0        .byte $D0   ; 00 
- D 0 - - - 0x0113B1 04:93A1: 18        .byte $18   ; 01 



_off001_0x0113B2_70_boss_6_hole:
- D 0 - I - 0x0113B2 04:93A2: A8 93     .word ofs_038_70_93A8_01_initialize_object ; 
- D 0 - I - 0x0113B4 04:93A4: B0 93     .word ofs_038_70_93B0_02 ; 
- D 0 - I - 0x0113B6 04:93A6: 75 A2     .word ofs_038_70_0x006285_03_delete_object_02 ; 



ofs_038_70_93A8_01_initialize_object:
C - - J - - 0x0113B8 04:93A8: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0113BB 04:93AB: A9 70     LDA #$70
C - - - - - 0x0113BD 04:93AD: 4C E0 A2  JMP loc_0x0062F0



ofs_038_70_93B0_02:
C - - J - - 0x0113C0 04:93B0: 20 B7 A6  JSR sub_0x0066C7_delete_object_03
C - - - - - 0x0113C3 04:93B3: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0113C6 04:93B6: D0 11     BNE bra_93C9_RTS
C - - - - - 0x0113C8 04:93B8: A0 61     LDY #$61
C - - - - - 0x0113CA 04:93BA: 84 17     STY ram_0017
C - - - - - 0x0113CC 04:93BC: A2 05     LDX #$05
C - - - - - 0x0113CE 04:93BE: 20 08 F7  JSR sub_0x01F718_try_to_find_free_object
C - - - - - 0x0113D1 04:93C1: 20 CD AB  JSR sub_0x006BDD
C - - - - - 0x0113D4 04:93C4: A9 F0     LDA #$F0
C - - - - - 0x0113D6 04:93C6: 9D E6 06  STA ram_06E6_obj,X
bra_93C9_RTS:
C - - - - - 0x0113D9 04:93C9: 60        RTS



_off001_0x0113DA_71_chr_banks_changer:
- D 0 - I - 0x0113DA 04:93CA: CE 93     .word ofs_038_71_93CE_01_initialize_object ; 
- D 0 - I - 0x0113DC 04:93CC: FB 93     .word ofs_038_71_93FB_02 ; 



ofs_038_71_93CE_01_initialize_object:
C - - J - - 0x0113DE 04:93CE: A9 F0     LDA #con__hp_F0
C - - - - - 0x0113E0 04:93D0: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x0113E3 04:93D3: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x0113E6 04:93D6: 29 01     AND #$01
C - - - - - 0x0113E8 04:93D8: A8        TAY
C - - - - - 0x0113E9 04:93D9: B9 F3 93  LDA tbl_93F3_chr_bank_bg_0,Y
C - - - - - 0x0113EC 04:93DC: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x0113EF 04:93DF: B9 F5 93  LDA tbl_93F5_chr_bank_bg_1,Y
C - - - - - 0x0113F2 04:93E2: 8D F1 07  STA ram_bg_bank_1 + $01
C - - - - - 0x0113F5 04:93E5: B9 F7 93  LDA tbl_93F7_irq_handler,Y
C - - - - - 0x0113F8 04:93E8: 85 27     STA ram_irq_handler_hi
C - - - - - 0x0113FA 04:93EA: B9 F9 93  LDA tbl_93F9,Y
C - - - - - 0x0113FD 04:93ED: 20 FD 93  JSR sub_93FD
C - - - - - 0x011400 04:93F0: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_93F3_chr_bank_bg_0:
- D 0 - - - 0x011403 04:93F3: 50        .byte con_chr_bank + $50   ; 00 
- D 0 - - - 0x011404 04:93F4: 54        .byte con_chr_bank + $54   ; 01 



tbl_93F5_chr_bank_bg_1:
- D 0 - - - 0x011405 04:93F5: 52        .byte con_chr_bank + $52   ; 00 
- D 0 - - - 0x011406 04:93F6: 56        .byte con_chr_bank + $56   ; 01 



tbl_93F7_irq_handler:
- D 0 - - - 0x011407 04:93F7: 0E        .byte con_irq_area_6_change_floor_color   ; 00 
- D 0 - - - 0x011408 04:93F8: 0F        .byte con_irq_area_6_boss   ; 01 



tbl_93F9:
- D 0 - - - 0x011409 04:93F9: 06        .byte $06   ; 00 
- D 0 - - - 0x01140A 04:93FA: 08        .byte $08   ; 01 



ofs_038_71_93FB_02:
C - - J - - 0x01140B 04:93FB: A5 45     LDA ram_0045
sub_93FD:
C - - - - - 0x01140D 04:93FD: 38        SEC
C - - - - - 0x01140E 04:93FE: E5 72     SBC ram_cam_spd_Y
C - - - - - 0x011410 04:9400: 85 45     STA ram_0045
C - - - - - 0x011412 04:9402: C9 F0     CMP #$F0
C - - - - - 0x011414 04:9404: B0 07     BCS bra_940D
C - - - - - 0x011416 04:9406: A5 71     LDA ram_0071_flag
C - - - - - 0x011418 04:9408: 30 09     BMI bra_9413_RTS
C - - - - - 0x01141A 04:940A: 4C 7F FC  JMP loc_0x01FC8F_copy_reg_values
bra_940D:
C - - - - - 0x01141D 04:940D: 20 75 A2  JSR sub_0x006285_delete_object_02
C - - - - - 0x011420 04:9410: 4C 8C FC  JMP loc_0x01FC9C_increase_002B
bra_9413_RTS:
C - - - - - 0x011423 04:9413: 60        RTS



_off001_0x011424_65_boss_6_phase_2:
- D 0 - I - 0x011424 04:9414: 2E 94     .word ofs_038_65_942E_01_initialize_object ; 
- D 0 - I - 0x011426 04:9416: 58 94     .word ofs_038_65_9458_02 ; 
- D 0 - I - 0x011428 04:9418: 72 94     .word ofs_038_65_9472_03 ; 
- D 0 - I - 0x01142A 04:941A: 91 94     .word ofs_038_65_9491_04 ; 
- D 0 - I - 0x01142C 04:941C: D3 94     .word ofs_038_65_94D3_05 ; 
- D 0 - I - 0x01142E 04:941E: 1E 95     .word ofs_038_65_951E_06 ; 
- D 0 - I - 0x011430 04:9420: 64 95     .word ofs_038_65_9564_07 ; 
- D 0 - I - 0x011432 04:9422: 73 95     .word ofs_038_65_9573_08 ; 
- D 0 - I - 0x011434 04:9424: C5 95     .word ofs_038_65_95C5_09 ; 
- D 0 - I - 0x011436 04:9426: C8 95     .word ofs_038_65_95C8_0A ; 
- D 0 - I - 0x011438 04:9428: CB 95     .word ofs_038_65_95CB_0B ; 
- D 0 - I - 0x01143A 04:942A: F6 A2     .word ofs_038_65_0x006306_0C ; 
- D 0 - I - 0x01143C 04:942C: DF 95     .word ofs_038_65_95DF_0D ; 



ofs_038_65_942E_01_initialize_object:
C - - J - - 0x01143E 04:942E: A9 10     LDA #$10
C - - - - - 0x011440 04:9430: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x011443 04:9433: A9 F0     LDA #con__hp_F0
C - - - - - 0x011445 04:9435: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x011448 04:9438: A9 58     LDA #con_chr_bank + $58
C - - - - - 0x01144A 04:943A: 8D F1 07  STA ram_bg_bank_1 + $01
C - - - - - 0x01144D 04:943D: A9 11     LDA #con_chr_bank + $11
C - - - - - 0x01144F 04:943F: 8D F5 07  STA ram_bg_bank_1 + $05
C - - - - - 0x011452 04:9442: A9 FF     LDA #$FF
C - - - - - 0x011454 04:9444: 8D CF 03  STA ram_03CF
C - - - - - 0x011457 04:9447: A0 9C     LDY #con_F97C_colors + $9C
C - - - - - 0x011459 04:9449: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x01145C 04:944C: A0 A0     LDY #con_F97C_colors + $A0
C - - - - - 0x01145E 04:944E: 20 64 F9  JSR sub_0x01F974_write_3_colors_with_condition
C - - - - - 0x011461 04:9451: A6 10     LDX ram_0010
C - - - - - 0x011463 04:9453: A9 70     LDA #$70
C - - - - - 0x011465 04:9455: 4C E0 A2  JMP loc_0x0062F0



ofs_038_65_9458_02:
C - - J - - 0x011468 04:9458: A5 5B     LDA ram_005B
C - - - - - 0x01146A 04:945A: 4A        LSR
C - - - - - 0x01146B 04:945B: 90 6C     BCC bra_94C9_RTS
C - - - - - 0x01146D 04:945D: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011470 04:9460: D0 67     BNE bra_94C9_RTS
C - - - - - 0x011472 04:9462: A9 00     LDA #$00
C - - - - - 0x011474 04:9464: 85 64     STA ram_0064
C - - - - - 0x011476 04:9466: A9 02     LDA #$02
C - - - - - 0x011478 04:9468: 85 61     STA ram_0061
C - - - - - 0x01147A 04:946A: A9 08     LDA #$08
C - - - - - 0x01147C 04:946C: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01147F 04:946F: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_65_9472_03:
C - - J - - 0x011482 04:9472: A5 60     LDA ram_0060
C - - - - - 0x011484 04:9474: 05 70     ORA ram_0070
C - - - - - 0x011486 04:9476: D0 09     BNE bra_9481_RTS
C - - - - - 0x011488 04:9478: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x01148B 04:947B: F0 05     BEQ bra_9482
C - - - - - 0x01148D 04:947D: A9 00     LDA #$00
C - - - - - 0x01148F 04:947F: 85 6B     STA ram_006B
bra_9481_RTS:
C - - - - - 0x011491 04:9481: 60        RTS
bra_9482:
C - - - - - 0x011492 04:9482: A9 01     LDA #$01
C - - - - - 0x011494 04:9484: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x011497 04:9487: A5 45     LDA ram_0045
C - - - - - 0x011499 04:9489: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01149C 04:948C: A9 B0     LDA #$B0
C - - - - - 0x01149E 04:948E: 4C E0 A2  JMP loc_0x0062F0



ofs_038_65_9491_04:
C - - J - - 0x0114A1 04:9491: 20 6B AB  JSR sub_0x006B7B
C - - - - - 0x0114A4 04:9494: 20 CA 94  JSR sub_94CA
C - - - - - 0x0114A7 04:9497: A5 5B     LDA ram_005B
C - - - - - 0x0114A9 04:9499: 4A        LSR
C - - - - - 0x0114AA 04:949A: 90 2D     BCC bra_94C9_RTS
C - - - - - 0x0114AC 04:949C: BD E6 06  LDA ram_06E6_obj,X
C - - - - - 0x0114AF 04:949F: C9 60     CMP #$60
C - - - - - 0x0114B1 04:94A1: D0 05     BNE bra_94A8
C - - - - - 0x0114B3 04:94A3: A9 30     LDA #con_sound_30
C - - - - - 0x0114B5 04:94A5: 20 DE FD  JSR sub_0x01FDEE_play_sound
bra_94A8:
C - - - - - 0x0114B8 04:94A8: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0114BB 04:94AB: D0 1C     BNE bra_94C9_RTS
C - - - - - 0x0114BD 04:94AD: A9 38     LDA #$38
C - - - - - 0x0114BF 04:94AF: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x0114C2 04:94B2: A9 80     LDA #$80
C - - - - - 0x0114C4 04:94B4: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x0114C7 04:94B7: A9 00     LDA #$00
C - - - - - 0x0114C9 04:94B9: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x0114CC 04:94BC: A9 01     LDA #$01
C - - - - - 0x0114CE 04:94BE: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0114D1 04:94C1: 9D 80 07  STA ram_0780_obj,X
C - - - - - 0x0114D4 04:94C4: A9 01     LDA #$01
C - - - - - 0x0114D6 04:94C6: 4C E0 A2  JMP loc_0x0062F0
bra_94C9_RTS:
C - - - - - 0x0114D9 04:94C9: 60        RTS



sub_94CA:
C - - - - - 0x0114DA 04:94CA: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0114DD 04:94CD: 38        SEC
C - - - - - 0x0114DE 04:94CE: E5 FC     SBC ram_scroll_Y
C - - - - - 0x0114E0 04:94D0: 85 45     STA ram_0045
C - - - - - 0x0114E2 04:94D2: 60        RTS



ofs_038_65_94D3_05:
C - - J - - 0x0114E3 04:94D3: 20 6B AB  JSR sub_0x006B7B
C - - - - - 0x0114E6 04:94D6: 20 CA 94  JSR sub_94CA
C - - - - - 0x0114E9 04:94D9: 20 8C 96  JSR sub_968C
C - - - - - 0x0114EC 04:94DC: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x0114EF 04:94DF: D0 E8     BNE bra_94C9_RTS
C - - - - - 0x0114F1 04:94E1: A9 00     LDA #$00
C - - - - - 0x0114F3 04:94E3: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x0114F6 04:94E6: A9 06     LDA #$06
C - - - - - 0x0114F8 04:94E8: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x0114FB 04:94EB: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0114FE 04:94EE: 49 01     EOR #$01
C - - - - - 0x011500 04:94F0: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x011503 04:94F3: A5 FF     LDA ram_for_2000
C - - - - - 0x011505 04:94F5: 29 FE     AND #$FE
C - - - - - 0x011507 04:94F7: 1D 56 07  ORA ram_0756_obj,X
C - - - - - 0x01150A 04:94FA: 85 FF     STA ram_for_2000
C - - - - - 0x01150C 04:94FC: FE 64 07  INC ram_0764_obj,X
C - - - - - 0x01150F 04:94FF: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x011512 04:9502: 9D 80 07  STA ram_0780_obj,X
C - - - - - 0x011515 04:9505: C9 0F     CMP #$0F
C - - - - - 0x011517 04:9507: 90 C0     BCC bra_94C9_RTS
C - - - - - 0x011519 04:9509: A9 05     LDA #$05
C - - - - - 0x01151B 04:950B: 20 FE 98  JSR sub_98FE
C - - - - - 0x01151E 04:950E: A9 00     LDA #$00
C - - - - - 0x011520 04:9510: 85 64     STA ram_0064
C - - - - - 0x011522 04:9512: A9 01     LDA #$01
C - - - - - 0x011524 04:9514: 85 65     STA ram_0065
C - - - - - 0x011526 04:9516: A9 08     LDA #$08
C - - - - - 0x011528 04:9518: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x01152B 04:951B: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_65_951E_06:
C - - J - - 0x01152E 04:951E: 20 6B AB  JSR sub_0x006B7B
C - - - - - 0x011531 04:9521: 20 CA 94  JSR sub_94CA
C - - - - - 0x011534 04:9524: A5 60     LDA ram_0060
C - - - - - 0x011536 04:9526: 05 70     ORA ram_0070
C - - - - - 0x011538 04:9528: D0 09     BNE bra_9533_RTS
C - - - - - 0x01153A 04:952A: DE 56 07  DEC ram_0756_obj,X
C - - - - - 0x01153D 04:952D: F0 05     BEQ bra_9534
C - - - - - 0x01153F 04:952F: A9 00     LDA #$00
C - - - - - 0x011541 04:9531: 85 6B     STA ram_006B
bra_9533_RTS:
C - - - - - 0x011543 04:9533: 60        RTS
bra_9534:
C - - - - - 0x011544 04:9534: A9 01     LDA #$01
C - - - - - 0x011546 04:9536: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x011549 04:9539: A0 66     LDY #con_obj_id_66
C - - - - - 0x01154B 04:953B: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x01154E 04:953E: A0 00     LDY #$00
C - - - - - 0x011550 04:9540: 84 FC     STY ram_scroll_Y
C - - - - - 0x011552 04:9542: 84 FD     STY ram_scroll_X
C - - - - - 0x011554 04:9544: 88        DEY
C - - - - - 0x011555 04:9545: 84 F9     STY ram_00F9
C - - - - - 0x011557 04:9547: 20 CA 94  JSR sub_94CA
C - - - - - 0x01155A 04:954A: A9 00     LDA #$00
C - - - - - 0x01155C 04:954C: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x01155F 04:954F: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x011562 04:9552: A9 01     LDA #$01
C - - - - - 0x011564 04:9554: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x011567 04:9557: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x01156A 04:955A: A9 20     LDA #$20
C - - - - - 0x01156C 04:955C: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x01156F 04:955F: A9 80     LDA #$80
C - - - - - 0x011571 04:9561: 4C E0 A2  JMP loc_0x0062F0



ofs_038_65_9564_07:
C - - J - - 0x011574 04:9564: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011577 04:9567: D0 CA     BNE bra_9533_RTS
C - - - - - 0x011579 04:9569: A9 40     LDA #$40
C - - - - - 0x01157B 04:956B: 20 99 AB  JSR sub_0x006BA9_set_dynamic_hp_to_boss
C - - - - - 0x01157E 04:956E: A9 01     LDA #$01
C - - - - - 0x011580 04:9570: 4C E0 A2  JMP loc_0x0062F0



ofs_038_65_9573_08:
C - - J - - 0x011583 04:9573: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011586 04:9576: D0 1B     BNE bra_9593
C - - - - - 0x011588 04:9578: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x01158B 04:957B: 49 01     EOR #$01
C - - - - - 0x01158D 04:957D: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x011590 04:9580: 4A        LSR
C - - - - - 0x011591 04:9581: A9 30     LDA #$30
C - - - - - 0x011593 04:9583: B0 02     BCS bra_9587
C - - - - - 0x011595 04:9585: A9 20     LDA #$20
bra_9587:
C - - - - - 0x011597 04:9587: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x01159A 04:958A: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x01159D 04:958D: 18        CLC
C - - - - - 0x01159E 04:958E: 69 06     ADC #$06
C - - - - - 0x0115A0 04:9590: 20 FE 98  JSR sub_98FE
bra_9593:
C - - - - - 0x0115A3 04:9593: 20 E2 95  JSR sub_95E2
C - - - - - 0x0115A6 04:9596: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0115A9 04:9599: F0 29     BEQ bra_95C4_RTS
C - - - - - 0x0115AB 04:959B: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x0115AE 04:959E: D0 24     BNE bra_95C4_RTS
C - - - - - 0x0115B0 04:95A0: FE 48 07  INC ram_0748_obj,X
C - - - - - 0x0115B3 04:95A3: A0 70     LDY #$70
C - - - - - 0x0115B5 04:95A5: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x0115B8 04:95A8: 29 03     AND #$03
C - - - - - 0x0115BA 04:95AA: F0 02     BEQ bra_95AE
C - - - - - 0x0115BC 04:95AC: A0 10     LDY #$10
bra_95AE:
C - - - - - 0x0115BE 04:95AE: 98        TYA
C - - - - - 0x0115BF 04:95AF: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x0115C2 04:95B2: A0 68     LDY #con_obj_id_68
C - - - - - 0x0115C4 04:95B4: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x0115C7 04:95B7: 90 0B     BCC bra_95C4_RTS
C - - - - - 0x0115C9 04:95B9: A4 11     LDY ram_0011
C - - - - - 0x0115CB 04:95BB: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x0115CE 04:95BE: 18        CLC
C - - - - - 0x0115CF 04:95BF: 69 18     ADC #$18
C - - - - - 0x0115D1 04:95C1: 99 22 05  STA ram_pos_Y_hi_enemy,Y
bra_95C4_RTS:
C - - - - - 0x0115D4 04:95C4: 60        RTS



ofs_038_65_95C5_09: ; bzk optimize
C - - J - - 0x0115D5 04:95C5: 4C B8 A3  JMP loc_0x0063C8



ofs_038_65_95C8_0A: ; bzk optimize
C - - J - - 0x0115D8 04:95C8: 4C D8 A3  JMP loc_0x0063E8



ofs_038_65_95CB_0B:
C - - J - - 0x0115DB 04:95CB: A0 7F     LDY #$7F
bra_95CD_loop:
C - - - - - 0x0115DD 04:95CD: B9 00 04  LDA ram_0400,Y
C - - - - - 0x0115E0 04:95D0: 99 80 04  STA ram_0480,Y
C - - - - - 0x0115E3 04:95D3: 88        DEY
C - - - - - 0x0115E4 04:95D4: 10 F7     BPL bra_95CD_loop
C - - - - - 0x0115E6 04:95D6: A5 FF     LDA ram_for_2000
C - - - - - 0x0115E8 04:95D8: 09 01     ORA #$01
C - - - - - 0x0115EA 04:95DA: 85 FF     STA ram_for_2000
C - - - - - 0x0115EC 04:95DC: 4C A2 A2  JMP loc_0x0062B2



ofs_038_65_95DF_0D: ; bzk optimize
C - - J - - 0x0115EF 04:95DF: 4C 37 A3  JMP loc_0x006347_delete_object_08



sub_95E2:
C - - - - - 0x0115F2 04:95E2: DE 64 07  DEC ram_0764_obj,X
C - - - - - 0x0115F5 04:95E5: D0 53     BNE bra_963A_RTS
C - - - - - 0x0115F7 04:95E7: A9 01     LDA #$01
C - - - - - 0x0115F9 04:95E9: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0115FC 04:95EC: 20 24 AB  JSR sub_0x006B34
C - - - - - 0x0115FF 04:95EF: B9 4C 05  LDA ram_pos_X_hi_plr,Y
C - - - - - 0x011602 04:95F2: A0 00     LDY #$00
C - - - - - 0x011604 04:95F4: C9 60     CMP #$60
C - - - - - 0x011606 04:95F6: 90 06     BCC bra_95FE
C - - - - - 0x011608 04:95F8: C8        INY
C - - - - - 0x011609 04:95F9: C9 A0     CMP #$A0
C - - - - - 0x01160B 04:95FB: 90 01     BCC bra_95FE
C - - - - - 0x01160D 04:95FD: C8        INY
bra_95FE:
C - - - - - 0x01160E 04:95FE: 98        TYA
C - - - - - 0x01160F 04:95FF: DD 72 07  CMP ram_0772_obj,X
C - - - - - 0x011612 04:9602: F0 36     BEQ bra_963A_RTS
C - - - - - 0x011614 04:9604: A9 FF     LDA #$FF
C - - - - - 0x011616 04:9606: 90 02     BCC bra_960A
C - - - - - 0x011618 04:9608: A9 00     LDA #$00
bra_960A:
C - - - - - 0x01161A 04:960A: 7D 72 07  ADC ram_0772_obj,X
C - - - - - 0x01161D 04:960D: C9 03     CMP #$03
C - - - - - 0x01161F 04:960F: B0 03     BCS bra_9614
C - - - - - 0x011621 04:9611: 9D 72 07  STA ram_0772_obj,X
bra_9614:
C - - - - - 0x011624 04:9614: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x011627 04:9617: 0A        ASL
C - - - - - 0x011628 04:9618: A8        TAY
C - - - - - 0x011629 04:9619: B9 43 96  LDA tbl_9643,Y
C - - - - - 0x01162C 04:961C: 85 08     STA ram_0008
C - - - - - 0x01162E 04:961E: B9 44 96  LDA tbl_9643 + $01,Y
C - - - - - 0x011631 04:9621: 85 09     STA ram_0009
C - - - - - 0x011633 04:9623: A0 00     LDY #$00
; bzk optimize, check ram_index_ppu_buffer first
C - - - - - 0x011635 04:9625: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x011637 04:9627: E0 20     CPX #$20
C - - - - - 0x011639 04:9629: B0 10     BCS bra_963B
; if buffer is not too loaded
bra_962B_loop:
C - - - - - 0x01163B 04:962B: B1 08     LDA (ram_0008),Y
C - - - - - 0x01163D 04:962D: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x011640 04:9630: E8        INX
C - - - - - 0x011641 04:9631: C8        INY
C - - - - - 0x011642 04:9632: C9 FF     CMP #$FF
C - - - - - 0x011644 04:9634: D0 F5     BNE bra_962B_loop
C - - - - - 0x011646 04:9636: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x011648 04:9638: A6 10     LDX ram_0010
bra_963A_RTS:
C - - - - - 0x01164A 04:963A: 60        RTS
bra_963B:
C - - - - - 0x01164B 04:963B: A6 10     LDX ram_0010
C - - - - - 0x01164D 04:963D: A9 01     LDA #$01
C - - - - - 0x01164F 04:963F: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x011652 04:9642: 60        RTS



tbl_9643:
- D 0 - - - 0x011653 04:9643: 49 96     .word off_9649_00
- D 0 - - - 0x011655 04:9645: 5F 96     .word off_965F_01
- D 0 - - - 0x011657 04:9647: 75 96     .word off_9675_02



off_9649_00:
- D 0 - I - 0x011659 04:9649: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x01165A 04:964A: 20 AD     .dbyt $20AD ; ppu address
- D 0 - I - 0x01165C 04:964C: 02        .byte $02   ; counter
- D 0 - I - 0x01165D 04:964D: A9        .byte $A9, $56   ; tiles

- D 0 - I - 0x01165F 04:964F: 20 CD     .dbyt $20CD ; ppu address
- D 0 - I - 0x011661 04:9651: 02        .byte $02   ; counter
- D 0 - I - 0x011662 04:9652: AC        .byte $AC, $AD   ; tiles

- D 0 - I - 0x011664 04:9654: 20 B1     .dbyt $20B1 ; ppu address
- D 0 - I - 0x011666 04:9656: 02        .byte $02   ; counter
- D 0 - I - 0x011667 04:9657: 55        .byte $55, $B6   ; tiles

- D 0 - I - 0x011669 04:9659: 20 D1     .dbyt $20D1 ; ppu address
- D 0 - I - 0x01166B 04:965B: 02        .byte $02   ; counter
- D 0 - I - 0x01166C 04:965C: B7        .byte $B7, $B8   ; tiles

- D 0 - I - 0x01166E 04:965E: FF        .byte $FF   ; end token



off_965F_01:
- D 0 - I - 0x01166F 04:965F: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x011670 04:9660: 20 AD     .dbyt $20AD ; ppu address
- D 0 - I - 0x011672 04:9662: 02        .byte $02   ; counter
- D 0 - I - 0x011673 04:9663: 55        .byte $55, $56   ; tiles

- D 0 - I - 0x011675 04:9665: 20 CD     .dbyt $20CD ; ppu address
- D 0 - I - 0x011677 04:9667: 02        .byte $02   ; counter
- D 0 - I - 0x011678 04:9668: 5B        .byte $5B, $5C   ; tiles

- D 0 - I - 0x01167A 04:966A: 20 B1     .dbyt $20B1 ; ppu address
- D 0 - I - 0x01167C 04:966C: 02        .byte $02   ; counter
- D 0 - I - 0x01167D 04:966D: 55        .byte $55, $56   ; tiles

- D 0 - I - 0x01167F 04:966F: 20 D1     .dbyt $20D1 ; ppu address
- D 0 - I - 0x011681 04:9671: 02        .byte $02   ; counter
- D 0 - I - 0x011682 04:9672: 5F        .byte $5F, $60   ; tiles

- D 0 - I - 0x011684 04:9674: FF        .byte $FF   ; end token



off_9675_02:
- D 0 - I - 0x011685 04:9675: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x011686 04:9676: 20 AD     .dbyt $20AD ; ppu address
- D 0 - I - 0x011688 04:9678: 02        .byte $02   ; counter
- D 0 - I - 0x011689 04:9679: A9        .byte $A9, $56   ; tiles

- D 0 - I - 0x01168B 04:967B: 20 CD     .dbyt $20CD ; ppu address
- D 0 - I - 0x01168D 04:967D: 02        .byte $02   ; counter
- D 0 - I - 0x01168E 04:967E: AE        .byte $AE, $B0   ; tiles

- D 0 - I - 0x011690 04:9680: 20 B1     .dbyt $20B1 ; ppu address
- D 0 - I - 0x011692 04:9682: 02        .byte $02   ; counter
- D 0 - I - 0x011693 04:9683: 55        .byte $55, $B6   ; tiles

- D 0 - I - 0x011695 04:9685: 20 D1     .dbyt $20D1 ; ppu address
- D 0 - I - 0x011697 04:9687: 02        .byte $02   ; counter
- D 0 - I - 0x011698 04:9688: B9        .byte $B9, $BF   ; tiles

- D 0 - I - 0x01169A 04:968A: FF        .byte $FF   ; end token



bra_968B_RTS:
C - - - - - 0x01169B 04:968B: 60        RTS



sub_968C:
C - - - - - 0x01169C 04:968C: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x01169F 04:968F: 30 FA     BMI bra_968B_RTS
C - - - - - 0x0116A1 04:9691: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0116A4 04:9694: 4A        LSR
C - - - - - 0x0116A5 04:9695: A9 08     LDA #$08
C - - - - - 0x0116A7 04:9697: B0 02     BCS bra_969B
C - - - - - 0x0116A9 04:9699: A9 0B     LDA #$0B
bra_969B:
C - - - - - 0x0116AB 04:969B: 85 01     STA ram_0001
C - - - - - 0x0116AD 04:969D: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x0116B0 04:96A0: 88        DEY
C - - - - - 0x0116B1 04:96A1: 98        TYA
C - - - - - 0x0116B2 04:96A2: 38        SEC
C - - - - - 0x0116B3 04:96A3: FD 72 07  SBC ram_0772_obj,X
C - - - - - 0x0116B6 04:96A6: 0A        ASL
C - - - - - 0x0116B7 04:96A7: 0A        ASL
C - - - - - 0x0116B8 04:96A8: 0A        ASL
C - - - - - 0x0116B9 04:96A9: 0A        ASL
C - - - - - 0x0116BA 04:96AA: 26 01     ROL ram_0001
C - - - - - 0x0116BC 04:96AC: 0A        ASL
C - - - - - 0x0116BD 04:96AD: 26 01     ROL ram_0001
C - - - - - 0x0116BF 04:96AF: 85 00     STA ram_0000
C - - - - - 0x0116C1 04:96B1: A0 00     LDY #$00
C - - - - - 0x0116C3 04:96B3: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x0116C6 04:96B6: 85 0A     STA ram_000A
C - - - - - 0x0116C8 04:96B8: F0 10     BEQ bra_96CA
bra_96BA_loop:
C - - - - - 0x0116CA 04:96BA: C8        INY
C - - - - - 0x0116CB 04:96BB: B9 49 97  LDA tbl_9749,Y
C - - - - - 0x0116CE 04:96BE: 85 0B     STA ram_000B
C - - - - - 0x0116D0 04:96C0: C8        INY
C - - - - - 0x0116D1 04:96C1: 98        TYA
C - - - - - 0x0116D2 04:96C2: 18        CLC
C - - - - - 0x0116D3 04:96C3: 65 0B     ADC ram_000B
C - - - - - 0x0116D5 04:96C5: A8        TAY
C - - - - - 0x0116D6 04:96C6: C6 0A     DEC ram_000A
C - - - - - 0x0116D8 04:96C8: D0 F0     BNE bra_96BA_loop
bra_96CA:
C - - - - - 0x0116DA 04:96CA: B9 49 97  LDA tbl_9749,Y
C - - - - - 0x0116DD 04:96CD: C9 80     CMP #$80
C - - - - - 0x0116DF 04:96CF: F0 03     BEQ bra_96D4_80
C - - - - - 0x0116E1 04:96D1: 4C D8 96  JMP loc_96D8
bra_96D4_80:
- - - - - - 0x0116E4 04:96D4: 9D 72 07  STA ram_0772_obj,X
- - - - - - 0x0116E7 04:96D7: 60        RTS



loc_96D8:
C D 0 - - - 0x0116E8 04:96D8: A9 04     LDA #$04
C - - - - - 0x0116EA 04:96DA: 85 08     STA ram_0008
C - - - - - 0x0116EC 04:96DC: BD 80 07  LDA ram_0780_obj,X
C - - - - - 0x0116EF 04:96DF: 85 09     STA ram_0009
C - - - - - 0x0116F1 04:96E1: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x0116F4 04:96E4: 85 0A     STA ram_000A
C - - - - - 0x0116F6 04:96E6: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x0116F8 04:96E8: A9 06     LDA #con_buf_mode_06
C - - - - - 0x0116FA 04:96EA: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0116FD 04:96ED: E8        INX
bra_96EE_loop:
C - - - - - 0x0116FE 04:96EE: B9 49 97  LDA tbl_9749,Y
C - - - - - 0x011701 04:96F1: C9 80     CMP #$80
C - - - - - 0x011703 04:96F3: F0 49     BEQ bra_973E_80
; ppu hi
C - - - - - 0x011705 04:96F5: 18        CLC
C - - - - - 0x011706 04:96F6: 65 00     ADC ram_0000
C - - - - - 0x011708 04:96F8: 9D 01 03  STA ram_nmt_buffer + $01,X
; ppu lo
C - - - - - 0x01170B 04:96FB: A5 01     LDA ram_0001
C - - - - - 0x01170D 04:96FD: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x011710 04:9700: E8        INX
C - - - - - 0x011711 04:9701: E8        INX
C - - - - - 0x011712 04:9702: C8        INY
; counter
C - - - - - 0x011713 04:9703: B9 49 97  LDA tbl_9749,Y
C - - - - - 0x011716 04:9706: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x011719 04:9709: 85 0B     STA ram_000B
C - - - - - 0x01171B 04:970B: E8        INX
C - - - - - 0x01171C 04:970C: C8        INY
bra_970D_loop:
C - - - - - 0x01171D 04:970D: B9 49 97  LDA tbl_9749,Y
C - - - - - 0x011720 04:9710: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x011723 04:9713: E8        INX
C - - - - - 0x011724 04:9714: C8        INY
C - - - - - 0x011725 04:9715: C6 0B     DEC ram_000B
C - - - - - 0x011727 04:9717: D0 F4     BNE bra_970D_loop
C - - - - - 0x011729 04:9719: E6 0A     INC ram_000A
C - - - - - 0x01172B 04:971B: C6 09     DEC ram_0009
C - - - - - 0x01172D 04:971D: F0 11     BEQ bra_9730
C - - - - - 0x01172F 04:971F: A5 00     LDA ram_0000
C - - - - - 0x011731 04:9721: 38        SEC
C - - - - - 0x011732 04:9722: E9 20     SBC #$20
C - - - - - 0x011734 04:9724: 85 00     STA ram_0000
C - - - - - 0x011736 04:9726: B0 02     BCS bra_972A_not_underflow
C - - - - - 0x011738 04:9728: C6 01     DEC ram_0001
bra_972A_not_underflow:
C - - - - - 0x01173A 04:972A: C6 08     DEC ram_0008
C - - - - - 0x01173C 04:972C: D0 C0     BNE bra_96EE_loop
C - - - - - 0x01173E 04:972E: F0 04     BEQ bra_9734    ; jmp
bra_9730:
C - - - - - 0x011740 04:9730: A9 FF     LDA #$FF
C - - - - - 0x011742 04:9732: 85 0A     STA ram_000A
bra_9734:
; close buffer
C - - - - - 0x011744 04:9734: A9 FF     LDA #$FF
C - - - - - 0x011746 04:9736: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x011749 04:9739: E8        INX
C - - - - - 0x01174A 04:973A: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x01174C 04:973C: A5 0A     LDA ram_000A
bra_973E_80:
C - - - - - 0x01174E 04:973E: A6 10     LDX ram_0010
C - - - - - 0x011750 04:9740: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x011753 04:9743: A5 09     LDA ram_0009
C - - - - - 0x011755 04:9745: 9D 80 07  STA ram_0780_obj,X
C - - - - - 0x011758 04:9748: 60        RTS



tbl_9749:
- D 0 - - - 0x011759 04:9749: 0E        .byte $0E   ; ppu address offset
- D 0 - - - 0x01175A 04:974A: 04        .byte $04   ; counter
- D 0 - - - 0x01175B 04:974B: 00        .byte $00, $8E, $8F, $00   ; tiles

- D 0 - - - 0x01175F 04:974F: 0D        .byte $0D   ; ppu address offset
- D 0 - - - 0x011760 04:9750: 06        .byte $06   ; counter
- D 0 - - - 0x011761 04:9751: 00        .byte $00, $8A, $8B, $8C, $8D, $00   ; tiles

- D 0 - - - 0x011767 04:9757: 0D        .byte $0D   ; ppu address offset
- D 0 - - - 0x011768 04:9758: 06        .byte $06   ; counter
- D 0 - - - 0x011769 04:9759: 7C        .byte $7C, $7D, $7E, $7F, $88, $89   ; tiles

- D 0 - - - 0x01176F 04:975F: 0D        .byte $0D   ; ppu address offset
- D 0 - - - 0x011770 04:9760: 06        .byte $06   ; counter
- D 0 - - - 0x011771 04:9761: 79        .byte $79, $7A, $7A, $7A, $7A, $7B   ; tiles

- D 0 - - - 0x011777 04:9767: 0C        .byte $0C   ; ppu address offset
- D 0 - - - 0x011778 04:9768: 08        .byte $08   ; counter
- D 0 - - - 0x011779 04:9769: 00        .byte $00, $73, $74, $75, $76, $77, $78, $00   ; tiles

- D 0 - - - 0x011781 04:9771: 0C        .byte $0C   ; ppu address offset
- D 0 - - - 0x011782 04:9772: 08        .byte $08   ; counter
- D 0 - - - 0x011783 04:9773: 6B        .byte $6B, $6C, $6D, $6E, $6F, $70, $71, $72   ; tiles

- D 0 - - - 0x01178B 04:977B: 0B        .byte $0B   ; ppu address offset
- D 0 - - - 0x01178C 04:977C: 0A        .byte $0A   ; counter
- D 0 - - - 0x01178D 04:977D: 62        .byte $62, $63, $64, $65, $66, $67, $65, $68, $69, $6A   ; tiles

- D 0 - - - 0x011797 04:9787: 0B        .byte $0B   ; ppu address offset
- D 0 - - - 0x011798 04:9788: 0A        .byte $0A   ; counter
- D 0 - - - 0x011799 04:9789: 5A        .byte $5A, $54, $5B, $5C, $5D, $5E, $5F, $60, $59, $61   ; tiles

- D 0 - - - 0x0117A3 04:9793: 0A        .byte $0A   ; ppu address offset
- D 0 - - - 0x0117A4 04:9794: 0C        .byte $0C   ; counter
- D 0 - - - 0x0117A5 04:9795: 00        .byte $00, $00, $54, $55, $56, $57, $58, $55, $56, $59, $00, $00   ; tiles

- D 0 - - - 0x0117B1 04:97A1: 09        .byte $09   ; ppu address offset
- D 0 - - - 0x0117B2 04:97A2: 0E        .byte $0E   ; counter
- D 0 - - - 0x0117B3 04:97A3: 00        .byte $00, $3C, $A8, $4C, $4D, $4E, $4F, $50, $51, $52, $53, $3B, $49, $00   ; tiles

- D 0 - - - 0x0117C1 04:97B1: 09        .byte $09   ; ppu address offset
- D 0 - - - 0x0117C2 04:97B2: 0E        .byte $0E   ; counter
- D 0 - - - 0x0117C3 04:97B3: 00        .byte $00, $A8, $42, $3D, $0B, $4A, $0E, $1D, $4B, $20, $48, $47, $3B, $00   ; tiles

- D 0 - - - 0x0117D1 04:97C1: 09        .byte $09   ; ppu address offset
- D 0 - - - 0x0117D2 04:97C2: 0E        .byte $0E   ; counter
- D 0 - - - 0x0117D3 04:97C3: 3C        .byte $3C, $0A, $3D, $42, $43, $44, $0E, $1D, $45, $46, $47, $48, $22, $49   ; tiles

- D 0 - - - 0x0117E1 04:97D1: 09        .byte $09   ; ppu address offset
- D 0 - - - 0x0117E2 04:97D2: 0E        .byte $0E   ; counter
- D 0 - - - 0x0117E3 04:97D3: A8        .byte $A8, $0A, $09, $39, $0C, $0D, $0E, $1D, $1E, $1F, $3A, $21, $22, $3B   ; tiles

- D 0 - - - 0x0117F1 04:97E1: 09        .byte $09   ; ppu address offset
- D 0 - - - 0x0117F2 04:97E2: 0E        .byte $0E   ; counter
- D 0 - - - 0x0117F3 04:97E3: 09        .byte $09, $0A, $09, $0B, $0C, $0D, $0E, $1D, $1E, $1F, $20, $21, $22, $21   ; tiles

- - - - - - 0x011801 04:97F1: 80        .byte $80   ; end token



_off001_0x011802_68_boss_6_big_bullet:
- D 0 - I - 0x011802 04:97F2: FC 97     .word ofs_038_68_97FC_01_initialize_object ; 
- D 0 - I - 0x011804 04:97F4: 13 98     .word ofs_038_68_9813_02 ; 
- D 0 - I - 0x011806 04:97F6: 9A A2     .word ofs_038_68_0x0062AA_03 ; 
- D 0 - I - 0x011808 04:97F8: FD A2     .word ofs_038_68_0x00630D_04 ; 
- D 0 - I - 0x01180A 04:97FA: 3D A3     .word ofs_038_68_0x00634D_05_delete_object_04 ; 



ofs_038_68_97FC_01_initialize_object:
C - - J - - 0x01180C 04:97FC: A9 8F     LDA #$8F
C - - - - - 0x01180E 04:97FE: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x011811 04:9801: A9 02     LDA #$02
C - - - - - 0x011813 04:9803: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x011816 04:9806: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x011819 04:9809: A0 03     LDY #$03
C - - - - - 0x01181B 04:980B: 20 57 A9  JSR sub_0x006967
C - - - - - 0x01181E 04:980E: A9 08     LDA #$08
C - - - - - 0x011820 04:9810: 4C E0 A2  JMP loc_0x0062F0



ofs_038_68_9813_02:
C - - J - - 0x011823 04:9813: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011826 04:9816: D0 0D     BNE bra_9825
C - - - - - 0x011828 04:9818: A9 0C     LDA #$0C
C - - - - - 0x01182A 04:981A: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x01182D 04:981D: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x011830 04:9820: A0 03     LDY #$03
C - - - - - 0x011832 04:9822: 20 23 A9  JSR sub_0x006933
bra_9825:
C - - - - - 0x011835 04:9825: 4C D3 A6  JMP loc_0x0066E3



_off001_0x011838_64_boss_6_phase_1:
- D 0 - I - 0x011838 04:9828: 3A 98     .word ofs_038_64_983A_01_initialize_object ; 
- D 0 - I - 0x01183A 04:982A: 4C 98     .word ofs_038_64_984C_02 ; 
- D 0 - I - 0x01183C 04:982C: 6F 98     .word ofs_038_64_986F_03 ; 
- D 0 - I - 0x01183E 04:982E: 7E 98     .word ofs_038_64_987E_04 ; 
- D 0 - I - 0x011840 04:9830: D1 98     .word ofs_038_64_98D1_05 ; 
- D 0 - I - 0x011842 04:9832: D4 98     .word ofs_038_64_98D4_06 ; 
- D 0 - I - 0x011844 04:9834: DC 98     .word ofs_038_64_98DC_07 ; 
- D 0 - I - 0x011846 04:9836: F6 A2     .word ofs_038_64_0x006306_08 ; 
- D 0 - I - 0x011848 04:9838: EF 98     .word ofs_038_64_98EF_09 ; 



ofs_038_64_983A_01_initialize_object:
C - - J - - 0x01184A 04:983A: A9 F0     LDA #con__hp_F0
C - - - - - 0x01184C 04:983C: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x01184F 04:983F: A9 91     LDA #$91
C - - - - - 0x011851 04:9841: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x011854 04:9844: A9 01     LDA #$01
C - - - - - 0x011856 04:9846: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x011859 04:9849: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_64_984C_02:
C - - J - - 0x01185C 04:984C: A5 71     LDA ram_0071_flag
C - - - - - 0x01185E 04:984E: 10 1E     BPL bra_986E_RTS
C - - - - - 0x011860 04:9850: A9 30     LDA #$30
C - - - - - 0x011862 04:9852: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x011865 04:9855: A9 80     LDA #$80
C - - - - - 0x011867 04:9857: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x01186A 04:985A: A9 32     LDA #con_sound_32
C - - - - - 0x01186C 04:985C: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x01186F 04:985F: A9 10     LDA #$10
C - - - - - 0x011871 04:9861: 9D 2C 07  STA ram_072C_obj,X
C - - - - - 0x011874 04:9864: A9 01     LDA #$01
C - - - - - 0x011876 04:9866: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x011879 04:9869: A9 40     LDA #$40
C - - - - - 0x01187B 04:986B: 4C E0 A2  JMP loc_0x0062F0
bra_986E_RTS:
C - - - - - 0x01187E 04:986E: 60        RTS



ofs_038_64_986F_03:
C - - J - - 0x01187F 04:986F: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011882 04:9872: D0 FA     BNE bra_986E_RTS
C - - - - - 0x011884 04:9874: A9 20     LDA #$20
C - - - - - 0x011886 04:9876: 20 99 AB  JSR sub_0x006BA9_set_dynamic_hp_to_boss
C - - - - - 0x011889 04:9879: A9 01     LDA #$01
C - - - - - 0x01188B 04:987B: 4C E0 A2  JMP loc_0x0062F0



ofs_038_64_987E_04:
C - - J - - 0x01188E 04:987E: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011891 04:9881: D0 2F     BNE bra_98B2
C - - - - - 0x011893 04:9883: 20 FB 98  JSR sub_98FB
C - - - - - 0x011896 04:9886: A9 01     LDA #$01
C - - - - - 0x011898 04:9888: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x01189B 04:988B: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x01189E 04:988E: B9 CE 98  LDA tbl_98CE,Y
C - - - - - 0x0118A1 04:9891: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x0118A4 04:9894: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0118A7 04:9897: 4A        LSR
C - - - - - 0x0118A8 04:9898: B0 05     BCS bra_989F
C - - - - - 0x0118AA 04:989A: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x0118AD 04:989D: D0 03     BNE bra_98A2
bra_989F:
C - - - - - 0x0118AF 04:989F: DE 10 07  DEC ram_0710_obj,X
bra_98A2:
C - - - - - 0x0118B2 04:98A2: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x0118B5 04:98A5: C9 03     CMP #$03
C - - - - - 0x0118B7 04:98A7: 90 08     BCC bra_98B1_RTS
C - - - - - 0x0118B9 04:98A9: A9 01     LDA #$01
C - - - - - 0x0118BB 04:98AB: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x0118BE 04:98AE: FE 56 07  INC ram_0756_obj,X
bra_98B1_RTS:
C - - - - - 0x0118C1 04:98B1: 60        RTS
bra_98B2:
C - - - - - 0x0118C2 04:98B2: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x0118C5 04:98B5: 4A        LSR
C - - - - - 0x0118C6 04:98B6: 90 B6     BCC bra_986E_RTS
C - - - - - 0x0118C8 04:98B8: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x0118CB 04:98BB: D0 10     BNE bra_98CD_RTS
C - - - - - 0x0118CD 04:98BD: 20 0B AB  JSR sub_0x006B1B
C - - - - - 0x0118D0 04:98C0: 20 AE AA  JSR sub_0x006ABE
C - - - - - 0x0118D3 04:98C3: A0 05     LDY #$05
C - - - - - 0x0118D5 04:98C5: 20 E4 F2  JSR sub_0x01F2F4
C - - - - - 0x0118D8 04:98C8: A9 10     LDA #$10
C - - - - - 0x0118DA 04:98CA: 9D F4 06  STA ram_06F4_obj,X
bra_98CD_RTS:
C - - - - - 0x0118DD 04:98CD: 60        RTS



tbl_98CE:
- D 0 - - - 0x0118DE 04:98CE: 20        .byte $20   ; 00 
- D 0 - - - 0x0118DF 04:98CF: 0C        .byte $0C   ; 01 
- D 0 - - - 0x0118E0 04:98D0: 70        .byte $70   ; 02 



ofs_038_64_98D1_05: ; bzk optimize
C - - J - - 0x0118E1 04:98D1: 4C B8 A3  JMP loc_0x0063C8



ofs_038_64_98D4_06:
C - - J - - 0x0118E4 04:98D4: A9 03     LDA #$03
C - - - - - 0x0118E6 04:98D6: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x0118E9 04:98D9: 4C D8 A3  JMP loc_0x0063E8



ofs_038_64_98DC_07:
C - - J - - 0x0118EC 04:98DC: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x0118EF 04:98DF: 20 FE 98  JSR sub_98FE
C - - - - - 0x0118F2 04:98E2: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x0118F5 04:98E5: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x0118F8 04:98E8: C9 05     CMP #$05
C - - - - - 0x0118FA 04:98EA: 90 E1     BCC bra_98CD_RTS
C - - - - - 0x0118FC 04:98EC: 4C A2 A2  JMP loc_0x0062B2



ofs_038_64_98EF_09:
C - - J - - 0x0118FF 04:98EF: 20 3D A3  JSR sub_0x00634D_delete_object_04
C - - - - - 0x011902 04:98F2: A9 00     LDA #$00
C - - - - - 0x011904 04:98F4: 85 5C     STA ram_005C
C - - - - - 0x011906 04:98F6: A0 65     LDY #con_obj_id_65
C - - - - - 0x011908 04:98F8: 4C C8 AB  JMP loc_0x006BD8



sub_98FB:
C - - - - - 0x01190B 04:98FB: BD 10 07  LDA ram_0710_obj,X
sub_98FE:
C - - - - - 0x01190E 04:98FE: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x011910 04:9900: 0A        ASL
C - - - - - 0x011911 04:9901: A8        TAY
C - - - - - 0x011912 04:9902: B9 23 99  LDA tbl_9923,Y
C - - - - - 0x011915 04:9905: 85 08     STA ram_0008
C - - - - - 0x011917 04:9907: B9 24 99  LDA tbl_9923 + $01,Y
C - - - - - 0x01191A 04:990A: 85 09     STA ram_0009
C - - - - - 0x01191C 04:990C: A0 00     LDY #$00
bra_990E_loop:
C - - - - - 0x01191E 04:990E: B1 08     LDA (ram_0008),Y
C - - - - - 0x011920 04:9910: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x011923 04:9913: E8        INX
C - - - - - 0x011924 04:9914: C8        INY
C - - - - - 0x011925 04:9915: C9 FE     CMP #$FE
C - - - - - 0x011927 04:9917: D0 F5     BNE bra_990E_loop
; close buffer
C - - - - - 0x011929 04:9919: A9 FF     LDA #$FF
C - - - - - 0x01192B 04:991B: 9D FF 02  STA ram_nmt_buffer - $01,X
C - - - - - 0x01192E 04:991E: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x011930 04:9920: A6 10     LDX ram_0010
C - - - - - 0x011932 04:9922: 60        RTS



tbl_9923:
- D 0 - - - 0x011933 04:9923: 33 99     .word _off015_9933_00
- D 0 - - - 0x011935 04:9925: 8F 99     .word _off015_998F_01
- D 0 - - - 0x011937 04:9927: EB 99     .word _off015_99EB_02
- D 0 - - - 0x011939 04:9929: 29 9A     .word _off015_9A29_03
- D 0 - - - 0x01193B 04:992B: 59 9A     .word _off015_9A59_04
- D 0 - - - 0x01193D 04:992D: B5 9A     .word _off015_9AB5_05
- D 0 - - - 0x01193F 04:992F: CA 9A     .word _off015_9ACA_06
- D 0 - - - 0x011941 04:9931: FE 9A     .word _off015_9AFE_07



_off015_9933_00:
- D 0 - I - 0x011943 04:9933: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x011944 04:9934: 20 6A     .dbyt $206A ; ppu address
- D 0 - I - 0x011946 04:9936: 0C        .byte $0C   ; counter
- D 0 - I - 0x011947 04:9937: 92        .byte $92, $93, $94, $95, $92, $93, $94, $95, $92, $93, $94, $95   ; 

- D 0 - I - 0x011953 04:9943: 20 88     .dbyt $2088 ; ppu address
- D 0 - I - 0x011955 04:9945: 10        .byte $10   ; counter
- D 0 - I - 0x011956 04:9946: 17        .byte $17, $97, $18, $98, $18, $98, $18, $98, $18, $98, $18, $98, $18, $98, $19, $99   ; 

- D 0 - I - 0x011966 04:9956: 20 A8     .dbyt $20A8 ; ppu address
- D 0 - I - 0x011968 04:9958: 10        .byte $10   ; counter
- D 0 - I - 0x011969 04:9959: 9A        .byte $9A, $9B, $9C, $9D, $9E, $9D, $9E, $9D, $9E, $9D, $9E, $9D, $9E, $9F, $A0, $A1   ; 

- D 0 - I - 0x011979 04:9969: 20 CA     .dbyt $20CA ; ppu address
- D 0 - I - 0x01197B 04:996B: 0C        .byte $0C   ; counter
- D 0 - I - 0x01197C 04:996C: 1A        .byte $1A, $A3, $1B, $A3, $1B, $A3, $1B, $A3, $1B, $A3, $1B, $A7   ; 

- D 0 - I - 0x011988 04:9978: 20 EA     .dbyt $20EA ; ppu address
- D 0 - I - 0x01198A 04:997A: 0C        .byte $0C   ; counter
- D 0 - I - 0x01198B 04:997B: 00        .byte $00, $A8, $A9, $A8, $A9, $A8, $A9, $A8, $A9, $A8, $A9, $00, $23, $CA, $04, $00, $00, $00, $00   ; 

- D 0 - I - 0x01199E 04:998E: FE        .byte $FE   ; end token



_off015_998F_01:
- D 0 - I - 0x01199F 04:998F: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x0119A0 04:9990: 20 6A     .dbyt $206A ; ppu address
- D 0 - I - 0x0119A2 04:9992: 0C        .byte $0C   ; counter
- D 0 - I - 0x0119A3 04:9993: AA        .byte $AA, $AB, $AC, $AD, $AA, $AB, $AC, $AD, $AA, $AB, $AC, $AD   ; 

- D 0 - I - 0x0119AF 04:999F: 20 88     .dbyt $2088 ; ppu address
- D 0 - I - 0x0119B1 04:99A1: 10        .byte $10   ; counter
- D 0 - I - 0x0119B2 04:99A2: AE        .byte $AE, $B0, $B4, $B5, $B6, $B5, $B6, $B5, $B6, $B5, $B6, $B5, $B6, $B7, $B8, $B9   ; 

- D 0 - I - 0x0119C2 04:99B2: 20 A8     .dbyt $20A8 ; ppu address
- D 0 - I - 0x0119C4 04:99B4: 10        .byte $10   ; counter
- D 0 - I - 0x0119C5 04:99B5: BF        .byte $BF, $C0, $C1, $C2, $C3, $C2, $C3, $C2, $C3, $C2, $C3, $C2, $C3, $C4, $C5, $C6   ; 

- D 0 - I - 0x0119D5 04:99C5: 20 CA     .dbyt $20CA ; ppu address
- D 0 - I - 0x0119D7 04:99C7: 0C        .byte $0C   ; counter
- D 0 - I - 0x0119D8 04:99C8: C7        .byte $C7, $C8, $C9, $C8, $C9, $C8, $C9, $C8, $C9, $C8, $C9, $CA   ; 

- D 0 - I - 0x0119E4 04:99D4: 20 EA     .dbyt $20EA ; ppu address
- D 0 - I - 0x0119E6 04:99D6: 0C        .byte $0C   ; counter
- D 0 - I - 0x0119E7 04:99D7: 00        .byte $00, $CB, $CC, $CB, $CC, $CB, $CC, $CB, $CC, $CB, $CC, $00   ; 

- D 0 - I - 0x0119F3 04:99E3: 23 CA     .dbyt $23CA ; ppu address
- D 0 - I - 0x0119F5 04:99E5: 04        .byte $04   ; counter
- D 0 - I - 0x0119F6 04:99E6: 88        .byte $88, $AA, $AA, $22   ; 

- D 0 - I - 0x0119FA 04:99EA: FE        .byte $FE   ; end token



_off015_99EB_02:
- D 0 - I - 0x0119FB 04:99EB: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x0119FC 04:99EC: 20 8A     .dbyt $208A ; ppu address
- D 0 - I - 0x0119FE 04:99EE: 0C        .byte $0C   ; counter
- D 0 - I - 0x0119FF 04:99EF: CD        .byte $CD, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $D0   ; 

- D 0 - I - 0x011A0B 04:99FB: 20 AA     .dbyt $20AA ; ppu address
- D 0 - I - 0x011A0D 04:99FD: 0C        .byte $0C   ; counter
- D 0 - I - 0x011A0E 04:99FE: D1        .byte $D1, $D2, $D3, $D2, $D3, $D2, $D3, $D2, $D3, $D2, $D3, $D4   ; 

- D 0 - I - 0x011A1A 04:9A0A: 20 CA     .dbyt $20CA ; ppu address
- D 0 - I - 0x011A1C 04:9A0C: 0C        .byte $0C   ; counter
- D 0 - I - 0x011A1D 04:9A0D: D5        .byte $D5, $D6, $D7, $D6, $D7, $D6, $D7, $D6, $D7, $D6, $D7, $D8   ; 

- D 0 - I - 0x011A29 04:9A19: 20 EA     .dbyt $20EA ; ppu address
- D 0 - I - 0x011A2B 04:9A1B: 0C        .byte $0C   ; counter
- D 0 - I - 0x011A2C 04:9A1C: D9        .byte $D9, $DA, $DB, $DA, $DB, $DA, $DB, $DA, $DB, $DA, $DB, $DC   ; 

- D 0 - I - 0x011A38 04:9A28: FE        .byte $FE   ; end token



_off015_9A29_03:
- D 0 - I - 0x011A39 04:9A29: 03        .byte con_buf_mode_03   ; 

- D 0 - I - 0x011A3A 04:9A2A: 20 28     .dbyt $2028 ; ppu address
- D 0 - I - 0x011A3C 04:9A2C: 10        .byte $10, $00   ; counter + fill tile

- D 0 - I - 0x011A3E 04:9A2E: 03        .byte con_buf_mode_03   ; 

- D 0 - I - 0x011A3F 04:9A2F: 20 48     .dbyt $2048 ; ppu address
- D 0 - I - 0x011A41 04:9A31: 10        .byte $10, $00   ; counter + fill tile

- D 0 - I - 0x011A43 04:9A33: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x011A44 04:9A34: 20 09     .dbyt $2009 ; ppu address
- D 0 - I - 0x011A46 04:9A36: 0E        .byte $0E   ; counter
- D 0 - I - 0x011A47 04:9A37: E0        .byte $E0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $E1   ; 

- D 0 - I - 0x011A55 04:9A45: 20 68     .dbyt $2068 ; ppu address
- D 0 - I - 0x011A57 04:9A47: 10        .byte $10   ; counter
- D 0 - I - 0x011A58 04:9A48: 00        .byte $00, $00, $E2, $E4, $00, $00, $00, $00, $00, $00, $00, $00, $E5, $E3, $00, $00   ; 
- D 0 - I - 0x011A68 04:9A58: FE        .byte $FE   ; end token



_off015_9A59_04:
- D 0 - I - 0x011A69 04:9A59: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x011A6A 04:9A5A: 20 88     .dbyt $2088 ; ppu address
- D 0 - I - 0x011A6C 04:9A5C: 10        .byte $10   ; counter
- D 0 - I - 0x011A6D 04:9A5D: 00        .byte $00, $E2, $E4, $E6, $E8, $EA, $EC, $EC, $EC, $EC, $EB, $E9, $E7, $E5, $E3, $00   ; 

- D 0 - I - 0x011A7D 04:9A6D: 20 A8     .dbyt $20A8 ; ppu address
- D 0 - I - 0x011A7F 04:9A6F: 10        .byte $10   ; counter
- D 0 - I - 0x011A80 04:9A70: EE        .byte $EE, $F0, $F2, $E8, $EA, $EC, $ED, $ED, $ED, $ED, $EC, $EB, $E9, $F3, $F1, $EF   ; 

- D 0 - I - 0x011A90 04:9A80: 20 C8     .dbyt $20C8 ; ppu address
- D 0 - I - 0x011A92 04:9A82: 10        .byte $10   ; counter
- D 0 - I - 0x011A93 04:9A83: 00        .byte $00, $F8, $F6, $EE, $F0, $F4, $DE, $DE, $DE, $DE, $F5, $F1, $EF, $F7, $1C, $00   ; 

- D 0 - I - 0x011AA3 04:9A93: 20 E8     .dbyt $20E8 ; ppu address
- D 0 - I - 0x011AA5 04:9A95: 10        .byte $10   ; counter
- D 0 - I - 0x011AA6 04:9A96: 00        .byte $00, $00, $00, $00, $F8, $F6, $DF, $DF, $DF, $DF, $F7, $1C, $00, $00, $00, $00   ; 

- D 0 - I - 0x011AB6 04:9AA6: 23 C2     .dbyt $23C2 ; ppu address
- D 0 - I - 0x011AB8 04:9AA8: 04        .byte $04   ; counter
- D 0 - I - 0x011AB9 04:9AA9: 00        .byte $00, $00, $00, $00   ; 

- D 0 - I - 0x011ABD 04:9AAD: 23 CA     .dbyt $23CA ; ppu address
- D 0 - I - 0x011ABF 04:9AAF: 04        .byte $04   ; counter
- D 0 - I - 0x011AC0 04:9AB0: 00        .byte $00, $00, $00, $00   ; 

- D 0 - I - 0x011AC4 04:9AB4: FE        .byte $FE   ; end token



_off015_9AB5_05:
- D 0 - I - 0x011AC5 04:9AB5: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x011AC6 04:9AB6: 23 C2     .dbyt $23C2 ; ppu address
- D 0 - I - 0x011AC8 04:9AB8: 04        .byte $04   ; counter
- D 0 - I - 0x011AC9 04:9AB9: FF        .byte $FF, $33, $CC, $FF   ; 

- D 0 - I - 0x011ACD 04:9ABD: 23 CA     .dbyt $23CA ; ppu address
- D 0 - I - 0x011ACF 04:9ABF: 04        .byte $04   ; counter
- D 0 - I - 0x011AD0 04:9AC0: 0C        .byte $0C, $F0, $F0, $03   ; 

- D 0 - I - 0x011AD4 04:9AC4: 23 DB     .dbyt $23DB ; ppu address
- D 0 - I - 0x011AD6 04:9AC6: 02        .byte $02   ; counter
- D 0 - I - 0x011AD7 04:9AC7: 51        .byte $51, $54   ; 

- D 0 - I - 0x011AD9 04:9AC9: FE        .byte $FE   ; end token



_off015_9ACA_06:
- D 0 - I - 0x011ADA 04:9ACA: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x011ADB 04:9ACB: 21 2C     .dbyt $212C ; ppu address
- D 0 - I - 0x011ADD 04:9ACD: 08        .byte $08   ; counter
- D 0 - I - 0x011ADE 04:9ACE: 00        .byte $00, $73, $74, $75, $76, $77, $78, $00   ; 

- D 0 - I - 0x011AE6 04:9AD6: 21 4D     .dbyt $214D ; ppu address
- D 0 - I - 0x011AE8 04:9AD8: 06        .byte $06   ; counter
- D 0 - I - 0x011AE9 04:9AD9: 79        .byte $79, $7A, $7A, $7A, $7A, $7B   ; 

- D 0 - I - 0x011AEF 04:9ADF: 21 6D     .dbyt $216D ; ppu address
- D 0 - I - 0x011AF1 04:9AE1: 06        .byte $06   ; counter
- D 0 - I - 0x011AF2 04:9AE2: 7C        .byte $7C, $7D, $7E, $7F, $88, $89   ; 

- D 0 - I - 0x011AF8 04:9AE8: 21 8D     .dbyt $218D ; ppu address
- D 0 - I - 0x011AFA 04:9AEA: 06        .byte $06   ; counter
- D 0 - I - 0x011AFB 04:9AEB: 00        .byte $00, $8A, $8B, $8C, $8D, $00   ; 

- D 0 - I - 0x011B01 04:9AF1: 21 AE     .dbyt $21AE ; ppu address
- D 0 - I - 0x011B03 04:9AF3: 04        .byte $04   ; counter
- D 0 - I - 0x011B04 04:9AF4: 00        .byte $00, $8E, $8F, $00   ; 

- D 0 - I - 0x011B08 04:9AF8: 23 DB     .dbyt $23DB ; ppu address
- D 0 - I - 0x011B0A 04:9AFA: 02        .byte $02   ; counter
- D 0 - I - 0x011B0B 04:9AFB: 51        .byte $51, $54   ; 

- D 0 - I - 0x011B0D 04:9AFD: FE        .byte $FE   ; end token



_off015_9AFE_07:
- D 0 - I - 0x011B0E 04:9AFE: 06        .byte con_buf_mode_06   ; 

- D 0 - I - 0x011B0F 04:9AFF: 21 2C     .dbyt $212C ; ppu address
- D 0 - I - 0x011B11 04:9B01: 08        .byte $08   ; counter
- D 0 - I - 0x011B12 04:9B02: 90        .byte $90, $7A, $74, $75, $76, $77, $7A, $91   ; 

- D 0 - I - 0x011B1A 04:9B0A: 21 4D     .dbyt $214D ; ppu address
- D 0 - I - 0x011B1C 04:9B0C: 06        .byte $06   ; counter
- D 0 - I - 0x011B1D 04:9B0D: 92        .byte $92, $7A, $7A, $7A, $7A, $93   ; 

- D 0 - I - 0x011B23 04:9B13: 21 6D     .dbyt $216D ; ppu address
- D 0 - I - 0x011B25 04:9B15: 06        .byte $06   ; counter
- D 0 - I - 0x011B26 04:9B16: 94        .byte $94, $95, $96, $97, $98, $99   ; 

- D 0 - I - 0x011B2C 04:9B1C: 21 8D     .dbyt $218D ; ppu address
- D 0 - I - 0x011B2E 04:9B1E: 06        .byte $06   ; counter
- D 0 - I - 0x011B2F 04:9B1F: 9A        .byte $9A, $9B, $9C, $9D, $9E, $9F   ; 

- D 0 - I - 0x011B35 04:9B25: 21 AE     .dbyt $21AE ; ppu address
- D 0 - I - 0x011B37 04:9B27: 04        .byte $04   ; counter
- D 0 - I - 0x011B38 04:9B28: A0        .byte $A0, $A1, $A3, $A7   ; 

- D 0 - I - 0x011B3C 04:9B2C: 23 DB     .dbyt $23DB ; ppu address
- D 0 - I - 0x011B3E 04:9B2E: 02        .byte $02   ; counter
- D 0 - I - 0x011B3F 04:9B2F: 59        .byte $59, $56   ; 

- D 0 - I - 0x011B41 04:9B31: FE        .byte $FE   ; end token



_off001_0x011B42_66_boss_6_snake:
- D 0 - I - 0x011B42 04:9B32: 3C 9B     .word ofs_038_66_9B3C_01_initialize_object ; 
- D 0 - I - 0x011B44 04:9B34: 95 9B     .word ofs_038_66_9B95_02 ; 
- D 0 - I - 0x011B46 04:9B36: 11 9C     .word ofs_038_66_9C11_03 ; 
- D 0 - I - 0x011B48 04:9B38: FD A2     .word ofs_038_66_0x00630D_04 ; 
- D 0 - I - 0x011B4A 04:9B3A: 3D A3     .word ofs_038_66_0x00634D_05_delete_object_04 ; 



ofs_038_66_9B3C_01_initialize_object:
C - - J - - 0x011B4C 04:9B3C: A9 18     LDA #$18
C - - - - - 0x011B4E 04:9B3E: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x011B51 04:9B41: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x011B54 04:9B44: F0 02     BEQ bra_9B48
C - - - - - 0x011B56 04:9B46: A9 F1     LDA #con__hp_F1
bra_9B48:   ; A = 00
C - - - - - 0x011B58 04:9B48: 9D 76 06  STA ram_obj_hp,X
C - - - - - 0x011B5B 04:9B4B: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x011B5E 04:9B4E: D0 40     BNE bra_9B90
C - - - - - 0x011B60 04:9B50: A9 F0     LDA #$F0
C - - - - - 0x011B62 04:9B52: 9D 3C 05  STA ram_pos_X_hi_enemy,X
; !!! ??? хз что мне тут не понравилось
C - - - - - 0x011B65 04:9B55: A0 00     LDY #$00
bra_9B57_loop:
C - - - - - 0x011B67 04:9B57: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x011B6A 04:9B5A: 99 40 04  STA ram_0440,Y
C - - - - - 0x011B6D 04:9B5D: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x011B70 04:9B60: 99 A0 04  STA ram_04A0,Y
C - - - - - 0x011B73 04:9B63: C8        INY
C - - - - - 0x011B74 04:9B64: C0 5C     CPY #$5C
C - - - - - 0x011B76 04:9B66: 90 EF     BCC bra_9B57_loop
C - - - - - 0x011B78 04:9B68: 86 12     STX ram_0012
C - - - - - 0x011B7A 04:9B6A: A9 01     LDA #$01
C - - - - - 0x011B7C 04:9B6C: 85 08     STA ram_0008
bra_9B6E_loop:
C - - - - - 0x011B7E 04:9B6E: 86 10     STX ram_0010
C - - - - - 0x011B80 04:9B70: A0 66     LDY #con_obj_id_66
C - - - - - 0x011B82 04:9B72: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x011B85 04:9B75: 90 12     BCC bra_9B89
C - - - - - 0x011B87 04:9B77: A4 11     LDY ram_0011
C - - - - - 0x011B89 04:9B79: A5 08     LDA ram_0008
C - - - - - 0x011B8B 04:9B7B: 99 64 07  STA ram_0764_obj,Y
C - - - - - 0x011B8E 04:9B7E: E6 08     INC ram_0008
C - - - - - 0x011B90 04:9B80: C9 06     CMP #$06
C - - - - - 0x011B92 04:9B82: 98        TYA
C - - - - - 0x011B93 04:9B83: 9D 80 07  STA ram_0780_obj,X
C - - - - - 0x011B96 04:9B86: AA        TAX
C - - - - - 0x011B97 04:9B87: 90 E5     BCC bra_9B6E_loop
bra_9B89:
C - - - - - 0x011B99 04:9B89: A9 FF     LDA #$FF
C - - - - - 0x011B9B 04:9B8B: 9D 80 07  STA ram_0780_obj,X
C - - - - - 0x011B9E 04:9B8E: A6 12     LDX ram_0012
bra_9B90:
C - - - - - 0x011BA0 04:9B90: A9 08     LDA #$08
C - - - - - 0x011BA2 04:9B92: 4C E0 A2  JMP loc_0x0062F0



ofs_038_66_9B95_02:
C - - J - - 0x011BA5 04:9B95: 20 22 9C  JSR sub_9C22
C - - - - - 0x011BA8 04:9B98: BC 3C 05  LDY ram_pos_X_hi_enemy,X
C - - - - - 0x011BAB 04:9B9B: C0 14     CPY #$14
C - - - - - 0x011BAD 04:9B9D: 90 17     BCC bra_9BB6
C - - - - - 0x011BAF 04:9B9F: C0 24     CPY #$24
C - - - - - 0x011BB1 04:9BA1: 90 08     BCC bra_9BAB
C - - - - - 0x011BB3 04:9BA3: C0 EA     CPY #$EA
C - - - - - 0x011BB5 04:9BA5: B0 0F     BCS bra_9BB6
C - - - - - 0x011BB7 04:9BA7: C0 DC     CPY #$DC
C - - - - - 0x011BB9 04:9BA9: 90 10     BCC bra_9BBB
bra_9BAB:
C - - - - - 0x011BBB 04:9BAB: BD 56 05  LDA ram_attr_spr_enemy,X
C - - - - - 0x011BBE 04:9BAE: 09 20     ORA #$20
C - - - - - 0x011BC0 04:9BB0: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x011BC3 04:9BB3: 4C BB 9B  JMP loc_9BBB
bra_9BB6:
C - - - - - 0x011BC6 04:9BB6: A9 00     LDA #$00
C - - - - - 0x011BC8 04:9BB8: 9D 08 05  STA ram_anim_id_enemy,X
bra_9BBB:
loc_9BBB:
C D 0 - - - 0x011BCB 04:9BBB: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x011BCE 04:9BBE: F0 01     BEQ bra_9BC1
C - - - - - 0x011BD0 04:9BC0: 60        RTS
bra_9BC1:
C - - - - - 0x011BD1 04:9BC1: 20 4F 9C  JSR sub_9C4F
C - - - - - 0x011BD4 04:9BC4: AD FF 04  LDA ram_04FF
C - - - - - 0x011BD7 04:9BC7: 38        SEC
C - - - - - 0x011BD8 04:9BC8: E9 01     SBC #$01
C - - - - - 0x011BDA 04:9BCA: C9 5C     CMP #$5C
C - - - - - 0x011BDC 04:9BCC: 90 02     BCC bra_9BD0
C - - - - - 0x011BDE 04:9BCE: 69 5B     ADC #$5B
bra_9BD0:
C - - - - - 0x011BE0 04:9BD0: 8D FF 04  STA ram_04FF
C - - - - - 0x011BE3 04:9BD3: A8        TAY
C - - - - - 0x011BE4 04:9BD4: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x011BE7 04:9BD7: 99 40 04  STA ram_0440,Y
C - - - - - 0x011BEA 04:9BDA: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x011BED 04:9BDD: 99 A0 04  STA ram_04A0,Y
loc_9BE0:
C D 0 - - - 0x011BF0 04:9BE0: BD 80 07  LDA ram_0780_obj,X
C - - - - - 0x011BF3 04:9BE3: 30 23     BMI bra_9C08
C - - - - - 0x011BF5 04:9BE5: AA        TAX
C - - - - - 0x011BF6 04:9BE6: BC 64 07  LDY ram_0764_obj,X
C - - - - - 0x011BF9 04:9BE9: B9 0A 9C  LDA tbl_9C0B - $01,Y
C - - - - - 0x011BFC 04:9BEC: 18        CLC
C - - - - - 0x011BFD 04:9BED: 6D FF 04  ADC ram_04FF
C - - - - - 0x011C00 04:9BF0: B0 04     BCS bra_9BF6
C - - - - - 0x011C02 04:9BF2: C9 5C     CMP #$5C
C - - - - - 0x011C04 04:9BF4: 90 02     BCC bra_9BF8
bra_9BF6:
C - - - - - 0x011C06 04:9BF6: E9 5C     SBC #$5C
bra_9BF8:
C - - - - - 0x011C08 04:9BF8: A8        TAY
C - - - - - 0x011C09 04:9BF9: B9 40 04  LDA ram_0440,Y
C - - - - - 0x011C0C 04:9BFC: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x011C0F 04:9BFF: B9 A0 04  LDA ram_04A0,Y
C - - - - - 0x011C12 04:9C02: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x011C15 04:9C05: 4C E0 9B  JMP loc_9BE0
bra_9C08:
C - - - - - 0x011C18 04:9C08: A6 10     LDX ram_0010
C - - - - - 0x011C1A 04:9C0A: 60        RTS



tbl_9C0B:
- D 0 - - - 0x011C1B 04:9C0B: 0F        .byte $0F   ; 01 
- D 0 - - - 0x011C1C 04:9C0C: 1E        .byte $1E   ; 02 
- D 0 - - - 0x011C1D 04:9C0D: 2D        .byte $2D   ; 03 
- D 0 - - - 0x011C1E 04:9C0E: 3C        .byte $3C   ; 04 
- D 0 - - - 0x011C1F 04:9C0F: 4B        .byte $4B   ; 05 
- D 0 - - - 0x011C20 04:9C10: 5A        .byte $5A   ; 06 



ofs_038_66_9C11_03:
C - - J - - 0x011C21 04:9C11: BD 80 07  LDA ram_0780_obj,X
C - - - - - 0x011C24 04:9C14: C9 FF     CMP #$FF
C - - - - - 0x011C26 04:9C16: F0 06     BEQ bra_9C1E_FF
C - - - - - 0x011C28 04:9C18: AA        TAX
C - - - - - 0x011C29 04:9C19: 20 75 A4  JSR sub_0x006485_kill_enemy
C - - - - - 0x011C2C 04:9C1C: A6 10     LDX ram_0010
bra_9C1E_FF:
C - - - - - 0x011C2E 04:9C1E: 20 9A A2  JSR sub_0x0062AA
C - - - - - 0x011C31 04:9C21: 60        RTS



sub_9C22:
C - - - - - 0x011C32 04:9C22: A0 08     LDY #$08
C - - - - - 0x011C34 04:9C24: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x011C37 04:9C27: D0 07     BNE bra_9C30
C - - - - - 0x011C39 04:9C29: BC 48 07  LDY ram_0748_obj,X
C - - - - - 0x011C3C 04:9C2C: B9 D4 F4  LDA tbl_0x01F4E4,Y
C - - - - - 0x011C3F 04:9C2F: A8        TAY
bra_9C30:
C - - - - - 0x011C40 04:9C30: B9 3D 9C  LDA tbl_9C3D_animation,Y
C - - - - - 0x011C43 04:9C33: 9D 08 05  STA ram_anim_id_enemy,X
C - - - - - 0x011C46 04:9C36: B9 46 9C  LDA tbl_9C46_spr_attr,Y
C - - - - - 0x011C49 04:9C39: 9D 56 05  STA ram_attr_spr_enemy,X
C - - - - - 0x011C4C 04:9C3C: 60        RTS



tbl_9C3D_animation:
- D 0 - - - 0x011C4D 04:9C3D: 8B        .byte $8B   ; 00 
- D 0 - - - 0x011C4E 04:9C3E: 8A        .byte $8A   ; 01 
- D 0 - - - 0x011C4F 04:9C3F: 89        .byte $89   ; 02 
- D 0 - - - 0x011C50 04:9C40: 8A        .byte $8A   ; 03 
- D 0 - - - 0x011C51 04:9C41: 8B        .byte $8B   ; 04 
- D 0 - - - 0x011C52 04:9C42: 8C        .byte $8C   ; 05 
- D 0 - - - 0x011C53 04:9C43: 8D        .byte $8D   ; 06 
- D 0 - - - 0x011C54 04:9C44: 8C        .byte $8C   ; 07 
- D 0 - - - 0x011C55 04:9C45: 8E        .byte $8E   ; 08 



tbl_9C46_spr_attr:
- D 0 - - - 0x011C56 04:9C46: 43        .byte $43   ; 00 
- D 0 - - - 0x011C57 04:9C47: 43        .byte $43   ; 01 
- D 0 - - - 0x011C58 04:9C48: 03        .byte $03   ; 02 
- D 0 - - - 0x011C59 04:9C49: 03        .byte $03   ; 03 
- D 0 - - - 0x011C5A 04:9C4A: 03        .byte $03   ; 04 
- D 0 - - - 0x011C5B 04:9C4B: 03        .byte $03   ; 05 
- D 0 - - - 0x011C5C 04:9C4C: 03        .byte $03   ; 06 
- D 0 - - - 0x011C5D 04:9C4D: 43        .byte $43   ; 07 
- D 0 - - - 0x011C5E 04:9C4E: 03        .byte $03   ; 08 



sub_9C4F:
C - - - - - 0x011C5F 04:9C4F: BD 56 07  LDA ram_0756_obj,X
C - - - - - 0x011C62 04:9C52: 20 09 E6  JSR sub_0x01E619_jump_to_pointers_after_jsr
- D 0 - I - 0x011C65 04:9C55: 5B 9C     .word ofs_029_9C5B_00
- D 0 - I - 0x011C67 04:9C57: 79 9C     .word ofs_029_9C79_01
- D 0 - I - 0x011C69 04:9C59: 9E 9C     .word ofs_029_9C9E_02



ofs_029_9C5B_00:
C - - J - - 0x011C6B 04:9C5B: BC 72 07  LDY ram_0772_obj,X
C - - - - - 0x011C6E 04:9C5E: B9 DA 9C  LDA tbl_9CDA_index,Y
C - - - - - 0x011C71 04:9C61: A8        TAY
C - - - - - 0x011C72 04:9C62: B9 DE 9C  LDA tbl_9CDE_pos_Y,Y
C - - - - - 0x011C75 04:9C65: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x011C78 04:9C68: B9 E2 9C  LDA tbl_9CE2_pos_X,Y
C - - - - - 0x011C7B 04:9C6B: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x011C7E 04:9C6E: A9 FF     LDA #$FF
C - - - - - 0x011C80 04:9C70: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x011C83 04:9C73: 20 A9 9C  JSR sub_9CA9
C - - - - - 0x011C86 04:9C76: 4C 9A 9C  JMP loc_9C9A



ofs_029_9C79_01:
C - - J - - 0x011C89 04:9C79: 20 BA 9D  JSR sub_9DBA_move_object
C - - - - - 0x011C8C 04:9C7C: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011C8F 04:9C7F: D0 1C     BNE bra_9C9D_RTS
C - - - - - 0x011C91 04:9C81: 20 A9 9C  JSR sub_9CA9
C - - - - - 0x011C94 04:9C84: 10 17     BPL bra_9C9D_RTS
C - - - - - 0x011C96 04:9C86: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x011C99 04:9C89: 18        CLC
C - - - - - 0x011C9A 04:9C8A: 69 01     ADC #$01
C - - - - - 0x011C9C 04:9C8C: C9 04     CMP #$04
C - - - - - 0x011C9E 04:9C8E: 90 02     BCC bra_9C92
- - - - - - 0x011CA0 04:9C90: A9 00     LDA #$00
bra_9C92:
C - - - - - 0x011CA2 04:9C92: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x011CA5 04:9C95: A9 80     LDA #$80
C - - - - - 0x011CA7 04:9C97: 9D E6 06  STA ram_06E6_obj,X
loc_9C9A:
C D 0 - - - 0x011CAA 04:9C9A: FE 56 07  INC ram_0756_obj,X
bra_9C9D_RTS:
C - - - - - 0x011CAD 04:9C9D: 60        RTS



ofs_029_9C9E_02:
C - - J - - 0x011CAE 04:9C9E: DE E6 06  DEC ram_06E6_obj,X
C - - - - - 0x011CB1 04:9CA1: D0 FA     BNE bra_9C9D_RTS
C - - - - - 0x011CB3 04:9CA3: A9 00     LDA #$00
C - - - - - 0x011CB5 04:9CA5: 9D 56 07  STA ram_0756_obj,X
C - - - - - 0x011CB8 04:9CA8: 60        RTS



sub_9CA9:
C - - - - - 0x011CB9 04:9CA9: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x011CBC 04:9CAC: BC 72 07  LDY ram_0772_obj,X
C - - - - - 0x011CBF 04:9CAF: B9 DA 9C  LDA tbl_9CDA_index,Y
C - - - - - 0x011CC2 04:9CB2: 0A        ASL
C - - - - - 0x011CC3 04:9CB3: A8        TAY
C - - - - - 0x011CC4 04:9CB4: B9 E6 9C  LDA tbl_9CE6,Y
C - - - - - 0x011CC7 04:9CB7: 85 00     STA ram_0000
C - - - - - 0x011CC9 04:9CB9: B9 E7 9C  LDA tbl_9CE6 + $01,Y
C - - - - - 0x011CCC 04:9CBC: 85 01     STA ram_0001
C - - - - - 0x011CCE 04:9CBE: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x011CD1 04:9CC1: 0A        ASL
C - - - - - 0x011CD2 04:9CC2: A8        TAY
C - - - - - 0x011CD3 04:9CC3: B1 00     LDA (ram_0000),Y
C - - - - - 0x011CD5 04:9CC5: 30 12     BMI bra_9CD9_RTS
C - - - - - 0x011CD7 04:9CC7: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x011CDA 04:9CCA: C8        INY
C - - - - - 0x011CDB 04:9CCB: B1 00     LDA (ram_0000),Y
C - - - - - 0x011CDD 04:9CCD: 9D E6 06  STA ram_06E6_obj,X
C - - - - - 0x011CE0 04:9CD0: A0 03     LDY #$03
C - - - - - 0x011CE2 04:9CD2: 84 06     STY ram_0006
C - - - - - 0x011CE4 04:9CD4: 20 2B A9  JSR sub_0x00693B
C - - - - - 0x011CE7 04:9CD7: A9 00     LDA #$00
bra_9CD9_RTS:
C - - - - - 0x011CE9 04:9CD9: 60        RTS



tbl_9CDA_index:
- D 0 - - - 0x011CEA 04:9CDA: 02        .byte $02   ; 00 
- D 0 - - - 0x011CEB 04:9CDB: 03        .byte $03   ; 01 
- D 0 - - - 0x011CEC 04:9CDC: 02        .byte $02   ; 02 
- - - - - - 0x011CED 04:9CDD: 03        .byte $03   ; 03 



tbl_9CDE_pos_Y:
; bzk garbage 00 and 01, no such indexes 0x011CEA
- - - - - - 0x011CEE 04:9CDE: 48        .byte $48   ; 00 
- - - - - - 0x011CEF 04:9CDF: 48        .byte $48   ; 01 
- D 0 - - - 0x011CF0 04:9CE0: 48        .byte $48   ; 02 
- D 0 - - - 0x011CF1 04:9CE1: 48        .byte $48   ; 03 



tbl_9CE2_pos_X:
; bzk garbage 00 and 01, no such indexes 0x011CEA
- - - - - - 0x011CF2 04:9CE2: F0        .byte $F0   ; 00 
- - - - - - 0x011CF3 04:9CE3: 10        .byte $10   ; 01 
- D 0 - - - 0x011CF4 04:9CE4: F0        .byte $F0   ; 02 
- D 0 - - - 0x011CF5 04:9CE5: 10        .byte $10   ; 03 



tbl_9CE6:
- - - - - - 0x011CF6 04:9CE6: EE 9C     .word _off024_9CEE_00
- - - - - - 0x011CF8 04:9CE8: 09 9D     .word _off024_9D09_01
- D 0 - - - 0x011CFA 04:9CEA: 24 9D     .word _off024_9D24_02
- D 0 - - - 0x011CFC 04:9CEC: 6F 9D     .word _off024_9D6F_03



_off024_9CEE_00:
; bzk garbage, no such index 0x011CEA
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- - - - - - 0x011CFE 04:9CEE: 09        .byte $09, $16   ; 00 
- - - - - - 0x011D00 04:9CF0: 07        .byte $07, $40   ; 01 
- - - - - - 0x011D02 04:9CF2: 08        .byte $08, $10   ; 02 
- - - - - - 0x011D04 04:9CF4: 09        .byte $09, $10   ; 03 
- - - - - - 0x011D06 04:9CF6: 0A        .byte $0A, $10   ; 04 
- - - - - - 0x011D08 04:9CF8: 0B        .byte $0B, $10   ; 05 
- - - - - - 0x011D0A 04:9CFA: 0C        .byte $0C, $10   ; 06 
- - - - - - 0x011D0C 04:9CFC: 0D        .byte $0D, $10   ; 07 
- - - - - - 0x011D0E 04:9CFE: 0E        .byte $0E, $10   ; 08 
- - - - - - 0x011D10 04:9D00: 0F        .byte $0F, $10   ; 09 
- - - - - - 0x011D12 04:9D02: 10        .byte $10, $10   ; 0A 
- - - - - - 0x011D14 04:9D04: 11        .byte $11, $40   ; 0B 
- - - - - - 0x011D16 04:9D06: 0F        .byte $0F, $16   ; 0C 
- - - - - - 0x011D18 04:9D08: FF        .byte $FF   ; 0D final



_off024_9D09_01:
; bzk garbage, no such index 0x011CEA
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- - - - - - 0x011D19 04:9D09: 03        .byte $03, $16   ; 
- - - - - - 0x011D1B 04:9D0B: 05        .byte $05, $40   ; 
- - - - - - 0x011D1D 04:9D0D: 04        .byte $04, $10   ; 
- - - - - - 0x011D1F 04:9D0F: 03        .byte $03, $10   ; 
- - - - - - 0x011D21 04:9D11: 02        .byte $02, $10   ; 
- - - - - - 0x011D23 04:9D13: 01        .byte $01, $10   ; 
- - - - - - 0x011D25 04:9D15: 00        .byte $00, $10   ; 
- - - - - - 0x011D27 04:9D17: 17        .byte $17, $10   ; 
- - - - - - 0x011D29 04:9D19: 16        .byte $16, $10   ; 
- - - - - - 0x011D2B 04:9D1B: 15        .byte $15, $10   ; 
- - - - - - 0x011D2D 04:9D1D: 14        .byte $14, $10   ; 
- - - - - - 0x011D2F 04:9D1F: 13        .byte $13, $40   ; 
- - - - - - 0x011D31 04:9D21: 15        .byte $15, $16   ; 
- - - - - - 0x011D33 04:9D23: FF        .byte $FF   ; 



_off024_9D24_02:
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- D 0 - I - 0x011D34 04:9D24: 09        .byte $09, $16   ; 00 
- D 0 - I - 0x011D36 04:9D26: 07        .byte $07, $40   ; 01 
- D 0 - I - 0x011D38 04:9D28: 08        .byte $08, $10   ; 02 
- D 0 - I - 0x011D3A 04:9D2A: 09        .byte $09, $10   ; 03 
- D 0 - I - 0x011D3C 04:9D2C: 0A        .byte $0A, $10   ; 04 
- D 0 - I - 0x011D3E 04:9D2E: 0B        .byte $0B, $10   ; 05 
- D 0 - I - 0x011D40 04:9D30: 0C        .byte $0C, $10   ; 06 
- D 0 - I - 0x011D42 04:9D32: 0D        .byte $0D, $0A   ; 07 
- D 0 - I - 0x011D44 04:9D34: 0E        .byte $0E, $0A   ; 08 
- D 0 - I - 0x011D46 04:9D36: 0F        .byte $0F, $0A   ; 09 
- D 0 - I - 0x011D48 04:9D38: 10        .byte $10, $0A   ; 0A 
- D 0 - I - 0x011D4A 04:9D3A: 11        .byte $11, $0A   ; 0B 
- D 0 - I - 0x011D4C 04:9D3C: 12        .byte $12, $0A   ; 0C 
- D 0 - I - 0x011D4E 04:9D3E: 13        .byte $13, $0A   ; 0D 
- D 0 - I - 0x011D50 04:9D40: 14        .byte $14, $0A   ; 0E 
- D 0 - I - 0x011D52 04:9D42: 15        .byte $15, $0A   ; 0F 
- D 0 - I - 0x011D54 04:9D44: 16        .byte $16, $0A   ; 10 
- D 0 - I - 0x011D56 04:9D46: 17        .byte $17, $0A   ; 11 
- D 0 - I - 0x011D58 04:9D48: 00        .byte $00, $10   ; 12 
- D 0 - I - 0x011D5A 04:9D4A: 01        .byte $01, $0A   ; 13 
- D 0 - I - 0x011D5C 04:9D4C: 02        .byte $02, $0A   ; 14 
- D 0 - I - 0x011D5E 04:9D4E: 03        .byte $03, $0A   ; 15 
- D 0 - I - 0x011D60 04:9D50: 04        .byte $04, $0A   ; 16 
- D 0 - I - 0x011D62 04:9D52: 05        .byte $05, $0A   ; 17 
- D 0 - I - 0x011D64 04:9D54: 06        .byte $06, $0A   ; 18 
- D 0 - I - 0x011D66 04:9D56: 07        .byte $07, $0A   ; 19 
- D 0 - I - 0x011D68 04:9D58: 08        .byte $08, $0A   ; 1A 
- D 0 - I - 0x011D6A 04:9D5A: 09        .byte $09, $0A   ; 1B 
- D 0 - I - 0x011D6C 04:9D5C: 0A        .byte $0A, $0A   ; 1C 
- D 0 - I - 0x011D6E 04:9D5E: 0B        .byte $0B, $0A   ; 1D 
- D 0 - I - 0x011D70 04:9D60: 0C        .byte $0C, $10   ; 1E 
- D 0 - I - 0x011D72 04:9D62: 0D        .byte $0D, $10   ; 1F 
- D 0 - I - 0x011D74 04:9D64: 0E        .byte $0E, $10   ; 20 
- D 0 - I - 0x011D76 04:9D66: 0F        .byte $0F, $10   ; 21 
- D 0 - I - 0x011D78 04:9D68: 10        .byte $10, $10   ; 22 
- D 0 - I - 0x011D7A 04:9D6A: 11        .byte $11, $40   ; 23 
- D 0 - I - 0x011D7C 04:9D6C: 0F        .byte $0F, $16   ; 24 
- D 0 - I - 0x011D7E 04:9D6E: FF        .byte $FF   ; 25 final



_off024_9D6F_03:
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- D 0 - I - 0x011D7F 04:9D6F: 03        .byte $03, $16   ; 00 
- D 0 - I - 0x011D81 04:9D71: 05        .byte $05, $40   ; 01 
- D 0 - I - 0x011D83 04:9D73: 04        .byte $04, $10   ; 02 
- D 0 - I - 0x011D85 04:9D75: 03        .byte $03, $10   ; 03 
- D 0 - I - 0x011D87 04:9D77: 02        .byte $02, $10   ; 04 
- D 0 - I - 0x011D89 04:9D79: 01        .byte $01, $10   ; 05 
- D 0 - I - 0x011D8B 04:9D7B: 00        .byte $00, $10   ; 06 
- D 0 - I - 0x011D8D 04:9D7D: 17        .byte $17, $0A   ; 07 
- D 0 - I - 0x011D8F 04:9D7F: 16        .byte $16, $0A   ; 08 
- D 0 - I - 0x011D91 04:9D81: 15        .byte $15, $0A   ; 09 
- D 0 - I - 0x011D93 04:9D83: 14        .byte $14, $0A   ; 0A 
- D 0 - I - 0x011D95 04:9D85: 13        .byte $13, $0A   ; 0B 
- D 0 - I - 0x011D97 04:9D87: 12        .byte $12, $0A   ; 0C 
- D 0 - I - 0x011D99 04:9D89: 11        .byte $11, $0A   ; 0D 
- D 0 - I - 0x011D9B 04:9D8B: 10        .byte $10, $0A   ; 0E 
- D 0 - I - 0x011D9D 04:9D8D: 0F        .byte $0F, $0A   ; 0F 
- D 0 - I - 0x011D9F 04:9D8F: 0E        .byte $0E, $0A   ; 10 
- D 0 - I - 0x011DA1 04:9D91: 0D        .byte $0D, $0A   ; 11 
- D 0 - I - 0x011DA3 04:9D93: 0C        .byte $0C, $10   ; 12 
- D 0 - I - 0x011DA5 04:9D95: 0B        .byte $0B, $0A   ; 13 
- D 0 - I - 0x011DA7 04:9D97: 0A        .byte $0A, $0A   ; 14 
- D 0 - I - 0x011DA9 04:9D99: 09        .byte $09, $0A   ; 15 
- D 0 - I - 0x011DAB 04:9D9B: 08        .byte $08, $0A   ; 16 
- D 0 - I - 0x011DAD 04:9D9D: 07        .byte $07, $0A   ; 17 
- D 0 - I - 0x011DAF 04:9D9F: 06        .byte $06, $0A   ; 18 
- D 0 - I - 0x011DB1 04:9DA1: 05        .byte $05, $0A   ; 19 
- D 0 - I - 0x011DB3 04:9DA3: 04        .byte $04, $0A   ; 1A 
- D 0 - I - 0x011DB5 04:9DA5: 03        .byte $03, $0A   ; 1B 
- D 0 - I - 0x011DB7 04:9DA7: 02        .byte $02, $0A   ; 1C 
- D 0 - I - 0x011DB9 04:9DA9: 01        .byte $01, $0A   ; 1D 
- D 0 - I - 0x011DBB 04:9DAB: 00        .byte $00, $10   ; 1E 
- D 0 - I - 0x011DBD 04:9DAD: 17        .byte $17, $10   ; 1F 
- D 0 - I - 0x011DBF 04:9DAF: 16        .byte $16, $10   ; 20 
- D 0 - I - 0x011DC1 04:9DB1: 15        .byte $15, $10   ; 21 
- D 0 - I - 0x011DC3 04:9DB3: 14        .byte $14, $10   ; 22 
- D 0 - I - 0x011DC5 04:9DB5: 13        .byte $13, $40   ; 23 
- D 0 - I - 0x011DC7 04:9DB7: 15        .byte $15, $16   ; 24 
- D 0 - I - 0x011DC9 04:9DB9: FF        .byte $FF   ; 25 final



sub_9DBA_move_object:
C - - - - - 0x011DCA 04:9DBA: BD 84 06  LDA ram_pos_Y_lo_enemy,X
C - - - - - 0x011DCD 04:9DBD: 18        CLC
C - - - - - 0x011DCE 04:9DBE: 7D A0 06  ADC ram_spd_Y_lo_obj,X
C - - - - - 0x011DD1 04:9DC1: 9D 84 06  STA ram_pos_Y_lo_enemy,X
C - - - - - 0x011DD4 04:9DC4: BD 22 05  LDA ram_pos_Y_hi_enemy,X
C - - - - - 0x011DD7 04:9DC7: 7D AE 06  ADC ram_spd_Y_hi_obj,X
C - - - - - 0x011DDA 04:9DCA: 9D 22 05  STA ram_pos_Y_hi_enemy,X
C - - - - - 0x011DDD 04:9DCD: BD 92 06  LDA ram_pos_X_lo_enemy,X
C - - - - - 0x011DE0 04:9DD0: 18        CLC
C - - - - - 0x011DE1 04:9DD1: 7D BC 06  ADC ram_spd_X_lo_obj,X
C - - - - - 0x011DE4 04:9DD4: 9D 92 06  STA ram_pos_X_lo_enemy,X
C - - - - - 0x011DE7 04:9DD7: BD 3C 05  LDA ram_pos_X_hi_enemy,X
C - - - - - 0x011DEA 04:9DDA: 7D CA 06  ADC ram_spd_X_hi_obj,X
C - - - - - 0x011DED 04:9DDD: 9D 3C 05  STA ram_pos_X_hi_enemy,X
C - - - - - 0x011DF0 04:9DE0: 60        RTS



_off004_0x011DF1_04_area_5:
- D 0 - I - 0x011DF1 04:9DE1: 09        .byte $09   ; config
- D 0 - I - 0x011DF2 04:9DE2: 07        .byte $07   ; config

- D 0 - I - 0x011DF3 04:9DE3: 07        .byte $07   ; 
- D 0 - I - 0x011DF4 04:9DE4: 08        .byte $08   ; 
- D 0 - I - 0x011DF5 04:9DE5: 09        .byte $09   ; 
- D 0 - I - 0x011DF6 04:9DE6: 00        .byte $00   ; 
- - - - - - 0x011DF7 04:9DE7: 00        .byte $00   ; 
- - - - - - 0x011DF8 04:9DE8: 00        .byte $00   ; 
- - - - - - 0x011DF9 04:9DE9: 00        .byte $00   ; 
- - - - - - 0x011DFA 04:9DEA: 00        .byte $00   ; 
- - - - - - 0x011DFB 04:9DEB: 00        .byte $00   ; 
- D 0 - I - 0x011DFC 04:9DEC: 06        .byte $06   ; 
- D 0 - I - 0x011DFD 04:9DED: 0A        .byte $0A   ; 
- D 0 - I - 0x011DFE 04:9DEE: 0B        .byte $0B   ; 
- D 0 - I - 0x011DFF 04:9DEF: 0C        .byte $0C   ; 
- D 0 - I - 0x011E00 04:9DF0: 00        .byte $00   ; 
- D 0 - I - 0x011E01 04:9DF1: 00        .byte $00   ; 
- D 0 - I - 0x011E02 04:9DF2: 00        .byte $00   ; 
- - - - - - 0x011E03 04:9DF3: 00        .byte $00   ; 
- D 0 - I - 0x011E04 04:9DF4: 00        .byte $00   ; 
- D 0 - I - 0x011E05 04:9DF5: 05        .byte $05   ; 
- - - - - - 0x011E06 04:9DF6: 00        .byte $00   ; 
- D 0 - I - 0x011E07 04:9DF7: 0A        .byte $0A   ; 
- D 0 - I - 0x011E08 04:9DF8: 0D        .byte $0D   ; 
- D 0 - I - 0x011E09 04:9DF9: 0E        .byte $0E   ; 
- D 0 - I - 0x011E0A 04:9DFA: 0F        .byte $0F   ; 
- D 0 - I - 0x011E0B 04:9DFB: 11        .byte $11   ; 
- - - - - - 0x011E0C 04:9DFC: 00        .byte $00   ; 
- D 0 - I - 0x011E0D 04:9DFD: 10        .byte $10   ; 
- D 0 - I - 0x011E0E 04:9DFE: 04        .byte $04   ; 
- - - - - - 0x011E0F 04:9DFF: 00        .byte $00   ; 
- - - - - - 0x011E10 04:9E00: 00        .byte $00   ; 
- - - - - - 0x011E11 04:9E01: 00        .byte $00   ; 
- - - - - - 0x011E12 04:9E02: 00        .byte $00   ; 
- - - - - - 0x011E13 04:9E03: 00        .byte $00   ; 
- - - - - - 0x011E14 04:9E04: 00        .byte $00   ; 
- - - - - - 0x011E15 04:9E05: 00        .byte $00   ; 
- - - - - - 0x011E16 04:9E06: 00        .byte $00   ; 
- D 0 - I - 0x011E17 04:9E07: 03        .byte $03   ; 
- - - - - - 0x011E18 04:9E08: 00        .byte $00   ; 
- - - - - - 0x011E19 04:9E09: 00        .byte $00   ; 
- - - - - - 0x011E1A 04:9E0A: 00        .byte $00   ; 
- - - - - - 0x011E1B 04:9E0B: 00        .byte $00   ; 
- - - - - - 0x011E1C 04:9E0C: 00        .byte $00   ; 
- - - - - - 0x011E1D 04:9E0D: 00        .byte $00   ; 
- - - - - - 0x011E1E 04:9E0E: 00        .byte $00   ; 
- - - - - - 0x011E1F 04:9E0F: 00        .byte $00   ; 
- D 0 - I - 0x011E20 04:9E10: 02        .byte $02   ; 
- - - - - - 0x011E21 04:9E11: 00        .byte $00   ; 
- - - - - - 0x011E22 04:9E12: 00        .byte $00   ; 
- - - - - - 0x011E23 04:9E13: 00        .byte $00   ; 
- - - - - - 0x011E24 04:9E14: 00        .byte $00   ; 
- - - - - - 0x011E25 04:9E15: 00        .byte $00   ; 
- - - - - - 0x011E26 04:9E16: 00        .byte $00   ; 
- - - - - - 0x011E27 04:9E17: 00        .byte $00   ; 
- - - - - - 0x011E28 04:9E18: 00        .byte $00   ; 
- D 0 - I - 0x011E29 04:9E19: 01        .byte $01   ; 
- D 0 - I - 0x011E2A 04:9E1A: 00        .byte $00   ; 
- - - - - - 0x011E2B 04:9E1B: 00        .byte $00   ; 
- - - - - - 0x011E2C 04:9E1C: 00        .byte $00   ; 
- - - - - - 0x011E2D 04:9E1D: 00        .byte $00   ; 
- - - - - - 0x011E2E 04:9E1E: 00        .byte $00   ; 
- - - - - - 0x011E2F 04:9E1F: 00        .byte $00   ; 
- - - - - - 0x011E30 04:9E20: 00        .byte $00   ; 
- - - - - - 0x011E31 04:9E21: 00        .byte $00   ; 



_off005_0x011E32_04_area_5:
- D 0 - I - 0x011E32 04:9E22: 46 9E     .word _off018_04_9E46_00
- D 0 - I - 0x011E34 04:9E24: 86 9E     .word _off018_04_9E86_01
- D 0 - I - 0x011E36 04:9E26: C6 9E     .word _off018_04_9EC6_02
- D 0 - I - 0x011E38 04:9E28: 06 9F     .word _off018_04_9F06_03
- D 0 - I - 0x011E3A 04:9E2A: 46 9F     .word _off018_04_9F46_04
- D 0 - I - 0x011E3C 04:9E2C: 86 9F     .word _off018_04_9F86_05
- D 0 - I - 0x011E3E 04:9E2E: C6 9F     .word _off018_04_9FC6_06
- D 0 - I - 0x011E40 04:9E30: 06 A0     .word _off018_04_A006_07
- D 0 - I - 0x011E42 04:9E32: 46 A0     .word _off018_04_A046_08
- D 0 - I - 0x011E44 04:9E34: 86 A0     .word _off018_04_A086_09
- D 0 - I - 0x011E46 04:9E36: C6 A0     .word _off018_04_A0C6_0A
- D 0 - I - 0x011E48 04:9E38: 06 A1     .word _off018_04_A106_0B
- D 0 - I - 0x011E4A 04:9E3A: 46 A1     .word _off018_04_A146_0C
- D 0 - I - 0x011E4C 04:9E3C: 86 A1     .word _off018_04_A186_0D
- D 0 - I - 0x011E4E 04:9E3E: C6 A1     .word _off018_04_A1C6_0E
- D 0 - I - 0x011E50 04:9E40: 06 A2     .word _off018_04_A206_0F
- D 0 - I - 0x011E52 04:9E42: 46 A2     .word _off018_04_A246_10
- D 0 - I - 0x011E54 04:9E44: 86 A2     .word _off018_04_A286_11



_off018_04_9E46_00:
- D 0 - I - 0x011E56 04:9E46: 00        .byte $00   ; 
- - - - - - 0x011E57 04:9E47: 00        .byte $00   ; 
- - - - - - 0x011E58 04:9E48: 00        .byte $00   ; 
- - - - - - 0x011E59 04:9E49: 00        .byte $00   ; 
- - - - - - 0x011E5A 04:9E4A: 00        .byte $00   ; 
- - - - - - 0x011E5B 04:9E4B: 00        .byte $00   ; 
- - - - - - 0x011E5C 04:9E4C: 00        .byte $00   ; 
- - - - - - 0x011E5D 04:9E4D: 00        .byte $00   ; 
- D 0 - I - 0x011E5E 04:9E4E: 00        .byte $00   ; 
- D 0 - I - 0x011E5F 04:9E4F: 00        .byte $00   ; 
- D 0 - I - 0x011E60 04:9E50: 00        .byte $00   ; 
- - - - - - 0x011E61 04:9E51: 00        .byte $00   ; 
- - - - - - 0x011E62 04:9E52: 00        .byte $00   ; 
- - - - - - 0x011E63 04:9E53: 00        .byte $00   ; 
- - - - - - 0x011E64 04:9E54: 00        .byte $00   ; 
- - - - - - 0x011E65 04:9E55: 00        .byte $00   ; 
- D 0 - I - 0x011E66 04:9E56: 00        .byte $00   ; 
- D 0 - I - 0x011E67 04:9E57: 00        .byte $00   ; 
- D 0 - I - 0x011E68 04:9E58: 00        .byte $00   ; 
- D 0 - I - 0x011E69 04:9E59: 00        .byte $00   ; 
- D 0 - I - 0x011E6A 04:9E5A: 00        .byte $00   ; 
- D 0 - I - 0x011E6B 04:9E5B: 00        .byte $00   ; 
- - - - - - 0x011E6C 04:9E5C: 00        .byte $00   ; 
- - - - - - 0x011E6D 04:9E5D: 00        .byte $00   ; 
- D 0 - I - 0x011E6E 04:9E5E: 00        .byte $00   ; 
- D 0 - I - 0x011E6F 04:9E5F: 00        .byte $00   ; 
- D 0 - I - 0x011E70 04:9E60: 00        .byte $00   ; 
- D 0 - I - 0x011E71 04:9E61: 00        .byte $00   ; 
- D 0 - I - 0x011E72 04:9E62: 00        .byte $00   ; 
- D 0 - I - 0x011E73 04:9E63: 00        .byte $00   ; 
- - - - - - 0x011E74 04:9E64: 00        .byte $00   ; 
- - - - - - 0x011E75 04:9E65: 00        .byte $00   ; 
- D 0 - I - 0x011E76 04:9E66: 00        .byte $00   ; 
- D 0 - I - 0x011E77 04:9E67: 00        .byte $00   ; 
- D 0 - I - 0x011E78 04:9E68: 00        .byte $00   ; 
- D 0 - I - 0x011E79 04:9E69: 00        .byte $00   ; 
- D 0 - I - 0x011E7A 04:9E6A: 00        .byte $00   ; 
- D 0 - I - 0x011E7B 04:9E6B: 00        .byte $00   ; 
- D 0 - I - 0x011E7C 04:9E6C: 00        .byte $00   ; 
- D 0 - I - 0x011E7D 04:9E6D: 00        .byte $00   ; 
- D 0 - I - 0x011E7E 04:9E6E: 00        .byte $00   ; 
- D 0 - I - 0x011E7F 04:9E6F: 00        .byte $00   ; 
- D 0 - I - 0x011E80 04:9E70: 00        .byte $00   ; 
- D 0 - I - 0x011E81 04:9E71: 00        .byte $00   ; 
- D 0 - I - 0x011E82 04:9E72: 00        .byte $00   ; 
- D 0 - I - 0x011E83 04:9E73: 00        .byte $00   ; 
- D 0 - I - 0x011E84 04:9E74: 00        .byte $00   ; 
- D 0 - I - 0x011E85 04:9E75: 00        .byte $00   ; 
- D 0 - I - 0x011E86 04:9E76: 00        .byte $00   ; 
- D 0 - I - 0x011E87 04:9E77: 00        .byte $00   ; 
- D 0 - I - 0x011E88 04:9E78: 00        .byte $00   ; 
- D 0 - I - 0x011E89 04:9E79: 00        .byte $00   ; 
- D 0 - I - 0x011E8A 04:9E7A: 00        .byte $00   ; 
- D 0 - I - 0x011E8B 04:9E7B: 00        .byte $00   ; 
- D 0 - I - 0x011E8C 04:9E7C: 00        .byte $00   ; 
- D 0 - I - 0x011E8D 04:9E7D: 00        .byte $00   ; 
- D 0 - I - 0x011E8E 04:9E7E: 00        .byte $00   ; 
- D 0 - I - 0x011E8F 04:9E7F: 00        .byte $00   ; 
- D 0 - I - 0x011E90 04:9E80: 00        .byte $00   ; 
- D 0 - I - 0x011E91 04:9E81: 00        .byte $00   ; 
- D 0 - I - 0x011E92 04:9E82: 00        .byte $00   ; 
- D 0 - I - 0x011E93 04:9E83: 00        .byte $00   ; 
- D 0 - I - 0x011E94 04:9E84: 00        .byte $00   ; 
- D 0 - I - 0x011E95 04:9E85: 00        .byte $00   ; 



_off018_04_9E86_01:
- D 0 - I - 0x011E96 04:9E86: 32        .byte $32   ; 
- D 0 - I - 0x011E97 04:9E87: 39        .byte $39   ; 
- D 0 - I - 0x011E98 04:9E88: 3A        .byte $3A   ; 
- D 0 - I - 0x011E99 04:9E89: 3F        .byte $3F   ; 
- D 0 - I - 0x011E9A 04:9E8A: 40        .byte $40   ; 
- D 0 - I - 0x011E9B 04:9E8B: 41        .byte $41   ; 
- D 0 - I - 0x011E9C 04:9E8C: 3C        .byte $3C   ; 
- D 0 - I - 0x011E9D 04:9E8D: 0E        .byte $0E   ; 
- D 0 - I - 0x011E9E 04:9E8E: 33        .byte $33   ; 
- D 0 - I - 0x011E9F 04:9E8F: 31        .byte $31   ; 
- D 0 - I - 0x011EA0 04:9E90: 32        .byte $32   ; 
- D 0 - I - 0x011EA1 04:9E91: 39        .byte $39   ; 
- D 0 - I - 0x011EA2 04:9E92: 3A        .byte $3A   ; 
- D 0 - I - 0x011EA3 04:9E93: 3B        .byte $3B   ; 
- D 0 - I - 0x011EA4 04:9E94: 5B        .byte $5B   ; 
- D 0 - I - 0x011EA5 04:9E95: 1C        .byte $1C   ; 
- D 0 - I - 0x011EA6 04:9E96: 26        .byte $26   ; 
- D 0 - I - 0x011EA7 04:9E97: 25        .byte $25   ; 
- D 0 - I - 0x011EA8 04:9E98: 25        .byte $25   ; 
- D 0 - I - 0x011EA9 04:9E99: 26        .byte $26   ; 
- D 0 - I - 0x011EAA 04:9E9A: 26        .byte $26   ; 
- D 0 - I - 0x011EAB 04:9E9B: 29        .byte $29   ; 
- D 0 - I - 0x011EAC 04:9E9C: 34        .byte $34   ; 
- D 0 - I - 0x011EAD 04:9E9D: 35        .byte $35   ; 
- D 0 - I - 0x011EAE 04:9E9E: 57        .byte $57   ; 
- D 0 - I - 0x011EAF 04:9E9F: 54        .byte $54   ; 
- D 0 - I - 0x011EB0 04:9EA0: 55        .byte $55   ; 
- D 0 - I - 0x011EB1 04:9EA1: 56        .byte $56   ; 
- D 0 - I - 0x011EB2 04:9EA2: 34        .byte $34   ; 
- D 0 - I - 0x011EB3 04:9EA3: 35        .byte $35   ; 
- D 0 - I - 0x011EB4 04:9EA4: 38        .byte $38   ; 
- D 0 - I - 0x011EB5 04:9EA5: 32        .byte $32   ; 
- D 0 - I - 0x011EB6 04:9EA6: 58        .byte $58   ; 
- D 0 - I - 0x011EB7 04:9EA7: 59        .byte $59   ; 
- D 0 - I - 0x011EB8 04:9EA8: 34        .byte $34   ; 
- D 0 - I - 0x011EB9 04:9EA9: 35        .byte $35   ; 
- D 0 - I - 0x011EBA 04:9EAA: 38        .byte $38   ; 
- D 0 - I - 0x011EBB 04:9EAB: 31        .byte $31   ; 
- D 0 - I - 0x011EBC 04:9EAC: 32        .byte $32   ; 
- D 0 - I - 0x011EBD 04:9EAD: 33        .byte $33   ; 
- D 0 - I - 0x011EBE 04:9EAE: 00        .byte $00   ; 
- D 0 - I - 0x011EBF 04:9EAF: 00        .byte $00   ; 
- D 0 - I - 0x011EC0 04:9EB0: 28        .byte $28   ; 
- D 0 - I - 0x011EC1 04:9EB1: 25        .byte $25   ; 
- D 0 - I - 0x011EC2 04:9EB2: 26        .byte $26   ; 
- D 0 - I - 0x011EC3 04:9EB3: 25        .byte $25   ; 
- D 0 - I - 0x011EC4 04:9EB4: 26        .byte $26   ; 
- D 0 - I - 0x011EC5 04:9EB5: 25        .byte $25   ; 
- D 0 - I - 0x011EC6 04:9EB6: 42        .byte $42   ; 
- D 0 - I - 0x011EC7 04:9EB7: 43        .byte $43   ; 
- D 0 - I - 0x011EC8 04:9EB8: 42        .byte $42   ; 
- D 0 - I - 0x011EC9 04:9EB9: 43        .byte $43   ; 
- D 0 - I - 0x011ECA 04:9EBA: 42        .byte $42   ; 
- D 0 - I - 0x011ECB 04:9EBB: 43        .byte $43   ; 
- D 0 - I - 0x011ECC 04:9EBC: 42        .byte $42   ; 
- D 0 - I - 0x011ECD 04:9EBD: 43        .byte $43   ; 
- D 0 - I - 0x011ECE 04:9EBE: 46        .byte $46   ; 
- D 0 - I - 0x011ECF 04:9EBF: 47        .byte $47   ; 
- D 0 - I - 0x011ED0 04:9EC0: 46        .byte $46   ; 
- D 0 - I - 0x011ED1 04:9EC1: 47        .byte $47   ; 
- D 0 - I - 0x011ED2 04:9EC2: 46        .byte $46   ; 
- D 0 - I - 0x011ED3 04:9EC3: 47        .byte $47   ; 
- D 0 - I - 0x011ED4 04:9EC4: 46        .byte $46   ; 
- D 0 - I - 0x011ED5 04:9EC5: 47        .byte $47   ; 



_off018_04_9EC6_02:
- D 0 - I - 0x011ED6 04:9EC6: 25        .byte $25   ; 
- D 0 - I - 0x011ED7 04:9EC7: 26        .byte $26   ; 
- D 0 - I - 0x011ED8 04:9EC8: 27        .byte $27   ; 
- D 0 - I - 0x011ED9 04:9EC9: 18        .byte $18   ; 
- D 0 - I - 0x011EDA 04:9ECA: 1B        .byte $1B   ; 
- D 0 - I - 0x011EDB 04:9ECB: 00        .byte $00   ; 
- D 0 - I - 0x011EDC 04:9ECC: 3C        .byte $3C   ; 
- D 0 - I - 0x011EDD 04:9ECD: 0E        .byte $0E   ; 
- D 0 - I - 0x011EDE 04:9ECE: 1A        .byte $1A   ; 
- D 0 - I - 0x011EDF 04:9ECF: 1B        .byte $1B   ; 
- D 0 - I - 0x011EE0 04:9ED0: 00        .byte $00   ; 
- D 0 - I - 0x011EE1 04:9ED1: 1C        .byte $1C   ; 
- D 0 - I - 0x011EE2 04:9ED2: 1F        .byte $1F   ; 
- D 0 - I - 0x011EE3 04:9ED3: 00        .byte $00   ; 
- D 0 - I - 0x011EE4 04:9ED4: 00        .byte $00   ; 
- D 0 - I - 0x011EE5 04:9ED5: 1C        .byte $1C   ; 
- D 0 - I - 0x011EE6 04:9ED6: 1F        .byte $1F   ; 
- D 0 - I - 0x011EE7 04:9ED7: 1F        .byte $1F   ; 
- D 0 - I - 0x011EE8 04:9ED8: 18        .byte $18   ; 
- D 0 - I - 0x011EE9 04:9ED9: 1A        .byte $1A   ; 
- D 0 - I - 0x011EEA 04:9EDA: 19        .byte $19   ; 
- D 0 - I - 0x011EEB 04:9EDB: 1B        .byte $1B   ; 
- D 0 - I - 0x011EEC 04:9EDC: 5A        .byte $5A   ; 
- D 0 - I - 0x011EED 04:9EDD: 34        .byte $34   ; 
- D 0 - I - 0x011EEE 04:9EDE: 58        .byte $58   ; 
- D 0 - I - 0x011EEF 04:9EDF: 59        .byte $59   ; 
- D 0 - I - 0x011EF0 04:9EE0: 1C        .byte $1C   ; 
- D 0 - I - 0x011EF1 04:9EE1: 1F        .byte $1F   ; 
- D 0 - I - 0x011EF2 04:9EE2: 1F        .byte $1F   ; 
- D 0 - I - 0x011EF3 04:9EE3: 1E        .byte $1E   ; 
- D 0 - I - 0x011EF4 04:9EE4: 35        .byte $35   ; 
- D 0 - I - 0x011EF5 04:9EE5: 38        .byte $38   ; 
- D 0 - I - 0x011EF6 04:9EE6: 19        .byte $19   ; 
- D 0 - I - 0x011EF7 04:9EE7: 1B        .byte $1B   ; 
- D 0 - I - 0x011EF8 04:9EE8: 5B        .byte $5B   ; 
- D 0 - I - 0x011EF9 04:9EE9: 22        .byte $22   ; 
- D 0 - I - 0x011EFA 04:9EEA: 00        .byte $00   ; 
- D 0 - I - 0x011EFB 04:9EEB: 13        .byte $13   ; 
- D 0 - I - 0x011EFC 04:9EEC: 0E        .byte $0E   ; 
- D 0 - I - 0x011EFD 04:9EED: 30        .byte $30   ; 
- D 0 - I - 0x011EFE 04:9EEE: 1F        .byte $1F   ; 
- D 0 - I - 0x011EFF 04:9EEF: 1E        .byte $1E   ; 
- D 0 - I - 0x011F00 04:9EF0: 35        .byte $35   ; 
- D 0 - I - 0x011F01 04:9EF1: 2B        .byte $2B   ; 
- D 0 - I - 0x011F02 04:9EF2: 58        .byte $58   ; 
- D 0 - I - 0x011F03 04:9EF3: 24        .byte $24   ; 
- D 0 - I - 0x011F04 04:9EF4: 25        .byte $25   ; 
- D 0 - I - 0x011F05 04:9EF5: 25        .byte $25   ; 
- D 0 - I - 0x011F06 04:9EF6: 3B        .byte $3B   ; 
- D 0 - I - 0x011F07 04:9EF7: 28        .byte $28   ; 
- D 0 - I - 0x011F08 04:9EF8: 25        .byte $25   ; 
- D 0 - I - 0x011F09 04:9EF9: 27        .byte $27   ; 
- D 0 - I - 0x011F0A 04:9EFA: 00        .byte $00   ; 
- D 0 - I - 0x011F0B 04:9EFB: 00        .byte $00   ; 
- D 0 - I - 0x011F0C 04:9EFC: 54        .byte $54   ; 
- D 0 - I - 0x011F0D 04:9EFD: 55        .byte $55   ; 
- D 0 - I - 0x011F0E 04:9EFE: 39        .byte $39   ; 
- D 0 - I - 0x011F0F 04:9EFF: 3A        .byte $3A   ; 
- D 0 - I - 0x011F10 04:9F00: 00        .byte $00   ; 
- D 0 - I - 0x011F11 04:9F01: 18        .byte $18   ; 
- D 0 - I - 0x011F12 04:9F02: 19        .byte $19   ; 
- D 0 - I - 0x011F13 04:9F03: 1A        .byte $1A   ; 
- D 0 - I - 0x011F14 04:9F04: 19        .byte $19   ; 
- D 0 - I - 0x011F15 04:9F05: 1A        .byte $1A   ; 



_off018_04_9F06_03:
- D 0 - I - 0x011F16 04:9F06: 58        .byte $58   ; 
- D 0 - I - 0x011F17 04:9F07: 59        .byte $59   ; 
- D 0 - I - 0x011F18 04:9F08: 34        .byte $34   ; 
- D 0 - I - 0x011F19 04:9F09: 35        .byte $35   ; 
- D 0 - I - 0x011F1A 04:9F0A: 38        .byte $38   ; 
- D 0 - I - 0x011F1B 04:9F0B: 0E        .byte $0E   ; 
- D 0 - I - 0x011F1C 04:9F0C: 32        .byte $32   ; 
- D 0 - I - 0x011F1D 04:9F0D: 33        .byte $33   ; 
- D 0 - I - 0x011F1E 04:9F0E: 00        .byte $00   ; 
- D 0 - I - 0x011F1F 04:9F0F: 17        .byte $17   ; 
- D 0 - I - 0x011F20 04:9F10: 2C        .byte $2C   ; 
- D 0 - I - 0x011F21 04:9F11: 3D        .byte $3D   ; 
- D 0 - I - 0x011F22 04:9F12: 26        .byte $26   ; 
- D 0 - I - 0x011F23 04:9F13: 26        .byte $26   ; 
- D 0 - I - 0x011F24 04:9F14: 25        .byte $25   ; 
- D 0 - I - 0x011F25 04:9F15: 26        .byte $26   ; 
- D 0 - I - 0x011F26 04:9F16: 3A        .byte $3A   ; 
- D 0 - I - 0x011F27 04:9F17: 3B        .byte $3B   ; 
- D 0 - I - 0x011F28 04:9F18: 00        .byte $00   ; 
- D 0 - I - 0x011F29 04:9F19: 00        .byte $00   ; 
- D 0 - I - 0x011F2A 04:9F1A: 00        .byte $00   ; 
- D 0 - I - 0x011F2B 04:9F1B: 00        .byte $00   ; 
- D 0 - I - 0x011F2C 04:9F1C: 54        .byte $54   ; 
- D 0 - I - 0x011F2D 04:9F1D: 55        .byte $55   ; 
- D 0 - I - 0x011F2E 04:9F1E: 3D        .byte $3D   ; 
- D 0 - I - 0x011F2F 04:9F1F: 2D        .byte $2D   ; 
- D 0 - I - 0x011F30 04:9F20: 16        .byte $16   ; 
- D 0 - I - 0x011F31 04:9F21: 00        .byte $00   ; 
- D 0 - I - 0x011F32 04:9F22: 58        .byte $58   ; 
- D 0 - I - 0x011F33 04:9F23: 18        .byte $18   ; 
- D 0 - I - 0x011F34 04:9F24: 19        .byte $19   ; 
- D 0 - I - 0x011F35 04:9F25: 1A        .byte $1A   ; 
- D 0 - I - 0x011F36 04:9F26: 00        .byte $00   ; 
- D 0 - I - 0x011F37 04:9F27: 58        .byte $58   ; 
- D 0 - I - 0x011F38 04:9F28: 59        .byte $59   ; 
- D 0 - I - 0x011F39 04:9F29: 00        .byte $00   ; 
- D 0 - I - 0x011F3A 04:9F2A: 14        .byte $14   ; 
- D 0 - I - 0x011F3B 04:9F2B: 1D        .byte $1D   ; 
- D 0 - I - 0x011F3C 04:9F2C: 1F        .byte $1F   ; 
- D 0 - I - 0x011F3D 04:9F2D: 1F        .byte $1F   ; 
- D 0 - I - 0x011F3E 04:9F2E: 3A        .byte $3A   ; 
- D 0 - I - 0x011F3F 04:9F2F: 9A        .byte $9A   ; 
- D 0 - I - 0x011F40 04:9F30: 9B        .byte $9B   ; 
- D 0 - I - 0x011F41 04:9F31: 58        .byte $58   ; 
- D 0 - I - 0x011F42 04:9F32: 3C        .byte $3C   ; 
- D 0 - I - 0x011F43 04:9F33: 2D        .byte $2D   ; 
- D 0 - I - 0x011F44 04:9F34: 16        .byte $16   ; 
- D 0 - I - 0x011F45 04:9F35: 5B        .byte $5B   ; 
- D 0 - I - 0x011F46 04:9F36: 0E        .byte $0E   ; 
- D 0 - I - 0x011F47 04:9F37: 39        .byte $39   ; 
- D 0 - I - 0x011F48 04:9F38: 3A        .byte $3A   ; 
- D 0 - I - 0x011F49 04:9F39: 54        .byte $54   ; 
- D 0 - I - 0x011F4A 04:9F3A: 55        .byte $55   ; 
- D 0 - I - 0x011F4B 04:9F3B: 56        .byte $56   ; 
- D 0 - I - 0x011F4C 04:9F3C: 34        .byte $34   ; 
- D 0 - I - 0x011F4D 04:9F3D: 35        .byte $35   ; 
- D 0 - I - 0x011F4E 04:9F3E: 25        .byte $25   ; 
- D 0 - I - 0x011F4F 04:9F3F: 26        .byte $26   ; 
- D 0 - I - 0x011F50 04:9F40: 27        .byte $27   ; 
- D 0 - I - 0x011F51 04:9F41: 00        .byte $00   ; 
- D 0 - I - 0x011F52 04:9F42: 00        .byte $00   ; 
- D 0 - I - 0x011F53 04:9F43: 00        .byte $00   ; 
- D 0 - I - 0x011F54 04:9F44: 13        .byte $13   ; 
- D 0 - I - 0x011F55 04:9F45: 32        .byte $32   ; 



_off018_04_9F46_04:
- D 0 - I - 0x011F56 04:9F46: 58        .byte $58   ; 
- D 0 - I - 0x011F57 04:9F47: 59        .byte $59   ; 
- D 0 - I - 0x011F58 04:9F48: 14        .byte $14   ; 
- D 0 - I - 0x011F59 04:9F49: 3B        .byte $3B   ; 
- D 0 - I - 0x011F5A 04:9F4A: 00        .byte $00   ; 
- D 0 - I - 0x011F5B 04:9F4B: 00        .byte $00   ; 
- D 0 - I - 0x011F5C 04:9F4C: 00        .byte $00   ; 
- D 0 - I - 0x011F5D 04:9F4D: 00        .byte $00   ; 
- D 0 - I - 0x011F5E 04:9F4E: 00        .byte $00   ; 
- D 0 - I - 0x011F5F 04:9F4F: 58        .byte $58   ; 
- D 0 - I - 0x011F60 04:9F50: 20        .byte $20   ; 
- D 0 - I - 0x011F61 04:9F51: 39        .byte $39   ; 
- D 0 - I - 0x011F62 04:9F52: 3A        .byte $3A   ; 
- D 0 - I - 0x011F63 04:9F53: 54        .byte $54   ; 
- D 0 - I - 0x011F64 04:9F54: 55        .byte $55   ; 
- D 0 - I - 0x011F65 04:9F55: 56        .byte $56   ; 
- D 0 - I - 0x011F66 04:9F56: 00        .byte $00   ; 
- D 0 - I - 0x011F67 04:9F57: 00        .byte $00   ; 
- D 0 - I - 0x011F68 04:9F58: 3C        .byte $3C   ; 
- D 0 - I - 0x011F69 04:9F59: 3E        .byte $3E   ; 
- D 0 - I - 0x011F6A 04:9F5A: 27        .byte $27   ; 
- D 0 - I - 0x011F6B 04:9F5B: 22        .byte $22   ; 
- D 0 - I - 0x011F6C 04:9F5C: 00        .byte $00   ; 
- D 0 - I - 0x011F6D 04:9F5D: 5A        .byte $5A   ; 
- D 0 - I - 0x011F6E 04:9F5E: 58        .byte $58   ; 
- D 0 - I - 0x011F6F 04:9F5F: 59        .byte $59   ; 
- D 0 - I - 0x011F70 04:9F60: 21        .byte $21   ; 
- D 0 - I - 0x011F71 04:9F61: 57        .byte $57   ; 
- D 0 - I - 0x011F72 04:9F62: 17        .byte $17   ; 
- D 0 - I - 0x011F73 04:9F63: 2F        .byte $2F   ; 
- D 0 - I - 0x011F74 04:9F64: 58        .byte $58   ; 
- D 0 - I - 0x011F75 04:9F65: 59        .byte $59   ; 
- D 0 - I - 0x011F76 04:9F66: 00        .byte $00   ; 
- D 0 - I - 0x011F77 04:9F67: 00        .byte $00   ; 
- D 0 - I - 0x011F78 04:9F68: 2A        .byte $2A   ; 
- D 0 - I - 0x011F79 04:9F69: 3A        .byte $3A   ; 
- D 0 - I - 0x011F7A 04:9F6A: 3B        .byte $3B   ; 
- D 0 - I - 0x011F7B 04:9F6B: 00        .byte $00   ; 
- D 0 - I - 0x011F7C 04:9F6C: 00        .byte $00   ; 
- D 0 - I - 0x011F7D 04:9F6D: 5B        .byte $5B   ; 
- D 0 - I - 0x011F7E 04:9F6E: 54        .byte $54   ; 
- D 0 - I - 0x011F7F 04:9F6F: 55        .byte $55   ; 
- D 0 - I - 0x011F80 04:9F70: 3C        .byte $3C   ; 
- D 0 - I - 0x011F81 04:9F71: 0E        .byte $0E   ; 
- D 0 - I - 0x011F82 04:9F72: 39        .byte $39   ; 
- D 0 - I - 0x011F83 04:9F73: 16        .byte $16   ; 
- D 0 - I - 0x011F84 04:9F74: 59        .byte $59   ; 
- D 0 - I - 0x011F85 04:9F75: 34        .byte $34   ; 
- D 0 - I - 0x011F86 04:9F76: 00        .byte $00   ; 
- D 0 - I - 0x011F87 04:9F77: 58        .byte $58   ; 
- D 0 - I - 0x011F88 04:9F78: 59        .byte $59   ; 
- D 0 - I - 0x011F89 04:9F79: 1F        .byte $1F   ; 
- D 0 - I - 0x011F8A 04:9F7A: 1F        .byte $1F   ; 
- D 0 - I - 0x011F8B 04:9F7B: 1E        .byte $1E   ; 
- D 0 - I - 0x011F8C 04:9F7C: 35        .byte $35   ; 
- D 0 - I - 0x011F8D 04:9F7D: 38        .byte $38   ; 
- D 0 - I - 0x011F8E 04:9F7E: 00        .byte $00   ; 
- D 0 - I - 0x011F8F 04:9F7F: 00        .byte $00   ; 
- D 0 - I - 0x011F90 04:9F80: 00        .byte $00   ; 
- D 0 - I - 0x011F91 04:9F81: 00        .byte $00   ; 
- D 0 - I - 0x011F92 04:9F82: 35        .byte $35   ; 
- D 0 - I - 0x011F93 04:9F83: 38        .byte $38   ; 
- D 0 - I - 0x011F94 04:9F84: 31        .byte $31   ; 
- D 0 - I - 0x011F95 04:9F85: 33        .byte $33   ; 



_off018_04_9F86_05:
- D 0 - I - 0x011F96 04:9F86: 00        .byte $00   ; 
- D 0 - I - 0x011F97 04:9F87: 00        .byte $00   ; 
- D 0 - I - 0x011F98 04:9F88: 28        .byte $28   ; 
- D 0 - I - 0x011F99 04:9F89: 25        .byte $25   ; 
- D 0 - I - 0x011F9A 04:9F8A: 26        .byte $26   ; 
- D 0 - I - 0x011F9B 04:9F8B: 25        .byte $25   ; 
- D 0 - I - 0x011F9C 04:9F8C: 27        .byte $27   ; 
- D 0 - I - 0x011F9D 04:9F8D: 00        .byte $00   ; 
- D 0 - I - 0x011F9E 04:9F8E: 58        .byte $58   ; 
- D 0 - I - 0x011F9F 04:9F8F: 14        .byte $14   ; 
- D 0 - I - 0x011FA0 04:9F90: 3B        .byte $3B   ; 
- D 0 - I - 0x011FA1 04:9F91: 00        .byte $00   ; 
- D 0 - I - 0x011FA2 04:9F92: 00        .byte $00   ; 
- D 0 - I - 0x011FA3 04:9F93: 00        .byte $00   ; 
- D 0 - I - 0x011FA4 04:9F94: 00        .byte $00   ; 
- D 0 - I - 0x011FA5 04:9F95: 00        .byte $00   ; 
- D 0 - I - 0x011FA6 04:9F96: 00        .byte $00   ; 
- D 0 - I - 0x011FA7 04:9F97: 24        .byte $24   ; 
- D 0 - I - 0x011FA8 04:9F98: 29        .byte $29   ; 
- D 0 - I - 0x011FA9 04:9F99: 00        .byte $00   ; 
- D 0 - I - 0x011FAA 04:9F9A: 00        .byte $00   ; 
- D 0 - I - 0x011FAB 04:9F9B: 21        .byte $21   ; 
- D 0 - I - 0x011FAC 04:9F9C: 54        .byte $54   ; 
- D 0 - I - 0x011FAD 04:9F9D: 55        .byte $55   ; 
- D 0 - I - 0x011FAE 04:9F9E: 00        .byte $00   ; 
- D 0 - I - 0x011FAF 04:9F9F: 00        .byte $00   ; 
- D 0 - I - 0x011FB0 04:9FA0: 34        .byte $34   ; 
- D 0 - I - 0x011FB1 04:9FA1: 15        .byte $15   ; 
- D 0 - I - 0x011FB2 04:9FA2: 58        .byte $58   ; 
- D 0 - I - 0x011FB3 04:9FA3: 2E        .byte $2E   ; 
- D 0 - I - 0x011FB4 04:9FA4: 16        .byte $16   ; 
- D 0 - I - 0x011FB5 04:9FA5: 59        .byte $59   ; 
- D 0 - I - 0x011FB6 04:9FA6: 58        .byte $58   ; 
- D 0 - I - 0x011FB7 04:9FA7: 59        .byte $59   ; 
- D 0 - I - 0x011FB8 04:9FA8: 28        .byte $28   ; 
- D 0 - I - 0x011FB9 04:9FA9: 27        .byte $27   ; 
- D 0 - I - 0x011FBA 04:9FAA: 00        .byte $00   ; 
- D 0 - I - 0x011FBB 04:9FAB: 5B        .byte $5B   ; 
- D 0 - I - 0x011FBC 04:9FAC: 34        .byte $34   ; 
- D 0 - I - 0x011FBD 04:9FAD: 35        .byte $35   ; 
- D 0 - I - 0x011FBE 04:9FAE: 55        .byte $55   ; 
- D 0 - I - 0x011FBF 04:9FAF: 56        .byte $56   ; 
- D 0 - I - 0x011FC0 04:9FB0: 5B        .byte $5B   ; 
- D 0 - I - 0x011FC1 04:9FB1: 00        .byte $00   ; 
- D 0 - I - 0x011FC2 04:9FB2: 22        .byte $22   ; 
- D 0 - I - 0x011FC3 04:9FB3: 00        .byte $00   ; 
- D 0 - I - 0x011FC4 04:9FB4: 13        .byte $13   ; 
- D 0 - I - 0x011FC5 04:9FB5: 37        .byte $37   ; 
- D 0 - I - 0x011FC6 04:9FB6: 00        .byte $00   ; 
- D 0 - I - 0x011FC7 04:9FB7: 00        .byte $00   ; 
- D 0 - I - 0x011FC8 04:9FB8: 57        .byte $57   ; 
- D 0 - I - 0x011FC9 04:9FB9: 17        .byte $17   ; 
- D 0 - I - 0x011FCA 04:9FBA: 2F        .byte $2F   ; 
- D 0 - I - 0x011FCB 04:9FBB: 59        .byte $59   ; 
- D 0 - I - 0x011FCC 04:9FBC: 24        .byte $24   ; 
- D 0 - I - 0x011FCD 04:9FBD: 25        .byte $25   ; 
- D 0 - I - 0x011FCE 04:9FBE: 00        .byte $00   ; 
- D 0 - I - 0x011FCF 04:9FBF: 00        .byte $00   ; 
- D 0 - I - 0x011FD0 04:9FC0: 00        .byte $00   ; 
- D 0 - I - 0x011FD1 04:9FC1: 00        .byte $00   ; 
- D 0 - I - 0x011FD2 04:9FC2: 00        .byte $00   ; 
- D 0 - I - 0x011FD3 04:9FC3: 00        .byte $00   ; 
- D 0 - I - 0x011FD4 04:9FC4: 00        .byte $00   ; 
- D 0 - I - 0x011FD5 04:9FC5: 00        .byte $00   ; 



_off018_04_9FC6_06:
- D 0 - I - 0x011FD6 04:9FC6: 00        .byte $00   ; 
- D 0 - I - 0x011FD7 04:9FC7: 34        .byte $34   ; 
- D 0 - I - 0x011FD8 04:9FC8: 15        .byte $15   ; 
- D 0 - I - 0x011FD9 04:9FC9: 00        .byte $00   ; 
- D 0 - I - 0x011FDA 04:9FCA: 24        .byte $24   ; 
- D 0 - I - 0x011FDB 04:9FCB: 25        .byte $25   ; 
- D 0 - I - 0x011FDC 04:9FCC: 26        .byte $26   ; 
- D 0 - I - 0x011FDD 04:9FCD: 27        .byte $27   ; 
- D 0 - I - 0x011FDE 04:9FCE: 00        .byte $00   ; 
- D 0 - I - 0x011FDF 04:9FCF: 28        .byte $28   ; 
- D 0 - I - 0x011FE0 04:9FD0: 27        .byte $27   ; 
- D 0 - I - 0x011FE1 04:9FD1: 58        .byte $58   ; 
- D 0 - I - 0x011FE2 04:9FD2: 59        .byte $59   ; 
- D 0 - I - 0x011FE3 04:9FD3: 00        .byte $00   ; 
- D 0 - I - 0x011FE4 04:9FD4: 58        .byte $58   ; 
- D 0 - I - 0x011FE5 04:9FD5: 59        .byte $59   ; 
- D 0 - I - 0x011FE6 04:9FD6: 14        .byte $14   ; 
- D 0 - I - 0x011FE7 04:9FD7: 3B        .byte $3B   ; 
- D 0 - I - 0x011FE8 04:9FD8: 00        .byte $00   ; 
- D 0 - I - 0x011FE9 04:9FD9: 00        .byte $00   ; 
- D 0 - I - 0x011FEA 04:9FDA: 00        .byte $00   ; 
- D 0 - I - 0x011FEB 04:9FDB: 00        .byte $00   ; 
- D 0 - I - 0x011FEC 04:9FDC: 00        .byte $00   ; 
- D 0 - I - 0x011FED 04:9FDD: 00        .byte $00   ; 
- D 0 - I - 0x011FEE 04:9FDE: 20        .byte $20   ; 
- D 0 - I - 0x011FEF 04:9FDF: 39        .byte $39   ; 
- D 0 - I - 0x011FF0 04:9FE0: 3A        .byte $3A   ; 
- D 0 - I - 0x011FF1 04:9FE1: 00        .byte $00   ; 
- D 0 - I - 0x011FF2 04:9FE2: 21        .byte $21   ; 
- D 0 - I - 0x011FF3 04:9FE3: 00        .byte $00   ; 
- D 0 - I - 0x011FF4 04:9FE4: 58        .byte $58   ; 
- D 0 - I - 0x011FF5 04:9FE5: 59        .byte $59   ; 
- D 0 - I - 0x011FF6 04:9FE6: 1C        .byte $1C   ; 
- D 0 - I - 0x011FF7 04:9FE7: 1C        .byte $1C   ; 
- D 0 - I - 0x011FF8 04:9FE8: 1F        .byte $1F   ; 
- D 0 - I - 0x011FF9 04:9FE9: 57        .byte $57   ; 
- D 0 - I - 0x011FFA 04:9FEA: 2E        .byte $2E   ; 
- D 0 - I - 0x011FFB 04:9FEB: 16        .byte $16   ; 
- D 0 - I - 0x011FFC 04:9FEC: 00        .byte $00   ; 
- D 0 - I - 0x011FFD 04:9FED: 00        .byte $00   ; 
- D 0 - I - 0x011FFE 04:9FEE: 00        .byte $00   ; 
- D 0 - I - 0x011FFF 04:9FEF: 00        .byte $00   ; 
- D 0 - I - 0x012000 04:9FF0: 00        .byte $00   ; 
- D 0 - I - 0x012001 04:9FF1: 58        .byte $58   ; 
- D 0 - I - 0x012002 04:9FF2: 59        .byte $59   ; 
- D 0 - I - 0x012003 04:9FF3: 34        .byte $34   ; 
- D 0 - I - 0x012004 04:9FF4: 15        .byte $15   ; 
- D 0 - I - 0x012005 04:9FF5: 00        .byte $00   ; 
- D 0 - I - 0x012006 04:9FF6: 54        .byte $54   ; 
- D 0 - I - 0x012007 04:9FF7: 55        .byte $55   ; 
- D 0 - I - 0x012008 04:9FF8: 56        .byte $56   ; 
- D 0 - I - 0x012009 04:9FF9: 34        .byte $34   ; 
- D 0 - I - 0x01200A 04:9FFA: 35        .byte $35   ; 
- D 0 - I - 0x01200B 04:9FFB: 38        .byte $38   ; 
- D 0 - I - 0x01200C 04:9FFC: 23        .byte $23   ; 
- D 0 - I - 0x01200D 04:9FFD: 59        .byte $59   ; 
- D 0 - I - 0x01200E 04:9FFE: 00        .byte $00   ; 
- D 0 - I - 0x01200F 04:9FFF: 00        .byte $00   ; 
- D 1 - I - 0x012010 04:A000: 35        .byte $35   ; 
- D 1 - I - 0x012011 04:A001: 38        .byte $38   ; 
- D 1 - I - 0x012012 04:A002: 30        .byte $30   ; 
- D 1 - I - 0x012013 04:A003: 32        .byte $32   ; 
- D 1 - I - 0x012014 04:A004: 23        .byte $23   ; 
- D 1 - I - 0x012015 04:A005: 00        .byte $00   ; 



_off018_04_A006_07:
- - - - - - 0x012016 04:A006: 00        .byte $00   ; 
- - - - - - 0x012017 04:A007: 00        .byte $00   ; 
- - - - - - 0x012018 04:A008: 00        .byte $00   ; 
- D 1 - I - 0x012019 04:A009: 00        .byte $00   ; 
- D 1 - I - 0x01201A 04:A00A: 00        .byte $00   ; 
- D 1 - I - 0x01201B 04:A00B: 00        .byte $00   ; 
- D 1 - I - 0x01201C 04:A00C: 00        .byte $00   ; 
- D 1 - I - 0x01201D 04:A00D: 00        .byte $00   ; 
- - - - - - 0x01201E 04:A00E: 00        .byte $00   ; 
- D 1 - I - 0x01201F 04:A00F: 00        .byte $00   ; 
- D 1 - I - 0x012020 04:A010: 00        .byte $00   ; 
- D 1 - I - 0x012021 04:A011: 00        .byte $00   ; 
- D 1 - I - 0x012022 04:A012: 00        .byte $00   ; 
- D 1 - I - 0x012023 04:A013: 00        .byte $00   ; 
- D 1 - I - 0x012024 04:A014: 00        .byte $00   ; 
- D 1 - I - 0x012025 04:A015: 00        .byte $00   ; 
- D 1 - I - 0x012026 04:A016: 00        .byte $00   ; 
- D 1 - I - 0x012027 04:A017: 00        .byte $00   ; 
- D 1 - I - 0x012028 04:A018: 00        .byte $00   ; 
- D 1 - I - 0x012029 04:A019: 00        .byte $00   ; 
- D 1 - I - 0x01202A 04:A01A: 5A        .byte $5A   ; 
- D 1 - I - 0x01202B 04:A01B: 5B        .byte $5B   ; 
- D 1 - I - 0x01202C 04:A01C: 57        .byte $57   ; 
- D 1 - I - 0x01202D 04:A01D: 00        .byte $00   ; 
- D 1 - I - 0x01202E 04:A01E: 00        .byte $00   ; 
- D 1 - I - 0x01202F 04:A01F: 57        .byte $57   ; 
- D 1 - I - 0x012030 04:A020: 00        .byte $00   ; 
- D 1 - I - 0x012031 04:A021: 00        .byte $00   ; 
- D 1 - I - 0x012032 04:A022: 00        .byte $00   ; 
- D 1 - I - 0x012033 04:A023: 00        .byte $00   ; 
- D 1 - I - 0x012034 04:A024: 00        .byte $00   ; 
- D 1 - I - 0x012035 04:A025: 00        .byte $00   ; 
- D 1 - I - 0x012036 04:A026: 00        .byte $00   ; 
- D 1 - I - 0x012037 04:A027: 54        .byte $54   ; 
- D 1 - I - 0x012038 04:A028: 55        .byte $55   ; 
- D 1 - I - 0x012039 04:A029: 56        .byte $56   ; 
- D 1 - I - 0x01203A 04:A02A: 00        .byte $00   ; 
- D 1 - I - 0x01203B 04:A02B: 54        .byte $54   ; 
- D 1 - I - 0x01203C 04:A02C: 55        .byte $55   ; 
- D 1 - I - 0x01203D 04:A02D: 56        .byte $56   ; 
- D 1 - I - 0x01203E 04:A02E: 00        .byte $00   ; 
- D 1 - I - 0x01203F 04:A02F: 00        .byte $00   ; 
- D 1 - I - 0x012040 04:A030: 00        .byte $00   ; 
- D 1 - I - 0x012041 04:A031: 5A        .byte $5A   ; 
- D 1 - I - 0x012042 04:A032: 00        .byte $00   ; 
- D 1 - I - 0x012043 04:A033: 00        .byte $00   ; 
- D 1 - I - 0x012044 04:A034: 34        .byte $34   ; 
- D 1 - I - 0x012045 04:A035: 15        .byte $15   ; 
- D 1 - I - 0x012046 04:A036: 58        .byte $58   ; 
- D 1 - I - 0x012047 04:A037: 59        .byte $59   ; 
- D 1 - I - 0x012048 04:A038: 00        .byte $00   ; 
- D 1 - I - 0x012049 04:A039: 00        .byte $00   ; 
- D 1 - I - 0x01204A 04:A03A: 34        .byte $34   ; 
- D 1 - I - 0x01204B 04:A03B: 35        .byte $35   ; 
- D 1 - I - 0x01204C 04:A03C: 38        .byte $38   ; 
- D 1 - I - 0x01204D 04:A03D: 23        .byte $23   ; 
- D 1 - I - 0x01204E 04:A03E: 00        .byte $00   ; 
- D 1 - I - 0x01204F 04:A03F: 00        .byte $00   ; 
- D 1 - I - 0x012050 04:A040: 00        .byte $00   ; 
- D 1 - I - 0x012051 04:A041: 00        .byte $00   ; 
- D 1 - I - 0x012052 04:A042: 38        .byte $38   ; 
- D 1 - I - 0x012053 04:A043: 30        .byte $30   ; 
- D 1 - I - 0x012054 04:A044: 32        .byte $32   ; 
- D 1 - I - 0x012055 04:A045: 23        .byte $23   ; 



_off018_04_A046_08:
- D 1 - I - 0x012056 04:A046: 00        .byte $00   ; 
- D 1 - I - 0x012057 04:A047: 00        .byte $00   ; 
- D 1 - I - 0x012058 04:A048: 00        .byte $00   ; 
- D 1 - I - 0x012059 04:A049: 00        .byte $00   ; 
- D 1 - I - 0x01205A 04:A04A: 00        .byte $00   ; 
- D 1 - I - 0x01205B 04:A04B: 00        .byte $00   ; 
- D 1 - I - 0x01205C 04:A04C: 00        .byte $00   ; 
- D 1 - I - 0x01205D 04:A04D: 00        .byte $00   ; 
- D 1 - I - 0x01205E 04:A04E: 00        .byte $00   ; 
- D 1 - I - 0x01205F 04:A04F: 00        .byte $00   ; 
- D 1 - I - 0x012060 04:A050: 00        .byte $00   ; 
- D 1 - I - 0x012061 04:A051: 00        .byte $00   ; 
- D 1 - I - 0x012062 04:A052: 00        .byte $00   ; 
- D 1 - I - 0x012063 04:A053: 00        .byte $00   ; 
- D 1 - I - 0x012064 04:A054: 00        .byte $00   ; 
- D 1 - I - 0x012065 04:A055: 00        .byte $00   ; 
- D 1 - I - 0x012066 04:A056: 00        .byte $00   ; 
- D 1 - I - 0x012067 04:A057: 00        .byte $00   ; 
- D 1 - I - 0x012068 04:A058: 00        .byte $00   ; 
- D 1 - I - 0x012069 04:A059: 00        .byte $00   ; 
- D 1 - I - 0x01206A 04:A05A: 00        .byte $00   ; 
- D 1 - I - 0x01206B 04:A05B: 00        .byte $00   ; 
- D 1 - I - 0x01206C 04:A05C: 00        .byte $00   ; 
- D 1 - I - 0x01206D 04:A05D: 00        .byte $00   ; 
- D 1 - I - 0x01206E 04:A05E: 00        .byte $00   ; 
- D 1 - I - 0x01206F 04:A05F: 00        .byte $00   ; 
- D 1 - I - 0x012070 04:A060: 00        .byte $00   ; 
- D 1 - I - 0x012071 04:A061: 00        .byte $00   ; 
- D 1 - I - 0x012072 04:A062: 00        .byte $00   ; 
- D 1 - I - 0x012073 04:A063: 00        .byte $00   ; 
- D 1 - I - 0x012074 04:A064: 00        .byte $00   ; 
- D 1 - I - 0x012075 04:A065: 00        .byte $00   ; 
- D 1 - I - 0x012076 04:A066: 00        .byte $00   ; 
- D 1 - I - 0x012077 04:A067: 00        .byte $00   ; 
- D 1 - I - 0x012078 04:A068: 00        .byte $00   ; 
- D 1 - I - 0x012079 04:A069: 00        .byte $00   ; 
- D 1 - I - 0x01207A 04:A06A: 00        .byte $00   ; 
- D 1 - I - 0x01207B 04:A06B: 00        .byte $00   ; 
- D 1 - I - 0x01207C 04:A06C: 00        .byte $00   ; 
- D 1 - I - 0x01207D 04:A06D: 00        .byte $00   ; 
- D 1 - I - 0x01207E 04:A06E: 63        .byte $63   ; 
- D 1 - I - 0x01207F 04:A06F: 5C        .byte $5C   ; 
- D 1 - I - 0x012080 04:A070: 5C        .byte $5C   ; 
- D 1 - I - 0x012081 04:A071: 5C        .byte $5C   ; 
- D 1 - I - 0x012082 04:A072: 5C        .byte $5C   ; 
- D 1 - I - 0x012083 04:A073: 5C        .byte $5C   ; 
- D 1 - I - 0x012084 04:A074: 5C        .byte $5C   ; 
- D 1 - I - 0x012085 04:A075: 5C        .byte $5C   ; 
- D 1 - I - 0x012086 04:A076: 66        .byte $66   ; 
- D 1 - I - 0x012087 04:A077: 64        .byte $64   ; 
- D 1 - I - 0x012088 04:A078: 64        .byte $64   ; 
- D 1 - I - 0x012089 04:A079: 68        .byte $68   ; 
- D 1 - I - 0x01208A 04:A07A: 69        .byte $69   ; 
- D 1 - I - 0x01208B 04:A07B: 64        .byte $64   ; 
- D 1 - I - 0x01208C 04:A07C: 66        .byte $66   ; 
- D 1 - I - 0x01208D 04:A07D: 64        .byte $64   ; 
- D 1 - I - 0x01208E 04:A07E: 67        .byte $67   ; 
- D 1 - I - 0x01208F 04:A07F: 67        .byte $67   ; 
- D 1 - I - 0x012090 04:A080: 67        .byte $67   ; 
- D 1 - I - 0x012091 04:A081: 6C        .byte $6C   ; 
- D 1 - I - 0x012092 04:A082: 6D        .byte $6D   ; 
- D 1 - I - 0x012093 04:A083: 67        .byte $67   ; 
- D 1 - I - 0x012094 04:A084: 67        .byte $67   ; 
- D 1 - I - 0x012095 04:A085: 67        .byte $67   ; 



_off018_04_A086_09:
- D 1 - I - 0x012096 04:A086: 00        .byte $00   ; 
- D 1 - I - 0x012097 04:A087: 00        .byte $00   ; 
- D 1 - I - 0x012098 04:A088: 00        .byte $00   ; 
- D 1 - I - 0x012099 04:A089: 00        .byte $00   ; 
- D 1 - I - 0x01209A 04:A08A: 00        .byte $00   ; 
- D 1 - I - 0x01209B 04:A08B: 00        .byte $00   ; 
- D 1 - I - 0x01209C 04:A08C: 00        .byte $00   ; 
- D 1 - I - 0x01209D 04:A08D: 00        .byte $00   ; 
- D 1 - I - 0x01209E 04:A08E: 00        .byte $00   ; 
- D 1 - I - 0x01209F 04:A08F: 00        .byte $00   ; 
- D 1 - I - 0x0120A0 04:A090: 00        .byte $00   ; 
- D 1 - I - 0x0120A1 04:A091: 00        .byte $00   ; 
- D 1 - I - 0x0120A2 04:A092: 00        .byte $00   ; 
- D 1 - I - 0x0120A3 04:A093: 00        .byte $00   ; 
- D 1 - I - 0x0120A4 04:A094: 00        .byte $00   ; 
- D 1 - I - 0x0120A5 04:A095: 00        .byte $00   ; 
- D 1 - I - 0x0120A6 04:A096: 00        .byte $00   ; 
- D 1 - I - 0x0120A7 04:A097: 00        .byte $00   ; 
- D 1 - I - 0x0120A8 04:A098: 00        .byte $00   ; 
- D 1 - I - 0x0120A9 04:A099: 00        .byte $00   ; 
- D 1 - I - 0x0120AA 04:A09A: 00        .byte $00   ; 
- D 1 - I - 0x0120AB 04:A09B: 00        .byte $00   ; 
- D 1 - I - 0x0120AC 04:A09C: 00        .byte $00   ; 
- D 1 - I - 0x0120AD 04:A09D: 00        .byte $00   ; 
- D 1 - I - 0x0120AE 04:A09E: 00        .byte $00   ; 
- D 1 - I - 0x0120AF 04:A09F: 00        .byte $00   ; 
- D 1 - I - 0x0120B0 04:A0A0: 00        .byte $00   ; 
- D 1 - I - 0x0120B1 04:A0A1: 00        .byte $00   ; 
- D 1 - I - 0x0120B2 04:A0A2: 00        .byte $00   ; 
- D 1 - I - 0x0120B3 04:A0A3: 00        .byte $00   ; 
- D 1 - I - 0x0120B4 04:A0A4: 00        .byte $00   ; 
- D 1 - I - 0x0120B5 04:A0A5: 00        .byte $00   ; 
- D 1 - I - 0x0120B6 04:A0A6: 00        .byte $00   ; 
- D 1 - I - 0x0120B7 04:A0A7: 00        .byte $00   ; 
- D 1 - I - 0x0120B8 04:A0A8: 00        .byte $00   ; 
- D 1 - I - 0x0120B9 04:A0A9: 00        .byte $00   ; 
- D 1 - I - 0x0120BA 04:A0AA: 00        .byte $00   ; 
- D 1 - I - 0x0120BB 04:A0AB: 00        .byte $00   ; 
- D 1 - I - 0x0120BC 04:A0AC: 00        .byte $00   ; 
- D 1 - I - 0x0120BD 04:A0AD: 00        .byte $00   ; 
- D 1 - I - 0x0120BE 04:A0AE: 5D        .byte $5D   ; 
- D 1 - I - 0x0120BF 04:A0AF: 5E        .byte $5E   ; 
- D 1 - I - 0x0120C0 04:A0B0: 00        .byte $00   ; 
- D 1 - I - 0x0120C1 04:A0B1: 00        .byte $00   ; 
- D 1 - I - 0x0120C2 04:A0B2: 00        .byte $00   ; 
- D 1 - I - 0x0120C3 04:A0B3: 00        .byte $00   ; 
- D 1 - I - 0x0120C4 04:A0B4: 00        .byte $00   ; 
- D 1 - I - 0x0120C5 04:A0B5: 00        .byte $00   ; 
- D 1 - I - 0x0120C6 04:A0B6: 6B        .byte $6B   ; 
- D 1 - I - 0x0120C7 04:A0B7: 7A        .byte $7A   ; 
- D 1 - I - 0x0120C8 04:A0B8: 00        .byte $00   ; 
- D 1 - I - 0x0120C9 04:A0B9: 00        .byte $00   ; 
- D 1 - I - 0x0120CA 04:A0BA: 00        .byte $00   ; 
- D 1 - I - 0x0120CB 04:A0BB: 00        .byte $00   ; 
- D 1 - I - 0x0120CC 04:A0BC: 00        .byte $00   ; 
- D 1 - I - 0x0120CD 04:A0BD: 00        .byte $00   ; 
- D 1 - I - 0x0120CE 04:A0BE: 6F        .byte $6F   ; 
- D 1 - I - 0x0120CF 04:A0BF: 7B        .byte $7B   ; 
- D 1 - I - 0x0120D0 04:A0C0: 00        .byte $00   ; 
- D 1 - I - 0x0120D1 04:A0C1: 00        .byte $00   ; 
- D 1 - I - 0x0120D2 04:A0C2: 00        .byte $00   ; 
- D 1 - I - 0x0120D3 04:A0C3: 00        .byte $00   ; 
- D 1 - I - 0x0120D4 04:A0C4: 00        .byte $00   ; 
- D 1 - I - 0x0120D5 04:A0C5: 00        .byte $00   ; 



_off018_04_A0C6_0A:
- D 1 - I - 0x0120D6 04:A0C6: 70        .byte $70   ; 
- D 1 - I - 0x0120D7 04:A0C7: 70        .byte $70   ; 
- D 1 - I - 0x0120D8 04:A0C8: 70        .byte $70   ; 
- D 1 - I - 0x0120D9 04:A0C9: 70        .byte $70   ; 
- D 1 - I - 0x0120DA 04:A0CA: 70        .byte $70   ; 
- D 1 - I - 0x0120DB 04:A0CB: 70        .byte $70   ; 
- D 1 - I - 0x0120DC 04:A0CC: 70        .byte $70   ; 
- D 1 - I - 0x0120DD 04:A0CD: 70        .byte $70   ; 
- D 1 - I - 0x0120DE 04:A0CE: 67        .byte $67   ; 
- D 1 - I - 0x0120DF 04:A0CF: 65        .byte $65   ; 
- D 1 - I - 0x0120E0 04:A0D0: 65        .byte $65   ; 
- D 1 - I - 0x0120E1 04:A0D1: 67        .byte $67   ; 
- D 1 - I - 0x0120E2 04:A0D2: 65        .byte $65   ; 
- D 1 - I - 0x0120E3 04:A0D3: 67        .byte $67   ; 
- D 1 - I - 0x0120E4 04:A0D4: 65        .byte $65   ; 
- D 1 - I - 0x0120E5 04:A0D5: 67        .byte $67   ; 
- D 1 - I - 0x0120E6 04:A0D6: 67        .byte $67   ; 
- D 1 - I - 0x0120E7 04:A0D7: 65        .byte $65   ; 
- D 1 - I - 0x0120E8 04:A0D8: 67        .byte $67   ; 
- D 1 - I - 0x0120E9 04:A0D9: 67        .byte $67   ; 
- D 1 - I - 0x0120EA 04:A0DA: 67        .byte $67   ; 
- D 1 - I - 0x0120EB 04:A0DB: 67        .byte $67   ; 
- D 1 - I - 0x0120EC 04:A0DC: 67        .byte $67   ; 
- D 1 - I - 0x0120ED 04:A0DD: 67        .byte $67   ; 
- D 1 - I - 0x0120EE 04:A0DE: 70        .byte $70   ; 
- D 1 - I - 0x0120EF 04:A0DF: 70        .byte $70   ; 
- - - - - - 0x0120F0 04:A0E0: 70        .byte $70   ; 
- - - - - - 0x0120F1 04:A0E1: 70        .byte $70   ; 
- - - - - - 0x0120F2 04:A0E2: 70        .byte $70   ; 
- - - - - - 0x0120F3 04:A0E3: 70        .byte $70   ; 
- D 1 - I - 0x0120F4 04:A0E4: 70        .byte $70   ; 
- D 1 - I - 0x0120F5 04:A0E5: 70        .byte $70   ; 
- - - - - - 0x0120F6 04:A0E6: 67        .byte $67   ; 
- - - - - - 0x0120F7 04:A0E7: 65        .byte $65   ; 
- - - - - - 0x0120F8 04:A0E8: 65        .byte $65   ; 
- - - - - - 0x0120F9 04:A0E9: 67        .byte $67   ; 
- - - - - - 0x0120FA 04:A0EA: 65        .byte $65   ; 
- - - - - - 0x0120FB 04:A0EB: 67        .byte $67   ; 
- - - - - - 0x0120FC 04:A0EC: 65        .byte $65   ; 
- - - - - - 0x0120FD 04:A0ED: 67        .byte $67   ; 
- - - - - - 0x0120FE 04:A0EE: 67        .byte $67   ; 
- - - - - - 0x0120FF 04:A0EF: 65        .byte $65   ; 
- - - - - - 0x012100 04:A0F0: 67        .byte $67   ; 
- - - - - - 0x012101 04:A0F1: 67        .byte $67   ; 
- - - - - - 0x012102 04:A0F2: 67        .byte $67   ; 
- - - - - - 0x012103 04:A0F3: 67        .byte $67   ; 
- - - - - - 0x012104 04:A0F4: 67        .byte $67   ; 
- - - - - - 0x012105 04:A0F5: 67        .byte $67   ; 
- - - - - - 0x012106 04:A0F6: 67        .byte $67   ; 
- - - - - - 0x012107 04:A0F7: 67        .byte $67   ; 
- - - - - - 0x012108 04:A0F8: 67        .byte $67   ; 
- - - - - - 0x012109 04:A0F9: 67        .byte $67   ; 
- - - - - - 0x01210A 04:A0FA: 67        .byte $67   ; 
- - - - - - 0x01210B 04:A0FB: 67        .byte $67   ; 
- - - - - - 0x01210C 04:A0FC: 67        .byte $67   ; 
- - - - - - 0x01210D 04:A0FD: 67        .byte $67   ; 
- - - - - - 0x01210E 04:A0FE: 67        .byte $67   ; 
- - - - - - 0x01210F 04:A0FF: 67        .byte $67   ; 
- - - - - - 0x012110 04:A100: 67        .byte $67   ; 
- - - - - - 0x012111 04:A101: 67        .byte $67   ; 
- - - - - - 0x012112 04:A102: 67        .byte $67   ; 
- - - - - - 0x012113 04:A103: 67        .byte $67   ; 
- - - - - - 0x012114 04:A104: 67        .byte $67   ; 
- - - - - - 0x012115 04:A105: 67        .byte $67   ; 



_off018_04_A106_0B:
- D 1 - I - 0x012116 04:A106: 71        .byte $71   ; 
- D 1 - I - 0x012117 04:A107: 62        .byte $62   ; 
- D 1 - I - 0x012118 04:A108: 63        .byte $63   ; 
- D 1 - I - 0x012119 04:A109: 5C        .byte $5C   ; 
- D 1 - I - 0x01211A 04:A10A: 5F        .byte $5F   ; 
- D 1 - I - 0x01211B 04:A10B: 00        .byte $00   ; 
- D 1 - I - 0x01211C 04:A10C: 00        .byte $00   ; 
- D 1 - I - 0x01211D 04:A10D: 00        .byte $00   ; 
- D 1 - I - 0x01211E 04:A10E: 6F        .byte $6F   ; 
- D 1 - I - 0x01211F 04:A10F: 6E        .byte $6E   ; 
- D 1 - I - 0x012120 04:A110: 6A        .byte $6A   ; 
- D 1 - I - 0x012121 04:A111: 69        .byte $69   ; 
- D 1 - I - 0x012122 04:A112: 60        .byte $60   ; 
- D 1 - I - 0x012123 04:A113: 00        .byte $00   ; 
- D 1 - I - 0x012124 04:A114: 00        .byte $00   ; 
- D 1 - I - 0x012125 04:A115: 00        .byte $00   ; 
- D 1 - I - 0x012126 04:A116: 6F        .byte $6F   ; 
- D 1 - I - 0x012127 04:A117: 73        .byte $73   ; 
- D 1 - I - 0x012128 04:A118: 6C        .byte $6C   ; 
- D 1 - I - 0x012129 04:A119: 6D        .byte $6D   ; 
- D 1 - I - 0x01212A 04:A11A: 61        .byte $61   ; 
- D 1 - I - 0x01212B 04:A11B: 00        .byte $00   ; 
- D 1 - I - 0x01212C 04:A11C: 00        .byte $00   ; 
- D 1 - I - 0x01212D 04:A11D: 00        .byte $00   ; 
- D 1 - I - 0x01212E 04:A11E: 71        .byte $71   ; 
- D 1 - I - 0x01212F 04:A11F: 74        .byte $74   ; 
- D 1 - I - 0x012130 04:A120: 70        .byte $70   ; 
- D 1 - I - 0x012131 04:A121: 70        .byte $70   ; 
- D 1 - I - 0x012132 04:A122: 62        .byte $62   ; 
- D 1 - I - 0x012133 04:A123: 63        .byte $63   ; 
- D 1 - I - 0x012134 04:A124: 5C        .byte $5C   ; 
- D 1 - I - 0x012135 04:A125: 5D        .byte $5D   ; 
- D 1 - I - 0x012136 04:A126: 6F        .byte $6F   ; 
- D 1 - I - 0x012137 04:A127: 73        .byte $73   ; 
- D 1 - I - 0x012138 04:A128: 67        .byte $67   ; 
- D 1 - I - 0x012139 04:A129: 67        .byte $67   ; 
- D 1 - I - 0x01213A 04:A12A: 6E        .byte $6E   ; 
- D 1 - I - 0x01213B 04:A12B: 68        .byte $68   ; 
- D 1 - I - 0x01213C 04:A12C: 69        .byte $69   ; 
- D 1 - I - 0x01213D 04:A12D: 6B        .byte $6B   ; 
- - - - - - 0x01213E 04:A12E: 6F        .byte $6F   ; 
- D 1 - I - 0x01213F 04:A12F: 73        .byte $73   ; 
- D 1 - I - 0x012140 04:A130: 67        .byte $67   ; 
- D 1 - I - 0x012141 04:A131: 67        .byte $67   ; 
- D 1 - I - 0x012142 04:A132: 73        .byte $73   ; 
- D 1 - I - 0x012143 04:A133: 6C        .byte $6C   ; 
- D 1 - I - 0x012144 04:A134: 6D        .byte $6D   ; 
- D 1 - I - 0x012145 04:A135: 6F        .byte $6F   ; 
- - - - - - 0x012146 04:A136: 71        .byte $71   ; 
- D 1 - I - 0x012147 04:A137: 74        .byte $74   ; 
- D 1 - I - 0x012148 04:A138: 70        .byte $70   ; 
- D 1 - I - 0x012149 04:A139: 70        .byte $70   ; 
- D 1 - I - 0x01214A 04:A13A: 74        .byte $74   ; 
- D 1 - I - 0x01214B 04:A13B: 70        .byte $70   ; 
- D 1 - I - 0x01214C 04:A13C: 70        .byte $70   ; 
- D 1 - I - 0x01214D 04:A13D: 71        .byte $71   ; 
- - - - - - 0x01214E 04:A13E: 6F        .byte $6F   ; 
- - - - - - 0x01214F 04:A13F: 73        .byte $73   ; 
- - - - - - 0x012150 04:A140: 67        .byte $67   ; 
- - - - - - 0x012151 04:A141: 67        .byte $67   ; 
- D 1 - I - 0x012152 04:A142: 73        .byte $73   ; 
- D 1 - I - 0x012153 04:A143: 67        .byte $67   ; 
- D 1 - I - 0x012154 04:A144: 67        .byte $67   ; 
- D 1 - I - 0x012155 04:A145: 6F        .byte $6F   ; 



_off018_04_A146_0C:
- D 1 - I - 0x012156 04:A146: 00        .byte $00   ; 
- D 1 - I - 0x012157 04:A147: 00        .byte $00   ; 
- D 1 - I - 0x012158 04:A148: 00        .byte $00   ; 
- D 1 - I - 0x012159 04:A149: 00        .byte $00   ; 
- D 1 - I - 0x01215A 04:A14A: 00        .byte $00   ; 
- D 1 - I - 0x01215B 04:A14B: 00        .byte $00   ; 
- D 1 - I - 0x01215C 04:A14C: 00        .byte $00   ; 
- D 1 - I - 0x01215D 04:A14D: 00        .byte $00   ; 
- D 1 - I - 0x01215E 04:A14E: 00        .byte $00   ; 
- D 1 - I - 0x01215F 04:A14F: 00        .byte $00   ; 
- D 1 - I - 0x012160 04:A150: 00        .byte $00   ; 
- D 1 - I - 0x012161 04:A151: 00        .byte $00   ; 
- D 1 - I - 0x012162 04:A152: 00        .byte $00   ; 
- D 1 - I - 0x012163 04:A153: 00        .byte $00   ; 
- D 1 - I - 0x012164 04:A154: 00        .byte $00   ; 
- D 1 - I - 0x012165 04:A155: 00        .byte $00   ; 
- D 1 - I - 0x012166 04:A156: 00        .byte $00   ; 
- D 1 - I - 0x012167 04:A157: 00        .byte $00   ; 
- D 1 - I - 0x012168 04:A158: 00        .byte $00   ; 
- D 1 - I - 0x012169 04:A159: 00        .byte $00   ; 
- D 1 - I - 0x01216A 04:A15A: 00        .byte $00   ; 
- D 1 - I - 0x01216B 04:A15B: 00        .byte $00   ; 
- D 1 - I - 0x01216C 04:A15C: 00        .byte $00   ; 
- D 1 - I - 0x01216D 04:A15D: 00        .byte $00   ; 
- D 1 - I - 0x01216E 04:A15E: 5E        .byte $5E   ; 
- D 1 - I - 0x01216F 04:A15F: 00        .byte $00   ; 
- D 1 - I - 0x012170 04:A160: 00        .byte $00   ; 
- D 1 - I - 0x012171 04:A161: 00        .byte $00   ; 
- D 1 - I - 0x012172 04:A162: 00        .byte $00   ; 
- D 1 - I - 0x012173 04:A163: 00        .byte $00   ; 
- D 1 - I - 0x012174 04:A164: 00        .byte $00   ; 
- D 1 - I - 0x012175 04:A165: 00        .byte $00   ; 
- D 1 - I - 0x012176 04:A166: 60        .byte $60   ; 
- D 1 - I - 0x012177 04:A167: 00        .byte $00   ; 
- D 1 - I - 0x012178 04:A168: 00        .byte $00   ; 
- D 1 - I - 0x012179 04:A169: 00        .byte $00   ; 
- D 1 - I - 0x01217A 04:A16A: 00        .byte $00   ; 
- D 1 - I - 0x01217B 04:A16B: 00        .byte $00   ; 
- D 1 - I - 0x01217C 04:A16C: 00        .byte $00   ; 
- D 1 - I - 0x01217D 04:A16D: 00        .byte $00   ; 
- D 1 - I - 0x01217E 04:A16E: 61        .byte $61   ; 
- D 1 - I - 0x01217F 04:A16F: 00        .byte $00   ; 
- D 1 - I - 0x012180 04:A170: 00        .byte $00   ; 
- D 1 - I - 0x012181 04:A171: 00        .byte $00   ; 
- D 1 - I - 0x012182 04:A172: 00        .byte $00   ; 
- D 1 - I - 0x012183 04:A173: 00        .byte $00   ; 
- D 1 - I - 0x012184 04:A174: 00        .byte $00   ; 
- D 1 - I - 0x012185 04:A175: 00        .byte $00   ; 
- D 1 - I - 0x012186 04:A176: 62        .byte $62   ; 
- D 1 - I - 0x012187 04:A177: 63        .byte $63   ; 
- D 1 - I - 0x012188 04:A178: 5C        .byte $5C   ; 
- D 1 - I - 0x012189 04:A179: 5C        .byte $5C   ; 
- D 1 - I - 0x01218A 04:A17A: 5C        .byte $5C   ; 
- D 1 - I - 0x01218B 04:A17B: 5F        .byte $5F   ; 
- D 1 - I - 0x01218C 04:A17C: 00        .byte $00   ; 
- D 1 - I - 0x01218D 04:A17D: 00        .byte $00   ; 
- D 1 - I - 0x01218E 04:A17E: 6E        .byte $6E   ; 
- D 1 - I - 0x01218F 04:A17F: 64        .byte $64   ; 
- D 1 - I - 0x012190 04:A180: 64        .byte $64   ; 
- D 1 - I - 0x012191 04:A181: 64        .byte $64   ; 
- D 1 - I - 0x012192 04:A182: 64        .byte $64   ; 
- D 1 - I - 0x012193 04:A183: 60        .byte $60   ; 
- D 1 - I - 0x012194 04:A184: 00        .byte $00   ; 
- D 1 - I - 0x012195 04:A185: 00        .byte $00   ; 



_off018_04_A186_0D:
- D 1 - I - 0x012196 04:A186: 73        .byte $73   ; 
- D 1 - I - 0x012197 04:A187: 67        .byte $67   ; 
- D 1 - I - 0x012198 04:A188: 67        .byte $67   ; 
- D 1 - I - 0x012199 04:A189: 67        .byte $67   ; 
- D 1 - I - 0x01219A 04:A18A: 67        .byte $67   ; 
- D 1 - I - 0x01219B 04:A18B: 61        .byte $61   ; 
- D 1 - I - 0x01219C 04:A18C: 00        .byte $00   ; 
- D 1 - I - 0x01219D 04:A18D: 00        .byte $00   ; 
- D 1 - I - 0x01219E 04:A18E: 74        .byte $74   ; 
- D 1 - I - 0x01219F 04:A18F: 70        .byte $70   ; 
- D 1 - I - 0x0121A0 04:A190: 70        .byte $70   ; 
- D 1 - I - 0x0121A1 04:A191: 70        .byte $70   ; 
- D 1 - I - 0x0121A2 04:A192: 70        .byte $70   ; 
- D 1 - I - 0x0121A3 04:A193: 62        .byte $62   ; 
- D 1 - I - 0x0121A4 04:A194: 63        .byte $63   ; 
- D 1 - I - 0x0121A5 04:A195: 5C        .byte $5C   ; 
- - - - - - 0x0121A6 04:A196: 73        .byte $73   ; 
- D 1 - I - 0x0121A7 04:A197: 67        .byte $67   ; 
- D 1 - I - 0x0121A8 04:A198: 67        .byte $67   ; 
- D 1 - I - 0x0121A9 04:A199: 67        .byte $67   ; 
- D 1 - I - 0x0121AA 04:A19A: 67        .byte $67   ; 
- D 1 - I - 0x0121AB 04:A19B: 6E        .byte $6E   ; 
- D 1 - I - 0x0121AC 04:A19C: 68        .byte $68   ; 
- D 1 - I - 0x0121AD 04:A19D: 69        .byte $69   ; 
- - - - - - 0x0121AE 04:A19E: 73        .byte $73   ; 
- - - - - - 0x0121AF 04:A19F: 67        .byte $67   ; 
- D 1 - I - 0x0121B0 04:A1A0: 67        .byte $67   ; 
- D 1 - I - 0x0121B1 04:A1A1: 67        .byte $67   ; 
- D 1 - I - 0x0121B2 04:A1A2: 67        .byte $67   ; 
- D 1 - I - 0x0121B3 04:A1A3: 73        .byte $73   ; 
- D 1 - I - 0x0121B4 04:A1A4: 6C        .byte $6C   ; 
- D 1 - I - 0x0121B5 04:A1A5: 6D        .byte $6D   ; 
- - - - - - 0x0121B6 04:A1A6: 74        .byte $74   ; 
- - - - - - 0x0121B7 04:A1A7: 70        .byte $70   ; 
- D 1 - I - 0x0121B8 04:A1A8: 70        .byte $70   ; 
- D 1 - I - 0x0121B9 04:A1A9: 70        .byte $70   ; 
- D 1 - I - 0x0121BA 04:A1AA: 70        .byte $70   ; 
- D 1 - I - 0x0121BB 04:A1AB: 74        .byte $74   ; 
- D 1 - I - 0x0121BC 04:A1AC: 70        .byte $70   ; 
- D 1 - I - 0x0121BD 04:A1AD: 70        .byte $70   ; 
- - - - - - 0x0121BE 04:A1AE: 73        .byte $73   ; 
- - - - - - 0x0121BF 04:A1AF: 65        .byte $65   ; 
- - - - - - 0x0121C0 04:A1B0: 65        .byte $65   ; 
- - - - - - 0x0121C1 04:A1B1: 65        .byte $65   ; 
- - - - - - 0x0121C2 04:A1B2: 65        .byte $65   ; 
- - - - - - 0x0121C3 04:A1B3: 73        .byte $73   ; 
- - - - - - 0x0121C4 04:A1B4: 65        .byte $65   ; 
- D 1 - I - 0x0121C5 04:A1B5: 65        .byte $65   ; 
- - - - - - 0x0121C6 04:A1B6: 73        .byte $73   ; 
- - - - - - 0x0121C7 04:A1B7: 65        .byte $65   ; 
- - - - - - 0x0121C8 04:A1B8: 65        .byte $65   ; 
- - - - - - 0x0121C9 04:A1B9: 65        .byte $65   ; 
- - - - - - 0x0121CA 04:A1BA: 65        .byte $65   ; 
- - - - - - 0x0121CB 04:A1BB: 73        .byte $73   ; 
- - - - - - 0x0121CC 04:A1BC: 65        .byte $65   ; 
- - - - - - 0x0121CD 04:A1BD: 65        .byte $65   ; 
- - - - - - 0x0121CE 04:A1BE: 73        .byte $73   ; 
- - - - - - 0x0121CF 04:A1BF: 65        .byte $65   ; 
- - - - - - 0x0121D0 04:A1C0: 65        .byte $65   ; 
- - - - - - 0x0121D1 04:A1C1: 65        .byte $65   ; 
- - - - - - 0x0121D2 04:A1C2: 65        .byte $65   ; 
- - - - - - 0x0121D3 04:A1C3: 73        .byte $73   ; 
- - - - - - 0x0121D4 04:A1C4: 65        .byte $65   ; 
- - - - - - 0x0121D5 04:A1C5: 65        .byte $65   ; 



_off018_04_A1C6_0E:
- D 1 - I - 0x0121D6 04:A1C6: 00        .byte $00   ; 
- D 1 - I - 0x0121D7 04:A1C7: 00        .byte $00   ; 
- D 1 - I - 0x0121D8 04:A1C8: 00        .byte $00   ; 
- D 1 - I - 0x0121D9 04:A1C9: 00        .byte $00   ; 
- D 1 - I - 0x0121DA 04:A1CA: 00        .byte $00   ; 
- D 1 - I - 0x0121DB 04:A1CB: 00        .byte $00   ; 
- D 1 - I - 0x0121DC 04:A1CC: 00        .byte $00   ; 
- D 1 - I - 0x0121DD 04:A1CD: 00        .byte $00   ; 
- D 1 - I - 0x0121DE 04:A1CE: 5C        .byte $5C   ; 
- D 1 - I - 0x0121DF 04:A1CF: 5C        .byte $5C   ; 
- D 1 - I - 0x0121E0 04:A1D0: 5C        .byte $5C   ; 
- D 1 - I - 0x0121E1 04:A1D1: 5F        .byte $5F   ; 
- D 1 - I - 0x0121E2 04:A1D2: 00        .byte $00   ; 
- D 1 - I - 0x0121E3 04:A1D3: 00        .byte $00   ; 
- D 1 - I - 0x0121E4 04:A1D4: 00        .byte $00   ; 
- D 1 - I - 0x0121E5 04:A1D5: 00        .byte $00   ; 
- D 1 - I - 0x0121E6 04:A1D6: 66        .byte $66   ; 
- D 1 - I - 0x0121E7 04:A1D7: 6A        .byte $6A   ; 
- D 1 - I - 0x0121E8 04:A1D8: 69        .byte $69   ; 
- D 1 - I - 0x0121E9 04:A1D9: 60        .byte $60   ; 
- D 1 - I - 0x0121EA 04:A1DA: 00        .byte $00   ; 
- D 1 - I - 0x0121EB 04:A1DB: 00        .byte $00   ; 
- D 1 - I - 0x0121EC 04:A1DC: 00        .byte $00   ; 
- D 1 - I - 0x0121ED 04:A1DD: 00        .byte $00   ; 
- D 1 - I - 0x0121EE 04:A1DE: 67        .byte $67   ; 
- D 1 - I - 0x0121EF 04:A1DF: 6C        .byte $6C   ; 
- D 1 - I - 0x0121F0 04:A1E0: 6D        .byte $6D   ; 
- D 1 - I - 0x0121F1 04:A1E1: 61        .byte $61   ; 
- D 1 - I - 0x0121F2 04:A1E2: 00        .byte $00   ; 
- D 1 - I - 0x0121F3 04:A1E3: 00        .byte $00   ; 
- D 1 - I - 0x0121F4 04:A1E4: 00        .byte $00   ; 
- D 1 - I - 0x0121F5 04:A1E5: 00        .byte $00   ; 
- D 1 - I - 0x0121F6 04:A1E6: 70        .byte $70   ; 
- D 1 - I - 0x0121F7 04:A1E7: 70        .byte $70   ; 
- D 1 - I - 0x0121F8 04:A1E8: 70        .byte $70   ; 
- D 1 - I - 0x0121F9 04:A1E9: 62        .byte $62   ; 
- D 1 - I - 0x0121FA 04:A1EA: 63        .byte $63   ; 
- D 1 - I - 0x0121FB 04:A1EB: 5C        .byte $5C   ; 
- D 1 - I - 0x0121FC 04:A1EC: 5C        .byte $5C   ; 
- D 1 - I - 0x0121FD 04:A1ED: 5D        .byte $5D   ; 
- D 1 - I - 0x0121FE 04:A1EE: 65        .byte $65   ; 
- D 1 - I - 0x0121FF 04:A1EF: 65        .byte $65   ; 
- D 1 - I - 0x012200 04:A1F0: 65        .byte $65   ; 
- D 1 - I - 0x012201 04:A1F1: 6E        .byte $6E   ; 
- D 1 - I - 0x012202 04:A1F2: 68        .byte $68   ; 
- D 1 - I - 0x012203 04:A1F3: 69        .byte $69   ; 
- D 1 - I - 0x012204 04:A1F4: 66        .byte $66   ; 
- D 1 - I - 0x012205 04:A1F5: 6B        .byte $6B   ; 
- D 1 - I - 0x012206 04:A1F6: 70        .byte $70   ; 
- D 1 - I - 0x012207 04:A1F7: 70        .byte $70   ; 
- D 1 - I - 0x012208 04:A1F8: 70        .byte $70   ; 
- D 1 - I - 0x012209 04:A1F9: 72        .byte $72   ; 
- D 1 - I - 0x01220A 04:A1FA: 6C        .byte $6C   ; 
- D 1 - I - 0x01220B 04:A1FB: 6D        .byte $6D   ; 
- D 1 - I - 0x01220C 04:A1FC: 67        .byte $67   ; 
- D 1 - I - 0x01220D 04:A1FD: 6F        .byte $6F   ; 
- D 1 - I - 0x01220E 04:A1FE: 70        .byte $70   ; 
- D 1 - I - 0x01220F 04:A1FF: 70        .byte $70   ; 
- D 1 - I - 0x012210 04:A200: 70        .byte $70   ; 
- D 1 - I - 0x012211 04:A201: 72        .byte $72   ; 
- D 1 - I - 0x012212 04:A202: 70        .byte $70   ; 
- D 1 - I - 0x012213 04:A203: 70        .byte $70   ; 
- D 1 - I - 0x012214 04:A204: 70        .byte $70   ; 
- D 1 - I - 0x012215 04:A205: 71        .byte $71   ; 



_off018_04_A206_0F:
- D 1 - I - 0x012216 04:A206: 00        .byte $00   ; 
- D 1 - I - 0x012217 04:A207: 00        .byte $00   ; 
- D 1 - I - 0x012218 04:A208: 00        .byte $00   ; 
- D 1 - I - 0x012219 04:A209: 00        .byte $00   ; 
- D 1 - I - 0x01221A 04:A20A: 00        .byte $00   ; 
- D 1 - I - 0x01221B 04:A20B: 00        .byte $00   ; 
- D 1 - I - 0x01221C 04:A20C: 00        .byte $00   ; 
- D 1 - I - 0x01221D 04:A20D: 00        .byte $00   ; 
- D 1 - I - 0x01221E 04:A20E: 00        .byte $00   ; 
- D 1 - I - 0x01221F 04:A20F: 00        .byte $00   ; 
- D 1 - I - 0x012220 04:A210: 00        .byte $00   ; 
- D 1 - I - 0x012221 04:A211: 00        .byte $00   ; 
- D 1 - I - 0x012222 04:A212: 00        .byte $00   ; 
- D 1 - I - 0x012223 04:A213: 00        .byte $00   ; 
- D 1 - I - 0x012224 04:A214: 00        .byte $00   ; 
- D 1 - I - 0x012225 04:A215: 00        .byte $00   ; 
- D 1 - I - 0x012226 04:A216: 00        .byte $00   ; 
- D 1 - I - 0x012227 04:A217: 00        .byte $00   ; 
- D 1 - I - 0x012228 04:A218: 00        .byte $00   ; 
- D 1 - I - 0x012229 04:A219: 00        .byte $00   ; 
- D 1 - I - 0x01222A 04:A21A: 00        .byte $00   ; 
- D 1 - I - 0x01222B 04:A21B: 00        .byte $00   ; 
- D 1 - I - 0x01222C 04:A21C: 00        .byte $00   ; 
- D 1 - I - 0x01222D 04:A21D: 00        .byte $00   ; 
- D 1 - I - 0x01222E 04:A21E: 00        .byte $00   ; 
- D 1 - I - 0x01222F 04:A21F: 00        .byte $00   ; 
- D 1 - I - 0x012230 04:A220: 00        .byte $00   ; 
- D 1 - I - 0x012231 04:A221: 00        .byte $00   ; 
- D 1 - I - 0x012232 04:A222: 00        .byte $00   ; 
- D 1 - I - 0x012233 04:A223: 00        .byte $00   ; 
- D 1 - I - 0x012234 04:A224: 00        .byte $00   ; 
- D 1 - I - 0x012235 04:A225: 00        .byte $00   ; 
- D 1 - I - 0x012236 04:A226: 5C        .byte $5C   ; 
- D 1 - I - 0x012237 04:A227: 5C        .byte $5C   ; 
- D 1 - I - 0x012238 04:A228: 5D        .byte $5D   ; 
- D 1 - I - 0x012239 04:A229: 5C        .byte $5C   ; 
- D 1 - I - 0x01223A 04:A22A: 5C        .byte $5C   ; 
- D 1 - I - 0x01223B 04:A22B: 5C        .byte $5C   ; 
- D 1 - I - 0x01223C 04:A22C: 5D        .byte $5D   ; 
- D 1 - I - 0x01223D 04:A22D: 5C        .byte $5C   ; 
- D 1 - I - 0x01223E 04:A22E: 68        .byte $68   ; 
- D 1 - I - 0x01223F 04:A22F: 69        .byte $69   ; 
- D 1 - I - 0x012240 04:A230: 6B        .byte $6B   ; 
- D 1 - I - 0x012241 04:A231: 66        .byte $66   ; 
- D 1 - I - 0x012242 04:A232: 6A        .byte $6A   ; 
- D 1 - I - 0x012243 04:A233: 69        .byte $69   ; 
- D 1 - I - 0x012244 04:A234: 6B        .byte $6B   ; 
- D 1 - I - 0x012245 04:A235: 66        .byte $66   ; 
- D 1 - I - 0x012246 04:A236: 6C        .byte $6C   ; 
- D 1 - I - 0x012247 04:A237: 6D        .byte $6D   ; 
- D 1 - I - 0x012248 04:A238: 6F        .byte $6F   ; 
- D 1 - I - 0x012249 04:A239: 67        .byte $67   ; 
- D 1 - I - 0x01224A 04:A23A: 6C        .byte $6C   ; 
- D 1 - I - 0x01224B 04:A23B: 6D        .byte $6D   ; 
- D 1 - I - 0x01224C 04:A23C: 6F        .byte $6F   ; 
- D 1 - I - 0x01224D 04:A23D: 67        .byte $67   ; 
- D 1 - I - 0x01224E 04:A23E: 70        .byte $70   ; 
- D 1 - I - 0x01224F 04:A23F: 70        .byte $70   ; 
- D 1 - I - 0x012250 04:A240: 71        .byte $71   ; 
- D 1 - I - 0x012251 04:A241: 70        .byte $70   ; 
- D 1 - I - 0x012252 04:A242: 70        .byte $70   ; 
- D 1 - I - 0x012253 04:A243: 70        .byte $70   ; 
- D 1 - I - 0x012254 04:A244: 71        .byte $71   ; 
- D 1 - I - 0x012255 04:A245: 70        .byte $70   ; 



_off018_04_A246_10:
- D 1 - I - 0x012256 04:A246: 00        .byte $00   ; 
- D 1 - I - 0x012257 04:A247: 00        .byte $00   ; 
- D 1 - I - 0x012258 04:A248: 00        .byte $00   ; 
- D 1 - I - 0x012259 04:A249: 00        .byte $00   ; 
- D 1 - I - 0x01225A 04:A24A: 00        .byte $00   ; 
- D 1 - I - 0x01225B 04:A24B: 00        .byte $00   ; 
- D 1 - I - 0x01225C 04:A24C: 00        .byte $00   ; 
- D 1 - I - 0x01225D 04:A24D: 00        .byte $00   ; 
- D 1 - I - 0x01225E 04:A24E: 00        .byte $00   ; 
- D 1 - I - 0x01225F 04:A24F: 00        .byte $00   ; 
- D 1 - I - 0x012260 04:A250: 00        .byte $00   ; 
- D 1 - I - 0x012261 04:A251: 00        .byte $00   ; 
- D 1 - I - 0x012262 04:A252: 00        .byte $00   ; 
- D 1 - I - 0x012263 04:A253: 00        .byte $00   ; 
- D 1 - I - 0x012264 04:A254: 00        .byte $00   ; 
- D 1 - I - 0x012265 04:A255: 00        .byte $00   ; 
- D 1 - I - 0x012266 04:A256: 00        .byte $00   ; 
- D 1 - I - 0x012267 04:A257: 00        .byte $00   ; 
- D 1 - I - 0x012268 04:A258: 00        .byte $00   ; 
- D 1 - I - 0x012269 04:A259: 00        .byte $00   ; 
- D 1 - I - 0x01226A 04:A25A: 8D        .byte $8D   ; 
- D 1 - I - 0x01226B 04:A25B: 8E        .byte $8E   ; 
- D 1 - I - 0x01226C 04:A25C: 8E        .byte $8E   ; 
- D 1 - I - 0x01226D 04:A25D: 00        .byte $00   ; 
- D 1 - I - 0x01226E 04:A25E: 00        .byte $00   ; 
- D 1 - I - 0x01226F 04:A25F: 00        .byte $00   ; 
- D 1 - I - 0x012270 04:A260: 00        .byte $00   ; 
- D 1 - I - 0x012271 04:A261: 8F        .byte $8F   ; 
- D 1 - I - 0x012272 04:A262: 90        .byte $90   ; 
- D 1 - I - 0x012273 04:A263: 91        .byte $91   ; 
- D 1 - I - 0x012274 04:A264: 92        .byte $92   ; 
- D 1 - I - 0x012275 04:A265: 00        .byte $00   ; 
- D 1 - I - 0x012276 04:A266: 5C        .byte $5C   ; 
- D 1 - I - 0x012277 04:A267: 5C        .byte $5C   ; 
- D 1 - I - 0x012278 04:A268: 5D        .byte $5D   ; 
- D 1 - I - 0x012279 04:A269: 93        .byte $93   ; 
- D 1 - I - 0x01227A 04:A26A: 94        .byte $94   ; 
- D 1 - I - 0x01227B 04:A26B: 95        .byte $95   ; 
- D 1 - I - 0x01227C 04:A26C: 96        .byte $96   ; 
- D 1 - I - 0x01227D 04:A26D: 00        .byte $00   ; 
- D 1 - I - 0x01227E 04:A26E: 68        .byte $68   ; 
- D 1 - I - 0x01227F 04:A26F: 69        .byte $69   ; 
- D 1 - I - 0x012280 04:A270: 6B        .byte $6B   ; 
- D 1 - I - 0x012281 04:A271: 64        .byte $64   ; 
- D 1 - I - 0x012282 04:A272: 97        .byte $97   ; 
- D 1 - I - 0x012283 04:A273: 98        .byte $98   ; 
- D 1 - I - 0x012284 04:A274: 99        .byte $99   ; 
- D 1 - I - 0x012285 04:A275: 00        .byte $00   ; 
- - - - - - 0x012286 04:A276: 6C        .byte $6C   ; 
- - - - - - 0x012287 04:A277: 6D        .byte $6D   ; 
- - - - - - 0x012288 04:A278: 6F        .byte $6F   ; 
- - - - - - 0x012289 04:A279: 65        .byte $65   ; 
- - - - - - 0x01228A 04:A27A: 98        .byte $98   ; 
- - - - - - 0x01228B 04:A27B: 99        .byte $99   ; 
- - - - - - 0x01228C 04:A27C: 98        .byte $98   ; 
- - - - - - 0x01228D 04:A27D: 00        .byte $00   ; 
- - - - - - 0x01228E 04:A27E: 70        .byte $70   ; 
- - - - - - 0x01228F 04:A27F: 70        .byte $70   ; 
- - - - - - 0x012290 04:A280: 71        .byte $71   ; 
- - - - - - 0x012291 04:A281: 70        .byte $70   ; 
- - - - - - 0x012292 04:A282: 99        .byte $99   ; 
- - - - - - 0x012293 04:A283: 98        .byte $98   ; 
- - - - - - 0x012294 04:A284: 99        .byte $99   ; 
- - - - - - 0x012295 04:A285: 00        .byte $00   ; 



_off018_04_A286_11:
- D 1 - I - 0x012296 04:A286: 00        .byte $00   ; 
- D 1 - I - 0x012297 04:A287: 00        .byte $00   ; 
- D 1 - I - 0x012298 04:A288: 00        .byte $00   ; 
- D 1 - I - 0x012299 04:A289: 00        .byte $00   ; 
- D 1 - I - 0x01229A 04:A28A: 00        .byte $00   ; 
- D 1 - I - 0x01229B 04:A28B: 00        .byte $00   ; 
- D 1 - I - 0x01229C 04:A28C: 00        .byte $00   ; 
- D 1 - I - 0x01229D 04:A28D: 00        .byte $00   ; 
- D 1 - I - 0x01229E 04:A28E: 00        .byte $00   ; 
- D 1 - I - 0x01229F 04:A28F: 00        .byte $00   ; 
- D 1 - I - 0x0122A0 04:A290: 00        .byte $00   ; 
- D 1 - I - 0x0122A1 04:A291: 00        .byte $00   ; 
- D 1 - I - 0x0122A2 04:A292: 00        .byte $00   ; 
- D 1 - I - 0x0122A3 04:A293: 00        .byte $00   ; 
- D 1 - I - 0x0122A4 04:A294: 00        .byte $00   ; 
- D 1 - I - 0x0122A5 04:A295: 00        .byte $00   ; 
- D 1 - I - 0x0122A6 04:A296: 00        .byte $00   ; 
- D 1 - I - 0x0122A7 04:A297: 00        .byte $00   ; 
- D 1 - I - 0x0122A8 04:A298: 00        .byte $00   ; 
- D 1 - I - 0x0122A9 04:A299: 00        .byte $00   ; 
- D 1 - I - 0x0122AA 04:A29A: 00        .byte $00   ; 
- D 1 - I - 0x0122AB 04:A29B: 00        .byte $00   ; 
- D 1 - I - 0x0122AC 04:A29C: 00        .byte $00   ; 
- D 1 - I - 0x0122AD 04:A29D: 00        .byte $00   ; 
- D 1 - I - 0x0122AE 04:A29E: 00        .byte $00   ; 
- D 1 - I - 0x0122AF 04:A29F: 00        .byte $00   ; 
- D 1 - I - 0x0122B0 04:A2A0: 7C        .byte $7C   ; 
- D 1 - I - 0x0122B1 04:A2A1: 7D        .byte $7D   ; 
- D 1 - I - 0x0122B2 04:A2A2: 7E        .byte $7E   ; 
- D 1 - I - 0x0122B3 04:A2A3: 7F        .byte $7F   ; 
- D 1 - I - 0x0122B4 04:A2A4: 00        .byte $00   ; 
- D 1 - I - 0x0122B5 04:A2A5: 00        .byte $00   ; 
- D 1 - I - 0x0122B6 04:A2A6: 00        .byte $00   ; 
- D 1 - I - 0x0122B7 04:A2A7: 00        .byte $00   ; 
- D 1 - I - 0x0122B8 04:A2A8: 80        .byte $80   ; 
- D 1 - I - 0x0122B9 04:A2A9: 81        .byte $81   ; 
- D 1 - I - 0x0122BA 04:A2AA: 82        .byte $82   ; 
- D 1 - I - 0x0122BB 04:A2AB: 83        .byte $83   ; 
- D 1 - I - 0x0122BC 04:A2AC: 00        .byte $00   ; 
- D 1 - I - 0x0122BD 04:A2AD: 00        .byte $00   ; 
- D 1 - I - 0x0122BE 04:A2AE: 00        .byte $00   ; 
- D 1 - I - 0x0122BF 04:A2AF: 00        .byte $00   ; 
- D 1 - I - 0x0122C0 04:A2B0: 84        .byte $84   ; 
- D 1 - I - 0x0122C1 04:A2B1: 85        .byte $85   ; 
- D 1 - I - 0x0122C2 04:A2B2: 85        .byte $85   ; 
- D 1 - I - 0x0122C3 04:A2B3: 86        .byte $86   ; 
- D 1 - I - 0x0122C4 04:A2B4: 00        .byte $00   ; 
- D 1 - I - 0x0122C5 04:A2B5: 00        .byte $00   ; 
- D 1 - I - 0x0122C6 04:A2B6: 00        .byte $00   ; 
- D 1 - I - 0x0122C7 04:A2B7: 00        .byte $00   ; 
- - - - - - 0x0122C8 04:A2B8: 00        .byte $00   ; 
- - - - - - 0x0122C9 04:A2B9: 00        .byte $00   ; 
- - - - - - 0x0122CA 04:A2BA: 00        .byte $00   ; 
- - - - - - 0x0122CB 04:A2BB: 00        .byte $00   ; 
- - - - - - 0x0122CC 04:A2BC: 00        .byte $00   ; 
- - - - - - 0x0122CD 04:A2BD: 00        .byte $00   ; 
- D 1 - I - 0x0122CE 04:A2BE: 00        .byte $00   ; 
- D 1 - I - 0x0122CF 04:A2BF: 00        .byte $00   ; 
- - - - - - 0x0122D0 04:A2C0: 00        .byte $00   ; 
- - - - - - 0x0122D1 04:A2C1: 00        .byte $00   ; 
- - - - - - 0x0122D2 04:A2C2: 00        .byte $00   ; 
- - - - - - 0x0122D3 04:A2C3: 00        .byte $00   ; 
- - - - - - 0x0122D4 04:A2C4: 00        .byte $00   ; 
- - - - - - 0x0122D5 04:A2C5: 00        .byte $00   ; 



_off006_0x0122D6_04_area_5:
- D 1 - I - 0x0122D6 04:A2C6: 00        .byte $00   ; 
- D 1 - I - 0x0122D7 04:A2C7: 00        .byte $00   ; 
- D 1 - I - 0x0122D8 04:A2C8: 00        .byte $00   ; 
- D 1 - I - 0x0122D9 04:A2C9: 00        .byte $00   ; 
- D 1 - I - 0x0122DA 04:A2CA: 00        .byte $00   ; 
- D 1 - I - 0x0122DB 04:A2CB: 00        .byte $00   ; 
- D 1 - I - 0x0122DC 04:A2CC: 00        .byte $00   ; 
- D 1 - I - 0x0122DD 04:A2CD: 00        .byte $00   ; 
- D 1 - I - 0x0122DE 04:A2CE: 00        .byte $00   ; 
- D 1 - I - 0x0122DF 04:A2CF: 00        .byte $00   ; 
- D 1 - I - 0x0122E0 04:A2D0: 00        .byte $00   ; 
- D 1 - I - 0x0122E1 04:A2D1: 00        .byte $00   ; 
- D 1 - I - 0x0122E2 04:A2D2: 00        .byte $00   ; 
- D 1 - I - 0x0122E3 04:A2D3: 00        .byte $00   ; 
- D 1 - I - 0x0122E4 04:A2D4: 00        .byte $00   ; 
- D 1 - I - 0x0122E5 04:A2D5: 00        .byte $00   ; 
- D 1 - I - 0x0122E6 04:A2D6: 28        .byte $28   ; 
- D 1 - I - 0x0122E7 04:A2D7: 6F        .byte $6F   ; 
- D 1 - I - 0x0122E8 04:A2D8: 70        .byte $70   ; 
- D 1 - I - 0x0122E9 04:A2D9: 5C        .byte $5C   ; 
- D 1 - I - 0x0122EA 04:A2DA: 71        .byte $71   ; 
- D 1 - I - 0x0122EB 04:A2DB: 82        .byte $82   ; 
- D 1 - I - 0x0122EC 04:A2DC: 83        .byte $83   ; 
- D 1 - I - 0x0122ED 04:A2DD: 74        .byte $74   ; 
- D 1 - I - 0x0122EE 04:A2DE: 75        .byte $75   ; 
- D 1 - I - 0x0122EF 04:A2DF: 84        .byte $84   ; 
- D 1 - I - 0x0122F0 04:A2E0: 85        .byte $85   ; 
- D 1 - I - 0x0122F1 04:A2E1: 78        .byte $78   ; 
- D 1 - I - 0x0122F2 04:A2E2: 63        .byte $63   ; 
- D 1 - I - 0x0122F3 04:A2E3: 86        .byte $86   ; 
- D 1 - I - 0x0122F4 04:A2E4: 87        .byte $87   ; 
- D 1 - I - 0x0122F5 04:A2E5: 66        .byte $66   ; 
- D 1 - I - 0x0122F6 04:A2E6: 28        .byte $28   ; 
- D 1 - I - 0x0122F7 04:A2E7: 6F        .byte $6F   ; 
- D 1 - I - 0x0122F8 04:A2E8: 70        .byte $70   ; 
- D 1 - I - 0x0122F9 04:A2E9: 5C        .byte $5C   ; 
- D 1 - I - 0x0122FA 04:A2EA: 71        .byte $71   ; 
- D 1 - I - 0x0122FB 04:A2EB: 82        .byte $82   ; 
- D 1 - I - 0x0122FC 04:A2EC: 83        .byte $83   ; 
- D 1 - I - 0x0122FD 04:A2ED: 74        .byte $74   ; 
- D 1 - I - 0x0122FE 04:A2EE: 75        .byte $75   ; 
- D 1 - I - 0x0122FF 04:A2EF: 88        .byte $88   ; 
- D 1 - I - 0x012300 04:A2F0: 89        .byte $89   ; 
- D 1 - I - 0x012301 04:A2F1: 78        .byte $78   ; 
- D 1 - I - 0x012302 04:A2F2: 8A        .byte $8A   ; 
- D 1 - I - 0x012303 04:A2F3: 8B        .byte $8B   ; 
- D 1 - I - 0x012304 04:A2F4: 7A        .byte $7A   ; 
- D 1 - I - 0x012305 04:A2F5: 66        .byte $66   ; 
- D 1 - I - 0x012306 04:A2F6: 28        .byte $28   ; 
- D 1 - I - 0x012307 04:A2F7: 6F        .byte $6F   ; 
- D 1 - I - 0x012308 04:A2F8: 70        .byte $70   ; 
- D 1 - I - 0x012309 04:A2F9: 5C        .byte $5C   ; 
- D 1 - I - 0x01230A 04:A2FA: 71        .byte $71   ; 
- D 1 - I - 0x01230B 04:A2FB: 8C        .byte $8C   ; 
- D 1 - I - 0x01230C 04:A2FC: 83        .byte $83   ; 
- D 1 - I - 0x01230D 04:A2FD: 74        .byte $74   ; 
- D 1 - I - 0x01230E 04:A2FE: 8D        .byte $8D   ; 
- D 1 - I - 0x01230F 04:A2FF: 8E        .byte $8E   ; 
- D 1 - I - 0x012310 04:A300: 8F        .byte $8F   ; 
- D 1 - I - 0x012311 04:A301: 78        .byte $78   ; 
- D 1 - I - 0x012312 04:A302: 90        .byte $90   ; 
- D 1 - I - 0x012313 04:A303: 79        .byte $79   ; 
- D 1 - I - 0x012314 04:A304: 7A        .byte $7A   ; 
- D 1 - I - 0x012315 04:A305: 66        .byte $66   ; 
- D 1 - I - 0x012316 04:A306: 28        .byte $28   ; 
- D 1 - I - 0x012317 04:A307: 6F        .byte $6F   ; 
- D 1 - I - 0x012318 04:A308: 70        .byte $70   ; 
- D 1 - I - 0x012319 04:A309: 5C        .byte $5C   ; 
- D 1 - I - 0x01231A 04:A30A: 91        .byte $91   ; 
- D 1 - I - 0x01231B 04:A30B: 92        .byte $92   ; 
- D 1 - I - 0x01231C 04:A30C: 83        .byte $83   ; 
- D 1 - I - 0x01231D 04:A30D: 74        .byte $74   ; 
- D 1 - I - 0x01231E 04:A30E: 93        .byte $93   ; 
- D 1 - I - 0x01231F 04:A30F: 94        .byte $94   ; 
- D 1 - I - 0x012320 04:A310: 8F        .byte $8F   ; 
- D 1 - I - 0x012321 04:A311: 78        .byte $78   ; 
- D 1 - I - 0x012322 04:A312: 63        .byte $63   ; 
- D 1 - I - 0x012323 04:A313: 79        .byte $79   ; 
- D 1 - I - 0x012324 04:A314: 7A        .byte $7A   ; 
- D 1 - I - 0x012325 04:A315: 66        .byte $66   ; 
- D 1 - I - 0x012326 04:A316: 95        .byte $95   ; 
- D 1 - I - 0x012327 04:A317: 6F        .byte $6F   ; 
- D 1 - I - 0x012328 04:A318: 70        .byte $70   ; 
- D 1 - I - 0x012329 04:A319: 5C        .byte $5C   ; 
- D 1 - I - 0x01232A 04:A31A: 96        .byte $96   ; 
- D 1 - I - 0x01232B 04:A31B: 97        .byte $97   ; 
- D 1 - I - 0x01232C 04:A31C: 83        .byte $83   ; 
- D 1 - I - 0x01232D 04:A31D: 74        .byte $74   ; 
- D 1 - I - 0x01232E 04:A31E: 75        .byte $75   ; 
- D 1 - I - 0x01232F 04:A31F: 98        .byte $98   ; 
- D 1 - I - 0x012330 04:A320: 8F        .byte $8F   ; 
- D 1 - I - 0x012331 04:A321: 78        .byte $78   ; 
- D 1 - I - 0x012332 04:A322: 63        .byte $63   ; 
- D 1 - I - 0x012333 04:A323: 79        .byte $79   ; 
- D 1 - I - 0x012334 04:A324: 7A        .byte $7A   ; 
- D 1 - I - 0x012335 04:A325: 66        .byte $66   ; 
- D 1 - I - 0x012336 04:A326: E3        .byte $E3   ; 
- D 1 - I - 0x012337 04:A327: E4        .byte $E4   ; 
- D 1 - I - 0x012338 04:A328: 70        .byte $70   ; 
- D 1 - I - 0x012339 04:A329: 5C        .byte $5C   ; 
- D 1 - I - 0x01233A 04:A32A: 71        .byte $71   ; 
- D 1 - I - 0x01233B 04:A32B: E5        .byte $E5   ; 
- D 1 - I - 0x01233C 04:A32C: E6        .byte $E6   ; 
- D 1 - I - 0x01233D 04:A32D: 74        .byte $74   ; 
- D 1 - I - 0x01233E 04:A32E: 75        .byte $75   ; 
- D 1 - I - 0x01233F 04:A32F: E7        .byte $E7   ; 
- D 1 - I - 0x012340 04:A330: 8F        .byte $8F   ; 
- D 1 - I - 0x012341 04:A331: 78        .byte $78   ; 
- D 1 - I - 0x012342 04:A332: 63        .byte $63   ; 
- D 1 - I - 0x012343 04:A333: 79        .byte $79   ; 
- D 1 - I - 0x012344 04:A334: 7A        .byte $7A   ; 
- D 1 - I - 0x012345 04:A335: 66        .byte $66   ; 
- D 1 - I - 0x012346 04:A336: 28        .byte $28   ; 
- D 1 - I - 0x012347 04:A337: E8        .byte $E8   ; 
- D 1 - I - 0x012348 04:A338: E9        .byte $E9   ; 
- D 1 - I - 0x012349 04:A339: 5C        .byte $5C   ; 
- D 1 - I - 0x01234A 04:A33A: 71        .byte $71   ; 
- D 1 - I - 0x01234B 04:A33B: EA        .byte $EA   ; 
- D 1 - I - 0x01234C 04:A33C: EB        .byte $EB   ; 
- D 1 - I - 0x01234D 04:A33D: 74        .byte $74   ; 
- D 1 - I - 0x01234E 04:A33E: 75        .byte $75   ; 
- D 1 - I - 0x01234F 04:A33F: E7        .byte $E7   ; 
- D 1 - I - 0x012350 04:A340: 8F        .byte $8F   ; 
- D 1 - I - 0x012351 04:A341: 78        .byte $78   ; 
- D 1 - I - 0x012352 04:A342: 63        .byte $63   ; 
- D 1 - I - 0x012353 04:A343: 79        .byte $79   ; 
- D 1 - I - 0x012354 04:A344: 7A        .byte $7A   ; 
- D 1 - I - 0x012355 04:A345: 66        .byte $66   ; 
- D 1 - I - 0x012356 04:A346: 28        .byte $28   ; 
- D 1 - I - 0x012357 04:A347: 6F        .byte $6F   ; 
- D 1 - I - 0x012358 04:A348: EC        .byte $EC   ; 
- D 1 - I - 0x012359 04:A349: ED        .byte $ED   ; 
- D 1 - I - 0x01235A 04:A34A: 71        .byte $71   ; 
- D 1 - I - 0x01235B 04:A34B: EE        .byte $EE   ; 
- D 1 - I - 0x01235C 04:A34C: EF        .byte $EF   ; 
- D 1 - I - 0x01235D 04:A34D: 74        .byte $74   ; 
- D 1 - I - 0x01235E 04:A34E: 75        .byte $75   ; 
- D 1 - I - 0x01235F 04:A34F: E7        .byte $E7   ; 
- D 1 - I - 0x012360 04:A350: 8F        .byte $8F   ; 
- D 1 - I - 0x012361 04:A351: 78        .byte $78   ; 
- D 1 - I - 0x012362 04:A352: 63        .byte $63   ; 
- D 1 - I - 0x012363 04:A353: 79        .byte $79   ; 
- D 1 - I - 0x012364 04:A354: 7A        .byte $7A   ; 
- D 1 - I - 0x012365 04:A355: 66        .byte $66   ; 
- D 1 - I - 0x012366 04:A356: 28        .byte $28   ; 
- D 1 - I - 0x012367 04:A357: 6F        .byte $6F   ; 
- D 1 - I - 0x012368 04:A358: 70        .byte $70   ; 
- D 1 - I - 0x012369 04:A359: F0        .byte $F0   ; 
- D 1 - I - 0x01236A 04:A35A: 71        .byte $71   ; 
- D 1 - I - 0x01236B 04:A35B: 82        .byte $82   ; 
- D 1 - I - 0x01236C 04:A35C: F1        .byte $F1   ; 
- D 1 - I - 0x01236D 04:A35D: F2        .byte $F2   ; 
- D 1 - I - 0x01236E 04:A35E: 75        .byte $75   ; 
- D 1 - I - 0x01236F 04:A35F: E7        .byte $E7   ; 
- D 1 - I - 0x012370 04:A360: F3        .byte $F3   ; 
- D 1 - I - 0x012371 04:A361: 78        .byte $78   ; 
- D 1 - I - 0x012372 04:A362: 63        .byte $63   ; 
- D 1 - I - 0x012373 04:A363: 79        .byte $79   ; 
- D 1 - I - 0x012374 04:A364: 7A        .byte $7A   ; 
- D 1 - I - 0x012375 04:A365: 66        .byte $66   ; 
- D 1 - I - 0x012376 04:A366: 28        .byte $28   ; 
- D 1 - I - 0x012377 04:A367: 6F        .byte $6F   ; 
- D 1 - I - 0x012378 04:A368: 70        .byte $70   ; 
- D 1 - I - 0x012379 04:A369: 5C        .byte $5C   ; 
- D 1 - I - 0x01237A 04:A36A: 71        .byte $71   ; 
- D 1 - I - 0x01237B 04:A36B: 82        .byte $82   ; 
- D 1 - I - 0x01237C 04:A36C: F4        .byte $F4   ; 
- D 1 - I - 0x01237D 04:A36D: F5        .byte $F5   ; 
- D 1 - I - 0x01237E 04:A36E: 75        .byte $75   ; 
- D 1 - I - 0x01237F 04:A36F: E7        .byte $E7   ; 
- D 1 - I - 0x012380 04:A370: F6        .byte $F6   ; 
- D 1 - I - 0x012381 04:A371: F7        .byte $F7   ; 
- D 1 - I - 0x012382 04:A372: 63        .byte $63   ; 
- D 1 - I - 0x012383 04:A373: 79        .byte $79   ; 
- D 1 - I - 0x012384 04:A374: 7A        .byte $7A   ; 
- D 1 - I - 0x012385 04:A375: 66        .byte $66   ; 
- D 1 - I - 0x012386 04:A376: 28        .byte $28   ; 
- D 1 - I - 0x012387 04:A377: 6F        .byte $6F   ; 
- D 1 - I - 0x012388 04:A378: 70        .byte $70   ; 
- D 1 - I - 0x012389 04:A379: 5C        .byte $5C   ; 
- D 1 - I - 0x01238A 04:A37A: 71        .byte $71   ; 
- D 1 - I - 0x01238B 04:A37B: 82        .byte $82   ; 
- D 1 - I - 0x01238C 04:A37C: F8        .byte $F8   ; 
- D 1 - I - 0x01238D 04:A37D: 74        .byte $74   ; 
- D 1 - I - 0x01238E 04:A37E: 75        .byte $75   ; 
- D 1 - I - 0x01238F 04:A37F: E7        .byte $E7   ; 
- D 1 - I - 0x012390 04:A380: F9        .byte $F9   ; 
- D 1 - I - 0x012391 04:A381: FA        .byte $FA   ; 
- D 1 - I - 0x012392 04:A382: 63        .byte $63   ; 
- D 1 - I - 0x012393 04:A383: 79        .byte $79   ; 
- D 1 - I - 0x012394 04:A384: 7A        .byte $7A   ; 
- D 1 - I - 0x012395 04:A385: FB        .byte $FB   ; 
- D 1 - I - 0x012396 04:A386: 28        .byte $28   ; 
- D 1 - I - 0x012397 04:A387: 6F        .byte $6F   ; 
- D 1 - I - 0x012398 04:A388: 70        .byte $70   ; 
- D 1 - I - 0x012399 04:A389: 5C        .byte $5C   ; 
- D 1 - I - 0x01239A 04:A38A: 71        .byte $71   ; 
- D 1 - I - 0x01239B 04:A38B: 82        .byte $82   ; 
- D 1 - I - 0x01239C 04:A38C: 83        .byte $83   ; 
- D 1 - I - 0x01239D 04:A38D: 74        .byte $74   ; 
- D 1 - I - 0x01239E 04:A38E: 75        .byte $75   ; 
- D 1 - I - 0x01239F 04:A38F: FC        .byte $FC   ; 
- D 1 - I - 0x0123A0 04:A390: FD        .byte $FD   ; 
- D 1 - I - 0x0123A1 04:A391: 78        .byte $78   ; 
- D 1 - I - 0x0123A2 04:A392: 63        .byte $63   ; 
- D 1 - I - 0x0123A3 04:A393: 79        .byte $79   ; 
- D 1 - I - 0x0123A4 04:A394: FE        .byte $FE   ; 
- D 1 - I - 0x0123A5 04:A395: FF        .byte $FF   ; 
- D 1 - I - 0x0123A6 04:A396: 28        .byte $28   ; 
- D 1 - I - 0x0123A7 04:A397: 6F        .byte $6F   ; 
- D 1 - I - 0x0123A8 04:A398: 70        .byte $70   ; 
- D 1 - I - 0x0123A9 04:A399: 5C        .byte $5C   ; 
- D 1 - I - 0x0123AA 04:A39A: 71        .byte $71   ; 
- D 1 - I - 0x0123AB 04:A39B: 7B        .byte $7B   ; 
- D 1 - I - 0x0123AC 04:A39C: 7C        .byte $7C   ; 
- D 1 - I - 0x0123AD 04:A39D: 74        .byte $74   ; 
- D 1 - I - 0x0123AE 04:A39E: 75        .byte $75   ; 
- D 1 - I - 0x0123AF 04:A39F: 7C        .byte $7C   ; 
- D 1 - I - 0x0123B0 04:A3A0: 7D        .byte $7D   ; 
- D 1 - I - 0x0123B1 04:A3A1: 78        .byte $78   ; 
- D 1 - I - 0x0123B2 04:A3A2: 63        .byte $63   ; 
- D 1 - I - 0x0123B3 04:A3A3: 79        .byte $79   ; 
- D 1 - I - 0x0123B4 04:A3A4: 7A        .byte $7A   ; 
- D 1 - I - 0x0123B5 04:A3A5: 66        .byte $66   ; 
- D 1 - I - 0x0123B6 04:A3A6: 28        .byte $28   ; 
- D 1 - I - 0x0123B7 04:A3A7: 5B        .byte $5B   ; 
- D 1 - I - 0x0123B8 04:A3A8: 29        .byte $29   ; 
- D 1 - I - 0x0123B9 04:A3A9: 5C        .byte $5C   ; 
- D 1 - I - 0x0123BA 04:A3AA: 5D        .byte $5D   ; 
- D 1 - I - 0x0123BB 04:A3AB: 5E        .byte $5E   ; 
- D 1 - I - 0x0123BC 04:A3AC: 5F        .byte $5F   ; 
- D 1 - I - 0x0123BD 04:A3AD: 61        .byte $61   ; 
- D 1 - I - 0x0123BE 04:A3AE: 2A        .byte $2A   ; 
- D 1 - I - 0x0123BF 04:A3AF: 60        .byte $60   ; 
- D 1 - I - 0x0123C0 04:A3B0: 2B        .byte $2B   ; 
- D 1 - I - 0x0123C1 04:A3B1: 62        .byte $62   ; 
- D 1 - I - 0x0123C2 04:A3B2: 63        .byte $63   ; 
- D 1 - I - 0x0123C3 04:A3B3: 64        .byte $64   ; 
- D 1 - I - 0x0123C4 04:A3B4: 65        .byte $65   ; 
- D 1 - I - 0x0123C5 04:A3B5: 66        .byte $66   ; 
- D 1 - I - 0x0123C6 04:A3B6: 28        .byte $28   ; 
- D 1 - I - 0x0123C7 04:A3B7: 5B        .byte $5B   ; 
- D 1 - I - 0x0123C8 04:A3B8: 29        .byte $29   ; 
- D 1 - I - 0x0123C9 04:A3B9: 5C        .byte $5C   ; 
- D 1 - I - 0x0123CA 04:A3BA: 5D        .byte $5D   ; 
- D 1 - I - 0x0123CB 04:A3BB: 67        .byte $67   ; 
- D 1 - I - 0x0123CC 04:A3BC: 68        .byte $68   ; 
- D 1 - I - 0x0123CD 04:A3BD: 61        .byte $61   ; 
- D 1 - I - 0x0123CE 04:A3BE: 2A        .byte $2A   ; 
- D 1 - I - 0x0123CF 04:A3BF: 69        .byte $69   ; 
- D 1 - I - 0x0123D0 04:A3C0: 6A        .byte $6A   ; 
- D 1 - I - 0x0123D1 04:A3C1: 62        .byte $62   ; 
- D 1 - I - 0x0123D2 04:A3C2: 63        .byte $63   ; 
- D 1 - I - 0x0123D3 04:A3C3: 64        .byte $64   ; 
- D 1 - I - 0x0123D4 04:A3C4: 65        .byte $65   ; 
- D 1 - I - 0x0123D5 04:A3C5: 66        .byte $66   ; 
- D 1 - I - 0x0123D6 04:A3C6: 28        .byte $28   ; 
- D 1 - I - 0x0123D7 04:A3C7: 5B        .byte $5B   ; 
- D 1 - I - 0x0123D8 04:A3C8: 29        .byte $29   ; 
- D 1 - I - 0x0123D9 04:A3C9: 5C        .byte $5C   ; 
- D 1 - I - 0x0123DA 04:A3CA: 5D        .byte $5D   ; 
- D 1 - I - 0x0123DB 04:A3CB: 7E        .byte $7E   ; 
- D 1 - I - 0x0123DC 04:A3CC: 7F        .byte $7F   ; 
- D 1 - I - 0x0123DD 04:A3CD: 61        .byte $61   ; 
- D 1 - I - 0x0123DE 04:A3CE: 2A        .byte $2A   ; 
- D 1 - I - 0x0123DF 04:A3CF: 80        .byte $80   ; 
- D 1 - I - 0x0123E0 04:A3D0: 81        .byte $81   ; 
- D 1 - I - 0x0123E1 04:A3D1: 62        .byte $62   ; 
- D 1 - I - 0x0123E2 04:A3D2: 63        .byte $63   ; 
- D 1 - I - 0x0123E3 04:A3D3: 64        .byte $64   ; 
- D 1 - I - 0x0123E4 04:A3D4: 65        .byte $65   ; 
- D 1 - I - 0x0123E5 04:A3D5: 66        .byte $66   ; 
- D 1 - I - 0x0123E6 04:A3D6: 28        .byte $28   ; 
- D 1 - I - 0x0123E7 04:A3D7: 5B        .byte $5B   ; 
- D 1 - I - 0x0123E8 04:A3D8: 29        .byte $29   ; 
- D 1 - I - 0x0123E9 04:A3D9: 5C        .byte $5C   ; 
- D 1 - I - 0x0123EA 04:A3DA: 5D        .byte $5D   ; 
- D 1 - I - 0x0123EB 04:A3DB: 6B        .byte $6B   ; 
- D 1 - I - 0x0123EC 04:A3DC: 6C        .byte $6C   ; 
- D 1 - I - 0x0123ED 04:A3DD: 61        .byte $61   ; 
- D 1 - I - 0x0123EE 04:A3DE: 2A        .byte $2A   ; 
- D 1 - I - 0x0123EF 04:A3DF: 6D        .byte $6D   ; 
- D 1 - I - 0x0123F0 04:A3E0: 6E        .byte $6E   ; 
- D 1 - I - 0x0123F1 04:A3E1: 62        .byte $62   ; 
- D 1 - I - 0x0123F2 04:A3E2: 63        .byte $63   ; 
- D 1 - I - 0x0123F3 04:A3E3: 64        .byte $64   ; 
- D 1 - I - 0x0123F4 04:A3E4: 65        .byte $65   ; 
- D 1 - I - 0x0123F5 04:A3E5: 66        .byte $66   ; 
- D 1 - I - 0x0123F6 04:A3E6: 28        .byte $28   ; 
- D 1 - I - 0x0123F7 04:A3E7: 6F        .byte $6F   ; 
- D 1 - I - 0x0123F8 04:A3E8: 70        .byte $70   ; 
- D 1 - I - 0x0123F9 04:A3E9: 5C        .byte $5C   ; 
- D 1 - I - 0x0123FA 04:A3EA: 71        .byte $71   ; 
- D 1 - I - 0x0123FB 04:A3EB: 72        .byte $72   ; 
- D 1 - I - 0x0123FC 04:A3EC: 73        .byte $73   ; 
- D 1 - I - 0x0123FD 04:A3ED: 74        .byte $74   ; 
- D 1 - I - 0x0123FE 04:A3EE: 75        .byte $75   ; 
- D 1 - I - 0x0123FF 04:A3EF: 76        .byte $76   ; 
- D 1 - I - 0x012400 04:A3F0: 77        .byte $77   ; 
- D 1 - I - 0x012401 04:A3F1: 78        .byte $78   ; 
- D 1 - I - 0x012402 04:A3F2: 63        .byte $63   ; 
- D 1 - I - 0x012403 04:A3F3: 79        .byte $79   ; 
- D 1 - I - 0x012404 04:A3F4: 7A        .byte $7A   ; 
- D 1 - I - 0x012405 04:A3F5: 66        .byte $66   ; 
- D 1 - I - 0x012406 04:A3F6: 36        .byte $36   ; 
- D 1 - I - 0x012407 04:A3F7: 53        .byte $53   ; 
- D 1 - I - 0x012408 04:A3F8: 37        .byte $37   ; 
- D 1 - I - 0x012409 04:A3F9: 0E        .byte $0E   ; 
- D 1 - I - 0x01240A 04:A3FA: 0F        .byte $0F   ; 
- D 1 - I - 0x01240B 04:A3FB: 54        .byte $54   ; 
- D 1 - I - 0x01240C 04:A3FC: 0D        .byte $0D   ; 
- D 1 - I - 0x01240D 04:A3FD: 05        .byte $05   ; 
- D 1 - I - 0x01240E 04:A3FE: 21        .byte $21   ; 
- D 1 - I - 0x01240F 04:A3FF: 4A        .byte $4A   ; 
- D 1 - I - 0x012410 04:A400: 0B        .byte $0B   ; 
- D 1 - I - 0x012411 04:A401: 51        .byte $51   ; 
- D 1 - I - 0x012412 04:A402: 26        .byte $26   ; 
- D 1 - I - 0x012413 04:A403: 05        .byte $05   ; 
- D 1 - I - 0x012414 04:A404: 04        .byte $04   ; 
- D 1 - I - 0x012415 04:A405: 0C        .byte $0C   ; 
- D 1 - I - 0x012416 04:A406: 3D        .byte $3D   ; 
- D 1 - I - 0x012417 04:A407: 55        .byte $55   ; 
- D 1 - I - 0x012418 04:A408: 00        .byte $00   ; 
- D 1 - I - 0x012419 04:A409: 00        .byte $00   ; 
- D 1 - I - 0x01241A 04:A40A: 39        .byte $39   ; 
- D 1 - I - 0x01241B 04:A40B: A0        .byte $A0   ; 
- D 1 - I - 0x01241C 04:A40C: 3E        .byte $3E   ; 
- D 1 - I - 0x01241D 04:A40D: 55        .byte $55   ; 
- D 1 - I - 0x01241E 04:A40E: 3B        .byte $3B   ; 
- D 1 - I - 0x01241F 04:A40F: 39        .byte $39   ; 
- D 1 - I - 0x012420 04:A410: 3A        .byte $3A   ; 
- D 1 - I - 0x012421 04:A411: 36        .byte $36   ; 
- D 1 - I - 0x012422 04:A412: A4        .byte $A4   ; 
- D 1 - I - 0x012423 04:A413: 9F        .byte $9F   ; 
- D 1 - I - 0x012424 04:A414: A1        .byte $A1   ; 
- D 1 - I - 0x012425 04:A415: 39        .byte $39   ; 
- D 1 - I - 0x012426 04:A416: 00        .byte $00   ; 
- D 1 - I - 0x012427 04:A417: 00        .byte $00   ; 
- D 1 - I - 0x012428 04:A418: 38        .byte $38   ; 
- D 1 - I - 0x012429 04:A419: 55        .byte $55   ; 
- D 1 - I - 0x01242A 04:A41A: 38        .byte $38   ; 
- D 1 - I - 0x01242B 04:A41B: 2D        .byte $2D   ; 
- D 1 - I - 0x01242C 04:A41C: 52        .byte $52   ; 
- D 1 - I - 0x01242D 04:A41D: 0F        .byte $0F   ; 
- D 1 - I - 0x01242E 04:A41E: 36        .byte $36   ; 
- D 1 - I - 0x01242F 04:A41F: 53        .byte $53   ; 
- D 1 - I - 0x012430 04:A420: 37        .byte $37   ; 
- D 1 - I - 0x012431 04:A421: 58        .byte $58   ; 
- D 1 - I - 0x012432 04:A422: 0F        .byte $0F   ; 
- D 1 - I - 0x012433 04:A423: 54        .byte $54   ; 
- D 1 - I - 0x012434 04:A424: 0D        .byte $0D   ; 
- D 1 - I - 0x012435 04:A425: 59        .byte $59   ; 
- D 1 - I - 0x012436 04:A426: 3E        .byte $3E   ; 
- D 1 - I - 0x012437 04:A427: 55        .byte $55   ; 
- D 1 - I - 0x012438 04:A428: 00        .byte $00   ; 
- D 1 - I - 0x012439 04:A429: 00        .byte $00   ; 
- D 1 - I - 0x01243A 04:A42A: 39        .byte $39   ; 
- D 1 - I - 0x01243B 04:A42B: A0        .byte $A0   ; 
- D 1 - I - 0x01243C 04:A42C: 3E        .byte $3E   ; 
- D 1 - I - 0x01243D 04:A42D: 55        .byte $55   ; 
- D 1 - I - 0x01243E 04:A42E: 3C        .byte $3C   ; 
- D 1 - I - 0x01243F 04:A42F: 39        .byte $39   ; 
- D 1 - I - 0x012440 04:A430: 3A        .byte $3A   ; 
- D 1 - I - 0x012441 04:A431: A0        .byte $A0   ; 
- D 1 - I - 0x012442 04:A432: A4        .byte $A4   ; 
- D 1 - I - 0x012443 04:A433: 9F        .byte $9F   ; 
- D 1 - I - 0x012444 04:A434: A1        .byte $A1   ; 
- D 1 - I - 0x012445 04:A435: 39        .byte $39   ; 
- D 1 - I - 0x012446 04:A436: 00        .byte $00   ; 
- D 1 - I - 0x012447 04:A437: 00        .byte $00   ; 
- D 1 - I - 0x012448 04:A438: 38        .byte $38   ; 
- D 1 - I - 0x012449 04:A439: 2D        .byte $2D   ; 
- D 1 - I - 0x01244A 04:A43A: 38        .byte $38   ; 
- D 1 - I - 0x01244B 04:A43B: 2D        .byte $2D   ; 
- D 1 - I - 0x01244C 04:A43C: 52        .byte $52   ; 
- D 1 - I - 0x01244D 04:A43D: 0F        .byte $0F   ; 
- D 1 - I - 0x01244E 04:A43E: 36        .byte $36   ; 
- D 1 - I - 0x01244F 04:A43F: 53        .byte $53   ; 
- D 1 - I - 0x012450 04:A440: 37        .byte $37   ; 
- D 1 - I - 0x012451 04:A441: 0E        .byte $0E   ; 
- D 1 - I - 0x012452 04:A442: 0F        .byte $0F   ; 
- D 1 - I - 0x012453 04:A443: 54        .byte $54   ; 
- D 1 - I - 0x012454 04:A444: 0D        .byte $0D   ; 
- D 1 - I - 0x012455 04:A445: 59        .byte $59   ; 
- D 1 - I - 0x012456 04:A446: 2D        .byte $2D   ; 
- D 1 - I - 0x012457 04:A447: A2        .byte $A2   ; 
- D 1 - I - 0x012458 04:A448: 2C        .byte $2C   ; 
- D 1 - I - 0x012459 04:A449: A2        .byte $A2   ; 
- D 1 - I - 0x01245A 04:A44A: A3        .byte $A3   ; 
- D 1 - I - 0x01245B 04:A44B: A3        .byte $A3   ; 
- D 1 - I - 0x01245C 04:A44C: A3        .byte $A3   ; 
- D 1 - I - 0x01245D 04:A44D: 1F        .byte $1F   ; 
- D 1 - I - 0x01245E 04:A44E: 27        .byte $27   ; 
- D 1 - I - 0x01245F 04:A44F: 03        .byte $03   ; 
- D 1 - I - 0x012460 04:A450: 0E        .byte $0E   ; 
- D 1 - I - 0x012461 04:A451: 07        .byte $07   ; 
- D 1 - I - 0x012462 04:A452: 26        .byte $26   ; 
- D 1 - I - 0x012463 04:A453: 50        .byte $50   ; 
- D 1 - I - 0x012464 04:A454: 07        .byte $07   ; 
- D 1 - I - 0x012465 04:A455: 4A        .byte $4A   ; 
- D 1 - I - 0x012466 04:A456: 2C        .byte $2C   ; 
- D 1 - I - 0x012467 04:A457: A2        .byte $A2   ; 
- D 1 - I - 0x012468 04:A458: 2C        .byte $2C   ; 
- D 1 - I - 0x012469 04:A459: A2        .byte $A2   ; 
- D 1 - I - 0x01246A 04:A45A: A3        .byte $A3   ; 
- D 1 - I - 0x01246B 04:A45B: A3        .byte $A3   ; 
- D 1 - I - 0x01246C 04:A45C: A3        .byte $A3   ; 
- D 1 - I - 0x01246D 04:A45D: 1F        .byte $1F   ; 
- D 1 - I - 0x01246E 04:A45E: 0D        .byte $0D   ; 
- D 1 - I - 0x01246F 04:A45F: 03        .byte $03   ; 
- D 1 - I - 0x012470 04:A460: 0E        .byte $0E   ; 
- D 1 - I - 0x012471 04:A461: 07        .byte $07   ; 
- D 1 - I - 0x012472 04:A462: 0A        .byte $0A   ; 
- D 1 - I - 0x012473 04:A463: 50        .byte $50   ; 
- D 1 - I - 0x012474 04:A464: 07        .byte $07   ; 
- D 1 - I - 0x012475 04:A465: 4A        .byte $4A   ; 
- D 1 - I - 0x012476 04:A466: 2C        .byte $2C   ; 
- D 1 - I - 0x012477 04:A467: A2        .byte $A2   ; 
- D 1 - I - 0x012478 04:A468: 2C        .byte $2C   ; 
- D 1 - I - 0x012479 04:A469: A2        .byte $A2   ; 
- D 1 - I - 0x01247A 04:A46A: 52        .byte $52   ; 
- D 1 - I - 0x01247B 04:A46B: A3        .byte $A3   ; 
- D 1 - I - 0x01247C 04:A46C: A3        .byte $A3   ; 
- D 1 - I - 0x01247D 04:A46D: 1F        .byte $1F   ; 
- D 1 - I - 0x01247E 04:A46E: 0D        .byte $0D   ; 
- D 1 - I - 0x01247F 04:A46F: 1E        .byte $1E   ; 
- D 1 - I - 0x012480 04:A470: 04        .byte $04   ; 
- D 1 - I - 0x012481 04:A471: 19        .byte $19   ; 
- D 1 - I - 0x012482 04:A472: 0A        .byte $0A   ; 
- D 1 - I - 0x012483 04:A473: 1A        .byte $1A   ; 
- D 1 - I - 0x012484 04:A474: 07        .byte $07   ; 
- D 1 - I - 0x012485 04:A475: 4A        .byte $4A   ; 
- D 1 - I - 0x012486 04:A476: 2C        .byte $2C   ; 
- D 1 - I - 0x012487 04:A477: A2        .byte $A2   ; 
- D 1 - I - 0x012488 04:A478: 2C        .byte $2C   ; 
- D 1 - I - 0x012489 04:A479: 3E        .byte $3E   ; 
- D 1 - I - 0x01248A 04:A47A: 52        .byte $52   ; 
- D 1 - I - 0x01248B 04:A47B: A3        .byte $A3   ; 
- D 1 - I - 0x01248C 04:A47C: A3        .byte $A3   ; 
- D 1 - I - 0x01248D 04:A47D: 1F        .byte $1F   ; 
- D 1 - I - 0x01248E 04:A47E: 0D        .byte $0D   ; 
- D 1 - I - 0x01248F 04:A47F: 1E        .byte $1E   ; 
- D 1 - I - 0x012490 04:A480: 04        .byte $04   ; 
- D 1 - I - 0x012491 04:A481: 19        .byte $19   ; 
- D 1 - I - 0x012492 04:A482: 0A        .byte $0A   ; 
- D 1 - I - 0x012493 04:A483: 1A        .byte $1A   ; 
- D 1 - I - 0x012494 04:A484: 07        .byte $07   ; 
- D 1 - I - 0x012495 04:A485: 4A        .byte $4A   ; 
- D 1 - I - 0x012496 04:A486: 22        .byte $22   ; 
- D 1 - I - 0x012497 04:A487: 24        .byte $24   ; 
- D 1 - I - 0x012498 04:A488: 25        .byte $25   ; 
- D 1 - I - 0x012499 04:A489: 20        .byte $20   ; 
- D 1 - I - 0x01249A 04:A48A: 00        .byte $00   ; 
- D 1 - I - 0x01249B 04:A48B: 00        .byte $00   ; 
- D 1 - I - 0x01249C 04:A48C: 00        .byte $00   ; 
- D 1 - I - 0x01249D 04:A48D: 00        .byte $00   ; 
- D 1 - I - 0x01249E 04:A48E: 00        .byte $00   ; 
- D 1 - I - 0x01249F 04:A48F: 00        .byte $00   ; 
- D 1 - I - 0x0124A0 04:A490: 00        .byte $00   ; 
- D 1 - I - 0x0124A1 04:A491: 00        .byte $00   ; 
- D 1 - I - 0x0124A2 04:A492: 00        .byte $00   ; 
- D 1 - I - 0x0124A3 04:A493: 00        .byte $00   ; 
- D 1 - I - 0x0124A4 04:A494: 00        .byte $00   ; 
- D 1 - I - 0x0124A5 04:A495: 00        .byte $00   ; 
- D 1 - I - 0x0124A6 04:A496: 22        .byte $22   ; 
- D 1 - I - 0x0124A7 04:A497: 24        .byte $24   ; 
- D 1 - I - 0x0124A8 04:A498: 25        .byte $25   ; 
- D 1 - I - 0x0124A9 04:A499: 20        .byte $20   ; 
- D 1 - I - 0x0124AA 04:A49A: 00        .byte $00   ; 
- D 1 - I - 0x0124AB 04:A49B: 00        .byte $00   ; 
- D 1 - I - 0x0124AC 04:A49C: 00        .byte $00   ; 
- D 1 - I - 0x0124AD 04:A49D: 00        .byte $00   ; 
- D 1 - I - 0x0124AE 04:A49E: 3E        .byte $3E   ; 
- D 1 - I - 0x0124AF 04:A49F: 55        .byte $55   ; 
- D 1 - I - 0x0124B0 04:A4A0: 00        .byte $00   ; 
- D 1 - I - 0x0124B1 04:A4A1: 00        .byte $00   ; 
- D 1 - I - 0x0124B2 04:A4A2: 39        .byte $39   ; 
- D 1 - I - 0x0124B3 04:A4A3: A0        .byte $A0   ; 
- D 1 - I - 0x0124B4 04:A4A4: 3E        .byte $3E   ; 
- D 1 - I - 0x0124B5 04:A4A5: 55        .byte $55   ; 
- D 1 - I - 0x0124B6 04:A4A6: 23        .byte $23   ; 
- D 1 - I - 0x0124B7 04:A4A7: 06        .byte $06   ; 
- D 1 - I - 0x0124B8 04:A4A8: 25        .byte $25   ; 
- D 1 - I - 0x0124B9 04:A4A9: 20        .byte $20   ; 
- D 1 - I - 0x0124BA 04:A4AA: 00        .byte $00   ; 
- D 1 - I - 0x0124BB 04:A4AB: 00        .byte $00   ; 
- D 1 - I - 0x0124BC 04:A4AC: 00        .byte $00   ; 
- D 1 - I - 0x0124BD 04:A4AD: 00        .byte $00   ; 
- D 1 - I - 0x0124BE 04:A4AE: 00        .byte $00   ; 
- D 1 - I - 0x0124BF 04:A4AF: 00        .byte $00   ; 
- D 1 - I - 0x0124C0 04:A4B0: 38        .byte $38   ; 
- D 1 - I - 0x0124C1 04:A4B1: 2D        .byte $2D   ; 
- D 1 - I - 0x0124C2 04:A4B2: 38        .byte $38   ; 
- D 1 - I - 0x0124C3 04:A4B3: 2D        .byte $2D   ; 
- D 1 - I - 0x0124C4 04:A4B4: 52        .byte $52   ; 
- D 1 - I - 0x0124C5 04:A4B5: 0F        .byte $0F   ; 
- D 1 - I - 0x0124C6 04:A4B6: 23        .byte $23   ; 
- D 1 - I - 0x0124C7 04:A4B7: 24        .byte $24   ; 
- D 1 - I - 0x0124C8 04:A4B8: 25        .byte $25   ; 
- D 1 - I - 0x0124C9 04:A4B9: 20        .byte $20   ; 
- D 1 - I - 0x0124CA 04:A4BA: 00        .byte $00   ; 
- D 1 - I - 0x0124CB 04:A4BB: 00        .byte $00   ; 
- D 1 - I - 0x0124CC 04:A4BC: 00        .byte $00   ; 
- D 1 - I - 0x0124CD 04:A4BD: 00        .byte $00   ; 
- D 1 - I - 0x0124CE 04:A4BE: 00        .byte $00   ; 
- D 1 - I - 0x0124CF 04:A4BF: 00        .byte $00   ; 
- D 1 - I - 0x0124D0 04:A4C0: 00        .byte $00   ; 
- D 1 - I - 0x0124D1 04:A4C1: 00        .byte $00   ; 
- D 1 - I - 0x0124D2 04:A4C2: 00        .byte $00   ; 
- D 1 - I - 0x0124D3 04:A4C3: 00        .byte $00   ; 
- D 1 - I - 0x0124D4 04:A4C4: 00        .byte $00   ; 
- D 1 - I - 0x0124D5 04:A4C5: 00        .byte $00   ; 
- D 1 - I - 0x0124D6 04:A4C6: 21        .byte $21   ; 
- D 1 - I - 0x0124D7 04:A4C7: 4A        .byte $4A   ; 
- D 1 - I - 0x0124D8 04:A4C8: 0B        .byte $0B   ; 
- D 1 - I - 0x0124D9 04:A4C9: 51        .byte $51   ; 
- D 1 - I - 0x0124DA 04:A4CA: 26        .byte $26   ; 
- D 1 - I - 0x0124DB 04:A4CB: 9C        .byte $9C   ; 
- D 1 - I - 0x0124DC 04:A4CC: 04        .byte $04   ; 
- D 1 - I - 0x0124DD 04:A4CD: 0C        .byte $0C   ; 
- D 1 - I - 0x0124DE 04:A4CE: 26        .byte $26   ; 
- D 1 - I - 0x0124DF 04:A4CF: 4F        .byte $4F   ; 
- D 1 - I - 0x0124E0 04:A4D0: 03        .byte $03   ; 
- D 1 - I - 0x0124E1 04:A4D1: 4C        .byte $4C   ; 
- D 1 - I - 0x0124E2 04:A4D2: 22        .byte $22   ; 
- D 1 - I - 0x0124E3 04:A4D3: 0A        .byte $0A   ; 
- D 1 - I - 0x0124E4 04:A4D4: 50        .byte $50   ; 
- D 1 - I - 0x0124E5 04:A4D5: 07        .byte $07   ; 
- D 1 - I - 0x0124E6 04:A4D6: 00        .byte $00   ; 
- D 1 - I - 0x0124E7 04:A4D7: 00        .byte $00   ; 
- D 1 - I - 0x0124E8 04:A4D8: 00        .byte $00   ; 
- D 1 - I - 0x0124E9 04:A4D9: 00        .byte $00   ; 
- D 1 - I - 0x0124EA 04:A4DA: 00        .byte $00   ; 
- D 1 - I - 0x0124EB 04:A4DB: 00        .byte $00   ; 
- D 1 - I - 0x0124EC 04:A4DC: 00        .byte $00   ; 
- D 1 - I - 0x0124ED 04:A4DD: 00        .byte $00   ; 
- D 1 - I - 0x0124EE 04:A4DE: 3D        .byte $3D   ; 
- D 1 - I - 0x0124EF 04:A4DF: 55        .byte $55   ; 
- D 1 - I - 0x0124F0 04:A4E0: 00        .byte $00   ; 
- D 1 - I - 0x0124F1 04:A4E1: 00        .byte $00   ; 
- D 1 - I - 0x0124F2 04:A4E2: 39        .byte $39   ; 
- D 1 - I - 0x0124F3 04:A4E3: A0        .byte $A0   ; 
- D 1 - I - 0x0124F4 04:A4E4: 3E        .byte $3E   ; 
- D 1 - I - 0x0124F5 04:A4E5: 55        .byte $55   ; 
- D 1 - I - 0x0124F6 04:A4E6: 00        .byte $00   ; 
- D 1 - I - 0x0124F7 04:A4E7: 00        .byte $00   ; 
- D 1 - I - 0x0124F8 04:A4E8: 00        .byte $00   ; 
- D 1 - I - 0x0124F9 04:A4E9: 00        .byte $00   ; 
- D 1 - I - 0x0124FA 04:A4EA: 00        .byte $00   ; 
- D 1 - I - 0x0124FB 04:A4EB: 00        .byte $00   ; 
- D 1 - I - 0x0124FC 04:A4EC: 00        .byte $00   ; 
- D 1 - I - 0x0124FD 04:A4ED: 00        .byte $00   ; 
- D 1 - I - 0x0124FE 04:A4EE: 00        .byte $00   ; 
- D 1 - I - 0x0124FF 04:A4EF: 00        .byte $00   ; 
- D 1 - I - 0x012500 04:A4F0: 38        .byte $38   ; 
- D 1 - I - 0x012501 04:A4F1: 55        .byte $55   ; 
- D 1 - I - 0x012502 04:A4F2: 38        .byte $38   ; 
- D 1 - I - 0x012503 04:A4F3: 2D        .byte $2D   ; 
- D 1 - I - 0x012504 04:A4F4: 52        .byte $52   ; 
- D 1 - I - 0x012505 04:A4F5: 0F        .byte $0F   ; 
- D 1 - I - 0x012506 04:A4F6: 03        .byte $03   ; 
- D 1 - I - 0x012507 04:A4F7: 4C        .byte $4C   ; 
- D 1 - I - 0x012508 04:A4F8: 0C        .byte $0C   ; 
- D 1 - I - 0x012509 04:A4F9: 56        .byte $56   ; 
- D 1 - I - 0x01250A 04:A4FA: 05        .byte $05   ; 
- D 1 - I - 0x01250B 04:A4FB: 07        .byte $07   ; 
- D 1 - I - 0x01250C 04:A4FC: 4C        .byte $4C   ; 
- D 1 - I - 0x01250D 04:A4FD: 59        .byte $59   ; 
- D 1 - I - 0x01250E 04:A4FE: 01        .byte $01   ; 
- D 1 - I - 0x01250F 04:A4FF: 4A        .byte $4A   ; 
- D 1 - I - 0x012510 04:A500: 05        .byte $05   ; 
- D 1 - I - 0x012511 04:A501: 56        .byte $56   ; 
- D 1 - I - 0x012512 04:A502: 04        .byte $04   ; 
- D 1 - I - 0x012513 04:A503: 05        .byte $05   ; 
- D 1 - I - 0x012514 04:A504: 06        .byte $06   ; 
- D 1 - I - 0x012515 04:A505: 57        .byte $57   ; 
- D 1 - I - 0x012516 04:A506: 21        .byte $21   ; 
- D 1 - I - 0x012517 04:A507: 4A        .byte $4A   ; 
- D 1 - I - 0x012518 04:A508: 03        .byte $03   ; 
- D 1 - I - 0x012519 04:A509: 4C        .byte $4C   ; 
- D 1 - I - 0x01251A 04:A50A: 22        .byte $22   ; 
- D 1 - I - 0x01251B 04:A50B: 0A        .byte $0A   ; 
- D 1 - I - 0x01251C 04:A50C: 50        .byte $50   ; 
- D 1 - I - 0x01251D 04:A50D: 07        .byte $07   ; 
- D 1 - I - 0x01251E 04:A50E: 00        .byte $00   ; 
- D 1 - I - 0x01251F 04:A50F: 23        .byte $23   ; 
- D 1 - I - 0x012520 04:A510: 23        .byte $23   ; 
- D 1 - I - 0x012521 04:A511: 25        .byte $25   ; 
- D 1 - I - 0x012522 04:A512: 00        .byte $00   ; 
- D 1 - I - 0x012523 04:A513: 00        .byte $00   ; 
- D 1 - I - 0x012524 04:A514: 00        .byte $00   ; 
- D 1 - I - 0x012525 04:A515: 00        .byte $00   ; 
- D 1 - I - 0x012526 04:A516: 0B        .byte $0B   ; 
- D 1 - I - 0x012527 04:A517: 51        .byte $51   ; 
- D 1 - I - 0x012528 04:A518: 08        .byte $08   ; 
- D 1 - I - 0x012529 04:A519: 05        .byte $05   ; 
- D 1 - I - 0x01252A 04:A51A: 04        .byte $04   ; 
- D 1 - I - 0x01252B 04:A51B: 05        .byte $05   ; 
- D 1 - I - 0x01252C 04:A51C: 4F        .byte $4F   ; 
- D 1 - I - 0x01252D 04:A51D: 03        .byte $03   ; 
- D 1 - I - 0x01252E 04:A51E: 22        .byte $22   ; 
- D 1 - I - 0x01252F 04:A51F: 23        .byte $23   ; 
- D 1 - I - 0x012530 04:A520: 24        .byte $24   ; 
- D 1 - I - 0x012531 04:A521: 25        .byte $25   ; 
- D 1 - I - 0x012532 04:A522: 00        .byte $00   ; 
- D 1 - I - 0x012533 04:A523: 00        .byte $00   ; 
- D 1 - I - 0x012534 04:A524: 00        .byte $00   ; 
- D 1 - I - 0x012535 04:A525: 00        .byte $00   ; 
- D 1 - I - 0x012536 04:A526: 09        .byte $09   ; 
- D 1 - I - 0x012537 04:A527: 03        .byte $03   ; 
- D 1 - I - 0x012538 04:A528: 1D        .byte $1D   ; 
- D 1 - I - 0x012539 04:A529: 05        .byte $05   ; 
- D 1 - I - 0x01253A 04:A52A: 0A        .byte $0A   ; 
- D 1 - I - 0x01253B 04:A52B: 50        .byte $50   ; 
- D 1 - I - 0x01253C 04:A52C: 07        .byte $07   ; 
- D 1 - I - 0x01253D 04:A52D: 4A        .byte $4A   ; 
- D 1 - I - 0x01253E 04:A52E: 23        .byte $23   ; 
- D 1 - I - 0x01253F 04:A52F: 24        .byte $24   ; 
- D 1 - I - 0x012540 04:A530: 25        .byte $25   ; 
- D 1 - I - 0x012541 04:A531: 20        .byte $20   ; 
- D 1 - I - 0x012542 04:A532: 00        .byte $00   ; 
- D 1 - I - 0x012543 04:A533: 00        .byte $00   ; 
- D 1 - I - 0x012544 04:A534: 00        .byte $00   ; 
- D 1 - I - 0x012545 04:A535: 00        .byte $00   ; 
- D 1 - I - 0x012546 04:A536: 01        .byte $01   ; 
- D 1 - I - 0x012547 04:A537: 4A        .byte $4A   ; 
- D 1 - I - 0x012548 04:A538: 09        .byte $09   ; 
- D 1 - I - 0x012549 04:A539: 56        .byte $56   ; 
- D 1 - I - 0x01254A 04:A53A: 04        .byte $04   ; 
- D 1 - I - 0x01254B 04:A53B: 05        .byte $05   ; 
- D 1 - I - 0x01254C 04:A53C: 0A        .byte $0A   ; 
- D 1 - I - 0x01254D 04:A53D: 57        .byte $57   ; 
- D 1 - I - 0x01254E 04:A53E: 23        .byte $23   ; 
- D 1 - I - 0x01254F 04:A53F: 25        .byte $25   ; 
- D 1 - I - 0x012550 04:A540: 20        .byte $20   ; 
- D 1 - I - 0x012551 04:A541: 00        .byte $00   ; 
- D 1 - I - 0x012552 04:A542: 00        .byte $00   ; 
- D 1 - I - 0x012553 04:A543: 00        .byte $00   ; 
- D 1 - I - 0x012554 04:A544: 00        .byte $00   ; 
- D 1 - I - 0x012555 04:A545: 00        .byte $00   ; 
- D 1 - I - 0x012556 04:A546: 36        .byte $36   ; 
- D 1 - I - 0x012557 04:A547: 53        .byte $53   ; 
- D 1 - I - 0x012558 04:A548: 37        .byte $37   ; 
- D 1 - I - 0x012559 04:A549: 0E        .byte $0E   ; 
- D 1 - I - 0x01255A 04:A54A: 0F        .byte $0F   ; 
- D 1 - I - 0x01255B 04:A54B: 54        .byte $54   ; 
- D 1 - I - 0x01255C 04:A54C: 0E        .byte $0E   ; 
- D 1 - I - 0x01255D 04:A54D: 5A        .byte $5A   ; 
- D 1 - I - 0x01255E 04:A54E: 20        .byte $20   ; 
- D 1 - I - 0x01255F 04:A54F: 24        .byte $24   ; 
- D 1 - I - 0x012560 04:A550: 23        .byte $23   ; 
- D 1 - I - 0x012561 04:A551: 25        .byte $25   ; 
- D 1 - I - 0x012562 04:A552: 00        .byte $00   ; 
- D 1 - I - 0x012563 04:A553: 00        .byte $00   ; 
- D 1 - I - 0x012564 04:A554: 00        .byte $00   ; 
- D 1 - I - 0x012565 04:A555: 00        .byte $00   ; 
- D 1 - I - 0x012566 04:A556: 3C        .byte $3C   ; 
- D 1 - I - 0x012567 04:A557: 39        .byte $39   ; 
- D 1 - I - 0x012568 04:A558: 3A        .byte $3A   ; 
- D 1 - I - 0x012569 04:A559: 36        .byte $36   ; 
- D 1 - I - 0x01256A 04:A55A: 5A        .byte $5A   ; 
- D 1 - I - 0x01256B 04:A55B: 1E        .byte $1E   ; 
- D 1 - I - 0x01256C 04:A55C: A1        .byte $A1   ; 
- D 1 - I - 0x01256D 04:A55D: 39        .byte $39   ; 
- D 1 - I - 0x01256E 04:A55E: 24        .byte $24   ; 
- D 1 - I - 0x01256F 04:A55F: 23        .byte $23   ; 
- D 1 - I - 0x012570 04:A560: 24        .byte $24   ; 
- D 1 - I - 0x012571 04:A561: 25        .byte $25   ; 
- D 1 - I - 0x012572 04:A562: 00        .byte $00   ; 
- D 1 - I - 0x012573 04:A563: 00        .byte $00   ; 
- D 1 - I - 0x012574 04:A564: 00        .byte $00   ; 
- D 1 - I - 0x012575 04:A565: 00        .byte $00   ; 
- D 1 - I - 0x012576 04:A566: 3B        .byte $3B   ; 
- D 1 - I - 0x012577 04:A567: 39        .byte $39   ; 
- D 1 - I - 0x012578 04:A568: 3A        .byte $3A   ; 
- D 1 - I - 0x012579 04:A569: 36        .byte $36   ; 
- D 1 - I - 0x01257A 04:A56A: A4        .byte $A4   ; 
- D 1 - I - 0x01257B 04:A56B: 9F        .byte $9F   ; 
- D 1 - I - 0x01257C 04:A56C: A1        .byte $A1   ; 
- D 1 - I - 0x01257D 04:A56D: 39        .byte $39   ; 
- D 1 - I - 0x01257E 04:A56E: 26        .byte $26   ; 
- D 1 - I - 0x01257F 04:A56F: 4C        .byte $4C   ; 
- D 1 - I - 0x012580 04:A570: 0C        .byte $0C   ; 
- D 1 - I - 0x012581 04:A571: 4F        .byte $4F   ; 
- D 1 - I - 0x012582 04:A572: 22        .byte $22   ; 
- D 1 - I - 0x012583 04:A573: 07        .byte $07   ; 
- D 1 - I - 0x012584 04:A574: 4C        .byte $4C   ; 
- D 1 - I - 0x012585 04:A575: 1A        .byte $1A   ; 
- D 1 - I - 0x012586 04:A576: 36        .byte $36   ; 
- D 1 - I - 0x012587 04:A577: 53        .byte $53   ; 
- D 1 - I - 0x012588 04:A578: 37        .byte $37   ; 
- D 1 - I - 0x012589 04:A579: 58        .byte $58   ; 
- D 1 - I - 0x01258A 04:A57A: 0F        .byte $0F   ; 
- D 1 - I - 0x01258B 04:A57B: 54        .byte $54   ; 
- D 1 - I - 0x01258C 04:A57C: 0D        .byte $0D   ; 
- D 1 - I - 0x01258D 04:A57D: 25        .byte $25   ; 
- D 1 - I - 0x01258E 04:A57E: 1A        .byte $1A   ; 
- D 1 - I - 0x01258F 04:A57F: 9B        .byte $9B   ; 
- D 1 - I - 0x012590 04:A580: 0B        .byte $0B   ; 
- D 1 - I - 0x012591 04:A581: 56        .byte $56   ; 
- D 1 - I - 0x012592 04:A582: 04        .byte $04   ; 
- D 1 - I - 0x012593 04:A583: 1A        .byte $1A   ; 
- D 1 - I - 0x012594 04:A584: 04        .byte $04   ; 
- D 1 - I - 0x012595 04:A585: 57        .byte $57   ; 
- D 1 - I - 0x012596 04:A586: 36        .byte $36   ; 
- D 1 - I - 0x012597 04:A587: 53        .byte $53   ; 
- D 1 - I - 0x012598 04:A588: 37        .byte $37   ; 
- D 1 - I - 0x012599 04:A589: 0E        .byte $0E   ; 
- D 1 - I - 0x01259A 04:A58A: 0F        .byte $0F   ; 
- D 1 - I - 0x01259B 04:A58B: 54        .byte $54   ; 
- D 1 - I - 0x01259C 04:A58C: 0D        .byte $0D   ; 
- D 1 - I - 0x01259D 04:A58D: 05        .byte $05   ; 
- D 1 - I - 0x01259E 04:A58E: 1C        .byte $1C   ; 
- D 1 - I - 0x01259F 04:A58F: 9D        .byte $9D   ; 
- D 1 - I - 0x0125A0 04:A590: 0A        .byte $0A   ; 
- D 1 - I - 0x0125A1 04:A591: 50        .byte $50   ; 
- D 1 - I - 0x0125A2 04:A592: 25        .byte $25   ; 
- D 1 - I - 0x0125A3 04:A593: 20        .byte $20   ; 
- D 1 - I - 0x0125A4 04:A594: 23        .byte $23   ; 
- D 1 - I - 0x0125A5 04:A595: 24        .byte $24   ; 
- D 1 - I - 0x0125A6 04:A596: 3C        .byte $3C   ; 
- D 1 - I - 0x0125A7 04:A597: 39        .byte $39   ; 
- D 1 - I - 0x0125A8 04:A598: 3A        .byte $3A   ; 
- D 1 - I - 0x0125A9 04:A599: 36        .byte $36   ; 
- D 1 - I - 0x0125AA 04:A59A: 05        .byte $05   ; 
- D 1 - I - 0x0125AB 04:A59B: 9F        .byte $9F   ; 
- D 1 - I - 0x0125AC 04:A59C: A1        .byte $A1   ; 
- D 1 - I - 0x0125AD 04:A59D: 39        .byte $39   ; 
- D 1 - I - 0x0125AE 04:A59E: 0A        .byte $0A   ; 
- D 1 - I - 0x0125AF 04:A59F: 50        .byte $50   ; 
- D 1 - I - 0x0125B0 04:A5A0: 07        .byte $07   ; 
- D 1 - I - 0x0125B1 04:A5A1: 4A        .byte $4A   ; 
- D 1 - I - 0x0125B2 04:A5A2: 23        .byte $23   ; 
- D 1 - I - 0x0125B3 04:A5A3: 24        .byte $24   ; 
- D 1 - I - 0x0125B4 04:A5A4: 25        .byte $25   ; 
- D 1 - I - 0x0125B5 04:A5A5: 20        .byte $20   ; 
- D 1 - I - 0x0125B6 04:A5A6: 3B        .byte $3B   ; 
- D 1 - I - 0x0125B7 04:A5A7: 39        .byte $39   ; 
- D 1 - I - 0x0125B8 04:A5A8: 3A        .byte $3A   ; 
- D 1 - I - 0x0125B9 04:A5A9: 36        .byte $36   ; 
- D 1 - I - 0x0125BA 04:A5AA: A4        .byte $A4   ; 
- D 1 - I - 0x0125BB 04:A5AB: 1E        .byte $1E   ; 
- D 1 - I - 0x0125BC 04:A5AC: A1        .byte $A1   ; 
- D 1 - I - 0x0125BD 04:A5AD: 39        .byte $39   ; 
- D 1 - I - 0x0125BE 04:A5AE: 26        .byte $26   ; 
- D 1 - I - 0x0125BF 04:A5AF: 05        .byte $05   ; 
- D 1 - I - 0x0125C0 04:A5B0: 0C        .byte $0C   ; 
- D 1 - I - 0x0125C1 04:A5B1: 4F        .byte $4F   ; 
- D 1 - I - 0x0125C2 04:A5B2: 22        .byte $22   ; 
- D 1 - I - 0x0125C3 04:A5B3: 23        .byte $23   ; 
- D 1 - I - 0x0125C4 04:A5B4: 24        .byte $24   ; 
- D 1 - I - 0x0125C5 04:A5B5: 25        .byte $25   ; 
- D 1 - I - 0x0125C6 04:A5B6: 36        .byte $36   ; 
- D 1 - I - 0x0125C7 04:A5B7: 53        .byte $53   ; 
- D 1 - I - 0x0125C8 04:A5B8: 37        .byte $37   ; 
- D 1 - I - 0x0125C9 04:A5B9: 58        .byte $58   ; 
- D 1 - I - 0x0125CA 04:A5BA: 0F        .byte $0F   ; 
- D 1 - I - 0x0125CB 04:A5BB: 54        .byte $54   ; 
- D 1 - I - 0x0125CC 04:A5BC: 0D        .byte $0D   ; 
- D 1 - I - 0x0125CD 04:A5BD: 25        .byte $25   ; 
- D 1 - I - 0x0125CE 04:A5BE: 1A        .byte $1A   ; 
- D 1 - I - 0x0125CF 04:A5BF: 07        .byte $07   ; 
- D 1 - I - 0x0125D0 04:A5C0: 05        .byte $05   ; 
- D 1 - I - 0x0125D1 04:A5C1: 56        .byte $56   ; 
- D 1 - I - 0x0125D2 04:A5C2: 23        .byte $23   ; 
- D 1 - I - 0x0125D3 04:A5C3: 24        .byte $24   ; 
- D 1 - I - 0x0125D4 04:A5C4: 23        .byte $23   ; 
- D 1 - I - 0x0125D5 04:A5C5: 57        .byte $57   ; 
- D 1 - I - 0x0125D6 04:A5C6: 08        .byte $08   ; 
- D 1 - I - 0x0125D7 04:A5C7: 4D        .byte $4D   ; 
- D 1 - I - 0x0125D8 04:A5C8: 09        .byte $09   ; 
- D 1 - I - 0x0125D9 04:A5C9: 03        .byte $03   ; 
- D 1 - I - 0x0125DA 04:A5CA: 4F        .byte $4F   ; 
- D 1 - I - 0x0125DB 04:A5CB: 03        .byte $03   ; 
- D 1 - I - 0x0125DC 04:A5CC: 0A        .byte $0A   ; 
- D 1 - I - 0x0125DD 04:A5CD: 50        .byte $50   ; 
- D 1 - I - 0x0125DE 04:A5CE: 1A        .byte $1A   ; 
- D 1 - I - 0x0125DF 04:A5CF: 9A        .byte $9A   ; 
- D 1 - I - 0x0125E0 04:A5D0: 1B        .byte $1B   ; 
- D 1 - I - 0x0125E1 04:A5D1: 9B        .byte $9B   ; 
- D 1 - I - 0x0125E2 04:A5D2: 9D        .byte $9D   ; 
- D 1 - I - 0x0125E3 04:A5D3: 9E        .byte $9E   ; 
- D 1 - I - 0x0125E4 04:A5D4: 1C        .byte $1C   ; 
- D 1 - I - 0x0125E5 04:A5D5: 9D        .byte $9D   ; 
- D 1 - I - 0x0125E6 04:A5D6: 01        .byte $01   ; 
- D 1 - I - 0x0125E7 04:A5D7: 4A        .byte $4A   ; 
- D 1 - I - 0x0125E8 04:A5D8: 19        .byte $19   ; 
- D 1 - I - 0x0125E9 04:A5D9: 99        .byte $99   ; 
- D 1 - I - 0x0125EA 04:A5DA: 04        .byte $04   ; 
- D 1 - I - 0x0125EB 04:A5DB: 05        .byte $05   ; 
- D 1 - I - 0x0125EC 04:A5DC: 06        .byte $06   ; 
- D 1 - I - 0x0125ED 04:A5DD: 9C        .byte $9C   ; 
- D 1 - I - 0x0125EE 04:A5DE: 08        .byte $08   ; 
- D 1 - I - 0x0125EF 04:A5DF: 4D        .byte $4D   ; 
- D 1 - I - 0x0125F0 04:A5E0: 09        .byte $09   ; 
- D 1 - I - 0x0125F1 04:A5E1: 03        .byte $03   ; 
- D 1 - I - 0x0125F2 04:A5E2: 4F        .byte $4F   ; 
- D 1 - I - 0x0125F3 04:A5E3: 03        .byte $03   ; 
- D 1 - I - 0x0125F4 04:A5E4: 0A        .byte $0A   ; 
- D 1 - I - 0x0125F5 04:A5E5: 50        .byte $50   ; 
- D 1 - I - 0x0125F6 04:A5E6: 02        .byte $02   ; 
- D 1 - I - 0x0125F7 04:A5E7: 4B        .byte $4B   ; 
- D 1 - I - 0x0125F8 04:A5E8: 03        .byte $03   ; 
- D 1 - I - 0x0125F9 04:A5E9: 4C        .byte $4C   ; 
- D 1 - I - 0x0125FA 04:A5EA: 4D        .byte $4D   ; 
- D 1 - I - 0x0125FB 04:A5EB: 4E        .byte $4E   ; 
- D 1 - I - 0x0125FC 04:A5EC: 05        .byte $05   ; 
- D 1 - I - 0x0125FD 04:A5ED: 07        .byte $07   ; 
- D 1 - I - 0x0125FE 04:A5EE: 1D        .byte $1D   ; 
- D 1 - I - 0x0125FF 04:A5EF: 05        .byte $05   ; 
- D 1 - I - 0x012600 04:A5F0: 01        .byte $01   ; 
- D 1 - I - 0x012601 04:A5F1: 4A        .byte $4A   ; 
- D 1 - I - 0x012602 04:A5F2: 07        .byte $07   ; 
- D 1 - I - 0x012603 04:A5F3: 4A        .byte $4A   ; 
- D 1 - I - 0x012604 04:A5F4: 04        .byte $04   ; 
- D 1 - I - 0x012605 04:A5F5: 05        .byte $05   ; 
- D 1 - I - 0x012606 04:A5F6: 1A        .byte $1A   ; 
- D 1 - I - 0x012607 04:A5F7: 9A        .byte $9A   ; 
- D 1 - I - 0x012608 04:A5F8: 1B        .byte $1B   ; 
- D 1 - I - 0x012609 04:A5F9: 9B        .byte $9B   ; 
- D 1 - I - 0x01260A 04:A5FA: 9D        .byte $9D   ; 
- D 1 - I - 0x01260B 04:A5FB: 9E        .byte $9E   ; 
- D 1 - I - 0x01260C 04:A5FC: 1C        .byte $1C   ; 
- D 1 - I - 0x01260D 04:A5FD: 9D        .byte $9D   ; 
- D 1 - I - 0x01260E 04:A5FE: 19        .byte $19   ; 
- D 1 - I - 0x01260F 04:A5FF: 99        .byte $99   ; 
- D 1 - I - 0x012610 04:A600: 02        .byte $02   ; 
- D 1 - I - 0x012611 04:A601: 4B        .byte $4B   ; 
- D 1 - I - 0x012612 04:A602: 06        .byte $06   ; 
- D 1 - I - 0x012613 04:A603: 9C        .byte $9C   ; 
- D 1 - I - 0x012614 04:A604: 05        .byte $05   ; 
- D 1 - I - 0x012615 04:A605: 4E        .byte $4E   ; 
- D 1 - I - 0x012616 04:A606: 00        .byte $00   ; 
- D 1 - I - 0x012617 04:A607: 00        .byte $00   ; 
- D 1 - I - 0x012618 04:A608: 00        .byte $00   ; 
- D 1 - I - 0x012619 04:A609: 00        .byte $00   ; 
- D 1 - I - 0x01261A 04:A60A: 00        .byte $00   ; 
- D 1 - I - 0x01261B 04:A60B: 00        .byte $00   ; 
- D 1 - I - 0x01261C 04:A60C: 00        .byte $00   ; 
- D 1 - I - 0x01261D 04:A60D: 00        .byte $00   ; 
- D 1 - I - 0x01261E 04:A60E: 00        .byte $00   ; 
- D 1 - I - 0x01261F 04:A60F: 00        .byte $00   ; 
- D 1 - I - 0x012620 04:A610: 38        .byte $38   ; 
- D 1 - I - 0x012621 04:A611: 2D        .byte $2D   ; 
- D 1 - I - 0x012622 04:A612: 38        .byte $38   ; 
- D 1 - I - 0x012623 04:A613: 2D        .byte $2D   ; 
- D 1 - I - 0x012624 04:A614: 52        .byte $52   ; 
- D 1 - I - 0x012625 04:A615: 0F        .byte $0F   ; 
- D 1 - I - 0x012626 04:A616: 00        .byte $00   ; 
- D 1 - I - 0x012627 04:A617: 00        .byte $00   ; 
- D 1 - I - 0x012628 04:A618: 38        .byte $38   ; 
- D 1 - I - 0x012629 04:A619: 2D        .byte $2D   ; 
- D 1 - I - 0x01262A 04:A61A: 38        .byte $38   ; 
- D 1 - I - 0x01262B 04:A61B: 2D        .byte $2D   ; 
- D 1 - I - 0x01262C 04:A61C: 52        .byte $52   ; 
- D 1 - I - 0x01262D 04:A61D: 0F        .byte $0F   ; 
- D 1 - I - 0x01262E 04:A61E: 36        .byte $36   ; 
- D 1 - I - 0x01262F 04:A61F: 53        .byte $53   ; 
- D 1 - I - 0x012630 04:A620: 37        .byte $37   ; 
- D 1 - I - 0x012631 04:A621: 0E        .byte $0E   ; 
- D 1 - I - 0x012632 04:A622: 0F        .byte $0F   ; 
- D 1 - I - 0x012633 04:A623: 54        .byte $54   ; 
- D 1 - I - 0x012634 04:A624: 0D        .byte $0D   ; 
- D 1 - I - 0x012635 04:A625: 05        .byte $05   ; 
- - - - - - 0x012636 04:A626: 0B        .byte $0B   ; 
- - - - - - 0x012637 04:A627: 51        .byte $51   ; 
- - - - - - 0x012638 04:A628: 08        .byte $08   ; 
- - - - - - 0x012639 04:A629: 4D        .byte $4D   ; 
- - - - - - 0x01263A 04:A62A: 04        .byte $04   ; 
- - - - - - 0x01263B 04:A62B: 0C        .byte $0C   ; 
- - - - - - 0x01263C 04:A62C: 4F        .byte $4F   ; 
- - - - - - 0x01263D 04:A62D: 03        .byte $03   ; 
- - - - - - 0x01263E 04:A62E: 03        .byte $03   ; 
- - - - - - 0x01263F 04:A62F: 4C        .byte $4C   ; 
- - - - - - 0x012640 04:A630: 1A        .byte $1A   ; 
- - - - - - 0x012641 04:A631: 9A        .byte $9A   ; 
- - - - - - 0x012642 04:A632: 05        .byte $05   ; 
- - - - - - 0x012643 04:A633: 07        .byte $07   ; 
- - - - - - 0x012644 04:A634: 9D        .byte $9D   ; 
- - - - - - 0x012645 04:A635: 9E        .byte $9E   ; 
- D 1 - I - 0x012646 04:A636: 09        .byte $09   ; 
- D 1 - I - 0x012647 04:A637: 03        .byte $03   ; 
- D 1 - I - 0x012648 04:A638: 1D        .byte $1D   ; 
- D 1 - I - 0x012649 04:A639: 05        .byte $05   ; 
- D 1 - I - 0x01264A 04:A63A: 0A        .byte $0A   ; 
- D 1 - I - 0x01264B 04:A63B: 50        .byte $50   ; 
- D 1 - I - 0x01264C 04:A63C: 07        .byte $07   ; 
- D 1 - I - 0x01264D 04:A63D: 4A        .byte $4A   ; 
- D 1 - I - 0x01264E 04:A63E: 1B        .byte $1B   ; 
- D 1 - I - 0x01264F 04:A63F: 9B        .byte $9B   ; 
- D 1 - I - 0x012650 04:A640: 0B        .byte $0B   ; 
- D 1 - I - 0x012651 04:A641: 51        .byte $51   ; 
- D 1 - I - 0x012652 04:A642: 1C        .byte $1C   ; 
- D 1 - I - 0x012653 04:A643: 9D        .byte $9D   ; 
- D 1 - I - 0x012654 04:A644: 04        .byte $04   ; 
- D 1 - I - 0x012655 04:A645: 0C        .byte $0C   ; 
- D 1 - I - 0x012656 04:A646: 36        .byte $36   ; 
- D 1 - I - 0x012657 04:A647: 53        .byte $53   ; 
- D 1 - I - 0x012658 04:A648: 37        .byte $37   ; 
- D 1 - I - 0x012659 04:A649: 0E        .byte $0E   ; 
- D 1 - I - 0x01265A 04:A64A: 0F        .byte $0F   ; 
- D 1 - I - 0x01265B 04:A64B: 54        .byte $54   ; 
- D 1 - I - 0x01265C 04:A64C: 0E        .byte $0E   ; 
- D 1 - I - 0x01265D 04:A64D: 05        .byte $05   ; 
- D 1 - I - 0x01265E 04:A64E: 0B        .byte $0B   ; 
- D 1 - I - 0x01265F 04:A64F: 4A        .byte $4A   ; 
- D 1 - I - 0x012660 04:A650: 0B        .byte $0B   ; 
- D 1 - I - 0x012661 04:A651: 51        .byte $51   ; 
- D 1 - I - 0x012662 04:A652: 04        .byte $04   ; 
- D 1 - I - 0x012663 04:A653: 0C        .byte $0C   ; 
- D 1 - I - 0x012664 04:A654: 04        .byte $04   ; 
- D 1 - I - 0x012665 04:A655: 0C        .byte $0C   ; 
- D 1 - I - 0x012666 04:A656: 3C        .byte $3C   ; 
- D 1 - I - 0x012667 04:A657: 39        .byte $39   ; 
- D 1 - I - 0x012668 04:A658: 3A        .byte $3A   ; 
- D 1 - I - 0x012669 04:A659: 36        .byte $36   ; 
- D 1 - I - 0x01266A 04:A65A: 05        .byte $05   ; 
- D 1 - I - 0x01266B 04:A65B: 9F        .byte $9F   ; 
- D 1 - I - 0x01266C 04:A65C: A1        .byte $A1   ; 
- D 1 - I - 0x01266D 04:A65D: 39        .byte $39   ; 
- D 1 - I - 0x01266E 04:A65E: 03        .byte $03   ; 
- D 1 - I - 0x01266F 04:A65F: 4C        .byte $4C   ; 
- D 1 - I - 0x012670 04:A660: 1A        .byte $1A   ; 
- D 1 - I - 0x012671 04:A661: 05        .byte $05   ; 
- D 1 - I - 0x012672 04:A662: 05        .byte $05   ; 
- D 1 - I - 0x012673 04:A663: 07        .byte $07   ; 
- D 1 - I - 0x012674 04:A664: 9D        .byte $9D   ; 
- D 1 - I - 0x012675 04:A665: 9E        .byte $9E   ; 
- D 1 - I - 0x012676 04:A666: 3E        .byte $3E   ; 
- D 1 - I - 0x012677 04:A667: 55        .byte $55   ; 
- D 1 - I - 0x012678 04:A668: 00        .byte $00   ; 
- D 1 - I - 0x012679 04:A669: 00        .byte $00   ; 
- D 1 - I - 0x01267A 04:A66A: 39        .byte $39   ; 
- D 1 - I - 0x01267B 04:A66B: A0        .byte $A0   ; 
- D 1 - I - 0x01267C 04:A66C: 3E        .byte $3E   ; 
- D 1 - I - 0x01267D 04:A66D: 55        .byte $55   ; 
- D 1 - I - 0x01267E 04:A66E: 3C        .byte $3C   ; 
- D 1 - I - 0x01267F 04:A66F: 39        .byte $39   ; 
- D 1 - I - 0x012680 04:A670: 3A        .byte $3A   ; 
- D 1 - I - 0x012681 04:A671: 36        .byte $36   ; 
- D 1 - I - 0x012682 04:A672: 05        .byte $05   ; 
- D 1 - I - 0x012683 04:A673: 9F        .byte $9F   ; 
- D 1 - I - 0x012684 04:A674: A1        .byte $A1   ; 
- D 1 - I - 0x012685 04:A675: 39        .byte $39   ; 
- D 1 - I - 0x012686 04:A676: 00        .byte $00   ; 
- D 1 - I - 0x012687 04:A677: 00        .byte $00   ; 
- D 1 - I - 0x012688 04:A678: 00        .byte $00   ; 
- D 1 - I - 0x012689 04:A679: 00        .byte $00   ; 
- D 1 - I - 0x01268A 04:A67A: 00        .byte $00   ; 
- D 1 - I - 0x01268B 04:A67B: 00        .byte $00   ; 
- D 1 - I - 0x01268C 04:A67C: 00        .byte $00   ; 
- D 1 - I - 0x01268D 04:A67D: 00        .byte $00   ; 
- D 1 - I - 0x01268E 04:A67E: 3E        .byte $3E   ; 
- D 1 - I - 0x01268F 04:A67F: 55        .byte $55   ; 
- D 1 - I - 0x012690 04:A680: 00        .byte $00   ; 
- D 1 - I - 0x012691 04:A681: 00        .byte $00   ; 
- D 1 - I - 0x012692 04:A682: 39        .byte $39   ; 
- D 1 - I - 0x012693 04:A683: A0        .byte $A0   ; 
- D 1 - I - 0x012694 04:A684: 3E        .byte $3E   ; 
- D 1 - I - 0x012695 04:A685: 55        .byte $55   ; 
- D 1 - I - 0x012696 04:A686: 26        .byte $26   ; 
- D 1 - I - 0x012697 04:A687: 0B        .byte $0B   ; 
- D 1 - I - 0x012698 04:A688: 03        .byte $03   ; 
- D 1 - I - 0x012699 04:A689: 4C        .byte $4C   ; 
- D 1 - I - 0x01269A 04:A68A: 21        .byte $21   ; 
- D 1 - I - 0x01269B 04:A68B: 04        .byte $04   ; 
- D 1 - I - 0x01269C 04:A68C: 50        .byte $50   ; 
- D 1 - I - 0x01269D 04:A68D: 07        .byte $07   ; 
- D 1 - I - 0x01269E 04:A68E: 22        .byte $22   ; 
- D 1 - I - 0x01269F 04:A68F: 08        .byte $08   ; 
- D 1 - I - 0x0126A0 04:A690: 05        .byte $05   ; 
- D 1 - I - 0x0126A1 04:A691: 06        .byte $06   ; 
- D 1 - I - 0x0126A2 04:A692: 00        .byte $00   ; 
- D 1 - I - 0x0126A3 04:A693: 22        .byte $22   ; 
- D 1 - I - 0x0126A4 04:A694: 23        .byte $23   ; 
- D 1 - I - 0x0126A5 04:A695: 4A        .byte $4A   ; 
- D 1 - I - 0x0126A6 04:A696: 0B        .byte $0B   ; 
- D 1 - I - 0x0126A7 04:A697: 51        .byte $51   ; 
- D 1 - I - 0x0126A8 04:A698: 08        .byte $08   ; 
- D 1 - I - 0x0126A9 04:A699: 4D        .byte $4D   ; 
- D 1 - I - 0x0126AA 04:A69A: 04        .byte $04   ; 
- D 1 - I - 0x0126AB 04:A69B: 0C        .byte $0C   ; 
- D 1 - I - 0x0126AC 04:A69C: 4F        .byte $4F   ; 
- D 1 - I - 0x0126AD 04:A69D: 03        .byte $03   ; 
- D 1 - I - 0x0126AE 04:A69E: 03        .byte $03   ; 
- D 1 - I - 0x0126AF 04:A69F: 02        .byte $02   ; 
- D 1 - I - 0x0126B0 04:A6A0: 1A        .byte $1A   ; 
- D 1 - I - 0x0126B1 04:A6A1: 05        .byte $05   ; 
- D 1 - I - 0x0126B2 04:A6A2: 20        .byte $20   ; 
- D 1 - I - 0x0126B3 04:A6A3: 23        .byte $23   ; 
- D 1 - I - 0x0126B4 04:A6A4: 25        .byte $25   ; 
- D 1 - I - 0x0126B5 04:A6A5: 20        .byte $20   ; 
- D 1 - I - 0x0126B6 04:A6A6: 09        .byte $09   ; 
- D 1 - I - 0x0126B7 04:A6A7: 03        .byte $03   ; 
- D 1 - I - 0x0126B8 04:A6A8: 1D        .byte $1D   ; 
- D 1 - I - 0x0126B9 04:A6A9: 05        .byte $05   ; 
- D 1 - I - 0x0126BA 04:A6AA: 0A        .byte $0A   ; 
- D 1 - I - 0x0126BB 04:A6AB: 50        .byte $50   ; 
- D 1 - I - 0x0126BC 04:A6AC: 07        .byte $07   ; 
- D 1 - I - 0x0126BD 04:A6AD: 4A        .byte $4A   ; 
- D 1 - I - 0x0126BE 04:A6AE: 1B        .byte $1B   ; 
- D 1 - I - 0x0126BF 04:A6AF: 05        .byte $05   ; 
- D 1 - I - 0x0126C0 04:A6B0: 06        .byte $06   ; 
- D 1 - I - 0x0126C1 04:A6B1: 51        .byte $51   ; 
- D 1 - I - 0x0126C2 04:A6B2: 24        .byte $24   ; 
- D 1 - I - 0x0126C3 04:A6B3: 23        .byte $23   ; 
- D 1 - I - 0x0126C4 04:A6B4: 25        .byte $25   ; 
- D 1 - I - 0x0126C5 04:A6B5: 20        .byte $20   ; 
- D 1 - I - 0x0126C6 04:A6B6: 27        .byte $27   ; 
- D 1 - I - 0x0126C7 04:A6B7: 03        .byte $03   ; 
- D 1 - I - 0x0126C8 04:A6B8: 0E        .byte $0E   ; 
- D 1 - I - 0x0126C9 04:A6B9: 07        .byte $07   ; 
- D 1 - I - 0x0126CA 04:A6BA: 00        .byte $00   ; 
- D 1 - I - 0x0126CB 04:A6BB: 20        .byte $20   ; 
- D 1 - I - 0x0126CC 04:A6BC: 23        .byte $23   ; 
- D 1 - I - 0x0126CD 04:A6BD: 24        .byte $24   ; 
- D 1 - I - 0x0126CE 04:A6BE: 3E        .byte $3E   ; 
- D 1 - I - 0x0126CF 04:A6BF: 55        .byte $55   ; 
- D 1 - I - 0x0126D0 04:A6C0: 00        .byte $00   ; 
- D 1 - I - 0x0126D1 04:A6C1: 22        .byte $22   ; 
- D 1 - I - 0x0126D2 04:A6C2: 39        .byte $39   ; 
- D 1 - I - 0x0126D3 04:A6C3: A0        .byte $A0   ; 
- D 1 - I - 0x0126D4 04:A6C4: 3E        .byte $3E   ; 
- D 1 - I - 0x0126D5 04:A6C5: 55        .byte $55   ; 
- D 1 - I - 0x0126D6 04:A6C6: 0D        .byte $0D   ; 
- D 1 - I - 0x0126D7 04:A6C7: 1E        .byte $1E   ; 
- D 1 - I - 0x0126D8 04:A6C8: 04        .byte $04   ; 
- D 1 - I - 0x0126D9 04:A6C9: 19        .byte $19   ; 
- D 1 - I - 0x0126DA 04:A6CA: 0A        .byte $0A   ; 
- D 1 - I - 0x0126DB 04:A6CB: 1A        .byte $1A   ; 
- D 1 - I - 0x0126DC 04:A6CC: 07        .byte $07   ; 
- D 1 - I - 0x0126DD 04:A6CD: 4A        .byte $4A   ; 
- D 1 - I - 0x0126DE 04:A6CE: 24        .byte $24   ; 
- D 1 - I - 0x0126DF 04:A6CF: 06        .byte $06   ; 
- D 1 - I - 0x0126E0 04:A6D0: 25        .byte $25   ; 
- D 1 - I - 0x0126E1 04:A6D1: 20        .byte $20   ; 
- D 1 - I - 0x0126E2 04:A6D2: 00        .byte $00   ; 
- D 1 - I - 0x0126E3 04:A6D3: 00        .byte $00   ; 
- D 1 - I - 0x0126E4 04:A6D4: 00        .byte $00   ; 
- D 1 - I - 0x0126E5 04:A6D5: 00        .byte $00   ; 
- D 1 - I - 0x0126E6 04:A6D6: 0D        .byte $0D   ; 
- D 1 - I - 0x0126E7 04:A6D7: 03        .byte $03   ; 
- D 1 - I - 0x0126E8 04:A6D8: 0E        .byte $0E   ; 
- D 1 - I - 0x0126E9 04:A6D9: 07        .byte $07   ; 
- D 1 - I - 0x0126EA 04:A6DA: 0A        .byte $0A   ; 
- D 1 - I - 0x0126EB 04:A6DB: 50        .byte $50   ; 
- D 1 - I - 0x0126EC 04:A6DC: 07        .byte $07   ; 
- D 1 - I - 0x0126ED 04:A6DD: 4A        .byte $4A   ; 
- D 1 - I - 0x0126EE 04:A6DE: 23        .byte $23   ; 
- D 1 - I - 0x0126EF 04:A6DF: 24        .byte $24   ; 
- D 1 - I - 0x0126F0 04:A6E0: 25        .byte $25   ; 
- D 1 - I - 0x0126F1 04:A6E1: 20        .byte $20   ; 
- D 1 - I - 0x0126F2 04:A6E2: 00        .byte $00   ; 
- D 1 - I - 0x0126F3 04:A6E3: 00        .byte $00   ; 
- D 1 - I - 0x0126F4 04:A6E4: 00        .byte $00   ; 
- D 1 - I - 0x0126F5 04:A6E5: 00        .byte $00   ; 
- D 1 - I - 0x0126F6 04:A6E6: 35        .byte $35   ; 
- D 1 - I - 0x0126F7 04:A6E7: A2        .byte $A2   ; 
- D 1 - I - 0x0126F8 04:A6E8: 35        .byte $35   ; 
- D 1 - I - 0x0126F9 04:A6E9: A2        .byte $A2   ; 
- D 1 - I - 0x0126FA 04:A6EA: A3        .byte $A3   ; 
- D 1 - I - 0x0126FB 04:A6EB: A3        .byte $A3   ; 
- D 1 - I - 0x0126FC 04:A6EC: A3        .byte $A3   ; 
- D 1 - I - 0x0126FD 04:A6ED: 1F        .byte $1F   ; 
- D 1 - I - 0x0126FE 04:A6EE: 33        .byte $33   ; 
- D 1 - I - 0x0126FF 04:A6EF: 03        .byte $03   ; 
- D 1 - I - 0x012700 04:A6F0: 34        .byte $34   ; 
- D 1 - I - 0x012701 04:A6F1: 07        .byte $07   ; 
- D 1 - I - 0x012702 04:A6F2: 0A        .byte $0A   ; 
- D 1 - I - 0x012703 04:A6F3: 50        .byte $50   ; 
- D 1 - I - 0x012704 04:A6F4: 07        .byte $07   ; 
- D 1 - I - 0x012705 04:A6F5: 4A        .byte $4A   ; 
- D 1 - I - 0x012706 04:A6F6: 35        .byte $35   ; 
- D 1 - I - 0x012707 04:A6F7: A2        .byte $A2   ; 
- D 1 - I - 0x012708 04:A6F8: 35        .byte $35   ; 
- D 1 - I - 0x012709 04:A6F9: A2        .byte $A2   ; 
- D 1 - I - 0x01270A 04:A6FA: 52        .byte $52   ; 
- D 1 - I - 0x01270B 04:A6FB: A3        .byte $A3   ; 
- D 1 - I - 0x01270C 04:A6FC: A3        .byte $A3   ; 
- D 1 - I - 0x01270D 04:A6FD: 1F        .byte $1F   ; 
- D 1 - I - 0x01270E 04:A6FE: 33        .byte $33   ; 
- D 1 - I - 0x01270F 04:A6FF: 1E        .byte $1E   ; 
- D 1 - I - 0x012710 04:A700: 2F        .byte $2F   ; 
- D 1 - I - 0x012711 04:A701: 19        .byte $19   ; 
- D 1 - I - 0x012712 04:A702: 0A        .byte $0A   ; 
- D 1 - I - 0x012713 04:A703: 1A        .byte $1A   ; 
- D 1 - I - 0x012714 04:A704: 07        .byte $07   ; 
- D 1 - I - 0x012715 04:A705: 4A        .byte $4A   ; 
- D 1 - I - 0x012716 04:A706: B6        .byte $B6   ; 
- D 1 - I - 0x012717 04:A707: B7        .byte $B7   ; 
- D 1 - I - 0x012718 04:A708: B7        .byte $B7   ; 
- D 1 - I - 0x012719 04:A709: B8        .byte $B8   ; 
- D 1 - I - 0x01271A 04:A70A: A3        .byte $A3   ; 
- D 1 - I - 0x01271B 04:A70B: A3        .byte $A3   ; 
- D 1 - I - 0x01271C 04:A70C: A3        .byte $A3   ; 
- D 1 - I - 0x01271D 04:A70D: 1F        .byte $1F   ; 
- - - - - - 0x01271E 04:A70E: 27        .byte $27   ; 
- - - - - - 0x01271F 04:A70F: 03        .byte $03   ; 
- - - - - - 0x012720 04:A710: 0E        .byte $0E   ; 
- - - - - - 0x012721 04:A711: 07        .byte $07   ; 
- - - - - - 0x012722 04:A712: 26        .byte $26   ; 
- - - - - - 0x012723 04:A713: 50        .byte $50   ; 
- - - - - - 0x012724 04:A714: 07        .byte $07   ; 
- - - - - - 0x012725 04:A715: 4A        .byte $4A   ; 
- D 1 - I - 0x012726 04:A716: B6        .byte $B6   ; 
- D 1 - I - 0x012727 04:A717: A5        .byte $A5   ; 
- D 1 - I - 0x012728 04:A718: A5        .byte $A5   ; 
- D 1 - I - 0x012729 04:A719: A6        .byte $A6   ; 
- D 1 - I - 0x01272A 04:A71A: A3        .byte $A3   ; 
- D 1 - I - 0x01272B 04:A71B: A3        .byte $A3   ; 
- D 1 - I - 0x01272C 04:A71C: A3        .byte $A3   ; 
- D 1 - I - 0x01272D 04:A71D: 1F        .byte $1F   ; 
- - - - - - 0x01272E 04:A71E: 27        .byte $27   ; 
- - - - - - 0x01272F 04:A71F: 03        .byte $03   ; 
- - - - - - 0x012730 04:A720: 0E        .byte $0E   ; 
- - - - - - 0x012731 04:A721: 07        .byte $07   ; 
- - - - - - 0x012732 04:A722: 26        .byte $26   ; 
- - - - - - 0x012733 04:A723: 50        .byte $50   ; 
- - - - - - 0x012734 04:A724: 07        .byte $07   ; 
- - - - - - 0x012735 04:A725: 4A        .byte $4A   ; 
- D 1 - I - 0x012736 04:A726: 30        .byte $30   ; 
- D 1 - I - 0x012737 04:A727: 4B        .byte $4B   ; 
- D 1 - I - 0x012738 04:A728: 2F        .byte $2F   ; 
- D 1 - I - 0x012739 04:A729: 4C        .byte $4C   ; 
- D 1 - I - 0x01273A 04:A72A: 4D        .byte $4D   ; 
- D 1 - I - 0x01273B 04:A72B: 4E        .byte $4E   ; 
- D 1 - I - 0x01273C 04:A72C: 05        .byte $05   ; 
- D 1 - I - 0x01273D 04:A72D: 07        .byte $07   ; 
- - - - - - 0x01273E 04:A72E: 31        .byte $31   ; 
- - - - - - 0x01273F 04:A72F: 05        .byte $05   ; 
- - - - - - 0x012740 04:A730: 2E        .byte $2E   ; 
- - - - - - 0x012741 04:A731: 4A        .byte $4A   ; 
- - - - - - 0x012742 04:A732: 07        .byte $07   ; 
- - - - - - 0x012743 04:A733: 4A        .byte $4A   ; 
- - - - - - 0x012744 04:A734: 04        .byte $04   ; 
- - - - - - 0x012745 04:A735: 05        .byte $05   ; 
- D 1 - I - 0x012746 04:A736: 32        .byte $32   ; 
- D 1 - I - 0x012747 04:A737: 03        .byte $03   ; 
- D 1 - I - 0x012748 04:A738: 31        .byte $31   ; 
- D 1 - I - 0x012749 04:A739: 05        .byte $05   ; 
- D 1 - I - 0x01274A 04:A73A: 0A        .byte $0A   ; 
- D 1 - I - 0x01274B 04:A73B: 50        .byte $50   ; 
- D 1 - I - 0x01274C 04:A73C: 07        .byte $07   ; 
- D 1 - I - 0x01274D 04:A73D: 4A        .byte $4A   ; 
- - - - - - 0x01274E 04:A73E: 31        .byte $31   ; 
- - - - - - 0x01274F 04:A73F: 9B        .byte $9B   ; 
- - - - - - 0x012750 04:A740: 32        .byte $32   ; 
- - - - - - 0x012751 04:A741: 51        .byte $51   ; 
- - - - - - 0x012752 04:A742: 1C        .byte $1C   ; 
- - - - - - 0x012753 04:A743: 9D        .byte $9D   ; 
- - - - - - 0x012754 04:A744: 04        .byte $04   ; 
- - - - - - 0x012755 04:A745: 0C        .byte $0C   ; 
- D 1 - I - 0x012756 04:A746: 00        .byte $00   ; 
- D 1 - I - 0x012757 04:A747: 00        .byte $00   ; 
- D 1 - I - 0x012758 04:A748: 00        .byte $00   ; 
- D 1 - I - 0x012759 04:A749: 00        .byte $00   ; 
- D 1 - I - 0x01275A 04:A74A: 00        .byte $00   ; 
- D 1 - I - 0x01275B 04:A74B: 00        .byte $00   ; 
- D 1 - I - 0x01275C 04:A74C: 00        .byte $00   ; 
- D 1 - I - 0x01275D 04:A74D: 00        .byte $00   ; 
- D 1 - I - 0x01275E 04:A74E: 00        .byte $00   ; 
- D 1 - I - 0x01275F 04:A74F: C0        .byte $C0   ; 
- D 1 - I - 0x012760 04:A750: C1        .byte $C1   ; 
- D 1 - I - 0x012761 04:A751: A9        .byte $A9   ; 
- D 1 - I - 0x012762 04:A752: C2        .byte $C2   ; 
- D 1 - I - 0x012763 04:A753: C3        .byte $C3   ; 
- D 1 - I - 0x012764 04:A754: C4        .byte $C4   ; 
- D 1 - I - 0x012765 04:A755: AD        .byte $AD   ; 
- D 1 - I - 0x012766 04:A756: 00        .byte $00   ; 
- D 1 - I - 0x012767 04:A757: 00        .byte $00   ; 
- D 1 - I - 0x012768 04:A758: 00        .byte $00   ; 
- D 1 - I - 0x012769 04:A759: 00        .byte $00   ; 
- D 1 - I - 0x01276A 04:A75A: B9        .byte $B9   ; 
- D 1 - I - 0x01276B 04:A75B: BA        .byte $BA   ; 
- D 1 - I - 0x01276C 04:A75C: A8        .byte $A8   ; 
- D 1 - I - 0x01276D 04:A75D: A9        .byte $A9   ; 
- D 1 - I - 0x01276E 04:A75E: BB        .byte $BB   ; 
- D 1 - I - 0x01276F 04:A75F: BC        .byte $BC   ; 
- D 1 - I - 0x012770 04:A760: BD        .byte $BD   ; 
- D 1 - I - 0x012771 04:A761: AD        .byte $AD   ; 
- D 1 - I - 0x012772 04:A762: BE        .byte $BE   ; 
- D 1 - I - 0x012773 04:A763: BF        .byte $BF   ; 
- D 1 - I - 0x012774 04:A764: B0        .byte $B0   ; 
- D 1 - I - 0x012775 04:A765: B1        .byte $B1   ; 
- D 1 - I - 0x012776 04:A766: 00        .byte $00   ; 
- D 1 - I - 0x012777 04:A767: A7        .byte $A7   ; 
- D 1 - I - 0x012778 04:A768: A8        .byte $A8   ; 
- D 1 - I - 0x012779 04:A769: A9        .byte $A9   ; 
- D 1 - I - 0x01277A 04:A76A: AA        .byte $AA   ; 
- D 1 - I - 0x01277B 04:A76B: AB        .byte $AB   ; 
- D 1 - I - 0x01277C 04:A76C: AC        .byte $AC   ; 
- D 1 - I - 0x01277D 04:A76D: AD        .byte $AD   ; 
- D 1 - I - 0x01277E 04:A76E: AE        .byte $AE   ; 
- D 1 - I - 0x01277F 04:A76F: AF        .byte $AF   ; 
- D 1 - I - 0x012780 04:A770: B0        .byte $B0   ; 
- D 1 - I - 0x012781 04:A771: B1        .byte $B1   ; 
- D 1 - I - 0x012782 04:A772: B2        .byte $B2   ; 
- D 1 - I - 0x012783 04:A773: B3        .byte $B3   ; 
- D 1 - I - 0x012784 04:A774: B4        .byte $B4   ; 
- D 1 - I - 0x012785 04:A775: B5        .byte $B5   ; 
- D 1 - I - 0x012786 04:A776: B9        .byte $B9   ; 
- D 1 - I - 0x012787 04:A777: BA        .byte $BA   ; 
- D 1 - I - 0x012788 04:A778: A8        .byte $A8   ; 
- D 1 - I - 0x012789 04:A779: A9        .byte $A9   ; 
- D 1 - I - 0x01278A 04:A77A: BB        .byte $BB   ; 
- D 1 - I - 0x01278B 04:A77B: BC        .byte $BC   ; 
- D 1 - I - 0x01278C 04:A77C: BD        .byte $BD   ; 
- D 1 - I - 0x01278D 04:A77D: AD        .byte $AD   ; 
- D 1 - I - 0x01278E 04:A77E: BE        .byte $BE   ; 
- D 1 - I - 0x01278F 04:A77F: BF        .byte $BF   ; 
- D 1 - I - 0x012790 04:A780: B0        .byte $B0   ; 
- D 1 - I - 0x012791 04:A781: B1        .byte $B1   ; 
- D 1 - I - 0x012792 04:A782: B2        .byte $B2   ; 
- D 1 - I - 0x012793 04:A783: B3        .byte $B3   ; 
- D 1 - I - 0x012794 04:A784: B4        .byte $B4   ; 
- D 1 - I - 0x012795 04:A785: B5        .byte $B5   ; 
- D 1 - I - 0x012796 04:A786: 00        .byte $00   ; 
- D 1 - I - 0x012797 04:A787: C0        .byte $C0   ; 
- D 1 - I - 0x012798 04:A788: C1        .byte $C1   ; 
- D 1 - I - 0x012799 04:A789: A9        .byte $A9   ; 
- D 1 - I - 0x01279A 04:A78A: C2        .byte $C2   ; 
- D 1 - I - 0x01279B 04:A78B: C3        .byte $C3   ; 
- D 1 - I - 0x01279C 04:A78C: C4        .byte $C4   ; 
- D 1 - I - 0x01279D 04:A78D: AD        .byte $AD   ; 
- D 1 - I - 0x01279E 04:A78E: BE        .byte $BE   ; 
- D 1 - I - 0x01279F 04:A78F: BF        .byte $BF   ; 
- D 1 - I - 0x0127A0 04:A790: B0        .byte $B0   ; 
- D 1 - I - 0x0127A1 04:A791: B1        .byte $B1   ; 
- D 1 - I - 0x0127A2 04:A792: B2        .byte $B2   ; 
- D 1 - I - 0x0127A3 04:A793: B3        .byte $B3   ; 
- D 1 - I - 0x0127A4 04:A794: B4        .byte $B4   ; 
- D 1 - I - 0x0127A5 04:A795: B5        .byte $B5   ; 
- D 1 - I - 0x0127A6 04:A796: D6        .byte $D6   ; 
- D 1 - I - 0x0127A7 04:A797: B7        .byte $B7   ; 
- D 1 - I - 0x0127A8 04:A798: B7        .byte $B7   ; 
- D 1 - I - 0x0127A9 04:A799: D5        .byte $D5   ; 
- D 1 - I - 0x0127AA 04:A79A: 52        .byte $52   ; 
- D 1 - I - 0x0127AB 04:A79B: A3        .byte $A3   ; 
- D 1 - I - 0x0127AC 04:A79C: A3        .byte $A3   ; 
- D 1 - I - 0x0127AD 04:A79D: 1F        .byte $1F   ; 
- D 1 - I - 0x0127AE 04:A79E: 0D        .byte $0D   ; 
- D 1 - I - 0x0127AF 04:A79F: 1E        .byte $1E   ; 
- D 1 - I - 0x0127B0 04:A7A0: 04        .byte $04   ; 
- D 1 - I - 0x0127B1 04:A7A1: 19        .byte $19   ; 
- D 1 - I - 0x0127B2 04:A7A2: 0A        .byte $0A   ; 
- D 1 - I - 0x0127B3 04:A7A3: 1A        .byte $1A   ; 
- D 1 - I - 0x0127B4 04:A7A4: 07        .byte $07   ; 
- D 1 - I - 0x0127B5 04:A7A5: 4A        .byte $4A   ; 
- D 1 - I - 0x0127B6 04:A7A6: C5        .byte $C5   ; 
- D 1 - I - 0x0127B7 04:A7A7: A5        .byte $A5   ; 
- D 1 - I - 0x0127B8 04:A7A8: A5        .byte $A5   ; 
- D 1 - I - 0x0127B9 04:A7A9: D5        .byte $D5   ; 
- D 1 - I - 0x0127BA 04:A7AA: 52        .byte $52   ; 
- D 1 - I - 0x0127BB 04:A7AB: A3        .byte $A3   ; 
- D 1 - I - 0x0127BC 04:A7AC: A3        .byte $A3   ; 
- D 1 - I - 0x0127BD 04:A7AD: 1F        .byte $1F   ; 
- D 1 - I - 0x0127BE 04:A7AE: 0D        .byte $0D   ; 
- D 1 - I - 0x0127BF 04:A7AF: 1E        .byte $1E   ; 
- D 1 - I - 0x0127C0 04:A7B0: 04        .byte $04   ; 
- D 1 - I - 0x0127C1 04:A7B1: 19        .byte $19   ; 
- D 1 - I - 0x0127C2 04:A7B2: 0A        .byte $0A   ; 
- D 1 - I - 0x0127C3 04:A7B3: 1A        .byte $1A   ; 
- D 1 - I - 0x0127C4 04:A7B4: 07        .byte $07   ; 
- D 1 - I - 0x0127C5 04:A7B5: 4A        .byte $4A   ; 
- D 1 - I - 0x0127C6 04:A7B6: 00        .byte $00   ; 
- D 1 - I - 0x0127C7 04:A7B7: 00        .byte $00   ; 
- D 1 - I - 0x0127C8 04:A7B8: 00        .byte $00   ; 
- D 1 - I - 0x0127C9 04:A7B9: 00        .byte $00   ; 
- D 1 - I - 0x0127CA 04:A7BA: 00        .byte $00   ; 
- D 1 - I - 0x0127CB 04:A7BB: 00        .byte $00   ; 
- D 1 - I - 0x0127CC 04:A7BC: 00        .byte $00   ; 
- D 1 - I - 0x0127CD 04:A7BD: 00        .byte $00   ; 
- D 1 - I - 0x0127CE 04:A7BE: C8        .byte $C8   ; 
- D 1 - I - 0x0127CF 04:A7BF: DF        .byte $DF   ; 
- D 1 - I - 0x0127D0 04:A7C0: DE        .byte $DE   ; 
- D 1 - I - 0x0127D1 04:A7C1: 00        .byte $00   ; 
- D 1 - I - 0x0127D2 04:A7C2: CC        .byte $CC   ; 
- D 1 - I - 0x0127D3 04:A7C3: E2        .byte $E2   ; 
- D 1 - I - 0x0127D4 04:A7C4: E1        .byte $E1   ; 
- D 1 - I - 0x0127D5 04:A7C5: E0        .byte $E0   ; 
- D 1 - I - 0x0127D6 04:A7C6: 00        .byte $00   ; 
- D 1 - I - 0x0127D7 04:A7C7: 00        .byte $00   ; 
- D 1 - I - 0x0127D8 04:A7C8: 00        .byte $00   ; 
- D 1 - I - 0x0127D9 04:A7C9: 00        .byte $00   ; 
- D 1 - I - 0x0127DA 04:A7CA: C8        .byte $C8   ; 
- D 1 - I - 0x0127DB 04:A7CB: C7        .byte $C7   ; 
- D 1 - I - 0x0127DC 04:A7CC: D8        .byte $D8   ; 
- D 1 - I - 0x0127DD 04:A7CD: D7        .byte $D7   ; 
- D 1 - I - 0x0127DE 04:A7CE: CC        .byte $CC   ; 
- D 1 - I - 0x0127DF 04:A7CF: DB        .byte $DB   ; 
- D 1 - I - 0x0127E0 04:A7D0: DA        .byte $DA   ; 
- D 1 - I - 0x0127E1 04:A7D1: D9        .byte $D9   ; 
- D 1 - I - 0x0127E2 04:A7D2: D0        .byte $D0   ; 
- D 1 - I - 0x0127E3 04:A7D3: CF        .byte $CF   ; 
- D 1 - I - 0x0127E4 04:A7D4: DD        .byte $DD   ; 
- D 1 - I - 0x0127E5 04:A7D5: DC        .byte $DC   ; 
- D 1 - I - 0x0127E6 04:A7D6: C8        .byte $C8   ; 
- D 1 - I - 0x0127E7 04:A7D7: C7        .byte $C7   ; 
- D 1 - I - 0x0127E8 04:A7D8: C6        .byte $C6   ; 
- D 1 - I - 0x0127E9 04:A7D9: 00        .byte $00   ; 
- D 1 - I - 0x0127EA 04:A7DA: CC        .byte $CC   ; 
- D 1 - I - 0x0127EB 04:A7DB: CB        .byte $CB   ; 
- D 1 - I - 0x0127EC 04:A7DC: CA        .byte $CA   ; 
- D 1 - I - 0x0127ED 04:A7DD: C9        .byte $C9   ; 
- D 1 - I - 0x0127EE 04:A7DE: D0        .byte $D0   ; 
- D 1 - I - 0x0127EF 04:A7DF: CF        .byte $CF   ; 
- D 1 - I - 0x0127F0 04:A7E0: CE        .byte $CE   ; 
- D 1 - I - 0x0127F1 04:A7E1: CD        .byte $CD   ; 
- D 1 - I - 0x0127F2 04:A7E2: D4        .byte $D4   ; 
- D 1 - I - 0x0127F3 04:A7E3: D3        .byte $D3   ; 
- D 1 - I - 0x0127F4 04:A7E4: D2        .byte $D2   ; 
- D 1 - I - 0x0127F5 04:A7E5: D1        .byte $D1   ; 
- D 1 - I - 0x0127F6 04:A7E6: C8        .byte $C8   ; 
- D 1 - I - 0x0127F7 04:A7E7: C7        .byte $C7   ; 
- D 1 - I - 0x0127F8 04:A7E8: D8        .byte $D8   ; 
- D 1 - I - 0x0127F9 04:A7E9: D7        .byte $D7   ; 
- D 1 - I - 0x0127FA 04:A7EA: CC        .byte $CC   ; 
- D 1 - I - 0x0127FB 04:A7EB: DB        .byte $DB   ; 
- D 1 - I - 0x0127FC 04:A7EC: DA        .byte $DA   ; 
- D 1 - I - 0x0127FD 04:A7ED: D9        .byte $D9   ; 
- D 1 - I - 0x0127FE 04:A7EE: D0        .byte $D0   ; 
- D 1 - I - 0x0127FF 04:A7EF: CF        .byte $CF   ; 
- D 1 - I - 0x012800 04:A7F0: DD        .byte $DD   ; 
- D 1 - I - 0x012801 04:A7F1: DC        .byte $DC   ; 
- D 1 - I - 0x012802 04:A7F2: D4        .byte $D4   ; 
- D 1 - I - 0x012803 04:A7F3: D3        .byte $D3   ; 
- D 1 - I - 0x012804 04:A7F4: D2        .byte $D2   ; 
- D 1 - I - 0x012805 04:A7F5: D1        .byte $D1   ; 
- D 1 - I - 0x012806 04:A7F6: C8        .byte $C8   ; 
- D 1 - I - 0x012807 04:A7F7: DF        .byte $DF   ; 
- D 1 - I - 0x012808 04:A7F8: DE        .byte $DE   ; 
- D 1 - I - 0x012809 04:A7F9: 00        .byte $00   ; 
- D 1 - I - 0x01280A 04:A7FA: CC        .byte $CC   ; 
- D 1 - I - 0x01280B 04:A7FB: E2        .byte $E2   ; 
- D 1 - I - 0x01280C 04:A7FC: E1        .byte $E1   ; 
- D 1 - I - 0x01280D 04:A7FD: E0        .byte $E0   ; 
- D 1 - I - 0x01280E 04:A7FE: D0        .byte $D0   ; 
- D 1 - I - 0x01280F 04:A7FF: CF        .byte $CF   ; 
- D 1 - I - 0x012810 04:A800: DD        .byte $DD   ; 
- D 1 - I - 0x012811 04:A801: DC        .byte $DC   ; 
- D 1 - I - 0x012812 04:A802: D4        .byte $D4   ; 
- D 1 - I - 0x012813 04:A803: D3        .byte $D3   ; 
- D 1 - I - 0x012814 04:A804: D2        .byte $D2   ; 
- D 1 - I - 0x012815 04:A805: D1        .byte $D1   ; 
- D 1 - I - 0x012816 04:A806: 00        .byte $00   ; 
- D 1 - I - 0x012817 04:A807: 00        .byte $00   ; 
- D 1 - I - 0x012818 04:A808: 00        .byte $00   ; 
- D 1 - I - 0x012819 04:A809: 00        .byte $00   ; 
- D 1 - I - 0x01281A 04:A80A: 00        .byte $00   ; 
- D 1 - I - 0x01281B 04:A80B: 00        .byte $00   ; 
- D 1 - I - 0x01281C 04:A80C: 13        .byte $13   ; 
- D 1 - I - 0x01281D 04:A80D: 12        .byte $12   ; 
- D 1 - I - 0x01281E 04:A80E: 13        .byte $13   ; 
- D 1 - I - 0x01281F 04:A80F: 16        .byte $16   ; 
- D 1 - I - 0x012820 04:A810: 14        .byte $14   ; 
- D 1 - I - 0x012821 04:A811: 14        .byte $14   ; 
- D 1 - I - 0x012822 04:A812: 10        .byte $10   ; 
- D 1 - I - 0x012823 04:A813: 11        .byte $11   ; 
- D 1 - I - 0x012824 04:A814: 15        .byte $15   ; 
- D 1 - I - 0x012825 04:A815: 18        .byte $18   ; 
- D 1 - I - 0x012826 04:A816: 00        .byte $00   ; 
- D 1 - I - 0x012827 04:A817: 13        .byte $13   ; 
- D 1 - I - 0x012828 04:A818: 13        .byte $13   ; 
- D 1 - I - 0x012829 04:A819: 16        .byte $16   ; 
- D 1 - I - 0x01282A 04:A81A: 16        .byte $16   ; 
- D 1 - I - 0x01282B 04:A81B: 10        .byte $10   ; 
- D 1 - I - 0x01282C 04:A81C: 14        .byte $14   ; 
- D 1 - I - 0x01282D 04:A81D: 14        .byte $14   ; 
- D 1 - I - 0x01282E 04:A81E: 11        .byte $11   ; 
- D 1 - I - 0x01282F 04:A81F: 18        .byte $18   ; 
- D 1 - I - 0x012830 04:A820: 10        .byte $10   ; 
- D 1 - I - 0x012831 04:A821: 11        .byte $11   ; 
- D 1 - I - 0x012832 04:A822: 00        .byte $00   ; 
- D 1 - I - 0x012833 04:A823: 00        .byte $00   ; 
- D 1 - I - 0x012834 04:A824: 00        .byte $00   ; 
- D 1 - I - 0x012835 04:A825: 00        .byte $00   ; 
- D 1 - I - 0x012836 04:A826: 16        .byte $16   ; 
- D 1 - I - 0x012837 04:A827: 12        .byte $12   ; 
- D 1 - I - 0x012838 04:A828: 17        .byte $17   ; 
- D 1 - I - 0x012839 04:A829: 00        .byte $00   ; 
- D 1 - I - 0x01283A 04:A82A: 14        .byte $14   ; 
- D 1 - I - 0x01283B 04:A82B: 14        .byte $14   ; 
- D 1 - I - 0x01283C 04:A82C: 14        .byte $14   ; 
- D 1 - I - 0x01283D 04:A82D: 17        .byte $17   ; 
- D 1 - I - 0x01283E 04:A82E: 15        .byte $15   ; 
- D 1 - I - 0x01283F 04:A82F: 11        .byte $11   ; 
- D 1 - I - 0x012840 04:A830: 18        .byte $18   ; 
- D 1 - I - 0x012841 04:A831: 00        .byte $00   ; 
- D 1 - I - 0x012842 04:A832: 00        .byte $00   ; 
- D 1 - I - 0x012843 04:A833: 00        .byte $00   ; 
- D 1 - I - 0x012844 04:A834: 00        .byte $00   ; 
- D 1 - I - 0x012845 04:A835: 00        .byte $00   ; 
- D 1 - I - 0x012846 04:A836: 00        .byte $00   ; 
- D 1 - I - 0x012847 04:A837: 00        .byte $00   ; 
- D 1 - I - 0x012848 04:A838: 00        .byte $00   ; 
- D 1 - I - 0x012849 04:A839: 00        .byte $00   ; 
- D 1 - I - 0x01284A 04:A83A: 00        .byte $00   ; 
- D 1 - I - 0x01284B 04:A83B: 13        .byte $13   ; 
- D 1 - I - 0x01284C 04:A83C: 16        .byte $16   ; 
- D 1 - I - 0x01284D 04:A83D: 17        .byte $17   ; 
- D 1 - I - 0x01284E 04:A83E: 10        .byte $10   ; 
- D 1 - I - 0x01284F 04:A83F: 15        .byte $15   ; 
- D 1 - I - 0x012850 04:A840: 11        .byte $11   ; 
- D 1 - I - 0x012851 04:A841: 18        .byte $18   ; 
- D 1 - I - 0x012852 04:A842: 00        .byte $00   ; 
- D 1 - I - 0x012853 04:A843: 00        .byte $00   ; 
- D 1 - I - 0x012854 04:A844: 00        .byte $00   ; 
- D 1 - I - 0x012855 04:A845: 00        .byte $00   ; 
- D 1 - I - 0x012856 04:A846: 13        .byte $13   ; 
- D 1 - I - 0x012857 04:A847: 16        .byte $16   ; 
- D 1 - I - 0x012858 04:A848: 12        .byte $12   ; 
- D 1 - I - 0x012859 04:A849: 17        .byte $17   ; 
- D 1 - I - 0x01285A 04:A84A: 10        .byte $10   ; 
- D 1 - I - 0x01285B 04:A84B: 15        .byte $15   ; 
- D 1 - I - 0x01285C 04:A84C: 11        .byte $11   ; 
- D 1 - I - 0x01285D 04:A84D: 13        .byte $13   ; 
- D 1 - I - 0x01285E 04:A84E: 00        .byte $00   ; 
- D 1 - I - 0x01285F 04:A84F: 00        .byte $00   ; 
- D 1 - I - 0x012860 04:A850: 10        .byte $10   ; 
- D 1 - I - 0x012861 04:A851: 15        .byte $15   ; 
- D 1 - I - 0x012862 04:A852: 00        .byte $00   ; 
- D 1 - I - 0x012863 04:A853: 00        .byte $00   ; 
- D 1 - I - 0x012864 04:A854: 00        .byte $00   ; 
- D 1 - I - 0x012865 04:A855: 00        .byte $00   ; 
- D 1 - I - 0x012866 04:A856: 00        .byte $00   ; 
- D 1 - I - 0x012867 04:A857: 00        .byte $00   ; 
- D 1 - I - 0x012868 04:A858: 00        .byte $00   ; 
- D 1 - I - 0x012869 04:A859: 00        .byte $00   ; 
- D 1 - I - 0x01286A 04:A85A: 16        .byte $16   ; 
- D 1 - I - 0x01286B 04:A85B: 12        .byte $12   ; 
- D 1 - I - 0x01286C 04:A85C: 16        .byte $16   ; 
- D 1 - I - 0x01286D 04:A85D: 17        .byte $17   ; 
- D 1 - I - 0x01286E 04:A85E: 14        .byte $14   ; 
- D 1 - I - 0x01286F 04:A85F: 14        .byte $14   ; 
- D 1 - I - 0x012870 04:A860: 15        .byte $15   ; 
- D 1 - I - 0x012871 04:A861: 18        .byte $18   ; 
- D 1 - I - 0x012872 04:A862: 10        .byte $10   ; 
- D 1 - I - 0x012873 04:A863: 15        .byte $15   ; 
- D 1 - I - 0x012874 04:A864: 18        .byte $18   ; 
- D 1 - I - 0x012875 04:A865: 00        .byte $00   ; 
- D 1 - I - 0x012876 04:A866: 00        .byte $00   ; 
- D 1 - I - 0x012877 04:A867: 13        .byte $13   ; 
- D 1 - I - 0x012878 04:A868: 12        .byte $12   ; 
- D 1 - I - 0x012879 04:A869: 17        .byte $17   ; 
- D 1 - I - 0x01287A 04:A86A: 00        .byte $00   ; 
- D 1 - I - 0x01287B 04:A86B: 10        .byte $10   ; 
- D 1 - I - 0x01287C 04:A86C: 15        .byte $15   ; 
- D 1 - I - 0x01287D 04:A86D: 18        .byte $18   ; 
- D 1 - I - 0x01287E 04:A86E: 00        .byte $00   ; 
- D 1 - I - 0x01287F 04:A86F: 00        .byte $00   ; 
- D 1 - I - 0x012880 04:A870: 00        .byte $00   ; 
- D 1 - I - 0x012881 04:A871: 00        .byte $00   ; 
- D 1 - I - 0x012882 04:A872: 00        .byte $00   ; 
- D 1 - I - 0x012883 04:A873: 00        .byte $00   ; 
- D 1 - I - 0x012884 04:A874: 00        .byte $00   ; 
- D 1 - I - 0x012885 04:A875: 00        .byte $00   ; 
- D 1 - I - 0x012886 04:A876: 13        .byte $13   ; 
- D 1 - I - 0x012887 04:A877: 16        .byte $16   ; 
- D 1 - I - 0x012888 04:A878: 12        .byte $12   ; 
- D 1 - I - 0x012889 04:A879: 17        .byte $17   ; 
- D 1 - I - 0x01288A 04:A87A: 10        .byte $10   ; 
- D 1 - I - 0x01288B 04:A87B: 11        .byte $11   ; 
- D 1 - I - 0x01288C 04:A87C: 15        .byte $15   ; 
- D 1 - I - 0x01288D 04:A87D: 18        .byte $18   ; 
- D 1 - I - 0x01288E 04:A87E: 00        .byte $00   ; 
- D 1 - I - 0x01288F 04:A87F: 00        .byte $00   ; 
- D 1 - I - 0x012890 04:A880: 00        .byte $00   ; 
- D 1 - I - 0x012891 04:A881: 00        .byte $00   ; 
- D 1 - I - 0x012892 04:A882: 00        .byte $00   ; 
- D 1 - I - 0x012893 04:A883: 00        .byte $00   ; 
- D 1 - I - 0x012894 04:A884: 00        .byte $00   ; 
- D 1 - I - 0x012895 04:A885: 00        .byte $00   ; 
- D 1 - I - 0x012896 04:A886: 00        .byte $00   ; 
- D 1 - I - 0x012897 04:A887: 00        .byte $00   ; 
- D 1 - I - 0x012898 04:A888: 00        .byte $00   ; 
- D 1 - I - 0x012899 04:A889: 00        .byte $00   ; 
- D 1 - I - 0x01289A 04:A88A: 00        .byte $00   ; 
- D 1 - I - 0x01289B 04:A88B: 00        .byte $00   ; 
- D 1 - I - 0x01289C 04:A88C: 00        .byte $00   ; 
- D 1 - I - 0x01289D 04:A88D: 00        .byte $00   ; 
- D 1 - I - 0x01289E 04:A88E: 43        .byte $43   ; 
- D 1 - I - 0x01289F 04:A88F: 2E        .byte $2E   ; 
- D 1 - I - 0x0128A0 04:A890: 44        .byte $44   ; 
- D 1 - I - 0x0128A1 04:A891: 2E        .byte $2E   ; 
- D 1 - I - 0x0128A2 04:A892: DD        .byte $DD   ; 
- D 1 - I - 0x0128A3 04:A893: DE        .byte $DE   ; 
- D 1 - I - 0x0128A4 04:A894: DF        .byte $DF   ; 
- D 1 - I - 0x0128A5 04:A895: E0        .byte $E0   ; 
- D 1 - I - 0x0128A6 04:A896: 00        .byte $00   ; 
- D 1 - I - 0x0128A7 04:A897: 00        .byte $00   ; 
- D 1 - I - 0x0128A8 04:A898: 00        .byte $00   ; 
- D 1 - I - 0x0128A9 04:A899: 00        .byte $00   ; 
- D 1 - I - 0x0128AA 04:A89A: 00        .byte $00   ; 
- D 1 - I - 0x0128AB 04:A89B: 00        .byte $00   ; 
- D 1 - I - 0x0128AC 04:A89C: 00        .byte $00   ; 
- D 1 - I - 0x0128AD 04:A89D: 00        .byte $00   ; 
- D 1 - I - 0x0128AE 04:A89E: 43        .byte $43   ; 
- D 1 - I - 0x0128AF 04:A89F: C5        .byte $C5   ; 
- D 1 - I - 0x0128B0 04:A8A0: 45        .byte $45   ; 
- D 1 - I - 0x0128B1 04:A8A1: C4        .byte $C4   ; 
- D 1 - I - 0x0128B2 04:A8A2: E1        .byte $E1   ; 
- D 1 - I - 0x0128B3 04:A8A3: CE        .byte $CE   ; 
- D 1 - I - 0x0128B4 04:A8A4: CF        .byte $CF   ; 
- D 1 - I - 0x0128B5 04:A8A5: DD        .byte $DD   ; 
- D 1 - I - 0x0128B6 04:A8A6: 00        .byte $00   ; 
- D 1 - I - 0x0128B7 04:A8A7: 00        .byte $00   ; 
- D 1 - I - 0x0128B8 04:A8A8: 00        .byte $00   ; 
- D 1 - I - 0x0128B9 04:A8A9: 00        .byte $00   ; 
- D 1 - I - 0x0128BA 04:A8AA: 00        .byte $00   ; 
- D 1 - I - 0x0128BB 04:A8AB: 00        .byte $00   ; 
- D 1 - I - 0x0128BC 04:A8AC: 00        .byte $00   ; 
- D 1 - I - 0x0128BD 04:A8AD: 00        .byte $00   ; 
- D 1 - I - 0x0128BE 04:A8AE: 2E        .byte $2E   ; 
- D 1 - I - 0x0128BF 04:A8AF: 44        .byte $44   ; 
- D 1 - I - 0x0128C0 04:A8B0: 2E        .byte $2E   ; 
- D 1 - I - 0x0128C1 04:A8B1: E2        .byte $E2   ; 
- D 1 - I - 0x0128C2 04:A8B2: DE        .byte $DE   ; 
- D 1 - I - 0x0128C3 04:A8B3: DF        .byte $DF   ; 
- D 1 - I - 0x0128C4 04:A8B4: D2        .byte $D2   ; 
- D 1 - I - 0x0128C5 04:A8B5: D3        .byte $D3   ; 
- D 1 - I - 0x0128C6 04:A8B6: 00        .byte $00   ; 
- D 1 - I - 0x0128C7 04:A8B7: 00        .byte $00   ; 
- D 1 - I - 0x0128C8 04:A8B8: 00        .byte $00   ; 
- D 1 - I - 0x0128C9 04:A8B9: 00        .byte $00   ; 
- D 1 - I - 0x0128CA 04:A8BA: 00        .byte $00   ; 
- D 1 - I - 0x0128CB 04:A8BB: 00        .byte $00   ; 
- D 1 - I - 0x0128CC 04:A8BC: 00        .byte $00   ; 
- D 1 - I - 0x0128CD 04:A8BD: 00        .byte $00   ; 
- D 1 - I - 0x0128CE 04:A8BE: 43        .byte $43   ; 
- D 1 - I - 0x0128CF 04:A8BF: 44        .byte $44   ; 
- D 1 - I - 0x0128D0 04:A8C0: 2E        .byte $2E   ; 
- D 1 - I - 0x0128D1 04:A8C1: E2        .byte $E2   ; 
- D 1 - I - 0x0128D2 04:A8C2: E1        .byte $E1   ; 
- D 1 - I - 0x0128D3 04:A8C3: DF        .byte $DF   ; 
- D 1 - I - 0x0128D4 04:A8C4: D2        .byte $D2   ; 
- D 1 - I - 0x0128D5 04:A8C5: D3        .byte $D3   ; 
- D 1 - I - 0x0128D6 04:A8C6: 31        .byte $31   ; 
- D 1 - I - 0x0128D7 04:A8C7: 47        .byte $47   ; 
- D 1 - I - 0x0128D8 04:A8C8: 32        .byte $32   ; 
- D 1 - I - 0x0128D9 04:A8C9: D5        .byte $D5   ; 
- D 1 - I - 0x0128DA 04:A8CA: 5B        .byte $5B   ; 
- D 1 - I - 0x0128DB 04:A8CB: 3A        .byte $3A   ; 
- D 1 - I - 0x0128DC 04:A8CC: 30        .byte $30   ; 
- D 1 - I - 0x0128DD 04:A8CD: D5        .byte $D5   ; 
- D 1 - I - 0x0128DE 04:A8CE: 5B        .byte $5B   ; 
- D 1 - I - 0x0128DF 04:A8CF: 39        .byte $39   ; 
- D 1 - I - 0x0128E0 04:A8D0: 30        .byte $30   ; 
- D 1 - I - 0x0128E1 04:A8D1: D5        .byte $D5   ; 
- D 1 - I - 0x0128E2 04:A8D2: 5B        .byte $5B   ; 
- D 1 - I - 0x0128E3 04:A8D3: 39        .byte $39   ; 
- D 1 - I - 0x0128E4 04:A8D4: 30        .byte $30   ; 
- D 1 - I - 0x0128E5 04:A8D5: D5        .byte $D5   ; 
- D 1 - I - 0x0128E6 04:A8D6: 5B        .byte $5B   ; 
- D 1 - I - 0x0128E7 04:A8D7: 39        .byte $39   ; 
- D 1 - I - 0x0128E8 04:A8D8: 30        .byte $30   ; 
- D 1 - I - 0x0128E9 04:A8D9: D5        .byte $D5   ; 
- D 1 - I - 0x0128EA 04:A8DA: 5B        .byte $5B   ; 
- D 1 - I - 0x0128EB 04:A8DB: 39        .byte $39   ; 
- D 1 - I - 0x0128EC 04:A8DC: 30        .byte $30   ; 
- D 1 - I - 0x0128ED 04:A8DD: C6        .byte $C6   ; 
- D 1 - I - 0x0128EE 04:A8DE: 5B        .byte $5B   ; 
- D 1 - I - 0x0128EF 04:A8DF: 39        .byte $39   ; 
- D 1 - I - 0x0128F0 04:A8E0: 48        .byte $48   ; 
- D 1 - I - 0x0128F1 04:A8E1: C7        .byte $C7   ; 
- D 1 - I - 0x0128F2 04:A8E2: 5B        .byte $5B   ; 
- D 1 - I - 0x0128F3 04:A8E3: 39        .byte $39   ; 
- D 1 - I - 0x0128F4 04:A8E4: 49        .byte $49   ; 
- D 1 - I - 0x0128F5 04:A8E5: FD        .byte $FD   ; 
- D 1 - I - 0x0128F6 04:A8E6: 5B        .byte $5B   ; 
- D 1 - I - 0x0128F7 04:A8E7: 39        .byte $39   ; 
- D 1 - I - 0x0128F8 04:A8E8: 49        .byte $49   ; 
- D 1 - I - 0x0128F9 04:A8E9: FD        .byte $FD   ; 
- D 1 - I - 0x0128FA 04:A8EA: F4        .byte $F4   ; 
- D 1 - I - 0x0128FB 04:A8EB: F3        .byte $F3   ; 
- D 1 - I - 0x0128FC 04:A8EC: FE        .byte $FE   ; 
- D 1 - I - 0x0128FD 04:A8ED: FD        .byte $FD   ; 
- D 1 - I - 0x0128FE 04:A8EE: 5B        .byte $5B   ; 
- D 1 - I - 0x0128FF 04:A8EF: 3A        .byte $3A   ; 
- D 1 - I - 0x012900 04:A8F0: 49        .byte $49   ; 
- D 1 - I - 0x012901 04:A8F1: FF        .byte $FF   ; 
- D 1 - I - 0x012902 04:A8F2: 5B        .byte $5B   ; 
- D 1 - I - 0x012903 04:A8F3: 39        .byte $39   ; 
- D 1 - I - 0x012904 04:A8F4: 49        .byte $49   ; 
- D 1 - I - 0x012905 04:A8F5: C8        .byte $C8   ; 
- D 1 - I - 0x012906 04:A8F6: 00        .byte $00   ; 
- D 1 - I - 0x012907 04:A8F7: 00        .byte $00   ; 
- D 1 - I - 0x012908 04:A8F8: 00        .byte $00   ; 
- D 1 - I - 0x012909 04:A8F9: 00        .byte $00   ; 
- D 1 - I - 0x01290A 04:A8FA: 00        .byte $00   ; 
- D 1 - I - 0x01290B 04:A8FB: 00        .byte $00   ; 
- D 1 - I - 0x01290C 04:A8FC: 00        .byte $00   ; 
- D 1 - I - 0x01290D 04:A8FD: 00        .byte $00   ; 
- D 1 - I - 0x01290E 04:A8FE: 2F        .byte $2F   ; 
- D 1 - I - 0x01290F 04:A8FF: 44        .byte $44   ; 
- D 1 - I - 0x012910 04:A900: 2E        .byte $2E   ; 
- D 1 - I - 0x012911 04:A901: 43        .byte $43   ; 
- D 1 - I - 0x012912 04:A902: D0        .byte $D0   ; 
- D 1 - I - 0x012913 04:A903: D1        .byte $D1   ; 
- D 1 - I - 0x012914 04:A904: E0        .byte $E0   ; 
- D 1 - I - 0x012915 04:A905: DD        .byte $DD   ; 
- D 1 - I - 0x012916 04:A906: 47        .byte $47   ; 
- D 1 - I - 0x012917 04:A907: 31        .byte $31   ; 
- D 1 - I - 0x012918 04:A908: 47        .byte $47   ; 
- D 1 - I - 0x012919 04:A909: D8        .byte $D8   ; 
- D 1 - I - 0x01291A 04:A90A: 3A        .byte $3A   ; 
- D 1 - I - 0x01291B 04:A90B: 5B        .byte $5B   ; 
- D 1 - I - 0x01291C 04:A90C: 3A        .byte $3A   ; 
- D 1 - I - 0x01291D 04:A90D: 3B        .byte $3B   ; 
- D 1 - I - 0x01291E 04:A90E: 39        .byte $39   ; 
- D 1 - I - 0x01291F 04:A90F: 5B        .byte $5B   ; 
- D 1 - I - 0x012920 04:A910: 39        .byte $39   ; 
- D 1 - I - 0x012921 04:A911: 3B        .byte $3B   ; 
- D 1 - I - 0x012922 04:A912: 39        .byte $39   ; 
- D 1 - I - 0x012923 04:A913: 5B        .byte $5B   ; 
- D 1 - I - 0x012924 04:A914: 39        .byte $39   ; 
- D 1 - I - 0x012925 04:A915: 3B        .byte $3B   ; 
- D 1 - I - 0x012926 04:A916: 39        .byte $39   ; 
- D 1 - I - 0x012927 04:A917: 5B        .byte $5B   ; 
- D 1 - I - 0x012928 04:A918: 39        .byte $39   ; 
- D 1 - I - 0x012929 04:A919: 3B        .byte $3B   ; 
- D 1 - I - 0x01292A 04:A91A: 39        .byte $39   ; 
- D 1 - I - 0x01292B 04:A91B: 5B        .byte $5B   ; 
- D 1 - I - 0x01292C 04:A91C: 39        .byte $39   ; 
- D 1 - I - 0x01292D 04:A91D: 3B        .byte $3B   ; 
- D 1 - I - 0x01292E 04:A91E: 39        .byte $39   ; 
- D 1 - I - 0x01292F 04:A91F: 5B        .byte $5B   ; 
- D 1 - I - 0x012930 04:A920: 39        .byte $39   ; 
- D 1 - I - 0x012931 04:A921: 3B        .byte $3B   ; 
- D 1 - I - 0x012932 04:A922: 39        .byte $39   ; 
- D 1 - I - 0x012933 04:A923: 5B        .byte $5B   ; 
- D 1 - I - 0x012934 04:A924: 39        .byte $39   ; 
- D 1 - I - 0x012935 04:A925: 3B        .byte $3B   ; 
- D 1 - I - 0x012936 04:A926: 47        .byte $47   ; 
- D 1 - I - 0x012937 04:A927: 31        .byte $31   ; 
- D 1 - I - 0x012938 04:A928: 47        .byte $47   ; 
- D 1 - I - 0x012939 04:A929: D8        .byte $D8   ; 
- D 1 - I - 0x01293A 04:A92A: 3A        .byte $3A   ; 
- D 1 - I - 0x01293B 04:A92B: 5B        .byte $5B   ; 
- D 1 - I - 0x01293C 04:A92C: 3A        .byte $3A   ; 
- D 1 - I - 0x01293D 04:A92D: 3B        .byte $3B   ; 
- D 1 - I - 0x01293E 04:A92E: 46        .byte $46   ; 
- D 1 - I - 0x01293F 04:A92F: EE        .byte $EE   ; 
- D 1 - I - 0x012940 04:A930: 3E        .byte $3E   ; 
- D 1 - I - 0x012941 04:A931: E5        .byte $E5   ; 
- D 1 - I - 0x012942 04:A932: EF        .byte $EF   ; 
- D 1 - I - 0x012943 04:A933: F0        .byte $F0   ; 
- D 1 - I - 0x012944 04:A934: F1        .byte $F1   ; 
- D 1 - I - 0x012945 04:A935: 3B        .byte $3B   ; 
- D 1 - I - 0x012946 04:A936: 39        .byte $39   ; 
- D 1 - I - 0x012947 04:A937: 5B        .byte $5B   ; 
- D 1 - I - 0x012948 04:A938: 39        .byte $39   ; 
- D 1 - I - 0x012949 04:A939: E5        .byte $E5   ; 
- D 1 - I - 0x01294A 04:A93A: 39        .byte $39   ; 
- D 1 - I - 0x01294B 04:A93B: 5B        .byte $5B   ; 
- D 1 - I - 0x01294C 04:A93C: 39        .byte $39   ; 
- D 1 - I - 0x01294D 04:A93D: 3B        .byte $3B   ; 
- D 1 - I - 0x01294E 04:A93E: 39        .byte $39   ; 
- D 1 - I - 0x01294F 04:A93F: 5B        .byte $5B   ; 
- D 1 - I - 0x012950 04:A940: 39        .byte $39   ; 
- D 1 - I - 0x012951 04:A941: E5        .byte $E5   ; 
- D 1 - I - 0x012952 04:A942: 39        .byte $39   ; 
- D 1 - I - 0x012953 04:A943: 5B        .byte $5B   ; 
- D 1 - I - 0x012954 04:A944: 39        .byte $39   ; 
- D 1 - I - 0x012955 04:A945: 3B        .byte $3B   ; 
- D 1 - I - 0x012956 04:A946: 47        .byte $47   ; 
- D 1 - I - 0x012957 04:A947: 31        .byte $31   ; 
- D 1 - I - 0x012958 04:A948: 47        .byte $47   ; 
- D 1 - I - 0x012959 04:A949: D8        .byte $D8   ; 
- D 1 - I - 0x01295A 04:A94A: DA        .byte $DA   ; 
- D 1 - I - 0x01295B 04:A94B: DB        .byte $DB   ; 
- D 1 - I - 0x01295C 04:A94C: DC        .byte $DC   ; 
- D 1 - I - 0x01295D 04:A94D: E3        .byte $E3   ; 
- D 1 - I - 0x01295E 04:A94E: 3C        .byte $3C   ; 
- D 1 - I - 0x01295F 04:A94F: FB        .byte $FB   ; 
- D 1 - I - 0x012960 04:A950: 42        .byte $42   ; 
- D 1 - I - 0x012961 04:A951: 3B        .byte $3B   ; 
- D 1 - I - 0x012962 04:A952: 3C        .byte $3C   ; 
- D 1 - I - 0x012963 04:A953: 5B        .byte $5B   ; 
- D 1 - I - 0x012964 04:A954: FC        .byte $FC   ; 
- D 1 - I - 0x012965 04:A955: 3B        .byte $3B   ; 
- D 1 - I - 0x012966 04:A956: 47        .byte $47   ; 
- D 1 - I - 0x012967 04:A957: 31        .byte $31   ; 
- D 1 - I - 0x012968 04:A958: 47        .byte $47   ; 
- D 1 - I - 0x012969 04:A959: D8        .byte $D8   ; 
- D 1 - I - 0x01296A 04:A95A: DC        .byte $DC   ; 
- D 1 - I - 0x01296B 04:A95B: DB        .byte $DB   ; 
- D 1 - I - 0x01296C 04:A95C: E4        .byte $E4   ; 
- D 1 - I - 0x01296D 04:A95D: 3B        .byte $3B   ; 
- D 1 - I - 0x01296E 04:A95E: 39        .byte $39   ; 
- D 1 - I - 0x01296F 04:A95F: E6        .byte $E6   ; 
- D 1 - I - 0x012970 04:A960: 3D        .byte $3D   ; 
- D 1 - I - 0x012971 04:A961: E5        .byte $E5   ; 
- D 1 - I - 0x012972 04:A962: E7        .byte $E7   ; 
- D 1 - I - 0x012973 04:A963: E8        .byte $E8   ; 
- D 1 - I - 0x012974 04:A964: 39        .byte $39   ; 
- D 1 - I - 0x012975 04:A965: 3B        .byte $3B   ; 
- D 1 - I - 0x012976 04:A966: 47        .byte $47   ; 
- D 1 - I - 0x012977 04:A967: 31        .byte $31   ; 
- D 1 - I - 0x012978 04:A968: 47        .byte $47   ; 
- D 1 - I - 0x012979 04:A969: D8        .byte $D8   ; 
- D 1 - I - 0x01297A 04:A96A: DA        .byte $DA   ; 
- D 1 - I - 0x01297B 04:A96B: DB        .byte $DB   ; 
- D 1 - I - 0x01297C 04:A96C: DC        .byte $DC   ; 
- D 1 - I - 0x01297D 04:A96D: E3        .byte $E3   ; 
- D 1 - I - 0x01297E 04:A96E: 3C        .byte $3C   ; 
- D 1 - I - 0x01297F 04:A96F: F9        .byte $F9   ; 
- D 1 - I - 0x012980 04:A970: 41        .byte $41   ; 
- D 1 - I - 0x012981 04:A971: 3B        .byte $3B   ; 
- D 1 - I - 0x012982 04:A972: 3C        .byte $3C   ; 
- D 1 - I - 0x012983 04:A973: 5B        .byte $5B   ; 
- D 1 - I - 0x012984 04:A974: FA        .byte $FA   ; 
- D 1 - I - 0x012985 04:A975: 3B        .byte $3B   ; 
- D 1 - I - 0x012986 04:A976: 34        .byte $34   ; 
- D 1 - I - 0x012987 04:A977: D9        .byte $D9   ; 
- D 1 - I - 0x012988 04:A978: 35        .byte $35   ; 
- D 1 - I - 0x012989 04:A979: 47        .byte $47   ; 
- D 1 - I - 0x01298A 04:A97A: 3F        .byte $3F   ; 
- D 1 - I - 0x01298B 04:A97B: F2        .byte $F2   ; 
- D 1 - I - 0x01298C 04:A97C: 40        .byte $40   ; 
- D 1 - I - 0x01298D 04:A97D: 3A        .byte $3A   ; 
- D 1 - I - 0x01298E 04:A97E: 3F        .byte $3F   ; 
- D 1 - I - 0x01298F 04:A97F: F2        .byte $F2   ; 
- D 1 - I - 0x012990 04:A980: 40        .byte $40   ; 
- D 1 - I - 0x012991 04:A981: 39        .byte $39   ; 
- D 1 - I - 0x012992 04:A982: 3F        .byte $3F   ; 
- D 1 - I - 0x012993 04:A983: F2        .byte $F2   ; 
- D 1 - I - 0x012994 04:A984: 40        .byte $40   ; 
- D 1 - I - 0x012995 04:A985: 39        .byte $39   ; 
- D 1 - I - 0x012996 04:A986: 3C        .byte $3C   ; 
- D 1 - I - 0x012997 04:A987: 5B        .byte $5B   ; 
- D 1 - I - 0x012998 04:A988: 39        .byte $39   ; 
- D 1 - I - 0x012999 04:A989: E9        .byte $E9   ; 
- D 1 - I - 0x01299A 04:A98A: EA        .byte $EA   ; 
- D 1 - I - 0x01299B 04:A98B: EB        .byte $EB   ; 
- D 1 - I - 0x01299C 04:A98C: EC        .byte $EC   ; 
- D 1 - I - 0x01299D 04:A98D: ED        .byte $ED   ; 
- D 1 - I - 0x01299E 04:A98E: 39        .byte $39   ; 
- D 1 - I - 0x01299F 04:A98F: 5B        .byte $5B   ; 
- D 1 - I - 0x0129A0 04:A990: 39        .byte $39   ; 
- D 1 - I - 0x0129A1 04:A991: 3B        .byte $3B   ; 
- D 1 - I - 0x0129A2 04:A992: 39        .byte $39   ; 
- D 1 - I - 0x0129A3 04:A993: 5B        .byte $5B   ; 
- D 1 - I - 0x0129A4 04:A994: 39        .byte $39   ; 
- D 1 - I - 0x0129A5 04:A995: 3B        .byte $3B   ; 
- D 1 - I - 0x0129A6 04:A996: 3D        .byte $3D   ; 
- D 1 - I - 0x0129A7 04:A997: 5B        .byte $5B   ; 
- D 1 - I - 0x0129A8 04:A998: 39        .byte $39   ; 
- D 1 - I - 0x0129A9 04:A999: E5        .byte $E5   ; 
- D 1 - I - 0x0129AA 04:A99A: 39        .byte $39   ; 
- D 1 - I - 0x0129AB 04:A99B: 5B        .byte $5B   ; 
- D 1 - I - 0x0129AC 04:A99C: 39        .byte $39   ; 
- D 1 - I - 0x0129AD 04:A99D: 3B        .byte $3B   ; 
- D 1 - I - 0x0129AE 04:A99E: 39        .byte $39   ; 
- D 1 - I - 0x0129AF 04:A99F: 5B        .byte $5B   ; 
- D 1 - I - 0x0129B0 04:A9A0: 39        .byte $39   ; 
- D 1 - I - 0x0129B1 04:A9A1: E5        .byte $E5   ; 
- D 1 - I - 0x0129B2 04:A9A2: 39        .byte $39   ; 
- D 1 - I - 0x0129B3 04:A9A3: 5B        .byte $5B   ; 
- D 1 - I - 0x0129B4 04:A9A4: 39        .byte $39   ; 
- D 1 - I - 0x0129B5 04:A9A5: 3B        .byte $3B   ; 
- D 1 - I - 0x0129B6 04:A9A6: 5B        .byte $5B   ; 
- D 1 - I - 0x0129B7 04:A9A7: 39        .byte $39   ; 
- D 1 - I - 0x0129B8 04:A9A8: 33        .byte $33   ; 
- D 1 - I - 0x0129B9 04:A9A9: 47        .byte $47   ; 
- D 1 - I - 0x0129BA 04:A9AA: 5B        .byte $5B   ; 
- D 1 - I - 0x0129BB 04:A9AB: 39        .byte $39   ; 
- D 1 - I - 0x0129BC 04:A9AC: 3B        .byte $3B   ; 
- D 1 - I - 0x0129BD 04:A9AD: 3A        .byte $3A   ; 
- D 1 - I - 0x0129BE 04:A9AE: 5B        .byte $5B   ; 
- D 1 - I - 0x0129BF 04:A9AF: 39        .byte $39   ; 
- D 1 - I - 0x0129C0 04:A9B0: 3B        .byte $3B   ; 
- D 1 - I - 0x0129C1 04:A9B1: 39        .byte $39   ; 
- D 1 - I - 0x0129C2 04:A9B2: 5B        .byte $5B   ; 
- D 1 - I - 0x0129C3 04:A9B3: 39        .byte $39   ; 
- D 1 - I - 0x0129C4 04:A9B4: 3B        .byte $3B   ; 
- D 1 - I - 0x0129C5 04:A9B5: 39        .byte $39   ; 
- D 1 - I - 0x0129C6 04:A9B6: 3F        .byte $3F   ; 
- D 1 - I - 0x0129C7 04:A9B7: F2        .byte $F2   ; 
- D 1 - I - 0x0129C8 04:A9B8: 40        .byte $40   ; 
- D 1 - I - 0x0129C9 04:A9B9: 39        .byte $39   ; 
- D 1 - I - 0x0129CA 04:A9BA: 3F        .byte $3F   ; 
- D 1 - I - 0x0129CB 04:A9BB: F2        .byte $F2   ; 
- D 1 - I - 0x0129CC 04:A9BC: 40        .byte $40   ; 
- D 1 - I - 0x0129CD 04:A9BD: 39        .byte $39   ; 
- D 1 - I - 0x0129CE 04:A9BE: 3F        .byte $3F   ; 
- D 1 - I - 0x0129CF 04:A9BF: F2        .byte $F2   ; 
- D 1 - I - 0x0129D0 04:A9C0: 40        .byte $40   ; 
- D 1 - I - 0x0129D1 04:A9C1: 39        .byte $39   ; 
- D 1 - I - 0x0129D2 04:A9C2: 3F        .byte $3F   ; 
- D 1 - I - 0x0129D3 04:A9C3: F2        .byte $F2   ; 
- D 1 - I - 0x0129D4 04:A9C4: 40        .byte $40   ; 
- D 1 - I - 0x0129D5 04:A9C5: 39        .byte $39   ; 
- D 1 - I - 0x0129D6 04:A9C6: 39        .byte $39   ; 
- D 1 - I - 0x0129D7 04:A9C7: 5B        .byte $5B   ; 
- D 1 - I - 0x0129D8 04:A9C8: 39        .byte $39   ; 
- D 1 - I - 0x0129D9 04:A9C9: E5        .byte $E5   ; 
- D 1 - I - 0x0129DA 04:A9CA: F3        .byte $F3   ; 
- D 1 - I - 0x0129DB 04:A9CB: F4        .byte $F4   ; 
- D 1 - I - 0x0129DC 04:A9CC: F3        .byte $F3   ; 
- D 1 - I - 0x0129DD 04:A9CD: F5        .byte $F5   ; 
- D 1 - I - 0x0129DE 04:A9CE: 3A        .byte $3A   ; 
- D 1 - I - 0x0129DF 04:A9CF: 5B        .byte $5B   ; 
- D 1 - I - 0x0129E0 04:A9D0: 3A        .byte $3A   ; 
- D 1 - I - 0x0129E1 04:A9D1: 3B        .byte $3B   ; 
- D 1 - I - 0x0129E2 04:A9D2: 39        .byte $39   ; 
- D 1 - I - 0x0129E3 04:A9D3: 5B        .byte $5B   ; 
- D 1 - I - 0x0129E4 04:A9D4: 39        .byte $39   ; 
- D 1 - I - 0x0129E5 04:A9D5: E5        .byte $E5   ; 
- D 1 - I - 0x0129E6 04:A9D6: 3F        .byte $3F   ; 
- D 1 - I - 0x0129E7 04:A9D7: F2        .byte $F2   ; 
- D 1 - I - 0x0129E8 04:A9D8: 40        .byte $40   ; 
- D 1 - I - 0x0129E9 04:A9D9: 39        .byte $39   ; 
- D 1 - I - 0x0129EA 04:A9DA: F6        .byte $F6   ; 
- D 1 - I - 0x0129EB 04:A9DB: F2        .byte $F2   ; 
- D 1 - I - 0x0129EC 04:A9DC: F7        .byte $F7   ; 
- D 1 - I - 0x0129ED 04:A9DD: F3        .byte $F3   ; 
- D 1 - I - 0x0129EE 04:A9DE: 3F        .byte $3F   ; 
- D 1 - I - 0x0129EF 04:A9DF: F2        .byte $F2   ; 
- D 1 - I - 0x0129F0 04:A9E0: 40        .byte $40   ; 
- D 1 - I - 0x0129F1 04:A9E1: 3A        .byte $3A   ; 
- D 1 - I - 0x0129F2 04:A9E2: 3F        .byte $3F   ; 
- D 1 - I - 0x0129F3 04:A9E3: F2        .byte $F2   ; 
- D 1 - I - 0x0129F4 04:A9E4: 40        .byte $40   ; 
- D 1 - I - 0x0129F5 04:A9E5: 39        .byte $39   ; 
- D 1 - I - 0x0129F6 04:A9E6: 5B        .byte $5B   ; 
- D 1 - I - 0x0129F7 04:A9E7: 39        .byte $39   ; 
- D 1 - I - 0x0129F8 04:A9E8: 3B        .byte $3B   ; 
- D 1 - I - 0x0129F9 04:A9E9: 39        .byte $39   ; 
- D 1 - I - 0x0129FA 04:A9EA: F4        .byte $F4   ; 
- D 1 - I - 0x0129FB 04:A9EB: F3        .byte $F3   ; 
- D 1 - I - 0x0129FC 04:A9EC: F8        .byte $F8   ; 
- D 1 - I - 0x0129FD 04:A9ED: 39        .byte $39   ; 
- D 1 - I - 0x0129FE 04:A9EE: 5B        .byte $5B   ; 
- D 1 - I - 0x0129FF 04:A9EF: 39        .byte $39   ; 
- D 1 - I - 0x012A00 04:A9F0: 3B        .byte $3B   ; 
- D 1 - I - 0x012A01 04:A9F1: 39        .byte $39   ; 
- D 1 - I - 0x012A02 04:A9F2: 5B        .byte $5B   ; 
- D 1 - I - 0x012A03 04:A9F3: 39        .byte $39   ; 
- D 1 - I - 0x012A04 04:A9F4: 3B        .byte $3B   ; 
- D 1 - I - 0x012A05 04:A9F5: 39        .byte $39   ; 
- D 1 - I - 0x012A06 04:A9F6: 5B        .byte $5B   ; 
- D 1 - I - 0x012A07 04:A9F7: 39        .byte $39   ; 
- D 1 - I - 0x012A08 04:A9F8: 3B        .byte $3B   ; 
- D 1 - I - 0x012A09 04:A9F9: 39        .byte $39   ; 
- D 1 - I - 0x012A0A 04:A9FA: 5B        .byte $5B   ; 
- D 1 - I - 0x012A0B 04:A9FB: 39        .byte $39   ; 
- D 1 - I - 0x012A0C 04:A9FC: 3B        .byte $3B   ; 
- D 1 - I - 0x012A0D 04:A9FD: 39        .byte $39   ; 
- D 1 - I - 0x012A0E 04:A9FE: 5B        .byte $5B   ; 
- D 1 - I - 0x012A0F 04:A9FF: 39        .byte $39   ; 
- D 1 - I - 0x012A10 04:AA00: 3B        .byte $3B   ; 
- D 1 - I - 0x012A11 04:AA01: 39        .byte $39   ; 
- D 1 - I - 0x012A12 04:AA02: 5B        .byte $5B   ; 
- D 1 - I - 0x012A13 04:AA03: 39        .byte $39   ; 
- D 1 - I - 0x012A14 04:AA04: 3B        .byte $3B   ; 
- D 1 - I - 0x012A15 04:AA05: 39        .byte $39   ; 
- D 1 - I - 0x012A16 04:AA06: 5B        .byte $5B   ; 
- D 1 - I - 0x012A17 04:AA07: 39        .byte $39   ; 
- D 1 - I - 0x012A18 04:AA08: 3B        .byte $3B   ; 
- D 1 - I - 0x012A19 04:AA09: 39        .byte $39   ; 
- D 1 - I - 0x012A1A 04:AA0A: F4        .byte $F4   ; 
- D 1 - I - 0x012A1B 04:AA0B: F3        .byte $F3   ; 
- D 1 - I - 0x012A1C 04:AA0C: F5        .byte $F5   ; 
- D 1 - I - 0x012A1D 04:AA0D: F3        .byte $F3   ; 
- D 1 - I - 0x012A1E 04:AA0E: 5B        .byte $5B   ; 
- D 1 - I - 0x012A1F 04:AA0F: 39        .byte $39   ; 
- D 1 - I - 0x012A20 04:AA10: 3B        .byte $3B   ; 
- D 1 - I - 0x012A21 04:AA11: 39        .byte $39   ; 
- D 1 - I - 0x012A22 04:AA12: 5B        .byte $5B   ; 
- D 1 - I - 0x012A23 04:AA13: 39        .byte $39   ; 
- D 1 - I - 0x012A24 04:AA14: 3B        .byte $3B   ; 
- D 1 - I - 0x012A25 04:AA15: 39        .byte $39   ; 
- D 1 - I - 0x012A26 04:AA16: 5B        .byte $5B   ; 
- D 1 - I - 0x012A27 04:AA17: 39        .byte $39   ; 
- D 1 - I - 0x012A28 04:AA18: 49        .byte $49   ; 
- D 1 - I - 0x012A29 04:AA19: FD        .byte $FD   ; 
- D 1 - I - 0x012A2A 04:AA1A: F4        .byte $F4   ; 
- D 1 - I - 0x012A2B 04:AA1B: F3        .byte $F3   ; 
- D 1 - I - 0x012A2C 04:AA1C: FE        .byte $FE   ; 
- D 1 - I - 0x012A2D 04:AA1D: C9        .byte $C9   ; 
- D 1 - I - 0x012A2E 04:AA1E: 5B        .byte $5B   ; 
- D 1 - I - 0x012A2F 04:AA1F: 3A        .byte $3A   ; 
- D 1 - I - 0x012A30 04:AA20: 49        .byte $49   ; 
- D 1 - I - 0x012A31 04:AA21: CA        .byte $CA   ; 
- D 1 - I - 0x012A32 04:AA22: 5B        .byte $5B   ; 
- D 1 - I - 0x012A33 04:AA23: 39        .byte $39   ; 
- D 1 - I - 0x012A34 04:AA24: 5C        .byte $5C   ; 
- D 1 - I - 0x012A35 04:AA25: D7        .byte $D7   ; 
- D 1 - I - 0x012A36 04:AA26: 5B        .byte $5B   ; 
- D 1 - I - 0x012A37 04:AA27: 39        .byte $39   ; 
- D 1 - I - 0x012A38 04:AA28: 30        .byte $30   ; 
- D 1 - I - 0x012A39 04:AA29: D5        .byte $D5   ; 
- D 1 - I - 0x012A3A 04:AA2A: 5B        .byte $5B   ; 
- D 1 - I - 0x012A3B 04:AA2B: 39        .byte $39   ; 
- D 1 - I - 0x012A3C 04:AA2C: 30        .byte $30   ; 
- D 1 - I - 0x012A3D 04:AA2D: C6        .byte $C6   ; 
- D 1 - I - 0x012A3E 04:AA2E: 5B        .byte $5B   ; 
- D 1 - I - 0x012A3F 04:AA2F: 39        .byte $39   ; 
- D 1 - I - 0x012A40 04:AA30: 48        .byte $48   ; 
- D 1 - I - 0x012A41 04:AA31: C7        .byte $C7   ; 
- D 1 - I - 0x012A42 04:AA32: 5B        .byte $5B   ; 
- D 1 - I - 0x012A43 04:AA33: 39        .byte $39   ; 
- D 1 - I - 0x012A44 04:AA34: 49        .byte $49   ; 
- D 1 - I - 0x012A45 04:AA35: C9        .byte $C9   ; 
- D 1 - I - 0x012A46 04:AA36: 5B        .byte $5B   ; 
- D 1 - I - 0x012A47 04:AA37: 39        .byte $39   ; 
- D 1 - I - 0x012A48 04:AA38: 49        .byte $49   ; 
- D 1 - I - 0x012A49 04:AA39: CB        .byte $CB   ; 
- D 1 - I - 0x012A4A 04:AA3A: F4        .byte $F4   ; 
- D 1 - I - 0x012A4B 04:AA3B: F3        .byte $F3   ; 
- D 1 - I - 0x012A4C 04:AA3C: D4        .byte $D4   ; 
- D 1 - I - 0x012A4D 04:AA3D: D5        .byte $D5   ; 
- D 1 - I - 0x012A4E 04:AA3E: 5B        .byte $5B   ; 
- D 1 - I - 0x012A4F 04:AA3F: 3A        .byte $3A   ; 
- D 1 - I - 0x012A50 04:AA40: 5C        .byte $5C   ; 
- D 1 - I - 0x012A51 04:AA41: D6        .byte $D6   ; 
- D 1 - I - 0x012A52 04:AA42: 5B        .byte $5B   ; 
- D 1 - I - 0x012A53 04:AA43: 39        .byte $39   ; 
- D 1 - I - 0x012A54 04:AA44: 5C        .byte $5C   ; 
- D 1 - I - 0x012A55 04:AA45: D7        .byte $D7   ; 
- D 1 - I - 0x012A56 04:AA46: 5B        .byte $5B   ; 
- D 1 - I - 0x012A57 04:AA47: 39        .byte $39   ; 
- D 1 - I - 0x012A58 04:AA48: 30        .byte $30   ; 
- D 1 - I - 0x012A59 04:AA49: D5        .byte $D5   ; 
- D 1 - I - 0x012A5A 04:AA4A: 5B        .byte $5B   ; 
- D 1 - I - 0x012A5B 04:AA4B: 39        .byte $39   ; 
- D 1 - I - 0x012A5C 04:AA4C: 30        .byte $30   ; 
- D 1 - I - 0x012A5D 04:AA4D: CC        .byte $CC   ; 
- D 1 - I - 0x012A5E 04:AA4E: 5B        .byte $5B   ; 
- D 1 - I - 0x012A5F 04:AA4F: 39        .byte $39   ; 
- D 1 - I - 0x012A60 04:AA50: 48        .byte $48   ; 
- D 1 - I - 0x012A61 04:AA51: CD        .byte $CD   ; 
- D 1 - I - 0x012A62 04:AA52: 5B        .byte $5B   ; 
- D 1 - I - 0x012A63 04:AA53: 39        .byte $39   ; 
- D 1 - I - 0x012A64 04:AA54: 5C        .byte $5C   ; 
- D 1 - I - 0x012A65 04:AA55: D5        .byte $D5   ; 
- D 1 - I - 0x012A66 04:AA56: 5B        .byte $5B   ; 
- D 1 - I - 0x012A67 04:AA57: 39        .byte $39   ; 
- D 1 - I - 0x012A68 04:AA58: 5C        .byte $5C   ; 
- D 1 - I - 0x012A69 04:AA59: D5        .byte $D5   ; 
- D 1 - I - 0x012A6A 04:AA5A: F4        .byte $F4   ; 
- D 1 - I - 0x012A6B 04:AA5B: F3        .byte $F3   ; 
- D 1 - I - 0x012A6C 04:AA5C: D4        .byte $D4   ; 
- D 1 - I - 0x012A6D 04:AA5D: D5        .byte $D5   ; 
- D 1 - I - 0x012A6E 04:AA5E: 5B        .byte $5B   ; 
- D 1 - I - 0x012A6F 04:AA5F: 3A        .byte $3A   ; 
- D 1 - I - 0x012A70 04:AA60: 5C        .byte $5C   ; 
- D 1 - I - 0x012A71 04:AA61: D6        .byte $D6   ; 
- D 1 - I - 0x012A72 04:AA62: 5B        .byte $5B   ; 
- D 1 - I - 0x012A73 04:AA63: 39        .byte $39   ; 
- D 1 - I - 0x012A74 04:AA64: 5C        .byte $5C   ; 
- D 1 - I - 0x012A75 04:AA65: D7        .byte $D7   ; 
- D 1 - I - 0x012A76 04:AA66: 31        .byte $31   ; 
- D 1 - I - 0x012A77 04:AA67: 47        .byte $47   ; 
- D 1 - I - 0x012A78 04:AA68: 32        .byte $32   ; 
- D 1 - I - 0x012A79 04:AA69: D5        .byte $D5   ; 
- D 1 - I - 0x012A7A 04:AA6A: 5B        .byte $5B   ; 
- D 1 - I - 0x012A7B 04:AA6B: 39        .byte $39   ; 
- D 1 - I - 0x012A7C 04:AA6C: 30        .byte $30   ; 
- D 1 - I - 0x012A7D 04:AA6D: D5        .byte $D5   ; 
- D 1 - I - 0x012A7E 04:AA6E: 5B        .byte $5B   ; 
- D 1 - I - 0x012A7F 04:AA6F: 39        .byte $39   ; 
- D 1 - I - 0x012A80 04:AA70: 30        .byte $30   ; 
- D 1 - I - 0x012A81 04:AA71: D5        .byte $D5   ; 
- D 1 - I - 0x012A82 04:AA72: 5B        .byte $5B   ; 
- D 1 - I - 0x012A83 04:AA73: 39        .byte $39   ; 
- D 1 - I - 0x012A84 04:AA74: 30        .byte $30   ; 
- D 1 - I - 0x012A85 04:AA75: C6        .byte $C6   ; 
- D 1 - I - 0x012A86 04:AA76: 5B        .byte $5B   ; 
- D 1 - I - 0x012A87 04:AA77: 39        .byte $39   ; 
- D 1 - I - 0x012A88 04:AA78: 48        .byte $48   ; 
- D 1 - I - 0x012A89 04:AA79: C7        .byte $C7   ; 
- D 1 - I - 0x012A8A 04:AA7A: 5B        .byte $5B   ; 
- D 1 - I - 0x012A8B 04:AA7B: 39        .byte $39   ; 
- D 1 - I - 0x012A8C 04:AA7C: 49        .byte $49   ; 
- D 1 - I - 0x012A8D 04:AA7D: C9        .byte $C9   ; 
- - - - - - 0x012A8E 04:AA7E: 00        .byte $00   ; 
- - - - - - 0x012A8F 04:AA7F: 00        .byte $00   ; 
- - - - - - 0x012A90 04:AA80: 00        .byte $00   ; 
- - - - - - 0x012A91 04:AA81: 00        .byte $00   ; 
- - - - - - 0x012A92 04:AA82: 00        .byte $00   ; 
- - - - - - 0x012A93 04:AA83: 00        .byte $00   ; 
- - - - - - 0x012A94 04:AA84: 00        .byte $00   ; 
- - - - - - 0x012A95 04:AA85: 00        .byte $00   ; 
- D 1 - I - 0x012A96 04:AA86: 00        .byte $00   ; 
- D 1 - I - 0x012A97 04:AA87: 00        .byte $00   ; 
- D 1 - I - 0x012A98 04:AA88: 00        .byte $00   ; 
- D 1 - I - 0x012A99 04:AA89: 00        .byte $00   ; 
- D 1 - I - 0x012A9A 04:AA8A: 00        .byte $00   ; 
- D 1 - I - 0x012A9B 04:AA8B: 00        .byte $00   ; 
- D 1 - I - 0x012A9C 04:AA8C: 00        .byte $00   ; 
- D 1 - I - 0x012A9D 04:AA8D: 07        .byte $07   ; 
- D 1 - I - 0x012A9E 04:AA8E: 00        .byte $00   ; 
- D 1 - I - 0x012A9F 04:AA8F: 00        .byte $00   ; 
- D 1 - I - 0x012AA0 04:AA90: 11        .byte $11   ; 
- D 1 - I - 0x012AA1 04:AA91: 12        .byte $12   ; 
- D 1 - I - 0x012AA2 04:AA92: 00        .byte $00   ; 
- D 1 - I - 0x012AA3 04:AA93: 1B        .byte $1B   ; 
- D 1 - I - 0x012AA4 04:AA94: 1C        .byte $1C   ; 
- D 1 - I - 0x012AA5 04:AA95: 1D        .byte $1D   ; 
- D 1 - I - 0x012AA6 04:AA96: 00        .byte $00   ; 
- D 1 - I - 0x012AA7 04:AA97: 01        .byte $01   ; 
- D 1 - I - 0x012AA8 04:AA98: 02        .byte $02   ; 
- D 1 - I - 0x012AA9 04:AA99: 03        .byte $03   ; 
- D 1 - I - 0x012AAA 04:AA9A: 08        .byte $08   ; 
- D 1 - I - 0x012AAB 04:AA9B: 09        .byte $09   ; 
- D 1 - I - 0x012AAC 04:AA9C: 0A        .byte $0A   ; 
- D 1 - I - 0x012AAD 04:AA9D: 0B        .byte $0B   ; 
- D 1 - I - 0x012AAE 04:AA9E: 13        .byte $13   ; 
- D 1 - I - 0x012AAF 04:AA9F: 14        .byte $14   ; 
- D 1 - I - 0x012AB0 04:AAA0: 15        .byte $15   ; 
- D 1 - I - 0x012AB1 04:AAA1: 16        .byte $16   ; 
- D 1 - I - 0x012AB2 04:AAA2: 1E        .byte $1E   ; 
- D 1 - I - 0x012AB3 04:AAA3: 1F        .byte $1F   ; 
- D 1 - I - 0x012AB4 04:AAA4: 20        .byte $20   ; 
- D 1 - I - 0x012AB5 04:AAA5: 21        .byte $21   ; 
- D 1 - I - 0x012AB6 04:AAA6: 04        .byte $04   ; 
- D 1 - I - 0x012AB7 04:AAA7: 05        .byte $05   ; 
- D 1 - I - 0x012AB8 04:AAA8: 06        .byte $06   ; 
- D 1 - I - 0x012AB9 04:AAA9: 00        .byte $00   ; 
- D 1 - I - 0x012ABA 04:AAAA: 0C        .byte $0C   ; 
- D 1 - I - 0x012ABB 04:AAAB: 0D        .byte $0D   ; 
- D 1 - I - 0x012ABC 04:AAAC: 0E        .byte $0E   ; 
- D 1 - I - 0x012ABD 04:AAAD: 0F        .byte $0F   ; 
- D 1 - I - 0x012ABE 04:AAAE: 17        .byte $17   ; 
- D 1 - I - 0x012ABF 04:AAAF: 14        .byte $14   ; 
- D 1 - I - 0x012AC0 04:AAB0: 16        .byte $16   ; 
- D 1 - I - 0x012AC1 04:AAB1: 18        .byte $18   ; 
- D 1 - I - 0x012AC2 04:AAB2: 22        .byte $22   ; 
- D 1 - I - 0x012AC3 04:AAB3: 23        .byte $23   ; 
- D 1 - I - 0x012AC4 04:AAB4: 21        .byte $21   ; 
- D 1 - I - 0x012AC5 04:AAB5: 24        .byte $24   ; 
- D 1 - I - 0x012AC6 04:AAB6: 00        .byte $00   ; 
- D 1 - I - 0x012AC7 04:AAB7: 00        .byte $00   ; 
- D 1 - I - 0x012AC8 04:AAB8: 00        .byte $00   ; 
- D 1 - I - 0x012AC9 04:AAB9: 00        .byte $00   ; 
- D 1 - I - 0x012ACA 04:AABA: 10        .byte $10   ; 
- D 1 - I - 0x012ACB 04:AABB: 00        .byte $00   ; 
- D 1 - I - 0x012ACC 04:AABC: 00        .byte $00   ; 
- D 1 - I - 0x012ACD 04:AABD: 00        .byte $00   ; 
- D 1 - I - 0x012ACE 04:AABE: 19        .byte $19   ; 
- D 1 - I - 0x012ACF 04:AABF: 1A        .byte $1A   ; 
- D 1 - I - 0x012AD0 04:AAC0: 00        .byte $00   ; 
- D 1 - I - 0x012AD1 04:AAC1: 00        .byte $00   ; 
- D 1 - I - 0x012AD2 04:AAC2: 25        .byte $25   ; 
- D 1 - I - 0x012AD3 04:AAC3: 26        .byte $26   ; 
- D 1 - I - 0x012AD4 04:AAC4: 27        .byte $27   ; 
- D 1 - I - 0x012AD5 04:AAC5: 00        .byte $00   ; 
- D 1 - I - 0x012AD6 04:AAC6: 00        .byte $00   ; 
- D 1 - I - 0x012AD7 04:AAC7: 28        .byte $28   ; 
- D 1 - I - 0x012AD8 04:AAC8: 29        .byte $29   ; 
- D 1 - I - 0x012AD9 04:AAC9: 2A        .byte $2A   ; 
- D 1 - I - 0x012ADA 04:AACA: 00        .byte $00   ; 
- D 1 - I - 0x012ADB 04:AACB: 35        .byte $35   ; 
- D 1 - I - 0x012ADC 04:AACC: 36        .byte $36   ; 
- D 1 - I - 0x012ADD 04:AACD: 37        .byte $37   ; 
- D 1 - I - 0x012ADE 04:AACE: 40        .byte $40   ; 
- D 1 - I - 0x012ADF 04:AACF: 41        .byte $41   ; 
- D 1 - I - 0x012AE0 04:AAD0: 42        .byte $42   ; 
- D 1 - I - 0x012AE1 04:AAD1: 2D        .byte $2D   ; 
- D 1 - I - 0x012AE2 04:AAD2: 4B        .byte $4B   ; 
- D 1 - I - 0x012AE3 04:AAD3: 4C        .byte $4C   ; 
- D 1 - I - 0x012AE4 04:AAD4: 4D        .byte $4D   ; 
- D 1 - I - 0x012AE5 04:AAD5: 4E        .byte $4E   ; 
- D 1 - I - 0x012AE6 04:AAD6: 2B        .byte $2B   ; 
- D 1 - I - 0x012AE7 04:AAD7: 2C        .byte $2C   ; 
- D 1 - I - 0x012AE8 04:AAD8: 2D        .byte $2D   ; 
- D 1 - I - 0x012AE9 04:AAD9: 2E        .byte $2E   ; 
- D 1 - I - 0x012AEA 04:AADA: 21        .byte $21   ; 
- D 1 - I - 0x012AEB 04:AADB: 38        .byte $38   ; 
- D 1 - I - 0x012AEC 04:AADC: 39        .byte $39   ; 
- D 1 - I - 0x012AED 04:AADD: 3A        .byte $3A   ; 
- D 1 - I - 0x012AEE 04:AADE: 43        .byte $43   ; 
- D 1 - I - 0x012AEF 04:AADF: 2C        .byte $2C   ; 
- D 1 - I - 0x012AF0 04:AAE0: 44        .byte $44   ; 
- D 1 - I - 0x012AF1 04:AAE1: 45        .byte $45   ; 
- D 1 - I - 0x012AF2 04:AAE2: 4D        .byte $4D   ; 
- D 1 - I - 0x012AF3 04:AAE3: 4C        .byte $4C   ; 
- D 1 - I - 0x012AF4 04:AAE4: FF        .byte $FF   ; 
- D 1 - I - 0x012AF5 04:AAE5: 4F        .byte $4F   ; 
- D 1 - I - 0x012AF6 04:AAE6: 2F        .byte $2F   ; 
- D 1 - I - 0x012AF7 04:AAE7: 30        .byte $30   ; 
- D 1 - I - 0x012AF8 04:AAE8: 14        .byte $14   ; 
- D 1 - I - 0x012AF9 04:AAE9: 31        .byte $31   ; 
- D 1 - I - 0x012AFA 04:AAEA: 3B        .byte $3B   ; 
- D 1 - I - 0x012AFB 04:AAEB: 3C        .byte $3C   ; 
- D 1 - I - 0x012AFC 04:AAEC: 1F        .byte $1F   ; 
- D 1 - I - 0x012AFD 04:AAED: 20        .byte $20   ; 
- D 1 - I - 0x012AFE 04:AAEE: 46        .byte $46   ; 
- D 1 - I - 0x012AFF 04:AAEF: 47        .byte $47   ; 
- D 1 - I - 0x012B00 04:AAF0: 2C        .byte $2C   ; 
- D 1 - I - 0x012B01 04:AAF1: 2D        .byte $2D   ; 
- D 1 - I - 0x012B02 04:AAF2: 50        .byte $50   ; 
- D 1 - I - 0x012B03 04:AAF3: FF        .byte $FF   ; 
- D 1 - I - 0x012B04 04:AAF4: 4D        .byte $4D   ; 
- D 1 - I - 0x012B05 04:AAF5: 4E        .byte $4E   ; 
- D 1 - I - 0x012B06 04:AAF6: 32        .byte $32   ; 
- D 1 - I - 0x012B07 04:AAF7: 33        .byte $33   ; 
- D 1 - I - 0x012B08 04:AAF8: 34        .byte $34   ; 
- D 1 - I - 0x012B09 04:AAF9: 00        .byte $00   ; 
- D 1 - I - 0x012B0A 04:AAFA: 3D        .byte $3D   ; 
- D 1 - I - 0x012B0B 04:AAFB: 3E        .byte $3E   ; 
- D 1 - I - 0x012B0C 04:AAFC: 3F        .byte $3F   ; 
- D 1 - I - 0x012B0D 04:AAFD: 00        .byte $00   ; 
- D 1 - I - 0x012B0E 04:AAFE: 43        .byte $43   ; 
- D 1 - I - 0x012B0F 04:AAFF: 48        .byte $48   ; 
- D 1 - I - 0x012B10 04:AB00: 49        .byte $49   ; 
- D 1 - I - 0x012B11 04:AB01: 4A        .byte $4A   ; 
- D 1 - I - 0x012B12 04:AB02: 4D        .byte $4D   ; 
- D 1 - I - 0x012B13 04:AB03: 51        .byte $51   ; 
- D 1 - I - 0x012B14 04:AB04: 4C        .byte $4C   ; 
- D 1 - I - 0x012B15 04:AB05: 52        .byte $52   ; 
- D 1 - I - 0x012B16 04:AB06: 00        .byte $00   ; 
- D 1 - I - 0x012B17 04:AB07: 00        .byte $00   ; 
- D 1 - I - 0x012B18 04:AB08: 53        .byte $53   ; 
- D 1 - I - 0x012B19 04:AB09: 54        .byte $54   ; 
- D 1 - I - 0x012B1A 04:AB0A: 00        .byte $00   ; 
- D 1 - I - 0x012B1B 04:AB0B: 00        .byte $00   ; 
- D 1 - I - 0x012B1C 04:AB0C: 00        .byte $00   ; 
- D 1 - I - 0x012B1D 04:AB0D: 00        .byte $00   ; 
- D 1 - I - 0x012B1E 04:AB0E: 00        .byte $00   ; 
- D 1 - I - 0x012B1F 04:AB0F: 00        .byte $00   ; 
- D 1 - I - 0x012B20 04:AB10: 00        .byte $00   ; 
- D 1 - I - 0x012B21 04:AB11: 00        .byte $00   ; 
- D 1 - I - 0x012B22 04:AB12: 00        .byte $00   ; 
- D 1 - I - 0x012B23 04:AB13: 00        .byte $00   ; 
- D 1 - I - 0x012B24 04:AB14: 00        .byte $00   ; 
- D 1 - I - 0x012B25 04:AB15: 00        .byte $00   ; 
- D 1 - I - 0x012B26 04:AB16: 55        .byte $55   ; 
- D 1 - I - 0x012B27 04:AB17: 56        .byte $56   ; 
- D 1 - I - 0x012B28 04:AB18: 53        .byte $53   ; 
- D 1 - I - 0x012B29 04:AB19: 54        .byte $54   ; 
- D 1 - I - 0x012B2A 04:AB1A: 00        .byte $00   ; 
- D 1 - I - 0x012B2B 04:AB1B: 00        .byte $00   ; 
- D 1 - I - 0x012B2C 04:AB1C: 00        .byte $00   ; 
- D 1 - I - 0x012B2D 04:AB1D: 00        .byte $00   ; 
- D 1 - I - 0x012B2E 04:AB1E: 00        .byte $00   ; 
- D 1 - I - 0x012B2F 04:AB1F: 00        .byte $00   ; 
- D 1 - I - 0x012B30 04:AB20: 00        .byte $00   ; 
- D 1 - I - 0x012B31 04:AB21: 00        .byte $00   ; 
- D 1 - I - 0x012B32 04:AB22: 00        .byte $00   ; 
- D 1 - I - 0x012B33 04:AB23: 00        .byte $00   ; 
- D 1 - I - 0x012B34 04:AB24: 00        .byte $00   ; 
- D 1 - I - 0x012B35 04:AB25: 00        .byte $00   ; 
- D 1 - I - 0x012B36 04:AB26: 55        .byte $55   ; 
- D 1 - I - 0x012B37 04:AB27: 56        .byte $56   ; 
- D 1 - I - 0x012B38 04:AB28: 00        .byte $00   ; 
- D 1 - I - 0x012B39 04:AB29: 00        .byte $00   ; 
- D 1 - I - 0x012B3A 04:AB2A: 00        .byte $00   ; 
- D 1 - I - 0x012B3B 04:AB2B: 00        .byte $00   ; 
- D 1 - I - 0x012B3C 04:AB2C: 00        .byte $00   ; 
- D 1 - I - 0x012B3D 04:AB2D: 00        .byte $00   ; 
- D 1 - I - 0x012B3E 04:AB2E: 00        .byte $00   ; 
- D 1 - I - 0x012B3F 04:AB2F: 00        .byte $00   ; 
- D 1 - I - 0x012B40 04:AB30: 00        .byte $00   ; 
- D 1 - I - 0x012B41 04:AB31: 00        .byte $00   ; 
- D 1 - I - 0x012B42 04:AB32: 00        .byte $00   ; 
- D 1 - I - 0x012B43 04:AB33: 00        .byte $00   ; 
- D 1 - I - 0x012B44 04:AB34: 00        .byte $00   ; 
- D 1 - I - 0x012B45 04:AB35: 00        .byte $00   ; 
- D 1 - I - 0x012B46 04:AB36: 00        .byte $00   ; 
- D 1 - I - 0x012B47 04:AB37: 00        .byte $00   ; 
- D 1 - I - 0x012B48 04:AB38: 00        .byte $00   ; 
- D 1 - I - 0x012B49 04:AB39: 00        .byte $00   ; 
- D 1 - I - 0x012B4A 04:AB3A: 00        .byte $00   ; 
- D 1 - I - 0x012B4B 04:AB3B: 00        .byte $00   ; 
- D 1 - I - 0x012B4C 04:AB3C: 00        .byte $00   ; 
- D 1 - I - 0x012B4D 04:AB3D: 00        .byte $00   ; 
- D 1 - I - 0x012B4E 04:AB3E: AC        .byte $AC   ; 
- D 1 - I - 0x012B4F 04:AB3F: AD        .byte $AD   ; 
- D 1 - I - 0x012B50 04:AB40: AE        .byte $AE   ; 
- D 1 - I - 0x012B51 04:AB41: AF        .byte $AF   ; 
- D 1 - I - 0x012B52 04:AB42: 9F        .byte $9F   ; 
- D 1 - I - 0x012B53 04:AB43: B0        .byte $B0   ; 
- D 1 - I - 0x012B54 04:AB44: AB        .byte $AB   ; 
- D 1 - I - 0x012B55 04:AB45: A2        .byte $A2   ; 
- D 1 - I - 0x012B56 04:AB46: 00        .byte $00   ; 
- D 1 - I - 0x012B57 04:AB47: 00        .byte $00   ; 
- D 1 - I - 0x012B58 04:AB48: 00        .byte $00   ; 
- D 1 - I - 0x012B59 04:AB49: 00        .byte $00   ; 
- D 1 - I - 0x012B5A 04:AB4A: 97        .byte $97   ; 
- D 1 - I - 0x012B5B 04:AB4B: 98        .byte $98   ; 
- D 1 - I - 0x012B5C 04:AB4C: 99        .byte $99   ; 
- D 1 - I - 0x012B5D 04:AB4D: 9A        .byte $9A   ; 
- D 1 - I - 0x012B5E 04:AB4E: 9B        .byte $9B   ; 
- D 1 - I - 0x012B5F 04:AB4F: 9C        .byte $9C   ; 
- D 1 - I - 0x012B60 04:AB50: 9D        .byte $9D   ; 
- D 1 - I - 0x012B61 04:AB51: 9E        .byte $9E   ; 
- D 1 - I - 0x012B62 04:AB52: 9F        .byte $9F   ; 
- D 1 - I - 0x012B63 04:AB53: A0        .byte $A0   ; 
- D 1 - I - 0x012B64 04:AB54: A1        .byte $A1   ; 
- D 1 - I - 0x012B65 04:AB55: A2        .byte $A2   ; 
- D 1 - I - 0x012B66 04:AB56: A3        .byte $A3   ; 
- D 1 - I - 0x012B67 04:AB57: 98        .byte $98   ; 
- D 1 - I - 0x012B68 04:AB58: 99        .byte $99   ; 
- D 1 - I - 0x012B69 04:AB59: 9A        .byte $9A   ; 
- D 1 - I - 0x012B6A 04:AB5A: A4        .byte $A4   ; 
- D 1 - I - 0x012B6B 04:AB5B: 9C        .byte $9C   ; 
- D 1 - I - 0x012B6C 04:AB5C: 9D        .byte $9D   ; 
- D 1 - I - 0x012B6D 04:AB5D: A5        .byte $A5   ; 
- D 1 - I - 0x012B6E 04:AB5E: A6        .byte $A6   ; 
- D 1 - I - 0x012B6F 04:AB5F: A7        .byte $A7   ; 
- D 1 - I - 0x012B70 04:AB60: A8        .byte $A8   ; 
- D 1 - I - 0x012B71 04:AB61: A9        .byte $A9   ; 
- D 1 - I - 0x012B72 04:AB62: 9F        .byte $9F   ; 
- D 1 - I - 0x012B73 04:AB63: AA        .byte $AA   ; 
- D 1 - I - 0x012B74 04:AB64: AB        .byte $AB   ; 
- D 1 - I - 0x012B75 04:AB65: A2        .byte $A2   ; 
- - - - - - 0x012B76 04:AB66: 00        .byte $00   ; 
- - - - - - 0x012B77 04:AB67: 00        .byte $00   ; 
- - - - - - 0x012B78 04:AB68: 00        .byte $00   ; 
- - - - - - 0x012B79 04:AB69: 00        .byte $00   ; 
- - - - - - 0x012B7A 04:AB6A: B1        .byte $B1   ; 
- - - - - - 0x012B7B 04:AB6B: 2E        .byte $2E   ; 
- - - - - - 0x012B7C 04:AB6C: B2        .byte $B2   ; 
- - - - - - 0x012B7D 04:AB6D: B3        .byte $B3   ; 
- - - - - - 0x012B7E 04:AB6E: B4        .byte $B4   ; 
- - - - - - 0x012B7F 04:AB6F: B5        .byte $B5   ; 
- - - - - - 0x012B80 04:AB70: B6        .byte $B6   ; 
- - - - - - 0x012B81 04:AB71: B7        .byte $B7   ; 
- - - - - - 0x012B82 04:AB72: B8        .byte $B8   ; 
- - - - - - 0x012B83 04:AB73: B0        .byte $B0   ; 
- - - - - - 0x012B84 04:AB74: B9        .byte $B9   ; 
- - - - - - 0x012B85 04:AB75: BA        .byte $BA   ; 
- - - - - - 0x012B86 04:AB76: B1        .byte $B1   ; 
- - - - - - 0x012B87 04:AB77: 2E        .byte $2E   ; 
- - - - - - 0x012B88 04:AB78: B2        .byte $B2   ; 
- - - - - - 0x012B89 04:AB79: BB        .byte $BB   ; 
- - - - - - 0x012B8A 04:AB7A: B4        .byte $B4   ; 
- - - - - - 0x012B8B 04:AB7B: B5        .byte $B5   ; 
- - - - - - 0x012B8C 04:AB7C: B6        .byte $B6   ; 
- - - - - - 0x012B8D 04:AB7D: BC        .byte $BC   ; 
- - - - - - 0x012B8E 04:AB7E: 95        .byte $95   ; 
- - - - - - 0x012B8F 04:AB7F: BD        .byte $BD   ; 
- - - - - - 0x012B90 04:AB80: BE        .byte $BE   ; 
- - - - - - 0x012B91 04:AB81: BF        .byte $BF   ; 
- - - - - - 0x012B92 04:AB82: 96        .byte $96   ; 
- - - - - - 0x012B93 04:AB83: C0        .byte $C0   ; 
- - - - - - 0x012B94 04:AB84: C1        .byte $C1   ; 
- - - - - - 0x012B95 04:AB85: BA        .byte $BA   ; 
- - - - - - 0x012B96 04:AB86: 00        .byte $00   ; 
- - - - - - 0x012B97 04:AB87: 00        .byte $00   ; 
- - - - - - 0x012B98 04:AB88: 00        .byte $00   ; 
- - - - - - 0x012B99 04:AB89: 00        .byte $00   ; 
- - - - - - 0x012B9A 04:AB8A: 00        .byte $00   ; 
- - - - - - 0x012B9B 04:AB8B: 00        .byte $00   ; 
- - - - - - 0x012B9C 04:AB8C: 00        .byte $00   ; 
- - - - - - 0x012B9D 04:AB8D: 00        .byte $00   ; 
- - - - - - 0x012B9E 04:AB8E: C2        .byte $C2   ; 
- - - - - - 0x012B9F 04:AB8F: AE        .byte $AE   ; 
- - - - - - 0x012BA0 04:AB90: C3        .byte $C3   ; 
- - - - - - 0x012BA1 04:AB91: 2E        .byte $2E   ; 
- - - - - - 0x012BA2 04:AB92: B8        .byte $B8   ; 
- - - - - - 0x012BA3 04:AB93: B0        .byte $B0   ; 
- - - - - - 0x012BA4 04:AB94: B9        .byte $B9   ; 
- - - - - - 0x012BA5 04:AB95: BA        .byte $BA   ; 
- D 1 - I - 0x012BA6 04:AB96: 00        .byte $00   ; 
- D 1 - I - 0x012BA7 04:AB97: 00        .byte $00   ; 
- D 1 - I - 0x012BA8 04:AB98: 00        .byte $00   ; 
- D 1 - I - 0x012BA9 04:AB99: 00        .byte $00   ; 
- D 1 - I - 0x012BAA 04:AB9A: 00        .byte $00   ; 
- D 1 - I - 0x012BAB 04:AB9B: 00        .byte $00   ; 
- D 1 - I - 0x012BAC 04:AB9C: 00        .byte $00   ; 
- D 1 - I - 0x012BAD 04:AB9D: 00        .byte $00   ; 
- D 1 - I - 0x012BAE 04:AB9E: 00        .byte $00   ; 
- D 1 - I - 0x012BAF 04:AB9F: 00        .byte $00   ; 
- D 1 - I - 0x012BB0 04:ABA0: 19        .byte $19   ; 
- D 1 - I - 0x012BB1 04:ABA1: 8F        .byte $8F   ; 
- D 1 - I - 0x012BB2 04:ABA2: 00        .byte $00   ; 
- D 1 - I - 0x012BB3 04:ABA3: 1B        .byte $1B   ; 
- D 1 - I - 0x012BB4 04:ABA4: 27        .byte $27   ; 
- D 1 - I - 0x012BB5 04:ABA5: 27        .byte $27   ; 
- D 1 - I - 0x012BB6 04:ABA6: 00        .byte $00   ; 
- D 1 - I - 0x012BB7 04:ABA7: 00        .byte $00   ; 
- D 1 - I - 0x012BB8 04:ABA8: 00        .byte $00   ; 
- D 1 - I - 0x012BB9 04:ABA9: 00        .byte $00   ; 
- D 1 - I - 0x012BBA 04:ABAA: 00        .byte $00   ; 
- D 1 - I - 0x012BBB 04:ABAB: 19        .byte $19   ; 
- D 1 - I - 0x012BBC 04:ABAC: 19        .byte $19   ; 
- D 1 - I - 0x012BBD 04:ABAD: 19        .byte $19   ; 
- D 1 - I - 0x012BBE 04:ABAE: 1A        .byte $1A   ; 
- D 1 - I - 0x012BBF 04:ABAF: 90        .byte $90   ; 
- D 1 - I - 0x012BC0 04:ABB0: 1A        .byte $1A   ; 
- D 1 - I - 0x012BC1 04:ABB1: 90        .byte $90   ; 
- D 1 - I - 0x012BC2 04:ABB2: 27        .byte $27   ; 
- D 1 - I - 0x012BC3 04:ABB3: 27        .byte $27   ; 
- D 1 - I - 0x012BC4 04:ABB4: 27        .byte $27   ; 
- D 1 - I - 0x012BC5 04:ABB5: 1F        .byte $1F   ; 
- D 1 - I - 0x012BC6 04:ABB6: 00        .byte $00   ; 
- D 1 - I - 0x012BC7 04:ABB7: 00        .byte $00   ; 
- D 1 - I - 0x012BC8 04:ABB8: 00        .byte $00   ; 
- D 1 - I - 0x012BC9 04:ABB9: 00        .byte $00   ; 
- D 1 - I - 0x012BCA 04:ABBA: 00        .byte $00   ; 
- D 1 - I - 0x012BCB 04:ABBB: 00        .byte $00   ; 
- D 1 - I - 0x012BCC 04:ABBC: 00        .byte $00   ; 
- D 1 - I - 0x012BCD 04:ABBD: 1B        .byte $1B   ; 
- D 1 - I - 0x012BCE 04:ABBE: 00        .byte $00   ; 
- D 1 - I - 0x012BCF 04:ABBF: 00        .byte $00   ; 
- D 1 - I - 0x012BD0 04:ABC0: 00        .byte $00   ; 
- D 1 - I - 0x012BD1 04:ABC1: 27        .byte $27   ; 
- D 1 - I - 0x012BD2 04:ABC2: 00        .byte $00   ; 
- D 1 - I - 0x012BD3 04:ABC3: 00        .byte $00   ; 
- D 1 - I - 0x012BD4 04:ABC4: 1B        .byte $1B   ; 
- D 1 - I - 0x012BD5 04:ABC5: 1A        .byte $1A   ; 
- D 1 - I - 0x012BD6 04:ABC6: 1B        .byte $1B   ; 
- D 1 - I - 0x012BD7 04:ABC7: 91        .byte $91   ; 
- D 1 - I - 0x012BD8 04:ABC8: 1C        .byte $1C   ; 
- D 1 - I - 0x012BD9 04:ABC9: 00        .byte $00   ; 
- D 1 - I - 0x012BDA 04:ABCA: 91        .byte $91   ; 
- D 1 - I - 0x012BDB 04:ABCB: 1C        .byte $1C   ; 
- D 1 - I - 0x012BDC 04:ABCC: 00        .byte $00   ; 
- D 1 - I - 0x012BDD 04:ABCD: 00        .byte $00   ; 
- D 1 - I - 0x012BDE 04:ABCE: 1D        .byte $1D   ; 
- D 1 - I - 0x012BDF 04:ABCF: 00        .byte $00   ; 
- D 1 - I - 0x012BE0 04:ABD0: 00        .byte $00   ; 
- D 1 - I - 0x012BE1 04:ABD1: 00        .byte $00   ; 
- D 1 - I - 0x012BE2 04:ABD2: 1C        .byte $1C   ; 
- D 1 - I - 0x012BE3 04:ABD3: 00        .byte $00   ; 
- D 1 - I - 0x012BE4 04:ABD4: 00        .byte $00   ; 
- D 1 - I - 0x012BE5 04:ABD5: 00        .byte $00   ; 
- D 1 - I - 0x012BE6 04:ABD6: 1E        .byte $1E   ; 
- D 1 - I - 0x012BE7 04:ABD7: 92        .byte $92   ; 
- D 1 - I - 0x012BE8 04:ABD8: 1A        .byte $1A   ; 
- D 1 - I - 0x012BE9 04:ABD9: 27        .byte $27   ; 
- D 1 - I - 0x012BEA 04:ABDA: 27        .byte $27   ; 
- D 1 - I - 0x012BEB 04:ABDB: 1F        .byte $1F   ; 
- D 1 - I - 0x012BEC 04:ABDC: 93        .byte $93   ; 
- D 1 - I - 0x012BED 04:ABDD: 1A        .byte $1A   ; 
- D 1 - I - 0x012BEE 04:ABDE: 1B        .byte $1B   ; 
- D 1 - I - 0x012BEF 04:ABDF: 27        .byte $27   ; 
- D 1 - I - 0x012BF0 04:ABE0: 1F        .byte $1F   ; 
- D 1 - I - 0x012BF1 04:ABE1: 94        .byte $94   ; 
- D 1 - I - 0x012BF2 04:ABE2: 27        .byte $27   ; 
- D 1 - I - 0x012BF3 04:ABE3: 27        .byte $27   ; 
- D 1 - I - 0x012BF4 04:ABE4: 91        .byte $91   ; 
- D 1 - I - 0x012BF5 04:ABE5: 1E        .byte $1E   ; 
- D 1 - I - 0x012BF6 04:ABE6: 1F        .byte $1F   ; 
- D 1 - I - 0x012BF7 04:ABE7: 93        .byte $93   ; 
- D 1 - I - 0x012BF8 04:ABE8: 26        .byte $26   ; 
- D 1 - I - 0x012BF9 04:ABE9: 27        .byte $27   ; 
- D 1 - I - 0x012BFA 04:ABEA: 91        .byte $91   ; 
- D 1 - I - 0x012BFB 04:ABEB: 1E        .byte $1E   ; 
- D 1 - I - 0x012BFC 04:ABEC: 92        .byte $92   ; 
- D 1 - I - 0x012BFD 04:ABED: 1A        .byte $1A   ; 
- D 1 - I - 0x012BFE 04:ABEE: 26        .byte $26   ; 
- D 1 - I - 0x012BFF 04:ABEF: 27        .byte $27   ; 
- D 1 - I - 0x012C00 04:ABF0: 1F        .byte $1F   ; 
- D 1 - I - 0x012C01 04:ABF1: 94        .byte $94   ; 
- D 1 - I - 0x012C02 04:ABF2: 92        .byte $92   ; 
- D 1 - I - 0x012C03 04:ABF3: 1A        .byte $1A   ; 
- D 1 - I - 0x012C04 04:ABF4: 91        .byte $91   ; 
- D 1 - I - 0x012C05 04:ABF5: 1E        .byte $1E   ; 
- D 1 - I - 0x012C06 04:ABF6: 00        .byte $00   ; 
- D 1 - I - 0x012C07 04:ABF7: 1B        .byte $1B   ; 
- D 1 - I - 0x012C08 04:ABF8: 27        .byte $27   ; 
- D 1 - I - 0x012C09 04:ABF9: 1D        .byte $1D   ; 
- D 1 - I - 0x012C0A 04:ABFA: 00        .byte $00   ; 
- D 1 - I - 0x012C0B 04:ABFB: 27        .byte $27   ; 
- D 1 - I - 0x012C0C 04:ABFC: 91        .byte $91   ; 
- D 1 - I - 0x012C0D 04:ABFD: 1C        .byte $1C   ; 
- D 1 - I - 0x012C0E 04:ABFE: 2E        .byte $2E   ; 
- D 1 - I - 0x012C0F 04:ABFF: 2E        .byte $2E   ; 
- D 1 - I - 0x012C10 04:AC00: 44        .byte $44   ; 
- D 1 - I - 0x012C11 04:AC01: 2E        .byte $2E   ; 
- D 1 - I - 0x012C12 04:AC02: DE        .byte $DE   ; 
- D 1 - I - 0x012C13 04:AC03: DE        .byte $DE   ; 
- D 1 - I - 0x012C14 04:AC04: DF        .byte $DF   ; 
- D 1 - I - 0x012C15 04:AC05: DE        .byte $DE   ; 
- D 1 - I - 0x012C16 04:AC06: 00        .byte $00   ; 
- D 1 - I - 0x012C17 04:AC07: 00        .byte $00   ; 
- D 1 - I - 0x012C18 04:AC08: 00        .byte $00   ; 
- D 1 - I - 0x012C19 04:AC09: 1B        .byte $1B   ; 
- D 1 - I - 0x012C1A 04:AC0A: 00        .byte $00   ; 
- D 1 - I - 0x012C1B 04:AC0B: 00        .byte $00   ; 
- D 1 - I - 0x012C1C 04:AC0C: 00        .byte $00   ; 
- D 1 - I - 0x012C1D 04:AC0D: 27        .byte $27   ; 
- D 1 - I - 0x012C1E 04:AC0E: 5E        .byte $5E   ; 
- D 1 - I - 0x012C1F 04:AC0F: 00        .byte $00   ; 
- D 1 - I - 0x012C20 04:AC10: 5F        .byte $5F   ; 
- D 1 - I - 0x012C21 04:AC11: 93        .byte $93   ; 
- D 1 - I - 0x012C22 04:AC12: 8E        .byte $8E   ; 
- D 1 - I - 0x012C23 04:AC13: 00        .byte $00   ; 
- D 1 - I - 0x012C24 04:AC14: 27        .byte $27   ; 
- D 1 - I - 0x012C25 04:AC15: 1E        .byte $1E   ; 
- D 1 - I - 0x012C26 04:AC16: 1F        .byte $1F   ; 
- D 1 - I - 0x012C27 04:AC17: 93        .byte $93   ; 
- D 1 - I - 0x012C28 04:AC18: 26        .byte $26   ; 
- D 1 - I - 0x012C29 04:AC19: 27        .byte $27   ; 
- D 1 - I - 0x012C2A 04:AC1A: 91        .byte $91   ; 
- D 1 - I - 0x012C2B 04:AC1B: 1E        .byte $1E   ; 
- D 1 - I - 0x012C2C 04:AC1C: 92        .byte $92   ; 
- D 1 - I - 0x012C2D 04:AC1D: 1A        .byte $1A   ; 
- D 1 - I - 0x012C2E 04:AC1E: 60        .byte $60   ; 
- D 1 - I - 0x012C2F 04:AC1F: 27        .byte $27   ; 
- D 1 - I - 0x012C30 04:AC20: 61        .byte $61   ; 
- D 1 - I - 0x012C31 04:AC21: 94        .byte $94   ; 
- D 1 - I - 0x012C32 04:AC22: 92        .byte $92   ; 
- D 1 - I - 0x012C33 04:AC23: 1A        .byte $1A   ; 
- D 1 - I - 0x012C34 04:AC24: 91        .byte $91   ; 
- D 1 - I - 0x012C35 04:AC25: 1E        .byte $1E   ; 
- D 1 - I - 0x012C36 04:AC26: 1F        .byte $1F   ; 
- D 1 - I - 0x012C37 04:AC27: 94        .byte $94   ; 
- D 1 - I - 0x012C38 04:AC28: 26        .byte $26   ; 
- D 1 - I - 0x012C39 04:AC29: 27        .byte $27   ; 
- D 1 - I - 0x012C3A 04:AC2A: 91        .byte $91   ; 
- D 1 - I - 0x012C3B 04:AC2B: 1E        .byte $1E   ; 
- D 1 - I - 0x012C3C 04:AC2C: 92        .byte $92   ; 
- D 1 - I - 0x012C3D 04:AC2D: 1A        .byte $1A   ; 
- D 1 - I - 0x012C3E 04:AC2E: 62        .byte $62   ; 
- D 1 - I - 0x012C3F 04:AC2F: 93        .byte $93   ; 
- D 1 - I - 0x012C40 04:AC30: 61        .byte $61   ; 
- D 1 - I - 0x012C41 04:AC31: 94        .byte $94   ; 
- D 1 - I - 0x012C42 04:AC32: 90        .byte $90   ; 
- D 1 - I - 0x012C43 04:AC33: 1A        .byte $1A   ; 
- D 1 - I - 0x012C44 04:AC34: 91        .byte $91   ; 
- D 1 - I - 0x012C45 04:AC35: 1E        .byte $1E   ; 
- D 1 - I - 0x012C46 04:AC36: 5D        .byte $5D   ; 
- D 1 - I - 0x012C47 04:AC37: 5F        .byte $5F   ; 
- D 1 - I - 0x012C48 04:AC38: 62        .byte $62   ; 
- D 1 - I - 0x012C49 04:AC39: 27        .byte $27   ; 
- D 1 - I - 0x012C4A 04:AC3A: 93        .byte $93   ; 
- D 1 - I - 0x012C4B 04:AC3B: 1E        .byte $1E   ; 
- D 1 - I - 0x012C4C 04:AC3C: 90        .byte $90   ; 
- D 1 - I - 0x012C4D 04:AC3D: 1A        .byte $1A   ; 
- D 1 - I - 0x012C4E 04:AC3E: 63        .byte $63   ; 
- D 1 - I - 0x012C4F 04:AC3F: 27        .byte $27   ; 
- D 1 - I - 0x012C50 04:AC40: 61        .byte $61   ; 
- D 1 - I - 0x012C51 04:AC41: 94        .byte $94   ; 
- D 1 - I - 0x012C52 04:AC42: 27        .byte $27   ; 
- D 1 - I - 0x012C53 04:AC43: 1E        .byte $1E   ; 
- D 1 - I - 0x012C54 04:AC44: 93        .byte $93   ; 
- D 1 - I - 0x012C55 04:AC45: 1E        .byte $1E   ; 
- D 1 - I - 0x012C56 04:AC46: 61        .byte $61   ; 
- D 1 - I - 0x012C57 04:AC47: 94        .byte $94   ; 
- D 1 - I - 0x012C58 04:AC48: 60        .byte $60   ; 
- D 1 - I - 0x012C59 04:AC49: 27        .byte $27   ; 
- D 1 - I - 0x012C5A 04:AC4A: 91        .byte $91   ; 
- D 1 - I - 0x012C5B 04:AC4B: 1E        .byte $1E   ; 
- D 1 - I - 0x012C5C 04:AC4C: 92        .byte $92   ; 
- D 1 - I - 0x012C5D 04:AC4D: 1A        .byte $1A   ; 
- D 1 - I - 0x012C5E 04:AC4E: 62        .byte $62   ; 
- D 1 - I - 0x012C5F 04:AC4F: 93        .byte $93   ; 
- D 1 - I - 0x012C60 04:AC50: 61        .byte $61   ; 
- D 1 - I - 0x012C61 04:AC51: 94        .byte $94   ; 
- D 1 - I - 0x012C62 04:AC52: 90        .byte $90   ; 
- D 1 - I - 0x012C63 04:AC53: 1A        .byte $1A   ; 
- D 1 - I - 0x012C64 04:AC54: 91        .byte $91   ; 
- D 1 - I - 0x012C65 04:AC55: 1E        .byte $1E   ; 
- D 1 - I - 0x012C66 04:AC56: 61        .byte $61   ; 
- D 1 - I - 0x012C67 04:AC57: 93        .byte $93   ; 
- D 1 - I - 0x012C68 04:AC58: 60        .byte $60   ; 
- D 1 - I - 0x012C69 04:AC59: 27        .byte $27   ; 
- D 1 - I - 0x012C6A 04:AC5A: 91        .byte $91   ; 
- D 1 - I - 0x012C6B 04:AC5B: 1E        .byte $1E   ; 
- D 1 - I - 0x012C6C 04:AC5C: 92        .byte $92   ; 
- D 1 - I - 0x012C6D 04:AC5D: 1A        .byte $1A   ; 
- D 1 - I - 0x012C6E 04:AC5E: 60        .byte $60   ; 
- D 1 - I - 0x012C6F 04:AC5F: 27        .byte $27   ; 
- D 1 - I - 0x012C70 04:AC60: 61        .byte $61   ; 
- D 1 - I - 0x012C71 04:AC61: 94        .byte $94   ; 
- D 1 - I - 0x012C72 04:AC62: 92        .byte $92   ; 
- D 1 - I - 0x012C73 04:AC63: 1A        .byte $1A   ; 
- D 1 - I - 0x012C74 04:AC64: 91        .byte $91   ; 
- D 1 - I - 0x012C75 04:AC65: 1E        .byte $1E   ; 
- D 1 - I - 0x012C76 04:AC66: 00        .byte $00   ; 
- D 1 - I - 0x012C77 04:AC67: 00        .byte $00   ; 
- D 1 - I - 0x012C78 04:AC68: 2D        .byte $2D   ; 
- D 1 - I - 0x012C79 04:AC69: A2        .byte $A2   ; 
- D 1 - I - 0x012C7A 04:AC6A: 00        .byte $00   ; 
- D 1 - I - 0x012C7B 04:AC6B: 00        .byte $00   ; 
- D 1 - I - 0x012C7C 04:AC6C: A3        .byte $A3   ; 
- D 1 - I - 0x012C7D 04:AC6D: A3        .byte $A3   ; 
- D 1 - I - 0x012C7E 04:AC6E: 3E        .byte $3E   ; 
- D 1 - I - 0x012C7F 04:AC6F: 55        .byte $55   ; 
- D 1 - I - 0x012C80 04:AC70: 22        .byte $22   ; 
- D 1 - I - 0x012C81 04:AC71: 27        .byte $27   ; 
- D 1 - I - 0x012C82 04:AC72: 39        .byte $39   ; 
- D 1 - I - 0x012C83 04:AC73: A0        .byte $A0   ; 
- D 1 - I - 0x012C84 04:AC74: 3E        .byte $3E   ; 
- D 1 - I - 0x012C85 04:AC75: 55        .byte $55   ; 
- D 1 - I - 0x012C86 04:AC76: 2C        .byte $2C   ; 
- D 1 - I - 0x012C87 04:AC77: A2        .byte $A2   ; 
- D 1 - I - 0x012C88 04:AC78: 2C        .byte $2C   ; 
- D 1 - I - 0x012C89 04:AC79: 3E        .byte $3E   ; 
- D 1 - I - 0x012C8A 04:AC7A: 52        .byte $52   ; 
- D 1 - I - 0x012C8B 04:AC7B: A3        .byte $A3   ; 
- D 1 - I - 0x012C8C 04:AC7C: A3        .byte $A3   ; 
- D 1 - I - 0x012C8D 04:AC7D: 1F        .byte $1F   ; 
- D 1 - I - 0x012C8E 04:AC7E: 0A        .byte $0A   ; 
- D 1 - I - 0x012C8F 04:AC7F: 1E        .byte $1E   ; 
- D 1 - I - 0x012C90 04:AC80: 24        .byte $24   ; 
- D 1 - I - 0x012C91 04:AC81: 4A        .byte $4A   ; 
- D 1 - I - 0x012C92 04:AC82: 23        .byte $23   ; 
- D 1 - I - 0x012C93 04:AC83: 06        .byte $06   ; 
- D 1 - I - 0x012C94 04:AC84: 25        .byte $25   ; 
- D 1 - I - 0x012C95 04:AC85: 20        .byte $20   ; 



_off007_0x012C96_04_area_5:
- D 1 - I - 0x012C96 04:AC86: 00        .byte $00   ; 
- D 1 - I - 0x012C97 04:AC87: FF        .byte $FF   ; 
- D 1 - I - 0x012C98 04:AC88: FF        .byte $FF   ; 
- D 1 - I - 0x012C99 04:AC89: FF        .byte $FF   ; 
- D 1 - I - 0x012C9A 04:AC8A: FF        .byte $FF   ; 
- D 1 - I - 0x012C9B 04:AC8B: FF        .byte $FF   ; 
- D 1 - I - 0x012C9C 04:AC8C: FF        .byte $FF   ; 
- D 1 - I - 0x012C9D 04:AC8D: FF        .byte $FF   ; 
- D 1 - I - 0x012C9E 04:AC8E: FF        .byte $FF   ; 
- D 1 - I - 0x012C9F 04:AC8F: FF        .byte $FF   ; 
- D 1 - I - 0x012CA0 04:AC90: FF        .byte $FF   ; 
- D 1 - I - 0x012CA1 04:AC91: FF        .byte $FF   ; 
- D 1 - I - 0x012CA2 04:AC92: FF        .byte $FF   ; 
- D 1 - I - 0x012CA3 04:AC93: FF        .byte $FF   ; 
- D 1 - I - 0x012CA4 04:AC94: FF        .byte $FF   ; 
- D 1 - I - 0x012CA5 04:AC95: FF        .byte $FF   ; 
- D 1 - I - 0x012CA6 04:AC96: FF        .byte $FF   ; 
- D 1 - I - 0x012CA7 04:AC97: FF        .byte $FF   ; 
- D 1 - I - 0x012CA8 04:AC98: FF        .byte $FF   ; 
- D 1 - I - 0x012CA9 04:AC99: 05        .byte $05   ; 
- D 1 - I - 0x012CAA 04:AC9A: 55        .byte $55   ; 
- D 1 - I - 0x012CAB 04:AC9B: 55        .byte $55   ; 
- D 1 - I - 0x012CAC 04:AC9C: 55        .byte $55   ; 
- D 1 - I - 0x012CAD 04:AC9D: 55        .byte $55   ; 
- D 1 - I - 0x012CAE 04:AC9E: 05        .byte $05   ; 
- D 1 - I - 0x012CAF 04:AC9F: 05        .byte $05   ; 
- D 1 - I - 0x012CB0 04:ACA0: 05        .byte $05   ; 
- D 1 - I - 0x012CB1 04:ACA1: 05        .byte $05   ; 
- D 1 - I - 0x012CB2 04:ACA2: 00        .byte $00   ; 
- D 1 - I - 0x012CB3 04:ACA3: 50        .byte $50   ; 
- D 1 - I - 0x012CB4 04:ACA4: 50        .byte $50   ; 
- D 1 - I - 0x012CB5 04:ACA5: 00        .byte $00   ; 
- D 1 - I - 0x012CB6 04:ACA6: 00        .byte $00   ; 
- D 1 - I - 0x012CB7 04:ACA7: 50        .byte $50   ; 
- D 1 - I - 0x012CB8 04:ACA8: 50        .byte $50   ; 
- D 1 - I - 0x012CB9 04:ACA9: 00        .byte $00   ; 
- D 1 - I - 0x012CBA 04:ACAA: 00        .byte $00   ; 
- D 1 - I - 0x012CBB 04:ACAB: 00        .byte $00   ; 
- D 1 - I - 0x012CBC 04:ACAC: 00        .byte $00   ; 
- D 1 - I - 0x012CBD 04:ACAD: 00        .byte $00   ; 
- D 1 - I - 0x012CBE 04:ACAE: 05        .byte $05   ; 
- D 1 - I - 0x012CBF 04:ACAF: 05        .byte $05   ; 
- D 1 - I - 0x012CC0 04:ACB0: 05        .byte $05   ; 
- D 1 - I - 0x012CC1 04:ACB1: 05        .byte $05   ; 
- D 1 - I - 0x012CC2 04:ACB2: 05        .byte $05   ; 
- D 1 - I - 0x012CC3 04:ACB3: 05        .byte $05   ; 
- D 1 - I - 0x012CC4 04:ACB4: 05        .byte $05   ; 
- D 1 - I - 0x012CC5 04:ACB5: 05        .byte $05   ; 
- D 1 - I - 0x012CC6 04:ACB6: 00        .byte $00   ; 
- D 1 - I - 0x012CC7 04:ACB7: 00        .byte $00   ; 
- D 1 - I - 0x012CC8 04:ACB8: 00        .byte $00   ; 
- D 1 - I - 0x012CC9 04:ACB9: 00        .byte $00   ; 
- D 1 - I - 0x012CCA 04:ACBA: 50        .byte $50   ; 
- D 1 - I - 0x012CCB 04:ACBB: 55        .byte $55   ; 
- - - - - - 0x012CCC 04:ACBC: 00        .byte $00   ; 
- D 1 - I - 0x012CCD 04:ACBD: 00        .byte $00   ; 
- D 1 - I - 0x012CCE 04:ACBE: 05        .byte $05   ; 
- D 1 - I - 0x012CCF 04:ACBF: 05        .byte $05   ; 
- D 1 - I - 0x012CD0 04:ACC0: 55        .byte $55   ; 
- D 1 - I - 0x012CD1 04:ACC1: 50        .byte $50   ; 
- D 1 - I - 0x012CD2 04:ACC2: 00        .byte $00   ; 
- D 1 - I - 0x012CD3 04:ACC3: 00        .byte $00   ; 
- D 1 - I - 0x012CD4 04:ACC4: 00        .byte $00   ; 
- D 1 - I - 0x012CD5 04:ACC5: 50        .byte $50   ; 
- D 1 - I - 0x012CD6 04:ACC6: 00        .byte $00   ; 
- D 1 - I - 0x012CD7 04:ACC7: 00        .byte $00   ; 
- D 1 - I - 0x012CD8 04:ACC8: 05        .byte $05   ; 
- D 1 - I - 0x012CD9 04:ACC9: 05        .byte $05   ; 
- D 1 - I - 0x012CDA 04:ACCA: 05        .byte $05   ; 
- D 1 - I - 0x012CDB 04:ACCB: 05        .byte $05   ; 
- D 1 - I - 0x012CDC 04:ACCC: 00        .byte $00   ; 
- D 1 - I - 0x012CDD 04:ACCD: 00        .byte $00   ; 
- D 1 - I - 0x012CDE 04:ACCE: 05        .byte $05   ; 
- D 1 - I - 0x012CDF 04:ACCF: 00        .byte $00   ; 
- D 1 - I - 0x012CE0 04:ACD0: 00        .byte $00   ; 
- D 1 - I - 0x012CE1 04:ACD1: 00        .byte $00   ; 
- D 1 - I - 0x012CE2 04:ACD2: 00        .byte $00   ; 
- D 1 - I - 0x012CE3 04:ACD3: 05        .byte $05   ; 
- D 1 - I - 0x012CE4 04:ACD4: 05        .byte $05   ; 
- D 1 - I - 0x012CE5 04:ACD5: 05        .byte $05   ; 
- D 1 - I - 0x012CE6 04:ACD6: 00        .byte $00   ; 
- D 1 - I - 0x012CE7 04:ACD7: 00        .byte $00   ; 
- D 1 - I - 0x012CE8 04:ACD8: 00        .byte $00   ; 
- D 1 - I - 0x012CE9 04:ACD9: 00        .byte $00   ; 
- D 1 - I - 0x012CEA 04:ACDA: AA        .byte $AA   ; 
- D 1 - I - 0x012CEB 04:ACDB: AA        .byte $AA   ; 
- D 1 - I - 0x012CEC 04:ACDC: AA        .byte $AA   ; 
- D 1 - I - 0x012CED 04:ACDD: AA        .byte $AA   ; 
- D 1 - I - 0x012CEE 04:ACDE: AA        .byte $AA   ; 
- D 1 - I - 0x012CEF 04:ACDF: AA        .byte $AA   ; 
- D 1 - I - 0x012CF0 04:ACE0: AA        .byte $AA   ; 
- D 1 - I - 0x012CF1 04:ACE1: AA        .byte $AA   ; 
- D 1 - I - 0x012CF2 04:ACE2: 00        .byte $00   ; 
- D 1 - I - 0x012CF3 04:ACE3: 00        .byte $00   ; 
- D 1 - I - 0x012CF4 04:ACE4: 00        .byte $00   ; 
- D 1 - I - 0x012CF5 04:ACE5: 0A        .byte $0A   ; 
- D 1 - I - 0x012CF6 04:ACE6: FF        .byte $FF   ; 
- D 1 - I - 0x012CF7 04:ACE7: FF        .byte $FF   ; 
- D 1 - I - 0x012CF8 04:ACE8: FF        .byte $FF   ; 
- D 1 - I - 0x012CF9 04:ACE9: 05        .byte $05   ; 
- D 1 - I - 0x012CFA 04:ACEA: FF        .byte $FF   ; 
- D 1 - I - 0x012CFB 04:ACEB: FF        .byte $FF   ; 
- D 1 - I - 0x012CFC 04:ACEC: FF        .byte $FF   ; 
- D 1 - I - 0x012CFD 04:ACED: FF        .byte $FF   ; 
- D 1 - I - 0x012CFE 04:ACEE: FF        .byte $FF   ; 
- D 1 - I - 0x012CFF 04:ACEF: FF        .byte $FF   ; 
- D 1 - I - 0x012D00 04:ACF0: FF        .byte $FF   ; 
- D 1 - I - 0x012D01 04:ACF1: FF        .byte $FF   ; 
- D 1 - I - 0x012D02 04:ACF2: FF        .byte $FF   ; 
- D 1 - I - 0x012D03 04:ACF3: FF        .byte $FF   ; 
- D 1 - I - 0x012D04 04:ACF4: FF        .byte $FF   ; 
- D 1 - I - 0x012D05 04:ACF5: FF        .byte $FF   ; 
- D 1 - I - 0x012D06 04:ACF6: FF        .byte $FF   ; 
- D 1 - I - 0x012D07 04:ACF7: FF        .byte $FF   ; 
- D 1 - I - 0x012D08 04:ACF8: FF        .byte $FF   ; 
- D 1 - I - 0x012D09 04:ACF9: FF        .byte $FF   ; 
- D 1 - I - 0x012D0A 04:ACFA: FF        .byte $FF   ; 
- D 1 - I - 0x012D0B 04:ACFB: FF        .byte $FF   ; 
- D 1 - I - 0x012D0C 04:ACFC: FF        .byte $FF   ; 
- D 1 - I - 0x012D0D 04:ACFD: FF        .byte $FF   ; 
- D 1 - I - 0x012D0E 04:ACFE: FF        .byte $FF   ; 
- D 1 - I - 0x012D0F 04:ACFF: FF        .byte $FF   ; 
- D 1 - I - 0x012D10 04:AD00: FF        .byte $FF   ; 
- D 1 - I - 0x012D11 04:AD01: FF        .byte $FF   ; 
- D 1 - I - 0x012D12 04:AD02: 00        .byte $00   ; 
- D 1 - I - 0x012D13 04:AD03: 00        .byte $00   ; 
- D 1 - I - 0x012D14 04:AD04: 00        .byte $00   ; 
- D 1 - I - 0x012D15 04:AD05: 00        .byte $00   ; 
- D 1 - I - 0x012D16 04:AD06: 00        .byte $00   ; 
- D 1 - I - 0x012D17 04:AD07: 88        .byte $88   ; 
- D 1 - I - 0x012D18 04:AD08: 22        .byte $22   ; 
- D 1 - I - 0x012D19 04:AD09: 00        .byte $00   ; 
- D 1 - I - 0x012D1A 04:AD0A: 00        .byte $00   ; 
- D 1 - I - 0x012D1B 04:AD0B: 00        .byte $00   ; 
- D 1 - I - 0x012D1C 04:AD0C: 00        .byte $00   ; 
- D 1 - I - 0x012D1D 04:AD0D: 05        .byte $05   ; 
- D 1 - I - 0x012D1E 04:AD0E: 00        .byte $00   ; 
- D 1 - I - 0x012D1F 04:AD0F: 00        .byte $00   ; 
- - - - - - 0x012D20 04:AD10: 00        .byte $00   ; 
- - - - - - 0x012D21 04:AD11: 00        .byte $00   ; 
- - - - - - 0x012D22 04:AD12: 05        .byte $05   ; 
- D 1 - I - 0x012D23 04:AD13: 55        .byte $55   ; 
- D 1 - I - 0x012D24 04:AD14: 55        .byte $55   ; 
- D 1 - I - 0x012D25 04:AD15: 55        .byte $55   ; 
- D 1 - I - 0x012D26 04:AD16: 55        .byte $55   ; 
- D 1 - I - 0x012D27 04:AD17: 55        .byte $55   ; 
- D 1 - I - 0x012D28 04:AD18: 55        .byte $55   ; 
- D 1 - I - 0x012D29 04:AD19: 05        .byte $05   ; 
- D 1 - I - 0x012D2A 04:AD1A: 45        .byte $45   ; 
- D 1 - I - 0x012D2B 04:AD1B: 55        .byte $55   ; 
- D 1 - I - 0x012D2C 04:AD1C: 55        .byte $55   ; 
- D 1 - I - 0x012D2D 04:AD1D: 55        .byte $55   ; 
- D 1 - I - 0x012D2E 04:AD1E: 55        .byte $55   ; 
- D 1 - I - 0x012D2F 04:AD1F: 55        .byte $55   ; 
- D 1 - I - 0x012D30 04:AD20: 55        .byte $55   ; 
- D 1 - I - 0x012D31 04:AD21: 05        .byte $05   ; 
- - - - - - 0x012D32 04:AD22: 00        .byte $00   ; 
- - - - - - 0x012D33 04:AD23: 00        .byte $00   ; 
- - - - - - 0x012D34 04:AD24: 00        .byte $00   ; 
- - - - - - 0x012D35 04:AD25: 00        .byte $00   ; 



_off004_0x012D36_05_area_6:
- D 1 - I - 0x012D36 04:AD26: 02        .byte $02   ; config
- D 1 - I - 0x012D37 04:AD27: 0D        .byte $0D   ; config

- - - - - - 0x012D38 04:AD28: 00        .byte $00   ; 
- - - - - - 0x012D39 04:AD29: 00        .byte $00   ; 
- D 1 - I - 0x012D3A 04:AD2A: 0A        .byte $0A   ; 
- D 1 - I - 0x012D3B 04:AD2B: 0B        .byte $0B   ; 
- D 1 - I - 0x012D3C 04:AD2C: 09        .byte $09   ; 
- - - - - - 0x012D3D 04:AD2D: 00        .byte $00   ; 
- D 1 - I - 0x012D3E 04:AD2E: 08        .byte $08   ; 
- - - - - - 0x012D3F 04:AD2F: 00        .byte $00   ; 
- D 1 - I - 0x012D40 04:AD30: 07        .byte $07   ; 
- - - - - - 0x012D41 04:AD31: 00        .byte $00   ; 
- D 1 - I - 0x012D42 04:AD32: 06        .byte $06   ; 
- - - - - - 0x012D43 04:AD33: 00        .byte $00   ; 
- D 1 - I - 0x012D44 04:AD34: 05        .byte $05   ; 
- - - - - - 0x012D45 04:AD35: 00        .byte $00   ; 
- D 1 - I - 0x012D46 04:AD36: 05        .byte $05   ; 
- - - - - - 0x012D47 04:AD37: 00        .byte $00   ; 
- D 1 - I - 0x012D48 04:AD38: 04        .byte $04   ; 
- - - - - - 0x012D49 04:AD39: 00        .byte $00   ; 
- D 1 - I - 0x012D4A 04:AD3A: 04        .byte $04   ; 
- - - - - - 0x012D4B 04:AD3B: 00        .byte $00   ; 
- D 1 - I - 0x012D4C 04:AD3C: 03        .byte $03   ; 
- - - - - - 0x012D4D 04:AD3D: 00        .byte $00   ; 
- D 1 - I - 0x012D4E 04:AD3E: 02        .byte $02   ; 
- - - - - - 0x012D4F 04:AD3F: 00        .byte $00   ; 
- D 1 - I - 0x012D50 04:AD40: 01        .byte $01   ; 
- D 1 - I - 0x012D51 04:AD41: 00        .byte $00   ; 



_off005_0x012D52_05_area_6:
- D 1 - I - 0x012D52 04:AD42: 5A AD     .word _off018_05_AD5A_00
- D 1 - I - 0x012D54 04:AD44: 9A AD     .word _off018_05_AD9A_01
- D 1 - I - 0x012D56 04:AD46: DA AD     .word _off018_05_ADDA_02
- D 1 - I - 0x012D58 04:AD48: 1A AE     .word _off018_05_AE1A_03
- D 1 - I - 0x012D5A 04:AD4A: 5A AE     .word _off018_05_AE5A_04
- D 1 - I - 0x012D5C 04:AD4C: 9A AE     .word _off018_05_AE9A_05
- D 1 - I - 0x012D5E 04:AD4E: DA AE     .word _off018_05_AEDA_06
- D 1 - I - 0x012D60 04:AD50: 1A AF     .word _off018_05_AF1A_07
- D 1 - I - 0x012D62 04:AD52: 5A AF     .word _off018_05_AF5A_08
- D 1 - I - 0x012D64 04:AD54: 9A AF     .word _off018_05_AF9A_09
- D 1 - I - 0x012D66 04:AD56: DA AF     .word _off018_05_AFDA_0A
- D 1 - I - 0x012D68 04:AD58: 1A B0     .word _off018_05_B01A_0B



_off018_05_AD5A_00:
- D 1 - I - 0x012D6A 04:AD5A: 00        .byte $00   ; 
- - - - - - 0x012D6B 04:AD5B: 00        .byte $00   ; 
- - - - - - 0x012D6C 04:AD5C: 00        .byte $00   ; 
- - - - - - 0x012D6D 04:AD5D: 00        .byte $00   ; 
- - - - - - 0x012D6E 04:AD5E: 00        .byte $00   ; 
- - - - - - 0x012D6F 04:AD5F: 00        .byte $00   ; 
- - - - - - 0x012D70 04:AD60: 00        .byte $00   ; 
- - - - - - 0x012D71 04:AD61: 00        .byte $00   ; 
- D 1 - I - 0x012D72 04:AD62: 00        .byte $00   ; 
- - - - - - 0x012D73 04:AD63: 00        .byte $00   ; 
- - - - - - 0x012D74 04:AD64: 00        .byte $00   ; 
- - - - - - 0x012D75 04:AD65: 00        .byte $00   ; 
- - - - - - 0x012D76 04:AD66: 00        .byte $00   ; 
- - - - - - 0x012D77 04:AD67: 00        .byte $00   ; 
- - - - - - 0x012D78 04:AD68: 00        .byte $00   ; 
- - - - - - 0x012D79 04:AD69: 00        .byte $00   ; 
- D 1 - I - 0x012D7A 04:AD6A: 00        .byte $00   ; 
- - - - - - 0x012D7B 04:AD6B: 00        .byte $00   ; 
- - - - - - 0x012D7C 04:AD6C: 00        .byte $00   ; 
- - - - - - 0x012D7D 04:AD6D: 00        .byte $00   ; 
- - - - - - 0x012D7E 04:AD6E: 00        .byte $00   ; 
- - - - - - 0x012D7F 04:AD6F: 00        .byte $00   ; 
- - - - - - 0x012D80 04:AD70: 00        .byte $00   ; 
- - - - - - 0x012D81 04:AD71: 00        .byte $00   ; 
- D 1 - I - 0x012D82 04:AD72: 00        .byte $00   ; 
- - - - - - 0x012D83 04:AD73: 00        .byte $00   ; 
- - - - - - 0x012D84 04:AD74: 00        .byte $00   ; 
- - - - - - 0x012D85 04:AD75: 00        .byte $00   ; 
- - - - - - 0x012D86 04:AD76: 00        .byte $00   ; 
- - - - - - 0x012D87 04:AD77: 00        .byte $00   ; 
- - - - - - 0x012D88 04:AD78: 00        .byte $00   ; 
- - - - - - 0x012D89 04:AD79: 00        .byte $00   ; 
- D 1 - I - 0x012D8A 04:AD7A: 00        .byte $00   ; 
- - - - - - 0x012D8B 04:AD7B: 00        .byte $00   ; 
- - - - - - 0x012D8C 04:AD7C: 00        .byte $00   ; 
- - - - - - 0x012D8D 04:AD7D: 00        .byte $00   ; 
- - - - - - 0x012D8E 04:AD7E: 00        .byte $00   ; 
- - - - - - 0x012D8F 04:AD7F: 00        .byte $00   ; 
- - - - - - 0x012D90 04:AD80: 00        .byte $00   ; 
- - - - - - 0x012D91 04:AD81: 00        .byte $00   ; 
- D 1 - I - 0x012D92 04:AD82: 00        .byte $00   ; 
- - - - - - 0x012D93 04:AD83: 00        .byte $00   ; 
- - - - - - 0x012D94 04:AD84: 00        .byte $00   ; 
- - - - - - 0x012D95 04:AD85: 00        .byte $00   ; 
- - - - - - 0x012D96 04:AD86: 00        .byte $00   ; 
- - - - - - 0x012D97 04:AD87: 00        .byte $00   ; 
- - - - - - 0x012D98 04:AD88: 00        .byte $00   ; 
- - - - - - 0x012D99 04:AD89: 00        .byte $00   ; 
- D 1 - I - 0x012D9A 04:AD8A: 00        .byte $00   ; 
- - - - - - 0x012D9B 04:AD8B: 00        .byte $00   ; 
- - - - - - 0x012D9C 04:AD8C: 00        .byte $00   ; 
- - - - - - 0x012D9D 04:AD8D: 00        .byte $00   ; 
- - - - - - 0x012D9E 04:AD8E: 00        .byte $00   ; 
- - - - - - 0x012D9F 04:AD8F: 00        .byte $00   ; 
- - - - - - 0x012DA0 04:AD90: 00        .byte $00   ; 
- - - - - - 0x012DA1 04:AD91: 00        .byte $00   ; 
- D 1 - I - 0x012DA2 04:AD92: 00        .byte $00   ; 
- - - - - - 0x012DA3 04:AD93: 00        .byte $00   ; 
- - - - - - 0x012DA4 04:AD94: 00        .byte $00   ; 
- - - - - - 0x012DA5 04:AD95: 00        .byte $00   ; 
- - - - - - 0x012DA6 04:AD96: 00        .byte $00   ; 
- - - - - - 0x012DA7 04:AD97: 00        .byte $00   ; 
- - - - - - 0x012DA8 04:AD98: 00        .byte $00   ; 
- - - - - - 0x012DA9 04:AD99: 00        .byte $00   ; 



_off018_05_AD9A_01:
- D 1 - I - 0x012DAA 04:AD9A: 08        .byte $08   ; 
- D 1 - I - 0x012DAB 04:AD9B: 09        .byte $09   ; 
- D 1 - I - 0x012DAC 04:AD9C: 04        .byte $04   ; 
- D 1 - I - 0x012DAD 04:AD9D: 05        .byte $05   ; 
- D 1 - I - 0x012DAE 04:AD9E: 06        .byte $06   ; 
- D 1 - I - 0x012DAF 04:AD9F: 07        .byte $07   ; 
- D 1 - I - 0x012DB0 04:ADA0: 0A        .byte $0A   ; 
- D 1 - I - 0x012DB1 04:ADA1: 0B        .byte $0B   ; 
- D 1 - I - 0x012DB2 04:ADA2: 08        .byte $08   ; 
- D 1 - I - 0x012DB3 04:ADA3: 1E        .byte $1E   ; 
- D 1 - I - 0x012DB4 04:ADA4: 04        .byte $04   ; 
- D 1 - I - 0x012DB5 04:ADA5: 02        .byte $02   ; 
- D 1 - I - 0x012DB6 04:ADA6: 03        .byte $03   ; 
- D 1 - I - 0x012DB7 04:ADA7: 07        .byte $07   ; 
- D 1 - I - 0x012DB8 04:ADA8: 1F        .byte $1F   ; 
- D 1 - I - 0x012DB9 04:ADA9: 0B        .byte $0B   ; 
- D 1 - I - 0x012DBA 04:ADAA: 08        .byte $08   ; 
- D 1 - I - 0x012DBB 04:ADAB: 09        .byte $09   ; 
- D 1 - I - 0x012DBC 04:ADAC: 04        .byte $04   ; 
- D 1 - I - 0x012DBD 04:ADAD: 05        .byte $05   ; 
- D 1 - I - 0x012DBE 04:ADAE: 06        .byte $06   ; 
- D 1 - I - 0x012DBF 04:ADAF: 07        .byte $07   ; 
- D 1 - I - 0x012DC0 04:ADB0: 0A        .byte $0A   ; 
- D 1 - I - 0x012DC1 04:ADB1: 0B        .byte $0B   ; 
- D 1 - I - 0x012DC2 04:ADB2: 08        .byte $08   ; 
- D 1 - I - 0x012DC3 04:ADB3: 1E        .byte $1E   ; 
- D 1 - I - 0x012DC4 04:ADB4: 04        .byte $04   ; 
- D 1 - I - 0x012DC5 04:ADB5: 02        .byte $02   ; 
- D 1 - I - 0x012DC6 04:ADB6: 03        .byte $03   ; 
- D 1 - I - 0x012DC7 04:ADB7: 07        .byte $07   ; 
- D 1 - I - 0x012DC8 04:ADB8: 1F        .byte $1F   ; 
- D 1 - I - 0x012DC9 04:ADB9: 0B        .byte $0B   ; 
- D 1 - I - 0x012DCA 04:ADBA: 08        .byte $08   ; 
- D 1 - I - 0x012DCB 04:ADBB: 09        .byte $09   ; 
- D 1 - I - 0x012DCC 04:ADBC: 04        .byte $04   ; 
- D 1 - I - 0x012DCD 04:ADBD: 05        .byte $05   ; 
- D 1 - I - 0x012DCE 04:ADBE: 06        .byte $06   ; 
- D 1 - I - 0x012DCF 04:ADBF: 07        .byte $07   ; 
- D 1 - I - 0x012DD0 04:ADC0: 0A        .byte $0A   ; 
- D 1 - I - 0x012DD1 04:ADC1: 0B        .byte $0B   ; 
- D 1 - I - 0x012DD2 04:ADC2: 08        .byte $08   ; 
- D 1 - I - 0x012DD3 04:ADC3: 1E        .byte $1E   ; 
- D 1 - I - 0x012DD4 04:ADC4: 04        .byte $04   ; 
- D 1 - I - 0x012DD5 04:ADC5: 02        .byte $02   ; 
- D 1 - I - 0x012DD6 04:ADC6: 03        .byte $03   ; 
- D 1 - I - 0x012DD7 04:ADC7: 07        .byte $07   ; 
- D 1 - I - 0x012DD8 04:ADC8: 1F        .byte $1F   ; 
- D 1 - I - 0x012DD9 04:ADC9: 0B        .byte $0B   ; 
- D 1 - I - 0x012DDA 04:ADCA: 08        .byte $08   ; 
- D 1 - I - 0x012DDB 04:ADCB: 09        .byte $09   ; 
- D 1 - I - 0x012DDC 04:ADCC: 04        .byte $04   ; 
- D 1 - I - 0x012DDD 04:ADCD: 05        .byte $05   ; 
- D 1 - I - 0x012DDE 04:ADCE: 06        .byte $06   ; 
- D 1 - I - 0x012DDF 04:ADCF: 07        .byte $07   ; 
- D 1 - I - 0x012DE0 04:ADD0: 0A        .byte $0A   ; 
- D 1 - I - 0x012DE1 04:ADD1: 0B        .byte $0B   ; 
- D 1 - I - 0x012DE2 04:ADD2: 08        .byte $08   ; 
- D 1 - I - 0x012DE3 04:ADD3: 1E        .byte $1E   ; 
- D 1 - I - 0x012DE4 04:ADD4: 04        .byte $04   ; 
- D 1 - I - 0x012DE5 04:ADD5: 02        .byte $02   ; 
- D 1 - I - 0x012DE6 04:ADD6: 03        .byte $03   ; 
- D 1 - I - 0x012DE7 04:ADD7: 07        .byte $07   ; 
- D 1 - I - 0x012DE8 04:ADD8: 1F        .byte $1F   ; 
- D 1 - I - 0x012DE9 04:ADD9: 0B        .byte $0B   ; 



_off018_05_ADDA_02:
- D 1 - I - 0x012DEA 04:ADDA: 16        .byte $16   ; 
- D 1 - I - 0x012DEB 04:ADDB: 0C        .byte $0C   ; 
- D 1 - I - 0x012DEC 04:ADDC: 0C        .byte $0C   ; 
- D 1 - I - 0x012DED 04:ADDD: 14        .byte $14   ; 
- D 1 - I - 0x012DEE 04:ADDE: 15        .byte $15   ; 
- D 1 - I - 0x012DEF 04:ADDF: 0C        .byte $0C   ; 
- D 1 - I - 0x012DF0 04:ADE0: 0C        .byte $0C   ; 
- D 1 - I - 0x012DF1 04:ADE1: 1B        .byte $1B   ; 
- D 1 - I - 0x012DF2 04:ADE2: 1A        .byte $1A   ; 
- D 1 - I - 0x012DF3 04:ADE3: 0C        .byte $0C   ; 
- D 1 - I - 0x012DF4 04:ADE4: 0C        .byte $0C   ; 
- D 1 - I - 0x012DF5 04:ADE5: 07        .byte $07   ; 
- D 1 - I - 0x012DF6 04:ADE6: 19        .byte $19   ; 
- D 1 - I - 0x012DF7 04:ADE7: 0C        .byte $0C   ; 
- D 1 - I - 0x012DF8 04:ADE8: 0C        .byte $0C   ; 
- D 1 - I - 0x012DF9 04:ADE9: 17        .byte $17   ; 
- D 1 - I - 0x012DFA 04:ADEA: 16        .byte $16   ; 
- D 1 - I - 0x012DFB 04:ADEB: 0C        .byte $0C   ; 
- D 1 - I - 0x012DFC 04:ADEC: 0C        .byte $0C   ; 
- D 1 - I - 0x012DFD 04:ADED: 18        .byte $18   ; 
- D 1 - I - 0x012DFE 04:ADEE: 19        .byte $19   ; 
- D 1 - I - 0x012DFF 04:ADEF: 0C        .byte $0C   ; 
- D 1 - I - 0x012E00 04:ADF0: 0C        .byte $0C   ; 
- D 1 - I - 0x012E01 04:ADF1: 1B        .byte $1B   ; 
- D 1 - I - 0x012E02 04:ADF2: 1A        .byte $1A   ; 
- D 1 - I - 0x012E03 04:ADF3: 0C        .byte $0C   ; 
- D 1 - I - 0x012E04 04:ADF4: 0C        .byte $0C   ; 
- D 1 - I - 0x012E05 04:ADF5: 1C        .byte $1C   ; 
- D 1 - I - 0x012E06 04:ADF6: 1D        .byte $1D   ; 
- D 1 - I - 0x012E07 04:ADF7: 0C        .byte $0C   ; 
- D 1 - I - 0x012E08 04:ADF8: 0C        .byte $0C   ; 
- D 1 - I - 0x012E09 04:ADF9: 17        .byte $17   ; 
- D 1 - I - 0x012E0A 04:ADFA: 10        .byte $10   ; 
- D 1 - I - 0x012E0B 04:ADFB: 11        .byte $11   ; 
- D 1 - I - 0x012E0C 04:ADFC: 0C        .byte $0C   ; 
- D 1 - I - 0x012E0D 04:ADFD: 0C        .byte $0C   ; 
- D 1 - I - 0x012E0E 04:ADFE: 0C        .byte $0C   ; 
- D 1 - I - 0x012E0F 04:ADFF: 0C        .byte $0C   ; 
- D 1 - I - 0x012E10 04:AE00: 12        .byte $12   ; 
- D 1 - I - 0x012E11 04:AE01: 13        .byte $13   ; 
- D 1 - I - 0x012E12 04:AE02: 24        .byte $24   ; 
- D 1 - I - 0x012E13 04:AE03: 0E        .byte $0E   ; 
- D 1 - I - 0x012E14 04:AE04: 0C        .byte $0C   ; 
- D 1 - I - 0x012E15 04:AE05: 0C        .byte $0C   ; 
- D 1 - I - 0x012E16 04:AE06: 0C        .byte $0C   ; 
- D 1 - I - 0x012E17 04:AE07: 0C        .byte $0C   ; 
- D 1 - I - 0x012E18 04:AE08: 0F        .byte $0F   ; 
- D 1 - I - 0x012E19 04:AE09: 27        .byte $27   ; 
- D 1 - I - 0x012E1A 04:AE0A: 20        .byte $20   ; 
- D 1 - I - 0x012E1B 04:AE0B: 25        .byte $25   ; 
- D 1 - I - 0x012E1C 04:AE0C: 0E        .byte $0E   ; 
- D 1 - I - 0x012E1D 04:AE0D: 0C        .byte $0C   ; 
- D 1 - I - 0x012E1E 04:AE0E: 0C        .byte $0C   ; 
- D 1 - I - 0x012E1F 04:AE0F: 0F        .byte $0F   ; 
- D 1 - I - 0x012E20 04:AE10: 26        .byte $26   ; 
- D 1 - I - 0x012E21 04:AE11: 23        .byte $23   ; 
- D 1 - I - 0x012E22 04:AE12: 20        .byte $20   ; 
- D 1 - I - 0x012E23 04:AE13: 21        .byte $21   ; 
- D 1 - I - 0x012E24 04:AE14: 04        .byte $04   ; 
- D 1 - I - 0x012E25 04:AE15: 0C        .byte $0C   ; 
- D 1 - I - 0x012E26 04:AE16: 0D        .byte $0D   ; 
- D 1 - I - 0x012E27 04:AE17: 07        .byte $07   ; 
- D 1 - I - 0x012E28 04:AE18: 22        .byte $22   ; 
- D 1 - I - 0x012E29 04:AE19: 23        .byte $23   ; 



_off018_05_AE1A_03:
- D 1 - I - 0x012E2A 04:AE1A: 0E        .byte $0E   ; 
- D 1 - I - 0x012E2B 04:AE1B: 0C        .byte $0C   ; 
- D 1 - I - 0x012E2C 04:AE1C: 0C        .byte $0C   ; 
- D 1 - I - 0x012E2D 04:AE1D: 14        .byte $14   ; 
- D 1 - I - 0x012E2E 04:AE1E: 15        .byte $15   ; 
- D 1 - I - 0x012E2F 04:AE1F: 0C        .byte $0C   ; 
- D 1 - I - 0x012E30 04:AE20: 0C        .byte $0C   ; 
- D 1 - I - 0x012E31 04:AE21: 0F        .byte $0F   ; 
- D 1 - I - 0x012E32 04:AE22: 30        .byte $30   ; 
- D 1 - I - 0x012E33 04:AE23: 31        .byte $31   ; 
- D 1 - I - 0x012E34 04:AE24: 0C        .byte $0C   ; 
- D 1 - I - 0x012E35 04:AE25: 07        .byte $07   ; 
- D 1 - I - 0x012E36 04:AE26: 04        .byte $04   ; 
- D 1 - I - 0x012E37 04:AE27: 0C        .byte $0C   ; 
- D 1 - I - 0x012E38 04:AE28: 32        .byte $32   ; 
- D 1 - I - 0x012E39 04:AE29: 33        .byte $33   ; 
- D 1 - I - 0x012E3A 04:AE2A: 28        .byte $28   ; 
- D 1 - I - 0x012E3B 04:AE2B: 29        .byte $29   ; 
- D 1 - I - 0x012E3C 04:AE2C: 0C        .byte $0C   ; 
- D 1 - I - 0x012E3D 04:AE2D: 07        .byte $07   ; 
- D 1 - I - 0x012E3E 04:AE2E: 04        .byte $04   ; 
- D 1 - I - 0x012E3F 04:AE2F: 0C        .byte $0C   ; 
- D 1 - I - 0x012E40 04:AE30: 2A        .byte $2A   ; 
- D 1 - I - 0x012E41 04:AE31: 2B        .byte $2B   ; 
- D 1 - I - 0x012E42 04:AE32: 28        .byte $28   ; 
- D 1 - I - 0x012E43 04:AE33: 29        .byte $29   ; 
- D 1 - I - 0x012E44 04:AE34: 0C        .byte $0C   ; 
- D 1 - I - 0x012E45 04:AE35: 07        .byte $07   ; 
- D 1 - I - 0x012E46 04:AE36: 04        .byte $04   ; 
- D 1 - I - 0x012E47 04:AE37: 0C        .byte $0C   ; 
- D 1 - I - 0x012E48 04:AE38: 2A        .byte $2A   ; 
- D 1 - I - 0x012E49 04:AE39: 2B        .byte $2B   ; 
- D 1 - I - 0x012E4A 04:AE3A: 28        .byte $28   ; 
- D 1 - I - 0x012E4B 04:AE3B: 29        .byte $29   ; 
- D 1 - I - 0x012E4C 04:AE3C: 0C        .byte $0C   ; 
- D 1 - I - 0x012E4D 04:AE3D: 18        .byte $18   ; 
- D 1 - I - 0x012E4E 04:AE3E: 19        .byte $19   ; 
- D 1 - I - 0x012E4F 04:AE3F: 0C        .byte $0C   ; 
- D 1 - I - 0x012E50 04:AE40: 2A        .byte $2A   ; 
- D 1 - I - 0x012E51 04:AE41: 2B        .byte $2B   ; 
- D 1 - I - 0x012E52 04:AE42: 2C        .byte $2C   ; 
- D 1 - I - 0x012E53 04:AE43: 2D        .byte $2D   ; 
- D 1 - I - 0x012E54 04:AE44: 0C        .byte $0C   ; 
- D 1 - I - 0x012E55 04:AE45: 1C        .byte $1C   ; 
- D 1 - I - 0x012E56 04:AE46: 1D        .byte $1D   ; 
- D 1 - I - 0x012E57 04:AE47: 0C        .byte $0C   ; 
- D 1 - I - 0x012E58 04:AE48: 2E        .byte $2E   ; 
- D 1 - I - 0x012E59 04:AE49: 2F        .byte $2F   ; 
- D 1 - I - 0x012E5A 04:AE4A: 19        .byte $19   ; 
- D 1 - I - 0x012E5B 04:AE4B: 0C        .byte $0C   ; 
- D 1 - I - 0x012E5C 04:AE4C: 0C        .byte $0C   ; 
- D 1 - I - 0x012E5D 04:AE4D: 0C        .byte $0C   ; 
- D 1 - I - 0x012E5E 04:AE4E: 0C        .byte $0C   ; 
- D 1 - I - 0x012E5F 04:AE4F: 0C        .byte $0C   ; 
- D 1 - I - 0x012E60 04:AE50: 0C        .byte $0C   ; 
- D 1 - I - 0x012E61 04:AE51: 18        .byte $18   ; 
- D 1 - I - 0x012E62 04:AE52: 1A        .byte $1A   ; 
- D 1 - I - 0x012E63 04:AE53: 0C        .byte $0C   ; 
- D 1 - I - 0x012E64 04:AE54: 0C        .byte $0C   ; 
- D 1 - I - 0x012E65 04:AE55: 0C        .byte $0C   ; 
- D 1 - I - 0x012E66 04:AE56: 0C        .byte $0C   ; 
- D 1 - I - 0x012E67 04:AE57: 0C        .byte $0C   ; 
- D 1 - I - 0x012E68 04:AE58: 0C        .byte $0C   ; 
- D 1 - I - 0x012E69 04:AE59: 1B        .byte $1B   ; 



_off018_05_AE5A_04:
- D 1 - I - 0x012E6A 04:AE5A: 0D        .byte $0D   ; 
- D 1 - I - 0x012E6B 04:AE5B: 0D        .byte $0D   ; 
- D 1 - I - 0x012E6C 04:AE5C: 0D        .byte $0D   ; 
- D 1 - I - 0x012E6D 04:AE5D: 0D        .byte $0D   ; 
- D 1 - I - 0x012E6E 04:AE5E: 0D        .byte $0D   ; 
- D 1 - I - 0x012E6F 04:AE5F: 0D        .byte $0D   ; 
- D 1 - I - 0x012E70 04:AE60: 0D        .byte $0D   ; 
- D 1 - I - 0x012E71 04:AE61: 0D        .byte $0D   ; 
- D 1 - I - 0x012E72 04:AE62: 0D        .byte $0D   ; 
- D 1 - I - 0x012E73 04:AE63: 0D        .byte $0D   ; 
- D 1 - I - 0x012E74 04:AE64: 0D        .byte $0D   ; 
- D 1 - I - 0x012E75 04:AE65: 0D        .byte $0D   ; 
- D 1 - I - 0x012E76 04:AE66: 0D        .byte $0D   ; 
- D 1 - I - 0x012E77 04:AE67: 0D        .byte $0D   ; 
- D 1 - I - 0x012E78 04:AE68: 0D        .byte $0D   ; 
- D 1 - I - 0x012E79 04:AE69: 0D        .byte $0D   ; 
- D 1 - I - 0x012E7A 04:AE6A: 0D        .byte $0D   ; 
- D 1 - I - 0x012E7B 04:AE6B: 0D        .byte $0D   ; 
- D 1 - I - 0x012E7C 04:AE6C: 0D        .byte $0D   ; 
- D 1 - I - 0x012E7D 04:AE6D: 0D        .byte $0D   ; 
- D 1 - I - 0x012E7E 04:AE6E: 0D        .byte $0D   ; 
- D 1 - I - 0x012E7F 04:AE6F: 0D        .byte $0D   ; 
- D 1 - I - 0x012E80 04:AE70: 0D        .byte $0D   ; 
- D 1 - I - 0x012E81 04:AE71: 0D        .byte $0D   ; 
- D 1 - I - 0x012E82 04:AE72: 0D        .byte $0D   ; 
- D 1 - I - 0x012E83 04:AE73: 0D        .byte $0D   ; 
- D 1 - I - 0x012E84 04:AE74: 0D        .byte $0D   ; 
- D 1 - I - 0x012E85 04:AE75: 0D        .byte $0D   ; 
- D 1 - I - 0x012E86 04:AE76: 0D        .byte $0D   ; 
- D 1 - I - 0x012E87 04:AE77: 0D        .byte $0D   ; 
- D 1 - I - 0x012E88 04:AE78: 0D        .byte $0D   ; 
- D 1 - I - 0x012E89 04:AE79: 0D        .byte $0D   ; 
- D 1 - I - 0x012E8A 04:AE7A: 0D        .byte $0D   ; 
- D 1 - I - 0x012E8B 04:AE7B: 0D        .byte $0D   ; 
- D 1 - I - 0x012E8C 04:AE7C: 0D        .byte $0D   ; 
- D 1 - I - 0x012E8D 04:AE7D: 0D        .byte $0D   ; 
- D 1 - I - 0x012E8E 04:AE7E: 0D        .byte $0D   ; 
- D 1 - I - 0x012E8F 04:AE7F: 0D        .byte $0D   ; 
- D 1 - I - 0x012E90 04:AE80: 0D        .byte $0D   ; 
- D 1 - I - 0x012E91 04:AE81: 0D        .byte $0D   ; 
- D 1 - I - 0x012E92 04:AE82: 0D        .byte $0D   ; 
- D 1 - I - 0x012E93 04:AE83: 0D        .byte $0D   ; 
- D 1 - I - 0x012E94 04:AE84: 0D        .byte $0D   ; 
- D 1 - I - 0x012E95 04:AE85: 0D        .byte $0D   ; 
- D 1 - I - 0x012E96 04:AE86: 0D        .byte $0D   ; 
- D 1 - I - 0x012E97 04:AE87: 0D        .byte $0D   ; 
- D 1 - I - 0x012E98 04:AE88: 0D        .byte $0D   ; 
- D 1 - I - 0x012E99 04:AE89: 0D        .byte $0D   ; 
- D 1 - I - 0x012E9A 04:AE8A: 0D        .byte $0D   ; 
- D 1 - I - 0x012E9B 04:AE8B: 0D        .byte $0D   ; 
- D 1 - I - 0x012E9C 04:AE8C: 0D        .byte $0D   ; 
- D 1 - I - 0x012E9D 04:AE8D: 0D        .byte $0D   ; 
- D 1 - I - 0x012E9E 04:AE8E: 0D        .byte $0D   ; 
- D 1 - I - 0x012E9F 04:AE8F: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA0 04:AE90: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA1 04:AE91: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA2 04:AE92: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA3 04:AE93: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA4 04:AE94: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA5 04:AE95: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA6 04:AE96: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA7 04:AE97: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA8 04:AE98: 0D        .byte $0D   ; 
- D 1 - I - 0x012EA9 04:AE99: 0D        .byte $0D   ; 



_off018_05_AE9A_05:
- D 1 - I - 0x012EAA 04:AE9A: 48        .byte $48   ; 
- D 1 - I - 0x012EAB 04:AE9B: 4C        .byte $4C   ; 
- D 1 - I - 0x012EAC 04:AE9C: 0C        .byte $0C   ; 
- D 1 - I - 0x012EAD 04:AE9D: 0D        .byte $0D   ; 
- D 1 - I - 0x012EAE 04:AE9E: 0C        .byte $0C   ; 
- D 1 - I - 0x012EAF 04:AE9F: 0D        .byte $0D   ; 
- D 1 - I - 0x012EB0 04:AEA0: 4D        .byte $4D   ; 
- D 1 - I - 0x012EB1 04:AEA1: 4B        .byte $4B   ; 
- D 1 - I - 0x012EB2 04:AEA2: 4C        .byte $4C   ; 
- D 1 - I - 0x012EB3 04:AEA3: 49        .byte $49   ; 
- D 1 - I - 0x012EB4 04:AEA4: 0D        .byte $0D   ; 
- D 1 - I - 0x012EB5 04:AEA5: 0C        .byte $0C   ; 
- D 1 - I - 0x012EB6 04:AEA6: 0D        .byte $0D   ; 
- D 1 - I - 0x012EB7 04:AEA7: 0C        .byte $0C   ; 
- D 1 - I - 0x012EB8 04:AEA8: 4A        .byte $4A   ; 
- D 1 - I - 0x012EB9 04:AEA9: 4B        .byte $4B   ; 
- D 1 - I - 0x012EBA 04:AEAA: 49        .byte $49   ; 
- D 1 - I - 0x012EBB 04:AEAB: 0C        .byte $0C   ; 
- D 1 - I - 0x012EBC 04:AEAC: 0C        .byte $0C   ; 
- D 1 - I - 0x012EBD 04:AEAD: 0D        .byte $0D   ; 
- D 1 - I - 0x012EBE 04:AEAE: 0C        .byte $0C   ; 
- D 1 - I - 0x012EBF 04:AEAF: 0D        .byte $0D   ; 
- D 1 - I - 0x012EC0 04:AEB0: 0C        .byte $0C   ; 
- D 1 - I - 0x012EC1 04:AEB1: 4D        .byte $4D   ; 
- D 1 - I - 0x012EC2 04:AEB2: 48        .byte $48   ; 
- D 1 - I - 0x012EC3 04:AEB3: 49        .byte $49   ; 
- D 1 - I - 0x012EC4 04:AEB4: 0D        .byte $0D   ; 
- D 1 - I - 0x012EC5 04:AEB5: 0C        .byte $0C   ; 
- D 1 - I - 0x012EC6 04:AEB6: 0D        .byte $0D   ; 
- D 1 - I - 0x012EC7 04:AEB7: 0C        .byte $0C   ; 
- D 1 - I - 0x012EC8 04:AEB8: 0C        .byte $0C   ; 
- D 1 - I - 0x012EC9 04:AEB9: 4D        .byte $4D   ; 
- D 1 - I - 0x012ECA 04:AEBA: 48        .byte $48   ; 
- D 1 - I - 0x012ECB 04:AEBB: 49        .byte $49   ; 
- D 1 - I - 0x012ECC 04:AEBC: 0C        .byte $0C   ; 
- D 1 - I - 0x012ECD 04:AEBD: 0D        .byte $0D   ; 
- D 1 - I - 0x012ECE 04:AEBE: 0C        .byte $0C   ; 
- D 1 - I - 0x012ECF 04:AEBF: 0D        .byte $0D   ; 
- D 1 - I - 0x012ED0 04:AEC0: 0C        .byte $0C   ; 
- D 1 - I - 0x012ED1 04:AEC1: 4B        .byte $4B   ; 
- D 1 - I - 0x012ED2 04:AEC2: 48        .byte $48   ; 
- D 1 - I - 0x012ED3 04:AEC3: 4C        .byte $4C   ; 
- D 1 - I - 0x012ED4 04:AEC4: 0D        .byte $0D   ; 
- D 1 - I - 0x012ED5 04:AEC5: 0D        .byte $0D   ; 
- D 1 - I - 0x012ED6 04:AEC6: 0D        .byte $0D   ; 
- D 1 - I - 0x012ED7 04:AEC7: 0D        .byte $0D   ; 
- D 1 - I - 0x012ED8 04:AEC8: 4D        .byte $4D   ; 
- D 1 - I - 0x012ED9 04:AEC9: 4B        .byte $4B   ; 
- D 1 - I - 0x012EDA 04:AECA: 48        .byte $48   ; 
- D 1 - I - 0x012EDB 04:AECB: 49        .byte $49   ; 
- D 1 - I - 0x012EDC 04:AECC: 0D        .byte $0D   ; 
- D 1 - I - 0x012EDD 04:AECD: 0D        .byte $0D   ; 
- D 1 - I - 0x012EDE 04:AECE: 0D        .byte $0D   ; 
- D 1 - I - 0x012EDF 04:AECF: 0D        .byte $0D   ; 
- D 1 - I - 0x012EE0 04:AED0: 0D        .byte $0D   ; 
- D 1 - I - 0x012EE1 04:AED1: 4D        .byte $4D   ; 
- D 1 - I - 0x012EE2 04:AED2: 4C        .byte $4C   ; 
- D 1 - I - 0x012EE3 04:AED3: 0D        .byte $0D   ; 
- D 1 - I - 0x012EE4 04:AED4: 0D        .byte $0D   ; 
- D 1 - I - 0x012EE5 04:AED5: 0D        .byte $0D   ; 
- D 1 - I - 0x012EE6 04:AED6: 0D        .byte $0D   ; 
- D 1 - I - 0x012EE7 04:AED7: 0D        .byte $0D   ; 
- D 1 - I - 0x012EE8 04:AED8: 0D        .byte $0D   ; 
- D 1 - I - 0x012EE9 04:AED9: 0D        .byte $0D   ; 



_off018_05_AEDA_06:
- D 1 - I - 0x012EEA 04:AEDA: 5C        .byte $5C   ; 
- D 1 - I - 0x012EEB 04:AEDB: 5D        .byte $5D   ; 
- D 1 - I - 0x012EEC 04:AEDC: 7D        .byte $7D   ; 
- D 1 - I - 0x012EED 04:AEDD: 7C        .byte $7C   ; 
- D 1 - I - 0x012EEE 04:AEDE: 7D        .byte $7D   ; 
- D 1 - I - 0x012EEF 04:AEDF: 7C        .byte $7C   ; 
- D 1 - I - 0x012EF0 04:AEE0: 5E        .byte $5E   ; 
- D 1 - I - 0x012EF1 04:AEE1: 5F        .byte $5F   ; 
- D 1 - I - 0x012EF2 04:AEE2: 58        .byte $58   ; 
- D 1 - I - 0x012EF3 04:AEE3: 59        .byte $59   ; 
- D 1 - I - 0x012EF4 04:AEE4: 7C        .byte $7C   ; 
- D 1 - I - 0x012EF5 04:AEE5: 7D        .byte $7D   ; 
- D 1 - I - 0x012EF6 04:AEE6: 7C        .byte $7C   ; 
- D 1 - I - 0x012EF7 04:AEE7: 7D        .byte $7D   ; 
- D 1 - I - 0x012EF8 04:AEE8: 5A        .byte $5A   ; 
- D 1 - I - 0x012EF9 04:AEE9: 5B        .byte $5B   ; 
- D 1 - I - 0x012EFA 04:AEEA: 5C        .byte $5C   ; 
- D 1 - I - 0x012EFB 04:AEEB: 5D        .byte $5D   ; 
- D 1 - I - 0x012EFC 04:AEEC: 7D        .byte $7D   ; 
- D 1 - I - 0x012EFD 04:AEED: 7C        .byte $7C   ; 
- D 1 - I - 0x012EFE 04:AEEE: 7D        .byte $7D   ; 
- D 1 - I - 0x012EFF 04:AEEF: 7C        .byte $7C   ; 
- D 1 - I - 0x012F00 04:AEF0: 5E        .byte $5E   ; 
- D 1 - I - 0x012F01 04:AEF1: 5F        .byte $5F   ; 
- D 1 - I - 0x012F02 04:AEF2: 58        .byte $58   ; 
- D 1 - I - 0x012F03 04:AEF3: 59        .byte $59   ; 
- D 1 - I - 0x012F04 04:AEF4: 7C        .byte $7C   ; 
- D 1 - I - 0x012F05 04:AEF5: 7D        .byte $7D   ; 
- D 1 - I - 0x012F06 04:AEF6: 7C        .byte $7C   ; 
- D 1 - I - 0x012F07 04:AEF7: 7D        .byte $7D   ; 
- D 1 - I - 0x012F08 04:AEF8: 5A        .byte $5A   ; 
- D 1 - I - 0x012F09 04:AEF9: 5B        .byte $5B   ; 
- D 1 - I - 0x012F0A 04:AEFA: 5C        .byte $5C   ; 
- D 1 - I - 0x012F0B 04:AEFB: 5D        .byte $5D   ; 
- D 1 - I - 0x012F0C 04:AEFC: 7D        .byte $7D   ; 
- D 1 - I - 0x012F0D 04:AEFD: 7C        .byte $7C   ; 
- D 1 - I - 0x012F0E 04:AEFE: 7D        .byte $7D   ; 
- D 1 - I - 0x012F0F 04:AEFF: 7C        .byte $7C   ; 
- D 1 - I - 0x012F10 04:AF00: 5E        .byte $5E   ; 
- D 1 - I - 0x012F11 04:AF01: 5F        .byte $5F   ; 
- D 1 - I - 0x012F12 04:AF02: 60        .byte $60   ; 
- D 1 - I - 0x012F13 04:AF03: 61        .byte $61   ; 
- D 1 - I - 0x012F14 04:AF04: 7C        .byte $7C   ; 
- D 1 - I - 0x012F15 04:AF05: 7D        .byte $7D   ; 
- D 1 - I - 0x012F16 04:AF06: 7C        .byte $7C   ; 
- D 1 - I - 0x012F17 04:AF07: 7D        .byte $7D   ; 
- D 1 - I - 0x012F18 04:AF08: 62        .byte $62   ; 
- D 1 - I - 0x012F19 04:AF09: 63        .byte $63   ; 
- D 1 - I - 0x012F1A 04:AF0A: 48        .byte $48   ; 
- D 1 - I - 0x012F1B 04:AF0B: 49        .byte $49   ; 
- D 1 - I - 0x012F1C 04:AF0C: 64        .byte $64   ; 
- D 1 - I - 0x012F1D 04:AF0D: 65        .byte $65   ; 
- D 1 - I - 0x012F1E 04:AF0E: 66        .byte $66   ; 
- D 1 - I - 0x012F1F 04:AF0F: 67        .byte $67   ; 
- D 1 - I - 0x012F20 04:AF10: 4A        .byte $4A   ; 
- D 1 - I - 0x012F21 04:AF11: 4B        .byte $4B   ; 
- D 1 - I - 0x012F22 04:AF12: 48        .byte $48   ; 
- D 1 - I - 0x012F23 04:AF13: 4C        .byte $4C   ; 
- D 1 - I - 0x012F24 04:AF14: 0D        .byte $0D   ; 
- D 1 - I - 0x012F25 04:AF15: 0D        .byte $0D   ; 
- D 1 - I - 0x012F26 04:AF16: 0D        .byte $0D   ; 
- D 1 - I - 0x012F27 04:AF17: 0D        .byte $0D   ; 
- D 1 - I - 0x012F28 04:AF18: 4D        .byte $4D   ; 
- D 1 - I - 0x012F29 04:AF19: 4B        .byte $4B   ; 



_off018_05_AF1A_07:
- D 1 - I - 0x012F2A 04:AF1A: 4E        .byte $4E   ; 
- D 1 - I - 0x012F2B 04:AF1B: 51        .byte $51   ; 
- D 1 - I - 0x012F2C 04:AF1C: 78        .byte $78   ; 
- D 1 - I - 0x012F2D 04:AF1D: 79        .byte $79   ; 
- D 1 - I - 0x012F2E 04:AF1E: 78        .byte $78   ; 
- D 1 - I - 0x012F2F 04:AF1F: 79        .byte $79   ; 
- D 1 - I - 0x012F30 04:AF20: 52        .byte $52   ; 
- D 1 - I - 0x012F31 04:AF21: 4F        .byte $4F   ; 
- D 1 - I - 0x012F32 04:AF22: 54        .byte $54   ; 
- D 1 - I - 0x012F33 04:AF23: 55        .byte $55   ; 
- D 1 - I - 0x012F34 04:AF24: 79        .byte $79   ; 
- D 1 - I - 0x012F35 04:AF25: 78        .byte $78   ; 
- D 1 - I - 0x012F36 04:AF26: 79        .byte $79   ; 
- D 1 - I - 0x012F37 04:AF27: 78        .byte $78   ; 
- D 1 - I - 0x012F38 04:AF28: 56        .byte $56   ; 
- D 1 - I - 0x012F39 04:AF29: 57        .byte $57   ; 
- D 1 - I - 0x012F3A 04:AF2A: 50        .byte $50   ; 
- D 1 - I - 0x012F3B 04:AF2B: 51        .byte $51   ; 
- D 1 - I - 0x012F3C 04:AF2C: 78        .byte $78   ; 
- D 1 - I - 0x012F3D 04:AF2D: 79        .byte $79   ; 
- D 1 - I - 0x012F3E 04:AF2E: 78        .byte $78   ; 
- D 1 - I - 0x012F3F 04:AF2F: 79        .byte $79   ; 
- D 1 - I - 0x012F40 04:AF30: 52        .byte $52   ; 
- D 1 - I - 0x012F41 04:AF31: 53        .byte $53   ; 
- D 1 - I - 0x012F42 04:AF32: 54        .byte $54   ; 
- D 1 - I - 0x012F43 04:AF33: 55        .byte $55   ; 
- D 1 - I - 0x012F44 04:AF34: 79        .byte $79   ; 
- D 1 - I - 0x012F45 04:AF35: 78        .byte $78   ; 
- D 1 - I - 0x012F46 04:AF36: 79        .byte $79   ; 
- D 1 - I - 0x012F47 04:AF37: 78        .byte $78   ; 
- D 1 - I - 0x012F48 04:AF38: 56        .byte $56   ; 
- D 1 - I - 0x012F49 04:AF39: 57        .byte $57   ; 
- D 1 - I - 0x012F4A 04:AF3A: 50        .byte $50   ; 
- D 1 - I - 0x012F4B 04:AF3B: 51        .byte $51   ; 
- D 1 - I - 0x012F4C 04:AF3C: 78        .byte $78   ; 
- D 1 - I - 0x012F4D 04:AF3D: 79        .byte $79   ; 
- D 1 - I - 0x012F4E 04:AF3E: 78        .byte $78   ; 
- D 1 - I - 0x012F4F 04:AF3F: 79        .byte $79   ; 
- D 1 - I - 0x012F50 04:AF40: 52        .byte $52   ; 
- D 1 - I - 0x012F51 04:AF41: 53        .byte $53   ; 
- D 1 - I - 0x012F52 04:AF42: 54        .byte $54   ; 
- D 1 - I - 0x012F53 04:AF43: 55        .byte $55   ; 
- D 1 - I - 0x012F54 04:AF44: 79        .byte $79   ; 
- D 1 - I - 0x012F55 04:AF45: 78        .byte $78   ; 
- D 1 - I - 0x012F56 04:AF46: 79        .byte $79   ; 
- D 1 - I - 0x012F57 04:AF47: 78        .byte $78   ; 
- D 1 - I - 0x012F58 04:AF48: 56        .byte $56   ; 
- D 1 - I - 0x012F59 04:AF49: 57        .byte $57   ; 
- D 1 - I - 0x012F5A 04:AF4A: 50        .byte $50   ; 
- D 1 - I - 0x012F5B 04:AF4B: 51        .byte $51   ; 
- D 1 - I - 0x012F5C 04:AF4C: 78        .byte $78   ; 
- D 1 - I - 0x012F5D 04:AF4D: 79        .byte $79   ; 
- D 1 - I - 0x012F5E 04:AF4E: 78        .byte $78   ; 
- D 1 - I - 0x012F5F 04:AF4F: 79        .byte $79   ; 
- D 1 - I - 0x012F60 04:AF50: 52        .byte $52   ; 
- D 1 - I - 0x012F61 04:AF51: 53        .byte $53   ; 
- D 1 - I - 0x012F62 04:AF52: 54        .byte $54   ; 
- D 1 - I - 0x012F63 04:AF53: 55        .byte $55   ; 
- D 1 - I - 0x012F64 04:AF54: 79        .byte $79   ; 
- D 1 - I - 0x012F65 04:AF55: 78        .byte $78   ; 
- D 1 - I - 0x012F66 04:AF56: 79        .byte $79   ; 
- D 1 - I - 0x012F67 04:AF57: 78        .byte $78   ; 
- D 1 - I - 0x012F68 04:AF58: 56        .byte $56   ; 
- D 1 - I - 0x012F69 04:AF59: 57        .byte $57   ; 



_off018_05_AF5A_08:
- D 1 - I - 0x012F6A 04:AF5A: 76        .byte $76   ; 
- D 1 - I - 0x012F6B 04:AF5B: 7D        .byte $7D   ; 
- D 1 - I - 0x012F6C 04:AF5C: 7C        .byte $7C   ; 
- D 1 - I - 0x012F6D 04:AF5D: 7D        .byte $7D   ; 
- D 1 - I - 0x012F6E 04:AF5E: 7C        .byte $7C   ; 
- D 1 - I - 0x012F6F 04:AF5F: 7D        .byte $7D   ; 
- D 1 - I - 0x012F70 04:AF60: 7C        .byte $7C   ; 
- D 1 - I - 0x012F71 04:AF61: 77        .byte $77   ; 
- D 1 - I - 0x012F72 04:AF62: 76        .byte $76   ; 
- D 1 - I - 0x012F73 04:AF63: 7C        .byte $7C   ; 
- D 1 - I - 0x012F74 04:AF64: 7D        .byte $7D   ; 
- D 1 - I - 0x012F75 04:AF65: 7C        .byte $7C   ; 
- D 1 - I - 0x012F76 04:AF66: 7D        .byte $7D   ; 
- D 1 - I - 0x012F77 04:AF67: 7C        .byte $7C   ; 
- D 1 - I - 0x012F78 04:AF68: 7D        .byte $7D   ; 
- D 1 - I - 0x012F79 04:AF69: 77        .byte $77   ; 
- D 1 - I - 0x012F7A 04:AF6A: 76        .byte $76   ; 
- D 1 - I - 0x012F7B 04:AF6B: 7D        .byte $7D   ; 
- D 1 - I - 0x012F7C 04:AF6C: 7C        .byte $7C   ; 
- D 1 - I - 0x012F7D 04:AF6D: 7D        .byte $7D   ; 
- D 1 - I - 0x012F7E 04:AF6E: 7C        .byte $7C   ; 
- D 1 - I - 0x012F7F 04:AF6F: 7D        .byte $7D   ; 
- D 1 - I - 0x012F80 04:AF70: 7C        .byte $7C   ; 
- D 1 - I - 0x012F81 04:AF71: 77        .byte $77   ; 
- D 1 - I - 0x012F82 04:AF72: 76        .byte $76   ; 
- D 1 - I - 0x012F83 04:AF73: 7C        .byte $7C   ; 
- D 1 - I - 0x012F84 04:AF74: 7D        .byte $7D   ; 
- D 1 - I - 0x012F85 04:AF75: 7C        .byte $7C   ; 
- D 1 - I - 0x012F86 04:AF76: 7D        .byte $7D   ; 
- D 1 - I - 0x012F87 04:AF77: 7C        .byte $7C   ; 
- D 1 - I - 0x012F88 04:AF78: 7D        .byte $7D   ; 
- D 1 - I - 0x012F89 04:AF79: 77        .byte $77   ; 
- D 1 - I - 0x012F8A 04:AF7A: 76        .byte $76   ; 
- D 1 - I - 0x012F8B 04:AF7B: 7D        .byte $7D   ; 
- D 1 - I - 0x012F8C 04:AF7C: 7C        .byte $7C   ; 
- D 1 - I - 0x012F8D 04:AF7D: 7D        .byte $7D   ; 
- D 1 - I - 0x012F8E 04:AF7E: 7C        .byte $7C   ; 
- D 1 - I - 0x012F8F 04:AF7F: 7D        .byte $7D   ; 
- D 1 - I - 0x012F90 04:AF80: 7C        .byte $7C   ; 
- D 1 - I - 0x012F91 04:AF81: 77        .byte $77   ; 
- D 1 - I - 0x012F92 04:AF82: 76        .byte $76   ; 
- D 1 - I - 0x012F93 04:AF83: 7C        .byte $7C   ; 
- D 1 - I - 0x012F94 04:AF84: 7D        .byte $7D   ; 
- D 1 - I - 0x012F95 04:AF85: 7C        .byte $7C   ; 
- D 1 - I - 0x012F96 04:AF86: 7D        .byte $7D   ; 
- D 1 - I - 0x012F97 04:AF87: 7C        .byte $7C   ; 
- D 1 - I - 0x012F98 04:AF88: 7D        .byte $7D   ; 
- D 1 - I - 0x012F99 04:AF89: 77        .byte $77   ; 
- D 1 - I - 0x012F9A 04:AF8A: 7A        .byte $7A   ; 
- D 1 - I - 0x012F9B 04:AF8B: 7D        .byte $7D   ; 
- D 1 - I - 0x012F9C 04:AF8C: 7C        .byte $7C   ; 
- D 1 - I - 0x012F9D 04:AF8D: 7D        .byte $7D   ; 
- D 1 - I - 0x012F9E 04:AF8E: 7C        .byte $7C   ; 
- D 1 - I - 0x012F9F 04:AF8F: 7D        .byte $7D   ; 
- D 1 - I - 0x012FA0 04:AF90: 7C        .byte $7C   ; 
- D 1 - I - 0x012FA1 04:AF91: 7B        .byte $7B   ; 
- D 1 - I - 0x012FA2 04:AF92: 7E        .byte $7E   ; 
- D 1 - I - 0x012FA3 04:AF93: 7C        .byte $7C   ; 
- D 1 - I - 0x012FA4 04:AF94: 7D        .byte $7D   ; 
- D 1 - I - 0x012FA5 04:AF95: 7C        .byte $7C   ; 
- D 1 - I - 0x012FA6 04:AF96: 7D        .byte $7D   ; 
- D 1 - I - 0x012FA7 04:AF97: 7C        .byte $7C   ; 
- D 1 - I - 0x012FA8 04:AF98: 7D        .byte $7D   ; 
- D 1 - I - 0x012FA9 04:AF99: 7F        .byte $7F   ; 



_off018_05_AF9A_09:
- D 1 - I - 0x012FAA 04:AF9A: 72        .byte $72   ; 
- D 1 - I - 0x012FAB 04:AF9B: 78        .byte $78   ; 
- D 1 - I - 0x012FAC 04:AF9C: 79        .byte $79   ; 
- D 1 - I - 0x012FAD 04:AF9D: 78        .byte $78   ; 
- D 1 - I - 0x012FAE 04:AF9E: 79        .byte $79   ; 
- D 1 - I - 0x012FAF 04:AF9F: 78        .byte $78   ; 
- D 1 - I - 0x012FB0 04:AFA0: 79        .byte $79   ; 
- D 1 - I - 0x012FB1 04:AFA1: 73        .byte $73   ; 
- D 1 - I - 0x012FB2 04:AFA2: 72        .byte $72   ; 
- D 1 - I - 0x012FB3 04:AFA3: 79        .byte $79   ; 
- D 1 - I - 0x012FB4 04:AFA4: 78        .byte $78   ; 
- D 1 - I - 0x012FB5 04:AFA5: 79        .byte $79   ; 
- D 1 - I - 0x012FB6 04:AFA6: 78        .byte $78   ; 
- D 1 - I - 0x012FB7 04:AFA7: 79        .byte $79   ; 
- D 1 - I - 0x012FB8 04:AFA8: 78        .byte $78   ; 
- D 1 - I - 0x012FB9 04:AFA9: 73        .byte $73   ; 
- D 1 - I - 0x012FBA 04:AFAA: 72        .byte $72   ; 
- D 1 - I - 0x012FBB 04:AFAB: 78        .byte $78   ; 
- D 1 - I - 0x012FBC 04:AFAC: 79        .byte $79   ; 
- D 1 - I - 0x012FBD 04:AFAD: 78        .byte $78   ; 
- D 1 - I - 0x012FBE 04:AFAE: 79        .byte $79   ; 
- D 1 - I - 0x012FBF 04:AFAF: 78        .byte $78   ; 
- D 1 - I - 0x012FC0 04:AFB0: 79        .byte $79   ; 
- D 1 - I - 0x012FC1 04:AFB1: 73        .byte $73   ; 
- D 1 - I - 0x012FC2 04:AFB2: 72        .byte $72   ; 
- D 1 - I - 0x012FC3 04:AFB3: 79        .byte $79   ; 
- D 1 - I - 0x012FC4 04:AFB4: 78        .byte $78   ; 
- D 1 - I - 0x012FC5 04:AFB5: 79        .byte $79   ; 
- D 1 - I - 0x012FC6 04:AFB6: 78        .byte $78   ; 
- D 1 - I - 0x012FC7 04:AFB7: 79        .byte $79   ; 
- D 1 - I - 0x012FC8 04:AFB8: 78        .byte $78   ; 
- D 1 - I - 0x012FC9 04:AFB9: 73        .byte $73   ; 
- D 1 - I - 0x012FCA 04:AFBA: 80        .byte $80   ; 
- D 1 - I - 0x012FCB 04:AFBB: 81        .byte $81   ; 
- D 1 - I - 0x012FCC 04:AFBC: 68        .byte $68   ; 
- D 1 - I - 0x012FCD 04:AFBD: 69        .byte $69   ; 
- D 1 - I - 0x012FCE 04:AFBE: 6A        .byte $6A   ; 
- D 1 - I - 0x012FCF 04:AFBF: 6B        .byte $6B   ; 
- D 1 - I - 0x012FD0 04:AFC0: 82        .byte $82   ; 
- D 1 - I - 0x012FD1 04:AFC1: 83        .byte $83   ; 
- D 1 - I - 0x012FD2 04:AFC2: 84        .byte $84   ; 
- D 1 - I - 0x012FD3 04:AFC3: 85        .byte $85   ; 
- D 1 - I - 0x012FD4 04:AFC4: 6C        .byte $6C   ; 
- D 1 - I - 0x012FD5 04:AFC5: 6D        .byte $6D   ; 
- D 1 - I - 0x012FD6 04:AFC6: 6E        .byte $6E   ; 
- D 1 - I - 0x012FD7 04:AFC7: 6F        .byte $6F   ; 
- D 1 - I - 0x012FD8 04:AFC8: 86        .byte $86   ; 
- D 1 - I - 0x012FD9 04:AFC9: 87        .byte $87   ; 
- D 1 - I - 0x012FDA 04:AFCA: 88        .byte $88   ; 
- D 1 - I - 0x012FDB 04:AFCB: 89        .byte $89   ; 
- D 1 - I - 0x012FDC 04:AFCC: 8C        .byte $8C   ; 
- D 1 - I - 0x012FDD 04:AFCD: 8C        .byte $8C   ; 
- D 1 - I - 0x012FDE 04:AFCE: 8C        .byte $8C   ; 
- D 1 - I - 0x012FDF 04:AFCF: 01        .byte $01   ; 
- D 1 - I - 0x012FE0 04:AFD0: 8A        .byte $8A   ; 
- D 1 - I - 0x012FE1 04:AFD1: 8B        .byte $8B   ; 
- D 1 - I - 0x012FE2 04:AFD2: 72        .byte $72   ; 
- D 1 - I - 0x012FE3 04:AFD3: 79        .byte $79   ; 
- D 1 - I - 0x012FE4 04:AFD4: 78        .byte $78   ; 
- D 1 - I - 0x012FE5 04:AFD5: 79        .byte $79   ; 
- D 1 - I - 0x012FE6 04:AFD6: 78        .byte $78   ; 
- D 1 - I - 0x012FE7 04:AFD7: 79        .byte $79   ; 
- D 1 - I - 0x012FE8 04:AFD8: 78        .byte $78   ; 
- D 1 - I - 0x012FE9 04:AFD9: 73        .byte $73   ; 



_off018_05_AFDA_0A:
- D 1 - I - 0x012FEA 04:AFDA: 43        .byte $43   ; 
- D 1 - I - 0x012FEB 04:AFDB: 34        .byte $34   ; 
- D 1 - I - 0x012FEC 04:AFDC: 8D        .byte $8D   ; 
- D 1 - I - 0x012FED 04:AFDD: 8E        .byte $8E   ; 
- D 1 - I - 0x012FEE 04:AFDE: 8E        .byte $8E   ; 
- D 1 - I - 0x012FEF 04:AFDF: 8F        .byte $8F   ; 
- D 1 - I - 0x012FF0 04:AFE0: 37        .byte $37   ; 
- D 1 - I - 0x012FF1 04:AFE1: 40        .byte $40   ; 
- D 1 - I - 0x012FF2 04:AFE2: 3C        .byte $3C   ; 
- D 1 - I - 0x012FF3 04:AFE3: 38        .byte $38   ; 
- D 1 - I - 0x012FF4 04:AFE4: 90        .byte $90   ; 
- D 1 - I - 0x012FF5 04:AFE5: 91        .byte $91   ; 
- D 1 - I - 0x012FF6 04:AFE6: 91        .byte $91   ; 
- D 1 - I - 0x012FF7 04:AFE7: 92        .byte $92   ; 
- D 1 - I - 0x012FF8 04:AFE8: 3B        .byte $3B   ; 
- D 1 - I - 0x012FF9 04:AFE9: 3F        .byte $3F   ; 
- D 1 - I - 0x012FFA 04:AFEA: 40        .byte $40   ; 
- D 1 - I - 0x012FFB 04:AFEB: 41        .byte $41   ; 
- D 1 - I - 0x012FFC 04:AFEC: 8C        .byte $8C   ; 
- D 1 - I - 0x012FFD 04:AFED: 8C        .byte $8C   ; 
- D 1 - I - 0x012FFE 04:AFEE: 8C        .byte $8C   ; 
- D 1 - I - 0x012FFF 04:AFEF: 01        .byte $01   ; 
- D 1 - I - 0x013000 04:AFF0: 42        .byte $42   ; 
- D 1 - I - 0x013001 04:AFF1: 43        .byte $43   ; 
- D 1 - I - 0x013002 04:AFF2: 44        .byte $44   ; 
- D 1 - I - 0x013003 04:AFF3: 45        .byte $45   ; 
- D 1 - I - 0x013004 04:AFF4: 78        .byte $78   ; 
- D 1 - I - 0x013005 04:AFF5: 79        .byte $79   ; 
- D 1 - I - 0x013006 04:AFF6: 78        .byte $78   ; 
- D 1 - I - 0x013007 04:AFF7: 79        .byte $79   ; 
- D 1 - I - 0x013008 04:AFF8: 46        .byte $46   ; 
- D 1 - I - 0x013009 04:AFF9: 47        .byte $47   ; 
- D 1 - I - 0x01300A 04:AFFA: 76        .byte $76   ; 
- D 1 - I - 0x01300B 04:AFFB: 01        .byte $01   ; 
- D 1 - I - 0x01300C 04:AFFC: 79        .byte $79   ; 
- D 1 - I - 0x01300D 04:AFFD: 78        .byte $78   ; 
- D 1 - I - 0x01300E 04:AFFE: 79        .byte $79   ; 
- D 1 - I - 0x01300F 04:AFFF: 78        .byte $78   ; 
- D 1 - I - 0x013010 04:B000: 8C        .byte $8C   ; 
- D 1 - I - 0x013011 04:B001: 77        .byte $77   ; 
- D 1 - I - 0x013012 04:B002: 76        .byte $76   ; 
- D 1 - I - 0x013013 04:B003: 79        .byte $79   ; 
- D 1 - I - 0x013014 04:B004: 78        .byte $78   ; 
- D 1 - I - 0x013015 04:B005: 79        .byte $79   ; 
- D 1 - I - 0x013016 04:B006: 78        .byte $78   ; 
- D 1 - I - 0x013017 04:B007: 79        .byte $79   ; 
- D 1 - I - 0x013018 04:B008: 78        .byte $78   ; 
- D 1 - I - 0x013019 04:B009: 77        .byte $77   ; 
- D 1 - I - 0x01301A 04:B00A: 76        .byte $76   ; 
- D 1 - I - 0x01301B 04:B00B: 78        .byte $78   ; 
- D 1 - I - 0x01301C 04:B00C: 79        .byte $79   ; 
- D 1 - I - 0x01301D 04:B00D: 78        .byte $78   ; 
- D 1 - I - 0x01301E 04:B00E: 79        .byte $79   ; 
- D 1 - I - 0x01301F 04:B00F: 78        .byte $78   ; 
- D 1 - I - 0x013020 04:B010: 79        .byte $79   ; 
- D 1 - I - 0x013021 04:B011: 77        .byte $77   ; 
- D 1 - I - 0x013022 04:B012: 76        .byte $76   ; 
- D 1 - I - 0x013023 04:B013: 79        .byte $79   ; 
- D 1 - I - 0x013024 04:B014: 78        .byte $78   ; 
- D 1 - I - 0x013025 04:B015: 79        .byte $79   ; 
- D 1 - I - 0x013026 04:B016: 78        .byte $78   ; 
- D 1 - I - 0x013027 04:B017: 79        .byte $79   ; 
- D 1 - I - 0x013028 04:B018: 78        .byte $78   ; 
- D 1 - I - 0x013029 04:B019: 77        .byte $77   ; 



_off018_05_B01A_0B:
- D 1 - I - 0x01302A 04:B01A: 43        .byte $43   ; 
- D 1 - I - 0x01302B 04:B01B: 34        .byte $34   ; 
- D 1 - I - 0x01302C 04:B01C: 35        .byte $35   ; 
- D 1 - I - 0x01302D 04:B01D: 00        .byte $00   ; 
- D 1 - I - 0x01302E 04:B01E: 00        .byte $00   ; 
- D 1 - I - 0x01302F 04:B01F: 36        .byte $36   ; 
- D 1 - I - 0x013030 04:B020: 37        .byte $37   ; 
- D 1 - I - 0x013031 04:B021: 40        .byte $40   ; 
- D 1 - I - 0x013032 04:B022: 3C        .byte $3C   ; 
- D 1 - I - 0x013033 04:B023: 38        .byte $38   ; 
- D 1 - I - 0x013034 04:B024: 39        .byte $39   ; 
- D 1 - I - 0x013035 04:B025: 3D        .byte $3D   ; 
- D 1 - I - 0x013036 04:B026: 3E        .byte $3E   ; 
- D 1 - I - 0x013037 04:B027: 3A        .byte $3A   ; 
- D 1 - I - 0x013038 04:B028: 3B        .byte $3B   ; 
- D 1 - I - 0x013039 04:B029: 3F        .byte $3F   ; 
- D 1 - I - 0x01303A 04:B02A: 40        .byte $40   ; 
- D 1 - I - 0x01303B 04:B02B: 41        .byte $41   ; 
- D 1 - I - 0x01303C 04:B02C: 8C        .byte $8C   ; 
- D 1 - I - 0x01303D 04:B02D: 8C        .byte $8C   ; 
- D 1 - I - 0x01303E 04:B02E: 8C        .byte $8C   ; 
- D 1 - I - 0x01303F 04:B02F: 01        .byte $01   ; 
- D 1 - I - 0x013040 04:B030: 42        .byte $42   ; 
- D 1 - I - 0x013041 04:B031: 43        .byte $43   ; 
- D 1 - I - 0x013042 04:B032: 44        .byte $44   ; 
- D 1 - I - 0x013043 04:B033: 45        .byte $45   ; 
- D 1 - I - 0x013044 04:B034: 78        .byte $78   ; 
- D 1 - I - 0x013045 04:B035: 79        .byte $79   ; 
- D 1 - I - 0x013046 04:B036: 78        .byte $78   ; 
- D 1 - I - 0x013047 04:B037: 79        .byte $79   ; 
- D 1 - I - 0x013048 04:B038: 46        .byte $46   ; 
- D 1 - I - 0x013049 04:B039: 47        .byte $47   ; 
- D 1 - I - 0x01304A 04:B03A: 76        .byte $76   ; 
- D 1 - I - 0x01304B 04:B03B: 01        .byte $01   ; 
- D 1 - I - 0x01304C 04:B03C: 79        .byte $79   ; 
- D 1 - I - 0x01304D 04:B03D: 78        .byte $78   ; 
- D 1 - I - 0x01304E 04:B03E: 79        .byte $79   ; 
- D 1 - I - 0x01304F 04:B03F: 78        .byte $78   ; 
- D 1 - I - 0x013050 04:B040: 8C        .byte $8C   ; 
- D 1 - I - 0x013051 04:B041: 77        .byte $77   ; 
- D 1 - I - 0x013052 04:B042: 76        .byte $76   ; 
- D 1 - I - 0x013053 04:B043: 79        .byte $79   ; 
- D 1 - I - 0x013054 04:B044: 78        .byte $78   ; 
- D 1 - I - 0x013055 04:B045: 79        .byte $79   ; 
- D 1 - I - 0x013056 04:B046: 78        .byte $78   ; 
- D 1 - I - 0x013057 04:B047: 79        .byte $79   ; 
- D 1 - I - 0x013058 04:B048: 78        .byte $78   ; 
- D 1 - I - 0x013059 04:B049: 77        .byte $77   ; 
- D 1 - I - 0x01305A 04:B04A: 76        .byte $76   ; 
- D 1 - I - 0x01305B 04:B04B: 78        .byte $78   ; 
- D 1 - I - 0x01305C 04:B04C: 79        .byte $79   ; 
- D 1 - I - 0x01305D 04:B04D: 78        .byte $78   ; 
- D 1 - I - 0x01305E 04:B04E: 79        .byte $79   ; 
- D 1 - I - 0x01305F 04:B04F: 78        .byte $78   ; 
- D 1 - I - 0x013060 04:B050: 79        .byte $79   ; 
- D 1 - I - 0x013061 04:B051: 77        .byte $77   ; 
- D 1 - I - 0x013062 04:B052: 76        .byte $76   ; 
- D 1 - I - 0x013063 04:B053: 79        .byte $79   ; 
- D 1 - I - 0x013064 04:B054: 78        .byte $78   ; 
- D 1 - I - 0x013065 04:B055: 79        .byte $79   ; 
- D 1 - I - 0x013066 04:B056: 78        .byte $78   ; 
- D 1 - I - 0x013067 04:B057: 79        .byte $79   ; 
- D 1 - I - 0x013068 04:B058: 78        .byte $78   ; 
- D 1 - I - 0x013069 04:B059: 77        .byte $77   ; 



_off006_0x01306A_05_area_6:
- D 1 - I - 0x01306A 04:B05A: 00        .byte $00   ; 
- D 1 - I - 0x01306B 04:B05B: 00        .byte $00   ; 
- D 1 - I - 0x01306C 04:B05C: 00        .byte $00   ; 
- D 1 - I - 0x01306D 04:B05D: 00        .byte $00   ; 
- D 1 - I - 0x01306E 04:B05E: 00        .byte $00   ; 
- D 1 - I - 0x01306F 04:B05F: 00        .byte $00   ; 
- D 1 - I - 0x013070 04:B060: 00        .byte $00   ; 
- D 1 - I - 0x013071 04:B061: 00        .byte $00   ; 
- D 1 - I - 0x013072 04:B062: 00        .byte $00   ; 
- D 1 - I - 0x013073 04:B063: 00        .byte $00   ; 
- D 1 - I - 0x013074 04:B064: 00        .byte $00   ; 
- D 1 - I - 0x013075 04:B065: 00        .byte $00   ; 
- D 1 - I - 0x013076 04:B066: 00        .byte $00   ; 
- D 1 - I - 0x013077 04:B067: 00        .byte $00   ; 
- D 1 - I - 0x013078 04:B068: 00        .byte $00   ; 
- D 1 - I - 0x013079 04:B069: 00        .byte $00   ; 
- D 1 - I - 0x01307A 04:B06A: 00        .byte $00   ; 
- D 1 - I - 0x01307B 04:B06B: 00        .byte $00   ; 
- D 1 - I - 0x01307C 04:B06C: 00        .byte $00   ; 
- D 1 - I - 0x01307D 04:B06D: 3E        .byte $3E   ; 
- D 1 - I - 0x01307E 04:B06E: 3E        .byte $3E   ; 
- D 1 - I - 0x01307F 04:B06F: 3F        .byte $3F   ; 
- D 1 - I - 0x013080 04:B070: BB        .byte $BB   ; 
- D 1 - I - 0x013081 04:B071: 86        .byte $86   ; 
- D 1 - I - 0x013082 04:B072: 07        .byte $07   ; 
- D 1 - I - 0x013083 04:B073: BD        .byte $BD   ; 
- D 1 - I - 0x013084 04:B074: 08        .byte $08   ; 
- D 1 - I - 0x013085 04:B075: 84        .byte $84   ; 
- D 1 - I - 0x013086 04:B076: 80        .byte $80   ; 
- D 1 - I - 0x013087 04:B077: 04        .byte $04   ; 
- D 1 - I - 0x013088 04:B078: 87        .byte $87   ; 
- D 1 - I - 0x013089 04:B079: 06        .byte $06   ; 
- D 1 - I - 0x01308A 04:B07A: 0B        .byte $0B   ; 
- D 1 - I - 0x01308B 04:B07B: 0C        .byte $0C   ; 
- D 1 - I - 0x01308C 04:B07C: 0A        .byte $0A   ; 
- D 1 - I - 0x01308D 04:B07D: 47        .byte $47   ; 
- D 1 - I - 0x01308E 04:B07E: 36        .byte $36   ; 
- D 1 - I - 0x01308F 04:B07F: 09        .byte $09   ; 
- D 1 - I - 0x013090 04:B080: 0B        .byte $0B   ; 
- D 1 - I - 0x013091 04:B081: 0C        .byte $0C   ; 
- D 1 - I - 0x013092 04:B082: 0D        .byte $0D   ; 
- D 1 - I - 0x013093 04:B083: 47        .byte $47   ; 
- D 1 - I - 0x013094 04:B084: 0B        .byte $0B   ; 
- D 1 - I - 0x013095 04:B085: 0C        .byte $0C   ; 
- D 1 - I - 0x013096 04:B086: 0B        .byte $0B   ; 
- D 1 - I - 0x013097 04:B087: 0C        .byte $0C   ; 
- D 1 - I - 0x013098 04:B088: 0A        .byte $0A   ; 
- D 1 - I - 0x013099 04:B089: 09        .byte $09   ; 
- D 1 - I - 0x01309A 04:B08A: 0A        .byte $0A   ; 
- D 1 - I - 0x01309B 04:B08B: 47        .byte $47   ; 
- D 1 - I - 0x01309C 04:B08C: 09        .byte $09   ; 
- D 1 - I - 0x01309D 04:B08D: 0A        .byte $0A   ; 
- D 1 - I - 0x01309E 04:B08E: 0B        .byte $0B   ; 
- D 1 - I - 0x01309F 04:B08F: 0C        .byte $0C   ; 
- D 1 - I - 0x0130A0 04:B090: 0C        .byte $0C   ; 
- D 1 - I - 0x0130A1 04:B091: 0B        .byte $0B   ; 
- D 1 - I - 0x0130A2 04:B092: 09        .byte $09   ; 
- D 1 - I - 0x0130A3 04:B093: 0A        .byte $0A   ; 
- D 1 - I - 0x0130A4 04:B094: 0A        .byte $0A   ; 
- D 1 - I - 0x0130A5 04:B095: 47        .byte $47   ; 
- D 1 - I - 0x0130A6 04:B096: 0C        .byte $0C   ; 
- D 1 - I - 0x0130A7 04:B097: 0B        .byte $0B   ; 
- D 1 - I - 0x0130A8 04:B098: 0B        .byte $0B   ; 
- D 1 - I - 0x0130A9 04:B099: D0        .byte $D0   ; 
- D 1 - I - 0x0130AA 04:B09A: 32        .byte $32   ; 
- D 1 - I - 0x0130AB 04:B09B: 33        .byte $33   ; 
- D 1 - I - 0x0130AC 04:B09C: 34        .byte $34   ; 
- D 1 - I - 0x0130AD 04:B09D: 36        .byte $36   ; 
- D 1 - I - 0x0130AE 04:B09E: 00        .byte $00   ; 
- D 1 - I - 0x0130AF 04:B09F: 35        .byte $35   ; 
- D 1 - I - 0x0130B0 04:B0A0: CC        .byte $CC   ; 
- D 1 - I - 0x0130B1 04:B0A1: 0D        .byte $0D   ; 
- D 1 - I - 0x0130B2 04:B0A2: 32        .byte $32   ; 
- D 1 - I - 0x0130B3 04:B0A3: 33        .byte $33   ; 
- D 1 - I - 0x0130B4 04:B0A4: 34        .byte $34   ; 
- D 1 - I - 0x0130B5 04:B0A5: 37        .byte $37   ; 
- D 1 - I - 0x0130B6 04:B0A6: 00        .byte $00   ; 
- D 1 - I - 0x0130B7 04:B0A7: 00        .byte $00   ; 
- D 1 - I - 0x0130B8 04:B0A8: CD        .byte $CD   ; 
- D 1 - I - 0x0130B9 04:B0A9: 38        .byte $38   ; 
- D 1 - I - 0x0130BA 04:B0AA: 0A        .byte $0A   ; 
- D 1 - I - 0x0130BB 04:B0AB: 47        .byte $47   ; 
- D 1 - I - 0x0130BC 04:B0AC: 09        .byte $09   ; 
- D 1 - I - 0x0130BD 04:B0AD: 0A        .byte $0A   ; 
- D 1 - I - 0x0130BE 04:B0AE: 0B        .byte $0B   ; 
- D 1 - I - 0x0130BF 04:B0AF: 0C        .byte $0C   ; 
- D 1 - I - 0x0130C0 04:B0B0: 0C        .byte $0C   ; 
- D 1 - I - 0x0130C1 04:B0B1: 0B        .byte $0B   ; 
- D 1 - I - 0x0130C2 04:B0B2: 09        .byte $09   ; 
- D 1 - I - 0x0130C3 04:B0B3: 0A        .byte $0A   ; 
- D 1 - I - 0x0130C4 04:B0B4: 0A        .byte $0A   ; 
- D 1 - I - 0x0130C5 04:B0B5: 47        .byte $47   ; 
- D 1 - I - 0x0130C6 04:B0B6: 0E        .byte $0E   ; 
- D 1 - I - 0x0130C7 04:B0B7: 0B        .byte $0B   ; 
- D 1 - I - 0x0130C8 04:B0B8: 0B        .byte $0B   ; 
- D 1 - I - 0x0130C9 04:B0B9: 0C        .byte $0C   ; 
- D 1 - I - 0x0130CA 04:B0BA: 0B        .byte $0B   ; 
- D 1 - I - 0x0130CB 04:B0BB: 0C        .byte $0C   ; 
- D 1 - I - 0x0130CC 04:B0BC: 0A        .byte $0A   ; 
- D 1 - I - 0x0130CD 04:B0BD: 47        .byte $47   ; 
- D 1 - I - 0x0130CE 04:B0BE: 0A        .byte $0A   ; 
- D 1 - I - 0x0130CF 04:B0BF: 09        .byte $09   ; 
- D 1 - I - 0x0130D0 04:B0C0: 0B        .byte $0B   ; 
- D 1 - I - 0x0130D1 04:B0C1: 42        .byte $42   ; 
- D 1 - I - 0x0130D2 04:B0C2: 0A        .byte $0A   ; 
- D 1 - I - 0x0130D3 04:B0C3: 47        .byte $47   ; 
- D 1 - I - 0x0130D4 04:B0C4: 0B        .byte $0B   ; 
- D 1 - I - 0x0130D5 04:B0C5: 43        .byte $43   ; 
- D 1 - I - 0x0130D6 04:B0C6: 0B        .byte $0B   ; 
- D 1 - I - 0x0130D7 04:B0C7: 0C        .byte $0C   ; 
- D 1 - I - 0x0130D8 04:B0C8: 0A        .byte $0A   ; 
- D 1 - I - 0x0130D9 04:B0C9: 09        .byte $09   ; 
- D 1 - I - 0x0130DA 04:B0CA: 42        .byte $42   ; 
- D 1 - I - 0x0130DB 04:B0CB: 3A        .byte $3A   ; 
- D 1 - I - 0x0130DC 04:B0CC: 3B        .byte $3B   ; 
- D 1 - I - 0x0130DD 04:B0CD: 00        .byte $00   ; 
- D 1 - I - 0x0130DE 04:B0CE: 43        .byte $43   ; 
- D 1 - I - 0x0130DF 04:B0CF: CE        .byte $CE   ; 
- D 1 - I - 0x0130E0 04:B0D0: 3C        .byte $3C   ; 
- D 1 - I - 0x0130E1 04:B0D1: 00        .byte $00   ; 
- D 1 - I - 0x0130E2 04:B0D2: 44        .byte $44   ; 
- D 1 - I - 0x0130E3 04:B0D3: 3A        .byte $3A   ; 
- D 1 - I - 0x0130E4 04:B0D4: 3B        .byte $3B   ; 
- D 1 - I - 0x0130E5 04:B0D5: 00        .byte $00   ; 
- D 1 - I - 0x0130E6 04:B0D6: CF        .byte $CF   ; 
- D 1 - I - 0x0130E7 04:B0D7: 3D        .byte $3D   ; 
- D 1 - I - 0x0130E8 04:B0D8: 00        .byte $00   ; 
- D 1 - I - 0x0130E9 04:B0D9: 00        .byte $00   ; 
- D 1 - I - 0x0130EA 04:B0DA: 55        .byte $55   ; 
- D 1 - I - 0x0130EB 04:B0DB: D1        .byte $D1   ; 
- D 1 - I - 0x0130EC 04:B0DC: 56        .byte $56   ; 
- D 1 - I - 0x0130ED 04:B0DD: D2        .byte $D2   ; 
- D 1 - I - 0x0130EE 04:B0DE: D4        .byte $D4   ; 
- D 1 - I - 0x0130EF 04:B0DF: D5        .byte $D5   ; 
- D 1 - I - 0x0130F0 04:B0E0: D6        .byte $D6   ; 
- D 1 - I - 0x0130F1 04:B0E1: D7        .byte $D7   ; 
- D 1 - I - 0x0130F2 04:B0E2: 4A        .byte $4A   ; 
- D 1 - I - 0x0130F3 04:B0E3: DC        .byte $DC   ; 
- D 1 - I - 0x0130F4 04:B0E4: 4B        .byte $4B   ; 
- D 1 - I - 0x0130F5 04:B0E5: DD        .byte $DD   ; 
- D 1 - I - 0x0130F6 04:B0E6: 00        .byte $00   ; 
- D 1 - I - 0x0130F7 04:B0E7: E0        .byte $E0   ; 
- D 1 - I - 0x0130F8 04:B0E8: E1        .byte $E1   ; 
- D 1 - I - 0x0130F9 04:B0E9: 00        .byte $00   ; 
- D 1 - I - 0x0130FA 04:B0EA: 48        .byte $48   ; 
- D 1 - I - 0x0130FB 04:B0EB: D3        .byte $D3   ; 
- D 1 - I - 0x0130FC 04:B0EC: 49        .byte $49   ; 
- D 1 - I - 0x0130FD 04:B0ED: 00        .byte $00   ; 
- D 1 - I - 0x0130FE 04:B0EE: D8        .byte $D8   ; 
- D 1 - I - 0x0130FF 04:B0EF: D9        .byte $D9   ; 
- D 1 - I - 0x013100 04:B0F0: DA        .byte $DA   ; 
- D 1 - I - 0x013101 04:B0F1: DB        .byte $DB   ; 
- D 1 - I - 0x013102 04:B0F2: 4C        .byte $4C   ; 
- D 1 - I - 0x013103 04:B0F3: DE        .byte $DE   ; 
- D 1 - I - 0x013104 04:B0F4: 4D        .byte $4D   ; 
- D 1 - I - 0x013105 04:B0F5: DF        .byte $DF   ; 
- D 1 - I - 0x013106 04:B0F6: E2        .byte $E2   ; 
- D 1 - I - 0x013107 04:B0F7: E3        .byte $E3   ; 
- D 1 - I - 0x013108 04:B0F8: E4        .byte $E4   ; 
- D 1 - I - 0x013109 04:B0F9: E5        .byte $E5   ; 
- D 1 - I - 0x01310A 04:B0FA: 32        .byte $32   ; 
- D 1 - I - 0x01310B 04:B0FB: E6        .byte $E6   ; 
- D 1 - I - 0x01310C 04:B0FC: 4E        .byte $4E   ; 
- D 1 - I - 0x01310D 04:B0FD: E7        .byte $E7   ; 
- D 1 - I - 0x01310E 04:B0FE: EA        .byte $EA   ; 
- D 1 - I - 0x01310F 04:B0FF: EB        .byte $EB   ; 
- D 1 - I - 0x013110 04:B100: EC        .byte $EC   ; 
- D 1 - I - 0x013111 04:B101: ED        .byte $ED   ; 
- D 1 - I - 0x013112 04:B102: 51        .byte $51   ; 
- D 1 - I - 0x013113 04:B103: F2        .byte $F2   ; 
- D 1 - I - 0x013114 04:B104: 52        .byte $52   ; 
- D 1 - I - 0x013115 04:B105: F3        .byte $F3   ; 
- D 1 - I - 0x013116 04:B106: F6        .byte $F6   ; 
- D 1 - I - 0x013117 04:B107: F7        .byte $F7   ; 
- D 1 - I - 0x013118 04:B108: F8        .byte $F8   ; 
- D 1 - I - 0x013119 04:B109: F9        .byte $F9   ; 
- D 1 - I - 0x01311A 04:B10A: 4F        .byte $4F   ; 
- D 1 - I - 0x01311B 04:B10B: E8        .byte $E8   ; 
- D 1 - I - 0x01311C 04:B10C: 50        .byte $50   ; 
- D 1 - I - 0x01311D 04:B10D: E9        .byte $E9   ; 
- D 1 - I - 0x01311E 04:B10E: EE        .byte $EE   ; 
- D 1 - I - 0x01311F 04:B10F: EF        .byte $EF   ; 
- D 1 - I - 0x013120 04:B110: F0        .byte $F0   ; 
- D 1 - I - 0x013121 04:B111: F1        .byte $F1   ; 
- D 1 - I - 0x013122 04:B112: 53        .byte $53   ; 
- D 1 - I - 0x013123 04:B113: F4        .byte $F4   ; 
- D 1 - I - 0x013124 04:B114: 54        .byte $54   ; 
- D 1 - I - 0x013125 04:B115: F5        .byte $F5   ; 
- D 1 - I - 0x013126 04:B116: 00        .byte $00   ; 
- D 1 - I - 0x013127 04:B117: FA        .byte $FA   ; 
- D 1 - I - 0x013128 04:B118: FB        .byte $FB   ; 
- D 1 - I - 0x013129 04:B119: 00        .byte $00   ; 
- D 1 - I - 0x01312A 04:B11A: 0A        .byte $0A   ; 
- D 1 - I - 0x01312B 04:B11B: 47        .byte $47   ; 
- D 1 - I - 0x01312C 04:B11C: 09        .byte $09   ; 
- D 1 - I - 0x01312D 04:B11D: 0A        .byte $0A   ; 
- D 1 - I - 0x01312E 04:B11E: 0B        .byte $0B   ; 
- D 1 - I - 0x01312F 04:B11F: 0C        .byte $0C   ; 
- D 1 - I - 0x013130 04:B120: 0C        .byte $0C   ; 
- D 1 - I - 0x013131 04:B121: 0B        .byte $0B   ; 
- D 1 - I - 0x013132 04:B122: 09        .byte $09   ; 
- D 1 - I - 0x013133 04:B123: 0A        .byte $0A   ; 
- D 1 - I - 0x013134 04:B124: 0A        .byte $0A   ; 
- D 1 - I - 0x013135 04:B125: 47        .byte $47   ; 
- D 1 - I - 0x013136 04:B126: 0C        .byte $0C   ; 
- D 1 - I - 0x013137 04:B127: 0B        .byte $0B   ; 
- D 1 - I - 0x013138 04:B128: 0B        .byte $0B   ; 
- D 1 - I - 0x013139 04:B129: 0C        .byte $0C   ; 
- D 1 - I - 0x01313A 04:B12A: 0B        .byte $0B   ; 
- D 1 - I - 0x01313B 04:B12B: 0C        .byte $0C   ; 
- D 1 - I - 0x01313C 04:B12C: 0A        .byte $0A   ; 
- D 1 - I - 0x01313D 04:B12D: 47        .byte $47   ; 
- D 1 - I - 0x01313E 04:B12E: 0A        .byte $0A   ; 
- D 1 - I - 0x01313F 04:B12F: 09        .byte $09   ; 
- D 1 - I - 0x013140 04:B130: 0B        .byte $0B   ; 
- D 1 - I - 0x013141 04:B131: 0C        .byte $0C   ; 
- D 1 - I - 0x013142 04:B132: 0A        .byte $0A   ; 
- D 1 - I - 0x013143 04:B133: 47        .byte $47   ; 
- D 1 - I - 0x013144 04:B134: 0B        .byte $0B   ; 
- D 1 - I - 0x013145 04:B135: 0C        .byte $0C   ; 
- D 1 - I - 0x013146 04:B136: 0B        .byte $0B   ; 
- D 1 - I - 0x013147 04:B137: 0C        .byte $0C   ; 
- D 1 - I - 0x013148 04:B138: 0A        .byte $0A   ; 
- D 1 - I - 0x013149 04:B139: 09        .byte $09   ; 
- D 1 - I - 0x01314A 04:B13A: 34        .byte $34   ; 
- D 1 - I - 0x01314B 04:B13B: 37        .byte $37   ; 
- D 1 - I - 0x01314C 04:B13C: 09        .byte $09   ; 
- D 1 - I - 0x01314D 04:B13D: 0A        .byte $0A   ; 
- D 1 - I - 0x01314E 04:B13E: CD        .byte $CD   ; 
- D 1 - I - 0x01314F 04:B13F: 39        .byte $39   ; 
- D 1 - I - 0x013150 04:B140: 0C        .byte $0C   ; 
- D 1 - I - 0x013151 04:B141: 0B        .byte $0B   ; 
- D 1 - I - 0x013152 04:B142: 32        .byte $32   ; 
- D 1 - I - 0x013153 04:B143: 35        .byte $35   ; 
- D 1 - I - 0x013154 04:B144: 39        .byte $39   ; 
- D 1 - I - 0x013155 04:B145: 47        .byte $47   ; 
- D 1 - I - 0x013156 04:B146: 00        .byte $00   ; 
- D 1 - I - 0x013157 04:B147: 00        .byte $00   ; 
- D 1 - I - 0x013158 04:B148: CD        .byte $CD   ; 
- D 1 - I - 0x013159 04:B149: 0D        .byte $0D   ; 
- D 1 - I - 0x01315A 04:B14A: 0A        .byte $0A   ; 
- D 1 - I - 0x01315B 04:B14B: 47        .byte $47   ; 
- D 1 - I - 0x01315C 04:B14C: 44        .byte $44   ; 
- D 1 - I - 0x01315D 04:B14D: 3A        .byte $3A   ; 
- D 1 - I - 0x01315E 04:B14E: 0B        .byte $0B   ; 
- D 1 - I - 0x01315F 04:B14F: 0C        .byte $0C   ; 
- D 1 - I - 0x013160 04:B150: 45        .byte $45   ; 
- D 1 - I - 0x013161 04:B151: 3D        .byte $3D   ; 
- D 1 - I - 0x013162 04:B152: 46        .byte $46   ; 
- D 1 - I - 0x013163 04:B153: 45        .byte $45   ; 
- D 1 - I - 0x013164 04:B154: 3C        .byte $3C   ; 
- D 1 - I - 0x013165 04:B155: 00        .byte $00   ; 
- D 1 - I - 0x013166 04:B156: 43        .byte $43   ; 
- D 1 - I - 0x013167 04:B157: 3D        .byte $3D   ; 
- D 1 - I - 0x013168 04:B158: 00        .byte $00   ; 
- D 1 - I - 0x013169 04:B159: 00        .byte $00   ; 
- D 1 - I - 0x01316A 04:B15A: 32        .byte $32   ; 
- D 1 - I - 0x01316B 04:B15B: CD        .byte $CD   ; 
- D 1 - I - 0x01316C 04:B15C: 39        .byte $39   ; 
- D 1 - I - 0x01316D 04:B15D: 36        .byte $36   ; 
- D 1 - I - 0x01316E 04:B15E: 00        .byte $00   ; 
- D 1 - I - 0x01316F 04:B15F: 33        .byte $33   ; 
- D 1 - I - 0x013170 04:B160: 34        .byte $34   ; 
- D 1 - I - 0x013171 04:B161: 0D        .byte $0D   ; 
- D 1 - I - 0x013172 04:B162: 32        .byte $32   ; 
- D 1 - I - 0x013173 04:B163: 00        .byte $00   ; 
- D 1 - I - 0x013174 04:B164: 35        .byte $35   ; 
- D 1 - I - 0x013175 04:B165: 39        .byte $39   ; 
- D 1 - I - 0x013176 04:B166: 00        .byte $00   ; 
- D 1 - I - 0x013177 04:B167: 00        .byte $00   ; 
- D 1 - I - 0x013178 04:B168: 00        .byte $00   ; 
- D 1 - I - 0x013179 04:B169: CD        .byte $CD   ; 
- D 1 - I - 0x01317A 04:B16A: 0A        .byte $0A   ; 
- D 1 - I - 0x01317B 04:B16B: 47        .byte $47   ; 
- D 1 - I - 0x01317C 04:B16C: 09        .byte $09   ; 
- D 1 - I - 0x01317D 04:B16D: 0A        .byte $0A   ; 
- D 1 - I - 0x01317E 04:B16E: 0B        .byte $0B   ; 
- D 1 - I - 0x01317F 04:B16F: 0C        .byte $0C   ; 
- D 1 - I - 0x013180 04:B170: 0C        .byte $0C   ; 
- D 1 - I - 0x013181 04:B171: 0B        .byte $0B   ; 
- D 1 - I - 0x013182 04:B172: 0E        .byte $0E   ; 
- D 1 - I - 0x013183 04:B173: 0A        .byte $0A   ; 
- D 1 - I - 0x013184 04:B174: 0A        .byte $0A   ; 
- D 1 - I - 0x013185 04:B175: 47        .byte $47   ; 
- D 1 - I - 0x013186 04:B176: 39        .byte $39   ; 
- D 1 - I - 0x013187 04:B177: 0E        .byte $0E   ; 
- D 1 - I - 0x013188 04:B178: 0B        .byte $0B   ; 
- D 1 - I - 0x013189 04:B179: 0C        .byte $0C   ; 
- D 1 - I - 0x01318A 04:B17A: 0A        .byte $0A   ; 
- D 1 - I - 0x01318B 04:B17B: 47        .byte $47   ; 
- D 1 - I - 0x01318C 04:B17C: 09        .byte $09   ; 
- D 1 - I - 0x01318D 04:B17D: 0A        .byte $0A   ; 
- D 1 - I - 0x01318E 04:B17E: 0B        .byte $0B   ; 
- D 1 - I - 0x01318F 04:B17F: 0C        .byte $0C   ; 
- D 1 - I - 0x013190 04:B180: 0C        .byte $0C   ; 
- D 1 - I - 0x013191 04:B181: 0B        .byte $0B   ; 
- D 1 - I - 0x013192 04:B182: 09        .byte $09   ; 
- D 1 - I - 0x013193 04:B183: 0A        .byte $0A   ; 
- D 1 - I - 0x013194 04:B184: 0A        .byte $0A   ; 
- D 1 - I - 0x013195 04:B185: D0        .byte $D0   ; 
- D 1 - I - 0x013196 04:B186: 0C        .byte $0C   ; 
- D 1 - I - 0x013197 04:B187: 0B        .byte $0B   ; 
- D 1 - I - 0x013198 04:B188: D0        .byte $D0   ; 
- D 1 - I - 0x013199 04:B189: 45        .byte $45   ; 
- D 1 - I - 0x01319A 04:B18A: 42        .byte $42   ; 
- D 1 - I - 0x01319B 04:B18B: 45        .byte $45   ; 
- D 1 - I - 0x01319C 04:B18C: 3D        .byte $3D   ; 
- D 1 - I - 0x01319D 04:B18D: 00        .byte $00   ; 
- D 1 - I - 0x01319E 04:B18E: 43        .byte $43   ; 
- D 1 - I - 0x01319F 04:B18F: 3A        .byte $3A   ; 
- D 1 - I - 0x0131A0 04:B190: 3B        .byte $3B   ; 
- D 1 - I - 0x0131A1 04:B191: 00        .byte $00   ; 
- D 1 - I - 0x0131A2 04:B192: 45        .byte $45   ; 
- D 1 - I - 0x0131A3 04:B193: 3C        .byte $3C   ; 
- D 1 - I - 0x0131A4 04:B194: 32        .byte $32   ; 
- D 1 - I - 0x0131A5 04:B195: 00        .byte $00   ; 
- D 1 - I - 0x0131A6 04:B196: 3D        .byte $3D   ; 
- D 1 - I - 0x0131A7 04:B197: 00        .byte $00   ; 
- D 1 - I - 0x0131A8 04:B198: 00        .byte $00   ; 
- D 1 - I - 0x0131A9 04:B199: 00        .byte $00   ; 
- D 1 - I - 0x0131AA 04:B19A: 09        .byte $09   ; 
- D 1 - I - 0x0131AB 04:B19B: 0A        .byte $0A   ; 
- D 1 - I - 0x0131AC 04:B19C: 46        .byte $46   ; 
- D 1 - I - 0x0131AD 04:B19D: 45        .byte $45   ; 
- D 1 - I - 0x0131AE 04:B19E: 0C        .byte $0C   ; 
- D 1 - I - 0x0131AF 04:B19F: 0B        .byte $0B   ; 
- D 1 - I - 0x0131B0 04:B1A0: 43        .byte $43   ; 
- D 1 - I - 0x0131B1 04:B1A1: 3D        .byte $3D   ; 
- D 1 - I - 0x0131B2 04:B1A2: 46        .byte $46   ; 
- D 1 - I - 0x0131B3 04:B1A3: 44        .byte $44   ; 
- D 1 - I - 0x0131B4 04:B1A4: 3A        .byte $3A   ; 
- D 1 - I - 0x0131B5 04:B1A5: 3B        .byte $3B   ; 
- D 1 - I - 0x0131B6 04:B1A6: 0B        .byte $0B   ; 
- D 1 - I - 0x0131B7 04:B1A7: 45        .byte $45   ; 
- D 1 - I - 0x0131B8 04:B1A8: 3D        .byte $3D   ; 
- D 1 - I - 0x0131B9 04:B1A9: 00        .byte $00   ; 
- D 1 - I - 0x0131BA 04:B1AA: 38        .byte $38   ; 
- D 1 - I - 0x0131BB 04:B1AB: 0E        .byte $0E   ; 
- D 1 - I - 0x0131BC 04:B1AC: 0A        .byte $0A   ; 
- D 1 - I - 0x0131BD 04:B1AD: 0A        .byte $0A   ; 
- D 1 - I - 0x0131BE 04:B1AE: 35        .byte $35   ; 
- D 1 - I - 0x0131BF 04:B1AF: 39        .byte $39   ; 
- D 1 - I - 0x0131C0 04:B1B0: 0C        .byte $0C   ; 
- D 1 - I - 0x0131C1 04:B1B1: 09        .byte $09   ; 
- D 1 - I - 0x0131C2 04:B1B2: 33        .byte $33   ; 
- D 1 - I - 0x0131C3 04:B1B3: 34        .byte $34   ; 
- D 1 - I - 0x0131C4 04:B1B4: 37        .byte $37   ; 
- D 1 - I - 0x0131C5 04:B1B5: 0B        .byte $0B   ; 
- D 1 - I - 0x0131C6 04:B1B6: 00        .byte $00   ; 
- D 1 - I - 0x0131C7 04:B1B7: CD        .byte $CD   ; 
- D 1 - I - 0x0131C8 04:B1B8: 39        .byte $39   ; 
- D 1 - I - 0x0131C9 04:B1B9: 0C        .byte $0C   ; 
- D 1 - I - 0x0131CA 04:B1BA: 33        .byte $33   ; 
- D 1 - I - 0x0131CB 04:B1BB: 34        .byte $34   ; 
- D 1 - I - 0x0131CC 04:B1BC: 36        .byte $36   ; 
- D 1 - I - 0x0131CD 04:B1BD: 0B        .byte $0B   ; 
- D 1 - I - 0x0131CE 04:B1BE: 35        .byte $35   ; 
- D 1 - I - 0x0131CF 04:B1BF: CC        .byte $CC   ; 
- D 1 - I - 0x0131D0 04:B1C0: 0D        .byte $0D   ; 
- D 1 - I - 0x0131D1 04:B1C1: 36        .byte $36   ; 
- D 1 - I - 0x0131D2 04:B1C2: 33        .byte $33   ; 
- D 1 - I - 0x0131D3 04:B1C3: 34        .byte $34   ; 
- D 1 - I - 0x0131D4 04:B1C4: 37        .byte $37   ; 
- D 1 - I - 0x0131D5 04:B1C5: 0D        .byte $0D   ; 
- D 1 - I - 0x0131D6 04:B1C6: 00        .byte $00   ; 
- D 1 - I - 0x0131D7 04:B1C7: CD        .byte $CD   ; 
- D 1 - I - 0x0131D8 04:B1C8: 38        .byte $38   ; 
- D 1 - I - 0x0131D9 04:B1C9: 0B        .byte $0B   ; 
- D 1 - I - 0x0131DA 04:B1CA: 47        .byte $47   ; 
- D 1 - I - 0x0131DB 04:B1CB: 42        .byte $42   ; 
- D 1 - I - 0x0131DC 04:B1CC: 3A        .byte $3A   ; 
- D 1 - I - 0x0131DD 04:B1CD: 3B        .byte $3B   ; 
- D 1 - I - 0x0131DE 04:B1CE: 42        .byte $42   ; 
- D 1 - I - 0x0131DF 04:B1CF: 43        .byte $43   ; 
- D 1 - I - 0x0131E0 04:B1D0: CE        .byte $CE   ; 
- D 1 - I - 0x0131E1 04:B1D1: 3C        .byte $3C   ; 
- D 1 - I - 0x0131E2 04:B1D2: 43        .byte $43   ; 
- D 1 - I - 0x0131E3 04:B1D3: 44        .byte $44   ; 
- D 1 - I - 0x0131E4 04:B1D4: 3A        .byte $3A   ; 
- D 1 - I - 0x0131E5 04:B1D5: 3B        .byte $3B   ; 
- D 1 - I - 0x0131E6 04:B1D6: 09        .byte $09   ; 
- D 1 - I - 0x0131E7 04:B1D7: CF        .byte $CF   ; 
- D 1 - I - 0x0131E8 04:B1D8: 3D        .byte $3D   ; 
- D 1 - I - 0x0131E9 04:B1D9: 00        .byte $00   ; 
- D 1 - I - 0x0131EA 04:B1DA: 42        .byte $42   ; 
- D 1 - I - 0x0131EB 04:B1DB: 3A        .byte $3A   ; 
- D 1 - I - 0x0131EC 04:B1DC: 3B        .byte $3B   ; 
- D 1 - I - 0x0131ED 04:B1DD: 00        .byte $00   ; 
- D 1 - I - 0x0131EE 04:B1DE: 43        .byte $43   ; 
- D 1 - I - 0x0131EF 04:B1DF: CE        .byte $CE   ; 
- D 1 - I - 0x0131F0 04:B1E0: 3C        .byte $3C   ; 
- D 1 - I - 0x0131F1 04:B1E1: 00        .byte $00   ; 
- D 1 - I - 0x0131F2 04:B1E2: 44        .byte $44   ; 
- D 1 - I - 0x0131F3 04:B1E3: 3A        .byte $3A   ; 
- D 1 - I - 0x0131F4 04:B1E4: 3B        .byte $3B   ; 
- D 1 - I - 0x0131F5 04:B1E5: 00        .byte $00   ; 
- D 1 - I - 0x0131F6 04:B1E6: 43        .byte $43   ; 
- D 1 - I - 0x0131F7 04:B1E7: 3D        .byte $3D   ; 
- D 1 - I - 0x0131F8 04:B1E8: 00        .byte $00   ; 
- D 1 - I - 0x0131F9 04:B1E9: 00        .byte $00   ; 
- D 1 - I - 0x0131FA 04:B1EA: 32        .byte $32   ; 
- D 1 - I - 0x0131FB 04:B1EB: 33        .byte $33   ; 
- D 1 - I - 0x0131FC 04:B1EC: 34        .byte $34   ; 
- D 1 - I - 0x0131FD 04:B1ED: 36        .byte $36   ; 
- D 1 - I - 0x0131FE 04:B1EE: 00        .byte $00   ; 
- D 1 - I - 0x0131FF 04:B1EF: 35        .byte $35   ; 
- D 1 - I - 0x013200 04:B1F0: CC        .byte $CC   ; 
- D 1 - I - 0x013201 04:B1F1: 0D        .byte $0D   ; 
- D 1 - I - 0x013202 04:B1F2: 32        .byte $32   ; 
- D 1 - I - 0x013203 04:B1F3: 33        .byte $33   ; 
- D 1 - I - 0x013204 04:B1F4: 34        .byte $34   ; 
- D 1 - I - 0x013205 04:B1F5: 37        .byte $37   ; 
- D 1 - I - 0x013206 04:B1F6: 00        .byte $00   ; 
- D 1 - I - 0x013207 04:B1F7: 33        .byte $33   ; 
- D 1 - I - 0x013208 04:B1F8: 34        .byte $34   ; 
- D 1 - I - 0x013209 04:B1F9: 0D        .byte $0D   ; 
- D 1 - I - 0x01320A 04:B1FA: 33        .byte $33   ; 
- D 1 - I - 0x01320B 04:B1FB: 34        .byte $34   ; 
- D 1 - I - 0x01320C 04:B1FC: 36        .byte $36   ; 
- D 1 - I - 0x01320D 04:B1FD: 0B        .byte $0B   ; 
- D 1 - I - 0x01320E 04:B1FE: 35        .byte $35   ; 
- D 1 - I - 0x01320F 04:B1FF: CC        .byte $CC   ; 
- D 1 - I - 0x013210 04:B200: 0D        .byte $0D   ; 
- D 1 - I - 0x013211 04:B201: 0E        .byte $0E   ; 
- D 1 - I - 0x013212 04:B202: 33        .byte $33   ; 
- D 1 - I - 0x013213 04:B203: 34        .byte $34   ; 
- D 1 - I - 0x013214 04:B204: 37        .byte $37   ; 
- D 1 - I - 0x013215 04:B205: 47        .byte $47   ; 
- D 1 - I - 0x013216 04:B206: 00        .byte $00   ; 
- D 1 - I - 0x013217 04:B207: CD        .byte $CD   ; 
- D 1 - I - 0x013218 04:B208: 38        .byte $38   ; 
- D 1 - I - 0x013219 04:B209: 0B        .byte $0B   ; 
- D 1 - I - 0x01321A 04:B20A: 47        .byte $47   ; 
- D 1 - I - 0x01321B 04:B20B: 42        .byte $42   ; 
- D 1 - I - 0x01321C 04:B20C: 3A        .byte $3A   ; 
- D 1 - I - 0x01321D 04:B20D: 3B        .byte $3B   ; 
- D 1 - I - 0x01321E 04:B20E: D0        .byte $D0   ; 
- D 1 - I - 0x01321F 04:B20F: 43        .byte $43   ; 
- D 1 - I - 0x013220 04:B210: CE        .byte $CE   ; 
- D 1 - I - 0x013221 04:B211: 3C        .byte $3C   ; 
- D 1 - I - 0x013222 04:B212: 47        .byte $47   ; 
- D 1 - I - 0x013223 04:B213: 44        .byte $44   ; 
- D 1 - I - 0x013224 04:B214: 3A        .byte $3A   ; 
- D 1 - I - 0x013225 04:B215: 3B        .byte $3B   ; 
- D 1 - I - 0x013226 04:B216: 09        .byte $09   ; 
- D 1 - I - 0x013227 04:B217: CF        .byte $CF   ; 
- D 1 - I - 0x013228 04:B218: 3D        .byte $3D   ; 
- D 1 - I - 0x013229 04:B219: 00        .byte $00   ; 
- D 1 - I - 0x01322A 04:B21A: 47        .byte $47   ; 
- D 1 - I - 0x01322B 04:B21B: 42        .byte $42   ; 
- D 1 - I - 0x01322C 04:B21C: 3A        .byte $3A   ; 
- D 1 - I - 0x01322D 04:B21D: 3B        .byte $3B   ; 
- D 1 - I - 0x01322E 04:B21E: 0B        .byte $0B   ; 
- D 1 - I - 0x01322F 04:B21F: 43        .byte $43   ; 
- D 1 - I - 0x013230 04:B220: CE        .byte $CE   ; 
- D 1 - I - 0x013231 04:B221: 3C        .byte $3C   ; 
- D 1 - I - 0x013232 04:B222: 09        .byte $09   ; 
- D 1 - I - 0x013233 04:B223: 0C        .byte $0C   ; 
- D 1 - I - 0x013234 04:B224: 42        .byte $42   ; 
- D 1 - I - 0x013235 04:B225: 3D        .byte $3D   ; 
- D 1 - I - 0x013236 04:B226: 0C        .byte $0C   ; 
- D 1 - I - 0x013237 04:B227: 0B        .byte $0B   ; 
- D 1 - I - 0x013238 04:B228: 43        .byte $43   ; 
- D 1 - I - 0x013239 04:B229: 42        .byte $42   ; 
- D 1 - I - 0x01323A 04:B22A: 33        .byte $33   ; 
- D 1 - I - 0x01323B 04:B22B: 34        .byte $34   ; 
- D 1 - I - 0x01323C 04:B22C: 36        .byte $36   ; 
- D 1 - I - 0x01323D 04:B22D: 0A        .byte $0A   ; 
- D 1 - I - 0x01323E 04:B22E: 00        .byte $00   ; 
- D 1 - I - 0x01323F 04:B22F: CD        .byte $CD   ; 
- D 1 - I - 0x013240 04:B230: 0D        .byte $0D   ; 
- D 1 - I - 0x013241 04:B231: 0C        .byte $0C   ; 
- D 1 - I - 0x013242 04:B232: 33        .byte $33   ; 
- D 1 - I - 0x013243 04:B233: 36        .byte $36   ; 
- D 1 - I - 0x013244 04:B234: 0B        .byte $0B   ; 
- D 1 - I - 0x013245 04:B235: 47        .byte $47   ; 
- D 1 - I - 0x013246 04:B236: 36        .byte $36   ; 
- D 1 - I - 0x013247 04:B237: 47        .byte $47   ; 
- D 1 - I - 0x013248 04:B238: 0B        .byte $0B   ; 
- D 1 - I - 0x013249 04:B239: 0C        .byte $0C   ; 
- D 1 - I - 0x01324A 04:B23A: 48        .byte $48   ; 
- D 1 - I - 0x01324B 04:B23B: D3        .byte $D3   ; 
- D 1 - I - 0x01324C 04:B23C: 49        .byte $49   ; 
- D 1 - I - 0x01324D 04:B23D: 00        .byte $00   ; 
- D 1 - I - 0x01324E 04:B23E: D8        .byte $D8   ; 
- D 1 - I - 0x01324F 04:B23F: D9        .byte $D9   ; 
- D 1 - I - 0x013250 04:B240: FC        .byte $FC   ; 
- D 1 - I - 0x013251 04:B241: 00        .byte $00   ; 
- D 1 - I - 0x013252 04:B242: 4C        .byte $4C   ; 
- D 1 - I - 0x013253 04:B243: DE        .byte $DE   ; 
- D 1 - I - 0x013254 04:B244: 4D        .byte $4D   ; 
- D 1 - I - 0x013255 04:B245: DF        .byte $DF   ; 
- D 1 - I - 0x013256 04:B246: E2        .byte $E2   ; 
- D 1 - I - 0x013257 04:B247: E3        .byte $E3   ; 
- D 1 - I - 0x013258 04:B248: E4        .byte $E4   ; 
- D 1 - I - 0x013259 04:B249: E5        .byte $E5   ; 
- D 1 - I - 0x01325A 04:B24A: 32        .byte $32   ; 
- D 1 - I - 0x01325B 04:B24B: E6        .byte $E6   ; 
- D 1 - I - 0x01325C 04:B24C: 4E        .byte $4E   ; 
- D 1 - I - 0x01325D 04:B24D: E7        .byte $E7   ; 
- D 1 - I - 0x01325E 04:B24E: 00        .byte $00   ; 
- D 1 - I - 0x01325F 04:B24F: FD        .byte $FD   ; 
- D 1 - I - 0x013260 04:B250: EC        .byte $EC   ; 
- D 1 - I - 0x013261 04:B251: ED        .byte $ED   ; 
- D 1 - I - 0x013262 04:B252: 51        .byte $51   ; 
- D 1 - I - 0x013263 04:B253: F2        .byte $F2   ; 
- D 1 - I - 0x013264 04:B254: 52        .byte $52   ; 
- D 1 - I - 0x013265 04:B255: F3        .byte $F3   ; 
- D 1 - I - 0x013266 04:B256: F6        .byte $F6   ; 
- D 1 - I - 0x013267 04:B257: F7        .byte $F7   ; 
- D 1 - I - 0x013268 04:B258: F8        .byte $F8   ; 
- D 1 - I - 0x013269 04:B259: F9        .byte $F9   ; 
- D 1 - I - 0x01326A 04:B25A: 4A        .byte $4A   ; 
- D 1 - I - 0x01326B 04:B25B: DC        .byte $DC   ; 
- D 1 - I - 0x01326C 04:B25C: 4B        .byte $4B   ; 
- D 1 - I - 0x01326D 04:B25D: DD        .byte $DD   ; 
- D 1 - I - 0x01326E 04:B25E: 00        .byte $00   ; 
- D 1 - I - 0x01326F 04:B25F: E0        .byte $E0   ; 
- D 1 - I - 0x013270 04:B260: E1        .byte $E1   ; 
- D 1 - I - 0x013271 04:B261: 00        .byte $00   ; 
- D 1 - I - 0x013272 04:B262: 55        .byte $55   ; 
- D 1 - I - 0x013273 04:B263: D1        .byte $D1   ; 
- D 1 - I - 0x013274 04:B264: 56        .byte $56   ; 
- D 1 - I - 0x013275 04:B265: D2        .byte $D2   ; 
- D 1 - I - 0x013276 04:B266: D4        .byte $D4   ; 
- D 1 - I - 0x013277 04:B267: D5        .byte $D5   ; 
- D 1 - I - 0x013278 04:B268: D6        .byte $D6   ; 
- D 1 - I - 0x013279 04:B269: D7        .byte $D7   ; 
- D 1 - I - 0x01327A 04:B26A: 4C        .byte $4C   ; 
- D 1 - I - 0x01327B 04:B26B: DE        .byte $DE   ; 
- D 1 - I - 0x01327C 04:B26C: 4D        .byte $4D   ; 
- D 1 - I - 0x01327D 04:B26D: DF        .byte $DF   ; 
- D 1 - I - 0x01327E 04:B26E: E2        .byte $E2   ; 
- D 1 - I - 0x01327F 04:B26F: E3        .byte $E3   ; 
- D 1 - I - 0x013280 04:B270: E4        .byte $E4   ; 
- D 1 - I - 0x013281 04:B271: E5        .byte $E5   ; 
- - - - - - 0x013282 04:B272: 48        .byte $48   ; 
- - - - - - 0x013283 04:B273: D3        .byte $D3   ; 
- - - - - - 0x013284 04:B274: 49        .byte $49   ; 
- - - - - - 0x013285 04:B275: 00        .byte $00   ; 
- - - - - - 0x013286 04:B276: D8        .byte $D8   ; 
- - - - - - 0x013287 04:B277: D9        .byte $D9   ; 
- - - - - - 0x013288 04:B278: DA        .byte $DA   ; 
- - - - - - 0x013289 04:B279: DB        .byte $DB   ; 
- D 1 - I - 0x01328A 04:B27A: 51        .byte $51   ; 
- D 1 - I - 0x01328B 04:B27B: F2        .byte $F2   ; 
- D 1 - I - 0x01328C 04:B27C: 52        .byte $52   ; 
- D 1 - I - 0x01328D 04:B27D: F3        .byte $F3   ; 
- D 1 - I - 0x01328E 04:B27E: F6        .byte $F6   ; 
- D 1 - I - 0x01328F 04:B27F: F7        .byte $F7   ; 
- D 1 - I - 0x013290 04:B280: F8        .byte $F8   ; 
- D 1 - I - 0x013291 04:B281: F9        .byte $F9   ; 
- - - - - - 0x013292 04:B282: 32        .byte $32   ; 
- - - - - - 0x013293 04:B283: E6        .byte $E6   ; 
- - - - - - 0x013294 04:B284: 4E        .byte $4E   ; 
- - - - - - 0x013295 04:B285: E7        .byte $E7   ; 
- - - - - - 0x013296 04:B286: EA        .byte $EA   ; 
- - - - - - 0x013297 04:B287: EB        .byte $EB   ; 
- - - - - - 0x013298 04:B288: EC        .byte $EC   ; 
- - - - - - 0x013299 04:B289: ED        .byte $ED   ; 
- D 1 - I - 0x01329A 04:B28A: 53        .byte $53   ; 
- D 1 - I - 0x01329B 04:B28B: F4        .byte $F4   ; 
- D 1 - I - 0x01329C 04:B28C: 54        .byte $54   ; 
- D 1 - I - 0x01329D 04:B28D: F5        .byte $F5   ; 
- D 1 - I - 0x01329E 04:B28E: 00        .byte $00   ; 
- D 1 - I - 0x01329F 04:B28F: FA        .byte $FA   ; 
- D 1 - I - 0x0132A0 04:B290: FB        .byte $FB   ; 
- D 1 - I - 0x0132A1 04:B291: 00        .byte $00   ; 
- D 1 - I - 0x0132A2 04:B292: 4F        .byte $4F   ; 
- D 1 - I - 0x0132A3 04:B293: E8        .byte $E8   ; 
- D 1 - I - 0x0132A4 04:B294: 50        .byte $50   ; 
- D 1 - I - 0x0132A5 04:B295: E9        .byte $E9   ; 
- D 1 - I - 0x0132A6 04:B296: EE        .byte $EE   ; 
- D 1 - I - 0x0132A7 04:B297: EF        .byte $EF   ; 
- D 1 - I - 0x0132A8 04:B298: F0        .byte $F0   ; 
- D 1 - I - 0x0132A9 04:B299: F1        .byte $F1   ; 
- D 1 - I - 0x0132AA 04:B29A: 32        .byte $32   ; 
- D 1 - I - 0x0132AB 04:B29B: 00        .byte $00   ; 
- D 1 - I - 0x0132AC 04:B29C: 32        .byte $32   ; 
- D 1 - I - 0x0132AD 04:B29D: 00        .byte $00   ; 
- D 1 - I - 0x0132AE 04:B29E: 00        .byte $00   ; 
- D 1 - I - 0x0132AF 04:B29F: E0        .byte $E0   ; 
- D 1 - I - 0x0132B0 04:B2A0: E1        .byte $E1   ; 
- D 1 - I - 0x0132B1 04:B2A1: 00        .byte $00   ; 
- D 1 - I - 0x0132B2 04:B2A2: 55        .byte $55   ; 
- D 1 - I - 0x0132B3 04:B2A3: D1        .byte $D1   ; 
- D 1 - I - 0x0132B4 04:B2A4: 56        .byte $56   ; 
- D 1 - I - 0x0132B5 04:B2A5: D2        .byte $D2   ; 
- D 1 - I - 0x0132B6 04:B2A6: D4        .byte $D4   ; 
- D 1 - I - 0x0132B7 04:B2A7: D5        .byte $D5   ; 
- D 1 - I - 0x0132B8 04:B2A8: D6        .byte $D6   ; 
- D 1 - I - 0x0132B9 04:B2A9: D7        .byte $D7   ; 
- D 1 - I - 0x0132BA 04:B2AA: 4C        .byte $4C   ; 
- D 1 - I - 0x0132BB 04:B2AB: DE        .byte $DE   ; 
- D 1 - I - 0x0132BC 04:B2AC: 32        .byte $32   ; 
- D 1 - I - 0x0132BD 04:B2AD: 00        .byte $00   ; 
- D 1 - I - 0x0132BE 04:B2AE: E2        .byte $E2   ; 
- D 1 - I - 0x0132BF 04:B2AF: E3        .byte $E3   ; 
- D 1 - I - 0x0132C0 04:B2B0: 00        .byte $00   ; 
- D 1 - I - 0x0132C1 04:B2B1: 00        .byte $00   ; 
- D 1 - I - 0x0132C2 04:B2B2: 48        .byte $48   ; 
- D 1 - I - 0x0132C3 04:B2B3: D3        .byte $D3   ; 
- D 1 - I - 0x0132C4 04:B2B4: 49        .byte $49   ; 
- D 1 - I - 0x0132C5 04:B2B5: 00        .byte $00   ; 
- D 1 - I - 0x0132C6 04:B2B6: D8        .byte $D8   ; 
- D 1 - I - 0x0132C7 04:B2B7: D9        .byte $D9   ; 
- D 1 - I - 0x0132C8 04:B2B8: DA        .byte $DA   ; 
- D 1 - I - 0x0132C9 04:B2B9: DB        .byte $DB   ; 
- D 1 - I - 0x0132CA 04:B2BA: 32        .byte $32   ; 
- D 1 - I - 0x0132CB 04:B2BB: 00        .byte $00   ; 
- D 1 - I - 0x0132CC 04:B2BC: 52        .byte $52   ; 
- D 1 - I - 0x0132CD 04:B2BD: F3        .byte $F3   ; 
- D 1 - I - 0x0132CE 04:B2BE: 00        .byte $00   ; 
- D 1 - I - 0x0132CF 04:B2BF: 00        .byte $00   ; 
- D 1 - I - 0x0132D0 04:B2C0: F8        .byte $F8   ; 
- D 1 - I - 0x0132D1 04:B2C1: F9        .byte $F9   ; 
- D 1 - I - 0x0132D2 04:B2C2: 32        .byte $32   ; 
- D 1 - I - 0x0132D3 04:B2C3: E6        .byte $E6   ; 
- D 1 - I - 0x0132D4 04:B2C4: 4E        .byte $4E   ; 
- D 1 - I - 0x0132D5 04:B2C5: E7        .byte $E7   ; 
- D 1 - I - 0x0132D6 04:B2C6: EA        .byte $EA   ; 
- D 1 - I - 0x0132D7 04:B2C7: EB        .byte $EB   ; 
- D 1 - I - 0x0132D8 04:B2C8: EC        .byte $EC   ; 
- D 1 - I - 0x0132D9 04:B2C9: ED        .byte $ED   ; 
- D 1 - I - 0x0132DA 04:B2CA: 32        .byte $32   ; 
- D 1 - I - 0x0132DB 04:B2CB: 00        .byte $00   ; 
- D 1 - I - 0x0132DC 04:B2CC: 32        .byte $32   ; 
- D 1 - I - 0x0132DD 04:B2CD: 00        .byte $00   ; 
- D 1 - I - 0x0132DE 04:B2CE: 00        .byte $00   ; 
- D 1 - I - 0x0132DF 04:B2CF: FA        .byte $FA   ; 
- D 1 - I - 0x0132E0 04:B2D0: FB        .byte $FB   ; 
- D 1 - I - 0x0132E1 04:B2D1: 00        .byte $00   ; 
- D 1 - I - 0x0132E2 04:B2D2: 4F        .byte $4F   ; 
- D 1 - I - 0x0132E3 04:B2D3: E8        .byte $E8   ; 
- D 1 - I - 0x0132E4 04:B2D4: 50        .byte $50   ; 
- D 1 - I - 0x0132E5 04:B2D5: E9        .byte $E9   ; 
- D 1 - I - 0x0132E6 04:B2D6: EE        .byte $EE   ; 
- D 1 - I - 0x0132E7 04:B2D7: EF        .byte $EF   ; 
- D 1 - I - 0x0132E8 04:B2D8: F0        .byte $F0   ; 
- D 1 - I - 0x0132E9 04:B2D9: F1        .byte $F1   ; 
- D 1 - I - 0x0132EA 04:B2DA: 48        .byte $48   ; 
- D 1 - I - 0x0132EB 04:B2DB: 49        .byte $49   ; 
- D 1 - I - 0x0132EC 04:B2DC: 32        .byte $32   ; 
- D 1 - I - 0x0132ED 04:B2DD: 00        .byte $00   ; 
- D 1 - I - 0x0132EE 04:B2DE: D8        .byte $D8   ; 
- D 1 - I - 0x0132EF 04:B2DF: D9        .byte $D9   ; 
- D 1 - I - 0x0132F0 04:B2E0: FC        .byte $FC   ; 
- D 1 - I - 0x0132F1 04:B2E1: 00        .byte $00   ; 
- D 1 - I - 0x0132F2 04:B2E2: 4C        .byte $4C   ; 
- D 1 - I - 0x0132F3 04:B2E3: DE        .byte $DE   ; 
- D 1 - I - 0x0132F4 04:B2E4: 4D        .byte $4D   ; 
- D 1 - I - 0x0132F5 04:B2E5: DF        .byte $DF   ; 
- D 1 - I - 0x0132F6 04:B2E6: E2        .byte $E2   ; 
- D 1 - I - 0x0132F7 04:B2E7: E3        .byte $E3   ; 
- D 1 - I - 0x0132F8 04:B2E8: E4        .byte $E4   ; 
- D 1 - I - 0x0132F9 04:B2E9: E5        .byte $E5   ; 
- D 1 - I - 0x0132FA 04:B2EA: 34        .byte $34   ; 
- D 1 - I - 0x0132FB 04:B2EB: 36        .byte $36   ; 
- D 1 - I - 0x0132FC 04:B2EC: 09        .byte $09   ; 
- D 1 - I - 0x0132FD 04:B2ED: 0A        .byte $0A   ; 
- D 1 - I - 0x0132FE 04:B2EE: 35        .byte $35   ; 
- D 1 - I - 0x0132FF 04:B2EF: 0D        .byte $0D   ; 
- D 1 - I - 0x013300 04:B2F0: 0E        .byte $0E   ; 
- D 1 - I - 0x013301 04:B2F1: 0B        .byte $0B   ; 
- D 1 - I - 0x013302 04:B2F2: 34        .byte $34   ; 
- D 1 - I - 0x013303 04:B2F3: 37        .byte $37   ; 
- D 1 - I - 0x013304 04:B2F4: 0A        .byte $0A   ; 
- D 1 - I - 0x013305 04:B2F5: 47        .byte $47   ; 
- D 1 - I - 0x013306 04:B2F6: CD        .byte $CD   ; 
- D 1 - I - 0x013307 04:B2F7: 38        .byte $38   ; 
- D 1 - I - 0x013308 04:B2F8: 0B        .byte $0B   ; 
- D 1 - I - 0x013309 04:B2F9: 0C        .byte $0C   ; 
- D 1 - I - 0x01330A 04:B2FA: 0A        .byte $0A   ; 
- D 1 - I - 0x01330B 04:B2FB: 47        .byte $47   ; 
- D 1 - I - 0x01330C 04:B2FC: 42        .byte $42   ; 
- D 1 - I - 0x01330D 04:B2FD: 3A        .byte $3A   ; 
- D 1 - I - 0x01330E 04:B2FE: 0B        .byte $0B   ; 
- D 1 - I - 0x01330F 04:B2FF: D0        .byte $D0   ; 
- D 1 - I - 0x013310 04:B300: 43        .byte $43   ; 
- D 1 - I - 0x013311 04:B301: 3C        .byte $3C   ; 
- D 1 - I - 0x013312 04:B302: 09        .byte $09   ; 
- D 1 - I - 0x013313 04:B303: 0A        .byte $0A   ; 
- D 1 - I - 0x013314 04:B304: 44        .byte $44   ; 
- D 1 - I - 0x013315 04:B305: 3A        .byte $3A   ; 
- D 1 - I - 0x013316 04:B306: 0C        .byte $0C   ; 
- D 1 - I - 0x013317 04:B307: 0B        .byte $0B   ; 
- D 1 - I - 0x013318 04:B308: CF        .byte $CF   ; 
- D 1 - I - 0x013319 04:B309: 3D        .byte $3D   ; 
- D 1 - I - 0x01331A 04:B30A: 32        .byte $32   ; 
- D 1 - I - 0x01331B 04:B30B: 00        .byte $00   ; 
- D 1 - I - 0x01331C 04:B30C: 4E        .byte $4E   ; 
- D 1 - I - 0x01331D 04:B30D: E7        .byte $E7   ; 
- D 1 - I - 0x01331E 04:B30E: 00        .byte $00   ; 
- D 1 - I - 0x01331F 04:B30F: FD        .byte $FD   ; 
- D 1 - I - 0x013320 04:B310: EC        .byte $EC   ; 
- D 1 - I - 0x013321 04:B311: ED        .byte $ED   ; 
- D 1 - I - 0x013322 04:B312: 51        .byte $51   ; 
- D 1 - I - 0x013323 04:B313: F2        .byte $F2   ; 
- D 1 - I - 0x013324 04:B314: 52        .byte $52   ; 
- D 1 - I - 0x013325 04:B315: F3        .byte $F3   ; 
- D 1 - I - 0x013326 04:B316: F6        .byte $F6   ; 
- D 1 - I - 0x013327 04:B317: F7        .byte $F7   ; 
- D 1 - I - 0x013328 04:B318: F8        .byte $F8   ; 
- D 1 - I - 0x013329 04:B319: F9        .byte $F9   ; 
- D 1 - I - 0x01332A 04:B31A: 48        .byte $48   ; 
- D 1 - I - 0x01332B 04:B31B: 49        .byte $49   ; 
- D 1 - I - 0x01332C 04:B31C: 32        .byte $32   ; 
- D 1 - I - 0x01332D 04:B31D: 33        .byte $33   ; 
- D 1 - I - 0x01332E 04:B31E: D8        .byte $D8   ; 
- D 1 - I - 0x01332F 04:B31F: FE        .byte $FE   ; 
- D 1 - I - 0x013330 04:B320: 00        .byte $00   ; 
- D 1 - I - 0x013331 04:B321: 35        .byte $35   ; 
- D 1 - I - 0x013332 04:B322: 4C        .byte $4C   ; 
- D 1 - I - 0x013333 04:B323: DE        .byte $DE   ; 
- D 1 - I - 0x013334 04:B324: 33        .byte $33   ; 
- D 1 - I - 0x013335 04:B325: 34        .byte $34   ; 
- D 1 - I - 0x013336 04:B326: E2        .byte $E2   ; 
- D 1 - I - 0x013337 04:B327: 00        .byte $00   ; 
- D 1 - I - 0x013338 04:B328: 35        .byte $35   ; 
- D 1 - I - 0x013339 04:B329: CC        .byte $CC   ; 
- D 1 - I - 0x01333A 04:B32A: 34        .byte $34   ; 
- D 1 - I - 0x01333B 04:B32B: 36        .byte $36   ; 
- D 1 - I - 0x01333C 04:B32C: 09        .byte $09   ; 
- D 1 - I - 0x01333D 04:B32D: 0A        .byte $0A   ; 
- D 1 - I - 0x01333E 04:B32E: CC        .byte $CC   ; 
- D 1 - I - 0x01333F 04:B32F: 0D        .byte $0D   ; 
- D 1 - I - 0x013340 04:B330: 0C        .byte $0C   ; 
- D 1 - I - 0x013341 04:B331: 0B        .byte $0B   ; 
- D 1 - I - 0x013342 04:B332: 37        .byte $37   ; 
- D 1 - I - 0x013343 04:B333: 0A        .byte $0A   ; 
- D 1 - I - 0x013344 04:B334: 0A        .byte $0A   ; 
- D 1 - I - 0x013345 04:B335: 47        .byte $47   ; 
- D 1 - I - 0x013346 04:B336: 0D        .byte $0D   ; 
- D 1 - I - 0x013347 04:B337: 0B        .byte $0B   ; 
- D 1 - I - 0x013348 04:B338: 0B        .byte $0B   ; 
- D 1 - I - 0x013349 04:B339: 0C        .byte $0C   ; 
- D 1 - I - 0x01334A 04:B33A: 0A        .byte $0A   ; 
- D 1 - I - 0x01334B 04:B33B: 47        .byte $47   ; 
- D 1 - I - 0x01334C 04:B33C: 42        .byte $42   ; 
- D 1 - I - 0x01334D 04:B33D: 3A        .byte $3A   ; 
- D 1 - I - 0x01334E 04:B33E: 0B        .byte $0B   ; 
- D 1 - I - 0x01334F 04:B33F: 0C        .byte $0C   ; 
- D 1 - I - 0x013350 04:B340: 43        .byte $43   ; 
- D 1 - I - 0x013351 04:B341: CE        .byte $CE   ; 
- D 1 - I - 0x013352 04:B342: 09        .byte $09   ; 
- D 1 - I - 0x013353 04:B343: 0A        .byte $0A   ; 
- D 1 - I - 0x013354 04:B344: 47        .byte $47   ; 
- D 1 - I - 0x013355 04:B345: 44        .byte $44   ; 
- D 1 - I - 0x013356 04:B346: 0C        .byte $0C   ; 
- D 1 - I - 0x013357 04:B347: 0B        .byte $0B   ; 
- D 1 - I - 0x013358 04:B348: 0B        .byte $0B   ; 
- D 1 - I - 0x013359 04:B349: 43        .byte $43   ; 
- D 1 - I - 0x01335A 04:B34A: 3B        .byte $3B   ; 
- D 1 - I - 0x01335B 04:B34B: 00        .byte $00   ; 
- D 1 - I - 0x01335C 04:B34C: 4E        .byte $4E   ; 
- D 1 - I - 0x01335D 04:B34D: E7        .byte $E7   ; 
- D 1 - I - 0x01335E 04:B34E: 3C        .byte $3C   ; 
- D 1 - I - 0x01335F 04:B34F: 00        .byte $00   ; 
- D 1 - I - 0x013360 04:B350: FF        .byte $FF   ; 
- D 1 - I - 0x013361 04:B351: ED        .byte $ED   ; 
- D 1 - I - 0x013362 04:B352: 3A        .byte $3A   ; 
- D 1 - I - 0x013363 04:B353: 3B        .byte $3B   ; 
- D 1 - I - 0x013364 04:B354: 52        .byte $52   ; 
- D 1 - I - 0x013365 04:B355: F3        .byte $F3   ; 
- D 1 - I - 0x013366 04:B356: CE        .byte $CE   ; 
- D 1 - I - 0x013367 04:B357: 3C        .byte $3C   ; 
- D 1 - I - 0x013368 04:B358: 00        .byte $00   ; 
- D 1 - I - 0x013369 04:B359: F9        .byte $F9   ; 
- D 1 - I - 0x01336A 04:B35A: 48        .byte $48   ; 
- D 1 - I - 0x01336B 04:B35B: 49        .byte $49   ; 
- D 1 - I - 0x01336C 04:B35C: 35        .byte $35   ; 
- D 1 - I - 0x01336D 04:B35D: 39        .byte $39   ; 
- D 1 - I - 0x01336E 04:B35E: D8        .byte $D8   ; 
- D 1 - I - 0x01336F 04:B35F: FE        .byte $FE   ; 
- D 1 - I - 0x013370 04:B360: 00        .byte $00   ; 
- D 1 - I - 0x013371 04:B361: CD        .byte $CD   ; 
- D 1 - I - 0x013372 04:B362: 4C        .byte $4C   ; 
- D 1 - I - 0x013373 04:B363: DE        .byte $DE   ; 
- D 1 - I - 0x013374 04:B364: 4D        .byte $4D   ; 
- D 1 - I - 0x013375 04:B365: DF        .byte $DF   ; 
- D 1 - I - 0x013376 04:B366: E2        .byte $E2   ; 
- D 1 - I - 0x013377 04:B367: E3        .byte $E3   ; 
- D 1 - I - 0x013378 04:B368: E4        .byte $E4   ; 
- D 1 - I - 0x013379 04:B369: E5        .byte $E5   ; 
- D 1 - I - 0x01337A 04:B36A: 46        .byte $46   ; 
- D 1 - I - 0x01337B 04:B36B: 47        .byte $47   ; 
- D 1 - I - 0x01337C 04:B36C: 09        .byte $09   ; 
- D 1 - I - 0x01337D 04:B36D: 0A        .byte $0A   ; 
- D 1 - I - 0x01337E 04:B36E: 39        .byte $39   ; 
- D 1 - I - 0x01337F 04:B36F: 0E        .byte $0E   ; 
- D 1 - I - 0x013380 04:B370: 0C        .byte $0C   ; 
- D 1 - I - 0x013381 04:B371: 0B        .byte $0B   ; 
- D 1 - I - 0x013382 04:B372: 34        .byte $34   ; 
- D 1 - I - 0x013383 04:B373: 37        .byte $37   ; 
- D 1 - I - 0x013384 04:B374: 0A        .byte $0A   ; 
- D 1 - I - 0x013385 04:B375: 47        .byte $47   ; 
- D 1 - I - 0x013386 04:B376: CD        .byte $CD   ; 
- D 1 - I - 0x013387 04:B377: 38        .byte $38   ; 
- D 1 - I - 0x013388 04:B378: 0B        .byte $0B   ; 
- D 1 - I - 0x013389 04:B379: 0C        .byte $0C   ; 
- D 1 - I - 0x01338A 04:B37A: 0A        .byte $0A   ; 
- D 1 - I - 0x01338B 04:B37B: 47        .byte $47   ; 
- D 1 - I - 0x01338C 04:B37C: 46        .byte $46   ; 
- D 1 - I - 0x01338D 04:B37D: D0        .byte $D0   ; 
- D 1 - I - 0x01338E 04:B37E: 0B        .byte $0B   ; 
- D 1 - I - 0x01338F 04:B37F: 0C        .byte $0C   ; 
- D 1 - I - 0x013390 04:B380: D0        .byte $D0   ; 
- D 1 - I - 0x013391 04:B381: 45        .byte $45   ; 
- D 1 - I - 0x013392 04:B382: 09        .byte $09   ; 
- D 1 - I - 0x013393 04:B383: 0A        .byte $0A   ; 
- D 1 - I - 0x013394 04:B384: 44        .byte $44   ; 
- D 1 - I - 0x013395 04:B385: 3A        .byte $3A   ; 
- D 1 - I - 0x013396 04:B386: 0C        .byte $0C   ; 
- D 1 - I - 0x013397 04:B387: 0B        .byte $0B   ; 
- D 1 - I - 0x013398 04:B388: CF        .byte $CF   ; 
- D 1 - I - 0x013399 04:B389: 3D        .byte $3D   ; 
- D 1 - I - 0x01339A 04:B38A: 45        .byte $45   ; 
- D 1 - I - 0x01339B 04:B38B: 3C        .byte $3C   ; 
- D 1 - I - 0x01339C 04:B38C: 4E        .byte $4E   ; 
- D 1 - I - 0x01339D 04:B38D: E7        .byte $E7   ; 
- D 1 - I - 0x01339E 04:B38E: 3D        .byte $3D   ; 
- D 1 - I - 0x01339F 04:B38F: 00        .byte $00   ; 
- D 1 - I - 0x0133A0 04:B390: FF        .byte $FF   ; 
- D 1 - I - 0x0133A1 04:B391: ED        .byte $ED   ; 
- D 1 - I - 0x0133A2 04:B392: 32        .byte $32   ; 
- D 1 - I - 0x0133A3 04:B393: F2        .byte $F2   ; 
- D 1 - I - 0x0133A4 04:B394: 52        .byte $52   ; 
- D 1 - I - 0x0133A5 04:B395: F3        .byte $F3   ; 
- D 1 - I - 0x0133A6 04:B396: 00        .byte $00   ; 
- D 1 - I - 0x0133A7 04:B397: F7        .byte $F7   ; 
- D 1 - I - 0x0133A8 04:B398: F8        .byte $F8   ; 
- D 1 - I - 0x0133A9 04:B399: F9        .byte $F9   ; 
- D 1 - I - 0x0133AA 04:B39A: 30        .byte $30   ; 
- D 1 - I - 0x0133AB 04:B39B: 11        .byte $11   ; 
- D 1 - I - 0x0133AC 04:B39C: 2E        .byte $2E   ; 
- D 1 - I - 0x0133AD 04:B39D: 2B        .byte $2B   ; 
- D 1 - I - 0x0133AE 04:B39E: 28        .byte $28   ; 
- D 1 - I - 0x0133AF 04:B39F: 30        .byte $30   ; 
- D 1 - I - 0x0133B0 04:B3A0: 11        .byte $11   ; 
- D 1 - I - 0x0133B1 04:B3A1: 2E        .byte $2E   ; 
- D 1 - I - 0x0133B2 04:B3A2: 29        .byte $29   ; 
- D 1 - I - 0x0133B3 04:B3A3: 28        .byte $28   ; 
- D 1 - I - 0x0133B4 04:B3A4: 28        .byte $28   ; 
- D 1 - I - 0x0133B5 04:B3A5: 00        .byte $00   ; 
- D 1 - I - 0x0133B6 04:B3A6: 2A        .byte $2A   ; 
- D 1 - I - 0x0133B7 04:B3A7: 29        .byte $29   ; 
- D 1 - I - 0x0133B8 04:B3A8: 13        .byte $13   ; 
- D 1 - I - 0x0133B9 04:B3A9: 00        .byte $00   ; 
- D 1 - I - 0x0133BA 04:B3AA: 32        .byte $32   ; 
- D 1 - I - 0x0133BB 04:B3AB: E0        .byte $E0   ; 
- D 1 - I - 0x0133BC 04:B3AC: 00        .byte $00   ; 
- D 1 - I - 0x0133BD 04:B3AD: 00        .byte $00   ; 
- D 1 - I - 0x0133BE 04:B3AE: 00        .byte $00   ; 
- D 1 - I - 0x0133BF 04:B3AF: 00        .byte $00   ; 
- D 1 - I - 0x0133C0 04:B3B0: 00        .byte $00   ; 
- D 1 - I - 0x0133C1 04:B3B1: 00        .byte $00   ; 
- D 1 - I - 0x0133C2 04:B3B2: 00        .byte $00   ; 
- D 1 - I - 0x0133C3 04:B3B3: 00        .byte $00   ; 
- D 1 - I - 0x0133C4 04:B3B4: 00        .byte $00   ; 
- D 1 - I - 0x0133C5 04:B3B5: 00        .byte $00   ; 
- D 1 - I - 0x0133C6 04:B3B6: 00        .byte $00   ; 
- D 1 - I - 0x0133C7 04:B3B7: 00        .byte $00   ; 
- D 1 - I - 0x0133C8 04:B3B8: E2        .byte $E2   ; 
- D 1 - I - 0x0133C9 04:B3B9: E4        .byte $E4   ; 
- D 1 - I - 0x0133CA 04:B3BA: 00        .byte $00   ; 
- D 1 - I - 0x0133CB 04:B3BB: 00        .byte $00   ; 
- D 1 - I - 0x0133CC 04:B3BC: E1        .byte $E1   ; 
- D 1 - I - 0x0133CD 04:B3BD: 2C        .byte $2C   ; 
- D 1 - I - 0x0133CE 04:B3BE: 00        .byte $00   ; 
- D 1 - I - 0x0133CF 04:B3BF: 00        .byte $00   ; 
- D 1 - I - 0x0133D0 04:B3C0: 00        .byte $00   ; 
- D 1 - I - 0x0133D1 04:B3C1: 00        .byte $00   ; 
- D 1 - I - 0x0133D2 04:B3C2: 00        .byte $00   ; 
- D 1 - I - 0x0133D3 04:B3C3: 00        .byte $00   ; 
- D 1 - I - 0x0133D4 04:B3C4: 00        .byte $00   ; 
- D 1 - I - 0x0133D5 04:B3C5: 00        .byte $00   ; 
- D 1 - I - 0x0133D6 04:B3C6: E5        .byte $E5   ; 
- D 1 - I - 0x0133D7 04:B3C7: E3        .byte $E3   ; 
- D 1 - I - 0x0133D8 04:B3C8: 00        .byte $00   ; 
- D 1 - I - 0x0133D9 04:B3C9: 00        .byte $00   ; 
- D 1 - I - 0x0133DA 04:B3CA: 2D        .byte $2D   ; 
- D 1 - I - 0x0133DB 04:B3CB: 12        .byte $12   ; 
- D 1 - I - 0x0133DC 04:B3CC: 2F        .byte $2F   ; 
- D 1 - I - 0x0133DD 04:B3CD: 31        .byte $31   ; 
- D 1 - I - 0x0133DE 04:B3CE: 12        .byte $12   ; 
- D 1 - I - 0x0133DF 04:B3CF: 2F        .byte $2F   ; 
- D 1 - I - 0x0133E0 04:B3D0: 31        .byte $31   ; 
- D 1 - I - 0x0133E1 04:B3D1: 28        .byte $28   ; 
- D 1 - I - 0x0133E2 04:B3D2: 23        .byte $23   ; 
- D 1 - I - 0x0133E3 04:B3D3: 28        .byte $28   ; 
- D 1 - I - 0x0133E4 04:B3D4: 28        .byte $28   ; 
- D 1 - I - 0x0133E5 04:B3D5: 29        .byte $29   ; 
- D 1 - I - 0x0133E6 04:B3D6: 00        .byte $00   ; 
- D 1 - I - 0x0133E7 04:B3D7: 13        .byte $13   ; 
- D 1 - I - 0x0133E8 04:B3D8: 29        .byte $29   ; 
- D 1 - I - 0x0133E9 04:B3D9: 0F        .byte $0F   ; 
- D 1 - I - 0x0133EA 04:B3DA: 10        .byte $10   ; 
- D 1 - I - 0x0133EB 04:B3DB: 2A        .byte $2A   ; 
- D 1 - I - 0x0133EC 04:B3DC: 14        .byte $14   ; 
- D 1 - I - 0x0133ED 04:B3DD: FA        .byte $FA   ; 
- D 1 - I - 0x0133EE 04:B3DE: 00        .byte $00   ; 
- D 1 - I - 0x0133EF 04:B3DF: 00        .byte $00   ; 
- D 1 - I - 0x0133F0 04:B3E0: 00        .byte $00   ; 
- D 1 - I - 0x0133F1 04:B3E1: FC        .byte $FC   ; 
- D 1 - I - 0x0133F2 04:B3E2: 00        .byte $00   ; 
- D 1 - I - 0x0133F3 04:B3E3: 00        .byte $00   ; 
- D 1 - I - 0x0133F4 04:B3E4: 00        .byte $00   ; 
- D 1 - I - 0x0133F5 04:B3E5: 00        .byte $00   ; 
- D 1 - I - 0x0133F6 04:B3E6: 2D        .byte $2D   ; 
- D 1 - I - 0x0133F7 04:B3E7: 00        .byte $00   ; 
- D 1 - I - 0x0133F8 04:B3E8: 00        .byte $00   ; 
- D 1 - I - 0x0133F9 04:B3E9: 00        .byte $00   ; 
- D 1 - I - 0x0133FA 04:B3EA: 00        .byte $00   ; 
- D 1 - I - 0x0133FB 04:B3EB: E2        .byte $E2   ; 
- D 1 - I - 0x0133FC 04:B3EC: E4        .byte $E4   ; 
- D 1 - I - 0x0133FD 04:B3ED: E6        .byte $E6   ; 
- D 1 - I - 0x0133FE 04:B3EE: EE        .byte $EE   ; 
- D 1 - I - 0x0133FF 04:B3EF: F0        .byte $F0   ; 
- D 1 - I - 0x013400 04:B3F0: F2        .byte $F2   ; 
- D 1 - I - 0x013401 04:B3F1: E8        .byte $E8   ; 
- D 1 - I - 0x013402 04:B3F2: 00        .byte $00   ; 
- D 1 - I - 0x013403 04:B3F3: F8        .byte $F8   ; 
- D 1 - I - 0x013404 04:B3F4: F6        .byte $F6   ; 
- D 1 - I - 0x013405 04:B3F5: EE        .byte $EE   ; 
- D 1 - I - 0x013406 04:B3F6: 00        .byte $00   ; 
- D 1 - I - 0x013407 04:B3F7: 00        .byte $00   ; 
- D 1 - I - 0x013408 04:B3F8: 00        .byte $00   ; 
- D 1 - I - 0x013409 04:B3F9: 00        .byte $00   ; 
- D 1 - I - 0x01340A 04:B3FA: E7        .byte $E7   ; 
- D 1 - I - 0x01340B 04:B3FB: E5        .byte $E5   ; 
- D 1 - I - 0x01340C 04:B3FC: E3        .byte $E3   ; 
- D 1 - I - 0x01340D 04:B3FD: 00        .byte $00   ; 
- D 1 - I - 0x01340E 04:B3FE: E9        .byte $E9   ; 
- D 1 - I - 0x01340F 04:B3FF: F3        .byte $F3   ; 
- D 1 - I - 0x013410 04:B400: F1        .byte $F1   ; 
- D 1 - I - 0x013411 04:B401: EF        .byte $EF   ; 
- D 1 - I - 0x013412 04:B402: EF        .byte $EF   ; 
- D 1 - I - 0x013413 04:B403: F7        .byte $F7   ; 
- D 1 - I - 0x013414 04:B404: 1C        .byte $1C   ; 
- D 1 - I - 0x013415 04:B405: 00        .byte $00   ; 
- D 1 - I - 0x013416 04:B406: 00        .byte $00   ; 
- D 1 - I - 0x013417 04:B407: 00        .byte $00   ; 
- D 1 - I - 0x013418 04:B408: 00        .byte $00   ; 
- D 1 - I - 0x013419 04:B409: 00        .byte $00   ; 
- D 1 - I - 0x01341A 04:B40A: 15        .byte $15   ; 
- D 1 - I - 0x01341B 04:B40B: FB        .byte $FB   ; 
- D 1 - I - 0x01341C 04:B40C: 0F        .byte $0F   ; 
- D 1 - I - 0x01341D 04:B40D: 00        .byte $00   ; 
- D 1 - I - 0x01341E 04:B40E: FE        .byte $FE   ; 
- D 1 - I - 0x01341F 04:B40F: 00        .byte $00   ; 
- D 1 - I - 0x013420 04:B410: 00        .byte $00   ; 
- D 1 - I - 0x013421 04:B411: 00        .byte $00   ; 
- D 1 - I - 0x013422 04:B412: 00        .byte $00   ; 
- D 1 - I - 0x013423 04:B413: 00        .byte $00   ; 
- D 1 - I - 0x013424 04:B414: 00        .byte $00   ; 
- D 1 - I - 0x013425 04:B415: 00        .byte $00   ; 
- D 1 - I - 0x013426 04:B416: 00        .byte $00   ; 
- D 1 - I - 0x013427 04:B417: 00        .byte $00   ; 
- D 1 - I - 0x013428 04:B418: 00        .byte $00   ; 
- D 1 - I - 0x013429 04:B419: 2B        .byte $2B   ; 
- D 1 - I - 0x01342A 04:B41A: 2C        .byte $2C   ; 
- D 1 - I - 0x01342B 04:B41B: 2D        .byte $2D   ; 
- D 1 - I - 0x01342C 04:B41C: 29        .byte $29   ; 
- D 1 - I - 0x01342D 04:B41D: 0F        .byte $0F   ; 
- D 1 - I - 0x01342E 04:B41E: 28        .byte $28   ; 
- D 1 - I - 0x01342F 04:B41F: 2C        .byte $2C   ; 
- D 1 - I - 0x013430 04:B420: 2D        .byte $2D   ; 
- D 1 - I - 0x013431 04:B421: 00        .byte $00   ; 
- D 1 - I - 0x013432 04:B422: 2B        .byte $2B   ; 
- D 1 - I - 0x013433 04:B423: 28        .byte $28   ; 
- D 1 - I - 0x013434 04:B424: 2C        .byte $2C   ; 
- D 1 - I - 0x013435 04:B425: 2D        .byte $2D   ; 
- D 1 - I - 0x013436 04:B426: 2E        .byte $2E   ; 
- D 1 - I - 0x013437 04:B427: 2B        .byte $2B   ; 
- D 1 - I - 0x013438 04:B428: 28        .byte $28   ; 
- D 1 - I - 0x013439 04:B429: 2C        .byte $2C   ; 
- D 1 - I - 0x01343A 04:B42A: E8        .byte $E8   ; 
- D 1 - I - 0x01343B 04:B42B: EA        .byte $EA   ; 
- D 1 - I - 0x01343C 04:B42C: EC        .byte $EC   ; 
- D 1 - I - 0x01343D 04:B42D: EC        .byte $EC   ; 
- D 1 - I - 0x01343E 04:B42E: EA        .byte $EA   ; 
- D 1 - I - 0x01343F 04:B42F: EC        .byte $EC   ; 
- D 1 - I - 0x013440 04:B430: ED        .byte $ED   ; 
- D 1 - I - 0x013441 04:B431: ED        .byte $ED   ; 
- D 1 - I - 0x013442 04:B432: F0        .byte $F0   ; 
- D 1 - I - 0x013443 04:B433: F4        .byte $F4   ; 
- D 1 - I - 0x013444 04:B434: DE        .byte $DE   ; 
- D 1 - I - 0x013445 04:B435: DE        .byte $DE   ; 
- D 1 - I - 0x013446 04:B436: F8        .byte $F8   ; 
- D 1 - I - 0x013447 04:B437: F6        .byte $F6   ; 
- D 1 - I - 0x013448 04:B438: DF        .byte $DF   ; 
- D 1 - I - 0x013449 04:B439: DF        .byte $DF   ; 
- D 1 - I - 0x01344A 04:B43A: EC        .byte $EC   ; 
- D 1 - I - 0x01344B 04:B43B: EC        .byte $EC   ; 
- D 1 - I - 0x01344C 04:B43C: EB        .byte $EB   ; 
- D 1 - I - 0x01344D 04:B43D: E9        .byte $E9   ; 
- D 1 - I - 0x01344E 04:B43E: ED        .byte $ED   ; 
- D 1 - I - 0x01344F 04:B43F: ED        .byte $ED   ; 
- D 1 - I - 0x013450 04:B440: EC        .byte $EC   ; 
- D 1 - I - 0x013451 04:B441: EB        .byte $EB   ; 
- D 1 - I - 0x013452 04:B442: DE        .byte $DE   ; 
- D 1 - I - 0x013453 04:B443: DE        .byte $DE   ; 
- D 1 - I - 0x013454 04:B444: F5        .byte $F5   ; 
- D 1 - I - 0x013455 04:B445: F1        .byte $F1   ; 
- D 1 - I - 0x013456 04:B446: DF        .byte $DF   ; 
- D 1 - I - 0x013457 04:B447: DF        .byte $DF   ; 
- D 1 - I - 0x013458 04:B448: F7        .byte $F7   ; 
- D 1 - I - 0x013459 04:B449: 1C        .byte $1C   ; 
- D 1 - I - 0x01345A 04:B44A: 2A        .byte $2A   ; 
- D 1 - I - 0x01345B 04:B44B: 29        .byte $29   ; 
- D 1 - I - 0x01345C 04:B44C: 2B        .byte $2B   ; 
- D 1 - I - 0x01345D 04:B44D: 32        .byte $32   ; 
- D 1 - I - 0x01345E 04:B44E: 00        .byte $00   ; 
- D 1 - I - 0x01345F 04:B44F: 2B        .byte $2B   ; 
- D 1 - I - 0x013460 04:B450: 32        .byte $32   ; 
- D 1 - I - 0x013461 04:B451: 28        .byte $28   ; 
- D 1 - I - 0x013462 04:B452: 2B        .byte $2B   ; 
- D 1 - I - 0x013463 04:B453: 32        .byte $32   ; 
- D 1 - I - 0x013464 04:B454: 28        .byte $28   ; 
- D 1 - I - 0x013465 04:B455: 2D        .byte $2D   ; 
- D 1 - I - 0x013466 04:B456: 32        .byte $32   ; 
- D 1 - I - 0x013467 04:B457: 28        .byte $28   ; 
- D 1 - I - 0x013468 04:B458: 2D        .byte $2D   ; 
- D 1 - I - 0x013469 04:B459: 12        .byte $12   ; 
- D 1 - I - 0x01346A 04:B45A: 25        .byte $25   ; 
- D 1 - I - 0x01346B 04:B45B: 2E        .byte $2E   ; 
- D 1 - I - 0x01346C 04:B45C: 2B        .byte $2B   ; 
- D 1 - I - 0x01346D 04:B45D: 28        .byte $28   ; 
- D 1 - I - 0x01346E 04:B45E: 30        .byte $30   ; 
- D 1 - I - 0x01346F 04:B45F: 11        .byte $11   ; 
- D 1 - I - 0x013470 04:B460: 2E        .byte $2E   ; 
- D 1 - I - 0x013471 04:B461: 2B        .byte $2B   ; 
- D 1 - I - 0x013472 04:B462: 28        .byte $28   ; 
- D 1 - I - 0x013473 04:B463: 30        .byte $30   ; 
- D 1 - I - 0x013474 04:B464: 25        .byte $25   ; 
- D 1 - I - 0x013475 04:B465: 2E        .byte $2E   ; 
- D 1 - I - 0x013476 04:B466: 29        .byte $29   ; 
- D 1 - I - 0x013477 04:B467: 28        .byte $28   ; 
- D 1 - I - 0x013478 04:B468: 30        .byte $30   ; 
- D 1 - I - 0x013479 04:B469: 00        .byte $00   ; 
- D 1 - I - 0x01347A 04:B46A: 2C        .byte $2C   ; 
- D 1 - I - 0x01347B 04:B46B: 2D        .byte $2D   ; 
- D 1 - I - 0x01347C 04:B46C: 10        .byte $10   ; 
- D 1 - I - 0x01347D 04:B46D: 00        .byte $00   ; 
- D 1 - I - 0x01347E 04:B46E: 28        .byte $28   ; 
- D 1 - I - 0x01347F 04:B46F: 2C        .byte $2C   ; 
- D 1 - I - 0x013480 04:B470: 2D        .byte $2D   ; 
- D 1 - I - 0x013481 04:B471: 00        .byte $00   ; 
- D 1 - I - 0x013482 04:B472: 10        .byte $10   ; 
- D 1 - I - 0x013483 04:B473: 00        .byte $00   ; 
- D 1 - I - 0x013484 04:B474: 12        .byte $12   ; 
- D 1 - I - 0x013485 04:B475: 2F        .byte $2F   ; 
- D 1 - I - 0x013486 04:B476: 00        .byte $00   ; 
- D 1 - I - 0x013487 04:B477: 00        .byte $00   ; 
- D 1 - I - 0x013488 04:B478: 00        .byte $00   ; 
- D 1 - I - 0x013489 04:B479: 31        .byte $31   ; 
- D 1 - I - 0x01348A 04:B47A: 10        .byte $10   ; 
- D 1 - I - 0x01348B 04:B47B: 00        .byte $00   ; 
- D 1 - I - 0x01348C 04:B47C: 2B        .byte $2B   ; 
- D 1 - I - 0x01348D 04:B47D: 32        .byte $32   ; 
- D 1 - I - 0x01348E 04:B47E: 00        .byte $00   ; 
- D 1 - I - 0x01348F 04:B47F: 2B        .byte $2B   ; 
- D 1 - I - 0x013490 04:B480: 32        .byte $32   ; 
- D 1 - I - 0x013491 04:B481: 28        .byte $28   ; 
- D 1 - I - 0x013492 04:B482: 11        .byte $11   ; 
- D 1 - I - 0x013493 04:B483: 2E        .byte $2E   ; 
- D 1 - I - 0x013494 04:B484: 10        .byte $10   ; 
- D 1 - I - 0x013495 04:B485: 00        .byte $00   ; 
- D 1 - I - 0x013496 04:B486: 30        .byte $30   ; 
- D 1 - I - 0x013497 04:B487: 00        .byte $00   ; 
- D 1 - I - 0x013498 04:B488: 00        .byte $00   ; 
- D 1 - I - 0x013499 04:B489: 00        .byte $00   ; 
- D 1 - I - 0x01349A 04:B48A: 28        .byte $28   ; 
- D 1 - I - 0x01349B 04:B48B: 2D        .byte $2D   ; 
- D 1 - I - 0x01349C 04:B48C: 27        .byte $27   ; 
- D 1 - I - 0x01349D 04:B48D: 2F        .byte $2F   ; 
- D 1 - I - 0x01349E 04:B48E: 2D        .byte $2D   ; 
- D 1 - I - 0x01349F 04:B48F: 12        .byte $12   ; 
- D 1 - I - 0x0134A0 04:B490: 2F        .byte $2F   ; 
- D 1 - I - 0x0134A1 04:B491: 31        .byte $31   ; 
- D 1 - I - 0x0134A2 04:B492: 27        .byte $27   ; 
- D 1 - I - 0x0134A3 04:B493: 2F        .byte $2F   ; 
- D 1 - I - 0x0134A4 04:B494: 31        .byte $31   ; 
- D 1 - I - 0x0134A5 04:B495: 28        .byte $28   ; 
- D 1 - I - 0x0134A6 04:B496: 00        .byte $00   ; 
- D 1 - I - 0x0134A7 04:B497: 31        .byte $31   ; 
- D 1 - I - 0x0134A8 04:B498: 28        .byte $28   ; 
- D 1 - I - 0x0134A9 04:B499: 29        .byte $29   ; 
- D 1 - I - 0x0134AA 04:B49A: 2A        .byte $2A   ; 
- D 1 - I - 0x0134AB 04:B49B: 29        .byte $29   ; 
- D 1 - I - 0x0134AC 04:B49C: 13        .byte $13   ; 
- D 1 - I - 0x0134AD 04:B49D: F9        .byte $F9   ; 
- D 1 - I - 0x0134AE 04:B49E: 00        .byte $00   ; 
- D 1 - I - 0x0134AF 04:B49F: 2A        .byte $2A   ; 
- D 1 - I - 0x0134B0 04:B4A0: 13        .byte $13   ; 
- D 1 - I - 0x0134B1 04:B4A1: F9        .byte $F9   ; 
- D 1 - I - 0x0134B2 04:B4A2: 24        .byte $24   ; 
- D 1 - I - 0x0134B3 04:B4A3: A2        .byte $A2   ; 
- D 1 - I - 0x0134B4 04:B4A4: 14        .byte $14   ; 
- D 1 - I - 0x0134B5 04:B4A5: FA        .byte $FA   ; 
- D 1 - I - 0x0134B6 04:B4A6: A4        .byte $A4   ; 
- D 1 - I - 0x0134B7 04:B4A7: A5        .byte $A5   ; 
- D 1 - I - 0x0134B8 04:B4A8: A6        .byte $A6   ; 
- D 1 - I - 0x0134B9 04:B4A9: FC        .byte $FC   ; 
- D 1 - I - 0x0134BA 04:B4AA: 10        .byte $10   ; 
- D 1 - I - 0x0134BB 04:B4AB: 00        .byte $00   ; 
- D 1 - I - 0x0134BC 04:B4AC: 10        .byte $10   ; 
- D 1 - I - 0x0134BD 04:B4AD: 13        .byte $13   ; 
- D 1 - I - 0x0134BE 04:B4AE: 16        .byte $16   ; 
- D 1 - I - 0x0134BF 04:B4AF: 00        .byte $00   ; 
- D 1 - I - 0x0134C0 04:B4B0: 00        .byte $00   ; 
- D 1 - I - 0x0134C1 04:B4B1: 13        .byte $13   ; 
- D 1 - I - 0x0134C2 04:B4B2: 16        .byte $16   ; 
- D 1 - I - 0x0134C3 04:B4B3: FF        .byte $FF   ; 
- D 1 - I - 0x0134C4 04:B4B4: 15        .byte $15   ; 
- D 1 - I - 0x0134C5 04:B4B5: FB        .byte $FB   ; 
- D 1 - I - 0x0134C6 04:B4B6: FD        .byte $FD   ; 
- D 1 - I - 0x0134C7 04:B4B7: FD        .byte $FD   ; 
- D 1 - I - 0x0134C8 04:B4B8: FE        .byte $FE   ; 
- D 1 - I - 0x0134C9 04:B4B9: 00        .byte $00   ; 
- D 1 - I - 0x0134CA 04:B4BA: 13        .byte $13   ; 
- D 1 - I - 0x0134CB 04:B4BB: F9        .byte $F9   ; 
- D 1 - I - 0x0134CC 04:B4BC: 10        .byte $10   ; 
- D 1 - I - 0x0134CD 04:B4BD: 00        .byte $00   ; 
- D 1 - I - 0x0134CE 04:B4BE: 13        .byte $13   ; 
- D 1 - I - 0x0134CF 04:B4BF: F9        .byte $F9   ; 
- D 1 - I - 0x0134D0 04:B4C0: 16        .byte $16   ; 
- D 1 - I - 0x0134D1 04:B4C1: 00        .byte $00   ; 
- D 1 - I - 0x0134D2 04:B4C2: 14        .byte $14   ; 
- D 1 - I - 0x0134D3 04:B4C3: FA        .byte $FA   ; 
- D 1 - I - 0x0134D4 04:B4C4: 16        .byte $16   ; 
- D 1 - I - 0x0134D5 04:B4C5: FF        .byte $FF   ; 
- D 1 - I - 0x0134D6 04:B4C6: 00        .byte $00   ; 
- D 1 - I - 0x0134D7 04:B4C7: FC        .byte $FC   ; 
- D 1 - I - 0x0134D8 04:B4C8: FD        .byte $FD   ; 
- D 1 - I - 0x0134D9 04:B4C9: FD        .byte $FD   ; 
- D 1 - I - 0x0134DA 04:B4CA: 10        .byte $10   ; 
- D 1 - I - 0x0134DB 04:B4CB: 13        .byte $13   ; 
- D 1 - I - 0x0134DC 04:B4CC: 29        .byte $29   ; 
- D 1 - I - 0x0134DD 04:B4CD: 0F        .byte $0F   ; 
- D 1 - I - 0x0134DE 04:B4CE: 00        .byte $00   ; 
- D 1 - I - 0x0134DF 04:B4CF: 13        .byte $13   ; 
- D 1 - I - 0x0134E0 04:B4D0: 0F        .byte $0F   ; 
- D 1 - I - 0x0134E1 04:B4D1: 00        .byte $00   ; 
- D 1 - I - 0x0134E2 04:B4D2: 15        .byte $15   ; 
- D 1 - I - 0x0134E3 04:B4D3: FB        .byte $FB   ; 
- D 1 - I - 0x0134E4 04:B4D4: 26        .byte $26   ; 
- D 1 - I - 0x0134E5 04:B4D5: AF        .byte $AF   ; 
- D 1 - I - 0x0134E6 04:B4D6: FE        .byte $FE   ; 
- D 1 - I - 0x0134E7 04:B4D7: B1        .byte $B1   ; 
- D 1 - I - 0x0134E8 04:B4D8: B2        .byte $B2   ; 
- D 1 - I - 0x0134E9 04:B4D9: B3        .byte $B3   ; 
- D 1 - I - 0x0134EA 04:B4DA: 0F        .byte $0F   ; 
- D 1 - I - 0x0134EB 04:B4DB: 7A        .byte $7A   ; 
- D 1 - I - 0x0134EC 04:B4DC: 10        .byte $10   ; 
- D 1 - I - 0x0134ED 04:B4DD: 19        .byte $19   ; 
- D 1 - I - 0x0134EE 04:B4DE: 7E        .byte $7E   ; 
- D 1 - I - 0x0134EF 04:B4DF: 78        .byte $78   ; 
- D 1 - I - 0x0134F0 04:B4E0: 7B        .byte $7B   ; 
- D 1 - I - 0x0134F1 04:B4E1: 1A        .byte $1A   ; 
- D 1 - I - 0x0134F2 04:B4E2: 00        .byte $00   ; 
- D 1 - I - 0x0134F3 04:B4E3: 7D        .byte $7D   ; 
- D 1 - I - 0x0134F4 04:B4E4: 11        .byte $11   ; 
- D 1 - I - 0x0134F5 04:B4E5: 72        .byte $72   ; 
- D 1 - I - 0x0134F6 04:B4E6: 7E        .byte $7E   ; 
- D 1 - I - 0x0134F7 04:B4E7: 75        .byte $75   ; 
- D 1 - I - 0x0134F8 04:B4E8: 72        .byte $72   ; 
- D 1 - I - 0x0134F9 04:B4E9: 19        .byte $19   ; 
- D 1 - I - 0x0134FA 04:B4EA: 14        .byte $14   ; 
- D 1 - I - 0x0134FB 04:B4EB: 0C        .byte $0C   ; 
- D 1 - I - 0x0134FC 04:B4EC: 0A        .byte $0A   ; 
- D 1 - I - 0x0134FD 04:B4ED: 47        .byte $47   ; 
- D 1 - I - 0x0134FE 04:B4EE: 0C        .byte $0C   ; 
- D 1 - I - 0x0134FF 04:B4EF: 09        .byte $09   ; 
- D 1 - I - 0x013500 04:B4F0: 0B        .byte $0B   ; 
- D 1 - I - 0x013501 04:B4F1: 0C        .byte $0C   ; 
- D 1 - I - 0x013502 04:B4F2: 15        .byte $15   ; 
- D 1 - I - 0x013503 04:B4F3: 47        .byte $47   ; 
- D 1 - I - 0x013504 04:B4F4: 0B        .byte $0B   ; 
- D 1 - I - 0x013505 04:B4F5: 0C        .byte $0C   ; 
- D 1 - I - 0x013506 04:B4F6: 13        .byte $13   ; 
- D 1 - I - 0x013507 04:B4F7: 0C        .byte $0C   ; 
- D 1 - I - 0x013508 04:B4F8: 0A        .byte $0A   ; 
- D 1 - I - 0x013509 04:B4F9: 46        .byte $46   ; 
- D 1 - I - 0x01350A 04:B4FA: 0B        .byte $0B   ; 
- D 1 - I - 0x01350B 04:B4FB: 0C        .byte $0C   ; 
- D 1 - I - 0x01350C 04:B4FC: 0A        .byte $0A   ; 
- D 1 - I - 0x01350D 04:B4FD: 77        .byte $77   ; 
- D 1 - I - 0x01350E 04:B4FE: 0A        .byte $0A   ; 
- D 1 - I - 0x01350F 04:B4FF: 09        .byte $09   ; 
- D 1 - I - 0x013510 04:B500: 0B        .byte $0B   ; 
- D 1 - I - 0x013511 04:B501: 0C        .byte $0C   ; 
- D 1 - I - 0x013512 04:B502: 0A        .byte $0A   ; 
- D 1 - I - 0x013513 04:B503: 47        .byte $47   ; 
- D 1 - I - 0x013514 04:B504: 0B        .byte $0B   ; 
- D 1 - I - 0x013515 04:B505: 16        .byte $16   ; 
- D 1 - I - 0x013516 04:B506: 0B        .byte $0B   ; 
- D 1 - I - 0x013517 04:B507: 0C        .byte $0C   ; 
- D 1 - I - 0x013518 04:B508: 47        .byte $47   ; 
- D 1 - I - 0x013519 04:B509: 70        .byte $70   ; 
- D 1 - I - 0x01351A 04:B50A: 19        .byte $19   ; 
- D 1 - I - 0x01351B 04:B50B: 74        .byte $74   ; 
- D 1 - I - 0x01351C 04:B50C: 17        .byte $17   ; 
- D 1 - I - 0x01351D 04:B50D: 76        .byte $76   ; 
- D 1 - I - 0x01351E 04:B50E: 1A        .byte $1A   ; 
- D 1 - I - 0x01351F 04:B50F: 7C        .byte $7C   ; 
- D 1 - I - 0x013520 04:B510: 79        .byte $79   ; 
- D 1 - I - 0x013521 04:B511: 7F        .byte $7F   ; 
- D 1 - I - 0x013522 04:B512: 12        .byte $12   ; 
- D 1 - I - 0x013523 04:B513: 73        .byte $73   ; 
- D 1 - I - 0x013524 04:B514: 18        .byte $18   ; 
- D 1 - I - 0x013525 04:B515: 00        .byte $00   ; 
- D 1 - I - 0x013526 04:B516: 19        .byte $19   ; 
- D 1 - I - 0x013527 04:B517: 12        .byte $12   ; 
- D 1 - I - 0x013528 04:B518: 71        .byte $71   ; 
- D 1 - I - 0x013529 04:B519: 7F        .byte $7F   ; 
- D 1 - I - 0x01352A 04:B51A: 0C        .byte $0C   ; 
- D 1 - I - 0x01352B 04:B51B: 1A        .byte $1A   ; 
- D 1 - I - 0x01352C 04:B51C: 13        .byte $13   ; 
- D 1 - I - 0x01352D 04:B51D: 0C        .byte $0C   ; 
- D 1 - I - 0x01352E 04:B51E: 0C        .byte $0C   ; 
- D 1 - I - 0x01352F 04:B51F: 12        .byte $12   ; 
- D 1 - I - 0x013530 04:B520: 15        .byte $15   ; 
- D 1 - I - 0x013531 04:B521: 0C        .byte $0C   ; 
- D 1 - I - 0x013532 04:B522: 13        .byte $13   ; 
- D 1 - I - 0x013533 04:B523: 15        .byte $15   ; 
- D 1 - I - 0x013534 04:B524: 0B        .byte $0B   ; 
- D 1 - I - 0x013535 04:B525: 0C        .byte $0C   ; 
- D 1 - I - 0x013536 04:B526: 19        .byte $19   ; 
- D 1 - I - 0x013537 04:B527: 0C        .byte $0C   ; 
- D 1 - I - 0x013538 04:B528: 0A        .byte $0A   ; 
- D 1 - I - 0x013539 04:B529: 46        .byte $46   ; 
- D 1 - I - 0x01353A 04:B52A: 0B        .byte $0B   ; 
- D 1 - I - 0x01353B 04:B52B: 70        .byte $70   ; 
- D 1 - I - 0x01353C 04:B52C: 1A        .byte $1A   ; 
- D 1 - I - 0x01353D 04:B52D: 77        .byte $77   ; 
- D 1 - I - 0x01353E 04:B52E: 0A        .byte $0A   ; 
- D 1 - I - 0x01353F 04:B52F: 46        .byte $46   ; 
- D 1 - I - 0x013540 04:B530: 72        .byte $72   ; 
- D 1 - I - 0x013541 04:B531: 0C        .byte $0C   ; 
- D 1 - I - 0x013542 04:B532: 0A        .byte $0A   ; 
- D 1 - I - 0x013543 04:B533: 47        .byte $47   ; 
- D 1 - I - 0x013544 04:B534: 16        .byte $16   ; 
- D 1 - I - 0x013545 04:B535: 70        .byte $70   ; 
- D 1 - I - 0x013546 04:B536: 0B        .byte $0B   ; 
- D 1 - I - 0x013547 04:B537: 0C        .byte $0C   ; 
- D 1 - I - 0x013548 04:B538: 47        .byte $47   ; 
- D 1 - I - 0x013549 04:B539: 70        .byte $70   ; 
- D 1 - I - 0x01354A 04:B53A: 5B        .byte $5B   ; 
- D 1 - I - 0x01354B 04:B53B: D9        .byte $D9   ; 
- D 1 - I - 0x01354C 04:B53C: 30        .byte $30   ; 
- D 1 - I - 0x01354D 04:B53D: DA        .byte $DA   ; 
- D 1 - I - 0x01354E 04:B53E: CC        .byte $CC   ; 
- D 1 - I - 0x01354F 04:B53F: CD        .byte $CD   ; 
- D 1 - I - 0x013550 04:B540: CE        .byte $CE   ; 
- D 1 - I - 0x013551 04:B541: 00        .byte $00   ; 
- D 1 - I - 0x013552 04:B542: 5A        .byte $5A   ; 
- D 1 - I - 0x013553 04:B543: D0        .byte $D0   ; 
- D 1 - I - 0x013554 04:B544: 27        .byte $27   ; 
- D 1 - I - 0x013555 04:B545: 00        .byte $00   ; 
- D 1 - I - 0x013556 04:B546: D1        .byte $D1   ; 
- D 1 - I - 0x013557 04:B547: D2        .byte $D2   ; 
- D 1 - I - 0x013558 04:B548: D4        .byte $D4   ; 
- D 1 - I - 0x013559 04:B549: D5        .byte $D5   ; 
- D 1 - I - 0x01355A 04:B54A: 2E        .byte $2E   ; 
- D 1 - I - 0x01355B 04:B54B: FC        .byte $FC   ; 
- D 1 - I - 0x01355C 04:B54C: 61        .byte $61   ; 
- D 1 - I - 0x01355D 04:B54D: FD        .byte $FD   ; 
- D 1 - I - 0x01355E 04:B54E: 00        .byte $00   ; 
- D 1 - I - 0x01355F 04:B54F: F1        .byte $F1   ; 
- D 1 - I - 0x013560 04:B550: F2        .byte $F2   ; 
- D 1 - I - 0x013561 04:B551: F3        .byte $F3   ; 
- D 1 - I - 0x013562 04:B552: 32        .byte $32   ; 
- D 1 - I - 0x013563 04:B553: F4        .byte $F4   ; 
- D 1 - I - 0x013564 04:B554: 60        .byte $60   ; 
- D 1 - I - 0x013565 04:B555: F5        .byte $F5   ; 
- D 1 - I - 0x013566 04:B556: F8        .byte $F8   ; 
- D 1 - I - 0x013567 04:B557: F9        .byte $F9   ; 
- D 1 - I - 0x013568 04:B558: FA        .byte $FA   ; 
- D 1 - I - 0x013569 04:B559: FB        .byte $FB   ; 
- D 1 - I - 0x01356A 04:B55A: 59        .byte $59   ; 
- D 1 - I - 0x01356B 04:B55B: C9        .byte $C9   ; 
- D 1 - I - 0x01356C 04:B55C: 25        .byte $25   ; 
- D 1 - I - 0x01356D 04:B55D: CA        .byte $CA   ; 
- D 1 - I - 0x01356E 04:B55E: CC        .byte $CC   ; 
- D 1 - I - 0x01356F 04:B55F: CD        .byte $CD   ; 
- D 1 - I - 0x013570 04:B560: CE        .byte $CE   ; 
- D 1 - I - 0x013571 04:B561: 00        .byte $00   ; 
- D 1 - I - 0x013572 04:B562: 5A        .byte $5A   ; 
- D 1 - I - 0x013573 04:B563: D0        .byte $D0   ; 
- D 1 - I - 0x013574 04:B564: 27        .byte $27   ; 
- D 1 - I - 0x013575 04:B565: 00        .byte $00   ; 
- D 1 - I - 0x013576 04:B566: D1        .byte $D1   ; 
- D 1 - I - 0x013577 04:B567: D2        .byte $D2   ; 
- D 1 - I - 0x013578 04:B568: D4        .byte $D4   ; 
- D 1 - I - 0x013579 04:B569: D5        .byte $D5   ; 
- D 1 - I - 0x01357A 04:B56A: 26        .byte $26   ; 
- D 1 - I - 0x01357B 04:B56B: CB        .byte $CB   ; 
- D 1 - I - 0x01357C 04:B56C: 1D        .byte $1D   ; 
- D 1 - I - 0x01357D 04:B56D: 82        .byte $82   ; 
- D 1 - I - 0x01357E 04:B56E: 00        .byte $00   ; 
- D 1 - I - 0x01357F 04:B56F: CF        .byte $CF   ; 
- D 1 - I - 0x013580 04:B570: 00        .byte $00   ; 
- D 1 - I - 0x013581 04:B571: 86        .byte $86   ; 
- D 1 - I - 0x013582 04:B572: 32        .byte $32   ; 
- D 1 - I - 0x013583 04:B573: 00        .byte $00   ; 
- D 1 - I - 0x013584 04:B574: 1E        .byte $1E   ; 
- D 1 - I - 0x013585 04:B575: 84        .byte $84   ; 
- D 1 - I - 0x013586 04:B576: D6        .byte $D6   ; 
- D 1 - I - 0x013587 04:B577: D7        .byte $D7   ; 
- D 1 - I - 0x013588 04:B578: 87        .byte $87   ; 
- D 1 - I - 0x013589 04:B579: 06        .byte $06   ; 
- D 1 - I - 0x01358A 04:B57A: 02        .byte $02   ; 
- D 1 - I - 0x01358B 04:B57B: 67        .byte $67   ; 
- D 1 - I - 0x01358C 04:B57C: 2C        .byte $2C   ; 
- D 1 - I - 0x01358D 04:B57D: ED        .byte $ED   ; 
- D 1 - I - 0x01358E 04:B57E: 06        .byte $06   ; 
- D 1 - I - 0x01358F 04:B57F: 82        .byte $82   ; 
- D 1 - I - 0x013590 04:B580: F0        .byte $F0   ; 
- D 1 - I - 0x013591 04:B581: 00        .byte $00   ; 
- D 1 - I - 0x013592 04:B582: 03        .byte $03   ; 
- D 1 - I - 0x013593 04:B583: 05        .byte $05   ; 
- D 1 - I - 0x013594 04:B584: 32        .byte $32   ; 
- D 1 - I - 0x013595 04:B585: 00        .byte $00   ; 
- D 1 - I - 0x013596 04:B586: 82        .byte $82   ; 
- D 1 - I - 0x013597 04:B587: 00        .byte $00   ; 
- D 1 - I - 0x013598 04:B588: F6        .byte $F6   ; 
- D 1 - I - 0x013599 04:B589: F7        .byte $F7   ; 
- D 1 - I - 0x01359A 04:B58A: 2D        .byte $2D   ; 
- D 1 - I - 0x01359B 04:B58B: EE        .byte $EE   ; 
- D 1 - I - 0x01359C 04:B58C: 5F        .byte $5F   ; 
- D 1 - I - 0x01359D 04:B58D: EF        .byte $EF   ; 
- D 1 - I - 0x01359E 04:B58E: 00        .byte $00   ; 
- D 1 - I - 0x01359F 04:B58F: F1        .byte $F1   ; 
- D 1 - I - 0x0135A0 04:B590: F2        .byte $F2   ; 
- D 1 - I - 0x0135A1 04:B591: F3        .byte $F3   ; 
- D 1 - I - 0x0135A2 04:B592: 32        .byte $32   ; 
- D 1 - I - 0x0135A3 04:B593: F4        .byte $F4   ; 
- D 1 - I - 0x0135A4 04:B594: 60        .byte $60   ; 
- D 1 - I - 0x0135A5 04:B595: F5        .byte $F5   ; 
- D 1 - I - 0x0135A6 04:B596: F8        .byte $F8   ; 
- D 1 - I - 0x0135A7 04:B597: F9        .byte $F9   ; 
- D 1 - I - 0x0135A8 04:B598: FA        .byte $FA   ; 
- D 1 - I - 0x0135A9 04:B599: FB        .byte $FB   ; 
- D 1 - I - 0x0135AA 04:B59A: 57        .byte $57   ; 
- D 1 - I - 0x0135AB 04:B59B: BF        .byte $BF   ; 
- D 1 - I - 0x0135AC 04:B59C: 21        .byte $21   ; 
- D 1 - I - 0x0135AD 04:B59D: 6A        .byte $6A   ; 
- D 1 - I - 0x0135AE 04:B59E: 6C        .byte $6C   ; 
- D 1 - I - 0x0135AF 04:B59F: 6D        .byte $6D   ; 
- D 1 - I - 0x0135B0 04:B5A0: 6E        .byte $6E   ; 
- D 1 - I - 0x0135B1 04:B5A1: 6F        .byte $6F   ; 
- D 1 - I - 0x0135B2 04:B5A2: 58        .byte $58   ; 
- D 1 - I - 0x0135B3 04:B5A3: C1        .byte $C1   ; 
- D 1 - I - 0x0135B4 04:B5A4: 23        .byte $23   ; 
- D 1 - I - 0x0135B5 04:B5A5: D8        .byte $D8   ; 
- D 1 - I - 0x0135B6 04:B5A6: C3        .byte $C3   ; 
- D 1 - I - 0x0135B7 04:B5A7: C4        .byte $C4   ; 
- D 1 - I - 0x0135B8 04:B5A8: C5        .byte $C5   ; 
- D 1 - I - 0x0135B9 04:B5A9: C6        .byte $C6   ; 
- D 1 - I - 0x0135BA 04:B5AA: 22        .byte $22   ; 
- D 1 - I - 0x0135BB 04:B5AB: 6B        .byte $6B   ; 
- D 1 - I - 0x0135BC 04:B5AC: 1F        .byte $1F   ; 
- D 1 - I - 0x0135BD 04:B5AD: BB        .byte $BB   ; 
- D 1 - I - 0x0135BE 04:B5AE: D3        .byte $D3   ; 
- D 1 - I - 0x0135BF 04:B5AF: C0        .byte $C0   ; 
- D 1 - I - 0x0135C0 04:B5B0: 85        .byte $85   ; 
- D 1 - I - 0x0135C1 04:B5B1: BE        .byte $BE   ; 
- D 1 - I - 0x0135C2 04:B5B2: 24        .byte $24   ; 
- D 1 - I - 0x0135C3 04:B5B3: C2        .byte $C2   ; 
- D 1 - I - 0x0135C4 04:B5B4: 20        .byte $20   ; 
- D 1 - I - 0x0135C5 04:B5B5: 81        .byte $81   ; 
- D 1 - I - 0x0135C6 04:B5B6: C7        .byte $C7   ; 
- D 1 - I - 0x0135C7 04:B5B7: C8        .byte $C8   ; 
- D 1 - I - 0x0135C8 04:B5B8: 1F        .byte $1F   ; 
- D 1 - I - 0x0135C9 04:B5B9: 03        .byte $03   ; 
- D 1 - I - 0x0135CA 04:B5BA: 05        .byte $05   ; 
- D 1 - I - 0x0135CB 04:B5BB: 00        .byte $00   ; 
- D 1 - I - 0x0135CC 04:B5BC: 28        .byte $28   ; 
- D 1 - I - 0x0135CD 04:B5BD: DD        .byte $DD   ; 
- D 1 - I - 0x0135CE 04:B5BE: BA        .byte $BA   ; 
- D 1 - I - 0x0135CF 04:B5BF: BB        .byte $BB   ; 
- D 1 - I - 0x0135D0 04:B5C0: E0        .byte $E0   ; 
- D 1 - I - 0x0135D1 04:B5C1: E1        .byte $E1   ; 
- D 1 - I - 0x0135D2 04:B5C2: 07        .byte $07   ; 
- D 1 - I - 0x0135D3 04:B5C3: 68        .byte $68   ; 
- D 1 - I - 0x0135D4 04:B5C4: 2A        .byte $2A   ; 
- D 1 - I - 0x0135D5 04:B5C5: E6        .byte $E6   ; 
- D 1 - I - 0x0135D6 04:B5C6: 80        .byte $80   ; 
- D 1 - I - 0x0135D7 04:B5C7: 69        .byte $69   ; 
- D 1 - I - 0x0135D8 04:B5C8: C7        .byte $C7   ; 
- D 1 - I - 0x0135D9 04:B5C9: C8        .byte $C8   ; 
- D 1 - I - 0x0135DA 04:B5CA: 29        .byte $29   ; 
- D 1 - I - 0x0135DB 04:B5CB: DE        .byte $DE   ; 
- D 1 - I - 0x0135DC 04:B5CC: 5D        .byte $5D   ; 
- D 1 - I - 0x0135DD 04:B5CD: DF        .byte $DF   ; 
- D 1 - I - 0x0135DE 04:B5CE: E2        .byte $E2   ; 
- D 1 - I - 0x0135DF 04:B5CF: E3        .byte $E3   ; 
- D 1 - I - 0x0135E0 04:B5D0: E4        .byte $E4   ; 
- D 1 - I - 0x0135E1 04:B5D1: E5        .byte $E5   ; 
- D 1 - I - 0x0135E2 04:B5D2: 2B        .byte $2B   ; 
- D 1 - I - 0x0135E3 04:B5D3: E7        .byte $E7   ; 
- D 1 - I - 0x0135E4 04:B5D4: 5E        .byte $5E   ; 
- D 1 - I - 0x0135E5 04:B5D5: E8        .byte $E8   ; 
- D 1 - I - 0x0135E6 04:B5D6: E9        .byte $E9   ; 
- D 1 - I - 0x0135E7 04:B5D7: EA        .byte $EA   ; 
- D 1 - I - 0x0135E8 04:B5D8: EB        .byte $EB   ; 
- D 1 - I - 0x0135E9 04:B5D9: EC        .byte $EC   ; 
- D 1 - I - 0x0135EA 04:B5DA: 5A        .byte $5A   ; 
- D 1 - I - 0x0135EB 04:B5DB: D0        .byte $D0   ; 
- D 1 - I - 0x0135EC 04:B5DC: 27        .byte $27   ; 
- D 1 - I - 0x0135ED 04:B5DD: 00        .byte $00   ; 
- D 1 - I - 0x0135EE 04:B5DE: D1        .byte $D1   ; 
- D 1 - I - 0x0135EF 04:B5DF: D2        .byte $D2   ; 
- D 1 - I - 0x0135F0 04:B5E0: D4        .byte $D4   ; 
- D 1 - I - 0x0135F1 04:B5E1: D5        .byte $D5   ; 
- D 1 - I - 0x0135F2 04:B5E2: 57        .byte $57   ; 
- D 1 - I - 0x0135F3 04:B5E3: BF        .byte $BF   ; 
- D 1 - I - 0x0135F4 04:B5E4: 21        .byte $21   ; 
- D 1 - I - 0x0135F5 04:B5E5: 6A        .byte $6A   ; 
- D 1 - I - 0x0135F6 04:B5E6: 6C        .byte $6C   ; 
- D 1 - I - 0x0135F7 04:B5E7: 6D        .byte $6D   ; 
- D 1 - I - 0x0135F8 04:B5E8: 6E        .byte $6E   ; 
- D 1 - I - 0x0135F9 04:B5E9: 6F        .byte $6F   ; 
- D 1 - I - 0x0135FA 04:B5EA: 32        .byte $32   ; 
- D 1 - I - 0x0135FB 04:B5EB: 00        .byte $00   ; 
- D 1 - I - 0x0135FC 04:B5EC: 1E        .byte $1E   ; 
- D 1 - I - 0x0135FD 04:B5ED: 84        .byte $84   ; 
- D 1 - I - 0x0135FE 04:B5EE: D6        .byte $D6   ; 
- D 1 - I - 0x0135FF 04:B5EF: D7        .byte $D7   ; 
- D 1 - I - 0x013600 04:B5F0: 87        .byte $87   ; 
- D 1 - I - 0x013601 04:B5F1: 06        .byte $06   ; 
- D 1 - I - 0x013602 04:B5F2: 22        .byte $22   ; 
- D 1 - I - 0x013603 04:B5F3: 6B        .byte $6B   ; 
- D 1 - I - 0x013604 04:B5F4: 1F        .byte $1F   ; 
- D 1 - I - 0x013605 04:B5F5: BB        .byte $BB   ; 
- D 1 - I - 0x013606 04:B5F6: D3        .byte $D3   ; 
- D 1 - I - 0x013607 04:B5F7: C0        .byte $C0   ; 
- D 1 - I - 0x013608 04:B5F8: 85        .byte $85   ; 
- D 1 - I - 0x013609 04:B5F9: BE        .byte $BE   ; 
- D 1 - I - 0x01360A 04:B5FA: 03        .byte $03   ; 
- D 1 - I - 0x01360B 04:B5FB: 05        .byte $05   ; 
- D 1 - I - 0x01360C 04:B5FC: 32        .byte $32   ; 
- D 1 - I - 0x01360D 04:B5FD: 00        .byte $00   ; 
- D 1 - I - 0x01360E 04:B5FE: 82        .byte $82   ; 
- D 1 - I - 0x01360F 04:B5FF: 00        .byte $00   ; 
- D 1 - I - 0x013610 04:B600: F6        .byte $F6   ; 
- D 1 - I - 0x013611 04:B601: F7        .byte $F7   ; 
- D 1 - I - 0x013612 04:B602: 05        .byte $05   ; 
- D 1 - I - 0x013613 04:B603: 00        .byte $00   ; 
- D 1 - I - 0x013614 04:B604: 28        .byte $28   ; 
- D 1 - I - 0x013615 04:B605: DD        .byte $DD   ; 
- D 1 - I - 0x013616 04:B606: BA        .byte $BA   ; 
- D 1 - I - 0x013617 04:B607: BB        .byte $BB   ; 
- D 1 - I - 0x013618 04:B608: E0        .byte $E0   ; 
- D 1 - I - 0x013619 04:B609: E1        .byte $E1   ; 
- D 1 - I - 0x01361A 04:B60A: 32        .byte $32   ; 
- D 1 - I - 0x01361B 04:B60B: F4        .byte $F4   ; 
- D 1 - I - 0x01361C 04:B60C: 60        .byte $60   ; 
- D 1 - I - 0x01361D 04:B60D: F5        .byte $F5   ; 
- D 1 - I - 0x01361E 04:B60E: F8        .byte $F8   ; 
- D 1 - I - 0x01361F 04:B60F: F9        .byte $F9   ; 
- D 1 - I - 0x013620 04:B610: FA        .byte $FA   ; 
- D 1 - I - 0x013621 04:B611: FB        .byte $FB   ; 
- D 1 - I - 0x013622 04:B612: 29        .byte $29   ; 
- D 1 - I - 0x013623 04:B613: DE        .byte $DE   ; 
- D 1 - I - 0x013624 04:B614: 5D        .byte $5D   ; 
- D 1 - I - 0x013625 04:B615: DF        .byte $DF   ; 
- D 1 - I - 0x013626 04:B616: E2        .byte $E2   ; 
- D 1 - I - 0x013627 04:B617: E3        .byte $E3   ; 
- D 1 - I - 0x013628 04:B618: E4        .byte $E4   ; 
- D 1 - I - 0x013629 04:B619: E5        .byte $E5   ; 
- D 1 - I - 0x01362A 04:B61A: 58        .byte $58   ; 
- D 1 - I - 0x01362B 04:B61B: C1        .byte $C1   ; 
- D 1 - I - 0x01362C 04:B61C: 23        .byte $23   ; 
- D 1 - I - 0x01362D 04:B61D: D8        .byte $D8   ; 
- D 1 - I - 0x01362E 04:B61E: C3        .byte $C3   ; 
- D 1 - I - 0x01362F 04:B61F: C4        .byte $C4   ; 
- D 1 - I - 0x013630 04:B620: C5        .byte $C5   ; 
- D 1 - I - 0x013631 04:B621: C6        .byte $C6   ; 
- D 1 - I - 0x013632 04:B622: 59        .byte $59   ; 
- D 1 - I - 0x013633 04:B623: C9        .byte $C9   ; 
- D 1 - I - 0x013634 04:B624: 25        .byte $25   ; 
- D 1 - I - 0x013635 04:B625: CA        .byte $CA   ; 
- D 1 - I - 0x013636 04:B626: CC        .byte $CC   ; 
- D 1 - I - 0x013637 04:B627: CD        .byte $CD   ; 
- D 1 - I - 0x013638 04:B628: CE        .byte $CE   ; 
- D 1 - I - 0x013639 04:B629: 00        .byte $00   ; 
- D 1 - I - 0x01363A 04:B62A: 24        .byte $24   ; 
- D 1 - I - 0x01363B 04:B62B: C2        .byte $C2   ; 
- D 1 - I - 0x01363C 04:B62C: 20        .byte $20   ; 
- D 1 - I - 0x01363D 04:B62D: 81        .byte $81   ; 
- D 1 - I - 0x01363E 04:B62E: C7        .byte $C7   ; 
- D 1 - I - 0x01363F 04:B62F: C8        .byte $C8   ; 
- D 1 - I - 0x013640 04:B630: 1F        .byte $1F   ; 
- D 1 - I - 0x013641 04:B631: 03        .byte $03   ; 
- D 1 - I - 0x013642 04:B632: 26        .byte $26   ; 
- D 1 - I - 0x013643 04:B633: CB        .byte $CB   ; 
- D 1 - I - 0x013644 04:B634: 1D        .byte $1D   ; 
- D 1 - I - 0x013645 04:B635: 82        .byte $82   ; 
- D 1 - I - 0x013646 04:B636: 00        .byte $00   ; 
- D 1 - I - 0x013647 04:B637: CF        .byte $CF   ; 
- D 1 - I - 0x013648 04:B638: 00        .byte $00   ; 
- D 1 - I - 0x013649 04:B639: 86        .byte $86   ; 
- D 1 - I - 0x01364A 04:B63A: 07        .byte $07   ; 
- D 1 - I - 0x01364B 04:B63B: 68        .byte $68   ; 
- D 1 - I - 0x01364C 04:B63C: 2A        .byte $2A   ; 
- D 1 - I - 0x01364D 04:B63D: E6        .byte $E6   ; 
- D 1 - I - 0x01364E 04:B63E: 80        .byte $80   ; 
- D 1 - I - 0x01364F 04:B63F: 69        .byte $69   ; 
- D 1 - I - 0x013650 04:B640: C7        .byte $C7   ; 
- D 1 - I - 0x013651 04:B641: C8        .byte $C8   ; 
- D 1 - I - 0x013652 04:B642: 05        .byte $05   ; 
- D 1 - I - 0x013653 04:B643: 67        .byte $67   ; 
- D 1 - I - 0x013654 04:B644: 2C        .byte $2C   ; 
- D 1 - I - 0x013655 04:B645: ED        .byte $ED   ; 
- D 1 - I - 0x013656 04:B646: 06        .byte $06   ; 
- D 1 - I - 0x013657 04:B647: 82        .byte $82   ; 
- D 1 - I - 0x013658 04:B648: F0        .byte $F0   ; 
- D 1 - I - 0x013659 04:B649: 00        .byte $00   ; 
- D 1 - I - 0x01365A 04:B64A: 2B        .byte $2B   ; 
- D 1 - I - 0x01365B 04:B64B: E7        .byte $E7   ; 
- D 1 - I - 0x01365C 04:B64C: 5E        .byte $5E   ; 
- D 1 - I - 0x01365D 04:B64D: E8        .byte $E8   ; 
- D 1 - I - 0x01365E 04:B64E: E9        .byte $E9   ; 
- D 1 - I - 0x01365F 04:B64F: EA        .byte $EA   ; 
- D 1 - I - 0x013660 04:B650: EB        .byte $EB   ; 
- D 1 - I - 0x013661 04:B651: EC        .byte $EC   ; 
- D 1 - I - 0x013662 04:B652: 2D        .byte $2D   ; 
- D 1 - I - 0x013663 04:B653: EE        .byte $EE   ; 
- D 1 - I - 0x013664 04:B654: 5F        .byte $5F   ; 
- D 1 - I - 0x013665 04:B655: EF        .byte $EF   ; 
- D 1 - I - 0x013666 04:B656: 00        .byte $00   ; 
- D 1 - I - 0x013667 04:B657: F1        .byte $F1   ; 
- D 1 - I - 0x013668 04:B658: F2        .byte $F2   ; 
- D 1 - I - 0x013669 04:B659: F3        .byte $F3   ; 
- D 1 - I - 0x01366A 04:B65A: 5A        .byte $5A   ; 
- D 1 - I - 0x01366B 04:B65B: D0        .byte $D0   ; 
- D 1 - I - 0x01366C 04:B65C: 27        .byte $27   ; 
- D 1 - I - 0x01366D 04:B65D: 00        .byte $00   ; 
- D 1 - I - 0x01366E 04:B65E: D1        .byte $D1   ; 
- D 1 - I - 0x01366F 04:B65F: D2        .byte $D2   ; 
- D 1 - I - 0x013670 04:B660: D4        .byte $D4   ; 
- D 1 - I - 0x013671 04:B661: D5        .byte $D5   ; 
- D 1 - I - 0x013672 04:B662: 5C        .byte $5C   ; 
- D 1 - I - 0x013673 04:B663: DB        .byte $DB   ; 
- D 1 - I - 0x013674 04:B664: 31        .byte $31   ; 
- D 1 - I - 0x013675 04:B665: DC        .byte $DC   ; 
- D 1 - I - 0x013676 04:B666: 7E        .byte $7E   ; 
- D 1 - I - 0x013677 04:B667: 10        .byte $10   ; 
- D 1 - I - 0x013678 04:B668: 1A        .byte $1A   ; 
- D 1 - I - 0x013679 04:B669: 0B        .byte $0B   ; 
- D 1 - I - 0x01367A 04:B66A: 32        .byte $32   ; 
- D 1 - I - 0x01367B 04:B66B: 00        .byte $00   ; 
- D 1 - I - 0x01367C 04:B66C: 1E        .byte $1E   ; 
- D 1 - I - 0x01367D 04:B66D: 81        .byte $81   ; 
- D 1 - I - 0x01367E 04:B66E: D6        .byte $D6   ; 
- D 1 - I - 0x01367F 04:B66F: D7        .byte $D7   ; 
- D 1 - I - 0x013680 04:B670: 1F        .byte $1F   ; 
- D 1 - I - 0x013681 04:B671: 03        .byte $03   ; 
- D 1 - I - 0x013682 04:B672: 22        .byte $22   ; 
- D 1 - I - 0x013683 04:B673: 6B        .byte $6B   ; 
- D 1 - I - 0x013684 04:B674: 1D        .byte $1D   ; 
- D 1 - I - 0x013685 04:B675: 82        .byte $82   ; 
- D 1 - I - 0x013686 04:B676: 0C        .byte $0C   ; 
- D 1 - I - 0x013687 04:B677: 1B        .byte $1B   ; 
- D 1 - I - 0x013688 04:B678: 1F        .byte $1F   ; 
- D 1 - I - 0x013689 04:B679: 86        .byte $86   ; 
- D 1 - I - 0x01368A 04:B67A: 03        .byte $03   ; 
- D 1 - I - 0x01368B 04:B67B: 05        .byte $05   ; 
- D 1 - I - 0x01368C 04:B67C: 32        .byte $32   ; 
- D 1 - I - 0x01368D 04:B67D: 00        .byte $00   ; 
- D 1 - I - 0x01368E 04:B67E: 82        .byte $82   ; 
- D 1 - I - 0x01368F 04:B67F: 00        .byte $00   ; 
- D 1 - I - 0x013690 04:B680: F6        .byte $F6   ; 
- D 1 - I - 0x013691 04:B681: F7        .byte $F7   ; 
- D 1 - I - 0x013692 04:B682: 05        .byte $05   ; 
- D 1 - I - 0x013693 04:B683: 00        .byte $00   ; 
- D 1 - I - 0x013694 04:B684: 28        .byte $28   ; 
- D 1 - I - 0x013695 04:B685: DD        .byte $DD   ; 
- D 1 - I - 0x013696 04:B686: BA        .byte $BA   ; 
- D 1 - I - 0x013697 04:B687: BB        .byte $BB   ; 
- D 1 - I - 0x013698 04:B688: 1C        .byte $1C   ; 
- D 1 - I - 0x013699 04:B689: 0C        .byte $0C   ; 
- D 1 - I - 0x01369A 04:B68A: 32        .byte $32   ; 
- D 1 - I - 0x01369B 04:B68B: F4        .byte $F4   ; 
- D 1 - I - 0x01369C 04:B68C: 60        .byte $60   ; 
- D 1 - I - 0x01369D 04:B68D: F5        .byte $F5   ; 
- D 1 - I - 0x01369E 04:B68E: F8        .byte $F8   ; 
- D 1 - I - 0x01369F 04:B68F: F9        .byte $F9   ; 
- D 1 - I - 0x0136A0 04:B690: FA        .byte $FA   ; 
- D 1 - I - 0x0136A1 04:B691: FB        .byte $FB   ; 
- D 1 - I - 0x0136A2 04:B692: 2F        .byte $2F   ; 
- D 1 - I - 0x0136A3 04:B693: FE        .byte $FE   ; 
- D 1 - I - 0x0136A4 04:B694: 62        .byte $62   ; 
- D 1 - I - 0x0136A5 04:B695: FF        .byte $FF   ; 
- D 1 - I - 0x0136A6 04:B696: 47        .byte $47   ; 
- D 1 - I - 0x0136A7 04:B697: 1A        .byte $1A   ; 
- D 1 - I - 0x0136A8 04:B698: 74        .byte $74   ; 
- D 1 - I - 0x0136A9 04:B699: 7F        .byte $7F   ; 
- D 1 - I - 0x0136AA 04:B69A: 1B        .byte $1B   ; 
- D 1 - I - 0x0136AB 04:B69B: 00        .byte $00   ; 
- D 1 - I - 0x0136AC 04:B69C: 08        .byte $08   ; 
- D 1 - I - 0x0136AD 04:B69D: 84        .byte $84   ; 
- D 1 - I - 0x0136AE 04:B69E: 0B        .byte $0B   ; 
- D 1 - I - 0x0136AF 04:B69F: 1B        .byte $1B   ; 
- D 1 - I - 0x0136B0 04:B6A0: 00        .byte $00   ; 
- D 1 - I - 0x0136B1 04:B6A1: 06        .byte $06   ; 
- D 1 - I - 0x0136B2 04:B6A2: 09        .byte $09   ; 
- D 1 - I - 0x0136B3 04:B6A3: 0A        .byte $0A   ; 
- D 1 - I - 0x0136B4 04:B6A4: 0B        .byte $0B   ; 
- D 1 - I - 0x0136B5 04:B6A5: 0C        .byte $0C   ; 
- D 1 - I - 0x0136B6 04:B6A6: 0B        .byte $0B   ; 
- D 1 - I - 0x0136B7 04:B6A7: 0C        .byte $0C   ; 
- D 1 - I - 0x0136B8 04:B6A8: 0A        .byte $0A   ; 
- D 1 - I - 0x0136B9 04:B6A9: 09        .byte $09   ; 
- D 1 - I - 0x0136BA 04:B6AA: 03        .byte $03   ; 
- D 1 - I - 0x0136BB 04:B6AB: 80        .byte $80   ; 
- D 1 - I - 0x0136BC 04:B6AC: 04        .byte $04   ; 
- D 1 - I - 0x0136BD 04:B6AD: 81        .byte $81   ; 
- D 1 - I - 0x0136BE 04:B6AE: 82        .byte $82   ; 
- D 1 - I - 0x0136BF 04:B6AF: 83        .byte $83   ; 
- D 1 - I - 0x0136C0 04:B6B0: 84        .byte $84   ; 
- D 1 - I - 0x0136C1 04:B6B1: 03        .byte $03   ; 
- D 1 - I - 0x0136C2 04:B6B2: 0B        .byte $0B   ; 
- D 1 - I - 0x0136C3 04:B6B3: 1B        .byte $1B   ; 
- D 1 - I - 0x0136C4 04:B6B4: 0C        .byte $0C   ; 
- D 1 - I - 0x0136C5 04:B6B5: 1B        .byte $1B   ; 
- D 1 - I - 0x0136C6 04:B6B6: 0B        .byte $0B   ; 
- D 1 - I - 0x0136C7 04:B6B7: 0C        .byte $0C   ; 
- D 1 - I - 0x0136C8 04:B6B8: 0A        .byte $0A   ; 
- D 1 - I - 0x0136C9 04:B6B9: 09        .byte $09   ; 
- D 1 - I - 0x0136CA 04:B6BA: 07        .byte $07   ; 
- D 1 - I - 0x0136CB 04:B6BB: BD        .byte $BD   ; 
- D 1 - I - 0x0136CC 04:B6BC: 08        .byte $08   ; 
- D 1 - I - 0x0136CD 04:B6BD: 84        .byte $84   ; 
- D 1 - I - 0x0136CE 04:B6BE: 80        .byte $80   ; 
- D 1 - I - 0x0136CF 04:B6BF: 04        .byte $04   ; 
- D 1 - I - 0x0136D0 04:B6C0: 87        .byte $87   ; 
- D 1 - I - 0x0136D1 04:B6C1: 06        .byte $06   ; 
- D 1 - I - 0x0136D2 04:B6C2: 1C        .byte $1C   ; 
- D 1 - I - 0x0136D3 04:B6C3: 0B        .byte $0B   ; 
- D 1 - I - 0x0136D4 04:B6C4: 1C        .byte $1C   ; 
- D 1 - I - 0x0136D5 04:B6C5: 0C        .byte $0C   ; 
- D 1 - I - 0x0136D6 04:B6C6: 0B        .byte $0B   ; 
- D 1 - I - 0x0136D7 04:B6C7: 0C        .byte $0C   ; 
- D 1 - I - 0x0136D8 04:B6C8: 0A        .byte $0A   ; 
- D 1 - I - 0x0136D9 04:B6C9: 09        .byte $09   ; 
- D 1 - I - 0x0136DA 04:B6CA: 03        .byte $03   ; 
- D 1 - I - 0x0136DB 04:B6CB: 04        .byte $04   ; 
- D 1 - I - 0x0136DC 04:B6CC: 00        .byte $00   ; 
- D 1 - I - 0x0136DD 04:B6CD: 1C        .byte $1C   ; 
- D 1 - I - 0x0136DE 04:B6CE: 82        .byte $82   ; 
- D 1 - I - 0x0136DF 04:B6CF: 00        .byte $00   ; 
- D 1 - I - 0x0136E0 04:B6D0: 1C        .byte $1C   ; 
- D 1 - I - 0x0136E1 04:B6D1: 0B        .byte $0B   ; 
- D 1 - I - 0x0136E2 04:B6D2: 0B        .byte $0B   ; 
- D 1 - I - 0x0136E3 04:B6D3: 0C        .byte $0C   ; 
- D 1 - I - 0x0136E4 04:B6D4: 0A        .byte $0A   ; 
- D 1 - I - 0x0136E5 04:B6D5: 0C        .byte $0C   ; 
- D 1 - I - 0x0136E6 04:B6D6: 0B        .byte $0B   ; 
- D 1 - I - 0x0136E7 04:B6D7: 0C        .byte $0C   ; 
- D 1 - I - 0x0136E8 04:B6D8: 0A        .byte $0A   ; 
- D 1 - I - 0x0136E9 04:B6D9: 09        .byte $09   ; 
- D 1 - I - 0x0136EA 04:B6DA: 05        .byte $05   ; 
- D 1 - I - 0x0136EB 04:B6DB: 85        .byte $85   ; 
- D 1 - I - 0x0136EC 04:B6DC: 06        .byte $06   ; 
- D 1 - I - 0x0136ED 04:B6DD: 82        .byte $82   ; 
- D 1 - I - 0x0136EE 04:B6DE: BA        .byte $BA   ; 
- D 1 - I - 0x0136EF 04:B6DF: 02        .byte $02   ; 
- D 1 - I - 0x0136F0 04:B6E0: BB        .byte $BB   ; 
- D 1 - I - 0x0136F1 04:B6E1: 40        .byte $40   ; 
- D 1 - I - 0x0136F2 04:B6E2: 23        .byte $23   ; 
- D 1 - I - 0x0136F3 04:B6E3: 77        .byte $77   ; 
- D 1 - I - 0x0136F4 04:B6E4: 36        .byte $36   ; 
- D 1 - I - 0x0136F5 04:B6E5: 00        .byte $00   ; 
- D 1 - I - 0x0136F6 04:B6E6: 35        .byte $35   ; 
- D 1 - I - 0x0136F7 04:B6E7: A5        .byte $A5   ; 
- D 1 - I - 0x0136F8 04:B6E8: 7E        .byte $7E   ; 
- D 1 - I - 0x0136F9 04:B6E9: 7F        .byte $7F   ; 
- D 1 - I - 0x0136FA 04:B6EA: 04        .byte $04   ; 
- D 1 - I - 0x0136FB 04:B6EB: 40        .byte $40   ; 
- D 1 - I - 0x0136FC 04:B6EC: 00        .byte $00   ; 
- D 1 - I - 0x0136FD 04:B6ED: 00        .byte $00   ; 
- D 1 - I - 0x0136FE 04:B6EE: 00        .byte $00   ; 
- D 1 - I - 0x0136FF 04:B6EF: 00        .byte $00   ; 
- D 1 - I - 0x013700 04:B6F0: 42        .byte $42   ; 
- D 1 - I - 0x013701 04:B6F1: 43        .byte $43   ; 
- D 1 - I - 0x013702 04:B6F2: 23        .byte $23   ; 
- D 1 - I - 0x013703 04:B6F3: 44        .byte $44   ; 
- D 1 - I - 0x013704 04:B6F4: 32        .byte $32   ; 
- D 1 - I - 0x013705 04:B6F5: 45        .byte $45   ; 
- D 1 - I - 0x013706 04:B6F6: 46        .byte $46   ; 
- D 1 - I - 0x013707 04:B6F7: 47        .byte $47   ; 
- D 1 - I - 0x013708 04:B6F8: 48        .byte $48   ; 
- D 1 - I - 0x013709 04:B6F9: 49        .byte $49   ; 
- D 1 - I - 0x01370A 04:B6FA: 00        .byte $00   ; 
- D 1 - I - 0x01370B 04:B6FB: 00        .byte $00   ; 
- D 1 - I - 0x01370C 04:B6FC: 04        .byte $04   ; 
- D 1 - I - 0x01370D 04:B6FD: BC        .byte $BC   ; 
- D 1 - I - 0x01370E 04:B6FE: 58        .byte $58   ; 
- D 1 - I - 0x01370F 04:B6FF: 57        .byte $57   ; 
- D 1 - I - 0x013710 04:B700: 00        .byte $00   ; 
- D 1 - I - 0x013711 04:B701: 40        .byte $40   ; 
- D 1 - I - 0x013712 04:B702: 39        .byte $39   ; 
- D 1 - I - 0x013713 04:B703: 59        .byte $59   ; 
- D 1 - I - 0x013714 04:B704: 38        .byte $38   ; 
- D 1 - I - 0x013715 04:B705: 00        .byte $00   ; 
- D 1 - I - 0x013716 04:B706: 5D        .byte $5D   ; 
- D 1 - I - 0x013717 04:B707: 5C        .byte $5C   ; 
- D 1 - I - 0x013718 04:B708: 5B        .byte $5B   ; 
- D 1 - I - 0x013719 04:B709: 5A        .byte $5A   ; 
- D 1 - I - 0x01371A 04:B70A: 01        .byte $01   ; 
- D 1 - I - 0x01371B 04:B70B: BA        .byte $BA   ; 
- D 1 - I - 0x01371C 04:B70C: 02        .byte $02   ; 
- D 1 - I - 0x01371D 04:B70D: BB        .byte $BB   ; 
- D 1 - I - 0x01371E 04:B70E: BC        .byte $BC   ; 
- D 1 - I - 0x01371F 04:B70F: 07        .byte $07   ; 
- D 1 - I - 0x013720 04:B710: BD        .byte $BD   ; 
- D 1 - I - 0x013721 04:B711: BE        .byte $BE   ; 
- D 1 - I - 0x013722 04:B712: 23        .byte $23   ; 
- D 1 - I - 0x013723 04:B713: 9D        .byte $9D   ; 
- D 1 - I - 0x013724 04:B714: 3C        .byte $3C   ; 
- D 1 - I - 0x013725 04:B715: 00        .byte $00   ; 
- D 1 - I - 0x013726 04:B716: 20        .byte $20   ; 
- D 1 - I - 0x013727 04:B717: 9E        .byte $9E   ; 
- D 1 - I - 0x013728 04:B718: B2        .byte $B2   ; 
- D 1 - I - 0x013729 04:B719: 93        .byte $93   ; 
- D 1 - I - 0x01372A 04:B71A: 35        .byte $35   ; 
- D 1 - I - 0x01372B 04:B71B: 77        .byte $77   ; 
- D 1 - I - 0x01372C 04:B71C: 37        .byte $37   ; 
- D 1 - I - 0x01372D 04:B71D: 88        .byte $88   ; 
- D 1 - I - 0x01372E 04:B71E: 76        .byte $76   ; 
- D 1 - I - 0x01372F 04:B71F: A5        .byte $A5   ; 
- D 1 - I - 0x013730 04:B720: 89        .byte $89   ; 
- D 1 - I - 0x013731 04:B721: 88        .byte $88   ; 
- D 1 - I - 0x013732 04:B722: 1C        .byte $1C   ; 
- D 1 - I - 0x013733 04:B723: 79        .byte $79   ; 
- D 1 - I - 0x013734 04:B724: 12        .byte $12   ; 
- D 1 - I - 0x013735 04:B725: 7F        .byte $7F   ; 
- D 1 - I - 0x013736 04:B726: 7A        .byte $7A   ; 
- D 1 - I - 0x013737 04:B727: 7B        .byte $7B   ; 
- D 1 - I - 0x013738 04:B728: 8A        .byte $8A   ; 
- D 1 - I - 0x013739 04:B729: AD        .byte $AD   ; 
- D 1 - I - 0x01373A 04:B72A: 33        .byte $33   ; 
- D 1 - I - 0x01373B 04:B72B: 4A        .byte $4A   ; 
- D 1 - I - 0x01373C 04:B72C: 34        .byte $34   ; 
- D 1 - I - 0x01373D 04:B72D: 4B        .byte $4B   ; 
- D 1 - I - 0x01373E 04:B72E: 4C        .byte $4C   ; 
- D 1 - I - 0x01373F 04:B72F: 4D        .byte $4D   ; 
- D 1 - I - 0x013740 04:B730: 4E        .byte $4E   ; 
- D 1 - I - 0x013741 04:B731: 4F        .byte $4F   ; 
- D 1 - I - 0x013742 04:B732: 1A        .byte $1A   ; 
- D 1 - I - 0x013743 04:B733: 50        .byte $50   ; 
- D 1 - I - 0x013744 04:B734: 1B        .byte $1B   ; 
- D 1 - I - 0x013745 04:B735: 51        .byte $51   ; 
- D 1 - I - 0x013746 04:B736: 00        .byte $00   ; 
- D 1 - I - 0x013747 04:B737: 52        .byte $52   ; 
- D 1 - I - 0x013748 04:B738: 53        .byte $53   ; 
- D 1 - I - 0x013749 04:B739: 54        .byte $54   ; 
- D 1 - I - 0x01374A 04:B73A: 3B        .byte $3B   ; 
- D 1 - I - 0x01374B 04:B73B: 5F        .byte $5F   ; 
- D 1 - I - 0x01374C 04:B73C: 3A        .byte $3A   ; 
- D 1 - I - 0x01374D 04:B73D: 5E        .byte $5E   ; 
- D 1 - I - 0x01374E 04:B73E: 63        .byte $63   ; 
- D 1 - I - 0x01374F 04:B73F: 62        .byte $62   ; 
- D 1 - I - 0x013750 04:B740: 61        .byte $61   ; 
- D 1 - I - 0x013751 04:B741: 60        .byte $60   ; 
- D 1 - I - 0x013752 04:B742: 1E        .byte $1E   ; 
- D 1 - I - 0x013753 04:B743: 65        .byte $65   ; 
- D 1 - I - 0x013754 04:B744: 1D        .byte $1D   ; 
- D 1 - I - 0x013755 04:B745: 64        .byte $64   ; 
- D 1 - I - 0x013756 04:B746: 68        .byte $68   ; 
- D 1 - I - 0x013757 04:B747: 67        .byte $67   ; 
- D 1 - I - 0x013758 04:B748: 66        .byte $66   ; 
- D 1 - I - 0x013759 04:B749: 00        .byte $00   ; 
- D 1 - I - 0x01375A 04:B74A: 3D        .byte $3D   ; 
- D 1 - I - 0x01375B 04:B74B: 9F        .byte $9F   ; 
- D 1 - I - 0x01375C 04:B74C: 3C        .byte $3C   ; 
- D 1 - I - 0x01375D 04:B74D: 93        .byte $93   ; 
- D 1 - I - 0x01375E 04:B74E: 3D        .byte $3D   ; 
- D 1 - I - 0x01375F 04:B74F: A0        .byte $A0   ; 
- D 1 - I - 0x013760 04:B750: B2        .byte $B2   ; 
- D 1 - I - 0x013761 04:B751: 96        .byte $96   ; 
- D 1 - I - 0x013762 04:B752: 20        .byte $20   ; 
- D 1 - I - 0x013763 04:B753: B4        .byte $B4   ; 
- D 1 - I - 0x013764 04:B754: 1F        .byte $1F   ; 
- D 1 - I - 0x013765 04:B755: 97        .byte $97   ; 
- D 1 - I - 0x013766 04:B756: B6        .byte $B6   ; 
- D 1 - I - 0x013767 04:B757: A1        .byte $A1   ; 
- D 1 - I - 0x013768 04:B758: 99        .byte $99   ; 
- D 1 - I - 0x013769 04:B759: 98        .byte $98   ; 
- D 1 - I - 0x01376A 04:B75A: 04        .byte $04   ; 
- D 1 - I - 0x01376B 04:B75B: 40        .byte $40   ; 
- D 1 - I - 0x01376C 04:B75C: 00        .byte $00   ; 
- D 1 - I - 0x01376D 04:B75D: 00        .byte $00   ; 
- D 1 - I - 0x01376E 04:B75E: 00        .byte $00   ; 
- D 1 - I - 0x01376F 04:B75F: 00        .byte $00   ; 
- D 1 - I - 0x013770 04:B760: 00        .byte $00   ; 
- D 1 - I - 0x013771 04:B761: 00        .byte $00   ; 
- D 1 - I - 0x013772 04:B762: 00        .byte $00   ; 
- D 1 - I - 0x013773 04:B763: 00        .byte $00   ; 
- D 1 - I - 0x013774 04:B764: 00        .byte $00   ; 
- D 1 - I - 0x013775 04:B765: 00        .byte $00   ; 
- D 1 - I - 0x013776 04:B766: 46        .byte $46   ; 
- D 1 - I - 0x013777 04:B767: 55        .byte $55   ; 
- D 1 - I - 0x013778 04:B768: 00        .byte $00   ; 
- D 1 - I - 0x013779 04:B769: 00        .byte $00   ; 
- D 1 - I - 0x01377A 04:B76A: 00        .byte $00   ; 
- D 1 - I - 0x01377B 04:B76B: 00        .byte $00   ; 
- D 1 - I - 0x01377C 04:B76C: 40        .byte $40   ; 
- D 1 - I - 0x01377D 04:B76D: BC        .byte $BC   ; 
- D 1 - I - 0x01377E 04:B76E: 00        .byte $00   ; 
- D 1 - I - 0x01377F 04:B76F: 00        .byte $00   ; 
- D 1 - I - 0x013780 04:B770: 00        .byte $00   ; 
- D 1 - I - 0x013781 04:B771: 40        .byte $40   ; 
- D 1 - I - 0x013782 04:B772: 00        .byte $00   ; 
- D 1 - I - 0x013783 04:B773: 00        .byte $00   ; 
- D 1 - I - 0x013784 04:B774: 00        .byte $00   ; 
- D 1 - I - 0x013785 04:B775: 00        .byte $00   ; 
- D 1 - I - 0x013786 04:B776: 00        .byte $00   ; 
- D 1 - I - 0x013787 04:B777: 00        .byte $00   ; 
- D 1 - I - 0x013788 04:B778: 69        .byte $69   ; 
- D 1 - I - 0x013789 04:B779: 5A        .byte $5A   ; 
- D 1 - I - 0x01378A 04:B77A: 24        .byte $24   ; 
- D 1 - I - 0x01378B 04:B77B: A2        .byte $A2   ; 
- D 1 - I - 0x01378C 04:B77C: 11        .byte $11   ; 
- D 1 - I - 0x01378D 04:B77D: A3        .byte $A3   ; 
- D 1 - I - 0x01378E 04:B77E: A4        .byte $A4   ; 
- D 1 - I - 0x01378F 04:B77F: A5        .byte $A5   ; 
- D 1 - I - 0x013790 04:B780: A6        .byte $A6   ; 
- D 1 - I - 0x013791 04:B781: A7        .byte $A7   ; 
- D 1 - I - 0x013792 04:B782: 25        .byte $25   ; 
- D 1 - I - 0x013793 04:B783: A8        .byte $A8   ; 
- D 1 - I - 0x013794 04:B784: 12        .byte $12   ; 
- D 1 - I - 0x013795 04:B785: A9        .byte $A9   ; 
- D 1 - I - 0x013796 04:B786: AA        .byte $AA   ; 
- D 1 - I - 0x013797 04:B787: AB        .byte $AB   ; 
- D 1 - I - 0x013798 04:B788: AC        .byte $AC   ; 
- D 1 - I - 0x013799 04:B789: AD        .byte $AD   ; 
- D 1 - I - 0x01379A 04:B78A: 13        .byte $13   ; 
- D 1 - I - 0x01379B 04:B78B: AE        .byte $AE   ; 
- D 1 - I - 0x01379C 04:B78C: 26        .byte $26   ; 
- D 1 - I - 0x01379D 04:B78D: AF        .byte $AF   ; 
- D 1 - I - 0x01379E 04:B78E: B0        .byte $B0   ; 
- D 1 - I - 0x01379F 04:B78F: B1        .byte $B1   ; 
- D 1 - I - 0x0137A0 04:B790: B2        .byte $B2   ; 
- D 1 - I - 0x0137A1 04:B791: B3        .byte $B3   ; 
- D 1 - I - 0x0137A2 04:B792: 14        .byte $14   ; 
- D 1 - I - 0x0137A3 04:B793: B4        .byte $B4   ; 
- D 1 - I - 0x0137A4 04:B794: 27        .byte $27   ; 
- D 1 - I - 0x0137A5 04:B795: B5        .byte $B5   ; 
- D 1 - I - 0x0137A6 04:B796: B6        .byte $B6   ; 
- D 1 - I - 0x0137A7 04:B797: B7        .byte $B7   ; 
- D 1 - I - 0x0137A8 04:B798: B8        .byte $B8   ; 
- D 1 - I - 0x0137A9 04:B799: B9        .byte $B9   ; 
- D 1 - I - 0x0137AA 04:B79A: 33        .byte $33   ; 
- D 1 - I - 0x0137AB 04:B79B: 55        .byte $55   ; 
- D 1 - I - 0x0137AC 04:B79C: 00        .byte $00   ; 
- D 1 - I - 0x0137AD 04:B79D: 00        .byte $00   ; 
- D 1 - I - 0x0137AE 04:B79E: 4C        .byte $4C   ; 
- D 1 - I - 0x0137AF 04:B79F: 56        .byte $56   ; 
- D 1 - I - 0x0137B0 04:B7A0: 00        .byte $00   ; 
- D 1 - I - 0x0137B1 04:B7A1: 00        .byte $00   ; 
- D 1 - I - 0x0137B2 04:B7A2: 1A        .byte $1A   ; 
- D 1 - I - 0x0137B3 04:B7A3: 56        .byte $56   ; 
- D 1 - I - 0x0137B4 04:B7A4: 00        .byte $00   ; 
- D 1 - I - 0x0137B5 04:B7A5: 00        .byte $00   ; 
- D 1 - I - 0x0137B6 04:B7A6: 00        .byte $00   ; 
- D 1 - I - 0x0137B7 04:B7A7: 52        .byte $52   ; 
- D 1 - I - 0x0137B8 04:B7A8: 56        .byte $56   ; 
- D 1 - I - 0x0137B9 04:B7A9: 00        .byte $00   ; 
- D 1 - I - 0x0137BA 04:B7AA: 00        .byte $00   ; 
- D 1 - I - 0x0137BB 04:B7AB: 00        .byte $00   ; 
- D 1 - I - 0x0137BC 04:B7AC: 69        .byte $69   ; 
- D 1 - I - 0x0137BD 04:B7AD: 5E        .byte $5E   ; 
- D 1 - I - 0x0137BE 04:B7AE: 00        .byte $00   ; 
- D 1 - I - 0x0137BF 04:B7AF: 00        .byte $00   ; 
- D 1 - I - 0x0137C0 04:B7B0: 6A        .byte $6A   ; 
- D 1 - I - 0x0137C1 04:B7B1: 60        .byte $60   ; 
- D 1 - I - 0x0137C2 04:B7B2: 00        .byte $00   ; 
- D 1 - I - 0x0137C3 04:B7B3: 00        .byte $00   ; 
- D 1 - I - 0x0137C4 04:B7B4: 6A        .byte $6A   ; 
- D 1 - I - 0x0137C5 04:B7B5: 64        .byte $64   ; 
- D 1 - I - 0x0137C6 04:B7B6: 00        .byte $00   ; 
- D 1 - I - 0x0137C7 04:B7B7: 6A        .byte $6A   ; 
- D 1 - I - 0x0137C8 04:B7B8: 66        .byte $66   ; 
- D 1 - I - 0x0137C9 04:B7B9: 00        .byte $00   ; 
- D 1 - I - 0x0137CA 04:B7BA: 25        .byte $25   ; 
- D 1 - I - 0x0137CB 04:B7BB: A8        .byte $A8   ; 
- D 1 - I - 0x0137CC 04:B7BC: 12        .byte $12   ; 
- D 1 - I - 0x0137CD 04:B7BD: A9        .byte $A9   ; 
- D 1 - I - 0x0137CE 04:B7BE: AA        .byte $AA   ; 
- D 1 - I - 0x0137CF 04:B7BF: AB        .byte $AB   ; 
- D 1 - I - 0x0137D0 04:B7C0: AC        .byte $AC   ; 
- D 1 - I - 0x0137D1 04:B7C1: AD        .byte $AD   ; 
- D 1 - I - 0x0137D2 04:B7C2: 24        .byte $24   ; 
- D 1 - I - 0x0137D3 04:B7C3: A2        .byte $A2   ; 
- D 1 - I - 0x0137D4 04:B7C4: 11        .byte $11   ; 
- D 1 - I - 0x0137D5 04:B7C5: A3        .byte $A3   ; 
- D 1 - I - 0x0137D6 04:B7C6: A4        .byte $A4   ; 
- D 1 - I - 0x0137D7 04:B7C7: A5        .byte $A5   ; 
- D 1 - I - 0x0137D8 04:B7C8: A6        .byte $A6   ; 
- D 1 - I - 0x0137D9 04:B7C9: A7        .byte $A7   ; 
- D 1 - I - 0x0137DA 04:B7CA: 14        .byte $14   ; 
- D 1 - I - 0x0137DB 04:B7CB: B4        .byte $B4   ; 
- D 1 - I - 0x0137DC 04:B7CC: 27        .byte $27   ; 
- D 1 - I - 0x0137DD 04:B7CD: B5        .byte $B5   ; 
- D 1 - I - 0x0137DE 04:B7CE: B6        .byte $B6   ; 
- D 1 - I - 0x0137DF 04:B7CF: B7        .byte $B7   ; 
- D 1 - I - 0x0137E0 04:B7D0: B8        .byte $B8   ; 
- D 1 - I - 0x0137E1 04:B7D1: B9        .byte $B9   ; 
- D 1 - I - 0x0137E2 04:B7D2: 13        .byte $13   ; 
- D 1 - I - 0x0137E3 04:B7D3: AE        .byte $AE   ; 
- D 1 - I - 0x0137E4 04:B7D4: 26        .byte $26   ; 
- D 1 - I - 0x0137E5 04:B7D5: AF        .byte $AF   ; 
- D 1 - I - 0x0137E6 04:B7D6: B0        .byte $B0   ; 
- D 1 - I - 0x0137E7 04:B7D7: B1        .byte $B1   ; 
- D 1 - I - 0x0137E8 04:B7D8: B2        .byte $B2   ; 
- D 1 - I - 0x0137E9 04:B7D9: B3        .byte $B3   ; 
- D 1 - I - 0x0137EA 04:B7DA: 01        .byte $01   ; 
- D 1 - I - 0x0137EB 04:B7DB: BA        .byte $BA   ; 
- D 1 - I - 0x0137EC 04:B7DC: 02        .byte $02   ; 
- D 1 - I - 0x0137ED 04:B7DD: BB        .byte $BB   ; 
- D 1 - I - 0x0137EE 04:B7DE: BC        .byte $BC   ; 
- D 1 - I - 0x0137EF 04:B7DF: 07        .byte $07   ; 
- D 1 - I - 0x0137F0 04:B7E0: BD        .byte $BD   ; 
- D 1 - I - 0x0137F1 04:B7E1: BE        .byte $BE   ; 
- D 1 - I - 0x0137F2 04:B7E2: 03        .byte $03   ; 
- D 1 - I - 0x0137F3 04:B7E3: 80        .byte $80   ; 
- D 1 - I - 0x0137F4 04:B7E4: 04        .byte $04   ; 
- D 1 - I - 0x0137F5 04:B7E5: 81        .byte $81   ; 
- D 1 - I - 0x0137F6 04:B7E6: 82        .byte $82   ; 
- D 1 - I - 0x0137F7 04:B7E7: 83        .byte $83   ; 
- D 1 - I - 0x0137F8 04:B7E8: 84        .byte $84   ; 
- D 1 - I - 0x0137F9 04:B7E9: 03        .byte $03   ; 
- D 1 - I - 0x0137FA 04:B7EA: 05        .byte $05   ; 
- D 1 - I - 0x0137FB 04:B7EB: 85        .byte $85   ; 
- D 1 - I - 0x0137FC 04:B7EC: 06        .byte $06   ; 
- D 1 - I - 0x0137FD 04:B7ED: 82        .byte $82   ; 
- D 1 - I - 0x0137FE 04:B7EE: BA        .byte $BA   ; 
- D 1 - I - 0x0137FF 04:B7EF: 02        .byte $02   ; 
- D 1 - I - 0x013800 04:B7F0: BB        .byte $BB   ; 
- D 1 - I - 0x013801 04:B7F1: 86        .byte $86   ; 
- D 1 - I - 0x013802 04:B7F2: 07        .byte $07   ; 
- D 1 - I - 0x013803 04:B7F3: BD        .byte $BD   ; 
- D 1 - I - 0x013804 04:B7F4: 08        .byte $08   ; 
- D 1 - I - 0x013805 04:B7F5: 84        .byte $84   ; 
- D 1 - I - 0x013806 04:B7F6: 80        .byte $80   ; 
- D 1 - I - 0x013807 04:B7F7: 04        .byte $04   ; 
- D 1 - I - 0x013808 04:B7F8: 87        .byte $87   ; 
- D 1 - I - 0x013809 04:B7F9: 06        .byte $06   ; 
- D 1 - I - 0x01380A 04:B7FA: 25        .byte $25   ; 
- D 1 - I - 0x01380B 04:B7FB: A8        .byte $A8   ; 
- D 1 - I - 0x01380C 04:B7FC: 12        .byte $12   ; 
- D 1 - I - 0x01380D 04:B7FD: A9        .byte $A9   ; 
- D 1 - I - 0x01380E 04:B7FE: AA        .byte $AA   ; 
- D 1 - I - 0x01380F 04:B7FF: AB        .byte $AB   ; 
- D 1 - I - 0x013810 04:B800: AC        .byte $AC   ; 
- D 1 - I - 0x013811 04:B801: AD        .byte $AD   ; 
- D 1 - I - 0x013812 04:B802: 24        .byte $24   ; 
- D 1 - I - 0x013813 04:B803: A2        .byte $A2   ; 
- D 1 - I - 0x013814 04:B804: 11        .byte $11   ; 
- D 1 - I - 0x013815 04:B805: A3        .byte $A3   ; 
- D 1 - I - 0x013816 04:B806: 6E        .byte $6E   ; 
- D 1 - I - 0x013817 04:B807: A5        .byte $A5   ; 
- D 1 - I - 0x013818 04:B808: A6        .byte $A6   ; 
- D 1 - I - 0x013819 04:B809: A7        .byte $A7   ; 
- D 1 - I - 0x01381A 04:B80A: 14        .byte $14   ; 
- D 1 - I - 0x01381B 04:B80B: B4        .byte $B4   ; 
- D 1 - I - 0x01381C 04:B80C: 27        .byte $27   ; 
- D 1 - I - 0x01381D 04:B80D: B5        .byte $B5   ; 
- D 1 - I - 0x01381E 04:B80E: B6        .byte $B6   ; 
- D 1 - I - 0x01381F 04:B80F: B7        .byte $B7   ; 
- D 1 - I - 0x013820 04:B810: B8        .byte $B8   ; 
- D 1 - I - 0x013821 04:B811: B9        .byte $B9   ; 
- D 1 - I - 0x013822 04:B812: 13        .byte $13   ; 
- D 1 - I - 0x013823 04:B813: AE        .byte $AE   ; 
- D 1 - I - 0x013824 04:B814: 26        .byte $26   ; 
- D 1 - I - 0x013825 04:B815: AF        .byte $AF   ; 
- D 1 - I - 0x013826 04:B816: B0        .byte $B0   ; 
- D 1 - I - 0x013827 04:B817: B1        .byte $B1   ; 
- D 1 - I - 0x013828 04:B818: B2        .byte $B2   ; 
- D 1 - I - 0x013829 04:B819: 8E        .byte $8E   ; 
- D 1 - I - 0x01382A 04:B81A: 03        .byte $03   ; 
- D 1 - I - 0x01382B 04:B81B: 80        .byte $80   ; 
- D 1 - I - 0x01382C 04:B81C: 04        .byte $04   ; 
- D 1 - I - 0x01382D 04:B81D: 81        .byte $81   ; 
- D 1 - I - 0x01382E 04:B81E: 82        .byte $82   ; 
- D 1 - I - 0x01382F 04:B81F: 83        .byte $83   ; 
- D 1 - I - 0x013830 04:B820: 84        .byte $84   ; 
- D 1 - I - 0x013831 04:B821: 03        .byte $03   ; 
- D 1 - I - 0x013832 04:B822: 05        .byte $05   ; 
- D 1 - I - 0x013833 04:B823: 85        .byte $85   ; 
- D 1 - I - 0x013834 04:B824: 06        .byte $06   ; 
- D 1 - I - 0x013835 04:B825: 82        .byte $82   ; 
- D 1 - I - 0x013836 04:B826: BA        .byte $BA   ; 
- D 1 - I - 0x013837 04:B827: 02        .byte $02   ; 
- D 1 - I - 0x013838 04:B828: BB        .byte $BB   ; 
- D 1 - I - 0x013839 04:B829: 86        .byte $86   ; 
- D 1 - I - 0x01383A 04:B82A: 07        .byte $07   ; 
- D 1 - I - 0x01383B 04:B82B: BD        .byte $BD   ; 
- D 1 - I - 0x01383C 04:B82C: 08        .byte $08   ; 
- D 1 - I - 0x01383D 04:B82D: 84        .byte $84   ; 
- D 1 - I - 0x01383E 04:B82E: 80        .byte $80   ; 
- D 1 - I - 0x01383F 04:B82F: 04        .byte $04   ; 
- D 1 - I - 0x013840 04:B830: 87        .byte $87   ; 
- D 1 - I - 0x013841 04:B831: 06        .byte $06   ; 
- D 1 - I - 0x013842 04:B832: 01        .byte $01   ; 
- D 1 - I - 0x013843 04:B833: BA        .byte $BA   ; 
- D 1 - I - 0x013844 04:B834: 02        .byte $02   ; 
- D 1 - I - 0x013845 04:B835: BB        .byte $BB   ; 
- D 1 - I - 0x013846 04:B836: BC        .byte $BC   ; 
- D 1 - I - 0x013847 04:B837: 07        .byte $07   ; 
- D 1 - I - 0x013848 04:B838: BD        .byte $BD   ; 
- D 1 - I - 0x013849 04:B839: BE        .byte $BE   ; 
- D 1 - I - 0x01384A 04:B83A: 0F        .byte $0F   ; 
- D 1 - I - 0x01384B 04:B83B: 6F        .byte $6F   ; 
- D 1 - I - 0x01384C 04:B83C: 12        .byte $12   ; 
- D 1 - I - 0x01384D 04:B83D: A9        .byte $A9   ; 
- D 1 - I - 0x01384E 04:B83E: 0A        .byte $0A   ; 
- D 1 - I - 0x01384F 04:B83F: 0B        .byte $0B   ; 
- D 1 - I - 0x013850 04:B840: 71        .byte $71   ; 
- D 1 - I - 0x013851 04:B841: AD        .byte $AD   ; 
- - - - - - 0x013852 04:B842: 00        .byte $00   ; 
- - - - - - 0x013853 04:B843: 00        .byte $00   ; 
- - - - - - 0x013854 04:B844: 00        .byte $00   ; 
- - - - - - 0x013855 04:B845: 00        .byte $00   ; 
- - - - - - 0x013856 04:B846: 00        .byte $00   ; 
- - - - - - 0x013857 04:B847: 00        .byte $00   ; 
- - - - - - 0x013858 04:B848: 00        .byte $00   ; 
- - - - - - 0x013859 04:B849: 00        .byte $00   ; 
- D 1 - I - 0x01385A 04:B84A: 14        .byte $14   ; 
- D 1 - I - 0x01385B 04:B84B: B4        .byte $B4   ; 
- D 1 - I - 0x01385C 04:B84C: 17        .byte $17   ; 
- D 1 - I - 0x01385D 04:B84D: 0E        .byte $0E   ; 
- D 1 - I - 0x01385E 04:B84E: B6        .byte $B6   ; 
- D 1 - I - 0x01385F 04:B84F: 91        .byte $91   ; 
- D 1 - I - 0x013860 04:B850: 0C        .byte $0C   ; 
- D 1 - I - 0x013861 04:B851: 0D        .byte $0D   ; 
- - - - - - 0x013862 04:B852: 00        .byte $00   ; 
- - - - - - 0x013863 04:B853: 00        .byte $00   ; 
- - - - - - 0x013864 04:B854: 00        .byte $00   ; 
- - - - - - 0x013865 04:B855: 00        .byte $00   ; 
- - - - - - 0x013866 04:B856: 00        .byte $00   ; 
- - - - - - 0x013867 04:B857: 00        .byte $00   ; 
- - - - - - 0x013868 04:B858: 00        .byte $00   ; 
- - - - - - 0x013869 04:B859: 00        .byte $00   ; 
- D 1 - I - 0x01386A 04:B85A: 28        .byte $28   ; 
- D 1 - I - 0x01386B 04:B85B: 7D        .byte $7D   ; 
- D 1 - I - 0x01386C 04:B85C: 15        .byte $15   ; 
- D 1 - I - 0x01386D 04:B85D: 00        .byte $00   ; 
- D 1 - I - 0x01386E 04:B85E: 29        .byte $29   ; 
- D 1 - I - 0x01386F 04:B85F: 6D        .byte $6D   ; 
- D 1 - I - 0x013870 04:B860: 28        .byte $28   ; 
- D 1 - I - 0x013871 04:B861: 7C        .byte $7C   ; 
- D 1 - I - 0x013872 04:B862: 28        .byte $28   ; 
- D 1 - I - 0x013873 04:B863: 6C        .byte $6C   ; 
- D 1 - I - 0x013874 04:B864: 29        .byte $29   ; 
- D 1 - I - 0x013875 04:B865: 6D        .byte $6D   ; 
- D 1 - I - 0x013876 04:B866: 29        .byte $29   ; 
- D 1 - I - 0x013877 04:B867: 6D        .byte $6D   ; 
- D 1 - I - 0x013878 04:B868: 28        .byte $28   ; 
- D 1 - I - 0x013879 04:B869: 6C        .byte $6C   ; 
- D 1 - I - 0x01387A 04:B86A: 01        .byte $01   ; 
- D 1 - I - 0x01387B 04:B86B: BA        .byte $BA   ; 
- D 1 - I - 0x01387C 04:B86C: 02        .byte $02   ; 
- D 1 - I - 0x01387D 04:B86D: BB        .byte $BB   ; 
- D 1 - I - 0x01387E 04:B86E: 86        .byte $86   ; 
- D 1 - I - 0x01387F 04:B86F: BA        .byte $BA   ; 
- D 1 - I - 0x013880 04:B870: BD        .byte $BD   ; 
- D 1 - I - 0x013881 04:B871: BE        .byte $BE   ; 
- D 1 - I - 0x013882 04:B872: 24        .byte $24   ; 
- D 1 - I - 0x013883 04:B873: A2        .byte $A2   ; 
- D 1 - I - 0x013884 04:B874: 2A        .byte $2A   ; 
- D 1 - I - 0x013885 04:B875: 00        .byte $00   ; 
- D 1 - I - 0x013886 04:B876: 6E        .byte $6E   ; 
- D 1 - I - 0x013887 04:B877: A5        .byte $A5   ; 
- D 1 - I - 0x013888 04:B878: 73        .byte $73   ; 
- D 1 - I - 0x013889 04:B879: 74        .byte $74   ; 
- D 1 - I - 0x01388A 04:B87A: 05        .byte $05   ; 
- D 1 - I - 0x01388B 04:B87B: 85        .byte $85   ; 
- D 1 - I - 0x01388C 04:B87C: 06        .byte $06   ; 
- D 1 - I - 0x01388D 04:B87D: 41        .byte $41   ; 
- D 1 - I - 0x01388E 04:B87E: BA        .byte $BA   ; 
- D 1 - I - 0x01388F 04:B87F: 02        .byte $02   ; 
- D 1 - I - 0x013890 04:B880: 40        .byte $40   ; 
- D 1 - I - 0x013891 04:B881: 00        .byte $00   ; 
- D 1 - I - 0x013892 04:B882: 23        .byte $23   ; 
- D 1 - I - 0x013893 04:B883: 9A        .byte $9A   ; 
- D 1 - I - 0x013894 04:B884: 26        .byte $26   ; 
- D 1 - I - 0x013895 04:B885: AF        .byte $AF   ; 
- D 1 - I - 0x013896 04:B886: 31        .byte $31   ; 
- D 1 - I - 0x013897 04:B887: 92        .byte $92   ; 
- D 1 - I - 0x013898 04:B888: B2        .byte $B2   ; 
- D 1 - I - 0x013899 04:B889: 8E        .byte $8E   ; 
- D 1 - I - 0x01389A 04:B88A: 10        .byte $10   ; 
- D 1 - I - 0x01389B 04:B88B: 9C        .byte $9C   ; 
- D 1 - I - 0x01389C 04:B88C: 2D        .byte $2D   ; 
- D 1 - I - 0x01389D 04:B88D: 8C        .byte $8C   ; 
- D 1 - I - 0x01389E 04:B88E: 9B        .byte $9B   ; 
- D 1 - I - 0x01389F 04:B88F: 8C        .byte $8C   ; 
- D 1 - I - 0x0138A0 04:B890: 2C        .byte $2C   ; 
- D 1 - I - 0x0138A1 04:B891: 8D        .byte $8D   ; 
- D 1 - I - 0x0138A2 04:B892: 2C        .byte $2C   ; 
- D 1 - I - 0x0138A3 04:B893: 8D        .byte $8D   ; 
- D 1 - I - 0x0138A4 04:B894: 2B        .byte $2B   ; 
- D 1 - I - 0x0138A5 04:B895: 8C        .byte $8C   ; 
- D 1 - I - 0x0138A6 04:B896: 2B        .byte $2B   ; 
- D 1 - I - 0x0138A7 04:B897: 8C        .byte $8C   ; 
- D 1 - I - 0x0138A8 04:B898: 2C        .byte $2C   ; 
- D 1 - I - 0x0138A9 04:B899: 8D        .byte $8D   ; 
- D 1 - I - 0x0138AA 04:B89A: 2E        .byte $2E   ; 
- D 1 - I - 0x0138AB 04:B89B: 6B        .byte $6B   ; 
- D 1 - I - 0x0138AC 04:B89C: 29        .byte $29   ; 
- D 1 - I - 0x0138AD 04:B89D: 6D        .byte $6D   ; 
- D 1 - I - 0x0138AE 04:B89E: 28        .byte $28   ; 
- D 1 - I - 0x0138AF 04:B89F: 6C        .byte $6C   ; 
- D 1 - I - 0x0138B0 04:B8A0: 2E        .byte $2E   ; 
- D 1 - I - 0x0138B1 04:B8A1: 6B        .byte $6B   ; 
- D 1 - I - 0x0138B2 04:B8A2: 29        .byte $29   ; 
- D 1 - I - 0x0138B3 04:B8A3: 6D        .byte $6D   ; 
- D 1 - I - 0x0138B4 04:B8A4: 24        .byte $24   ; 
- D 1 - I - 0x0138B5 04:B8A5: A2        .byte $A2   ; 
- D 1 - I - 0x0138B6 04:B8A6: 2E        .byte $2E   ; 
- D 1 - I - 0x0138B7 04:B8A7: 6B        .byte $6B   ; 
- D 1 - I - 0x0138B8 04:B8A8: 6E        .byte $6E   ; 
- D 1 - I - 0x0138B9 04:B8A9: A5        .byte $A5   ; 
- D 1 - I - 0x0138BA 04:B8AA: 24        .byte $24   ; 
- D 1 - I - 0x0138BB 04:B8AB: A2        .byte $A2   ; 
- D 1 - I - 0x0138BC 04:B8AC: 2F        .byte $2F   ; 
- D 1 - I - 0x0138BD 04:B8AD: 74        .byte $74   ; 
- D 1 - I - 0x0138BE 04:B8AE: 6E        .byte $6E   ; 
- D 1 - I - 0x0138BF 04:B8AF: A5        .byte $A5   ; 
- D 1 - I - 0x0138C0 04:B8B0: 73        .byte $73   ; 
- D 1 - I - 0x0138C1 04:B8B1: 75        .byte $75   ; 
- D 1 - I - 0x0138C2 04:B8B2: 16        .byte $16   ; 
- D 1 - I - 0x0138C3 04:B8B3: 6F        .byte $6F   ; 
- D 1 - I - 0x0138C4 04:B8B4: 12        .byte $12   ; 
- D 1 - I - 0x0138C5 04:B8B5: 78        .byte $78   ; 
- D 1 - I - 0x0138C6 04:B8B6: A6        .byte $A6   ; 
- D 1 - I - 0x0138C7 04:B8B7: 70        .byte $70   ; 
- D 1 - I - 0x0138C8 04:B8B8: 71        .byte $71   ; 
- D 1 - I - 0x0138C9 04:B8B9: AD        .byte $AD   ; 
- D 1 - I - 0x0138CA 04:B8BA: 31        .byte $31   ; 
- D 1 - I - 0x0138CB 04:B8BB: 94        .byte $94   ; 
- D 1 - I - 0x0138CC 04:B8BC: 26        .byte $26   ; 
- D 1 - I - 0x0138CD 04:B8BD: AF        .byte $AF   ; 
- D 1 - I - 0x0138CE 04:B8BE: 95        .byte $95   ; 
- D 1 - I - 0x0138CF 04:B8BF: 92        .byte $92   ; 
- D 1 - I - 0x0138D0 04:B8C0: B2        .byte $B2   ; 
- D 1 - I - 0x0138D1 04:B8C1: 8E        .byte $8E   ; 
- D 1 - I - 0x0138D2 04:B8C2: 18        .byte $18   ; 
- D 1 - I - 0x0138D3 04:B8C3: B4        .byte $B4   ; 
- D 1 - I - 0x0138D4 04:B8C4: 17        .byte $17   ; 
- D 1 - I - 0x0138D5 04:B8C5: 8F        .byte $8F   ; 
- D 1 - I - 0x0138D6 04:B8C6: B6        .byte $B6   ; 
- D 1 - I - 0x0138D7 04:B8C7: 91        .byte $91   ; 
- D 1 - I - 0x0138D8 04:B8C8: 90        .byte $90   ; 
- D 1 - I - 0x0138D9 04:B8C9: B1        .byte $B1   ; 
- D 1 - I - 0x0138DA 04:B8CA: 2C        .byte $2C   ; 
- D 1 - I - 0x0138DB 04:B8CB: 8D        .byte $8D   ; 
- D 1 - I - 0x0138DC 04:B8CC: 30        .byte $30   ; 
- D 1 - I - 0x0138DD 04:B8CD: 8B        .byte $8B   ; 
- D 1 - I - 0x0138DE 04:B8CE: 30        .byte $30   ; 
- D 1 - I - 0x0138DF 04:B8CF: 8B        .byte $8B   ; 
- D 1 - I - 0x0138E0 04:B8D0: 2B        .byte $2B   ; 
- D 1 - I - 0x0138E1 04:B8D1: 8C        .byte $8C   ; 
- D 1 - I - 0x0138E2 04:B8D2: 26        .byte $26   ; 
- D 1 - I - 0x0138E3 04:B8D3: AF        .byte $AF   ; 
- D 1 - I - 0x0138E4 04:B8D4: 2C        .byte $2C   ; 
- D 1 - I - 0x0138E5 04:B8D5: 8D        .byte $8D   ; 
- D 1 - I - 0x0138E6 04:B8D6: B2        .byte $B2   ; 
- D 1 - I - 0x0138E7 04:B8D7: 8E        .byte $8E   ; 
- D 1 - I - 0x0138E8 04:B8D8: 30        .byte $30   ; 
- D 1 - I - 0x0138E9 04:B8D9: 8B        .byte $8B   ; 
- D 1 - I - 0x0138EA 04:B8DA: 24        .byte $24   ; 
- D 1 - I - 0x0138EB 04:B8DB: A2        .byte $A2   ; 
- D 1 - I - 0x0138EC 04:B8DC: 16        .byte $16   ; 
- D 1 - I - 0x0138ED 04:B8DD: 6F        .byte $6F   ; 
- D 1 - I - 0x0138EE 04:B8DE: A4        .byte $A4   ; 
- D 1 - I - 0x0138EF 04:B8DF: A5        .byte $A5   ; 
- D 1 - I - 0x0138F0 04:B8E0: A6        .byte $A6   ; 
- D 1 - I - 0x0138F1 04:B8E1: 70        .byte $70   ; 
- D 1 - I - 0x0138F2 04:B8E2: 25        .byte $25   ; 
- D 1 - I - 0x0138F3 04:B8E3: A8        .byte $A8   ; 
- D 1 - I - 0x0138F4 04:B8E4: 12        .byte $12   ; 
- D 1 - I - 0x0138F5 04:B8E5: 72        .byte $72   ; 
- D 1 - I - 0x0138F6 04:B8E6: AA        .byte $AA   ; 
- D 1 - I - 0x0138F7 04:B8E7: AB        .byte $AB   ; 
- D 1 - I - 0x0138F8 04:B8E8: AC        .byte $AC   ; 
- D 1 - I - 0x0138F9 04:B8E9: AD        .byte $AD   ; 
- D 1 - I - 0x0138FA 04:B8EA: 12        .byte $12   ; 
- D 1 - I - 0x0138FB 04:B8EB: 72        .byte $72   ; 
- D 1 - I - 0x0138FC 04:B8EC: 00        .byte $00   ; 
- D 1 - I - 0x0138FD 04:B8ED: 3E        .byte $3E   ; 
- D 1 - I - 0x0138FE 04:B8EE: 71        .byte $71   ; 
- D 1 - I - 0x0138FF 04:B8EF: AD        .byte $AD   ; 
- D 1 - I - 0x013900 04:B8F0: 3E        .byte $3E   ; 
- D 1 - I - 0x013901 04:B8F1: BE        .byte $BE   ; 
- D 1 - I - 0x013902 04:B8F2: 00        .byte $00   ; 
- D 1 - I - 0x013903 04:B8F3: 3E        .byte $3E   ; 
- D 1 - I - 0x013904 04:B8F4: 04        .byte $04   ; 
- D 1 - I - 0x013905 04:B8F5: 81        .byte $81   ; 
- D 1 - I - 0x013906 04:B8F6: 00        .byte $00   ; 
- D 1 - I - 0x013907 04:B8F7: 83        .byte $83   ; 
- D 1 - I - 0x013908 04:B8F8: 84        .byte $84   ; 
- D 1 - I - 0x013909 04:B8F9: 03        .byte $03   ; 
- D 1 - I - 0x01390A 04:B8FA: 03        .byte $03   ; 
- D 1 - I - 0x01390B 04:B8FB: 00        .byte $00   ; 
- D 1 - I - 0x01390C 04:B8FC: 19        .byte $19   ; 
- D 1 - I - 0x01390D 04:B8FD: B4        .byte $B4   ; 
- D 1 - I - 0x01390E 04:B8FE: BA        .byte $BA   ; 
- D 1 - I - 0x01390F 04:B8FF: 3F        .byte $3F   ; 
- D 1 - I - 0x013910 04:B900: B6        .byte $B6   ; 
- D 1 - I - 0x013911 04:B901: 91        .byte $91   ; 
- D 1 - I - 0x013912 04:B902: 07        .byte $07   ; 
- D 1 - I - 0x013913 04:B903: BD        .byte $BD   ; 
- D 1 - I - 0x013914 04:B904: 03        .byte $03   ; 
- D 1 - I - 0x013915 04:B905: 00        .byte $00   ; 
- D 1 - I - 0x013916 04:B906: 80        .byte $80   ; 
- D 1 - I - 0x013917 04:B907: 04        .byte $04   ; 
- D 1 - I - 0x013918 04:B908: 87        .byte $87   ; 
- D 1 - I - 0x013919 04:B909: 3F        .byte $3F   ; 
- D 1 - I - 0x01391A 04:B90A: 17        .byte $17   ; 
- D 1 - I - 0x01391B 04:B90B: 8F        .byte $8F   ; 
- D 1 - I - 0x01391C 04:B90C: 26        .byte $26   ; 
- D 1 - I - 0x01391D 04:B90D: AF        .byte $AF   ; 
- D 1 - I - 0x01391E 04:B90E: 90        .byte $90   ; 
- D 1 - I - 0x01391F 04:B90F: B1        .byte $B1   ; 
- D 1 - I - 0x013920 04:B910: B2        .byte $B2   ; 
- D 1 - I - 0x013921 04:B911: B3        .byte $B3   ; 
- D 1 - I - 0x013922 04:B912: 19        .byte $19   ; 
- D 1 - I - 0x013923 04:B913: B4        .byte $B4   ; 
- D 1 - I - 0x013924 04:B914: 27        .byte $27   ; 
- D 1 - I - 0x013925 04:B915: B5        .byte $B5   ; 
- D 1 - I - 0x013926 04:B916: B6        .byte $B6   ; 
- D 1 - I - 0x013927 04:B917: B7        .byte $B7   ; 
- D 1 - I - 0x013928 04:B918: B8        .byte $B8   ; 
- D 1 - I - 0x013929 04:B919: B9        .byte $B9   ; 
- D 1 - I - 0x01392A 04:B91A: 00        .byte $00   ; 
- D 1 - I - 0x01392B 04:B91B: 00        .byte $00   ; 
- D 1 - I - 0x01392C 04:B91C: 00        .byte $00   ; 
- D 1 - I - 0x01392D 04:B91D: 00        .byte $00   ; 
- D 1 - I - 0x01392E 04:B91E: 87        .byte $87   ; 
- D 1 - I - 0x01392F 04:B91F: 3E        .byte $3E   ; 
- D 1 - I - 0x013930 04:B920: 3F        .byte $3F   ; 
- D 1 - I - 0x013931 04:B921: 3F        .byte $3F   ; 
- D 1 - I - 0x013932 04:B922: 03        .byte $03   ; 
- D 1 - I - 0x013933 04:B923: 80        .byte $80   ; 
- D 1 - I - 0x013934 04:B924: 04        .byte $04   ; 
- D 1 - I - 0x013935 04:B925: 81        .byte $81   ; 
- D 1 - I - 0x013936 04:B926: 82        .byte $82   ; 
- D 1 - I - 0x013937 04:B927: 83        .byte $83   ; 
- D 1 - I - 0x013938 04:B928: 84        .byte $84   ; 
- D 1 - I - 0x013939 04:B929: 03        .byte $03   ; 
- D 1 - I - 0x01393A 04:B92A: 32        .byte $32   ; 
- D 1 - I - 0x01393B 04:B92B: 8B        .byte $8B   ; 
- D 1 - I - 0x01393C 04:B92C: 33        .byte $33   ; 
- D 1 - I - 0x01393D 04:B92D: 34        .byte $34   ; 
- D 1 - I - 0x01393E 04:B92E: 8D        .byte $8D   ; 
- D 1 - I - 0x01393F 04:B92F: 33        .byte $33   ; 
- D 1 - I - 0x013940 04:B930: 8E        .byte $8E   ; 
- D 1 - I - 0x013941 04:B931: 8F        .byte $8F   ; 
- D 1 - I - 0x013942 04:B932: 23        .byte $23   ; 
- D 1 - I - 0x013943 04:B933: 8E        .byte $8E   ; 
- D 1 - I - 0x013944 04:B934: 37        .byte $37   ; 
- D 1 - I - 0x013945 04:B935: 38        .byte $38   ; 
- D 1 - I - 0x013946 04:B936: 00        .byte $00   ; 
- D 1 - I - 0x013947 04:B937: 91        .byte $91   ; 
- D 1 - I - 0x013948 04:B938: 92        .byte $92   ; 
- D 1 - I - 0x013949 04:B939: 93        .byte $93   ; 
- D 1 - I - 0x01394A 04:B93A: 34        .byte $34   ; 
- D 1 - I - 0x01394B 04:B93B: 34        .byte $34   ; 
- D 1 - I - 0x01394C 04:B93C: 34        .byte $34   ; 
- D 1 - I - 0x01394D 04:B93D: 34        .byte $34   ; 
- D 1 - I - 0x01394E 04:B93E: 8F        .byte $8F   ; 
- D 1 - I - 0x01394F 04:B93F: DD        .byte $DD   ; 
- D 1 - I - 0x013950 04:B940: DD        .byte $DD   ; 
- D 1 - I - 0x013951 04:B941: 8F        .byte $8F   ; 
- D 1 - I - 0x013952 04:B942: 38        .byte $38   ; 
- D 1 - I - 0x013953 04:B943: 37        .byte $37   ; 
- D 1 - I - 0x013954 04:B944: 37        .byte $37   ; 
- D 1 - I - 0x013955 04:B945: 38        .byte $38   ; 
- D 1 - I - 0x013956 04:B946: 94        .byte $94   ; 
- D 1 - I - 0x013957 04:B947: 95        .byte $95   ; 
- D 1 - I - 0x013958 04:B948: 92        .byte $92   ; 
- D 1 - I - 0x013959 04:B949: 93        .byte $93   ; 
- D 1 - I - 0x01395A 04:B94A: 34        .byte $34   ; 
- D 1 - I - 0x01395B 04:B94B: 8C        .byte $8C   ; 
- D 1 - I - 0x01395C 04:B94C: 35        .byte $35   ; 
- D 1 - I - 0x01395D 04:B94D: 2C        .byte $2C   ; 
- D 1 - I - 0x01395E 04:B94E: 8F        .byte $8F   ; 
- D 1 - I - 0x01395F 04:B94F: 36        .byte $36   ; 
- D 1 - I - 0x013960 04:B950: 8C        .byte $8C   ; 
- D 1 - I - 0x013961 04:B951: 90        .byte $90   ; 
- D 1 - I - 0x013962 04:B952: 38        .byte $38   ; 
- D 1 - I - 0x013963 04:B953: 37        .byte $37   ; 
- D 1 - I - 0x013964 04:B954: 36        .byte $36   ; 
- D 1 - I - 0x013965 04:B955: 00        .byte $00   ; 
- D 1 - I - 0x013966 04:B956: 94        .byte $94   ; 
- D 1 - I - 0x013967 04:B957: 95        .byte $95   ; 
- D 1 - I - 0x013968 04:B958: 96        .byte $96   ; 
- D 1 - I - 0x013969 04:B959: 00        .byte $00   ; 
- D 1 - I - 0x01396A 04:B95A: 17        .byte $17   ; 
- D 1 - I - 0x01396B 04:B95B: 97        .byte $97   ; 
- D 1 - I - 0x01396C 04:B95C: 18        .byte $18   ; 
- D 1 - I - 0x01396D 04:B95D: 98        .byte $98   ; 
- D 1 - I - 0x01396E 04:B95E: 9A        .byte $9A   ; 
- D 1 - I - 0x01396F 04:B95F: 9B        .byte $9B   ; 
- D 1 - I - 0x013970 04:B960: 9C        .byte $9C   ; 
- D 1 - I - 0x013971 04:B961: 9D        .byte $9D   ; 
- D 1 - I - 0x013972 04:B962: 10        .byte $10   ; 
- D 1 - I - 0x013973 04:B963: 89        .byte $89   ; 
- D 1 - I - 0x013974 04:B964: 1A        .byte $1A   ; 
- D 1 - I - 0x013975 04:B965: A3        .byte $A3   ; 
- D 1 - I - 0x013976 04:B966: 00        .byte $00   ; 
- D 1 - I - 0x013977 04:B967: 00        .byte $00   ; 
- D 1 - I - 0x013978 04:B968: 00        .byte $00   ; 
- D 1 - I - 0x013979 04:B969: A8        .byte $A8   ; 
- D 1 - I - 0x01397A 04:B96A: 18        .byte $18   ; 
- D 1 - I - 0x01397B 04:B96B: 98        .byte $98   ; 
- D 1 - I - 0x01397C 04:B96C: 18        .byte $18   ; 
- D 1 - I - 0x01397D 04:B96D: 98        .byte $98   ; 
- D 1 - I - 0x01397E 04:B96E: 9E        .byte $9E   ; 
- D 1 - I - 0x01397F 04:B96F: 9D        .byte $9D   ; 
- D 1 - I - 0x013980 04:B970: 9E        .byte $9E   ; 
- D 1 - I - 0x013981 04:B971: 9D        .byte $9D   ; 
- D 1 - I - 0x013982 04:B972: 1B        .byte $1B   ; 
- D 1 - I - 0x013983 04:B973: A3        .byte $A3   ; 
- D 1 - I - 0x013984 04:B974: 1B        .byte $1B   ; 
- D 1 - I - 0x013985 04:B975: A3        .byte $A3   ; 
- D 1 - I - 0x013986 04:B976: A9        .byte $A9   ; 
- D 1 - I - 0x013987 04:B977: A8        .byte $A8   ; 
- D 1 - I - 0x013988 04:B978: A9        .byte $A9   ; 
- D 1 - I - 0x013989 04:B979: A8        .byte $A8   ; 
- D 1 - I - 0x01398A 04:B97A: 18        .byte $18   ; 
- D 1 - I - 0x01398B 04:B97B: 98        .byte $98   ; 
- D 1 - I - 0x01398C 04:B97C: 19        .byte $19   ; 
- D 1 - I - 0x01398D 04:B97D: 99        .byte $99   ; 
- D 1 - I - 0x01398E 04:B97E: 9E        .byte $9E   ; 
- D 1 - I - 0x01398F 04:B97F: 9F        .byte $9F   ; 
- D 1 - I - 0x013990 04:B980: A0        .byte $A0   ; 
- D 1 - I - 0x013991 04:B981: A1        .byte $A1   ; 
- D 1 - I - 0x013992 04:B982: 1B        .byte $1B   ; 
- D 1 - I - 0x013993 04:B983: A7        .byte $A7   ; 
- D 1 - I - 0x013994 04:B984: 8A        .byte $8A   ; 
- D 1 - I - 0x013995 04:B985: 00        .byte $00   ; 
- D 1 - I - 0x013996 04:B986: A9        .byte $A9   ; 
- D 1 - I - 0x013997 04:B987: 00        .byte $00   ; 
- D 1 - I - 0x013998 04:B988: 00        .byte $00   ; 
- D 1 - I - 0x013999 04:B989: 00        .byte $00   ; 



_off007_0x01399A_05_area_6:
- D 1 - I - 0x01399A 04:B98A: 00        .byte $00   ; 
- D 1 - I - 0x01399B 04:B98B: 55        .byte $55   ; 
- D 1 - I - 0x01399C 04:B98C: 00        .byte $00   ; 
- D 1 - I - 0x01399D 04:B98D: 00        .byte $00   ; 
- D 1 - I - 0x01399E 04:B98E: 00        .byte $00   ; 
- D 1 - I - 0x01399F 04:B98F: 00        .byte $00   ; 
- D 1 - I - 0x0139A0 04:B990: 00        .byte $00   ; 
- D 1 - I - 0x0139A1 04:B991: 00        .byte $00   ; 
- D 1 - I - 0x0139A2 04:B992: 55        .byte $55   ; 
- D 1 - I - 0x0139A3 04:B993: 55        .byte $55   ; 
- D 1 - I - 0x0139A4 04:B994: 55        .byte $55   ; 
- D 1 - I - 0x0139A5 04:B995: 55        .byte $55   ; 
- D 1 - I - 0x0139A6 04:B996: 00        .byte $00   ; 
- D 1 - I - 0x0139A7 04:B997: 00        .byte $00   ; 
- D 1 - I - 0x0139A8 04:B998: 00        .byte $00   ; 
- D 1 - I - 0x0139A9 04:B999: 00        .byte $00   ; 
- D 1 - I - 0x0139AA 04:B99A: 00        .byte $00   ; 
- D 1 - I - 0x0139AB 04:B99B: 00        .byte $00   ; 
- D 1 - I - 0x0139AC 04:B99C: 00        .byte $00   ; 
- D 1 - I - 0x0139AD 04:B99D: 00        .byte $00   ; 
- D 1 - I - 0x0139AE 04:B99E: 00        .byte $00   ; 
- D 1 - I - 0x0139AF 04:B99F: 00        .byte $00   ; 
- D 1 - I - 0x0139B0 04:B9A0: 00        .byte $00   ; 
- D 1 - I - 0x0139B1 04:B9A1: 00        .byte $00   ; 
- D 1 - I - 0x0139B2 04:B9A2: 00        .byte $00   ; 
- D 1 - I - 0x0139B3 04:B9A3: 00        .byte $00   ; 
- D 1 - I - 0x0139B4 04:B9A4: 00        .byte $00   ; 
- D 1 - I - 0x0139B5 04:B9A5: 00        .byte $00   ; 
- D 1 - I - 0x0139B6 04:B9A6: 00        .byte $00   ; 
- D 1 - I - 0x0139B7 04:B9A7: 00        .byte $00   ; 
- D 1 - I - 0x0139B8 04:B9A8: 55        .byte $55   ; 
- D 1 - I - 0x0139B9 04:B9A9: 55        .byte $55   ; 
- D 1 - I - 0x0139BA 04:B9AA: 55        .byte $55   ; 
- D 1 - I - 0x0139BB 04:B9AB: 55        .byte $55   ; 
- D 1 - I - 0x0139BC 04:B9AC: 55        .byte $55   ; 
- D 1 - I - 0x0139BD 04:B9AD: 55        .byte $55   ; 
- D 1 - I - 0x0139BE 04:B9AE: 55        .byte $55   ; 
- D 1 - I - 0x0139BF 04:B9AF: 55        .byte $55   ; 
- D 1 - I - 0x0139C0 04:B9B0: 55        .byte $55   ; 
- D 1 - I - 0x0139C1 04:B9B1: 55        .byte $55   ; 
- D 1 - I - 0x0139C2 04:B9B2: 55        .byte $55   ; 
- D 1 - I - 0x0139C3 04:B9B3: 00        .byte $00   ; 
- D 1 - I - 0x0139C4 04:B9B4: 00        .byte $00   ; 
- D 1 - I - 0x0139C5 04:B9B5: 55        .byte $55   ; 
- D 1 - I - 0x0139C6 04:B9B6: 11        .byte $11   ; 
- D 1 - I - 0x0139C7 04:B9B7: 00        .byte $00   ; 
- D 1 - I - 0x0139C8 04:B9B8: 00        .byte $00   ; 
- D 1 - I - 0x0139C9 04:B9B9: 44        .byte $44   ; 
- D 1 - I - 0x0139CA 04:B9BA: 51        .byte $51   ; 
- D 1 - I - 0x0139CB 04:B9BB: 00        .byte $00   ; 
- D 1 - I - 0x0139CC 04:B9BC: 00        .byte $00   ; 
- D 1 - I - 0x0139CD 04:B9BD: 54        .byte $54   ; 
- D 1 - I - 0x0139CE 04:B9BE: 00        .byte $00   ; 
- D 1 - I - 0x0139CF 04:B9BF: 00        .byte $00   ; 
- D 1 - I - 0x0139D0 04:B9C0: 00        .byte $00   ; 
- D 1 - I - 0x0139D1 04:B9C1: 00        .byte $00   ; 
- D 1 - I - 0x0139D2 04:B9C2: 00        .byte $00   ; 
- D 1 - I - 0x0139D3 04:B9C3: 00        .byte $00   ; 
- D 1 - I - 0x0139D4 04:B9C4: 00        .byte $00   ; 
- D 1 - I - 0x0139D5 04:B9C5: 00        .byte $00   ; 
- D 1 - I - 0x0139D6 04:B9C6: 00        .byte $00   ; 
- D 1 - I - 0x0139D7 04:B9C7: 00        .byte $00   ; 
- D 1 - I - 0x0139D8 04:B9C8: 00        .byte $00   ; 
- D 1 - I - 0x0139D9 04:B9C9: 00        .byte $00   ; 
- D 1 - I - 0x0139DA 04:B9CA: 00        .byte $00   ; 
- D 1 - I - 0x0139DB 04:B9CB: 00        .byte $00   ; 
- D 1 - I - 0x0139DC 04:B9CC: 00        .byte $00   ; 
- D 1 - I - 0x0139DD 04:B9CD: 00        .byte $00   ; 
- D 1 - I - 0x0139DE 04:B9CE: 00        .byte $00   ; 
- D 1 - I - 0x0139DF 04:B9CF: 00        .byte $00   ; 
- D 1 - I - 0x0139E0 04:B9D0: 00        .byte $00   ; 
- D 1 - I - 0x0139E1 04:B9D1: 00        .byte $00   ; 
- D 1 - I - 0x0139E2 04:B9D2: 00        .byte $00   ; 
- D 1 - I - 0x0139E3 04:B9D3: 00        .byte $00   ; 
- D 1 - I - 0x0139E4 04:B9D4: 00        .byte $00   ; 
- D 1 - I - 0x0139E5 04:B9D5: 00        .byte $00   ; 
- D 1 - I - 0x0139E6 04:B9D6: 00        .byte $00   ; 
- D 1 - I - 0x0139E7 04:B9D7: 00        .byte $00   ; 
- D 1 - I - 0x0139E8 04:B9D8: 00        .byte $00   ; 
- D 1 - I - 0x0139E9 04:B9D9: 00        .byte $00   ; 
- D 1 - I - 0x0139EA 04:B9DA: 00        .byte $00   ; 
- D 1 - I - 0x0139EB 04:B9DB: 44        .byte $44   ; 
- D 1 - I - 0x0139EC 04:B9DC: 11        .byte $11   ; 
- D 1 - I - 0x0139ED 04:B9DD: 00        .byte $00   ; 
- D 1 - I - 0x0139EE 04:B9DE: CC        .byte $CC   ; 
- D 1 - I - 0x0139EF 04:B9DF: 44        .byte $44   ; 
- D 1 - I - 0x0139F0 04:B9E0: 11        .byte $11   ; 
- D 1 - I - 0x0139F1 04:B9E1: 33        .byte $33   ; 
- D 1 - I - 0x0139F2 04:B9E2: C0        .byte $C0   ; 
- D 1 - I - 0x0139F3 04:B9E3: 44        .byte $44   ; 
- D 1 - I - 0x0139F4 04:B9E4: 11        .byte $11   ; 
- D 1 - I - 0x0139F5 04:B9E5: 30        .byte $30   ; 
- D 1 - I - 0x0139F6 04:B9E6: 0C        .byte $0C   ; 
- D 1 - I - 0x0139F7 04:B9E7: 44        .byte $44   ; 
- D 1 - I - 0x0139F8 04:B9E8: 11        .byte $11   ; 
- D 1 - I - 0x0139F9 04:B9E9: 03        .byte $03   ; 
- D 1 - I - 0x0139FA 04:B9EA: 00        .byte $00   ; 
- D 1 - I - 0x0139FB 04:B9EB: 44        .byte $44   ; 
- D 1 - I - 0x0139FC 04:B9EC: 11        .byte $11   ; 
- D 1 - I - 0x0139FD 04:B9ED: 00        .byte $00   ; 
- D 1 - I - 0x0139FE 04:B9EE: 04        .byte $04   ; 
- D 1 - I - 0x0139FF 04:B9EF: 05        .byte $05   ; 
- D 1 - I - 0x013A00 04:B9F0: 05        .byte $05   ; 
- D 1 - I - 0x013A01 04:B9F1: 01        .byte $01   ; 
- D 1 - I - 0x013A02 04:B9F2: 05        .byte $05   ; 
- D 1 - I - 0x013A03 04:B9F3: 01        .byte $01   ; 
- D 1 - I - 0x013A04 04:B9F4: 04        .byte $04   ; 
- D 1 - I - 0x013A05 04:B9F5: 05        .byte $05   ; 
- D 1 - I - 0x013A06 04:B9F6: 00        .byte $00   ; 
- D 1 - I - 0x013A07 04:B9F7: 00        .byte $00   ; 
- D 1 - I - 0x013A08 04:B9F8: 00        .byte $00   ; 
- D 1 - I - 0x013A09 04:B9F9: 00        .byte $00   ; 
- D 1 - I - 0x013A0A 04:B9FA: 01        .byte $01   ; 
- D 1 - I - 0x013A0B 04:B9FB: 04        .byte $04   ; 
- D 1 - I - 0x013A0C 04:B9FC: 00        .byte $00   ; 
- D 1 - I - 0x013A0D 04:B9FD: 00        .byte $00   ; 
- D 1 - I - 0x013A0E 04:B9FE: 00        .byte $00   ; 
- D 1 - I - 0x013A0F 04:B9FF: 00        .byte $00   ; 
- D 1 - I - 0x013A10 04:BA00: 00        .byte $00   ; 
- D 1 - I - 0x013A11 04:BA01: 00        .byte $00   ; 
- D 1 - I - 0x013A12 04:BA02: 55        .byte $55   ; 
- D 1 - I - 0x013A13 04:BA03: 55        .byte $55   ; 
- D 1 - I - 0x013A14 04:BA04: 00        .byte $00   ; 
- D 1 - I - 0x013A15 04:BA05: 00        .byte $00   ; 
- D 1 - I - 0x013A16 04:BA06: 55        .byte $55   ; 
- D 1 - I - 0x013A17 04:BA07: 55        .byte $55   ; 
- D 1 - I - 0x013A18 04:BA08: 00        .byte $00   ; 
- D 1 - I - 0x013A19 04:BA09: 00        .byte $00   ; 
- D 1 - I - 0x013A1A 04:BA0A: 00        .byte $00   ; 
- D 1 - I - 0x013A1B 04:BA0B: 05        .byte $05   ; 
- D 1 - I - 0x013A1C 04:BA0C: 05        .byte $05   ; 
- D 1 - I - 0x013A1D 04:BA0D: 00        .byte $00   ; 
- D 1 - I - 0x013A1E 04:BA0E: 00        .byte $00   ; 
- D 1 - I - 0x013A1F 04:BA0F: 00        .byte $00   ; 
- D 1 - I - 0x013A20 04:BA10: 00        .byte $00   ; 
- D 1 - I - 0x013A21 04:BA11: 00        .byte $00   ; 
- D 1 - I - 0x013A22 04:BA12: 00        .byte $00   ; 
- D 1 - I - 0x013A23 04:BA13: 54        .byte $54   ; 
- D 1 - I - 0x013A24 04:BA14: 51        .byte $51   ; 
- D 1 - I - 0x013A25 04:BA15: 00        .byte $00   ; 
- D 1 - I - 0x013A26 04:BA16: 55        .byte $55   ; 
- D 1 - I - 0x013A27 04:BA17: C0        .byte $C0   ; 
- D 1 - I - 0x013A28 04:BA18: F0        .byte $F0   ; 
- D 1 - I - 0x013A29 04:BA19: 30        .byte $30   ; 
- D 1 - I - 0x013A2A 04:BA1A: 00        .byte $00   ; 
- D 1 - I - 0x013A2B 04:BA1B: 00        .byte $00   ; 
- D 1 - I - 0x013A2C 04:BA1C: 00        .byte $00   ; 
- - - - - - 0x013A2D 04:BA1D: 00        .byte $00   ; 
- - - - - - 0x013A2E 04:BA1E: 00        .byte $00   ; 
- - - - - - 0x013A2F 04:BA1F: 00        .byte $00   ; 
- - - - - - 0x013A30 04:BA20: 00        .byte $00   ; 
- - - - - - 0x013A31 04:BA21: 00        .byte $00   ; 
- - - - - - 0x013A32 04:BA22: 00        .byte $00   ; 
- - - - - - 0x013A33 04:BA23: 00        .byte $00   ; 
- - - - - - 0x013A34 04:BA24: 00        .byte $00   ; 
- - - - - - 0x013A35 04:BA25: 00        .byte $00   ; 
- - - - - - 0x013A36 04:BA26: 00        .byte $00   ; 
- - - - - - 0x013A37 04:BA27: 00        .byte $00   ; 
- - - - - - 0x013A38 04:BA28: 00        .byte $00   ; 
- - - - - - 0x013A39 04:BA29: 00        .byte $00   ; 


.out .sprintf("Free bytes in bank 38: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_38b"
- - - - - - 0x01400F 04:BFFF: 39        .byte con_prg_bank + $39   ; 



