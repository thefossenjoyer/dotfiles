;;; doom-modeline.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 thefossenjoyer
;;
;; Author: thefossenjoyer <thefossenjoyer@devpc>
;; Maintainer: thefossenjoyer <thefossenjoyer@devpc>
;; Created: October 16, 2022
;; Modified: October 16, 2022
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/thefossenjoyer/doom-modeline
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:
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

(provide 'doom-modeline)
;;; doom-modeline.el ends here
