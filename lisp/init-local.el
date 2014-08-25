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
        (delete-region (region-beginning) (region-end) )
        )
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

;;; install google translate
(require-package 'google-translate)
(require 'google-translate-default-ui)
(require 'google-translate-smooth-ui)
(global-set-key "\C-ct" 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist '(("en" . "zh-CN")))

;;; remove makefile tab
(add-hook 'makefile-mode-hook
          (lambda ()
            (whitespace-cleanup-mode 0)
            (setq tab-width 8)))
(provide 'init-local)
