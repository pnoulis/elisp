;; my-coment-heading
;;
;; Featuers I would like to add in the future.
;;
;; 1.
;;    Currently the syntax of a comment is hard-coded to match C-type languages.
;;    It should consult the current major programming language mode for the syntax
;;    of a comment allowing the function to be used across languages.
;;
;; 2.
;;    It should format comments of similar nature (// --- string --- //) to conform to
;;    the 80 column size rule and have equally lengthed dashes across both sides of
;;    the title.
;;
;;    Ideas at implementing feature:
;;    - Use the prefix argument C-u
;;
;; 3.
;;   It should put spacemacs into insert mode after the comment and its newline
;;   if the function has been invoked interactively.
;;
;; 4.
;;   Should make a keybinding out of it.
;;
(defun my-comment-heading (heading)
  "Inserts a comment 80 columns wide whose content is *heading* surround by dashes

Example:

// -------------------------------  EXAMPLE  -------------------------------- //

"
  (interactive "M")
  (save-excursion
    (let* ((lnHeading (length heading))
           ;; 80 columns wide minus the 6 characters needed for the opening and
           ;; closing slashes plus 2 spaces on each side of the heading
           (lnDashes (- 80 6 4 lnHeading)))

      ;; insert opening comment slashes
      (insert "// ")

      ;; left hand side dashes
      (insert-char ?- (/ lnDashes 2))

      ;; heading
      (insert (upcase (format "  %s  " heading)))

      ;; right hand side dashes
      (insert-char ?- (/ lnDashes 2))

      ;; If the number of dashes required to be inserted to reach 80 columns
      ;; is odd, then there shall be a remainder dash, which is inserted on
      ;; on the right hand side of the heading
      (when (cl-oddp lnDashes)
        (insert-char ?- 1)
        )

      ;; insert closing comment slashes
      (insert " //")
      (newline)
      ))
  )
