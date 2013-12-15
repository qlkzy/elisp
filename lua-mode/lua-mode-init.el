(drm-custom-load "lua-mode/lua-mode/lua-mode")

(defun drm-lua-init ()
  (setq lua-indent-level 4))

(add-hook 'lua-mode-hook 'drm-lua-init)
