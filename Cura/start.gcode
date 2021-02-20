; -- START GCODE Rep2x -- 
; begin print
M136 ;(enable build)
M73 P0 ;(set build percentage to zero)
; homing
G162 X Y F2000 ;(home XY axes maximum, standard feedrate 2000 mm/min)
G161 Z F900 ;(home Z axis minimum, standard feedrate 900 mm/min)
G92 X0 Y0 Z-5 A0 B0 ;(set Z to -5)
G01 Z0.0 F900 ;(move Z to '0', standard feedrate 900 mm/min)
G161 Z F100 ;(home Z axis minimum, standard feedrate 100 mm/min)
M132 X Y Z A B ;(Recall stored home offsets for XYZAB axis)
; set start position
G92 X152 Y72 Z0 A0 B0 ;(set zero for X and Y)
G1 X-112 Y-73 Z150 F3300.0 ;(move to waiting position, standard feedrate 3300 mm/min)
G130 X20 Y20 A20 B20 ;(Lower stepper Vrefs while heating)
; heat platform
M109 S{material_bed_temperature} T0 ;(Set build platform temperature in degrees Celsuis)
M134 T0 ;(Wait for platform to heat up)
; EXTRUDER HEAT BEGIN
M135 T0 ;(Set the extruder as the current Extruder)
M104 S{material_print_temperature} T0 ;(Set extruder temperature in degrees Celsius)
M133 T0 ;(Wait for extruder to heat up)
; end start sequence
G130 X127 Y127 A127 B127 ;(Set Stepper motor Vref to defaults)
; initial purge
G92 A0 ;zero the extruded length
G1 F200 A10 ;extrude 10 mm of feed stock
G92 A0 ;zero the extruded length again
; -- END OF START GCODE --