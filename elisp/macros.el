(defmacro abbrev-def-list (table &rest defs)
  "Expand a list  lists of abbrev strings, replacement
strings, and replacement functions into a list
of abbrev table definitions for TABLE"
  (declare (indent defun))
  (let ((expansion (list 'progn)))
    (dolist (elt defs)
      (add-to-list 
       'expansion
       `(define-abbrev ,table
          ,(pop elt) ,(pop elt) ,(pop elt))))
    (reverse expansion)))


(defmacro drm-define-in-maps (maps &rest keys)
  (declare (indent defun))
  (let ((expansion (list 'progn)))
    (dolist (map maps)
      (dolist (elem keys)
        (add-to-list
         'expansion
         `(define-key ,map
            ,(pop elem) ,(pop elem)))))
    (reverse expansion)))

(provide 'drm-misc-macros)
