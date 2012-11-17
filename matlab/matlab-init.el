;;; Matlab mode customisations

(drm-custom-load "matlab/matlab-mode.el")


(add-to-list 'auto-mode-alist 
             '("\\.m$" . matlab-mode))

(add-to-list 
 'hs-special-modes-alist
 (list 'matlab-mode
       "function"
       "end"
       "%" nil nil))

(drm-custom-load "matlab/matlab-skeletons.el")

