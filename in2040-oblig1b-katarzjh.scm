; Oppgave 1
; f)
(car (cdr foo))

; g)
(car (cdr (car foo))

; h)
(car (car (cdr foo)))    

; i)
(cons (cons 0 42)(cons (cons #t bar) '()))
(list(list 0 42)(list #t bar))


; Oppgave 2
; a)
(define (take n items)
  (if (or (null? items) (zero? n)) '()
  (cons (car items) (take (- n 1) (cdr items)))))

(take 3 '(a b c d e f))
(take 1 '(a b c d e f))
(take 4 '(a b))
(take 4 '())


; b)
(define (take-tail n items)
  (define (iter n items acc)
    (if (or (null? items) (zero? n))
        (reverse acc)
        (iter (- n 1) (cdr items) (cons (car items) acc))))
  (iter n items '()))

(take-tail 3 '(a b c d e f))
(take-tail 1 '(a b c d e f))
(take-tail 4 '(a b))
(take-tail 4 '())


; c)
(define (take-while pred items)
  (if (pred (car items))
      (cons (car items) (take-while pred (cdr items)))
      '()))

(take-while even? '(2 34 42 75 88 103 250))
(take-while odd? '(2 34 42 75 88 103 250))
(take-while (lambda (x) (< x 100)) '(2 34 42 75 88 103 250))


; d)
(define (map2 proc items1 items2)
  (if (or (null? items1) (null? items2))
      '()
  (cons (proc (car items1) (car items2))
        (map2 proc (cdr items1) (cdr items2)))))

(map2 + '(1 2 3 4) '(3 4 5))


; e)
(map2 (lambda (x y) (/ (+ x y) 2)) '(1 2 3 4) '(3 4 5))