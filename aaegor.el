;;;*****************************************************************************
;;;*****************************************************************************
;;;**********************************                    ***********************
;;;**********************************  hi EYRVH           **********************
;;;**********                           welcome to the     *********************
;;;*************                                MATRIX   ***********************
;;;*******************************                       ***********************
;;;***************************  from the ALDEBARAN      ************************
;;;****************************                        *************************
;;;*****************************                     ***************************
;;;**************************                    *******************************
;;;*************************                     *******************************
;;;*************************                    ********************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;*****************************************************************************
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'load-path "-/.emacs.d")

;;;;;;; if need load some file lisp

(load "/home/egor/.emacs.d/example.el")



(require 'package)

;; Require Pacckage Melpa

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa"        . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize nil)


(unless (package-installed-p 'use-package)
  (message "EMACS install use-package.el")
  (package-refresh-contents)
  (package-install 'use-package))


(require 'use-package)
(setq use-package-always-ensure t)


(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory) user-emacs-directory)
        ((boundp 'user-init-directory) user-init-directory)
        (t "~/.emacs.d/")))


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

;;;;;after after mathec после скобочек вызывающей функции для php

(fset 'php-fun-fun
   (kmacro-lambda-form [?\( ?\C-e ?  ?\{ return] 0 "%d"))
(global-set-key (kbd "C-c j") 'php-fun-fun)



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
   (kmacro-lambda-form [?\C-x ?\; return] 0 "%d"))

(global-set-key (kbd "C-;") 'trans-me)


;  ;; bootstrap insert
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
;;; if you want choose database for open her - change store in register number 7
;;; just write name database and emacs do it itself!!!
(fset 'mega-mysql
   (kmacro-lambda-form [?\M-b ?\C-  ?\M-f ?\C-x ?o ?7 ?\M-b ?\M-j ?\M-x ?s ?h ?e ?l ?l return ?m ?y ?s ?q ?l return ?u ?s ?e ?  ?\C-x ?i ?7 ?\; return ?\C-x ?h ?\C-?] 0 "%d"))
(global-set-key (kbd "C-x n m") 'mega-mysql)
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
;;(defun i-wont-to-fullscreen
;;    ()
;;  (interactive)
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
;;;;

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
(fset 'matrix
   (kmacro-lambda-form [?\M-x ?c ?u ?s ?t ?o ?m ?i tab ?- ?t ?h ?e ?m ?e ?s return ?\C-s ?m ?a ?t ?r ?i ?x ?\C-a return ?q] 0 "%d"))
(global-set-key (kbd "<f5>") 'matrix)
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
                                            ("ej" "=>" nil 1)
                                            ("j" "->" nil 1)
                                            ("ar" "array" nil 1)
                                            ("bld" "<?php  bloginfo('template_directory');?>" nil 3)
                                            ("ec" "echo" nil 1)
                                            ("fj" "<?php " nil 1)
                                            ("jf" "?>" nil 1)
                                            ("gtdu" "get_template_directory_uri()" nil 4)
                                            ("arr" "array()" nil 1)
                                            ("hcm" "<!-- -->")
                                            ("blg" "bloginfo" nil 1)
                                            ("cp" "cp -r" nil 1)
                                            ("rstrt" "sudo systemctl restart httpd" nil 4)
                                            ("br" "<br>" nil 1)
                                            ("ecb" "echo '<br>'" nil 2)
                                            ("opn" "{" nil 1)
                                            ("cls" "}" nil 1)
                                            ("leles" "<" nil 1)
                                            ("hsjf" "halloween_store" nil 1)
                                            ("hp" "halloween_plugin" nil 1)
                                            ("rn" "return" nil 1)
                                            ("th" "the" nil 1)
                                            ("crt" "CREATE" nil 1)
                                            ("rdrb" "ORDER BY" nil 2)
                                            ("dsc" "DESC" nil 1)
                                            ("ins" "INSERT INTO" nil 2)
                                            ("tbl" "TABLE" nil 1)
                                            ("slct" "SELECT" nil 1)
                                            ("frm" "FROM" nil 1)
                                            ("ltr" "ALTER" nil 1)
                                            ("whr" "WHERE" nil 1)
                                            ("cnt" "COUNT" nil 1)
                                            ("dlt" "DELETE" nil 1)
                                            ("grp" "GROUP" nil 1)
                                            ("jn" "JOIN" nil 1)
                                            ("ebr" "echo '<br>';" nil 2)
                                            ("zz" "<" nil 1)
                                            ("re" "return" nil 1)
                                            ("fore" "foreach" nil 1)
                                            ("docjs" "document.getElementById" nil 1)
                                            ("line" "lineTo" nil 1)
                                            ("archive0" "7z x" nil 2)
                                            ("def" "defun" nil 1)
                                            ("th" "$this->" nil 1)
                                            ("tt" "touch" nil 1)
                                            ("mk" "mkdir" nil 1)
                                            ("ind" "touch index.php" nil 2)
                                            ("pbf" "public function" nil 2)
                                            ("oo" "object" nil 1)
                                            ("cl" "class" nil 1)
                                            ("pub" "public" nil 1)
                                            ("pr" "private" nil 1)
                                            ("pri" "print" nil 1)
                                            ("cnstr" "public function __construct()" nil 3)
                                            ("qq" "<<" nil 1)
                                            ("qqq" "<<<" nil 1)
                                            ("prot" "protected" nil 1)
                                            ("p" "public" nil 1)
                                            ("abs" "abstract" nil 1)
                                            ("ext" "extends" nil 1)
                                            ("q" "<" nil 1)
                                            ("str" "string" nil 1)
                                            ("intr" "interface" nil 1)
                                            ("impl" "implements" nil 1)
                                            ("td" "<td>" nil 1)
                                            ("ltd" "</td>" nil 1)
                                            ("tr" "<tr>" nil 1)
                                            ("ltr" "</tr>" nil 1)
                                            ("href" "<a href=" nil 1)
                                            ("la" "</a>" nil 1)
                                            ("vl" "VALUES" nil 1)
                                            ("upd" "UPDATE" nil 1)
                                            ("thead" "<thead>" nil 1)
                                            ("lthead" "</thead>" nil 1)
                                            ("tbody" "<tbody>" nil 1)
                                            ("vr" "VARCHAR" nil 1)
                                            ("st" "SET" nil 1)
                                            ("vls" "VALUES" nil 1)
                                            ("vd" "var_dump" nil 1)
                                            ("sys" "systemctl" nil 1)
                                            ("ba" "bash" nil 1)
                                            ) )
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;php-mode
(global-set-key (kbd "<f3>") 'php-mode)
;;;something about abbrev mode
(setq save-abbrevs 'silent)
;;;;наверное это делает постоянным абрев мод
(setq-default abbrev-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;my problems is coding system maybe
;;(coding-system-get 'iso-latin-1 :mime-charset)

;;(coding-system-get 'iso-2022-cn :mime-charset)

;;(coding-system-get 'cyrillic-koi8 :mime-charset)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;exit mode
(fset 'exit
   (kmacro-lambda-form [?\C-x ?k return ? ] 0 "%d"))
(global-set-key "\eq" 'exit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;my copy very power
;;;;перед тем как пользоваться нужно разделить экран на две части сверху акцептор-вампир снизу донор
;;;;установить курсор перед донором чтобы сверху окно над располагалось место куда
;;; for direct cp -R
(fset 'direct-copy
   (kmacro-lambda-form [?\C-  ?\C-e ?\C-x ?o ?c ?\M-d ?\M-< ?\C-  ?\C-e ?\C-b ?\C-x ?o ?x ?\M-d ?\M-! ?c ?p ?  ?- ?R ?  ?\C-x ?i ?c ?  ?\C-x ?i ?x return ?\M-d ?g ?n ?n ?n ?n] 0 "%d"))
(global-unset-key (kbd "C-x q"))
(global-set-key (kbd "C-x q d") 'direct-copy)
;;; for file cp -r
(fset 'file-copy
   (kmacro-lambda-form [?\C-  ?\C-e ?\C-x ?o ?c ?\M-d ?\M-< ?\C-  ?\C-e ?\C-b ?\C-x ?o ?x ?\M-d ?\M-! ?c ?p ?  ?r ?  backspace backspace ?- ?r ?  ?\C-x ?i ?c ?  ?x ?i ?\C-? ?\C-? ?\C-x ?i ?x return ?\M-d ?g ?g ?\M->] 0 "%d"))
(global-set-key (kbd "C-x q f") 'file-copy)

(defun gnu-comments-plugins
    (arg)
  (interactive "s")
  (insert "
<?php
/*
Plugin Name: ")
  (insert (message arg))
  (insert "
Plugin URI: http://webdevstudios.com/support/wordpress-plugins/
Description: Create a Halloween Store to display product information
Version: 1.0
Author: Brad Williams
Author URI: http://webdevstudios.com
License: GPLv2
*/

/*  Copyright 2013  Brad Williams  (email : brad@webdevstudios.com)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/
"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;include ajax api
(defun ajax
    ()
  (interactive)
  (insert "
<script src= 'http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js'>
"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; sr-speedbar is deprecated
(require 'sr-speedbar)
;;;;; my ecb
(require 'ecb)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-unset-key (kbd "\ep"))
(global-set-key (kbd "\ep") 'helm-imenu)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; this mode very good mode!!!
(ac-config-default)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;yasnippet;;;;;;;;;;;;;;
(add-to-list 'load-path
             "~/path-to-yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(global-set-key (kbd "TAB") 'yas-expand)

(global-set-key (kbd "C-c n") 'yas-new-snippet)
(global-set-key (kbd "C-c i") 'yas-insert-snippet)
(global-set-key (kbd "C-c v") 'yas-visit-snippet-file)




(provide 'dropdown-list)
(setq yas-prompt-function '(yas-dropdown-prompt
                            yas-ido-prompt
                            yas-completin-prompt))

;;;;;global mark ring
(setq mark-ring-max 4)
(setq global-mark-ring-max 4)
;;;;again helm metal
(require 'helm)
(require 'helm-config)
;;(global-set-key (kbd "M-x") 'helm-M-x)

(setq helm-M-x-fuzzy-match t)
(helm-mode 1)

;;;best  practik very cool band symbolic cool night
(global-set-key (kbd "C-q q") 'helm-all-mark-rings)
;;;;;;my project - the mail client mu4e and mu and offlineImap
;;;change language
(global-set-key (kbd "C-<return>") 'toggle-input-method)
;;;;;;;;
(global-set-key (kbd "C-x <return>") 'kmacro-end-or-call-macro-repeat)

(global-set-key (kbd "C-q TAB") 'delete-other-windows)

(global-set-key (kbd "C-M-p") 'scroll-down-command)
(global-set-key (kbd "C-M-n") 'scroll-up-command)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; my fun for scratch
(defun open-scratch
    ()
  "open to scratch"
  (interactive)
  (find-file "*scratch*"))
(global-unset-key (kbd "\e0"))
(global-set-key (kbd "\e0") 'open-scratch)

;;;;;send mail using postfix
(setq send-mail-function 'sendmail-send-it)

(setq message-send-mail-function 'message-send-mail-with-sendmail)
(global-set-key (kbd "<f9>") 'eww)

;;;;my special mode for learning
(global-set-key (kbd "C-q C-2") 'previous-line)
(global-set-key (kbd "C-q C-1") 'next-line)
(global-set-key (kbd "C-q <tab>") 'next-line)
(global-set-key (kbd "C-q C-<tab>") 'previous-line)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;for init my EgorAldebaran for github;;;;
;;;;just press m-x github-init and name your repositary;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun github-init
    (name-repository)
  "укажи имя репозитория и туда отправиться начальный файл README.md  остальное сделает git-magit"
  (interactive "s")
  (insert "echo '# ")
  (insert (message name-repository))
  (insert "' >> README.md;")
  (insert "
git init; git add README.md; git commit -m 'first commit'; git branch -M main;
git remote add origin https://github.com/EgorAldebaran/")
  (insert (message name-repository))
  (insert ".git;")
  (insert "git push -u origin main")
  )
;;;;;;;;;;;;;;;just press github-init;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;my sql statements;;;;;;;;;;;;;;;;;;;;;
(load "/home/egor/.emacs.d/sql.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;new future послу скобочек ставлю запятую
(fset 'после-ставлю-скобочки-и-запятую
   (kmacro-lambda-form [?\( ?\C-e ?\; return] 0 "%d"))
(global-set-key (kbd "C-c ;") 'после-ставлю-скобочки-и-запятую)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;заполняет значениями из полей в конструктор ВНИМАНИЕ только на 4 переменных если больше или меншье нужно подготовить
(fset 'CONSTRUCTOR
   (kmacro-lambda-form [?\C-r ?$ ?\C-f ?\C-  ?\M-f ?\C-x ?o ?4 ?\C-p ?\M-b ?\C-  ?\M-f ?\C-x ?o ?3 ?\C-p ?\M-b ?\C-  ?\M-f ?\C-x ?o ?2 ?\C-p ?\M-b ?\C-  ?\M-f ?\C-x ?o ?1 ?\C-s ?c ?o ?n ?s ?t ?r ?u ?\M-f ?\C-f ?\C-x ?i ?1 ?\M-b ?\M-i ?\M-f ?, ?  ?\C-x ?i ?2 ?\M-b ?\M-i ?\M-f ?, ?  ?\C-x ?i ?3 ?\M-b ?\M-i ?\M-f ?, ?  ?\C-x ?i ?4 ?\M-b ?\M-i ?\C-e ?\{ return ?t ?h ?  ?\C-x ?i ?1 ?  ?= ?  ?\M-i ?\C-x ?i ?1 ?\; return ?t ?h ?  ?\C-x ?i ?2 ?  ?= ?  ?\M-i ?\C-x ?i ?2 ?\; return ?t ?h ?  ?\C-x ?i ?3 ?  ?= ?  ?\M-i ?\C-x ?i ?3 ?\; return ?t ?h ?  ?\C-x ?i ?4 ?  ?= ?  ?\M-i ?\C-x ?i ?4 ?\;] 0 "%d"))
(global-set-key (kbd "C-c 1") 'CONSTRUCTOR)



(require 'gnu-elpa-keyring-update)




(defun launch-separate-emacs-in-terminal ()
  (suspend-emacs "fg ; emacs -nw"))

(defun launch-separate-emacs-under-x ()
  (call-process "sh" nil nil nil "-c" "emacs &"))

(defun restart-emacs ()
  (interactive)
  ;; We need the new emacs to be spawned after all kill-emacs-hooks
  ;; have been processed and there is nothing interesting left
  (let ((kill-emacs-hook (append kill-emacs-hook (list (if (display-graphic-p)
                                                           #'launch-separate-emacs-under-x
                                                         #'launch-separate-emacs-in-terminal)))))
    (save-buffers-kill-emacs)))


;;;;;;
(defun Время
    ()
  (interactive)
  (insert "

О Время пляшешь ты сурово
Под дудку жизни озорной
Пророчишь людям что есть ново
Даря со временем покой

Ты никогда не умираешь
Лишь ускользаешь не спеша
Секунды дни летят годами
И все уходит приходя

Ты оставляешь людям память
И грусть о том что не вернуть
И словно птицей улетаешь
В небесный безвозвратный путь

В своих руках необозримых
Ты держишь вечность  и весь мир
Как воздух нам необходимо
Но не всегда им дорожим

И мы живя не знаем сами
Что ожидает завтра нас
Лишь нужно нам его дождаться
Оно расставит все в тот час

А люди мчатся словно ветер
Рождаясь вновь и уходя
Морщинки время оставляет
Смеясь над нами и шутя

Порой никто не замечает
Как быстро может все пройти
И важных слов и чувств признания
Мгновение может унести

Спешите жить любить спешите
Успейте в жизни все сказать
И самым главным дорожите
Чтоб то что есть не потерять

"))

(defun Лирика
    ()
  (interactive)
  (insert "

Стих номер 2

Моя любовь как океан
Который трудно исчерпать
Но в нем огонь а не вода
Который может обжигать
И что согласна ты сгореть
В тех чувствах боли и тепла?
Ведь будешь вечно умирать
Не зная что с тобой сама

Стих номер 3

В тишине я молю
О приди мой герой
Лишь тебя призываю
Жду встречи с тобой
Ты ушел незаметно
Тебя больше нет
Но запомнила взгляд твой
И твой силуэт

Попрощавшись однажды
Не встречу тебя
Ты забудь мне сказал
А забудешь меня?
И порою осенней
Как лист в сентябре
Жухну вяну скучаю
Неизбежность в судьбе

И устало все будет
А что впереди?
Чувства зимней природы
А что позади?
И чуть слышные звуки играет рояль
Словно в памяти слышно
- забудь и прощай -

"))
