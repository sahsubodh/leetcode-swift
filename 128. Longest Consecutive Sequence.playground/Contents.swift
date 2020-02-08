import UIKit

var str = "Hello, playground"


/*
 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

Your algorithm should run in O(n) complexity.

Example:

Input: [100, 4, 200, 1, 3, 2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 
 https://leetcode.com/problems/longest-consecutive-sequence/discuss/41057/Simple-O(n)-with-Explanation-Just-walk-each-streak
 */


class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        let set = Set(nums)
    
        var count = 0
        
        for val in set {
            if !set.contains(val-1){
                count = max(1,count)
                var next = val + 1
                while set.contains(next) {
                    next += 1
                    count = max(count, next - val)
                }
            }
        }
        
        return count
    }
}


var sol = Solution()
sol.longestConsecutive([0,0])

sol.longestConsecutive([-6,-1,-1,9,-8,-6,-6,4,4,-3,-8,-1])
