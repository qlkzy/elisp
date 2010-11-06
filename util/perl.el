(defvar perl-code-hist nil
  "History for entered perl code")

(defvar perl-switches-hist nil
  "History for switches to perl code")


(defun shell-command-on-text-to-string (text command)
  (let ((tmp (make-temp-file "cmd")))
    (with-temp-file tmp
      (insert text))
    (shell-command-to-string (format "%s < %s" 
                                     command
                                     (shell-quote-argument tmp)))))
        


;; (defun perl-on-file-to-string (file code switches)
;;   (let ((tmp (make-temp-file "pcode")))
;;     (with-temp-file tmp
;;       (insert (concat "#! perl " switches "\n\n"
;;                       code)))
;;     (shell-command-to-string (concat "perl " 
;;                                      (shell-quote-argument tmp)
;;                                      " "
;;                                      (shell-quote-argument file)))))

              

;; (defun perl-on-region-to-string (start end code switches)
;;   (let ((tmp (make-temp-file "preg")))
;;     (write-region start end tmp)
;;     (perl-on-file-to-string tmp code switches)))



(defun perl-on-region-to-string (start end code switches)
  (let ((tmp (make-temp-file "pcode")))
    (with-temp-file tmp
      (insert code))
    (shell-command-on-text-to-string (buffer-substring start
                                                       end)
                                     (format "perl %s %s"
                                             switches
                                             tmp))))
                                             


(defun perl-insert-many-times (text pos times)
  (goto-char pos)
  (while (< 0 times)
    (insert text)
    (setq times (- times 1))))

(defun perl-read-code ()
  (read-string "Perl Code: "
               ""
               'perl-code-hist))

(defun perl-read-switches ()
  (read-string "Perl Switches: "
               "-p"
               'perl-switches-hist))

(defun perl-on-region (start end code switches &optional pre)
  (interactive
   (let ((code-string (perl-read-code))
         (switches-string (perl-read-switches))
         (prefix current-prefix-arg))
     (list (region-beginning)
           (region-end)
           code-string
           switches-string
           prefix)))
  (let ((result (perl-on-region-to-string start
                                          end
                                          code
                                          switches)))

    ;; Do various things depending on prefix
    (cond ((numberp pre)
           (if (< 0 pre)
               (perl-insert-many-times result end pre)
             (perl-insert-many-times result start pre)))
          (t
           (delete-region start end)
           (insert result)))))


(defun perl-on-line (pos code switches &optional pre)
  (interactive
   (let ((p (point))
         (code-string (perl-read-code))
         (switches-string (perl-read-switches))
         (prefix current-prefix-arg))
     (list p
           code-string
           switches-string
           prefix)))
  (goto-char pos)
  (let ((result (perl-on-region-to-string (line-beginning-position) (line-end-position)
                                          code
                                          switches)))
    (cond ((and (listp pre)
                pre)
           (delete-region (line-beginning-position)
                          (line-end-position))
           (insert result))
          ((numberp pre)
           (if (< 0 pre)
               (perl-insert-many-times result 
                                       (+ (line-end-position) 1)
                                       pre)
             (perl-insert-many-times result 
                                     (- (line-beginning-position) 1)
                                     pre)))
          (t
           (goto-char (+ (line-end-position) 1))
           (insert result)))))
