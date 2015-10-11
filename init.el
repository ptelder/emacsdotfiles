;; Org-Mode .emacs setup

;; Turn off mouse interface early in startup to avoid momentary display
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Adjust default buffers
(setq inhibit-startup-message t)
(setq initial-scratch-message "Always mount a scratch buffer?")

;; Get package up and ready to go
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;; Ensure use-package is present / Install if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; Untangle and load org-mode config
(org-babel-load-file (concat user-emacs-directory "emacs_config.org"))
