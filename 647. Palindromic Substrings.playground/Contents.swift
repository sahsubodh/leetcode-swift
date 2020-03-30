import UIKit

var str = "Hello, playground"

/*
 Given a string, your task is to count how many palindromic substrings in this string.

 The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

 Example 1:

 Input: "abc"
 Output: 3
 Explanation: Three palindromic strings: "a", "b", "c".
  

 Example 2:

 Input: "aaa"
 Output: 6
 Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
  

 Note:

 The input string length won't exceed 1000.
 */


class Solution {
    func countSubstrings(_ s: String) -> Int {
        
        var n = s.count , ans = 0
        var charArray = Array(s)
        
       for center in stride(from:0,to: 2*n - 1,by:1) {
           var left = center / 2
           var right = left + center % 2
           while (left >= 0 && right < n && charArray[left] == charArray[right]) {
               left -= 1
               right += 1
               ans += 1
           }
           
       }
            
        return ans
        
    }
}
