(global-set-key (kbd "C-SPC") nil)

(defvar config-root "/home/dragon/emacs_plugins/emacs_config/")

;;;加载新浪微博
(add-to-list 'load-path (concat config-root "weibo_emacs"))
(require 'weibo)

;;;最大化屏幕
(defun my-fullscreen()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)
(defun my-maximized()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))

(my-maximized)
;;;(my-fullscreen)

;;; show line number
(load-file (concat config-root "line_num/line-num.el"))
(load-file (concat config-root "line_num/linum+.el"))
(require 'linum)
(global-linum-mode 1)

;;; set php mode
(load-file (concat config-root "php/php-mode.el"))
(require 'php-mode)

;;; color theme
(add-to-list 'load-path (concat config-root "color-theme"))
(load-file (concat config-root "color-theme/color-theme.el"))
(load-file (concat config-root "color-theme/color-theme-sunburst.el"))
(require 'color-theme)
(color-theme-initialize)
(color-theme-tm)


(require 'hl-line)
(global-hl-line-mode 1)

(load-file (concat config-root "myhighline.el"))

(add-to-list 'load-path (concat config-root "xcscope"))
(load-file (concat config-root "xcscope/xcscope.el"))
(require 'xcscope)
(setq cscope-do-not-update-database t)

;;hide ico-button toolbar
(tool-bar-mode 0)
(setq default-tab-width 4)

(setq current-path (getenv  "PWD"))
(setq frame-title-format (concat  " (" current-path ") " "%b" " @emacs24"))

(load-file (concat config-root "flymake_language.el"))

(setq inferior-lisp-program "/usr/local/sbcl/bin/sbcl")
(add-to-list 'load-path (concat config-root "slime-2012-11-14/"))
(require 'slime)
(slime-setup)
