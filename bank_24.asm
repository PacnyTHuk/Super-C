.segment "BANK_24"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x010010-0x01800F



.export sub_0x010050_работа_с_экранами



; bzk this byte must be placed at 8000
    .byte con_prg_bank + $24   ; 






sub_0x010050_работа_с_экранами:
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
C - - - - - 0x01E3EA 07:E3DA: A9 09     LDA #$11
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
bra_E446_RTS:
                                        RTS

bra_E447_минус_x:
                                        DEX
                                        BNE bra_E440_минус_x

; X=04 выбор режима игры
C - - - - - 0x01E41B 07:E40B: 20 DF FE  JSR sub_A29C_чит_коды
C - - - - - 0x01E426 07:E416: A6 22     LDX ram_номер_опции_колво_игроков
C - - - - - 0x01E428 07:E418: A9 A7     LDY #$50 ; X координата стрелки
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
                                        BNE bra_E43F
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
C - - - - - 0x01E4DF 07:E4CF: 8D 00 05  STA ram_кадр_анимации
C - - - - - 0x01E4E2 07:E4D2: E6 19     INC ram_номер_действия_на_заставке
C - - - - - 0x01E4E6 07:E4D6: 85 50     STA ram_номер_уровня
; 1путин опт
C - - - - - 0x01E4EA 07:E4DA: 60        RTS
bra_E4DB_соунд_тест:
C - - - - - 0x01E4EB 07:E4DB: 20 D7 FE  JSR sub_0x01FEE7_bankswitch_sound_mode_handler
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
                                        LDA #con_pal_13_options
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
                                        LDY ram_options_сложность
                                        LDA tbl_9925_варианты_difficulty,Y
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_9925_варианты_difficulty:
                                        .byte con_0x0017EA_normal   ; 00 
                                        .byte con_0x0017EA_hard   ; 01 
                                        .byte con_0x0017EA_expert   ; 02 

sub_9926_отрисовать_graphics:
                                        LDY ram_options_регион
                                        LDA tbl_9927_варианты_graphics,Y
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_9927_варианты_graphics:
                                        .byte con_0x0017EA_human   ; 00 
                                        .byte con_0x0017EA_robot   ; 01 

sub_9928_отрисовать_obj_limit:
                                        LDY ram_options_колво_объектов
                                        LDA tbl_9929_варианты_obj_limit,Y
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS
                                        
tbl_9929_варианты_obj_limit:
                                        .byte con_0x0017EA_obj_limit_14   ; 00 
                                        .byte con_0x0017EA_obj_limit_32   ; 01 

sub_992A_отрисовать_continue:
                                        LDA #con_0x0017EA_continue
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_options_конты
                                        CLC
                                        ADC #$81
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_992C_отрисовать_level:
                                        LDA #con_0x0017EA_level
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_options_уровень
                                        CLC
                                        ADC #$82
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_992E_отрисовать_rest:
                                        LDA #con_0x0017EA_rest
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_options_жизни
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
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_номер_опции_колво_игроков
                                        CMP #con_options_obj_limit
                                        BNE bra_9B06_RTS
                                        LDX ram_options_колво_объектов
                                        LDA tbl_0x01FB75_индексы,X
                                        STA ram_макс_индекс_пули_игрока
                                        LDA tbl_0x01FB75_индексы + $02,X
                                        STA ram_макс_индекс_враги
                                        LDA tbl_0x01FB75_индексы + $04,X
                                        STA ram_макс_индекс_пули_общие                              
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
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
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
                                        LDA #$10
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













sub_9B34_анимации_орла:

                                        LDX #$01
bra_9B35_loop:
                                        JSR sub_9B36_обработка_орла
                                        DEX
                                        BPL bra_9B35_loop
                                        RTS


sub_9B36_обработка_орла:
                                        LDY ram_options_номер_анимации_орла,X
                                        LDA tbl_9B37_lo,Y
                                        STA ram_0000
                                        LDA tbl_9B37_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_9B37_lo:
                                        .byte < ofs_9B40_00
                                        .byte < ofs_9B50_01
                                        .byte < ofs_9B60_02
                                        .byte < ofs_9B70_03
                                        .byte < ofs_9B80_04

tbl_9B37_hi:
                                        .byte > ofs_9B40_00
                                        .byte > ofs_9B50_01
                                        .byte > ofs_9B60_02
                                        .byte > ofs_9B70_03
                                        .byte > ofs_9B80_04


ofs_9B40_00:
                                        JSR sub_9B90_подготовка
bra_9B41:
                                        INC ram_options_номер_анимации_орла,X
                                        RTS


ofs_9B50_01:
                                        DEC ram_options_таймер_анимации_орла,X
                                        BNE bra_9B51_RTS
                                        LDA #$08
                                        STA ram_options_таймер_анимации_орла,X
                                        INC ram_options_номер_для_кадра_орла,X
                                        LDY ram_options_номер_для_кадра_орла,X
                                        CPY #$02
                                        BCS bra_9B41
                                        LDA tbl_9B52_кадры,Y
                                        STA ram_кадр_анимации + $01,X
bra_9B51_RTS:
                                        RTS


tbl_9B52_кадры:                 
                                        .byte $C2   ; 00
                                        .byte $C3   ; 01


ofs_9B60_02:
                                        STX ram_0000
                                        LDA ram_счетчик_кадров_1
                                        LSR
                                        LSR
                                        AND #$01
                                        EOR ram_0000
                                        LSR
                                        LDA #$C3
                                        BCC bra_9B61
                                        LDA #$C5
bra_9B61:
                                        STA ram_кадр_анимации + $01,X
                                        LDA ram_счетчик_кадров_1
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
                                        LDY ram_options_счетчик_анимации_орла,X
                                        LDA (ram_0000),Y
                                        CMP #$80
                                        BEQ bra_9B63
                                        CLC
                                        ADC ram_позиция_y_спрайта + $01,X
                                        STA ram_позиция_y_спрайта + $01,X
                                        LDA (ram_0002),Y
                                        CLC
                                        ADC ram_позиция_x_спрайта + $01,X
                                        STA ram_позиция_x_спрайта + $01,X
                                        INC ram_options_счетчик_анимации_орла,X
bra_9B62_RTS:
                                        RTS
                                       
bra_9B63:
                                        LDA #$01
                                        STA ram_options_таймер_анимации_орла,X
                                        LDA #$FF
                                        STA ram_options_номер_для_кадра_орла,X
bra_9B64:
                                        INC ram_options_номер_анимации_орла,X
                                        RTS


ofs_9B70_03:
                                        DEC ram_options_таймер_анимации_орла,X
                                        BNE bra_9B71_RTS
                                        LDA #$08
                                        STA ram_options_таймер_анимации_орла,X
                                        INC ram_options_номер_для_кадра_орла,X
                                        LDY ram_options_номер_для_кадра_орла,X
                                        CPY #$05
                                        BCS bra_9B72
                                        LDA tbl_9B53_кадры_2,Y
                                        STA ram_кадр_анимации + $01,X
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
                                        STA ram_options_таймер_анимации_орла,X
                                        BNE bra_9B64
ofs_9B80_04:
                                        DEC ram_options_таймер_анимации_орла,X
                                        BNE bra_9B71_RTS
                                        JSR sub_9B90_подготовка
                                        LDA #$01
                                        STA ram_options_номер_анимации_орла,X
                                        RTS
                                        
tbl_9B81_таймеры_анимации:
                                        .byte $90   ; 00
                                        .byte $A6   ; 01


sub_9B90_подготовка:
                                        LDA #$00                                        
                                        STA ram_кадр_анимации + $01,X
                                        STA ram_атрибуты_спрайта + $01,X
                                        STA ram_options_счетчик_анимации_орла,X
                                        LDA #$C2 ; первичная Y спрайтов
                                        STA ram_позиция_y_спрайта + $01,X
                                        LDA tbl_9B91_x_позиция,X ; первичная X спрайтов
                                        STA ram_позиция_x_спрайта + $01,X
                                        LDA #$40
                                        STA ram_options_таймер_анимации_орла,X
                                        LDA #$FF
                                        STA ram_options_номер_для_кадра_орла,X
                                        RTS

tbl_9B91_x_позиция:
                                        .byte $70   ; 00 x спрайта
                                        .byte $88   ; 01 x спрайта


tbl_9B95_Y_спрайта_lo:
                                        .byte < ofs_9BA0_00_Y_спрайта_left
                                        .byte < ofs_9BC0_01_Y_спрайта_right


tbl_9B95_Y_спрайта_hi:
                                        .byte > ofs_9BA0_00_Y_спрайта_left
                                        .byte > ofs_9BC0_01_Y_спрайта_right


tbl_9B96_X_спрайта_lo:
                                        .byte < ofs_9BA0_00_X_спрайта_left
                                        .byte < ofs_9BC0_01_X_спрайта_right


tbl_9B96_X_спрайта_hi:
                                        .byte > ofs_9BA0_00_X_спрайта_left
                                        .byte > ofs_9BC0_01_X_спрайта_right


ofs_9BA0_00_Y_спрайта_left:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $02, $01, $01, $01, $01, $00, $00, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; 00
                                        .byte $FF, $FF, $FF, $FE, $FE, $00, $FE, $FE, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF ; 10
                                        .byte $FE, $FF, $FF, $FF, $FE, $FE, $FE, $FF, $FF, $01, $02, $02, $01, $02, $02, $FF ; 20
                                        .byte $FF, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FF, $00, $00, $00, $00, $01, $01 ; 30
                                        .byte $01, $01, $01, $01, $02, $01 ; 40
                                        .byte $80  ;   end token


ofs_9BA0_00_X_спрайта_left:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $FE, $FE, $FE, $FF, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; 00
                                        .byte $FE, $FE, $FF, $FF, $FF, $FE, $FE, $FF, $00, $02, $02, $02, $02, $02, $02, $02 ; 10
                                        .byte $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02 ; 20
                                        .byte $02, $01, $00, $01, $00, $01, $00, $FF, $00, $FF, $02, $02, $02, $02, $02, $02 ; 30
                                        .byte $02, $02, $02, $01, $00, $01 ; 40


ofs_9BC0_01_Y_спрайта_right:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $02, $01, $01, $01, $01, $00, $00, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; 00
                                        .byte $FF, $FF, $FF, $FE, $FE, $00, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF ; 10
                                        .byte $FE, $FF, $FF, $FF, $FE, $FE, $FE, $FF, $FF, $01, $02, $02, $01, $02, $02, $FF ; 20
                                        .byte $FF, $FE, $FE, $FE, $FE, $00, $FF, $00, $01, $00, $00 ; 30
                                        .byte $80  ;   end token

ofs_9BC0_01_X_спрайта_right:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $02, $02, $02, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02 ; 00
                                        .byte $02, $02, $01, $01, $01, $02, $02, $01, $00, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; 10
                                        .byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; 20
                                        .byte $FE, $FE, $FF, $FF, $00, $02, $02, $02, $01, $01, $02 ; 30














sub_E4BC_переключение_банков_анимация_contra:
                                        LDA ram_счетчик_кадров_1
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
                                        LDA ram_счетчик_кадров_1
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
                                        LDA ram_счетчик_кадров_1
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
C - - - - - 0x01E46F 07:E45F: 8D 1A 05  STA ram_позиция_y_спрайта
C - - - - - 0x01E472 07:E462: 8C 34 05  STY ram_позиция_x_спрайта
C - - - - - 0x01E475 07:E465: A9 B9     LDA #$B9
C - - - - - 0x01E477 07:E467: 8D 00 05  STA ram_кадр_анимации
C - - - - - 0x01E47A 07:E46A: A9 01     LDA #$01
C - - - - - 0x01E47C 07:E46C: 8D 4E 05  STA ram_атрибуты_спрайта
C - - - - - 0x01E47F 07:E46F: 60        RTS



tbl_E470_y_координаты_стрелки:
- D 3 - - - 0x01E480 07:E470: 20        .byte $8F   ; 00 1 Player
- D 3 - - - 0x01E481 07:E471: 80        .byte $9F   ; 01 2 Players
                                        .byte $AF   ; 02 Options

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
C - - - - - 0x002339 00:A329: 85 85     STA ram_0085
C - - - - - 0x00233B 00:A32B: 85 86     STA ram_0085 + $01
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


sub_E55C_подготовка_ботов_к_игре:
C - - - - - 0x01E56C 07:E55C: 20 D0 E5  JSR sub_0x01E5E0_очистка_оперативки
C - - - - - 0x01E56F 07:E55F: A9 01     LDA #$01
C - - - - - 0x01E571 07:E561: 85 1F     STA ram_001F_flag
C - - - - - 0x01E573 07:E563: 85 20     STA ram_колво_игроков
C - - - - - 0x01E575 07:E565: A9 01     LDA #$01
C - - - - - 0x01E577 07:E567: 85 A0     STA ram_статус_игрока
C - - - - - 0x01E579 07:E569: 85 A1     STA ram_статус_игрока + $01
C - - - - - 0x01E57B 07:E56B: A9 00     LDA #$00
C - - - - - 0x01E57D 07:E56D: 85 CA     STA ram_plr_game_over
C - - - - - 0x01E57F 07:E56F: 85 CB     STA ram_plr_game_over + $01
C - - - - - 0x01E581 07:E571: 85 1B     STA ram_счетчик_кадров_1
C - - - - - 0x01E583 07:E573: 85 5B     STA ram_счетчик_кадров_2
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
C - - - - - 0x01E540 07:E530: A9 08     LDA #$10
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











.out .sprintf("Free bytes in bank 24: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_24b"
    .byte con_prg_bank + $25   ; 
