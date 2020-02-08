import UIKit

var str = "Hello, playground"

/*
 Implement a basic calculator to evaluate a simple expression string.

 The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.

 Example 1:

 Input: "3+2*2"
 Output: 7
 Example 2:

 Input: " 3/2 "
 Output: 1
 Example 3:

 Input: " 3+5 / 2 "
 Output: 5
 Note:

 You may assume that the given expression is always valid.
 Do not use the eval built-in library function.
 */


class Solution {
    func calculate(_ s: String) -> Int {
        
        var result = 0
        var sign = "+"
        
        var stack = [Int]()
        let sArray = Array(s)
        var num = 0
        
        for i in 0..<sArray.count{
            let cur = sArray[i]
            if cur.isNumber{
                num = num * 10 + Int(String(cur))! - Int("0")!
            }
            
            if !cur.isNumber && cur != " " || i == sArray.count - 1{
                if sign == "+"{
                    stack.append(num)
                } else if sign == "-"{
                    stack.append(-num)
                } else if sign == "*"{
                    stack.append(stack.removeLast()*num)
                } else if sign == "/"{
                    stack.append(stack.removeLast()/num)
                }
                
                sign = String(cur)
                num = 0
            }
            
        }
        
        while !stack.isEmpty {
            result += stack.removeLast()
        }
        
        return result
    }
}
