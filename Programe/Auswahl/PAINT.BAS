
'Bilder mit PAINT (Bilder am Ende)

DIM a(8), b(8, 4)
READ w
FOR q = 1 TO w

 FOR x = 1 TO 8
   READ a(9 - x)
 NEXT x
 
 FOR x = 1 TO 8
  FOR y = 1 TO 4
   b(x, y) = a(x) MOD 2
   a(x) = (a(x) - a(x) MOD 2) / 2
  NEXT y
 NEXT x
 
 FOR x = 1 TO 4
  c = 0
  FOR y = 1 TO 8
   c = c + b(y, x) * 2 ^ (y - 1)
  NEXT y
  p$ = p$ + CHR$(c)
  PRINT CHR$(c);
 NEXT x

NEXT q

SCREEN 7
PAINT (10, 10), p$


OPEN "C:\windows\desktop\PAINTMUS.TER" FOR APPEND AS #1
READ z$
PRINT #1, z$ + ":";
FOR x = 1 TO LEN(p$)
 PRINT #1, " ";
 PRINT #1, RIGHT$("0" + HEX$(ASC(MID$(p$, x, 1))), 2);
NEXT x
PRINT #1, " = CHR$(";
FOR x = 1 TO LEN(p$)
 PRINT #1, ") + CHR$(";
 PRINT #1, RIGHT$("00" + STR$(ASC(MID$(p$, x, 1))), 3);
NEXT x
PRINT #1, ""
CLOSE


'DATA 6
'DATA 12,12,  ,  ,10,10,10,
'DATA 12,  ,12,  ,10,  ,  ,
'DATA 12,12,  ,  ,10,10,  ,
'DATA 12,  ,12,  ,10,  ,  ,
'DATA 12,  ,12,  ,10,  , 2,
'DATA   ,  ,  ,  ,  ,  ,  ,
'DATA RF.


'DATA 6
'DATA  2, 2,  ,  ,  ,  ,12,
'DATA  2,  , 2,  ,  ,  ,12,
'DATA  2,  , 2,  ,  ,  ,12,
'DATA  2,  , 2,  ,12,  ,12,
'DATA  2, 2,  ,  ,  ,12,  ,
'DATA   ,  ,  ,  ,  ,  ,  ,
'DATA DJ


'DATA 4
'DATA   ,15,  ,15,  ,15,  ,15
'DATA 15,  , 4,  ,15,  , 4,
'DATA   ,15,  ,15,  ,15,  ,15
'DATA 12,  ,15,  ,12,  ,15,
'DATA karo

DATA 8
DATA  4,15,15,15,15,15, 4,15
DATA 15, 4,15,15,15, 4,15,15
DATA 15,15, 4,15, 4,15,15,15
DATA 15,15,15, 4,15,15,15,15
DATA 15,15, 4,15, 4,15,15,15
DATA 15, 4,15,15,15, 4,15,15
DATA  4,15,15,15,15,15, 4,15
DATA 15,15,15,15,15,15,15, 4
DATA "groáes rotes karo mit weiáem hintergrund"

'DATA 9
'DATA   ,  , 1, 1, 1,  ,  ,
'DATA   , 1,  ,  ,  , 1,  ,
'DATA  1,  , 2,  , 2,  , 1,
'DATA  1,  ,  ,  ,  ,  , 1,
'DATA  1, 4,  ,  ,  , 4, 1,
'DATA  1,  , 4, 4, 4,  , 1,
'DATA   , 1,  ,  ,  , 1,  ,
'DATA   ,  , 1, 1, 1,  ,  ,
'DATA   ,  ,  ,  ,  ,  ,  ,
'DATA SMILEY

