;;; LaTeX mode customisations

(defun d-latex-hook ()
  (font-lock-mode t)
  (turn-on-auto-fill))

(add-hook 'latex-mode-hook 'd-latex-hook)
