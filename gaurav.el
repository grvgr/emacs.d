;; Set user-dotfiles-dir
(setq user-dotfiles-dir (concat user-emacs-directory user-login-name "/"))

;; light table like theme
(add-to-list 'custom-theme-load-path (concat user-dotfiles-dir "emacs-themes"))
(if (window-system) (load-theme 'bubbleberry 1))

;;; OSX native fullscreen
(global-set-key "\C-c\C-c\C-f" 'ns-toggle-fullscreen)
(add-hook 'window-setup-hook 'ns-toggle-fullscreen t)

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

;; key bindings
(global-set-key "\C-c n" 'cleanup-buffer)
(global-set-key "\C-x g" 'magit-status)

;; make deleted files go to the trash can
(setq delete-by-moving-to-trash t)

;;; recent file
(require 'recentf)
(recentf-mode 1)
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let* ((file-assoc-list
          (mapcar (lambda (x) (cons (file-name-nondirectory x) x)) recentf-list))
         (filename-list
          (remove-duplicates (mapcar #'car file-assoc-list)
                             :test #'string=))
         (filename (ido-completing-read "Choose recent file: "
                                        filename-list
                                        nil
                                        t)))
    (when filename
      (find-file (cdr (assoc filename file-assoc-list))))))

(global-set-key "\C-xf" 'recentf-ido-find-file)

;; show line numbers
(if (window-system) (global-linum-mode 1))

;; fringe-mode
(if (window-system) (set-fringe-mode '(1 . 1)))

;; shell-fm
;; (shellfm 1)

;; Local Variables:
;; no-byte-compile: t
;; coding: utf-8
;; End:
