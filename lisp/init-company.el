;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(setq tab-always-indent 'complete)  ;; use 't when company is disabled
(add-to-list 'completion-styles 'initials t)
;; Stop completion-at-point from popping up completion buffers so eagerly
(setq completion-cycle-threshold 5)


(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (after-load 'company
    (diminish 'company-mode "CMP")
    (define-key company-mode-map (kbd "M-/") 'company-complete)
    (define-key company-active-map (kbd "M-/") 'company-select-next)
    (setq-default company-backends '((company-capf company-dabbrev-code) company-dabbrev)))
  (global-set-key (kbd "M-C-/") 'company-complete)
  (when (maybe-require-package 'company-quickhelp)
    (after-load 'company-quickhelp
      (define-key company-quickhelp-mode-map (kbd "M-h") nil))
    (add-hook 'after-init-hook 'company-quickhelp-mode))

  (defun sanityinc/local-push-company-backend (backend)
    "Add BACKEND to a buffer-local version of `company-backends'."
    (set (make-local-variable 'company-backends)
         (append (list backend) company-backends))))


;; Suspend page-break-lines-mode while company menu is active
;; (see https://github.com/company-mode/company-mode/issues/416)
(after-load 'company
  (after-load 'page-break-lines-mode
    (defvar sanityinc/page-break-lines-on-p nil)
    (make-variable-buffer-local 'sanityinc/page-break-lines-on-p)

    (defun sanityinc/page-break-lines-disable (&rest ignore)
      (when (setq sanityinc/page-break-lines-on-p (bound-and-true-p page-break-lines-mode))
        (page-break-lines-mode -1)))

    (defun sanityinc/page-break-lines-maybe-reenable (&rest ignore)
      (when sanityinc/page-break-lines-on-p
        (page-break-lines-mode 1)))

    (add-hook 'company-completion-started-hook 'sanityinc/page-break-lines-disable)
    (add-hook 'company-completion-finished-hook 'sanityinc/page-break-lines-maybe-reenable)
    (add-hook 'company-completion-cancelled-hook 'sanityinc/page-break-lines-maybe-reenable)))

;; http://emacs.stackexchange.com/questions/10837/how-to-make-company-mode-be-case-sensitive-on-plain-text
(setq company-dabbrev-downcase nil)

;; company dark theme
(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; company tags in all mode
(setq company-etags-everywhere '(php-mode html-mode web-mode nxml-mode groovy-mode java-mode))

(provide 'init-company)