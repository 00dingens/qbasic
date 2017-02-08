
'Vergr”ssert alle Zeichen

SCREEN 12
FOR x = 1 TO 255
 LOCATE 1, 1: PRINT CHR$(x)
 LOCATE 3, 1: PRINT x
 FOR a = 0 TO 7
  FOR b = 0 TO 15
   LINE (a * 30 + 50, b * 30)-STEP(30, 30), 1, B
  NEXT b
 NEXT a
 FOR a = 0 TO 7
  FOR b = 0 TO 15
   z% = POINT(a, b)
   PAINT (a * 30 + 55, b * 30 + 5), z%, 1
  NEXT b
 NEXT a
 DO: LOOP WHILE INKEY$ = ""
NEXT x

