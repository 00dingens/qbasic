DIM h(40), p(40), x(100), y(100), s(100)
start:
RANDOMIZE TIMER
SCREEN 9, , 0, 0
PRINT "Das Boden-Luft-Raketen-Spiel von Rafael Friesen"
DO
 LOCATE 5, 5
 INPUT "Wie schnell fliegen die Geschosse (0.2 - 5)"; rak
 IF rak = 0 THEN rak = 1
LOOP UNTIL rak < 5 AND rak > .2
DO
 LOCATE 7, 5
 INPUT "Wie schnell sind die Flugzeuge (0.1 - 5; ñ50%)"; flg
 IF flg = 0 THEN flg = 2
LOOP UNTIL flg <= 5 AND flg >= .1
DO
 LOCATE 9, 5
 INPUT "Wie viele Flugzeuge tauchen auf (1 - 100)"; anz
 IF anz = 0 THEN anz = 10
LOOP UNTIL anz < 101 AND anz > 0
DO
 LOCATE 11, 5
 INPUT "Wie tief fliegen die Flugzeuge (10 - 300)"; tie
 IF tie = 0 THEN tie = 200
LOOP UNTIL tie < 301 AND tie > 9
DO
 LOCATE 13, 5
 INPUT "Wie hoch fliegen die Flugzeuge (0 - 290)"; hoc
 IF hoc = 0 THEN hoc = 100
LOOP UNTIL hoc < 291 AND hoc > -1 AND hoc < tie
tie = tie - hoc
DO: LOOP UNTIL INKEY$ = " "
CLS
los:
FOR z = 1 TO anz
 x(z) = RND * 640
 y(z) = INT(RND * tie) + hoc
 s(z) = (RND + .5) * flg
 IF z MOD 2 = 0 THEN s(z) = -s(z)
NEXT z
FOR z = 1 TO 40
 h(z) = 330
 p(z) = 0
NEXT z
SCREEN 9, , 0, 1
a$ = "1QAY2WSX3EDC4RFV5TGB6ZHN7UJM8IK,9OL.0P™-"
b$ = "1qay2wsx3edc4rfv5tgb6zhn7ujm8ik,9ol.0p”-"
DO
 CLS
 LOCATE 25, 1: PRINT "1 Q A Y 2 W S X 3 E D C 4 R F V 5 T G B 6 Z H N 7 U J M 8 I K , 9 O L . 0 P ™ -"
 FOR z = 1 TO anz
  x(z) = x(z) + s(z)
  IF x(z) < 0 OR x(z) > 640 THEN x(z) = x(z) - s(z): s(z) = -SGN(s(z)) * (RND + .5) * flg: y(z) = INT(RND * tie) + hoc
  LINE (x(z), y(z))-STEP(10, 1), 15, BF
 NEXT z
 FOR z = 1 TO 40
  IF h(z) <> 331 THEN h(z) = h(z) - rak
  IF h(z) < 0 THEN h(z) = 331
  IF POINT((z * 16) - 12, h(z)) = 15 THEN
   FOR zz = 1 TO anz
    IF y(zz) = INT(h(z)) OR y(zz) + 1 = INT(h(z)) THEN
     IF x(zz) + 23 > z * 16 AND x(zz) + 11 < (z * 16) THEN
      p(z) = p(z) + 1
      h(z) = 331
      x(zz) = (-SGN(s(zz)) + 1) / 2 * 630 + 5
      y(zz) = INT(RND * tie) + hoc
     END IF
    END IF
   NEXT zz
  END IF
  PSET ((z * 16) - 12, h(z))
 NEXT z
ein:
 t$ = INKEY$
 IF t$ = "" THEN GOTO nix
 IF t$ = CHR$(27) THEN GOTO ende
 FOR z = 1 TO 40
  IF t$ = MID$(b$, z, 1) THEN h(z) = 330
 NEXT z
 GOTO ein
nix:
 PCOPY 0, 1
LOOP
ende:
CLS
FOR z = 1 TO 40
 PRINT MID$(a$, z, 1) + ":" + STR$(p(z)) + "               ";
NEXT z
PRINT : PRINT "Weiterspielen: so(s) anders(a) nicht mehr(n)"
PCOPY 0, 1
DO: t$ = INKEY$: LOOP WHILE t$ = ""
IF t$ = "n" THEN END
IF t$ = "a" THEN GOTO start
GOTO los

