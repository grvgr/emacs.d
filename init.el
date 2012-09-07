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

(setq essential-packages
      '(
        starter-kit
        starter-kit-bindings
        starter-kit-lisp
        starter-kit-js
        starter-kit-ruby
        ))

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (pkg essential-packages)
  (when (and (not (package-installed-p pkg))
             (assoc pkg package-archive-contents))
    (package-install pkg)))
