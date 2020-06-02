; Configurat; Configuration file for Duet WiFi / Ethernet
; executed by the firmware on start-up
;RRF3x

; General preferences
M111 S0 						; Debugging off
G21 							; Work in millimetres
G90 							; Send absolute coordinates...
M83 							; ...but relative extruder moves
M555 P0 						; Set firmware compatibility RepRap_Firmware

; Network
M550 P"ToolChanger" 					; Set machine name
M552 S1							; Enable Networking
M586 P0 S1 						; Enable HTTP
M586 P1 S0 						; Disable FTP
M586 P2 S1 						; Telnet

M669 K1 						; Select CoreXY mode	

; Drive direction
M569 P0 S0 						; Drive 0 X
M569 P1 S0 						; Drive 1 Y
M569 P2 S1 						; Drive 2 Z
M569 P3 S0 						; Drive 3 E0
M569 P4 S0 						; Drive 4 E1
M569 P5 S1 						; Drive 5 E2
M569 P6 S1 						; Drive 6 E3
M569 P7 S0 						; Drive 7 COUPLER
M569 P8 S0 						; Drive 8 UNUSED
M569 P9 S0 						; Drive 9 UNUSED
M584 X0 Y1 Z2 C7 E3:4:5:6 				; Apply custom drive mapping
M350 E8:8:8:8 C8 I0 					; Configure microstepping without interpolation
M350 X16 Y16 Z16 I1					; Configure microstepping with interpolation
M92 X100 Y100 Z1600 C100 E410:410:410:410		; Set steps per mm DEFAULT 417
M566 X400 Y400 Z8 C2 E2:2:2:2				; Set maximum instantaneous speed changes (mm/min)
M203 X35000 Y35000 Z1200 C5000 E5000:5000:5000:5000	; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z400 C500 E2500:2500:2500:2500		; Set accelerations (mm/s^2)
M906 X2000 Y2000 Z1330 C400 E700:700:700:700 I30 	; Set motor currents (mA) and motor idle factor in percent
M84 S120 						; Set idle timeout

; Axis Limis
M208 X-35:328.5 Y-49:243 Z0:290 C0:500 S0 		; Set axis maxima & minima

; Endstops
M574 X1 Y1 S3 						; Set X / Y endstop stall detection
M574 Z1 S2 	
;Z-Probe					; Set Z endstop probe
M574 Z0 P"nil" ; no Z endstop switch, free up Z endstop input
M558 P5 C"zstop" H5 F360 T20000  ; Z probe connected to Z endstop input
;M558 P7 X0 Y0 Z2 H3 F360 I0 T20000 			; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X0 Y0 Z0	 				; Set Z probe trigger value, offset and trigger height
M557 X0:300 Y10:190 S30 ;S30 				; Define mesh grid

;Stall Detection
M915 C S5 F0 H200 R4700					; Coupler
M915 X Y S5 F0 H400 R4700				; X / Y Axes
M915 E S5 F0 H30 R4700					; E Axes

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138                  ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                                           ; create bed heater output on bedheat and map it to sensor 0
M307 H0 B0 S1.00                                                ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                         ; map heated bed to heater 0
M143 H0 S125                                                    ; set temperature limit for heater 0 to 125C
M308 S1 P"spi.cs1" Y"rtd-max31865"                              ; configure sensor 1 as thermocouple via CS pin spi.cs1
M950 H1 C"e0heat" T1                                            ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                                                ; disable bang-bang mode for heater  and set PWM limit
M308 S2 P"spi.cs2" Y"rtd-max31865"                              ; configure sensor 2 as thermocouple via CS pin spi.cs2
M950 H2 C"e1heat" T2                                            ; create nozzle heater output on e1heat and map it to sensor 2
M307 H2 B0 S1.00                                                ; disable bang-bang mode for heater  and set PWM limit
M308 S3 P"spi.cs3" Y"rtd-max31865"                              ; configure sensor 3 as thermocouple via CS pin spi.cs3
M950 H3 C"duex.e2heat" T3                                       ; create nozzle heater output on duex.e2heat and map it to sensor 3
M307 H3 B0 S1.00                                                ; disable bang-bang mode for heater  and set PWM limit
M308 S4 P"spi.cs4" Y"rtd-max31865"                              ; configure sensor 4 as thermocouple via CS pin spi.cs4
M950 H4 C"duex.e3heat" T4                                       ; create nozzle heater output on duex.e3heat and map it to sensor 4
M307 H4 B0 S1.00 						; disable bang-bang mode for heater  and set PWM limit

; Fans
M950 F0 C"null" Q500                                            	; create fan 0 on pin fan0 and set its frequency
M950 F1 C"fan1" Q500                                            ; create fan 1 on pin fan1 and set its frequency
M950 F2 C"fan2" Q500                                            ; create fan 2 on pin fan2 and set its frequency
M950 F3 C"duex.fan3" Q500                                       ; create fan 3 on pin duex.fan3 and set its frequency
M950 F4 C"duex.fan4" Q500                                       ; create fan 4 on pin duex.fan4 and set its frequency
M950 F5 C"duex.fan5" Q500                                       ; create fan 5 on pin duex.fan5 and set its frequency
M950 F6 C"duex.fan6" Q500                                       ; create fan 6 on pin duex.fan6 and set its frequency
M950 F7 C"duex.fan7" Q500                                       ; create fan 7 on pin duex.fan7 and set its frequency
M950 F7 C"duex.fan7" Q500                                       ; create fan 7 on pin duex.fan7 and set its frequency
M950 F8 C"duex.fan8" Q500                                       ; create fan 8 on pin duex.fan8 and set its frequency
M106 P0 H-1                                                 	; set fan 0 value. Thermostatic control is turned off
M106 P1 H1 T45                                              	; set fan 1 value. Thermostatic control is turned on
M106 P2 H-1                                                 	; set fan 2 value. Thermostatic control is turned off
M106 P3 H2 T45                                              	; set fan 3 value. Thermostatic control is turned on
M106 P4 H-1                                                 	; set fan 4 value. Thermostatic control is turned off
M106 P5 H3 T45                                              	; set fan 5 value. Thermostatic control is turned on
M106 P6 H-1                                                 	; set fan 6 value. Thermostatic control is turned off
M106 P7 H4 T45                                               	; set fan 7 value. Thermostatic control is turned on
M106 P8 H-1                                            		    ; set fan 8 value. Thermostatic control is turned off

; Tools
M563 P0 S"T0" D0 H1 					; Define tool 0
G10 P0 X0 Y0 Z0						; Reset tool 0 axis offsets
G10 P0 R0 S0 						; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1" D1 H2 					; Define tool 1
G10 P1 X0 Y0 Z0 					; Reset tool 1 axis offsets
G10 P1 R0 S0 						; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2" D2 H3 					; Define tool 2
G10 P2 X0 Y0 Z0 					; Reset tool 2 axis offsets
G10 P2 R0 S0 						; Reset initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3" D3 H4 					; Define tool 3
G10 P3 X0 Y0 Z0 					; Reset tool 3 axis offsets
G10 P3 R0 S0 						; Reset initial tool 3 active and standby temperatures to 0C

M593 F50						; cancel ringing at 50Hz 
M376 H15						; bed compensation taper

;tool offsets
G10 P0 X-9  	Y39 	Z-4.736			; T0
G10 P1 X-8.6 	Y39.45	Z-4.693			; T1
G10 P2 X-8.05  	Y39.25 	Z-4.756			; T2
G10 P3 X-8.45 	Y39.15 	Z-4.639			; T3

;deselect tools
T-1

;M572 D0 S0.2 						; pressure advance T0
;M572 D1 S0.2 						; pressure advance T1
;M572 D2 S0.2 						; pressure advance T2
;M572 D3 S0.2 						; pressure advance T3

;LOAD TOOL PARAMETERS FROM CONFIG OVERRIDE
M501
