(in-package :advent-of-code)

(defun make-dataset-from-data (rows columns initial-contents &key (element-type t))
  (make-array (list rows columns)
              :element-type element-type
              :initial-contents initial-contents))

(defun data-at (dataset point)
  "Return the data from the dataset at the supplied point."
  (aref dataset (point-y point) (point-x point)))

(defun set-data-at (dataset point new-value)
  "Update the dataset at supplied point to be new-value."
  (setf (aref dataset (point-y point) (point-x point)) new-value))

(defsetf data-at set-data-at)

