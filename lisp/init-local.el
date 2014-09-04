;;; install emmet
(require-package 'emmet-mode)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)


;;; set theme
(dark)


;;;insert time function
(defun insert-date ()
  "Insert current date yyyy-mm-dd."
  (interactive)
  (when (region-active-p)
        (delete-region (region-beginning) (region-end) ))
  (insert (format-time-string "%Y-%m-%d %H:%M:%S"))
  )

;;binder insert date to key c-x t
(global-set-key (kbd "C-x t") 'insert-date)


;;;search key bing
(defun search-keybind (regexp &optional nlines)
  (interactive (occur-read-primary-args))
  (save-excursion
    (describe-bindings)
    (set-buffer "*Help*")
    (occur regexp nlines)
    (delete-windows-on "*Help*")))

;;;install yasnippt
(require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)

;;; install js2-refactor
(require-package 'js2-refactor)
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

;;; install neotree
(require-package 'neotree)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;; install projectile
(require-package 'projectile)
(projectile-global-mode)


;;; install js2-refactor
(require-package 'js2-refactor)
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

;;; install neotree
(require-package 'neotree)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;; install projectile
(require-package 'projectile)

;;; install google translate
(require-package 'google-translate)
(require 'google-translate-default-ui)
(require 'google-translate-smooth-ui)
(global-set-key "\C-ct" 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist '(("en" . "zh-CN")))

;;; install inf-mongodb
(require-package 'inf-mongo)
(require 'inf-mongo)


;;; private org mode setting
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(add-hook 'org-mode-hook '(lambda ()
                            ;; turn on flyspell-mode by default
                            (flyspell-mode 1)
                            ;; C-TAB for expanding
                            (local-set-key (kbd "C-<tab>")
                                           'yas/expand-from-trigger-key)
                            ;; keybinding for editing source code blocks
                            (local-set-key (kbd "C-c s e")
                                           'org-edit-src-code)
                            ;; keybinding for inserting code blocks
                            (local-set-key (kbd "C-c s i")
                                           'org-insert-src-block)
                            ))

(setq org-src-fontify-natively t)

(require-package 'ob-mongo)
(require 'ob-mongo)

;; install xcscope
(require-package 'xcscope)
(setq cscope-program "gtags-cscope")
(require 'xcscope)

;; install gist
(require-package 'gist)
(require 'gist)
(setq gist-view-gist t)


;;; remove makefile tab
(add-hook 'makefile-mode-hook
          (lambda ()
            (whitespace-cleanup-mode 0)
            (setq tab-width 8)))



;; install nyan-mode
(require-package 'nyan-mode)

;; install nyan-prompt
(require-package 'nyan-prompt)
(add-hook 'eshell-load-hook 'nyan-prompt-enable)
(require 'nyan-mode)

(provide 'init-local)
