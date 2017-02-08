
'l”st gleichungssysteme mit max. 25 unbekannten.

DIM q(1 TO 25, 1 TO 25, 1 TO 26), e(26)
INPUT "Wieviele Gleichungen (1-25)"; anz
IF anz < 1 OR anz > 25 THEN anz = 2
CLS
PRINT "Konstanten fr die"; anz; "Gleichungen angeben:"
FOR x = 1 TO anz
 LOCATE x + 3, 1: PRINT RTRIM$(STR$(x)); ": 0 = ";
 FOR y = 1 TO anz + 1
  LOCATE 2, 1: PRINT SPACE$(78)
  LOCATE 2, 1: PRINT RTRIM$(STR$(x)); ". Gleichung, "; RTRIM$(STR$(y));
  INPUT ". Konstante:", q(anz, x, y)
  LOCATE x + 3, 1: PRINT RTRIM$(STR$(x)); ": 0 =";
  FOR z = 1 TO y
   PRINT RTRIM$(STR$(CDBL(q(anz, x, z))));
   IF z > 1 THEN PRINT CHR$(z + 95);
   IF z <> y THEN PRINT " +";
  NEXT z
 NEXT y
NEXT x

'Ausgabe
OPEN "c:\windows\desktop\gleisys.txt" FOR APPEND AS #1
CLS
z = anz

'PRINT #1, ""
'PRINT #1, "    Es wird die Letzte von allen anderen Gleichungen abgezogen, so, dass der"
'PRINT #1, "    letzte Wert wegf„llt. z.B.:"
'PRINT #1, ""
'PRINT #1, "     3 + 3a + 2b = 0"
'PRINT #1, "(2x) 1 + 1a + 1b = 0 (-)"
'PRINT #1, "    ---------------------"
'PRINT #1, "     1 + 1a      = 0"
'PRINT #1, ""
'PRINT #1, "    Nun wird jeweils in die erste Gleichung"
'PRINT #1, "    des n„chsth”heren Systems eingesetzt. z.B.:"
'PRINT #1, "    a = -1"
'PRINT #1, "    3 + 3 *-1 + 2b = 0"
'PRINT #1, "    b = 0"
'PRINT #1, ""
'PRINT

FOR z = anz TO 1 STEP -1
 FOR x = 1 TO z - 1
  mul = q(z, x, z + 1) / q(z, z, z + 1)
  FOR y = 1 TO z
   q(z - 1, x, y) = q(z, x, y) - q(z, z, y) * mul
  NEXT y
 NEXT x

'Ausgabe
FOR x = 1 TO z
 PRINT #1, LTRIM$(STR$(z)); "."; LTRIM$(STR$(x)); ":  ";
 FOR y = 1 TO z + 1
  PRINT #1, RTRIM$(STR$(CDBL(q(z, x, y))));
   IF y > 1 THEN PRINT #1, CHR$(y + 95);
  IF z + 1 <> y THEN PRINT #1, " +";  ELSE PRINT #1, " = 0"
 NEXT y
NEXT x

NEXT z

'einsetzen
e(1) = 1
FOR z = 1 TO anz
 sum = 0
 FOR x = 1 TO z
  sum = sum - q(z, 1, x) * e(x)
 NEXT x
 e(z + 1) = sum / q(z, 1, z + 1)
 PRINT #1, "    "; CHR$(z + 96); " ="; e(z + 1)

'Ausgabe
 PRINT #1, LTRIM$(STR$(z)); ".1:  ";
 FOR y = 1 TO z + 1
  PRINT #1, RTRIM$(STR$(CDBL(q(z, 1, y))));
   IF y > 1 THEN PRINT #1, " *"; e(y);
  IF z + 1 <> y THEN PRINT #1, " +";  ELSE PRINT #1, " = 0"
 NEXT y

NEXT z
z = anz
PRINT #1, ""
PRINT #1, "Also:"
PRINT #1, ""
FOR y = 2 TO z + 1
 PRINT #1, CHR$(y + 95); " ="; e(y)
 PRINT CHR$(y + 95); " ="; e(y)
NEXT y
PRINT #1, ""
PRINT #1, "Fertich."
PRINT #1, ""
PRINT #1, "-------------------------------------------------------"
CLOSE

