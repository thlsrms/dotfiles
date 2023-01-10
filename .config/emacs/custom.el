;; Settings

;; indentetion
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Persistent undo
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      '(("." . "~/.config/emacs/undo")))

;; Change auto save files directory
(setq auto-save-file-name-transforms
      '((".*" "~/.config/emacs/auto-save-list/" t))
      backup-directory-alist
      '(("." . "~/.config/emacs/backups")))

;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024)) ;; 1mb
;; Garbage collection threshold
(setq gc-cons-threshold 50000000) ;; 50mb

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-line-numbers 'relative)
 '(display-line-numbers-mode 1 t)
 '(fill-column 100)
 '(global-company-mode t)
 '(global-display-fill-column-indicator-mode t)
 '(lisp-body-indent 4)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(writeroom-mode doom-modeline dashboard fzf general vertico-multiform kaolin-themes vertico-posframe flycheck-rust rust-mode flycheck tree-sitter-langs tree-sitter company lsp-ui evil lsp-mode orderless marginalia undo-tree which-key vertico use-package rainbow-mode evil-collection))
 '(recentf-mode t)
 '(scroll-bar-mode nil)
 '(scroll-margin 8)
 '(scroll-step 1)
 '(tool-bar-mode nil)
 '(writeroom-fullscreen-effect 'maximized)
 '(writeroom-header-line t)
 '(writeroom-mode-line t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "FiraCode Nerd Font Mono" :foundry "CTDB" :slant normal :weight normal :height 105 :width normal)))))

(provide 'custom)
;;; custom.el ends here
