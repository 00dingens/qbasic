RANDOMIZE TIMER
SCREEN 7, , 1, 0
an = 10
DIM a(an, 3), z(300)
FOR x = 1 TO an
 a(x, 0) = RND * 100
 a(x, 1) = RND * 100
 a(x, 2) = RND * 4 - 2
 a(x, 3) = RND * 4 - 2
NEXT x
DO
 FOR x = 1 TO an
  PSET (110 + a(x, 0), 50 + a(x, 1)), 0
 NEXT x
 FOR x = 1 TO an
  a(x, 0) = a(x, 0) + a(x, 2)
  a(x, 1) = a(x, 1) + a(x, 3)
  IF a(x, 0) < 0 OR a(x, 0) > 100 OR a(x, 1) < 0 OR a(x, 1) > 100 THEN
   a(x, 0) = RND * 100
   a(x, 1) = RND * 100
   a(x, 2) = RND * 4 - 2
   a(x, 3) = RND * 4 - 2
   DO
    a(x, 0) = a(x, 0) - a(x, 2)
    a(x, 1) = a(x, 1) - a(x, 3)
   LOOP UNTIL a(x, 0) < 0 OR a(x, 0) > 100 OR a(x, 1) < 0 OR a(x, 1) > 100
  END IF
 NEXT x
 FOR x = 1 TO an
  PSET (110 + a(x, 0), 50 + a(x, 1))
 NEXT x


 FOR x = 50 TO 150 STEP 2                    'Í»
  SCREEN 7, , 1, 0                           ' º
  GET (110, x)-(210, x + 1), z               ' º
  SCREEN 7, , 0, 0                           ' º
  LINE (100, x)-(220, x), 0                  ' º
  LINE (110, x + 2)-(210, x + 2), 2'15       ' º
  PUT (110, x), z, PSET                      ' º Alternative 1
  SCREEN 7, , 1, 0                           ' º
  FOR t = 1 TO 1000: NEXT t                  ' º
 NEXT x                                      ' º
 SCREEN 7, , 0, 0                            ' º
 LINE (100, 152)-(220, 152), 0               ' º
 SCREEN 7, , 1, 0                            'Í¼

' PCOPY 1, 0                                   '   Alternative 2


 'FOR t = 1 TO 3000: NEXT t                   '   Optional
LOOP WHILE INKEY$ = ""

