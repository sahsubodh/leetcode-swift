import UIKit

var str = "Hello, playground"

/*
 Given an unsorted array of integers, find the length of longest increasing subsequence.

 Example:

 Input: [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 Note:

 There may be more than one LIS combination, it is only necessary for you to return the length.
 Your algorithm should run in O(n2) complexity.
 Follow up: Could you improve it to O(n log n) time complexity?
 */


/*
tails is an array storing the smallest tail of all increasing subsequences with length i+1 in tails[i].
For example, say we have nums = [4,5,6,3], then all the available increasing subsequences are:

len = 1   :      [4], [5], [6], [3]   => tails[0] = 3
len = 2   :      [4, 5], [5, 6]       => tails[1] = 5
len = 3   :      [4, 5, 6]            => tails[2] = 6
We can easily prove that tails is a increasing array. Therefore it is possible to do a binary search in tails array to find the one needs update.

Each time we only do one of the two:

(1) if x is larger than all tails, append it, increase the size by 1
(2) if tails[i-1] < x <= tails[i], update tails[i]
Doing so will maintain the tails invariant. The the final answer is just the size.
*/


class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        
        var tails:[Int] = Array.init(repeating:0,count:nums.count)
        var size = 0
        
        for num in nums {
            var start = 0 , end = size
            while (start != end) {
                var m = (start + end) / 2
                if (tails[m] < num) {
                    start = m + 1
                } else {
                    end = m
                }
            }
            tails[start] = num
            if start == size {
                size += 1
            }
        }
        
        return size
    }
}
