;;; C# mode skeletons

(define-skeleton csharp-skeleton-if-statement 
  "Insert if () {}" nil
  > "if ("-") {"\n
  > _ \n
  > -4 "}"\n)

(define-skeleton csharp-skeleton-for-statement
  "Insert for (;;) {}" nil
  > "for ("_";;) {"
  > _ \n
  > -4 "}" \n)

(define-skeleton csharp-skeleton-else-statement
  "Insert an else ... statement" nil
  > "else {" \n
  > _ \n
  > -4 "}" \n)

(define-skeleton csharp-skeleton-else-if-statement
  "Insert an else if ... statement" nil
  > "else if ("_") {"\n
  > _ \n
  > -4 "}"\n)

(define-skeleton csharp-skeleton-while-statement
  "Insert a while ... statement" nil
  > "while ("_") {" \n
  > _ \n
  > -4 "}" \n)

(define-skeleton csharp-skeleton-switch-statement
  "Insert a switch ... statement" nil
  > "switch ("_") {" \n \n
  > -4 "case "_":"\n
  > _ \n
  > "break;" \n \n
  > -4 "default: " \n
  > _ \n
  > "break;" \n \n
  > -8 "}")

(define-skeleton csharp-skeleton-case-statement
  "Insert a case ... statement" nil
  > -4 "case "_":" \n
  > _ \n
  > "break;" \n)

(define-skeleton csharp-skeleton-namespace-declaration
  "Insert a namespace ... declaration" nil
  > "namespace " _ " {" \n
  > _ \n
  > -4 "}")

(define-skeleton csharp-skeleton-class-declaration
  "Insert a class ... declaration" nil
  > "class " _ " {" \n
  > _ \n
  > -4 "}")

(define-skeleton csharp-skeleton-using-statement
  "Insert a using ... statement" nil
  > "using "_";"\n)

(defun csharp-mode-skeleton-init ()
  (define-abbrev csharp-mode-abbrev-table 
    "if" "" 'csharp-skeleton-if-statement)
  (define-abbrev csharp-mode-abbrev-table
    "for" "" 'csharp-skeleton-for-statement)
  (define-abbrev csharp-mode-abbrev-table
    "elsif" "" 'csharp-skeleton-else-if-statement)
  (define-abbrev csharp-mode-abbrev-table
    "else" "" 'csharp-skeleton-else-statement)
  (define-abbrev csharp-mode-abbrev-table
    "while" "" 'csharp-skeleton-while-statement)
  (define-abbrev csharp-mode-abbrev-table
    "switch" "" 'csharp-skeleton-switch-statement)
  (define-abbrev csharp-mode-abbrev-table
    "case" "" 'csharp-skeleton-case-statement)
  (define-abbrev csharp-mode-abbrev-table
    "namespace" "" 'csharp-skeleton-namespace-declaration)
  (define-abbrev csharp-mode-abbrev-table
    "class" "" 'csharp-skeleton-class-declaration)
  (define-abbrev csharp-mode-abbrev-table
    "using" "" 'csharp-skeleton-using-statement))
