DIM q(10000)                'fÅr get und put
SCREEN 12                   '640x480 16c

'hier kann etwas auf dem bildschirm abgebildet werden.

PRINT "                          DrÅcke eine Taste um abzubrechen!"
FOR x = 1 TO 5: PRINT : PRINT "      €   €  ‹ﬂ‹  €     €     ‹ﬂﬂﬂ‹ €      €   €  ‹ﬂ‹  €     €     ‹ﬂﬂﬂ‹ €": PRINT "      €‹‹‹€ €‹‹‹€ €     €     €   € €      €‹‹‹€ €‹‹‹€ €     €     €   € €": PRINT "      €   € €   € €     €     €   € ﬂ      €   € €   € €     €     €   € ﬂ": PRINT "      ﬂ   ﬂ ﬂ   ﬂ ﬂﬂﬂﬂﬂ ﬂﬂﬂﬂﬂ  ﬂﬂﬂ  ﬂ      ﬂ   ﬂ ﬂ   ﬂ ﬂﬂﬂﬂﬂ ﬂﬂﬂﬂﬂ  ﬂﬂﬂ  ﬂ": NEXT x
FOR y = 1 TO 26
 FOR x = 1 TO 80
  LOCATE y, x
  COLOR (INT(RND * 15 + 1))
  PRINT CHR$(SCREEN(y, x))
 NEXT x
NEXT y

'ende der abbildung.

'nun das eigendliche programm:


xb = 630: yb = 470          'zu verlaufender abschnitt
a = 10: b = 10              'grîsse des Kastens, der verschoben wird
DO                          'verschiebung wird so oft wiederholt bis taste
 n = INT(RND * (xb - 2 - a) + 1)'x-position des kastens
 m = INT(RND * (yb - 2 - b))'y-position des kastens
 GET (n, m)-STEP(a, b), q   'kasten nehmen, und
 PUT (n + INT(RND * 3 - 1), m + 1), q, PSET'einen pixel tiefer setzen (versuch mal 2,3 oder mehr) und 0 oder 1 seitwÑrts
 'LOCATE 1, 1: PRINT x        ' ^ einen pixel verschieben
LOOP WHILE INKEY$ = ""

