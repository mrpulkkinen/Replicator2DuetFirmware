; homeall.g
; More Info https://www.thingiverse.com/thing:2474898
; generated by Pulkkinen on Tue Aug 08 2017 18:41:35 GMT+0200 (Romance Summer Time)

; homeall.g
; called to home all axes
;
; generated by RepRapFirmware Configuration Tool on Sat Jul 01 2017 14:45:41 GMT+0800 (Malay Peninsula Standard Time)

; Relative positioning
G91

; Lift Z
G1 Z5 F150000

; Course home X and Y
G1 X-290 Y-155 F1800 S1

; Move away from the endstops
G1 X5 Y5 F150000

; Fine home X and Y
G1 X-290 Y-155 F360 S1

; Code for legacy switch Endstop home Z <ENDSTOP Z> uncomment below section if the legacy micro switch endstop for Z is used
; Move Extruder out of the way
	;G90
	;G1 X8 Y-5 F150000
; Home Z against legacy switch enstop
	;G91
	;G1 Z-155 F180 S1 ; rough home Z axis
	;G1 Z5 F500	; move down by 5mm
	;G1 Z-155 F45 S1	; fine home z axis
; Adjust Z distance from Z endstop <UPDATE> Optional to change Z0 position.
	G90
	G1 Z5 F500
	G1 Z5 F500 ; additional distance from bed (Z probe already triggered at start of probing move - Increase from 0 to avoid Error (Z5 is Safe))
	G92 Z0

; Absolute positioning
G90

; Code for Sensor Based Z Homing <ENDSTOP Z> comment out below section if the legacy micro switch endstop for Z is used
; Go to first bed probe point and home Z
G1 X156 Y64 F150000 ; <UPDATE> update to desired probing point
G30

; Uncomment the following line to lift the nozzle after probing
G1 Z5 F2500

