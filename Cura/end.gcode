; -- END GCODE -- 
; end position
M18 A B ;(Turn off A and B Steppers)
G1 Z{machine_height} F900 ;(Move Z to machine_height, feedrate 900 mm/min)
G162 X Y F2000 ; (Home Z Axis Maximum, feedrate 2000 mm/min)
M18 X Y Z ;(Turn off steppers after a build)
; cool bed
M140 S0 T0 ;(Cool Bed)
; cool extruders
M104 S0 T0 ;(Cool Right extruder)
; end print
M73 P100 ;(end  build progress)
M70 P5 ;(We <3 Making Things!)
M72 P1 ;( Play Ta-Da song )
M137 ;(build end notification)
