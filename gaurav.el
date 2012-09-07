(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/vendor/emacs-theme"))

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
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/tomorrow-theme"))
;; (require 'color-theme)
;; (color-theme-initialize)
;; (require 'color-theme-tomorrow)
;;(color-theme-tomorrow-night)

;; light table like theme
(load-theme 'bubbleberry 1)

;; auto complete
(add-to-list 'load-path (concat dotfiles-dir "/vendor/auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "/vendor/auto-complete/ac-dict"))
(ac-config-default)
(add-hook 'ruby-mode-hook 'auto-complete-mode)
(global-set-key "\C-c\C-a" 'auto-complete-mode)

;; pareedit mode for ruby
;; (add-hook 'ruby-mode-hook 'paredit-mode)

;; rails mode
;;(require 'snippet)

(require 'find-recursive)
(add-to-list 'load-path (concat dotfiles-dir "/vendor/emacs-rails"))
(require 'rails)

;; rvm
;; use rvm's default ruby for the current Emacs session
(require 'rvm)
(rvm-use-default)


;;; override font styles
(defface erb-face
  `((t (:background "black")))
  "Default inherited face for ERB tag body"
  :group 'rhtml-faces)

(defface erb-delim-face
  `((t (:background "black")))
  "Default inherited face for ERB tag delimeters"
  :group 'rhtml-faces)

(defface erb-exec-face
  `((t (:background "black")))
  "Default inherited face for ERB tag body"
  :group 'rhtml-faces)

(defface erb-exec-delim-face
  `((t (:background "black")))
  "Default inherited face for ERB tag delimeters"
  :group 'rhtml-faces)

(defface erb-out-face
  `((t (:background "black")))
  "Default inherited face for ERB tag body"
  :group 'rhtml-faces)

(defface erb-out-delim-face
  `((t (:background "black")))
  "Default inherited face for ERB tag delimeters"
  :group 'rhtml-faces)

(defface yas/field-highlight-face
  `((t (:background "black")))
  "Default inherited face for ERB tag delimeters"
  :group 'yasnippet)

;;; rinari
(add-to-list 'load-path (concat dotfiles-dir "/vendor/rinari"))
(require 'rinari)
(setq rinari-tags-file-name "TAGS")
(setq rinari-major-modes
      (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
            'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))

;;; rhtml-mode
(add-to-list 'load-path (concat dotfiles-dir "/vendor/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

;;; yasnippets
(setq yas/root-directory (concat dotfiles-dir "/vendor/snippets"))
(yas/load-directory yas/root-directory)


;;; ctags
(setq path-to-ctags "/opt/local/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s --exclude=assets --exclude=public -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name)))
  (shell-command "/usr/bin/terminal-notifier -message 'Tags updated.' -title 'Emacs'")
  (visit-tags-table dir-name nil)
  )

;; effective emacs http://steve.yegge.googlepages.com/effective-emacs
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key [f5] 'call-last-kbd-macro)

;; maxframe
;; (require 'maxframe)
;; (add-hook 'window-setup-hook 'maximize-frame t)
;; (global-set-key "\C-c\C-f" 'maximize-frame)

;; fullscreen
;; (defun toggle-fullscreen (&optional f)
;;   (interactive)
;;   (let ((current-value (frame-parameter nil 'fullscreen)))
;;     (set-frame-parameter nil 'fullscreen
;;                          (if (equal 'fullboth current-value)
;;                              (if (boundp 'old-fullscreen) old-fullscreen nil)
;;                            (progn (setq old-fullscreen current-value)
;;                                   'fullboth)))))

;; (global-set-key [f11] 'toggle-fullscreen)
;; Make new frames fullscreen by default. Note: this hook doesn't do
;; anything to the initial frame if it's in your .emacs, since that file is
;; read _after_ the initial frame is created.
;; (add-hook 'after-make-frame-functions 'toggle-fullscreen)
;; (global-set-key [f11] 'toggle-fullscreen)

;;; OSX native fullscreen
(global-set-key "\C-c\C-c\C-f" 'ns-toggle-fullscreen)
(add-hook 'window-setup-hook 'ns-toggle-fullscreen t)

;; smooth scrolling
(require 'smooth-scrolling)

;; auto fill disable
(auto-fill-mode -1)
(set-default 'fill-column 200)


;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; window movement
(global-set-key [S-left] 'windmove-left)
(global-set-key [S-right] 'windmove-right)
(global-set-key [S-up] 'windmove-up)
(global-set-key [S-down] 'windmove-down)

(tool-bar-mode -1)
(menu-bar-mode -1)

(global-set-key "\C-c n" 'cleanup-buffer)

;; make deleted files go to the trash can
(setq delete-by-moving-to-trash t)


;; coffee-mode
(add-to-list 'load-path (concat dotfiles-dir "/vendor/coffee-mode"))
(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;;; rainbow mode
(require 'rainbow-mode)

(display-battery-mode)

;;; powerline
;; (require 'powerline)
;; ;; colors...
;; (setq powerline-color1 "#123550")      ;; dark grey;
;; (setq powerline-color2 "#112230")      ;; slightly lighter grey
;; ;; shape...
;; (setq powerline-arrow-shape 'arrow14) ;; mirrored arrows,

;;; autopair
(add-to-list 'load-path (concat dotfiles-dir "/vendor/autopair"))
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

(defun js-json-reformat (beg end)
  (interactive "r")
  (shell-command-on-region beg end "python -m json.tool" nil t))

;;(define-key js-mode-map (kbd "C-c j") 'js-json-reformat)
;;(define-key js2-mode-map (kbd "C-c j") 'js-json-reformat)
(global-set-key "\C-c j" 'js-json-reformat)


(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end))
      (message "Ah, much better!"))

;; Local Variables:
;; no-byte-compile: t
;; coding: utf-8
;; End:
