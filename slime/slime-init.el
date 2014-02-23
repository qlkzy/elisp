(setq inferior-lisp-program "sbcl")
(require 'slime)
(slime-setup)
(require 'info-look)
(info-lookup-add-help
 :mode 'lisp-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(ansicl)Symbol Index" nil nil nil)))
(slime-setup '(slime-fancy))
