DIM x(8192), y(8192), xx(4096), yy(4096)
x(0) = 0: y(0) = 50: x(1) = 640: y(1) = 50
anz = 1

SCREEN 9
WINDOW (0, 0)-(640, 350)
LINE (x(0), y(0))-(x(1), y(1))

DO
 FOR i = 0 TO anz
  xx(i) = x(i): yy(i) = y(i)
 NEXT i
 PSET (x(0), y(0))
 FOR i = 1 TO anz
  x(4 * i - 3) = xx(i - 1) + (xx(i) - xx(i - 1)) / 3
  y(4 * i - 3) = yy(i - 1) + (yy(i) - yy(i - 1)) / 3
  LINE -(x(4 * i - 3), y(4 * i - 3))
  x(4 * i - 2) = x(4 * i - 3) + (x(4 * i - 3) - xx(i - 1)) / 2 + (y(4 * i - 3) - yy(i - 1)) * 2
  y(4 * i - 2) = y(4 * i - 3) + (y(4 * i - 3) - yy(i - 1)) / 2 + (x(4 * i - 3) - xx(i - 1)) * 2
  LINE -(x(4 * i - 2), y(4 * i - 2))
  x(4 * i - 1) = xx(i - 1) + 2 * (xx(i) - xx(i - 1)) / 3
  y(4 * i - 1) = yy(i - 1) + 2 * (yy(i) - yy(i - 1)) / 3
  LINE -(x(4 * i - 1), y(4 * i - 1))
  LINE (x(4 * i - 3), y(4 * i - 3))-(x(4 * i - 1), y(4 * i - 1)), 0
  x(4 * i) = xx(i)
  y(4 * i) = yy(i)
  LINE -(x(4 * i), y(4 * i))
 NEXT i
 anz = 4 * anz
LOOP

