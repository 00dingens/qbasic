RANDOMIZE TIMER
DIM q(1) AS STRING * 1
DIM a(-1 TO 17, -1 TO 22), c(15, 20)
SCREEN 12
LOCATE 2, 35: PRINT "T E T R I S"
LOCATE 3, 34: PRINT "ÕÕÕÕÕÕÕÕÕÕÕÕÕ"
LOCATE 4, 32: PRINT "von Rafael Friesen"
LOCATE 6, 31: PRINT "Level eingeben (1-9)";
DO: sss = VAL(INKEY$): LOOP UNTIL sss > 0
PRINT sss
LOCATE 8, 25: PRINT "Soll das Level sich erhîhen (j/n)?";
DO: st$ = INKEY$: LOOP UNTIL st$ = "j" OR st$ = "n"
PRINT st$
ssss = sss
spd = (10 - sss) * 1000
PRINT "      Steuerung:"
PRINT : PRINT "   Die Steine bewegst du mit den Pfeiltasten nach rechts, links und unten."
PRINT "   Mit Y und X kannst du sie drehen und mit der Leertaste versenken."
PRINT "   Mit P machst du Pause und mit Escape hîrst du auf."
PRINT : PRINT "      DrÅcke eine Taste."
DO: LOOP WHILE INKEY$ = ""
pp = 1
CLS
'OPEN "c:\spiele\tetris\tetris.raf" FOR BINARY AS #1
OPEN "tetris.raf" FOR BINARY AS #1
FOR x = 0 TO 15
 OUT &H3C8, x
 GET #1, pp, q(0)
 pp = pp + 1
 OUT &H3C9, ASC(q(0))
 GET #1, pp, q(0)
 pp = pp + 1
 OUT &H3C9, ASC(q(0))
 GET #1, pp, q(0)
 pp = pp + 1
 OUT &H3C9, ASC(q(0))
NEXT x
FOR x = 0 TO 465
 FOR y = 0 TO 479
  GET #1, pp, q(0)
  pp = pp + 1
  PSET (x, y), ASC(q(0))
 NEXT y
NEXT x
CLOSE
FOR x = 1 TO 15
 a(x, 21) = 1
NEXT x
FOR y = 1 TO 20
 a(0, y) = 1: a(16, y) = 1
NEXT y
tim$ = TIME$
DO
 p = INT(RND * 7)
 cc = p + 2
 klotzen = klotzen + 1
 SELECT CASE p
 CASE 0
  IF a(7, 2) = 0 AND a(7, 3) = 0 AND a(8, 2) = 0 AND a(8, 3) = 0 THEN
   a(7, 2) = 2: c(7, 2) = cc
   a(7, 3) = 2: c(7, 3) = cc
   a(8, 2) = 2: c(8, 2) = cc
   a(8, 3) = 2: c(8, 3) = cc
   n = 7.5: m = 2.5
  ELSE
   GOTO lost
  END IF
 CASE 1
  IF a(7, 2) = 0 AND a(7, 3) = 0 AND a(8, 2) = 0 AND a(9, 2) = 0 THEN
   a(7, 2) = 2: c(7, 2) = cc
   a(7, 3) = 2: c(7, 3) = cc
   a(8, 2) = 2: c(8, 2) = cc
   a(9, 2) = 2: c(9, 2) = cc
   n = 8: m = 2
  ELSE
   GOTO lost
  END IF
 CASE 2
  IF a(7, 2) = 0 AND a(8, 2) = 0 AND a(8, 3) = 0 AND a(9, 2) = 0 THEN
   a(7, 2) = 2: c(7, 2) = cc
   a(8, 2) = 2: c(8, 2) = cc
   a(8, 3) = 2: c(8, 3) = cc
   a(9, 2) = 2: c(9, 2) = cc
   n = 8: m = 2
  ELSE
   GOTO lost
  END IF
 CASE 3
  IF a(7, 2) = 0 AND a(8, 2) = 0 AND a(9, 2) = 0 AND a(9, 3) = 0 THEN
   a(7, 2) = 2: c(7, 2) = cc
   a(8, 2) = 2: c(8, 2) = cc
   a(9, 2) = 2: c(9, 2) = cc
   a(9, 3) = 2: c(9, 3) = cc
   n = 8: m = 2
  ELSE
   GOTO lost
  END IF
 CASE 4
  IF a(7, 2) = 0 AND a(8, 2) = 0 AND a(8, 3) = 0 AND a(9, 3) = 0 THEN
   a(7, 2) = 2: c(7, 2) = cc
   a(8, 2) = 2: c(8, 2) = cc
   a(8, 3) = 2: c(8, 3) = cc
   a(9, 3) = 2: c(9, 3) = cc
   n = 8: m = 2
  ELSE
   GOTO lost
  END IF
 CASE 5
  IF a(6, 3) = 0 AND a(7, 3) = 0 AND a(8, 3) = 0 AND a(9, 3) = 0 THEN
   a(6, 3) = 2: c(6, 3) = cc
   a(7, 3) = 2: c(7, 3) = cc
   a(8, 3) = 2: c(8, 3) = cc
   a(9, 3) = 2: c(9, 3) = cc
   n = 7: m = 3
  ELSE
   GOTO lost
  END IF
 CASE 6
  IF a(7, 3) = 0 AND a(8, 2) = 0 AND a(8, 3) = 0 AND a(9, 2) = 0 THEN
   a(7, 3) = 2: c(7, 3) = cc
   a(8, 2) = 2: c(8, 2) = cc
   a(8, 3) = 2: c(8, 3) = cc
   a(9, 2) = 2: c(9, 2) = cc
   n = 8: m = 2
  ELSE
   GOTO lost
  END IF
 END SELECT
weiter1:
 GOSUB rep
 FOR ttt = 1 TO spd
  LOCATE 1, 80: PRINT " "
  t$ = INKEY$
  IF t$ <> "" THEN
   SELECT CASE t$
   CASE CHR$(0) + "K": GOSUB schli
   CASE CHR$(0) + "M": GOSUB schre
   CASE CHR$(0) + "P": GOSUB schru
   CASE "p": DO: LOOP WHILE INKEY$ = ""
   CASE "x": GOSUB dreli
   CASE "y": GOSUB drere
   CASE " ": GOSUB strike
   CASE CHR$(27): GOTO ende
   CASE ELSE
   END SELECT
   GOSUB rep
  END IF
 NEXT ttt
 GOSUB schru
 IF fest = 0 THEN GOTO weiter1
 FOR x = 1 TO 15
  FOR y = 20 TO 1 STEP -1
   IF a(x, y) = 2 THEN a(x, y) = 1: c(x, y) = cc
  NEXT y
 NEXT x
 fucku = 0
 FOR y = 1 TO 20
  lin = 0
  FOR x = 1 TO 15
   lin = lin + a(x, y)
  NEXT x
  IF lin = 15 THEN
   FOR z = y TO 1 STEP -1
    FOR u = 1 TO 15
     c(u, z) = c(u, z - 1)
     a(u, z) = a(u, z - 1)
    NEXT u
   NEXT z
   fucku = fucku + 1
  END IF
 NEXT y
 IF fucku = 0 THEN popo = 0
 IF fucku = 1 THEN popo = 10: ll1 = ll1 + 1: PLAY "o1t255l64cdefgab>cdefgab"
 IF fucku = 2 THEN popo = 30: ll2 = ll2 + 1: PLAY "o1t255l64cdefgab>cdefgab>cdefgab>cdefgab"
 IF fucku = 3 THEN popo = 60: ll3 = ll3 + 1: PLAY "o1t255l64cdefgab>cdefgab>cdefgab>cdefgab>cdefgabagfedc<bagfedc<bagfedc<bagfedc<bagfedc"
 IF fucku = 4 THEN popo = 100: ll4 = ll4 + 1: PLAY  _
"o1t255l64cdefgab>cdefgab>cdefgab>cdefgab>cdefgab>cdefgabo1cdefgab>cdefgab>cdefgab>cdefgab>cdefgab>cdefgabo1cdefgab>cdefgab>cdefgab>cdefgab>cdefgab>cdefgabagfedc<bagfedc<bagfedc<bagfedc<bagfedc<bagfedc"
 punk = punk + popo
 pu = pu + popo
 IF pu >= 400 AND sss < 9 AND st$ = "j" THEN sss = sss + 1: spd = (10 - sss) * 1000: pu = pu - 400
LOOP

schru:
fest = 0
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 2 AND a(x, y + 1) = 1 THEN fest = 1: RETURN
 NEXT y
NEXT x
FOR x = 1 TO 15
 FOR y = 20 TO 1 STEP -1
  IF a(x, y) = 2 THEN a(x, y + 1) = 2: a(x, y) = 0: c(x, y + 1) = cc: c(x, y) = 0
 NEXT y
NEXT x
m = m + 1
RETURN

schre:
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 2 AND a(x + 1, y) = 1 THEN RETURN
 NEXT y
NEXT x
FOR x = 15 TO 1 STEP -1
 FOR y = 1 TO 20
  IF a(x, y) = 2 THEN a(x + 1, y) = 2: a(x, y) = 0: c(x + 1, y) = cc: c(x, y) = 0
 NEXT y
NEXT x
n = n + 1
RETURN

schli:
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 2 AND a(x - 1, y) = 1 THEN RETURN
 NEXT y
NEXT x
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 2 THEN a(x - 1, y) = 2: a(x, y) = 0: c(x - 1, y) = cc: c(x, y) = 0
 NEXT y
NEXT x
n = n - 1
RETURN

rep:
FOR x = 1 TO 15
 FOR y = 1 TO 20
  LINE (x * 16 + 62, y * 16 + 56)-STEP(14, 14), c(x, y), BF
 NEXT y
NEXT x
LOCATE 6, 44: PRINT "Level"
LOCATE 8, 45: PRINT sss
LOCATE 11, 43: PRINT "Punkte"
LOCATE 13, 44: PRINT RIGHT$("0000" + RTRIM$(LTRIM$(STR$(punk))), 5)
LOCATE 16, 43: PRINT "Steine"
LOCATE 18, 44: PRINT RIGHT$("    " + RTRIM$(LTRIM$(STR$(klotzen))), 5)
LOCATE 21, 44: PRINT "Zeit"
LOCATE 23, 44: PRINT LEFT$(TIME$, 5)

RETURN

strike:
DO
 GOSUB schru
LOOP UNTIL fest = 1
GOSUB rep
RETURN

dreli:
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 2 THEN
   IF a(n + y - m, m + n - x) = 1 THEN RETURN
  END IF
 NEXT y
NEXT x
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 2 THEN
   IF a(n + m - y, -n + m + x) <> 2 AND a(n + m - y, -n + m + x) <> 4 THEN a(x, y) = 4: c(x, y) = 0
   IF a(n - m + y, n + m - x) = 0 THEN a(n - m + y, n + m - x) = 3: c(n - m + y, n + m - x) = cc
  END IF
 NEXT y
NEXT x
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 3 THEN a(x, y) = 2
  IF a(x, y) = 4 THEN a(x, y) = 0
 NEXT y
NEXT x
RETURN

drere:
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 2 THEN
   IF a(n + m - y, -n + m + x) = 1 THEN RETURN
  END IF
 NEXT y
NEXT x
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 2 THEN
   IF a(n - m + y, n + m - x) <> 2 AND a(n - m + y, n + m - x) <> 4 THEN a(x, y) = 4: c(x, y) = 0
   IF a(n + m - y, -n + m + x) = 0 THEN a(n + m - y, -n + m + x) = 3: c(n + m - y, -n + m + x) = cc
  END IF
 NEXT y
NEXT x
FOR x = 1 TO 15
 FOR y = 1 TO 20
  IF a(x, y) = 3 THEN a(x, y) = 2
  IF a(x, y) = 4 THEN a(x, y) = 0
 NEXT y
NEXT x
RETURN


lost:
LOCATE 15, 62: PRINT "Du hast verloren!"
LOCATE 16, 62: PRINT "DrÅcke eine Taste!"
DO: LOOP WHILE INKEY$ = ""
ende:
LINE (78, 72)-(318, 390), 0, BF
LOCATE 12, 11: PRINT "Du hast im "; RTRIM$(LTRIM$(STR$(ssss))); ". - "; RTRIM$(LTRIM$(STR$(sss))); ". Level"
LOCATE 13, 15: PRINT RTRIM$(LTRIM$(STR$(punk))); " Punkte erzielt."
LOCATE 15, 11: PRINT "Du hast "; RTRIM$(LTRIM$(STR$(klotzen))); " Steine verlegt und"
LOCATE 16, 15: PRINT ll1; "x 1 Reihe"
LOCATE 17, 15: PRINT ll2; "x 2 Reihen"
LOCATE 18, 15: PRINT ll3; "x 3 Reihen"
LOCATE 19, 15: PRINT ll4; "x 4 Reihen geschafft"
LOCATE 21, 14: PRINT "und von "; tim$; " Uhr bis "
LOCATE 22, 15: PRINT TIME$; " Uhr gespielt."
LOCATE 24, 11
SELECT CASE punk
CASE 0 TO 199: PRINT "AnfÑnger!"
CASE 200 TO 399: PRINT "HÑlt sich ja noch in Grenzen."
CASE 400 TO 599: PRINT "Naja, fÅr eine kurze Entspannung reicht's."
CASE 600 TO 799: PRINT "Das macht man so nebenbei, mit links."
CASE 800 TO 999: PRINT "Gut gemacht."
CASE 1000 TO 1199: PRINT "Entspannen..."
CASE 1200 TO 1399: PRINT "Mach weiter so."
CASE 1400 TO 1599: PRINT "Wow."
CASE 1600 TO 1799: PRINT "Tolle Leistung."
CASE 1800 TO 1999: PRINT "Super."
CASE 2000 TO 2199: PRINT "Na, wars schwer?"
CASE 2200 TO 2399: PRINT "Aber holla, so viele Punkte..."
CASE 2400 TO 2599: PRINT "Excellent"
CASE 2600 TO 2799: PRINT "Hossa, auf, dass die Finger sich bewegen."
CASE 2800 TO 2999: PRINT "*Fanfare* *Tadaa*"
CASE 3000 TO 3199: PRINT "Melde dich bei einer Heilanstalt an!"
CASE 3200 TO 3399: PRINT "Eine geradezu perfekte Leistung!"
CASE 3400 TO 3599: PRINT "Nun kriegst du garantiert Rheuma!"
CASE 3600 TO 3799: PRINT "Perfekt!"
CASE 3800 TO 3999: PRINT "Melde dich beim Guiness Buch der Rekorde."
CASE IS > 3999: PRINT "≈ Stirb in frieden! ≈"
END SELECT
DO: LOOP WHILE INKEY$ = ""
SELECT CASE punk
CASE IS < 2000: SHELL "c:\progra~1\window~1\mplayer2.exe /Fullscreen /Play data1.raf"
CASE 2000 TO 4000: SHELL "c:\progra~1\window~1\mplayer2.exe /Fullscreen /Play data2.raf"
CASE IS > 4000: SHELL "c:\progra~1\window~1\mplayer2.exe /Fullscreen /Play data3.raf"
END SELECT
END

