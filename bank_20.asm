.segment "BANK_20"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x000010-0x00800F



.export loc_0x00231A_обработчик_главного_экрана
.export loc_0x00189E_отрисовка_экранов
.export loc_0x00178C_отрисовка_текста_через_буфер_0300x
.export sub_0x01EAC0_подготовить_начальные_банки_для_уровня
.export loc_0x00F894_загрузка_палитры_для_уровня
.export loc_0x00F896_загрузка_палитры
.export loc_0x00A123_options


; bzk this byte must be placed at 8000
    .byte con_prg_bank + $20   ; 






loc_0x00231A_обработчик_главного_экрана:
; leon опт
                                        LDY ram_номер_анимации_логотипа
                                        LDA tbl_A30F_lo,y
                                        STA ram_0000
                                        LDA tbl_A30F_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_A30F_lo:
- D 1 - I - 0x00231F 00:A30F: 17 A3     .byte < ofs_010_A317_00
- D 1 - I - 0x002321 00:A311: 3C A3     .byte < ofs_010_A33C_01_слияние
- D 1 - I - 0x002323 00:A313: 6D A3     .byte < ofs_010_A36D_02
- D 1 - I - 0x002325 00:A315: B1 A3     .byte < ofs_010_A3B1_03
tbl_A30F_hi:
- D 1 - I - 0x00231F 00:A30F: 17 A3     .byte > ofs_010_A317_00
- D 1 - I - 0x002321 00:A311: 3C A3     .byte > ofs_010_A33C_01_слияние
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
C D 1 - - - 0x002348 00:A338: E6 80     INC ram_номер_анимации_логотипа
C - - - - - 0x00234A 00:A33A: 18        CLC
C - - - - - 0x00234B 00:A33B: 60        RTS



ofs_010_A33C_01_слияние:
C - - J - - 0x00234C 00:A33C: A5 1B     LDA ram_счетчик_кадров_1
C - - - - - 0x00234E 00:A33E: 29 01     AND #$01
C - - - - - 0x002350 00:A340: AA        TAX
C - - - - - 0x002351 00:A341: BD 6B A3  LDA tbl_A36B_x_скорость_смещения,X
C - - - - - 0x002354 00:A344: 18        CLC
C - - - - - 0x002355 00:A345: 75 83     ADC ram_0083,X
C - - - - - 0x002357 00:A347: 95 83     STA ram_0083,X
C - - - - - 0x002359 00:A349: 6A        ROR
C - - - - - 0x00235A 00:A34A: 5D 6B A3  EOR tbl_A36B_x_скорость_смещения,X
C - - - - - 0x00235D 00:A34D: 10 06     BPL bra_A355
; N+
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



tbl_A36B_x_скорость_смещения:
- D 1 - - - 0x00237B 00:A36B: 02        .byte $02   ; 00 движение налево
- D 1 - - - 0x00237C 00:A36C: FE        .byte $FE   ; 01 движение нарпаво



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
; X=04 options
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
C - - - - - 0x00190F 00:98FF: 4C A5 98  BMI bra_цикл_колво_записей    ; jmp

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
                                        .word $0400 ; X00 главный экран
                                        .word $0400 ; X02 заставка
                                        .word $0400 ; X04 options

tbl_координаты_для_ppu:
                                        .dbyt $2000 ; X00 главный экран
                                        .dbyt $2000 ; X02 заставка
                                        .dbyt $2000 ; X04 options

tbl_координаты_таблицы_экрана:
- D 0 - - - 0x001917 00:9907: 35 99     .word _off010_9935_x00_главный_экран
- D 0 - - - 0x001919 00:9909: B3 9A     .word _off010_9AB3_x02_заставка
- D 0 - - - 0x00191B 00:990B: BA 9A     .word _off010_9ABA_x04_options


_off010_9935_x00_главный_экран:
    .incbin "screens/00.bin"

_off010_9AB3_x02_заставка:
    .incbin "screens/02.bin"

_off010_9ABA_x04_options:
    .incbin "screens/04.bin"



sub_977C_отрисовка_текста_через_буфер_0300x:
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
                                        .word _off009_9808_02_options
                                        .word _off009_9820_03_press_start
                                        .word _off009_9830_04_normal
                                        .word _off009_9840_05_hard
                                        .word _off009_9850_06_expert
                                        .word _off009_9860_07_human
                                        .word _off009_9870_08_robot
                                        .word _off009_9880_09_obj_limit_14
                                        .word _off009_9890_0A_obj_limit_32
                                        .word _off009_98A0_0B_continue
                                        .word _off009_98B0_0C_level
                                        .word _off009_98C0_0D_rest                                        
                                        .word _off009_98D0_0E_exit


_off009_97F4_00_1_player:
- D 0 - I - 0x001804 00:97F4: 22 A6     .dbyt $224C ; ppu address
- D 0 - I - 0x001806 00:97F6: 02        .byte $02, $00, $1A, $16, $0B, $23, $0F, $1C   ; "1 PLAYER"
- D 0 - I - 0x00180E 00:97FE: FE        .byte $FE   ; end token



_off009_97FF_01_2_players:
- D 0 - I - 0x00180F 00:97FF: 22 B2     .dbyt $228C ; ppu address
- D 0 - I - 0x001811 00:9801: 03        .byte $03, $00, $1A, $16, $0B, $23, $0F, $1C, $1D   ; "2 PLAYERS"
- D 0 - I - 0x00181A 00:980A: FE        .byte $FE   ; end token


_off009_9808_02_options:
                                        .dbyt $22CC ; ppu address
                                        .byte $19, $1A, $1E, $13, $19, $18, $1D   ; "OPTIONS"
                                        .byte $FE   ; end token


_off009_9820_03_press_start:
                                        .dbyt $226A ; ppu address
                                        .byte $1A, $1C, $0F, $1D, $1D, $00, $1D, $1E, $0B, $1C, $1E   ; "PRESS START"
                                        .byte $FE   ; end token


_off009_9830_04_normal:
                                        .dbyt $20D5 ; ppu address
                                        .byte $98, $99, $9C, $97, $8B, $96   ; "NORMAL"
                                        .byte $FE   ; end token


_off009_9840_05_hard:
                                        .dbyt $20D5 ; ppu address
                                        .byte $92, $8B, $9C, $8E, $80, $80    ; "HARD  "
                                        .byte $FE   ; end token


_off009_9850_06_expert:
                                        .dbyt $20D5 ; ppu address
                                        .byte $8F, $A2, $9A, $8F, $9C, $9E    ; "EXPERT"
                                        .byte $FE   ; end token



_off009_9860_07_human:
                                        .dbyt $2115 ; ppu address
                                        .byte $92, $9F, $97, $8B, $98   ; "HUMAN"
                                        .byte $FE   ; end token
                                        

_off009_9870_08_robot:
                                        .dbyt $2115 ; ppu address
                                        .byte $9C, $99, $8C, $99, $9E   ; "ROBOT"
                                        .byte $FE   ; end token


_off009_9880_09_obj_limit_14:
                                        .dbyt $2155 ; ppu address
                                        .byte $82, $85   ; "14"
                                        .byte $FE   ; end token
                                        

_off009_9890_0A_obj_limit_32:
                                        .dbyt $2155 ; ppu address
                                        .byte $84, $83  ; "32"
                                        .byte $FE   ; end token


_off009_98A0_0B_continue:
                                        .dbyt $2195 ; ppu address
                                        .byte $80  ; "empty"
                                        .byte $FE   ; end token



_off009_98B0_0C_level:
                                        .dbyt $21D5 ; ppu address
                                        .byte $00  ; "empty"
                                        .byte $FE   ; end token



_off009_98C0_0D_rest:
                                        .dbyt $2215 ; ppu address
                                        .byte $00  ; "empty"
                                        .byte $FE   ; end token



_off009_98D0_0E_exit:

                                        .dbyt $224E ; ppu address
                                        .byte $8F, $A2, $93, $9E   ; "EXIT"
                                        .byte $FE   ; end token




sub_0x01EAC0_подготовить_начальные_банки_для_уровня:
sub_EAB0_подготовить_начальные_банки_для_уровня:
; cyneprepou4uk
; очищать C нигде не нужно, так как не перевалит за FF
C - - - - - 0x01EAC0 07:EAB0: A5 50     LDA ram_номер_уровня
; * 0C
C - - - - - 0x01EAC2 07:EAB2: 0A        ASL
C - - - - - 0x01EAC3 07:EAB3: 85 00     STA ram_0000
C - - - - - 0x01EAC5 07:EAB5: 0A        ASL
C - - - - - 0x01EAC6 07:EAB6: 65 00     ADC ram_0000
                                        ASL
                                        LDY ram_options_регион
                                        BEQ bra_EAB8_американка
; европейка
                                        ADC #$06    ; вторые 6 байтов
bra_EAB8_американка:
C - - - - - 0x01EAC8 07:EAB8: A8        TAY
C - - - - - 0x01EAC9 07:EAB9: A2 00     LDX #$00
bra_EABB_loop:
C - - - - - 0x01EACB 07:EABB: B9 C8 EA  LDA tbl_EAC8_chr_banks,Y
C - - - - - 0x01EACE 07:EABE: 9D F0 07  STA ram_chr_bank,X
C - - - - - 0x01EAD1 07:EAC1: C8        INY
C - - - - - 0x01EAD2 07:EAC2: E8        INX
C - - - - - 0x01EAD3 07:EAC3: E0 06     CPX #$06
C - - - - - 0x01EAD5 07:EAC5: D0 F4     BNE bra_EABB_loop
C - - - - - 0x01EAD7 07:EAC7: 60        RTS



tbl_EAC8_chr_banks:
; 00 area 1
; US
- D 3 - - - 0x01EAD8 07:EAC8: 00        .byte con_chr_bank + $00   ; bg
- D 3 - - - 0x01EAD9 07:EAC9: 02        .byte con_chr_bank + $02   ; bg
- D 3 - - - 0x01EADA 07:EACA: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EADB 07:EACB: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EADC 07:EACC: 46        .byte con_chr_bank + $46   ; spr
- D 3 - - - 0x01EADD 07:EACD: 47        .byte con_chr_bank + $47   ; spr
; EU
                                        .byte con_chr_bank + $B0   ; bg на боссе $AD
                                        .byte con_chr_bank + $AB   ; bg на боссе $AF
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $96   ; spr
                                        .byte con_chr_bank + $97   ; spr

; 01 area 2
; US
- D 3 - - - 0x01EADE 07:EACE: 3C        .byte con_chr_bank + $3C   ; bg
- D 3 - - - 0x01EADF 07:EACF: 3E        .byte con_chr_bank + $3E   ; bg
- D 3 - - - 0x01EAE0 07:EAD0: 49        .byte con_chr_bank + $49   ; spr
- D 3 - - - 0x01EAE1 07:EAD1: 4A        .byte con_chr_bank + $4A   ; spr
- D 3 - - - 0x01EAE2 07:EAD2: 4B        .byte con_chr_bank + $4B   ; spr
- D 3 - - - 0x01EAE3 07:EAD3: 1A        .byte con_chr_bank + $1A   ; spr
; EU
                                        .byte con_chr_bank + $3C   ; bg
                                        .byte con_chr_bank + $3E   ; bg
                                        .byte con_chr_bank + $A8   ; spr
                                        .byte con_chr_bank + $A9   ; spr
                                        .byte con_chr_bank + $98   ; spr
                                        .byte con_chr_bank + $99   ; spr

; 02 area 3
; US
- D 3 - - - 0x01EAE4 07:EAD4: 0C        .byte con_chr_bank + $0C   ; bg
- D 3 - - - 0x01EAE5 07:EAD5: 0E        .byte con_chr_bank + $0E   ; bg
- D 3 - - - 0x01EAE6 07:EAD6: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EAE7 07:EAD7: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EAE8 07:EAD8: 46        .byte con_chr_bank + $46   ; spr
- D 3 - - - 0x01EAE9 07:EAD9: 48        .byte con_chr_bank + $48   ; spr
; EU
                                        .byte con_chr_bank + $0C   ; bg
                                        .byte con_chr_bank + $0E   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $9A   ; spr
                                        .byte con_chr_bank + $9B   ; spr

; 03 area 4
; US
- D 3 - - - 0x01EAEA 07:EADA: 08        .byte con_chr_bank + $08   ; bg
- D 3 - - - 0x01EAEB 07:EADB: 0A        .byte con_chr_bank + $0A   ; bg
- D 3 - - - 0x01EAEC 07:EADC: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EAED 07:EADD: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EAEE 07:EADE: 46        .byte con_chr_bank + $46   ; spr
- D 3 - - - 0x01EAEF 07:EADF: 47        .byte con_chr_bank + $47   ; spr
; EU
                                        .byte con_chr_bank + $08   ; bg
                                        .byte con_chr_bank + $0A   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $96   ; spr
                                        .byte con_chr_bank + $97   ; spr в начале подъёма наверх, банк переключается - нам требуется $9D

; 04 area 5
; US
- D 3 - - - 0x01EAF0 07:EAE0: 1C        .byte con_chr_bank + $1C   ; bg
- D 3 - - - 0x01EAF1 07:EAE1: 1E        .byte con_chr_bank + $1E   ; bg
- D 3 - - - 0x01EAF2 07:EAE2: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EAF3 07:EAE3: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EAF4 07:EAE4: 46        .byte con_chr_bank + $46   ; spr
- D 3 - - - 0x01EAF5 07:EAE5: 60        .byte con_chr_bank + $60   ; spr
; EU
                                        .byte con_chr_bank + $1C   ; bg
                                        .byte con_chr_bank + $1E   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $96   ; spr
                                        .byte con_chr_bank + $9E   ; spr

; 05 area 6
; US
- D 3 - - - 0x01EAF6 07:EAE6: 4C        .byte con_chr_bank + $4C   ; bg
- D 3 - - - 0x01EAF7 07:EAE7: 4E        .byte con_chr_bank + $4E   ; bg
- D 3 - - - 0x01EAF8 07:EAE8: 49        .byte con_chr_bank + $49   ; spr
- D 3 - - - 0x01EAF9 07:EAE9: 4A        .byte con_chr_bank + $4A   ; spr
- D 3 - - - 0x01EAFA 07:EAEA: 61        .byte con_chr_bank + $9F   ; spr
- D 3 - - - 0x01EAFB 07:EAEB: 62        .byte con_chr_bank + $62   ; spr
; EU
                                        .byte con_chr_bank + $4C   ; bg
                                        .byte con_chr_bank + $4E   ; bg
                                        .byte con_chr_bank + $A8   ; spr
                                        .byte con_chr_bank + $A9   ; spr
                                        .byte con_chr_bank + $61   ; spr
                                        .byte con_chr_bank + $62   ; spr

; 06 area 7
; US
- D 3 - - - 0x01EAFC 07:EAEC: 24        .byte con_chr_bank + $24   ; bg
- D 3 - - - 0x01EAFD 07:EAED: 26        .byte con_chr_bank + $26   ; bg
- D 3 - - - 0x01EAFE 07:EAEE: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EAFF 07:EAEF: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EB00 07:EAF0: 63        .byte con_chr_bank + $63   ; spr
- D 3 - - - 0x01EB01 07:EAF1: 64        .byte con_chr_bank + $64   ; spr
; EU
                                        .byte con_chr_bank + $24   ; bg
                                        .byte con_chr_bank + $26   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $A2   ; spr
                                        .byte con_chr_bank + $A3   ; spr после спуска вниз банк переключается - нам требуется $A4, на боссе $A0

; 07 area 8
; US
- D 3 - - - 0x01EB02 07:EAF2: 34        .byte con_chr_bank + $34   ; bg
- D 3 - - - 0x01EB03 07:EAF3: 36        .byte con_chr_bank + $36   ; bg
- D 3 - - - 0x01EB04 07:EAF4: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EB05 07:EAF5: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EB06 07:EAF6: 67        .byte con_chr_bank + $67   ; spr
- D 3 - - - 0x01EB07 07:EAF7: 68        .byte con_chr_bank + $68   ; spr
; EU
                                        .byte con_chr_bank + $34   ; bg
                                        .byte con_chr_bank + $36   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $A5   ; spr
                                        .byte con_chr_bank + $A6   ; spr


loc_0x00F894_загрузка_палитры_для_уровня:
C D 1 - - - 0x00F894 03:B884: A5 50     LDA ram_номер_уровня
                                        ASL
                                        ADC ram_options_регион
loc_0x00F896_загрузка_палитры:
sub_B886_загрузка_палитры:
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
- D 1 - - - 0x00F8C3 03:B8B3: C9 B8     .word _off021_B8C9_00_area_1_US
                                        .word _off021_B8C9_01_area_1_EU
- D 1 - - - 0x00F8C5 03:B8B5: E1 B8     .word _off021_B8E1_02_area_2_US
                                        .word _off021_B8E1_03_area_2_EU
- D 1 - - - 0x00F8C7 03:B8B7: F9 B8     .word _off021_B8F9_04_area_3_US
                                        .word _off021_B8F9_05_area_3_EU
- D 1 - - - 0x00F8C9 03:B8B9: 11 B9     .word _off021_B911_06_area_4_US
                                        .word _off021_B911_07_area_4_EU
- D 1 - - - 0x00F8CB 03:B8BB: 29 B9     .word _off021_B929_08_area_5_US
                                        .word _off021_B929_09_area_5_EU
- D 1 - - - 0x00F8CD 03:B8BD: 41 B9     .word _off021_B941_0A_area_6_US
                                        .word _off021_B941_0B_area_6_EU
- D 1 - - - 0x00F8CF 03:B8BF: 59 B9     .word _off021_B959_0C_area_7_US
                                        .word _off021_B959_0D_area_7_EU
- D 1 - - - 0x00F8D1 03:B8C1: 71 B9     .word _off021_B971_0E_area_8_US
                                        .word _off021_B971_0F_area_8_EU
- D 1 - - - 0x00F8D3 03:B8C3: 89 B9     .word _off021_B989_10_логотип_слияние
- D 1 - - - 0x00F8D5 03:B8C5: A1 B9     .word _off021_B9A1_11_главный_экран
- D 1 - - - 0x00F8D7 03:B8C7: B9 B9     .word _off021_B9B9_12_заставка
                                        .word _off021_B9D1_13_options   ; options screen



_off021_B8C9_00_area_1_US:
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



_off021_B8C9_01_area_1_EU:
; background
                                        .byte $20, $10, $00   ; 
                                        .byte $20, $10, $00   ; 
                                        .byte $27, $16, $04   ; 
                                        .byte $16, $06, $00   ; 
; sprites
                                        .byte $20, $1C, $0F   ; 
                                        .byte $38, $17, $0F   ; 
                                        .byte $20, $26, $16   ; 
                                        .byte $38, $1A, $0F   ; 



_off021_B8E1_02_area_2_US:
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



_off021_B8E1_03_area_2_EU:
; background
                                        .byte $20, $10, $00   ; 
                                        .byte $00, $10, $0C   ; 
                                        .byte $20, $1C, $0C   ; 
                                        .byte $06, $1C, $0C   ; 
; sprites
                                        .byte $20, $1C, $0F   ; 
                                        .byte $38, $17, $0F   ; 
                                        .byte $20, $26, $16   ; 
                                        .byte $38, $1A, $0F   ; 



_off021_B8F9_04_area_3_US:
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



_off021_B8F9_05_area_3_EU:
; background
                                        .byte $2A, $1A, $0A   ; 
                                        .byte $28, $18, $08   ; 
                                        .byte $10, $1A, $0A   ; 
                                        .byte $20, $10, $00   ; 
; sprites
                                        .byte $20, $1C, $0F   ; 
                                        .byte $38, $17, $0F   ; 
                                        .byte $20, $26, $16   ; 
                                        .byte $34, $14, $0F   ; 



_off021_B911_06_area_4_US:
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



_off021_B911_07_area_4_EU:
; background
                                        .byte $20, $1B, $0A   ; 
                                        .byte $01, $00, $0A   ; 
                                        .byte $01, $1B, $0A   ; 
                                        .byte $01, $00, $06   ; 
; sprites
                                        .byte $20, $1C, $0F   ; 
                                        .byte $38, $17, $0F   ; 
                                        .byte $20, $26, $16   ; 
                                        .byte $20, $1B, $0A   ; 



_off021_B929_08_area_5_US:
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



_off021_B929_09_area_5_EU:
; background
                                        .byte $20, $10, $00   ; 
                                        .byte $2A, $1A, $00   ; 
                                        .byte $2C, $1C, $0C   ; 
                                        .byte $20, $10, $04   ; 
; sprites
                                        .byte $20, $1C, $0F   ; 
                                        .byte $38, $17, $0F   ; 
                                        .byte $20, $26, $16   ; 
                                        .byte $34, $14, $0F   ; 



_off021_B941_0A_area_6_US:
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



_off021_B941_0B_area_6_EU:
; background
                                        .byte $20, $10, $00   ; 
                                        .byte $29, $19, $09   ; 
                                        .byte $20, $10, $06   ; 
                                        .byte $10, $00, $06   ; 
; sprites
                                        .byte $20, $1C, $0F   ; 
                                        .byte $38, $17, $0F   ; 
                                        .byte $20, $26, $16   ; 
                                        .byte $20, $00, $06   ; 



_off021_B959_0C_area_7_US:
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



_off021_B959_0D_area_7_EU:
; background
                                        .byte $2C, $12, $02   ; 
                                        .byte $22, $12, $02   ; 
                                        .byte $27, $16, $06   ; 
                                        .byte $1C, $1A, $0A   ; 
; sprites
                                        .byte $20, $1C, $0F   ; 
                                        .byte $38, $17, $0F   ; 
                                        .byte $20, $26, $16   ; 
                                        .byte $34, $14, $04   ; 



_off021_B971_0E_area_8_US:
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



_off021_B971_0F_area_8_EU:
; background
                                        .byte $24, $14, $04   ; 
                                        .byte $03, $02, $0C   ; 
                                        .byte $20, $10, $00   ; 
                                        .byte $09, $18, $08   ; 
; sprites
                                        .byte $20, $1C, $0F   ; 
                                        .byte $38, $17, $0F   ; 
                                        .byte $20, $26, $16   ; 
                                        .byte $20, $00, $0C   ; 



_off021_B989_10_логотип_слияние:
; background
- D 1 - I - 0x00F999 03:B989: 10        .byte $16, $27, $30   ; 
- D 1 - I - 0x00F99C 03:B98C: 20        .byte $30, $27, $16   ; 
- D 1 - I - 0x00F99F 03:B98F: 20        .byte $12, $22, $30   ; 
- D 1 - I - 0x00F9A2 03:B992: 27        .byte $30, $21, $12   ; 
; sprites
- D 1 - I - 0x00F9A5 03:B995: 16        .byte $16, $06, $0F   ; 
- D 1 - I - 0x00F9A8 03:B998: 20        .byte $20, $16, $17   ; 
- D 1 - I - 0x00F9AB 03:B99B: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F9AE 03:B99E: 20        .byte $20, $00, $0F   ; 



_off021_B9A1_11_главный_экран:
; background
- D 1 - I - 0x00F9B1 03:B9A1: 0F        .byte $0F, $0F, $0F   ; 
- D 1 - I - 0x00F9B4 03:B9A4: 20        .byte $30, $27, $16   ; 
- D 1 - I - 0x00F9B7 03:B9A7: 0F        .byte $0F, $0F, $0F   ; 
- D 1 - I - 0x00F9BA 03:B9AA: 0F        .byte $0F, $0F, $0F   ; 
; sprites
- D 1 - I - 0x00F9BD 03:B9AD: 0F        .byte $0F, $0F, $0F   ; 
- D 1 - I - 0x00F9C0 03:B9B0: 20        .byte $20, $16, $17   ; 
- D 1 - I - 0x00F9C3 03:B9B3: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F9C6 03:B9B6: 20        .byte $20, $00, $0F   ; 



_off021_B9B9_12_заставка:
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


_off021_B9D1_13_options:
; background
                                        .byte $16, $27, $30   ; 
                                        .byte $30, $28, $18   ; 
                                        .byte $00, $00, $00   ; 
                                        .byte $1C, $2C, $30   ; 
; sprites
                                        .byte $16, $06, $0F   ; 
                                        .byte $20, $16, $17   ; 
                                        .byte $20, $26, $16   ; 
                                        .byte $20, $00, $0F   ; 



loc_0x00A123_options:
                                        LDY ram_номер_действия_на_заставке
                                        LDA tbl_9900_lo,y
                                        STA ram_0000
                                        LDA tbl_9904_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9900_lo:
                                        .byte < ofs_options_9908_00_подготовка_экрана_options
                                        .byte < ofs_options_9AFF_01_выбор_опций
                                        .byte < ofs_options_9B12_02_мерцание_exit
                                        .byte < ofs_options_9B27_03_выход_из_экрана_options
tbl_9904_hi:
                                        .byte > ofs_options_9908_00_подготовка_экрана_options
                                        .byte > ofs_options_9AFF_01_выбор_опций
                                        .byte > ofs_options_9B12_02_мерцание_exit
                                        .byte > ofs_options_9B27_03_выход_из_экрана_options



ofs_options_9908_00_подготовка_экрана_options:
                                        LDA #con_chr_bank + $B4
                                        STA ram_bg_bank_1
                                        LDA #con_chr_bank + $40
                                        STA ram_bg_bank_2
                                        LDX #$04    ; options
                                        JSR sub_988E_отрисовка_экранов
                                        LDA ram_cheat_flag
                                        BEQ bra_9921_чит_не_введен
; заменить атрибуты для отображения скрытых опций
                                        LDX ram_index_ppu_buffer
                                        LDY #$00
bra_991E_loop:
                                        LDA tbl_9923_атрибуты,Y
                                        CMP #$FE    ; end token
                                        BEQ bra_991A_закрыть_буфер
                                        STA ram_nmt_buffer,X
                                        INX
                                        INY
                                        BNE bra_991E_loop    ; jmp
bra_991A_закрыть_буфер:
                                        LDA #$FF
                                        STA ram_nmt_buffer,X
                                        INX
                                        STX ram_index_ppu_buffer
bra_9921_чит_не_введен:
                                        LDA #con_pal_13_options
                                        JSR sub_B886_загрузка_палитры
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
                                        JSR sub_9924_отрисовать_difficulty
                                        JSR sub_9926_отрисовать_graphics
                                        JSR sub_9928_отрисовать_obj_limit
                                        JSR sub_992A_отрисовать_continue
                                        JSR sub_992C_отрисовать_level
                                        JSR sub_992E_отрисовать_rest
                                        JSR sub_9930_отрисовать_exit
                                        INC ram_номер_действия_на_заставке
                                        RTS

tbl_9923_атрибуты:
                                        .byte con_buf_mode_06   ; 
                                        
                                        .dbyt $23D8 ; ppu address
                                        .byte $10   ; counter
                                        .byte $00, $00, $00, $00, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $0F, $0F, $0F, $0F   ; 
                                        
                                        .byte $FE   ; end token


sub_9924_отрисовать_difficulty:
                                        LDY ram_options_сложность
                                        LDA tbl_9925_варианты_difficulty,Y
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_9925_варианты_difficulty:
                                        .byte con_0x0017EA_normal   ; 00 
                                        .byte con_0x0017EA_hard   ; 01 
                                        .byte con_0x0017EA_expert   ; 02 

sub_9926_отрисовать_graphics:
                                        LDY ram_options_регион
                                        LDA tbl_9927_варианты_graphics,Y
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_9927_варианты_graphics:
                                        .byte con_0x0017EA_human   ; 00 
                                        .byte con_0x0017EA_robot   ; 01 

sub_9928_отрисовать_obj_limit:
                                        LDY ram_options_колво_объектов
                                        LDA tbl_9929_варианты_obj_limit,Y
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        RTS
                                        
tbl_9929_варианты_obj_limit:
                                        .byte con_0x0017EA_obj_limit_14   ; 00 
                                        .byte con_0x0017EA_obj_limit_32   ; 01 

sub_992A_отрисовать_continue:
                                        LDA #con_0x0017EA_continue
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        LDA ram_options_конты
                                        CLC
                                        ADC #$81
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_992C_отрисовать_level:
                                        LDA #con_0x0017EA_level
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        LDA ram_options_уровень
                                        CLC
                                        ADC #$82
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_992E_отрисовать_rest:
                                        LDA #con_0x0017EA_rest
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        LDA ram_options_жизни
                                        CLC
                                        ADC #$81
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_9930_отрисовать_exit:
                                        LDA #con_0x0017EA_exit
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        RTS


ofs_options_9AFF_01_выбор_опций:
                                        JSR sub_9B30_смена_палитры_сокола
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_UD
                                        BEQ bra_9B01
                                        AND #con_btn_Up
                                        BNE bra_9B00_up
; down
                                        INC ram_номер_опции_колво_игроков
                                        LDA ram_номер_опции_колво_игроков
                                        CMP #$07
                                        BCC bra_9B01
                                        DEC ram_номер_опции_колво_игроков
                                        BNE bra_9B01

bra_9B00_up:
                                        DEC ram_номер_опции_колво_игроков
                                        BPL bra_9B01
                                        INC ram_номер_опции_колво_игроков

bra_9B01:
                                        LDX ram_номер_опции_колво_игроков
                                        LDY tbl_9B2A_x_координаты_стрелки,X ; X координата стрелки
                                        LDA tbl_9B29_y_координаты_стрелки,X ; Y координата стрелки
                                        JSR sub_0x01E46F_запись_данных_для_стрелки
                                        LDA tbl_99B2_опции_lo,X
                                        STA ram_0000
                                        LDA tbl_99B2_опции_hi,X
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_99B2_опции_lo:
                                        .byte < ofs_99B3_options_difficulty
                                        .byte < ofs_99B3_options_graphics
                                        .byte < ofs_99B3_options_obj_limit
                                        .byte < ofs_9B09_options_continue
                                        .byte < ofs_9B09_options_level
                                        .byte < ofs_9B09_options_rest
                                        .byte < ofs_9B10_options_exit
tbl_99B2_опции_hi:
                                        .byte > ofs_99B3_options_difficulty
                                        .byte > ofs_99B3_options_graphics
                                        .byte > ofs_99B3_options_obj_limit
                                        .byte > ofs_9B09_options_continue
                                        .byte > ofs_9B09_options_level
                                        .byte > ofs_9B09_options_rest
                                        .byte > ofs_9B10_options_exit


ofs_99B3_options_difficulty:
ofs_99B3_options_graphics:
ofs_99B3_options_obj_limit:
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_LR
                                        BEQ bra_9B06_RTS
                                        AND #con_btn_Left
                                        BNE bra_9B04_left
; right
                                        INC ram_options_сложность,X
                                        LDA ram_options_сложность,X
                                        CMP tbl_9B07_лимит_опций,X
                                        BCC bra_9B05
                                        DEC ram_options_сложность,X
                                        BNE bra_9B05

bra_9B04_left:
                                        DEC ram_options_сложность,X
                                        BPL bra_9B05
                                        INC ram_options_сложность,X
bra_9B05:
                                        LDA tbl_9B08_начальная_con,X
                                        CLC
                                        ADC ram_options_сложность,X
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
bra_9B06_RTS:
                                        RTS

tbl_9B07_лимит_опций:
                                        .byte $03   ; 00 difficulty
                                        .byte $02   ; 01 graphics
                                        .byte $02   ; 02 obj_limit
                                        
tbl_9B08_начальная_con:
                                        .byte con_0x0017EA_normal   ; 00 difficulty
                                        .byte con_0x0017EA_human   ; 01 graphics
                                        .byte con_0x0017EA_obj_limit_14   ; 02 obj_limit

ofs_9B09_options_continue:
ofs_9B09_options_level:
ofs_9B09_options_rest:
                                        LDA ram_cheat_flag
                                        BEQ bra_9B0C_RTS
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_LR
                                        BEQ bra_9B0B
                                        AND #con_btn_Left
                                        BNE bra_9B0A_left
; right
                                        INC ram_options_сложность,X
                                        LDA ram_options_сложность,X
                                        CMP tbl_9B0D_лимит_опций - $03,X
                                        BCC bra_9B0B
                                        DEC ram_options_сложность,X
                                        BNE bra_9B0B

bra_9B0A_left:
                                        DEC ram_options_сложность,X
                                        BPL bra_9B0B
                                        INC ram_options_сложность,X
bra_9B0B:
                                        LDA tbl_9B0E_начальная_con - $03,X
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        LDY ram_номер_опции_колво_игроков
                                        LDA ram_options_сложность,Y
                                        CLC
                                        ADC tbl_9B0F_номер_тайла - $03,Y
                                        STA ram_nmt_buffer - $02,X
bra_9B0C_RTS:
                                        RTS

tbl_9B0D_лимит_опций:
                                        .byte $06   ; 03 continue
                                        .byte $08   ; 04 level
                                        .byte $0A   ; 05 rest

tbl_9B0E_начальная_con:
                                        .byte con_0x0017EA_continue   ; 03 continue
                                        .byte con_0x0017EA_level   ; 04 level
                                        .byte con_0x0017EA_rest   ; 05 rest

tbl_9B0F_номер_тайла:
                                        .byte $81   ; 03 continue
                                        .byte $82   ; 04 level
                                        .byte $81   ; 05 rest


ofs_9B10_options_exit:
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btn_Start      
                                        BEQ bra_9B11_RTS
; выход
                                        LDA #$01
                                        STA ram_0095
                                        LDA #$40
                                        STA ram_таймер_до_демки
                                        INC ram_номер_действия_на_заставке
bra_9B11_RTS:
                                        RTS



ofs_options_9B12_02_мерцание_exit:
                                        JSR sub_9B30_смена_палитры_сокола
                                        LDA ram_таймер_до_демки
                                        AND #$08
                                        ASL
                                        ASL
                                        ASL
                                        ASL
                                        CLC
                                        ADC #con_0x0017EA_exit
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        DEC ram_таймер_до_демки
                                        BNE bra_9B13_RTS
                                        INC ram_номер_действия_на_заставке
bra_9B13_RTS:
                                        RTS



ofs_options_9B27_03_выход_из_экрана_options:
                                        JSR sub_0x01FAAF_затемнение_экрана
                                        PHP
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
                                        PLP
                                        BCC bra_9B28_RTS
                                        JSR sub_0x01FE1E
                                        JSR sub_0x01E5E0_очистка_оперативки
                                        JSR sub_0x01E7D0_выбор_банков_графики
                                        LDX #$00
                                        JSR sub_988E_отрисовка_экранов
                                        LDA ram_for_2000
                                        AND #$FC
                                        STA ram_for_2000
                                        LDA #$10
                                        JSR sub_B886_загрузка_палитры
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
                                        LDA #con_0x0017EA_1_player
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        LDA #con_0x0017EA_2_players
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        LDA #con_0x0017EA_options
                                        JSR sub_977C_отрисовка_текста_через_буфер_0300x
                                        LDA #$00
                                        STA ram_демка
                                        STA ram_001F_flag
                                        STA ram_номер_уровня
                                        LDA #$04
                                        STA ram_номер_действия_на_заставке
                                        INC ram_002B
                                        LDA #$1E
                                        STA ram_for_2001
                                        LDA #$02
                                        STA ram_номер_опции_колво_игроков
bra_9B28_RTS:
                                        RTS


tbl_9B29_y_координаты_стрелки:
                                        .byte $2F   ; 00
                                        .byte $3F   ; 01
                                        .byte $4F   ; 02
                                        .byte $5F   ; 03
                                        .byte $6F   ; 04
                                        .byte $7F   ; 05
                                        .byte $8F   ; 06

tbl_9B2A_x_координаты_стрелки:
                                        .byte $20   ; 00
                                        .byte $20   ; 01
                                        .byte $20   ; 02
                                        .byte $20   ; 03
                                        .byte $20   ; 04
                                        .byte $20   ; 05
                                        .byte $60   ; 06


sub_9B30_смена_палитры_сокола:
                                        INC ram_счетчик_палитры_орла_lo 
                                        LDA ram_счетчик_палитры_орла_lo 
                                        CMP #$08
                                        BCC bra_9B32_RTS
                                        LDA #$00
                                        STA ram_счетчик_палитры_орла_lo 
                                        INC ram_счетчик_палитры_орла_hi
                                        LDY ram_счетчик_палитры_орла_hi
                                        CPY #$04
                                        BCC bra_9B31
                                        LDY #$00
bra_9B31:
                                        STY ram_счетчик_палитры_орла_hi
                                        LDA tbl_9B33_цвет,y
                                        STA ram_pal_buffer + $05
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
bra_9B32_RTS:
                                        RTS

tbl_9B33_цвет:
                                        .byte $20   ; 00
                                        .byte $38   ; 01
                                        .byte $28   ; 02
                                        .byte $38   ; 03









.out .sprintf("Free bytes in bank 20: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_20b"
    .byte con_prg_bank + $21   ; 
