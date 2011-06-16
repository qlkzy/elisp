;; Viper mode customisations

(add-hook 'viper-load-hook (lambda ()
                             (set-face-attribute 
                              'viper-minibuffer-emacs nil
                              :foreground nil
                              :background nil)))

(add-hook 'viper-minibuffer-standard-hook (lambda ()
                             (set-face-attribute 
                              'viper-minibuffer-emacs nil
                              :foreground nil
                              :background nil)))

(setq viper-custom-file-name "~/elisp/viper/dotviper.el")

(setq viper-mode t)
(require 'viper)

(setq viper-expert-level 5)
(setq viper-vi-style-in-minibuffer nil)
(set-face-attribute 'viper-minibuffer-emacs nil :foreground nil :background nil)

;; This is Emacs, so I would like emacs keys to work
;; Viper needs a shallower mode
(drm-define-in-maps (viper-vi-global-user-map 
                     viper-insert-global-user-map)
  ((kbd "C-d") 'delete-char)
  ((kbd "C-e") 'viper-goto-eol)
  ((kbd "C-t") 'transpose-chars)
  ((kbd "C-h") 'help-command)
  ((kbd "C-w") 'kill-region)
  ((kbd "C-t") 'transpose-chars)
  ((kbd "C-y") 'yank)
  ((kbd "C-f") 'forward-char)
  ((kbd "C-b") 'backward-char))
