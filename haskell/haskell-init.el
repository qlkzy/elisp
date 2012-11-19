(add-hook 'haskell-mode-hook
          (lambda ()
            (drm-custom-load "haskell/inf-haskell")
            (setq comment-padding " ")
            (setq comment-start "--")))

(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

(autoload 'haskell-mode "haskell-mode"
        "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
  "Major mode for editing literate Haskell scripts." t)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; (setq haskell-program-name "ghci")

(require 'inf-haskell)
