(add-to-list 'load-path (concat user-dotfiles-dir "shellfm-0.1"))
(require 'shellfm)

(defun shellfm-notification ()
  "Displays notification on status / track change."
  (shell-command (format "/usr/bin/terminal-notifier -message \"%s - %s [%s]\" -title 'Shell.FM'"
                         shellfm-current-artist
                         shellfm-current-title
                         shellfm-status))
  )

(add-hook 'shellfm-status-hook 'shellfm-notification)
(add-hook 'shellfm-track-hook  'shellfm-notification)

(defun shellfm-start-or-toggle ()
  "Starts shellfm if not running, otherwise toggles play / pause."
  (interactive)
  (if (equal shellfm-status 'dead) (shellfm 1) (shellfm-pause)))

(global-set-key "\M-p" 'shellfm-start-or-toggle)
(global-set-key "\M-n" 'shellfm-skip-track)
