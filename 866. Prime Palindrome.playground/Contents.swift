import UIKit

var str = "Hello, playground"

/*
 Find the smallest prime palindrome greater than or equal to N.

 Recall that a number is prime if it's only divisors are 1 and itself, and it is greater than 1.

 For example, 2,3,5,7,11 and 13 are primes.

 Recall that a number is a palindrome if it reads the same from left to right as it does from right to left.

 For example, 12321 is a palindrome.

  

 Example 1:

 Input: 6
 Output: 7
 Example 2:

 Input: 8
 Output: 11
 Example 3:

 Input: 13
 Output: 101
  

 Note:

 1 <= N <= 10^8
 The answer is guaranteed to exist and be less than 2 * 10^8.
 */

class Solution {
    func primePalindrome(_ N: Int) -> Int {
        if 8 <= N && N <= 11 { return 11 }
        for i in 1..<100000{
            var num = String(N)
            var reversearr = Array(num).reversed()[1...]
            
            var newnum = Int(num)
            
        }
        
        return -1
    }
    
    func isPrime(_ num:Int) -> Bool {
        if (num<2 || num%2 == 0) { return  num == 2 }
        
        var i = 3
        while (i*i <= num){
            if (num % i == 0) { return false }
            i += 2
        }
        
        return true
    }
    
    
}
