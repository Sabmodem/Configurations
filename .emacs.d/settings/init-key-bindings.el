;;key bindings

(global-unset-key (kbd "C-x u"))
(global-unset-key (kbd "C-x C-s"))

(global-unset-key (kbd "C-y"))
(global-set-key (kbd "C-v") 'yank)

(global-unset-key (kbd "C-f"))
(global-set-key (kbd "C-f") 'isearch-forward)

(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'save-buffer)

(global-unset-key (kbd "M-x"))
(global-unset-key (kbd "M-a"))
(global-unset-key (kbd "M-e"))
(global-set-key (kbd "M-a") 'execute-extended-command)

(global-unset-key (kbd "M-i"))
(global-unset-key (kbd "M-I"))
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-I") 'backward-paragraph)

(global-unset-key (kbd "M-j"))
(global-unset-key (kbd "M-J"))
(global-set-key (kbd "M-j") 'left-char)
(global-set-key (kbd "M-J") 'left-word)

(global-unset-key (kbd "M-l"))
(global-unset-key (kbd "M-L"))
(global-set-key (kbd "M-l") 'right-char)
(global-set-key (kbd "M-L") 'right-word)

(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-K"))
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-K") 'forward-paragraph)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'undo)

;; (global-unset-key (kbd "<up>"))
;; (global-unset-key (kbd "<down>"))
;; (global-unset-key (kbd "<left>"))
;; (global-unset-key (kbd "<right>"))

(global-set-key [(f9)] 'compile)
;; (global-set-key [(f4)] 'gdb)

(defun my-insert-tab-char ()
  "Вставляет 4 пробела(Вместо символа '\t')"
  (interactive)
  (insert "  "))
(global-set-key (kbd "M-TAB") 'my-insert-tab-char)

(defun eval-python-buffer ()
  "Execute current buffer as Python code."
  (interactive)
  (shell-command-on-region 1 (point-max) "python3"))

;; (defun python-db()
;;   (interactive)
;;   (shell-command-on-region 1 (point-max) "python3 -m pdb"))

;; (global-unset-key (kbd "<f10>"))
;; (global-set-key (kbd "<f10>") 'eval-python-buffer)

(global-unset-key (kbd "C-c"))
(global-set-key (kbd "C-c") 'kill-ring-save)

(provide 'init-key-bindings)
