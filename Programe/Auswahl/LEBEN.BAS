SCREEN 12
a = 1
WINDOW (0, 0)-(160, 50000)
DO
 PSET (0, 0)
 j = 1
 LOCATE 1, 20
 PRINT "          "
 LOCATE 1, 1
 PRINT " Dein Geburtsjahr ";
 INPUT z
 h = z
 DO WHILE z > 1
   IF z MOD 2 = 0 THEN z = z / 2 ELSE z = 3 * z + 1
   j = j + 1
   LINE -(j, z), a
 LOOP
 DO: LOOP WHILE INKEY$ = ""
 a = a + 1
 IF a = 16 THEN a = 1
LOOP UNTIL h = 0

