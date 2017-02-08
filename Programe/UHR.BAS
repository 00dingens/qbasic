DEFDBL A-Z
p = 3.14159265# * 2
SCREEN 9, , 0, 1
DO
 DO: LOOP UNTIL t$ <> TIME$
 CLS
 FOR x = 0 TO 11
  LINE (320 + 216 * (SIN(p * x / 12)), 171 - 153 * (COS(p * x / 12)))-(320 + 240 * (SIN(p * x / 12)), 171 - 170 * (COS(p * x / 12))), 15
 NEXT x
 FOR x = 0 TO 59
  PSET (320 + 240 * (SIN(p * x / 60)), 171 - 170 * (COS(p * x / 60))), 15
 NEXT x
 t$ = TIME$
 LOCATE 8, 38: PRINT "Uhr von"
 LOCATE 9, 37: PRINT "Rafael F."
 LOCATE 17, 37: PRINT t$
 s = VAL(MID$(t$, 7, 2))
 m = VAL(MID$(t$, 4, 2))
 h = VAL(MID$(t$, 1, 2))
 LINE (320, 171)-STEP(170 * (SIN(p * (h * 3600 + m * 60 + s) / 86400)), -119 * (COS(p * (h * 3600 + m * 60 + s) / 86400))), 15
 LINE (320, 171)-STEP(216 * (SIN(p * (m * 60 + s) / 3600)), -153 * (COS(p * (m * 60 + s) / 3600))), 15
 LINE (320, 171)-STEP(240 * (SIN(p * s / 60)), -170 * (COS(p * s / 60))), 12
 PCOPY 0, 1
LOOP WHILE INKEY$ = ""

