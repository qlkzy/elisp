;;; Key customisations for hide-show mode

(define-prefix-command 'hs-prefix-map)



(drm-define-in-maps (hs-minor-mode-map)
  ;; Prefix
  ((kbd "M-o") 'hs-prefix-map)
  ;; Hide
  ((kbd "M-o a") 'hs-hide-all)
  ((kbd "M-o b") 'hs-hide-block)
  ((kbd "M-o l") 'hs-hide-level)
  ;;Show
  ((kbd "M-o M-a") 'hs-show-all)
  ((kbd "M-o M-b") 'hs-show-block)
  ;;Toggle
  ((kbd "M-o M-o") 'hs-toggle-hiding))

