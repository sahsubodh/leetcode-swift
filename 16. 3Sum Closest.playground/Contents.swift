import UIKit

var str = "Hello, playground"


/*Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

Example:

Given array nums = [-1, 2, 1, -4], and target = 1.

The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).*/


class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        var result = nums[0] + nums[1] + nums[nums.count-1]
        var nums = nums
        
        nums = nums.sorted()
        
        var start = 0
        var end = 0
        
        for i in 0..<(nums.count-2){
            var start = i + 1
            var end = nums.count - 1
            
            while (start<end){
                var sum = nums[i] + nums[start] + nums[end]
                if sum > target {
                    end -= 1
                } else {
                    start += 1
                }
                
                if abs(sum-target) < abs(result-target) {
                    result = sum
                }
            }
        }
        
        return result
    }
}


