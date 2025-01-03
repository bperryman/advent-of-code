;;;; departures.asd

(asdf:defsystem #:advent-of-code
  :description "Advent of code 2023 solutions(?)"
  :author "Barry Perryman"
  :license  "BSD 2-Clause"
  :version "0.0.1"
  :serial t
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "point" :depends-on ("package"))
                 (:file "dataset" :depends-on ("package" "point"))
                 (:file "interval" :depends-on ("package"))
                 (:file "interval-map" :depends-on ("package" "interval"))
                 (:file "file-import" :depends-on ("package")))))
  :in-order-to ((test-op (test-op :advent-of-code/test))))

(asdf:defsystem #:advent-of-code/test
  :description "Advent of code tests"
  :author "Barry Perryman"
  :license  "BSD 2-Clause"
  :version "0.0.1"
  :serial t
  :depends-on (:advent-of-code :fiveam)
  :components ((:module "src"
                :components
                ((:file "interval-test"))))
  :perform (test-op (op c)
                    (symbol-call :fiveam :run!
                                 (find-symbol* :interval-tests :interval-test))))
