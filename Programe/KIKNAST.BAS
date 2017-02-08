ON ERROR GOTO e
DIM st(9) AS STRING * 1
CLS
PRINT "KI - TicTacToe"
INPUT "Name"; name$
er = 0
OPEN name$ + ".ki" FOR INPUT AS #1
CLOSE
IF er = 1 THEN
 INPUT "Soll eine neue datei erstellt werden(j/n)"; jn$
 IF jn$ = "j" THEN
  OPEN name$ + ".ki" FOR OUTPUT AS #1
  CLOSE
 ELSE
  END
 END IF
END IF

'OPEN name$ + ".ki" FOR BINARY AS #1

los:
CLS
m$ = "O": c$ = "X"
INPUT "Darf ich anfangen"; jn$
IF jn$ = "n" THEN SWAP m$, c$
CLS
LOCATE 10, 35: PRINT "   ³   ³   "
LOCATE 11, 35: PRINT "ÄÄÄÅÄÄÄÅÄÄÄ"
LOCATE 12, 35: PRINT "   ³   ³   "
LOCATE 13, 35: PRINT "ÄÄÄÅÄÄÄÅÄÄÄ"
LOCATE 14, 35: PRINT "   ³   ³   "
FOR x = 1 TO 9: st(x) = " ": NEXT x

DO
 GOSUB aus
 s = 0
 DO
  DO: t$ = INKEY$: LOOP WHILE t$ = ""
  SELECT CASE t$
  CASE "1": IF st(1) = " " THEN st(1) = m$: s = 1
  CASE "2": IF st(2) = " " THEN st(2) = m$: s = 1
  CASE "3": IF st(3) = " " THEN st(3) = m$: s = 1
  CASE "4": IF st(4) = " " THEN st(4) = m$: s = 1
  CASE "5": IF st(5) = " " THEN st(5) = m$: s = 1
  CASE "6": IF st(6) = " " THEN st(6) = m$: s = 1
  CASE "7": IF st(7) = " " THEN st(7) = m$: s = 1
  CASE "8": IF st(8) = " " THEN st(8) = m$: s = 1
  CASE "9": IF st(9) = " " THEN st(9) = m$: s = 1
  CASE CHR$(27): END
  CASE ELSE: BEEP
  END SELECT
 LOOP UNTIL s = 1
 a = a + 1
 GOSUB win
 GOSUB aus

LOOP UNTIL a = 9 OR won <> 0

CLOSE
END



e: er = 1: RESUME NEXT

aus:
 LOCATE 14, 36: PRINT st(1)
 LOCATE 14, 40: PRINT st(2)
 LOCATE 14, 44: PRINT st(3)
 LOCATE 12, 36: PRINT st(4)
 LOCATE 12, 40: PRINT st(5)
 LOCATE 12, 44: PRINT st(6)
 LOCATE 10, 36: PRINT st(7)
 LOCATE 10, 40: PRINT st(8)
 LOCATE 10, 44: PRINT st(9)
RETURN

win:
 w$ = ""
 IF st(1) = st(4) AND st(1) = st(7) THEN w$ = st(1)
 IF st(2) = st(5) AND st(2) = st(8) THEN w$ = st(2)
 IF st(3) = st(6) AND st(3) = st(9) THEN w$ = st(3)
 IF st(1) = st(2) AND st(1) = st(3) THEN w$ = st(1)
 IF st(4) = st(5) AND st(4) = st(6) THEN w$ = st(4)
 IF st(7) = st(8) AND st(7) = st(9) THEN w$ = st(7)
 IF st(1) = st(5) AND st(1) = st(9) THEN w$ = st(1)
 IF st(3) = st(5) AND st(3) = st(7) THEN w$ = st(3)
 IF w$ = "" THEN won = 0
 IF w$ = "X" THEN won = 1
 IF w$ = "O" THEN won = 2
RETURN

