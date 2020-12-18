(defvar init-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-v") 'yank)
    (define-key map (kbd "C-f") 'isearch-forward)
    (define-key map (kbd "C-s") 'save-buffer)
    (define-key map (kbd "M-a") 'execute-extended-command)
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
    map))

(define-minor-mode init-settings
  "Doc description, yada yada yada."
  nil
  ""
  init-keymap
  :global 1
  )

(init-settings 1)

(provide 'keymap)
