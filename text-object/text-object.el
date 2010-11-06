(defun text-object-make (start withinp)
  (cons pos withinp))

(defun text-object-start (object)
  (nth 0 object))

(defun text-object-withinp (object)
  (nth 1 object))

(defun text-object-move-to (object)
  (goto-char (text-object-start object)))

(defun text-object-within? (object pos)
  (funcall (text-object-withinp object) pos))

(defun text-object-apply (fn object)
  (goto-char (text-object-start))
  (while (text-object-within? object)
    (funcall fn)
    (forward-char)))

