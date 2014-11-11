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
(setq projectile-indexing-method 'alien)

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

;;; install inf-mongodb
(require-package 'inf-mongo)
(require 'inf-mongo)

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

;; install ack-and-a-half
(require-package 'ack-and-a-half)
(require 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; install angular snipptes
(require-package 'angular-snippets)
(require 'angular-snippets)
(eval-after-load "sgml-mode"
  '(define-key html-mode-map (kbd "C-c C-d") 'ng-snip-show-docs-at-point))

;; install bm.el
(require-package 'bm)
(require 'bm)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;; install golden-ratio
(require-package 'golden-ratio)
(require 'golden-ratio)
;;(golden-ratio-mode 1)

;; don't generate backup file
;;(setq make-backup-files nil)

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.saves"))))
(setq backup-by-copying t)

(provide 'init-local)
