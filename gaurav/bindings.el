;;; Movement in iTerm2
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])

;;; window control
(global-set-key "\M-1" 'delete-other-windows)
(global-set-key "\M-2" 'split-window-below)
(global-set-key "\M-3" 'split-window-right)
(global-set-key "\M-0" 'delete-window)
