SCREEN 9, , 0, 1
anz = 15
g = 50
DIM x(16, 1, 3)
RESTORE f10
FOR q = 0 TO anz
 READ xa, ya, xb, yb
 x(q, 0, 0) = xa
 x(q, 0, 1) = ya
 x(q, 1, 0) = xb
 x(q, 1, 1) = yb
NEXT q
RESTORE j10m
FOR q = 0 TO anz
 READ xa, ya, xb, yb
 x(q, 0, 2) = xa
 x(q, 0, 3) = ya
 x(q, 1, 2) = xb
 x(q, 1, 3) = yb
NEXT q



FOR b = 0 TO g
 FOR a = 0 TO 15
  xa = x(a, 0, 0) + (x(a, 0, 2) - x(a, 0, 0)) * b / g
  ya = x(a, 0, 1) + (x(a, 0, 3) - x(a, 0, 1)) * b / g
  xb = x(a, 1, 0) + (x(a, 1, 2) - x(a, 1, 0)) * b / g
  yb = x(a, 1, 1) + (x(a, 1, 3) - x(a, 1, 1)) * b / g
  LINE (xa * 50, ya * 50)-(xb * 50, yb * 50)
 NEXT a
 PCOPY 0, 1
 CLS
NEXT b

f10:    'f10 reihe
DATA 0,0,5,0
DATA 5,0,5,1
DATA 5,1,1,1
DATA 1,1,1,2
DATA 1,2,4,2
DATA 4,2,4,3
DATA 4,3,1,3
DATA 1,3,1,5
DATA 1,5,0,5
DATA 0,5,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0


j10m: 'j10 mix
DATA 5,4,4,5
DATA 4,3,4,0
DATA 0,4,1,3
DATA 4,5,1,5
DATA 5,0,5,4
DATA 4,0,5,0
DATA 1,3,2,4
DATA 1,5,0,4
DATA 3,4,4,3
DATA 2,4,3,4
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0


j10r:     'j10 reihe
DATA 2,4,3,4
DATA 3,4,4,3
DATA 4,3,4,0
DATA 4,0,5,0
DATA 5,0,5,4
DATA 5,4,4,5
DATA 4,5,1,5
DATA 1,5,0,4
DATA 0,4,1,3
DATA 1,3,2,4
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0
DATA 0,0,0,0

