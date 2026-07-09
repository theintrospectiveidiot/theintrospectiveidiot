(defun do_something_mine (num)
  (+ num 1)
  )

(defparameter *num* 2)

(defparameter *num* 3)

(do_something_mine *num*)
*num*
(ash 11 01) ;01011 (11) => 10110 (22) (11 << 1)
(ash 11 -1) ;01011 (11) => 00101 (05) (11 >> 1)

(/ (+ 2 3) 2)
(ash (+ 2 7) -1) ; shifting one bit left is basically dividing by 2!! u dumbfuck idiot!

;change a variable
(defparameter *num* 10)
(setf *num* (ash *num* -1))
*num*

(defparameter *max* 100)
(defparameter *min* 001)

(defun iterate ()
  (ash (+ *max* *min*) -1)
  )

(iterate)

(defun lower_mine ()
  (setf *max* (- (iterate) 1))
  (iterate)
  )

(defun higher_mine ()
  (setf *min* (+ (iterate) 1))
  (iterate)
  )

(defun reset_mine ()
  (setf *max* 100)
  (setf *min* 1)
  )

(defun fn1 ()
  *min*
  (defun fn2 ()
    *max*
    )
  (ash (fn2) (- 0 *min*))
  )
(fn1)
(reset_mine)
(lower_mine)
(iterate)
(higher_mine)
*max*
*min*


(defun check-bits (x)
  (let  ((temp 99))
    (ash temp x)
    )
  )
(check-bits 2)

; f(x) = x*x
(labels ((f (x)
         (* x x)
         )
       (g (x)
         (* x (f x))
         )
       (say-hi ()
         (list 'hello)
         )
       )
  (say-hi)
  )
(* 625 25)
; 99 => 64 + 32 + 3 => 1100011 => 110001100 => 4 + 8 + 128 + 256

(defun sec_atom (lst)
  (car (cdr lst))
  )

(defparameter *list* '(A B C D))

(sec_atom *list*)

(car *list*)

(defun quine ()
  '(defun quine () '(defun quine ()))
  )

(defparameter *prog* (quine)) 

*prog*

(defun prog_twice ()
  (setf *prog* (cons *prog* (list (quine))))
  )

(prog_twice)
*prog*

(* 99 4)

(+ (+ (+ 4 8) 128) 256)

(ash 2 1)

()

(defun div (num1 num2)
  (if ())
  )

(defun odd (num)
  (if (- num (* (/ num 2) 2))  
      (flet ((f ()
               (princ "bonjour! le remainder est: ")
               (princ (- num (* (/ num 2) 2)))
               )
             (g ()
               '1
               )
             )
        (f)
        (g)
        )
      '0
      )
  )

(- 7 (* (/ 7 2) 2))
(if (oddp 7)
    'it-is-odd-dear
    'it-is-even-dear
    )

(defun len (*lst*)
  
  (if *lst* 
      (flet ((f ()
               (princ (car *lst*))
               (princ " ")
               )
             (g ()
               (+ 1 (len (cdr *lst*)))
               )
             )
        (f)
        (g)
        )
      0
      )
  )
*prog*
(len *prog*)
(prog_twice)
(len '(1 2 3))
(len '(I am moving up abnd down side to side like a roller coaster))

(defparameter *prog* (quine))

(ash (len *prog*) 2) ; (* 4) 

(+ '1 '1)

(/ (- 7 (rem 7 2)) 2)

(defun prime? (num)
 (let ((div (/ (- num (rem num 2)) 2)))
   (prime?_helper num div)
   )
  )

(defun prime?_helper (num div)
  (cond 
    
    ((equal num 1)
     'a-unique-number-1
     )
    
    ((equal 1 div)
     'yup-a-prime-number
     )
    
    ((equal 0 (rem num div))
     (print `(,(give_me div) is indeed divides ,(give_me num) by ,(/ num div)))
     'nope-not-a-prime-number
     )
    
    (t
     
     ;(print `(,(give_me div) is not a divisor of ,(give_me num)))

     (prime?_helper num (- div 1)))
      
    
    )
  )
(prime? 197253)

(print 'hello)
(print 'world)



`(,(give_me 2) is two)

(return '2)

(princ 'hello)

(defun return )

((lambda (x) (list x (list 'quote x))) '(lambda (x) (list x (list 'quote x))))



(append '(hello there and ) '(how are you?))


(defun give_me (val)
  val
  )

(defun fib (num)
  (let ((a 0)
        (b 1)
        (c 1))
     (fib_helper num 0 a b c) 
    )
  )

(defun fib_helper (total current a b c)
 (if (equal current total)
     'DONE!
     ( progn
        (format t "bonjour! a est ~d~%" a)
        (let ((temp b))
            ;(print `(temp est ,(give_me temp)))
            (setf b c)
           (setf c (+ temp c))
            ;(print `(c est ,(give_me c)))
            (setf a temp)
          )
        (fib_helper total (+ 1 current) a b c)
       )
    ) 
 )

(fib 10)

(defparameter *A* (make-array 10 :initial-element 0))

(defparameter *B* #(h e l l o))

(print *B*)


(defun fib2 (num)
  (let ((numbrs (make-array num :initial-element 0)))
    (setf (aref numbrs 1) 1)
    (fib2_helper numbrs 2 (array-total-size numbrs))
    
    numbrs
    )
  )

(defun fib2_helper (numbrs current total)
  (if (equal total current)
      'DONE!
      (progn
        (setf (aref numbrs current) (+ (aref numbrs (- current 1)) (aref numbrs (- current 2))))
        (fib2_helper numbrs (+ current 1) total)
        )
      )
  )

(fib2 10)

(print (aref *B* 1))

(d)

; cellular-automata experimentes
(defun pyramid (num)
  (let ((grid (make-array `(,(give_me num) 3) :initial-element 0)))
   (print grid)
   )
  )

; 0 0 1 0 1 0 0 0 
; 0 1 0 1 0 0 0 0 
; 0 1 1 1 1 0 0 0
; 0 0 0 1 0 1 0 0 
; 0 1 1 0 1 1 0 0
(pyramid 10)

(defun rule-30 (num)
  ;(print num)
  ;(print (ash num 1))
  ;(print (logior (ash num 1) num))
  ;(print (ash num -1))
  (logxor (ash num -1) (logior num (ash num 1)))
  )

; 0 1 0 0 0 1 0 1

(defun random-seq (how-many seed)
  (labels ((random-seq-helper (how-many num current)
             (cond 
               ((equal current how-many)
                'DONE
                )
               (t (let ((next-num (rule-30 num)))
                    (print num)
                    (random-seq-helper how-many next-num (+ current 1))
                    ))
               )
             ))
    (random-seq-helper how-many seed 0)
    )
  )

(defparameter num (expt 2 511))

(defun pre-random-seq (which-rule how-many seed)
  
  (labels ((random-seq-helper (how-many num current)
             (cond 
               ((equal current how-many)
                'DONE
                )
               (t (let ((next-num (funcall which-rule num)))
                    (print num)
                    (random-seq-helper how-many next-num (+ current 1))
                    ))
               )
             ))
    (random-seq-helper how-many seed 0)
    )
  
  )

(pre-random-seq #'rule-30 10 (setf num 69))

(defparameter *fn-array* (make-array 3 :initial-element #'rule-30)
(aref *fn-array* 2)

(setf (aref *fn-array* 0) #'fib)
(setf (aref *fn-array* 1) #'fib2)

(random-seq 20 (setf num 237))


(defstruct person
  name
  age
  gender
  occupation)

(defparameter *me* (make-person 
                   :name "the introspective idiot"
                   :age 19
                   :gender 'male
                   :occupation 'jobless)
  )

(give_me *me*)

(person-gender *me*)












