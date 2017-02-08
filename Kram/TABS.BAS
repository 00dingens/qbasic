a$ = "C  CisD  DisE  F  FisG  GisA  AisH  "
     '0  1  2  3  4  5  6  7  8  9  10 11
a$ = a$ + a$ + a$
DIM s(6), t(40)
s(1) = 4: s(2) = 11: s(3) = 7: s(4) = 2: s(5) = 9: s(6) = 4
CLS
PRINT "Bitte Taste dr│cken!"
start:
DO: LOOP WHILE INKEY$ = ""
FOR x = 0 TO 40: t(x) = 7: NEXT x
akk$ = ""
CLS
PRINT
PRINT "             o       o       oo      o           oo          o       o      "
PRINT "   здддбдддбдддбдддбдддбдддбдддбдддбдддбдддбдддбдддбдддбдддбдддбдддбдддбдддб--З"
PRINT "   цдддедддедддедддедддедддедддедддедддедддедддедддедддедддедддедддедддеддде--З"
PRINT "   цдддедддедддедддедддедддедддедддедддедддедддедддедддедддедддедддедддеддде--З"
PRINT "   цдддедддедддедддедддедддедддедддедддедддедддедддедддедддедддедддедддеддде--З"
PRINT "   цдддедддедддедддедддедддедддедддедддедддедддедддедддедддедддедддедддеддде--З"
PRINT "   юдддадддадддадддадддадддадддадддадддадддадддадддадддадддадддадддадддаддда--З"


COLOR 9
INPUT "Grundton (C, Cis, D, Dis, E, F, Fis, G, Gis, A, Ais, H):", q$
tt = 0
FOR x = 0 TO 11
 IF q$ = RTRIM$(MID$(a$, 3 * x + 1, 3)) THEN ton = x: tt = 1
NEXT x
IF tt = 0 THEN PRINT "Falsche Angabe, bitte nur aus den Vorgaben w└hlen!": GOTO start
akk$ = q$
COLOR 9: PRINT RTRIM$(MID$(a$, 3 * ton + 1, 3))
t(ton) = 9
COLOR 11: PRINT RTRIM$(MID$(a$, 3 * ((ton + 7) MOD 12) + 1, 3))
t((ton + 7) MOD 12) = 11
COLOR 10
INPUT "dur/moll (wenn nichts, dann fehlt der ton):", q$
dm = 0
IF q$ = "dur" THEN dm = 4
IF q$ = "moll" THEN dm = 3
IF dm = 0 AND q$ <> "" THEN PRINT "Kenn ich nicht": GOTO start
akk$ = akk$ + q$
PRINT RTRIM$(MID$(a$, 3 * ((ton + dm) MOD 12) + 1, 3))
t((ton + dm) MOD 12) = 10
COLOR 12
INPUT "Wieviele Variationen"; anz
FOR x = 1 TO anz
 IF anz < 4 THEN cc = 11 + x ELSE cc = 2 + x
 COLOR cc
 INPUT "Variation (4, sus, (5)+, 6, 7, maj7, 9, 11):", q$
 SELECT CASE q$
 CASE "+": t((ton + 8) MOD 12) = cc
 CASE "sus": t((ton + 5) MOD 12) = cc
'CASE "0": t((ton + 0) MOD 12) = cc
'CASE "2": t((ton + 0) MOD 12) = cc
 CASE "4": t((ton + 2) MOD 12) = cc: PRINT RTRIM$(MID$(a$, 3 * ((ton + 2) MOD 12) + 1, 3))
'CASE "5+": t((ton + 8) MOD 12) = cc
 CASE "6": t((ton + 9) MOD 12) = cc: PRINT RTRIM$(MID$(a$, 3 * ((ton + 9) MOD 12) + 1, 3))
 CASE "7": t((ton + 10) MOD 12) = cc: PRINT RTRIM$(MID$(a$, 3 * ((ton + 10) MOD 12) + 1, 3))
 CASE "maj7": t((ton + 11) MOD 12) = cc: PRINT RTRIM$(MID$(a$, 3 * ((ton + 11) MOD 12) + 1, 3))
'CASE "8": t((ton + 0) MOD 12) = cc
 CASE "9": t((ton + 2) MOD 12) = cc: t((ton + 10) MOD 12) = cc
  PRINT RTRIM$(MID$(a$, 3 * ((ton + 2) MOD 12) + 1, 3)); "(4)": PRINT RTRIM$(MID$(a$, 3 * ((ton + 10) MOD 12) + 1, 3)); "(7)"
'CASE "10": t((ton + 0) MOD 12) = cc
 CASE "11": t((ton + 2) MOD 12) = cc: t((ton + 5) MOD 12) = cc: t((ton + 10) MOD 12) = cc
  PRINT RTRIM$(MID$(a$, 3 * ((ton + 2) MOD 12) + 1, 3)); "(4)": PRINT RTRIM$(MID$(a$, 3 * ((ton + 5) MOD 12) + 1, 3)); "(sus)": PRINT RTRIM$(MID$(a$, 3 * ((ton + 10) MOD 12) + 1, 3)); "(7)"
 CASE ELSE: PRINT "Kenn ich nicht": GOTO start
 END SELECT
 akk$ = akk$ + q$
NEXT x
FOR x = 12 TO 40
 t(x) = t(x - 12)
NEXT x

FOR x = 1 TO 6
 FOR y = 0 TO 18
  COLOR t(y + s(x))
  LOCATE x + 2, y * 4 + 1: PRINT RTRIM$(MID$(a$, 3 * (s(x) + y) + 1, 3))
 NEXT y
NEXT x
LOCATE 1, 1: PRINT akk$

