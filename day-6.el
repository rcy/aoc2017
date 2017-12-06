;;; day-6.el ---                                     -*- lexical-binding: t; -*-

;;; part 1
(let ((input [0 5 10 0 11 14 13 4 11 8 8 7 1 4 12 11])
      (maxi (lambda (v)
              (let ((mv 0) (i 0) (mi 0))
                (dotimes (i (length v) mi)
                  (when (> (elt v i) mv)
                    (setq mi i
                          mv (elt v i)))))))
      (seen '())
      (count 0))
  (while (not (seq-contains seen input))
    (setq count (1+ count))
    (push (seq-copy input) seen)
    (let* ((mi (funcall maxi input))
           (mv (elt input mi)))
      (aset input mi 0)
      (dotimes (i mv)
        (let ((i (% (+ 1 i mi) (length input))))
          (aset input i (1+ (elt input i)))))
      input))
  count)

;;; part 2
(let ((input [0 5 10 0 11 14 13 4 11 8 8 7 1 4 12 11])
      (maxi (lambda (v)
              (let ((mv 0) (i 0) (mi 0))
                (dotimes (i (length v) mi)
                  (when (> (elt v i) mv)
                    (setq mi i
                          mv (elt v i)))))))
      (seen '())
      (count 0))
  (while (not (seq-contains seen input))
    (setq count (1+ count))
    (push (seq-copy input) seen)
    (let* ((mi (funcall maxi input))
           (mv (elt input mi)))
      (aset input mi 0)
      (dotimes (i mv)
        (let ((i (% (+ 1 i mi) (length input))))
          (aset input i (1+ (elt input i)))))
      input))
  (- count (seq-position (reverse seen) input)))