(defun drm-find-this-tag-other-window ()
  (interactive)
  (find-tag-other-window (current-word)))


(define-prefix-command 'drm-tags-map)

(global-set-key (kbd "C-c t") 'drm-tags-map)

(define-key 'drm-tags-map (kbd "SPC") 'drm-find-this-tag-other-window)
