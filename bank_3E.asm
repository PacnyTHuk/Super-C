.segment "BANK_3E"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $C000 ; for listing file
; 0x03C010-0x04000F

.export sub_0x000000_чтение_комбинаций_кнопок_для_читов
.export loc_0x01E4A2_запись_в_демку_00
.export sub_0x01E4A6_выбрать_следующий_уровень_для_демки
.export loc_0x01E4F5_увеличить_демку
.export loc_0x01E4FC_запись_в_демку_кастом
.export sub_0x01E7D0_выбор_банков_графики
.export sub_0x01E918_обработчик_геймплея
.export sub_0x01F0A5_попытка_перерисовать_фон_объекта
.export sub_0x01F0B0
.export sub_0x0068AA_попытка_перерисовать_фон_объекта_через_буфер
.export loc_0x0068AA_попытка_перерисовать_фон_объекта_через_буфер
.export sub_0x01F192
.export sub_0x01F198
.export sub_0x01F1A0
.export sub_0x01FE4D_обработчик_уровня_и_смена_банка
.export sub_0x01F2F4
.export sub_0x01F335
.export sub_0x01F337
.export loc_0x01F337
.export sub_0x01F360_расчет_угла_от_объекта_до_игрока
.export tbl_0x009120_скорость_пуль_lo
.export tbl_0x009121_скорость_пуль_HI
.export sub_0x01F3A6_записать_скорость_Y_X
.export loc_0x01F3A6_записать_скорость_Y_X
.export sub_0x01F3BB
.export sub_0x01F4A5_определить_угол_и_сравнить_между_собой
.export sub_0x01F4A7_определить_сторону_поворота_и_повернуть_объект
.export loc_0x01F4A7_определить_сторону_поворота_и_повернуть_объект
.export sub_0x01F4AB_установить_угол_направления_от_счетчика_поворота
.export sub_0x01F4B2
.export sub_0x01F4B5
.export sub_0x01F4BB_определить_угол_до_игрока_и_повернуть_объект
.export tbl_0x01F4E4_углы_направления_объекта
.export sub_0x01F4FC
.export sub_0x01F500_определить_угол_до_игрока_и_возможность_поворота_объекта
.export loc_0x01F6BD_убить_игрока
.export sub_0x01F692_определить_живого_игрока_и_копировать_его_позиции
.export sub_0x01F6BD_убить_игрока
.export sub_0x01F70D_попытка_создать_объект
.export sub_0x01F716_попытка_найти_свободный_слот_для_объекта___первые_4_слота
.export sub_0x01F718_попытка_найти_свободный_слот_для_объекта_X_слотов
.export sub_0x01F72C_поиск_вражеской_пули_в_слотах_объектов
.export sub_0x01F742_удалить_все_объекты_и_очистить_их_данные
.export sub_0x01F74F_начать_создание_нового_объекта
.export sub_0x01F7AC_очистить_ID_объекта_и_его_хитбокс
.export sub_0x01F7AE_записать_ID_объекта_и_его_хитбокс
.export sub_0x01F7B9_запись_палитры_из_03E0x_в_0300x_с_условием
.export loc_0x01F7B9_запись_палитры_из_03E0x_в_0300x_с_условием
.export sub_0x01F7C8_запись_фоновой_палитры_из_03E0x_в_0300x
.export sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
.export sub_0x01F820
.export sub_0x01F860
.export tbl_0x01F8DC
.export tbl_0x01F8E8
.export sub_0x01F974_запись_3х_цветов_с_условием
.export sub_0x01F978_запись_3х_цветов
.export sub_0x01FA40
.export sub_0x01FAAF_затемнение_экрана
.export tbl_0x01FB75_индексы
.export loc_0x01FCCA_включить_NMI
.export sub_0x01FD7F_смена_2х_подряд_prg_банков_без_возврата
.export sub_0x01FDBB_выбрать_второй_банк_с_данными_музыки
.export sub_0x01FDEE_play_sound
.export sub_0x01FDEE_play_music
.export loc_0x01FDEE_play_sound
.export sub_0x01FDEE_play_sound_напрямую
.export loc_0x01FDEE_play_sound_напрямую
.export sub_0x01FE06
.export sub_0x01FE1E_остановить_звуковой_движок
.export loc_0x01FE1E_остановить_звуковой_движок
.export sub_0x00FE84_XFF_обнуление_экранов_PPU
.export sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x
.export sub_0x01FE94_bankswitch_отрисовка_экранов
.export sub_0x01FE9C
.export sub_0x01FEA2
.export sub_0x01FEB4_подготовка_и_выбор_банков_для_перерисовки_части_фона_через_буфер
.export sub_0x01FEAE_подготовить_данные_для_уровня
.export _общий_RTS

; must be placed at C000 (beginning of the fixed bank)
    .incbin "DPCM.bin"

; ==================================================================================================================
;  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; ==================================================================================================================

sub_0x000000_чтение_комбинаций_кнопок_для_читов:
; cyneprepou4uk
                                        LDA ram_нажатая_кнопка,X
                                        AND #con_btn_Select
                                        BEQ bra_85A9_RTS
                                        LDA ram_удержанная_кнопка,X
                                        AND #con_btns_UD
                                        BEQ bra_85A9_RTS
                                        CMP #con_btn_Up
                                        BEQ bra_85A7_смена_оружия
; вечное бессмертие на вниз + селект
                                        LDA ram_режим_бессмертия,X
                                        EOR #$01    ; переключить режим
                                        STA ram_режим_бессмертия,X
                                        STA ram_бессмертие_игрока,X
                                        LDA #con_sound_19
                                        JMP loc_FDDE_play_sound
bra_85A7_смена_оружия:
; переключение оружия на вверх + селект
                                        LDA ram_оружие_игрока,X
                                        CLC
                                        ADC #$01    ; переключить на следующее
                                        CMP #$07    ; огнемет тоже в списке
                                        BCC bra_85A8_not_overflow
                                        LDA #$00
bra_85A8_not_overflow:
                                        STA ram_оружие_игрока,X
                                        LDA #con_sound_19
                                        JMP loc_FDDE_play_sound
bra_85A9_RTS:
                                        RTS

; ******************************************************************************************************************

bra_E007_quit:
; X = 00
C - - - - - 0x01E017 07:E007: 8E 00 03  STX ram_nmt_buffer  ; con_buf_mode_00
C - - - - - 0x01E01A 07:E00A: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x01E01C 07:E00C: A5 FF     LDA ram_for_2000
C - - - - - 0x01E01E 07:E00E: 8D 00 20  STA $2000
C - - - - - 0x01E021 07:E011: 60        RTS
sub_E012:
loc_E012_loop:
bra_E012_loop:
C D 3 - - - 0x01E022 07:E012: BE 00 03  LDX ram_nmt_buffer,Y
C - - - - - 0x01E025 07:E015: F0 F0     BEQ bra_E007_quit   ; if con_buf_mode_00
C - - - - - 0x01E027 07:E017: BD FF DF  LDA tbl_E000_config_2000 - $01,X
C - - - - - 0x01E02A 07:E01A: 8D 00 20  STA $2000
C - - - - - 0x01E02D 07:E01D: C8        INY
C - - - - - 0x01E02E 07:E01E: AD 02 20  LDA $2002
C - - - - - 0x01E031 07:E021: B9 00 03  LDA ram_nmt_buffer,Y
C - - - - - 0x01E034 07:E024: 8D 06 20  STA $2006
C - - - - - 0x01E037 07:E027: C8        INY
C - - - - - 0x01E038 07:E028: B9 00 03  LDA ram_nmt_buffer,Y
C - - - - - 0x01E03B 07:E02B: 8D 06 20  STA $2006
C - - - - - 0x01E03E 07:E02E: C8        INY
C - - - - - 0x01E03F 07:E02F: E0 06     CPX #$06
C - - - - - 0x01E041 07:E031: B0 35     BCS bra_E068_06_07
C - - - - - 0x01E043 07:E033: E0 03     CPX #con_buf_mode_03
C - - - - - 0x01E045 07:E035: D0 15     BNE bra_E04C_01
; con_buf_mode_03
C - - - - - 0x01E047 07:E037: BE 00 03  LDX ram_nmt_buffer,Y
C - - - - - 0x01E04A 07:E03A: C8        INY
C - - - - - 0x01E04B 07:E03B: B9 00 03  LDA ram_nmt_buffer,Y
C - - - - - 0x01E04E 07:E03E: C8        INY
bra_E03F_loop:
C - - - - - 0x01E04F 07:E03F: 8D 07 20  STA $2007
C - - - - - 0x01E052 07:E042: CA        DEX
C - - - - - 0x01E053 07:E043: D0 FA     BNE bra_E03F_loop
C - - - - - 0x01E055 07:E045: F0 CB     BEQ bra_E012_loop    ; jmp
bra_E049_loop:
C - - - - - 0x01E059 07:E049: 8D 07 20  STA $2007
bra_E04C_01:
; con_buf_mode_01
C - - - - - 0x01E05C 07:E04C: B9 00 03  LDA ram_nmt_buffer,Y
C - - - - - 0x01E05F 07:E04F: C8        INY
C - - - - - 0x01E060 07:E050: C9 FF     CMP #$FF
C - - - - - 0x01E062 07:E052: D0 F5     BNE bra_E049_loop
C - - - - - 0x01E064 07:E054: B9 00 03  LDA ram_nmt_buffer,Y
                                        JMP loc_E012_loop
bra_E05D_loop:
C - - - - - 0x01E06D 07:E05D: 8D 06 20  STA $2006
C - - - - - 0x01E070 07:E060: C8        INY
C - - - - - 0x01E071 07:E061: B9 00 03  LDA ram_nmt_buffer,Y
C - - - - - 0x01E074 07:E064: 8D 06 20  STA $2006
C - - - - - 0x01E077 07:E067: C8        INY
bra_E068_06_07:
; con_buf_mode_06
; con_buf_mode_07
C - - - - - 0x01E078 07:E068: BE 00 03  LDX ram_nmt_buffer,Y
C - - - - - 0x01E07B 07:E06B: C8        INY
bra_E06C_loop:
C - - - - - 0x01E07C 07:E06C: B9 00 03  LDA ram_nmt_buffer,Y
C - - - - - 0x01E07F 07:E06F: 8D 07 20  STA $2007
C - - - - - 0x01E082 07:E072: C8        INY
C - - - - - 0x01E083 07:E073: CA        DEX
C - - - - - 0x01E084 07:E074: D0 F6     BNE bra_E06C_loop
C - - - - - 0x01E086 07:E076: B9 00 03  LDA ram_nmt_buffer,Y
C - - - - - 0x01E089 07:E079: 10 E2     BPL bra_E05D_loop
; A = FF
C - - - - - 0x01E08B 07:E07B: C8        INY
C - - - - - 0x01E08C 07:E07C: 4C 12 E0  JMP loc_E012_loop

tbl_E000_config_2000:
; see con_buf_mode
- D 3 - - - 0x01E010 07:E000: 28        .byte $28   ; 01 увеличить 2006 на 01 после записи в 2007
- - - - - - 0x01E011 07:E001: 2C        .byte $2C   ; 02 unused
- D 3 - - - 0x01E012 07:E002: 28        .byte $28   ; 03 увеличить 2006 на 01 после записи в 2007
- - - - - - 0x01E013 07:E003: 28        .byte $28   ; 04 unused
- - - - - - 0x01E014 07:E004: 28        .byte $28   ; 05 unused
- D 3 - - - 0x01E015 07:E005: 28        .byte $28   ; 06 увеличить 2006 на 01 после записи в 2007
- D 3 - - - 0x01E016 07:E006: 2C        .byte $2C   ; 07 увеличить 2006 на 20 после записи в 2007

; ******************************************************************************************************************

vec_E07F_IRQ:
C - - - - - 0x01E08F 07:E07F: 48        PHA
C - - - - - 0x01E090 07:E080: 8A        TXA
C - - - - - 0x01E091 07:E081: 48        PHA
C - - - - - 0x01E092 07:E082: 98        TYA
C - - - - - 0x01E093 07:E083: 48        PHA
C - - - - - 0x01E094 07:E084: 8D 00 E0  BIT $5204   ; acknowledge irq
C - - - - - 0x01E09A 07:E08A: A5 28     LDA ram_irq_handler_lo
C - - - - - 0x01E09C 07:E08C: 0A        ASL
C - - - - - 0x01E09D 07:E08D: A8        TAY
C - - - - - 0x01E09E 07:E08E: B1 2D     LDA (ram_002D),Y
C - - - - - 0x01E0A0 07:E090: 85 29     STA ram_0029
C - - - - - 0x01E0A2 07:E092: C8        INY
C - - - - - 0x01E0A3 07:E093: B1 2D     LDA (ram_002D),Y
C - - - - - 0x01E0A5 07:E095: 85 2A     STA ram_002A
                                        CLC
C - - - - - 0x01E0A7 07:E097: 6C 29 00  JMP (ram_0029)

; ******************************************************************************************************************

sub_0x01E4A6_выбрать_следующий_уровень_для_демки:
sub_E496_выбрать_следующий_уровень_для_демки:
C - - - - - 0x01E4A6 07:E496: E6 F0     INC ram_номер_уровня_для_демки_ботов
C - - - - - 0x01E4A8 07:E498: A5 F0     LDA ram_номер_уровня_для_демки_ботов
C - - - - - 0x01E4AA 07:E49A: C9 03     CMP #$03
C - - - - - 0x01E4AC 07:E49C: 90 02     BCC bra_E4A0_not_overflow
C - - - - - 0x01E4AE 07:E49E: A9 00     LDA #$00
bra_E4A0_not_overflow:
C - - - - - 0x01E4B0 07:E4A0: 85 F0     STA ram_номер_уровня_для_демки_ботов
bra_E4A2_RTS:
C - - - - - 0x01E4B2 07:E4A2: 60        RTS

; ******************************************************************************************************************

loc_0x01E4F5_увеличить_демку:
C D 3 - - - 0x01E4F5 07:E4E5: E6 18     INC ram_демка
loc_E4E7:
C D 3 - - - 0x01E4F7 07:E4E7: A9 00     LDA #$00
C - - - - - 0x01E4F9 07:E4E9: 85 19     STA ram_номер_действия_на_заставке
C - - - - - 0x01E4FB 07:E4EB: 60        RTS

; ******************************************************************************************************************

loc_0x01E4A2_запись_в_демку_00:
C D 3 - - - 0x01E4A2 07:E492: A9 00     LDA #$00
loc_0x01E4FC_запись_в_демку_кастом:
C D 3 - - - 0x01E4FC 07:E4EC: 85 18     STA ram_демка
C - - - - - 0x01E4FE 07:E4EE: 4C E7 E4  JMP loc_E4E7

; ******************************************************************************************************************

sub_0x01E7D0_выбор_банков_графики:
C - - - - - 0x01E7D0 07:E7C0: A9 40     LDA #con_chr_bank + $40
C - - - - - 0x01E7D2 07:E7C2: 8D F0 07  STA ram_bg_bank_1
C - - - - - 0x01E7D5 07:E7C5: A9 6A     LDA #con_chr_bank + $6A
C - - - - - 0x01E7D7 07:E7C7: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x01E7DA 07:E7CA: A9 44     LDA #con_chr_bank + $44
C - - - - - 0x01E7DC 07:E7CC: 8D F2 07  STA ram_spr_bank_1
C - - - - - 0x01E7DF 07:E7CF: A9 45     LDA #con_chr_bank + $45
C - - - - - 0x01E7E1 07:E7D1: 8D F3 07  STA ram_spr_bank_2
C - - - - - 0x01E7E4 07:E7D4: A9 46     LDA #con_chr_bank + $46
C - - - - - 0x01E7E6 07:E7D6: 8D F4 07  STA ram_spr_bank_3
C - - - - - 0x01E7E9 07:E7D9: A9 07     LDA #con_chr_bank + $19
C - - - - - 0x01E7EB 07:E7DB: 8D F5 07  STA ram_spr_bank_4
C - - - - - 0x01E7EE 07:E7DE: 60        RTS

; ******************************************************************************************************************

sub_0x01E918_обработчик_геймплея:
; пришли из 24 банка
C - - - - - 0x01E918 07:E908: 20 3A F8  JSR sub_F83A_сканлинии

                                        LDA #con_prg_bank + $30
                                        STA $5114   ; 8000
                                        LDA #con_prg_bank + $33
                                        STA $5115   ; A000
                                        JSR sub_0x000011_обработка_игроков

                                        LDA #con_prg_bank + $24
                                        STA $5114   ; 8000
C - - - - - 0x01FED4 07:FEC4: 4C 96 9C  JSR sub_0x001CA6

C - - - - - 0x01E921 07:E911: 20 98 FE  JSR sub_FE98

                                        LDA #con_prg_bank + $30
                                        STA $5114   ; 8000
                                        LDA #con_prg_bank + $33 ; общий банк для обработки объектов
                                        STA $5115   ; A000
                                        JSR sub_0x001191_обработка_пуль_игроков

                                        LDA #con_prg_bank + $26
                                        STA $5114   ; 8000
                                        JSR sub_0x009158_спавн_объектов_из_данных_уровня

                                        LDA #con_prg_bank + $26
                                        STA $5114   ; 8000
                                        LDA #con_prg_bank + $33 ; общий банк для обработки объектов
                                        STA $5115   ; A000
                                        JSR sub_0x001411_автоспавн_рядовых_мобов

                                        LDA #con_prg_bank + $33
                                        STA $5115   ; A000
                                        JSR sub_0x006233_обработчик_объектов

                                        LDA #con_prg_bank + $24 ; вернуться в 24 банк после всех обработок
                                        JSR sub_FD6F_смена_2х_подряд_prg_банков_без_возврата

C - - - - - 0x01E930 07:E920: 4C A9 F7  JMP loc_F7A9_запись_палитры_из_03E0x_в_0300x_с_условием

; ******************************************************************************************************************

sub_FE98:
C - - - - - 0x01FEA8 07:FE98: 20 FF FE  JSR sub_FEFF_подготовить_prg_банки_для_уровня
C D 3 - - - 0x01EB08 07:EAF8: 20 80 ED  JSR sub_ED80
                                        LDY ram_0060_unk
                                        LDA tbl_EB00_lo,y
                                        STA ram_0000
                                        LDA tbl_EB01_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_EB00_lo:
- D 3 - I - 0x01EB10 07:EB00: D6 EC     .byte < _общий_RTS ; 00
- D 3 - I - 0x01EB12 07:EB02: 08 EB     .byte < ofs_035_EB08_01
- D 3 - I - 0x01EB14 07:EB04: 0B EB     .byte < ofs_035_EB0B_02
- D 3 - I - 0x01EB16 07:EB06: 58 EB     .byte < ofs_035_EB58_03
tbl_EB01_hi:
- D 3 - I - 0x01EB10 07:EB00: D6 EC     .byte > _общий_RTS ; 00
- D 3 - I - 0x01EB12 07:EB02: 08 EB     .byte > ofs_035_EB08_01
- D 3 - I - 0x01EB14 07:EB04: 0B EB     .byte > ofs_035_EB0B_02
- D 3 - I - 0x01EB16 07:EB06: 58 EB     .byte > ofs_035_EB58_03

; _________________________________________________________________________________________________________________

ofs_035_EB08_01:
C - - J - - 0x01EB18 07:EB08: E6 60     INC ram_0060_unk
C - - - - - 0x01EB1A 07:EB0A: 60        RTS

; _________________________________________________________________________________________________________________

sub_EB0B:
ofs_035_EB0B_02:
C D 3 - - - 0x01EB1B 07:EB0B: E6 60     INC ram_0060_unk
C - - - - - 0x01EB1D 07:EB0D: A9 00     LDA #$00
C - - - - - 0x01EB1F 07:EB0F: 85 68     STA ram_0068
C - - - - - 0x01EB21 07:EB11: A9 07     LDA #$07
C - - - - - 0x01EB23 07:EB13: 85 6A     STA ram_006A
C - - - - - 0x01EB25 07:EB15: A5 74     LDA ram_0074_конфиг_уровня
C - - - - - 0x01EB27 07:EB17: 85 6E     STA ram_006E
C - - - - - 0x01EB29 07:EB19: A5 73     LDA ram_0073
C - - - - - 0x01EB2B 07:EB1B: A4 77     LDY ram_0077
C - - - - - 0x01EB2D 07:EB1D: F0 0B     BEQ bra_EB2A
C - - - - - 0x01EB2F 07:EB1F: 18        CLC
C - - - - - 0x01EB30 07:EB20: 69 02     ADC #$02
C - - - - - 0x01EB32 07:EB22: C9 1E     CMP #$1E
C - - - - - 0x01EB34 07:EB24: 90 04     BCC bra_EB2A
C - - - - - 0x01EB36 07:EB26: E6 6E     INC ram_006E
C - - - - - 0x01EB38 07:EB28: A9 00     LDA #$00
bra_EB2A:
C - - - - - 0x01EB3A 07:EB2A: 85 00     STA ram_0000
C - - - - - 0x01EB3C 07:EB2C: 29 FC     AND #$FC
C - - - - - 0x01EB3E 07:EB2E: 0A        ASL
C - - - - - 0x01EB3F 07:EB2F: 85 6D     STA ram_006D
C - - - - - 0x01EB41 07:EB31: A0 00     LDY #$00
C - - - - - 0x01EB43 07:EB33: 84 01     STY ram_0001
C - - - - - 0x01EB45 07:EB35: A5 00     LDA ram_0000
C - - - - - 0x01EB47 07:EB37: 0A        ASL
C - - - - - 0x01EB48 07:EB38: 26 01     ROL ram_0001
C - - - - - 0x01EB4A 07:EB3A: 0A        ASL
C - - - - - 0x01EB4B 07:EB3B: 26 01     ROL ram_0001
C - - - - - 0x01EB4D 07:EB3D: 0A        ASL
C - - - - - 0x01EB4E 07:EB3E: 26 01     ROL ram_0001
C - - - - - 0x01EB50 07:EB40: 0A        ASL
C - - - - - 0x01EB51 07:EB41: 26 01     ROL ram_0001
C - - - - - 0x01EB53 07:EB43: 0A        ASL
C - - - - - 0x01EB54 07:EB44: 26 01     ROL ram_0001
C - - - - - 0x01EB56 07:EB46: 18        CLC
C - - - - - 0x01EB57 07:EB47: 65 64     ADC ram_0064
C - - - - - 0x01EB59 07:EB49: 85 66     STA ram_0066
C - - - - - 0x01EB5B 07:EB4B: A5 65     LDA ram_0065
C - - - - - 0x01EB5D 07:EB4D: 4A        LSR
C - - - - - 0x01EB5E 07:EB4E: A9 20     LDA #$20
C - - - - - 0x01EB60 07:EB50: 90 02     BCC bra_EB54
C - - - - - 0x01EB62 07:EB52: A9 2C     LDA #$2C
bra_EB54:
C - - - - - 0x01EB64 07:EB54: 05 01     ORA ram_0001
C - - - - - 0x01EB66 07:EB56: 85 67     STA ram_0067
sub_EB58:
ofs_035_EB58_03:
C D 3 - - - 0x01EB68 07:EB58: 20 60 EB  JSR sub_EB60
C - - - - - 0x01EB6B 07:EB5B: A5 60     LDA ram_0060_unk
C - - - - - 0x01EB6D 07:EB5D: D0 01     BNE bra_EB60
C - - - - - 0x01EB6F 07:EB5F: 60        RTS
bra_EB60:
sub_EB60:
C - - - - - 0x01EB70 07:EB60: A9 00     LDA #$00
C - - - - - 0x01EB72 07:EB62: A4 6E     LDY ram_006E
C - - - - - 0x01EB74 07:EB64: F0 06     BEQ bra_EB6C
bra_EB66_loop:
C - - - - - 0x01EB76 07:EB66: 18        CLC
C - - - - - 0x01EB77 07:EB67: 65 89     ADC ram_0089_столбцы_данных_уровня
C - - - - - 0x01EB79 07:EB69: 88        DEY
C - - - - - 0x01EB7A 07:EB6A: D0 FA     BNE bra_EB66_loop
bra_EB6C:
C - - - - - 0x01EB7C 07:EB6C: 18        CLC
C - - - - - 0x01EB7D 07:EB6D: 65 65     ADC ram_0065
C - - - - - 0x01EB7F 07:EB6F: A8        TAY
C - - - - - 0x01EB80 07:EB70: B1 30     LDA (ram_0030),Y
C - - - - - 0x01EB82 07:EB72: 0A        ASL
C - - - - - 0x01EB83 07:EB73: A8        TAY
C - - - - - 0x01EB84 07:EB74: B1 32     LDA (ram_0032),Y
C - - - - - 0x01EB86 07:EB76: 85 08     STA ram_0008
C - - - - - 0x01EB88 07:EB78: C8        INY
C - - - - - 0x01EB89 07:EB79: B1 32     LDA (ram_0032),Y
C - - - - - 0x01EB8B 07:EB7B: 85 09     STA ram_0009
C - - - - - 0x01EB8D 07:EB7D: A5 64     LDA ram_0064
C - - - - - 0x01EB8F 07:EB7F: 4A        LSR
C - - - - - 0x01EB90 07:EB80: 4A        LSR
C - - - - - 0x01EB91 07:EB81: 18        CLC
C - - - - - 0x01EB92 07:EB82: 65 6D     ADC ram_006D
C - - - - - 0x01EB94 07:EB84: A8        TAY
C - - - - - 0x01EB95 07:EB85: A9 00     LDA #$00
C - - - - - 0x01EB97 07:EB87: 85 0C     STA ram_000C
C - - - - - 0x01EB99 07:EB89: B1 08     LDA (ram_0008),Y
C - - - - - 0x01EB9B 07:EB8B: 85 0D     STA ram_000D
C - - - - - 0x01EB9D 07:EB8D: 0A        ASL
C - - - - - 0x01EB9E 07:EB8E: 26 0C     ROL ram_000C
C - - - - - 0x01EBA0 07:EB90: 0A        ASL
C - - - - - 0x01EBA1 07:EB91: 26 0C     ROL ram_000C
C - - - - - 0x01EBA3 07:EB93: 0A        ASL
C - - - - - 0x01EBA4 07:EB94: 26 0C     ROL ram_000C
C - - - - - 0x01EBA6 07:EB96: 0A        ASL
C - - - - - 0x01EBA7 07:EB97: 26 0C     ROL ram_000C
C - - - - - 0x01EBA9 07:EB99: 18        CLC
C - - - - - 0x01EBAA 07:EB9A: 65 34     ADC ram_0034
C - - - - - 0x01EBAC 07:EB9C: 85 08     STA ram_0008
C - - - - - 0x01EBAE 07:EB9E: A5 0C     LDA ram_000C
C - - - - - 0x01EBB0 07:EBA0: 65 35     ADC ram_0035
C - - - - - 0x01EBB2 07:EBA2: 85 09     STA ram_0009
C - - - - - 0x01EBB4 07:EBA4: A5 6D     LDA ram_006D
C - - - - - 0x01EBB6 07:EBA6: 18        CLC
C - - - - - 0x01EBB7 07:EBA7: 69 08     ADC #$08
C - - - - - 0x01EBB9 07:EBA9: C9 40     CMP #$40
C - - - - - 0x01EBBB 07:EBAB: 90 04     BCC bra_EBB1
C - - - - - 0x01EBBD 07:EBAD: E6 6E     INC ram_006E
C - - - - - 0x01EBBF 07:EBAF: A9 00     LDA #$00
bra_EBB1:
C - - - - - 0x01EBC1 07:EBB1: 85 6D     STA ram_006D
C - - - - - 0x01EBC3 07:EBB3: A9 00     LDA #$00
C - - - - - 0x01EBC5 07:EBB5: 85 69     STA ram_0069
C - - - - - 0x01EBC7 07:EBB7: A5 66     LDA ram_0066
C - - - - - 0x01EBC9 07:EBB9: 85 00     STA ram_0000
C - - - - - 0x01EBCB 07:EBBB: A5 67     LDA ram_0067
C - - - - - 0x01EBCD 07:EBBD: 85 01     STA ram_0001
C - - - - - 0x01EBCF 07:EBBF: 20 FA EC  JSR sub_ECFA
C - - - - - 0x01EBD2 07:EBC2: A9 00     LDA #$00
C - - - - - 0x01EBD4 07:EBC4: 85 0E     STA ram_000E
C - - - - - 0x01EBD6 07:EBC6: A2 80     LDX #$80
C - - - - - 0x01EBD8 07:EBC8: A0 02     LDY #$02
C - - - - - 0x01EBDA 07:EBCA: A5 68     LDA ram_0068
C - - - - - 0x01EBDC 07:EBCC: F0 04     BEQ bra_EBD2
C - - - - - 0x01EBDE 07:EBCE: A5 6A     LDA ram_006A
C - - - - - 0x01EBE0 07:EBD0: F0 20     BEQ bra_EBF2
bra_EBD2:
C - - - - - 0x01EBE2 07:EBD2: A5 67     LDA ram_0067
C - - - - - 0x01EBE4 07:EBD4: 29 03     AND #$03
C - - - - - 0x01EBE6 07:EBD6: C9 03     CMP #$03
C - - - - - 0x01EBE8 07:EBD8: 90 06     BCC bra_EBE0
C - - - - - 0x01EBEA 07:EBDA: A5 66     LDA ram_0066
C - - - - - 0x01EBEC 07:EBDC: C9 80     CMP #$80
C - - - - - 0x01EBEE 07:EBDE: B0 16     BCS bra_EBF6
bra_EBE0:
C - - - - - 0x01EBF0 07:EBE0: A0 04     LDY #$04
C - - - - - 0x01EBF2 07:EBE2: A5 66     LDA ram_0066
C - - - - - 0x01EBF4 07:EBE4: 29 7F     AND #$7F
C - - - - - 0x01EBF6 07:EBE6: C9 40     CMP #$40
C - - - - - 0x01EBF8 07:EBE8: 90 0C     BCC bra_EBF6
C - - - - - 0x01EBFA 07:EBEA: A9 08     LDA #$08
C - - - - - 0x01EBFC 07:EBEC: 85 0E     STA ram_000E
C - - - - - 0x01EBFE 07:EBEE: A0 02     LDY #$02
C - - - - - 0x01EC00 07:EBF0: E6 68     INC ram_0068
bra_EBF2:
C - - - - - 0x01EC02 07:EBF2: E6 69     INC ram_0069
C - - - - - 0x01EC04 07:EBF4: A2 40     LDX #$40
bra_EBF6:
C - - - - - 0x01EC06 07:EBF6: 84 07     STY ram_0007
C - - - - - 0x01EC08 07:EBF8: A5 67     LDA ram_0067
C - - - - - 0x01EC0A 07:EBFA: 29 FC     AND #$FC
C - - - - - 0x01EC0C 07:EBFC: 85 05     STA ram_0005
C - - - - - 0x01EC0E 07:EBFE: 8A        TXA
C - - - - - 0x01EC0F 07:EBFF: 18        CLC
C - - - - - 0x01EC10 07:EC00: 65 66     ADC ram_0066
C - - - - - 0x01EC12 07:EC02: 85 66     STA ram_0066
C - - - - - 0x01EC14 07:EC04: A5 67     LDA ram_0067
C - - - - - 0x01EC16 07:EC06: 69 00     ADC #$00
C - - - - - 0x01EC18 07:EC08: 29 03     AND #$03
C - - - - - 0x01EC1A 07:EC0A: 05 05     ORA ram_0005
C - - - - - 0x01EC1C 07:EC0C: 85 67     STA ram_0067
C - - - - - 0x01EC1E 07:EC0E: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x01EC20 07:EC10: A9 06     LDA #con_buf_mode_06
C - - - - - 0x01EC22 07:EC12: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EC25 07:EC15: E8        INX
bra_EC16_loop:
C - - - - - 0x01EC26 07:EC16: 20 D7 EC  JSR sub_ECD7
C - - - - - 0x01EC29 07:EC19: 20 30 ED  JSR sub_ED30
C - - - - - 0x01EC2C 07:EC1C: A9 00     LDA #$00
C - - - - - 0x01EC2E 07:EC1E: 85 0F     STA ram_000F
bra_EC20_loop:
C - - - - - 0x01EC30 07:EC20: A4 0E     LDY ram_000E
C - - - - - 0x01EC32 07:EC22: B1 08     LDA (ram_0008),Y
C - - - - - 0x01EC34 07:EC24: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EC37 07:EC27: C8        INY
C - - - - - 0x01EC38 07:EC28: E8        INX
C - - - - - 0x01EC39 07:EC29: 84 0E     STY ram_000E
C - - - - - 0x01EC3B 07:EC2B: 85 0C     STA ram_000C
C - - - - - 0x01EC3D 07:EC2D: A5 07     LDA ram_0007
C - - - - - 0x01EC3F 07:EC2F: 05 06     ORA ram_0006
C - - - - - 0x01EC41 07:EC31: 4A        LSR
C - - - - - 0x01EC42 07:EC32: B0 09     BCS bra_EC3D
C - - - - - 0x01EC44 07:EC34: A5 0C     LDA ram_000C
C - - - - - 0x01EC46 07:EC36: 20 55 ED  JSR sub_ED55
C - - - - - 0x01EC49 07:EC39: 05 0F     ORA ram_000F
C - - - - - 0x01EC4B 07:EC3B: 85 0F     STA ram_000F
bra_EC3D:
C - - - - - 0x01EC4D 07:EC3D: C6 06     DEC ram_0006
C - - - - - 0x01EC4F 07:EC3F: D0 DF     BNE bra_EC20_loop
C - - - - - 0x01EC51 07:EC41: A5 07     LDA ram_0007
C - - - - - 0x01EC53 07:EC43: 4A        LSR
C - - - - - 0x01EC54 07:EC44: B0 07     BCS bra_EC4D
C - - - - - 0x01EC56 07:EC46: A5 0F     LDA ram_000F
C - - - - - 0x01EC58 07:EC48: A4 14     LDY ram_0014
C - - - - - 0x01EC5A 07:EC4A: 99 00 04  STA ram_0400,Y
bra_EC4D:
C - - - - - 0x01EC5D 07:EC4D: 20 EC EC  JSR sub_ECEC
C - - - - - 0x01EC60 07:EC50: D0 C4     BNE bra_EC16_loop
C - - - - - 0x01EC62 07:EC52: 20 1D ED  JSR sub_ED1D
C - - - - - 0x01EC65 07:EC55: A4 0D     LDY ram_000D
C - - - - - 0x01EC67 07:EC57: B1 36     LDA (ram_0036),Y
C - - - - - 0x01EC69 07:EC59: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EC6C 07:EC5C: E8        INX
C - - - - - 0x01EC6D 07:EC5D: A5 69     LDA ram_0069
C - - - - - 0x01EC6F 07:EC5F: F0 4B     BEQ bra_ECAC
C - - - - - 0x01EC71 07:EC61: A5 6A     LDA ram_006A
C - - - - - 0x01EC73 07:EC63: F0 22     BEQ bra_EC87
C - - - - - 0x01EC75 07:EC65: BD FF 02  LDA ram_nmt_buffer - $01,X
C - - - - - 0x01EC78 07:EC68: 29 F0     AND #$F0
C - - - - - 0x01EC7A 07:EC6A: 8D C8 03  STA ram_03C8
C - - - - - 0x01EC7D 07:EC6D: A0 03     LDY #$03
bra_EC6F_loop:
C - - - - - 0x01EC7F 07:EC6F: BD FB 02  LDA ram_nmt_buffer - $05,X
C - - - - - 0x01EC82 07:EC72: 99 C4 03  STA ram_03C0 + $04,Y
C - - - - - 0x01EC85 07:EC75: CA        DEX
C - - - - - 0x01EC86 07:EC76: 88        DEY
C - - - - - 0x01EC87 07:EC77: 10 F6     BPL bra_EC6F_loop
C - - - - - 0x01EC89 07:EC79: A0 03     LDY #$03
bra_EC7B_loop:
C - - - - - 0x01EC8B 07:EC7B: BD F8 02  LDA ram_nmt_buffer - $08,X
C - - - - - 0x01EC8E 07:EC7E: 99 C0 03  STA ram_03C0,Y
C - - - - - 0x01EC91 07:EC81: CA        DEX
C - - - - - 0x01EC92 07:EC82: 88        DEY
C - - - - - 0x01EC93 07:EC83: 10 F6     BPL bra_EC7B_loop
C - - - - - 0x01EC95 07:EC85: 30 4F     BMI bra_ECD6_RTS    ; jmp
bra_EC87:
C - - - - - 0x01EC97 07:EC87: BD FF 02  LDA ram_nmt_buffer - $01,X
C - - - - - 0x01EC9A 07:EC8A: 29 0F     AND #$0F
C - - - - - 0x01EC9C 07:EC8C: 0D C8 03  ORA ram_03C8
C - - - - - 0x01EC9F 07:EC8F: 9D FF 02  STA ram_nmt_buffer - $01,X
C - - - - - 0x01ECA2 07:EC92: A9 02     LDA #$02
C - - - - - 0x01ECA4 07:EC94: 85 07     STA ram_0007
C - - - - - 0x01ECA6 07:EC96: A0 00     LDY #$00
bra_EC98_loop:
C - - - - - 0x01ECA8 07:EC98: 20 D7 EC  JSR sub_ECD7
bra_EC9B_loop:
C - - - - - 0x01ECAB 07:EC9B: B9 C0 03  LDA ram_03C0,Y
C - - - - - 0x01ECAE 07:EC9E: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01ECB1 07:ECA1: C8        INY
C - - - - - 0x01ECB2 07:ECA2: E8        INX
C - - - - - 0x01ECB3 07:ECA3: C6 06     DEC ram_0006
C - - - - - 0x01ECB5 07:ECA5: D0 F4     BNE bra_EC9B_loop
C - - - - - 0x01ECB7 07:ECA7: 20 EC EC  JSR sub_ECEC
C - - - - - 0x01ECBA 07:ECAA: D0 EC     BNE bra_EC98_loop
bra_ECAC:
; close buffer
C - - - - - 0x01ECBC 07:ECAC: A9 FF     LDA #$FF
C - - - - - 0x01ECBE 07:ECAE: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01ECC1 07:ECB1: E8        INX
C - - - - - 0x01ECC2 07:ECB2: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x01ECC4 07:ECB4: C6 6A     DEC ram_006A
C - - - - - 0x01ECC6 07:ECB6: 10 1E     BPL bra_ECD6_RTS
C - - - - - 0x01ECC8 07:ECB8: A5 64     LDA ram_0064
C - - - - - 0x01ECCA 07:ECBA: 18        CLC
C - - - - - 0x01ECCB 07:ECBB: 69 04     ADC #$04
C - - - - - 0x01ECCD 07:ECBD: C9 20     CMP #$20
C - - - - - 0x01ECCF 07:ECBF: 90 04     BCC bra_ECC5
C - - - - - 0x01ECD1 07:ECC1: E6 65     INC ram_0065
C - - - - - 0x01ECD3 07:ECC3: A9 00     LDA #$00
bra_ECC5:
C - - - - - 0x01ECD5 07:ECC5: 85 64     STA ram_0064
C - - - - - 0x01ECD7 07:ECC7: A9 00     LDA #$00
C - - - - - 0x01ECD9 07:ECC9: 85 60     STA ram_0060_unk
C - - - - - 0x01ECDB 07:ECCB: A5 6B     LDA ram_006B
C - - - - - 0x01ECDD 07:ECCD: 18        CLC
C - - - - - 0x01ECDE 07:ECCE: 69 20     ADC #$20
C - - - - - 0x01ECE0 07:ECD0: 85 6B     STA ram_006B
C - - - - - 0x01ECE2 07:ECD2: 90 02     BCC bra_ECD6_RTS
C - - - - - 0x01ECE4 07:ECD4: E6 6C     INC ram_006C
bra_ECD6_RTS:
C - - - - - 0x01ECE6 07:ECD6: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_ECD7:
C - - - - - 0x01ECE7 07:ECD7: A5 01     LDA ram_0001    ; ppu hi
C - - - - - 0x01ECE9 07:ECD9: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01ECEC 07:ECDC: E8        INX
C - - - - - 0x01ECED 07:ECDD: A5 00     LDA ram_0000    ; ppu lo
C - - - - - 0x01ECEF 07:ECDF: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01ECF2 07:ECE2: E8        INX
C - - - - - 0x01ECF3 07:ECE3: A9 04     LDA #$04    ; counter
C - - - - - 0x01ECF5 07:ECE5: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01ECF8 07:ECE8: 85 06     STA ram_0006
C - - - - - 0x01ECFA 07:ECEA: E8        INX
C - - - - - 0x01ECFB 07:ECEB: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_ECEC:
C - - - - - 0x01ECFC 07:ECEC: A5 00     LDA ram_0000
C - - - - - 0x01ECFE 07:ECEE: 18        CLC
C - - - - - 0x01ECFF 07:ECEF: 69 20     ADC #$20
C - - - - - 0x01ED01 07:ECF1: 85 00     STA ram_0000
C - - - - - 0x01ED03 07:ECF3: 90 02     BCC bra_ECF7_not_overflow
C - - - - - 0x01ED05 07:ECF5: E6 01     INC ram_0001
bra_ECF7_not_overflow:
C - - - - - 0x01ED07 07:ECF7: C6 07     DEC ram_0007
C - - - - - 0x01ED09 07:ECF9: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_ECFA:
C - - - - - 0x01ED0A 07:ECFA: A5 01     LDA ram_0001
C - - - - - 0x01ED0C 07:ECFC: 29 03     AND #$03
C - - - - - 0x01ED0E 07:ECFE: 85 12     STA ram_0012
C - - - - - 0x01ED10 07:ED00: A5 00     LDA ram_0000
C - - - - - 0x01ED12 07:ED02: 0A        ASL
C - - - - - 0x01ED13 07:ED03: 26 12     ROL ram_0012
C - - - - - 0x01ED15 07:ED05: 0A        ASL
C - - - - - 0x01ED16 07:ED06: 0A        ASL
C - - - - - 0x01ED17 07:ED07: 0A        ASL
C - - - - - 0x01ED18 07:ED08: 26 12     ROL ram_0012
C - - - - - 0x01ED1A 07:ED0A: 0A        ASL
C - - - - - 0x01ED1B 07:ED0B: 26 12     ROL ram_0012
C - - - - - 0x01ED1D 07:ED0D: 0A        ASL
C - - - - - 0x01ED1E 07:ED0E: 26 12     ROL ram_0012
C - - - - - 0x01ED20 07:ED10: A5 01     LDA ram_0001
C - - - - - 0x01ED22 07:ED12: 09 03     ORA #$03
C - - - - - 0x01ED24 07:ED14: 85 13     STA ram_0013
C - - - - - 0x01ED26 07:ED16: A5 12     LDA ram_0012
C - - - - - 0x01ED28 07:ED18: 09 C0     ORA #$C0
C - - - - - 0x01ED2A 07:ED1A: 85 12     STA ram_0012
C - - - - - 0x01ED2C 07:ED1C: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_ED1D:
C - - - - - 0x01ED2D 07:ED1D: A5 13     LDA ram_0013    ; ppu hi
C - - - - - 0x01ED2F 07:ED1F: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01ED32 07:ED22: E8        INX
C - - - - - 0x01ED33 07:ED23: A5 12     LDA ram_0012    ; ppu lo
C - - - - - 0x01ED35 07:ED25: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01ED38 07:ED28: E8        INX
C - - - - - 0x01ED39 07:ED29: A9 01     LDA #$01    ; counter
C - - - - - 0x01ED3B 07:ED2B: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01ED3E 07:ED2E: E8        INX
C - - - - - 0x01ED3F 07:ED2F: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_ED30:
C - - - - - 0x01ED40 07:ED30: A9 00     LDA #$00
C - - - - - 0x01ED42 07:ED32: 85 15     STA ram_0015
C - - - - - 0x01ED44 07:ED34: A5 01     LDA ram_0001
C - - - - - 0x01ED46 07:ED36: 85 14     STA ram_0014
C - - - - - 0x01ED48 07:ED38: A5 00     LDA ram_0000
C - - - - - 0x01ED4A 07:ED3A: 0A        ASL
C - - - - - 0x01ED4B 07:ED3B: 26 14     ROL ram_0014
C - - - - - 0x01ED4D 07:ED3D: 0A        ASL
C - - - - - 0x01ED4E 07:ED3E: 26 14     ROL ram_0014
C - - - - - 0x01ED50 07:ED40: 0A        ASL
C - - - - - 0x01ED51 07:ED41: 46 14     LSR ram_0014
C - - - - - 0x01ED53 07:ED43: 6A        ROR
C - - - - - 0x01ED54 07:ED44: 46 14     LSR ram_0014
C - - - - - 0x01ED56 07:ED46: 6A        ROR
C - - - - - 0x01ED57 07:ED47: 46 14     LSR ram_0014
C - - - - - 0x01ED59 07:ED49: 6A        ROR
C - - - - - 0x01ED5A 07:ED4A: 46 14     LSR ram_0014
C - - - - - 0x01ED5C 07:ED4C: 6A        ROR
C - - - - - 0x01ED5D 07:ED4D: 46 14     LSR ram_0014
C - - - - - 0x01ED5F 07:ED4F: 6A        ROR
C - - - - - 0x01ED60 07:ED50: 66 15     ROR ram_0015
C - - - - - 0x01ED62 07:ED52: 85 14     STA ram_0014
C - - - - - 0x01ED64 07:ED54: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_ED55:
C - - - - - 0x01ED65 07:ED55: A0 00     LDY #$00
C - - - - - 0x01ED67 07:ED57: C9 FF     CMP #$FF
C - - - - - 0x01ED69 07:ED59: F0 08     BEQ bra_ED63
bra_ED5B_loop:
C - - - - - 0x01ED6B 07:ED5B: D9 D0 03  CMP ram_03D0,Y
C - - - - - 0x01ED6E 07:ED5E: 90 03     BCC bra_ED63
C - - - - - 0x01ED70 07:ED60: C8        INY
C - - - - - 0x01ED71 07:ED61: B0 F8     BCS bra_ED5B_loop    ; jmp
bra_ED63:
C - - - - - 0x01ED73 07:ED63: A5 06     LDA ram_0006
C - - - - - 0x01ED75 07:ED65: E9 00     SBC #$00
C - - - - - 0x01ED77 07:ED67: 4A        LSR
C - - - - - 0x01ED78 07:ED68: 4A        LSR
C - - - - - 0x01ED79 07:ED69: 98        TYA
C - - - - - 0x01ED7A 07:ED6A: 90 03     BCC bra_ED6F_RTS
C - - - - - 0x01ED7C 07:ED6C: B9 70 ED  LDA tbl_ED70,Y
bra_ED6F_RTS:
C - - - - - 0x01ED7F 07:ED6F: 60        RTS

tbl_ED70:
- D 3 - - - 0x01ED80 07:ED70: 00        .byte $00   ; 
- D 3 - - - 0x01ED81 07:ED71: 10        .byte $10   ; 
- D 3 - - - 0x01ED82 07:ED72: 20        .byte $20   ; 
- D 3 - - - 0x01ED83 07:ED73: 30        .byte $30   ; 
- D 3 - - - 0x01ED84 07:ED74: 40        .byte $40   ; 
- - - - - - 0x01ED85 07:ED75: 50        .byte $50   ; 
- D 3 - - - 0x01ED86 07:ED76: 60        .byte $60   ; 
- D 3 - - - 0x01ED87 07:ED77: 70        .byte $70   ; 
- D 3 - - - 0x01ED88 07:ED78: 80        .byte $80   ; 
- - - - - - 0x01ED89 07:ED79: 90        .byte $90   ; 
- D 3 - - - 0x01ED8A 07:ED7A: A0        .byte $A0   ; 
- D 3 - - - 0x01ED8B 07:ED7B: B0        .byte $B0   ; 
- - - - - - 0x01ED8C 07:ED7C: C0        .byte $C0   ; 
- - - - - - 0x01ED8D 07:ED7D: D0        .byte $D0   ; 
- - - - - - 0x01ED8E 07:ED7E: E0        .byte $E0   ; 
- - - - - - 0x01ED8F 07:ED7F: F0        .byte $F0   ; 

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_ED80:
                                        LDY ram_0070
                                        LDA tbl_ED85_lo,y
                                        STA ram_0000
                                        LDA tbl_ED86_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_ED85_lo:
- D 3 - I - 0x01ED95 07:ED85: 3D EE     .byte < _общий_RTS ; 00
- D 3 - I - 0x01ED97 07:ED87: 8C ED     .byte < ofs_036_ED8C_01
- D 3 - I - 0x01ED99 07:ED89: C7 ED     .byte < ofs_036_EDC7_02
tbl_ED86_hi:
- D 3 - I - 0x01ED95 07:ED85: 3D EE     .byte > _общий_RTS ; 00
- D 3 - I - 0x01ED97 07:ED87: 8C ED     .byte > ofs_036_ED8C_01
- D 3 - I - 0x01ED99 07:ED89: C7 ED     .byte > ofs_036_EDC7_02

; _________________________________________________________________________________________________________________

ofs_036_ED8C_01:
C - - J - - 0x01ED9C 07:ED8C: 20 92 ED  JSR sub_ED92
C - - - - - 0x01ED9F 07:ED8F: 4C 62 EF  JMP loc_EF62

; ******************************************************************************************************************

sub_ED92:
C - - - - - 0x01EDA2 07:ED92: E6 70     INC ram_0070
C - - - - - 0x01EDA4 07:ED94: A5 FD     LDA ram_scroll_X
C - - - - - 0x01EDA6 07:ED96: 85 78     STA ram_0078
C - - - - - 0x01EDA8 07:ED98: A5 FF     LDA ram_for_2000
C - - - - - 0x01EDAA 07:ED9A: 85 83     STA ram_0083
C - - - - - 0x01EDAC 07:ED9C: A5 60     LDA ram_0060_unk
C - - - - - 0x01EDAE 07:ED9E: F0 04     BEQ bra_EDA4
C - - - - - 0x01EDB0 07:EDA0: A9 01     LDA #$01
C - - - - - 0x01EDB2 07:EDA2: 85 60     STA ram_0060_unk
bra_EDA4:
C - - - - - 0x01EDB4 07:EDA4: A5 73     LDA ram_0073
C - - - - - 0x01EDB6 07:EDA6: 20 3E EE  JSR sub_EE3E
C - - - - - 0x01EDB9 07:EDA9: A4 74     LDY ram_0074_конфиг_уровня
C - - - - - 0x01EDBB 07:EDAB: A5 77     LDA ram_0077
C - - - - - 0x01EDBD 07:EDAD: F0 01     BEQ bra_EDB0
C - - - - - 0x01EDBF 07:EDAF: C8        INY
bra_EDB0:
C - - - - - 0x01EDC0 07:EDB0: 84 11     STY ram_0011
C - - - - - 0x01EDC2 07:EDB2: A9 00     LDA #$00
C - - - - - 0x01EDC4 07:EDB4: A4 11     LDY ram_0011
C - - - - - 0x01EDC6 07:EDB6: F0 06     BEQ bra_EDBE
bra_EDB8_loop:
C - - - - - 0x01EDC8 07:EDB8: 18        CLC
C - - - - - 0x01EDC9 07:EDB9: 65 89     ADC ram_0089_столбцы_данных_уровня
C - - - - - 0x01EDCB 07:EDBB: 88        DEY
C - - - - - 0x01EDCC 07:EDBC: D0 FA     BNE bra_EDB8_loop
bra_EDBE:
C - - - - - 0x01EDCE 07:EDBE: 18        CLC
C - - - - - 0x01EDCF 07:EDBF: 65 63     ADC ram_0063
C - - - - - 0x01EDD1 07:EDC1: 85 79     STA ram_0079
C - - - - - 0x01EDD3 07:EDC3: A0 00     LDY #$00
C - - - - - 0x01EDD5 07:EDC5: F0 0E     BEQ bra_EDD5    ; jmp

; _________________________________________________________________________________________________________________

ofs_036_EDC7_02:
C - - J - - 0x01EDD7 07:EDC7: A9 00     LDA #$00
C - - - - - 0x01EDD9 07:EDC9: 85 70     STA ram_0070
C - - - - - 0x01EDDB 07:EDCB: A5 73     LDA ram_0073
C - - - - - 0x01EDDD 07:EDCD: 18        CLC
C - - - - - 0x01EDDE 07:EDCE: 69 01     ADC #$01
C - - - - - 0x01EDE0 07:EDD0: 20 3E EE  JSR sub_EE3E
C - - - - - 0x01EDE3 07:EDD3: A0 04     LDY #$04
bra_EDD5:
C - - - - - 0x01EDE5 07:EDD5: 84 10     STY ram_0010
C - - - - - 0x01EDE7 07:EDD7: A5 73     LDA ram_0073
C - - - - - 0x01EDE9 07:EDD9: 29 03     AND #$03
C - - - - - 0x01EDEB 07:EDDB: F0 06     BEQ bra_EDE3
C - - - - - 0x01EDED 07:EDDD: 98        TYA
C - - - - - 0x01EDEE 07:EDDE: 18        CLC
C - - - - - 0x01EDEF 07:EDDF: 69 08     ADC #$08
C - - - - - 0x01EDF1 07:EDE1: 85 10     STA ram_0010
bra_EDE3:
C - - - - - 0x01EDF3 07:EDE3: 20 30 ED  JSR sub_ED30
C - - - - - 0x01EDF6 07:EDE6: A5 79     LDA ram_0079
C - - - - - 0x01EDF8 07:EDE8: 85 11     STA ram_0011
C - - - - - 0x01EDFA 07:EDEA: A4 02     LDY ram_0002
C - - - - - 0x01EDFC 07:EDEC: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x01EDFE 07:EDEE: A9 06     LDA #con_buf_mode_06
C - - - - - 0x01EE00 07:EDF0: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EE03 07:EDF3: E8        INX
C - - - - - 0x01EE04 07:EDF4: A5 78     LDA ram_0078
C - - - - - 0x01EE06 07:EDF6: 20 97 EE  JSR sub_EE97
C - - - - - 0x01EE09 07:EDF9: A9 00     LDA #$00
C - - - - - 0x01EE0B 07:EDFB: 85 15     STA ram_0015
C - - - - - 0x01EE0D 07:EDFD: A5 14     LDA ram_0014
C - - - - - 0x01EE0F 07:EDFF: 29 F8     AND #$F8
C - - - - - 0x01EE11 07:EE01: 49 80     EOR #$80
C - - - - - 0x01EE13 07:EE03: 85 14     STA ram_0014
C - - - - - 0x01EE15 07:EE05: E6 11     INC ram_0011
C - - - - - 0x01EE17 07:EE07: A4 03     LDY ram_0003
C - - - - - 0x01EE19 07:EE09: F0 32     BEQ bra_EE3D_RTS
C - - - - - 0x01EE1B 07:EE0B: A5 00     LDA ram_0000
C - - - - - 0x01EE1D 07:EE0D: 29 E0     AND #$E0
C - - - - - 0x01EE1F 07:EE0F: 85 00     STA ram_0000
C - - - - - 0x01EE21 07:EE11: A5 01     LDA ram_0001
C - - - - - 0x01EE23 07:EE13: 49 04     EOR #$04
C - - - - - 0x01EE25 07:EE15: 85 01     STA ram_0001
C - - - - - 0x01EE27 07:EE17: CA        DEX
C - - - - - 0x01EE28 07:EE18: 20 95 EE  JSR sub_EE95
C - - - - - 0x01EE2B 07:EE1B: A9 00     LDA #$00
C - - - - - 0x01EE2D 07:EE1D: 85 15     STA ram_0015
C - - - - - 0x01EE2F 07:EE1F: A5 14     LDA ram_0014
C - - - - - 0x01EE31 07:EE21: 29 F8     AND #$F8
C - - - - - 0x01EE33 07:EE23: 49 80     EOR #$80
C - - - - - 0x01EE35 07:EE25: 85 14     STA ram_0014
C - - - - - 0x01EE37 07:EE27: E6 11     INC ram_0011
C - - - - - 0x01EE39 07:EE29: A4 04     LDY ram_0004
C - - - - - 0x01EE3B 07:EE2B: F0 10     BEQ bra_EE3D_RTS
C - - - - - 0x01EE3D 07:EE2D: A5 00     LDA ram_0000
C - - - - - 0x01EE3F 07:EE2F: 29 E0     AND #$E0
C - - - - - 0x01EE41 07:EE31: 85 00     STA ram_0000
C - - - - - 0x01EE43 07:EE33: A5 01     LDA ram_0001
C - - - - - 0x01EE45 07:EE35: 49 04     EOR #$04
C - - - - - 0x01EE47 07:EE37: 85 01     STA ram_0001
C - - - - - 0x01EE49 07:EE39: CA        DEX
C - - - - - 0x01EE4A 07:EE3A: 20 95 EE  JSR sub_EE95
bra_EE3D_RTS:
C - - J - - 0x01EE4D 07:EE3D: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_EE3E:
C - - - - - 0x01EE4E 07:EE3E: 85 00     STA ram_0000
C - - - - - 0x01EE50 07:EE40: A5 61     LDA ram_0061_конфиг_уровня
C - - - - - 0x01EE52 07:EE42: 4A        LSR
C - - - - - 0x01EE53 07:EE43: A9 08     LDA #$08
C - - - - - 0x01EE55 07:EE45: 90 02     BCC bra_EE49
C - - - - - 0x01EE57 07:EE47: A9 00     LDA #$00
bra_EE49:
C - - - - - 0x01EE59 07:EE49: 85 04     STA ram_0004
C - - - - - 0x01EE5B 07:EE4B: A5 83     LDA ram_0083
C - - - - - 0x01EE5D 07:EE4D: 4A        LSR
C - - - - - 0x01EE5E 07:EE4E: A9 20     LDA #$20
C - - - - - 0x01EE60 07:EE50: 90 02     BCC bra_EE54
C - - - - - 0x01EE62 07:EE52: A9 2C     LDA #$2C
bra_EE54:
C - - - - - 0x01EE64 07:EE54: 85 01     STA ram_0001
C - - - - - 0x01EE66 07:EE56: A9 00     LDA #$00
C - - - - - 0x01EE68 07:EE58: 06 00     ASL ram_0000
C - - - - - 0x01EE6A 07:EE5A: 2A        ROL
C - - - - - 0x01EE6B 07:EE5B: 06 00     ASL ram_0000
C - - - - - 0x01EE6D 07:EE5D: 2A        ROL
C - - - - - 0x01EE6E 07:EE5E: 06 00     ASL ram_0000
C - - - - - 0x01EE70 07:EE60: 2A        ROL
C - - - - - 0x01EE71 07:EE61: 06 00     ASL ram_0000
C - - - - - 0x01EE73 07:EE63: 2A        ROL
C - - - - - 0x01EE74 07:EE64: 06 00     ASL ram_0000
C - - - - - 0x01EE76 07:EE66: 2A        ROL
C - - - - - 0x01EE77 07:EE67: 05 01     ORA ram_0001
C - - - - - 0x01EE79 07:EE69: 85 01     STA ram_0001
C - - - - - 0x01EE7B 07:EE6B: A5 78     LDA ram_0078
C - - - - - 0x01EE7D 07:EE6D: 4A        LSR
C - - - - - 0x01EE7E 07:EE6E: 4A        LSR
C - - - - - 0x01EE7F 07:EE6F: 4A        LSR
C - - - - - 0x01EE80 07:EE70: 85 03     STA ram_0003
C - - - - - 0x01EE82 07:EE72: A9 20     LDA #$20
C - - - - - 0x01EE84 07:EE74: 38        SEC
C - - - - - 0x01EE85 07:EE75: E5 03     SBC ram_0003
C - - - - - 0x01EE87 07:EE77: 85 02     STA ram_0002
C - - - - - 0x01EE89 07:EE79: A5 00     LDA ram_0000
C - - - - - 0x01EE8B 07:EE7B: 18        CLC
C - - - - - 0x01EE8C 07:EE7C: 65 03     ADC ram_0003
C - - - - - 0x01EE8E 07:EE7E: 85 00     STA ram_0000
C - - - - - 0x01EE90 07:EE80: A0 00     LDY #$00
C - - - - - 0x01EE92 07:EE82: A5 03     LDA ram_0003
C - - - - - 0x01EE94 07:EE84: 18        CLC
C - - - - - 0x01EE95 07:EE85: 65 04     ADC ram_0004
C - - - - - 0x01EE97 07:EE87: C9 20     CMP #$20
C - - - - - 0x01EE99 07:EE89: 90 05     BCC bra_EE90
C - - - - - 0x01EE9B 07:EE8B: E9 20     SBC #$20
C - - - - - 0x01EE9D 07:EE8D: A8        TAY
C - - - - - 0x01EE9E 07:EE8E: A9 20     LDA #$20
bra_EE90:
C - - - - - 0x01EEA0 07:EE90: 85 03     STA ram_0003
C - - - - - 0x01EEA2 07:EE92: 84 04     STY ram_0004
C - - - - - 0x01EEA4 07:EE94: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_EE95:
C - - - - - 0x01EEA5 07:EE95: A9 00     LDA #$00
sub_EE97:
C - - - - - 0x01EEA7 07:EE97: 85 17     STA ram_0017
C - - - - - 0x01EEA9 07:EE99: A5 01     LDA ram_0001    ; ppu hi
C - - - - - 0x01EEAB 07:EE9B: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EEAE 07:EE9E: E8        INX
C - - - - - 0x01EEAF 07:EE9F: A5 00     LDA ram_0000    ; ppu lo
C - - - - - 0x01EEB1 07:EEA1: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EEB4 07:EEA4: E8        INX
C - - - - - 0x01EEB5 07:EEA5: 84 05     STY ram_0005    ; counter
C - - - - - 0x01EEB7 07:EEA7: 98        TYA
C - - - - - 0x01EEB8 07:EEA8: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EEBB 07:EEAB: E8        INX
C - - - - - 0x01EEBC 07:EEAC: A4 11     LDY ram_0011
C - - - - - 0x01EEBE 07:EEAE: B1 30     LDA (ram_0030),Y
C - - - - - 0x01EEC0 07:EEB0: 0A        ASL
C - - - - - 0x01EEC1 07:EEB1: A8        TAY
C - - - - - 0x01EEC2 07:EEB2: B1 32     LDA (ram_0032),Y
C - - - - - 0x01EEC4 07:EEB4: 85 0A     STA ram_000A
C - - - - - 0x01EEC6 07:EEB6: C8        INY
C - - - - - 0x01EEC7 07:EEB7: B1 32     LDA (ram_0032),Y
C - - - - - 0x01EEC9 07:EEB9: 85 0B     STA ram_000B
C - - - - - 0x01EECB 07:EEBB: A5 17     LDA ram_0017
C - - - - - 0x01EECD 07:EEBD: 4A        LSR
C - - - - - 0x01EECE 07:EEBE: 4A        LSR
C - - - - - 0x01EECF 07:EEBF: 4A        LSR
C - - - - - 0x01EED0 07:EEC0: 85 0F     STA ram_000F
C - - - - - 0x01EED2 07:EEC2: 29 03     AND #$03
C - - - - - 0x01EED4 07:EEC4: 85 07     STA ram_0007
C - - - - - 0x01EED6 07:EEC6: A9 04     LDA #$04
C - - - - - 0x01EED8 07:EEC8: 38        SEC
C - - - - - 0x01EED9 07:EEC9: E5 07     SBC ram_0007
C - - - - - 0x01EEDB 07:EECB: 85 06     STA ram_0006
C - - - - - 0x01EEDD 07:EECD: A5 0F     LDA ram_000F
C - - - - - 0x01EEDF 07:EECF: 4A        LSR
C - - - - - 0x01EEE0 07:EED0: 4A        LSR
C - - - - - 0x01EEE1 07:EED1: 85 0F     STA ram_000F
C - - - - - 0x01EEE3 07:EED3: A5 73     LDA ram_0073
C - - - - - 0x01EEE5 07:EED5: 29 FC     AND #$FC
C - - - - - 0x01EEE7 07:EED7: 0A        ASL
C - - - - - 0x01EEE8 07:EED8: 18        CLC
C - - - - - 0x01EEE9 07:EED9: 65 0F     ADC ram_000F
C - - - - - 0x01EEEB 07:EEDB: 85 0F     STA ram_000F
bra_EEDD_loop:
C - - - - - 0x01EEED 07:EEDD: A9 00     LDA #$00
C - - - - - 0x01EEEF 07:EEDF: 85 0C     STA ram_000C
C - - - - - 0x01EEF1 07:EEE1: A4 0F     LDY ram_000F
C - - - - - 0x01EEF3 07:EEE3: B1 0A     LDA (ram_000A),Y
C - - - - - 0x01EEF5 07:EEE5: 0A        ASL
C - - - - - 0x01EEF6 07:EEE6: 26 0C     ROL ram_000C
C - - - - - 0x01EEF8 07:EEE8: 0A        ASL
C - - - - - 0x01EEF9 07:EEE9: 26 0C     ROL ram_000C
C - - - - - 0x01EEFB 07:EEEB: 0A        ASL
C - - - - - 0x01EEFC 07:EEEC: 26 0C     ROL ram_000C
C - - - - - 0x01EEFE 07:EEEE: 0A        ASL
C - - - - - 0x01EEFF 07:EEEF: 26 0C     ROL ram_000C
C - - - - - 0x01EF01 07:EEF1: 18        CLC
C - - - - - 0x01EF02 07:EEF2: 65 34     ADC ram_0034
C - - - - - 0x01EF04 07:EEF4: 85 08     STA ram_0008
C - - - - - 0x01EF06 07:EEF6: A5 0C     LDA ram_000C
C - - - - - 0x01EF08 07:EEF8: 65 35     ADC ram_0035
C - - - - - 0x01EF0A 07:EEFA: 85 09     STA ram_0009
C - - - - - 0x01EF0C 07:EEFC: A5 10     LDA ram_0010
C - - - - - 0x01EF0E 07:EEFE: 18        CLC
C - - - - - 0x01EF0F 07:EEFF: 65 07     ADC ram_0007
C - - - - - 0x01EF11 07:EF01: 85 16     STA ram_0016
bra_EF03_loop:
C - - - - - 0x01EF13 07:EF03: A4 16     LDY ram_0016
C - - - - - 0x01EF15 07:EF05: B1 08     LDA (ram_0008),Y
C - - - - - 0x01EF17 07:EF07: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EF1A 07:EF0A: E8        INX
C - - - - - 0x01EF1B 07:EF0B: C8        INY
C - - - - - 0x01EF1C 07:EF0C: 84 16     STY ram_0016
C - - - - - 0x01EF1E 07:EF0E: 85 0D     STA ram_000D
C - - - - - 0x01EF20 07:EF10: A5 10     LDA ram_0010
C - - - - - 0x01EF22 07:EF12: 29 04     AND #$04
C - - - - - 0x01EF24 07:EF14: D0 2D     BNE bra_EF43
C - - - - - 0x01EF26 07:EF16: A5 06     LDA ram_0006
C - - - - - 0x01EF28 07:EF18: 4A        LSR
C - - - - - 0x01EF29 07:EF19: 90 0D     BCC bra_EF28
C - - - - - 0x01EF2B 07:EF1B: A5 15     LDA ram_0015
C - - - - - 0x01EF2D 07:EF1D: 49 80     EOR #$80
C - - - - - 0x01EF2F 07:EF1F: 85 15     STA ram_0015
C - - - - - 0x01EF31 07:EF21: 30 02     BMI bra_EF25
C - - - - - 0x01EF33 07:EF23: E6 14     INC ram_0014
bra_EF25:
C - - - - - 0x01EF35 07:EF25: 4C 43 EF  JMP loc_EF43
bra_EF28:
C - - - - - 0x01EF38 07:EF28: A5 0D     LDA ram_000D
C - - - - - 0x01EF3A 07:EF2A: 20 55 ED  JSR sub_ED55
C - - - - - 0x01EF3D 07:EF2D: 85 0D     STA ram_000D
C - - - - - 0x01EF3F 07:EF2F: A5 15     LDA ram_0015
C - - - - - 0x01EF41 07:EF31: 2A        ROL
C - - - - - 0x01EF42 07:EF32: 2A        ROL
C - - - - - 0x01EF43 07:EF33: 29 01     AND #$01
C - - - - - 0x01EF45 07:EF35: A8        TAY
C - - - - - 0x01EF46 07:EF36: B9 92 F0  LDA tbl_F092,Y
C - - - - - 0x01EF49 07:EF39: A4 14     LDY ram_0014
C - - - - - 0x01EF4B 07:EF3B: 39 00 04  AND ram_0400,Y
C - - - - - 0x01EF4E 07:EF3E: 05 0D     ORA ram_000D
C - - - - - 0x01EF50 07:EF40: 99 00 04  STA ram_0400,Y
bra_EF43:
loc_EF43:
C D 3 - - - 0x01EF53 07:EF43: C6 05     DEC ram_0005
C - - - - - 0x01EF55 07:EF45: F0 10     BEQ bra_EF57
C - - - - - 0x01EF57 07:EF47: C6 06     DEC ram_0006
C - - - - - 0x01EF59 07:EF49: D0 B8     BNE bra_EF03_loop
C - - - - - 0x01EF5B 07:EF4B: E6 0F     INC ram_000F
C - - - - - 0x01EF5D 07:EF4D: A9 00     LDA #$00
C - - - - - 0x01EF5F 07:EF4F: 85 07     STA ram_0007
C - - - - - 0x01EF61 07:EF51: A9 04     LDA #$04
C - - - - - 0x01EF63 07:EF53: 85 06     STA ram_0006
C - - - - - 0x01EF65 07:EF55: D0 86     BNE bra_EEDD_loop    ; jmp
bra_EF57:
C - - - - - 0x01EF67 07:EF57: C6 14     DEC ram_0014
; close buffer
C - - - - - 0x01EF69 07:EF59: A9 FF     LDA #$FF
C - - - - - 0x01EF6B 07:EF5B: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EF6E 07:EF5E: E8        INX
C - - - - - 0x01EF6F 07:EF5F: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x01EF71 07:EF61: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

loc_EF62:
C D 3 - - - 0x01EF72 07:EF62: A5 73     LDA ram_0073
C - - - - - 0x01EF74 07:EF64: 4A        LSR
C - - - - - 0x01EF75 07:EF65: 45 77     EOR ram_0077
C - - - - - 0x01EF77 07:EF67: 4A        LSR
C - - - - - 0x01EF78 07:EF68: A0 F0     LDY #$F0
C - - - - - 0x01EF7A 07:EF6A: A2 0F     LDX #$0F
C - - - - - 0x01EF7C 07:EF6C: A9 00     LDA #$00
C - - - - - 0x01EF7E 07:EF6E: 90 0F     BCC bra_EF7F
C - - - - - 0x01EF80 07:EF70: A5 77     LDA ram_0077
C - - - - - 0x01EF82 07:EF72: 4A        LSR
C - - - - - 0x01EF83 07:EF73: A5 89     LDA ram_0089_столбцы_данных_уровня
C - - - - - 0x01EF85 07:EF75: 90 08     BCC bra_EF7F
C - - - - - 0x01EF87 07:EF77: 49 FF     EOR #$FF
C - - - - - 0x01EF89 07:EF79: 69 00     ADC #$00
C - - - - - 0x01EF8B 07:EF7B: A0 0F     LDY #$0F
C - - - - - 0x01EF8D 07:EF7D: A2 F0     LDX #$F0
bra_EF7F:
C - - - - - 0x01EF8F 07:EF7F: 85 14     STA ram_0014
C - - - - - 0x01EF91 07:EF81: 84 0C     STY ram_000C
C - - - - - 0x01EF93 07:EF83: 86 0D     STX ram_000D
C - - - - - 0x01EF95 07:EF85: A5 73     LDA ram_0073
C - - - - - 0x01EF97 07:EF87: 20 3E EE  JSR sub_EE3E
C - - - - - 0x01EF9A 07:EF8A: 20 FA EC  JSR sub_ECFA
C - - - - - 0x01EF9D 07:EF8D: A5 79     LDA ram_0079
C - - - - - 0x01EF9F 07:EF8F: 85 11     STA ram_0011
C - - - - - 0x01EFA1 07:EF91: A4 02     LDY ram_0002
C - - - - - 0x01EFA3 07:EF93: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x01EFA5 07:EF95: CA        DEX
C - - - - - 0x01EFA6 07:EF96: A5 78     LDA ram_0078
C - - - - - 0x01EFA8 07:EF98: 20 CA EF  JSR sub_EFCA
C - - - - - 0x01EFAB 07:EF9B: A4 03     LDY ram_0003
C - - - - - 0x01EFAD 07:EF9D: F0 28     BEQ bra_EFC7_RTS
C - - - - - 0x01EFAF 07:EF9F: E6 11     INC ram_0011
C - - - - - 0x01EFB1 07:EFA1: A5 12     LDA ram_0012
C - - - - - 0x01EFB3 07:EFA3: 29 F8     AND #$F8
C - - - - - 0x01EFB5 07:EFA5: 85 12     STA ram_0012
C - - - - - 0x01EFB7 07:EFA7: A5 13     LDA ram_0013
C - - - - - 0x01EFB9 07:EFA9: 49 04     EOR #$04
C - - - - - 0x01EFBB 07:EFAB: 85 13     STA ram_0013
C - - - - - 0x01EFBD 07:EFAD: CA        DEX
C - - - - - 0x01EFBE 07:EFAE: 20 C8 EF  JSR sub_EFC8
C - - - - - 0x01EFC1 07:EFB1: A4 04     LDY ram_0004
C - - - - - 0x01EFC3 07:EFB3: F0 12     BEQ bra_EFC7_RTS
C - - - - - 0x01EFC5 07:EFB5: E6 11     INC ram_0011
C - - - - - 0x01EFC7 07:EFB7: A5 12     LDA ram_0012
C - - - - - 0x01EFC9 07:EFB9: 29 F8     AND #$F8
C - - - - - 0x01EFCB 07:EFBB: 85 12     STA ram_0012
C - - - - - 0x01EFCD 07:EFBD: A5 13     LDA ram_0013
C - - - - - 0x01EFCF 07:EFBF: 49 04     EOR #$04
C - - - - - 0x01EFD1 07:EFC1: 85 13     STA ram_0013
C - - - - - 0x01EFD3 07:EFC3: CA        DEX
C - - - - - 0x01EFD4 07:EFC4: 20 C8 EF  JSR sub_EFC8
bra_EFC7_RTS:
C - - - - - 0x01EFD7 07:EFC7: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_EFC8:
C - - - - - 0x01EFD8 07:EFC8: A9 00     LDA #$00
sub_EFCA:
C - - - - - 0x01EFDA 07:EFCA: 85 17     STA ram_0017
C - - - - - 0x01EFDC 07:EFCC: 88        DEY
C - - - - - 0x01EFDD 07:EFCD: 98        TYA
C - - - - - 0x01EFDE 07:EFCE: 4A        LSR
C - - - - - 0x01EFDF 07:EFCF: 4A        LSR
C - - - - - 0x01EFE0 07:EFD0: A8        TAY
C - - - - - 0x01EFE1 07:EFD1: C8        INY
C - - - - - 0x01EFE2 07:EFD2: A5 13     LDA ram_0013    ; ppu hi
C - - - - - 0x01EFE4 07:EFD4: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EFE7 07:EFD7: E8        INX
C - - - - - 0x01EFE8 07:EFD8: A5 12     LDA ram_0012    ; ppu lo
C - - - - - 0x01EFEA 07:EFDA: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EFED 07:EFDD: E8        INX
C - - - - - 0x01EFEE 07:EFDE: 84 05     STY ram_0005    ; counter
C - - - - - 0x01EFF0 07:EFE0: 98        TYA
C - - - - - 0x01EFF1 07:EFE1: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01EFF4 07:EFE4: E8        INX
C - - - - - 0x01EFF5 07:EFE5: A4 11     LDY ram_0011
C - - - - - 0x01EFF7 07:EFE7: B1 30     LDA (ram_0030),Y
C - - - - - 0x01EFF9 07:EFE9: 0A        ASL
C - - - - - 0x01EFFA 07:EFEA: A8        TAY
C - - - - - 0x01EFFB 07:EFEB: B1 32     LDA (ram_0032),Y
C - - - - - 0x01EFFD 07:EFED: 85 0A     STA ram_000A
C - - - - - 0x01EFFF 07:EFEF: C8        INY
C - - - - - 0x01F000 07:EFF0: B1 32     LDA (ram_0032),Y
C - - - - - 0x01F002 07:EFF2: 85 0B     STA ram_000B
C - - - - - 0x01F004 07:EFF4: A5 11     LDA ram_0011
C - - - - - 0x01F006 07:EFF6: 18        CLC
C - - - - - 0x01F007 07:EFF7: 65 14     ADC ram_0014
C - - - - - 0x01F009 07:EFF9: A8        TAY
C - - - - - 0x01F00A 07:EFFA: B1 30     LDA (ram_0030),Y
C - - - - - 0x01F00C 07:EFFC: 0A        ASL
C - - - - - 0x01F00D 07:EFFD: A8        TAY
C - - - - - 0x01F00E 07:EFFE: B1 32     LDA (ram_0032),Y
C - - - - - 0x01F010 07:F000: 85 15     STA ram_0015
C - - - - - 0x01F012 07:F002: C8        INY
C - - - - - 0x01F013 07:F003: B1 32     LDA (ram_0032),Y
C - - - - - 0x01F015 07:F005: 85 16     STA ram_0016
C - - - - - 0x01F017 07:F007: A5 17     LDA ram_0017
C - - - - - 0x01F019 07:F009: 4A        LSR
C - - - - - 0x01F01A 07:F00A: 4A        LSR
C - - - - - 0x01F01B 07:F00B: 4A        LSR
C - - - - - 0x01F01C 07:F00C: 4A        LSR
C - - - - - 0x01F01D 07:F00D: 4A        LSR
C - - - - - 0x01F01E 07:F00E: 85 0F     STA ram_000F
C - - - - - 0x01F020 07:F010: A5 73     LDA ram_0073
C - - - - - 0x01F022 07:F012: 29 FC     AND #$FC
C - - - - - 0x01F024 07:F014: 0A        ASL
C - - - - - 0x01F025 07:F015: 18        CLC
C - - - - - 0x01F026 07:F016: 65 0F     ADC ram_000F
C - - - - - 0x01F028 07:F018: 85 0F     STA ram_000F
C - - - - - 0x01F02A 07:F01A: A5 2F     LDA ram_002F
C - - - - - 0x01F02C 07:F01C: D0 29     BNE bra_F047_loop
bra_F01E_loop:
C - - - - - 0x01F02E 07:F01E: A4 0F     LDY ram_000F
C - - - - - 0x01F030 07:F020: B1 0A     LDA (ram_000A),Y
C - - - - - 0x01F032 07:F022: A8        TAY
C - - - - - 0x01F033 07:F023: B1 36     LDA (ram_0036),Y
C - - - - - 0x01F035 07:F025: 25 0C     AND ram_000C
C - - - - - 0x01F037 07:F027: 85 0E     STA ram_000E
C - - - - - 0x01F039 07:F029: A4 0F     LDY ram_000F
C - - - - - 0x01F03B 07:F02B: B1 15     LDA (ram_0015),Y
C - - - - - 0x01F03D 07:F02D: A8        TAY
C - - - - - 0x01F03E 07:F02E: B1 36     LDA (ram_0036),Y
C - - - - - 0x01F040 07:F030: 25 0D     AND ram_000D
C - - - - - 0x01F042 07:F032: 05 0E     ORA ram_000E
C - - - - - 0x01F044 07:F034: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F047 07:F037: E8        INX
C - - - - - 0x01F048 07:F038: E6 0F     INC ram_000F
C - - - - - 0x01F04A 07:F03A: C6 05     DEC ram_0005
C - - - - - 0x01F04C 07:F03C: D0 E0     BNE bra_F01E_loop
bra_F03E:
; close buffer
C - - - - - 0x01F04E 07:F03E: A9 FF     LDA #$FF
C - - - - - 0x01F050 07:F040: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F053 07:F043: E8        INX
C - - - - - 0x01F054 07:F044: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x01F056 07:F046: 60        RTS
bra_F047_loop:
C - - - - - 0x01F057 07:F047: A4 0F     LDY ram_000F
C - - - - - 0x01F059 07:F049: B1 0A     LDA (ram_000A),Y
C - - - - - 0x01F05B 07:F04B: A8        TAY
C - - - - - 0x01F05C 07:F04C: B1 36     LDA (ram_0036),Y
C - - - - - 0x01F05E 07:F04E: 20 6F F0  JSR sub_F06F
C - - - - - 0x01F061 07:F051: 25 0C     AND ram_000C
C - - - - - 0x01F063 07:F053: 85 0E     STA ram_000E
C - - - - - 0x01F065 07:F055: A4 0F     LDY ram_000F
C - - - - - 0x01F067 07:F057: B1 15     LDA (ram_0015),Y
C - - - - - 0x01F069 07:F059: A8        TAY
C - - - - - 0x01F06A 07:F05A: B1 36     LDA (ram_0036),Y
C - - - - - 0x01F06C 07:F05C: 20 6F F0  JSR sub_F06F
C - - - - - 0x01F06F 07:F05F: 25 0D     AND ram_000D
C - - - - - 0x01F071 07:F061: 05 0E     ORA ram_000E
C - - - - - 0x01F073 07:F063: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F076 07:F066: E8        INX
C - - - - - 0x01F077 07:F067: E6 0F     INC ram_000F
C - - - - - 0x01F079 07:F069: C6 05     DEC ram_0005
C - - - - - 0x01F07B 07:F06B: D0 DA     BNE bra_F047_loop
C - - - - - 0x01F07D 07:F06D: F0 CF     BEQ bra_F03E    ; jmp

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_F06F:
C - - - - - 0x01F07F 07:F06F: 84 00     STY ram_0000
C - - - - - 0x01F081 07:F071: 85 01     STA ram_0001
C - - - - - 0x01F083 07:F073: 98        TYA
C - - - - - 0x01F084 07:F074: A0 09     LDY #$09
bra_F076_loop:
C - - - - - 0x01F086 07:F076: D9 88 F0  CMP tbl_F088,Y
C - - - - - 0x01F089 07:F079: F0 05     BEQ bra_F080
C - - - - - 0x01F08B 07:F07B: 88        DEY
C - - - - - 0x01F08C 07:F07C: 10 F8     BPL bra_F076_loop
C - - - - - 0x01F08E 07:F07E: 30 05     BMI bra_F085    ; jmp
bra_F080:
C - - - - - 0x01F090 07:F080: B9 D0 07  LDA ram_07D0,Y
C - - - - - 0x01F093 07:F083: D0 02     BNE bra_F087_RTS
bra_F085:
C - - - - - 0x01F095 07:F085: A5 01     LDA ram_0001
bra_F087_RTS:
C - - - - - 0x01F097 07:F087: 60        RTS

tbl_F088:
- D 3 - - - 0x01F098 07:F088: 89        .byte $89   ; 00 
- D 3 - - - 0x01F099 07:F089: 8D        .byte $8D   ; 01 
- D 3 - - - 0x01F09A 07:F08A: AC        .byte $AC   ; 02 
- D 3 - - - 0x01F09B 07:F08B: AF        .byte $AF   ; 03 
- D 3 - - - 0x01F09C 07:F08C: C1        .byte $C1   ; 04 
- D 3 - - - 0x01F09D 07:F08D: C2        .byte $C2   ; 05 
- D 3 - - - 0x01F09E 07:F08E: EC        .byte $EC   ; 06 
- D 3 - - - 0x01F09F 07:F08F: ED        .byte $ED   ; 07 
- D 3 - - - 0x01F0A0 07:F090: EE        .byte $EE   ; 08 
- D 3 - - - 0x01F0A1 07:F091: EF        .byte $EF   ; 09 

tbl_F092:
- D 3 - - - 0x01F0A2 07:F092: 0F        .byte $0F   ; 00 
- D 3 - - - 0x01F0A3 07:F093: F0        .byte $F0   ; 01 

; ******************************************************************************************************************

bra_F094_RTS:
C - - - - - 0x01F0A4 07:F094: 60        RTS
sub_0x01F0A5_попытка_перерисовать_фон_объекта:
C - - - - - 0x01F0A5 07:F095: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x01F0A7 07:F097: E0 30     CPX #$30
C - - - - - 0x01F0A9 07:F099: B0 F9     BCS bra_F094_RTS
C - - - - - 0x01F0AB 07:F09B: A2 F8     LDX #$F8
C - - - - - 0x01F0AD 07:F09D: 4C A6 FE  JMP loc_FEA6_подготовка_и_выбор_банков_для_перерисовки_части_фона_через_буфер

; ******************************************************************************************************************

sub_0x0068AA_попытка_перерисовать_фон_объекта_через_буфер:
loc_0x0068AA_попытка_перерисовать_фон_объекта_через_буфер:
C D 1 - - - 0x0068AA 01:A89A: 85 08     STA ram_0008
C - - - - - 0x0068AC 01:A89C: BD 3C 05  LDA ram_позиция_x_спрайта_объекта_или_пули,X
C - - - - - 0x0068AF 01:A89F: BC 22 05  LDY ram_позиция_y_спрайта_объекта_или_пули,X
sub_0x01F0B0:
C - - - - - 0x01F0B0 07:F0A0: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x01F0B2 07:F0A2: E0 30     CPX #$30
C - - - - - 0x01F0B4 07:F0A4: B0 EE     BCS bra_A8A5_skip
                                        JSR sub_FEA4_подготовка_и_выбор_банков_для_перерисовки_части_фона_через_буфер
bra_A8A5_skip:                          
C - - - - - 0x0068B5 01:A8A5: A6 10     LDX ram_0010    ; вернуть индекс объекта
C - - - - - 0x0068B7 01:A8A7: 60        RTS

; ******************************************************************************************************************

sub_F0A9_перерисовка_части_фона_через_буфер:
C - - - - - 0x01F0B9 07:F0A9: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x01F0BB 07:F0AB: 18        CLC
C - - - - - 0x01F0BC 07:F0AC: 65 FD     ADC ram_scroll_X
C - - - - - 0x01F0BE 07:F0AE: 85 00     STA ram_0000
C - - - - - 0x01F0C0 07:F0B0: A5 FF     LDA ram_for_2000
C - - - - - 0x01F0C2 07:F0B2: 90 02     BCC bra_F0B6
C - - - - - 0x01F0C4 07:F0B4: 49 01     EOR #$01
bra_F0B6:
C - - - - - 0x01F0C6 07:F0B6: 29 01     AND #$01
C - - - - - 0x01F0C8 07:F0B8: 09 08     ORA #$08
C - - - - - 0x01F0CA 07:F0BA: 85 01     STA ram_0001
C - - - - - 0x01F0CC 07:F0BC: A5 00     LDA ram_0000
C - - - - - 0x01F0CE 07:F0BE: 25 06     AND ram_0006
C - - - - - 0x01F0D0 07:F0C0: 4A        LSR
C - - - - - 0x01F0D1 07:F0C1: 4A        LSR
C - - - - - 0x01F0D2 07:F0C2: 4A        LSR
C - - - - - 0x01F0D3 07:F0C3: 85 00     STA ram_0000
C - - - - - 0x01F0D5 07:F0C5: 4A        LSR
C - - - - - 0x01F0D6 07:F0C6: 4A        LSR
C - - - - - 0x01F0D7 07:F0C7: 85 02     STA ram_0002
C - - - - - 0x01F0D9 07:F0C9: 98        TYA
C - - - - - 0x01F0DA 07:F0CA: 18        CLC
C - - - - - 0x01F0DB 07:F0CB: 65 FC     ADC ram_scroll_Y
C - - - - - 0x01F0DD 07:F0CD: B0 04     BCS bra_F0D3
C - - - - - 0x01F0DF 07:F0CF: C9 F0     CMP #$F0
C - - - - - 0x01F0E1 07:F0D1: 90 03     BCC bra_F0D6
bra_F0D3:
C - - - - - 0x01F0E3 07:F0D3: 18        CLC
C - - - - - 0x01F0E4 07:F0D4: 69 10     ADC #$10
bra_F0D6:
C - - - - - 0x01F0E6 07:F0D6: 25 06     AND ram_0006
C - - - - - 0x01F0E8 07:F0D8: 85 03     STA ram_0003
C - - - - - 0x01F0EA 07:F0DA: 0A        ASL
C - - - - - 0x01F0EB 07:F0DB: 26 01     ROL ram_0001
C - - - - - 0x01F0ED 07:F0DD: 0A        ASL
C - - - - - 0x01F0EE 07:F0DE: 26 01     ROL ram_0001
C - - - - - 0x01F0F0 07:F0E0: 05 00     ORA ram_0000
C - - - - - 0x01F0F2 07:F0E2: 85 00     STA ram_0000
C - - - - - 0x01F0F4 07:F0E4: A5 03     LDA ram_0003
C - - - - - 0x01F0F6 07:F0E6: 4A        LSR
C - - - - - 0x01F0F7 07:F0E7: 4A        LSR
C - - - - - 0x01F0F8 07:F0E8: 05 02     ORA ram_0002
C - - - - - 0x01F0FA 07:F0EA: 09 C0     ORA #$C0
C - - - - - 0x01F0FC 07:F0EC: 85 02     STA ram_0002
C - - - - - 0x01F0FE 07:F0EE: A5 01     LDA ram_0001
C - - - - - 0x01F100 07:F0F0: 09 03     ORA #$03
C - - - - - 0x01F102 07:F0F2: 85 03     STA ram_0003
C - - - - - 0x01F104 07:F0F4: A9 00     LDA #$00
C - - - - - 0x01F106 07:F0F6: 85 09     STA ram_0009
C - - - - - 0x01F108 07:F0F8: A5 08     LDA ram_0008
C - - - - - 0x01F10A 07:F0FA: 0A        ASL
C - - - - - 0x01F10B 07:F0FB: 26 09     ROL ram_0009
C - - - - - 0x01F10D 07:F0FD: 0A        ASL
C - - - - - 0x01F10E 07:F0FE: 26 09     ROL ram_0009
C - - - - - 0x01F110 07:F100: 0A        ASL
C - - - - - 0x01F111 07:F101: 26 09     ROL ram_0009
C - - - - - 0x01F113 07:F103: 0A        ASL
C - - - - - 0x01F114 07:F104: 26 09     ROL ram_0009
C - - - - - 0x01F116 07:F106: 65 34     ADC ram_0034
C - - - - - 0x01F118 07:F108: 85 0A     STA ram_000A
C - - - - - 0x01F11A 07:F10A: A5 09     LDA ram_0009
C - - - - - 0x01F11C 07:F10C: 65 35     ADC ram_0035
C - - - - - 0x01F11E 07:F10E: 85 0B     STA ram_000B
C - - - - - 0x01F120 07:F110: A9 06     LDA #con_buf_mode_06
C - - - - - 0x01F122 07:F112: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F125 07:F115: E8        INX
C - - - - - 0x01F126 07:F116: A0 04     LDY #$04
C - - - - - 0x01F128 07:F118: A5 00     LDA ram_0000
C - - - - - 0x01F12A 07:F11A: 10 0A     BPL bra_F126
C - - - - - 0x01F12C 07:F11C: A5 01     LDA ram_0001
C - - - - - 0x01F12E 07:F11E: 29 03     AND #$03
C - - - - - 0x01F130 07:F120: C9 03     CMP #$03
C - - - - - 0x01F132 07:F122: D0 02     BNE bra_F126
C - - - - - 0x01F134 07:F124: A0 02     LDY #$02
bra_F126:
C - - - - - 0x01F136 07:F126: 84 04     STY ram_0004
C - - - - - 0x01F138 07:F128: A0 00     LDY #$00
bra_F12A_loop:
C - - - - - 0x01F13A 07:F12A: A5 01     LDA ram_0001
C - - - - - 0x01F13C 07:F12C: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F13F 07:F12F: E8        INX
C - - - - - 0x01F140 07:F130: A5 00     LDA ram_0000
C - - - - - 0x01F142 07:F132: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F145 07:F135: E8        INX
C - - - - - 0x01F146 07:F136: A9 04     LDA #$04    ; counter
C - - - - - 0x01F148 07:F138: 85 05     STA ram_0005
C - - - - - 0x01F14A 07:F13A: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F14D 07:F13D: E8        INX
bra_F13E_loop:
C - - - - - 0x01F14E 07:F13E: B1 0A     LDA (ram_000A),Y
C - - - - - 0x01F150 07:F140: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F153 07:F143: C8        INY
C - - - - - 0x01F154 07:F144: E8        INX
C - - - - - 0x01F155 07:F145: C6 05     DEC ram_0005
C - - - - - 0x01F157 07:F147: D0 F5     BNE bra_F13E_loop
C - - - - - 0x01F159 07:F149: A5 00     LDA ram_0000
C - - - - - 0x01F15B 07:F14B: 18        CLC
C - - - - - 0x01F15C 07:F14C: 69 20     ADC #$20
C - - - - - 0x01F15E 07:F14E: 85 00     STA ram_0000
C - - - - - 0x01F160 07:F150: 90 02     BCC bra_F154_not_overflow
C - - - - - 0x01F162 07:F152: E6 01     INC ram_0001
bra_F154_not_overflow:
C - - - - - 0x01F164 07:F154: C6 04     DEC ram_0004
C - - - - - 0x01F166 07:F156: D0 D2     BNE bra_F12A_loop
C - - - - - 0x01F168 07:F158: A5 06     LDA ram_0006
C - - - - - 0x01F16A 07:F15A: C9 E0     CMP #$E0
C - - - - - 0x01F16C 07:F15C: D0 1A     BNE bra_F178
C - - - - - 0x01F16E 07:F15E: A5 03     LDA ram_0003    ; ppu hi
C - - - - - 0x01F170 07:F160: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F173 07:F163: E8        INX
C - - - - - 0x01F174 07:F164: A5 02     LDA ram_0002    ; ppu lo
C - - - - - 0x01F176 07:F166: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F179 07:F169: E8        INX
C - - - - - 0x01F17A 07:F16A: A9 01     LDA #$01    ; counter
C - - - - - 0x01F17C 07:F16C: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F17F 07:F16F: E8        INX
C - - - - - 0x01F180 07:F170: A4 08     LDY ram_0008
C - - - - - 0x01F182 07:F172: B1 36     LDA (ram_0036),Y
C - - - - - 0x01F184 07:F174: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F187 07:F177: E8        INX
bra_F178:
; close buffer
C - - - - - 0x01F188 07:F178: A9 FF     LDA #$FF
C - - - - - 0x01F18A 07:F17A: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F18D 07:F17D: E8        INX
C - - - - - 0x01F18E 07:F17E: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x01F190 07:F180: 18        CLC
C - - - - - 0x01F191 07:F181: 60        RTS

; ******************************************************************************************************************

sub_0x01F192:
C - - - - - 0x01F192 07:F182: A9 00     LDA #$00
C - - - - - 0x01F194 07:F184: 85 FC     STA ram_scroll_Y
C - - - - - 0x01F196 07:F186: 85 61     STA ram_0061_конфиг_уровня
sub_0x01F198:
C - - - - - 0x01F198 07:F188: A9 00     LDA #$00
C - - - - - 0x01F19A 07:F18A: 85 FD     STA ram_scroll_X
C - - - - - 0x01F19C 07:F18C: 85 26     STA ram_mirroring    ; con_mirroring_V
C - - - - - 0x01F19E 07:F18E: 85 86     STA ram_0085_for_2006 + $01
sub_0x01F1A0:
C - - - - - 0x01F1A0 07:F190: A9 00     LDA #$00
C - - - - - 0x01F1A2 07:F192: 85 64     STA ram_0064
C - - - - - 0x01F1A4 07:F194: A9 E0     LDA #$E0
C - - - - - 0x01F1A6 07:F196: 85 6B     STA ram_006B
C - - - - - 0x01F1A8 07:F198: C6 6C     DEC ram_006C
C - - - - - 0x01F1AA 07:F19A: 60        RTS

; ******************************************************************************************************************

sub_0x01FE4D_обработчик_уровня_и_смена_банка:
C - - - - - 0x01FE4D 07:FE3D: A9 36     LDA #con_prg_bank + $34
                                        STA $5114   ; 8000
                                        JSR sub_F273_обработчик_уровня
                                        LDA #con_prg_bank + $24 ; вернуть банк
                                        STA $5114   ; 8000
                                        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_F273_обработчик_уровня:
C D 3 - - - 0x01F283 07:F273: A5 50     LDA ram_номер_уровня
C - - - - - 0x01F285 07:F275: 0A        ASL
C - - - - - 0x01F286 07:F276: A8        TAY
C - - - - - 0x01F287 07:F277: B9 84 F2  LDA tbl_F284_поинтеры,Y
C - - - - - 0x01F28A 07:F27A: 85 00     STA ram_0000
C - - - - - 0x01F28C 07:F27C: B9 85 F2  LDA tbl_F284_поинтеры + $01,Y
C - - - - - 0x01F28F 07:F27F: 85 01     STA ram_0001
C - - - - - 0x01F291 07:F281: 6C 00 00  JMP (ram_0000)

tbl_F284_поинтеры:
- D 3 - - - 0x01F294 07:F284: A9 93     .word ofs_044_0x00D3B9_00_area_1
- D 3 - - - 0x01F296 07:F286: 92 94     .word ofs_044_0x00D4A2_01_area_2
- D 3 - - - 0x01F298 07:F288: 47 95     .word ofs_044_0x00D557_02_area_3
- D 3 - - - 0x01F29A 07:F28A: 00 96     .word ofs_044_0x00D610_03_area_4
- D 3 - - - 0x01F29C 07:F28C: F3 96     .word ofs_044_0x00D703_04_area_5
- D 3 - - - 0x01F29E 07:F28E: 1A 98     .word ofs_044_0x00D82A_05_area_6
- D 3 - - - 0x01F2A0 07:F290: E3 98     .word ofs_044_0x00D8F3_06_area_7
- D 3 - - - 0x01F2A2 07:F292: 67 99     .word ofs_044_0x00D977_07_area_8

; ******************************************************************************************************************









sub_0x01F2F4:
C - - - - - 0x01F2F4 07:F2E4: 84 06     STY ram_0006
C - - - - - 0x01F2F6 07:F2E6: A9 00     LDA #$00
C - - - - - 0x01F2F8 07:F2E8: 85 00     STA ram_0000
C - - - - - 0x01F2FA 07:F2EA: A9 01     LDA #$01
C - - - - - 0x01F2FC 07:F2EC: 85 0F     STA ram_000F
C - - - - - 0x01F2FE 07:F2EE: 20 82 F6  JSR sub_F682_определить_живого_игрока_и_копировать_его_позиции
C - - - - - 0x01F301 07:F2F1: A5 23     LDA ram_рандом_байт
C - - - - - 0x01F303 07:F2F3: 29 03     AND #$03
C - - - - - 0x01F305 07:F2F5: A8        TAY
C - - - - - 0x01F306 07:F2F6: B9 3B F3  LDA tbl_F33B,Y
C - - - - - 0x01F309 07:F2F9: 18        CLC
C - - - - - 0x01F30A 07:F2FA: 65 0A     ADC ram_000A
C - - - - - 0x01F30C 07:F2FC: 48        PHA
C - - - - - 0x01F30D 07:F2FD: 6A        ROR
C - - - - - 0x01F30E 07:F2FE: 59 3B F3  EOR tbl_F33B,Y
C - - - - - 0x01F311 07:F301: 0A        ASL
C - - - - - 0x01F312 07:F302: 68        PLA
C - - - - - 0x01F313 07:F303: B0 02     BCS bra_F307
C - - - - - 0x01F315 07:F305: 85 0A     STA ram_000A
bra_F307:
C - - - - - 0x01F317 07:F307: A5 23     LDA ram_рандом_байт
C - - - - - 0x01F319 07:F309: 4A        LSR
C - - - - - 0x01F31A 07:F30A: 4A        LSR
C - - - - - 0x01F31B 07:F30B: 29 03     AND #$03
C - - - - - 0x01F31D 07:F30D: A8        TAY
C - - - - - 0x01F31E 07:F30E: B9 3F F3  LDA tbl_F33F,Y
C - - - - - 0x01F321 07:F311: 18        CLC
C - - - - - 0x01F322 07:F312: 65 0B     ADC ram_000B
C - - - - - 0x01F324 07:F314: 48        PHA
C - - - - - 0x01F325 07:F315: 6A        ROR
C - - - - - 0x01F326 07:F316: 59 3F F3  EOR tbl_F33F,Y
C - - - - - 0x01F329 07:F319: 0A        ASL
C - - - - - 0x01F32A 07:F31A: 68        PLA
C - - - - - 0x01F32B 07:F31B: B0 02     BCS bra_F31F
C - - - - - 0x01F32D 07:F31D: 85 0B     STA ram_000B
bra_F31F:
C - - - - - 0x01F32F 07:F31F: 20 CE F5  JSR sub_F5CE_рассчитать_угол
C - - - - - 0x01F332 07:F322: 4C 34 F3  JMP loc_F334

tbl_F33B:
- D 3 - - - 0x01F34B 07:F33B: 00        .byte $00   ; 00 
- D 3 - - - 0x01F34C 07:F33C: 10        .byte $10   ; 01 
- D 3 - - - 0x01F34D 07:F33D: F0        .byte $F0   ; 02 
- D 3 - - - 0x01F34E 07:F33E: F8        .byte $F8   ; 03 

tbl_F33F:
- D 3 - - - 0x01F34F 07:F33F: F0        .byte $F0   ; 00 
- D 3 - - - 0x01F350 07:F340: 10        .byte $10   ; 01 
- D 3 - - - 0x01F351 07:F341: 20        .byte $20   ; 02 
- D 3 - - - 0x01F352 07:F342: F8        .byte $F8   ; 03 

; ******************************************************************************************************************

sub_0x01F360_расчет_угла_от_объекта_до_игрока:
sub_F370_расчет_угла_от_объекта_до_игрока:
; X = не меняется по ходу кода
; на выходе Y = угол выстрела
                                        JSR sub_F682_определить_живого_игрока_и_копировать_его_позиции
                                        LDA #$00
                                        STA ram_000F    ; поворот угла
; X
                                        LDA ram_0009    ; x позиция врага на экране
                                        SEC
                                        SBC ram_000B    ; x позиция игрока на экране
                                        BCS bra_F351
                                        
                                        EOR #$FF
                                        ADC #$01
bra_F351:
                                        ROL ram_000F    ; поворот угла
                                        LSR
                                        LSR

                                        STA ram_5205    ; младший байт множителя
                                        LDA #$40
                                        STA ram_5206    ; старший байт множителя

; Y
                                        LDA ram_0008    ; y позиция врага на экране
                                        SEC
                                        SBC ram_000A    ; y позиция игрока на экране
                                        BCS bra_F352

                                        EOR #$FF
                                        ADC #$01
bra_F352:

                                        ROL ram_000F    ; поворот угла
                                        LSR
                                        LSR
                                        CLC
                                        ADC ram_5205    ; разница x
                                        STA ram_0000    ; lo адрес
                                        LDA ram_5206    ; разница X HI
                                        ADC #$A0        ; начальный адрес банка
                                        STA ram_0001    ; HI адрес

                                        LDA #con_prg_bank + $27
                                        STA $5115   ; A000

                                        LDY #$00
                                        LDA (ram_0000),Y
                                        EOR #$3F
                                        LSR ram_000F    ; поворот угла
                                        BCC bra_F353
                                        EOR #$FF
bra_F353:
                                        LSR ram_000F    ; поворот угла
                                        BCC bra_F354
                                        EOR #$7F
bra_F354:
                                        TAY
                                        LDA #con_prg_bank + $33
                                        STA $5115   ; A000
                                        RTS

;            C0
;          A0  E0
;        80      00
;          60  20
;            40
tbl_0x009120_скорость_пуль_lo:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $80, $7F, $7F, $7F, $7F, $7F, $7E, $7E, $7D, $7C, $7C, $7B, $7A, $79, $78, $77   ; 00 
                                        .byte $76, $75, $73, $72, $70, $6F, $6D, $6C, $6A, $68, $66, $64, $62, $60, $5E, $5C   ; 10 
                                        .byte $5A, $58, $55, $53, $51, $4E, $4C, $49, $47, $44, $41, $3F, $3C, $39, $36, $33   ; 20 
                                        .byte $30, $2E, $2B, $28, $25, $22, $1F, $1C, $18, $15, $12, $0F, $0C, $09, $06, $03   ; 30 
                                        .byte $00, $FD, $FA, $F7, $F4, $F1, $EE, $EB, $E8, $E4, $E1, $DE, $DB, $D8, $D5, $D2   ; 40 
                                        .byte $D0, $CD, $CA, $C7, $C4, $C1, $BF, $BC, $B9, $B7, $B4, $B2, $AF, $AD, $AB, $A8   ; 50 
                                        .byte $A6, $A4, $A2, $A0, $9E, $9C, $9A, $98, $96, $94, $93, $91, $90, $8E, $8D, $8B   ; 60 
                                        .byte $8A, $89, $88, $87, $86, $85, $84, $84, $83, $82, $82, $81, $81, $81, $81, $81   ; 70 
                                        .byte $80, $81, $81, $81, $81, $81, $82, $82, $83, $84, $84, $85, $86, $87, $88, $89   ; 80 
                                        .byte $8A, $8B, $8D, $8E, $90, $91, $93, $94, $96, $98, $9A, $9C, $9E, $A0, $A2, $A4   ; 90 
                                        .byte $A6, $A8, $AB, $AD, $AF, $B2, $B4, $B7, $B9, $BC, $BF, $C1, $C4, $C7, $CA, $CD   ; A0 
                                        .byte $D0, $D2, $D5, $D8, $DB, $DE, $E1, $E4, $E8, $EB, $EE, $F1, $F4, $F7, $FA, $FD   ; B0 
                                        .byte $00, $03, $06, $09, $0C, $0F, $12, $15, $18, $1C, $1F, $22, $25, $28, $2B, $2E   ; C0 
                                        .byte $30, $33, $36, $39, $3C, $3F, $41, $44, $47, $49, $4C, $4E, $51, $53, $55, $58   ; D0 
                                        .byte $5A, $5C, $5E, $60, $62, $64, $66, $68, $6A, $6C, $6D, $6F, $70, $72, $73, $75   ; E0 
                                        .byte $76, $77, $78, $79, $7A, $7B, $7C, $7C, $7D, $7E, $7E, $7F, $7F, $7F, $7F, $7F   ; F0 

tbl_0x009121_скорость_пуль_HI:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 10 
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 20 
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 30 
                                        .byte $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 40 
                                        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 50 
                                        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 60 
                                        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 70 
                                        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 80 
                                        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 90 
                                        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; A0 
                                        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; B0 
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; C0 
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; D0 
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; E0 
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; F0 























; определить угол выстрела и записать данные




; ram_0000
; ram_0004
; ram_0005
; ram_0006
; ram_0007
; ram_0008
; ram_0009
; ram_000A - ram_позиция_y_спрайта_игрока
; ram_000B - ram_позиция_x_спрайта_игрока
; ram_000C
; ram_000D
; ram_000F
; ram_0010 - индекс объекта




sub_0x01F335:   ; движущиеся пушка
C - - - - - 0x01F335 07:F325: A0 02     LDY #$02
sub_0x01F337:
loc_0x01F337:
C D 3 - - - 0x01F337 07:F327: A9 00     LDA #$00
C - - - - - 0x01F339 07:F329: 84 06     STY ram_0006
C - - - - - 0x01F33B 07:F32B: 85 00     STA ram_0000
C - - - - - 0x01F33D 07:F32D: A9 01     LDA #$01
C - - - - - 0x01F33F 07:F32F: 85 0F     STA ram_000F
C - - - - - 0x01F341 07:F331: 20 CB F5  JSR sub_F5CB_определить_живого_игрока_и_рассчитать_угол
loc_F334:
C D 3 - - - 0x01F344 07:F334: 05 00     ORA ram_0000
C - - - - - 0x01F346 07:F336: 85 0A     STA ram_000A
C D 3 - - - 0x01F36D 07:F35D: 86 10     STX ram_0010
                                        LDY #con_obj_id_02  ; обычная пуля объекта
C - - - - - 0x01F377 07:F367: 20 FD F6  JSR sub_F6FD_попытка_создать_объект
C - - - - - 0x01F37A 07:F36A: D0 25     BNE bra_F391_неудача
C - - - - - 0x01F37C 07:F36C: A5 06     LDA ram_0006
C - - - - - 0x01F37E 07:F36E: C9 07     CMP #$07
C - - - - - 0x01F380 07:F370: 90 02     BCC bra_F374_not_overflow
- - - - - - 0x01F382 07:F372: A9 07     LDA #$07
bra_F374_not_overflow:
C - - - - - 0x01F384 07:F374: 85 06     STA ram_0006
C - - - - - 0x01F386 07:F376: A5 08     LDA ram_0008
C - - - - - 0x01F388 07:F378: 9D 22 05  STA ram_позиция_y_спрайта_объекта_или_пули,X
C - - - - - 0x01F38B 07:F37B: A5 09     LDA ram_0009
C - - - - - 0x01F38D 07:F37D: 9D 3C 05  STA ram_позиция_x_спрайта_объекта_или_пули,X
C - - - - - 0x01F390 07:F380: A5 0A     LDA ram_000A
C - - - - - 0x01F392 07:F382: 29 1F     AND #$1F
C - - - - - 0x01F394 07:F384: 20 AB F3  JSR sub_F3AB
C - - - - - 0x01F397 07:F387: 20 96 F3  JSR sub_F396_записать_скорость_Y_X
C - - - - - 0x01F39A 07:F38A: 86 11     STX ram_0011    ; индекс нового объекта
C - - - - - 0x01F39C 07:F38C: A6 10     LDX ram_0010
C - - - - - 0x01F39E 07:F38E: A9 00     LDA #$00    ; флаг успеха
C - - - - - 0x01F3A0 07:F390: 60        RTS
bra_F391_неудача:
C - - - - - 0x01F3A1 07:F391: A6 10     LDX ram_0010
C - - - - - 0x01F3A3 07:F393: A9 01     LDA #$01
C - - - - - 0x01F3A5 07:F395: 60        RTS

; ******************************************************************************************************************

sub_F396_записать_скорость_Y_X:
sub_0x01F3A6_записать_скорость_Y_X:
loc_0x01F3A6_записать_скорость_Y_X:
C D 3 - - - 0x01F3A6 07:F396: A5 05     LDA ram_0005
C - - - - - 0x01F3A8 07:F398: 9D AE 06  STA ram_скорость_объектов_Y_старш,X
C - - - - - 0x01F3AB 07:F39B: A5 04     LDA ram_0004
C - - - - - 0x01F3AD 07:F39D: 9D A0 06  STA ram_скорость_объектов_y_младш,X
C - - - - - 0x01F3B0 07:F3A0: A5 0B     LDA ram_000B
C - - - - - 0x01F3B2 07:F3A2: 9D CA 06  STA ram_скорость_объектов_X_старш,X
C - - - - - 0x01F3B5 07:F3A5: A5 0A     LDA ram_000A
C - - - - - 0x01F3B7 07:F3A7: 9D BC 06  STA ram_скорость_объектов_x_младш,X
C - - - - - 0x01F3BA 07:F3AA: 60        RTS

; ******************************************************************************************************************

sub_F3AB:
sub_0x01F3BB:
C - - - - - 0x01F3BB 07:F3AB: A8        TAY
C - - - - - 0x01F3BC 07:F3AC: B9 F6 F3  LDA tbl_F3F6_index,Y
C - - - - - 0x01F3BF 07:F3AF: A8        TAY
C - - - - - 0x01F3C0 07:F3B0: B9 0F F4  LDA tbl_F40E + $01,Y
C - - - - - 0x01F3C3 07:F3B3: 85 04     STA ram_0004
C - - - - - 0x01F3C5 07:F3B5: A9 00     LDA #$00
C - - - - - 0x01F3C7 07:F3B7: 85 05     STA ram_0005
C - - - - - 0x01F3C9 07:F3B9: 20 1C F4  JSR sub_F41C
C - - - - - 0x01F3CC 07:F3BC: A5 04     LDA ram_0004
C - - - - - 0x01F3CE 07:F3BE: 85 0A     STA ram_000A
C - - - - - 0x01F3D0 07:F3C0: A5 05     LDA ram_0005
C - - - - - 0x01F3D2 07:F3C2: 85 0B     STA ram_000B
C - - - - - 0x01F3D4 07:F3C4: B9 0E F4  LDA tbl_F40E,Y
C - - - - - 0x01F3D7 07:F3C7: 85 04     STA ram_0004
C - - - - - 0x01F3D9 07:F3C9: A9 00     LDA #$00
C - - - - - 0x01F3DB 07:F3CB: 85 05     STA ram_0005
C - - - - - 0x01F3DD 07:F3CD: 20 1C F4  JSR sub_F41C
C - - - - - 0x01F3E0 07:F3D0: A5 07     LDA ram_0007
C - - - - - 0x01F3E2 07:F3D2: 4A        LSR
C - - - - - 0x01F3E3 07:F3D3: 90 0D     BCC bra_F3E2
C - - - - - 0x01F3E5 07:F3D5: A9 00     LDA #$00
C - - - - - 0x01F3E7 07:F3D7: 38        SEC
C - - - - - 0x01F3E8 07:F3D8: E5 04     SBC ram_0004
C - - - - - 0x01F3EA 07:F3DA: 85 04     STA ram_0004
C - - - - - 0x01F3EC 07:F3DC: A9 00     LDA #$00
C - - - - - 0x01F3EE 07:F3DE: E5 05     SBC ram_0005
C - - - - - 0x01F3F0 07:F3E0: 85 05     STA ram_0005
bra_F3E2:
C - - - - - 0x01F3F2 07:F3E2: A5 07     LDA ram_0007
C - - - - - 0x01F3F4 07:F3E4: 4A        LSR
C - - - - - 0x01F3F5 07:F3E5: 4A        LSR
C - - - - - 0x01F3F6 07:F3E6: 90 0D     BCC bra_F3F5_RTS
C - - - - - 0x01F3F8 07:F3E8: A9 00     LDA #$00
C - - - - - 0x01F3FA 07:F3EA: 38        SEC
C - - - - - 0x01F3FB 07:F3EB: E5 0A     SBC ram_000A
C - - - - - 0x01F3FD 07:F3ED: 85 0A     STA ram_000A
C - - - - - 0x01F3FF 07:F3EF: A9 00     LDA #$00
C - - - - - 0x01F401 07:F3F1: E5 0B     SBC ram_000B
C - - - - - 0x01F403 07:F3F3: 85 0B     STA ram_000B
bra_F3F5_RTS:
C - - - - - 0x01F405 07:F3F5: 60        RTS

tbl_F3F6_index:
- D 3 - - - 0x01F406 07:F3F6: 00        .byte $00   ; 00 
- D 3 - - - 0x01F407 07:F3F7: 02        .byte $02   ; 01 
- D 3 - - - 0x01F408 07:F3F8: 04        .byte $04   ; 02 
- D 3 - - - 0x01F409 07:F3F9: 06        .byte $06   ; 03 
- D 3 - - - 0x01F40A 07:F3FA: 08        .byte $08   ; 04 
- D 3 - - - 0x01F40B 07:F3FB: 0A        .byte $0A   ; 05 
- D 3 - - - 0x01F40C 07:F3FC: 0C        .byte $0C   ; 06 
; bzk garbage?
- - - - - - 0x01F40D 07:F3FD: 0A        .byte $0A   ; 
- - - - - - 0x01F40E 07:F3FE: 08        .byte $08   ; 
- - - - - - 0x01F40F 07:F3FF: 06        .byte $06   ; 
- - - - - - 0x01F410 07:F400: 04        .byte $04   ; 
- - - - - - 0x01F411 07:F401: 02        .byte $02   ; 
- - - - - - 0x01F412 07:F402: 00        .byte $00   ; 
- - - - - - 0x01F413 07:F403: 02        .byte $02   ; 
- - - - - - 0x01F414 07:F404: 04        .byte $04   ; 
- - - - - - 0x01F415 07:F405: 06        .byte $06   ; 
- - - - - - 0x01F416 07:F406: 08        .byte $08   ; 
- - - - - - 0x01F417 07:F407: 0A        .byte $0A   ; 
- - - - - - 0x01F418 07:F408: 0C        .byte $0C   ; 
- - - - - - 0x01F419 07:F409: 0A        .byte $0A   ; 
- - - - - - 0x01F41A 07:F40A: 08        .byte $08   ; 
- - - - - - 0x01F41B 07:F40B: 06        .byte $06   ; 
- - - - - - 0x01F41C 07:F40C: 04        .byte $04   ; 
- - - - - - 0x01F41D 07:F40D: 02        .byte $02   ; 

tbl_F40E:
;                                              +---------- 
;                                              |    +----- 
;                                              |    |
- D 3 - - - 0x01F41E 07:F40E: 00        .byte $00, $FF   ; 00 
- D 3 - - - 0x01F420 07:F410: 42        .byte $42, $F7   ; 02 
- D 3 - - - 0x01F422 07:F412: 80        .byte $80, $DD   ; 04 
- D 3 - - - 0x01F424 07:F414: B5        .byte $B5, $B5   ; 06 
- D 3 - - - 0x01F426 07:F416: DD        .byte $DD, $80   ; 08 
- D 3 - - - 0x01F428 07:F418: F7        .byte $F7, $42   ; 0A 
- D 3 - - - 0x01F42A 07:F41A: FF        .byte $FF, $00   ; 0C 

; ******************************************************************************************************************

sub_F41C:
                                        STY ram_0002    ; сохранить индекс
                                        LDY ram_0006
                                        LDA tbl_F421_lo,y
                                        STA ram_0000
                                        LDA tbl_F422_hi,y
                                        STA ram_0001
                                        LDY ram_0002    ; загрузить индекс
                                        JMP (ram_0000)
tbl_F421_lo:
- D 3 - I - 0x01F431 07:F421: 33 F4     .byte < ofs_037_F433_00
- D 3 - I - 0x01F433 07:F423: 38 F4     .byte < ofs_037_F438_01
- D 3 - I - 0x01F435 07:F425: 59 F4     .byte < _общий_RTS ; 02
- D 3 - I - 0x01F437 07:F427: 3F F4     .byte < ofs_037_F43F_03
- D 3 - I - 0x01F439 07:F429: 48 F4     .byte < ofs_037_F448_04
- D 3 - I - 0x01F43B 07:F42B: 5A F4     .byte < ofs_037_F45A_05
- D 3 - I - 0x01F43D 07:F42D: 65 F4     .byte < ofs_037_F465_06
- D 3 - I - 0x01F43F 07:F42F: 74 F4     .byte < ofs_037_F474_07
- - - - - - 0x01F441 07:F431: 8A F4     .byte < ofs_037_F48A_08
tbl_F422_hi:
- D 3 - I - 0x01F431 07:F421: 33 F4     .byte > ofs_037_F433_00
- D 3 - I - 0x01F433 07:F423: 38 F4     .byte > ofs_037_F438_01
- D 3 - I - 0x01F435 07:F425: 59 F4     .byte > _общий_RTS ; 02
- D 3 - I - 0x01F437 07:F427: 3F F4     .byte > ofs_037_F43F_03
- D 3 - I - 0x01F439 07:F429: 48 F4     .byte > ofs_037_F448_04
- D 3 - I - 0x01F43B 07:F42B: 5A F4     .byte > ofs_037_F45A_05
- D 3 - I - 0x01F43D 07:F42D: 65 F4     .byte > ofs_037_F465_06
- D 3 - I - 0x01F43F 07:F42F: 74 F4     .byte > ofs_037_F474_07
- - - - - - 0x01F441 07:F431: 8A F4     .byte > ofs_037_F48A_08

; _________________________________________________________________________________________________________________

ofs_037_F433_00:
C - - J - - 0x01F443 07:F433: 46 05     LSR ram_0005
C - - - - - 0x01F445 07:F435: 66 04     ROR ram_0004
C - - - - - 0x01F447 07:F437: 60        RTS

; _________________________________________________________________________________________________________________

ofs_037_F438_01:
C - - J - - 0x01F448 07:F438: 46 05     LSR ram_0005
C - - - - - 0x01F44A 07:F43A: 66 04     ROR ram_0004
C - - - - - 0x01F44C 07:F43C: 4C 48 F4  JMP loc_F448

; _________________________________________________________________________________________________________________

ofs_037_F43F_03:
C - - J - - 0x01F44F 07:F43F: A5 05     LDA ram_0005
C - - - - - 0x01F451 07:F441: 4A        LSR
C - - - - - 0x01F452 07:F442: A5 04     LDA ram_0004
C - - - - - 0x01F454 07:F444: 6A        ROR
C - - - - - 0x01F455 07:F445: 4A        LSR
C - - - - - 0x01F456 07:F446: 10 06     BPL bra_F44E
loc_F448:
ofs_037_F448_04:
C D 3 J - - 0x01F458 07:F448: A5 05     LDA ram_0005
C - - - - - 0x01F45A 07:F44A: 4A        LSR
C - - - - - 0x01F45B 07:F44B: A5 04     LDA ram_0004
C - - - - - 0x01F45D 07:F44D: 6A        ROR
bra_F44E:
loc_F44E:
C D 3 - - - 0x01F45E 07:F44E: 18        CLC
C - - - - - 0x01F45F 07:F44F: 65 04     ADC ram_0004
C - - - - - 0x01F461 07:F451: 85 04     STA ram_0004
C - - - - - 0x01F463 07:F453: A5 05     LDA ram_0005
C - - - - - 0x01F465 07:F455: 69 00     ADC #$00
C - - - - - 0x01F467 07:F457: 85 05     STA ram_0005
C - - - - - 0x01F469 07:F459: 60        RTS

; _________________________________________________________________________________________________________________

ofs_037_F45A_05:
C - - J - - 0x01F46A 07:F45A: A5 05     LDA ram_0005
C - - - - - 0x01F46C 07:F45C: 4A        LSR
C - - - - - 0x01F46D 07:F45D: A5 04     LDA ram_0004
C - - - - - 0x01F46F 07:F45F: 6A        ROR
C - - - - - 0x01F470 07:F460: 85 00     STA ram_0000
C - - - - - 0x01F472 07:F462: 4A        LSR
C - - - - - 0x01F473 07:F463: 10 08     BPL bra_F46D
ofs_037_F465_06:
C - - J - - 0x01F475 07:F465: A5 05     LDA ram_0005
C - - - - - 0x01F477 07:F467: 4A        LSR
C - - - - - 0x01F478 07:F468: A5 04     LDA ram_0004
C - - - - - 0x01F47A 07:F46A: 6A        ROR
C - - - - - 0x01F47B 07:F46B: 85 00     STA ram_0000
bra_F46D:
C - - - - - 0x01F47D 07:F46D: 4A        LSR
C - - - - - 0x01F47E 07:F46E: 18        CLC
C - - - - - 0x01F47F 07:F46F: 65 00     ADC ram_0000
C - - - - - 0x01F481 07:F471: 4C 4E F4  JMP loc_F44E

; _________________________________________________________________________________________________________________

ofs_037_F474_07:
C - - J - - 0x01F484 07:F474: A5 05     LDA ram_0005
C - - - - - 0x01F486 07:F476: 4A        LSR
C - - - - - 0x01F487 07:F477: A5 04     LDA ram_0004
C - - - - - 0x01F489 07:F479: 6A        ROR
C - - - - - 0x01F48A 07:F47A: 85 00     STA ram_0000
C - - - - - 0x01F48C 07:F47C: 4A        LSR
C - - - - - 0x01F48D 07:F47D: 85 01     STA ram_0001
C - - - - - 0x01F48F 07:F47F: 18        CLC
C - - - - - 0x01F490 07:F480: 65 00     ADC ram_0000
C - - - - - 0x01F492 07:F482: 46 01     LSR ram_0001
C - - - - - 0x01F494 07:F484: 18        CLC
C - - - - - 0x01F495 07:F485: 65 01     ADC ram_0001
C - - - - - 0x01F497 07:F487: 4C 4E F4  JMP loc_F44E

; _________________________________________________________________________________________________________________

ofs_037_F48A_08:
- - - - - - 0x01F49A 07:F48A: 06 04     ASL ram_0004
- - - - - - 0x01F49C 07:F48C: 26 05     ROL ram_0005
- - - - - - 0x01F49E 07:F48E: 60        RTS

; ******************************************************************************************************************

sub_0x01F4A5_определить_угол_и_сравнить_между_собой:
C - - - - - 0x01F4A5 07:F495: 20 A2 F4  JSR sub_F4A3_определить_32_угла
                                        LSR ; 16 углов
                                        TAY
                                        LDA tbl_4444,Y
                                        STA ram_000C    ; счетчик угла
                                        CMP ram_счетчик_поворота_объекта,X  ; текущий счетчик угла объекта
                                        RTS

; ******************************************************************************************************************

sub_0x01F4A7_определить_сторону_поворота_и_повернуть_объект:
loc_0x01F4A7_определить_сторону_поворота_и_повернуть_объект:
                                        JSR sub_F4ED_24_угла_определить_возможность_поворота_объекта
                                        JSR sub_F4B1_повернуть_объект_исходя_из_флага
loc_F498:
C - - - - - 0x01F4A8 07:F498: BC 48 07  LDY ram_счетчик_поворота_объекта,X
sub_0x01F4AB_установить_угол_направления_от_счетчика_поворота:
C - - - - - 0x01F4AB 07:F49B: B9 D4 F4  LDA tbl_F4D4_углы_направления_объекта,Y
C - - - - - 0x01F4AE 07:F49E: 9D 56 07  STA ram_угол_направления_объекта,X
C - - - - - 0x01F4B1 07:F4A1: 60        RTS

tbl_F4D4_углы_направления_объекта:
tbl_0x01F4E4_углы_направления_объекта:
- D 3 - - - 0x01F4E4 07:F4D4: 00        .byte $00   ; 00 
- D 3 - - - 0x01F4E5 07:F4D5: 00        .byte $00   ; 01 
- D 3 - - - 0x01F4E6 07:F4D6: 01        .byte $01   ; 02 
- D 3 - - - 0x01F4E7 07:F4D7: 01        .byte $01   ; 03 
- D 3 - - - 0x01F4E8 07:F4D8: 01        .byte $01   ; 04 
- D 3 - - - 0x01F4E9 07:F4D9: 02        .byte $02   ; 05 
- D 3 - - - 0x01F4EA 07:F4DA: 02        .byte $02   ; 06 
- D 3 - - - 0x01F4EB 07:F4DB: 02        .byte $02   ; 07 
- D 3 - - - 0x01F4EC 07:F4DC: 03        .byte $03   ; 08 
- D 3 - - - 0x01F4ED 07:F4DD: 03        .byte $03   ; 09 
- D 3 - - - 0x01F4EE 07:F4DE: 03        .byte $03   ; 0A 
- D 3 - - - 0x01F4EF 07:F4DF: 04        .byte $04   ; 0B 
- D 3 - - - 0x01F4F0 07:F4E0: 04        .byte $04   ; 0C 
- D 3 - - - 0x01F4F1 07:F4E1: 04        .byte $04   ; 0D 
- D 3 - - - 0x01F4F2 07:F4E2: 05        .byte $05   ; 0E 
- D 3 - - - 0x01F4F3 07:F4E3: 05        .byte $05   ; 0F 
- D 3 - - - 0x01F4F4 07:F4E4: 05        .byte $05   ; 10 
- D 3 - - - 0x01F4F5 07:F4E5: 06        .byte $06   ; 11 
- D 3 - - - 0x01F4F6 07:F4E6: 06        .byte $06   ; 12 
- D 3 - - - 0x01F4F7 07:F4E7: 06        .byte $06   ; 13 
- D 3 - - - 0x01F4F8 07:F4E8: 07        .byte $07   ; 14 
- D 3 - - - 0x01F4F9 07:F4E9: 07        .byte $07   ; 15 
- D 3 - - - 0x01F4FA 07:F4EA: 07        .byte $07   ; 16 
- D 3 - - - 0x01F4FB 07:F4EB: 00        .byte $00   ; 17 

; ******************************************************************************************************************

sub_F4A3_определить_32_угла:
                                        JSR sub_0x006ABE_копировать_позиции_спрайта_объекта
                                        JSR sub_F370_расчет_угла_от_объекта_до_игрока   ; точный угол 00-FF
                                        STY ram_0017    ; точный угол от объекта до игрока
                                        TYA ; 256 углов
                                        LSR ; 128 углов
                                        LSR ; 64 угла
                                        LSR ; 32 угла
                                        RTS

sub_F4EC_12_углов_определить_возможность_поворота_объекта:
                                        LDA #$06    ; 180 градусов
                                        LDY #$0C    ; 360 градусов предел
                                        BNE bra_F54A    ; jmp
sub_F4ED_24_угла_определить_возможность_поворота_объекта:
                                        LDA #$0C    ; 180 градусов
                                        LDY #$18    ; 360 градусов предел
bra_F54A:
                                        STA ram_0005    ; 180 градусов
                                        STY ram_0004    ; 360 градусов предел

                                        LDA #$00
                                        STA ram_000E
                                        LDA ram_счетчик_поворота_объекта,X  ; текущий угол поворота
                                        CLC
                                        ADC ram_0005    ; 180
                                        CMP ram_0004    ; 360 градусов предел
                                        BCC bra_F54C
                                        INC ram_000E    ; был перебор через максимум
                                        SBC ram_0004    ; 360 градусов предел
bra_F54C:
                                        STA ram_000D    ; повернули в противоположную сторону

                                        LDA ram_000C    ; угол
                                        CMP ram_счетчик_поворота_объекта,X  ; текущий угол поворота
                                        BEQ bra_F56C_нет_движения
; разные углы, будет поворот
                                        LDY ram_000E    ; был перебор через максимум
                                        BNE bra_F563
; небыло перебора
                                        BCC bra_F569_уменьшить  ; поворот вправо
                                        CMP ram_000D    ; повернули в противоположную сторону
                                        BCS bra_F569_уменьшить  ; поворот вправо
bra_F55F_увеличить:
                                        LDA #$00    ; Z
                                        RTS
bra_F563:
                                        BCS bra_F55F_увеличить  ; поворот влево
                                        CMP ram_000D    ; повернули в противоположную сторону
                                        BCC bra_F55F_увеличить  ; поворот влево
bra_F569_уменьшить:
                                        LDA #$01    ; Z
                                        RTS
bra_F56C_нет_движения:
                                        LDA #$80    ; N
                                        RTS


tbl_4444:
                                        .byte $00   ; 00
                                        .byte $03   ; 01
                                        .byte $03   ; 02
                                        .byte $06   ; 03
                                        .byte $06   ; 04
                                        .byte $09   ; 05
                                        .byte $09   ; 06
                                        .byte $0C   ; 07
                                        .byte $0C   ; 08
                                        .byte $0F   ; 09
                                        .byte $0F   ; 0A
                                        .byte $12   ; 0B
                                        .byte $12   ; 0C
                                        .byte $15   ; 0D
                                        .byte $15   ; 0E
                                        .byte $00   ; 0F

tbl_5555:
                                        .byte $00   ; 00
                                        .byte $01   ; 01
                                        .byte $01   ; 02
                                        .byte $01   ; 03
                                        .byte $02   ; 04
                                        .byte $02   ; 05
                                        .byte $02   ; 06
                                        .byte $03   ; 07
                                        .byte $03   ; 08
                                        .byte $04   ; 09
                                        .byte $04   ; 0A
                                        .byte $04   ; 0B
                                        .byte $05   ; 0C
                                        .byte $05   ; 0D
                                        .byte $05   ; 0E
                                        .byte $06   ; 0F
                                        .byte $06   ; 10
                                        .byte $07   ; 11
                                        .byte $07   ; 12
                                        .byte $07   ; 13
                                        .byte $08   ; 14
                                        .byte $08   ; 15
                                        .byte $08   ; 16
                                        .byte $09   ; 17
                                        .byte $09   ; 18
                                        .byte $0A   ; 19
                                        .byte $0A   ; 1A
                                        .byte $0A   ; 1B
                                        .byte $0B   ; 1C
                                        .byte $0B   ; 1D
                                        .byte $0B   ; 1E
                                        .byte $00   ; 1F

; ******************************************************************************************************************

sub_0x01F4B2:
sub_F4A2:
C - - - - - 0x01F4B2 07:F4A2: 20 AE AA  JSR sub_0x006ABE_копировать_позиции_спрайта_объекта
sub_0x01F4B5:
C - - - - - 0x01F4B5 07:F4A5: 20 F0 F4  JSR sub_F4F0
C - - - - - 0x01F4B8 07:F4A8: 4C B1 F4  JMP loc_F4B1_повернуть_объект_исходя_из_флага

; ******************************************************************************************************************

sub_0x01F4BB_определить_угол_до_игрока_и_повернуть_объект:
; круглая пушка
                                        JSR sub_F4A3_определить_32_угла
                                        TAY
                                        LDA tbl_5555,Y
                                        STA ram_000C    ; угол от объекта до игрока
                                        JSR sub_F4EC_12_углов_определить_возможность_поворота_объекта
sub_F4B1_повернуть_объект_исходя_из_флага:
loc_F4B1_повернуть_объект_исходя_из_флага:
C D 3 - - - 0x01F4C1 07:F4B1: 30 1F     BMI bra_F4D2
C - - - - - 0x01F4C3 07:F4B3: D0 0E     BNE bra_F4C3
loc_F4B5_увеличить:
C - - - - - 0x01F4C5 07:F4B5: FE 48 07  INC ram_счетчик_поворота_объекта,X
C - - - - - 0x01F4C8 07:F4B8: BD 48 07  LDA ram_счетчик_поворота_объекта,X
C - - - - - 0x01F4CB 07:F4BB: C5 04     CMP ram_0004    ; максимальный счетчик поворота
C - - - - - 0x01F4CD 07:F4BD: 90 11     BCC bra_F4D0
C - - - - - 0x01F4CF 07:F4BF: A9 00     LDA #$00
C - - - - - 0x01F4D1 07:F4C1: F0 0A     BEQ bra_F4CD    ; jmp
loc_F4C3_уменьшить:
bra_F4C3:
C - - - - - 0x01F4D3 07:F4C3: DE 48 07  DEC ram_счетчик_поворота_объекта,X
C - - - - - 0x01F4D6 07:F4C6: 10 08     BPL bra_F4D0
C - - - - - 0x01F4D8 07:F4C8: A5 04     LDA ram_0004    ; максимальный счетчик поворота
C - - - - - 0x01F4DA 07:F4CA: 38        SEC
C - - - - - 0x01F4DB 07:F4CB: E9 01     SBC #$01
bra_F4CD:
C - - - - - 0x01F4DD 07:F4CD: 9D 48 07  STA ram_счетчик_поворота_объекта,X
bra_F4D0:
C - - - - - 0x01F4E0 07:F4D0: 18        CLC
C - - - - - 0x01F4E1 07:F4D1: 60        RTS
bra_F4D2:
C - - - - - 0x01F4E2 07:F4D2: 38        SEC
C - - - - - 0x01F4E3 07:F4D3: 60        RTS

; ******************************************************************************************************************

; определить угол от объекта до игрока
sub_0x01F4FC:
C - - - - - 0x01F4FC 07:F4EC: A9 00     LDA #$00
C - - - - - 0x01F4FE 07:F4EE: F0 02     BEQ bra_F4F2    ; jmp
sub_0x01F500_определить_угол_до_игрока_и_возможность_поворота_объекта:
sub_F4F0:
C - - - - - 0x01F500 07:F4F0: A9 01     LDA #$01
bra_F4F2:
C - - - - - 0x01F502 07:F4F2: 85 0F     STA ram_000F    ; 00-01
C - - - - - 0x01F504 07:F4F4: A5 0A     LDA ram_000A    ; индекс игрока (FF = мертвый)
C - - - - - 0x01F506 07:F4F6: 10 0A     BPL bra_F502_игрок_жив
C - - - - - 0x01F508 07:F4F8: A5 0C     LDA ram_000C    ; хз че это
C - - - - - 0x01F50A 07:F4FA: 85 0A     STA ram_000A    ; индекс игрока
C - - - - - 0x01F50C 07:F4FC: 20 CE F5  JSR sub_F5CE_рассчитать_угол
C - - - - - 0x01F50F 07:F4FF: 4C 05 F5  JMP loc_F505
bra_F502_игрок_жив:
C - - - - - 0x01F512 07:F502: 20 CB F5  JSR sub_F5CB_определить_живого_игрока_и_рассчитать_угол
loc_F505:
C D 3 - - - 0x01F515 07:F505: 85 17     STA ram_0017    ; угол от объекта до игрока
C - - - - - 0x01F517 07:F507: 85 0C     STA ram_000C    ; угол от объекта до игрока
C - - - - - 0x01F519 07:F509: A5 0F     LDA ram_000F    ; 00-01
C - - - - - 0x01F51B 07:F50B: 4A        LSR
; 00
C - - - - - 0x01F51C 07:F50C: A9 06     LDA #$06    ; 180 градусов? противоположная сторона
C - - - - - 0x01F51E 07:F50E: A0 0C     LDY #$0C    ; максимальный счетчик поворота
C - - - - - 0x01F520 07:F510: 90 04     BCC bra_F516
; 01
C - - - - - 0x01F522 07:F512: A9 0C     LDA #$0C    ; 180 градусов? противоположная сторона
C - - - - - 0x01F524 07:F514: A0 18     LDY #$18    ; максимальный счетчик поворота, предел
bra_F516:
C - - - - - 0x01F526 07:F516: 85 05     STA ram_0005    ; минимальный счетчик поворота
C - - - - - 0x01F528 07:F518: 84 04     STY ram_0004    ; максимальный счетчик поворота

C - - - - - 0x01F52A 07:F51A: A5 07     LDA ram_0007    ; вращение
C - - - - - 0x01F52C 07:F51C: 29 02     AND #$02
C - - - - - 0x01F52E 07:F51E: F0 07     BEQ bra_F527
; X+ переворот, игрок левее объекта
; переворот угла по X
C - - - - - 0x01F530 07:F520: A5 05     LDA ram_0005    ; минимальный счетчик поворота
C - - - - - 0x01F532 07:F522: 38        SEC
C - - - - - 0x01F533 07:F523: E5 0C     SBC ram_000C    ; угол от объекта до игрока
C - - - - - 0x01F535 07:F525: 85 0C     STA ram_000C    ; разница угол от объекта до игрока
bra_F527:
C - - - - - 0x01F537 07:F527: A5 07     LDA ram_0007    ; вращение
C - - - - - 0x01F539 07:F529: 4A        LSR
C - - - - - 0x01F53A 07:F52A: 90 0D     BCC bra_F539
; Y+ переворот, игрок выше объекта
; переворот угла по Y
C - - - - - 0x01F53C 07:F52C: A5 04     LDA ram_0004    ; максимальный счетчик поворота
C - - - - - 0x01F53E 07:F52E: 38        SEC
C - - - - - 0x01F53F 07:F52F: E5 0C     SBC ram_000C    ; разница угол от объекта до игрока
C - - - - - 0x01F541 07:F531: C5 04     CMP ram_0004    ; максимальный счетчик поворота
C - - - - - 0x01F543 07:F533: 90 02     BCC bra_F537
C - - - - - 0x01F545 07:F535: A9 00     LDA #$00
bra_F537:
C - - - - - 0x01F547 07:F537: 85 0C     STA ram_000C
bra_F539:
C - - - - - 0x01F549 07:F539: A9 00     LDA #$00
C - - - - - 0x01F54B 07:F53B: 85 0E     STA ram_000E
C - - - - - 0x01F54D 07:F53D: BD 48 07  LDA ram_скролл_объекта_Y,X  ; текущий угол поворота
C - - - - - 0x01F550 07:F540: 18        CLC
C - - - - - 0x01F551 07:F541: 65 05     ADC ram_0005    ; минимальный счетчик поворота
C - - - - - 0x01F553 07:F543: C5 04     CMP ram_0004    ; максимальный счетчик поворота
C - - - - - 0x01F555 07:F545: 90 04     BCC bra_F54B
C - - - - - 0x01F557 07:F547: E6 0E     INC ram_000E    ; был перебор через максимум
C - - - - - 0x01F559 07:F549: E5 04     SBC ram_0004    ; максимальный счетчик поворота
bra_F54B:
C - - - - - 0x01F55B 07:F54B: 85 0D     STA ram_000D    ; повернули в противоположную сторону

C - - - - - 0x01F55D 07:F54D: A5 0C     LDA ram_000C    ; разница угол от объекта до игрока
C - - - - - 0x01F55F 07:F54F: DD 48 07  CMP ram_скролл_объекта_Y,X  ; текущий угол поворота
C - - - - - 0x01F562 07:F552: F0 17     BEQ bra_F56B_нет_движения
; разные углы, будет поворот
C - - - - - 0x01F564 07:F554: A4 0E     LDY ram_000E    ; был перебор через максимум
C - - - - - 0x01F566 07:F556: D0 0A     BNE bra_F562
; небыло перебора
C - - - - - 0x01F568 07:F558: 90 0E     BCC bra_F568_уменьшить  ; поворот вправо
C - - - - - 0x01F56A 07:F55A: C5 0D     CMP ram_000D    ; повернули в противоположную сторону
C - - - - - 0x01F56C 07:F55C: B0 0A     BCS bra_F568_уменьшить  ; поворот вправо
bra_F55E_увеличить:
C - - - - - 0x01F56E 07:F55E: A9 00     LDA #$00
C - - - - - 0x01F570 07:F560: F0 08     BEQ bra_F56A_RTS    ; jmp
bra_F562:
C - - - - - 0x01F572 07:F562: B0 FA     BCS bra_F55E_увеличить  ; поворот влево
C - - - - - 0x01F574 07:F564: C5 0D     CMP ram_000D    ; повернули в противоположную сторону
C - - - - - 0x01F576 07:F566: 90 F6     BCC bra_F55E_увеличить  ; поворот влево
bra_F568_уменьшить:
C - - - - - 0x01F578 07:F568: A9 01     LDA #$01
bra_F56A_RTS:
C - - - - - 0x01F57A 07:F56A: 60        RTS
bra_F56B_нет_движения:
C - - - - - 0x01F57B 07:F56B: A9 80     LDA #$80    ; N
C - - - - - 0x01F57D 07:F56D: D0 FB     BNE bra_F56A_RTS    ; jmp

; ******************************************************************************************************************

sub_F5CB_определить_живого_игрока_и_рассчитать_угол:
C - - - - - 0x01F5DB 07:F5CB: 20 82 F6  JSR sub_F682_определить_живого_игрока_и_копировать_его_позиции
sub_F5CE_рассчитать_угол:
C - - - - - 0x01F5DE 07:F5CE: A0 00     LDY #$00
C - - - - - 0x01F5E0 07:F5D0: A5 0A     LDA ram_000A    ; позиция_y_спрайта_игрока FF
C - - - - - 0x01F5E2 07:F5D2: 38        SEC
C - - - - - 0x01F5E3 07:F5D3: E5 08     SBC ram_0008    ; позиция_y_спрайта_объекта
C - - - - - 0x01F5E5 07:F5D5: B0 05     BCS bra_F5DC
C - - - - - 0x01F5E7 07:F5D7: 49 FF     EOR #$FF
C - - - - - 0x01F5E9 07:F5D9: 69 01     ADC #$01
C - - - - - 0x01F5EB 07:F5DB: C8        INY
bra_F5DC:
C - - - - - 0x01F5EC 07:F5DC: 4A        LSR
C - - - - - 0x01F5ED 07:F5DD: 4A        LSR
C - - - - - 0x01F5EE 07:F5DE: 4A        LSR
C - - - - - 0x01F5EF 07:F5DF: 4A        LSR
C - - - - - 0x01F5F0 07:F5E0: 4A        LSR
C - - - - - 0x01F5F1 07:F5E1: 85 0A     STA ram_000A    ; разница y 
C - - - - - 0x01F5F3 07:F5E3: A5 0B     LDA ram_000B    ; позиция_x_спрайта_игрока
C - - - - - 0x01F5F5 07:F5E5: 38        SEC
C - - - - - 0x01F5F6 07:F5E6: E5 09     SBC ram_0009    ; позиция_x_спрайта_объекта
C - - - - - 0x01F5F8 07:F5E8: B0 06     BCS bra_F5F0
C - - - - - 0x01F5FA 07:F5EA: 49 FF     EOR #$FF
C - - - - - 0x01F5FC 07:F5EC: 69 01     ADC #$01
C - - - - - 0x01F5FE 07:F5EE: C8        INY
C - - - - - 0x01F5FF 07:F5EF: C8        INY
bra_F5F0:
C - - - - - 0x01F600 07:F5F0: 4A        LSR
C - - - - - 0x01F601 07:F5F1: 4A        LSR
C - - - - - 0x01F602 07:F5F2: 4A        LSR
C - - - - - 0x01F603 07:F5F3: 4A        LSR
C - - - - - 0x01F604 07:F5F4: 4A        LSR
C - - - - - 0x01F605 07:F5F5: 84 07     STY ram_0007    ; кол-во вращений
C - - - - - 0x01F607 07:F5F7: 4A        LSR
C - - - - - 0x01F608 07:F5F8: 85 0B     STA ram_000B    ; разница x 
C - - - - - 0x01F60A 07:F5FA: 08        PHP
C - - - - - 0x01F60B 07:F5FB: A5 0F     LDA ram_000F    ; 00-01
C - - - - - 0x01F60D 07:F5FD: 0A        ASL
C - - - - - 0x01F60E 07:F5FE: A8        TAY
C - - - - - 0x01F60F 07:F5FF: B9 1C F6  LDA tbl_F61C_поинтеры,Y
C - - - - - 0x01F612 07:F602: 85 0C     STA ram_000C    ; lo
C - - - - - 0x01F614 07:F604: B9 1D F6  LDA tbl_F61C_поинтеры + $01,Y
C - - - - - 0x01F617 07:F607: 85 0D     STA ram_000D    ; HI
C - - - - - 0x01F619 07:F609: A5 0A     LDA ram_000A    ; разница y
C - - - - - 0x01F61B 07:F60B: 0A        ASL
C - - - - - 0x01F61C 07:F60C: 0A        ASL
C - - - - - 0x01F61D 07:F60D: 65 0B     ADC ram_000B    ; разница x
C - - - - - 0x01F61F 07:F60F: A8        TAY
C - - - - - 0x01F620 07:F610: B1 0C     LDA (ram_000C),Y
C - - - - - 0x01F622 07:F612: 28        PLP
C - - - - - 0x01F623 07:F613: B0 04     BCS bra_F619
C - - - - - 0x01F625 07:F615: 4A        LSR
C - - - - - 0x01F626 07:F616: 4A        LSR
C - - - - - 0x01F627 07:F617: 4A        LSR
C - - - - - 0x01F628 07:F618: 4A        LSR
bra_F619:
C - - - - - 0x01F629 07:F619: 29 0F     AND #$0F
C - - - - - 0x01F62B 07:F61B: 60        RTS

tbl_F61C_поинтеры:
- D 3 - - - 0x01F62C 07:F61C: 22 F6     .word off_F622_00
- D 3 - - - 0x01F62E 07:F61E: 42 F6     .word off_F642_01

; _________________________________________________________________________________________________________________

off_F622_00:
- D 3 - I - 0x01F632 07:F622: 00        .byte $00   ; 
- D 3 - I - 0x01F633 07:F623: 00        .byte $00   ; 
- D 3 - I - 0x01F634 07:F624: 00        .byte $00   ; 
- D 3 - I - 0x01F635 07:F625: 00        .byte $00   ; 
- D 3 - I - 0x01F636 07:F626: 32        .byte $32   ; 
- D 3 - I - 0x01F637 07:F627: 11        .byte $11   ; 
- D 3 - I - 0x01F638 07:F628: 00        .byte $00   ; 
- D 3 - I - 0x01F639 07:F629: 00        .byte $00   ; 
- D 3 - I - 0x01F63A 07:F62A: 32        .byte $32   ; 
- D 3 - I - 0x01F63B 07:F62B: 11        .byte $11   ; 
- D 3 - I - 0x01F63C 07:F62C: 11        .byte $11   ; 
- - - - - - 0x01F63D 07:F62D: 11        .byte $11   ; 
- D 3 - I - 0x01F63E 07:F62E: 32        .byte $32   ; 
- D 3 - I - 0x01F63F 07:F62F: 22        .byte $22   ; 
- D 3 - I - 0x01F640 07:F630: 11        .byte $11   ; 
- D 3 - I - 0x01F641 07:F631: 11        .byte $11   ; 
- D 3 - I - 0x01F642 07:F632: 33        .byte $33   ; 
- D 3 - I - 0x01F643 07:F633: 22        .byte $22   ; 
- D 3 - I - 0x01F644 07:F634: 11        .byte $11   ; 
- - - - - - 0x01F645 07:F635: 11        .byte $11   ; 
- D 3 - I - 0x01F646 07:F636: 33        .byte $33   ; 
- D 3 - I - 0x01F647 07:F637: 22        .byte $22   ; 
- - - - - - 0x01F648 07:F638: 22        .byte $22   ; 
- - - - - - 0x01F649 07:F639: 11        .byte $11   ; 
- D 3 - I - 0x01F64A 07:F63A: 33        .byte $33   ; 
- D 3 - I - 0x01F64B 07:F63B: 22        .byte $22   ; 
- - - - - - 0x01F64C 07:F63C: 22        .byte $22   ; 
- - - - - - 0x01F64D 07:F63D: 11        .byte $11   ; 
- - - - - - 0x01F64E 07:F63E: 33        .byte $33   ; 
- D 3 - I - 0x01F64F 07:F63F: 22        .byte $22   ; 
- - - - - - 0x01F650 07:F640: 22        .byte $22   ; 
- - - - - - 0x01F651 07:F641: 22        .byte $22   ; 

; _________________________________________________________________________________________________________________

off_F642_01:
- D 3 - I - 0x01F652 07:F642: 00        .byte $00   ; 
- D 3 - I - 0x01F653 07:F643: 00        .byte $00   ; 
- D 3 - I - 0x01F654 07:F644: 00        .byte $00   ; 
- D 3 - I - 0x01F655 07:F645: 00        .byte $00   ; 
- D 3 - I - 0x01F656 07:F646: 63        .byte $63   ; 
- D 3 - I - 0x01F657 07:F647: 21        .byte $21   ; 
- D 3 - I - 0x01F658 07:F648: 11        .byte $11   ; 
- D 3 - I - 0x01F659 07:F649: 11        .byte $11   ; 
- D 3 - I - 0x01F65A 07:F64A: 64        .byte $64   ; 
- D 3 - I - 0x01F65B 07:F64B: 32        .byte $32   ; 
- D 3 - I - 0x01F65C 07:F64C: 21        .byte $21   ; 
- D 3 - I - 0x01F65D 07:F64D: 11        .byte $11   ; 
- D 3 - I - 0x01F65E 07:F64E: 65        .byte $65   ; 
- D 3 - I - 0x01F65F 07:F64F: 43        .byte $43   ; 
- D 3 - I - 0x01F660 07:F650: 22        .byte $22   ; 
- D 3 - I - 0x01F661 07:F651: 22        .byte $22   ; 
- D 3 - I - 0x01F662 07:F652: 65        .byte $65   ; 
- D 3 - I - 0x01F663 07:F653: 44        .byte $44   ; 
- D 3 - I - 0x01F664 07:F654: 33        .byte $33   ; 
- - - - - - 0x01F665 07:F655: 22        .byte $22   ; 
- D 3 - I - 0x01F666 07:F656: 65        .byte $65   ; 
- D 3 - I - 0x01F667 07:F657: 54        .byte $54   ; 
- D 3 - I - 0x01F668 07:F658: 33        .byte $33   ; 
- - - - - - 0x01F669 07:F659: 32        .byte $32   ; 
- D 3 - I - 0x01F66A 07:F65A: 65        .byte $65   ; 
- D 3 - I - 0x01F66B 07:F65B: 54        .byte $54   ; 
- - - - - - 0x01F66C 07:F65C: 43        .byte $43   ; 
- - - - - - 0x01F66D 07:F65D: 33        .byte $33   ; 
- D 3 - I - 0x01F66E 07:F65E: 65        .byte $65   ; 
- D 3 - I - 0x01F66F 07:F65F: 54        .byte $54   ; 
- - - - - - 0x01F670 07:F660: 44        .byte $44   ; 
- - - - - - 0x01F671 07:F661: 33        .byte $33   ; 

; ******************************************************************************************************************

sub_0x01F692_определить_живого_игрока_и_копировать_его_позиции:
sub_F682_определить_живого_игрока_и_копировать_его_позиции:
C - - - - - 0x01F692 07:F682: A5 0A     LDA ram_000A    ; индекс ближнего игрока
                                        BPL bra_F684
; кастомная позиция
                                        LDA ram_000C    ; позиция_Y_спрайта_игрока
                                        JMP loc_F6A9
bra_F684:
C - - - - - 0x01F694 07:F684: 29 01     AND #$01
C - - - - - 0x01F696 07:F686: A8        TAY
C - - - - - 0x01F697 07:F687: B9 A0 00  LDA ram_статус_игрока,Y
C - - - - - 0x01F69A 07:F68A: C9 02     CMP #con_plr_status_живой
C - - - - - 0x01F69C 07:F68C: F0 13     BEQ bra_F6A1
C - - - - - 0x01F69E 07:F68E: 98        TYA
C - - - - - 0x01F69F 07:F68F: 49 01     EOR #$01
C - - - - - 0x01F6A1 07:F691: A8        TAY
C - - - - - 0x01F6A2 07:F692: B9 A0 00  LDA ram_статус_игрока,Y
C - - - - - 0x01F6A5 07:F695: C9 02     CMP #con_plr_status_живой
C - - - - - 0x01F6A7 07:F697: F0 08     BEQ bra_F6A1
C - - - - - 0x01F6AD 07:F69D: A9 80     LDA #$80
C - - - - - 0x01F6AB 07:F69B: 85 0A     STA ram_000B
C - - - - - 0x01F6A9 07:F699: A9 FF     LDA #$FF
C - - - - - 0x01F6AF 07:F69F: D0 08     BNE bra_F6A9    ; jmp
bra_F6A1:
C - - - - - 0x01F6B6 07:F6A6: B9 4C 05  LDA ram_позиция_x_спрайта_игрока,Y
C - - - - - 0x01F6B9 07:F6A9: 85 0B     STA ram_000B
C - - - - - 0x01F6B1 07:F6A1: B9 32 05  LDA ram_позиция_y_спрайта_игрока,Y
loc_F6A9:
bra_F6A9:
C - - - - - 0x01F6B4 07:F6A4: 85 0A     STA ram_000A
C - - - - - 0x01F6BB 07:F6AB: 60        RTS

; ******************************************************************************************************************

sub_0x01F6BD_убить_игрока:
loc_0x01F6BD_убить_игрока:
C D 3 - - - 0x01F6BD 07:F6AD: A5 5C     LDA ram_статус_завершения_уровня
C - - - - - 0x01F6BF 07:F6AF: D0 15     BNE bra_F6C6_RTS
C - - - - - 0x01F6C1 07:F6B1: A9 25     LDA #con_sound_25   ; звук смерти
C - - - - - 0x01F6C3 07:F6B3: 20 DE FD  JSR sub_FDDE_play_sound
C - - - - - 0x01F6C6 07:F6B6: A9 00     LDA #$00
C - - - - - 0x01F6C8 07:F6B8: 95 C4     STA ram_инвиз_игрока,X
                                        STA ram_хитбоксы_игрока,X
C - - - - - 0x01F6CA 07:F6BA: A9 01     LDA #$01    ; также флаг смерти
C - - - - - 0x01F6CC 07:F6BC: 95 C0     STA ram_таймер_респавна_игрока,X
C - - - - - 0x01F6D0 07:F6C0: 95 C2     STA ram_флаг_мертвого_игрока,X
C - - - - - 0x01F6D2 07:F6C2: A9 03     LDA #con_plr_status_death_init
C - - - - - 0x01F6D4 07:F6C4: 95 A0     STA ram_статус_игрока,X
bra_F6C6_RTS:
C - - - - - 0x01F6D6 07:F6C6: 60        RTS

; ******************************************************************************************************************

sub_0x01F70D_попытка_создать_объект:
sub_F6FD_попытка_создать_объект:
; на входе, Y = номер объекта
; результат
    ; Z = 0 если объект был успешно создан
    ; Z = 1 если не получилось создать объект
C - - - - - 0x01F70D 07:F6FD: 20 11 F7  JSR sub_F711_поиск_свободного_слота
C - - - - - 0x01F710 07:F700: D0 03     BNE bra_F705_RTS    ; if not found
C - - - - - 0x01F712 07:F702: 4C 3F F7  JMP loc_F73F_начать_создание_нового_объекта
bra_F705_RTS:
C - - - - - 0x01F715 07:F705: 60        RTS

; ******************************************************************************************************************

sub_0x01F716_попытка_найти_свободный_слот_для_объекта___первые_4_слота:
; вроде как для автоспавна солдат
C - - - - - 0x01F716 07:F706: A2 03     LDX #$03
sub_0x01F718_попытка_найти_свободный_слот_для_объекта_X_слотов:
C - - - - - 0x01F718 07:F708: 20 13 F7  JSR sub_F713_поиск_свободного_слота_кастомный_X
C - - - - - 0x01F71B 07:F70B: D0 03     BNE bra_F710_RTS
C - - - - - 0x01F71D 07:F70D: 4C 3F F7  JMP loc_F73F_начать_создание_нового_объекта
bra_F710_RTS:
C - - - - - 0x01F720 07:F710: 60        RTS

; ******************************************************************************************************************

; результат
    ; Z = 0 если был найден свободный слот
        ; X = индекс слота объекта
    ; Z = 1 не получилось найти свободный слот
sub_F711_поиск_свободного_слота:
C - - - - - 0x01F721 07:F711: A2 0D     LDX ram_макс_индекс_враги
sub_F713_поиск_свободного_слота_кастомный_X:
bra_F713_loop:
C - - - - - 0x01F723 07:F713: BD 68 06  LDA ram_состояние_объектов_для_обработчика,X
C - - - - - 0x01F726 07:F716: F0 03     BEQ bra_F71B_RTS
C - - - - - 0x01F728 07:F718: CA        DEX
C - - - - - 0x01F729 07:F719: 10 F8     BPL bra_F713_loop
; Z = 0
bra_F71B_RTS:   ; Z = 1
C - - - - - 0x01F72B 07:F71B: 60        RTS

; ******************************************************************************************************************

sub_0x01F72C_поиск_вражеской_пули_в_слотах_объектов:
C - - - - - 0x01F72C 07:F71C: 20 25 F7  JSR sub_F725_найти_пулю_в_списке
C - - - - - 0x01F72F 07:F71F: D0 03     BNE bra_F724_RTS
C - - - - - 0x01F731 07:F721: 4C 3F F7  JMP loc_F73F_начать_создание_нового_объекта
bra_F724_RTS:
C - - - - - 0x01F734 07:F724: 60        RTS

; ******************************************************************************************************************

; результат
    ; Z = 0 если найдено
        ; X = индекс слота объекта
    ; Z = 1 если не найдено
sub_F725_найти_пулю_в_списке:
C - - - - - 0x01F735 07:F725: A2 0D     LDX ram_макс_индекс_враги
bra_F727_loop:
C - - - - - 0x01F737 07:F727: BD D8 06  LDA ram_тип_объектов,X
C - - - - - 0x01F73A 07:F72A: C9 02     CMP #con_obj_id_02  ; обычная пуля объекта
C - - - - - 0x01F73C 07:F72C: F0 03     BEQ bra_F731_RTS    ; найдено
C - - - - - 0x01F73E 07:F72E: CA        DEX
C - - - - - 0x01F73F 07:F72F: 10 F6     BPL bra_F727_loop
; Z = 1
bra_F731_RTS:   ; Z = 0
C - - - - - 0x01F741 07:F731: 60        RTS

; ******************************************************************************************************************

sub_0x01F742_удалить_все_объекты_и_очистить_их_данные:
C - - - - - 0x01F742 07:F732: A2 0D     LDX ram_макс_индекс_враги
bra_F734_loop:
C - - - - - 0x01F744 07:F734: 20 4E F7  JSR sub_F74E_удалить_объект_и_очистить_его_данные
C - - - - - 0x01F747 07:F737: CA        DEX
C - - - - - 0x01F748 07:F738: 10 FA     BPL bra_F734_loop
C - - - - - 0x01F74A 07:F73A: 60        RTS

; ******************************************************************************************************************

sub_0x01F74F_начать_создание_нового_объекта:
loc_F73F_начать_создание_нового_объекта:
C D 3 - - - 0x01F74F 07:F73F: 20 9E F7  JSR sub_F79E_записать_ID_объекта_и_его_хитбокс
C - - - - - 0x01F752 07:F742: A9 01     LDA #$01
C - - - - - 0x01F754 07:F744: 9D 68 06  STA ram_состояние_объектов_для_обработчика,X
C - - - - - 0x01F757 07:F747: 9D 76 06  STA ram_жизни_объектов_8bit,X
C - - - - - 0x01F75A 07:F74A: A9 00     LDA #$00    ; флаг успеха
                                        STA ram_жизни_объектов_16bit,X  ; временно
                                        STA ram_жизни_объектов_32bit,X  ; временно
C - - - - - 0x01F75C 07:F74C: F0 0B     BEQ bra_F759    ; jmp

; ******************************************************************************************************************

sub_F74E_удалить_объект_и_очистить_его_данные:
C - - - - - 0x01F75E 07:F74E: 20 9C F7  JSR sub_F79C_очистить_ID_объекта_и_его_хитбокс
; A=00
C - - - - - 0x01F763 07:F753: 9D 68 06  STA ram_состояние_объектов_для_обработчика,X
C - - - - - 0x01F766 07:F756: 9D 76 06  STA ram_жизни_объектов_8bit,X
                                        STA ram_жизни_объектов_16bit,X
                                        STA ram_жизни_объектов_32bit,X
bra_F759:
C - - - - - 0x01F769 07:F759: 9D 1E 07  STA ram_флаги_объектов,X
C - - - - - 0x01F76C 07:F75C: 9D 08 05  STA ram_кадр_объекта_или_пули,X
C - - - - - 0x01F76F 07:F75F: 9D 56 05  STA ram_атрибуты_спрайта_объекта_или_пули,X
C - - - - - 0x01F772 07:F762: 9D 8E 07  STA ram_позиция_объектов_Y_старш,X
C - - - - - 0x01F775 07:F765: 9D 9C 07  STA ram_позиция_объектов_X_старш,X
C - - - - - 0x01F778 07:F768: 9D 22 05  STA ram_позиция_y_спрайта_объекта_или_пули,X
C - - - - - 0x01F77B 07:F76B: 9D 84 06  STA ram_дробная_скорость_объекта_y_младш,X
C - - - - - 0x01F77E 07:F76E: 9D 92 06  STA ram_дробная_скорость_объекта_x_младш,X
C - - - - - 0x01F781 07:F771: 9D A0 06  STA ram_скорость_объектов_y_младш,X
C - - - - - 0x01F784 07:F774: 9D BC 06  STA ram_скорость_объектов_x_младш,X
C - - - - - 0x01F787 07:F777: 9D AE 06  STA ram_скорость_объектов_Y_старш,X
C - - - - - 0x01F78A 07:F77A: 9D CA 06  STA ram_скорость_объектов_X_старш,X
C - - - - - 0x01F78D 07:F77D: 9D E6 06  STA ram_счетчики_для_объектов,X
C - - - - - 0x01F790 07:F780: 9D F4 06  STA ram_счетчкик_жизни_объектов,X
C - - - - - 0x01F793 07:F783: 9D 10 07  STA ram_счетчик_анимации_взрыва_объекта,X
C - - - - - 0x01F796 07:F786: 9D 02 07  STA ram_счетчик_анимации_объектов,X
C - - - - - 0x01F799 07:F789: 9D 2C 07  STA ram_состояние_хитбоксов_объектов,X
C - - - - - 0x01F79C 07:F78C: 9D 48 07  STA ram_скролл_объекта_Y,X
C - - - - - 0x01F79F 07:F78F: 9D 56 07  STA ram_скролл_объекта_X,X
C - - - - - 0x01F7A2 07:F792: 9D 64 07  STA ram_0764_obj,X
C - - - - - 0x01F7A5 07:F795: 9D 72 07  STA ram_0772_obj,X
C - - - - - 0x01F7A8 07:F798: 9D 80 07  STA ram_0780_obj,X
                                        STA ram_характеристики_объектов,X
C - - - - - 0x01F7AB 07:F79B: 60        RTS

; ******************************************************************************************************************

sub_0x01F7AC_очистить_ID_объекта_и_его_хитбокс:
sub_F79C_очистить_ID_объекта_и_его_хитбокс:
                                        LDY #con_obj_id_00
sub_0x01F7AE_записать_ID_объекта_и_его_хитбокс:
sub_F79E_записать_ID_объекта_и_его_хитбокс:
C - - - - - 0x01F7AE 07:F79E: B9 E4 F8  LDA tbl_F8E4_хитбоксы_объектов,Y
C - - - - - 0x01F7B1 07:F7A1: 9D 3A 07  STA ram_хитбоксы_объектов,X
C - - - - - 0x01F7B4 07:F7A4: 98        TYA
C - - - - - 0x01F7B5 07:F7A5: 9D D8 06  STA ram_тип_объектов,X
C - - - - - 0x01F7B8 07:F7A8: 60        RTS

tbl_F8E4_хитбоксы_объектов:
; пустые и возможно новые объекты: 5C-7E
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
- D 3 - - - 0x01F8F4 07:F8E4: 00        .byte $00, $00, $01, $02, $00, $02, $01, $04, $00, $02, $00, $03, $03, $03, $01, $00   ; 00
- D 3 - - - 0x01F904 07:F8F4: 00        .byte $00, $03, $00, $00, $00, $00, $00, $00, $00, $03, $01, $00, $01, $00, $00, $03   ; 10
- D 3 - - - 0x01F914 07:F904: 0C        .byte $03, $00, $00, $03, $01, $02, $01, $06, $01, $00, $01, $07, $01, $03, $00, $00   ; 20
- D 3 - - - 0x01F924 07:F914: 04        .byte $02, $00, $00, $00, $00, $03, $00, $03, $01, $00, $00, $00, $00, $00, $03, $00   ; 30
- D 3 - - - 0x01F934 07:F924: 08        .byte $03, $01, $00, $00, $03, $00, $03, $02, $03, $00, $03, $00, $00, $00, $02, $05   ; 40
- D 3 - - - 0x01F944 07:F934: 00        .byte $03, $03, $00, $06, $00, $00, $00, $00, $00, $00, $00, $00                       ; 50

; ******************************************************************************************************************

loc_F7A9_запись_палитры_из_03E0x_в_0300x_с_условием:
sub_0x01F7B9_запись_палитры_из_03E0x_в_0300x_с_условием:
loc_0x01F7B9_запись_палитры_из_03E0x_в_0300x_с_условием:
C D 3 - - - 0x01F7B9 07:F7A9: A5 86     LDA ram_0085_for_2006 + $01
C - - - - - 0x01F7BB 07:F7AB: D0 06     BNE bra_F7B3_RTS
C - - - - - 0x01F7BD 07:F7AD: A5 1E     LDA ram_index_ppu_buffer
C - - - - - 0x01F7BF 07:F7AF: C9 20     CMP #$20
; leon
C - - - - - 0x01F7C1 07:F7B1: 90 0B     BCC bra_F7BE_запись_палитры_из_03E0x_в_0300x
; if buffer is too loaded
bra_F7B3_RTS:
C - - - - - 0x01F7C3 07:F7B3: 60        RTS

; ******************************************************************************************************************

sub_0x01F7C8_запись_фоновой_палитры_из_03E0x_в_0300x:
C - - - - - 0x01F7C8 07:F7B8: A0 02     LDY #$02
C - - - - - 0x01F7CA 07:F7BA: A9 10     LDA #$10
C - - - - - 0x01F7CC 07:F7BC: D0 04     BNE bra_F7C2    ; jmp

; ******************************************************************************************************************

bra_F7BE_запись_палитры_из_03E0x_в_0300x:
sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x:
C - - - - - 0x01F7CE 07:F7BE: A0 02     LDY #$02
C - - - - - 0x01F7D0 07:F7C0: A9 20     LDA #$20
bra_F7C2:
C - - - - - 0x01F7D2 07:F7C2: 85 00     STA ram_0000
C - - - - - 0x01F7D4 07:F7C4: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x01F7D6 07:F7C6: A9 03     LDA #$03
C - - - - - 0x01F7D8 07:F7C8: 85 01     STA ram_0001
bra_F7CA_loop:
C - - - - - 0x01F7DA 07:F7CA: B9 F2 F7  LDA tbl_F7F2,Y
C - - - - - 0x01F7DD 07:F7CD: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F7E0 07:F7D0: E8        INX
C - - - - - 0x01F7E1 07:F7D1: 88        DEY
C - - - - - 0x01F7E2 07:F7D2: C6 01     DEC ram_0001
C - - - - - 0x01F7E4 07:F7D4: D0 F4     BNE bra_F7CA_loop
C - - - - - 0x01F7E6 07:F7D6: A8        TAY ; 00
bra_F7D7_loop:
C - - - - - 0x01F7E7 07:F7D7: B9 E0 03  LDA ram_pal_buffer,Y
C - - - - - 0x01F7EA 07:F7DA: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F7ED 07:F7DD: E8        INX
C - - - - - 0x01F7EE 07:F7DE: C8        INY
C - - - - - 0x01F7EF 07:F7DF: C6 00     DEC ram_0000
C - - - - - 0x01F7F1 07:F7E1: D0 F4     BNE bra_F7D7_loop
C - - - - - 0x01F7F3 07:F7E3: A0 08     LDY #$08
bra_F7E5_loop:
C - - - - - 0x01F7F5 07:F7E5: B9 F8 F7  LDA tbl_F7F8,Y
C - - - - - 0x01F7F8 07:F7E8: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01F7FB 07:F7EB: E8        INX
C - - - - - 0x01F7FC 07:F7EC: 88        DEY
C - - - - - 0x01F7FD 07:F7ED: 10 F6     BPL bra_F7E5_loop
C - - - - - 0x01F7FF 07:F7EF: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x01F801 07:F7F1: 60        RTS

tbl_F7F2:
- D 3 - - - 0x01F802 07:F7F2: 00 3F     .word $3F00 ; ppu address
- D 3 - - - 0x01F804 07:F7F4: 01        .byte con_buf_mode_01   ; 

tbl_F7F8:
- D 3 - - - 0x01F808 07:F7F8: FF        .byte $FF   ; close buffer

- D 3 - - - 0x01F809 07:F7F9: 00 00     .word $0000 ; ppu address
- D 3 - - - 0x01F80B 07:F7FB: 01        .byte con_buf_mode_01   ; 

- D 3 - - - 0x01F80C 07:F7FC: FF        .byte $FF   ; change mode

- D 3 - - - 0x01F80D 07:F7FD: 00 3F     .word $3F00 ; ppu address
- D 3 - - - 0x01F80F 07:F7FF: 01        .byte con_buf_mode_01   ; 

- D 3 - - - 0x01F810 07:F800: FF        .byte $FF   ; change mode

; ******************************************************************************************************************

sub_0x01F820:
C - - - - - 0x01F820 07:F810: 48        PHA
C - - - - - 0x01F821 07:F811: 4A        LSR
C - - - - - 0x01F822 07:F812: 68        PLA
C - - - - - 0x01F823 07:F813: B0 0E     BCS bra_F823
C - - - - - 0x01F825 07:F815: C4 82     CPY ram_0082_конфиг_уровня
C - - - - - 0x01F827 07:F817: 90 1C     BCC bra_F835
C - - - - - 0x01F829 07:F819: D0 18     BNE bra_F833
C - - - - - 0x01F82B 07:F81B: C5 FC     CMP ram_scroll_Y
C - - - - - 0x01F82D 07:F81D: 90 16     BCC bra_F835
C - - - - - 0x01F82F 07:F81F: D0 12     BNE bra_F833
C - - - - - 0x01F831 07:F821: F0 0C     BEQ bra_F82F    ; jmp
bra_F823:
- - - - - - 0x01F833 07:F823: C4 82     CPY ram_0082_конфиг_уровня
- - - - - - 0x01F835 07:F825: 90 0C     BCC bra_F833
- - - - - - 0x01F837 07:F827: D0 0C     BNE bra_F835
- - - - - - 0x01F839 07:F829: C5 FC     CMP ram_scroll_Y
- - - - - - 0x01F83B 07:F82B: 90 06     BCC bra_F833
- - - - - - 0x01F83D 07:F82D: D0 06     BNE bra_F835
bra_F82F:
C - - - - - 0x01F83F 07:F82F: A9 00     LDA #$00
C - - - - - 0x01F841 07:F831: F0 02     BEQ bra_F835    ; jmp
bra_F833:
C - - - - - 0x01F843 07:F833: 49 01     EOR #$01
bra_F835:
C - - - - - 0x01F845 07:F835: 85 98     STA ram_0098
C - - - - - 0x01F847 07:F837: 84 9C     STY ram_009C
C - - - - - 0x01F849 07:F839: 60        RTS

; ******************************************************************************************************************

sub_F83A_сканлинии:
C - - - - - 0x01F84A 07:F83A: A9 FF     LDA #$FF
C - - - - - 0x01F84C 07:F83C: 85 48     STA ram_0048
C - - - - - 0x01F84E 07:F83E: 85 49     STA ram_0049
C - - - - - 0x01F850 07:F840: A5 45     LDA ram_номер_сканлинии
C - - - - - 0x01F852 07:F842: 18        CLC
C - - - - - 0x01F853 07:F843: 65 46     ADC ram_0046
C - - - - - 0x01F855 07:F845: B0 08     BCS bra_F84F_RTS
C - - - - - 0x01F857 07:F847: 85 48     STA ram_0048
C - - - - - 0x01F859 07:F849: 65 47     ADC ram_0047
C - - - - - 0x01F85B 07:F84B: B0 02     BCS bra_F84F_RTS
C - - - - - 0x01F85D 07:F84D: 85 49     STA ram_0049
bra_F84F_RTS:
C - - - - - 0x01F85F 07:F84F: 60        RTS

; ******************************************************************************************************************

sub_0x01F860:
C - - - - - 0x01F860 07:F850: A5 01     LDA ram_0001
C - - - - - 0x01F862 07:F852: 29 0F     AND #$0F
C - - - - - 0x01F864 07:F854: 85 02     STA ram_0002
C - - - - - 0x01F866 07:F856: A9 09     LDA #$09
C - - - - - 0x01F868 07:F858: A4 09     LDY ram_0009    ; тип поверхности
C - - - - - 0x01F86A 07:F85A: C0 06     CPY #$06    ; диагонали
C - - - - - 0x01F86C 07:F85C: 90 04     BCC bra_F862
C - - - - - 0x01F86E 07:F85E: 20 6B F8  JSR sub_F86B
C - - - - - 0x01F871 07:F861: 18        CLC
bra_F862:
C - - - - - 0x01F872 07:F862: 65 06     ADC ram_0006
C - - - - - 0x01F874 07:F864: 38        SEC
C - - - - - 0x01F875 07:F865: E5 02     SBC ram_0002
C - - - - - 0x01F877 07:F867: 38        SEC
C - - - - - 0x01F878 07:F868: E5 07     SBC ram_0007
C - - - - - 0x01F87A 07:F86A: 60        RTS
sub_F86B:
bra_F86B_loop:
C - - - - - 0x01F87B 07:F86B: A5 00     LDA ram_0000
C - - - - - 0x01F87D 07:F86D: 29 0F     AND #$0F
C - - - - - 0x01F87F 07:F86F: 85 04     STA ram_0004
C - - - - - 0x01F881 07:F871: D9 9C F8  CMP tbl_F8A2 - $06,Y
C - - - - - 0x01F884 07:F874: 6A        ROR
C - - - - - 0x01F885 07:F875: 59 A2 F8  EOR tbl_F8A8 - $06,Y
C - - - - - 0x01F888 07:F878: 30 0E     BMI bra_F888
C - - - - - 0x01F88A 07:F87A: A5 06     LDA ram_0006
C - - - - - 0x01F88C 07:F87C: 18        CLC
C - - - - - 0x01F88D 07:F87D: 79 A8 F8  ADC tbl_F8AE - $06,Y
C - - - - - 0x01F890 07:F880: 85 06     STA ram_0006
C - - - - - 0x01F892 07:F882: B9 AE F8  LDA tbl_F8B4 - $06,Y
C - - - - - 0x01F895 07:F885: A8        TAY
C - - - - - 0x01F896 07:F886: D0 E3     BNE bra_F86B_loop    ; jmp?
bra_F888:
C - - - - - 0x01F898 07:F888: A5 04     LDA ram_0004
C - - - - - 0x01F89A 07:F88A: 38        SEC
C - - - - - 0x01F89B 07:F88B: F9 B4 F8  SBC tbl_F8BA - $06,Y
C - - - - - 0x01F89E 07:F88E: 4A        LSR
C - - - - - 0x01F89F 07:F88F: 85 03     STA ram_0003
C - - - - - 0x01F8A1 07:F891: B9 C0 F8  LDA tbl_F8C6 - $06,Y
C - - - - - 0x01F8A4 07:F894: 0A        ASL
C - - - - - 0x01F8A5 07:F895: A5 03     LDA ram_0003
C - - - - - 0x01F8A7 07:F897: 90 05     BCC bra_F89E
C - - - - - 0x01F8A9 07:F899: 49 FF     EOR #$FF
C - - - - - 0x01F8AB 07:F89B: 69 00     ADC #$00
C - - - - - 0x01F8AD 07:F89D: 18        CLC
bra_F89E:
C - - - - - 0x01F8AE 07:F89E: 79 BA F8  ADC tbl_F8C0 - $06,Y
C - - - - - 0x01F8B1 07:F8A1: 60        RTS

; ??? и ниже таблицы
tbl_F8A2:
- D 3 - - - 0x01F8B2 07:F8A2: 7F        .byte $7F   ; 06
- D 3 - - - 0x01F8B3 07:F8A3: 04        .byte $04   ; 07
- D 3 - - - 0x01F8B4 07:F8A4: 04        .byte $04   ; 08
- D 3 - - - 0x01F8B5 07:F8A5: 7F        .byte $7F   ; 09
- D 3 - - - 0x01F8B6 07:F8A6: 0C        .byte $0C   ; 0A
- D 3 - - - 0x01F8B7 07:F8A7: 0C        .byte $0C   ; 0B

tbl_F8A8:
- D 3 - - - 0x01F8B8 07:F8A8: 80        .byte $80   ; 06
- D 3 - - - 0x01F8B9 07:F8A9: 80        .byte $80   ; 07
- D 3 - - - 0x01F8BA 07:F8AA: 00        .byte $00   ; 08
- D 3 - - - 0x01F8BB 07:F8AB: 80        .byte $80   ; 09
- D 3 - - - 0x01F8BC 07:F8AC: 00        .byte $00   ; 0A
- D 3 - - - 0x01F8BD 07:F8AD: 80        .byte $80   ; 0B

tbl_F8AE:
- - - - - - 0x01F8BE 07:F8AE: 00        .byte $00   ; 06
- D 3 - - - 0x01F8BF 07:F8AF: F0        .byte $F0   ; 07
- D 3 - - - 0x01F8C0 07:F8B0: 10        .byte $10   ; 08
- - - - - - 0x01F8C1 07:F8B1: 00        .byte $00   ; 09
- D 3 - - - 0x01F8C2 07:F8B2: F0        .byte $F0   ; 0A
- D 3 - - - 0x01F8C3 07:F8B3: 10        .byte $10   ; 0B

tbl_F8B4:
- - - - - - 0x01F8C4 07:F8B4: 00        .byte $00   ; 06
- D 3 - - - 0x01F8C5 07:F8B5: 08        .byte $08   ; 07
- D 3 - - - 0x01F8C6 07:F8B6: 07        .byte $07   ; 08
- - - - - - 0x01F8C7 07:F8B7: 00        .byte $00   ; 09
- D 3 - - - 0x01F8C8 07:F8B8: 0B        .byte $0B   ; 0A
- D 3 - - - 0x01F8C9 07:F8B9: 0A        .byte $0A   ; 0B

tbl_F8BA:
- D 3 - - - 0x01F8CA 07:F8BA: 00        .byte $00   ; 06
- D 3 - - - 0x01F8CB 07:F8BB: 00        .byte $00   ; 07
- D 3 - - - 0x01F8CC 07:F8BC: 04        .byte $04   ; 08
- D 3 - - - 0x01F8CD 07:F8BD: 00        .byte $00   ; 09
- D 3 - - - 0x01F8CE 07:F8BE: 0C        .byte $0C   ; 0A
- D 3 - - - 0x01F8CF 07:F8BF: 00        .byte $00   ; 0B

tbl_F8C0:
- D 3 - - - 0x01F8D0 07:F8C0: 09        .byte $09   ; 06
- D 3 - - - 0x01F8D1 07:F8C1: 01        .byte $01   ; 07
- D 3 - - - 0x01F8D2 07:F8C2: 0F        .byte $0F   ; 08
- D 3 - - - 0x01F8D3 07:F8C3: 02        .byte $02   ; 09
- D 3 - - - 0x01F8D4 07:F8C4: 00        .byte $00   ; 0A
- D 3 - - - 0x01F8D5 07:F8C5: 0A        .byte $0A   ; 0B

tbl_F8C6:
- D 3 - - - 0x01F8D6 07:F8C6: 80        .byte $80   ; 06
- D 3 - - - 0x01F8D7 07:F8C7: 80        .byte $80   ; 07
- D 3 - - - 0x01F8D8 07:F8C8: 80        .byte $80   ; 08
- D 3 - - - 0x01F8D9 07:F8C9: 00        .byte $00   ; 09
- D 3 - - - 0x01F8DA 07:F8CA: 00        .byte $00   ; 0A
- D 3 - - - 0x01F8DB 07:F8CB: 00        .byte $00   ; 0B

tbl_0x01F8DC:
- D 3 - - - 0x01F8DC 07:F8CC: 00        .byte $00   ; 00 
- D 3 - - - 0x01F8DD 07:F8CD: 00        .byte $00   ; 01 
- D 3 - - - 0x01F8DE 07:F8CE: 01        .byte $01   ; 02 
- D 3 - - - 0x01F8DF 07:F8CF: 01        .byte $01   ; 03 
- D 3 - - - 0x01F8E0 07:F8D0: 01        .byte $01   ; 04 
- - - - - - 0x01F8E1 07:F8D1: 01        .byte $01   ; 05 
- D 3 - - - 0x01F8E2 07:F8D2: 01        .byte $01   ; 06 
- D 3 - - - 0x01F8E3 07:F8D3: 01        .byte $01   ; 07 
- D 3 - - - 0x01F8E4 07:F8D4: 01        .byte $01   ; 08 
- D 3 - - - 0x01F8E5 07:F8D5: 01        .byte $01   ; 09 
- D 3 - - - 0x01F8E6 07:F8D6: 01        .byte $01   ; 0A 
- D 3 - - - 0x01F8E7 07:F8D7: 01        .byte $01   ; 0B 

tbl_0x01F8E8:
- D 3 - - - 0x01F8E8 07:F8D8: 00        .byte $00   ; 00 
- D 3 - - - 0x01F8E9 07:F8D9: 00        .byte $00   ; 01 
- D 3 - - - 0x01F8EA 07:F8DA: 01        .byte $01   ; 02 
- D 3 - - - 0x01F8EB 07:F8DB: 01        .byte $01   ; 03 
- - - - - - 0x01F8EC 07:F8DC: 01        .byte $01   ; 04 
- - - - - - 0x01F8ED 07:F8DD: 01        .byte $01   ; 05 
- D 3 - - - 0x01F8EE 07:F8DE: 00        .byte $00   ; 06 
- D 3 - - - 0x01F8EF 07:F8DF: 00        .byte $00   ; 07 
- D 3 - - - 0x01F8F0 07:F8E0: 00        .byte $00   ; 08 
- D 3 - - - 0x01F8F1 07:F8E1: 00        .byte $00   ; 09 
- D 3 - - - 0x01F8F2 07:F8E2: 00        .byte $00   ; 0A 
- D 3 - - - 0x01F8F3 07:F8E3: 00        .byte $00   ; 0B 

; ******************************************************************************************************************

sub_0x01F974_запись_3х_цветов_с_условием:
C - - - - - 0x01F974 07:F964: A5 5C     LDA ram_статус_завершения_уровня
C - - - - - 0x01F976 07:F966: D0 13     BNE bra_F97B_RTS
sub_0x01F978_запись_3х_цветов:
; see con_F97C_colors
C - - - - - 0x01F978 07:F968: BE 7C F9  LDX tbl_F97C_палитра,Y
C - - - - - 0x01F97B 07:F96B: A9 03     LDA #$03
C - - - - - 0x01F97D 07:F96D: 85 00     STA ram_0000
bra_F96F_loop:
C - - - - - 0x01F97F 07:F96F: B9 7D F9  LDA tbl_F97C_палитра + $01,Y
C - - - - - 0x01F982 07:F972: 9D E0 03  STA ram_pal_buffer,X
C - - - - - 0x01F985 07:F975: C8        INY
C - - - - - 0x01F986 07:F976: E8        INX
C - - - - - 0x01F987 07:F977: C6 00     DEC ram_0000
C - - - - - 0x01F989 07:F979: D0 F4     BNE bra_F96F_loop
bra_F97B_RTS:
C - - - - - 0x01F98B 07:F97B: 60        RTS

tbl_F97C_палитра:
; see con_F97C_colors
; 00 (00) 
- D 3 - - - 0x01F98C 07:F97C: 09        .byte $09   ; buffer index
- D 3 - - - 0x01F98D 07:F97D: 20        .byte $20, $18, $08   ; colors
; 01 (04) 
- D 3 - - - 0x01F990 07:F980: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01F991 07:F981: 0A        .byte $0A, $18, $08   ; colors
; 02 (08) 
- D 3 - - - 0x01F994 07:F984: 09        .byte $09   ; buffer index
- D 3 - - - 0x01F995 07:F985: 02        .byte $02, $12, $22   ; colors
; 03 (0C) 
- D 3 - - - 0x01F998 07:F988: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01F999 07:F989: 02        .byte $02, $12, $0A   ; colors
; 04 (10) 
- D 3 - - - 0x01F99C 07:F98C: 09        .byte $09   ; buffer index
- D 3 - - - 0x01F99D 07:F98D: 18        .byte $18, $1A, $0A   ; colors
; 05 (14) 
- D 3 - - - 0x01F9A0 07:F990: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01F9A1 07:F991: 20        .byte $20, $10, $00   ; colors
; 06 (18) 
- D 3 - - - 0x01F9A4 07:F994: 01        .byte $01   ; buffer index
- D 3 - - - 0x01F9A5 07:F995: 18        .byte $18, $1A, $0A   ; colors
; 07 (1C) 
- D 3 - - - 0x01F9A8 07:F998: 05        .byte $05   ; buffer index
- D 3 - - - 0x01F9A9 07:F999: 20        .byte $20, $10, $00   ; colors
; 08 (20) 
- D 3 - - - 0x01F9AC 07:F99C: 05        .byte $05   ; buffer index
- D 3 - - - 0x01F9AD 07:F99D: 28        .byte $28, $18, $08   ; colors
; 09 (24) 
- D 3 - - - 0x01F9B0 07:F9A0: 09        .byte $09   ; buffer index
- D 3 - - - 0x01F9B1 07:F9A1: 08        .byte $08, $10, $00   ; colors
; 0A (28) 
- D 3 - - - 0x01F9B4 07:F9A4: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01F9B5 07:F9A5: 00        .byte $00, $18, $0A   ; colors
; 0B (2C) 
- D 3 - - - 0x01F9B8 07:F9A8: 09        .byte $09   ; buffer index
- D 3 - - - 0x01F9B9 07:F9A9: 2C        .byte $2C, $1C, $0C   ; colors
; 0C (30) 
- D 3 - - - 0x01F9BC 07:F9AC: 05        .byte $05   ; buffer index
- D 3 - - - 0x01F9BD 07:F9AD: 2A        .byte $2A, $1B, $0B   ; colors
; 0D (34) 
- D 3 - - - 0x01F9C0 07:F9B0: 01        .byte $01   ; buffer index
- D 3 - - - 0x01F9C1 07:F9B1: 24        .byte $24, $14, $04   ; colors
; 0E (38) 
- D 3 - - - 0x01F9C4 07:F9B4: 09        .byte $09   ; buffer index
- D 3 - - - 0x01F9C5 07:F9B5: 23        .byte $23, $13, $03   ; colors
; 0F (3C) 
- D 3 - - - 0x01F9C8 07:F9B8: 09        .byte $09   ; buffer index
- D 3 - - - 0x01F9C9 07:F9B9: 2C        .byte $2C, $13, $0C   ; colors
; 10 (40) 
- D 3 - - - 0x01F9CC 07:F9BC: 09        .byte $09   ; buffer index
- D 3 - - - 0x01F9CD 07:F9BD: 2C        .byte $2C, $1C, $0C   ; colors
; 11 (44) 
- D 3 - - - 0x01F9D0 07:F9C0: 01        .byte $01   ; buffer index
- D 3 - - - 0x01F9D1 07:F9C1: 20        .byte $20, $10, $0F   ; colors
; 12 (48) 
- D 3 - - - 0x01F9D4 07:F9C4: 09        .byte $09   ; buffer index
- D 3 - - - 0x01F9D5 07:F9C5: 3C        .byte $3C, $1C, $0C   ; colors
; 13 (4C) 
- D 3 - - - 0x01F9D8 07:F9C8: 01        .byte $01   ; buffer index
- D 3 - - - 0x01F9D9 07:F9C9: 20        .byte $20, $10, $00   ; colors
; 14 (50) 
- D 3 - - - 0x01F9DC 07:F9CC: 05        .byte $05   ; buffer index
- D 3 - - - 0x01F9DD 07:F9CD: 20        .byte $20, $10, $00   ; colors
; 15 (54) 
- D 3 - - - 0x01F9E0 07:F9D0: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01F9E1 07:F9D1: 0B        .byte $0B, $10, $00   ; colors
; 16 (58) 
- D 3 - - - 0x01F9E4 07:F9D4: 05        .byte $05   ; buffer index
- D 3 - - - 0x01F9E5 07:F9D5: 0F        .byte $0F, $13, $03   ; colors
; 17 (5C) 
- D 3 - - - 0x01F9E8 07:F9D8: 05        .byte $05   ; buffer index
- D 3 - - - 0x01F9E9 07:F9D9: 0F        .byte $0F, $1A, $0A   ; colors
; 18 (60) 
- D 3 - - - 0x01F9EC 07:F9DC: 05        .byte $05   ; buffer index
- D 3 - - - 0x01F9ED 07:F9DD: 0F        .byte $0F, $1B, $0B   ; colors
; 19 (64) 
- D 3 - - - 0x01F9F0 07:F9E0: 05        .byte $05   ; buffer index
- D 3 - - - 0x01F9F1 07:F9E1: 0C        .byte $0C, $10, $00   ; colors
; 1A (68) 
- D 3 - - - 0x01F9F4 07:F9E4: 01        .byte $01   ; buffer index
- D 3 - - - 0x01F9F5 07:F9E5: 08        .byte $08, $10, $00   ; colors
; 1B (6C) 
- D 3 - - - 0x01F9F8 07:F9E8: 05        .byte $05   ; buffer index
- D 3 - - - 0x01F9F9 07:F9E9: 08        .byte $08, $10, $18   ; colors
; 1C (70) 
- D 3 - - - 0x01F9FC 07:F9EC: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01F9FD 07:F9ED: 20        .byte $20, $10, $00   ; colors
; 1D (74) 
- D 3 - - - 0x01FA00 07:F9F0: 09        .byte $09   ; buffer index
- D 3 - - - 0x01FA01 07:F9F1: 20        .byte $20, $10, $00   ; colors
; 1E (78) 
- D 3 - - - 0x01FA04 07:F9F4: 01        .byte $01   ; buffer index
- D 3 - - - 0x01FA05 07:F9F5: 27        .byte $27, $17, $07   ; colors
; 1F (7C) 
- D 3 - - - 0x01FA08 07:F9F8: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01FA09 07:F9F9: 20        .byte $20, $10, $00   ; colors
; 20 (80) 
- D 3 - - - 0x01FA0C 07:F9FC: 09        .byte $09   ; buffer index
- D 3 - - - 0x01FA0D 07:F9FD: 27        .byte $27, $16, $04   ; colors
; 21 (84) 
- D 3 - - - 0x01FA10 07:FA00: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01FA11 07:FA01: 16        .byte $16, $06, $00   ; colors
; 22 (88) 
- D 3 - - - 0x01FA14 07:FA04: 05        .byte $05   ; buffer index
- D 3 - - - 0x01FA15 07:FA05: 08        .byte $08, $00, $18   ; colors
; 23 (8C) 
- D 3 - - - 0x01FA18 07:FA08: 01        .byte $01   ; buffer index
- D 3 - - - 0x01FA19 07:FA09: 20        .byte $20, $10, $18   ; colors
; 24 (90) 
- D 3 - - - 0x01FA1C 07:FA0C: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01FA1D 07:FA0D: 20        .byte $20, $10, $08   ; colors
; 25 (94) 
- D 3 - - - 0x01FA20 07:FA10: 05        .byte $05   ; buffer index
- D 3 - - - 0x01FA21 07:FA11: 20        .byte $20, $10, $02   ; colors
; 26 (98) 
- D 3 - - - 0x01FA24 07:FA14: 09        .byte $09   ; buffer index
- D 3 - - - 0x01FA25 07:FA15: 10        .byte $10, $00, $06   ; colors
; 27 (9C) 
- D 3 - - - 0x01FA28 07:FA18: 09        .byte $09   ; buffer index
- D 3 - - - 0x01FA29 07:FA19: 20        .byte $20, $10, $06   ; colors
; 28 (A0) 
- D 3 - - - 0x01FA2C 07:FA1C: 0D        .byte $0D   ; buffer index
- D 3 - - - 0x01FA2D 07:FA1D: 20        .byte $20, $10, $16   ; colors
; 29 (A4) 
- D 3 - - - 0x01FA30 07:FA20: 05        .byte $05   ; buffer index
- D 3 - - - 0x01FA31 07:FA21: 24        .byte $24, $14, $04   ; colors
; 2A (A8) 
- D 3 - - - 0x01FA34 07:FA24: 09        .byte $09   ; buffer index
- D 3 - - - 0x01FA35 07:FA25: 20        .byte $20, $10, $06   ; colors
; 2B (AC) 
- D 3 - - - 0x01FA38 07:FA28: 1D        .byte $1D   ; buffer index
- D 3 - - - 0x01FA39 07:FA29: 24        .byte $24, $14, $04   ; colors
; 2C (B0) 
- D 3 - - - 0x01FA3C 07:FA2C: 1D        .byte $1D   ; buffer index
- D 3 - - - 0x01FA3D 07:FA2D: 20        .byte $20, $00, $0C   ; colors
; 2D (B4) EU
                                        .byte $09   ; buffer index
                                        .byte $3C, $12, $1C   ; colors EU
; 2E (B8) EU
                                        .byte $0D   ; buffer index
                                        .byte $0C, $2C, $1C   ; colors EU

; ******************************************************************************************************************

sub_0x01FA40:
C - - - - - 0x01FA40 07:FA30: A2 00     LDX #$00
bra_FA32_loop:
C - - - - - 0x01FA42 07:FA32: B9 3F FA  LDA tbl_FA3F,Y
C - - - - - 0x01FA45 07:FA35: 9D D0 03  STA ram_03D0,X
C - - - - - 0x01FA48 07:FA38: C8        INY
C - - - - - 0x01FA49 07:FA39: E8        INX
C - - - - - 0x01FA4A 07:FA3A: E0 10     CPX #$10
C - - - - - 0x01FA4C 07:FA3C: 90 F4     BCC bra_FA32_loop
C - - - - - 0x01FA4E 07:FA3E: 60        RTS

tbl_FA3F:
- D 3 - - - 0x01FA4F 07:FA3F: 2D        .byte $2D, $2D, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 00 
- D 3 - - - 0x01FA5F 07:FA4F: FD        .byte $FD, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 10 
- D 3 - - - 0x01FA6F 07:FA5F: 10        .byte $10, $33, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 20 
- D 3 - - - 0x01FA7F 07:FA6F: 0F        .byte $0F, $23, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 30 
- D 3 - - - 0x01FA8F 07:FA7F: 40        .byte $40, $40, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 40 
- D 3 - - - 0x01FA9F 07:FA8F: 01        .byte $01, $01, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 50 

; ******************************************************************************************************************

sub_0x01FAAF_затемнение_экрана:
C - - - - - 0x01FAAF 07:FA9F: C6 95     DEC ram_счетчик_затемнения_экрана
C - - - - - 0x01FAB1 07:FAA1: D0 25     BNE bra_FAC8_пропуск_затемнения
C - - - - - 0x01FAB3 07:FAA3: A9 08     LDA #$08    ; кадры перед следующей степенью затемнения
C - - - - - 0x01FAB5 07:FAA5: 85 95     STA ram_счетчик_затемнения_экрана
C - - - - - 0x01FAB7 07:FAA7: A9 00     LDA #$00    ; счетчик измененных цветов
C - - - - - 0x01FAB9 07:FAA9: 85 00     STA ram_0000
sub_FAAB_затемнение_палитры:
C - - - - - 0x01FABB 07:FAAB: A0 1F     LDY #$1F
bra_FAAD_loop:
C - - - - - 0x01FABD 07:FAAD: B9 E0 03  LDA ram_pal_buffer,Y
C - - - - - 0x01FAC0 07:FAB0: C9 0F     CMP #$0F
C - - - - - 0x01FAC2 07:FAB2: F0 0C     BEQ bra_FAC0
C - - - - - 0x01FAC4 07:FAB4: 38        SEC
C - - - - - 0x01FAC5 07:FAB5: E9 10     SBC #$10
C - - - - - 0x01FAC7 07:FAB7: B0 02     BCS bra_FABB
C - - - - - 0x01FAC9 07:FAB9: A9 0F     LDA #$0F
bra_FABB:
C - - - - - 0x01FACB 07:FABB: 99 E0 03  STA ram_pal_buffer,Y
C - - - - - 0x01FACE 07:FABE: E6 00     INC ram_0000
bra_FAC0:
C - - - - - 0x01FAD0 07:FAC0: 88        DEY
C - - - - - 0x01FAD1 07:FAC1: 10 EA     BPL bra_FAAD_loop
C - - - - - 0x01FAD3 07:FAC3: 38        SEC
C - - - - - 0x01FAD4 07:FAC4: A5 00     LDA ram_0000
C - - - - - 0x01FAD6 07:FAC6: F0 01     BEQ bra_FAC9_RTS
bra_FAC8_пропуск_затемнения:
C - - - - - 0x01FAD8 07:FAC8: 18        CLC
bra_FAC9_RTS:
C - - - - - 0x01FAD9 07:FAC9: 60        RTS

; ******************************************************************************************************************

loc_FACA_Ресет:
C - - - - - 0x01FADA 07:FACA: D8        CLD
C - - - - - 0x01FADB 07:FACB: 78        SEI
C - - - - - 0x01FADC 07:FACC: A2 FF     LDX #$FF
C - - - - - 0x01FADE 07:FACE: 9A        TXS
C - - - - - 0x01FADF 07:FACF: A9 00     LDA #$00
C - - - - - 0x01FAE1 07:FAD1: 8D 00 20  STA $2000
C - - - - - 0x01FAE4 07:FAD4: 8D 01 20  STA $2001
C - - - - - 0x01FAE7 07:FAD7: A2 02     LDX #$02
bra_FAD9_loop:
bra_FAD9_infinite_loop:
C - - - - - 0x01FAE9 07:FAD9: 2C 02 20  BIT $2002
C - - - - - 0x01FAEC 07:FADC: 10 FB     BPL bra_FAD9_infinite_loop
bra_FADE_infinite_loop:
C - - - - - 0x01FAEE 07:FADE: 2C 02 20  BIT $2002
C - - - - - 0x01FAF1 07:FAE1: 30 FB     BMI bra_FADE_infinite_loop
C - - - - - 0x01FAF3 07:FAE3: CA        DEX
C - - - - - 0x01FAF4 07:FAE4: D0 F3     BNE bra_FAD9_loop
C - - - - - 0x01FAF6 07:FAE6: 20 CE FC  LDA #$0F
                                        STA $4015
                                        LDA #$C0
                                        STA $4017
C - - - - - 0x01FAF9 07:FAE9: A2 00     LDX #$00
C - - - - - 0x01FAFB 07:FAEB: 8A        TXA
C - - - - - 0x01FAFC 07:FAEC: 85 00     STA ram_0000
C - - - - - 0x01FAFE 07:FAEE: 85 01     STA ram_0001
C - - - - - 0x01FB00 07:FAF0: A0 FC     LDY #$FC
bra_FAF2_loop:
C - - - - - 0x01FB02 07:FAF2: 88        DEY
C - - - - - 0x01FB03 07:FAF3: 91 00     STA (ram_0000),Y
C - - - - - 0x01FB05 07:FAF5: D0 FB     BNE bra_FAF2_loop
C - - - - - 0x01FB07 07:FAF7: E6 01     INC ram_0001
C - - - - - 0x01FB09 07:FAF9: A2 07     LDX #$07
bra_FAFB_loop:
C - - - - - 0x01FB0B 07:FAFB: 91 00     STA (ram_0000),Y
C - - - - - 0x01FB0D 07:FAFD: C8        INY
C - - - - - 0x01FB0E 07:FAFE: D0 FB     BNE bra_FAFB_loop
C - - - - - 0x01FB10 07:FB00: E6 01     INC ram_0001
C - - - - - 0x01FB12 07:FB02: E4 01     CPX ram_0001
C - - - - - 0x01FB14 07:FB04: D0 F5     BNE bra_FAFB_loop
; clear 0700-07DF
C - - - - - 0x01FB16 07:FB06: A2 E0     LDX #$E0
bra_FB08_loop:
C - - - - - 0x01FB18 07:FB08: CA        DEX
C - - - - - 0x01FB19 07:FB09: 9D 00 07  STA $0700,X
C - - - - - 0x01FB1C 07:FB0C: D0 FA     BNE bra_FB08_loop
                                        CLV
C - - - - - 0x01FB1E 07:FB0E: A2 E3     LDX #$E3    ; clear 07E3-07FF
C - - - - - 0x01FB20 07:FB10: AC EA 07  LDY ram_reset_check
C - - - - - 0x01FB23 07:FB13: C0 53     CPY #$53
C - - - - - 0x01FB25 07:FB15: D0 07     BNE bra_FB1E_failed
C - - - - - 0x01FB27 07:FB17: AC EB 07  LDY ram_reset_check + $01
C - - - - - 0x01FB2A 07:FB1A: C0 B1     CPY #$B1
C - - - - - 0x01FB2C 07:FB1C: F0 0C     BEQ bra_FB2A_passed
bra_FB1E_failed:
; if check failed
                                        BIT _set_V_flag
C - - - - - 0x01FB2E 07:FB1E: A0 00     LDY #$00
C - - - - - 0x01FB30 07:FB20: 8C E0 07  STY ram_рекорд_очки
C - - - - - 0x01FB33 07:FB23: A0 20     LDY #$20    ; 20000 points
C - - - - - 0x01FB35 07:FB25: 8C E1 07  STY ram_рекорд_очки + $01
C - - - - - 0x01FB38 07:FB28: A2 E2     LDX #$E2    ; clear 07E2-07FF
bra_FB2A_passed:
bra_FB2A_loop:
C - - - - - 0x01FB3A 07:FB2A: 9D 00 07  STA $0700,X
C - - - - - 0x01FB3D 07:FB2D: E8        INX
C - - - - - 0x01FB3E 07:FB2E: D0 FA     BNE bra_FB2A_loop
; cyneprepou4uk
; очистка батарейки
                                        LDY #> $6000    ; начальный адрес для очистки
                                        STY ram_0001
                                        LDY #< $6000
                                        STY ram_0000
                                        LDX #$20
                                        BVS bra_FB2E_первый_ресет
; если игра уже была запущена
                                        DEX ; 1F
bra_FB2E_первый_ресет:
; A = 00, Y = 00
bra_FB2F_loop:
; очистить 1F или 20 страниц
                                        STA (ram_0000),Y
                                        INY
                                        BNE bra_FB2F_loop
                                        INC ram_0001    ; увеличить старший байт адреса
                                        DEX
                                        BNE bra_FB2F_loop
; 1путин: запись контов, жизней, дефолт индексы, регион
                                        BVC bra_FB2C_skip
                                        LDA #$02
                                        STA ram_option_жизни
                                        STA ram_option_конты
bra_FB2C_skip:
                                        LDA ram_option_регион
                                        BEQ bra_FB30_US
; EU
                                        LDA #$40
bra_FB30_US:
                                        STA ram_регион
                                        LDX ram_option_колво_объектов
                                        LDA tbl_FB75_индексы,X
                                        STA ram_макс_индекс_пули_игрока
                                        LDA tbl_FB75_индексы + $02,X
                                        STA ram_макс_индекс_враги
                                        LDA #$81    ; вкл. чит
                                        STA ram_флаг_читов
C - - - - - 0x01FB40 07:FB30: A9 53     LDA #$53
C - - - - - 0x01FB42 07:FB32: 8D EA 07  STA ram_reset_check
C - - - - - 0x01FB45 07:FB35: A9 B1     LDA #$B1
C - - - - - 0x01FB47 07:FB37: 8D EB 07  STA ram_reset_check + $01
C - - - - - 0x01FB4A 07:FB3A: 20 0E FE  JSR sub_FE0E_остановить_звуковой_движок
; 1путин опт
C - - - - - 0x01FCE9 07:FCD9: A9 A8     LDA #$A8
C - - - - - 0x01FCEB 07:FCDB: 85 FF     STA ram_for_2000
C - - - - - 0x01FCED 07:FCDD: 8D 00 20  STA $2000
C - - - - - 0x01FCF0 07:FCE0: A9 1E     LDA #$1E
C - - - - - 0x01FCF2 07:FCE2: 85 FE     STA ram_for_2001
C - - - - - 0x01FCF4 07:FCE4: A9 05     LDA #$05
C - - - - - 0x01FCF6 07:FCE6: 85 1D     STA ram_001D
C - - - - - 0x01FB55 07:FB45: AD 02 20  LDA $2002
C - - - - - 0x01FB58 07:FB48: A9 10     LDA #$10
C - - - - - 0x01FB5A 07:FB4A: AA        TAX
bra_FB4B_loop:
C - - - - - 0x01FB5B 07:FB4B: 8D 06 20  STA $2006
C - - - - - 0x01FB5E 07:FB4E: 8D 06 20  STA $2006
C - - - - - 0x01FB61 07:FB51: 49 10     EOR #$10
C - - - - - 0x01FB63 07:FB53: CA        DEX
C - - - - - 0x01FB64 07:FB54: D0 F5     BNE bra_FB4B_loop
C - - - - - 0x01FB66 07:FB56: A9 00     LDA #$44    ; con_mirroring_V
C - - - - - 0x01FB68 07:FB58: 8D 00 A0  STA $5105
C - - - - - 0x01FB6B 07:FB5B: 58        CLI
bra_FB5B:
                                        LDX #$0F
loc_FB5C_infinite_loop:
C D 3 - - - 0x01FB6C 07:FB5C: E6 23     INC ram_рандом_байт
C - - - - - 0x01FB6E 07:FB5E: A5 23     LDA ram_рандом_байт
C - - - - - 0x01FB70 07:FB60: 65 1B     ADC ram_счетчик_кадров
C - - - - - 0x01FB72 07:FB62: 85 23     STA ram_рандом_байт
C - - - - - 0x01FB74 07:FB64: 4C 5C FB  JMP loc_FB5C_infinite_loop

tbl_0x01FB75_индексы:
tbl_FB75_индексы:
;                                              +---------- Оригинал
;                                              |    +----- Разгон
;                                              |    |
                                        .byte $0F, $1F  ; макс_индекс_пули_общие
                                        .byte $0D, $1F  ; макс_индекс_враги

; ******************************************************************************************************************

vec_FB67_NMI:

C - - - - - 0x01FB77 07:FB67: 48        PHA
C - - - - - 0x01FB78 07:FB68: 8A        TXA
C - - - - - 0x01FB79 07:FB69: 48        PHA
C - - - - - 0x01FB7A 07:FB6A: 98        TYA
C - - - - - 0x01FB7B 07:FB6B: 48        PHA
C - - - - - 0x01FB7C 07:FB6C: AD 02 20  LDA $2002
C - - - - - 0x01FB7F 07:FB6F: 58        CLI
C - - - - - 0x01FB80 07:FB70: A4 1C     LDY ram_001C
C - - - - - 0x01FB82 07:FB72: D0 5D     BNE bra_FBD1_second_nmi ; if game is lagging?
; Y = 00
C - - - - - 0x01FB84 07:FB74: E6 1C     INC ram_001C
C - - - - - 0x01FB86 07:FB76: A5 FF     LDA ram_for_2000
C - - - - - 0x01FB88 07:FB78: 29 7F     AND #$7F
C - - - - - 0x01FB8A 07:FB7A: 8D 00 20  STA $2000
C - - - - - 0x01FB8D 07:FB7D: 85 FF     STA ram_for_2000
C - - - - - 0x01FB8F 07:FB7F: 8C 06 20  STY $2006
C - - - - - 0x01FB92 07:FB82: 8C 06 20  STY $2006
C - - - - - 0x01FB95 07:FB85: A5 FE     LDA ram_for_2001
C - - - - - 0x01FB97 07:FB87: 29 E7     AND #$E7
C - - - - - 0x01FB99 07:FB89: 8D 01 20  STA $2001
C - - - - - 0x01FB9C 07:FB8C: 8C 03 20  STY $2003
C - - - - - 0x01FB9F 07:FB8F: A9 02     LDA #$02
C - - - - - 0x01FBA1 07:FB91: 8D 14 40  STA $4014
C - - - - - 0x01FBA4 07:FB94: 20 12 E0  JSR sub_E012
C - - - - - 0x01FBA7 07:FB97: A5 FE     LDA ram_for_2001
; затемнить паузу
                                        LDY ram_пауза
                                        BEQ bra_FB99
                                        ORA #$E0
bra_FB99:
C - - - - - 0x01FBA9 07:FB99: A6 1D     LDX ram_001D
C - - - - - 0x01FBAB 07:FB9B: F0 04     BEQ bra_FBA1
C - - - - - 0x01FBAD 07:FB9D: C6 1D     DEC ram_001D
C - - - - - 0x01FBAF 07:FB9F: 29 E7     AND #$E7
bra_FBA1:
C - - - - - 0x01FBB1 07:FBA1: 8D 01 20  STA $2001
C - - - - - 0x01FBB4 07:FBA4: 20 04 FC  JSR sub_FC04_запуск_irq
C - - - - - 0x01FBB7 07:FBA7: 20 0F FF  JSR sub_FF0F_запуск_банков_графики
C - - - - - 0x01FBBA 07:FBAA: A5 2B     LDA ram_002B
C - - - - - 0x01FBBC 07:FBAC: F0 03     BEQ bra_FBB1
C - - - - - 0x01FBBE 07:FBAE: 20 8F FC  JSR sub_FC8F_выключить_IRQ
bra_FBB1:
C - - - - - 0x01FBC1 07:FBB1: A9 3C     LDA #con_prg_bank + $28 ; муз банки
C - - - - - 0x01FBC3 07:FBB3: 20 6F FD  JSR sub_FD6F_смена_2х_подряд_prg_банков_без_возврата
C - - - - - 0x01FBC6 07:FBB6: 20 3C 81  JSR sub_0x01814C
C - - - - - 0x01FBC9 07:FBB9: 20 FC FC  JSR sub_FCFC_обработать_регистры_джойстиков
                                        INC ram_счетчик_кадров
C - - - - - 0x01FBCC 07:FBBC: 20 B9 E3  JSR sub_E3B9_обработка_игры_и_экранов_смена_банка
C - - - - - 0x01FBCF 07:FBBF: 20 17 FE  JSR sub_FE17_спрайтовый_движок
C - - - - - 0x01FBD2 07:FBC2: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x01FBD4 07:FBC4: A9 00     LDA #con_buf_mode_00
C - - - - - 0x01FBD6 07:FBC6: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01FBD9 07:FBC9: 85 1C     STA ram_001C
loc_FBCB_выход_из_прерывания:
C D 3 - - - 0x01FBDB 07:FBCB: 68        PLA
C - - - - - 0x01FBDC 07:FBCC: A8        TAY
C - - - - - 0x01FBDD 07:FBCD: 68        PLA
C - - - - - 0x01FBDE 07:FBCE: AA        TAX
C - - - - - 0x01FBDF 07:FBCF: 68        PLA
C - - - - - 0x01FBE0 07:FBD0: 40        RTI
bra_FBD1_second_nmi:
C - - - - - 0x01FBE1 07:FBD1: 20 0F FF  JSR sub_FF0F_запуск_банков_графики
C - - - - - 0x01FBE4 07:FBD4: A5 FE     LDA ram_for_2001
C - - - - - 0x01FBE6 07:FBD6: A6 1D     LDX ram_001D
C - - - - - 0x01FBE8 07:FBD8: F0 02     BEQ bra_FBDC
C - - - - - 0x01FBEA 07:FBDA: 29 E7     AND #$E7
bra_FBDC:
C - - - - - 0x01FBEC 07:FBDC: 8D 01 20  STA $2001
C - - - - - 0x01FBEF 07:FBDF: 20 04 FC  JSR sub_FC04_запуск_irq
C - - - - - 0x01FBF2 07:FBE2: A5 1C     LDA ram_001C
C - - - - - 0x01FBF4 07:FBE4: 30 03     BMI bra_FBE9
C - - - - - 0x01FBF6 07:FBE6: 20 C8 FD  JSR sub_FDC8
bra_FBE9:
C - - - - - 0x01FBF9 07:FBE9: 4C CB FB  JMP loc_FBCB_выход_из_прерывания

; ******************************************************************************************************************

sub_FBEC_запись_chr_банков_фона_42:
C - - - - - 0x01FBFC 07:FBEC: A9 42     LDA #con_chr_bank + $42
C - - - - - 0x01FBFE 07:FBEE: AA        TAX
sub_FBEF_запись_chr_банков_фона:
C - - - - - 0x01FBFF 07:FBEF: A0 00     TAY
C - - - - - 0x01FC01 07:FBF1: 8C 00 80  STY $5128
                                        INY
                                        STY $5129
C - - - - - 0x01FC04 07:FBF4: 8D 01 80  STX $512A
C - - - - - 0x01FC07 07:FBF7: C8        INX
C - - - - - 0x01FC08 07:FBF8: 8C 00 80  STX $512B
C - - - - - 0x01FC13 07:FC03: 60        RTS

; ******************************************************************************************************************

sub_FC04_запуск_irq:
C - - - - - 0x01FC14 07:FC04: AD 02 20  LDA $2002
C - - - - - 0x01FC17 07:FC07: A0 00     LDY #$00
C - - - - - 0x01FC19 07:FC09: 8C 05 20  STY $2005
C - - - - - 0x01FC1C 07:FC0C: 8C 05 20  STY $2005
C - - - - - 0x01FC1F 07:FC0F: AD 02 20  LDA $2002
C - - - - - 0x01FC2A 07:FC1A: A9 10     LDA #$10
C - - - - - 0x01FC2C 07:FC1C: 8C 06 20  STY $2006
C - - - - - 0x01FC2F 07:FC1F: 8C 06 20  STY $2006
C - - - - - 0x01FC32 07:FC22: 8D 06 20  STA $2006
C - - - - - 0x01FC35 07:FC25: 8D 06 20  STA $2006
C - - - - - 0x01FC38 07:FC28: 8C 06 20  STY $2006
C - - - - - 0x01FC3B 07:FC2B: 8C 06 20  STY $2006
C - - - - - 0x01FC3E 07:FC2E: 8D 06 20  STA $2006
C - - - - - 0x01FC41 07:FC31: 8D 06 20  STA $2006
C - - - - - 0x01FC44 07:FC34: 8C 06 20  STY $2006
C - - - - - 0x01FC47 07:FC37: 8C 06 20  STY $2006
                                        LDA #$00
                                        STA $5204
C - - - - - 0x01FC4A 07:FC3A: A6 27     LDY ram_irq_handler_hi
C - - - - - 0x01FC4C 07:FC3C: F0 02     BEQ bra_FC4B
C - - - - - 0x01FC50 07:FC40: A5 45     LDA ram_номер_сканлинии
                                        CLC
                                        ADC tbl_E098_корректировка_начальной_сканлинии,Y
                                        STA ram_prev_5203
C - - - - - 0x01FC52 07:FC42: 8D 00 C0  STA $5203
                                        LDA #$80
C - - - - - 0x01FC58 07:FC48: 9D 00 E0  STA $5204
bra_FC4B:
C - - - - - 0x01FC5B 07:FC4B: 20 A0 FC  JSR sub_FCA0_записать_скролл_и_включить_NMI
C - - - - - 0x01FC5E 07:FC4E: A5 27     LDA ram_irq_handler_hi
C - - - - - 0x01FC60 07:FC50: 0A        ASL
C - - - - - 0x01FC61 07:FC51: A8        TAY
C - - - - - 0x01FC62 07:FC52: B9 9A E0  LDA tbl_E09A_irq_handler,Y
C - - - - - 0x01FC65 07:FC55: 85 2D     STA ram_002D
C - - - - - 0x01FC67 07:FC57: B9 9B E0  LDA tbl_E09A_irq_handler + $01,Y
C - - - - - 0x01FC6A 07:FC5A: 85 2E     STA ram_002E
C - - - - - 0x01FC6C 07:FC5C: A9 00     LDA #$00
C - - - - - 0x01FC6E 07:FC5E: 85 28     STA ram_irq_handler_lo
C - - - - - 0x01FC70 07:FC60: A5 FA     LDA ram_00FA
C - - - - - 0x01FC72 07:FC62: 8D F6 07  STA ram_07F6
C - - - - - 0x01FC75 07:FC65: A5 FB     LDA ram_00FB
C - - - - - 0x01FC77 07:FC67: 8D F7 07  STA ram_07F7
C - - - - - 0x01FC7A 07:FC6A: A5 46     LDA ram_0046
C - - - - - 0x01FC7C 07:FC6C: 8D F9 07  STA ram_07F9
C - - - - - 0x01FC7F 07:FC6F: A5 47     LDA ram_0047
C - - - - - 0x01FC81 07:FC71: 8D FA 07  STA ram_07FA
C - - - - - 0x01FC84 07:FC74: A5 4A     LDA ram_004A
C - - - - - 0x01FC86 07:FC76: 8D FB 07  STA ram_07FB
C - - - - - 0x01FC89 07:FC79: A5 4B     LDA ram_004B
C - - - - - 0x01FC8B 07:FC7B: 8D FC 07  STA ram_07FC
C - - - - - 0x01FC8E 07:FC7E: 60        RTS

tbl_E098_корректировка_начальной_сканлинии:
                                        .byte $00   ; 00 placeholder
                                        .byte $FF   ; 01 area_1_boss
                                        .byte $01   ; 02 area_4_elevator
                                        .byte $FF   ; 03 credits
                                        .byte $00   ; 04 unused
                                        .byte $00   ; 05 area_4_boss
                                        .byte $00   ; 06 area_8_ceiling
                                        .byte $00   ; 07 unused
                                        .byte $FF   ; 08 area_3_boss
                                        .byte $00   ; 09 unused
                                        .byte $00   ; 0A area_7_boss
                                        .byte $00   ; 0B area_5_boss
                                        .byte $00   ; 0C area_2_boss
                                        .byte $FF   ; 0D area_8_boss
                                        .byte $00   ; 0E area_6_change_color
                                        .byte $00   ; 0F area_6_boss

tbl_E09A_irq_handler:
- D 3 - - - 0x01E0AA 07:E09A: BA E0     .word $FFFF ; 00 irq off, placeholder (поинтер читается, но не используется)
- D 3 - - - 0x01E0AC 07:E09C: BC E0     .word _off000_E0BC_01_area_1_boss
- D 3 - - - 0x01E0AE 07:E09E: BE E0     .word _off000_E0BE_02_area_4_elevator
- D 3 - - - 0x01E0B0 07:E0A0: C4 E0     .word _off000_E0C4_03_credits
- - - - - - 0x01E0B2 07:E0A2: CE E0     .word _off000_E0CE_04   ; unused
- D 3 - - - 0x01E0B4 07:E0A4: CE E0     .word _off000_E0CE_05_area_4_boss
- D 3 - - - 0x01E0B6 07:E0A6: D4 E0     .word _off000_E0D4_06_area_8_ceiling
- - - - - - 0x01E0B8 07:E0A8: D6 E0     .word _off000_E0D6_07   ; unused
- D 3 - - - 0x01E0BA 07:E0AA: D6 E0     .word _off000_E0D6_08_area_3_boss
- - - - - - 0x01E0BC 07:E0AC: D8 E0     .word _off000_E0D8_09   ; unused
- D 3 - - - 0x01E0BE 07:E0AE: D8 E0     .word _off000_E0D8_0A_area_7_boss
- D 3 - - - 0x01E0C0 07:E0B0: DA E0     .word _off000_E0DA_0B_area_5_boss
- D 3 - - - 0x01E0C2 07:E0B2: DC E0     .word _off000_E0DC_0C_area_2_boss
- D 3 - - - 0x01E0C4 07:E0B4: E2 E0     .word _off000_E0E2_0D_area_8_boss
- D 3 - - - 0x01E0C6 07:E0B6: E8 E0     .word _off000_E0E8_0E_area_6_change_color
- D 3 - - - 0x01E0C8 07:E0B8: EA E0     .word _off000_E0EA_0F_area_6_boss

_off000_E0BC_01_area_1_boss:
- D 3 - I - 0x01E0CC 07:E0BC: EC E0     .word ofs_040_01_E0EC_00

_off000_E0BE_02_area_4_elevator:
- D 3 - I - 0x01E0CE 07:E0BE: 15 E1     .word ofs_040_02_E115_00
- D 3 - I - 0x01E0D0 07:E0C0: 4B E1     .word ofs_040_02_E14B_01
- D 3 - I - 0x01E0D2 07:E0C2: 7A E1     .word ofs_040_02_E17A_02

_off000_E0C4_03_credits:
- D 3 - I - 0x01E0D4 07:E0C4: 98 E1     .word ofs_040_03_E198_00
- D 3 - I - 0x01E0D6 07:E0C6: AD E1     .word ofs_040_03_E1AD_01
- D 3 - I - 0x01E0D8 07:E0C8: C3 E1     .word ofs_040_03_E1C3_02
- D 3 - I - 0x01E0DA 07:E0CA: F1 E1     .word ofs_040_03_E1F1_03
- D 3 - I - 0x01E0DC 07:E0CC: 07 E2     .word ofs_040_03_E207_04

_off000_E0CE_04:
_off000_E0CE_05_area_4_boss:
- D 3 - I - 0x01E0DE 07:E0CE: 12 E2     .word ofs_040_05_E212_00
- D 3 - I - 0x01E0E0 07:E0D0: 3B E2     .word ofs_040_05_E23B_01
- D 3 - I - 0x01E0E2 07:E0D2: 44 E2     .word ofs_040_05_E244_02

_off000_E0D4_06_area_8_ceiling:
- D 3 - I - 0x01E0E4 07:E0D4: 63 E2     .word ofs_040_06_E263_00

_off000_E0D6_07:
_off000_E0D6_08_area_3_boss:
- D 3 - I - 0x01E0E6 07:E0D6: 83 E2     .word ofs_040_08_E283_00

_off000_E0D8_09:
_off000_E0D8_0A_area_7_boss:
- D 3 - I - 0x01E0E8 07:E0D8: B9 E2     .word ofs_040_0A_E2B9_00

_off000_E0DA_0B_area_5_boss:
- D 3 - I - 0x01E0EA 07:E0DA: CB E2     .word ofs_040_0B_E2CB_00

_off000_E0DC_0C_area_2_boss:
- D 3 - I - 0x01E0EC 07:E0DC: EF E2     .word ofs_040_0C_E2EF_00
- D 3 - I - 0x01E0EE 07:E0DE: 15 E3     .word ofs_040_0C_E315_01
- D 3 - I - 0x01E0F0 07:E0E0: 23 E3     .word ofs_040_0C_E323_02

_off000_E0E2_0D_area_8_boss:
- D 3 - I - 0x01E0F2 07:E0E2: 3E E3     .word ofs_040_0D_E33E_00
- D 3 - I - 0x01E0F4 07:E0E4: 6B E3     .word ofs_040_0D_E36B_01
- D 3 - I - 0x01E0F6 07:E0E6: 79 E3     .word ofs_040_0D_E379_02

_off000_E0E8_0E_area_6_change_color:
- D 3 - I - 0x01E0F8 07:E0E8: A4 E3     .word ofs_040_0E_E3A4_00

_off000_E0EA_0F_area_6_boss:
- D 3 - I - 0x01E0FA 07:E0EA: AA E3     .word ofs_040_0F_E3AA_00

; _________________________________________________________________________________________________________________

ofs_040_01_E0EC_00:
C - - J - - 0x01E0FC 07:E0EC: A0 01     LDY #$05
bra_E0EE_garbage_loop:
C - - - - - 0x01E0FE 07:E0EE: 88        DEY
C - - - - - 0x01E0FF 07:E0EF: D0 FD     BNE bra_E0EE_garbage_loop
C - - - - - 0x01E101 07:E0F1: AD 02 20  LDA $2002

C - - - - - 0x01E104 07:E0F4: A2 22     LDX #> $2240
C - - - - - 0x01E10A 07:E0FA: 8E 06 20  STX $2006
C - - - - - 0x01E106 07:E0F6: A9 40     LDA #< $2240
C - - - - - 0x01E10D 07:E0FD: 8D 06 20  STA $2006
C - - - - - 0x01E108 07:E0F8: A0 00     LDY #$00
C - - - - - 0x01E110 07:E100: 8C 05 20  STY $2005
C - - - - - 0x01E113 07:E103: 8C 05 20  STY $2005

C - - - - - 0x01E116 07:E106: A9 A8     LDA #$A8
C - - - - - 0x01E118 07:E108: 8D 00 20  STA $2000

C - - - - - 0x01E11B 07:E10B: A9 38     LDA #con_chr_bank + $38
C - - - - - 0x01E11D 07:E10D: A2 3A     LDX #con_chr_bank + $3A
C - - - - - 0x01E11F 07:E10F: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
C - - - - - 0x01E122 07:E112: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_02_E115_00:
; C = 0
C - - J - - 0x01E125 07:E115: AD F9 07  LDA ram_07F9
                                        ADC ram_prev_5203
                                        STA ram_prev_5203
C - - - - - 0x01E128 07:E118: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E12B 07:E11B: A0 1E     LDY #$01
bra_E11D_garbage_loop:
C - - - - - 0x01E12D 07:E11D: 88        DEY
C - - - - - 0x01E12E 07:E11E: D0 FD     BNE bra_E11D_garbage_loop
C - - - - - 0x01E130 07:E120: AD 02 20  LDA $2002
C - - - - - 0x01E133 07:E123: A2 22     LDX #> $2280
C - - - - - 0x01E135 07:E125: A9 80     LDA #< $2280
C - - - - - 0x01E137 07:E127: A0 00     LDY #$00
C - - - - - 0x01E139 07:E129: 8E 06 20  STX $2006
C - - - - - 0x01E13C 07:E12C: 8D 06 20  STA $2006
C - - - - - 0x01E13F 07:E12F: 8C 05 20  STY $2005
C - - - - - 0x01E142 07:E132: 8C 05 20  STY $2005
C - - - - - 0x01E145 07:E135: A5 9F     LDA ram_009F
C - - - - - 0x01E147 07:E137: F0 0F     BEQ bra_E148
C - - - - - 0x01E14B 07:E13B: A9 42     LDY #con_chr_bank + $42
C - - - - - 0x01E14D 07:E13D: 8C 00 80  STY $5127
bra_E148:
C - - - - - 0x01E158 07:E148: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_02_E14B_01:
; C = 0
C - - J - - 0x01E15B 07:E14B: AD FA 07  LDA ram_07FA
                                        ADC ram_prev_5203
                                        ADC #$01
                                       ;STA ram_prev_5203
C - - - - - 0x01E15E 07:E14E: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E161 07:E151: A0 14     LDY #$0E
bra_E153_garbage_loop:
C - - - - - 0x01E163 07:E153: 88        DEY
C - - - - - 0x01E164 07:E154: D0 FD     BNE bra_E153_garbage_loop
C - - - - - 0x01E166 07:E156: 20 EC FB  JSR sub_FBEC_запись_chr_банков_фона_42
C - - - - - 0x01E169 07:E159: AD 02 20  LDA $2002
C - - - - - 0x01E16C 07:E15C: A0 00     LDY #$00
C - - - - - 0x01E16E 07:E15E: AE FC 07  LDX ram_07FC
C - - - - - 0x01E171 07:E161: AD FB 07  LDA ram_07FB
C - - - - - 0x01E174 07:E164: 8E 06 20  STX $2006
C - - - - - 0x01E177 07:E167: 8D 06 20  STA $2006
C - - - - - 0x01E17A 07:E16A: 8C 05 20  STY $2005
C - - - - - 0x01E17D 07:E16D: 8C 05 20  STY $2005
C - - - - - 0x01E180 07:E170: E6 28     INC ram_irq_handler_lo
C - - - - - 0x01E182 07:E172: AD FA 07  LDA ram_07FA
C - - - - - 0x01E185 07:E175: F0 08     BEQ bra_E17F
C - - - - - 0x01E187 07:E177: 4C CB FB  JMP loc_FBCB_выход_из_прерывания

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_02_E17A_02:
C - - J - - 0x01E18A 07:E17A: A0 0F     LDY #$0F
bra_E17C_garbage_loop:
C - - - - - 0x01E18C 07:E17C: 88        DEY
C - - - - - 0x01E18D 07:E17D: D0 FD     BNE bra_E17C_garbage_loop
bra_E17F:
C - - - - - 0x01E191 07:E181: AD F5 07  LDY ram_spr_bank_4
C - - - - - 0x01E194 07:E184: 8C 00 80  STY $5127
C - - - - - 0x01E19C 07:E18C: AD F0 07  LDA ram_bg_bank_1
C - - - - - 0x01E19F 07:E18F: AE F1 07  LDX ram_bg_bank_2
C - - - - - 0x01E1A2 07:E192: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
C - - - - - 0x01E1A5 07:E195: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_03_E198_00:
; C = 0
C - - J - - 0x01E1A8 07:E198: A9 20     LDA #$20
                                        ADC ram_prev_5203
                                        STA ram_prev_5203
C - - - - - 0x01E1AA 07:E19A: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E1AD 07:E19D: A0 08     LDY #$08
bra_E19F_garbage_loop:
C - - - - - 0x01E1AF 07:E19F: 88        DEY
C - - - - - 0x01E1B0 07:E1A0: D0 FD     BNE bra_E19F_garbage_loop
C - - - - - 0x01E1B2 07:E1A2: A5 73     LDA ram_0073
C - - - - - 0x01E1B4 07:E1A4: 8D 05 20  STA $2005
C - - - - - 0x01E1B7 07:E1A7: 8D 05 20  STA $2005
C - - - - - 0x01E1BA 07:E1AA: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_03_E1AD_01:
; C = 0
C - - J - - 0x01E1BD 07:E1AD: AD F9 07  LDA ram_07F9
                                        ADC ram_prev_5203
                                        STA ram_prev_5203
C - - - - - 0x01E1C0 07:E1B0: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E1C3 07:E1B3: A0 08     LDY #$08
bra_E1B5_garbage_loop:
C - - - - - 0x01E1C5 07:E1B5: 88        DEY
C - - - - - 0x01E1C6 07:E1B6: D0 FD     BNE bra_E1B5_garbage_loop
C - - - - - 0x01E1C8 07:E1B8: A5 74     LDA ram_0074_конфиг_уровня
C - - - - - 0x01E1CA 07:E1BA: 8D 05 20  STA $2005
C - - - - - 0x01E1CD 07:E1BD: 8D 05 20  STA $2005
C - - - - - 0x01E1D0 07:E1C0: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_03_E1C3_02:
; C = 0
C - - J - - 0x01E1D3 07:E1C3: AD FA 07  LDA ram_07FA
                                        ADC ram_prev_5203
                                        STA ram_prev_5203
C - - - - - 0x01E1D6 07:E1C6: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E1D9 07:E1C9: 20 EC FB  JSR sub_FBEC_запись_chr_банков_фона_42
C - - - - - 0x01E1DC 07:E1CC: A0 14     LDY #$14
bra_E1CE_garbage_loop:
C - - - - - 0x01E1DE 07:E1CE: 88        DEY
C - - - - - 0x01E1DF 07:E1CF: D0 FD     BNE bra_E1CE_garbage_loop
C - - - - - 0x01E1E1 07:E1D1: AD 02 20  LDA $2002
C - - - - - 0x01E1E4 07:E1D4: AE FC 07  LDX ram_07FC
C - - - - - 0x01E1E7 07:E1D7: AD FB 07  LDA ram_07FB
C - - - - - 0x01E1EA 07:E1DA: AC F6 07  LDY ram_07F6
C - - - - - 0x01E1ED 07:E1DD: 8E 06 20  STX $2006
C - - - - - 0x01E1F0 07:E1E0: 8D 06 20  STA $2006
C - - - - - 0x01E1F3 07:E1E3: 8C 05 20  STY $2005
C - - - - - 0x01E1F6 07:E1E6: 8C 05 20  STY $2005
C - - - - - 0x01E1F9 07:E1E9: A9 00     LDA #$44    ; con_mirroring_V
C - - - - - 0x01E1FB 07:E1EB: 8D 00 A0  STA $5105
C - - - - - 0x01E1FE 07:E1EE: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_03_E1F1_03:
; C = 0
C - - J - - 0x01E201 07:E1F1: A9 40     LDA #$40
                                        ADC ram_prev_5203
                                       ;STA ram_prev_5203
C - - - - - 0x01E203 07:E1F3: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E206 07:E1F6: A0 02     LDY #$02
bra_E1F8_garbage_loop:
C - - - - - 0x01E208 07:E1F8: 88        DEY
C - - - - - 0x01E209 07:E1F9: D0 FD     BNE bra_E1F8_garbage_loop
C - - - - - 0x01E20B 07:E1FB: AD F0 07  LDA ram_bg_bank_1
C - - - - - 0x01E20E 07:E1FE: AE F1 07  LDX ram_bg_bank_2
C - - - - - 0x01E211 07:E201: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
C - - - - - 0x01E214 07:E204: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_03_E207_04:
C - - J - - 0x01E217 07:E207: A0 08     LDY #$08
bra_E209_garbage_loop:
C - - - - - 0x01E219 07:E209: 88        DEY
C - - - - - 0x01E21A 07:E20A: D0 FD     BNE bra_E209_garbage_loop
C - - - - - 0x01E21C 07:E20C: 20 EC FB  JSR sub_FBEC_запись_chr_банков_фона_42
C - - - - - 0x01E21F 07:E20F: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_05_E212_00:
; C = 0
C - - J - - 0x01E222 07:E212: AD F9 07  LDA ram_07F9
                                        ADC ram_prev_5203
                                        STA ram_prev_5203
C - - - - - 0x01E225 07:E215: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E228 07:E218: A0 09     LDY #$09
bra_E21A_garbage_loop:
C - - - - - 0x01E22A 07:E21A: 88        DEY
C - - - - - 0x01E22B 07:E21B: D0 FD     BNE bra_E21A_garbage_loop
C - - - - - 0x01E22D 07:E21D: AD 02 20  LDA $2002
C - - - - - 0x01E230 07:E220: AD F7 07  LDA ram_07F7
C - - - - - 0x01E233 07:E223: 8D 00 20  STA $2000
C - - - - - 0x01E236 07:E226: AD F6 07  LDA ram_07F6
C - - - - - 0x01E239 07:E229: 8D 05 20  STA $2005
C - - - - - 0x01E23C 07:E22C: 8D 05 20  STA $2005
C - - - - - 0x01E23F 07:E22F: A9 08     LDA #con_chr_bank + $08
C - - - - - 0x01E241 07:E231: A2 14     LDX #con_chr_bank + $14
C - - - - - 0x01E243 07:E233: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
loc_E236:
C D 3 - - - 0x01E246 07:E236: E6 28     INC ram_irq_handler_lo
C - - - - - 0x01E248 07:E238: 4C CB FB  JMP loc_FBCB_выход_из_прерывания

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_05_E23B_01:
; C = 0
C - - J - - 0x01E24B 07:E23B: AD FA 07  LDA ram_07FA
                                        ADC ram_prev_5203
                                        ADC #$02
                                       ;STA ram_prev_5203
C - - - - - 0x01E24E 07:E23E: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E251 07:E241: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_05_E244_02:
C - - J - - 0x01E254 07:E244: A0 09     LDY #$01
bra_E246_garbage_loop:
C - - - - - 0x01E256 07:E246: 88        DEY
C - - - - - 0x01E257 07:E247: D0 FD     BNE bra_E246_garbage_loop
C - - - - - 0x01E259 07:E249: A5 FF     LDA ram_for_2000
C - - - - - 0x01E25B 07:E24B: 8D 00 20  STA $2000
C - - - - - 0x01E25E 07:E24E: A9 00     LDA #$00
C - - - - - 0x01E260 07:E250: 8D 05 20  STA $2005
C - - - - - 0x01E263 07:E253: 8D 05 20  STA $2005
C - - - - - 0x01E266 07:E256: A9 08     LDA #con_chr_bank + $08
C - - - - - 0x01E268 07:E258: A2 0A     LDX #con_chr_bank + $0A
C - - - - - 0x01E26A 07:E25A: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
C - - - - - 0x01E270 07:E260: 4C CB FB  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_06_E263_00:
C - - J - - 0x01E273 07:E263: A0 09     LDY #$09
bra_E265_garbage_loop:
C - - - - - 0x01E275 07:E265: 88        DEY
C - - - - - 0x01E276 07:E266: D0 FD     BNE bra_E265_garbage_loop
C - - - - - 0x01E278 07:E268: AD 02 20  LDA $2002
C - - - - - 0x01E27B 07:E26B: AE FC 07  LDX ram_07FC
C - - - - - 0x01E27E 07:E26E: AD FB 07  LDA ram_07FB
C - - - - - 0x01E281 07:E271: AC F6 07  LDY ram_07F6
C - - - - - 0x01E284 07:E274: 8E 06 20  STX $2006
C - - - - - 0x01E287 07:E277: 8D 06 20  STA $2006
C - - - - - 0x01E28A 07:E27A: 8C 05 20  STY $2005
C - - - - - 0x01E28D 07:E27D: 8C 05 20  STY $2005
C - - - - - 0x01E290 07:E280: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_08_E283_00:
C - - J - - 0x01E293 07:E283: A0 04     LDY #$03
bra_E285_garbage_loop:
C - - - - - 0x01E295 07:E285: 88        DEY
C - - - - - 0x01E296 07:E286: D0 FD     BNE bra_E285_garbage_loop
C - - - - - 0x01E298 07:E288: AD 02 20  LDA $2002
C - - - - - 0x01E29B 07:E28B: A2 22     LDX #> $2280
C - - - - - 0x01E2A2 07:E292: 8E 06 20  STX $2006
C - - - - - 0x01E29D 07:E28D: A9 80     LDA #< $2280
C - - - - - 0x01E2A5 07:E295: 8D 06 20  STA $2006
C - - - - - 0x01E29F 07:E28F: AC F6 07  LDY ram_07F6
C - - - - - 0x01E2A8 07:E298: 8C 05 20  STY $2005
C - - - - - 0x01E2AB 07:E29B: 8C 05 20  STY $2005
C - - - - - 0x01E2B0 07:E2A0: A9 12     LDY #con_chr_bank + $12
C - - - - - 0x01E2B7 07:E2A7: 8D 01 80  STY $5128
                                        INY
                                        STY $5129
C - - - - - 0x01E2B2 07:E2A2: A2 10     LDY #con_chr_bank + $10
                                        STY $512A
C - - - - - 0x01E2BA 07:E2AA: C8        INY
C - - - - - 0x01E2BB 07:E2AB: 8C 00 80  STY $512B
C - - - - - 0x01E2C6 07:E2B6: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_0A_E2B9_00:
C - - J - - 0x01E2C9 07:E2B9: A0 0D     LDY #$0D
bra_E2BB_garbage_loop:
C - - - - - 0x01E2CB 07:E2BB: 88        DEY
C - - - - - 0x01E2CC 07:E2BC: D0 FD     BNE bra_E2BB_garbage_loop
C - - - - - 0x01E2CE 07:E2BE: AD 02 20  LDA $2002
C - - - - - 0x01E2D1 07:E2C1: A9 30     LDA #con_chr_bank + $30
C - - - - - 0x01E2D3 07:E2C3: A2 2E     LDX #con_chr_bank + $2E
C - - - - - 0x01E2D5 07:E2C5: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
C - - - - - 0x01E2D8 07:E2C8: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_0B_E2CB_00:
C - - J - - 0x01E2DB 07:E2CB: A0 07     LDY #$07
bra_E2CD_garbage_loop:
C - - - - - 0x01E2DD 07:E2CD: 88        DEY
C - - - - - 0x01E2DE 07:E2CE: D0 FD     BNE bra_E2CD_garbage_loop
C - - - - - 0x01E2E0 07:E2D0: AD 02 20  LDA $2002
C - - - - - 0x01E2E3 07:E2D3: A2 2E     LDX #> $2E20
C - - - - - 0x01E2E5 07:E2D5: A9 20     LDA #< $2E20
C - - - - - 0x01E2E7 07:E2D7: A0 00     LDY #$00
C - - - - - 0x01E2E9 07:E2D9: 8E 06 20  STX $2006
C - - - - - 0x01E2EC 07:E2DC: 8D 06 20  STA $2006
C - - - - - 0x01E2EF 07:E2DF: 8C 05 20  STY $2005
C - - - - - 0x01E2F2 07:E2E2: 8C 05 20  STY $2005
C - - - - - 0x01E2F5 07:E2E5: A9 20     LDA #con_chr_bank + $20
C - - - - - 0x01E2F7 07:E2E7: A2 22     LDX #con_chr_bank + $22
C - - - - - 0x01E2F9 07:E2E9: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
C - - - - - 0x01E2FC 07:E2EC: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_0C_E2EF_00:
; C = 0
C - - J - - 0x01E2FF 07:E2EF: AD F9 07  LDA ram_07F9
                                        ADC ram_prev_5203
                                        STA ram_prev_5203
C - - - - - 0x01E302 07:E2F2: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E305 07:E2F5: A0 06     LDY #$06
bra_E2F7_garbage_loop:
C - - - - - 0x01E307 07:E2F7: 88        DEY
C - - - - - 0x01E308 07:E2F8: D0 FD     BNE bra_E2F7_garbage_loop
C - - - - - 0x01E30A 07:E2FA: AD 02 20  LDA $2002
C - - - - - 0x01E30D 07:E2FD: AE FC 07  LDX ram_07FC
C - - - - - 0x01E310 07:E300: AD FB 07  LDA ram_07FB
C - - - - - 0x01E313 07:E303: AC F6 07  LDY ram_07F6
C - - - - - 0x01E316 07:E306: 8E 06 20  STX $2006
C - - - - - 0x01E319 07:E309: 8D 06 20  STA $2006
C - - - - - 0x01E31C 07:E30C: 8C 05 20  STY $2005
C - - - - - 0x01E31F 07:E30F: 8C 05 20  STY $2005
C - - - - - 0x01E322 07:E312: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_0C_E315_01:
; C = 0
C - - J - - 0x01E325 07:E315: AD FA 07  LDA ram_07FA
                                        ADC ram_prev_5203
                                        ADC #$02
                                       ;STA ram_prev_5203
C - - - - - 0x01E328 07:E318: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E32B 07:E31B: A0 02     LDY #$02
bra_E31D_garbage_loop:
C - - - - - 0x01E32D 07:E31D: 88        DEY
C - - - - - 0x01E32E 07:E31E: D0 FD     BNE bra_E31D_garbage_loop
C - - - - - 0x01E330 07:E320: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_0C_E323_02:
C - - J - - 0x01E333 07:E323: A0 08     LDY #$08
bra_E325_garbage_loop:
C - - - - - 0x01E335 07:E325: 88        DEY
C - - - - - 0x01E336 07:E326: D0 FD     BNE bra_E325_garbage_loop
C - - - - - 0x01E338 07:E328: AD 02 20  LDA $2002
C - - - - - 0x01E33B 07:E32B: A2 23     LDX #> $2300
C - - - - - 0x01E33D 07:E32D: A9 00     LDA #< $2300
C - - - - - 0x01E33F 07:E32F: 8E 06 20  STX $2006
C - - - - - 0x01E342 07:E332: 8D 06 20  STA $2006
C - - - - - 0x01E345 07:E335: 8D 05 20  STA $2005
C - - - - - 0x01E348 07:E338: 8D 05 20  STA $2005
C - - - - - 0x01E34B 07:E33B: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_0D_E33E_00:
; C = 0
C - - J - - 0x01E34E 07:E33E: AD F9 07  LDA ram_07F9
                                        ADC ram_prev_5203
                                        ADC #$01
                                        STA ram_prev_5203
C - - - - - 0x01E351 07:E341: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E354 07:E344: A0 09     LDY #$09
bra_E346_garbage_loop:
C - - - - - 0x01E356 07:E346: 88        DEY
C - - - - - 0x01E357 07:E347: D0 FD     BNE bra_E346_garbage_loop
C - - - - - 0x01E359 07:E349: A9 70     LDA #con_chr_bank + $70
C - - - - - 0x01E35B 07:E34B: A2 72     LDX #con_chr_bank + $72
C - - - - - 0x01E35D 07:E34D: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
C - - - - - 0x01E360 07:E350: AD 02 20  LDA $2002
C - - - - - 0x01E363 07:E353: AE FC 07  LDX ram_07FC
C - - - - - 0x01E366 07:E356: AD FB 07  LDA ram_07FB
C - - - - - 0x01E369 07:E359: AC F6 07  LDY ram_07F6
C - - - - - 0x01E36C 07:E35C: 8E 06 20  STX $2006
C - - - - - 0x01E36F 07:E35F: 8D 06 20  STA $2006
C - - - - - 0x01E372 07:E362: 8C 05 20  STY $2005
C - - - - - 0x01E375 07:E365: 8C 05 20  STY $2005
C - - - - - 0x01E378 07:E368: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_0D_E36B_01:
; C = 0
C - - J - - 0x01E37B 07:E36B: AD FA 07  LDA ram_07FA
                                        ADC ram_prev_5203
                                        ADC #$01
                                       ;STA ram_prev_5203
C - - - - - 0x01E37E 07:E36E: 8D 00 C0  STA $5203
                                        LDA #$80
                                        STA $5204
C - - - - - 0x01E381 07:E371: A0 03     LDY #$03
bra_E373_garbage_loop:
C - - - - - 0x01E383 07:E373: 88        DEY
C - - - - - 0x01E384 07:E374: D0 FD     BNE bra_E373_garbage_loop
C - - - - - 0x01E386 07:E376: 4C 36 E2  JMP loc_E236

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ofs_040_0D_E379_02:
C - - J - - 0x01E389 07:E379: A0 07     LDY #$03
bra_E37B_garbage_loop:
C - - - - - 0x01E38B 07:E37B: 88        DEY
C - - - - - 0x01E38C 07:E37C: D0 FD     BNE bra_E37B_garbage_loop
C - - - - - 0x01E38E 07:E37E: AD F0 07  LDA ram_bg_bank_1
C - - - - - 0x01E391 07:E381: AE F1 07  LDX ram_bg_bank_2
C - - - - - 0x01E394 07:E384: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
C - - - - - 0x01E397 07:E387: A0 0E     LDY #$0E
bra_E389_garbage_loop:
C - - - - - 0x01E399 07:E389: 88        DEY
C - - - - - 0x01E39A 07:E38A: D0 FD     BNE bra_E389_garbage_loop
C - - - - - 0x01E39C 07:E38C: AD 02 20  LDA $2002
C - - - - - 0x01E39F 07:E38F: A2 23     LDX #> $2300
C - - - - - 0x01E3A1 07:E391: A9 00     LDA #< $2300
C - - - - - 0x01E3A3 07:E393: A4 FD     LDY ram_scroll_X
C - - - - - 0x01E3A5 07:E395: 8E 06 20  STX $2006
C - - - - - 0x01E3A8 07:E398: 8D 06 20  STA $2006
C - - - - - 0x01E3AB 07:E39B: 8C 05 20  STY $2005
C - - - - - 0x01E3AE 07:E39E: 8C 05 20  STY $2005
C - - - - - 0x01E3B1 07:E3A1: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; _________________________________________________________________________________________________________________

ofs_040_0E_E3A4_00:
C - - J - - 0x01E3B4 07:E3A4: A9 4C     LDA #con_chr_bank + $4C
C - - - - - 0x01E3B6 07:E3A6: A2 52     LDX #con_chr_bank + $52
C - - - - - 0x01E3B8 07:E3A8: D0 04     BNE bra_E3AE    ; jmp

; _________________________________________________________________________________________________________________

ofs_040_0F_E3AA_00:
C - - J - - 0x01E3BA 07:E3AA: A9 50     LDA #con_chr_bank + $50
C - - - - - 0x01E3BC 07:E3AC: A2 52     LDX #con_chr_bank + $52
bra_E3AE:
C - - - - - 0x01E3BE 07:E3AE: A0 05     LDY #$01
bra_E3B0_garbage_loop:
C - - - - - 0x01E3C0 07:E3B0: 88        DEY
C - - - - - 0x01E3C1 07:E3B1: D0 FD     BNE bra_E3B0_garbage_loop
C - - - - - 0x01E3C3 07:E3B3: 20 EF FB  JSR sub_FBEF_запись_chr_банков_фона
C - - - - - 0x01E3C6 07:E3B6: 4C 5D E2  JMP loc_FBCB_выход_из_прерывания

; ******************************************************************************************************************

sub_FC8F_выключить_IRQ:
C - - - - - 0x01FC9F 07:FC8F: A9 FF     LDA #$FF
C - - - - - 0x01FCA1 07:FC91: 85 45     STA ram_номер_сканлинии
C - - - - - 0x01FCA3 07:FC93: 85 46     STA ram_0046
C - - - - - 0x01FCA5 07:FC95: 85 47     STA ram_0047
C - - - - - 0x01FCA7 07:FC97: A9 00     LDA #con_irq_disable 
C - - - - - 0x01FCA9 07:FC99: 85 27     STA ram_irq_handler_hi
C - - - - - 0x01FCAB 07:FC9B: 85 28     STA ram_irq_handler_lo
C - - - - - 0x01FCAD 07:FC9D: 85 2B     STA ram_002B
C - - - - - 0x01FCAF 07:FC9F: 60        RTS

; ******************************************************************************************************************

sub_FCA0_записать_скролл_и_включить_NMI:
C - - - - - 0x01FCB0 07:FCA0: AD 02 20  LDA $2002
C - - - - - 0x01FCB3 07:FCA3: A9 20     LDA #> $2000
C - - - - - 0x01FCB5 07:FCA5: 8D 06 20  STA $2006
C - - - - - 0x01FCB8 07:FCA8: A9 00     LDA #< $2000
C - - - - - 0x01FCBA 07:FCAA: 8D 06 20  STA $2006
C - - - - - 0x01FCBD 07:FCAD: AD 02 20  LDA $2002
C - - - - - 0x01FCC0 07:FCB0: A5 FD     LDA ram_scroll_X
C - - - - - 0x01FCC2 07:FCB2: 8D 05 20  STA $2005
C - - - - - 0x01FCC5 07:FCB5: A5 FC     LDA ram_scroll_Y
C - - - - - 0x01FCC7 07:FCB7: 8D 05 20  STA $2005
loc_0x01FCCA_включить_NMI:
C D 3 - - - 0x01FCCA 07:FCBA: A5 FF     LDA ram_for_2000
C - - - - - 0x01FCCC 07:FCBC: 09 80     ORA #$80
C - - - - - 0x01FCCE 07:FCBE: 85 FF     STA ram_for_2000
C - - - - - 0x01FCD0 07:FCC0: 8D 00 20  STA $2000
C - - - - - 0x01FCD3 07:FCC3: 60        RTS

; ******************************************************************************************************************

sub_FCFC_обработать_регистры_джойстиков:
C - - - - - 0x01FD0C 07:FCFC: A2 00     LDX #$00
C - - - - - 0x01FD0E 07:FCFE: 20 33 FD  JSR sub_FD33_read_regs
C - - - - - 0x01FD11 07:FD01: A2 02     LDX #$02
C - - - - - 0x01FD13 07:FD03: 20 33 FD  JSR sub_FD33_read_regs
C - - - - - 0x01FD16 07:FD06: A5 00     LDA ram_0000
C - - - - - 0x01FD18 07:FD08: C5 02     CMP ram_0002
C - - - - - 0x01FD1A 07:FD0A: D0 1C     BNE bra_FD28_check_failed
C - - - - - 0x01FD1C 07:FD0C: A5 01     LDA ram_0001
C - - - - - 0x01FD1E 07:FD0E: C5 03     CMP ram_0003
C - - - - - 0x01FD20 07:FD10: D0 16     BNE bra_FD28_check_failed
C - - - - - 0x01FD22 07:FD12: A2 00     LDX #$00
C - - - - - 0x01FD24 07:FD14: 20 18 FD  JSR sub_FD18
C - - - - - 0x01FD27 07:FD17: E8        INX ; 01
sub_FD18:
C - - - - - 0x01FD28 07:FD18: B5 00     LDA ram_0000,X
C - - - - - 0x01FD2A 07:FD1A: A8        TAY
C - - - - - 0x01FD2B 07:FD1B: 55 F7     EOR ram_копия_удержанная_кнопка,X
C - - - - - 0x01FD2D 07:FD1D: 35 00     AND ram_0000,X
C - - - - - 0x01FD2F 07:FD1F: 95 F1     STA ram_нажатая_кнопка,X
C - - - - - 0x01FD31 07:FD21: 95 F5     STA ram_копия_нажатая_кнопка,X
C - - - - - 0x01FD33 07:FD23: 94 F3     STY ram_удержанная_кнопка,X
C - - - - - 0x01FD35 07:FD25: 94 F7     STY ram_копия_удержанная_кнопка,X
C - - - - - 0x01FD37 07:FD27: 60        RTS
bra_FD28_check_failed:
- - - - - - 0x01FD38 07:FD28: A9 00     LDA #$00
- - - - - - 0x01FD3A 07:FD2A: 85 F1     STA ram_нажатая_кнопка
- - - - - - 0x01FD3C 07:FD2C: 85 F5     STA ram_копия_нажатая_кнопка
- - - - - - 0x01FD3E 07:FD2E: 85 F2     STA ram_нажатая_кнопка + $01
- - - - - - 0x01FD40 07:FD30: 85 F6     STA ram_копия_нажатая_кнопка + $01
- - - - - - 0x01FD42 07:FD32: 60        RTS

; ******************************************************************************************************************

sub_FD33_read_regs:
C - - - - - 0x01FD43 07:FD33: A0 01     LDY #$01
C - - - - - 0x01FD45 07:FD35: 8C 16 40  STY $4016
C - - - - - 0x01FD48 07:FD38: 88        DEY ; 00
C - - - - - 0x01FD49 07:FD39: 8C 16 40  STY $4016
C - - - - - 0x01FD4C 07:FD3C: A0 08     LDY #$08
bra_FD3E_loop:
C - - - - - 0x01FD4E 07:FD3E: AD 16 40  LDA $4016
C - - - - - 0x01FD51 07:FD41: 85 04     STA ram_0004
C - - - - - 0x01FD53 07:FD43: 4A        LSR
C - - - - - 0x01FD54 07:FD44: 05 04     ORA ram_0004
C - - - - - 0x01FD56 07:FD46: 4A        LSR
C - - - - - 0x01FD57 07:FD47: 36 00     ROL ram_0000,X
C - - - - - 0x01FD59 07:FD49: AD 17 40  LDA $4017
C - - - - - 0x01FD5C 07:FD4C: 85 05     STA ram_0005
C - - - - - 0x01FD5E 07:FD4E: 4A        LSR
C - - - - - 0x01FD5F 07:FD4F: 05 05     ORA ram_0005
C - - - - - 0x01FD61 07:FD51: 4A        LSR
C - - - - - 0x01FD62 07:FD52: 36 01     ROL ram_0001,X
C - - - - - 0x01FD64 07:FD54: 88        DEY
C - - - - - 0x01FD65 07:FD55: D0 E7     BNE bra_FD3E_loop
C - - - - - 0x01FD67 07:FD57: 60        RTS



; ******************************************************************************************************************

sub_FDC8:
C - - - - - 0x01FDD8 07:FDC8: AD 00 80  LDA $8000
C - - - - - 0x01FDDB 07:FDCB: 48        PHA
C - - - - - 0x01FDDC 07:FDCC: AD FF BF  LDA $BFFF
C - - - - - 0x01FDDF 07:FDCF: 48        PHA
C - - - - - 0x01FDE0 07:FDD0: A9 3C     LDA #con_prg_bank + $28 ; 28-29
C - - - - - 0x01FDE2 07:FDD2: 20 94 FD  JSR sub_FD6F_смена_2х_подряд_prg_банков_без_возврата
C - - - - - 0x01FDE5 07:FDD5: 20 3C 81  JSR sub_0x01814C
C - - - - - 0x01FDE8 07:FDD8: 68        PLA
C - - - - - 0x01FDE9 07:FDD9: A8        TAY
C - - - - - 0x01FDEA 07:FDDA: 68        PLA
C - - - - - 0x01FDEB 07:FDDB: 4C 96 FD  JMP loc_FD71_смена_prg_банков_без_возврата


sub_FDDE_play_music:
sub_0x01FDEE_play_music:
                                        BIT ram_флаг_музыки_звука
                                        BVS bra_FDF5_RTS
                                        JMP loc_FDEE_play_sound_напрямую
sub_FDDE_play_sound:
loc_FDDE_play_sound:
sub_0x01FDEE_play_sound:
loc_0x01FDEE_play_sound:
                                        BIT ram_флаг_музыки_звука
                                        BMI bra_FDF5_RTS
sub_0x01FDEE_play_sound_напрямую:                          
loc_FDEE_play_sound_напрямую:
loc_0x01FDEE_play_sound_напрямую:
                                        PHA ; номер звука
C - - - - - 0x01FDEF 07:FDDF: A5 1C     LDA ram_001C
C - - - - - 0x01FDF1 07:FDE1: 09 80     ORA #$80
C - - - - - 0x01FDF3 07:FDE3: 85 1C     STA ram_001C
C - - - - - 0x01FDF5 07:FDE5: 20 61 FD  JSR sub_FD61_смена_prg_банков_на_28_29_с_возможностью_возврата
                                        PLA ; номер звука
C - - - - - 0x01FDF9 07:FDE9: 20 F6 FD  JSR sub_FDF6
C - - - - - 0x01FDFC 07:FDEC: 20 8B FD  JSR sub_FD8B_вернуть_prg_банки
C - - - - - 0x01FDFF 07:FDEF: A5 1C     LDA ram_001C
C - - - - - 0x01FE01 07:FDF1: 29 7F     AND #$7F
C - - - - - 0x01FE03 07:FDF3: 85 1C     STA ram_001C
bra_FDF5_RTS:
C - - - - - 0x01FE05 07:FDF5: 60        RTS

sub_0x01FE06:
sub_FDF6:
C - - - - - 0x01FE10 07:FE00: 20 AB FD  JSR sub_FDAB_выбрать_второй_банк_с_данными_музыки
C - - - - - 0x01FE16 07:FE06: 20 39 80  JSR sub_0x018049_play_sound
                                        RTS



sub_FE0E_остановить_звуковой_движок:
sub_0x01FE1E_остановить_звуковой_движок:
loc_0x01FE1E_остановить_звуковой_движок:
C D 3 - - - 0x01FE1E 07:FE0E: 20 61 FD  JSR sub_FD61_смена_prg_банков_на_28_29_с_возможностью_возврата
C - - - - - 0x01FE21 07:FE11: 20 01 80  JSR sub_0x018011_остановить_звуковой_движок
C - - - - - 0x01FE24 07:FE14: 4C 8B FD  JMP loc_FD8B_вернуть_prg_банки



sub_FE17_спрайтовый_движок:
C - - - - - 0x01FE27 07:FE17: A9 36     LDA #con_prg_bank + $22
C - - - - - 0x01FE29 07:FE19: 20 6F FD  JSR sub_FD6F_смена_2х_подряд_prg_банков_без_возврата
C - - - - - 0x01FE2C 07:FE1C: 4C BE 80  JMP loc_0x00C0CE_спрайтовый_движок


sub_0x01FE8A_bankswitch_отрисовка_текста_через_буфер_0300x:
sub_FE7A_bankswitch_отрисовка_текста_через_буфер_0300x:
C - - - - - 0x01FE8A 07:FE7A: 48        PHA
C - - - - - 0x01FE8B 07:FE7B: A9 30     LDA #con_prg_bank + $20
C - - - - - 0x01FE8D 07:FE7D: 20 6F FD  JSR sub_FD63_смена_2х_подряд_prg_банков_с_возможностью_возврата
C - - - - - 0x01FE90 07:FE80: 68        PLA
C - - - - - 0x01FE91 07:FE81: 4C 7C 97  JSR sub_0x00178C_отрисовка_текста_через_буфер_0300x
                                        JMP loc_FD8B_вернуть_prg_банки


sub_0x00FE84_XFF_обнуление_экранов_PPU:
                                        LDX #$FF
sub_0x01FE94_bankswitch_отрисовка_экранов:
C D 3 - - - 0x01FE94 07:FE84: A9 30     LDA #con_prg_bank + $20
C - - - - - 0x01FE96 07:FE86: 20 6F FD  JSR sub_FD63_смена_2х_подряд_prg_банков_с_возможностью_возврата
C - - - - - 0x01FE99 07:FE89: 4C 8E 98  JSR sub_0x00189E_отрисовка_экранов
                                        JMP loc_FD8B_вернуть_prg_банки

sub_0x01FE9C:
C - - - - - 0x01FE9C 07:FE8C: 20 FF FE  JSR sub_FEFF_подготовить_prg_банки_для_уровня
C - - - - - 0x01FE9F 07:FE8F: 4C 0B EB  JSR sub_EB0B
                                        JMP loc_FD8B_вернуть_prg_банки

sub_0x01FEA2:
C - - - - - 0x01FEA2 07:FE92: 20 FF FE  JSR sub_FEFF_подготовить_prg_банки_для_уровня
C - - - - - 0x01FEA5 07:FE95: 4C 58 EB  JSR sub_EB58
                                        JMP loc_FD8B_вернуть_prg_банки

; ******************************************************************************************************************

sub_FEA4_подготовка_и_выбор_банков_для_перерисовки_части_фона_через_буфер:
sub_0x01FEB4_подготовка_и_выбор_банков_для_перерисовки_части_фона_через_буфер:
C D 3 - - - 0x01FEB4 07:FEA4: A2 E0     LDX #$E0
loc_FEA6_подготовка_и_выбор_банков_для_перерисовки_части_фона_через_буфер:
C D 3 - - - 0x01FEB6 07:FEA6: 86 06     STX ram_0006
C - - - - - 0x01FEB8 07:FEA8: 48        PHA
C - - - - - 0x01FEB9 07:FEA9: 98        TYA
C - - - - - 0x01FEBA 07:FEAA: 48        PHA
C - - - - - 0x01FEBB 07:FEAB: 20 FF FE  JSR sub_FEFF_подготовить_prg_банки_для_уровня
C - - - - - 0x01FEBE 07:FEAE: 68        PLA
C - - - - - 0x01FEBF 07:FEAF: A8        TAY
C - - - - - 0x01FEC0 07:FEB0: 68        PLA
C - - - - - 0x01FEC1 07:FEB1: 20 A9 F0  JSR sub_F0A9_перерисовка_части_фона_через_буфер
C - - - - - 0x01FEC4 07:FEB4: 4C 58 FD  JMP loc_FD8B_вернуть_prg_банки


; ******************************************************************************************************************

sub_E3B9_обработка_игры_и_экранов_смена_банка:
                                        LDA #con_prg_bank + $24
                                        JSR sub_FD6F_смена_2х_подряд_prg_банков_без_возврата
                                        JMP loc_0x008010_обработка_игры_и_экранов

; ******************************************************************************************************************

sub_FEFF_подготовить_prg_банки_для_уровня:
; для перерисовки фона
                                        LDY ram_номер_уровня
                                        LDA tbl_FF07_prg_bank,Y
                                        JMP loc_FD63_смена_2х_подряд_prg_банков_с_возможностью_возврата
tbl_FF07_prg_bank:
- D 3 - - - 0x01FF17 07:FF07: 34        .byte con_prg_bank + $36   ; 00
- D 3 - - - 0x01FF18 07:FF08: 30        .byte con_prg_bank + $36   ; 01
- D 3 - - - 0x01FF19 07:FF09: 36        .byte con_prg_bank + $38   ; 02
- D 3 - - - 0x01FF1A 07:FF0A: 36        .byte con_prg_bank + $38   ; 03
- D 3 - - - 0x01FF1B 07:FF0B: 38        .byte con_prg_bank + $3A   ; 04
- D 3 - - - 0x01FF1C 07:FF0C: 38        .byte con_prg_bank + $3A   ; 05
- D 3 - - - 0x01FF1D 07:FF0D: 3A        .byte con_prg_bank + $3C   ; 06
- D 3 - - - 0x01FF1E 07:FF0E: 3A        .byte con_prg_bank + $3C   ; 07

; ******************************************************************************************************************

sub_FD61_смена_prg_банков_на_28_29_с_возможностью_возврата:
C - - - - - 0x01FD7D 07:FD6D: A9 3C     LDA #con_prg_bank + $28 ; музыкальный банк
sub_FD63_смена_2х_подряд_prg_банков_с_возможностью_возврата:
loc_FD63_смена_2х_подряд_prg_банков_с_возможностью_возврата:
C - - - - - 0x01FD71 07:FD61: AC 00 80  LDY $8000
C - - - - - 0x01FD74 07:FD64: 8C EE 07  STY ram_prg_bank
C - - - - - 0x01FD77 07:FD67: AC FF BF  LDY $BFFF
C - - - - - 0x01FD7A 07:FD6A: 8C EF 07  STY ram_prg_bank + $01
sub_0x01FD7F_смена_2х_подряд_prg_банков_без_возврата:
sub_FD6F_смена_2х_подряд_prg_банков_без_возврата:
loc_FD6F_смена_2х_подряд_prg_банков_без_возврата:
C D 3 - - - 0x01FD7F 07:FD6F: A8        TAY
C - - - - - 0x01FD80 07:FD70: C8        INY
loc_FD71_смена_prg_банков_без_возврата:
C - - - - - 0x01FD8B 07:FD7B: 8D 01 80  STA $5114   ; 8000
C - - - - - 0x01FD94 07:FD84: 8C 01 80  STY $5115   ; A000
C - - - - - 0x01FD9A 07:FD8A: 60        RTS

; ******************************************************************************************************************

sub_FD8B_вернуть_prg_банки:
loc_FD8B_вернуть_prg_банки:
C D 3 - - - 0x01FD9B 07:FD8B: AD EE 07  LDA ram_prg_bank
C - - - - - 0x01FD9E 07:FD8E: AC EF 07  LDY ram_prg_bank + $01
C - - - - - 0x01FDA1 07:FD91: 4C 71 FD  JMP loc_FD71_смена_prg_банков_без_возврата

; ******************************************************************************************************************

sub_FDAB_выбрать_второй_банк_с_данными_музыки:
sub_0x01FDBB_выбрать_второй_банк_с_данными_музыки:
C - - - - - 0x01FDBB 07:FDAB: A0 31     LDY #con_prg_bank + $2A ; 3й дополнительный банк с музыкой
C - - - - - 0x01FDBD 07:FDAD: C9 32     CMP #con_sound_32
C - - - - - 0x01FDBF 07:FDAF: F0 06     BEQ bra_FDB7_32_36
C - - - - - 0x01FDC1 07:FDB1: C9 36     CMP #con_sound_36
C - - - - - 0x01FDC3 07:FDB3: F0 02     BEQ bra_FDB7_32_36
C - - - - - 0x01FDC5 07:FDB5: A0 3D     LDY #con_prg_bank + $29 ; банки музыки 28-29
bra_FDB7_32_36:
C - - - - - 0x01FDCC 07:FDBC: 8C 01 80  STY $5115   ; A000
C - - - - - 0x01FDCF 07:FDBF: 60        RTS

; ******************************************************************************************************************

sub_0x01FEAE_подготовить_данные_для_уровня:
C - - - - - 0x01FEAE 07:FE9E: 20 FF FE  JSR sub_FEFF_подготовить_prg_банки_для_уровня
C - - - - - 0x01FEB1 07:FEA1: 4C 9B F1  JSR sub_F19B_подготовить_данные_для_уровня
                                        JMP loc_FD8B_вернуть_prg_банки

; ******************************************************************************************************************

sub_F19B_подготовить_данные_для_уровня:
C D 3 - - - 0x01F1AB 07:F19B: A5 50     LDA ram_номер_уровня
C - - - - - 0x01F1AD 07:F19D: 0A        ASL
C - - - - - 0x01F1AE 07:F19E: A8        TAY
C - - - - - 0x01F1AF 07:F19F: B9 A4 F2  LDA tbl_F2A4_индексы_метатайлов,Y
C - - - - - 0x01F1B2 07:F1A2: 85 32     STA ram_0032
C - - - - - 0x01F1B4 07:F1A4: B9 A5 F2  LDA tbl_F2A4_индексы_метатайлов + $01,Y
C - - - - - 0x01F1B7 07:F1A7: 85 33     STA ram_0033
C - - - - - 0x01F1B9 07:F1A9: B9 B4 F2  LDA tbl_F2B4_метатайлы,Y
C - - - - - 0x01F1BC 07:F1AC: 85 34     STA ram_0034
C - - - - - 0x01F1BE 07:F1AE: B9 B5 F2  LDA tbl_F2B4_метатайлы + $01,Y
C - - - - - 0x01F1C1 07:F1B1: 85 35     STA ram_0035
C - - - - - 0x01F1C3 07:F1B3: B9 C4 F2  LDA tbl_F2C4_атрибуты_метатайлов,Y
C - - - - - 0x01F1C6 07:F1B6: 85 36     STA ram_0036
C - - - - - 0x01F1C8 07:F1B8: B9 C5 F2  LDA tbl_F2C4_атрибуты_метатайлов + $01,Y
C - - - - - 0x01F1CB 07:F1BB: 85 37     STA ram_0037
C - - - - - 0x01F1CD 07:F1BD: B9 95 F2  LDA tbl_F294_данные_уровня + $01,Y
C - - - - - 0x01F1D0 07:F1C0: 85 31     STA ram_0031
C - - - - - 0x01F1D2 07:F1C2: 85 09     STA ram_0009
C - - - - - 0x01F1D4 07:F1C4: B9 94 F2  LDA tbl_F294_данные_уровня,Y
C - - - - - 0x01F1D7 07:F1C7: 85 08     STA ram_0008
C - - - - - 0x01F1D9 07:F1C9: 18        CLC
C - - - - - 0x01F1DA 07:F1CA: 69 02     ADC #$02
C - - - - - 0x01F1DC 07:F1CC: 85 30     STA ram_0030
C - - - - - 0x01F1DE 07:F1CE: 90 02     BCC bra_F1D2_not_overflow
- - - - - - 0x01F1E0 07:F1D0: E6 31     INC ram_0031
bra_F1D2_not_overflow:
C - - - - - 0x01F1E2 07:F1D2: A0 00     LDY #$00
C - - - - - 0x01F1E4 07:F1D4: B1 08     LDA (ram_0008),Y
C - - - - - 0x01F1E6 07:F1D6: 85 89     STA ram_0089_столбцы_данных_уровня    ; столбцы
C - - - - - 0x01F1E8 07:F1D8: C8        INY ; 01
C - - - - - 0x01F1E9 07:F1D9: B1 08     LDA (ram_0008),Y
C - - - - - 0x01F1EB 07:F1DB: 85 88     STA ram_0088_строки_данных_уровня    ; строки
C - - - - - 0x01F1ED 07:F1DD: A5 50     LDA ram_номер_уровня
C - - - - - 0x01F1EF 07:F1DF: 0A        ASL
C - - - - - 0x01F1F0 07:F1E0: 0A        ASL
C - - - - - 0x01F1F1 07:F1E1: 0A        ASL
C - - - - - 0x01F1F2 07:F1E2: 0A        ASL
C - - - - - 0x01F1F3 07:F1E3: A8        TAY
C - - - - - 0x01F1F4 07:F1E4: A2 00     LDX #$00
bra_F1E6_loop:
C - - - - - 0x01F1F6 07:F1E6: B9 F3 F1  LDA tbl_F1F3,Y
C - - - - - 0x01F1F9 07:F1E9: 9D D0 03  STA ram_03D0,X
C - - - - - 0x01F1FC 07:F1EC: C8        INY
C - - - - - 0x01F1FD 07:F1ED: E8        INX
C - - - - - 0x01F1FE 07:F1EE: E0 10     CPX #$10
C - - - - - 0x01F200 07:F1F0: 90 F4     BCC bra_F1E6_loop
C - - - - - 0x01F202 07:F1F2: 60        RTS

tbl_F294_данные_уровня:
; индексы для данных в 0x01F2B4
- D 3 - - - 0x01F2A4 07:F294: B8 9F     .word _off004_0x009FC8_00_area_1
- D 3 - - - 0x01F2A6 07:F296: 45 AB     .word _off004_0x002B55_01_area_2
- D 3 - - - 0x01F2A8 07:F298: 6A AB     .word _off004_0x00EB7A_02_area_3
- D 3 - - - 0x01F2AA 07:F29A: 77 9A     .word _off004_0x00DA87_03_area_4
- D 3 - - - 0x01F2AC 07:F29C: E1 9D     .word _off004_0x011DF1_04_area_5
- D 3 - - - 0x01F2AE 07:F29E: 26 AD     .word _off004_0x012D36_05_area_6
- D 3 - - - 0x01F2B0 07:F2A0: 4B 98     .word _off004_0x01585B_06_area_7
- D 3 - - - 0x01F2B2 07:F2A2: 17 A8     .word _off004_0x016827_07_area_8

tbl_F2A4_индексы_метатайлов:
; блоки уровней 8x8
- D 3 - - - 0x01F2B4 07:F2A4: F2 9F     .word _off005_0x00A002_00_area_1
- D 3 - - - 0x01F2B6 07:F2A6: 61 AB     .word _off005_0x002B71_01_area_2
- D 3 - - - 0x01F2B8 07:F2A8: 82 AB     .word _off005_0x00EB92_02_area_3
- D 3 - - - 0x01F2BA 07:F2AA: D4 9A     .word _off005_0x00DAE4_03_area_4
- D 3 - - - 0x01F2BC 07:F2AC: 22 9E     .word _off005_0x011E32_04_area_5
- D 3 - - - 0x01F2BE 07:F2AE: 42 AD     .word _off005_0x012D52_05_area_6
- D 3 - - - 0x01F2C0 07:F2B0: 69 98     .word _off005_0x015879_06_area_7
- D 3 - - - 0x01F2C2 07:F2B2: 59 A8     .word _off005_0x016869_07_area_8

tbl_F2B4_метатайлы:
; блоки тайлов 4x4
- D 3 - - - 0x01F2C4 07:F2B4: D8 A4     .word _off006_0x00A4E8_00_area_1
- D 3 - - - 0x01F2C6 07:F2B6: 3F AF     .word _off006_0x002F4F_01_area_2
- D 3 - - - 0x01F2C8 07:F2B8: E4 AF     .word _off006_0x00EFF4_02_area_3
- D 3 - - - 0x01F2CA 07:F2BA: BA 9F     .word _off006_0x00DFCA_03_area_4
- D 3 - - - 0x01F2CC 07:F2BC: C6 A2     .word _off006_0x0122D6_04_area_5
- D 3 - - - 0x01F2CE 07:F2BE: 5A B0     .word _off006_0x01306A_05_area_6
- D 3 - - - 0x01F2D0 07:F2C0: 47 9C     .word _off006_0x015C57_06_area_7
- D 3 - - - 0x01F2D2 07:F2C2: 47 AE     .word _off006_0x016E57_07_area_8

tbl_F2C4_атрибуты_метатайлов:
; атрибуты фона для метатайлов
- D 3 - - - 0x01F2D4 07:F2C4: 18 B4     .word _off007_0x00B428_00_area_1
- D 3 - - - 0x01F2D6 07:F2C6: 8F BE     .word _off007_0x003E9F_01_area_2
- D 3 - - - 0x01F2D8 07:F2C8: F4 B7     .word _off007_0x00F804_02_area_3
- D 3 - - - 0x01F2DA 07:F2CA: BA AA     .word _off007_0x00EACA_03_area_4
- D 3 - - - 0x01F2DC 07:F2CC: 86 AC     .word _off007_0x012C96_04_area_5
- D 3 - - - 0x01F2DE 07:F2CE: 8A B9     .word _off007_0x01399A_05_area_6
- D 3 - - - 0x01F2E0 07:F2D0: 57 A7     .word _off007_0x016767_06_area_7
- D 3 - - - 0x01F2E2 07:F2D2: A7 BC     .word _off007_0x017CB7_07_area_8

tbl_F1F3:
- D 3 - - - 0x01F203 07:F1F3: A0        .byte $A0, $A0, $F8, $F8, $F8, $F8, $FA, $FC, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 00 
- D 3 - - - 0x01F213 07:F203: 1A        .byte $1A, $30, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 01 
- D 3 - - - 0x01F223 07:F213: 27        .byte $27, $27, $42, $42, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 02 
- D 3 - - - 0x01F233 07:F223: 27        .byte $27, $2C, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 03 
- D 3 - - - 0x01F243 07:F233: 2C        .byte $2C, $2E, $36, $36, $36, $36, $37, $38, $39, $3B, $3D, $3F, $FF, $FF, $FF, $FF   ; 04 
- D 3 - - - 0x01F253 07:F243: 21        .byte $21, $58, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 05 
- D 3 - - - 0x01F263 07:F253: 17        .byte $17, $17, $45, $4D, $4D, $4D, $4F, $51, $52, $54, $56, $57, $FF, $FF, $FF, $FF   ; 06 
- D 3 - - - 0x01F273 07:F263: 40        .byte $40, $50, $60, $60, $60, $60, $62, $64, $65, $66, $68, $6A, $FF, $FF, $FF, $FF   ; 07 

; ******************************************************************************************************************

sub_FF0F_запуск_банков_графики:
C - - - - - 0x01FF1F 07:FF0F: A5 26     LDY ram_mirroring
                                        LDA tbl_FF4F_mirroring,Y
C - - - - - 0x01FF21 07:FF11: 8D 00 A0  STA $5105
C - - - - - 0x01FF29 07:FF19: AD F0 07  LDY ram_bg_bank_1
C - - - - - 0x01FF2C 07:FF1C: 8D 01 80  STY $5128
C - - - - - 0x01FF2F 07:FF1F: C8        INY
C - - - - - 0x01FF30 07:FF20: 8C 00 80  STY $5129
C - - - - - 0x01FF33 07:FF23: AD F1 07  LDY ram_bg_bank_2
C - - - - - 0x01FF36 07:FF26: 8D 01 80  STY $512A
C - - - - - 0x01FF39 07:FF29: C8        INY
C - - - - - 0x01FF3A 07:FF2A: 8C 00 80  STY $512B
C - - - - - 0x01FF3D 07:FF2D: AD F2 07  LDA ram_spr_bank_1
C - - - - - 0x01FF40 07:FF30: 8D 01 80  STA $5124
C - - - - - 0x01FF47 07:FF37: AD F3 07  LDA ram_spr_bank_2
C - - - - - 0x01FF4A 07:FF3A: 8D 01 80  STA $5125
C - - - - - 0x01FF51 07:FF41: AD F4 07  LDA ram_spr_bank_3
C - - - - - 0x01FF54 07:FF44: 8D 01 80  STA $5126
C - - - - - 0x01FF5B 07:FF4B: AD F5 07  LDA ram_spr_bank_4
C - - - - - 0x01FF5E 07:FF4E: 8D 01 80  STA $5127
                                        LDY #con_chr_bank + $FC
                                        STY $5120
                                        INY ; con_chr_bank + $FD
                                        STY $5121
                                        INY ; con_chr_bank + $FE
                                        STY $5122
                                        INY ; con_chr_bank + $FF
                                        STY $5123
C - - - - - 0x01FF61 07:FF51: 60        RTS

tbl_FF4F_mirroring:
                                        .byte $44 ; 00 con_mirroring_V
                                        .byte $50 ; 01 con_mirroring_H

; ******************************************************************************************************************

_set_V_flag:
; cyneprepou4uk
                                        .byte $40

; ******************************************************************************************************************

_общий_RTS:
; cyneprepou4uk
                                        RTS

; ******************************************************************************************************************

.out .sprintf("Free bytes in bank 3E: %Xh [%d]", ($FFD0 - *), ($FFD0 - *))

; ******************************************************************************************************************

.segment "MMC5_INIT"
.org $FFD0 ; for listing file
vec_Ресет:
; конфигурация маппера должна находиться
; в фиксированном банке E000-FFFF, поскольку
; банк C000-DFFF не гарантирован после ресета
                                        LDX #$03
                                        STX $5100   ; prg mode 3
                                        STX $5101   ; chr mode 3
                                        DEX ; 02
                                        STX $5104   ; extended ram mode 2
                                        STX $5102   ; disable prg ram protection 1
                                        DEX ; 01
                                        STX $5103   ; disable prg ram protection 2
                                        DEX ; 00
                                        STX $5204   ; disable irq
                                        LDA #$44
                                        STA $5105   ; vertical mirroring
                                        LDA #con_prg_bank + $3E
                                        STA $5116   ; bank for C000-DFFF
                                        JMP loc_FACA_Ресет

; ******************************************************************************************************************

.segment "VECTORS"
- D 3 - - - 0x02000A 07:FFFA: 67 FB     .word vec_FB67_NMI
- D 3 - - - 0x02000C 07:FFFC: CA FA     .word vec_Ресет
- D 3 - - - 0x02000E 07:FFFE: 7F E0     .word vec_E07F_IRQ



