'zwei von 4  schÅlern im selben monat geburtstag
OPEN "c:\windows\desktop\monat.txt" FOR OUTPUT AS #1
PRINT #1, "             "
FOR x1 = 1 TO 12
FOR x2 = 1 TO 12
FOR x3 = 1 TO 12
FOR x4 = 1 TO 12
 a$ = RIGHT$(" " + STR$(x1), 2) + RIGHT$(" " + STR$(x2), 2) + RIGHT$(" " + STR$(x3), 2) + RIGHT$(" " + STR$(x4), 2)
 'PRINT #1, "   " + a$;
 g = 0
 IF x1 = x2 THEN g = g + 1
 IF x1 = x3 THEN g = g + 1
 IF x1 = x4 THEN g = g + 1
 IF x2 = x3 THEN g = g + 1
 IF x2 = x4 THEN g = g + 1
 IF x3 = x4 THEN g = g + 1
 IF g = 1 THEN PRINT #1, a$ + "   "; : anz = anz + 1
 IF g = 1 AND anz MOD 23 = 0 THEN PRINT #1, ""
NEXT x4
NEXT x3
NEXT x2
NEXT x1
PRINT #1, ""
PRINT #1, "bei "; anz; "von "; 12 ^ 4; "Mîglichkeiten haben 2 SchÅler im selben Monat Geburtstag."
CLOSE

END

'drei wÅrfel werden addiert
OPEN "c:\windows\desktop\dreiwuer.txt" FOR OUTPUT AS #1
DIM s(18) AS STRING
FOR x1 = 1 TO 6
FOR x2 = 1 TO 6
FOR x3 = 1 TO 6
 a$ = CHR$(48 + x1) + CHR$(48 + x2) + CHR$(48 + x3)
 s(x1 + x2 + x3) = s(x1 + x2 + x3) + " " + a$
NEXT x3
NEXT x2
NEXT x1
PRINT #1, "Drei WÅrfel werden addiert:"
FOR x = 1 TO 18
 PRINT #1, s(x)
 PRINT #1, ""
NEXT x
CLOSE

