RANDOMIZE TIMER
DIM a(1000, 3, 1)   'nummer ,koord/verb, art
DIM r(1000)
SCREEN 7, , 0, 1
READ anz
a(0, 0, 0) = anz

ab = 10         'abstand^2
g = 1           'kreisgrîsse
rn = 0          'rn=1:punkte zufÑllig verteilen  rn=0:vorgegebene positionen

'---einlesen
'punkte
FOR q = 1 TO anz
 READ a(q, 0, 0), a(q, 1, 0), a(q, 2, 0), a(q, 3, 0)       'x,y,z,c
 IF rn = 1 THEN
  a(q, 0, 0) = INT(RND * 100 - 50)
  a(q, 1, 0) = INT(RND * 100 - 50)
  a(q, 2, 0) = INT(RND * 100 - 50)
 END IF
NEXT q
'verbindungen
FOR q = 1 TO anz
 READ a(q, 0, 1), a(q, 1, 1), a(q, 2, 1), a(q, 3, 1)
NEXT q

PSET (100, 100)
PSET (220, 100)
PRINT "Taste drÅcken!"
PCOPY 0, 1
DO: LOOP WHILE INKEY$ = ""
DO
'---bewegen
FOR q = 1 TO anz
 x = a(q, 0, 0): y = a(q, 1, 0): z = a(q, 2, 0)
 xn = x: yn = y: zn = z
 FOR t = 0 TO 3
  la = SQR((x - a(a(q, t, 1), 0, 0)) ^ 2 + (y - a(a(q, t, 1), 1, 0)) ^ 2 + (z - a(a(q, t, 1), 2, 0)) ^ 2)
  SELECT CASE la
  CASE IS < ab - 1:
   IF la <> 0 THEN
    xn = xn + (x - a(a(q, t, 1), 0, 0)) / la / 2
    yn = yn + (y - a(a(q, t, 1), 1, 0)) / la / 2
    zn = zn + (z - a(a(q, t, 1), 2, 0)) / la / 2
   END IF
  CASE IS > ab + 1
   xn = xn - (x - a(a(q, t, 1), 0, 0)) / la
   yn = yn - (y - a(a(q, t, 1), 1, 0)) / la
   zn = zn - (z - a(a(q, t, 1), 2, 0)) / la
  CASE ELSE
  END SELECT
 NEXT t
 
 FOR t = 1 TO anz
  la = SQR((x - a(t, 0, 0)) ^ 2 + (y - a(t, 1, 0)) ^ 2 + (z - a(t, 2, 0)) ^ 2)
  IF la <> 0 THEN
   f = 200                          'je mehr atome, desto grîsser
   IF la < ab * 4 THEN f = 30
   IF la < ab * 3 THEN f = 20
   IF la < ab * 2 THEN f = 10
   IF la < ab THEN f = 5

    xn = xn + (x - a(t, 0, 0)) / la / f
    yn = yn + (y - a(t, 1, 0)) / la / f
    zn = zn + (z - a(t, 2, 0)) / la / f
  END IF
 NEXT t
 
  la = SQR(x ^ 2 + y ^ 2 + z ^ 2)
  IF la <> 0 THEN
   xn = xn - x / la / 5
   yn = yn - y / la / 5
   zn = zn - z / la / 5
  END IF

 a(q, 0, 0) = xn: a(q, 1, 0) = yn: a(q, 2, 0) = zn
NEXT q

'darstellen
FOR q = 1 TO anz
 r(q) = q
NEXT q
FOR q = 1 TO anz
 FOR t = q + 1 TO anz
  IF a(q, 2, 0) < a(t, 2, 0) THEN SWAP r(q), r(t)
 NEXT t
NEXT q
CLS
FOR q = 1 TO anz
 x = a(r(q), 0, 0): y = a(r(q), 1, 0): z = a(r(q), 2, 0): c = a(r(q), 3, 0)
 CIRCLE (100 + x + z / 2, y + 100), g, 6
 PAINT STEP(0, 0), 6, 6
 CIRCLE (100 + x + z / 2, y + 100), g, c
 PAINT STEP(0, 0), c + 8, c
 CIRCLE (220 + x + z / 4, y + 100), g, 6
 PAINT STEP(0, 0), 6, 6
 CIRCLE (220 + x + z / 4, y + 100), g, c
 PAINT STEP(0, 0), c + 8, c
NEXT q
PCOPY 0, 1
LOOP WHILE INKEY$ = ""



'tri...?
DATA 33
DATA 10,10,10,1
DATA 10,10,20,1
DATA 10,20,10,7
DATA 10,20,20,7
DATA 20,10,10,7
DATA 20,10,20,1
DATA 20,20,10,7
DATA 20,20,20,7
DATA 10,10,00,7
DATA 10,00,10,4
DATA 10,00,00,4

DATA 00,10,10,1
DATA 00,10,00,1
DATA 00,00,10,7
DATA 00,00,00,7
DATA 00,00,20,7
DATA 00,20,00,1
DATA 00,20,20,7
DATA 20,00,00,7
DATA 20,00,20,7
DATA 20,20,00,4
DATA 20,20,20,4

DATA 00,00,30,1
DATA 10,10,30,1
DATA 10,30,10,7
DATA 10,30,30,7
DATA 30,10,10,7
DATA 30,10,30,1
DATA 30,30,10,7
DATA 30,30,30,7
DATA 20,30,10,7
DATA 10,20,30,4
DATA 30,10,20,4

DATA 2,6,10,33
DATA 1,3,4,5
DATA 2,3,3,3
DATA 2,4,4,4
DATA 2,5,5,5
DATA 1,7,8,9
DATA 6,7,7,7
DATA 6,8,8,8
DATA 6,9,9,9
DATA 1,10,10,11
DATA 10,11,11,12

DATA 11,13,17,21
DATA 12,14,15,16
DATA 13,14,14,14
DATA 13,15,15,15
DATA 13,16,16,16
DATA 12,18,19,20
DATA 17,18,18,18
DATA 17,19,19,19
DATA 17,20,20,20
DATA 12,21,21,22
DATA 21,22,22,23

DATA 22,24,28,32
DATA 23,25,26,27
DATA 24,25,25,25
DATA 24,26,26,26
DATA 24,27,27,27
DATA 23,29,30,31
DATA 28,29,29,29
DATA 28,30,30,30
DATA 28,31,31,31
DATA 23,32,32,33
DATA 32,33,33,1





'Glycerintrinitrat
DATA 20
DATA 50,50,10,1
DATA -50,50,20,1
DATA 50,50,30,1
DATA -50,50,40,7
DATA 50,50,50,7
DATA -50,10,10,7
DATA 50,10,20,7
DATA -50,10,30,7
DATA 50,10,40,4
DATA -50,10,50,4
DATA 10,50,10,4
DATA -10,50,20,2
DATA 10,50,30,2
DATA -10,50,40,2
DATA 10,50,50,4
DATA -10,10,10,4
DATA 10,10,20,4
DATA -10,10,30,4
DATA 10,10,40,4
DATA -10,10,50,4

DATA 2,4,5,9
DATA 1,3,6,10
DATA 2,7,8,11
DATA 1,4,4,4
DATA 1,5,5,5
DATA 2,6,6,6
DATA 3,7,7,7
DATA 3,8,8,8
DATA 1,12,9,9
DATA 2,13,10,10
DATA 3,14,11,11
DATA 9,15,16,12
DATA 10,17,18,13
DATA 11,19,20,14
DATA 12,16,15,15
DATA 12,15,16,16
DATA 13,18,17,17
DATA 13,17,18,18
DATA 14,20,19,19
DATA 14,19,20,20

'ethanol (spiritus)
DATA 9
DATA 10,30,20,1
DATA -20,20,30,1
DATA 20,30,20,7
DATA -10,30,10,7
DATA 30,10,10,7
DATA -20,30,40,7
DATA 10,20,30,7
DATA -40,20,20,7
DATA 10,10,10,4
DATA 2,3,4,5
DATA 1,6,7,9
DATA 1,3,3,3
DATA 1,4,4,4
DATA 1,5,5,5
DATA 2,6,6,6
DATA 2,7,7,7
DATA 9,8,8,8
DATA 2,8,9,9

'c-gitter
DATA 16
DATA -10,-10,-10,1
DATA -20,-10,-10,1
DATA -10,-10,10,1
DATA -20,-10,10,1
DATA -10,10,-10,1
DATA -20,10,-10,1
DATA -10,10,10,1
DATA -20,10,10,1
DATA 10,-10,-10,1
DATA 20,-10,-10,1
DATA 10,-10,10,1
DATA 20,-10,10,1
DATA 10,10,-10,1
DATA 20,10,-10,1
DATA 10,10,10,1
DATA 20,10,10,1



