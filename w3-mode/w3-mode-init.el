;;; Emacs/W3 Configuration

(progn
  (cd "~/elisp/w3-mode/w3")
  (normal-top-level-add-subdirs-to-load-path)
  (cd "~/"))

(condition-case () (require 'w3-auto "w3-auto") (error nil))
