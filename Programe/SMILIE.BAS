SCREEN 9, , 0, 1
ss = 10
xs = 320: ys = 320
xb = 100: yb = 100: ab = 0: bb = 0


DO
 CIRCLE (xb, yb), 12, 4
 PAINT STEP(0, 0), 12, 4
 CIRCLE (xs, ys), 30, 6
 PAINT STEP(0, 0), 14, 6
 PCOPY 0, 1
 CLS
 SELECT CASE INKEY$
 CASE CHR$(0) + "K": xs = xs - ss
 CASE CHR$(0) + "M": xs = xs + ss
 CASE CHR$(27): END
 END SELECT
 IF xs > 609 THEN xs = 609
 IF xs < 30 THEN xs = 30
 bb = bb + 1: yb = yb + bb: xb = xb + ab
 IF yb > 332 THEN yb = yb - bb: bb = -bb
 IF xb > 628 THEN xb = 628: ab = -ab
 IF xb < 12 THEN xb = 12: ab = -ab
 IF SQR((xs - xb) ^ 2 + (ys - yb) ^ 2) < 42 THEN
  xb = xb - ab: yb = yb - bb
  bbb = ABS(bb)
  ab = xb - xs
  bb = yb - ys
  l = SQR(ab * ab + bb * bb)
  ab = ab * bbb / l
  bb = bb * bbb / l
  PLAY "l64c"
 END IF
LOOP

