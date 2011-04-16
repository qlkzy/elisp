(add-to-list 'Info-directory-list (concat invocation-directory "../info"))
(setq Info-additional-directory-list Info-directory-list)
(add-to-list 'Info-additional-directory-list (drm-custom-path "info/perl/"))
(add-to-list 'Info-additional-directory-list (drm-custom-path "info/bash/"))
(setq Info-directory-list (list (drm-custom-path "info/")))

