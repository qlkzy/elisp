(defun ada-compile-and-run ()
  (interactive)
  (compile (concat "gnatmake "
                   (buffer-file-name)
                   " && "
                   (file-name-sans-extension
                    (buffer-file-name)))))

(defun ada-init ()
  (local-set-key (kbd "C-c .") 'ada-compile-and-run))

(add-hook 'ada-mode-hook 'ada-init)
