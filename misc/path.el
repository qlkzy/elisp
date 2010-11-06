
;; this shouldn't really be here, but I want to use it
;; (defun drm-force-to-list (x)
;;   (if (listp x)
;;       x
;;     (list x)))

(defun drm-custom-load (&rest path)
  (mapcar (lambda (x)
            (load-file (concat drm-dot-emacs-customisation-path x)))
          path))

(defun drm-custom-init (&rest path)
  (mapcar (lambda (x)
            (drm-custom-load (concat x "/" x "-init.el")))
          path))

