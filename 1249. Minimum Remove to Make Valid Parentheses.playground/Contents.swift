import UIKit

var str = "Hello, playground"


/*https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
 Given a string s of '(' , ')' and lowercase English characters.

 Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

 Formally, a parentheses string is valid if and only if:

 It is the empty string, contains only lowercase characters, or
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
  

 Example 1:

 Input: s = "lee(t(c)o)de)"
 Output: "lee(t(c)o)de"
 Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
 Example 2:

 Input: s = "a)b(c)d"
 Output: "ab(c)d"
 Example 3:

 Input: s = "))(("
 Output: ""
 Explanation: An empty string is also valid.
 Example 4:

 Input: s = "(a(b(c)d)"
 Output: "a(b(c)d)"
 
 */


class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        
        var stack:[Int] = []
        var charArray = Array(s)
        
        for i in 0..<charArray.count{
            if charArray[i] == "(" {
                stack.append(i)
            } else if charArray[i] == ")"{
                if !stack.isEmpty{
                    stack.removeLast()
                } else
                {
                    charArray[i] = "*"
                }
            }
        }
        
        
        while !stack.isEmpty{
            let index = stack.removeLast()
            charArray[index] = "*"
        }
        
        
        return String(charArray).replacingOccurrences(of: "*", with: "")
    }
}
