CLS
FOR x = 1 TO 100
zaehler = 0
geld = 100
einsatz = .01
tipp = 1
DO
 zaehler = zaehler + 1
 geld = geld - einsatz
 gewinner = INT(RND * 2)
 LOCATE 1, 1: PRINT "Geld "; geld; "Einsatz "; einsatz; "Tipp"; tipp; "Gewinner"; gewinner
 IF tipp = gewinner THEN
  geld = geld + einsatz * 2
  einsatz = .01
  tipp = 1 - tipp
 ELSE
  einsatz = 2 * einsatz
  IF einsatz > geld THEN einsatz = einsatz / 2
 END IF
LOOP WHILE geld > 0
LOCATE 3, 1: PRINT "Spieler "; x; "ist nach "; zaehler; "Runden Pleite"
NEXT x

