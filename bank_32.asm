.segment "BANK_32"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x024010-0x02600F



.export _off001_0x004C14_26_hidden_rifleman
.export _off001_0x004CEA_27_cannon_hidden_3
.export _off001_0x004DFF_28_cannon_howitzer
.export _off001_0x004EDF_29_bullet_cannon_howitzer
.export _off001_0x004F73_3F_earthquake
.export _off001_0x0051D0_3A_bullet_robospider
.export _off001_0x005216_4E_robospider
.export _off001_0x0059D2_4B_boss_3_ball_center
.export _off001_0x005BEE_50_boss_3_ball_violet



; bzk this byte must be placed at 8000
- D 0 - - - 0x004010 01:8000: 32        .byte con_prg_bank + $32   ; 



_off001_0x004C14_26_hidden_rifleman:
- D 0 - I - 0x004C14 01:8C04: 16 8C     .word ofs_038_26_8C16_01_initialize_object ; 
- D 0 - I - 0x004C16 01:8C06: 2C 8C     .word ofs_038_26_8C2C_02 ; 
- D 0 - I - 0x004C18 01:8C08: 43 8C     .word ofs_038_26_8C43_03 ; 
- D 0 - I - 0x004C1A 01:8C0A: 79 8C     .word ofs_038_26_8C79_04 ; 
- D 0 - I - 0x004C1C 01:8C0C: A1 8C     .word ofs_038_26_8CA1_05 ; 
- D 0 - I - 0x004C1E 01:8C0E: AE 8C     .word ofs_038_26_8CAE_06 ; 
- D 0 - I - 0x004C20 01:8C10: 9A A2     .word ofs_038_26_0x0062AA_07 ; 
- D 0 - I - 0x004C22 01:8C12: FD A2     .word ofs_038_26_0x00630D_08 ; 
- D 0 - I - 0x004C24 01:8C14: 3D A3     .word ofs_038_26_0x00634D_09_удалить_объект_04 ; 



ofs_038_26_8C16_01_initialize_object:
C - - J - - 0x004C26 01:8C16: A9 81     LDA #$81
C - - - - - 0x004C28 01:8C18: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x004C2B 01:8C1B: BD 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x004C2E 01:8C1E: 18        CLC
C - - - - - 0x004C2F 01:8C1F: 69 05     ADC #$05
C - - - - - 0x004C31 01:8C21: 9D 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x004C34 01:8C24: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004C37 01:8C27: A9 20     LDA #$20
C - - - - - 0x004C39 01:8C29: 4C E0 A2  JMP loc_0x0062F0



ofs_038_26_8C2C_02:
C - - J - - 0x004C3C 01:8C2C: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x004C3F 01:8C2F: D0 0F     BNE bra_8C40
C - - - - - 0x004C41 01:8C31: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x004C44 01:8C34: 20 B3 8C  JSR sub_8CB3
C - - - - - 0x004C47 01:8C37: C0 02     CPY #$02
C - - - - - 0x004C49 01:8C39: 90 05     BCC bra_8C40
C - - - - - 0x004C4B 01:8C3B: A9 01     LDA #$01
C - - - - - 0x004C4D 01:8C3D: 20 E0 A2  JSR sub_0x0062F0
bra_8C40:
C - - - - - 0x004C50 01:8C40: 4C B7 A6  JMP loc_0x0066C7_удалить_объект_03



ofs_038_26_8C43_03:
C - - J - - 0x004C53 01:8C43: 20 B8 8C  JSR sub_8CB8
C - - - - - 0x004C56 01:8C46: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004C59 01:8C49: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x004C5C 01:8C4C: D0 2A     BNE bra_8C78_RTS
C - - - - - 0x004C5E 01:8C4E: A9 00     LDA #$00
C - - - - - 0x004C60 01:8C50: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x004C63 01:8C53: BD 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x004C66 01:8C56: 38        SEC
C - - - - - 0x004C67 01:8C57: E9 05     SBC #$05
C - - - - - 0x004C69 01:8C59: 85 08     STA ram_0008
C - - - - - 0x004C6B 01:8C5B: BD 56 05  LDA ram_атрибуты_спрайта_врага_и_пуль,X
C - - - - - 0x004C6E 01:8C5E: 0A        ASL
C - - - - - 0x004C6F 01:8C5F: 0A        ASL
C - - - - - 0x004C70 01:8C60: A9 0B     LDA #$0B
C - - - - - 0x004C72 01:8C62: B0 02     BCS bra_8C66
C - - - - - 0x004C74 01:8C64: A9 F4     LDA #$F4
bra_8C66:
C - - - - - 0x004C76 01:8C66: 7D 3C 05  ADC ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004C79 01:8C69: 85 09     STA ram_0009
C - - - - - 0x004C7B 01:8C6B: A0 03     LDY #$03
C - - - - - 0x004C7D 01:8C6D: 20 27 F3  JSR sub_0x01F337
C - - - - - 0x004C80 01:8C70: A9 30     LDA #$30
C - - - - - 0x004C82 01:8C72: 4C E0 A2  JMP loc_0x0062F0
- - - - - - 0x004C85 01:8C75: 9D E6 06  STA ram_счетчкики_для_объектов,X
bra_8C78_RTS:
- - - - - - 0x004C88 01:8C78: 60        RTS



ofs_038_26_8C79_04:
C - - J - - 0x004C89 01:8C79: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x004C8C 01:8C7C: D0 C2     BNE bra_8C40
C - - - - - 0x004C8E 01:8C7E: A9 81     LDA #$81
C - - - - - 0x004C90 01:8C80: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x004C93 01:8C83: DE 10 07  DEC ram_0710_obj,X
C - - - - - 0x004C96 01:8C86: 20 B3 8C  JSR sub_8CB3
C - - - - - 0x004C99 01:8C89: C0 00     CPY #$00
C - - - - - 0x004C9B 01:8C8B: D0 B3     BNE bra_8C40
C - - - - - 0x004C9D 01:8C8D: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004CA0 01:8C90: C9 30     CMP #$30
C - - - - - 0x004CA2 01:8C92: 90 0A     BCC bra_8C9E
C - - - - - 0x004CA4 01:8C94: A9 60     LDA #$60
C - - - - - 0x004CA6 01:8C96: 9D E6 06  STA ram_счетчкики_для_объектов,X
C - - - - - 0x004CA9 01:8C99: A9 02     LDA #$02
C - - - - - 0x004CAB 01:8C9B: 4C 83 A2  JMP loc_0x006293_set_obj_state
bra_8C9E:
C - - - - - 0x004CAE 01:8C9E: 4C 75 A2  JMP loc_0x006285_удалить_объект_02



ofs_038_26_8CA1_05:
C - - J - - 0x004CB1 01:8CA1: BD 56 05  LDA ram_атрибуты_спрайта_врага_и_пуль,X
C - - - - - 0x004CB4 01:8CA4: 49 40     EOR #$40
C - - - - - 0x004CB6 01:8CA6: 9D 56 05  STA ram_атрибуты_спрайта_врага_и_пуль,X
C - - - - - 0x004CB9 01:8CA9: A9 23     LDA #$23    ; animation id
C - - - - - 0x004CBB 01:8CAB: 4C 3B B1  JMP loc_0x00714B



ofs_038_26_8CAE_06:
C - - J - - 0x004CBE 01:8CAE: A9 23     LDA #$23    ; animation id
C - - - - - 0x004CC0 01:8CB0: 4C 79 B1  JMP loc_0x007189



sub_8CB3:
C - - - - - 0x004CC3 01:8CB3: A9 08     LDA #$08
C - - - - - 0x004CC5 01:8CB5: 9D E6 06  STA ram_счетчкики_для_объектов,X
sub_8CB8:
C - - - - - 0x004CC8 01:8CB8: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x004CCB 01:8CBB: B9 D7 8C  LDA tbl_8CD7,Y
C - - - - - 0x004CCE 01:8CBE: 9D 08 05  STA ram_кадр_врага_и_пуль,X
C - - - - - 0x004CD1 01:8CC1: 20 0B AB  JSR sub_0x006B1B_выбрать_ближайшего_игрока_по_оси_x
C - - - - - 0x004CD4 01:8CC4: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004CD7 01:8CC7: D9 4C 05  CMP ram_позиция_x_спрайта_игрока,Y
C - - - - - 0x004CDA 01:8CCA: A9 01     LDA #$01
C - - - - - 0x004CDC 01:8CCC: B0 02     BCS bra_8CD0
C - - - - - 0x004CDE 01:8CCE: A9 41     LDA #$41
bra_8CD0:
C - - - - - 0x004CE0 01:8CD0: 9D 56 05  STA ram_атрибуты_спрайта_врага_и_пуль,X
C - - - - - 0x004CE3 01:8CD3: BC 10 07  LDY ram_0710_obj,X
C - - - - - 0x004CE6 01:8CD6: 60        RTS



tbl_8CD7:
- D 0 - - - 0x004CE7 01:8CD7: 59        .byte $59   ; 00 
- D 0 - - - 0x004CE8 01:8CD8: 5A        .byte $5A   ; 01 
- D 0 - - - 0x004CE9 01:8CD9: 5B        .byte $5B   ; 02 



_off001_0x004CEA_27_cannon_hidden_3:
- D 0 - I - 0x004CEA 01:8CDA: E8 8C     .word ofs_038_27_8CE8_01_initialize_object ; 
- D 0 - I - 0x004CEC 01:8CDC: 12 8D     .word ofs_038_27_8D12_02 ; 
- D 0 - I - 0x004CEE 01:8CDE: 22 8D     .word ofs_038_27_8D22_03 ; 
- D 0 - I - 0x004CF0 01:8CE0: 53 8D     .word ofs_038_27_8D53_04 ; 
- D 0 - I - 0x004CF2 01:8CE2: B3 8D     .word ofs_038_27_8DB3_05 ; 
- D 0 - I - 0x004CF4 01:8CE4: FD A2     .word ofs_038_27_0x00630D_06 ; 
- D 0 - I - 0x004CF6 01:8CE6: 3D A3     .word ofs_038_27_0x00634D_07_удалить_объект_04 ; 



ofs_038_27_8CE8_01_initialize_object:
C - - J - - 0x004CF8 01:8CE8: A9 08     LDA #$08
C - - - - - 0x004CFA 01:8CEA: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x004CFD 01:8CED: A9 81     LDA #$81
C - - - - - 0x004CFF 01:8CEF: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x004D02 01:8CF2: A9 B0     LDA #$B0
C - - - - - 0x004D04 01:8CF4: 9D 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x004D07 01:8CF7: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004D0A 01:8CFA: 38        SEC
C - - - - - 0x004D0B 01:8CFB: E9 04     SBC #$04
C - - - - - 0x004D0D 01:8CFD: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004D10 01:8D00: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x004D13 01:8D03: 4A        LSR
C - - - - - 0x004D14 01:8D04: 29 03     AND #$03
C - - - - - 0x004D16 01:8D06: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x004D19 01:8D09: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x004D1C 01:8D0C: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004D1F 01:8D0F: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_27_8D12_02:
C - - J - - 0x004D22 01:8D12: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004D25 01:8D15: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004D28 01:8D18: C9 D8     CMP #$D8
C - - - - - 0x004D2A 01:8D1A: B0 05     BCS bra_8D21_RTS
C - - - - - 0x004D2C 01:8D1C: A9 01     LDA #$01
C - - - - - 0x004D2E 01:8D1E: 4C E0 A2  JMP loc_0x0062F0
bra_8D21_RTS:
C - - - - - 0x004D31 01:8D21: 60        RTS



ofs_038_27_8D22_03:
C - - J - - 0x004D32 01:8D22: A9 01     LDA #$01
C - - - - - 0x004D34 01:8D24: 9D 08 05  STA ram_кадр_врага_и_пуль,X
C - - - - - 0x004D37 01:8D27: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004D3A 01:8D2A: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x004D3D 01:8D2D: D0 F2     BNE bra_8D21_RTS
C - - - - - 0x004D3F 01:8D2F: 20 C9 8D  JSR sub_8DC9
C - - - - - 0x004D42 01:8D32: B0 1B     BCS bra_8D4F
C - - - - - 0x004D44 01:8D34: FE 10 07  INC ram_0710_obj,X
C - - - - - 0x004D47 01:8D37: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x004D4A 01:8D3A: C9 03     CMP #$03
C - - - - - 0x004D4C 01:8D3C: A9 0C     LDA #$0C
C - - - - - 0x004D4E 01:8D3E: 90 0F     BCC bra_8D4F
C - - - - - 0x004D50 01:8D40: A9 01     LDA #$01
C - - - - - 0x004D52 01:8D42: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x004D55 01:8D45: A9 00     LDA #$00
C - - - - - 0x004D57 01:8D47: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x004D5A 01:8D4A: 20 D7 A2  JSR sub_0x0062E7_increase_obj_state
C - - - - - 0x004D5D 01:8D4D: A9 38     LDA #$38
bra_8D4F:
loc_8D4F:
C D 0 - - - 0x004D5F 01:8D4F: 9D E6 06  STA ram_счетчкики_для_объектов,X
bra_8D52_RTS:
C - - - - - 0x004D62 01:8D52: 60        RTS



ofs_038_27_8D53_04:
C - - J - - 0x004D63 01:8D53: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004D66 01:8D56: C9 40     CMP #$40
C - - - - - 0x004D68 01:8D58: B0 03     BCS bra_8D5D
C - - - - - 0x004D6A 01:8D5A: 4C 75 A2  JMP loc_0x006285_удалить_объект_02
bra_8D5D:
C - - - - - 0x004D6D 01:8D5D: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004D70 01:8D60: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x004D73 01:8D63: D0 ED     BNE bra_8D52_RTS
C - - - - - 0x004D75 01:8D65: 20 C9 8D  JSR sub_8DC9
C - - - - - 0x004D78 01:8D68: B0 E5     BCS bra_8D4F
C - - - - - 0x004D7A 01:8D6A: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x004D7D 01:8D6D: 4A        LSR
C - - - - - 0x004D7E 01:8D6E: A9 01     LDA #$01
C - - - - - 0x004D80 01:8D70: 90 02     BCC bra_8D74
C - - - - - 0x004D82 01:8D72: A9 02     LDA #$02
bra_8D74:
C - - - - - 0x004D84 01:8D74: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x004D87 01:8D77: B0 11     BCS bra_8D8A
C - - - - - 0x004D89 01:8D79: A9 08     LDA #$08
C - - - - - 0x004D8B 01:8D7B: DE 56 07  DEC ram_scroll_X_obj,X
C - - - - - 0x004D8E 01:8D7E: 10 CF     BPL bra_8D4F
C - - - - - 0x004D90 01:8D80: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x004D93 01:8D83: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x004D96 01:8D86: A9 80     LDA #$80
C - - - - - 0x004D98 01:8D88: D0 C5     BNE bra_8D4F    ; jmp
bra_8D8A:
C - - - - - 0x004D9A 01:8D8A: A0 02     LDY #$02
C - - - - - 0x004D9C 01:8D8C: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x004D9F 01:8D8F: 90 C1     BCC bra_8D52_RTS
C - - - - - 0x004DA1 01:8D91: A4 11     LDY ram_0011
C - - - - - 0x004DA3 01:8D93: A9 00     LDA #< $FE00
C - - - - - 0x004DA5 01:8D95: 99 BC 06  STA ram_скорость_объектов_x_младш,Y
C - - - - - 0x004DA8 01:8D98: A9 FE     LDA #> $FE00
C - - - - - 0x004DAA 01:8D9A: 99 CA 06  STA ram_скорость_объектов_x_старш,Y
C - - - - - 0x004DAD 01:8D9D: B9 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,Y
C - - - - - 0x004DB0 01:8DA0: 18        CLC
C - - - - - 0x004DB1 01:8DA1: 69 02     ADC #$02
C - - - - - 0x004DB3 01:8DA3: 99 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,Y
C - - - - - 0x004DB6 01:8DA6: B9 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,Y
C - - - - - 0x004DB9 01:8DA9: 69 FE     ADC #$FE
C - - - - - 0x004DBB 01:8DAB: 99 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,Y
C - - - - - 0x004DBE 01:8DAE: A9 04     LDA #$04
C - - - - - 0x004DC0 01:8DB0: 4C 4F 8D  JMP loc_8D4F



ofs_038_27_8DB3_05:
C - - J - - 0x004DC3 01:8DB3: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004DC6 01:8DB6: A0 06     LDY #$03 * $02
C - - - - - 0x004DC8 01:8DB8: 20 CE 8D  JSR sub_8DCE
C - - - - - 0x004DCB 01:8DBB: B0 95     BCS bra_8D52_RTS
C - - - - - 0x004DCD 01:8DBD: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004DD0 01:8DC0: 18        CLC
C - - - - - 0x004DD1 01:8DC1: 69 10     ADC #$10
C - - - - - 0x004DD3 01:8DC3: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004DD6 01:8DC6: 4C 9A A2  JMP loc_0x0062AA



sub_8DC9:
C - - - - - 0x004DD9 01:8DC9: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x004DDC 01:8DCC: 0A        ASL
C - - - - - 0x004DDD 01:8DCD: A8        TAY
sub_8DCE:
C - - - - - 0x004DDE 01:8DCE: B9 E8 8D  LDA tbl_8DE7 + $01,Y
C - - - - - 0x004DE1 01:8DD1: 85 0C     STA ram_000C
C - - - - - 0x004DE3 01:8DD3: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004DE6 01:8DD6: C9 D8     CMP #$D8
C - - - - - 0x004DE8 01:8DD8: B0 0B     BCS bra_8DE5
C - - - - - 0x004DEA 01:8DDA: B9 E7 8D  LDA tbl_8DE7,Y
C - - - - - 0x004DED 01:8DDD: A0 01     LDY #$01
C - - - - - 0x004DEF 01:8DDF: 20 A8 A8  JSR sub_0x0068B8
C - - - - - 0x004DF2 01:8DE2: A9 01     LDA #$01
C - - - - - 0x004DF4 01:8DE4: 60        RTS
bra_8DE5:
- - - - - - 0x004DF5 01:8DE5: 18        CLC
- - - - - - 0x004DF6 01:8DE6: 60        RTS



tbl_8DE7:
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- D 0 - - - 0x004DF7 01:8DE7: 49        .byte $49, $4A   ; 00 
- D 0 - - - 0x004DF9 01:8DE9: 4B        .byte $4B, $4C   ; 01 
- D 0 - - - 0x004DFB 01:8DEB: 4D        .byte $4D, $4E   ; 02 
- D 0 - - - 0x004DFD 01:8DED: 4F        .byte $4F, $50   ; 03 



_off001_0x004DFF_28_cannon_howitzer:
- D 0 - I - 0x004DFF 01:8DEF: FF 8D     .word ofs_038_28_8DFF_01_initialize_object ; 
- D 0 - I - 0x004E01 01:8DF1: 18 8E     .word ofs_038_28_8E18_02 ; 
- D 0 - I - 0x004E03 01:8DF3: 4F 8E     .word ofs_038_28_8E4F_03 ; 
- D 0 - I - 0x004E05 01:8DF5: 54 A3     .word ofs_038_28_0x006364_04_удалить_объект_06 ; 
- D 0 - I - 0x004E07 01:8DF7: 6B A3     .word ofs_038_28_0x00637B_05_удалить_объект_07 ; 
- D 0 - I - 0x004E09 01:8DF9: AC 8E     .word ofs_038_28_8EAC_06 ; 
- D 0 - I - 0x004E0B 01:8DFB: FD A2     .word ofs_038_28_0x00630D_07 ; 
- D 0 - I - 0x004E0D 01:8DFD: 3D A3     .word ofs_038_28_0x00634D_08_удалить_объект_04 ; 



ofs_038_28_8DFF_01_initialize_object:
C - - J - - 0x004E0F 01:8DFF: A9 20     LDA #$20
C - - - - - 0x004E11 01:8E01: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x004E14 01:8E04: A9 81     LDA #$81
C - - - - - 0x004E16 01:8E06: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x004E19 01:8E09: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004E1C 01:8E0C: 38        SEC
C - - - - - 0x004E1D 01:8E0D: E9 02     SBC #$02
C - - - - - 0x004E1F 01:8E0F: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004E22 01:8E12: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004E25 01:8E15: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_28_8E18_02:
C - - J - - 0x004E28 01:8E18: A9 01     LDA #$01
C - - - - - 0x004E2A 01:8E1A: 9D 08 05  STA ram_кадр_врага_и_пуль,X
C - - - - - 0x004E2D 01:8E1D: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004E30 01:8E20: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004E33 01:8E23: C9 E0     CMP #$E0
C - - - - - 0x004E35 01:8E25: B0 27     BCS bra_8E4E_RTS
C - - - - - 0x004E37 01:8E27: A5 94     LDA ram_0094_конфиг_уровня
C - - - - - 0x004E39 01:8E29: 09 40     ORA #$40
C - - - - - 0x004E3B 01:8E2B: 85 94     STA ram_0094_конфиг_уровня
C - - - - - 0x004E3D 01:8E2D: BD 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x004E40 01:8E30: 18        CLC
C - - - - - 0x004E41 01:8E31: 69 16     ADC #$16
C - - - - - 0x004E43 01:8E33: 9D 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x004E46 01:8E36: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004E49 01:8E39: 18        CLC
C - - - - - 0x004E4A 01:8E3A: 69 08     ADC #$08
C - - - - - 0x004E4C 01:8E3C: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004E4F 01:8E3F: A9 00     LDA #$00
C - - - - - 0x004E51 01:8E41: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x004E54 01:8E44: A9 07     LDA #$07
C - - - - - 0x004E56 01:8E46: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x004E59 01:8E49: A9 01     LDA #$01
C - - - - - 0x004E5B 01:8E4B: 4C E0 A2  JMP loc_0x0062F0
bra_8E4E_RTS:
C - - - - - 0x004E5E 01:8E4E: 60        RTS



ofs_038_28_8E4F_03:
C - - J - - 0x004E5F 01:8E4F: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x004E62 01:8E52: C9 30     CMP #$30
C - - - - - 0x004E64 01:8E54: 90 4D     BCC bra_8EA3
C - - - - - 0x004E66 01:8E56: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004E69 01:8E59: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x004E6C 01:8E5C: D0 F0     BNE bra_8E4E_RTS
C - - - - - 0x004E6E 01:8E5E: A0 00     LDY #$00
C - - - - - 0x004E70 01:8E60: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x004E73 01:8E63: F0 06     BEQ bra_8E6B
C - - - - - 0x004E75 01:8E65: A0 02     LDY #$02
C - - - - - 0x004E77 01:8E67: C9 07     CMP #$07
C - - - - - 0x004E79 01:8E69: D0 05     BNE bra_8E70
bra_8E6B:
C - - - - - 0x004E7B 01:8E6B: 20 BC 8E  JSR sub_8EBC
C - - - - - 0x004E7E 01:8E6E: B0 DE     BCS bra_8E4E_RTS
bra_8E70:
C - - - - - 0x004E80 01:8E70: A0 29     LDY #$29
C - - - - - 0x004E82 01:8E72: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x004E85 01:8E75: 90 1A     BCC bra_8E91
C - - - - - 0x004E87 01:8E77: A4 11     LDY ram_0011
C - - - - - 0x004E89 01:8E79: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x004E8C 01:8E7C: 99 48 07  STA ram_0748_obj,Y
C - - - - - 0x004E8F 01:8E7F: B9 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,Y
C - - - - - 0x004E92 01:8E82: 38        SEC
C - - - - - 0x004E93 01:8E83: E9 0E     SBC #$0E
C - - - - - 0x004E95 01:8E85: 99 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,Y
C - - - - - 0x004E98 01:8E88: B9 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,Y
C - - - - - 0x004E9B 01:8E8B: 38        SEC
C - - - - - 0x004E9C 01:8E8C: E9 08     SBC #$08
C - - - - - 0x004E9E 01:8E8E: 99 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,Y
bra_8E91:
C - - - - - 0x004EA1 01:8E91: A9 02     LDA #$02
C - - - - - 0x004EA3 01:8E93: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x004EA6 01:8E96: 10 07     BPL bra_8E9F
C - - - - - 0x004EA8 01:8E98: A9 07     LDA #$07
C - - - - - 0x004EAA 01:8E9A: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x004EAD 01:8E9D: A9 80     LDA #$80
bra_8E9F:
C - - - - - 0x004EAF 01:8E9F: 9D E6 06  STA ram_счетчкики_для_объектов,X
bra_8EA2_RTS:
C - - - - - 0x004EB2 01:8EA2: 60        RTS
bra_8EA3:
- - - - - - 0x004EB3 01:8EA3: A5 94     LDA ram_0094_конфиг_уровня
- - - - - - 0x004EB5 01:8EA5: 29 BF     AND #$BF
- - - - - - 0x004EB7 01:8EA7: 85 94     STA ram_0094_конфиг_уровня
- - - - - - 0x004EB9 01:8EA9: 4C 75 A2  JMP loc_0x006285_удалить_объект_02



ofs_038_28_8EAC_06:
C - - J - - 0x004EBC 01:8EAC: A0 04     LDY #$04
C - - - - - 0x004EBE 01:8EAE: 20 BC 8E  JSR sub_8EBC
C - - - - - 0x004EC1 01:8EB1: B0 EF     BCS bra_8EA2_RTS
C - - - - - 0x004EC3 01:8EB3: A5 94     LDA ram_0094_конфиг_уровня
C - - - - - 0x004EC5 01:8EB5: 29 BF     AND #$BF
C - - - - - 0x004EC7 01:8EB7: 85 94     STA ram_0094_конфиг_уровня
C - - - - - 0x004EC9 01:8EB9: 4C 9A A2  JMP loc_0x0062AA



sub_8EBC:
C - - - - - 0x004ECC 01:8EBC: B9 CA 8E  LDA tbl_8EC9 + $01,Y
C - - - - - 0x004ECF 01:8EBF: 85 0C     STA ram_000C
C - - - - - 0x004ED1 01:8EC1: B9 C9 8E  LDA tbl_8EC9,Y
C - - - - - 0x004ED4 01:8EC4: A0 10     LDY #$10
C - - - - - 0x004ED6 01:8EC6: 4C A8 A8  JMP loc_0x0068B8



tbl_8EC9:
;                                              ----------- 
;                                              |    ------ 
;                                              |    |
- D 0 - - - 0x004ED9 01:8EC9: 3E        .byte $3E, $40   ; 00 
- D 0 - - - 0x004EDB 01:8ECB: 46        .byte $46, $47   ; 02 
- D 0 - - - 0x004EDD 01:8ECD: 11        .byte $11, $48   ; 04 



_off001_0x004EDF_29_bullet_cannon_howitzer:
- D 0 - I - 0x004EDF 01:8ECF: D9 8E     .word ofs_038_29_8ED9_01_initialize_object ; 
- D 0 - I - 0x004EE1 01:8ED1: 2C 8F     .word ofs_038_29_8F2C_02 ; 
- D 0 - I - 0x004EE3 01:8ED3: 8C A2     .word ofs_038_29_0x00629C_03 ; 
- D 0 - I - 0x004EE5 01:8ED5: FD A2     .word ofs_038_29_0x00630D_04 ; 
- D 0 - I - 0x004EE7 01:8ED7: 3D A3     .word ofs_038_29_0x00634D_05_удалить_объект_04 ; 



ofs_038_29_8ED9_01_initialize_object:
C - - J - - 0x004EE9 01:8ED9: A9 02     LDA #$02
C - - - - - 0x004EEB 01:8EDB: 9D 76 06  STA ram_жизни_объектов,X
C - - - - - 0x004EEE 01:8EDE: A9 18     LDA #$18
C - - - - - 0x004EF0 01:8EE0: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x004EF3 01:8EE3: A9 01     LDA #$01
C - - - - - 0x004EF5 01:8EE5: 9D 56 05  STA ram_атрибуты_спрайта_врага_и_пуль,X
C - - - - - 0x004EF8 01:8EE8: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x004EFB 01:8EEB: 0A        ASL
C - - - - - 0x004EFC 01:8EEC: 0A        ASL
C - - - - - 0x004EFD 01:8EED: A8        TAY
C - - - - - 0x004EFE 01:8EEE: B9 0C 8F  LDA tbl_8F0C_speed,Y
C - - - - - 0x004F01 01:8EF1: 9D A0 06  STA ram_скорость_объектов_y_младш,X
C - - - - - 0x004F04 01:8EF4: B9 0D 8F  LDA tbl_8F0C_speed + $01,Y
C - - - - - 0x004F07 01:8EF7: 9D AE 06  STA ram_скорость_объектов_y_старш,X
C - - - - - 0x004F0A 01:8EFA: B9 0E 8F  LDA tbl_8F0C_speed + $02,Y
C - - - - - 0x004F0D 01:8EFD: 9D BC 06  STA ram_скорость_объектов_x_младш,X
C - - - - - 0x004F10 01:8F00: B9 0F 8F  LDA tbl_8F0C_speed + $03,Y
C - - - - - 0x004F13 01:8F03: 9D CA 06  STA ram_скорость_объектов_x_старш,X
C - - - - - 0x004F16 01:8F06: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x004F19 01:8F09: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



tbl_8F0C_speed:
; 00 
- D 0 - - - 0x004F1C 01:8F0C: 00 FD     .word $FD00 ; Y
- D 0 - - - 0x004F1E 01:8F0E: 90 FF     .word $FF90 ; X
; 01 
- D 0 - - - 0x004F20 01:8F10: 20 FD     .word $FD20 ; Y
- D 0 - - - 0x004F22 01:8F12: A0 FF     .word $FFA0 ; X
; 02 
- D 0 - - - 0x004F24 01:8F14: E0 FC     .word $FCE0 ; Y
- D 0 - - - 0x004F26 01:8F16: C0 FF     .word $FFC0 ; X
; 03 
- D 0 - - - 0x004F28 01:8F18: 20 FD     .word $FD20 ; Y
- D 0 - - - 0x004F2A 01:8F1A: D0 FF     .word $FFD0 ; X
; 04 
- D 0 - - - 0x004F2C 01:8F1C: C0 FC     .word $FCC0 ; Y
- D 0 - - - 0x004F2E 01:8F1E: E0 FF     .word $FFE0 ; X
; 05 
- D 0 - - - 0x004F30 01:8F20: 80 FD     .word $FD80 ; Y
- D 0 - - - 0x004F32 01:8F22: 80 FF     .word $FF80 ; X
; 06 
- D 0 - - - 0x004F34 01:8F24: A0 FC     .word $FCA0 ; Y
- D 0 - - - 0x004F36 01:8F26: 60 FF     .word $FF60 ; X
; 07 
- D 0 - - - 0x004F38 01:8F28: 40 FC     .word $FC40 ; Y
- D 0 - - - 0x004F3A 01:8F2A: 50 FF     .word $FF50 ; X



ofs_038_29_8F2C_02:
C - - J - - 0x004F3C 01:8F2C: A9 3A     LDA #$3A
C - - - - - 0x004F3E 01:8F2E: 9D 08 05  STA ram_кадр_врага_и_пуль,X
C - - - - - 0x004F41 01:8F31: BD A0 06  LDA ram_скорость_объектов_y_младш,X
C - - - - - 0x004F44 01:8F34: 18        CLC
C - - - - - 0x004F45 01:8F35: 69 08     ADC #< $0008
C - - - - - 0x004F47 01:8F37: 9D A0 06  STA ram_скорость_объектов_y_младш,X
C - - - - - 0x004F4A 01:8F3A: BD AE 06  LDA ram_скорость_объектов_y_старш,X
C - - - - - 0x004F4D 01:8F3D: 85 08     STA ram_0008
C - - - - - 0x004F4F 01:8F3F: 69 00     ADC #> $0008
C - - - - - 0x004F51 01:8F41: 9D AE 06  STA ram_скорость_объектов_y_старш,X
C - - - - - 0x004F54 01:8F44: A8        TAY
C - - - - - 0x004F55 01:8F45: 45 08     EOR ram_0008
C - - - - - 0x004F57 01:8F47: 10 08     BPL bra_8F51
C - - - - - 0x004F59 01:8F49: 98        TYA
C - - - - - 0x004F5A 01:8F4A: 30 05     BMI bra_8F51
C - - - - - 0x004F5C 01:8F4C: A9 17     LDA #con_sound_17
C - - - - - 0x004F5E 01:8F4E: 20 DE FD  JSR sub_0x01FDEE_play_sound
bra_8F51:
C - - - - - 0x004F61 01:8F51: 20 07 A7  JSR sub_0x006717
C - - - - - 0x004F64 01:8F54: A9 00     LDA #$00
C - - - - - 0x004F66 01:8F56: 20 00 A8  JSR sub_0x006810
C - - - - - 0x004F69 01:8F59: A8        TAY
C - - - - - 0x004F6A 01:8F5A: B9 CC F8  LDA tbl_0x01F8DC,Y
C - - - - - 0x004F6D 01:8F5D: F0 03     BEQ bra_8F62_RTS
C - - - - - 0x004F6F 01:8F5F: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state
bra_8F62_RTS:
C - - - - - 0x004F72 01:8F62: 60        RTS



_off001_0x004F73_3F_earthquake:
- D 0 - I - 0x004F73 01:8F63: 69 8F     .word ofs_038_3F_8F69_01_initialize_object ; 
- D 0 - I - 0x004F75 01:8F65: 7A 8F     .word ofs_038_3F_8F7A_02 ; 
- D 0 - I - 0x004F77 01:8F67: A6 8F     .word ofs_038_3F_8FA6_03 ; 



ofs_038_3F_8F69_01_initialize_object:
C - - J - - 0x004F79 01:8F69: A5 FC     LDA ram_scroll_Y
C - - - - - 0x004F7B 01:8F6B: 85 7B     STA ram_007B
C - - - - - 0x004F7D 01:8F6D: A9 81     LDA #$81
C - - - - - 0x004F7F 01:8F6F: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x004F82 01:8F72: A9 01     LDA #$01
C - - - - - 0x004F84 01:8F74: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x004F87 01:8F77: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_3F_8F7A_02:
C - - J - - 0x004F8A 01:8F7A: 20 64 AB  JSR sub_0x006B74
C - - - - - 0x004F8D 01:8F7D: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x004F90 01:8F80: 0A        ASL
C - - - - - 0x004F91 01:8F81: A8        TAY
C - - - - - 0x004F92 01:8F82: A5 63     LDA ram_0063
C - - - - - 0x004F94 01:8F84: D9 C0 90  CMP tbl_90C0,Y
C - - - - - 0x004F97 01:8F87: 90 3B     BCC bra_8FC4_RTS
C - - - - - 0x004F99 01:8F89: D0 07     BNE bra_8F92
C - - - - - 0x004F9B 01:8F8B: A5 FD     LDA ram_scroll_X
C - - - - - 0x004F9D 01:8F8D: D9 C1 90  CMP tbl_90C0 + $01,Y
C - - - - - 0x004FA0 01:8F90: 90 32     BCC bra_8FC4_RTS
bra_8F92:
C - - - - - 0x004FA2 01:8F92: A9 20     LDA #con_sound_20
C - - - - - 0x004FA4 01:8F94: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x004FA7 01:8F97: A9 00     LDA #$00
C - - - - - 0x004FA9 01:8F99: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x004FAC 01:8F9C: A9 14     LDA #$14
C - - - - - 0x004FAE 01:8F9E: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x004FB1 01:8FA1: A9 01     LDA #$01
C - - - - - 0x004FB3 01:8FA3: 4C E0 A2  JMP loc_0x0062F0



ofs_038_3F_8FA6_03:
C - - J - - 0x004FB6 01:8FA6: 20 64 AB  JSR sub_0x006B74
C - - - - - 0x004FB9 01:8FA9: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x004FBC 01:8FAC: D0 16     BNE bra_8FC4_RTS
C - - - - - 0x004FBE 01:8FAE: 20 DB 8F  JSR sub_8FDB
C - - - - - 0x004FC1 01:8FB1: A9 01     LDA #$01
C - - - - - 0x004FC3 01:8FB3: B0 0C     BCS bra_8FC1
C - - - - - 0x004FC5 01:8FB5: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x004FC8 01:8FB8: C5 0D     CMP ram_000D
C - - - - - 0x004FCA 01:8FBA: F0 09     BEQ bra_8FC5
C - - - - - 0x004FCC 01:8FBC: FE 64 07  INC ram_0764_obj,X
C - - - - - 0x004FCF 01:8FBF: A9 08     LDA #$08
bra_8FC1:
C - - - - - 0x004FD1 01:8FC1: 9D E6 06  STA ram_счетчкики_для_объектов,X
bra_8FC4_RTS:
C - - - - - 0x004FD4 01:8FC4: 60        RTS
bra_8FC5:
C - - - - - 0x004FD5 01:8FC5: FE 48 07  INC ram_0748_obj,X
C - - - - - 0x004FD8 01:8FC8: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x004FDB 01:8FCB: C9 0F     CMP #$0F
C - - - - - 0x004FDD 01:8FCD: B0 05     BCS bra_8FD4
C - - - - - 0x004FDF 01:8FCF: A9 02     LDA #$02
C - - - - - 0x004FE1 01:8FD1: 4C 83 A2  JMP loc_0x006293_set_obj_state
bra_8FD4:
C - - - - - 0x004FE4 01:8FD4: A5 7B     LDA ram_007B
C - - - - - 0x004FE6 01:8FD6: 85 FC     STA ram_scroll_Y
C - - - - - 0x004FE8 01:8FD8: 4C 75 A2  JMP loc_0x006285_удалить_объект_02



sub_8FDB:
; earthquake area 3
; drawing falling ground
C - - - - - 0x004FEB 01:8FDB: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x004FEE 01:8FDE: 0A        ASL
C - - - - - 0x004FEF 01:8FDF: 0A        ASL
C - - - - - 0x004FF0 01:8FE0: A8        TAY
C - - - - - 0x004FF1 01:8FE1: B9 DE 90  LDA tbl_90DE,Y
C - - - - - 0x004FF4 01:8FE4: 85 0A     STA ram_000A
C - - - - - 0x004FF6 01:8FE6: B9 DF 90  LDA tbl_90DE + $01,Y
C - - - - - 0x004FF9 01:8FE9: 85 0D     STA ram_000D
C - - - - - 0x004FFB 01:8FEB: A9 04     LDA #$04
C - - - - - 0x004FFD 01:8FED: 85 01     STA ram_0001
C - - - - - 0x004FFF 01:8FEF: B9 E0 90  LDA tbl_90DE + $02,Y
C - - - - - 0x005002 01:8FF2: 0A        ASL
C - - - - - 0x005003 01:8FF3: 85 00     STA ram_0000
C - - - - - 0x005005 01:8FF5: 26 01     ROL ram_0001
C - - - - - 0x005007 01:8FF7: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x00500A 01:8FFA: 0A        ASL
C - - - - - 0x00500B 01:8FFB: 0A        ASL
C - - - - - 0x00500C 01:8FFC: 0A        ASL
C - - - - - 0x00500D 01:8FFD: 0A        ASL
C - - - - - 0x00500E 01:8FFE: 26 01     ROL ram_0001
C - - - - - 0x005010 01:9000: 0A        ASL
C - - - - - 0x005011 01:9001: 26 01     ROL ram_0001
C - - - - - 0x005013 01:9003: 18        CLC
C - - - - - 0x005014 01:9004: 65 00     ADC ram_0000
C - - - - - 0x005016 01:9006: 85 00     STA ram_0000
C - - - - - 0x005018 01:9008: B9 E1 90  LDA tbl_90DE + $03,Y
C - - - - - 0x00501B 01:900B: A8        TAY
C - - - - - 0x00501C 01:900C: B9 1A 91  LDA tbl_911A,Y
C - - - - - 0x00501F 01:900F: 85 08     STA ram_0008
C - - - - - 0x005021 01:9011: B9 1B 91  LDA tbl_911A + $01,Y
C - - - - - 0x005024 01:9014: 85 09     STA ram_0009
C - - - - - 0x005026 01:9016: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x005029 01:9019: 4A        LSR
C - - - - - 0x00502A 01:901A: 90 2D     BCC bra_9049
C - - - - - 0x00502C 01:901C: A5 01     LDA ram_0001
C - - - - - 0x00502E 01:901E: 85 02     STA ram_0002
C - - - - - 0x005030 01:9020: A5 00     LDA ram_0000
C - - - - - 0x005032 01:9022: 0A        ASL
C - - - - - 0x005033 01:9023: 26 02     ROL ram_0002
C - - - - - 0x005035 01:9025: 0A        ASL
C - - - - - 0x005036 01:9026: 26 02     ROL ram_0002
C - - - - - 0x005038 01:9028: 0A        ASL
C - - - - - 0x005039 01:9029: 46 02     LSR ram_0002
C - - - - - 0x00503B 01:902B: 6A        ROR
C - - - - - 0x00503C 01:902C: 46 02     LSR ram_0002
C - - - - - 0x00503E 01:902E: 6A        ROR
C - - - - - 0x00503F 01:902F: 46 02     LSR ram_0002
C - - - - - 0x005041 01:9031: 6A        ROR
C - - - - - 0x005042 01:9032: 46 02     LSR ram_0002
C - - - - - 0x005044 01:9034: 6A        ROR
C - - - - - 0x005045 01:9035: 46 02     LSR ram_0002
C - - - - - 0x005047 01:9037: 6A        ROR
C - - - - - 0x005048 01:9038: A8        TAY
C - - - - - 0x005049 01:9039: A5 0A     LDA ram_000A
C - - - - - 0x00504B 01:903B: 4A        LSR
C - - - - - 0x00504C 01:903C: 4A        LSR
C - - - - - 0x00504D 01:903D: 85 02     STA ram_0002
C - - - - - 0x00504F 01:903F: A9 00     LDA #$00
bra_9041_loop:
C - - - - - 0x005051 01:9041: 99 00 04  STA ram_0400,Y
C - - - - - 0x005054 01:9044: C8        INY
C - - - - - 0x005055 01:9045: C6 02     DEC ram_0002
C - - - - - 0x005057 01:9047: D0 F8     BNE bra_9041_loop
bra_9049:
C - - - - - 0x005059 01:9049: A9 00     LDA #$00
C - - - - - 0x00505B 01:904B: BC 56 07  LDY ram_scroll_X_obj,X
C - - - - - 0x00505E 01:904E: F0 06     BEQ bra_9056
- - - - - - 0x005060 01:9050: 18        CLC
bra_9051_loop:
- - - - - - 0x005061 01:9051: 65 0A     ADC ram_000A
- - - - - - 0x005063 01:9053: 88        DEY
- - - - - - 0x005064 01:9054: D0 FB     BNE bra_9051_loop
bra_9056:
C - - - - - 0x005066 01:9056: A8        TAY
C - - - - - 0x005067 01:9057: A9 1B     LDA #$1B
C - - - - - 0x005069 01:9059: 38        SEC
C - - - - - 0x00506A 01:905A: FD 64 07  SBC ram_0764_obj,X
C - - - - - 0x00506D 01:905D: B0 02     BCS bra_9061
C - - - - - 0x00506F 01:905F: A9 00     LDA #$00
bra_9061:
; A = 00-07
C - - - - - 0x005071 01:9061: 85 0C     STA ram_000C
C - - - - - 0x005073 01:9063: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x005075 01:9065: E0 20     CPX #$20
C - - - - - 0x005077 01:9067: B0 36     BCS bra_909F
C - - - - - 0x005079 01:9069: A9 03     LDA #con_buf_mode_03
C - - - - - 0x00507B 01:906B: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x00507E 01:906E: E8        INX
C - - - - - 0x00507F 01:906F: 20 A2 90  JSR sub_90A2
C - - - - - 0x005082 01:9072: A9 00     LDA #$00    ; fill tile
C - - - - - 0x005084 01:9074: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x005087 01:9077: E8        INX
C - - - - - 0x005088 01:9078: A5 0C     LDA ram_000C
C - - - - - 0x00508A 01:907A: F0 20     BEQ bra_909C_skip
C - - - - - 0x00508C 01:907C: A9 06     LDA #con_buf_mode_06
C - - - - - 0x00508E 01:907E: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x005091 01:9081: E8        INX
bra_9082_loop:
C - - - - - 0x005092 01:9082: 20 A2 90  JSR sub_90A2
; A = 04 08
C - - - - - 0x005095 01:9085: 85 0B     STA ram_000B
bra_9087_loop:
C - - - - - 0x005097 01:9087: B1 08     LDA (ram_0008),Y
C - - - - - 0x005099 01:9089: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x00509C 01:908C: C8        INY
C - - - - - 0x00509D 01:908D: E8        INX
C - - - - - 0x00509E 01:908E: C6 0B     DEC ram_000B
C - - - - - 0x0050A0 01:9090: D0 F5     BNE bra_9087_loop
C - - - - - 0x0050A2 01:9092: C6 0C     DEC ram_000C
C - - - - - 0x0050A4 01:9094: D0 EC     BNE bra_9082_loop
; close buffer
C - - - - - 0x0050A6 01:9096: A9 FF     LDA #$FF
C - - - - - 0x0050A8 01:9098: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0050AB 01:909B: E8        INX
bra_909C_skip:
C - - - - - 0x0050AC 01:909C: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x0050AE 01:909E: 18        CLC
bra_909F:
C - - - - - 0x0050AF 01:909F: A6 10     LDX ram_0010
C - - - - - 0x0050B1 01:90A1: 60        RTS



sub_90A2:
C - - - - - 0x0050B2 01:90A2: A5 01     LDA ram_0001    ; ppu hi
C - - - - - 0x0050B4 01:90A4: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0050B7 01:90A7: E8        INX
C - - - - - 0x0050B8 01:90A8: A5 00     LDA ram_0000    ; ppu lo
C - - - - - 0x0050BA 01:90AA: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0050BD 01:90AD: E8        INX
C - - - - - 0x0050BE 01:90AE: A5 00     LDA ram_0000
C - - - - - 0x0050C0 01:90B0: 18        CLC
C - - - - - 0x0050C1 01:90B1: 69 20     ADC #$20
C - - - - - 0x0050C3 01:90B3: 85 00     STA ram_0000
C - - - - - 0x0050C5 01:90B5: 90 02     BCC bra_90B9_not_overflow
C - - - - - 0x0050C7 01:90B7: E6 01     INC ram_0001
bra_90B9_not_overflow:
C - - - - - 0x0050C9 01:90B9: A5 0A     LDA ram_000A    ; counter
C - - - - - 0x0050CB 01:90BB: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0050CE 01:90BE: E8        INX
C - - - - - 0x0050CF 01:90BF: 60        RTS



tbl_90C0:
;                                              ----------- 
;                                              |    ------ scroll_X
;                                              |    |
- D 0 - - - 0x0050D0 01:90C0: 0E        .byte $0E, $E0   ; 
- D 0 - - - 0x0050D2 01:90C2: 0F        .byte $0F, $00   ; 
- D 0 - - - 0x0050D4 01:90C4: 0F        .byte $0F, $20   ; 
- D 0 - - - 0x0050D6 01:90C6: 0F        .byte $0F, $70   ; 
- D 0 - - - 0x0050D8 01:90C8: 0F        .byte $0F, $B0   ; 
- D 0 - - - 0x0050DA 01:90CA: 0F        .byte $0F, $D0   ; 
- D 0 - - - 0x0050DC 01:90CC: 10        .byte $10, $60   ; 
- D 0 - - - 0x0050DE 01:90CE: 10        .byte $10, $A0   ; 
- D 0 - - - 0x0050E0 01:90D0: 10        .byte $10, $E0   ; 
- D 0 - - - 0x0050E2 01:90D2: 11        .byte $11, $40   ; 
- D 0 - - - 0x0050E4 01:90D4: 11        .byte $11, $80   ; 
- D 0 - - - 0x0050E6 01:90D6: 11        .byte $11, $C0   ; 
- D 0 - - - 0x0050E8 01:90D8: 11        .byte $11, $E0   ; 
- D 0 - - - 0x0050EA 01:90DA: 12        .byte $12, $00   ; 
- D 0 - - - 0x0050EC 01:90DC: 12        .byte $12, $20   ; 



tbl_90DE:
;                                              --------------------- 
;                                              |    ---------------- 
;                                              |    |    ----------- 
;                                              |    |    |    ------ index for 0x00512A
;                                              |    |    |    |
- D 0 - - - 0x0050EE 01:90DE: 04        .byte $04, $17, $88, $00   ; 00 
- D 0 - - - 0x0050F2 01:90E2: 04        .byte $04, $1D, $8A, $02   ; 01 
- D 0 - - - 0x0050F6 01:90E6: 08        .byte $08, $15, $8C, $04   ; 02 
- D 0 - - - 0x0050FA 01:90EA: 08        .byte $08, $19, $00, $04   ; 03 
- D 0 - - - 0x0050FE 01:90EE: 08        .byte $08, $15, $04, $04   ; 04 
- D 0 - - - 0x005102 01:90F2: 04        .byte $04, $1D, $08, $00   ; 05 
- D 0 - - - 0x005106 01:90F6: 04        .byte $04, $1D, $80, $00   ; 06 
- D 0 - - - 0x00510A 01:90FA: 04        .byte $04, $1D, $84, $00   ; 07 
- D 0 - - - 0x00510E 01:90FE: 04        .byte $04, $1D, $88, $00   ; 08 
- D 0 - - - 0x005112 01:9102: 04        .byte $04, $1D, $8C, $00   ; 09 
- D 0 - - - 0x005116 01:9106: 08        .byte $08, $19, $00, $04   ; 0A 
- D 0 - - - 0x00511A 01:910A: 08        .byte $08, $15, $04, $04   ; 0B 
- D 0 - - - 0x00511E 01:910E: 04        .byte $04, $1D, $08, $00   ; 0C 
- D 0 - - - 0x005122 01:9112: 04        .byte $04, $19, $0A, $02   ; 0D 
- D 0 - - - 0x005126 01:9116: 04        .byte $04, $17, $0C, $00   ; 0E 



tbl_911A:
- D 0 - - - 0x00512A 01:911A: 20 91     .word off_9120_00
- D 0 - - - 0x00512C 01:911C: 48 91     .word off_9148_02
- D 0 - - - 0x00512E 01:911E: 70 91     .word off_9170_04



off_9120_00:
- D 0 - I - 0x005130 01:9120: 2A        .byte $2A, $2A, $2B, $2B   ; 00 
- D 0 - I - 0x005134 01:9124: C5        .byte $C5, $C6, $C5, $C6   ; 01 
- D 0 - I - 0x005138 01:9128: 2E        .byte $2E, $C9, $30, $CF   ; 02 
- D 0 - I - 0x00513C 01:912C: CB        .byte $CB, $CC, $D1, $D2   ; 03 
- D 0 - I - 0x005140 01:9130: 30        .byte $30, $D0, $2F, $CA   ; 04 
- D 0 - I - 0x005144 01:9134: CB        .byte $CB, $CC, $CD, $CE   ; 05 
- D 0 - I - 0x005148 01:9138: 30        .byte $30, $CF, $31, $D0   ; 06 
; bzk garbage?
- - - - - - 0x00514C 01:913C: D1        .byte $D1, $D2, $D3, $D4   ; 07 
- - - - - - 0x005150 01:9140: 2F        .byte $2F, $CA, $2E, $C9   ; 08 
- - - - - - 0x005154 01:9144: CD        .byte $CD, $CE, $CB, $CC   ; 09 



off_9148_02:
- D 0 - I - 0x005158 01:9148: 2C        .byte $2C, $2B, $2B, $2C   ; 00 
- D 0 - I - 0x00515C 01:914C: C5        .byte $C5, $C6, $C7, $C8   ; 01 
- D 0 - I - 0x005160 01:9150: 2E        .byte $2E, $C9, $2F, $CA   ; 02 
- D 0 - I - 0x005164 01:9154: CB        .byte $CB, $CC, $CD, $CE   ; 03 
- D 0 - I - 0x005168 01:9158: 30        .byte $30, $CF, $31, $D0   ; 04 
- D 0 - I - 0x00516C 01:915C: D1        .byte $D1, $D2, $D3, $D4   ; 05 
- D 0 - I - 0x005170 01:9160: 2F        .byte $2F, $CA, $2E, $C9   ; 06 
; bzk garbage?
- - - - - - 0x005174 01:9164: CD        .byte $CD, $CE, $CB, $CC   ; 07 
- - - - - - 0x005178 01:9168: 31        .byte $31, $D0, $30, $D0   ; 08 
- - - - - - 0x00517C 01:916C: D3        .byte $D3, $D4, $CB, $CC   ; 09 



off_9170_04:
- D 0 - I - 0x005180 01:9170: 2A        .byte $2A, $2A, $2B, $2B, $2C, $2B, $2B, $2C   ; 00 
- D 0 - I - 0x005188 01:9178: C5        .byte $C5, $C6, $C5, $C6, $C5, $C6, $C7, $C8   ; 01 
- D 0 - I - 0x005190 01:9180: 2E        .byte $2E, $C9, $30, $CF, $2E, $C9, $2F, $CA   ; 02 
- D 0 - I - 0x005198 01:9188: CB        .byte $CB, $CC, $D1, $D2, $CB, $CC, $CD, $CE   ; 03 
- D 0 - I - 0x0051A0 01:9190: 30        .byte $30, $D0, $2F, $CA, $30, $CF, $31, $D0   ; 04 
- D 0 - I - 0x0051A8 01:9198: CB        .byte $CB, $CC, $CD, $CE, $D1, $D2, $D3, $D4   ; 05 
- D 0 - I - 0x0051B0 01:91A0: 30        .byte $30, $CF, $31, $D0, $2F, $CA, $2E, $C9   ; 06 
; bzk garbage?
- - - - - - 0x0051B8 01:91A8: D1        .byte $D1, $D2, $D3, $D4, $CD, $CE, $CB, $CC   ; 07 
- - - - - - 0x0051C0 01:91B0: 2F        .byte $2F, $CA, $2E, $C9, $31, $D0, $30, $D0   ; 08 
- - - - - - 0x0051C8 01:91B8: CD        .byte $CD, $CE, $CB, $CC, $D3, $D4, $CB, $CC   ; 09 



_off001_0x0051D0_3A_bullet_robospider:
- D 0 - I - 0x0051D0 01:91C0: C8 91     .word ofs_038_3A_91C8_01_initialize_object ; 
- D 0 - I - 0x0051D2 01:91C2: D1 91     .word ofs_038_3A_91D1_02 ; 
- D 0 - I - 0x0051D4 01:91C4: E1 91     .word ofs_038_3A_91E1_03 ; 
- D 0 - I - 0x0051D6 01:91C6: 75 A2     .word ofs_038_3A_0x006285_04_удалить_объект_02 ; 



ofs_038_3A_91C8_01_initialize_object:
C - - J - - 0x0051D8 01:91C8: BD 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x0051DB 01:91CB: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0051DE 01:91CE: 4C 95 AE  JMP loc_0x006EA5



ofs_038_3A_91D1_02:
C - - J - - 0x0051E1 01:91D1: 20 B7 A6  JSR sub_0x0066C7_удалить_объект_03
C - - - - - 0x0051E4 01:91D4: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x0051E7 01:91D7: D0 2C     BNE bra_9205_RTS
C - - - - - 0x0051E9 01:91D9: A9 06     LDA #$06
C - - - - - 0x0051EB 01:91DB: 9D 08 05  STA ram_кадр_врага_и_пуль,X
C - - - - - 0x0051EE 01:91DE: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_3A_91E1_03:
C - - J - - 0x0051F1 01:91E1: FE E6 06  INC ram_счетчкики_для_объектов,X
C - - - - - 0x0051F4 01:91E4: BD E6 06  LDA ram_счетчкики_для_объектов,X
C - - - - - 0x0051F7 01:91E7: 4A        LSR
C - - - - - 0x0051F8 01:91E8: 4A        LSR
C - - - - - 0x0051F9 01:91E9: 29 03     AND #$03
C - - - - - 0x0051FB 01:91EB: 9D 56 05  STA ram_атрибуты_спрайта_врага_и_пуль,X
C - - - - - 0x0051FE 01:91EE: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x005201 01:91F1: F0 05     BEQ bra_91F8
C - - - - - 0x005203 01:91F3: A0 05     LDY #$05
C - - - - - 0x005205 01:91F5: 20 6E A9  JSR sub_0x00697E
bra_91F8:
C - - - - - 0x005208 01:91F8: 20 D3 A6  JSR sub_0x0066E3
C - - - - - 0x00520B 01:91FB: A9 F8     LDA #$F8
C - - - - - 0x00520D 01:91FD: 20 0A A8  JSR sub_0x00681A
C - - - - - 0x005210 01:9200: F0 03     BEQ bra_9205_RTS
C - - - - - 0x005212 01:9202: 4C 75 A2  JMP loc_0x006285_удалить_объект_02
bra_9205_RTS:
C - - - - - 0x005215 01:9205: 60        RTS



_off001_0x005216_4E_robospider:
- D 0 - I - 0x005216 01:9206: 18 92     .word ofs_038_4E_9218_01_initialize_object ; 
- D 0 - I - 0x005218 01:9208: 2A 92     .word ofs_038_4E_922A_02 ; 
- D 0 - I - 0x00521A 01:920A: 65 92     .word ofs_038_4E_9265_03 ; 
- D 0 - I - 0x00521C 01:920C: A7 92     .word ofs_038_4E_92A7_04 ; 
- D 0 - I - 0x00521E 01:920E: BE A3     .word ofs_038_4E_0x0063CE_05 ; 
- D 0 - I - 0x005220 01:9210: D8 A3     .word ofs_038_4E_0x0063E8_06 ; 
- D 0 - I - 0x005222 01:9212: DA 92     .word ofs_038_4E_92DA_07 ; 
- D 0 - I - 0x005224 01:9214: FD A2     .word ofs_038_4E_0x00630D_08 ; 
- D 0 - I - 0x005226 01:9216: E2 92     .word ofs_038_4E_92E2_09 ; 



ofs_038_4E_9218_01_initialize_object:
C - - J - - 0x005228 01:9218: A9 8D     LDA #$8D
C - - - - - 0x00522A 01:921A: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x00522D 01:921D: A9 F0     LDA #con__hp_F0
C - - - - - 0x00522F 01:921F: 9D 76 06  STA ram_жизни_объектов,X
C - - - - - 0x005232 01:9222: A9 08     LDA #$08
C - - - - - 0x005234 01:9224: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x005237 01:9227: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_4E_922A_02:
C - - J - - 0x00523A 01:922A: A5 61     LDA ram_0061_конфиг_уровня
C - - - - - 0x00523C 01:922C: F0 36     BEQ bra_9264_RTS
C - - - - - 0x00523E 01:922E: A5 60     LDA ram_0060_unk
C - - - - - 0x005240 01:9230: 05 70     ORA ram_0070
C - - - - - 0x005242 01:9232: D0 30     BNE bra_9264_RTS
C - - - - - 0x005244 01:9234: A9 01     LDA #con_mirroring_H
C - - - - - 0x005246 01:9236: 85 26     STA ram_for_A000
C - - - - - 0x005248 01:9238: A9 9C     LDA #$9C
C - - - - - 0x00524A 01:923A: 9D 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x00524D 01:923D: A9 60     LDA #$60
C - - - - - 0x00524F 01:923F: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005252 01:9242: A9 01     LDA #$01
C - - - - - 0x005254 01:9244: 9D 9C 07  STA ram_позиция_объектов_x_старш,X
C - - - - - 0x005257 01:9247: A9 2C     LDA #$2C
C - - - - - 0x005259 01:9249: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x00525C 01:924C: A9 00     LDA #$00
C - - - - - 0x00525E 01:924E: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x005261 01:9251: A9 1E     LDA #$1E
C - - - - - 0x005263 01:9253: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x005266 01:9256: A9 0C     LDA #$0C
C - - - - - 0x005268 01:9258: 85 0A     STA ram_000A
C - - - - - 0x00526A 01:925A: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x00526C 01:925C: 20 45 96  JSR sub_9645
C - - - - - 0x00526F 01:925F: A9 01     LDA #$01
C - - - - - 0x005271 01:9261: 4C E0 A2  JMP loc_0x0062F0
bra_9264_RTS:
C - - - - - 0x005274 01:9264: 60        RTS



ofs_038_4E_9265_03:
C - - J - - 0x005275 01:9265: A9 00     LDA #$00
C - - - - - 0x005277 01:9267: BC 72 07  LDY ram_0772_obj,X
C - - - - - 0x00527A 01:926A: C0 08     CPY #$08
C - - - - - 0x00527C 01:926C: B0 14     BCS bra_9282
C - - - - - 0x00527E 01:926E: A9 AC     LDA #$AC
C - - - - - 0x005280 01:9270: C0 07     CPY #$07
C - - - - - 0x005282 01:9272: B0 0E     BCS bra_9282
C - - - - - 0x005284 01:9274: A9 34     LDA #$34
C - - - - - 0x005286 01:9276: C0 06     CPY #$06
C - - - - - 0x005288 01:9278: B0 08     BCS bra_9282
C - - - - - 0x00528A 01:927A: A9 B2     LDA #$B2
C - - - - - 0x00528C 01:927C: C0 05     CPY #$05
C - - - - - 0x00528E 01:927E: B0 02     BCS bra_9282
C - - - - - 0x005290 01:9280: A9 34     LDA #$34
bra_9282:
C - - - - - 0x005292 01:9282: 20 EE A8  JSR sub_0x0068FE
C - - - - - 0x005295 01:9285: DE 72 07  DEC ram_0772_obj,X
C - - - - - 0x005298 01:9288: 10 DA     BPL bra_9264_RTS
C - - - - - 0x00529A 01:928A: A0 57     LDY #$57
C - - - - - 0x00529C 01:928C: 20 1D BD  JSR sub_0x007D2D_clear_0480_Y
C - - - - - 0x00529F 01:928F: A9 32     LDA #con_sound_32   ;   музыка 3й под босс Паук
C - - - - - 0x0052A1 01:9291: 20 DE FD  JSR sub_0x01FDEE_play_music
C - - - - - 0x0052A4 01:9294: A9 00     LDA #$00
C - - - - - 0x0052A6 01:9296: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x0052A9 01:9299: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0052AC 01:929C: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x0052AF 01:929F: A9 01     LDA #$01
C - - - - - 0x0052B1 01:92A1: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x0052B4 01:92A4: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_4E_92A7_04:
C - - J - - 0x0052B7 01:92A7: A9 01     LDA #$01
C - - - - - 0x0052B9 01:92A9: BC 9C 07  LDY ram_позиция_объектов_x_старш,X
C - - - - - 0x0052BC 01:92AC: D0 02     BNE bra_92B0
C - - - - - 0x0052BE 01:92AE: A9 06     LDA #$06
bra_92B0:
C - - - - - 0x0052C0 01:92B0: 9D 08 05  STA ram_кадр_врага_и_пуль,X
C - - - - - 0x0052C3 01:92B3: A5 5B     LDA ram_счетчик_кадров
C - - - - - 0x0052C5 01:92B5: 4A        LSR
C - - - - - 0x0052C6 01:92B6: 4A        LSR
C - - - - - 0x0052C7 01:92B7: 29 03     AND #$03
C - - - - - 0x0052C9 01:92B9: 09 20     ORA #$20
C - - - - - 0x0052CB 01:92BB: 9D 56 05  STA ram_атрибуты_спрайта_врага_и_пуль,X
C - - - - - 0x0052CE 01:92BE: 20 F3 94  JSR sub_94F3
C - - - - - 0x0052D1 01:92C1: 20 10 93  JSR sub_9310
C - - - - - 0x0052D4 01:92C4: A9 0C     LDA #$0C
C - - - - - 0x0052D6 01:92C6: BC 9C 07  LDY ram_позиция_объектов_x_старш,X
C - - - - - 0x0052D9 01:92C9: F0 02     BEQ bra_92CD
C - - - - - 0x0052DB 01:92CB: A9 8D     LDA #$8D
bra_92CD:
C - - - - - 0x0052DD 01:92CD: 9D 2C 07  STA ram_параметры_объектов,X
loc_92D0:
C D 0 - - - 0x0052E0 01:92D0: A5 FF     LDA ram_for_2000
C - - - - - 0x0052E2 01:92D2: 29 FD     AND #$FD
C - - - - - 0x0052E4 01:92D4: 1D 56 07  ORA ram_scroll_X_obj,X
C - - - - - 0x0052E7 01:92D7: 85 FF     STA ram_for_2000
C - - - - - 0x0052E9 01:92D9: 60        RTS



ofs_038_4E_92DA_07:
C - - J - - 0x0052EA 01:92DA: A9 05     LDA #$05
C - - - - - 0x0052EC 01:92DC: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0052EF 01:92DF: 4C 9A A2  JMP loc_0x0062AA



ofs_038_4E_92E2_09:
C - - J - - 0x0052F2 01:92E2: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x0052F5 01:92E5: C9 03     CMP #$03
C - - - - - 0x0052F7 01:92E7: 90 03     BCC bra_92EC
C - - - - - 0x0052F9 01:92E9: 4C FF 95  JMP loc_95FF
bra_92EC:
C - - - - - 0x0052FC 01:92EC: BD 56 07  LDA ram_scroll_X_obj,X
C - - - - - 0x0052FF 01:92EF: 49 02     EOR #$02
C - - - - - 0x005301 01:92F1: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x005304 01:92F4: 29 02     AND #$02
C - - - - - 0x005306 01:92F6: F0 08     BEQ bra_9300
C - - - - - 0x005308 01:92F8: A9 05     LDA #$05
C - - - - - 0x00530A 01:92FA: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x00530D 01:92FD: 4C D0 92  JMP loc_92D0
bra_9300:
C - - - - - 0x005310 01:9300: A0 57     LDY #$57
C - - - - - 0x005312 01:9302: 20 12 BD  JSR sub_0x007D22_clear_0400_Y
C - - - - - 0x005315 01:9305: A0 57     LDY #$57
C - - - - - 0x005317 01:9307: 20 1D BD  JSR sub_0x007D2D_clear_0480_Y
C - - - - - 0x00531A 01:930A: 20 82 F1  JSR sub_0x01F192
C - - - - - 0x00531D 01:930D: 4C 3D A3  JMP loc_0x00634D_удалить_объект_04



sub_9310:
; leon опт
                                        LDY ram_0748_obj,X
                                        LDA tbl_9316_lo,y
                                        STA ram_0000
                                        LDA tbl_9316_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9316_lo:
- D 0 - I - 0x005326 01:9316: 1C 93     .byte < ofs_014_931C_00
- D 0 - I - 0x005328 01:9318: 3E 93     .byte < ofs_014_933E_01
- D 0 - I - 0x00532A 01:931A: 71 93     .byte < ofs_014_9371_02
tbl_9316_hi:
- D 0 - I - 0x005326 01:9316: 1C 93     .byte > ofs_014_931C_00
- D 0 - I - 0x005328 01:9318: 3E 93     .byte > ofs_014_933E_01
- D 0 - I - 0x00532A 01:931A: 71 93     .byte > ofs_014_9371_02


ofs_014_931C_00:
C - - J - - 0x00532C 01:931C: 20 0B 94  JSR sub_940B
C - - - - - 0x00532F 01:931F: BD 9C 07  LDA ram_позиция_объектов_x_старш,X
C - - - - - 0x005332 01:9322: D0 19     BNE bra_933D_RTS
C - - - - - 0x005334 01:9324: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005337 01:9327: C9 C0     CMP #$C0
C - - - - - 0x005339 01:9329: B0 12     BCS bra_933D_RTS
C - - - - - 0x00533B 01:932B: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x00533E 01:932E: D0 0D     BNE bra_933D_RTS
C - - - - - 0x005340 01:9330: A9 30     LDA #$30
C - - - - - 0x005342 01:9332: 20 99 AB  JSR sub_0x006BA9_set_dynamic_hp_to_boss
sub_9335:
C - - - - - 0x005345 01:9335: A9 18     LDA #$18
bra_9337:
C - - - - - 0x005347 01:9337: 9D E6 06  STA ram_счетчкики_для_объектов,X
C - - - - - 0x00534A 01:933A: FE 48 07  INC ram_0748_obj,X
bra_933D_RTS:
C - - - - - 0x00534D 01:933D: 60        RTS



ofs_014_933E_01:
C - - J - - 0x00534E 01:933E: BD E6 06  LDA ram_счетчкики_для_объектов,X
C - - - - - 0x005351 01:9341: C9 10     CMP #$10
C - - - - - 0x005353 01:9343: D0 03     BNE bra_9348
C - - - - - 0x005355 01:9345: 20 8B 93  JSR sub_938B
bra_9348:
C - - - - - 0x005358 01:9348: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x00535B 01:934B: D0 F0     BNE bra_933D_RTS
C - - - - - 0x00535D 01:934D: BC 3C 05  LDY ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005360 01:9350: CC 4C 05  CPY ram_позиция_x_спрайта_игрока
C - - - - - 0x005363 01:9353: A9 00     LDA #$00
C - - - - - 0x005365 01:9355: 90 02     BCC bra_9359
C - - - - - 0x005367 01:9357: A9 01     LDA #$01
bra_9359:
C - - - - - 0x005369 01:9359: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x00536C 01:935C: A9 60     LDA #$60
C - - - - - 0x00536E 01:935E: BC 76 06  LDY ram_жизни_объектов,X
C - - - - - 0x005371 01:9361: C0 10     CPY #$10
C - - - - - 0x005373 01:9363: B0 02     BCS bra_9367
C - - - - - 0x005375 01:9365: A9 40     LDA #$40
bra_9367:
C - - - - - 0x005377 01:9367: 85 00     STA ram_0000
C - - - - - 0x005379 01:9369: A5 23     LDA ram_рандом_байт
C - - - - - 0x00537B 01:936B: 29 1F     AND #$1F
C - - - - - 0x00537D 01:936D: 65 00     ADC ram_0000
C - - - - - 0x00537F 01:936F: D0 C6     BNE bra_9337    ; jmp?



ofs_014_9371_02:
C - - J - - 0x005381 01:9371: 20 0B 94  JSR sub_940B
C - - - - - 0x005384 01:9374: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x005387 01:9377: D0 11     BNE bra_938A_RTS
C - - - - - 0x005389 01:9379: BD 10 07  LDA ram_0710_obj,X
C - - - - - 0x00538C 01:937C: F0 04     BEQ bra_9382
C - - - - - 0x00538E 01:937E: FE E6 06  INC ram_счетчкики_для_объектов,X
C - - - - - 0x005391 01:9381: 60        RTS
bra_9382:
C - - - - - 0x005392 01:9382: 20 35 93  JSR sub_9335
C - - - - - 0x005395 01:9385: A9 01     LDA #$01
C - - - - - 0x005397 01:9387: 9D 48 07  STA ram_0748_obj,X
bra_938A_RTS:
C - - - - - 0x00539A 01:938A: 60        RTS



sub_938B:
C - - - - - 0x00539B 01:938B: A9 05     LDA #$05
C - - - - - 0x00539D 01:938D: 85 08     STA ram_0008
bra_938F_loop:
C - - - - - 0x00539F 01:938F: A0 3A     LDY #$3A
C - - - - - 0x0053A1 01:9391: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x0053A4 01:9394: 90 48     BCC bra_93DE
C - - - - - 0x0053A6 01:9396: BD 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x0053A9 01:9399: 85 0A     STA ram_000A
C - - - - - 0x0053AB 01:939B: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x0053AE 01:939E: 85 0B     STA ram_000B
C - - - - - 0x0053B0 01:93A0: A6 11     LDX ram_0011
C - - - - - 0x0053B2 01:93A2: A5 08     LDA ram_0008
C - - - - - 0x0053B4 01:93A4: 0A        ASL
C - - - - - 0x0053B5 01:93A5: A8        TAY
C - - - - - 0x0053B6 01:93A6: B9 E1 93  LDA tbl_93E1_spd_Y,Y
C - - - - - 0x0053B9 01:93A9: 9D A0 06  STA ram_скорость_объектов_y_младш,X
C - - - - - 0x0053BC 01:93AC: B9 E2 93  LDA tbl_93E1_spd_Y + $01,Y
C - - - - - 0x0053BF 01:93AF: 9D AE 06  STA ram_скорость_объектов_y_старш,X
C - - - - - 0x0053C2 01:93B2: B9 ED 93  LDA tbl_93ED_spd_X,Y
C - - - - - 0x0053C5 01:93B5: 9D BC 06  STA ram_скорость_объектов_x_младш,X
C - - - - - 0x0053C8 01:93B8: B9 EE 93  LDA tbl_93ED_spd_X + $01,Y
C - - - - - 0x0053CB 01:93BB: 9D CA 06  STA ram_скорость_объектов_x_старш,X
C - - - - - 0x0053CE 01:93BE: A4 08     LDY ram_0008
C - - - - - 0x0053D0 01:93C0: A5 0A     LDA ram_000A
C - - - - - 0x0053D2 01:93C2: 18        CLC
C - - - - - 0x0053D3 01:93C3: 79 F9 93  ADC tbl_93F9_pos_Y,Y
C - - - - - 0x0053D6 01:93C6: 9D 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x0053D9 01:93C9: B9 FF 93  LDA tbl_93FF_pos_X,Y
C - - - - - 0x0053DC 01:93CC: 18        CLC
C - - - - - 0x0053DD 01:93CD: 65 0B     ADC ram_000B
C - - - - - 0x0053DF 01:93CF: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x0053E2 01:93D2: B9 05 94  LDA tbl_9405,Y
C - - - - - 0x0053E5 01:93D5: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x0053E8 01:93D8: A6 10     LDX ram_0010
C - - - - - 0x0053EA 01:93DA: C6 08     DEC ram_0008
C - - - - - 0x0053EC 01:93DC: 10 B1     BPL bra_938F_loop
bra_93DE:
C - - - - - 0x0053EE 01:93DE: A6 10     LDX ram_0010
bra_93E0_RTS:
C - - - - - 0x0053F0 01:93E0: 60        RTS



tbl_93E1_spd_Y:
- D 0 - - - 0x0053F1 01:93E1: 96 FE     .word $FE96 ; 00 
- D 0 - - - 0x0053F3 01:93E3: 00 04     .word $0400 ; 01 
- D 0 - - - 0x0053F5 01:93E5: 6A 01     .word $016A ; 02 
- D 0 - - - 0x0053F7 01:93E7: 96 FE     .word $FE96 ; 03 
- D 0 - - - 0x0053F9 01:93E9: 00 04     .word $0400 ; 04 
- D 0 - - - 0x0053FB 01:93EB: 6A 01     .word $016A ; 05 



tbl_93ED_spd_X:
- D 0 - - - 0x0053FD 01:93ED: 6A 01     .word $016A ; 00 
- D 0 - - - 0x0053FF 01:93EF: 00 02     .word $0200 ; 01 
- D 0 - - - 0x005401 01:93F1: 6A 01     .word $016A ; 02 
- D 0 - - - 0x005403 01:93F3: 96 FE     .word $FE96 ; 03 
- D 0 - - - 0x005405 01:93F5: 00 FE     .word $FE00 ; 04 
- D 0 - - - 0x005407 01:93F7: 96 FE     .word $FE96 ; 05 



tbl_93F9_pos_Y:
- D 0 - - - 0x005409 01:93F9: E6        .byte $E6   ; 00 
- D 0 - - - 0x00540A 01:93FA: F2        .byte $F2   ; 01 
- D 0 - - - 0x00540B 01:93FB: 02        .byte $02   ; 02 
- D 0 - - - 0x00540C 01:93FC: E6        .byte $E6   ; 03 
- D 0 - - - 0x00540D 01:93FD: F2        .byte $F2   ; 04 
- D 0 - - - 0x00540E 01:93FE: 02        .byte $02   ; 05 



tbl_93FF_pos_X:
- D 0 - - - 0x00540F 01:93FF: 1E        .byte $1E   ; 00 
- D 0 - - - 0x005410 01:9400: 22        .byte $22   ; 01 
- D 0 - - - 0x005411 01:9401: 1E        .byte $1E   ; 02 
- D 0 - - - 0x005412 01:9402: E2        .byte $E2   ; 03 
- D 0 - - - 0x005413 01:9403: DE        .byte $DE   ; 04 
- D 0 - - - 0x005414 01:9404: E2        .byte $E2   ; 05 



tbl_9405:
- D 0 - - - 0x005415 01:9405: 00        .byte $00   ; 00 
- D 0 - - - 0x005416 01:9406: 01        .byte $01   ; 01 
- D 0 - - - 0x005417 01:9407: 00        .byte $00   ; 02 
- D 0 - - - 0x005418 01:9408: 00        .byte $00   ; 03 
- D 0 - - - 0x005419 01:9409: 01        .byte $01   ; 04 
- D 0 - - - 0x00541A 01:940A: 00        .byte $00   ; 05 



sub_940B:
C - - - - - 0x00541B 01:940B: DE 02 07  DEC ram_0702_obj,X
C - - - - - 0x00541E 01:940E: D0 D0     BNE bra_93E0_RTS
C - - - - - 0x005420 01:9410: BD 9C 07  LDA ram_позиция_объектов_x_старш,X
C - - - - - 0x005423 01:9413: D0 16     BNE bra_942B
C - - - - - 0x005425 01:9415: 20 0B AB  JSR sub_0x006B1B_выбрать_ближайшего_игрока_по_оси_x
C - - - - - 0x005428 01:9418: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x00542B 01:941B: 38        SEC
C - - - - - 0x00542C 01:941C: F9 4C 05  SBC ram_позиция_x_спрайта_игрока,Y
C - - - - - 0x00542F 01:941F: B0 04     BCS bra_9425
C - - - - - 0x005431 01:9421: 49 FF     EOR #$FF
C - - - - - 0x005433 01:9423: 69 01     ADC #$01
bra_9425:
C - - - - - 0x005435 01:9425: C9 20     CMP #$20
C - - - - - 0x005437 01:9427: A9 05     LDA #$05
C - - - - - 0x005439 01:9429: 90 11     BCC bra_943C
bra_942B:
C - - - - - 0x00543B 01:942B: A9 07     LDA #$07
C - - - - - 0x00543D 01:942D: BC 76 06  LDY ram_жизни_объектов,X
C - - - - - 0x005440 01:9430: C0 10     CPY #$10
C - - - - - 0x005442 01:9432: B0 08     BCS bra_943C
C - - - - - 0x005444 01:9434: A9 06     LDA #$06
C - - - - - 0x005446 01:9436: C0 08     CPY #$08
C - - - - - 0x005448 01:9438: B0 02     BCS bra_943C
C - - - - - 0x00544A 01:943A: A9 05     LDA #$05
bra_943C:
C - - - - - 0x00544C 01:943C: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x00544F 01:943F: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x005452 01:9442: 4A        LSR
C - - - - - 0x005453 01:9443: A9 FF     LDA #$FF
C - - - - - 0x005455 01:9445: A0 08     LDY #$08
C - - - - - 0x005457 01:9447: 90 04     BCC bra_944D
C - - - - - 0x005459 01:9449: A9 01     LDA #$01
C - - - - - 0x00545B 01:944B: A0 00     LDY #$00
bra_944D:
C - - - - - 0x00545D 01:944D: 18        CLC
C - - - - - 0x00545E 01:944E: 7D 10 07  ADC ram_0710_obj,X
C - - - - - 0x005461 01:9451: C9 09     CMP #$09
C - - - - - 0x005463 01:9453: 90 01     BCC bra_9456
C - - - - - 0x005465 01:9455: 98        TYA
bra_9456:
C - - - - - 0x005466 01:9456: 9D 10 07  STA ram_0710_obj,X
C - - - - - 0x005469 01:9459: 20 AA 94  JSR sub_94AA
C - - - - - 0x00546C 01:945C: B9 BD 94  LDA tbl_94BD,Y
C - - - - - 0x00546F 01:945F: 18        CLC
C - - - - - 0x005470 01:9460: 7D 3C 05  ADC ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005473 01:9463: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005476 01:9466: BD 9C 07  LDA ram_позиция_объектов_x_старш,X
C - - - - - 0x005479 01:9469: 79 CF 94  ADC tbl_94CF,Y
C - - - - - 0x00547C 01:946C: 9D 9C 07  STA ram_позиция_объектов_x_старш,X
C - - - - - 0x00547F 01:946F: B9 E1 94  LDA tbl_94E1,Y
C - - - - - 0x005482 01:9472: F0 05     BEQ bra_9479_skip
C - - - - - 0x005484 01:9474: A9 1F     LDA #con_sound_1F
C - - - - - 0x005486 01:9476: 20 DE FD  JSR sub_0x01FDEE_play_sound
bra_9479_skip:
C - - - - - 0x005489 01:9479: BD 56 07  LDA ram_scroll_X_obj,X
C - - - - - 0x00548C 01:947C: 49 02     EOR #$02
C - - - - - 0x00548E 01:947E: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x005491 01:9481: A9 05     LDA #$05
C - - - - - 0x005493 01:9483: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x005496 01:9486: BD 9C 07  LDA ram_позиция_объектов_x_старш,X
C - - - - - 0x005499 01:9489: D0 1C     BNE bra_94A7
C - - - - - 0x00549B 01:948B: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x00549E 01:948E: 4A        LSR
C - - - - - 0x00549F 01:948F: A9 E0     LDA #$E0
C - - - - - 0x0054A1 01:9491: 90 02     BCC bra_9495
C - - - - - 0x0054A3 01:9493: A9 28     LDA #$28
bra_9495:
C - - - - - 0x0054A5 01:9495: DD 3C 05  CMP ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x0054A8 01:9498: 2A        ROL
C - - - - - 0x0054A9 01:9499: 5D 72 07  EOR ram_0772_obj,X
C - - - - - 0x0054AC 01:949C: 4A        LSR
C - - - - - 0x0054AD 01:949D: B0 08     BCS bra_94A7
C - - - - - 0x0054AF 01:949F: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x0054B2 01:94A2: 49 01     EOR #$01
C - - - - - 0x0054B4 01:94A4: 9D 72 07  STA ram_0772_obj,X
bra_94A7:
C - - - - - 0x0054B7 01:94A7: A6 10     LDX ram_0010
C - - - - - 0x0054B9 01:94A9: 60        RTS



sub_94AA:
C - - - - - 0x0054BA 01:94AA: BD 10 07  LDA ram_0710_obj,X
sub_94AD:
C - - - - - 0x0054BD 01:94AD: 85 00     STA ram_0000
C - - - - - 0x0054BF 01:94AF: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x0054C2 01:94B2: 4A        LSR
C - - - - - 0x0054C3 01:94B3: A9 00     LDA #$00
C - - - - - 0x0054C5 01:94B5: 90 02     BCC bra_94B9
C - - - - - 0x0054C7 01:94B7: A9 08     LDA #$08
bra_94B9:
C - - - - - 0x0054C9 01:94B9: 65 00     ADC ram_0000
C - - - - - 0x0054CB 01:94BB: A8        TAY
C - - - - - 0x0054CC 01:94BC: 60        RTS



tbl_94BD:
- D 0 - - - 0x0054CD 01:94BD: 00        .byte $00   ; 00 
- D 0 - - - 0x0054CE 01:94BE: 08        .byte $08   ; 01 
- D 0 - - - 0x0054CF 01:94BF: 00        .byte $00   ; 02 
- D 0 - - - 0x0054D0 01:94C0: 08        .byte $08   ; 03 
- D 0 - - - 0x0054D1 01:94C1: 00        .byte $00   ; 04 
- D 0 - - - 0x0054D2 01:94C2: 08        .byte $08   ; 05 
- D 0 - - - 0x0054D3 01:94C3: 00        .byte $00   ; 06 
- D 0 - - - 0x0054D4 01:94C4: 08        .byte $08   ; 07 
- D 0 - - - 0x0054D5 01:94C5: 00        .byte $00   ; 08 
- D 0 - - - 0x0054D6 01:94C6: 00        .byte $00   ; 09 
- D 0 - - - 0x0054D7 01:94C7: 00        .byte $00   ; 0A 
- D 0 - - - 0x0054D8 01:94C8: F8        .byte $F8   ; 0B 
- D 0 - - - 0x0054D9 01:94C9: 00        .byte $00   ; 0C 
- D 0 - - - 0x0054DA 01:94CA: F8        .byte $F8   ; 0D 
- D 0 - - - 0x0054DB 01:94CB: 00        .byte $00   ; 0E 
- D 0 - - - 0x0054DC 01:94CC: F8        .byte $F8   ; 0F 
- D 0 - - - 0x0054DD 01:94CD: 00        .byte $00   ; 10 
- D 0 - - - 0x0054DE 01:94CE: F8        .byte $F8   ; 11 



tbl_94CF:
- D 0 - - - 0x0054DF 01:94CF: 00        .byte $00   ; 00 
- D 0 - - - 0x0054E0 01:94D0: 00        .byte $00   ; 01 
- D 0 - - - 0x0054E1 01:94D1: 00        .byte $00   ; 02 
- D 0 - - - 0x0054E2 01:94D2: 00        .byte $00   ; 03 
- D 0 - - - 0x0054E3 01:94D3: 00        .byte $00   ; 04 
- D 0 - - - 0x0054E4 01:94D4: 00        .byte $00   ; 05 
- D 0 - - - 0x0054E5 01:94D5: 00        .byte $00   ; 06 
- D 0 - - - 0x0054E6 01:94D6: 00        .byte $00   ; 07 
- D 0 - - - 0x0054E7 01:94D7: 00        .byte $00   ; 08 
- D 0 - - - 0x0054E8 01:94D8: 00        .byte $00   ; 09 
- D 0 - - - 0x0054E9 01:94D9: 00        .byte $00   ; 0A 
- D 0 - - - 0x0054EA 01:94DA: FF        .byte $FF   ; 0B 
- D 0 - - - 0x0054EB 01:94DB: 00        .byte $00   ; 0C 
- D 0 - - - 0x0054EC 01:94DC: FF        .byte $FF   ; 0D 
- D 0 - - - 0x0054ED 01:94DD: 00        .byte $00   ; 0E 
- D 0 - - - 0x0054EE 01:94DE: FF        .byte $FF   ; 0F 
- D 0 - - - 0x0054EF 01:94DF: 00        .byte $00   ; 10 
- D 0 - - - 0x0054F0 01:94E0: FF        .byte $FF   ; 11 



tbl_94E1:
; 00 = skip sound
; 01 = play sound
- D 0 - - - 0x0054F1 01:94E1: 01        .byte $01   ; 00 
- D 0 - - - 0x0054F2 01:94E2: 00        .byte $00   ; 01 
- D 0 - - - 0x0054F3 01:94E3: 00        .byte $00   ; 02 
- D 0 - - - 0x0054F4 01:94E4: 00        .byte $00   ; 03 
- D 0 - - - 0x0054F5 01:94E5: 00        .byte $00   ; 04 
- D 0 - - - 0x0054F6 01:94E6: 01        .byte $01   ; 05 
- D 0 - - - 0x0054F7 01:94E7: 00        .byte $00   ; 06 
- D 0 - - - 0x0054F8 01:94E8: 00        .byte $00   ; 07 
- D 0 - - - 0x0054F9 01:94E9: 00        .byte $00   ; 08 
- D 0 - - - 0x0054FA 01:94EA: 00        .byte $00   ; 09 
- D 0 - - - 0x0054FB 01:94EB: 01        .byte $01   ; 0A 
- D 0 - - - 0x0054FC 01:94EC: 00        .byte $00   ; 0B 
- D 0 - - - 0x0054FD 01:94ED: 00        .byte $00   ; 0C 
- D 0 - - - 0x0054FE 01:94EE: 00        .byte $00   ; 0D 
- D 0 - - - 0x0054FF 01:94EF: 00        .byte $00   ; 0E 
- D 0 - - - 0x005500 01:94F0: 00        .byte $00   ; 0F 
- D 0 - - - 0x005501 01:94F1: 01        .byte $01   ; 10 
- D 0 - - - 0x005502 01:94F2: 00        .byte $00   ; 11 



sub_94F3:
C - - - - - 0x005503 01:94F3: A9 00     LDA #$00
C - - - - - 0x005505 01:94F5: 85 86     STA ram_0085_for_2006 + $01
C - - - - - 0x005507 01:94F7: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x00550A 01:94FA: C9 01     CMP #$01
C - - - - - 0x00550C 01:94FC: D0 03     BNE bra_9501
C - - - - - 0x00550E 01:94FE: 20 82 96  JSR sub_9682
bra_9501:
C - - - - - 0x005511 01:9501: BD 64 07  LDA ram_0764_obj,X
C - - - - - 0x005514 01:9504: D0 03     BNE bra_9509
C - - - - - 0x005516 01:9506: 4C FC 95  JMP loc_95FC
bra_9509:
C - - - - - 0x005519 01:9509: C9 03     CMP #$03
C - - - - - 0x00551B 01:950B: 90 03     BCC bra_9510
C - - - - - 0x00551D 01:950D: 4C FF 95  JMP loc_95FF
bra_9510:
C - - - - - 0x005520 01:9510: 0A        ASL
C - - - - - 0x005521 01:9511: 85 08     STA ram_0008
C - - - - - 0x005523 01:9513: BD 56 07  LDA ram_scroll_X_obj,X
C - - - - - 0x005526 01:9516: 0A        ASL
C - - - - - 0x005527 01:9517: 0A        ASL
C - - - - - 0x005528 01:9518: 49 08     EOR #$08
C - - - - - 0x00552A 01:951A: 85 0A     STA ram_000A
C - - - - - 0x00552C 01:951C: BD 72 07  LDA ram_0772_obj,X
C - - - - - 0x00552F 01:951F: 4A        LSR
C - - - - - 0x005530 01:9520: A9 01     LDA #$01
C - - - - - 0x005532 01:9522: A0 09     LDY #$09
C - - - - - 0x005534 01:9524: B0 04     BCS bra_952A
C - - - - - 0x005536 01:9526: A9 FF     LDA #$FF
C - - - - - 0x005538 01:9528: A0 F7     LDY #$F7
bra_952A:
C - - - - - 0x00553A 01:952A: 84 09     STY ram_0009
C - - - - - 0x00553C 01:952C: 18        CLC
C - - - - - 0x00553D 01:952D: 7D 10 07  ADC ram_0710_obj,X
C - - - - - 0x005540 01:9530: C9 09     CMP #$09
C - - - - - 0x005542 01:9532: 90 02     BCC bra_9536
C - - - - - 0x005544 01:9534: E5 09     SBC ram_0009
bra_9536:
C - - - - - 0x005546 01:9536: 85 0B     STA ram_000B
C - - - - - 0x005548 01:9538: 20 AD 94  JSR sub_94AD
C - - - - - 0x00554B 01:953B: B9 BD 94  LDA tbl_94BD,Y
C - - - - - 0x00554E 01:953E: 18        CLC
C - - - - - 0x00554F 01:953F: 7D 3C 05  ADC ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005552 01:9542: 85 0E     STA ram_000E
C - - - - - 0x005554 01:9544: BD 9C 07  LDA ram_позиция_объектов_x_старш,X
C - - - - - 0x005557 01:9547: 79 CF 94  ADC tbl_94CF,Y
C - - - - - 0x00555A 01:954A: 85 0F     STA ram_000F
C - - - - - 0x00555C 01:954C: BD 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x00555F 01:954F: 85 0D     STA ram_000D
C - - - - - 0x005561 01:9551: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x005563 01:9553: E0 20     CPX #$20
C - - - - - 0x005565 01:9555: 90 03     BCC bra_955A
- - - - - - 0x005567 01:9557: 4C FC 95  JMP loc_95FC
bra_955A:
; if buffer is not too loaded
C - - - - - 0x00556A 01:955A: A5 0B     LDA ram_000B    ; 00-08
C - - - - - 0x00556C 01:955C: 0A        ASL
C - - - - - 0x00556D 01:955D: 0A        ASL
C - - - - - 0x00556E 01:955E: 65 08     ADC ram_0008    ; 02/04
C - - - - - 0x005570 01:9560: A8        TAY
C - - - - - 0x005571 01:9561: B9 CE 96  LDA tbl_96D0 - $02,Y
C - - - - - 0x005574 01:9564: 85 08     STA ram_0008
C - - - - - 0x005576 01:9566: B9 CF 96  LDA tbl_96D0 - $02 + $01,Y
C - - - - - 0x005579 01:9569: 85 09     STA ram_0009
C - - - - - 0x00557B 01:956B: A0 00     LDY #$00
C - - - - - 0x00557D 01:956D: 84 0C     STY ram_000C
C - - - - - 0x00557F 01:956F: A9 07     LDA #con_buf_mode_07
C - - - - - 0x005581 01:9571: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x005584 01:9574: E8        INX
loc_9575_loop:
C D 0 - - - 0x005585 01:9575: A9 00     LDA #$00
C - - - - - 0x005587 01:9577: 85 02     STA ram_0002
C - - - - - 0x005589 01:9579: B1 08     LDA (ram_0008),Y
C - - - - - 0x00558B 01:957B: 10 02     BPL bra_957F
C - - - - - 0x00558D 01:957D: C6 02     DEC ram_0002    ; FF
bra_957F:
C - - - - - 0x00558F 01:957F: C9 80     CMP #$80
C - - - - - 0x005591 01:9581: D0 03     BNE bra_9586
C - - - - - 0x005593 01:9583: 4C EA 95  JMP loc_95EA_80
bra_9586:
C - - - - - 0x005596 01:9586: 18        CLC
C - - - - - 0x005597 01:9587: 65 0E     ADC ram_000E
C - - - - - 0x005599 01:9589: 85 05     STA ram_0005
C - - - - - 0x00559B 01:958B: C8        INY
C - - - - - 0x00559C 01:958C: C8        INY
; 1путин опт
C - - - - - 0x0055A1 01:9591: A5 02     LDA ram_0002    ; 00/FF
C - - - - - 0x0055A3 01:9593: 65 0F     ADC ram_000F
C - - - - - 0x0055A5 01:9595: D0 44     BNE bra_95DB
C - - - - - 0x0055A7 01:9597: A5 05     LDA ram_0005
C - - - - - 0x0055A9 01:9599: C9 04     CMP #$04
C - - - - - 0x0055AB 01:959B: 90 3E     BCC bra_95DB
C - - - - - 0x0055AD 01:959D: 88        DEY
C - - - - - 0x0055AE 01:959E: 84 12     STY ram_0012
C - - - - - 0x0055B0 01:95A0: A5 0D     LDA ram_000D
C - - - - - 0x0055B2 01:95A2: 18        CLC
C - - - - - 0x0055B3 01:95A3: 71 08     ADC (ram_0008),Y
C - - - - - 0x0055B5 01:95A5: A8        TAY
C - - - - - 0x0055B6 01:95A6: A5 05     LDA ram_0005
C - - - - - 0x0055B8 01:95A8: 20 80 BA  JSR sub_0x007A90
C - - - - - 0x0055BB 01:95AB: A4 12     LDY ram_0012
C - - - - - 0x0055BD 01:95AD: C8        INY
C - - - - - 0x0055BE 01:95AE: A5 01     LDA ram_0001
C - - - - - 0x0055C0 01:95B0: 05 0A     ORA ram_000A
C - - - - - 0x0055C2 01:95B2: 9D 00 03  STA ram_nmt_buffer,X    ; ppu hi
C - - - - - 0x0055C5 01:95B5: E8        INX
C - - - - - 0x0055C6 01:95B6: A5 00     LDA ram_0000
C - - - - - 0x0055C8 01:95B8: 9D 00 03  STA ram_nmt_buffer,X    ; ppu lo
C - - - - - 0x0055CB 01:95BB: E8        INX
C - - - - - 0x0055CC 01:95BC: B1 08     LDA (ram_0008),Y    ; counter
; 1путин опт
C - - - - - 0x0055D0 01:95C0: 9D 00 03  STA ram_nmt_buffer,X    ; counter
C - - - - - 0x0055D3 01:95C3: 85 0B     STA ram_000B
C - - - - - 0x0055D5 01:95C5: E8        INX
C - - - - - 0x0055D6 01:95C6: C8        INY
bra_95C7_loop:
C - - - - - 0x0055D7 01:95C7: B1 08     LDA (ram_0008),Y
C - - - - - 0x0055D9 01:95C9: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0055DC 01:95CC: 84 12     STY ram_0012
C - - - - - 0x0055DE 01:95CE: A4 12     LDY ram_0012
C - - - - - 0x0055E0 01:95D0: E8        INX
C - - - - - 0x0055E1 01:95D1: C8        INY
C - - - - - 0x0055E2 01:95D2: C6 0B     DEC ram_000B
C - - - - - 0x0055E4 01:95D4: D0 F1     BNE bra_95C7_loop
C - - - - - 0x0055E6 01:95D6: E6 0C     INC ram_000C
C - - - - - 0x0055E8 01:95D8: 4C 75 95  JMP loc_9575_loop
bra_95DB:
C - - - - - 0x0055EB 01:95DB: B1 08     LDA (ram_0008),Y    ; counter
; 1путин опт
C - - - - - 0x0055EF 01:95DF: 85 02     STA ram_0002
C - - - - - 0x0055F1 01:95E1: C8        INY
C - - - - - 0x0055F2 01:95E2: 98        TYA
C - - - - - 0x0055F3 01:95E3: 18        CLC
C - - - - - 0x0055F4 01:95E4: 65 02     ADC ram_0002
C - - - - - 0x0055F6 01:95E6: A8        TAY
C - - - - - 0x0055F7 01:95E7: 4C 75 95  JMP loc_9575_loop



loc_95EA_80:
C D 0 - - - 0x0055FA 01:95EA: A5 0C     LDA ram_000C
C - - - - - 0x0055FC 01:95EC: F0 08     BEQ bra_95F6
; close buffer
C - - - - - 0x0055FE 01:95EE: A9 FF     LDA #$FF
C - - - - - 0x005600 01:95F0: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x005603 01:95F3: E8        INX
C - - - - - 0x005604 01:95F4: 86 1E     STX ram_index_ppu_buffer
bra_95F6:
C - - - - - 0x005606 01:95F6: A6 10     LDX ram_0010
C - - - - - 0x005608 01:95F8: DE 64 07  DEC ram_0764_obj,X
C - - - - - 0x00560B 01:95FB: 18        CLC
loc_95FC:
C D 0 - - - 0x00560C 01:95FC: A6 10     LDX ram_0010
C - - - - - 0x00560E 01:95FE: 60        RTS



loc_95FF:
C D 0 - - - 0x00560F 01:95FF: 0A        ASL
C - - - - - 0x005610 01:9600: A8        TAY
C - - - - - 0x005611 01:9601: BD 56 07  LDA ram_scroll_X_obj,X
C - - - - - 0x005614 01:9604: 0A        ASL
C - - - - - 0x005615 01:9605: 0A        ASL
C - - - - - 0x005616 01:9606: 49 08     EOR #$08
C - - - - - 0x005618 01:9608: 85 0A     STA ram_000A
C - - - - - 0x00561A 01:960A: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x00561C 01:960C: E0 20     CPX #$20
C - - - - - 0x00561E 01:960E: B0 60     BCS bra_9670
C - - - - - 0x005620 01:9610: A9 03     LDA #con_buf_mode_03
C - - - - - 0x005622 01:9612: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x005625 01:9615: E8        INX
C - - - - - 0x005626 01:9616: B9 71 96  LDA tbl_9676 + $01 - $06,Y
C - - - - - 0x005629 01:9619: 18        CLC
C - - - - - 0x00562A 01:961A: 65 0A     ADC ram_000A
C - - - - - 0x00562C 01:961C: 9D 00 03  STA ram_nmt_buffer,X    ; ppu hi
C - - - - - 0x00562F 01:961F: E8        INX
C - - - - - 0x005630 01:9620: B9 70 96  LDA tbl_9676 - $06,Y
C - - - - - 0x005633 01:9623: 9D 00 03  STA ram_nmt_buffer,X    ; ppu lo
C - - - - - 0x005636 01:9626: E8        INX
C - - - - - 0x005637 01:9627: 98        TYA
C - - - - - 0x005638 01:9628: 4A        LSR
C - - - - - 0x005639 01:9629: A8        TAY
C - - - - - 0x00563A 01:962A: B9 70 96  LDA tbl_9673 - $03,Y
C - - - - - 0x00563D 01:962D: 9D 00 03  STA ram_nmt_buffer,X    ; counter
C - - - - - 0x005640 01:9630: 4A        LSR
C - - - - - 0x005641 01:9631: 4A        LSR
C - - - - - 0x005642 01:9632: 85 0B     STA ram_000B
C - - - - - 0x005644 01:9634: E8        INX
C - - - - - 0x005645 01:9635: A9 00     LDA #$00
C - - - - - 0x005647 01:9637: C0 05     CPY #$05
C - - - - - 0x005649 01:9639: D0 02     BNE bra_963D
C - - - - - 0x00564B 01:963B: A9 AC     LDA #$AC
bra_963D:
C - - - - - 0x00564D 01:963D: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x005650 01:9640: E8        INX
C - - - - - 0x005651 01:9641: C0 03     CPY #$03
C - - - - - 0x005653 01:9643: D0 21     BNE bra_9666
sub_9645:
C - - - - - 0x005655 01:9645: A9 03     LDA #con_buf_mode_03
C - - - - - 0x005657 01:9647: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x00565A 01:964A: E8        INX
C - - - - - 0x00565B 01:964B: A9 23     LDA #> $23E0
C - - - - - 0x00565D 01:964D: 18        CLC
C - - - - - 0x00565E 01:964E: 65 0A     ADC ram_000A
C - - - - - 0x005660 01:9650: 9D 00 03  STA ram_nmt_buffer,X    ; ppu hi
C - - - - - 0x005663 01:9653: E8        INX
C - - - - - 0x005664 01:9654: A9 E0     LDA #< $23E0
C - - - - - 0x005666 01:9656: 9D 00 03  STA ram_nmt_buffer,X    ; ppu lo
C - - - - - 0x005669 01:9659: E8        INX
C - - - - - 0x00566A 01:965A: A9 20     LDA #$20
C - - - - - 0x00566C 01:965C: 9D 00 03  STA ram_nmt_buffer,X    ; counter
C - - - - - 0x00566F 01:965F: E8        INX
C - - - - - 0x005670 01:9660: A9 FF     LDA #$FF
C - - - - - 0x005672 01:9662: 9D 00 03  STA ram_nmt_buffer,X    ; fill tile
C - - - - - 0x005675 01:9665: E8        INX
bra_9666:
C - - - - - 0x005676 01:9666: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x005678 01:9668: E6 86     INC ram_0085_for_2006 + $01
C - - - - - 0x00567A 01:966A: A6 10     LDX ram_0010
C - - - - - 0x00567C 01:966C: DE 64 07  DEC ram_0764_obj,X
C - - - - - 0x00567F 01:966F: 18        CLC
bra_9670:
C - - - - - 0x005680 01:9670: A6 10     LDX ram_0010
C - - - - - 0x005682 01:9672: 60        RTS



tbl_9673:
- D 0 - - - 0x005683 01:9673: 70        .byte $70   ; 03
- D 0 - - - 0x005684 01:9674: 70        .byte $70   ; 04
- D 0 - - - 0x005685 01:9675: 20        .byte $20   ; 05



tbl_9676:
- D 0 - - - 0x005686 01:9676: 00        .word $2200 ; 03
- D 0 - - - 0x005688 01:9678: 70        .word $2270 ; 04
- D 0 - - - 0x00568A 01:967A: E0        .word $22E0 ; 05




sub_9682:
C - - - - - 0x005692 01:9682: BD 56 07  LDA ram_scroll_X_obj,X
C - - - - - 0x005695 01:9685: 6A        ROR
C - - - - - 0x005696 01:9686: 6A        ROR
C - - - - - 0x005697 01:9687: 6A        ROR
C - - - - - 0x005698 01:9688: 49 80     EOR #$80
C - - - - - 0x00569A 01:968A: 29 80     AND #$80
C - - - - - 0x00569C 01:968C: 09 40     ORA #$40
C - - - - - 0x00569E 01:968E: 85 08     STA ram_0008
C - - - - - 0x0056A0 01:9690: A8        TAY
C - - - - - 0x0056A1 01:9691: A2 08     LDX #$08
C - - - - - 0x0056A3 01:9693: A9 00     LDA #$00
bra_9695_loop:
C - - - - - 0x0056A5 01:9695: 99 00 04  STA ram_0400,Y
C - - - - - 0x0056A8 01:9698: C8        INY
C - - - - - 0x0056A9 01:9699: CA        DEX
C - - - - - 0x0056AA 01:969A: D0 F9     BNE bra_9695_loop
C - - - - - 0x0056AC 01:969C: A6 10     LDX ram_0010
C - - - - - 0x0056AE 01:969E: BD 9C 07  LDA ram_позиция_объектов_x_старш,X
C - - - - - 0x0056B1 01:96A1: D0 26     BNE bra_96C9_RTS
C - - - - - 0x0056B3 01:96A3: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x0056B6 01:96A6: 38        SEC
C - - - - - 0x0056B7 01:96A7: E9 18     SBC #$18
C - - - - - 0x0056B9 01:96A9: 4A        LSR
C - - - - - 0x0056BA 01:96AA: 4A        LSR
C - - - - - 0x0056BB 01:96AB: 4A        LSR
C - - - - - 0x0056BC 01:96AC: 4A        LSR
C - - - - - 0x0056BD 01:96AD: 4A        LSR
C - - - - - 0x0056BE 01:96AE: 05 08     ORA ram_0008
C - - - - - 0x0056C0 01:96B0: A8        TAY
C - - - - - 0x0056C1 01:96B1: A2 00     LDX #$00
C - - - - - 0x0056C3 01:96B3: 90 02     BCC bra_96B7
C - - - - - 0x0056C5 01:96B5: A2 03     LDX #$03
bra_96B7:
C - - - - - 0x0056C7 01:96B7: A9 03     LDA #$03
C - - - - - 0x0056C9 01:96B9: 85 08     STA ram_0008
bra_96BB_loop:
C - - - - - 0x0056CB 01:96BB: BD CA 96  LDA tbl_96CA,X
C - - - - - 0x0056CE 01:96BE: 99 00 04  STA ram_0400,Y
C - - - - - 0x0056D1 01:96C1: E8        INX
C - - - - - 0x0056D2 01:96C2: C8        INY
C - - - - - 0x0056D3 01:96C3: C6 08     DEC ram_0008
C - - - - - 0x0056D5 01:96C5: D0 F4     BNE bra_96BB_loop
C - - - - - 0x0056D7 01:96C7: A6 10     LDX ram_0010
bra_96C9_RTS:
C - - - - - 0x0056D9 01:96C9: 60        RTS



tbl_96CA:
; 00 
- D 0 - - - 0x0056DA 01:96CA: 22        .byte $22   ; 
- D 0 - - - 0x0056DB 01:96CB: 22        .byte $22   ; 
- D 0 - - - 0x0056DC 01:96CC: 00        .byte $00   ; 
; 03 
- D 0 - - - 0x0056DD 01:96CD: 02        .byte $02   ; 
- D 0 - - - 0x0056DE 01:96CE: 22        .byte $22   ; 
- D 0 - - - 0x0056DF 01:96CF: 20        .byte $20   ; 



tbl_96D0:
- D 0 - - - 0x0056E0 01:96D0: F4 96     .word _off017_96F4_01
- D 0 - - - 0x0056E2 01:96D2: 23 97     .word _off017_9723_02
- D 0 - - - 0x0056E4 01:96D4: F4 96     .word _off017_96F4_03
- D 0 - - - 0x0056E6 01:96D6: 51 97     .word _off017_9751_04
- D 0 - - - 0x0056E8 01:96D8: 75 97     .word _off017_9775_05
- D 0 - - - 0x0056EA 01:96DA: A3 97     .word _off017_97A3_06
- D 0 - - - 0x0056EC 01:96DC: C6 97     .word _off017_97C6_07
- D 0 - - - 0x0056EE 01:96DE: EF 97     .word _off017_97EF_08
- D 0 - - - 0x0056F0 01:96E0: 1D 98     .word _off017_981D_09
- D 0 - - - 0x0056F2 01:96E2: 4E 98     .word _off017_984E_0A
- D 0 - - - 0x0056F4 01:96E4: 80 98     .word _off017_9880_0B
- D 0 - - - 0x0056F6 01:96E6: AE 98     .word _off017_98AE_0C
- D 0 - - - 0x0056F8 01:96E8: E5 98     .word _off017_98E5_0D
- D 0 - - - 0x0056FA 01:96EA: 14 99     .word _off017_9914_0E
- D 0 - - - 0x0056FC 01:96EC: 41 99     .word _off017_9941_0F
- D 0 - - - 0x0056FE 01:96EE: 6B 99     .word _off017_996B_10
- D 0 - - - 0x005700 01:96F0: F4 96     .word _off017_96F4_11
- D 0 - - - 0x005702 01:96F2: 97 99     .word _off017_9997_12



_off017_96F4_01:
_off017_96F4_03:
_off017_96F4_11:
- D 0 - I - 0x005704 01:96F4: D8        .byte $D8   ; 
- D 0 - I - 0x005705 01:96F5: F8        .byte $F8   ; 
- D 0 - I - 0x005706 01:96F6: 05        .byte $05   ; counter
- D 0 - I - 0x005707 01:96F7: 0D        .byte $0D, $16, $20, $36, $3A   ; 

- D 0 - I - 0x00570C 01:96FC: E0        .byte $E0   ; 
- D 0 - I - 0x00570D 01:96FD: E8        .byte $E8   ; 
- D 0 - I - 0x00570E 01:96FE: 07        .byte $07   ; counter
- D 0 - I - 0x00570F 01:96FF: 01        .byte $01, $05, $0E, $17, $21, $37, $3B   ; 

- D 0 - I - 0x005716 01:9706: E8        .byte $E8   ; 
- D 0 - I - 0x005717 01:9707: E8        .byte $E8   ; 
- D 0 - I - 0x005718 01:9708: 08        .byte $08   ; counter
- D 0 - I - 0x005719 01:9709: 02        .byte $02, $06, $0F, $18, $22, $38, $3C, $3E   ; 

- D 0 - I - 0x005721 01:9711: F0        .byte $F0   ; 
- D 0 - I - 0x005722 01:9712: F0        .byte $F0   ; 
- D 0 - I - 0x005723 01:9713: 07        .byte $07   ; counter
- D 0 - I - 0x005724 01:9714: 07        .byte $07, $10, $19, $23, $39, $3D, $3F   ; 

- D 0 - I - 0x00572B 01:971B: F8        .byte $F8   ; 
- D 0 - I - 0x00572C 01:971C: F0        .byte $F0   ; 
- D 0 - I - 0x00572D 01:971D: 04        .byte $04   ; counter
- D 0 - I - 0x00572E 01:971E: 08        .byte $08, $11, $1A, $24   ; 

- D 0 - I - 0x005732 01:9722: 80        .byte $80   ; end token



_off017_9723_02:
- D 0 - I - 0x005733 01:9723: 00        .byte $00   ; 
- D 0 - I - 0x005734 01:9724: F0        .byte $F0   ; 
- D 0 - I - 0x005735 01:9725: 04        .byte $04   ; counter
- D 0 - I - 0x005736 01:9726: 09        .byte $09, $12, $1B, $25   ; 

- D 0 - I - 0x00573A 01:972A: 08        .byte $08   ; 
- D 0 - I - 0x00573B 01:972B: F0        .byte $F0   ; 
- D 0 - I - 0x00573C 01:972C: 06        .byte $06   ; counter
- D 0 - I - 0x00573D 01:972D: 0A        .byte $0A, $13, $1C, $26, $36, $3A   ; 

- D 0 - I - 0x005743 01:9733: 10        .byte $10   ; 
- D 0 - I - 0x005744 01:9734: E8        .byte $E8   ; 
- D 0 - I - 0x005745 01:9735: 07        .byte $07   ; counter
- D 0 - I - 0x005746 01:9736: 03        .byte $03, $0B, $14, $1D, $32, $37, $3B   ; 

- D 0 - I - 0x00574D 01:973D: 18        .byte $18   ; 
- D 0 - I - 0x00574E 01:973E: E8        .byte $E8   ; 
- D 0 - I - 0x00574F 01:973F: 08        .byte $08   ; counter
- D 0 - I - 0x005750 01:9740: 04        .byte $04, $0C, $15, $1E, $33, $38, $3C, $3E   ; 

- D 0 - I - 0x005758 01:9748: 20        .byte $20   ; 
- D 0 - I - 0x005759 01:9749: 00        .byte $00   ; 
- D 0 - I - 0x00575A 01:974A: 05        .byte $05   ; counter
- D 0 - I - 0x00575B 01:974B: 1F        .byte $1F, $35, $39, $3D, $3F   ; 

- D 0 - I - 0x005760 01:9750: 80        .byte $80   ; end token



_off017_9751_04:
- D 0 - I - 0x005761 01:9751: 00        .byte $00   ; 
- D 0 - I - 0x005762 01:9752: F0        .byte $F0   ; 
- D 0 - I - 0x005763 01:9753: 04        .byte $04   ; counter
- D 0 - I - 0x005764 01:9754: 09        .byte $09, $12, $42, $45   ; 

- D 0 - I - 0x005768 01:9758: 08        .byte $08   ; 
- D 0 - I - 0x005769 01:9759: F0        .byte $F0   ; 
- D 0 - I - 0x00576A 01:975A: 06        .byte $06   ; counter
- D 0 - I - 0x00576B 01:975B: 0A        .byte $0A, $13, $43, $46, $36, $3A   ; 

- D 0 - I - 0x005771 01:9761: 10        .byte $10   ; 
- D 0 - I - 0x005772 01:9762: E8        .byte $E8   ; 
- D 0 - I - 0x005773 01:9763: 07        .byte $07   ; counter
- D 0 - I - 0x005774 01:9764: 03        .byte $03, $0B, $40, $44, $38, $3C, $3B   ; 

- D 0 - I - 0x00577B 01:976B: 18        .byte $18   ; 
- D 0 - I - 0x00577C 01:976C: E8        .byte $E8   ; 
- D 0 - I - 0x00577D 01:976D: 06        .byte $06   ; counter
- D 0 - I - 0x00577E 01:976E: 04        .byte $04, $0C, $41, $35, $39, $3D   ; 

- D 0 - I - 0x005784 01:9774: 80        .byte $80   ; end token



_off017_9775_05:
- D 0 - I - 0x005785 01:9775: D8        .byte $D8   ; 
- D 0 - I - 0x005786 01:9776: F0        .byte $F0   ; 
- D 0 - I - 0x005787 01:9777: 05        .byte $05   ; counter
- D 0 - I - 0x005788 01:9778: 49        .byte $49, $4B, $20, $36, $3A   ; 

- D 0 - I - 0x00578D 01:977D: E0        .byte $E0   ; 
- D 0 - I - 0x00578E 01:977E: E8        .byte $E8   ; 
- D 0 - I - 0x00578F 01:977F: 06        .byte $06   ; counter
- D 0 - I - 0x005790 01:9780: 01        .byte $01, $05, $4C, $52, $37, $3B   ; 

- D 0 - I - 0x005796 01:9786: E8        .byte $E8   ; 
- D 0 - I - 0x005797 01:9787: E8        .byte $E8   ; 
- D 0 - I - 0x005798 01:9788: 05        .byte $05   ; counter
- D 0 - I - 0x005799 01:9789: 02        .byte $02, $06, $4D, $53, $59   ; 

- D 0 - I - 0x00579E 01:978E: F0        .byte $F0   ; 
- D 0 - I - 0x00579F 01:978F: F0        .byte $F0   ; 
- D 0 - I - 0x0057A0 01:9790: 07        .byte $07   ; counter
- D 0 - I - 0x0057A1 01:9791: 07        .byte $07, $4E, $54, $5A, $38, $3C, $3E   ; 

- D 0 - I - 0x0057A8 01:9798: F8        .byte $F8   ; 
- D 0 - I - 0x0057A9 01:9799: F0        .byte $F0   ; 
- D 0 - I - 0x0057AA 01:979A: 07        .byte $07   ; counter
- D 0 - I - 0x0057AB 01:979B: 08        .byte $08, $4F, $55, $35, $39, $3D, $3F   ; 

- D 0 - I - 0x0057B2 01:97A2: 80        .byte $80   ; end token



_off017_97A3_06:
- D 0 - I - 0x0057B3 01:97A3: 00        .byte $00   ; 
- D 0 - I - 0x0057B4 01:97A4: F0        .byte $F0   ; 
- D 0 - I - 0x0057B5 01:97A5: 04        .byte $04   ; counter
- D 0 - I - 0x0057B6 01:97A6: 09        .byte $09, $12, $56, $5B   ; 

- D 0 - I - 0x0057BA 01:97AA: 08        .byte $08   ; 
- D 0 - I - 0x0057BB 01:97AB: F0        .byte $F0   ; 
- D 0 - I - 0x0057BC 01:97AC: 04        .byte $04   ; counter
- D 0 - I - 0x0057BD 01:97AD: 0A        .byte $0A, $50, $57, $5C   ; 

- D 0 - I - 0x0057C1 01:97B1: 10        .byte $10   ; 
- D 0 - I - 0x0057C2 01:97B2: E8        .byte $E8   ; 
- D 0 - I - 0x0057C3 01:97B3: 07        .byte $07   ; counter
- D 0 - I - 0x0057C4 01:97B4: 47        .byte $47, $4A, $51, $58, $3C, $5D, $3A   ; 

- D 0 - I - 0x0057CB 01:97BB: 18        .byte $18   ; 
- D 0 - I - 0x0057CC 01:97BC: E8        .byte $E8   ; 
- D 0 - I - 0x0057CD 01:97BD: 07        .byte $07   ; counter
- D 0 - I - 0x0057CE 01:97BE: 48        .byte $48, $1F, $35, $39, $3D, $5E, $3B   ; 

- D 0 - I - 0x0057D5 01:97C5: 80        .byte $80   ; end token



_off017_97C6_07:
- D 0 - I - 0x0057D6 01:97C6: D0        .byte $D0   ; 
- D 0 - I - 0x0057D7 01:97C7: E8        .byte $E8   ; 
- D 0 - I - 0x0057D8 01:97C8: 05        .byte $05   ; counter
- D 0 - I - 0x0057D9 01:97C9: 5F        .byte $5F, $61, $20, $36, $3A   ; 

- D 0 - I - 0x0057DE 01:97CE: D8        .byte $D8   ; 
- D 0 - I - 0x0057DF 01:97CF: E8        .byte $E8   ; 
- D 0 - I - 0x0057E0 01:97D0: 05        .byte $05   ; counter
- D 0 - I - 0x0057E1 01:97D1: 60        .byte $60, $62, $64, $37, $3B   ; 

- D 0 - I - 0x0057E6 01:97D6: E0        .byte $E0   ; 
- D 0 - I - 0x0057E7 01:97D7: E8        .byte $E8   ; 
- D 0 - I - 0x0057E8 01:97D8: 04        .byte $04   ; counter
- D 0 - I - 0x0057E9 01:97D9: 01        .byte $01, $63, $65, $68   ; 

- D 0 - I - 0x0057ED 01:97DD: E8        .byte $E8   ; 
- D 0 - I - 0x0057EE 01:97DE: E8        .byte $E8   ; 
- D 0 - I - 0x0057EF 01:97DF: 04        .byte $04   ; counter
- D 0 - I - 0x0057F0 01:97E0: 02        .byte $02, $06, $4D, $69   ; 

- D 0 - I - 0x0057F4 01:97E4: F0        .byte $F0   ; 
- D 0 - I - 0x0057F5 01:97E5: F0        .byte $F0   ; 
- D 0 - I - 0x0057F6 01:97E6: 07        .byte $07   ; counter
- D 0 - I - 0x0057F7 01:97E7: 07        .byte $07, $4E, $6A, $22, $38, $3C, $3E   ; 

- D 0 - I - 0x0057FE 01:97EE: 80        .byte $80   ; end token



_off017_97EF_08:
- D 0 - I - 0x0057FF 01:97EF: F8        .byte $F8   ; 
- D 0 - I - 0x005800 01:97F0: F0        .byte $F0   ; 
- D 0 - I - 0x005801 01:97F1: 07        .byte $07   ; counter
- D 0 - I - 0x005802 01:97F2: 08        .byte $08, $4F, $55, $35, $39, $3D, $3F   ; 

- D 0 - I - 0x005809 01:97F9: 00        .byte $00   ; 
- D 0 - I - 0x00580A 01:97FA: F0        .byte $F0   ; 
- D 0 - I - 0x00580B 01:97FB: 04        .byte $04   ; counter
- D 0 - I - 0x00580C 01:97FC: 09        .byte $09, $12, $6B, $6E   ; 

- D 0 - I - 0x005810 01:9800: 08        .byte $08   ; 
- D 0 - I - 0x005811 01:9801: F0        .byte $F0   ; 
- D 0 - I - 0x005812 01:9802: 05        .byte $05   ; counter
- D 0 - I - 0x005813 01:9803: 0A        .byte $0A, $66, $6C, $6F, $3C   ; 

- D 0 - I - 0x005818 01:9808: 10        .byte $10   ; 
- D 0 - I - 0x005819 01:9809: E8        .byte $E8   ; 
- D 0 - I - 0x00581A 01:980A: 07        .byte $07   ; counter
- D 0 - I - 0x00581B 01:980B: 03        .byte $03, $0B, $67, $35, $39, $3D, $3A   ; 

- D 0 - I - 0x005822 01:9812: 18        .byte $18   ; 
- D 0 - I - 0x005823 01:9813: E8        .byte $E8   ; 
- D 0 - I - 0x005824 01:9814: 07        .byte $07   ; counter
- D 0 - I - 0x005825 01:9815: 04        .byte $04, $0C, $15, $6D, $21, $37, $3B   ; 

- D 0 - I - 0x00582C 01:981C: 80        .byte $80   ; end token



_off017_981D_09:
- D 0 - I - 0x00582D 01:981D: D0        .byte $D0   ; 
- D 0 - I - 0x00582E 01:981E: F0        .byte $F0   ; 
- D 0 - I - 0x00582F 01:981F: 05        .byte $05   ; counter
- D 0 - I - 0x005830 01:9820: 70        .byte $70, $72, $20, $36, $3A   ; 

- D 0 - I - 0x005835 01:9825: D8        .byte $D8   ; 
- D 0 - I - 0x005836 01:9826: F0        .byte $F0   ; 
- D 0 - I - 0x005837 01:9827: 05        .byte $05   ; counter
- D 0 - I - 0x005838 01:9828: 71        .byte $71, $73, $77, $37, $3B   ; 

- D 0 - I - 0x00583D 01:982D: E0        .byte $E0   ; 
- D 0 - I - 0x00583E 01:982E: E8        .byte $E8   ; 
- D 0 - I - 0x00583F 01:982F: 04        .byte $04   ; counter
- D 0 - I - 0x005840 01:9830: 01        .byte $01, $05, $74, $78   ; 

- D 0 - I - 0x005844 01:9834: E8        .byte $E8   ; 
- D 0 - I - 0x005845 01:9835: E8        .byte $E8   ; 
- D 0 - I - 0x005846 01:9836: 05        .byte $05   ; counter
- D 0 - I - 0x005847 01:9837: 02        .byte $02, $06, $4D, $79, $81   ; 

- D 0 - I - 0x00584C 01:983C: F0        .byte $F0   ; 
- D 0 - I - 0x00584D 01:983D: F0        .byte $F0   ; 
- D 0 - I - 0x00584E 01:983E: 04        .byte $04   ; counter
- D 0 - I - 0x00584F 01:983F: 07        .byte $07, $10, $7A, $82   ; 

- D 0 - I - 0x005853 01:9843: F8        .byte $F8   ; 
- D 0 - I - 0x005854 01:9844: F0        .byte $F0   ; 
- D 0 - I - 0x005855 01:9845: 07        .byte $07   ; counter
- D 0 - I - 0x005856 01:9846: 08        .byte $08, $11, $7B, $83, $38, $3C, $3E   ; 

- D 0 - I - 0x00585D 01:984D: 80        .byte $80   ; end token



_off017_984E_0A:
- D 0 - I - 0x00585E 01:984E: 00        .byte $00   ; 
- D 0 - I - 0x00585F 01:984F: F0        .byte $F0   ; 
- D 0 - I - 0x005860 01:9850: 07        .byte $07   ; counter
- D 0 - I - 0x005861 01:9851: 09        .byte $09, $12, $7C, $84, $39, $3D, $3F   ; 

- D 0 - I - 0x005868 01:9858: 08        .byte $08   ; 
- D 0 - I - 0x005869 01:9859: F0        .byte $F0   ; 
- D 0 - I - 0x00586A 01:985A: 07        .byte $07   ; counter
- D 0 - I - 0x00586B 01:985B: 0A        .byte $0A, $13, $7D, $85, $38, $3C, $3E   ; 

- D 0 - I - 0x005872 01:9862: 10        .byte $10   ; 
- D 0 - I - 0x005873 01:9863: E8        .byte $E8   ; 
- D 0 - I - 0x005874 01:9864: 08        .byte $08   ; counter
- D 0 - I - 0x005875 01:9865: 03        .byte $03, $0B, $14, $7E, $35, $39, $3D, $3F   ; 

- D 0 - I - 0x00587D 01:986D: 18        .byte $18   ; 
- D 0 - I - 0x00587E 01:986E: E8        .byte $E8   ; 
- D 0 - I - 0x00587F 01:986F: 07        .byte $07   ; counter
- D 0 - I - 0x005880 01:9870: 04        .byte $04, $0C, $75, $7F, $20, $36, $3A   ; 

- D 0 - I - 0x005887 01:9877: 20        .byte $20   ; 
- D 0 - I - 0x005888 01:9878: F8        .byte $F8   ; 
- D 0 - I - 0x005889 01:9879: 05        .byte $05   ; counter
- D 0 - I - 0x00588A 01:987A: 76        .byte $76, $80, $21, $37, $3B   ; 

- D 0 - I - 0x00588F 01:987F: 80        .byte $80   ; end token



_off017_9880_0B:
- D 0 - I - 0x005890 01:9880: C8        .byte $C8   ; 
- D 0 - I - 0x005891 01:9881: F8        .byte $F8   ; 
- D 0 - I - 0x005892 01:9882: 05        .byte $05   ; counter
- D 0 - I - 0x005893 01:9883: 86        .byte $86, $8B, $20, $36, $3A   ; 

- D 0 - I - 0x005898 01:9888: D0        .byte $D0   ; 
- D 0 - I - 0x005899 01:9889: F8        .byte $F8   ; 
- D 0 - I - 0x00589A 01:988A: 05        .byte $05   ; counter
- D 0 - I - 0x00589B 01:988B: 87        .byte $87, $8C, $21, $37, $3B   ; 

- D 0 - I - 0x0058A0 01:9890: D8        .byte $D8   ; 
- D 0 - I - 0x0058A1 01:9891: 00        .byte $00   ; 
- D 0 - I - 0x0058A2 01:9892: 02        .byte $02   ; counter
- D 0 - I - 0x0058A3 01:9893: 8D        .byte $8D, $93   ; 

- D 0 - I - 0x0058A5 01:9895: E0        .byte $E0   ; 
- D 0 - I - 0x0058A6 01:9896: E8        .byte $E8   ; 
- D 0 - I - 0x0058A7 01:9897: 05        .byte $05   ; counter
- D 0 - I - 0x0058A8 01:9898: 01        .byte $01, $05, $88, $8E, $94   ; 

- D 0 - I - 0x0058AD 01:989D: E8        .byte $E8   ; 
- D 0 - I - 0x0058AE 01:989E: E8        .byte $E8   ; 
- D 0 - I - 0x0058AF 01:989F: 05        .byte $05   ; counter
- D 0 - I - 0x0058B0 01:98A0: 02        .byte $02, $06, $4D, $8F, $95   ; 

- D 0 - I - 0x0058B5 01:98A5: F0        .byte $F0   ; 
- D 0 - I - 0x0058B6 01:98A6: F0        .byte $F0   ; 
- D 0 - I - 0x0058B7 01:98A7: 05        .byte $05   ; counter
- D 0 - I - 0x0058B8 01:98A8: 07        .byte $07, $89, $22, $38, $3C   ; 

- D 0 - I - 0x0058BD 01:98AD: 80        .byte $80   ; end token



_off017_98AE_0C:
- D 0 - I - 0x0058BE 01:98AE: F8        .byte $F8   ; 
- D 0 - I - 0x0058BF 01:98AF: F0        .byte $F0   ; 
- D 0 - I - 0x0058C0 01:98B0: 05        .byte $05   ; counter
- D 0 - I - 0x0058C1 01:98B1: 08        .byte $08, $8A, $90, $39, $3D   ; 

- D 0 - I - 0x0058C6 01:98B6: 00        .byte $00   ; 
- D 0 - I - 0x0058C7 01:98B7: F0        .byte $F0   ; 
- D 0 - I - 0x0058C8 01:98B8: 04        .byte $04   ; counter
- D 0 - I - 0x0058C9 01:98B9: 09        .byte $09, $12, $91, $96   ; 

- D 0 - I - 0x0058CD 01:98BD: 08        .byte $08   ; 
- D 0 - I - 0x0058CE 01:98BE: F0        .byte $F0   ; 
- D 0 - I - 0x0058CF 01:98BF: 07        .byte $07   ; counter
- D 0 - I - 0x0058D0 01:98C0: 0A        .byte $0A, $13, $92, $97, $38, $3C, $3E   ; 

- D 0 - I - 0x0058D7 01:98C7: 10        .byte $10   ; 
- D 0 - I - 0x0058D8 01:98C8: E8        .byte $E8   ; 
- D 0 - I - 0x0058D9 01:98C9: 08        .byte $08   ; counter
- D 0 - I - 0x0058DA 01:98CA: 03        .byte $03, $0B, $14, $7E, $35, $39, $3D, $3F   ; 

- D 0 - I - 0x0058E2 01:98D2: 18        .byte $18   ; 
- D 0 - I - 0x0058E3 01:98D3: E8        .byte $E8   ; 
- D 0 - I - 0x0058E4 01:98D4: 07        .byte $07   ; counter
- D 0 - I - 0x0058E5 01:98D5: 04        .byte $04, $0C, $75, $7F, $20, $36, $3A   ; 

- D 0 - I - 0x0058EC 01:98DC: 20        .byte $20   ; 
- D 0 - I - 0x0058ED 01:98DD: F8        .byte $F8   ; 
- D 0 - I - 0x0058EE 01:98DE: 05        .byte $05   ; counter
- D 0 - I - 0x0058EF 01:98DF: 76        .byte $76, $80, $21, $37, $3B   ; 

- D 0 - I - 0x0058F4 01:98E4: 80        .byte $80   ; end token



_off017_98E5_0D:
- D 0 - I - 0x0058F5 01:98E5: D0        .byte $D0   ; 
- D 0 - I - 0x0058F6 01:98E6: F8        .byte $F8   ; 
- D 0 - I - 0x0058F7 01:98E7: 05        .byte $05   ; counter
- D 0 - I - 0x0058F8 01:98E8: 5F        .byte $5F, $9F, $20, $36, $3A   ; 

- D 0 - I - 0x0058FD 01:98ED: D8        .byte $D8   ; 
- D 0 - I - 0x0058FE 01:98EE: F8        .byte $F8   ; 
- D 0 - I - 0x0058FF 01:98EF: 05        .byte $05   ; counter
- D 0 - I - 0x005900 01:98F0: 71        .byte $71, $A0, $21, $37, $3B   ; 

- D 0 - I - 0x005905 01:98F5: E0        .byte $E0   ; 
- D 0 - I - 0x005906 01:98F6: E8        .byte $E8   ; 
- D 0 - I - 0x005907 01:98F7: 05        .byte $05   ; counter
- D 0 - I - 0x005908 01:98F8: 01        .byte $01, $05, $88, $A1, $A8   ; 

- D 0 - I - 0x00590D 01:98FD: E8        .byte $E8   ; 
- D 0 - I - 0x00590E 01:98FE: E8        .byte $E8   ; 
- D 0 - I - 0x00590F 01:98FF: 05        .byte $05   ; counter
- D 0 - I - 0x005910 01:9900: 02        .byte $02, $06, $4D, $A2, $A9   ; 

- D 0 - I - 0x005915 01:9905: F0        .byte $F0   ; 
- D 0 - I - 0x005916 01:9906: F0        .byte $F0   ; 
- D 0 - I - 0x005917 01:9907: 04        .byte $04   ; counter
- D 0 - I - 0x005918 01:9908: 98        .byte $98, $9B, $38, $3C   ; 

- D 0 - I - 0x00591C 01:990C: F8        .byte $F8   ; 
- D 0 - I - 0x00591D 01:990D: F0        .byte $F0   ; 
- D 0 - I - 0x00591E 01:990E: 04        .byte $04   ; counter
- D 0 - I - 0x00591F 01:990F: 99        .byte $99, $9C, $A3, $3D   ; 

- D 0 - I - 0x005923 01:9913: 80        .byte $80   ; end token



_off017_9914_0E:
- D 0 - I - 0x005924 01:9914: 00        .byte $00   ; 
- D 0 - I - 0x005925 01:9915: F0        .byte $F0   ; 
- D 0 - I - 0x005926 01:9916: 04        .byte $04   ; counter
- D 0 - I - 0x005927 01:9917: 09        .byte $09, $12, $A4, $AA   ; 

- D 0 - I - 0x00592B 01:991B: 08        .byte $08   ; 
- D 0 - I - 0x00592C 01:991C: F0        .byte $F0   ; 
- D 0 - I - 0x00592D 01:991D: 04        .byte $04   ; counter
- D 0 - I - 0x00592E 01:991E: 0A        .byte $0A, $13, $A5, $AB   ; 

- D 0 - I - 0x005932 01:9922: 10        .byte $10   ; 
- D 0 - I - 0x005933 01:9923: E8        .byte $E8   ; 
- D 0 - I - 0x005934 01:9924: 08        .byte $08   ; counter
- D 0 - I - 0x005935 01:9925: 03        .byte $03, $0B, $14, $A6, $AE, $38, $3C, $3E   ; 

- D 0 - I - 0x00593D 01:992D: 18        .byte $18   ; 
- D 0 - I - 0x00593E 01:992E: E8        .byte $E8   ; 
- D 0 - I - 0x00593F 01:992F: 08        .byte $08   ; counter
- D 0 - I - 0x005940 01:9930: 04        .byte $04, $0C, $9D, $A7, $35, $39, $3D, $3F   ; 

- D 0 - I - 0x005948 01:9938: 20        .byte $20   ; 
- D 0 - I - 0x005949 01:9939: F0        .byte $F0   ; 
- D 0 - I - 0x00594A 01:993A: 05        .byte $05   ; counter
- D 0 - I - 0x00594B 01:993B: 9A        .byte $9A, $9E, $21, $37, $3B   ; 

- D 0 - I - 0x005950 01:9940: 80        .byte $80   ; end token



_off017_9941_0F:
- D 0 - I - 0x005951 01:9941: D0        .byte $D0   ; 
- D 0 - I - 0x005952 01:9942: F8        .byte $F8   ; 
- D 0 - I - 0x005953 01:9943: 05        .byte $05   ; counter
- D 0 - I - 0x005954 01:9944: 5F        .byte $5F, $9F, $20, $36, $3A   ; 

- D 0 - I - 0x005959 01:9949: D8        .byte $D8   ; 
- D 0 - I - 0x00595A 01:994A: F8        .byte $F8   ; 
- D 0 - I - 0x00595B 01:994B: 05        .byte $05   ; counter
- D 0 - I - 0x00595C 01:994C: 71        .byte $71, $A0, $21, $37, $3B   ; 

- D 0 - I - 0x005961 01:9951: E0        .byte $E0   ; 
- D 0 - I - 0x005962 01:9952: E8        .byte $E8   ; 
- D 0 - I - 0x005963 01:9953: 05        .byte $05   ; counter
- D 0 - I - 0x005964 01:9954: 01        .byte $01, $05, $88, $A1, $A8   ; 

- D 0 - I - 0x005969 01:9959: E8        .byte $E8   ; 
- D 0 - I - 0x00596A 01:995A: E8        .byte $E8   ; 
- D 0 - I - 0x00596B 01:995B: 06        .byte $06   ; counter
- D 0 - I - 0x00596C 01:995C: 02        .byte $02, $06, $AF, $B1, $B5, $3C   ; 

- D 0 - I - 0x005972 01:9962: F0        .byte $F0   ; 
- D 0 - I - 0x005973 01:9963: F0        .byte $F0   ; 
- D 0 - I - 0x005974 01:9964: 05        .byte $05   ; counter
- D 0 - I - 0x005975 01:9965: 07        .byte $07, $B0, $B3, $B6, $3D   ; 

- D 0 - I - 0x00597A 01:996A: 80        .byte $80   ; end token



_off017_996B_10:
- D 0 - I - 0x00597B 01:996B: F8        .byte $F8   ; 
- D 0 - I - 0x00597C 01:996C: F0        .byte $F0   ; 
- D 0 - I - 0x00597D 01:996D: 04        .byte $04   ; counter
- D 0 - I - 0x00597E 01:996E: 08        .byte $08, $11, $B4, $B7   ; 

- D 0 - I - 0x005982 01:9972: 00        .byte $00   ; 
- D 0 - I - 0x005983 01:9973: F0        .byte $F0   ; 
- D 0 - I - 0x005984 01:9974: 04        .byte $04   ; counter
- D 0 - I - 0x005985 01:9975: 09        .byte $09, $12, $A4, $AA   ; 

- D 0 - I - 0x005989 01:9979: 08        .byte $08   ; 
- D 0 - I - 0x00598A 01:997A: F0        .byte $F0   ; 
- D 0 - I - 0x00598B 01:997B: 04        .byte $04   ; counter
- D 0 - I - 0x00598C 01:997C: 0A        .byte $0A, $13, $A5, $AB   ; 

- D 0 - I - 0x005990 01:9980: 10        .byte $10   ; 
- D 0 - I - 0x005991 01:9981: E8        .byte $E8   ; 
- D 0 - I - 0x005992 01:9982: 08        .byte $08   ; counter
- D 0 - I - 0x005993 01:9983: 03        .byte $03, $0B, $14, $A6, $AE, $38, $3C, $3E   ; 

- D 0 - I - 0x00599B 01:998B: 18        .byte $18   ; 
- D 0 - I - 0x00599C 01:998C: E8        .byte $E8   ; 
- D 0 - I - 0x00599D 01:998D: 08        .byte $08   ; counter
- D 0 - I - 0x00599E 01:998E: 04        .byte $04, $0C, $15, $1F, $35, $39, $3D, $3F   ; 

- D 0 - I - 0x0059A6 01:9996: 80        .byte $80   ; end token



_off017_9997_12:
- D 0 - I - 0x0059A7 01:9997: 00        .byte $00   ; 
- D 0 - I - 0x0059A8 01:9998: F0        .byte $F0   ; 
- D 0 - I - 0x0059A9 01:9999: 04        .byte $04   ; counter
- D 0 - I - 0x0059AA 01:999A: 09        .byte $09, $12, $1B, $BA   ; 

- D 0 - I - 0x0059AE 01:999E: 08        .byte $08   ; 
- D 0 - I - 0x0059AF 01:999F: F0        .byte $F0   ; 
- D 0 - I - 0x0059B0 01:99A0: 04        .byte $04   ; counter
- D 0 - I - 0x0059B1 01:99A1: 0A        .byte $0A, $13, $B8, $BB   ; 

- D 0 - I - 0x0059B5 01:99A5: 10        .byte $10   ; 
- D 0 - I - 0x0059B6 01:99A6: E8        .byte $E8   ; 
- D 0 - I - 0x0059B7 01:99A7: 06        .byte $06   ; counter
- D 0 - I - 0x0059B8 01:99A8: 03        .byte $03, $0B, $14, $B9, $BC, $3A   ; 

- D 0 - I - 0x0059BE 01:99AE: 18        .byte $18   ; 
- D 0 - I - 0x0059BF 01:99AF: E8        .byte $E8   ; 
- D 0 - I - 0x0059C0 01:99B0: 08        .byte $08   ; counter
- D 0 - I - 0x0059C1 01:99B1: 04        .byte $04, $0C, $15, $1E, $33, $38, $3C, $3E   ; 

- D 0 - I - 0x0059C9 01:99B9: 20        .byte $20   ; 
- D 0 - I - 0x0059CA 01:99BA: 00        .byte $00   ; 
- D 0 - I - 0x0059CB 01:99BB: 05        .byte $05   ; counter
- D 0 - I - 0x0059CC 01:99BC: 1F        .byte $1F, $35, $39, $3D, $3F   ; 

- D 0 - I - 0x0059D1 01:99C1: 80        .byte $80   ; end token



_off001_0x0059D2_4B_boss_3_ball_center:
- D 0 - I - 0x0059D2 01:99C2: DA 99     .word ofs_038_4B_99DA_01_initialize_object ; 
- D 0 - I - 0x0059D4 01:99C4: E7 99     .word ofs_038_4B_99E7_02 ; 
- D 0 - I - 0x0059D6 01:99C6: FE 99     .word ofs_038_4B_99FE_03 ; 
- D 0 - I - 0x0059D8 01:99C8: 50 9A     .word ofs_038_4B_9A50_04 ; 
- D 0 - I - 0x0059DA 01:99CA: 66 9A     .word ofs_038_4B_9A66_05 ; 
- D 0 - I - 0x0059DC 01:99CC: 84 9A     .word ofs_038_4B_9A84_06 ; 
- D 0 - I - 0x0059DE 01:99CE: A0 9A     .word ofs_038_4B_9AA0_07 ; 
- D 0 - I - 0x0059E0 01:99D0: A8 9A     .word ofs_038_4B_9AA8_08 ; 
- D 0 - I - 0x0059E2 01:99D2: B8 9A     .word ofs_038_4B_9AB8_09 ; 
- D 0 - I - 0x0059E4 01:99D4: BE 9A     .word ofs_038_4B_9ABE_0A ; 
- D 0 - I - 0x0059E6 01:99D6: C4 9A     .word ofs_038_4B_9AC4_0B ; 
- D 0 - I - 0x0059E8 01:99D8: CA 9A     .word ofs_038_4B_9ACA_0C ; 



ofs_038_4B_99DA_01_initialize_object:
C - - J - - 0x0059EA 01:99DA: A9 11     LDA #$11
C - - - - - 0x0059EC 01:99DC: 9D 2C 07  STA ram_параметры_объектов,X
C - - - - - 0x0059EF 01:99DF: A9 F0     LDA #con__hp_F0
C - - - - - 0x0059F1 01:99E1: 9D 76 06  STA ram_жизни_объектов,X
C - - - - - 0x0059F4 01:99E4: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_4B_99E7_02:
C - - J - - 0x0059F7 01:99E7: A5 61     LDA ram_0061_конфиг_уровня
C - - - - - 0x0059F9 01:99E9: F0 22     BEQ bra_9A0D_RTS
C - - - - - 0x0059FB 01:99EB: A5 60     LDA ram_0060_unk
C - - - - - 0x0059FD 01:99ED: 05 70     ORA ram_0070
C - - - - - 0x0059FF 01:99EF: D0 1C     BNE bra_9A0D_RTS
C - - - - - 0x005A01 01:99F1: A9 31     LDA #con_sound_31   ; музыка 3й босс главный
C - - - - - 0x005A03 01:99F3: 20 DE FD  JSR sub_0x01FDEE_play_music
C - - - - - 0x005A06 01:99F6: A9 07     LDA #$07
C - - - - - 0x005A08 01:99F8: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x005A0B 01:99FB: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_4B_99FE_03:
C - - J - - 0x005A0E 01:99FE: A5 60     LDA ram_0060_unk
C - - - - - 0x005A10 01:9A00: 05 70     ORA ram_0070
C - - - - - 0x005A12 01:9A02: D0 09     BNE bra_9A0D_RTS
C - - - - - 0x005A14 01:9A04: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x005A17 01:9A07: F0 05     BEQ bra_9A0E
C - - - - - 0x005A19 01:9A09: A9 00     LDA #$00
C - - - - - 0x005A1B 01:9A0B: 85 6B     STA ram_006B
bra_9A0D_RTS:
C - - - - - 0x005A1D 01:9A0D: 60        RTS
bra_9A0E:
C - - - - - 0x005A1E 01:9A0E: A9 80     LDA #$80
C - - - - - 0x005A20 01:9A10: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005A23 01:9A13: A9 18     LDA #$18
C - - - - - 0x005A25 01:9A15: 9D 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x005A28 01:9A18: A9 01     LDA #$01
C - - - - - 0x005A2A 01:9A1A: 9D 8E 07  STA ram_позиция_объектов_y_старш,X
C - - - - - 0x005A2D 01:9A1D: A9 00     LDA #$00
C - - - - - 0x005A2F 01:9A1F: 9D 9C 07  STA ram_позиция_объектов_x_старш,X
C - - - - - 0x005A32 01:9A22: A9 01     LDA #con_mirroring_H
C - - - - - 0x005A34 01:9A24: 85 26     STA ram_for_A000
C - - - - - 0x005A36 01:9A26: A9 00     LDA #$00
C - - - - - 0x005A38 01:9A28: 85 FC     STA ram_scroll_Y
C - - - - - 0x005A3A 01:9A2A: 85 F9     STA ram_00F9
C - - - - - 0x005A3C 01:9A2C: 85 FD     STA ram_scroll_X
C - - - - - 0x005A3E 01:9A2E: 85 FA     STA ram_00FA
C - - - - - 0x005A40 01:9A30: A9 AA     LDA #$AA
C - - - - - 0x005A42 01:9A32: 85 FF     STA ram_for_2000
C - - - - - 0x005A44 01:9A34: A9 A8     LDA #$A8
C - - - - - 0x005A46 01:9A36: 85 FB     STA ram_00FB
C - - - - - 0x005A48 01:9A38: 20 CE A9  JSR sub_0x0069DE
C - - - - - 0x005A4B 01:9A3B: A9 08     LDA #con_irq_area_3_boss
C - - - - - 0x005A4D 01:9A3D: 85 27     STA ram_irq_handler_hi
C - - - - - 0x005A4F 01:9A3F: A9 A2     LDA #$A2
C - - - - - 0x005A51 01:9A41: 85 45     STA ram_номер_сканлинии
C - - - - - 0x005A53 01:9A43: A0 4F     LDY #$4F
C - - - - - 0x005A55 01:9A45: 20 12 BD  JSR sub_0x007D22_clear_0400_Y
C - - - - - 0x005A58 01:9A48: A9 09     LDA #$09
C - - - - - 0x005A5A 01:9A4A: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x005A5D 01:9A4D: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_4B_9A50_04:
C - - J - - 0x005A60 01:9A50: A5 60     LDA ram_0060_unk
C - - - - - 0x005A62 01:9A52: 05 70     ORA ram_0070
C - - - - - 0x005A64 01:9A54: D0 09     BNE bra_9A5F_RTS
C - - - - - 0x005A66 01:9A56: DE 48 07  DEC ram_0748_obj,X
C - - - - - 0x005A69 01:9A59: F0 05     BEQ bra_9A60
C - - - - - 0x005A6B 01:9A5B: A9 00     LDA #$00
C - - - - - 0x005A6D 01:9A5D: 85 6B     STA ram_006B
bra_9A5F_RTS:
C - - - - - 0x005A6F 01:9A5F: 60        RTS
bra_9A60:
C - - - - - 0x005A70 01:9A60: 20 1B BD  JSR sub_0x007D2B_clear_0480_04FF
C - - - - - 0x005A73 01:9A63: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_4B_9A66_05:
C - - J - - 0x005A76 01:9A66: A9 AA     LDA #$AA
C - - - - - 0x005A78 01:9A68: 85 FB     STA ram_00FB
C - - - - - 0x005A7A 01:9A6A: E6 45     INC ram_номер_сканлинии
C - - - - - 0x005A7C 01:9A6C: 20 9D 9B  JSR sub_9B9D
C - - - - - 0x005A7F 01:9A6F: A5 45     LDA ram_номер_сканлинии
C - - - - - 0x005A81 01:9A71: C9 C8     CMP #$C8
C - - - - - 0x005A83 01:9A73: 90 EA     BCC bra_9A5F_RTS
C - - - - - 0x005A85 01:9A75: A9 16     LDA #con_chr_bank + $16
C - - - - - 0x005A87 01:9A77: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x005A8A 01:9A7A: A9 18     LDA #con_chr_bank + $18
C - - - - - 0x005A8C 01:9A7C: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x005A8F 01:9A7F: A9 10     LDA #$10
C - - - - - 0x005A91 01:9A81: 4C E0 A2  JMP loc_0x0062F0



ofs_038_4B_9A84_06:
C - - J - - 0x005A94 01:9A84: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x005A97 01:9A87: D0 D6     BNE bra_9A5F_RTS
C - - - - - 0x005A99 01:9A89: A9 00     LDA #$00
C - - - - - 0x005A9B 01:9A8B: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x005A9E 01:9A8E: A9 01     LDA #$01
C - - - - - 0x005AA0 01:9A90: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x005AA3 01:9A93: A0 00     LDY #$00
C - - - - - 0x005AA5 01:9A95: 20 D7 9A  JSR sub_9AD7
C - - - - - 0x005AA8 01:9A98: A9 21     LDA #con_sound_21
C - - - - - 0x005AAA 01:9A9A: 20 DE FD  JSR sub_0x01FDEE_play_sound
C - - - - - 0x005AAD 01:9A9D: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_4B_9AA0_07:
C - - J - - 0x005AB0 01:9AA0: A9 01     LDA #$01
C - - - - - 0x005AB2 01:9AA2: 9D 08 05  STA ram_кадр_врага_и_пуль,X
C - - - - - 0x005AB5 01:9AA5: 4C E8 9A  JMP loc_9AE8



ofs_038_4B_9AA8_08:
C - - J - - 0x005AB8 01:9AA8: A0 02     LDY #$02
C - - - - - 0x005ABA 01:9AAA: 20 D7 9A  JSR sub_9AD7
C - - - - - 0x005ABD 01:9AAD: A9 04     LDA #$04
C - - - - - 0x005ABF 01:9AAF: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x005AC2 01:9AB2: 20 E8 9A  JSR sub_9AE8
C - - - - - 0x005AC5 01:9AB5: 4C B8 A3  JMP loc_0x0063C8



ofs_038_4B_9AB8_09:
C - - J - - 0x005AC8 01:9AB8: 20 E8 9A  JSR sub_9AE8
C - - - - - 0x005ACB 01:9ABB: 4C D8 A3  JMP loc_0x0063E8



ofs_038_4B_9ABE_0A:
C - - J - - 0x005ACE 01:9ABE: 20 E8 9A  JSR sub_9AE8
C - - - - - 0x005AD1 01:9AC1: 4C A2 A2  JMP loc_0x0062B2



ofs_038_4B_9AC4_0B:
C - - J - - 0x005AD4 01:9AC4: 20 E8 9A  JSR sub_9AE8
C - - - - - 0x005AD7 01:9AC7: 4C F6 A2  JMP loc_0x006306



ofs_038_4B_9ACA_0C:
C - - J - - 0x005ADA 01:9ACA: A9 00     LDA #$00
C - - - - - 0x005ADC 01:9ACC: 85 FC     STA ram_scroll_Y
C - - - - - 0x005ADE 01:9ACE: 85 FD     STA ram_scroll_X
C - - - - - 0x005AE0 01:9AD0: A9 AA     LDA #$AA
C - - - - - 0x005AE2 01:9AD2: 85 FF     STA ram_for_2000
C - - - - - 0x005AE4 01:9AD4: 4C 37 A3  JMP loc_0x006347_удалить_объект_босс



sub_9AD7:
C - - - - - 0x005AE7 01:9AD7: B9 E4 9A  LDA tbl_9AE4_spd_Y,Y
C - - - - - 0x005AEA 01:9ADA: 9D A0 06  STA ram_скорость_объектов_y_младш,X
C - - - - - 0x005AED 01:9ADD: B9 E5 9A  LDA tbl_9AE4_spd_Y + $01,Y
C - - - - - 0x005AF0 01:9AE0: 9D AE 06  STA ram_скорость_объектов_y_старш,X
C - - - - - 0x005AF3 01:9AE3: 60        RTS



tbl_9AE4_spd_Y:
- D 0 - - - 0x005AF4 01:9AE4: 00 FF     .word $FF00 ; 00 
- D 0 - - - 0x005AF6 01:9AE6: 40 00     .word $0040 ; 02 



loc_9AE8:
sub_9AE8:
C D 0 - - - 0x005AF8 01:9AE8: 20 5D A7  JSR sub_0x00676D
C - - - - - 0x005AFB 01:9AEB: 20 0A AA  JSR sub_0x006A1A
; leon опт
                                        LDY ram_0748_obj,X
                                        LDA tbl_9AF4_lo,y
                                        STA ram_0000
                                        LDA tbl_9AF4_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9AF4_lo:
- D 0 - I - 0x005B04 01:9AF4: FE 9A     .byte < ofs_015_9AFE_00
- D 0 - I - 0x005B06 01:9AF6: 2C 9B     .byte < ofs_015_9B2C_01
- D 0 - I - 0x005B08 01:9AF8: 6B 9B     .byte < ofs_015_9B6B_02
- D 0 - I - 0x005B0A 01:9AFA: 7D 9B     .byte < ofs_015_9B7D_03
- D 0 - I - 0x005B0C 01:9AFC: 8D 9B     .byte < ofs_015_9B8D_04
tbl_9AF4_hi:
- D 0 - I - 0x005B04 01:9AF4: FE 9A     .byte > ofs_015_9AFE_00
- D 0 - I - 0x005B06 01:9AF6: 2C 9B     .byte > ofs_015_9B2C_01
- D 0 - I - 0x005B08 01:9AF8: 6B 9B     .byte > ofs_015_9B6B_02
- D 0 - I - 0x005B0A 01:9AFA: 7D 9B     .byte > ofs_015_9B7D_03
- D 0 - I - 0x005B0C 01:9AFC: 8D 9B     .byte > ofs_015_9B8D_04


ofs_015_9AFE_00:
C - - J - - 0x005B0E 01:9AFE: 20 87 AB  JSR sub_0x006B97
C - - - - - 0x005B11 01:9B01: DE 02 07  DEC ram_0702_obj,X
C - - - - - 0x005B14 01:9B04: D0 0A     BNE bra_9B10
C - - - - - 0x005B16 01:9B06: A9 10     LDA #$10
C - - - - - 0x005B18 01:9B08: 9D 02 07  STA ram_0702_obj,X
C - - - - - 0x005B1B 01:9B0B: A9 08     LDA #con_sound_08
C - - - - - 0x005B1D 01:9B0D: 20 DE FD  JSR sub_0x01FDEE_play_sound
bra_9B10:
C - - - - - 0x005B20 01:9B10: BD 8E 07  LDA ram_позиция_объектов_y_старш,X
C - - - - - 0x005B23 01:9B13: D0 51     BNE bra_9B66_RTS
C - - - - - 0x005B25 01:9B15: BD 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x005B28 01:9B18: C9 48     CMP #$48
C - - - - - 0x005B2A 01:9B1A: B0 4A     BCS bra_9B66_RTS
C - - - - - 0x005B2C 01:9B1C: A9 00     LDA #$00
C - - - - - 0x005B2E 01:9B1E: 85 FD     STA ram_scroll_X
C - - - - - 0x005B30 01:9B20: 85 FA     STA ram_00FA
C - - - - - 0x005B32 01:9B22: 20 C7 A7  JSR sub_0x0067D7_clear_spd_XY
C - - - - - 0x005B35 01:9B25: A9 10     LDA #$10
C - - - - - 0x005B37 01:9B27: 9D E6 06  STA ram_счетчкики_для_объектов,X
C - - - - - 0x005B3A 01:9B2A: D0 37     BNE bra_9B63    ; jmp



ofs_015_9B2C_01:
C - - J - - 0x005B3C 01:9B2C: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x005B3F 01:9B2F: D0 35     BNE bra_9B66_RTS
C - - - - - 0x005B41 01:9B31: A0 03     LDY #$03
bra_9B33_loop:
C - - - - - 0x005B43 01:9B33: 84 08     STY ram_0008
C - - - - - 0x005B45 01:9B35: A0 50     LDY #$50
C - - - - - 0x005B47 01:9B37: 20 C8 AB  JSR sub_0x006BD8
C - - - - - 0x005B4A 01:9B3A: 90 13     BCC bra_9B4F
C - - - - - 0x005B4C 01:9B3C: A4 08     LDY ram_0008
C - - - - - 0x005B4E 01:9B3E: B9 67 9B  LDA tbl_9B67,Y
C - - - - - 0x005B51 01:9B41: A4 11     LDY ram_0011
C - - - - - 0x005B53 01:9B43: 99 1E 07  STA ram_obj_flags,Y
C - - - - - 0x005B56 01:9B46: 8A        TXA
C - - - - - 0x005B57 01:9B47: 99 80 07  STA ram_0780_obj,Y
C - - - - - 0x005B5A 01:9B4A: A4 08     LDY ram_0008
C - - - - - 0x005B5C 01:9B4C: 88        DEY
C - - - - - 0x005B5D 01:9B4D: 10 E4     BPL bra_9B33_loop
bra_9B4F:
C - - - - - 0x005B5F 01:9B4F: A9 28     LDA #$28
C - - - - - 0x005B61 01:9B51: 20 99 AB  JSR sub_0x006BA9_set_dynamic_hp_to_boss
C - - - - - 0x005B64 01:9B54: A9 00     LDA #$00
C - - - - - 0x005B66 01:9B56: 8D CD 03  STA ram_03CD
C - - - - - 0x005B69 01:9B59: A9 40     LDA #$40
C - - - - - 0x005B6B 01:9B5B: 9D E6 06  STA ram_счетчкики_для_объектов,X
C - - - - - 0x005B6E 01:9B5E: A9 1A     LDA #con_chr_bank + $1A
C - - - - - 0x005B70 01:9B60: 8D F5 07  STA ram_spr_bank_4
bra_9B63:
C - - - - - 0x005B73 01:9B63: FE 48 07  INC ram_0748_obj,X
bra_9B66_RTS:
C - - - - - 0x005B76 01:9B66: 60        RTS



tbl_9B67:
- D 0 - - - 0x005B77 01:9B67: 00        .byte $00   ; 00 
- D 0 - - - 0x005B78 01:9B68: 03        .byte $03   ; 01 
- D 0 - - - 0x005B79 01:9B69: 06        .byte $06   ; 02 
- D 0 - - - 0x005B7A 01:9B6A: 09        .byte $09   ; 03 



ofs_015_9B6B_02:
C - - J - - 0x005B7B 01:9B6B: A5 5B     LDA ram_счетчик_кадров
C - - - - - 0x005B7D 01:9B6D: 29 01     AND #$01
C - - - - - 0x005B7F 01:9B6F: D0 F5     BNE bra_9B66_RTS
C - - - - - 0x005B81 01:9B71: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x005B84 01:9B74: D0 F0     BNE bra_9B66_RTS
C - - - - - 0x005B86 01:9B76: A9 01     LDA #$01
C - - - - - 0x005B88 01:9B78: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x005B8B 01:9B7B: D0 E6     BNE bra_9B63    ; jmp



ofs_015_9B7D_03:
C - - J - - 0x005B8D 01:9B7D: A9 00     LDA #$00
C - - - - - 0x005B8F 01:9B7F: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x005B92 01:9B82: A9 40     LDA #$40
C - - - - - 0x005B94 01:9B84: 9D E6 06  STA ram_счетчкики_для_объектов,X
C - - - - - 0x005B97 01:9B87: A9 02     LDA #$02
C - - - - - 0x005B99 01:9B89: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x005B9C 01:9B8C: 60        RTS



ofs_015_9B8D_04:
C - - J - - 0x005B9D 01:9B8D: 20 87 AB  JSR sub_0x006B97
C - - - - - 0x005BA0 01:9B90: A5 45     LDA ram_номер_сканлинии
C - - - - - 0x005BA2 01:9B92: C9 A3     CMP #$A3
C - - - - - 0x005BA4 01:9B94: F0 07     BEQ bra_9B9D
C - - - - - 0x005BA6 01:9B96: A5 5B     LDA ram_счетчик_кадров
C - - - - - 0x005BA8 01:9B98: 4A        LSR
C - - - - - 0x005BA9 01:9B99: 90 02     BCC bra_9B9D
C - - - - - 0x005BAB 01:9B9B: C6 45     DEC ram_номер_сканлинии
bra_9B9D:
sub_9B9D:
C - - - - - 0x005BAD 01:9B9D: A5 45     LDA ram_номер_сканлинии
C - - - - - 0x005BAF 01:9B9F: 38        SEC
C - - - - - 0x005BB0 01:9BA0: E9 A2     SBC #$A2
C - - - - - 0x005BB2 01:9BA2: 85 00     STA ram_0000
C - - - - - 0x005BB4 01:9BA4: A9 F0     LDA #$F0
C - - - - - 0x005BB6 01:9BA6: 38        SEC
C - - - - - 0x005BB7 01:9BA7: E5 00     SBC ram_0000
C - - - - - 0x005BB9 01:9BA9: 85 F9     STA ram_00F9
C - - - - - 0x005BBB 01:9BAB: 60        RTS


_off001_0x005BEE_50_boss_3_ball_violet:
- D 0 - I - 0x005BEE 01:9BDE: F0 9B     .word ofs_038_50_9BF0_01_initialize_object ; 
- D 0 - I - 0x005BF0 01:9BE0: 06 9C     .word ofs_038_50_9C06_02 ; 
- D 0 - I - 0x005BF2 01:9BE2: 29 9C     .word ofs_038_50_9C29_03 ; 
- D 0 - I - 0x005BF4 01:9BE4: 4C 9C     .word ofs_038_50_9C4C_04 ; 
- D 0 - I - 0x005BF6 01:9BE6: 6B 9C     .word ofs_038_50_9C6B_05 ; 
- D 0 - I - 0x005BF8 01:9BE8: 95 9C     .word ofs_038_50_9C95_06 ; 
- D 0 - I - 0x005BFA 01:9BEA: 9A A2     .word ofs_038_50_0x0062AA_07 ; 
- D 0 - I - 0x005BFC 01:9BEC: FD A2     .word ofs_038_50_0x00630D_08 ; 
- D 0 - I - 0x005BFE 01:9BEE: 3D A3     .word ofs_038_50_0x00634D_09_удалить_объект_04 ; 



ofs_038_50_9BF0_01_initialize_object:
C - - J - - 0x005C00 01:9BF0: A9 10     LDA #$10
C - - - - - 0x005C02 01:9BF2: 20 95 AB  JSR sub_0x006BA5_set_dynamic_hp_to_enemy
C - - - - - 0x005C05 01:9BF5: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x005C08 01:9BF8: A9 F1     LDA #con__hp_F1
C - - - - - 0x005C0A 01:9BFA: 9D 76 06  STA ram_жизни_объектов,X
C - - - - - 0x005C0D 01:9BFD: BD 1E 07  LDA ram_obj_flags,X
C - - - - - 0x005C10 01:9C00: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x005C13 01:9C03: 4C D7 A2  JMP loc_0x0062E7_increase_obj_state



ofs_038_50_9C06_02:
C - - J - - 0x005C16 01:9C06: 20 A8 9C  JSR sub_9CA8
C - - - - - 0x005C19 01:9C09: 20 17 9D  JSR sub_9D17
C - - - - - 0x005C1C 01:9C0C: BC 80 07  LDY ram_0780_obj,X
C - - - - - 0x005C1F 01:9C0F: B9 56 07  LDA ram_scroll_X_obj,Y
C - - - - - 0x005C22 01:9C12: F0 37     BEQ bra_9C4B_RTS
C - - - - - 0x005C24 01:9C14: BC 48 07  LDY ram_0748_obj,X
C - - - - - 0x005C27 01:9C17: B9 1D 9C  LDA tbl_9C1D,Y
C - - - - - 0x005C2A 01:9C1A: 4C E0 A2  JMP loc_0x0062F0



tbl_9C1D:
- D 0 - - - 0x005C2D 01:9C1D: 34        .byte $34   ; 00 
- D 0 - - - 0x005C2E 01:9C1E: 2F        .byte $2F   ; 01 
- D 0 - - - 0x005C2F 01:9C1F: 2F        .byte $2F   ; 02 
- D 0 - - - 0x005C30 01:9C20: 34        .byte $34   ; 03 
- D 0 - - - 0x005C31 01:9C21: 10        .byte $10   ; 04 
- D 0 - - - 0x005C32 01:9C22: 10        .byte $10   ; 05 
- D 0 - - - 0x005C33 01:9C23: 34        .byte $34   ; 06 
- D 0 - - - 0x005C34 01:9C24: 2F        .byte $2F   ; 07 
- D 0 - - - 0x005C35 01:9C25: 2F        .byte $2F   ; 08 
- D 0 - - - 0x005C36 01:9C26: 34        .byte $34   ; 09 
- D 0 - - - 0x005C37 01:9C27: 08        .byte $08   ; 0A 
- D 0 - - - 0x005C38 01:9C28: 08        .byte $08   ; 0B 



ofs_038_50_9C29_03:
C - - J - - 0x005C39 01:9C29: 20 9F 9C  JSR sub_9C9F
C - - - - - 0x005C3C 01:9C2C: 20 BA 9C  JSR sub_9CBA
C - - - - - 0x005C3F 01:9C2F: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x005C42 01:9C32: D0 17     BNE bra_9C4B_RTS
C - - - - - 0x005C44 01:9C34: 20 A8 9C  JSR sub_9CA8
C - - - - - 0x005C47 01:9C37: FE 48 07  INC ram_0748_obj,X
C - - - - - 0x005C4A 01:9C3A: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x005C4D 01:9C3D: C9 0C     CMP #$0C
C - - - - - 0x005C4F 01:9C3F: 90 02     BCC bra_9C43
C - - - - - 0x005C51 01:9C41: A9 00     LDA #$00
bra_9C43:
C - - - - - 0x005C53 01:9C43: 9D 48 07  STA ram_0748_obj,X
C - - - - - 0x005C56 01:9C46: A9 0C     LDA #$0C
C - - - - - 0x005C58 01:9C48: 4C E0 A2  JMP loc_0x0062F0
bra_9C4B_RTS:
C - - - - - 0x005C5B 01:9C4B: 60        RTS



ofs_038_50_9C4C_04:
C - - J - - 0x005C5C 01:9C4C: 20 17 9D  JSR sub_9D17
C - - - - - 0x005C5F 01:9C4F: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x005C62 01:9C52: D0 F7     BNE bra_9C4B_RTS
C - - - - - 0x005C64 01:9C54: 20 AE 9C  JSR sub_9CAE
C - - - - - 0x005C67 01:9C57: BD 56 07  LDA ram_scroll_X_obj,X
C - - - - - 0x005C6A 01:9C5A: 9D 76 06  STA ram_жизни_объектов,X
C - - - - - 0x005C6D 01:9C5D: 20 D7 A2  JSR sub_0x0062E7_increase_obj_state
C - - - - - 0x005C70 01:9C60: A9 10     LDA #$10
C - - - - - 0x005C72 01:9C62: 9D F4 06  STA ram_06F4_obj,X
C - - - - - 0x005C75 01:9C65: A9 30     LDA #$30
C - - - - - 0x005C77 01:9C67: 9D E6 06  STA ram_счетчкики_для_объектов,X
C - - - - - 0x005C7A 01:9C6A: 60        RTS



ofs_038_50_9C6B_05:
C - - J - - 0x005C7B 01:9C6B: BD F4 06  LDA ram_06F4_obj,X
C - - - - - 0x005C7E 01:9C6E: F0 0D     BEQ bra_9C7D
C - - - - - 0x005C80 01:9C70: DE F4 06  DEC ram_06F4_obj,X
C - - - - - 0x005C83 01:9C73: D0 08     BNE bra_9C7D
C - - - - - 0x005C85 01:9C75: 20 AE AA  JSR sub_0x006ABE
; triggers during area 3 boss fight
C - - - - - 0x005C88 01:9C78: A0 04     LDY #$04
C - - - - - 0x005C8A 01:9C7A: 20 27 F3  JSR sub_0x01F337
bra_9C7D:
C - - - - - 0x005C8D 01:9C7D: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x005C90 01:9C80: D0 C9     BNE bra_9C4B_RTS
C - - - - - 0x005C92 01:9C82: 20 A8 9C  JSR sub_9CA8
C - - - - - 0x005C95 01:9C85: BD 76 06  LDA ram_жизни_объектов,X
C - - - - - 0x005C98 01:9C88: 9D 56 07  STA ram_scroll_X_obj,X
C - - - - - 0x005C9B 01:9C8B: A9 F1     LDA #con__hp_F1
C - - - - - 0x005C9D 01:9C8D: 9D 76 06  STA ram_жизни_объектов,X
C - - - - - 0x005CA0 01:9C90: A9 04     LDA #$04
C - - - - - 0x005CA2 01:9C92: 4C E0 A2  JMP loc_0x0062F0



ofs_038_50_9C95_06:
C - - J - - 0x005CA5 01:9C95: DE E6 06  DEC ram_счетчкики_для_объектов,X
C - - - - - 0x005CA8 01:9C98: D0 B1     BNE bra_9C4B_RTS
C - - - - - 0x005CAA 01:9C9A: A9 02     LDA #$02
C - - - - - 0x005CAC 01:9C9C: 4C 83 A2  JMP loc_0x006293_set_obj_state



sub_9C9F:
C - - - - - 0x005CAF 01:9C9F: A0 18     LDY #$18
C - - - - - 0x005CB1 01:9CA1: 20 FD AB  JSR sub_0x006C0D
C - - - - - 0x005CB4 01:9CA4: A0 03     LDY #$03
C - - - - - 0x005CB6 01:9CA6: D0 0D     BNE bra_9CB5    ; jmp



sub_9CA8:
C - - - - - 0x005CB8 01:9CA8: A9 B6     LDA #$B6
C - - - - - 0x005CBA 01:9CAA: A0 03     LDY #$03
C - - - - - 0x005CBC 01:9CAC: D0 04     BNE bra_9CB2    ; jmp



sub_9CAE:
C - - - - - 0x005CBE 01:9CAE: A0 00     LDY #$00
C - - - - - 0x005CC0 01:9CB0: A9 B7     LDA #$B7
bra_9CB2:
C - - - - - 0x005CC2 01:9CB2: 9D 08 05  STA ram_кадр_врага_и_пуль,X
bra_9CB5:
C - - - - - 0x005CC5 01:9CB5: 98        TYA
C - - - - - 0x005CC6 01:9CB6: 9D 56 05  STA ram_атрибуты_спрайта_врага_и_пуль,X
C - - - - - 0x005CC9 01:9CB9: 60        RTS



sub_9CBA:
C - - - - - 0x005CCA 01:9CBA: BD 48 07  LDA ram_0748_obj,X
C - - - - - 0x005CCD 01:9CBD: 0A        ASL
C - - - - - 0x005CCE 01:9CBE: 0A        ASL
C - - - - - 0x005CCF 01:9CBF: A8        TAY
C - - - - - 0x005CD0 01:9CC0: BD 84 06  LDA ram_позиция_врага_y_младш,X
C - - - - - 0x005CD3 01:9CC3: 18        CLC
C - - - - - 0x005CD4 01:9CC4: 79 E7 9C  ADC tbl_9CE7_position,Y
C - - - - - 0x005CD7 01:9CC7: 9D 84 06  STA ram_позиция_врага_y_младш,X
C - - - - - 0x005CDA 01:9CCA: BD 22 05  LDA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x005CDD 01:9CCD: 79 E8 9C  ADC tbl_9CE7_position + $01,Y
C - - - - - 0x005CE0 01:9CD0: 9D 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x005CE3 01:9CD3: BD 92 06  LDA ram_позиция_врага_x_младш,X
C - - - - - 0x005CE6 01:9CD6: 18        CLC
C - - - - - 0x005CE7 01:9CD7: 79 E9 9C  ADC tbl_9CE7_position + $02,Y
C - - - - - 0x005CEA 01:9CDA: 9D 92 06  STA ram_позиция_врага_x_младш,X
C - - - - - 0x005CED 01:9CDD: BD 3C 05  LDA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005CF0 01:9CE0: 79 EA 9C  ADC tbl_9CE7_position + $03,Y
C - - - - - 0x005CF3 01:9CE3: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005CF6 01:9CE6: 60        RTS



tbl_9CE7_position:
; 00 
- D 0 - - - 0x005CF7 01:9CE7: B5 00     .word $00B5 ; Y
- D 0 - - - 0x005CF9 01:9CE9: B5 00     .word $00B5 ; X
; 01 
- D 0 - - - 0x005CFB 01:9CEB: 00 00     .word $0000 ; Y
- D 0 - - - 0x005CFD 01:9CED: 00 01     .word $0100 ; X
; 02 
- D 0 - - - 0x005CFF 01:9CEF: 00 00     .word $0000 ; Y
- D 0 - - - 0x005D01 01:9CF1: 00 FF     .word $FF00 ; X
; 03 
- D 0 - - - 0x005D03 01:9CF3: B5 00     .word $00B5 ; Y
- D 0 - - - 0x005D05 01:9CF5: 4B FF     .word $FF4B ; X
; 04 
- D 0 - - - 0x005D07 01:9CF7: 00 01     .word $0100 ; Y
- D 0 - - - 0x005D09 01:9CF9: 00 00     .word $0000 ; X
; 05 
- D 0 - - - 0x005D0B 01:9CFB: 00 FF     .word $FF00 ; Y
- D 0 - - - 0x005D0D 01:9CFD: 00 00     .word $0000 ; X
; 06 
- D 0 - - - 0x005D0F 01:9CFF: 4B FF     .word $FF4B ; Y
- D 0 - - - 0x005D11 01:9D01: 4B FF     .word $FF4B ; X
; 07 
- D 0 - - - 0x005D13 01:9D03: 00 00     .word $0000 ; Y
- D 0 - - - 0x005D15 01:9D05: 00 FF     .word $FF00 ; X
; 08 
- D 0 - - - 0x005D17 01:9D07: 00 00     .word $0000 ; Y
- D 0 - - - 0x005D19 01:9D09: 00 01     .word $0100 ; X
; 09 
- D 0 - - - 0x005D1B 01:9D0B: 4B FF     .word $FF4B ; Y
- D 0 - - - 0x005D1D 01:9D0D: B5 00     .word $00B5 ; X
; 0A 
- D 0 - - - 0x005D1F 01:9D0F: 00 FF     .word $FF00 ; Y
- D 0 - - - 0x005D21 01:9D11: 00 00     .word $0000 ; X
; 0B 
- D 0 - - - 0x005D23 01:9D13: 00 01     .word $0100 ; Y
- D 0 - - - 0x005D25 01:9D15: 00 00     .word $0000 ; X



sub_9D17:
C - - - - - 0x005D27 01:9D17: BC 48 07  LDY ram_0748_obj,X
C - - - - - 0x005D2A 01:9D1A: B9 36 9D  LDA tbl_9D36,Y
C - - - - - 0x005D2D 01:9D1D: 85 00     STA ram_0000
C - - - - - 0x005D2F 01:9D1F: B9 42 9D  LDA tbl_9D42,Y
C - - - - - 0x005D32 01:9D22: BC 80 07  LDY ram_0780_obj,X
C - - - - - 0x005D35 01:9D25: 18        CLC
C - - - - - 0x005D36 01:9D26: 79 3C 05  ADC ram_позиция_x_спрайта_врага_и_пуль,Y
C - - - - - 0x005D39 01:9D29: 9D 3C 05  STA ram_позиция_x_спрайта_врага_и_пуль,X
C - - - - - 0x005D3C 01:9D2C: A5 00     LDA ram_0000
C - - - - - 0x005D3E 01:9D2E: 18        CLC
C - - - - - 0x005D3F 01:9D2F: 79 22 05  ADC ram_позиция_y_спрайта_врага_и_пуль,Y
C - - - - - 0x005D42 01:9D32: 9D 22 05  STA ram_позиция_y_спрайта_врага_и_пуль,X
C - - - - - 0x005D45 01:9D35: 60        RTS



tbl_9D36:
- D 0 - - - 0x005D46 01:9D36: DB        .byte $DB   ; 00 
- D 0 - - - 0x005D47 01:9D37: 00        .byte $00   ; 01 
- D 0 - - - 0x005D48 01:9D38: 00        .byte $00   ; 02 
- D 0 - - - 0x005D49 01:9D39: 00        .byte $00   ; 03 
- D 0 - - - 0x005D4A 01:9D3A: 25        .byte $25   ; 04 
- D 0 - - - 0x005D4B 01:9D3B: 35        .byte $35   ; 05 
- D 0 - - - 0x005D4C 01:9D3C: 25        .byte $25   ; 06 
- D 0 - - - 0x005D4D 01:9D3D: 00        .byte $00   ; 07 
- D 0 - - - 0x005D4E 01:9D3E: 00        .byte $00   ; 08 
- D 0 - - - 0x005D4F 01:9D3F: 00        .byte $00   ; 09 
- D 0 - - - 0x005D50 01:9D40: DB        .byte $DB   ; 0A 
- D 0 - - - 0x005D51 01:9D41: D3        .byte $D3   ; 0B 



tbl_9D42:
- D 0 - - - 0x005D52 01:9D42: 00        .byte $00   ; 00 
- D 0 - - - 0x005D53 01:9D43: 25        .byte $25   ; 01 
- D 0 - - - 0x005D54 01:9D44: 54        .byte $54   ; 02 
- D 0 - - - 0x005D55 01:9D45: 25        .byte $25   ; 03 
- D 0 - - - 0x005D56 01:9D46: 00        .byte $00   ; 04 
- D 0 - - - 0x005D57 01:9D47: 00        .byte $00   ; 05 
- D 0 - - - 0x005D58 01:9D48: 00        .byte $00   ; 06 
- D 0 - - - 0x005D59 01:9D49: DB        .byte $DB   ; 07 
- D 0 - - - 0x005D5A 01:9D4A: AC        .byte $AC   ; 08 
- D 0 - - - 0x005D5B 01:9D4B: DB        .byte $DB   ; 09 
- D 0 - - - 0x005D5C 01:9D4C: 00        .byte $00   ; 0A 
- D 0 - - - 0x005D5D 01:9D4D: 00        .byte $00   ; 0B 


.out .sprintf("Free bytes in bank 32: %Xh [%d]", ($A000 - *), ($A000 - *))

