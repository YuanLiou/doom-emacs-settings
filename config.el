;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "IntoneMono Nerd Font" :size 15 :weight 'regular))
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; custom keybinding
(global-set-key (kbd "C-h D") 'devdocs-lookup)
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)

(setq-default tab-width 4)

;; force java to use tab width 4
(defun my-java-mode-setup ()
  "force c-basic-offset to be 4"
  (setq c-basic-offset 4))
(add-hook 'java-mode-hook 'my-java-mode-setup)

;; force module with native compile
(setq package-native-compile t)

;; Horizontal Scrolling
'(mouse-wheel-flip-direction t) ;; correct left-right scroll direction for OS X
'(mouse-wheel-tilt-scroll t)    ;; enable left-right scroll from trackpad

(global-set-key [wheel-right] 'scroll-left)
(global-set-key [wheel-left] 'scroll-right)

;; Markdown preview mode
(setq markdown-split-window-direction 'right)

;; Show max vertical indicator
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(setopt display-fill-column-indicator-column 120)

;; EShell Fonts
(defun my-buffer-face-mode-courrier ()
    (interactive)
    (setq buffer-face-mode-face '(:family "IntoneMono Nerd Font"))
    (buffer-face-mode))

(add-hook 'eshell-mode-hook 'my-buffer-face-mode-courrier)

;; eradio
(use-package eradio
  :init
  (setq eradio-player '("/Applications/VLC.app/Contents/MacOS/VLC" "--no-video" "-I" "rc"))
  :config
  (setq eradio-channels '(("中廣" . "https://stream.rcs.revma.com/ndk05tyy2tzuv")
        ("飛碟" . "https://n15a-eu.rcs.revma.com/em90w4aeewzuv")
        ("中廣流行" . "https://stream.rcs.revma.com/s1zttsg3qtzuv")
        ("中廣新聞" . "https://stream.rcs.revma.com/78fm9wyy2tzuv")
        ("飛揚調頻" . "https://n07.rcs.revma.com/e0tdah74hv8uv")
        ("台北都會音樂台" . "https://onair.bravo913.com.tw:9130/live.mp3")
        ("竹科廣播" . "https://n38a-eu.rcs.revma.com/7mnq8rt7k5zuv")
        ("教育廣播電台" . "https://cast.ner.gov.tw/1"))))

;; keybinding
(map! :leader
      :desc "Change to wdired mode"
      "d w" #'wdired-change-to-wdired-mode)

(map! :leader
      :desc "Writable dired finished"
      "d f" #'wdired-finish-edit)

(map! :leader
      :desc "Writable abort changes"
      "d f" #'wdired-abort-changes)
