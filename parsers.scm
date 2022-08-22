(define-library (parsers parsers)
  (import (otus lisp))
  (import (owl parse))
  (import (file json))

  (export 
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
      (try-parse get-json (port->bytestream text) #false))
  
    (define (parse-string text)
      (try-parse get-string (port->bytestream text) #false))

    ))
