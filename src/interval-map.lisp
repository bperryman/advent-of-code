(in-package #:advent-of-code)

(defclass interval-map (interval)
  ((map-to :initarg :mapto :reader interval-map-to)
   (unmapped :initarg :unmapped :accessor interval-map-unmapped))
  (:default-initargs :unmapped #'identity))

(defgeneric map-interval (interval-map value)
  (:documentation "Uses the interval-map to map the supplied value to a new value"))

(defmethod map-interval ((mapping interval-map) val)
  (if (contains-p mapping val)
      (+ (interval-map-to mapping) (- val (interval-start mapping)))
      (funcall (interval-map-unmapped mapping) val)))


(defun create-interval-map (src dst &key (length nil) (src-end nil) (unmapped nil))
  (assert (and (or (numberp length) (numberp src-end))
               (not (and (null length) (null src-end))))
          (length src-end)
          "A map requires either a source end or a length")
  (let ((imap (if (null length)
                  (make-instance 'interval-map
                                 :start src
                                 :end src-end
                                 :mapto dst)
                  (make-instance 'interval-map
                                 :start src
                                 :end (1- (+ src length))
                                 :mapto dst))))
    (unless (null unmapped)
      (setf (interval-map-unmapped imap) unmapped))))
