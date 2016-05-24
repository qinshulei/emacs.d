;; debug mode
;;(setq debug-on-error t)

(require-package 'gotham-theme)
(require 'gotham-theme)
;;(load-theme 'gotham t)

;; set theme
(dark)

;; install emmet
(require-package 'emmet-mode)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)


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
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        "~/.emacs.d/elpa/yasnippet-20160504.935/snippets"
        ))
(yas-global-mode 1)


;;; install js2-refactor
(require-package 'js2-refactor)
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

;;; install projectile
(require-package 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'alien)

;;; install js2-refactor
(require-package 'js2-refactor)
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; install ag.el
;; require ag
(require-package 'ag)
(require 'ag)

;;; install projectile
(require-package 'projectile)

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

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.saves"))))
(setq backup-by-copying t)
(setq create-lockfiles nil)

;; install cheat.el
(require 'cheat)

;; install how-many-lines-in-project
(require-package 'how-many-lines-in-project)
(require 'how-many-lines-in-project)

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

(require 'edit-server)
(edit-server-start)

(require-package 'groovy-mode)
(require 'groovy-mode)
(add-hook 'groovy-mode-hook
          (lambda ()
            (c-set-style "java")))
(add-hook 'java-mode-hook
          (lambda ()
            (c-set-style "java")))


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

;; install youdao-dictionary
(require-package 'youdao-dictionary)
(require 'youdao-dictionary)
;; Enable Cache
(setq url-automatic-caching t)
;; Example Key binding
(global-set-key (kbd "C-c t") 'youdao-dictionary-search-at-point)
;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")

;; install helm
(require-package 'helm)
(require 'helm)
(require 'helm-config)
(require-package 'helm-ag)
(require 'helm-ag)
(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))
(require-package 'helm-swoop)
(require 'helm-swoop)
;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; install helm-projectile
(require-package 'helm-projectile)
(require 'helm-projectile)

;; install helm-github-stars
(require-package 'helm-github-stars)
(require 'helm-github-stars)
(setq helm-github-stars-username "qinshulei")

;; helm-dash
(require-package 'helm-dash)
(require 'helm-dash)
(setq helm-dash-browser-func 'eww)
(setq helm-dash-min-length 3)

;; helm-dash bind
(defun bash-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Bash")))
(defun java-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Java")))
(defun python-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Python 2")))
(defun groovy-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Groovy")))
(defun css-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("CSS")))
(defun javascript-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript")))
(defun grails-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Grails")))
(defun html-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("HTML")))

(add-hook 'shell-script-mode-hook 'bash-doc)
(add-hook 'java-mode-hook 'java-doc)
(add-hook 'python-mode-hook 'python-doc)
(add-hook 'groovy-mode-hook 'groovy-doc)
(add-hook 'css-mode-hook 'css-doc)
(add-hook 'js2-mode-hook 'javascript-doc)
(add-hook 'web-mode-hook 'html-doc)

(global-set-key (kbd "C-'") #'helm-dash-at-point)
(global-set-key (kbd "C-\"") #'helm-dash)

;; install web-mode
(require-package 'web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jelly\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gsp\\'" . web-mode))

;; install web-beautify
(require-package 'web-beautify)
(require 'web-beautify)
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; install sublimity
(require-package 'sublimity)
(require 'sublimity)
;; (require 'sublimity-scroll)
(require 'sublimity-map)
;; (require 'sublimity-attractive)

;; install swiper
(require-package 'swiper)
(require 'swiper)

;; install git-timemachine
(require-package 'git-timemachine)
(require 'git-timemachine)

;; install stackoverflow
(require-package 'sx)
(require 'sx)

;; install floobits
(require-package 'floobits)
(require 'floobits)

;; http://ternjs.net/doc/manual.html#emacs
;; install tern
(add-to-list 'load-path "~/source-install/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

(global-set-key (kbd "C-*") 'isearch-forward-symbol-at-point)

;; install git-gutter  https://github.com/syohex/emacs-git-gutter
(require-package 'git-gutter)
(require 'git-gutter)
(global-git-gutter-mode +1)
;; (add-hook 'ruby-mode-hook 'git-gutter-mode)
;; (add-hook 'python-mode-hook 'git-gutter-mode)
;; (global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

(require-package 'know-your-http-well)
(require 'know-your-http-well)

(require-package 'dired-k)
(require 'dired-k)
(define-key dired-mode-map (kbd "K") 'dired-k)
;; You can use dired-k alternative to revert-buffer
(define-key dired-mode-map (kbd "g") 'dired-k)
;; always execute dired-k when dired buffer is opened
;; (add-hook 'dired-initial-position-hook 'dired-k)
;; (add-hook 'dired-after-readin-hook #'dired-k-no-revert)

;; https://wakatime.com/help/plugins/emacs#melpa-install
(require-package 'wakatime-mode)
(require 'wakatime-mode)
(global-wakatime-mode)

;; open init local file
(defun open-init-local-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-local.el"))
(global-set-key (kbd "<f2>") 'open-init-local-file)

;; hightlight current line
(global-hl-line-mode 1)

;; set default agenda files
(setq org-agenda-files '("~/org"))


;; indent all
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

(provide 'init-local)
