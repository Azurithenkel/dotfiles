;;; Wrapper to make .emacs self-compiling.
(defvar init-top-level t)
(if init-top-level
    (let ((init-top-level nil))
      (if (file-newer-than-file-p "~/.emacs" "~/.emacs.elc")
          (progn
            (load "~/.emacs")
            (byte-compile-file "~/.emacs")
            )
        (load "~/.emacs.elc")))
  (progn

;; ============================
;; Add the elisp path
;; ============================
;;(add-to-list 'load-path "~/elisp")
;;(add-to-list 'load-path "~/elisp/eshell")
;;(add-to-list 'load-path "~/elisp/pcomplete-1.1.7")
(add-to-list 'load-path "~/.emacs.d/include")
(add-to-list 'load-path "~/.emacs.d/themes")

;; ============================
;; Setup shell stuff
;; ============================
;; Commented out for now, not necessary?
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ============================
;; Setup syntax, background, and foreground coloring
;; ============================

;;(set-background-color "Black")
;;(set-foreground-color "White")
;;(set-cursor-color "LightSkyBlue")
;;(set-mouse-color "LightSkyBlue")

(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; ============================
;; Key mappings
;; ============================

;; use F1 key to go to a man page
(global-set-key [f1] 'man)
;; use F3 key to kill current buffer
(global-set-key [f3] 'kill-this-buffer)
;; use F5 to get help (apropos)
(global-set-key [f5] 'apropos)
;; use F9 to open files in hex mode
(global-set-key [f9] 'hexl-find-file)

;; goto line function C-c C-g
(global-set-key [ (control c) (control g) ] 'goto-line)

;; undo and redo functionality with special module
(require 'redo+)
(global-set-key (kbd "C-x C-r") 'redo)
(global-set-key [ (control x) (r)] 'redo)
(global-set-key [ (control x) (control u)] 'undo)

;; ============================
;; Mouse Settings
;; ============================

;; mouse button one drags the scroll bar
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag)

;; setup scroll mouse settings
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;; ============================
;; Display
;; ============================

;; disable startup message
(setq inhibit-startup-message t)

;; setup font
(set-frame-font
 "-Misc-Fixed-Medium-R-Normal--15-140-75-75-C-90-ISO8859-1")

;; display the current time
(display-time)

;; Show column number at bottom of screen
(column-number-mode 1)

;; alias y to yes and n to no
(defalias 'yes-or-no-p 'y-or-n-p)

;; highlight matches from searches
(setq isearch-highlight t)
(setq search-highlight t)
(setq-default transient-mark-mode t)

(when (fboundp 'blink-cursor-mode)
  (blink-cursor-mode -1))

;; ===========================
;; Behaviour
;; ===========================

;; linum mode
(require 'linum)
(global-linum-mode)

;; templates
(require 'template)
(template-initialize)

;; Pgup/dn will return exactly to the starting point.
(setq scroll-preserve-screen-position 1)

;; don't automatically add new lines when scrolling down at
;; the bottom of a buffer
(setq next-line-add-newlines nil)

;; scroll just one line when hitting the bottom of the window
(setq scroll-step 1)
(setq scroll-conservatively 1)

;; format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")

;; show a menu only when running within X (save real estate when
;; in console)
(menu-bar-mode (if window-system 1 -1))

;; turn off the toolbar
(if (>= emacs-major-version 21)
    (tool-bar-mode -1))

;; turn on word wrapping in text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; replace highlighted text with what I type rather than just
;; inserting at a point
(delete-selection-mode t)

;; resize the mini-buffer when necessary
(setq resize-minibuffer-mode t)

;; highlight during searching
(setq query-replace-highlight t)

;; highlight incremental search
(setq search-highlight t)

;; kill trailing white space on save
(require 'whitespace-nuke)
(autoload 'nuke-trailing-whitespace "whitespace-nuke" nil t)
(add-hook 'write-file-hooks 'nuke-trailing-whitespace)

;; add whitespace mode
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(add-hook 'font-lock-mode-hook
	  '(lambda ()
	     (unless (string-match "\\*.+\\*" (buffer-name))
	       (append font-lock-keywords
		       '(("\t+" (0 'my-tab-face t))
			 ("^.\\{81,\\}$" (0 'my-long-line-face t))
			 ("[ \t]+$"      (0 'my-trailing-space -face t))
			 )))))

;; ==========================
;; C/C++ indentation
;; ==========================
(defun my-c-mode-common-hook ()
  (turn-on-font-lock)
  ;;(setq tab-width 8)
  ;;(c-set-offset 'substatement-open 0)
  ;;(c-set-offset 'case-label '+)
  ;;(setq c-basic-offset 'tab-width)
  (c-set-style "linux")
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; ===========================
;; HTML/CSS stuff
;; ===========================
(setq html-mode-hook 'turn-off-auto-fill)
(autoload 'css-mode "css-mode")
(setq auto-mode-alist
     (cons '("\\.css\\'" . css-mode) auto-mode-alist))

;; take any buffer and turn it into an html file,
;; including syntax hightlighting
(require 'htmlize)

;; ============================
;; Set up which modes to use for which file extensions
;; ============================
(setq auto-mode-alist
      (append
       '(
         ("\\.h$"             . c++-mode)
         ("\\.dps$"           . pascal-mode)
         ("\\.py$"            . python-mode)
         ("\\.Xdefaults$"     . xrdb-mode)
         ("\\.Xenvironment$"  . xrdb-mode)
         ("\\.Xresources$"    . xrdb-mode)
         ("\\.tei$"           . xml-mode)
         ("\\.php$"           . php-mode)
         ) auto-mode-alist))


;; ===========================
;; Custom Functions
;; ===========================

;; insert functions
(global-unset-key "\C-t")
(global-set-key "\C-t\C-h" 'insert-function-header)

(defun insert-function-header () (interactive)
  (insert "  /**\n")
  (insert "   * \n")
  (insert "   * @param: \n")
 (insert "   * @return: \n")
  (insert "   */\n"))

(global-set-key "\C-t\C-g" 'insert-function-header)

(defun insert-file-header () (interactive)
  (insert "/*////////////////////////////////////*/\n")
  (insert "/**\n")
  (insert " * \n")
  (insert " * Author: Tomas Pilar\n")
  (insert " */\n")
  (insert "/*////////////////////////////////////*/\n"))

;; revert buffer stuff
(global-set-key "\C-cr" 'revert-buffer)
(global-auto-revert-mode)
(setq auto-revert-interval 1)

;; set up the compiling options
(setq compile-command "make"
      compilation-ask-about-save nil
      compilation-window-height 10)
(global-set-key [f7] 'compile)

;; use a single buffer for dired mode
(require 'dired-single)
(defun my-dired-init ()
  "Bunch of stuff to run for dired,
either immediately or when it'sloaded."
  ;; add other stuff here
  (define-key dired-mode-map [return] 'joc-dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'joc-dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (joc-dired-single-buffer "..")))))
;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))

;; use eshell
;;(load "eshell-auto")
;;(setq eshell-cmpl-cycle-completions -1)

(require 'setnu)

;; resize man page to take up whole screen
(setq Man-notify 'bully)

(put 'upcase-region 'disabled nil)

;; Customizing colors used in diff mode
(defun custom-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute
   'diff-added nil :foreground "green" :background "black")
  (set-face-attribute
   'diff-removed nil :foreground "red" :background "black")
  (set-face-attribute
   'diff-changed nil :foreground "purple" :background "black"))
(eval-after-load "diff-mode" '(custom-diff-colors))

(require 'ahg)

))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-interval 0.25)
 '(global-auto-revert-mode t))

(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(my-tab-face            ((((class color)) (:background "color-29"))) t)
'(my-trailing-space-face ((((class color)) (:background "color-89"))) t)
'(my-long-line-face ((((class color)) (:background "color-52"))) t)
 )
;; End .emacs here
