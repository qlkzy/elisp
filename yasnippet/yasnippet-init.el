(require 'yasnippet) ;; not yasnippet-bundle
(setq yas/snippet-dirs (drm-custom-path "yasnippet/snippets"))
(setq yas/prompt-functions '(yas/x-prompt yas/ido-prompt yas/completing-prompt))
(yas/global-mode 1)
