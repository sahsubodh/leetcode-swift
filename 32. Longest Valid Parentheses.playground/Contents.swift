import UIKit

var str = "Hello, playground"

/*
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

 Example 1:

 Input: "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()"
 Example 2:

 Input: ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()"
 */


class Solution {
    
    func longestValidParentheses(_ s: String) -> Int {
        
        if s.count == 0  {
            return 0
        }
     
        var stack:[Int] = [-1] // //it will remain -1 for ()() , (()). Will change if extra closing ')' is encountered e.g. ) ()()

        var result = 0
        var charArray = Array(s)
        
        for i in 0..<charArray.count {
            if charArray[i] == ")" {
                if stack.count > 1 && charArray[stack.last!] == "(" {
                    stack.removeLast()
                    result = max(result, i - stack.last!)
                } else {
                    stack.append(i)
                }
                
            } else {
                stack.append(i)
            }

        }
        
        return result
    }
}


var sol = Solution()
sol.longestValidParentheses("()")

