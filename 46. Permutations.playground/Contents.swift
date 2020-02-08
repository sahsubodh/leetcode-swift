import UIKit

var str = "Hello, playground"

/*Given a collection of distinct integers, return all possible permutations.

Example:

Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]*/


class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
         guard nums.count > 1 else {
             return [nums]
         }

         var nums = nums
         var output:[[Int]] = []
         
         backtrack(0, nums.count,&nums ,&output)
         
         return output
         
         
     }
     
     func backtrack(_ first:Int,_ n:Int,_ nums: inout [Int], _ output: inout [[Int]]){
                 
         if first == n {
             output.append(nums)
         }
         
         for i in first..<n{
             nums.swapAt(first, i)
             backtrack(first+1, nums.count,&nums ,&output)
             nums.swapAt(first, i)
         }
     }
}
