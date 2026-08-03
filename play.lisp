(defun do_something_mine (num)
  (+ num 1)
  )

(defparameter num 2)
(setf num 3)
(defparameter *num* 3)

(do_something_mine *num*)
num
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
     (print `(,(give_me div) indeed divides ,(give_me num) by ,(/ num div)))
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


(defun give-me (val)
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
                    (print (logxor num (ash (ash num -8) 8)))
                    (random-seq-helper how-many next-num (+ current 1))
                    ))
               )
             ))
    (random-seq-helper how-many seed 0)
    )
  
  )

(pre-random-seq 'rule-30 60 (setf num 69))

; 69 comes back after 43 numbers. so, its a repeating pattern

(defparameter num2 (expt 2 3))
num2
(setf num2 7)
(ash num2 6)
(ash 448 -6)

(format t "~b~%" 448)
; 69 => 0 1 0 0 0 1 0 1 
; 07 => 0 0 1 0 0 1 1 1
;       0 0 1 0 0 1 0 0 (XOR)
;       0 0 0 0 0 0 1 1

(/ 4416 7)
(* (expt 2 6) 7)
(ash 4416 -6)
(ash (ash num2 6) -6)

(logxor num2 (ash (ash num2 -2) 2))

(ash (ash num (- 512 16)) (- 16 512))

(format t "~b~%" num)

(aref *fn-array* 2)

(setf (aref *fn-array* 0) #'fib)
(setf (aref *fn-array* 1) #'fib2)

(random-seq 20 (setf num 237))




(defparameter *me* (make-person-adv 
                   :name "the introspective idiot"
                   :age 19
                   :gender 'male
                   :occupation 'jobless
                   :fav-function 'rule-30)
  )

(give_me *me*)

(person-gender *me*)

(setf (person-gender *me*) 'bi)

(defstruct person
  name
  age
  gender
  occupation
  fav-function)

(defun print-person (person)
              (format t "Name: ~s~%Age: ~d~%Gender: ~a~%Occupation: ~a~%" (person-name person) (person-age person) (person-gender person) (person-occupation person))
              )  

(print-person *me*)

(print *me*)

(defun meow ()
  (format t "  /\\___/\\~% ( 0 w 0 )~%  (_____)~~~~")
  )

(incf )

(function-information )

(describe 'make-array)

(defvar people (make-array 2 :element-type 'person :initial-element *me*))

(setf (aref people 1) (make-person
                        :name "Abhishek Nalla"
                        :age 20
                        :gender 'MALE
                        :occupation 'jobless-but-not-exactly))

(give_me people)

(describe 'dotimes)

(print people)

people

(function meow)


(meow)
  
  /\___/\
 ( 0 w 0 )
  (_____)~~

(defstruct person-adv
  name
  age
  gender
  occupation
  fav-function)

(setf (aref people 0) (make-person-adv
                        :name "Bhabisya Kumar"
                        :age 20
                        :gender 'male
                        :occupation 'jobless
                        :fav-function 'rule-30)
      )

(defun print-person-adv (person)
              (format t "Name: ~s~%Age: ~d~%Gender: ~a~%Occupation: ~a~%" (person-adv-name person) (person-adv-age person) (person-adv-gender person) (person-adv-occupation person))
              )

(print *me*)

(person-adv-fav-function *me*)

(funcall (person-adv-fav-function *me*) 69)

(print-person-adv (aref more-people 0))

(defvar more-people (make-array 2 :element-type 'person-adv :initial-element *me*))

(pre-random-seq #'rule-30 10 42)

(disassemble #'rule-30)

(describe #'load)

(load "/home/theintrospectiveidiot/experiments/check_prime.lisp")
(prime? 10)

(heap-allocated-p people)

(format t "bonjour! ~~d est for lisp et %d est for c/c++~%")

(give_me *me*)

(setf (person-adv-fav-function *me*) #'prime?)
(defparameter me-too (copy-person-adv *me*))
*me*
me-too

(defun correct? (obj)
  (cond 
    ((equal (type-of (person-adv-occupation obj)) 'symbol)
     'YUP
     )
    (t 
     'NOPE
     )
    )
  )

(correct? me-too)
(format t "~a~%" *)

(type-of *)
(type-of (person-adv-gender me-too))

(setf (person-adv-fav-function me-too) #'rule-30)

(defparameter *hello* (expt 2 3))
*hello*
(type-of *hello*)


(defstruct point-2d
  (x 0)
  (y 0)
  )

(defparameter X (make-point-2d
                  :x 10
                  :y 20
                  ))

X

(describe #'rule-30)
(describe function)

(function #'rule-30)

(format )

(princ `(This is X ,X))

(function X)

(defun print-world (world)
  (cond 
    ((equal (type-of (world-grid world)) '(SIMPLE-ARRAY T (8 8)))
     (labels ((print-world-help (row column)
                  (cond 
                    ((equal row (car (array-dimensions (world-grid world))))
                     'DONE
                     )
                    ((equal column (cadr (array-dimensions (world-grid world))))
                      (format t "~%")
                      (print-world-help (+ 1 row) 0)
                     )
                    (t
                     (format t "~d" (aref (world-grid world) row column))
                     (print-world-help row (+ column 1))   
                     )
                    )
                  )
                )
           (print-world-help 0 0) 
         )
     )
    (t 
     'cant-proceed
     )
    )
  )

(defstruct cell
  pos
  nei-pos
  life
  )

(defstruct world
  grid
  (gen 0)
  )

(defparameter stuff (make-array '(2 2) :initial-element 0))

(format t "~d" (aref stuff 0 1))

(defun give-neighbours-help (world cell)
  (let ((neighbrs (make-array 8 :element-type 'cell :initial-element cell))
        (x (car (cell-pos cell)))
        (y (cadr (cell-pos cell))))
     (setf (aref neighbrs 0) (aref (world-grid world) (- 1 x) (- 1 y)))    
     (setf (aref neighbrs 1) (aref (world-grid world) (- 0 x) (- 1 y))) 
     (setf (aref neighbrs 2) (aref (world-grid world) (+ 1 x) (- 1 y)))
     (setf (aref neighbrs 3) (aref (world-grid world) (- 1 x) (- 0 y)))
     (setf (aref neighbrs 4) (aref (world-grid world) (+ 1 x) (- 0 y)))
     (setf (aref neighbrs 5) (aref (world-grid world) (- 1 x) (+ 1 y)))
     (setf (aref neighbrs 5) (aref (world-grid world) (+ 0 x) (+ 1 y)))
     (setf (aref neighbrs 6) (aref (world-grid world) (+ 1 x) (+ 1 y)))
     ) 
  )

(defun give-neighbours (world)
  (cond 
    ((equal (type-of (world-grid world)) '(SIMPLE-ARRAY T (8 8)))
     (labels ((print-world-help (row column)
                  (cond 
                    ((equal row (car (array-dimensions (world-grid world))))
                     'DONE
                     )
                    ((equal column (cadr (array-dimensions (world-grid world))))
                      (format t "~%")
                      (print-world-help (+ 1 row) 0)
                     )
                    (t
                     (format t "~d" (aref (world-grid world) row column))
                     (print-world-help row (+ column 1))   
                     )
                    )
                  )
                )
           (print-world-help 0 0) 
         )
     )
    (t 
     'cant-proceed
     )
    )
  )

(print-world (make-world
               :grid (make-array '(8 8) :element-type 'cell)
               ))

(type-of (make-array '(512 512)))

(funcall (person-adv-fav-function *me*) 69)

(defun apply-rules (world)
  (let ((row_ 0)
        (col_ 0))
    ()
    )
  )

; IMPORTANT PIECE OF INFORMATION. DO NOT FORGET. 

; #' dereferences the function as soon as u hand it over, so eseentially its copying the function. so changing the function in the future without re-executing the variable definition would give u the output of the earlier definition of the function.

; just ' is basically saying that its a symbol. now, what that symbol means is something the system will figure out. so, if u updathe function, u need not re-execute the whole definition of that variable. 

(defun give-me-fn (op)
  (cond
   ((eq op 'edd) (lambda (num1 num2) (+ num1 num2))) 
   ((eq op 'zub) (lambda (num1 num2) (- num1 num2)))
   ((eq op 'into) (lambda (num1 num2) (* num1 num2)))
   (t 'dont-know-which-function-u-want)
   )
  )


(give-me-fn edd) (1 1)
(funcall (give-me-fn 'edd) 1 1)
(describe 'defstruct)
((lambda () 'HELLO))
(type-of *)
(return "HELLO")

(defparameter )

(give_me "HELLO")  ; use this for object inspection in your wannabe-lisp-listener!!
(type-of *me*)
(princ `(,*))

(type-of *)

; PROBLEM:
; SUPPOSE U ARE USING THE SAME SERVER, i.e. THE SAME REPL for the user stuff, and your inspection stuff. Now, if the user does 
; something like (type-of *), u somehow manually need to evaluate that last user argument. cuz u might have done the object
; inspection. MAYBE USE ANOTHER SERVER FOR YOUR STUFF? LIKE, WHEN U WANNA INSPECT, THEN TRY TO DECLARE AND DO THE INSPECTION 
; THING in another server...?
; I DONT KNOW MAN, THIS SEEMS A LIL' HARD NOW.


(type-of *)

(prin1-to-string 'HELLO)
(describe 'prin1)

(defun change-val (num)
  (setf num (ash num 1))
  )

(defun do-this-et-that ()
  (let ((a 2)
        (b 3))
    (format t "a: ~d => " a)
    (change-val a)
    (format t "~d~%b: ~d => " a b)
    (change-val b)
    (format t "~d~%" b)
    )
  )

(do-this-et-that)
(defparameter *nodes* '((living-room (you are in the living-room. a wizard is snoring loudly on the couch.))
                        (garden (you are in a beautiful garden. there is a well in front of you.))
                        (attic (you are in the attic. there is a giant welding torch in the corner.)))
  )

(assoc 'garden *nodes*)

(describe 'assoc)

(describe 'the)

(defstruct student
  name
  dept
  roll
  cgpa
  )

(defparameter s1 (make-student 
                   :name "Harshit"
                   :dept "IT"
                   :roll 87
                   :cgpa 9
                   ))

(defparameter s2 (make-student 
                   :name "Vansh"
                   :dept "IT"
                   :roll 61
                   :cgpa 9.5
                   ))

(defparameter s3 (make-student 
                   :name "Satyam"
                   :dept "IT"
                   :roll 79
                   :cgpa 10
                   ))

(defun highest (people)
  (let ((temp (student-cgpa (car people))))
   (labels ((highest-helper (peoples)
            (cond
                ((eq peoples '())
                 temp
                )
                
                ((< temp (student-cgpa (car peoples))) 
                 (setf temp (student-cgpa (car peoples)))
                 (highest-helper (cdr peoples))
                )
                
                (t (highest-helper (cdr peoples)))
            )
        ))
     (highest-helper people)
     ) 
    )
  )

(defun highest (people)
 (cadr people) 
  )

(highest (list s1 s2 s3))

(defun div (a b)
  (/ (- a (rem a b)) b)
  )


(div 5 2)
(defun binary-search (lst item)
  (let ((count-steps 0))
    (labels ((binary-search-helper (stuff low high)
               (let ((mid (+ low (div (- high low) 2)))) 
                 (cond
                   ((> low high) 
                    'item-not-there-in-list
                     ) 
                   ((equal (aref stuff mid) item)
                     (format t "found ~d in the list in ~dth index in ~d total steps" item mid count-steps)
                     )
                   ((> item (aref stuff mid))
                     (setf count-steps (+ count-steps 1))
                     (binary-search-helper stuff (+ mid 1) high)
                     )
                   (t
                    (setf count-steps (+ count-steps 1))
                    (binary-search-helper stuff low (- mid 1)))
                   )  
                 ))) 
      (binary-search-helper lst 0 (- (array-total-size lst) 1))
      )
    )
  )

(binary-search #(5 67 89 357 876 900 1000 1223 3081) 1223)

(type-of arr)
(defparameter arr #(1 2 3 4))









