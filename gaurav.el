(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/gaurav/emacs-themes"))

;; light table like theme
(load-theme 'bubbleberry 1)

;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; OSX native fullscreen
(global-set-key "\C-c\C-c\C-f" 'ns-toggle-fullscreen)
(add-hook 'window-setup-hook 'ns-toggle-fullscreen t)
