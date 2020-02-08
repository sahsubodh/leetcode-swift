import UIKit

var str = "Hello, playground"


/*Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

Each number in candidates may only be used once in the combination.

Note:

All numbers (including target) will be positive integers.
The solution set must not contain duplicate combinations.
Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8,
A solution set is:
[
  [1, 7],
  [1, 2, 5],
  [2, 6],
  [1, 1, 6]
]
Example 2:

Input: candidates = [2,5,2,1,2], target = 5,
A solution set is:
[
  [1,2,2],
  [5]
]
*/

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result:[[Int]] = []
        var output:[Int] = []
                
        backtrack(&result, &output, candidates.sorted() ,target, 0)
        return result
    }
    
    func backtrack(_ result: inout [[Int]],_ output: inout [Int],_ candidates:[Int],_ remain:Int,_ start:Int) {
        if remain < 0 {
            return
        } else if remain == 0 {
            result.append(output)
        } else {
            for i in start..<candidates.count{
                if i > start && candidates[i] == candidates[i-1] { continue }
                output.append(candidates[i])
                backtrack(&result, &output, candidates ,remain - candidates[i], i+1)
                output.removeLast()
            }
        }
    }
    
}
