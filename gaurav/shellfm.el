(add-to-list 'load-path (concat user-dotfiles-dir "shellfm-0.1"))
(require 'shellfm)

(defun shellfm-notification ()
  "Displays notification on status change"
  (shell-command (format "/usr/bin/terminal-notifier -message '%s by %s' -title 'Shell.FM'" shellfm-current-title shellfm-current-artist))
  )

(add-hook 'shellfm-status-hook 'shellfm-notification)
(add-hook 'shellfm-track-hook 'shellfm-notification)
