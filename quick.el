(define-prefix-command 'drm-leader-key)
(global-set-key (kbd "C-,") 'drm-leader-key)
(global-set-key (kbd "C-, ,") 'drm-compile-tests)

(defun drm-compile-tests ()
  (interactive)
    (compile 
     (concat "make -C \""
             (drm-find-parent-with-makefile-path default-directory)
             "\" test")))

(defun drm-find-parent-with-makefile-path (dir)
  (if (directory-files dir nil "Makefile")
      dir
    (drm-find-parent-with-makefile-path
     (concat dir "../"))))

