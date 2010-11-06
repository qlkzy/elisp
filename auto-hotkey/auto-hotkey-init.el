;;; Auto-hotkey Mode Init file

;; Configure autoloading

(add-to-list 'auto-mode-alist '("\\.ahk\\'" . ahk-mode))

(autoload 'ahk-mode "ahk-mode")

(setq ahk-syntax-directory 
      (concat (getenv "ProgramFiles")
              "/AutoHotkey/Extras/Editors/Syntax/"))

