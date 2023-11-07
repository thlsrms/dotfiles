;; Keybindings

(use-package which-key
    :ensure t
    :init (which-key-mode)
    :config
    (setq which-key-idle-delay 0.4
          which-key-idle-secondary-delay 0.05
          which-key-allow-evil-operators t
          which-key-use-C-h-commands nil))

(use-package general
    :ensure t
    :after evil
    :config
    (general-define-key
        :states '(normal insert motion emacs)
        :keymaps 'override
        :prefix-map 'keymap/keys-map
        :prefix-name "General Keys"
        :prefix "SPC"
        :non-normal-prefix "M-SPC")
    (general-create-definer keymap/keys-def :keymaps 'keymap/keys-map)

    (general-define-key
        :states '(normal visual)
        :major-modes t
        :prefix-map 'keymap/lsp-map
        :prefix-name "LSP Keys"
        :prefix "SPC"
        :non-normal-prefix "M-SPC")
    (general-create-definer keymap/lsp-def :keymaps 'keymap/lsp-map ))

;; (global-set-key ["C-<prior>"] 'tab-previous)
;; (global-set-key ["C-<next>"] 'tab-next)
(global-unset-key (kbd "C-h C-h"))

;; VTerm keys
(global-set-key (kbd "C-S-t") 'vterm-toggle)
(global-set-key [C-f2] 'vterm-toggle-cd)
(define-key vterm-mode-map (kbd "C-S-n") #'vterm-toggle-forward)
(define-key vterm-mode-map (kbd "C-S-p") #'vterm-toggle-backward)
(define-key vterm-mode-map (kbd "C-S-r") #'vterm-toggle-insert-cd)

;; Magit keys
(define-key magit-mode-map (kbd "M-t") 'magit-section-toggle)

(keymap/keys-def
    :keysmap 'keymap/keys-map
    :prefix "SPC b"
    :non-normal-prefix "M-SPC b"
    :prefix-name "Buffer"
    "" '(:ignore t :wk "Buffer"))
(keymap/keys-def
    :keysmap 'keymap/keys-map
    "B" '("Buffers" . switch-to-buffer)
    "bb" '("Switch buffer" . switch-to-buffer)
    "bc" '("Close buffer" . kill-this-buffer)
    "bk" '("Kill another buffer" . kill-buffer)
    "bs" '("Save buffer" . save-buffer)
    "bz" '("Writeroom Mode" . writeroom-mode))

(keymap/keys-def
    :keysmap 'keymap/keys-map
    :prefix "SPC d"
    :non-normal-prefix "M-SPC d"
    :prefix-name "Diagnostics"
    "" '(:ignore t :wk "Diagnostics"))
(keymap/keys-def
    :keymaps 'keymap/keys-map
    "dc" '("Start checking buffer" . flycheck-buffer)
    "dC" '("Clear current buffer" . flycheck-clear)
    "dl" '("List errors" . flycheck-list-errors)
    "dn" '("Next error" . flycheck-next-error)
    "dp" '("Previous error" . flycheck-previous-error))

(keymap/keys-def
    :keysmap 'keymap/keys-map
    :prefix "SPC f"
    :non-normal-prefix "M-SPC f"
    :prefix-name "File"
    "" '(:ignore t :wk "File"))
(keymap/keys-def
    :keysmap 'keymap/keys-map
    "fC" '("Create file" . make-empty-file)
    "fd" '("Fzf inside directory" . fzf-directory)
    "fD" '("Delete file" . delete-file)
    "ff" '("Find file" . fzf-find-file)
    "fo" '("Open File" . find-file)
    "fr" '("Recent Files" . consult-recent-file))
    ;;"fg" '(fzf-grep-with-narrowing :which-key "Find with grep")
    ;;"fr" '(fzf-recentf :which-key "Recent files")

(keymap/keys-def
    :keysmap 'keymap/keys-map
    :prefix "SPC g"
    :non-normal-prefix "M-SPC g"
    :prefix-name "Goto"
    "" '(:ignore t :wk "Goto"))
(keymap/keys-def
    :keysmap 'keymap/keys-map
    "gb" '("Bookmark" . consult-bookmark)
    "ge" '("Errors" . consult-compile-error)
    "gI" '("Imenu Multi" . consult-imenu-multi)
    "gm" '("Marks" . consult-mark)
    "gM" '("Global Marks" . consult-global-mark)
    "go" '("Outline" . consult-outline)
    "gs" '("Imenu" . consult-imenu))

(keymap/keys-def
    :keysmap 'keymap/keys-map
    :prefix "SPC G"
    :non-normal-prefix "M-SPC G"
    :prefix-name "Git"
    "" '(:ignore t :wk "Git"))
(keymap/keys-def
  :keysmap 'keymap/keys-map
  "Gs" '("Status" . magit-status)
  "Gc" '("Clone" . magit-clone))

(keymap/keys-def
    :keysmap 'keymap/keys-map
    :prefix "SPC p"
    :non-normal-prefix "M-SPC p"
    :prefix-name "Projectile"
    "" '(:ignore t :wk "Projectile"))
(keymap/keys-def
    :keymaps 'keymap/keys-map
    "p" '("Projectile" . projectile-command-map)
    "pA" '("Add known project" . projectile-add-known-project)
    "p C-t" '("VTerm" . projectile-run-vterm)
    "pb" '("Project buffers" . consult-project-buffer))

(keymap/keys-def
    :keysmap 'keymap/keys-map
    :prefix "SPC s"
    :non-normal-prefix "M-SPC s"
    :prefix-name "Search"
    "" '(:ignore t :wk "Search"))
(keymap/keys-def
    :keysmap 'keymap/keys-map
    "sf" '("FD file" . consult-fd)
    "sh" '("Isearch History" . consult-isearch-history)
    "sl" '("Line" . consult-line)
    "sL" '("Line multi" . consult-line-multi)
    "sk" '("Keep Lines" . consult-keep-lines)
    "sr" '("Ripgrep" . consult-ripgrep)
    "su" '("Focus lines". consult-focus-lines))

(keymap/keys-def
    :keysmap 'keymap/keys-map
    :prefix "SPC t"
    :non-normal-prefix "M-SPC t"
    :prefix-name "Tabs"
    "" '(:ignore t :wk "Tabs"))
(keymap/keys-def
  :keysmap 'keymap/keys-map
  "t<" '("Move left" . centaur-tabs-move-current-tab-to-left)
  "t>" '("Move right" . centaur-tabs-move-current-tab-to-right)
  "tj" '("Switch group" . centaur-tabs-switch-group)
  "tK" '("Kill group" . centaur-tabs-kill-all-buffers-in-current-group)
  "tN" '("New tab" . centaur-tabs--create-new-tab)
  "tt" '("Ace jump" . centaur-tabs-ace-jump))

(keymap/keys-def
    :keysmap 'keymap/keys-map
    :prefix "SPC w"
    :non-normal-prefix "M-SPC w"
    :prefix-name "Window"
    "" '(:ignore t :wk "Window"))
(keymap/keys-def
  :keysmap 'keymap/keys-map
  "w C-h" '("Split vertically" . split-window-vertically)
  "w C-s" '("Split horizontally" . split-window-horizontally)
  "wh" '("Left window" . evil-window-left)
  "wj" '("Down window" . evil-window-down)
  "wk" '("Up window" . evil-window-up)
  "wl" '("right window" . evil-window-right))

;; LSP keybindings
(keymap/lsp-def
    :keymaps 'keymap/lsp-map

    "a" '("Code Action" . lsp-execute-code-action)
    "bf" '("Format buffer" . lsp-format-buffer)
    "b=" '("Format region" . lsp-format-region)
    "gd" '("Find Definition" . lsp-find-definition)
    "gr" '("Find References" . lsp-find-references)
    "k" '("Glance docs" . lsp-ui-doc-glance)
    ;; refactor
    "r" '("LSP Rename" . lsp-rename))
(keymap/lsp-def
    :keysmap 'keymap/lsp-map
    :prefix "SPC h"
    :prefix-name "LSP Help"
    "" '(:ignore t :wk "LSP Help"))
(keymap/lsp-def
    :keymaps 'keymap/lsp-map
    "hi" '("Toggle symbols info" . lsp-ui-sideline-toggle-symbols-info)
    "hh" '("Describe at cursor" . lsp-describe-thing-at-point)
    "hS" '("Toggle sideline" . lsp-ui-sideline-mode)
    )
(keymap/lsp-def
    :keysmap 'keymap/lsp-map
    :prefix "SPC x"
    :prefix-name "Text - Code"
    "" '(:ignore t :wk "Text - Code"))
(keymap/lsp-def
    :keymaps 'keymap/lsp-map
    "xh" '("Toggle highlight" . lsp-document-highlight)
    "xl" '("Toggle lens" . lsp-lens-mode)
    "xt" '("Truncate lines" . toggle-truncate-lines)
    "xw" '("Word wrap" . toggle-word-wrap))

(keymap/lsp-def
    :keysmap 'keymap/lsp-map
    :prefix "SPC P"
    :prefix-name "Peek"
    "" '(:ignore t :wk "Peek"))
(keymap/lsp-def
    :keymaps 'keymap/lsp-map
    "Pi" '("Peek implementation" . lsp-ui-peek-find-implementation)
    "Pr" '("Peek references" . lsp-ui-peek-find-references))

