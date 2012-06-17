EESchema Schematic File Version 2  date Sunday 17 June 2012 04:58:56 PM IST
LIBS:aLaMode
LIBS:power
LIBS:aLaMode_v1-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 2 4
Title "aLaMode"
Date "17 jun 2012"
Rev "1"
Comp "WyoLum"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FUSE F1
U 1 1 4FDCE35C
P 2750 1100
F 0 "F1" H 2850 1100 60  0000 C CNN
F 1 "nanoSMDC110F" H 2675 1175 50  0000 C CNN
F 2 "f_1206" H 2750 1100 60  0001 C CNN
	1    2750 1100
	1    0    0    -1  
$EndComp
Connection ~ 2100 2700
Wire Wire Line
	1900 2700 2100 2700
Connection ~ 6525 5350
Wire Wire Line
	6525 5200 6525 5350
Connection ~ 2100 2350
Wire Wire Line
	2100 2350 1900 2350
Connection ~ 2100 2050
Wire Wire Line
	1900 2050 2100 2050
Wire Wire Line
	3650 1700 3650 1975
Connection ~ 4100 1700
Wire Wire Line
	4750 1700 1900 1700
Connection ~ 3650 1700
Wire Wire Line
	4100 1600 4100 1700
Wire Wire Line
	1900 1100 2400 1100
Wire Wire Line
	9825 5475 9825 5600
Wire Wire Line
	9800 2850 9800 2775
Wire Wire Line
	9800 2775 10075 2775
Wire Wire Line
	10075 2775 10075 2725
Wire Wire Line
	5050 6025 5050 4425
Wire Wire Line
	10100 2100 10100 2250
Wire Wire Line
	10100 2250 9800 2250
Wire Wire Line
	9800 2250 9800 2100
Wire Wire Line
	5525 5450 5525 4725
Wire Wire Line
	9475 6275 9475 6325
Wire Wire Line
	8825 4875 8825 4800
Wire Wire Line
	8425 5175 8225 5175
Wire Wire Line
	3800 7200 3800 6975
Wire Wire Line
	5050 4425 5575 4425
Connection ~ 5525 4425
Wire Wire Line
	5575 4575 5525 4575
Wire Wire Line
	2675 5675 4550 5675
Wire Wire Line
	2675 5775 3350 5775
Wire Wire Line
	3350 5775 3350 6675
Wire Wire Line
	3350 6675 3400 6675
Wire Wire Line
	3000 7025 3000 7100
Wire Wire Line
	3000 6425 3000 6525
Wire Wire Line
	3525 3750 3125 3750
Connection ~ 4475 3750
Wire Wire Line
	4325 3900 4475 3900
Connection ~ 3925 4400
Wire Wire Line
	3925 4300 3925 4400
Wire Wire Line
	7300 5350 2700 5350
Connection ~ 2700 3950
Wire Wire Line
	2700 5350 2700 3850
Wire Wire Line
	2050 3750 2725 3750
Connection ~ 5525 5350
Wire Wire Line
	3350 4300 3350 4400
Wire Wire Line
	3350 4400 4750 4400
Connection ~ 6950 5350
Wire Wire Line
	5525 4575 5525 3600
Wire Wire Line
	4750 3750 4750 3800
Connection ~ 6950 4425
Wire Wire Line
	6950 5350 6950 5200
Wire Wire Line
	4750 4400 4750 4250
Connection ~ 5525 3750
Connection ~ 4475 4400
Wire Wire Line
	2700 3850 2050 3850
Wire Wire Line
	2050 3950 2700 3950
Wire Wire Line
	4475 4500 4475 4375
Wire Wire Line
	6375 4425 7300 4425
Wire Wire Line
	7300 3750 4325 3750
Connection ~ 4750 3750
Wire Wire Line
	4475 3750 4475 3975
Connection ~ 4475 3900
Connection ~ 3350 3750
Wire Wire Line
	3400 6475 3000 6475
Connection ~ 3000 6475
Wire Wire Line
	3000 5925 3000 5875
Wire Wire Line
	3000 5875 2675 5875
Wire Wire Line
	4800 6325 4800 6575
Wire Wire Line
	4800 6575 4400 6575
Wire Wire Line
	5525 4725 5575 4725
Wire Wire Line
	3800 5975 3800 6175
Wire Wire Line
	3000 7100 3800 7100
Connection ~ 3800 7100
Wire Wire Line
	8425 5375 8350 5375
Wire Wire Line
	8350 5375 8350 5725
Wire Wire Line
	8350 5725 9475 5725
Wire Wire Line
	9425 5275 9475 5275
Wire Wire Line
	8825 5675 8825 6875
Wire Wire Line
	9475 5275 9475 5775
Connection ~ 9475 5725
Wire Wire Line
	9475 6725 9475 6775
Wire Wire Line
	9475 6775 8825 6775
Connection ~ 8825 6775
Wire Wire Line
	3350 3650 3350 3850
Wire Wire Line
	4550 5675 4550 6025
Wire Wire Line
	2625 3650 2625 3750
Connection ~ 2625 3750
Wire Wire Line
	6950 4275 6950 4800
Wire Wire Line
	9825 5075 9825 4800
Wire Wire Line
	4100 1200 4100 1100
Connection ~ 3650 1100
Connection ~ 4100 1100
Wire Wire Line
	4750 1100 3100 1100
Wire Wire Line
	1900 1900 2100 1900
Wire Wire Line
	2100 1900 2100 2950
Wire Wire Line
	2100 2200 1900 2200
Connection ~ 2100 2200
Wire Wire Line
	6375 4725 6525 4725
Wire Wire Line
	6525 4725 6525 4800
Wire Wire Line
	1900 2550 2100 2550
Connection ~ 2100 2550
Text Notes 5400 1200 0    60   ~ 12
If using Micro USB -B socket, \nDO NOT INSTALL :\nP10, D5, U3\nApply solder bridge between Pins 2 and 3 of U3\n\nIf using Barrel Socket,\nDO NOT INSTALL :\nP12, F1, D7, C15
$Comp
L C C16
U 1 1 4FDB1F26
P 6525 5000
F 0 "C16" H 6575 5100 50  0000 L CNN
F 1 "10n" H 6575 4900 50  0000 L CNN
F 2 "c_0805" H 6525 5000 60  0001 C CNN
	1    6525 5000
	-1   0    0    -1  
$EndComp
Text Notes 1175 2875 0    40   ~ 0
TE - 1981568-1\nor\nFCI - 10118193-0001LF
Text Notes 2900 1550 0    40   ~ 0
Bi-directional clamping\nDiode, 5V
Text Notes 2350 1350 0    40   ~ 0
Polyswitch resettable fuse\n1.1A Hold, 2.2A Trip 8V max.
Text Label 2150 3750 0    40   ~ 0
PWR_IN
Text Label 2050 1100 0    40   ~ 0
USB_IN
NoConn ~ 1900 1550
NoConn ~ 1900 1400
NoConn ~ 1900 1250
$Comp
L GND #PWR06
U 1 1 4FDA1E9F
P 2100 2950
F 0 "#PWR06" H 2100 2950 30  0001 C CNN
F 1 "GND" H 2100 2880 30  0001 C CNN
	1    2100 2950
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 4FDA1E91
P 3650 1975
F 0 "#PWR07" H 3650 1975 30  0001 C CNN
F 1 "GND" H 3650 1905 30  0001 C CNN
	1    3650 1975
	-1   0    0    -1  
$EndComp
Text Label 4750 1700 0    40   ~ 0
GND
Text Label 4750 1100 0    40   ~ 0
5V0
$Comp
L C C15
U 1 1 4FDA1E4C
P 4100 1400
F 0 "C15" H 4125 1475 50  0000 L CNN
F 1 "1n" H 4125 1325 50  0000 L CNN
F 2 "c_0805" H 4100 1400 60  0001 C CNN
	1    4100 1400
	-1   0    0    -1  
$EndComp
$Comp
L DIODE_TRANSIL D7
U 1 1 4FDA1DDC
P 3650 1400
F 0 "D7" H 3800 1450 60  0000 C CNN
F 1 "SMBJ5.0CA-TR" H 3650 1800 60  0000 C CNN
F 2 "diode-DO214AA" H 3650 1900 60  0001 C CNN
	1    3650 1400
	1    0    0    -1  
$EndComp
$Comp
L UUSB_B P12
U 1 1 4FDA1DB8
P 1550 1400
F 0 "P12" H 1550 1950 60  0000 C CNN
F 1 "UUSB_B" H 1550 1850 60  0000 C CNN
F 2 "USB_B_Micro" H 1550 1950 60  0001 C CNN
	1    1550 1400
	1    0    0    -1  
$EndComp
Text Label 8925 6775 0    40   ~ 0
GND
Text Label 9825 4800 0    40   ~ 0
5V0
Text Label 8825 4800 0    40   ~ 0
5V0
Text Label 3800 5975 0    40   ~ 0
5V0
$Comp
L GND #PWR08
U 1 1 4FC9E540
P 9825 5600
F 0 "#PWR08" H 9825 5600 30  0001 C CNN
F 1 "GND" H 9825 5530 30  0001 C CNN
	1    9825 5600
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR09
U 1 1 4FC9DF2C
P 6950 4275
F 0 "#PWR09" H 6950 4235 30  0001 C CNN
F 1 "+3.3V" H 6950 4385 30  0000 C CNN
	1    6950 4275
	1    0    0    -1  
$EndComp
Text Label 9800 2775 0    40   ~ 0
GND
$Comp
L GND #PWR010
U 1 1 4FC9DE68
P 9800 2850
F 0 "#PWR010" H 9800 2850 30  0001 C CNN
F 1 "GND" H 9800 2780 30  0001 C CNN
	1    9800 2850
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG011
U 1 1 4FC9DE5A
P 10075 2725
F 0 "#FLG011" H 10075 2995 30  0001 C CNN
F 1 "PWR_FLAG" H 10075 2955 30  0000 C CNN
	1    10075 2725
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG012
U 1 1 4FC9DE21
P 2625 3650
F 0 "#FLG012" H 2625 3920 30  0001 C CNN
F 1 "PWR_FLAG" H 2625 3880 30  0000 C CNN
	1    2625 3650
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG013
U 1 1 4FC9DC94
P 3350 3650
F 0 "#FLG013" H 3350 3920 30  0001 C CNN
F 1 "PWR_FLAG" H 3350 3880 30  0000 C CNN
	1    3350 3650
	1    0    0    -1  
$EndComp
Text Label 9850 2250 0    40   ~ 0
3V3
$Comp
L PWR_FLAG #FLG014
U 1 1 4FC9DB12
P 10100 2100
F 0 "#FLG014" H 10100 2370 30  0001 C CNN
F 1 "PWR_FLAG" H 10100 2330 30  0000 C CNN
	1    10100 2100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR015
U 1 1 4FC9DB0D
P 9800 2100
F 0 "#PWR015" H 9800 2060 30  0001 C CNN
F 1 "+3.3V" H 9800 2210 30  0000 C CNN
	1    9800 2100
	1    0    0    -1  
$EndComp
Text HLabel 2675 5875 0    40   BiDi ~ 0
V_IN
Text HLabel 2675 5675 0    40   BiDi ~ 0
USBVCC
Text HLabel 8225 5175 0    40   Input ~ 0
SCK
Text HLabel 7300 5350 2    40   BiDi ~ 0
GND
Text HLabel 7300 4425 2    40   BiDi ~ 0
3V3
Text HLabel 7300 3750 2    40   BiDi ~ 0
5V0
Text Label 3275 7100 0    40   ~ 0
GND
$Comp
L LED D6
U 1 1 4FC62203
P 9475 6525
F 0 "D6" H 9475 6625 50  0000 C CNN
F 1 "LED" H 9475 6425 50  0000 C CNN
F 2 "led_0805" H 9475 6525 60  0001 C CNN
	1    9475 6525
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 4FC621EE
P 9475 6025
F 0 "R12" V 9555 6025 50  0000 C CNN
F 1 "1k" V 9475 6025 50  0000 C CNN
F 2 "r_0805" H 9475 6025 60  0001 C CNN
	1    9475 6025
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 4FC621D3
P 8825 6875
F 0 "#PWR016" H 8825 6875 30  0001 C CNN
F 1 "GND" H 8825 6805 30  0001 C CNN
	1    8825 6875
	-1   0    0    -1  
$EndComp
Text Label 8225 5175 0    40   ~ 0
SCK
$Comp
L LM358N U5
U 2 1 4FC62038
P 8925 5275
F 0 "U5" H 8875 5475 60  0000 L CNN
F 1 "LM358N" H 8875 5025 60  0000 L CNN
F 2 "SO8E" H 8925 5275 60  0001 C CNN
	2    8925 5275
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 4FC62001
P 3800 7200
F 0 "#PWR017" H 3800 7200 30  0001 C CNN
F 1 "GND" H 3800 7130 30  0001 C CNN
	1    3800 7200
	-1   0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 4FC61FE5
P 9825 5275
F 0 "C2" H 9850 5350 50  0000 L CNN
F 1 "100n" H 9850 5200 50  0000 L CNN
F 2 "c_0805" H 9825 5275 60  0001 C CNN
	1    9825 5275
	-1   0    0    -1  
$EndComp
Text Label 2675 5875 0    40   ~ 0
V_IN
Text Label 3075 6475 0    40   ~ 0
CMP
Text Label 2675 5775 0    40   ~ 0
3V3
Text Label 2675 5675 0    40   ~ 0
USBVCC
Text Label 4475 6575 0    40   ~ 0
GATE_CMD
$Comp
L LP2985-33DBVR U1
U 1 1 4FC61EAC
P 5975 4575
F 0 "U1" H 5775 4975 60  0000 C CNN
F 1 "LP2985-33DBVR" H 6075 4875 60  0000 C CNN
F 2 "SOT23-5" H 5975 4575 60  0001 C CNN
	1    5975 4575
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_P Q1
U 1 1 4FC61E4C
P 4800 6125
F 0 "Q1" V 5025 6175 60  0000 R CNN
F 1 "FDN340P" V 5125 6325 60  0000 R CNN
F 2 "SOT23-3" H 4800 6125 60  0001 C CNN
	1    4800 6125
	0    -1   -1   0   
$EndComp
$Comp
L R R11
U 1 1 4FC61E0E
P 3000 6775
F 0 "R11" V 3080 6775 50  0000 C CNN
F 1 "10k" V 3000 6775 50  0000 C CNN
F 2 "r_0805" H 3000 6775 60  0001 C CNN
	1    3000 6775
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 4FC61E0A
P 3000 6175
F 0 "R10" V 3080 6175 50  0000 C CNN
F 1 "10k" V 3000 6175 50  0000 C CNN
F 2 "r_0805" H 3000 6175 60  0001 C CNN
	1    3000 6175
	1    0    0    -1  
$EndComp
$Comp
L LM358N U5
U 1 1 4FC61D4E
P 3900 6575
F 0 "U5" H 3850 6775 60  0000 L CNN
F 1 "LM358N" H 3850 6325 60  0000 L CNN
F 2 "SO8E" H 3900 6575 60  0001 C CNN
	1    3900 6575
	1    0    0    -1  
$EndComp
Text Label 3200 3750 0    40   ~ 0
V_IN
$Comp
L NCP1117ST50T3G U3
U 1 1 4FC61C2F
P 3925 3900
F 0 "U3" H 3775 3900 60  0000 C CNN
F 1 "NCP1117ST50T3G" H 3925 4200 60  0000 C CNN
F 2 "SOT223" H 3925 3900 60  0001 C CNN
	1    3925 3900
	1    0    0    -1  
$EndComp
$Comp
L DIODESCH D5
U 1 1 4FC61A7F
P 2925 3750
F 0 "D5" H 2925 3850 40  0000 C CNN
F 1 "DIODESCH" H 2925 3650 40  0000 C CNN
F 2 "d_0805" H 2925 3750 60  0001 C CNN
	1    2925 3750
	1    0    0    -1  
$EndComp
Text Label 7100 5350 0    40   ~ 0
GND
Text Label 7125 4425 0    40   ~ 0
3V3
Text Label 7050 3750 0    40   ~ 0
5V0
$Comp
L +5V #PWR018
U 1 1 4FC61A10
P 5525 3600
F 0 "#PWR018" H 5525 3690 20  0001 C CNN
F 1 "+5V" H 5525 3690 30  0000 C CNN
	1    5525 3600
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 4FC61A0D
P 5525 5450
F 0 "#PWR019" H 5525 5450 30  0001 C CNN
F 1 "GND" H 5525 5380 30  0001 C CNN
	1    5525 5450
	-1   0    0    -1  
$EndComp
Text Label 5978 5350 0    40   ~ 0
GND
$Comp
L C_POL C6
U 1 1 4FC61A0C
P 3350 4050
F 0 "C6" H 3500 3950 50  0000 L CNN
F 1 "100u,25V" H 3400 3850 50  0000 L CNN
F 2 "C_ELCO_SMD" H 3350 4050 60  0001 C CNN
	1    3350 4050
	-1   0    0    -1  
$EndComp
$Comp
L C_POL C3
U 1 1 4FC61A0B
P 4750 4000
F 0 "C3" H 4650 4100 50  0000 L CNN
F 1 "2u2 Tant" H 4400 3825 50  0000 L CNN
F 2 "c_0805" H 4750 4000 60  0001 C CNN
	1    4750 4000
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 4FC61A09
P 4475 4500
F 0 "#PWR020" H 4475 4500 30  0001 C CNN
F 1 "GND" H 4475 4430 30  0001 C CNN
	1    4475 4500
	-1   0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 4FC61A07
P 6950 5000
F 0 "C5" H 7000 5100 50  0000 L CNN
F 1 "2u2" H 7000 4900 50  0000 L CNN
F 2 "c_0805" H 6950 5000 60  0001 C CNN
	1    6950 5000
	-1   0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 4FC61A06
P 4475 4175
F 0 "C4" H 4500 4250 50  0000 L CNN
F 1 "100n" H 4500 4100 50  0000 L CNN
F 2 "c_0805" H 4475 4175 60  0001 C CNN
	1    4475 4175
	-1   0    0    -1  
$EndComp
Text Label 3675 4400 0    40   ~ 0
GND
$Comp
L V_IN P10
U 1 1 4FC61A05
P 1750 3850
F 0 "P10" H 1750 4050 60  0000 C CNN
F 1 "V_IN" H 1750 3600 60  0000 C CNN
F 2 "JACK_ALIM" H 1750 3850 60  0001 C CNN
	1    1750 3850
	1    0    0    -1  
$EndComp
$Comp
L PCB G4
U 1 1 4FC075DD
P 10900 6100
F 0 "G4" H 10900 5800 60  0000 C CNN
F 1 "Logo_OH" H 10900 6400 60  0000 C CNN
F 2 "OSHW_6mm" H 10900 6100 60  0001 C CNN
	1    10900 6100
	1    0    0    -1  
$EndComp
$Comp
L PCB G3
U 1 1 4FC075CE
P 10900 5400
F 0 "G3" H 10900 5100 60  0000 C CNN
F 1 "Logo_OH" H 10900 5700 60  0000 C CNN
F 2 "OSHW_6mm" H 10900 5400 60  0001 C CNN
	1    10900 5400
	1    0    0    -1  
$EndComp
$Comp
L PCB G2
U 1 1 4FC075C2
P 10900 4700
F 0 "G2" H 10900 4400 60  0000 C CNN
F 1 "Logo_Wyolum" H 10900 5000 60  0000 C CNN
F 2 "Logo-WL3" H 10900 4700 60  0001 C CNN
	1    10900 4700
	1    0    0    -1  
$EndComp
$Comp
L PCB G1
U 1 1 4FC075A6
P 10900 4000
F 0 "G1" H 10900 3700 60  0000 C CNN
F 1 "Logo_Wyolum" H 10900 4300 60  0000 C CNN
F 2 "Logo-WL3" H 10900 4000 60  0001 C CNN
	1    10900 4000
	1    0    0    -1  
$EndComp
$Comp
L PCB PCB1
U 1 1 4FC07436
P 10900 6850
F 0 "PCB1" H 10900 6550 60  0000 C CNN
F 1 "PCB" H 10900 7150 60  0000 C CNN
F 2 "PCB" H 10900 6850 60  0001 C CNN
	1    10900 6850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
