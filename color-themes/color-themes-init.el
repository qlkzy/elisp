;;; Set Up colour themes

;; Initialise colours

(defmacro drm-color-theme-switch (theme)
  "Enable the selected color theme, unless it was the most recent
one activated"
  `(unless (equal (caar color-theme-history)
                  (quote ,theme))
     (,theme)))

(require 'color-theme)
(load-file "~/elisp/color-themes/color-theme.el")
(color-theme-initialize)

(setq color-theme-history-max-length 2)

(load-file "~/elisp/color-themes/d-custom.el")
(load-file "~/elisp/color-themes/peril-sensitive-sunglasses.el") ;-)
(load-file "~/elisp/color-themes/color-theme-djcb-dark.el")

(drm-color-theme-switch color-theme-d-custom)

(if (boundp 'viper-minibuffer-emacs)
     (set-face-attribute 'viper-minibuffer-emacs nil :foreground nil :background nil))
