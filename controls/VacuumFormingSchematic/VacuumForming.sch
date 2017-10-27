EESchema Schematic File Version 3
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
LIBS:switches
LIBS:relays
LIBS:conn_2a
LIBS:mechanical
LIBS:motors
LIBS:VacuumForming-cache
EELAYER 26 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Vacuum Forming Machine"
Date "2017-09-23"
Rev "A"
Comp "DMFE"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Conn_01x03 J1
U 1 1 59C6A282
P 1100 1000
F 0 "J1" H 1100 1200 50  0000 L CNN
F 1 "Conn_01x03" H 1180 951 50  0001 L CNN
F 2 "" H 1100 1000 50  0001 C CNN
F 3 "" H 1100 1000 50  0001 C CNN
	1    1100 1000
	-1   0    0    -1  
$EndComp
$Comp
L Fuse F1
U 1 1 59C6A317
P 2250 900
F 0 "F1" V 2053 900 50  0000 C CNN
F 1 "60A 600V" V 2144 900 50  0000 C CNN
F 2 "" V 2180 900 50  0001 C CNN
F 3 "" H 2250 900 50  0001 C CNN
	1    2250 900 
	0    1    1    0   
$EndComp
$Comp
L Fuse F2
U 1 1 59C6A369
P 2250 1200
F 0 "F2" V 2050 1200 50  0000 C CNN
F 1 "60A 600V" V 2144 1200 50  0000 C CNN
F 2 "" V 2180 1200 50  0001 C CNN
F 3 "" H 2250 1200 50  0001 C CNN
	1    2250 1200
	0    1    1    0   
$EndComp
$Comp
L SW_DPST SW1
U 1 1 59C6A47F
P 1800 1000
F 0 "SW1" H 1800 1233 50  0000 C CNN
F 1 "SW_DPST" H 1800 1234 50  0001 C CNN
F 2 "" H 1800 1000 50  0001 C CNN
F 3 "" H 1800 1000 50  0001 C CNN
	1    1800 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 900  1600 900 
Wire Wire Line
	2000 900  2100 900 
Wire Wire Line
	1300 1000 1500 1000
Wire Wire Line
	1500 1000 1500 1100
Wire Wire Line
	1500 1100 1600 1100
Wire Wire Line
	2000 1100 2050 1100
Wire Wire Line
	2050 1100 2050 1200
Wire Wire Line
	2050 1200 2100 1200
$Comp
L Earth_Protective #PWR05
U 1 1 59C6A5A7
P 1350 1700
F 0 "#PWR05" H 1600 1450 50  0001 C CNN
F 1 "Earth_Protective" H 1800 1550 50  0001 C CNN
F 2 "" H 1350 1600 50  0001 C CNN
F 3 "" H 1350 1600 50  0001 C CNN
	1    1350 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1100 1350 1100
Wire Wire Line
	1350 1100 1350 1700
Text Notes 600  1050 0    60   ~ 0
Line IN
$Comp
L VAC #PWR01
U 1 1 59C6A67F
P 4000 900
F 0 "#PWR01" H 4000 800 50  0001 C CNN
F 1 "VAC" H 4000 1175 50  0000 C CNN
F 2 "" H 4000 900 50  0001 C CNN
F 3 "" H 4000 900 50  0001 C CNN
	1    4000 900 
	1    0    0    -1  
$EndComp
$Comp
L AC #PWR02
U 1 1 59C6A768
P 4200 900
F 0 "#PWR02" H 4200 800 50  0001 C CNN
F 1 "AC" H 4200 1175 50  0000 C CNN
F 2 "" H 4200 900 50  0001 C CNN
F 3 "" H 4200 900 50  0001 C CNN
	1    4200 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 900  3000 900 
Wire Wire Line
	2400 1200 3100 1200
Wire Notes Line
	550  550  2600 550 
Wire Notes Line
	2600 550  2600 1600
Wire Notes Line
	2600 1600 550  1600
Wire Notes Line
	550  1600 550  550 
Text Notes 1450 1500 0    60   ~ 0
Service Disconnect
$Comp
L G5Q-1A K2
U 1 1 59C6AB0E
P 4800 1600
F 0 "K2" V 5467 1800 50  0000 C CNN
F 1 "Conn_1A" V 5376 1800 50  0000 C CNN
F 2 "Relays_THT:Relay_SPST-NO_OMRON-G5Q" H 5350 1750 50  0001 L CNN
F 3 "" H 5900 1300 50  0001 C CNN
	1    4800 1600
	0    -1   -1   0   
$EndComp
$Comp
L Thermocouple TC1
U 1 1 59C6ACAD
P 6000 1150
F 0 "TC1" H 5971 1475 50  0000 C CNN
F 1 "Thermocouple" H 5971 1384 50  0000 C CNN
F 2 "" H 5425 1200 50  0001 C CNN
F 3 "" H 5425 1200 50  0001 C CNN
	1    6000 1150
	1    0    0    -1  
$EndComp
$Comp
L Heater R1
U 1 1 59C6AD43
P 5450 1150
F 0 "R1" H 5520 1196 50  0000 L CNN
F 1 "Heater" H 5520 1105 50  0000 L CNN
F 2 "" V 5380 1150 50  0001 C CNN
F 3 "" H 5450 1150 50  0001 C CNN
	1    5450 1150
	1    0    0    -1  
$EndComp
$Comp
L Conn_2A K1
U 1 1 59C6B25B
P 3600 1600
F 0 "K1" V 4465 1800 50  0000 C CNN
F 1 "Conn_2A" V 4374 1800 50  0000 C CNN
F 2 "Contactor 2A" H 2800 1700 50  0001 L CNN
F 3 "" H 4700 1300 50  0001 C CNN
	1    3600 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3000 900  3000 1000
Wire Wire Line
	3000 1000 3100 1000
Wire Wire Line
	3700 1200 4300 1200
Wire Wire Line
	3700 1000 4000 1000
Wire Wire Line
	4000 1000 4000 900 
Wire Wire Line
	4200 900  4200 1600
Connection ~ 4200 1200
$Comp
L Conn_01x04 PS1
U 1 1 59C6B63C
P 2050 2500
F 0 "PS1" H 2050 2700 50  0000 L CNN
F 1 "24VDC Power Supply" H 1650 2150 50  0000 L CNN
F 2 "" H 2050 2500 50  0001 C CNN
F 3 "" H 2050 2500 50  0001 C CNN
	1    2050 2500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2250 2400 3900 2400
Connection ~ 2750 1200
Wire Wire Line
	2250 2500 3800 2500
Wire Wire Line
	2850 2500 2850 3200
Connection ~ 2850 900 
$Comp
L +24V #PWR06
U 1 1 59C6B899
P 4100 2550
F 0 "#PWR06" H 4100 2400 50  0001 C CNN
F 1 "+24V" H 4115 2723 50  0000 C CNN
F 2 "" H 4100 2550 50  0001 C CNN
F 3 "" H 4100 2550 50  0001 C CNN
	1    4100 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 59C6B900
P 3100 2800
F 0 "#PWR07" H 3100 2550 50  0001 C CNN
F 1 "GND" H 3105 2627 50  0000 C CNN
F 2 "" H 3100 2800 50  0001 C CNN
F 3 "" H 3100 2800 50  0001 C CNN
	1    3100 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2600 4100 2600
Wire Wire Line
	2250 2700 3100 2700
Wire Wire Line
	3100 2700 3100 2800
Wire Wire Line
	4200 1600 4300 1600
$Comp
L VAC #PWR03
U 1 1 59C6B9D8
P 5450 900
F 0 "#PWR03" H 5450 800 50  0001 C CNN
F 1 "VAC" H 5450 1175 50  0000 C CNN
F 2 "" H 5450 900 50  0001 C CNN
F 3 "" H 5450 900 50  0001 C CNN
	1    5450 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 900  5450 1000
Wire Wire Line
	5450 1300 5450 1400
Wire Wire Line
	5450 1400 5200 1400
Wire Wire Line
	5200 1400 5200 1200
Wire Wire Line
	5200 1200 4900 1200
Wire Wire Line
	3000 1200 3000 1600
Wire Wire Line
	3000 1600 3100 1600
Connection ~ 3000 1200
$Comp
L FINDER-40.31 K3
U 1 1 59C6BCB7
P 2300 3600
F 0 "K3" H 2730 3646 50  0000 L CNN
F 1 "IDEC Relay" H 2730 3555 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_Finder_40.31" H 3440 3560 50  0001 C CNN
F 3 "" H 2300 3600 50  0001 C CNN
	1    2300 3600
	1    0    0    -1  
$EndComp
$Comp
L FINDER-40.31 K4
U 1 1 59C6BD39
P 2300 4600
F 0 "K4" H 2730 4646 50  0000 L CNN
F 1 "IDEC Relay" H 2730 4555 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_Finder_40.31" H 3440 4560 50  0001 C CNN
F 3 "" H 2300 4600 50  0001 C CNN
	1    2300 4600
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR08
U 1 1 59C6BD6A
P 2100 3250
F 0 "#PWR08" H 2100 3100 50  0001 C CNN
F 1 "+24V" H 2115 3423 50  0000 C CNN
F 2 "" H 2100 3250 50  0001 C CNN
F 3 "" H 2100 3250 50  0001 C CNN
	1    2100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3250 2100 3300
Text GLabel 1700 3950 0    60   Input ~ 0
Main220
Wire Wire Line
	1700 3950 2100 3950
Wire Wire Line
	2100 3950 2100 3900
$Comp
L +24V #PWR09
U 1 1 59C6BE48
P 2100 4250
F 0 "#PWR09" H 2100 4100 50  0001 C CNN
F 1 "+24V" H 2115 4423 50  0000 C CNN
F 2 "" H 2100 4250 50  0001 C CNN
F 3 "" H 2100 4250 50  0001 C CNN
	1    2100 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4250 2100 4300
Text GLabel 1700 4950 0    60   Input ~ 0
Heater
Wire Wire Line
	1700 4950 2100 4950
Wire Wire Line
	2100 4950 2100 4900
$Comp
L FINDER-40.31 K5
U 1 1 59C6BF42
P 2300 5600
F 0 "K5" H 2730 5646 50  0000 L CNN
F 1 "IDEC Relay" H 2730 5555 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_Finder_40.31" H 3440 5560 50  0001 C CNN
F 3 "" H 2300 5600 50  0001 C CNN
	1    2300 5600
	1    0    0    -1  
$EndComp
$Comp
L FINDER-40.31 K6
U 1 1 59C6BF79
P 2300 6600
F 0 "K6" H 2730 6646 50  0000 L CNN
F 1 "IDEC Relay" H 2730 6555 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_Finder_40.31" H 3440 6560 50  0001 C CNN
F 3 "" H 2300 6600 50  0001 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
Text GLabel 1700 5950 0    60   Input ~ 0
Vac_Valve
$Comp
L +24V #PWR013
U 1 1 59C6BFD4
P 2100 5250
F 0 "#PWR013" H 2100 5100 50  0001 C CNN
F 1 "+24V" H 2115 5423 50  0000 C CNN
F 2 "" H 2100 5250 50  0001 C CNN
F 3 "" H 2100 5250 50  0001 C CNN
	1    2100 5250
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR016
U 1 1 59C6BFF9
P 2100 6250
F 0 "#PWR016" H 2100 6100 50  0001 C CNN
F 1 "+24V" H 2115 6423 50  0000 C CNN
F 2 "" H 2100 6250 50  0001 C CNN
F 3 "" H 2100 6250 50  0001 C CNN
	1    2100 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5950 2100 5950
Wire Wire Line
	2100 5950 2100 5900
Wire Wire Line
	2100 5300 2100 5250
Wire Wire Line
	2100 6300 2100 6250
$Comp
L +24V #PWR04
U 1 1 59C6C22B
P 5650 8400
F 0 "#PWR04" H 5650 8250 50  0001 C CNN
F 1 "+24V" H 5665 8573 50  0000 C CNN
F 2 "" H 5650 8400 50  0001 C CNN
F 3 "" H 5650 8400 50  0001 C CNN
	1    5650 8400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR011
U 1 1 59C6C252
P 6000 8500
F 0 "#PWR011" H 6000 8250 50  0001 C CNN
F 1 "GND" H 6005 8327 50  0000 C CNN
F 2 "" H 6000 8500 50  0001 C CNN
F 3 "" H 6000 8500 50  0001 C CNN
	1    6000 8500
	0    1    1    0   
$EndComp
Text GLabel 5750 8600 0    60   Input ~ 0
Main220
Text GLabel 5750 8800 0    60   Input ~ 0
Heater
Text GLabel 5750 8900 0    60   Input ~ 0
Vac_Valve
Text GLabel 6250 1050 2    60   Input ~ 0
TC+
Text GLabel 6250 1250 2    60   Input ~ 0
TC-
Wire Wire Line
	6100 1050 6250 1050
Wire Wire Line
	6100 1250 6250 1250
Text GLabel 5750 9500 0    60   Input ~ 0
TC+
Text GLabel 5750 9600 0    60   Input ~ 0
TC-
Text GLabel 1700 6950 0    60   Input ~ 0
Up_Valve
Wire Wire Line
	1700 6950 2100 6950
Wire Wire Line
	2100 6950 2100 6900
$Comp
L FINDER-40.31 K7
U 1 1 59C6C685
P 2300 7600
F 0 "K7" H 2730 7646 50  0000 L CNN
F 1 "IDEC Relay" H 2730 7555 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_Finder_40.31" H 3440 7560 50  0001 C CNN
F 3 "" H 2300 7600 50  0001 C CNN
	1    2300 7600
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR020
U 1 1 59C6C6C6
P 2100 7250
F 0 "#PWR020" H 2100 7100 50  0001 C CNN
F 1 "+24V" H 2115 7423 50  0000 C CNN
F 2 "" H 2100 7250 50  0001 C CNN
F 3 "" H 2100 7250 50  0001 C CNN
	1    2100 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 7300 2100 7250
$Comp
L FINDER-40.31 K8
U 1 1 59C6C7CF
P 2300 8600
F 0 "K8" H 2730 8646 50  0000 L CNN
F 1 "IDEC Relay" H 2730 8555 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_Finder_40.31" H 3440 8560 50  0001 C CNN
F 3 "" H 2300 8600 50  0001 C CNN
	1    2300 8600
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR023
U 1 1 59C6C858
P 2100 8250
F 0 "#PWR023" H 2100 8100 50  0001 C CNN
F 1 "+24V" H 2115 8423 50  0000 C CNN
F 2 "" H 2100 8250 50  0001 C CNN
F 3 "" H 2100 8250 50  0001 C CNN
	1    2100 8250
	1    0    0    -1  
$EndComp
Text GLabel 1700 7950 0    60   Input ~ 0
DownForce_Valve
Text GLabel 1700 8950 0    60   Input ~ 0
HeaterForward_Valve
Wire Wire Line
	1700 7950 2100 7950
Wire Wire Line
	2100 7950 2100 7900
Wire Wire Line
	2100 8250 2100 8300
Wire Wire Line
	1700 8950 2100 8950
Wire Wire Line
	2100 8950 2100 8900
Wire Wire Line
	2850 3200 2600 3200
Wire Wire Line
	2600 3200 2600 3300
Connection ~ 2850 2500
Wire Wire Line
	2500 3900 2500 4000
Wire Wire Line
	3800 1600 3700 1600
Wire Wire Line
	2600 4300 2600 4200
Wire Wire Line
	2600 4200 3200 4200
Wire Wire Line
	3200 4200 3200 4800
Wire Wire Line
	4900 1600 5000 1600
Wire Wire Line
	2500 5000 2500 4900
$Comp
L Electromagnetic_Actor V1
U 1 1 59C6D35F
P 8900 4800
F 0 "V1" V 8633 4850 50  0000 C CNN
F 1 "Vacuum Valve" V 8724 4850 50  0000 C CNN
F 2 "" V 8875 4900 50  0001 C CNN
F 3 "" V 8875 4900 50  0001 C CNN
	1    8900 4800
	0    1    1    0   
$EndComp
$Comp
L Electromagnetic_Actor V5
U 1 1 59C6D4CA
P 8900 6600
F 0 "V5" V 8633 6650 50  0000 C CNN
F 1 "Blow Off Valve" V 8724 6650 50  0000 C CNN
F 2 "" V 8875 6700 50  0001 C CNN
F 3 "" V 8875 6700 50  0001 C CNN
	1    8900 6600
	0    1    1    0   
$EndComp
$Comp
L Electromagnetic_Actor V4
U 1 1 59C6D57A
P 8900 6150
F 0 "V4" V 8633 6200 50  0000 C CNN
F 1 "Heater Forward Valve" V 8724 6200 50  0000 C CNN
F 2 "" V 8875 6250 50  0001 C CNN
F 3 "" V 8875 6250 50  0001 C CNN
	1    8900 6150
	0    1    1    0   
$EndComp
$Comp
L Electromagnetic_Actor V2
U 1 1 59C6D623
P 8900 5250
F 0 "V2" V 8633 5300 50  0000 C CNN
F 1 "Table UP Valve" V 8724 5300 50  0000 C CNN
F 2 "" V 8875 5350 50  0001 C CNN
F 3 "" V 8875 5350 50  0001 C CNN
	1    8900 5250
	0    1    1    0   
$EndComp
$Comp
L Electromagnetic_Actor V3
U 1 1 59C6D6A8
P 8900 5700
F 0 "V3" V 8633 5750 50  0000 C CNN
F 1 "Table DOWN Valve" V 8724 5750 50  0000 C CNN
F 2 "" V 8875 5800 50  0001 C CNN
F 3 "" V 8875 5800 50  0001 C CNN
	1    8900 5700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR014
U 1 1 59C6D7AF
P 2500 5950
F 0 "#PWR014" H 2500 5700 50  0001 C CNN
F 1 "GND" H 2505 5777 50  0000 C CNN
F 2 "" H 2500 5950 50  0001 C CNN
F 3 "" H 2500 5950 50  0001 C CNN
	1    2500 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 59C6D7E4
P 2500 6950
F 0 "#PWR017" H 2500 6700 50  0001 C CNN
F 1 "GND" H 2505 6777 50  0000 C CNN
F 2 "" H 2500 6950 50  0001 C CNN
F 3 "" H 2500 6950 50  0001 C CNN
	1    2500 6950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 59C6D819
P 2500 7950
F 0 "#PWR021" H 2500 7700 50  0001 C CNN
F 1 "GND" H 2505 7777 50  0000 C CNN
F 2 "" H 2500 7950 50  0001 C CNN
F 3 "" H 2500 7950 50  0001 C CNN
	1    2500 7950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 59C6D84E
P 2500 8950
F 0 "#PWR025" H 2500 8700 50  0001 C CNN
F 1 "GND" H 2505 8777 50  0000 C CNN
F 2 "" H 2500 8950 50  0001 C CNN
F 3 "" H 2500 8950 50  0001 C CNN
	1    2500 8950
	1    0    0    -1  
$EndComp
$Comp
L FINDER-40.31 K9
U 1 1 59C6DC39
P 2300 9600
F 0 "K9" H 2730 9646 50  0000 L CNN
F 1 "IDEC Relay" H 2730 9555 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_Finder_40.31" H 3440 9560 50  0001 C CNN
F 3 "" H 2300 9600 50  0001 C CNN
	1    2300 9600
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR027
U 1 1 59C6DC98
P 2100 9250
F 0 "#PWR027" H 2100 9100 50  0001 C CNN
F 1 "+24V" H 2115 9423 50  0000 C CNN
F 2 "" H 2100 9250 50  0001 C CNN
F 3 "" H 2100 9250 50  0001 C CNN
	1    2100 9250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 9300 2100 9250
Wire Wire Line
	2500 5950 2500 5900
Wire Wire Line
	2500 6950 2500 6900
Wire Wire Line
	2500 7950 2500 7900
Wire Wire Line
	2500 8950 2500 8900
$Comp
L GND #PWR028
U 1 1 59C6E8F8
P 2500 9950
F 0 "#PWR028" H 2500 9700 50  0001 C CNN
F 1 "GND" H 2505 9777 50  0000 C CNN
F 2 "" H 2500 9950 50  0001 C CNN
F 3 "" H 2500 9950 50  0001 C CNN
	1    2500 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 9950 2500 9900
Text GLabel 1650 9950 0    60   Input ~ 0
Blow_Off_Valve
Wire Wire Line
	1650 9950 2100 9950
Wire Wire Line
	2100 9950 2100 9900
$Comp
L +24V #PWR012
U 1 1 59C6EC27
P 9400 4700
F 0 "#PWR012" H 9400 4550 50  0001 C CNN
F 1 "+24V" H 9415 4873 50  0000 C CNN
F 2 "" H 9400 4700 50  0001 C CNN
F 3 "" H 9400 4700 50  0001 C CNN
	1    9400 4700
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR015
U 1 1 59C6EC5E
P 9400 5150
F 0 "#PWR015" H 9400 5000 50  0001 C CNN
F 1 "+24V" H 9415 5323 50  0000 C CNN
F 2 "" H 9400 5150 50  0001 C CNN
F 3 "" H 9400 5150 50  0001 C CNN
	1    9400 5150
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR018
U 1 1 59C6EC95
P 9400 5600
F 0 "#PWR018" H 9400 5450 50  0001 C CNN
F 1 "+24V" H 9415 5773 50  0000 C CNN
F 2 "" H 9400 5600 50  0001 C CNN
F 3 "" H 9400 5600 50  0001 C CNN
	1    9400 5600
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR022
U 1 1 59C6ECCC
P 9400 6050
F 0 "#PWR022" H 9400 5900 50  0001 C CNN
F 1 "+24V" H 9415 6223 50  0000 C CNN
F 2 "" H 9400 6050 50  0001 C CNN
F 3 "" H 9400 6050 50  0001 C CNN
	1    9400 6050
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR026
U 1 1 59C6ED91
P 9400 6500
F 0 "#PWR026" H 9400 6350 50  0001 C CNN
F 1 "+24V" H 9415 6673 50  0000 C CNN
F 2 "" H 9400 6500 50  0001 C CNN
F 3 "" H 9400 6500 50  0001 C CNN
	1    9400 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 6600 9400 6600
Wire Wire Line
	9400 6600 9400 6500
Wire Wire Line
	9100 6150 9400 6150
Wire Wire Line
	9400 6150 9400 6050
Wire Wire Line
	9100 5700 9400 5700
Wire Wire Line
	9400 5700 9400 5600
Wire Wire Line
	9100 5250 9400 5250
Wire Wire Line
	9400 5250 9400 5150
Wire Wire Line
	9100 4800 9400 4800
Wire Wire Line
	9400 4800 9400 4700
Text GLabel 5750 9000 0    60   Input ~ 0
Up_Valve
Text GLabel 5750 9100 0    60   Input ~ 0
DownForce_Valve
Text GLabel 5750 9200 0    60   Input ~ 0
HeaterForward_Valve
Text GLabel 5750 9300 0    60   Input ~ 0
Blow_Off_Valve
$Comp
L SW_SPDT SW2
U 1 1 59C6F29C
P 9050 9600
F 0 "SW2" H 9050 9885 50  0000 C CNN
F 1 "SW_SPDT" H 9050 9794 50  0000 C CNN
F 2 "" H 9050 9600 50  0001 C CNN
F 3 "" H 9050 9600 50  0001 C CNN
	1    9050 9600
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 59C6F35C
P 9350 9700
F 0 "#PWR019" H 9350 9450 50  0001 C CNN
F 1 "GND" H 9355 9527 50  0000 C CNN
F 2 "" H 9350 9700 50  0001 C CNN
F 3 "" H 9350 9700 50  0001 C CNN
	1    9350 9700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9350 9700 9350 9600
Wire Wire Line
	9350 9600 9250 9600
Text GLabel 8650 9700 0    60   Input ~ 0
TableDownSW
Wire Wire Line
	8850 9700 8650 9700
Text GLabel 5750 9700 0    60   Input ~ 0
TableDownSW
$Comp
L Electromagnetic_Actor L1
U 1 1 59C6F5E6
P 8900 7050
F 0 "L1" V 8633 7100 50  0000 C CNN
F 1 "Cover Magnet" V 8724 7100 50  0000 C CNN
F 2 "" V 8875 7150 50  0001 C CNN
F 3 "" V 8875 7150 50  0001 C CNN
	1    8900 7050
	0    1    1    0   
$EndComp
$Comp
L Electromagnetic_Actor L2
U 1 1 59C6F79C
P 8900 7500
F 0 "L2" V 8633 7550 50  0000 C CNN
F 1 "Cover Magnet" V 8724 7550 50  0000 C CNN
F 2 "" V 8875 7600 50  0001 C CNN
F 3 "" V 8875 7600 50  0001 C CNN
	1    8900 7500
	0    1    1    0   
$EndComp
$Comp
L +24V #PWR024
U 1 1 59C6F9A3
P 9400 6950
F 0 "#PWR024" H 9400 6800 50  0001 C CNN
F 1 "+24V" H 9415 7123 50  0000 C CNN
F 2 "" H 9400 6950 50  0001 C CNN
F 3 "" H 9400 6950 50  0001 C CNN
	1    9400 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 6950 9400 7500
Wire Wire Line
	9400 7050 9100 7050
Wire Wire Line
	9400 7500 9100 7500
Connection ~ 9400 7050
Wire Wire Line
	2600 5300 2600 5200
Wire Wire Line
	2600 6300 2600 6200
Wire Wire Line
	2600 7300 2600 7200
Wire Wire Line
	2600 8300 2600 8200
Wire Wire Line
	2600 9300 2600 9200
$Comp
L FINDER-40.31 K10
U 1 1 59C70539
P 4550 7650
F 0 "K10" H 4980 7696 50  0000 L CNN
F 1 "IDEC Relay" H 4980 7605 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_Finder_40.31" H 5690 7610 50  0001 C CNN
F 3 "" H 4550 7650 50  0001 C CNN
	1    4550 7650
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR031
U 1 1 59C7059A
P 4350 7300
F 0 "#PWR031" H 4350 7150 50  0001 C CNN
F 1 "+24V" H 4365 7473 50  0000 C CNN
F 2 "" H 4350 7300 50  0001 C CNN
F 3 "" H 4350 7300 50  0001 C CNN
	1    4350 7300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 59C70631
P 4750 8000
F 0 "#PWR032" H 4750 7750 50  0001 C CNN
F 1 "GND" H 4755 7827 50  0000 C CNN
F 2 "" H 4750 8000 50  0001 C CNN
F 3 "" H 4750 8000 50  0001 C CNN
	1    4750 8000
	1    0    0    -1  
$EndComp
Text GLabel 4250 8000 0    60   Input ~ 0
Cover_Magnets
Wire Wire Line
	4250 8000 4350 8000
Wire Wire Line
	4350 8000 4350 7950
Wire Wire Line
	4350 7350 4350 7300
Wire Wire Line
	4750 8000 4750 7950
Wire Wire Line
	8600 7500 8600 7050
Wire Wire Line
	8600 7050 8800 7050
Connection ~ 8600 7500
Text GLabel 5750 9400 0    60   Input ~ 0
Cover_Magnets
$Comp
L SW_Push_Open SW3
U 1 1 59C70C1B
P 7950 1700
F 0 "SW3" H 7950 1915 50  0000 C CNN
F 1 "Pressure Control Switch" H 7950 1824 50  0000 C CNN
F 2 "" H 7950 1900 50  0001 C CNN
F 3 "" H 7950 1900 50  0001 C CNN
	1    7950 1700
	1    0    0    -1  
$EndComp
$Comp
L Motor_AC M1
U 1 1 59C70F7B
P 8400 1950
F 0 "M1" H 8558 1946 50  0000 L CNN
F 1 "Air Compressor" H 8558 1855 50  0000 L CNN
F 2 "" H 8400 1860 50  0001 C CNN
F 3 "" H 8400 1860 50  0001 C CNN
	1    8400 1950
	1    0    0    -1  
$EndComp
$Comp
L Motor_AC M2
U 1 1 59C71078
P 8400 2850
F 0 "M2" H 8558 2846 50  0000 L CNN
F 1 "Vacuum Pump" H 8558 2755 50  0000 L CNN
F 2 "" H 8400 2760 50  0001 C CNN
F 3 "" H 8400 2760 50  0001 C CNN
	1    8400 2850
	1    0    0    -1  
$EndComp
$Comp
L VAC #PWR029
U 1 1 59C712FB
P 7500 1400
F 0 "#PWR029" H 7500 1300 50  0001 C CNN
F 1 "VAC" H 7500 1675 50  0000 C CNN
F 2 "" H 7500 1400 50  0001 C CNN
F 3 "" H 7500 1400 50  0001 C CNN
	1    7500 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1700 7750 1700
Wire Wire Line
	8150 1700 8400 1700
Wire Wire Line
	8400 1700 8400 1750
Wire Wire Line
	7500 2600 8400 2600
Wire Wire Line
	8400 2600 8400 2650
$Comp
L AC #PWR030
U 1 1 59C71513
P 9300 1400
F 0 "#PWR030" H 9300 1300 50  0001 C CNN
F 1 "AC" H 9300 1675 50  0000 C CNN
F 2 "" H 9300 1400 50  0001 C CNN
F 3 "" H 9300 1400 50  0001 C CNN
	1    9300 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 1400 9300 3300
Wire Wire Line
	9300 2400 8400 2400
Wire Wire Line
	8400 2400 8400 2250
Wire Wire Line
	9300 3300 8400 3300
Wire Wire Line
	8400 3300 8400 3150
Connection ~ 9300 2400
Wire Wire Line
	3200 5300 3200 6200
Wire Wire Line
	3200 6200 2600 6200
Wire Wire Line
	3300 5400 3300 7200
Wire Wire Line
	3300 7200 2600 7200
Wire Wire Line
	3400 5500 3400 8200
Wire Wire Line
	3400 8200 2600 8200
Wire Wire Line
	3500 5600 3500 9200
Wire Wire Line
	3500 9200 2600 9200
Wire Wire Line
	5750 8600 6050 8600
Wire Wire Line
	5750 8700 6050 8700
Wire Wire Line
	5750 8900 6050 8900
Wire Wire Line
	5750 9000 6050 9000
Wire Wire Line
	5750 9100 6050 9100
Wire Wire Line
	5750 9200 6050 9200
Wire Wire Line
	5750 9300 6050 9300
Wire Wire Line
	5750 9400 6050 9400
Wire Notes Line
	550  2150 6050 2150
Wire Notes Line
	6050 2150 6050 10450
Wire Notes Line
	6050 10450 550  10450
Wire Notes Line
	550  10450 550  2150
Text Notes 2550 10400 0    60   ~ 0
DIN Rail Mounted Parts
Wire Wire Line
	5750 9500 6050 9500
Wire Wire Line
	5750 9600 6050 9600
NoConn ~ 2400 3300
NoConn ~ 2400 4300
NoConn ~ 2400 5300
NoConn ~ 2400 6300
NoConn ~ 2400 7300
NoConn ~ 2400 8300
NoConn ~ 2400 9300
NoConn ~ 4650 7350
NoConn ~ 8850 9500
NoConn ~ 6050 9900
NoConn ~ 6050 9800
Text Notes 10750 5400 0    60   ~ 0
Control:\nDisable ALL If: Pumps Not ON\nDisable Heater If: Table is Down\nDisable Vacuum Valve If: Table Not Down\n
$Comp
L Screw_Terminal_01x16 J2
U 1 1 59CAD49B
P 6250 9100
F 0 "J2" H 6200 9950 50  0000 L CNN
F 1 "Screw_Terminal_01x16" H 5800 8150 50  0000 L CNN
F 2 "" H 6250 9100 50  0001 C CNN
F 3 "" H 6250 9100 50  0001 C CNN
	1    6250 9100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 8500 6050 8500
Wire Wire Line
	5650 8400 6050 8400
Wire Wire Line
	2500 4000 3600 4000
Wire Wire Line
	2500 5000 3500 5000
$Comp
L FINDER-40.31 K11
U 1 1 59CAE6B9
P 4550 6300
F 0 "K11" H 4450 5700 50  0000 L CNN
F 1 "IDEC Relay" H 4400 5600 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_Finder_40.31" H 5690 6260 50  0001 C CNN
F 3 "" H 4550 6300 50  0001 C CNN
	1    4550 6300
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR?
U 1 1 59CAE827
P 4350 5950
F 0 "#PWR?" H 4350 5800 50  0001 C CNN
F 1 "+24V" H 4365 6123 50  0000 C CNN
F 2 "" H 4350 5950 50  0001 C CNN
F 3 "" H 4350 5950 50  0001 C CNN
	1    4350 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1400 7500 1700
Wire Wire Line
	4750 6800 4750 6600
Text GLabel 4200 6700 0    60   Input ~ 0
VacuumPump
Wire Wire Line
	4200 6700 4350 6700
Wire Wire Line
	4350 6700 4350 6600
Wire Wire Line
	5750 9700 6050 9700
Wire Wire Line
	5750 8800 6050 8800
Text GLabel 5750 8700 0    60   Input ~ 0
VacuumPump
Wire Wire Line
	2850 900  2850 2000
Wire Wire Line
	2850 2000 6300 2000
Wire Wire Line
	6300 2000 6300 3800
Wire Wire Line
	6300 3800 3800 3800
Wire Wire Line
	2750 1200 2750 2100
Wire Wire Line
	2750 2100 6200 2100
Wire Wire Line
	6200 2100 6200 3700
Wire Wire Line
	6200 3700 3900 3700
Wire Wire Line
	3900 3700 3900 2400
Connection ~ 6050 3700
Wire Wire Line
	4100 2600 4100 2550
Wire Wire Line
	3800 3800 3800 2500
Connection ~ 6050 3800
$Comp
L +24V #PWR?
U 1 1 59CAFBC2
P 6800 5150
F 0 "#PWR?" H 6800 5000 50  0001 C CNN
F 1 "+24V" H 6815 5323 50  0000 C CNN
F 2 "" H 6800 5150 50  0001 C CNN
F 3 "" H 6800 5150 50  0001 C CNN
	1    6800 5150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 59CAFC0B
P 6200 5500
F 0 "#PWR?" H 6200 5250 50  0001 C CNN
F 1 "GND" H 6205 5327 50  0000 C CNN
F 2 "" H 6200 5500 50  0001 C CNN
F 3 "" H 6200 5500 50  0001 C CNN
	1    6200 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4000 3600 4100
Wire Wire Line
	3600 4100 6800 4100
Wire Wire Line
	6800 4100 6800 1900
Wire Wire Line
	6800 1900 3800 1900
Wire Wire Line
	3800 1900 3800 1600
Connection ~ 6050 4100
Wire Wire Line
	3500 5000 3500 4200
Wire Wire Line
	3500 4200 6900 4200
Wire Wire Line
	6900 4200 6900 1800
Wire Wire Line
	6900 1800 5000 1800
Wire Wire Line
	5000 1800 5000 1600
Connection ~ 6050 4200
Wire Wire Line
	2600 5200 3600 5200
Wire Wire Line
	3600 5200 3600 4300
Wire Wire Line
	3600 4300 8400 4300
Wire Wire Line
	8400 4300 8400 4800
Wire Wire Line
	8400 4800 8800 4800
Connection ~ 6050 4300
Wire Wire Line
	3200 5300 3700 5300
Wire Wire Line
	3700 5300 3700 4400
Wire Wire Line
	3700 4400 8300 4400
Wire Wire Line
	8300 4400 8300 5250
Wire Wire Line
	8300 5250 8800 5250
Connection ~ 6050 4400
Wire Wire Line
	3300 5400 3800 5400
Wire Wire Line
	3800 5400 3800 4500
Wire Wire Line
	3800 4500 8200 4500
Wire Wire Line
	3400 5500 3900 5500
Wire Wire Line
	3900 5500 3900 4600
Wire Wire Line
	3900 4600 8100 4600
Wire Wire Line
	8200 4500 8200 5700
Wire Wire Line
	8200 5700 8800 5700
Connection ~ 6050 4500
Wire Wire Line
	8100 4600 8100 6150
Wire Wire Line
	8100 6150 8800 6150
Connection ~ 6050 4600
Wire Wire Line
	3500 5600 4000 5600
Wire Wire Line
	4000 5600 4000 4700
Wire Wire Line
	4000 4700 8000 4700
Wire Wire Line
	8000 4700 8000 6600
Wire Wire Line
	8000 6600 8800 6600
Connection ~ 6050 4700
Wire Wire Line
	4750 6800 5100 6800
Wire Wire Line
	5100 6800 5100 3900
Wire Wire Line
	5100 3900 7500 3900
Wire Wire Line
	7500 3900 7500 2600
Connection ~ 6050 3900
Wire Wire Line
	5200 4800 7900 4800
Wire Wire Line
	7900 7500 8800 7500
Wire Wire Line
	7900 4800 7900 7500
Connection ~ 6050 4800
Wire Wire Line
	4850 7350 4850 6900
Wire Wire Line
	4850 6900 5200 6900
Wire Wire Line
	5200 6900 5200 4800
Wire Wire Line
	6050 5000 6300 5000
Text Notes 5250 3500 0    60   ~ 0
Internal Wiring
Text Notes 5000 8200 0    60   ~ 0
Control Panel Wiring
Wire Wire Line
	4850 4000 6500 4000
Wire Wire Line
	4850 4000 4850 6000
Wire Wire Line
	3200 4800 4850 4800
Connection ~ 4850 4800
$Comp
L VAC #PWR?
U 1 1 59D84E71
P 6500 3700
F 0 "#PWR?" H 6500 3600 50  0001 C CNN
F 1 "VAC" H 6500 3975 50  0000 C CNN
F 2 "" H 6500 3700 50  0001 C CNN
F 3 "" H 6500 3700 50  0001 C CNN
	1    6500 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4000 6500 3700
Connection ~ 6050 4000
$Comp
L Earth_Protective #PWR?
U 1 1 59D8526A
P 7300 5000
F 0 "#PWR?" H 7550 4750 50  0001 C CNN
F 1 "Earth_Protective" H 7750 4850 50  0001 C CNN
F 2 "" H 7300 4900 50  0001 C CNN
F 3 "" H 7300 4900 50  0001 C CNN
	1    7300 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4900 7300 4900
Wire Wire Line
	7300 4900 7300 5000
$Comp
L Screw_Terminal_01x18 J3
U 1 1 59D8541A
P 5850 4500
F 0 "J3" H 6000 5450 50  0000 L CNN
F 1 "Screw_Terminal_01x18" H 5600 3500 50  0000 L CNN
F 2 "" H 5850 4500 50  0001 C CNN
F 3 "" H 5850 4500 50  0001 C CNN
	1    5850 4500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6050 5400 6200 5400
Wire Wire Line
	6200 5400 6200 5500
Wire Wire Line
	6050 5300 6800 5300
Wire Wire Line
	6800 5300 6800 5150
Wire Wire Line
	6300 5000 6300 5300
Connection ~ 6300 5300
Wire Wire Line
	6050 5100 6300 5100
Connection ~ 6300 5100
Wire Wire Line
	6050 5200 6300 5200
Connection ~ 6300 5200
Text Notes 6450 9400 0    60   ~ 0
K3\nK11\nK4\nK5\nK6\nK7\nK8\nK9\nK10
Text Notes 10750 3900 0    60   ~ 0
Wire Colors:\nBlack   VAC and Main\nGray    AC and Main\nOrange  Switched VAC\nRed     24VDC (+)\nWhite  24VDC Return (GND)\nBlue    Switched GND\nYellow Control Input Switched GND
Text Notes 2650 850  0    60   ~ 0
Black
Text Notes 2650 1150 0    60   ~ 0
Gray
$EndSCHEMATC