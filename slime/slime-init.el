(setq inferior-lisp-program "sbcl")
(add-to-list 'load-path (drm-custom-path "vendor/slime"))
(require 'slime)
(slime-setup)
