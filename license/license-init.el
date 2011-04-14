

(defvar license-dir
  (drm-custom-path "license/"))

(defvar license-copyright-owner
  "David Morris")

(defvar license-expansions
  '("<YEAR>" (format-time-string "%Y")
    "<OWNER>" license-copyright-owner))

(defun license-insert (name)
  (interactive
   (list
    (completing-read "License: " (license-get-licenses))))
  (let ((license-start (point)))
    (insert-file (concat license-dir name ".txt"))
    (goto-char (mark))
    (insert "\n")
    (let ((license-end (point)))
      (license-expand license-start license-end)
      (comment-region license-start license-end))))

(defun license-expand (beg end)
  (apply 'replace-regexps-in-region 
         beg end (mapcar (lambda (x) (if (or (listp x) 
                                             (symbolp x))
                                         (eval x)
                                       x))
                         license-expansions)))

(defun license-get-licenses ()
  (mapcar
   (lambda (x) 
     (replace-regexp-in-string "\\.txt\\'" "" x))
   (directory-files license-dir nil "\\.txt\\'")))
