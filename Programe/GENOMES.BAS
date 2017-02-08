
'makes a big file of genomes

OPEN "c:\dokume~1\rafael\desktop\genomes.gms" FOR OUTPUT AS #1
DIM i(2000) AS STRING
genes = 300
genomes = 30

FOR x = 1 TO genes
 'i(x) = CHR$(INT(RND * 26 + 97)) + CHR$(INT(RND * 26 + 97)) + CHR$(INT(RND * 26 + 97)) + CHR$(INT(RND * 26 + 97)) + CHR$(INT(RND * 26 + 97)) + CHR$(INT(RND * 26 + 97))
 i(x) = "gene" + LTRIM$(STR$(x))
 PRINT i(x); " ";
NEXT x

FOR x = 1 TO genomes
 PRINT #1, ""
 PRINT #1, ""
 PRINT #1, ">Genome"; x
 FOR y = 1 TO genes
  SWAP i(y), i(INT(RND * genes + 1))        'mix genes
 NEXT y
 first$ = i(1)
 FOR y = 1 TO genes
  IF RND < .5 AND i(y) <> first$ THEN PRINT #1, "-";      'reverse
  PRINT #1, i(y); " ";
  IF RND < SQR(genes / 2) / genes THEN
   IF RND < .5 THEN PRINT #1, first$;    'circular
   PRINT #1, ""                          'end of chromosome
   first$ = i(y + 1)
  END IF
 NEXT y
NEXT x
CLOSE

