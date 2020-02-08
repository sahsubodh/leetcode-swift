import UIKit

var str = "Hello, playground"

/*
 Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.

 Example 1:

 Input: [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:

 Input: [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
 */

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        
        guard nums.count > 0 else {
            return -1
        }
        
        if nums.count == 1{
            return nums[0]
        }
        
        var currentmax = nums[0]
        var finalmax = nums[0]
        var currentmin = nums[0]
        
        for i in 1..<nums.count{
            let temp = currentmax
            
            currentmax = max(max(currentmax*nums[i],currentmin*nums[i]),nums[i])
            currentmin = min(min(temp*nums[i],currentmin*nums[i]),nums[i])
            
            if currentmax > finalmax {
                finalmax = currentmax
            }
        }
        return finalmax
    }
}
