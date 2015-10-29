;; Org-Mode .emacs setup

;; Turn off mouse interface early in startup to avoid momentary display
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Adjust default buffers
(setq inhibit-startup-message t)
(when (executable-find "fortune")
  (setq initial-scratch-message
	(concat
	 (mapconcat
	  (lambda (x) (concat ";; " x))
	  (split-string (shell-command-to-string "fortune") "\n" t) "\n")
	 "\n\n")))
;; Get package up and ready to go
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;; Ensure use-package is present / Install if it's not already installed.
;; use-package is used to configure the rest of the packages.

;; also need a check for diminsh! use-package relies on it!!!
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; Untangle and load org-mode config
(org-babel-load-file (concat user-emacs-directory "emacs_config.org"))
