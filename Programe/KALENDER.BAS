DIM a(12)
FOR x = 1 TO 12
 READ q
 a(x) = q
NEXT x
DIM ww(6) AS STRING * 2
FOR x = 0 TO 6
 READ q$
 ww(x) = q$
NEXT x
jahr = 2011    'wenn schaltjahr -> data ver„ndern
tag = 6        'startwochentag 0=so 1=mo ... 6=sa

OPEN "c:\rafael\kalender.htm" FOR OUTPUT AS #1
PRINT #1, "<html><head><title>Das Jahr "; jahr; "</title></head><body><h1>Das Jahr "; jahr; "</h1><table border=1 cellspacing=0 width=100% height=100%><tr><th width=4%></th><th width=8%>Januar</th><th width=8%>Februar</th><th width=8%>M&auml"; CHR$(59); "rz</th><th width=8%>April</th><th width=8%>Mai</th><th width=8%>Juni</th><th width=8%>Juli</th><th width=8%>August</th><th width=8%>September</th><th width=8%>Oktober</th><th width=8%>November</th><th width=8%>Dezember</th></tr>";
FOR x = 1 TO 31
 PRINT #1, "<tr><th>"; x; "</th>";
 FOR y = 1 TO 12
  wt = x - 1 + tag
  FOR z = 1 TO y - 1
   wt = wt + a(z)
  NEXT z
  wt = wt MOD 7
  PRINT #1, "<td";
  IF a(y) < x THEN PRINT #1, " bgcolor=#7f7f7f";
  IF a(y) >= x AND wt = 0 THEN PRINT #1, " bgcolor=#ff7f7f";
  PRINT #1, ">";
'  IF a(y) < x THEN PRINT #1, "<font color=#7f7f7f>";  ELSE PRINT #1, "<font color=#ffffff>";
'  PRINT #1, ".</font></td>";
  PRINT #1, ww(wt); x; "</td>";
 NEXT y
 PRINT #1, "</tr>";
NEXT x
PRINT #1, "</table></body></html>"
CLOSE

DATA 31,28,31,30,31,30,31,31,30,31,30,31
DATA So,Mo,Di,Mi,Do,Fr,Sa

