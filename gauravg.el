;; whitespace
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(require 'whitespace)
(add-hook 'ruby-mode-hook 'whitespace-mode)


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
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)

;; Ack in Project
;; (require 'ack-emacs)
(defvar ack-command "ack-grep --nocolor --nogroup "
  "The command to be run by the ack function.")


(defun ack-in-project (pattern)
  "Run ack, with user-specified ARGS, and collect output in a buffer.
While ack runs asynchronously, you can use the \\[next-error] command to
find the text that ack hits refer to. The command actually run is
defined by the ack-command variable."
  (interactive (list (read-string "Ack for (in app root): " (thing-at-point 'symbol))))

  (let (compile-command
        (compilation-error-regexp-alist grep-regexp-alist)
        (compilation-directory default-directory)
        (ack-full-buffer-name (concat "*ack-" pattern "*"))
        (ack-use-search-in-buffer-name (concat "*ack-buff-" pattern "*")))

    ;; lambda defined here since compilation-start expects to call
    ;; a function to get the buffer name
    (compilation-start (concat ack-command " -i --noheading --nocolor " pattern " " (rinari-root)) 'ack-mode
                       (when ack-use-search-in-buffer-name
                         (function (lambda (ignore)
                                     ack-full-buffer-name)))
                       (regexp-quote pattern))))

(global-set-key "\C-cfa" 'ack-in-project)

;;tab completion
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding
point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))

(defun my-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))

(add-hook 'c-mode-hook          'my-tab-fix)
(add-hook 'sh-mode-hook         'my-tab-fix)
(add-hook 'emacs-lisp-mode-hook 'my-tab-fix)
(add-hook 'ruby-mode-hook       'my-tab-fix)


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
