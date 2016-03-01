(require 'jq-mode)
(autoload 'jq-mode "jq-mode.el"
  "Major mode for editing jq files" t)
(add-to-list 'auto-mode-alist '("\\.jq$" . jq-mode))

(global-set-key (kbd "C-c j") 'jq-interactively)
