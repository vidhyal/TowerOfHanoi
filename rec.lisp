;Copyright (c) 2016 Vidhya

(defun stack-peek (stack)
	(car stack))


(defun make-stack(num)
	(setq lst ())
  
    (loop for i from num downto 1      do
        (setq lst (cons i lst))
    )
	(return-from make-stack lst)    
)




(defun move1(num src dest)
      (format t "~% disk ~S from ~S to ~S" num src dest)
)




(defun move (num stackA stackB nA nB count)
	(setq x (stack-peek stackA))
	(if (/= x num)
		(princ "wrong disk in stack\n" )
		(progn
			(format t "~%~d.  moving disk ~d from ~s to ~s ~%" count num nA nB)
			(push (pop stackA) stackB)
		)
	)
	(return-from move (list stackA stackB))

)



(defun printF (stack num)
    (if (null stack)(format t "stack~d :__~%" num  )
	(format t "stack~d :~d~%" num (reverse stack) ))
)



(defun stack-print (src dest aux srcStr destStr auxStr)
	(setq lst1 (list (cons srcStr (list src)) (cons destStr (list dest)) (cons auxStr (list aux))))
	(setq x (second (assoc "stack 1" lst1 :test #'string=)))
	(printF x 1)
	(setq x (second (assoc "stack 2" lst1 :test #'string=)))
	(printF x 2)
	(setq x (second (assoc "stack 3" lst1 :test #'string=)))
	(printF x 3)
)


(defun hanoi(num src dest aux srcStr destStr auxStr count)
  
(if (< num 2)
	(progn
	(setq lst (move num src dest srcStr destStr count) )
	(setq src (first lst))
	(setq dest (second lst))
    (stack-print src dest aux srcStr destStr auxStr )
	(setq count (+ count 1))
	(return-from hanoi (list (first lst) (second lst) aux count))
	)

    (progn (setq num2 (- num 1))
	    (setq lst (hanoi (- num 1) src aux dest srcStr auxStr destStr count))
		(setq src (first lst))
		(setq aux (second lst))
		(setq dest (third lst))
        (setq count (fourth lst))
     	
		(setq lst (move num src dest srcStr destStr count))
        (setq count (+ count 1))
	    (setq src (first lst))
 		(setq dest (second lst))
        (stack-print src dest aux srcStr destStr auxStr )

    	(setq lst (hanoi (- num 1) aux dest src auxStr destStr srcStr count))
		(setq aux (first lst))
		(setq dest (second lst))
		(setq src (third lst))
        (setq count (fourth lst))
		(return-from hanoi (list src dest aux count))
 	) 	
)
 
)
(defun hanoi-rec(num stack1 stack2 stack3)
	(setq srcStr "stack 1")
	(setq auxStr "stack 3")
	(setq destStr "stack 2")
	(format t  "~%Initial:~%")
	(stack-print stack1 stack2 stack3 srcStr destStr auxStr )
	(setq stackList (hanoi num stack1 stack2 stack3 srcStr destStr auxStr 1 ))
	(setq stack1 (first stackList))
	(setq stack2 (second stackList))
	(setq stack3 (third stackList))


	(format t  "~%Final:~%")
	(stack-print stack1 stack2 stack3 srcStr destStr auxStr )

)

(defun main()
	(print "Enter the number of disks")
	(setq num (read))
	(setq stack1 (make-stack num))
	(setq stack2 ())
	(setq stack3 ())
	(hanoi-rec num stack1 stack2 stack3)
)

(main)
