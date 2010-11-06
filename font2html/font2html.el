(defun drm-current-char ()
  (if (char-after)
      (char-to-string
       (char-after))
    ""))

(defun buffer-face-data ()
  (save-excursion
    (let ((text-with-colours nil)
          (current-foreground nil)
          (current-background nil)
          (current-text ""))
      (goto-char (point-min))
      (while (< (point)
                (point-max))
        (if (and (equal current-foreground
                        (foreground-color-at-point))
                 (equal current-background
                        (background-color-at-point)))
            (setq current-text (concat current-text
                                (drm-current-char)))
          (progn
            (setq text-with-colours
                  (cons
                   (list (cons current-foreground
                               current-background)
                         current-text)
                   text-with-colours))
            (setq current-foreground 
                  (foreground-color-at-point)
                  current-background
                  (background-color-at-point)
                  current-text (drm-current-char))))
        (forward-char))
      (message (format "~d" (point)))
      (cdr (reverse text-with-colours)))))

(defun buffer-to-html ()
  (let ((html-data (concat
                    "<html>\n"
                    "<body>\n"
                    "<pre>\n"
                    "<p style=\""
                    "color:" (face-foreground 'default) ";"
                    "background:" (face-background 'default) "\">\n")))
    (dolist (elem (buffer-face-data))
      (setq html-data
            (concat html-data
                    "<span style=\""
                    "color:" (caar elem) ";"
                    "background:" (cdar elem)
                    "\">" 
                    (cadr elem)
                    "</span>")))
    (concat
     html-data
     "\n</pre>"
     "\n</p>"
     "\n</body>"
     "\n</html>")))
