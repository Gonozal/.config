;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------
(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   ;; dotspacemacs-configuration-layer-path '("~/.spacemacs-contrib/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(;; languages
                                       (haskell :variables
                                                haskell-enable-ghci-ng-support t
                                                haskell-enable-hindent-support t
                                                haskell-enable-shm-support nil)
                                       extra-langs
                                       ;; csharp
                                       ruby
                                       html
                                       markdown
                                       javascript
                                       scala
                                       latex
                                       ;; utility
                                       org-repo-todo
                                       restclient
                                       smex
                                       colors
                                       company-mode
                                       git
                                       ;; user config file
                                       ;; codas
                                       )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(flycheck-haskell
                                    helm-projectile
                                    hi2)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t
   ))



;; Settings
;; --------
(defun extra-langs/init-matlab-mode ()
  (use-package matlab-mode :defer t :mode "\\.m\\'"))

;; Initialization Hooks
;; --------------------

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."

  (setq-default
   ;; Specify the startup banner. If the value is an integer then the
   ;; banner with the corresponding index is used, if the value is `random'
   ;; then the banner is chosen randomly among the available banners, if
   ;; the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'random
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         solarized-light)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`
   dotspacemacs-major-mode-leader-key ","
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.7
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to nil
   ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; Enable micro-state for helm buffer when pressing on TAB."
   dotspacemacs-helm-micro-state t
   ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame when it's active or selected. Transparency can
   ;; be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame when it's inactive or deselected. Transparency
   ;; can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 100
   ;; If non nil unicode symbols are displayed in the mode line (e.g. for lighters)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
   ;; overrides the default behavior of Emacs which recenters the point when
   ;; it reaches the top or bottom of the screen
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil

   ;; --------------------
   ;; non-spacemacs config
   ;; --------------------

   ;; limit line length tl 80 instead or 70
   fill-column 80
   whitespace-line-column 80
   ;; Use rvm to manage ruby version
   ruby-version-manager 'rvm
   ;; Enable projectile-rails
   ruby-on-rails-support t
   )

  ;; Use emacs 24.4 desktop save mode
  ;; Restores buffer and frames on emacs start to the previous configuration
  (desktop-save-mode t)
  ;; Make cabal bin directory visible to emacs (used by haskell-mode etc.)
  (add-to-list 'exec-path "~/.cabal/bin/")

  (defun flycheck-haskell-setup ()
    "Blank function..."
    )
  )

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."

  ;; use same OS X key configurations
  (setq mac-command-modifier 'meta
        mac-option-modifier nil)

  (setq evil-want-fine-undo nil)

  (setq guide-key/popup-window-position 'right)

  ;; Sane cursor and window movements
  (setq scroll-preserve-screen-position 1
        smooth-scroll-margin 3
        scroll-margin 4)

  (setq dotspacemacs-additional-packages '(matlab-mode))

  ;; Load yas
  ;; (yas-reload-all)

  ;; disable helm for some commands
  (use-package helm
    :defer t
    :config
    (progn
      (add-to-list 'helm-completing-read-handlers-alist '(describe-variable . ido))
      (add-to-list 'helm-completing-read-handlers-alist '(TeX-command-master . ido))
      ))

  ;; use solarized-dark
  (disable-theme 'solarized-light)

  ;; get these buffers out of the way!
  (push '("*GHC Info*" :noselect t) popwin:special-display-config)
  (push '("*Warnings*" :noselect t) popwin:special-display-config)

  ;; haskell config
  (use-package haskell-mode
    :defer t
    :init
    (progn
      (add-hook 'haskell-mode-hook 'custom-haskell-mode-hook)
      (setq-default flycheck-disabled-checkers '(haskell-ghc))
      (defun ghc-to-info (errs)
        ;; [^\t] to include \n.
        (let ((regex "^\\([^\n]*\\):\\([0-9]+\\):\\([0-9]+\\): *\\([^\t]+\\)")
              (project-root (ghc-get-project-root))
              info infos)
          (dolist (err errs (nreverse infos))
            (when (string-match regex err)
              (let* ((file (expand-file-name (match-string 1 err) project-root)) ;; for Windows
                     (line (string-to-number (match-string 2 err)))
                     (coln (string-to-number (match-string 3 err)))
                     (msg (match-string 4 err))
                     (wrn (string-match "^Warning" msg))
                     (hole (save-match-data
                             (when (string-match "Found hole .\\(_[_[:alnum:]]*\\)." msg)
                               (match-string 1 msg))))
                     (info (ghc-make-hilit-info
                            :file file
                            :line line
                            :coln coln
                            :msg  msg
                            :err  (and (not wrn) (not hole))
                            :hole hole)))
                (progn
                  (message file)
                  (unless (member info infos)
                    (ghc-add infos info))))))))
      )
    :config
    (progn
      (evil-leader/set-key-for-mode 'haskell-mode
      "me"   'ghc-display-errors)
    )
  )

  ;; latex
  (use-package tex
    :defer t
    :init
    (progn
      (require 'reftex)
      (add-hook 'LaTeX-mode-hook 'custom-latex-mode-hook)
      (add-hook 'reftex-toc-mode-hook 'custom-reftex-mode-hook)
      )
    :config
    (progn
      (require 'texmathp)
      (evil-leader/set-key-for-mode 'latex-mode
        "mmh"  'magic-latex-buffer
        "mmp"  'latex-math-preview-expression)

      (evil-define-key 'visual LaTeX-mode-map (kbd "gw") 'LaTeX-fill-region)
      (push
       '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
         :help "Run latexmk on file")
       TeX-command-list)
      (setq
       TeX-auto-save t
       TeX-parse-self t
       reftex-toc-split-windows-horizontally t
       reftex-toc-split-windows-fraction 0.35
       font-latex-fontify-script nil
       font-latex-fontify-sectioning 'color
       reftex-plug-into-AUCTeX t
       TeX-view-program-selection '((output-pdf "PDF Viewer"))
       TeX-view-program-list '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))
       )
      (setq-default TeX-master nil
                    TeX-PDF-mode t)
      (evil-set-initial-state 'reftex-toc-mode 'normal)
      )
    )
  )

(defun custom-reftex-mode-hook ()
  )

(defun custom-latex-mode-hook ()
  (latex-math-mode)
  (turn-on-smartparens-mode)
  (turn-on-reftex)
  (setq TeX-command-default "latexmk")
  (outline-minor-mode)
  (TeX-source-correlate-mode)
  (auto-fill-mode)
  (flyspell-mode 1)
  )





(defun custom-haskell-mode-hook ()
  "Execute as haskell-mode-hook."
  (subword-mode +1)
  (custom-set-variables
   '(haskell-process-type 'cabal-repl)
   '(haskell-process-args-cabal-repl
     '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))
   '(haskell-notify-p t)
   '(haskell-process-suggest-remove-import-lines t)
   '(haskell-process-auto-import-loaded-modules t)
   '(haskell-process-use-presentation-mode t)
   '(haskell-process-reload-with-fbytecode nil)
   '(haskell-process-path-ghci "ghci-ng")
   '(haskell-process-args-ghci '("-ferror-spans"))
   '(haskell-process-args-cabal-repl
     '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))
   '(haskell-process-generate-tags nil)
   '(haskell-process-log t)
   '(haskell-interactive-mode-eval-pretty nil)
   '(haskell-interactive-mode-eval-mode 'haskell-mode)
     '(hindent-style "chris-done")
   '(shm-use-presentation-mode t)
   '(shm-auto-insert-skeletons t)
   )
  (setq haskell-complete-module-preferred
        '("Data.ByteString"
          "Data.ByteString.Lazy"
          "Data.Conduit"
          "Data.Function"
          "Data.List"
          "Data.Map"
          "Data.Maybe"
          "Data.Monoid"
          "Data.Ord"))
  )










;; Custom variables
;; ----------------

;; Do not write anything in this section. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(guide-key/popup-window-position (quote right))
 '(haskell-interactive-mode-eval-mode (quote haskell-mode))
 '(haskell-interactive-mode-eval-pretty nil)
 '(haskell-notify-p t)
 '(haskell-process-args-cabal-repl (quote ("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng")))
 '(haskell-process-args-ghci (quote ("-ferror-spans")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-generate-tags nil)
 '(haskell-process-log t)
 '(haskell-process-path-ghci "ghci-ng")
 '(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-process-use-presentation-mode t)
 '(hindent-style "chris-done")
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (evil-leader evil bind-key dash sass-mode info+ indent-guide highlight-numbers highlight-indentation gitignore-mode gitconfig-mode gitattributes-mode git-link eval-sexp-fu cmm-mode adaptive-wrap ace-link parent-mode zenburn-theme yaml-mode window-numbering web-mode volatile-highlights vi-tilde-fringe use-package tagedit smooth-scrolling smex smeargle slim-mode shm scss-mode rvm ruby-tools ruby-test-mode robe rfringe restclient rainbow-mode rainbow-identifiers rainbow-delimiters powerline paradox page-break-lines noflet neotree multi-term move-text monokai-theme markdown-toc magit-svn magit-gitflow magit-gh-pulls linum-relative leuven-theme less-css-mode json-mode js2-refactor ido-vertical-mode ido-ubiquitous hungry-delete hl-anything hindent helm-themes helm-swoop helm-mode-manager helm-make helm-flyspell helm-descbinds helm-css-scss helm-c-yasnippet helm-ag haskell-mode haml-mode guide-key-tip google-translate golden-ratio github-browse-file git-timemachine git-messenger git-gutter-fringe gist framemove flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-terminal-cursor-changer evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-jumper evil-indent-textobject evil-iedit-state evil-exchange evil-escape evil-args evil-anzu ensime enh-ruby-mode emmet-mode elisp-slime-nav company-tern company-quickhelp company-ghc company-c-headers company-auctex coffee-mode bundler buffer-move base16-theme auto-highlight-symbol auto-dictionary aggressive-indent ag ace-window ace-jump-mode)))
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values
   (quote
    ((TeX-master . t)
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(shm-auto-insert-skeletons t)
 '(shm-use-presentation-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
