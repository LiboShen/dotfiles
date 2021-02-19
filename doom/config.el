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

;; Auth sources
(setq auth-sources '((:source "~/keys/.authinfo")))

;; Iterate through CamelCase words
(global-subword-mode 1)

;; Which-key
(setq which-key-idle-delay 0.5)
;; hide verbose prefixes
(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   ))

;; General key mappings
(map! :nv "L" 'evil-end-of-visual-line)
(map! :nv "H" 'evil-beginning-of-visual-line)
(map! :nv "j" 'evil-next-visual-line)
(map! :nv "k" 'evil-previous-visual-line)
(map! :n "] g" 'flycheck-next-error)
(map! :n "[ g" 'flycheck-previous-error)
(map! :n "C-s" 'save-buffer)

(use-package! evil-string-inflection)
(map! :n "g ~" 'evil-operator-string-inflection)

(map! :map ivy-minibuffer-map
      :ni "C-<return>" 'ivy-immediate-done)
(map! :map minibuffer-inactive-mode-map
      :ni "C-<return>" 'ivy-immediate-done)

;; Orm-mode
(setq org-directory "~/notes/org/")

(setq org-roam-directory "~/notes/roam/")
(setq org-roam-capture-templates
      '(
        ("n" "note" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "%<%Y%m%d%H%M%S>-${slug}"
         :head "#+title: ${title}\n#+roam_alias:\n\n")
        ("b" "book" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "refs/books/%<%Y%m%d%H%M%S>-${slug}"
         :head "#+title: ${title}\n#+roam_tags: book\n\n")
        ("a" "article" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "refs/articles/%<%Y%m%d%H%M%S>-${slug}"
         :head "#+title: ${title}\n#+roam_tags: article\n\n")))

(defun org-paste-image ()
  "Save the image in the clipboard into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (let*
      ((basename (concat (make-temp-name (format-time-string "%Y%m%d_%H%M%S_")) ".png"))
       (dirname (concat "./images/"
                        (replace-regexp-in-string " " "_"
                                                  (downcase (file-name-base buffer-file-name)))))
       (filename (concat (file-name-as-directory dirname) basename)))
    (make-directory dirname t)
    (if (eq system-type 'darwin) (call-process "pngpaste" nil nil nil filename))
                                        ; insert into file if correctly taken
    (if (file-exists-p filename) (insert (concat "[[file:" filename "]]"))))
  )

(setq deft-directory "~/notes/roam/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq
 projectile-project-root-files-functions '(projectile-root-top-down)
      projectile-project-root-files
        '(".git" ".projectile" "mix.exs" "package.json")
      )


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

;; language servers
(use-package! lsp
  :defer
  :init
  (add-to-list 'exec-path "~/bin/elixir-ls")
  (setq lsp-enable-snippet nil)
  (setq lsp-enable-file-watchers nil)
  :config
  ;; handle yasnippet by myself
  (push "[/\\\\]_build" lsp-file-watch-ignored )
  (push "[/\\\\]deps" lsp-file-watch-ignored )
  (push "[/\\\\].elixir_ls" lsp-file-watch-ignored )
  :hook
  (elixir-mode . lsp)
  )

(map! :mode elixir-mode
      :localleader
      :desc "iMenu" :nv "/" #'lsp-ui-imenu)

;; To avoid annoying ocaml-ls's json warning messages.
(setq warning-minimum-level :error)

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

(use-package! slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name "Programmai"
   :default t
   :token (auth-source-pick-first-password
           :host "programmai.slack.com"
           :user "libo")
   :subscribed-channels '(dev-backend, general)
   :mark-as-read-immediately nil
   :modeline-enabled t
   :full-and-display-names t)

  )

(after! slack
  (map! :map slack-info-mode-map
        :n :localleader "u" 'slack-room-update-messages)
  (map! (:map slack-mode-map
         :n "C-n" 'slack-buffer-goto-next-message
         :n "C-p" 'slack-buffer-goto-prev-message
         :n :localleader "c" 'slack-buffer-kill
         :n :localleader "ra" 'slack-message-add-reaction
         :n :localleader "rr" 'slack-message-remove-reaction
         :n :localleader "rs" 'slack-message-show-reaction-users
         :n :localleader "pl" 'slack-room-pins-list
         :n :localleader "pa" 'slack-message-pins-add
         :n :localleader "pr" 'slack-message-pins-remove
         :n :localleader "mm" 'slack-message-write-another-buffer
         :n :localleader "me" 'slack-message-edit
         :n :localleader "md" 'slack-message-delete
         :n :localleader "u" 'slack-room-update-messages
         :n :localleader "2" 'slack-message-embed-mention
         :n :localleader "3" 'slack-message-embed-channel))
  (map! (:map slack-edit-message-mode-map
         :n :localleader "k" 'slack-message-cancel-edit
         :n :localleader "s" 'slack-message-send-from-buffer
         :n :localleader "2" 'slack-message-embed-mention
         :n :localleader "3" 'slack-message-embed-channel))
  )

(use-package! alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))

;; Windows Management
(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

(setq +ivy-buffer-preview t)

;; Better org-return.
;; From https://github.com/alphapapa/unpackaged.el#org-return-dwim

(defun unpackaged/org-element-descendant-of (type element)
  "Return non-nil if ELEMENT is a descendant of TYPE.
TYPE should be an element type, like `item' or `paragraph'.
ELEMENT should be a list like that returned by `org-element-context'."
  ;; MAYBE: Use `org-element-lineage'.
  (when-let* ((parent (org-element-property :parent element)))
    (or (eq type (car parent))
        (unpackaged/org-element-descendant-of type parent))))

;;;###autoload
(defun unpackaged/org-return-dwim (&optional default)
  "A helpful replacement for `org-return-indent'.  With prefix, call `org-return-indent'.

On headings, move point to position after entry content.  In
lists, insert a new item or end the list, with checkbox if
appropriate.  In tables, insert a new row or end the table."
  ;; Inspired by John Kitchin: http://kitchingroup.cheme.cmu.edu/blog/2017/04/09/A-better-return-in-org-mode/
  (interactive "P")
  (if default
      (org-return t)
    (cond
     ;; Act depending on context around point.

     ;; NOTE: I prefer RET to not follow links, but by uncommenting this block, links will be
     ;; followed.

     ;; ((eq 'link (car (org-element-context)))
     ;;  ;; Link: Open it.
     ;;  (org-open-at-point-global))

     ((org-at-heading-p)
      ;; Heading: Move to position after entry content.
      ;; NOTE: This is probably the most interesting feature of this function.
      (let ((heading-start (org-entry-beginning-position)))
        (goto-char (org-entry-end-position))
        (cond ((and (org-at-heading-p)
                    (= heading-start (org-entry-beginning-position)))
               ;; Entry ends on its heading; add newline after
               (end-of-line)
               (insert "\n\n"))
              (t
               ;; Entry ends after its heading; back up
               (forward-line -1)
               (end-of-line)
               (when (org-at-heading-p)
                 ;; At the same heading
                 (forward-line)
                 (insert "\n")
                 (forward-line -1))
               ;; FIXME: looking-back is supposed to be called with more arguments.
               (while (not (looking-back (rx (repeat 3 (seq (optional blank) "\n")))))
                 (insert "\n"))
               (forward-line -1)))))

     ((org-at-item-checkbox-p)
      ;; Checkbox: Insert new item with checkbox.
      (org-insert-todo-heading nil))

     ((org-in-item-p)
      ;; Plain list.  Yes, this gets a little complicated...
      (let ((context (org-element-context)))
        (if (or (eq 'plain-list (car context))  ; First item in list
                (and (eq 'item (car context))
                     (not (eq (org-element-property :contents-begin context)
                              (org-element-property :contents-end context))))
                (unpackaged/org-element-descendant-of 'item context))  ; Element in list item, e.g. a link
            ;; Non-empty item: Add new item.
            (org-insert-item)
          ;; Empty item: Close the list.
          ;; TODO: Do this with org functions rather than operating on the text. Can't seem to find the right function.
          (delete-region (line-beginning-position) (line-end-position))
          (insert "\n"))))

     ((when (fboundp 'org-inlinetask-in-task-p)
        (org-inlinetask-in-task-p))
      ;; Inline task: Don't insert a new heading.
      (org-return t))

     ((org-at-table-p)
      (cond ((save-excursion
               (beginning-of-line)
               ;; See `org-table-next-field'.
               (cl-loop with end = (line-end-position)
                        for cell = (org-element-table-cell-parser)
                        always (equal (org-element-property :contents-begin cell)
                                      (org-element-property :contents-end cell))
                        while (re-search-forward "|" end t)))
             ;; Empty row: end the table.
             (delete-region (line-beginning-position) (line-end-position))
             (org-return t))
            (t
             ;; Non-empty row: call `org-return-indent'.
             (org-return t))))
     (t
      ;; All other cases: call `org-return-indent'.
      (org-return t)))))

(map!
 :after evil-org
 :map evil-org-mode-map
 :i [return] #'unpackaged/org-return-dwim)
