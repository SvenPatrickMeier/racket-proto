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
                   (display "Exiting Application")
                   (send app show #f)))))

(define main-view
  (new vertical-panel%
    (parent app)
    (vert-margin 150)
    (horiz-margin 300)))

(define welcome-message
  (new message%
    (parent main-view)
    (label "Sign up or Sign in")))

(define login-form
  (new vertical-pane%
    (parent main-view)))

(define user-name-field
  (new text-field%
    (label "Username")
    (parent login-form)
    (style '(single vertical-label))))

(define user-password-field
  (new text-field%
    (label "Password")
    (parent login-form)
    (style '(single password vertical-label))))

(define keep-logged-in-checkbox
  (new check-box%
    (parent login-form)
    (label "Keep me logged in.")))

(define login-btn
  (new button%
    (label "Login")
    (parent login-form)
    (callback (λ (item event)
                (display "Validating login data.")))))

(send app show #t)