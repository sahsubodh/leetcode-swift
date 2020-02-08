import UIKit

var str = "Hello, playground"


/*
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

Your algorithm's runtime complexity must be in the order of O(log n).

If the target is not found in the array, return [-1, -1].

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // find target
        var l = 0
        var r = nums.count - 1
        var _k: Int?
        while l <= r {
            let m = l + (r - l) / 2
            if nums[m] < target {
                l = m + 1
            } else if nums[m] > target {
                r = m - 1
            } else {
                _k = m
                break
            }
        }
        
        guard let k = _k else { return [-1, -1] }
        
        // find start
        l = 0
        r = k
        while l < r {
            let m = l + (r - l) / 2
            if nums[m] == target {
                r = m
            } else {
                l = m + 1
            }
        }
        let start = l
        
        // find end
        l = k
        r = nums.count - 1
        while r > l {
            let m = l + (r - l + 1) / 2
            if nums[m] == target {
                l = m
            } else {
                r = m - 1
            }
        }
        let end = r
        
        return [start, end]
    }
}

var sol = Solution()
sol.searchRange([5,7,7,8,8,10], 8)
