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
(global-set-key [f5] 'bm-toggle)
(global-set-key [C-f5] 'bm-show-all)
(global-set-key [C-S-f5] 'bm-remove-all-current-buffer)
(global-set-key [f6] 'bm-next)
(global-set-key [C-f6] 'bm-previous)
(global-set-key [C-S-f6] 'bm-bookmark-annotate)
(setq bm-in-lifo-order t) ;;cycle bookmark in LIFO order
;;(setq bm-cycle-all-buffers t) ;;cycle through bookmarks in all open buffers

;; install golden-ratio
(require-package 'golden-ratio)
(require 'golden-ratio)
;;(golden-ratio-mode 1)

;; don't generate backup file
;;(setq make-backup-files nil)

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.saves"))))
(setq backup-by-copying t)

;; install e2wm e2wm
;;(require-package 'e2wm)
;;(require 'e2wm)
;;(global-set-key (kbd "M-+") 'e2wm:start-management)

;; install cheat.el
(require 'cheat)

;; install how-many-lines-in-project
(require-package 'how-many-lines-in-project)
(require 'how-many-lines-in-project)

;; install eim
(autoload 'eim-use-package "eim" "Another emacs input method")
;; Tooltip 暂时还不好用
 (setq eim-use-tooltip nil)

;; ;; 五笔
;; (register-input-method
;;  "eim-wb" "euc-cn" 'eim-use-package
;;   "五笔" "汉字五笔输入法" "wb.txt")
;;
;;   ;; 拼音
(register-input-method
  "eim-py" "euc-cn" 'eim-use-package
   "拼音" "汉字拼音输入法" "py.txt")
;;
;;     ;; 双拼
;;     (register-input-method
;;      "eim-dp" "euc-cn" 'eim-use-package
;;       "双拼" "汉字双拼输入法" "dp.txt")
;;
;; 用 ; 暂时输入英文
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)

(provide 'init-local)
