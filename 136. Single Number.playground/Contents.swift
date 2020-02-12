import UIKit

var str = "Hello, playground"

/*
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.

 Note:

 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

 Example 1:

 Input: [2,2,1]
 Output: 1
 Example 2:

 Input: [4,1,2,1,2]
 Output: 4
 */

//known that A XOR A = 0 and the XOR operator is commutative, the solution will be very straightforward.


class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for i in 0..<nums.count{
            result ^= nums[i]
        }
        return result
    }
}
