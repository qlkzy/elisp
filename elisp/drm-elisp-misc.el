
(defmacro drm-do-if-bound (fun &optional pred &rest args)
  "If FUN is defined as a function, and pred is true, call (FUN
ARGS)"
  `(when (and (fboundp (quote ,fun))
              ,(if pred
                   (if (functionp pred)
                       (funcall pred)
                     (eval pred))
                 fun))
     (,fun ,@args)))

(provide 'drm-elisp-misc)
