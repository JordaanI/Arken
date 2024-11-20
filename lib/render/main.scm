;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                                        ;;;
;;;     __  .______     ______   .__   __.    .______    __    _______.                    ;;;
;;;    |  | |   _  \   /  __  \  |  \ |  |    |   _  \  |  |  /  _____|        _____       ;;;
;;;    |  | |  |_)  | |  |  |  | |   \|  |    |  |_)  | |  | |  |  __      ^..^     \9     ;;;
;;;    |  | |      /  |  |  |  | |  . `  |    |   ___/  |  | |  | |_ |     (oo)_____/      ;;;
;;;    |  | |  |\  \  |  `--'  | |  |\   |    |  |      |  | |  |__| |        WW  WW       ;;;
;;;    |__| | _| `._|  \______/  |__| \__|    | _|      |__|  \______|                     ;;;
;;;                                                                                        ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;; Author: Ivan Jordaan
;; Date: 2024-11-19
;; email: ivan@axoinvent.com
;; Project: Main render file for arken
;;

(define (escape . k)
  (list->string
   `(#\esc #\[ ,@k)))

(define raster-home (escape #\; #\H))
(define clear (escape #\J))
(define page-scroll (escape #\3 #\1 #\T))
(define hide-cursor (escape #\? #\2 #\5 #\l))

(display hide-cursor)
(display clear)

(define (render offset)
  (display raster-home)
  (display page-scroll)
  (display (list->string (apply append (map append (map vector->list (build-raster))))))
  (force-output))

(define (build-raster)
  (vector->list (cdr (assoc 'raster (component-data (cdr (state-ref state 'render executable?: #f)))))))
