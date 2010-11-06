;;; Skeleton Definitons for CPerl


(define-skeleton perl-header-1
  "Inserts a BIG heading" nil
  > "######################################################################"\n
  > "######################################################################"\n
  > "####    "_"" \n
  > "######################################################################"\n
  > "######################################################################"\n)

(define-skeleton perl-header-2
  "Inserts a Medium heading" nil
  > "########################################"\n
  > "###   "_"" \n
  > "########################################"\n)

(define-skeleton perl-header-3
  "Inserts a small heading" nil
  > "#########################" \n
  > "##  "_"" \n
  > "#########################" \n)


(defun drm-cperl-mode-skeletons ()
  (define-abbrev cperl-mode-abbrev-table
    "bigcommhead" "" 'perl-header-1)
  (define-abbrev cperl-mode-abbrev-table
    "medcommhead" "" 'perl-header-2)
  (define-abbrev cperl-mode-abbrev-table
    "mincommhead" "" 'perl-header-3))
