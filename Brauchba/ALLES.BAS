DECLARE SUB Mit (a$, z!)
Menu:
 CLEAR : CLS : SCREEN 12
 Mit "€‹ ‹€             ﬂ   ﬂ", 4
 Mit "€ ﬂ € ‹ﬂﬂﬂ‹ €ﬂﬂﬂ‹ €   €", 5
 Mit "€   € €ﬂﬂﬂﬂ €   € €   €", 6
 Mit "ﬂ   ﬂ  ﬂﬂﬂ  ﬂ   ﬂ  ﬂﬂﬂﬂ", 7
 Mit "Farbeffekte ----------------- 1", 9
 Mit "Muster ---------------------- 2", 10
 Mit "Animationen ----------------- 3", 11
 Mit "Sound ----------------------- 4", 12
 Mit "Ende ------------------------ 5", 13
 DO: t = VAL(INKEY$): LOOP UNTIL t < 6 AND t > 0
 ON t GOSUB Farbeffekte, Muster, Animationen, Saund, Ende
Ende: END

''' ########################  F A R B E F F E K T E  ########################

Farbeffekte:
 CLEAR : CLS : SCREEN 12
 Mit "€ﬂﬂﬂﬂ             €            ‹ﬂﬂ‹  ‹ﬂﬂ‹       €      €         ", 4
 Mit "€‹‹‹  ﬂﬂﬂﬂ‹ €ﬂﬂﬂ‹ €ﬂﬂﬂ‹ ‹ﬂﬂﬂ‹ ﬂ€ﬂ   ﬂ€ﬂ   ‹ﬂﬂﬂ‹ €  ‹ﬂ ﬂ€ﬂ   ‹ﬂﬂﬂ‹", 5
 Mit "€     ‹ﬂﬂﬂ€ €     €   € €ﬂﬂﬂﬂ  €     €    €ﬂﬂﬂﬂ €ﬂﬂ‹   €  ‹ €ﬂﬂﬂﬂ", 6
 Mit "ﬂ      ﬂﬂﬂﬂ ﬂ     ﬂﬂﬂﬂ   ﬂﬂﬂ   ﬂ     ﬂ     ﬂﬂﬂ  ﬂ   ﬂ   ﬂﬂ   ﬂﬂﬂ ", 7
GOSUB Menu

''' ###########################  M U S T E R  ###############################

Muster:
 CLEAR : CLS : SCREEN 12
 Mit "€‹ ‹€              €               ", 4
 Mit "€ ﬂ € €   € ‹ﬂﬂﬂﬂ ﬂ€ﬂ   ‹ﬂﬂﬂ‹ €ﬂﬂﬂ‹", 5
 Mit "€   € €   €  ﬂﬂﬂ‹  €  ‹ €ﬂﬂﬂﬂ €    ", 6
 Mit "ﬂ   ﬂ  ﬂﬂﬂ  ﬂﬂﬂﬂ    ﬂﬂ   ﬂﬂﬂ  ﬂ    ", 7
GOSUB Menu

''' ######################  A N I M A T I O N E N  ##########################

Animationen:
 CLEAR : CLS : SCREEN 12
 Mit "‹ﬂﬂﬂ‹       ﬂ              €    ﬂ                        ", 4
 Mit "€‹‹‹€ €ﬂﬂﬂ‹ € €ﬂ€ﬂ‹ ﬂﬂﬂﬂ‹ ﬂ€ﬂ   € ‹ﬂﬂﬂ‹ €ﬂﬂﬂ‹ ‹ﬂﬂﬂ‹ €ﬂﬂﬂ‹", 5
 Mit "€   € €   € € € € € ‹ﬂﬂﬂ€  €  ‹ € €   € €   € €ﬂﬂﬂﬂ €   € ", 6
 Mit "ﬂ   ﬂ ﬂ   ﬂ ﬂ ﬂ ﬂ ﬂ  ﬂﬂﬂﬂ   ﬂﬂ  ﬂ  ﬂﬂﬂ  ﬂ   ﬂ  ﬂﬂﬂ  ﬂ   ﬂ ", 7
 Mit "Scrollender Text ------------ 1", 9
 Mit "Muster ---------------------- 2", 10
 Mit "Animationen ----------------- 3", 11
 Mit "Sound ----------------------- 4", 12
 Mit "Ende ------------------------ 5", 13
 DO: t = VAL(INKEY$): LOOP UNTIL t < 6 AND t > 0
 ON t GOSUB AScroll, Muster, Animationen, Saund, Ende
GOSUB Menu

AScroll:
 SCREEN 7
 t$ = "            Achtung! Alle Flieger Åber dem Kampfgebiet!            P.S. Qwix mir was!"
 t$ = t$ + t$
 FOR w = 1 TO 2
  FOR x = 1 TO LEN(t$) / 2
   LOCATE 12, 14: PRINT MID$(t$, x, 12)
   FOR z = 1 TO 1500: NEXT z
  NEXT x
  IF INKEY$ <> "" THEN EXIT FOR
 NEXT w
GOSUB Animationen

''' #############################  S O U N D  ###############################

Saund:
 CLEAR : CLS : SCREEN 12
 Mit "‹ﬂﬂﬂ‹                       €", 4
 Mit "ﬂ‹‹‹  ‹ﬂﬂﬂ‹ €   € €ﬂﬂﬂ‹ ‹ﬂﬂﬂ€", 5
 Mit "‹   € €   € €   € €   € €   €", 6
 Mit " ﬂﬂﬂ   ﬂﬂﬂ   ﬂﬂﬂﬂ ﬂ   ﬂ  ﬂﬂﬂﬂ", 7
 Mit "Geklaut aus PacMan ---------- 1", 9
 Mit "Sirene 1 -------------------- 2", 10
 Mit "Sirene 2 -------------------- 3", 11
 Mit "Rauschen -------------------- 4", 12
 Mit "Echo ------------------------ 5", 13
 Mit "Flotte Melodie -------------- 6", 14
 Mit "MenÅ ------------------------ 7", 15
 DO: t = VAL(INKEY$): LOOP UNTIL t < 8 AND t > 0
 ON t GOSUB SPacMan, SSirene1, SSirene2, SRauschen, SEcho, SFlott, Menu
GOSUB Menu

SPacMan:
 PLAY "MBT255L64ABCEABCEEBCEABCEAGAA"
 FOR x = 1 TO 5000: NEXT x
 PLAY "MBT255L64O2AFGAO2DB"
 FOR x = 1 TO 5000: NEXT x
 PLAY "MBT255L64O4BA#AG#GF#FED#DC#CL64O3BA#AG#GF#FED#DC#CL64O2BA#AG#GF#FED#DC#CB"
 FOR x = 1 TO 5000: NEXT x
 PLAY "MBT255L64O2CC#DD#EFF#GG#AA#BL64O3CC#DD#EFF#GG#AA#BL64O4CC#DD#EFF#GG#AA#B"
 FOR x = 1 TO 5000: NEXT x
GOSUB Saund

SSirene1:
 FOR x = 1 TO 10
  FOR y = 100 TO 7000 STEP 100
   SOUND y, .023
  NEXT y
 NEXT x
GOSUB Saund

SSirene2:
 SCREEN 13
 FOR x = 1 TO 10
  FOR f = 1 TO 16
   CIRCLE (160, 100), f, 15 + f
   CIRCLE (160, 100), f - 1, 0
   SOUND f * 10 + 1000, .2
  NEXT f
  FOR f = 16 TO 1 STEP -1
   CIRCLE (160, 100), f, 15 + f
   CIRCLE (160, 100), f + 1, 0
   SOUND f * 10 + 1000, .2
  NEXT f
 NEXT x
GOSUB Saund

SRauschen:
 FOR x = 1 TO 3000
  SOUND INT(RND * 2000 + 1000), .023
 NEXT x
GOSUB Saund

SEcho:
 PLAY "T255O0L64cdecdefdefgefgafgabgab>c<ab>cd<bO1L64cdecdefdefgefgafgabgab>c<ab>cd<b"
 PLAY "O2L64cdecdefdefgefgafgabgab>c<ab>cd<bO3L64cdecdefdefgefgafgabgab>c<ab>cd<b"
 PLAY "O4L64cdecdefdefgefgafgabgab>c<ab>cd<bO5L64cdecdefdefgefgafgabgab>c<ab>cd<b"
 PLAY "O6L64cdecdefdefgefgafgabgabbbbbbbbbbbbbb<fc<fc<fc<fc<fc<fccccccccccccccccc"
GOSUB Saund

SFlott:
 FOR x = 1 TO 2
  PLAY "t255O2L16d-n0n0d-n0L42d-n0n0d-l32n0n0d-n0n0d-l24d-n0n0d-n0n0"
  PLAY "O2L16dn0n0dn0L42dn0n0dl32n0n0dn0n0dl24dn0n0dn0n0"
  PLAY "O2L16d+n0n0d+n0L42d+n0n0d+l32n0n0d+n0n0d+l24d+n0n0d+n0n0"
  PLAY "O2L16dn0n0dn0L42dn0n0dl32n0n0dn0n0dl24dn0n0dn0n0"
 NEXT x
 PLAY "O2L16d-n0n0d-n0L42d-n0n0d-l32n0n0d-n0n0d-l24d-n0n0d-n0n0"
 PLAY "O2L16dn0n0dn0L42dn0n0dl32n0n0dn0n0dl24dn0n0dn0n0"
 PLAY "O2L16d+n0n0d+n0L42d+n0n0d+l32n0n0d+n0n0d+l24d+n0n0d+n0n0"
 PLAY "t128O2L2d"
 FOR x = 1 TO 10000: NEXT x
GOSUB Saund



' ################################  E N D E  #################################



text:
t$ = "   Achtung! Alle Flieger Åber dem Kampfgebiet!  P.S. Qwix mir was!   Achtung! Alle"
DO
FOR x = 1 TO LEN(t$) - 16
 LOCATE 12, 14: PRINT MID$(t$, x, 12)
 FOR z = 1 TO 300: NEXT z
 IF INKEY$ <> "" THEN EXIT DO
NEXT x
LOOP
END

radar:
LINE (11, 11)-(49, 49), 2, B
LINE (109, 9)-(151, 51), 2, B
eck = 500: rad = 20: win = 2 * 3.141593 / eck
DIM x(eck), y(eck)
FOR i = 0 TO eck - 1
 x(i) = rad * COS(i * win)
 y(i) = rad * SIN(i * win)
NEXT i
DO
FOR i = 0 TO eck - 1
 LINE (30, 30)-STEP(x(i), y(i)), 10
 LINE (30, 30)-STEP(x(i), y(i)), 0
 LINE (130, 30)-STEP(x(i), y(i)), 10
 LINE (130, 30)-STEP(x(i), y(i)), 0
NEXT i
LOOP WHILE INKEY$ = ""
END

diagramm:
DIM a(10000)
x = 100
DO
 x = x + RND * 2 - 1
 PSET (130, x - 1), 0
 PSET (130, x), 2
 PSET (130, x + 1), 0
 GET (130, 50)-(190, 150), a
 PUT (131, 50), a, PSET
LOOP WHILE INKEY$ = ""
END

diagr:
DIM aa(10000)
x = 100
DO
 LINE (130, 80)-(130, 120), 8
 FOR i = 1 TO 10
  x = x + RND * 2 - 1
  FOR y = 1 TO 50 STEP 10
   PSET (130, y + 79), 8
  NEXT y
  PSET (130, x), 10
  GET (130, 50)-(190, 150), aa
  PUT (131, 50), aa, PSET
  LINE (130, 80)-(130, 120), 0
 NEXT i
LOOP WHILE INKEY$ = ""
END

zeichen:
DO
FOR y = 0 TO 3
 FOR x = 0 TO 3
  COLOR INT(RND * 16)
  LOCATE 12 + x, 18 + y: PRINT CHR$(INT(RND * 220) + 36)
 NEXT x
NEXT y
LOOP WHILE INKEY$ = ""
END

kreis:
DO
 FOR f = 1 TO 16
  CIRCLE (160, 100), f, 15 + f
  CIRCLE (160, 100), f - 1, 0
  SOUND f * 10 + 1000, .2
 NEXT f
 FOR f = 16 TO 1 STEP -1
  CIRCLE (160, 100), f, 15 + f
  CIRCLE (160, 100), f + 1, 0
  SOUND f * 10 + 1000, .2
 NEXT f
LOOP WHILE INKEY$ = ""
END

fernsehn:
LINE (145, 90)-(180, 110), 15, BF
PSET (145, 90), 0
PSET (145, 110), 0
PSET (180, 90), 0
PSET (180, 110), 0
DO
FOR x = 1 TO 15
 PAINT (160, 100), x, 0
NEXT x
LOOP WHILE INKEY$ = ""
END

lampen:
CIRCLE (140, 100), 19
CIRCLE (180, 100), 19
CIRCLE (160, 85), 5
CIRCLE (160, 115), 5
DO
IF RND > .2 THEN
PAINT (140, 100), 0, 15
PAINT (180, 100), 4, 15
PAINT (160, 85), 12, 15
PAINT (160, 115), 12, 15
FOR x = 1 TO 300: NEXT x
PAINT (140, 100), 4, 15
PAINT (180, 100), 0, 15
PAINT (160, 85), 4, 15
PAINT (160, 115), 4, 15
FOR x = 1 TO 300: NEXT x
PAINT (140, 100), 12, 15
PAINT (180, 100), 4, 15
PAINT (160, 85), 0, 15
PAINT (160, 115), 0, 15
FOR x = 1 TO 300: NEXT x
PAINT (140, 100), 4, 15
PAINT (180, 100), 12, 15
PAINT (160, 85), 4, 15
PAINT (160, 115), 4, 15
ELSE FOR x = 1 TO 1000: NEXT x
END IF
FOR x = 1 TO 300: NEXT x
LOOP WHILE INKEY$ = ""
END

cursor:
DO
FOR x = 0 TO 10
 LINE (150 + x, 100 - x)-(170 - x, 100 + x), , BF
 FOR y = 1 TO 200: NEXT y
 LINE (150 + x, 100 - x)-(170 - x, 100 + x), 0, BF
NEXT x
FOR x = 10 TO 0 STEP -1
 LINE (150 + x, 100 - x)-(170 - x, 100 + x), , BF
 FOR y = 1 TO 200: NEXT y
 LINE (150 + x, 100 - x)-(170 - x, 100 + x), 0, BF
NEXT x
LOOP WHILE INKEY$ = ""
END

runde:
a = 1: B = 1: x = 160: y = 100
LINE (148, 89)-(171, 111), , B
DO
PSET (x, y), 0
x = x + a: y = y + B
PSET (x, y)
IF x + a < 149 THEN a = 1
IF x + a > 170 THEN a = -1
IF y + B < 90 THEN B = 1
IF y + B > 110 THEN B = -1
FOR z = 1 TO 100: NEXT z
LOOP WHILE INKEY$ = ""
END

welle:
eck = 500: rad = 20: win = 2 * 3.141593 / eck
DIM y(eck * 2), aaa(9000)
FOR i = 0 TO eck - 1
 y(i) = rad * SIN(i * win)
NEXT i
DO
 FOR i = 0 TO eck - 1
  LINE (150, 80)-(150, 120), 0
  FOR k = 1 TO 10
   PSET (150, y(i * k MOD eck) + 100), k
  NEXT k
  GET (150, 80)-(210, 120), aaa
  PUT (151, 80), aaa, PSET
 NEXT i
LOOP WHILE INKEY$ = ""
END

anschalten:
LINE (10, 10)-(50, 50), 1, BF
FOR x = 1 TO 10
OUT &H3C8, 1
OUT &H3C9, 0
OUT &H3C9, 0
OUT &H3C9, 0
FOR t = 1 TO (12 - x) * 20: NEXT t
OUT &H3C8, 1
OUT &H3C9, 63
OUT &H3C9, 63
OUT &H3C9, 63
FOR t = 1 TO (12 - x) * 10: NEXT t
NEXT x
END

erscheinen:
DIM q(1024), w(1024)
FOR y = 0 TO 3
 FOR x = 0 TO 3
  COLOR INT(RND * 16)
  LOCATE 12 + x, 18 + y: PRINT CHR$(INT(RND * 220) + 36)
 NEXT x
NEXT y
FOR x = 0 TO 31
 FOR y = 0 TO 31
  q(y * 32 + x) = POINT(x + 136, y + 88)
 NEXT y
NEXT x
CLS
FOR y = 0 TO 1023
 w(y) = y
NEXT y
FOR y = 0 TO 1023
 SWAP w(y), w(INT(RND * 1024))
NEXT y
FOR y = 0 TO 1023
 PSET (w(y) MOD 32 + 136, INT(w(y) / 32) + 88), q(w(y))
NEXT y
DO: LOOP WHILE INKEY$ = ""
END

lampe:
CIRCLE (160, 100), 20, 2
PAINT (160, 100), 2, 2
CIRCLE (160, 100), 18, 1
PAINT (160, 100), 1, 1
DO
 FOR a = 1 TO 20
  FOR x = 0 TO 63 STEP a
   PALETTE 1, x
   PALETTE 2, 63 - x
   IF INKEY$ <> "" THEN END
  NEXT x
  FOR x = 63 TO 0 STEP -a
   PALETTE 1, x
   PALETTE 2, 63 - x
   IF INKEY$ <> "" THEN END
  NEXT x
 NEXT a
LOOP
END

SUB Mit (a$, z)
 LOCATE z, INT((80 - LEN(a$)) / 2)
 PRINT a$
END SUB

