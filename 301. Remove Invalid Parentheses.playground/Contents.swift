import UIKit

var str = "Hello, playground"


/*
 Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.

 Note: The input string may contain letters other than the parentheses ( and ).

 Example 1:

 Input: "()())()"
 Output: ["()()()", "(())()"]
 Example 2:

 Input: "(a)())()"
 Output: ["(a)()()", "(a())()"]
 Example 3:

 Input: ")("
 Output: [""]
 */


class Solution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        var result:Set<String> = []
        var queue = [s] , visited:Set<String> = []
        
        while (!queue.isEmpty) {
            let curr = queue.removeFirst()
            
            //Since we just need to find "minimum" number of invalid parentheses, we do BFS for the string (use string length to represent the level here). When the level becomes smaller than length of our previous results, we can stop.
            if let first = result.first , first.count > curr.count {
                break
            }
            
            if isValid(curr) {
                result.insert(curr)
            } else {
                let toRemove = charToRemove(curr)
                for i in curr.indices where curr[i] == toRemove {
                    let next = String(curr[curr.startIndex..<i] + curr[curr.index(after: i)...])
                    //To prevent a large amount of duplicate searching, we need to skip those we have visited to prevent them from going deeper.

                    if !visited.contains(next) {
                        queue.append(next)
                        visited.insert(next)
                    }
                }
                
            }
        }
        
        
        return Array(result)
    }
    
    func isValid(_ s:String) -> Bool{
        var l = 0
        for char in s{
            if char == "(" {
                l += 1
            } else if char == ")" {
                l -= 1
            }
            
            if l < 0 {
                return false
            }
        }
        
        return l == 0
    }
    
    func charToRemove(_ s:String) -> Character {
        var l = 0, r = 0
        for char in s {
            if char == "(" {
                l += 1
            } else if char == ")" {
                r += 1
            }
        }
        
        return l > r ? "(" : ")"
    }
    
}
