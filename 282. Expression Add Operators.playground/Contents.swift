import UIKit

var str = "Hello, playground"

/*Given a string that contains only digits 0-9 and a target value, return all possibilities to add binary operators (not unary) +, -, or * between the digits so they evaluate to the target value.

Example 1:

Input: num = "123", target = 6
Output: ["1+2+3", "1*2*3"]
Example 2:

Input: num = "232", target = 8
Output: ["2*3+2", "2+3*2"]
Example 3:

Input: num = "105", target = 5
Output: ["1*0+5","10-5"]
Example 4:

Input: num = "00", target = 0
Output: ["0+0", "0-0", "0*0"]
Example 5:

Input: num = "3456237490", target = 9191
Output: []
 */

//https://leetcode.com/problems/expression-add-operators/discuss/71895/Java-Standard-Backtrace-AC-Solutoin-short-and-clear/239225

class Solution {
    var result = [String]()
    
    func addOperators(_ num: String, _ target: Int) -> [String] {
        guard num.count != 0 else {
            return result
        }
        
        search(num, num.startIndex, "", target, 0, 0)
        return result
    }
    
    func search(_ num:String,_ start: String.Index,_ path:String,_ target:Int,_ sum:Int,_ last:Int){
        if start == num.endIndex {
            if target == sum {
                result.append(path)
            }
            return
        }
        
        var index = start
        while (index < num.endIndex){
            let x = Int(String(num[start...index]))!
            
            if start == num.startIndex {
                search(num, num.index(after: index), String(x),target, x, x)
            } else {
                search(num, num.index(after: index),path + "*" + String(x),target, sum-last + last * x, last * x)
                search(num, num.index(after: index),path + "+" + String(x),target, sum+x, x)
                search(num, num.index(after: index),path + "-" + String(x),target, sum-x, -x)
            }
            
            if x == 0 {
                break
            }
            
            index = num.index(after: index)
        }
    }
}
