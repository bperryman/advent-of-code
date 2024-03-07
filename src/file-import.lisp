;;;; Code to import files and process them into a format for later

(in-package #:advent-of-code)

(defun read-all-line-data (file &optional (processor #'identity))
  (with-open-file (f file)
    (loop for l = (read-line f nil nil)
          until (null l)
          collect (funcall processor l))))

(defun process-line-as-list (line)
  "Processes the line as if it was a list"
  (read-from-string (format nil "(~a)" line)))
