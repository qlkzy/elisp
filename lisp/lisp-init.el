;;; Main Lisp customisations file, including SLIME

;; (setq inferior-lisp-program "C:/nix/lisp/clisp/clisp.exe") ; your Lisp system
(setq inferior-lisp-program "sbcl")
(require 'slime)
(slime-setup)
