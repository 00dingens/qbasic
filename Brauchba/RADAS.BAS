SCREEN 9
DO
 PRINT "Wieviele Punkte sollen gleichzeitig auf dem"
 INPUT " Bildschirm zu sehen sein (1 - 4000)"; an
LOOP UNTIL an > 0 AND an < 4001
an = INT(an)
RANDOMIZE TIMER
SCREEN 9, , 1, 0
min = 1                'Minimale Geschwindigkeit
DIM a(an, 3), z(300)
FOR x = 1 TO an
 a(x, 0) = RND * 640
 a(x, 1) = RND * 350
 a(x, 2) = RND * 8 - 4
 a(x, 3) = RND * 8 - 4
NEXT x
DO
 FOR x = 1 TO an
  IF a(x, 2) * SGN(a(x, 2)) < min THEN a(x, 2) = a(x, 2) * 2
  IF a(x, 3) * SGN(a(x, 3)) < min THEN a(x, 3) = a(x, 3) * 2
  a(x, 0) = a(x, 0) + a(x, 2)
  a(x, 1) = a(x, 1) + a(x, 3)
  IF a(x, 0) < 0 OR a(x, 0) > 640 OR a(x, 1) < 0 OR a(x, 1) > 350 THEN
   a(x, 0) = RND * 640
   a(x, 1) = RND * 350
   a(x, 2) = RND * 8 - 4
   a(x, 3) = RND * 8 - 4
   DO
    a(x, 0) = a(x, 0) - a(x, 2)
    a(x, 1) = a(x, 1) - a(x, 3)
   LOOP UNTIL a(x, 0) < 0 OR a(x, 0) > 640 OR a(x, 1) < 0 OR a(x, 1) > 640
  END IF
 NEXT x
 FOR x = 1 TO an
  'CIRCLE (a(x, 0), a(x, 1)), 7, 8, , , 1
  'PAINT (a(x, 0), a(x, 1)), 8, 8
 
  'CIRCLE (a(x, 0), a(x, 1)), 4, 0, , , 1
  'PAINT (a(x, 0), a(x, 1)), 0, 0
 
  'LINE (a(x, 0) - 3, a(x, 1) - 3)-STEP(6, 6), 0, BF
 
  PSET (a(x, 0), a(x, 1)), 15
 NEXT x
 PCOPY 1, 0
 CLS
LOOP WHILE INKEY$ = ""

