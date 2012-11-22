(drm-custom-load "spotify/spotify")

(define-prefix-command 'music-control)
(global-set-key (kbd "C-c m") 'music-control)
(global-set-key (kbd "C-c m SPC") 'spotify-playpause)
(global-set-key (kbd "C-c m <right>") 'spotify-next)
(global-set-key (kbd "C-c m <left>") 'spotify-prev)
