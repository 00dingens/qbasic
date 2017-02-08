
'Mit Mogelmoeglichkeit: als Startzahl 22 eingeben

CLS
RANDOMIZE TIMER
PRINT "   Du gibst gleich eine Startzahl ein, und danach"
PRINT "   duerfen wir beide abwechselnd 1, 2 oder 3 von ihr abziehen."
PRINT "   Wer den letzten abziehen muss, hat verloren!"
PRINT : PRINT : PRINT : PRINT : PRINT
INPUT "Startzahl"; a
 IF a = 22 THEN mogel = 1                           'gehoert zum C H E A T
DIM q(a)
FOR x = 1 TO a
 q(x) = (x - 1) MOD 4
 IF q(x) = 0 THEN q(x) = INT(RND * 3 + 1)
NEXT x
DO
 DO
  IF mogel = 1 THEN                                 'gehoert zum C H E A T
   PRINT "Tip fuer Mogler: nimm "; q(a); "weg"      'gehoert zum C H E A T
  END IF                                            'gehoert zum C H E A T
  INPUT "Wieviel nimmst du weg"; q
 LOOP UNTIL q > 0 AND q < 4
 a = a - q
 CLS
 PRINT "Es bleiben"; a
 IF a = 1 THEN PRINT "Uuups! Ich habe verloren!": END
 IF a < 1 THEN PRINT "Du hast gerade freiwillig verloren!!": END
 PRINT "Ich nehme "; q(a); "weg"
 a = a - q(a)
 PRINT "Es bleiben"; a
 IF a = 1 THEN PRINT "Tja! Damit hast du verloren!": END
LOOP

