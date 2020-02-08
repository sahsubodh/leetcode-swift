import UIKit

var str = "Hello, playground"

/*
 Given a set of distinct integers, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:

 Input: nums = [1,2,3]
 Output:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]
 */


class Solution {
    
    var n:Int = 0
    var k:Int = 0
    var output:[[Int]] = []
    
    
    func subsets(_ nums: [Int]) -> [[Int]] {
     
        n = nums.count
        
        guard n > 0 else {
            return [[]]
        }
        
        while (k<n+1){
            backtrack(0,nums,[])
            k += 1
        }
        
        return output
    }
    
    func backtrack(_ index:Int, _ nums: [Int],_ list:[Int]) {
        
        var list = list
        
        if list.count == k {
            output.append(list)
        }
        
        for i in index..<n {
            list.append(nums[i])
            backtrack(i+1,nums,list)
            list.removeLast()
        }
        
    }
}

var sol = Solution()
print(sol.subsets([1,2,3]))



