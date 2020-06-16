
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Abdulsalam Ayinla"
      user-mail-address "ayinlaabdulsalam@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;;CUSTOM VARIABLES ================================

;;GLOBALS ================================
;;(load-theme 'airline-alduin t)
;;(load-theme 'doom-oceanic-next t)
;;(load-theme 'doom-opera-light t)
(load-theme 'tsdh-light t)

(setq inhibit-compacting-font-caches nil)
(setq which-key-allow-imprecise-window-fit t)

;;(global-linum-mode t) ;;This shit keeps fucking up EMACS for me :(
(global-wakatime-mode)
(yas-global-mode 1)
;;(flycheck-add-mode 'proselint 'org-mode)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-o") 'ace-window)
(map! :leader
      :desc "Jump to char" "i s" #'ivy-yasnippet)

(map! :m "/" 'swiper)

(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq company-lsp-cache-candidates t)
(setq org-plantuml-jar-path (expand-file-name "/Users/ayinla/plantuml.jar"))

(setq backup-directory-alist `(("." . "~/.saves")))
(setq initial-major-mode 'org-mode)
(setq mac-command-modifier 'control)
(setq-default tab-width 2 indent-tabs-mode nil)
(setq ivy-re-builders-alist
     '((ivy-switch-buffer . ivy--regex-plus)
        (t . ivy--regex-fuzzy)))
(add-to-list 'ivy-re-builders-alist '(counsel-rg . ivy--regex-plus))
(setq enable-recursive-minibuffers t)
(setq ivy-use-selectable-prompt t)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq projectile-completion-system 'ivy)
(setq projectile-project-search-path '("~/github.com/"))

(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.uml\\'" . plantuml-mode))
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")

;; Defer LSP
(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'css-mode-hook  #'lsp-deferred)
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'js-mode-hook #'lsp-deferred)
(add-hook 'json-mode-hook #'lsp-deferred)
(add-hook 'jsx-mode-hook #'lsp-deferred)
(add-hook 'python-mode #'lsp-deferred)
(add-hook 'typescript-mode-hook #'lsp-deferred)
(add-hook 'web-mode-hook #'lsp-deferred)

;; Enable Emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)
(add-hook 'typescript-mode-hook 'emmet-mode)

;; Before save hooks
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'bazel-mode-hook (lambda ()(add-hook 'before-save-hook #'bazel-format nil t)))
(add-hook 'c-mode-common-hook (lambda ()(add-hook 'before-save-hook #'lsp-format-buffer)))
(add-hook 'protobuf-mode-hook (lambda ()(add-hook 'before-save-hook #'format-all-buffer)))

;; PlantUML jar configuration
(setq plantuml-jar-path "/Users/ayinla/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)
(setq org-plantuml-jar-path
      (expand-file-name "/Users/ayinla/plantuml.jar"))


;; Org-mode configuration
(display-time-mode 1)
(timeclock-mode-line-display 1)
(setq org-log-done 'time)
(after! org
  (add-to-list 'org-capture-templates
               '("c" "Capture" entry (file+headline "~/org/refile.org" "Tasks") "* TODO %?\n  %i\n" :prepend t))
  )

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-global-properties (quote (("Effort_ALL" . "0 0:10 0:20 0:30 1:00 1:30 2:00 3:00 4:00 6:00 8:00 10:00 20:00"))))
(setq org-columns-default-format "%40ITEM %TODO %3PRIORITY %10TAGS %17Effort(Estimated Effort){:} %12CLOCKSUM")

;; Ediff merge 2 conflicts(defun ediff-copy-both-to-C ()
(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

