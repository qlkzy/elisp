(add-to-list 'load-path
             (drm-custom-path "vhdl-mode/vhdl-mode"))

(autoload 'vhdl-mode "vhdl-mode" "VHDL Mode" t)
(setq auto-mode-alist (cons '("\\.vhdl?\\'" . vhdl-mode) auto-mode-alist))

