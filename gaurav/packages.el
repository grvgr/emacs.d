(setq grv-packages
      '(
        haml-mode
        ruby-mode
        ruby-electric
        rvm
        sass-mode
        flymake
        flymake-ruby
        flymake-coffee
        flymake-css
        flymake-csslint
        flymake-haml
        flymake-sass
        highline
        yaml-mode
        wtf
        yasnippet
        yasnippet-bundle
        auto-complete
        autopair
        coffee-mode
        rinari
        feature-mode
        rainbow-mode
        browse-kill-ring
        color-theme
        ctags
        ctags-update
        ))

;; (when (not package-archive-contents)
;;   (package-refresh-contents))

(dolist (pkg grv-packages)
  (when (and (not (package-installed-p pkg))
             (assoc pkg package-archive-contents))
    (package-install pkg)))

(defun package-list-unaccounted-packages ()
  "Like `package-list-packages', but shows only the packages that
  are installed and are not in `grv-packages'.  Useful for
  cleaning out unwanted packages."
  (interactive)
  (package-show-package-list
   (remove-if-not (lambda (x) (and (not (memq x grv-packages))
                              (not (package-built-in-p x))
                              (package-installed-p x)))
                  (mapcar 'car package-archive-contents))))
