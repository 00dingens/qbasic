SCREEN 7
PRINT
PRINT TAB(15); "LINIENEDITOR"
PRINT TAB(16); "von Rafael"
PRINT : PRINT : PRINT : PRINT TAB(16); "Code: "
FOR x = 0 TO 15
 LINE (x * 10 + 80, 30)-(x * 10 + 90, 40), 15, B
NEXT x
p = 4
a = 8
LINE (0, 60)-(320, 60), 0
LINE (0, 60)-(320, 60), 15, , a
LINE (0, 0)-(319, 199), 0, B
LINE (0, 0)-(319, 199), 15, B, a
LINE (100, 5)-(219, 25), 0, B
LINE (100, 5)-(219, 25), 15, B, a
LOCATE 7, 22: PRINT RIGHT$("0000" + HEX$(a), 4)
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE CHR$(0) + "H": a = a XOR (2 ^ p)
 CASE CHR$(0) + "P": a = a XOR (2 ^ p)
 CASE CHR$(0) + "K": p = (p + 1) MOD 16
 CASE CHR$(0) + "M": p = (p + 15) MOD 16
 END SELECT
 LINE (80, 30)-(240, 40), 0, BF
 FOR x = 0 TO 15
  LINE (x * 10 + 80, 30)-(x * 10 + 90, 40), 8, B
  IF INT(a / (2 ^ (15 - x))) MOD 2 = 1 THEN PAINT (x * 10 + 85, 35), 15, 8
 NEXT x
 LINE (0, 60)-(320, 60), 0
 LINE (0, 60)-(320, 60), 15, , a
 LINE (0, 0)-(319, 199), 0, B
 LINE (0, 0)-(319, 199), 15, B, a
 LINE (100, 5)-(219, 25), 0, B
 LINE (100, 5)-(219, 25), 15, B, a
 LOCATE 7, 22: PRINT RIGHT$("0000" + HEX$(a), 4)
LOOP UNTIL t$ = CHR$(27)

