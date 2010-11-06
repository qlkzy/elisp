(defun drm-insert-flagged-comment (flag message)
  (indent-according-to-mode)
  (let ((p (point)))
    (insert flag ": " message "\n")
    (comment-region p (point)))
  (indent-according-to-mode))

(defun drm-insert-XXX-message (message)
  (drm-insert-flagged-comment "XXX" message))

(defun drm-insert-TODO-message (message)
  (drm-insert-flagged-comment "TODO" message))

(defun drm-XXX-maybe-error ()
  (interactive)
  (drm-insert-XXX-message "do we want to raise an error here?"))

(defun drm-TODO-handle-error ()
  (interactive)
  (drm-insert-TODO-message "need to handle error here"))

(define-prefix-command 'drm-comment-prefix)
(define-prefix-command 'drm-XXX-comment-prefix)
(define-prefix-command 'drm-TODO-comment-prefix)
(global-set-key (kbd "C-c i") 'drm-comment-prefix)

(global-set-key (kbd "C-c i x") 'drm-XXX-comment-prefix)
(global-set-key (kbd "C-c i t") 'drm-TODO-comment-prefix)

(global-set-key (kbd "C-c i x e") 'drm-XXX-maybe-error)
(global-set-key (kbd "C-c i t e") 'drm-TODO-handle-error)
