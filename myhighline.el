(or (facep 'my-hl-line-face) (make-face 'my-hl-line-face))
(setq hl-line-face 'my-hl-line-face)
(face-spec-set 'my-hl-line-face '((t (
:background "DodgerBlue3"
;;:bold
;;:weight nil
:inverse-video nil
))))
(defun wcy-color-theme-adjust-hl-mode-face()
"interactive"
(let* ((color (x-color-values (face-attribute 'default :background))))
(if (null color)
(error "not support.")
(let ((my-color (mapcar
(lambda (x)
(let ((y (/ #XFFFF 4))
(delta #X18FF))
(cond
((< x (* y 1))
(+ x delta))
((< x (* y 2))
(+ x delta))
((< x (* y 3))
(- x delta))
(t
(- x delta)))))
color)))
(message "%S %S" color my-color)
(set-face-attribute
'my-hl-line-face nil
:background
(concat "#"
(mapconcat
(lambda (c) (format "%04X" c))
my-color
"")))))))
(wcy-color-theme-adjust-hl-mode-face)

