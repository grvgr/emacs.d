;;; elpa packages

;;rvm
(require 'rvm)
(rvm-use-default)

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

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat user-emacs-directory "elpa/auto-complete-1.4/dict"))
(ac-config-default)
(add-hook 'ruby-mode-hook 'auto-complete-mode)
(global-set-key "\C-c\C-a" 'auto-complete-mode)

;; auto-pair
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
