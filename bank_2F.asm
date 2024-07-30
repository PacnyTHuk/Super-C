.segment "BANK_2F"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $A000 ; for listing file
; 0x01E100-0x02000F
; перенесен с 31 банка, музыка/звуки разделен на 2E-2F




.export _off014_32_0x00263F_00
.export _off014_32_0x002730_01
.export _off014_32_0x0027DC_02
.export _off014_32_0x002854_03
.export _off014_36_0x0028DE_00
.export _off014_36_0x002962_01
.export _off014_36_0x0029E4_02
.export _off014_36_0x002A7D_03
.export _off004_0x002B55_01_area_2
.export _off005_0x002B71_01_area_2
.export _off006_0x002F4F_01_area_2
.export _off007_0x003E9F_01_area_2



_off014_32_0x00263F_00:
- D 1 - I - 0x00263F 00:A62F: EE        .byte $EE   ; 
- D 1 - I - 0x002640 00:A630: 06        .byte $06   ; 
- D 1 - I - 0x002641 00:A631: E6        .byte $E6   ; 
- D 1 - I - 0x002642 00:A632: 06        .byte $06   ; 
- D 1 - I - 0x002643 00:A633: C5        .byte $C5   ; 
loc_FF_A634:
- D 1 - I - 0x002644 00:A634: EE        .byte $EE   ; 
- D 1 - I - 0x002645 00:A635: 06        .byte $06   ; 
- D 1 - I - 0x002646 00:A636: E6        .byte $E6   ; 
- D 1 - I - 0x002647 00:A637: 01        .byte $01   ; 
- D 1 - I - 0x002648 00:A638: C0        .byte $C0   ; 
- D 1 - I - 0x002649 00:A639: ED        .byte $ED   ; 
- D 1 - I - 0x00264A 00:A63A: 81        .byte $81   ; 
- D 1 - I - 0x00264B 00:A63B: EC        .byte $EC   ; 
- D 1 - I - 0x00264C 00:A63C: 05        .byte $05   ; 
- D 1 - I - 0x00264D 00:A63D: E9        .byte $E9   ; 
- D 1 - I - 0x00264E 00:A63E: B9        .byte $B9   ; 
- D 1 - I - 0x00264F 00:A63F: D6        .byte $D6   ; 
- D 1 - I - 0x002650 00:A640: 30        .byte $30   ; 
- D 1 - I - 0x002651 00:A641: 26        .byte $26   ; 
- D 1 - I - 0x002652 00:A642: 17        .byte $17   ; 
- D 1 - I - 0x002653 00:A643: E4        .byte $E4   ; 
- D 1 - I - 0x002654 00:A644: 53        .byte $53   ; 
- D 1 - I - 0x002655 00:A645: 22        .byte $22   ; 
- D 1 - I - 0x002656 00:A646: 74        .byte $74   ; 
- D 1 - I - 0x002657 00:A647: 22        .byte $22   ; 
- D 1 - I - 0x002658 00:A648: 84        .byte $84   ; 
- D 1 - I - 0x002659 00:A649: 22        .byte $22   ; 
- D 1 - I - 0x00265A 00:A64A: 91        .byte $91   ; 
- D 1 - I - 0x00265B 00:A64B: E6        .byte $E6   ; 
- D 1 - I - 0x00265C 00:A64C: 11        .byte $11   ; 
- D 1 - I - 0x00265D 00:A64D: 80        .byte $80   ; 
- D 1 - I - 0x00265E 00:A64E: E6        .byte $E6   ; 
- D 1 - I - 0x00265F 00:A64F: 06        .byte $06   ; 
- D 1 - I - 0x002660 00:A650: ED        .byte $ED   ; 
- D 1 - I - 0x002661 00:A651: 01        .byte $01   ; 
- D 1 - I - 0x002662 00:A652: E9        .byte $E9   ; 
- D 1 - I - 0x002663 00:A653: 31        .byte $31   ; 
- D 1 - I - 0x002664 00:A654: E2        .byte $E2   ; 
- D 1 - I - 0x002665 00:A655: 71        .byte $71   ; 
- D 1 - I - 0x002666 00:A656: 80        .byte $80   ; 
- D 1 - I - 0x002667 00:A657: E8        .byte $E8   ; 
- D 1 - I - 0x002668 00:A658: 11        .byte $11   ; 
- D 1 - I - 0x002669 00:A659: 94        .byte $94   ; 
- D 1 - I - 0x00266A 00:A65A: E8        .byte $E8   ; 
- D 1 - I - 0x00266B 00:A65B: 17        .byte $17   ; 
- D 1 - I - 0x00266C 00:A65C: E6        .byte $E6   ; 
- D 1 - I - 0x00266D 00:A65D: 01        .byte $01   ; 
- D 1 - I - 0x00266E 00:A65E: C0        .byte $C0   ; 
- D 1 - I - 0x00266F 00:A65F: E6        .byte $E6   ; 
- D 1 - I - 0x002670 00:A660: 06        .byte $06   ; 
- D 1 - I - 0x002671 00:A661: ED        .byte $ED   ; 
- D 1 - I - 0x002672 00:A662: 81        .byte $81   ; 
- D 1 - I - 0x002673 00:A663: E9        .byte $E9   ; 
- D 1 - I - 0x002674 00:A664: B9        .byte $B9   ; 
- D 1 - I - 0x002675 00:A665: E4        .byte $E4   ; 
- D 1 - I - 0x002676 00:A666: 22        .byte $22   ; 
- D 1 - I - 0x002677 00:A667: 74        .byte $74   ; 
- D 1 - I - 0x002678 00:A668: 22        .byte $22   ; 
- D 1 - I - 0x002679 00:A669: 84        .byte $84   ; 
- D 1 - I - 0x00267A 00:A66A: 22        .byte $22   ; 
- D 1 - I - 0x00267B 00:A66B: 91        .byte $91   ; 
- D 1 - I - 0x00267C 00:A66C: E6        .byte $E6   ; 
- D 1 - I - 0x00267D 00:A66D: 11        .byte $11   ; 
- D 1 - I - 0x00267E 00:A66E: 80        .byte $80   ; 
- D 1 - I - 0x00267F 00:A66F: E6        .byte $E6   ; 
- D 1 - I - 0x002680 00:A670: 06        .byte $06   ; 
- D 1 - I - 0x002681 00:A671: ED        .byte $ED   ; 
- D 1 - I - 0x002682 00:A672: 01        .byte $01   ; 
- D 1 - I - 0x002683 00:A673: E9        .byte $E9   ; 
- D 1 - I - 0x002684 00:A674: 31        .byte $31   ; 
- D 1 - I - 0x002685 00:A675: E2        .byte $E2   ; 
- D 1 - I - 0x002686 00:A676: 91        .byte $91   ; 
- D 1 - I - 0x002687 00:A677: 90        .byte $90   ; 
- D 1 - I - 0x002688 00:A678: E8        .byte $E8   ; 
- D 1 - I - 0x002689 00:A679: 11        .byte $11   ; 
- D 1 - I - 0x00268A 00:A67A: A4        .byte $A4   ; 
- D 1 - I - 0x00268B 00:A67B: E8        .byte $E8   ; 
- D 1 - I - 0x00268C 00:A67C: 17        .byte $17   ; 
- D 1 - I - 0x00268D 00:A67D: E6        .byte $E6   ; 
- D 1 - I - 0x00268E 00:A67E: 01        .byte $01   ; 
- D 1 - I - 0x00268F 00:A67F: C0        .byte $C0   ; 
- D 1 - I - 0x002690 00:A680: E6        .byte $E6   ; 
- D 1 - I - 0x002691 00:A681: 06        .byte $06   ; 
- D 1 - I - 0x002692 00:A682: ED        .byte $ED   ; 
- D 1 - I - 0x002693 00:A683: 81        .byte $81   ; 
- D 1 - I - 0x002694 00:A684: E9        .byte $E9   ; 
- D 1 - I - 0x002695 00:A685: B9        .byte $B9   ; 
- D 1 - I - 0x002696 00:A686: E4        .byte $E4   ; 
- D 1 - I - 0x002697 00:A687: 32        .byte $32   ; 
- D 1 - I - 0x002698 00:A688: 84        .byte $84   ; 
- D 1 - I - 0x002699 00:A689: 32        .byte $32   ; 
- D 1 - I - 0x00269A 00:A68A: 94        .byte $94   ; 
- D 1 - I - 0x00269B 00:A68B: 32        .byte $32   ; 
- D 1 - I - 0x00269C 00:A68C: A1        .byte $A1   ; 
- D 1 - I - 0x00269D 00:A68D: E6        .byte $E6   ; 
- D 1 - I - 0x00269E 00:A68E: 11        .byte $11   ; 
- D 1 - I - 0x00269F 00:A68F: 90        .byte $90   ; 
- D 1 - I - 0x0026A0 00:A690: E6        .byte $E6   ; 
- D 1 - I - 0x0026A1 00:A691: 06        .byte $06   ; 
- D 1 - I - 0x0026A2 00:A692: ED        .byte $ED   ; 
- D 1 - I - 0x0026A3 00:A693: 01        .byte $01   ; 
- D 1 - I - 0x0026A4 00:A694: E9        .byte $E9   ; 
- D 1 - I - 0x0026A5 00:A695: 31        .byte $31   ; 
- D 1 - I - 0x0026A6 00:A696: E2        .byte $E2   ; 
- D 1 - I - 0x0026A7 00:A697: 81        .byte $81   ; 
- D 1 - I - 0x0026A8 00:A698: 90        .byte $90   ; 
- D 1 - I - 0x0026A9 00:A699: E8        .byte $E8   ; 
- D 1 - I - 0x0026AA 00:A69A: 11        .byte $11   ; 
- D 1 - I - 0x0026AB 00:A69B: A4        .byte $A4   ; 
- D 1 - I - 0x0026AC 00:A69C: E8        .byte $E8   ; 
- D 1 - I - 0x0026AD 00:A69D: 17        .byte $17   ; 
- D 1 - I - 0x0026AE 00:A69E: E6        .byte $E6   ; 
- D 1 - I - 0x0026AF 00:A69F: 01        .byte $01   ; 
- D 1 - I - 0x0026B0 00:A6A0: C0        .byte $C0   ; 
- D 1 - I - 0x0026B1 00:A6A1: E6        .byte $E6   ; 
- D 1 - I - 0x0026B2 00:A6A2: 06        .byte $06   ; 
- D 1 - I - 0x0026B3 00:A6A3: ED        .byte $ED   ; 
- D 1 - I - 0x0026B4 00:A6A4: 81        .byte $81   ; 
- D 1 - I - 0x0026B5 00:A6A5: E9        .byte $E9   ; 
- D 1 - I - 0x0026B6 00:A6A6: B9        .byte $B9   ; 
- D 1 - I - 0x0026B7 00:A6A7: E4        .byte $E4   ; 
- D 1 - I - 0x0026B8 00:A6A8: 32        .byte $32   ; 
- D 1 - I - 0x0026B9 00:A6A9: 84        .byte $84   ; 
- D 1 - I - 0x0026BA 00:A6AA: 32        .byte $32   ; 
- D 1 - I - 0x0026BB 00:A6AB: 94        .byte $94   ; 
- D 1 - I - 0x0026BC 00:A6AC: 32        .byte $32   ; 
- D 1 - I - 0x0026BD 00:A6AD: A1        .byte $A1   ; 
- D 1 - I - 0x0026BE 00:A6AE: E6        .byte $E6   ; 
- D 1 - I - 0x0026BF 00:A6AF: 11        .byte $11   ; 
- D 1 - I - 0x0026C0 00:A6B0: 90        .byte $90   ; 
- D 1 - I - 0x0026C1 00:A6B1: E6        .byte $E6   ; 
- D 1 - I - 0x0026C2 00:A6B2: 06        .byte $06   ; 
- D 1 - I - 0x0026C3 00:A6B3: ED        .byte $ED   ; 
- D 1 - I - 0x0026C4 00:A6B4: 01        .byte $01   ; 
- D 1 - I - 0x0026C5 00:A6B5: E9        .byte $E9   ; 
- D 1 - I - 0x0026C6 00:A6B6: 31        .byte $31   ; 
- D 1 - I - 0x0026C7 00:A6B7: E2        .byte $E2   ; 
- D 1 - I - 0x0026C8 00:A6B8: 71        .byte $71   ; 
- D 1 - I - 0x0026C9 00:A6B9: 80        .byte $80   ; 
- D 1 - I - 0x0026CA 00:A6BA: EE        .byte $EE   ; 
- D 1 - I - 0x0026CB 00:A6BB: 09        .byte $09   ; 
- D 1 - I - 0x0026CC 00:A6BC: EC        .byte $EC   ; 
- D 1 - I - 0x0026CD 00:A6BD: 00        .byte $00   ; 
- D 1 - I - 0x0026CE 00:A6BE: E6        .byte $E6   ; 
- D 1 - I - 0x0026CF 00:A6BF: 01        .byte $01   ; 
- D 1 - I - 0x0026D0 00:A6C0: C0        .byte $C0   ; 
- D 1 - I - 0x0026D1 00:A6C1: ED        .byte $ED   ; 
- D 1 - I - 0x0026D2 00:A6C2: 81        .byte $81   ; 
- D 1 - I - 0x0026D3 00:A6C3: E9        .byte $E9   ; 
- D 1 - I - 0x0026D4 00:A6C4: B1        .byte $B1   ; 
- D 1 - I - 0x0026D5 00:A6C5: D6        .byte $D6   ; 
- D 1 - I - 0x0026D6 00:A6C6: 70        .byte $70   ; 
- D 1 - I - 0x0026D7 00:A6C7: 1C        .byte $1C   ; 
- D 1 - I - 0x0026D8 00:A6C8: 34        .byte $34   ; 
- D 1 - I - 0x0026D9 00:A6C9: E4        .byte $E4   ; 
- D 1 - I - 0x0026DA 00:A6CA: 94        .byte $94   ; 
- D 1 - I - 0x0026DB 00:A6CB: 90        .byte $90   ; 
- D 1 - I - 0x0026DC 00:A6CC: 20        .byte $20   ; 
- D 1 - I - 0x0026DD 00:A6CD: 80        .byte $80   ; 
- D 1 - I - 0x0026DE 00:A6CE: 70        .byte $70   ; 
- D 1 - I - 0x0026DF 00:A6CF: 50        .byte $50   ; 
- D 1 - I - 0x0026E0 00:A6D0: 70        .byte $70   ; 
- D 1 - I - 0x0026E1 00:A6D1: 90        .byte $90   ; 
- D 1 - I - 0x0026E2 00:A6D2: 20        .byte $20   ; 
- D 1 - I - 0x0026E3 00:A6D3: C0        .byte $C0   ; 
- D 1 - I - 0x0026E4 00:A6D4: F4        .byte $F4   ; 
- D 1 - I - 0x0026E5 00:A6D5: 50        .byte $50   ; 
- D 1 - I - 0x0026E6 00:A6D6: 70        .byte $70   ; 
- D 1 - I - 0x0026E7 00:A6D7: 90        .byte $90   ; 
- D 1 - I - 0x0026E8 00:A6D8: F0        .byte $F0   ; 
- D 1 - I - 0x0026E9 00:A6D9: 20        .byte $20   ; 
- D 1 - I - 0x0026EA 00:A6DA: 40        .byte $40   ; 
- D 1 - I - 0x0026EB 00:A6DB: 50        .byte $50   ; 
- D 1 - I - 0x0026EC 00:A6DC: 20        .byte $20   ; 
- D 1 - I - 0x0026ED 00:A6DD: A0        .byte $A0   ; 
- D 1 - I - 0x0026EE 00:A6DE: 20        .byte $20   ; 
- D 1 - I - 0x0026EF 00:A6DF: 90        .byte $90   ; 
- D 1 - I - 0x0026F0 00:A6E0: 70        .byte $70   ; 
- D 1 - I - 0x0026F1 00:A6E1: 50        .byte $50   ; 
- D 1 - I - 0x0026F2 00:A6E2: 70        .byte $70   ; 
- D 1 - I - 0x0026F3 00:A6E3: 90        .byte $90   ; 
- D 1 - I - 0x0026F4 00:A6E4: 30        .byte $30   ; 
- D 1 - I - 0x0026F5 00:A6E5: A3        .byte $A3   ; 
- D 1 - I - 0x0026F6 00:A6E6: 94        .byte $94   ; 
- D 1 - I - 0x0026F7 00:A6E7: 20        .byte $20   ; 
- D 1 - I - 0x0026F8 00:A6E8: 80        .byte $80   ; 
- D 1 - I - 0x0026F9 00:A6E9: 70        .byte $70   ; 
- D 1 - I - 0x0026FA 00:A6EA: 50        .byte $50   ; 
- D 1 - I - 0x0026FB 00:A6EB: 70        .byte $70   ; 
- D 1 - I - 0x0026FC 00:A6EC: 90        .byte $90   ; 
- D 1 - I - 0x0026FD 00:A6ED: 20        .byte $20   ; 
- D 1 - I - 0x0026FE 00:A6EE: C0        .byte $C0   ; 
- D 1 - I - 0x0026FF 00:A6EF: F4        .byte $F4   ; 
- D 1 - I - 0x002700 00:A6F0: 50        .byte $50   ; 
- D 1 - I - 0x002701 00:A6F1: 70        .byte $70   ; 
- D 1 - I - 0x002702 00:A6F2: 90        .byte $90   ; 
- D 1 - I - 0x002703 00:A6F3: F0        .byte $F0   ; 
- D 1 - I - 0x002704 00:A6F4: 20        .byte $20   ; 
- D 1 - I - 0x002705 00:A6F5: 40        .byte $40   ; 
- D 1 - I - 0x002706 00:A6F6: 50        .byte $50   ; 
- D 1 - I - 0x002707 00:A6F7: 20        .byte $20   ; 
- D 1 - I - 0x002708 00:A6F8: A0        .byte $A0   ; 
- D 1 - I - 0x002709 00:A6F9: 20        .byte $20   ; 
- D 1 - I - 0x00270A 00:A6FA: 90        .byte $90   ; 
- D 1 - I - 0x00270B 00:A6FB: 70        .byte $70   ; 
- D 1 - I - 0x00270C 00:A6FC: 50        .byte $50   ; 
- D 1 - I - 0x00270D 00:A6FD: 60        .byte $60   ; 
- D 1 - I - 0x00270E 00:A6FE: 70        .byte $70   ; 
- D 1 - I - 0x00270F 00:A6FF: 30        .byte $30   ; 
- D 1 - I - 0x002710 00:A700: C0        .byte $C0   ; 
- D 1 - I - 0x002711 00:A701: F4        .byte $F4   ; 
- D 1 - I - 0x002712 00:A702: 50        .byte $50   ; 
- D 1 - I - 0x002713 00:A703: 60        .byte $60   ; 
- D 1 - I - 0x002714 00:A704: E6        .byte $E6   ; 
- D 1 - I - 0x002715 00:A705: 05        .byte $05   ; 
- D 1 - I - 0x002716 00:A706: 70        .byte $70   ; 
- D 1 - I - 0x002717 00:A707: E6        .byte $E6   ; 
- D 1 - I - 0x002718 00:A708: 06        .byte $06   ; 
- D 1 - I - 0x002719 00:A709: E7        .byte $E7   ; 
- D 1 - I - 0x00271A 00:A70A: 25        .byte $25   ; 
- D 1 - I - 0x00271B 00:A70B: F0        .byte $F0   ; 
- D 1 - I - 0x00271C 00:A70C: E6        .byte $E6   ; 
- D 1 - I - 0x00271D 00:A70D: 01        .byte $01   ; 
- D 1 - I - 0x00271E 00:A70E: E5        .byte $E5   ; 
- D 1 - I - 0x00271F 00:A70F: 47        .byte $47   ; 
- D 1 - I - 0x002720 00:A710: 57        .byte $57   ; 
- D 1 - I - 0x002721 00:A711: 67        .byte $67   ; 
- D 1 - I - 0x002722 00:A712: 77        .byte $77   ; 
- D 1 - I - 0x002723 00:A713: 87        .byte $87   ; 
- D 1 - I - 0x002724 00:A714: 97        .byte $97   ; 
- D 1 - I - 0x002725 00:A715: A7        .byte $A7   ; 
- D 1 - I - 0x002726 00:A716: B7        .byte $B7   ; 
- D 1 - I - 0x002727 00:A717: E4        .byte $E4   ; 
- D 1 - I - 0x002728 00:A718: 07        .byte $07   ; 
- D 1 - I - 0x002729 00:A719: 17        .byte $17   ; 
- D 1 - I - 0x00272A 00:A71A: 27        .byte $27   ; 
- D 1 - I - 0x00272B 00:A71B: 37        .byte $37   ; 
- D 1 - I - 0x00272C 00:A71C: FE        .byte $FE   ; 
- D 1 - I - 0x00272D 00:A71D: FF        .byte $FF   ; 
- D 1 - I - 0x00272E 00:A71E: 34 A6     .word loc_FF_A634


_off014_32_0x002730_01:
- D 1 - I - 0x002730 00:A720: E6        .byte $E6   ; 
- D 1 - I - 0x002731 00:A721: 06        .byte $06   ; 
- D 1 - I - 0x002732 00:A722: C5        .byte $C5   ; 
loc_FF_A723:
- D 1 - I - 0x002733 00:A723: EC        .byte $EC   ; 
- D 1 - I - 0x002734 00:A724: 05        .byte $05   ; 
- D 1 - I - 0x002735 00:A725: E9        .byte $E9   ; 
- D 1 - I - 0x002736 00:A726: 39        .byte $39   ; 
- D 1 - I - 0x002737 00:A727: D6        .byte $D6   ; 
- D 1 - I - 0x002738 00:A728: 70        .byte $70   ; 
- D 1 - I - 0x002739 00:A729: 26        .byte $26   ; 
- D 1 - I - 0x00273A 00:A72A: 17        .byte $17   ; 
- D 1 - I - 0x00273B 00:A72B: E3        .byte $E3   ; 
- D 1 - I - 0x00273C 00:A72C: 53        .byte $53   ; 
- D 1 - I - 0x00273D 00:A72D: 22        .byte $22   ; 
- D 1 - I - 0x00273E 00:A72E: 74        .byte $74   ; 
- D 1 - I - 0x00273F 00:A72F: 22        .byte $22   ; 
- D 1 - I - 0x002740 00:A730: 84        .byte $84   ; 
- D 1 - I - 0x002741 00:A731: 22        .byte $22   ; 
- D 1 - I - 0x002742 00:A732: 91        .byte $91   ; 
- D 1 - I - 0x002743 00:A733: 82        .byte $82   ; 
- D 1 - I - 0x002744 00:A734: E9        .byte $E9   ; 
- D 1 - I - 0x002745 00:A735: 30        .byte $30   ; 
- D 1 - I - 0x002746 00:A736: E2        .byte $E2   ; 
- D 1 - I - 0x002747 00:A737: 01        .byte $01   ; 
- D 1 - I - 0x002748 00:A738: 10        .byte $10   ; 
- D 1 - I - 0x002749 00:A739: 27        .byte $27   ; 
- D 1 - I - 0x00274A 00:A73A: E9        .byte $E9   ; 
- D 1 - I - 0x00274B 00:A73B: 70        .byte $70   ; 
- D 1 - I - 0x00274C 00:A73C: E3        .byte $E3   ; 
- D 1 - I - 0x00274D 00:A73D: 74        .byte $74   ; 
- D 1 - I - 0x00274E 00:A73E: E3        .byte $E3   ; 
- D 1 - I - 0x00274F 00:A73F: 22        .byte $22   ; 
- D 1 - I - 0x002750 00:A740: 84        .byte $84   ; 
- D 1 - I - 0x002751 00:A741: 22        .byte $22   ; 
- D 1 - I - 0x002752 00:A742: 91        .byte $91   ; 
- D 1 - I - 0x002753 00:A743: 82        .byte $82   ; 
- D 1 - I - 0x002754 00:A744: E9        .byte $E9   ; 
- D 1 - I - 0x002755 00:A745: 30        .byte $30   ; 
- D 1 - I - 0x002756 00:A746: E2        .byte $E2   ; 
- D 1 - I - 0x002757 00:A747: 21        .byte $21   ; 
- D 1 - I - 0x002758 00:A748: 20        .byte $20   ; 
- D 1 - I - 0x002759 00:A749: 37        .byte $37   ; 
- D 1 - I - 0x00275A 00:A74A: E9        .byte $E9   ; 
- D 1 - I - 0x00275B 00:A74B: 70        .byte $70   ; 
- D 1 - I - 0x00275C 00:A74C: E3        .byte $E3   ; 
- D 1 - I - 0x00275D 00:A74D: 84        .byte $84   ; 
- D 1 - I - 0x00275E 00:A74E: E3        .byte $E3   ; 
- D 1 - I - 0x00275F 00:A74F: 32        .byte $32   ; 
- D 1 - I - 0x002760 00:A750: 94        .byte $94   ; 
- D 1 - I - 0x002761 00:A751: 32        .byte $32   ; 
- D 1 - I - 0x002762 00:A752: A1        .byte $A1   ; 
- D 1 - I - 0x002763 00:A753: 92        .byte $92   ; 
- D 1 - I - 0x002764 00:A754: E9        .byte $E9   ; 
- D 1 - I - 0x002765 00:A755: 30        .byte $30   ; 
- D 1 - I - 0x002766 00:A756: E2        .byte $E2   ; 
- D 1 - I - 0x002767 00:A757: 11        .byte $11   ; 
- D 1 - I - 0x002768 00:A758: 20        .byte $20   ; 
- D 1 - I - 0x002769 00:A759: 37        .byte $37   ; 
- D 1 - I - 0x00276A 00:A75A: E9        .byte $E9   ; 
- D 1 - I - 0x00276B 00:A75B: 70        .byte $70   ; 
- D 1 - I - 0x00276C 00:A75C: E3        .byte $E3   ; 
- D 1 - I - 0x00276D 00:A75D: 84        .byte $84   ; 
- D 1 - I - 0x00276E 00:A75E: E3        .byte $E3   ; 
- D 1 - I - 0x00276F 00:A75F: 32        .byte $32   ; 
- D 1 - I - 0x002770 00:A760: 94        .byte $94   ; 
- D 1 - I - 0x002771 00:A761: 32        .byte $32   ; 
- D 1 - I - 0x002772 00:A762: A1        .byte $A1   ; 
- D 1 - I - 0x002773 00:A763: 92        .byte $92   ; 
- D 1 - I - 0x002774 00:A764: E9        .byte $E9   ; 
- D 1 - I - 0x002775 00:A765: 30        .byte $30   ; 
- D 1 - I - 0x002776 00:A766: E2        .byte $E2   ; 
- D 1 - I - 0x002777 00:A767: 01        .byte $01   ; 
- D 1 - I - 0x002778 00:A768: 10        .byte $10   ; 
- D 1 - I - 0x002779 00:A769: EC        .byte $EC   ; 
- D 1 - I - 0x00277A 00:A76A: 00        .byte $00   ; 
- D 1 - I - 0x00277B 00:A76B: E9        .byte $E9   ; 
- D 1 - I - 0x00277C 00:A76C: B1        .byte $B1   ; 
- D 1 - I - 0x00277D 00:A76D: D6        .byte $D6   ; 
- D 1 - I - 0x00277E 00:A76E: 30        .byte $30   ; 
- D 1 - I - 0x00277F 00:A76F: 27        .byte $27   ; 
- D 1 - I - 0x002780 00:A770: 34        .byte $34   ; 
- D 1 - I - 0x002781 00:A771: E2        .byte $E2   ; 
- D 1 - I - 0x002782 00:A772: 21        .byte $21   ; 
- D 1 - I - 0x002783 00:A773: 40        .byte $40   ; 
- D 1 - I - 0x002784 00:A774: 50        .byte $50   ; 
- D 1 - I - 0x002785 00:A775: 20        .byte $20   ; 
- D 1 - I - 0x002786 00:A776: 90        .byte $90   ; 
- D 1 - I - 0x002787 00:A777: C0        .byte $C0   ; 
- D 1 - I - 0x002788 00:A778: 80        .byte $80   ; 
- D 1 - I - 0x002789 00:A779: 70        .byte $70   ; 
- D 1 - I - 0x00278A 00:A77A: 50        .byte $50   ; 
- D 1 - I - 0x00278B 00:A77B: 70        .byte $70   ; 
- D 1 - I - 0x00278C 00:A77C: 90        .byte $90   ; 
- D 1 - I - 0x00278D 00:A77D: 20        .byte $20   ; 
- D 1 - I - 0x00278E 00:A77E: C0        .byte $C0   ; 
- D 1 - I - 0x00278F 00:A77F: F4        .byte $F4   ; 
- D 1 - I - 0x002790 00:A780: 50        .byte $50   ; 
- D 1 - I - 0x002791 00:A781: 70        .byte $70   ; 
- D 1 - I - 0x002792 00:A782: 90        .byte $90   ; 
- D 1 - I - 0x002793 00:A783: F0        .byte $F0   ; 
- D 1 - I - 0x002794 00:A784: E2        .byte $E2   ; 
- D 1 - I - 0x002795 00:A785: 20        .byte $20   ; 
- D 1 - I - 0x002796 00:A786: 40        .byte $40   ; 
- D 1 - I - 0x002797 00:A787: 50        .byte $50   ; 
- D 1 - I - 0x002798 00:A788: 20        .byte $20   ; 
- D 1 - I - 0x002799 00:A789: A0        .byte $A0   ; 
- D 1 - I - 0x00279A 00:A78A: C0        .byte $C0   ; 
- D 1 - I - 0x00279B 00:A78B: 90        .byte $90   ; 
- D 1 - I - 0x00279C 00:A78C: 70        .byte $70   ; 
- D 1 - I - 0x00279D 00:A78D: 50        .byte $50   ; 
- D 1 - I - 0x00279E 00:A78E: 70        .byte $70   ; 
- D 1 - I - 0x00279F 00:A78F: 90        .byte $90   ; 
- D 1 - I - 0x0027A0 00:A790: 34        .byte $34   ; 
- D 1 - I - 0x0027A1 00:A791: 20        .byte $20   ; 
- D 1 - I - 0x0027A2 00:A792: 40        .byte $40   ; 
- D 1 - I - 0x0027A3 00:A793: 50        .byte $50   ; 
- D 1 - I - 0x0027A4 00:A794: 20        .byte $20   ; 
- D 1 - I - 0x0027A5 00:A795: 90        .byte $90   ; 
- D 1 - I - 0x0027A6 00:A796: C0        .byte $C0   ; 
- D 1 - I - 0x0027A7 00:A797: 80        .byte $80   ; 
- D 1 - I - 0x0027A8 00:A798: 70        .byte $70   ; 
- D 1 - I - 0x0027A9 00:A799: 50        .byte $50   ; 
- D 1 - I - 0x0027AA 00:A79A: 70        .byte $70   ; 
- D 1 - I - 0x0027AB 00:A79B: 90        .byte $90   ; 
- D 1 - I - 0x0027AC 00:A79C: 20        .byte $20   ; 
- D 1 - I - 0x0027AD 00:A79D: C0        .byte $C0   ; 
- D 1 - I - 0x0027AE 00:A79E: F4        .byte $F4   ; 
- D 1 - I - 0x0027AF 00:A79F: 50        .byte $50   ; 
- D 1 - I - 0x0027B0 00:A7A0: 70        .byte $70   ; 
- D 1 - I - 0x0027B1 00:A7A1: 90        .byte $90   ; 
- D 1 - I - 0x0027B2 00:A7A2: F0        .byte $F0   ; 
- D 1 - I - 0x0027B3 00:A7A3: E2        .byte $E2   ; 
- D 1 - I - 0x0027B4 00:A7A4: 20        .byte $20   ; 
- D 1 - I - 0x0027B5 00:A7A5: 40        .byte $40   ; 
- D 1 - I - 0x0027B6 00:A7A6: 50        .byte $50   ; 
- D 1 - I - 0x0027B7 00:A7A7: 20        .byte $20   ; 
- D 1 - I - 0x0027B8 00:A7A8: A0        .byte $A0   ; 
- D 1 - I - 0x0027B9 00:A7A9: C0        .byte $C0   ; 
- D 1 - I - 0x0027BA 00:A7AA: 90        .byte $90   ; 
- D 1 - I - 0x0027BB 00:A7AB: 70        .byte $70   ; 
- D 1 - I - 0x0027BC 00:A7AC: 50        .byte $50   ; 
- D 1 - I - 0x0027BD 00:A7AD: 60        .byte $60   ; 
- D 1 - I - 0x0027BE 00:A7AE: 70        .byte $70   ; 
- D 1 - I - 0x0027BF 00:A7AF: 30        .byte $30   ; 
- D 1 - I - 0x0027C0 00:A7B0: C0        .byte $C0   ; 
- D 1 - I - 0x0027C1 00:A7B1: F4        .byte $F4   ; 
- D 1 - I - 0x0027C2 00:A7B2: 50        .byte $50   ; 
- D 1 - I - 0x0027C3 00:A7B3: 60        .byte $60   ; 
- D 1 - I - 0x0027C4 00:A7B4: 70        .byte $70   ; 
- D 1 - I - 0x0027C5 00:A7B5: E7        .byte $E7   ; 
- D 1 - I - 0x0027C6 00:A7B6: 24        .byte $24   ; 
- D 1 - I - 0x0027C7 00:A7B7: F0        .byte $F0   ; 
- D 1 - I - 0x0027C8 00:A7B8: E6        .byte $E6   ; 
- D 1 - I - 0x0027C9 00:A7B9: 01        .byte $01   ; 
- D 1 - I - 0x0027CA 00:A7BA: E3        .byte $E3   ; 
- D 1 - I - 0x0027CB 00:A7BB: 47        .byte $47   ; 
- D 1 - I - 0x0027CC 00:A7BC: 57        .byte $57   ; 
- D 1 - I - 0x0027CD 00:A7BD: 67        .byte $67   ; 
- D 1 - I - 0x0027CE 00:A7BE: 77        .byte $77   ; 
- D 1 - I - 0x0027CF 00:A7BF: 87        .byte $87   ; 
- D 1 - I - 0x0027D0 00:A7C0: 97        .byte $97   ; 
- D 1 - I - 0x0027D1 00:A7C1: A7        .byte $A7   ; 
- D 1 - I - 0x0027D2 00:A7C2: B7        .byte $B7   ; 
- D 1 - I - 0x0027D3 00:A7C3: E2        .byte $E2   ; 
- D 1 - I - 0x0027D4 00:A7C4: 07        .byte $07   ; 
- D 1 - I - 0x0027D5 00:A7C5: 17        .byte $17   ; 
- D 1 - I - 0x0027D6 00:A7C6: 27        .byte $27   ; 
- D 1 - I - 0x0027D7 00:A7C7: 37        .byte $37   ; 
- D 1 - I - 0x0027D8 00:A7C8: FE        .byte $FE   ; 
- D 1 - I - 0x0027D9 00:A7C9: FF        .byte $FF   ; 
- D 1 - I - 0x0027DA 00:A7CA: 23 A7     .word loc_FF_A723


_off014_32_0x0027DC_02:
- D 1 - I - 0x0027DC 00:A7CC: E6        .byte $E6   ; 
- D 1 - I - 0x0027DD 00:A7CD: 06        .byte $06   ; 
- D 1 - I - 0x0027DE 00:A7CE: C5        .byte $C5   ; 
loc_FF_A7CF:
- D 1 - I - 0x0027DF 00:A7CF: D6        .byte $D6   ; 
- D 1 - I - 0x0027E0 00:A7D0: 00        .byte $00   ; 
- D 1 - I - 0x0027E1 00:A7D1: E4        .byte $E4   ; 
- D 1 - I - 0x0027E2 00:A7D2: 53        .byte $53   ; 
- D 1 - I - 0x0027E3 00:A7D3: 22        .byte $22   ; 
- D 1 - I - 0x0027E4 00:A7D4: 74        .byte $74   ; 
- D 1 - I - 0x0027E5 00:A7D5: 22        .byte $22   ; 
- D 1 - I - 0x0027E6 00:A7D6: 84        .byte $84   ; 
- D 1 - I - 0x0027E7 00:A7D7: 22        .byte $22   ; 
- D 1 - I - 0x0027E8 00:A7D8: 91        .byte $91   ; 
- D 1 - I - 0x0027E9 00:A7D9: 82        .byte $82   ; 
- D 1 - I - 0x0027EA 00:A7DA: 72        .byte $72   ; 
- D 1 - I - 0x0027EB 00:A7DB: 54        .byte $54   ; 
- D 1 - I - 0x0027EC 00:A7DC: 22        .byte $22   ; 
- D 1 - I - 0x0027ED 00:A7DD: 74        .byte $74   ; 
- D 1 - I - 0x0027EE 00:A7DE: E4        .byte $E4   ; 
- D 1 - I - 0x0027EF 00:A7DF: 22        .byte $22   ; 
- D 1 - I - 0x0027F0 00:A7E0: 84        .byte $84   ; 
- D 1 - I - 0x0027F1 00:A7E1: 22        .byte $22   ; 
- D 1 - I - 0x0027F2 00:A7E2: 91        .byte $91   ; 
- D 1 - I - 0x0027F3 00:A7E3: 82        .byte $82   ; 
- D 1 - I - 0x0027F4 00:A7E4: 73        .byte $73   ; 
- D 1 - I - 0x0027F5 00:A7E5: 63        .byte $63   ; 
- D 1 - I - 0x0027F6 00:A7E6: 32        .byte $32   ; 
- D 1 - I - 0x0027F7 00:A7E7: 84        .byte $84   ; 
- D 1 - I - 0x0027F8 00:A7E8: 32        .byte $32   ; 
- D 1 - I - 0x0027F9 00:A7E9: 94        .byte $94   ; 
- D 1 - I - 0x0027FA 00:A7EA: 32        .byte $32   ; 
- D 1 - I - 0x0027FB 00:A7EB: A1        .byte $A1   ; 
- D 1 - I - 0x0027FC 00:A7EC: 92        .byte $92   ; 
- D 1 - I - 0x0027FD 00:A7ED: E4        .byte $E4   ; 
- D 1 - I - 0x0027FE 00:A7EE: 82        .byte $82   ; 
- D 1 - I - 0x0027FF 00:A7EF: 64        .byte $64   ; 
- D 1 - I - 0x002800 00:A7F0: 32        .byte $32   ; 
- D 1 - I - 0x002801 00:A7F1: 84        .byte $84   ; 
- D 1 - I - 0x002802 00:A7F2: 32        .byte $32   ; 
- D 1 - I - 0x002803 00:A7F3: 94        .byte $94   ; 
- D 1 - I - 0x002804 00:A7F4: 32        .byte $32   ; 
- D 1 - I - 0x002805 00:A7F5: A1        .byte $A1   ; 
- D 1 - I - 0x002806 00:A7F6: 92        .byte $92   ; 
- D 1 - I - 0x002807 00:A7F7: 72        .byte $72   ; 
- D 1 - I - 0x002808 00:A7F8: D6        .byte $D6   ; 
- D 1 - I - 0x002809 00:A7F9: 0D        .byte $0D   ; 
- D 1 - I - 0x00280A 00:A7FA: E4        .byte $E4   ; 
- D 1 - I - 0x00280B 00:A7FB: 71        .byte $71   ; 
- D 1 - I - 0x00280C 00:A7FC: E3        .byte $E3   ; 
- D 1 - I - 0x00280D 00:A7FD: 40        .byte $40   ; 
- D 1 - I - 0x00280E 00:A7FE: 50        .byte $50   ; 
- D 1 - I - 0x00280F 00:A7FF: 20        .byte $20   ; 
- D 1 - I - 0x002810 00:A800: 90        .byte $90   ; 
- D 1 - I - 0x002811 00:A801: 20        .byte $20   ; 
- D 1 - I - 0x002812 00:A802: 80        .byte $80   ; 
- D 1 - I - 0x002813 00:A803: 70        .byte $70   ; 
- D 1 - I - 0x002814 00:A804: 50        .byte $50   ; 
- D 1 - I - 0x002815 00:A805: 70        .byte $70   ; 
- D 1 - I - 0x002816 00:A806: 90        .byte $90   ; 
- D 1 - I - 0x002817 00:A807: 20        .byte $20   ; 
- D 1 - I - 0x002818 00:A808: C3        .byte $C3   ; 
- D 1 - I - 0x002819 00:A809: 20        .byte $20   ; 
- D 1 - I - 0x00281A 00:A80A: 40        .byte $40   ; 
- D 1 - I - 0x00281B 00:A80B: 50        .byte $50   ; 
- D 1 - I - 0x00281C 00:A80C: 20        .byte $20   ; 
- D 1 - I - 0x00281D 00:A80D: A0        .byte $A0   ; 
- D 1 - I - 0x00281E 00:A80E: 20        .byte $20   ; 
- D 1 - I - 0x00281F 00:A80F: 90        .byte $90   ; 
- D 1 - I - 0x002820 00:A810: 70        .byte $70   ; 
- D 1 - I - 0x002821 00:A811: 50        .byte $50   ; 
- D 1 - I - 0x002822 00:A812: 70        .byte $70   ; 
- D 1 - I - 0x002823 00:A813: 90        .byte $90   ; 
- D 1 - I - 0x002824 00:A814: 31        .byte $31   ; 
- D 1 - I - 0x002825 00:A815: C2        .byte $C2   ; 
- D 1 - I - 0x002826 00:A816: 20        .byte $20   ; 
- D 1 - I - 0x002827 00:A817: 40        .byte $40   ; 
- D 1 - I - 0x002828 00:A818: 50        .byte $50   ; 
- D 1 - I - 0x002829 00:A819: 20        .byte $20   ; 
- D 1 - I - 0x00282A 00:A81A: 90        .byte $90   ; 
- D 1 - I - 0x00282B 00:A81B: 20        .byte $20   ; 
- D 1 - I - 0x00282C 00:A81C: 80        .byte $80   ; 
- D 1 - I - 0x00282D 00:A81D: 70        .byte $70   ; 
- D 1 - I - 0x00282E 00:A81E: 50        .byte $50   ; 
- D 1 - I - 0x00282F 00:A81F: 70        .byte $70   ; 
- D 1 - I - 0x002830 00:A820: 90        .byte $90   ; 
- D 1 - I - 0x002831 00:A821: 20        .byte $20   ; 
- D 1 - I - 0x002832 00:A822: C3        .byte $C3   ; 
- D 1 - I - 0x002833 00:A823: 20        .byte $20   ; 
- D 1 - I - 0x002834 00:A824: 40        .byte $40   ; 
- D 1 - I - 0x002835 00:A825: 50        .byte $50   ; 
- D 1 - I - 0x002836 00:A826: 20        .byte $20   ; 
- D 1 - I - 0x002837 00:A827: A0        .byte $A0   ; 
- D 1 - I - 0x002838 00:A828: 20        .byte $20   ; 
- D 1 - I - 0x002839 00:A829: 90        .byte $90   ; 
- D 1 - I - 0x00283A 00:A82A: 70        .byte $70   ; 
- D 1 - I - 0x00283B 00:A82B: 50        .byte $50   ; 
- D 1 - I - 0x00283C 00:A82C: 60        .byte $60   ; 
- D 1 - I - 0x00283D 00:A82D: 90        .byte $90   ; 
- D 1 - I - 0x00283E 00:A82E: 31        .byte $31   ; 
- D 1 - I - 0x00283F 00:A82F: C2        .byte $C2   ; 
- D 1 - I - 0x002840 00:A830: D1        .byte $D1   ; 
- D 1 - I - 0x002841 00:A831: 02        .byte $02   ; 
- D 1 - I - 0x002842 00:A832: E4        .byte $E4   ; 
- D 1 - I - 0x002843 00:A833: 47        .byte $47   ; 
- D 1 - I - 0x002844 00:A834: 57        .byte $57   ; 
- D 1 - I - 0x002845 00:A835: 67        .byte $67   ; 
- D 1 - I - 0x002846 00:A836: 77        .byte $77   ; 
- D 1 - I - 0x002847 00:A837: 87        .byte $87   ; 
- D 1 - I - 0x002848 00:A838: 97        .byte $97   ; 
- D 1 - I - 0x002849 00:A839: A7        .byte $A7   ; 
- D 1 - I - 0x00284A 00:A83A: B7        .byte $B7   ; 
- D 1 - I - 0x00284B 00:A83B: E3        .byte $E3   ; 
- D 1 - I - 0x00284C 00:A83C: 07        .byte $07   ; 
- D 1 - I - 0x00284D 00:A83D: 17        .byte $17   ; 
- D 1 - I - 0x00284E 00:A83E: 27        .byte $27   ; 
- D 1 - I - 0x00284F 00:A83F: 37        .byte $37   ; 
- D 1 - I - 0x002850 00:A840: FE        .byte $FE   ; 
- D 1 - I - 0x002851 00:A841: FF        .byte $FF   ; 
- D 1 - I - 0x002852 00:A842: CF A7     .word loc_FF_A7CF


_off014_32_0x002854_03:
- D 1 - I - 0x002854 00:A844: D1        .byte $D1   ; 
- D 1 - I - 0x002855 00:A845: B0        .byte $B0   ; 
- D 1 - I - 0x002856 00:A846: 24        .byte $24   ; 
- D 1 - I - 0x002857 00:A847: B0        .byte $B0   ; 
- D 1 - I - 0x002858 00:A848: 24        .byte $24   ; 
- D 1 - I - 0x002859 00:A849: A0        .byte $A0   ; 
- D 1 - I - 0x00285A 00:A84A: 2A        .byte $2A   ; 
- D 1 - I - 0x00285B 00:A84B: A0        .byte $A0   ; 
- D 1 - I - 0x00285C 00:A84C: 24        .byte $24   ; 
- D 1 - I - 0x00285D 00:A84D: A0        .byte $A0   ; 
- D 1 - I - 0x00285E 00:A84E: 24        .byte $24   ; 
loc_FF_A84F:
- D 1 - I - 0x00285F 00:A84F: D1        .byte $D1   ; 
- D 1 - I - 0x002860 00:A850: FB        .byte $FB   ; 
- D 1 - I - 0x002861 00:A851: B0        .byte $B0   ; 
- D 1 - I - 0x002862 00:A852: 2A        .byte $2A   ; 
- D 1 - I - 0x002863 00:A853: 25        .byte $25   ; 
- D 1 - I - 0x002864 00:A854: 25        .byte $25   ; 
- D 1 - I - 0x002865 00:A855: A0        .byte $A0   ; 
- D 1 - I - 0x002866 00:A856: 2A        .byte $2A   ; 
- D 1 - I - 0x002867 00:A857: 25        .byte $25   ; 
- D 1 - I - 0x002868 00:A858: A0        .byte $A0   ; 
- D 1 - I - 0x002869 00:A859: 24        .byte $24   ; 
- D 1 - I - 0x00286A 00:A85A: B0        .byte $B0   ; 
- D 1 - I - 0x00286B 00:A85B: 2A        .byte $2A   ; 
- D 1 - I - 0x00286C 00:A85C: 25        .byte $25   ; 
- D 1 - I - 0x00286D 00:A85D: 25        .byte $25   ; 
- D 1 - I - 0x00286E 00:A85E: A0        .byte $A0   ; 
- D 1 - I - 0x00286F 00:A85F: 2A        .byte $2A   ; 
- D 1 - I - 0x002870 00:A860: 25        .byte $25   ; 
- D 1 - I - 0x002871 00:A861: B0        .byte $B0   ; 
- D 1 - I - 0x002872 00:A862: 24        .byte $24   ; 
- D 1 - I - 0x002873 00:A863: FE        .byte $FE   ; 
- D 1 - I - 0x002874 00:A864: 07        .byte $07   ; 
- D 1 - I - 0x002875 00:A865: B0        .byte $B0   ; 
- D 1 - I - 0x002876 00:A866: 2A        .byte $2A   ; 
- D 1 - I - 0x002877 00:A867: 25        .byte $25   ; 
- D 1 - I - 0x002878 00:A868: 25        .byte $25   ; 
- D 1 - I - 0x002879 00:A869: A0        .byte $A0   ; 
- D 1 - I - 0x00287A 00:A86A: 2A        .byte $2A   ; 
- D 1 - I - 0x00287B 00:A86B: 25        .byte $25   ; 
- D 1 - I - 0x00287C 00:A86C: A0        .byte $A0   ; 
- D 1 - I - 0x00287D 00:A86D: 24        .byte $24   ; 
- D 1 - I - 0x00287E 00:A86E: B0        .byte $B0   ; 
- D 1 - I - 0x00287F 00:A86F: 24        .byte $24   ; 
- D 1 - I - 0x002880 00:A870: 92        .byte $92   ; 
- D 1 - I - 0x002881 00:A871: 92        .byte $92   ; 
- D 1 - I - 0x002882 00:A872: 95        .byte $95   ; 
- D 1 - I - 0x002883 00:A873: 95        .byte $95   ; 
- D 1 - I - 0x002884 00:A874: 85        .byte $85   ; 
- D 1 - I - 0x002885 00:A875: 85        .byte $85   ; 
- D 1 - I - 0x002886 00:A876: 75        .byte $75   ; 
- D 1 - I - 0x002887 00:A877: D6        .byte $D6   ; 
- D 1 - I - 0x002888 00:A878: E3        .byte $E3   ; 
- D 1 - I - 0x002889 00:A879: 21        .byte $21   ; 
- D 1 - I - 0x00288A 00:A87A: 40        .byte $40   ; 
- D 1 - I - 0x00288B 00:A87B: 50        .byte $50   ; 
- D 1 - I - 0x00288C 00:A87C: 20        .byte $20   ; 
- D 1 - I - 0x00288D 00:A87D: 90        .byte $90   ; 
- D 1 - I - 0x00288E 00:A87E: C0        .byte $C0   ; 
- D 1 - I - 0x00288F 00:A87F: 80        .byte $80   ; 
- D 1 - I - 0x002890 00:A880: 70        .byte $70   ; 
- D 1 - I - 0x002891 00:A881: 50        .byte $50   ; 
- D 1 - I - 0x002892 00:A882: 70        .byte $70   ; 
- D 1 - I - 0x002893 00:A883: 90        .byte $90   ; 
- D 1 - I - 0x002894 00:A884: 20        .byte $20   ; 
- D 1 - I - 0x002895 00:A885: D6        .byte $D6   ; 
- D 1 - I - 0x002896 00:A886: C0        .byte $C0   ; 
- D 1 - I - 0x002897 00:A887: B0        .byte $B0   ; 
- D 1 - I - 0x002898 00:A888: A0        .byte $A0   ; 
- D 1 - I - 0x002899 00:A889: 20        .byte $20   ; 
- D 1 - I - 0x00289A 00:A88A: E3        .byte $E3   ; 
- D 1 - I - 0x00289B 00:A88B: 20        .byte $20   ; 
- D 1 - I - 0x00289C 00:A88C: 40        .byte $40   ; 
- D 1 - I - 0x00289D 00:A88D: 50        .byte $50   ; 
- D 1 - I - 0x00289E 00:A88E: 20        .byte $20   ; 
- D 1 - I - 0x00289F 00:A88F: A0        .byte $A0   ; 
- D 1 - I - 0x0028A0 00:A890: C0        .byte $C0   ; 
- D 1 - I - 0x0028A1 00:A891: 90        .byte $90   ; 
- D 1 - I - 0x0028A2 00:A892: 70        .byte $70   ; 
- D 1 - I - 0x0028A3 00:A893: 50        .byte $50   ; 
- D 1 - I - 0x0028A4 00:A894: 70        .byte $70   ; 
- D 1 - I - 0x0028A5 00:A895: 90        .byte $90   ; 
- D 1 - I - 0x0028A6 00:A896: 34        .byte $34   ; 
- D 1 - I - 0x0028A7 00:A897: 20        .byte $20   ; 
- D 1 - I - 0x0028A8 00:A898: 40        .byte $40   ; 
- D 1 - I - 0x0028A9 00:A899: 50        .byte $50   ; 
- D 1 - I - 0x0028AA 00:A89A: 20        .byte $20   ; 
- D 1 - I - 0x0028AB 00:A89B: 90        .byte $90   ; 
- D 1 - I - 0x0028AC 00:A89C: C0        .byte $C0   ; 
- D 1 - I - 0x0028AD 00:A89D: 80        .byte $80   ; 
- D 1 - I - 0x0028AE 00:A89E: 70        .byte $70   ; 
- D 1 - I - 0x0028AF 00:A89F: 50        .byte $50   ; 
- D 1 - I - 0x0028B0 00:A8A0: 70        .byte $70   ; 
- D 1 - I - 0x0028B1 00:A8A1: 90        .byte $90   ; 
- D 1 - I - 0x0028B2 00:A8A2: 20        .byte $20   ; 
- D 1 - I - 0x0028B3 00:A8A3: D6        .byte $D6   ; 
- D 1 - I - 0x0028B4 00:A8A4: 20        .byte $20   ; 
- D 1 - I - 0x0028B5 00:A8A5: B0        .byte $B0   ; 
- D 1 - I - 0x0028B6 00:A8A6: A0        .byte $A0   ; 
- D 1 - I - 0x0028B7 00:A8A7: 20        .byte $20   ; 
- D 1 - I - 0x0028B8 00:A8A8: E3        .byte $E3   ; 
- D 1 - I - 0x0028B9 00:A8A9: 20        .byte $20   ; 
- D 1 - I - 0x0028BA 00:A8AA: 40        .byte $40   ; 
- D 1 - I - 0x0028BB 00:A8AB: 50        .byte $50   ; 
- D 1 - I - 0x0028BC 00:A8AC: 20        .byte $20   ; 
- D 1 - I - 0x0028BD 00:A8AD: A0        .byte $A0   ; 
- D 1 - I - 0x0028BE 00:A8AE: C0        .byte $C0   ; 
- D 1 - I - 0x0028BF 00:A8AF: 90        .byte $90   ; 
- D 1 - I - 0x0028C0 00:A8B0: 70        .byte $70   ; 
- D 1 - I - 0x0028C1 00:A8B1: 50        .byte $50   ; 
- D 1 - I - 0x0028C2 00:A8B2: 60        .byte $60   ; 
- D 1 - I - 0x0028C3 00:A8B3: 70        .byte $70   ; 
- D 1 - I - 0x0028C4 00:A8B4: 30        .byte $30   ; 
- D 1 - I - 0x0028C5 00:A8B5: D1        .byte $D1   ; 
- D 1 - I - 0x0028C6 00:A8B6: 92        .byte $92   ; 
- D 1 - I - 0x0028C7 00:A8B7: 92        .byte $92   ; 
- D 1 - I - 0x0028C8 00:A8B8: D6        .byte $D6   ; 
- D 1 - I - 0x0028C9 00:A8B9: 90        .byte $90   ; 
- D 1 - I - 0x0028CA 00:A8BA: 90        .byte $90   ; 
- D 1 - I - 0x0028CB 00:A8BB: 90        .byte $90   ; 
- D 1 - I - 0x0028CC 00:A8BC: D1        .byte $D1   ; 
- D 1 - I - 0x0028CD 00:A8BD: FB        .byte $FB   ; 
- D 1 - I - 0x0028CE 00:A8BE: A0        .byte $A0   ; 
- D 1 - I - 0x0028CF 00:A8BF: 26        .byte $26   ; 
- D 1 - I - 0x0028D0 00:A8C0: FE        .byte $FE   ; 
- D 1 - I - 0x0028D1 00:A8C1: 06        .byte $06   ; 
- D 1 - I - 0x0028D2 00:A8C2: D1        .byte $D1   ; 
- D 1 - I - 0x0028D3 00:A8C3: B7        .byte $B7   ; 
- D 1 - I - 0x0028D4 00:A8C4: B7        .byte $B7   ; 
- D 1 - I - 0x0028D5 00:A8C5: B7        .byte $B7   ; 
- D 1 - I - 0x0028D6 00:A8C6: 93        .byte $93   ; 
- D 1 - I - 0x0028D7 00:A8C7: 93        .byte $93   ; 
- D 1 - I - 0x0028D8 00:A8C8: 87        .byte $87   ; 
- D 1 - I - 0x0028D9 00:A8C9: 67        .byte $67   ; 
- D 1 - I - 0x0028DA 00:A8CA: FE        .byte $FE   ; 
- D 1 - I - 0x0028DB 00:A8CB: FF        .byte $FF   ; 
- D 1 - I - 0x0028DC 00:A8CC: 4F A8     .word loc_FF_A84F


_off014_36_0x0028DE_00:
- D 1 - I - 0x0028DE 00:A8CE: E9        .byte $E9   ; 
- D 1 - I - 0x0028DF 00:A8CF: 71        .byte $71   ; 
- D 1 - I - 0x0028E0 00:A8D0: D4        .byte $D4   ; 
- D 1 - I - 0x0028E1 00:A8D1: 37        .byte $37   ; 
- D 1 - I - 0x0028E2 00:A8D2: 84        .byte $84   ; 
- D 1 - I - 0x0028E3 00:A8D3: 14        .byte $14   ; 
- D 1 - I - 0x0028E4 00:A8D4: E3        .byte $E3   ; 
- D 1 - I - 0x0028E5 00:A8D5: 73        .byte $73   ; 
- D 1 - I - 0x0028E6 00:A8D6: 71        .byte $71   ; 
- D 1 - I - 0x0028E7 00:A8D7: C0        .byte $C0   ; 
- D 1 - I - 0x0028E8 00:A8D8: F4        .byte $F4   ; 
- D 1 - I - 0x0028E9 00:A8D9: 70        .byte $70   ; 
- D 1 - I - 0x0028EA 00:A8DA: F0        .byte $F0   ; 
- D 1 - I - 0x0028EB 00:A8DB: 71        .byte $71   ; 
- D 1 - I - 0x0028EC 00:A8DC: 71        .byte $71   ; 
- D 1 - I - 0x0028ED 00:A8DD: 53        .byte $53   ; 
- D 1 - I - 0x0028EE 00:A8DE: 51        .byte $51   ; 
- D 1 - I - 0x0028EF 00:A8DF: C0        .byte $C0   ; 
- D 1 - I - 0x0028F0 00:A8E0: F4        .byte $F4   ; 
- D 1 - I - 0x0028F1 00:A8E1: 50        .byte $50   ; 
- D 1 - I - 0x0028F2 00:A8E2: F0        .byte $F0   ; 
- D 1 - I - 0x0028F3 00:A8E3: 51        .byte $51   ; 
- D 1 - I - 0x0028F4 00:A8E4: 51        .byte $51   ; 
- D 1 - I - 0x0028F5 00:A8E5: 43        .byte $43   ; 
- D 1 - I - 0x0028F6 00:A8E6: 41        .byte $41   ; 
- D 1 - I - 0x0028F7 00:A8E7: C0        .byte $C0   ; 
- D 1 - I - 0x0028F8 00:A8E8: F4        .byte $F4   ; 
- D 1 - I - 0x0028F9 00:A8E9: 40        .byte $40   ; 
- D 1 - I - 0x0028FA 00:A8EA: F0        .byte $F0   ; 
- D 1 - I - 0x0028FB 00:A8EB: 41        .byte $41   ; 
- D 1 - I - 0x0028FC 00:A8EC: 41        .byte $41   ; 
- D 1 - I - 0x0028FD 00:A8ED: 23        .byte $23   ; 
- D 1 - I - 0x0028FE 00:A8EE: 21        .byte $21   ; 
- D 1 - I - 0x0028FF 00:A8EF: C0        .byte $C0   ; 
- D 1 - I - 0x002900 00:A8F0: F4        .byte $F4   ; 
- D 1 - I - 0x002901 00:A8F1: 20        .byte $20   ; 
- D 1 - I - 0x002902 00:A8F2: F0        .byte $F0   ; 
- D 1 - I - 0x002903 00:A8F3: 21        .byte $21   ; 
- D 1 - I - 0x002904 00:A8F4: 21        .byte $21   ; 
- D 1 - I - 0x002905 00:A8F5: E9        .byte $E9   ; 
- D 1 - I - 0x002906 00:A8F6: 31        .byte $31   ; 
- D 1 - I - 0x002907 00:A8F7: D8        .byte $D8   ; 
- D 1 - I - 0x002908 00:A8F8: 74        .byte $74   ; 
- D 1 - I - 0x002909 00:A8F9: 82        .byte $82   ; 
- D 1 - I - 0x00290A 00:A8FA: 11        .byte $11   ; 
- D 1 - I - 0x00290B 00:A8FB: FB        .byte $FB   ; 
- D 1 - I - 0x00290C 00:A8FC: E2        .byte $E2   ; 
- D 1 - I - 0x00290D 00:A8FD: 70        .byte $70   ; 
- D 1 - I - 0x00290E 00:A8FE: 50        .byte $50   ; 
- D 1 - I - 0x00290F 00:A8FF: E2        .byte $E2   ; 
- D 1 - I - 0x002910 00:A900: A0        .byte $A0   ; 
- D 1 - I - 0x002911 00:A901: 90        .byte $90   ; 
- D 1 - I - 0x002912 00:A902: 70        .byte $70   ; 
- D 1 - I - 0x002913 00:A903: 90        .byte $90   ; 
- D 1 - I - 0x002914 00:A904: 50        .byte $50   ; 
- D 1 - I - 0x002915 00:A905: 03        .byte $03   ; 
- D 1 - I - 0x002916 00:A906: 00        .byte $00   ; 
- D 1 - I - 0x002917 00:A907: 50        .byte $50   ; 
- D 1 - I - 0x002918 00:A908: 90        .byte $90   ; 
- D 1 - I - 0x002919 00:A909: E1        .byte $E1   ; 
- D 1 - I - 0x00291A 00:A90A: 05        .byte $05   ; 
- D 1 - I - 0x00291B 00:A90B: E2        .byte $E2   ; 
- D 1 - I - 0x00291C 00:A90C: 75        .byte $75   ; 
- D 1 - I - 0x00291D 00:A90D: A0        .byte $A0   ; 
- D 1 - I - 0x00291E 00:A90E: 90        .byte $90   ; 
- D 1 - I - 0x00291F 00:A90F: 70        .byte $70   ; 
- D 1 - I - 0x002920 00:A910: A5        .byte $A5   ; 
- D 1 - I - 0x002921 00:A911: 70        .byte $70   ; 
- D 1 - I - 0x002922 00:A912: 90        .byte $90   ; 
- D 1 - I - 0x002923 00:A913: A0        .byte $A0   ; 
- D 1 - I - 0x002924 00:A914: 93        .byte $93   ; 
- D 1 - I - 0x002925 00:A915: 50        .byte $50   ; 
- D 1 - I - 0x002926 00:A916: 90        .byte $90   ; 
- D 1 - I - 0x002927 00:A917: E1        .byte $E1   ; 
- D 1 - I - 0x002928 00:A918: 22        .byte $22   ; 
- D 1 - I - 0x002929 00:A919: 52        .byte $52   ; 
- D 1 - I - 0x00292A 00:A91A: E1        .byte $E1   ; 
- D 1 - I - 0x00292B 00:A91B: 70        .byte $70   ; 
- D 1 - I - 0x00292C 00:A91C: 50        .byte $50   ; 
- D 1 - I - 0x00292D 00:A91D: 40        .byte $40   ; 
- D 1 - I - 0x00292E 00:A91E: 25        .byte $25   ; 
- D 1 - I - 0x00292F 00:A91F: 20        .byte $20   ; 
- D 1 - I - 0x002930 00:A920: 40        .byte $40   ; 
- D 1 - I - 0x002931 00:A921: 50        .byte $50   ; 
- D 1 - I - 0x002932 00:A922: 43        .byte $43   ; 
- D 1 - I - 0x002933 00:A923: 20        .byte $20   ; 
- D 1 - I - 0x002934 00:A924: 00        .byte $00   ; 
- D 1 - I - 0x002935 00:A925: 42        .byte $42   ; 
- D 1 - I - 0x002936 00:A926: 00        .byte $00   ; 
- D 1 - I - 0x002937 00:A927: 20        .byte $20   ; 
- D 1 - I - 0x002938 00:A928: 40        .byte $40   ; 
- D 1 - I - 0x002939 00:A929: 52        .byte $52   ; 
- D 1 - I - 0x00293A 00:A92A: 50        .byte $50   ; 
- D 1 - I - 0x00293B 00:A92B: 40        .byte $40   ; 
- D 1 - I - 0x00293C 00:A92C: 20        .byte $20   ; 
- D 1 - I - 0x00293D 00:A92D: 52        .byte $52   ; 
- D 1 - I - 0x00293E 00:A92E: 50        .byte $50   ; 
- D 1 - I - 0x00293F 00:A92F: 70        .byte $70   ; 
- D 1 - I - 0x002940 00:A930: 90        .byte $90   ; 
- D 1 - I - 0x002941 00:A931: 93        .byte $93   ; 
- D 1 - I - 0x002942 00:A932: 70        .byte $70   ; 
- D 1 - I - 0x002943 00:A933: 50        .byte $50   ; 
- D 1 - I - 0x002944 00:A934: 72        .byte $72   ; 
- D 1 - I - 0x002945 00:A935: 90        .byte $90   ; 
- D 1 - I - 0x002946 00:A936: FE        .byte $FE   ; 
- D 1 - I - 0x002947 00:A937: 03        .byte $03   ; 
- D 1 - I - 0x002948 00:A938: EA        .byte $EA   ; 
- D 1 - I - 0x002949 00:A939: 00        .byte $00   ; 
- D 1 - I - 0x00294A 00:A93A: E9        .byte $E9   ; 
- D 1 - I - 0x00294B 00:A93B: 31        .byte $31   ; 
- D 1 - I - 0x00294C 00:A93C: D8        .byte $D8   ; 
- D 1 - I - 0x00294D 00:A93D: 70        .byte $70   ; 
- D 1 - I - 0x00294E 00:A93E: 28        .byte $28   ; 
- D 1 - I - 0x00294F 00:A93F: 11        .byte $11   ; 
- D 1 - I - 0x002950 00:A940: EB        .byte $EB   ; 
- D 1 - I - 0x002951 00:A941: 50        .byte $50   ; 
- D 1 - I - 0x002952 00:A942: 21        .byte $21   ; 
- D 1 - I - 0x002953 00:A943: E1        .byte $E1   ; 
- D 1 - I - 0x002954 00:A944: 08        .byte $08   ; 
- D 1 - I - 0x002955 00:A945: 02        .byte $02   ; 
- D 1 - I - 0x002956 00:A946: 05        .byte $05   ; 
- D 1 - I - 0x002957 00:A947: 12        .byte $12   ; 
- D 1 - I - 0x002958 00:A948: E2        .byte $E2   ; 
- D 1 - I - 0x002959 00:A949: A2        .byte $A2   ; 
- D 1 - I - 0x00295A 00:A94A: A8        .byte $A8   ; 
- D 1 - I - 0x00295B 00:A94B: A0        .byte $A0   ; 
- D 1 - I - 0x00295C 00:A94C: E1        .byte $E1   ; 
- D 1 - I - 0x00295D 00:A94D: 00        .byte $00   ; 
- D 1 - I - 0x00295E 00:A94E: E2        .byte $E2   ; 
- D 1 - I - 0x00295F 00:A94F: A0        .byte $A0   ; 
- D 1 - I - 0x002960 00:A950: 9B        .byte $9B   ; 
- D 1 - I - 0x002961 00:A951: FF        .byte $FF   ; 


_off014_36_0x002962_01:
- D 1 - I - 0x002962 00:A952: E9        .byte $E9   ; 
- D 1 - I - 0x002963 00:A953: 71        .byte $71   ; 
- D 1 - I - 0x002964 00:A954: D4        .byte $D4   ; 
- D 1 - I - 0x002965 00:A955: 37        .byte $37   ; 
- D 1 - I - 0x002966 00:A956: 84        .byte $84   ; 
- D 1 - I - 0x002967 00:A957: 14        .byte $14   ; 
- D 1 - I - 0x002968 00:A958: E2        .byte $E2   ; 
- D 1 - I - 0x002969 00:A959: 03        .byte $03   ; 
- D 1 - I - 0x00296A 00:A95A: 01        .byte $01   ; 
- D 1 - I - 0x00296B 00:A95B: C0        .byte $C0   ; 
- D 1 - I - 0x00296C 00:A95C: F4        .byte $F4   ; 
- D 1 - I - 0x00296D 00:A95D: 00        .byte $00   ; 
- D 1 - I - 0x00296E 00:A95E: F0        .byte $F0   ; 
- D 1 - I - 0x00296F 00:A95F: 01        .byte $01   ; 
- D 1 - I - 0x002970 00:A960: 01        .byte $01   ; 
- D 1 - I - 0x002971 00:A961: E3        .byte $E3   ; 
- D 1 - I - 0x002972 00:A962: A3        .byte $A3   ; 
- D 1 - I - 0x002973 00:A963: A1        .byte $A1   ; 
- D 1 - I - 0x002974 00:A964: C0        .byte $C0   ; 
- D 1 - I - 0x002975 00:A965: F4        .byte $F4   ; 
- D 1 - I - 0x002976 00:A966: A0        .byte $A0   ; 
- D 1 - I - 0x002977 00:A967: F0        .byte $F0   ; 
- D 1 - I - 0x002978 00:A968: A1        .byte $A1   ; 
- D 1 - I - 0x002979 00:A969: A1        .byte $A1   ; 
- D 1 - I - 0x00297A 00:A96A: 93        .byte $93   ; 
- D 1 - I - 0x00297B 00:A96B: 91        .byte $91   ; 
- D 1 - I - 0x00297C 00:A96C: C0        .byte $C0   ; 
- D 1 - I - 0x00297D 00:A96D: F4        .byte $F4   ; 
- D 1 - I - 0x00297E 00:A96E: 90        .byte $90   ; 
- D 1 - I - 0x00297F 00:A96F: F0        .byte $F0   ; 
- D 1 - I - 0x002980 00:A970: 91        .byte $91   ; 
- D 1 - I - 0x002981 00:A971: 91        .byte $91   ; 
- D 1 - I - 0x002982 00:A972: 73        .byte $73   ; 
- D 1 - I - 0x002983 00:A973: 71        .byte $71   ; 
- D 1 - I - 0x002984 00:A974: C0        .byte $C0   ; 
- D 1 - I - 0x002985 00:A975: F4        .byte $F4   ; 
- D 1 - I - 0x002986 00:A976: 70        .byte $70   ; 
- D 1 - I - 0x002987 00:A977: F0        .byte $F0   ; 
- D 1 - I - 0x002988 00:A978: 71        .byte $71   ; 
- D 1 - I - 0x002989 00:A979: 71        .byte $71   ; 
- D 1 - I - 0x00298A 00:A97A: E9        .byte $E9   ; 
- D 1 - I - 0x00298B 00:A97B: 31        .byte $31   ; 
- D 1 - I - 0x00298C 00:A97C: D8        .byte $D8   ; 
- D 1 - I - 0x00298D 00:A97D: 70        .byte $70   ; 
- D 1 - I - 0x00298E 00:A97E: 28        .byte $28   ; 
- D 1 - I - 0x00298F 00:A97F: 11        .byte $11   ; 
- D 1 - I - 0x002990 00:A980: EB        .byte $EB   ; 
- D 1 - I - 0x002991 00:A981: 50        .byte $50   ; 
- D 1 - I - 0x002992 00:A982: 21        .byte $21   ; 
- D 1 - I - 0x002993 00:A983: FB        .byte $FB   ; 
- D 1 - I - 0x002994 00:A984: E2        .byte $E2   ; 
- D 1 - I - 0x002995 00:A985: A0        .byte $A0   ; 
- D 1 - I - 0x002996 00:A986: 90        .byte $90   ; 
- D 1 - I - 0x002997 00:A987: 70        .byte $70   ; 
- D 1 - I - 0x002998 00:A988: 90        .byte $90   ; 
- D 1 - I - 0x002999 00:A989: 50        .byte $50   ; 
- D 1 - I - 0x00299A 00:A98A: 03        .byte $03   ; 
- D 1 - I - 0x00299B 00:A98B: 00        .byte $00   ; 
- D 1 - I - 0x00299C 00:A98C: 50        .byte $50   ; 
- D 1 - I - 0x00299D 00:A98D: 90        .byte $90   ; 
- D 1 - I - 0x00299E 00:A98E: E1        .byte $E1   ; 
- D 1 - I - 0x00299F 00:A98F: 05        .byte $05   ; 
- D 1 - I - 0x0029A0 00:A990: E2        .byte $E2   ; 
- D 1 - I - 0x0029A1 00:A991: 75        .byte $75   ; 
- D 1 - I - 0x0029A2 00:A992: A0        .byte $A0   ; 
- D 1 - I - 0x0029A3 00:A993: 90        .byte $90   ; 
- D 1 - I - 0x0029A4 00:A994: 70        .byte $70   ; 
- D 1 - I - 0x0029A5 00:A995: A5        .byte $A5   ; 
- D 1 - I - 0x0029A6 00:A996: 70        .byte $70   ; 
- D 1 - I - 0x0029A7 00:A997: 90        .byte $90   ; 
- D 1 - I - 0x0029A8 00:A998: A0        .byte $A0   ; 
- D 1 - I - 0x0029A9 00:A999: 93        .byte $93   ; 
- D 1 - I - 0x0029AA 00:A99A: 50        .byte $50   ; 
- D 1 - I - 0x0029AB 00:A99B: 90        .byte $90   ; 
- D 1 - I - 0x0029AC 00:A99C: E1        .byte $E1   ; 
- D 1 - I - 0x0029AD 00:A99D: 22        .byte $22   ; 
- D 1 - I - 0x0029AE 00:A99E: 52        .byte $52   ; 
- D 1 - I - 0x0029AF 00:A99F: E1        .byte $E1   ; 
- D 1 - I - 0x0029B0 00:A9A0: 70        .byte $70   ; 
- D 1 - I - 0x0029B1 00:A9A1: 50        .byte $50   ; 
- D 1 - I - 0x0029B2 00:A9A2: 40        .byte $40   ; 
- D 1 - I - 0x0029B3 00:A9A3: 25        .byte $25   ; 
- D 1 - I - 0x0029B4 00:A9A4: 20        .byte $20   ; 
- D 1 - I - 0x0029B5 00:A9A5: 40        .byte $40   ; 
- D 1 - I - 0x0029B6 00:A9A6: 50        .byte $50   ; 
- D 1 - I - 0x0029B7 00:A9A7: 43        .byte $43   ; 
- D 1 - I - 0x0029B8 00:A9A8: 20        .byte $20   ; 
- D 1 - I - 0x0029B9 00:A9A9: 00        .byte $00   ; 
- D 1 - I - 0x0029BA 00:A9AA: 42        .byte $42   ; 
- D 1 - I - 0x0029BB 00:A9AB: 00        .byte $00   ; 
- D 1 - I - 0x0029BC 00:A9AC: 20        .byte $20   ; 
- D 1 - I - 0x0029BD 00:A9AD: 40        .byte $40   ; 
- D 1 - I - 0x0029BE 00:A9AE: 52        .byte $52   ; 
- D 1 - I - 0x0029BF 00:A9AF: 50        .byte $50   ; 
- D 1 - I - 0x0029C0 00:A9B0: 40        .byte $40   ; 
- D 1 - I - 0x0029C1 00:A9B1: 20        .byte $20   ; 
- D 1 - I - 0x0029C2 00:A9B2: 52        .byte $52   ; 
- D 1 - I - 0x0029C3 00:A9B3: 50        .byte $50   ; 
- D 1 - I - 0x0029C4 00:A9B4: 70        .byte $70   ; 
- D 1 - I - 0x0029C5 00:A9B5: 90        .byte $90   ; 
- D 1 - I - 0x0029C6 00:A9B6: 93        .byte $93   ; 
- D 1 - I - 0x0029C7 00:A9B7: 70        .byte $70   ; 
- D 1 - I - 0x0029C8 00:A9B8: 50        .byte $50   ; 
- D 1 - I - 0x0029C9 00:A9B9: 72        .byte $72   ; 
- D 1 - I - 0x0029CA 00:A9BA: 90        .byte $90   ; 
- D 1 - I - 0x0029CB 00:A9BB: 70        .byte $70   ; 
- D 1 - I - 0x0029CC 00:A9BC: 50        .byte $50   ; 
- D 1 - I - 0x0029CD 00:A9BD: FE        .byte $FE   ; 
- D 1 - I - 0x0029CE 00:A9BE: 03        .byte $03   ; 
- D 1 - I - 0x0029CF 00:A9BF: E9        .byte $E9   ; 
- D 1 - I - 0x0029D0 00:A9C0: 31        .byte $31   ; 
- D 1 - I - 0x0029D1 00:A9C1: D8        .byte $D8   ; 
- D 1 - I - 0x0029D2 00:A9C2: 70        .byte $70   ; 
- D 1 - I - 0x0029D3 00:A9C3: 28        .byte $28   ; 
- D 1 - I - 0x0029D4 00:A9C4: 11        .byte $11   ; 
- D 1 - I - 0x0029D5 00:A9C5: EB        .byte $EB   ; 
- D 1 - I - 0x0029D6 00:A9C6: 50        .byte $50   ; 
- D 1 - I - 0x0029D7 00:A9C7: 21        .byte $21   ; 
- D 1 - I - 0x0029D8 00:A9C8: E2        .byte $E2   ; 
- D 1 - I - 0x0029D9 00:A9C9: 58        .byte $58   ; 
- D 1 - I - 0x0029DA 00:A9CA: 52        .byte $52   ; 
- D 1 - I - 0x0029DB 00:A9CB: 55        .byte $55   ; 
- D 1 - I - 0x0029DC 00:A9CC: 52        .byte $52   ; 
- D 1 - I - 0x0029DD 00:A9CD: 52        .byte $52   ; 
- D 1 - I - 0x0029DE 00:A9CE: 58        .byte $58   ; 
- D 1 - I - 0x0029DF 00:A9CF: 50        .byte $50   ; 
- D 1 - I - 0x0029E0 00:A9D0: 50        .byte $50   ; 
- D 1 - I - 0x0029E1 00:A9D1: 50        .byte $50   ; 
- D 1 - I - 0x0029E2 00:A9D2: 5B        .byte $5B   ; 
- D 1 - I - 0x0029E3 00:A9D3: FF        .byte $FF   ; 


_off014_36_0x0029E4_02:
- D 1 - I - 0x0029E4 00:A9D4: D8        .byte $D8   ; 
- D 1 - I - 0x0029E5 00:A9D5: 18        .byte $18   ; 
- D 1 - I - 0x0029E6 00:A9D6: E2        .byte $E2   ; 
- D 1 - I - 0x0029E7 00:A9D7: 01        .byte $01   ; 
- D 1 - I - 0x0029E8 00:A9D8: 00        .byte $00   ; 
- D 1 - I - 0x0029E9 00:A9D9: C0        .byte $C0   ; 
- D 1 - I - 0x0029EA 00:A9DA: 00        .byte $00   ; 
- D 1 - I - 0x0029EB 00:A9DB: 00        .byte $00   ; 
- D 1 - I - 0x0029EC 00:A9DC: E3        .byte $E3   ; 
- D 1 - I - 0x0029ED 00:A9DD: A1        .byte $A1   ; 
- D 1 - I - 0x0029EE 00:A9DE: A0        .byte $A0   ; 
- D 1 - I - 0x0029EF 00:A9DF: C0        .byte $C0   ; 
- D 1 - I - 0x0029F0 00:A9E0: A0        .byte $A0   ; 
- D 1 - I - 0x0029F1 00:A9E1: A0        .byte $A0   ; 
- D 1 - I - 0x0029F2 00:A9E2: 91        .byte $91   ; 
- D 1 - I - 0x0029F3 00:A9E3: 90        .byte $90   ; 
- D 1 - I - 0x0029F4 00:A9E4: C0        .byte $C0   ; 
- D 1 - I - 0x0029F5 00:A9E5: 90        .byte $90   ; 
- D 1 - I - 0x0029F6 00:A9E6: 90        .byte $90   ; 
- D 1 - I - 0x0029F7 00:A9E7: 71        .byte $71   ; 
- D 1 - I - 0x0029F8 00:A9E8: 70        .byte $70   ; 
- D 1 - I - 0x0029F9 00:A9E9: C0        .byte $C0   ; 
- D 1 - I - 0x0029FA 00:A9EA: 70        .byte $70   ; 
- D 1 - I - 0x0029FB 00:A9EB: 70        .byte $70   ; 
- D 1 - I - 0x0029FC 00:A9EC: D8        .byte $D8   ; 
- D 1 - I - 0x0029FD 00:A9ED: 0F        .byte $0F   ; 
- D 1 - I - 0x0029FE 00:A9EE: FB        .byte $FB   ; 
- D 1 - I - 0x0029FF 00:A9EF: E3        .byte $E3   ; 
- D 1 - I - 0x002A00 00:A9F0: 51        .byte $51   ; 
- D 1 - I - 0x002A01 00:A9F1: 50        .byte $50   ; 
- D 1 - I - 0x002A02 00:A9F2: 50        .byte $50   ; 
- D 1 - I - 0x002A03 00:A9F3: 50        .byte $50   ; 
- D 1 - I - 0x002A04 00:A9F4: 50        .byte $50   ; 
- D 1 - I - 0x002A05 00:A9F5: 51        .byte $51   ; 
- D 1 - I - 0x002A06 00:A9F6: 50        .byte $50   ; 
- D 1 - I - 0x002A07 00:A9F7: 50        .byte $50   ; 
- D 1 - I - 0x002A08 00:A9F8: 50        .byte $50   ; 
- D 1 - I - 0x002A09 00:A9F9: 50        .byte $50   ; 
- D 1 - I - 0x002A0A 00:A9FA: 41        .byte $41   ; 
- D 1 - I - 0x002A0B 00:A9FB: 40        .byte $40   ; 
- D 1 - I - 0x002A0C 00:A9FC: 40        .byte $40   ; 
- D 1 - I - 0x002A0D 00:A9FD: 40        .byte $40   ; 
- D 1 - I - 0x002A0E 00:A9FE: 40        .byte $40   ; 
- D 1 - I - 0x002A0F 00:A9FF: 41        .byte $41   ; 
- D 1 - I - 0x002A10 00:AA00: 40        .byte $40   ; 
- D 1 - I - 0x002A11 00:AA01: 40        .byte $40   ; 
- D 1 - I - 0x002A12 00:AA02: 40        .byte $40   ; 
- D 1 - I - 0x002A13 00:AA03: 40        .byte $40   ; 
- D 1 - I - 0x002A14 00:AA04: 31        .byte $31   ; 
- D 1 - I - 0x002A15 00:AA05: 30        .byte $30   ; 
- D 1 - I - 0x002A16 00:AA06: 30        .byte $30   ; 
- D 1 - I - 0x002A17 00:AA07: 30        .byte $30   ; 
- D 1 - I - 0x002A18 00:AA08: 30        .byte $30   ; 
- D 1 - I - 0x002A19 00:AA09: 31        .byte $31   ; 
- D 1 - I - 0x002A1A 00:AA0A: 30        .byte $30   ; 
- D 1 - I - 0x002A1B 00:AA0B: 30        .byte $30   ; 
- D 1 - I - 0x002A1C 00:AA0C: 30        .byte $30   ; 
- D 1 - I - 0x002A1D 00:AA0D: 30        .byte $30   ; 
- D 1 - I - 0x002A1E 00:AA0E: 21        .byte $21   ; 
- D 1 - I - 0x002A1F 00:AA0F: 20        .byte $20   ; 
- D 1 - I - 0x002A20 00:AA10: 20        .byte $20   ; 
- D 1 - I - 0x002A21 00:AA11: 20        .byte $20   ; 
- D 1 - I - 0x002A22 00:AA12: 20        .byte $20   ; 
- D 1 - I - 0x002A23 00:AA13: 21        .byte $21   ; 
- D 1 - I - 0x002A24 00:AA14: 20        .byte $20   ; 
- D 1 - I - 0x002A25 00:AA15: 20        .byte $20   ; 
- D 1 - I - 0x002A26 00:AA16: 20        .byte $20   ; 
- D 1 - I - 0x002A27 00:AA17: 20        .byte $20   ; 
- D 1 - I - 0x002A28 00:AA18: E3        .byte $E3   ; 
- D 1 - I - 0x002A29 00:AA19: A1        .byte $A1   ; 
- D 1 - I - 0x002A2A 00:AA1A: A0        .byte $A0   ; 
- D 1 - I - 0x002A2B 00:AA1B: A0        .byte $A0   ; 
- D 1 - I - 0x002A2C 00:AA1C: A0        .byte $A0   ; 
- D 1 - I - 0x002A2D 00:AA1D: A0        .byte $A0   ; 
- D 1 - I - 0x002A2E 00:AA1E: A1        .byte $A1   ; 
- D 1 - I - 0x002A2F 00:AA1F: A0        .byte $A0   ; 
- D 1 - I - 0x002A30 00:AA20: A0        .byte $A0   ; 
- D 1 - I - 0x002A31 00:AA21: A0        .byte $A0   ; 
- D 1 - I - 0x002A32 00:AA22: A0        .byte $A0   ; 
- D 1 - I - 0x002A33 00:AA23: 91        .byte $91   ; 
- D 1 - I - 0x002A34 00:AA24: 90        .byte $90   ; 
- D 1 - I - 0x002A35 00:AA25: 90        .byte $90   ; 
- D 1 - I - 0x002A36 00:AA26: 90        .byte $90   ; 
- D 1 - I - 0x002A37 00:AA27: 90        .byte $90   ; 
- D 1 - I - 0x002A38 00:AA28: 91        .byte $91   ; 
- D 1 - I - 0x002A39 00:AA29: 90        .byte $90   ; 
- D 1 - I - 0x002A3A 00:AA2A: 90        .byte $90   ; 
- D 1 - I - 0x002A3B 00:AA2B: 90        .byte $90   ; 
- D 1 - I - 0x002A3C 00:AA2C: 90        .byte $90   ; 
- D 1 - I - 0x002A3D 00:AA2D: A1        .byte $A1   ; 
- D 1 - I - 0x002A3E 00:AA2E: A0        .byte $A0   ; 
- D 1 - I - 0x002A3F 00:AA2F: A0        .byte $A0   ; 
- D 1 - I - 0x002A40 00:AA30: A0        .byte $A0   ; 
- D 1 - I - 0x002A41 00:AA31: A0        .byte $A0   ; 
- D 1 - I - 0x002A42 00:AA32: B1        .byte $B1   ; 
- D 1 - I - 0x002A43 00:AA33: B0        .byte $B0   ; 
- D 1 - I - 0x002A44 00:AA34: B0        .byte $B0   ; 
- D 1 - I - 0x002A45 00:AA35: B0        .byte $B0   ; 
- D 1 - I - 0x002A46 00:AA36: B0        .byte $B0   ; 
- D 1 - I - 0x002A47 00:AA37: E2        .byte $E2   ; 
- D 1 - I - 0x002A48 00:AA38: 01        .byte $01   ; 
- D 1 - I - 0x002A49 00:AA39: 00        .byte $00   ; 
- D 1 - I - 0x002A4A 00:AA3A: 00        .byte $00   ; 
- D 1 - I - 0x002A4B 00:AA3B: 00        .byte $00   ; 
- D 1 - I - 0x002A4C 00:AA3C: 00        .byte $00   ; 
- D 1 - I - 0x002A4D 00:AA3D: 01        .byte $01   ; 
- D 1 - I - 0x002A4E 00:AA3E: 00        .byte $00   ; 
- D 1 - I - 0x002A4F 00:AA3F: 00        .byte $00   ; 
- D 1 - I - 0x002A50 00:AA40: 00        .byte $00   ; 
- D 1 - I - 0x002A51 00:AA41: 00        .byte $00   ; 
- D 1 - I - 0x002A52 00:AA42: FE        .byte $FE   ; 
- D 1 - I - 0x002A53 00:AA43: 03        .byte $03   ; 
- D 1 - I - 0x002A54 00:AA44: EA        .byte $EA   ; 
- D 1 - I - 0x002A55 00:AA45: 00        .byte $00   ; 
- D 1 - I - 0x002A56 00:AA46: D4        .byte $D4   ; 
- D 1 - I - 0x002A57 00:AA47: 00        .byte $00   ; 
- D 1 - I - 0x002A58 00:AA48: E2        .byte $E2   ; 
- D 1 - I - 0x002A59 00:AA49: 00        .byte $00   ; 
- D 1 - I - 0x002A5A 00:AA4A: 10        .byte $10   ; 
- D 1 - I - 0x002A5B 00:AA4B: D8        .byte $D8   ; 
- D 1 - I - 0x002A5C 00:AA4C: 00        .byte $00   ; 
- D 1 - I - 0x002A5D 00:AA4D: 17        .byte $17   ; 
- D 1 - I - 0x002A5E 00:AA4E: D8        .byte $D8   ; 
- D 1 - I - 0x002A5F 00:AA4F: 10        .byte $10   ; 
- D 1 - I - 0x002A60 00:AA50: 10        .byte $10   ; 
- D 1 - I - 0x002A61 00:AA51: 10        .byte $10   ; 
- D 1 - I - 0x002A62 00:AA52: 10        .byte $10   ; 
- D 1 - I - 0x002A63 00:AA53: D8        .byte $D8   ; 
- D 1 - I - 0x002A64 00:AA54: 40        .byte $40   ; 
- D 1 - I - 0x002A65 00:AA55: 35        .byte $35   ; 
- D 1 - I - 0x002A66 00:AA56: D2        .byte $D2   ; 
- D 1 - I - 0x002A67 00:AA57: 20        .byte $20   ; 
- D 1 - I - 0x002A68 00:AA58: 20        .byte $20   ; 
- D 1 - I - 0x002A69 00:AA59: 3A        .byte $3A   ; 
- D 1 - I - 0x002A6A 00:AA5A: 21        .byte $21   ; 
- D 1 - I - 0x002A6B 00:AA5B: 39        .byte $39   ; 
- D 1 - I - 0x002A6C 00:AA5C: D8        .byte $D8   ; 
- D 1 - I - 0x002A6D 00:AA5D: 00        .byte $00   ; 
- D 1 - I - 0x002A6E 00:AA5E: 55        .byte $55   ; 
- D 1 - I - 0x002A6F 00:AA5F: D8        .byte $D8   ; 
- D 1 - I - 0x002A70 00:AA60: 40        .byte $40   ; 
- D 1 - I - 0x002A71 00:AA61: 52        .byte $52   ; 
- D 1 - I - 0x002A72 00:AA62: D8        .byte $D8   ; 
- D 1 - I - 0x002A73 00:AA63: 10        .byte $10   ; 
- D 1 - I - 0x002A74 00:AA64: E2        .byte $E2   ; 
- D 1 - I - 0x002A75 00:AA65: 50        .byte $50   ; 
- D 1 - I - 0x002A76 00:AA66: 50        .byte $50   ; 
- D 1 - I - 0x002A77 00:AA67: 50        .byte $50   ; 
- D 1 - I - 0x002A78 00:AA68: D8        .byte $D8   ; 
- D 1 - I - 0x002A79 00:AA69: 00        .byte $00   ; 
- D 1 - I - 0x002A7A 00:AA6A: 55        .byte $55   ; 
- D 1 - I - 0x002A7B 00:AA6B: 55        .byte $55   ; 
- D 1 - I - 0x002A7C 00:AA6C: FF        .byte $FF   ; 


_off014_36_0x002A7D_03:
- D 1 - I - 0x002A7D 00:AA6D: D1        .byte $D1   ; 
- D 1 - I - 0x002A7E 00:AA6E: E2        .byte $E2   ; 
- D 1 - I - 0x002A7F 00:AA6F: 00        .byte $00   ; 
- D 1 - I - 0x002A80 00:AA70: D1        .byte $D1   ; 
- D 1 - I - 0x002A81 00:AA71: 26        .byte $26   ; 
- D 1 - I - 0x002A82 00:AA72: 13        .byte $13   ; 
- D 1 - I - 0x002A83 00:AA73: 13        .byte $13   ; 
- D 1 - I - 0x002A84 00:AA74: E2        .byte $E2   ; 
- D 1 - I - 0x002A85 00:AA75: 00        .byte $00   ; 
- D 1 - I - 0x002A86 00:AA76: D1        .byte $D1   ; 
- D 1 - I - 0x002A87 00:AA77: 16        .byte $16   ; 
- D 1 - I - 0x002A88 00:AA78: A0        .byte $A0   ; 
- D 1 - I - 0x002A89 00:AA79: 26        .byte $26   ; 
- D 1 - I - 0x002A8A 00:AA7A: E2        .byte $E2   ; 
- D 1 - I - 0x002A8B 00:AA7B: 00        .byte $00   ; 
- D 1 - I - 0x002A8C 00:AA7C: D1        .byte $D1   ; 
- D 1 - I - 0x002A8D 00:AA7D: 16        .byte $16   ; 
- D 1 - I - 0x002A8E 00:AA7E: E2        .byte $E2   ; 
- D 1 - I - 0x002A8F 00:AA7F: 00        .byte $00   ; 
- D 1 - I - 0x002A90 00:AA80: D1        .byte $D1   ; 
- D 1 - I - 0x002A91 00:AA81: 16        .byte $16   ; 
- D 1 - I - 0x002A92 00:AA82: E3        .byte $E3   ; 
- D 1 - I - 0x002A93 00:AA83: A0        .byte $A0   ; 
- D 1 - I - 0x002A94 00:AA84: D1        .byte $D1   ; 
- D 1 - I - 0x002A95 00:AA85: 16        .byte $16   ; 
- D 1 - I - 0x002A96 00:AA86: 17        .byte $17   ; 
- D 1 - I - 0x002A97 00:AA87: E3        .byte $E3   ; 
- D 1 - I - 0x002A98 00:AA88: A0        .byte $A0   ; 
- D 1 - I - 0x002A99 00:AA89: D1        .byte $D1   ; 
- D 1 - I - 0x002A9A 00:AA8A: 16        .byte $16   ; 
- D 1 - I - 0x002A9B 00:AA8B: A0        .byte $A0   ; 
- D 1 - I - 0x002A9C 00:AA8C: 26        .byte $26   ; 
- D 1 - I - 0x002A9D 00:AA8D: E3        .byte $E3   ; 
- D 1 - I - 0x002A9E 00:AA8E: A0        .byte $A0   ; 
- D 1 - I - 0x002A9F 00:AA8F: D1        .byte $D1   ; 
- D 1 - I - 0x002AA0 00:AA90: 16        .byte $16   ; 
- D 1 - I - 0x002AA1 00:AA91: E3        .byte $E3   ; 
- D 1 - I - 0x002AA2 00:AA92: A0        .byte $A0   ; 
- D 1 - I - 0x002AA3 00:AA93: D1        .byte $D1   ; 
- D 1 - I - 0x002AA4 00:AA94: 16        .byte $16   ; 
- D 1 - I - 0x002AA5 00:AA95: E3        .byte $E3   ; 
- D 1 - I - 0x002AA6 00:AA96: 90        .byte $90   ; 
- D 1 - I - 0x002AA7 00:AA97: D1        .byte $D1   ; 
- D 1 - I - 0x002AA8 00:AA98: 16        .byte $16   ; 
- D 1 - I - 0x002AA9 00:AA99: 13        .byte $13   ; 
- D 1 - I - 0x002AAA 00:AA9A: 13        .byte $13   ; 
- D 1 - I - 0x002AAB 00:AA9B: E3        .byte $E3   ; 
- D 1 - I - 0x002AAC 00:AA9C: 90        .byte $90   ; 
- D 1 - I - 0x002AAD 00:AA9D: D1        .byte $D1   ; 
- D 1 - I - 0x002AAE 00:AA9E: 16        .byte $16   ; 
- D 1 - I - 0x002AAF 00:AA9F: E2        .byte $E2   ; 
- D 1 - I - 0x002AB0 00:AAA0: 00        .byte $00   ; 
- D 1 - I - 0x002AB1 00:AAA1: D1        .byte $D1   ; 
- D 1 - I - 0x002AB2 00:AAA2: 26        .byte $26   ; 
- D 1 - I - 0x002AB3 00:AAA3: E3        .byte $E3   ; 
- D 1 - I - 0x002AB4 00:AAA4: 50        .byte $50   ; 
- D 1 - I - 0x002AB5 00:AAA5: D1        .byte $D1   ; 
- D 1 - I - 0x002AB6 00:AAA6: 26        .byte $26   ; 
- D 1 - I - 0x002AB7 00:AAA7: E3        .byte $E3   ; 
- D 1 - I - 0x002AB8 00:AAA8: 70        .byte $70   ; 
- D 1 - I - 0x002AB9 00:AAA9: D1        .byte $D1   ; 
- D 1 - I - 0x002ABA 00:AAAA: 26        .byte $26   ; 
- D 1 - I - 0x002ABB 00:AAAB: E2        .byte $E2   ; 
- D 1 - I - 0x002ABC 00:AAAC: 00        .byte $00   ; 
- D 1 - I - 0x002ABD 00:AAAD: D1        .byte $D1   ; 
- D 1 - I - 0x002ABE 00:AAAE: 26        .byte $26   ; 
- D 1 - I - 0x002ABF 00:AAAF: A0        .byte $A0   ; 
- D 1 - I - 0x002AC0 00:AAB0: 22        .byte $22   ; 
- D 1 - I - 0x002AC1 00:AAB1: A0        .byte $A0   ; 
- D 1 - I - 0x002AC2 00:AAB2: 22        .byte $22   ; 
- D 1 - I - 0x002AC3 00:AAB3: A0        .byte $A0   ; 
- D 1 - I - 0x002AC4 00:AAB4: 26        .byte $26   ; 
- D 1 - I - 0x002AC5 00:AAB5: A0        .byte $A0   ; 
- D 1 - I - 0x002AC6 00:AAB6: 26        .byte $26   ; 
- D 1 - I - 0x002AC7 00:AAB7: A0        .byte $A0   ; 
- D 1 - I - 0x002AC8 00:AAB8: 26        .byte $26   ; 
- D 1 - I - 0x002AC9 00:AAB9: A0        .byte $A0   ; 
- D 1 - I - 0x002ACA 00:AABA: 26        .byte $26   ; 
- D 1 - I - 0x002ACB 00:AABB: FD        .byte $FD   ; 
- D 1 - I - 0x002ACC 00:AABC: 15 AB     .word sub_FD_AB15
- D 1 - I - 0x002ACE 00:AABE: FD        .byte $FD   ; 
- D 1 - I - 0x002ACF 00:AABF: 15 AB     .word sub_FD_AB15
- D 1 - I - 0x002AD1 00:AAC1: FD        .byte $FD   ; 
- D 1 - I - 0x002AD2 00:AAC2: 15 AB     .word sub_FD_AB15
- D 1 - I - 0x002AD4 00:AAC4: D1        .byte $D1   ; 
- D 1 - I - 0x002AD5 00:AAC5: B0        .byte $B0   ; 
- D 1 - I - 0x002AD6 00:AAC6: 26        .byte $26   ; 
- D 1 - I - 0x002AD7 00:AAC7: 23        .byte $23   ; 
- D 1 - I - 0x002AD8 00:AAC8: 13        .byte $13   ; 
- D 1 - I - 0x002AD9 00:AAC9: B0        .byte $B0   ; 
- D 1 - I - 0x002ADA 00:AACA: 26        .byte $26   ; 
- D 1 - I - 0x002ADB 00:AACB: A0        .byte $A0   ; 
- D 1 - I - 0x002ADC 00:AACC: 26        .byte $26   ; 
- D 1 - I - 0x002ADD 00:AACD: B0        .byte $B0   ; 
- D 1 - I - 0x002ADE 00:AACE: 26        .byte $26   ; 
- D 1 - I - 0x002ADF 00:AACF: 27        .byte $27   ; 
- D 1 - I - 0x002AE0 00:AAD0: B0        .byte $B0   ; 
- D 1 - I - 0x002AE1 00:AAD1: 26        .byte $26   ; 
- D 1 - I - 0x002AE2 00:AAD2: 27        .byte $27   ; 
- D 1 - I - 0x002AE3 00:AAD3: B0        .byte $B0   ; 
- D 1 - I - 0x002AE4 00:AAD4: 26        .byte $26   ; 
- D 1 - I - 0x002AE5 00:AAD5: A0        .byte $A0   ; 
- D 1 - I - 0x002AE6 00:AAD6: 26        .byte $26   ; 
- D 1 - I - 0x002AE7 00:AAD7: B0        .byte $B0   ; 
- D 1 - I - 0x002AE8 00:AAD8: 26        .byte $26   ; 
- D 1 - I - 0x002AE9 00:AAD9: 27        .byte $27   ; 
- D 1 - I - 0x002AEA 00:AADA: B0        .byte $B0   ; 
- D 1 - I - 0x002AEB 00:AADB: 26        .byte $26   ; 
- D 1 - I - 0x002AEC 00:AADC: 93        .byte $93   ; 
- D 1 - I - 0x002AED 00:AADD: 93        .byte $93   ; 
- D 1 - I - 0x002AEE 00:AADE: 90        .byte $90   ; 
- D 1 - I - 0x002AEF 00:AADF: 26        .byte $26   ; 
- D 1 - I - 0x002AF0 00:AAE0: A0        .byte $A0   ; 
- D 1 - I - 0x002AF1 00:AAE1: 26        .byte $26   ; 
- D 1 - I - 0x002AF2 00:AAE2: 80        .byte $80   ; 
- D 1 - I - 0x002AF3 00:AAE3: 26        .byte $26   ; 
- D 1 - I - 0x002AF4 00:AAE4: 80        .byte $80   ; 
- D 1 - I - 0x002AF5 00:AAE5: 26        .byte $26   ; 
- D 1 - I - 0x002AF6 00:AAE6: B0        .byte $B0   ; 
- D 1 - I - 0x002AF7 00:AAE7: 26        .byte $26   ; 
- D 1 - I - 0x002AF8 00:AAE8: A0        .byte $A0   ; 
- D 1 - I - 0x002AF9 00:AAE9: 26        .byte $26   ; 
- D 1 - I - 0x002AFA 00:AAEA: A0        .byte $A0   ; 
- D 1 - I - 0x002AFB 00:AAEB: 26        .byte $26   ; 
- D 1 - I - 0x002AFC 00:AAEC: A0        .byte $A0   ; 
- D 1 - I - 0x002AFD 00:AAED: 26        .byte $26   ; 
- D 1 - I - 0x002AFE 00:AAEE: 80        .byte $80   ; 
- D 1 - I - 0x002AFF 00:AAEF: 26        .byte $26   ; 
- D 1 - I - 0x002B00 00:AAF0: 70        .byte $70   ; 
- D 1 - I - 0x002B01 00:AAF1: 26        .byte $26   ; 
- D 1 - I - 0x002B02 00:AAF2: B0        .byte $B0   ; 
- D 1 - I - 0x002B03 00:AAF3: 26        .byte $26   ; 
- D 1 - I - 0x002B04 00:AAF4: 23        .byte $23   ; 
- D 1 - I - 0x002B05 00:AAF5: 23        .byte $23   ; 
- D 1 - I - 0x002B06 00:AAF6: B0        .byte $B0   ; 
- D 1 - I - 0x002B07 00:AAF7: 26        .byte $26   ; 
- D 1 - I - 0x002B08 00:AAF8: A0        .byte $A0   ; 
- D 1 - I - 0x002B09 00:AAF9: 26        .byte $26   ; 
- D 1 - I - 0x002B0A 00:AAFA: B0        .byte $B0   ; 
- D 1 - I - 0x002B0B 00:AAFB: 26        .byte $26   ; 
- D 1 - I - 0x002B0C 00:AAFC: 27        .byte $27   ; 
- D 1 - I - 0x002B0D 00:AAFD: B0        .byte $B0   ; 
- D 1 - I - 0x002B0E 00:AAFE: 26        .byte $26   ; 
- D 1 - I - 0x002B0F 00:AAFF: 27        .byte $27   ; 
- D 1 - I - 0x002B10 00:AB00: B0        .byte $B0   ; 
- D 1 - I - 0x002B11 00:AB01: 26        .byte $26   ; 
- D 1 - I - 0x002B12 00:AB02: A3        .byte $A3   ; 
- D 1 - I - 0x002B13 00:AB03: A3        .byte $A3   ; 
- D 1 - I - 0x002B14 00:AB04: C7        .byte $C7   ; 
- D 1 - I - 0x002B15 00:AB05: C7        .byte $C7   ; 
- D 1 - I - 0x002B16 00:AB06: B0        .byte $B0   ; 
- D 1 - I - 0x002B17 00:AB07: 26        .byte $26   ; 
- D 1 - I - 0x002B18 00:AB08: 93        .byte $93   ; 
- D 1 - I - 0x002B19 00:AB09: 93        .byte $93   ; 
- D 1 - I - 0x002B1A 00:AB0A: 83        .byte $83   ; 
- D 1 - I - 0x002B1B 00:AB0B: 73        .byte $73   ; 
- D 1 - I - 0x002B1C 00:AB0C: A0        .byte $A0   ; 
- D 1 - I - 0x002B1D 00:AB0D: 26        .byte $26   ; 
- D 1 - I - 0x002B1E 00:AB0E: A0        .byte $A0   ; 
- D 1 - I - 0x002B1F 00:AB0F: 26        .byte $26   ; 
- D 1 - I - 0x002B20 00:AB10: A0        .byte $A0   ; 
- D 1 - I - 0x002B21 00:AB11: 26        .byte $26   ; 
- D 1 - I - 0x002B22 00:AB12: A0        .byte $A0   ; 
- D 1 - I - 0x002B23 00:AB13: 26        .byte $26   ; 
- D 1 - I - 0x002B24 00:AB14: FF        .byte $FF   ; 



sub_FD_AB15:
- D 1 - I - 0x002B25 00:AB15: D1        .byte $D1   ; 
- D 1 - I - 0x002B26 00:AB16: FB        .byte $FB   ; 
- D 1 - I - 0x002B27 00:AB17: B0        .byte $B0   ; 
- D 1 - I - 0x002B28 00:AB18: 26        .byte $26   ; 
- D 1 - I - 0x002B29 00:AB19: 23        .byte $23   ; 
- D 1 - I - 0x002B2A 00:AB1A: 13        .byte $13   ; 
- D 1 - I - 0x002B2B 00:AB1B: B0        .byte $B0   ; 
- D 1 - I - 0x002B2C 00:AB1C: 26        .byte $26   ; 
- D 1 - I - 0x002B2D 00:AB1D: A0        .byte $A0   ; 
- D 1 - I - 0x002B2E 00:AB1E: 26        .byte $26   ; 
- D 1 - I - 0x002B2F 00:AB1F: B0        .byte $B0   ; 
- D 1 - I - 0x002B30 00:AB20: 26        .byte $26   ; 
- D 1 - I - 0x002B31 00:AB21: 27        .byte $27   ; 
- D 1 - I - 0x002B32 00:AB22: B0        .byte $B0   ; 
- D 1 - I - 0x002B33 00:AB23: 26        .byte $26   ; 
- D 1 - I - 0x002B34 00:AB24: 27        .byte $27   ; 
- D 1 - I - 0x002B35 00:AB25: B0        .byte $B0   ; 
- D 1 - I - 0x002B36 00:AB26: 26        .byte $26   ; 
- D 1 - I - 0x002B37 00:AB27: A0        .byte $A0   ; 
- D 1 - I - 0x002B38 00:AB28: 26        .byte $26   ; 
- D 1 - I - 0x002B39 00:AB29: B0        .byte $B0   ; 
- D 1 - I - 0x002B3A 00:AB2A: 26        .byte $26   ; 
- D 1 - I - 0x002B3B 00:AB2B: 27        .byte $27   ; 
- D 1 - I - 0x002B3C 00:AB2C: FE        .byte $FE   ; 
- D 1 - I - 0x002B3D 00:AB2D: 07        .byte $07   ; 
- D 1 - I - 0x002B3E 00:AB2E: B0        .byte $B0   ; 
- D 1 - I - 0x002B3F 00:AB2F: 26        .byte $26   ; 
- D 1 - I - 0x002B40 00:AB30: 23        .byte $23   ; 
- D 1 - I - 0x002B41 00:AB31: 13        .byte $13   ; 
- D 1 - I - 0x002B42 00:AB32: B0        .byte $B0   ; 
- D 1 - I - 0x002B43 00:AB33: 26        .byte $26   ; 
- D 1 - I - 0x002B44 00:AB34: A0        .byte $A0   ; 
- D 1 - I - 0x002B45 00:AB35: 26        .byte $26   ; 
- D 1 - I - 0x002B46 00:AB36: B0        .byte $B0   ; 
- D 1 - I - 0x002B47 00:AB37: 26        .byte $26   ; 
- D 1 - I - 0x002B48 00:AB38: 27        .byte $27   ; 
- D 1 - I - 0x002B49 00:AB39: B0        .byte $B0   ; 
- D 1 - I - 0x002B4A 00:AB3A: 26        .byte $26   ; 
- D 1 - I - 0x002B4B 00:AB3B: 27        .byte $27   ; 
- D 1 - I - 0x002B4C 00:AB3C: B0        .byte $B0   ; 
- D 1 - I - 0x002B4D 00:AB3D: 26        .byte $26   ; 
- D 1 - I - 0x002B4E 00:AB3E: A0        .byte $A0   ; 
- D 1 - I - 0x002B4F 00:AB3F: 26        .byte $26   ; 
- D 1 - I - 0x002B50 00:AB40: A0        .byte $A0   ; 
- D 1 - I - 0x002B51 00:AB41: 26        .byte $26   ; 
- D 1 - I - 0x002B52 00:AB42: A0        .byte $A0   ; 
- D 1 - I - 0x002B53 00:AB43: 26        .byte $26   ; 
- D 1 - I - 0x002B54 00:AB44: FD        .byte $FD   ; 




_off004_0x002B55_01_area_2:
- D 1 - I - 0x002B55 00:AB45: 02        .byte $02   ; столбцы
- D 1 - I - 0x002B56 00:AB46: 0D        .byte $0D   ; строки

;                                              00   01
- D 1 - I - 0x002B57 00:AB47: 0D        .byte $0D, $00   ; 00 
- D 1 - I - 0x002B59 00:AB49: 0C        .byte $0C, $0E   ; 01 
- D 1 - I - 0x002B5B 00:AB4B: 0B        .byte $0B, $00   ; 02 
- D 1 - I - 0x002B5D 00:AB4D: 0A        .byte $0A, $00   ; 03 
- D 1 - I - 0x002B5F 00:AB4F: 09        .byte $09, $00   ; 04 
- D 1 - I - 0x002B61 00:AB51: 08        .byte $08, $00   ; 05 
- D 1 - I - 0x002B63 00:AB53: 07        .byte $07, $00   ; 06 
- D 1 - I - 0x002B65 00:AB55: 06        .byte $06, $00   ; 07 
- D 1 - I - 0x002B67 00:AB57: 05        .byte $05, $00   ; 08 
- D 1 - I - 0x002B69 00:AB59: 04        .byte $04, $00   ; 09 
- D 1 - I - 0x002B6B 00:AB5B: 03        .byte $03, $00   ; 0A 
- D 1 - I - 0x002B6D 00:AB5D: 02        .byte $02, $00   ; 0B 
- D 1 - I - 0x002B6F 00:AB5F: 01        .byte $01, $0F   ; 0C 



_off005_0x002B71_01_area_2:
- D 1 - I - 0x002B71 00:AB61: 7F AB     .word _off018_01_AB7F_00
- D 1 - I - 0x002B73 00:AB63: BF AB     .word _off018_01_ABBF_01
- D 1 - I - 0x002B75 00:AB65: FF AB     .word _off018_01_ABFF_02
- D 1 - I - 0x002B77 00:AB67: 3F AC     .word _off018_01_AC3F_03
- D 1 - I - 0x002B79 00:AB69: 7F AC     .word _off018_01_AC7F_04
- D 1 - I - 0x002B7B 00:AB6B: BF AC     .word _off018_01_ACBF_05
- D 1 - I - 0x002B7D 00:AB6D: FF AC     .word _off018_01_ACFF_06
- D 1 - I - 0x002B7F 00:AB6F: 3F AD     .word _off018_01_AD3F_07
- D 1 - I - 0x002B81 00:AB71: 7F AD     .word _off018_01_AD7F_08
- D 1 - I - 0x002B83 00:AB73: BF AD     .word _off018_01_ADBF_09
- D 1 - I - 0x002B85 00:AB75: FF AD     .word _off018_01_ADFF_0A
- D 1 - I - 0x002B87 00:AB77: 3F AE     .word _off018_01_AE3F_0B
- D 1 - I - 0x002B89 00:AB79: 7F AE     .word _off018_01_AE7F_0C
- D 1 - I - 0x002B8B 00:AB7B: BF AE     .word _off018_01_AEBF_0D
- D 1 - I - 0x002B8D 00:AB7D: FF AE     .word _off018_01_AEFF_0E



_off018_01_AB7F_00:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002B8F 00:AB7F: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x002B97 00:AB87: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x002B9F 00:AB8F: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- - - - - - 0x002BA7 00:AB97: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 03 
- D 1 - I - 0x002BAF 00:AB9F: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 04 
- D 1 - I - 0x002BB7 00:ABA7: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 05 
- D 1 - I - 0x002BBF 00:ABAF: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 06 
- D 1 - I - 0x002BC7 00:ABB7: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 07 



_off018_01_ABBF_01:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002BCF 00:ABBF: 01        .byte $01, $01, $02, $1F, $10, $11, $12, $12   ; 00 
- D 1 - I - 0x002BD7 00:ABC7: 02        .byte $02, $01, $01, $1F, $14, $15, $16, $0B   ; 01 
- D 1 - I - 0x002BDF 00:ABCF: 01        .byte $01, $01, $01, $1F, $18, $19, $1A, $08   ; 02 
- D 1 - I - 0x002BE7 00:ABD7: 01        .byte $01, $01, $02, $1F, $1C, $1D, $1E, $0F   ; 03 
- D 1 - I - 0x002BEF 00:ABDF: 0C        .byte $0C, $01, $01, $01, $06, $07, $07, $00   ; 04 
- D 1 - I - 0x002BF7 00:ABE7: 04        .byte $04, $05, $01, $02, $01, $06, $07, $00   ; 05 
- D 1 - I - 0x002BFF 00:ABEF: 08        .byte $08, $09, $0A, $01, $01, $02, $06, $03   ; 06 
- D 1 - I - 0x002C07 00:ABF7: 08        .byte $08, $0D, $0E, $01, $01, $01, $01, $06   ; 07 



_off018_01_ABFF_02:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002C0F 00:ABFF: 31        .byte $31, $32, $30, $30, $30, $30, $30, $23   ; 00 
- D 1 - I - 0x002C17 00:AC07: 20        .byte $20, $21, $22, $22, $22, $36, $3E, $33   ; 01 
- D 1 - I - 0x002C1F 00:AC0F: 24        .byte $24, $25, $26, $27, $34, $35, $3E, $30   ; 02 
- D 1 - I - 0x002C27 00:AC17: 28        .byte $28, $29, $2A, $2B, $38, $39, $30, $23   ; 03 
- D 1 - I - 0x002C2F 00:AC1F: 2C        .byte $2C, $28, $2E, $2F, $3C, $3D, $37, $33   ; 04 
- D 1 - I - 0x002C37 00:AC27: 13        .byte $13, $17, $1B, $3A, $3A, $3A, $3B, $37   ; 05 
- D 1 - I - 0x002C3F 00:AC2F: 3A        .byte $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3B   ; 06 
- D 1 - I - 0x002C47 00:AC37: 30        .byte $30, $30, $30, $30, $22, $22, $22, $22   ; 07 



_off018_01_AC3F_03:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002C4F 00:AC3F: 3F        .byte $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F   ; 00 
- D 1 - I - 0x002C57 00:AC47: 01        .byte $01, $01, $01, $01, $01, $01, $01, $01   ; 01 
- D 1 - I - 0x002C5F 00:AC4F: 01        .byte $01, $01, $01, $01, $01, $01, $01, $01   ; 02 
- D 1 - I - 0x002C67 00:AC57: 01        .byte $01, $01, $01, $01, $01, $01, $01, $01   ; 03 
- D 1 - I - 0x002C6F 00:AC5F: 01        .byte $01, $01, $01, $01, $01, $01, $01, $01   ; 04 
- D 1 - I - 0x002C77 00:AC67: 01        .byte $01, $01, $01, $01, $01, $01, $01, $01   ; 05 
- D 1 - I - 0x002C7F 00:AC6F: 01        .byte $01, $01, $01, $01, $01, $01, $01, $01   ; 06 
- D 1 - I - 0x002C87 00:AC77: 01        .byte $01, $01, $01, $01, $01, $01, $01, $01   ; 07 



_off018_01_AC7F_04:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002C8F 00:AC7F: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 00 
- D 1 - I - 0x002C97 00:AC87: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 01 
- D 1 - I - 0x002C9F 00:AC8F: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 02 
- D 1 - I - 0x002CA7 00:AC97: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 03 
- D 1 - I - 0x002CAF 00:AC9F: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 04 
- D 1 - I - 0x002CB7 00:ACA7: 40        .byte $40, $40, $41, $42, $43, $44, $40, $40   ; 05 
- D 1 - I - 0x002CBF 00:ACAF: 40        .byte $40, $40, $45, $46, $47, $48, $40, $40   ; 06 
- D 1 - I - 0x002CC7 00:ACB7: 40        .byte $40, $40, $49, $4A, $4A, $4B, $40, $40   ; 07 



_off018_01_ACBF_05:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002CCF 00:ACBF: 5C        .byte $5C, $54, $55, $40, $40, $56, $57, $51   ; 00 
- D 1 - I - 0x002CD7 00:ACC7: 5D        .byte $5D, $58, $59, $40, $40, $5A, $5B, $52   ; 01 
- D 1 - I - 0x002CDF 00:ACCF: 4C        .byte $4C, $4D, $4E, $4F, $40, $5E, $5F, $4C   ; 02 
- D 1 - I - 0x002CE7 00:ACD7: 64        .byte $64, $64, $64, $64, $4F, $63, $64, $64   ; 03 
- D 1 - I - 0x002CEF 00:ACDF: 64        .byte $64, $64, $64, $64, $64, $4F, $63, $64   ; 04 
- D 1 - I - 0x002CF7 00:ACE7: 41        .byte $41, $42, $43, $44, $41, $42, $43, $44   ; 05 
- D 1 - I - 0x002CFF 00:ACEF: 45        .byte $45, $46, $47, $48, $45, $46, $47, $48   ; 06 
- D 1 - I - 0x002D07 00:ACF7: 49        .byte $49, $4A, $4A, $4B, $49, $4A, $4A, $4B   ; 07 



_off018_01_ACFF_06:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002D0F 00:ACFF: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 00 
- D 1 - I - 0x002D17 00:AD07: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 01 
- D 1 - I - 0x002D1F 00:AD0F: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 02 
- D 1 - I - 0x002D27 00:AD17: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 03 
- D 1 - I - 0x002D2F 00:AD1F: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 04 
- D 1 - I - 0x002D37 00:AD27: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 05 
- D 1 - I - 0x002D3F 00:AD2F: 61        .byte $61, $60, $40, $40, $40, $40, $62, $61   ; 06 
- D 1 - I - 0x002D47 00:AD37: 6F        .byte $6F, $50, $40, $40, $40, $40, $53, $6F   ; 07 



_off018_01_AD3F_07:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002D4F 00:AD3F: 40        .byte $40, $40, $90, $91, $6B, $6F, $6F, $6F   ; 00 
- D 1 - I - 0x002D57 00:AD47: 40        .byte $40, $40, $94, $95, $78, $79, $80, $79   ; 01 
- D 1 - I - 0x002D5F 00:AD4F: 40        .byte $40, $40, $40, $40, $7C, $7D, $81, $82   ; 02 
- D 1 - I - 0x002D67 00:AD57: 40        .byte $40, $40, $40, $40, $7E, $7F, $4C, $5F   ; 03 
- D 1 - I - 0x002D6F 00:AD5F: 90        .byte $90, $91, $40, $40, $63, $64, $64, $64   ; 04 
- D 1 - I - 0x002D77 00:AD67: 94        .byte $94, $95, $40, $40, $40, $63, $64, $64   ; 05 
- D 1 - I - 0x002D7F 00:AD6F: 40        .byte $40, $40, $40, $40, $40, $40, $63, $64   ; 06 
- D 1 - I - 0x002D87 00:AD77: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 07 



_off018_01_AD7F_08:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002D8F 00:AD7F: 5C        .byte $5C, $54, $55, $40, $40, $56, $57, $51   ; 00 
- D 1 - I - 0x002D97 00:AD87: 5D        .byte $5D, $58, $59, $40, $40, $5A, $5B, $52   ; 01 
- D 1 - I - 0x002D9F 00:AD8F: 4C        .byte $4C, $4D, $4E, $4F, $40, $5E, $5F, $4C   ; 02 
- D 1 - I - 0x002DA7 00:AD97: 64        .byte $64, $64, $64, $64, $4F, $63, $64, $64   ; 03 
- D 1 - I - 0x002DAF 00:AD9F: 64        .byte $64, $64, $64, $64, $64, $4F, $63, $64   ; 04 
- D 1 - I - 0x002DB7 00:ADA7: 40        .byte $40, $40, $40, $40, $70, $71, $71, $71   ; 05 
- D 1 - I - 0x002DBF 00:ADAF: 40        .byte $40, $40, $40, $40, $6E, $6F, $6F, $6F   ; 06 
- D 1 - I - 0x002DC7 00:ADB7: 40        .byte $40, $40, $40, $40, $70, $71, $71, $71   ; 07 



_off018_01_ADBF_09:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002DCF 00:ADBF: A4        .byte $A4, $A4, $72, $C7, $C7, $73, $A4, $A4   ; 00 
- D 1 - I - 0x002DD7 00:ADC7: A4        .byte $A4, $A4, $A4, $72, $73, $A4, $A4, $A4   ; 01 
- D 1 - I - 0x002DDF 00:ADCF: A4        .byte $A4, $A4, $A4, $72, $73, $A4, $A4, $A4   ; 02 
- D 1 - I - 0x002DE7 00:ADD7: A4        .byte $A4, $A4, $A4, $72, $73, $A4, $A4, $A4   ; 03 
- D 1 - I - 0x002DEF 00:ADDF: A4        .byte $A4, $A4, $A4, $72, $73, $A4, $A4, $A4   ; 04 
- D 1 - I - 0x002DF7 00:ADE7: 40        .byte $40, $40, $40, $40, $40, $40, $40, $40   ; 05 
- D 1 - I - 0x002DFF 00:ADEF: 61        .byte $61, $60, $40, $40, $40, $40, $62, $61   ; 06 
- D 1 - I - 0x002E07 00:ADF7: 6F        .byte $6F, $50, $40, $40, $40, $40, $53, $6F   ; 07 



_off018_01_ADFF_0A:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002E0F 00:ADFF: 90        .byte $90, $91, $40, $40, $40, $40, $90, $91   ; 00 
- D 1 - I - 0x002E17 00:AE07: 94        .byte $94, $95, $40, $84, $85, $40, $94, $95   ; 01 
- D 1 - I - 0x002E1F 00:AE0F: 76        .byte $76, $76, $76, $74, $75, $83, $77, $77   ; 02 
- D 1 - I - 0x002E27 00:AE17: 7A        .byte $7A, $7A, $7A, $74, $75, $AB, $7B, $7B   ; 03 
- D 1 - I - 0x002E2F 00:AE1F: A4        .byte $A4, $A4, $A4, $74, $75, $A4, $A4, $A4   ; 04 
- D 1 - I - 0x002E37 00:AE27: A4        .byte $A4, $A4, $9C, $9D, $9E, $9F, $A4, $A4   ; 05 
- D 1 - I - 0x002E3F 00:AE2F: A4        .byte $A4, $A4, $99, $9B, $9B, $9A, $A4, $A4   ; 06 
- D 1 - I - 0x002E47 00:AE37: A4        .byte $A4, $A4, $99, $9B, $9B, $75, $A4, $A4   ; 07 



_off018_01_AE3F_0B:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002E4F 00:AE3F: 86        .byte $86, $87, $88, $89, $AC, $AD, $AE, $86   ; 00 
- D 1 - I - 0x002E57 00:AE47: 8A        .byte $8A, $8B, $8C, $8D, $AF, $B0, $B1, $B2   ; 01 
- D 1 - I - 0x002E5F 00:AE4F: 8E        .byte $8E, $8F, $A0, $C1, $C2, $B3, $B4, $B5   ; 02 
- D 1 - I - 0x002E67 00:AE57: 8E        .byte $8E, $A1, $A2, $64, $64, $B6, $B7, $AE   ; 03 
- D 1 - I - 0x002E6F 00:AE5F: A3        .byte $A3, $A1, $A2, $64, $40, $B8, $B9, $BA   ; 04 
- D 1 - I - 0x002E77 00:AE67: A5        .byte $A5, $A6, $A2, $64, $40, $B8, $BB, $BC   ; 05 
- D 1 - I - 0x002E7F 00:AE6F: A7        .byte $A7, $A7, $A8, $64, $40, $BD, $BE, $BF   ; 06 
- D 1 - I - 0x002E87 00:AE77: A9        .byte $A9, $A9, $AA, $64, $40, $C0, $A9, $A9   ; 07 



_off018_01_AE7F_0C:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002E8F 00:AE7F: D2        .byte $D2, $D2, $D3, $40, $40, $D1, $D2, $D2   ; 00 
- D 1 - I - 0x002E97 00:AE87: D0        .byte $D0, $D0, $F0, $E2, $E3, $F1, $D0, $D0   ; 01 
- D 1 - I - 0x002E9F 00:AE8F: D0        .byte $D0, $D0, $E4, $E5, $E6, $E7, $D0, $D0   ; 02 
- D 1 - I - 0x002EA7 00:AE97: D0        .byte $D0, $D0, $E8, $E9, $EA, $EB, $D0, $D0   ; 03 
- D 1 - I - 0x002EAF 00:AE9F: D0        .byte $D0, $D0, $EC, $ED, $EE, $EF, $D0, $D0   ; 04 
- D 1 - I - 0x002EB7 00:AEA7: D0        .byte $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0   ; 05 
- D 1 - I - 0x002EBF 00:AEAF: CA        .byte $CA, $C8, $D5, $CE, $CE, $CE, $C9, $CA   ; 06 
- D 1 - I - 0x002EC7 00:AEB7: 86        .byte $86, $CC, $CB, $64, $64, $CF, $CD, $86   ; 07 



_off018_01_AEBF_0D:
;                                              00   01   02   03   04   05   06   07
- - - - - - 0x002ECF 00:AEBF: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
- - - - - - 0x002ED7 00:AEC7: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 01 
- - - - - - 0x002EDF 00:AECF: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00   ; 02 
- - - - - - 0x002EE7 00:AED7: 86        .byte $86, $86, $86, $86, $86, $86, $86, $86   ; 03 
- D 1 - I - 0x002EEF 00:AEDF: 86        .byte $86, $86, $86, $86, $86, $86, $86, $86   ; 04 
- D 1 - I - 0x002EF7 00:AEE7: 86        .byte $86, $D8, $D9, $D6, $D6, $DA, $DB, $86   ; 05 
- D 1 - I - 0x002EFF 00:AEEF: D7        .byte $D7, $DC, $DD, $00, $00, $DE, $DF, $D7   ; 06 
- D 1 - I - 0x002F07 00:AEF7: D2        .byte $D2, $D2, $E0, $64, $64, $E1, $D2, $D2   ; 07 



_off018_01_AEFF_0E:
;                                              00   01   02   03   04   05   06   07
- D 1 - I - 0x002F0F 00:AEFF: D0        .byte $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0   ; 00 
- D 1 - I - 0x002F17 00:AF07: D0        .byte $D0, $D0, $F0, $E2, $E3, $F1, $D0, $D0   ; 01 
- D 1 - I - 0x002F1F 00:AF0F: D0        .byte $D0, $D0, $E4, $E5, $E6, $E7, $D0, $D0   ; 02 
- D 1 - I - 0x002F27 00:AF17: D0        .byte $D0, $D0, $E8, $E9, $EA, $EB, $D0, $D0   ; 03 
- D 1 - I - 0x002F2F 00:AF1F: D0        .byte $D0, $D0, $EC, $ED, $EE, $EF, $D0, $D0   ; 04 
- D 1 - I - 0x002F37 00:AF27: D0        .byte $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0   ; 05 
- D 1 - I - 0x002F3F 00:AF2F: D0        .byte $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0   ; 06 
- D 1 - I - 0x002F47 00:AF37: D0        .byte $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0   ; 07 



_off006_0x002F4F_01_area_2:
; 00 
- D 1 - I - 0x002F4F 00:AF3F: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x002F53 00:AF43: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x002F57 00:AF47: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x002F5B 00:AF4B: 00        .byte $00, $00, $00, $00   ; 
; 01 
- D 1 - I - 0x002F5F 00:AF4F: 05        .byte $05, $06, $06, $5D   ; 
- D 1 - I - 0x002F63 00:AF53: 07        .byte $07, $08, $5E, $5F   ; 
- D 1 - I - 0x002F67 00:AF57: 07        .byte $07, $5E, $08, $5F   ; 
- D 1 - I - 0x002F6B 00:AF5B: 60        .byte $60, $65, $65, $55   ; 
; 02 
- D 1 - I - 0x002F6F 00:AF5F: 05        .byte $05, $66, $14, $5D   ; 
- D 1 - I - 0x002F73 00:AF63: 67        .byte $67, $68, $69, $6A   ; 
- D 1 - I - 0x002F77 00:AF67: 15        .byte $15, $6B, $16, $6C   ; 
- D 1 - I - 0x002F7B 00:AF6B: 60        .byte $60, $6D, $6E, $55   ; 
; 03 
- D 1 - I - 0x002F7F 00:AF6F: 0F        .byte $0F, $18, $00, $00   ; 
- D 1 - I - 0x002F83 00:AF73: 10        .byte $10, $00, $00, $00   ; 
- D 1 - I - 0x002F87 00:AF77: 10        .byte $10, $00, $00, $00   ; 
- D 1 - I - 0x002F8B 00:AF7B: 71        .byte $71, $00, $00, $00   ; 
; 04 
- D 1 - I - 0x002F8F 00:AF7F: 79        .byte $79, $82, $3F, $00   ; 
- D 1 - I - 0x002F93 00:AF83: 83        .byte $83, $83, $37, $82   ; 
- D 1 - I - 0x002F97 00:AF87: 40        .byte $40, $40, $49, $37   ; 
- D 1 - I - 0x002F9B 00:AF8B: 40        .byte $40, $40, $40, $49   ; 
; 05 
- D 1 - I - 0x002F9F 00:AF8F: 0F        .byte $0F, $12, $12, $5D   ; 
- D 1 - I - 0x002FA3 00:AF93: 00        .byte $00, $11, $5E, $5F   ; 
- D 1 - I - 0x002FA7 00:AF97: 00        .byte $00, $00, $11, $5F   ; 
- D 1 - I - 0x002FAB 00:AF9B: 82        .byte $82, $00, $00, $55   ; 
; 06 
- D 1 - I - 0x002FAF 00:AF9F: 17        .byte $17, $18, $18, $00   ; 
- D 1 - I - 0x002FB3 00:AFA3: 07        .byte $07, $19, $00, $00   ; 
- D 1 - I - 0x002FB7 00:AFA7: 07        .byte $07, $5E, $19, $00   ; 
- D 1 - I - 0x002FBB 00:AFAB: 60        .byte $60, $65, $65, $6F   ; 
; 07 
- D 1 - I - 0x002FBF 00:AFAF: 0F        .byte $0F, $18, $18, $00   ; 
- D 1 - I - 0x002FC3 00:AFB3: 10        .byte $10, $00, $00, $00   ; 
- D 1 - I - 0x002FC7 00:AFB7: 10        .byte $10, $00, $00, $00   ; 
- D 1 - I - 0x002FCB 00:AFBB: 71        .byte $71, $00, $00, $00   ; 
; 08 
- D 1 - I - 0x002FCF 00:AFBF: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x002FD3 00:AFC3: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x002FD7 00:AFC7: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x002FDB 00:AFCB: 40        .byte $40, $40, $40, $40   ; 
; 09 
- D 1 - I - 0x002FDF 00:AFCF: 49        .byte $49, $00, $00, $55   ; 
- D 1 - I - 0x002FE3 00:AFD3: 4A        .byte $4A, $82, $00, $00   ; 
- D 1 - I - 0x002FE7 00:AFD7: 4A        .byte $4A, $37, $00, $00   ; 
- D 1 - I - 0x002FEB 00:AFDB: 40        .byte $40, $37, $82, $00   ; 
; 0A 
- D 1 - I - 0x002FEF 00:AFDF: 0F        .byte $0F, $06, $06, $5D   ; 
- D 1 - I - 0x002FF3 00:AFE3: 11        .byte $11, $08, $5E, $5F   ; 
- D 1 - I - 0x002FF7 00:AFE7: 00        .byte $00, $5E, $08, $5F   ; 
- D 1 - I - 0x002FFB 00:AFEB: 00        .byte $00, $11, $65, $55   ; 
; 0B 
- D 1 - I - 0x002FFF 00:AFEF: 50        .byte $50, $50, $50, $50   ; 
- D 1 - I - 0x003003 00:AFF3: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003007 00:AFF7: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x00300B 00:AFFB: E4        .byte $E4, $40, $40, $40   ; 
; 0C 
- D 1 - I - 0x00300F 00:AFFF: 05        .byte $05, $06, $06, $5D   ; 
- D 1 - I - 0x003013 00:B003: 07        .byte $07, $08, $5E, $5F   ; 
- D 1 - I - 0x003017 00:B007: 07        .byte $07, $5E, $08, $5F   ; 
- D 1 - I - 0x00301B 00:B00B: 55        .byte $55, $55, $65, $55   ; 
; 0D 
- D 1 - I - 0x00301F 00:B00F: 40        .byte $40, $49, $79, $00   ; 
- D 1 - I - 0x003023 00:B013: 40        .byte $40, $40, $37, $00   ; 
- - - - - - 0x003027 00:B017: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00302B 00:B01B: 00        .byte $00, $00, $00, $00   ; 
; 0E 
- D 1 - I - 0x00302F 00:B01F: 00        .byte $00, $00, $06, $5D   ; 
- D 1 - I - 0x003033 00:B023: 00        .byte $00, $00, $5E, $5F   ; 
- - - - - - 0x003037 00:B027: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00303B 00:B02B: 00        .byte $00, $00, $00, $00   ; 
; 0F 
- D 1 - I - 0x00303F 00:B02F: 4F        .byte $4F, $E4, $40, $40   ; 
- D 1 - I - 0x003043 00:B033: 4D        .byte $4D, $4F, $40, $40   ; 
- D 1 - I - 0x003047 00:B037: 35        .byte $35, $4E, $4C, $4C   ; 
- D 1 - I - 0x00304B 00:B03B: 00        .byte $00, $00, $35, $4E   ; 
; 10 
- D 1 - I - 0x00304F 00:B03F: 4D        .byte $4D, $E5, $33, $E5   ; 
- D 1 - I - 0x003053 00:B043: 36        .byte $36, $40, $40, $40   ; 
- D 1 - I - 0x003057 00:B047: 36        .byte $36, $40, $40, $40   ; 
- D 1 - I - 0x00305B 00:B04B: 34        .byte $34, $4C, $40, $40   ; 
; 11 
- D 1 - I - 0x00305F 00:B04F: 33        .byte $33, $E5, $33, $E5   ; 
- D 1 - I - 0x003063 00:B053: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003067 00:B057: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x00306B 00:B05B: 4C        .byte $4C, $E4, $40, $40   ; 
; 12 
- D 1 - I - 0x00306F 00:B05F: 33        .byte $33, $E5, $33, $E5   ; 
- D 1 - I - 0x003073 00:B063: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003077 00:B067: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x00307B 00:B06B: 4C        .byte $4C, $40, $40, $40   ; 
; 13 
- D 1 - I - 0x00307F 00:B06F: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003083 00:B073: EB        .byte $EB, $EB, $EB, $EB   ; 
- D 1 - I - 0x003087 00:B077: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00308B 00:B07B: 00        .byte $00, $00, $00, $00   ; 
; 14 
- D 1 - I - 0x00308F 00:B07F: 34        .byte $34, $E7, $37, $E7   ; 
- D 1 - I - 0x003093 00:B083: E8        .byte $E8, $35, $E6, $E6   ; 
- D 1 - I - 0x003097 00:B087: 3A        .byte $3A, $38, $39, $39   ; 
- D 1 - I - 0x00309B 00:B08B: 3A        .byte $3A, $41, $41, $41   ; 
; 15 
- D 1 - I - 0x00309F 00:B08F: 37        .byte $37, $E7, $37, $E7   ; 
- D 1 - I - 0x0030A3 00:B093: 35        .byte $35, $35, $E6, $35   ; 
- D 1 - I - 0x0030A7 00:B097: 38        .byte $38, $39, $39, $38   ; 
- D 1 - I - 0x0030AB 00:B09B: 41        .byte $41, $41, $41, $41   ; 
; 16 
- D 1 - I - 0x0030AF 00:B09F: 37        .byte $37, $7B, $50, $50   ; 
- D 1 - I - 0x0030B3 00:B0A3: 4E        .byte $4E, $4E, $40, $40   ; 
- D 1 - I - 0x0030B7 00:B0A7: 3F        .byte $3F, $7A, $40, $40   ; 
- D 1 - I - 0x0030BB 00:B0AB: 7E        .byte $7E, $35, $4F, $E4   ; 
; 17 
- D 1 - I - 0x0030BF 00:B0AF: 41        .byte $41, $41, $47, $EF   ; 
- D 1 - I - 0x0030C3 00:B0B3: EB        .byte $EB, $EB, $EB, $D6   ; 
- D 1 - I - 0x0030C7 00:B0B7: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x0030CB 00:B0BB: 00        .byte $00, $00, $00, $00   ; 
; 18 
- D 1 - I - 0x0030CF 00:B0BF: 3A        .byte $3A, $41, $41, $41   ; 
- D 1 - I - 0x0030D3 00:B0C3: 3B        .byte $3B, $41, $41, $41   ; 
- D 1 - I - 0x0030D7 00:B0C7: 3B        .byte $3B, $41, $41, $41   ; 
- D 1 - I - 0x0030DB 00:B0CB: 3B        .byte $3B, $41, $41, $41   ; 
; 19 
- D 1 - I - 0x0030DF 00:B0CF: 41        .byte $41, $41, $41, $3D   ; 
- D 1 - I - 0x0030E3 00:B0D3: 41        .byte $41, $41, $41, $E9   ; 
- D 1 - I - 0x0030E7 00:B0D7: 41        .byte $41, $41, $3D, $3E   ; 
- D 1 - I - 0x0030EB 00:B0DB: 41        .byte $41, $41, $E9, $41   ; 
; 1A 
- D 1 - I - 0x0030EF 00:B0DF: 30        .byte $30, $00, $4E, $32   ; 
- D 1 - I - 0x0030F3 00:B0E3: 81        .byte $81, $00, $7A, $4C   ; 
- D 1 - I - 0x0030F7 00:B0E7: 31        .byte $31, $00, $35, $4D   ; 
- D 1 - I - 0x0030FB 00:B0EB: 41        .byte $41, $7F, $00, $4F   ; 
; 1B 
- D 1 - I - 0x0030FF 00:B0EF: 41        .byte $41, $41, $48, $90   ; 
- D 1 - I - 0x003103 00:B0F3: EB        .byte $EB, $EB, $EB, $91   ; 
- D 1 - I - 0x003107 00:B0F7: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00310B 00:B0FB: 00        .byte $00, $00, $00, $00   ; 
; 1C 
- D 1 - I - 0x00310F 00:B0FF: 3C        .byte $3C, $41, $41, $41   ; 
- D 1 - I - 0x003113 00:B103: 3C        .byte $3C, $41, $41, $41   ; 
- D 1 - I - 0x003117 00:B107: 3C        .byte $3C, $41, $41, $41   ; 
- D 1 - I - 0x00311B 00:B10B: EA        .byte $EA, $EB, $EB, $EB   ; 
; 1D 
- D 1 - I - 0x00311F 00:B10F: 41        .byte $41, $3D, $3E, $41   ; 
- D 1 - I - 0x003123 00:B113: 41        .byte $41, $E9, $41, $41   ; 
- D 1 - I - 0x003127 00:B117: 3D        .byte $3D, $3E, $41, $41   ; 
- D 1 - I - 0x00312B 00:B11B: EC        .byte $EC, $EB, $EB, $EB   ; 
; 1E 
- D 1 - I - 0x00312F 00:B11F: 41        .byte $41, $80, $3F, $4E   ; 
- D 1 - I - 0x003133 00:B123: 41        .byte $41, $81, $00, $35   ; 
- D 1 - I - 0x003137 00:B127: 41        .byte $41, $31, $3F, $00   ; 
- D 1 - I - 0x00313B 00:B12B: EB        .byte $EB, $EB, $7D, $00   ; 
; 1F 
- D 1 - I - 0x00313F 00:B12F: 05        .byte $05, $06, $06, $5D   ; 
- D 1 - I - 0x003143 00:B133: 07        .byte $07, $08, $5E, $55   ; 
- D 1 - I - 0x003147 00:B137: 07        .byte $07, $5E, $08, $55   ; 
- D 1 - I - 0x00314B 00:B13B: 60        .byte $60, $65, $65, $55   ; 
; 20 
- D 1 - I - 0x00314F 00:B13F: 40        .byte $40, $40, $4A, $37   ; 
- D 1 - I - 0x003153 00:B143: 40        .byte $40, $40, $40, $37   ; 
- D 1 - I - 0x003157 00:B147: 42        .byte $42, $43, $42, $43   ; 
- D 1 - I - 0x00315B 00:B14B: 40        .byte $40, $40, $40, $40   ; 
; 21 
- D 1 - I - 0x00315F 00:B14F: 00        .byte $00, $00, $08, $5F   ; 
- D 1 - I - 0x003163 00:B153: 82        .byte $82, $00, $11, $55   ; 
- D 1 - I - 0x003167 00:B157: 42        .byte $42, $ED, $4B, $43   ; 
- D 1 - I - 0x00316B 00:B15B: 40        .byte $40, $EE, $84, $40   ; 
; 22 
- D 1 - I - 0x00316F 00:B15F: 07        .byte $07, $5E, $08, $5F   ; 
- D 1 - I - 0x003173 00:B163: 65        .byte $65, $65, $65, $55   ; 
- D 1 - I - 0x003177 00:B167: 43        .byte $43, $42, $43, $42   ; 
- D 1 - I - 0x00317B 00:B16B: 40        .byte $40, $40, $40, $40   ; 
; 23 
- D 1 - I - 0x00317F 00:B16F: 07        .byte $07, $5E, $08, $5F   ; 
- D 1 - I - 0x003183 00:B173: 60        .byte $60, $65, $65, $55   ; 
- D 1 - I - 0x003187 00:B177: 05        .byte $05, $66, $14, $5D   ; 
- D 1 - I - 0x00318B 00:B17B: 67        .byte $67, $68, $69, $6A   ; 
; 24 
- D 1 - I - 0x00318F 00:B17F: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003193 00:B183: 40        .byte $40, $40, $4C, $E4   ; 
- D 1 - I - 0x003197 00:B187: 44        .byte $44, $45, $44, $44   ; 
- D 1 - I - 0x00319B 00:B18B: 41        .byte $41, $41, $41, $41   ; 
; 25 
- D 1 - I - 0x00319F 00:B18F: 40        .byte $40, $EE, $5C, $85   ; 
- D 1 - I - 0x0031A3 00:B193: 40        .byte $40, $EE, $D9, $84   ; 
- D 1 - I - 0x0031A7 00:B197: 44        .byte $44, $D7, $46, $5C   ; 
- D 1 - I - 0x0031AB 00:B19B: 41        .byte $41, $41, $D8, $D9   ; 
; 26 
- D 1 - I - 0x0031AF 00:B19F: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x0031B3 00:B1A3: 4C        .byte $4C, $40, $40, $40   ; 
- D 1 - I - 0x0031B7 00:B1A7: 51        .byte $51, $45, $45, $44   ; 
- D 1 - I - 0x0031BB 00:B1AB: 8A        .byte $8A, $52, $41, $41   ; 
; 27 
- D 1 - I - 0x0031BF 00:B1AF: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x0031C3 00:B1B3: 40        .byte $40, $40, $40, $4C   ; 
- D 1 - I - 0x0031C7 00:B1B7: 44        .byte $44, $45, $44, $8B   ; 
- D 1 - I - 0x0031CB 00:B1BB: 41        .byte $41, $41, $41, $8C   ; 
; 28 
- D 1 - I - 0x0031CF 00:B1BF: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x0031D3 00:B1C3: EF        .byte $EF, $41, $41, $41   ; 
- D 1 - I - 0x0031D7 00:B1C7: 47        .byte $47, $EF, $41, $41   ; 
- D 1 - I - 0x0031DB 00:B1CB: 41        .byte $41, $47, $EF, $41   ; 
; 29 
- D 1 - I - 0x0031DF 00:B1CF: 41        .byte $41, $41, $48, $46   ; 
- D 1 - I - 0x0031E3 00:B1D3: 41        .byte $41, $41, $41, $D8   ; 
- D 1 - I - 0x0031E7 00:B1D7: 41        .byte $41, $41, $41, $48   ; 
- D 1 - I - 0x0031EB 00:B1DB: 41        .byte $41, $41, $41, $41   ; 
; 2A 
- D 1 - I - 0x0031EF 00:B1DF: 53        .byte $53, $54, $52, $41   ; 
- D 1 - I - 0x0031F3 00:B1E3: D9        .byte $D9, $8A, $00, $52   ; 
- D 1 - I - 0x0031F7 00:B1E7: 46        .byte $46, $53, $54, $00   ; 
- D 1 - I - 0x0031FB 00:B1EB: D8        .byte $D8, $D9, $8A, $00   ; 
; 2B 
- D 1 - I - 0x0031FF 00:B1EF: 41        .byte $41, $41, $41, $8C   ; 
- D 1 - I - 0x003203 00:B1F3: 41        .byte $41, $41, $41, $8C   ; 
- D 1 - I - 0x003207 00:B1F7: 52        .byte $52, $41, $41, $8C   ; 
- D 1 - I - 0x00320B 00:B1FB: 00        .byte $00, $52, $41, $8C   ; 
; 2C 
- D 1 - I - 0x00320F 00:B1FF: 41        .byte $41, $41, $47, $EF   ; 
- D 1 - I - 0x003213 00:B203: 41        .byte $41, $41, $41, $47   ; 
- D 1 - I - 0x003217 00:B207: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x00321B 00:B20B: 41        .byte $41, $41, $41, $41   ; 
; 2D 
- - - - - - 0x00321F 00:B20F: 41        .byte $41, $41, $41, $41   ; 
- - - - - - 0x003223 00:B213: EF        .byte $EF, $41, $41, $41   ; 
- - - - - - 0x003227 00:B217: 47        .byte $47, $EF, $41, $41   ; 
- - - - - - 0x00322B 00:B21B: 41        .byte $41, $47, $EF, $41   ; 
; 2E 
- D 1 - I - 0x00322F 00:B21F: 48        .byte $48, $46, $53, $54   ; 
- D 1 - I - 0x003233 00:B223: 41        .byte $41, $D8, $D9, $8A   ; 
- D 1 - I - 0x003237 00:B227: 41        .byte $41, $48, $46, $8E   ; 
- D 1 - I - 0x00323B 00:B22B: 41        .byte $41, $41, $D8, $8F   ; 
; 2F 
- D 1 - I - 0x00323F 00:B22F: 3F        .byte $3F, $00, $52, $8C   ; 
- D 1 - I - 0x003243 00:B233: 00        .byte $00, $00, $00, $8D   ; 
- D 1 - I - 0x003247 00:B237: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x00324B 00:B23B: 00        .byte $00, $00, $00, $00   ; 
; 30 
- D 1 - I - 0x00324F 00:B23F: 07        .byte $07, $5E, $08, $5F   ; 
- D 1 - I - 0x003253 00:B243: 60        .byte $60, $65, $65, $55   ; 
- D 1 - I - 0x003257 00:B247: 05        .byte $05, $06, $06, $5D   ; 
- D 1 - I - 0x00325B 00:B24B: 07        .byte $07, $08, $5E, $5F   ; 
; 31 
- D 1 - I - 0x00325F 00:B24F: 3F        .byte $3F, $00, $11, $5D   ; 
- D 1 - I - 0x003263 00:B253: 37        .byte $37, $82, $00, $11   ; 
- D 1 - I - 0x003267 00:B257: 40        .byte $40, $49, $79, $00   ; 
- D 1 - I - 0x00326B 00:B25B: 40        .byte $40, $40, $49, $82   ; 
; 32 
- D 1 - I - 0x00326F 00:B25F: 07        .byte $07, $5E, $08, $5F   ; 
- D 1 - I - 0x003273 00:B263: 55        .byte $55, $65, $65, $55   ; 
- D 1 - I - 0x003277 00:B267: 11        .byte $11, $12, $06, $5D   ; 
- D 1 - I - 0x00327B 00:B26B: 00        .byte $00, $11, $5E, $55   ; 
; 33 
- D 1 - I - 0x00327F 00:B26F: 15        .byte $15, $6B, $16, $6C   ; 
- D 1 - I - 0x003283 00:B273: 60        .byte $60, $6D, $6E, $55   ; 
- D 1 - I - 0x003287 00:B277: 05        .byte $05, $06, $06, $5D   ; 
- D 1 - I - 0x00328B 00:B27B: 07        .byte $07, $08, $5E, $5F   ; 
; 34 
- D 1 - I - 0x00328F 00:B27F: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003293 00:B283: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003297 00:B287: 44        .byte $44, $45, $45, $45   ; 
- D 1 - I - 0x00329B 00:B28B: 41        .byte $41, $41, $41, $41   ; 
; 35 
- D 1 - I - 0x00329F 00:B28F: 40        .byte $40, $40, $40, $88   ; 
- D 1 - I - 0x0032A3 00:B293: 40        .byte $40, $40, $86, $89   ; 
- D 1 - I - 0x0032A7 00:B297: 44        .byte $44, $45, $57, $72   ; 
- D 1 - I - 0x0032AB 00:B29B: 41        .byte $41, $41, $73, $75   ; 
; 36 
- D 1 - I - 0x0032AF 00:B29F: 07        .byte $07, $5E, $08, $5F   ; 
- D 1 - I - 0x0032B3 00:B2A3: 65        .byte $65, $65, $65, $55   ; 
- D 1 - I - 0x0032B7 00:B2A7: 43        .byte $43, $42, $42, $87   ; 
- D 1 - I - 0x0032BB 00:B2AB: 40        .byte $40, $40, $40, $88   ; 
; 37 
- D 1 - I - 0x0032BF 00:B2AF: 07        .byte $07, $5E, $08, $5F   ; 
- D 1 - I - 0x0032C3 00:B2B3: 60        .byte $60, $65, $65, $55   ; 
- D 1 - I - 0x0032C7 00:B2B7: 0F        .byte $0F, $12, $06, $5D   ; 
- D 1 - I - 0x0032CB 00:B2BB: 00        .byte $00, $11, $5E, $5F   ; 
; 38 
- D 1 - I - 0x0032CF 00:B2BF: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x0032D3 00:B2C3: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x0032D7 00:B2C7: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x0032DB 00:B2CB: 41        .byte $41, $41, $41, $41   ; 
; 39 
- D 1 - I - 0x0032DF 00:B2CF: 57        .byte $57, $57, $56, $5F   ; 
- D 1 - I - 0x0032E3 00:B2D3: 57        .byte $57, $73, $74, $55   ; 
- D 1 - I - 0x0032E7 00:B2D7: 57        .byte $57, $56, $12, $5D   ; 
- D 1 - I - 0x0032EB 00:B2DB: 73        .byte $73, $75, $5E, $5F   ; 
; 3A 
- D 1 - I - 0x0032EF 00:B2DF: 10        .byte $10, $00, $00, $00   ; 
- D 1 - I - 0x0032F3 00:B2E3: 71        .byte $71, $00, $00, $00   ; 
- D 1 - I - 0x0032F7 00:B2E7: 0F        .byte $0F, $18, $18, $00   ; 
- D 1 - I - 0x0032FB 00:B2EB: 00        .byte $00, $00, $00, $00   ; 
; 3B 
- D 1 - I - 0x0032FF 00:B2EF: 00        .byte $00, $00, $11, $5F   ; 
- D 1 - I - 0x003303 00:B2F3: 00        .byte $00, $00, $00, $11   ; 
- D 1 - I - 0x003307 00:B2F7: 0F        .byte $0F, $18, $18, $00   ; 
- D 1 - I - 0x00330B 00:B2FB: 10        .byte $10, $00, $00, $00   ; 
; 3C 
- D 1 - I - 0x00330F 00:B2FF: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003313 00:B303: EB        .byte $EB, $EB, $EB, $EB   ; 
- D 1 - I - 0x003317 00:B307: 0F        .byte $0F, $18, $18, $00   ; 
- D 1 - I - 0x00331B 00:B30B: 10        .byte $10, $00, $00, $00   ; 
; 3D 
- D 1 - I - 0x00331F 00:B30F: 7C        .byte $7C, $00, $11, $5F   ; 
- D 1 - I - 0x003323 00:B313: 76        .byte $76, $00, $00, $77   ; 
- D 1 - I - 0x003327 00:B317: 0F        .byte $0F, $18, $18, $00   ; 
- D 1 - I - 0x00332B 00:B31B: 10        .byte $10, $00, $00, $00   ; 
; 3E 
- D 1 - I - 0x00332F 00:B31F: 08        .byte $08, $5E, $08, $5F   ; 
- D 1 - I - 0x003333 00:B323: 65        .byte $65, $65, $65, $55   ; 
- D 1 - I - 0x003337 00:B327: 08        .byte $08, $06, $06, $5D   ; 
- D 1 - I - 0x00333B 00:B32B: 08        .byte $08, $08, $5E, $5F   ; 
; 3F 
- D 1 - I - 0x00333F 00:B32F: 13        .byte $13, $13, $13, $13   ; 
- D 1 - I - 0x003343 00:B333: 78        .byte $78, $78, $78, $78   ; 
- D 1 - I - 0x003347 00:B337: 07        .byte $07, $5E, $08, $5F   ; 
- D 1 - I - 0x00334B 00:B33B: 60        .byte $60, $65, $65, $55   ; 
; 40 
- D 1 - I - 0x00334F 00:B33F: 01        .byte $01, $02, $02, $61   ; 
- D 1 - I - 0x003353 00:B343: 62        .byte $62, $63, $63, $64   ; 
- D 1 - I - 0x003357 00:B347: 01        .byte $01, $02, $02, $61   ; 
- D 1 - I - 0x00335B 00:B34B: 62        .byte $62, $63, $63, $64   ; 
; 41 
- D 1 - I - 0x00335F 00:B34F: 01        .byte $01, $02, $2A, $E3   ; 
- D 1 - I - 0x003363 00:B353: 62        .byte $62, $63, $A7, $A8   ; 
- D 1 - I - 0x003367 00:B357: 01        .byte $01, $02, $1B, $1C   ; 
- D 1 - I - 0x00336B 00:B35B: 62        .byte $62, $63, $AE, $AF   ; 
; 42 
- D 1 - I - 0x00336F 00:B35F: 2B        .byte $2B, $2A, $1A, $BE   ; 
- D 1 - I - 0x003373 00:B363: A8        .byte $A8, $A9, $BF, $C0   ; 
- D 1 - I - 0x003377 00:B367: 1C        .byte $1C, $AC, $23, $C3   ; 
- D 1 - I - 0x00337B 00:B36B: AF        .byte $AF, $C5, $C6, $C7   ; 
; 43 
- D 1 - I - 0x00337F 00:B36F: 22        .byte $22, $A6, $2A, $E3   ; 
- D 1 - I - 0x003383 00:B373: C1        .byte $C1, $C2, $AA, $A8   ; 
- D 1 - I - 0x003387 00:B377: 24        .byte $24, $C4, $1D, $1C   ; 
- D 1 - I - 0x00338B 00:B37B: C8        .byte $C8, $C9, $CA, $AF   ; 
; 44 
- D 1 - I - 0x00338F 00:B37F: 2B        .byte $2B, $2A, $02, $61   ; 
- D 1 - I - 0x003393 00:B383: A8        .byte $A8, $AB, $63, $64   ; 
- D 1 - I - 0x003397 00:B387: 1C        .byte $1C, $AD, $03, $61   ; 
- D 1 - I - 0x00339B 00:B38B: AF        .byte $AF, $B0, $00, $64   ; 
; 45 
- D 1 - I - 0x00339F 00:B38F: 01        .byte $01, $02, $1E, $1F   ; 
- D 1 - I - 0x0033A3 00:B393: 62        .byte $62, $63, $B2, $B3   ; 
- D 1 - I - 0x0033A7 00:B397: 01        .byte $01, $02, $20, $21   ; 
- D 1 - I - 0x0033AB 00:B39B: 62        .byte $62, $63, $B8, $B9   ; 
; 46 
- D 1 - I - 0x0033AF 00:B39F: 1F        .byte $1F, $CB, $25, $CC   ; 
- D 1 - I - 0x0033B3 00:B3A3: B3        .byte $B3, $B4, $CE, $CF   ; 
- D 1 - I - 0x0033B7 00:B3A7: 21        .byte $21, $21, $28, $D2   ; 
- D 1 - I - 0x0033BB 00:B3AB: BA        .byte $BA, $BB, $BA, $BB   ; 
; 47 
- D 1 - I - 0x0033BF 00:B3AF: 26        .byte $26, $CD, $27, $1F   ; 
- D 1 - I - 0x0033C3 00:B3B3: D0        .byte $D0, $D1, $B5, $B3   ; 
- D 1 - I - 0x0033C7 00:B3B7: 29        .byte $29, $D3, $21, $21   ; 
- D 1 - I - 0x0033CB 00:B3BB: BA        .byte $BA, $BB, $BA, $BB   ; 
; 48 
- D 1 - I - 0x0033CF 00:B3BF: 1F        .byte $1F, $B1, $03, $61   ; 
- D 1 - I - 0x0033D3 00:B3C3: B3        .byte $B3, $B6, $00, $64   ; 
- D 1 - I - 0x0033D7 00:B3C7: 21        .byte $21, $B7, $03, $61   ; 
- D 1 - I - 0x0033DB 00:B3CB: BC        .byte $BC, $BD, $00, $64   ; 
; 49 
- D 1 - I - 0x0033DF 00:B3CF: 01        .byte $01, $02, $09, $00   ; 
- D 1 - I - 0x0033E3 00:B3D3: 62        .byte $62, $63, $63, $64   ; 
- - - - - - 0x0033E7 00:B3D7: 01        .byte $01, $02, $02, $61   ; 
- - - - - - 0x0033EB 00:B3DB: 62        .byte $62, $63, $63, $64   ; 
; 4A 
- D 1 - I - 0x0033EF 00:B3DF: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x0033F3 00:B3E3: 62        .byte $62, $63, $63, $64   ; 
- - - - - - 0x0033F7 00:B3E7: 01        .byte $01, $02, $02, $61   ; 
- - - - - - 0x0033FB 00:B3EB: 62        .byte $62, $63, $63, $64   ; 
; 4B 
- D 1 - I - 0x0033FF 00:B3EF: 00        .byte $00, $03, $03, $61   ; 
- D 1 - I - 0x003403 00:B3F3: 62        .byte $62, $63, $63, $64   ; 
- - - - - - 0x003407 00:B3F7: 01        .byte $01, $02, $02, $61   ; 
- - - - - - 0x00340B 00:B3FB: 62        .byte $62, $63, $63, $64   ; 
; 4C 
- D 1 - I - 0x00340F 00:B3FF: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003413 00:B403: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003417 00:B407: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x00341B 00:B40B: EB        .byte $EB, $EB, $EB, $EB   ; 
; 4D 
- D 1 - I - 0x00341F 00:B40F: 47        .byte $47, $EF, $41, $41   ; 
- D 1 - I - 0x003423 00:B413: 41        .byte $41, $47, $EF, $41   ; 
- D 1 - I - 0x003427 00:B417: 41        .byte $41, $41, $47, $EF   ; 
- D 1 - I - 0x00342B 00:B41B: EB        .byte $EB, $EB, $EB, $D6   ; 
; 4E 
- D 1 - I - 0x00342F 00:B41F: 41        .byte $41, $48, $46, $F2   ; 
- D 1 - I - 0x003433 00:B423: 41        .byte $41, $41, $D8, $F3   ; 
- D 1 - I - 0x003437 00:B427: 41        .byte $41, $41, $48, $F4   ; 
- D 1 - I - 0x00343B 00:B42B: EB        .byte $EB, $EB, $EB, $F5   ; 
; 4F 
- D 1 - I - 0x00343F 00:B42F: 0E        .byte $0E, $02, $02, $61   ; 
- D 1 - I - 0x003443 00:B433: 0C        .byte $0C, $F6, $63, $64   ; 
- D 1 - I - 0x003447 00:B437: 0B        .byte $0B, $03, $04, $61   ; 
- D 1 - I - 0x00344B 00:B43B: 0C        .byte $0C, $00, $00, $E2   ; 
; 50 
- D 1 - I - 0x00344F 00:B43F: 40        .byte $40, $EE, $5C, $59   ; 
- D 1 - I - 0x003453 00:B443: 40        .byte $40, $EE, $D9, $F0   ; 
- - - - - - 0x003457 00:B447: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00345B 00:B44B: 00        .byte $00, $00, $00, $00   ; 
; 51 
- D 1 - I - 0x00345F 00:B44F: 44        .byte $44, $45, $44, $45   ; 
- D 1 - I - 0x003463 00:B453: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003467 00:B457: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x00346B 00:B45B: 41        .byte $41, $41, $41, $E1   ; 
; 52 
- D 1 - I - 0x00346F 00:B45F: 41        .byte $41, $41, $E1, $FD   ; 
- D 1 - I - 0x003473 00:B463: 41        .byte $41, $E1, $FD, $41   ; 
- D 1 - I - 0x003477 00:B467: E1        .byte $E1, $FD, $41, $41   ; 
- D 1 - I - 0x00347B 00:B46B: FD        .byte $FD, $41, $41, $41   ; 
; 53 
- D 1 - I - 0x00347F 00:B46F: 5A        .byte $5A, $DA, $DE, $40   ; 
- D 1 - I - 0x003483 00:B473: F7        .byte $F7, $F9, $DE, $40   ; 
- - - - - - 0x003487 00:B477: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x00348B 00:B47B: 00        .byte $00, $00, $00, $00   ; 
; 54 
- D 1 - I - 0x00348F 00:B47F: 45        .byte $45, $D7, $46, $5C   ; 
- D 1 - I - 0x003493 00:B483: 41        .byte $41, $41, $D8, $D9   ; 
- D 1 - I - 0x003497 00:B487: 41        .byte $41, $41, $48, $46   ; 
- D 1 - I - 0x00349B 00:B48B: 41        .byte $41, $41, $41, $D8   ; 
; 55 
- D 1 - I - 0x00349F 00:B48F: 58        .byte $58, $02, $02, $61   ; 
- D 1 - I - 0x0034A3 00:B493: F1        .byte $F1, $63, $63, $64   ; 
- D 1 - I - 0x0034A7 00:B497: 5C        .byte $5C, $58, $02, $61   ; 
- D 1 - I - 0x0034AB 00:B49B: D9        .byte $D9, $F1, $63, $64   ; 
; 56 
- D 1 - I - 0x0034AF 00:B49F: 01        .byte $01, $02, $D5, $5B   ; 
- D 1 - I - 0x0034B3 00:B4A3: 62        .byte $62, $63, $63, $F8   ; 
- D 1 - I - 0x0034B7 00:B4A7: 01        .byte $01, $02, $5B, $DA   ; 
- D 1 - I - 0x0034BB 00:B4AB: 62        .byte $62, $63, $F8, $F9   ; 
; 57 
- D 1 - I - 0x0034BF 00:B4AF: DA        .byte $DA, $DC, $DF, $45   ; 
- D 1 - I - 0x0034C3 00:B4B3: F9        .byte $F9, $FC, $41, $41   ; 
- D 1 - I - 0x0034C7 00:B4B7: DC        .byte $DC, $E0, $41, $41   ; 
- D 1 - I - 0x0034CB 00:B4BB: FC        .byte $FC, $41, $41, $41   ; 
; 58 
- D 1 - I - 0x0034CF 00:B4BF: 41        .byte $41, $41, $41, $48   ; 
- D 1 - I - 0x0034D3 00:B4C3: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x0034D7 00:B4C7: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x0034DB 00:B4CB: EF        .byte $EF, $41, $41, $41   ; 
; 59 
- D 1 - I - 0x0034DF 00:B4CF: 46        .byte $46, $5C, $58, $61   ; 
- D 1 - I - 0x0034E3 00:B4D3: D8        .byte $D8, $D9, $F1, $64   ; 
- D 1 - I - 0x0034E7 00:B4D7: 48        .byte $48, $46, $5C, $59   ; 
- D 1 - I - 0x0034EB 00:B4DB: 41        .byte $41, $D8, $D9, $F0   ; 
; 5A 
- D 1 - I - 0x0034EF 00:B4DF: 01        .byte $01, $5B, $DA, $DC   ; 
- D 1 - I - 0x0034F3 00:B4E3: 62        .byte $62, $F8, $F9, $FC   ; 
- D 1 - I - 0x0034F7 00:B4E7: 5A        .byte $5A, $DA, $DC, $E0   ; 
- D 1 - I - 0x0034FB 00:B4EB: F7        .byte $F7, $F9, $FC, $41   ; 
; 5B 
- D 1 - I - 0x0034FF 00:B4EF: E0        .byte $E0, $41, $41, $41   ; 
- D 1 - I - 0x003503 00:B4F3: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003507 00:B4F7: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x00350B 00:B4FB: 41        .byte $41, $41, $41, $E1   ; 
; 5C 
- D 1 - I - 0x00350F 00:B4FF: 45        .byte $45, $44, $45, $44   ; 
- D 1 - I - 0x003513 00:B503: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003517 00:B507: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x00351B 00:B50B: EF        .byte $EF, $41, $41, $41   ; 
; 5D 
- D 1 - I - 0x00351F 00:B50F: 47        .byte $47, $EF, $41, $41   ; 
- D 1 - I - 0x003523 00:B513: 41        .byte $41, $47, $EF, $41   ; 
- D 1 - I - 0x003527 00:B517: 41        .byte $41, $41, $47, $EF   ; 
- D 1 - I - 0x00352B 00:B51B: 41        .byte $41, $41, $41, $47   ; 
; 5E 
- D 1 - I - 0x00352F 00:B51F: DB        .byte $DB, $DC, $E0, $41   ; 
- D 1 - I - 0x003533 00:B523: FA        .byte $FA, $FC, $41, $41   ; 
- D 1 - I - 0x003537 00:B527: FB        .byte $FB, $E0, $41, $41   ; 
- D 1 - I - 0x00353B 00:B52B: FE        .byte $FE, $EB, $EB, $EB   ; 
; 5F 
- D 1 - I - 0x00353F 00:B52F: 41        .byte $41, $41, $E1, $FD   ; 
- D 1 - I - 0x003543 00:B533: 41        .byte $41, $E1, $FD, $41   ; 
- D 1 - I - 0x003547 00:B537: E1        .byte $E1, $FD, $41, $41   ; 
- D 1 - I - 0x00354B 00:B53B: FF        .byte $FF, $EB, $EB, $EB   ; 
; 60 
- D 1 - I - 0x00354F 00:B53F: 01        .byte $01, $02, $02, $61   ; 
- D 1 - I - 0x003553 00:B543: 62        .byte $62, $63, $63, $64   ; 
- D 1 - I - 0x003557 00:B547: 43        .byte $43, $ED, $58, $61   ; 
- D 1 - I - 0x00355B 00:B54B: 40        .byte $40, $EE, $F1, $64   ; 
; 61 
- D 1 - I - 0x00355F 00:B54F: 01        .byte $01, $02, $02, $61   ; 
- D 1 - I - 0x003563 00:B553: 62        .byte $62, $63, $63, $64   ; 
- D 1 - I - 0x003567 00:B557: 43        .byte $43, $42, $43, $42   ; 
- D 1 - I - 0x00356B 00:B55B: 40        .byte $40, $40, $40, $40   ; 
; 62 
- D 1 - I - 0x00356F 00:B55F: 01        .byte $01, $02, $02, $61   ; 
- D 1 - I - 0x003573 00:B563: 62        .byte $62, $63, $63, $64   ; 
- D 1 - I - 0x003577 00:B567: D4        .byte $D4, $5B, $DD, $42   ; 
- D 1 - I - 0x00357B 00:B56B: 62        .byte $62, $F8, $DE, $40   ; 
; 63 
- D 1 - I - 0x00357F 00:B56F: 0D        .byte $0D, $03, $03, $03   ; 
- D 1 - I - 0x003583 00:B573: 62        .byte $62, $09, $00, $00   ; 
- D 1 - I - 0x003587 00:B577: 01        .byte $01, $02, $0A, $03   ; 
- D 1 - I - 0x00358B 00:B57B: 62        .byte $62, $63, $63, $09   ; 
; 64 
- D 1 - I - 0x00358F 00:B57F: 0B        .byte $0B, $03, $03, $03   ; 
- D 1 - I - 0x003593 00:B583: 0C        .byte $0C, $00, $00, $00   ; 
- D 1 - I - 0x003597 00:B587: 0B        .byte $0B, $03, $03, $03   ; 
- D 1 - I - 0x00359B 00:B58B: 0C        .byte $0C, $00, $00, $00   ; 
; 65 
- D 1 - I - 0x00359F 00:B58F: 2B        .byte $2B, $2A, $2A, $E3   ; 
- D 1 - I - 0x0035A3 00:B593: A8        .byte $A8, $A8, $A8, $A8   ; 
- D 1 - I - 0x0035A7 00:B597: 1C        .byte $1C, $1C, $9A, $9B   ; 
- D 1 - I - 0x0035AB 00:B59B: AF        .byte $AF, $AF, $9E, $9F   ; 
; 66 
- D 1 - I - 0x0035AF 00:B59F: 2B        .byte $2B, $2A, $2A, $E3   ; 
- D 1 - I - 0x0035B3 00:B5A3: A8        .byte $A8, $A8, $A8, $A8   ; 
- D 1 - I - 0x0035B7 00:B5A7: 9C        .byte $9C, $9D, $1C, $1C   ; 
- D 1 - I - 0x0035BB 00:B5AB: A0        .byte $A0, $A1, $AF, $AF   ; 
; 67 
- D 1 - I - 0x0035BF 00:B5AF: 1F        .byte $1F, $1F, $A2, $A3   ; 
- D 1 - I - 0x0035C3 00:B5B3: B3        .byte $B3, $B3, $B3, $B3   ; 
- D 1 - I - 0x0035C7 00:B5B7: 21        .byte $21, $21, $21, $21   ; 
- D 1 - I - 0x0035CB 00:B5BB: BA        .byte $BA, $BB, $BA, $BB   ; 
; 68 
- D 1 - I - 0x0035CF 00:B5BF: A4        .byte $A4, $A5, $1F, $1F   ; 
- D 1 - I - 0x0035D3 00:B5C3: B3        .byte $B3, $B3, $B3, $B3   ; 
- D 1 - I - 0x0035D7 00:B5C7: 21        .byte $21, $21, $21, $21   ; 
- D 1 - I - 0x0035DB 00:B5CB: BA        .byte $BA, $BB, $BA, $BB   ; 
; 69 
- D 1 - I - 0x0035DF 00:B5CF: 1F        .byte $1F, $CB, $25, $CC   ; 
- D 1 - I - 0x0035E3 00:B5D3: B3        .byte $B3, $B4, $CE, $CF   ; 
- D 1 - I - 0x0035E7 00:B5D7: 21        .byte $21, $21, $2C, $2D   ; 
- D 1 - I - 0x0035EB 00:B5DB: BA        .byte $BA, $BB, $BA, $BB   ; 
; 6A 
- D 1 - I - 0x0035EF 00:B5DF: 26        .byte $26, $CD, $27, $1F   ; 
- D 1 - I - 0x0035F3 00:B5E3: D0        .byte $D0, $D1, $B5, $B3   ; 
- D 1 - I - 0x0035F7 00:B5E7: 2E        .byte $2E, $2F, $21, $21   ; 
- D 1 - I - 0x0035FB 00:B5EB: BA        .byte $BA, $BB, $BA, $BB   ; 
; 6B 
- D 1 - I - 0x0035FF 00:B5EF: 51        .byte $51, $40, $40, $40   ; 
- D 1 - I - 0x003603 00:B5F3: 51        .byte $51, $40, $40, $40   ; 
- D 1 - I - 0x003607 00:B5F7: 36        .byte $36, $40, $40, $40   ; 
- D 1 - I - 0x00360B 00:B5FB: 34        .byte $34, $4C, $40, $40   ; 
; 6C 
- D 1 - I - 0x00360F 00:B5FF: 0B        .byte $0B, $03, $03, $03   ; 
- D 1 - I - 0x003613 00:B603: 0C        .byte $0C, $00, $00, $00   ; 
- D 1 - I - 0x003617 00:B607: 70        .byte $70, $03, $03, $03   ; 
- D 1 - I - 0x00361B 00:B60B: 71        .byte $71, $00, $00, $00   ; 
; 6D 
- D 1 - I - 0x00361F 00:B60F: 70        .byte $70, $03, $03, $03   ; 
- D 1 - I - 0x003623 00:B613: 71        .byte $71, $00, $00, $00   ; 
- D 1 - I - 0x003627 00:B617: 72        .byte $72, $03, $03, $03   ; 
- D 1 - I - 0x00362B 00:B61B: 00        .byte $00, $00, $00, $00   ; 
; 6E 
- D 1 - I - 0x00362F 00:B61F: 51        .byte $51, $40, $40, $40   ; 
- D 1 - I - 0x003633 00:B623: 51        .byte $51, $40, $40, $40   ; 
- D 1 - I - 0x003637 00:B627: 51        .byte $51, $40, $40, $40   ; 
- D 1 - I - 0x00363B 00:B62B: 36        .byte $36, $40, $40, $40   ; 
; 6F 
- D 1 - I - 0x00363F 00:B62F: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003643 00:B633: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003647 00:B637: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x00364B 00:B63B: 4C        .byte $4C, $E4, $40, $40   ; 
; 70 
- D 1 - I - 0x00364F 00:B63F: 80        .byte $80, $E5, $E5, $E5   ; 
- D 1 - I - 0x003653 00:B643: 51        .byte $51, $40, $40, $40   ; 
- D 1 - I - 0x003657 00:B647: 51        .byte $51, $40, $40, $40   ; 
- D 1 - I - 0x00365B 00:B64B: 51        .byte $51, $40, $40, $40   ; 
; 71 
- D 1 - I - 0x00365F 00:B64F: E5        .byte $E5, $E5, $E5, $E5   ; 
- D 1 - I - 0x003663 00:B653: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003667 00:B657: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x00366B 00:B65B: 40        .byte $40, $40, $40, $40   ; 
; 72 
- D 1 - I - 0x00366F 00:B65F: 05        .byte $05, $06, $06, $06   ; 
- D 1 - I - 0x003673 00:B663: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003677 00:B667: 07        .byte $07, $40, $07, $40   ; 
- D 1 - I - 0x00367B 00:B66B: 52        .byte $52, $53, $53, $53   ; 
; 73 
- D 1 - I - 0x00367F 00:B66F: 06        .byte $06, $06, $06, $C2   ; 
- D 1 - I - 0x003683 00:B673: 40        .byte $40, $40, $40, $C3   ; 
- D 1 - I - 0x003687 00:B677: 07        .byte $07, $40, $07, $C3   ; 
- D 1 - I - 0x00368B 00:B67B: 53        .byte $53, $53, $53, $C4   ; 
; 74 
- D 1 - I - 0x00368F 00:B67F: 07        .byte $07, $40, $07, $40   ; 
- D 1 - I - 0x003693 00:B683: 52        .byte $52, $53, $53, $53   ; 
- D 1 - I - 0x003697 00:B687: 05        .byte $05, $06, $06, $06   ; 
- D 1 - I - 0x00369B 00:B68B: 40        .byte $40, $40, $40, $40   ; 
; 75 
- D 1 - I - 0x00369F 00:B68F: 07        .byte $07, $40, $07, $C3   ; 
- D 1 - I - 0x0036A3 00:B693: 53        .byte $53, $53, $53, $C4   ; 
- D 1 - I - 0x0036A7 00:B697: 06        .byte $06, $06, $06, $C2   ; 
- D 1 - I - 0x0036AB 00:B69B: 40        .byte $40, $40, $40, $C3   ; 
; 76 
- D 1 - I - 0x0036AF 00:B69F: 24        .byte $24, $24, $24, $24   ; 
- D 1 - I - 0x0036B3 00:B6A3: 7D        .byte $7D, $7D, $7D, $7D   ; 
- D 1 - I - 0x0036B7 00:B6A7: 21        .byte $21, $20, $1F, $83   ; 
- D 1 - I - 0x0036BB 00:B6AB: 83        .byte $83, $83, $20, $22   ; 
; 77 
- D 1 - I - 0x0036BF 00:B6AF: 24        .byte $24, $24, $24, $24   ; 
- D 1 - I - 0x0036C3 00:B6B3: 7D        .byte $7D, $7D, $7D, $7D   ; 
- D 1 - I - 0x0036C7 00:B6B7: 1B        .byte $1B, $85, $1C, $81   ; 
- D 1 - I - 0x0036CB 00:B6BB: 1D        .byte $1D, $1C, $1B, $1B   ; 
; 78 
- D 1 - I - 0x0036CF 00:B6BF: 34        .byte $34, $E7, $37, $E7   ; 
- D 1 - I - 0x0036D3 00:B6C3: E8        .byte $E8, $35, $E6, $E6   ; 
- D 1 - I - 0x0036D7 00:B6C7: 3A        .byte $3A, $38, $39, $39   ; 
- D 1 - I - 0x0036DB 00:B6CB: 3A        .byte $3A, $41, $41, $41   ; 
; 79 
- D 1 - I - 0x0036DF 00:B6CF: 37        .byte $37, $E7, $37, $E7   ; 
- D 1 - I - 0x0036E3 00:B6D3: 35        .byte $35, $35, $E6, $35   ; 
- D 1 - I - 0x0036E7 00:B6D7: 38        .byte $38, $39, $39, $38   ; 
- D 1 - I - 0x0036EB 00:B6DB: 41        .byte $41, $41, $41, $41   ; 
; 7A 
- D 1 - I - 0x0036EF 00:B6DF: 22        .byte $22, $22, $20, $84   ; 
- D 1 - I - 0x0036F3 00:B6E3: 84        .byte $84, $23, $22, $84   ; 
- D 1 - I - 0x0036F7 00:B6E7: 23        .byte $23, $84, $23, $00   ; 
- D 1 - I - 0x0036FB 00:B6EB: 00        .byte $00, $00, $00, $23   ; 
; 7B 
- D 1 - I - 0x0036FF 00:B6EF: 1E        .byte $1E, $1C, $1D, $1D   ; 
- D 1 - I - 0x003703 00:B6F3: 1E        .byte $1E, $82, $82, $1E   ; 
- D 1 - I - 0x003707 00:B6F7: 30        .byte $30, $82, $1E, $82   ; 
- D 1 - I - 0x00370B 00:B6FB: 82        .byte $82, $00, $00, $00   ; 
; 7C 
- D 1 - I - 0x00370F 00:B6FF: 3A        .byte $3A, $41, $41, $41   ; 
- D 1 - I - 0x003713 00:B703: 3B        .byte $3B, $41, $41, $41   ; 
- D 1 - I - 0x003717 00:B707: 3B        .byte $3B, $41, $41, $41   ; 
- D 1 - I - 0x00371B 00:B70B: 3B        .byte $3B, $41, $41, $41   ; 
; 7D 
- D 1 - I - 0x00371F 00:B70F: 41        .byte $41, $41, $41, $3D   ; 
- D 1 - I - 0x003723 00:B713: 41        .byte $41, $41, $41, $E9   ; 
- D 1 - I - 0x003727 00:B717: 41        .byte $41, $41, $3D, $3E   ; 
- D 1 - I - 0x00372B 00:B71B: 41        .byte $41, $41, $E9, $41   ; 
; 7E 
- D 1 - I - 0x00372F 00:B71F: 3C        .byte $3C, $41, $41, $41   ; 
- D 1 - I - 0x003733 00:B723: 3C        .byte $3C, $41, $41, $41   ; 
- D 1 - I - 0x003737 00:B727: 3C        .byte $3C, $41, $41, $41   ; 
- D 1 - I - 0x00373B 00:B72B: EA        .byte $EA, $EB, $EB, $EB   ; 
; 7F 
- D 1 - I - 0x00373F 00:B72F: 41        .byte $41, $3D, $3E, $41   ; 
- D 1 - I - 0x003743 00:B733: 41        .byte $41, $E9, $41, $41   ; 
- D 1 - I - 0x003747 00:B737: 3D        .byte $3D, $3E, $41, $41   ; 
- D 1 - I - 0x00374B 00:B73B: EC        .byte $EC, $EB, $EB, $EB   ; 
; 80 
- D 1 - I - 0x00374F 00:B73F: 37        .byte $37, $E7, $37, $E7   ; 
- D 1 - I - 0x003753 00:B743: 35        .byte $35, $35, $E6, $35   ; 
- D 1 - I - 0x003757 00:B747: 3F        .byte $3F, $00, $39, $38   ; 
- D 1 - I - 0x00375B 00:B74B: E9        .byte $E9, $41, $41, $41   ; 
; 81 
- D 1 - I - 0x00375F 00:B74F: 3E        .byte $3E, $41, $41, $41   ; 
- D 1 - I - 0x003763 00:B753: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003767 00:B757: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x00376B 00:B75B: 41        .byte $41, $41, $41, $41   ; 
; 82 
- D 1 - I - 0x00376F 00:B75F: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003773 00:B763: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003777 00:B767: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x00377B 00:B76B: 41        .byte $41, $41, $41, $E1   ; 
; 83 
- D 1 - I - 0x00377F 00:B76F: 25        .byte $25, $24, $24, $24   ; 
- D 1 - I - 0x003783 00:B773: 00        .byte $00, $54, $7D, $7D   ; 
- D 1 - I - 0x003787 00:B777: 30        .byte $30, $00, $1D, $1C   ; 
- D 1 - I - 0x00378B 00:B77B: 00        .byte $00, $00, $82, $1D   ; 
; 84 
- D 1 - I - 0x00378F 00:B77F: 01        .byte $01, $02, $02, $61   ; 
- D 1 - I - 0x003793 00:B783: 62        .byte $62, $63, $63, $64   ; 
- D 1 - I - 0x003797 00:B787: 05        .byte $05, $06, $06, $06   ; 
- D 1 - I - 0x00379B 00:B78B: 40        .byte $40, $40, $40, $40   ; 
; 85 
- D 1 - I - 0x00379F 00:B78F: 01        .byte $01, $02, $02, $61   ; 
- D 1 - I - 0x0037A3 00:B793: 62        .byte $62, $63, $63, $64   ; 
- D 1 - I - 0x0037A7 00:B797: 06        .byte $06, $06, $06, $C2   ; 
- D 1 - I - 0x0037AB 00:B79B: 40        .byte $40, $40, $40, $C3   ; 
; 86 
- D 1 - I - 0x0037AF 00:B79F: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x0037B3 00:B7A3: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x0037B7 00:B7A7: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x0037BB 00:B7AB: 40        .byte $40, $40, $40, $40   ; 
; 87 
- D 1 - I - 0x0037BF 00:B7AF: 40        .byte $40, $40, $40, $7B   ; 
- D 1 - I - 0x0037C3 00:B7B3: 40        .byte $40, $40, $40, $7B   ; 
- D 1 - I - 0x0037C7 00:B7B7: 40        .byte $40, $40, $40, $7B   ; 
- D 1 - I - 0x0037CB 00:B7BB: 40        .byte $40, $40, $40, $7B   ; 
; 88 
- D 1 - I - 0x0037CF 00:B7BF: 41        .byte $41, $49, $3F, $00   ; 
- D 1 - I - 0x0037D3 00:B7C3: 65        .byte $65, $65, $65, $65   ; 
- D 1 - I - 0x0037D7 00:B7C7: 68        .byte $68, $41, $41, $41   ; 
- D 1 - I - 0x0037DB 00:B7CB: 6C        .byte $6C, $6A, $41, $41   ; 
; 89 
- D 1 - I - 0x0037DF 00:B7CF: 3F        .byte $3F, $00, $3F, $00   ; 
- D 1 - I - 0x0037E3 00:B7D3: 65        .byte $65, $65, $65, $6B   ; 
- D 1 - I - 0x0037E7 00:B7D7: 41        .byte $41, $41, $41, $6D   ; 
- D 1 - I - 0x0037EB 00:B7DB: 41        .byte $41, $41, $41, $6D   ; 
; 8A 
- D 1 - I - 0x0037EF 00:B7DF: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x0037F3 00:B7E3: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x0037F7 00:B7E7: 40        .byte $40, $40, $69, $68   ; 
- D 1 - I - 0x0037FB 00:B7EB: 40        .byte $40, $40, $69, $6C   ; 
; 8B 
- D 1 - I - 0x0037FF 00:B7EF: 40        .byte $40, $40, $40, $7B   ; 
- D 1 - I - 0x003803 00:B7F3: 40        .byte $40, $40, $40, $7B   ; 
- D 1 - I - 0x003807 00:B7F7: 41        .byte $41, $41, $41, $4A   ; 
- D 1 - I - 0x00380B 00:B7FB: 6A        .byte $6A, $41, $41, $26   ; 
; 8C 
- D 1 - I - 0x00380F 00:B7FF: 41        .byte $41, $49, $6A, $41   ; 
- D 1 - I - 0x003813 00:B803: 41        .byte $41, $6C, $00, $6A   ; 
- D 1 - I - 0x003817 00:B807: 41        .byte $41, $41, $49, $00   ; 
- D 1 - I - 0x00381B 00:B80B: 41        .byte $41, $41, $6C, $00   ; 
; 8D 
- D 1 - I - 0x00381F 00:B80F: 41        .byte $41, $41, $41, $6D   ; 
- D 1 - I - 0x003823 00:B813: 41        .byte $41, $41, $41, $6D   ; 
- D 1 - I - 0x003827 00:B817: 6A        .byte $6A, $41, $41, $6D   ; 
- D 1 - I - 0x00382B 00:B81B: 00        .byte $00, $6A, $41, $6D   ; 
; 8E 
- D 1 - I - 0x00382F 00:B81F: 40        .byte $40, $40, $69, $41   ; 
- D 1 - I - 0x003833 00:B823: 40        .byte $40, $40, $69, $41   ; 
- D 1 - I - 0x003837 00:B827: 40        .byte $40, $40, $69, $41   ; 
- D 1 - I - 0x00383B 00:B82B: 40        .byte $40, $40, $69, $41   ; 
; 8F 
- D 1 - I - 0x00383F 00:B82F: 49        .byte $49, $6A, $41, $41   ; 
- D 1 - I - 0x003843 00:B833: 6C        .byte $6C, $00, $6A, $41   ; 
- D 1 - I - 0x003847 00:B837: 41        .byte $41, $49, $3F, $6A   ; 
- D 1 - I - 0x00384B 00:B83B: 41        .byte $41, $76, $00, $00   ; 
; 90 
- D 1 - I - 0x00384F 00:B83F: 1A        .byte $1A, $C1, $10, $10   ; 
- D 1 - I - 0x003853 00:B843: 12        .byte $12, $87, $88, $89   ; 
- D 1 - I - 0x003857 00:B847: 12        .byte $12, $87, $13, $8D   ; 
- D 1 - I - 0x00385B 00:B84B: 12        .byte $12, $87, $8F, $BE   ; 
; 91 
- D 1 - I - 0x00385F 00:B84F: 10        .byte $10, $10, $11, $86   ; 
- D 1 - I - 0x003863 00:B853: 8A        .byte $8A, $8B, $15, $15   ; 
- D 1 - I - 0x003867 00:B857: 14        .byte $14, $8E, $15, $15   ; 
- D 1 - I - 0x00386B 00:B85B: BF        .byte $BF, $91, $15, $15   ; 
; 92 
- D 1 - I - 0x00386F 00:B85F: 88        .byte $88, $89, $8A, $8B   ; 
- D 1 - I - 0x003873 00:B863: 9D        .byte $9D, $9E, $14, $8E   ; 
- D 1 - I - 0x003877 00:B867: 9F        .byte $9F, $A0, $90, $91   ; 
- D 1 - I - 0x00387B 00:B86B: A1        .byte $A1, $A2, $93, $94   ; 
; 93 
- D 1 - I - 0x00387F 00:B86F: 88        .byte $88, $89, $8A, $8B   ; 
- D 1 - I - 0x003883 00:B873: A3        .byte $A3, $A4, $14, $8E   ; 
- D 1 - I - 0x003887 00:B877: A5        .byte $A5, $A6, $90, $91   ; 
- D 1 - I - 0x00388B 00:B87B: A7        .byte $A7, $A8, $93, $94   ; 
; 94 
- D 1 - I - 0x00388F 00:B87F: 12        .byte $12, $87, $16, $C0   ; 
- D 1 - I - 0x003893 00:B883: 12        .byte $12, $95, $96, $96   ; 
- D 1 - I - 0x003897 00:B887: 12        .byte $12, $98, $18, $19   ; 
- D 1 - I - 0x00389B 00:B88B: 99        .byte $99, $9A, $9A, $9B   ; 
; 95 
- D 1 - I - 0x00389F 00:B88F: 17        .byte $17, $94, $15, $15   ; 
- D 1 - I - 0x0038A3 00:B893: 96        .byte $96, $96, $97, $15   ; 
- D 1 - I - 0x0038A7 00:B897: 19        .byte $19, $18, $2E, $15   ; 
- D 1 - I - 0x0038AB 00:B89B: 9B        .byte $9B, $9A, $9A, $9C   ; 
; 96 
- D 1 - I - 0x0038AF 00:B89F: 88        .byte $88, $89, $8A, $8B   ; 
- D 1 - I - 0x0038B3 00:B8A3: 8C        .byte $8C, $8D, $A9, $AA   ; 
- D 1 - I - 0x0038B7 00:B8A7: 8F        .byte $8F, $14, $AB, $AD   ; 
- D 1 - I - 0x0038BB 00:B8AB: 16        .byte $16, $92, $AC, $AE   ; 
; 97 
- D 1 - I - 0x0038BF 00:B8AF: 88        .byte $88, $89, $8A, $8B   ; 
- D 1 - I - 0x0038C3 00:B8B3: 8C        .byte $8C, $8D, $AF, $B0   ; 
- D 1 - I - 0x0038C7 00:B8B7: 8F        .byte $8F, $14, $14, $B1   ; 
- D 1 - I - 0x0038CB 00:B8BB: 16        .byte $16, $92, $93, $94   ; 
; 98 
- D 1 - I - 0x0038CF 00:B8BF: 88        .byte $88, $B2, $B3, $B4   ; 
- D 1 - I - 0x0038D3 00:B8C3: B5        .byte $B5, $00, $B6, $B7   ; 
- D 1 - I - 0x0038D7 00:B8C7: B8        .byte $B8, $B9, $BA, $BB   ; 
- D 1 - I - 0x0038DB 00:B8CB: 16        .byte $16, $BC, $BD, $94   ; 
; 99 
- D 1 - I - 0x0038DF 00:B8CF: 07        .byte $07, $40, $07, $40   ; 
- D 1 - I - 0x0038E3 00:B8D3: 52        .byte $52, $53, $53, $53   ; 
- D 1 - I - 0x0038E7 00:B8D7: 05        .byte $05, $06, $06, $06   ; 
- D 1 - I - 0x0038EB 00:B8DB: 40        .byte $40, $40, $40, $40   ; 
; 9A 
- D 1 - I - 0x0038EF 00:B8DF: 07        .byte $07, $40, $07, $C3   ; 
- D 1 - I - 0x0038F3 00:B8E3: 53        .byte $53, $53, $53, $C4   ; 
- D 1 - I - 0x0038F7 00:B8E7: 06        .byte $06, $06, $06, $C2   ; 
- D 1 - I - 0x0038FB 00:B8EB: 40        .byte $40, $40, $40, $C3   ; 
; 9B 
- D 1 - I - 0x0038FF 00:B8EF: 07        .byte $07, $40, $07, $40   ; 
- D 1 - I - 0x003903 00:B8F3: 53        .byte $53, $53, $53, $53   ; 
- D 1 - I - 0x003907 00:B8F7: 06        .byte $06, $06, $06, $06   ; 
- D 1 - I - 0x00390B 00:B8FB: 40        .byte $40, $40, $40, $40   ; 
; 9C 
- D 1 - I - 0x00390F 00:B8FF: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003913 00:B903: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003917 00:B907: 05        .byte $05, $06, $06, $06   ; 
- D 1 - I - 0x00391B 00:B90B: 40        .byte $40, $40, $40, $40   ; 
; 9D 
- D 1 - I - 0x00391F 00:B90F: 07        .byte $07, $40, $07, $40   ; 
- D 1 - I - 0x003923 00:B913: 52        .byte $52, $53, $53, $53   ; 
- D 1 - I - 0x003927 00:B917: 06        .byte $06, $06, $06, $06   ; 
- D 1 - I - 0x00392B 00:B91B: 40        .byte $40, $40, $40, $40   ; 
; 9E 
- D 1 - I - 0x00392F 00:B91F: 07        .byte $07, $40, $07, $C3   ; 
- D 1 - I - 0x003933 00:B923: 53        .byte $53, $53, $53, $C4   ; 
- D 1 - I - 0x003937 00:B927: 06        .byte $06, $06, $06, $06   ; 
- D 1 - I - 0x00393B 00:B92B: 40        .byte $40, $40, $40, $40   ; 
; 9F 
- D 1 - I - 0x00393F 00:B92F: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003943 00:B933: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003947 00:B937: 06        .byte $06, $06, $06, $C2   ; 
- D 1 - I - 0x00394B 00:B93B: 40        .byte $40, $40, $40, $C3   ; 
; A0 
- D 1 - I - 0x00394F 00:B93F: 4A        .byte $4A, $41, $41, $49   ; 
- D 1 - I - 0x003953 00:B943: 26        .byte $26, $41, $41, $76   ; 
- D 1 - I - 0x003957 00:B947: 41        .byte $41, $4A, $41, $7A   ; 
- D 1 - I - 0x00395B 00:B94B: 2D        .byte $2D, $26, $41, $7A   ; 
; A1 
- D 1 - I - 0x00395F 00:B94F: 41        .byte $41, $7A, $32, $41   ; 
- D 1 - I - 0x003963 00:B953: 41        .byte $41, $7A, $41, $41   ; 
- D 1 - I - 0x003967 00:B957: 41        .byte $41, $7A, $32, $41   ; 
- D 1 - I - 0x00396B 00:B95B: 41        .byte $41, $7A, $41, $41   ; 
; A2 
- D 1 - I - 0x00396F 00:B95F: 32        .byte $32, $69, $32, $7A   ; 
- D 1 - I - 0x003973 00:B963: 41        .byte $41, $69, $41, $7A   ; 
- D 1 - I - 0x003977 00:B967: 32        .byte $32, $69, $32, $7A   ; 
- D 1 - I - 0x00397B 00:B96B: 41        .byte $41, $69, $41, $7A   ; 
; A3 
- D 1 - I - 0x00397F 00:B96F: 40        .byte $40, $40, $69, $41   ; 
- D 1 - I - 0x003983 00:B973: 40        .byte $40, $40, $69, $41   ; 
- D 1 - I - 0x003987 00:B977: 40        .byte $40, $40, $69, $41   ; 
- D 1 - I - 0x00398B 00:B97B: 24        .byte $24, $24, $24, $4A   ; 
; A4 
- D 1 - I - 0x00398F 00:B97F: 30        .byte $30, $00, $30, $00   ; 
- D 1 - I - 0x003993 00:B983: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003997 00:B987: 30        .byte $30, $00, $30, $00   ; 
- D 1 - I - 0x00399B 00:B98B: 00        .byte $00, $00, $00, $00   ; 
; A5 
- D 1 - I - 0x00399F 00:B98F: 41        .byte $41, $41, $41, $26   ; 
- D 1 - I - 0x0039A3 00:B993: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x0039A7 00:B997: 32        .byte $32, $41, $32, $41   ; 
- D 1 - I - 0x0039AB 00:B99B: 7D        .byte $7D, $7D, $7D, $7D   ; 
; A6 
- D 1 - I - 0x0039AF 00:B99F: 41        .byte $41, $7A, $32, $41   ; 
- D 1 - I - 0x0039B3 00:B9A3: 4A        .byte $4A, $7A, $41, $41   ; 
- D 1 - I - 0x0039B7 00:B9A7: 26        .byte $26, $7A, $32, $41   ; 
- D 1 - I - 0x0039BB 00:B9AB: 7D        .byte $7D, $7E, $41, $41   ; 
; A7 
- D 1 - I - 0x0039BF 00:B9AF: 32        .byte $32, $41, $32, $41   ; 
- D 1 - I - 0x0039C3 00:B9B3: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x0039C7 00:B9B7: 31        .byte $31, $40, $31, $40   ; 
- D 1 - I - 0x0039CB 00:B9BB: 24        .byte $24, $24, $24, $24   ; 
; A8 
- D 1 - I - 0x0039CF 00:B9BF: 32        .byte $32, $69, $32, $7A   ; 
- D 1 - I - 0x0039D3 00:B9C3: 41        .byte $41, $69, $41, $7A   ; 
- D 1 - I - 0x0039D7 00:B9C7: 31        .byte $31, $69, $32, $7A   ; 
- D 1 - I - 0x0039DB 00:B9CB: 24        .byte $24, $24, $4A, $7A   ; 
; A9 
- D 1 - I - 0x0039DF 00:B9CF: 32        .byte $32, $41, $32, $41   ; 
- D 1 - I - 0x0039E3 00:B9D3: 7D        .byte $7D, $7D, $7D, $7D   ; 
- - - - - - 0x0039E7 00:B9D7: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x0039EB 00:B9DB: 00        .byte $00, $00, $00, $00   ; 
; AA 
- D 1 - I - 0x0039EF 00:B9DF: 32        .byte $32, $41, $26, $7A   ; 
- D 1 - I - 0x0039F3 00:B9E3: 7D        .byte $7D, $7D, $7D, $7E   ; 
- - - - - - 0x0039F7 00:B9E7: E8        .byte $E8, $E9, $EA, $EB   ; 
- - - - - - 0x0039FB 00:B9EB: F8        .byte $F8, $F9, $FA, $FB   ; 
; AB 
- D 1 - I - 0x0039FF 00:B9EF: 30        .byte $30, $00, $30, $1E   ; 
- D 1 - I - 0x003A03 00:B9F3: 00        .byte $00, $00, $82, $00   ; 
- D 1 - I - 0x003A07 00:B9F7: 30        .byte $30, $00, $30, $82   ; 
- D 1 - I - 0x003A0B 00:B9FB: 00        .byte $00, $00, $00, $00   ; 
; AC 
- D 1 - I - 0x003A0F 00:B9FF: 3F        .byte $3F, $00, $3F, $00   ; 
- D 1 - I - 0x003A13 00:BA03: 65        .byte $65, $65, $65, $65   ; 
- D 1 - I - 0x003A17 00:BA07: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003A1B 00:BA0B: 4B        .byte $4B, $41, $41, $41   ; 
; AD 
- D 1 - I - 0x003A1F 00:BA0F: 3F        .byte $3F, $00, $5F, $40   ; 
- D 1 - I - 0x003A23 00:BA13: 65        .byte $65, $65, $65, $6B   ; 
- D 1 - I - 0x003A27 00:BA17: 41        .byte $41, $41, $41, $6E   ; 
- D 1 - I - 0x003A2B 00:BA1B: 41        .byte $41, $41, $41, $6F   ; 
; AE 
- D 1 - I - 0x003A2F 00:BA1F: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003A33 00:BA23: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003A37 00:BA27: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003A3B 00:BA2B: 40        .byte $40, $2A, $40, $40   ; 
; AF 
- D 1 - I - 0x003A3F 00:BA2F: 4B        .byte $4B, $41, $41, $41   ; 
- D 1 - I - 0x003A43 00:BA33: 4B        .byte $4B, $41, $41, $41   ; 
- D 1 - I - 0x003A47 00:BA37: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003A4B 00:BA3B: 4B        .byte $4B, $41, $41, $41   ; 
; B0 
- D 1 - I - 0x003A4F 00:BA3F: 41        .byte $41, $41, $4D, $50   ; 
- D 1 - I - 0x003A53 00:BA43: 41        .byte $41, $41, $74, $75   ; 
- D 1 - I - 0x003A57 00:BA47: 41        .byte $41, $4D, $4E, $40   ; 
- D 1 - I - 0x003A5B 00:BA4B: 41        .byte $41, $74, $78, $40   ; 
; B1 
- D 1 - I - 0x003A5F 00:BA4F: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003A63 00:BA53: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003A67 00:BA57: 4F        .byte $4F, $41, $41, $41   ; 
- D 1 - I - 0x003A6B 00:BA5B: 67        .byte $67, $41, $41, $41   ; 
; B2 
- D 1 - I - 0x003A6F 00:BA5F: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003A73 00:BA63: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003A77 00:BA67: 4D        .byte $4D, $2A, $40, $40   ; 
- D 1 - I - 0x003A7B 00:BA6B: 6F        .byte $6F, $2A, $40, $40   ; 
; B3 
- D 1 - I - 0x003A7F 00:BA6F: 4D        .byte $4D, $41, $50, $4F   ; 
- D 1 - I - 0x003A83 00:BA73: 79        .byte $79, $41, $75, $67   ; 
- D 1 - I - 0x003A87 00:BA77: 56        .byte $56, $4E, $4F, $41   ; 
- D 1 - I - 0x003A8B 00:BA7B: 56        .byte $56, $78, $67, $41   ; 
; B4 
- D 1 - I - 0x003A8F 00:BA7F: 41        .byte $41, $41, $41, $4D   ; 
- D 1 - I - 0x003A93 00:BA83: 41        .byte $41, $41, $41, $74   ; 
- D 1 - I - 0x003A97 00:BA87: 41        .byte $41, $41, $4D, $4E   ; 
- D 1 - I - 0x003A9B 00:BA8B: 41        .byte $41, $41, $79, $78   ; 
; B5 
- D 1 - I - 0x003A9F 00:BA8F: 50        .byte $50, $2A, $40, $40   ; 
- D 1 - I - 0x003AA3 00:BA93: 75        .byte $75, $2A, $40, $40   ; 
- D 1 - I - 0x003AA7 00:BA97: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003AAB 00:BA9B: 40        .byte $40, $2A, $40, $40   ; 
; B6 
- D 1 - I - 0x003AAF 00:BA9F: 27        .byte $27, $50, $28, $2F   ; 
- D 1 - I - 0x003AB3 00:BAA3: 56        .byte $56, $75, $2A, $2B   ; 
- D 1 - I - 0x003AB7 00:BAA7: 29        .byte $29, $40, $2A, $40   ; 
- D 1 - I - 0x003ABB 00:BAAB: 7C        .byte $7C, $40, $2A, $40   ; 
; B7 
- D 1 - I - 0x003ABF 00:BAAF: 2F        .byte $2F, $2F, $56, $50   ; 
- D 1 - I - 0x003AC3 00:BAB3: 41        .byte $41, $41, $56, $75   ; 
- D 1 - I - 0x003AC7 00:BAB7: 2B        .byte $2B, $41, $57, $40   ; 
- D 1 - I - 0x003ACB 00:BABB: 40        .byte $40, $2B, $7C, $40   ; 
; B8 
- D 1 - I - 0x003ACF 00:BABF: 2C        .byte $2C, $40, $2A, $40   ; 
- D 1 - I - 0x003AD3 00:BAC3: 2C        .byte $2C, $40, $2A, $40   ; 
- D 1 - I - 0x003AD7 00:BAC7: 2C        .byte $2C, $40, $2A, $40   ; 
- D 1 - I - 0x003ADB 00:BACB: 2C        .byte $2C, $40, $2A, $40   ; 
; B9 
- D 1 - I - 0x003ADF 00:BACF: 31        .byte $31, $40, $66, $40   ; 
- D 1 - I - 0x003AE3 00:BAD3: 40        .byte $40, $40, $2C, $40   ; 
- D 1 - I - 0x003AE7 00:BAD7: 31        .byte $31, $40, $66, $40   ; 
- D 1 - I - 0x003AEB 00:BADB: 40        .byte $40, $40, $2C, $40   ; 
; BA 
- D 1 - I - 0x003AEF 00:BADF: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003AF3 00:BAE3: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003AF7 00:BAE7: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003AFB 00:BAEB: 4F        .byte $4F, $24, $24, $24   ; 
; BB 
- D 1 - I - 0x003AFF 00:BAEF: 31        .byte $31, $40, $66, $40   ; 
- D 1 - I - 0x003B03 00:BAF3: 40        .byte $40, $40, $2C, $4F   ; 
- D 1 - I - 0x003B07 00:BAF7: 31        .byte $31, $40, $2C, $67   ; 
- D 1 - I - 0x003B0B 00:BAFB: 40        .byte $40, $40, $7F, $7D   ; 
; BC 
- D 1 - I - 0x003B0F 00:BAFF: 67        .byte $67, $41, $41, $41   ; 
- D 1 - I - 0x003B13 00:BB03: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003B17 00:BB07: 32        .byte $32, $41, $32, $41   ; 
- D 1 - I - 0x003B1B 00:BB0B: 7D        .byte $7D, $7D, $7D, $7D   ; 
; BD 
- D 1 - I - 0x003B1F 00:BB0F: 2C        .byte $2C, $40, $2A, $40   ; 
- D 1 - I - 0x003B23 00:BB13: 2C        .byte $2C, $40, $2A, $40   ; 
- D 1 - I - 0x003B27 00:BB17: 2C        .byte $2C, $40, $2A, $40   ; 
- D 1 - I - 0x003B2B 00:BB1B: 2C        .byte $2C, $4F, $24, $24   ; 
; BE 
- D 1 - I - 0x003B2F 00:BB1F: 31        .byte $31, $40, $2B, $41   ; 
- D 1 - I - 0x003B33 00:BB23: 40        .byte $40, $40, $40, $2B   ; 
- D 1 - I - 0x003B37 00:BB27: 31        .byte $31, $40, $31, $40   ; 
- D 1 - I - 0x003B3B 00:BB2B: 24        .byte $24, $24, $24, $24   ; 
; BF 
- D 1 - I - 0x003B3F 00:BB2F: 32        .byte $32, $41, $32, $41   ; 
- D 1 - I - 0x003B43 00:BB33: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003B47 00:BB37: 31        .byte $31, $40, $31, $40   ; 
- D 1 - I - 0x003B4B 00:BB3B: 24        .byte $24, $24, $24, $24   ; 
; C0 
- D 1 - I - 0x003B4F 00:BB3F: 2C        .byte $2C, $67, $32, $41   ; 
- D 1 - I - 0x003B53 00:BB43: 7F        .byte $7F, $7D, $7D, $7D   ; 
- - - - - - 0x003B57 00:BB47: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x003B5B 00:BB4B: 00        .byte $00, $00, $00, $00   ; 
; C1 
- D 1 - I - 0x003B5F 00:BB4F: 30        .byte $30, $00, $2D, $6D   ; 
- D 1 - I - 0x003B63 00:BB53: 00        .byte $00, $00, $00, $77   ; 
- D 1 - I - 0x003B67 00:BB57: 0B        .byte $0B, $03, $03, $03   ; 
- D 1 - I - 0x003B6B 00:BB5B: 0C        .byte $0C, $00, $00, $00   ; 
; C2 
- D 1 - I - 0x003B6F 00:BB5F: 32        .byte $32, $41, $32, $41   ; 
- D 1 - I - 0x003B73 00:BB63: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003B77 00:BB67: 0B        .byte $0B, $03, $03, $03   ; 
- D 1 - I - 0x003B7B 00:BB6B: 0C        .byte $0C, $00, $00, $00   ; 
; C3 
- D 1 - I - 0x003B7F 00:BB6F: 00        .byte $00, $00, $03, $03   ; 
- D 1 - I - 0x003B83 00:BB73: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003B87 00:BB77: 0B        .byte $0B, $03, $03, $03   ; 
- D 1 - I - 0x003B8B 00:BB7B: 0C        .byte $0C, $00, $00, $00   ; 
; C4 
- D 1 - I - 0x003B8F 00:BB7F: 0B        .byte $0B, $03, $55, $40   ; 
- D 1 - I - 0x003B93 00:BB83: 0C        .byte $0C, $00, $73, $40   ; 
- D 1 - I - 0x003B97 00:BB87: 0B        .byte $0B, $03, $03, $03   ; 
- D 1 - I - 0x003B9B 00:BB8B: 0C        .byte $0C, $00, $00, $00   ; 
; C5 
- D 1 - I - 0x003B9F 00:BB8F: 0B        .byte $0B, $03, $03, $03   ; 
- D 1 - I - 0x003BA3 00:BB93: 0C        .byte $0C, $00, $00, $00   ; 
- D 1 - I - 0x003BA7 00:BB97: 0B        .byte $0B, $03, $03, $73   ; 
- D 1 - I - 0x003BAB 00:BB9B: 0C        .byte $0C, $00, $00, $55   ; 
; C6 
- D 1 - I - 0x003BAF 00:BB9F: 0B        .byte $0B, $03, $03, $55   ; 
- D 1 - I - 0x003BB3 00:BBA3: 0C        .byte $0C, $00, $00, $55   ; 
- D 1 - I - 0x003BB7 00:BBA7: 0B        .byte $0B, $03, $03, $73   ; 
- D 1 - I - 0x003BBB 00:BBAB: 0C        .byte $0C, $00, $73, $40   ; 
; C7 
- D 1 - I - 0x003BBF 00:BBAF: 06        .byte $06, $06, $06, $06   ; 
- D 1 - I - 0x003BC3 00:BBB3: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003BC7 00:BBB7: 07        .byte $07, $40, $07, $40   ; 
- D 1 - I - 0x003BCB 00:BBBB: 53        .byte $53, $53, $53, $53   ; 
; C8 
- D 1 - I - 0x003BCF 00:BBBF: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003BD3 00:BBC3: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003BD7 00:BBC7: 40        .byte $40, $40, $69, $49   ; 
- D 1 - I - 0x003BDB 00:BBCB: 40        .byte $40, $40, $69, $6C   ; 
; C9 
- D 1 - I - 0x003BDF 00:BBCF: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003BE3 00:BBD3: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003BE7 00:BBD7: 5F        .byte $5F, $2A, $40, $40   ; 
- D 1 - I - 0x003BEB 00:BBDB: 60        .byte $60, $2A, $40, $40   ; 
; CA 
- D 1 - I - 0x003BEF 00:BBDF: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003BF3 00:BBE3: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003BF7 00:BBE7: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003BFB 00:BBEB: 40        .byte $40, $40, $40, $40   ; 
; CB 
- D 1 - I - 0x003BFF 00:BBEF: 49        .byte $49, $00, $03, $03   ; 
- D 1 - I - 0x003C03 00:BBF3: 6C        .byte $6C, $00, $00, $00   ; 
- - - - - - 0x003C07 00:BBF7: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x003C0B 00:BBFB: 00        .byte $00, $00, $00, $00   ; 
; CC 
- D 1 - I - 0x003C0F 00:BBFF: 40        .byte $40, $40, $69, $41   ; 
- D 1 - I - 0x003C13 00:BC03: 40        .byte $40, $40, $69, $41   ; 
- - - - - - 0x003C17 00:BC07: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x003C1B 00:BC0B: 00        .byte $00, $00, $00, $00   ; 
; CD 
- D 1 - I - 0x003C1F 00:BC0F: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003C23 00:BC13: 40        .byte $40, $2A, $40, $40   ; 
- - - - - - 0x003C27 00:BC17: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x003C2B 00:BC1B: 00        .byte $00, $00, $00, $00   ; 
; CE 
- D 1 - I - 0x003C2F 00:BC1F: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003C33 00:BC23: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003C37 00:BC27: 0B        .byte $0B, $03, $03, $03   ; 
- D 1 - I - 0x003C3B 00:BC2B: 0C        .byte $0C, $00, $00, $00   ; 
; CF 
- D 1 - I - 0x003C3F 00:BC2F: 0B        .byte $0B, $03, $3F, $5F   ; 
- D 1 - I - 0x003C43 00:BC33: 0C        .byte $0C, $00, $00, $60   ; 
- - - - - - 0x003C47 00:BC37: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x003C4B 00:BC3B: 00        .byte $00, $00, $00, $00   ; 
; D0 
- D 1 - I - 0x003C4F 00:BC3F: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003C53 00:BC43: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003C57 00:BC47: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003C5B 00:BC4B: 08        .byte $08, $08, $08, $08   ; 
; D1 
- D 1 - I - 0x003C5F 00:BC4F: 66        .byte $66, $40, $67, $41   ; 
- D 1 - I - 0x003C63 00:BC53: 66        .byte $66, $4F, $41, $41   ; 
- D 1 - I - 0x003C67 00:BC57: 66        .byte $66, $67, $41, $41   ; 
- D 1 - I - 0x003C6B 00:BC5B: 7F        .byte $7F, $7D, $7D, $7D   ; 
; D2 
- D 1 - I - 0x003C6F 00:BC5F: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003C73 00:BC63: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003C77 00:BC67: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003C7B 00:BC6B: 7D        .byte $7D, $7D, $7D, $7D   ; 
; D3 
- D 1 - I - 0x003C7F 00:BC6F: 41        .byte $41, $26, $41, $7A   ; 
- D 1 - I - 0x003C83 00:BC73: 41        .byte $41, $41, $4A, $7A   ; 
- D 1 - I - 0x003C87 00:BC77: 41        .byte $41, $41, $80, $7A   ; 
- D 1 - I - 0x003C8B 00:BC7B: 7D        .byte $7D, $7D, $7D, $7E   ; 
; D4 
- D 1 - I - 0x003C8F 00:BC7F: 88        .byte $88, $89, $8A, $8B   ; 
- D 1 - I - 0x003C93 00:BC83: 13        .byte $13, $8D, $14, $8E   ; 
- D 1 - I - 0x003C97 00:BC87: 8F        .byte $8F, $BE, $BF, $91   ; 
- D 1 - I - 0x003C9B 00:BC8B: 16        .byte $16, $C0, $17, $94   ; 
; D5 
- D 1 - I - 0x003C9F 00:BC8F: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003CA3 00:BC93: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003CA7 00:BC97: 03        .byte $03, $03, $03, $03   ; 
- D 1 - I - 0x003CAB 00:BC9B: 00        .byte $00, $00, $00, $00   ; 
; D6 
- D 1 - I - 0x003CAF 00:BC9F: 0F        .byte $0F, $32, $0F, $32   ; 
- D 1 - I - 0x003CB3 00:BCA3: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003CB7 00:BCA7: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003CBB 00:BCAB: 00        .byte $00, $00, $00, $00   ; 
; D7 
- D 1 - I - 0x003CBF 00:BCAF: 40        .byte $40, $40, $40, $40   ; 
- D 1 - I - 0x003CC3 00:BCB3: 24        .byte $24, $24, $24, $24   ; 
- D 1 - I - 0x003CC7 00:BCB7: 41        .byte $41, $41, $41, $41   ; 
- D 1 - I - 0x003CCB 00:BCBB: 41        .byte $41, $41, $41, $41   ; 
; D8 
- D 1 - I - 0x003CCF 00:BCBF: 40        .byte $40, $40, $69, $68   ; 
- D 1 - I - 0x003CD3 00:BCC3: 40        .byte $40, $40, $69, $6C   ; 
- D 1 - I - 0x003CD7 00:BCC7: 40        .byte $40, $40, $69, $41   ; 
- D 1 - I - 0x003CDB 00:BCCB: 40        .byte $40, $40, $69, $41   ; 
; D9 
- D 1 - I - 0x003CDF 00:BCCF: 0F        .byte $0F, $32, $0F, $32   ; 
- D 1 - I - 0x003CE3 00:BCD3: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003CE7 00:BCD7: 49        .byte $49, $00, $00, $00   ; 
- D 1 - I - 0x003CEB 00:BCDB: 5D        .byte $5D, $00, $00, $00   ; 
; DA 
- D 1 - I - 0x003CEF 00:BCDF: 0F        .byte $0F, $32, $0F, $32   ; 
- D 1 - I - 0x003CF3 00:BCE3: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003CF7 00:BCE7: 00        .byte $00, $00, $3F, $5F   ; 
- D 1 - I - 0x003CFB 00:BCEB: 00        .byte $00, $00, $00, $60   ; 
; DB 
- D 1 - I - 0x003CFF 00:BCEF: 6E        .byte $6E, $2A, $40, $40   ; 
- D 1 - I - 0x003D03 00:BCF3: 60        .byte $60, $2A, $40, $40   ; 
- D 1 - I - 0x003D07 00:BCF7: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003D0B 00:BCFB: 40        .byte $40, $2A, $40, $40   ; 
; DC 
- D 1 - I - 0x003D0F 00:BCFF: 40        .byte $40, $40, $69, $41   ; 
- D 1 - I - 0x003D13 00:BD03: 24        .byte $24, $24, $24, $4A   ; 
- D 1 - I - 0x003D17 00:BD07: 41        .byte $41, $41, $41, $26   ; 
- D 1 - I - 0x003D1B 00:BD0B: 41        .byte $41, $41, $41, $41   ; 
; DD 
- D 1 - I - 0x003D1F 00:BD0F: 41        .byte $41, $49, $00, $00   ; 
- D 1 - I - 0x003D23 00:BD13: 41        .byte $41, $5D, $00, $00   ; 
- D 1 - I - 0x003D27 00:BD17: 41        .byte $41, $41, $49, $00   ; 
- D 1 - I - 0x003D2B 00:BD1B: 4A        .byte $4A, $41, $5D, $00   ; 
; DE 
- D 1 - I - 0x003D2F 00:BD1F: 00        .byte $00, $00, $5F, $40   ; 
- D 1 - I - 0x003D33 00:BD23: 00        .byte $00, $00, $60, $40   ; 
- D 1 - I - 0x003D37 00:BD27: 3F        .byte $3F, $5F, $40, $40   ; 
- D 1 - I - 0x003D3B 00:BD2B: 00        .byte $00, $60, $40, $4F   ; 
; DF 
- D 1 - I - 0x003D3F 00:BD2F: 40        .byte $40, $2A, $40, $40   ; 
- D 1 - I - 0x003D43 00:BD33: 4F        .byte $4F, $24, $24, $24   ; 
- D 1 - I - 0x003D47 00:BD37: 67        .byte $67, $41, $41, $41   ; 
- D 1 - I - 0x003D4B 00:BD3B: 41        .byte $41, $41, $41, $41   ; 
; E0 
- D 1 - I - 0x003D4F 00:BD3F: 5E        .byte $5E, $41, $41, $49   ; 
- D 1 - I - 0x003D53 00:BD43: 41        .byte $41, $4A, $41, $76   ; 
- - - - - - 0x003D57 00:BD47: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x003D5B 00:BD4B: 00        .byte $00, $00, $00, $00   ; 
; E1 
- D 1 - I - 0x003D5F 00:BD4F: 5F        .byte $5F, $40, $40, $67   ; 
- D 1 - I - 0x003D63 00:BD53: 81        .byte $81, $40, $4F, $41   ; 
- - - - - - 0x003D67 00:BD57: 00        .byte $00, $00, $00, $00   ; 
- - - - - - 0x003D6B 00:BD5B: 00        .byte $00, $00, $00, $00   ; 
; E2 
- D 1 - I - 0x003D6F 00:BD5F: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003D73 00:BD63: 08        .byte $08, $08, $82, $83   ; 
- D 1 - I - 0x003D77 00:BD67: 86        .byte $86, $87, $88, $89   ; 
- D 1 - I - 0x003D7B 00:BD6B: 8F        .byte $8F, $90, $91, $92   ; 
; E3 
- D 1 - I - 0x003D7F 00:BD6F: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003D83 00:BD73: 84        .byte $84, $85, $08, $08   ; 
- D 1 - I - 0x003D87 00:BD77: 8A        .byte $8A, $8B, $8C, $86   ; 
- D 1 - I - 0x003D8B 00:BD7B: 93        .byte $93, $94, $95, $96   ; 
; E4 
- D 1 - I - 0x003D8F 00:BD7F: 08        .byte $08, $08, $98, $99   ; 
- D 1 - I - 0x003D93 00:BD83: 08        .byte $08, $08, $A3, $A4   ; 
- D 1 - I - 0x003D97 00:BD87: 08        .byte $08, $08, $AD, $AE   ; 
- D 1 - I - 0x003D9B 00:BD8B: 08        .byte $08, $08, $B4, $B5   ; 
; E5 
- D 1 - I - 0x003D9F 00:BD8F: 9A        .byte $9A, $9B, $9C, $9D   ; 
- D 1 - I - 0x003DA3 00:BD93: A5        .byte $A5, $A6, $A7, $00   ; 
- D 1 - I - 0x003DA7 00:BD97: AF        .byte $AF, $B0, $B1, $B2   ; 
- D 1 - I - 0x003DAB 00:BD9B: B6        .byte $B6, $B5, $B7, $B8   ; 
; E6 
- D 1 - I - 0x003DAF 00:BD9F: 9E        .byte $9E, $9F, $A0, $9A   ; 
- D 1 - I - 0x003DB3 00:BDA3: 00        .byte $00, $A8, $A9, $A5   ; 
- D 1 - I - 0x003DB7 00:BDA7: B2        .byte $B2, $B1, $AE, $AF   ; 
- D 1 - I - 0x003DBB 00:BDAB: B8        .byte $B8, $B9, $B5, $B6   ; 
; E7 
- D 1 - I - 0x003DBF 00:BDAF: A1        .byte $A1, $A2, $AC, $08   ; 
- D 1 - I - 0x003DC3 00:BDB3: AA        .byte $AA, $AB, $00, $08   ; 
- D 1 - I - 0x003DC7 00:BDB7: B0        .byte $B0, $B3, $00, $08   ; 
- D 1 - I - 0x003DCB 00:BDBB: B5        .byte $B5, $BA, $00, $08   ; 
; E8 
- D 1 - I - 0x003DCF 00:BDBF: 08        .byte $08, $08, $BB, $A7   ; 
- D 1 - I - 0x003DD3 00:BDC3: 08        .byte $08, $08, $C1, $B1   ; 
- D 1 - I - 0x003DD7 00:BDC7: 08        .byte $08, $08, $C6, $C7   ; 
- D 1 - I - 0x003DDB 00:BDCB: 08        .byte $08, $08, $CD, $CE   ; 
; E9 
- D 1 - I - 0x003DDF 00:BDCF: BC        .byte $BC, $A8, $BD, $BE   ; 
- D 1 - I - 0x003DE3 00:BDD3: 00        .byte $00, $B1, $C2, $C3   ; 
- D 1 - I - 0x003DE7 00:BDD7: C8        .byte $C8, $C7, $C9, $CA   ; 
- D 1 - I - 0x003DEB 00:BDDB: CF        .byte $CF, $D0, $D1, $D2   ; 
; EA 
- D 1 - I - 0x003DEF 00:BDDF: BE        .byte $BE, $BF, $A7, $BC   ; 
- D 1 - I - 0x003DF3 00:BDE3: C3        .byte $C3, $C4, $B1, $00   ; 
- D 1 - I - 0x003DF7 00:BDE7: CA        .byte $CA, $CB, $C7, $C8   ; 
- D 1 - I - 0x003DFB 00:BDEB: D2        .byte $D2, $D1, $D0, $CF   ; 
; EB 
- D 1 - I - 0x003DFF 00:BDEF: A8        .byte $A8, $C0, $00, $08   ; 
- D 1 - I - 0x003E03 00:BDF3: B1        .byte $B1, $C5, $00, $08   ; 
- D 1 - I - 0x003E07 00:BDF7: C7        .byte $C7, $CC, $00, $08   ; 
- D 1 - I - 0x003E0B 00:BDFB: D3        .byte $D3, $D4, $00, $08   ; 
; EC 
- D 1 - I - 0x003E0F 00:BDFF: 08        .byte $08, $08, $D5, $D6   ; 
- D 1 - I - 0x003E13 00:BE03: 08        .byte $08, $08, $DE, $DF   ; 
- D 1 - I - 0x003E17 00:BE07: 08        .byte $08, $08, $00, $00   ; 
- D 1 - I - 0x003E1B 00:BE0B: 08        .byte $08, $08, $08, $08   ; 
; ED 
- D 1 - I - 0x003E1F 00:BE0F: F3        .byte $F3, $D8, $D9, $DA   ; 
- D 1 - I - 0x003E23 00:BE13: E0        .byte $E0, $E0, $E1, $E2   ; 
- D 1 - I - 0x003E27 00:BE17: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003E2B 00:BE1B: 08        .byte $08, $08, $08, $08   ; 
; EE 
- D 1 - I - 0x003E2F 00:BE1F: DA        .byte $DA, $D9, $DB, $F3   ; 
- D 1 - I - 0x003E33 00:BE23: E2        .byte $E2, $E1, $E0, $E0   ; 
- D 1 - I - 0x003E37 00:BE27: 00        .byte $00, $00, $00, $00   ; 
- D 1 - I - 0x003E3B 00:BE2B: 08        .byte $08, $08, $08, $08   ; 
; EF 
- D 1 - I - 0x003E3F 00:BE2F: DC        .byte $DC, $DD, $00, $08   ; 
- D 1 - I - 0x003E43 00:BE33: E3        .byte $E3, $E4, $00, $08   ; 
- D 1 - I - 0x003E47 00:BE37: 00        .byte $00, $00, $00, $08   ; 
- D 1 - I - 0x003E4B 00:BE3B: 08        .byte $08, $08, $08, $08   ; 
; F0 
- D 1 - I - 0x003E4F 00:BE3F: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003E53 00:BE43: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003E57 00:BE47: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003E5B 00:BE4B: 08        .byte $08, $08, $8D, $8E   ; 
; F1 
- D 1 - I - 0x003E5F 00:BE4F: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003E63 00:BE53: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003E67 00:BE57: 08        .byte $08, $08, $08, $08   ; 
- D 1 - I - 0x003E6B 00:BE5B: 8E        .byte $8E, $97, $08, $08   ; 
; F2 
- - - - - - 0x003E6F 00:BE5F: 88        .byte $88, $89, $8A, $8B   ; 
- - - - - - 0x003E73 00:BE63: EB        .byte $EB, $EC, $ED, $EE   ; 
- - - - - - 0x003E77 00:BE67: 00        .byte $00, $EF, $EF, $F0   ; 
- - - - - - 0x003E7B 00:BE6B: EA        .byte $EA, $00, $00, $F1   ; 
; F3 
- - - - - - 0x003E7F 00:BE6F: AD        .byte $AD, $E5, $E6, $E7   ; 
- - - - - - 0x003E83 00:BE73: B4        .byte $B4, $E8, $E9, $E8   ; 
- - - - - - 0x003E87 00:BE77: BB        .byte $BB, $EA, $00, $F1   ; 
- - - - - - 0x003E8B 00:BE7B: C1        .byte $C1, $F2, $00, $F2   ; 
; F4 
- - - - - - 0x003E8F 00:BE7F: E5        .byte $E5, $E6, $E7, $B3   ; 
- - - - - - 0x003E93 00:BE83: E8        .byte $E8, $E9, $E8, $BA   ; 
- - - - - - 0x003E97 00:BE87: EA        .byte $EA, $00, $F1, $C0   ; 
- - - - - - 0x003E9B 00:BE8B: F2        .byte $F2, $00, $F2, $C5   ; 



_off007_0x003E9F_01_area_2:
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
- D 1 - I - 0x003E9F 00:BE8F: 00        .byte $00, $AA, $BE, $AA, $00, $8A, $AA, $AA, $00, $08, $AA, $00, $AA, $00, $AA, $00   ; 00
- D 1 - I - 0x003EAF 00:BE9F: 00        .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $AA   ; 10
- D 1 - I - 0x003EBF 00:BEAF: 00        .byte $00, $08, $0A, $EA, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 20
- D 1 - I - 0x003ECF 00:BEBF: AA        .byte $AA, $08, $AA, $AB, $00, $40, $0A, $AA, $00, $95, $AA, $AA, $A0, $A9, $AA, $AA   ; 30
- D 1 - I - 0x003EDF 00:BECF: 55        .byte $55, $D1, $F0, $F0, $74, $DD, $FF, $FF, $77, $55, $55, $55, $AA, $AA, $AA, $55   ; 40
- D 1 - I - 0x003EEF 00:BEDF: 56        .byte $56, $AA, $AA, $A9, $AA, $55, $55, $AA, $AA, $66, $99, $AA, $AA, $AA, $AA, $AA   ; 50
- D 1 - I - 0x003EFF 00:BEEF: 65        .byte $65, $A5, $95, $55, $55, $F0, $F0, $FF, $FF, $FF, $FF, $AA, $55, $55, $AA, $AA   ; 60
- D 1 - I - 0x003F0F 00:BEFF: AA        .byte $AA, $AA, $AA, $AA, $AA, $AA, $0A, $0A, $AA, $AA, $00, $00, $AA, $AA, $AA, $AA   ; 70
- D 1 - I - 0x003F1F 00:BF0F: AA        .byte $AA, $AA, $AA, $0A, $A5, $A5, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA   ; 80
- D 1 - I - 0x003F2F 00:BF1F: FF        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $AA, $AA, $AA, $AA, $AA, $AA, $AA   ; 90
- D 1 - I - 0x003F3F 00:BF2F: AA        .byte $AA, $AA, $AA, $AA, $00, $AA, $AA, $AA, $AA, $AA, $AA, $00, $AA, $AA, $AA, $AA   ; A0
- D 1 - I - 0x003F4F 00:BF3F: AA        .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA   ; B0
- D 1 - I - 0x003F5F 00:BF4F: FE        .byte $FE, $5A, $5A, $55, $55, $55, $55, $AA, $A5, $A5, $A5, $56, $AA, $AA, $55, $59   ; C0
- D 1 - I - 0x003F6F 00:BF5F: 55        .byte $55, $AA, $AA, $AA, $FF, $55, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA   ; D0
- D 1 - I - 0x003F7F 00:BF6F: FA        .byte $FA, $FA, $35, $C5, $19, $8A, $2A, $46, $99, $AA, $AA, $66, $59, $5A, $5A, $56   ; E0
- D 1 - I - 0x003F8F 00:BF7F: 55        .byte $55, $55, $A0, $A0, $A0                                                          ; F0






.segment "BANK_2F"
                                        .byte con_prg_bank + $2F   ; 
















.out .sprintf("Free bytes in bank 2F: %Xh [%d]", ($BFFF - *), ($BFFF - *))

.segment "BANK_2Fb"
    .byte con_prg_bank + $2F   ; 
