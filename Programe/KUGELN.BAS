DIM x(10000) AS INTEGER, y(10000) AS INTEGER, s(10000) AS INTEGER
anz = 150

RANDOMIZE TIMER
SCREEN 12
DO: LOOP WHILE INKEY$ = ""
anz = anz - 1
FOR z = 0 TO anz
 x(z) = (z MOD 10) * 3 + 300
 y(z) = INT(z / 10) * 3 + 10
NEXT z

FOR t = 0 TO anz
 z = INT(RND * (anz))
 SWAP x(t), x(z)
 SWAP y(t), y(z)
NEXT t

LINE (290, 100)-(330, 140), 1
LINE (290, 101)-(330, 141), 1
LINE (340, 140)-(300, 180), 2
LINE (340, 141)-(300, 181), 2
LINE (290, 200)-(330, 240), 1
LINE (290, 201)-(330, 241), 1
LINE (340, 240)-(300, 280), 2
LINE (340, 241)-(300, 281), 2
LINE (290, 300)-(330, 340), 1
LINE (290, 301)-(330, 341), 1
LINE (340, 340)-(300, 380), 2
LINE (340, 341)-(300, 381), 2

DO
 FOR z = 0 TO anz
  PSET (x(z), y(z)), 0
  s(z) = s(z) + 1
  FOR i = 1 TO s(z)
   p0 = POINT(x(z) - 1, y(z)) + POINT(x(z) - 2, y(z))
   p1 = POINT(x(z) - 2, y(z) + 2)
   p2 = POINT(x(z) - 1, y(z) + 2)
   p3 = POINT(x(z), y(z) + 2)
   p4 = POINT(x(z) + 1, y(z) + 2)
   p5 = POINT(x(z) + 2, y(z) + 2)
   p6 = POINT(x(z) + 1, y(z)) + POINT(x(z) + 2, y(z))
  
   IF p3 = 0 THEN
    IF p2 = 0 AND p4 = 0 AND POINT(x(z), y(z) + 1) = 0 THEN
     y(z) = y(z) + 1: GOTO jo
    ELSE
     IF RND < .5 AND p4 = 0 AND p5 = 0 AND p6 = 0 THEN s(z) = i: x(z) = x(z) + 1: EXIT FOR
     IF p1 = 0 AND p2 = 0 AND p0 = 0 THEN s(z) = i: x(z) = x(z) - 1: GOTO jo
     IF p4 = 0 AND p5 = 0 AND p6 = 0 THEN s(z) = i: x(z) = x(z) + 1: GOTO jo
    END IF
   ELSE
    s(z) = 0
    IF RND < .5 AND p4 = 0 AND p5 = 0 AND p6 = 0 THEN x(z) = x(z) + 1: GOTO jh
    IF p1 = 0 AND p2 = 0 AND p0 = 0 THEN x(z) = x(z) - 1: GOTO jh
    IF p4 = 0 AND p5 = 0 AND p6 = 0 THEN x(z) = x(z) + 1: GOTO jh
   GOTO jh
   END IF
jo:
 NEXT i
jh:
  p1 = POINT(x(z) - 1, y(z) + 2)
  p2 = POINT(x(z) - 1, y(z))
  p3 = POINT(x(z), y(z) + 2)
  p4 = POINT(x(z) + 1, y(z))
  p5 = POINT(x(z) + 1, y(z) + 2)
  IF p3 <> 0 THEN
   IF p2 = 0 AND p1 = 0 AND RND < .5 THEN x(z) = x(z) - 1: GOTO ju
   IF p4 = 0 AND p5 = 0 THEN x(z) = x(z) + 1: GOTO ju
   IF p2 = 0 AND p1 = 0 THEN x(z) = x(z) - 1: GOTO ju
ju:
  END IF
  IF p4 <> 0 AND p2 = 0 AND POINT(x(z) - 2, y(z)) = 0 AND RND < .5 THEN x(z) = x(z) - 1: GOTO jz
  IF p2 <> 0 AND p4 = 0 AND POINT(x(z) + 2, y(z)) = 0 THEN x(z) = x(z) + 1: GOTO jz
  IF p4 <> 0 AND p2 = 0 AND POINT(x(z) - 2, y(z)) = 0 THEN x(z) = x(z) - 1: GOTO jz

jz:
 '''''''''''''''''''''''''''''''''''''''''''''''''''''' IF POINT(x(z), y(z)) = 12 THEN BEEP: CIRCLE (x(z), y(z)), 3, 14: DO: LOOP
  PSET (x(z), y(z)), 15
 NEXT z

LOOP WHILE INKEY$ = ""

