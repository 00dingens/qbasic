DIM a(1, 100) AS STRING
menue:
y = 1
ok = 0
CLS
PRINT
PRINT "         ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
PRINT "         บ                                                             บ"
PRINT "         บ                          M E N                             บ"
PRINT "         บ                                                             บ"
PRINT "         ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน"
PRINT "         บ                                                             บ"
PRINT "         บ               > Neue Vokabeln eingeben                      บ"
PRINT "         บ                 Volabeln abfragen                           บ"
PRINT "         บ                 Tipps von mir                               บ"
PRINT "         บ                 Ende                                        บ"
PRINT "         บ                                                             บ"
PRINT "         บ                                                             บ"
PRINT "         ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE CHR$(0) + "H": IF y > 1 THEN y = y - 1
 CASE CHR$(0) + "P": IF y < 4 THEN y = y + 1
 CASE CHR$(13): ok = 1
END SELECT
LOCATE 6 + y, 26: PRINT " "
LOCATE 7 + y, 26: PRINT ">"
LOCATE 8 + y, 26: PRINT " "
LOOP UNTIL ok = 1
SELECT CASE y
CASE 1: GOTO eing
CASE 2: GOTO vok
CASE 3: GOTO tipps
END SELECT
END


eing:
OPEN "latein.dat" FOR APPEND AS #1

DO
CLS
INPUT "Latein :", lat$
INPUT "Deutsch:", deu$
deu$ = LCASE$(deu$): lat$ = LCASE$(lat$)
INPUT "Eintragen(j/n)"; jn$
IF jn$ = "j" AND lat$ <> "" AND deu$ <> "" THEN WRITE #1, lat$, deu$
INPUT "Noch eine(j/n)"; jn$
LOOP UNTIL jn$ = "n"
CLOSE
GOTO menue

vok:
y = 1
ok = 0
CLS
PRINT
PRINT "         ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
PRINT "         บ                                                             บ"
PRINT "         บ                     A B F R A G E N                         บ"
PRINT "         บ                                                             บ"
PRINT "         ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน"
PRINT "         บ                                                             บ"
PRINT "         บ               > Alle Vokabeln der Reihe nach                บ"
PRINT "         บ                 Je 50 Zufllig (alle)                       บ"
PRINT "         บ                 Die letzten 1-100                           บ"
PRINT "         บ                 Kreuz und Quer                              บ"
PRINT "         บ                 Men                                        บ"
PRINT "         บ                                                             บ"
PRINT "         ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE CHR$(0) + "H": IF y > 1 THEN y = y - 1
 CASE CHR$(0) + "P": IF y < 5 THEN y = y + 1
 CASE CHR$(13): ok = 1
END SELECT
LOCATE 6 + y, 26: PRINT " "
LOCATE 7 + y, 26: PRINT ">"
LOCATE 8 + y, 26: PRINT " "
LOOP UNTIL ok = 1
CLS
IF y < 5 THEN PRINT "Lateinisch - Deutsch [L] oder Deutsch - Lateinisch [D]?"; : DO: t$ = INKEY$: LOOP UNTIL t$ = "l" OR t$ = "d"
SELECT CASE y
CASE 1: sys = 1
CASE 2: sys = 2
CASE 3: sys = 3
CASE 4: sys = 4
CASE 5: GOTO menue
END SELECT

CLS
OPEN "latein.dat" FOR INPUT AS #1
PRINT "Zum beenden der Abfrage bitte 'men' eingeben!"
SELECT CASE sys
CASE 1
 PRINT "   Es werden nun alle Vokabel von der Ersten"
 PRINT "   bis zur zuletzt eingegebenen abgefragt."
 DO
  INPUT #1, lat$, deu$
  GOSUB abfr
 LOOP UNTIL EOF(1)
 GOTO fedich
CASE 2
 PRINT "   Es werden 50 Vokabeln am Stck genommen und gemischt abgefragt."
 PRINT "   Jede Vokabel kommt einmal dran."

 DO
  FOR x = 1 TO 50
   IF EOF(1) THEN
    x = x - 1
    EXIT FOR
   ELSE
    INPUT #1, a(0, x), a(1, x)
   END IF
  NEXT x
  anz = x
  FOR x = 1 TO anz
   zz = INT(RND * anz + 1)
   SWAP a(0, x), a(0, zz)
   SWAP a(1, x), a(1, zz)
  NEXT x
  FOR x = 1 TO anz
   lat$ = a(0, x)
   deu$ = a(1, x)
   GOSUB abfr
  NEXT x
 LOOP UNTIL EOF(1)
 GOTO fedich
CASE 3
 DO
  INPUT "Wieviele Vokabeln sollen abgefragt werden(1 - 100)"; men
 LOOP UNTIL men > 0 AND men <= 100
 PRINT "   Es werden die letzten"; men; "Vokabeln gemischt abgefragt."
 PRINT "   Wurden alle abgefragt, werden sie neu gemischt und erneut abgefragt."
 lae = 0
 DO
  INPUT #1, lat$, deu$
  lae = lae + 1
 LOOP UNTIL EOF(1)
 CLOSE
 OPEN "latein.dat" FOR INPUT AS #1
 IF lae > men THEN zz = men ELSE zz = lae

 FOR x = 1 TO lae - zz
  INPUT #1, lat$, deu$
 NEXT x
 
  FOR x = 1 TO zz
   INPUT #1, a(0, x), a(1, x)
  NEXT x
  anz = zz

 DO
  FOR x = 1 TO anz
   zz = INT(RND * anz + 1)
   SWAP a(0, x), a(0, zz)
   SWAP a(1, x), a(1, zz)
  NEXT x
  FOR x = 1 TO anz
   lat$ = a(0, x)
   deu$ = a(1, x)
   GOSUB abfr
  NEXT x
 LOOP
CASE 4
 PRINT "   Es wird jedes mal eine Vokabel aus allen rausgepickt, und die wird abgefragt."
 PRINT "   Es kann eine Vokabel schon z.B. 5 mal vorgekommen"
 PRINT "   sein und eine andere noch gar nicht."
 lae = 0
 DO
  INPUT #1, lat$, deu$
  lae = lae + 1
 LOOP UNTIL EOF(1)
 DO
  CLOSE
  OPEN "latein.dat" FOR INPUT AS #1
  FOR x = 1 TO INT(RND * lae)
   INPUT #1, lat$, deu$
  NEXT x
  INPUT #1, lat$, deu$
  GOSUB abfr
 LOOP UNTIL ein$ = "men"
CASE ELSE: PRINT "Error lala, sowie Fehler Blabla aufgetreten! Erschiess deinen PC!"
END SELECT
fedich:
CLOSE
PRINT "Du hast heute schon"
PRINT "Richtig:"; r
PRINT "Nicht eingegeben:"; n
PRINT "Falsch:"; f
PRINT "Sollen diese Werte auf Null gesetzt werden(j/n)?"
DO: t$ = INKEY$: LOOP WHILE t$ = ""
IF t$ = "j" THEN r = 0: f = 0: n = 0
GOTO menue


tipps:
CLS
PRINT "Ein sehr kurzer Kommentar zum Programm von mir:"
PRINT "Dieses Programm ist frs Vokabeln-lernen geschrieben. Es funktioniert ahnlich"
PRINT "wie eine Kartei. Die einzige Auswertung der Abfrage ist die Angabe, wieviele"
PRINT "Vokabeln Richtig oder Falsch beantwortet wurden und wie oft nichts eingegeben"
PRINT "wurde. Bei der Vokabeleingabe wird nicht auf Groแ/Kleinschreibung geachtet."
PRINT "Ich habe es mir so gedacht, dass man z.B. jeden Tag 10 Vokabeln eingibt"
PRINT "(Man kann auch jede Woche 50 eingeben oder es ganz unregelmแig tun, mir egal),"
PRINT "und diese dann Abfragen lsst. Ich habe verschiedene Abfragesysteme ausgedacht,"
PRINT "Zum L”schen der Vokabelliste kannst du einfach die Datei umbenennen oder l”schen"
PRINT "Wenn du Verbesserungsvorschlge hast, oder etwas nicht funktioniert wie es soll"
PRINT "Dann wende dich an Rafael Friesen (RafaelFriesen@aol.com)."
PRINT "Es funktioniert nicht nur mit Lateinvokabeln, sondern auch mit anderen Sprachen."
PRINT "Wenn Vokabeln flschlicherweise in der Kartei gelandet sind, kann man die"
PRINT "Datei mit einem Texteditor verndern. M”glichst nicht die letzte Vokabel!"
PRINT "Wenn diese verndert werden soll gib im Programm erst noch eine ein."
PRINT "Das Programm habe ich sehr schnell geschrieben und nicht getestet, daher ist es"
PRINT "so Primitiv, aber Hauptsache es erfllt seinen Zweck."
DO: LOOP WHILE INKEY$ = ""
GOTO menue

abfr:
IF t$ = "d" THEN
 PRINT "Gib das Lateinische Wort fr " + deu$ + " ein:";
 INPUT ein$
 ein$ = LCASE$(ein$)
 IF ein$ = "men" THEN GOTO fedich
 IF ein$ = lat$ THEN r = r + 1: PRINT "Richtig!"
 IF ein$ <> lat$ THEN f = f + 1: PRINT "Falsch! Richtig ist " + lat$ + "."
 IF ein$ = "" THEN f = f - 1: n = n + 1
ELSE
 PRINT "Gib das Deutsche Wort fr " + lat$ + " ein:";
 INPUT ein$
 ein$ = LCASE$(ein$)
 IF ein$ = "men" THEN GOTO fedich
 IF ein$ = deu$ THEN r = r + 1: PRINT "Richtig!"
 IF ein$ <> deu$ THEN f = f + 1: PRINT "Falsch! Richtig ist " + deu$ + "."
 IF ein$ = "" THEN f = f - 1: n = n + 1
END IF
PRINT
RETURN

