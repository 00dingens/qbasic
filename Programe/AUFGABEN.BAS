OPEN "c:\windows\desktop\plus3st.txt" FOR OUTPUT AS #1
DIM a(2000) AS STRING
z = 0
'alle additionen mit ergebnis bis zwanzig
'FOR x = 0 TO 20
' FOR y = 0 TO 20 - x
'  z = z + 1
'  a(z) = RIGHT$(" " + LTRIM$(STR$(x)), 2) + " + " + RIGHT$(" " + LTRIM$(STR$(y)), 2) + " ="
' NEXT y
'NEXT x

'alle additionen dreier einstelliger zahlen
FOR x1 = 0 TO 9
 FOR x2 = 0 TO 9
  FOR x3 = 0 TO 9
   z = z + 1
   a(z) = STR$(x1) + " +" + STR$(x2) + " +" + STR$(x3) + " ="
  NEXT x3
 NEXT x2
NEXT x1


'FOR t = 1 TO 10 'mehrfach jeweils mischen und in datei
 FOR x = 1 TO z
  SWAP a(x), a(INT(RND * z + 1))
 NEXT x
 FOR x = 1 TO z
  PRINT #1, a(x)
 NEXT x
 PRINT #1, "Insgesamt"; z; " Aufgaben."
'NEXT t
CLOSE

