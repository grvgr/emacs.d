;; Set dotfiles-dir var
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Add Marmalade as package source
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("ELPA" . "http://tromey.com/elpa/"))
(package-initialize)
