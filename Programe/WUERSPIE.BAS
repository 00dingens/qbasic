'lîsungen fÅr das wÅrfelspiel: man wÅrfelt mit 5 wÅrfeln, und setzt so
'rechenzeichen zwischen die wÅrfel, dass 100 rauskommt.

DIM a(252, 5) AS INTEGER  'hier kommen die zahlen rein
DIM q(252) AS STRING      'hier kommt die lîsung rein
DIM r(5) AS STRING * 1    'rechenzeichen
r(0) = " ": r(1) = "+": r(2) = "-": r(3) = "*": r(4) = "/": r(5) = "^":
DIM w(5) AS INTEGER       'zum permutationen zwischenspeichern

'mîgliche kombinationen erechnen (permutationen wegnehmen)
FOR x1 = 1 TO 6
 FOR x2 = x1 TO 6
  FOR x3 = x2 TO 6
   FOR x4 = x3 TO 6
    FOR x5 = x4 TO 6
     PRINT x1; x2; x3; x4; x5
     z = z + 1: a(z, 1) = x1: a(z, 2) = x2: a(z, 3) = x3: a(z, 4) = x4: a(z, 5) = x5
    NEXT x5
   NEXT x4
  NEXT x3
 NEXT x2
NEXT x1
PRINT "252 Mîgliche WÅrfelkombinationen, unter nichtbeachtung der Reihenfolge"
'errechnen der lîsung

FOR x = 1 TO 252
'permutationen bilden
 FOR x1 = 1 TO 5
  FOR x2 = 1 TO 5
   IF x2 <> x1 THEN
    FOR x3 = 1 TO 5
     IF x3 <> x2 AND x3 <> x1 THEN
      FOR x4 = 1 TO 5
       IF x4 <> x3 AND x4 <> x2 AND x4 <> x1 THEN
       FOR x5 = 1 TO 5
        IF x5 <> x4 AND x5 <> x3 AND x5 <> x2 AND x5 <> x1 THEN
         z = z + 1'DO: LOOP WHILE INKEY$ = ""
         w(1) = a(x, x1): w(2) = a(x, x2): w(3) = a(x, x3): w(4) = a(x, x4): w(5) = a(x, x5)
         PRINT w(1); w(2); w(3); w(4); w(5)
'das ist jetzt die wÅrfelreihenfolge, aus der die rechnung gebildet wird
      

      

'ende rechnung bilden 
        END IF
       NEXT x5
       END IF
      NEXT x4
     END IF
    NEXT x3
   END IF
  NEXT x2
 NEXT x1
NEXT x

