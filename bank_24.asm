.segment "BANK_24"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x008010-0x00C00F

.export loc_0x008010_обработка_игры_и_экранов
.export sub_0x001CA6

; bzk this byte must be placed at 8000
    .byte con_prg_bank + $24   ; 

; ==================================================================================================================
;  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; ==================================================================================================================

loc_0x008010_обработка_игры_и_экранов:
                                        JSR sub_0001_мерцание_экрана
C - - - - - 0x01E3CB 07:E3BB: A5 18     LDA ram_демка
C - - - - - 0x01E3CD 07:E3BD: C9 04     CMP #$04
C - - - - - 0x01E3CF 07:E3BF: D0 03     BEQ bra_E7E9_игра
                                        JMP loc_8010_работа_с_экранами ; 00-03,06

; ******************************************************************************************************************

sub_0001_мерцание_экрана:
                                        LDA ram_счетчик_мерцания_экрана
                                        BEQ bra_0003_RTS
                                        LDA ram_пауза
                                        BNE bra_0003_RTS
                                        DEC ram_счетчик_мерцания_экрана
                                        LDA ram_счетчик_мерцания_экрана
                                        LSR
                                        BCS bra_0003_RTS
                                        AND #$01
                                        TAY
                                        LDA tbl_0002_цвета,Y
                                        STA ram_pal_buffer + $10
                                        JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
bra_0003_RTS:
                                        RTS

tbl_0002_цвета:
                                        .byte $0F   ; черный
                                        .byte $30   ; белый

; ******************************************************************************************************************

loc_E7E9_игра:
bra_E7E9_игра:
C D 3 - - - 0x01E7F9 07:E7E9: A5 38     LDY ram_номер_экрана
                                        LDA tbl_E7F5_lo,y
                                        STA ram_0000
                                        LDA tbl_E7F6_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_E7F5_lo:
- D 3 - I - 0x01E805 07:E7F5: 07 E8     .byte < ofs_033_E807_00_главный_экран
- D 3 - I - 0x01E807 07:E7F7: 69 E8     .byte < ofs_033_E869_01_экран_очков
- D 3 - I - 0x01E809 07:E7F9: 7C E8     .byte < ofs_033_E87C_02_подготовка_уровня
- - - - - - 0x01E80B 07:E7FB: D6 E8     .byte < ofs_033_E8D6_03_игра   ; never used 0x01E7FD
- D 3 - I - 0x01E80D 07:E7FD: 23 E9     .byte < ofs_033_E923_04_автозавершение_уровня
- D 3 - I - 0x01E80F 07:E7FF: F7 E9     .byte < ofs_033_E9F7_05_подготовка_gameover
- D 3 - I - 0x01E811 07:E801: 16 EA     .byte < ofs_033_EA16_06_gameover_музыка
- D 3 - I - 0x01E813 07:E803: 2A EA     .byte < ofs_033_EA2A_07_gameover_выбор_опций
- D 3 - I - 0x01E815 07:E805: 5C EA     .byte < ofs_033_EA5C_08_заставка
tbl_E7F6_hi:
- D 3 - I - 0x01E805 07:E7F5: 07 E8     .byte > ofs_033_E807_00_главный_экран
- D 3 - I - 0x01E807 07:E7F7: 69 E8     .byte > ofs_033_E869_01_экран_очков
- D 3 - I - 0x01E809 07:E7F9: 7C E8     .byte > ofs_033_E87C_02_подготовка_уровня
- - - - - - 0x01E80B 07:E7FB: D6 E8     .byte > ofs_033_E8D6_03_игра   ; never used 0x01E7FD
- D 3 - I - 0x01E80D 07:E7FD: 23 E9     .byte > ofs_033_E923_04_автозавершение_уровня
- D 3 - I - 0x01E80F 07:E7FF: F7 E9     .byte > ofs_033_E9F7_05_подготовка_gameover
- D 3 - I - 0x01E811 07:E801: 16 EA     .byte > ofs_033_EA16_06_gameover_музыка
- D 3 - I - 0x01E813 07:E803: 2A EA     .byte > ofs_033_EA2A_07_gameover_выбор_опций
- D 3 - I - 0x01E815 07:E805: 5C EA     .byte > ofs_033_EA5C_08_заставка

; ******************************************************************************************************************

ofs_033_E807_00_главный_экран:
C - - J - - 0x01E817 07:E807: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
C - - - - - 0x01E81A 07:E80A: 20 FE E5  JSR sub_E5FE_очистить_спрайты_6000_60FF
C - - - - - 0x01E81D 07:E80D: 20 C3 E5  JSR sub_E5C3_дополнительно_очистить_память_при_старте_уровня_1
C - - - - - 0x01E820 07:E810: 20 57 E5  JSR sub_0x00FE84_XFF_обнуление_экранов_PPU
C - - - - - 0x01E823 07:E813: A9 1E     LDA #$1E
C - - - - - 0x01E825 07:E815: 85 FE     STA ram_for_2001
C - - - - - 0x01E827 07:E817: 20 32 F7  JSR sub_0x01F742_удалить_все_объекты_и_очистить_их_данные
C - - - - - 0x01E82A 07:E81A: A2 01     LDX #$01
bra_E81C_loop:
C - - - - - 0x01E82C 07:E81C: A9 00     LDA #$00
C - - - - - 0x01E82E 07:E81E: A4 50     LDY ram_номер_уровня
C - - - - - 0x01E830 07:E820: D0 16     BNE bra_E838
C - - - - - 0x01E832 07:E822: A9 60     LDA #$60
C - - - - - 0x01E834 07:E824: 9D 32 05  STA ram_позиция_y_спрайта_игрока,X
C - - - - - 0x01E837 07:E827: A9 77     LDA #$77
C - - - - - 0x01E839 07:E829: 9D 4C 05  STA ram_позиция_x_спрайта_игрока,X
C - - - - - 0x01E83C 07:E82C: BD 67 E8  LDA tbl_E867_таймер_респавна_игрока,X
C - - - - - 0x01E83F 07:E82F: B4 A0     LDY ram_статус_игрока,X
C - - - - - 0x01E841 07:E831: F0 02     BEQ bra_E835    ; if con_plr_status_мертвый
C - - - - - 0x01E843 07:E833: A0 06     LDY #con_plr_status_внутри_вертолета
bra_E835:
C - - - - - 0x01E845 07:E835: 4C 3E E8  JMP loc_E83E
bra_E838:
C - - - - - 0x01E848 07:E838: B4 A0     LDY ram_статус_игрока,X
C - - - - - 0x01E84A 07:E83A: F0 02     BEQ bra_E83E
C - - - - - 0x01E84C 07:E83C: A0 01     LDY #$01
bra_E83E:
loc_E83E:
C D 3 - - - 0x01E84E 07:E83E: 95 C0     STA ram_таймер_респавна_игрока,X
C - - - - - 0x01E850 07:E840: 98        TYA
C - - - - - 0x01E851 07:E841: 95 A0     STA ram_статус_игрока,X
C - - - - - 0x01E853 07:E843: F0 02     BEQ bra_E847    ; if con_plr_status_мертвый
C - - - - - 0x01E855 07:E845: F6 53     INC ram_жизни,X
bra_E847:
C - - - - - 0x01E857 07:E847: CA        DEX
C - - - - - 0x01E858 07:E848: 10 D2     BPL bra_E81C_loop
C - - - - - 0x01E85A 07:E84A: 20 9E FE  JSR sub_0x01FEAE_подготовить_данные_для_уровня
C - - - - - 0x01E85D 07:E84D: 20 C7 FE  JSR sub_9BF2_подготовить_конфиги_для_уровня
                                        INC ram_002B
C - - - - - 0x01E863 07:E853: A9 01     LDA #$01
C - - - - - 0x01E865 07:E855: A4 1F     LDY ram_флаг_игры_ботов_в_демке
C - - - - - 0x01E867 07:E857: D0 0B     BNE bra_E864
C - - - - - 0x01E869 07:E859: 20 23 E7  JSR sub_E723_отрисовка_текста_экрана_между_уровнями
C - - - - - 0x01E86C 07:E85C: 20 31 E7  JSR sub_E731
C - - - - - 0x01E86F 07:E85F: 20 C0 E7  JSR sub_0x01E7D0_выбор_банков_графики
C - - - - - 0x01E872 07:E862: A9 80     LDA #$80
bra_E864:
C - - - - - 0x01E874 07:E864: 4C 11 EA  JMP loc_EA11

tbl_E867_таймер_респавна_игрока:
- D 3 - - - 0x01E877 07:E867: 60        .byte $60   ; 00 
- D 3 - - - 0x01E878 07:E868: 78        .byte $78   ; 01 

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_E5FE_очистить_спрайты_6000_60FF:
; original clear sprites 0500-0567
C - - - - - 0x01E60E 07:E5FE: A0 68     LDY #$00
C - - - - - 0x01E610 07:E600: A9 00     LDA #$00
bra_E602_loop:
C - - - - - 0x01E612 07:E602: 88        DEY
; clear 6000-60FF
C - - - - - 0x01E613 07:E603: 99 00 05  STA $6000,Y
C - - - - - 0x01E616 07:E606: D0 FA     BNE bra_E602_loop
C - - - - - 0x01E618 07:E608: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_E5C3_дополнительно_очистить_память_при_старте_уровня_1:
C - - - - - 0x01E5D3 07:E5C3: A2 5B     LDX #$5B
; очистить 005B-009E
C - - - - - 0x01E5D5 07:E5C5: A9 00     LDA #$00
bra_E5C7_loop:
C - - - - - 0x01E5D7 07:E5C7: 95 00     STA $00,X
C - - - - - 0x01E5D9 07:E5C9: E8        INX
C - - - - - 0x01E5DA 07:E5CA: E0 9F     CPX #$9F
C - - - - - 0x01E5DC 07:E5CC: D0 F9     BNE bra_E5C7_loop
C - - - - - 0x01E5DE 07:E5CE: F0 0F     BEQ bra_E5DF    ; jmp

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_E5D0_очистка_оперативки:
; при смене экранов на заставке, запуске игры/демки ботов
C - - - - - 0x01E5E0 07:E5D0: A2 38     LDX #$2F
C - - - - - 0x01E5E6 07:E5D6: A9 00     LDA #$00
bra_E5D8_loop:
; 0038-00D9
C - - - - - 0x01E5E8 07:E5D8: 95 00     STA $00,X
C - - - - - 0x01E5EA 07:E5DA: E8        INX
C - - - - - 0x01E5EB 07:E5DB: E0 E0     CPX #$DA
C - - - - - 0x01E5ED 07:E5DD: D0 F9     BNE bra_E5D8_loop
bra_E5DF:
C - - - - - 0x01E5EF 07:E5DF: A2 00     LDX #$00
bra_E5E1_loop:
; 0400-06FF
C - - - - - 0x01E5F1 07:E5E1: 9D 00 04  STA $0400,X
;C - - - - - 0x01E5F4 07:E5E4: 9D 00 05  STA $0500,X
C - - - - - 0x01E5F7 07:E5E7: 9D 00 06  STA $0600,X
C - - - - - 0x01E5FA 07:E5EA: E8        INX
C - - - - - 0x01E5FB 07:E5EB: D0 F4     BNE bra_E5E1_loop

C - - - - - 0x01E5FD 07:E5ED: A2 B0     LDX #$B0
bra_E5EF_loop:
; 03B0-03FF
C - - - - - 0x01E5FF 07:E5EF: 9D 00 03  STA $0300,X
C - - - - - 0x01E602 07:E5F2: E8        INX
C - - - - - 0x01E603 07:E5F3: D0 FA     BNE bra_E5EF_loop

                                        LDX #$00
bra_E5F0_loop:
                                        DEX
; 6000-65FF
                                        STA $6000,X
                                        STA $6100,X
                                        STA $6200,X
                                        STA $6300,X
                                        STA $6400,X
                                        STA $6500,X
                                        BNE bra_E5F0_loop
                                        LDX #$C0
                                        DEX
bra_E5F2_loop:
; 6600-66BF
                                        STA $6600,X
                                        DEX
                                        BNE bra_E5F2_loop
C - - - - - 0x01E605 07:E5F5: A2 E0     LDX #$E0
bra_E5F7_loop:
C - - - - - 0x01E607 07:E5F7: CA        DEX
; 0700-07DF
C - - - - - 0x01E608 07:E5F8: 9D 00 07  STA $0700,X
C - - - - - 0x01E60B 07:E5FB: D0 FA     BNE bra_E5F7_loop
C - - - - - 0x01E60D 07:E5FD: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_9BF2_подготовить_конфиги_для_уровня:
C D 0 - - - 0x001C02 00:9BF2: A9 00     LDA #$00
C - - - - - 0x001C04 00:9BF4: 85 2F     STA ram_002F
C - - - - - 0x001C06 00:9BF6: A2 09     LDX #$09
bra_9BF8_loop:
C - - - - - 0x001C08 00:9BF8: 9D D0 07  STA ram_07D0,X
C - - - - - 0x001C0B 00:9BFB: CA        DEX
C - - - - - 0x001C0C 00:9BFC: 10 FA     BPL bra_9BF8_loop
; A = 00
C - - - - - 0x001C0E 00:9BFE: 85 26     STA ram_mirroring    ; con_mirroring_V
C - - - - - 0x001C10 00:9C00: 85 FD     STA ram_scroll_X
C - - - - - 0x001C12 00:9C02: 85 7A     STA ram_007A
C - - - - - 0x001C14 00:9C04: 85 FC     STA ram_scroll_Y
C - - - - - 0x001C16 00:9C06: 85 7B     STA ram_007B
C - - - - - 0x001C18 00:9C08: A5 FF     LDA ram_for_2000
C - - - - - 0x001C1A 00:9C0A: 29 FC     AND #$FC
C - - - - - 0x001C1C 00:9C0C: 85 FF     STA ram_for_2000
C - - - - - 0x001C1E 00:9C0E: 85 7C     STA ram_007C
C - - - - - 0x001C20 00:9C10: A9 FF     LDA #$FF
C - - - - - 0x001C22 00:9C12: 85 9C     STA ram_009C
C - - - - - 0x001C24 00:9C14: A4 50     LDY ram_номер_уровня
C - - - - - 0x001C26 00:9C16: A9 00     LDA #$00
C - - - - - 0x001C28 00:9C18: 85 63     STA ram_0063
C - - - - - 0x001C2A 00:9C1A: B9 4E 9C  LDA tbl_9C4E,Y
C - - - - - 0x001C2D 00:9C1D: 85 74     STA ram_0074_конфиг_уровня
C - - - - - 0x001C2F 00:9C1F: 85 82     STA ram_0082_конфиг_уровня
C - - - - - 0x001C31 00:9C21: B9 56 9C  LDA tbl_9C56,Y
C - - - - - 0x001C34 00:9C24: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x001C36 00:9C26: B9 5E 9C  LDA tbl_9C5E,Y
C - - - - - 0x001C39 00:9C29: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x001C3B 00:9C2B: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x001C3D 00:9C2D: B9 66 9C  LDA tbl_9C66_конфиг_уровний,Y
C - - - - - 0x001C40 00:9C30: 85 8F     STA ram_конфиг_уровня_для_пуль_объектов
C - - - - - 0x001C42 00:9C32: B9 6E 9C  LDA tbl_9C6E_тип_уровней,Y
C - - - - - 0x001C45 00:9C35: 85 5D     STA ram_тип_уровней
C - - - - - 0x001C47 00:9C37: B9 76 9C  LDA tbl_9C76,Y
C - - - - - 0x001C4A 00:9C3A: 85 97     STA ram_0097_конфиг_уровня
C - - - - - 0x001C4C 00:9C3C: B9 7E 9C  LDA tbl_9C7E,Y
C - - - - - 0x001C4F 00:9C3F: 85 94     STA ram_0094_конфиг_уровня
C - - - - - 0x001C51 00:9C41: B9 86 9C  LDA tbl_9C86,Y
C - - - - - 0x001C54 00:9C44: 8D CD 03  STA ram_03CD
C - - - - - 0x001C57 00:9C47: B9 8E 9C  LDA tbl_9C8E,Y
C - - - - - 0x001C5A 00:9C4A: 8D CF 03  STA ram_03CF
C - - - - - 0x001C5D 00:9C4D: 60        RTS

tbl_9C4E:
- D 0 - - - 0x001C5E 00:9C4E: 02        .byte $02   ; 00 
- D 0 - - - 0x001C5F 00:9C4F: 0C        .byte $0C   ; 01 
- D 0 - - - 0x001C60 00:9C50: 00        .byte $00   ; 02 
- D 0 - - - 0x001C61 00:9C51: 0C        .byte $0C   ; 03 
- D 0 - - - 0x001C62 00:9C52: 06        .byte $06   ; 04 
- D 0 - - - 0x001C63 00:9C53: 0C        .byte $0C   ; 05 
- D 0 - - - 0x001C64 00:9C54: 00        .byte $00   ; 06 
- D 0 - - - 0x001C65 00:9C55: 03        .byte $03   ; 07 

tbl_9C56:
- D 0 - - - 0x001C66 00:9C56: 00        .byte $00   ; 00 
- D 0 - - - 0x001C67 00:9C57: 01        .byte $01   ; 01 
- D 0 - - - 0x001C68 00:9C58: 00        .byte $00   ; 02 
- D 0 - - - 0x001C69 00:9C59: 00        .byte $00   ; 03 
- D 0 - - - 0x001C6A 00:9C5A: 01        .byte $01   ; 04 
- D 0 - - - 0x001C6B 00:9C5B: 01        .byte $01   ; 05 
- D 0 - - - 0x001C6C 00:9C5C: 01        .byte $01   ; 06 
- D 0 - - - 0x001C6D 00:9C5D: 00        .byte $00   ; 07 

tbl_9C5E:
- D 0 - - - 0x001C6E 00:9C5E: 80        .byte $80   ; 00 
- D 0 - - - 0x001C6F 00:9C5F: 40        .byte $40   ; 01 
- D 0 - - - 0x001C70 00:9C60: C0        .byte $C0   ; 02 
- D 0 - - - 0x001C71 00:9C61: C0        .byte $C0   ; 03 
- D 0 - - - 0x001C72 00:9C62: 40        .byte $40   ; 04 
- D 0 - - - 0x001C73 00:9C63: 40        .byte $40   ; 05 
- D 0 - - - 0x001C74 00:9C64: 80        .byte $80   ; 06 
- D 0 - - - 0x001C75 00:9C65: C0        .byte $C0   ; 07 

tbl_9C66_конфиг_уровний:
- D 0 - - - 0x001C76 00:9C66: 01        .byte $01   ; 00 
- D 0 - - - 0x001C77 00:9C67: 01        .byte $01   ; 01 
- D 0 - - - 0x001C78 00:9C68: 01        .byte $01   ; 02 
- D 0 - - - 0x001C79 00:9C69: 01        .byte $01   ; 03 
- D 0 - - - 0x001C7A 00:9C6A: 00        .byte $00   ; 04 
- D 0 - - - 0x001C7B 00:9C6B: 01        .byte $01   ; 05 
- D 0 - - - 0x001C7C 00:9C6C: 01        .byte $01   ; 06 
- D 0 - - - 0x001C7D 00:9C6D: 00        .byte $00   ; 07 

tbl_9C6E_тип_уровней:
; 00 = вид сбоку
; 01 = вид сверху
- D 0 - - - 0x001C7E 00:9C6E: 00        .byte $00   ; 00 
- D 0 - - - 0x001C7F 00:9C6F: 01        .byte $01   ; 01 
- D 0 - - - 0x001C80 00:9C70: 00        .byte $00   ; 02 
- D 0 - - - 0x001C81 00:9C71: 00        .byte $00   ; 03 
- D 0 - - - 0x001C82 00:9C72: 00        .byte $00   ; 04 
- D 0 - - - 0x001C83 00:9C73: 01        .byte $01   ; 05 
- D 0 - - - 0x001C84 00:9C74: 00        .byte $00   ; 06 
- D 0 - - - 0x001C85 00:9C75: 00        .byte $00   ; 07 

tbl_9C76:
- D 0 - - - 0x001C86 00:9C76: 80        .byte $80   ; 00 
- D 0 - - - 0x001C87 00:9C77: D0        .byte $D0   ; 01 
- D 0 - - - 0x001C88 00:9C78: A0        .byte $A0   ; 02 
- D 0 - - - 0x001C89 00:9C79: A0        .byte $A0   ; 03 
- D 0 - - - 0x001C8A 00:9C7A: 80        .byte $80   ; 04 
- D 0 - - - 0x001C8B 00:9C7B: D0        .byte $D0   ; 05 
- D 0 - - - 0x001C8C 00:9C7C: 80        .byte $80   ; 06 
- D 0 - - - 0x001C8D 00:9C7D: A0        .byte $A0   ; 07 

tbl_9C7E:
- D 0 - - - 0x001C8E 00:9C7E: 00        .byte $00   ; 00 
- D 0 - - - 0x001C8F 00:9C7F: 81        .byte $81   ; 01 
- D 0 - - - 0x001C90 00:9C80: 00        .byte $00   ; 02 
- D 0 - - - 0x001C91 00:9C81: 00        .byte $00   ; 03 
- D 0 - - - 0x001C92 00:9C82: 01        .byte $01   ; 04 
- D 0 - - - 0x001C93 00:9C83: 83        .byte $83   ; 05 
- D 0 - - - 0x001C94 00:9C84: 01        .byte $01   ; 06 
- D 0 - - - 0x001C95 00:9C85: 00        .byte $00   ; 07 

tbl_9C86:
- D 0 - - - 0x001C96 00:9C86: FF        .byte $FF   ; 00 
- D 0 - - - 0x001C97 00:9C87: FF        .byte $FF   ; 01 
- D 0 - - - 0x001C98 00:9C88: FF        .byte $FF   ; 02 
- D 0 - - - 0x001C99 00:9C89: FF        .byte $FF   ; 03 
- D 0 - - - 0x001C9A 00:9C8A: 00        .byte $00   ; 04 
- D 0 - - - 0x001C9B 00:9C8B: FF        .byte $FF   ; 05 
- D 0 - - - 0x001C9C 00:9C8C: FF        .byte $FF   ; 06 
- D 0 - - - 0x001C9D 00:9C8D: FF        .byte $FF   ; 07 

tbl_9C8E:
- D 0 - - - 0x001C9E 00:9C8E: 00        .byte $00   ; 00 
- D 0 - - - 0x001C9F 00:9C8F: 00        .byte $00   ; 01 
- D 0 - - - 0x001CA0 00:9C90: 00        .byte $00   ; 02 
- D 0 - - - 0x001CA1 00:9C91: 00        .byte $00   ; 03 
- D 0 - - - 0x001CA2 00:9C92: 00        .byte $00   ; 04 
- D 0 - - - 0x001CA3 00:9C93: 00        .byte $00   ; 05 
- D 0 - - - 0x001CA4 00:9C94: 00        .byte $00   ; 06 
- D 0 - - - 0x001CA5 00:9C95: 00        .byte $00   ; 07 

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_E723_отрисовка_текста_экрана_между_уровнями:
;C - - - - - 0x01E733 07:E723: A9 02     LDA #con_0x0017EA_area
;C - - - - - 0x01E735 07:E725: 20 7A FE  JSR sub_FE7A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01E738 07:E728: A5 50     LDA ram_номер_уровня
C - - - - - 0x01E73A 07:E72A: 18        CLC
C - - - - - 0x01E73B 07:E72B: 69 02     ADC #$02
C - - - - - 0x01E73D 07:E72D: 9D FE 02  STA ram_spr_A + $FC,X
C - - - - - 0x01E740 07:E730: 60        RTS
sub_E731:
C - - - - - 0x01E741 07:E731: A9 05     LDA #$05
C - - - - - 0x01E743 07:E733: 85 1D     STA ram_001D
C - - - - - 0x01E745 07:E735: A9 08     LDA #$10    ; палитра главного экрана
C - - - - - 0x01E747 07:E737: 20 70 FE  JSR sub_B886_загрузка_палитры
C - - - - - 0x01E74A 07:E73A: A0 4C     LDY #con_F97C_colors + $13 * $04
C - - - - - 0x01E74C 07:E73C: 20 68 F9  JSR sub_0x01F978_запись_3х_цветов
C - - - - - 0x01E74F 07:E73F: 20 BE F7  JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
C - - - - - 0x01E752 07:E742: A9 A8     LDA #$A8
C - - - - - 0x01E754 07:E744: 85 FF     STA ram_for_2000
C - - - - - 0x01E756 07:E746: A9 00     LDA #$00
C - - - - - 0x01E758 07:E748: 85 FD     STA ram_scroll_X
C - - - - - 0x01E75A 07:E74A: 85 FC     STA ram_scroll_Y
;C - - - - - 0x01E75C 07:E74C: A9 06     LDA #con_0x0017EA_rest_1p
;C - - - - - 0x01E75E 07:E74E: 20 7A FE  JSR sub_FE7A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01E761 07:E751: A0 00     LDY #$00
C - - - - - 0x01E763 07:E753: 20 A4 E7  JSR sub_E7A4_display_lives_counter_with_sprites
;C - - - - - 0x01E766 07:E756: A9 07     LDA #con_0x0017EA_rest_2p
;C - - - - - 0x01E768 07:E758: 20 7A FE  JSR sub_FE7A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01E76B 07:E75B: A0 01     LDY #$01
C - - - - - 0x01E76D 07:E75D: 20 A4 E7  JSR sub_E7A4_display_lives_counter_with_sprites
;C - - - - - 0x01E770 07:E760: A9 03     LDA #con_0x0017EA_1p_score
;C - - - - - 0x01E772 07:E762: 20 7A FE  JSR sub_FE7A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01E775 07:E765: A9 E3     LDA #< ram_1p_очки
C - - - - - 0x01E777 07:E767: 20 7B E7  JSR sub_E77B_print_score
;C - - - - - 0x01E77A 07:E76A: A9 04     LDA #con_0x0017EA_2p_score
;C - - - - - 0x01E77C 07:E76C: 20 7A FE  JSR sub_FE7A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01E77F 07:E76F: A9 E6     LDA #< ram_2p_очки
C - - - - - 0x01E781 07:E771: 20 7B E7  JSR sub_E77B_print_score
;C - - - - - 0x01E784 07:E774: A9 05     LDA #con_0x0017EA_hi_score
;C - - - - - 0x01E786 07:E776: 20 7A FE  JSR sub_FE7A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01E789 07:E779: A9 E0     LDA #< ram_рекорд_очки
sub_E77B_print_score:
C - - - - - 0x01E78B 07:E77B: 85 00     STA ram_0000
C - - - - - 0x01E78D 07:E77D: A9 07     LDA #$07
C - - - - - 0x01E78F 07:E77F: 85 01     STA ram_0001
C - - - - - 0x01E791 07:E781: 8A        TXA
C - - - - - 0x01E792 07:E782: 38        SEC
C - - - - - 0x01E793 07:E783: E9 08     SBC #$08
C - - - - - 0x01E795 07:E785: AA        TAX
C - - - - - 0x01E796 07:E786: A0 02     LDY #$02
bra_E788_loop:
; get hi nibble
C - - - - - 0x01E798 07:E788: B1 00     LDA (ram_0000),Y
C - - - - - 0x01E79A 07:E78A: 4A        LSR
C - - - - - 0x01E79B 07:E78B: 4A        LSR
C - - - - - 0x01E79C 07:E78C: 4A        LSR
C - - - - - 0x01E79D 07:E78D: 4A        LSR
C - - - - - 0x01E79E 07:E78E: 20 9A E7  JSR sub_E79C_print_number
; get lo nibble
C - - - - - 0x01E7A1 07:E791: B1 00     LDA (ram_0000),Y
C - - - - - 0x01E7A3 07:E793: 20 9A E7  JSR sub_E79A_print_number
C - - - - - 0x01E7A6 07:E796: 88        DEY
C - - - - - 0x01E7A7 07:E797: 10 EF     BPL bra_E788_loop
C - - - - - 0x01E7A9 07:E799: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_E79A_print_number:
C - - - - - 0x01E7AA 07:E79A: 29 0F     AND #$0F
sub_E79C_print_number:
C - - - - - 0x01E7AC 07:E79C: 18        CLC
C - - - - - 0x01E7AD 07:E79D: 69 01     ADC #$01
C - - - - - 0x01E7AF 07:E79F: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x01E7B2 07:E7A2: E8        INX
C - - - - - 0x01E7B3 07:E7A3: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_E7A4_display_lives_counter_with_sprites:
; Y = player index
C - - - - - 0x01E7B4 07:E7A4: B9 53 00  LDA ram_жизни,Y
C - - - - - 0x01E7B7 07:E7A7: A0 00     LDY #$00
bra_E7A9_loop:
C - - - - - 0x01E7B9 07:E7A9: C9 0A     CMP #$0A
C - - - - - 0x01E7BB 07:E7AB: 90 05     BCC bra_E7B2
C - - - - - 0x01E7BD 07:E7AD: E9 0A     SBC #$0A
C - - - - - 0x01E7BF 07:E7AF: C8        INY
C - - - - - 0x01E7C0 07:E7B0: D0 F7     BNE bra_E7A9_loop
bra_E7B2:
C - - - - - 0x01E7C2 07:E7B2: 18        CLC
C - - - - - 0x01E7C3 07:E7B3: 69 01     ADC #$01
C - - - - - 0x01E7C5 07:E7B5: 9D FE 02  STA ram_spr_A + $FC,X
C - - - - - 0x01E7C8 07:E7B8: 98        TYA
C - - - - - 0x01E7C9 07:E7B9: 18        CLC
C - - - - - 0x01E7CA 07:E7BA: 69 01     ADC #$01
C - - - - - 0x01E7CC 07:E7BC: 9D FD 02  STA ram_spr_T + $FC,X
bra_E7BF_RTS:
C - - - - - 0x01E7CF 07:E7BF: 60        RTS

; ******************************************************************************************************************

ofs_033_E869_01_экран_очков:
C - - J - - 0x01E879 07:E869: C6 3F     DEC ram_таймер_экрана
C - - - - - 0x01E87B 07:E86B: D0 25     BNE bra_E7BF_RTS
C - - - - - 0x01E87D 07:E86D: 20 57 E5  JSR sub_0x00FE84_XFF_обнуление_экранов_PPU
C - - - - - 0x01E880 07:E870: 20 B0 EA  JSR sub_EAB0_подготовить_начальные_банки_для_уровня
C - - - - - 0x01E883 07:E873: 20 68 FE  JSR sub_B884_загрузка_палитры_для_уровня
C - - - - - 0x01E886 07:E876: 20 BE F7  JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
C - - - - - 0x01E889 07:E879: 4C B2 E8  JMP loc_E8B2

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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
                                        LDY ram_option_регион
                                        BEQ bra_EAB8_US
; EU
                                        ADC #$06    ; вторые 6 байтов
bra_EAB8_US:
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
;                             00 area 1 US
- D 3 - - - 0x01EAD8 07:EAC8: 00        .byte con_chr_bank + $00   ; bg
- D 3 - - - 0x01EAD9 07:EAC9: 02        .byte con_chr_bank + $02   ; bg
- D 3 - - - 0x01EADA 07:EACA: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EADB 07:EACB: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EADC 07:EACC: 46        .byte con_chr_bank + $46   ; spr
- D 3 - - - 0x01EADD 07:EACD: 47        .byte con_chr_bank + $47   ; spr
;                             00 area 1 EU
                                        .byte con_chr_bank + $B0   ; bg на боссе $AD
                                        .byte con_chr_bank + $AA   ; bg на боссе $AF
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $96   ; spr
                                        .byte con_chr_bank + $97   ; spr
;                             01 area 2 US
- D 3 - - - 0x01EADE 07:EACE: 3C        .byte con_chr_bank + $3C   ; bg
- D 3 - - - 0x01EADF 07:EACF: 3E        .byte con_chr_bank + $3E   ; bg
- D 3 - - - 0x01EAE0 07:EAD0: 49        .byte con_chr_bank + $49   ; spr
- D 3 - - - 0x01EAE1 07:EAD1: 4A        .byte con_chr_bank + $4A   ; spr
- D 3 - - - 0x01EAE2 07:EAD2: 4B        .byte con_chr_bank + $4B   ; spr
- D 3 - - - 0x01EAE3 07:EAD3: 1A        .byte con_chr_bank + $1A   ; spr
;                             01 area 2 EU
                                        .byte con_chr_bank + $3C   ; bg
                                        .byte con_chr_bank + $3E   ; bg
                                        .byte con_chr_bank + $A8   ; spr
                                        .byte con_chr_bank + $A9   ; spr
                                        .byte con_chr_bank + $98   ; spr
                                        .byte con_chr_bank + $99   ; spr
;                             02 area 3 US
- D 3 - - - 0x01EAE4 07:EAD4: 0C        .byte con_chr_bank + $0C   ; bg
- D 3 - - - 0x01EAE5 07:EAD5: 0E        .byte con_chr_bank + $0E   ; bg
- D 3 - - - 0x01EAE6 07:EAD6: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EAE7 07:EAD7: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EAE8 07:EAD8: 46        .byte con_chr_bank + $46   ; spr
- D 3 - - - 0x01EAE9 07:EAD9: 48        .byte con_chr_bank + $48   ; spr
;                             02 area 3 EU
                                        .byte con_chr_bank + $0C   ; bg
                                        .byte con_chr_bank + $0E   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $9A   ; spr
                                        .byte con_chr_bank + $9B   ; spr
;                             03 area 4 US
- D 3 - - - 0x01EAEA 07:EADA: 08        .byte con_chr_bank + $08   ; bg
- D 3 - - - 0x01EAEB 07:EADB: 0A        .byte con_chr_bank + $0A   ; bg
- D 3 - - - 0x01EAEC 07:EADC: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EAED 07:EADD: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EAEE 07:EADE: 46        .byte con_chr_bank + $46   ; spr
- D 3 - - - 0x01EAEF 07:EADF: 47        .byte con_chr_bank + $47   ; spr
;                             03 area 4 EU
                                        .byte con_chr_bank + $08   ; bg
                                        .byte con_chr_bank + $0A   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $96   ; spr
                                        .byte con_chr_bank + $97   ; spr в начале подъёма наверх, банк переключается - нам требуется $9D
;                             04 area 5 US
- D 3 - - - 0x01EAF0 07:EAE0: 1C        .byte con_chr_bank + $1C   ; bg
- D 3 - - - 0x01EAF1 07:EAE1: 1E        .byte con_chr_bank + $1E   ; bg
- D 3 - - - 0x01EAF2 07:EAE2: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EAF3 07:EAE3: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EAF4 07:EAE4: 46        .byte con_chr_bank + $46   ; spr
- D 3 - - - 0x01EAF5 07:EAE5: 60        .byte con_chr_bank + $60   ; spr
;                             04 area 5 EU
                                        .byte con_chr_bank + $1C   ; bg
                                        .byte con_chr_bank + $1E   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $96   ; spr
                                        .byte con_chr_bank + $9E   ; spr
;                             05 area 6 US
- D 3 - - - 0x01EAF6 07:EAE6: 4C        .byte con_chr_bank + $4C   ; bg
- D 3 - - - 0x01EAF7 07:EAE7: 4E        .byte con_chr_bank + $4E   ; bg
- D 3 - - - 0x01EAF8 07:EAE8: 49        .byte con_chr_bank + $49   ; spr
- D 3 - - - 0x01EAF9 07:EAE9: 4A        .byte con_chr_bank + $4A   ; spr
- D 3 - - - 0x01EAFA 07:EAEA: 61        .byte con_chr_bank + $61   ; spr
- D 3 - - - 0x01EAFB 07:EAEB: 62        .byte con_chr_bank + $62   ; spr
;                             05 area 6 EU
                                        .byte con_chr_bank + $4C   ; bg
                                        .byte con_chr_bank + $4E   ; bg
                                        .byte con_chr_bank + $A8   ; spr
                                        .byte con_chr_bank + $A9   ; spr
                                        .byte con_chr_bank + $9F   ; spr
                                        .byte con_chr_bank + $62   ; spr
;                             06 area 7 US
- D 3 - - - 0x01EAFC 07:EAEC: 24        .byte con_chr_bank + $24   ; bg
- D 3 - - - 0x01EAFD 07:EAED: 26        .byte con_chr_bank + $26   ; bg
- D 3 - - - 0x01EAFE 07:EAEE: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EAFF 07:EAEF: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EB00 07:EAF0: 63        .byte con_chr_bank + $63   ; spr
- D 3 - - - 0x01EB01 07:EAF1: 64        .byte con_chr_bank + $64   ; spr
;                             06 area 7 EU
                                        .byte con_chr_bank + $24   ; bg
                                        .byte con_chr_bank + $26   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $A2   ; spr
                                        .byte con_chr_bank + $A3   ; spr после спуска вниз банк переключается - нам требуется $A4, на боссе $A0
;                             07 area 8 US
- D 3 - - - 0x01EB02 07:EAF2: 34        .byte con_chr_bank + $34   ; bg
- D 3 - - - 0x01EB03 07:EAF3: 36        .byte con_chr_bank + $36   ; bg
- D 3 - - - 0x01EB04 07:EAF4: 44        .byte con_chr_bank + $44   ; spr
- D 3 - - - 0x01EB05 07:EAF5: 45        .byte con_chr_bank + $45   ; spr
- D 3 - - - 0x01EB06 07:EAF6: 67        .byte con_chr_bank + $67   ; spr
- D 3 - - - 0x01EB07 07:EAF7: 68        .byte con_chr_bank + $68   ; spr
;                             07 area 8 EU
                                        .byte con_chr_bank + $34   ; bg
                                        .byte con_chr_bank + $36   ; bg
                                        .byte con_chr_bank + $94   ; spr
                                        .byte con_chr_bank + $95   ; spr
                                        .byte con_chr_bank + $A5   ; spr
                                        .byte con_chr_bank + $A6   ; spr

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_B884_загрузка_палитры_для_уровня:
C D 1 - - - 0x00F894 03:B884: A5 50     LDA ram_номер_уровня
                                        ASL
                                        ADC ram_option_регион
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
- D 1 - - - 0x00F8C3 03:B8B3: C9 B8     .word _off021_B8C9_00_area_1_US ; 00
                                        .word _off021_B8C9_01_area_1_EU ; 01
- D 1 - - - 0x00F8C5 03:B8B5: E1 B8     .word _off021_B8E1_02_area_2_US ; 02
                                        .word _off021_B8E1_03_area_2_EU ; 03
- D 1 - - - 0x00F8C7 03:B8B7: F9 B8     .word _off021_B8F9_04_area_3_US ; 04
                                        .word _off021_B8F9_05_area_3_EU ; 05
- D 1 - - - 0x00F8C9 03:B8B9: 11 B9     .word _off021_B911_06_area_4_US ; 06
                                        .word _off021_B911_07_area_4_EU ; 07
- D 1 - - - 0x00F8CB 03:B8BB: 29 B9     .word _off021_B929_08_area_5_US ; 08
                                        .word _off021_B929_09_area_5_EU ; 09
- D 1 - - - 0x00F8CD 03:B8BD: 41 B9     .word _off021_B941_0A_area_6_US ; 0A
                                        .word _off021_B941_0B_area_6_EU ; 0B
- D 1 - - - 0x00F8CF 03:B8BF: 59 B9     .word _off021_B959_0C_area_7_US ; 0C
                                        .word _off021_B959_0D_area_7_EU ; 0D
- D 1 - - - 0x00F8D1 03:B8C1: 71 B9     .word _off021_B971_0E_area_8_US ; 0E
                                        .word _off021_B971_0F_area_8_EU ; 0F
- D 1 - - - 0x00F8D3 03:B8C3: 89 B9     .word _off021_B989_10_главный_экран ; 10
- D 1 - - - 0x00F8D5 03:B8C5: A1 B9     .word _off021_B9A1_11_логотип_слияние   ; 11
- D 1 - - - 0x00F8D7 03:B8C7: B9 B9     .word _off021_B9B9_12_заставка  ; 12
                                        .word _off021_B9D1_13_options   ; 13

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

_off021_B989_10_главный_экран:
; background
- D 1 - I - 0x00F999 03:B989: 10        .byte $30, $27, $16   ; 
- D 1 - I - 0x00F99C 03:B98C: 20        .byte $30, $27, $16   ; 
- D 1 - I - 0x00F99F 03:B98F: 20        .byte $12, $22, $30   ; 
- D 1 - I - 0x00F9A2 03:B992: 27        .byte $30, $21, $12   ; 
; sprites
- D 1 - I - 0x00F9A5 03:B995: 16        .byte $16, $06, $0F   ; 
- D 1 - I - 0x00F9A8 03:B998: 20        .byte $28, $27, $08   ; 
- D 1 - I - 0x00F9AB 03:B99B: 20        .byte $20, $26, $16   ; 
- D 1 - I - 0x00F9AE 03:B99E: 20        .byte $20, $07, $17   ; 

; _________________________________________________________________________________________________________________

_off021_B9A1_11_логотип_слияние:
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

; _________________________________________________________________________________________________________________

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

; _________________________________________________________________________________________________________________

_off021_B9D1_13_options:
; background
                                        .byte $30, $27, $16   ; 
                                        .byte $30, $28, $18   ; 
                                        .byte $00, $00, $00   ; 
                                        .byte $30, $2C, $1C   ; 
; sprites
                                        .byte $30, $37, $0F   ; 
                                        .byte $28, $27, $08   ;  
                                        .byte $30, $38, $28   ; 
                                        .byte $20, $07, $17   ; 

; ******************************************************************************************************************

ofs_033_E87C_02_подготовка_уровня:
C - - J - - 0x01E88C 07:E87C: A9 02     LDA #$02
C - - - - - 0x01E88E 07:E87E: 85 1D     STA ram_001D
C - - - - - 0x01E890 07:E880: A6 3E     LDX ram_07DA
C - - - - - 0x01E892 07:E882: D0 0F     BNE bra_E893
; 00
C - - - - - 0x01E894 07:E884: 20 8C FE  JSR sub_0x01FE9C
bra_E887_loop:
C - - - - - 0x01E897 07:E887: 20 92 FE  JSR sub_0x01FEA2
C - - - - - 0x01E89A 07:E88A: A5 6A     LDA ram_006A
C - - - - - 0x01E89C 07:E88C: C9 03     CMP #$03
C - - - - - 0x01E89E 07:E88E: D0 F7     BNE bra_E887_loop
C - - - - - 0x01E8A0 07:E890: E6 3E     INC ram_07DA
C - - - - - 0x01E8A2 07:E892: 60        RTS
bra_E893:
                                        DEX
                                        BNE bra_E8AB_02
; 01
bra_E894_loop:
C - - - - - 0x01E8A3 07:E893: 20 92 FE  JSR sub_0x01FEA2
C - - - - - 0x01E8A6 07:E896: A5 60     LDA ram_0060_unk
C - - - - - 0x01E8A8 07:E898: D0 F9     BNE bra_E894_loop
C - - - - - 0x01E8AA 07:E89A: A5 65     LDA ram_0065
C - - - - - 0x01E8AC 07:E89C: C9 01     CMP #$01
C - - - - - 0x01E8AE 07:E89E: D0 14     BNE bra_E8B4
C - - - - - 0x01E8B0 07:E8A0: A5 64     LDA ram_0064
C - - - - - 0x01E8B2 07:E8A2: C9 04     CMP #$04
C - - - - - 0x01E8B4 07:E8A4: 90 0E     BCC bra_E8B4
C - - - - - 0x01E8B6 07:E8A6: A9 00     LDA #$00
C - - - - - 0x01E8B8 07:E8A8: 85 6B     STA ram_006B
C - - - - - 0x01E8BA 07:E8AA: 85 6C     STA ram_006C
; дает возможность отложить перерисовку вертолета
; на следующий кадр, дождавшись освобождения буфера
                                        INC ram_07DA    ; 01 -> 02
                                        RTS
bra_E8AB_02:
                                        LDA ram_номер_уровня
                                        BNE bra_E8AF
; 1й уровень
                                        BIT ram_регион
                                        BVC bra_E8AC_пропуск_перерисовки
                                        JSR sub_E8E5_перерисовать_вертолет_для_европейки
bra_E8AC_пропуск_перерисовки:
C - - - - - 0x01E8BC 07:E8AC: 20 35 FE  JSR sub_FE35_подготовить_лопасти_вертолета_на_1м_уровне
bra_E8AF:
C - - - - - 0x01E8BF 07:E8AF: 20 B9 E8  JSR sub_E8B9_выбрать_саундтрек_уровня
loc_E8B2:
C D 3 - - - 0x01E8C2 07:E8B2: E6 38     INC ram_номер_экрана
bra_E8B4:
loc_E8B4:
C D 3 - - - 0x01E8C4 07:E8B4: A9 00     LDA #$00
C - - - - - 0x01E8C6 07:E8B6: 85 3E     STA ram_07DA
bra_E8B8_RTS:
C - - - - - 0x01E8C8 07:E8B8: 60        RTS

; ******************************************************************************************************************

loc_E901_запись_номера_экрана:
C D 3 - - - 0x01E911 07:E901: 85 38     STA ram_номер_экрана
C - - - - - 0x01E913 07:E903: 4C B4 E8  JMP loc_E8B4

; ******************************************************************************************************************

sub_FE35_подготовить_лопасти_вертолета_на_1м_уровне:
C - - - - - 0x0092C4 02:92B4: 20 FD F6  JSR sub_0x01F70D_попытка_создать_объект
C - - - - - 0x0092C7 02:92B7: D0 0F     BNE bra_92C8_RTS
C - - - - - 0x0092C9 02:92B9: A0 62     LDY #con_obj_id_4D
C - - - - - 0x0092CB 02:92BB: 20 9E F7  JSR sub_0x01F7AE_записать_ID_объекта_и_его_хитбокс
C - - - - - 0x0092CE 02:92BE: A9 60     LDA #$60
C - - - - - 0x0092D0 02:92C0: 9D 3C 05  STA ram_позиция_x_спрайта_объекта_или_пули,X
C - - - - - 0x0092D3 02:92C3: A9 1C     LDA #$1C
C - - - - - 0x0092D5 02:92C5: 9D 22 05  STA ram_позиция_y_спрайта_объекта_или_пули,X
bra_92C8_RTS:
C - - - - - 0x0092D8 02:92C8: 60        RTS

; ******************************************************************************************************************

sub_E8B9_выбрать_саундтрек_уровня:
C - - - - - 0x01E8C9 07:E8B9: A5 1F     LDA ram_флаг_игры_ботов_в_демке
C - - - - - 0x01E8CB 07:E8BB: D0 08     BNE bra_E8C5
C - - - - - 0x01E8CD 07:E8BD: A4 50     LDY ram_номер_уровня
C - - - - - 0x01E8CF 07:E8BF: B9 CE E8  LDA tbl_E8CE_музыка,Y
C - - - - - 0x01E8D2 07:E8C2: 20 DE FD  JSR sub_0x01FDEE_play_music
bra_E8C5:
C - - - - - 0x01E8D5 07:E8C5: A5 50     LDA ram_номер_уровня
C - - - - - 0x01E8D7 07:E8C7: D0 EF     BNE bra_E8B8_RTS
C - - - - - 0x01E8D9 07:E8C9: A9 0A     LDA #con_sound_0A   ;   звук вертолета (начало игры)
C - - - - - 0x01E8DB 07:E8CB: 4C DE FD  JMP loc_0x01FDEE_play_sound

tbl_E8CE_музыка:
- D 3 - - - 0x01E8DE 07:E8CE: 28        .byte con_sound_28   ; 00
- D 3 - - - 0x01E8DF 07:E8CF: 2B        .byte con_sound_2B   ; 01
- D 3 - - - 0x01E8E0 07:E8D0: 2A        .byte con_sound_2A   ; 02
- D 3 - - - 0x01E8E1 07:E8D1: 29        .byte con_sound_29   ; 03
- D 3 - - - 0x01E8E2 07:E8D2: 2C        .byte con_sound_2C   ; 04
- D 3 - - - 0x01E8E3 07:E8D3: 2D        .byte con_sound_2D   ; 05
- D 3 - - - 0x01E8E4 07:E8D4: 2E        .byte con_sound_2E   ; 06
- D 3 - - - 0x01E8E5 07:E8D5: 2F        .byte con_sound_2F   ; 07

; ******************************************************************************************************************

sub_E8E5_перерисовать_вертолет_для_европейки:
; cyneprepou4uk
                                        LDX ram_index_ppu_buffer
                                        LDY #$00
bra_9401_loop:
                                        LDA tbl_9400_тайлы_вертолета_EU,Y
                                        CMP #$FE    ; end token
                                        BEQ bra_9402_закрыть_буфер
                                        STA ram_nmt_buffer,X
                                        INX
                                        INY
                                        BNE bra_9401_loop    ; jmp
bra_9402_закрыть_буфер:
                                        LDA #$FF
                                        STA ram_nmt_buffer,X
                                        INX
                                        STX ram_index_ppu_buffer
                                        RTS

tbl_9400_тайлы_вертолета_EU:
                                        .byte con_buf_mode_06   ; 
                                        
                                        .dbyt $20AB ; ppu address
                                        .byte $02   ; counter
                                        .byte $39, $3A   ; 
                                        
                                        .dbyt $20CA ; ppu address
                                        .byte $06   ; counter
                                        .byte $00, $3B, $01, $3C, $00, $3D   ; 
                                        
                                        .dbyt $20E4 ; ppu address
                                        .byte $0C   ; counter
                                        .byte $1C, $1D, $1E, $7D, $00, $3E, $3F, $40, $41, $42, $43, $44   ; 
                                        
                                        .dbyt $2107 ; ppu address
                                        .byte $09   ; counter
                                        .byte $00, $02, $45, $03, $46, $04, $47, $05, $48   ; 
                                        
                                        .dbyt $2125 ; ppu address
                                        .byte $0B   ; counter
                                        .byte $00, $00, $06, $49, $4A, $4B, $4C, $4D, $4E, $4F, $50   ; 
                                        
                                        .dbyt $2144 ; ppu address
                                        .byte $0D   ; counter
                                        .byte $19, $1A, $06, $51, $07, $52, $08, $53, $09, $54, $0A, $55, $0B   ; 
                                        
                                        .dbyt $2164 ; ppu address
                                        .byte $0D   ; counter
                                        .byte $1E, $7D, $56, $57, $58, $59, $5A, $5B, $5C, $5D, $5E, $5F, $60   ; 
                                        
                                        .dbyt $2185 ; ppu address
                                        .byte $0D   ; counter
                                        .byte $1B, $0C, $60, $0D, $61, $0E, $62, $00, $63, $0F, $64, $10, $65   ; 
                                        
                                        .dbyt $21A4 ; ppu address
                                        .byte $0E   ; counter
                                        .byte $1E, $7D, $00, $66, $67, $68, $69, $6A, $6A, $6B, $6C, $6D, $6E, $6F   ; 
                                        
                                        .dbyt $21C5 ; ppu address
                                        .byte $0B   ; counter
                                        .byte $00, $20, $70, $21, $71, $00, $00, $00, $72, $38, $73   ; 
                                        
                                        .dbyt $21E8 ; ppu address
                                        .byte $0A   ; counter
                                        .byte $00, $00, $1C, $7E, $00, $00, $15, $00, $1F, $1C   ; 
; корректировка атрибутов внизу вертолета
                                        .dbyt $23D9 ; ppu address
                                        .byte $03   ; counter
                                        .byte $56, $85, $45   ; оригинал 55 A5 65

                                        .byte $FE   ; end token

; ******************************************************************************************************************

ofs_033_E8D6_03_игра:
C D 3 - - - 0x01E8E6 07:E8D6: A9 01     LDA #$01
C - - - - - 0x01E8E8 07:E8D8: 85 87     STA ram_game_over_flag
C - - - - - 0x01E8EA 07:E8DA: 20 8A EA  JSR sub_EA8A_пауза
C - - - - - 0x01E8ED 07:E8DD: 20 3D FE  JSR sub_0x01FE4D_обработчик_уровня_и_смена_банка
C - - - - - 0x01E8F0 07:E8E0: A5 39     LDA ram_пауза
C - - - - - 0x01E8F2 07:E8E2: F0 06     BEQ bra_E8EA
C - - - - - 0x01E8F7 07:E8E7: 4C A9 F7  JMP loc_0x01F7B9_запись_палитры_из_03E0x_в_0300x_с_условием
bra_E8EA:
C - - - - - 0x01E8FA 07:E8EA: 20 06 E9  JSR sub_0x01E918_обработчик_геймплея
C - - - - - 0x01E8FD 07:E8ED: A5 5C     LDA ram_статус_завершения_уровня
C - - - - - 0x01E8FF 07:E8EF: 30 01     BMI bra_E8F2
C - - - - - 0x01E901 07:E8F1: 60        RTS
bra_E8F2:
C - - - - - 0x01E902 07:E8F2: A9 04     LDA #$04
                                        JMP loc_E901_запись_номера_экрана
                                        
; ******************************************************************************************************************

sub_EA8A_пауза:
C - - - - - 0x01EA9A 07:EA8A: A5 1F     LDA ram_флаг_игры_ботов_в_демке
C - - - - - 0x01EA9E 07:EA8E: 05 1D     ORA ram_001D
C - - - - - 0x01EAA0 07:EA90: D0 1C     BNE bra_EAAE_RTS
C - - - - - 0x01EAA2 07:EA92: A5 F5     LDA ram_копия_нажатая_кнопка
                                        ORA ram_копия_нажатая_кнопка + $01
C - - - - - 0x01EAA4 07:EA94: A4 39     LDY ram_пауза
C - - - - - 0x01EAA6 07:EA96: D0 0E     BNE bra_EAA6_игра_на_паузе
C - - - - - 0x01EAA8 07:EA98: 29 10     AND #con_btn_Start
C - - - - - 0x01EAAA 07:EA9A: F0 12     BEQ bra_EAAE_RTS
C - - - - - 0x01EAAC 07:EA9C: A9 01     LDA #$01
C - - - - - 0x01EAAE 07:EA9E: 85 39     STA ram_пауза
C - - - - - 0x01EAB0 07:EAA0: A9 27     LDA #con_sound_27
C - - - - - 0x01EAB2 07:EAA2: 4C DE FD  JSR sub_0x01FDEE_play_sound
                                        RTS
bra_EAA6_игра_на_паузе:
C - - - - - 0x01EAB6 07:EAA6: 29 10     AND #con_btn_Start
C - - - - - 0x01EAB8 07:EAA8: F0 05     BEQ bra_EAAE_RTS
C - - - - - 0x01EABA 07:EAAA: A9 00     LDA #$00
C - - - - - 0x01EABC 07:EAAC: 85 39     STA ram_пауза
bra_EAAE_RTS:
C - - - - - 0x01EABE 07:EAAE: 60        RTS
                                        
; ******************************************************************************************************************


ofs_033_E923_04_автозавершение_уровня:
C - - J - - 0x01E933 07:E923: A5 3E     LDY ram_07DA
C - - - - - 0x01E935 07:E925: C9 02     CPY #$02
C - - - - - 0x01E937 07:E927: 90 0A     BCC bra_E933
C - - - - - 0x01E939 07:E929: A0 00     LDA #$00
C - - - - - 0x01E93B 07:E92B: 84 F1     STA ram_нажатая_кнопка
C - - - - - 0x01E93D 07:E92D: 84 F2     STA ram_нажатая_кнопка + $01
C - - - - - 0x01E93F 07:E92F: 84 F3     STA ram_удержанная_кнопка
C - - - - - 0x01E941 07:E931: 84 F4     STA ram_удержанная_кнопка + $01
bra_E933:
                                        LDA tbl_E636_lo,y
                                        STA ram_0000
                                        LDA tbl_E636_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_E636_lo:
- D 3 - I - 0x01E946 07:E936: 42 E9     .byte < ofs_034_E942_00_босс_закончил_взрываться
- D 3 - I - 0x01E948 07:E938: 4C E9     .byte < ofs_034_E94C_01_ожидание_после_взрыва_босса
- D 3 - I - 0x01E94A 07:E93A: 79 E9     .byte < ofs_034_E979_02_игрок_автоматом_бежит_к_выходу
- D 3 - I - 0x01E94C 07:E93C: B2 E9     .byte < ofs_034_E9B2_03
- D 3 - I - 0x01E94E 07:E93E: BC E9     .byte < ofs_034_E9BC_04_затемнение_экрана
- D 3 - I - 0x01E950 07:E940: CC E9     .byte < ofs_034_E9CC_05
tbl_E636_hi:
- D 3 - I - 0x01E946 07:E936: 42 E9     .byte > ofs_034_E942_00_босс_закончил_взрываться
- D 3 - I - 0x01E948 07:E938: 4C E9     .byte > ofs_034_E94C_01_ожидание_после_взрыва_босса
- D 3 - I - 0x01E94A 07:E93A: 79 E9     .byte > ofs_034_E979_02_игрок_автоматом_бежит_к_выходу
- D 3 - I - 0x01E94C 07:E93C: B2 E9     .byte > ofs_034_E9B2_03
- D 3 - I - 0x01E94E 07:E93E: BC E9     .byte > ofs_034_E9BC_04_затемнение_экрана
- D 3 - I - 0x01E950 07:E940: CC E9     .byte > ofs_034_E9CC_05

; _________________________________________________________________________________________________________________

ofs_034_E942_00_босс_закончил_взрываться:
C - - J - - 0x01E952 07:E942: 20 3D FE  JSR sub_0x01FE4D_обработчик_уровня_и_смена_банка
C - - - - - 0x01E955 07:E945: 20 06 E9  JSR sub_0x01E918_обработчик_геймплея
C - - - - - 0x01E958 07:E948: A9 5E     LDA #$5E
C - - - - - 0x01E95A 07:E94A: D0 28     BNE bra_E974_запись_таймера_экрана    ; jmp

; _________________________________________________________________________________________________________________

ofs_034_E94C_01_ожидание_после_взрыва_босса:
C - - J - - 0x01E95C 07:E94C: 20 3D FE  JSR sub_0x01FE4D_обработчик_уровня_и_смена_банка
C - - - - - 0x01E95F 07:E94F: 20 06 E9  JSR sub_0x01E918_обработчик_геймплея
C - - - - - 0x01E962 07:E952: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x01E964 07:E954: 4A        LSR
C - - - - - 0x01E965 07:E955: B0 21     BCS bra_E978_RTS
C - - - - - 0x01E967 07:E957: C6 3F     DEC ram_таймер_экрана
C - - - - - 0x01E969 07:E959: D0 1D     BNE bra_E978_RTS
C - - - - - 0x01E96B 07:E95B: A9 33     LDA #con_sound_33   ; завершение уровня
C - - - - - 0x01E96D 07:E95D: A4 50     LDY ram_номер_уровня
C - - - - - 0x01E96F 07:E95F: C0 07     CPY #con_level_8
C - - - - - 0x01E971 07:E961: D0 02     BNE bra_E965_не_последний_уровень
; последний уровень
C - - - - - 0x01E973 07:E963: A9 34     LDA #con_sound_34    ; завершение последнего уровня
bra_E965_не_последний_уровень:
C - - - - - 0x01E975 07:E965: 20 DE FD  JSR sub_0x01FDEE_play_music
C - - - - - 0x01E978 07:E968: A9 00     LDA #$00
C - - - - - 0x01E97A 07:E96A: 85 40     STA ram_07DC
C - - - - - 0x01E97C 07:E96C: A5 5C     LDA ram_статус_завершения_уровня
C - - - - - 0x01E97E 07:E96E: 09 40     ORA #$40    ; флаг автобега игрока
C - - - - - 0x01E980 07:E970: 85 5C     STA ram_статус_завершения_уровня
C - - - - - 0x01E982 07:E972: A9 90     LDA #$90
bra_E974_запись_таймера_экрана:
C - - - - - 0x01E984 07:E974: 85 3F     STA ram_таймер_экрана
bra_E976:
loc_E976:
C D 3 - - - 0x01E986 07:E976: E6 3E     INC ram_07DA
bra_E978_RTS:
C - - - - - 0x01E988 07:E978: 60        RTS

; _________________________________________________________________________________________________________________

ofs_034_E979_02_игрок_автоматом_бежит_к_выходу:
C - - J - - 0x01E989 07:E979: 20 CF FE  JSR sub_A160_обработчик_завершения_уровня
C - - - - - 0x01E98C 07:E97C: 20 3D FE  JSR sub_0x01FE4D_обработчик_уровня_и_смена_банка
C - - - - - 0x01E98F 07:E97F: 20 06 E9  JSR sub_0x01E918_обработчик_геймплея
C - - - - - 0x01E992 07:E982: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x01E994 07:E984: 29 03     AND #$03
C - - - - - 0x01E996 07:E986: D0 02     BNE bra_E98A
C - - - - - 0x01E998 07:E988: C6 3F     DEC ram_таймер_экрана
bra_E98A:
C - - - - - 0x01E99A 07:E98A: F0 21     BEQ bra_E9AD
C - - - - - 0x01E99C 07:E98C: A5 3F     LDA ram_таймер_экрана
C - - - - - 0x01E99E 07:E98E: C9 30     CMP #$30
C - - - - - 0x01E9A0 07:E990: B0 1F     BCS bra_E9B1_RTS
C - - - - - 0x01E9A2 07:E992: A0 00     LDY #$00    ; счетчик выполненных условий в коде
C - - - - - 0x01E9A4 07:E994: A5 CA     LDA ram_plr_game_over
C - - - - - 0x01E9A6 07:E996: D0 07     BNE bra_E99F
C - - - - - 0x01E9A8 07:E998: A5 A0     LDA ram_статус_игрока
C - - - - - 0x01E9AA 07:E99A: C9 08     CMP #con_plr_status_добежал_до_выхода
C - - - - - 0x01E9AC 07:E99C: F0 01     BEQ bra_E99F
C - - - - - 0x01E9AE 07:E99E: C8        INY ; 01
bra_E99F:
C - - - - - 0x01E9AF 07:E99F: A5 CB     LDA ram_plr_game_over + $01
C - - - - - 0x01E9B1 07:E9A1: D0 07     BNE bra_E9AA
C - - - - - 0x01E9B3 07:E9A3: A5 A1     LDA ram_статус_игрока + $01
C - - - - - 0x01E9B5 07:E9A5: C9 08     CMP #con_plr_status_добежал_до_выхода
C - - - - - 0x01E9B7 07:E9A7: F0 01     BEQ bra_E9AA
C - - - - - 0x01E9B9 07:E9A9: C8        INY ; 01/02
bra_E9AA:
C - - - - - 0x01E9BA 07:E9AA: 98        TYA
C - - - - - 0x01E9BB 07:E9AB: D0 04     BNE bra_E9B1_RTS
bra_E9AD:
C - - - - - 0x01E9BD 07:E9AD: A9 08     LDA #$08
C - - - - - 0x01E9BF 07:E9AF: D0 C3     BNE bra_E974_запись_таймера_экрана    ; jmp
bra_E9B1_RTS:
C - - - - - 0x01E9C1 07:E9B1: 60        RTS

; _________________________________________________________________________________________________________________

ofs_034_E9B2_03:
C - - J - - 0x01E9C2 07:E9B2: C6 3F     DEC ram_таймер_экрана
C - - - - - 0x01E9C4 07:E9B4: D0 FB     BNE bra_E9B1_RTS
C - - - - - 0x01E9C6 07:E9B6: A9 01     LDA #$01
C - - - - - 0x01E9C8 07:E9B8: 85 95     STA ram_счетчик_затемнения_экрана
C - - - - - 0x01E9CA 07:E9BA: D0 BA     BNE bra_E976    ; jmp

; _________________________________________________________________________________________________________________

ofs_034_E9BC_04_затемнение_экрана:
C - - J - - 0x01E9CC 07:E9BC: 20 9F FA  JSR sub_0x01FAAF_затемнение_экрана
C - - - - - 0x01E9CF 07:E9BF: 08        PHP
C - - - - - 0x01E9D0 07:E9C0: 20 A9 F7  JSR sub_0x01F7B9_запись_палитры_из_03E0x_в_0300x_с_условием
C - - - - - 0x01E9D3 07:E9C3: 28        PLP
C - - - - - 0x01E9D4 07:E9C4: 90 EB     BCC bra_E9B1_RTS
; если вся палитра уже полностью черная
C - - - - - 0x01E9D6 07:E9C6: A9 30     LDA #$30
C - - - - - 0x01E9D8 07:E9C8: 85 3F     STA ram_таймер_экрана
C - - - - - 0x01E9DA 07:E9CA: D0 AA     BNE bra_E976    ; jmp

; _________________________________________________________________________________________________________________

ofs_034_E9CC_05:
C - - J - - 0x01E9DC 07:E9CC: C6 3F     DEC ram_таймер_экрана
C - - - - - 0x01E9DE 07:E9CE: D0 E1     BNE bra_E9B1_RTS
C - - - - - 0x01E9E0 07:E9D0: 20 57 E5  JSR sub_0x00FE84_XFF_обнуление_экранов_PPU
C - - - - - 0x01E9E3 07:E9D3: E6 50     INC ram_номер_уровня
C - - - - - 0x01E9E5 07:E9D5: A5 50     LDA ram_номер_уровня
C - - - - - 0x01E9E7 07:E9D7: C9 08     CMP #$08
C - - - - - 0x01E9E9 07:E9D9: 90 17     BCC bra_E9F2_not_finished_yet
; if next loop
; C = 1
; 1путин: удалены круги
C - - - - - 0x01E9EB 07:E9DB: A9 00     LDA #$00
C - - - - - 0x01E9ED 07:E9DD: 85 50     STA ram_номер_уровня
C - - - - - 0x01E9FB 07:E9EB: 20 C3 E5  JSR sub_E5C3_дополнительно_очистить_память_при_старте_уровня_1
C - - - - - 0x01E9FE 07:E9EE: A9 08     LDA #$08
C - - - - - 0x01EA00 07:E9F0: D0 02     BNE bra_E9F4    ; jmp
bra_E9F2_not_finished_yet:
C - - - - - 0x01EA02 07:E9F2: A9 00     LDA #$00
bra_E9F4:
C - - - - - 0x01EA04 07:E9F4: 4C 01 E9  JMP loc_E901_запись_номера_экрана

; ******************************************************************************************************************

sub_A160_обработчик_завершения_уровня:
                                        LDY ram_07DC
                                        LDA tbl_A16D_lo,y
                                        STA ram_0000
                                        LDA tbl_A16D_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_A16D_lo:
- D 1 - I - 0x00217D 00:A16D: 71 A1     .byte < ofs_007_A171_00
- D 1 - I - 0x00217F 00:A16F: B5 A1     .byte < ofs_007_A1B5_01
tbl_A16D_hi:
- D 1 - I - 0x00217D 00:A16D: 71 A1     .byte > ofs_007_A171_00
- D 1 - I - 0x00217F 00:A16F: B5 A1     .byte > ofs_007_A1B5_01

; _________________________________________________________________________________________________________________

ofs_007_A171_00:
C - - J - - 0x002181 00:A171: 20 77 A1  JSR sub_A177
C - - - - - 0x002184 00:A174: E6 40     INC ram_07DC
C - - - - - 0x002186 00:A176: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_A177:
                                        LDY ram_номер_уровня
                                        LDA tbl_A17C_lo,y
                                        STA ram_0000
                                        LDA tbl_A17C_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_A17C_lo:
- D 1 - I - 0x00218C 00:A17C: 8C A1     .byte < ofs_008_A18C_00_area_1
- D 1 - I - 0x00218E 00:A17E: 95 A1     .byte < ofs_008_A195_01_area_2
- D 1 - I - 0x002190 00:A180: A0 A1     .byte < ofs_008_A1A0_02_area_3
- D 1 - I - 0x002192 00:A182: 8C A1     .byte < ofs_008_A18C_03_area_4
- D 1 - I - 0x002194 00:A184: 8C A1     .byte < ofs_008_A18C_04_area_5
- D 1 - I - 0x002196 00:A186: A5 A1     .byte < ofs_008_A1A5_05_area_6
- D 1 - I - 0x002198 00:A188: A0 A1     .byte < ofs_008_A1A0_06_area_7
- D 1 - I - 0x00219A 00:A18A: B0 A1     .byte < ofs_008_A1B0_07_area_8
tbl_A17C_hi:
- D 1 - I - 0x00218C 00:A17C: 8C A1     .byte > ofs_008_A18C_00_area_1
- D 1 - I - 0x00218E 00:A17E: 95 A1     .byte > ofs_008_A195_01_area_2
- D 1 - I - 0x002190 00:A180: A0 A1     .byte > ofs_008_A1A0_02_area_3
- D 1 - I - 0x002192 00:A182: 8C A1     .byte > ofs_008_A18C_03_area_4
- D 1 - I - 0x002194 00:A184: 8C A1     .byte > ofs_008_A18C_04_area_5
- D 1 - I - 0x002196 00:A186: A5 A1     .byte > ofs_008_A1A5_05_area_6
- D 1 - I - 0x002198 00:A188: A0 A1     .byte > ofs_008_A1A0_06_area_7
- D 1 - I - 0x00219A 00:A18A: B0 A1     .byte > ofs_008_A1B0_07_area_8

; _________________________________________________________________________________________________________________

ofs_008_A18C_00_area_1:
ofs_008_A18C_03_area_4:
ofs_008_A18C_04_area_5:
C - - J - - 0x00219C 00:A18C: A9 02     LDA #$02
C - - - - - 0x00219E 00:A18E: 85 6F     STA ram_006F
C - - - - - 0x0021A0 00:A190: A9 00     LDA #$00
C - - - - - 0x0021A2 00:A192: 85 61     STA ram_0061_конфиг_уровня
C - - - - - 0x0021A4 00:A194: 60        RTS

; _________________________________________________________________________________________________________________

ofs_008_A195_01_area_2:
C - - J - - 0x0021A5 00:A195: A9 01     LDA #$01
C - - - - - 0x0021A7 00:A197: 85 84     STA ram_0083 + $01
C - - - - - 0x0021A9 00:A199: A9 40     LDA #$40
C - - - - - 0x0021AB 00:A19B: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x0021AD 00:A19D: 85 7D     STA ram_007D_тип_скролла
C - - - - - 0x0021AF 00:A19F: 60        RTS

; _________________________________________________________________________________________________________________

ofs_008_A1A0_02_area_3:
ofs_008_A1A0_06_area_7:
C - - J - - 0x0021B0 00:A1A0: A9 90     LDA #$90
C - - - - - 0x0021B2 00:A1A2: 85 9B     STA ram_009B
C - - - - - 0x0021B4 00:A1A4: 60        RTS

; _________________________________________________________________________________________________________________

ofs_008_A1A5_05_area_6:
C - - J - - 0x0021B5 00:A1A5: A0 1F     LDY #$1F
C - - - - - 0x0021B7 00:A1A7: A9 00     LDA #$00
bra_A1A9_loop:
C - - - - - 0x0021B9 00:A1A9: 99 80 04  STA ram_0480,Y
C - - - - - 0x0021BC 00:A1AC: 88        DEY
C - - - - - 0x0021BD 00:A1AD: 10 FA     BPL bra_A1A9_loop
C - - - - - 0x0021BF 00:A1AF: 60        RTS

; _________________________________________________________________________________________________________________

ofs_008_A1B0_07_area_8:
C - - J - - 0x0021C0 00:A1B0: A9 C0     LDA #$C0
C - - - - - 0x0021C2 00:A1B2: 85 9B     STA ram_009B
C - - - - - 0x0021C4 00:A1B4: 60        RTS

; _________________________________________________________________________________________________________________

ofs_007_A1B5_01:
C - - J - - 0x0021C5 00:A1B5: A2 01     LDX #$01
bra_A1B7_loop:
C - - - - - 0x0021C7 00:A1B7: B5 CA     LDA ram_plr_game_over,X
C - - - - - 0x0021C9 00:A1B9: D0 03     BNE bra_A1BE
C - - - - - 0x0021CB 00:A1BB: 20 C2 A1  JSR sub_A1C2
bra_A1BE:
C - - - - - 0x0021CE 00:A1BE: CA        DEX
C - - - - - 0x0021CF 00:A1BF: 10 F6     BPL bra_A1B7_loop
C - - - - - 0x0021D1 00:A1C1: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_A1C2:
                                        LDY ram_номер_уровня
                                        LDA tbl_A1C7_lo,y
                                        STA ram_0000
                                        LDA tbl_A1C7_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_A1C7_lo:
- D 1 - I - 0x0021D7 00:A1C7: D7 A1     .byte < ofs_009_A1D7_00_area_1
- D 1 - I - 0x0021D9 00:A1C9: FA A1     .byte < ofs_009_A1FA_01_area_2
- D 1 - I - 0x0021DB 00:A1CB: 2F A2     .byte < ofs_009_A22F_02_area_3
- D 1 - I - 0x0021DD 00:A1CD: 3F A2     .byte < ofs_009_A23F_03_area_4
- D 1 - I - 0x0021DF 00:A1CF: 48 A2     .byte < ofs_009_A248_04_area_5
- D 1 - I - 0x0021E1 00:A1D1: E2 A1     .byte < ofs_009_A1E2_05_area_6
- D 1 - I - 0x0021E3 00:A1D3: 2F A2     .byte < ofs_009_A22F_06_area_7
- D 1 - I - 0x0021E5 00:A1D5: 53 A2     .byte < ofs_009_A253_07_area_8
tbl_A1C7_hi:
- D 1 - I - 0x0021D7 00:A1C7: D7 A1     .byte > ofs_009_A1D7_00_area_1
- D 1 - I - 0x0021D9 00:A1C9: FA A1     .byte > ofs_009_A1FA_01_area_2
- D 1 - I - 0x0021DB 00:A1CB: 2F A2     .byte > ofs_009_A22F_02_area_3
- D 1 - I - 0x0021DD 00:A1CD: 3F A2     .byte > ofs_009_A23F_03_area_4
- D 1 - I - 0x0021DF 00:A1CF: 48 A2     .byte > ofs_009_A248_04_area_5
- D 1 - I - 0x0021E1 00:A1D1: E2 A1     .byte > ofs_009_A1E2_05_area_6
- D 1 - I - 0x0021E3 00:A1D3: 2F A2     .byte > ofs_009_A22F_06_area_7
- D 1 - I - 0x0021E5 00:A1D5: 53 A2     .byte > ofs_009_A253_07_area_8

; _________________________________________________________________________________________________________________

ofs_009_A1D7_00_area_1:
C - - J - - 0x0021E7 00:A1D7: A9 90     LDA #$90
C - - - - - 0x0021E9 00:A1D9: 85 00     STA ram_0000
C - - - - - 0x0021EB 00:A1DB: A9 B8     LDA #$B8
C - - - - - 0x0021ED 00:A1DD: 85 01     STA ram_0001
C - - - - - 0x0021EF 00:A1DF: 4C 69 A2  JMP loc_A269

; _________________________________________________________________________________________________________________

ofs_009_A1E2_05_area_6:
C - - J - - 0x0021F2 00:A1E2: A0 00     LDY #$00
C - - - - - 0x0021F4 00:A1E4: A5 84     LDA ram_0083 + $01
C - - - - - 0x0021F6 00:A1E6: D0 3F     BNE bra_A227
C - - - - - 0x0021F8 00:A1E8: BD 32 05  LDA ram_позиция_y_спрайта_игрока,X
C - - - - - 0x0021FB 00:A1EB: C9 08     CMP #$08
C - - - - - 0x0021FD 00:A1ED: 90 3B     BCC bra_A22A
C - - - - - 0x0021FF 00:A1EF: C9 50     CMP #$50
C - - - - - 0x002201 00:A1F1: B0 04     BCS bra_A1F7
C - - - - - 0x002203 00:A1F3: A9 01     LDA #$01
C - - - - - 0x002205 00:A1F5: 95 D2     STA ram_состояние_коллизий_игрока,X
bra_A1F7:
C - - - - - 0x002207 00:A1F7: 4C 17 A2  JMP loc_A217

; _________________________________________________________________________________________________________________

ofs_009_A1FA_01_area_2:
C - - J - - 0x00220A 00:A1FA: A0 00     LDY #$00
C - - - - - 0x00220C 00:A1FC: A5 84     LDA ram_0083 + $01
C - - - - - 0x00220E 00:A1FE: D0 27     BNE bra_A227
C - - - - - 0x002210 00:A200: BD 32 05  LDA ram_позиция_y_спрайта_игрока,X
C - - - - - 0x002213 00:A203: C9 08     CMP #$08
C - - - - - 0x002215 00:A205: 90 23     BCC bra_A22A
C - - - - - 0x002217 00:A207: C9 40     CMP #$40
C - - - - - 0x002219 00:A209: B0 0C     BCS bra_A217
C - - - - - 0x00221B 00:A20B: A9 01     LDA #$01
C - - - - - 0x00221D 00:A20D: 95 D2     STA ram_состояние_коллизий_игрока,X
C - - - - - 0x00221F 00:A20F: BD 66 05  LDA ram_атрибуты_спрайта_игрока,X
C - - - - - 0x002222 00:A212: 09 20     ORA #$20
C - - - - - 0x002224 00:A214: 9D 66 05  STA ram_атрибуты_спрайта_игрока,X
bra_A217:
loc_A217:
C D 1 - - - 0x002227 00:A217: A0 08     LDY #$08
C - - - - - 0x002229 00:A219: BD 4C 05  LDA ram_позиция_x_спрайта_игрока,X
C - - - - - 0x00222C 00:A21C: DD 2D A2  CMP tbl_A22D_позиция_x_спрайта,X
C - - - - - 0x00222F 00:A21F: F0 06     BEQ bra_A227
C - - - - - 0x002231 00:A221: A0 09     LDY #con_btn_Up + con_btn_Right
C - - - - - 0x002233 00:A223: 90 02     BCC bra_A227
C - - - - - 0x002235 00:A225: A0 0A     LDY #con_btn_Up + con_btn_Left
bra_A227:
C - - - - - 0x002237 00:A227: 94 F3     STY ram_удержанная_кнопка,X
C - - - - - 0x002239 00:A229: 60        RTS
bra_A22A:
C - - - - - 0x00223A 00:A22A: 4C 97 A2  JMP loc_A297

tbl_A22D_позиция_x_спрайта:
- D 1 - - - 0x00223D 00:A22D: 90        .byte $90   ; 00 
- D 1 - - - 0x00223E 00:A22E: 70        .byte $70   ; 01 

; _________________________________________________________________________________________________________________

ofs_009_A22F_02_area_3:
ofs_009_A22F_06_area_7:
C - - J - - 0x00223F 00:A22F: A5 9B     LDA ram_009B
C - - - - - 0x002241 00:A231: F0 03     BEQ bra_A236
C - - - - - 0x002243 00:A233: C6 9B     DEC ram_009B
C - - - - - 0x002245 00:A235: 60        RTS
bra_A236:
C - - - - - 0x002246 00:A236: A9 FF     LDA #$FF
C - - - - - 0x002248 00:A238: 85 00     STA ram_0000
C - - - - - 0x00224A 00:A23A: 85 01     STA ram_0001
C - - - - - 0x00224C 00:A23C: 4C 77 A2  JMP loc_A277

; _________________________________________________________________________________________________________________

ofs_009_A23F_03_area_4:
C - - J - - 0x00224F 00:A23F: A9 C8     LDA #$C8
C - - - - - 0x002251 00:A241: 85 00     STA ram_0000
C - - - - - 0x002253 00:A243: 85 01     STA ram_0001
C - - - - - 0x002255 00:A245: 4C 69 A2  JMP loc_A269

; _________________________________________________________________________________________________________________

ofs_009_A248_04_area_5:
C - - J - - 0x002258 00:A248: A9 90     LDA #$90
C - - - - - 0x00225A 00:A24A: 85 00     STA ram_0000
C - - - - - 0x00225C 00:A24C: A9 A8     LDA #$A8
C - - - - - 0x00225E 00:A24E: 85 01     STA ram_0001
C - - - - - 0x002260 00:A250: 4C 69 A2  JMP loc_A269

; _________________________________________________________________________________________________________________

ofs_009_A253_07_area_8:
C - - J - - 0x002263 00:A253: A9 00     LDA #$00
C - - - - - 0x002265 00:A255: 95 F3     STA ram_удержанная_кнопка,X
C - - - - - 0x002267 00:A257: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x002269 00:A259: 4A        LSR
C - - - - - 0x00226A 00:A25A: B0 0C     BCS bra_A268_RTS
C - - - - - 0x00226C 00:A25C: A5 9B     LDA ram_009B
C - - - - - 0x00226E 00:A25E: F0 08     BEQ bra_A268_RTS
C - - - - - 0x002270 00:A260: C6 9B     DEC ram_009B
C - - - - - 0x002272 00:A262: D0 04     BNE bra_A268_RTS
C - - - - - 0x002274 00:A264: A9 01     LDA #$01
C - - - - - 0x002276 00:A266: 85 3F     STA ram_таймер_экрана
bra_A268_RTS:
C - - - - - 0x002278 00:A268: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

loc_A269:
C D 1 - - - 0x002279 00:A269: A9 00     LDA #$00
C - - - - - 0x00227B 00:A26B: A4 6F     LDY ram_006F
C - - - - - 0x00227D 00:A26D: D0 25     BNE bra_A294
C - - - - - 0x00227F 00:A26F: B5 CC     LDA ram_копия_позиция_x_спрайта_игрока,X
C - - - - - 0x002281 00:A271: D0 04     BNE bra_A277
C - - - - - 0x002283 00:A273: A9 80     LDA #con_btn_A
C - - - - - 0x002285 00:A275: 95 F1     STA ram_нажатая_кнопка,X
bra_A277:
loc_A277:
C D 1 - - - 0x002287 00:A277: BD 4C 05  LDA ram_позиция_x_спрайта_игрока,X
C - - - - - 0x00228A 00:A27A: C9 E8     CMP #$E8
C - - - - - 0x00228C 00:A27C: B0 19     BCS bra_A297
C - - - - - 0x00228E 00:A27E: C5 00     CMP ram_0000
C - - - - - 0x002290 00:A280: 90 04     BCC bra_A286
C - - - - - 0x002292 00:A282: A0 01     LDY #$01
C - - - - - 0x002294 00:A284: 94 D2     STY ram_состояние_коллизий_игрока,X
bra_A286:
C - - - - - 0x002296 00:A286: C5 01     CMP ram_0001
C - - - - - 0x002298 00:A288: 90 08     BCC bra_A292
C - - - - - 0x00229A 00:A28A: BD 66 05  LDA ram_атрибуты_спрайта_игрока,X
C - - - - - 0x00229D 00:A28D: 09 20     ORA #$20
C - - - - - 0x00229F 00:A28F: 9D 66 05  STA ram_атрибуты_спрайта_игрока,X
bra_A292:
C - - - - - 0x0022A2 00:A292: A9 01     LDA #con_btn_Right
bra_A294:   ; A = 00
C - - - - - 0x0022A4 00:A294: 95 F3     STA ram_удержанная_кнопка,X
C - - - - - 0x0022A6 00:A296: 60        RTS
bra_A297:
loc_A297:
C D 1 - - - 0x0022A7 00:A297: A9 08     LDA #con_plr_status_добежал_до_выхода
C - - - - - 0x0022A9 00:A299: 95 A0     STA ram_статус_игрока,X
C - - - - - 0x0022AB 00:A29B: 60        RTS

; ******************************************************************************************************************

ofs_033_E9F7_05_подготовка_gameover:
                                        INC ram_002B
C - - - - - 0x01EA0A 07:E9FA: 20 FE E5  JSR sub_E5FE_очистить_спрайты_6000_60FF
C - - - - - 0x01EA0D 07:E9FD: 20 57 E5  JSR sub_0x00FE84_XFF_обнуление_экранов_PPU
C - - - - - 0x01EA10 07:EA00: A9 00     LDA #$00
C - - - - - 0x01EA12 07:EA02: 85 87     STA ram_game_over_flag
;C - - - - - 0x01EA14 07:EA04: A9 09     LDA #con_0x0017EA_game_over
;C - - - - - 0x01EA16 07:EA06: 20 7A FE  JSR sub_FE7A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01EA19 07:EA09: 20 31 E7  JSR sub_E731
C - - - - - 0x01EA1C 07:EA0C: 20 C0 E7  JSR sub_0x01E7D0_выбор_банков_графики
C - - - - - 0x01EA1F 07:EA0F: A9 C0     LDA #$C0
loc_EA11:
C D 3 - - - 0x01EA21 07:EA11: 85 3F     STA ram_таймер_экрана
C - - - - - 0x01EA23 07:EA13: 4C B2 E8  JMP loc_E8B2

; ******************************************************************************************************************

ofs_033_EA16_06_gameover_музыка:
C - - J - - 0x01EA26 07:EA16: C6 3F     DEC ram_таймер_экрана
C - - - - - 0x01EA28 07:EA18: D0 3F     BNE bra_EA59_RTS
C - - - - - 0x01EA2A 07:EA1A: C6 59     DEC ram_конты
C - - - - - 0x01EA2C 07:EA1C: 30 34     BMI bra_EA52_игра_окончена
;C - - - - - 0x01EA2E 07:EA1E: A9 0A     LDA #con_0x0017EA_continue_end
;C - - - - - 0x01EA30 07:EA20: 20 7A FE  JSR sub_FE7A_bankswitch_отрисовка_текста_через_буфер_0300x
C - - - - - 0x01EA33 07:EA23: A9 00     LDA #$00
C - - - - - 0x01EA35 07:EA25: 85 2C     STA ram_номер_опции_game_over
C - - - - - 0x01EA37 07:EA27: 4C B2 E8  JMP loc_E8B2

; ******************************************************************************************************************

ofs_033_EA2A_07_gameover_выбор_опций:
C - - J - - 0x01EA3A 07:EA2A: A5 F1     LDA ram_нажатая_кнопка
C - - - - - 0x01EA3C 07:EA2C: 29 2C     AND #con_btn_Select + con_btns_UD
C - - - - - 0x01EA3E 07:EA2E: F0 06     BEQ bra_EA36_нет_нажатий
; поменять опцию continue/end
C - - - - - 0x01EA40 07:EA30: A5 2C     LDA ram_номер_опции_game_over
C - - - - - 0x01EA42 07:EA32: 49 01     EOR #$01
C - - - - - 0x01EA44 07:EA34: 85 2C     STA ram_номер_опции_game_over
bra_EA36_нет_нажатий:
C - - - - - 0x01EA46 07:EA36: A4 2C     LDY ram_номер_опции_game_over
C - - - - - 0x01EA48 07:EA38: B9 5A EA  LDA tbl_EA5A_позиция_y_спрайта,Y
                                        STA ram_позиция_y_спрайта
C - - - - - 0x01EA4B 07:EA3B: A0 50     LDY #$50
                                        STY ram_позиция_x_спрайта
                                        LDA #$B9
                                        STA ram_кадр_анимации
                                        LDA #$01
                                        STA ram_атрибуты_спрайта
C - - - - - 0x01EA50 07:EA40: A5 F1     LDA ram_нажатая_кнопка
C - - - - - 0x01EA52 07:EA42: 29 10     AND #con_btn_Start
C - - - - - 0x01EA54 07:EA44: F0 13     BEQ bra_EA59_RTS
C - - - - - 0x01EA56 07:EA46: A5 2C     LDA ram_номер_опции_game_over
C - - - - - 0x01EA58 07:EA48: D0 08     BNE bra_EA52_игра_окончена
C - - - - - 0x01EA5A 07:EA4A: 20 94 E5  JSR sub_E594_подготовка_игроков_к_продолжению_после_gameover
C - - - - - 0x01EA5D 07:EA4D: A9 00     LDA #$00
C - - - - - 0x01EA5F 07:EA4F: 4C 01 E9  JMP loc_E901_запись_номера_экрана
bra_EA52_игра_окончена:
C - - - - - 0x01EA62 07:EA52: A9 00     LDA #$00
C - - - - - 0x01EA64 07:EA54: 85 F0     STA ram_номер_уровня_для_демки_ботов
                                        STA ram_флаг_читов
C D 3 - - - 0x01EA66 07:EA56: 4C 92 E4  JMP loc_0x01E4FC_запись_в_демку_кастом
bra_EA59_RTS:
C - - - - - 0x01EA69 07:EA59: 60        RTS

tbl_EA5A_позиция_y_спрайта:
- D 3 - - - 0x01EA6A 07:EA5A: 90        .byte $90   ; 00 
- D 3 - - - 0x01EA6B 07:EA5B: A8        .byte $A8   ; 01 

; ******************************************************************************************************************

sub_E582_подготовка_игроков_к_первому_старту:
C - - - - - 0x01E592 07:E582: A9 00     LDA ram_option_уровень
C - - - - - 0x01E594 07:E584: 85 50     STA ram_номер_уровня
C - - - - - 0x01E596 07:E586: A9 00     LDA #con_plr_status_мертвый
C - - - - - 0x01E598 07:E588: 85 A0     STA ram_статус_игрока
C - - - - - 0x01E59A 07:E58A: 85 A1     STA ram_статус_игрока + $01
C - - - - - 0x01E59C 07:E58C: A9 02     LDA ram_option_конты
C - - - - - 0x01E59E 07:E58E: 85 59     STA ram_конты
C - - - - - 0x01E5A0 07:E590: A5 22     LDA ram_номер_опции_колво_игроков
C - - - - - 0x01E5A2 07:E592: 85 20     STA ram_колво_игроков
sub_E594_подготовка_игроков_к_продолжению_после_gameover:
C - - - - - 0x01E5A4 07:E594: A6 20     LDX ram_колво_игроков
bra_E596_loop:
C - - - - - 0x01E5A6 07:E596: A9 01     LDA #con_plr_status_респавн
C - - - - - 0x01E5A8 07:E598: 95 A0     STA ram_статус_игрока,X
C - - - - - 0x01E5AA 07:E59A: A9 00     LDA #$00    ; con_weapon_pistol
C - - - - - 0x01E5AC 07:E59C: 95 CA     STA ram_plr_game_over,X
C - - - - - 0x01E5AE 07:E59E: 95 C4     STA ram_инвиз_игрока,X
C - - - - - 0x01E5B0 07:E5A0: 95 B8     STA ram_оружие_игрока,X
C - - - - - 0x01E5B9 07:E5A9: A9 09     LDA ram_option_жизни
C - - - - - 0x01E5BB 07:E5AB: 95 53     STA ram_жизни,X
C - - - - - 0x01E5BD 07:E5AD: A9 30     LDA #$30
C - - - - - 0x01E5BF 07:E5AF: 95 55     STA ram_очки_до_жизни_младш,X
C - - - - - 0x01E5C1 07:E5B1: A9 00     LDA #$00
C - - - - - 0x01E5C3 07:E5B3: 95 57     STA ram_очки_до_жизни_старш,X
C - - - - - 0x01E5C5 07:E5B5: CA        DEX
C - - - - - 0x01E5C6 07:E5B6: 10 DE     BPL bra_E596_loop
; запись оружий
                                        LDY #$0F    ; пока что макс индекс кол-во видов оружия для обоих игроков
                                        LDA #$FF
                                        STA ram_колво_патронов_игрока_младш
                                        STA ram_колво_патронов_игрока_младш + $01
                                        STA ram_колво_патронов_игрока_старш
                                        STA ram_колво_патронов_игрока_старш + $01
bra_E5B7_loop:
                                        LDA tbl_0010_лимит_пуль_оружия,Y
                                        STA ram_лимит_пуль_оружия,Y
                                        LDA tbl_0011_урон_оружия,Y
                                        STA ram_урон_оружия,Y
                                        LDA tbl_0012_скорость_оружия,Y
                                        STA ram_скорость_оружия,Y
                                        LDA tbl_0013_кд_оружия,Y
                                        STA ram_кд_оружия,Y
                                        LDA tbl_0014_прокачка_оружия,Y
                                        STA ram_прокачка_оружия,Y
                                        LDA tbl_0015_характеристики_оружия,Y
                                        STA ram_характеристики_оружия,Y
                                        DEY
                                        BPL bra_E5B7_loop
; очистка 07E3-07E8 очки игроков
C - - - - - 0x01E5C8 07:E5B8: A9 00     LDA #$00
C - - - - - 0x01E5CA 07:E5BA: A0 05     LDY #$05
bra_E5BC_loop:
C - - - - - 0x01E5CC 07:E5BC: 99 E3 07  STA ram_очки_игрока,Y
C - - - - - 0x01E5CF 07:E5BF: 88        DEY
C - - - - - 0x01E5D0 07:E5C0: 10 FA     BPL bra_E5BC_loop
C - - - - - 0x01E5D2 07:E5C2: 60        RTS

tbl_0010_лимит_пуль_оружия:
                                        .byte $06, $06, $0A, $0A, $0A, $0A, $07, $07, $06, $06, $03, $03, $08, $08, $02, $02    ; 

tbl_0011_урон_оружия:
                                        .byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01    ; 

tbl_0012_скорость_оружия:
                                        .byte $06, $06, $06, $06, $10, $10, $06, $06, $18, $18, $09, $09, $04, $04, $05, $05    ; 

tbl_0013_кд_оружия:
                                        .byte $06, $06, $08, $08, $00, $00, $0A, $0A, $09, $09, $09, $09, $00, $00, $10, $10    ; 

tbl_0014_прокачка_оружия:
                                        .byte $00, $00, $02, $02, $00, $00, $01, $01, $00, $00, $00, $00, $02, $02, $00, $00    ; 

tbl_0015_характеристики_оружия:
                                        .byte $00, $00, $00, $00, $00, $00, $00, $00, $09, $09, $00, $00, $05, $05, $00, $00    ; 

; ******************************************************************************************************************

ofs_033_EA5C_08_заставка:
C - - J - - 0x01EA6C 07:EA5C: A5 3E     LDA ram_07DA
C - - - - - 0x01EA6E 07:EA5E: D0 18     BNE bra_EA78
;C - - - - - 0x01EA70 07:EA60: 20 57 E5  JSR sub_0x00FE84_XFF_обнуление_экранов_PPU
C - - - - - 0x01EA73 07:EA63: A2 04     LDX #$02
C - - - - - 0x01EA75 07:EA65: 20 84 FE  JSR sub_0x01FE94_bankswitch_отрисовка_экранов
C - - - - - 0x01EA78 07:EA68: A9 0A     LDA #$12    ; палитра заставки
C - - - - - 0x01EA7A 07:EA6A: 20 70 FE  JSR sub_B886_загрузка_палитры
C - - - - - 0x01EA7D 07:EA6D: 20 BE F7  JSR sub_0x01F7CE_запись_палитры_из_03E0x_в_0300x
C - - - - - 0x01EA80 07:EA70: A9 36     LDA #con_sound_36   ; музыка на титрах
C - - - - - 0x01EA82 07:EA72: 20 DE FD  JSR sub_0x01FDEE_play_music
C - - - - - 0x01EA85 07:EA75: 4C 76 E9  JMP loc_E976
bra_EA78:
C - - - - - 0x01EA88 07:EA78: 20 F7 FE  JSR sub_A3B0_обработчик_титров
C - - - - - 0x01EA8B 07:EA7B: A5 60     LDA ram_0060_unk
C - - - - - 0x01EA8D 07:EA7D: F0 DA     BEQ bra_A3EE_RTS
C - - - - - 0x01EA8F 07:EA7F: A9 00     LDA #$00    ; con_weapon_pistol
C - - - - - 0x01EA91 07:EA81: 85 B8     STA ram_оружие_игрока
C - - - - - 0x01EA93 07:EA83: 85 B9     STA ram_оружие_игрока + $01
C - - - - - 0x01EA95 07:EA85: A9 00     LDA #$00
C - - - - - 0x01EA97 07:EA87: 4C 01 E9  JMP loc_E901_запись_номера_экрана

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_A3B0_обработчик_титров:
                                        LDY ram_0061_конфиг_уровня
                                        LDA tbl_A3BC_lo,y
                                        STA ram_0000
                                        LDA tbl_A3BC_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_A3BC_lo:
- D 1 - I - 0x0023CC 00:A3BC: C6 A3     .byte < ofs_011_A3C6_00
- D 1 - I - 0x0023CE 00:A3BE: EF A3     .byte < ofs_011_A3EF_01
- D 1 - I - 0x0023D0 00:A3C0: 02 A4     .byte < ofs_011_A402_02
- D 1 - I - 0x0023D2 00:A3C2: 16 A4     .byte < ofs_011_A416_03
- D 1 - I - 0x0023D4 00:A3C4: 26 A4     .byte < ofs_011_A426_04
tbl_A3BC_hi:
- D 1 - I - 0x0023CC 00:A3BC: C6 A3     .byte > ofs_011_A3C6_00
- D 1 - I - 0x0023CE 00:A3BE: EF A3     .byte > ofs_011_A3EF_01
- D 1 - I - 0x0023D0 00:A3C0: 02 A4     .byte > ofs_011_A402_02
- D 1 - I - 0x0023D2 00:A3C2: 16 A4     .byte > ofs_011_A416_03
- D 1 - I - 0x0023D4 00:A3C4: 26 A4     .byte > ofs_011_A426_04

; _________________________________________________________________________________________________________________

ofs_011_A3C6_00:
C - - J - - 0x0023D6 00:A3C6: A0 0F     LDY #$0F
C - - - - - 0x0023D8 00:A3C8: A9 00     LDA #$00
bra_A3CA_loop:
; 0070-007F
C - - - - - 0x0023DA 00:A3CA: 99 70 00  STA $70,Y
C - - - - - 0x0023DD 00:A3CD: 88        DEY
C - - - - - 0x0023DE 00:A3CE: 10 FA     BPL bra_A3CA_loop
C - - - - - 0x0023E0 00:A3D0: 20 C0 E7  JSR sub_0x01E7D0_выбор_банков_графики
C - - - - - 0x0023E3 00:A3D3: A9 18     LDA #con_chr_bank + $18
C - - - - - 0x0023E5 00:A3D5: 8D F1 07  STA ram_bg_bank_2
C - - - - - 0x0023E8 00:A3D8: A9 69     LDA #con_chr_bank + $69
C - - - - - 0x0023EA 00:A3DA: 8D F5 07  STA ram_spr_bank_4
C - - - - - 0x0023ED 00:A3DD: A9 03     LDA #con_irq_credits
C - - - - - 0x0023EF 00:A3DF: 85 27     STA ram_irq_handler_hi
C - - - - - 0x0023F1 00:A3E1: 20 03 A6  JSR sub_A603
C - - - - - 0x0023F4 00:A3E4: A9 01     LDA #con_mirroring_H
C - - - - - 0x0023F6 00:A3E6: 85 26     STA ram_mirroring
C - - - - - 0x0023F8 00:A3E8: A9 02     LDA #$02
loc_A3EA:
C D 1 - - - 0x0023FA 00:A3EA: 85 70     STA ram_0070
loc_A3EC:
C D 1 - - - 0x0023FC 00:A3EC: E6 61     INC ram_0061_конфиг_уровня
bra_A3EE_RTS:
C - - - - - 0x0023FE 00:A3EE: 60        RTS

; _________________________________________________________________________________________________________________

ofs_011_A3EF_01:
C - - J - - 0x0023FF 00:A3EF: 20 03 A6  JSR sub_A603
C - - - - - 0x002402 00:A3F2: 20 6A A4  JSR sub_A46A
C - - - - - 0x002405 00:A3F5: C6 70     DEC ram_0070
C - - - - - 0x002407 00:A3F7: D0 F5     BNE bra_A3EE_RTS
C - - - - - 0x002409 00:A3F9: A9 00     LDA #$00
C - - - - - 0x00240B 00:A3FB: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x00240D 00:A3FD: 85 72     STA ram_скорость_камеры_Y
C - - - - - 0x00240F 00:A3FF: 4C EC A3  JMP loc_A3EC

; _________________________________________________________________________________________________________________

ofs_011_A402_02:
C - - J - - 0x002412 00:A402: 20 03 A6  JSR sub_A603
C - - - - - 0x002415 00:A405: 20 6A A4  JSR sub_A46A
C - - - - - 0x002418 00:A408: 20 38 A4  JSR sub_A438_обработчик_вертолета_в_титрах
C - - - - - 0x00241B 00:A40B: 20 95 A4  JSR sub_A495
C - - - - - 0x00241E 00:A40E: 90 05     BCC bra_A415_RTS
C - - - - - 0x002420 00:A410: A9 20     LDA #$20
C - - - - - 0x002422 00:A412: 4C EA A3  JMP loc_A3EA
bra_A415_RTS:
C - - - - - 0x002425 00:A415: 60        RTS

; _________________________________________________________________________________________________________________

ofs_011_A416_03:
C - - J - - 0x002426 00:A416: 20 03 A6  JSR sub_A603
C - - - - - 0x002429 00:A419: 20 6A A4  JSR sub_A46A
C - - - - - 0x00242C 00:A41C: 20 38 A4  JSR sub_A438_обработчик_вертолета_в_титрах
C - - - - - 0x00242F 00:A41F: C6 70     DEC ram_0070
C - - - - - 0x002431 00:A421: D0 14     BNE bra_A437_RTS
C - - - - - 0x002433 00:A423: 4C EC A3  JMP loc_A3EC

; _________________________________________________________________________________________________________________

ofs_011_A426_04:
C - - J - - 0x002436 00:A426: 20 03 A6  JSR sub_A603
C - - - - - 0x002439 00:A429: 20 6A A4  JSR sub_A46A
C - - - - - 0x00243C 00:A42C: 20 38 A4  JSR sub_A438_обработчик_вертолета_в_титрах
C - - - - - 0x00243F 00:A42F: A5 F1     LDA ram_нажатая_кнопка
C - - - - - 0x002441 00:A431: 29 10     AND #con_btn_Start
C - - - - - 0x002443 00:A433: F0 02     BEQ bra_A437_RTS
C - - - - - 0x002445 00:A435: E6 60     INC ram_0060_unk
bra_A437_RTS:
C - - - - - 0x002447 00:A437: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_A438_обработчик_вертолета_в_титрах:
                                        LDY ram_состояние_объектов_для_обработчика
                                        LDA tbl_A43E_lo,y
                                        STA ram_0000
                                        LDA tbl_A43E_hi,y
                                        STA ram_0001
                                        JMP (ram_0000)
tbl_A43E_lo:
- D 1 - I - 0x00244E 00:A43E: 42 A4     .byte < ofs_012_A442_00
- D 1 - I - 0x002450 00:A440: 4B A4     .byte < ofs_012_A44B_01
tbl_A43E_hi:
- D 1 - I - 0x00244E 00:A43E: 42 A4     .byte > ofs_012_A442_00
- D 1 - I - 0x002450 00:A440: 4B A4     .byte > ofs_012_A44B_01

; _________________________________________________________________________________________________________________

ofs_012_A442_00:
C - - J - - 0x002452 00:A442: A9 48     LDA #$48
C - - - - - 0x002454 00:A444: 8D 3C 05  STA ram_позиция_x_спрайта_объекта_или_пули
C - - - - - 0x002457 00:A447: EE 68 06  INC ram_состояние_объектов_для_обработчика
C - - - - - 0x00245A 00:A44A: 60        RTS

; _________________________________________________________________________________________________________________

ofs_012_A44B_01:
C - - J - - 0x00245B 00:A44B: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x00245D 00:A44D: 4A        LSR
C - - - - - 0x00245E 00:A44E: A9 38     LDA #$38
C - - - - - 0x002460 00:A450: 90 02     BCC bra_A454
C - - - - - 0x002462 00:A452: A9 39     LDA #$39
bra_A454:
C - - - - - 0x002464 00:A454: 8D 22 05  STA ram_позиция_y_спрайта_объекта_или_пули
C - - - - - 0x002467 00:A457: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x002469 00:A459: 4A        LSR
C - - - - - 0x00246A 00:A45A: 4A        LSR
C - - - - - 0x00246B 00:A45B: A9 BA     LDA #$BA
C - - - - - 0x00246D 00:A45D: 90 02     BCC bra_A461
C - - - - - 0x00246F 00:A45F: A9 BB     LDA #$BB
bra_A461:
C - - - - - 0x002471 00:A461: 8D 08 05  STA ram_кадр_объекта_или_пули
C - - - - - 0x002474 00:A464: A9 03     LDA #$03
C - - - - - 0x002476 00:A466: 8D 56 05  STA ram_атрибуты_спрайта_объекта_или_пули
C - - - - - 0x002479 00:A469: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_A46A:
C - - - - - 0x00247A 00:A46A: E6 75     INC ram_0075
C - - - - - 0x00247C 00:A46C: A5 75     LDA ram_0075
C - - - - - 0x00247E 00:A46E: C9 04     CMP #$04
C - - - - - 0x002480 00:A470: 90 06     BCC bra_A478
C - - - - - 0x002482 00:A472: A9 00     LDA #$00
C - - - - - 0x002484 00:A474: 85 75     STA ram_0075
C - - - - - 0x002486 00:A476: E6 FD     INC ram_scroll_X
bra_A478:
C - - - - - 0x002488 00:A478: E6 76     INC ram_0076
C - - - - - 0x00248A 00:A47A: A5 76     LDA ram_0076
C - - - - - 0x00248C 00:A47C: C9 08     CMP #$08
C - - - - - 0x00248E 00:A47E: 90 06     BCC bra_A486
C - - - - - 0x002490 00:A480: A9 00     LDA #$00
C - - - - - 0x002492 00:A482: 85 76     STA ram_0076
C - - - - - 0x002494 00:A484: E6 73     INC ram_0073
bra_A486:
C - - - - - 0x002496 00:A486: E6 77     INC ram_0077
C - - - - - 0x002498 00:A488: A5 77     LDA ram_0077
C - - - - - 0x00249A 00:A48A: C9 16     CMP #$16
C - - - - - 0x00249C 00:A48C: 90 06     BCC bra_A494_RTS
C - - - - - 0x00249E 00:A48E: A9 00     LDA #$00
C - - - - - 0x0024A0 00:A490: 85 77     STA ram_0077
C - - - - - 0x0024A2 00:A492: E6 74     INC ram_0074_конфиг_уровня
bra_A494_RTS:
C - - - - - 0x0024A4 00:A494: 60        RTS

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_A495:
C - - - - - 0x0024A5 00:A495: A5 1B     LDA ram_счетчик_кадров
C - - - - - 0x0024A7 00:A497: 29 03     AND #$03
C - - - - - 0x0024A9 00:A499: F0 03     BEQ bra_A49E
C - - - - - 0x0024AB 00:A49B: 4C 25 A5  JMP loc_A525
bra_A49E:
C - - - - - 0x0024AE 00:A49E: A5 F9     LDA ram_00F9
C - - - - - 0x0024B0 00:A4A0: 18        CLC
C - - - - - 0x0024B1 00:A4A1: 69 01     ADC #$01
C - - - - - 0x0024B3 00:A4A3: C9 F0     CMP #$F0
C - - - - - 0x0024B5 00:A4A5: 90 02     BCC bra_A4A9
C - - - - - 0x0024B7 00:A4A7: 69 0F     ADC #$0F
bra_A4A9:
C - - - - - 0x0024B9 00:A4A9: 85 F9     STA ram_00F9
C - - - - - 0x0024BB 00:A4AB: 29 07     AND #$07
C - - - - - 0x0024BD 00:A4AD: D0 76     BNE bra_A525
C - - - - - 0x0024BF 00:A4AF: A6 1E     LDX ram_index_ppu_buffer
C - - - - - 0x0024C1 00:A4B1: A9 06     LDA #con_buf_mode_06
C - - - - - 0x0024C3 00:A4B3: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0024C6 00:A4B6: E8        INX
C - - - - - 0x0024C7 00:A4B7: A5 F9     LDA ram_00F9
C - - - - - 0x0024C9 00:A4B9: 18        CLC
C - - - - - 0x0024CA 00:A4BA: 69 60     ADC #$60
C - - - - - 0x0024CC 00:A4BC: B0 04     BCS bra_A4C2
C - - - - - 0x0024CE 00:A4BE: C9 F0     CMP #$F0
C - - - - - 0x0024D0 00:A4C0: 90 02     BCC bra_A4C4
bra_A4C2:
C - - - - - 0x0024D2 00:A4C2: 69 0F     ADC #$0F
bra_A4C4:
C - - - - - 0x0024D4 00:A4C4: 29 F8     AND #$F8
C - - - - - 0x0024D6 00:A4C6: 85 00     STA ram_0000
C - - - - - 0x0024D8 00:A4C8: A9 09     LDA #$09
C - - - - - 0x0024DA 00:A4CA: 06 00     ASL ram_0000
C - - - - - 0x0024DC 00:A4CC: 2A        ROL
C - - - - - 0x0024DD 00:A4CD: 06 00     ASL ram_0000
C - - - - - 0x0024DF 00:A4CF: 2A        ROL
C - - - - - 0x0024E0 00:A4D0: 9D 00 03  STA ram_nmt_buffer,X    ; ppu hi
C - - - - - 0x0024E3 00:A4D3: E8        INX
C - - - - - 0x0024E4 00:A4D4: A5 00     LDA ram_0000
C - - - - - 0x0024E6 00:A4D6: 18        CLC
C - - - - - 0x0024E7 00:A4D7: 69 08     ADC #$08
C - - - - - 0x0024E9 00:A4D9: 9D 00 03  STA ram_nmt_buffer,X    ; ppu lo
C - - - - - 0x0024EC 00:A4DC: E8        INX
C - - - - - 0x0024ED 00:A4DD: A9 10     LDA #$10
C - - - - - 0x0024EF 00:A4DF: 9D 00 03  STA ram_nmt_buffer,X    ; counter
C - - - - - 0x0024F2 00:A4E2: E8        INX
C - - - - - 0x0024F3 00:A4E3: A9 00     LDA #$00
C - - - - - 0x0024F5 00:A4E5: A0 10     LDY #$10
bra_A4E7_loop:
C - - - - - 0x0024F7 00:A4E7: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x0024FA 00:A4EA: E8        INX
C - - - - - 0x0024FB 00:A4EB: 88        DEY
C - - - - - 0x0024FC 00:A4EC: D0 F9     BNE bra_A4E7_loop
C - - - - - 0x0024FE 00:A4EE: A9 FF     LDA #$FF
C - - - - - 0x002500 00:A4F0: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x002503 00:A4F3: E8        INX
C - - - - - 0x002504 00:A4F4: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x002506 00:A4F6: E6 72     INC ram_скорость_камеры_Y
C - - - - - 0x002508 00:A4F8: A4 71     LDY ram_0071_тип_скролла
C - - - - - 0x00250A 00:A4FA: B9 3B A5  LDA tbl_A53B_титры,Y
C - - - - - 0x00250D 00:A4FD: C5 72     CMP ram_скорость_камеры_Y
C - - - - - 0x00250F 00:A4FF: D0 24     BNE bra_A525
C - - - - - 0x002511 00:A501: C8        INY
C - - - - - 0x002512 00:A502: B9 3B A5  LDA tbl_A53B_титры,Y
C - - - - - 0x002515 00:A505: 30 20     BMI bra_A527_FE_FF
C - - - - - 0x002517 00:A507: 8A        TXA
C - - - - - 0x002518 00:A508: 38        SEC
C - - - - - 0x002519 00:A509: E9 11     SBC #$11
C - - - - - 0x00251B 00:A50B: 18        CLC
C - - - - - 0x00251C 00:A50C: 79 3B A5  ADC tbl_A53B_титры,Y
C - - - - - 0x00251F 00:A50F: AA        TAX
C - - - - - 0x002520 00:A510: C8        INY
C - - - - - 0x002521 00:A511: B9 3B A5  LDA tbl_A53B_титры,Y
C - - - - - 0x002524 00:A514: 85 00     STA ram_0000
C - - - - - 0x002526 00:A516: C8        INY
bra_A517_loop:
C - - - - - 0x002527 00:A517: B9 3B A5  LDA tbl_A53B_титры,Y
C - - - - - 0x00252A 00:A51A: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x00252D 00:A51D: E8        INX
C - - - - - 0x00252E 00:A51E: C8        INY
C - - - - - 0x00252F 00:A51F: C6 00     DEC ram_0000
C - - - - - 0x002531 00:A521: D0 F4     BNE bra_A517_loop
C - - - - - 0x002533 00:A523: 84 71     STY ram_0071_тип_скролла
bra_A525:
loc_A525:
C D 1 - - - 0x002535 00:A525: 18        CLC
C - - - - - 0x002536 00:A526: 60        RTS
bra_A527_FE_FF:
C - - - - - 0x002537 00:A527: C9 FE     CMP #$FE
C - - - - - 0x002539 00:A529: D0 0E     BNE bra_A539_FF
; FE
C - - - - - 0x00253B 00:A52B: A9 10     LDA #$10
C - - - - - 0x00253D 00:A52D: 8D E1 03  STA ram_pal_buffer + $01
C - - - - - 0x002540 00:A530: 20 B8 F7  JSR sub_0x01F7C8_запись_фоновой_палитры_из_03E0x_в_0300x
C - - - - - 0x002543 00:A533: E6 71     INC ram_0071_тип_скролла
C - - - - - 0x002545 00:A535: E6 71     INC ram_0071_тип_скролла
C - - - - - 0x002547 00:A537: 18        CLC
C - - - - - 0x002548 00:A538: 60        RTS
bra_A539_FF:
C - - - - - 0x002549 00:A539: 38        SEC
C - - - - - 0x00254A 00:A53A: 60        RTS

tbl_A53B_титры:
- D 1 - - - 0x00254B 00:A53B: 02        .byte $02   ; 
- D 1 - - - 0x00254C 00:A53C: 05        .byte $05   ; 

- D 1 - - - 0x00254D 00:A53D: 05        .byte $05   ; counter
- D 1 - - - 0x00254E 00:A53E: 1D        .byte $1D, $1E, $0B, $10, $10   ; "STAFF"

- D 1 - - - 0x002553 00:A543: 0A        .byte $0A   ; 
- D 1 - - - 0x002554 00:A544: 03        .byte $03   ; 

- D 1 - - - 0x002555 00:A545: 0A        .byte $0A   ; counter
- D 1 - - - 0x002556 00:A546: 1A        .byte $1A, $1C, $19, $11, $1C, $0B, $17, $17, $0F, $1C   ; "PROGRAMMER"

- D 1 - - - 0x002560 00:A550: 0E        .byte $0E   ; 
- D 1 - - - 0x002561 00:A551: 03        .byte $03   ; 

- D 1 - - - 0x002562 00:A552: 09        .byte $09   ; counter
- D 1 - - - 0x002563 00:A553: 1D        .byte $1D, $26, $1F, $17, $0F, $24, $0B, $15, $13   ; "S.UMEZAKI"

- D 1 - - - 0x00256C 00:A55C: 16        .byte $16   ; 
- D 1 - - - 0x00256D 00:A55D: 01        .byte $01   ; 

- D 1 - - - 0x00256E 00:A55E: 0E        .byte $0E   ; counter
- D 1 - - - 0x00256F 00:A55F: 11        .byte $11, $1C, $0B, $1A, $12, $13, $0D, $00, $0E, $0F, $1D, $13, $11, $18   ; "GRAPHIC DESIGN"

- D 1 - - - 0x00257D 00:A56D: 1A        .byte $1A   ; 
- D 1 - - - 0x00257E 00:A56E: 04        .byte $04   ; 

- D 1 - - - 0x00257F 00:A56F: 08        .byte $08   ; counter
- D 1 - - - 0x002580 00:A570: 1D        .byte $1D, $26, $17, $1F, $1C, $0B, $15, $13   ; "S.MURAKI"

- D 1 - - - 0x002588 00:A578: 22        .byte $22   ; 
- D 1 - - - 0x002589 00:A579: 02        .byte $02   ; 

- D 1 - - - 0x00258A 00:A57A: 0C        .byte $0C   ; counter
- D 1 - - - 0x00258B 00:A57B: 1D        .byte $1D, $19, $1F, $18, $0E, $00, $0E, $0F, $1D, $13, $11, $18   ; "SOUND DESIGN"

- D 1 - - - 0x002597 00:A587: 26        .byte $26   ; 
- D 1 - - - 0x002598 00:A588: 03        .byte $03   ; 

- D 1 - - - 0x002599 00:A589: 09        .byte $09   ; counter
- D 1 - - - 0x00259A 00:A58A: 12        .byte $12, $26, $17, $0B, $0F, $24, $0B, $21, $0B   ; "H.MAEZAWA"

- D 1 - - - 0x0025A3 00:A593: 2E        .byte $2E   ; 
- D 1 - - - 0x0025A4 00:A594: 01        .byte $01   ; 

- D 1 - - - 0x0025A5 00:A595: 0E        .byte $0E   ; counter
- D 1 - - - 0x0025A6 00:A596: 1D        .byte $1D, $1A, $0F, $0D, $13, $0B, $16, $00, $1E, $12, $0B, $18, $15, $1D   ; "SPECIAL THANKS"

- D 1 - - - 0x0025B4 00:A5A4: 32        .byte $32   ; 
- D 1 - - - 0x0025B5 00:A5A5: 03        .byte $03   ; 

- D 1 - - - 0x0025B6 00:A5A6: 0A        .byte $0A   ; counter
- D 1 - - - 0x0025B7 00:A5A7: 15        .byte $15, $26, $1D, $12, $13, $17, $19, $13, $0E, $0F   ; "K.SHIMOIDE"

- D 1 - - - 0x0025C1 00:A5B1: 35        .byte $35   ; 
- D 1 - - - 0x0025C2 00:A5B2: 02        .byte $02   ; 

- D 1 - - - 0x0025C3 00:A5B3: 0C        .byte $0C   ; counter
- D 1 - - - 0x0025C4 00:A5B4: 1D        .byte $1D, $1F, $1A, $0F, $1C, $00, $0D, $00, $1E, $0F, $0B, $17   ; "SUPER C TEAM"

- D 1 - - - 0x0025D0 00:A5C0: 3D        .byte $3D   ; 
- D 1 - - - 0x0025D1 00:A5C1: 02        .byte $02   ; 

- D 1 - - - 0x0025D2 00:A5C2: 0B        .byte $0B   ; counter
- D 1 - - - 0x0025D3 00:A5C3: 0E        .byte $0E, $13, $1C, $0F, $0D, $1E, $0F, $0E, $00, $0C, $23   ; "DIRECTED BY"

- D 1 - - - 0x0025DE 00:A5CE: 41        .byte $41   ; 
- D 1 - - - 0x0025DF 00:A5CF: 02        .byte $02   ; 

- D 1 - - - 0x0025E0 00:A5D0: 0C        .byte $0C   ; counter
- D 1 - - - 0x0025E1 00:A5D1: 1F        .byte $1F, $17, $0F, $0D, $12, $0B, $18, $00, $1E, $0F, $0B, $17   ; "UMECHAN TEAM"

- D 1 - - - 0x0025ED 00:A5DD: 50        .byte $50   ; 

- D 1 - - - 0x0025EE 00:A5DE: FE        .byte $FE   ; FE

- D 1 - - - 0x0025EF 00:A5DF: 51        .byte $51   ; 
- D 1 - - - 0x0025F0 00:A5E0: 03        .byte $03   ; 

- D 1 - - - 0x0025F1 00:A5E1: 0B        .byte $0B   ; counter
- D 1 - - - 0x0025F2 00:A5E2: 2E        .byte $2E, $2F, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D   ; konami logo (upper part)

- D 1 - - - 0x0025FD 00:A5ED: 52        .byte $52   ; 
- D 1 - - - 0x0025FE 00:A5EE: 02        .byte $02   ; 

- D 1 - - - 0x0025FF 00:A5EF: 0C        .byte $0C   ; counter
- D 1 - - - 0x002600 00:A5F0: 30        .byte $30, $31, $32, $3E, $3F, $40, $41, $42, $43, $44, $45, $46   ; konami logo (middle part)

- D 1 - - - 0x00260C 00:A5FC: 53        .byte $53   ; 
- D 1 - - - 0x00260D 00:A5FD: 02        .byte $02   ; 

- D 1 - - - 0x00260E 00:A5FE: 02        .byte $02   ; counter
- D 1 - - - 0x00260F 00:A5FF: 33        .byte $33, $34   ; konami logo (bottom part)

- D 1 - - - 0x002611 00:A601: 59        .byte $59   ; 

- D 1 - - - 0x002612 00:A602: FF        .byte $FF   ; end token

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub_A603:
C - - - - - 0x002613 00:A603: A9 00     LDA #$00
C - - - - - 0x002615 00:A605: 85 FA     STA ram_00FA
C - - - - - 0x002617 00:A607: A9 38     LDA #$38
C - - - - - 0x002619 00:A609: 85 45     STA ram_номер_сканлинии
C - - - - - 0x00261B 00:A60B: A5 F9     LDA ram_00F9
C - - - - - 0x00261D 00:A60D: 29 07     AND #$07
C - - - - - 0x00261F 00:A60F: 85 47     STA ram_0047
C - - - - - 0x002621 00:A611: A9 27     LDA #$27
C - - - - - 0x002623 00:A613: 38        SEC
C - - - - - 0x002624 00:A614: E5 47     SBC ram_0047
C - - - - - 0x002626 00:A616: 85 46     STA ram_0046
C - - - - - 0x002628 00:A618: E6 47     INC ram_0047
C - - - - - 0x00262A 00:A61A: E6 47     INC ram_0047
C - - - - - 0x00262C 00:A61C: E6 47     INC ram_0047
C - - - - - 0x00262E 00:A61E: A0 0B     LDY #$0B
C - - - - - 0x002630 00:A620: 84 4B     STY ram_004B
C - - - - - 0x002632 00:A622: A5 F9     LDA ram_00F9
C - - - - - 0x002634 00:A624: 29 F8     AND #$F8
C - - - - - 0x002636 00:A626: 0A        ASL
C - - - - - 0x002637 00:A627: 26 4B     ROL ram_004B
C - - - - - 0x002639 00:A629: 0A        ASL
C - - - - - 0x00263A 00:A62A: 26 4B     ROL ram_004B
C - - - - - 0x00263C 00:A62C: 85 4A     STA ram_004A
C - - - - - 0x00263E 00:A62E: 60        RTS

; ******************************************************************************************************************

loc_8010_работа_с_экранами:
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
                                        JSR sub_B886_загрузка_палитры
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
                                        JSR sub_E5D0_очистка_оперативки
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
                                        JMP loc_0x01E4F5_увеличить_демку
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
                                        JMP loc_0x01E4FC_запись_в_демку_кастом   
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
                                        JMP loc_0x01E4FC_запись_в_демку_кастом
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
                                        JSR sub_E5D0_очистка_оперативки
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
                                        JMP loc_E7E9_игра
bra_8103_закончить_демку:
                                        JSR sub_0x01E4A6_выбрать_следующий_уровень_для_демки
                                        JMP loc_0x01E4A2_запись_в_демку_00


ofs_00_8110_02_подготовка_данных_для_старта_игроков:
                                        LDA #$00
                                        STA ram_флаг_игры_ботов_в_демке
                                        LDX ram_номер_действия_на_заставке
                                        BNE bra_8111
                                        INC ram_номер_действия_на_заставке
                                        RTS
bra_8111:
                                        JSR sub_E5D0_очистка_оперативки
                                        JSR sub_E582_подготовка_игроков_к_первому_старту
                                        JMP loc_0x01E4F5_увеличить_демку


ofs_00_8120_03_подготовка_экрана_для_старта_игроков:
                                        LDA #$00
                                        STA ram_номер_экрана
                                        JMP loc_0x01E4F5_увеличить_демку


ofs_00_8130_04_игра:
                                        JMP loc_E7E9_игра


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
                                        JMP loc_0x01E4FC_запись_в_демку_кастом    ; jmp


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
                                        JSR sub_B886_загрузка_палитры
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
                                        JSR sub_E5D0_очистка_оперативки
                                        JSR sub_0x01E7D0_выбор_банков_графики
                                        LDA #con_chr_bank + $84
                                        STA ram_bg_bank_2
                                        LDX #$00
                                        JSR sub_0x01FE94_bankswitch_отрисовка_экранов
                                        LDA ram_for_2000
                                        AND #$FC
                                        STA ram_for_2000
                                        LDA #$10    ; палитра главного экрана
                                        JSR sub_B886_загрузка_палитры
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
C - - - - - 0x01E56C 07:E55C: 20 D0 E5  JSR sub_E5D0_очистка_оперативки
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
C - - - - - 0x01E542 07:E532: 20 70 FE  JSR sub_B886_загрузка_палитры
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
C - - - - - 0x01E52C 07:E51C: 20 D0 E5  JSR sub_E5D0_очистка_оперативки
C - - - - - 0x01E52F 07:E51F: 20 C0 E7  JSR sub_0x01E7D0_выбор_банков_графики
; 1путин опт
                                        INC ram_002B
C - - - - - 0x01E535 07:E525: A9 1E     LDA #$1E
C - - - - - 0x01E537 07:E527: 85 FE     STA ram_for_2001
C - - - - - 0x01E539 07:E529: 60        RTS



sub_9AE9_sound_mode_handler:
; leon опт
                                        LDY ram_0030_sound_mode_handler
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
C - - - - - 0x009B02 02:9AF2: 85 57     STA ram_0037_sound_mode_ppu_hi
C - - - - - 0x009B04 02:9AF4: A9 A0     LDA #< $23A0
C - - - - - 0x009B06 02:9AF6: 85 56     STA ram_0036_sound_mode_ppu_lo
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
C D 0 - - - 0x009B1E 02:9B0E: E6 50     INC ram_0030_sound_mode_handler    ; 00 -> 01, 01 -> 02, 02 -> 03
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
C - - - - - 0x009B52 02:9B42: A5 53     LDA ram_0032_sound_mode_track_cur
C - - - - - 0x009B54 02:9B44: 38        SEC
C - - - - - 0x009B55 02:9B45: E5 54     SBC ram_0033_sound_mode_track_min
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
C - - - - - 0x009B71 02:9B61: A5 53     LDA ram_0032_sound_mode_track_cur
C - - - - - 0x009B73 02:9B63: C9 26     CMP #$26
C - - - - - 0x009B75 02:9B65: F0 0F     BEQ bra_9B76_26
C - - - - - 0x009B77 02:9B67: C9 0E     CMP #$0E
C - - - - - 0x009B79 02:9B69: B0 03     BCS bra_9B6E
C - - - - - 0x009B7B 02:9B6B: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
bra_9B6E:
C - - - - - 0x009B7E 02:9B6E: A4 53     LDY ram_0032_sound_mode_track_cur
C - - - - - 0x009B80 02:9B70: B9 A4 9C  LDA tbl_9CA4_список_треков,Y
C - - - - - 0x009B83 02:9B73: 4C DE FD  JMP loc_0x01FDEE_play_sound_напрямую
bra_9B76_26:
; проиграть один за другим
C - - - - - 0x009B86 02:9B76: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
C - - - - - 0x009B89 02:9B79: AD 5E 9F  LDA #< tbl_9F62_автовоспроизведение
C - - - - - 0x009B8C 02:9B7C: 85 5C     STA ram_0034_sound_mode_data_lo
C - - - - - 0x009B8E 02:9B7E: AD 5F 9F  LDA #> tbl_9F62_автовоспроизведение
C - - - - - 0x009B91 02:9B81: 85 5D     STA ram_0035_sound_mode_data_hi
C - - - - - 0x009B9D 02:9B8D: A9 01     LDA #$01
C - - - - - 0x009B9F 02:9B8F: 85 59     STA ram_0054_play_all
C - - - - - 0x009BA1 02:9B91: 60        RTS



sub_9B92_sound_mode:
C - - - - - 0x009BA2 02:9B92: A5 59     LDA ram_0054_play_all
C - - - - - 0x009BA4 02:9B94: D0 31     BNE bra_9BC7_RTS
C - - - - - 0x009BA6 02:9B96: A5 F7     LDA ram_копия_удержанная_кнопка
C - - - - - 0x009BA8 02:9B98: 29 0C     AND #con_btns_UD
C - - - - - 0x009BAA 02:9B9A: F0 2B     BEQ bra_9BC7_RTS
C - - - - - 0x009BAC 02:9B9C: A0 04     LDY #$04
C - - - - - 0x009BAE 02:9B9E: C6 58     DEC ram_002F_sound_mode
C - - - - - 0x009BB0 02:9BA0: F0 08     BEQ bra_9BAA
C - - - - - 0x009BB2 02:9BA2: A5 F5     LDA ram_копия_нажатая_кнопка
C - - - - - 0x009BB4 02:9BA4: 29 0C     AND #con_btns_UD
C - - - - - 0x009BB6 02:9BA6: F0 1F     BEQ bra_9BC7_RTS
C - - - - - 0x009BB8 02:9BA8: A0 20     LDY #$20
bra_9BAA:
C - - - - - 0x009BBA 02:9BAA: 84 58     STY ram_002F_sound_mode
C - - - - - 0x009BBC 02:9BAC: 4A        LSR
C - - - - - 0x009BBD 02:9BAD: 4A        LSR
C - - - - - 0x009BBE 02:9BAE: 4A        LSR
C - - - - - 0x009BBF 02:9BAF: 90 17     BCC bra_9BC8
C - - - - - 0x009BC1 02:9BB1: A5 53     LDA ram_0032_sound_mode_track_cur
C - - - - - 0x009BC3 02:9BB3: C9 26     CMP #$26
C - - - - - 0x009BC5 02:9BB5: B0 10     BCS bra_9BC7_RTS
C - - - - - 0x009BC7 02:9BB7: E6 53     INC ram_0032_sound_mode_track_cur
C - - - - - 0x009BC9 02:9BB9: A5 53     LDA ram_0032_sound_mode_track_cur
C - - - - - 0x009BCB 02:9BBB: 38        SEC
C - - - - - 0x009BCC 02:9BBC: E5 54     SBC ram_0033_sound_mode_track_min
C - - - - - 0x009BCE 02:9BBE: C9 07     CMP #$07
C - - - - - 0x009BD0 02:9BC0: 90 05     BCC bra_9BC7_RTS
C - - - - - 0x009BD2 02:9BC2: E6 54     INC ram_0033_sound_mode_track_min
C - - - - - 0x009BD4 02:9BC4: 4C D9 9B  JMP loc_9BD9
bra_9BC7_RTS:
C - - - - - 0x009BD7 02:9BC7: 60        RTS
bra_9BC8:
C - - - - - 0x009BD8 02:9BC8: 4A        LSR
C - - - - - 0x009BD9 02:9BC9: 90 FC     BCC bra_9BC7_RTS
C - - - - - 0x009BDB 02:9BCB: A5 53     LDA ram_0032_sound_mode_track_cur
C - - - - - 0x009BDD 02:9BCD: F0 F8     BEQ bra_9BC7_RTS
C - - - - - 0x009BDF 02:9BCF: C6 53     DEC ram_0032_sound_mode_track_cur
C - - - - - 0x009BE1 02:9BD1: A5 53     LDA ram_0032_sound_mode_track_cur
C - - - - - 0x009BE3 02:9BD3: C5 54     CMP ram_0033_sound_mode_track_min
C - - - - - 0x009BE5 02:9BD5: B0 F0     BCS bra_9BC7_RTS
C - - - - - 0x009BE7 02:9BD7: C6 54     DEC ram_0033_sound_mode_track_min
sub_9BD9:
loc_9BD9:
C D 0 - - - 0x009BE9 02:9BD9: A9 22     LDA #> $22A8
C - - - - - 0x009BEB 02:9BDB: 85 01     STA ram_0001
C - - - - - 0x009BED 02:9BDD: A9 A8     LDA #< $22A8
C - - - - - 0x009BEF 02:9BDF: 85 00     STA ram_0000
C - - - - - 0x009BF1 02:9BE1: A9 00     LDA #$00
C - - - - - 0x009BF3 02:9BE3: 85 09     STA ram_0009
C - - - - - 0x009BF5 02:9BE5: A5 54     LDA ram_0033_sound_mode_track_min
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
C - - - - - 0x009C60 02:9C50: A5 57     LDA ram_0037_sound_mode_ppu_hi  ; ppu hi
C - - - - - 0x009C62 02:9C52: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C65 02:9C55: E8        INX
C - - - - - 0x009C66 02:9C56: A5 56     LDA ram_0036_sound_mode_ppu_lo  ; ppu lo
C - - - - - 0x009C68 02:9C58: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C6B 02:9C5B: E8        INX
C - - - - - 0x009C6C 02:9C5C: A9 20     LDA #$20    ; counter
C - - - - - 0x009C6E 02:9C5E: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C71 02:9C61: E8        INX
C - - - - - 0x009C72 02:9C62: A9 00     LDA #$00    ; tile
C - - - - - 0x009C74 02:9C64: 9D 00 03  STA ram_nmt_buffer,X
C - - - - - 0x009C77 02:9C67: E8        INX
C - - - - - 0x009C78 02:9C68: 86 1E     STX ram_index_ppu_buffer
C - - - - - 0x009C7A 02:9C6A: A5 56     LDA ram_0036_sound_mode_ppu_lo
C - - - - - 0x009C7C 02:9C6C: 38        SEC
C - - - - - 0x009C7D 02:9C6D: E9 20     SBC #< $0020
C - - - - - 0x009C7F 02:9C6F: 85 56     STA ram_0036_sound_mode_ppu_lo
C - - - - - 0x009C81 02:9C71: A5 57     LDA ram_0037_sound_mode_ppu_hi
C - - - - - 0x009C83 02:9C73: E9 00     SBC #> $0020
C - - - - - 0x009C85 02:9C75: 85 57     STA ram_0037_sound_mode_ppu_hi
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
C - - - - - 0x009F18 02:9F08: A5 59     LDA ram_0054_play_all
C - - - - - 0x009F1A 02:9F0A: F0 03     BEQ bra_9F0F_RTS
C - - - - - 0x009F1C 02:9F0C: 20 10 9F  JSR sub_9F10
bra_9F0F_RTS:
C - - - - - 0x009F1F 02:9F0F: 60        RTS



sub_9F10:
C - - - - - 0x009F20 02:9F10: A5 5A     LDA ram_0053_sound_mode
C - - - - - 0x009F22 02:9F12: 05 5B     ORA ram_0031_sound_mode
C - - - - - 0x009F24 02:9F14: F0 07     BEQ bra_9F1D
C - - - - - 0x009F26 02:9F16: C6 5A     DEC ram_0053_sound_mode
C - - - - - 0x009F28 02:9F18: D0 02     BNE bra_9F1C_RTS
C - - - - - 0x009F2A 02:9F1A: C6 5B     DEC ram_0031_sound_mode
bra_9F1C_RTS:
C - - - - - 0x009F2C 02:9F1C: 60        RTS
bra_9F1D:
C - - - - - 0x009F2D 02:9F1D: A0 00     LDY #$00
C - - - - - 0x009F2F 02:9F1F: B1 5C     LDA (ram_0034_sound_mode_data_lo),Y
C - - - - - 0x009F31 02:9F21: C9 FF     CMP #$FF
C - - - - - 0x009F33 02:9F23: F0 2C     BEQ bra_9F51_FF
C - - - - - 0x009F35 02:9F25: 85 09     STA ram_0009
; 1путин опт
C - - - - - 0x009F39 02:9F29: 85 5B     STA ram_0031_sound_mode
C - - - - - 0x009F3B 02:9F2B: C8        INY
C - - - - - 0x009F3C 02:9F2C: B1 5C     LDA (ram_0034_sound_mode_data_lo),Y
C - - - - - 0x009F3E 02:9F2E: 85 5A     STA ram_0053_sound_mode
C - - - - - 0x009F40 02:9F30: C8        INY
C - - - - - 0x009F41 02:9F31: B1 5C     LDA (ram_0034_sound_mode_data_lo),Y
C - - - - - 0x009F43 02:9F33: 85 08     STA ram_0008
; 1путин опт
C - - - - - 0x009F4A 02:9F3A: 20 0E FE  JSR sub_0x01FE1E_остановить_звуковой_движок
C - - - - - 0x009F4D 02:9F3D: A5 08     LDA ram_0008
C - - - - - 0x009F4F 02:9F3F: 20 DE FD  JSR sub_0x01FDEE_play_sound
C D 0 - - - 0x009F55 02:9F45: A5 5C     LDA ram_0034_sound_mode_data_lo
C - - - - - 0x009F57 02:9F47: 18        CLC
C - - - - - 0x009F58 02:9F48: 69 03     ADC #$03
C - - - - - 0x009F5A 02:9F4A: 85 5C     STA ram_0034_sound_mode_data_lo
C - - - - - 0x009F60 02:9F50: 60        RTS
bra_9F51_FF:
sub_9F51:
C - - - - - 0x009F61 02:9F51: A9 00     LDA #$00
C - - - - - 0x009F63 02:9F53: 85 59     STA ram_0054_play_all
C - - - - - 0x009F65 02:9F55: 85 5A     STA ram_0053_sound_mode
C - - - - - 0x009F67 02:9F57: 85 5B     STA ram_0031_sound_mode
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

; ==================================================================================================================
;  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; ==================================================================================================================

sub_0x001CA6:
C D 0 - - - 0x001CA6 00:9C96: 20 E8 9C  JSR sub_9CE8
C - - - - - 0x001CA9 00:9C99: A6 61     LDX ram_0061_конфиг_уровня
C - - - - - 0x001CAB 00:9C9B: F0 05     BEQ bra_9CA2
C - - - - - 0x001CAD 00:9C9D: CA        DEX
C - - - - - 0x001CAE 00:9C9E: F0 42     BEQ bra_9CE2_RTS
C - - - - - 0x001CB0 00:9CA0: D0 1B     BNE bra_9CBD    ; jmp
bra_9CA2:
C - - - - - 0x001CB2 00:9CA2: A6 85     LDX ram_0085_for_2006
C - - - - - 0x001CB4 00:9CA4: 30 17     BMI bra_9CBD
C - - - - - 0x001CB6 00:9CA6: A5 62     LDA ram_скорость_камеры_X
C - - - - - 0x001CB8 00:9CA8: F0 38     BEQ bra_9CE2_RTS
C - - - - - 0x001CBA 00:9CAA: 18        CLC
C - - - - - 0x001CBB 00:9CAB: 65 FD     ADC ram_scroll_X
C - - - - - 0x001CBD 00:9CAD: 85 FD     STA ram_scroll_X
C - - - - - 0x001CBF 00:9CAF: A6 85     LDX ram_0085_for_2006
C - - - - - 0x001CC1 00:9CB1: D0 2F     BNE bra_9CE2_RTS
C - - - - - 0x001CC3 00:9CB3: 90 08     BCC bra_9CBD
C - - - - - 0x001CC5 00:9CB5: A5 FF     LDA ram_for_2000
C - - - - - 0x001CC7 00:9CB7: 49 01     EOR #$01
C - - - - - 0x001CC9 00:9CB9: 85 FF     STA ram_for_2000
C - - - - - 0x001CCB 00:9CBB: E6 63     INC ram_0063
bra_9CBD:
C - - - - - 0x001CCD 00:9CBD: A4 89     LDY ram_0089_столбцы_данных_уровня
C - - - - - 0x001CCF 00:9CBF: 88        DEY
C - - - - - 0x001CD0 00:9CC0: 84 00     STY ram_0000
C - - - - - 0x001CD2 00:9CC2: A5 63     LDA ram_0063
C - - - - - 0x001CD4 00:9CC4: C5 00     CMP ram_0000
C - - - - - 0x001CD6 00:9CC6: B0 1B     BCS bra_9CE3
C - - - - - 0x001CD8 00:9CC8: C5 6C     CMP ram_006C
C - - - - - 0x001CDA 00:9CCA: F0 08     BEQ bra_9CD4
C - - - - - 0x001CDC 00:9CCC: B0 0C     BCS bra_9CDA
; C = 0
C - - - - - 0x001CDE 00:9CCE: A5 6C     LDA ram_006C
C - - - - - 0x001CE0 00:9CD0: 30 08     BMI bra_9CDA
C - - - - - 0x001CE2 00:9CD2: 90 0E     BCC bra_9CE2_RTS    ; jmp
bra_9CD4:
C - - - - - 0x001CE4 00:9CD4: A5 FD     LDA ram_scroll_X
C - - - - - 0x001CE6 00:9CD6: C5 6B     CMP ram_006B
C - - - - - 0x001CE8 00:9CD8: 90 08     BCC bra_9CE2_RTS
bra_9CDA:
C - - - - - 0x001CEA 00:9CDA: A5 60     LDA ram_0060_unk
C - - - - - 0x001CEC 00:9CDC: D0 04     BNE bra_9CE2_RTS
C - - - - - 0x001CEE 00:9CDE: A9 02     LDA #$02
C - - - - - 0x001CF0 00:9CE0: 85 60     STA ram_0060_unk
bra_9CE2_RTS:
C - - - - - 0x001CF2 00:9CE2: 60        RTS
bra_9CE3:
- - - - - - 0x001CF3 00:9CE3: A9 01     LDA #$01
- - - - - - 0x001CF5 00:9CE5: 85 61     STA ram_0061_конфиг_уровня
bra_9CE7_RTS:
C - - - - - 0x001CF7 00:9CE7: 60        RTS

sub_9CE8:
C - - - - - 0x001CF8 00:9CE8: A5 FC     LDA ram_scroll_Y
C - - - - - 0x001CFA 00:9CEA: 29 0F     AND #$0F
C - - - - - 0x001CFC 00:9CEC: 85 00     STA ram_0000
C - - - - - 0x001CFE 00:9CEE: A5 72     LDA ram_скорость_камеры_Y
C - - - - - 0x001D00 00:9CF0: F0 F5     BEQ bra_9CE7_RTS
C - - - - - 0x001D02 00:9CF2: 30 57     BMI bra_9D4B
C - - - - - 0x001D04 00:9CF4: 18        CLC
C - - - - - 0x001D05 00:9CF5: 65 FC     ADC ram_scroll_Y
C - - - - - 0x001D07 00:9CF7: 85 FC     STA ram_scroll_Y
C - - - - - 0x001D09 00:9CF9: B0 04     BCS bra_9CFF
C - - - - - 0x001D0B 00:9CFB: C9 F0     CMP #$F0
C - - - - - 0x001D0D 00:9CFD: 90 07     BCC bra_9D06
bra_9CFF:
C - - - - - 0x001D0F 00:9CFF: 18        CLC
C - - - - - 0x001D10 00:9D00: 69 10     ADC #$10
C - - - - - 0x001D12 00:9D02: 85 FC     STA ram_scroll_Y
C - - - - - 0x001D14 00:9D04: E6 82     INC ram_0082_конфиг_уровня
bra_9D06:
C - - - - - 0x001D16 00:9D06: A5 00     LDA ram_0000
C - - - - - 0x001D18 00:9D08: C9 07     CMP #$07
C - - - - - 0x001D1A 00:9D0A: B0 37     BCS bra_9D43
C - - - - - 0x001D1C 00:9D0C: A5 FC     LDA ram_scroll_Y
C - - - - - 0x001D1E 00:9D0E: 29 0F     AND #$0F
C - - - - - 0x001D20 00:9D10: C9 07     CMP #$07
C - - - - - 0x001D22 00:9D12: 90 2F     BCC bra_9D43
C - - - - - 0x001D24 00:9D14: A0 00     LDY #$00
C - - - - - 0x001D26 00:9D16: A5 77     LDA ram_0077
C - - - - - 0x001D28 00:9D18: F0 21     BEQ bra_9D3B
C - - - - - 0x001D2A 00:9D1A: A5 73     LDA ram_0073
C - - - - - 0x001D2C 00:9D1C: 69 01     ADC #$01
C - - - - - 0x001D2E 00:9D1E: C9 1E     CMP #$1E
C - - - - - 0x001D30 00:9D20: 90 04     BCC bra_9D26
C - - - - - 0x001D32 00:9D22: E6 74     INC ram_0074_конфиг_уровня
C - - - - - 0x001D34 00:9D24: A9 00     LDA #$00
bra_9D26:
C - - - - - 0x001D36 00:9D26: 85 73     STA ram_0073
C - - - - - 0x001D38 00:9D28: A0 00     LDY #$00
C - - - - - 0x001D3A 00:9D2A: A5 74     LDA ram_0074_конфиг_уровня
C - - - - - 0x001D3C 00:9D2C: 18        CLC
C - - - - - 0x001D3D 00:9D2D: 69 02     ADC #$02
C - - - - - 0x001D3F 00:9D2F: C5 88     CMP ram_0088_строки_данных_уровня
C - - - - - 0x001D41 00:9D31: D0 08     BNE bra_9D3B
C - - - - - 0x001D43 00:9D33: A5 73     LDA ram_0073
C - - - - - 0x001D45 00:9D35: C9 1C     CMP #$1C
C - - - - - 0x001D47 00:9D37: 90 02     BCC bra_9D3B
- - - - - - 0x001D49 00:9D39: A0 40     LDY #$40
bra_9D3B:
C - - - - - 0x001D4B 00:9D3B: 20 45 9D  JSR sub_9D45
C - - - - - 0x001D4E 00:9D3E: A0 01     LDY #$01
C - - - - - 0x001D50 00:9D40: 4C 8D 9D  JMP loc_9D8D
bra_9D43:
C - - - - - 0x001D53 00:9D43: A0 00     LDY #$00
sub_9D45:
C - - - - - 0x001D55 00:9D45: 98        TYA
C - - - - - 0x001D56 00:9D46: 05 7D     ORA ram_007D_тип_скролла
C - - - - - 0x001D58 00:9D48: 85 71     STA ram_0071_тип_скролла
C - - - - - 0x001D5A 00:9D4A: 60        RTS
bra_9D4B:
C - - - - - 0x001D5B 00:9D4B: 18        CLC
C - - - - - 0x001D5C 00:9D4C: 65 FC     ADC ram_scroll_Y
C - - - - - 0x001D5E 00:9D4E: 85 FC     STA ram_scroll_Y
C - - - - - 0x001D60 00:9D50: 90 04     BCC bra_9D56
C - - - - - 0x001D62 00:9D52: C9 F0     CMP #$F0
C - - - - - 0x001D64 00:9D54: 90 07     BCC bra_9D5D
bra_9D56:
C - - - - - 0x001D66 00:9D56: 38        SEC
C - - - - - 0x001D67 00:9D57: E9 10     SBC #$10
C - - - - - 0x001D69 00:9D59: 85 FC     STA ram_scroll_Y
C - - - - - 0x001D6B 00:9D5B: C6 82     DEC ram_0082_конфиг_уровня
bra_9D5D:
C - - - - - 0x001D6D 00:9D5D: A5 00     LDA ram_0000
C - - - - - 0x001D6F 00:9D5F: C9 07     CMP #$07
C - - - - - 0x001D71 00:9D61: 90 E0     BCC bra_9D43
C - - - - - 0x001D73 00:9D63: A5 FC     LDA ram_scroll_Y
C - - - - - 0x001D75 00:9D65: 29 0F     AND #$0F
C - - - - - 0x001D77 00:9D67: C9 07     CMP #$07
C - - - - - 0x001D79 00:9D69: B0 D8     BCS bra_9D43
C - - - - - 0x001D7B 00:9D6B: A0 00     LDY #$00
C - - - - - 0x001D7D 00:9D6D: A5 77     LDA ram_0077
C - - - - - 0x001D7F 00:9D6F: D0 17     BNE bra_9D88
C - - - - - 0x001D81 00:9D71: A5 73     LDA ram_0073
C - - - - - 0x001D83 00:9D73: 38        SEC
C - - - - - 0x001D84 00:9D74: E9 02     SBC #$02
C - - - - - 0x001D86 00:9D76: 10 04     BPL bra_9D7C
C - - - - - 0x001D88 00:9D78: A9 1C     LDA #$1C
C - - - - - 0x001D8A 00:9D7A: C6 74     DEC ram_0074_конфиг_уровня
bra_9D7C:
C - - - - - 0x001D8C 00:9D7C: 85 73     STA ram_0073
C - - - - - 0x001D8E 00:9D7E: A0 00     LDY #$00
C - - - - - 0x001D90 00:9D80: A5 74     LDA ram_0074_конфиг_уровня
C - - - - - 0x001D92 00:9D82: 05 73     ORA ram_0073
C - - - - - 0x001D94 00:9D84: D0 02     BNE bra_9D88
C - - - - - 0x001D96 00:9D86: A0 80     LDY #$80
bra_9D88:
C - - - - - 0x001D98 00:9D88: 20 45 9D  JSR sub_9D45
C - - - - - 0x001D9B 00:9D8B: A0 00     LDY #$00
loc_9D8D:
C D 0 - - - 0x001D9D 00:9D8D: 84 77     STY ram_0077
C - - - - - 0x001D9F 00:9D8F: A9 01     LDA #$01
C - - - - - 0x001DA1 00:9D91: 85 70     STA ram_0070
C - - - - - 0x001DA3 00:9D93: 60        RTS



.out .sprintf("Free bytes in bank 24: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_24b"
    .byte con_prg_bank + $25   ; 
