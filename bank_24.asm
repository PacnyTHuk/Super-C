.segment "BANK_24"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x008010-0x00C00F



.export loc_0x008010_работа_с_экранами



; bzk this byte must be placed at 8000
    .byte con_prg_bank + $24   ; 



loc_0x008010_работа_с_экранами:
                                        LDY ram_демка
                                        LDA tbl_8001_lo,Y
                                        STA ram_0000
                                        LDA tbl_8002_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_8001_lo:
                                        .byte < ofs_00_8010_00_главный_экран
                                        .byte < ofs_00_8100_01_демка_ботов
                                        .byte < ofs_00_8110_02_подготовка_данных_для_старта_игроков
                                        .byte < ofs_00_8120_03_подготовка_экрана_для_старта_игроков
                                        .byte < ofs_00_8130_04_игра   ; never used 0x01E3CF
                                        .byte < ofs_00_8140_05_соунд_тест
                                        .byte < ofs_00_8150_06_options
tbl_8002_hi:
                                        .byte > ofs_00_8010_00_главный_экран
                                        .byte > ofs_00_8100_01_демка_ботов
                                        .byte > ofs_00_8110_02_подготовка_данных_для_старта_игроков
                                        .byte > ofs_00_8120_03_подготовка_экрана_для_старта_игроков
                                        .byte > ofs_00_8130_04_игра   ; never used 0x01E3CF
                                        .byte > ofs_00_8140_05_соунд_тест
                                        .byte > ofs_00_8150_06_options

ofs_00_8010_00_главный_экран:
                                        LDY ram_номер_действия_на_заставке
                                        LDA tbl_8011_lo,Y
                                        STA ram_0000
                                        LDA tbl_8012_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_8011_lo:
                                        .byte < ofs_01_8020_00_подготовка
                                        .byte < ofs_01_8030_01_слияние_логотипа
                                        .byte < ofs_01_8040_02_press_start
                                        .byte < ofs_01_8050_03_мигание_press_start
                                        .byte < ofs_01_8060_04_выбор_режима_игры
                                        .byte < ofs_01_8070_05_мигание_надписей
                                        .byte < ofs_01_8080_06_options
tbl_8012_hi:
                                        .byte > ofs_01_8020_00_подготовка
                                        .byte > ofs_01_8030_01_слияние_логотипа
                                        .byte > ofs_01_8040_02_press_start
                                        .byte > ofs_01_8050_03_мигание_press_start
                                        .byte > ofs_01_8060_04_выбор_режима_игры
                                        .byte > ofs_01_8070_05_мигание_надписей
                                        .byte > ofs_01_8080_06_options


ofs_01_8020_00_подготовка:
                                        JSR sub_E50B_подготовка_главного_экрана
                                        LDA #$11    ; палитра логотипа слияние
                                        JSR sub_0x01FE80_bankswitch_загрузка_палитры_в_03E0x
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
                                        INC ram_номер_действия_на_заставке
                                        RTS

ofs_01_8030_01_слияние_логотипа:
                                        JSR sub_E4D0_переключение_банков_анимация_super
                                        JSR sub_A30F_обработчик_главного_экрана
                                        BCS bra_8031
; заставка еще идет
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_SS
                                        BEQ bra_8032_RTS
loc_8031_подготовка_начального_экрана:
; нажата кнопка ss/скип заставки
                                        JSR sub_E50B_подготовка_главного_экрана
                                        LDY #$04
                                        JSR sub_A36D_смена_атрибута_фона
bra_8031:
                                        JSR sub_0x01E5E0_очистка_оперативки
                                        JSR sub_E52A_палитра_и_надпись_press_start
                                        LDA #con_chr_bank + $84
                                        STA ram_bg_bank_2
                                        JSR sub_E502_подготовка_счетчиков
                                        LDA #$00
                                        STA ram_демка
                                        LDA #$02
                                        STA ram_номер_действия_на_заставке
bra_8032_RTS:
                                        RTS

ofs_01_8040_02_press_start:
                                        JSR sub_E4D0_переключение_банков_анимация_super
                                        JSR sub_E4BC_переключение_банков_анимация_contra
                                        LDA ram_таймер_до_демки_lo
                                        AND #$10
                                        ASL
                                        ASL
                                        ASL
                                        CLC
                                        ADC #con_0x0017EA_press_start
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        JSR sub_E4F1_проверка_на_демку
                                        BNE bra_8042_нет_демки
                                        JMP loc_0x01E4F5_плюс1_демка
bra_8042_нет_демки:
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btn_Start
                                        BEQ bra_8043_RTS
; нажата start
                                        LDA #$47
                                        STA ram_таймер_до_демки_lo
                                        INC ram_номер_действия_на_заставке
                                        LDA #con_sound_1A
                                        JMP loc_0x01FDEE_play_sound_напрямую
bra_8043_RTS:
                                        RTS

ofs_01_8050_03_мигание_press_start:
                                        JSR sub_E4D0_переключение_банков_анимация_super
                                        JSR sub_E4BC_переключение_банков_анимация_contra
                                        LDA ram_таймер_до_демки_lo
                                        AND #$04
                                        ASL
                                        ASL
                                        ASL
                                        ASL
                                        ASL
                                        CLC
                                        ADC #con_0x0017EA_press_start
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        DEC ram_таймер_до_демки_lo
                                        BNE bra_8051_RTS
                                        INC ram_номер_действия_на_заставке
                                        JSR sub_E502_подготовка_счетчиков
                                        LDA #con_0x0017EA_press_start + $80 ; удалить надпись
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        JSR sub_E538_надписи_p1_p2_options
                                        LDY #$52 ; X координата стрелки
                                        LDX ram_номер_опции_колво_игроков
                                        LDA tbl_8052_y_координаты_стрелки,X
                                        JSR sub_E45F_запись_данных_для_стрелки
bra_8051_RTS:
                                        RTS

tbl_8052_y_координаты_стрелки:
                                        .byte $8B   ; 00 1 Player
                                        .byte $9B   ; 01 2 Players
                                        .byte $AB   ; 02 Options

ofs_01_8060_04_выбор_режима_игры:
                                        JSR sub_E4D0_переключение_банков_анимация_super
                                        JSR sub_E4BC_переключение_банков_анимация_contra
                                        JSR sub_A29C_чит_коды
                                        LDX ram_номер_опции_колво_игроков
                                        LDY #$52 ; X координата стрелки
                                        LDA tbl_8052_y_координаты_стрелки,X
                                        JSR sub_E45F_запись_данных_для_стрелки
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_UD
                                        BEQ bra_8062
                                        AND #con_btn_Up
                                        BNE bra_8061_up
; down
                                        INC ram_номер_опции_колво_игроков
                                        LDA ram_номер_опции_колво_игроков
                                        CMP #$03
                                        BCC bra_8062
                                        DEC ram_номер_опции_колво_игроков
                                        BNE bra_8062
bra_8061_up:
                                        DEC ram_номер_опции_колво_игроков
                                        BPL bra_8062
                                        INC ram_номер_опции_колво_игроков
bra_8062:
                                        JSR sub_E502_подготовка_счетчиков
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btn_Start
                                        BEQ bra_8066_RTS
; нажата start
; проверка чита для sound test
                                        LDA ram_копия_удержанная_кнопка
                                        AND #con_btns_AB
                                        CMP #con_btns_AB
                                        BNE bra_8063
; соунд тест
                                        LDA #$05
                                        JMP loc_0x01E4FC_запись_в_демку   
bra_8063:
                                        LDA ram_номер_опции_колво_игроков
                                        CMP #$02
                                        BNE bra_8064
                                        LDA #$40
                                        BNE bra_8065    ; jmp
bra_8064:
                                        LDA #$80
bra_8065:
                                        STA ram_таймер_до_демки_lo
                                        INC ram_номер_действия_на_заставке
bra_8066_RTS:
                                        RTS

ofs_01_8070_05_мигание_надписей:
                                        JSR sub_E4D0_переключение_банков_анимация_super
                                        JSR sub_E4BC_переключение_банков_анимация_contra
                                        LDA ram_таймер_до_демки_lo
                                        AND #$08
                                        ASL
                                        ASL
                                        ASL
                                        ASL
                                        CLC
                                        ADC ram_номер_опции_колво_игроков
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        DEC ram_таймер_до_демки_lo
                                        BNE bra_8072_RTS
                                        LDA ram_номер_опции_колво_игроков
                                        CMP #con_0x0017EA_options
                                        BEQ bra_8071_options
                                        LDA #$02
                                        JMP loc_0x01E4FC_запись_в_демку
bra_8071_options:
                                        INC ram_номер_действия_на_заставке
                                        LDA #$01
                                        STA ram_счетчик_затемнения_экрана
bra_8072_RTS:
                                        RTS

ofs_01_8080_06_options:
                                        JSR sub_0x01FAAF_затемнение_экрана
                                        PHP
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
                                        PLP
                                        BCC bra_8081_RTS
                                        JSR sub_0x01E5E0_очистка_оперативки
                                        LDA #$06
                                        STA ram_демка
                                        LDA #$00
                                        STA ram_номер_действия_на_заставке
                                        STA ram_номер_опции_колво_игроков
bra_8081_RTS:
                                        RTS



ofs_00_8100_01_демка_ботов:
                                        LDX ram_номер_действия_на_заставке
                                        BNE bra_8101
                                        JSR sub_E55C_подготовка_ботов_к_игре
                                        INC ram_номер_действия_на_заставке
                                        RTS
bra_8101:
                                        LDA ram_нажатая_кнопка
                                        AND #con_btns_SS
                                        BEQ bra_8102_боты_играют
; скип просмотра демки
                                        JSR sub_0x01E4A6_выбрать_следующий_уровень_для_демки
                                        JMP loc_8031_подготовка_начального_экрана
bra_8102_боты_играют:
                                        JSR sub_9D94_игра_ботов_в_демке
                                        BCS bra_8103_закончить_демку
                                        JMP loc_0x01E7F9_игра
bra_8103_закончить_демку:
                                        JSR sub_0x01E4A6_выбрать_следующий_уровень_для_демки
                                        JMP loc_0x01E4A2


ofs_00_8110_02_подготовка_данных_для_старта_игроков:
                                        LDA #$00
                                        STA ram_флаг_игры_ботов_в_демке
                                        LDX ram_номер_действия_на_заставке
                                        BNE bra_8111
                                        INC ram_номер_действия_на_заставке
                                        RTS
bra_8111:
                                        JSR sub_0x01E5E0_очистка_оперативки
                                        JSR sub_0x01E592_подготовка_игроков_к_началу
                                        JMP loc_0x01E4F5_плюс1_демка


ofs_00_8120_03_подготовка_экрана_для_старта_игроков:
                                        LDA #$00
                                        STA ram_номер_экрана
                                        JMP loc_0x01E4F5_плюс1_демка


ofs_00_8130_04_игра:
                                        JMP loc_0x01E7F9_игра


ofs_00_8140_05_соунд_тест:
                                        JSR sub_E4D0_переключение_банков_анимация_super
                                        JSR sub_E4BC_переключение_банков_анимация_contra
                                        LDX ram_номер_действия_на_заставке
                                        BNE bra_8141_соунд_тест
                                        LDA #$00
                                        STA ram_кадр_анимации + $02
                                        INC ram_номер_действия_на_заставке
                                        STA ram_номер_уровня
                                        RTS
bra_8141_соунд_тест:
                                        JSR sub_9AE9_sound_mode_handler
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btn_Start
                                        BNE bra_8142_выход_из_соунд_теста
                                        RTS
bra_8142_выход_из_соунд_теста:
                                        JSR sub_0x01E4A6_выбрать_следующий_уровень_для_демки
                                        LDA #$00
                                        JMP loc_0x01E4FC_запись_в_демку    ; jmp


ofs_00_8150_06_options:
                                        LDY ram_номер_действия_на_заставке
                                        LDA tbl_8151_lo,Y
                                        STA ram_0000
                                        LDA tbl_8152_hi,Y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_8151_lo:
                                        .byte < ofs_02_8200_00_подготовка_экрана_options
                                        .byte < ofs_02_8220_01_выбор_опций
                                        .byte < ofs_02_8230_02_мерцание_exit
                                        .byte < ofs_02_8240_03_выход_из_экрана_options
tbl_8152_hi:
                                        .byte > ofs_02_8200_00_подготовка_экрана_options
                                        .byte > ofs_02_8220_01_выбор_опций
                                        .byte > ofs_02_8230_02_мерцание_exit
                                        .byte > ofs_02_8240_03_выход_из_экрана_options



ofs_02_8200_00_подготовка_экрана_options:
                                        LDA #con_chr_bank + $B4
                                        STA ram_bg_bank_1
                                        LDA #con_chr_bank + $40
                                        STA ram_bg_bank_2
                                        LDX #$04    ; options
                                        LDA ram_флаг_читов
                                        BPL bra_8201
                                        INX
                                        INX
bra_8201:
                                        JSR sub_0x01FE94_bankswitch_отрисовка_экранов
                                        LDA #$13    ; палитра экрана с опциями
                                        JSR sub_0x01FE80_bankswitch_загрузка_палитры_в_03E0x
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
                                        LDA ram_флаг_читов
                                        BMI bra_8202
                                        JSR sub_8204_отрисовать_difficulty
                                        JSR sub_8206_отрисовать_graphics
                                        JSR sub_8208_отрисовать_obj_limit
                                        JSR sub_820A_отрисовать_music
                                        JSR sub_820C_отрисовать_sound
                                        JMP loc_8203
bra_8202:
                                        JSR sub_820E_отрисовать_infinite_ammo
                                        JSR sub_8210_отрисовать_continue
                                        JSR sub_8211_отрисовать_level
                                        JSR sub_8212_отрисовать_rest
loc_8203:
                                        JSR sub_8213_отрисовать_exit
                                        INC ram_номер_действия_на_заставке
                                        RTS



sub_8204_отрисовать_difficulty:
                                        LDY ram_option_сложность
                                        LDA tbl_8205_варианты_difficulty,Y
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_8205_варианты_difficulty:
                                        .byte con_0x0017EA_normal   ; 00 
                                        .byte con_0x0017EA_hard     ; 01 
                                        .byte con_0x0017EA_expert   ; 02 

sub_8206_отрисовать_graphics:
                                        LDY ram_option_регион
                                        LDA tbl_8207_варианты_graphics,Y
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_8207_варианты_graphics:
                                        .byte con_0x0017EA_human   ; 00 
                                        .byte con_0x0017EA_robot   ; 01 

sub_8208_отрисовать_obj_limit:
                                        LDY ram_option_колво_объектов
                                        LDA tbl_8209_варианты_obj_limit,Y
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS
                                        
tbl_8209_варианты_obj_limit:
                                        .byte con_0x0017EA_obj_limit_14   ; 00 
                                        .byte con_0x0017EA_obj_limit_32   ; 01 
                                        
                                        
sub_820A_отрисовать_music:
                                        LDX ram_option_music
                                        LDA tbl_820B_варианты_music,X
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_820B_варианты_music:
                                        .byte con_0x0017EA_music_on    ; 00 
                                        .byte con_0x0017EA_music_off   ; 01 


sub_820C_отрисовать_sound:
                                        LDX ram_option_sound
                                        LDA tbl_820D_варианты_sound,X
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_820D_варианты_sound:
                                        .byte con_0x0017EA_sound_on    ; 00 
                                        .byte con_0x0017EA_sound_off   ; 01 


sub_820E_отрисовать_infinite_ammo:
                                        LDX ram_option_бесконечные_патроны
                                        LDA tbl_820F_варианты_infinite_ammo,X
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS

tbl_820F_варианты_infinite_ammo:
                                       .byte con_0x0017EA_infinite_ammo_off  ; 00
                                       .byte con_0x0017EA_infinite_ammo_on   ; 01


sub_8210_отрисовать_continue:
                                        LDA #con_0x0017EA_continue
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_option_конты
                                        CLC
                                        ADC #$81
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_8211_отрисовать_level:
                                        LDA #con_0x0017EA_level
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_option_уровень
                                        CLC
                                        ADC #$82
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_8212_отрисовать_rest:
                                        LDA #con_0x0017EA_rest
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDA ram_option_жизни
                                        CLC
                                        ADC #$81
                                        STA ram_nmt_buffer - $02,X
                                        RTS

sub_8213_отрисовать_exit:
                                        LDA #con_0x0017EA_exit
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS


ofs_02_8220_01_выбор_опций:
                                        JSR sub_9B30_смена_палитры_сокола
                                        JSR sub_9B34_анимации_орла

                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_UD
                                        BEQ bra_8223
                                        AND #con_btn_Up
                                        BNE bra_8222_up
; down
                                        INC ram_номер_опции_колво_игроков
                                        LDX #$04
                                        LDA ram_флаг_читов
                                        BMI bra_8221
                                        INX
bra_8221:
                                        CPX ram_номер_опции_колво_игроков
                                        BCS bra_8223
                                        DEC ram_номер_опции_колво_игроков
                                        BNE bra_8223

bra_8222_up:
                                        DEC ram_номер_опции_колво_игроков
                                        BPL bra_8223
                                        INC ram_номер_опции_колво_игроков

bra_8223:
                                        LDX ram_номер_опции_колво_игроков
                                        LDA ram_флаг_читов
                                        BMI bra_8224
                                        
                                        LDY tbl_9B2A_x_координаты_стрелки,X ; X координата стрелки
                                        LDA tbl_9B29_y_координаты_стрелки,X ; Y координата стрелки
                                        BNE bra_8225 ; jmp
bra_8224:
                                        LDY tbl_9B2C_x_координаты_стрелки,X ; X координата стрелки
                                        LDA tbl_9B2B_y_координаты_стрелки,X ; Y координата стрелки
bra_8225:
                                        JSR sub_E45F_запись_данных_для_стрелки
                                        LDA ram_флаг_читов
                                        BMI bra_8226
                                        LDA tbl_8227_опции_lo,X
                                        STA ram_0000
                                        LDA tbl_8228_опции_hi,X
                                        STA ram_0001
                                        JMP (ram_0000)
bra_8226:
                                        LDA tbl_8229_секретные_опции_lo,X
                                        STA ram_0000
                                        LDA tbl_822A_секретные_опции_hi,X
                                        STA ram_0001
                                        JMP (ram_0000)

tbl_8227_опции_lo:
                                        .byte < ofs_03_99B3_options_difficulty
                                        .byte < ofs_03_99B3_options_graphics
                                        .byte < ofs_03_99B3_options_obj_limit
                                        .byte < ofs_03_99B3_options_music
                                        .byte < ofs_03_99B3_options_sound
                                        .byte < ofs_03_9B10_options_exit
tbl_8228_опции_hi:
                                        .byte > ofs_03_99B3_options_difficulty
                                        .byte > ofs_03_99B3_options_graphics
                                        .byte > ofs_03_99B3_options_obj_limit
                                        .byte > ofs_03_99B3_options_music
                                        .byte > ofs_03_99B3_options_sound
                                        .byte > ofs_03_9B10_options_exit

tbl_8229_секретные_опции_lo:
                                        .byte < ofs_03_9B09_secret_options_ammo
                                        .byte < ofs_03_9B09_secret_options_continue
                                        .byte < ofs_03_9B09_secret_options_level
                                        .byte < ofs_03_9B09_secret_options_rest
                                        .byte < ofs_03_9B10_options_exit
tbl_822A_секретные_опции_hi:
                                        .byte > ofs_03_9B09_secret_options_ammo
                                        .byte > ofs_03_9B09_secret_options_continue
                                        .byte > ofs_03_9B09_secret_options_level
                                        .byte > ofs_03_9B09_secret_options_rest
                                        .byte > ofs_03_9B10_options_exit


; X00-02
ofs_03_99B3_options_difficulty:
ofs_03_99B3_options_graphics:
ofs_03_99B3_options_obj_limit:
ofs_03_99B3_options_music:
ofs_03_99B3_options_sound:
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
                                        CMP #$02
; obj limit
                                        BNE bra_9B05
                                        LDX ram_option_колво_объектов
                                        LDA tbl_0x01FB75_индексы,X
                                        STA ram_макс_индекс_пули_игрока
                                        LDA tbl_0x01FB75_индексы + $02,X
                                        STA ram_макс_индекс_враги
                                        RTS
bra_9B05:
                                        CMP #$01
                                        BNE bra_9B08
; graphics
                                        LDA ram_option_регион
                                        BEQ bra_9B07_US
                                        LDA #$40    ; EU
bra_9B07_US:
                                        STA ram_регион
                                        RTS
bra_9B08:                                
                                        CMP #$03
                                        BNE bra_9B09
; music
                                        LDX ram_option_music
                                        LDA ram_флаг_музыки_звука
                                        AND #$80
                                        ORA tbl_9B09_music,X
                                        STA ram_флаг_музыки_звука
                                        RTS
bra_9B09:  
                                        CMP #$04
                                        BNE bra_9B06_RTS
; sound
                                        LDX ram_option_sound
                                        LDA ram_флаг_музыки_звука
                                        AND #$40
                                        ORA tbl_9B0A_sound,X
                                        STA ram_флаг_музыки_звука
bra_9B06_RTS:
                                        RTS

tbl_9B07_лимит_опций:
                                        .byte $03   ; 00 difficulty
                                        .byte $02   ; 01 graphics
                                        .byte $02   ; 02 obj_limit
                                        .byte $02   ; 03 music
                                        .byte $02   ; 04 sound
                                        
tbl_9B08_начальная_con:
                                        .byte con_0x0017EA_normal         ; 00 difficulty
                                        .byte con_0x0017EA_human          ; 01 graphics
                                        .byte con_0x0017EA_obj_limit_14   ; 02 obj_limit
                                        .byte con_0x0017EA_music_on       ; 03 music
                                        .byte con_0x0017EA_sound_on       ; 04 sound


tbl_9B09_music:
                                        .byte $00   ; 00 music
                                        .byte $40   ; 01 music
tbl_9B0A_sound:
                                        .byte $00   ; 00 sound
                                        .byte $80   ; 01 sound


ofs_03_9B09_secret_options_ammo:
ofs_03_9B09_secret_options_continue:
ofs_03_9B09_secret_options_level:
ofs_03_9B09_secret_options_rest:
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btns_LR
                                        BEQ bra_9B0B
                                        AND #con_btn_Left
                                        BNE bra_9B0A_left
; right
                                        INC ram_options + $05,X
                                        LDA ram_options + $05,X
                                        CMP tbl_9B0D_лимит_опций,X
                                        BCC bra_9B0B
                                        DEC ram_options + $05,X
                                        BNE bra_9B0B

bra_9B0A_left:
                                        DEC ram_options + $05,X
                                        BPL bra_9B0B
                                        INC ram_options + $05,X
bra_9B0B:
                                        LDA ram_номер_опции_колво_игроков
                                        BNE bra_9B0D
                                        LDA #con_0x0017EA_infinite_ammo_off
                                        CLC
                                        ADC ram_option_бесконечные_патроны
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        RTS
                                        
bra_9B0D:
                                        LDA tbl_9B0E_начальная_con - $01,X
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        LDY ram_номер_опции_колво_игроков   ; номер строки
                                        LDA ram_options + $05,Y
                                        CLC
                                        ADC tbl_9B0F_номер_тайла - $01,Y
                                        STA ram_nmt_buffer - $02,X
bra_9B0C_RTS:
                                        RTS

tbl_9B0D_лимит_опций:
                                        .byte $02   ; 03 ammo
                                        .byte $06   ; 04 continue
                                        .byte $08   ; 05 level
                                        .byte $0A   ; 06 rest

tbl_9B0E_начальная_con:
                                        .byte con_0x0017EA_continue           ; 04 continue
                                        .byte con_0x0017EA_level              ; 05 level
                                        .byte con_0x0017EA_rest               ; 06 rest

tbl_9B0F_номер_тайла:
                                        .byte $81   ; 04 continue
                                        .byte $82   ; 05 level
                                        .byte $81   ; 06 rest













ofs_03_9B10_options_exit:
                                        LDA ram_копия_нажатая_кнопка
                                        AND #con_btn_Start      
                                        BEQ bra_9B11_RTS
; выход
                                        LDA #$01
                                        STA ram_счетчик_затемнения_экрана
                                        LDA #$40
                                        STA ram_таймер_до_демки_lo
                                        INC ram_номер_действия_на_заставке
bra_9B11_RTS:
                                        RTS



ofs_02_8230_02_мерцание_exit:
                                        JSR sub_9B30_смена_палитры_сокола
                                        JSR sub_9B34_анимации_орла
                                        LDA ram_таймер_до_демки_lo
                                        AND #$08
                                        ASL
                                        ASL
                                        ASL
                                        ASL
                                        CLC
                                        ADC #con_0x0017EA_exit
                                        JSR sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
                                        DEC ram_таймер_до_демки_lo
                                        BNE bra_9B13_RTS
                                        INC ram_номер_действия_на_заставке
bra_9B13_RTS:
                                        RTS



ofs_02_8240_03_выход_из_экрана_options:
                                        JSR sub_0x01FAAF_затемнение_экрана
                                        PHP
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
                                        PLP
                                        BCC bra_9B28_RTS
                                        JSR sub_0x01FE1E_остановить_звуковой_движок
                                        JSR sub_0x01E5E0_очистка_оперативки
                                        JSR sub_0x01E7D0_выбор_банков_графики
                                        LDA #con_chr_bank + $84
                                        STA ram_bg_bank_2
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
                                        STA ram_флаг_игры_ботов_в_демке
                                        STA ram_номер_уровня
                                        LDA ram_флаг_читов
                                        AND #$7F
                                        STA ram_флаг_читов
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
                                        .byte $8B   ; 05

tbl_9B2A_x_координаты_стрелки:
                                        .byte $22   ; 00
                                        .byte $22   ; 01
                                        .byte $22   ; 02
                                        .byte $22   ; 03
                                        .byte $22   ; 04
                                        .byte $62   ; 05

tbl_9B2B_y_координаты_стрелки:
                                        .byte $2B   ; 00
                                        .byte $3B   ; 01
                                        .byte $4B   ; 02
                                        .byte $5B   ; 03
                                        .byte $8B   ; 04

tbl_9B2C_x_координаты_стрелки:
                                        .byte $22   ; 00
                                        .byte $22   ; 01
                                        .byte $22   ; 02
                                        .byte $22   ; 03
                                        .byte $62   ; 04


sub_9B30_смена_палитры_сокола:
                                        INC ram_счетчик_палитры_орла_младш 
                                        LDA ram_счетчик_палитры_орла_младш 
                                        CMP #$08
                                        BCC bra_9B32_RTS
                                        LDA #$00
                                        STA ram_счетчик_палитры_орла_младш 
                                        INC ram_счетчик_палитры_орла_старш
                                        LDY ram_счетчик_палитры_орла_старш
                                        CPY #$04
                                        BCC bra_9B31
                                        LDY #$00
bra_9B31:
                                        STY ram_счетчик_палитры_орла_старш
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
                                        INC ram_007F
                                        LDA ram_007F
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
                                        CMP #$40
                                        BNE bra_E4D1_RTS
bra_E4D8_запись:
                                        LDY #$06
                                        STY ram_счетчик_анимации_super
bra_E4E0:
                                        LDA ram_счетчик_кадров
                                        AND #$03
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
                                        LDA tbl_E46F_данные_стрелки,Y
                                        STA ram_кадр_анимации + $02
                                        LDA tbl_E46F_данные_стрелки + $01,Y
                                        STA ram_атрибуты_спрайта + $02
                                        INC ram_номер_анимации_логотипа
C - - - - - 0x01E47F 07:E46F: 60        RTS


tbl_E46F_данные_стрелки:
;                                              +---------- spr_T
;                                              |    +----- spr_A
;                                              |    |
                                        .byte $FC, $40   ; 00
                                        .byte $FD, $40   ; 01
                                        .byte $FF, $00   ; 02
                                        .byte $FD, $00   ; 03
                                        .byte $FC, $00   ; 04
                                        .byte $F9, $40   ; 05
                                        .byte $FA, $40   ; 06
                                        .byte $FB, $40   ; 07
                                        .byte $FE, $00   ; 08
                                        .byte $FB, $00   ; 09
                                        .byte $FA, $00   ; 0A
                                        .byte $F9, $00   ; 0B



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
C - - - - - 0x002333 00:A323: 85 26     STA ram_mirroring
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
                                        LDA ram_счетчик_кадров
                                        AND #$01
                                        ASL
                                        TAY
                                        JSR sub_A36D_смена_атрибута_фона
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
                                        LDY #$04
                                        JSR sub_A36D_смена_атрибута_фона
C - - - - - 0x002376 00:A366: 4C 38 A3  JMP loc_A338
bra_A369:
C - - - - - 0x002379 00:A369: 18        CLC
C - - - - - 0x00237A 00:A36A: 60        RTS



tbl_A36B_x_скорость_смещения:
- D 1 - - - 0x00237B 00:A36B: 02        .byte $FE   ; 00 движение налево
- D 1 - - - 0x00237C 00:A36C: FE        .byte $02   ; 01 движение нарпаво


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
C - - - - - 0x0023AA 00:A39A: A9 70     LDA #$80
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


sub_A36D_смена_атрибута_фона:
                                        LDA tbl_A370,Y
                                        STA ram_0000
                                        LDA tbl_A370 + $01,Y
                                        STA ram_0001
                                        LDX ram_index_ppu_buffer
                                        LDA #con_buf_mode_01
                                        STA ram_nmt_buffer,X
                                        INX
                                        LDY #$00
bra_A36E_loop:
                                        LDA (ram_0000),Y
                                        CMP #$FF
                                        BEQ bra_A36F_FF
                                        STA ram_nmt_buffer,X
                                        INX
                                        INY
                                        BNE bra_A36E_loop    ; jmp
bra_A36F_FF:
                                        STA ram_nmt_buffer,X
                                        INX
                                        STX ram_index_ppu_buffer
                                        RTS

tbl_A370:
                                        .word _off005_A370_00
                                        .word _off005_A371_01
                                        .word _off005_A372_02


_off005_A370_00:
                                        .dbyt $23C0 ; ppu address
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $50, $50, $50, $00, $00, $00, $00   ; 
                                        .byte $00, $55, $05, $0D, $0F, $0F, $0F, $0F, $00, $55, $50, $50, $50, $50, $50, $00   ; 
                                        .byte $FF   ; end token
_off005_A371_01:
                                        .dbyt $23C0 ; ppu address
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 
                                        .byte $00, $00, $50, $50, $5F, $5F, $5F, $0F, $00, $00, $05, $05, $05, $05, $05, $00   ; 
                                        .byte $FF   ; end token
_off005_A372_02:
                                        .dbyt $23C0 ; ppu address
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $50, $50, $50, $00, $00, $00, $00   ; 
                                        .byte $00, $55, $55, $5D, $5F, $5F, $5F, $0F, $00, $55, $55, $55, $05, $05, $05, $00   ; 
                                        .byte $FF   ; end token



sub_E55C_подготовка_ботов_к_игре:
C - - - - - 0x01E56C 07:E55C: 20 D0 E5  JSR sub_0x01E5E0_очистка_оперативки
C - - - - - 0x01E56F 07:E55F: A9 01     LDA #$01
C - - - - - 0x01E571 07:E561: 85 1F     STA ram_флаг_игры_ботов_в_демке
C - - - - - 0x01E573 07:E563: 85 20     STA ram_колво_игроков
C - - - - - 0x01E575 07:E565: A9 01     LDA #con_plr_status_респавн
C - - - - - 0x01E577 07:E567: 85 A0     STA ram_статус_игрока
C - - - - - 0x01E579 07:E569: 85 A1     STA ram_статус_игрока + $01
C - - - - - 0x01E57B 07:E56B: A9 00     LDA #$00
C - - - - - 0x01E57D 07:E56D: 85 CA     STA ram_plr_game_over
C - - - - - 0x01E57F 07:E56F: 85 CB     STA ram_plr_game_over + $01
C - - - - - 0x01E581 07:E571: 85 1B     STA ram_счетчик_кадров
C - - - - - 0x01E585 07:E575: 85 23     STA ram_рандом_байт
C - - - - - 0x01E587 07:E577: A9 10     LDA #$10
C - - - - - 0x01E589 07:E579: 85 53     STA ram_жизни
C - - - - - 0x01E58B 07:E57B: 85 54     STA ram_жизни + $01
C - - - - - 0x01E58D 07:E57D: A5 F0     LDA ram_номер_уровня_для_демки_ботов
C - - - - - 0x01E58F 07:E57F: 85 50     STA ram_номер_уровня
C - - - - - 0x01E591 07:E581: 60        RTS




sub_9D94_игра_ботов_в_демке:
C D 0 - - - 0x001DA4 00:9D94: E6 4E     INC ram_07DF
C - - - - - 0x001DA6 00:9D96: D0 02     BNE bra_9D9A
C - - - - - 0x001DA8 00:9D98: C6 4E     DEC ram_07DF
bra_9D9A:
C - - - - - 0x001DAA 00:9D9A: A2 01     LDX #$01
C - - - - - 0x001DAC 00:9D9C: 20 A0 9D  JSR sub_9DA0
C - - - - - 0x001DAF 00:9D9F: CA        DEX ; 00
sub_9DA0:
C - - - - - 0x001DB0 00:9DA0: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x001DB2 00:9DA2: 4A        LSR
C - - - - - 0x001DB3 00:9DA3: B0 33     BCS bra_9DD8
C - - - - - 0x001DB5 00:9DA5: B5 41     LDA ram_07CC_игрок,X
C - - - - - 0x001DB7 00:9DA7: D0 2D     BNE bra_9DD6
C - - - - - 0x001DB9 00:9DA9: A5 50     LDA ram_номер_уровня
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
C - - - - - 0x001DCA 00:9DBA: B9 08 9E  LDA tbl_9E08_выбор_игрока_и_уровня,Y
C - - - - - 0x001DCD 00:9DBD: 85 08     STA ram_0008
C - - - - - 0x001DCF 00:9DBF: B9 09 9E  LDA tbl_9E08_выбор_игрока_и_уровня + $01,Y
C - - - - - 0x001DD2 00:9DC2: 85 09     STA ram_0009
C - - - - - 0x001DD4 00:9DC4: B4 43     LDY ram_07CE_игрок,X
C - - - - - 0x001DD6 00:9DC6: B1 08     LDA (ram_0008),Y
C - - - - - 0x001DD8 00:9DC8: C9 FF     CMP #$FF
C - - - - - 0x001DDA 00:9DCA: F0 39     BEQ bra_9E05_FF
C - - - - - 0x001DDC 00:9DCC: 95 4C     STA ram_07DD_игрок,X
C - - - - - 0x001DDE 00:9DCE: C8        INY
C - - - - - 0x001DDF 00:9DCF: B1 08     LDA (ram_0008),Y
C - - - - - 0x001DE1 00:9DD1: 95 41     STA ram_07CC_игрок,X
C - - - - - 0x001DE3 00:9DD3: C8        INY
                                        TYA
C - - - - - 0x001DE4 00:9DD4: 94 43     STA ram_07CE_игрок,X
bra_9DD6:
C - - - - - 0x001DE6 00:9DD6: D6 41     DEC ram_07CC_игрок,X
bra_9DD8:
C - - - - - 0x001DE8 00:9DD8: B5 4C     LDA ram_07DD_игрок,X
C - - - - - 0x001DEA 00:9DDA: 95 F1     STA ram_нажатая_кнопка,X
C - - - - - 0x001DEC 00:9DDC: 95 F3     STA ram_удержанная_кнопка,X
C - - - - - 0x001DEE 00:9DDE: A5 4E     LDA ram_07DF
C - - - - - 0x001DF0 00:9DE0: C9 E0     CMP #$E0
C - - - - - 0x001DF2 00:9DE2: 90 20     BCC bra_9E04_RTS
C - - - - - 0x001DF4 00:9DE4: B5 B8     LDA ram_оружие_игрока,X
C - - - - - 0x001DF6 00:9DE6: 29 0F     AND #$0F
C - - - - - 0x001DF8 00:9DE8: C9 01     CMP #con_weapon_machine_gun
C - - - - - 0x001DFA 00:9DEA: F0 04     BEQ bra_9DF0
C - - - - - 0x001DFC 00:9DEC: C9 03     CMP #con_weapon_laser
C - - - - - 0x001DFE 00:9DEE: D0 08     BNE bra_9DF8
bra_9DF0:
; if M or L
C - - - - - 0x001E00 00:9DF0: B5 F3     LDA ram_удержанная_кнопка,X
C - - - - - 0x001E02 00:9DF2: 09 40     ORA #con_btn_B
C - - - - - 0x001E04 00:9DF4: 95 F3     STA ram_удержанная_кнопка,X
C - - - - - 0x001E06 00:9DF6: D0 0C     BNE bra_9E04_RTS    ; jmp
bra_9DF8:
C - - - - - 0x001E08 00:9DF8: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x001E0A 00:9DFA: 29 06     AND #$06
C - - - - - 0x001E0C 00:9DFC: D0 06     BNE bra_9E04_RTS
C - - - - - 0x001E0E 00:9DFE: B5 F1     LDA ram_нажатая_кнопка,X
C - - - - - 0x001E10 00:9E00: 09 40     ORA #con_btn_B
C - - - - - 0x001E12 00:9E02: 95 F1     STA ram_нажатая_кнопка,X
bra_9E04_RTS:
                                        CLC
C - - - - - 0x001E14 00:9E04: 60        RTS
bra_9E05_FF:
;C - - - - - 0x001E15 00:9E05: E6 3B     INC ram_003B
                                        SEC
C - - - - - 0x001E17 00:9E07: 60        RTS



tbl_9E08_выбор_игрока_и_уровня:
- D 0 - - - 0x001E18 00:9E08: 14 9E     .word _off012_00_9E14_00_кнопки_игрок1_уровень1
- D 0 - - - 0x001E1A 00:9E0A: 5C 9E     .word _off012_01_9E5C_00_кнопки_игрок2_уровень1
- D 0 - - - 0x001E1C 00:9E0C: BC 9E     .word _off012_00_9EBC_01_кнопки_игрок1_уровень2
- D 0 - - - 0x001E1E 00:9E0E: 54 9F     .word _off012_01_9F54_01_кнопки_игрок2_уровень2
- D 0 - - - 0x001E20 00:9E10: D0 9F     .word _off012_00_9FD0_02_кнопки_игрок1_уровень3
- D 0 - - - 0x001E22 00:9E12: 8C A0     .word _off012_01_A08C_02_кнопки_игрок2_уровень3


; ???
_off012_00_9E14_00_кнопки_игрок1_уровень1:
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



_off012_01_9E5C_00_кнопки_игрок2_уровень1:
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



_off012_00_9EBC_01_кнопки_игрок1_уровень2:
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



_off012_01_9F54_01_кнопки_игрок2_уровень2:
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



_off012_00_9FD0_02_кнопки_игрок1_уровень3:
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



_off012_01_A08C_02_кнопки_игрок2_уровень3:
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






sub_A29C_чит_коды:
; 1путин: опт/замена кода
C D 1 - - - 0x0022AC 00:A29C: A4 50     LDA ram_флаг_читов
C - - - - - 0x0022AE 00:A29E: 30 1C     BMI bra_A2BC_RTS
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
C - - - - - 0x0022C3 00:A2B3: A9 01     LDA #$81
C - - - - - 0x0022C5 00:A2B5: 8D EC 07  STA ram_флаг_читов
                                        LDA #$20
                                        STA ram_счетчик_мерцания_экрана
                                        LDA #con_sound_23
                                        JSR sub_0x01FDEE_play_sound_напрямую
bra_A2B8_incorrect_input:
C - - - - - 0x0022C8 00:A2B8: A9 FF     LDA #$00
C - - - - - 0x0022CA 00:A2BA: 85 50     STA ram_cheat_input_cnt
bra_A2BC_RTS:
C - - - - - 0x0022CC 00:A2BC: 60        RTS



tbl_A2BD_cheat_code:
                                        .byte con_btn_A      ; 00
                                        .byte con_btn_B      ; 01
                                        .byte con_btn_Right  ; 02
                                        .byte con_btn_Left   ; 03
                                        .byte con_btn_Right  ; 04
                                        .byte con_btn_Left   ; 05
                                        .byte con_btn_Down   ; 06
                                        .byte con_btn_Down   ; 07
                                        .byte con_btn_Up     ; 08
                                        .byte con_btn_Up     ; 09
                                        .byte $00            ; 0A end token



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
C - - - - - 0x01E501 07:E4F1: A5 3C     LDA ram_таймер_до_демки_lo
C - - - - - 0x01E503 07:E4F3: 05 3D     ORA ram_таймер_до_демки_hi
C - - - - - 0x01E505 07:E4F5: F0 0A     BEQ bra_E501_RTS
C - - - - - 0x01E507 07:E4F7: A5 3C     LDA ram_таймер_до_демки_lo
C - - - - - 0x01E509 07:E4F9: D0 02     BNE bra_E4FD
C - - - - - 0x01E50B 07:E4FB: C6 3D     DEC ram_таймер_до_демки_hi
bra_E4FD:
C - - - - - 0x01E50D 07:E4FD: C6 3C     DEC ram_таймер_до_демки_lo
C - - - - - 0x01E50F 07:E4FF: A9 01     LDA #$01
bra_E501_RTS:
C - - - - - 0x01E511 07:E501: 60        RTS



sub_E502_подготовка_счетчиков:
C - - - - - 0x01E512 07:E502: A9 00     LDA #$00
C - - - - - 0x01E514 07:E504: A0 01     LDY #$01
C - - - - - 0x01E516 07:E506: 85 3C     STA ram_таймер_до_демки_lo
C - - - - - 0x01E518 07:E508: 84 3D     STY ram_таймер_до_демки_hi
C - - - - - 0x01E51A 07:E50A: 60        RTS


sub_E50B_подготовка_главного_экрана:
C - - - - - 0x01E51B 07:E50B: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
C - - - - - 0x01E521 07:E511: A2 02     LDX #$00
C - - - - - 0x01E523 07:E513: 20 84 FE  JSR sub_0x01FE94_bankswitch_отрисовка_экранов
C - - - - - 0x01E526 07:E516: A9 00     LDA #$00
C - - - - - 0x01E528 07:E518: 85 1F     STA ram_флаг_игры_ботов_в_демке
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
C - - - - - 0x009B83 02:9B73: 4C DE FD  JMP loc_0x01FDEE_play_sound_напрямую
bra_9B76_26:
; проиграть один за другим
C - - - - - 0x009B86 02:9B76: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
C - - - - - 0x009B89 02:9B79: AD 5E 9F  LDA #< tbl_9F62_автовоспроизведение
C - - - - - 0x009B8C 02:9B7C: 85 5C     STA ram_005C_sound_mode_data
C - - - - - 0x009B8E 02:9B7E: AD 5F 9F  LDA #> tbl_9F62_автовоспроизведение
C - - - - - 0x009B91 02:9B81: 85 5D     STA ram_005C_sound_mode_data + $01
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
C - - - - - 0x009F60 02:9F50: 60        RTS
bra_9F51_FF:
sub_9F51:
C - - - - - 0x009F61 02:9F51: A9 00     LDA #$00
C - - - - - 0x009F63 02:9F53: 85 59     STA ram_play_all
C - - - - - 0x009F65 02:9F55: 85 5A     STA ram_005A_sound_mode
C - - - - - 0x009F67 02:9F57: 85 5B     STA ram_005B_sound_mode
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




.out .sprintf("Free bytes in bank 24: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_24b"
    .byte con_prg_bank + $25   ; 
