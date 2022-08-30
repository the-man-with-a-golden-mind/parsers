(define-library (parsers parsers)
  (import (otus lisp))
  (import (owl parse))
  (import (file json))

  (export 
   get-string
   get-json
   get-line
   get-lines
   parse-lines
   parse-json
   parse-string)

  (begin
    (define get-string
      (let-parse* ((bytes (greedy+ byte)))
                  (bytes->string bytes)))

    (define get-json
      (let-parse* ((bytes (greedy+ byte)))
                  (read-json-stream bytes)))
    
    (define (parse-json text)
      (car (try-parse get-json (port->bytestream text) #false)))
  
    (define (parse-string text)
      (car (try-parse get-string (port->bytestream text) #false)))

    (define get-line
      (let-parse* (
            (bytes (greedy+ (byte-if (lambda (x) (not (eq? x #\newline))))))
            (endl (imm #\newline)))
         (bytes->string bytes)))
   
    (define get-lines
      (let-parse* ((lines (get-greedy* get-line)))
         lines))

    (define (parse-lines text)
      (car (try-parse get-lines (port->bytestream text) #false)))
  ))
