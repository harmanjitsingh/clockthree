PCBNEW-LibModule-V1  05/15/11 23:23:19
# encoding utf-8
$INDEX
C1
C1-1
C2
R1
PIN_ARRAY_4x1
TQFP32
SOT23-5
SO14E
C1.5V8V
PIN_ARRAY-6X1
SOT23-3
Memory_Card_SD_3M
Switch_SMT
XTAL
Memory_Card_SD_Tyco
I/O
ISP
CONN_I/O
WP_CD
c_0805
r_0805
d_0805
$EndINDEX
$MODULE Memory_Card_SD_3M
Po 0 0 0 15 4DCBACDF 00000000 ~~
Li Memory_Card_SD_3M
Kw SD Memory Card Connector 3M SD-RSMT-2-MQ-WF Push-Push R/A SMD
Sc 00000000
AR Memory_Card_SD_3M
Op 0 0 0
T0 0 5500 240 240 0 60 N V 21 N "Memory_Card_SD_3M"
T1 0 6250 240 240 0 60 N V 21 N "VAL**"
DS -5512 315 -5512 12638 60 21
DS 5512 315 5512 12638 60 21
DS -5500 12650 5500 12650 60 21
DA 50 15636 -2950 12636 900 60 21
DS -5512 315 5512 315 60 21
$PAD
Sh "4" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -256 0
$EndPAD
$PAD
Sh "3" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 728 0
$EndPAD
$PAD
Sh "2" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1712 0
$EndPAD
$PAD
Sh "1" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 2697 0
$EndPAD
$PAD
Sh "9" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 3681 0
$EndPAD
$PAD
Sh "5" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1240 0
$EndPAD
$PAD
Sh "6" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -2225 0
$EndPAD
$PAD
Sh "7" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -3182 0
$EndPAD
$PAD
Sh "8" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -3851 0
$EndPAD
$PAD
Sh "CD" R 276 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -4363 0
$EndPAD
$PAD
Sh "WP" R 276 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -4835 0
$EndPAD
$PAD
Sh "16" C 630 630 0 0 0
Dr 630 0 0
At STD N 00C0FFFF
Ne 0 ""
Po 3681 1112
$EndPAD
$PAD
Sh "17" C 433 433 0 0 0
Dr 433 0 0
At STD N 00C0FFFF
Ne 0 ""
Po -4587 1112
$EndPAD
$PAD
Sh "GP3" R 787 1181 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -5925 10925
$EndPAD
$PAD
Sh "10" R 787 1181 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 5925 10925
$EndPAD
$EndMODULE  Memory_Card_SD_3M
$MODULE C1
Po 0 0 0 15 4DCB8D3D 00000000 ~~
Li C1
Cd Condensateur e = 1 pas
Kw C
Sc 00000000
AR
Op 0 0 0
T0 1500 -200 400 400 0 80 N V 21 N "C1"
T1 0 -900 400 400 0 80 N I 21 N "V***"
DS -980 -500 1000 -500 120 21
DS 1000 -500 1000 500 120 21
DS 1000 500 -1000 500 120 21
DS -1000 500 -1000 -500 120 21
DS -1000 -250 -750 -500 120 21
$PAD
Sh "1" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -500 0
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 500 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\capa_1_pas.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  C1
$MODULE C1-1
Po 0 0 0 15 4DCB8E60 00000000 ~~
Li C1-1
Cd Condensateur e = 1 ou 2 pas
Kw C
Sc 00000000
AR C1-1
Op 0 0 0
T0 0 -700 400 400 0 80 N V 21 N "C1-1"
T1 0 800 400 400 0 80 N I 21 N "C***"
DS -1200 -500 -1500 -200 150 21
DS -1500 -500 -1500 500 150 21
DS -1500 500 1500 500 150 21
DS 1500 500 1500 -500 150 21
DS 1500 -500 -1500 -500 150 21
$PAD
Sh "1" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1000 0
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1000 0
$EndPAD
$PAD
Sh "3" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\capa_2pas_5x5mm.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  C1-1
$MODULE C1.5V8V
Po 0 0 0 15 4DCB938E 00000000 ~~
Li C1.5V8V
Sc 00000000
AR
Op 0 0 0
T0 0 900 400 400 0 80 N V 21 N "C1.5V8V"
T1 0 -900 400 400 0 80 N V 21 N "V***"
T2 -1500 -1500 600 600 0 120 N V 21 N "+"
DC 0 0 0 1750 150 21
$PAD
Sh "1" R 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -750 0
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 750 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\c_vert_c2v8.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  C1.5V8V
$MODULE C2
Po 0 0 0 15 4DCB8E44 00000000 ~~
Li C2
Cd Condensateur = 2 pas
Kw C
Sc 00000000
AR
Op 0 0 0
T0 0 -700 400 400 0 80 N V 21 N "C2"
T1 0 0 400 400 0 80 N I 21 N "C***"
DS -1200 -500 -1500 -200 150 21
DS -1500 -500 -1500 500 150 21
DS -1500 500 1500 500 150 21
DS 1500 500 1500 -500 150 21
DS 1500 -500 -1500 -500 150 21
$PAD
Sh "1" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1000 0
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1000 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\capa_2pas_5x5mm.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  C2
$MODULE PIN_ARRAY-6X1
Po 0 0 0 15 4DCB9416 00000000 ~~
Li PIN_ARRAY-6X1
Cd Connecteur 6 pins
Kw CONN DEV
Sc 00000000
AR
Op 0 0 0
T0 0 -850 400 400 0 80 N V 21 N "PIN_ARRAY-6X1"
T1 0 850 400 350 0 80 N I 21 N "Val**"
DS -3000 500 -3000 -500 120 21
DS -3000 -500 3000 -500 120 21
DS 3000 -500 3000 500 120 21
DS 3000 500 -3000 500 120 21
DS -2000 500 -2000 -500 120 21
$PAD
Sh "1" R 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -2500 0
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1500 0
$EndPAD
$PAD
Sh "3" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -500 0
$EndPAD
$PAD
Sh "4" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 500 0
$EndPAD
$PAD
Sh "5" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1500 0
$EndPAD
$PAD
Sh "6" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 2500 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\pins_array_6x1.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  PIN_ARRAY-6X1
$MODULE PIN_ARRAY_4x1
Po 0 0 0 15 4DCB8EF3 00000000 ~~
Li PIN_ARRAY_4x1
Cd Double rangee de contacts 2 x 5 pins
Kw CONN
Sc 00000000
AR
Op 0 0 0
T0 0 -1000 400 400 0 80 N V 21 N "PIN_ARRAY_4X1"
T1 0 1000 400 400 0 80 N I 21 N "Val**"
DS 2000 500 -2000 500 100 21
DS 2000 -500 -2000 -500 100 21
DS -2000 -500 -2000 500 100 21
DS 2000 500 2000 -500 100 21
$PAD
Sh "1" R 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1500 0
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -500 0
$EndPAD
$PAD
Sh "3" C 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 500 0
$EndPAD
$PAD
Sh "4" C 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1500 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\pins_array_4x1.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  PIN_ARRAY_4x1
$MODULE R1
Po 0 0 0 15 4DCB8E9A 00000000 ~~
Li R1
Cd Resistance verticale
Kw R
Sc 00000000
AR
Op A A 0
T0 0 -900 550 500 0 80 N V 21 N "R1"
T1 -450 1000 550 500 0 80 N I 21 N "VAL*"
DS -200 0 200 0 150 21
DC -500 0 -250 500 150 21
$PAD
Sh "1" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -500 0
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 500 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\verti_resistor.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  R1
$MODULE SO14E
Po 0 0 0 15 4DCB92E5 00000000 ~~
Li SO14E
Cd module CMS SOJ 14 pins etroit
Kw CMS SOJ
Sc 00000000
AR
Op 0 0 0
At SMD
T0 0 -300 400 450 0 50 N V 21 N "SO14E"
T1 0 400 400 400 0 50 N V 21 N "Val****"
DC -1700 600 -1800 600 50 21
DS -1900 -700 1900 -700 80 21
DS 1900 -700 1900 800 80 21
DS 1900 800 -1900 800 80 21
DS -1900 800 -1900 -700 80 21
DS -1900 -200 -1600 -200 80 21
DS -1600 -200 -1600 200 80 21
DS -1600 200 -1900 200 80 21
$PAD
Sh "1" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1500 1100
$EndPAD
$PAD
Sh "2" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1000 1100
$EndPAD
$PAD
Sh "3" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -500 1100
$EndPAD
$PAD
Sh "4" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 1100
$EndPAD
$PAD
Sh "5" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 500 1100
$EndPAD
$PAD
Sh "6" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1000 1100
$EndPAD
$PAD
Sh "7" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1500 1100
$EndPAD
$PAD
Sh "8" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1500 -1000
$EndPAD
$PAD
Sh "9" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1000 -1000
$EndPAD
$PAD
Sh "10" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 500 -1000
$EndPAD
$PAD
Sh "11" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 -1000
$EndPAD
$PAD
Sh "12" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -500 -1000
$EndPAD
$PAD
Sh "13" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1000 -1000
$EndPAD
$PAD
Sh "14" R 200 450 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1500 -1000
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\cms_so14.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  SO14E
$MODULE SOT23-3
Po 0 0 0 15 4DCBA5F0 00000000 ~~
Li SOT23-3
Cd SOT23-5
Sc 00000000
AR
Op 0 0 0
At SMD
T0 0 -900 300 250 0 50 N V 21 N "SOT23-3"
T1 0 0 300 250 0 50 N I 21 N "VAL***"
DS -600 300 -700 200 50 21
DC -500 100 -600 100 50 21
DS 600 300 700 300 50 21
DS 700 300 700 -300 50 21
DS 700 -300 200 -300 50 21
DS -200 300 200 300 50 21
DS -200 -300 -700 -300 50 21
DS -700 -300 -700 300 50 21
DS -700 300 -600 300 50 21
$PAD
Sh "1" R 300 400 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -375 500
$EndPAD
$PAD
Sh "3" R 300 400 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 -500
$EndPAD
$PAD
Sh "2" R 300 400 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 400 500
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\SOT23_3.wrl"
Sc 0.500000 0.500000 0.500000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 180.000000
$EndSHAPE3D
$EndMODULE  SOT23-3
$MODULE Switch_SMT
Po 0 0 0 15 498EB7D0 00000000 ~~
Li Switch_SMT
Cd EVQ-Q2F03W Compatible
Kw Switch SMT
Sc 00000000
AR
Op 0 0 0
T0 0 0 280 180 0 40 N I 21 N "Switch_SMT"
T1 0 1274 260 220 0 55 N V 21 N "Val**"
DS -882 1176 -1274 1176 70 21
DS 1274 1176 882 1176 70 21
DS -1274 -1176 -882 -1176 70 21
DS 1274 -1176 882 -1176 70 21
DS -1274 -490 -1274 490 70 21
DS 1274 490 1274 -490 70 21
DC 0 0 450 75 80 21
$PAD
Sh "1" R 787 551 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1000 -800
$EndPAD
$PAD
Sh "2" R 787 551 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1000 800
$EndPAD
$PAD
Sh "1" R 787 551 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1000 -800
$EndPAD
$PAD
Sh "2" R 787 551 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1000 800
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\pcb_push.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 90.000000
$EndSHAPE3D
$EndMODULE  Switch_SMT
$MODULE TQFP32
Po 0 0 0 15 4DCB8FBA 00000000 ~~
Li TQFP32
Sc 00000000
AR
Op 0 0 0
T0 0 -500 500 400 0 80 N V 21 N "TQFP32"
T1 0 750 500 400 0 80 N V 21 N "VAL**"
DS -1400 -1100 -1400 1400 80 21
DS -1400 1400 1400 1400 80 21
DS 1400 1400 1400 -1400 80 21
DS 1400 -1400 -1100 -1400 80 21
DS -1100 -1400 -1400 -1100 80 21
DC -1018 -1026 -858 -926 60 21
$PAD
Sh "8" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 11 "N-000033"
Po -1896 1093
$EndPAD
$PAD
Sh "7" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 12 "N-000034"
Po -1896 778
$EndPAD
$PAD
Sh "6" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 14 "N-000036"
Po -1896 463
$EndPAD
$PAD
Sh "5" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 13 "N-000035"
Po -1896 148
$EndPAD
$PAD
Sh "4" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 19 "VCC"
Po -1896 -167
$EndPAD
$PAD
Sh "3" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 19 "VCC"
Po -1896 -482
$EndPAD
$PAD
Sh "2" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 6 "N-000015"
Po -1896 -797
$EndPAD
$PAD
Sh "1" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 7 "N-000016"
Po -1896 -1112
$EndPAD
$PAD
Sh "24" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 18 "N-000055"
Po 1870 -1110
$EndPAD
$PAD
Sh "17" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 1 "GND"
Po 1870 1100
$EndPAD
$PAD
Sh "18" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1870 780
$EndPAD
$PAD
Sh "19" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1870 460
$EndPAD
$PAD
Sh "20" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 3 "N-000007"
Po 1870 150
$EndPAD
$PAD
Sh "21" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 16 "N-000047"
Po 1870 -170
$EndPAD
$PAD
Sh "22" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 4 "N-000008"
Po 1870 -480
$EndPAD
$PAD
Sh "23" R 787 177 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 15 "N-000044"
Po 1870 -800
$EndPAD
$PAD
Sh "32" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 8 "N-000017"
Po -1112 -1900
$EndPAD
$PAD
Sh "31" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 1 "GND"
Po -798 -1900
$EndPAD
$PAD
Sh "30" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 5 "N-000009"
Po -482 -1900
$EndPAD
$PAD
Sh "29" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 1 "GND"
Po -168 -1900
$EndPAD
$PAD
Sh "28" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 9 "N-000018"
Po 148 -1900
$EndPAD
$PAD
Sh "27" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 10 "N-000019"
Po 462 -1900
$EndPAD
$PAD
Sh "26" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 19 "VCC"
Po 778 -1900
$EndPAD
$PAD
Sh "25" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 17 "N-000048"
Po 1092 -1900
$EndPAD
$PAD
Sh "9" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 1 "GND"
Po -1110 1880
$EndPAD
$PAD
Sh "10" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -800 1880
$EndPAD
$PAD
Sh "11" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 2 "N-000001"
Po -480 1880
$EndPAD
$PAD
Sh "12" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 2 "N-000001"
Po -170 1880
$EndPAD
$PAD
Sh "13" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 19 "VCC"
Po 140 1880
$EndPAD
$PAD
Sh "14" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 1 "GND"
Po 460 1880
$EndPAD
$PAD
Sh "15" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 780 1880
$EndPAD
$PAD
Sh "16" R 177 787 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1100 1880
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\tqfp32.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  TQFP32
$MODULE XTAL
Po 0 0 0 15 4DCBAEFB 00000000 ~~
Li XTAL
Cd Condensateur e = 1 ou 2 pas
Kw C
Sc 00000000
AR
Op 0 0 0
T0 0 -750 600 600 0 60 N V 21 N "XTAL"
T1 0 1000 600 600 0 60 N V 21 N "C***"
DS -1400 -400 1400 -400 120 21
DS 1400 -400 1400 400 120 21
DS 1400 400 -1400 400 120 21
DS -1400 400 -1400 -400 120 21
DS -1400 -200 -1200 -400 120 21
$PAD
Sh "1" C 700 700 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1000 0
$EndPAD
$PAD
Sh "2" C 700 700 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1000 0
$EndPAD
$PAD
Sh "3" C 700 700 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\capa_2pas_5x5mm.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  XTAL
$MODULE Memory_Card_SD_Tyco
Po 0 0 0 15 4DCCC556 00000000 ~~
Li Memory_Card_SD_Tyco
Kw SD Memory Card Connector 3M SD-RSMT-2-MQ-WF Push-Push R/A SMD
Sc 00000000
AR Memory_Card_SD_3M
Op 0 0 0
T0 0 5500 500 500 0 60 N V 21 N "Memory_Card_SD_Tyco"
T1 0 7000 500 500 0 60 N V 21 N "VAL**"
DS 0 591 -4724 591 79 21
DS -4724 591 -4724 13031 79 21
DS -4724 13031 0 13031 79 21
DS 0 13031 4724 13031 79 21
DS 4724 13031 4724 2047 79 21
DS 3228 591 0 591 79 21
DS 4213 1457 4213 2795 79 21
DS 4213 1457 4961 1457 79 21
DS 4961 1457 4961 197 79 21
DS 4961 197 4173 197 79 21
DS 5236 8819 5236 3858 79 21
DS 5236 10079 5236 10276 79 21
DS 5236 10079 5709 10079 79 21
DS 5709 10079 5709 8819 79 21
DS 5709 8819 5236 8819 79 21
DS -5118 1496 -5709 1496 79 21
DS -5709 1496 -5709 236 79 21
DS -5709 236 -5118 236 79 21
DS -5118 10276 -5118 10118 79 21
DS -5118 10118 -5709 10118 79 21
DS -5709 10118 -5709 8819 79 21
DS -5709 8819 -5118 8819 79 21
DS -5118 1496 -5118 8819 79 21
DS -4921 433 0 433 79 21
DS 0 433 4213 433 79 21
DS 4213 2795 5236 3858 79 21
DS 0 10276 5236 10276 79 21
DS -5118 10276 0 10276 79 21
DA 50 15990 -2950 12990 900 60 21
$PAD
Sh "4" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -256 0
$EndPAD
$PAD
Sh "3" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 728 0
$EndPAD
$PAD
Sh "2" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1712 0
$EndPAD
$PAD
Sh "1" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 2697 0
$EndPAD
$PAD
Sh "9" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 3681 0
$EndPAD
$PAD
Sh "5" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1240 0
$EndPAD
$PAD
Sh "6" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -2225 0
$EndPAD
$PAD
Sh "7" R 394 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -3182 0
$EndPAD
$PAD
Sh "8" R 365 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -3851 0
$EndPAD
$PAD
Sh "CD" R 250 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -4363 0
$EndPAD
$PAD
Sh "WP" R 250 610 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -4835 0
$EndPAD
$PAD
Sh "16" C 630 630 0 0 0
Dr 630 0 0
At STD N 00C0FFFF
Ne 0 ""
Po 3701 1102
$EndPAD
$PAD
Sh "17" C 433 433 0 0 0
Dr 433 0 0
At STD N 00C0FFFF
Ne 0 ""
Po -4528 1102
$EndPAD
$PAD
Sh "12" R 591 1102 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -5315 9449
$EndPAD
$PAD
Sh "11" R 591 1102 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 5315 9449
$EndPAD
$PAD
Sh "GP3" R 500 1000 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -5315 866
$EndPAD
$PAD
Sh "10" R 591 1102 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 4567 827
$EndPAD
$EndMODULE  Memory_Card_SD_Tyco
$MODULE CONN_I/O
Po 0 0 0 15 4DCD2169 00000000 ~~
Li CONN_I/O
Cd Double rangee de contacts 2 x 5 pins
Kw CONN
Sc 00000000
AR
Op 0 0 0
T0 0 -1000 400 400 0 80 N I 21 N "CONN_I/O"
T1 0 1000 400 400 0 80 N I 21 N "Val**"
DS 2000 500 -2000 500 100 21
DS 2000 -500 -2000 -500 100 21
DS -2000 -500 -2000 500 100 21
DS 2000 500 2000 -500 100 21
$PAD
Sh "1" R 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1500 0
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -500 0
$EndPAD
$PAD
Sh "3" C 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 500 0
$EndPAD
$PAD
Sh "4" C 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1500 0
$EndPAD
$PAD
Sh "1" O 500 900 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1500 -700
$EndPAD
$PAD
Sh "2" O 500 900 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -500 -700
$EndPAD
$PAD
Sh "3" O 500 900 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 500 -700
$EndPAD
$PAD
Sh "4" O 500 900 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1500 -700
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\pins_array_4x1.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  CONN_I/O
$MODULE ISP
Po 0 0 0 15 4DCD208D 00000000 ~~
Li ISP
Cd Connecteur 6 pins
Kw CONN DEV
Sc 00000000
AR
Op 0 0 0
T0 0 -1800 400 400 0 80 N V 21 N "ISP"
T1 0 1000 400 350 0 80 N I 21 N "Val**"
DS 500 -500 -500 -500 100 21
DS -500 -500 -500 -1500 100 21
DS -500 -1500 2500 -1500 100 21
DS 2500 -1500 2500 500 100 21
DS 2500 500 -500 500 100 21
DS -500 500 -500 -500 100 21
DS 500 500 500 -500 100 21
$PAD
Sh "1" R 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0 0
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0 -1000
$EndPAD
$PAD
Sh "3" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1000 0
$EndPAD
$PAD
Sh "4" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1000 -1000
$EndPAD
$PAD
Sh "5" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 2000 0
$EndPAD
$PAD
Sh "6" C 800 800 0 0 0
Dr 320 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 2000 -1000
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\pin_strip_3x2.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.100000 0.050000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  ISP
$MODULE WP_CD
Po 0 0 0 15 4DCD2530 00000000 ~~
Li WP_CD
Cd Double rangee de contacts 2 x 2 pins
Kw CONN
Sc 00000000
AR WP_CD
Op 0 0 0
T0 0 -1300 400 400 0 80 N I 21 N "WP_CD"
T1 0 1300 400 400 0 80 N I 21 N "Val**"
DS -1000 -1000 1000 -1000 120 21
DS 1000 -1000 1000 1000 120 21
DS 1000 1000 -1000 1000 120 21
DS -1000 1000 -1000 -1000 120 21
$PAD
Sh "1" R 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -500 500
$EndPAD
$PAD
Sh "2" C 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -500 -500
$EndPAD
$PAD
Sh "3" C 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 500 500
$EndPAD
$PAD
Sh "4" C 800 800 0 0 0
Dr 400 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 500 -500
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\pins_array_2x2.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  WP_CD
$MODULE I/O
Po 0 0 0 15 4DCD2871 00000000 ~~
Li I/O
Sc 00000000
AR
Op 0 0 0
T0 0 -200 300 300 0 30 N I 21 N "I/O"
T1 0 200 300 300 0 30 N I 21 N "B*"
$PAD
Sh "1" C 400 400 0 0 0
Dr 200 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0 0
$EndPAD
$EndMODULE  I/O
$MODULE SOT23-5
Po 0 0 0 15 4DCE6CF2 00000000 ~~
Li SOT23-5
Cd SOT23-5
Sc 00000000
AR
Op 0 0 0
At SMD
T0 0 -900 300 250 0 50 N V 21 N "SOT23-5"
T1 0 150 300 250 0 50 N I 21 N "VAL***"
DC -500 100 -600 100 50 21
DS -600 300 -700 200 50 21
DS 600 300 700 300 50 21
DS 700 300 700 -300 50 21
DS 700 -300 200 -300 50 21
DS -200 300 200 300 50 21
DS -200 -300 -700 -300 50 21
DS -700 -300 -700 300 50 21
DS -700 300 -600 300 50 21
$PAD
Sh "1" R 300 400 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -375 500
$EndPAD
$PAD
Sh "3" R 300 400 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 -500
$EndPAD
$PAD
Sh "2" R 300 400 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 400 500
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\SOT23_3.wrl"
Sc 0.500000 0.500000 0.500000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 180.000000
$EndSHAPE3D
$EndMODULE  SOT23-5
$MODULE d_0805
Po 0 0 0 15 4DD01038 00000000 ~~
Li d_0805
Cd SMT LED, 0805
Sc 00000000
AR
Op 0 0 0
T0 0 -500 200 200 0 20 N V 21 N "d_0805"
T1 0 600 200 200 0 20 N I 21 N "D***"
DA 700 0 700 100 900 50 21
DA 700 0 600 0 900 50 21
DS 700 300 600 400 50 21
DS 200 400 700 400 50 21
DS 700 400 700 -400 50 21
DS 700 -400 200 -400 50 21
DS -200 -400 -700 -400 50 21
DS -700 -400 -700 400 50 21
DS -700 400 -200 400 50 21
$PAD
Sh "1" R 512 590 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 375 0
$EndPAD
$PAD
Sh "2" R 512 590 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -375 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\r_0805.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  d_0805
$MODULE r_0805
Po 0 0 0 15 4DD00E60 00000000 ~~
Li r_0805
Cd SMT resistor, 0805
Sc 00000000
AR
Op 0 0 0
T0 0 -500 200 200 0 20 N V 21 N "r_0805"
T1 0 600 200 200 0 20 N I 21 N "R***"
DS 200 400 700 400 50 21
DS 700 400 700 -400 50 21
DS 700 -400 200 -400 50 21
DS -200 -400 -700 -400 50 21
DS -700 -400 -700 400 50 21
DS -700 400 -200 400 50 21
$PAD
Sh "1" R 512 590 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 375 0
$EndPAD
$PAD
Sh "2" R 512 590 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -375 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\r_0805.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  r_0805
$MODULE c_0805
Po 0 0 0 15 4DD00CED 00000000 ~~
Li c_0805
Cd SMT capacitor, 0805
Sc 00000000
AR 
Op 0 0 0
T0 0 -500 200 200 0 20 N V 21 N "c_0805"
T1 0 600 200 200 0 20 N I 21 N "C***"
DS 700 300 600 400 50 21
DS 200 400 700 400 50 21
DS 700 400 700 -400 50 21
DS 700 -400 200 -400 50 21
DS -200 -400 -700 -400 50 21
DS -700 -400 -700 400 50 21
DS -700 400 -200 400 50 21
$PAD
Sh "1" R 512 590 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 375 0
$EndPAD
$PAD
Sh "2" R 512 590 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -375 0
$EndPAD
$SHAPE3D
Na "libs\\3D Modules\\c_0805.wrl"
Sc 1.000000 1.000000 1.000000
Of 0.000000 0.000000 0.000000
Ro 0.000000 0.000000 0.000000
$EndSHAPE3D
$EndMODULE  c_0805
$EndLIBRARY
