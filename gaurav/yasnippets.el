(defface yas/field-highlight-face
  `((t (:background "black")))
  "Default inherited face for ERB tag delimeters"
  :group 'yasnippet)

(setq yas/root-directory (concat user-dotfiles-dir "snippets"))
(yas/load-directory yas/root-directory)
