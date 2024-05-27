(in-package #:advent-of-code)

(defclass interval ()
  ((start :initarg :start :reader interval-start)
   (end :initarg :end :reader interval-end)))

(defun new-interval (start end)
  "Create a new interval."
  (make-instance 'interval :start start :end end))

(defmethod contains-p ((i1 interval) num)
  (<= (interval-start i1)
      num
      (interval-end i1)))

(defmethod contains-p ((i1 interval) (i2 interval))
  (and (<= (interval-start i1)
           (interval-start i2))
       (>= (interval-end i1)
           (interval-end i2))))

(defmethod overlaps-p ((i1 interval) (i2 interval))
  (or (contains-p i1 i2)
      (contains-p i2 i1)
      (<= (interval-start i1)
          (interval-start i2)
          (interval-end i1)
          (interval-end i2))
      (<= (interval-start i2)
          (interval-start i1)
          (interval-end i2)
          (interval-end i1))))

(defmethod join ((i1 interval) (i2 interval))
  "If there is an overlap between i1 and i2 then join the two intervals, otherwise return just i1"
  (if (overlaps-p i1 i2)
      (make-instance 'interval
                     :start (min (interval-start i1) (interval-start i2))
                     :end (max (interval-end i1) (interval-end i2)))
      i1))
