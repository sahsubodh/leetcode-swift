import UIKit

var str = "Hello, playground"


/*
 Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

 Example:

 Input: s = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: the subarray [4,3] has the minimal length under the problem constraint.
 Follow up:
 If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).

 */


class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        
        var result = Int.max
        var val_sum = 0
        var left = 0
        
        for i in 0..<nums.count{
            val_sum += nums[i]
            
            while(val_sum >= s){
                result = min(result,i+1-left)
                val_sum -= nums[left]
                left += 1
            }
            
        }
        
        return result != Int.max ? result : 0
    }
}
