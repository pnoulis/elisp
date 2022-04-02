;; recursive my/nth
(defun my/nth (nth listname)
  "Return the Nth element of list"
  (if (= nth 0)
      (car listname)
    (my/nth (1- nth) (cdr listname))))

;; imperative my/nth
(defun my/nth-linear (nth listname)
  "Return the Nth element of a list"
  (while (> nth 0)
    (setq nth (1- nth))
    (setq listname (cdr listname)))
  (car listname))


;; recursive my/nthcdr
(defun my/nthcdr (nth listname)
  "Returns the cdr of Nth element of listname"
  (if (= nth 0)
      (cdr listname)
    (my/nthcdr (1- nth) (cdr listname))))

;; imperative my/nthcdr
(defun my/nthcdr-linear (nth listname)
  "Returns the cdr of Nth element of listname"
  (while (> nth 0)
    (setq listname (cdr listname))
    (setq nth (1- nth)))
  (cdr listname))

;; recursive my/nthcar
(defun my/nthcar (nth listname)
  "Returns the first Nth elements of listname"
  (if (= nth 0)
      (cons (car listname) '())
    (append (cons (car listname) '()) (my/nthcar (1- nth) (cdr listname)))))

;; imperative my/nthcar
(defun my/nthcar-imp (nth listname)
  "Returns the first Nth elements of listname"
  (let ((newlist '()))
    (while (>= nth 0)
      (setq newlist (append newlist (cons (car listname) '())))
      (setq listname (cdr listname))
      (setq nth (1- nth)))
    newlist))

(defun my/rmnth(nth listname)
  "Remove the Nth element of a list"
  (append (cdr (my/nthcar nth listname)) (my/nthcdr nth listname)))

(defun my/repnth (listname nth object)
  "Replace the Nth element of listname with object"
  (append (cdr (my/nthcar nth listname)) (cons object '()) (my/nthcdr nth listname)))

(setq my-list '(one two three))
