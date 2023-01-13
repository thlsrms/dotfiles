;;; Startup configuration

(setq package-archives
    '(("melpa" . "https://melpa.org/packages/")
    ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;;; Utilities
(use-package undo-tree)
(use-package all-the-icons
    :if (display-graphic-p))
(use-package ripgrep)

(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)

(require 'term)
(defun term-send-esc ()
    "Send ESC in term mode."
    (interactive)
    (term-send-raw-string "\e"))

;;; Theme
(use-package kaolin-themes
    :config
    (load-theme 'kaolin-dark t))

(use-package doom-modeline
    :init
    (setq doom-modeline-height 16)
    (doom-modeline-mode 1))

;;; Dashboard
(use-package dashboard
    :init
    (setq dashboard-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-center-content t)
    (setq dashboard-startup-banner 'logo)
    (setq dashboard-projects-backend 'projectile)
    (setq dashboard-items '((recents . 5)
                            (bookmarks . 5)
                            (projects . 5)
                            (agenda . 5)
                            (registers . 5)))
    :config
    (dashboard-setup-startup-hook))

;;; VIM Style
(use-package evil
    :demand t
    :bind (("<escape>" . keyboard-escape-quit))
    :init
    (setq evil-want-keybinding nil)
    (setq evil-want-C-u-scroll t)
    (setq evil-undo-system 'undo-tree)
    :config
    (evil-mode 1))

(use-package evil-collection
    :after evil
    :config
    (setq evil-want-integration t)
    (evil-collection-init))

(use-package general
    :after evil
    :config
    (general-define-key
        :states '(normal insert motion emacs)
        :keymaps 'override
        :prefix-map 'keymap/keys-map
        :prefix "SPC"
        :non-normal-prefix "M-SPC")
    (general-create-definer keymap/keys-def :keymaps 'keymap/keys-map)

    (general-define-key
        :states '(normal visual)
        :major-modes t
        :prefix-map 'keymap/lsp-map
        :prefix "SPC l"
        :non-normal-prefix "C-SPC l")
    (general-create-definer keymap/lsp-def :keymaps 'keymap/lsp-map )

    (keymap/keys-def
        "f" '(:ignore t :which-key "File")
        "fo" '(find-file :which-key "Open File")

        "g" '(:ignore t :which-key "Goto")

        "b" '(:ignore t :which-key "Buffer")
        "bb" 'switch-to-buffer
        "bq" 'kill-this-buffer
        "bk" 'kill-buffer
        "bs" 'save-buffer))

;;; LSP
(use-package lsp-mode
    :defer t
    :hook ((lsp-mode . lsp-enable-which-key-integration))
    :init
    (setq lsp-keymap-prefix "C-c l")
    :general
    (keymap/lsp-def
        :keymaps 'keymap/lsp-map
        :predicate 'lsp-mode
        "a" 'lsp-execute-code-action

        "=" '(:ignore t :which-key "Format")
        "==" 'lsp-format-buffer
        "=r" 'lsp-format-region

        ;; help
        "h" '(:ignore t :which-key "Help")
        "hh" '(lsp-describe-thing-at-point :which-key "Describe at cursor")

        ;; refactor
        "r" '(:ignore t :which-key "Refactor")
        "rr" 'lsp-rename

        ;; text/code
        "x" '(:ignore t :which-key "Text - Code")
        "xh" 'lsp-document-highlight
        "xl" 'lsp-lens-show
        "xL" 'lsp-lens-hide))

(use-package lsp-ui
    :defer t
    :general
    (keymap/lsp-def
        :keymaps 'keymap/lsp-map
        :predicate 'lsp-mode

        "k" 'lsp-ui-doc-glance
        "s" 'lsp-ui-imenu

        "p" '(:ignore t :which-key "Peek")
        "pi" 'lsp-ui-peek-find-implementation
        "pr" 'lsp-ui-peek-find-references))

(use-package flycheck
    :init (global-flycheck-mode)
    :general
    (keymap/keys-def
        :keymaps 'keymap/keys-map
        "d" '(:ignore t :which-key "Diagnostics")
        "dl" '(flycheck-list-errors :wk "Next error")
        "dn" '(flycheck-next-error :wk "Next error")
        "dp" '(flycheck-previous-error :wk "Previous error")
        "dC" '(flycheck-clear :wk "Clear current buffer")
        "dc" '(flycheck-buffer :wk "Start checking buffer")))

(use-package company ;; Auto completion
    ;; Being globally enabled in the custom-set-variables
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 2))

;;; Tree-sitter
(use-package tree-sitter-langs)
(use-package tree-sitter
    :config
    (require 'tree-sitter-langs)
    (global-tree-sitter-mode)
    (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;;; Language specifics
;; RUST
(use-package rust-mode
    :defer t
    :init
    (setq rust-format-on-save t)
    (add-hook 'rust-mode-hook
              (lambda () (prettify-symbols-mode)))
    (add-hook 'rust-mode-hook #'lsp)
    :bind (("M-," . rust-compile)))
(use-package flycheck-rust
    :hook (flycheck-mode-hook . flycheck-rust-setup))
;; LUA
(use-package lua-mode
    :defer t)

;;; General purpose packages
(use-package which-key
    :init (which-key-mode)
    :config
    (setq which-key-idle-delay 0.4
          which-key-idle-secondary-delay 0.05
          which-key-allow-evil-operators t))

;; Vertico
(use-package vertico
    :init
    (vertico-mode))

(use-package marginalia ;; cmds descriptions
    :init
    (marginalia-mode))

(use-package consult
    :hook (completion-list-mode . consult-preview-at-point-mode)
    :init
    (setq register-preview-delay 0.5
          register-preview-function #'consult-register-format)
    ;; Adds thin lines, sorting and hides the mode line of the window
    (advice-add #'register-preview :override #'consult-register-window)
    ;; Use consult to select xref locations with preview
    (setq xref-show-xrefs-function #'consult-xref
          xref-show-definitions-function #'consult-xref)
    (keymap/keys-def
        :keysmap 'keymap/keys-map
        "gt" 'consult-line
        "go" 'consult-outline
        "gb" 'consult-bookmark
        "gr" 'consult-ripgrep

        "fr" 'consult-recent-file)
    :config
    (setq consult-narrow-key "<"))

(use-package embark
    :bind
    (("C-." . embark-act)
     ("C-h B" . embark-bindings))
    :init
    (setq prefix-help-command #'embark-prefix-help-command)
    :config
    ;; Hide the mode line of the Embark live/completions buffers
    (add-to-list 'display-buffer-alist
                 '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                   nil
                   (window-parameters (mode-line-format . none)))))

(use-package embark-consult
    :hook
    (embark-collect-mode . consult-preview-at-point-mode))

(use-package orderless
    :init
    (setq completion-styles '(orderless basic)
          completion-category-defaults nil
          completion-category-overrides '((file (styles basic partial-completion)))))

;; Projectile
(use-package projectile
    :diminish projectile-mode
    :init (when (file-directory-p "/zdrive/Projs/")
              (setq projectile-project-search-path '("/zdrive/Projs")))
    (setq projectile-switch-project-action #'projectile-dired)
    :config (projectile-mode)
    (keymap/keys-def
        :keymaps 'keymap/keys-map
        "p" 'projectile-command-map
        "pb" 'consult-project-buffer))

;; fzf
(evil-set-initial-state 'term-mode 'emacs)
(define-key term-raw-map (kbd "<escape>") 'term-send-esc)
(use-package fzf
    :config
    (setq fzf/args "-x --print-query --margin=1,0 --no-hscroll"
          fzf/executable "fzf"
          fzf/git-grep-args "-i --line-number %s"
          ;; command used for `fzf-grep-*` functions
          fzf/grep-command "rg --no-heading -nH"
          ;; If nil, the fzf buffer will appear at the top of the window
          fzf/position-bottom t
          fzf/window-height 15)
    (keymap/keys-def
        :keymaps 'keymap/keys-map
        "ff" '(fzf-find-file :which-key "Find file")
        ;;"fg" '(fzf-grep-with-narrowing :which-key "Find with grep")
        ;;"fr" '(fzf-recentf :which-key "Recent files")
        "fd" '(fzf-directory :which-key "Fzf inside directory")))

(use-package rainbow-mode ;; colorize color codes
    :init
    (rainbow-mode))

(use-package writeroom-mode
    :init
    (setq writeroom-width 102)
    (setq writeroom-fullscreen-effect 'maximized)
    (setq writeroom-header-line t)
    (setq writeroom-mode-line t)
    :config
    (keymap/keys-def
        :keymaps 'keymap/keys-map
        "bz" '(writeroom-mode :which-key "Writeroom Mode")))
     
(provide 'init)
;;; init.el ends here
