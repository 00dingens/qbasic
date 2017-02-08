
'Die Reise eines Atoms

RANDOMIZE TIMER
CLS
INPUT "Wieviele Millimeter sollen die Striche hîchstens lang sein (1-100)?", g
g = g * 2: e = 320: f = 240
SCREEN 12
COLOR 8
FOR r = 1 TO 29
 PRINT TAB(18); "Eine beliebige Taste drÅcken, um abzubrechen!"
NEXT r
COLOR 5
DO
 FOR a = 1 TO 5
  FOR b = 1 TO 15
   c = (RND * g - (g / 2))
   d = (RND * g - (g / 2))
   LINE (e, f)-(e + c, f + d), b
   LINE (640 - e, 480 - f)-(640 - e - c, 480 - f - d), b
   IF e + c < 640 OR e + c > 0 THEN e = e + c
   IF e + c > 640 OR e + c < 0 THEN e = e - c
   IF f + d < 480 OR f + d > 0 THEN f = f + d
   IF f + d > 480 OR f + d < 0 THEN f = f - d
  NEXT b
 NEXT a
LOOP WHILE INKEY$ = ""
END

