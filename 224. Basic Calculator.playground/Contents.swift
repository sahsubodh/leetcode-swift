import UIKit

var str = "Hello, playground"


/*
 Implement a basic calculator to evaluate a simple expression string.

 The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .

 Example 1:

 Input: "1 + 1"
 Output: 2
 Example 2:

 Input: " 2-1 + 2 "
 Output: 3
 Example 3:

 Input: "(1+(4+5+2)-3)+(6+8)"
 Output: 23
 Note:
 You may assume that the given expression is always valid.
 Do not use the eval built-in library function.
 */


class Solution {
    func calculate(_ s: String) -> Int {
        var result = 0 , sign = 1, num = 0
        var stack:[(Int,Int)] = []
        
        for char in s where char != " "{
            switch char {
            case "(":
                stack.append((result,sign))
                sign = 1
                num = 0
                result = 0
            case ")":
                result += sign * num
                let prev = stack.removeLast()
                result = prev.0 + prev.1 * result
                sign = 1
                num = 0
            case "+" ,"-":
                result += sign * num
                sign = (char == "-" ? -1 : 1)
                num = 0
            default:
                num = num * 10 + Int(String(char))!
            }
        }
        
        result += sign * num
        return result
    }
}
