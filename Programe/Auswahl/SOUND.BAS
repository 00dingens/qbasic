
'H”her mit 8 oder 6, tiefer mit 2 oder 4

ON KEY(11) GOSUB hoeher
ON KEY(14) GOSUB tiefer
ON KEY(13) GOSUB einenhoeher
ON KEY(12) GOSUB einentiefer
ON KEY(1) GOSUB anaus
KEY(0) ON
q = SQR(SQR(SQR(SQR(SQR(2)))))
l = .1: x = 440
CLS
DO
 IF x > 37 AND x < 32766 THEN SOUND x, l
 LOCATE 12, 36: PRINT USING "#####.#############"; x
LOOP UNTIL INKEY$ = CHR$(13)
END
hoeher:
x = x * q
RETURN
tiefer:
x = x / q
RETURN
einenhoeher:
x = x + 1
RETURN
einentiefer:
x = x - 1
RETURN
anaus:
IF l = 0 THEN l = .1 ELSE l = 0
RETURN

