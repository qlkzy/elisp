(add-to-list 'load-path (drm-custom-path "rails/rinari"))
(require 'rinari)

(define-skeleton rhtml-skeleton-div
  "" nil
  > "<div class=\""_"\">"\n
  > _ \n
  > -2 "</div>"\n)

(define-skeleton rhtml-skeleton-if
  "" nil
  > "<% if "_ " %>"\n
  > _ \n
  > -2 "<% else %>" \n
  > "" \n
  > -2 "<% end %>"\n)

(defun drm-rhtml-init ()
  (rinari-launch)
  (abbrev-def-list local-abbrev-table
    ("rbif" "" 'rhtml-skeleton-if)
    ("div" "" 'rhtml-skeleton-div)
    ("br" "<br/>" nil)
    ("hr" "<hr/>\n" nil)))

(add-to-list 'load-path (drm-custom-path "rails/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook 'drm-rhtml-init)


