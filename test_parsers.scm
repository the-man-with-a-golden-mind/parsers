(define *path* (cons "../" *path*))
(import (parsers parsers))
(import (otus lisp))

; get-string
; get-json
(define test-parse-lines
  (define test-file (open-binary-input-file "./testing_files/test_file.txt"))
  (display "Test Parsing Lines...")
  (let ((content (parse-lines test-file)))
   (assert (length content) ===> 8)
   (display "ok\n")))

(define test-parse-string
  (define test-file (open-binary-input-file "./testing_files/test_file.txt"))
  (display "Test Parsing String...")
  (let ((content (parse-string test-file)))
    (assert (string-length content) ===> 69)
    (display "ok\n")))

(define test-parse-json
  (define test-file (open-binary-input-file "./testing_files/test_json.json"))
  (display "Test Parsing JSON...")
  (let* ((content (parse-json test-file)))
    (assert (get content 'test_field "") ===> 123)
    (display "ok\n")))


(define tests
  (list
   test-parse-lines
   test-parse-string
   test-parse-json))

(map (lambda (test) test) tests)
