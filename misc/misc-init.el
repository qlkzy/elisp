;; Miscellaneous Customisations

(require 'misc)

(require 'drm-elisp-misc)
(require 'drm-text-manipulation)
(require 'drm-buffer-manipulation)

;; Load Other Misc Files

(load-file "~/elisp/misc/humour.el")
(load-file "~/elisp/misc/keywiz.el")
(load-file "~/elisp/misc/w32-fullscreen.el")

;; Other modules we would like
(require 'generic-x)

;; Remove Annoyances

;;; We want to rebind yes-or-no-p because it's annoying, but we still
;;; want to be able to use yes-or-no-p to confirm exit.
(fset 'drm-yes-or-no-p (symbol-function 'yes-or-no-p))
(defalias 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs 'drm-yes-or-no-p) ;quit emacs? surely you jest

(setq inhibit-startup-screen t)         ;read

(add-to-list 'default-frame-alist '(cursor-type . bar))

(setq save-abbrevs nil)                 ;configure by hand

(setq make-backup-files nil) ;I like being able to *read* my directory listings

(savehist-mode 1)

;; Remove GUI

;;; We need to test whether menu-bar-mode is non-nil, as the frame
;;; flickers/resizes when we disable it, and reloading gets annoying
(drm-do-if-bound menu-bar-mode 'menu-bar-mode -1)
(drm-do-if-bound tool-bar-mode 'tool-bar-mode -1)

(global-set-key (kbd "<f11>") 'w32-fullscreen)

;; Enable 'Advanced' Features

(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Make abbrev expansion work propely with MixedCase
(setq dabbrev-case-fold-search nil)

(setq-default ps-print-color-p 'black-white)
(setq ps-print-color-p 'black-white)

(setq ps-black-white-faces 
      '((font-lock-builtin-face "black" nil bold)
        (font-lock-comment-face "gray" nil italic)
        (font-lock-constant-face "black" nil bold)
        (font-lock-function-name-face "black" nil)
        (font-lock-keyword-face "gray20" nil bold)
        (font-lock-string-face "gray20" nil italic)
        (font-lock-type-face "black" nil bold)
        (font-lock-variable-name-face "black" nil italic)
        (font-lock-warning-face "black" nil bold italic)))

(setq ps-line-number t)

;; Set Up Load Path

(progn 
  (cd "~/elisp")
  (normal-top-level-add-subdirs-to-load-path) 
  (cd "~/"))


;; Set Up Indentation &c.

(setq-default indent-tabs-mode nil)

(setq-default tab-width 4)

(setq-default tab-stop-list 
              '(4 8 12 16 20 24 28 32 36
                  40 44 48 52 56 60 64 68
                  72 76 80 84 88 92 96 100
                  104 108 112 116 120))


(column-number-mode 1)

;; Bell
(setq ring-bell-function (lambda () nil))



(defun drm-count-chars ()
  (interactive)
  (let ((start (point-min))
        (end (point-max)))
    (when (region-active-p)
      (setq start (region-beginning))
      (setq end (region-end)))
    (message (format "%s" (how-many "." start end)))))
     

(defun drm-count-chars ()
  (interactive)
  (save-excursion
    (unless (region-active-p)
      (goto-char (point-min)))
    (how-many "." nil nil t)))

(defun count-words-buffer ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (message (format "%s" (how-many "\\>")))))
               

;; Magical transparency stuff
(defun drm-increase-opacity ()
  (interactive)
  (let ((a (frame-parameter nil 'alpha)))
    (setq a (if a
                a
              100))
    (if (floatp a)
        (progn
          (setq a (+ a 0.1))
          (when (> a 1.0)
            (setq a 1.0)))
      (progn
        (setq a (+ a 10))
        (when (> a 100)
          (setq a 100))))
    (set-frame-parameter nil 'alpha a)))

(defun drm-decrease-opacity ()
  (interactive)
  (let ((a (frame-parameter nil 'alpha)))
    (setq a (if a
                a
              100))
    (if (floatp a)
        (progn
          (setq a (- a 0.1))
          (when (< a 0.0)
            (setq a 0.0)))
      (progn
        (setq a (- a 10))
        (when (< a 0)
          (setq a 0))))
    (set-frame-parameter nil 'alpha a)))


(global-set-key (kbd "<C-M-kp-add>") 'drm-increase-opacity)
(global-set-key (kbd "<C-M-kp-subtract>") 'drm-decrease-opacity)

;; Really Misc

(setq yow-file "~/elisp/misc/yow.lines")

;; (setq debug-on-error t)

(server-start)

(setq shift-select-mode nil)

(when (>= emacs-major-version 23)
  (set-face-font 'default "Inconsolata-12"))


(transient-mark-mode -1)

(defvar ctrl-l-appearance
  nil
  "String to show for ^L in text")

(setq ctrl-l-appearance
      (vconcat "\n\n\n"
               (make-vector 20 ?-)
               " Page Break "
               (make-vector 20 ?-)
               "\n\n\n\n"))

(unless standard-display-table
  (setq standard-display-table (make-display-table)))

(aset standard-display-table ?\014 ctrl-l-appearance)

(set-scroll-bar-mode 'right)

(setq comment-style 'indent)

(windmove-default-keybindings 'control)

(add-hook 'before-save-hook 'time-stamp)

(setq-default font-lock-maximum-decoration t)

(setq dabbrev-case-replace nil)

(show-paren-mode t)

(setq require-final-newline 'visit-save)
(setq scroll-preserve-screen-position 'keep)

(defun totd ()
  (interactive)
  (random t) ;; seed with time-of-day
  (with-output-to-temp-buffer "*Tip of the day*"
    (let* ((commands (loop for s being the symbols
                           when (commandp s) collect s))
           (command (nth (random (length commands)) commands)))
      (princ
       (concat "Your tip for the day is:\n\n"
               "========================\n\n"
               (describe-function command)
               "\n\nInvoke with:\n\n"
               (with-temp-buffer
                 (where-is command t)
                 (buffer-string)))))))

(defun reload-dot-emacs ()
  (interactive)
  (load-file "~/.emacs"))

(defun drm-tags-retag-current-directory ()
  (interactive)
  (shell-command "etags *"))

(defun drm-tags-retag-current-tree ()
  (interactive)
  (shell-command "etags -R"))

(defun ascii-table ()
  "Show a table of ASCII characters by decimal, hex, and octal value."
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (let ((min 1) (max 255)
        (special-chars '(
                         (1 . "%c  SOH (start of heading)")
                         (2 . "%c  STX (start of text)")
                         (3 . "%c  ETX (end of text)")
                         (4 . "%c  EOT (end of transmission)")
                         (5 . "%c  ENQ (enquiry)")
                         (6 . "%c  ACK (acknowledge)")
                         (7 . "%c  BEL (bell)")
                         (8 . "%c  BS  (backspace)")
                         (9 . "    TAB (horizontal tab)")
                         (10 . "    LF  (NL line feed, new line)")
                         (11 . "%c  VT  (vertical tab)")
                         (12 . "    FF  (NP form feed, new page)")
                         (13 . "%c  CR  (carriage return)")
                         (14 . "%c  SO  (shift out)")
                         (15 . "%c  SI  (shift in)")
                         (16 . "%c  DLE (data link escape)")
                         (17 . "%c  DC1 (device control 1)")
                         (18 . "%c  DC2 (device control 2)")
                         (19 . "%c  DC3 (device control 3)")
                         (20 . "%c  DC4 (device control 4)")
                         (21 . "%c  NAK (negative acknowledge)")
                         (22 . "%c  SYN (synchronous idle)")
                         (23 . "%c  ETB (end of trans. block)")
                         (24 . "%c  CAN (cancel)")
                         (25 . "%c  EM  (end of medium)")
                         (26 . "%c  SUB (substitute)")
                         (27 . "%c  ESC (escape)")
                         (28 . "%c  FS  (file separator)")
                         (29 . "%c  GS  (group separator)")
                         (30 . "%c  RS  (record separator)")
                         (31 . "%c  US  (unit separator)")
                         (32 . "%c       (space)")
                         (9999))))
    (insert (format "ASCII characters %d-%d\n\n" min max))
    (insert " Dec   Hex   Oct    Character\n")
    (let ((i 0))
      (while (< i 60)
        (insert "=")
        (setq i (+ i 1))))
    (insert "\n")
    (let ((i min))
      (while (<= i max)
        (let ((line "%4d  0x%02X  %04o    ") (char "%c"))
          (while (> i (car (car special-chars)))
            (setq special-chars (cdr special-chars)))
          (if (= (car (car special-chars)) i)
              (setq char (cdr (car special-chars))))
          (insert (format (concat line char "\n") i i i i))
          (setq i (+ i 1))))))
  (beginning-of-buffer))


(defun drm-map-across-buffers (cmd buffers)
  "Run the command CMD on all buffers in BUFFERS"
  (mapcar (lambda (b)
            (set-buffer b)
            (funcall cmd))
          buffers))


(defun drm-reload-major-mode (mode)
  "Run the command MODE on all buffers whose major-mode matches
 MODE"
  (interactive "CMode to reload: ")
  (drm-map-across-buffers (lambda ()
                            (if (equal major-mode
                                       mode)
                                (funcall major-mode)))
                          (buffer-list)))

(defun forward-push-line (&optional n)
  "Move forward n lines, inserting more lines if there isn't
enough room"
  (unless n
    (setq n 1))
  (dotimes (x (forward-line n))
      (insert "\n")))

(defun non-nil (l)
  (delete nil l))
    
(defun drm-blist-save (file)
  (interactive "FFile to save buffer list to: ")
  (with-temp-file file
    (print
     (non-nil
      (mapcar #'buffer-file-name
              (buffer-list)))
      'insert)))

(defun drm-blist-read (file)
  (interactive "FFile to read buffer list from: ")
  (with-temp-buffer 
    (insert-file file)
    (mapc #'find-file
          (read (buffer-substring (point-min)
                                  (point-max))))))


(defun drm-kill-unmodified-buffers (noprompt)
  (interactive "P")
  (let ((confirm (if noprompt t
                   (y-or-n-p "Kill all unmodified buffers? "))))
    (when confirm 
      (mapcar 'kill-buffer-if-not-modified
              (buffer-list)))))


(defun drm-slotify-function ()
  (interactive)
  (insert "on")
  (upcase-region (point) (+ (point) 1)))

;;
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn 
          (rename-file name new-name 1) 
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun replace-regexps-in-region (beg end &rest regexps)
  (let ((curr regexps))
    (while curr
      (let ((from (car curr))
            (to (cadr curr)))
        (replace-regexp from
                        to
                        nil
                        beg end)
        (setq curr (cddr curr))))))

(defconst drm-bracket-mappings
  '((?\[ ?\] ?\{)
    (?\{ ?\} ?\()
    (?\( ?\) ?\[))
  "Alist of bracket types, of the form (OPEN CLOSE NEXT)")

(require 'assoc)
(defun drm-bracket-replace ()
  "Switch around the types of brackets at point."
  (interactive)
  (let* ((c (char-after (point)))
        (bmap (aget drm-bracket-mappings c t)))
    (save-excursion
      (delete-char 1)
      (insert (cadr bmap))
      (search-forward (char-to-string (car bmap)))
      (delete-char -1)
      (insert (car (aget drm-bracket-mappings (cadr bmap)))))))

(defvar drm-shebang-lines
  '(("\\.py\\'" . "/usr/bin/env python")
    ("\\.pl\\'" . "/usr/bin/env perl")))

(defun drm-insert-shebang ()
  (interactive)
  (insert (concat "#! " 
                  (assoc-default (buffer-file-name) drm-shebang-lines
                                 'string-match))))

(defun drm-register-shebang (re line)
  (aput 'drm-shebang-lines
        re line))

(defun drm-install-shebang ()
  (abbrev-def-list local-abbrev-table
    ("shebang" "" 'drm-insert-shebang)))


(load-file "~/elisp/misc/misc-keys.el")

