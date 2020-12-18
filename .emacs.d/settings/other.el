(defun my-insert-tab-char ()
  "Вставляет 4 пробела(Вместо символа '\t')"
  (interactive)
  (insert "  "))

(defun comment-or-uncomment-this (&optional lines)
  (interactive "P")
  (if mark-active
      (if (< (mark) (point))
          (comment-or-uncomment-region (mark) (point))
	(comment-or-uncomment-region (point) (mark)))
    (comment-or-uncomment-region
     (line-beginning-position)
     (line-end-position lines))))

(add-hook 'c++-mode-hook
          (lambda ()
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (concat "g++ -g -O2 -Wall -o "
                             (file-name-sans-extension file)
                             " " file)))
              (define-key c++-mode-map [(f10)] 'compile)
              (define-key c++-mode-map [(f4)] 'gdb))))

(defun xah-show-kill-ring ()
  "Insert all `kill-ring' content in a new buffer named *copy history*.
URL `http://ergoemacs.org/emacs/emacs_show_kill_ring.html'
Version 2018-10-05"
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

;; Установки автоопределения кодировок. Первой будет определяться utf-8-unix
(prefer-coding-system 'cp866)
(prefer-coding-system 'koi8-r-unix)
(prefer-coding-system 'windows-1251-dos)
(prefer-coding-system 'utf-8-unix)

;; Удаляем оконечные пробелы перед сохранением файлов
(add-hook 'before-save-hook '(lambda ()
                               (delete-trailing-whitespace)))

;; Создание резервных копий редактируемых файлов (Backup)
;; (info "(emacs)Auto Save")
(setq auto-save-interval 512)            ;; Количество нажатий до автосохранения
(setq auto-save-timeout 20)              ;; Автосохранение в перерыве между нажатиями (в секундах)
(setq backup-directory-alist             ;; Все временные копии в один каталог.
      '((".*" . "~/.emacs.d/backups")))  ;; Каталог создаётся автоматически.
(setq backup-by-copying t)               ;; Режим сохранения копий
(setq version-control t)                 ;; Создавать копии с номерами версий
(setq delete-old-versions t)             ;; Удалять старые версии без подтверждения
(setq kept-new-versions 6)               ;; нумерованный бэкап - 2 первых и 2 последних
(setq kept-old-versions 2)

;; Оптимизация работы редактора
;; limit on number of Lisp variable bindings & unwind-protects
(setq max-specpdl-size (* 10 max-specpdl-size)) ; 10 * 1 M (default)
;; limit serving to catch infinite recursions for you before they
;; cause actual stack overflow in C, which would be fatal for Emacs
(setq max-lisp-eval-depth (* 10 max-lisp-eval-depth)) ; 10 * 400 (default)
;; speed up things by preventing garbage collections
(setq gc-cons-threshold (* 10 gc-cons-threshold)) ; 10 * 400 KB (default)

;; Режим по умолчанию c переносом строк по ширине
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq auto-fill-mode t)
(setq fill-column 73)

;; Интерфейс
(delete-selection-mode 1)            ;; <del> и BackSpace удаляют выделенный текст
(transient-mark-mode 1)              ;; Показывать выделенный текст
(show-paren-mode 1)                  ;; выделение парных скобок
(menu-bar-mode -1)                   ;; Не показывать menu-bar
(tool-bar-mode -1)                   ;; Не показывать tool-bar
(set-default 'truncate-lines t)      ;; нормальное отображение длинных строк
(setq column-number-mode t)          ;; Показывать номер текущей колонки
(setq line-number-mode t)            ;; Показывать номер текущей строки
(setq inhibit-startup-message t)     ;; Не показываем сообщение при старте
(fset 'yes-or-no-p 'y-or-n-p)	     ;; не заставляйте меня печать "yes" целиком
(setq echo-keystrokes 0.001)         ;; Мгновенное отображение набранных сочетаний клавиш
(setq use-dialog-boxes nil)          ;; Не использовать диалоговые окна
(setq cursor-in-non-selected-windows nil) ;; Не показывать курсоры в неактивных окнах
(setq default-tab-width 2)           ;; размер табуляции
(setq c-basic-offset 2)              ;; табуляция для режимов, основанных на c-mode
(setq tab-width 2)
(setq cperl-indent-level 2)
(setq sgml-basic-offset 2)           ;; для HTML и XML
(setq js-indent-level 2)            ;; отступ для js2
(setq-default indent-tabs-mode nil)  ;; отступ только пробелами
(setq initial-scratch-message nil)   ;; Scratch buffer settings. Очищаем его.
(setq case-fold-search t)            ;; Поиск без учёта регистра
(global-font-lock-mode t)            ;; Поддержка различных начертаний шрифтов в буфере
(setq font-lock-maximum-decoration t);; Максимальное использование различных начертаний шрифтов
(if window-system (setq scalable-fonts-allowed t)) ;; Масштабируемые шрифты в графическом интерфейсе
(setq read-file-name-completion-ignore-case t) ;; Дополнение имён файлов без учёта регистра
(file-name-shadow-mode t)            ;; Затенять игнорируемую часть имени файла
(setq resize-mini-windows t)         ;; Изменять при необходимости размер минибуфера по вертикали
(auto-image-file-mode t)             ;; Показывать картинки
(setq read-quoted-char-radix 10)     ;; Ввод символов по коду в десятичном счислении `C-q'
(put 'upcase-region 'disabled nil)   ;; Разрешить поднимать регистр символов
(put 'downcase-region 'disabled nil) ;; Разрешить опускать регистр символов

(put 'narrow-to-region 'disabled nil);; Разрешить ограничение редактирования только в выделенном участке
(put 'narrow-to-page 'disabled nil)  ;; Разрешить ограничение редактирования только на текущей странице
(setq scroll-step 1)                 ;; Перематывать по одной строке
(setq temp-buffer-max-height         ;; Максимальная высота временного буфера
      (lambda (buffer)
        (/ (- (frame-height) 2) 3)))
(temp-buffer-resize-mode t)          ;; Высота временного буфера зависит от его содержимого
(setq frame-title-format '("" "%b @ Emacs " emacs-version)) ;; Заголовок окна

(setq scroll-conservatively 50)      ;; Гладкий скроллинг с полями
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

;; (setq my-author-name (getenv "USER"))
;; (setq user-full-name (getenv "USER"))
(setq require-final-newline t)       ;; always end a file with a newline

;; (set-cursor-color "red")             ;; Красный не мигающий (!) курсор
;; (blink-cursor-mode nil)
;; Однако в режиме терминала это не работает, поэтому..
;;(send-string-to-terminal "\033]12;red\007") АХТУНГ!!! ПОРТИТ ВСЕ УСТАНОВЛЕННЫЕ ПЛАГИНЫ
;; мышка...
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag) ;; Scroll Bar gets dragged by mouse butn 1
(setq mouse-yank-at-point 't)        ;; Paste at point NOT at cursor

;; ;; Хочу чтобы inferior shell открывался в том же окне
;; (add-to-list 'display-buffer-alist
;;              `(,(rx bos "*shell*")
;;                display-buffer-same-window))


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


;; Заменить окончания строк в формате DOS ^M на Unix
(defun dos-to-unix ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "\r" nil t)
      (replace-match ""))))

;; Удалить пробельные символы в конце строк
(defun delete-trailing-whitespaces ()
  (interactive "*")
  (delete-trailing-whitespace))

;; cleaning unuxpected buffers
(defun clean-unuxpected-buffers ()
  (if (get-buffer "*pu-dummy-direx*") (kill-buffer "*pu-dummy-direx*"))
  (if (get-buffer "*pu-dummy-buffers*") (kill-buffer "*pu-dummy-buffers*"))
  (if (get-buffer "*pu-dummy-ilist*") (kill-buffer "*pu-dummy-ilist*"))
  (if (get-buffer "*pu-dummy-edit*") (kill-buffer "*pu-dummy-edit*")))

;;function for loading purpose
(defun load-purpose-ide ()
  (interactive)
  (purpose-load-window-layout-file "~/.emacs.d/layouts/full-ide.window-layout")
  (imenu-list-minor-mode)
  (direx:jump-to-directory)
  (list-buffers)
  (clean-unuxpected-buffers)
  (list-buffers)
  (add-hook 'buffer-list-update-hook
            '(lambda () (message default-directory)))
  (purpose-switch-buffer "*Buffer List*")
  (purpose-toggle-window-buffer-dedicated)
  ;; (other-window 4)
  )

;; (add-hook 'find-file-hook
;;           '(lambda () (if (get-buffer "*Buffer List*") (list-buffers))))

(provide 'other)
