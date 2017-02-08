
'Sich ver„nderndes Muster V1.1
'Weiss und Schwarz trennen sich extremer als bei V1.0

RANDOMIZE TIMER
SCREEN 7
OUT &H3C8, 1
OUT &H3C9, 63
OUT &H3C9, 63
OUT &H3C9, 63
x = 50: y = 50    'Die Gr”sse (max: x = 127: y = 128)
DIM q%(x * y, 1)
FOR a = 0 TO x + 5
 FOR b = 0 TO y + 5
  PSET (a, b), INT(RND * 2)
 NEXT b
NEXT a
FOR a = 0 TO x - 1
 FOR b = 0 TO y - 1
  q%(a * y + b, 0) = a
  q%(a * y + b, 1) = b
 NEXT b
NEXT a
FOR a = 1 TO x * y
 w = RND * (x * y - a) + a
 SWAP q%(a, 0), q%(w, 0)
 SWAP q%(a, 1), q%(w, 1)
NEXT a
DO
 FOR a = 1 TO x * y
  z = 0
  FOR c = -1 TO 1
   FOR v = -1 TO 1
    z = z + POINT(q%(a, 0) + 3 + c, q%(a, 1) + 3 + v)
   NEXT v
  NEXT c
  SELECT CASE z
   CASE IS < 3: PSET (q%(a, 0) + 3, q%(a, 1) + 3), 0
   CASE IS > 6: PSET (q%(a, 0) + 3, q%(a, 1) + 3), 1
   CASE 3 TO 6: PSET (q%(a, 0) + 3, q%(a, 1) + 3), INT(RND * 2)
  END SELECT
 NEXT a
LOOP WHILE INKEY$ = ""

