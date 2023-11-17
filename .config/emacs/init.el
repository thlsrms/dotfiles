;;; Startup configuration

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Benchmark
(use-package benchmark-init
    :ensure t
    :demand t
    :hook (after-init . benchmark-init/deactivate)
    :config
    (benchmark-init/activate))

;; Garbage collection
(use-package gcmh
    :ensure t
    :diminish
    :init
    (setq gc-cons-threshold (* 80 1024 1024))
    :hook (emacs-startup . gcmh-mode))
(setq read-process-output-max (* 1024 1024))

;; Doom-like hooks
(use-package on ; install from https://gitlab.com/ajgrf/on.el
    :ensure)

;; Security
(use-package gnutls
    :defer t
    :custom
    (gnutls-verify-error t))

;; No litering
(use-package no-littering
  :ensure t
  :init
  (setq no-littering-etc-directory "~/.cache/emacs/etc/"
        no-littering-var-directory "~/.cache/emacs/var/")
  (when (boundp 'native-comp-eln-load-path)
      (startup-redirect-eln-cache (no-littering-expand-var-file-name  "eln-cache/"))))

;; use-package keywords
(use-package bind-key
    :demand t
    :bind
    (:prefix-map custom/files-map
                 :prefix "C-c f")
    :bind
    (:prefix-map custom/toggles-map
                 :prefix "C-c t"))

;; Diminish
(use-package diminish :ensure t)


;;;;;;;;;; General customization

;;;;; Editing

;; Mark ring
(setopt set-mark-command-repeat-pop t)

;; Indent
(use-package simple
    :config
    (setq-default indent-tabs-mode nil
                  tab-width 4))

;; Put the clipboard on the kill ring before killing
(use-package simple
    :custom
    (save-interprogram-paste-before-kill t)
    (kill-do-not-save-duplicates t))

;; Persist bookmarks
(use-package bookmark
    :custom
    (bookmark-save-flag 1))

;; Selected.el activates a keymap for an active region
(use-package selected
    :ensure t
    :diminish
    :config (selected-global-mode)
    :bind (:map selected-keymap
                ("q" . selected-off)
                ("u" . upcase-region)
                ("d" . downcase-region)
                ("w" . count-words-region)
                ("m" . apply-macro-to-region-lines)))

;;;;; Convenience

;;; Completion

;; Corfu
(use-package corfu
    :ensure t
    :hook (on-first-buffer . global-corfu-mode))

;; Emacs lock - Prevents killing a buffer
(use-package emacs-lock
    :config
    (with-current-buffer "*scratch*"
        (emacs-lock-mode 'kill)))

;; Display line numbers 
(use-package display-line-numbers
    :custom
    (display-line-numbers-widen t)
    (display-line-numbers-type 'relative)
    :hook
    ((prog-mode conf-mode emacs-lisp-mode) . display-line-numbers-mode))

;; Highlight line
;; (use-package hl-line
;;     :hook (on-first-buffer . global-hl-line-mode))

;; ffap - Find File At Point
(use-package ffap
    :hook (on-first-input . ffap-bindings))

;; Persist State
(use-package persist-state
    :ensure t
    :hook
    (on-first-input . persist-state-mode))

;; Whitespace butler - Trim whitespace
(use-package ws-butler
    :ensure t
    :hook (on-first-buffer . ws-butler-global-mode)
    :diminish)


;;;;; Files
(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.cache/emacs/var/backups")))

;; Persistent undo
(use-package undo-tree
    :ensure t)
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      '(("." . "~/.cache/emacs/var/undo/")))

;; Auto-revert
(use-package autorevert
    :diminish
    :hook (on-first-buffer . global-auto-revert-mode)
    :custom
    (global-auto-revert-non-file-buffers t))

;; Recent files
(use-package recentf
    :hook (on-first-file-hook . recentf-mode)
    :bind
    (:map custom/files-map
          ("r" . recentf-open)))

;;;;; Text

;; Title case
(use-package titlecase
    :ensure t
    :defer t)

;; Jinx - spell checking - requires 'enchant' and 'pkgconf' on Arch
(use-package jinx
    :ensure t
    ;; :hook (on-first-buffer . global-jinx-mode)
    :bind
    ([remap ispell-word] . jinx-correct)
    :bind
    (:map custom/toggles-map
          ("$" . jinx-mode)))

;; Markdown
(use-package markdown-mode
    :ensure t)

;; Save place
(use-package saveplace
    :hook (on-first-buffer . save-place-mode))

;;;;; Programming
;; ANSI color in compilation buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (read-only-mode)
  (ansi-color-apply-on-region (point-min) (point-max))
  (read-only-mode))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(electric-pair-mode 1)

;;; Languages

;; C++ / C
(use-package irony
  :ensure t
  :config
  (add-hook 'c++-ts-mode-hook 'c++-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'c-ts-mode-hook 'c-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'objc-ts-mode-hook 'objc-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'lsp)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
  :ensure t
  :after company
  :config
  (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
  :ensure t
  :after irony
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

;; Fish Shell
(use-package fish-mode
  :ensure t
  :mode (("\\.fish\\'" . fish-mode))
  :config
  (add-hook 'fish-mode-hook (lambda  ()
                              (add-hook 'bofore-save-hook 'fish_indent-before-save))))

;; LUA
(use-package lua-mode
  :ensure t
  :defer t)

;; Ocaml
(use-package dune
  :ensure t)

(use-package tuareg
  :ensure t
  :hook (tuareg-mode . lsp-deferred))

(use-package ocamlformat
  :ensure t
  :custom
  (ocamlformat-enable 'enable-outside-detected-project)
  :config
  (add-hook 'before-save-hook 'ocamlformat-before-save))

(add-to-list 'exec-path "~/.opam/default/bin")

(use-package merlin
  :ensure t
  :after tuareg
  :hook
  ((tuareg-mode . merlin-mode)
   (caml-mode . merlin-mode)))

(use-package merlin-company
  :ensure t
  :after company)

(use-package flycheck-ocaml
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook
            (lambda ()
              (setq-local merlin-error-after-save nil)
              (flycheck-ocaml-setup))))

;; RUST
(use-package rustic
  :ensure t
  :config
  (setq eldoc-documentation-functions nil)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-signature-auto-activate nil)
  (setq rustic-format-on-save t))

;; Typescript
(use-package typescript-mode
  :ensure t)
(use-package tide
    :ensure t
    :config
    (add-hook 'js-ts-mode-hook 'javascript-mode)
    (add-hook 'js-mode-hook #'tide-setup)
    (add-hook 'js-mode-hook 'lsp)
    (add-hook 'before-save-hook 'tide-format-before-save))

(use-package typescript-ts-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :config
  (add-hook 'tsx-ts-mode-hook 'typescript-mode))
  (add-hook 'typescript-ts-mode-hook 'typescript-mode)
  (add-hook 'typescript-mode-hook #'tide-setup)
  (add-hook 'typescript-mode-hook 'lsp)

;; YAML
(use-package yaml-mode
  :ensure t
  :defer t)

;;;;; LSP

(use-package flycheck :ensure t)

;; eglot
;; (use-package eglot :defer t)

;; Lsp-mode
(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  (lsp-completion-provider :none)
  (lsp-eldoc-render-all t)
  (lsp-eldoc-enable-hover nil)
  (lsp-idle-delay 0.6)
  (lsp-inlay-hint-enable nil)
  (lsp-headerline-breadcrumb-segments '(symbols))
  (lsp-keep-workspace-alive nil)
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-rust-analyzer-import-granularity "module")
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; Lsp-ui
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-show-with-mouse nil)
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

;;; Tools

(use-package ripgrep
    :ensure t)

;; FZF
(use-package fzf
    :ensure t
    :config
    (setq fzf/args "-x --print-query --margin=1,0 --no-hscroll"
          fzf/executable "fzf"
          fzf/git-grep-args "-i --line-number %s"
          ;; command used for `fzf-grep-*` functions
          fzf/grep-command "rg --no-heading -nH"
          ;; If nil, the fzf buffer will appear at the top of the window
          fzf/position-bottom t
          fzf/window-height 15))

;; Dumb jump
(use-package dumb-jump
    :ensure t
    :config
    (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
    :custom
    (dumb-jump-force-searcher 'rg))

;; Git
(use-package git-modes
    :defer t
    :ensure t)

(use-package magit
  :ensure t
  :functions custom/magit-clone-read-args-a
  :custom
  (magit-clone-default-directory "/zdrive/repos/")
  (magit-no-message (list "Turning on magit-auto-revert-mode..."))
  (magit-save-repository-buffers 'dontask)
  (magit-diff-refine-hunk t)
  :config
  (defun custom/magit-process-environment (env)
    "Detect and set git -bare repo env vars when in tracked dotfile directories"
    (let* ((default (file-name-as-directory (expand-file-name default-directory)))
           (git-dir (expand-file-name "~/.dotfiles"))
           (work-tree (expand-file-name "~/"))
           (dotfiles-dirs
            (-map (apply-partially 'concat work-tree)
                  (-uniq (-keep #'file-name-directory (split-string
                                                       (shell-command-to-string
                                                        (format "/usr/bin/git --git-dir=%s --work-tree=%s ls-tree --full-tree --name-only -r HEAD"
                                                                git-dir work-tree))))))))
      (push work-tree dotfiles-dirs)
      (when (member default dotfiles-dirs)
        (push (format "GIT_WORK_TREE=%s" work-tree) env)
        (push (format "GIT_DIR=%s" git-dir) env)))
    env)
  (advice-add 'magit-process-environment
              :filter-return #'custom/magit-process-environment)

  (defun custom/magit-clone-read-args-a (orig-fun &rest args)
    "Sets `vertico-preselect' to `prompt' when cloning repos, so we clone to the default prompted
directory, and not some random existing directory under `magit-clone-default-directory'."
    (let ((vertico-preselect 'prompt))
      (apply orig-fun args)))
  (advice-add 'magit-clone-read-args :around #'custom/magit-clone-read-args-a))

;; Git gutter
(use-package git-gutter
  :ensure t
  :custom
  (git-gutter:update-interval 0.02)
  :hook (prog-mode . git-gutter-mode))

(use-package git-gutter-fringe
  :ensure t
  :config
  (set-face-foreground 'git-gutter-fr:modified "dark orange")
  (set-face-foreground 'git-gutter-fr:added "forest green")
  (set-face-foreground 'git-gutter-fr:deleted "red")
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

;; Treesitter
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (lua "https://github.com/MunifTanjim/tree-sitter-lua")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (ocaml "https://github.com/tree-sitter/tree-sitter-ocaml")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
        (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
(use-package treesit-auto
    :ensure t
    :demand t
    :custom
    (treesit-auto-install 'prompt)
    :config
    (global-treesit-auto-mode))

;; UUID Generation
(use-package uuidgen
    :ensure t
    :defer t)

;; Xref - Vertico to handle when multiple definitions are found.
(use-package xref
    :defer
    :custom
    (xref-show-definitions-function #'xref-show-definitions-completing-read))

;;;;; Applications

;; Dictionary
(use-package dictionary
    :bind
    ("M-#" . dictionary-lookup-definition))

;; vterm
(use-package vterm
  :ensure t
  :custom
  (vterm-shell "/bin/fish"))

(use-package vterm-toggle
  :ensure t
  :custom
  (vterm-toggle-hide-method #'reset-window-configration))

;;;;; Environment

;; Dired - refresh buffer
(use-package dired
    :defer
    :custom
    (dired-auto-revert-buffer t))

(setopt frame-inhibit-implied-resize t)

;; Cursor
(setopt cursor-type 'bar)
(use-package frame
    :config
    (blink-cursor-mode -1))

;; Font
(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font"
                    :height 105
                    :weight 'normal
                    :width 'normal)

;; Column number
(use-package simple
  :custom
  (fill-column 100)
    :hook
    ((on-first-buffer . column-number-mode)
    (on-first-buffer . global-display-fill-column-indicator-mode)))

;; Scroll bars
(use-package scroll-bar
    :config
    (scroll-bar-mode -1))

;; Tool bars
(use-package tool-bar
    :config
    (tool-bar-mode -1))

;; Menu bar
(use-package menu-bar
  :config
  (menu-bar-mode -1))

;; Colorscheme
(use-package autothemer :ensure t)

(use-package kaolin-themes
    :ensure t)
;;     :config
;;     (load-theme 'kaolin-dark t))
(use-package kanagawa-theme
  :ensure t
  :config
  (load-theme 'kanagawa t))

(use-package doom-modeline
    :ensure t
    :custom
    (doom-modeline-buffer-file-name-style 'truncate-with-project)
    (doom-modeline-height 16)
    (display-battery-mode t)
    (display-time-mode t)
    :init
    (doom-modeline-mode 1))

;; Tabs
(use-package centaur-tabs
  :ensure t
  :demand
  :custom
  (centaur-tabs-style "rounded")
  (centaur-tabs-height 18)
  (centaur-tabs-set-close-button nil)
  (centaur-tabs--buffer-show-groups nil)
  (centaur-tabs-buffer-groups-function 'centaur-tabs-projectile-buffer-groups)
  :config
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

;; Background transparency
(add-to-list 'default-frame-alist '(background-color . "#18181b"))
(set-background-color "#18181b")
(add-to-list 'default-frame-alist '(alpha-background . 90))

;; Faces
(use-package all-the-icons
    :ensure t
    :if (display-graphic-p))
(add-to-list 'load-path "~/.local/share/icons-in-terminal/")
(require 'icons-in-terminal)

;; Send ESC in term mode 
(require 'term)
(defun term-send-esc ()
    "Send ESC in term mode."
    (interactive)
    (term-send-raw-string "\e"))
(define-key term-raw-map (kbd "<escape>") 'term-send-esc)

;;;;; Initialization

;; Dashboard
(use-package dashboard
    :ensure t
    :custom
    (initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
    (dashboard-banner-logo-title "")
    (dashboard-startup-banner nil)
    (dashboard-set-navigator t)
    (dashboard-display-icons-p t)
    (dashboard-heading-icons t)
    (dashboard-set-file-icons t)
    (dashboard-center-content t)
    (dashboard-projects-backend 'projectile)
    (dashboard-items '((recents . 10)
                            (projects . 10)
                            (bookmarks . 5)
                            (agenda . 5)
                            (registers . 5)))
    :config
    (dashboard-setup-startup-hook))

;; Marginalia
(use-package marginalia ;; cmds descriptions
    :ensure t
    :after vertico
    :bind
    (:map minibuffer-local-map
          ("M-A" . marginalia-cycle))
    :init
    (marginalia-mode))

;; Consult
(use-package consult
    :ensure t
    :hook (completion-list-mode . consult-preview-at-point-mode)
    :bind
    ([remap switch-to-buffer] . consult-buffer)
    ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
    ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
    ([remap project-switch-to-buffer] . consult-project-buffer)
    ([remap bookmark-jump] . consult-bookmark)
    ([remap recentf-open] . consult-recent-file)
    ([remap yank] . nil)
    ([remap yank-pop] . consult-yank-pop)
    ([remap repeat-complex-command] . consult-complex-command)
    ([remap isearch-edit-string] . consult-isearch-history)
    ([remap next-matching-history-element] . consult-history)
    ([remap previous-matching-history-element] . consult-history)
    ([remap Info-search] . consult-info)
    :custom
    (register-preview-delay 0.5)
    (register-preview-function #'consult-register-format)
    ;; Adds thin lines, sorting and hides the mode line of the window
    (advice-add #'register-preview :override #'consult-register-window)
    ;; Use consult to select xref locations with preview
    (xref-show-xrefs-function #'consult-xref)
    (xref-show-definitions-function #'consult-xref)
    (consult-narrow-key "<"))

;; Company
(use-package company
    :ensure t
    :bind
    (:map company-active-map
          ("C-n". company-select-next)
          ("C-p". company-select-previous)
          ("M-<". company-select-first)
          ("M->". company-select-last))
    (:map company-mode-map
          ("<tab>". 'custom/tab-indent-or-complete)
          ("TAB". 'custom/tab-indent-or-complete))
    :custom
    (global-company-mode t)
    (company-idle-delay 0.1)
    (company-minimum-prefix-length 2)
    (company-transformers '(company-sort-by-backend-importance)))

(use-package pos-tip :ensure t)
(use-package company-quickhelp
  :ensure t
  :custom
  (company-quickhelp-color-background "gray11")
  (company-quickhelp-color-foreground "bisque2")
  :config
  (company-quickhelp-mode))

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "||.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas-fallback-behavior 'return-nil))
    (yas-expand)))

(defun custom/tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas-minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

;; Yasnippet
(use-package yasnippet
    :ensure t
    :config
    (yas-reload-all)
    (add-hook 'prog-mode-hook 'yas-minor-mode)
    (add-hook 'text-mode-hook 'yas-minor-mode))

;; Add yasnippet support to all company backends
(defvar company-mode/enable-yas t "Enable yasnippet for all backends")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(use-package yasnippet-snippets
  :ensure t)
;;(eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-yasnippet))

;; Mouse
(setopt use-dialog-box nil)
(use-package pixel-scroll
  :custom
  (scroll-step 1)
    :hook
    (on-first-buffer . pixel-scroll-precision-mode))

;; Vertico
(use-package vertico
    :ensure t
    :hook (on-first-input . vertico-mode))

(use-package vertico-indexed
    :after vertico
    :config (vertico-indexed-mode))

(use-package vertico-repeat
    :after vertico
    :hook (minibuffer-setup . vertico-repeat-save)
    :bind ("M-R" . vertico-repeat))

(use-package vertico-directory
    :after vertico
    :bind
    (:map vertico-map
          ("RET" . vertico-directory-enter)
          ("M-DEL" . vertico-directory-delete-word))
    :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package vertico-multiform
    :after vertico
    :custom
    (vertico-multiform-commands '((git-related-find-file (vertico-sort-function . nil))))
    :config
    (vertico-multiform-mode))

;; Evil
; evil-scroll-up -> evil-scroll-line-to-center
(use-package evil
    :ensure t
    :demand t
    :bind
    (("<escape>" . keyboard-escape-quit))
    :custom
    (evil-want-keybinding nil)
    (evil-want-C-u-scroll t)
    (evil-undo-system 'undo-tree)
    :config
    (evil-mode 1))

(use-package evil-collection
    :ensure t
    :after evil
    :custom
    (evil-want-integration t)
    :config
    (evil-collection-init))
(evil-set-initial-state 'term-mode 'emacs)

;;;;; Others

;; Embark
(use-package embark
  :ensure t
    :bind
    (("C-," . embark-act)
     ("C-h B" . embark-bindings))
    :custom
    (prefix-help-command #'embark-prefix-help-command)
    :config
    ;; Hide the mode line of the Embark live/completions buffers
    (add-to-list 'display-buffer-alist
                 '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                   nil
                   (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
    :hook
    (embark-collect-mode . consult-preview-at-point-mode))

;; Orderless
(use-package orderless
    :ensure t
    :custom
    (completion-styles '(orderless basic))
    (completion-category-defaults nil)
    (completion-category-overrides '((file (styles basic partial-completion)))))

;; Projectile
(use-package projectile
    :ensure t
    :diminish projectile-mode
    :custom
    (projectile-switch-project-action #'projectile-find-file)
    (projectile-enable-caching t)
    :init (when (file-directory-p "/zdrive/Personal/")
            (setq projectile-project-search-path
                  '("/zdrive/Personal" ("/zdrive/repos" . 1) ("/zdrive/Personal/learning" . 2))))
    :config (projectile-mode))

;; Rainbow mode
(use-package rainbow-mode ;; colorize color codes
    :ensure t
    :init
    (rainbow-mode))

;; Writeroom mode
(use-package writeroom-mode
    :ensure t
    :custom
    (writeroom-width 102)
    (writeroom-fullscreen-effect 'maximized)
    (writeroom-header-line t)
    (writeroom-mode-line t)
    (writeroom-fullscreen-effect 'maximized)
    (writeroom-header-line t)
    (writeroom-mode-line t))

(use-package compile
  :custom
  (compilation-context-lines 2)
  (compilation-error-screen-columns nil)
  (compilation-scroll-output t)
  (compilation-search-path '(nil "src"))
  (compilation-window-height 14))


(load (expand-file-name "keybindings" user-emacs-directory))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-move-visual t)
 '(next-error-highlight t)
 '(next-error-highlight-no-select t)
 '(next-line-add-newlines nil)
 '(package-selected-packages
   '(yasnippet-snippets ocamlformat flycheck-ocaml merlin-company dune embark-consult git-gutter-fringe git-gutter vterm-toggle vterm centaur-tabs fish-mode rustic lsp-ui lua-mode yaml-mode ws-butler writeroom-mode which-key vertico uuidgen undo-tree treesit-auto titlecase selected ripgrep rainbow-mode projectile persist-state orderless on no-littering markdown-mode marginalia kaolin-themes jinx git-modes general gcmh fzf evil-collection dumb-jump doom-modeline diminish dashboard corfu consult company benchmark-init all-the-icons))
 '(require-final-newline t)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
