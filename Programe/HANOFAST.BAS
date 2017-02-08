DECLARE SUB bewege (anz, x, y, z, a() AS INTEGER, i() AS INTEGER)
DECLARE SUB mal (a() AS INTEGER)
DIM a(2, 100) AS INTEGER, i(2) AS INTEGER
SCREEN 7
anz = 20
FOR x = 0 TO anz
 a(0, x) = anz - x
NEXT x
i(0) = anz - 1
i(1) = -1: i(2) = -1

CLS
LINE (59, 40)-(61, 200), 7, BF, &H1
LINE (159, 40)-(161, 200), 7, BF
LINE (259, 40)-(261, 200), 7, BF
FOR x = 0 TO 2
 FOR z = 0 TO 20
  IF a(x, z) <> 0 THEN LINE (x * 100 + 60 - a(x, z) * 2, 190 - z * 8)-STEP(a(x, z) * 4, 6), 15, BF
  IF a(x, z) <> 0 THEN LINE (x * 100 + 61 - a(x, z) * 2, 191 - z * 8)-STEP(a(x, z) * 4 - 2, 4), (a(x, z) * 11) MOD 16, B
 NEXT z
NEXT x

bewege anz, 0, 1, 2, a(), i()

SUB bewege (anz, x, y, z, a() AS INTEGER, i() AS INTEGER)
IF anz > 1 THEN
 bewege anz - 1, x, z, y, a(), i()
 LINE (x * 100 + 60 - a(x, i(x)) * 2, 190 - i(x) * 8)-STEP(a(x, i(x)) * 4, 6), 0, BF
 SWAP a(x, i(x)), a(y, i(y) + 1)
 i(x) = i(x) - 1
 i(y) = i(y) + 1
 LINE (y * 100 + 60 - a(y, i(y)) * 2, 190 - i(y) * 8)-STEP(a(y, i(y)) * 4, 6), 15, BF
 LINE (y * 100 + 61 - a(y, i(y)) * 2, 191 - i(y) * 8)-STEP(a(y, i(y)) * 4 - 2, 4), (a(y, i(y)) * 11) MOD 16, B
 bewege anz - 1, z, y, x, a(), i()
ELSE
 LINE (x * 100 + 60 - a(x, i(x)) * 2, 190 - i(x) * 8)-STEP(a(x, i(x)) * 4, 6), 0, BF
 SWAP a(x, i(x)), a(y, i(y) + 1)
 i(x) = i(x) - 1
 i(y) = i(y) + 1
 LINE (y * 100 + 60 - a(y, i(y)) * 2, 190 - i(y) * 8)-STEP(a(y, i(y)) * 4, 6), 15, BF
 LINE (y * 100 + 61 - a(y, i(y)) * 2, 191 - i(y) * 8)-STEP(a(y, i(y)) * 4 - 2, 4), (a(y, i(y)) * 11) MOD 16, B
END IF
END SUB

