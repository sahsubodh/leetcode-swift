import UIKit

var str = "Hello, playground"

/*Given an array of integers nums, sort the array in ascending order.

 

Example 1:

Input: nums = [5,2,3,1]
Output: [1,2,3,5]
Example 2:

Input: nums = [5,1,1,2,0,0]
Output: [0,0,1,1,2,5]*/

class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }
        
        let pivot = nums.count/2;
        
        let left_array = Array(nums[0..<pivot])
        let right_array = Array(nums[pivot...])
        
        let left_merge = sortArray(left_array)
        let right_merge = sortArray(right_array)
        
        return merge(left: left_merge, right: right_merge)
        
    }
    
    func merge(left: [Int],right: [Int]) -> [Int] {
        var left_index = 0
        var right_index = 0
        
        var result:[Int] = []
        
        while (left_index < left.count && right_index < right.count){
            if (left[left_index] < right[right_index]){
                result.append(left[left_index])
                left_index += 1
            } else {
                result.append(right[right_index])
                right_index += 1
            }
        }
        
        if left_index < left.count {
          result.append(contentsOf: left[left_index...])
        }
        if right_index < right.count {
          result.append(contentsOf: right[right_index...])
        }
        
        return result
    }
}


var sol = Solution()
sol.sortArray([5,2,3,1])
