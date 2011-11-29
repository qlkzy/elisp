(add-to-list 'load-path (drm-custom-path "rails/rinari"))
(require 'rinari)

(add-to-list 'load-path (drm-custom-path "rails/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))
