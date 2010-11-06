;; ;;; Matlab mode skeletons


;; (define-skeleton matlab-header-1
;;   "Insert a large comment header" nil
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
;;   > "%%%%    "_""\n
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n)

;; (define-skeleton matlab-header-2
;;   "Insert a medium comment header" nil
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
;;   > "%%  "_""\n
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n)

;; (define-skeleton matlab-header-3
;;   "Insert a small comment header" nil
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n
;;   > "% "_""\n
;;   > "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"\n)

;; (define-skeleton matlab-if-end
;;   "Insert an if...end construct" nil
;;   > "if ("_")"\n
;;   > _ \n
;;   > -4 "end"\n)

;; (define-skeleton matlab-short-single-sidebar
;;   "Insert a column of comment characters" nil
;;   > "% " _ \n
;;   > "% " \n
;;   > "% " \n)

;; (define-skeleton matlab-long-single-sidebar
;;   "Insert a long column of comment characters" nil
;;     > "% " _ \n
;;     > "% " \n
;;     > "% " \n
;;     > "% " \n
;;     > "% " \n
;;     > "% " \n
;;     > "% " \n
;;     > "% " \n)

;; (define-skeleton matlab-short-double-sidebar
;;   "Insert a column of comment characters" nil
;;   > "%%  " _ \n
;;   > "%%  " \n
;;   > "%%  " \n)

;; (define-skeleton matlab-long-double-sidebar
;;   "Insert a long column of comment characters" nil
;;     > "%%  " _ \n
;;     > "%%  " \n
;;     > "%%  " \n
;;     > "%%  " \n
;;     > "%%  " \n
;;     > "%%  " \n
;;     > "%%  " \n
;;     > "%%  " \n)

;; (define-skeleton matlab-for-end
;;   "Insert a for...end loop" nil
;;   > "for "_""\n
;;   > _ \n
;;   > -4 "end"\n)

;; (define-skeleton matlab-while-end
;;   "Insert a while...end loop" nil
;;   > "while ("_")"\n
;;   > _ \n
;;   > -4 "end"\n)

;; (define-skeleton matlab-elseif
;;   "Insert an elseif" nil
;;   > -4 "elseif ("_")"\n)

;; (define-skeleton matlab-display
;;   "Insert a display('') statement" nil
;;   > "display ('"_"');"\n)

;; (define-skeleton matlab-string-to-double-closed
;;   "Insert a str2double() statement" nil
;;   > "str2double("-")")

;; (define-skeleton matlab-string-to-double-open
;;   "Insert a str2double( statement" nil
;;   > "str2double("-)

;; (define-skeleton matlab-function
;;   "Insert a function = ... statement" nil
;;   > "function "_" = "_" ("_")")


;; (defun d-matlab-skeleton-hook ()
;;   (define-abbrev matlab-mode-abbrev-table
;;     "bigcommhead" "" 'matlab-header-1)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "medcommhead" "" 'matlab-header-2)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "mincommhead" "" 'matlab-header-3)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "commss" "" 'matlab-short-single-sidebar)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "commsl" "" 'matlab-long-single-sidebar)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "commds" "" 'matlab-short-double-sidebar)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "commdl" "" 'matlab-long-double-sidebar)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "if" "" 'matlab-if-end)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "for" "" 'matlab-for-end)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "while" "" 'matlab-while-end)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "elseif" "" 'matlab-elseif)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "function" "" 'matlab-function)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "display" "" 'matlab-display)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "s2dc" "" 'matlab-string-to-double-closed)
;;   (define-abbrev matlab-mode-abbrev-table
;;     "s2do" "str2double(" nil)
;;   (setq abbrev-mode 1))



;; ;; (defun matlab-setup-abbrev-mode ()
;; ;;   (message "Adding Hook")
;; ;;   (make-local-variable 'pre-abbrev-expand-hook)
;; ;;   (add-hook 'pre-abbrev-expand-hook 'matlab-pre-abbrev-expand-hook)
;; ;;   (abbrev-mode 1))


;; (add-hook 'matlab-mode-hook 'd-matlab-skeleton-hook t)
;; ;; (add-hook 'matlab-mode-hook 'matlab-setup-abbrev-mode t) 
