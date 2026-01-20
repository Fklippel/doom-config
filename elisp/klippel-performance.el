;;; elisp/klippel-performance.el --- Fixing performance issues -*- lexical-binding: t; -*-

;;; Commentary:
;; Org-roam initialization was delaying Emacs startuo by ~8 seconds due to
;; synchronous database setup. This was fixed by deferring database initialization
;; by idle time and triggering a sync on demand when needed.

;;; Code:
(after! org-roam
  (setq org-roam-db-update-method 'idle)

  (defun klippel/org-roam-sync-on-demand ()
    (unless org-roam-db--connection
      (org-roam-db-sync)))

  (advice-add 'org-roam-node-find :before
              #'klippel/org-roam-syn))

(provide 'klippel-performance)

;;; klippel-performance.el ends here
