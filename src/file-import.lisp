;;;; Code to import files and process them into a format for later

(in-package #:advent-of-code)

(defun read-data-file (file &key
                            (line-processor #'identity)
                            (dataset-processor #'identity))
  "Reads a problem data file, allowing manipulation of the data on a
line by line basis and a final whole dataset before the data is returned"
  (with-open-file (f file)
    (loop for l = (read-line f nil nil)
          until (null l)
          collect (funcall line-processor l) into dataset
          finally (return (funcall dataset-processor dataset)))))


(defun process-line-as-list (line)
  "Processes the line as if it was a list"
  (read-from-string (format nil "(~a)" line)))

(defun process-dataset-to-matrix (dataset &key (element-type t))
  (let ((rows (length dataset))
        (columns (length (first dataset))))
    (make-array (list rows columns)
                :element-type element-type
                :initial-contents dataset)))
