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
