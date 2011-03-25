(define-skeleton ccl-standard-if-statement 
  "Insert if () {}" nil
  > "if ("_")" \n
  > -4 "{" \n
  > _ \n
  > -4 "}"\n)


(define-skeleton ccl-standard-for-statement
  "Insert for (;;) {}" nil
  > "for ("_";;)" \n
  > -4 "{" \n
  > _ \n
  > -4 "}" \n)

(define-skeleton ccl-standard-else-statement
  "Insert an else ... statement" nil
  > "else" \n
  > -4 "{" \n
  > _ \n
  > -4 "}" \n)

(define-skeleton ccl-standard-else-if-statement
  "Insert an else if ... statement" nil
  > "else if ("_")" \n
  > -4 "{" \n
  > _ \n
  > -4 "}"\n)

(define-skeleton ccl-standard-while-statement
  "Insert a while ... statement" nil
  > "while ("_")" \n
  > -4 "{" \n
  > _ \n
  > -4 "}" \n)


(define-skeleton ccl-standard-file-header
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

(define-skeleton ccl-standard-big-comment
  "Insert a large comment header" nil
  > "/****************************************" \n
  > " ****************************************" \n
  > " * " \n
  > " * " _ \n
  > " * " \n
  > " ****************************************" \n
  > " ****************************************/"\n)


(define-skeleton ccl-standard-medium-comment
  "Insert a medium comment header" nil
  > "/*************************" \n
  > " *************************" \n
  > " * " \n
  > " * " _ \n
  > " * " \n
  > " *************************" \n
  > " *************************/"\n)

(define-skeleton ccl-standard-small-comment
  "Insert a smallcomment header" nil
  > "/********************" \n
  > " * " _ \n
  > " ********************/"\n)

(define-skeleton ccl-standard-copyright-notice
  "Insert a CCL Copyright notice" nil
  > "/* Copyright (C) Cambridge Consultants Ltd., 2011" \n
  > "Cambridge Consultants Project Reference P" _ " */" \n)


(defun ccl-cc-skeletons ()
  (interactive)
  (setq skeleton-further-elements '((abbrev-mode nil)))
  (abbrev-def-list local-abbrev-table
    ("if" "" 'ccl-standard-if-statement)
    ("for" "" 'ccl-standard-for-statement)
    ("elsif" "" 'ccl-standard-else-if-statement)
    ("else" "" 'ccl-standard-else-statement)
    ("while" "" 'ccl-standard-while-statement)
    ("cclcopyright" "" 'ccl-standard-copyright-notice)
    ("case" "case"))
  (local-set-key (kbd "{") 'cc-insert-magic-brace))

