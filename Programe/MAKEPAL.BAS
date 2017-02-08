OPEN "c:\eigene~1\rafael\pp_num.pal" FOR OUTPUT AS #1
PRINT #1, "RIFF" + CHR$(16) + CHR$(4) + CHR$(0) + CHR$(0) + "PAL data" + CHR$(4) + CHR$(4) + CHR$(0) + CHR$(0) + CHR$(0) + CHR$(3) + CHR$(0) + CHR$(1);
SCREEN 13
FOR x = 1 TO 255
 LINE (x, 0)-(x, 200), x
NEXT x
FOR r = 0 TO 5
 FOR g = 0 TO 5
  FOR b = 0 TO 5
   PRINT #1, CHR$(r * 51) + CHR$(g * 51) + CHR$(b * 51) + CHR$(0);
   OUT &H3C8, r * 36 + g * 6 + b
   OUT &H3C9, r * 12
   OUT &H3C9, g * 12
   OUT &H3C9, b * 12
  NEXT b
 NEXT g
NEXT r
FOR x = 1 TO 40
 PRINT #1, CHR$(x * 6.3 + 3) + CHR$(x * 6.3 + 3) + CHR$(x * 6.3 + 3) + CHR$(0);
 OUT &H3C8, x + 215
 OUT &H3C9, INT(x * 1.5 + 3)
 OUT &H3C9, INT(x * 1.5 + 3)
 OUT &H3C9, INT(x * 1.5 + 3)
NEXT x
CLOSE

