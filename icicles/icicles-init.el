;;; Load icicles

(defun drm-icicle-init ()
  (setq icicle-top-level-key-bindings
        (remove '(set-mark-command icicle-goto-marker-or-set-mark-command t) icicle-top-level-key-bindings))
  (setq icicle-change-region-background-flag t)
  (setq icicle-region-background "#606060")
  (setq icicle-default-value t)
  (setq completion-ignore-case t))


(add-hook 'icicle-mode-hook 'drm-icicle-init)

(load-library "hexrgb")
(require 'two-column)
(load-library "icicles")
(load-library "crosshairs")
(load-library "icomplete+")

(setq completion-ignore-case t)
(setq icicle-default-value t)


;;; Setup Faces

(set-face-attribute 'icicle-Completions-instruction-1 nil
                    :foreground "#AC4ACF4A0000")
(set-face-attribute 'icicle-Completions-instruction-2 nil
                    :foreground "#0000D53CE53C")
(set-face-attribute 'icicle-candidate-part nil
                    :background "#151700145197")
(set-face-attribute 'icicle-common-match-highlight-Completions nil
                    :foreground "#2017A71F2017")
(set-face-attribute 'icicle-complete-input nil
                    :foreground "#F19EAA64519E")
(set-face-attribute 'icicle-completion nil
                    :foreground "#0000D53CD53C")
(set-face-attribute 'icicle-current-candidate-highlight nil
                    :background "#69D40F460000")
(set-face-attribute 'icicle-extra-candidate nil
                    :background "#4517305D0000")
(set-face-attribute 'icicle-historical-candidate nil
                    :foreground "#DBD599DF0000")
(set-face-attribute 'icicle-input-completion-fail nil
                    :background "#22225F5F2222")
(set-face-attribute 'icicle-input-completion-fail-lax nil
                    :background "#00005E3B5A8D")
(set-face-attribute 'icicle-match-highlight-Completions nil
                    :foreground "#1F1FA21CA21C")
(set-face-attribute 'icicle-multi-command-completion nil
                    :foreground "#0000D53CD53C"
                    :background "#0B3530007533")
(set-face-attribute 'icicle-proxy-candidate nil
                    :background "#316B22970000")
(set-face-attribute 'icicle-saved-candidate nil
                    :background "gray20")
(set-face-attribute 'icicle-search-context-level-1 nil
                    :background "#4AE452524A16")
(set-face-attribute 'icicle-search-context-level-2 nil
                    :background "#52524A164E34")
(set-face-attribute 'icicle-search-context-level-3 nil
                    :background "#52524FCF4A16")
(set-face-attribute 'icicle-search-context-level-4 nil
                    :background "#4C7F4A165252")
(set-face-attribute 'icicle-search-context-level-5 nil
                    :background "#086E52520000")
(set-face-attribute 'icicle-search-context-level-6 nil
                    :background "#52520000295C")
(set-face-attribute 'icicle-search-context-level-7 nil
                    :background "#5252396C0000")
(set-face-attribute 'icicle-search-context-level-8 nil
                    :background "#187E00005252")
(set-face-attribute 'icicle-search-current-input nil
                    :foreground "White"
                    :background "#7F0D00007F0D")
(set-face-attribute 'icicle-search-main-regexp-current nil
                    :background "#00004AA652F1")
(set-face-attribute 'icicle-search-main-regexp-others nil
                    :background "#348608690000")
(set-face-attribute 'icicle-special-candidate nil
                    :background "#176900004E0A")
(set-face-attribute 'icicle-whitespace-highlight nil
                    :background "#000093F402A2")

(icy-mode t)

(setq icicle-inhibit-ding-flag t)
