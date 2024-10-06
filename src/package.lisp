(defpackage #:advent-of-code
  (:use cl)
  (:nicknames #:aoc)
  (:export #:read-data-file
           #:process-line-as-list
           #:process-dataset-to-matrix

           #:make-dataset-from-data 
           #:data-at 

           #:create-point
           #:point-x
           #:point-y
           #:add-points

           ;; Will also want to include some routines for data grids

           #:interval
           #:interval-start
           #:interval-end
           #:contains-p
           #:overlaps-p
           #:join
           #:new-interval

           #:interval-map
           #:interval-map-to
           #:interval-map-unmapped
           #:map-interval
           #:new-interval-map))
