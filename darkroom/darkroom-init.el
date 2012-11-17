;;; Use Darkroom Mode

(when (string-match
     "[Ww]indows" system-configuration)
  (add-to-list 'load-path (drm-custom-path "darkroom"))
  (require 'martin-darkroom))
