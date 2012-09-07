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
