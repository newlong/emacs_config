(require 'flymake)

(defun flymake-php-init()
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
		 (local (file-relative-name temp (file-name-directory buffer-file-name)))
		 (list "php" (list "-f" local "-l"))))

  (add-to-list 'flymake-err-line-patterns
			   '("\\(Parse\\|Fatal\\) error: +\\(.*?\\)
                   in \\(.*?\\) on line \\ ([0-9]+\\)$" 3 4 nil 2))

  (add-to-list 'flymake-allowed-file-name-masks
			   '("\\.php$" flymake-php-init))
)

(add-hook 'php-mode-hoop (lambda()(flymake-mode 1)))
(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)
