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
(load-theme 'doom-oceanic-next t)

;;(global-linum-mode t)
(global-wakatime-mode)

(yas-global-mode 1)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key [f8] 'treemacs)
(map! :m "/" 'swiper)
;;(setq company-lsp-cache-candidates t)
(setq ivy-display-style 'fancy)
(setq mac-command-modifier 'control)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq backup-directory-alist `(("." . "~/.saves")))
;;(setq lsp-clients-typescript-server "/usr/local/bin/typescript-language-server" lsp-clients-typescript-server-args '("--stdio"))
;;(setq ivy-use-virtual-buffers t)
;;(setq ivy-use-selectable-prompt t)
;;(setq projectile-completion-system 'ivy)
(setq ivy-re-builders-alist
     '((ivy-switch-buffer . ivy--regex-plus)
        (t . ivy--regex-fuzzy)))
;; enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp)
(setq-default tab-width 2 indent-tabs-mode nil)
(setq initial-major-mode 'org-mode)
(setq org-plantuml-jar-path (expand-file-name "/Users/ayinla/plantuml.jar"))

;;(global-company-mode)
(global-flycheck-mode)
;;(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'bazel-mode-hook (lambda () (add-hook 'before-save-hook #'bazel-format nil t)))
(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'c-mode-common-hook (lambda () (add-hook 'before-save-hook #'lsp-format-buffer)))
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'css-mode-hook  #'lsp-deferred)
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'js-mode-hook #'lsp-deferred)
(add-hook 'json-mode-hook #'lsp-deferred)
(add-hook 'jsx-mode-hook #'lsp-deferred)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'protobuf-mode-hook (lambda () (add-hook 'before-save-hook #'format-all-buffer)))
(add-hook 'python-mode #'lsp-deferred)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'typescript-mode-hook #'lsp-deferred)
;;(add-hook 'typescript-mode-hook 'prettier-js-mode )
(add-hook 'web-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook #'lsp-deferred)
;;(add-hook 'web-mode-hook 'prettier-js-mode)
;;(eval-after-load 'web-mode
;;    '(progn
;;       (add-hook 'web-mode-hook #'./node_modules/.bin)
;;       (add-hook 'web-mode-hook #'prettier-js-mode)))

(defun lsp-on-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.uml\\'" . plantuml-mode))
