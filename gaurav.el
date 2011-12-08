(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

;; whitespace
;; (require 'whitespace)

;; browse kill ring
(require 'browse-kill-ring)

;; features
(add-to-list 'load-path (concat dotfiles-dir "/vendor/feature-mode"))
;; optional configurations
;; default language if .feature doesn't have "# language: fi"
(setq feature-default-language "fi")
;; point to cucumber languages.yml or gherkin i18n.yml to use
;; exactly the same localization your cucumber uses
(setq feature-default-i18n-file "~/.emacs.d/vendor/feature-mode/i18n.yml")
;; and load feature-mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))


;; set theme
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)


;; auto complete
(add-to-list 'load-path (concat dotfiles-dir "/vendor/auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "/vendor/auto-complete/ac-dict"))
(ac-config-default)
(add-hook 'ruby-mode-hook 'auto-complete-mode)
(global-set-key "\C-c\C-a" 'auto-complete-mode)

;; rails mode
(require 'snippet)

(require 'find-recursive)
(add-to-list 'load-path (concat dotfiles-dir "/vendor/emacs-rails"))
(require 'rails)


;; effective emacs http://steve.yegge.googlepages.com/effective-emacs
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key [f5] 'call-last-kbd-macro)

;; maxframe
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; smooth scrolling
(require 'smooth-scrolling)

;; auto fill disable
(auto-fill-mode -1)
(set-default 'fill-column 200)

;; fullscreen
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(global-set-key [f11] 'toggle-fullscreen)
;; Make new frames fullscreen by default. Note: this hook doesn't do
;; anything to the initial frame if it's in your .emacs, since that file is
;; read _after_ the initial frame is created.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)
(global-set-key [f11] 'toggle-fullscreen)

;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; window movement
(global-set-key [S-left] 'windmove-left)
(global-set-key [S-right] 'windmove-right)
(global-set-key [S-up] 'windmove-up)
(global-set-key [S-down] 'windmove-down)
