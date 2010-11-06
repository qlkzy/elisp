;;; Mode for editing MPASM files for PIC microcontrollers

(defconst mpasm-opcodes-list
  '("addwf" "addwfc" "andwf" "addwfc" "clrf" "comf" "cpfseq" "cpfsgt"
"cpfslt" "decf" "decfsz" "decfsnz" "incf" "incfsz" "infsnz" "iorwf"
"movf" "movff" "movwf" "mulwf" "negf" "rlcf" "rlncf" "rrcf" "rrncf"
"setf" "subfwb" "subwf" "subwfb" "swapf" "tstfsz" "xorwf" "bcf" "bsf"
"btfsc" "btfss" "btg" "bc" "bn" "bnc" "bnn" "bnov" "bnz" "bov" "bra"
"bz" "call" "clrwdt" "daw" "goto" "nop" "pop" "push" "rcall" "reset"
"retfie" "retlw" "return" "sleep" "addlw" "andlw" "iorlw" "lfsr"
"movlb" "movlw" "mullw" "retlw" "sublw" "xorlw" "tblrd*" "tblrd*+"
"tblrd*-" "tblrd+*" "tblwt*" "tblwt*+" "tblwt*-" "tblwt+*" "org"
"cblock" "list" "config"))

(defconst mpasm-preprocesor-list
  '("access_ovr" "__badram" "__badrom" "bankisel" "banksel" "cblock"
"code" "code_pack" "__config" "__fuses" "config" "constant" "da"
"data" "db" "de" "#define" "dt" "dw" "else" ".else" "#else" "end"
"endc" "endif" ".endif" "#endif" ".fi" "endm" "endw" ".endw" "equ"
"error" "errorlevel" "exitm" "expand" "extern" "fill" "global" "idata"
"idata_acs" "__idlocs" "if" "#if" ".if" "ifdef" "#ifdef" "ifndef"
"#ifndef" "#include" "include" "list" "local" "macro" "__maxram"
"__maxrom" "messg" "noexpand" "nolist" "org" "page" "pagesel"
"pageselw" "processor" "radix" "res" "set" "space" "subtitle" "title"
"udata" "udata_acs" "udata_ovr" "udata_shr" "#undefine" "variable"
"while"))

(defconst mpasm-mode-map
  (make-sparse-keymap))
(defvar mpasm-mode-abbrev-table
  (make-abbrev-table))

(defconst mpasm-mode-electric-newline t)


(defun mpasm-mode-skeleton-init ()
  (define-skeleton mpasm-big-comment-header
    "Insert a large comment header into assembly code" nil
    -4 ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" \n
    -4 ";;; " _ \n
    -4 ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" \n)
  (define-skeleton mpasm-med-comment-header
    "Insert a medium comment header into assembly code" nil
    -4 ";;;;;;;;;;;;;;;;;;;;" \n
    -4 ";;; " _ \n
    -4 ";;;;;;;;;;;;;;;;;;;;" \n))


(defun mpasm-make-keyword-regex (strings)
  (let (result)
      (dolist (elt strings result)
        (setq result 
              (cons (concat " " elt) result)))
      (regexp-opt result)))


(defun mpasm-make-preprocessor-regex (strings)
  (let (result)
    (dolist (elt strings result)
      (setq result 
            (cons elt result)))
    (regexp-opt result)))


(defun mpasm-make-font-lock-regexes ()
  (list (cons (mpasm-make-keyword-regex mpasm-opcodes-list) 
              font-lock-keyword-face)
        (cons (mpasm-make-preprocessor-regex mpasm-preprocesor-list)
              font-lock-builtin-face)
        (cons "^[A-za-z]+"
              font-lock-function-name-face)))


(defun mpasm-indent-function ()
  (interactive)
  (if (bolp)
      (tab-to-tab-stop)
    (save-excursion
      (back-to-indentation)
      (if (bolp)
          (tab-to-tab-stop)
        (fixup-whitespace)))))

(defun mpasm-newline ()
  (interactive)
  (if mpasm-mode-electric-newline
      (newline-and-indent)))

(defun mpasm-setup-keymap ()
  (use-local-map mpasm-mode-map)
  (define-key mpasm-mode-map (kbd "RET") 'mpasm-newline))

(defun mpasm-setup-indent ()
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'mpasm-indent-function))

;; (defun mpasm-setup-align ()
;;   (make-local-variable align-rules-list)
;;   (setq align-rules-list (cons '(text-column-whitespace
;;                                  (regexp  . "\\(^\\|\\S-\\)\\([ \t]+\\)")
;;                                  (group   . 2)
;;                                  (repeat  . t))
;;                                align-rules-list)))
  
(defun mpasm-setup-align ()
  (make-local-variable 'align-rules-list)
  (setq align-rules-list (list '(text-column-whitespace
                                 (regexp  . "\\(^\\|\\S-\\)\\([ \t]+\\)")
                                 (group   . 2)
                                 (repeat  . t))
                               align-rules-list)))

(defun mpasm-setup-font-lock ()
  (setq font-lock-case-fold-search t))

(define-generic-mode mpasm-mode
  '(";")
  ()
  (mpasm-make-font-lock-regexes)
  ()
  '(mpasm-setup-indent 
    mpasm-setup-keymap
    mpasm-setup-font-lock
    mpasm-setup-align))
