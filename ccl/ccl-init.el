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
  "---------------------------------------------"
  "--------------------------------*/" \n)

(define-skeleton ccl-perl-file-header
  "Insert a CCL Perl File Header" nil
  "#############################################"
  "##################################" \n
  "# (C) Copyright Cambridge Consultants, " (format-time-string "%Y") \n
  "# " \n
  "# Cambridge Consultants Project Reference " _ \n
  "# " \n
  "# FILE" \n
  "#    " (buffer-name) \n
  "# " \n
  "# ORIGINAL AUTHOR" \n
  "#    David Morris" \n
  "# " \n
  "# DESCRIPTION" \n
  "# " \n
  "# " \n
  "#############################################"
  "##################################" \n \n)

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
   ((eq style 'cfile) (drm-insert-skeleton-with-indent 'ccl-c-file-header))
   ((eq style 'csection) (drm-insert-skeleton-with-indent 'ccl-c-section-header))
   ((eq style 'perlfile) (drm-insert-skeleton-with-indent 'ccl-perl-file-header))
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
  (ccl-comment-header 'cfile)
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
  (ccl-comment-header 'cfile)
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


(defun ccl-insert-perl-boilerplate ()
  (interactive)
  (insert "#! perl\n")
  (ccl-comment-header 'perlfile)
  (goto-char (point-max))
  (insert
   (concat
    "\n"
    "use strict;\n"
    "use warnings;\n"
    "\n")))
  

(defun ccl-insert-pod-boilerplate ()
  (interactive)
  (goto-char (point-max))
  (let ((command (file-name-sans-extension 
                  (file-name-nondirectory 
                   (buffer-file-name)))))
    (insert
     (concat
      "=head1 NAME\n"
      "\n"
      command " - <brief desc>\n"
      "\n"
      "=head1 SYNOPSIS\n"
      "\n"
      command "\n"
      "\n"
      "=head1 DESCRIPTION\n"
      "\n"
      "=head1 OPTIONS\n"
      "\n"
      "=over\n"
      "\n"
      "=item B<--setting>=I<value>\n"
      "\n"
      "=over\n"
      "\n"
      "=head1 EXAMPLES\n"
      "\n"
      "=head1 CAVEATS\n"
      "\n"
      "=head1 BUGS\n"
      "\n"
      "=head1 RESTRICTIONS\n"
      "\n"
      "=head1 NOTES\n"
      "\n"))))


;; boilerplate keybindings
(define-prefix-command 'ccl-boilerplate-map)
(global-set-key (kbd "C-c s b") 'ccl-boilerplate-map)
(global-set-key (kbd "C-c s b h") 'ccl-insert-c-header-boilerplate)
(global-set-key (kbd "C-c s b i") 'ccl-insert-c-implementation-boilerplate)
(global-set-key (kbd "C-c s b p") (lambda () (interactive)
                                    (ccl-insert-perl-boilerplate)
                                    (ccl-insert-pod-boilerplate)))
(global-set-key (kbd "C-c s b f") (lambda () (interactive)
                                    (ccl-insert-c-function-header "" "" "")))
