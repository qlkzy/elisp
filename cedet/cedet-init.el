;; (require 'cedet)
;; (require 'ede)
;; (require 'ede-cpp-root)
;; ;; See cedet/common/cedet.info for configuration details.
;; (setq semantic-load-turn-useful-things-on t)
;; (load-file "~/elisp/cedet/common/cedet.el")



(setq-default semantic-default-submodes
              '(global-semanticdb-minor-mode
                global-semantic-idle-scheduler-mode
                global-semantic-idle-scheduler-mode
                global-semantic-highlight-func-mode
                global-semantic-stickyfunc-mode))



(global-ede-mode 1)
(require 'semantic/sb)
(semantic-mode 1)

(semantic-add-system-include "C:/Qt/2010.04/mingw/include" 'c-mode)
(semantic-add-system-include "C:/Qt/2010.04/mingw/include" 'c++-mode)
(semantic-add-system-include "C:/Qt/2010.04/qt/include/QtCore" 'c++-mode)
(semantic-add-system-include "C:/Qt/2010.04/qt/include/QtNetwork" 'c++-mode)
(semantic-add-system-include "C:/Qt/2010.04/qt/include/QtGui" 'c++-mode)
(semantic-add-system-include "C:/Qt/2010.04/qt/include/QtTest" 'c++-mode)
                       
                       
                       
(global-set-key (kbd "<C-tab>") 'semantic-complete-analyze-inline)

(setq semantic-complete-inline-analyzer-idle-displayor-class
      'semantic-displayor-ghost)

(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)


(global-set-key '[(S-mouse-3)] 'semantic-ia-fast-mouse-jump)

(defun drm-semantic-symref-no-prompt ()
  (interactive)
  (semantic-fetch-tags)
  (when (semantic-current-tag)
    (let ((ct (semantic-tag-name (semantic-current-tag))))
    (semantic-symref-produce-list-on-results
     (semantic-symref-find-references-by-name ct)
     ct))))

(global-set-key (kbd "C-c , G") 'drm-semantic-symref-no-prompt)

(defun drm-semantic-symref-get-list ()
  (interactive)
  (semantic-fetch-tags)
  (when (semantic-current-tag)
    (setq drm-tmp
          (semantic-symref-find-references-by-name
           (semantic-tag-name (semantic-current-tag))))))
