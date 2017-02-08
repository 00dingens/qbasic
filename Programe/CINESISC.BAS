OPEN "c:\windows\desktop\chin3.htm" FOR OUTPUT AS #1
PRINT #1, "<html><head><title>alle zeichen</title></head><body><font size=3>"
FOR x = 19968 TO 40869
 PRINT #1, "&#"; LTRIM$(STR$(x)); ";"
NEXT x
PRINT #1, "</font></body></html>"
CLOSE

