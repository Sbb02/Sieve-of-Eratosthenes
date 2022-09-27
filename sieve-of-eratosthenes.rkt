#|
Author: Sohum Berdia
Date: 09/23/22
Description: Creating the Sieve of Eratosthenes - finding a list of prime numbers less than some maximum number.
|#

;Part 1
(define make-2-n-list (lambda (end-num)                                                          ; Creates a list starting from 2 to the parameter given
                       (if (= end-num 2)
                            (list 2)
                            (cons end-num (make-2-n-list (- end-num 1))                          
                                 ))))

;Part 2
(define divisible-by? (lambda (a b)                                                              ; Takes two different variables and checks if one of them is divisible through the other
                        (if (= a b) #f
                            (= 0 (remainder a b)))))


;Part 3
(define not-divisible-by (lambda (num) (lambda (val)                                             ; The reverse of divisible by function, checks and lets you know if two number are not divisible  
                                         (if (divisible-by? val num)
                                             #f
                                             #t))))

;Part 4

(define filter-list(lambda (fnc listt)                                                           ; Checks each element of the list and implements another function on the values of list. Is also called as a Higher Order Function
                     (cond ((null? listt) '())                                                   ; Conditional Statement that checks if the list is null or has value
                           ((fnc (car listt))                                                    ; Conditional Statement that takes the first element of the list and compares it with the remaining list elements
                            (cons (car listt) (filter-list fnc (cdr listt))))
                           (else (filter-list fnc (cdr listt))))                                 ;Conditional statement that makes a new list removing the unwanted elements
                     ))

;Part 5

(define prime-sieve (lambda(n)                                                                   ; A command to call in the Helper function and output Sieve of Eratosthenes
                      (reverse (helper n (make-2-n-list n)))                                     ; Helper Function Call. reverse is used to convert the list in ascending order
                      ))

(define helper(lambda(num listt)                                                                 ; Helper Function that takes a number and a list as a parameter and runs not-divisible-by, filter-list functions to sort out all the prime numbers under the max value.
                 (if(= num 2) (filter-list (not-divisible-by 2) listt)                           ; Checks if the maximum number is 2. 
                    (helper (- num 1) (filter-list (not-divisible-by num) listt))                ; If the maximum number is not 2, the function checks the divisibility of the max number and then subtracts 1 from it and checks again till the last value i.e 2
                    ) 
                 ))
