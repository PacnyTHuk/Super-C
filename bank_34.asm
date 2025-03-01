.segment "BANK_34"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000 ; for listing file
; 0x028010-0x02C00F

.export sub_0x009158_спавн_объектов_из_данных_уровня
.export _off004_0x009FC8_00_area_1
.export _off005_0x00A002_00_area_1
.export _off006_0x00A4E8_00_area_1
.export _off007_0x00B428_00_area_1



; bzk this byte must be placed at 8000
    .byte con_prg_bank + $34   ; 




sub_911E:
C - - - - - 0x00912E 02:911E: 84 02     STY ram_0002
C - - - - - 0x009130 02:9120: A5 FD     LDA ram_scroll_X
C - - - - - 0x009132 02:9122: 4A        LSR
C - - - - - 0x009133 02:9123: 4A        LSR
C - - - - - 0x009134 02:9124: 4A        LSR
C - - - - - 0x009135 02:9125: 4A        LSR
C - - - - - 0x009136 02:9126: 85 00     STA ram_0000
C - - - - - 0x009138 02:9128: A0 00     LDY #$00
C - - - - - 0x00913A 02:912A: A5 FC     LDA ram_scroll_Y
C - - - - - 0x00913C 02:912C: 29 F0     AND #$F0
C - - - - - 0x00913E 02:912E: 85 01     STA ram_0001
C - - - - - 0x009140 02:9130: D0 02     BNE bra_9134
C - - - - - 0x009142 02:9132: A4 02     LDY ram_0002
bra_9134:
C - - - - - 0x009144 02:9134: 84 02     STY ram_0002
C - - - - - 0x009146 02:9136: A9 00     LDA #$00
C - - - - - 0x009148 02:9138: A4 82     LDY ram_0082_конфиг_уровня
C - - - - - 0x00914A 02:913A: F0 06     BEQ bra_9142
bra_913C_loop:
C - - - - - 0x00914C 02:913C: 18        CLC
C - - - - - 0x00914D 02:913D: 65 89     ADC ram_0089_столбцы_данных_уровня
C - - - - - 0x00914F 02:913F: 88        DEY
C - - - - - 0x009150 02:9140: D0 FA     BNE bra_913C_loop
bra_9142:
C - - - - - 0x009152 02:9142: 18        CLC
C - - - - - 0x009153 02:9143: 65 63     ADC ram_0063
C - - - - - 0x009155 02:9145: 85 03     STA ram_0003
bra_9147_RTS:
C - - - - - 0x009157 02:9147: 60        RTS



sub_0x009158_спавн_объектов_из_данных_уровня:
C D 0 - - - 0x009158 02:9148: A5 5C     LDA ram_статус_завершения_уровня
C - - - - - 0x00915A 02:914A: D0 FB     BNE bra_9147_RTS
C - - - - - 0x00915C 02:914C: A5 61     LDA ram_0061_конфиг_уровня
C - - - - - 0x00915E 02:914E: D0 03     BNE bra_9153
C - - - - - 0x009160 02:9150: 20 D5 91  JSR sub_91D5
bra_9153:
C - - - - - 0x009163 02:9153: A5 71     LDA ram_0071_тип_скролла
C - - - - - 0x009165 02:9155: C9 C0     CMP #$C0
C - - - - - 0x009167 02:9157: F0 EE     BEQ bra_9147_RTS
C - - - - - 0x009169 02:9159: A0 00     LDY #$00
C - - - - - 0x00916B 02:915B: 20 1E 91  JSR sub_911E
C - - - - - 0x00916E 02:915E: A5 72     LDA ram_скорость_камеры_Y
C - - - - - 0x009170 02:9160: F0 E5     BEQ bra_9147_RTS
C - - - - - 0x009172 02:9162: 0A        ASL
C - - - - - 0x009173 02:9163: A9 07     LDA #$07
C - - - - - 0x009175 02:9165: B0 02     BCS bra_9169
C - - - - - 0x009177 02:9167: A9 0A     LDA #$0A
bra_9169:
C - - - - - 0x009179 02:9169: 85 04     STA ram_0004
C - - - - - 0x00917B 02:916B: A5 FC     LDA ram_scroll_Y
C - - - - - 0x00917D 02:916D: 29 0F     AND #$0F
C - - - - - 0x00917F 02:916F: C5 04     CMP ram_0004
C - - - - - 0x009181 02:9171: 6A        ROR
C - - - - - 0x009182 02:9172: 45 72     EOR ram_скорость_камеры_Y
C - - - - - 0x009184 02:9174: 10 D1     BPL bra_9147_RTS
C - - - - - 0x009186 02:9176: A5 01     LDA ram_0001
C - - - - - 0x009188 02:9178: C5 8B     CMP ram_008B
C - - - - - 0x00918A 02:917A: F0 CB     BEQ bra_9147_RTS
C - - - - - 0x00918C 02:917C: 85 8B     STA ram_008B
C - - - - - 0x00918E 02:917E: A5 72     LDA ram_скорость_камеры_Y
C - - - - - 0x009190 02:9180: 30 18     BMI bra_919A
C - - - - - 0x009192 02:9182: A9 E0     LDA #$E0
C - - - - - 0x009194 02:9184: 18        CLC
C - - - - - 0x009195 02:9185: 65 01     ADC ram_0001
C - - - - - 0x009197 02:9187: B0 04     BCS bra_918D
C - - - - - 0x009199 02:9189: C9 F0     CMP #$F0
C - - - - - 0x00919B 02:918B: 90 0B     BCC bra_9198
bra_918D:
C - - - - - 0x00919D 02:918D: 69 0F     ADC #$0F
C - - - - - 0x00919F 02:918F: A8        TAY
C - - - - - 0x0091A0 02:9190: A5 03     LDA ram_0003
C - - - - - 0x0091A2 02:9192: 18        CLC
C - - - - - 0x0091A3 02:9193: 65 89     ADC ram_0089_столбцы_данных_уровня
C - - - - - 0x0091A5 02:9195: 85 03     STA ram_0003
C - - - - - 0x0091A7 02:9197: 98        TYA
bra_9198:
C - - - - - 0x0091A8 02:9198: 85 01     STA ram_0001
bra_919A:
loc_919A_loop:
C D 0 - - - 0x0091AA 02:919A: 20 29 92  JSR sub_9229_спавн_объектов
C - - - - - 0x0091AD 02:919D: A0 00     LDY #$00
bra_919F_loop:
C - - - - - 0x0091AF 02:919F: B1 0A     LDA (ram_000A),Y
C - - - - - 0x0091B1 02:91A1: C9 FF     CMP #$FF
C - - - - - 0x0091B3 02:91A3: F0 25     BEQ bra_91CA_FF
C - - - - - 0x0091B5 02:91A5: 29 F0     AND #$F0
C - - - - - 0x0091B7 02:91A7: C5 01     CMP ram_0001
C - - - - - 0x0091B9 02:91A9: F0 04     BEQ bra_91AF
C - - - - - 0x0091BB 02:91AB: B0 18     BCS bra_91C5
C - - - - - 0x0091BD 02:91AD: D0 11     BNE bra_91C0    ; jmp
bra_91AF:
C - - - - - 0x0091BF 02:91AF: B1 0A     LDA (ram_000A),Y
C - - - - - 0x0091C1 02:91B1: 29 0F     AND #$0F
C - - - - - 0x0091C3 02:91B3: C5 00     CMP ram_0000
C - - - - - 0x0091C5 02:91B5: 2A        ROL
C - - - - - 0x0091C6 02:91B6: 45 02     EOR ram_0002
C - - - - - 0x0091C8 02:91B8: 4A        LSR
C - - - - - 0x0091C9 02:91B9: 90 05     BCC bra_91C0
C - - - - - 0x0091CB 02:91BB: 20 57 92  JSR sub_9257
C - - - - - 0x0091CE 02:91BE: B0 DF     BCS bra_919F_loop
bra_91C0:
C - - - - - 0x0091D0 02:91C0: C8        INY
C - - - - - 0x0091D1 02:91C1: C8        INY
C - - - - - 0x0091D2 02:91C2: C8        INY
C - - - - - 0x0091D3 02:91C3: D0 DA     BNE bra_919F_loop    ; jmp?
bra_91C5:
C - - - - - 0x0091D5 02:91C5: A5 02     LDA ram_0002
C - - - - - 0x0091D7 02:91C7: F0 01     BEQ bra_91CA
bra_91C9_RTS:
C - - - - - 0x0091D9 02:91C9: 60        RTS
bra_91CA:
bra_91CA_FF:
C - - - - - 0x0091DA 02:91CA: A5 02     LDA ram_0002
C - - - - - 0x0091DC 02:91CC: D0 FB     BNE bra_91C9_RTS
C - - - - - 0x0091DE 02:91CE: E6 02     INC ram_0002
C - - - - - 0x0091E0 02:91D0: E6 03     INC ram_0003
C - - - - - 0x0091E2 02:91D2: 4C 9A 91  JMP loc_919A_loop



sub_91D5:
C - - - - - 0x0091E5 02:91D5: A5 85     LDA ram_0085_for_2006
C - - - - - 0x0091E7 02:91D7: D0 F0     BNE bra_91C9_RTS
C - - - - - 0x0091E9 02:91D9: A0 02     LDY #$02
C - - - - - 0x0091EB 02:91DB: 20 1E 91  JSR sub_911E
C - - - - - 0x0091EE 02:91DE: A5 FD     LDA ram_scroll_X
C - - - - - 0x0091F0 02:91E0: 29 08     AND #$08
C - - - - - 0x0091F2 02:91E2: C5 8A     CMP ram_008A
C - - - - - 0x0091F4 02:91E4: F0 E3     BEQ bra_91C9_RTS
C - - - - - 0x0091F6 02:91E6: 85 8A     STA ram_008A
C - - - - - 0x0091F8 02:91E8: 29 08     AND #$08
C - - - - - 0x0091FA 02:91EA: F0 DD     BEQ bra_91C9_RTS
C - - - - - 0x0091FC 02:91EC: E6 03     INC ram_0003
loc_91EE_loop:
C D 0 - - - 0x0091FE 02:91EE: 20 29 92  JSR sub_9229_спавн_объектов
C - - - - - 0x009201 02:91F1: A0 00     LDY #$00
loc_91F3_loop:
bra_91F3_loop:
C D 0 - - - 0x009203 02:91F3: B1 0A     LDA (ram_000A),Y
C - - - - - 0x009205 02:91F5: C9 FF     CMP #$FF
C - - - - - 0x009207 02:91F7: F0 20     BEQ bra_9219
C - - - - - 0x009209 02:91F9: C5 01     CMP ram_0001
C - - - - - 0x00920B 02:91FB: 2A        ROL
C - - - - - 0x00920C 02:91FC: 45 02     EOR ram_0002
C - - - - - 0x00920E 02:91FE: 4A        LSR
C - - - - - 0x00920F 02:91FF: 90 13     BCC bra_9214
C - - - - - 0x009211 02:9201: B1 0A     LDA (ram_000A),Y
C - - - - - 0x009213 02:9203: 29 0F     AND #$0F
C - - - - - 0x009215 02:9205: C5 00     CMP ram_0000
C - - - - - 0x009217 02:9207: D0 06     BNE bra_920F
C - - - - - 0x009219 02:9209: 20 57 92  JSR sub_9257
C - - - - - 0x00921C 02:920C: 4C F3 91  JMP loc_91F3_loop
bra_920F:
C - - - - - 0x00921F 02:920F: C8        INY
C - - - - - 0x009220 02:9210: C8        INY
C - - - - - 0x009221 02:9211: C8        INY
C - - - - - 0x009222 02:9212: D0 DF     BNE bra_91F3_loop    ; jmp?
bra_9214:
C - - - - - 0x009224 02:9214: A5 02     LDA ram_0002
C - - - - - 0x009226 02:9216: F0 F7     BEQ bra_920F
bra_9218_RTS:
C - - - - - 0x009228 02:9218: 60        RTS
bra_9219:
C - - - - - 0x009229 02:9219: A5 02     LDA ram_0002
C - - - - - 0x00922B 02:921B: D0 FB     BNE bra_9218_RTS
C - - - - - 0x00922D 02:921D: E6 02     INC ram_0002
C - - - - - 0x00922F 02:921F: A5 03     LDA ram_0003
C - - - - - 0x009231 02:9221: 18        CLC
C - - - - - 0x009232 02:9222: 65 89     ADC ram_0089_столбцы_данных_уровня
C - - - - - 0x009234 02:9224: 85 03     STA ram_0003
C - - - - - 0x009236 02:9226: 4C EE 91  JMP loc_91EE_loop



sub_9229_спавн_объектов:
C - - - - - 0x009239 02:9229: A5 50     LDA ram_номер_уровня
C - - - - - 0x00923B 02:922B: 0A        ASL
C - - - - - 0x00923C 02:922C: A8        TAY
C - - - - - 0x00923D 02:922D: B9 D4 F2  LDA tbl_F2D4_area_objects_spawner,Y
C - - - - - 0x009240 02:9230: 85 08     STA ram_0008
C - - - - - 0x009242 02:9232: B9 D5 F2  LDA tbl_F2D4_area_objects_spawner + $01,Y
C - - - - - 0x009245 02:9235: 85 09     STA ram_0009
C - - - - - 0x009247 02:9237: A9 00     LDA #$00
C - - - - - 0x009249 02:9239: 85 0A     STA ram_000A
; bzk optimize, max possible index in 0003 is 5A, no need for 16-bit multiplication
C - - - - - 0x00924B 02:923B: A5 03     LDA ram_0003
C - - - - - 0x00924D 02:923D: 0A        ASL
C - - - - - 0x00924E 02:923E: 26 0A     ROL ram_000A
C - - - - - 0x009250 02:9240: 18        CLC
C - - - - - 0x009251 02:9241: 65 08     ADC ram_0008
C - - - - - 0x009253 02:9243: 85 08     STA ram_0008
C - - - - - 0x009255 02:9245: A5 0A     LDA ram_000A
C - - - - - 0x009257 02:9247: 65 09     ADC ram_0009
C - - - - - 0x009259 02:9249: 85 09     STA ram_0009
C - - - - - 0x00925B 02:924B: A0 00     LDY #$00
C - - - - - 0x00925D 02:924D: B1 08     LDA (ram_0008),Y
C - - - - - 0x00925F 02:924F: 85 0A     STA ram_000A
C - - - - - 0x009261 02:9251: C8        INY
C - - - - - 0x009262 02:9252: B1 08     LDA (ram_0008),Y
C - - - - - 0x009264 02:9254: 85 0B     STA ram_000B
C - - - - - 0x009266 02:9256: 60        RTS



sub_9257:
C - - - - - 0x009267 02:9257: B1 0A     LDA (ram_000A),Y
C - - - - - 0x009269 02:9259: 85 0C     STA ram_000C    ; object position
C - - - - - 0x00926B 02:925B: C8        INY
C - - - - - 0x00926C 02:925C: B1 0A     LDA (ram_000A),Y
C - - - - - 0x00926E 02:925E: 85 0D     STA ram_000D    ; object flags
C - - - - - 0x009270 02:9260: C8        INY
C - - - - - 0x009271 02:9261: B1 0A     LDA (ram_000A),Y
C - - - - - 0x009273 02:9263: 85 08     STA ram_0008    ; object id
C - - - - - 0x009275 02:9265: C8        INY
C - - - - - 0x009276 02:9266: 84 07     STY ram_0007
C - - - - - 0x009278 02:9268: 20 FD F6  JSR sub_0x01F70D_попытка_создать_объект
C - - - - - 0x00927B 02:926B: F0 12     BEQ bra_927F_place_object
; если свободных слотов не найдено
C - - - - - 0x00927D 02:926D: A5 0D     LDA ram_000D    ; object flags
C - - - - - 0x00927F 02:926F: 10 3D     BPL bra_92AE_failed_to_place_object
; если разрешено перезаписать вражескую пулю данным объектом
C - - - - - 0x009281 02:9271: 20 1C F7  JSR sub_0x01F72C_поиск_вражеской_пули_в_слотах_объектов
C - - - - - 0x009284 02:9274: F0 09     BEQ bra_927F_place_object
; если вражеских пуль в слотах не найдено
C - - - - - 0x009286 02:9276: 24 0D     BIT ram_000D    ; object flags
C - - - - - 0x009288 02:9278: 50 34     BVC bra_92AE_failed_to_place_object
; если разрешено принудительно создать данный объект
- - - - - - 0x00928A 02:927A: A2 00     LDX #$00
- - - - - - 0x00928C 02:927C: 20 3F F7  JSR sub_0x01F74F_начать_создание_нового_объекта
bra_927F_place_object:
C - - - - - 0x00928F 02:927F: A5 0D     LDA ram_000D    ; object flags
C - - - - - 0x009291 02:9281: 29 7F     AND #$7F
C - - - - - 0x009293 02:9283: 9D 1E 07  STA ram_флаги_объектов,X
C - - - - - 0x009296 02:9286: A4 08     LDY ram_0008    ; object id
C - - - - - 0x009298 02:9288: 20 9E F7  JSR sub_0x01F7AE_записать_ID_объекта_и_его_хитбокс
C - - - - - 0x00929B 02:928B: A4 07     LDY ram_0007
C - - - - - 0x00929D 02:928D: A5 0C     LDA ram_000C    ; object position
C - - - - - 0x00929F 02:928F: 0A        ASL
C - - - - - 0x0092A0 02:9290: 0A        ASL
C - - - - - 0x0092A1 02:9291: 0A        ASL
C - - - - - 0x0092A2 02:9292: 0A        ASL
C - - - - - 0x0092A3 02:9293: 38        SEC
C - - - - - 0x0092A4 02:9294: E5 FD     SBC ram_scroll_X
C - - - - - 0x0092A6 02:9296: 18        CLC
C - - - - - 0x0092A7 02:9297: 69 08     ADC #$07
C - - - - - 0x0092A9 02:9299: 9D 3C 05  STA ram_позиция_x_спрайта_объекта_или_пули,X
C - - - - - 0x0092AC 02:929C: A5 0C     LDA ram_000C    ; object position
C - - - - - 0x0092AE 02:929E: 29 F0     AND #$F0
C - - - - - 0x0092B0 02:92A0: 09 08     ORA #$08
C - - - - - 0x0092B2 02:92A2: 38        SEC
C - - - - - 0x0092B3 02:92A3: E5 FC     SBC ram_scroll_Y
C - - - - - 0x0092B5 02:92A5: B0 02     BCS bra_92A9
C - - - - - 0x0092B7 02:92A7: E9 0F     SBC #$0F
bra_92A9:
C - - - - - 0x0092B9 02:92A9: 9D 22 05  STA ram_позиция_y_спрайта_объекта_или_пули,X
C - - - - - 0x0092BC 02:92AC: 38        SEC
C - - - - - 0x0092BD 02:92AD: 60        RTS
bra_92AE_failed_to_place_object:
C - - - - - 0x0092BE 02:92AE: 18        CLC
C - - - - - 0x0092BF 02:92AF: 60        RTS

tbl_F2D4_area_objects_spawner:
- D 3 - - - 0x01F2E4 07:F2D4: C9 92     .word _off013_92C9_00_area_1
- D 3 - - - 0x01F2E6 07:F2D6: DD 93     .word _off013_93DD_01_area_2
- D 3 - - - 0x01F2E8 07:F2D8: 83 94     .word _off013_9483_02_area_3
- D 3 - - - 0x01F2EA 07:F2DA: 5B 95     .word _off013_955B_03_area_4
- D 3 - - - 0x01F2EC 07:F2DC: 6E 97     .word _off013_976E_04_area_5
- D 3 - - - 0x01F2EE 07:F2DE: 82 98     .word _off013_9882_05_area_6
- D 3 - - - 0x01F2F0 07:F2E0: 25 99     .word _off013_9925_06_area_7
- D 3 - - - 0x01F2F2 07:F2E2: B9 99     .word _off013_99B9_07_area_8



_off013_92C9_00_area_1:
- - - - - - 0x0092D9 02:92C9: 39 93     .word _off019_00_FF ; 00
- - - - - - 0x0092DB 02:92CB: 3A 93     .word _off019_00_FF ; 01
- - - - - - 0x0092DD 02:92CD: 3B 93     .word _off019_00_FF ; 02
- - - - - - 0x0092DF 02:92CF: 3C 93     .word _off019_00_FF ; 03
- - - - - - 0x0092E1 02:92D1: 3D 93     .word _off019_00_FF ; 04
- - - - - - 0x0092E3 02:92D3: 3E 93     .word _off019_00_FF ; 05
- - - - - - 0x0092E5 02:92D5: 3F 93     .word _off019_00_FF ; 06
- - - - - - 0x0092E7 02:92D7: 40 93     .word _off019_00_FF ; 07
- - - - - - 0x0092E9 02:92D9: 41 93     .word _off019_00_FF ; 08
- - - - - - 0x0092EB 02:92DB: 42 93     .word _off019_00_FF ; 09
- D 0 - I - 0x0092ED 02:92DD: 43 93     .word _off019_00_FF ; 0A
- D 0 - I - 0x0092EF 02:92DF: 44 93     .word _off019_00_FF ; 0B
- D 0 - I - 0x0092F1 02:92E1: 45 93     .word _off019_00_FF ; 0C
- - - - - - 0x0092F3 02:92E3: 46 93     .word _off019_00_FF ; 0D
- - - - - - 0x0092F5 02:92E5: 47 93     .word _off019_00_FF ; 0E
- - - - - - 0x0092F7 02:92E7: 48 93     .word _off019_00_FF ; 0F
- - - - - - 0x0092F9 02:92E9: 49 93     .word _off019_00_FF ; 10
- - - - - - 0x0092FB 02:92EB: 4A 93     .word _off019_00_FF ; 11
- - - - - - 0x0092FD 02:92ED: 4B 93     .word _off019_00_FF ; 12
- D 0 - I - 0x0092FF 02:92EF: 4C 93     .word _off019_00_FF ; 13
- D 0 - I - 0x009301 02:92F1: 4D 93     .word _off019_00_FF ; 14
- D 0 - I - 0x009303 02:92F3: 4E 93     .word _off019_00_FF ; 15
- D 0 - I - 0x009305 02:92F5: 4F 93     .word _off019_00_934F_16
- D 0 - I - 0x009307 02:92F7: 53 93     .word _off019_00_9353_17
- D 0 - I - 0x009309 02:92F9: 60 93     .word _off019_00_9360_18
- D 0 - I - 0x00930B 02:92FB: 64 93     .word _off019_00_9364_19
- D 0 - I - 0x00930D 02:92FD: 6B 93     .word _off019_00_936B_1A
- - - - - - 0x00930F 02:92FF: 72 93     .word _off019_00_FF ; 1B
- D 0 - I - 0x009311 02:9301: 73 93     .word _off019_00_FF ; 1C
- D 0 - I - 0x009313 02:9303: 74 93     .word _off019_00_FF ; 1D
- D 0 - I - 0x009315 02:9305: 75 93     .word _off019_00_FF ; 1E
- D 0 - I - 0x009317 02:9307: 76 93     .word _off019_00_FF ; 1F
- D 0 - I - 0x009319 02:9309: 77 93     .word _off019_00_9377_20
- D 0 - I - 0x00931B 02:930B: 7E 93     .word _off019_00_937E_21
- D 0 - I - 0x00931D 02:930D: 82 93     .word _off019_00_9382_22
- D 0 - I - 0x00931F 02:930F: 89 93     .word _off019_00_9389_23
- D 0 - I - 0x009321 02:9311: 93 93     .word _off019_00_9393_24
- D 0 - I - 0x009323 02:9313: 97 93     .word _off019_00_9397_25
- D 0 - I - 0x009325 02:9315: 9B 93     .word _off019_00_939B_26
- D 0 - I - 0x009327 02:9317: 9F 93     .word _off019_00_FF ; 27
- - - - - - 0x009329 02:9319: A0 93     .word _off019_00_FF ; 28
- - - - - - 0x00932B 02:931B: A1 93     .word _off019_00_FF ; 29
- D 0 - I - 0x00932D 02:931D: A2 93     .word _off019_00_FF ; 2A
- D 0 - I - 0x00932F 02:931F: A3 93     .word _off019_00_93A3_2B
- D 0 - I - 0x009331 02:9321: BF 93     .word _off019_00_93BF_2C
- D 0 - I - 0x009333 02:9323: C9 93     .word _off019_00_93C9_2D
- D 0 - I - 0x009335 02:9325: D0 93     .word _off019_00_FF ; 2E
- D 0 - I - 0x009337 02:9327: D1 93     .word _off019_00_93D1_2F
- D 0 - I - 0x009339 02:9329: D5 93     .word _off019_00_FF ; 30
- - - - - - 0x00933B 02:932B: D6 93     .word _off019_00_FF ; 31
- - - - - - 0x00933D 02:932D: D7 93     .word _off019_00_FF ; 32
- - - - - - 0x00933F 02:932F: D8 93     .word _off019_00_FF ; 33
- - - - - - 0x009341 02:9331: D9 93     .word _off019_00_FF ; 34
- - - - - - 0x009343 02:9333: DA 93     .word _off019_00_FF ; 35
- - - - - - 0x009345 02:9335: DB 93     .word _off019_00_FF ; 36
- - - - - - 0x009347 02:9337: DC 93     .word _off019_00_FF ; 37



_off019_00_FF:
; cyneprepou4uk
- - - - - - 0x009349 02:9339: FF        .byte $FF   ; end token



_off019_00_934F_16:
- D 0 - I - 0x00935F 02:934F: 8B        .byte $10 * $08 + $0B   ; pos YX
- D 0 - I - 0x009360 02:9350: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009361 02:9351: 6F        .byte con_obj_id_59   ; 

- D 0 - I - 0x009362 02:9352: FF        .byte $FF   ; end token



_off019_00_9353_17:
- D 0 - I - 0x009363 02:9353: 97        .byte $10 * $09 + $07   ; pos YX
- D 0 - I - 0x009364 02:9354: 91        .byte $80 + $00 + $11   ; flags
- D 0 - I - 0x009365 02:9355: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009366 02:9356: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009367 02:9357: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009368 02:9358: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009369 02:9359: AD        .byte $10 * $0A + $0D   ; pos YX
- D 0 - I - 0x00936A 02:935A: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00936B 02:935B: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00936C 02:935C: E6        .byte $10 * $0E + $06   ; pos YX
- D 0 - I - 0x00936D 02:935D: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x00936E 02:935E: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00936F 02:935F: FF        .byte $FF   ; end token



_off019_00_9360_18:
- D 0 - I - 0x009370 02:9360: AC        .byte $10 * $0A + $0C   ; pos YX
- D 0 - I - 0x009371 02:9361: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x009372 02:9362: 0F        .byte con_obj_id_0F   ; 

- D 0 - I - 0x009373 02:9363: FF        .byte $FF   ; end token



_off019_00_9364_19:
- D 0 - I - 0x009374 02:9364: 39        .byte $10 * $03 + $09   ; pos YX
- D 0 - I - 0x009375 02:9365: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009376 02:9366: 10        .byte con_obj_id_10   ; 

- D 0 - I - 0x009377 02:9367: 8F        .byte $10 * $08 + $0F   ; pos YX
- D 0 - I - 0x009378 02:9368: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009379 02:9369: 20        .byte con_obj_id_11   ; 

- D 0 - I - 0x00937A 02:936A: FF        .byte $FF   ; end token



_off019_00_936B_1A:
- D 0 - I - 0x00937B 02:936B: B5        .byte $10 * $0B + $05   ; pos YX
- D 0 - I - 0x00937C 02:936C: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00937D 02:936D: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00937E 02:936E: 81        .byte $10 * $08 + $01   ; pos YX
- D 0 - I - 0x00937F 02:936F: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009380 02:9370: 21        .byte con_obj_id_12   ; 

- D 0 - I - 0x009381 02:9371: FF        .byte $FF   ; end token



_off019_00_9377_20:
- D 0 - I - 0x009387 02:9377: AB        .byte $10 * $0A + $0B   ; pos YX
- D 0 - I - 0x009388 02:9378: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009389 02:9379: 10        .byte con_obj_id_10   ; 

- D 0 - I - 0x00938A 02:937A: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x00938B 02:937B: 96        .byte $80 + $00 + $16   ; flags
- D 0 - I - 0x00938C 02:937C: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00938D 02:937D: FF        .byte $FF   ; end token



_off019_00_937E_21:
- D 0 - I - 0x00938E 02:937E: 98        .byte $10 * $09 + $08   ; pos YX
- D 0 - I - 0x00938F 02:937F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009390 02:9380: 6F        .byte con_obj_id_59   ; 

- D 0 - I - 0x009391 02:9381: FF        .byte $FF   ; end token



_off019_00_9382_22:
- D 0 - I - 0x009392 02:9382: 36        .byte $10 * $03 + $06   ; pos YX
- D 0 - I - 0x009393 02:9383: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009394 02:9384: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009395 02:9385: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x009396 02:9386: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x009397 02:9387: 05        .byte con_obj_id_05   ; 

- D 0 - I - 0x009398 02:9388: FF        .byte $FF   ; end token



_off019_00_9389_23:
- D 0 - I - 0x009399 02:9389: 05        .byte $10 * $00 + $05   ; pos YX
- D 0 - I - 0x00939A 02:938A: 96        .byte $80 + $00 + $16   ; flags
- D 0 - I - 0x00939B 02:938B: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00939C 02:938C: 24        .byte $10 * $02 + $04   ; pos YX
- D 0 - I - 0x00939D 02:938D: 93        .byte $80 + $00 + $13   ; flags
- D 0 - I - 0x00939E 02:938E: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00939F 02:938F: 62        .byte $10 * $06 + $02   ; pos YX
- D 0 - I - 0x0093A0 02:9390: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0093A1 02:9391: 0F        .byte con_obj_id_0F   ; 

- D 0 - I - 0x0093A2 02:9392: FF        .byte $FF   ; end token



_off019_00_9393_24:
- D 0 - I - 0x0093A3 02:9393: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x0093A4 02:9394: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x0093A5 02:9395: 0F        .byte con_obj_id_0F   ; 

- D 0 - I - 0x0093A6 02:9396: FF        .byte $FF   ; end token



_off019_00_9397_25:
- D 0 - I - 0x0093A7 02:9397: 09        .byte $10 * $00 + $09   ; pos YX
- D 0 - I - 0x0093A8 02:9398: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0093A9 02:9399: 20        .byte con_obj_id_11   ; 

- D 0 - I - 0x0093AA 02:939A: FF        .byte $FF   ; end token



_off019_00_939B_26:
- D 0 - I - 0x0093AB 02:939B: 01        .byte $10 * $00 + $01   ; pos YX
- D 0 - I - 0x0093AC 02:939C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0093AD 02:939D: 20        .byte con_obj_id_11   ; 

- D 0 - I - 0x0093AE 02:939E: FF        .byte $FF   ; end token



_off019_00_93A3_2B:
- D 0 - I - 0x0093B3 02:93A3: 35        .byte $10 * $03 + $05   ; pos YX
- D 0 - I - 0x0093B4 02:93A4: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x0093B5 02:93A5: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0093B6 02:93A6: 4B        .byte $10 * $04 + $0B   ; pos YX
- D 0 - I - 0x0093B7 02:93A7: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0093B8 02:93A8: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0093B9 02:93A9: 93        .byte $10 * $09 + $03   ; pos YX
- D 0 - I - 0x0093BA 02:93AA: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093BB 02:93AB: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093BC 02:93AC: 95        .byte $10 * $09 + $05   ; pos YX
- D 0 - I - 0x0093BD 02:93AD: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093BE 02:93AE: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093BF 02:93AF: 95        .byte $10 * $09 + $05   ; pos YX
- D 0 - I - 0x0093C0 02:93B0: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0093C1 02:93B1: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093C2 02:93B2: 97        .byte $10 * $09 + $07   ; pos YX
- D 0 - I - 0x0093C3 02:93B3: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093C4 02:93B4: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093C5 02:93B5: 99        .byte $10 * $09 + $09   ; pos YX
- D 0 - I - 0x0093C6 02:93B6: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093C7 02:93B7: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093C8 02:93B8: 9A        .byte $10 * $09 + $0A   ; pos YX
- D 0 - I - 0x0093C9 02:93B9: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0093CA 02:93BA: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093CB 02:93BB: 9C        .byte $10 * $09 + $0C   ; pos YX
- D 0 - I - 0x0093CC 02:93BC: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0093CD 02:93BD: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0093CE 02:93BE: FF        .byte $FF   ; end token



_off019_00_93BF_2C:
- D 0 - I - 0x0093CF 02:93BF: 56        .byte $10 * $05 + $06   ; pos YX
- D 0 - I - 0x0093D0 02:93C0: 94        .byte $80 + $00 + $14   ; flags
- D 0 - I - 0x0093D1 02:93C1: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0093D2 02:93C2: 4B        .byte $10 * $04 + $0B   ; pos YX
- D 0 - I - 0x0093D3 02:93C3: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0093D4 02:93C4: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0093D5 02:93C5: 56        .byte $10 * $05 + $06   ; pos YX
- D 0 - I - 0x0093D6 02:93C6: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0093D7 02:93C7: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0093D8 02:93C8: FF        .byte $FF   ; end token



_off019_00_93C9_2D:
- D 0 - I - 0x0093D9 02:93C9: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x0093DA 02:93CA: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0093DB 02:93CB: 6F        .byte con_obj_id_59   ; 

- D 0 - I - 0x0093DC 02:93CC: 26        .byte $10 * $02 + $06   ; pos YX
- D 0 - I - 0x0093DD 02:93CD: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0093DE 02:93CE: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0093DF 02:93CF: FF        .byte $FF   ; end token



_off019_00_93D1_2F:
- D 0 - I - 0x0093E1 02:93D1: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x0093E2 02:93D2: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x0093E3 02:93D3: 07        .byte con_obj_id_07   ; 

- D 0 - I - 0x0093E4 02:93D4: FF        .byte $FF   ; end token



_off013_93DD_01_area_2:
- - - - - - 0x0093ED 02:93DD: 15 94     .word _off019_01_FF ; 00
- - - - - - 0x0093EF 02:93DF: 15 94     .word _off019_01_FF ; 01
- D 0 - I - 0x0093F1 02:93E1: 16 94     .word _off019_01_9416_02
- D 0 - I - 0x0093F3 02:93E3: 15 94     .word _off019_01_FF ; 03
- D 0 - I - 0x0093F5 02:93E5: 1A 94     .word _off019_01_941A_04
- D 0 - I - 0x0093F7 02:93E7: 15 94     .word _off019_01_FF ; 05
- D 0 - I - 0x0093F9 02:93E9: 27 94     .word _off019_01_9427_06
- D 0 - I - 0x0093FB 02:93EB: 15 94     .word _off019_01_FF ; 07
- D 0 - I - 0x0093FD 02:93ED: 34 94     .word _off019_01_9434_08
- D 0 - I - 0x0093FF 02:93EF: 15 94     .word _off019_01_FF ; 09
- D 0 - I - 0x009401 02:93F1: 3E 94     .word _off019_01_943E_0A
- D 0 - I - 0x009403 02:93F3: 15 94     .word _off019_01_FF ; 0B
- D 0 - I - 0x009405 02:93F5: 4B 94     .word _off019_01_944B_0C
- D 0 - I - 0x009407 02:93F7: 15 94     .word _off019_01_FF ; 0D
- D 0 - I - 0x009409 02:93F9: 52 94     .word _off019_01_9452_0E
- D 0 - I - 0x00940B 02:93FB: 15 94     .word _off019_01_FF ; 0F
- D 0 - I - 0x00940D 02:93FD: 62 94     .word _off019_01_9462_10
- D 0 - I - 0x00940F 02:93FF: 15 94     .word _off019_01_FF ; 11
- D 0 - I - 0x009411 02:9401: 6F 94     .word _off019_01_946F_12
- D 0 - I - 0x009413 02:9403: 15 94     .word _off019_01_FF ; 13
- D 0 - I - 0x009415 02:9405: 73 94     .word _off019_01_9473_14
- D 0 - I - 0x009417 02:9407: 15 94     .word _off019_01_FF ; 15
- D 0 - I - 0x009419 02:9409: 7A 94     .word _off019_01_947A_16
- D 0 - I - 0x00941B 02:940B: 15 94     .word _off019_01_FF ; 17
- - - - - - 0x00941D 02:940D: 81 94     .word _off019_01_FF ; 18
- - - - - - 0x00941F 02:940F: 15 94     .word _off019_01_FF ; 19
- - - - - - 0x009421 02:9411: 82 94     .word _off019_01_FF ; 1A
- - - - - - 0x009423 02:9413: 15 94     .word _off019_01_FF ; 1B



_off019_01_FF:
; cyneprepou4uk
- D 0 - I - 0x009425 02:9415: FF        .byte $FF   ; end token



_off019_01_9416_02:
- D 0 - I - 0x009426 02:9416: 40        .byte $10 * $04 + $00   ; pos YX
- D 0 - I - 0x009427 02:9417: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009428 02:9418: 69        .byte con_obj_id_53   ; 

- D 0 - I - 0x009429 02:9419: FF        .byte $FF   ; end token



_off019_01_941A_04:
- D 0 - I - 0x00942A 02:941A: 37        .byte $10 * $03 + $07   ; pos YX
- D 0 - I - 0x00942B 02:941B: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x00942C 02:941C: 0D        .byte con_obj_id_0D   ; 

- D 0 - I - 0x00942D 02:941D: 58        .byte $10 * $05 + $08   ; pos YX
- D 0 - I - 0x00942E 02:941E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00942F 02:941F: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009430 02:9420: 83        .byte $10 * $08 + $03   ; pos YX
- D 0 - I - 0x009431 02:9421: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009432 02:9422: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009433 02:9423: 8C        .byte $10 * $08 + $0C   ; pos YX
- D 0 - I - 0x009434 02:9424: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009435 02:9425: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009436 02:9426: FF        .byte $FF   ; end token



_off019_01_9427_06:
- D 0 - I - 0x009437 02:9427: 1D        .byte $10 * $01 + $0D   ; pos YX
- D 0 - I - 0x009438 02:9428: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009439 02:9429: 5B        .byte con_obj_id_46   ; 

- D 0 - I - 0x00943A 02:942A: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x00943B 02:942B: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00943C 02:942C: 5B        .byte con_obj_id_46   ; 

- D 0 - I - 0x00943D 02:942D: D5        .byte $10 * $0D + $05   ; pos YX
- D 0 - I - 0x00943E 02:942E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00943F 02:942F: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009440 02:9430: DA        .byte $10 * $0D + $0A   ; pos YX
- D 0 - I - 0x009441 02:9431: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009442 02:9432: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009443 02:9433: FF        .byte $FF   ; end token



_off019_01_9434_08:
- D 0 - I - 0x009444 02:9434: 47        .byte $10 * $04 + $07   ; pos YX
- D 0 - I - 0x009445 02:9435: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009446 02:9436: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009447 02:9437: B5        .byte $10 * $0B + $05   ; pos YX
- D 0 - I - 0x009448 02:9438: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009449 02:9439: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x00944A 02:943A: BA        .byte $10 * $0B + $0A   ; pos YX
- D 0 - I - 0x00944B 02:943B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00944C 02:943C: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x00944D 02:943D: FF        .byte $FF   ; end token



_off019_01_943E_0A:
- D 0 - I - 0x00944E 02:943E: 65        .byte $10 * $06 + $05   ; pos YX
- D 0 - I - 0x00944F 02:943F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009450 02:9440: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009451 02:9441: 6A        .byte $10 * $06 + $0A   ; pos YX
- D 0 - I - 0x009452 02:9442: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009453 02:9443: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009454 02:9444: 78        .byte $10 * $07 + $08   ; pos YX
- D 0 - I - 0x009455 02:9445: B6        .byte $80 + $00 + $36   ; flags
- D 0 - I - 0x009456 02:9446: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009457 02:9447: C1        .byte $10 * $0C + $01   ; pos YX
- D 0 - I - 0x009458 02:9448: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009459 02:9449: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x00945A 02:944A: FF        .byte $FF   ; end token



_off019_01_944B_0C:
- D 0 - I - 0x00945B 02:944B: 15        .byte $10 * $01 + $05   ; pos YX
- D 0 - I - 0x00945C 02:944C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00945D 02:944D: 5B        .byte con_obj_id_46   ; 

- D 0 - I - 0x00945E 02:944E: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x00945F 02:944F: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009460 02:9450: 5B        .byte con_obj_id_46   ; 

- D 0 - I - 0x009461 02:9451: FF        .byte $FF   ; end token



_off019_01_9452_0E:
- D 0 - I - 0x009462 02:9452: 17        .byte $10 * $01 + $07   ; pos YX
- D 0 - I - 0x009463 02:9453: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009464 02:9454: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009465 02:9455: 18        .byte $10 * $01 + $08   ; pos YX
- D 0 - I - 0x009466 02:9456: B2        .byte $80 + $00 + $32   ; flags
- D 0 - I - 0x009467 02:9457: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009468 02:9458: 38        .byte $10 * $03 + $08   ; pos YX
- D 0 - I - 0x009469 02:9459: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00946A 02:945A: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00946B 02:945B: A5        .byte $10 * $0A + $05   ; pos YX
- D 0 - I - 0x00946C 02:945C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00946D 02:945D: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x00946E 02:945E: AA        .byte $10 * $0A + $0A   ; pos YX
- D 0 - I - 0x00946F 02:945F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009470 02:9460: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009471 02:9461: FF        .byte $FF   ; end token



_off019_01_9462_10:
- D 0 - I - 0x009472 02:9462: 65        .byte $10 * $06 + $05   ; pos YX
- D 0 - I - 0x009473 02:9463: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009474 02:9464: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009475 02:9465: 6A        .byte $10 * $06 + $0A   ; pos YX
- D 0 - I - 0x009476 02:9466: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009477 02:9467: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x009478 02:9468: B3        .byte $10 * $0B + $03   ; pos YX
- D 0 - I - 0x009479 02:9469: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00947A 02:946A: 2E        .byte con_obj_id_1F   ; 

- D 0 - I - 0x00947B 02:946B: BB        .byte $10 * $0B + $0B   ; pos YX
- D 0 - I - 0x00947C 02:946C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00947D 02:946D: 2E        .byte con_obj_id_1F   ; 

- D 0 - I - 0x00947E 02:946E: FF        .byte $FF   ; end token



_off019_01_946F_12:
- D 0 - I - 0x00947F 02:946F: B7        .byte $10 * $0B + $07   ; pos YX
- D 0 - I - 0x009480 02:9470: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009481 02:9471: 2E        .byte con_obj_id_1F   ; 

- D 0 - I - 0x009482 02:9472: FF        .byte $FF   ; end token



_off019_01_9473_14:
- D 0 - I - 0x009483 02:9473: 18        .byte $10 * $01 + $08   ; pos YX
- D 0 - I - 0x009484 02:9474: B1        .byte $80 + $00 + $31   ; flags
- D 0 - I - 0x009485 02:9475: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009486 02:9476: 38        .byte $10 * $03 + $08   ; pos YX
- D 0 - I - 0x009487 02:9477: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009488 02:9478: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009489 02:9479: FF        .byte $FF   ; end token



_off019_01_947A_16:
- D 0 - I - 0x00948A 02:947A: 8D        .byte $10 * $08 + $0D   ; pos YX
- D 0 - I - 0x00948B 02:947B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00948C 02:947C: 5C        .byte con_obj_id_47   ; 

- D 0 - I - 0x00948D 02:947D: B8        .byte $10 * $0B + $08   ; pos YX
- D 0 - I - 0x00948E 02:947E: B0        .byte $80 + $00 + $30   ; flags
- D 0 - I - 0x00948F 02:947F: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009490 02:9480: FF        .byte $FF   ; end token



_off013_9483_02_area_3:
- - - - - - 0x009493 02:9483: AF 94     .word _off019_02_FF ; 00
- D 0 - I - 0x009495 02:9485: B0 94     .word _off019_02_94B0_01
- D 0 - I - 0x009497 02:9487: B7 94     .word _off019_02_94B7_02
- D 0 - I - 0x009499 02:9489: C4 94     .word _off019_02_94C4_03
- D 0 - I - 0x00949B 02:948B: D4 94     .word _off019_02_94D4_04
- D 0 - I - 0x00949D 02:948D: D8 94     .word _off019_02_94D8_05
- D 0 - I - 0x00949F 02:948F: DF 94     .word _off019_02_94DF_06
- D 0 - I - 0x0094A1 02:9491: F5 94     .word _off019_02_94F5_07
- D 0 - I - 0x0094A3 02:9493: F9 94     .word _off019_02_94F9_08
- D 0 - I - 0x0094A5 02:9495: 06 95     .word _off019_02_9506_09
- D 0 - I - 0x0094A7 02:9497: 0A 95     .word _off019_02_950A_0A
- D 0 - I - 0x0094A9 02:9499: 1D 95     .word _off019_02_951D_0B
- D 0 - I - 0x0094AB 02:949B: 27 95     .word _off019_02_9527_0C
- D 0 - I - 0x0094AD 02:949D: 3D 95     .word _off019_02_953D_0D
- D 0 - I - 0x0094AF 02:949F: 41 95     .word _off019_02_9541_0E
- D 0 - I - 0x0094B1 02:94A1: 45 95     .word _off019_02_9545_0F
- D 0 - I - 0x0094B3 02:94A3: 4C 95     .word _off019_02_FF ; 10
- D 0 - I - 0x0094B5 02:94A5: 4D 95     .word _off019_02_954D_11
- D 0 - I - 0x0094B7 02:94A7: 54 95     .word _off019_02_FF ; 12
- D 0 - I - 0x0094B9 02:94A9: 55 95     .word _off019_02_9555_13
- - - - - - 0x0094BB 02:94AB: 59 95     .word _off019_02_FF ; 14
- - - - - - 0x0094BD 02:94AD: 5A 95     .word _off019_02_FF ; 15



_off019_02_FF:
; cyneprepou4uk
- - - - - - 0x0094BF 02:94AF: FF        .byte $FF   ; end token



_off019_02_94B0_01:
- D 0 - I - 0x0094C0 02:94B0: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x0094C1 02:94B1: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0094C2 02:94B2: 26        .byte con_obj_id_17   ; 

- D 0 - I - 0x0094C3 02:94B3: B7        .byte $10 * $0B + $07   ; pos YX
- D 0 - I - 0x0094C4 02:94B4: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x0094C5 02:94B5: 27        .byte con_obj_id_18   ; 

- D 0 - I - 0x0094C6 02:94B6: FF        .byte $FF   ; end token



_off019_02_94B7_02:
- D 0 - I - 0x0094C7 02:94B7: 97        .byte $10 * $09 + $07   ; pos YX
- D 0 - I - 0x0094C8 02:94B8: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0094C9 02:94B9: 26        .byte con_obj_id_17   ; 

- D 0 - I - 0x0094CA 02:94BA: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x0094CB 02:94BB: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x0094CC 02:94BC: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094CD 02:94BD: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x0094CE 02:94BE: 96        .byte $80 + $00 + $16   ; flags
- D 0 - I - 0x0094CF 02:94BF: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0094D0 02:94C0: 8B        .byte $10 * $08 + $0B   ; pos YX
- D 0 - I - 0x0094D1 02:94C1: 94        .byte $80 + $00 + $14   ; flags
- D 0 - I - 0x0094D2 02:94C2: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0094D3 02:94C3: FF        .byte $FF   ; end token



_off019_02_94C4_03:
- D 0 - I - 0x0094D4 02:94C4: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x0094D5 02:94C5: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0094D6 02:94C6: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094D7 02:94C7: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x0094D8 02:94C8: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0094D9 02:94C9: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094DA 02:94CA: 37        .byte $10 * $03 + $07   ; pos YX
- D 0 - I - 0x0094DB 02:94CB: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x0094DC 02:94CC: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094DD 02:94CD: B3        .byte $10 * $0B + $03   ; pos YX
- D 0 - I - 0x0094DE 02:94CE: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x0094DF 02:94CF: 27        .byte con_obj_id_18   ; 

- D 0 - I - 0x0094E0 02:94D0: BB        .byte $10 * $0B + $0B   ; pos YX
- D 0 - I - 0x0094E1 02:94D1: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x0094E2 02:94D2: 27        .byte con_obj_id_18   ; 

- D 0 - I - 0x0094E3 02:94D3: FF        .byte $FF   ; end token



_off019_02_94D4_04:
- D 0 - I - 0x0094E4 02:94D4: 17        .byte $10 * $01 + $07   ; pos YX
- D 0 - I - 0x0094E5 02:94D5: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0094E6 02:94D6: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094E7 02:94D7: FF        .byte $FF   ; end token



_off019_02_94D8_05:
- D 0 - I - 0x0094E8 02:94D8: 42        .byte $10 * $04 + $02   ; pos YX
- D 0 - I - 0x0094E9 02:94D9: 10        .byte $10 + $00 + $00   ; flags
- D 0 - I - 0x0094EA 02:94DA: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0094EB 02:94DB: 8A        .byte $10 * $08 + $0A   ; pos YX
- D 0 - I - 0x0094EC 02:94DC: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0094ED 02:94DD: 28        .byte con_obj_id_19   ; 
- D 0 - I - 0x0094EE 02:94DE: FF        .byte $FF   ; end token



_off019_02_94DF_06:
- D 0 - I - 0x0094EF 02:94DF: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x0094F0 02:94E0: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0094F1 02:94E1: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094F2 02:94E2: 16        .byte $10 * $01 + $06   ; pos YX
- D 0 - I - 0x0094F3 02:94E3: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x0094F4 02:94E4: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x0094F5 02:94E5: 39        .byte $10 * $03 + $09   ; pos YX
- D 0 - I - 0x0094F6 02:94E6: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x0094F7 02:94E7: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094F8 02:94E8: 3C        .byte $10 * $03 + $0C   ; pos YX
- D 0 - I - 0x0094F9 02:94E9: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x0094FA 02:94EA: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094FB 02:94EB: 3E        .byte $10 * $03 + $0E   ; pos YX
- D 0 - I - 0x0094FC 02:94EC: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x0094FD 02:94ED: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0094FE 02:94EE: 40        .byte $10 * $04 + $00   ; pos YX
- D 0 - I - 0x0094FF 02:94EF: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x009500 02:94F0: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009501 02:94F1: A6        .byte $10 * $0A + $06   ; pos YX
- D 0 - I - 0x009502 02:94F2: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x009503 02:94F3: 07        .byte con_obj_id_07   ; 

- D 0 - I - 0x009504 02:94F4: FF        .byte $FF   ; end token



_off019_02_94F5_07:
- D 0 - I - 0x009505 02:94F5: 34        .byte $10 * $03 + $04   ; pos YX
- D 0 - I - 0x009506 02:94F6: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x009507 02:94F7: 10        .byte con_obj_id_10   ; 

- D 0 - I - 0x009508 02:94F8: FF        .byte $FF   ; end token



_off019_02_94F9_08:
- D 0 - I - 0x009509 02:94F9: 37        .byte $10 * $03 + $07   ; pos YX
- D 0 - I - 0x00950A 02:94FA: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00950B 02:94FB: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00950C 02:94FC: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x00950D 02:94FD: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00950E 02:94FE: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00950F 02:94FF: 84        .byte $10 * $08 + $04   ; pos YX
- D 0 - I - 0x009510 02:9500: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009511 02:9501: 26        .byte con_obj_id_17   ; 

- D 0 - I - 0x009512 02:9502: 8A        .byte $10 * $08 + $0A   ; pos YX
- D 0 - I - 0x009513 02:9503: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009514 02:9504: 26        .byte con_obj_id_17   ; 

- D 0 - I - 0x009515 02:9505: FF        .byte $FF   ; end token



_off019_02_9506_09:
- D 0 - I - 0x009516 02:9506: 33        .byte $10 * $03 + $03   ; pos YX
- D 0 - I - 0x009517 02:9507: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x009518 02:9508: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009519 02:9509: FF        .byte $FF   ; end token



_off019_02_950A_0A:
- D 0 - I - 0x00951A 02:950A: 17        .byte $10 * $01 + $07   ; pos YX
- D 0 - I - 0x00951B 02:950B: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00951C 02:950C: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00951D 02:950D: 17        .byte $10 * $01 + $07   ; pos YX
- D 0 - I - 0x00951E 02:950E: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00951F 02:950F: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009520 02:9510: 19        .byte $10 * $01 + $09   ; pos YX
- D 0 - I - 0x009521 02:9511: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009522 02:9512: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009523 02:9513: 19        .byte $10 * $01 + $09   ; pos YX
- D 0 - I - 0x009524 02:9514: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009525 02:9515: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009526 02:9516: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x009527 02:9517: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009528 02:9518: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009529 02:9519: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x00952A 02:951A: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00952B 02:951B: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00952C 02:951C: FF        .byte $FF   ; end token



_off019_02_951D_0B:
- D 0 - I - 0x00952D 02:951D: 33        .byte $10 * $03 + $03   ; pos YX
- D 0 - I - 0x00952E 02:951E: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00952F 02:951F: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009530 02:9520: 3B        .byte $10 * $03 + $0B   ; pos YX
- D 0 - I - 0x009531 02:9521: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x009532 02:9522: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009533 02:9523: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009534 02:9524: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x009535 02:9525: 07        .byte con_obj_id_07   ; 

- D 0 - I - 0x009536 02:9526: FF        .byte $FF   ; end token



_off019_02_9527_0C:
- D 0 - I - 0x009537 02:9527: 12        .byte $10 * $01 + $02   ; pos YX
- D 0 - I - 0x009538 02:9528: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009539 02:9529: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00953A 02:952A: 12        .byte $10 * $01 + $02   ; pos YX
- D 0 - I - 0x00953B 02:952B: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00953C 02:952C: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00953D 02:952D: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x00953E 02:952E: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00953F 02:952F: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009540 02:9530: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x009541 02:9531: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009542 02:9532: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009543 02:9533: 16        .byte $10 * $01 + $06   ; pos YX
- D 0 - I - 0x009544 02:9534: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009545 02:9535: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009546 02:9536: 16        .byte $10 * $01 + $06   ; pos YX
- D 0 - I - 0x009547 02:9537: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009548 02:9538: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009549 02:9539: 33        .byte $10 * $03 + $03   ; pos YX
- D 0 - I - 0x00954A 02:953A: A3        .byte $80 + $00 + $23   ; flags
- D 0 - I - 0x00954B 02:953B: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00954C 02:953C: FF        .byte $FF   ; end token



_off019_02_953D_0D:
- D 0 - I - 0x00954D 02:953D: 34        .byte $10 * $03 + $04   ; pos YX
- D 0 - I - 0x00954E 02:953E: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x00954F 02:953F: 10        .byte con_obj_id_10   ; 

- D 0 - I - 0x009550 02:9540: FF        .byte $FF   ; end token



_off019_02_9541_0E:
- D 0 - I - 0x009551 02:9541: 98        .byte $10 * $09 + $08   ; pos YX
- D 0 - I - 0x009552 02:9542: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009553 02:9543: 4E        .byte con_obj_id_3B   ; 

- D 0 - I - 0x009554 02:9544: FF        .byte $FF   ; end token



_off019_02_9545_0F:
- D 0 - I - 0x009555 02:9545: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x009556 02:9546: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009557 02:9547: 3F        .byte con_obj_id_2F   ; 

- D 0 - I - 0x009558 02:9548: 5E        .byte $10 * $05 + $0E   ; pos YX
- D 0 - I - 0x009559 02:9549: 15        .byte $10 + $00 + $05   ; flags
- D 0 - I - 0x00955A 02:954A: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00955B 02:954B: FF        .byte $FF   ; end token



_off019_02_954D_11:
- D 0 - I - 0x00955D 02:954D: 45        .byte $10 * $04 + $05   ; pos YX
- D 0 - I - 0x00955E 02:954E: 11        .byte $10 + $00 + $01   ; flags
- D 0 - I - 0x00955F 02:954F: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009560 02:9550: 75        .byte $10 * $07 + $05   ; pos YX
- D 0 - I - 0x009561 02:9551: 13        .byte $10 + $00 + $03   ; flags
- D 0 - I - 0x009562 02:9552: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009563 02:9553: FF        .byte $FF   ; end token



_off019_02_9555_13:
- D 0 - I - 0x009565 02:9555: 8E        .byte $10 * $08 + $0E   ; pos YX
- D 0 - I - 0x009566 02:9556: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009567 02:9557: 4B        .byte con_obj_id_3A   ; 

- D 0 - I - 0x009568 02:9558: FF        .byte $FF   ; end token



_off013_955B_03_area_4:
- - - - - - 0x00956B 02:955B: 11 96     .word _off019_03_FF ; 00
- - - - - - 0x00956D 02:955D: 12 96     .word _off019_03_FF ; 01
- - - - - - 0x00956F 02:955F: 13 96     .word _off019_03_FF ; 02
- D 0 - I - 0x009571 02:9561: 14 96     .word _off019_03_FF ; 03
- D 0 - I - 0x009573 02:9563: 15 96     .word _off019_03_FF ; 04
- - - - - - 0x009575 02:9565: 16 96     .word _off019_03_FF ; 05
- - - - - - 0x009577 02:9567: 17 96     .word _off019_03_FF ; 06
- - - - - - 0x009579 02:9569: 18 96     .word _off019_03_FF ; 07
- - - - - - 0x00957B 02:956B: 19 96     .word _off019_03_FF ; 08
- - - - - - 0x00957D 02:956D: 1A 96     .word _off019_03_FF ; 09
- D 0 - I - 0x00957F 02:956F: 1B 96     .word _off019_03_961B_0A
- D 0 - I - 0x009581 02:9571: 43 96     .word _off019_03_FF ; 0B
- - - - - - 0x009583 02:9573: 44 96     .word _off019_03_FF ; 0C
- - - - - - 0x009585 02:9575: 45 96     .word _off019_03_FF ; 0D
- - - - - - 0x009587 02:9577: 46 96     .word _off019_03_FF ; 0E
- - - - - - 0x009589 02:9579: 47 96     .word _off019_03_FF ; 0F
- - - - - - 0x00958B 02:957B: 48 96     .word _off019_03_FF ; 10
- D 0 - I - 0x00958D 02:957D: 49 96     .word _off019_03_9649_11
- D 0 - I - 0x00958F 02:957F: 71 96     .word _off019_03_FF ; 12
- - - - - - 0x009591 02:9581: 72 96     .word _off019_03_FF ; 13
- - - - - - 0x009593 02:9583: 73 96     .word _off019_03_FF ; 14
- - - - - - 0x009595 02:9585: 74 96     .word _off019_03_FF ; 15
- - - - - - 0x009597 02:9587: 75 96     .word _off019_03_FF ; 16
- - - - - - 0x009599 02:9589: 76 96     .word _off019_03_FF ; 17
- D 0 - I - 0x00959B 02:958B: 77 96     .word _off019_03_9677_18
- D 0 - I - 0x00959D 02:958D: 96 96     .word _off019_03_FF ; 19
- - - - - - 0x00959F 02:958F: 97 96     .word _off019_03_FF ; 1A
- - - - - - 0x0095A1 02:9591: 98 96     .word _off019_03_FF ; 1B
- - - - - - 0x0095A3 02:9593: 99 96     .word _off019_03_FF ; 1C
- - - - - - 0x0095A5 02:9595: 9A 96     .word _off019_03_FF ; 1D
- - - - - - 0x0095A7 02:9597: 9B 96     .word _off019_03_FF ; 1E
- D 0 - I - 0x0095A9 02:9599: 9C 96     .word _off019_03_969C_1F
- D 0 - I - 0x0095AB 02:959B: A6 96     .word _off019_03_FF ; 20
- - - - - - 0x0095AD 02:959D: A7 96     .word _off019_03_FF ; 21
- - - - - - 0x0095AF 02:959F: A8 96     .word _off019_03_FF ; 22
- - - - - - 0x0095B1 02:95A1: A9 96     .word _off019_03_FF ; 23
- - - - - - 0x0095B3 02:95A3: AA 96     .word _off019_03_FF ; 24
- - - - - - 0x0095B5 02:95A5: AB 96     .word _off019_03_FF ; 25
- D 0 - I - 0x0095B7 02:95A7: AC 96     .word _off019_03_96AC_26
- D 0 - I - 0x0095B9 02:95A9: B9 96     .word _off019_03_FF ; 27
- - - - - - 0x0095BB 02:95AB: BA 96     .word _off019_03_FF ; 28
- - - - - - 0x0095BD 02:95AD: BB 96     .word _off019_03_FF ; 29
- - - - - - 0x0095BF 02:95AF: BC 96     .word _off019_03_FF ; 2A
- - - - - - 0x0095C1 02:95B1: BD 96     .word _off019_03_FF ; 2B
- - - - - - 0x0095C3 02:95B3: BE 96     .word _off019_03_FF ; 2C
- D 0 - I - 0x0095C5 02:95B5: BF 96     .word _off019_03_96BF_2D
- D 0 - I - 0x0095C7 02:95B7: CC 96     .word _off019_03_FF ; 2E
- - - - - - 0x0095C9 02:95B9: CD 96     .word _off019_03_FF ; 2F
- - - - - - 0x0095CB 02:95BB: CE 96     .word _off019_03_FF ; 30
- - - - - - 0x0095CD 02:95BD: CF 96     .word _off019_03_FF ; 31
- - - - - - 0x0095CF 02:95BF: D0 96     .word _off019_03_FF ; 32
- - - - - - 0x0095D1 02:95C1: D1 96     .word _off019_03_FF ; 33
- D 0 - I - 0x0095D3 02:95C3: D2 96     .word _off019_03_96D2_34
- D 0 - I - 0x0095D5 02:95C5: D9 96     .word _off019_03_FF ; 35
- - - - - - 0x0095D7 02:95C7: DA 96     .word _off019_03_FF ; 36
- - - - - - 0x0095D9 02:95C9: DB 96     .word _off019_03_FF ; 37
- - - - - - 0x0095DB 02:95CB: DC 96     .word _off019_03_FF ; 38
- - - - - - 0x0095DD 02:95CD: DD 96     .word _off019_03_FF ; 39
- - - - - - 0x0095DF 02:95CF: DE 96     .word _off019_03_FF ; 3A
- D 0 - I - 0x0095E1 02:95D1: DF 96     .word _off019_03_96DF_3B
- D 0 - I - 0x0095E3 02:95D3: EF 96     .word _off019_03_FF ; 3C
- - - - - - 0x0095E5 02:95D5: F0 96     .word _off019_03_FF ; 3D
- - - - - - 0x0095E7 02:95D7: F1 96     .word _off019_03_FF ; 3E
- - - - - - 0x0095E9 02:95D9: F2 96     .word _off019_03_FF ; 3F
- - - - - - 0x0095EB 02:95DB: F3 96     .word _off019_03_FF ; 40
- - - - - - 0x0095ED 02:95DD: F4 96     .word _off019_03_FF ; 41
- D 0 - I - 0x0095EF 02:95DF: F5 96     .word _off019_03_96F5_42
- D 0 - I - 0x0095F1 02:95E1: FF 96     .word _off019_03_FF ; 43
- - - - - - 0x0095F3 02:95E3: 00 97     .word _off019_03_FF ; 44
- - - - - - 0x0095F5 02:95E5: 01 97     .word _off019_03_FF ; 45
- - - - - - 0x0095F7 02:95E7: 02 97     .word _off019_03_FF ; 46
- - - - - - 0x0095F9 02:95E9: 03 97     .word _off019_03_FF ; 47
- - - - - - 0x0095FB 02:95EB: 04 97     .word _off019_03_FF ; 48
- D 0 - I - 0x0095FD 02:95ED: 05 97     .word _off019_03_9705_49
- D 0 - I - 0x0095FF 02:95EF: 0F 97     .word _off019_03_FF ; 4A
- - - - - - 0x009601 02:95F1: 10 97     .word _off019_03_FF ; 4B
- - - - - - 0x009603 02:95F3: 11 97     .word _off019_03_FF ; 4C
- - - - - - 0x009605 02:95F5: 12 97     .word _off019_03_FF ; 4D
- - - - - - 0x009607 02:95F7: 13 97     .word _off019_03_FF ; 4E
- - - - - - 0x009609 02:95F9: 14 97     .word _off019_03_FF ; 4F
- D 0 - I - 0x00960B 02:95FB: 15 97     .word _off019_03_9715_50
- D 0 - I - 0x00960D 02:95FD: 22 97     .word _off019_03_FF ; 51
- - - - - - 0x00960F 02:95FF: 23 97     .word _off019_03_FF ; 52
- - - - - - 0x009611 02:9601: 24 97     .word _off019_03_FF ; 53
- - - - - - 0x009613 02:9603: 25 97     .word _off019_03_FF ; 54
- D 0 - I - 0x009615 02:9605: 26 97     .word _off019_03_9726_55
- D 0 - I - 0x009617 02:9607: 3C 97     .word _off019_03_973C_56
- D 0 - I - 0x009619 02:9609: 55 97     .word _off019_03_9755_57
- - - - - - 0x00961B 02:960B: 6B 97     .word _off019_03_FF ; 58
- - - - - - 0x00961D 02:960D: 6C 97     .word _off019_03_FF ; 59
- - - - - - 0x00961F 02:960F: 6D 97     .word _off019_03_FF ; 5A



_off019_03_FF:
; cyneprepou4uk
- - - - - - 0x00962A 02:961A: FF        .byte $FF   ; end token



_off019_03_961B_0A:
- D 0 - I - 0x00962B 02:961B: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x00962C 02:961C: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x00962D 02:961D: 42        .byte con_obj_id_32   ; 

- D 0 - I - 0x00962E 02:961E: 71        .byte $10 * $07 + $01   ; pos YX
- D 0 - I - 0x00962F 02:961F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009630 02:9620: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009631 02:9621: 77        .byte $10 * $07 + $07   ; pos YX
- D 0 - I - 0x009632 02:9622: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009633 02:9623: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009634 02:9624: 79        .byte $10 * $07 + $09   ; pos YX
- D 0 - I - 0x009635 02:9625: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009636 02:9626: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009637 02:9627: 7E        .byte $10 * $07 + $0E   ; pos YX
- D 0 - I - 0x009638 02:9628: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009639 02:9629: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x00963A 02:962A: A4        .byte $10 * $0A + $04   ; pos YX
- D 0 - I - 0x00963B 02:962B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00963C 02:962C: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x00963D 02:962D: A6        .byte $10 * $0A + $06   ; pos YX
- D 0 - I - 0x00963E 02:962E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00963F 02:962F: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009640 02:9630: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009641 02:9631: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009642 02:9632: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009643 02:9633: AC        .byte $10 * $0A + $0C   ; pos YX
- D 0 - I - 0x009644 02:9634: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009645 02:9635: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009646 02:9636: D5        .byte $10 * $0D + $05   ; pos YX
- D 0 - I - 0x009647 02:9637: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009648 02:9638: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009649 02:9639: D8        .byte $10 * $0D + $08   ; pos YX
- D 0 - I - 0x00964A 02:963A: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00964B 02:963B: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x00964C 02:963C: DB        .byte $10 * $0D + $0B   ; pos YX
- D 0 - I - 0x00964D 02:963D: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00964E 02:963E: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x00964F 02:963F: DE        .byte $10 * $0D + $0E   ; pos YX
- D 0 - I - 0x009650 02:9640: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009651 02:9641: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009652 02:9642: FF        .byte $FF   ; end token



_off019_03_9649_11:
- D 0 - I - 0x009659 02:9649: 15        .byte $10 * $01 + $05   ; pos YX
- D 0 - I - 0x00965A 02:964A: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00965B 02:964B: 40        .byte con_obj_id_30   ; 

- D 0 - I - 0x00965C 02:964C: 1A        .byte $10 * $01 + $0A   ; pos YX
- D 0 - I - 0x00965D 02:964D: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00965E 02:964E: 40        .byte con_obj_id_30   ; 

- D 0 - I - 0x00965F 02:964F: 3E        .byte $10 * $03 + $0E   ; pos YX
- D 0 - I - 0x009660 02:9650: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009661 02:9651: 40        .byte con_obj_id_30   ; 

- D 0 - I - 0x009662 02:9652: 41        .byte $10 * $04 + $01   ; pos YX
- D 0 - I - 0x009663 02:9653: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009664 02:9654: 41        .byte con_obj_id_31   ; 

- D 0 - I - 0x009665 02:9655: 65        .byte $10 * $06 + $05   ; pos YX
- D 0 - I - 0x009666 02:9656: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009667 02:9657: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009668 02:9658: 68        .byte $10 * $06 + $08   ; pos YX
- D 0 - I - 0x009669 02:9659: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00966A 02:965A: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x00966B 02:965B: 7B        .byte $10 * $07 + $0B   ; pos YX
- D 0 - I - 0x00966C 02:965C: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00966D 02:965D: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x00966E 02:965E: 7E        .byte $10 * $07 + $0E   ; pos YX
- D 0 - I - 0x00966F 02:965F: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009670 02:9660: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009671 02:9661: AE        .byte $10 * $0A + $0E   ; pos YX
- D 0 - I - 0x009672 02:9662: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009673 02:9663: 41        .byte con_obj_id_31   ; 

- D 0 - I - 0x009674 02:9664: A2        .byte $10 * $0A + $02   ; pos YX
- D 0 - I - 0x009675 02:9665: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009676 02:9666: 40        .byte con_obj_id_30   ; 

- D 0 - I - 0x009677 02:9667: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009678 02:9668: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009679 02:9669: 40        .byte con_obj_id_30   ; 

- D 0 - I - 0x00967A 02:966A: D4        .byte $10 * $0D + $04   ; pos YX
- D 0 - I - 0x00967B 02:966B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00967C 02:966C: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x00967D 02:966D: DA        .byte $10 * $0D + $0A   ; pos YX
- D 0 - I - 0x00967E 02:966E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00967F 02:966F: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009680 02:9670: FF        .byte $FF   ; end token



_off019_03_9677_18:
- D 0 - I - 0x009687 02:9677: 22        .byte $10 * $02 + $02   ; pos YX
- D 0 - I - 0x009688 02:9678: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009689 02:9679: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x00968A 02:967A: 2D        .byte $10 * $02 + $0D   ; pos YX
- D 0 - I - 0x00968B 02:967B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00968C 02:967C: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x00968D 02:967D: 56        .byte $10 * $05 + $06   ; pos YX
- D 0 - I - 0x00968E 02:967E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00968F 02:967F: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009690 02:9680: 5A        .byte $10 * $05 + $0A   ; pos YX
- D 0 - I - 0x009691 02:9681: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009692 02:9682: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009693 02:9683: 73        .byte $10 * $07 + $03   ; pos YX
- D 0 - I - 0x009694 02:9684: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009695 02:9685: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009696 02:9686: 8A        .byte $10 * $08 + $0A   ; pos YX
- D 0 - I - 0x009697 02:9687: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009698 02:9688: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x009699 02:9689: AC        .byte $10 * $0A + $0C   ; pos YX
- D 0 - I - 0x00969A 02:968A: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x00969B 02:968B: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00969C 02:968C: A4        .byte $10 * $0A + $04   ; pos YX
- D 0 - I - 0x00969D 02:968D: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00969E 02:968E: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00969F 02:968F: B8        .byte $10 * $0B + $08   ; pos YX
- D 0 - I - 0x0096A0 02:9690: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0096A1 02:9691: 25        .byte con_obj_id_16   ; 

- D 0 - I - 0x0096A2 02:9692: D8        .byte $10 * $0D + $08   ; pos YX
- D 0 - I - 0x0096A3 02:9693: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096A4 02:9694: 25        .byte con_obj_id_16   ; 

- D 0 - I - 0x0096A5 02:9695: FF        .byte $FF   ; end token



_off019_03_969C_1F:
- D 0 - I - 0x0096AC 02:969C: 62        .byte $10 * $06 + $02   ; pos YX
- D 0 - I - 0x0096AD 02:969D: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x0096AE 02:969E: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x0096AF 02:969F: 6C        .byte $10 * $06 + $0C   ; pos YX
- D 0 - I - 0x0096B0 02:96A0: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x0096B1 02:96A1: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x0096B2 02:96A2: D8        .byte $10 * $0D + $08   ; pos YX
- D 0 - I - 0x0096B3 02:96A3: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096B4 02:96A4: 25        .byte con_obj_id_16   ; 

- D 0 - I - 0x0096B5 02:96A5: FF        .byte $FF   ; end token



_off019_03_96AC_26:
- D 0 - I - 0x0096BC 02:96AC: 28        .byte $10 * $02 + $08   ; pos YX
- D 0 - I - 0x0096BD 02:96AD: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0096BE 02:96AE: 25        .byte con_obj_id_16   ; 

- D 0 - I - 0x0096BF 02:96AF: 94        .byte $10 * $09 + $04   ; pos YX
- D 0 - I - 0x0096C0 02:96B0: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x0096C1 02:96B1: 39        .byte con_obj_id_29   ; 

- D 0 - I - 0x0096C2 02:96B2: 92        .byte $10 * $09 + $02   ; pos YX
- D 0 - I - 0x0096C3 02:96B3: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0096C4 02:96B4: 40        .byte con_obj_id_30   ; 

- D 0 - I - 0x0096C5 02:96B5: 9C        .byte $10 * $09 + $0C   ; pos YX
- D 0 - I - 0x0096C6 02:96B6: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096C7 02:96B7: 40        .byte con_obj_id_30   ; 

- D 0 - I - 0x0096C8 02:96B8: FF        .byte $FF   ; end token



_off019_03_96BF_2D:
- D 0 - I - 0x0096CF 02:96BF: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x0096D0 02:96C0: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0096D1 02:96C1: 41        .byte con_obj_id_31   ; 

- D 0 - I - 0x0096D2 02:96C2: 15        .byte $10 * $01 + $05   ; pos YX
- D 0 - I - 0x0096D3 02:96C3: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0096D4 02:96C4: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0096D5 02:96C5: 2E        .byte $10 * $02 + $0E   ; pos YX
- D 0 - I - 0x0096D6 02:96C6: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096D7 02:96C7: 41        .byte con_obj_id_31   ; 

- D 0 - I - 0x0096D8 02:96C8: 66        .byte $10 * $06 + $06   ; pos YX
- D 0 - I - 0x0096D9 02:96C9: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x0096DA 02:96CA: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x0096DB 02:96CB: FF        .byte $FF   ; end token



_off019_03_96D2_34:
- D 0 - I - 0x0096E2 02:96D2: 44        .byte $10 * $04 + $04   ; pos YX
- D 0 - I - 0x0096E3 02:96D3: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x0096E4 02:96D4: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x0096E5 02:96D5: 4A        .byte $10 * $04 + $0A   ; pos YX
- D 0 - I - 0x0096E6 02:96D6: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x0096E7 02:96D7: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x0096E8 02:96D8: FF        .byte $FF   ; end token



_off019_03_96DF_3B:
- D 0 - I - 0x0096EF 02:96DF: 05        .byte $10 * $00 + $05   ; pos YX
- D 0 - I - 0x0096F0 02:96E0: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096F1 02:96E1: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x0096F2 02:96E2: 09        .byte $10 * $00 + $09   ; pos YX
- D 0 - I - 0x0096F3 02:96E3: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0096F4 02:96E4: 31        .byte con_obj_id_22   ; 

- D 0 - I - 0x0096F5 02:96E5: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x0096F6 02:96E6: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x0096F7 02:96E7: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0096F8 02:96E8: 2B        .byte $10 * $02 + $0B   ; pos YX
- D 0 - I - 0x0096F9 02:96E9: A4        .byte $80 + $00 + $24   ; flags
- D 0 - I - 0x0096FA 02:96EA: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0096FB 02:96EB: 94        .byte $10 * $09 + $04   ; pos YX
- D 0 - I - 0x0096FC 02:96EC: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x0096FD 02:96ED: 39        .byte con_obj_id_29   ; 

- D 0 - I - 0x0096FE 02:96EE: FF        .byte $FF   ; end token



_off019_03_96F5_42:
- D 0 - I - 0x009705 02:96F5: 18        .byte $10 * $01 + $08   ; pos YX
- D 0 - I - 0x009706 02:96F6: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009707 02:96F7: 2C        .byte con_obj_id_1D   ; 

- D 0 - I - 0x009708 02:96F8: 41        .byte $10 * $04 + $01   ; pos YX
- D 0 - I - 0x009709 02:96F9: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00970A 02:96FA: 41        .byte con_obj_id_31   ; 

- D 0 - I - 0x00970B 02:96FB: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x00970C 02:96FC: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00970D 02:96FD: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x00970E 02:96FE: FF        .byte $FF   ; end token



_off019_03_9705_49:
- D 0 - I - 0x009715 02:9705: 08        .byte $10 * $00 + $08   ; pos YX
- D 0 - I - 0x009716 02:9706: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009717 02:9707: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x009718 02:9708: 24        .byte $10 * $02 + $04   ; pos YX
- D 0 - I - 0x009719 02:9709: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00971A 02:970A: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x00971B 02:970B: 6E        .byte $10 * $06 + $0E   ; pos YX
- D 0 - I - 0x00971C 02:970C: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00971D 02:970D: 41        .byte con_obj_id_31   ; 

- D 0 - I - 0x00971E 02:970E: FF        .byte $FF   ; end token



_off019_03_9715_50:
- D 0 - I - 0x009725 02:9715: 11        .byte $10 * $01 + $01   ; pos YX
- D 0 - I - 0x009726 02:9716: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009727 02:9717: 41        .byte con_obj_id_31   ; 

- D 0 - I - 0x009728 02:9718: 42        .byte $10 * $04 + $02   ; pos YX
- D 0 - I - 0x009729 02:9719: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00972A 02:971A: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x00972B 02:971B: 4A        .byte $10 * $04 + $0A   ; pos YX
- D 0 - I - 0x00972C 02:971C: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00972D 02:971D: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x00972E 02:971E: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x00972F 02:971F: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009730 02:9720: 41        .byte con_obj_id_31   ; 

- D 0 - I - 0x009731 02:9721: FF        .byte $FF   ; end token



_off019_03_9726_55:
- D 0 - I - 0x009736 02:9726: 52        .byte $10 * $05 + $02   ; pos YX
- D 0 - I - 0x009737 02:9727: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009738 02:9728: 6C        .byte con_obj_id_56   ; 

- D 0 - I - 0x009739 02:9729: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x00973A 02:972A: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00973B 02:972B: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00973C 02:972C: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x00973D 02:972D: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00973E 02:972E: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00973F 02:972F: 9A        .byte $10 * $09 + $0A   ; pos YX
- D 0 - I - 0x009740 02:9730: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009741 02:9731: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009742 02:9732: 9C        .byte $10 * $09 + $0C   ; pos YX
- D 0 - I - 0x009743 02:9733: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009744 02:9734: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009745 02:9735: 9F        .byte $10 * $09 + $0F   ; pos YX
- D 0 - I - 0x009746 02:9736: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009747 02:9737: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009748 02:9738: 67        .byte $10 * $06 + $07   ; pos YX
- D 0 - I - 0x009749 02:9739: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x00974A 02:973A: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00974B 02:973B: FF        .byte $FF   ; end token



_off019_03_973C_56:
- D 0 - I - 0x00974C 02:973C: 52        .byte $10 * $05 + $02   ; pos YX
- D 0 - I - 0x00974D 02:973D: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00974E 02:973E: 6C        .byte con_obj_id_56   ; 

- D 0 - I - 0x00974F 02:973F: 92        .byte $10 * $09 + $02   ; pos YX
- D 0 - I - 0x009750 02:9740: 09        .byte $00 + $00 + $09   ; flags
- D 0 - I - 0x009751 02:9741: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009752 02:9742: 95        .byte $10 * $09 + $05   ; pos YX
- D 0 - I - 0x009753 02:9743: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009754 02:9744: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009755 02:9745: 95        .byte $10 * $09 + $05   ; pos YX
- D 0 - I - 0x009756 02:9746: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009757 02:9747: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009758 02:9748: 9B        .byte $10 * $09 + $0B   ; pos YX
- D 0 - I - 0x009759 02:9749: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00975A 02:974A: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00975B 02:974B: 9C        .byte $10 * $09 + $0C   ; pos YX
- D 0 - I - 0x00975C 02:974C: 09        .byte $00 + $00 + $09   ; flags
- D 0 - I - 0x00975D 02:974D: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00975E 02:974E: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x00975F 02:974F: 08        .byte $00 + $00 + $08   ; flags
- D 0 - I - 0x009760 02:9750: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009761 02:9751: 9E        .byte $10 * $09 + $0E   ; pos YX
- D 0 - I - 0x009762 02:9752: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009763 02:9753: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009764 02:9754: FF        .byte $FF   ; end token



_off019_03_9755_57:
- D 0 - I - 0x009765 02:9755: 18        .byte $10 * $01 + $08   ; pos YX
- D 0 - I - 0x009766 02:9756: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009767 02:9757: 2C        .byte con_obj_id_1D   ; 

- D 0 - I - 0x009768 02:9758: 45        .byte $10 * $04 + $05   ; pos YX
- D 0 - I - 0x009769 02:9759: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00976A 02:975A: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00976B 02:975B: 4A        .byte $10 * $04 + $0A   ; pos YX
- D 0 - I - 0x00976C 02:975C: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00976D 02:975D: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00976E 02:975E: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x00976F 02:975F: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009770 02:9760: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009771 02:9761: 91        .byte $10 * $09 + $01   ; pos YX
- D 0 - I - 0x009772 02:9762: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009773 02:9763: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009774 02:9764: 96        .byte $10 * $09 + $06   ; pos YX
- D 0 - I - 0x009775 02:9765: 09        .byte $00 + $00 + $09   ; flags
- D 0 - I - 0x009776 02:9766: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x009777 02:9767: 98        .byte $10 * $09 + $08   ; pos YX
- D 0 - I - 0x009778 02:9768: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009779 02:9769: 03        .byte con_obj_id_03   ; 

- D 0 - I - 0x00977A 02:976A: FF        .byte $FF   ; end token



_off013_976E_04_area_5:
- D 0 - I - 0x00977E 02:976E: EC 97     .word _off019_04_97EC_00
- D 0 - I - 0x009780 02:9770: F6 97     .word _off019_04_FF ; 01
- D 0 - I - 0x009782 02:9772: F7 97     .word _off019_04_FF ; 02
- D 0 - I - 0x009784 02:9774: F8 97     .word _off019_04_FF ; 03
- - - - - - 0x009786 02:9776: F9 97     .word _off019_04_FF ; 04
- - - - - - 0x009788 02:9778: FA 97     .word _off019_04_FF ; 05
- - - - - - 0x00978A 02:977A: FB 97     .word _off019_04_FF ; 06
- - - - - - 0x00978C 02:977C: FC 97     .word _off019_04_FF ; 07
- - - - - - 0x00978E 02:977E: FD 97     .word _off019_04_FF ; 08
- D 0 - I - 0x009790 02:9780: FE 97     .word _off019_04_97FE_09
- D 0 - I - 0x009792 02:9782: 0B 98     .word _off019_04_FF ; 0A
- D 0 - I - 0x009794 02:9784: 0C 98     .word _off019_04_980C_0B
- D 0 - I - 0x009796 02:9786: 10 98     .word _off019_04_9810_0C
- D 0 - I - 0x009798 02:9788: 14 98     .word _off019_04_FF ; 0D
- D 0 - I - 0x00979A 02:978A: 15 98     .word _off019_04_FF ; 0E
- - - - - - 0x00979C 02:978C: 16 98     .word _off019_04_FF ; 0F
- - - - - - 0x00979E 02:978E: 17 98     .word _off019_04_FF ; 10
- - - - - - 0x0097A0 02:9790: 18 98     .word _off019_04_FF ; 11
- D 0 - I - 0x0097A2 02:9792: 19 98     .word _off019_04_9819_12
- D 0 - I - 0x0097A4 02:9794: 26 98     .word _off019_04_FF ; 13
- D 0 - I - 0x0097A6 02:9796: 27 98     .word _off019_04_FF ; 14
- D 0 - I - 0x0097A8 02:9798: 28 98     .word _off019_04_9828_15
- D 0 - I - 0x0097AA 02:979A: 2C 98     .word _off019_04_982C_16
- D 0 - I - 0x0097AC 02:979C: 30 98     .word _off019_04_9830_17
- - - - - - 0x0097AE 02:979E: 34 98     .word _off019_04_FF ; 18
- - - - - - 0x0097B0 02:97A0: 35 98     .word _off019_04_FF ; 19
- - - - - - 0x0097B2 02:97A2: 36 98     .word _off019_04_FF ; 1A
- D 0 - I - 0x0097B4 02:97A4: 37 98     .word _off019_04_9837_1B
- D 0 - I - 0x0097B6 02:97A6: 47 98     .word _off019_04_FF ; 1C
- - - - - - 0x0097B8 02:97A8: 48 98     .word _off019_04_FF ; 1D
- - - - - - 0x0097BA 02:97AA: 49 98     .word _off019_04_FF ; 1E
- - - - - - 0x0097BC 02:97AC: 4A 98     .word _off019_04_FF ; 1F
- - - - - - 0x0097BE 02:97AE: 4B 98     .word _off019_04_FF ; 20
- - - - - - 0x0097C0 02:97B0: 4C 98     .word _off019_04_FF ; 21
- - - - - - 0x0097C2 02:97B2: 4D 98     .word _off019_04_FF ; 22
- - - - - - 0x0097C4 02:97B4: 4E 98     .word _off019_04_FF ; 23
- D 0 - I - 0x0097C6 02:97B6: 4F 98     .word _off019_04_984F_24
- D 0 - I - 0x0097C8 02:97B8: 59 98     .word _off019_04_FF ; 25
- - - - - - 0x0097CA 02:97BA: 5A 98     .word _off019_04_FF ; 26
- - - - - - 0x0097CC 02:97BC: 5B 98     .word _off019_04_FF ; 27
- - - - - - 0x0097CE 02:97BE: 5C 98     .word _off019_04_FF ; 28
- - - - - - 0x0097D0 02:97C0: 5D 98     .word _off019_04_FF ; 29
- - - - - - 0x0097D2 02:97C2: 5E 98     .word _off019_04_FF ; 2A
- - - - - - 0x0097D4 02:97C4: 5F 98     .word _off019_04_FF ; 2B
- - - - - - 0x0097D6 02:97C6: 60 98     .word _off019_04_FF ; 2C
- D 0 - I - 0x0097D8 02:97C8: 61 98     .word _off019_04_9861_2D
- D 0 - I - 0x0097DA 02:97CA: 71 98     .word _off019_04_FF ; 2E
- - - - - - 0x0097DC 02:97CC: 72 98     .word _off019_04_FF ; 2F
- - - - - - 0x0097DE 02:97CE: 73 98     .word _off019_04_FF ; 30
- - - - - - 0x0097E0 02:97D0: 74 98     .word _off019_04_FF ; 31
- - - - - - 0x0097E2 02:97D2: 75 98     .word _off019_04_FF ; 32
- - - - - - 0x0097E4 02:97D4: 76 98     .word _off019_04_FF ; 33
- - - - - - 0x0097E6 02:97D6: 77 98     .word _off019_04_FF ; 34
- - - - - - 0x0097E8 02:97D8: 78 98     .word _off019_04_FF ; 35
- - - - - - 0x0097EA 02:97DA: 79 98     .word _off019_04_FF ; 36
- - - - - - 0x0097EC 02:97DC: 7A 98     .word _off019_04_FF ; 37
- - - - - - 0x0097EE 02:97DE: 7B 98     .word _off019_04_FF ; 38
- - - - - - 0x0097F0 02:97E0: 7C 98     .word _off019_04_FF ; 39
- - - - - - 0x0097F2 02:97E2: 7D 98     .word _off019_04_FF ; 3A
- - - - - - 0x0097F4 02:97E4: 7E 98     .word _off019_04_FF ; 3B
- - - - - - 0x0097F6 02:97E6: 7F 98     .word _off019_04_FF ; 3C
- - - - - - 0x0097F8 02:97E8: 80 98     .word _off019_04_FF ; 3D
- - - - - - 0x0097FA 02:97EA: 81 98     .word _off019_04_FF ; 3E



_off019_04_FF:
; cyneprepou4uk
- D 0 - I - 0x009806 02:97F6: FF        .byte $FF   ; end token



_off019_04_97EC_00:
- D 0 - I - 0x0097FC 02:97EC: AA        .byte $10 * $0A + $0A   ; pos YX
- D 0 - I - 0x0097FD 02:97ED: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0097FE 02:97EE: 2F        .byte con_obj_id_20   ; 

- D 0 - I - 0x0097FF 02:97EF: C1        .byte $10 * $0C + $01   ; pos YX
- D 0 - I - 0x009800 02:97F0: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009801 02:97F1: 2F        .byte con_obj_id_20   ; 

- D 0 - I - 0x009802 02:97F2: D6        .byte $10 * $0D + $06   ; pos YX
- D 0 - I - 0x009803 02:97F3: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009804 02:97F4: 2F        .byte con_obj_id_20   ; 

- D 0 - I - 0x009805 02:97F5: FF        .byte $FF   ; end token



_off019_04_97FE_09:
- D 0 - I - 0x00980E 02:97FE: 03        .byte $10 * $00 + $03   ; pos YX
- D 0 - I - 0x00980F 02:97FF: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009810 02:9800: 2F        .byte con_obj_id_20   ; 

- D 0 - I - 0x009811 02:9801: 28        .byte $10 * $02 + $08   ; pos YX
- D 0 - I - 0x009812 02:9802: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009813 02:9803: 2F        .byte con_obj_id_20   ; 

- D 0 - I - 0x009814 02:9804: 43        .byte $10 * $04 + $03   ; pos YX
- D 0 - I - 0x009815 02:9805: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009816 02:9806: 2F        .byte con_obj_id_20   ; 

- D 0 - I - 0x009817 02:9807: 7B        .byte $10 * $07 + $0B   ; pos YX
- D 0 - I - 0x009818 02:9808: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009819 02:9809: 2F        .byte con_obj_id_20   ; 

- D 0 - I - 0x00981A 02:980A: FF        .byte $FF   ; end token



_off019_04_980C_0B:
- D 0 - I - 0x00981C 02:980C: 59        .byte $10 * $05 + $09   ; pos YX
- D 0 - I - 0x00981D 02:980D: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00981E 02:980E: 58        .byte con_obj_id_43   ; 

- D 0 - I - 0x00981F 02:980F: FF        .byte $FF   ; end token



_off019_04_9810_0C:
- D 0 - I - 0x009820 02:9810: E9        .byte $10 * $0E + $09   ; pos YX
- D 0 - I - 0x009821 02:9811: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009822 02:9812: 32        .byte con_obj_id_23   ; 

- D 0 - I - 0x009823 02:9813: FF        .byte $FF   ; end token



_off019_04_9819_12:
- D 0 - I - 0x009829 02:9819: 13        .byte $10 * $01 + $03   ; pos YX
- D 0 - I - 0x00982A 02:981A: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00982B 02:981B: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00982C 02:981C: 4A        .byte $10 * $04 + $0A   ; pos YX
- D 0 - I - 0x00982D 02:981D: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00982E 02:981E: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x00982F 02:981F: 81        .byte $10 * $08 + $01   ; pos YX
- D 0 - I - 0x009830 02:9820: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009831 02:9821: 34        .byte con_obj_id_25   ; 

- D 0 - I - 0x009832 02:9822: 8E        .byte $10 * $08 + $0E   ; pos YX
- D 0 - I - 0x009833 02:9823: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009834 02:9824: 34        .byte con_obj_id_25   ; 

- D 0 - I - 0x009835 02:9825: FF        .byte $FF   ; end token



_off019_04_9828_15:
- D 0 - I - 0x009838 02:9828: 1B        .byte $10 * $01 + $0B   ; pos YX
- D 0 - I - 0x009839 02:9829: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00983A 02:982A: 58        .byte con_obj_id_43   ; 

- D 0 - I - 0x00983B 02:982B: FF        .byte $FF   ; end token



_off019_04_982C_16:
- D 0 - I - 0x00983C 02:982C: AD        .byte $10 * $0A + $0D   ; pos YX
- D 0 - I - 0x00983D 02:982D: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00983E 02:982E: 32        .byte con_obj_id_23   ; 

- D 0 - I - 0x00983F 02:982F: FF        .byte $FF   ; end token



_off019_04_9830_17:
- D 0 - I - 0x009840 02:9830: 88        .byte $10 * $08 + $08   ; pos YX
- D 0 - I - 0x009841 02:9831: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009842 02:9832: 59        .byte con_obj_id_44   ; 

- D 0 - I - 0x009843 02:9833: FF        .byte $FF   ; end token



_off019_04_9837_1B:
- D 0 - I - 0x009847 02:9837: 0E        .byte $10 * $00 + $0E   ; pos YX
- D 0 - I - 0x009848 02:9838: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009849 02:9839: 34        .byte con_obj_id_25   ; 

- D 0 - I - 0x00984A 02:983A: 21        .byte $10 * $02 + $01   ; pos YX
- D 0 - I - 0x00984B 02:983B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00984C 02:983C: 34        .byte con_obj_id_25   ; 

- D 0 - I - 0x00984D 02:983D: 56        .byte $10 * $05 + $06   ; pos YX
- D 0 - I - 0x00984E 02:983E: A6        .byte $80 + $00 + $26   ; flags
- D 0 - I - 0x00984F 02:983F: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009850 02:9840: 6B        .byte $10 * $06 + $0B   ; pos YX
- D 0 - I - 0x009851 02:9841: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x009852 02:9842: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009853 02:9843: A6        .byte $10 * $0A + $06   ; pos YX
- D 0 - I - 0x009854 02:9844: 84        .byte $80 + $00 + $04   ; flags
- D 0 - I - 0x009855 02:9845: 04        .byte con_obj_id_04   ; 

- D 0 - I - 0x009856 02:9846: FF        .byte $FF   ; end token



_off019_04_984F_24:
- D 0 - I - 0x00985F 02:984F: 0A        .byte $10 * $00 + $0A   ; pos YX
- D 0 - I - 0x009860 02:9850: 8B        .byte $80 + $00 + $0B   ; flags
- D 0 - I - 0x009861 02:9851: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x009862 02:9852: 42        .byte $10 * $04 + $02   ; pos YX
- D 0 - I - 0x009863 02:9853: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009864 02:9854: 09        .byte con_obj_id_09   ; 

- D 0 - I - 0x009865 02:9855: C0        .byte $10 * $0C + $00   ; pos YX
- D 0 - I - 0x009866 02:9856: 8A        .byte $80 + $00 + $0A   ; flags
- D 0 - I - 0x009867 02:9857: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x009868 02:9858: FF        .byte $FF   ; end token



_off019_04_9861_2D:
- D 0 - I - 0x009871 02:9861: 0E        .byte $10 * $00 + $0E   ; pos YX
- D 0 - I - 0x009872 02:9862: 8A        .byte $80 + $00 + $0A   ; flags
- D 0 - I - 0x009873 02:9863: 0A        .byte con_obj_id_0A   ; 

- D 0 - I - 0x009874 02:9864: 60        .byte $10 * $06 + $00   ; pos YX
- D 0 - I - 0x009875 02:9865: 84        .byte $80 + $00 + $04   ; flags
- D 0 - I - 0x009876 02:9866: 0B        .byte con_obj_id_0B   ; 

- D 0 - I - 0x009877 02:9867: 8C        .byte $10 * $08 + $0C   ; pos YX
- D 0 - I - 0x009878 02:9868: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009879 02:9869: 04        .byte con_obj_id_04   ; 

- D 0 - I - 0x00987A 02:986A: CA        .byte $10 * $0C + $0A   ; pos YX
- D 0 - I - 0x00987B 02:986B: 85        .byte $80 + $00 + $05   ; flags
- D 0 - I - 0x00987C 02:986C: 0B        .byte con_obj_id_0B   ; 

- D 0 - I - 0x00987D 02:986D: EE        .byte $10 * $0E + $0E   ; pos YX
- D 0 - I - 0x00987E 02:986E: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x00987F 02:986F: 04        .byte con_obj_id_04   ; 

- D 0 - I - 0x009880 02:9870: FF        .byte $FF   ; end token



_off013_9882_05_area_6:
- - - - - - 0x009892 02:9882: BA 98     .word _off019_05_FF ; 00
- - - - - - 0x009894 02:9884: BA 98     .word _off019_05_FF ; 01
- D 0 - I - 0x009896 02:9886: BB 98     .word _off019_05_98BB_02
- D 0 - I - 0x009898 02:9888: BA 98     .word _off019_05_FF ; 03
- D 0 - I - 0x00989A 02:988A: C8 98     .word _off019_05_98C8_04
- D 0 - I - 0x00989C 02:988C: BA 98     .word _off019_05_FF ; 05
- D 0 - I - 0x00989E 02:988E: CC 98     .word _off019_05_98CC_06
- D 0 - I - 0x0098A0 02:9890: BA 98     .word _off019_05_FF ; 07
- D 0 - I - 0x0098A2 02:9892: D0 98     .word _off019_05_98D0_08
- D 0 - I - 0x0098A4 02:9894: BA 98     .word _off019_05_FF ; 09
- D 0 - I - 0x0098A6 02:9896: EC 98     .word _off019_05_98EC_0A
- D 0 - I - 0x0098A8 02:9898: BA 98     .word _off019_05_FF ; 0B
- D 0 - I - 0x0098AA 02:989A: 05 99     .word _off019_05_FF ; 0C
- D 0 - I - 0x0098AC 02:989C: BA 98     .word _off019_05_FF ; 0D
- D 0 - I - 0x0098AE 02:989E: 06 99     .word _off019_05_9906_0E
- D 0 - I - 0x0098B0 02:98A0: BA 98     .word _off019_05_FF ; 0F
- D 0 - I - 0x0098B2 02:98A2: 13 99     .word _off019_05_FF ; 10
- D 0 - I - 0x0098B4 02:98A4: BA 98     .word _off019_05_FF ; 11
- D 0 - I - 0x0098B6 02:98A6: 14 99     .word _off019_05_9914_12
- D 0 - I - 0x0098B8 02:98A8: BA 98     .word _off019_05_FF ; 13
- D 0 - I - 0x0098BA 02:98AA: 21 99     .word _off019_05_FF ; 14
- D 0 - I - 0x0098BC 02:98AC: BA 98     .word _off019_05_FF ; 15
- D 0 - I - 0x0098BE 02:98AE: 22 99     .word _off019_05_FF ; 16
- D 0 - I - 0x0098C0 02:98B0: BA 98     .word _off019_05_FF ; 17
- - - - - - 0x0098C2 02:98B2: 23 99     .word _off019_05_FF ; 18
- - - - - - 0x0098C4 02:98B4: BA 98     .word _off019_05_FF ; 19
- - - - - - 0x0098C6 02:98B6: 24 99     .word _off019_05_FF ; 1A
- - - - - - 0x0098C8 02:98B8: BA 98     .word _off019_05_FF ; 1B



_off019_05_FF:
; cyneprepou4uk
- D 0 - I - 0x0098CA 02:98BA: FF        .byte $FF   ; end token



_off019_05_98BB_02:
- D 0 - I - 0x0098CB 02:98BB: 10        .byte $10 * $01 + $00   ; pos YX
- D 0 - I - 0x0098CC 02:98BC: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x0098CD 02:98BD: 64        .byte con_obj_id_4F   ; 

- D 0 - I - 0x0098CE 02:98BE: 5D        .byte $10 * $05 + $0D   ; pos YX
- D 0 - I - 0x0098CF 02:98BF: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098D0 02:98C0: 70        .byte con_obj_id_5A   ; 

- D 0 - I - 0x0098D1 02:98C1: 52        .byte $10 * $05 + $02   ; pos YX
- D 0 - I - 0x0098D2 02:98C2: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098D3 02:98C3: 70        .byte con_obj_id_5A   ; 

- D 0 - I - 0x0098D4 02:98C4: 71        .byte $10 * $07 + $01   ; pos YX
- D 0 - I - 0x0098D5 02:98C5: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098D6 02:98C6: 71        .byte con_obj_id_5B   ; 

- D 0 - I - 0x0098D7 02:98C7: FF        .byte $FF   ; end token



_off019_05_98C8_04:
- D 0 - I - 0x0098D8 02:98C8: A7        .byte $10 * $0A + $07   ; pos YX
- D 0 - I - 0x0098D9 02:98C9: C1        .byte $80 + $40 + $01   ; flags
- D 0 - I - 0x0098DA 02:98CA: 0D        .byte con_obj_id_0D   ; 

- D 0 - I - 0x0098DB 02:98CB: FF        .byte $FF   ; end token



_off019_05_98CC_06:
- D 0 - I - 0x0098DC 02:98CC: E1        .byte $10 * $0E + $01   ; pos YX
- D 0 - I - 0x0098DD 02:98CD: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x0098DE 02:98CE: 71        .byte con_obj_id_5B   ; 

- D 0 - I - 0x0098DF 02:98CF: FF        .byte $FF   ; end token



_off019_05_98D0_08:
- D 0 - I - 0x0098E0 02:98D0: 02        .byte $10 * $00 + $02   ; pos YX
- D 0 - I - 0x0098E1 02:98D1: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098E2 02:98D2: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x0098E3 02:98D3: 0D        .byte $10 * $00 + $0D   ; pos YX
- D 0 - I - 0x0098E4 02:98D4: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098E5 02:98D5: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x0098E6 02:98D6: 42        .byte $10 * $04 + $02   ; pos YX
- D 0 - I - 0x0098E7 02:98D7: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098E8 02:98D8: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x0098E9 02:98D9: 4D        .byte $10 * $04 + $0D   ; pos YX
- D 0 - I - 0x0098EA 02:98DA: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098EB 02:98DB: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x0098EC 02:98DC: 82        .byte $10 * $08 + $02   ; pos YX
- D 0 - I - 0x0098ED 02:98DD: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098EE 02:98DE: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x0098EF 02:98DF: 8D        .byte $10 * $08 + $0D   ; pos YX
- D 0 - I - 0x0098F0 02:98E0: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098F1 02:98E1: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x0098F2 02:98E2: 98        .byte $10 * $09 + $08   ; pos YX
- D 0 - I - 0x0098F3 02:98E3: B6        .byte $80 + $00 + $36   ; flags
- D 0 - I - 0x0098F4 02:98E4: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0098F5 02:98E5: C2        .byte $10 * $0C + $02   ; pos YX
- D 0 - I - 0x0098F6 02:98E6: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098F7 02:98E7: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x0098F8 02:98E8: CD        .byte $10 * $0C + $0D   ; pos YX
- D 0 - I - 0x0098F9 02:98E9: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x0098FA 02:98EA: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x0098FB 02:98EB: FF        .byte $FF   ; end token



_off019_05_98EC_0A:
- D 0 - I - 0x0098FC 02:98EC: 12        .byte $10 * $01 + $02   ; pos YX
- D 0 - I - 0x0098FD 02:98ED: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x0098FE 02:98EE: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x0098FF 02:98EF: 1D        .byte $10 * $01 + $0D   ; pos YX
- D 0 - I - 0x009900 02:98F0: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009901 02:98F1: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x009902 02:98F2: 52        .byte $10 * $05 + $02   ; pos YX
- D 0 - I - 0x009903 02:98F3: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009904 02:98F4: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x009905 02:98F5: 5D        .byte $10 * $05 + $0D   ; pos YX
- D 0 - I - 0x009906 02:98F6: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009907 02:98F7: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x009908 02:98F8: 58        .byte $10 * $05 + $08   ; pos YX
- D 0 - I - 0x009909 02:98F9: B1        .byte $80 + $00 + $31   ; flags
- D 0 - I - 0x00990A 02:98FA: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00990B 02:98FB: 58        .byte $10 * $05 + $08   ; pos YX
- D 0 - I - 0x00990C 02:98FC: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x00990D 02:98FD: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00990E 02:98FE: 92        .byte $10 * $09 + $02   ; pos YX
- D 0 - I - 0x00990F 02:98FF: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009910 02:9900: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x009911 02:9901: 9D        .byte $10 * $09 + $0D   ; pos YX
- D 0 - I - 0x009912 02:9902: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009913 02:9903: 60        .byte con_obj_id_4B   ; 

- D 0 - I - 0x009914 02:9904: FF        .byte $FF   ; end token



_off019_05_9906_0E:
- D 0 - I - 0x009916 02:9906: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x009917 02:9907: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009918 02:9908: 5F        .byte con_obj_id_4A   ; 

- D 0 - I - 0x009919 02:9909: 4C        .byte $10 * $04 + $0C   ; pos YX
- D 0 - I - 0x00991A 02:990A: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00991B 02:990B: 5F        .byte con_obj_id_4A   ; 

- D 0 - I - 0x00991C 02:990C: 44        .byte $10 * $04 + $04   ; pos YX
- D 0 - I - 0x00991D 02:990D: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x00991E 02:990E: 5F        .byte con_obj_id_4A   ; 

- D 0 - I - 0x00991F 02:990F: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x009920 02:9910: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009921 02:9911: 5F        .byte con_obj_id_4A   ; 

- D 0 - I - 0x009922 02:9912: FF        .byte $FF   ; end token



_off019_05_9914_12:
- D 0 - I - 0x009924 02:9914: 1A        .byte $10 * $01 + $0A   ; pos YX
- D 0 - I - 0x009925 02:9915: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009926 02:9916: 5D        .byte con_obj_id_48   ; 

- D 0 - I - 0x009927 02:9917: 88        .byte $10 * $08 + $08   ; pos YX
- D 0 - I - 0x009928 02:9918: B3        .byte $80 + $00 + $33   ; flags
- D 0 - I - 0x009929 02:9919: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00992A 02:991A: A8        .byte $10 * $0A + $08   ; pos YX
- D 0 - I - 0x00992B 02:991B: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00992C 02:991C: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00992D 02:991D: E0        .byte $10 * $0E + $00   ; pos YX
- D 0 - I - 0x00992E 02:991E: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x00992F 02:991F: 5E        .byte con_obj_id_49   ; 

- D 0 - I - 0x009930 02:9920: FF        .byte $FF   ; end token



_off013_9925_06_area_7:
- - - - - - 0x009935 02:9925: 5D 99     .word _off019_06_FF ; 00
- - - - - - 0x009937 02:9927: 5D 99     .word _off019_06_FF ; 01
- D 0 - I - 0x009939 02:9929: 5E 99     .word _off019_06_FF ; 02
- D 0 - I - 0x00993B 02:992B: 5D 99     .word _off019_06_FF ; 03
- D 0 - I - 0x00993D 02:992D: 5F 99     .word _off019_06_995F_04
- D 0 - I - 0x00993F 02:992F: 5D 99     .word _off019_06_FF ; 05
- D 0 - I - 0x009941 02:9931: 69 99     .word _off019_06_9969_06
- D 0 - I - 0x009943 02:9933: 5D 99     .word _off019_06_FF ; 07
- D 0 - I - 0x009945 02:9935: 70 99     .word _off019_06_9970_08
- D 0 - I - 0x009947 02:9937: 5D 99     .word _off019_06_FF ; 09
- D 0 - I - 0x009949 02:9939: 74 99     .word _off019_06_9974_0A
- D 0 - I - 0x00994B 02:993B: 5D 99     .word _off019_06_FF ; 0B
- D 0 - I - 0x00994D 02:993D: 7B 99     .word _off019_06_997B_0C
- D 0 - I - 0x00994F 02:993F: 5D 99     .word _off019_06_FF ; 0D
- D 0 - I - 0x009951 02:9941: 7F 99     .word _off019_06_997F_0E
- D 0 - I - 0x009953 02:9943: 5D 99     .word _off019_06_FF ; 0F
- D 0 - I - 0x009955 02:9945: 86 99     .word _off019_06_FF ; 10
- D 0 - I - 0x009957 02:9947: 5D 99     .word _off019_06_FF ; 11
- D 0 - I - 0x009959 02:9949: 87 99     .word _off019_06_9987_12
- D 0 - I - 0x00995B 02:994B: 5D 99     .word _off019_06_FF ; 13
- D 0 - I - 0x00995D 02:994D: 97 99     .word _off019_06_9997_14
- D 0 - I - 0x00995F 02:994F: 5D 99     .word _off019_06_FF ; 15
- D 0 - I - 0x009961 02:9951: A7 99     .word _off019_06_99A7_16
- D 0 - I - 0x009963 02:9953: 5D 99     .word _off019_06_FF ; 17
- D 0 - I - 0x009965 02:9955: B4 99     .word _off019_06_99B4_18
- D 0 - I - 0x009967 02:9957: 5D 99     .word _off019_06_FF ; 19
- D 0 - I - 0x009969 02:9959: B8 99     .word _off019_06_FF ; 1A
- D 0 - I - 0x00996B 02:995B: 5D 99     .word _off019_06_FF ; 1B



_off019_06_FF:
; cyneprepou4uk
- D 0 - I - 0x00996D 02:995D: FF        .byte $FF   ; end token



_off019_06_995F_04:
- D 0 - I - 0x00996F 02:995F: 8A        .byte $10 * $08 + $0A   ; pos YX
- D 0 - I - 0x009970 02:9960: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x009971 02:9961: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009972 02:9962: 86        .byte $10 * $08 + $06   ; pos YX
- D 0 - I - 0x009973 02:9963: A4        .byte $80 + $00 + $24   ; flags
- D 0 - I - 0x009974 02:9964: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009975 02:9965: E4        .byte $10 * $0E + $04   ; pos YX
- D 0 - I - 0x009976 02:9966: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009977 02:9967: 3B        .byte con_obj_id_2B   ; 

- D 0 - I - 0x009978 02:9968: FF        .byte $FF   ; end token



_off019_06_9969_06:
- D 0 - I - 0x009979 02:9969: 8B        .byte $10 * $08 + $0B   ; pos YX
- D 0 - I - 0x00997A 02:996A: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x00997B 02:996B: 3B        .byte con_obj_id_2B   ; 

- D 0 - I - 0x00997C 02:996C: D6        .byte $10 * $0D + $06   ; pos YX
- D 0 - I - 0x00997D 02:996D: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x00997E 02:996E: 3B        .byte con_obj_id_2B   ; 

- D 0 - I - 0x00997F 02:996F: FF        .byte $FF   ; end token



_off019_06_9970_08:
- D 0 - I - 0x009980 02:9970: 7B        .byte $10 * $07 + $0B   ; pos YX
- D 0 - I - 0x009981 02:9971: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009982 02:9972: 3B        .byte con_obj_id_2B   ; 

- D 0 - I - 0x009983 02:9973: FF        .byte $FF   ; end token



_off019_06_9974_0A:
- D 0 - I - 0x009984 02:9974: 14        .byte $10 * $01 + $04   ; pos YX
- D 0 - I - 0x009985 02:9975: 01        .byte $00 + $00 + $01   ; flags
- D 0 - I - 0x009986 02:9976: 3B        .byte con_obj_id_2B   ; 

- D 0 - I - 0x009987 02:9977: BB        .byte $10 * $0B + $0B   ; pos YX
- D 0 - I - 0x009988 02:9978: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009989 02:9979: 3B        .byte con_obj_id_2B   ; 

- D 0 - I - 0x00998A 02:997A: FF        .byte $FF   ; end token



_off019_06_997B_0C:
- D 0 - I - 0x00998B 02:997B: B8        .byte $10 * $0B + $08   ; pos YX
- D 0 - I - 0x00998C 02:997C: A2        .byte $80 + $00 + $22   ; flags
- D 0 - I - 0x00998D 02:997D: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00998E 02:997E: FF        .byte $FF   ; end token



_off019_06_997F_0E:
- D 0 - I - 0x00998F 02:997F: 8C        .byte $10 * $08 + $0C   ; pos YX
- D 0 - I - 0x009990 02:9980: A3        .byte $80 + $00 + $23   ; flags
- D 0 - I - 0x009991 02:9981: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009992 02:9982: 84        .byte $10 * $08 + $04   ; pos YX
- D 0 - I - 0x009993 02:9983: A0        .byte $80 + $00 + $20   ; flags
- D 0 - I - 0x009994 02:9984: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009995 02:9985: FF        .byte $FF   ; end token



_off019_06_9987_12:
- D 0 - I - 0x009997 02:9987: 7F        .byte $10 * $07 + $0F   ; pos YX
- D 0 - I - 0x009998 02:9988: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009999 02:9989: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x00999A 02:998A: 7B        .byte $10 * $07 + $0B   ; pos YX
- D 0 - I - 0x00999B 02:998B: A1        .byte $80 + $00 + $21   ; flags
- D 0 - I - 0x00999C 02:998C: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x00999D 02:998D: 77        .byte $10 * $07 + $07   ; pos YX
- D 0 - I - 0x00999E 02:998E: A4        .byte $80 + $00 + $24   ; flags
- D 0 - I - 0x00999F 02:998F: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x0099A0 02:9990: B1        .byte $10 * $0B + $01   ; pos YX
- D 0 - I - 0x0099A1 02:9991: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099A2 02:9992: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099A3 02:9993: B3        .byte $10 * $0B + $03   ; pos YX
- D 0 - I - 0x0099A4 02:9994: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099A5 02:9995: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099A6 02:9996: FF        .byte $FF   ; end token



_off019_06_9997_14:
- D 0 - I - 0x0099A7 02:9997: 09        .byte $10 * $00 + $09   ; pos YX
- D 0 - I - 0x0099A8 02:9998: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099A9 02:9999: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099AA 02:999A: 43        .byte $10 * $04 + $03   ; pos YX
- D 0 - I - 0x0099AB 02:999B: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099AC 02:999C: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099AD 02:999D: 49        .byte $10 * $04 + $09   ; pos YX
- D 0 - I - 0x0099AE 02:999E: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099AF 02:999F: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099B0 02:99A0: A5        .byte $10 * $0A + $05   ; pos YX
- D 0 - I - 0x0099B1 02:99A1: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099B2 02:99A2: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099B3 02:99A3: AF        .byte $10 * $0A + $0F   ; pos YX
- D 0 - I - 0x0099B4 02:99A4: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099B5 02:99A5: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099B6 02:99A6: FF        .byte $FF   ; end token



_off019_06_99A7_16:
- D 0 - I - 0x0099B7 02:99A7: 35        .byte $10 * $03 + $05   ; pos YX
- D 0 - I - 0x0099B8 02:99A8: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099B9 02:99A9: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099BA 02:99AA: 39        .byte $10 * $03 + $09   ; pos YX
- D 0 - I - 0x0099BB 02:99AB: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099BC 02:99AC: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099BD 02:99AD: 97        .byte $10 * $09 + $07   ; pos YX
- D 0 - I - 0x0099BE 02:99AE: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099BF 02:99AF: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099C0 02:99B0: 9F        .byte $10 * $09 + $0F   ; pos YX
- D 0 - I - 0x0099C1 02:99B1: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099C2 02:99B2: 3D        .byte con_obj_id_2D   ; 

- D 0 - I - 0x0099C3 02:99B3: FF        .byte $FF   ; end token



_off019_06_99B4_18:
- D 0 - I - 0x0099C4 02:99B4: 47        .byte $10 * $04 + $07   ; pos YX
- D 0 - I - 0x0099C5 02:99B5: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x0099C6 02:99B6: 51        .byte con_obj_id_3D   ; 

- D 0 - I - 0x0099C7 02:99B7: FF        .byte $FF   ; end token



_off013_99B9_07_area_8:
- - - - - - 0x0099C9 02:99B9: 39 9A     .word _off019_07_FF ; 00
- - - - - - 0x0099CB 02:99BB: 3A 9A     .word _off019_07_FF ; 01
- - - - - - 0x0099CD 02:99BD: 3B 9A     .word _off019_07_FF ; 02
- - - - - - 0x0099CF 02:99BF: 3C 9A     .word _off019_07_FF ; 03
- - - - - - 0x0099D1 02:99C1: 3D 9A     .word _off019_07_FF ; 04
- D 0 - I - 0x0099D3 02:99C3: 3E 9A     .word _off019_07_FF ; 05
- D 0 - I - 0x0099D5 02:99C5: 3F 9A     .word _off019_07_FF ; 06
- D 0 - I - 0x0099D7 02:99C7: 40 9A     .word _off019_07_FF ; 07
- - - - - - 0x0099D9 02:99C9: 41 9A     .word _off019_07_FF ; 08
- - - - - - 0x0099DB 02:99CB: 42 9A     .word _off019_07_FF ; 09
- - - - - - 0x0099DD 02:99CD: 43 9A     .word _off019_07_FF ; 0A
- - - - - - 0x0099DF 02:99CF: 44 9A     .word _off019_07_FF ; 0B
- - - - - - 0x0099E1 02:99D1: 45 9A     .word _off019_07_FF ; 0C
- - - - - - 0x0099E3 02:99D3: 46 9A     .word _off019_07_FF ; 0D
- - - - - - 0x0099E5 02:99D5: 47 9A     .word _off019_07_FF ; 0E
- - - - - - 0x0099E7 02:99D7: 48 9A     .word _off019_07_FF ; 0F
- - - - - - 0x0099E9 02:99D9: 49 9A     .word _off019_07_FF ; 10
- - - - - - 0x0099EB 02:99DB: 4A 9A     .word _off019_07_FF ; 11
- - - - - - 0x0099ED 02:99DD: 4B 9A     .word _off019_07_FF ; 12
- - - - - - 0x0099EF 02:99DF: 4C 9A     .word _off019_07_FF ; 13
- - - - - - 0x0099F1 02:99E1: 4D 9A     .word _off019_07_FF ; 14
- D 0 - I - 0x0099F3 02:99E3: 4E 9A     .word _off019_07_FF ; 15
- D 0 - I - 0x0099F5 02:99E5: 4F 9A     .word _off019_07_9A4F_16
- D 0 - I - 0x0099F7 02:99E7: 53 9A     .word _off019_07_9A53_17
- D 0 - I - 0x0099F9 02:99E9: 57 9A     .word _off019_07_9A57_18
- D 0 - I - 0x0099FB 02:99EB: 5E 9A     .word _off019_07_9A5E_19
- D 0 - I - 0x0099FD 02:99ED: 62 9A     .word _off019_07_9A62_1A
- D 0 - I - 0x0099FF 02:99EF: 66 9A     .word _off019_07_FF ; 1B
- D 0 - I - 0x009A01 02:99F1: 67 9A     .word _off019_07_9A67_1C
- D 0 - I - 0x009A03 02:99F3: 6B 9A     .word _off019_07_FF ; 1D
- - - - - - 0x009A05 02:99F5: 6C 9A     .word _off019_07_FF ; 1E
- - - - - - 0x009A07 02:99F7: 6D 9A     .word _off019_07_FF ; 1F
- - - - - - 0x009A09 02:99F9: 6E 9A     .word _off019_07_FF ; 20
- - - - - - 0x009A0B 02:99FB: 6F 9A     .word _off019_07_FF ; 21
- - - - - - 0x009A0D 02:99FD: 70 9A     .word _off019_07_FF ; 22
- D 0 - I - 0x009A0F 02:99FF: 71 9A     .word _off019_07_FF ; 23
- D 0 - I - 0x009A11 02:9A01: 72 9A     .word _off019_07_FF ; 24
- D 0 - I - 0x009A13 02:9A03: 73 9A     .word _off019_07_9A73_25
- D 0 - I - 0x009A15 02:9A05: 7D 9A     .word _off019_07_9A7D_26
- - - - - - 0x009A17 02:9A07: 81 9A     .word _off019_07_FF ; 27
- - - - - - 0x009A19 02:9A09: 82 9A     .word _off019_07_FF ; 28
- - - - - - 0x009A1B 02:9A0B: 83 9A     .word _off019_07_FF ; 29
- - - - - - 0x009A1D 02:9A0D: 84 9A     .word _off019_07_FF ; 2A
- D 0 - I - 0x009A1F 02:9A0F: 85 9A     .word _off019_07_FF ; 2B
- D 0 - I - 0x009A21 02:9A11: 86 9A     .word _off019_07_FF ; 2C
- D 0 - I - 0x009A23 02:9A13: 87 9A     .word _off019_07_FF ; 2D
- D 0 - I - 0x009A25 02:9A15: 88 9A     .word _off019_07_FF ; 2E
- - - - - - 0x009A27 02:9A17: 89 9A     .word _off019_07_FF ; 2F
- - - - - - 0x009A29 02:9A19: 8A 9A     .word _off019_07_FF ; 30
- D 0 - I - 0x009A2B 02:9A1B: 8B 9A     .word _off019_07_9A8B_31
- D 0 - I - 0x009A2D 02:9A1D: A4 9A     .word _off019_07_9AA4_32
- D 0 - I - 0x009A2F 02:9A1F: B7 9A     .word _off019_07_9AB7_33
- D 0 - I - 0x009A31 02:9A21: C4 9A     .word _off019_07_9AC4_34
- D 0 - I - 0x009A33 02:9A23: CE 9A     .word _off019_07_FF ; 35
- D 0 - I - 0x009A35 02:9A25: CF 9A     .word _off019_07_FF ; 36
- - - - - - 0x009A37 02:9A27: D0 9A     .word _off019_07_FF ; 37
- - - - - - 0x009A39 02:9A29: D1 9A     .word _off019_07_FF ; 38
- - - - - - 0x009A3B 02:9A2B: D2 9A     .word _off019_07_FF ; 39
- - - - - - 0x009A3D 02:9A2D: D3 9A     .word _off019_07_FF ; 3A
- - - - - - 0x009A3F 02:9A2F: D4 9A     .word _off019_07_FF ; 3B
- - - - - - 0x009A41 02:9A31: D5 9A     .word _off019_07_FF ; 3C
- - - - - - 0x009A43 02:9A33: D6 9A     .word _off019_07_FF ; 3D
- - - - - - 0x009A45 02:9A35: D7 9A     .word _off019_07_FF ; 3E
- - - - - - 0x009A47 02:9A37: D8 9A     .word _off019_07_FF ; 3F



_off019_07_FF:
; cyneprepou4uk
- - - - - - 0x009A49 02:9A39: FF        .byte $FF   ; end token



_off019_07_9A4F_16:
- D 0 - I - 0x009A5F 02:9A4F: 89        .byte $10 * $08 + $09   ; pos YX
- D 0 - I - 0x009A60 02:9A50: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009A61 02:9A51: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009A62 02:9A52: FF        .byte $FF   ; end token



_off019_07_9A53_17:
- D 0 - I - 0x009A63 02:9A53: A5        .byte $10 * $0A + $05   ; pos YX
- D 0 - I - 0x009A64 02:9A54: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009A65 02:9A55: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009A66 02:9A56: FF        .byte $FF   ; end token



_off019_07_9A57_18:
- D 0 - I - 0x009A67 02:9A57: 31        .byte $10 * $03 + $01   ; pos YX
- D 0 - I - 0x009A68 02:9A58: 93        .byte $80 + $00 + $13   ; flags
- D 0 - I - 0x009A69 02:9A59: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009A6A 02:9A5A: 71        .byte $10 * $07 + $01   ; pos YX
- D 0 - I - 0x009A6B 02:9A5B: 96        .byte $80 + $00 + $16   ; flags
- D 0 - I - 0x009A6C 02:9A5C: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009A6D 02:9A5D: FF        .byte $FF   ; end token



_off019_07_9A5E_19:
- D 0 - I - 0x009A6E 02:9A5E: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x009A6F 02:9A5F: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009A70 02:9A60: 49        .byte con_obj_id_39   ; 

- D 0 - I - 0x009A71 02:9A61: FF        .byte $FF   ; end token



_off019_07_9A62_1A:
- D 0 - I - 0x009A72 02:9A62: 48        .byte $10 * $04 + $08   ; pos YX
- D 0 - I - 0x009A73 02:9A63: C1        .byte $80 + $40 + $01   ; flags
- D 0 - I - 0x009A74 02:9A64: 49        .byte con_obj_id_39   ; 

- D 0 - I - 0x009A75 02:9A65: FF        .byte $FF   ; end token



_off019_07_9A67_1C:
- D 0 - I - 0x009A77 02:9A67: 88        .byte $10 * $08 + $08   ; pos YX
- D 0 - I - 0x009A78 02:9A68: C0        .byte $80 + $40 + $00   ; flags
- D 0 - I - 0x009A79 02:9A69: 6D        .byte con_obj_id_57   ; 

- D 0 - I - 0x009A7A 02:9A6A: FF        .byte $FF   ; end token



_off019_07_9A73_25:
- D 0 - I - 0x009A83 02:9A73: 87        .byte $10 * $08 + $07   ; pos YX
- D 0 - I - 0x009A84 02:9A74: 83        .byte $80 + $00 + $03   ; flags
- D 0 - I - 0x009A85 02:9A75: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009A86 02:9A76: A3        .byte $10 * $0A + $03   ; pos YX
- D 0 - I - 0x009A87 02:9A77: 92        .byte $80 + $00 + $12   ; flags
- D 0 - I - 0x009A88 02:9A78: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009A89 02:9A79: AF        .byte $10 * $0A + $0F   ; pos YX
- D 0 - I - 0x009A8A 02:9A7A: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009A8B 02:9A7B: 47        .byte con_obj_id_37   ; 

- D 0 - I - 0x009A8C 02:9A7C: FF        .byte $FF   ; end token



_off019_07_9A7D_26:
- D 0 - I - 0x009A8D 02:9A7D: 2B        .byte $10 * $02 + $0B   ; pos YX
- D 0 - I - 0x009A8E 02:9A7E: 86        .byte $80 + $00 + $06   ; flags
- D 0 - I - 0x009A8F 02:9A7F: 47        .byte con_obj_id_37   ; 

- D 0 - I - 0x009A90 02:9A80: FF        .byte $FF   ; end token



_off019_07_9A8B_31:
- D 0 - I - 0x009A9B 02:9A8B: 12        .byte $10 * $01 + $02   ; pos YX
- D 0 - I - 0x009A9C 02:9A8C: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009A9D 02:9A8D: 2A        .byte con_obj_id_1B   ; 

- D 0 - I - 0x009A9E 02:9A8E: 44        .byte $10 * $04 + $04   ; pos YX
- D 0 - I - 0x009A9F 02:9A8F: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AA0 02:9A90: 2A        .byte con_obj_id_1B   ; 

- D 0 - I - 0x009AA1 02:9A91: 46        .byte $10 * $04 + $06   ; pos YX
- D 0 - I - 0x009AA2 02:9A92: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x009AA3 02:9A93: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009AA4 02:9A94: 82        .byte $10 * $08 + $02   ; pos YX
- D 0 - I - 0x009AA5 02:9A95: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AA6 02:9A96: 2A        .byte con_obj_id_1B   ; 

- D 0 - I - 0x009AA7 02:9A97: A6        .byte $10 * $0A + $06   ; pos YX
- D 0 - I - 0x009AA8 02:9A98: 93        .byte $80 + $00 + $13   ; flags
- D 0 - I - 0x009AA9 02:9A99: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009AAA 02:9A9A: C4        .byte $10 * $0C + $04   ; pos YX
- D 0 - I - 0x009AAB 02:9A9B: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AAC 02:9A9C: 2A        .byte con_obj_id_1B   ; 

- D 0 - I - 0x009AAD 02:9A9D: C9        .byte $10 * $0C + $09   ; pos YX
- D 0 - I - 0x009AAE 02:9A9E: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009AAF 02:9A9F: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009AB0 02:9AA0: C3        .byte $10 * $0C + $03   ; pos YX
- D 0 - I - 0x009AB1 02:9AA1: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009AB2 02:9AA2: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009AB3 02:9AA3: FF        .byte $FF   ; end token



_off019_07_9AA4_32:
- D 0 - I - 0x009AB4 02:9AA4: 2D        .byte $10 * $02 + $0D   ; pos YX
- D 0 - I - 0x009AB5 02:9AA5: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009AB6 02:9AA6: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009AB7 02:9AA7: 22        .byte $10 * $02 + $02   ; pos YX
- D 0 - I - 0x009AB8 02:9AA8: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AB9 02:9AA9: 2A        .byte con_obj_id_1B   ; 

- D 0 - I - 0x009ABA 02:9AAA: 54        .byte $10 * $05 + $04   ; pos YX
- D 0 - I - 0x009ABB 02:9AAB: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009ABC 02:9AAC: 2A        .byte con_obj_id_1B   ; 

- D 0 - I - 0x009ABD 02:9AAD: 82        .byte $10 * $08 + $02   ; pos YX
- D 0 - I - 0x009ABE 02:9AAE: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009ABF 02:9AAF: 2A        .byte con_obj_id_1B   ; 

- D 0 - I - 0x009AC0 02:9AB0: B4        .byte $10 * $0B + $04   ; pos YX
- D 0 - I - 0x009AC1 02:9AB1: 00        .byte $00 + $00 + $00   ; flags
- D 0 - I - 0x009AC2 02:9AB2: 2A        .byte con_obj_id_1B   ; 

- D 0 - I - 0x009AC3 02:9AB3: A5        .byte $10 * $0A + $05   ; pos YX
- D 0 - I - 0x009AC4 02:9AB4: 81        .byte $80 + $00 + $01   ; flags
- D 0 - I - 0x009AC5 02:9AB5: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009AC6 02:9AB6: FF        .byte $FF   ; end token



_off019_07_9AB7_33:
- D 0 - I - 0x009AC7 02:9AB7: 23        .byte $10 * $02 + $03   ; pos YX
- D 0 - I - 0x009AC8 02:9AB8: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009AC9 02:9AB9: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009ACA 02:9ABA: 29        .byte $10 * $02 + $09   ; pos YX
- D 0 - I - 0x009ACB 02:9ABB: 80        .byte $80 + $00 + $00   ; flags
- D 0 - I - 0x009ACC 02:9ABC: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009ACD 02:9ABD: 5B        .byte $10 * $05 + $0B   ; pos YX
- D 0 - I - 0x009ACE 02:9ABE: 90        .byte $80 + $00 + $10   ; flags
- D 0 - I - 0x009ACF 02:9ABF: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009AD0 02:9AC0: 8B        .byte $10 * $08 + $0B   ; pos YX
- D 0 - I - 0x009AD1 02:9AC1: 94        .byte $80 + $00 + $14   ; flags
- D 0 - I - 0x009AD2 02:9AC2: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009AD3 02:9AC3: FF        .byte $FF   ; end token



_off019_07_9AC4_34:
- D 0 - I - 0x009AD4 02:9AC4: 2F        .byte $10 * $02 + $0F   ; pos YX
- D 0 - I - 0x009AD5 02:9AC5: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009AD6 02:9AC6: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009AD7 02:9AC7: 46        .byte $10 * $04 + $06   ; pos YX
- D 0 - I - 0x009AD8 02:9AC8: 91        .byte $80 + $00 + $11   ; flags
- D 0 - I - 0x009AD9 02:9AC9: 01        .byte con_obj_id_01   ; 

- D 0 - I - 0x009ADA 02:9ACA: 83        .byte $10 * $08 + $03   ; pos YX
- D 0 - I - 0x009ADB 02:9ACB: 82        .byte $80 + $00 + $02   ; flags
- D 0 - I - 0x009ADC 02:9ACC: 45        .byte con_obj_id_35   ; 

- D 0 - I - 0x009ADD 02:9ACD: FF        .byte $FF   ; end token


; номера экранов
_off004_0x009FC8_00_area_1:
- D 0 - I - 0x009FC8 02:9FB8: 0E        .byte $0E   ; столбцы
- D 0 - I - 0x009FC9 02:9FB9: 04        .byte $04   ; строки

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D
- - - - - - 0x009FCA 02:9FBA: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 0 - I - 0x009FD8 02:9FC8: 00        .byte $00, $00, $00, $00, $00, $00, $00, $09, $0A, $0E, $0B, $0F, $10, $11   ; 01 
- D 0 - I - 0x009FE6 02:9FD6: 01        .byte $01, $12, $00, $09, $0A, $0B, $0C, $05, $06, $0D, $07, $08, $00, $00   ; 02 
- D 0 - I - 0x009FF4 02:9FE4: 02        .byte $02, $03, $04, $05, $06, $07, $08, $00, $00, $00, $00, $00, $00, $00   ; 03 


; поинтеры на строение экрана из блоков
_off005_0x00A002_00_area_1:
- D 0 - I - 0x00A002 02:9FF2: 18 A0     .word _off018_00_A018_00
- D 0 - I - 0x00A004 02:9FF4: 58 A0     .word _off018_00_A058_01
- D 0 - I - 0x00A006 02:9FF6: 98 A0     .word _off018_00_A098_02
- D 0 - I - 0x00A008 02:9FF8: D8 A0     .word _off018_00_A0D8_03
- D 0 - I - 0x00A00A 02:9FFA: 18 A1     .word _off018_00_A118_04
- D 0 - I - 0x00A00C 02:9FFC: 58 A1     .word _off018_00_A158_05
- D 0 - I - 0x00A00E 02:9FFE: 98 A1     .word _off018_00_A198_06
- D 1 - I - 0x00A010 02:A000: D8 A1     .word _off018_00_A1D8_07
- D 1 - I - 0x00A012 02:A002: 18 A2     .word _off018_00_A218_08
- D 1 - I - 0x00A014 02:A004: 58 A2     .word _off018_00_A258_09
- D 1 - I - 0x00A016 02:A006: 98 A2     .word _off018_00_A298_0A
- D 1 - I - 0x00A018 02:A008: D8 A2     .word _off018_00_A2D8_0B
- D 1 - I - 0x00A01A 02:A00A: 18 A3     .word _off018_00_A318_0C
- D 1 - I - 0x00A01C 02:A00C: 58 A3     .word _off018_00_A358_0D
- D 1 - I - 0x00A01E 02:A00E: 98 A3     .word _off018_00_A398_0E
- D 1 - I - 0x00A020 02:A010: D8 A3     .word _off018_00_A3D8_0F
- D 1 - I - 0x00A022 02:A012: 18 A4     .word _off018_00_A418_10
- D 1 - I - 0x00A024 02:A014: 58 A4     .word _off018_00_A458_11
- D 1 - I - 0x00A026 02:A016: 98 A4     .word _off018_00_A498_12


; строение экрана из блоков
_off018_00_A018_00:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x00A028 02:A018: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x00A030 02:A020: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x00A038 02:A028: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- - - - - - 0x00A040 02:A030: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- - - - - - 0x00A048 02:A038: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- - - - - - 0x00A050 02:A040: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 05 
- - - - - - 0x00A058 02:A048: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 06 
- D 1 - I - 0x00A060 02:A050: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_00_A058_01:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A068 02:A058: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 1 - I - 0x00A070 02:A060: 40        .byte $40, $41, $42, $43, $50, $51, $52, $53   ; 01 
- D 1 - I - 0x00A078 02:A068: 44        .byte $44, $45, $46, $47, $54, $55, $44, $00   ; 02 
- D 1 - I - 0x00A080 02:A070: 48        .byte $48, $49, $4A, $4B, $58, $40, $48, $5B   ; 03 
- D 1 - I - 0x00A088 02:A078: 00        .byte $00, $00, $4E, $4F, $5C, $5D, $5E, $5F   ; 04 
- D 1 - I - 0x00A090 02:A080: 60        .byte $60, $61, $62, $63, $64, $65, $66, $67   ; 05 
- D 1 - I - 0x00A098 02:A088: 56        .byte $56, $59, $5A, $3F, $4C, $4D, $4C, $4D   ; 06 
- D 1 - I - 0x00A0A0 02:A090: 70        .byte $70, $00, $68, $69, $00, $00, $00, $00   ; 07 



_off018_00_A098_02:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A0A8 02:A098: 6D        .byte $6D, $00, $76, $6D, $00, $00, $00, $00   ; 00 
- D 1 - I - 0x00A0B0 02:A0A0: 74        .byte $74, $75, $76, $6D, $74, $75, $72, $73   ; 01 
- D 1 - I - 0x00A0B8 02:A0A8: 78        .byte $78, $79, $7A, $6F, $78, $79, $76, $77   ; 02 
- D 1 - I - 0x00A0C0 02:A0B0: 6E        .byte $6E, $79, $7A, $7B, $6E, $79, $7A, $7B   ; 03 
- D 1 - I - 0x00A0C8 02:A0B8: 7C        .byte $7C, $7D, $7E, $7F, $7C, $7D, $7E, $7F   ; 04 
- D 1 - I - 0x00A0D0 02:A0C0: 03        .byte $03, $05, $04, $05, $03, $05, $04, $05   ; 05 
- D 1 - I - 0x00A0D8 02:A0C8: 06        .byte $06, $07, $08, $09, $06, $07, $08, $09   ; 06 
- - - - - - 0x00A0E0 02:A0D0: 0A        .byte $0A, $0B, $0C, $0D, $0A, $0B, $0C, $0D   ; 07 



_off018_00_A0D8_03:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A0E8 02:A0D8: 00        .byte $00, $00, $00, $00, $00, $84, $85, $86   ; 00 
- D 1 - I - 0x00A0F0 02:A0E0: 70        .byte $70, $71, $72, $73, $00, $00, $00, $73   ; 01 
- D 1 - I - 0x00A0F8 02:A0E8: 74        .byte $74, $75, $76, $77, $74, $75, $72, $77   ; 02 
- D 1 - I - 0x00A100 02:A0F0: 78        .byte $78, $79, $7A, $7B, $78, $79, $7A, $7B   ; 03 
- D 1 - I - 0x00A108 02:A0F8: 7C        .byte $7C, $7D, $7E, $7F, $7C, $7D, $7E, $7F   ; 04 
- D 1 - I - 0x00A110 02:A100: 03        .byte $03, $05, $04, $05, $03, $05, $04, $05   ; 05 
- D 1 - I - 0x00A118 02:A108: 06        .byte $06, $07, $08, $09, $06, $07, $08, $09   ; 06 
- - - - - - 0x00A120 02:A110: 0A        .byte $0A, $0B, $0C, $0D, $0A, $0B, $0C, $0D   ; 07 



_off018_00_A118_04:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A128 02:A118: 87        .byte $87, $88, $89, $8A, $88, $89, $8A, $88   ; 00 
- D 1 - I - 0x00A130 02:A120: 70        .byte $70, $71, $72, $73, $00, $00, $00, $00   ; 01 
- D 1 - I - 0x00A138 02:A128: 74        .byte $74, $75, $76, $6D, $74, $6C, $00, $00   ; 02 
- D 1 - I - 0x00A140 02:A130: 78        .byte $78, $79, $7A, $7B, $78, $79, $80, $6A   ; 03 
- D 1 - I - 0x00A148 02:A138: 8E        .byte $8E, $8F, $90, $91, $7C, $7D, $7E, $7F   ; 04 
- D 1 - I - 0x00A150 02:A140: 24        .byte $24, $25, $26, $27, $03, $05, $04, $05   ; 05 
- D 1 - I - 0x00A158 02:A148: 28        .byte $28, $29, $2A, $2B, $06, $07, $08, $09   ; 06 
- - - - - - 0x00A160 02:A150: 2C        .byte $2C, $2D, $2E, $22, $0A, $0B, $0C, $0D   ; 07 



_off018_00_A158_05:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A168 02:A158: 89        .byte $89, $8A, $E8, $E9, $EA, $D2, $D3, $98   ; 00 
- D 1 - I - 0x00A170 02:A160: 00        .byte $00, $00, $99, $8C, $EE, $EF, $ED, $9C   ; 01 
- D 1 - I - 0x00A178 02:A168: 00        .byte $00, $94, $95, $96, $97, $15, $16, $14   ; 02 
- D 1 - I - 0x00A180 02:A170: 00        .byte $00, $98, $97, $9A, $9B, $14, $18, $19   ; 03 
- D 1 - I - 0x00A188 02:A178: 01        .byte $01, $0E, $9B, $14, $18, $19, $1A, $1B   ; 04 
- D 1 - I - 0x00A190 02:A180: 03        .byte $03, $0F, $10, $11, $1A, $1B, $1C, $1D   ; 05 
- D 1 - I - 0x00A198 02:A188: 06        .byte $06, $07, $3D, $3D, $1C, $1D, $36, $33   ; 06 
- - - - - - 0x00A1A0 02:A190: 0A        .byte $0A, $0B, $0C, $0D, $36, $33, $37, $30   ; 07 



_off018_00_A198_06:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A1A8 02:A198: 97        .byte $97, $13, $01, $9F, $A0, $9F, $A0, $02   ; 00 
- D 1 - I - 0x00A1B0 02:A1A0: 9B        .byte $9B, $17, $03, $05, $04, $05, $03, $05   ; 01 
- D 1 - I - 0x00A1B8 02:A1A8: 18        .byte $18, $19, $06, $07, $08, $09, $06, $07   ; 02 
- D 1 - I - 0x00A1C0 02:A1B0: 1A        .byte $1A, $1B, $37, $30, $1C, $1D, $37, $30   ; 03 
- D 1 - I - 0x00A1C8 02:A1B8: 1C        .byte $1C, $1D, $36, $33, $36, $33, $36, $33   ; 04 
- D 1 - I - 0x00A1D0 02:A1C0: 36        .byte $36, $33, $37, $30, $37, $30, $37, $30   ; 05 
- D 1 - I - 0x00A1D8 02:A1C8: 37        .byte $37, $30, $36, $33, $36, $33, $36, $33   ; 06 
- - - - - - 0x00A1E0 02:A1D0: 1E        .byte $1E, $1F, $37, $30, $37, $30, $37, $30   ; 07 



_off018_00_A1D8_07:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A1E8 02:A1D8: 01        .byte $01, $6B, $16, $14, $18, $19, $3D, $3D   ; 00 
- D 1 - I - 0x00A1F0 02:A1E0: 03        .byte $03, $0F, $10, $11, $1C, $1D, $3D, $3D   ; 01 
- D 1 - I - 0x00A1F8 02:A1E8: 06        .byte $06, $07, $3D, $3D, $0A, $0B, $0C, $0D   ; 02 
- D 1 - I - 0x00A200 02:A1F0: 0A        .byte $0A, $0B, $0C, $0D, $0A, $3A, $3B, $3C   ; 03 
- - - - - - 0x00A208 02:A1F8: 0A        .byte $0A, $3A, $3B, $3C, $0A, $3A, $3B, $3C   ; 04 
- - - - - - 0x00A210 02:A200: 0A        .byte $0A, $3A, $3B, $3C, $0A, $3A, $3B, $3C   ; 05 
- - - - - - 0x00A218 02:A208: 0A        .byte $0A, $3A, $3B, $3C, $0A, $3A, $3B, $3C   ; 06 
- - - - - - 0x00A220 02:A210: 0A        .byte $0A, $3A, $3B, $3C, $0A, $3A, $3B, $3C   ; 07 



_off018_00_A218_08:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A228 02:A218: 36        .byte $36, $33, $3D, $3D, $1E, $1F, $1C, $1D   ; 00 
- D 1 - I - 0x00A230 02:A220: 36        .byte $36, $33, $1C, $1D, $1E, $1F, $1E, $1F   ; 01 
- D 1 - I - 0x00A238 02:A228: 36        .byte $36, $33, $1E, $1F, $1E, $1F, $1E, $1F   ; 02 
- - - - - - 0x00A240 02:A230: 36        .byte $36, $33, $1E, $1F, $1E, $1F, $1E, $1F   ; 03 
- - - - - - 0x00A248 02:A238: 36        .byte $36, $33, $1E, $1F, $1E, $1F, $1E, $1F   ; 04 
- - - - - - 0x00A250 02:A240: 36        .byte $36, $33, $1E, $1F, $1E, $1F, $1E, $1F   ; 05 
- - - - - - 0x00A258 02:A248: 36        .byte $36, $33, $1E, $1F, $1E, $1F, $1E, $1F   ; 06 
- - - - - - 0x00A260 02:A250: 36        .byte $36, $33, $1E, $1F, $1E, $1F, $1E, $1F   ; 07 



_off018_00_A258_09:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x00A268 02:A258: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x00A270 02:A260: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x00A278 02:A268: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- - - - - - 0x00A280 02:A270: 00        .byte $00, $00, $00, $00, $00, $51, $52, $53   ; 03 
- - - - - - 0x00A288 02:A278: 51        .byte $51, $52, $53, $00, $CB, $00, $51, $53   ; 04 
- D 1 - I - 0x00A290 02:A280: 00        .byte $00, $00, $51, $52, $53, $CE, $CF, $00   ; 05 
- D 1 - I - 0x00A298 02:A288: D0        .byte $D0, $D1, $CB, $00, $D0, $D1, $00, $CB   ; 06 
- D 1 - I - 0x00A2A0 02:A290: 00        .byte $00, $D5, $00, $D2, $00, $D5, $00, $9D   ; 07 



_off018_00_A298_0A:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x00A2A8 02:A298: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x00A2B0 02:A2A0: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x00A2B8 02:A2A8: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 1 - I - 0x00A2C0 02:A2B0: CE        .byte $CE, $CF, $B3, $B4, $B5, $B5, $B5, $B6   ; 03 
- D 1 - I - 0x00A2C8 02:A2B8: 00        .byte $00, $00, $00, $AF, $B0, $B1, $B2, $D6   ; 04 
- D 1 - I - 0x00A2D0 02:A2C0: CC        .byte $CC, $CD, $A9, $AA, $AB, $AC, $AD, $AE   ; 05 
- D 1 - I - 0x00A2D8 02:A2C8: 00        .byte $00, $00, $00, $A7, $A8, $A7, $A8, $00   ; 06 
- D 1 - I - 0x00A2E0 02:A2D0: 9E        .byte $9E, $00, $00, $A5, $A6, $A5, $A6, $00   ; 07 



_off018_00_A2D8_0B:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x00A2E8 02:A2D8: 00        .byte $00, $00, $00, $00, $51, $52, $53, $00   ; 00 
- - - - - - 0x00A2F0 02:A2E0: 00        .byte $00, $51, $52, $53, $D0, $00, $D0, $D1   ; 01 
- D 1 - I - 0x00A2F8 02:A2E8: CB        .byte $CB, $00, $CB, $CB, $00, $CE, $CF, $D5   ; 02 
- D 1 - I - 0x00A300 02:A2F0: CE        .byte $CE, $CF, $00, $D2, $D3, $00, $94, $93   ; 03 
- D 1 - I - 0x00A308 02:A2F8: 81        .byte $81, $D2, $D3, $00, $D2, $D3, $98, $97   ; 04 
- D 1 - I - 0x00A310 02:A300: 85        .byte $85, $86, $87, $88, $EC, $ED, $9C, $9B   ; 05 
- D 1 - I - 0x00A318 02:A308: 00        .byte $00, $00, $00, $12, $2F, $38, $14, $10   ; 06 
- D 1 - I - 0x00A320 02:A310: 00        .byte $00, $12, $2F, $38, $34, $39, $31, $32   ; 07 



_off018_00_A318_0C:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A328 02:A318: C5        .byte $C5, $C6, $C7, $C7, $C8, $C7, $C9, $82   ; 00 
- D 1 - I - 0x00A330 02:A320: 00        .byte $00, $C0, $C1, $C1, $C3, $C4, $8D, $00   ; 01 
- D 1 - I - 0x00A338 02:A328: B9        .byte $B9, $BA, $BB, $BC, $BD, $BE, $BF, $00   ; 02 
- D 1 - I - 0x00A340 02:A330: 00        .byte $00, $B7, $B8, $00, $B7, $B8, $00, $00   ; 03 
- D 1 - I - 0x00A348 02:A338: 13        .byte $13, $A1, $A2, $01, $9F, $A0, $02, $01   ; 04 
- D 1 - I - 0x00A350 02:A340: 17        .byte $17, $04, $05, $04, $05, $04, $05, $3E   ; 05 
- D 1 - I - 0x00A358 02:A348: 11        .byte $11, $08, $09, $08, $09, $08, $09, $3D   ; 06 
- D 1 - I - 0x00A360 02:A350: 1C        .byte $1C, $1D, $3D, $3D, $1C, $1D, $3D, $3D   ; 07 



_off018_00_A358_0D:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A368 02:A358: 20        .byte $20, $21, $A3, $A4, $01, $9F, $A0, $02   ; 00 
- D 1 - I - 0x00A370 02:A360: 24        .byte $24, $25, $26, $27, $03, $05, $04, $05   ; 01 
- D 1 - I - 0x00A378 02:A368: 28        .byte $28, $29, $2A, $2B, $06, $07, $08, $09   ; 02 
- D 1 - I - 0x00A380 02:A370: 2C        .byte $2C, $2D, $2E, $22, $0A, $0B, $0C, $0D   ; 03 
- - - - - - 0x00A388 02:A378: 3D        .byte $3D, $3D, $35, $32, $1E, $3A, $3B, $3C   ; 04 
- - - - - - 0x00A390 02:A380: 1C        .byte $1C, $1D, $36, $33, $1E, $3A, $3B, $3C   ; 05 
- - - - - - 0x00A398 02:A388: 1E        .byte $1E, $1F, $36, $33, $1E, $3A, $3B, $3C   ; 06 
- - - - - - 0x00A3A0 02:A390: 1E        .byte $1E, $1F, $36, $33, $1E, $3A, $3B, $3C   ; 07 



_off018_00_A398_0E:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x00A3A8 02:A398: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x00A3B0 02:A3A0: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x00A3B8 02:A3A8: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 1 - I - 0x00A3C0 02:A3B0: 00        .byte $00, $B3, $B4, $B5, $B5, $B5, $B5, $B6   ; 03 
- D 1 - I - 0x00A3C8 02:A3B8: 81        .byte $81, $8B, $AF, $B0, $B0, $B1, $B2, $D6   ; 04 
- D 1 - I - 0x00A3D0 02:A3C0: 85        .byte $85, $83, $AA, $AB, $AB, $AC, $AD, $AE   ; 05 
- D 1 - I - 0x00A3D8 02:A3C8: 00        .byte $00, $00, $A7, $A8, $00, $A7, $A8, $00   ; 06 
- D 1 - I - 0x00A3E0 02:A3D0: 00        .byte $00, $00, $A5, $A6, $00, $A5, $A6, $00   ; 07 



_off018_00_A3D8_0F:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A3E8 02:A3D8: C5        .byte $C5, $C6, $C7, $C7, $C8, $C7, $CA, $00   ; 00 
- D 1 - I - 0x00A3F0 02:A3E0: 00        .byte $00, $C0, $C1, $C1, $C3, $C4, $00, $00   ; 01 
- D 1 - I - 0x00A3F8 02:A3E8: B9        .byte $B9, $BA, $BB, $BC, $BD, $BE, $BF, $00   ; 02 
- D 1 - I - 0x00A400 02:A3F0: 00        .byte $00, $B7, $B8, $00, $B7, $B8, $00, $00   ; 03 
- D 1 - I - 0x00A408 02:A3F8: 13        .byte $13, $A1, $A2, $01, $9F, $A0, $02, $01   ; 04 
- D 1 - I - 0x00A410 02:A400: 17        .byte $17, $04, $05, $04, $05, $04, $05, $03   ; 05 
- D 1 - I - 0x00A418 02:A408: 11        .byte $11, $08, $09, $08, $09, $08, $09, $06   ; 06 
- D 1 - I - 0x00A420 02:A410: 1C        .byte $1C, $1D, $3D, $3D, $1C, $1D, $3D, $0A   ; 07 



_off018_00_A418_10:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A428 02:A418: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 1 - I - 0x00A430 02:A420: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- D 1 - I - 0x00A438 02:A428: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- D 1 - I - 0x00A440 02:A430: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- D 1 - I - 0x00A448 02:A438: 02        .byte $02, $20, $21, $21, $23, $01, $01, $02   ; 04 
- D 1 - I - 0x00A450 02:A440: 05        .byte $05, $24, $25, $26, $27, $3E, $04, $05   ; 05 
- D 1 - I - 0x00A458 02:A448: 07        .byte $07, $28, $29, $2A, $2B, $3D, $08, $09   ; 06 
- - - - - - 0x00A460 02:A450: 0B        .byte $0B, $0C, $2D, $2E, $22, $1C, $1D, $0D   ; 07 



_off018_00_A458_11:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A468 02:A458: CE        .byte $CE, $CF, $D2, $D3, $DC, $D9, $DA, $DB   ; 00 
- D 1 - I - 0x00A470 02:A460: D6        .byte $D6, $81, $CB, $CD, $DC, $DD, $DD, $DE   ; 01 
- D 1 - I - 0x00A478 02:A468: 84        .byte $84, $85, $86, $87, $D8, $E0, $DD, $DE   ; 02 
- D 1 - I - 0x00A480 02:A470: D4        .byte $D4, $92, $92, $93, $D7, $E1, $EB, $DB   ; 03 
- D 1 - I - 0x00A488 02:A478: A1        .byte $A1, $A2, $A1, $A2, $E7, $E2, $EB, $DE   ; 04 
- D 1 - I - 0x00A490 02:A480: 03        .byte $03, $05, $04, $05, $03, $E3, $E4, $DF   ; 05 
- D 1 - I - 0x00A498 02:A488: 06        .byte $06, $07, $08, $09, $06, $07, $E5, $DB   ; 06 
- - - - - - 0x00A4A0 02:A490: 0A        .byte $0A, $0B, $0C, $0D, $0A, $0B, $E6, $DE   ; 07 



_off018_00_A498_12:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x00A4A8 02:A498: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- D 1 - I - 0x00A4B0 02:A4A0: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- D 1 - I - 0x00A4B8 02:A4A8: D2        .byte $D2, $D3, $00, $00, $00, $00, $00, $00   ; 02 
- D 1 - I - 0x00A4C0 02:A4B0: CD        .byte $CD, $00, $CE, $CF, $00, $00, $00, $00   ; 03 
- D 1 - I - 0x00A4C8 02:A4B8: 5F        .byte $5F, $5F, $5F, $5F, $00, $00, $00, $00   ; 04 
- D 1 - I - 0x00A4D0 02:A4C0: 66        .byte $66, $66, $66, $66, $00, $00, $00, $00   ; 05 
- D 1 - I - 0x00A4D8 02:A4C8: 4C        .byte $4C, $4D, $4C, $4D, $00, $00, $00, $00   ; 06 
- D 1 - I - 0x00A4E0 02:A4D0: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off006_0x00A4E8_00_area_1:
; 00
- D 1 - I - 0x00A4E8 02:A4D8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A4EC 02:A4DC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A4F0 02:A4E0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A4F4 02:A4E4: 00        .byte $00, $00, $00, $00   ; 
; 01 
- D 1 - I - 0x00A4F8 02:A4E8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A4FC 02:A4EC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A500 02:A4F0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A504 02:A4F4: F7        .byte $F7, $F7, $F7, $F7   ; 
; 02 
- D 1 - I - 0x00A508 02:A4F8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A50C 02:A4FC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A510 02:A500: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A514 02:A504: DF        .byte $DF, $F7, $F7, $F7   ; 
; 03 
- D 1 - I - 0x00A518 02:A508: BD        .byte $BD, $BD, $BD, $BD   ; 
- D 1 - I - 0x00A51C 02:A50C: BD        .byte $BD, $BD, $BD, $BD   ; 
- D 1 - I - 0x00A520 02:A510: C0        .byte $C0, $C0, $C0, $C0   ; 
- D 1 - I - 0x00A524 02:A514: 9D        .byte $9D, $9E, $9E, $E6   ; 
; 04 
- D 1 - I - 0x00A528 02:A518: BD        .byte $BD, $BD, $BD, $BD   ; 
- D 1 - I - 0x00A52C 02:A51C: BD        .byte $BD, $BD, $BD, $BD   ; 
- D 1 - I - 0x00A530 02:A520: C0        .byte $C0, $C0, $C0, $C0   ; 
- D 1 - I - 0x00A534 02:A524: 9D        .byte $9D, $9E, $9E, $E5   ; 
; 05 
- D 1 - I - 0x00A538 02:A528: BE        .byte $BE, $E0, $BD, $BD   ; 
- D 1 - I - 0x00A53C 02:A52C: BD        .byte $BD, $BE, $E0, $BD   ; 
- D 1 - I - 0x00A540 02:A530: C0        .byte $C0, $C0, $A7, $E1   ; 
- D 1 - I - 0x00A544 02:A534: B9        .byte $B9, $E7, $9E, $E9   ; 
; 06 
- D 1 - I - 0x00A548 02:A538: A8        .byte $A8, $A1, $A1, $EA   ; 
- D 1 - I - 0x00A54C 02:A53C: A9        .byte $A9, $E2, $AA, $EA   ; 
- D 1 - I - 0x00A550 02:A540: A9        .byte $A9, $AA, $AA, $EA   ; 
- D 1 - I - 0x00A554 02:A544: F1        .byte $F1, $F2, $F2, $EA   ; 
; 07 
- D 1 - I - 0x00A558 02:A548: AB        .byte $AB, $EB, $A1, $F6   ; 
- D 1 - I - 0x00A55C 02:A54C: AA        .byte $AA, $EB, $AA, $9C   ; 
- D 1 - I - 0x00A560 02:A550: AB        .byte $AB, $EB, $AA, $F5   ; 
- D 1 - I - 0x00A564 02:A554: AA        .byte $AA, $EB, $F3, $F4   ; 
; 08 
- D 1 - I - 0x00A568 02:A558: A8        .byte $A8, $A1, $A1, $BA   ; 
- D 1 - I - 0x00A56C 02:A55C: A9        .byte $A9, $E2, $AA, $E2   ; 
- D 1 - I - 0x00A570 02:A560: A9        .byte $A9, $AA, $AA, $AA   ; 
- D 1 - I - 0x00A574 02:A564: F1        .byte $F1, $F2, $F2, $F3   ; 
; 09 
- D 1 - I - 0x00A578 02:A568: AC        .byte $AC, $AC, $A1, $F6   ; 
- D 1 - I - 0x00A57C 02:A56C: AA        .byte $AA, $E2, $AA, $9C   ; 
- D 1 - I - 0x00A580 02:A570: AA        .byte $AA, $AA, $B0, $F5   ; 
- D 1 - I - 0x00A584 02:A574: F3        .byte $F3, $F3, $F3, $F4   ; 
; 0A 
- D 1 - I - 0x00A588 02:A578: B1        .byte $B1, $B2, $B2, $EC   ; 
- D 1 - I - 0x00A58C 02:A57C: B3        .byte $B3, $E2, $AA, $EA   ; 
- D 1 - I - 0x00A590 02:A580: B3        .byte $B3, $AA, $AA, $EA   ; 
- D 1 - I - 0x00A594 02:A584: B3        .byte $B3, $AA, $AA, $EA   ; 
; 0B 
- D 1 - I - 0x00A598 02:A588: AE        .byte $AE, $ED, $BD, $BD   ; 
- D 1 - I - 0x00A59C 02:A58C: AB        .byte $AB, $EE, $A8, $A1   ; 
- D 1 - I - 0x00A5A0 02:A590: AA        .byte $AA, $EE, $A9, $E2   ; 
- D 1 - I - 0x00A5A4 02:A594: AB        .byte $AB, $EE, $A9, $AA   ; 
; 0C 
- D 1 - I - 0x00A5A8 02:A598: BD        .byte $BD, $EF, $AF, $F6   ; 
- D 1 - I - 0x00A5AC 02:A59C: A1        .byte $A1, $F6, $F0, $9C   ; 
- D 1 - I - 0x00A5B0 02:A5A0: AA        .byte $AA, $F5, $AD, $AD   ; 
- D 1 - I - 0x00A5B4 02:A5A4: B0        .byte $B0, $F5, $00, $9C   ; 
; 0D 
- D 1 - I - 0x00A5B8 02:A5A8: B1        .byte $B1, $B2, $B2, $F6   ; 
- D 1 - I - 0x00A5BC 02:A5AC: B3        .byte $B3, $E6, $B9, $E8   ; 
- D 1 - I - 0x00A5C0 02:A5B0: AD        .byte $AD, $DE, $AA, $EB   ; 
- D 1 - I - 0x00A5C4 02:A5B4: B3        .byte $B3, $EA, $AA, $EB   ; 
; 0E 
- D 1 - I - 0x00A5C8 02:A5B8: 15        .byte $15, $A8, $74, $A1   ; 
- D 1 - I - 0x00A5CC 02:A5BC: 15        .byte $15, $A9, $40, $41   ; 
- D 1 - I - 0x00A5D0 02:A5C0: 21        .byte $21, $46, $02, $5F   ; 
- D 1 - I - 0x00A5D4 02:A5C4: E4        .byte $E4, $5F, $BD, $BD   ; 
; 0F 
- D 1 - I - 0x00A5D8 02:A5C8: BE        .byte $BE, $E0, $F8, $BD   ; 
- D 1 - I - 0x00A5DC 02:A5CC: BD        .byte $BD, $BE, $E0, $BD   ; 
- D 1 - I - 0x00A5E0 02:A5D0: C0        .byte $C0, $C0, $A7, $5A   ; 
- D 1 - I - 0x00A5E4 02:A5D4: B9        .byte $B9, $E7, $9E, $E9   ; 
; 10 
- D 1 - I - 0x00A5E8 02:A5D8: FA        .byte $FA, $BD, $B5, $62   ; 
- D 1 - I - 0x00A5EC 02:A5DC: B5        .byte $B5, $62, $B6, $63   ; 
- D 1 - I - 0x00A5F0 02:A5E0: B6        .byte $B6, $63, $B7, $64   ; 
- D 1 - I - 0x00A5F4 02:A5E4: DC        .byte $DC, $DD, $5B, $F2   ; 
; 11 
- D 1 - I - 0x00A5F8 02:A5E8: B6        .byte $B6, $63, $B7, $5D   ; 
- D 1 - I - 0x00A5FC 02:A5EC: B7        .byte $B7, $64, $B8, $9C   ; 
- D 1 - I - 0x00A600 02:A5F0: B8        .byte $B8, $AA, $B0, $F5   ; 
- D 1 - I - 0x00A604 02:A5F4: F2        .byte $F2, $F2, $F3, $F4   ; 
; 12 
- D 1 - I - 0x00A608 02:A5F8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A60C 02:A5FC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A610 02:A600: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A614 02:A604: 00        .byte $00, $00, $01, $5E   ; 
; 13 
- D 1 - I - 0x00A618 02:A608: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A61C 02:A60C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A620 02:A610: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A624 02:A614: DA        .byte $DA, $F7, $F7, $F7   ; 
; 14 
- D 1 - I - 0x00A628 02:A618: FD        .byte $FD, $E0, $F8, $BD   ; 
- D 1 - I - 0x00A62C 02:A61C: BD        .byte $BD, $BE, $E0, $BD   ; 
- D 1 - I - 0x00A630 02:A620: FA        .byte $FA, $BD, $B4, $61   ; 
- D 1 - I - 0x00A634 02:A624: B5        .byte $B5, $62, $B6, $5C   ; 
; 15 
- D 1 - I - 0x00A638 02:A628: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A63C 02:A62C: 00        .byte $00, $00, $01, $5E   ; 
- D 1 - I - 0x00A640 02:A630: 01        .byte $01, $5E, $02, $5F   ; 
- D 1 - I - 0x00A644 02:A634: 60        .byte $60, $5F, $BD, $BD   ; 
; 16 
- D 1 - I - 0x00A648 02:A638: 01        .byte $01, $5E, $02, $5F   ; 
- D 1 - I - 0x00A64C 02:A63C: 02        .byte $02, $5F, $BD, $BD   ; 
- D 1 - I - 0x00A650 02:A640: FC        .byte $FC, $BD, $F8, $BD   ; 
- D 1 - I - 0x00A654 02:A644: BD        .byte $BD, $BD, $BD, $BD   ; 
; 17 
- D 1 - I - 0x00A658 02:A648: FD        .byte $FD, $E0, $BD, $BD   ; 
- D 1 - I - 0x00A65C 02:A64C: BD        .byte $BD, $BE, $E0, $BD   ; 
- D 1 - I - 0x00A660 02:A650: FA        .byte $FA, $BD, $B4, $DB   ; 
- D 1 - I - 0x00A664 02:A654: B5        .byte $B5, $62, $B6, $5C   ; 
; 18 
- D 1 - I - 0x00A668 02:A658: FA        .byte $FA, $BD, $B5, $62   ; 
- D 1 - I - 0x00A66C 02:A65C: B5        .byte $B5, $62, $B6, $63   ; 
- D 1 - I - 0x00A670 02:A660: B6        .byte $B6, $63, $B7, $64   ; 
- D 1 - I - 0x00A674 02:A664: B7        .byte $B7, $64, $B8, $AA   ; 
; 19 
- D 1 - I - 0x00A678 02:A668: B6        .byte $B6, $63, $B7, $5D   ; 
- D 1 - I - 0x00A67C 02:A66C: B7        .byte $B7, $64, $B8, $9C   ; 
- D 1 - I - 0x00A680 02:A670: B8        .byte $B8, $AA, $AA, $9C   ; 
- D 1 - I - 0x00A684 02:A674: AA        .byte $AA, $E2, $AA, $9C   ; 
; 1A 
- D 1 - I - 0x00A688 02:A678: B1        .byte $B1, $AA, $AA, $E2   ; 
- D 1 - I - 0x00A68C 02:A67C: A9        .byte $A9, $E2, $AA, $AA   ; 
- D 1 - I - 0x00A690 02:A680: A9        .byte $A9, $AA, $AA, $AA   ; 
- D 1 - I - 0x00A694 02:A684: F1        .byte $F1, $F2, $F2, $F2   ; 
; 1B 
- D 1 - I - 0x00A698 02:A688: AA        .byte $AA, $AA, $AA, $9C   ; 
- D 1 - I - 0x00A69C 02:A68C: AA        .byte $AA, $AA, $AA, $F5   ; 
- D 1 - I - 0x00A6A0 02:A690: AA        .byte $AA, $AA, $B0, $F5   ; 
- D 1 - I - 0x00A6A4 02:A694: F3        .byte $F3, $F3, $F3, $F4   ; 
; 1C 
- D 1 - I - 0x00A6A8 02:A698: A8        .byte $A8, $A1, $A1, $E6   ; 
- D 1 - I - 0x00A6AC 02:A69C: A9        .byte $A9, $E2, $AA, $EA   ; 
- D 1 - I - 0x00A6B0 02:A6A0: A9        .byte $A9, $AA, $AA, $EA   ; 
- D 1 - I - 0x00A6B4 02:A6A4: B3        .byte $B3, $AA, $AA, $EA   ; 
; 1D 
- D 1 - I - 0x00A6B8 02:A6A8: B9        .byte $B9, $E7, $A1, $F6   ; 
- D 1 - I - 0x00A6BC 02:A6AC: AB        .byte $AB, $EB, $AA, $9C   ; 
- D 1 - I - 0x00A6C0 02:A6B0: AA        .byte $AA, $EB, $AA, $9C   ; 
- D 1 - I - 0x00A6C4 02:A6B4: AB        .byte $AB, $EB, $AA, $9C   ; 
; 1E 
- D 1 - I - 0x00A6C8 02:A6B8: B1        .byte $B1, $B2, $B2, $EC   ; 
- D 1 - I - 0x00A6CC 02:A6BC: B3        .byte $B3, $E2, $AA, $EA   ; 
- D 1 - I - 0x00A6D0 02:A6C0: B3        .byte $B3, $AA, $AA, $EA   ; 
- D 1 - I - 0x00A6D4 02:A6C4: B3        .byte $B3, $AA, $AA, $EA   ; 
; 1F 
- D 1 - I - 0x00A6D8 02:A6C8: AE        .byte $AE, $E3, $B2, $F6   ; 
- D 1 - I - 0x00A6DC 02:A6CC: AB        .byte $AB, $EB, $AA, $9C   ; 
- D 1 - I - 0x00A6E0 02:A6D0: AA        .byte $AA, $EB, $AA, $9C   ; 
- D 1 - I - 0x00A6E4 02:A6D4: AB        .byte $AB, $EB, $AA, $9C   ; 
; 20 
- D 1 - I - 0x00A6E8 02:A6D8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A6EC 02:A6DC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A6F0 02:A6E0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A6F4 02:A6E4: F7        .byte $F7, $DF, $65, $65   ; 
; 21 
- D 1 - I - 0x00A6F8 02:A6E8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A6FC 02:A6EC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A700 02:A6F0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A704 02:A6F4: 65        .byte $65, $65, $65, $65   ; 
; 22 
- - - - - - 0x00A708 02:A6F8: BA        .byte $BA, $AC, $AC, $9C   ; 
- - - - - - 0x00A70C 02:A6FC: AA        .byte $AA, $E2, $AA, $9C   ; 
- - - - - - 0x00A710 02:A700: AA        .byte $AA, $AA, $AA, $9C   ; 
- - - - - - 0x00A714 02:A704: AA        .byte $AA, $AA, $AA, $F5   ; 
; 23 
- D 1 - I - 0x00A718 02:A708: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A71C 02:A70C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A720 02:A710: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A724 02:A714: 66        .byte $66, $F7, $F7, $F7   ; 
; 24 
- D 1 - I - 0x00A728 02:A718: BD        .byte $BD, $BE, $BF, $03   ; 
- D 1 - I - 0x00A72C 02:A71C: BD        .byte $BD, $BD, $BE, $67   ; 
- D 1 - I - 0x00A730 02:A720: C0        .byte $C0, $C0, $C0, $A7   ; 
- D 1 - I - 0x00A734 02:A724: 9D        .byte $9D, $9E, $9E, $9E   ; 
; 25 
- D 1 - I - 0x00A738 02:A728: 03        .byte $03, $03, $03, $03   ; 
- D 1 - I - 0x00A73C 02:A72C: 68        .byte $68, $AA, $AA, $AA   ; 
- D 1 - I - 0x00A740 02:A730: 04        .byte $04, $69, $05, $AA   ; 
- D 1 - I - 0x00A744 02:A734: A3        .byte $A3, $00, $6A, $06   ; 
; 26 
- D 1 - I - 0x00A748 02:A738: 03        .byte $03, $03, $03, $03   ; 
- D 1 - I - 0x00A74C 02:A73C: AA        .byte $AA, $AA, $AA, $06   ; 
- D 1 - I - 0x00A750 02:A740: 05        .byte $05, $06, $06, $6B   ; 
- D 1 - I - 0x00A754 02:A744: 06        .byte $06, $6B, $6B, $6B   ; 
; 27 
- D 1 - I - 0x00A758 02:A748: 08        .byte $08, $72, $BD, $BD   ; 
- D 1 - I - 0x00A75C 02:A74C: 07        .byte $07, $A0, $73, $BD   ; 
- D 1 - I - 0x00A760 02:A750: 07        .byte $07, $A6, $A0, $F9   ; 
- D 1 - I - 0x00A764 02:A754: 07        .byte $07, $6B, $AA, $A0   ; 
; 28 
- D 1 - I - 0x00A768 02:A758: A8        .byte $A8, $A1, $A1, $A1   ; 
- D 1 - I - 0x00A76C 02:A75C: A9        .byte $A9, $E2, $AA, $FB   ; 
- D 1 - I - 0x00A770 02:A760: B3        .byte $B3, $AA, $AA, $FE   ; 
- D 1 - I - 0x00A774 02:A764: F1        .byte $F1, $F2, $F2, $F3   ; 
; 29 
- D 1 - I - 0x00A778 02:A768: A3        .byte $A3, $00, $A2, $6C   ; 
- D 1 - I - 0x00A77C 02:A76C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A780 02:A770: BC        .byte $BC, $FF, $BB, $BB   ; 
- D 1 - I - 0x00A784 02:A774: F3        .byte $F3, $F4, $9D, $E5   ; 
; 2A 
- D 1 - I - 0x00A788 02:A778: A4        .byte $A4, $A4, $A4, $A5   ; 
- D 1 - I - 0x00A78C 02:A77C: 6E        .byte $6E, $BD, $BD, $BD   ; 
- D 1 - I - 0x00A790 02:A780: BB        .byte $BB, $71, $C0, $C0   ; 
- D 1 - I - 0x00A794 02:A784: B9        .byte $B9, $E7, $9E, $9E   ; 
; 2B 
- D 1 - I - 0x00A798 02:A788: A5        .byte $A5, $6D, $A6, $AA   ; 
- D 1 - I - 0x00A79C 02:A78C: BD        .byte $BD, $6F, $6D, $AA   ; 
- D 1 - I - 0x00A7A0 02:A790: C0        .byte $C0, $C0, $A7, $70   ; 
- D 1 - I - 0x00A7A4 02:A794: E5        .byte $E5, $B9, $E7, $E9   ; 
; 2C 
- D 1 - I - 0x00A7A8 02:A798: B1        .byte $B1, $B2, $B2, $B2   ; 
- D 1 - I - 0x00A7AC 02:A79C: B3        .byte $B3, $AA, $AA, $AB   ; 
- - - - - - 0x00A7B0 02:A7A0: B3        .byte $B3, $AA, $AA, $AB   ; 
- - - - - - 0x00A7B4 02:A7A4: B3        .byte $B3, $AA, $AA, $AB   ; 
; 2D 
- - - - - - 0x00A7B8 02:A7A8: B2        .byte $B2, $F6, $A8, $BA   ; 
- - - - - - 0x00A7BC 02:A7AC: AA        .byte $AA, $9C, $B3, $AA   ; 
- - - - - - 0x00A7C0 02:A7B0: AA        .byte $AA, $9C, $B3, $AA   ; 
- - - - - - 0x00A7C4 02:A7B4: AA        .byte $AA, $9C, $B3, $AA   ; 
; 2E 
- - - - - - 0x00A7C8 02:A7B8: AC        .byte $AC, $AC, $B2, $B2   ; 
- - - - - - 0x00A7CC 02:A7BC: E2        .byte $E2, $AA, $AA, $AA   ; 
- - - - - - 0x00A7D0 02:A7C0: AA        .byte $AA, $AA, $AA, $AA   ; 
- - - - - - 0x00A7D4 02:A7C4: AA        .byte $AA, $AA, $AA, $AA   ; 
; 2F 
- D 1 - I - 0x00A7D8 02:A7C8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A7DC 02:A7CC: 00        .byte $00, $00, $01, $5E   ; 
- D 1 - I - 0x00A7E0 02:A7D0: 01        .byte $01, $5E, $02, $5F   ; 
- D 1 - I - 0x00A7E4 02:A7D4: 02        .byte $02, $5F, $BD, $BD   ; 
; 30 
- D 1 - I - 0x00A7E8 02:A7D8: AA        .byte $AA, $EB, $AA, $9C   ; 
- D 1 - I - 0x00A7EC 02:A7DC: AB        .byte $AB, $EB, $AA, $9C   ; 
- D 1 - I - 0x00A7F0 02:A7E0: AA        .byte $AA, $EB, $AA, $9C   ; 
- D 1 - I - 0x00A7F4 02:A7E4: AB        .byte $AB, $EB, $AA, $F5   ; 
; 31 
- D 1 - I - 0x00A7F8 02:A7E8: B6        .byte $B6, $63, $B7, $64   ; 
- D 1 - I - 0x00A7FC 02:A7EC: DC        .byte $DC, $DD, $5B, $F2   ; 
- - - - - - 0x00A800 02:A7F0: A8        .byte $A8, $A1, $A1, $E6   ; 
- - - - - - 0x00A804 02:A7F4: F1        .byte $F1, $E2, $AA, $EA   ; 
; 32 
- D 1 - I - 0x00A808 02:A7F8: B8        .byte $B8, $AA, $B0, $F5   ; 
- D 1 - I - 0x00A80C 02:A7FC: F2        .byte $F2, $F2, $F3, $F4   ; 
- - - - - - 0x00A810 02:A800: B9        .byte $B9, $E7, $A1, $F6   ; 
- - - - - - 0x00A814 02:A804: AB        .byte $AB, $EB, $AA, $9C   ; 
; 33 
- D 1 - I - 0x00A818 02:A808: AA        .byte $AA, $EB, $AA, $F5   ; 
- D 1 - I - 0x00A81C 02:A80C: AB        .byte $AB, $EB, $F3, $F4   ; 
- D 1 - I - 0x00A820 02:A810: AE        .byte $AE, $E3, $A1, $F6   ; 
- D 1 - I - 0x00A824 02:A814: AB        .byte $AB, $EB, $AA, $9C   ; 
; 34 
- D 1 - I - 0x00A828 02:A818: FC        .byte $FC, $BD, $F8, $BD   ; 
- D 1 - I - 0x00A82C 02:A81C: BD        .byte $BD, $BD, $BD, $BD   ; 
- - - - - - 0x00A830 02:A820: FA        .byte $FA, $BD, $B5, $62   ; 
- - - - - - 0x00A834 02:A824: B5        .byte $B5, $62, $B6, $63   ; 
; 35 
- - - - - - 0x00A838 02:A828: B3        .byte $B3, $AA, $AA, $AA   ; 
- - - - - - 0x00A83C 02:A82C: F1        .byte $F1, $F2, $F2, $F2   ; 
- - - - - - 0x00A840 02:A830: A8        .byte $A8, $A1, $A1, $E6   ; 
- - - - - - 0x00A844 02:A834: A9        .byte $A9, $E2, $AA, $EA   ; 
; 36 
- D 1 - I - 0x00A848 02:A838: B3        .byte $B3, $AA, $AA, $EA   ; 
- D 1 - I - 0x00A84C 02:A83C: F1        .byte $F1, $F2, $F2, $EA   ; 
- D 1 - I - 0x00A850 02:A840: A8        .byte $A8, $A1, $A1, $EC   ; 
- D 1 - I - 0x00A854 02:A844: A9        .byte $A9, $E2, $AA, $EA   ; 
; 37 
- D 1 - I - 0x00A858 02:A848: B3        .byte $B3, $AA, $AA, $EA   ; 
- D 1 - I - 0x00A85C 02:A84C: B3        .byte $B3, $AA, $AA, $EA   ; 
- D 1 - I - 0x00A860 02:A850: B3        .byte $B3, $AA, $AA, $EA   ; 
- D 1 - I - 0x00A864 02:A854: B3        .byte $B3, $AA, $AA, $EA   ; 
; 38 
- D 1 - I - 0x00A868 02:A858: 01        .byte $01, $5E, $02, $5F   ; 
- D 1 - I - 0x00A86C 02:A85C: 60        .byte $60, $5F, $BD, $BD   ; 
- D 1 - I - 0x00A870 02:A860: FD        .byte $FD, $E0, $F8, $BD   ; 
- D 1 - I - 0x00A874 02:A864: BD        .byte $BD, $BE, $E0, $BD   ; 
; 39 
- D 1 - I - 0x00A878 02:A868: FA        .byte $FA, $BD, $B4, $61   ; 
- D 1 - I - 0x00A87C 02:A86C: B5        .byte $B5, $62, $B6, $5C   ; 
- - - - - - 0x00A880 02:A870: B6        .byte $B6, $63, $B7, $5D   ; 
- - - - - - 0x00A884 02:A874: B7        .byte $B7, $64, $B8, $9C   ; 
; 3A 
- - - - - - 0x00A888 02:A878: AE        .byte $AE, $ED, $A9, $E2   ; 
- - - - - - 0x00A88C 02:A87C: AB        .byte $AB, $EE, $B3, $AA   ; 
- - - - - - 0x00A890 02:A880: AA        .byte $AA, $EE, $B3, $AA   ; 
- - - - - - 0x00A894 02:A884: AB        .byte $AB, $EE, $B3, $AA   ; 
; 3B 
- - - - - - 0x00A898 02:A888: AA        .byte $AA, $9C, $AD, $AD   ; 
- - - - - - 0x00A89C 02:A88C: AA        .byte $AA, $F5, $00, $9C   ; 
- - - - - - 0x00A8A0 02:A890: AA        .byte $AA, $F5, $A2, $9C   ; 
- - - - - - 0x00A8A4 02:A894: AA        .byte $AA, $F5, $00, $9C   ; 
; 3C 
- - - - - - 0x00A8A8 02:A898: AD        .byte $AD, $DE, $AB, $EB   ; 
- - - - - - 0x00A8AC 02:A89C: B3        .byte $B3, $EA, $AA, $EB   ; 
- - - - - - 0x00A8B0 02:A8A0: B3        .byte $B3, $EA, $AB, $EB   ; 
- - - - - - 0x00A8B4 02:A8A4: B3        .byte $B3, $EA, $AA, $EB   ; 
; 3D 
- D 1 - I - 0x00A8B8 02:A8A8: A8        .byte $A8, $A1, $A1, $F6   ; 
- D 1 - I - 0x00A8BC 02:A8AC: A9        .byte $A9, $AB, $AA, $9C   ; 
- D 1 - I - 0x00A8C0 02:A8B0: B3        .byte $B3, $AB, $AA, $F5   ; 
- D 1 - I - 0x00A8C4 02:A8B4: F1        .byte $F1, $F2, $F3, $F4   ; 
; 3E 
- D 1 - I - 0x00A8C8 02:A8B8: BD        .byte $BD, $BD, $BD, $BD   ; 
- D 1 - I - 0x00A8CC 02:A8BC: BD        .byte $BD, $BD, $BD, $BD   ; 
- D 1 - I - 0x00A8D0 02:A8C0: C0        .byte $C0, $C0, $C0, $C0   ; 
- D 1 - I - 0x00A8D4 02:A8C4: 9D        .byte $9D, $9E, $9E, $E9   ; 
; 3F 
- D 1 - I - 0x00A8D8 02:A8C8: 81        .byte $81, $83, $18, $84   ; 
- D 1 - I - 0x00A8DC 02:A8CC: 00        .byte $00, $00, $15, $00   ; 
- D 1 - I - 0x00A8E0 02:A8D0: 00        .byte $00, $00, $15, $00   ; 
- D 1 - I - 0x00A8E4 02:A8D4: 00        .byte $00, $00, $15, $00   ; 
; 40 
- D 1 - I - 0x00A8E8 02:A8D8: 00        .byte $00, $1A, $1A, $1B   ; 
- D 1 - I - 0x00A8EC 02:A8DC: 1D        .byte $1D, $7C, $1E, $7D   ; 
- D 1 - I - 0x00A8F0 02:A8E0: 1B        .byte $1B, $00, $00, $00   ; 
- D 1 - I - 0x00A8F4 02:A8E4: 7D        .byte $7D, $00, $1F, $1C   ; 
; 41 
- D 1 - I - 0x00A8F8 02:A8E8: 11        .byte $11, $12, $11, $12   ; 
- D 1 - I - 0x00A8FC 02:A8EC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A900 02:A8F0: 19        .byte $19, $00, $00, $1B   ; 
- D 1 - I - 0x00A904 02:A8F4: 1C        .byte $1C, $1D, $1E, $7D   ; 
; 42 
- D 1 - I - 0x00A908 02:A8F8: 12        .byte $12, $12, $13, $75   ; 
- D 1 - I - 0x00A90C 02:A8FC: 00        .byte $00, $00, $00, $38   ; 
- D 1 - I - 0x00A910 02:A900: 00        .byte $00, $00, $01, $3A   ; 
- D 1 - I - 0x00A914 02:A904: 3D        .byte $3D, $3E, $3F, $40   ; 
; 43 
- D 1 - I - 0x00A918 02:A908: 14        .byte $14, $76, $12, $12   ; 
- D 1 - I - 0x00A91C 02:A90C: 39        .byte $39, $00, $00, $00   ; 
- D 1 - I - 0x00A920 02:A910: 02        .byte $02, $3B, $00, $3C   ; 
- D 1 - I - 0x00A924 02:A914: 41        .byte $41, $42, $43, $44   ; 
; 44 
- D 1 - I - 0x00A928 02:A918: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A92C 02:A91C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A930 02:A920: 1A        .byte $1A, $19, $00, $1A   ; 
- D 1 - I - 0x00A934 02:A924: 1E        .byte $1E, $1C, $1D, $7C   ; 
; 45 
- D 1 - I - 0x00A938 02:A928: 00        .byte $00, $00, $00, $45   ; 
- D 1 - I - 0x00A93C 02:A92C: 00        .byte $00, $00, $4A, $4B   ; 
- D 1 - I - 0x00A940 02:A930: 19        .byte $19, $1A, $06, $54   ; 
- D 1 - I - 0x00A944 02:A934: 1E        .byte $1E, $7D, $59, $00   ; 
; 46 
- D 1 - I - 0x00A948 02:A938: 03        .byte $03, $46, $00, $47   ; 
- D 1 - I - 0x00A94C 02:A93C: 4C        .byte $4C, $4D, $4E, $4F   ; 
- D 1 - I - 0x00A950 02:A940: 07        .byte $07, $55, $08, $56   ; 
- D 1 - I - 0x00A954 02:A944: 00        .byte $00, $00, $5A, $5B   ; 
; 47 
- D 1 - I - 0x00A958 02:A948: 04        .byte $04, $48, $05, $49   ; 
- D 1 - I - 0x00A95C 02:A94C: 50        .byte $50, $51, $52, $53   ; 
- D 1 - I - 0x00A960 02:A950: 09        .byte $09, $57, $0A, $58   ; 
- D 1 - I - 0x00A964 02:A954: 5C        .byte $5C, $5D, $5E, $5F   ; 
; 48 
- D 1 - I - 0x00A968 02:A958: 00        .byte $00, $00, $00, $19   ; 
- D 1 - I - 0x00A96C 02:A95C: 00        .byte $00, $00, $1F, $1C   ; 
- D 1 - I - 0x00A970 02:A960: 19        .byte $19, $00, $00, $1B   ; 
- D 1 - I - 0x00A974 02:A964: 1C        .byte $1C, $1D, $1E, $7D   ; 
; 49 
- D 1 - I - 0x00A978 02:A968: 00        .byte $00, $00, $0C, $61   ; 
- D 1 - I - 0x00A97C 02:A96C: 00        .byte $00, $64, $65, $66   ; 
- D 1 - I - 0x00A980 02:A970: 00        .byte $00, $70, $0F, $71   ; 
- D 1 - I - 0x00A984 02:A974: 00        .byte $00, $00, $00, $00   ; 
; 4A 
- D 1 - I - 0x00A988 02:A978: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A98C 02:A97C: 67        .byte $67, $68, $69, $6A   ; 
- D 1 - I - 0x00A990 02:A980: 00        .byte $00, $00, $00, $1A   ; 
- D 1 - I - 0x00A994 02:A984: 1F        .byte $1F, $1C, $1D, $7C   ; 
; 4B 
- D 1 - I - 0x00A998 02:A988: 00        .byte $00, $00, $0D, $62   ; 
- D 1 - I - 0x00A99C 02:A98C: 6A        .byte $6A, $6B, $6C, $6D   ; 
- D 1 - I - 0x00A9A0 02:A990: 1B        .byte $1B, $00, $10, $72   ; 
- D 1 - I - 0x00A9A4 02:A994: 7D        .byte $7D, $00, $73, $74   ; 
; 4C 
- D 1 - I - 0x00A9A8 02:A998: 34        .byte $34, $32, $32, $32   ; 
- D 1 - I - 0x00A9AC 02:A99C: 81        .byte $81, $83, $80, $34   ; 
- D 1 - I - 0x00A9B0 02:A9A0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A9B4 02:A9A4: 00        .byte $00, $00, $00, $00   ; 
; 4D 
- D 1 - I - 0x00A9B8 02:A9A8: 32        .byte $32, $32, $32, $80   ; 
- D 1 - I - 0x00A9BC 02:A9AC: 80        .byte $80, $84, $82, $00   ; 
- D 1 - I - 0x00A9C0 02:A9B0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A9C4 02:A9B4: 00        .byte $00, $00, $00, $00   ; 
; 4E 
- D 1 - I - 0x00A9C8 02:A9B8: 00        .byte $00, $00, $00, $1F   ; 
- D 1 - I - 0x00A9CC 02:A9BC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A9D0 02:A9C0: 00        .byte $00, $00, $00, $22   ; 
- D 1 - I - 0x00A9D4 02:A9C4: 22        .byte $22, $23, $25, $25   ; 
; 4F 
- D 1 - I - 0x00A9D8 02:A9C8: 1C        .byte $1C, $7E, $15, $00   ; 
- D 1 - I - 0x00A9DC 02:A9CC: 00        .byte $00, $00, $15, $00   ; 
- D 1 - I - 0x00A9E0 02:A9D0: 23        .byte $23, $23, $15, $23   ; 
- D 1 - I - 0x00A9E4 02:A9D4: 35        .byte $35, $35, $79, $35   ; 
; 50 
- D 1 - I - 0x00A9E8 02:A9D8: 12        .byte $12, $11, $12, $11   ; 
- D 1 - I - 0x00A9EC 02:A9DC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A9F0 02:A9E0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A9F4 02:A9E4: 00        .byte $00, $00, $00, $00   ; 
; 51 
- D 1 - I - 0x00A9F8 02:A9E8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00A9FC 02:A9EC: 9F        .byte $9F, $00, $1A, $19   ; 
- D 1 - I - 0x00AA00 02:A9F0: 1F        .byte $1F, $7E, $1E, $1C   ; 
- D 1 - I - 0x00AA04 02:A9F4: 00        .byte $00, $00, $00, $00   ; 
; 52 
- D 1 - I - 0x00AA08 02:A9F8: 00        .byte $00, $9F, $00, $00   ; 
- D 1 - I - 0x00AA0C 02:A9FC: 00        .byte $00, $1A, $1A, $1B   ; 
- D 1 - I - 0x00AA10 02:AA00: 1D        .byte $1D, $7C, $1E, $7D   ; 
- D 1 - I - 0x00AA14 02:AA04: 00        .byte $00, $00, $00, $00   ; 
; 53 
- D 1 - I - 0x00AA18 02:AA08: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AA1C 02:AA0C: 00        .byte $00, $7F, $00, $00   ; 
- D 1 - I - 0x00AA20 02:AA10: 1F        .byte $1F, $1E, $00, $00   ; 
- D 1 - I - 0x00AA24 02:AA14: 00        .byte $00, $00, $00, $00   ; 
; 54 
- D 1 - I - 0x00AA28 02:AA18: 00        .byte $00, $19, $00, $1A   ; 
- D 1 - I - 0x00AA2C 02:AA1C: 1E        .byte $1E, $1C, $1D, $7C   ; 
- D 1 - I - 0x00AA30 02:AA20: 0B        .byte $0B, $00, $00, $00   ; 
- D 1 - I - 0x00AA34 02:AA24: 60        .byte $60, $00, $00, $00   ; 
; 55 
- D 1 - I - 0x00AA38 02:AA28: 1A        .byte $1A, $1B, $19, $00   ; 
- D 1 - I - 0x00AA3C 02:AA2C: 1E        .byte $1E, $7D, $00, $00   ; 
- D 1 - I - 0x00AA40 02:AA30: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AA44 02:AA34: 00        .byte $00, $00, $1F, $7E   ; 
; 56 
- D 1 - I - 0x00AA48 02:AA38: 30        .byte $30, $37, $33, $37   ; 
- D 1 - I - 0x00AA4C 02:AA3C: 82        .byte $82, $00, $81, $00   ; 
- D 1 - I - 0x00AA50 02:AA40: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AA54 02:AA44: 00        .byte $00, $00, $00, $00   ; 
; 57 
- - - - - - 0x00AA58 02:AA48: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00AA5C 02:AA4C: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00AA60 02:AA50: 1A        .byte $1A, $1B, $1A, $7F   ; 
- - - - - - 0x00AA64 02:AA54: 1E        .byte $1E, $7D, $1F, $1E   ; 
; 58 
- D 1 - I - 0x00AA68 02:AA58: 0E        .byte $0E, $63, $1A, $19   ; 
- D 1 - I - 0x00AA6C 02:AA5C: 6E        .byte $6E, $6F, $1E, $1C   ; 
- D 1 - I - 0x00AA70 02:AA60: 00        .byte $00, $00, $00, $1A   ; 
- D 1 - I - 0x00AA74 02:AA64: 1F        .byte $1F, $1C, $7E, $1E   ; 
; 59 
- D 1 - I - 0x00AA78 02:AA68: 82        .byte $82, $00, $81, $83   ; 
- D 1 - I - 0x00AA7C 02:AA6C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AA80 02:AA70: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AA84 02:AA74: 00        .byte $00, $00, $00, $00   ; 
; 5A 
- D 1 - I - 0x00AA88 02:AA78: 80        .byte $80, $84, $82, $00   ; 
- D 1 - I - 0x00AA8C 02:AA7C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AA90 02:AA80: 00        .byte $00, $00, $85, $00   ; 
- D 1 - I - 0x00AA94 02:AA84: 00        .byte $00, $00, $D6, $00   ; 
; 5B 
- D 1 - I - 0x00AA98 02:AA88: 00        .byte $00, $1A, $1A, $1B   ; 
- D 1 - I - 0x00AA9C 02:AA8C: 1D        .byte $1D, $7C, $1E, $7D   ; 
- D 1 - I - 0x00AAA0 02:AA90: 1B        .byte $1B, $00, $00, $00   ; 
- D 1 - I - 0x00AAA4 02:AA94: 7D        .byte $7D, $00, $1F, $1C   ; 
; 5C 
- D 1 - I - 0x00AAA8 02:AA98: 00        .byte $00, $00, $00, $1F   ; 
- D 1 - I - 0x00AAAC 02:AA9C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AAB0 02:AAA0: 23        .byte $23, $23, $23, $23   ; 
- D 1 - I - 0x00AAB4 02:AAA4: 26        .byte $26, $26, $26, $26   ; 
; 5D 
- D 1 - I - 0x00AAB8 02:AAA8: 1C        .byte $1C, $1D, $1E, $00   ; 
- D 1 - I - 0x00AABC 02:AAAC: 00        .byte $00, $00, $00, $22   ; 
- D 1 - I - 0x00AAC0 02:AAB0: 24        .byte $24, $24, $25, $26   ; 
- D 1 - I - 0x00AAC4 02:AAB4: 27        .byte $27, $27, $28, $28   ; 
; 5E 
- D 1 - I - 0x00AAC8 02:AAB8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AACC 02:AABC: 23        .byte $23, $23, $24, $25   ; 
- D 1 - I - 0x00AAD0 02:AAC0: 26        .byte $26, $26, $26, $27   ; 
- D 1 - I - 0x00AAD4 02:AAC4: 28        .byte $28, $28, $28, $29   ; 
; 5F 
- D 1 - I - 0x00AAD8 02:AAC8: 22        .byte $22, $22, $23, $23   ; 
- D 1 - I - 0x00AADC 02:AACC: 35        .byte $35, $35, $26, $26   ; 
- D 1 - I - 0x00AAE0 02:AAD0: 28        .byte $28, $28, $28, $28   ; 
- D 1 - I - 0x00AAE4 02:AAD4: 29        .byte $29, $29, $29, $29   ; 
; 60 
- D 1 - I - 0x00AAE8 02:AAD8: 00        .byte $00, $22, $22, $23   ; 
- D 1 - I - 0x00AAEC 02:AADC: 35        .byte $35, $26, $26, $26   ; 
- D 1 - I - 0x00AAF0 02:AAE0: 27        .byte $27, $28, $29, $2A   ; 
- D 1 - I - 0x00AAF4 02:AAE4: 2A        .byte $2A, $2C, $2D, $2D   ; 
; 61 
- D 1 - I - 0x00AAF8 02:AAE8: 24        .byte $24, $24, $25, $26   ; 
- D 1 - I - 0x00AAFC 02:AAEC: 27        .byte $27, $27, $28, $28   ; 
- D 1 - I - 0x00AB00 02:AAF0: 2A        .byte $2A, $2C, $2C, $2C   ; 
- D 1 - I - 0x00AB04 02:AAF4: 2F        .byte $2F, $37, $33, $30   ; 
; 62 
- D 1 - I - 0x00AB08 02:AAF8: 26        .byte $26, $27, $27, $27   ; 
- D 1 - I - 0x00AB0C 02:AAFC: 29        .byte $29, $29, $29, $29   ; 
- D 1 - I - 0x00AB10 02:AB00: 2D        .byte $2D, $2B, $2B, $2D   ; 
- D 1 - I - 0x00AB14 02:AB04: 31        .byte $31, $31, $31, $37   ; 
; 63 
- D 1 - I - 0x00AB18 02:AB08: 28        .byte $28, $28, $16, $28   ; 
- D 1 - I - 0x00AB1C 02:AB0C: 29        .byte $29, $2A, $7A, $2A   ; 
- D 1 - I - 0x00AB20 02:AB10: 2D        .byte $2D, $2D, $17, $2E   ; 
- D 1 - I - 0x00AB24 02:AB14: 33        .byte $33, $2F, $7B, $30   ; 
; 64 
- D 1 - I - 0x00AB28 02:AB18: 28        .byte $28, $28, $29, $29   ; 
- D 1 - I - 0x00AB2C 02:AB1C: 2A        .byte $2A, $2C, $2B, $2D   ; 
- D 1 - I - 0x00AB30 02:AB20: 2E        .byte $2E, $2E, $2E, $2E   ; 
- D 1 - I - 0x00AB34 02:AB24: 30        .byte $30, $30, $31, $31   ; 
; 65 
- D 1 - I - 0x00AB38 02:AB28: 29        .byte $29, $29, $2A, $2A   ; 
- D 1 - I - 0x00AB3C 02:AB2C: 2B        .byte $2B, $2D, $2D, $2E   ; 
- D 1 - I - 0x00AB40 02:AB30: 2E        .byte $2E, $2F, $2F, $2F   ; 
- D 1 - I - 0x00AB44 02:AB34: 31        .byte $31, $31, $31, $36   ; 
; 66 
- D 1 - I - 0x00AB48 02:AB38: 2A        .byte $2A, $2A, $2C, $2D   ; 
- D 1 - I - 0x00AB4C 02:AB3C: 2E        .byte $2E, $2E, $2E, $2E   ; 
- D 1 - I - 0x00AB50 02:AB40: 30        .byte $30, $30, $30, $30   ; 
- D 1 - I - 0x00AB54 02:AB44: 36        .byte $36, $31, $36, $36   ; 
; 67 
- D 1 - I - 0x00AB58 02:AB48: 2B        .byte $2B, $2D, $2B, $2D   ; 
- D 1 - I - 0x00AB5C 02:AB4C: 2E        .byte $2E, $2E, $2E, $2E   ; 
- D 1 - I - 0x00AB60 02:AB50: 31        .byte $31, $31, $31, $31   ; 
- D 1 - I - 0x00AB64 02:AB54: 32        .byte $32, $32, $32, $32   ; 
; 68 
- D 1 - I - 0x00AB68 02:AB58: 8A        .byte $8A, $00, $86, $D7   ; 
- D 1 - I - 0x00AB6C 02:AB5C: 8B        .byte $8B, $C8, $87, $C1   ; 
- - - - - - 0x00AB70 02:AB60: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00AB74 02:AB64: 00        .byte $00, $00, $00, $00   ; 
; 69 
- D 1 - I - 0x00AB78 02:AB68: 00        .byte $00, $00, $8A, $00   ; 
- D 1 - I - 0x00AB7C 02:AB6C: 00        .byte $00, $00, $8B, $00   ; 
- - - - - - 0x00AB80 02:AB70: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00AB84 02:AB74: 00        .byte $00, $00, $00, $00   ; 
; 6A 
- D 1 - I - 0x00AB88 02:AB78: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AB8C 02:AB7C: CD        .byte $CD, $95, $D1, $00   ; 
- D 1 - I - 0x00AB90 02:AB80: 97        .byte $97, $99, $9A, $00   ; 
- D 1 - I - 0x00AB94 02:AB84: 98        .byte $98, $99, $9A, $00   ; 
; 6B 
- D 1 - I - 0x00AB98 02:AB88: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AB9C 02:AB8C: 00        .byte $00, $00, $01, $5E   ; 
- D 1 - I - 0x00ABA0 02:AB90: 01        .byte $01, $5E, $02, $5F   ; 
- D 1 - I - 0x00ABA4 02:AB94: E4        .byte $E4, $5F, $BD, $BD   ; 
; 6C 
- D 1 - I - 0x00ABA8 02:AB98: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00ABAC 02:AB9C: CD        .byte $CD, $95, $D0, $00   ; 
- D 1 - I - 0x00ABB0 02:ABA0: 98        .byte $98, $D2, $95, $D1   ; 
- D 1 - I - 0x00ABB4 02:ABA4: 00        .byte $00, $97, $99, $D4   ; 
; 6D 
- D 1 - I - 0x00ABB8 02:ABA8: 00        .byte $00, $00, $8B, $00   ; 
- D 1 - I - 0x00ABBC 02:ABAC: 8D        .byte $8D, $8E, $C5, $8E   ; 
- D 1 - I - 0x00ABC0 02:ABB0: 00        .byte $00, $00, $8C, $00   ; 
- D 1 - I - 0x00ABC4 02:ABB4: C7        .byte $C7, $C8, $8B, $C8   ; 
; 6E 
- D 1 - I - 0x00ABC8 02:ABB8: 92        .byte $92, $92, $94, $92   ; 
- D 1 - I - 0x00ABCC 02:ABBC: CA        .byte $CA, $CA, $CB, $CA   ; 
- D 1 - I - 0x00ABD0 02:ABC0: 00        .byte $00, $00, $94, $00   ; 
- D 1 - I - 0x00ABD4 02:ABC4: 00        .byte $00, $00, $94, $00   ; 
; 6F 
- D 1 - I - 0x00ABD8 02:ABC8: 92        .byte $92, $90, $90, $92   ; 
- D 1 - I - 0x00ABDC 02:ABCC: CA        .byte $CA, $CA, $CA, $CA   ; 
- D 1 - I - 0x00ABE0 02:ABD0: 93        .byte $93, $00, $8B, $00   ; 
- D 1 - I - 0x00ABE4 02:ABD4: 93        .byte $93, $00, $8C, $00   ; 
; 70 
- D 1 - I - 0x00ABE8 02:ABD8: 8D        .byte $8D, $8E, $8E, $8E   ; 
- D 1 - I - 0x00ABEC 02:ABDC: 00        .byte $00, $98, $C4, $00   ; 
- D 1 - I - 0x00ABF0 02:ABE0: 00        .byte $00, $00, $89, $00   ; 
- D 1 - I - 0x00ABF4 02:ABE4: C8        .byte $C8, $00, $8B, $C8   ; 
; 71 
- D 1 - I - 0x00ABF8 02:ABE8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00ABFC 02:ABEC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AC00 02:ABF0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AC04 02:ABF4: C7        .byte $C7, $C8, $C7, $C8   ; 
; 72 
- D 1 - I - 0x00AC08 02:ABF8: 8A        .byte $8A, $00, $85, $00   ; 
- D 1 - I - 0x00AC0C 02:ABFC: 8B        .byte $8B, $00, $D6, $00   ; 
- D 1 - I - 0x00AC10 02:AC00: 8B        .byte $8B, $00, $86, $D7   ; 
- D 1 - I - 0x00AC14 02:AC04: 8B        .byte $8B, $C8, $87, $C1   ; 
; 73 
- D 1 - I - 0x00AC18 02:AC08: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AC1C 02:AC0C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AC20 02:AC10: 00        .byte $00, $00, $8A, $00   ; 
- D 1 - I - 0x00AC24 02:AC14: 00        .byte $00, $00, $8B, $00   ; 
; 74 
- D 1 - I - 0x00AC28 02:AC18: 00        .byte $00, $00, $8C, $00   ; 
- D 1 - I - 0x00AC2C 02:AC1C: 8E        .byte $8E, $8E, $C5, $8E   ; 
- D 1 - I - 0x00AC30 02:AC20: 8F        .byte $8F, $00, $8C, $00   ; 
- D 1 - I - 0x00AC34 02:AC24: 00        .byte $00, $8F, $00, $00   ; 
; 75 
- D 1 - I - 0x00AC38 02:AC28: 00        .byte $00, $00, $93, $00   ; 
- D 1 - I - 0x00AC3C 02:AC2C: CD        .byte $CD, $95, $D0, $8D   ; 
- D 1 - I - 0x00AC40 02:AC30: 98        .byte $98, $D2, $95, $D1   ; 
- D 1 - I - 0x00AC44 02:AC34: 00        .byte $00, $97, $99, $D4   ; 
; 76 
- D 1 - I - 0x00AC48 02:AC38: 8B        .byte $8B, $00, $87, $C1   ; 
- D 1 - I - 0x00AC4C 02:AC3C: C5        .byte $C5, $8D, $87, $C1   ; 
- D 1 - I - 0x00AC50 02:AC40: 8B        .byte $8B, $00, $88, $C1   ; 
- D 1 - I - 0x00AC54 02:AC44: 8C        .byte $8C, $00, $86, $C1   ; 
; 77 
- D 1 - I - 0x00AC58 02:AC48: 93        .byte $93, $00, $8C, $00   ; 
- D 1 - I - 0x00AC5C 02:AC4C: 8D        .byte $8D, $8D, $C5, $C6   ; 
- D 1 - I - 0x00AC60 02:AC50: 93        .byte $93, $00, $8B, $00   ; 
- D 1 - I - 0x00AC64 02:AC54: 93        .byte $93, $00, $8C, $00   ; 
; 78 
- D 1 - I - 0x00AC68 02:AC58: 92        .byte $92, $90, $91, $92   ; 
- D 1 - I - 0x00AC6C 02:AC5C: CA        .byte $CA, $CA, $CB, $CA   ; 
- D 1 - I - 0x00AC70 02:AC60: 00        .byte $00, $00, $94, $00   ; 
- D 1 - I - 0x00AC74 02:AC64: 00        .byte $00, $00, $94, $00   ; 
; 79 
- D 1 - I - 0x00AC78 02:AC68: 92        .byte $92, $98, $99, $9A   ; 
- D 1 - I - 0x00AC7C 02:AC6C: CA        .byte $CA, $CC, $9B, $D3   ; 
- D 1 - I - 0x00AC80 02:AC70: 00        .byte $00, $97, $99, $D4   ; 
- D 1 - I - 0x00AC84 02:AC74: 00        .byte $00, $97, $99, $D4   ; 
; 7A 
- D 1 - I - 0x00AC88 02:AC78: 00        .byte $00, $00, $87, $C1   ; 
- D 1 - I - 0x00AC8C 02:AC7C: 00        .byte $00, $00, $D8, $D9   ; 
- D 1 - I - 0x00AC90 02:AC80: 00        .byte $00, $00, $87, $C1   ; 
- D 1 - I - 0x00AC94 02:AC84: 00        .byte $00, $00, $87, $C1   ; 
; 7B 
- D 1 - I - 0x00AC98 02:AC88: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AC9C 02:AC8C: CD        .byte $CD, $95, $D0, $C9   ; 
- D 1 - I - 0x00ACA0 02:AC90: 97        .byte $97, $99, $9A, $00   ; 
- D 1 - I - 0x00ACA4 02:AC94: 98        .byte $98, $99, $9A, $00   ; 
; 7C 
- D 1 - I - 0x00ACA8 02:AC98: 00        .byte $00, $92, $94, $91   ; 
- D 1 - I - 0x00ACAC 02:AC9C: D0        .byte $D0, $CA, $CA, $CA   ; 
- D 1 - I - 0x00ACB0 02:ACA0: 9A        .byte $9A, $97, $99, $9A   ; 
- D 1 - I - 0x00ACB4 02:ACA4: F7        .byte $F7, $F7, $F7, $F7   ; 
; 7D 
- D 1 - I - 0x00ACB8 02:ACA8: 92        .byte $92, $98, $9B, $D3   ; 
- D 1 - I - 0x00ACBC 02:ACAC: CA        .byte $CA, $CC, $99, $D4   ; 
- D 1 - I - 0x00ACC0 02:ACB0: 99        .byte $99, $D4, $99, $9A   ; 
- D 1 - I - 0x00ACC4 02:ACB4: DF        .byte $DF, $F7, $F7, $F7   ; 
; 7E 
- D 1 - I - 0x00ACC8 02:ACB8: 00        .byte $00, $00, $87, $C1   ; 
- D 1 - I - 0x00ACCC 02:ACBC: 00        .byte $00, $CE, $C2, $C3   ; 
- D 1 - I - 0x00ACD0 02:ACC0: 97        .byte $97, $99, $9A, $99   ; 
- D 1 - I - 0x00ACD4 02:ACC4: F7        .byte $F7, $F7, $F7, $F7   ; 
; 7F 
- D 1 - I - 0x00ACD8 02:ACC8: 00        .byte $00, $CD, $96, $D1   ; 
- D 1 - I - 0x00ACDC 02:ACCC: CE        .byte $CE, $D5, $CF, $96   ; 
- D 1 - I - 0x00ACE0 02:ACD0: 99        .byte $99, $9A, $99, $9A   ; 
- D 1 - I - 0x00ACE4 02:ACD4: DF        .byte $DF, $F7, $F7, $F7   ; 
; 80 
- D 1 - I - 0x00ACE8 02:ACD8: 00        .byte $00, $00, $85, $00   ; 
- D 1 - I - 0x00ACEC 02:ACDC: 00        .byte $00, $00, $D6, $00   ; 
- D 1 - I - 0x00ACF0 02:ACE0: 00        .byte $00, $00, $86, $D7   ; 
- D 1 - I - 0x00ACF4 02:ACE4: 00        .byte $00, $00, $87, $C1   ; 
; 81 
- D 1 - I - 0x00ACF8 02:ACE8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00ACFC 02:ACEC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AD00 02:ACF0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AD04 02:ACF4: 0A        .byte $0A, $09, $32, $00   ; 
; 82 
- D 1 - I - 0x00AD08 02:ACF8: 00        .byte $00, $00, $00, $0B   ; 
- D 1 - I - 0x00AD0C 02:ACFC: 00        .byte $00, $0B, $0C, $35   ; 
- D 1 - I - 0x00AD10 02:AD00: 0C        .byte $0C, $35, $10, $11   ; 
- D 1 - I - 0x00AD14 02:AD04: 12        .byte $12, $14, $3C, $83   ; 
; 83 
- D 1 - I - 0x00AD18 02:AD08: 35        .byte $35, $3B, $12, $0E   ; 
- D 1 - I - 0x00AD1C 02:AD0C: 82        .byte $82, $00, $38, $83   ; 
- D 1 - I - 0x00AD20 02:AD10: 00        .byte $00, $00, $00, $58   ; 
- D 1 - I - 0x00AD24 02:AD14: 00        .byte $00, $00, $00, $59   ; 
; 84 
- D 1 - I - 0x00AD28 02:AD18: 00        .byte $00, $81, $12, $3B   ; 
- D 1 - I - 0x00AD2C 02:AD1C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AD30 02:AD20: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AD34 02:AD24: 00        .byte $00, $00, $00, $00   ; 
; 85 
- D 1 - I - 0x00AD38 02:AD28: 12        .byte $12, $36, $0E, $0F   ; 
- D 1 - I - 0x00AD3C 02:AD2C: 81        .byte $81, $83, $3A, $14   ; 
- D 1 - I - 0x00AD40 02:AD30: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AD44 02:AD34: 00        .byte $00, $00, $00, $00   ; 
; 86 
- D 1 - I - 0x00AD48 02:AD38: 0D        .byte $0D, $0A, $09, $0A   ; 
- D 1 - I - 0x00AD4C 02:AD3C: 12        .byte $12, $36, $36, $36   ; 
- D 1 - I - 0x00AD50 02:AD40: 81        .byte $81, $83, $13, $80   ; 
- D 1 - I - 0x00AD54 02:AD44: 00        .byte $00, $00, $00, $00   ; 
; 87 
- D 1 - I - 0x00AD58 02:AD48: 0A        .byte $0A, $09, $0A, $09   ; 
- D 1 - I - 0x00AD5C 02:AD4C: 36        .byte $36, $33, $33, $34   ; 
- D 1 - I - 0x00AD60 02:AD50: 84        .byte $84, $82, $83, $3A   ; 
- D 1 - I - 0x00AD64 02:AD54: 00        .byte $00, $00, $00, $00   ; 
; 88 
- D 1 - I - 0x00AD68 02:AD58: 0A        .byte $0A, $09, $09, $09   ; 
- D 1 - I - 0x00AD6C 02:AD5C: 33        .byte $33, $34, $33, $34   ; 
- D 1 - I - 0x00AD70 02:AD60: 14        .byte $14, $39, $11, $37   ; 
- D 1 - I - 0x00AD74 02:AD64: 00        .byte $00, $81, $83, $13   ; 
; 89 
- D 1 - I - 0x00AD78 02:AD68: 09        .byte $09, $09, $0A, $09   ; 
- D 1 - I - 0x00AD7C 02:AD6C: 33        .byte $33, $34, $33, $34   ; 
- D 1 - I - 0x00AD80 02:AD70: 11        .byte $11, $37, $11, $37   ; 
- D 1 - I - 0x00AD84 02:AD74: 80        .byte $80, $83, $13, $80   ; 
; 8A 
- D 1 - I - 0x00AD88 02:AD78: 09        .byte $09, $0A, $09, $0A   ; 
- D 1 - I - 0x00AD8C 02:AD7C: 33        .byte $33, $34, $33, $33   ; 
- D 1 - I - 0x00AD90 02:AD80: 11        .byte $11, $37, $14, $39   ; 
- D 1 - I - 0x00AD94 02:AD84: 84        .byte $84, $82, $00, $38   ; 
; 8B 
- D 1 - I - 0x00AD98 02:AD88: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AD9C 02:AD8C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00ADA0 02:AD90: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00ADA4 02:AD94: 0B        .byte $0B, $09, $09, $32   ; 
; 8C 
- D 1 - I - 0x00ADA8 02:AD98: 00        .byte $00, $00, $81, $83   ; 
- D 1 - I - 0x00ADAC 02:AD9C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00ADB0 02:ADA0: 17        .byte $17, $17, $17, $17   ; 
- D 1 - I - 0x00ADB4 02:ADA4: 3F        .byte $3F, $3F, $3F, $3F   ; 
; 8D 
- D 1 - I - 0x00ADB8 02:ADA8: 12        .byte $12, $14, $82, $00   ; 
- D 1 - I - 0x00ADBC 02:ADAC: 38        .byte $38, $00, $00, $00   ; 
- D 1 - I - 0x00ADC0 02:ADB0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00ADC4 02:ADB4: 00        .byte $00, $00, $00, $00   ; 
; 8E 
- D 1 - I - 0x00ADC8 02:ADB8: 00        .byte $00, $92, $94, $91   ; 
- D 1 - I - 0x00ADCC 02:ADBC: D0        .byte $D0, $CA, $CA, $CA   ; 
- D 1 - I - 0x00ADD0 02:ADC0: 9A        .byte $9A, $97, $99, $9A   ; 
- D 1 - I - 0x00ADD4 02:ADC4: F7        .byte $F7, $DF, $65, $65   ; 
; 8F 
- D 1 - I - 0x00ADD8 02:ADC8: 92        .byte $92, $98, $9B, $D3   ; 
- D 1 - I - 0x00ADDC 02:ADCC: CA        .byte $CA, $CC, $99, $D4   ; 
- D 1 - I - 0x00ADE0 02:ADD0: 99        .byte $99, $D4, $99, $9A   ; 
- D 1 - I - 0x00ADE4 02:ADD4: 65        .byte $65, $65, $65, $65   ; 
; 90 
- D 1 - I - 0x00ADE8 02:ADD8: 00        .byte $00, $00, $87, $C1   ; 
- D 1 - I - 0x00ADEC 02:ADDC: 00        .byte $00, $CE, $C2, $C3   ; 
- D 1 - I - 0x00ADF0 02:ADE0: 97        .byte $97, $99, $9A, $99   ; 
- D 1 - I - 0x00ADF4 02:ADE4: 65        .byte $65, $65, $65, $65   ; 
; 91 
- D 1 - I - 0x00ADF8 02:ADE8: 00        .byte $00, $CD, $96, $D1   ; 
- D 1 - I - 0x00ADFC 02:ADEC: CE        .byte $CE, $D5, $CF, $96   ; 
- D 1 - I - 0x00AE00 02:ADF0: 99        .byte $99, $9A, $99, $9A   ; 
- D 1 - I - 0x00AE04 02:ADF4: 66        .byte $66, $F7, $F7, $F7   ; 
; 92 
- D 1 - I - 0x00AE08 02:ADF8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AE0C 02:ADFC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AE10 02:AE00: 17        .byte $17, $17, $17, $17   ; 
- D 1 - I - 0x00AE14 02:AE04: 3F        .byte $3F, $3F, $3F, $3F   ; 
; 93 
- D 1 - I - 0x00AE18 02:AE08: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AE1C 02:AE0C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AE20 02:AE10: 17        .byte $17, $17, $17, $3E   ; 
- D 1 - I - 0x00AE24 02:AE14: 3F        .byte $3F, $3F, $3F, $3F   ; 
; 94 
- D 1 - I - 0x00AE28 02:AE18: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AE2C 02:AE1C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AE30 02:AE20: 16        .byte $16, $17, $17, $17   ; 
- D 1 - I - 0x00AE34 02:AE24: 3D        .byte $3D, $3F, $3F, $3F   ; 
; 95 
- D 1 - I - 0x00AE38 02:AE28: 00        .byte $00, $00, $00, $15   ; 
- D 1 - I - 0x00AE3C 02:AE2C: 00        .byte $00, $00, $00, $15   ; 
- D 1 - I - 0x00AE40 02:AE30: 17        .byte $17, $17, $17, $15   ; 
- D 1 - I - 0x00AE44 02:AE34: 3F        .byte $3F, $3F, $3F, $3F   ; 
; 96 
- D 1 - I - 0x00AE48 02:AE38: 75        .byte $75, $A1, $74, $A1   ; 
- D 1 - I - 0x00AE4C 02:AE3C: 76        .byte $76, $AA, $E2, $AA   ; 
- D 1 - I - 0x00AE50 02:AE40: 76        .byte $76, $AA, $05, $AA   ; 
- D 1 - I - 0x00AE54 02:AE44: F1        .byte $F1, $F2, $F2, $F2   ; 
; 97 
- D 1 - I - 0x00AE58 02:AE48: 74        .byte $74, $A1, $74, $F6   ; 
- D 1 - I - 0x00AE5C 02:AE4C: E2        .byte $E2, $AA, $AA, $9C   ; 
- D 1 - I - 0x00AE60 02:AE50: 05        .byte $05, $AA, $05, $F5   ; 
- D 1 - I - 0x00AE64 02:AE54: F2        .byte $F2, $F2, $42, $43   ; 
; 98 
- D 1 - I - 0x00AE68 02:AE58: 15        .byte $15, $A8, $74, $A1   ; 
- D 1 - I - 0x00AE6C 02:AE5C: 15        .byte $15, $A9, $E2, $AA   ; 
- D 1 - I - 0x00AE70 02:AE60: 15        .byte $15, $A9, $05, $AA   ; 
- D 1 - I - 0x00AE74 02:AE64: 15        .byte $15, $F1, $F2, $F2   ; 
; 99 
- D 1 - I - 0x00AE78 02:AE68: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AE7C 02:AE6C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AE80 02:AE70: 00        .byte $00, $00, $00, $16   ; 
- D 1 - I - 0x00AE84 02:AE74: 00        .byte $00, $00, $00, $3D   ; 
; 9A 
- D 1 - I - 0x00AE88 02:AE78: 75        .byte $75, $A1, $74, $A1   ; 
- D 1 - I - 0x00AE8C 02:AE7C: A9        .byte $A9, $AA, $40, $41   ; 
- D 1 - I - 0x00AE90 02:AE80: 20        .byte $20, $41, $02, $5F   ; 
- D 1 - I - 0x00AE94 02:AE84: 60        .byte $60, $5F, $BD, $BD   ; 
; 9B 
- D 1 - I - 0x00AE98 02:AE88: 18        .byte $18, $44, $02, $5F   ; 
- D 1 - I - 0x00AE9C 02:AE8C: 02        .byte $02, $5F, $BD, $BD   ; 
- D 1 - I - 0x00AEA0 02:AE90: FC        .byte $FC, $BD, $F8, $BD   ; 
- D 1 - I - 0x00AEA4 02:AE94: BD        .byte $BD, $BD, $BD, $BD   ; 
; 9C 
- D 1 - I - 0x00AEA8 02:AE98: 15        .byte $15, $A8, $74, $A1   ; 
- D 1 - I - 0x00AEAC 02:AE9C: 15        .byte $15, $A9, $40, $41   ; 
- D 1 - I - 0x00AEB0 02:AEA0: 21        .byte $21, $46, $02, $5F   ; 
- D 1 - I - 0x00AEB4 02:AEA4: 60        .byte $60, $5F, $BD, $BD   ; 
; 9D 
- D 1 - I - 0x00AEB8 02:AEA8: 16        .byte $16, $17, $17, $17   ; 
- D 1 - I - 0x00AEBC 02:AEAC: 3D        .byte $3D, $3F, $3F, $3F   ; 
- - - - - - 0x00AEC0 02:AEB0: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00AEC4 02:AEB4: 00        .byte $00, $00, $00, $00   ; 
; 9E 
- D 1 - I - 0x00AEC8 02:AEB8: 17        .byte $17, $17, $17, $3E   ; 
- D 1 - I - 0x00AECC 02:AEBC: 3F        .byte $3F, $3F, $3F, $3F   ; 
- - - - - - 0x00AED0 02:AEC0: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00AED4 02:AEC4: 00        .byte $00, $00, $00, $00   ; 
; 9F 
- D 1 - I - 0x00AED8 02:AEC8: 22        .byte $22, $53, $00, $00   ; 
- D 1 - I - 0x00AEDC 02:AECC: 22        .byte $22, $47, $00, $00   ; 
- D 1 - I - 0x00AEE0 02:AED0: 24        .byte $24, $48, $00, $00   ; 
- D 1 - I - 0x00AEE4 02:AED4: DF        .byte $DF, $F7, $F7, $F7   ; 
; A0 
- D 1 - I - 0x00AEE8 02:AED8: 00        .byte $00, $00, $23, $54   ; 
- D 1 - I - 0x00AEEC 02:AEDC: 00        .byte $00, $00, $22, $47   ; 
- D 1 - I - 0x00AEF0 02:AEE0: 00        .byte $00, $00, $24, $48   ; 
- D 1 - I - 0x00AEF4 02:AEE4: F7        .byte $F7, $F7, $F7, $F7   ; 
; A1 
- D 1 - I - 0x00AEF8 02:AEE8: 22        .byte $22, $53, $28, $00   ; 
- D 1 - I - 0x00AEFC 02:AEEC: 22        .byte $22, $47, $00, $00   ; 
- D 1 - I - 0x00AF00 02:AEF0: 24        .byte $24, $48, $00, $00   ; 
- D 1 - I - 0x00AF04 02:AEF4: F7        .byte $F7, $F7, $F7, $F7   ; 
; A2 
- D 1 - I - 0x00AF08 02:AEF8: 00        .byte $00, $00, $23, $54   ; 
- D 1 - I - 0x00AF0C 02:AEFC: 00        .byte $00, $00, $22, $47   ; 
- D 1 - I - 0x00AF10 02:AF00: 00        .byte $00, $00, $24, $48   ; 
- D 1 - I - 0x00AF14 02:AF04: DF        .byte $DF, $F7, $F7, $F7   ; 
; A3 
- D 1 - I - 0x00AF18 02:AF08: 22        .byte $22, $53, $28, $00   ; 
- D 1 - I - 0x00AF1C 02:AF0C: 22        .byte $22, $47, $00, $00   ; 
- D 1 - I - 0x00AF20 02:AF10: 24        .byte $24, $48, $00, $00   ; 
- D 1 - I - 0x00AF24 02:AF14: 65        .byte $65, $65, $65, $65   ; 
; A4 
- D 1 - I - 0x00AF28 02:AF18: 00        .byte $00, $00, $23, $54   ; 
- D 1 - I - 0x00AF2C 02:AF1C: 00        .byte $00, $00, $22, $47   ; 
- D 1 - I - 0x00AF30 02:AF20: 00        .byte $00, $00, $24, $48   ; 
- D 1 - I - 0x00AF34 02:AF24: 66        .byte $66, $F7, $F7, $F7   ; 
; A5 
- D 1 - I - 0x00AF38 02:AF28: 22        .byte $22, $47, $27, $4D   ; 
- D 1 - I - 0x00AF3C 02:AF2C: 22        .byte $22, $4C, $4D, $28   ; 
- - - - - - 0x00AF40 02:AF30: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00AF44 02:AF34: 00        .byte $00, $00, $00, $00   ; 
; A6 
- D 1 - I - 0x00AF48 02:AF38: 2B        .byte $2B, $4A, $26, $47   ; 
- D 1 - I - 0x00AF4C 02:AF3C: 00        .byte $00, $25, $4A, $4B   ; 
- - - - - - 0x00AF50 02:AF40: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00AF54 02:AF44: 00        .byte $00, $00, $00, $00   ; 
; A7 
- D 1 - I - 0x00AF58 02:AF48: 23        .byte $23, $51, $2C, $00   ; 
- D 1 - I - 0x00AF5C 02:AF4C: 22        .byte $22, $49, $4A, $2C   ; 
- D 1 - I - 0x00AF60 02:AF50: 22        .byte $22, $47, $25, $4A   ; 
- D 1 - I - 0x00AF64 02:AF54: 22        .byte $22, $47, $00, $4F   ; 
; A8 
- D 1 - I - 0x00AF68 02:AF58: 00        .byte $00, $00, $2D, $52   ; 
- D 1 - I - 0x00AF6C 02:AF5C: 00        .byte $00, $27, $4D, $4E   ; 
- D 1 - I - 0x00AF70 02:AF60: 2A        .byte $2A, $4D, $29, $47   ; 
- D 1 - I - 0x00AF74 02:AF64: 00        .byte $00, $50, $22, $47   ; 
; A9 
- D 1 - I - 0x00AF78 02:AF68: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AF7C 02:AF6C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00AF80 02:AF70: 00        .byte $00, $00, $00, $58   ; 
- D 1 - I - 0x00AF84 02:AF74: 00        .byte $00, $00, $00, $59   ; 
; AA 
- D 1 - I - 0x00AF88 02:AF78: 15        .byte $15, $A9, $05, $AA   ; 
- D 1 - I - 0x00AF8C 02:AF7C: 15        .byte $15, $A9, $AA, $AA   ; 
- D 1 - I - 0x00AF90 02:AF80: 2E        .byte $2E, $2F, $30, $30   ; 
- D 1 - I - 0x00AF94 02:AF84: 9D        .byte $9D, $9E, $9E, $9E   ; 
; AB 
- D 1 - I - 0x00AF98 02:AF88: 05        .byte $05, $AA, $05, $9C   ; 
- D 1 - I - 0x00AF9C 02:AF8C: AA        .byte $AA, $AA, $AA, $9C   ; 
- D 1 - I - 0x00AFA0 02:AF90: 30        .byte $30, $30, $30, $31   ; 
- D 1 - I - 0x00AFA4 02:AF94: 9E        .byte $9E, $9E, $9E, $9E   ; 
; AC 
- D 1 - I - 0x00AFA8 02:AF98: 9C        .byte $9C, $00, $00, $00   ; 
- D 1 - I - 0x00AFAC 02:AF9C: 9C        .byte $9C, $00, $00, $00   ; 
- D 1 - I - 0x00AFB0 02:AFA0: 31        .byte $31, $00, $00, $00   ; 
- D 1 - I - 0x00AFB4 02:AFA4: 9E        .byte $9E, $9E, $9E, $9E   ; 
; AD 
- D 1 - I - 0x00AFB8 02:AFA8: 76        .byte $76, $AB, $05, $9C   ; 
- D 1 - I - 0x00AFBC 02:AFAC: A9        .byte $A9, $AB, $AA, $9C   ; 
- D 1 - I - 0x00AFC0 02:AFB0: 2F        .byte $2F, $30, $30, $31   ; 
- D 1 - I - 0x00AFC4 02:AFB4: 9E        .byte $9E, $9E, $9E, $9E   ; 
; AE 
- D 1 - I - 0x00AFC8 02:AFB8: 0F        .byte $0F, $35, $10, $3B   ; 
- D 1 - I - 0x00AFCC 02:AFBC: 14        .byte $14, $84, $82, $00   ; 
- D 1 - I - 0x00AFD0 02:AFC0: 00        .byte $00, $D8, $00, $00   ; 
- D 1 - I - 0x00AFD4 02:AFC4: 9E        .byte $9E, $E9, $00, $00   ; 
; AF 
- D 1 - I - 0x00AFD8 02:AFC8: 00        .byte $00, $55, $00, $00   ; 
- D 1 - I - 0x00AFDC 02:AFCC: 15        .byte $15, $A9, $AA, $AA   ; 
- D 1 - I - 0x00AFE0 02:AFD0: 15        .byte $15, $A9, $05, $E2   ; 
- D 1 - I - 0x00AFE4 02:AFD4: 15        .byte $15, $A9, $AA, $AA   ; 
; B0 
- D 1 - I - 0x00AFE8 02:AFD8: 00        .byte $00, $55, $00, $00   ; 
- D 1 - I - 0x00AFEC 02:AFDC: AA        .byte $AA, $56, $AA, $9C   ; 
- D 1 - I - 0x00AFF0 02:AFE0: 05        .byte $05, $E2, $05, $9C   ; 
- D 1 - I - 0x00AFF4 02:AFE4: AA        .byte $AA, $AA, $AA, $9C   ; 
; B1 
- D 1 - I - 0x00AFF8 02:AFE8: 00        .byte $00, $55, $00, $00   ; 
- D 1 - I - 0x00AFFC 02:AFEC: AA        .byte $AA, $56, $AA, $AA   ; 
- D 1 - I - 0x00B000 02:AFF0: 9C        .byte $9C, $00, $00, $00   ; 
- D 1 - I - 0x00B004 02:AFF4: 9C        .byte $9C, $00, $00, $00   ; 
; B2 
- D 1 - I - 0x00B008 02:AFF8: 00        .byte $00, $55, $00, $00   ; 
- D 1 - I - 0x00B00C 02:AFFC: AA        .byte $AA, $56, $AA, $9C   ; 
- D 1 - I - 0x00B010 02:B000: 76        .byte $76, $AB, $05, $9C   ; 
- D 1 - I - 0x00B014 02:B004: A9        .byte $A9, $AB, $AA, $9C   ; 
; B3 
- D 1 - I - 0x00B018 02:B008: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B01C 02:B00C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B020 02:B010: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B024 02:B014: 00        .byte $00, $00, $00, $57   ; 
; B4 
- D 1 - I - 0x00B028 02:B018: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B02C 02:B01C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B030 02:B020: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B034 02:B024: 9D        .byte $9D, $9E, $9E, $9E   ; 
; B5 
- D 1 - I - 0x00B038 02:B028: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B03C 02:B02C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B040 02:B030: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B044 02:B034: 9E        .byte $9E, $9E, $9E, $9E   ; 
; B6 
- D 1 - I - 0x00B048 02:B038: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B04C 02:B03C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B050 02:B040: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B054 02:B044: 9E        .byte $9E, $E9, $00, $00   ; 
; B7 
- D 1 - I - 0x00B058 02:B048: 22        .byte $22, $47, $25, $4A   ; 
- D 1 - I - 0x00B05C 02:B04C: 22        .byte $22, $47, $00, $4F   ; 
- D 1 - I - 0x00B060 02:B050: 22        .byte $22, $47, $27, $4D   ; 
- D 1 - I - 0x00B064 02:B054: 22        .byte $22, $4C, $4D, $28   ; 
; B8 
- D 1 - I - 0x00B068 02:B058: 2A        .byte $2A, $4D, $29, $47   ; 
- D 1 - I - 0x00B06C 02:B05C: 00        .byte $00, $50, $22, $47   ; 
- D 1 - I - 0x00B070 02:B060: 2B        .byte $2B, $4A, $26, $47   ; 
- D 1 - I - 0x00B074 02:B064: 00        .byte $00, $25, $4A, $4B   ; 
; B9 
- D 1 - I - 0x00B078 02:B068: 00        .byte $00, $00, $00, $58   ; 
- D 1 - I - 0x00B07C 02:B06C: 00        .byte $00, $00, $00, $59   ; 
- D 1 - I - 0x00B080 02:B070: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B084 02:B074: 00        .byte $00, $00, $00, $00   ; 
; BA 
- D 1 - I - 0x00B088 02:B078: 2E        .byte $2E, $2F, $30, $30   ; 
- D 1 - I - 0x00B08C 02:B07C: 9D        .byte $9D, $9E, $9E, $9E   ; 
- D 1 - I - 0x00B090 02:B080: 23        .byte $23, $51, $2C, $00   ; 
- D 1 - I - 0x00B094 02:B084: 22        .byte $22, $49, $4A, $2C   ; 
; BB 
- D 1 - I - 0x00B098 02:B088: 30        .byte $30, $30, $30, $31   ; 
- D 1 - I - 0x00B09C 02:B08C: 9E        .byte $9E, $9E, $9E, $9E   ; 
- D 1 - I - 0x00B0A0 02:B090: 00        .byte $00, $00, $2D, $52   ; 
- D 1 - I - 0x00B0A4 02:B094: 00        .byte $00, $27, $4D, $4E   ; 
; BC 
- D 1 - I - 0x00B0A8 02:B098: 30        .byte $30, $30, $30, $31   ; 
- D 1 - I - 0x00B0AC 02:B09C: 9E        .byte $9E, $9E, $9E, $9E   ; 
- D 1 - I - 0x00B0B0 02:B0A0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B0B4 02:B0A4: 00        .byte $00, $00, $00, $00   ; 
; BD 
- D 1 - I - 0x00B0B8 02:B0A8: 31        .byte $31, $00, $00, $00   ; 
- D 1 - I - 0x00B0BC 02:B0AC: 9E        .byte $9E, $9E, $9E, $9E   ; 
- D 1 - I - 0x00B0C0 02:B0B0: 23        .byte $23, $51, $2C, $00   ; 
- D 1 - I - 0x00B0C4 02:B0B4: 22        .byte $22, $49, $4A, $2C   ; 
; BE 
- D 1 - I - 0x00B0C8 02:B0B8: 2F        .byte $2F, $30, $30, $31   ; 
- D 1 - I - 0x00B0CC 02:B0BC: 9E        .byte $9E, $9E, $9E, $9E   ; 
- D 1 - I - 0x00B0D0 02:B0C0: 00        .byte $00, $00, $2D, $52   ; 
- D 1 - I - 0x00B0D4 02:B0C4: 00        .byte $00, $27, $4D, $4E   ; 
; BF 
- D 1 - I - 0x00B0D8 02:B0C8: 00        .byte $00, $D8, $00, $00   ; 
- D 1 - I - 0x00B0DC 02:B0CC: 9E        .byte $9E, $E9, $00, $00   ; 
- D 1 - I - 0x00B0E0 02:B0D0: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B0E4 02:B0D4: 00        .byte $00, $00, $00, $00   ; 
; C0 
- D 1 - I - 0x00B0E8 02:B0D8: 15        .byte $15, $A9, $05, $E2   ; 
- D 1 - I - 0x00B0EC 02:B0DC: 15        .byte $15, $A9, $AA, $AA   ; 
- D 1 - I - 0x00B0F0 02:B0E0: 15        .byte $15, $C3, $05, $AA   ; 
- D 1 - I - 0x00B0F4 02:B0E4: 15        .byte $15, $A9, $AA, $AA   ; 
; C1 
- D 1 - I - 0x00B0F8 02:B0E8: 05        .byte $05, $E2, $05, $9C   ; 
- D 1 - I - 0x00B0FC 02:B0EC: AA        .byte $AA, $AA, $AA, $9C   ; 
- D 1 - I - 0x00B100 02:B0F0: 05        .byte $05, $AA, $05, $9C   ; 
- D 1 - I - 0x00B104 02:B0F4: AA        .byte $AA, $AA, $AA, $9C   ; 
; C2 
- - - - - - 0x00B108 02:B0F8: 05        .byte $05, $E2, $05, $9C   ; 
- - - - - - 0x00B10C 02:B0FC: AA        .byte $AA, $AA, $AA, $9C   ; 
- - - - - - 0x00B110 02:B100: 05        .byte $05, $AA, $05, $9C   ; 
- - - - - - 0x00B114 02:B104: AA        .byte $AA, $AA, $AA, $9C   ; 
; C3 
- D 1 - I - 0x00B118 02:B108: 9C        .byte $9C, $00, $00, $00   ; 
- D 1 - I - 0x00B11C 02:B10C: 9C        .byte $9C, $00, $00, $00   ; 
- D 1 - I - 0x00B120 02:B110: 9C        .byte $9C, $00, $00, $00   ; 
- D 1 - I - 0x00B124 02:B114: 9C        .byte $9C, $00, $00, $00   ; 
; C4 
- D 1 - I - 0x00B128 02:B118: 76        .byte $76, $AB, $05, $9C   ; 
- D 1 - I - 0x00B12C 02:B11C: A9        .byte $A9, $AB, $AA, $9C   ; 
- D 1 - I - 0x00B130 02:B120: 76        .byte $76, $AB, $05, $9C   ; 
- D 1 - I - 0x00B134 02:B124: A9        .byte $A9, $AB, $AA, $9C   ; 
; C5 
- D 1 - I - 0x00B138 02:B128: 00        .byte $00, $00, $00, $57   ; 
- D 1 - I - 0x00B13C 02:B12C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B140 02:B130: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B144 02:B134: 00        .byte $00, $00, $00, $00   ; 
; C6 
- D 1 - I - 0x00B148 02:B138: 9D        .byte $9D, $9E, $9E, $9E   ; 
- D 1 - I - 0x00B14C 02:B13C: 00        .byte $00, $55, $00, $00   ; 
- D 1 - I - 0x00B150 02:B140: 15        .byte $15, $A9, $05, $AA   ; 
- D 1 - I - 0x00B154 02:B144: 15        .byte $15, $A9, $AA, $AA   ; 
; C7 
- D 1 - I - 0x00B158 02:B148: 9E        .byte $9E, $9E, $9E, $9E   ; 
- D 1 - I - 0x00B15C 02:B14C: 00        .byte $00, $55, $00, $00   ; 
- D 1 - I - 0x00B160 02:B150: 05        .byte $05, $56, $05, $9C   ; 
- D 1 - I - 0x00B164 02:B154: AA        .byte $AA, $AA, $AA, $9C   ; 
; C8 
- D 1 - I - 0x00B168 02:B158: 9E        .byte $9E, $9E, $9E, $9E   ; 
- D 1 - I - 0x00B16C 02:B15C: 00        .byte $00, $55, $00, $00   ; 
- D 1 - I - 0x00B170 02:B160: 05        .byte $05, $56, $05, $AA   ; 
- D 1 - I - 0x00B174 02:B164: AA        .byte $AA, $AA, $AA, $AA   ; 
; C9 
- D 1 - I - 0x00B178 02:B168: 9E        .byte $9E, $E9, $00, $00   ; 
- D 1 - I - 0x00B17C 02:B16C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B180 02:B170: 00        .byte $00, $00, $0B, $0C   ; 
- D 1 - I - 0x00B184 02:B174: 0F        .byte $0F, $0F, $35, $3B   ; 
; CA 
- D 1 - I - 0x00B188 02:B178: 9E        .byte $9E, $E9, $00, $00   ; 
- D 1 - I - 0x00B18C 02:B17C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B190 02:B180: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B194 02:B184: 00        .byte $00, $00, $00, $00   ; 
; CB 
- D 1 - I - 0x00B198 02:B188: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B19C 02:B18C: 9F        .byte $9F, $00, $00, $00   ; 
- D 1 - I - 0x00B1A0 02:B190: 1F        .byte $1F, $1C, $1D, $1E   ; 
- D 1 - I - 0x00B1A4 02:B194: 00        .byte $00, $00, $00, $00   ; 
; CC 
- D 1 - I - 0x00B1A8 02:B198: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1AC 02:B19C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1B0 02:B1A0: 00        .byte $00, $00, $9F, $00   ; 
- D 1 - I - 0x00B1B4 02:B1A4: 00        .byte $00, $00, $1F, $1C   ; 
; CD 
- D 1 - I - 0x00B1B8 02:B1A8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1BC 02:B1AC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1C0 02:B1B0: 19        .byte $19, $00, $00, $1B   ; 
- D 1 - I - 0x00B1C4 02:B1B4: 1C        .byte $1C, $1D, $1E, $7D   ; 
; CE 
- D 1 - I - 0x00B1C8 02:B1B8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1CC 02:B1BC: 00        .byte $00, $00, $00, $19   ; 
- D 1 - I - 0x00B1D0 02:B1C0: 9F        .byte $9F, $00, $1A, $00   ; 
- D 1 - I - 0x00B1D4 02:B1C4: 1F        .byte $1F, $7E, $1E, $1C   ; 
; CF 
- D 1 - I - 0x00B1D8 02:B1C8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1DC 02:B1CC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1E0 02:B1D0: 00        .byte $00, $1A, $00, $7F   ; 
- D 1 - I - 0x00B1E4 02:B1D4: 1D        .byte $1D, $7C, $1F, $1E   ; 
; D0 
- D 1 - I - 0x00B1E8 02:B1D8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1EC 02:B1DC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1F0 02:B1E0: 9F        .byte $9F, $00, $00, $1A   ; 
- D 1 - I - 0x00B1F4 02:B1E4: 1F        .byte $1F, $1C, $7E, $1E   ; 
; D1 
- D 1 - I - 0x00B1F8 02:B1E8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B1FC 02:B1EC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B200 02:B1F0: 1B        .byte $1B, $00, $00, $00   ; 
- D 1 - I - 0x00B204 02:B1F4: 7D        .byte $7D, $00, $00, $1B   ; 
; D2 
- D 1 - I - 0x00B208 02:B1F8: 00        .byte $00, $00, $00, $1A   ; 
- D 1 - I - 0x00B20C 02:B1FC: 1F        .byte $1F, $1C, $7E, $1E   ; 
- D 1 - I - 0x00B210 02:B200: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B214 02:B204: 00        .byte $00, $00, $00, $00   ; 
; D3 
- D 1 - I - 0x00B218 02:B208: 1B        .byte $1B, $00, $00, $00   ; 
- D 1 - I - 0x00B21C 02:B20C: 7D        .byte $7D, $00, $00, $1B   ; 
- D 1 - I - 0x00B220 02:B210: 1F        .byte $1F, $1C, $1D, $1E   ; 
- D 1 - I - 0x00B224 02:B214: 00        .byte $00, $00, $00, $00   ; 
; D4 
- D 1 - I - 0x00B228 02:B218: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B22C 02:B21C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B230 02:B220: 16        .byte $16, $17, $17, $17   ; 
- D 1 - I - 0x00B234 02:B224: 99        .byte $99, $3F, $3F, $3F   ; 
; D5 
- D 1 - I - 0x00B238 02:B228: 1F        .byte $1F, $1C, $1D, $1E   ; 
- D 1 - I - 0x00B23C 02:B22C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B240 02:B230: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B244 02:B234: 00        .byte $00, $00, $00, $00   ; 
; D6 
- D 1 - I - 0x00B248 02:B238: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B24C 02:B23C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B250 02:B240: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B254 02:B244: 00        .byte $00, $0B, $09, $0A   ; 
; D7 
- D 1 - I - 0x00B258 02:B248: 00        .byte $00, $00, $91, $92   ; 
- D 1 - I - 0x00B25C 02:B24C: 00        .byte $00, $00, $91, $92   ; 
- D 1 - I - 0x00B260 02:B250: 00        .byte $00, $00, $91, $92   ; 
- D 1 - I - 0x00B264 02:B254: 00        .byte $00, $00, $91, $92   ; 
; D8 
- D 1 - I - 0x00B268 02:B258: 0A        .byte $0A, $09, $91, $92   ; 
- D 1 - I - 0x00B26C 02:B25C: 33        .byte $33, $34, $91, $92   ; 
- D 1 - I - 0x00B270 02:B260: 14        .byte $14, $39, $91, $92   ; 
- D 1 - I - 0x00B274 02:B264: 00        .byte $00, $81, $91, $92   ; 
; D9 
- D 1 - I - 0x00B278 02:B268: BD        .byte $BD, $D1, $D5, $D6   ; 
- D 1 - I - 0x00B27C 02:B26C: D1        .byte $D1, $D4, $BD, $BD   ; 
- D 1 - I - 0x00B280 02:B270: D4        .byte $D4, $BD, $BD, $BD   ; 
- D 1 - I - 0x00B284 02:B274: BD        .byte $BD, $BD, $BD, $BD   ; 
; DA 
- D 1 - I - 0x00B288 02:B278: D7        .byte $D7, $BD, $BD, $BD   ; 
- D 1 - I - 0x00B28C 02:B27C: D5        .byte $D5, $D6, $D7, $BD   ; 
- D 1 - I - 0x00B290 02:B280: BD        .byte $BD, $BD, $D5, $D6   ; 
- D 1 - I - 0x00B294 02:B284: BD        .byte $BD, $BD, $BD, $BD   ; 
; DB 
- D 1 - I - 0x00B298 02:B288: A9        .byte $A9, $AA, $AA, $AA   ; 
- D 1 - I - 0x00B29C 02:B28C: A9        .byte $A9, $AA, $AA, $AA   ; 
- D 1 - I - 0x00B2A0 02:B290: F1        .byte $F1, $AA, $AA, $AA   ; 
- D 1 - I - 0x00B2A4 02:B294: A8        .byte $A8, $A1, $A1, $A1   ; 
; DC 
- D 1 - I - 0x00B2A8 02:B298: 00        .byte $00, $00, $91, $BD   ; 
- D 1 - I - 0x00B2AC 02:B29C: 00        .byte $00, $00, $91, $BD   ; 
- D 1 - I - 0x00B2B0 02:B2A0: 00        .byte $00, $00, $91, $BD   ; 
- D 1 - I - 0x00B2B4 02:B2A4: 00        .byte $00, $00, $91, $BD   ; 
; DD 
- D 1 - I - 0x00B2B8 02:B2A8: BD        .byte $BD, $BD, $BD, $BD   ; 
- D 1 - I - 0x00B2BC 02:B2AC: BD        .byte $BD, $BD, $BD, $BD   ; 
- D 1 - I - 0x00B2C0 02:B2B0: BD        .byte $BD, $BD, $BD, $BD   ; 
- D 1 - I - 0x00B2C4 02:B2B4: BD        .byte $BD, $BD, $BD, $BD   ; 
; DE 
- D 1 - I - 0x00B2C8 02:B2B8: A9        .byte $A9, $AA, $AA, $AA   ; 
- D 1 - I - 0x00B2CC 02:B2BC: A9        .byte $A9, $AA, $AB, $AA   ; 
- D 1 - I - 0x00B2D0 02:B2C0: A9        .byte $A9, $AA, $AA, $AA   ; 
- D 1 - I - 0x00B2D4 02:B2C4: A9        .byte $A9, $AA, $AB, $AA   ; 
; DF 
- D 1 - I - 0x00B2D8 02:B2C8: C3        .byte $C3, $AA, $AA, $AA   ; 
- D 1 - I - 0x00B2DC 02:B2CC: A9        .byte $A9, $AA, $AB, $AA   ; 
- D 1 - I - 0x00B2E0 02:B2D0: A9        .byte $A9, $AA, $AA, $AA   ; 
- D 1 - I - 0x00B2E4 02:B2D4: A9        .byte $A9, $AA, $AB, $AA   ; 
; E0 
- D 1 - I - 0x00B2E8 02:B2D8: 95        .byte $95, $BD, $D2, $D1   ; 
- D 1 - I - 0x00B2EC 02:B2DC: 96        .byte $96, $97, $D1, $BD   ; 
- D 1 - I - 0x00B2F0 02:B2E0: 96        .byte $96, $98, $97, $BD   ; 
- D 1 - I - 0x00B2F4 02:B2E4: 96        .byte $96, $C4, $98, $97   ; 
; E1 
- D 1 - I - 0x00B2F8 02:B2E8: 9A        .byte $9A, $00, $C4, $98   ; 
- D 1 - I - 0x00B2FC 02:B2EC: C9        .byte $C9, $00, $00, $98   ; 
- D 1 - I - 0x00B300 02:B2F0: C9        .byte $C9, $00, $00, $C4   ; 
- D 1 - I - 0x00B304 02:B2F4: C9        .byte $C9, $00, $00, $00   ; 
; E2 
- D 1 - I - 0x00B308 02:B2F8: C9        .byte $C9, $00, $00, $00   ; 
- D 1 - I - 0x00B30C 02:B2FC: C9        .byte $C9, $00, $00, $00   ; 
- D 1 - I - 0x00B310 02:B300: C9        .byte $C9, $00, $00, $00   ; 
- D 1 - I - 0x00B314 02:B304: C7        .byte $C7, $C8, $00, $00   ; 
; E3 
- D 1 - I - 0x00B318 02:B308: BD        .byte $BD, $CA, $C1, $C5   ; 
- D 1 - I - 0x00B31C 02:B30C: BD        .byte $BD, $BD, $CA, $96   ; 
- D 1 - I - 0x00B320 02:B310: C0        .byte $C0, $C0, $A7, $C6   ; 
- D 1 - I - 0x00B324 02:B314: B9        .byte $B9, $E7, $9E, $E9   ; 
; E4 
- D 1 - I - 0x00B328 02:B318: C2        .byte $C2, $D2, $BD, $D1   ; 
- D 1 - I - 0x00B32C 02:B31C: C2        .byte $C2, $D1, $D3, $BD   ; 
- D 1 - I - 0x00B330 02:B320: C2        .byte $C2, $D4, $BD, $BD   ; 
- D 1 - I - 0x00B334 02:B324: CE        .byte $CE, $D0, $BD, $BD   ; 
; E5 
- D 1 - I - 0x00B338 02:B328: 94        .byte $94, $CF, $D0, $BD   ; 
- D 1 - I - 0x00B33C 02:B32C: 00        .byte $00, $93, $CF, $D0   ; 
- D 1 - I - 0x00B340 02:B330: 00        .byte $00, $94, $BD, $CF   ; 
- D 1 - I - 0x00B344 02:B334: 00        .byte $00, $00, $93, $BD   ; 
; E6 
- - - - - - 0x00B348 02:B338: 00        .byte $00, $00, $94, $BD   ; 
- - - - - - 0x00B34C 02:B33C: 00        .byte $00, $00, $00, $93   ; 
- - - - - - 0x00B350 02:B340: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00B354 02:B344: 00        .byte $00, $00, $00, $00   ; 
; E7 
- D 1 - I - 0x00B358 02:B348: 00        .byte $00, $00, $91, $92   ; 
- D 1 - I - 0x00B35C 02:B34C: 00        .byte $00, $00, $CB, $CC   ; 
- D 1 - I - 0x00B360 02:B350: 00        .byte $00, $00, $91, $CD   ; 
- D 1 - I - 0x00B364 02:B354: F7        .byte $F7, $F7, $F7, $F7   ; 
; E8 
- D 1 - I - 0x00B368 02:B358: 09        .byte $09, $32, $32, $00   ; 
- D 1 - I - 0x00B36C 02:B35C: 33        .byte $33, $34, $34, $0F   ; 
- D 1 - I - 0x00B370 02:B360: 14        .byte $14, $83, $3A, $14   ; 
- D 1 - I - 0x00B374 02:B364: 00        .byte $00, $00, $00, $00   ; 
; E9 
- D 1 - I - 0x00B378 02:B368: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B37C 02:B36C: 0D        .byte $0D, $09, $32, $00   ; 
- D 1 - I - 0x00B380 02:B370: 12        .byte $12, $36, $0E, $0D   ; 
- D 1 - I - 0x00B384 02:B374: 81        .byte $81, $83, $3A, $36   ; 
; EA 
- D 1 - I - 0x00B388 02:B378: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B38C 02:B37C: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B390 02:B380: 32        .byte $32, $00, $00, $00   ; 
- D 1 - I - 0x00B394 02:B384: 0E        .byte $0E, $0D, $09, $32   ; 
; EB 
- D 1 - I - 0x00B398 02:B388: C2        .byte $C2, $BD, $BD, $BD   ; 
- D 1 - I - 0x00B39C 02:B38C: C2        .byte $C2, $BD, $BD, $BD   ; 
- D 1 - I - 0x00B3A0 02:B390: C2        .byte $C2, $BD, $BD, $BD   ; 
- D 1 - I - 0x00B3A4 02:B394: C2        .byte $C2, $BD, $BD, $BD   ; 
; EC 
- D 1 - I - 0x00B3A8 02:B398: 09        .byte $09, $09, $0A, $09   ; 
- D 1 - I - 0x00B3AC 02:B39C: 33        .byte $33, $34, $33, $34   ; 
- D 1 - I - 0x00B3B0 02:B3A0: 11        .byte $11, $37, $11, $37   ; 
- D 1 - I - 0x00B3B4 02:B3A4: 80        .byte $80, $83, $80, $82   ; 
; ED 
- D 1 - I - 0x00B3B8 02:B3A8: 0A        .byte $0A, $09, $0A, $09   ; 
- D 1 - I - 0x00B3BC 02:B3AC: 34        .byte $34, $33, $3B, $12   ; 
- D 1 - I - 0x00B3C0 02:B3B0: 14        .byte $14, $82, $00, $00   ; 
- D 1 - I - 0x00B3C4 02:B3B4: 00        .byte $00, $00, $01, $5E   ; 
; EE 
- D 1 - I - 0x00B3C8 02:B3B8: 3A        .byte $3A, $14, $12, $0E   ; 
- D 1 - I - 0x00B3CC 02:B3BC: 00        .byte $00, $00, $81, $83   ; 
- D 1 - I - 0x00B3D0 02:B3C0: 17        .byte $17, $17, $17, $3E   ; 
- D 1 - I - 0x00B3D4 02:B3C4: 3F        .byte $3F, $3F, $3F, $3F   ; 
; EF 
- D 1 - I - 0x00B3D8 02:B3C8: 0F        .byte $0F, $0D, $0A, $09   ; 
- D 1 - I - 0x00B3DC 02:B3CC: 14        .byte $14, $12, $36, $36   ; 
- D 1 - I - 0x00B3E0 02:B3D0: 00        .byte $00, $81, $83, $13   ; 
- D 1 - I - 0x00B3E4 02:B3D4: 00        .byte $00, $00, $00, $00   ; 
; F0 
- D 1 - I - 0x00B3E8 02:B3D8: E0        .byte $E0, $88, $86, $87   ; 
- D 1 - I - 0x00B3EC 02:B3DC: BE        .byte $BE, $E0, $86, $87   ; 
- D 1 - I - 0x00B3F0 02:B3E0: C0        .byte $C0, $C0, $C0, $C0   ; 
- D 1 - I - 0x00B3F4 02:B3E4: 9D        .byte $9D, $9E, $9E, $E6   ; 
; F1 
- D 1 - I - 0x00B3F8 02:B3E8: E0        .byte $E0, $88, $79, $7A   ; 
- D 1 - I - 0x00B3FC 02:B3EC: BE        .byte $BE, $E0, $86, $87   ; 
- D 1 - I - 0x00B400 02:B3F0: C0        .byte $C0, $C0, $C0, $C0   ; 
- D 1 - I - 0x00B404 02:B3F4: 9D        .byte $9D, $9E, $9E, $E6   ; 
; F2 
- D 1 - I - 0x00B408 02:B3F8: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B40C 02:B3FC: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00B410 02:B400: 89        .byte $89, $8A, $8B, $8C   ; 
- D 1 - I - 0x00B414 02:B404: 8D        .byte $8D, $8E, $8F, $90   ; 
; F3 
- D 1 - I - 0x00B418 02:B408: 89        .byte $89, $8A, $8B, $8C   ; 
- D 1 - I - 0x00B41C 02:B40C: 8D        .byte $8D, $8E, $8F, $90   ; 
- D 1 - I - 0x00B420 02:B410: 77        .byte $77, $78, $79, $7A   ; 
- D 1 - I - 0x00B424 02:B414: 7B        .byte $7B, $85, $86, $87   ; 



_off007_0x00B428_00_area_1:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
- D 1 - I - 0x00B428 02:B418: 00        .byte $00, $00, $00, $00, $00, $00, $00, $40, $40, $50, $00, $00, $10, $00, $00, $00   ; 00 
- D 1 - I - 0x00B438 02:B428: 00        .byte $00, $40, $00, $00, $00, $00, $00, $00, $00, $00, $00, $54, $00, $00, $00, $00   ; 10 
- D 1 - I - 0x00B448 02:B438: 00        .byte $00, $00, $40, $00, $04, $55, $55, $11, $40, $11, $00, $05, $00, $00, $00, $00   ; 20 
- D 1 - I - 0x00B458 02:B448: 40        .byte $40, $00, $04, $04, $00, $00, $00, $00, $00, $00, $00, $11, $00, $40, $00, $AA   ; 30 
- D 1 - I - 0x00B468 02:B458: AA        .byte $AA, $A5, $55, $55, $AA, $66, $55, $55, $AA, $55, $A5, $65, $AA, $AA, $AA, $AA   ; 40 
- D 1 - I - 0x00B478 02:B468: 55        .byte $55, $AA, $AA, $AA, $9A, $AA, $AA, $A8, $A9, $AA, $EA, $AA, $AA, $AA, $AA, $AA   ; 50 
- D 1 - I - 0x00B488 02:B478: AA        .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $03, $0C, $00, $00, $0C, $FF, $FF, $FF   ; 60 
- D 1 - I - 0x00B498 02:B488: FF        .byte $FF, $F0, $3F, $CF, $FF, $0C, $33, $FF, $FF, $03, $00, $0C, $0F, $03, $00, $00   ; 70 
- D 1 - I - 0x00B4A8 02:B498: 0C        .byte $0C, $AA, $AA, $0A, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $F8, $AA, $0F, $03   ; 80 
- D 1 - I - 0x00B4B8 02:B4A8: 00        .byte $00, $00, $F0, $F0, $F0, $F0, $00, $40, $00, $C0, $00, $00, $00, $0F, $0F, $03   ; 90 
- D 1 - I - 0x00B4C8 02:B4B8: 0C        .byte $0C, $0F, $0C, $0F, $0C, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $0A, $00   ; A0 
- D 1 - I - 0x00B4D8 02:B4C8: 00        .byte $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $00, $F0, $F0, $00, $F0, $F0, $00   ; B0 
- D 1 - I - 0x00B4E8 02:B4D8: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $A8, $00, $AA, $80, $A0, $A8, $AA   ; C0 
- D 1 - I - 0x00B4F8 02:B4E8: A0        .byte $A0, $A0, $0A, $AA, $F0, $0A, $A0, $00, $22, $00, $00, $00, $00, $00, $00, $00   ; D0 
- D 1 - I - 0x00B508 02:B4F8: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $AA, $AA, $A0, $00, $AA, $2A, $FA, $AA   ; E0 
- D 1 - I - 0x00B518 02:B508: 00        .byte $00, $00, $00, $00                                                               ; F0 





.out .sprintf("Free bytes in bank 34: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_34b"
- D 1 - - - 0x00C00F 02:BFFF: 35        .byte con_prg_bank + $35   ; 



