(define-prefix-command 'drm-leader-key)
(global-set-key (kbd "C-,") 'drm-leader-key)
(global-set-key (kbd "C-, ,") 'drm-compile-tests)

(defun drm-compile-tests ()
  (interactive)
  (if (string-match "test/$" default-directory)
      (compile "make -C .. test")
    (compile "make test")))
