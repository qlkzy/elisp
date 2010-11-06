;;;-)



(defvar peril-sensitive-sunglasses-active nil)

(defun toggle-peril-sensitive-sunglasses ()
  (interactive)
  (if (eql peril-sensitive-sunglasses-active t)
      (progn
        (deactivate-peril-sensitive-sunglasses)
        (setq peril-sensitive-sunglasses-active nil))
    (progn
      (activate-peril-sensitive-sunglasses)
      (setq peril-sensitive-sunglasses-active t))))


;;; Inspired by Luke Gorrie <luke at bluetail.com>
(defun activate-peril-sensitive-sunglasses ()
  "With apologies to Zaphod Beeblebrox."
  (interactive)
  (color-theme-peril-sensitive-sunglasses))


(defun deactivate-peril-sensitive-sunglasses ()
  (interactive)
  (condition-case nil
      (funcall (cadr color-theme-history))
    (color-theme-d-custom)))


(define-prefix-command 'humour-keys)

(global-set-key (kbd "C-c h") 'humour-keys)

(global-set-key (kbd "C-c h s") 'toggle-peril-sensitive-sunglasses)

(global-set-key (kbd "C-c h f") 'drm-fortune)
