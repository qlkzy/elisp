(cond
 ((>= emacs-major-version 24)
  (add-to-list 'custom-theme-load-path (drm-custom-path "tomorrow-theme/"))
  (load-theme 'tomorrow-night t))
 (t (drm-custom-load "tomorrow-theme/color-theme-tomorrow")
    (color-theme-tomorrow-night)))
