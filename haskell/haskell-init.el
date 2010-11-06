(progn
  (cd "~/elisp/haskell")
  (normal-top-level-add-subdirs-to-load-path)
  (cd "~/"))

(add-hook 'haskell-mode-hook
          #'(lambda ()
              (setq comment-padding " ")
              (setq comment-start "--")))

(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

(autoload 'haskell-mode "haskell-mode"
        "Major mode for editing Haskell scripts." t)
     (autoload 'literate-haskell-mode "haskell-mode"
        "Major mode for editing literate Haskell scripts." t)
