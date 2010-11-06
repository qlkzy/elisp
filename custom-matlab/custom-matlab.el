(load-file "~/elisp/custom-matlab/custom-matlab-vars.el")

(defun custom-matlab-make-keyword-regex (strings)
    (regexp-opt strings))


(defun custom-matlab-make-font-lock-regexes ()
  (list (cons (custom-matlab-make-keyword-regex custom-matlab-keywords)
              font-lock-keyword-face)))

(defun custom-matlab-setup-font-lock ()
  nil)



(define-generic-mode custom-matlab-mode
  '("%")
  ()
  (custom-matlab-make-font-lock-regexes)
  ()
  ())
