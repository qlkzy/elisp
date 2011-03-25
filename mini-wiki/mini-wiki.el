(defconst mini-wiki-link-regex
  "\\<[A-Z]+[a-z]+[A-Z]+[a-z]+\\w+\\>"
  "Regex to match mini-wiki links")

(defconst mini-wiki-pagesep-regex
  "\\(\x0c[^A-Za-z]*\\|\\`\\)"
  "Regex to match mini-wiki page separators")

(defconst mini-wiki-page-regex
  (concat mini-wiki-pagesep-regex
          mini-wiki-link-regex)
  "Regex to match mini-wiki pages")

(defvar mini-wiki-pages-list
  nil
  "List of mini-wiki pages in the current buffer")

(defun mini-wiki-is-word-link (word)
  "Check if WORD is a valid mini-wiki link, according to the
value of mini-wiki-link-regex"
  (let ((case-fold-search nil))
    (when (stringp word)
      (string-match mini-wiki-link-regex word))))

(defun mini-wiki-build-page-regex (word)
  (concat mini-wiki-pagesep-regex
          "\\<" word "\\>"))

(defun mini-wiki-find-page (name)
  (goto-char (point-min))
  (re-search-forward 
   (mini-wiki-build-page-regex name)
   nil t))

  
(defun mini-wiki-make-page (name)
  (widen)
  (goto-char (point-max))
  (insert "\n\x0c\n" name "\n")
  (save-excursion 
    (insert "\n\n\nHomePage\n"))
  (narrow-to-page)
  (add-to-list (make-local-variable 'mini-wiki-pages-list)
               name)
  (mini-wiki-refresh-font-lock))

(defun mini-wiki-follow-link (&optional name)
  (interactive)
  (when (called-interactively-p)
      (setq name 
            (completing-read "Page Name: "
                             mini-wiki-pages-list)))
  (let ((link-name (if name
                       name
                     (current-word t t))))
    (when (mini-wiki-is-word-link link-name)
      (widen)
      (let ((link-pos 
             (mini-wiki-find-page link-name)))
        (if link-pos
            (progn
              (goto-char link-pos)
              (narrow-to-page))
          (mini-wiki-make-page link-name))))))

(defun mini-wiki-newline-or-follow ()
  (interactive)
  (if (mini-wiki-is-word-link (current-word t t))
      (mini-wiki-follow-link)
    (newline)))

(defun mini-wiki-scan-pages ()
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (let ((pages-list nil))
        (while (let ((case-fold-search nil))
                 (re-search-forward mini-wiki-page-regex
                                  nil t))
          (add-to-list 'pages-list
                       (current-word t t)))
        pages-list))))

(defun mini-wiki-refresh-font-lock ()
  (font-lock-add-keywords nil
       (list
        (cons mini-wiki-link-regex 
              font-lock-builtin-face)
        (cons
         (regexp-opt mini-wiki-pages-list 'words)
         '(0 font-lock-constant-face t)))
       'set))

(defun mini-wiki-setup-font-lock ()
  "Set font lock appropriateley for mini-wiki mode"
  (add-to-list (make-local-variable 'font-lock-defaults)
               (list 
                (cons mini-wiki-link-regex font-lock-builtin-face))))

;; (defun mini-wiki-setup-keymap ()
;;   "Setup keymap for use in mini-wiki mode"
;;   (define-key mini-wiki-mode-map 
;;     (kbd "RET") 'mini-wiki-newline-or-follow))

(defun mini-wiki-setup-keymap ()
  (drm-define-in-maps (mini-wiki-mode-map)
    ((kbd "RET") 'mini-wiki-newline-or-follow)
    ((kbd "C-c C-l") 'mini-wiki-follow-link)))

(defun mini-wiki-setup-pagelist ()
  "Setup page list for navigation"
  (set (make-local-variable 'mini-wiki-pages-list)
       (mini-wiki-scan-pages)))

(define-derived-mode mini-wiki-mode fundamental-mode 
  "Mini-Wiki"
  "Major mode for editing mini-wiki files"
  (mini-wiki-setup-font-lock)
  (mini-wiki-setup-keymap)
  (mini-wiki-setup-pagelist)
  (mini-wiki-refresh-font-lock))

