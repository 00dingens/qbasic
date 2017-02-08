CLS
DIM i(0) AS STRING * 1
OPEN "c:\windows\desktop\textorig.txt" FOR BINARY AS #1
OPEN "c:\windows\desktop\textcopy.txt" FOR OUTPUT AS #2
OPEN "c:\windows\desktop\textrest.txt" FOR OUTPUT AS #3
PRINT "Text entschlÅsseln"
PRINT : PRINT "Vorbereiten:"
l = LOF(1)
FOR x = 1 TO l
 GET #1, x, i(0)
 SELECT CASE ASC(i(0))
 CASE 48 TO 57: PRINT #2, i(0);
 CASE 65 TO 90: PRINT #2, i(0);
 CASE 97 TO 122: PRINT #2, i(0);
 CASE IS = 196: PRINT #2, i(0);
 CASE IS = 214: PRINT #2, i(0);
 CASE IS = 220: PRINT #2, i(0);
 CASE IS = 223: PRINT #2, i(0);
 CASE IS = 228: PRINT #2, i(0);
 CASE IS = 246: PRINT #2, i(0);
 CASE IS = 252: PRINT #2, i(0);
 CASE ELSE: PRINT #3, i(0);
 END SELECT
 LOCATE 3, 13: PRINT INT(x * 100 / l); "%"
NEXT x
CLOSE

OPEN "c:\windows\desktop\textcopy.txt" FOR BINARY AS #1
OPEN "c:\windows\desktop\textcode.txt" FOR OUTPUT AS #2
LOCATE 5, 1: PRINT "EntschlÅsseln:"
PRINT #2, "Hier nun alle Entschluesselungsmoeglichkeiten des Textes:"
l = INT(LOF(1) / 2)
FOR x = 2 TO l
 PRINT #2, "Bandbreite:"; x
 FOR y = 1 TO x
  FOR z = 0 TO INT(l / x) + 1
   GET #1, z * x + y, i(0)
   PRINT #2, i(0);
  NEXT z
  PRINT #2, ""
 NEXT y
 PRINT #2, ""
 LOCATE 5, 15: PRINT x; "Blocks von"; l; "("; INT(x * 100 / l); "%)"
NEXT x
CLOSE


'info
OPEN "c:\windows\desktop\textinfo.txt" FOR OUTPUT AS #1
PRINT #1, "aus textorig.txt wird der originaltext genommen, und ohne sonderzeichen, leerschritte und umbrueche(all diese zeichen werden in textrest.txt gespeichert) in textcopy.txt gespeichert."
PRINT #1, "dann werden in textcode.txt buchstabenblocks erzeugt, in denen ma nach zusammenhÑngenden worten suchen kann."
CLOSE

