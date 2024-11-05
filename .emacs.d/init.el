(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

(add-to-list 'package-archives 
    '("MELPA" . "http://melpa.org/packages/"))
(package-initialize)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups"))
      auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save-list/" t)))

(setq modus-themes-mode-line '(accented borderless)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      modus-themes-completions 'opinionated
      modus-themes-org-blocks 'tinted-background
      modus-themes-scale-headings t
      modus-themes-region '(bg-only)
      modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))
(load-theme 'modus-vivendi t)


(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode t)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (evil-set-undo-system 'undo-redo))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package general
  :ensure t
  :after evil
  :config
  (general-create-definer efs/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (efs/leader-keys
    "SPC" '(project-find-file :which-key "project find file")
    "y" '(consult-yank-from-kill-ring :which-key "yank from kill ring")
    ":" '(consult-line :which-key "go to line")
    "/" '(consult-ripgrep :which-key "grep")
    "pp" '(project-switch-project :which-key "switch project")
    "pd" '(project-dired :which-key "project dired")
    "pc" '(project-compile :which-key "project dired")
    "pg" '(project-find-regexp :which-key "project grep")
    "pb" '(consult-project-buffer :which-key "project list buffers")
    "p!" '(project-shell-command :which-key "project shell command")
    "'" '(recompile :which-key "recompile")
    "cc" '(compile :which-key "recompile")
    "og" '(magit :which-key "open magit")
    "ot" '(vterm :which-key "open vterm")
    "od" '(dired :which-key "open dired")
    "ff" '(find-file :which-key "find file")
    "fr" '(consult-recent-file :which-key "find recent file")
    "bb" '(consult-buffer :which-key "switch buffer")
    "bk" '(kill-buffer :which-key "kill buffer")
    "nn" '(org-roam-buffer-toggle :which-key "notes toggle")
    "nf" '(org-roam-node-find :which-key "find notes")
    "ni" '(org-roam-node-insert :which-key "insert new note")
    "wq" '(evil-window-delete :which-key "close window")
    "wk" '(evil-window-up :which-key "window up")
    "wj" '(evil-window-down :which-key "window down")
    "wh" '(evil-window-left :which-key "window left")
    "wl" '(evil-window-right :which-key "window right")
    "wo" '(delete-other-windows :which-key "delete other windows")
    "fc" '(lambda () (interactive) (find-file (expand-file-name "~/.emacs.d/init.el")))))

(use-package evil-commentary
  :ensure t
  :after evil
  :init
  (evil-commentary-mode))

(use-package magit
  :ensure t
  :config
  (setq magit-status-buffer-switch-function 'switch-to-buffer))

(use-package company
  :commands company-mode
  :init
  (add-hook 'prog-mode-hook #'company-mode)
  :config
  (setq company-idle-delay 0.5))

(use-package go-mode
  :ensure t)

(use-package gruber-darker-theme
  :ensure t)
  ;; :config
  ;; (load-theme 'gruber-darker))

;; (ido-mode)
;; (ido-everywhere)
;; (setq ido-enable-prefix t)
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-filename-at-point 'guess)
;; (setq ido-create-new-buffer 'always)

;; (use-package smex
;;     :bind (("M-x" . smex))
;;     :config (smex-initialize))

(use-package yaml-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(global-set-key (kbd "C-c '") 'recompile)

(require 'project)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Enable vertico
(use-package vertico
  :ensure t
  :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :config
  (vertico-mode t))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode))

(setq dired-dwim-target t)

(use-package persistent-scratch
  :ensure t
  :config
  (persistent-scratch-autosave-mode 1)
  (persistent-scratch-setup-default))

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)

  ;; Set correct Python interpreter
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))

(use-package marginalia
  :ensure t
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

(use-package vterm
  :ensure t
  :commands vterm
  :custom
  (vterm-always-compile-module t)
  :hook
  (vterm-mode . (lambda ()
		  ;; Settings to mimic dracula I use for zsh.
		  (setq-local buffer-face-mode-face '(:background "#000000" :foreground "#FFFFFF"))
		  (buffer-face-mode 1)
		  (text-scale-adjust 2))))

(setq compilation-scroll-output 'first-error)

(use-package org-superstar
  :ensure t
  :after org
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-special-todo-items t))

(use-package indent-bars
  :ensure t
  :hook ((python-mode yaml-mode) . indent-bars-mode))

(save-place-mode 1)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Documents/notes")
  :config
  (org-roam-setup))

(use-package consult
  :ensure t)

(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc. You may adjust the
  ;; Eldoc strategy, if you want to see the documentation from
  ;; multiple providers. Beware that using this can be a little
  ;; jarring since the message shown in the minibuffer can be more
  ;; than one line, causing the modeline to move up and down:

  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
