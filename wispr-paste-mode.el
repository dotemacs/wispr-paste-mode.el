;;; wispr-paste-mode.el --- Support for Wispr Flow dictation -*- lexical-binding: t; -*-

;; Version: 0.2
;; Package-Requires: ((emacs "25.1"))
;; Author: Александар Симић <a@repl.ist>
;; URL: https://github.com/dotemacs/wispr-paste-mode.el
;; Keywords: convenience, macos, clipboard

;;; Commentary:
;; This minor mode remaps `M-v' to paste from the system clipboard,
;; working around Wispr Flow's macOS paste behavior.
;;
;; The way Wispr works, it expects every application to accept `M-v'
;; in order to enter (paste) the freshly dictated text, from the
;; clipboard.
;;
;; This mode, when toggled on, overrides the default `M-v' binding, to
;; preform `yank' instead. And when toggled off, to re-set the binding
;; to what it was originally.

;;; Code:

(defun wispr-paste-yank-from-clipboard ()
  "Insert system clipboard contents at point.
   This is intended to catch Wispr Flow's M-v paste behavior."
  (interactive)
  (when (called-interactively-p 'interactive)
    (message "M-v is remapped by wispr-paste-mode; disable it to use the original M-v binding"))
  (let ((clip (gui-selection-value)))
    (when (and clip (stringp clip))
      (insert clip)
      (kill-new clip))))

;;;###autoload
(define-minor-mode wispr-paste-mode
  "Minor mode to make `M-v` paste from system clipboard for Wispr Flow.

When enabled, `M-v` inserts clipboard contents instead of scrolling (if
the default Emacs bindings are on, or whatever else you've rebound it
to)."
  :lighter " Wispr"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "M-v") #'wispr-paste-yank-from-clipboard)
            map))

(provide 'wispr-paste-mode)
;;; wispr-paste-mode.el ends here
