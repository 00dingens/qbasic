FOR z = 0 TO 7
 SCREEN 7, , z, z
  FOR x = 0 TO 20
   CIRCLE (160, 100), x * 8 + z
  NEXT x
 BEEP
NEXT z
DO
 FOR z = 0 TO 7
  SCREEN 7, , z, z
  FOR x = 1 TO 5000: NEXT x
 NEXT z
LOOP WHILE INKEY$ = ""

' FOR y = 0 TO 199
'  FOR x = 0 TO 319
'   PSET (x, y), INT(RND * 16)
'  NEXT x
' NEXT y

