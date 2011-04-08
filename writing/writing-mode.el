;; Major mode for writing

(defconst writing-text-cols
  70
  "Columns to which we wish to restrict the text")

(defun writing-full-window-width ()
  (let ((edges (window-edges)))
    (- (nth 2 edges)
       (nth 0 edges))))

(defun writing-get-margin (width)
  "Work out the size of the appropriate margins to go around text
to make it fit into WIDTH"
  (/ (- width (+ writing-text-cols)) 2))

(defun writing-set-margins ()
  "Set the margins around text to the correct values for the
window size"
  (set-window-margins nil
                      (writing-get-margin (writing-full-window-width))
                      (writing-get-margin (writing-full-window-width)))
    (setq fill-column (window-width)))

(define-derived-mode writing-mode text-mode "Writing"
  "Mode for general writing"
  (add-hook (make-local-variable 'window-configuration-change-hook) 'writing-set-margins)
  (writing-set-margins)
  (longlines-mode 1))
