DECLARE SUB bewege (anz, x, y, z, a() AS INTEGER, i() AS INTEGER)
DECLARE SUB mal (a() AS INTEGER)
DIM a(2, 100) AS INTEGER, i(2) AS INTEGER
SCREEN 7, , 0, 1
anz = 20
FOR x = 0 TO anz
 a(0, x) = anz - x
NEXT x
i(0) = anz - 1
i(1) = -1: i(2) = -1

bewege anz, 0, 1, 2, a(), i()

mal a()

SUB bewege (anz, x, y, z, a() AS INTEGER, i() AS INTEGER)
IF anz > 1 THEN
 bewege anz - 1, x, z, y, a(), i()
 SWAP a(x, i(x)), a(y, i(y) + 1)
 i(x) = i(x) - 1
 i(y) = i(y) + 1
 bewege anz - 1, z, y, x, a(), i()
ELSE
' PRINT x; y; i(y)
 SWAP a(x, i(x)), a(y, i(y) + 1)
 i(x) = i(x) - 1
 i(y) = i(y) + 1
END IF
mal a()
END SUB

SUB mal (a() AS INTEGER)
CLS
LINE (59, 5)-(61, 200), 7, BF
LINE (159, 5)-(161, 200), 7, BF
LINE (259, 5)-(261, 200), 7, BF
FOR x = 0 TO 2
 FOR z = 0 TO 20
  IF a(x, z) <> 0 THEN LINE (x * 100 + 60 - a(x, z) * 2, 190 - z * 8)-STEP(a(x, z) * 4, 6), 15, BF
  IF a(x, z) <> 0 THEN LINE (x * 100 + 61 - a(x, z) * 2, 191 - z * 8)-STEP(a(x, z) * 4 - 2, 4), (a(x, z) * 11) MOD 16, B
 NEXT z
NEXT x
PCOPY 0, 1
END SUB

