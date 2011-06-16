(define-skeleton python-skeleton-def-statement
  "Insert def (): <docstring>" nil
  > "def "_"():"\n
  > "    \"\"\""\n
  > \n
  > "    \"\"\""\n)

(define-skeleton python-skeleton-class-statement
  "Insert class : <docstring>" nil
  > "class "_":"\n
  > "    \"\"\""\n
  > \n
  > "    \"\"\""\n)

(define-skeleton python-skeleton-if-statement
  "Insert if :" nil
  > "if "_":"\n)

(define-skeleton python-skeleton-elif-statement
  "Insert elif :" nil
  > "elif "_":"\n)

(define-skeleton python-skeleton-else-statement
  "Insert else :" nil
  > "else:"\n
  > _)


(defun drm-python-skeletons ()
  (interactive)
  (abbrev-def-list local-abbrev-table
    ("def" "" (lambda () 
                (drm-insert-skeleton-with-indent 'python-skeleton-def-statement)))
    ("class" "" (lambda () 
                (drm-insert-skeleton-with-indent 'python-skeleton-class-statement)))
    ("if" "" (lambda () 
                (drm-insert-skeleton-with-indent 'python-skeleton-if-statement)))
    ("elif" "" (lambda () 
               (drm-insert-skeleton-with-indent 'python-skeleton-elif-statement)))
    ("else" "" (lambda () 
                 (drm-insert-skeleton-with-indent 'python-skeleton-else-statement)))))
