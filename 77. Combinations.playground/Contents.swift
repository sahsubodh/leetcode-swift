import UIKit

var str = "Hello, playground"


/*Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

Example:

Input: n = 4, k = 2
Output:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]*/


class Solution {
    
    var output:[[Int]] = []
    var n:Int = 0
    var k:Int = 0
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        self.n = n
        self.k = k
        let list:[Int] = []
        backtrack(1, list)
        return output
    }
    
    func backtrack(_ first:Int,_ list:[Int]) {
        var list = list
        if (list.count == k){
            output.append(list)
        }
        
        for i in first..<n+1{
            list.append(i)
            backtrack(i+1, list)
            list.removeLast()
        }
    }
}
