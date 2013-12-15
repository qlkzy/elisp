(drm-custom-load "multi-term/multi-term")

(defun drm-switch-to-dedicated-multi-term ()
  (interactive)
  (if (multi-term-dedicated-exist-p)
      (multi-term-dedicated-select)
    (multi-term-dedicated-open)))

(defun drm-fix-term ()
  (term-line-mode))

(global-set-key (kbd "<f6>") 'multi-term)
(global-set-key (kbd "<f7>") 'multi-term-prev)
(global-set-key (kbd "<f8>") 'multi-term-next)
(global-set-key (kbd "<f12>") 'drm-switch-to-dedicated-multi-term)
(setq multi-term-dedicated-select-after-open-p t)

(add-hook 'term-mode-hook 'drm-fix-term)
