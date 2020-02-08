import UIKit

var str = "Hello, playground"


/*
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 The same repeated number may be chosen from candidates unlimited number of times.

 Note:

 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
   [7],
   [2,2,3]
 ]
 Example 2:

 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
 */


class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result:[[Int]] = []
        var output:[Int] = []
        var candidates = candidates
        
        candidates.sort()
        
        backtrack(&result, &output, candidates ,target, start: 0)
        
        return result
    }
    
    func backtrack(_ result: inout [[Int]],_ output: inout [Int],_ candidates: [Int],_ remain:Int, start:Int) {
        
        if remain < 0 {
            return
        } else if remain == 0 {
            result.append(output)
        } else {
            for i in start..<candidates.count{
                output.append(candidates[i])  // not i + 1 because we can reuse same elements
                backtrack(&result, &output, candidates ,remain - candidates[i], start: i)

                output.removeLast()
            }
            
        }
        
    }
}
