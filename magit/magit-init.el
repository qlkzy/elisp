(drm-custom-load-path-install "magit/magit")

(require 'magit)
(require 'magit-svn)

(global-set-key (kbd "C-c g") 'magit-status)

