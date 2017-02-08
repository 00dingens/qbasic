DIM x(100), y(100), a(100), b(100), r(100), c(100)
RANDOMIZE 0
SCREEN 7, , 0, 1
anz = 2
FOR i = 1 TO anz
 x(i) = RND * 320
 y(i) = RND * 200
 r(i) = 10
 c(i) = i MOD 16
NEXT i
y(1) = 100: y(2) = 105: a(1) = -1
DO
 PCOPY 0, 1
 CLS
 FOR i = 1 TO anz
  x(i) = x(i) + a(i)
  y(i) = y(i) + b(i)
  IF x(i) + r(i) > 319 OR x(i) - r(i) < 0 THEN x(i) = x(i) - a(i): a(i) = -a(i)
  IF y(i) + r(i) > 199 OR y(i) - r(i) < 0 THEN y(i) = y(i) - b(i): b(i) = -b(i)
  CIRCLE (x(i), y(i)), r(i), c(i), , , 1
  PAINT (x(i), y(i)), c(i), c(i)
  FOR o = 1 TO anz
   IF i <> o AND (x(i) - x(o)) ^ 2 + (y(i) - y(o)) ^ 2 < (r(i) + r(o)) ^ 2 THEN
    SWAP a(i), a(o)
    SWAP a(i), a(o)
    x(i) = x(i) - a(i)
    y(i) = y(i) - b(i)
   END IF
  NEXT o
 NEXT i
LOOP WHILE INKEY$ = ""


