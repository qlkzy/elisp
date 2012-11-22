;;; Customisations for assembly language mode

(drm-custom-load "asm/asm-skeletons")

(defun asm-outdent ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (fixup-whitespace)))

(defun asm-indent-properly ()
  (interactive)
  (if (= (point) (line-beginning-position))
      (tab-to-tab-stop)
      (save-excursion
        (beginning-of-line)
        (tab-to-tab-stop))))

(defun drm-asm-init ()
  (define-key asm-mode-map (kbd "<C-tab>") 'asm-outdent)
  (local-unset-key "<tab>")
  (local-set-key  (kbd "<tab>") 'asm-indent-properly)
  (abbrev-mode t)
  (make-local-variable 'align-rules-list)
  (setq align-rules-list
        (list '(text-column-whitespace
                (regexp  . "\\(^\\|\\S-\\)\\([ \t]+\\)")
                (group   . 2)
                (repeat  . t))
              align-rules-list)))


(add-hook 'asm-mode-hook 'drm-asm-init)
(add-hook 'asm-mode-hook 'asm-mode-skeleton-init)
