READ anz
SCREEN 12
FOR i = 1 TO anz
 READ a, b, c, d
 LINE (640 - a * 18, 20 + b * 22)-(640 - c * 18, 20 + d * 22)
NEXT i

DATA 187
'Australien (11)
DATA  6,11, 7,12
DATA  7,12, 6,12
DATA  6,12, 5,12
DATA  5,12, 4,13
DATA  4,13, 3,13
DATA  3,13, 3,12
DATA  3,12, 3,11
DATA  3,11, 4,10
DATA  4,10, 4,11
DATA  4,11, 5,10
DATA  5,10, 6,11
'+++++
'Afrika (24)
DATA 15, 6,16, 6
DATA 16, 6,17, 6
DATA 17, 6,17, 5
DATA 17, 5,18, 5
DATA 18, 5,19, 6
DATA 19, 6,20, 7
DATA 20, 7,19, 8
DATA 19, 8,18, 8
DATA 18, 8,17, 9
DATA 17, 9,17,10
DATA 17,10,17,11
DATA 17,11,16,12
DATA 16,12,15,12
DATA 15,12,14,11
DATA 14,11,14,10
DATA 14,10,14, 9
DATA 14, 9,13, 8
DATA 13, 8,14, 8
DATA 14, 8,14, 7
DATA 14, 7,15, 6
DATA 13,10,14,11
DATA 14,11,13,12
DATA 13,12,13,11
DATA 13,11,13,10
'+++++
'Europa (17)
DATA 15, 2,16, 2
DATA 16, 2,17, 3
DATA 17, 3,16, 3
DATA 16, 3,15, 3
DATA 15, 3,16, 4
DATA 16, 4,17, 3
DATA 17, 3,18, 4
DATA 18, 4,19, 3
DATA 19, 3,19, 4
DATA 19, 4,18, 4
DATA 18, 4,19, 5
DATA 19, 5,18, 5
DATA 18, 5,17, 5
DATA 17, 5,16, 5
DATA 16, 5,17, 4
DATA 16, 5,15, 5
DATA 15, 5,15, 4
'+++++
'Asien (40)
DATA 15, 4,14, 5
DATA 14, 5,15, 5
DATA 15, 5,15, 6
DATA 15, 6,14, 7
DATA 14, 7,13, 8
DATA 13, 8,12, 7
DATA 12, 7,13, 6
DATA 13, 6,12, 6
DATA 12, 6,11, 7
DATA 11, 7,10, 8
DATA 10, 8, 9, 7
DATA  9, 7, 8, 8
DATA  8, 8, 7, 8
DATA  7, 8, 7, 7
DATA  7, 7, 6, 6
DATA  6, 6, 6, 5
DATA  6, 5, 5, 5
DATA  5, 5, 4, 4
DATA  4, 4, 3, 3
DATA  3, 3, 2, 3
DATA  3, 3, 2, 4
DATA  2, 4, 1, 3
DATA  1, 3, 0, 3
'DATA  0, 3,35, 2
'DATA 35, 2, 0, 2
DATA  0, 2, 1, 2
DATA  1, 2, 2, 2
DATA  2, 2, 3, 2
DATA  3, 2, 4, 2
DATA  4, 2, 5, 2
DATA  5, 2, 6, 2
DATA  6, 2, 7, 1
DATA  7, 1, 8, 1
DATA  8, 1, 9, 1
DATA  9, 1,10, 2
DATA 10, 2,11, 2
DATA 11, 2,12, 2
DATA 12, 2,13, 2
DATA 13, 2,14, 2
DATA 14, 2,15, 2
'Antarktis
DATA  0,17, 1,17
DATA  1,17, 2,17
DATA  2,17, 1,16
DATA  1,16, 2,16
DATA  2,16, 3,16
DATA  3,16, 4,16
DATA  4,16, 5,16
DATA  5,16, 6,16
DATA  6,16, 7,16
DATA  7,16, 8,16
DATA  8,16, 9,16
DATA  9,16,10,16
DATA 10,16,11,16
DATA 11,16,12,16
DATA 12,16,13,16
DATA 13,16,14,16
DATA 14,16,15,16
DATA 15,16,16,16
DATA 16,16,17,16
DATA 17,16,18,16
DATA 18,16,19,16
DATA 19,16,20,16
DATA 20,16,21,17
DATA 21,17,22,17
DATA 22,17,23,17
DATA 23,17,24,17
DATA 24,17,25,17
DATA 25,17,26,17
DATA 25,17,24,16
DATA 24,16,24,15
DATA 24,15,25,16
DATA 25,16,26,16
DATA 26,16,27,16
DATA 27,16,28,16
DATA 28,16,29,16
DATA 29,16,30,16
DATA 30,16,31,16
DATA 31,16,32,17
DATA 32,17,33,17
DATA 33,17,34,18
DATA 34,18,35,18
'DATA 35,18, 0,17
'+++++
'Nordamerika (38)
DATA 26, 8,27, 8
DATA 27, 8,28, 7
DATA 28, 7,29, 6
DATA 29, 6,30, 5
DATA 30, 5,31, 4
DATA 31, 4,32, 3
DATA 32, 3,33, 3
DATA 33, 3,34, 3
DATA 34, 3,34, 2
DATA 34, 2,33, 2
DATA 33, 2,32, 2
DATA 32, 2,31, 2
DATA 31, 2,30, 2
DATA 30, 2,29, 2
DATA 29, 2,28, 2
DATA 28, 2,27, 2
DATA 27, 2,26, 2
DATA 26, 2,27, 3
DATA 27, 3,26, 4
DATA 26, 4,26, 3
DATA 26, 3,25, 3
DATA 25, 3,24, 3
DATA 24, 3,24, 4
DATA 24, 4,25, 5
DATA 25, 5,26, 6
DATA 26, 6,27, 6
DATA 27, 6,28, 7
DATA 28, 7,27, 7
DATA 27, 7,26, 8
DATA 20, 1,21, 1
DATA 21, 1,22, 1
DATA 22, 1,23, 1
DATA 23, 1,24, 1
DATA 24, 1,23, 2
DATA 23, 2,23, 3
DATA 23, 3,22, 3
DATA 22, 3,21, 2
DATA 21, 2,20, 1
'+++++
'S�damerika (18)
DATA 26, 8,26, 9
DATA 26, 9,26,10
DATA 26,10,25,11
DATA 25,11,25,12
DATA 25,12,25,13
DATA 25,13,26,14
DATA 26,14,25,15
DATA 25,15,25,14
DATA 25,14,24,13
DATA 24,13,23,12
DATA 23,12,22,11
DATA 22,11,22,10
DATA 22,10,21,10
DATA 21,10,22, 9
DATA 22, 9,23, 9
DATA 23, 9,24, 8
DATA 24, 8,25, 8
DATA 25, 8,26, 8
'+++++

