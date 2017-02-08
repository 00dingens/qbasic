DECLARE SUB mal (x, y, text$, f)
GOSUB ram
END



ram:
 SCREEN 12
 CLS
 PAINT (1, 1), 7
 mal 50, 100, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-", 4
 mal 100, 20, "aEXERCITE LATINUM", 0
 COLOR 15
 PRINT ""
RETURN

SUB mal (x, y, text$, f)
 DRAW "s2 bm" + STR$(x) + "," + STR$(y + 20) + "c" + STR$(f)
 FOR z = 1 TO LEN(text$)
  SELECT CASE MID$(text$, z, 1)
  CASE "a": DRAW "m+4,-12 m+2,+6 nm-4,0 m+2,+6 br2"
  CASE "b": DRAW "m+0,-12 r6 f2 d2 g2 nl6 f2 d2 g2 nl6 br4"
  CASE "c": DRAW "be8 u2 h2 l4 g2 d8 f2 r4 e2 u2 bm+2,+4"
  CASE "d": DRAW "m+0,-12 r6 f2 d8 g2 nl6 br4"
  CASE "e": DRAW "nr8 u6 nr6 u6 r8 bm+2,+12"
  CASE "f": DRAW "u6 nr6 u6 r8 bm+2,+12"
  CASE "g": DRAW "be8 u2 h2 l4 g2 d8 f2 r4 e2 u4 l4 bm+6,+6"
  CASE "h": DRAW "u6 nu6 r8 nu6 d6 br2"
  CASE "i": DRAW "nu12 br2"


  CASE "A": DRAW "m+8,-24 m+4,+12 nm-8,0 m+4,+12 br2"
  CASE "B": DRAW "m+0,-24 r12 f4 d4 g4 nl12 f4 d4 g4 nl12 br6"
  CASE "C": DRAW "be16 u4 h4 l8 g4 d16 f4 r8 e4 u4 bm+2,+8"
  CASE "D": DRAW "m+0,-24 r12 f4 d16 g4 nl12 br6"
  CASE "E": DRAW "nr16 u12 nr12 u12 r16 bm+2,+24"
  CASE "F": DRAW "u12 nr12 u12 r16 bm+2,+24"
  CASE "G": DRAW "be16 u4 h4 l8 g4 d16 f4 r8 e4 u8 l8 bm+10,+12"
  CASE "H": DRAW "u12 nu12 r16 nu12 d12 br2"
  CASE "I": DRAW "nu24 br2"
  END SELECT
 NEXT z
END SUB

