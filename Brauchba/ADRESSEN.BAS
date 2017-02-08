RANDOMIZE TIMER
CLS
INPUT "Willst du etwas eintragen"; R$
IF UCASE$(R$) = "J" THEN
OPEN "c:\windows\desktop\liste.txt" FOR APPEND AS #1
DO

 INPUT "Name:         ", Name$
 INPUT "Geburtsdatum: ", Geburtstag$
 INPUT "Wohnort:      ", Wohnort$
 INPUT "Telefon:      ", Telefon$
 INPUT "Sonstiges:    ", Sonstiges$

 PRINT #1, "Name:         "; Name$
 PRINT #1, "Geburtsdatum: "; Geburtstag$
 PRINT #1, "Wohnort:      "; Wohnort$
 PRINT #1, "Telefon:      "; Telefon$
 PRINT #1, "Sonstiges:    "; Sonstiges$

 PRINT #1,
 INPUT "Willst du einen weiteren Eintrag eingeben"; R$
LOOP WHILE UCASE$(R$) = "J"
CLOSE #1
END IF
OPEN "c:\windows\desktop\liste.txt" FOR INPUT AS #1
CLS
WIDTH 80, 50
COLOR INT(RND * 16)
PRINT "Eintr„ge in der Datei:": PRINT
DO WHILE NOT EOF(1)
 x = x + 1
 LINE INPUT #1, REC$
 PRINT REC$
 IF x = 18 THEN DO: LOOP WHILE INKEY$ = "": x = 0: COLOR INT(RND * 16)
LOOP
CLOSE #1

