; Oppgave 1

; a) (* (+ 4 2) 5)
;    Prosedyren + anvendes på 4 og 2, som evalueres til 6.
;    Så anvendes prosedyren * på 6 og 5, som evaluerer til 30.

; b) (* (+ 4 2) (5))
;    Får en feilmelding. (5) 

; c) (* (4 + 2) 5)
;    Feil syntax. (4 + 2) er infiks-notasjon, mens Scheme bruker prefiks-notasjonen (+ 4 2).

; d) (define bar (/ 44 2))
;     bar
;     bar blir bundet til verdien av 44 delt på 2, altså 22.

; e) (- bar 11)
;    bar har verdien 22. 22 - 11 evaluerer til 11.

; f) (/ (* bar 3 4 1) bar)
;    Prosedyren * anvendes på 22, 3, 4 og 1, som evalueres til 264.
;    Så anvendes prosedyren / på 264 og 22 (bar), som evaluerer til 12.


; Oppgave 2

; a) or-uttrykket evalueres til "paff". Siden 'or' er en special form, evalueres
;    argumentene en av gangen. Så returneres den første #t (alt utenom #f
;    evalueres som #t). Resten av uttrykket blir aldri evaluert, ellers hadde vi
;    fått en feil på den siste linjen.

;    and-uttrykket evalueres til #f, siden 1 er ikke lik 2. Likt a), evalueres ikke
;    resten av uttryket.

;    if-uttrykket evalueres til "poff". Hvis (positive? 42) hadde evaluert til #f
;    og fortsatt til neste del av uttrykket, hadde vi fått en feil for en udefinert
;    prosedyre (i-am-undefined).

; b)
(define (sign-if x)
    (if (negative? x)
        -1
        1))

(define (sign-cond x)
  (cond ((negative? x) -1)
        ((positive? x) 1)))

; c)
(define (sign x)
  (or (and (negative? x) -1)
      (and (positive? x) 1)))


; Oppgave 3
; a)
(define (add1 x)
  (+ x 1))

(define (sub1 x)
  (- x 1))

; b)
(define (plus x y)
  (if (zero? y)
      x
      (plus (add1 x) (sub1 y))))

; c) Prosedyren over gir en iterativ prosess.

; Rekursiv prosess:
(define (plus x y)
  (if (zero? y)
      x
      (add1 (plus (sub1 y) x))))


; d)
(define (power-close-to b n)
  (define (power-iter e)
    (if (> (expt b e) n)
        e
        (power-iter (+ 1 e))))
  (power-iter 1))

; e) Nei. 
    
