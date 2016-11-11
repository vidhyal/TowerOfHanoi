; Copyright (c) 2016 Vidhya

(defun stack-peek (stack)
	(car stack))


(defun move (stackA stackB nA nB count)
	(setq a (stack-peek stackA))
	(setq b (stack-peek stackB))

    (if (null a) 
		(progn ;(print "a is nil") 
            (setq a most-positive-fixnum)))
    (if (null b)
		(progn ;(print "b is nil")
			(setq b most-positive-fixnum)))
	(if (< a b)
		(progn 
			 (format t "~%~d. moving disk ~d from stack ~d to stack ~d~%" count a nA nB)
			 (push  (pop stackA) stackB))
		(progn 
			(format t "~%~d.  moving disk ~d from stack ~d to stack ~d~%" count b nB nA)
			(push (pop stackB) stackA)))
	(return-from move (list stackA stackB))
)

(defun printF (stack num)
    (if (null stack)(format t "stack~d :__~%" num  )
	(format t "stack~d :~d~%" num (reverse stack) ))
)


(defun hanoi-iter (num stack1 stack2 stack3)
    (format t "~%Initial:~%")
	(printF stack1 1)
    (printF stack2 2)
    (printF stack3 3)  
	(write-line "")  
	
		(setq iters (- (expt 2 num) 1))
    	(loop for iter from 1 to iters
			do
                (progn
    			(if (= (mod iter 3) 1)
				   (progn 
					(setq lst (move stack1 stack2 1 2 iter))
					(setq stack1 (first lst))
					(setq stack2 (second lst))
                 	)
				)
    			(if (= (mod iter 3) 2)
				   (progn 
					(setq lst (move stack1 stack3 1 3 iter))
					(setq stack1 (first lst))
					(setq stack3 (second lst))
                	)
				)
				(if (= (mod iter 3) 0)
				   (progn 
					(setq lst (move stack3 stack2 3 2 iter))
					(setq stack3 (first lst))
					(setq stack2 (second lst))
                	)
				)
				; if even number of disks, then consider the auxiliary stack to be the destination stack
                (if (= (mod num 2) 0 )
					(progn
                    (printF stack1 1)
                    (printF stack3 2)
                    (printF stack2 3))
				    (progn
                    (printF stack1 1)
                    (printF stack2 2)
                    (printF stack3 3))
				    )
				)
		)		
	
	(format t "~%Final:~%")
	(if (= (mod num 2) 0 )
		(progn
		(printF stack1 1)
		(printF stack3 2)
		(printF stack2 3))
		(progn
		(printF stack1 1)
		(printF stack2 2)
		(printF stack3 3))
	)
	
	
)

(defun make-stack(num)
    
	(setq lst ())
    (loop for i from num downto 1 do
        (setq lst (cons i lst))
    )
	(return-from make-stack lst)    
)

(defun main()

(print "Enter the number of disks")
(setq num (read))
(setq stack1 (make-stack num))
(setq stack2 ())
(setq stack3 ())
;(printF stack1 1)
;(printF stack2 2)
;(printF stack3 3)

(hanoi-iter num stack1 stack2 stack3)
)

(main)
