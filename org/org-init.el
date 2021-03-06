;;; Org mode customisations



(setq org-return-follows-links t)
(setq org-default-notes-file "~/notes/remember.org")


;;; hiding/showing keys in org (that actually work)

(define-prefix-command 'org-hs-prefix-map)

;; ...this used to do something
(defun drm-org-init ()
  ;; org seens puzzlingly keen to stomp on its own keybindings...
  (drm-define-in-maps (org-mode-map)
    ;; Prefix
    ((kbd "M-o") 'org-hs-prefix-map)
    ;; Show
    ((kbd "M-o a") 'show-all)
    ((kbd "M-o b") 'show-branches)
    ((kbd "M-o e") 'show-entry)
    ((kbd "M-o s") 'show-subtree)
    ;;Hide
    ((kbd "M-o M-e") 'hide-entry)
    ((kbd "M-o M-l") 'hide-leaves)
    ((kbd "M-o M-u") 'hide-sublevels)
    ((kbd "M-o M-s") 'hide-subtree)
    ((kbd "M-o M-o") 'hide-other)
    ;; Map agenda - which they want to set to one of my keys! to a
    ;; useless org function
    ((kbd "C-c C-a") 'org-agenda)
    ;; use handy keys for really basic features
    ((kbd "C-j") 'org-insert-subheading))
  (setq org-time-clocksum-format
        '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))

;; (org-remember-insinuate)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (java . t)))

(defun my-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str "^"))
      (while (> level 2)
        (setq level (1- level)
              str (concat str "--")))
      (concat str "-> "))))

(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)

(setq org-agenda-clockreport-parameter-plist '(:link t :maxlevel 3))


(add-to-list 'org-agenda-files "~/notes/")

(add-hook 'org-mode-hook 'drm-org-init)
