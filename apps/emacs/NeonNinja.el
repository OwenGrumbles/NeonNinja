; DATE 10.03.2025

;;; Code:
(deftheme NeonNinja)


;;;; Configuration options:

(defgroup NeonNinja nil
  "NeonNinja theme options.

The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom NeonNinja-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'NeonNinja)

(defcustom NeonNinja-height-title-1 1.3
  "Font size 130%."
  :type 'number
  :group 'NeonNinja)

(defcustom NeonNinja-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'NeonNinja)

(defcustom NeonNinja-height-title-3 1.0
  "Font size 100%."
  :type 'number
  :group 'NeonNinja)

(defcustom NeonNinja-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'NeonNinja)

(defcustom NeonNinja-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'NeonNinja)

(defvar NeonNinja-use-24-bit-colors-on-256-colors-terms nil
  "Use true colors even on terminals announcing less capabilities.

Beware the use of this variable.  Using it may lead to unwanted
behavior, the most common one being an ugly blue background on
terminals, which don't understand 24 bit colors.  To avoid this
blue background, when using this variable, one can try to add the
following lines in their config file after having load the
NeonNinja theme:

    (unless (display-graphic-p)
      (set-face-background \\='default \"black\" nil))

There is a lot of discussion behind the 256 colors theme (see URL
`https://github.com/NeonNinja/emacs/pull/57').  Please take time to
read it before opening a new issue about your will.")


;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [256-COLOR [TTY-COLOR]]
(let ((colors '(;; Upstream theme color
                (NeonNinja-bg      "#370000" "unspecified-bg" "unspecified-bg") ; official background
                (NeonNinja-fg      "#F3FFFC" "#ffffff" "brightwhite") ; official foreground
                (NeonNinja-current "#10C4BB" "#303030" "brightblack") ; official current-line/selection
                (NeonNinja-region  "#454759" "#303030" "brightblack") ; NeonNinja-current with fake 75% alpha
                (NeonNinja-comment "#09000D" "#5f5faf" "blue")        ; official comment
                (NeonNinja-cyan    "#00FFFF" "#87d7ff" "brightcyan")  ; official cyan
                (NeonNinja-green   "#37CC00" "#5fff87" "green")       ; official green
                (NeonNinja-orange  "#F7E300" "#ffaf5f" "brightred")   ; official orange
                (NeonNinja-pink    "#FF00FF" "#ff87d7" "magenta")     ; official pink
                (NeonNinja-purple  "#FF1073" "#af87ff" "brightmagenta") ; official purple
                (NeonNinja-red     "#F70000" "#ff8787" "red")         ; official red
                (NeonNinja-yellow  "#FFFF0D" "#ffff87" "yellow")      ; official yellow
                ;; Other colors
                (bg2             "#373844" "#121212" "brightblack")
                (bg3             "#565761" "#444444" "brightblack")
                (fg2             "#e2e2dc" "#e4e4e4" "brightwhite")
                (fg3             "#ccccc7" "#c6c6c6" "white")
                (fg4             "#b6b6b2" "#b2b2b2" "white")
                (dark-red        "#880000" "#870000" "red") ; 40% darker
                (dark-green      "#037a22" "#00af00" "green") ; 40% darker
                (dark-blue       "#0189cc" "#0087ff" "brightblue")))
      (faces '(;; default / basic faces
               (cursor :background ,fg3)
               (default :background ,NeonNinja-bg :foreground ,NeonNinja-fg)
               (default-italic :slant italic)
               (error :foreground ,NeonNinja-red)
               (ffap :foreground ,fg4)
               (fringe :background ,NeonNinja-bg :foreground ,fg4)
               (header-line :inherit 'mode-line)
               (highlight :foreground ,fg3 :background ,NeonNinja-current)
               (hl-line :background ,bg2 :extend t)
               (info-quoted-name :foreground ,NeonNinja-orange)
               (info-string :foreground ,NeonNinja-yellow)
               (lazy-highlight :foreground ,fg2 :background ,bg2)
               (link :foreground ,NeonNinja-cyan :underline t)
               (linum :slant italic :foreground ,bg3 :background ,NeonNinja-bg)
               (line-number :slant italic :foreground ,bg3 :background ,NeonNinja-bg)
               (match :background ,NeonNinja-yellow :foreground ,NeonNinja-bg)
               (menu :background ,NeonNinja-current :inverse-video nil
                     ,@(if NeonNinja-alternate-mode-line-and-minibuffer
                           (list :foreground fg3)
                         (list :foreground NeonNinja-fg)))
               (minibuffer-prompt
                ,@(if NeonNinja-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground NeonNinja-fg)
                    (list :weight 'bold :foreground NeonNinja-pink)))
               (mode-line :background ,NeonNinja-current
                          :box ,NeonNinja-current :inverse-video nil
                          ,@(if NeonNinja-alternate-mode-line-and-minibuffer
                                (list :foreground fg3)
                              (list :foreground NeonNinja-fg)))
               (mode-line-inactive
                :background ,NeonNinja-bg :inverse-video nil
                ,@(if NeonNinja-alternate-mode-line-and-minibuffer
                      (list :foreground NeonNinja-comment :box NeonNinja-bg)
                    (list :foreground fg4 :box bg2)))
               (read-multiple-choice-face :inherit completions-first-difference)
               (region :background ,NeonNinja-region :extend nil)
               (shadow :foreground ,NeonNinja-comment)
               (success :foreground ,NeonNinja-green)
               (tooltip :foreground ,NeonNinja-fg :background ,NeonNinja-current)
               (trailing-whitespace :background ,NeonNinja-orange)
               (vertical-border :foreground ,bg2)
               (warning :foreground ,NeonNinja-orange)
               ;; syntax / font-lock
               (font-lock-builtin-face :foreground ,NeonNinja-cyan :slant italic)
               (font-lock-comment-face :inherit shadow)
               (font-lock-comment-delimiter-face :inherit shadow)
               (font-lock-constant-face :foreground ,NeonNinja-purple)
               (font-lock-doc-face :foreground ,NeonNinja-comment)
               (font-lock-function-name-face :foreground ,NeonNinja-green :weight bold)
               (font-lock-keyword-face :foreground ,NeonNinja-pink :weight bold)
               (font-lock-negation-char-face :foreground ,NeonNinja-cyan)
               (font-lock-number-face :foreground ,NeonNinja-purple)
               (font-lock-operator-face :foreground ,NeonNinja-pink)
               (font-lock-preprocessor-face :foreground ,NeonNinja-orange)
               (font-lock-reference-face :inherit font-lock-constant-face) ;; obsolete
               (font-lock-regexp-grouping-backslash :foreground ,NeonNinja-cyan)
               (font-lock-regexp-grouping-construct :foreground ,NeonNinja-purple)
               (font-lock-string-face :foreground ,NeonNinja-yellow)
               (font-lock-type-face :inherit font-lock-builtin-face)
               (font-lock-variable-name-face :foreground ,NeonNinja-fg :weight bold)
               (font-lock-warning-face :inherit warning :background ,bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,NeonNinja-pink)
               ;; ansi-color
               (ansi-color-black :foreground ,NeonNinja-bg :background ,NeonNinja-bg)
               (ansi-color-bright-black :foreground "black" :background "black")
               (ansi-color-blue :foreground ,NeonNinja-purple :background ,NeonNinja-purple)
               (ansi-color-bright-blue :foreground ,NeonNinja-purple
                                       :background ,NeonNinja-purple
                                       :weight bold)
               (ansi-color-cyan :foreground ,NeonNinja-cyan :background ,NeonNinja-cyan)
               (ansi-color-bright-cyan :foreground ,NeonNinja-cyan
                                       :background ,NeonNinja-cyan
                                       :weight bold)
               (ansi-color-green :foreground ,NeonNinja-green :background ,NeonNinja-green)
               (ansi-color-bright-green :foreground ,NeonNinja-green
                                        :background ,NeonNinja-green
                                        :weight bold)
               (ansi-color-magenta :foreground ,NeonNinja-pink :background ,NeonNinja-pink)
               (ansi-color-bright-magenta :foreground ,NeonNinja-pink
                                          :background ,NeonNinja-pink
                                          :weight bold)
               (ansi-color-red :foreground ,NeonNinja-red :background ,NeonNinja-red)
               (ansi-color-bright-red :foreground ,NeonNinja-red
                                      :background ,NeonNinja-red
                                      :weight bold)
               (ansi-color-white :foreground ,NeonNinja-fg :background ,NeonNinja-fg)
               (ansi-color-bright-white :foreground "white" :background "white")
               (ansi-color-yellow :foreground ,NeonNinja-yellow :background ,NeonNinja-yellow)
               (ansi-color-bright-yellow :foreground ,NeonNinja-yellow
                                         :background ,NeonNinja-yellow
                                         :weight bold)
               ;; bookmarks
               (bookmark-face :foreground ,NeonNinja-pink)
               ;; company
               (company-echo-common :foreground ,NeonNinja-bg :background ,NeonNinja-fg)
               (company-preview :background ,NeonNinja-current :foreground ,dark-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,NeonNinja-pink)
               (company-preview-search :inherit company-preview
                                       :foreground ,NeonNinja-green)
               (company-scrollbar-bg :background ,NeonNinja-comment)
               (company-scrollbar-fg :foreground ,dark-blue)
               (company-tooltip :inherit tooltip)
               (company-tooltip-search :foreground ,NeonNinja-green
                                       :underline t)
               (company-tooltip-search-selection :background ,NeonNinja-green
                                                 :foreground ,NeonNinja-bg)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,NeonNinja-bg)
               (company-tooltip-common :foreground ,NeonNinja-pink :weight bold)
               ;;(company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,NeonNinja-cyan)
               ;;(company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               ;; completions (minibuffer.el)
               (completions-annotations :inherit font-lock-comment-face)
               (completions-common-part :foreground ,NeonNinja-green)
               (completions-first-difference :foreground ,NeonNinja-pink :weight bold)
               ;; diff
               (diff-added :background ,dark-green :foreground ,NeonNinja-fg :extend t)
               (diff-removed :background ,dark-red :foreground ,NeonNinja-fg :extend t)
               (diff-refine-added :background ,NeonNinja-green
                                  :foreground ,NeonNinja-bg)
               (diff-refine-removed :background ,NeonNinja-red
                                    :foreground ,NeonNinja-fg)
               (diff-indicator-added :foreground ,NeonNinja-green)
               (diff-indicator-removed :foreground ,NeonNinja-red)
               (diff-indicator-changed :foreground ,NeonNinja-orange)
               (diff-error :foreground ,NeonNinja-red, :background ,NeonNinja-bg
                           :weight bold)
               ;; diff-hl
               (diff-hl-change :foreground ,NeonNinja-orange :background ,NeonNinja-orange)
               (diff-hl-delete :foreground ,NeonNinja-red :background ,NeonNinja-red)
               (diff-hl-insert :foreground ,NeonNinja-green :background ,NeonNinja-green)
               ;; dired
               (dired-directory :foreground ,NeonNinja-green :weight normal)
               (dired-flagged :foreground ,NeonNinja-pink)
               (dired-header :foreground ,fg3 :background ,NeonNinja-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,NeonNinja-fg :weight bold)
               (dired-marked :foreground ,NeonNinja-orange :weight bold)
               (dired-perm-write :foreground ,fg3 :underline t)
               (dired-symlink :foreground ,NeonNinja-yellow :weight normal :slant italic)
               (dired-warning :foreground ,NeonNinja-orange :underline t)
               (diredp-compressed-file-name :foreground ,fg3)
               (diredp-compressed-file-suffix :foreground ,fg4)
               (diredp-date-time :foreground ,NeonNinja-fg)
               (diredp-deletion-file-name :foreground ,NeonNinja-pink :background ,NeonNinja-current)
               (diredp-deletion :foreground ,NeonNinja-pink :weight bold)
               (diredp-dir-heading :foreground ,fg2 :background ,bg3)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,NeonNinja-orange)
               (diredp-file-name :foreground ,NeonNinja-fg)
               (diredp-file-suffix :foreground ,fg4)
               (diredp-flag-mark-line :foreground ,fg2 :slant italic :background ,NeonNinja-current)
               (diredp-flag-mark :foreground ,fg2 :weight bold :background ,NeonNinja-current)
               (diredp-ignored-file-name :foreground ,NeonNinja-fg)
               (diredp-mode-line-flagged :foreground ,NeonNinja-orange)
               (diredp-mode-line-marked :foreground ,NeonNinja-orange)
               (diredp-no-priv :foreground ,NeonNinja-fg)
               (diredp-number :foreground ,NeonNinja-cyan)
               (diredp-other-priv :foreground ,NeonNinja-orange)
               (diredp-rare-priv :foreground ,NeonNinja-orange)
               (diredp-read-priv :foreground ,NeonNinja-purple)
               (diredp-write-priv :foreground ,NeonNinja-pink)
               (diredp-exec-priv :foreground ,NeonNinja-yellow)
               (diredp-symlink :foreground ,NeonNinja-orange)
               (diredp-link-priv :foreground ,NeonNinja-orange)
               (diredp-autofile-name :foreground ,NeonNinja-yellow)
               (diredp-tagged-autofile-name :foreground ,NeonNinja-yellow)
               ;; ediff
               (ediff-current-diff-A :background ,dark-red)
               (ediff-fine-diff-A :background ,NeonNinja-red :foreground ,NeonNinja-fg)
               (ediff-current-diff-B :background ,dark-green)
               (ediff-fine-diff-B :background ,NeonNinja-green :foreground ,NeonNinja-bg)
               (ediff-current-diff-C :background ,dark-blue)
               (ediff-fine-diff-C :background ,NeonNinja-cyan :foreground ,NeonNinja-bg)
               ;; eglot
               (eglot-diagnostic-tag-unnecessary-face :inherit warning)
               (eglot-diagnostic-tag-deprecated-face :inherit warning :strike-through t)
               ;; eldoc-box
               (eldoc-box-border :background ,NeonNinja-current)
               (eldoc-box-body :background ,NeonNinja-current)
               ;; elfeed
               (elfeed-search-date-face :foreground ,NeonNinja-comment)
               (elfeed-search-title-face :foreground ,NeonNinja-fg)
               (elfeed-search-unread-title-face :foreground ,NeonNinja-pink :weight bold)
               (elfeed-search-feed-face :foreground ,NeonNinja-fg :weight bold)
               (elfeed-search-tag-face :foreground ,NeonNinja-green)
               (elfeed-search-last-update-face :weight bold)
               (elfeed-search-unread-count-face :foreground ,NeonNinja-pink)
               (elfeed-search-filter-face :foreground ,NeonNinja-green :weight bold)
               ;;(elfeed-log-date-face :inherit font-lock-type-face)
               (elfeed-log-error-level-face :foreground ,NeonNinja-red)
               (elfeed-log-warn-level-face :foreground ,NeonNinja-orange)
               (elfeed-log-info-level-face :foreground ,NeonNinja-cyan)
               (elfeed-log-debug-level-face :foreground ,NeonNinja-comment)
               ;; elpher
               (elpher-gemini-heading1 :inherit bold :foreground ,NeonNinja-pink
                                       ,@(when NeonNinja-enlarge-headings
                                           (list :height NeonNinja-height-title-1)))
               (elpher-gemini-heading2 :inherit bold :foreground ,NeonNinja-purple
                                       ,@(when NeonNinja-enlarge-headings
                                           (list :height NeonNinja-height-title-2)))
               (elpher-gemini-heading3 :weight normal :foreground ,NeonNinja-green
                                       ,@(when NeonNinja-enlarge-headings
                                           (list :height NeonNinja-height-title-3)))
               (elpher-gemini-preformatted :inherit fixed-pitch
                                           :foreground ,NeonNinja-orange)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,NeonNinja-yellow)
               (enh-ruby-op-face :foreground ,NeonNinja-pink)
               (enh-ruby-regexp-delimiter-face :foreground ,NeonNinja-yellow)
               (enh-ruby-string-delimiter-face :foreground ,NeonNinja-yellow)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,NeonNinja-orange))
               (flyspell-incorrect :underline (:style wave :color ,NeonNinja-red))
               ;; font-latex (auctex)
               (font-latex-bold-face :foreground ,NeonNinja-purple)
               (font-latex-italic-face :foreground ,NeonNinja-pink :slant italic)
               (font-latex-match-reference-keywords :foreground ,NeonNinja-cyan)
               (font-latex-match-variable-keywords :foreground ,NeonNinja-fg)
               (font-latex-math-face :foreground ,NeonNinja-orange)
               (font-latex-script-char-face :inherit font-latex-math-face)
               (font-latex-sectioning-0-face :foreground ,NeonNinja-pink :weight bold
                                             ,@(when NeonNinja-enlarge-headings
                                                 (list :height NeonNinja-height-title-1)))
               (font-latex-sectioning-1-face :foreground ,NeonNinja-purple :weight bold
                                             ,@(when NeonNinja-enlarge-headings
                                                 (list :height NeonNinja-height-title-1)))
               (font-latex-sectioning-2-face :foreground ,NeonNinja-green :weight bold
                                             ,@(when NeonNinja-enlarge-headings
                                                 (list :height NeonNinja-height-title-2)))
               (font-latex-sectioning-3-face :foreground ,NeonNinja-yellow :weight bold
                                             ,@(when NeonNinja-enlarge-headings
                                                 (list :height NeonNinja-height-title-3)))
               (font-latex-sectioning-4-face :foreground ,NeonNinja-cyan :weight bold)
               (font-latex-sectioning-5-face :foreground ,NeonNinja-orange :weight bold)
               (font-latex-sedate-face :foreground ,NeonNinja-pink)
               (font-latex-string-face :foreground ,NeonNinja-yellow)
               (font-latex-verbatim-face :foreground ,NeonNinja-orange)
               (font-latex-warning-face :foreground ,NeonNinja-red)
               ;; gemini
               (gemini-heading-face-1 :inherit bold :foreground ,NeonNinja-pink
                                      ,@(when NeonNinja-enlarge-headings
                                          (list :height NeonNinja-height-title-1)))
               (gemini-heading-face-2 :inherit bold :foreground ,NeonNinja-purple
                                      ,@(when NeonNinja-enlarge-headings
                                          (list :height NeonNinja-height-title-2)))
               (gemini-heading-face-3 :weight normal :foreground ,NeonNinja-green
                                      ,@(when NeonNinja-enlarge-headings
                                          (list :height NeonNinja-height-title-3)))
               (gemini-heading-face-rest :weight normal :foreground ,NeonNinja-yellow)
               (gemini-quote-face :foreground ,NeonNinja-purple)
               ;; go-test
               (go-test--ok-face :inherit success)
               (go-test--error-face :inherit error)
               (go-test--warning-face :inherit warning)
               (go-test--pointer-face :foreground ,NeonNinja-pink)
               (go-test--standard-face :foreground ,NeonNinja-cyan)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,NeonNinja-pink :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,NeonNinja-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,NeonNinja-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,NeonNinja-current :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,NeonNinja-pink :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,NeonNinja-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,NeonNinja-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,NeonNinja-current :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,NeonNinja-purple)
               (gnus-header-from :foreground ,NeonNinja-fg)
               (gnus-header-name :foreground ,NeonNinja-green)
               (gnus-header-subject :foreground ,NeonNinja-pink :weight bold)
               (gnus-summary-markup-face :foreground ,NeonNinja-cyan)
               (gnus-summary-high-unread :foreground ,NeonNinja-pink :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,dark-blue :weight bold)
               (gnus-summary-normal-read :foreground ,NeonNinja-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,NeonNinja-pink :weight bold)
               (gnus-summary-low-unread :foreground ,NeonNinja-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,NeonNinja-pink)
               (haskell-constructor-face :foreground ,NeonNinja-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,NeonNinja-purple)
               (helm-buffer-not-saved :foreground ,NeonNinja-purple :background ,NeonNinja-bg)
               (helm-buffer-process :foreground ,NeonNinja-orange :background ,NeonNinja-bg)
               (helm-buffer-saved-out :foreground ,NeonNinja-fg :background ,NeonNinja-bg)
               (helm-buffer-size :foreground ,NeonNinja-fg :background ,NeonNinja-bg)
               (helm-candidate-number :foreground ,NeonNinja-bg :background ,NeonNinja-fg)
               (helm-ff-directory :foreground ,NeonNinja-green :background ,NeonNinja-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,NeonNinja-green :background ,NeonNinja-bg :weight normal)
               (helm-ff-executable :foreground ,dark-blue :background ,NeonNinja-bg :weight normal)
               (helm-ff-file :foreground ,NeonNinja-fg :background ,NeonNinja-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,NeonNinja-pink :background ,NeonNinja-bg :weight bold)
               (helm-ff-prefix :foreground ,NeonNinja-bg :background ,NeonNinja-pink :weight normal)
               (helm-ff-symlink :foreground ,NeonNinja-pink :background ,NeonNinja-bg :weight bold)
               (helm-grep-cmd-line :foreground ,NeonNinja-fg :background ,NeonNinja-bg)
               (helm-grep-file :foreground ,NeonNinja-fg :background ,NeonNinja-bg)
               (helm-grep-finish :foreground ,fg2 :background ,NeonNinja-bg)
               (helm-grep-lineno :foreground ,NeonNinja-fg :background ,NeonNinja-bg)
               (helm-grep-match :inherit match)
               (helm-grep-running :foreground ,NeonNinja-green :background ,NeonNinja-bg)
               (helm-header :foreground ,fg2 :background ,NeonNinja-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,NeonNinja-green :background ,NeonNinja-bg)
               (helm-selection :background ,bg2 :underline nil)
               (helm-selection-line :background ,bg2)
               (helm-separator :foreground ,NeonNinja-purple :background ,NeonNinja-bg)
               (helm-source-go-package-godoc-description :foreground ,NeonNinja-yellow)
               (helm-source-header :foreground ,NeonNinja-pink :background ,NeonNinja-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,NeonNinja-orange :background ,NeonNinja-bg)
               (helm-time-zone-home :foreground ,NeonNinja-purple :background ,NeonNinja-bg)
               (helm-visible-mark :foreground ,NeonNinja-bg :background ,NeonNinja-current)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,NeonNinja-fg)
               (icicle-special-candidate :foreground ,fg2)
               (icicle-extra-candidate :foreground ,fg2)
               (icicle-search-main-regexp-others :foreground ,NeonNinja-fg)
               (icicle-search-current-input :foreground ,NeonNinja-pink)
               (icicle-search-context-level-8 :foreground ,NeonNinja-orange)
               (icicle-search-context-level-7 :foreground ,NeonNinja-orange)
               (icicle-search-context-level-6 :foreground ,NeonNinja-orange)
               (icicle-search-context-level-5 :foreground ,NeonNinja-orange)
               (icicle-search-context-level-4 :foreground ,NeonNinja-orange)
               (icicle-search-context-level-3 :foreground ,NeonNinja-orange)
               (icicle-search-context-level-2 :foreground ,NeonNinja-orange)
               (icicle-search-context-level-1 :foreground ,NeonNinja-orange)
               (icicle-search-main-regexp-current :foreground ,NeonNinja-fg)
               (icicle-saved-candidate :foreground ,NeonNinja-fg)
               (icicle-proxy-candidate :foreground ,NeonNinja-fg)
               (icicle-mustmatch-completion :foreground ,NeonNinja-purple)
               (icicle-multi-command-completion :foreground ,fg2 :background ,bg2)
               (icicle-msg-emphasis :foreground ,NeonNinja-green)
               (icicle-mode-line-help :foreground ,fg4)
               (icicle-match-highlight-minibuffer :foreground ,NeonNinja-orange)
               (icicle-match-highlight-Completions :foreground ,NeonNinja-green)
               (icicle-key-complete-menu-local :foreground ,NeonNinja-fg)
               (icicle-key-complete-menu :foreground ,NeonNinja-fg)
               (icicle-input-completion-fail-lax :foreground ,NeonNinja-pink)
               (icicle-input-completion-fail :foreground ,NeonNinja-pink)
               (icicle-historical-candidate-other :foreground ,NeonNinja-fg)
               (icicle-historical-candidate :foreground ,NeonNinja-fg)
               (icicle-current-candidate-highlight :foreground ,NeonNinja-orange :background ,NeonNinja-current)
               (icicle-Completions-instruction-2 :foreground ,fg4)
               (icicle-Completions-instruction-1 :foreground ,fg4)
               (icicle-completion :foreground ,NeonNinja-fg)
               (icicle-complete-input :foreground ,NeonNinja-orange)
               (icicle-common-match-highlight-Completions :foreground ,NeonNinja-purple)
               (icicle-candidate-part :foreground ,NeonNinja-fg)
               (icicle-annotation :foreground ,fg4)
               ;; icomplete
               (icompletep-determined :foreground ,NeonNinja-orange)
               ;; ido
               (ido-first-match
                ,@(if NeonNinja-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground NeonNinja-green)
                    (list :weight 'bold :foreground NeonNinja-pink)))
               (ido-only-match :foreground ,NeonNinja-orange)
               (ido-subdir :foreground ,NeonNinja-yellow)
               (ido-virtual :foreground ,NeonNinja-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,NeonNinja-fg :background ,NeonNinja-pink)
               ;; imenu-list
               (imenu-list-entry-face-0 :foreground ,NeonNinja-pink)
               (imenu-list-entry-face-1 :foreground ,NeonNinja-purple)
               (imenu-list-entry-face-2 :foreground ,NeonNinja-green)
               (imenu-list-entry-face-3 :foreground ,NeonNinja-yellow)
               (imenu-list-entry-subalist-face-0 :inherit imenu-list-entry-face-0
                                                 :weight bold :underline t
                                                 ,@(when NeonNinja-enlarge-headings
                                                     (list :height NeonNinja-height-title-1)))
               (imenu-list-entry-subalist-face-1 :inherit imenu-list-entry-face-1
                                                 :weight bold :underline t
                                                 ,@(when NeonNinja-enlarge-headings
                                                     (list :height NeonNinja-height-title-2)))
               (imenu-list-entry-subalist-face-2 :inherit imenu-list-entry-face-2
                                                 :weight bold :underline t
                                                 ,@(when NeonNinja-enlarge-headings
                                                     (list :height NeonNinja-height-title-3)))
               (imenu-list-entry-subalist-face-3 :inherit imenu-list-entry-face-3
                                                 :weight bold :underline t)
               ;; ivy
               (ivy-current-match
                ,@(if NeonNinja-alternate-mode-line-and-minibuffer
                      (list :background NeonNinja-current
                            :foreground NeonNinja-green
                            :weight 'normal)
                    (list :background NeonNinja-current
                          :foreground NeonNinja-pink
                          :weight 'bold)))
               ;; Highlights the background of the match.
               (ivy-minibuffer-match-face-1 :background ,NeonNinja-current)
               ;; Highlights the first matched group.
               (ivy-minibuffer-match-face-2 :background ,NeonNinja-green
                                            :foreground ,NeonNinja-bg)
               ;; Highlights the second matched group.
               (ivy-minibuffer-match-face-3 :background ,NeonNinja-yellow
                                            :foreground ,NeonNinja-bg)
               ;; Highlights the third matched group.
               (ivy-minibuffer-match-face-4 :background ,NeonNinja-pink
                                            :foreground ,NeonNinja-bg)
               (ivy-confirm-face :foreground ,NeonNinja-orange)
               (ivy-match-required-face :foreground ,NeonNinja-red)
               (ivy-subdir :foreground ,NeonNinja-yellow)
               (ivy-remote :foreground ,NeonNinja-pink)
               (ivy-virtual :foreground ,NeonNinja-cyan)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,NeonNinja-bg :background ,NeonNinja-orange)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,NeonNinja-cyan)
               (jde-java-font-lock-modifier-face :foreground ,NeonNinja-pink)
               (jde-java-font-lock-number-face :foreground ,NeonNinja-fg)
               (jde-java-font-lock-package-face :foreground ,NeonNinja-fg)
               (jde-java-font-lock-private-face :foreground ,NeonNinja-pink)
               (jde-java-font-lock-public-face :foreground ,NeonNinja-pink)
               ;; js2-mode
               (js2-external-variable :foreground ,NeonNinja-purple)
               (js2-function-param :foreground ,NeonNinja-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,NeonNinja-yellow)
               (js2-jsdoc-html-tag-name :foreground ,dark-blue)
               (js2-jsdoc-value :foreground ,NeonNinja-yellow)
               (js2-private-function-call :foreground ,NeonNinja-cyan)
               (js2-private-member :foreground ,fg3)
               ;; js3-mode
               (js3-error-face :underline ,NeonNinja-orange)
               (js3-external-variable-face :foreground ,NeonNinja-fg)
               (js3-function-param-face :foreground ,NeonNinja-pink)
               (js3-instance-member-face :foreground ,NeonNinja-cyan)
               (js3-jsdoc-tag-face :foreground ,NeonNinja-pink)
               (js3-warning-face :underline ,NeonNinja-pink)
               ;; lsp
               (lsp-ui-peek-peek :background ,NeonNinja-bg)
               (lsp-ui-peek-list :background ,bg2)
               (lsp-ui-peek-filename :foreground ,NeonNinja-pink :weight bold)
               (lsp-ui-peek-line-number :foreground ,NeonNinja-fg)
               (lsp-ui-peek-highlight :inherit highlight :distant-foreground ,NeonNinja-bg)
               (lsp-ui-peek-header :background ,NeonNinja-current :foreground ,fg3, :weight bold)
               (lsp-ui-peek-footer :inherit lsp-ui-peek-header)
               (lsp-ui-peek-selection :inherit match)
               (lsp-ui-sideline-symbol :foreground ,fg4 :box (:line-width -1 :color ,fg4) :height 0.99)
               (lsp-ui-sideline-current-symbol :foreground ,NeonNinja-fg :weight ultra-bold
                                               :box (:line-width -1 :color ,NeonNinja-fg) :height 0.99)
               (lsp-ui-sideline-code-action :foreground ,NeonNinja-yellow)
               (lsp-ui-sideline-symbol-info :slant italic :height 0.99)
               (lsp-ui-doc-background :background ,NeonNinja-bg)
               (lsp-ui-doc-header :foreground ,NeonNinja-bg :background ,NeonNinja-cyan)
               ;; magit
               (magit-branch-local :foreground ,NeonNinja-cyan)
               (magit-branch-remote :foreground ,NeonNinja-green)
               (magit-refname :foreground ,dark-blue)
               (magit-tag :foreground ,NeonNinja-orange)
               (magit-hash :foreground ,NeonNinja-comment)
               (magit-dimmed :foreground ,NeonNinja-comment)
               (magit-section-heading :foreground ,NeonNinja-pink :weight bold)
               (magit-section-highlight :background ,NeonNinja-current :extend t)
               (magit-diff-context :foreground ,fg3 :extend t)
               (magit-diff-context-highlight :inherit magit-section-highlight
                                             :foreground ,NeonNinja-fg)
               (magit-diff-revision-summary :foreground ,NeonNinja-orange
                                            :background ,NeonNinja-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :inherit magit-section-highlight
                                                      :foreground ,NeonNinja-orange
                                                      :weight bold)
               (magit-diff-added :background ,NeonNinja-bg :foreground ,NeonNinja-green)
               (magit-diff-added-highlight :background ,NeonNinja-current
                                           :foreground ,NeonNinja-green)
               (magit-diff-removed :background ,NeonNinja-bg :foreground ,NeonNinja-red)
               (magit-diff-removed-highlight :background ,NeonNinja-current
                                             :foreground ,NeonNinja-red)
               (magit-diff-file-heading :foreground ,NeonNinja-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight
                                                  :weight bold)
               (magit-diff-file-heading-selection
                :inherit magit-diff-file-heading-highlight
                :foreground ,NeonNinja-pink)
               (magit-diff-hunk-heading :inherit magit-diff-context
                                        :background ,bg3)
               (magit-diff-hunk-heading-highlight
                :inherit magit-diff-context-highlight
                :weight bold)
               (magit-diff-hunk-heading-selection
                :inherit magit-diff-hunk-heading-highlight
                :foreground ,NeonNinja-pink)
               (magit-diff-lines-heading
                :inherit magit-diff-hunk-heading-highlight
                :foreground ,NeonNinja-pink)
               (magit-diff-lines-boundary :background ,NeonNinja-pink)
               (magit-diffstat-added :foreground ,NeonNinja-green)
               (magit-diffstat-removed :foreground ,NeonNinja-red)
               (magit-log-author :foreground ,NeonNinja-comment)
               (magit-log-date :foreground ,NeonNinja-comment)
               (magit-log-graph :foreground ,NeonNinja-yellow)
               (magit-process-ng :foreground ,NeonNinja-orange :weight bold)
               (magit-process-ok :foreground ,NeonNinja-green :weight bold)
               (magit-signature-good :foreground ,NeonNinja-green)
               (magit-signature-bad :foreground ,NeonNinja-red :weight bold)
               (magit-signature-untrusted :foreground ,NeonNinja-cyan)
               (magit-signature-expired :foreground ,NeonNinja-orange)
               (magit-signature-revoked :foreground ,NeonNinja-purple)
               (magit-signature-error :foreground ,NeonNinja-cyan)
               (magit-cherry-unmatched :foreground ,NeonNinja-cyan)
               (magit-cherry-equivalent :foreground ,NeonNinja-purple)
               ;; markdown
               (markdown-blockquote-face :foreground ,NeonNinja-yellow
                                         :slant italic)
               (markdown-code-face :foreground ,NeonNinja-orange)
               (markdown-footnote-face :foreground ,dark-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,NeonNinja-pink
                ,@(when NeonNinja-enlarge-headings
                    (list :height NeonNinja-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,NeonNinja-purple
                ,@(when NeonNinja-enlarge-headings
                    (list :height NeonNinja-height-title-2)))
               (markdown-header-face-3
                :foreground ,NeonNinja-green
                ,@(when NeonNinja-enlarge-headings
                    (list :height NeonNinja-height-title-3)))
               (markdown-header-face-4 :foreground ,NeonNinja-yellow)
               (markdown-header-face-5 :foreground ,NeonNinja-cyan)
               (markdown-header-face-6 :foreground ,NeonNinja-orange)
               (markdown-header-face-7 :foreground ,dark-blue)
               (markdown-header-face-8 :foreground ,NeonNinja-fg)
               (markdown-inline-code-face :foreground ,NeonNinja-green)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,NeonNinja-orange)
               (markdown-table-face :foreground ,NeonNinja-purple)
               (markdown-list-face :foreground ,NeonNinja-cyan)
               (markdown-language-keyword-face :foreground ,NeonNinja-comment)
               ;; message
               (message-header-to :foreground ,NeonNinja-fg :weight bold)
               (message-header-cc :foreground ,NeonNinja-fg :bold bold)
               (message-header-subject :foreground ,NeonNinja-orange)
               (message-header-newsgroups :foreground ,NeonNinja-purple)
               (message-header-other :foreground ,NeonNinja-purple)
               (message-header-name :foreground ,NeonNinja-green)
               (message-header-xheader :foreground ,NeonNinja-cyan)
               (message-separator :foreground ,NeonNinja-cyan :slant italic)
               (message-cited-text :foreground ,NeonNinja-purple)
               (message-cited-text-1 :foreground ,NeonNinja-purple)
               (message-cited-text-2 :foreground ,NeonNinja-orange)
               (message-cited-text-3 :foreground ,NeonNinja-comment)
               (message-cited-text-4 :foreground ,fg2)
               (message-mml :foreground ,NeonNinja-green :weight normal)
               ;; mini-modeline
               (mini-modeline-mode-line :inherit mode-line :height 0.1 :box nil)
               ;; mu4e
               (mu4e-unread-face :foreground ,NeonNinja-pink :weight normal)
               (mu4e-view-url-number-face :foreground ,NeonNinja-purple)
               (mu4e-highlight-face :background ,NeonNinja-bg
                                    :foreground ,NeonNinja-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,NeonNinja-current
                                           :foreground ,NeonNinja-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,NeonNinja-purple)
               (mu4e-cited-1-face :foreground ,NeonNinja-purple)
               (mu4e-cited-2-face :foreground ,NeonNinja-orange)
               (mu4e-cited-3-face :foreground ,NeonNinja-comment)
               (mu4e-cited-4-face :foreground ,fg2)
               (mu4e-cited-5-face :foreground ,fg3)
               ;; neotree
               (neo-banner-face :foreground ,NeonNinja-orange :weight bold)
               ;;(neo-button-face :underline nil)
               (neo-dir-link-face :foreground ,NeonNinja-purple)
               (neo-expand-btn-face :foreground ,NeonNinja-fg)
               (neo-file-link-face :foreground ,NeonNinja-cyan)
               (neo-header-face :background ,NeonNinja-bg
                                :foreground ,NeonNinja-fg
                                :weight bold)
               (neo-root-dir-face :foreground ,NeonNinja-purple :weight bold)
               (neo-vc-added-face :foreground ,NeonNinja-orange)
               (neo-vc-conflict-face :foreground ,NeonNinja-red)
               (neo-vc-default-face :inherit neo-file-link-face)
               (neo-vc-edited-face :foreground ,NeonNinja-orange)
               (neo-vc-ignored-face :foreground ,NeonNinja-comment)
               (neo-vc-missing-face :foreground ,NeonNinja-red)
               (neo-vc-needs-merge-face :foreground ,NeonNinja-red
                                        :weight bold)
               ;;(neo-vc-needs-update-face :underline t)
               ;;(neo-vc-removed-face :strike-through t)
               (neo-vc-unlocked-changes-face :foreground ,NeonNinja-red)
               ;;(neo-vc-unregistered-face nil)
               (neo-vc-up-to-date-face :foreground ,NeonNinja-green)
               (neo-vc-user-face :foreground ,NeonNinja-purple)
               ;; org
               (org-agenda-date :foreground ,NeonNinja-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,NeonNinja-comment)
               (org-agenda-done :foreground ,NeonNinja-green)
               (org-agenda-structure :foreground ,NeonNinja-purple)
               (org-block :foreground ,NeonNinja-orange)
               (org-code :foreground ,NeonNinja-green)
               (org-column :background ,bg3)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,NeonNinja-cyan :underline t)
               (org-document-info :foreground ,dark-blue)
               (org-document-info-keyword :foreground ,NeonNinja-comment)
               (org-document-title :weight bold :foreground ,NeonNinja-orange
                                   ,@(when NeonNinja-enlarge-headings
                                       (list :height NeonNinja-height-doc-title)))
               (org-done :foreground ,NeonNinja-green)
               (org-ellipsis :foreground ,NeonNinja-comment)
               (org-footnote :foreground ,dark-blue)
               (org-formula :foreground ,NeonNinja-pink)
               (org-headline-done :foreground ,NeonNinja-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,NeonNinja-bg :background ,NeonNinja-bg)
               (org-level-1 :inherit bold :foreground ,NeonNinja-pink
                            ,@(when NeonNinja-enlarge-headings
                                (list :height NeonNinja-height-title-1)))
               (org-level-2 :inherit bold :foreground ,NeonNinja-purple
                            ,@(when NeonNinja-enlarge-headings
                                (list :height NeonNinja-height-title-2)))
               (org-level-3 :weight normal :foreground ,NeonNinja-green
                            ,@(when NeonNinja-enlarge-headings
                                (list :height NeonNinja-height-title-3)))
               (org-level-4 :weight normal :foreground ,NeonNinja-yellow)
               (org-level-5 :weight normal :foreground ,NeonNinja-cyan)
               (org-level-6 :weight normal :foreground ,NeonNinja-orange)
               (org-level-7 :weight normal :foreground ,dark-blue)
               (org-level-8 :weight normal :foreground ,NeonNinja-fg)
               (org-link :foreground ,NeonNinja-cyan :underline t)
               (org-priority :foreground ,NeonNinja-cyan)
               (org-quote :foreground ,NeonNinja-yellow :slant italic)
               (org-scheduled :foreground ,NeonNinja-green)
               (org-scheduled-previously :foreground ,NeonNinja-yellow)
               (org-scheduled-today :foreground ,NeonNinja-green)
               (org-sexp-date :foreground ,fg4)
               (org-special-keyword :foreground ,NeonNinja-yellow)
               (org-table :foreground ,NeonNinja-purple)
               (org-tag :foreground ,NeonNinja-pink :weight bold :background ,bg2)
               (org-todo :foreground ,NeonNinja-orange :weight bold :background ,bg2)
               (org-upcoming-deadline :foreground ,NeonNinja-yellow)
               (org-verbatim :inherit org-quote)
               (org-warning :weight bold :foreground ,NeonNinja-pink)
               ;; outline
               (outline-1 :foreground ,NeonNinja-pink)
               (outline-2 :foreground ,NeonNinja-purple)
               (outline-3 :foreground ,NeonNinja-green)
               (outline-4 :foreground ,NeonNinja-yellow)
               (outline-5 :foreground ,NeonNinja-cyan)
               (outline-6 :foreground ,NeonNinja-orange)
               ;; perspective
               (persp-selected-face :weight bold :foreground ,NeonNinja-pink)
               ;; powerline
               (powerline-active1 :background ,NeonNinja-bg :foreground ,NeonNinja-pink)
               (powerline-active2 :background ,NeonNinja-bg :foreground ,NeonNinja-pink)
               (powerline-inactive1 :background ,bg2 :foreground ,NeonNinja-purple)
               (powerline-inactive2 :background ,bg2 :foreground ,NeonNinja-purple)
               (powerline-evil-base-face :foreground ,bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,NeonNinja-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,NeonNinja-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,NeonNinja-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,NeonNinja-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,NeonNinja-pink)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,NeonNinja-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,NeonNinja-orange)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,NeonNinja-fg)
               (rainbow-delimiters-depth-2-face :foreground ,NeonNinja-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,NeonNinja-purple)
               (rainbow-delimiters-depth-4-face :foreground ,NeonNinja-pink)
               (rainbow-delimiters-depth-5-face :foreground ,NeonNinja-orange)
               (rainbow-delimiters-depth-6-face :foreground ,NeonNinja-green)
               (rainbow-delimiters-depth-7-face :foreground ,NeonNinja-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,dark-blue)
               (rainbow-delimiters-unmatched-face :foreground ,NeonNinja-orange)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,NeonNinja-green)
               (rpm-spec-doc-face :foreground ,NeonNinja-pink)
               (rpm-spec-ghost-face :foreground ,NeonNinja-purple)
               (rpm-spec-macro-face :foreground ,NeonNinja-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,NeonNinja-purple)
               (rpm-spec-section-face :foreground ,NeonNinja-yellow)
               (rpm-spec-tag-face :foreground ,NeonNinja-cyan)
               (rpm-spec-var-face :foreground ,NeonNinja-orange)
               ;; rst (reStructuredText)
               (rst-level-1 :foreground ,NeonNinja-pink :weight bold)
               (rst-level-2 :foreground ,NeonNinja-purple :weight bold)
               (rst-level-3 :foreground ,NeonNinja-green)
               (rst-level-4 :foreground ,NeonNinja-yellow)
               (rst-level-5 :foreground ,NeonNinja-cyan)
               (rst-level-6 :foreground ,NeonNinja-orange)
               (rst-level-7 :foreground ,dark-blue)
               (rst-level-8 :foreground ,NeonNinja-fg)
               ;; selectrum-mode
               (selectrum-current-candidate :weight bold)
               (selectrum-primary-highlight :foreground ,NeonNinja-pink)
               (selectrum-secondary-highlight :foreground ,NeonNinja-green)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,NeonNinja-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,NeonNinja-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; shr
               (shr-h1 :foreground ,NeonNinja-pink :weight bold :height 1.3)
               (shr-h2 :foreground ,NeonNinja-purple :weight bold)
               (shr-h3 :foreground ,NeonNinja-green :slant italic)
               (shr-h4 :foreground ,NeonNinja-yellow)
               (shr-h5 :foreground ,NeonNinja-cyan)
               (shr-h6 :foreground ,NeonNinja-orange)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,NeonNinja-purple)
               ;; solaire-mode
               (solaire-default-face :background ,bg2)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,NeonNinja-orange
                     :strike-through t :slant oblique)
               ;; speedbar (and sr-speedbar)
               (speedbar-button-face :foreground ,NeonNinja-green)
               (speedbar-file-face :foreground ,NeonNinja-cyan)
               (speedbar-directory-face :foreground ,NeonNinja-purple)
               (speedbar-tag-face :foreground ,NeonNinja-yellow)
               (speedbar-selected-face :foreground ,NeonNinja-pink)
               (speedbar-highlight-face :inherit match)
               (speedbar-separator-face :background ,NeonNinja-bg
                                        :foreground ,NeonNinja-fg
                                        :weight bold)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :inherit variable-pitch
                        :foreground ,NeonNinja-purple
                        :background ,NeonNinja-current)
               (tab-bar-tab :foreground ,NeonNinja-pink :background ,NeonNinja-bg
                            :box (:line-width 2 :color ,NeonNinja-bg :style nil))
               (tab-bar-tab-inactive :foreground ,NeonNinja-purple :background ,bg2
                                     :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line :inherit variable-pitch
                         :foreground ,NeonNinja-purple
                         :background ,NeonNinja-current
                         :height 0.92)
               (tab-line-close-highlight :foreground ,NeonNinja-red)
               (tab-line-highlight :weight bold)
               (tab-line-tab :foreground ,NeonNinja-purple :background ,bg2
                             :box (:line-width 4 :color ,bg2 :style nil))
               (tab-line-tab-current :foreground ,NeonNinja-pink :background ,NeonNinja-bg
                                     :box (:line-width 4 :color ,NeonNinja-bg :style nil)
                                     :weight bold)
               (tab-line-tab-group :background ,NeonNinja-comment)
               (tab-line-tab-inactive :inherit tab-line-tab)
               (tab-line-tab-inactive-alternate :background ,bg3)
               (tab-line-tab-modified :slant italic)
               (tab-line-tab-special :foreground ,NeonNinja-green)
               ;; telephone-line
               (telephone-line-accent-active :background ,NeonNinja-bg :foreground ,NeonNinja-pink)
               (telephone-line-accent-inactive :background ,bg2 :foreground ,NeonNinja-purple)
               (telephone-line-unimportant :background ,NeonNinja-bg :foreground ,NeonNinja-comment)
               ;; term
               (term :foreground ,NeonNinja-fg :background ,NeonNinja-bg)
               (term-color-black :foreground ,NeonNinja-bg :background ,NeonNinja-comment)
               (term-color-blue :foreground ,NeonNinja-purple :background ,NeonNinja-purple)
               (term-color-cyan :foreground ,NeonNinja-cyan :background ,NeonNinja-cyan)
               (term-color-green :foreground ,NeonNinja-green :background ,NeonNinja-green)
               (term-color-magenta :foreground ,NeonNinja-pink :background ,NeonNinja-pink)
               (term-color-red :foreground ,NeonNinja-red :background ,NeonNinja-red)
               (term-color-white :foreground ,NeonNinja-fg :background ,NeonNinja-fg)
               (term-color-yellow :foreground ,NeonNinja-yellow :background ,NeonNinja-yellow)
               ;; TeX (auctex)
               (TeX-error-description-error :inherit error)
               (TeX-error-description-tex-said :foreground ,NeonNinja-cyan)
               (TeX-error-description-warning :inherit warning)
               ;; tree-sitter
               (tree-sitter-hl-face:attribute :inherit font-lock-constant-face)
               (tree-sitter-hl-face:comment :inherit font-lock-comment-face)
               (tree-sitter-hl-face:constant :inherit font-lock-constant-face)
               (tree-sitter-hl-face:constant.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:constructor :inherit font-lock-constant-face)
               (tree-sitter-hl-face:escape :foreground ,NeonNinja-pink)
               (tree-sitter-hl-face:function :inherit font-lock-function-name-face)
               (tree-sitter-hl-face:function.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:function.call :inherit font-lock-function-name-face
                                                  :weight normal)
               (tree-sitter-hl-face:function.macro :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:function.special :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:punctuation :foreground ,NeonNinja-pink)
               (tree-sitter-hl-face:punctuation.bracket :foreground ,NeonNinja-fg)
               (tree-sitter-hl-face:punctuation.delimiter :foreground ,NeonNinja-fg)
               (tree-sitter-hl-face:punctuation.special :foreground ,NeonNinja-pink)
               (tree-sitter-hl-face:string :inherit font-lock-string-face)
               (tree-sitter-hl-face:string.special :foreground ,NeonNinja-red)
               (tree-sitter-hl-face:tag :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:type :inherit font-lock-type-face)
               (tree-sitter-hl-face:type.parameter :foreground ,NeonNinja-pink)
               (tree-sitter-hl-face:variable :inherit font-lock-variable-name-face)
               (tree-sitter-hl-face:variable.parameter :inherit tree-sitter-hl-face:variable
                                                       :weight normal)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,NeonNinja-orange)
               (undo-tree-visualizer-default-face :foreground ,fg2)
               (undo-tree-visualizer-register-face :foreground ,NeonNinja-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,NeonNinja-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit font-lock-builtin-face)
               (web-mode-comment-face :inherit font-lock-comment-face)
               (web-mode-constant-face :inherit font-lock-constant-face)
               (web-mode-css-property-name-face :inherit font-lock-constant-face)
               (web-mode-doctype-face :inherit font-lock-comment-face)
               (web-mode-function-name-face :inherit font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,NeonNinja-purple)
               (web-mode-html-attr-value-face :foreground ,NeonNinja-green)
               (web-mode-html-tag-face :foreground ,NeonNinja-pink :weight bold)
               (web-mode-keyword-face :foreground ,NeonNinja-pink)
               (web-mode-string-face :foreground ,NeonNinja-yellow)
               (web-mode-type-face :inherit font-lock-type-face)
               (web-mode-warning-face :inherit font-lock-warning-face)
               ;; which-func
               (which-func :inherit font-lock-function-name-face)
               ;; which-key
               (which-key-key-face :inherit font-lock-builtin-face)
               (which-key-command-description-face :inherit default)
               (which-key-separator-face :inherit font-lock-comment-delimiter-face)
               (which-key-local-map-description-face :foreground ,NeonNinja-green)
               ;; whitespace
               (whitespace-big-indent :background ,NeonNinja-red :foreground ,NeonNinja-red)
               (whitespace-empty :background ,NeonNinja-orange :foreground ,NeonNinja-red)
               (whitespace-hspace :background ,NeonNinja-current :foreground ,NeonNinja-comment)
               (whitespace-indentation :background ,NeonNinja-orange :foreground ,NeonNinja-red)
               (whitespace-line :background ,NeonNinja-bg :foreground ,NeonNinja-pink)
               (whitespace-newline :foreground ,NeonNinja-comment)
               (whitespace-space :background ,NeonNinja-bg :foreground ,NeonNinja-comment)
               (whitespace-space-after-tab :background ,NeonNinja-orange :foreground ,NeonNinja-red)
               (whitespace-space-before-tab :background ,NeonNinja-orange :foreground ,NeonNinja-red)
               (whitespace-tab :background ,bg2 :foreground ,NeonNinja-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit font-lock-builtin-face)
               (yard-directive-face :inherit font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'NeonNinja
         (let ((expand-with-func
                (lambda (func spec)
                  (let (reduced-color-list)
                    (dolist (col colors reduced-color-list)
                      (push (list (car col) (funcall func col))
                            reduced-color-list))
                    (eval `(let ,reduced-color-list
                             (backquote ,spec))))))
               whole-theme)
           (pcase-dolist (`(,face . ,spec) faces)
             (push `(,face
                     ((((min-colors 16777216)) ; fully graphical envs
                       ,(funcall expand-with-func 'cadr spec))
                      (((min-colors 256))      ; terminal withs 256 colors
                       ,(if NeonNinja-use-24-bit-colors-on-256-colors-terms
                            (funcall expand-with-func 'cadr spec)
                          (funcall expand-with-func 'caddr spec)))
                      (t                       ; should be only tty-like envs
                       ,(funcall expand-with-func 'cadddr spec))))
                   whole-theme))
           whole-theme)))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'NeonNinja)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; NeonNinja-theme.el ends here
