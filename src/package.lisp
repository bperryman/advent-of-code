(defpackage #:advent-of-code
  (:use cl)
  (:nicknames #:aoc)
  (:export #:read-all-line-data
           #:process-line-as-list

           #:interval
           #:interval-start
           #:interval-end
           #:contains-p
           #:overlaps-p
           #:join))
