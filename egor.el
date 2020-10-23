;;; package --- Summary
;;; Commentary:
;;; Main EMACS settings File, Load Settings From Parts.
;;; Code:

(add-to-list 'load-path "-/.emacs.d")


(require 'package)

;; Require Pacckage Melpa

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa"        . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize nil)

;;; åÓÌÉ ÐÁËÅÔ use-package ÎÅ ÕÓÔÁÎÏ×ÌÅÎ, ÅÇÏ ÎÕÖÎÏ ÓËÁÞÁÔØ É
;;; ÕÓÔÁÎÏ×ÉÔØ
(unless (package-installed-p 'use-package)
  (message "EMACS install use-package.el")
  (package-refresh-contents)
  (package-install 'use-package))

;;; õÓÔÁÎÏ×ÉÌÉ, ÚÁÇÒÕÚÉÌÉ, ÕËÁÚÁÌÉ, ÞÔÏ ÎÅÄÏÓÔÁÀÝÉÅ ÐÁËÅÔÙ ÎÕÖÎÏ
;;; Á×ÔÏÍÁÔÉÞÅÓËÉ ÚÁÇÒÕÖÁÔØ É ÕÓÔÁÎÁ×ÌÉ×ÁÔØ.
(require 'use-package)
(setq use-package-always-ensure t)

;;; õËÁÚÙ×ÁÅÍ ÏÔËÕÄÁ ÂÒÁÔØ ÞÁÓÔÉ ÎÁÓÔÒÏÅË.
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory) user-emacs-directory)
        ((boundp 'user-init-directory) user-init-directory)
        (t "~/.emacs.d/")))

;;; æÕÎËÃÉÑ ÄÌÑ ÚÁÇÒÕÚËÉ ÎÁÓÔÒÏÅË ÉÚ ÕËÁÚÁÎÎÏÇÏ ÆÁÊÌÁ.
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;;how do i disable backup files?
(add-hook 'dired-load-hook
          (lambda ()
            (require 'dired-x)))


(use-package
  rainbow-delimiters
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
        (setq rainbow-delimiters-max-face-count 9))

;;; Scrolling
(setq scroll-step               1) ;; one line
(setq scroll-margin            10) ;; scroll buffer to 10 lines at going to last line
(setq scroll-conservatively 10000)
(setq directory-free-space-args "-Pm")

;; ðÏÄÓ×ÅÔËÁ ÒÅÚÕÌØÔÁÔÏ× ÐÏÉÓËÁ É ×Ó£ ÔÁËÏÅ
(setq search-highlight        t)
(setq query-replace-highlight t)

(setq column-number-mode 1) ;; îÏÍÅÒÁ ÓÔÒÏË ÓÌÅ×Á
(setq use-dialog-box nil)   ;; îÅ ÎÕÖÎÙ ÎÁÍ ÄÉÁÌÏÇÉ, ÂÕÄÅÍ ×Ó£ ÒÕËÁÍÉ ÄÅÌÁÔØ
(setq-default tab-width          4) ;; úÁÍÅÎÉÔØ TAB ÎÁ 4 ÐÒÏÂÅÌÁ
(setq-default standart-indent    4) ;; óÔÁÎÄÁÒÔÎÙÊ ÏÔÓÔÕÐ - 4 ÐÒÏÂÅÌÁ
(setq backup-inhibited t)           ;; Backup'Ù ÔÏÖÅ ÄÅÌÁÔØ ÎÅ ÂÕÄÅÍ



(setq-default c-basic-offset 4 c-indent-level 4 indent-tabs-mode nil) ;; TAB'Ù ÎÅ ÎÕÖÎÙ

(setq-default save-place t) ;; ðÏÍÎÉÔØ, ÇÄÅ ÂÙÌ ËÕÒÓÏÒ × ÐÒÏÛÌÙÊ ÒÁÚ

;;; îÁÖÁÔÉÅ Insert ÂÏÌØÛÅ ÎÅ ×ËÌÀÞÁÅÔ ÒÅÖÉÍ ÚÁÍÅÎÙ
(define-key global-map [(insert)] nil)

;;; á×ÔÏÆÏÒÍÁÔÉÒÏ×ÁÎÉÅ ÐÅÒÅÄ ÓÏÈÒÁÎÅÎÉÅÍ
(defun format-current-buffer()
  (indent-region (point-min)
                 (point-max)))
(defun untabify-current-buffer()
  (if (not indent-tabs-mode)
      (untabify (point-min)
                (point-max)))
  nil)
(add-to-list 'write-file-functions 'untabify-current-buffer)
(add-to-list 'write-file-functions 'delete-trailing-whitespace)


(desktop-save-mode 1) ;;; ðÏÍÎÉÔØ, ËÁËÉÅ ÆÁÊÌÙ ÂÙÌÉ ÏÔËÒÙÔÙ × ÐÒÏÛÌÙÊ ÒÁÚ
(fset 'yes-or-no-p 'y-or-n-p) ;;; ÷ÍÅÓÔÏ yes É no ÐÏÎÉÍÁÔØ y É n
(global-hl-line-mode 1) ;;; ðÏÄÓ×ÅÔËÁ ÔÅËÕÝÅÊ ÓÔÒÏËÉ
(global-linum-mode 1)   ;;; ðÏËÁÚÙ×ÁÔØ ÎÏÍÅÒÁ ÓÔÒÏË ×ÓÅÇÄÁ
(menu-bar-mode -1)      ;;; á ÍÅÎÀ - ÎÉËÏÇÄÁ
(scroll-bar-mode -1)    ;;; óËÒÏÌÌÂÁÒ ÎÅ ÎÕÖÅÎ
(tool-bar-mode -1)      ;;; ôÕÌÂÁÒ ÎÅ ÎÕÖÅÎ


;; éËÏÎËÉ × ÓÔÁÔÕÓ-ÂÁÒÅ
(use-package
  mode-icons
  :config (mode-icons-mode 1))

;; ðÏËÁÚÙ×ÁÔØ ÏÔÓÔÕÐÙ ×Ï ×ÓÅÈ ÒÅÖÉÍÁÈ
(use-package
  indent-guide
  :config (indent-guide-global-mode 1))


(setq frame-title-format "Egor_GNU_ArchEmacs")
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(ido-mode)


(require 'dired)
(setq dired-recursive-deletes 'top)


(setq imenu-auto-rescan    t)
(setq imenu-use-popup-menu nil)
(global-set-key (kbd "<f6>") 'imenu)

(show-paren-mode t)
(setq show-paren-style 'expression)

(electric-pair-mode    1)
(setq ring-bell-function 'ignore)
(setq redisplay-dont-pause t)
(setq use-dialog-box nil)

(setq display-time-24hr-format t)
(display-time-mode    t)


(require 'ido)
(ido-mode    t)
(icomplete-mode    t)
(ido-everywhere    t)
(setq ido-virtual-buffers    t)
(setq ido-enable-flex-matching    t)

(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)


(setq x-select-enable-clipboard  t)
(setq search-highlight     t)
(setq query-replace-highlight  t)

(global-set-key "\eg" 'goto-line)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)


(require 'package)

;; If you want to use latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; If you want to use last tagged version
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)



(global-set-key (kbd "\ed") 'other-window)



(global-set-key (kbd "<f4>") 'emmet-mode)

(global-unset-key (kbd "<f11>"))

(defun shell-window-one
    ()
  (interactive)
  (shell)
  (delete-other-windows))
(global-set-key (kbd "<f11>") 'shell-window-one)


(keyboard-translate ?\C-h ?\C-?)

(set-default 'truncate-lines t)
(ac-config-default)

(defun setup-ac-for-haml ()
  ;; Require ac-haml since we are setup haml auto completion
  (require 'ac-haml)
  ;; Require default data provider if you want to use
  (require 'ac-html-default-data-provider)
  ;; Enable data providers,
  ;; currently only default data provider available
  (ac-html-enable-data-provider 'ac-html-default-data-provider)
  ;; Let ac-haml do some setup
  (ac-haml-setup)
  ;; Set your ac-source
  (setq ac-sources '(ac-source-haml-tag
                     ac-source-haml-attr
                     ac-source-haml-attrv))
  ;; Enable auto complete mode
  (auto-complete-mode))

(add-hook 'haml-mode-hook 'setup-ac-for-haml)


    (defun ecb-activated-in-selected-frame ()
    "A hack to use ECB in multiple frames. It first deactivates ECB, then
    activate it in current frame."
    (interactive)
    (let ((current-frame (selected-frame)))
        ; The frame foucs change when activating or deactivating ECB is weird, so
        ; activate current selected frame explicitly.
        (if (and (boundp 'ecb-minor-mode) (ecb-minor-mode))
            (ecb-deactivate)
        )
        (select-frame current-frame)
        (ecb-activate)
        )
    )

(window-numbering-mode t)


(global-set-key "\ei" '(lambda () (interactive) (insert ?\$)))



;;new eww how
(defun eww-new ()
  (interactive)
  (let ((url (read-from-minibuffer "yee fuck the system new url: ")))
    (switch-to-buffer (generate-new-buffer "eww"))
    (eww-mode)
    (eww url)))

(defun question()
  "insert char is question"
  (interactive)
  (insert "?"))

(global-set-key (kbd "C-o") 'question)
;;;kdb macro new cicle
(global-set-key (kbd "\e[") 'kmacro-cycle-ring-next)

(setq google-translate-translation-directions-alist '(("en" . "ru")))



;;;litable mode kakoy-to;;;
(require 'litable)

(defun egor-shutdown()
  (interactive)
  (insert "shutdown -h now"))
(global-set-key (kbd "<f10>") 'egor-shutdown)

(defun jquery()
  "common https jquery"
  (interactive)
  (insert
   "<script src='https://code.jquery.com/jquery-3.5.0.js'></script>")
  (insert
   "<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>"))

;;определяем реализацию коммон лисп
(require 'cl)
(setq-default inferior-lisp-program "sbcl")
;;настроем пакетный менеджер емакс
;;Package manager
;;initialise package and add melpa repositoru
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(defvar required-packages '(slime
                            smartparens
                            auto-complete))
(defun packages-installed-p ()
  (loop for package in required-packages
        unless (package-installed-p package)
          do (return nil)
          finally (return t)))

(unless (packages-installed-p)
  (package-refresh-contents)
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package))))
;;setting our packages
(when (packages-installed-p)
  (require 'smartparens-config)
  (smartparens-global-mode)

  (require 'auto-complete-config)
  (ac-config-default)
  (global-auto-complete-mode t)
  (setq-default ac-auto-start t)
  (setq-default ac-auto-show-menu t)
  (defvar *sources* (list
                     'lisp-mode
                     'ac-source-semantic
                     'ac-source-functions
                     'ac-source-variables
                     'ac-source-dictionary
                     'ac-source-words-in-all-buffer
                     'ac-source-files-in-current-dir))
  (let (source)
    (dolist (source *sources*)
      (add-to-list 'ac-sources source)))
  (add-to-list 'ac-modes 'lisp-mode)

  (require 'slime)
  (require 'slime-autoloads)
  (slime-setup '(slime-asdf
                 slime-fancy
                 slime-indentation))
  (setq-default slime-net-coding-system 'utf-8-unix))
;;;setting indent-otstypi for lisp
(setq-default lisp-body-indent 2)
(setq-default lisp-indent-function 'common-lisp-indent-function)


;;my plagin for html;;;
(defun kung-fu-html
    ()
  (interactive)
  (insert "<!doctype html>")
  (insert "\n")
  (insert "<html lang='en'>")
  (insert "\n")
  (insert "<head>")
  (insert "\n")
  (insert "<meta charset='utf-8'>")
  (insert "\n")
  (insert "<meta name='viewport' content='width=device-width, initial-scale=1.0'>")
  (insert "\n")
  (insert "<meta http-equiv='X-UA-Compatible' content='ie=edge'>")
  (insert "\n")
  (insert "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>")
  (insert "\n")
  (insert "<link rel='stylesheet' href='style.css'>")
  (insert "\n")
  (insert "<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>")
  (insert "\n")
  (insert "<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>")
  (insert "\n")
  (insert "<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>")
  (insert "\n")
  (insert "<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>")
  (insert "\n")
  (insert "<title>master</title>")
  (insert "\n")
  (insert "<script src='function.js'></script>")
  (insert "\n")
  (insert "</head>")
  (insert "\n")
  (insert "<body>")
  (insert "\n")
  (insert "<h1>master</h1>")
  (insert "\n")
  (insert "</body>")
  (insert "\n")
  (insert "</html>"))

;;this sfera cleans-up-ubiraet pervie stroki
(defun help-cleans-up
    ()
  (interactive)
  (dotimes (i 60)
    (next-line)
    (delete-char 1)))

;;this is php go
(defun phpg
    ()
  (interactive)
  (insert "<?php   ")
  (insert "\n")
  (insert "\n")
  (insert "\n")
  (next-line -2))
(global-set-key (kbd "C-c 4") 'phpg)


(defun variablePHP
  ()
  (interactive)
  (insert "<?php  ;?>")
  (left-char 3))
(global-set-key (kbd "C-c p") 'variablePHP)



;;;egor put enter
(defun egor-put-enter
  ()
  (interactive)
  (dotimes (i 40)
    (search-forward "</")
    (search-forward ">")
    (insert "\n") i))


(defun url-name
  ()
  (interactive)
  (insert "\n")
  (insert (buffer-file-name))
  (search-backward "/http/")
  (delete-char 5)
  (delete-char -7))

(defun after-matches
  ()
  (interactive)
  (insert "() ")
  (insert "{")
  (insert "\n")
  (insert "\n")
  (insert "}")
  (next-line -1))
(global-set-key (kbd "C-c j") 'after-matches)

(defun after-matches-with-args
  ()
  (interactive)
  (insert "() ")
  (insert "{")
  (insert "\n")
  (insert "\n")
  (insert "}")
  (search-backward ")"))

(global-set-key (kbd "C-c C-i") 'after-matches-with-args)


(defun xah-title-case-region-or-line (@begin @end)
  "Title case text between nearest brackets, or current line, or text selection.
Capitalize first letter of each word, except words like {to, of, the, a, in,
or, and, …}. If a word already contains cap letters such as HTTP, URL, theye are left as is.
When called in a elisp program, *begin *end are region boundaries.
URL `http://ergoemacs.org/emacs/elisp_title_case_text.html'
Version 2017-01-11"
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (let (
           $p1
           $p2
           ($skipChars "^\"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕"))
       (progn
         (skip-chars-backward $skipChars (line-beginning-position))
         (setq $p1 (point))
         (skip-chars-forward $skipChars (line-end-position))
         (setq $p2 (point)))
       (list $p1 $p2))))
  (let* (
         ($strPairs [
                     [" A " " a "]
                     [" And " " and "]
                     [" At " " at "]
                     [" As " " as "]
                     [" By " " by "]
                     [" Be " " be "]
                     [" Into " " into "]
                     [" In " " in "]
                     [" Is " " is "]
                     [" It " " it "]
                     [" For " " for "]
                     [" Of " " of "]
                     [" Or " " or "]
                     [" On " " on "]
                     [" Via " " via "]
                     [" The " " the "]
                     [" That " " that "]
                     [" To " " to "]
                     [" Vs " " vs "]
                     [" With " " with "]
                     [" From " " from "]
                     ["'S " "'s "]
                     ["'T " "'t "]
                     ]))
    (save-excursion
      (save-restriction
        (narrow-to-region @begin @end)
        (upcase-initials-region (point-min) (point-max))
        (let ((case-fold-search nil))
          (mapc
           (lambda ($x)
             (goto-char (point-min))
             (while
                 (search-forward (aref $x 0) nil t)
               (replace-match (aref $x 1) "FIXEDCASE" "LITERAL")))
           $strPairs))))))
(global-set-key (kbd "\en") 'xah-title-case-region-or-line)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq password-for-template-monster '(template))

(global-set-key (kbd "C-c c") 'comment-region)


(defun shell-7z
  (arg)
  (interactive "s")
  (insert "7z x -o/srv/http/")
  (insert arg))
(global-set-key (kbd "C-c 7") 'shell-7z)

(defun one-window-one
  ()
  (interactive)
  (delete-other-windows)
  (split-window-below)
  (other-window 1))
(global-set-key (kbd "C-c 1") 'one-window-one)

(defun for-css-matches
  ()
  (interactive)
  (insert "  {")
  (insert "\n")
  (insert "\n")
  (insert "}")
  (next-line -1))
(global-set-key (kbd "C-c 2") 'for-css-matches)

;;how do i disable backup files
(add-hook 'dired-load-hook
          (lambda ()
            (require 'dired-x)))
;;how i must friendly emacs with firefox?
(use-package edit-server
             :ensure t
             :commands edit-server-start
             :init (if after-init-time
                       (edit-server-start)
                       (add-hook 'after-init-hook
                                 #'(lambda() (edit-server-start))))
             :config (setq edit-server-new-frame-alist
                           '((name . "Edit with Emacs FRAME")
                             (top . 200)
                             (left . 200)
                             (width . 80)
                             (height . 25)
                             (minibuffer . t)
                             (menu-bar-lines . t)
                             (window-system . x))))

;; (setq password-in-firefox '(#include<sfira(keter)>))

(defun mathes-after-fun-endif
  ()
  (interactive)
  (insert "() ")
  (left-char -1)
  (insert " : ")
  (insert "\n"))
(global-set-key (kbd "C-c o") 'mathes-after-fun-endif)

;;;i wont create register in name
(set-register ?` '("
$servername = 'localhost';
$username = 'employeer';
$password = 'company';
$dbname = 'company';

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
die('connection failled! '.$conn->connect_error);
}

"))

(set-register ?1 '("/srv/http/"))

(set-register ?2 '("/srv/http/wordpress/wp-content/themes/"))

(set-register ?3 '("/srv/http/wordpress/wp-content/plugins/"))

(set-register ?. '("echo '<script>console.log()</script>';"))

(set-register ?b '(".'<br>'"))

(set-register ?e '(" => "))

(set-register ?0 '("*scratch*"))

(set-register ?j '("tags-search"))

(set-register ?l '("tags-loop-continue"))

;;;macro defun for html
(defun zz-search-and-replace
    ()
  (interactive)
  (dotimes (i 4)
    (search-forward "#")
;;    (kill-word 1)
    (delete-char -1)
    (insert "index.html")i))

;;i want looking how install browser in emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (if window-system                                         ;;
;;     (setq browse-url-browser-function 'browse-url-generic ;;
;;           browse-url-generic-program "web-browser")       ;;
;;     (setq browse-url-browser-function 'my-browse))        ;;
;; (defun my-browse (url &rest ignore)                       ;;
;;   "Browse URL using w3m."                                 ;;
;;   (interactive "sURL: ")                                  ;;
;;   (shell-command (concat "w3m " url))                     ;;
;;   (pop-to-buffer "*Shell Command Output*")                ;;
;;   (setq truncate-lines t))                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;add seamonkey
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my-browse-url-qutebrowser-new-tab (url &optional new-window)                    ;;
;;   ;; new-window ignored                                                                ;;
;;   "Open URL in a new tab in Qutebrowser."                                              ;;
;;   (interactive (browse-url-interactive-arg "URL: "))                                   ;;
;;   (unless                                                                              ;;
;;       (string= ""                                                                      ;;
;;                (shell-command-to-string                                                ;;
;;                 (concat "qutebrowser -remote 'openURL(" url "localhost/wordpress)'"))) ;;
;;     (message "Starting Qutebrowser...")                                                ;;
;;     (start-process (concat "qutebrowser " url) nil "qutebrowser" url)                  ;;
;;     (message "Starting Qutebrowser...done")))                                          ;;
;;                                                                                        ;;
;; (setq browse-url-browser-function 'my-browse-url-qutebrowser-new-tab)                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;search in dired mode
(global-set-key (kbd "\eU") 'dired-isearch-filenames)
;;;
(global-set-key (kbd "\eo") 'kmacro-end-or-call-macro-repeat)

;;set in command bash touch and chmod
(defun touch
  (parameter)
  (interactive "s")
  (insert "touch ")
  (insert parameter)
  (insert " && chmod -R 777 ")
  (insert parameter))
(global-set-key (kbd "C-c 5") 'touch)

;;set database in sql example good
(defun sql-example
    ()
  (interactive)
  (insert "
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
START TRANSACTION;
SET time_zone = '+00:00';

CREATE TABLE `students` (
  `id` int(255) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `age` int(255) NOT NULL,
  `group` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_name`, `age`, `group`) VALUES
(1, 'ram', 23, 'mumbai'),
(4, 'Raman', 21, 'noida'),
(5, 'Sunny', 40, 'mumbai'),
(6, 'Amrit', 24, 'ferozepur'),
(7, 'Roop', 28, 'jalandar'),
(8, 'Prince', 24, 'ferozepur');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;
"))


;;;; comment box
(global-set-key (kbd "C-c 0") 'comment-box)
(global-set-key (kbd "C-c -") 'uncomment-region)

;; switch buffer
;; at first unset keybinding
(global-unset-key (kbd "C-x ;"))
(global-unset-key (kbd "C-;"))
(global-set-key (kbd "C-x ;") 'switch-to-buffer)
(fset 'trans-me
   [?\C-x ?\; return])
(global-set-key (kbd "C-;") 'trans-me)


;;; bootstrap insert
(defun bootstrap-insert
  ()
  (interactive)
  (insert "
<!DOCTYPE html>
<html lang='en'>
    <head>
        <title>Bootstrap Example</title>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
        <style>
         h2,p { text-align: center; margin: 0px auto; display: block;}
        </style>
    </head>
    <body>
        <div class='container'>
            <h2>crud my api</h2>
            <p>crud my api</p>
                <div id='welcome'>
                    <table class='table table-bordered'>
                        <input id='name' type='text' value=''/>
                        <input type='submit' id='send' value='go'>
                    </table>
                </div>
        </div>
        <script src='function.js'></script>
    </body>
</html>
"))

;; configure my register positions
(global-set-key (kbd "C-x j") 'jump-to-register)



;; insert into registrer data
(global-unset-key (kbd "C-x i"))
(global-set-key (kbd "C-x i") 'insert-register)
;; unset alt-h
(global-unset-key (kbd "\eh"))
;; setting web mode
(global-set-key (kbd "C-c w") 'web-mode)
(global-unset-key (kbd "\ej"))
(global-set-key (kbd "\ej") 'kill-word)



;; insert my keymacro
(fset 'mysql-company
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 115 104 101 108 108 return 109 121 115 113 108 return 117 115 101 32 99 111 109 97 backspace 112 97 110 121 59 return 17 107] 0 "%d")) arg)))
(global-set-key (kbd "C-x n m") 'mysql-company)
;; change copy -to register


;;bookmark set keyboard
(global-unset-key (kbd "C-x l"))
(global-set-key (kbd "C-x l") 'bookmark-jump)
(global-unset-key (kbd "C-x C-l"))
(global-set-key (kbd "C-x C-l") 'bookmark-jump)

;;touch template for lesson
(global-unset-key (kbd "C-x 4 0"))
(global-unset-key (kbd "C-x 4 9"))
(fset 'EXAMPLE
   [f11 ?m ?k ?d ?i ?r ?  ?e ?x ?a ?m ?p ?e backspace ?l ?e ?\M-b ?\M-u return ?c ?d ?  ?E ?X ?A ?M ?P ?L ?E return ?t ?o ?u ?c ?h ?  ?i ?n ?d ?e ?x ?. ?h ?t ?m ?l ?  ?f ?u ?n ?c ?t ?i ?o ?n ?. ?j ?s ?  ?s ?t ?y ?l ?e ?. ?c ?s ?s ?  ?m ?o ?d ?e ?l ?. ?p ?h ?p ?  ?s ?o ?u ?r ?c ?e ?. ?s ?q ?l ?  ?s ?e ?r ?v ?e ?r ?. ?p ?h ?p return ?\C-x ?k return ?y ?g ?\C-s ?E ?x ?a backspace backspace ?X return return])
(global-set-key (kbd "C-x 4 0") 'EXAMPLE)
;; delete example
(fset 'delete-example
   [f11 ?r ?m ?  ?- ?r ?  ?E ?X ?A ?M ?P ?L ?E return ?\C-x ?k return ?y ?g])
(global-set-key (kbd "C-x 4 9") 'delete-example)

;; unset someting right
(global-unset-key (kbd "C-x <SPC>"))
;; point to register
(global-set-key (kbd "C-x <SPC>") 'point-to-register)

;; some important change - i love my-notation variable - my_variable, but so hart

(defun symbol-tag
    ()
  (interactive)
  (insert (message "<>"))
      (left-char 1))
(global-unset-key (kbd "C--"))
(global-set-key (kbd "C--") 'symbol-tag)


(fset 'nota
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("_" 0 "%d")) arg)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;I'm doing unset
(global-unset-key (kbd "C-x u"))
;; more free - c-x w
(global-unset-key (kbd "C-x o"))
;; free - c-x p
;; free - c-x x  , c-x c,
;; my copy good from register x
(fset 'copy-good
   [?\C-a ?\C-  ?\C-e ?\C-x ?e ?x])
(global-set-key (kbd "C-x u") 'copy-good)

;; display change - state fullscreen - it very not simple
(defun i-wont-to-fullscreen
    ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))


;; impove my translate
(global-set-key (kbd "C-c 6") 'google-translate-smooth-translate)

(fset 'translator-english
   [?\C-c ?6 return])
(global-set-key (kbd "\es") 'translator-english)
(global-set-key (kbd "C-x x") 'translator-english)

;; grating lisp for js for for loop
(defun for-js
    (number_size)
  (interactive "s")
  (insert "(for i=0; i<=")
  (insert (message number_size))
  (insert "; i++) {

}")
  (previous-line 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun for-php
    (number_size)
  (interactive "s")
  (insert "(for $i=0; $i<=")
  (insert (message number_size))
  (insert "; $i++) {

}")
  (previous-line 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my perfect enter for display direct mode
(global-unset-key (kbd "C-x d"))

(fset 'dired-my
   [?\M-x ?d ?i ?r ?e ?d return return])
(global-set-key (kbd "C-x d") 'dired-my)
(global-set-key (kbd "C-.") 'dired-my)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; comment for html
(defun html-comment
    (argument)
  (interactive "s")
  (insert "<!-- ")
  (insert (message argument))
  (insert " -->"))
(global-set-key (kbd "C-c C-c C-c") 'html-comment)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;my jump!
(global-unset-key (kbd "C-x x"))
(global-unset-key (kbd "C-x C-x"))
(global-set-key (kbd "C-x C-j") 'bookmark-set)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'repeat)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my magit git status
(global-set-key (kbd "C-'") 'magit-status)
;;; my register for git-hub
(set-register ?n '("EgorAldebaran"))
(set-register ?p '("090457GLmD"))

;;; my register

(set-register ?4 '("/home/egor/"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;how create new window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-unset-key (kbd "C-x -"))
(global-set-key (kbd "C-x -") 'make-frame-command)
(global-set-key (kbd "C-x 9") 'delete-frame)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;my lisper git clone
(defun egor-git-clone
    (egor-git)
  (interactive "s")
  (insert "git clone https://github.com/EgorAldebaran/")
  (insert (message egor-git))
  (insert ".git"))
(global-set-key (kbd "C-c g") 'egor-git-clone)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-unset-key (kbd "<f5>"))
(global-set-key (kbd "C-x n a") 'replace-string)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;my dired - up
(fset 'dired-up
   "^")
(global-set-key (kbd "C-x p") 'dired-up)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x n e") 'emmet-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun next-line-10-down
    ()
  (interactive)
  (next-line 10))
(global-unset-key (kbd "C-x n n"))
(global-unset-key (kbd "C-x C-n"))
(global-set-key (kbd "C-x n n") 'next-line-10-down)
(global-set-key (kbd "C-x C-n") 'next-line-10-down)

(defun next-line-10-up
    ()
  (interactive)
  (next-line -10))
(global-unset-key (kbd "C-x n p"))
(global-set-key (kbd "C-x n p") 'next-line-10-up)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x n w") 'web-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;i wont kill all text in this page example
(global-unset-key (kbd "C-q"))
(fset 'kill-all-text
   "\C-xh\C-?")
(global-set-key (kbd "C-q k") 'kill-all-text)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;freer c-x a and c-<
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w") 'save-buffer)
(global-set-key (kbd "C-x w") 'kill-region)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-unset-key (kbd "<f2>"))
(global-set-key (kbd "<f2>") 'abbrev-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-unset-key (kbd "C-x a g"))
(global-set-key (kbd "C-x a j") 'add-global-abbrev)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;my greating tags working!!!;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'mega-dired
   [?\M-x ?d ?i ?r ?e ?d return return])
(global-unset-key (kbd "C-M-d"))
(global-set-key (kbd "C-M-d") 'mega-dired)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;my-go-url
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x o") 'copy-to-register)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'eww-go
   [return return return return return return return return return ?\C-p ?\C-p ?\C-p ?\C-p ?\M-x ?u ?r ?l ?- ?n ?a ?m ?e return ?l ?o ?c ?a ?l ?h ?o ?s ?t ?\C-a ?\C-  ?\C-e ?\C-x ?o ?< ?\M-d ?\M-x ?e ?w ?w return ?\C-x ?i ?< return ?\M-d ?\C-a ?\C-k ?\C-k ?\C-k ?\C-k ?\C-k])
(global-set-key (kbd "C-x n g") 'eww-go)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;matrix;;;;;
(fset 'matrix-go
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 99 117 115 116 111 109 105 122 101 45 116 104 101 109 101 115 return 19 109 97 116 114 105 120 1 return 113] 0 "%d")) arg)))
(global-set-key (kbd "<f5>") 'matrix-go)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my restart eww

(global-unset-key (kbd "C-0"))
(fset 'refresh-save
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\344g\344" 0 "%d")) arg)))

(global-set-key (kbd "C-0") 'refresh-save)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;my abbrev
(define-abbrev-table 'global-abbrev-table '(
                                            ("f" "function" nil 1)
                                            ("e" "=>" nil 1)
                                            ("j" "->" nil 1)
                                            ("ar" "array" nil 1)
                                            ("bld" "<?php  bloginfo('template_directory');?>" nil 3)
                                            ("ec" "echo" nil 1)
                                            ("qq" "?>" nil 1)
                                            ("gtdu" "get_template_directory_uri()" nil 4)
                                            ("arr" "array()" nil 1)
                                            ("hcm" "<!-- -->")
                                            ("blg" "bloginfo" nil 1)
                                            ("cp" "cp -r" nil 1)
                                            ("restart" "sudo systemctl restart httpd" nil 4)
                                            ) )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;php-mode
(global-set-key (kbd "<f3>") 'php-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;my problems is coding system maybe
;;(coding-system-get 'iso-latin-1 :mime-charset)

;;(coding-system-get 'iso-2022-cn :mime-charset)

;;(coding-system-get 'cyrillic-koi8 :mime-charset)
