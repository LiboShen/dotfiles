;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Libo Shen"
      user-mail-address "liboooshen@gmail.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes/org/")
(setq org-roam-directory "~/notes/roam/")
(setq deft-directory "~/notes/roam/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; General key mappings
(map! :nv "L" 'evil-end-of-visual-line)
(map! :nv "H" 'evil-beginning-of-visual-line)
(map! :nv "j" 'evil-next-visual-line)
(map! :nv "k" 'evil-previous-visual-line)
(map! :n "] g" 'flycheck-next-error)
(map! :n "[ g" 'flycheck-previous-error)
(map! :n "C-s" 'save-buffer)

(map! :map ivy-minibuffer-map
      :ni "C-<return>" 'ivy-immediate-done)


;; language servers
(use-package! lsp
  :defer
  :init
    (add-to-list 'exec-path "~/bin/elixir-ls")
  :hook
  (elixir-mode . lsp)
  )

(after! lsp-mode
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection
                                     (-const "reason-language-server"))
                    :major-modes '(reason-mode)
                    :notification-handlers (ht ("client/registerCapability" 'ignore))
                    :priority 1
                    :server-id 'reason-ls))
  ;; handle yasnippet by myself
  (setq lsp-enable-snippet nil)
  (push "[/\\\\]_build" lsp-file-watch-ignored )
  (push "[/\\\\]deps" lsp-file-watch-ignored )
  (push "[/\\\\].elixir_ls" lsp-file-watch-ignored )
  )

(after! reason-mode
  (add-hook! reason-mode #'lsp)
  (add-hook! reason-mode (add-hook 'before-save-hook 'refmt-before-save))
  )


;; Abbreviations
(setq abbrev-file-name             ;; tell emacs where to read abbrev
      "~/.doom.d/abbrev_defs")    ;; definitions from...
(setq save-abbrevs 'silent)        ;; save abbrevs when files are saved
(setq-default abbrev-mode t)

(sp-local-pair 'reason-mode "`" nil :actions nil) ;; disable this smartparens for reason mode.
