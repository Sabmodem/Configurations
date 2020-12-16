;;load the cask package directories
(let ((base "~/.emacs.d/.cask/27.1/elpa"))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(require 'color-theme-modern)
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/.cask/27.1/elpa/color-theme-modern-20200729.921"))
(load-theme 'charcoal-black t t)
(enable-theme 'charcoal-black)

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

(require 'autopair)
(autopair-global-mode)

;;; Web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-extra-snippets '(("erb" . (("name" . ("beg" . "end"))))
                                ))
(setq web-mode-extra-auto-pairs '(("erb" . (("open" "close")))
                                  ))

;;js2-mode
(require 'js2-mode)
(require 'ac-js2)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(setq ac-js2-evaluate-calls t)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;;treemacs
(require 'treemacs)

;;direx
(require 'direx)

(require 'flycheck)

(require 'imenu-list)

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

;;purpose
(require 'window-purpose)
(setq purpose-special-action-sequences nil)
(setq purpose-use-default-configuration nil)
(purpose-mode)
(progn
  ;; (add-to-list 'purpose-user-mode-purposes '(fundamental-mode . edit))
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
  (purpose-compile-user-configuration)
  )

;;projectile
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'plugins)
