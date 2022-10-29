;;; modeline.el . -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 thefossenjoyer
;;
;; Author: thefossenjoyer <thefossenjoyer@devpc>
;; Maintainer: thefossenjoyer <thefossenjoyer@devpc>
;; Created: October 16, 2022
;; Modified: October 16, 2022
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/thefossenjoyer/modeline
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;; test
;;
;;
;;
;;; Code:

;; (display-time-mode)
;; (setq display-time-format "%H:%M")

;; (defun modeline-display-time ()
;;   "Displays time in the modeline."
;;   ;; (shell-command "date")
;;   (shell-command "date | awk '{print $4 " "$5}' "))

(setq-default mode-line-format
          (list
           ;; name of major mode
           ;; " %m: "
           ;; buffer name
           ;; " buffer -> %b "
           ;; " %b "

           ;; buffer status
           ;; " buffer status -> "
           '((:eval
              (cond
               ((buffer-modified-p) (propertize " ◉" 'face '(:foreground "#e0e6f0")))
               ((not (buffer-modified-p)) (propertize " ○" 'face '(:foreground "#e0e6f0")))
               ((buffer-read-only)) (propertize " LOCKED" 'face '(:foreground "white"))
               )
              ))

           '(:eval
             (list
              (propertize " %b" 'face '(:foreground "light grey" :weight bold) ':help-echo (buffer-file-name))))
           ;; mode-line-buffer-identification

           ;; line number
           ;; " line -> %l "
           " l: %l "

           ;; '(:eval
           ;;   (list
           ;;    (propertize (concat " %e" (modeline-display-time)) 'face '(:foreground "white"))
           ;;    ))

           ;; '(:eval
           ;;   (list
           ;;    (propertize (concat " %e" (shell-command "date") 'face '(:foreground "light grey"))
           ;;     )))

           ;; " Time: " (modeline-display-time)
           ;; " Time: " (shell-command-to-string "~/test-date")

           ;; " active developer -> "
           ;; user login name/ID
           ;; (getenv "USER")

           ;; `(mode-line-misc-info)

           ))

;; (setq-default mode-line-misc-info '("test"))

(set-face-background 'mode-line "#000000") ;; bg
(set-face-attribute 'mode-line nil
                    :box '(:color "#000000")) ;; set the modeline's border colour to the bg colour

(set-face-attribute 'mode-line nil  :height 120)
(set-face-attribute 'mode-line nil :font "Sudo-15")

(force-mode-line-update t)

(provide 'modeline)
;;; modeline.el ends here
