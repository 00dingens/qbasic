RANDOMIZE TIMER
DIM a%(32000)
SCREEN 13
FOR a1 = 0 TO 1
FOR a2 = 0 TO 1
FOR a3 = 0 TO 1
FOR a4 = 0 TO 1
FOR a5 = 0 TO 1
FOR a6 = 0 TO 1
FOR a7 = 0 TO 1
FOR a8 = 0 TO 1
OUT &H3C8, a1 * 128 + a2 * 64 + a3 * 32 + a4 * 16 + a5 * 8 + a6 * 4 + a7 * 2 + a8 * 1
OUT &H3C9, (a1 + a4 + a5 + a7) * 15 + 3
OUT &H3C9, (a2 + a4 + a6 + a7) * 15 + 3
OUT &H3C9, (a3 + a5 + a6 + a7) * 15 + 3
NEXT a8
NEXT a7
NEXT a6
NEXT a5
NEXT a4
NEXT a3
NEXT a2
NEXT a1

FOR t = 0 TO 6
 LINE (0, 0)-(50, 50), 2 ^ (t + 1), BF
 GET (0, 0)-(49, 49), a%(t * 4000)
NEXT t

DIM x(8), y(8), n(8), m(8)
FOR t = 0 TO 6
 x(t) = 100'INT(RND * 250) + 15
 y(t) = 100'INT(RND * 120) + 15
 n(t) = RND * 2 - 1
 m(t) = RND * 2 - 1
NEXT t
CLS
DO
 FOR t = 0 TO 6
  PUT (x(t), y(t)), a%(t * 4000)
 NEXT t
 FOR t = 0 TO 6
  x(t) = x(t) + n(t)
  y(t) = y(t) + m(t)
  IF x(t) < 10 OR x(t) > 270 THEN n(t) = -SGN(n(t)) * RND
  IF y(t) < 10 OR y(t) > 140 THEN m(t) = -SGN(m(t)) * RND
 NEXT t


LOOP WHILE INKEY$ = ""

