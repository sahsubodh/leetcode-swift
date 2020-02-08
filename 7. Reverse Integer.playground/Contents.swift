import UIKit

var str = "Hello, playground"


/*
 Given a 32-bit signed integer, reverse digits of an integer.

 Example 1:

 Input: 123
 Output: 321
 Example 2:

 Input: -123
 Output: -321
 Example 3:

 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */


class Solution {
    
    func reverse(_ x: Int) -> Int {
      var number = x
      var reverseNumber: Int = 0

      while number != 0 {
          let pop = number % 10
          number = number / 10

          if reverseNumber > Int32.max / 10 || (reverseNumber == Int32.max / 10 && pop > 7) {
              return 0
          }

          if reverseNumber < Int32.min / 10 || (reverseNumber == Int32.min / 10 && pop < -8) {
              return 0
          }

          reverseNumber = reverseNumber * 10 + pop
      }

      return reverseNumber
    }
    
    
    func reverse1(_ x: Int) -> Int {
        var result = 0
        var remainder = abs(x)
        
        while (remainder != 0){
            result *= 10
            result += remainder % 10
            remainder /= 10
        }
        

        return x >= 0 ? result : -result
    }
}
