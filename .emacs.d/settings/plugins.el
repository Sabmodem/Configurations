;; set load-path
(let ((base (concat "~/.emacs.d/.cask/" emacs-version "/elpa")))
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;; set custom-theme-load-path
(let ((base "~/.emacs.d/themes"))
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'custom-theme-load-path name)))))

;; ;; make the fringe stand out from the background
;; (setq solarized-distinct-fringe-background t)

;; ;; Don't change the font for some headings and titles
;; (setq solarized-use-variable-pitch nil)

;; ;; make the modeline high contrast
;; (setq solarized-high-contrast-mode-line t)

;; ;; Use less bolding
;; (setq solarized-use-less-bold t)

;; ;; Use more italics
;; (setq solarized-use-more-italic t)

;; ;; Use less colors for indicators such as git:gutter, flycheck and similar
;; (setq solarized-emphasize-indicators nil)

;; ;; Don't change size of org-mode headlines (but keep other size-changes)
;; (setq solarized-scale-org-headlines nil)

;; ;; Avoid all font-size changes
;; (setq solarized-height-minus-1 1.0)
;; (setq solarized-height-plus-1 1.0)
;; (setq solarized-height-plus-2 1.0)
;; (setq solarized-height-plus-3 1.0)
;; (setq solarized-height-plus-4 1.0)

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

;; (load-theme 'nord t t)
;; (enable-theme 'nord)
;; (load-theme 'heroku t t)
;; (enable-theme 'heroku)
;; (load-theme 'dracula t t)
;; (enable-theme 'dracula)

;; (load-theme 'doom-spacegrey t t)
;; (enable-theme 'doom-spacegrey)

(require 'yasnippet)
(setq yas-snippet-dirs (list (concat "~/.emacs.d/snippets")))
(yas-global-mode 1)

;;linum
(require 'linum)
(setq linum-format "%d ")
(global-linum-mode 1)

;;ido
(require 'ido)
(ido-everywhere 1)
(require 'ido-vertical-mode)
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)
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
(require 'icomplete)
(icomplete-mode 1)

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
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-block-padding 2)
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
;; (add-to-list 'ac-dictionary-directories "~/auto-complete-dict")
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

;; neotree
(require 'neotree)
(setq neo-smart-open t)
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq projectile-switch-project-action 'neotree-projectile-action)
(neotree-click-changes-root-toggle)

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
  (add-to-list 'purpose-user-mode-purposes '(neotree-mode . direx))
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

  (add-to-list 'purpose-user-name-purposes '("special-buffer" . direx))
  (add-to-list 'purpose-user-name-purposes '("*Buffer List*" . buffers))
  (add-to-list 'purpose-user-name-purposes '("*Ibuffer*" . buffers))
  (add-to-list 'purpose-user-name-purposes '("*Ilist*" . ilist))

  (purpose-compile-user-configuration)
  )

(defun get-only-one-buffer-with-purpose (purpose)
  "Get buffers wih purpose"
  (buffer-name (nth 0 (purpose-buffers-with-purpose purpose))))

(define-key purpose-mode-map (kbd "C-c C-f")
  (lambda () (interactive) (purpose-switch-buffer (get-only-one-buffer-with-purpose 'direx))))

(define-key purpose-mode-map (kbd "C-c C-l")
  (lambda () (interactive) (purpose-switch-buffer "*Ibuffer*")))

(define-key purpose-mode-map (kbd "C-c C-c")
  (lambda () (interactive) (purpose-switch-buffer-with-some-purpose 'edit)))

(define-key purpose-mode-map (kbd "C-c C-d")
  (lambda () (interactive)  (purpose-switch-buffer "*Ilist*")))

(define-key purpose-mode-map (kbd "C-c C-t")
  (lambda () (interactive)  (purpose-switch-buffer (get-only-one-buffer-with-purpose 'misc))))

;;projectile
(require 'projectile)
(projectile-mode +1)

;; go-mode
(require 'go-mode)
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(require 'popwin)
(popwin-mode 1)

;; (push '(ibuffer-mode :width 30 :position left :stick t) popwin:special-display-config)
;; (push '(neotree-mode :width 20 :position left :stick t) popwin:special-display-config)


;; (defun ibuffer-smart-show ()
;;   (interactive)
;;   (ibuffer)
;;   (popwin:display-buffer (get-buffer "*Ibuffer*")))

(require 'csharp-mode)
(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))

;; (require 'mic-paren)
;; (setq paren-delay 0.2)
;; (setq paren-sexp-mode t)
;; (set-face-foreground 'paren-face-match nil)
;; (set-face-background 'paren-face-match "#211")
;; (setq paren-message-show-linenumber  t)
;; (paren-activate)

;; (require 'highlight-parentheses)

(require 'highlight-indent-guides)
;; (highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'bitmap)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(provide 'plugins)
