import UIKit

var str = "Hello, playground"

/*
 Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:

 Input: [1,2,2]
 Output:
 [
   [2],
   [1],
   [1,2,2],
   [2,2],
   [1,2],
   []
 ]
 */


class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
     
        var result:[[Int]] = []
        var candidate:[Int] = []
        
        backtracking(&result, &candidate, nums.sorted(), 0)
        return result
    }
    
    private func backtracking(_ result: inout [[Int]], _ candidate: inout [Int], _ nums: [Int], _ start: Int) {
        
        result.append(candidate)
        
        for i in start..<nums.count{
            if i == start || nums[i] != nums[i-1] {
                candidate.append(nums[i])
                backtracking(&result, &candidate, nums, i+1)
                candidate.removeLast()
            }
            
        }
        
    }
}


var sol = Solution()
sol.subsetsWithDup([1,2,2])
