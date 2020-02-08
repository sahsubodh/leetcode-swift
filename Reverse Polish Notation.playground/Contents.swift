import UIKit

var str = "Hello, playground"


class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        
        var stack:[Int] = []
        
        for s in tokens{
            if (s == "+"){
                let sum = stack.removeLast() + stack.removeLast()
                stack.append(sum)
            } else if (s == "-"){
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a - b)
            } else if (s == "*"){
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a * b)
            } else if (s == "/"){
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a / b)
            } else {
                stack.append(Int(s)!)
            }
        }
        
        return stack.removeLast()
    }
}
