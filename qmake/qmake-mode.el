;; Major mode for editing QMake Files


(defconst qmake-variable-list 
'("BLD_INF_RULES" "CONFIG" "DEFINES" "DEF_FILE" "DEPENDPATH"
  "DEPLOYMENT" "DEPLOYMENT_PLUGIN" "DESTDIR" "DESTDIR_TARGET"
  "DLLDESTDIR" "DISTFILES" "DSP_TEMPLATE" "FORMS" "FORMS3" "GUID"
  "HEADERS" "ICON" "INCLUDEPATH" "INSTALLS" "LEXIMPLS" "LEXOBJECTS"
  "LEXSOURCES" "LIBS" "LITERAL_HASH" "MAKEFILE" "MAKEFILE_GENERATOR"
  "MMP_RULES" "MOC_DIR" "OBJECTS" "OBJECTS_DIR" "OBJMOC"
  "POST_TARGETDEPS" "PRE_TARGETDEPS" "PRECOMPILED_HEADER" "PWD"
  "OUT_PWD" "QMAKE" "QMAKESPEC" "QMAKE_APP_FLAG" "QMAKE_APP_OR_DLL"
  "QMAKE_AR_CMD" "QMAKE_BUNDLE_DATA" "QMAKE_BUNDLE_EXTENSION"
  "QMAKE_CC" "QMAKE_CFLAGS_DEBUG" "QMAKE_CFLAGS_MT"
  "QMAKE_CFLAGS_MT_DBG" "QMAKE_CFLAGS_MT_DLL" "QMAKE_CFLAGS_MT_DLLDBG"
  "QMAKE_CFLAGS_RELEASE" "QMAKE_CFLAGS_SHLIB" "QMAKE_CFLAGS_THREAD"
  "QMAKE_CFLAGS_WARN_OFF" "QMAKE_CFLAGS_WARN_ON" "QMAKE_CLEAN"
  "QMAKE_CXX" "QMAKE_CXXFLAGS" "QMAKE_CXXFLAGS_DEBUG"
  "QMAKE_CXXFLAGS_MT" "QMAKE_CXXFLAGS_MT_DBG" "QMAKE_CXXFLAGS_MT_DLL"
  "QMAKE_CXXFLAGS_MT_DLLDBG" "QMAKE_CXXFLAGS_RELEASE"
  "QMAKE_CXXFLAGS_SHLIB" "QMAKE_CXXFLAGS_THREAD"
  "QMAKE_CXXFLAGS_WARN_OFF" "QMAKE_CXXFLAGS_WARN_ON" "QMAKE_DISTCLEAN"
  "QMAKE_EXTENSION_SHLIB" "QMAKE_EXT_MOC" "QMAKE_EXT_UI"
  "QMAKE_EXT_PRL" "QMAKE_EXT_LEX" "QMAKE_EXT_YACC" "QMAKE_EXT_OBJ"
  "QMAKE_EXT_CPP" "QMAKE_EXT_H" "QMAKE_EXTRA_COMPILERS"
  "QMAKE_EXTRA_TARGETS" "QMAKE_FAILED_REQUIREMENTS" "QMAKE_FILETAGS"
  "QMAKE_FRAMEWORK_BUNDLE_NAME" "QMAKE_FRAMEWORK_VERSION"
  "QMAKE_INCDIR" "QMAKE_INCDIR_EGL" "QMAKE_INCDIR_OPENGL"
  "QMAKE_INCDIR_OPENGL_ES1, QMAKE_INCDIR_OPENGL_ES1CL,
  QMAKE_INCDIR_OPENGL_ES2" "QMAKE_INCDIR_OPENVG" "QMAKE_INCDIR_QT"
  "QMAKE_INCDIR_THREAD" "QMAKE_INCDIR_X11" "QMAKE_INFO_PLIST"
  "QMAKE_LFLAGS" "QMAKE_LFLAGS_CONSOLE" "QMAKE_LFLAGS_CONSOLE_DLL"
  "QMAKE_LFLAGS_DEBUG" "QMAKE_LFLAGS_PLUGIN" "QMAKE_LFLAGS_RPATH"
  "QMAKE_LFLAGS_QT_DLL" "QMAKE_LFLAGS_RELEASE" "QMAKE_LFLAGS_SHAPP"
  "QMAKE_LFLAGS_SHLIB" "QMAKE_LFLAGS_SONAME" "QMAKE_LFLAGS_THREAD"
  "QMAKE_LFLAGS_WINDOWS" "QMAKE_LFLAGS_WINDOWS_DLL" "QMAKE_LIBDIR"
  "QMAKE_LIBDIR_FLAGS" "QMAKE_LIBDIR_EGL" "QMAKE_LIBDIR_OPENGL"
  "QMAKE_LIBDIR_OPENVG" "QMAKE_LIBDIR_QT" "QMAKE_LIBDIR_X11"
  "QMAKE_LIBS" "QMAKE_LIBS_CONSOLE" "QMAKE_LIBS_EGL"
  "QMAKE_LIBS_OPENGL" "QMAKE_LIBS_OPENGL_QT" "QMAKE_LIBS_OPENGL_ES1"
  "QMAKE_LIBS_OPENGL_ES1CL" "QMAKE_LIBS_OPENGL_ES2" "QMAKE_LIBS_OPENVG"
  "QMAKE_LIBS_QT" "QMAKE_LIBS_QT_DLL" "QMAKE_LIBS_QT_OPENGL"
  "QMAKE_LIBS_QT_THREAD" "QMAKE_LIBS_RT" "QMAKE_LIBS_RTMT"
  "QMAKE_LIBS_THREAD" "QMAKE_LIBS_WINDOWS" "QMAKE_LIBS_X11"
  "QMAKE_LIBS_X11SM" "QMAKE_LIB_FLAG" "QMAKE_LINK_SHLIB_CMD"
  "QMAKE_POST_LINK" "QMAKE_PRE_LINK" "QMAKE_LN_SHLIB" "QMAKE_MAC_SDK"
  "QMAKE_MACOSX_DEPLOYMENT_TARGET" "QMAKE_MAKEFILE" "QMAKE_MOC_SRC"
  "QMAKE_QMAKE" "QMAKE_QT_DLL" "QMAKE_RESOURCE_FLAGS" "QMAKE_RPATH"
  "QMAKE_RPATHDIR" "QMAKE_RUN_CC" "QMAKE_RUN_CC_IMP" "QMAKE_RUN_CXX"
  "QMAKE_RUN_CXX_IMP" "QMAKE_TARGET" "QMAKE_UIC" "QT" "QTPLUGIN"
  "QT_VERSION" "QT_MAJOR_VERSION" "QT_MINOR_VERSION"
  "QT_PATCH_VERSION" "RC_FILE" "RCC_DIR" "REQUIRES" "RESOURCES"
  "RES_FILE" "RSS_RULES" "S60_VERSION" "SIGNATURE_FILE" "SOURCES"
  "SRCMOC" "SUBDIRS" "TARGET" "TARGET.CAPABILITY"
  "TARGET.EPOCALLOWDLLDATA" "TARGET.EPOCHEAPSIZE"
  "TARGET.EPOCSTACKSIZE" "TARGET.SID" "TARGET.UID2" "TARGET.UID3"
  "TARGET.VID" "TARGET_EXT" "TARGET_x" "TARGET_x.y.z" "TEMPLATE"
  "TRANSLATIONS" "UICIMPLS" "UICOBJECTS" "UI_DIR" "UI_HEADERS_DIR"
  "UI_SOURCES_DIR" "VERSION" "VER_MAJ" "VER_MIN" "VER_PAT" "VPATH"
  "YACCIMPLS" "YACCOBJECTS" "YACCSOURCES" "_PRO_FILE_"
  "_PRO_FILE_PWD_"))


(defconst qmake-function-list
  '("basename" "contains" "count" "dirname" "error" "eval" "exists"
    "find" "for" "include" "infile" "isEmpty" "join" "member" "message"
    "prompt" "quote" "replace" "sprintf" "system" "unique" "warning"))
;; "CONFIG"


(defconst qmake-keyword-list
  '("release" "debug" "debug_and_release" "build_all" "ordered"
    "precompile_header" "warn_on" "warn_off" "create_prl" "link_prl"
    "qt" "thread" "x11" "windows" "console" "shared" "dlldylib "
    "static" "staticlibplugin" "designer" "uic3" "no_lflags_merge"
    "resources" "3dnow" "exceptions" "mmx" "rtti" "stl" "sse" "sse2"
    "flat" "embed_manifest_dll" "embed_manifest_exe" "incremental"
    "ppc" "x86" "app_bundle" "lib_bundle" "stdbinary" "no_icon"
    "symbian_test" "separate_debug_info" "core" "gui" "network"
    "opengl" "phonon" "sql" "svg" "xml" "webkit" "qt3support" "testlib"))

(defconst qmake-mode-map
  (make-sparse-keymap))
(defvar qmake-mode-abbrev-table
  (make-abbrev-table))

(defconst qmake-mode-electric-newline t)

(defconst qmake-indent-offset 4)

(define-skeleton qmake-big-comment-header
  "Insert a large comment header into a a QMake file" nil
   "#-------------------------------------------------" \n
   "# " _ \n
   "#-------------------------------------------------" \n)

(define-skeleton qmake-small-comment-header
  "Insert a small comment header into a QMake file" nil
   "# --- " _ " ---" \n)

(defun qmake-make-regex (strings)
  (let (result)
    (dolist (elt strings result)
      (setq result 
            (cons elt result)))
    (concat "\\_<" (regexp-opt strings t) "\\_>")))

(defun qmake-make-font-lock-regexes ()
  (list (cons (qmake-make-regex qmake-function-list) 
              font-lock-function-name-face)
        (cons (qmake-make-regex qmake-keyword-list) 
              font-lock-keyword-face)
        (cons (qmake-make-regex qmake-variable-list)
              font-lock-variable-name-face)))

(defun qmake-line-escaped-p ()
  (string= (string (char-before (line-end-position)))
           "\\"))

(defun qmake-continued-line-p ()
  (save-excursion
    (if (= (forward-line -1) 0)
        (qmake-line-escaped-p)
      nil)))

(defun qmake-list-begin ()
  (string-match "\\+*=[[:space:]]*\\([^[:space:]]\\)" 
                (buffer-substring
                 (line-beginning-position)
                 (line-end-position))))

(defun qmake-list-start ()
  (save-excursion
    (if (or (qmake-list-begin)
            (qmake-continued-line-p))
       (progn 
         (while (qmake-continued-line-p)
           (forward-line -1))
         (qmake-list-begin)
         (match-beginning 1))
      nil)))

(defun qmake-prettify-list ()
  (drm-align-paragraph (list '(qmake-continue-line
                               (regexp . "\\(\\s-*\\)\\\\$")
                               (group  . 1)))))


(defun qmake-indent-function ()
  (interactive)
  (when (qmake-continued-line-p)
    (indent-line-to (qmake-list-start))
    (qmake-prettify-list))
  (let ((parent (save-excursion
                  (nth 1 (syntax-ppss 
                          (+ (line-beginning-position)
                             1))))))
    (when parent
      (indent-line-to 
       (+ (save-excursion
            (goto-char parent)
            (back-to-indentation)
            (- (point) (line-beginning-position)))
          qmake-indent-offset)))))

(defun qmake-ensure-escape ()
  (unless (qmake-line-escaped-p)
    (save-excursion
      (goto-char (line-end-position))
                 (insert "\\"))))

(defun qmake-newline ()
  (interactive)
  (if qmake-mode-electric-newline
      (newline-and-indent))
  (save-excursion
    (when (forward-line -1)
      (when (qmake-list-start)
        (qmake-ensure-escape)
        (qmake-prettify-list)))))

(defun qmake-setup-keymap ()
  (use-local-map qmake-mode-map)
  (define-key qmake-mode-map (kbd "RET") 'qmake-newline))

(defun qmake-setup-indent ()
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'qmake-indent-function))

(defun qmake-setup-align ()
  (make-local-variable 'align-rules-list)
  (setq align-rules-list (list '(qmake-add-to-list
                                 (regexp  . "\\(\\s-*\\)\\+=")
                                 (group   . 1))
                               '(qmake-continue-line
                                 (regexp . "\\(\\s-*\\)\\\\$")
                                 (group  . 1))
                               align-rules-list)))

(defun qmake-setup-font-lock ()
  (setq font-lock-case-fold-search t))

(define-generic-mode qmake-mode
  '("#")
  ()
  (qmake-make-font-lock-regexes)
  ()
  '(qmake-setup-indent 
    qmake-setup-keymap
    qmake-setup-font-lock
    qmake-setup-align)) 
