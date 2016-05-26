;; Complete line with ivy-mode
;; http://blog.binchen.org/posts/complete-line-with-ivy-mode.html
(defun counsel-escape (keyword)
  (setq keyword (replace-regexp-in-string "\\$" "\\\\\$" keyword))
  (replace-regexp-in-string "\"" "\\\\\"" keyword))

(defun counsel-replace-current-line (leading-spaces content)
  (beginning-of-line)
  (kill-line)
  (insert (concat leading-spaces content))
  (end-of-line))

(defun counsel-git-grep-complete-line ()
  (interactive)
  (let* (cmd
         (cur-line (buffer-substring-no-properties (line-beginning-position)
                                                   (line-end-position)))
         (default-directory (locate-dominating-file
                             default-directory ".git"))
         keyword
         (leading-spaces "")
         collection)
    (setq keyword (counsel-escape (if (region-active-p)
                                      (buffer-substring-no-properties (region-beginning)
                                                                      (region-end))
                                    (replace-regexp-in-string "^[ \t]*" "" cur-line))))
    ;; grep lines without leading/trailing spaces
    (setq cmd (format "git --no-pager grep -I -h --no-color -i -e \"^[ \\t]*%s\" | sed s\"\/^[ \\t]*\/\/\" | sed s\"\/[ \\t]*$\/\/\" | sort | uniq" keyword))
    (when (setq collection (split-string (shell-command-to-string cmd) "\n" t))
      (if (string-match "^\\([ \t]*\\)" cur-line)
          (setq leading-spaces (match-string 1 cur-line)))
      (cond
       ((= 1 (length collection))
        (counsel-replace-current-line leading-spaces (car collection)))
       ((> (length collection) 1)
        (ivy-read "lines:"
                  collection
                  :action (lambda (l)
                            (counsel-replace-current-line leading-spaces l))))))
    ))

;; (global-set-key (kbd "C-x C-l") 'counsel-git-grep-complete-line)


(provide 'init-local-function)
