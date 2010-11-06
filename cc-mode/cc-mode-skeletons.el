(define-skeleton c-skeleton-if-statement 
  "Insert if () {}" nil
  > "if ("_") {"\n
  > _ \n
  > -4 "}"\n)

(define-skeleton c-skeleton-for-statement
  "Insert for (;;) {}" nil
  > "for ("_";;) {"
  > _ \n
  > -4 "}" \n)

(define-skeleton c-skeleton-else-statement
  "Insert an else ... statement" nil
  > "else {" \n
  > _ \n
  > -4 "}" \n)

(define-skeleton c-skeleton-else-if-statement
  "Insert an else if ... statement" nil
  > "else if ("_") {"\n
  > _ \n
  > -4 "}"\n)

(define-skeleton c-skeleton-while-statement
  "Insert a while ... statement" nil
  > "while ("_") {" \n
  > _ \n
  > -4 "}" \n)

(define-skeleton c-skeleton-switch-statement
  "Insert a switch ... statement" nil
  > "switch ("_") {" \n \n
  > -4 "case "_":"\n
  > _ \n
  > "break;" \n \n
  > -4 "default: " \n
  > _ \n
  > "break;" \n \n
  > -8 "}")

(define-skeleton c-skeleton-case-statement
  "Insert a case ... statement" nil
  > -4 "case "_":" \n
  > _ \n
  > "break;" \n)

(define-skeleton c-skeleton-file-header
  "Insert a file header" nil
  > "/**********************************************************************" \n
  > " **********************************************************************" \n
  > " * " \n
  > " * File: " (buffer-name) \n
  > " * Author: David Morris" \n
  > " * Created At: " \n
  > " * Time-stamp: <>" \n
  > " * Summary: " _ \n
  > " * " \n
  > " * " \n
  > " * " \n
  > " * " \n
  > " * " \n
  > " * " \n
  > " * " \n
  > " * " \n
  > " * " \n
  > " * " \n
  > " * " \n
  > " **********************************************************************" \n
  > " **********************************************************************/" \n)

(define-skeleton c-skeleton-big-comment
  "Insert a large comment header" nil
  > "/****************************************" \n
  > " ****************************************" \n
  > " * " \n
  > " * " _ \n
  > " * " \n
  > " ****************************************" \n
  > " ****************************************/"\n)
  

(define-skeleton c-skeleton-medium-comment
  "Insert a medium comment header" nil
  > "/*************************" \n
  > " *************************" \n
  > " * " \n
  > " * " _ \n
  > " * " \n
  > " *************************" \n
  > " *************************/"\n)
  
(define-skeleton c-skeleton-small-comment
  "Insert a smallcomment header" nil
  > "/********************" \n
  > " * " _ \n
  > " ********************/"\n)

(define-skeleton c-include-guard
  "Insert an #ifndef ... etc." 
  (setq str (skeleton-read "Enter symbol: "))
  > "#ifndef " str \n
  > "#define " str \n 
  > \n
  > - \n
  > \n
  > "#endif /* " str "*/" \n)
  

(defun c-mode-skeleton-init ()
  (define-abbrev c-mode-abbrev-table 
    "if" "" 'c-skeleton-if-statement)
  (define-abbrev c-mode-abbrev-table
    "for" "" 'c-skeleton-for-statement)
  (define-abbrev c-mode-abbrev-table
    "elsif" "" 'c-skeleton-else-if-statement)
  (define-abbrev c-mode-abbrev-table
    "else" "" 'c-skeleton-else-statement)
  (define-abbrev c-mode-abbrev-table
    "while" "" 'c-skeleton-while-statement)
  ;; (define-abbrev c-mode-abbrev-table
    ;; "switch" "" 'c-skeleton-switch-statement)
  (define-abbrev c-mode-abbrev-table
    "case" "" 'c-skeleton-case-statement)
  (define-abbrev c-mode-abbrev-table
    "fileheader" "" 'c-skeleton-file-header)
  (define-abbrev c-mode-abbrev-table
    "bigcommhead" "" 'c-skeleton-big-comment)
  (define-abbrev c-mode-abbrev-table
    "medcommhead" "" 'c-skeleton-medium-comment)
  (define-abbrev c-mode-abbrev-table
    "mincommhead" "" 'c-skeleton-small-comment))


(defun cc-insert-magic-brace ()
  "If an open-brace is the first character on a line, insert a
  matching close-brace two lines down"
  (interactive)
  (let ((start (line-beginning-position)))
    (if (string-match
         "^[[:space:]]*$"
         (buffer-substring (point)
                           (line-beginning-position)))
        (progn
          (insert "{\n")
          (save-excursion
            (insert "\n}\n")
            (indent-region
             start (point))))
      (insert "{"))))
       


;; (defun cpp-mode-skeleton-init ()
;;   (abbrev-def-list c++-mode-abbrev-table
;;     ("if" "" 'c-skeleton-if-statement)
;;     ("for" "" 'c-skeleton-for-statement)
;;     ("elsif" "" 'c-skeleton-else-if-statement)
;;     ("else" "" 'c-skeleton-else-statement)
;;     ("while" "" 'c-skeleton-while-statement)
;;     ("case" "" 'c-skeleton-case-statement)))

(defun cc-mode-skeleton-init ()
  (abbrev-def-list local-abbrev-table
    ("if" "" 'c-skeleton-if-statement)
    ("for" "" 'c-skeleton-for-statement)
    ("elsif" "" 'c-skeleton-else-if-statement)
    ("else" "" 'c-skeleton-else-statement)
    ("while" "" 'c-skeleton-while-statement)
    ("case" "" 'c-skeleton-case-statement))
  (local-set-key (kbd "{") 'cc-insert-magic-brace))

