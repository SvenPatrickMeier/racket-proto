#lang racket/gui

;; Main Window

(define app
  (new frame%
       (label "Proto Gui")
       (spacing 20)
       (min-width 800)
       (min-height 600)
       (stretchable-width #f)
       (stretchable-height #f)
       (style '(no-system-menu))))

(define own-menu-bar
  (new menu-bar%
       (parent app)))

(define file-menu
  (new menu%
       (parent own-menu-bar)
       (label "File")))

(define exit-app
  (new menu-item%
       (parent file-menu)
       (label "Exit Application")
       (shortcut-prefix (get-default-shortcut-prefix))
       (shortcut #\q)
       (callback (λ (item event)
                   (display "On exit")
                   (send app show #f)))))

(send app show #t)