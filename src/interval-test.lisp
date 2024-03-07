(defpackage interval-test
  (:use :cl
        :interval
        :fiveam))

(in-package :interval-test)

(def-suite interval-tests
    :description "Testing the intervals")

(in-suite interval-tests)

(defparameter *interval-1* (make-instance 'interval :start 10 :end 20))
(defparameter *interval-2* (make-instance 'interval :start 15 :end 25))
(defparameter *interval-3* (make-instance 'interval :start 12 :end 18))
(defparameter *interval-4* (make-instance 'interval :start 25 :end 30))

(test verify-intervals-contain-single-values
      (is-true (contains-p *interval-1* 10))
      (is-true (contains-p *interval-1* 20))
      (is-false (contains-p *interval-1* 9))
      (is-false (contains-p *interval-1* 21)))

(test verify-intervals-contain-interval-values
      (is-true (contains-p *interval-1* *interval-1*))
      (is-true (contains-p *interval-1* *interval-3*))
      (is-false (contains-p *interval-1* *interval-2*))
      (is-false (contains-p *interval-1* *interval-4*)))

(test verify-overlapping-intervals-detected
      (is-true (overlaps-p *interval-1* *interval-1*))
      (is-true (overlaps-p *interval-1* *interval-2*))
      (is-true (overlaps-p *interval-1* *interval-3*))
      (is-false (overlaps-p *interval-1* *interval-4*)))

(defun matches-start-end (ival start end)
  (and (= (interval-start ival) start)
       (= (interval-end ival) end)))

(test verify-joins
      (is-true (matches-start-end (join *interval-1* *interval-1*)
                                  10 20))
      (is-true (matches-start-end (join *interval-1* *interval-2*)
                                  10 25))
      (is-true (matches-start-end (join *interval-1* *interval-3*)
                                  10 20))
      (is-true (matches-start-end (join *interval-1* *interval-4*)
                                  10 20)))
