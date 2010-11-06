;;; Main Lisp customisations file, including SLIME


(add-to-list 'load-path "~/elisp/lisp/slime/")  ; your SLIME directory
(setq inferior-lisp-program "C:/nix/lisp/clisp/clisp.exe") ; your Lisp system
(require 'slime)
(slime-setup)
