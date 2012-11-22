
;; this shouldn't really be here, but I want to use it
;; (defun drm-force-to-list (x)
;;   (if (listp x)
;;       x
;;     (list x)))

(defun drm-custom-load (&rest path)
  (mapcar (lambda (x)
            (load (concat drm-dot-emacs-customisation-path x)))
          path))

(defun drm-custom-init (&rest path)
  (mapcar (lambda (x)
            (drm-custom-load (concat x "/" x "-init")))
          path))

(defun drm-custom-path (path)
  (concat drm-dot-emacs-customisation-path path))

(defun drm-custom-load-path-install (path)
  (add-to-list 'load-path
               (drm-custom-path path)))
