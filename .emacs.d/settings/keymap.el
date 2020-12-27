;; (defun before-find-file-function ()
;;   (interactive)
;;   (if (get-buffer (file-name-nondirectory (directory-file-name (file-name-directory default-directory)))) (kill-buffer (file-name-nondirectory (directory-file-name (file-name-directory default-directory)))))
;;   (ido-find-file))

(defvar init-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-v") 'yank)
    ;; (define-key map (kbd "C-f") 'isearch-forward)
    (define-key map (kbd "C-s") 'save-buffer)
    (define-key map (kbd "M-a") 'isearch-forward)
    (define-key map (kbd "M-i") 'previous-line)
    (define-key map (kbd "M-I") 'backward-paragraph)
    (define-key map (kbd "M-j") 'left-char)
    (define-key map (kbd "M-J") 'left-word)
    (define-key map (kbd "M-l") 'right-char)
    (define-key map (kbd "M-L") 'right-word)
    (define-key map (kbd "M-k") 'next-line)
    (define-key map (kbd "M-J") 'left-word)
    (define-key map (kbd "M-J") 'left-word)
    (define-key map (kbd "M-K") 'forward-paragraph)
    (define-key map (kbd "C-z") 'undo)
    (define-key map (kbd "M-TAB") 'my-insert-tab-char)
    (define-key map (kbd "C-x /") 'comment-or-uncomment-this)
    (define-key map (kbd "C-x \\") 'indent-region)
    (define-key map (kbd "C-p C-f") 'projectile-find-file)
    (define-key map (kbd "C-x C-b") 'ibuffer)
    (define-key map (kbd "C-l C-i") 'load-purpose-ide)
    (define-key map (kbd "C-n C-p") 'neotree-project-dir)
    map))

(define-minor-mode init-settings
  "In this minor mode are kept my keymap and other settings, that must be not deleted by plugins"
  nil
  " IST"
  init-keymap
  :global 1
  )

(init-settings 1)

(provide 'keymap)
