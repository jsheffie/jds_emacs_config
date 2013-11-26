;; .emacs
;; ============================
;; Setup shell stuff
;; ============================
;; ============================
;; Setup syntax, background, and foreground coloring
;; ============================
;; my dark color scheme
(set-background-color "Black")
(set-foreground-color "White")
(set-cursor-color "LightSkyBlue")
(set-mouse-color "LightSkyBlue")

(setq default-frame-alist
      '((cursor-type . box)
        (foreground-color . "White")
        (background-color . "Black")
        ))

(global-font-lock-mode t)
(show-paren-mode)
(setq font-lock-maximum-decoration t)
(which-function-mode)

;; Specify where backup files are stored
(setq backup-directory-alist
      `((".*" . ,"~/.backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.backups" t)))

;; prevent backup mode
;; (setq make-backup-files nil)

;; ============================
;; Display
;; ============================
;; disable startup message
(setq inhibit-startup-message t)

;; display the current time
(display-time)

;; Show column number at bottom of screen
(column-number-mode 1)

;; ===========================
;; Behaviour
;; ===========================
;; Pgup/dn will return exactly to the starting point.
(setq scroll-preserve-screen-position 1)

;; don't automatically add new lines when scrolling down at
;; the bottom of a buffer
(setq next-line-add-newlines nil)

;; scroll just one line when hitting the bottom of the window
(setq scroll-step 1)
(setq scroll-conservatively 1)

;; show a menu only when running within X (save real estate when in console)
(menu-bar-mode (if window-system 1 -1))

;; turn off the toolbar
(if (>= emacs-major-version 21)
    (tool-bar-mode -1))

;; replace highlighted text with what I type rather than just inserting at a point
(delete-selection-mode t)

;; resize the mini-buffer when necessary
(setq resize-minibuffer-mode t)

;; highlight during searching
(setq query-replace-highlight t)

;; highlight incremental search
(setq search-highlight t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%f"))
;;      (concat  "%b - emacs@" system-name))

;; the line that contains the cursor will be highlighted
(global-hl-line-mode 0)

;; indent size
;;(setq standard-indent 3)

;; turn off tab character
(setq-default indent-tabs-mode nil)

(setq mouse-wheel-scroll-amount '(5 ((shift) . 5) ((control) . nil))) 

(setq tramp-default-method "ssh")


;; Redefine some keys.
;(setq kill-whole-line t)                                ; Kill EOL too
(global-set-key [kp-home] 'beginning-of-line)
(global-set-key [kp-end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key [C-end] 'end-of-buffer)
(global-set-key [S-delete] 'clipboard-kill-region)
(global-set-key [S-insert] 'clipboard-yank)
(global-set-key [C-insert] 'clipboard-kill-ring-save)
(global-set-key [S-right] 'set-mark-command)
; (global-set-key [f1]      'goto-line)           ; goto line
; (global-set-key [f2]      'ff-find-related-file); follow the c include file
(global-set-key [delete]  'delete-char)         ; delete character under cursor
; (global-set-key [f4]      'indent-three-spaces) ; indent 3 spaces
; (global-set-key [f8]      'kill-current-line)   ; delete current line
; (global-set-key [f7]      'kill-current-or-next-word)   ; delete current word
(global-set-key [?\C-z] 'undo); added here because I usually do kills by mistake
(global-set-key "\C-x\C-j" 'goto-line) ; Command prompts for linenumber to go to.
(global-set-key "\C-x\C-g" 'goto-line) ; Command prompts for linenumber to go to.
;; goto line function C-c C-g
(global-set-key [ (control c) (control g) ] 'goto-line)

;; ====================================================
;; Language Specific Stuff
;; ====================================================

;; ==========================
;; c Programming
;; ==========================
(defun my-c-mode-common-hook ()
  (turn-on-font-lock)
  (c-toggle-auto-hungry-state)
  (c-set-style "ellemtel")
  (setq c-basic-offset 3)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-cont-nonempty c-lineup-arglist))


(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; indent the entire buffer
(defun c-indent-buffer ()
  "Indent entire buffer of C source code."
  (interactive)
  (while 1
      (c-indent-command)
      (end-of-line)
      (forward-char 1)))

(define-key global-map "\C-ci" 'c-indent-buffer)

;; ==========================
;; cscope related stuff
;; ==========================
(require 'xcscope)

(define-key global-map [f1]  'cscope-set-initial-directory)
(define-key global-map [f2]  'cscope-unset-initial-directory)
(define-key global-map [f3]  'cscope-find-global-definition)
(define-key global-map [f4]  'cscope-find-this-symbol)
(define-key global-map [f5]  'cscope-find-egrep-pattern)

(define-key global-map [f6]  'cscope-find-functions-calling-this-function)
(define-key global-map [f7]  'cscope-find-called-functions)
(define-key global-map [f8]  'cscope-find-files-including-file)
(define-key global-map [f9]  'cscope-find-this-file)              
(define-key global-map [f12]  'cscope-pop-mark)

(define-key global-map [f10]  'cscope-next-symbol)
(define-key global-map [f11] 'cscope-prev-symbol)
(define-key global-map [M-right]  'cscope-next-symbol)
(define-key global-map [M-left] 'cscope-pop-mark)

;(define-key global-map [f11] 'cscope-next-file)
;(define-key global-map [f12] 'cscope-prev-file)

(define-key global-map [(meta f9)]  'cscope-display-buffer)
(define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)


;; ==========================
;; python mode
;; ==========================
(load "~/emacs/plugins/python-mode.el/python-mode.el")
(setq auto-mode-alist
      (cons '("\\.\\(py\\)\\'" . python-mode)
            auto-mode-alist))

;; ==========================
;; Javascript stuff mode
;; ==========================
;; javascript indentation to 2 spaces
(setq js-indent-level 2)

;; setup for coffee script ( http://elpa.gnu.org/packages/coffee-mode-0.4.1.el ) 
(load "~/emacs/plugins/coffee-mode.el")
(setq auto-mode-alist
      (cons '("\\.\\(coffee\\)\\'" . coffee-mode)
            auto-mode-alist))
(setq coffee-tab-width 2)

;; ==========================
;; snippeting
;; ==========================
(add-to-list 'load-path "~/emacs/plugins/yasnippet")
;; Load the library
(require 'yasnippet)
(yas-global-mode 1)
;(yas/initialize)
;; Load the snippet files themselves
;(yas/load-directory "~/emacs/yasnippet/snippets/text-mode")
;; Let's have the snippets in the auto-complete dropdown
;(add-to-list 'ac-sources 'ac-source-yasnippet)

;; ==========================
;; Javascript Syntex Checking
;; ==========================
(add-to-list 'load-path "~/emacs/plugins/lintnode")
(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
(setq lintnode-location "~/emacs/plugins/lintnode")
;; JSLint can be... opinionated
;(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
(setq lintnode-jslint-excludes (list 'nomen 'sloppy 'plusplus 'onevar 'indent 'white))
;; Start the server when we first open a js file and start checking
;(add-hook 'js-mode-hook
;          (lambda ()
;            (lintnode-hook)))
(add-hook 'javascript-mode-hook
          (lambda ()
            (lintnode-hook)))

;;; Nice Flymake minibuffer messages
(require 'flymake-cursor)
(custom-set-variables
     '(help-at-pt-timer-delay 0.9)
     '(help-at-pt-display-when-idle '(flymake-overlay)))
;; ==========================
;; language autocompleteion
;; ==========================
(add-to-list 'load-path "~/emacs/plugins/auto-complete")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/emacs/plugins/auto-complete/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; ==========================
;; language autocompleteion
;; ==========================
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))


;; ==========================
;; My Notes:
;; ==========================
;; untabify changes all tabs in the region to appropriate numbers of spaces. 
;; M-x untabify
;;
;; clrt-x h     (highlit buffer)
;;              this is a tricky one, press ctrl x then releas and press h, 
;;              otherwise you get help.
;; cltrl-alt \  (auto indent based on c mode)
;; ctrl-c g     goto line

; This is for the c header file includes.
; M-x ff-find-related-file

