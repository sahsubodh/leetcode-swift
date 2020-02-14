import UIKit

var str = "Hello, playground"

/*
 
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

 Example 1:

 Input: num1 = "2", num2 = "3"
 Output: "6"
 Example 2:

 Input: num1 = "123", num2 = "456"
 Output: "56088"
 Note:

 The length of both num1 and num2 is < 110.
 Both num1 and num2 contain only digits 0-9.
 Both num1 and num2 do not contain any leading zero, except the number 0 itself.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 */

//https://leetcode.com/problems/multiply-strings/discuss/17605/Easiest-JAVA-Solution-with-Graph-Explanation

class Solution {
  
    
    func multiply(_ num1: String, _ num2: String) -> String {

        let l1 = num1.count
        let l2 = num2.count
        let s1 = zip(num1, 0..<l1).reversed()
        let s2 = zip(num2, 0..<l2).reversed()
        var digits = Array(repeating: 0, count: l1 + l2)

        for (c1, i) in s1 {
            for (c2, j) in s2 {
                let product = Int(String(c1))! * Int(String(c2))!
                let pos1 = i + j
                let pos2 = pos1 + 1
                let sum = product + digits[pos2]

                digits[pos1] += sum / 10;
                digits[pos2] = (sum) % 10;
            }
        }

        var result = ""
        for val in digits {
            if !(result.isEmpty && val == 0) {
                result.append(String(val))
            }
        }

        return result.isEmpty ? "0" : result
    }
}


var sol = Solution()
sol.multiply("123", "456")
