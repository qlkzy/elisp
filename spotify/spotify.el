(defun spotify-player-send (string)
  (shell-command 
   (concat "dbus-send --print-reply"
           " "
           "--dest=org.mpris.MediaPlayer2.spotify"
           " "
           "/org/mpris/MediaPlayer2"
           " "
           "org.mpris.MediaPlayer2.Player."
           string)))

(defun spotify-playpause ()
  (interactive)
  (spotify-player-send "PlayPause"))

(defun spotify-prev ()
  (interactive)
  (spotify-player-send "Previous"))

(defun spotify-next ()
  (interactive)
  (spotify-player-send "Next"))

(define-prefix-command 'music-control)
(global-set-key (kbd "C-c m") 'music-control)
(global-set-key (kbd "C-c m SPC") 'spotify-playpause)
(global-set-key (kbd "C-c m <right>") 'spotify-next)
(global-set-key (kbd "C-c m <left>") 'spotify-prev)
