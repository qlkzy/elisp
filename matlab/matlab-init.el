;;; Matlab mode customisations

(load-file "~/elisp/matlab/matlab-mode.el")


(add-to-list 'auto-mode-alist 
             '("\\.m$" . matlab-mode))

(add-to-list 
 'hs-special-modes-alist
 (list 'matlab-mode
       "function"
       "end"
       "%" nil nil))

(load-file "~/elisp/matlab/matlab-skeletons.el")

