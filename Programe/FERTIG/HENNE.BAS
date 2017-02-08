CLS
PRINT "Eine Henne vor schreck"
PRINT "legt ein Ei in den Dreck."
PRINT "Damit machte sie nur"
PRINT "eine gute Figur."
PRINT
INPUT "Welche Figur ist es?(Bitte in Kleinbuchstaben)"; W$
IF W$ = "dreieck" THEN PRINT "Richtig geraten!": END
SCREEN 9
DO
CLS
LOCATE 4, 10
COLOR 14
PRINT "Eine kleine Hilfe:"
LINE (320, 60)-(600, 220), 12
LINE -(40, 220), 12
LINE -(320, 60), 12
LOCATE 20, 8
COLOR 15
INPUT "Welche Figur ist es?"; W$
LOOP UNTIL W$ = "dreieck"
COLOR 5
FOR x = 40 TO 8000 STEP 5: SOUND x, .023: NEXT x
PRINT "Richtig geraten!"
FOR x = 8000 TO 40 STEP -5: SOUND x, .023: NEXT x
COLOR 8
END


