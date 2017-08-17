; Configuration file for Duet WiFi (firmware version 1.17)
; executed by the firmware on start-up
; More Info https://www.thingiverse.com/thing:2474898
; generated by Pulkkinen on Tue Aug 08 2017 18:41:35 GMT+0200 (Romance Summer Time)

; General preferences
M111 S0 ; Debugging off
G21 ; Work in millimetres
G90 ; Send absolute coordinates...
M83 ; ...but relative extruder moves
M555 P2 ; Set firmware compatibility to look like Marlin
M208 X-12 Y-10 Z0 S1 ; Set axis minima (bed offset 12 and 10 from zero) <UPDATE> change to fit your bed dimensions - extruder should be over the rear right corner of the bed
M208 X273 Y137 Z150 S0 ; Set axis maxima (reduced by offset above) <UPDATE> change to fit your bed dimensions

; Endstops- Switches
; M574 X1 Y1 Z1 S0 ; <ENDSTOP Z> Define active low and unused microswitches - uncomment to configure for legacy Z-Endstop switch

; Endstops- Z Probe <ENDSTOP Z> comment out section below if no Z probe is used
M574 X1 Y1 Z0 S0 ; Define active low and unused microswitches
M558 P1 X0 Y0 Z1 H5 F350 T150000 ; Set Z probe type to unmodulated (DC42 IR Probe), the axes for which it is used and the probe + travel speeds
G31 P500 X-20 Y5 Z2.2 ; Set Z probe trigger value, offset and trigger height - Increase Z value to move bed closer to nozzle (2.662 for black PEI) ADJUST YOUR SETTINGS HERE!!! 
M557 X25:250 Y15:100 S20 ; Define mesh grid

; Drives
M569 P0 S0 ; Drive 0 goes backwards
M569 P1 S0 ; Drive 1 goes backwards
M569 P2 S1 ; Drive 2 goes forwards
M569 P3 S1 ; Drive 3 goes forwards
M569 P4 S1 ; Drive 4 goes forwards
M350 X16 Y16 Z16 E16:16 I1 ; Configure microstepping with interpolation
M92 X88 Y88 Z400 E106 ; Set steps per mm
M566 X900 Y900 Z600 E1200 ; Set maximum instantaneous speed changes (mm/min)
M203 X1080000 Y1080000 Z1200 E96000 ; Set maximum speeds (mm/min)
M201 X1000 Y1000 Z150 E2000:2000 ; Set accelerations (mm/s^2)
M906 X800 Y800 Z400 E800:800 I30 ; Set motor currents (mA) and motor idle factor in per cent
M84 S30 ; Set idle timeout

; Heaters
M143 S260 ; Set maximum heater temperature to 260C
M305 P0 T100000 B3974 C0 R4700 ; Set thermistor + ADC parameters for heater 0
M305 P1 T100000 B4725 C7.060000e-8 R4700 ; Set thermistor + ADC parameters for heater 1
M305 P2 T100000 B4725 C7.060000e-8 R4700 ; Set thermistor + ADC parameters for heater 2

; Heater PID Values <UPDATE> Replace with your values from Autotune result
M307 H0 A103.7 C787.7 D1.0 S1.00 B0 ; Set PID values for Heatedbed - derived from autotune
M307 H1 A313.9 C153.8 D4.0 S1.00 B0 ; Set PID values for Extruder 1 - derived from autotune
M307 H2 A352.7 C171.2 D3.5 S1.00 B0 ; Set PID values for Extruder 2 - derived from autotune

; Tools
M563 P0 D0 H1 ; Define tool 0
G10 P0 X0 Y0 Z0 ; Set tool 0 axis offsets
G10 P0 R0 S0 ; Set initial tool 0 active and standby temperatures to 0C
;M563 P1 D1 H2 ; Define tool 1
;G10 P1 X35 Y-0.8 Z0 ; Set tool 1 axis offsets <UPDATE> tune to suit your hot end - use a dual extrusion calibration model to find best values
;G10 P1 R0 S0 ; Set initial tool 1 active and standby temperatures to 0C
M207 S1.2 F1200 ; set 1.2mm retract distance for G10 command

; Network
M550 PMakerbot_Replicator 2 ; Set machine name <UPDATE> update with your desired Machine name
M552 S1 ; Enable network
; Access point is configured manually via M587 by the user
M586 P0 S1 ; Enable HTTP
M586 P1 S0 ; Disable FTP
M586 P2 S0 ; Disable Telnet

; Fans
; Filament Cooling Fan <UPDATE> comment out section if no filament cooling fan is installed
M106 P0 S0.7 I0 F500 H-1 ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P0 S0 ; Switch cooling fan off

; Extruder Cooling Fan
M106 P1 S0.4 I0 F500 H1:2 T45 ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S0.4 I0 F500 H1:2 T45 ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on

; Custom settings are not configured
;Home my Axes
;Home X and Y-Axis
G28 X Y F2500
;Home Z Axis
G28 Z F1100
; Send Z-Axis to buttom of Machine - Leave the Las 5 MM for space when homing XY alone
;G0 Z150 F1100
;Disable All stepper Motors note that this will clear Homing Flag and you will need to do this with Gcode before printing.; 
;M18
;Shutdown Parts fan after Power On Test
M107
