;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-xcode)

(setq frame '((width . 203)
              (height . 60)
              (top . 20)
              (left . 0)))
(setq initial-frame-alist frame
      default-frame-alist frame)

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
