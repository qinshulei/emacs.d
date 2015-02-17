;; debug mode
;;(setq debug-on-error t)

;; install emmet
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
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

;;binder insert date to key c-x t
(global-set-key (kbd "C-x t") 'insert-date)

;; install flx-ido
(require-package 'flx-ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

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

;; install ag.el
;; require ag
(require-package 'ag)
(require 'ag)

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


;; install hightlight indentation
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#083743")
(set-face-background 'highlight-indentation-current-column-face "#093844")

(dolist (hook '(lisp-mode-hook
                emacs-lisp-mode-hook
                scheme-mode-hook
                clojure-mode-hook
                ruby-mode-hook
                yaml-mode
                python-mode-hook
                shell-mode-hook
                php-mode-hook
                css-mode-hook
                nxml-mode-hook
                perl-mode-hook
                javascript-mode-hook))
  (add-hook hook 'highlight-indentation-mode))

;; install devdocs-lookup
(require 'devdocs-lookup)
(setq devdocs-base-url "http://192.168.65.56:9292")
(setq devdocs-base-index-url "http://192.168.65.56:9292/docs")
;; (setq devdocs-base-url "http://devdocs.io")
;;(setq devdocs-base-index-url "http://docs.devdocs.io")
(setq devdocs-subjects
      '(("Angular.js" "angular")
        ("JavaScript" "javascript")
        ("CSS" "css")
        ("HTML" "html")
        ("DOM" "dom")
        ("Backbone.js" "backbone")
        ("Node.js" "node")
        ("Python" "python")
        ("Ruby" "ruby")
        ("rails" "rails")
        ("CoffeeScript" "coffeescript")
        ("C++" "cpp")
        ("C" "c")
        ("D3" "d3")
        ("Ember.jg" "ember")
        ("Git" "git")
        ("HTTP" "http")
        ("jQuery" "jquery")
        ("Knockout.js" "knockout")
        ("Less" "less")
        ("Lo-Dash" "lodash")
        ("Moment.js" "moment")
        ("PHP" "php")
        ("PostgreSQL" "postgresql")
        ("Redis" "redis")
        ("SASS" "sass")
        ("Underscore.js" "underscore")
        ("YII" "yii")))
(devdocs-setup)
(global-set-key (kbd "s-d j") #'devdocs-lookup-javascript)
(global-set-key (kbd "s-d q") #'devdocs-lookup-jquery)
(global-set-key (kbd "s-d a") #'devdocs-lookup-angular)
(global-set-key (kbd "s-d c") #'devdocs-lookup-css)
(global-set-key (kbd "s-d h") #'devdocs-lookup-html)
(global-set-key (kbd "s-d d") #'devdocs-lookup-dom)
(global-set-key (kbd "s-d n") #'devdocs-lookup-node)
(global-set-key (kbd "s-d r") #'devdocs-lookup-ruby)
(global-set-key (kbd "s-d R") #'devdocs-lookup-rails)
(global-set-key (kbd "s-d p") #'devdocs-lookup-python)
(global-set-key (kbd "s-d +") #'devdocs-lookup-cpp)


(require 'edit-server)
(edit-server-start)

(require-package 'groovy-mode)
(require 'groovy-mode)

;; Standard Jedi.el setting
(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; add m-up m-down for text move
(require-package 'move-text)
(require 'move-text)
(move-text-default-bindings)

;; add restfulclient.el
(require-package 'restclient)
(require 'restclient)

;; install ace-window
(require-package 'ace-window)
(require 'ace-window)

;; install hydra
(require-package 'hydra)
(require 'hydra)
(setq hydra-is-helpful t)

(global-set-key
 (kbd "s-i w")
 (defhydra hydra-window ()
   "window"
   ("h" windmove-left)
   ("j" windmove-down)
   ("k" windmove-up)
   ("l" windmove-right)
   ("a" (lambda ()
          (interactive)
          (ace-window 1)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)
          (throw 'hydra-disable t))
    "ace")
   ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right))
    "vert")
   ("x" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down))
    "horz")
   ("s" (lambda ()
          (interactive)
          (ace-window 4)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)
          (throw 'hydra-disable t))
    "swap")
   ("t" transpose-frame "'")
   ("d" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)
          (throw 'hydra-disable t))
    "del")
   ("o" delete-other-windows "one" :color blue)
   ("i" ace-maximize-window "ace-one" :color blue)
   ("q" nil "cancel")))


(defhydra hydra-zoom (global-map "s-i t")
  "text zoom"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out"))

(global-set-key
 (kbd "s-i v")
 (defhydra hydra-vi
     (:pre
      (set-cursor-color "#e52b50")
      :post
      (set-cursor-color "#ffffff")
      :color amaranth)
   "vi"
   ("l" forward-char)
   ("h" backward-char)
   ("j" next-line)
   ("k" previous-line)
   ("m" set-mark-command "mark")
   ("a" move-beginning-of-line "beg")
   ("e" move-end-of-line "end")
   ("d" delete-region "del" :color blue)
   ("y" kill-ring-save "yank" :color blue)
   ("q" nil "quit")))

;; install
(require-package 'rubocop)
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; install chines-py
;; https://github.com/tumashu/chinese-pyim
(require-package 'chinese-pyim)
(require 'chinese-pyim)
;; https://github.com/tumashu/chinese-pyim-bigdict/blob/master/pyim-bigdict.txt?raw=true
(setq pyim-dicts
      '((:name "dict1" :file "~/configs/chinese-py/pyim-bigdict.txt" :coding utf-8-unix)))
;;(pyim-restart-1 t)

;; disable lock file,
;; the lock file will change cause the directory timestamp to be modified, which causes our build system to rebuild an entire module instead of compiling and linking for one changed file.
;; http://stackoverflow.com/questions/5738170/why-does-emacs-create-temporary-symbolic-links-for-modified-files
(setq create-lockfiles nil)

;; install hackernews
(require-package 'hackernews)
(require 'hackernews)

;; install symon
(require-package 'symon)
(require 'symon)

;; install org-download
(require-package 'org-download)
(require 'org-download)

(provide 'init-local)
