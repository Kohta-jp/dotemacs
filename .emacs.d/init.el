;;; init.el --- My init.el  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Naoya Yamashita

;; Author: Naoya Yamashita <conao3@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; My init.el.

;;; Code:

;; this enables this running method
;;   emacs -q -l ~/.debug.emacs.d/init.el
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("org"   . "https://orgmode.org/elpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))

;; ここにいっぱい設定を書く


;;;; My Settigns from here

;;; EmacsJP setting :: https://emacs-jp.github.io/tips/emacs-in-2020


;; Configuration of Emacs standard attachment packages
;; ---------------------------------------------------

;; cus-edit.c

(leaf cus-edit
  :doc "tools for customizing Emacs and Lisp packages"
  :tag "builtin" "faces" "help"
  :custom `((custom-file . ,(locate-user-emacs-file "custom.el"))))

;; cus-start.c

(leaf cus-start
  :doc "define customization properties of builtins"
  :tag "builtin" "internal"
  :preface
  (defun c/redraw-frame nil
    (interactive)
    (redraw-frame))

  :bind (("M-ESC ESC" . c/redraw-frame))
  :custom '((user-full-name . "Kohta Nakajima")
            (user-mail-address . "shimasanlog.d@gmail.com")
            (user-login-name . "gonketsu")
            (create-lockfiles . nil)
            (debug-on-error . t)
            (init-file-debug . t)
            (frame-resize-pixelwise . t)
            (enable-recursive-minibuffers . t)
            (history-length . 1000)
            (history-delete-duplicates . t)
            (scroll-preserve-screen-position . t)
            (scroll-conservatively . 100)
            (mouse-wheel-scroll-amount . '(1 ((control) . 5)))
            (ring-bell-function . 'ignore)
            (text-quoting-style . 'straight)
            (truncate-lines . t)
            (use-dialog-box . nil)
            (use-file-dialog . nil)
            (menu-bar-mode . t)
            (tool-bar-mode . nil)
            (scroll-bar-mode . nil)
            (indent-tabs-mode . nil))
  :config
  (defalias 'yes-or-no-p 'y-or-n-p)
  (keyboard-translate ?\C-h ?\C-?))

;; autorevert
;; ->
(leaf autorevert
  :doc "revert buffers when files on disk change"
  :tag "builtin"
  :custom ((auto-revert-interval . 1))
  :global-minor-mode global-auto-revert-mode)

;; cc-mode

(leaf cc-mode
  :doc "major mode for editing C and similar languages"
  :tag "builtin"
  :defvar (c-basic-offset)
  :bind (c-mode-base-map
         ("C-c c" . compile))
  :mode-hook
  (c-mode-hook . ((c-set-style "stroustrup")
                  (setq c-basic-offset 4)))
  (c++-mode-hook . ((c-set-style "stroustrup")
                    (setq c-basic-offset 4))))

;; delsel

(leaf delsel
  :doc "delete selection if you insert"
  :tag "builtin"
  :global-minor-mode delete-selection-mode)

;; paren

(leaf paren
  :doc "highlight matching paren"
  :tag "builtin"
  :custom ((show-paren-delay . 0.1))
  :global-minor-mode show-paren-mode)

;; simple

(leaf simple
  :doc "basic editing commands for Emacs"
  :tag "builtin" "internal"
  :custom ((kill-ring-max . 100)
           (kill-read-only-ok . t)
           (kill-whole-line . t)
           (eval-expression-print-length . nil)
           (eval-expression-print-level . nil)))

;; files

(leaf files
  :doc "file input and output commands for Emacs"
  :tag "builtin"
  :custom `((auto-save-timeout . 15)
            (auto-save-interval . 60)
            (auto-save-file-name-transforms . '((".*" ,(locate-user-emacs-file "backup/") t)))
            (backup-directory-alist . '((".*" . ,(locate-user-emacs-file "backup"))
                                        (,tramp-file-name-regexp . nil)))
            (version-control . t)
            (delete-old-versions . t)))

;; startup

(leaf startup
  :doc "process Emacs shell arguments"
  :tag "builtin" "internal"
  :custom `((auto-save-list-file-prefix . ,(locate-user-emacs-file "backup/.saves-"))))

;; ----------------------------------------------------------------------------------------------


;; modeline settings
;; ----------------------------------------------------------------------------------------------
;; モードライン(下のバー)に関する設定
(leaf *modeline-settings
  :config
  ;; doom-modeline
  ;; doom を利用した mode-line
  (leaf doom-modeline
    :ensure t
    :custom
    (doom-modeline-buffer-file-name-style . 'auto)
    (doom-modeline-icon . t)
    (doom-modeline-major-mode-icon . t)
    (doom-modeline-minor-modes . t)
    (doom-modeline-buffer-file-state-icon .t)
    ;;modeline size settings
    (doom-modeline-height . 30)
    (doom-modeline-bar-width . 4)
    :hook (after-init-hook . doom-modeline-mode)
    :config
    (line-number-mode 1)
    (column-number-mode 1)
    )
  )



;; minibuffers settings
;; ----------------------------------------------------------------------------------------------

(leaf minibuffer-setting
  :config
  (leaf consult
    :ensure t
    :bind (;; C-c bindings
           ("C-c h" . consult-history)
           ("C-c M-x" . consult-mode-command)
           ("C-c k" . consult-kmacro)
           ("C-c m" . consult-man)
           ("C-c i" . consult-info)
           ([remap Info-search] . consult-info)
           ;; C-x bindings
           ("C-x M-:" . consult-complex-command)
           ("C-x b" . consult-buffer)
           ("C-x 4 b" . consult-buffer-other-window)
           ("C-x 5 b" . consult-buffer-other-frame)
           ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
           ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
           ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
           ;; Custom M-# bindings
           ("M-#" . consult-register-load)
           ("M-'" . consult-register-store)
           ("C-M-#" . consult-register)
           ;; Other custom bindings
           ("M-y" . consult-yank-pop)
           ;; M-g bindings
           ("M-g e" . consult-compile-error)
           ("M-g f" . consult-flymake)
           ("M-g g" . consult-goto-line)
           ("M-g o" . consult-outline)
           ("M-g m" . consult-mark)
           ("M-g k" . consult-global-mark)
           ("M-g i" . consult-imenu)
           ("M-g I" . consult-imenu-multi)
           ;; M-s bindings
           ("M-s f" . consult-find)
           ("M-s F" . consult-locate)
           ("M-s g" . consult-grep)
           ("M-s G" . consult-git-grep)
           ("M-s r" . consult-ripgrep)
           ("M-s l" . consult-line)
           ("M-s L" . consult-line-multi)
           ("M-s k" . consult-keep-lines)
           ("M-s u" . consult-focus-lines)
           ;; Isearch integration
           ;("M-s e" . consult-isearch-history)
           (isearch-mode-map
            ("M-e" . consult-isearch-history)        ;; orig. isearch-edit-string
            ("M-s e" . consult-isearch-history)      ;; orig. isearch-edit-string
            ("M-s l" . consult-line)                 ;; needed by consult-line to detect isearch
            ("M-s L" . consult-line-multi))          ;; needed by consult-line to detect isearch
           ;; Minibuffer history
           (minibuffer-local-map
            ("M-s" . consult-history)                ;; orig. next-matching-history-element
            ("M-r" . consult-history))))             ;; orig. previous-matching-history-element

  (leaf orderless
    :doc "Completion style for matching regexps in any order"
    :req "emacs-26.1"
    :tag "extensions" "emacs>=26.1"
    :url "https://github.com/oantolin/orderless"
    :added "2021-09-04"
    :emacs>= 26.1
    :setq ((completion-styles quote
                              (orderless)))
    :ensure t)

  (leaf vertico
    :doc "VERTical Interactive COmpletion"
    :req "emacs-27.1"
    :tag "emacs>=27.1"
    :url "https://github.com/minad/vertico"
    :added "2021-09-04"
    :emacs>= 27.1
    :ensure t
    :custom ((vertico-count . 20))
    :hook (after-init-hook . vertico-mode))
  (leaf marginalia
    :tag "minibuffer"
    :ensure t
    :hook
    (after-init-hook . marginalia-mode))
  )

;; Packages Settings
;; ----------------------------------------------------------------------------------------------

;; theme settings

;; (leaf metalheart-theme
;;   :ensure t
;;   :config
;;   (load-theme 'metalheart t))


(leaf zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

;; (leaf iceberg-theme
;;   :ensure t
;;   :config
;;   (iceberg-theme-create-theme-file)
;;   (load-theme 'solarized-zenburn t))

;; flycheck settings

(leaf flycheck
  :doc "On-the-fly syntax checking"
  :req "dash-2.12.1" "pkg-info-0.4" "let-alist-1.0.4" "seq-1.11" "emacs-24.3"
  :tag "minor-mode" "tools" "languages" "convenience" "emacs>=24.3"
  :url "http://www.flycheck.org"
  :emacs>= 24.3
  :ensure t
  :bind (("M-n" . flycheck-next-error)
         ("M-p" . flycheck-previous-error))
  :global-minor-mode global-flycheck-mode)

;; company settings

(leaf company
  :doc "Modular text completion framework"
  :req "emacs-24.3"
  :tag "matching" "convenience" "abbrev" "emacs>=24.3"
  :url "http://company-mode.github.io/"
  :emacs>= 24.3
  :ensure t
  :blackout t
  :leaf-defer nil
  :bind ((company-active-map
          ("M-n" . nil)
          ("M-p" . nil)
          ("C-s" . company-filter-candidates)
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)
          ("<tab>" . company-complete-selection))
         (company-search-map
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)))
  :custom ((company-idle-delay . 0)
           (company-minimum-prefix-length . 1)
           (company-show-numbers . t)
           (company-selection-wrap-around . t)
           (company-transformers . '(company-sort-by-occurrence)))
  :global-minor-mode global-company-mode)

;; neotree settings

(leaf neotree
  :ensure t
  :custom ((neo-theme . 'arrow)
           (neo-show-hidden-files . t))
  :bind (("<f8>" . neotree-toggle)
         ))

;; indent settings
;; 2023-10-28 エラー多発により一旦削除

;; icon settings

(leaf nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family . "HackGen Console NF")
  )

;; markdown settings

(leaf markdown
  :config
  (leaf markdown-mode
    :ensure t
    :mode ("\\.md\\'" . markdown-mode)
    :custom
    (markdown-command . "multimarkdown")
    (markdown-command-needs-filename . t))
  (leaf markdown-preview-mode
    :ensure t
    :config
    ;; (add-to-list 'markdown-preview-stylesheets "https://raw.githubusercontent.com/richleland/pygments-css/master/emacs.css")
    ;; (add-to-list 'markdown-preview-javascript "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML")
    ))

;; exec path from shell settings

(leaf exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))

;; term settings
;; ---------------------------------------------------------------------
(leaf multi-term
  :disabled (eq system-type 'windows-nt)
  :ensure t
  :custom `((multi-term-program . ,(getenv "SHELL")))
  :preface
  (defun namn/open-shell-sub (new)
   (split-window-below)
   (enlarge-window 5)
   (other-window 1)
   (let ((term) (res))
     (if (or new (null (setq term (dolist (buf (buffer-list) res)
                                    (if (string-match "*terminal<[0-9]+>*" (buffer-name buf))
                                        (setq res buf))))))
         (multi-term)
       (switch-to-buffer term))))
  (defun namn/open-shell ()
    (interactive)
    (namn/open-shell-sub t))
  (defun namn/to-shell ()
    (interactive)
    (namn/open-shell-sub nil))
  :bind (("C-^"   . namn/to-shell)
         ("C-M-^" . namn/open-shell)
         (:term-raw-map
          ("C-t" . other-window))))

;; Compile Settings

;; auto-async-byte-compile settings

(leaf auto-async-byte-compile
  :ensure t
  :custom
  (auto-async-byte-compile-exclude-files-regexp . "/junk/")
  :hook
  (emacs-lisp-mode-hook . enable-auto-async-byte-compile-mode))

;; ----------------------------------------------------------------------------------------------


;; keybind settings
;; ----------------------------------------------------------------------------------------------

(leaf-keys (;; edit settings
            ("C-h" . backward-delete-char)
            ))

;; ----------------------------------------------------------------------------------------------



;; langeage and font settings
;; ----------------------------------------------------------------------------------------------

(leaf *language-settings
  :config
  ;(set-language-environment 'Japanese) ;言語を日本語に
  (prefer-coding-system 'utf-8) ;極力UTF-8を使う
  ;;(font-family-list)
  (add-to-list 'default-frame-alist '(font . "HackGen Console NF-14"));フォント設定 "font-size"
  ;(add-to-list 'default-frame-alist '(font . "JetBrains Mono-14"))
  )


;; ----------------------------------------------------------------------------------------------


;; Line Setting
;; ----------------------------------------------------------------------------------------------

;; 行番号の設定
(leaf *line-settings
  :config
  (global-display-line-numbers-mode t))

;; EmacsJP settings end



(provide 'init)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; init.el ends here
