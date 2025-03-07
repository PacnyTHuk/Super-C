.segment "BANK_20"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x000010-0x00400F

.export sub_0x00189E_отрисовка_экранов
.export sub_0x00178C_отрисовка_текста_через_буфер_0300x

; bzk this byte must be placed at 8000
    .byte con_prg_bank + $20   ; 


sub_0x00189E_отрисовка_экранов:
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
                                        .word $0400 ; X06 options

tbl_координаты_для_ppu:
                                        .dbyt $2000 ; X00 главный экран
                                        .dbyt $2000 ; X02 заставка
                                        .dbyt $2000 ; X04 options
                                        .dbyt $2000 ; X06 options

tbl_координаты_таблицы_экрана:
- D 0 - - - 0x001917 00:9907: 35 99     .word _off010_9935_x00_главный_экран
- D 0 - - - 0x001919 00:9909: B3 9A     .word _off010_9AB3_x02_заставка
- D 0 - - - 0x00191B 00:990B: BA 9A     .word _off010_9ABA_x04_options
- D 0 - - - 0x00191B 00:99C2: BA 9C     .word _off010_9AC2_x06_secret_options


_off010_9935_x00_главный_экран:
    .incbin "screens/00.bin"

_off010_9AB3_x02_заставка:
    .incbin "screens/02.bin"

_off010_9ABA_x04_options:
    .incbin "screens/04.bin"

_off010_9AC2_x06_secret_options:
    .incbin "screens/06.bin"


sub_0x00178C_отрисовка_текста_через_буфер_0300x:
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
                                        .word _off009_98A0_0B_music_on
                                        .word _off009_98B0_0C_music_off
                                        .word _off009_98C0_0D_sound_on
                                        .word _off009_98D0_0E_sound_off
                                        .word _off009_98E0_0F_infinite_ammo_off
                                        .word _off009_98F0_10_infinite_ammo_on   
                                        .word _off009_9900_11_continue
                                        .word _off009_9910_12_level
                                        .word _off009_9920_13_rest
                                        .word _off009_9930_14_exit



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
                                        
                                        
_off009_98A0_0B_music_on:
                                        .dbyt $2195 ; ppu address
                                        .byte $99, $98, $80  ; "ON "
                                        .byte $FE   ; end token


_off009_98B0_0C_music_off:
                                        .dbyt $2195 ; ppu address
                                        .byte $99, $90, $90  ; "OFF"
                                        .byte $FE   ; end token

_off009_98C0_0D_sound_on:
                                        .dbyt $21D5 ; ppu address
                                        .byte $99, $98, $80  ; "ON "
                                        .byte $FE   ; end token


_off009_98D0_0E_sound_off:
                                        .dbyt $21D5 ; ppu address
                                        .byte $99, $90, $90  ; "OFF"
                                        .byte $FE   ; end token


_off009_98E0_0F_infinite_ammo_off:
                                        .dbyt $20D5 ; ppu address
                                        .byte $99, $90, $90  ; "OFF"
                                        .byte $FE   ; end token


_off009_98F0_10_infinite_ammo_on:
                                        .dbyt $20D5 ; ppu address
                                        .byte $99, $98, $80  ; "ON "
                                        .byte $FE   ; end token                          


_off009_9900_11_continue:
                                        .dbyt $2115 ; ppu address
                                        .byte $80  ; "empty"
                                        .byte $FE   ; end token


_off009_9910_12_level:
                                        .dbyt $2155 ; ppu address
                                        .byte $80  ; "empty"
                                        .byte $FE   ; end token


_off009_9920_13_rest:
                                        .dbyt $2195 ; ppu address
                                        .byte $80  ; "empty"
                                        .byte $FE   ; end token


_off009_9930_14_exit:

                                        .dbyt $224E ; ppu address
                                        .byte $8F, $A2, $93, $9E   ; "EXIT"
                                        .byte $FE   ; end token





.out .sprintf("Free bytes in bank 20: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_20b"
    .byte con_prg_bank + $21   ; 
