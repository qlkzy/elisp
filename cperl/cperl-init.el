;;; CPerl Initialisation


;; Use Cperl Mode where we would have used perl-mode

(defalias 'perl-mode 'cperl-mode)

;; Load appropriate files
(load-file "~/elisp/cperl/cperl-skeletons.el")


;; General Init Hook

(defun drm-cperl-mode-init () 
  (cperl-set-style "CPerl")
  (setq cperl-font-lock t)
  (setq cperl-invalid-face nil)
  (setq cperl-highlight-variables-indiscriminately t)
  (setq cperl-electric-semi t)
  (setq cperl-electric-brace t)
  (setq cperl-electric-keywords t)
  (cperl-set-style "K&R")
  (setq-default cperl-indent-level 4)
  (setq cperl-indent-level 4)
  (hs-minor-mode t)
  (add-to-list 'hs-special-modes-alist
               '(cperl-mode 
                 "{" "}" "^\\s*#" 
                 nil nil)))

;; Specific things that don't seem to work in a hook

(setq-default cperl-indent-level 4)
(setq cperl-electric-keywords t)


;; Add hooks

(add-hook 'cperl-mode-hook 'drm-cperl-mode-init)
(add-hook 'cperl-mode-hook 'drm-cperl-mode-skeletons)
