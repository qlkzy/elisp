;; Miscellaneous text manipulation functions


(defvar drm-comment-header-columns
  50
  "Length of the line that starts the comment header")

(defvar drm-comment-block-char
  "-"
  "Character to use to delimit comment blocks")




(defun fc-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun jao-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defadvice yank (after indent-region activate)
  (let ((mark-even-if-inactive t))
    (if (member major-mode '(emacs-lisp-mode scheme-mode lisp-mode
                                             c-mode c++-mode objc-mode cperl-mode
                                             LaTeX-mode TeX-mode))
        (indent-region (region-beginning) (region-end) nil))))

(defun duplicate-start-of-line-or-region ()
  (interactive)
  (if transient-mark-mode
      (call-interactively #'duplicate-region)
    (duplicate-start-of-line)))

(defun duplicate-start-of-line ()
  (let ((text (buffer-substring 
               (point) (line-beginning-position))))
    (forward-line)
    (push-mark)
    (insert text)
    (open-line 1)))

(defun duplicate-region (start end)
  (interactive "r")
  (let* ((text (buffer-substring 
                start end)))
    (goto-char end)
    (insert (concat "\n"
                    text))
    (push-mark end)
    (setq deactivate-mark nil)
    (exchange-point-and-mark)))


(defun drm-duplicate-sexp (dir)
  (interactive "P")
  (setq dir (if (listp dir)
                -1
              (prefix-numeric-value dir)))
  (let ((p (point)))
    (forward-sexp dir)
    (duplicate-region (min p (point))
                      (max p (point)))))


(defun drm-comment-line ()
  "Comment out the current line, unless it is just a comment, in
  which case, uncomment it"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position)
                               (line-end-position)))


(defun drm-force-to-char (s)
  (if (stringp s)
      (string-to-char s)
    (if (charp s)
        s
      ?\0)))

;; (defun drm-comment-header ()
;;   (interactive)
;;   (let ((p (point))
;;         (block-end (concat 
;;                     comment-start
;;                     (make-string drm-comment-header-columns
;;                                  (drm-force-to-char drm-comment-block-char))
;;                     comment-end "\n")))
;;     (insert block-end)
;;     (insert comment-start)
;;     (save-excursion
;;       (insert 
;;        (concat comment-end 
;;                "\n"
;;                block-end)))))


(defun drm-comment-header ()
  (interactive)
  (insert (concat comment-start
                  "--- "))
  (save-excursion
    (insert (concat " ---"
                    comment-end))))

(defun drm-align-paragraph (&optional rules)
  (interactive)
  (let ((start (save-excursion
                 (backward-paragraph)
                 (point)))
        (end (save-excursion
               (forward-paragraph)
               (point))))
    (align start end nil rules)))


(defun drm-forward-subword (arg)
  (interactive "p")
  (let ((case-fold-search nil))
    (re-search-forward (concat "[[:lower:]][[:upper:]]" ; camelCase word
                               "\\|"                    ; OR
                               "\\([[:word:]][^[:word:]]\\)") ; real word
                       nil
                       t
                       arg))
  (backward-char)
  (point))


(defun drm-backward-subword (arg)
  (interactive "p")
  (let ((case-fold-search nil))
    (re-search-backward (concat "[[:lower:]][[:upper:]]" ; camelCase word
                                "\\|"                    ; OR
                                "\\([[:word:]][^[:word:]]\\)") ; real word
                        nil
                        t
                        arg))
  (forward-char)
  (point))


(defun drm-kill-subword (arg)
  (interactive "p")
  (let ((p (point))
        (np (drm-forward-subword arg)))
    (kill-region p np)))

(defun drm-backward-kill-subword (arg)
  (interactive "p")
  (let ((p (point))
        (np (progn (drm-backward-subword arg))))
    (kill-region np p)))
    
  


(provide 'drm-text-manipulation)
