(add-to-list 'load-path
             (drm-custom-path "yasnippet/yasnippet"))
(require 'yasnippet) ;; not yasnippet-bundle
(setq yas/prompt-functions '(yas/x-prompt yas/ido-prompt yas/completing-prompt))
(yas/global-mode 1)
(add-to-list 'yas/snippet-dirs
             (drm-custom-path "yasnippet/snippets"))
