;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face

;; Fonts ;;

;; (setq doom-font (font-spec :family "Iosevka" :size 15)
;;       doom-variable-pitch-font (font-spec :family "Iosevka" :size 16))

;; (setq doom-font (font-spec :family "Anka/Coder" :size 15)
;;       doom-variable-pitch-font (font-spec :family "Iosevka" :size 16))

;; (setq doom-font (font-spec :family "CozetteVector Nerd Font" :size 15))
;; (setq doom-font (font-spec :family "ProggyCleanTTSZBP" :size 15))

;; (setq doom-font (font-spec :family "spleen32x64" :size 20)
;;       doom-variable-pitch-font (font-spec :family "Monoid" :size 14))

(setq doom-font (font-spec :family "JetBrains Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 14))

(after! doom-themes
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; (setq doom-font (font-spec :family "Monoid" :size 15)
;;        doom-variable-pitch-font (font-spec :family "Monoid" :size 14))
;; END OF FONTS ;;


;; Modus theme ;;

;; Modeline ;;
(setq modus-themes-mode-line '(borderless accented))

;; Region
(setq modus-themes-region '(bg-only no-extend))

;; Syntax higlighting
(setq modus-themes-italic-constructs t) ;; italics

(setq modus-themes-paren-match '(bold intense underline))

(setq modus-themes-syntax '(faint))

(load-theme 'modus-vivendi t)
;; END OF MODUS ;;

;; theme
;;(setq doom-theme 'doom-horizon)
;;(setq doom-theme 'doom-spacegrey)
;;(setq doom-theme 'doom-palenight)
;;(setq doom-theme 'palenight)

(setq doom-lighttable-brighter-comments t)
(setq doom-lighttable-brighter-modeline t)

;; (setq doom-theme 'doom-homage-black)
;; (setq doom-theme 'doom-tomorrow-night)

(add-to-list 'custom-theme-load-path "/home/anon/.emacs.d/themes")
(add-to-list 'load-path (concat user-emacs-directory "lisp/" ))
(add-to-list 'load-path "/home/anon/.emacs.d/.local/elpa")
(load "modus-themes-exporter")
(load "humanoid-dark-theme")


;; dashboard
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

(setq doom-fallback-buffer-name "*dashboard*")

;; Beacon
(beacon-mode 1)

;; [] issue
;; (global-set-key "\M-8" (lambda () (interactive) (insert "[")))
;; (global-set-key "\M-9" (lambda () (interactive) (insert "]")))

;; Treemacs ;;
(map! :leader
      :desc "Launch Treemacs"
      "?" #'treemacs
      )
;; END OF TREEMACS ::

;; CL && Roswell ;;
(setq inferior-lisp-program "ros -Q run")
;; END OF CL ;;

;; elcord, cuz why not ;;
(setq elcord-editor-icon "emacs_icon")
(setq elcord-use-major-mode-as-main-icon t)
;; END OF ELCORD ::

(setq use-dialog-box nil)

;; (require 'spaceline-config)
;; (setq spaceline-separator-dir-left '(left . left))
;; (setq spaceline-separator-dir-right '(right . right))
;; (spaceline-spacemacs-theme)

;; (add-to-list 'load-path "~/.emacs.d/emacs-powerline")
;; (require 'powerline)

;; (require 'simple-modeline)
;; (simple-modeline-mode)

;; (sml/setup)

;; Modeline ;;
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-height 1)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-time-icon t)
(setq doom-modeline-buffer-name t)
(setq doom-modeline-lsp t)
;; (setq doom-modeline-env-version t)
(setq doom-modeline-buffer-file-name-style 'truncate-all)
;; END OF MODELINE ::

;; (setq mode-line-format nil)


(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook #'company-mode)


;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(savehist-mode -1)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; EXWM ;;

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)
;; (require 'exwm-randr)

;; (setq exwm-randr-workspace-monitor-plist '(0 "HDMI-0"))
;; (add-hook 'exwm-randr-screen-change-hook
;;           (lambda ()
;;             (start-process-shell-command
;;              "xrandr" nil "xrandr --output HDMI-0 --mode 1440x900 --pos 0x0 --rotate-normal")))

;; (exwm-randr-enable)

;; (require 'exwm-systemtray)
;; (exwm-systemtray-enable)

;; END ;;


;; LSP ;;

;; gopls ;;
;; (lsp-register-custom-settings
;;  '(("gopls.completeUnimported" t t)
;;    ("gopls.staticcheck" t t)))
;; ;; end of gopls ;;
