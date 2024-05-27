(in-package #:advent-of-code)

(defstruct point
  x
  y)

(defun new-point (x y)
  "Create a new point with an x and y co-ordinate."
  (make-point :x x :y y))

