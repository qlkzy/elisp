(autoload 'yaml-mode "yaml-mode.el" "Major mode for editing YAML files" t)

(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

