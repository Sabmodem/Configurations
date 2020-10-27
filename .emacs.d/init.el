
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/") ;;("elpa" . "http://tromey.com/elpa/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")))
;; (add-to-list 'package-archives
;;              '(("elpa" . "http://elpa.gnu.org/packages/")
;;                ("melpa" . "http://melpa.org/packages/")))

;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives
;;              '("MELPA Stable" . "http://stable.melpa.org/packages/") t)
(setq package-archives '(("MELPA Stable" . "http://stable.melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("elpa" . "http://elpa.gnu.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/Settings/")

(require 'plugins)
(require 'other)
(require 'init-key-bindings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-eslint-rules-directories '("/home/sabmodem/eslintConf"))
 '(package-selected-packages
   '(dart-mode exec-path-from-shell json-mode js2-mode web-mode flycheck yasnippet-classic-snippets color-theme-modern sr-speedbar yasnippet color-theme auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
