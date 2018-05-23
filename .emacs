(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-safe-themes
   (quote
    ("ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" default)))
 '(package-selected-packages
   (quote
    (flycheck git-gutter evil-magit sublimity rust-mode projectile helm evil-surround magit evil evil-visual-mark-mode rjsx-mode markdown-mode centered-window-mode web-mode dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-directory-alist '(("." . "~/emacs-backups")))
(global-linum-mode t)
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))

;; setup evil with proper tabbing
(require 'evil)
(evil-mode 1)
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
(setq-default indent-tabs-mode nil)


(add-hook 'after-init-hook (lambda () (load-theme 'dracula)))
(require 'helm-config)

;; create keybindings to comment/uncomment region
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)

;; set up helm mode
(helm-mode 1)
(setq helm-autoresize-mode t)
(setq helm-buffer-max-length 40)
(global-set-key (kbd "M-x") #'helm-M-x)
(define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
(define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level)

;; set up projectile
(projectile-global-mode)

;; enable/disable word wrap
(defun enable-wrapping ()
    "enable wrapping words and lines at the same time"
    (interactive)
    (global-visual-line-mode 1)
    (setq word-wrap t)
)
(defun disable-wrapping ()
    "disable wrapping words and lines at the same time"
    (interactive)
    (global-visual-line-mode 0)
    (setq word-wrap nil)
)
(enable-wrapping)

;; automatically close brackets and parentheses
(electric-pair-mode t)

;; use sublimity
;; (require 'sublimity)
;; (require 'sublimity-scroll)
;; (require 'sublimity-map)
;; (sublimity-mode 1)

;; git gutter setup
(global-git-gutter-mode t)

;; update files when they've been updated on disk
(global-auto-revert-mode t)
