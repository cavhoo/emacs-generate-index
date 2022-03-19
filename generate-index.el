;;; generate-index.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Hendrik Mueller-Roehr
;;
;; Author: Hendrik Mueller-Roehr <https://github.com/hendrik>
;; Maintainer: Hendrik Mueller-Roehr <darksolj@live.com>
;; Created: September 28, 2021
;; Modified: September 28, 2021
;; Version: 0.0.1
;; Keywords: TypeScript index.ts Automation
;; Homepage: https://github.com/cavhoo/generate-index-ts
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:
(defgroup generate-index-ts nil
  "Minor mode to generate index.ts files."
  :group 'languages
  :prefix "generate-index-ts"
  :link '(url-link :tag "Repository" "https://github.com/cavhoo/generate-index-ts"))


(defcustom generate-index-command "vscode-generate-index-standalone"
  "The generate index standalone command."
  :type 'string
  :group 'generate-index-ts)

;;;###autoload
(defun generate-index ()
  "Generate index.ts entries in current buffer if it is an index.ts file"
  (interactive)
  (print buffer-file-name)
  (print (file-name-directory buffer-file-name))
  (print (string= (file-name-nondirectory buffer-file-name) "index.ts"))
  (when buffer-file-name
    (if (string= (file-name-nondirectory buffer-file-name) "index.ts")
      (let ((try (file-name-directory buffer-file-name)))
	(print try)
	(if (string-match-p "src\/*$" try)
	    (shell-command (concatenate 'string "npx vscode-generate-index-standalone " try))
	  (revert-buffer :ignore-auto :noconfirm))
	))))

(provide 'generate-index-ts)
;;; generate-index.el ends here
