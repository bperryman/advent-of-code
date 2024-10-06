(in-package #:advent-of-code)

(defstruct point
  x
  y)

(defmethod print-object ((pt point) stream)
  (format stream "@(~a ~a)" (point-x pt) (point-y pt)))

(defun add-points (p1 p2)
  "Adds the two points p1 and p2 together and returns the result as a new point"
  (make-point :x (+ (point-x p1) (point-x p2))
              :y (+ (point-y p1) (point-y p2))))

(set-macro-character #\@ 
  #'(lambda (stream char)
      (declare (ignore char))
      (let ((point (read stream t nil t)))
        (unless (and (listp point) (= 2 (length point)))
          (error "A point consists of a list of two items"))
        `(make-point :x ,(first point) :y ,(second point)))))
