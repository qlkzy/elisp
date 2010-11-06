;;; Emacs-Lisp Mode Main Customisations

;; Configure main hook

(defun d-emacs-lisp-mode-init-hook ()
  (font-lock-mode t)
  (hs-minor-mode t))

(add-hook 'emacs-lisp-mode-hook 'd-emacs-lisp-mode-init-hook)

(drm-reload-major-mode 'emacs-lisp-mode)
