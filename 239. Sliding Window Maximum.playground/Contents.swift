import UIKit

var str = "Hello, playground"


/*
 
 Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Return the max sliding window.

 Example:

 Input: nums = [1,3,-1,-3,5,3,6,7], and k = 3
 Output: [3,3,5,5,6,7]
 Explanation:

 Window position                Max
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 Note:
 You may assume k is always valid, 1 ≤ k ≤ input array's size for non-empty array.

 Follow up:
 Could you solve it in linear time?
 */


//https://leetcode.com/problems/sliding-window-maximum/discuss/337604/Swift-Solution-Use-simplified-queue-O(N)-Time-Complexity
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        
        guard nums.count != 0 , k > 0 else { return [] }
        if k==1 { return nums }
        
        var result:[Int] = []
        var arr:[Int] = []
        
        for i in 0..<nums.count {
            let startIndex = i - k + 1
            
            // check if out of range of slider window, if so , remove the index
            if arr.count != 0 && startIndex > arr.first! {
                arr.removeFirst()
            }
            
            // remove lastest added indices, which has smaller value than current value
            while arr.count != 0 && nums[i] >= nums[arr.last!]{
                arr.removeLast()
            }
            
            arr.append(i)
            
            if startIndex >= 0 {
                let curMax = nums[arr.first!]
                result.append(curMax)
            }
            
        }
        
        return result
    }
}
