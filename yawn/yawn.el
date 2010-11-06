;; (defmacro yawn-assume-predicate (pred &rest body)
;;   (declare (indent defun))
;;   `(if (not (funcall ,pred))
;;        body))


(defun yawn-non-empty-string (str)
  (and (stringp str)
       (not (= 0 (string-to-char str)))))

(defun yawn-remove-leading-whitespace (str)
  (replace-regexp-in-string "^[[:space:]]*"
                            ""
                            str))

(defconst yawn-tagname-regexp
  "^<\\(/?\\)\\([[:word:]]+[^>]*\\)>"
  "Regular expression for matching tags in string")

(defun yawn-last-match-grouping (str n)
  "Extract the Nth grouping from the last match, assuming it was
 against str."
  (substring str
             (nth (* 2 n) (match-data))
             (nth (+ (* 2 n) 1) (match-data))))


(defun yawn-alist-from-pairs (args)
  "Make an alist from pairs of arguments"
  (let (result)
    (dotimes (el (/ (length args) 2))
      (setq result 
            (cons (list (nth (* 2 el) args)
                        (nth (+ (* 2 el) 1) args))
                  result)))
    (nreverse result)))

(defun yawn-parse-tag-innards (str)
  "Take all the stuff between the angle brackets, and produce a
list with the symbol for the tag's name, and an alist for the
tag's attributes."
  (let ((l (split-string-and-unquote str "\\s-+\\|=")))
    (list (read (car l))                       ;tagname
          (mapcar (lambda (x)                  ;attributes
                    (cons (read (car x))
                          (cdr x)))
                  (yawn-alist-from-pairs (cdr l))))))

(defun yawn-extract-tag (str)
  "Return a list of the form
;(TAG-TYPE TAG-NAME REST), where:

TAG-TYPE is T if the tag is an opening one, and NIL if a closing
tag.

TAG-NAME is the name of the tag - foo in <foo>.

REST is everything after the closing angle-bracket."
  (when (string-match yawn-tagname-regexp str)
    (let ((tag-type (yawn-last-match-grouping str 1))
          (tag-innards (yawn-last-match-grouping str 2)))
      (list (not (yawn-non-empty-string tag-type))
            (yawn-parse-tag-innards tag-innards)
            (replace-regexp-in-string yawn-tagname-regexp ""
                                      str)))))


(defun yawn-extract-string (str)
  "Extract everything up to the opening angle bracket of the next
 tag."
  (when (yawn-non-empty-string str)
        (let ((pos (string-match "<" str)))
          (list (substring str 0 pos)
                (substring str pos)))))

(defun yawn-compress-whitespace (str)
  "Remove repeated whitespace in STR"
  (replace-regexp-in-string "[[:space:]\n]+" " "
                            str))

(defun yawn-trim-whitespace (str)
  (replace-regexp-in-string 
   "^[[:space:]\n]*" ""
   (replace-regexp-in-string
    "[[:space:]\n]*$" ""
    str)))

(split-string-and-unquote "foo=\"bar baz\" woot" "\\s-+\\|=")

(defun yawn-parse-string-old (str)
  "Convert an HTML string to a Lisp tree structure"
  (setq str (yawn-remove-leading-whitespace str))
  (let ((html-tree nil)
        (keep-going t))
    (while (and (yawn-non-empty-string str)
                keep-going)
    ;; if we're out of strings, stop
    ;; otherwise, recurse down the hierarchy
      (let* ((tag-set (yawn-extract-tag str))
             (body (yawn-extract-string (nth 2 tag-set)))
             (curr (nth 0 body))
             (next (nth 1 body)))
        (when next
          (if (nth 0 tag-set)
              (add-to-list 'html-tree
                           (list (car (nth 1 tag-set))
                                 (cdr (nth 1 tag-set))
                                 (yawn-trim-whitespace
                                  (yawn-compress-whitespace curr))
                                 (yawn-parse-string next)))
            (setq str (nth 2 (yawn-extract-tag next))
                  keep-going nil)))))))


(defun yawn-tag-open (tag)
  (nth 0 tag))

(defun yawn-tag-tag (tag)
  (nth 1 tag))

(defun yawn-tag-rest (tag)
  (nth 2 tag))

(defun yawn-parse-string (str)
  (let (result)
    (while (yawn-tag-open (yawn-extract-tag str))
      (let ((elem 
        (setq str (yawn-tag-rest 


(print (yawn-parse-string "<tag>foo<bar>baz</bar>quux<woot>hawt</woot></tag>") 'insert)





(print (yawn-parse-string "<html> <head> <title>A simple test page</title> </head> <body>
This is a <i>simple</i> test page <a href=\"asdg\">asdg</a></body> </html>") 'insert)



(yawn-extract-tag "<html> <head> <title>Simple</title> </head>
<body> This is a <i>simple</i> test page <a
href=\"asdg\">asdg</a></body> </html>")




(yawn-parse-tag-innards "href=\"boo\"")
