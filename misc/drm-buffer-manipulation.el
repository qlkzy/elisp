
(defun drm-subdivide-windows (count)
  "Ensure that there are at least COUNT windows in the current
 frame. Try to make windows have the same ratio as current frame;
 failing that, split vertically."
  (interactive "p")
  (while (< (length (window-list nil 1 nil))
            count)
    (select-window (get-largest-window 0))
    (split-window nil nil 
                  (if (< (/ (window-height)
                            (frame-height))
                         (/ (window-width)
                            (frame-width)))
                      t
                    nil))))

(defun drm-switch-to-buffer-set (re-or-buffers)
  "Make all the buffers which match RE be displayed on a visible
frame; alternatively, supply a list of buffers to switch to."
  (interactive "sRegex: ")
  (let ((bufs (if (listp re-or-buffers) 
                  re-or-buffers
                (non-nil (mapcar (lambda (x)
                                   (when (string-match re-or-buffers
                                                       (buffer-name x))
                                     x))
                                 (buffer-list))))))
    (drm-subdivide-windows (length bufs))
    (dolist (e bufs)
      (select-window (get-lru-window 'visible))
      (switch-to-buffer e))))

(provide 'drm-buffer-manipulation)
