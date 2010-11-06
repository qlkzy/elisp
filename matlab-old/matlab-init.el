;;; MATLAB mode

(load-file "~/elisp/matlab/matlab-skeletons.el")

(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)

(add-to-list 'auto-mode-alist 
             '("\\.m$" . matlab-mode))

(setq matlab-shell-command-switches '("-nojvm"))


(defun d-matlab-init ()
  (font-lock-mode t)
  (turn-off-auto-fill)
  (setq matlab-indent-funtion nil)
  (setq matlab-indent-level 4)
  (font-lock-add-keywords 
   nil
   '(("\\<\\(classdef\\)" . font-lock-keyword-face)
     ("\\<\\(properties\\)" . font-lock-keyword-face)
     ("\\<\\(methods\\)". font-lock-keyword-face)
     ("\\<\\(events\\)". font-lock-keyword-face)
     ("classdef \\(\\w+\\)" . font-lock-function-name-face))))

(add-hook 'matlab-mode-hook 'd-matlab-init t)

;; END MATLAB mode
