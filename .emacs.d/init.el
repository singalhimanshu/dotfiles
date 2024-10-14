(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

(add-to-list 'package-archives 
    '("MELPA" . "http://melpa.org/packages/"))
(package-initialize)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups"))
      auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save-list/" t)))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode t)
  (evil-set-undo-system 'undo-redo))

(use-package magit
  :ensure t)

(use-package company
  :commands company-mode
  :init
  (add-hook 'prog-mode-hook #'company-mode)
  :config
  (setq company-idle-delay 0.5))

(use-package go-mode
  :ensure t)

(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker))

(ido-mode)

(use-package smex
    :bind (("M-x" . smex))
    :config (smex-initialize))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)


(global-set-key (kbd "<f5>") 'recompile)
