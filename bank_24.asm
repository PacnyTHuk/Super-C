.segment "BANK_24"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x008010-0x00C00F



.export loc_0x010050_работа_с_экранами


; bzk this byte must be placed at 8000
    .byte con_prg_bank + $24   ; 






loc_0x010050_работа_с_экранами:
C - - - - - 0x01E3CB 07:E3BB: A5 18     LDY ram_демка
; 1путин опт
                                        LDA tbl_E3C7_lo,y
                                        STA ram_0000
                                        LDA tbl_E3C7_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_E3C7_lo:
- D 3 - I - 0x01E3D7 07:E3C7: D3 E3     .byte < ofs_032_E3D3_00_главный_экран
- D 3 - I - 0x01E3D9 07:E3C9: 72 E4     .byte < ofs_032_E472_01
- D 3 - I - 0x01E3DB 07:E3CB: A3 E4     .byte < ofs_032_E4A3_02
- D 3 - I - 0x01E3DD 07:E3CD: C2 E4     .byte < ofs_032_E4C2_03
- - - - - - 0x01E3DF 07:E3CF: E9 E7     .byte < ofs_032_E7E9_04_игра   ; never used 0x01E3CF
- D 3 - I - 0x01E3E1 07:E3D1: C9 E4     .byte < ofs_032_E4C9_05_соунд_тест
                                        .byte < ofs_032_E4E5_06_options
tbl_E3C7_hi:
- D 3 - I - 0x01E3D7 07:E3C7: D3 E3     .byte > ofs_032_E3D3_00_главный_экран
- D 3 - I - 0x01E3D9 07:E3C9: 72 E4     .byte > ofs_032_E472_01
- D 3 - I - 0x01E3DB 07:E3CB: A3 E4     .byte > ofs_032_E4A3_02
- D 3 - I - 0x01E3DD 07:E3CD: C2 E4     .byte > ofs_032_E4C2_03
- - - - - - 0x01E3DF 07:E3CF: E9 E7     .byte > ofs_032_E7E9_04_игра   ; never used 0x01E3CF
- D 3 - I - 0x01E3E1 07:E3D1: C9 E4     .byte > ofs_032_E4C9_05_соунд_тест
                                        .byte > ofs_032_E4E5_06_options



ofs_032_E3D3_00_главный_экран:
C - - J - - 0x01E3E3 07:E3D3: A6 19     LDX ram_номер_действия_на_заставке
C - - - - - 0x01E3E5 07:E3D5: D0 0E     BNE bra_E3E5_минус_x
; X=00 подготовка
C - - - - - 0x01E3E7 07:E3D7: 20 0B E5  JSR sub_E50B_подготовка_главного_экрана
C - - - - - 0x01E3EA 07:E3DA: A9 09     LDA #$11    ; палитра логотипа слияние
C - - - - - 0x01E3EC 07:E3DC: 20 70 FE  JSR sub_0x01FE80_bankswitch_загрузка_палитры_в_03E0x
C - - - - - 0x01E3EF 07:E3DF: 20 BE F7  JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
C - - - - - 0x01E3F2 07:E3E2: E6 19     INC ram_номер_действия_на_заставке
bra_E3E4_RTS:
C - - - - - 0x01E3F4 07:E3E4: 60        RTS

bra_E3E5_минус_x:
C - - - - - 0x01E3F5 07:E3E5: CA        DEX
C - - - - - 0x01E3F6 07:E3E6: D0 20     BNE bra_E408_минус_x
; X=01 слияние логотипа
                                        JSR sub_E4D0_переключение_банков_анимация_super
C - - - - - 0x01E3FB 07:E3EB: 20 EF FE  JSR sub_A30F_обработчик_главного_экрана
C - - - - - 0x01E3FE 07:E3EE: B0 09     BCS bra_E3F9
; заставка еще идет
C - - - - - 0x01E400 07:E3F0: A5 F5     LDA ram_копия_нажатая_кнопка
C - - - - - 0x01E402 07:E3F2: 29 30     AND #con_btns_SS
C - - - - - 0x01E404 07:E3F4: F0 EE     BEQ bra_E3E4_RTS
loc_E3F6_подготовка_начального_экрана:
; нажата кнопка ss/скип заставки
C D 3 - - - 0x01E406 07:E3F6: 20 0B E5  JSR sub_E50B_подготовка_главного_экрана
bra_E3F9:
                                        JSR sub_0x01E5E0_очистка_оперативки
C - - - - - 0x01E409 07:E3F9: 20 2A E5  JSR sub_E52A_палитра_и_надпись_press_start
C - - - - - 0x01E40C 07:E3FC: 20 02 E5  JSR sub_E502_подготовка_счетчиков
C - - - - - 0x01E40F 07:E3FF: A9 00     LDA #$00
C - - - - - 0x01E411 07:E401: 85 18     STA ram_демка
C - - - - - 0x01E413 07:E403: A9 02     LDA #$02
C - - - - - 0x01E415 07:E405: 85 19     STA ram_номер_действия_на_заставке
C - - - - - 0x01E417 07:E407: 60        RTS

bra_E408_минус_x:
                                        JSR sub_E4D0_переключение_банков_анимация_super
                                        JSR sub_E4BC_переключение_банков_анимация_contra
C - - - - - 0x01E418 07:E408: CA        DEX
C - - - - - 0x01E419 07:E409: D0 3E     BNE bra_E443_минус_x

; X=02 логотип + press start
                                        LDA ram_таймер_до_демки
                                        AND #$10
                                        ASL
                                        ASL
                                        ASL
                                        CLC
                                        ADC #con_0x0017EA_press_start
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
bra_E40E:
C - - - - - 0x01E41E 07:E40E: 20 F1 E4  JSR sub_E4F1_проверка_на_демку
C - - - - - 0x01E421 07:E411: D0 03     BNE bra_E416_нет_демки
C - - - - - 0x01E423 07:E413: 4C E5 E4  JMP loc_0x01E4F5_плюс1_демка
bra_E416_нет_демки:
C - - - - - 0x01E43F 07:E42F: A5 F5     LDA ram_копия_нажатая_кнопка
C - - - - - 0x01E441 07:E431: 29 10     AND #con_btn_Start
C - - - - - 0x01E443 07:E433: F0 0E     BEQ bra_E442_RTS
; нажата start
C - - - - - 0x01E44D 07:E43D: A9 80     LDA #$51
C - - - - - 0x01E44F 07:E43F: 85 3C     STA ram_таймер_до_демки
C - - - - - 0x01E451 07:E441: E6 19     INC ram_номер_действия_на_заставке
                                        LDA #con_sound_1A
                                        JMP loc_0x01FDEE_play_sound
bra_E442_RTS:
C - - - - - 0x01E453 07:E443: 60        RTS

bra_E443_минус_x:
                                        DEX
                                        BNE bra_E447_минус_x

; X=03 мерцание press start
                                        LDA ram_таймер_до_демки
                                        AND #$04
                                        ASL
                                        ASL
                                        ASL
                                        ASL
                                        ASL
                                        CLC
                                        ADC #con_0x0017EA_press_start
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        DEC ram_таймер_до_демки
                                        BNE bra_E446_RTS
                                        INC ram_номер_действия_на_заставке
                                        JSR sub_E502_подготовка_счетчиков
                                        LDA #con_0x0017EA_press_start + $80 ; удалить надпись
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        JSR sub_E538_надписи_p1_p2_options
                                        LDY #$52 ; X координата стрелки
                                        LDX ram_номер_опции_колво_игроков
                                        LDA tbl_E470_y_координаты_стрелки,X
                                        JSR sub_E45F_запись_данных_для_стрелки
bra_E446_RTS:
                                        RTS

bra_E447_минус_x:
                                        DEX
                                        BNE bra_E440_минус_x

; X=04 выбор режима игры
C - - - - - 0x01E41B 07:E40B: 20 DF FE  JSR sub_A29C_чит_коды
C - - - - - 0x01E426 07:E416: A6 22     LDX ram_номер_опции_колво_игроков
C - - - - - 0x01E428 07:E418: A9 A7     LDY #$52 ; X координата стрелки
C - - - - - 0x01E42A 07:E41A: BC 70 E4  LDA tbl_E470_y_координаты_стрелки,X
C - - - - - 0x01E42D 07:E41D: 20 5F E4  JSR sub_E45F_запись_данных_для_стрелки
C - - - - - 0x01E430 07:E420: A5 F5     LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_UD
                                        BEQ bra_E42A
                                        AND #con_btn_Up
                                        BNE bra_E430_up
; down
                                        INC ram_номер_опции_колво_игроков
                                        LDA ram_номер_опции_колво_игроков
                                        CMP #$03
                                        BCC bra_E42A
                                        DEC ram_номер_опции_колво_игроков
                                        BNE bra_E42A
bra_E430_up:
                                        DEC ram_номер_опции_колво_игроков
                                        BPL bra_E42A
                                        INC ram_номер_опции_колво_игроков
bra_E42A:
C - - - - - 0x01E43C 07:E42C: 20 02 E5  JSR sub_E502_подготовка_счетчиков
bra_E42F:
C - - - - - 0x01E43F 07:E42F: A5 F5     LDA ram_копия_нажатая_кнопка
C - - - - - 0x01E441 07:E431: 29 10     AND #con_btn_Start
C - - - - - 0x01E443 07:E433: F0 0E     BEQ bra_E443_RTS
; нажата start
; проверка чита для sound test
C - - - - - 0x01E445 07:E435: A5 F7     LDA ram_копия_удержанная_кнопка
C - - - - - 0x01E447 07:E437: 29 C0     AND #con_btns_AB
C - - - - - 0x01E449 07:E439: C9 C0     CMP #con_btns_AB
C - - - - - 0x01E44B 07:E43B: F0 07     BEQ bra_E444
                                        LDA ram_номер_опции_колво_игроков
                                        CMP #$02
                                        BNE bra_E43D
                                        LDA #$40
                                        BNE bra_E43F    ; jmp
bra_E43D:
C - - - - - 0x01E44D 07:E43D: A9 80     LDA #$80
bra_E43F:
C - - - - - 0x01E44F 07:E43F: 85 3C     STA ram_таймер_до_демки
C - - - - - 0x01E451 07:E441: E6 19     INC ram_номер_действия_на_заставке
bra_E443_RTS:
C - - - - - 0x01E453 07:E443: 60        RTS
; sound test
bra_E444:
C - - - - - 0x01E454 07:E444: A9 05     LDA #$05
C - - - - - 0x01E456 07:E446: 4C EC E4  JMP loc_0x01E4FC_запись_в_демку

bra_E440_минус_x:
                                        DEX
                                        BNE bra_E460_x06

; X=05 мигание надписей
C - - - - - 0x01E459 07:E449: A5 3C     LDA ram_таймер_до_демки
C - - - - - 0x01E45B 07:E44B: 29 08     AND #$08
C - - - - - 0x01E45D 07:E44D: 0A        ASL
C - - - - - 0x01E45E 07:E44E: 0A        ASL
C - - - - - 0x01E45F 07:E44F: 0A        ASL
C - - - - - 0x01E460 07:E450: 0A        ASL
                                        CLC
C - - - - - 0x01E461 07:E451: 65 22     ADC ram_номер_опции_колво_игроков
C - - - - - 0x01E463 07:E453: 20 7A FE  JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01E466 07:E456: C6 3C     DEC ram_таймер_до_демки
C - - - - - 0x01E468 07:E458: D0 E9     BNE bra_E443_RTS
                                        LDA ram_номер_опции_колво_игроков
                                        CMP #con_0x0017EA_options
                                        BNE bra_E45A
                                        INC ram_номер_действия_на_заставке
                                        LDA #$01
                                        STA ram_0095
                                        RTS
bra_E45A:
C - - - - - 0x01E46A 07:E45A: A9 02     LDA #$02
C - - - - - 0x01E46C 07:E45C: 4C EC E4  JMP loc_0x01E4FC_запись_в_демку


bra_E460_x06:
; X=06 options
                                        JSR sub_0x01FAAF_затемнение_экрана
                                        PHP
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
                                        PLP
                                        BCC bra_E4BA_RTS
                                        JSR sub_0x01E5E0_очистка_оперативки
                                        LDA #$06
                                        STA ram_демка
                                        LDA #$00
                                        STA ram_номер_действия_на_заставке
                                        STA ram_номер_опции_колво_игроков
bra_E4BA_RTS:
                                        RTS


ofs_032_E472_01:
C - - J - - 0x01E482 07:E472: A6 19     LDX ram_номер_действия_на_заставке
C - - - - - 0x01E484 07:E474: D0 06     BNE bra_E47C
C - - - - - 0x01E486 07:E476: 20 5C E5  JSR sub_E55C_подготовка_ботов_к_игре
C - - - - - 0x01E489 07:E479: E6 19     INC ram_номер_действия_на_заставке
C - - - - - 0x01E48B 07:E47B: 60        RTS
bra_E47C:
C - - - - - 0x01E48C 07:E47C: A5 F1     LDA ram_нажатая_кнопка
C - - - - - 0x01E48E 07:E47E: 29 30     AND #con_btns_SS
C - - - - - 0x01E490 07:E480: F0 06     BEQ bra_E488
C - - - - - 0x01E492 07:E482: 20 96 E4  JSR sub_0x01E4A6_выбрать_следующий_уровень_для_демки
C - - - - - 0x01E495 07:E485: 4C F6 E3  JMP loc_E3F6_подготовка_начального_экрана
bra_E488:
                                        JMP loc_0x01E7F1

ofs_032_E4A3_02:
C - - J - - 0x01E4B3 07:E4A3: A9 00     LDA #$00
C - - - - - 0x01E4B5 07:E4A5: 85 1F     STA ram_001F_flag
C - - - - - 0x01E4B7 07:E4A7: A6 19     LDX ram_номер_действия_на_заставке
C - - - - - 0x01E4B9 07:E4A9: D0 03     BNE bra_E4AE
C - - - - - 0x01E4BB 07:E4AB: E6 19     INC ram_номер_действия_на_заставке
C - - - - - 0x01E4BD 07:E4AD: 60        RTS
bra_E4AE:
C - - - - - 0x01E4C1 07:E4B1: 20 D0 E5  JSR sub_0x01E5E0_очистка_оперативки
C - - - - - 0x01E4C4 07:E4B4: 20 82 E5  JSR sub_0x01E592_подготовка_игроков_к_началу
C - - - - - 0x01E4C7 07:E4B7: 4C E5 E4  JMP loc_0x01E4F5_плюс1_демка


ofs_032_E4C2_03:
C - - J - - 0x01E4D2 07:E4C2: A9 00     LDA #$00
C - - - - - 0x01E4D4 07:E4C4: 85 38     STA ram_номер_экрана
C - - - - - 0x01E4D6 07:E4C6: 4C E5 E4  JMP loc_0x01E4F5_плюс1_демка


ofs_032_E7E9_04_игра:
                                        JMP loc_0x01E7F9_игра


ofs_032_E4C9_05_соунд_тест:
                                        JSR sub_E4D0_переключение_банков_анимация_super
                                        JSR sub_E4BC_переключение_банков_анимация_contra
C - - J - - 0x01E4D9 07:E4C9: A6 19     LDX ram_номер_действия_на_заставке
C - - - - - 0x01E4DB 07:E4CB: D0 0E     BNE bra_E4DB_соунд_тест
C - - - - - 0x01E4DD 07:E4CD: A9 00     LDA #$00
C - - - - - 0x01E4DF 07:E4CF: 8D 00 05  STA ram_кадр_анимации + $02
C - - - - - 0x01E4E2 07:E4D2: E6 19     INC ram_номер_действия_на_заставке
C - - - - - 0x01E4E6 07:E4D6: 85 50     STA ram_номер_уровня
; 1путин опт
C - - - - - 0x01E4EA 07:E4DA: 60        RTS
bra_E4DB_соунд_тест:
C - - - - - 0x01E4EB 07:E4DB: 20 D7 FE  JSR sub_9AE9_sound_mode_handler
C - - - - - 0x01E4EE 07:E4DE: A5 F5     LDA ram_копия_нажатая_кнопка
C - - - - - 0x01E4F0 07:E4E0: 29 10     AND #con_btn_Start
C - - - - - 0x01E4F2 07:E4E2: D0 AB     BNE bra_E48F_exit_sound_mode
C - - - - - 0x01E4F4 07:E4E4: 60        RTS
bra_E48F_exit_sound_mode:
                                        JSR sub_0x01E4A6_выбрать_следующий_уровень_для_демки
                                        LDA #$00
                                        JMP loc_0x01E4FC_запись_в_демку    ; jmp



ofs_032_E4E5_06_options:
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
                                        JSR sub_0x01FE94_bankswitch_отрисовка_экранов
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
                                        LDA #$13    ; палитра экрана с опциями
                                        JSR sub_0x01FE80_bankswitch_загрузка_палитры_в_03E0x
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
                                        LDY ram_option_сложность
                                        LDA tbl_9925_варианты_difficulty,Y
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_9925_варианты_difficulty:
                                        .byte con_0x0017EA_normal   ; 00 
                                        .byte con_0x0017EA_hard   ; 01 
                                        .byte con_0x0017EA_expert   ; 02 

sub_9926_отрисовать_graphics:
                                        LDY ram_option_регион
                                        LDA tbl_9927_варианты_graphics,Y
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_9927_варианты_graphics:
                                        .byte con_0x0017EA_human   ; 00 
                                        .byte con_0x0017EA_robot   ; 01 

sub_9928_отрисовать_obj_limit:
                                        LDY ram_option_колво_объектов
                                        LDA tbl_9929_варианты_obj_limit,Y
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS
                                        
tbl_9929_варианты_obj_limit:
                                        .byte con_0x0017EA_obj_limit_14   ; 00 
                                        .byte con_0x0017EA_obj_limit_32   ; 01 

sub_992A_отрисовать_continue:
                                        LDA #con_0x0017EA_continue
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_option_конты
                                        CLC
                                        ADC #$81
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_992C_отрисовать_level:
                                        LDA #con_0x0017EA_level
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_option_уровень
                                        CLC
                                        ADC #$82
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_992E_отрисовать_rest:
                                        LDA #con_0x0017EA_rest
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_option_жизни
                                        CLC
                                        ADC #$81
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_9930_отрисовать_exit:
                                        LDA #con_0x0017EA_exit
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS


ofs_options_9AFF_01_выбор_опций:
                                        JSR sub_9B30_смена_палитры_сокола
                                        JSR sub_9B34_анимации_орла
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
                                        JSR sub_E45F_запись_данных_для_стрелки
                                        LDA tbl_99B2_опции_lo,X
                                        STA ram_0000
                                        LDA tbl_99B2_опции_hi,X
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_99B2_опции_lo:
                                        .byte < ofs_046_99B3_options_difficulty
                                        .byte < ofs_046_99B3_options_graphics
                                        .byte < ofs_046_99B3_options_obj_limit
                                        .byte < ofs_046_9B09_options_continue
                                        .byte < ofs_046_9B09_options_level
                                        .byte < ofs_046_9B09_options_rest
                                        .byte < ofs_046_9B10_options_exit
tbl_99B2_опции_hi:
                                        .byte > ofs_046_99B3_options_difficulty
                                        .byte > ofs_046_99B3_options_graphics
                                        .byte > ofs_046_99B3_options_obj_limit
                                        .byte > ofs_046_9B09_options_continue
                                        .byte > ofs_046_9B09_options_level
                                        .byte > ofs_046_9B09_options_rest
                                        .byte > ofs_046_9B10_options_exit


ofs_046_99B3_options_difficulty:
ofs_046_99B3_options_graphics:
ofs_046_99B3_options_obj_limit:
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_LR
                                        BEQ bra_9B06_RTS
                                        AND #con_btn_Left
                                        BNE bra_9B03_left
; right
                                        INC ram_options,X
                                        LDA ram_options,X
                                        CMP tbl_9B07_лимит_опций,X
                                        BCC bra_9B04
                                        DEC ram_options,X
                                        BNE bra_9B04

bra_9B03_left:
                                        DEC ram_options,X
                                        BPL bra_9B04
                                        INC ram_options,X
bra_9B04:
                                        LDA tbl_9B08_начальная_con,X
                                        CLC
                                        ADC ram_options,X
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_номер_опции_колво_игроков
                                        CMP #$02    ; obj limit
                                        BNE bra_9B05
                                        LDX ram_option_колво_объектов
                                        LDA tbl_0x01FB75_индексы,X
                                        STA ram_макс_индекс_пули_игрока
                                        LDA tbl_0x01FB75_индексы + $02,X
                                        STA ram_макс_индекс_враги
bra_9B05:
                                        CMP #$01    ; graphics
                                        BNE bra_9B06_RTS
                                        LDA ram_option_регион
                                        BEQ bra_9B07_US
; EU
                                        LDA #$40
bra_9B07_US:
                                        STA ram_регион
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

ofs_046_9B09_options_continue:
ofs_046_9B09_options_level:
ofs_046_9B09_options_rest:
                                        LDA ram_cheat_flag
                                        BEQ bra_9B0C_RTS
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_LR
                                        BEQ bra_9B0B
                                        AND #con_btn_Left
                                        BNE bra_9B0A_left
; right
                                        INC ram_options,X
                                        LDA ram_options,X
                                        CMP tbl_9B0D_лимит_опций - $03,X
                                        BCC bra_9B0B
                                        DEC ram_options,X
                                        BNE bra_9B0B

bra_9B0A_left:
                                        DEC ram_options,X
                                        BPL bra_9B0B
                                        INC ram_options,X
bra_9B0B:
                                        LDA tbl_9B0E_начальная_con - $03,X
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDY ram_номер_опции_колво_игроков
                                        LDA ram_options,Y
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


ofs_046_9B10_options_exit:
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
                                        JSR sub_9B34_анимации_орла
                                        LDA ram_таймер_до_демки
                                        AND #$08
                                        ASL
                                        ASL
                                        ASL
                                        ASL
                                        CLC
                                        ADC #con_0x0017EA_exit
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
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
                                        JSR sub_0x01FE1E_остановить_звуковой_движок
                                        JSR sub_0x01E5E0_очистка_оперативки
                                        JSR sub_0x01E7D0_выбор_банков_графики
                                        LDX #$00
                                        JSR sub_0x01FE94_bankswitch_отрисовка_экранов
                                        LDA ram_for_2000
                                        AND #$FC
                                        STA ram_for_2000
                                        LDA #$10    ; палитра главного экрана
                                        JSR sub_0x01FE80_bankswitch_загрузка_палитры_в_03E0x
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
                                        LDA #con_0x0017EA_1_player
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA #con_0x0017EA_2_players
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA #con_0x0017EA_options
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
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
                                        .byte $2B   ; 00
                                        .byte $3B   ; 01
                                        .byte $4B   ; 02
                                        .byte $5B   ; 03
                                        .byte $6B   ; 04
                                        .byte $7B   ; 05
                                        .byte $8B   ; 06

tbl_9B2A_x_координаты_стрелки:
                                        .byte $22   ; 00
                                        .byte $22   ; 01
                                        .byte $22   ; 02
                                        .byte $22   ; 03
                                        .byte $22   ; 04
                                        .byte $22   ; 05
                                        .byte $62   ; 06


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



sub_9B34_анимации_орла:

                                        LDX #$01
bra_9B35_loop:
                                        JSR sub_9B36_обработка_орла
                                        DEX
                                        BPL bra_9B35_loop
                                        RTS


sub_9B36_обработка_орла:
                                        LDY ram_номер_анимации_орла_в_options,X
                                        LDA tbl_9B37_lo,Y
                                        STA ram_0000
                                        LDA tbl_9B37_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9B37_lo:
                                        .byte < ofs_045_9B40_00
                                        .byte < ofs_045_9B50_01
                                        .byte < ofs_045_9B60_02
                                        .byte < ofs_045_9B70_03
                                        .byte < ofs_045_9B80_04

tbl_9B37_hi:
                                        .byte > ofs_045_9B40_00
                                        .byte > ofs_045_9B50_01
                                        .byte > ofs_045_9B60_02
                                        .byte > ofs_045_9B70_03
                                        .byte > ofs_045_9B80_04


ofs_045_9B40_00:
                                        JSR sub_9B90_подготовка
bra_9B41:
                                        INC ram_номер_анимации_орла_в_options,X
                                        RTS


ofs_045_9B50_01:
                                        DEC ram_таймер_анимации_орла_в_options,X
                                        BNE bra_9B51_RTS
                                        LDA #$08
                                        STA ram_таймер_анимации_орла_в_options,X
                                        INC ram_номер_для_кадра_орла_в_options,X
                                        LDY ram_номер_для_кадра_орла_в_options,X
                                        CPY #$02
                                        BCS bra_9B41
                                        LDA tbl_9B52_кадры,Y
                                        STA ram_кадр_анимации,X
bra_9B51_RTS:
                                        RTS


tbl_9B52_кадры:                 
                                        .byte $C2   ; 00
                                        .byte $C3   ; 01


ofs_045_9B60_02:
                                        STX ram_0000
                                        LDA ram_счетчик_кадров
                                        LSR
                                        LSR
                                        AND #$01
                                        EOR ram_0000
                                        LSR
                                        LDA #$C3
                                        BCC bra_9B61
                                        LDA #$C5
bra_9B61:
                                        STA ram_кадр_анимации,X
                                        LDA ram_счетчик_кадров
                                        LSR
                                        BCC bra_9B62_RTS
                                        LDA tbl_9B95_Y_спрайта_lo,X
                                        STA ram_0000
                                        LDA tbl_9B95_Y_спрайта_hi,X
                                        STA ram_0001
                                        LDA tbl_9B96_X_спрайта_lo,X
                                        STA ram_0002
                                        LDA tbl_9B96_X_спрайта_hi,X
                                        STA ram_0003
                                        LDY ram_счетчик_анимации_орла_в_options,X
                                        LDA (ram_0000),Y
                                        CMP #$80
                                        BEQ bra_9B63
                                        CLC
                                        ADC ram_позиция_y_спрайта,X
                                        STA ram_позиция_y_спрайта,X
                                        LDA (ram_0002),Y
                                        CLC
                                        ADC ram_позиция_x_спрайта,X
                                        STA ram_позиция_x_спрайта,X
                                        INC ram_счетчик_анимации_орла_в_options,X
bra_9B62_RTS:
                                        RTS
                                       
bra_9B63:
                                        LDA #$01
                                        STA ram_таймер_анимации_орла_в_options,X
                                        LDA #$FF
                                        STA ram_номер_для_кадра_орла_в_options,X
bra_9B64:
                                        INC ram_номер_анимации_орла_в_options,X
                                        RTS


ofs_045_9B70_03:
                                        DEC ram_таймер_анимации_орла_в_options,X
                                        BNE bra_9B71_RTS
                                        LDA #$08
                                        STA ram_таймер_анимации_орла_в_options,X
                                        INC ram_номер_для_кадра_орла_в_options,X
                                        LDY ram_номер_для_кадра_орла_в_options,X
                                        CPY #$05
                                        BCS bra_9B72
                                        LDA tbl_9B53_кадры_2,Y
                                        STA ram_кадр_анимации,X
bra_9B71_RTS:
                                        RTS
                                        
tbl_9B53_кадры_2:
                                        .byte $C3   ; 00
                                        .byte $C4   ; 01
                                        .byte $C3   ; 02
                                        .byte $C2   ; 03
                                        .byte $00   ; 04

bra_9B72:
                                        LDA tbl_9B81_таймеры_анимации,X
                                        STA ram_таймер_анимации_орла_в_options,X
                                        BNE bra_9B64
ofs_045_9B80_04:
                                        DEC ram_таймер_анимации_орла_в_options,X
                                        BNE bra_9B71_RTS
                                        JSR sub_9B90_подготовка
                                        LDA #$01
                                        STA ram_номер_анимации_орла_в_options,X
                                        RTS
                                        
tbl_9B81_таймеры_анимации:
                                        .byte $90   ; 00
                                        .byte $A6   ; 01


sub_9B90_подготовка:
                                        LDA #$00                                        
                                        STA ram_кадр_анимации,X
                                        STA ram_атрибуты_спрайта,X
                                        STA ram_счетчик_анимации_орла_в_options,X
                                        LDA #$C2 ; первичная Y спрайтов
                                        STA ram_позиция_y_спрайта,X
                                        LDA tbl_9B91_x_позиция,X ; первичная X спрайтов
                                        STA ram_позиция_x_спрайта,X
                                        LDA #$40
                                        STA ram_таймер_анимации_орла_в_options,X
                                        LDA #$FF
                                        STA ram_номер_для_кадра_орла_в_options,X
                                        RTS

tbl_9B91_x_позиция:
                                        .byte $70   ; 00 x спрайта
                                        .byte $88   ; 01 x спрайта


tbl_9B95_Y_спрайта_lo:
                                        .byte < off_9BA0_00_Y_спрайта_left
                                        .byte < off_9BC0_01_Y_спрайта_right


tbl_9B95_Y_спрайта_hi:
                                        .byte > off_9BA0_00_Y_спрайта_left
                                        .byte > off_9BC0_01_Y_спрайта_right


tbl_9B96_X_спрайта_lo:
                                        .byte < off_9BA0_00_X_спрайта_left
                                        .byte < off_9BC0_01_X_спрайта_right


tbl_9B96_X_спрайта_hi:
                                        .byte > off_9BA0_00_X_спрайта_left
                                        .byte > off_9BC0_01_X_спрайта_right


off_9BA0_00_Y_спрайта_left:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $02, $01, $01, $01, $01, $00, $00, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; 00
                                        .byte $FF, $FF, $FF, $FE, $FE, $00, $FE, $FE, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF ; 10
                                        .byte $FE, $FF, $FF, $FF, $FE, $FE, $FE, $FF, $FF, $01, $02, $02, $01, $02, $02, $FF ; 20
                                        .byte $FF, $FE, $FE, $FE, $FE, $FE, $FE, $FF, $FE, $FF, $00, $00, $00, $00, $01, $01 ; 30
                                        .byte $01, $01, $01, $01, $02, $00                                                   ; 40
                                        .byte $80  ;   end token


off_9BA0_00_X_спрайта_left:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $FE, $FE, $FE, $FF, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; 00
                                        .byte $FE, $FE, $FF, $FF, $FF, $FE, $FE, $FF, $00, $02, $02, $02, $02, $02, $02, $02 ; 10
                                        .byte $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02 ; 20
                                        .byte $02, $01, $00, $01, $00, $01, $00, $FF, $00, $FF, $02, $02, $02, $02, $02, $02 ; 30
                                        .byte $02, $02, $02, $01, $00, $FF                                                   ; 40


off_9BC0_01_Y_спрайта_right:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $02, $01, $01, $01, $01, $00, $00, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; 00
                                        .byte $FF, $FF, $FF, $FE, $FE, $00, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF ; 10
                                        .byte $FE, $FF, $FF, $FF, $FE, $FE, $FE, $FF, $FF, $01, $02, $02, $01, $02, $02, $FF ; 20
                                        .byte $FF, $FE, $FE, $FE, $FE, $00, $FF, $00, $00, $00, $00                          ; 30
                                        .byte $80  ;   end token


off_9BC0_01_X_спрайта_right:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $02, $02, $02, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02 ; 00
                                        .byte $02, $02, $01, $01, $01, $02, $02, $01, $00, $00, $FE, $FE, $FE, $FE, $FE, $FE ; 10
                                        .byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; 20
                                        .byte $FE, $FE, $FF, $FF, $00, $02, $02, $02, $01, $00, $00                          ; 30



sub_E4BC_переключение_банков_анимация_contra:
                                        LDA ram_счетчик_кадров
                                        AND #$07
                                        BNE bra_E4BC_RTS
                                        DEC ram_счетчик_анимации_contra
                                        BPL bra_E4BB
                                        LDY #$03
                                        STY ram_счетчик_анимации_contra
bra_E4BB:
                                        LDY ram_счетчик_анимации_contra
                                        LDA tbl_E4BD_банки_фона,Y
                                        STA ram_bg_bank_2
bra_E4BC_RTS:
                                        RTS

tbl_E4BD_банки_фона:
                                        .byte con_chr_bank + $84 ; 00
                                        .byte con_chr_bank + $80 ; 01
                                        .byte con_chr_bank + $82 ; 02
                                        .byte con_chr_bank + $86 ; 03


sub_E4D0_переключение_банков_анимация_super:
                                        LDY ram_счетчик_анимации_super
                                        BPL bra_E4E0
bra_E4D5:
                                        LDA ram_демка
                                        BNE bra_E4D6
                                        LDA ram_номер_действия_на_заставке
                                        CMP #$01
                                        BEQ bra_E4D7
bra_E4D6:
                                        LDA ram_счетчик_кадров
                                        BEQ bra_E4D8_запись
                                        RTS
bra_E4D7:
                                        LDA ram_номер_анимации_логотипа
                                        CMP #$03
                                        BNE bra_E4D1_RTS
                                        LDA ram_0081
                                        CMP #$30
                                        BNE bra_E4D1_RTS
bra_E4D8_запись:
                                        LDY #$06
                                        STY ram_счетчик_анимации_super
bra_E4E0:
                                        LDA ram_счетчик_кадров
                                        LSR
                                        BCS bra_E4D1_RTS
                                        LDA tbl_E4D3_банки_фона,Y
                                        STA ram_bg_bank_1
                                        DEC ram_счетчик_анимации_super
bra_E4D1_RTS:
                                        RTS

tbl_E4D3_банки_фона:
                                        .byte con_chr_bank + $40 ; 00
                                        .byte con_chr_bank + $92 ; 01
                                        .byte con_chr_bank + $90 ; 02
                                        .byte con_chr_bank + $8E ; 03
                                        .byte con_chr_bank + $8C ; 04
                                        .byte con_chr_bank + $8A ; 05
                                        .byte con_chr_bank + $88 ; 06


sub_E45F_запись_данных_для_стрелки:
C - - - - - 0x01E46F 07:E45F: 8D 1A 05  STA ram_позиция_y_спрайта + $02
C - - - - - 0x01E472 07:E462: 8C 34 05  STY ram_позиция_x_спрайта + $02
                                        LDA ram_номер_анимации_логотипа
                                        AND #$03
                                        BNE bra_E463
                                        DEC ram_0081
                                        BPL bra_E463
                                        LDA #$0B
                                        STA ram_0081
bra_E463:
                                        LDA ram_0081
                                        ASL
                                        TAY
                                        LDA tbl_E46F_спрайты_стрелки,Y
                                        STA ram_кадр_анимации + $02
                                        LDA tbl_E46F_спрайты_стрелки + $01,Y
                                        STA ram_атрибуты_спрайта + $02
                                        INC ram_номер_анимации_логотипа
C - - - - - 0x01E47F 07:E46F: 60        RTS


tbl_E46F_спрайты_стрелки:
                                        .byte $FD, $00   ; 00
                                        .byte $FE, $00   ; 01
                                        .byte $FF, $40   ; 02
                                        .byte $FE, $40   ; 03
                                        .byte $FD, $40   ; 04
                                        .byte $FC, $40   ; 05
                                        .byte $FD, $40   ; 06
                                        .byte $FE, $40   ; 07
                                        .byte $FF, $00   ; 08
                                        .byte $FE, $00   ; 09
                                        .byte $FD, $00   ; 0A
                                        .byte $FC, $00   ; 0B



tbl_E470_y_координаты_стрелки:
- D 3 - - - 0x01E480 07:E470: 20        .byte $8B   ; 00 1 Player
- D 3 - - - 0x01E481 07:E471: 80        .byte $9B   ; 01 2 Players
                                        .byte $AB   ; 02 Options

sub_A30F_обработчик_главного_экрана:
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
C - - - - - 0x002339 00:A329: 85 85     STA ram_0085_for_2006
C - - - - - 0x00233B 00:A32B: 85 86     STA ram_0085_for_2006 + $01
C - - - - - 0x00233D 00:A32D: A9 00     LDA #$00
C - - - - - 0x00233F 00:A32F: 85 FD     STA ram_scroll_X
C - - - - - 0x002341 00:A331: 85 FC     STA ram_scroll_Y
C - - - - - 0x002343 00:A333: A2 02     LDX #$00    ; title screen
C - - - - - 0x002345 00:A335: 20 8E 98  JSR sub_0x01FE94_bankswitch_отрисовка_экранов
loc_A338:
C D 1 - - - 0x002348 00:A338: E6 80     INC ram_номер_анимации_логотипа
C - - - - - 0x00234A 00:A33A: 18        CLC
C - - - - - 0x00234B 00:A33B: 60        RTS



ofs_010_A33C_01_слияние:
C - - J - - 0x00234C 00:A33C: A5 1B     LDA ram_счетчик_кадров
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
C - - - - - 0x00235F 00:A34F: B5 85     LDA ram_0085_for_2006,X
C - - - - - 0x002361 00:A351: 49 01     EOR #$01
C - - - - - 0x002363 00:A353: 95 85     STA ram_0085_for_2006,X
bra_A355:
C - - - - - 0x002365 00:A355: B5 85     LDA ram_0085_for_2006,X
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


sub_E55C_подготовка_ботов_к_игре:
C - - - - - 0x01E56C 07:E55C: 20 D0 E5  JSR sub_0x01E5E0_очистка_оперативки
C - - - - - 0x01E56F 07:E55F: A9 01     LDA #$01
C - - - - - 0x01E571 07:E561: 85 1F     STA ram_001F_flag
C - - - - - 0x01E573 07:E563: 85 20     STA ram_колво_игроков
C - - - - - 0x01E575 07:E565: A9 01     LDA #con_plr_status_респавн
C - - - - - 0x01E577 07:E567: 85 A0     STA ram_статус_игрока
C - - - - - 0x01E579 07:E569: 85 A1     STA ram_статус_игрока + $01
C - - - - - 0x01E57B 07:E56B: A9 00     LDA #$00
C - - - - - 0x01E57D 07:E56D: 85 CA     STA ram_plr_game_over
C - - - - - 0x01E57F 07:E56F: 85 CB     STA ram_plr_game_over + $01
C - - - - - 0x01E581 07:E571: 85 1B     STA ram_счетчик_кадров
;C - - - - - 0x01E583 07:E573: 85 5B     STA ram_счетчик_кадров_2
C - - - - - 0x01E585 07:E575: 85 23     STA ram_рандом_байт
C - - - - - 0x01E587 07:E577: A9 10     LDA #$10
C - - - - - 0x01E589 07:E579: 85 53     STA ram_жизни
C - - - - - 0x01E58B 07:E57B: 85 54     STA ram_жизни + $01
C - - - - - 0x01E58D 07:E57D: A5 F0     LDA ram_00F0
C - - - - - 0x01E58F 07:E57F: 85 50     STA ram_номер_уровня
C - - - - - 0x01E591 07:E581: 60        RTS



sub_A29C_чит_коды:
; 1путин: опт/замена кода
C D 1 - - - 0x0022AC 00:A29C: A4 50     LDA ram_cheat_flag
C - - - - - 0x0022AE 00:A29E: 30 1C     BNE bra_A2BC_RTS
                                        LDY ram_cheat_input_cnt
C - - - - - 0x0022B0 00:A2A0: A5 F1     LDA ram_нажатая_кнопка
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
                                        LDA #$20
                                        STA ram_счетчик_мерцания_экрана
                                        LDA #con_sound_23
                                        JSR sub_0x01FDEE_play_sound
bra_A2B8_incorrect_input:
C - - - - - 0x0022C8 00:A2B8: A9 FF     LDA #$00
C - - - - - 0x0022CA 00:A2BA: 85 50     STA ram_cheat_input_cnt
bra_A2BC_RTS:
C - - - - - 0x0022CC 00:A2BC: 60        RTS



tbl_A2BD_cheat_code:
                                        .byte con_btn_A   ; 00
                                        .byte con_btn_B   ; 01
                                        .byte con_btn_Right   ; 02
                                        .byte con_btn_Left   ; 03
                                        .byte con_btn_Right   ; 04
                                        .byte con_btn_Left   ; 05
                                        .byte con_btn_Down   ; 06
                                        .byte con_btn_Down   ; 07
                                        .byte con_btn_Up   ; 08
                                        .byte con_btn_Up   ; 09
                                        .byte $00   ; 0A end token



sub_E52A_палитра_и_надпись_press_start:
C - - - - - 0x01E53A 07:E52A: A5 FF     LDA ram_for_2000
C - - - - - 0x01E53C 07:E52C: 29 FC     AND #$FC
C - - - - - 0x01E53E 07:E52E: 85 FF     STA ram_for_2000
C - - - - - 0x01E540 07:E530: A9 08     LDA #$10    ; палитра главного экрана
C - - - - - 0x01E542 07:E532: 20 70 FE  JSR sub_0x01FE80_bankswitch_загрузка_палитры_в_03E0x
C - - - - - 0x01E545 07:E535: 20 BE F7  JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
C - - - - - 0x01E548 07:E538: A9 00     LDA #con_0x0017EA_press_start 
C - - - - - 0x01E54A 07:E53A: 20 7A FE  JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS
sub_E538_надписи_p1_p2_options:
C - - - - - 0x01E548 07:E538: A9 00     LDA #con_0x0017EA_1_player
C - - - - - 0x01E54A 07:E53A: 20 7A FE  JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01E54D 07:E53D: A9 01     LDA #con_0x0017EA_2_players
C - - - - - 0x01E54F 07:E53F: 20 7A FE  JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA #con_0x0017EA_options
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS


sub_E4F1_проверка_на_демку:
C - - - - - 0x01E501 07:E4F1: A5 3C     LDA ram_таймер_до_демки
C - - - - - 0x01E503 07:E4F3: 05 3D     ORA ram_003D
C - - - - - 0x01E505 07:E4F5: F0 0A     BEQ bra_E501_RTS
C - - - - - 0x01E507 07:E4F7: A5 3C     LDA ram_таймер_до_демки
C - - - - - 0x01E509 07:E4F9: D0 02     BNE bra_E4FD
C - - - - - 0x01E50B 07:E4FB: C6 3D     DEC ram_003D
bra_E4FD:
C - - - - - 0x01E50D 07:E4FD: C6 3C     DEC ram_таймер_до_демки
C - - - - - 0x01E50F 07:E4FF: A9 01     LDA #$01
bra_E501_RTS:
C - - - - - 0x01E511 07:E501: 60        RTS



sub_E502_подготовка_счетчиков:
C - - - - - 0x01E512 07:E502: A9 00     LDA #$00
C - - - - - 0x01E514 07:E504: A0 01     LDY #$01
C - - - - - 0x01E516 07:E506: 85 3C     STA ram_таймер_до_демки
C - - - - - 0x01E518 07:E508: 84 3D     STY ram_003D
C - - - - - 0x01E51A 07:E50A: 60        RTS


sub_E50B_подготовка_главного_экрана:
C - - - - - 0x01E51B 07:E50B: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
C - - - - - 0x01E521 07:E511: A2 02     LDX #$00
C - - - - - 0x01E523 07:E513: 20 84 FE  JSR sub_0x01FE94_bankswitch_отрисовка_экранов
C - - - - - 0x01E526 07:E516: A9 00     LDA #$00
C - - - - - 0x01E528 07:E518: 85 1F     STA ram_001F_flag
C - - - - - 0x01E52A 07:E51A: 85 50     STA ram_номер_уровня
C - - - - - 0x01E52C 07:E51C: 20 D0 E5  JSR sub_0x01E5E0_очистка_оперативки
C - - - - - 0x01E52F 07:E51F: 20 C0 E7  JSR sub_0x01E7D0_выбор_банков_графики
; 1путин опт
                                        INC ram_002B
C - - - - - 0x01E535 07:E525: A9 1E     LDA #$1E
C - - - - - 0x01E537 07:E527: 85 FE     STA ram_for_2001
C - - - - - 0x01E539 07:E529: 60        RTS



sub_9AE9_sound_mode_handler:
; leon опт
                                        LDY ram_sound_mode_handler
                                        LDA tbl_9ADE_lo,y
                                        STA ram_0000
                                        LDA tbl_9ADE_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9ADE_lo:
- D 0 - I - 0x009AEE 02:9ADE: E6 9A     .byte < ofs_соунд_тест_9AE6_00_инициализация
- D 0 - I - 0x009AF0 02:9AE0: FF 9A     .byte < ofs_соунд_тест_9AFF_01_очистить_экран_лого
- D 0 - I - 0x009AF2 02:9AE2: 11 9B     .byte < ofs_соунд_тест_9B11_02_отрисовка_окна
- D 0 - I - 0x009AF4 02:9AE4: 2A 9B     .byte < ofs_соунд_тест_9B2A_03_обработчик_меню
tbl_9ADE_hi:
- D 0 - I - 0x009AEE 02:9ADE: E6 9A     .byte > ofs_соунд_тест_9AE6_00_инициализация
- D 0 - I - 0x009AF0 02:9AE0: FF 9A     .byte > ofs_соунд_тест_9AFF_01_очистить_экран_лого
- D 0 - I - 0x009AF2 02:9AE2: 11 9B     .byte > ofs_соунд_тест_9B11_02_отрисовка_окна
- D 0 - I - 0x009AF4 02:9AE4: 2A 9B     .byte > ofs_соунд_тест_9B2A_03_обработчик_меню


ofs_соунд_тест_9AE6_00_инициализация:
C - - J - - 0x009AF6 02:9AE6: A0 18     LDY #$18
; clear 0050-0068
C - - - - - 0x009AF8 02:9AE8: A9 00     LDA #$00
bra_9AEA_loop:
C - - - - - 0x009AFA 02:9AEA: 99 50 00  STA $00 + $50,Y
C - - - - - 0x009AFD 02:9AED: 88        DEY
C - - - - - 0x009AFE 02:9AEE: 10 FA     BPL bra_9AEA_loop
C - - - - - 0x009B00 02:9AF0: A9 23     LDA #> $23A0
C - - - - - 0x009B02 02:9AF2: 85 57     STA ram_0056_sound_mode_ppu + $01
C - - - - - 0x009B04 02:9AF4: A9 A0     LDA #< $23A0
C - - - - - 0x009B06 02:9AF6: 85 56     STA ram_0056_sound_mode_ppu
C - - - - - 0x009B08 02:9AF8: A9 0D     LDA #$0D    ; clear lines counter
C - - - - - 0x009B0A 02:9AFA: 85 55     STA ram_очки_до_жизни_младш
C - - - - - 0x009B0C 02:9AFC: 4C 0E 9B  JMP loc_9B0E



ofs_соунд_тест_9AFF_01_очистить_экран_лого:
C - - J - - 0x009B0F 02:9AFF: 20 48 9C  JSR sub_9C48
C - - - - - 0x009B12 02:9B02: C6 55     DEC ram_очки_до_жизни_младш
C - - - - - 0x009B14 02:9B04: 10 0A     BPL bra_9B10_RTS
; if all lines are cleared
C - - - - - 0x009B16 02:9B06: A9 00     LDA #$00
C - - - - - 0x009B18 02:9B08: 85 55     STA ram_очки_до_жизни_младш
C - - - - - 0x009B1A 02:9B0A: A9 04     LDA #$04    ; wait 4 frames before drawing window
C - - - - - 0x009B1C 02:9B0C: 85 52     STA ram_sound_mode_draw_cooldown
loc_9B0E:
C D 0 - - - 0x009B1E 02:9B0E: E6 50     INC ram_sound_mode_handler    ; 00 -> 01, 01 -> 02, 02 -> 03
bra_9B10_RTS:
C - - - - - 0x009B20 02:9B10: 60        RTS



ofs_соунд_тест_9B11_02_отрисовка_окна:
C - - J - - 0x009B21 02:9B11: C6 52     DEC ram_sound_mode_draw_cooldown
C - - - - - 0x009B23 02:9B13: D0 FB     BNE bra_9B10_RTS
; if it's time to draw a window
C - - - - - 0x009B25 02:9B15: A9 01     LDA #$01
C - - - - - 0x009B27 02:9B17: 85 52     STA ram_sound_mode_draw_cooldown
C - - - - - 0x009B29 02:9B19: 20 78 9C  JSR sub_9C78_отрисовка_окна_соунд_тест
C - - - - - 0x009B2C 02:9B1C: E6 55     INC ram_очки_до_жизни_младш
C - - - - - 0x009B2E 02:9B1E: A5 55     LDA ram_очки_до_жизни_младш
C - - - - - 0x009B30 02:9B20: C9 0E     CMP #$0E    ; window lines counter
C - - - - - 0x009B32 02:9B22: 90 EC     BCC bra_9B10_RTS
C - - - - - 0x009B34 02:9B24: 20 D9 9B  JSR sub_9BD9
C - - - - - 0x009B37 02:9B27: 4C 0E 9B  JMP loc_9B0E



ofs_соунд_тест_9B2A_03_обработчик_меню:
C - - J - - 0x009B3A 02:9B2A: 20 08 9F  JSR sub_9F08_sound_mode
C - - - - - 0x009B3D 02:9B2D: 20 92 9B  JSR sub_9B92_sound_mode
C - - - - - 0x009B40 02:9B30: 20 50 9B  JSR sub_9B50_sound_mode
;C - - - - - 0x009B43 02:9B33: A9 21     LDA #$21
;C - - - - - 0x009B45 02:9B35: 8D 4E 05  STA ram_атрибуты_спрайта + $02
;C - - - - - 0x009B48 02:9B38: A9 B9     LDA #$B9
;C - - - - - 0x009B4A 02:9B3A: 8D 00 05  STA ram_кадр_анимации + $02
C - - - - - 0x009B4D 02:9B3D: A9 34     LDY #$37
;C - - - - - 0x009B4F 02:9B3F: 8D 34 05  STA ram_позиция_x_спрайта + $02
C - - - - - 0x009B52 02:9B42: A5 53     LDA ram_sound_mode_track_cur
C - - - - - 0x009B54 02:9B44: 38        SEC
C - - - - - 0x009B55 02:9B45: E5 54     SBC ram_sound_mode_track_min
C - - - - - 0x009B57 02:9B47: 0A        ASL
C - - - - - 0x009B58 02:9B48: 0A        ASL
C - - - - - 0x009B59 02:9B49: 0A        ASL
C - - - - - 0x009B5A 02:9B4A: 69 A7     ADC #$A3
;C - - - - - 0x009B5C 02:9B4C: 8D 1A 05  STA ram_позиция_y_спрайта + $02
                                        JSR sub_E45F_запись_данных_для_стрелки
C - - - - - 0x009B5F 02:9B4F: 60        RTS



sub_9B50_sound_mode:
C - - - - - 0x009B60 02:9B50: A5 F5     LDA ram_копия_нажатая_кнопка
C - - - - - 0x009B62 02:9B52: 10 06     BPL bra_9B5A    ; if not con_btn_A
C - - - - - 0x009B64 02:9B54: 20 51 9F  JSR sub_9F51
C - - - - - 0x009B67 02:9B57: 4C 0E FE  JMP loc_0x01FE1E_остановить_звуковой_движок
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
C - - - - - 0x009B7B 02:9B6B: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
bra_9B6E:
C - - - - - 0x009B7E 02:9B6E: A4 53     LDY ram_sound_mode_track_cur
C - - - - - 0x009B80 02:9B70: B9 A4 9C  LDA tbl_9CA4_список_треков,Y
C - - - - - 0x009B83 02:9B73: 4C DE FD  JMP loc_0x01FDEE_play_sound
bra_9B76_26:
; проиграть один за другим
C - - - - - 0x009B86 02:9B76: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
C - - - - - 0x009B89 02:9B79: AD 5E 9F  LDA #< tbl_9F62_автовоспроизведение
C - - - - - 0x009B8C 02:9B7C: 85 5C     STA ram_005C_sound_mode_data
C - - - - - 0x009B8E 02:9B7E: AD 5F 9F  LDA #> tbl_9F62_автовоспроизведение
C - - - - - 0x009B91 02:9B81: 85 5D     STA ram_005C_sound_mode_data + $01
; bzk optimize, не похоже что данные из tbl_9FB7 будут считаны
C - - - - - 0x009B93 02:9B83: AD 60 9F  LDA #< tbl_9FB7
C - - - - - 0x009B96 02:9B86: 85 60     STA ram_0060_sound_mode_data
C - - - - - 0x009B98 02:9B88: AD 61 9F  LDA #> tbl_9FB7
C - - - - - 0x009B9B 02:9B8B: 85 61     STA ram_0060_sound_mode_data + $01
C - - - - - 0x009B9D 02:9B8D: A9 01     LDA #$01
C - - - - - 0x009B9F 02:9B8F: 85 59     STA ram_play_all
C - - - - - 0x009BA1 02:9B91: 60        RTS



sub_9B92_sound_mode:
C - - - - - 0x009BA2 02:9B92: A5 59     LDA ram_play_all
C - - - - - 0x009BA4 02:9B94: D0 31     BNE bra_9BC7_RTS
C - - - - - 0x009BA6 02:9B96: A5 F7     LDA ram_копия_удержанная_кнопка
C - - - - - 0x009BA8 02:9B98: 29 0C     AND #con_btns_UD
C - - - - - 0x009BAA 02:9B9A: F0 2B     BEQ bra_9BC7_RTS
C - - - - - 0x009BAC 02:9B9C: A0 04     LDY #$04
C - - - - - 0x009BAE 02:9B9E: C6 58     DEC ram_0058_sound_mode
C - - - - - 0x009BB0 02:9BA0: F0 08     BEQ bra_9BAA
C - - - - - 0x009BB2 02:9BA2: A5 F5     LDA ram_копия_нажатая_кнопка
C - - - - - 0x009BB4 02:9BA4: 29 0C     AND #con_btns_UD
C - - - - - 0x009BB6 02:9BA6: F0 1F     BEQ bra_9BC7_RTS
C - - - - - 0x009BB8 02:9BA8: A0 20     LDY #$20
bra_9BAA:
C - - - - - 0x009BBA 02:9BAA: 84 58     STY ram_0058_sound_mode
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
C - - - - - 0x009C00 02:9BF0: 6D CB 9C  ADC #< tbl_9CCD_track_names
C - - - - - 0x009C03 02:9BF3: 85 08     STA ram_0008
C - - - - - 0x009C05 02:9BF5: AD CC 9C  LDA #> tbl_9CCD_track_names
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
C - - - - - 0x009C60 02:9C50: A5 57     LDA ram_0056_sound_mode_ppu + $01    ; ppu hi
C - - - - - 0x009C62 02:9C52: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C65 02:9C55: E8        INX
C - - - - - 0x009C66 02:9C56: A5 56     LDA ram_0056_sound_mode_ppu    ; ppu lo
C - - - - - 0x009C68 02:9C58: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C6B 02:9C5B: E8        INX
C - - - - - 0x009C6C 02:9C5C: A9 20     LDA #$20    ; counter
C - - - - - 0x009C6E 02:9C5E: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C71 02:9C61: E8        INX
C - - - - - 0x009C72 02:9C62: A9 00     LDA #$00    ; tile
C - - - - - 0x009C74 02:9C64: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C77 02:9C67: E8        INX
C - - - - - 0x009C78 02:9C68: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x009C7A 02:9C6A: A5 56     LDA ram_0056_sound_mode_ppu
C - - - - - 0x009C7C 02:9C6C: 38        SEC
C - - - - - 0x009C7D 02:9C6D: E9 20     SBC #< $0020
C - - - - - 0x009C7F 02:9C6F: 85 56     STA ram_0056_sound_mode_ppu
C - - - - - 0x009C81 02:9C71: A5 57     LDA ram_0056_sound_mode_ppu + $01
C - - - - - 0x009C83 02:9C73: E9 00     SBC #> $0020
C - - - - - 0x009C85 02:9C75: 85 57     STA ram_0056_sound_mode_ppu + $01
C - - - - - 0x009C87 02:9C77: 60        RTS



sub_9C78_отрисовка_окна_соунд_тест:
C - - - - - 0x009C88 02:9C78: A5 55     LDA ram_очки_до_жизни_младш    ; window line counter
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



tbl_9CA4_список_треков:
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
- D 0 - I - 0x009E68 02:9E58: 2D        .byte $50, $1D, $19, $1F, $18, $0E, $00, $17, $19, $0E, $0F, $2D   ; 

- D 0 - I - 0x009E74 02:9E64: FF        .byte $FF   ; end token



_off011_9E65_03:
- D 0 - I - 0x009E75 02:9E65: 22 4A     .dbyt $224A ; ppu address
- D 0 - I - 0x009E77 02:9E67: 0C        .byte $0C   ; counter
- D 0 - I - 0x009E78 02:9E68: 2A        .byte $2A, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $2B   ; 

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
- D 0 - I - 0x009EA7 02:9E97: 2D        .byte $50   ; 

- D 0 - I - 0x009EA8 02:9E98: 22 BA     .dbyt $22BA ; ppu address
- D 0 - I - 0x009EAA 02:9E9A: 01        .byte $01   ; counter
- D 0 - I - 0x009EAB 02:9E9B: 2D        .byte $2D   ; 

- D 0 - I - 0x009EAC 02:9E9C: FF        .byte $FF   ; end token



_off011_9E9D_07:
- D 0 - I - 0x009EAD 02:9E9D: 22 C5     .dbyt $22C5 ; ppu address
- D 0 - I - 0x009EAF 02:9E9F: 01        .byte $01   ; counter
- D 0 - I - 0x009EB0 02:9EA0: 2D        .byte $50   ; 

- D 0 - I - 0x009EB1 02:9EA1: 22 D1     .dbyt $22D1 ; ppu address
- D 0 - I - 0x009EB3 02:9EA3: 0A        .byte $0A   ; counter
- D 0 - I - 0x009EB4 02:9EA4: 0C        .byte $0C, $25, $25, $25, $1D, $19, $1F, $18, $0E, $2D   ; "B***SOUND"

- D 0 - I - 0x009EBE 02:9EAE: FF        .byte $FF   ; end token



_off011_9EAF_08:
- D 0 - I - 0x009EBF 02:9EAF: 22 E5     .dbyt $22E5 ; ppu address
- D 0 - I - 0x009EC1 02:9EB1: 01        .byte $01   ; counter
- D 0 - I - 0x009EC2 02:9EB2: 2D        .byte $50   ; 

- D 0 - I - 0x009EC3 02:9EB3: 22 F5     .dbyt $22F5 ; ppu address
- D 0 - I - 0x009EC5 02:9EB5: 06        .byte $06   ; counter
- D 0 - I - 0x009EC6 02:9EB6: 1D        .byte $1D, $1E, $0B, $1C, $1E, $2D   ; "START"

- D 0 - I - 0x009ECC 02:9EBC: FF        .byte $FF   ; end token



_off011_9EBD_09:
- D 0 - I - 0x009ECD 02:9EBD: 23 05     .dbyt $2305 ; ppu address
- D 0 - I - 0x009ECF 02:9EBF: 01        .byte $01   ; counter
- D 0 - I - 0x009ED0 02:9EC0: 2D        .byte $50   ; 

- D 0 - I - 0x009ED1 02:9EC1: 23 1A     .dbyt $231A ; ppu address
- D 0 - I - 0x009ED3 02:9EC3: 01        .byte $01   ; counter
- D 0 - I - 0x009ED4 02:9EC4: 2D        .byte $2D   ; 

- D 0 - I - 0x009ED5 02:9EC5: FF        .byte $FF   ; end token



_off011_9EC6_0A:
- D 0 - I - 0x009ED6 02:9EC6: 23 25     .dbyt $2325 ; ppu address
- D 0 - I - 0x009ED8 02:9EC8: 01        .byte $01   ; counter
- D 0 - I - 0x009ED9 02:9EC9: 2D        .byte $50   ; 

- D 0 - I - 0x009EDA 02:9ECA: 23 31     .dbyt $2331 ; ppu address
- D 0 - I - 0x009EDC 02:9ECC: 0A        .byte $0A   ; counter
- D 0 - I - 0x009EDD 02:9ECD: 0B        .byte $0B, $25, $25, $25, $1D, $19, $1F, $18, $0E, $2D   ; "A***SOUND"

- D 0 - I - 0x009EE7 02:9ED7: FF        .byte $FF   ; end token



_off011_9ED8_0B:
- D 0 - I - 0x009EE8 02:9ED8: 23 45     .dbyt $2345 ; ppu address
- D 0 - I - 0x009EEA 02:9EDA: 01        .byte $01   ; counter
- D 0 - I - 0x009EEB 02:9EDB: 2D        .byte $50   ; 

- D 0 - I - 0x009EEC 02:9EDC: 23 56     .dbyt $2356 ; ppu address
- D 0 - I - 0x009EEE 02:9EDE: 05        .byte $05   ; counter
- D 0 - I - 0x009EEF 02:9EDF: 19        .byte $19, $10, $10, $00, $2D   ; "OFF"

- D 0 - I - 0x009EF4 02:9EE4: FF        .byte $FF   ; end token



_off011_9EE5_0C:
- D 0 - I - 0x009EF5 02:9EE5: 23 65     .dbyt $2365 ; ppu address
- D 0 - I - 0x009EF7 02:9EE7: 01        .byte $01   ; counter
- D 0 - I - 0x009EF8 02:9EE8: 2D        .byte $50   ; 

- D 0 - I - 0x009EF9 02:9EE9: 23 7A     .dbyt $237A ; ppu address
- D 0 - I - 0x009EFB 02:9EEB: 01        .byte $01   ; counter
- D 0 - I - 0x009EFC 02:9EEC: 2D        .byte $2D   ; 

- D 0 - I - 0x009EFD 02:9EED: FF        .byte $FF   ; end token



_off011_9EEE_0D:
- D 0 - I - 0x009EFE 02:9EEE: 23 85     .dbyt $2385 ; ppu address
- D 0 - I - 0x009F00 02:9EF0: 16        .byte $16   ; counter
- D 0 - I - 0x009F01 02:9EF1: 2A        .byte $2A, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E, $4E   ; 
- D 0 - I - 0x009F11 02:9F01: 2C        .byte $4E, $4E, $4E, $4E, $4E, $2B   ; 

- D 0 - I - 0x009F17 02:9F07: FF        .byte $FF   ; end token



sub_9F08_sound_mode:
C - - - - - 0x009F18 02:9F08: A5 59     LDA ram_play_all
C - - - - - 0x009F1A 02:9F0A: F0 03     BEQ bra_9F0F_RTS
C - - - - - 0x009F1C 02:9F0C: 20 10 9F  JSR sub_9F10
bra_9F0F_RTS:
C - - - - - 0x009F1F 02:9F0F: 60        RTS



sub_9F10:
C - - - - - 0x009F20 02:9F10: A5 5A     LDA ram_005A_sound_mode
C - - - - - 0x009F22 02:9F12: 05 5B     ORA ram_005B_sound_mode
C - - - - - 0x009F24 02:9F14: F0 07     BEQ bra_9F1D
C - - - - - 0x009F26 02:9F16: C6 5A     DEC ram_005A_sound_mode
C - - - - - 0x009F28 02:9F18: D0 02     BNE bra_9F1C_RTS
C - - - - - 0x009F2A 02:9F1A: C6 5B     DEC ram_005B_sound_mode
bra_9F1C_RTS:
C - - - - - 0x009F2C 02:9F1C: 60        RTS
bra_9F1D:
C - - - - - 0x009F2D 02:9F1D: A0 00     LDY #$00
C - - - - - 0x009F2F 02:9F1F: B1 5C     LDA (ram_005C_sound_mode_data),Y
C - - - - - 0x009F31 02:9F21: C9 FF     CMP #$FF
C - - - - - 0x009F33 02:9F23: F0 2C     BEQ bra_9F51_FF
C - - - - - 0x009F35 02:9F25: 85 09     STA ram_0009
; 1путин опт
C - - - - - 0x009F39 02:9F29: 85 5B     STA ram_005B_sound_mode
C - - - - - 0x009F3B 02:9F2B: C8        INY
C - - - - - 0x009F3C 02:9F2C: B1 5C     LDA (ram_005C_sound_mode_data),Y
C - - - - - 0x009F3E 02:9F2E: 85 5A     STA ram_005A_sound_mode
C - - - - - 0x009F40 02:9F30: C8        INY
C - - - - - 0x009F41 02:9F31: B1 5C     LDA (ram_005C_sound_mode_data),Y
C - - - - - 0x009F43 02:9F33: 85 08     STA ram_0008
; 1путин опт
C - - - - - 0x009F4A 02:9F3A: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
C - - - - - 0x009F4D 02:9F3D: A5 08     LDA ram_0008
C - - - - - 0x009F4F 02:9F3F: 20 DE FD  JSR sub_0x01FDEE_play_sound
C D 0 - - - 0x009F55 02:9F45: A5 5C     LDA ram_005C_sound_mode_data
C - - - - - 0x009F57 02:9F47: 18        CLC
C - - - - - 0x009F58 02:9F48: 69 03     ADC #$03
C - - - - - 0x009F5A 02:9F4A: 85 5C     STA ram_005C_sound_mode_data
C - - - - - 0x009F5C 02:9F4C: 90 02     BCC bra_9F50_RTS
- - - - - - 0x009F5E 02:9F4E: E6 5D     INC ram_005D_sound_mode
bra_9F50_RTS:
C - - - - - 0x009F60 02:9F50: 60        RTS
bra_9F51_FF:
sub_9F51:
C - - - - - 0x009F61 02:9F51: A9 00     LDA #$00
C - - - - - 0x009F63 02:9F53: 85 59     STA ram_play_all
C - - - - - 0x009F65 02:9F55: 85 5A     STA ram_005A_sound_mode
C - - - - - 0x009F67 02:9F57: 85 5B     STA ram_005B_sound_mode
; 1путин: del ram 005E-005F
C - - - - - 0x009F6D 02:9F5D: 60        RTS



tbl_9F62_автовоспроизведение:
; ???
- D 0 - I - 0x009F72 02:9F62: 0E        .byte $0E   ; 
- D 0 - I - 0x009F73 02:9F63: 5C        .byte $5C   ; 
- D 0 - I - 0x009F74 02:9F64: 28        .byte con_sound_28   ; 

- D 0 - I - 0x009F75 02:9F65: 0D        .byte $0D   ; 
- D 0 - I - 0x009F76 02:9F66: E4        .byte $E4   ; 
- D 0 - I - 0x009F77 02:9F67: 30        .byte con_sound_30   ; 

- D 0 - I - 0x009F78 02:9F68: 02        .byte $02   ; 
- D 0 - I - 0x009F79 02:9F69: 01        .byte $01   ; 
- D 0 - I - 0x009F7A 02:9F6A: 33        .byte con_sound_33   ; 

- D 0 - I - 0x009F7B 02:9F6B: 09        .byte $09   ; 
- D 0 - I - 0x009F7C 02:9F6C: 34        .byte $34   ; 
- D 0 - I - 0x009F7D 02:9F6D: 2B        .byte con_sound_2B   ; 

- D 0 - I - 0x009F7E 02:9F6E: 06        .byte $06   ; 
- D 0 - I - 0x009F7F 02:9F6F: DC        .byte $DC   ; 
- D 0 - I - 0x009F80 02:9F70: 31        .byte con_sound_31   ; 

- D 0 - I - 0x009F81 02:9F71: 02        .byte $02   ; 
- D 0 - I - 0x009F82 02:9F72: 01        .byte $01   ; 
- D 0 - I - 0x009F83 02:9F73: 33        .byte con_sound_33   ; 

- D 0 - I - 0x009F84 02:9F74: 0C        .byte $0C   ; 
- D 0 - I - 0x009F85 02:9F75: 40        .byte $40   ; 
- D 0 - I - 0x009F86 02:9F76: 2A        .byte con_sound_2A   ; 

- D 0 - I - 0x009F87 02:9F77: 08        .byte $08   ; 
- D 0 - I - 0x009F88 02:9F78: 08        .byte $08   ; 
- D 0 - I - 0x009F89 02:9F79: 32        .byte con_sound_32   ; 

- D 0 - I - 0x009F8A 02:9F7A: 06        .byte $06   ; 
- D 0 - I - 0x009F8B 02:9F7B: DC        .byte $DC   ; 
- D 0 - I - 0x009F8C 02:9F7C: 31        .byte con_sound_31   ; 

- D 0 - I - 0x009F8D 02:9F7D: 02        .byte $02   ; 
- D 0 - I - 0x009F8E 02:9F7E: 01        .byte $01   ; 
- D 0 - I - 0x009F8F 02:9F7F: 33        .byte con_sound_33   ; 

- D 0 - I - 0x009F90 02:9F80: 0C        .byte $0C   ; 
- D 0 - I - 0x009F91 02:9F81: B8        .byte $B8   ; 
- D 0 - I - 0x009F92 02:9F82: 29        .byte con_sound_29   ; 

- D 0 - I - 0x009F93 02:9F83: 06        .byte $06   ; 
- D 0 - I - 0x009F94 02:9F84: DC        .byte $DC   ; 
- D 0 - I - 0x009F95 02:9F85: 31        .byte con_sound_31   ; 

- D 0 - I - 0x009F96 02:9F86: 02        .byte $02   ; 
- D 0 - I - 0x009F97 02:9F87: 01        .byte $01   ; 
- D 0 - I - 0x009F98 02:9F88: 33        .byte con_sound_33   ; 

- D 0 - I - 0x009F99 02:9F89: 09        .byte $09   ; 
- D 0 - I - 0x009F9A 02:9F8A: 34        .byte $34   ; 
- D 0 - I - 0x009F9B 02:9F8B: 2C        .byte con_sound_2C   ; 

- D 0 - I - 0x009F9C 02:9F8C: 06        .byte $06   ; 
- D 0 - I - 0x009F9D 02:9F8D: DC        .byte $DC   ; 
- D 0 - I - 0x009F9E 02:9F8E: 31        .byte con_sound_31   ; 

- D 0 - I - 0x009F9F 02:9F8F: 02        .byte $02   ; 
- D 0 - I - 0x009FA0 02:9F90: 01        .byte $01   ; 
- D 0 - I - 0x009FA1 02:9F91: 33        .byte con_sound_33   ; 

- D 0 - I - 0x009FA2 02:9F92: 09        .byte $09   ; 
- D 0 - I - 0x009FA3 02:9F93: AC        .byte $AC   ; 
- D 0 - I - 0x009FA4 02:9F94: 2D        .byte con_sound_2D   ; 

- D 0 - I - 0x009FA5 02:9F95: 08        .byte $08   ; 
- D 0 - I - 0x009FA6 02:9F96: 08        .byte $08   ; 
- D 0 - I - 0x009FA7 02:9F97: 32        .byte con_sound_32   ; 

- D 0 - I - 0x009FA8 02:9F98: 0D        .byte $0D   ; 
- D 0 - I - 0x009FA9 02:9F99: E4        .byte $E4   ; 
- D 0 - I - 0x009FAA 02:9F9A: 30        .byte con_sound_30   ; 

- D 0 - I - 0x009FAB 02:9F9B: 02        .byte $02   ; 
- D 0 - I - 0x009FAC 02:9F9C: 01        .byte $01   ; 
- D 0 - I - 0x009FAD 02:9F9D: 33        .byte con_sound_33   ; 

- D 0 - I - 0x009FAE 02:9F9E: 0C        .byte $0C   ; 
- D 0 - I - 0x009FAF 02:9F9F: B8        .byte $B8   ; 
- D 0 - I - 0x009FB0 02:9FA0: 2E        .byte con_sound_2E   ; 

- D 0 - I - 0x009FB1 02:9FA1: 06        .byte $06   ; 
- D 0 - I - 0x009FB2 02:9FA2: DC        .byte $DC   ; 
- D 0 - I - 0x009FB3 02:9FA3: 31        .byte con_sound_31   ; 

- D 0 - I - 0x009FB4 02:9FA4: 02        .byte $02   ; 
- D 0 - I - 0x009FB5 02:9FA5: 01        .byte $01   ; 
- D 0 - I - 0x009FB6 02:9FA6: 33        .byte con_sound_33   ; 

- D 0 - I - 0x009FB7 02:9FA7: 0F        .byte $0F   ; 
- D 0 - I - 0x009FB8 02:9FA8: 10        .byte $10   ; 
- D 0 - I - 0x009FB9 02:9FA9: 2F        .byte con_sound_2F   ; 

- D 0 - I - 0x009FBA 02:9FAA: 0D        .byte $0D   ; 
- D 0 - I - 0x009FBB 02:9FAB: E4        .byte $E4   ; 
- D 0 - I - 0x009FBC 02:9FAC: 30        .byte con_sound_30   ; 

- D 0 - I - 0x009FBD 02:9FAD: 02        .byte $02   ; 
- D 0 - I - 0x009FBE 02:9FAE: 68        .byte $68   ; 
- D 0 - I - 0x009FBF 02:9FAF: 34        .byte con_sound_34   ; 

- D 0 - I - 0x009FC0 02:9FB0: 0C        .byte $0C   ; 
- D 0 - I - 0x009FC1 02:9FB1: 62        .byte $62   ; 
- D 0 - I - 0x009FC2 02:9FB2: 36        .byte con_sound_36   ; 

- D 0 - I - 0x009FC3 02:9FB3: 01        .byte $01   ; 
- D 0 - I - 0x009FC4 02:9FB4: F0        .byte $F0   ; 
- D 0 - I - 0x009FC5 02:9FB5: 35        .byte con_sound_35   ; 

- D 0 - I - 0x009FC6 02:9FB6: FF        .byte $FF   ; end token



tbl_9FB7:
- - - - - - 0x009FC7 02:9FB7: FF        .byte $FF   ; 







.out .sprintf("Free bytes in bank 24: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_24b"
    .byte con_prg_bank + $25   ; 
