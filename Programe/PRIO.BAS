DIM i(10000)
SCREEN 12
o = -1
FOR x = 1 TO 30000
 o = o + 1
 i(o) = x
 FOR y = 2 TO SQR(x)
  IF x MOD y = 0 THEN o = o - 1: EXIT FOR
 NEXT y
NEXT x
CLS
PAINT (0, 0), 15
FOR x = 600 TO 1240
 FOR y = 0 TO 480
  IF x MOD 10 = 0 THEN PSET (x - 600, 460 - y), 10
  IF y MOD 10 = 0 THEN PSET (x - 600, 460 - y), 10
  IF x MOD 100 = 0 THEN PSET (x - 600, 460 - y), 9
  IF y MOD 100 = 0 THEN PSET (x - 600, 460 - y), 9
  IF x MOD i(y) = 0 THEN PSET (x - 600, 460 - y), 0
 NEXT y
NEXT x

