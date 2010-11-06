;;; Keybindings for Custom Stuff

(define-prefix-command 'perl-utils-map)

(define-prefix-command 'perl-utils-region-map)

(global-set-key (kbd "C-c p") 'perl-utils-map)

(global-set-key (kbd "C-c p r") 'perl-on-region)

(global-set-key (kbd "C-c p d") 'perl-on-line)

;; (global-set-key (kbd "C-c p r") 'perl-utils-region-map)

;; (global-set-key (kbd "C-c p r p") 'perl-print-region)

;; (global-set-key (kbd "C-c p r l") 'perl-loop-region)

;; (global-set-key (kbd "C-c p r e") 'perl-execute-region)

;; (global-set-key (kbd "C-c p i") 'perl-insert)

;; (global-set-key (kbd "C-c p d") 'perl-duplicate-line)
