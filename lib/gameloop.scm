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
;; Project: Main Gameloop file for arken
;;

(define MS_PER_UPDATE 0.0167)

(define (main previous lag)
  (let ((current (time->seconds (current-time))))
    (let loop ((current current) (lag (+ lag (- current previous))))
      (if (>= lag MS_PER_UPDATE)
          (and (update)
               (loop current (- lag MS_PER_UPDATE)))
          (and (render (/ lag MS_PER_UPDATE))
               (main current lag))))))

(define (start-update-engine)
  (thread (lambda () (main (time->seconds (current-time)) 0.0))))

(define (listen-for-input)
  (process)
  (listen-for-input))

(start-update-engine)
;;(listen-for-input)
