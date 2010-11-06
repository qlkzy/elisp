;;; Use Darkroom Mode

(when (string-match
     "[Ww]indows" system-configuration)
  (add-to-list 'load-path "~/elisp/darkroom")
  (require 'martin-darkroom))
