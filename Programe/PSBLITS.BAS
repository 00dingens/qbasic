DIM q$(2)
q$(0) = "O": q$(1) = " ": q$(2) = "X"
OPEN "psblits3.txt" FOR OUTPUT AS #1
FOR a1 = -1 TO 1
FOR a2 = -1 TO 1
FOR a3 = -1 TO 1
FOR a4 = -1 TO 1
FOR a5 = -1 TO 1
FOR a6 = -1 TO 1
FOR a7 = -1 TO 1
FOR a8 = -1 TO 1
FOR a9 = -1 TO 1
 a = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
 LOCATE 1, 1: PRINT a, a1; a2; a3; a4; a5; a6; a7; a8; a9, z
 IF a = 0 OR a = 1 THEN
  gg = 0: ss = 0
  IF (a1 = a2) AND (a1 = a3) AND (ss <> a1) AND (a1 <> 0) THEN gg = gg + 1: ss = a1
  IF (a4 = a5) AND (a4 = a6) AND (ss <> a4) AND (a4 <> 0) THEN gg = gg + 1: ss = a4
  IF (a7 = a8) AND (a7 = a9) AND (ss <> a7) AND (a7 <> 0) THEN gg = gg + 1: ss = a7
  IF (a1 = a4) AND (a1 = a7) AND (ss <> a1) AND (a1 <> 0) THEN gg = gg + 1: ss = a1
  IF (a2 = a5) AND (a2 = a8) AND (ss <> a2) AND (a2 <> 0) THEN gg = gg + 1: ss = a2
  IF (a3 = a6) AND (a3 = a9) AND (ss <> a3) AND (a3 <> 0) THEN gg = gg + 1: ss = a3
  IF (a1 = a5) AND (a1 = a9) AND (ss <> a1) AND (a1 <> 0) THEN gg = gg + 1: ss = a1
  IF (a3 = a5) AND (a3 = a7) AND (ss <> a3) AND (a3 <> 0) THEN gg = gg + 1: ss = a3
  IF gg > 1 THEN GOTO gew2
  BEEP
  m = m + 1
 
  s1$ = s1$ + " " + q$(a1 + 1) + "|" + q$(a2 + 1) + "|" + q$(a3 + 1)
  s2$ = s2$ + " -+-+-"
  s3$ = s3$ + " " + q$(a4 + 1) + "|" + q$(a5 + 1) + "|" + q$(a6 + 1)
  s4$ = s4$ + " -+-+-"
  s5$ = s5$ + " " + q$(a7 + 1) + "|" + q$(a8 + 1) + "|" + q$(a9 + 1)
 
  LOCATE 10, 37: PRINT q$(a1 + 1) + "|" + q$(a2 + 1) + "|" + q$(a3 + 1)
  LOCATE 11, 37: PRINT "-+-+-"
  LOCATE 12, 37: PRINT q$(a4 + 1) + "|" + q$(a5 + 1) + "|" + q$(a6 + 1)
  LOCATE 13, 37: PRINT "-+-+-"
  LOCATE 14, 37: PRINT q$(a7 + 1) + "|" + q$(a8 + 1) + "|" + q$(a9 + 1)
  PRINT gg

  IF m = 55 THEN
   PRINT #1, s1$
   PRINT #1, s2$
   PRINT #1, s3$
   PRINT #1, s4$
   PRINT #1, s5$
   PRINT #1, ""
   s1$ = "": s2$ = "": s3$ = "": s4$ = "": s5$ = ""
   m = 0
  END IF
  z = z + 1
  'DO: LOOP WHILE INKEY$ = ""
 END IF
gew2:
NEXT a9
NEXT a8
NEXT a7
NEXT a6
NEXT a5
NEXT a4
NEXT a3
NEXT a2
NEXT a1
CLOSE
PRINT z

