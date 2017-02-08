
'Farb-Editor Bedienung mit Pfeiltasten und den Tasten + - 7 8 9 4 5 6

SCREEN 13
po = 128
GOSUB linien
GOSUB maske
GOSUB pfeil
GOSUB zeig.farbe
GOSUB zeig.farbwerte

DO
 GOSUB eingabe.abwarten
 GOSUB tu.das
 GOSUB zeig.farbe
 GOSUB zeig.farbwerte
LOOP UNTIL q$ = "q"
END

 
linien:
 FOR x = 1 TO 255
  LINE (x + 30, 100)-(x + 30, 200), x
 NEXT x
RETURN

maske:
 LOCATE 1, 8: PRINT "F A R B E N E D I T O R"
 LOCATE 4, 11: PRINT "Farbe Nummer"
 LOCATE 6, 15: PRINT "Rot  :"
 LOCATE 8, 15: PRINT "GrÅn :"
 LOCATE 10, 15: PRINT "Blau :"
 LOCATE 15, 38: PRINT "RGB"
 LINE (295, 120)-(319, 190), 15, B
 LINE (303, 120)-(311, 190), 15, B
RETURN
 
pfeil:
 IF po < 0 THEN po = 0
 IF po > 255 THEN po = 255
 LINE (po + 17, 93)-(po + 43, 99), 0, BF
 LINE (po + 30, 93)-(po + 30, 99), 15
 LINE (po + 28, 97)-(po + 30, 99), 15
 LINE (po + 32, 97)-(po + 30, 99), 15
RETURN
 
zeig.farbe:
 LINE (5, 120)-(25, 180), po, BF
 LOCATE 4, 25: PRINT USING "###"; po
RETURN
 
eingabe.abwarten:
 DO: q$ = INKEY$: LOOP WHILE q$ = ""
RETURN

tu.das:
 SELECT CASE q$
  CASE CHR$(0) + "K": po = po - 1: GOSUB pfeil    ' 1 nach links
  CASE CHR$(0) + "M": po = po + 1: GOSUB pfeil     ' 1 nach rechts
  CASE "-": po = po - 10: GOSUB pfeil              '10 nach links
  CASE "+": po = po + 10: GOSUB pfeil              '10 nach rechts
 
  CASE "7": r = r + 1: GOSUB farbe.veraendern
  CASE "4": r = r - 1: GOSUB farbe.veraendern
  CASE "8": g = g + 1: GOSUB farbe.veraendern
  CASE "5": g = g - 1: GOSUB farbe.veraendern
  CASE "9": b = b + 1: GOSUB farbe.veraendern
  CASE "6": b = b - 1: GOSUB farbe.veraendern
 END SELECT
RETURN

zeig.farbwerte:
 OUT &H3C7, po                                     'Farbe angeben
 r = INP(&H3C9)                                    'Rot  holen
 g = INP(&H3C9)                                    'GrÅn holen
 b = INP(&H3C9)                                    'Blau holen
 LOCATE 6, 22: PRINT USING "##"; r
 LOCATE 8, 22: PRINT USING "##"; g
 LOCATE 10, 22: PRINT USING "##"; b
 LINE (296, 121)-(302, 189), 0, BF
 LINE (304, 121)-(310, 189), 0, BF
 LINE (312, 121)-(318, 189), 0, BF
 LINE (296, 184 - r)-(302, 189 - r), 15, B
 LINE (304, 184 - g)-(310, 189 - g), 15, B
 LINE (312, 184 - b)-(318, 189 - b), 15, B
RETURN

farbe.veraendern:
 IF r < 0 THEN r = 0
 IF r > 63 THEN r = 63
 IF g < 0 THEN g = 0
 IF g > 63 THEN g = 63
 IF b < 0 THEN b = 0
 IF b > 63 THEN b = 63
 OUT &H3C8, po
 OUT &H3C9, r
 OUT &H3C9, g
 OUT &H3C9, b
RETURN

