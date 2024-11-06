(in-package #:advent-of-code)

(defstruct point
  x
  y)

(defun create-point (x y)
  (make-point :x x :y y))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (set-dispatch-macro-character #\# #\@ 
                                #'(lambda (stream char n)
                                    (declare (ignore char n))
                                    (let ((point (read stream t nil t)))
                                      (unless (and (listp point) (= 2 (length point)))
                                        (error "A point consists of a list of two items"))
                                      `(make-point :x ,(first point) :y ,(second point))))))

(defmethod print-object ((pt point) stream)
  (format stream "#@(~a ~a)" (point-x pt) (point-y pt)))

(defun add-points (p1 p2)
  "Adds the two points p1 and p2 together and returns the result as a new point"
  (make-point :x (+ (point-x p1) (point-x p2))
              :y (+ (point-y p1) (point-y p2))))

(defun surrounding-points (pt &key (diagonals nil) min-point max-point)
  (flet ((valid (pt)
           (and (or (null min-point)
                    (and (>= (point-x pt) (point-x min-point))
                         (>= (point-y pt) (point-y min-point))))
                (or (null max-point)
                    (and (<= (point-x pt) (point-x max-point))
                         (<= (point-y pt) (point-y max-point)))))))
    (let ((points (append (list #@(1 0) #@(-1 0) #@(0 1) #@(0 -1))
                          (and diagonals (list #@(-1 -1) #@(1 -1) #@(-1 1) #@(1 1))))))
      (remove-if-not #'valid (mapcar #'(lambda (delta) (add-points pt delta)) points)))))

