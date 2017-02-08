OPEN "c:\eigene~1\rafael\manneken\man2.bmp" FOR BINARY AS #1
DIM z(2) AS INTEGER, q(1) AS STRING * 1
DIM bild(10000) AS INTEGER
GET #1, 19, z(1)
GET #1, 23, z(2)
a = 55
SCREEN 7', , 0, 1
 FOR x = 1 TO 7
  OUT &H3C8, x
  OUT &H3C9, x * 8
  OUT &H3C9, x * 8
  OUT &H3C9, x * 8
 NEXT x
 FOR y = 1 TO z(2)
  FOR x = 1 TO z(1)
   GET #1, a, q(1)
   PSET (x, z(2) - y), INT(ASC(q(1)) / 32)
   a = a + 3
  NEXT x
  'a = a + 2
 NEXT y
CLOSE

GET (160, 0)-(319, 199), bild
SCREEN 7, , 2, 1
PAINT (0, 0), 7
PUT (70, 0), bild, PSET
SCREEN 7, , 0, 1
GET (1, 0)-(159, 199), bild
CLS
PAINT (0, 0), 7
PUT (80, 0), bild, PSET

t = TIMER
DO
 DO: LOOP UNTIL t < TIMER: t = t + .2
 PCOPY 0, 1
 DO: LOOP UNTIL t < TIMER: t = t + .2
 PCOPY 2, 1
LOOP WHILE INKEY$ = ""
SLEEP

