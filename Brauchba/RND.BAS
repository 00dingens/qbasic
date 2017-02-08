
'16-bit zufallszahl


SCREEN 12
DO: LOOP WHILE INKEY$ = ""

b = 16       'anz bit    'ver„nderbar
c = 2
bx = INT(b / 2)
by = b - bx
DIM a(b)
'FOR x = 0 TO b - 1
 'a(x) = INT(RND * 2)
'NEXT x
READ q
FOR x = 0 TO 2 ^ b

 RESTORE wechsel
 FOR y = 1 TO q
  READ n, m
  SWAP a(n), a(m)
 NEXT y

 zz = 0
 FOR y = 0 TO b - 1
  zz = zz + a(y) * (2 ^ y)
 NEXT y
 zz = zz + 1111                'zahl erh”hen  'ver„nderbar
 z = zz
 FOR y = 0 TO b - 1
  a(y) = zz MOD 2
  zz = INT(zz / 2)
 NEXT y

 ax = 0: ay = 0
 FOR y = 0 TO bx - 1
  ax = ax + a(y) * 2 ^ y
 NEXT y
 FOR y = bx TO b - 1
  ay = ay + a(y) * 2 ^ (y - bx)
 NEXT y
 IF POINT(ax, ay) = c THEN c = (c + 1) MOD 16
 IF INKEY$ <> "" THEN END
 PSET (ax, ay), c

NEXT x

DATA 3              
         'anz vertauschungen               'ver„nderbar
wechsel:
DATA 11,10,10, 9,8,6  
         'paare die geswapt werden         'ver„nderbar

