;; Set up elisp|.emacs.d path loading

(load-file (concat drm-dot-emacs-customisation-path "misc/path.el"))

;; Additional General Lisp
(progn
  (cd "~/elisp")
  (normal-top-level-add-subdirs-to-load-path)
  (cd "~/"))


(drm-custom-load "elisp/macros.el")

(drm-custom-init "misc"                 ;general stuff
                 "cperl"                ;nice perl mode
                 "hide-show"            ;hide & show blocks
                 "cc-mode"              ;c/c++
                 "elmode"               ;elisp
                 "python"               
                 "auto-hotkey"          ;ahk
                 "matlab"               ;own matlab mode
                 "latex"                ;standard latex mode - convert to auctex at some point
                 "csharp"               ;ugh
                 "asm"                  ;standard assembly language mode
                 "icicles"              ;nice completion
                 "mpasm"                ;PIC assembly mode - can't remember how finished it is
                 "org"                  ;org-mode - too fancy
                 "outline"              ;good old outline mode
                 "stripes"              ;funny highlighting
                 "graphviz"             ;edit .dot files
                 "mss"                  ;cool start menu hack
                 "color-themes"         ;make things less ugly
                 "completion-ui"        ;don't think this is in use
                 "mini-wiki"            ;own crappy wiki
                 "typing"               ;typing tutor
                 "slime"                ;nice lisp stuff
                 "nxhtml"               ;nice xhtml/php mode
                 "remember"             ;notes mode
                 ;; "viper"                ;vi has some nice features
                 "findr"
                 ;; "cedet"
                 "qmake"
                 "comment"
                 "geiser"
                 )
