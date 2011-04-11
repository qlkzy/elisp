;;; CCL-Specific stuff

;; copyright notices

(defun ccl-insert-copyright (project-no)
  (interactive "MProject Number: ")
  (let ((p (point)))
    (insert (concat "Copyright (C) Cambridge Consultants Ltd., "
                    (format-time-string "%Y") "\n"
                    "Cambridge Consultants Project Reference "
                    (upcase project-no) "\n\n"
                    "Original Author: David Morris\n"
                    "\n"))
    (comment-region p (point))))



;; comment skeletons
(define-skeleton ccl-c-file-header
  "Insert a CCL C file header" nil
  "/*-------------------------------------------"
  "----------------------------------" \n
  "(C) Copyright Cambridge Consultants, " (format-time-string "%Y") \n \n
  "Cambridge Consultants Project Reference: " _ \n \n
  "FILE" \n
  "    " (buffer-name) \n \n
  "ORIGINAL AUTHOR" \n
  "    David Morris" \n \n
  "DESCRIPTION" \n
  "    " _ \n \n
  "---------------------------------------------"
  "--------------------------------*/" \n
  \n \n)

(define-skeleton ccl-c-section-header
  "Insert a CCL C section header" nil
  \n \n
  "/*-------------------------------------------"
  "----------------------------------" \n
  "" _ \n
  "-----------------------------------------------------------------------------*/" \n
  \n \n)

(defun drm-insert-skeleton-with-indent (skeleton)
  "Insert skeleton, then, once the whole thing has been inserted, reindent it.

This is necessary as some skeletons seem to screw up indentation,
unless horrible manual things are done."
  (let ((start (point))
        (end nil))
    (let ((skeleton-end-hook (lambda () (setq end (point)))))
      (funcall skeleton))
    (indent-region start end)))
    
(defun ccl-comment-header (style)
  "Insert one of various styles of CCL comment header"
  (interactive "SComment Header Style: ")
  (cond 
   ((eq style 'file) (drm-insert-skeleton-with-indent 'ccl-c-file-header))
   ((eq style 'section) (drm-insert-skeleton-with-indent 'ccl-c-section-header))
   (t (message "Unknown header style"))))
  

(defun ccl-insert-c-section-header (section-name)
  (let ((p (point)))
    (insert
     (concat
      "\n"
      "/*---------------------------------------"
      "--------------------------------------\n"
      section-name "\n"
      "----------------------------------------"
      "-------------------------------------*/\n"
      "\n"))
    (indent-region p (point))))


(defun ccl-insert-c-function-header (name args ret)
  (let ((p (point)))
    (insert
     (concat
      "/*---------------------------------------"
      "--------------------------------------\n"
      "NAME\n"
      name "\n\n"
      "DESCRIPTION\n\n"
      args "\n\n"
      "RETURNS\n"
      ret "\n\n"
      "-----------------------------------------"
      "------------------------------------*/\n"
      (indent-region p (point))))))

;; keybindings
(define-prefix-command 'ccl-prefix-map)
(global-set-key (kbd "C-c s") 'ccl-prefix-map)

(global-set-key (kbd "C-c s q") 'ccl-insert-copyright)
(global-set-key (kbd "C-c s c") 'ccl-comment-header)


;; epic boilerplate
(defun ccl-insert-c-header-boilerplate ()
  (interactive)
  (ccl-comment-header 'file)
  (goto-char (point-max))
  (drm-insert-include-guard)
  (mapc
   'ccl-insert-c-section-header
   '("Required header files"
     "Public defines"
     "Public data types"
     "Public data"
     "Public functions"))
  (goto-char (point-max))
  (insert "\n")
  (ccl-insert-c-section-header "End of file"))

(defun ccl-insert-c-implementation-boilerplate ()
  (interactive)
  (ccl-comment-header 'file)
  (goto-char (point-max))
  (mapc
   'ccl-insert-c-section-header
   '("System level includes"
     "Project level includes"
     "Local includes"
     "Public data"
     "Private defines"
     "Private data types"
     "Private functions - declare static"
     "Private data - declare static"
     "Function implementations"
     "End of file")))

