
'Knastspiel
'244 Zeilen

ww = 5000    'Wartezeit wenn dir das ganze Geflimmer zu schnell ist,
             'erhîhe ww. Geht dir das Spiel zu langsam, erniedrige ww.
             'fÅr einen 486er mit 50MHz ist ww = 1000 in Ordnung.
             'fÅr einen PIII mit 500MHz ist ww = 5000 in Ordnung.
bip = 1      'wenn bip = 1 dann piept es, wenn du dran bist, sonst nicht.

SCREEN 12
RANDOMIZE TIMER
GOSUB intro
CLS
PRINT "Regeln:"
PRINT " Versuche die Spielsteine deines Gegners (dein Gegner bin ich) einzusperren!"
PRINT " Um den Spielstein auszuwÑhlen, der auf das schwarze Feld geschoben"
PRINT " werden soll, drÅcke auf dem NumPad:"
PRINT " 1 fÅr links unten"
PRINT " 3 fÅr rechts unten"
PRINT " 5 fÅr die Mitte"
PRINT " 7 fÅr links oben"
PRINT " 9 fÅr rechts oben"
PRINT : PRINT "Schwierigkeitsstufen:"
PRINT " 1: Ich ziehe per Zufall"
PRINT " 2: Ich verliere meist und lasse mich per Zufall scheuchen"
PRINT " 3: Ich verliere manchmal und lasse mich meist scheuchen"
PRINT " 4: Ich verliere mitunter und lasse mich manchmal scheuchen"
PRINT " 5: Ich verliere selten und lasse mich mitunter scheuchen"
PRINT " 6: Ich verliere Ñusserst selten und lasse mich selten scheuchen"
PRINT " 7: Ich verliere fast nie und lasse mich Ñusserst selten scheuchen"
PRINT " 8: Ich verliere nie und lasse mich fast nie scheuchen"
PRINT " 9: Ich verliere nie und lasse mich nie scheuchen"
PRINT : PRINT "Schwierigkeit(1-9)?"
DO: s = VAL(INKEY$): LOOP WHILE s < 1 OR s > 9
PRINT : PRINT "Du hast GrÅn. Darf ich anfangen(j/n)?"
DO: a$ = INKEY$: LOOP UNTIL a$ = "j" OR a$ = "n"
a1 = 1: a2 = 0: a3 = 1: a4 = 2: a5 = 2
GOSUB mal1
GOSUB mal
IF a$ = "j" THEN GOSUB computer
DO
 GOSUB mensch
 FOR x = 1 TO ww * 5: NEXT x
 GOSUB computer
LOOP
DO: LOOP WHILE INKEY$ = "": END


mensch:
IF a1 = 0 THEN leer = 1
IF a2 = 0 THEN leer = 2
IF a3 = 0 THEN leer = 3
IF a4 = 0 THEN leer = 4
IF a5 = 0 THEN leer = 5
eingm:
IF bip = 1 THEN BEEP
DO
t$ = INKEY$
LOOP WHILE t$ = ""
SELECT CASE t$
CASE "7"
 IF a1 <> 2 THEN GOTO eingm
 SELECT CASE leer
 CASE 2: SWAP a1, a2
 CASE 4: SWAP a1, a4
 CASE ELSE: GOTO eingm
 END SELECT
CASE "5"
 IF a2 <> 2 THEN GOTO eingm
 SELECT CASE leer
 CASE 1: SWAP a2, a1
 CASE 3: SWAP a2, a3
 CASE 4: SWAP a2, a4
 CASE 5: SWAP a2, a5
 CASE ELSE: GOTO eingm
 END SELECT
CASE "9"
 IF a3 <> 2 THEN GOTO eingm
 SELECT CASE leer
 CASE 2: SWAP a3, a2
 CASE 5: SWAP a3, a5
 CASE ELSE: GOTO eingm
 END SELECT
CASE "1"
 IF a4 <> 2 THEN GOTO eingm
 SELECT CASE leer
 CASE 1: SWAP a4, a1
 CASE 2: SWAP a4, a2
 CASE 5: SWAP a4, a5
 CASE ELSE: GOTO eingm
 END SELECT
CASE "3"
 IF a5 <> 2 THEN GOTO eingm
 SELECT CASE leer
 CASE 2: SWAP a5, a2
 CASE 3: SWAP a5, a3
 CASE 4: SWAP a5, a4
 CASE ELSE: GOTO eingm
 END SELECT
CASE CHR$(27): auf = 1
CASE ELSE: GOTO eingm
END SELECT
IF a1 = 1 AND a2 = 2 AND a4 = 1 AND a5 = 2 THEN gew = 1
IF a2 = 2 AND a3 = 1 AND a4 = 2 AND a5 = 1 THEN gew = 1
GOSUB mal
IF gew = 1 THEN LOCATE 8, 29: PRINT "Argh! Du hast gewonnen!": PLAY "l64t128>>bagfedc<bagfedc<bagfedc<bagfedc<bagfedc<bagfedcdcdcdcdcdcdc": COLOR 0: DO: LOOP WHILE INKEY$ = "": END
IF auf = 1 THEN LOCATE 10, 32: PRINT "Du hîrst auf? Bye!": PLAY "l64<fa->c<eg-b-dface-g<b>dg-g-g-g-ab>cdefgab": COLOR 0: DO: LOOP WHILE INKEY$ = "": END
RETURN

computer:
IF a1 = 0 THEN leer = 1
IF a2 = 0 THEN leer = 2
IF a3 = 0 THEN leer = 3
IF a4 = 0 THEN leer = 4
IF a5 = 0 THEN leer = 5
eingc:
t = INT(RND * 5 + 1)
SELECT CASE t
CASE 1
 IF a1 <> 1 THEN GOTO eingc
 SELECT CASE leer
 CASE 2: SWAP a1, a2: GOSUB mall: SWAP a1, a2: GOSUB mall: SWAP a1, a2: GOSUB mall
 CASE 4: SWAP a1, a4: GOSUB mall: SWAP a1, a4: GOSUB mall: SWAP a1, a4: GOSUB mall
 CASE ELSE: GOTO eingc
 END SELECT
CASE 2
 IF a2 <> 1 THEN GOTO eingc
 SELECT CASE leer
 CASE 1: SWAP a2, a1: GOSUB mall: SWAP a2, a1: GOSUB mall: SWAP a2, a1: GOSUB mall
 CASE 3: SWAP a2, a3: GOSUB mall: SWAP a2, a3: GOSUB mall: SWAP a2, a3: GOSUB mall
 CASE 4
  IF a1 = 1 THEN
   IF s = 9 THEN GOTO eingc
   IF s = 8 THEN GOTO eingc
   IF s = 7 AND RND < .99 THEN GOTO eingc
   IF s = 6 AND RND < .95 THEN GOTO eingc
   IF s = 5 AND RND < .9 THEN GOTO eingc
   IF s = 4 AND RND < .8 THEN GOTO eingc
   IF s = 3 AND RND < .5 THEN GOTO eingc
   IF s = 2 AND RND < .3 THEN GOTO eingc
  END IF
  SWAP a2, a4: GOSUB mall: SWAP a2, a4: GOSUB mall: SWAP a2, a4: GOSUB mall
 CASE 5
  IF a3 = 1 THEN
   IF s = 9 THEN GOTO eingc
   IF s = 8 THEN GOTO eingc
   IF s = 7 AND RND < .99 THEN GOTO eingc
   IF s = 6 AND RND < .95 THEN GOTO eingc
   IF s = 5 AND RND < .9 THEN GOTO eingc
   IF s = 4 AND RND < .8 THEN GOTO eingc
   IF s = 3 AND RND < .5 THEN GOTO eingc
   IF s = 2 AND RND < .3 THEN GOTO eingc
  END IF
  SWAP a2, a5: GOSUB mall: SWAP a2, a5: GOSUB mall: SWAP a2, a5: GOSUB mall
 CASE ELSE: GOTO eingc
 END SELECT
CASE 3
 IF a3 <> 1 THEN GOTO eingc
 SELECT CASE leer
 CASE 2: SWAP a3, a2: GOSUB mall: SWAP a3, a2: GOSUB mall: SWAP a3, a2: GOSUB mall
 CASE 5: SWAP a3, a5: GOSUB mall: SWAP a3, a5: GOSUB mall: SWAP a3, a5: GOSUB mall
 CASE ELSE: GOTO eingc
 END SELECT
CASE 4
 IF a4 <> 1 THEN GOTO eingc
 SELECT CASE leer
 CASE 1: SWAP a4, a1: GOSUB mall: SWAP a4, a1: GOSUB mall: SWAP a4, a1: GOSUB mall
 CASE 2: SWAP a4, a2: GOSUB mall: SWAP a4, a2: GOSUB mall: SWAP a4, a2: GOSUB mall
 CASE 5
  IF a3 = 1 THEN
   IF s = 9 THEN GOTO eingc
   IF s = 8 THEN GOTO eingc
   IF s = 7 AND RND < .99 THEN GOTO eingc
   IF s = 6 AND RND < .95 THEN GOTO eingc
   IF s = 5 AND RND < .9 THEN GOTO eingc
   IF s = 4 AND RND < .8 THEN GOTO eingc
   IF s = 3 AND RND < .5 THEN GOTO eingc
   IF s = 2 AND RND < .3 THEN GOTO eingc
  ELSE
   IF s = 9 THEN GOTO eingc
   IF s = 8 AND RND < .99 THEN GOTO eingc
   IF s = 7 AND RND < .95 THEN GOTO eingc
   IF s = 6 AND RND < .9 THEN GOTO eingc
   IF s = 5 AND RND < .8 THEN GOTO eingc
   IF s = 4 AND RND < .5 THEN GOTO eingc
   IF s = 3 AND RND < .3 THEN GOTO eingc
  END IF
 SWAP a4, a5: GOSUB mall: SWAP a4, a5: GOSUB mall: SWAP a4, a5: GOSUB mall
 CASE ELSE: GOTO eingc
 END SELECT
CASE 5
 IF a5 <> 1 THEN GOTO eingc
 SELECT CASE leer
 CASE 2: SWAP a5, a2: GOSUB mall: SWAP a5, a2: GOSUB mall: SWAP a5, a2: GOSUB mall
 CASE 3: SWAP a5, a3: GOSUB mall: SWAP a5, a3: GOSUB mall: SWAP a5, a3: GOSUB mall
 CASE 4
  IF a1 = 1 THEN
   IF s = 9 THEN GOTO eingc
   IF s = 8 THEN GOTO eingc
   IF s = 7 AND RND < .99 THEN GOTO eingc
   IF s = 6 AND RND < .95 THEN GOTO eingc
   IF s = 5 AND RND < .9 THEN GOTO eingc
   IF s = 4 AND RND < .8 THEN GOTO eingc
   IF s = 3 AND RND < .5 THEN GOTO eingc
   IF s = 2 AND RND < .3 THEN GOTO eingc
  ELSE
   IF s = 9 THEN GOTO eingc
   IF s = 8 AND RND < .99 THEN GOTO eingc
   IF s = 7 AND RND < .95 THEN GOTO eingc
   IF s = 6 AND RND < .9 THEN GOTO eingc
   IF s = 5 AND RND < .8 THEN GOTO eingc
   IF s = 4 AND RND < .5 THEN GOTO eingc
   IF s = 3 AND RND < .3 THEN GOTO eingc
  END IF
 SWAP a5, a4: GOSUB mall: SWAP a5, a4: GOSUB mall: SWAP a5, a4: GOSUB mall
 CASE ELSE: GOTO eingc
 END SELECT
CASE ELSE: PRINT "Fuck you!": DO: LOOP WHILE INKEY$ = "": END
END SELECT
IF a1 = 2 AND a2 = 1 AND a4 = 2 AND a5 = 1 THEN gew = 1
IF a2 = 1 AND a3 = 2 AND a4 = 1 AND a5 = 2 THEN gew = 1
GOSUB mal
IF gew = 1 THEN LOCATE 8, 28: PRINT "Hahaa! Ich habe gewonnen!": PLAY "l64t128<<ceg>ceg>c<gec<gec>ceg>ceg>c<gec<gec>ceg>ceg>c<gec<gecceg>ceg>cccc": COLOR 0: DO: LOOP WHILE INKEY$ = "": END
RETURN

mal:
PAINT (320, 240), a2, 15
PAINT (170, 90), a1, 15
PAINT (170, 390), a4, 15
PAINT (470, 90), a3, 15
PAINT (470, 390), a5, 15
RETURN

mall:
GOSUB mal
FOR x = 1 TO ww: NEXT x
RETURN

mal1:
CLS
LOCATE 2, 30: PRINT "K N A S T S P I E L"
LOCATE 3, 29: PRINT "ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ"
LINE (170, 90)-(470, 390), 15
LINE (170, 90)-(170, 390), 15
LINE (170, 390)-(470, 390), 15
LINE (170, 390)-(470, 90), 15
LINE (470, 90)-(470, 390), 15
CIRCLE (320, 240), 50, 8
CIRCLE (170, 90), 50, 8
CIRCLE (170, 390), 50, 8
CIRCLE (470, 90), 50, 8
CIRCLE (470, 390), 50, 8
PAINT (320, 240), 0, 8
PAINT (170, 90), 0, 8
PAINT (170, 390), 0, 8
PAINT (470, 90), 0, 8
PAINT (470, 390), 0, 8
CIRCLE (320, 240), 50, 15
CIRCLE (170, 90), 50, 15
CIRCLE (170, 390), 50, 15
CIRCLE (470, 90), 50, 15
CIRCLE (470, 390), 50, 15
RETURN

intro:
CLS
COLOR 15
PRINT : PRINT : PRINT
PRINT " €‹   ‹€  €  ‹ﬂ €   €  ‹ﬂ‹  ‹ﬂﬂﬂ‹ ﬂﬂ€ﬂﬂ     ‹ﬂﬂﬂ‹ €ﬂﬂﬂ‹ € €ﬂﬂﬂﬂ €      €‹   ‹€"
PRINT " € ﬂ‹ﬂ €  €‹ﬂ   €ﬂ‹ € €‹‹‹€ ﬂ‹‹‹    €   ‹‹‹ ﬂ‹‹‹  €‹‹‹ﬂ € €‹‹‹  €      € ﬂ‹ﬂ €"
PRINT " €‹ﬂ ﬂ‹€  € ﬂ‹  €  ﬂ€ €   € ‹   €   €       ‹   € €     € €     €      €‹ﬂ ﬂ‹€"
PRINT " ﬂﬂﬂﬂﬂﬂﬂ  ﬂ   ﬂ ﬂ   ﬂ ﬂ   ﬂ  ﬂﬂﬂ    ﬂ        ﬂﬂﬂ  ﬂ     ﬂ ﬂﬂﬂﬂﬂ ﬂﬂﬂﬂﬂ  ﬂﬂﬂﬂﬂﬂﬂ"
PRINT " ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ"
PRINT "                               von Rafael Friesen"
PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT
COLOR 7
PRINT "                               DrÅcke eine Taste!"
COLOR 15
DO: LOOP WHILE INKEY$ = ""
RETURN

