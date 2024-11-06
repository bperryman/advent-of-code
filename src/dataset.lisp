(in-package :advent-of-code)

(defun make-dataset (rows columns &key (element-type t) (initial-element nil))
  "Create an initially unpopulated dataset of the specified dimensions."
  (make-array (list rows columns)
              :element-type element-type
              :initial-element initial-element))

(defun make-dataset-from-data (rows columns initial-contents &key (element-type t))
  "Create a dataset with the initial data coming from the initial-contents."
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

(defun positions-for (dataset value &key (test #'eql) (key #'identity))
  "Returns a collection of all the positions within the dataset that
match the value."
  (let* ((dims (array-dimensions dataset))
         (rows (first dims))
         (cols (second dims)))
    (loop for rowindex from 0 below rows
          nconcing (loop for colindex from 0 below cols
                         for pt = (create-point colindex rowindex)
                         when (funcall test value (funcall key (data-at dataset pt)))
                              collect pt))))

(defun dataset-size (dataset)
  "Returns the dimensions of the dataset."
  (let ((dims (array-dimensions dataset)))
    (values (create-point (second dims) (first dims)))))

(defun do-all-points (fn dataset)
  "Iterate over the dataset calling fn with a valid location point within
the dataset."
  (let ((ends (dataset-size dataset)))
    (loop for y from 0 below (point-y ends)
          do (loop for x from 0 below (point-x ends)
                   do (funcall fn (create-point x y))))))

(defun do-all-data (fn dataset)
  "Iterate over the dataset and call fn with each of the values in turn."
  (do-all-points #'(lambda (pt) (funcall fn (data-at dataset pt)))
                 dataset))
