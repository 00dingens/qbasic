e = 50
win = 3.1415926# * 2 / e
DIM x(e), z(1000)
FOR q = 0 TO e
 x(q) = 9 * COS(q * win)
NEXT q
SCREEN 7, , 2, 0
FOR q = 1 TO 320 STEP 20
 FOR w = 1 TO 200 STEP 20
  LINE (q, w)-STEP(20, 20), INT(RND * 16), BF
 NEXT w
NEXT q
LOCATE 12, 14
COLOR 1: PRINT "Hallo du da!"
LOCATE 13, 12
COLOR 2: PRINT "Wie geht's dir?"
LOCATE 14, 16
COLOR 4: PRINT "© Rafael"
CIRCLE (156, 100), 80, 15, , , 1 / 2

DO
FOR a = 1 TO e
 PCOPY 2, 1
 SCREEN 7, , 1, 0
 FOR t = 0 TO 199
  GET (10, t)-(310, t), z
  PUT (10 + x((t + a) MOD e), t), z, PSET
 NEXT t
' FOR q = 10 TO 310
'  GET (q, 10)-(q, 190), z
'  PUT (q, 10 + x((q + a) MOD e)), z, PSET
' NEXT q
 PCOPY 1, 0
 IF INKEY$ <> "" THEN END
NEXT a
LOOP

