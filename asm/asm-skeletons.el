(define-skeleton asm-big-comment-header
  "Insert a large comment header into assembly code" nil
  ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" \n
 -4 ";;; " _ \n
 -4 ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" \n)

(define-skeleton asm-med-comment-header
  "Insert a medium comment header into assembly code" nil
  ";;;;;;;;;;;;;;;;;;;;" \n
 -4 ";;; " _ \n
 -4 ";;;;;;;;;;;;;;;;;;;;" \n)

(defun asm-mode-skeleton-init ()
  (abbrev-def-list asm-mode-abbrev-table
    ("medcommhead" "" 'asm-med-comment-header)
    ("bigcommhead" "" 'asm-big-comment-header)))

;; (add-hook 'asm-mode-hook 'asm-mode-skeleton-init)
