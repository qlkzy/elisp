;;; CC-Mode Initialisation

;; load reqired files

(defvar ccl-style-available nil
  "CCL coding standard is available")

(defvar ccl-style-enforced nil
  "CCL coding standard is enforced")

(when ccl-style-available
    (drm-custom-load "cc-mode/ccl-coding-standard.el"))

(drm-custom-load "cc-mode/cc-mode-skeletons.el")
(drm-custom-load "cc-mode/cc-mode-general-skeletons.el")

(defun drm-c-pre-abbrev ()
  (if (nth 4 (syntax-ppss (point)))
      (setq local-abbrev-table nil)
    (setq local-abbrev-table c-mode-abbrev-table)))

(defun drm-pre-abbrev (abbrev-fcn)
  (let ((s (syntax-ppss (point))))
    (unless (or (nth 3 s)
                (nth 4 s))
      (funcall abbrev-fcn))))

       
(defun drm-insert-include-statement (system-include)
  (interactive "P")
  (insert "#include ")
  (if system-include
      (progn
        (insert "<")
        (save-excursion
          (insert ">")))
    (progn
      (insert "\"")
      (save-excursion
        (insert "\"")))))

(defun drm-insert-include-guard ()
  (interactive)
  (let ((guard-name
         (upcase
          (replace-regexp-in-string "\\W"
                                    "_"
                                            (buffer-name)))))
    (insert
     (concat "#ifndef " guard-name "\n"
             "#define " guard-name "\n"
             "\n\n"
             "#endif "))
    (let ((p (point)))
      (insert guard-name)
      (comment-region p (line-end-position))
      (previous-line)
      (point))))


(define-prefix-command 'drm-c-mode-prefix)


(defun c-mode-general-init ()
  (c-set-style "k&r")
  (setq c-basic-offset 4)
  (setq c-indent-level 0)
  (setq c-imaginary-offset 0)
  (setq c-mode-electric-keywords t)
  (setq c-mode-electric-semi t)
  (setq c-mode-electric-brace t)
  (setq c-mode-electric-newline t)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'cpp-macro-cont '--)
  (c-set-offset 'namespace-open 0)
  (c-set-offset 'innamespace 0)
  (hs-minor-mode t)
  (local-set-key (kbd "C-c c") 'drm-c-mode-prefix)
  (local-set-key (kbd "RET") 'drm-c-mode-return)
  (local-set-key (kbd "C-c c b") 'drm-insert-include-guard)
  (if (> emacs-major-version 22)
      (add-hook 'abbrev-expand-functions
                'drm-pre-abbrev)
    (add-hook (make-local-variable 'pre-abbrev-expand-hook)
            'drm-c-pre-abbrev))
  (local-set-key (kbd "C-c c c") 'drm-cpp-new-class)
  (local-set-key (kbd "C-c c d") 'drm-insert-doxygen-block)
  (local-set-key (kbd "C-c c q") 'drm-insert-ccl-boilerplate)
  (local-set-key (kbd "C-c c o") 'drm-cpp-goto-other)
  (local-set-key (kbd "C-c c i") 'drm-cpp-create-implementation)
  (local-set-key (kbd "C-c c h") 'drm-insert-include-statement)
  (local-set-key (kbd "C-c c t s") 'drm-cpp-new-boost-test-suite)
  (local-set-key (kbd "C-c c t c") 'drm-cpp-new-boost-test-case)
  (local-set-key (kbd "C-c c t a") 'drm-cpp-new-boost-ce-assertion)
  (add-hook 'c-special-indent-hook 'drm-c-indent-case)
  (setq semantic-symref-tool 'global))

(defun c-mode-init ()
  (local-set-key (kbd "C-c c o") 'drm-c-goto-other)
  (setq comment-style 'extra-line))

(defun c++-mode-init ()
  (local-set-key (kbd "C-c c o") 'drm-cpp-goto-other))

(defun drm-c-mode-return ()
  (interactive)
  (c-newline-and-indent))
  ;; (if (nth 4 (syntax-ppss (point)))
  ;;     (progn
  ;;       (insert "* ")
  ;;       (indent-according-to-mode))
  ;;   nil))


(defun drm-cpp-new-class (dir name)
  (interactive "DCreate class in directory: \nMClass name: ")
  ;; Hmmn, 'tis ugly, and contains far to much repetition. Another time
  (let* ((names (split-string name "::"))
         (cname (car (last names)))
         (space (car (butlast names))))
    (find-file (format "%s/%s.h"
                       dir
                       (downcase cname)))
    (c++-mode)
    (drm-insert-ccl-boilerplate)
    (insert "\n\n\n")
    (drm-insert-include-guard)
    (if space
        (progn
          (insert 
           (concat (format "namespace %s \n {\n" space)
                   "\n"))
          (goto-char (drm-insert-doxygen-block))
          (insert 
           (format "class %s \n {\n" cname)
          "\n")

          ;; this is where we're likely to want to start inserting text
          (save-excursion
            (insert 
             (concat "\n"
                     "};\n\n"
                     "}\n"))
            (indent-region (point-min)
                           (point-max))))
      (progn
        (goto-char (drm-insert-doxygen-block))
        (insert 
         (format "class %s \n {\n" cname))
        ;; this is where we're likely to want to start inserting text
        (save-excursion
          (insert 
           (concat "\n"
                   "};\n"))
          (indent-region (point-min)
                         (point-max)))))))


(defun drm-insert-doxygen-block ()
  (interactive)
  (let ((p (point))
        (after-p nil))
    (insert (concat "/*!\n\n"
                    "\t\\brief "))
    (save-excursion
      (insert "\n\n*/\n")
      (indent-region p (point))
      (setq after-p (point)))
    after-p))
    
(defun drm-cpp-get-classname ()
  (save-excursion
    (let ((name nil))
      (beginning-of-line)
      (when (string-match
             "^[[:space:]]*class.*[^\\;]+$"
             (buffer-substring
              (line-beginning-position)
              (line-end-position)))
        (forward-word 2)
        (setq name (current-word)))
      name)))

(defun drm-cpp-get-function ()
  (save-excursion
    (let ((fn nil)
          (name nil)
          (arguments nil)
          (type nil)
          (fn-pos nil)
          (argument-pos nil)
          (line (buffer-substring-no-properties
                 (line-beginning-position)
                 (line-end-position))))
      (when (string-match "(" line)
        (setq fn-pos (string-match
                      "[[:word:]_~]+[[:space:]]*("
                      line))
        (when fn-pos
          (setq argument-pos (+ (string-match
                                 "(" line)
                                (line-beginning-position)))
          (setq arguments (buffer-substring
                           argument-pos
                           (scan-sexps argument-pos 1)))
          (setq name (replace-regexp-in-string
                      "(.*" ""
                      (substring line fn-pos)))
          (setq name (concat name arguments))
          (setq type (replace-regexp-in-string
                      "virtual[[:space:]]*"
                      ""
                      (substring line 0 fn-pos)))
          (setq fn (cons type name))))
      fn)))



(defun drm-cpp-create-implementation ()
  (interactive)
  (let ((class-name "")
        (functions nil))
    (save-excursion
      (goto-char (point-min))
      (while (= (forward-line) 0)
        (if (drm-cpp-get-classname)
            (setq class-name (drm-cpp-get-classname)))
        (if (drm-cpp-get-function)
            (setq functions (cons (drm-cpp-get-function)
                                  functions)))))
    (drm-cpp-goto-implementation)
    (end-of-buffer)
    (insert "\n\n\n")
    (dolist (fn (reverse functions))
      (insert 
       (concat (car fn)
               (format "%s::%s\n"
                       class-name
                       (cdr fn))
               "{\n\n"
               "}\n\n\n")))
    (indent-region (point-min) (point-max))))


(defun drm-cpp-goto-header ()
  (interactive)
  (pop-to-buffer (find-file
                  (replace-regexp-in-string "\\.cpp$"
                                            ".h"
                                            (buffer-file-name)))))

(defun drm-cpp-goto-implementation ()
  (interactive)
  (pop-to-buffer (find-file
                  (replace-regexp-in-string "\\.h$"
                                            ".cpp"
                                            (buffer-file-name)))))

(defun drm-c-goto-header ()
  (interactive)
  (pop-to-buffer (find-file
                  (replace-regexp-in-string "\\.c$"
                                            ".h"
                                            (buffer-file-name)))))

(defun drm-c-goto-implementation ()
  (interactive)
  (pop-to-buffer (find-file
                  (replace-regexp-in-string "\\.h$"
                                            ".c"
                                            (buffer-file-name)))))

(defun drm-cpp-goto-other ()
  (interactive)
  (if (string-match-p "\\.cpp$"
                      (buffer-file-name))
      (drm-cpp-goto-header)
    (drm-cpp-goto-implementation)))

(defun drm-c-goto-other ()
  (interactive)
  (if (string-match-p "\\.c$"
                      (buffer-file-name))
      (drm-c-goto-header)
    (drm-c-goto-implementation)))

(defun drm-cpp-new-boost-test-suite (dir name)
  (interactive "DCreate test suite in directory: \nMClass under test: ")
  (find-file (format "%s/%stest.cpp"
                     dir
                     (downcase name)))
  (c++-mode)
  (insert (concat
           "#include <boost/test/unit_test.hpp>\n\n"
           "#include <" (downcase name) ".h>\n\n"
           "BOOST_AUTO_TEST_SUITE(" name "_Test)\n\n\n\n"
           "BOOST_AUTO_TEST_SUITE_END()\n")))

(defun drm-cpp-new-boost-test-case (name)
  (interactive "MTest Name: ")
  (insert (concat
           "\n"
           "BOOST_AUTO_TEST_CASE(" name ")\n"
           "{\n"
           "\n"
           "}\n\n")))

(defun drm-cpp-new-boost-ce-assertion ()
  (interactive)
  (insert "BOOST_CHECK_EQUAL(")
  (save-excursion
    (insert ");\n")))


(defun drm-insert-doxygen-boilerplate ()
  (interactive)
  (insert (concat "/*!\n"
                  "\t\\file " 
                  (file-name-nondirectory (buffer-file-name))
                  "\n"
                  "\t\\brief\n"
                  "*/")))

(defun drm-insert-ccl-boilerplate ()
  (interactive)
  (insert (concat "// Copyright (C) Cambridge Consultants Ltd., "
                  (format-time-string "%Y") "\n"
                  "// Cambridge Consultants Project Reference P0326\n"
                  "\n"))
  (drm-insert-doxygen-boilerplate))


(defun drm-c-indent-case ()
  (interactive)
  (save-excursion
    (back-to-indentation)
    (if (or (string= (current-word) "case")
            (string= (current-word) "default"))
        (insert-tab))))



(add-hook 'c-mode-common-hook 'c-mode-general-init t)
(add-hook 'c-mode-common-hook 'cc-mode-skeleton-init t)

(add-hook 'c-mode-hook 'c-mode-init t)
(add-hook 'c++-mode-hook 'c++-mode-init t)
