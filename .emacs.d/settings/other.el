(setq ide-layout-is-loaded nil)

(defun my-insert-tab-char ()
  "вставляет 4 пробела(вместо символа '\t')"
  (interactive)
  (insert "  "))

(defun comment-or-uncomment-this (&optional lines)
  (interactive "p")
  (if mark-active
      (if (< (mark) (point))
          (comment-or-uncomment-region (mark) (point))
	(comment-or-uncomment-region (point) (mark)))
    (comment-or-uncomment-region
     (line-beginning-position)
     (line-end-position lines))))

(add-hook 'c++-mode-hook
          (lambda ()
            (unless (file-exists-p "makefile")
              (set (make-local-variable 'compile-command)
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (concat "g++ -g -o2 -wall -o "
                             (file-name-sans-extension file)
                             " " file)))
              (define-key c++-mode-map [(f10)] 'compile)
              (define-key c++-mode-map [(f4)] 'gdb))))

(defun xah-show-kill-ring ()
  "insert all `kill-ring' content in a new buffer named *copy history*.
url `http://ergoemacs.org/emacs/emacs_show_kill_ring.html'
version 2018-10-05"
  (interactive)
  (let (($buf (generate-new-buffer "*copy history*")))
    (progn
      (switch-to-buffer $buf)
      (funcall 'fundamental-mode)
      (setq buffer-offer-save t)
      (dolist (x kill-ring )
        (insert x "\n\u000cttt\n\n"))
      (goto-char (point-min)))
    (when (fboundp 'xah-show-formfeed-as-line)
      (xah-show-formfeed-as-line))))

;; для корректного выведения escape-последовательностей shell`a
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; установки автоопределения кодировок. первой будет определяться utf-8-unix
(prefer-coding-system 'cp866)
(prefer-coding-system 'koi8-r-unix)
(prefer-coding-system 'windows-1251-dos)
(prefer-coding-system 'utf-8-unix)

;; удаляем оконечные пробелы перед сохранением файлов
(add-hook 'before-save-hook '(lambda ()
                               (delete-trailing-whitespace)))

;; создание резервных копий редактируемых файлов (backup)
(setq backup-by-copying t)
(setq auto-save-interval 512)            ;; количество нажатий до автосохранения
(setq auto-save-timeout 20)              ;; автосохранение в перерыве между нажатиями (в секундах)
(setq backup-directory-alist             ;; все временные копии в один каталог.
      '((".*" . "~/.emacs.d/backups")))  ;; каталог создаётся автоматически.
(setq backup-by-copying t)               ;; режим сохранения копий
(setq version-control t)                 ;; создавать копии с номерами версий
(setq delete-old-versions t)             ;; удалять старые версии без подтверждения
(setq kept-new-versions 6)               ;; нумерованный бэкап - 2 первых и 2 последних
(setq kept-old-versions 2)

(defun my-backup-file-name (fpath)
  (let (backup-root bpath)
    (setq backup-root "~/.emacs.d/backups")
    (setq bpath (concat backup-root fpath "~"))
    (make-directory (file-name-directory bpath) bpath)
    bpath
    )
  )
(setq make-backup-file-name-function 'my-backup-file-name)

;; оптимизация работы редактора
;; limit on number of lisp variable bindings & unwind-protects
(setq max-specpdl-size (* 10 max-specpdl-size)) ; 10 * 1 m (default)
;; limit serving to catch infinite recursions for you before they
;; cause actual stack overflow in c, which would be fatal for emacs
(setq max-lisp-eval-depth (* 10 max-lisp-eval-depth)) ; 10 * 400 (default)
;; speed up things by preventing garbage collections
(setq gc-cons-threshold (* 10 gc-cons-threshold)) ; 10 * 400 kb (default)

;; режим по умолчанию c переносом строк по ширине
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq auto-fill-mode t)
(setq fill-column 73)

;; интерфейс
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
(delete-selection-mode 1)            ;; <del> и backspace удаляют выделенный текст
(transient-mark-mode 1)              ;; показывать выделенный текст
(show-paren-mode 1)                  ;; выделение парных скобок
(menu-bar-mode -1)                   ;; не показывать menu-bar
(tool-bar-mode -1)                   ;; не показывать tool-bar
(set-default 'truncate-lines t)      ;; нормальное отображение длинных строк
(setq column-number-mode t)          ;; показывать номер текущей колонки
(setq line-number-mode t)            ;; показывать номер текущей строки
(setq inhibit-startup-message t)     ;; не показываем сообщение при старте
(fset 'yes-or-no-p 'y-or-n-p)	     ;; не заставляйте меня печать "yes" целиком
(setq echo-keystrokes 0.001)         ;; мгновенное отображение набранных сочетаний клавиш
(setq use-dialog-boxes nil)          ;; не использовать диалоговые окна
(setq cursor-in-non-selected-windows nil) ;; не показывать курсоры в неактивных окнах
(setq default-tab-width 2)           ;; размер табуляции
(setq c-basic-offset 2)              ;; табуляция для режимов, основанных на c-mode
(setq tab-width 2)
(setq cperl-indent-level 2)
(setq sgml-basic-offset 2)           ;; для html и xml
(setq js-indent-level 2)            ;; отступ для js2
(setq-default indent-tabs-mode nil)  ;; отступ только пробелами
(setq initial-scratch-message nil)   ;; scratch buffer settings. очищаем его.
(setq case-fold-search t)            ;; поиск без учёта регистра
(global-font-lock-mode t)            ;; поддержка различных начертаний шрифтов в буфере
(setq font-lock-maximum-decoration t);; максимальное использование различных начертаний шрифтов
(if window-system (setq scalable-fonts-allowed t)) ;; масштабируемые шрифты в графическом интерфейсе
(setq read-file-name-completion-ignore-case t) ;; дополнение имён файлов без учёта регистра
(file-name-shadow-mode t)            ;; затенять игнорируемую часть имени файла
(setq resize-mini-windows t)         ;; изменять при необходимости размер минибуфера по вертикали
(auto-image-file-mode t)             ;; показывать картинки
(setq read-quoted-char-radix 10)     ;; ввод символов по коду в десятичном счислении `c-q'
(put 'upcase-region 'disabled nil)   ;; разрешить поднимать регистр символов
(put 'downcase-region 'disabled nil) ;; разрешить опускать регистр символов

(put 'narrow-to-region 'disabled nil);; разрешить ограничение редактирования только в выделенном участке
(put 'narrow-to-page 'disabled nil)  ;; разрешить ограничение редактирования только на текущей странице
(setq scroll-step 1)                 ;; перематывать по одной строке
(setq temp-buffer-max-height         ;; максимальная высота временного буфера
      (lambda (buffer)
        (/ (- (frame-height) 2) 3)))
(temp-buffer-resize-mode t)          ;; высота временного буфера зависит от его содержимого
(setq frame-title-format '("" "%b @ emacs " emacs-version)) ;; заголовок окна

(setq scroll-conservatively 50)      ;; гладкий скроллинг с полями
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

(setq require-final-newline t)       ;; always end a file with a newline

;; мышка...
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag) ;; scroll bar gets dragged by mouse butn 1
(setq mouse-yank-at-point 't)        ;; paste at point not at cursor


(defadvice yank (after indent-region activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode c-mode c++-mode
                                objc-mode latex-mode plain-tex-mode python-mode))
      (indent-region (region-beginning) (region-end) nil)))

(defadvice yank-pop (after indent-region activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode c-mode c++-mode
                                objc-mode latex-mode plain-tex-mode python-mode))
      (indent-region (region-beginning) (region-end) nil)))


;; заменить окончания строк в формате dos ^m на unix
(defun dos-to-unix ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "\r" nil t)
      (replace-match ""))))

;; удалить пробельные символы в конце строк
(defun delete-trailing-whitespaces ()
  (interactive "*")
  (delete-trailing-whitespace))

;; cleaning unuxpected buffers
(defun clean-unuxpected-buffers ()
  (if (get-buffer "*pu-dummy-direx*") (kill-buffer "*pu-dummy-direx*"))
  (if (get-buffer "*pu-dummy-buffers*") (kill-buffer "*pu-dummy-buffers*"))
  (if (get-buffer "*pu-dummy-ilist*") (kill-buffer "*pu-dummy-ilist*"))
  (if (get-buffer "*pu-dummy-edit*") (kill-buffer "*pu-dummy-edit*")))

;;function for loaing purpose
(defun load-purpose-ide ()
  (interactive)
  (purpose-load-window-layout-file "~/.emacs.d/layouts/full-ide.window-layout")
  (imenu-list-minor-mode)
  (if (not ide-layout-is-loaded) (ibuffer))
  (neotree-toggle)
  ;; (list-buffers)
  (clean-unuxpected-buffers)
  ;; (list-buffers)
  (ibuffer)
  ;; (purpose-switch-buffer "*Buffer List*")
  (purpose-switch-buffer "*Ibuffer*")
  (purpose-toggle-window-buffer-dedicated)
  (setq ide-layout-is-loaded t))

(defun neotree-get-buffer-create (&optional dir)
  "Return the neotree buffer -- creating it if needed.
The root directory may be set/reset using the optional
argument of DIR; else if buffer exists already use it
as-is; else use `neo-path--get-working-dir'."
  (let ((valid-start-node-p nil)
        (buffer (neo-global--get-buffer t)))
    (neo-global--with-buffer
      (setf valid-start-node-p (neo-buffer--valid-start-node-p))
      (when (or dir (not valid-start-node-p))
        (let ((path (or dir (neo-path--get-working-dir)))
              start-path)
          (unless (and (file-exists-p path)
                       (file-directory-p path))
            (throw 'error "The path is not a valid directory."))
          (setq start-path (expand-file-name (substitute-in-file-name path)))
          (setq neo-buffer--start-node start-path)
          (cd start-path)
          (neo-buffer--save-cursor-pos path nil)
          (let ((start-node neo-buffer--start-node))
            (unless start-node
              (setq start-node default-directory))
            (neo-buffer--with-editing-buffer
             ;; starting refresh
             (erase-buffer)
             (neo-buffer--node-list-clear)
             (neo-buffer--insert-banner)
             (setq neo-buffer--start-line neo-header-height)
             (neo-buffer--insert-tree start-node 1)
             (goto-char (point-min)))))))
    buffer))


;; Prototype of function that must checks status of the buffer list and neotree and starts them. Trouble with check status of the neotree
(defun update-neotree-and-buffer-list ()
  (if (get-buffer "*Buffer List*") (buffer-menu))
;;   (if (neotree-get-buffer-create) (neotree)))
  (if ide-layout-is-loaded (progn (neotree-find))))


;; (add-hook 'find-file-hook 'update-neotree-and-buffer-list)
;; (add-hook 'kill-buffer-hook 'update-neotree-and-buffer-list)
;; (add-hook 'window-setup-hook (lambda () (message default-directory)))
;; (add-to-list 'window-buffer-change-functions (lambda (window) (let buf (buffer-name (window-buffer (frame-selected-window window))) (when (string-match "*" )) message )))

;; (when (string-match "[ \t]*$" test-str)
;;   (message (concat "[" (replace-match "" nil nil test-str) "]")))

;; (add-hook 'window-setup-hook 'update-neotree-and-buffer-list)
;; (add-hook 'window-setup-hook 'update-neotree-and-buffer-list)


;; Function in the package are broken. This is fixing the problem
(defun ac-js2-setup-auto-complete-mode ()
  "Setup ac-js2 to be used with auto-complete-mode."
  (add-to-list 'ac-sources 'ac-source-js2)
  (auto-complete-mode)
  (eval '(ac-define-source "js2"
           '((candidates . ac-js2-ac-candidates)
             (document . ac-js2-ac-document)
             (prefix .  ac-js2-ac-prefix)
             (requires . -1)))))

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-find)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "-1"))))

;; (require 'hydra)

;; (defhydra hydra-direx (purpose-mode-map "C-c C-f"
;;                                            :color red
;;                                            :pre (purpose-switch-buffer (get-only-one-buffer-with-purpose 'direx))
;;                                            :base-map neotree-mode-map
;;                                            ;; :post (purpose-switch-buffer-with-some-purpose 'edit)
;;                                            :post (if (equal major-mode 'neotree-mode) (purpose-switch-buffer-with-some-purpose 'edit)))
;;   "Directory Explorer"
;;   ("i" previous-line)
;;   ("j" left-char)
;;   ("l" right-char)
;;   ("k" next-line)
;;   ("f" isearch-forward))

;; (defhydra hydra-ibuffer (purpose-mode-map "C-c C-l"
;;                                            :color red
;;                                            :pre (purpose-switch-buffer "*Ibuffer*")
;;                                            :base-map ibuffer-mode-map
;;                                            :post (if (equal (buffer-name (get-buffer (current-buffer))) "*Ibuffer*") (purpose-switch-buffer-with-some-purpose 'edit)))
;;   "Ibuffer Explorer"
;;   ("i" previous-line)
;;   ("j" left-char)
;;   ("l" right-char)
;;   ("k" next-line)
;;   ("f" isearch-forward))

;; (defhydra hydra-ilist (purpose-mode-map "C-c C-d"
;;                                           :color red
;;                                           :pre (purpose-switch-buffer "*Ilist*")
;;                                           :base-map imenu-list-major-mode-map
;;                                           :post (if (equal (buffer-name (get-buffer (current-buffer))) "*Ilist*") (purpose-switch-buffer-with-some-purpose 'edit)))
;;   "Ibuffer Explorer"
;;   ("i" previous-line)
;;   ("j" left-char)
;;   ("l" right-char)
;;   ("k" next-line)
;;   ("f" isearch-forward))


(provide 'other)
