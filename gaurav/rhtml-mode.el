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

(add-to-list 'load-path (concat user-dotfiles-dir "rhtml-mode"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))
