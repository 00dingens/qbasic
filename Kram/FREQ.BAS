SCREEN 12
'OPEN "c:\rafael\equ.wav" FOR OUTPUT AS #1
fenster = 1000
pi = 3.141593
DIM f(fenster) AS INTEGER
ampl = 100 * pi * 2 / fenster
PRINT ampl
FOR x = 0 TO fenster - 1
 f(x) = INT((SIN(x * ampl) + 1) * 128)
 PSET (x, f(x))
 'PRINT a;
' PRINT #1, CHR$(a);
NEXT x
'CLOSE
FOR x = 90 TO 110
 real = 0: imag = 0
 FOR y = 0 TO fenster - 1
  real = real + f(y) * COS(2 * pi * x * y / fenster)
  imag = imag + f(y) * SIN(2 * pi * x * y / fenster)
 NEXT y
 betrag = SQR(real * real + imag * imag)
 PRINT betrag,
NEXT x


