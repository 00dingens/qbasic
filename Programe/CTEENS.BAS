CLS
INPUT "Start"; start
INPUT "Ende"; ende
INPUT "jpg (j/n)"; jpg1$
INPUT "JPG (j/n)"; jpg2$
INPUT "gif (j/n)"; gif1$
INPUT "GIF (j/n)"; gif2$
IF jpg1$ <> "j" AND gif1$ <> "j" AND jpg2$ <> "j" AND gif2$ <> "j" THEN PRINT "Keine Bilder - ENDE.": END
OPEN "c:\windows\desktop\cteens.htm" FOR OUTPUT AS #1
PRINT #1, "<html><head><title>Alle Christeens-";
IF jpg1$ = "j" THEN PRINT #1, "jpg-";
IF jpg2$ = "j" THEN PRINT #1, "JPG-";
IF gif1$ = "j" THEN PRINT #1, "gif-";
IF gif2$ = "j" THEN PRINT #1, "GIF-";
PRINT #1, "Bilder von" + STR$(start) + " bis" + STR$(ende) + " V1.2</title></head><body>"
FOR x = start TO ende
 IF jpg1$ = "j" THEN PRINT #1, "<img src=" + CHR$(34) + "http://acmb.xpo.de/christeens.de/v3.2/community/ownhomes/pics/" + RTRIM$(LTRIM$(STR$(x))) + ".jpg" + CHR$(34) + " alt=" + CHR$(34) + STR$(x) + ".jpg" + CHR$(34) + ">";
 IF jpg2$ = "j" THEN PRINT #1, "<img src=" + CHR$(34) + "http://acmb.xpo.de/christeens.de/v3.2/community/ownhomes/pics/" + RTRIM$(LTRIM$(STR$(x))) + ".JPG" + CHR$(34) + " alt=" + CHR$(34) + STR$(x) + ".JPG" + CHR$(34) + ">";
 IF gif1$ = "j" THEN PRINT #1, "<img src=" + CHR$(34) + "http://acmb.xpo.de/christeens.de/v3.2/community/ownhomes/pics/" + RTRIM$(LTRIM$(STR$(x))) + ".gif" + CHR$(34) + " alt=" + CHR$(34) + STR$(x) + ".gif" + CHR$(34) + ">";
 IF gif2$ = "j" THEN PRINT #1, "<img src=" + CHR$(34) + "http://acmb.xpo.de/christeens.de/v3.2/community/ownhomes/pics/" + RTRIM$(LTRIM$(STR$(x))) + ".GIF" + CHR$(34) + " alt=" + CHR$(34) + STR$(x) + ".GIF" + CHR$(34) + ">";
 PRINT #1, STR$(x) + "<br>"
NEXT x
PRINT #1, "</body></html>"
CLOSE
END


'v1.0 - Alle Bilder JPG & GIF
'v1.1 - Zahlenbereich eingegrenzt
'v1.2 - groá und kleinschreibung jpg JPG gif GIF

