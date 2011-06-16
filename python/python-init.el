;;; Python-Mode Main Init File

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun d-python-init-hook ()
  (turn-on-font-lock)
  (abbrev-mode t)
  (drm-install-shebang))

(add-hook 'python-mode-hook 'd-python-init-hook)
