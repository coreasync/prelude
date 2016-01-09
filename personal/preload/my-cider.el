
;;Clojure
(defun cider-eval-expression-at-point-in-repl ()
  (interactive)
  (let ((cb (current-buffer))(form (cider-sexp-at-point)))
    ;; Strip excess whitespace
    (while (string-match "\\`\s+\\|\n+\\'" form)
      (setq form (replace-match "" t t form)))
    ;;(set-buffer (cider-find-or-create-repl-buffer())
    (cider-switch-to-repl-buffer)
    (goto-char (point-max))
    (insert form)
    (cider-repl-return)
    (switch-to-buffer cb)
    ))

(global-set-key [(control \`)] 'cider-eval-expression-at-point-in-repl)
(show-paren-mode 1)
