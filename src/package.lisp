(defpackage #:advent-of-code
  (:use cl)
  (:nicknames #:aoc)
  (:export #:read-all-line-data
           #:process-line-as-list

           #:new-point
           #:point-x
           #:point-y

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
