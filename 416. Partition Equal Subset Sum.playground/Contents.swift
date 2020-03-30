import UIKit

var str = "Hello, playground"

/*
 Given a non-empty array containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

 Note:

 Each of the array element will not exceed 100.
 The array size will not exceed 200.
  

 Example 1:

 Input: [1, 5, 11, 5]

 Output: true

 Explanation: The array can be partitioned as [1, 5, 5] and [11].
  

 Example 2:

 Input: [1, 2, 3, 5]

 Output: false

 Explanation: The array cannot be partitioned into equal sum subsets.
 */


class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        
        guard nums.count > 0 else { return true }

        var sum = 0
        for num in nums {
            sum += num
        }
        
        
        if sum % 2 != 0 {
            return false
        }
        
        sum /= 2
        
        var dp:[Bool] = Array.init(repeating: false, count: sum+1)
        
        dp[0] = true
        
        for num in nums{
            for i in stride(from: sum, to: 0, by: -1) {
                if (i >= num) {
                    dp[i] = dp[i] || dp[i-num]
                }
            }
        }
        
        return dp[sum]
    }
}
