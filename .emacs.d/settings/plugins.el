;;load the cask package directories
(let ((base "~/.emacs.d/.cask/27.1/elpa"))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/.cask/27.1/elpa/color-theme-modern-20200729.921"))
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/.cask/27.1/elpa/nord-theme-20200620.1122"))
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/.cask/27.1/elpa/dracula-theme-20201120.758"))
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/.cask/27.1/elpa/soothe-theme-20141027.1441"))
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/.cask/27.1/elpa/nova-theme-20200826.1803"))
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/.cask/27.1/elpa/solarized-theme-20201207.1431"))
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/.cask/27.1/elpa/heroku-theme-20150523.219"))
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/.cask/27.1/elpa/alect-themes-20200801.2041"))

;; (load-theme 'solarized-dark t t)
;; (enable-theme 'solarized-dark)
(load-theme 'solarized-gruvbox-dark t t)
(enable-theme 'solarized-gruvbox-dark)
;; (load-theme 'solarized-wombat-dark t t)
;; (enable-theme 'solarized-wombat-dark)
;; (load-theme 'solarized-zenburn t t)
;; (enable-theme 'solarized-zenburn)
;; (load-theme 'soothe t t)
;; (enable-theme 'soothe)
;; (load-theme 'nova t t)
;; (enable-theme 'nova)
;; (load-theme 'heroku t t)
;; (enable-theme 'heroku)

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/.cask/27.1/elpa/yasnippet-snippets-20201214.1054/snippets"))
(yas-global-mode 1)

;;linum
(require 'linum)
(setq linum-format "%d ")
(global-linum-mode 1)

;;ido
(require 'ido)
(require 'ido-vertical-mode)
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground "orange")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)
(ido-mode t)
(ido-vertical-mode t)

;; autopair
(require 'autopair)
(autopair-global-mode)

;;; Web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-markup-indent-offset 2);; web-mode
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-column-highlight t)
(add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
(setq web-mode-style-padding 1)
(setq web-mode-script-padding 1)
(setq web-mode-block-padding 0)
(setq web-mode-comment-style 2)
;; (set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-comment-interpolation t)
(setq web-mode-enable-heredoc-fontification t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(setq web-mode-extra-snippets '(("erb" . (("name" . ("beg" . "end"))))
                                ))
(setq web-mode-extra-auto-pairs '(("erb" . (("open" "close")))
                                  ))
;;auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/.cask/27.1/elpa/auto-complete-20201213.1255/dict")
(setq ac-auto-start        t)
(setq ac-auto-show-menu    t)
(global-auto-complete-mode t)
;; (add-to-list 'ac-modes   'lisp-mode)
(add-to-list 'ac-sources 'ac-source-semantic) ;; искать автодополнения в CEDET
(add-to-list 'ac-sources 'ac-source-variables) ;; среди переменных
(add-to-list 'ac-sources 'ac-source-functions) ;; в названиях функций
(add-to-list 'ac-sources 'ac-source-dictionary) ;; в той папке где редактируемый буфер
(add-to-list 'ac-sources 'ac-source-words-in-all-buffer) ;; по всему буферу
(add-to-list 'ac-sources 'ac-source-files-in-current-dir)

;;js2-mode
(require 'js2-mode)
(require 'ac-js2)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(setq ac-js2-evaluate-calls t)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'ac-js2-setup-auto-complete-mode)

;;direx
(require 'direx)

;; flycheck
(require 'flycheck)
(global-flycheck-mode)

;; imenu
(require 'imenu-list)

;;purpose
(require 'window-purpose)
(setq purpose-special-action-sequences nil)
(setq purpose-use-default-configuration nil)
(purpose-mode)
(progn
  (add-to-list 'purpose-user-mode-purposes '(fundamental-mode . misc))
  (add-to-list 'purpose-user-mode-purposes '(direx:direx-mode . direx))
  (add-to-list 'purpose-user-mode-purposes '(ibuffer-mode . buffers))
  (add-to-list 'purpose-user-mode-purposes '(Buffer-menu-mode . buffers))
  (add-to-list 'purpose-user-mode-purposes '(imenu-list-major-mode . ilist))
  (add-to-list 'purpose-user-mode-purposes '(lisp-interaction-mode . misc))
  (add-to-list 'purpose-user-mode-purposes '(shell-mode . misc))
  (add-to-list 'purpose-user-mode-purposes '(eshell-mode . misc))
  (add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . misc))
  (add-to-list 'purpose-user-mode-purposes '(python-inferior-mode . misc))
  (add-to-list 'purpose-user-mode-purposes '(gdb-inferior-io-mode . misc))
  (add-to-list 'purpose-user-mode-purposes '(compilation-mode . misc))
  (add-to-list 'purpose-user-mode-purposes '(term-mode . misc))
  (add-to-list 'purpose-user-mode-purposes '(completion-list-mode . misc))

  (add-to-list 'purpose-user-name-purposes '("*Buffer List*" . buffers))
  (add-to-list 'purpose-user-name-purposes '("*Ilist*" . ilist))

  (purpose-compile-user-configuration)
  )

(defun get-only-one-buffer-with-purpose (purpose)
  "Get buffers wih purpose"
  (buffer-name (nth 0 (purpose-buffers-with-purpose purpose))))

(define-key purpose-mode-map (kbd "C-c C-f")
  (lambda () (interactive) (purpose-switch-buffer (get-only-one-buffer-with-purpose 'direx))))

(define-key purpose-mode-map (kbd "C-c C-l")
  (lambda () (interactive) (purpose-switch-buffer "*Buffer List*")))

(define-key purpose-mode-map (kbd "C-c C-c")
  (lambda () (interactive) (purpose-switch-buffer-with-some-purpose 'edit)))

(define-key purpose-mode-map (kbd "C-c C-d")
  (lambda () (interactive)  (purpose-switch-buffer "*Ilist*")))

(define-key purpose-mode-map (kbd "C-c C-t")
  (lambda () (interactive)  (purpose-switch-buffer (get-only-one-buffer-with-purpose 'misc))))

;;projectile
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; go-mode
(require 'go-mode)
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(provide 'plugins)
