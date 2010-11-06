(defvar drm-fortune-path
  "~/elisp/fortunes/")

(defvar drm-fortune-files
  '("catv" "doc" "plan9" "fortunes" "openbsd" "freebsd"
    "freebsd-offensive" "plan9"))

    


(defvar drm-fortune-file
  "~/elisp/fortunes/fortunes.txt")

(defvar drm-fortune-idle-delay
  10)

(defun drm-get-fortune-file ()
  (concat drm-fortune-path
          (nth (random (safe-length drm-fortune-files))
               drm-fortune-files)
          ".txt"))
  
       

(defun drm-get-fortune ()
  (with-temp-buffer
    (insert-file (drm-get-fortune-file))
    (let* ((fortune-count (- (how-many "^%") 1))
           (f-num (random fortune-count))
           (f-beg (re-search-forward "^%" nil t f-num)))
      (buffer-substring f-beg
                        (- (re-search-forward "^%") 1)))))

(defun drm-fortune ()
  (interactive)
  (message (drm-get-fortune)))

(defun drm-idle-fortune ()
  (interactive)
  (run-with-idle-timer drm-fortune-idle-delay nil 'drm-fortune))

(defun drm-idle-fortune-stop ()
  (interactive)
  (cancel-function-timers 'drm-fortune))


(provide 'drm-fortunes)

