;;; keys.el
;;; general keybindings

;; Number Pad

(drm-custom-load "misc/numpad-prefixes.el")

;; Align

(define-prefix-command 'drm-align-map)

(global-set-key (kbd "C-c a") 'drm-align-map)

(global-set-key (kbd "C-c a a") 'align)
(global-set-key (kbd "C-c a r") 'align-regexp)
(global-set-key (kbd "C-c a p") 'drm-align-paragraph)


;; Misc
(global-set-key (kbd "<apps>") 'execute-extended-command)

(global-set-key (kbd "C-x <down>") 'next-multiframe-window)
(global-set-key (kbd "C-x <up>") 'previous-multiframe-window)
(global-set-key (kbd "C-c y") 'yow)
(global-set-key (kbd "C-c h t") 'totd)
(global-set-key (kbd "C-c r") 'reload-dot-emacs)

(global-set-key [f11] 'toggle-fullscreen)
<<<<<<< HEAD
=======

>>>>>>> 6e65e9793ed5ed6783c7b8e82c9b0a74ce4612a8

;; Buffer manipulation
(define-prefix-command 'ctrl-c-b-map)
(global-set-key (kbd "C-c b") 'ctrl-c-b-map)
(define-key 'ctrl-c-b-map (kbd "g") 'drm-switch-to-buffer-set)
(define-key 'ctrl-c-b-map (kbd "s") 'drm-subdivide-windows)
(define-key 'ctrl-c-b-map (kbd "f") 'drm-blist-save)
(define-key 'ctrl-c-b-map (kbd "r") 'drm-blist-read)


;; Text manipulation

(global-set-key (kbd "C-c e") 'fc-eval-and-replace)

(global-set-key (kbd "C-;") 'drm-comment-line)
(global-set-key (kbd "C-M-;") 'drm-comment-header)


;;; Smart copy/paste
(global-set-key (kbd "M-S-<down>") 'duplicate-start-of-line-or-region)
(global-set-key (kbd "<M-S-right>") 'drm-duplicate-sexp)
(global-set-key (kbd "M-S-SPC") 'jao-copy-line)

;;; Subword stuff
(global-set-key (kbd "M-F") 'drm-forward-subword)
(global-set-key (kbd "M-B") 'drm-backward-subword)
(global-set-key (kbd "M-D") 'drm-kill-subword)
(global-set-key (kbd "<M-S-backspace>") 'drm-backward-kill-subword)


;; Other stuff
;; (global-set-key (kbd "<f12>") 'drm-slotify-function)
(global-set-key (kbd "C-#") 'drm-bracket-replace)


;; eshell
(global-set-key (kbd "<f12>") 'shell)

;; fast text maniupulation
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-Z") 'zap-to-char)


(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; build
(define-prefix-command 'drm-build-prefix)
(global-set-key (kbd "C-c SPC") 'drm-build-prefix)
(global-set-key (kbd "C-c SPC SPC") 'compile)


;; Tags

;; (define-prefix-command 'drm-tags-map)

;; (global-set-key (kbd "C-c t") 'drm-tags-map)

;; (define-key 'drm-tags-map (kbd "c") 'drm-tags-retag-current-directory)
;; (define-key 'drm-tags-map (kbd "r") 'drm-tags-retag-current-tree)
