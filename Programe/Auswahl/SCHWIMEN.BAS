
'Kreis schwimmt auf Wellen

rad = 20: eck = 60
DIM x(eck), y(eck)
win = 2 * 3.141593 / eck
FOR i = 0 TO eck - 1
  x(i) = rad * COS(eck - i * win)
  y(i) = rad * SIN(eck - i * win)
NEXT i
SCREEN 7, , 1, 0
DO
 FOR z = 0 TO 59
   FOR t = 1 TO 40
   
    LINE (t * 10 - 20 + x((z + t * 2) MOD 60), 100 + y((z + t * 2) MOD 60))-((t + 1) * 10 - 20 + x((z + t * 2 + 2) MOD 60), 100 + y((z + t * 2 + 2) MOD 60)), 9
    '''  M”glichk. 1 ;   M”glichk. 2
    'PSET (t * 10 - 20 + x((z + t * 2) MOD 60), 100 + y((z + t * 2) MOD 60)), 9
   
    IF t = 20 THEN CIRCLE (182 + x((z + t * 2) MOD 60), 94 + y((z + t * 2) MOD 60)), 7, 15
   NEXT t
  PCOPY 1, 0
  PCOPY 2, 1     ' Lass dies mal weg
 NEXT z
LOOP WHILE INKEY$ = ""

