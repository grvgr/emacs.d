(add-to-list 'load-path (concat user-dotfiles-dir "shellfm-0.1"))
(require 'shellfm)

(defun shellfm-notification ()
  "Displays notification on status / track change"
  (shell-command (format "/usr/bin/terminal-notifier -message \"%s - %s [%s]\" -title 'Shell.FM'"
                          shellfm-current-artist
                          shellfm-current-title
                          shellfm-status))
  )

(add-hook 'shellfm-status-hook 'shellfm-notification)
(add-hook 'shellfm-track-hook  'shellfm-notification)

(global-set-key "\M-p" 'shellfm-pause)
(global-set-key "\M-n" 'shellfm-skip-track)
