;; Set up elisp|.emacs.d path loading

(load-file (concat drm-dot-emacs-customisation-path "misc/path.el"))

;; Additional General Lisp
(let ((d default-directory))
  (cd drm-dot-emacs-customisation-path)
  (normal-top-level-add-subdirs-to-load-path)
  (cd d))


(drm-custom-load "elisp/macros")

(drm-custom-init "misc"                 ;general stuff
                 "cperl"                ;nice perl mode
                 "hide-show"            ;hide & show blocks
                 "cc-mode"              ;c/c++
                 "elmode"               ;elisp
                 ;; "python"
                 "auto-hotkey"          ;ahk
                 "matlab"               ;own matlab mode
                 "latex"                ;standard latex mode - convert to auctex at some point
                 "csharp"               ;ugh
                 "asm"                  ;standard assembly language mode
                 ;; "icicles"              ;nice completion (does not play nice with stuff
                 "mpasm"                ;PIC assembly mode - can't remember how finished it is
                 "org"                  ;org-mode - too fancy
                 "outline"              ;good old outline mode
                 "stripes"              ;funny highlighting
                 "graphviz"             ;edit .dot files
                 "mss"                  ;cool start menu hack
                 ;; "color-themes"         ;make things less ugly --DEPRECATED--
                 ;; "tomorrow-theme"
                 "base16-theme"
                 "completion-ui"        ;don't think this is in use
                 "mini-wiki"            ;own crappy wiki
                 "typing"               ;typing tutor
                 ;; "slime"                ;nice lisp stuff
                 ;; "remember"             ;notes mode
                 ;; "viper"                ;vi has some nice features
                 "findr"
                 "cedet"
                 "qmake"
                 "comment"
                 "fortunes"
                 "geiser"
                 "ccl"                  ;CCL standards stuff
                 ;; "git"                  ;add git to VC -- NOW USING MAGIT
                 "license"
                 "changelog"
                 "vbnet"
                 "ido"
                 "rails"
                 "markdown"
                 "haml"
                 "scss"
                 "yasnippet"
                 "vhdl-mode"
                 ;"magit"
                 "uniquify"
                 "cmake"
                 "expand-region"
                 "framemove"
                 "haskell"
                 "arduino"
                 "spotify"
                 "writing"
                 "paredit"
                 "lua-mode"
                 ;; "evil" ; using this vi emulator now :)
                 ;; "multi-term"
                 "ada"
                 "csp-mode"
                 "jq-mode"
                 "web-mode"
                 )

