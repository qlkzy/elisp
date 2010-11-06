;;; Customisations for C# Mode

(require 'compile)

(load "~/elisp/csharp/csharp-skeletons.el")

(autoload 'csharp-mode 
  "csharp-mode" "Major mode for editing C# code." t)
;; (add-to-list 'auto-mode-alist 
;;              '("\\.cs$" . csharp-mode))
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(defun c-sharp-init ()
  (push '("^\\(.*\\)(\\([0-9]+\\),\\([0-9]+\\)): error" 
          1 2 3 2)
        compilation-error-regexp-alist)
  (push '("^\\(.*\\)(\\([0-9]+\\),\\([0-9]+\\)): warning" 
          1 2 3 1)
        compilation-error-regexp-alist)
  (hs-minor-mode t)
  (add-to-list 'hs-special-modes-alist
               '(csharp-mode
                 "{" "}" "/[*/]"
                 nil nil))
  (font-lock-mode t))


;(add-hook 'csharp-mode-hook 'c-mode-general-init)
(add-hook 'csharp-mode-hook 'csharp-mode-skeleton-init)
(add-hook 'csharp-mode-hook 'c-sharp-init)
