
'CLS = Bildschirm leeren

CLS

'INPUT = Eingabe

INPUT "Wie heisst du"; Name$

'PRINT = Auf den Bildschirm schreiben
'Abgetrennt durch ; (Semikolon)

PRINT "Hallo "; Name$
INPUT "Wie alt bist du"; Alter
Tage = Alter * 365
PRINT "Dann lebst du ja schon"; Tage; "Tage auf der Welt."
INPUT "Bist du m„nnlich oder weiblich (m/w)"; antwort$

'IF = Wenn
'THEN = Dann
'ELSE = Sonst

IF antwort$ = "m" THEN PRINT "Du bist ein Junge." ELSE PRINT "Du bist ein M„del"

'FOR ... NEXT = Z„hlschleife

CLS
FOR x = 1 TO 10
 PRINT x
NEXT x

