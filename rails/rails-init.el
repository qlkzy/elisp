
(define-skeleton html-skeleton-div
  "" nil
  > "<div class=\""_"\">"\n
  > _ \n
  > -2 "</div>"\n)

(define-skeleton html-skeleton-span
  "" nil
  > "<span class=\""_"\">"_"</span>"\n)

(define-skeleton html-skeleton-ul
  "" nil
  > "<ul>" \n
  > "<li>"_"</li>" \n
  > -2 "</ul>" \n)

(define-skeleton rhtml-skeleton-if
  "" nil
  > "<% if "_ " %>"\n
  > _ \n
  > -2 "<% else %>" \n
  > "" \n
  > -2 "<% end %>"\n)

(defun html-paragraphify ()
  (let ((p (point)))
    (save-excursion
      (insert "<p>")
      (forward-paragraph)
      (insert "</p>")
      (setq p (point)))
    (indent-region (point) p))
  (indent-line))

(defun drm-rhtml-init ()
  (rinari-launch)
  (abbrev-def-list local-abbrev-table
    ("rbif" "" 'rhtml-skeleton-if)
    ("div" "" 'html-skeleton-div)
    ("span" "" 'html-skeleton-span)
    ("br" "<br/>" nil)
    ("hr" "<hr/>\n" nil)
    ("ul" "" 'html-skeleton-ul)
    ("pp" "" 'html-paragraphify)))

(add-to-list 'auto-mode-alist
             '("Gemfile\\'" . ruby-mode))

(add-to-list 'load-path (drm-custom-path "rails/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook 'drm-rhtml-init)


