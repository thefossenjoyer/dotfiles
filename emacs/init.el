;; setting up melpa ;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("cselpa" . "https://elpa.thecybershadow.net/packages/"))
(package-initialize)
;; end of melpa ;;

;; (setq lsp-completion-provider :none)
;; (defun corfu-lsp-setup ()
;;   (setq-local completion-styles '(orderless)
;;               completion-category-defaults nil))

(use-package lsp-mode
  :hook (c-mode . lsp))
;; (add-hook 'lsp-mode-hook #'corfu-lsp-setup)
(add-hook 'lsp-mode-hook 'company-mode)
;; ;; (use-package c-mode
;;   :after lsp-mode
;;   :mode ("\.c$")
;;   :hook (c-mode . lsp-deferred))

;; make emacs look kinda better ;;
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; fonts ;; 
;; (set-frame-font "Iosevka 14" nil t)
(set-frame-font "Cascadia Code 14" nil t)
;; end of fonts ;;

;; line numbers ;;
(require 'display-line-numbers)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; disable line numbers in dashboard

(defun no-lnum ()
  (display-line-numbers-mode 0))

(add-hook 'dashboard-mode-hook 'no-lnum)
(add-hook 'vterm-mode-hook 'no-lnum)

;; end of lnums ;;

;; modus-themes ;;
;; (setq modus-themes-mode-line '(borderless accented))
(setq modus-themes-mode-line '(borderless))

;; Region
(setq modus-themes-region '(bg-only no-extend))

;; Syntax higlighting
(setq modus-themes-italic-constructs t) ;; italics

(setq modus-themes-paren-match '(bold intense underline))

(setq modus-themes-syntax '(faint))
(load-theme 'modus-vivendi t)
;; (load-theme 'spaceway t)
;; (load-theme 'jbeans t)
;; (load-theme 'doom-badger t)
;; (load-theme 'doom-tomorrow-night t)
;; end of modus ;;

;; end ;;


;; DASHBOARD ;;

(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; tittle
(setq dashboard-banner-logo-title "You will use Emacs and you will love it!")

(setq dashboard-startup-banner 'logo)
;;(setq dashboard-startup-banner "/home/anon/.doom.d/doom-emacs.png")

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

;(setq dashboard-set-navigator t)

;; center widgets
(setq dashboard-center-content nil)

(setq dashboard-set-init-info t)
(setq dashboard-init-info "There is no system but GNU and Linux is one of its kernels.")

;; footnote message
(setq dashboard-footer-messages '("Just like Emacs is better than Vim, so is Linux better than Windows."))
(setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                   :height 1.1
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face))
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; END OF DASHBOARD ;;

;; let's get evil! MUHAHAHHA!
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'term-keys)
(term-keys-mode t)
;; (require 'evil)
;; (require 'evil-leader)
;; (global-evil-leader-mode)
;; (evil-mode 1)
;; ;; end of evil ;;

(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/spaceway")

;; autopair ;;
(require 'smartparens-config)
(require 'rainbow-delimiters)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (rainbow-delimiters-mode)
;; (smartparens-global-mode)
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)
(show-paren-mode)
;; end ;;

;; chords! ;;

;; setting a new prefix
(define-prefix-command 'ring-map)
(global-set-key (kbd "C-SPC") 'ring-map)

;; (global-set-key (kbd "C-c .") 'find-file)
(global-set-key (kbd "C-SPC .") 'counsel-find-file)
(global-set-key (kbd "C-SPC e b") 'eval-buffer)
(global-set-key (kbd "C-SPC b s") 'counsel-switch-buffer)
;; won't remap kill-buffer - C-x k

;; moving between windows
(global-set-key (kbd "C-SPC w v") 'split-window-horizontally)
(global-set-key (kbd "C-SPC w l") 'windmove-right)
(global-set-key (kbd "C-SPC w h") 'windmove-left)
(global-set-key (kbd "C-SPC w k") 'windmove-up)
(global-set-key (kbd "C-SPC w j") 'windmove-down)
(global-set-key (kbd "C-SPC w c") 'delete-window)

;; loading a theme
(global-set-key (kbd "C-SPC t s") 'counsel-load-theme)

;; selecting a region
(global-set-key (kbd "C-SPC SPC") 'set-mark-command)
;; DO NOT PRESS C-w! - cut

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; jumping to the start end the end of the buffer
(global-set-key (kbd "C-SPC f g") 'beginning-of-buffer)
(global-set-key (kbd "C-SPC f G") 'end-of-buffer)

;; Better M-x
(global-set-key (kbd "M-x") 'counsel-M-x)

;; end of chords! ;;

;; CORFU ;;
(setq corfu-cycle t)
(setq corfu-auto t)
(setq corfu-auto-prefix 2)
(setq corfu-auto-delay 0.0)
(setq corfu-quit-at-boundary 'seperator)
(setq corfu-echo-documentation 0.25)
(setq corfu-preview-current 'insert)
(setq corfu-preselect-first nil)

(global-corfu-mode)
;; END ;;

;; Adding custom.el so it doesn't overflow my init.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;; end ;;


;; (use-package time
;;   :defer 10
;;   :config
;;   (defface my/display-time
;;     '((((type x w32 mac))
;;        ;; #060525 is the background colour of my default face.
;;        (:foreground "#060525" :inherit bold))
;;       (((type tty))
;;        (:foreground "blue")))
;;     "Face used to display the time in the mode line.")
;;   (setq display-time-string-forms
;;         '((propertize (concat " " 12-hours ":" minutes " " am-pm " ")
;;                       'face 'my/display-time)))
;;   (set-face-attribute 'my/display-time nil :foreground "#fff" :background "#333"
;;                       :box '(:line-width 1 :color "#323"))
;;   (display-time-mode t))

;; MODELINE ;;

;; TIME IN MODELINE ;;
;; (setq display-time-format "%a, %b, %H:%M  ")
(setq display-time-string-forms '((propertize (format " %s, %s%s %s:%s   " dayname monthname day 24-hours minutes)
					      'face '(:background "#323232"))))

;; (setq display-time-string-forms (concat " " 24-hours ":" minutes " ") 'face '(:background "#060525"))
 ;; (setq display-time-string-forms
 ;;       '((propertize (concat " " 24-hours ":" minutes " ")
 ;; 		    'face '(:foreground "#79a8ff" :background "#333" :weight bold))))

(setq display-time-default-load-average nil)

(setq display-time-24hr-format t)
;; END OF TIME ;;

(setq global-mode-string '((t jabber-activity-mode-string)
			  "" display-time-string appt-mode-string))

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

	   '(:eval
                 (propertize " " 'display
	                     `((space :align-to
			              (- (+ right right-fringe right-margin)
			                 ,(string-width (format-mode-line mode-line-misc-info)))))))

	   mode-line-misc-info

	   
	   ))
(display-time-mode)

;; (add-to-list 'mode-line-misc-info '(" " (display-time)))

;; (setq-default mode-line-misc-info '("test"))

(set-face-background 'mode-line "#000000") ;; bg
(set-face-attribute 'mode-line nil
                    :box '(:color "#000000")) ;; set the modeline's border colour to the bg colour

;; (set-face-background 'mode-line "#171717")
;; (set-face-attribute 'mode-line nil
;; 		    :box '(:color "#171717"))

;; DOOM-MODELINE ;;
;; (require 'doom-modeline)
;; (setq doom-modeline-icon t)
;; (setq doom-modeline-buffer-name t)
;; ;; (setq doom-modeline-time t)
;; (setq all-the-icons-scale-factor 1.1)
;; (setq doom-modeline-lsp t)
;; (setq doom-modeline-buffer-encoding nil)
;; (setq doom-modeline-major-mode-icon nil)
;; ;; (setq doom-modeline-buffer)
;; (setq doom-modeline-hud nil)
;; (doom-modeline-mode 1)
;; ;; END OF DOOM-MODELINE ;;

(set-face-attribute 'mode-line nil  :height 120)
;; (set-face-attribute 'mode-line nil :font "Iosevka-15")
(set-face-attribute 'mode-line nil :font "Cascadia Code-15")
;; END OF MODELINE ;;

;; CURSOR COLOR ;;
(set-cursor-color "#BF93C3")
;; END ;;

;; revert files ;;
(global-auto-revert-mode)
;; END ;;

;; which-key-mode ;;
(which-key-mode)
;; END ;;

;; LSP ;;
;; (add-hook 'c-mode 'lsp)
;; (add-hook 'emacs-lisp-mode-hook #'lsp)
;; END OF LSP ;;

;; POPPER ;;
(require 'popper)
(require 'term-toggle)

;; (setq popper-reference-buffers
;;       (append popper-reference-buffers
;; 	      '("^\\*vterm.*\\*$"  vterm-mode)))

;; (global-set-key (kbd "C-SPC p t") 'popper-toggle-latest)
;; (global-set-key (kbd "C-SPC p c") 'popper-cycle)
;; ;; (global-set-key (kbd "C-SPC p t t") 'popper-toggle-type)

;; (popper-mode +1)

(global-set-key (kbd "C-SPC p t") 'term-toggle-ansi)

;; END OF POPPER ;;

;; GUILE ;;
(setq geiser-active-implementations '(guile))
;; END OF GUILE ;;

;; CENTAUR TABS ;;
;; (require 'centaur-tabs)
;; (global-set-key (kbd "C-<left>")  'centaur-tabs-backward)
;; (global-set-key (kbd "C-<right>") 'centaur-tabs-forward)

;; (centaur-tabs-headline-match)

;; (setq centaur-tabs-style "alternate")
;; ;; (centaur-tabs-mode t)
;; END OF TABS ;;
