;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-xcode)

(custom-set-faces!
  '(default :background "#0d0d0d")
  '(solaire-default-face :background "#0a0a0a"))

(setq default-frame-alist
      '((width . 203)
        (height . 60)
        (top . 20)
        (left . 0)
        (alpha-background . 85)))
(setq initial-frame-alist default-frame-alist)
(set-frame-parameter nil 'alpha-background 85)

(defvar klippel/org-roam-templates
   '(("d" "default" plain
          "%?"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
          :unnarrowed t)

         ("f" "French" plain
          "%?"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :large_topic:\n")
          :unnarrowed t)

         ("c" "C standard library" plain
          "* Description:\n %? \n\n* Defining exemple:\n\n #+begin_src %^{Language}\n\n#+end_src"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :standard_library:\n")
          :unnarrowed t)

         ("l" "LeetCode Exercise" plain
          "* Micro-skills used:\n - %?\n\n* Language used:\n \n\n* Solution\n\n#+begin_src %^{Language}\n\n#+end_src\n\n* Reference:\n\n- \n- [[roam:LeetCode Exercise]]"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :leetCode_exercise:\n")
          :unnarrowed t)))

(setq org-roam-capture-templates klippel/org-roam-templates)

(set-popup-rule! "^\\*magit" :ignore t)

(after! projectile
  (setq projectile-project-search-path '("~/Desktop/Projects"))
  (map! :map projectile-mode-map
        "s-p"   #'projectile-command-map
        "C-c p" #'projectile-command-map))

(let ((secrets-file (expand-file-name "private.el" doom-private-dir)))
  (when (file-exists-p secrets-file)
    (load secrets-file)))

;; (use-package docker
;;   :ensure t
;;   :bind ("C-c d" . docker))

;; (add-to-list 'load-path "/Users/lauraklippel/dockerfile-mode")
;; (require 'dockerfile-mode)

;; (require 'docker-tramp-compat)

;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
