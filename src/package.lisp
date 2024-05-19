(defpackage #:advent-of-code
  (:use cl)
  (:nicknames #:aoc)
  (:export #:read-all-line-data
           #:process-line-as-list

           #:make-point
           #:point-x
           #:point-y

           #:interval
           #:interval-start
           #:interval-end
           #:contains-p
           #:overlaps-p
           #:join
           ;; Probably should have a create interval...

           #:interval-map
           #:interval-map-to
           #:interval-map-unmapped
           #:map-interval
           #:create-interval-map))
