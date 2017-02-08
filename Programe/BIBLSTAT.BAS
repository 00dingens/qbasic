DIM i(0) AS STRING * 1
DIM a(256)
OPEN "c:\windows\desktop\bibel.txt" FOR BINARY AS #1
LOCATE 1, 1: PRINT LOF(1)
onoff = 1
FOR x = 1 TO LOF(1)
 GET #1, x, i(0)
 SELECT CASE i(0)
 CASE "[": onoff = 0
 CASE "]": onoff = 1
 CASE ELSE: IF onoff = 1 THEN a(ASC(i(0))) = a(ASC(i(0))) + 1
 END SELECT
 LOCATE 2, 1: PRINT x
NEXT x
l = LOF(1)
CLOSE
OPEN "c:\windows\desktop\bibestat.txt" FOR OUTPUT AS #1
PRINT #1, "L„nge der Datei:"; l
FOR x = 65 TO 90
 gbu = gbu + a(x)
NEXT x
gbu = gbu + a(196) + a(214) + a(220)
PRINT #1, "Anzahl der Grossbuchstaben:"; gbu
FOR x = 97 TO 122
 kbu = kbu + a(x)
NEXT x
kbu = kbu + a(223) + a(228) + a(246) + a(252)
PRINT #1, "Anzahl der Kleinbuchstaben:"; kbu
PRINT #1, "Anzahl der Buchstaben:"; kbu + gbu
FOR x = 48 TO 57
 za = za + a(x)
NEXT x
PRINT #1, "Anzahl der Ziffern:"; za
PRINT #1, "Zeichenh„ufigkeit Absolut und in % von Buchstaben und Ziffern und in % von Buchstaben und in % von Ziffern:"
FOR x = 0 TO 255
' IF a(x) > 0 THEN PRINT #1, CHR$(x), a(x), INT(a(x) * 1000000 / (gbu + kbu + za)) / 10000; "%", INT(a(x) * 1000000 / (gbu + kbu)) / 10000; "%", INT(a(x) * 1000000 / (za)) / 10000; "%"
 IF a(x) > 0 THEN
  PRINT #1, CHR$(x); a(x),
  PRINT #1, USING "##.####%"; a(x) * 100 / (gbu + kbu + za);
  PRINT #1, USING "   ##.####%"; a(x) * 100 / (gbu + kbu);
  PRINT #1, USING "   ##.####%"; a(x) * 100 / (za)
 END IF
NEXT x
FOR x = 0 TO 255
 ch = ch + a(x)
NEXT x
PRINT #1, "Checksumme:"; ch
CLOSE

