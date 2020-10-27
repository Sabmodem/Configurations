;;arduino-mode
(add-to-list 'load-path "~/.emacs.d/arduino-mode")
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;;color-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/color-theme-modern-20200315.929")
(load-theme 'charcoal-black t t)
(enable-theme 'charcoal-black)

;;yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20200413.2221")
;;(yas/load-directory "~/.emacs.d/elpa/yasnippet-20200413.2221/snippets/")
(require 'yasnippet)
(yas-global-mode 1)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-20200413.2221/snippets/")

;;linum
(require 'linum)
(setq linum-format "%d ")
(global-linum-mode 1)

;;ido
(require 'ido)
(ido-mode t)
;;(setq ido-enable-flex-matching

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20170125.245")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170125.245")
(setq ac-auto-start        t)
(setq ac-auto-show-menu    t)
(global-auto-complete-mode t)
(add-to-list 'ac-modes   'lisp-mode)
(add-to-list 'ac-sources 'ac-source-semantic) ;; искать автодополнения в CEDET
(add-to-list 'ac-sources 'ac-source-variables) ;; среди переменных
(add-to-list 'ac-sources 'ac-source-functions) ;; в названиях функций
(add-to-list 'ac-sources 'ac-source-dictionary) ;; в той папке где редактируемый буфер
(add-to-list 'ac-sources 'ac-source-words-in-all-buffer) ;; по всему буферу
(add-to-list 'ac-sources 'ac-source-files-in-current-dir)

;;speedbar
(add-to-list 'load-path "~/.emacs.d/elpa/sr-speedbar/")
(require 'sr-speedbar)
(global-set-key (kbd "<XF86MonBrightnessUp>") 'sr-speedbar-toggle)

;;flycheck
(require 'flycheck)
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))
(add-hook 'after-init-hook #'global-flycheck-mode)
;; (setq-default flycheck-temp-prefix ".flycheck")
(setq flycheck-eslintrc "~/.eslintrc")
(setq flycheck-checkers '(javascript-eslint))
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist))) ;;customize flycheck for json files

;;web-mode
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))
(flycheck-add-mode 'javascript-eslint 'web-mode)


(provide 'plugins)
