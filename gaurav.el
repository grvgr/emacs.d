;; Set user-dotfiles-dir
(setq user-dotfiles-dir (concat user-emacs-directory user-login-name "/"))

;; light table like theme
(add-to-list 'custom-theme-load-path (concat user-dotfiles-dir "emacs-themes"))
(load-theme 'bubbleberry 1)

;;; OSX native fullscreen
(global-set-key "\C-c\C-c\C-f" 'ns-toggle-fullscreen)
(add-hook 'window-setup-hook 'ns-toggle-fullscreen t)

;;; elpa packages
;;rinari
(setq rinari-tags-file-name "TAGS")
(setq rinari-major-modes
      (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
            'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))

;; coffee-mode
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;;; customizations
;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; effective emacs http://steve.yegge.googlepages.com/effective-emacs
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key [f5] 'call-last-kbd-macro)

;; ctags
(setq path-to-ctags "/opt/local/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s --exclude=assets --exclude=public -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name)))
  (shell-command "/usr/bin/terminal-notifier -message 'Tags updated.' -title 'Emacs'")
  (visit-tags-table dir-name nil)
  )

;; auto fill disable
(auto-fill-mode -1)
(set-default 'fill-column 200)

;; window movement
(global-set-key [S-left] 'windmove-left)
(global-set-key [S-right] 'windmove-right)
(global-set-key [S-up] 'windmove-up)
(global-set-key [S-down] 'windmove-down)

(if window-system
    (tool-bar-mode -1)
  (menu-bar-mode -1)
  )
(global-set-key "\C-c n" 'cleanup-buffer)

;; make deleted files go to the trash can
(setq delete-by-moving-to-trash t)

;; Local Variables:
;; no-byte-compile: t
;; coding: utf-8
;; End:
