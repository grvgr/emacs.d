(defvar *emacs-load-start* (current-time))

(setq esk-system-config (concat user-emacs-directory system-name ".el")
      esk-user-config (concat user-emacs-directory user-login-name ".el")
      esk-user-dir (concat user-emacs-directory user-login-name)
      esk-custom-config (concat user-emacs-directory "custom.el"))

(setq custom-file esk-custom-config)

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

(load custom-file 'noerror)

;; moving starter kit autoload here
(add-to-list 'load-path esk-user-dir)
(when (file-exists-p esk-system-config) (load esk-system-config))
(when (file-exists-p esk-user-config) (load esk-user-config))
(when (file-exists-p esk-user-dir) (mapc 'load (directory-files esk-user-dir nil "^[^#].*el$")))


(message "Emacs load took %ds" (destructuring-bind (hi lo ms) (current-time)
                                 (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
;; Local Variables:
;; no-byte-compile: t
;; coding: utf-8
;; End:
