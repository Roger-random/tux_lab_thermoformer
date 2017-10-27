EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:max31855
LIBS:nup2105
LIBS:rotary-encoder
LIBS:tmp36
LIBS:txb0104
LIBS:ReflowOvenControl_v0-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MAX31855 U3
U 1 1 53CA6DBC
P 4975 5025
F 0 "U3" H 4975 4775 60  0000 C CNN
F 1 "MAX31855" H 4975 5275 60  0000 C CNN
F 2 "SMD_Packages:SO8E" H 4975 4925 60  0001 C CNN
F 3 "" H 4975 4925 60  0000 C CNN
	1    4975 5025
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P1
U 1 1 53CA6DC2
P 2550 5025
F 0 "P1" V 2500 5025 40  0000 C CNN
F 1 "CONN_2" V 2600 5025 40  0000 C CNN
F 2 "ReflowOven:TermB_OnShore_3d5mm" H 2550 5025 60  0001 C CNN
F 3 "" H 2550 5025 60  0000 C CNN
	1    2550 5025
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 53CA6DC8
P 4525 5625
F 0 "C7" H 4525 5725 40  0000 L CNN
F 1 "C" H 4531 5540 40  0000 L CNN
F 2 "SMD_Packages:SM0603_Capa" H 4563 5475 30  0001 C CNN
F 3 "" H 4525 5625 60  0000 C CNN
	1    4525 5625
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 53CA6DCE
P 4025 5075
F 0 "C3" H 4025 5175 40  0000 L CNN
F 1 "C" H 4031 4990 40  0000 L CNN
F 2 "SMD_Packages:SM0603_Capa" H 4063 4925 30  0001 C CNN
F 3 "" H 4025 5075 60  0000 C CNN
	1    4025 5075
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 53CA6DD4
P 3875 5825
F 0 "C2" H 3875 5925 40  0000 L CNN
F 1 "C" H 3881 5740 40  0000 L CNN
F 2 "SMD_Packages:SM0805" H 3913 5675 30  0001 C CNN
F 3 "" H 3875 5825 60  0000 C CNN
	1    3875 5825
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 53CA6DDA
P 3875 4275
F 0 "C1" H 3875 4375 40  0000 L CNN
F 1 "C" H 3881 4190 40  0000 L CNN
F 2 "SMD_Packages:SM0805" H 3913 4125 30  0001 C CNN
F 3 "" H 3875 4275 60  0000 C CNN
	1    3875 4275
	1    0    0    -1  
$EndComp
$Comp
L FILTER FB1
U 1 1 53CA6DE0
P 3075 4475
F 0 "FB1" H 3075 4625 60  0000 C CNN
F 1 "FILTER" H 3075 4375 60  0000 C CNN
F 2 "SMD_Packages:SM0603" H 3075 4475 60  0001 C CNN
F 3 "" H 3075 4475 60  0000 C CNN
	1    3075 4475
	1    0    0    -1  
$EndComp
$Comp
L FILTER FB2
U 1 1 53CA6DE6
P 3075 5625
F 0 "FB2" H 3075 5775 60  0000 C CNN
F 1 "FILTER" H 3075 5525 60  0000 C CNN
F 2 "SMD_Packages:SM0603" H 3075 5625 60  0001 C CNN
F 3 "" H 3075 5625 60  0000 C CNN
	1    3075 5625
	1    0    0    -1  
$EndComp
$Comp
L NUP2105 U1
U 1 1 53CA6DEC
P 3425 5075
F 0 "U1" H 3150 5250 60  0000 C CNN
F 1 "NUP2105" H 3425 4875 60  0000 C CNN
F 2 "SMD_Packages:SOT23" H 3375 5050 60  0001 C CNN
F 3 "" H 3375 5050 60  0000 C CNN
	1    3425 5075
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR01
U 1 1 53CA6DF2
P 3025 5175
F 0 "#PWR01" H 3025 5175 30  0001 C CNN
F 1 "GND" H 3025 5105 30  0001 C CNN
F 2 "" H 3025 5175 60  0000 C CNN
F 3 "" H 3025 5175 60  0000 C CNN
	1    3025 5175
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 53CA6DF8
P 3875 6075
F 0 "#PWR02" H 3875 6075 30  0001 C CNN
F 1 "GND" H 3875 6005 30  0001 C CNN
F 2 "" H 3875 6075 60  0000 C CNN
F 3 "" H 3875 6075 60  0000 C CNN
	1    3875 6075
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 53CA6DFE
P 3675 4175
F 0 "#PWR03" H 3675 4175 30  0001 C CNN
F 1 "GND" H 3675 4105 30  0001 C CNN
F 2 "" H 3675 4175 60  0000 C CNN
F 3 "" H 3675 4175 60  0000 C CNN
	1    3675 4175
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 53CA6E04
P 4525 5925
F 0 "#PWR04" H 4525 5925 30  0001 C CNN
F 1 "GND" H 4525 5855 30  0001 C CNN
F 2 "" H 4525 5925 60  0000 C CNN
F 3 "" H 4525 5925 60  0000 C CNN
	1    4525 5925
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 53CA6E21
P 4425 4800
F 0 "#PWR05" H 4425 4800 30  0001 C CNN
F 1 "GND" H 4425 4730 30  0001 C CNN
F 2 "" H 4425 4800 60  0000 C CNN
F 3 "" H 4425 4800 60  0000 C CNN
	1    4425 4800
	1    0    0    -1  
$EndComp
$Comp
L MAX31855 U4
U 1 1 53CA6E2D
P 5300 2800
F 0 "U4" H 5300 2550 60  0000 C CNN
F 1 "MAX31855" H 5300 3050 60  0000 C CNN
F 2 "SMD_Packages:SO8E" H 5300 2700 60  0001 C CNN
F 3 "" H 5300 2700 60  0000 C CNN
	1    5300 2800
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P2
U 1 1 53CA6E33
P 2850 2800
F 0 "P2" V 2800 2800 40  0000 C CNN
F 1 "CONN_2" V 2900 2800 40  0000 C CNN
F 2 "ReflowOven:TermB_OnShore_3d5mm" H 2850 2800 60  0001 C CNN
F 3 "" H 2850 2800 60  0000 C CNN
	1    2850 2800
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 53CA6E39
P 4850 3400
F 0 "C8" H 4850 3500 40  0000 L CNN
F 1 "C" H 4856 3315 40  0000 L CNN
F 2 "SMD_Packages:SM0603_Capa" H 4888 3250 30  0001 C CNN
F 3 "" H 4850 3400 60  0000 C CNN
	1    4850 3400
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 53CA6E3F
P 4350 2850
F 0 "C6" H 4350 2950 40  0000 L CNN
F 1 "C" H 4356 2765 40  0000 L CNN
F 2 "SMD_Packages:SM0603_Capa" H 4388 2700 30  0001 C CNN
F 3 "" H 4350 2850 60  0000 C CNN
	1    4350 2850
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 53CA6E45
P 4200 3600
F 0 "C5" H 4200 3700 40  0000 L CNN
F 1 "C" H 4206 3515 40  0000 L CNN
F 2 "SMD_Packages:SM0805" H 4238 3450 30  0001 C CNN
F 3 "" H 4200 3600 60  0000 C CNN
	1    4200 3600
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 53CA6E4B
P 4200 2050
F 0 "C4" H 4200 2150 40  0000 L CNN
F 1 "C" H 4206 1965 40  0000 L CNN
F 2 "SMD_Packages:SM0805" H 4238 1900 30  0001 C CNN
F 3 "" H 4200 2050 60  0000 C CNN
	1    4200 2050
	1    0    0    -1  
$EndComp
$Comp
L FILTER FB3
U 1 1 53CA6E51
P 3400 2250
F 0 "FB3" H 3400 2400 60  0000 C CNN
F 1 "FILTER" H 3400 2150 60  0000 C CNN
F 2 "SMD_Packages:SM0603" H 3400 2250 60  0001 C CNN
F 3 "" H 3400 2250 60  0000 C CNN
	1    3400 2250
	1    0    0    -1  
$EndComp
$Comp
L FILTER FB4
U 1 1 53CA6E57
P 3400 3400
F 0 "FB4" H 3400 3550 60  0000 C CNN
F 1 "FILTER" H 3400 3300 60  0000 C CNN
F 2 "SMD_Packages:SM0603" H 3400 3400 60  0001 C CNN
F 3 "" H 3400 3400 60  0000 C CNN
	1    3400 3400
	1    0    0    -1  
$EndComp
$Comp
L NUP2105 U2
U 1 1 53CA6E5D
P 3750 2850
F 0 "U2" H 3475 3025 60  0000 C CNN
F 1 "NUP2105" H 3750 2650 60  0000 C CNN
F 2 "SMD_Packages:SOT23" H 3700 2825 60  0001 C CNN
F 3 "" H 3700 2825 60  0000 C CNN
	1    3750 2850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR06
U 1 1 53CA6E63
P 3350 2950
F 0 "#PWR06" H 3350 2950 30  0001 C CNN
F 1 "GND" H 3350 2880 30  0001 C CNN
F 2 "" H 3350 2950 60  0000 C CNN
F 3 "" H 3350 2950 60  0000 C CNN
	1    3350 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 53CA6E69
P 4200 3850
F 0 "#PWR07" H 4200 3850 30  0001 C CNN
F 1 "GND" H 4200 3780 30  0001 C CNN
F 2 "" H 4200 3850 60  0000 C CNN
F 3 "" H 4200 3850 60  0000 C CNN
	1    4200 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 53CA6E6F
P 4000 1950
F 0 "#PWR08" H 4000 1950 30  0001 C CNN
F 1 "GND" H 4000 1880 30  0001 C CNN
F 2 "" H 4000 1950 60  0000 C CNN
F 3 "" H 4000 1950 60  0000 C CNN
	1    4000 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 53CA6E75
P 4850 3700
F 0 "#PWR09" H 4850 3700 30  0001 C CNN
F 1 "GND" H 4850 3630 30  0001 C CNN
F 2 "" H 4850 3700 60  0000 C CNN
F 3 "" H 4850 3700 60  0000 C CNN
	1    4850 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 53CA6E92
P 4750 2575
F 0 "#PWR010" H 4750 2575 30  0001 C CNN
F 1 "GND" H 4750 2505 30  0001 C CNN
F 2 "" H 4750 2575 60  0000 C CNN
F 3 "" H 4750 2575 60  0000 C CNN
	1    4750 2575
	1    0    0    -1  
$EndComp
Text GLabel 8100 2125 2    60   Input ~ 0
SO
Text GLabel 8325 2225 2    60   Input ~ 0
CS1
Text GLabel 8100 2325 2    60   Input ~ 0
SCK
$Comp
L R R1
U 1 1 53CA7540
P 6450 2125
F 0 "R1" V 6530 2125 40  0000 C CNN
F 1 "R" V 6457 2126 40  0000 C CNN
F 2 "SMD_Packages:SM0603_Resistor" V 6380 2125 30  0001 C CNN
F 3 "" H 6450 2125 30  0000 C CNN
	1    6450 2125
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 53CA7594
P 6450 2275
F 0 "R2" V 6530 2275 40  0000 C CNN
F 1 "R" V 6457 2276 40  0000 C CNN
F 2 "SMD_Packages:SM0603_Resistor" V 6380 2275 30  0001 C CNN
F 3 "" H 6450 2275 30  0000 C CNN
	1    6450 2275
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 53CA75E7
P 6450 2425
F 0 "R3" V 6530 2425 40  0000 C CNN
F 1 "R" V 6457 2426 40  0000 C CNN
F 2 "SMD_Packages:SM0603_Resistor" V 6380 2425 30  0001 C CNN
F 3 "" H 6450 2425 30  0000 C CNN
	1    6450 2425
	0    -1   -1   0   
$EndComp
Text GLabel 6750 2575 2    60   Input ~ 0
3.3V
Text GLabel 8325 2425 2    60   Input ~ 0
CS2
$Comp
L R R4
U 1 1 53EAB423
P 6600 4500
F 0 "R4" V 6680 4500 40  0000 C CNN
F 1 "R" V 6607 4501 40  0000 C CNN
F 2 "SMD_Packages:SM0603_Resistor" V 6530 4500 30  0001 C CNN
F 3 "" H 6600 4500 30  0000 C CNN
	1    6600 4500
	0    -1   -1   0   
$EndComp
Text GLabel 8950 5150 0    60   Input ~ 0
3.3V
Text GLabel 8650 5450 0    60   Input ~ 0
CS1
Text GLabel 8650 5650 0    60   Input ~ 0
CS2
Text GLabel 8950 5350 0    60   Input ~ 0
SO
Text GLabel 8950 5550 0    60   Input ~ 0
SCK
Text GLabel 8950 5750 0    60   Input ~ 0
GND
Wire Wire Line
	3100 5075 3025 5075
Wire Wire Line
	3025 5075 3025 5175
Wire Wire Line
	3425 4475 4250 4475
Wire Wire Line
	4025 4475 4025 4875
Connection ~ 3875 4475
Wire Wire Line
	4025 5625 4025 5275
Wire Wire Line
	3425 5625 4250 5625
Connection ~ 3875 5625
Wire Wire Line
	3750 4775 3750 4475
Connection ~ 3750 4475
Wire Wire Line
	3750 5375 3750 5625
Wire Wire Line
	3750 5625 3775 5625
Connection ~ 3775 5625
Wire Wire Line
	4250 4475 4250 4975
Wire Wire Line
	4250 4975 4525 4975
Connection ~ 4025 4475
Wire Wire Line
	4525 5075 4250 5075
Wire Wire Line
	4250 5075 4250 5625
Connection ~ 4025 5625
Wire Wire Line
	4525 5175 4525 5425
Wire Wire Line
	4525 5825 4525 5925
Wire Wire Line
	4525 4875 4525 4700
Wire Wire Line
	4525 4700 4425 4700
Wire Wire Line
	4425 4700 4425 4800
Wire Wire Line
	3875 4075 3675 4075
Wire Wire Line
	3675 4075 3675 4175
Wire Wire Line
	3875 6025 3875 6075
Wire Wire Line
	3425 2850 3350 2850
Wire Wire Line
	3350 2850 3350 2950
Wire Wire Line
	3750 2250 4575 2250
Wire Wire Line
	4350 2250 4350 2650
Connection ~ 4200 2250
Wire Wire Line
	4350 3400 4350 3050
Wire Wire Line
	3750 3400 4575 3400
Connection ~ 4200 3400
Wire Wire Line
	4075 2550 4075 2250
Connection ~ 4075 2250
Wire Wire Line
	4075 3150 4075 3400
Wire Wire Line
	4075 3400 4100 3400
Connection ~ 4100 3400
Wire Wire Line
	4575 2250 4575 2750
Wire Wire Line
	4575 2750 4850 2750
Connection ~ 4350 2250
Wire Wire Line
	4850 2850 4575 2850
Wire Wire Line
	4575 2850 4575 3400
Connection ~ 4350 3400
Wire Wire Line
	4850 2950 4850 3200
Wire Wire Line
	4850 3600 4850 3700
Wire Wire Line
	4850 2650 4850 2475
Wire Wire Line
	4850 2475 4750 2475
Wire Wire Line
	4750 2475 4750 2575
Wire Wire Line
	4200 1850 4000 1850
Wire Wire Line
	4000 1850 4000 1950
Wire Wire Line
	4200 3800 4200 3850
Wire Wire Line
	6700 2125 7225 2125
Wire Wire Line
	6700 2275 6900 2275
Wire Wire Line
	6700 2425 6975 2425
Wire Wire Line
	6200 2125 5825 2125
Wire Wire Line
	5825 2750 5750 2750
Wire Wire Line
	6200 2275 5950 2275
Wire Wire Line
	5950 2850 5750 2850
Wire Wire Line
	6200 2425 6075 2425
Wire Wire Line
	6075 2950 5750 2950
Wire Wire Line
	5825 4975 5425 4975
Connection ~ 5825 2750
Wire Wire Line
	5950 5075 5425 5075
Connection ~ 5950 2850
Wire Wire Line
	6075 5175 5425 5175
Connection ~ 6075 2950
Connection ~ 5825 4975
Connection ~ 5950 5075
Connection ~ 6075 5175
Wire Wire Line
	6200 2575 6750 2575
Wire Wire Line
	6200 3100 4850 3100
Connection ~ 4850 3100
Wire Wire Line
	6200 5325 4525 5325
Connection ~ 4525 5325
Connection ~ 6200 3100
Connection ~ 6200 5325
Wire Wire Line
	5825 2125 5825 4975
Wire Wire Line
	6075 2425 6075 5175
Wire Wire Line
	6200 2575 6200 5325
Wire Wire Line
	5950 2275 5950 2850
Wire Wire Line
	6850 4500 7125 4500
Wire Wire Line
	5950 4500 6350 4500
Wire Wire Line
	5950 4500 5950 5075
Wire Wire Line
	8950 5150 9000 5150
Wire Wire Line
	8650 5250 9000 5250
Wire Wire Line
	8950 5350 9000 5350
Wire Wire Line
	8650 5450 9000 5450
Wire Wire Line
	8950 5550 9000 5550
Wire Wire Line
	8650 5650 9000 5650
Wire Wire Line
	3050 2250 2500 2250
Wire Wire Line
	2500 2250 2500 2700
Wire Wire Line
	3050 3400 2500 3400
Wire Wire Line
	2500 3400 2500 2900
Wire Wire Line
	2725 4475 2200 4475
Wire Wire Line
	2200 4475 2200 4925
Wire Wire Line
	2725 5625 2200 5625
Wire Wire Line
	2200 5625 2200 5125
$Comp
L TXB0104 U5
U 1 1 53EC039B
P 7625 2325
F 0 "U5" H 7625 1925 60  0000 C CNN
F 1 "TXB0104" H 7625 2725 60  0000 C CNN
F 2 "SMD_Packages:SSOP14" H 7875 1925 60  0001 C CNN
F 3 "" H 7875 1925 60  0000 C CNN
	1    7625 2325
	1    0    0    -1  
$EndComp
Wire Wire Line
	8025 2125 8100 2125
Wire Wire Line
	8025 2225 8325 2225
Wire Wire Line
	8025 2325 8100 2325
Wire Wire Line
	8025 2425 8325 2425
Wire Wire Line
	6900 2275 6900 2225
Wire Wire Line
	6975 2425 6975 2325
Wire Wire Line
	6975 2325 7225 2325
Wire Wire Line
	7125 2425 7225 2425
$Comp
L GND #PWR011
U 1 1 53EC147C
P 7225 2900
F 0 "#PWR011" H 7225 2900 30  0001 C CNN
F 1 "GND" H 7225 2830 30  0001 C CNN
F 2 "" H 7225 2900 60  0000 C CNN
F 3 "" H 7225 2900 60  0000 C CNN
	1    7225 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7225 2625 7225 2900
Text GLabel 6950 2025 0    60   Input ~ 0
3.3V
Text GLabel 8350 2025 2    60   Input ~ 0
5V
$Comp
L CONN_7 P3
U 1 1 53EC1AB1
P 9350 5450
F 0 "P3" V 9320 5450 60  0000 C CNN
F 1 "CONN_7" V 9420 5450 60  0000 C CNN
F 2 "Connect:SIL-7" H 9350 5450 60  0001 C CNN
F 3 "" H 9350 5450 60  0000 C CNN
	1    9350 5450
	1    0    0    -1  
$EndComp
Text GLabel 8650 5250 0    60   Input ~ 0
5V
Wire Wire Line
	8950 5750 9000 5750
Wire Wire Line
	6900 2225 7225 2225
Wire Wire Line
	7125 4500 7125 2425
$Comp
L C C10
U 1 1 53ECF857
P 8175 1825
F 0 "C10" H 8175 1925 40  0000 L CNN
F 1 "C" H 8181 1740 40  0000 L CNN
F 2 "" H 8213 1675 30  0000 C CNN
F 3 "" H 8175 1825 60  0000 C CNN
	1    8175 1825
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 53ECF893
P 7100 1825
F 0 "C9" H 7100 1925 40  0000 L CNN
F 1 "C" H 7106 1740 40  0000 L CNN
F 2 "" H 7138 1675 30  0000 C CNN
F 3 "" H 7100 1825 60  0000 C CNN
	1    7100 1825
	1    0    0    -1  
$EndComp
Wire Wire Line
	8025 2025 8350 2025
Connection ~ 8175 2025
Wire Wire Line
	6950 2025 7225 2025
Connection ~ 7100 2025
$Comp
L GND #PWR?
U 1 1 53ED03D6
P 7100 1550
F 0 "#PWR?" H 7100 1550 30  0001 C CNN
F 1 "GND" H 7100 1480 30  0001 C CNN
F 2 "" H 7100 1550 60  0000 C CNN
F 3 "" H 7100 1550 60  0000 C CNN
	1    7100 1550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 53ED0404
P 8175 1550
F 0 "#PWR?" H 8175 1550 30  0001 C CNN
F 1 "GND" H 8175 1480 30  0001 C CNN
F 2 "" H 8175 1550 60  0000 C CNN
F 3 "" H 8175 1550 60  0000 C CNN
	1    8175 1550
	-1   0    0    1   
$EndComp
Wire Wire Line
	7100 1625 7100 1550
Wire Wire Line
	8175 1625 8175 1550
Text GLabel 8125 2625 2    60   Input ~ 0
3.3V
Wire Wire Line
	8125 2625 8025 2625
$EndSCHEMATC
