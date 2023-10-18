.segment "BANK_20"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x000010-0x00800F



.export loc_0x00231A_обработчик_главного_экрана
.export loc_0x00189E_отрисовка_экранов
.export loc_0x00178C_отрисовка_текста_через_буфер_0300x


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
C - - - - - 0x002343 00:A333: A2 02     LDX #$00    ; title screen
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
; 1путин: удалено sub_0x01E552
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
; leon
- D 1 - - - 0x0023AF 00:A39F: 07        .byte $10, $02, $01   ; 00 
- D 1 - - - 0x0023B2 00:A3A2: 17        .byte $20, $11, $01   ; 01 
- D 1 - - - 0x0023B5 00:A3A5: 27        .byte $30, $21, $12   ; 02 



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
; X=FF очистка PPU
; X=00 главный экран
; X=02 заставка
C D 0 - - - 0x00189E 00:988E: A9 04     LDA #$04
C - - - - - 0x0018A0 00:9890: 85 1D     STA ram_001D
C - - - - - 0x01FCD4 07:FCC4: A5 FF     LDA ram_for_2000
C - - - - - 0x01FCD6 07:FCC6: 29 7F     AND #$7F    ; отключить NMI
C - - - - - 0x01FCD8 07:FCC8: 8D 00 20  STA $2000
C - - - - - 0x01FCDB 07:FCCB: 85 FF     STA ram_for_2000
C - - - - - 0x01FCFC 07:FCEC: A9 00     LDA #$00
C - - - - - 0x01FCFE 07:FCEE: 8D 06 20  STA $2006
C - - - - - 0x01FD01 07:FCF1: 8D 06 20  STA $2006
C - - - - - 0x01FD04 07:FCF4: A5 FE     LDA ram_for_2001
C - - - - - 0x01FD06 07:FCF6: 29 E7     AND #$E7    ; отключить рендеринг экрана
C - - - - - 0x01FD08 07:FCF8: 8D 01 20  STA $2001
C - - - - - 0x0018AF 00:989F: A9 00     LDA #$00
C - - - - - 0x0018B1 00:98A1: 85 FD     STA ram_scroll_X
C - - - - - 0x0018B3 00:98A3: 85 FC     STA ram_scroll_Y
                                        LDY #$00
C D 0 - - - 0x0018B5 00:98A5: AD 02 20  LDA $2002
                                        JSR sub_9900_очистить_все_ppu
                                        CPX #$FF
                                        BEQ bra_9902_выход
C - - - - - 0x0018A2 00:9892: BD 05 99  LDA tbl_координаты_таблицы_экрана,X
C - - - - - 0x0018A5 00:9895: 85 00     STA ram_0000
C - - - - - 0x0018A7 00:9897: BD 06 99  LDA tbl_координаты_таблицы_экрана + $01,X
C - - - - - 0x0018AA 00:989A: 85 01     STA ram_0001                   
; запись координат для ppu
C - - - - - 0x0018BA 00:98AA: B1 00     LDA tbl_координаты_для_ppu,X
C - - - - - 0x0018BC 00:98AC: 8D 06 20  STA $2006
C - - - - - 0x0018C0 00:98B0: B1 00     LDA tbl_координаты_для_ppu + $01,X
C - - - - - 0x0018C2 00:98B2: 8D 06 20  STA $2006
; колво циклов чтения/записи
                                        LDA tbl_колво_копируемых_данных,X
                                        STA ram_0002
                                        LDA tbl_колво_копируемых_данных + $01,X
                                        STA ram_0003                                        
bra_цикл_колво_записей:                                       
                                        DEC ram_0002
                                        LDA ram_0002
                                        CMP #$FF
                                        BNE bra_запись_в_ppu
                                        DEC ram_0003
                                        LDA ram_0003
                                        CMP #$FF
                                        BNE bra_запись_в_ppu
bra_9902_выход:                                    
C - - - - - 0x001912 00:9902: 4C BA FC  JMP loc_0x01FCCA_включить_NMI 
bra_запись_в_ppu:                                      
C - - - - - 0x0018CE 00:98BE: B1 00     LDA (ram_0000),Y
C - - - - - 0x0018E3 00:98D3: 8D 07 20  STA $2007
C - - - - - 0x01E639 07:E629: F6 01     INC ram_0000
C - - - - - 0x001904 00:98F4: D0 FA     BNE bra_цикл_колво_записей
C - - - - - 0x01E639 07:E629: F6 01     INC ram_0001
C - - - - - 0x00190F 00:98FF: 4C A5 98  BMI bra_цикл_колво_записей

sub_9900_очистить_все_ppu:
; cyneprepou4uk
; поскольку namatable дублируются, достаточно этих двух диапазонов
                                        LDA #> $2000
                                        STA $2006
                                        LDA #< $2000
                                        STA $2006
                                        JSR sub_9901_очистить_диапазон_ppu
                                        LDA #> $2C00
                                        STA $2006
                                        LDA #< $2C00
                                        STA $2006
                                        JSR sub_9901_очистить_диапазон_ppu
                                        RTS

sub_9901_очистить_диапазон_ppu:
; cyneprepou4uk
; очистка 400 адресов
                                        LDY #$00
                                        LDA #$00
bra_9901_loop:
                                        STA $2007
                                        STA $2007
                                        STA $2007
                                        STA $2007
                                        INY
                                        BNE bra_9901_loop
                                        RTS


tbl_колво_копируемых_данных:
                                        .word $0400 ; X00
                                        .word $0400 ; X02
                                        .word $0400 ; X04

tbl_координаты_для_ppu:
                                        .dbyt $2000 ; X00
                                        .dbyt $2000 ; X02
                                        .dbyt $2000 ; X04

tbl_координаты_таблицы_экрана:
- D 0 - - - 0x001917 00:9907: 35 99     .word _off010_9935_x00_главный_экран
- D 0 - - - 0x001919 00:9909: B3 9A     .word _off010_9AB3_x02_заставка


_off010_9935_x00_главный_экран:
    .incbin "screens/00.bin"

_off010_9AB3_x02_заставка:
    .incbin "screens/02.bin"




loc_0x00178C_отрисовка_текста_через_буфер_0300x:
; see con_0x0017EA
; +80 (N+) Скрыть текст 
; 1путин опт
                                        STA ram_0002
                                        ASL
C D 0 - - - 0x00178C 00:977C: A8        TAY
C - - - - - 0x00178D 00:977D: A9 02     LDA #$02
C - - - - - 0x00178F 00:977F: 85 03     STA ram_0003
C - - - - - 0x001791 00:9781: A9 01     LDA #$01
C - - - - - 0x001793 00:9783: 20 D1 97  JSR sub_97D1
C - - - - - 0x00179B 00:978B: B9 DA 97  LDA tbl_97DA,Y
C - - - - - 0x00179E 00:978E: 85 00     STA ram_0000
C - - - - - 0x0017A0 00:9790: B9 DB 97  LDA tbl_97DA + $01,Y
C - - - - - 0x0017A3 00:9793: 85 01     STA ram_0001
C - - - - - 0x0017A5 00:9795: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x0017A7 00:9797: A0 00     LDY #$00
bra_9799_loop:
C - - - - - 0x0017A9 00:9799: B1 00     LDA (ram_0000),Y
C - - - - - 0x0017AB 00:979B: C8        INY
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
sub_97D1:
C - - - - - 0x0017E1 00:97D1: A6 1E     LDX ram_index_ppu_buffer
bra_97D3:
sub_97D3:
C - - - - - 0x0017E3 00:97D3: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0017E6 00:97D6: E8        INX
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
- - - - - - 0x001802 00:97F4: 85 98     .word _off009_988E_0D_press_start
- - - - - - 0x001802 00:97F6: 85 98     .word _off009_9895_0E_options


_off009_97F4_00_1_player:
_off009_97F4_08:
_off009_97F4_0B:
- D 0 - I - 0x001804 00:97F4: 22 A6     .dbyt $224C ; ppu address
- D 0 - I - 0x001806 00:97F6: 02        .byte $02, $00, $1A, $16, $0B, $23, $0F, $1C   ; "1 PLAYER"
- D 0 - I - 0x00180E 00:97FE: FE        .byte $FE   ; end token



_off009_97FF_01_2_players:
- D 0 - I - 0x00180F 00:97FF: 22 B2     .dbyt $228C ; ppu address
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



_off009_988E_0D_press_start:
                                        .dbyt $226A ; ppu address
                                        .byte $1A, $1C, $0F, $1D, $1D, $00, $1D, $1E, $0B, $1C, $1E   ; "PRESS START"
                                        .byte $FE   ; end token



_off009_9895_0E_options:
                                        .dbyt $22CC ; ppu address
                                        .byte $19, $1A, $1E, $13, $19, $18, $1D   ; "OPTIONS"
                                        .byte $FE   ; end token
                                        
                                        


.out .sprintf("Free bytes in bank 20: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_20b"
    .byte con_prg_bank + $21   ; 
