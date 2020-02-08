import UIKit

var str = "Hello, playground"

/*
 Implement pow(x, n), which calculates x raised to the power n (xn).

 Example 1:

 Input: 2.00000, 10
 Output: 1024.00000
 Example 2:

 Input: 2.10000, 3
 Output: 9.26100
 Example 3:

 Input: 2.00000, -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 Note:

 -100.0 < x < 100.0
 n is a 32-bit signed integer, within the range [−231, 231 − 1]
 */

class Solution {
    
    func myPow(_ x: Double, _ n: Int) -> Double {
         var count = n
         var x = x
         if (n<0){
             x = 1/x;
             count = -count;
         }
        
        var ans = 1.0
        var current_product = x
        for i in stride(from: n, to: 1, by: n/2){
            if i % 2 == 1 {
                ans *= current_product
            }
            current_product *= current_product
        }
         
       return ans
     }
        
    func myPow1(_ x: Double, _ n: Int) -> Double {
        var count = n
        var x = x
        if (n<0){
            x = 1/x;
            count = -count;
        }
        
      return firstPow(x, count)
    }
    
    func firstPow(_ x: Double, _ n: Int) -> Double {
        
        if n == 0 {
            return 1.0
        }
        
        let half = firstPow(x, n/2)
        
        if (n%2 == 1){
            return half * half * x;
        } else {
            return half * half;
        }
    }
}
