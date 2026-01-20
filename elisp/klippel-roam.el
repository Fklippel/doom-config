;;; elisp/klippel-roam.el --- Org-roam implementations -*- lexical-binding: t; -*-

;;; Commentary:
;; This file defines data and helpers related to org-roam usage.

;;; Code:
(defvar klippel/org-roam-templates
   '(("d" "default" plain
          "%?"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
          :unnarrowed t)

         ("t" "Large topic" plain
          "%?"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :large_topic:\n")
          :unnarrowed t)


         ("m" "Micro-Skills" plain
          "* Description:\n %? \n\n* Defining exemple:\n\n #+begin_src %^{Language}\n\n#+end_src"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :micro_skills:\n")
          :unnarrowed t)

         ("c" "C standard library" plain
          "* Description:\n %? \n\n* Defining exemple:\n\n #+begin_src %^{Language}\n\n#+end_src"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :standard_library:\n")
          :unnarrowed t)


         ("l" "LeetCode Exercise" plain
          "* Micro-skills used:\n - %?\n\n* Language used:\n \n\n* Solution\n\n#+begin_src %^{Language}\n\n#+end_src\n\n* Reference:\n\n- \n- [[roam:LeetCode Exercise]]"
          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :leetCode_exercise:\n")
          :unnarrowed t)
         )
   "Capture templates used by org-roam."
  :type 'list
  :group 'klippel)

(provide 'klippel-roam)

;;; klippel-roam.el ends here
