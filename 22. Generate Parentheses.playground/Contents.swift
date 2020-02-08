import UIKit

var str = "Hello, playground"


/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 For example, given n = 3, a solution set is:

 [
   "((()))",
   "(()())",
   "(())()",
   "()(())",
   "()()()"
 ]
 
 https://github.com/bephrem1/backtobackswe/blob/master/Dynamic%20Programming%2C%20Recursion%2C%20%26%20Backtracking/GenerateNMatchedParenStrings/GenerateNMatchedParenStrings.java
 */

class Solution {
    
    var strings: [String] = []
    func generateParenthesis(_ n: Int) -> [String] {
        
        backtrack(n, n, "")
        return strings
    }

    func backtrack(_ open: Int, _ close: Int, _ str:String) {
        
        if open == 0 && close == 0 {
            strings.append(str)
        }
        if open > 0 {
            backtrack(open-1, close, str + "(")
        }
        if close > open {
            backtrack(open, close-1, str + ")")
        }
    }
    
    /*
    var result:String = ""
    
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            return []
        }
        
        if (n==1){
            return ["()"]
        }
        
        var output:[String] = []
        
        backtrack(numsLeft: n, numsRight: n, result: result, output: &output)
        
        return output
        
    }
    
    func backtrack(numsLeft:Int, numsRight:Int,result: String,output: inout [String]) {
        
        let numsLeft = numsLeft
        let numsRight = numsRight
        
        if numsLeft == 0 && numsRight == 0 {
            output.append(result)
        }
        
        if numsLeft > 0 {
            backtrack(numsLeft: numsLeft-1, numsRight: numsRight,
                      result: result + "(", output: &output)
        }
        
        if numsLeft < numsRight {
            backtrack(numsLeft: numsLeft, numsRight: numsRight-1,
            result: result + ")", output: &output)
        }
    }
 
 */
}
