;;; Customisations for hide-show mode

(load-library "hideshow")

(drm-custom-load "hide-show/hide-show-keys.el")

;; (define-prefix-command 'hs-prefix-map)

;; (drm-define-in-maps (hs-prefix-map)
;;   ((kbd "M-o") 'hs-prefix-map)
;;   ((kbd "M-o a") 'hs-hide-all)
;;   ((kbd "M-o b") 'hs-hide-block)
;;   ((kbd "M-o l") 'hs-hide-level)
;;   ((kbd "M-o M-a") 'hs-show-all)
;;   ((kbd "M-o M-b") 'hs-show-block)
;;   ((kbd "M-o M-o") 'hs-toggle-hiding))


;; (defadvice goto-line (after expand-after-goto-line
;;                             activate compile)
;;   "hideshow-expand affected block when using goto-line in a collapsed buffer"
;;   (save-excursion
;;     (hs-show-block)))


;; (defadvice goto-char (after expand-after-goto-char
;;                             activate compile)  
;;   "hideshow-expand affected block when using goto-char in a collapsed buffer"
;;   (save-excursion
;;     (hs-show-block)))
